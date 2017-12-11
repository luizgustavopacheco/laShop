//=======================================
import UIKit
//=======================================
class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    //---------------------------//--------------------------- MARK: -------> IBOutlets
    @IBOutlet weak var tableView: UITableView!
    //---------------------------//--------------------------- MARK: -------> Properties
    var titles = ["CAMÉRAS", "LENTILLES", "TRÉPIEDS"]
    var numberOfElementsInSections: [Int]!
    var inventory =
    ["CAMÉRAS" :
        [
            ["CAMÉRA 1" : "Sony PMW F3 (S35 - Monture PL)", "IMAGE": "sony1.png"],
            ["CAMÉRA 2" : "Blackmagic Cinema 4k (S35 - Monture EF)", "IMAGE": "black2.png"],
            ["CAMÉRA 3" : "Sony EX1 (XDCam - 35 Md/s - 4:2:0)", "IMAGE": "sony3.png"],
            ["CAMÉRA 4" : "Sony MC2000U (Capteur 1/3 - Cartes SD)", "IMAGE": "sony4.png"],
            ["CAMÉRA 5" : "Gopro", "IMAGE": "gopro5.png"]
        ],
    "LENTILLES" :
        [
            ["LENTILLES 1" : "Kit Sony Cinealta Prime PL (20-25-85mm)", "IMAGE": "lentilles1.png"],
            ["LENTILLES 2" : "Kit Sony Cinealta Prime PL (20-35-135mm)", "IMAGE": "lentilles2.png"],
            ["LENTILLES 3" : "Canon Fixe 14mm", "IMAGE": "lentilles3.png"]
        ],
    "TRÉPIEDS" :
        [
            ["TRÉPIED 1" : "Trépied Manfrotto Tête Fluide 504", "IMAGE": "trepied1.png"],
            ["TRÉPIED 2" : "Trépied Manfrotto Tête Fluide 501", "IMAGE": "trepied2.png"],
            ["TRÉPIED 3" : "Trépied Velbon", "IMAGE": "trepied3.png"],
            ["TRÉPIED 4" : "Rig Shape Support Épaule (DFSLR)", "IMAGE": "epaule4.png"]
        ]
    ]
    //---------------------------//--------------------------- MARK: -------> viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        numberOfElementsInSections = [inventory["CAMÉRAS"]!.count, inventory["LENTILLES"]!.count, inventory["TRÉPIEDS"]!.count]
    }
    //---------------------------//--------------------------- MARK: -------> TableView Section Stuff
    func numberOfSections(in tableView: UITableView) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let title = UILabel()
        //title.font = UIFont(name: "MyriadPro-Regular", size: 20)!
        title.textColor = UIColor.white
        let header = view as! UITableViewHeaderFooterView
        header.tintColor = UIColor(red: (111/255), green: (96/255), blue: (73/255), alpha: 1.0)
        header.textLabel?.font = title.font
        header.textLabel?.textColor = title.textColor
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundColor = UIColor.clear
        return numberOfElementsInSections[section]
    }
    //---------------------------//--------------------------- MARK: -------> TableView Stuff
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:Parser1 = self.tableView.dequeueReusableCell(withIdentifier: "shop") as! Parser1
        cell.backgroundColor = UIColor.clear
        
        if let anImgView = cell.viewWithTag(101) as! UIImageView! {
            anImgView.image = UIImage(named: "sony1.png")
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    //-----------------------------------
}
//=======================================









