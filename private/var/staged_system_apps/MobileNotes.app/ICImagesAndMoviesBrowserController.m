@interface ICImagesAndMoviesBrowserController
- (ICImagesAndMoviesBrowserController)initWithAttachmentSection:(signed __int16)a3;
- (ICImagesAndMoviesScrollView)scrollView;
- (signed)attachmentSection;
- (void)browseAttachmentsCollectionView:(id)a3 cell:(id)a4 shouldShareAttachment:(id)a5;
- (void)browseAttachmentsCollectionView:(id)a3 didSelectAttachment:(id)a4 indexPath:(id)a5;
- (void)browseAttachmentsCollectionView:(id)a3 shouldInspectAttachment:(id)a4;
- (void)doneAction:(id)a3;
- (void)loadView;
- (void)presentAttachment:(id)a3;
- (void)setAttachmentSection:(signed __int16)a3;
- (void)setScrollView:(id)a3;
- (void)viewDidLoad;
@end

@implementation ICImagesAndMoviesBrowserController

- (ICImagesAndMoviesBrowserController)initWithAttachmentSection:(signed __int16)a3
{
  uint64_t v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ICImagesAndMoviesBrowserController;
  v4 = [(ICImagesAndMoviesBrowserController *)&v7 init];
  v5 = v4;
  if (v4) {
    [(ICImagesAndMoviesBrowserController *)v4 setAttachmentSection:v3];
  }
  return v5;
}

- (void)loadView
{
  id v3 = [[ICImagesAndMoviesScrollView alloc] initForAttachmentSection:[(ICImagesAndMoviesBrowserController *)self attachmentSection]];
  [(ICImagesAndMoviesBrowserController *)self setScrollView:v3];

  v4 = [(ICImagesAndMoviesBrowserController *)self scrollView];
  [v4 setViewController:self];

  v5 = [(ICImagesAndMoviesBrowserController *)self scrollView];
  [v5 setDelegate:self];

  v6 = [(ICImagesAndMoviesBrowserController *)self scrollView];
  objc_super v7 = [v6 collectionView];
  [v7 setContentInsetAdjustmentBehavior:3];

  id v8 = [(ICImagesAndMoviesBrowserController *)self scrollView];
  [(ICImagesAndMoviesBrowserController *)self setView:v8];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)ICImagesAndMoviesBrowserController;
  [(ICImagesAndMoviesBrowserController *)&v8 viewDidLoad];
  id v3 = [(ICImagesAndMoviesBrowserController *)self navigationItem];
  [v3 setLargeTitleDisplayMode:2];

  v4 = [(ICImagesAndMoviesBrowserController *)self scrollView];
  [v4 setScrollDirection:0];

  v5 = [(ICImagesAndMoviesBrowserController *)self scrollView];
  [v5 setBackground];

  id v6 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"doneAction:"];
  objc_super v7 = [(ICImagesAndMoviesBrowserController *)self navigationItem];
  [v7 setRightBarButtonItem:v6];
}

- (void)doneAction:(id)a3
{
  v4 = [(ICImagesAndMoviesBrowserController *)self presentingViewController];
  [v4 dismissViewControllerAnimated:1 completion:0];

  id v5 = [(ICImagesAndMoviesBrowserController *)self eventReporter];
  [v5 submitAttachmentBrowserActionEventForType:1];
}

- (void)presentAttachment:(id)a3
{
  id v4 = a3;
  id v5 = [(ICImagesAndMoviesBrowserController *)self scrollView];
  id v6 = [v5 attachments];

  id v7 = [v6 indexOfObject:v4];
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v8 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = [v4 shortLoggingDescription];
      *(_DWORD *)buf = 138412290;
      v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Could not find attachment %@ in list of attachments in image scroll view. Falling back to single attachment", buf, 0xCu);
    }
    id v14 = v4;
    uint64_t v10 = +[NSArray arrayWithObjects:&v14 count:1];

    id v11 = 0;
    id v6 = (void *)v10;
  }
  else
  {
    id v11 = v7;
  }
  v12 = [(ICImagesAndMoviesBrowserController *)self ic_viewControllerManager];
  v13 = [(ICImagesAndMoviesBrowserController *)self scrollView];
  [v12 presentAttachments:v6 startingAtIndex:v11 delegate:v13 displayShowInNote:1 editable:0 selectedSubAttachment:0 presentingViewController:self];
}

- (void)browseAttachmentsCollectionView:(id)a3 cell:(id)a4 shouldShareAttachment:(id)a5
{
  id v7 = a4;
  id v9 = +[ICAttachmentActivityViewController makeWithAttachment:a5 quickLookItemDelegate:0 completion:0];
  objc_super v8 = [v9 popoverPresentationController];
  [v8 setSourceView:v7];

  [(ICImagesAndMoviesBrowserController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)browseAttachmentsCollectionView:(id)a3 didSelectAttachment:(id)a4 indexPath:(id)a5
{
  [(ICImagesAndMoviesBrowserController *)self presentAttachment:a4];
  id v6 = [(ICImagesAndMoviesBrowserController *)self eventReporter];
  [v6 submitAttachmentBrowserActionEventForType:4];
}

- (void)browseAttachmentsCollectionView:(id)a3 shouldInspectAttachment:(id)a4
{
  id v5 = a4;
  id v7 = [[ICAttachmentInspectorViewController alloc] initWithAttachment:v5];

  id v6 = [(ICAttachmentInspectorViewController *)v7 ic_embedInNavigationControllerForModalPresentation];
  [(ICImagesAndMoviesBrowserController *)self presentViewController:v6 animated:1 completion:0];
}

- (ICImagesAndMoviesScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (signed)attachmentSection
{
  return self->_attachmentSection;
}

- (void)setAttachmentSection:(signed __int16)a3
{
  self->_attachmentSection = a3;
}

- (void).cxx_destruct
{
}

@end