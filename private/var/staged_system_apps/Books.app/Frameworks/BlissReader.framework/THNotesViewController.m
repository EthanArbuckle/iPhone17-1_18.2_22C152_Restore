@interface THNotesViewController
+ (id)newNotesViewController;
- (BOOL)isCollapsedForSidebarContentViewController:(id)a3;
- (BOOL)notesExist;
- (BOOL)shouldDismissAfterRotate;
- (IMActivityController)activityController;
- (MFMailComposeViewController)mailComposeViewController;
- (NSArray)sectionProviders;
- (NSMutableArray)mutableSectionProviders;
- (NSMutableArray)selectedAnnotations;
- (THAnnotationStorageController)annotationController;
- (THBookViewController)bookViewController;
- (THNotesDetailTableViewController)notesDetailViewController;
- (THNotesSidebarViewController)notesSidebarViewController;
- (THNotesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIViewController)originalViewController;
- (id)annotationsForIndexPaths:(id)a3 updateChapterTitle:(BOOL)a4;
- (id)p_allAnnotationsForSearchText:(id)a3;
- (id)p_nonOrphanedAnnotationsForSearchText:(id)a3;
- (id)p_orphanedAnnotationsForSearchText:(id)a3;
- (id)p_subject;
- (id)searchText;
- (id)sidebarContentViewController:(id)a3 viewControllerForSectionProvider:(id)a4;
- (id)sizingDelegate;
- (unint64_t)numberOfNotes;
- (void)cleanup;
- (void)dealloc;
- (void)dismissActivityController:(BOOL)a3;
- (void)endEditingDidDelete:(BOOL)a3;
- (void)finishedDismissing;
- (void)handleAction:(id)a3;
- (void)handleDelete:(id)a3;
- (void)handleEmail:(id)a3;
- (void)hideForEnterStudyModeWithPrepare:(id)a3 duration:(double)a4 completion:(id)a5;
- (void)hideWithPrepare:(id)a3 duration:(double)a4 completion:(id)a5;
- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5;
- (void)noteWasDeleted;
- (void)p_deleteSelectedNotes;
- (void)p_releaseChildViewControllers;
- (void)p_setupChildViewControllers;
- (void)p_updateNotesExist;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)searchBarTextDidEndEditing:(id)a3;
- (void)setActivityController:(id)a3;
- (void)setAnnotationController:(id)a3;
- (void)setBookViewController:(id)a3;
- (void)setMailComposeViewController:(id)a3;
- (void)setMutableSectionProviders:(id)a3;
- (void)setNotesDetailViewController:(id)a3;
- (void)setNotesSidebarViewController:(id)a3;
- (void)setOriginalViewController:(id)a3;
- (void)setSelectedAnnotations:(id)a3;
- (void)setShouldDismissAfterRotate:(BOOL)a3;
- (void)showForExitStudyModeWithPrepare:(id)a3 duration:(double)a4 completion:(id)a5;
- (void)showWithPrepare:(id)a3 duration:(double)a4 completion:(id)a5;
- (void)updateSectionProviders;
- (void)updateWithNavigationUnit:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation THNotesViewController

+ (id)newNotesViewController
{
  v2 = [THNotesViewControllerPad alloc];

  return [(THNotesViewControllerPad *)v2 initWithNibName:0 bundle:0];
}

- (THNotesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6 = THBundle();
  v9.receiver = self;
  v9.super_class = (Class)THNotesViewController;
  v7 = [(THNotesViewController *)&v9 initWithNibName:a3 bundle:v6];
  if (v7 && [(THNotesViewController *)v7 isMemberOfClass:objc_opt_class()]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewController initWithNibName:bundle:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewController.m") lineNumber:54 description:@"Abstract class"];
  }
  return v7;
}

- (void)dealloc
{
  [(THNotesViewController *)self cleanup];
  v3.receiver = self;
  v3.super_class = (Class)THNotesViewController;
  [(THNotesViewController *)&v3 dealloc];
}

- (void)cleanup
{
  self->_selectedAnnotations = 0;
  self->_mutableSectionProviders = 0;

  self->_mailComposeViewController = 0;
  self->_activityController = 0;

  [(THNotesViewController *)self p_releaseChildViewControllers];
}

