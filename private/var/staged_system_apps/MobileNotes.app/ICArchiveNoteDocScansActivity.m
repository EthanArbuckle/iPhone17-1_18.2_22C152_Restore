@interface ICArchiveNoteDocScansActivity
- (ICArchiveNoteDocScansActivity)initWithNote:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5;
- (ICNote)note;
- (UIBarButtonItem)presentingBarButtonItem;
- (UIViewController)presentingViewController;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)performActivityWithCompletion:(id)a3;
- (void)setNote:(id)a3;
- (void)setPresentingBarButtonItem:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation ICArchiveNoteDocScansActivity

- (ICArchiveNoteDocScansActivity)initWithNote:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICArchiveNoteDocScansActivity;
  v12 = [(ICArchiveNoteDocScansActivity *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_note, a3);
    objc_storeWeak((id *)&v13->_presentingViewController, v10);
    objc_storeStrong((id *)&v13->_presentingBarButtonItem, a5);
  }

  return v13;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:@"doc.zipper"];
}

- (id)activityTitle
{
  return @"Archive Doc Scans";
}

- (id)activityType
{
  return @"com.apple.mobilenotes.archiveDocScans";
}

- (void)performActivityWithCompletion:(id)a3
{
  id v10 = a3;
  v4 = [(ICArchiveNoteDocScansActivity *)self presentingViewController];

  if (v4)
  {
    v5 = [(ICArchiveNoteDocScansActivity *)self note];
    v6 = [(ICArchiveNoteDocScansActivity *)self presentingViewController];
    v7 = [(ICArchiveNoteDocScansActivity *)self presentingBarButtonItem];
    +[ICDocCamArchiveExporter showExportArchiveFromNote:v5 presentingViewController:v6 presentingBarButtonItem:v7];

    [(ICArchiveNoteDocScansActivity *)self activityDidFinish:1];
    v8 = v10;
    if (!v10) {
      goto LABEL_6;
    }
  }
  else
  {
    [(ICArchiveNoteDocScansActivity *)self activityDidFinish:0];
    v8 = v10;
    if (!v10) {
      goto LABEL_6;
    }
  }
  id v9 = [(ICArchiveNoteDocScansActivity *)self activityType];
  (*((void (**)(void))v10 + 2))();

  v8 = v10;
LABEL_6:
}

- (ICNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (UIBarButtonItem)presentingBarButtonItem
{
  return self->_presentingBarButtonItem;
}

- (void)setPresentingBarButtonItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingBarButtonItem, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);

  objc_storeStrong((id *)&self->_note, 0);
}

@end