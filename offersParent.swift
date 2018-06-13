//

//

import UIKit

class offersParent: UIViewController,UIPageViewControllerDataSource
{
    
    var pageViewController : UIPageViewController?
    var object1:offerInsurance!
    var object2:offernewtaxi!
    var arrObjects = Array<Any>()

    override func viewDidLoad() {
        super.viewDidLoad()

        object1 = self.storyboard?.instantiateViewController(withIdentifier: "offerInsurance") as! offerInsurance
        object2 = self.storyboard?.instantiateViewController(withIdentifier: "offernewtaxi") as! offernewtaxi
        
        arrObjects.append(object1)
        arrObjects.append(object2)
        
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController!.dataSource = self
        
        pageViewController!.setViewControllers([arrObjects[0]] as? [UIViewController] , direction: .forward, animated: false, completion: nil)
        pageViewController!.view.frame = CGRect(x: 0, y: 108, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 108);
        
        addChildViewController(pageViewController!)
        view.addSubview(pageViewController!.view)
        pageViewController!.didMove(toParentViewController: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
   
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 2
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return 2
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return 0
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        
//        var index = (viewController as! InstructionView).pageIndex
//
//        if (index == 0) || (index == NSNotFound) {
//            return nil
//        }
//
//        index -= 1
        
        if(viewController == object1)
        {
            return object2
        }
        return object1
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        if(viewController == object2)
        {
            return object1
        }
        return object2
//        if index == NSNotFound {
//            return nil
//        }
//
//        index += 1
//
//        if (index == self.pageTitles.count) {
//            return nil
//        }
       
    }
    
    @IBAction func btnBack(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
}