- (void)setBookViewController:(id)a3
{
  if (self->_bookViewController != a3)
  {
    self->_bookViewController = (THBookViewController *)a3;
    -[THNotesDetailTableViewController setBookViewController:](self->_notesDetailViewController, "setBookViewController:");
  }
}

- (NSArray)sectionProviders
{
  return &self->_mutableSectionProviders->super;
}

- (id)sizingDelegate
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THNotesViewController;
  [(THNotesViewController *)&v4 viewWillAppear:a3];
  [+[NSNotificationCenter defaultCenter] addObserver:self selector:"keyboardDidHide:" name:UIKeyboardDidHideNotification object:0];
  [+[NSNotificationCenter defaultCenter] addObserver:self selector:"keyboardDidShow:" name:UIKeyboardDidShowNotification object:0];
  [+[NSNotificationCenter defaultCenter] addObserver:self selector:"keyboardWillHide:" name:UIKeyboardWillHideNotification object:0];
  [+[NSNotificationCenter defaultCenter] addObserver:self selector:"keyboardWillShow:" name:UIKeyboardWillShowNotification object:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THNotesViewController;
  [(THNotesViewController *)&v4 viewWillDisappear:a3];
  [+[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:0];
  [+[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:0];
  [+[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:0];
  [+[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:0];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)THNotesViewController;
  [(THNotesViewController *)&v3 viewDidLoad];
  [self view].autoresizingMask = 18;
  [(THNotesViewController *)self p_setupChildViewControllers];
  self->_notesExist = 0;
}

- (id)p_allAnnotationsForSearchText:(id)a3
{
  id v5 = [a3 length];
  annotationController = self->_annotationController;
  if (v5) {
    id v7 = [(THAnnotationStorageController *)annotationController annotationRequestForSearchText:a3];
  }
  else {
    id v7 = [(THAnnotationStorageController *)annotationController annotationRequestForAllNotes];
  }
  id v8 = v7;
  objc_super v9 = self->_annotationController;

  return [(THAnnotationStorageController *)v9 cachedAnnotationsForFetchRequest:v8 migrateIfNecessary:0];
}

- (id)p_nonOrphanedAnnotationsForSearchText:(id)a3
{
  id v5 = [a3 length];
  annotationController = self->_annotationController;
  if (v5) {
    id v7 = [(THAnnotationStorageController *)annotationController annotationRequestForNonOrphanedSearchText:a3];
  }
  else {
    id v7 = [(THAnnotationStorageController *)annotationController annotationRequestForNonOrphanedNotes];
  }
  id v8 = v7;
  objc_super v9 = self->_annotationController;

  return [(THAnnotationStorageController *)v9 cachedAnnotationsForFetchRequest:v8 migrateIfNecessary:0];
}

- (id)p_orphanedAnnotationsForSearchText:(id)a3
{
  id v5 = [a3 length];
  annotationController = self->_annotationController;
  if (v5) {
    id v7 = [(THAnnotationStorageController *)annotationController annotationRequestForOrphanedSearchText:a3];
  }
  else {
    id v7 = [(THAnnotationStorageController *)annotationController annotationRequestForOrphanedNotes];
  }
  id v8 = v7;
  objc_super v9 = self->_annotationController;

  return [(THAnnotationStorageController *)v9 cachedAnnotationsForFetchRequest:v8 migrateIfNecessary:0];
}

- (void)p_updateNotesExist
{
  if (objc_msgSend(-[THNotesViewController searchText](self, "searchText"), "length")) {
    id v3 = [[self p_allAnnotationsForSearchText:&stru_46D7E8] count];
  }
  else {
    id v3 = [(THNotesViewController *)self numberOfNotes];
  }
  self->_notesExist = v3 != 0;
}

- (void)updateSectionProviders
{
  id v3 = [(THNotesViewController *)self p_nonOrphanedAnnotationsForSearchText:[(THNotesViewController *)self searchText]];
  id v4 = [(THNotesViewController *)self p_orphanedAnnotationsForSearchText:[(THNotesViewController *)self searchText]];
  id v5 = [[-[THDocumentViewController documentViewController](-[THBookViewController documentViewController](-[THNotesViewController bookViewController](self, "bookViewController"), "documentViewController"), "documentRoot") navigationModel];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  mutableSectionProviders = self->_mutableSectionProviders;
  id v7 = [(NSMutableArray *)mutableSectionProviders countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(mutableSectionProviders);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) updateWithAllAnnotations:v3 orphanedAnnotations:v4 annotationController:self->_annotationController navigationModel:v5];
      }
      id v8 = [(NSMutableArray *)mutableSectionProviders countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
  [(THNotesViewController *)self p_updateNotesExist];
  [(THNotesSidebarViewController *)self->_notesSidebarViewController updateVisibleIndexes];
  if ([(THNotesSidebarViewController *)self->_notesSidebarViewController providerIndex] == 0x7FFFFFFFFFFFFFFFLL) {
    id v11 = 0;
  }
  else {
    id v11 = [(NSMutableArray *)self->_mutableSectionProviders objectAtIndex:[(THNotesSidebarViewController *)self->_notesSidebarViewController providerIndex]];
  }
  -[THNotesDetailTableViewController reloadWithSections:force:](self->_notesDetailViewController, "reloadWithSections:force:", [v11 sectionArray], 1);
  [(THNotesViewController *)self sectionProvidersDidChange];
}

- (void)noteWasDeleted
{
  [-[THDocumentViewController canvasViewController](-[THBookViewController documentViewController](-[THNotesViewController bookViewController](self, "bookViewController"), "documentViewController"), "canvasViewController") layoutInvalidated];

  [(THNotesViewController *)self updateSectionProviders];
}

- (unint64_t)numberOfNotes
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  mutableSectionProviders = self->_mutableSectionProviders;
  id v3 = [(NSMutableArray *)mutableSectionProviders countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  unint64_t v5 = 0;
  uint64_t v6 = *(void *)v11;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(mutableSectionProviders);
      }
      id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
      objc_opt_class();
      if (!TSUDynamicCast()) {
        v5 += (unint64_t)[v8 annotationCount];
      }
    }
    id v4 = [(NSMutableArray *)mutableSectionProviders countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v4);
  return v5;
}

- (void)updateWithNavigationUnit:(id)a3
{
  annotationController = self->_annotationController;
  if (!annotationController)
  {
    annotationController = [THDocumentViewController documentRoot][THBookViewController documentViewController][THNotesViewController bookViewController][self bookViewController]documentViewController]annotationController];
    self->_annotationController = annotationController;
    if (!annotationController)
    {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewController updateWithNavigationUnit:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewController.m") lineNumber:265 description:@"expected to have an instantiated annotation controller"];
      annotationController = self->_annotationController;
    }
  }
  [(THAnnotationStorageController *)annotationController ensureNonSponsoredAnnotationsAreMigrated];
  id v6 = [[-[THDocumentViewController documentViewController](-[THBookViewController documentViewController](-[THNotesViewController bookViewController](self, "bookViewController"), "documentViewController"), "documentRoot") navigationModel];
  v20 = self;
  id v7 = [[-[THDocumentViewController documentViewController](-[THBookViewController bookViewController](-[THNotesViewController notesViewController](self, "notesViewController"), "bookViewController"), "documentViewController") documentRoot] tocModel];
  id v8 = +[NSMutableArray array];
  id v9 = +[NSMutableArray array];
  id v10 = [v6 firstNavigationUnit];
  if (v10)
  {
    id v11 = v10;
    long long v12 = 0;
    uint64_t v13 = 0;
    do
    {
      long long v14 = [[THNotesViewChapter alloc] initWithNavigationUnit:v11 navigationModel:v6 tocModel:v7 chapterIndex:v13];
      [v9 addObject:v11];
      [v8 addObject:v14];

      if (a3 && (!v12 || [v11 isEqual:a3])) {
        long long v12 = v14;
      }
      id v11 = [v6 navigationUnitFollowingNavigationUnit:v11];
      ++v13;
    }
    while (v11);
  }
  else
  {
    long long v12 = 0;
  }
  long long v15 = [[THNotesViewAllChapters alloc] initWithNavigationUnits:v9 navigationModel:v6];
  [v8 insertObject:v15 atIndex:0];

  v16 = objc_alloc_init(THNotesViewOrphans);
  [v8 addObject:v16];

  v17 = (NSMutableArray *)v8;
  v20->_mutableSectionProviders = v17;
  [(THNotesSidebarViewController *)v20->_notesSidebarViewController setSectionProviders:v17];
  if (TSUPadUI()) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v12) {
    uint64_t v18 = (uint64_t)[(NSMutableArray *)v20->_mutableSectionProviders indexOfObjectIdenticalTo:v12];
  }
  [(THNotesSidebarViewController *)v20->_notesSidebarViewController setProviderIndex:v18];
  [(THNotesViewController *)v20 updateSectionProviders];
  notesDetailViewController = v20->_notesDetailViewController;

  [(THNotesDetailTableViewController *)notesDetailViewController scrollToTop];
}

