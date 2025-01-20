@interface ICImportArchiveController
- (ICLongRunningTaskController)taskController;
- (ICNoteContainer)noteContainer;
- (UIDocumentPickerViewController)documentPickerViewController;
- (UIViewController)viewController;
- (_TtC11MobileNotes17ICArchiveImporter)archiveImporter;
- (id)completion;
- (id)initForPresentingInViewController:(id)a3;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentPickerWasCancelled:(id)a3;
- (void)importArchiveAtURL:(id)a3 intoNoteContainer:(id)a4;
- (void)importIntoNoteContainer:(id)a3 completion:(id)a4;
- (void)setArchiveImporter:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setDocumentPickerViewController:(id)a3;
- (void)setNoteContainer:(id)a3;
- (void)setTaskController:(id)a3;
- (void)setViewController:(id)a3;
- (void)showError:(id)a3;
@end

@implementation ICImportArchiveController

- (id)initForPresentingInViewController:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICImportArchiveController;
  v6 = [(ICImportArchiveController *)&v12 init];
  if (v6)
  {
    v7 = objc_alloc_init(_TtC11MobileNotes17ICArchiveImporter);
    archiveImporter = v6->_archiveImporter;
    v6->_archiveImporter = v7;

    objc_storeStrong((id *)&v6->_viewController, a3);
    v9 = (ICLongRunningTaskController *)objc_alloc_init((Class)ICLongRunningTaskController);
    taskController = v6->_taskController;
    v6->_taskController = v9;

    [(ICLongRunningTaskController *)v6->_taskController setShouldShowCancelButton:1];
    [(ICLongRunningTaskController *)v6->_taskController setAllowSingleUnitProgress:1];
    [(ICLongRunningTaskController *)v6->_taskController setProgressStringBlock:&stru_10062ADB8];
    [(ICLongRunningTaskController *)v6->_taskController setShouldShowCircularProgress:1];
    [(ICLongRunningTaskController *)v6->_taskController setViewControllerToPresentFrom:v5];
  }

  return v6;
}

- (void)importIntoNoteContainer:(id)a3 completion:(id)a4
{
  id v6 = a4;
  [(ICImportArchiveController *)self setNoteContainer:a3];
  [(ICImportArchiveController *)self setCompletion:v6];

  id v7 = objc_alloc((Class)UIDocumentPickerViewController);
  v8 = +[ICArchive universalTypeIdentifier];
  v14 = v8;
  v9 = +[NSArray arrayWithObjects:&v14 count:1];
  id v10 = [v7 initForOpeningContentTypes:v9 asCopy:1];
  [(ICImportArchiveController *)self setDocumentPickerViewController:v10];

  v11 = [(ICImportArchiveController *)self documentPickerViewController];
  [v11 setDelegate:self];

  objc_super v12 = [(ICImportArchiveController *)self viewController];
  v13 = [(ICImportArchiveController *)self documentPickerViewController];
  [v12 presentViewController:v13 animated:1 completion:0];
}

- (void)importArchiveAtURL:(id)a3 intoNoteContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = sub_100139918;
  v16[4] = sub_100139928;
  id v17 = 0;
  v8 = [(ICImportArchiveController *)self taskController];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100139930;
  v12[3] = &unk_10062ADE0;
  v12[4] = self;
  id v9 = v6;
  id v13 = v9;
  id v10 = v7;
  id v14 = v10;
  v15 = v16;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001399D4;
  v11[3] = &unk_10062AE08;
  v11[4] = self;
  v11[5] = v16;
  [v8 startTask:v12 completionBlock:v11];

  _Block_object_dispose(v16, 8);
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  id v5 = [a4 firstObject];
  id v6 = [(ICImportArchiveController *)self noteContainer];
  [(ICImportArchiveController *)self importArchiveAtURL:v5 intoNoteContainer:v6];

  [(ICImportArchiveController *)self setNoteContainer:0];
}

- (void)documentPickerWasCancelled:(id)a3
{
}

- (void)showError:(id)a3
{
  id v4 = a3;
  id v8 = +[NSBundle mainBundle];
  id v5 = [v8 localizedStringForKey:@"Error Importing Archive" value:&stru_10063F3D8 table:0];
  id v6 = [v4 localizedDescription];

  id v7 = [(ICImportArchiveController *)self viewController];
  +[UIAlertController ic_showAlertWithTitle:v5 message:v6 viewController:v7];
}

- (_TtC11MobileNotes17ICArchiveImporter)archiveImporter
{
  return self->_archiveImporter;
}

- (void)setArchiveImporter:(id)a3
{
}

- (ICNoteContainer)noteContainer
{
  return self->_noteContainer;
}

- (void)setNoteContainer:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (ICLongRunningTaskController)taskController
{
  return self->_taskController;
}

- (void)setTaskController:(id)a3
{
}

- (UIDocumentPickerViewController)documentPickerViewController
{
  return self->_documentPickerViewController;
}

- (void)setDocumentPickerViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentPickerViewController, 0);
  objc_storeStrong((id *)&self->_taskController, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_noteContainer, 0);

  objc_storeStrong((id *)&self->_archiveImporter, 0);
}

@end