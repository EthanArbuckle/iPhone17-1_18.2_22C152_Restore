@interface RAPReportComposerInstructionDetailViewController
- (RAPReportComposerInstructionDetailViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5;
- (id)tableParts;
- (void)cancelCorrection;
- (void)saveCorrection;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation RAPReportComposerInstructionDetailViewController

- (RAPReportComposerInstructionDetailViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v9 = a4;
  v25.receiver = self;
  v25.super_class = (Class)RAPReportComposerInstructionDetailViewController;
  v10 = [(RAPReportTableViewController *)&v25 initWithReport:a3 question:v9 completion:a5];
  v11 = v10;
  if (v10)
  {
    p_question = (id *)&v10->_question;
    objc_storeStrong((id *)&v10->_question, a4);
    uint64_t v13 = [*p_question comment];
    savedCorrectionText = v11->_savedCorrectionText;
    v11->_savedCorrectionText = (NSString *)v13;

    id v15 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:v11 action:"cancelCorrection"];
    v16 = [(RAPReportComposerInstructionDetailViewController *)v11 navigationItem];
    [v16 setLeftBarButtonItem:v15];

    id v17 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:v11 action:"saveCorrection"];
    v18 = [(RAPReportComposerInstructionDetailViewController *)v11 navigationItem];
    [v18 setRightBarButtonItem:v17];

    v19 = [(RAPReportComposerInstructionDetailViewController *)v11 navigationItem];
    v20 = [v19 rightBarButtonItem];
    [v20 setEnabled:0];

    id v21 = *p_question;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1004D6068;
    v23[3] = &unk_1012ECC90;
    v24 = v11;
    [v21 addObserver:v24 changeHandler:v23];
  }
  return v11;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)RAPReportComposerInstructionDetailViewController;
  [(RAPReportTableViewController *)&v6 viewDidLoad];
  v3 = [(RAPQuestion *)self->_question parentQuestion];
  v4 = [v3 localizedTitle];
  v5 = [(RAPReportComposerInstructionDetailViewController *)self navigationItem];
  [v5 setTitle:v4];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)RAPReportComposerInstructionDetailViewController;
  [(RAPReportComposerInstructionDetailViewController *)&v6 willTransitionToTraitCollection:a3 withTransitionCoordinator:a4];
  v5 = [(RAPReportComposerInstructionDetailViewController *)self tableView];
  [v5 reloadData];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)RAPReportComposerInstructionDetailViewController;
  -[RAPReportComposerInstructionDetailViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, "viewWillTransitionToSize:withTransitionCoordinator:", a4, a3.width, a3.height);
  v5 = [(RAPReportComposerInstructionDetailViewController *)self tableView];
  [v5 reloadData];
}

- (void)saveCorrection
{
  v3 = [(RAPReportLocationSection *)self->_locationSection imageDataOfMapAndInstructionsCell];
  [(RAPInstructionCorrectionQuestion *)self->_question setCellScreenshotImageData:v3];

  v4 = +[MKMapService sharedService];
  [v4 captureUserAction:10105 onTarget:1102 eventValue:0];

  v5 = [(RAPQuestion *)self->_question parentQuestion];
  [v5 saveCorrection:self->_question];

  id v6 = [(RAPReportComposerInstructionDetailViewController *)self navigationController];
  [v6 dismissViewControllerAnimated:1 completion:0];
}

- (void)cancelCorrection
{
  [(RAPCommentQuestion *)self->_question setComment:self->_savedCorrectionText];
  v3 = +[MKMapService sharedService];
  [v3 captureUserAction:10109 onTarget:1102 eventValue:0];

  id v4 = [(RAPReportComposerInstructionDetailViewController *)self navigationController];
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (id)tableParts
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [(RAPReportTableViewController *)self userInfoPart];
  [v3 addObject:v4];

  if (!self->_locationPart)
  {
    v5 = [[RAPReportLocationSection alloc] initWithQuestion:self->_question];
    locationSection = self->_locationSection;
    self->_locationSection = v5;

    v7 = [RAPTablePart alloc];
    v14 = self->_locationSection;
    v8 = +[NSArray arrayWithObjects:&v14 count:1];
    id v9 = [(RAPTablePart *)v7 initWithSections:v8];
    locationPart = self->_locationPart;
    self->_locationPart = v9;

    [v3 addObject:self->_locationPart];
  }
  if (!self->_commentPart)
  {
    v11 = [[RAPReportComposerCommentPart alloc] initWithCommentQuestion:self->_question];
    commentPart = self->_commentPart;
    self->_commentPart = v11;

    [v3 addObject:self->_commentPart];
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationPart, 0);
  objc_storeStrong((id *)&self->_locationSection, 0);
  objc_storeStrong((id *)&self->_commentPart, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_savedCorrectionText, 0);

  objc_storeStrong((id *)&self->_question, 0);
}

@end