- (void)p_setupChildViewControllers
{
  notesSidebarViewController = self->_notesSidebarViewController;
  if (!notesSidebarViewController)
  {
    self->_notesSidebarViewController = [[THNotesSidebarViewController alloc] initWithNibName:0 bundle:THBundle()];
    [(THNotesSidebarViewController *)self->_notesSidebarViewController setSidebarDelegate:[(THNotesViewController *)self sizingDelegate]];
    notesSidebarViewController = self->_notesSidebarViewController;
  }
  [(THNotesSidebarViewController *)notesSidebarViewController view];
  [(UISearchBar *)[(THNotesSidebarViewController *)self->_notesSidebarViewController searchBar] setDelegate:self];
  id v4 = [(THNotesViewController *)self bookViewController];
  notesDetailViewController = self->_notesDetailViewController;

  [(THNotesDetailTableViewController *)notesDetailViewController setBookViewController:v4];
}

- (void)p_releaseChildViewControllers
{
  self->_notesDetailViewController = 0;
  self->_notesSidebarViewController = 0;
}

- (void)finishedDismissing
{
  id v2 = +[TSUAssertionHandler currentHandler];
  id v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewController finishedDismissing]");
  id v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewController.m"];

  [v2 handleFailureInFunction:v3 file:v4 lineNumber:358 description:@"Subclass must implement"];
}

- (id)searchText
{
  return [(THNotesSidebarViewController *)self->_notesSidebarViewController searchText];
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
}

- (void)searchBarTextDidEndEditing:(id)a3
{
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
}

- (void)searchBarSearchButtonClicked:(id)a3
{
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  [a3 setText:0];
  [a3 resignFirstResponder];

  [(THNotesViewController *)self searchTextDidChange];
}

- (id)sidebarContentViewController:(id)a3 viewControllerForSectionProvider:(id)a4
{
  return 0;
}

- (BOOL)isCollapsedForSidebarContentViewController:(id)a3
{
  return 0;
}

- (void)showWithPrepare:(id)a3 duration:(double)a4 completion:(id)a5
{
  id v5 = +[TSUAssertionHandler currentHandler];
  id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewController showWithPrepare:duration:completion:]");
  id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewController.m"];

  [v5 handleFailureInFunction:v6 file:v7 lineNumber:467 description:@"Subclass must implement"];
}

- (void)hideWithPrepare:(id)a3 duration:(double)a4 completion:(id)a5
{
  id v5 = +[TSUAssertionHandler currentHandler];
  id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewController hideWithPrepare:duration:completion:]");
  id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewController.m"];

  [v5 handleFailureInFunction:v6 file:v7 lineNumber:472 description:@"Subclass must implement"];
}

- (void)showForExitStudyModeWithPrepare:(id)a3 duration:(double)a4 completion:(id)a5
{
  id v5 = +[TSUAssertionHandler currentHandler];
  id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewController showForExitStudyModeWithPrepare:duration:completion:]");
  id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewController.m"];

  [v5 handleFailureInFunction:v6 file:v7 lineNumber:477 description:@"Subclass must implement"];
}

- (void)hideForEnterStudyModeWithPrepare:(id)a3 duration:(double)a4 completion:(id)a5
{
  id v5 = +[TSUAssertionHandler currentHandler];
  id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewController hideForEnterStudyModeWithPrepare:duration:completion:]");
  id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewController.m"];

  [v5 handleFailureInFunction:v6 file:v7 lineNumber:482 description:@"Subclass must implement"];
}

- (id)annotationsForIndexPaths:(id)a3 updateChapterTitle:(BOOL)a4
{
  BOOL v4 = a4;
  id v18 = +[NSMutableArray array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = a3;
  id v8 = [a3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    BOOL v16 = v4;
    do
    {
      id v11 = 0;
      id v17 = v9;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v11);
        id v13 = [(THNotesDetailTableViewController *)self->_notesDetailViewController cachedAnnotationForIndexPath:v12];
        if (v4)
        {
          long long v14 = [(THNotesDetailTableViewController *)self->_notesDetailViewController sectionTitleForIndexPath:v12];
          if (!v14)
          {
            BOOL v4 = v16;
            id v9 = v17;
            long long v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", [(id)THBundle() localizedStringForKey:@"Chapter %lu: %@" value:&stru_46D7E8 table:0], (char *)-[THNotesSidebarViewController providerIndex](self->_notesSidebarViewController, "providerIndex")+ 1, objc_msgSend(-[NSMutableArray objectAtIndex:](self->_mutableSectionProviders, "objectAtIndex:", -[THNotesSidebarViewController providerIndex](self->_notesSidebarViewController, "providerIndex")),
                      "title"));
          }
          id v13 = [(THAnnotationStorageController *)[(THNotesViewController *)self annotationController] modifiedAnnotation:v13 withChapterTitle:v14 physicalPageNumber:[(THBookViewController *)self->_bookViewController pageNumberStringForAnnotation:v13]];
        }
        if (v13) {
          [v18 addObject:v13];
        }
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
  return v18;
}

- (void)handleEmail:(id)a3
{
  if (+[MFMailComposeViewController canSendMail])
  {
    id v4 = [(NSMutableDictionary *)[(THNotesDetailTableViewController *)self->_notesDetailViewController selectedNotes] allKeys];
    if ([v4 count])
    {
      selectedAnnotations = [[-[THNotesViewController annotationsForIndexPaths:updateChapterTitle:](self, "annotationsForIndexPaths:updateChapterTitle:", v4, 1) mutableCopy];
      self->_selectedAnnotations = selectedAnnotations;
    }
    else
    {
      selectedAnnotations = self->_selectedAnnotations;
    }
    id v10 = [(NSMutableArray *)selectedAnnotations count];
    id v11 = self->_selectedAnnotations;
    if (v10)
    {
      if (v11)
      {
        [(THNotesViewController *)self p_finishHandleEmail];
        return;
      }
    }
    else
    {

      self->_selectedAnnotations = 0;
    }
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewController handleEmail:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewController.m") lineNumber:540 description:@"Should not be able to attempt to email annotations unless some were chosen"];
    id v12 = [(id)THBundle() localizedStringForKey:@"Email Notes" value:&stru_46D7E8 table:0];
    id v7 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v12, objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", @"Cannot email notes; no valid annotations were selected",
             &stru_46D7E8,
             0),
           1);
    id v8 = (void *)THBundle();
    CFStringRef v9 = @"Cancel";
  }
  else
  {
    id v6 = [(id)THBundle() localizedStringForKey:@"No email accounts configured" value:&stru_46D7E8 table:0];
    id v7 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, [(id)THBundle() localizedStringForKey:@"Add a mail account in Settings to send mail from Apple Books." value:&stru_46D7E8 table:0], 1);
    id v8 = (void *)THBundle();
    CFStringRef v9 = @"OK";
  }
  -[UIAlertController addAction:](v7, "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", [v8 localizedStringForKey:v9 value:&stru_46D7E8 table:0], 1, 0));

  [(THNotesViewController *)self presentViewController:v7 animated:1 completion:0];
}

- (id)p_subject
{
  id v3 = [(THBookViewController *)[(THNotesViewController *)self bookViewController] bookDescription];
  unint64_t v4 = [(THNotesSidebarViewController *)self->_notesSidebarViewController providerIndex];
  id v5 = [(NSMutableArray *)self->_mutableSectionProviders objectAtIndex:v4];
  id v6 = [(THBookDescription *)v3 bookTitle];
  if (!v6) {
    id v6 = (NSString *)[(id)THBundle() localizedStringForKey:@"untitled book" value:@"Untitled" table:0];
  }
  if ([v5 isAllNotes])
  {
    id v7 = (void *)THBundle();
    CFStringRef v8 = @"Notes from \\U201C%@,\\U201D All Chapters";
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", [v7 localizedStringForKey:v8 value:&stru_46D7E8 table:0], v6, v11, v12);
  }
  if ([v5 isOrphanedNotes])
  {
    id v7 = (void *)THBundle();
    CFStringRef v8 = @"Old Notes from \\U201C%@\\U201D";
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", [v7 localizedStringForKey:v8 value:&stru_46D7E8 table:0], v6, v11, v12);
  }
  id v10 = [v5 title];
  if (!v10) {
    id v10 = [(id)THBundle() localizedStringForKey:@"untitled chapter" value:@"Untitled" table:0];
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", [(id)THBundle() localizedStringForKey:@"Notes from \\U201C%@,\\U201D Chapter %lu: %@" value:&stru_46D7E8 table:0], v6, v4 + 1, v10);
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  self->_mailComposeViewController = 0;
}

- (void)dismissActivityController:(BOOL)a3
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3052000000;
  v4[3] = sub_13D8D8;
  v4[4] = sub_13D8E8;
  v4[5] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_13D8F4;
  v3[3] = &unk_456FB8;
  v3[4] = v4;
  [(-[IMActivityController viewController](-[THNotesViewController activityController](self, "activityController"), "viewController")) dismissViewControllerAnimated:a3 completion:v3];
  _Block_object_dispose(v4, 8);
}

- (void)handleAction:(id)a3
{
  [(THNotesViewController *)self dismissActivityController:1];
  id v5 = [(THNotesViewController *)self annotationsForIndexPaths:[(NSMutableDictionary *)[(THNotesDetailTableViewController *)[(THNotesViewController *)self notesDetailViewController] selectedNotes] allKeys] updateChapterTitle:1];
  id v6 = (char *)[v5 count];
  if (v6)
  {
    id v7 = v6;
    CFStringRef v8 = [(THNotesViewController *)self bookViewController];
    CFStringRef v9 = v8;
    id v10 = v7 == (unsigned char *)&dword_0 + 1
        ? -[THBookViewController activityItemProviderWithCachedAnnotation:](v8, "activityItemProviderWithCachedAnnotation:", [v5 objectAtIndex:0]): -[THBookViewController activityItemProviderWithCachedAnnotations:](v8, "activityItemProviderWithCachedAnnotations:", v5);
    if (v10)
    {
      id v17 = v10;
      id v11 = [objc_alloc((Class)IMActivityController) initWithActivityItems:+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1) applicationActivities:0 shareType:[v10 shareType] propertySource:[v10 propertySource] tracker:[self ba_effectiveAnalyticsTracker]];
      [(THNotesViewController *)self setActivityController:v11];
      v16[0] = 0;
      v16[1] = v16;
      v16[2] = 0x3052000000;
      v16[3] = sub_13D8D8;
      v16[4] = sub_13D8E8;
      v16[5] = self;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_13DC38;
      v15[3] = &unk_459DF0;
      v15[4] = v16;
      [(IMActivityController *)[(THNotesViewController *)self activityController] setCompletionHandler:v15];

      -[IMActivityController setManagedBook:](-[THNotesViewController activityController](self, "activityController"), "setManagedBook:", objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](v9, "documentViewController"), "documentRoot"), "bookDescription"), "asset"), "isManagedBook"));
      id v12 = [(IMActivityController *)[(THNotesViewController *)self activityController] viewController];
      [v12 setModalPresentationStyle:7];
      [v12 setOverrideUserInterfaceStyle:[self overrideUserInterfaceStyle]];
      id v13 = [v12 popoverPresentationController];
      [v13 setPermittedArrowDirections:15];
      objc_opt_class();
      uint64_t v14 = TSUDynamicCast();
      if (v14)
      {
        [v13 setBarButtonItem:v14];
      }
      else if (objc_opt_respondsToSelector())
      {
        [v13 setSourceView:[a3 superview]];
        [a3 frame];
        [v13 setSourceRect:];
      }
      [v13 bc_applyTraitOverridesWithOverrideUserInterfaceStyleFromViewController:self];
      [(THNotesViewController *)self bc_presentViewController:v12 animated:1 tintColor:+[UIColor bc_booksKeyColor] completion:0];
      _Block_object_dispose(v16, 8);
    }
  }
}

- (void)endEditingDidDelete:(BOOL)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  unint64_t v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewController endEditingDidDelete:]");
  id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewController.m"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:695 description:@"subclass responsibility"];
}

- (void)p_deleteSelectedNotes
{
  [(THNotesDetailTableViewController *)[(THNotesViewController *)self notesDetailViewController] deleteSelectedNotes];

  [(THNotesViewController *)self endEditingDidDelete:1];
}

- (void)handleDelete:(id)a3
{
  [(THNotesViewController *)self dismissActivityController:1];
  if ([(THNotesDetailTableViewController *)[(THNotesViewController *)self notesDetailViewController] countOfUserNotesToDelete])
  {
    unint64_t v4 = [(THNotesDetailTableViewController *)[(THNotesViewController *)self notesDetailViewController] countOfItemsToDelete];
    if (v4)
    {
      if (v4 == 1) {
        CFStringRef v5 = @"Delete Highlight";
      }
      else {
        CFStringRef v5 = @"Delete Highlights";
      }
      if (v4 == 1) {
        CFStringRef v6 = @"The associated note will also be deleted.";
      }
      else {
        CFStringRef v6 = @"Any associated notes will also be deleted.";
      }
      id v7 = [(id)THBundle() localizedStringForKey:v5 value:&stru_46D7E8 table:0];
      id v8 = [(id)THBundle() localizedStringForKey:v6 value:&stru_46D7E8 table:0];
    }
    else
    {
      id v8 = 0;
      id v7 = 0;
    }
    id v9 = [(id)THBundle() localizedStringForKey:@"Cancel" value:&stru_46D7E8 table:0];
    id v10 = [(id)THBundle() localizedStringForKey:@"Delete" value:&stru_46D7E8 table:0];
    id v11 = +[UIAlertController alertControllerWithTitle:v7 message:v8 preferredStyle:1];
    [(UIAlertController *)v11 addAction:+[UIAlertAction actionWithTitle:v9 style:1 handler:0]];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_13DF08;
    v12[3] = &unk_457310;
    v12[4] = self;
    [(UIAlertController *)v11 addAction:+[UIAlertAction actionWithTitle:v10 style:2 handler:v12]];
    [(THNotesViewController *)self presentViewController:v11 animated:1 completion:0];
  }
  else
  {
    [(THNotesViewController *)self p_deleteSelectedNotes];
  }
}

- (THAnnotationStorageController)annotationController
{
  return self->_annotationController;
}

- (void)setAnnotationController:(id)a3
{
  self->_annotationController = (THAnnotationStorageController *)a3;
}

- (THNotesSidebarViewController)notesSidebarViewController
{
  return self->_notesSidebarViewController;
}

- (void)setNotesSidebarViewController:(id)a3
{
}

- (THNotesDetailTableViewController)notesDetailViewController
{
  return self->_notesDetailViewController;
}

- (void)setNotesDetailViewController:(id)a3
{
}

- (THBookViewController)bookViewController
{
  return self->_bookViewController;
}

- (BOOL)shouldDismissAfterRotate
{
  return self->_shouldDismissAfterRotate;
}

- (void)setShouldDismissAfterRotate:(BOOL)a3
{
  self->_shouldDismissAfterRotate = a3;
}

- (UIViewController)originalViewController
{
  return self->_originalViewController;
}

- (void)setOriginalViewController:(id)a3
{
  self->_originalViewController = (UIViewController *)a3;
}

- (BOOL)notesExist
{
  return self->_notesExist;
}

- (NSMutableArray)mutableSectionProviders
{
  return self->_mutableSectionProviders;
}

- (void)setMutableSectionProviders:(id)a3
{
}

- (MFMailComposeViewController)mailComposeViewController
{
  return self->_mailComposeViewController;
}

- (void)setMailComposeViewController:(id)a3
{
}

- (NSMutableArray)selectedAnnotations
{
  return self->_selectedAnnotations;
}

- (void)setSelectedAnnotations:(id)a3
{
}

- (IMActivityController)activityController
{
  return self->_activityController;
}

- (void)setActivityController:(id)a3
{
}

@end