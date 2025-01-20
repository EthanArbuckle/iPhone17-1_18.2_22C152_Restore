@interface THChapterViewController
- (BOOL)allowsDescendersToClipForSectionController:(id)a3;
- (BOOL)canvasViewController:(id)a3 enableSwipeGestureWithNumberOfTouches:(unint64_t)a4;
- (BOOL)displaySinglePageChapterSeparately:(id)a3;
- (BOOL)inFlowMode;
- (BOOL)interactiveCanvasController:(id)a3 shouldBeginEditingTHWPRep:(id)a4 withGesture:(id)a5;
- (BOOL)isCanvasInteractive;
- (BOOL)isCompactFlowPresentationForSectionController:(id)a3;
- (BOOL)isTwoUpForSectionController:(id)a3;
- (BOOL)p_updateVisibleInfos;
- (BOOL)repIsPresentedExpanded:(id)a3;
- (BOOL)shouldAllowFinishingPartionedAttachmentLayoutForSectionController:(id)a3;
- (BOOL)shouldFreeTransformRecognizeSimultaneouslyWithGestureRecognizer:(id)a3;
- (BOOL)shouldScaleFlowLayoutsForSectionController:(id)a3;
- (BOOL)torndown;
- (BOOL)widgetHostingAllowAutoplayForRep:(id)a3;
- (BOOL)widgetHostingAllowInteractionOnPageForRep:(id)a3;
- (BOOL)widgetHostingShouldAllowNaturalHorizontalScrollForRep:(id)a3;
- (CGRect)visibleScaledBoundsForClippingRepsOnCanvas:(id)a3;
- (CGSize)pageSizeForPagePositionController:(id)a3;
- (CGSize)widgetHostExpandedSize;
- (THChapterViewController)initWithDelegate:(id)a3 pageControlHeight:(double)a4 presentationType:(id)a5;
- (THChapterViewTableController)chapterViewTableController;
- (THDocumentRoot)documentRoot;
- (THInteractiveCanvasController)interactiveCanvasController;
- (THModelLink)chapterLink;
- (THSectionController)sectionController;
- (THTOCTileModel)tileModel;
- (THiOSCanvasViewController)canvasViewController;
- (THiOSTraitsCache)traitsCache;
- (double)pageControlHeight;
- (id)actionForHyperlink:(id)a3 inRep:(id)a4 gesture:(id)a5;
- (id)chapterViewTable:(id)a3 entryForIndex:(unint64_t)a4;
- (id)documentRootForSectionController:(id)a3;
- (id)flowLayoutObserverForSectionController:(id)a3;
- (id)freeTransformRepHandler;
- (id)layoutControllerForSectionController:(id)a3;
- (id)reloadViewsAndShowThumbnail:(BOOL)a3;
- (id)rootModelControllerForSectionController:(id)a3;
- (id)transitionContentView;
- (unint64_t)chapterIndex;
- (unint64_t)chapterViewTableNumberOfEntries:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)chapterViewTable:(id)a3 selectedEntryWithIndex:(unint64_t)a4;
- (void)chapterViewTableDoneButtonPressed:(id)a3;
- (void)contentSizeCategoryDidChange;
- (void)dealloc;
- (void)interactiveCanvasControllerDidLayoutAndRenderOnBackgroundThread:(id)a3;
- (void)interactiveCanvasControllerWasTapped:(id)a3;
- (void)p_hideFallbackImageView;
- (void)p_releaseOutlets;
- (void)p_teardownCanvas;
- (void)p_updateVisibleInfosOrRevealCanvas;
- (void)presentRepExpanded:(id)a3;
- (void)sectionControllerInfosDidChange:(id)a3;
- (void)sectionControllerNeedsLayout:(id)a3;
- (void)setCanvasViewController:(id)a3;
- (void)setChapterIndex:(unint64_t)a3;
- (void)setChapterViewTableController:(id)a3;
- (void)setInteractiveCanvasController:(id)a3;
- (void)setSectionController:(id)a3;
- (void)setTileModel:(id)a3;
- (void)setTorndown:(BOOL)a3;
- (void)setTraitsCache:(id)a3;
- (void)showCorruptDocumentAlertForSectionController:(id)a3;
- (void)teardown;
- (void)updateCanvasViewWithSize:(CGSize)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation THChapterViewController

- (THChapterViewController)initWithDelegate:(id)a3 pageControlHeight:(double)a4 presentationType:(id)a5
{
  uint64_t v9 = THBundle();
  v16.receiver = self;
  v16.super_class = (Class)THChapterViewController;
  v10 = [(THChapterViewController *)&v16 initWithNibName:@"THChapterViewController" bundle:v9];
  v11 = v10;
  if (v10)
  {
    v10->mDelegate = (THChapterViewControllerDelegate *)a3;
    v10->mChapterIndex = 0x7FFFFFFFFFFFFFFFLL;
    v10->_pageControlHeight = a4;
    p_mPageSize = &v10->mPageSize;
    [a5 pageSize];
    *(void *)&p_mPageSize->width = v13;
    v11->mPageSize.height = v14;
    [(THChapterViewController *)v11 setSectionController:[[THSectionController alloc] initWithDelegate:v11 pagePositionController:+[THPagePositionController paginatedPositionerWithDelegate:v11] presentationType:a5]];
    [(THChapterViewController *)v11 registerForTraitChanges:+[UITraitCollection bc_allAPITraits] withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v11;
}

- (void)dealloc
{
  [(THChapterViewController *)self p_releaseOutlets];

  v3.receiver = self;
  v3.super_class = (Class)THChapterViewController;
  [(THChapterViewController *)&v3 dealloc];
}

- (void)teardown
{
  self->mDelegate = 0;
}

- (void)p_teardownCanvas
{
  self->_torndown = 1;
}

- (void)p_releaseOutlets
{
  if (!self->_torndown)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterViewController p_releaseOutlets]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterViewController.m") lineNumber:114 description:@"%@ chapterIndex=%lu - not torndown before dealloc" self,-[THChapterViewController chapterIndex](self, "chapterIndex")];
    if (!self->_torndown) {
      [(THChapterViewController *)self p_teardownCanvas];
    }
  }

  self->mInteractiveCanvasController = 0;
  self->mCanvasViewController = 0;

  self->mFallbackImageView = 0;
  self->_traitsCache = 0;
}

- (void)viewDidLayoutSubviews
{
  [self view].bounds;

  -[THChapterViewController updateCanvasViewWithSize:](self, "updateCanvasViewWithSize:", v3, v4);
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  v5 = [(THChapterViewController *)self traitsCache];
  id v6 = [(THChapterViewController *)self traitCollection];

  [(THiOSTraitsCache *)v5 updateTraitsWithCollection:v6];
}

- (void)updateCanvasViewWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = 0.0;
  if ([(THChapterViewControllerDelegate *)self->mDelegate paginatedTOCShowsStatusBar])
  {
    objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(-[THChapterViewController view](self, "view"), "window"), "windowScene"), "statusBarManager"), "defaultStatusBarHeightInOrientation:", objc_msgSend(objc_msgSend(objc_msgSend(-[THChapterViewController view](self, "view"), "window"), "windowScene"), "interfaceOrientation"));
    double v6 = v7;
  }
  [(THSectionController *)self->mSectionController pageSize];
  double v9 = v8;
  double v11 = v10 - self->_pageControlHeight;
  double v12 = height - v6;
  TSDScaleSizeWithinSize();
  TSDCenterOfRect();
  TSDRectWithCenterAndSize();
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  [(-[THChapterViewController canvasViewController](self, "canvasViewController"), "view") setFrame:v13, v15, v17, v19];
  [(THInteractiveCanvasController *)[(THChapterViewController *)self interactiveCanvasController] setViewScale:THScaleNeededToFitSizeInSize(v9, v11, width, v12)];
  -[UIImageView setFrame:](self->mFallbackImageView, "setFrame:", v14, v16, v18, v20);
  v21 = [(UIImageView *)self->mFallbackImageView image];
  if (v21)
  {
    v22 = v21;
    [(UIImage *)v21 size];
    double v24 = v23;
    [(UIImage *)v22 size];
    double v26 = v25;
    [(UIImageView *)self->mFallbackImageView frame];
    double v28 = v27 / v24;
    [(UIImageView *)self->mFallbackImageView frame];
    if (v28 > v29 / v26)
    {
      [(UIImageView *)self->mFallbackImageView frame];
      double v31 = -(v30 - v26 * v28) * 0.5;
      mFallbackImageView = self->mFallbackImageView;
      [(UIImageView *)mFallbackImageView frameY];
      double v34 = v33 + v31;
      [(UIImageView *)mFallbackImageView setFrameY:v34];
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THChapterViewController;
  [(THChapterViewController *)&v4 viewWillAppear:a3];
  [(THiOSTraitsCache *)[(THChapterViewController *)self traitsCache] updateTraitsWithCollection:[(THChapterViewController *)self traitCollection]];
  [+[NSNotificationCenter defaultCenter] addObserver:self selector:"contentSizeCategoryDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THChapterViewController;
  [(THChapterViewController *)&v4 viewDidDisappear:a3];
  [+[NSNotificationCenter defaultCenter] removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)THChapterViewController;
  [(THChapterViewController *)&v10 viewDidLoad];
  double v3 = objc_opt_new();
  [(THChapterViewController *)self setTraitsCache:v3];

  self->_torndown = 0;
  [self view].clipsToBounds = 1;
  [(-[THChapterViewController view](self, "view")) setBackgroundColor:[self pageAreaBackgroundColor]];
  [(THChapterViewControllerDelegate *)self->mDelegate frameForChapterViewController:self];
  [self.view setFrame:v4, v5, v6, v7];
  [(THInteractiveCanvasController *)[(THChapterViewController *)self interactiveCanvasController] setDelegate:self];
  [(THiOSCanvasViewController *)[(THChapterViewController *)self canvasViewController] setTakeFirstResponderOnTap:0];
  id v8 = objc_alloc((Class)UIImageView);
  [self.interactiveCanvasController.canvasView frame];
  double v9 = [v8 initWithFrame:];
  self->mFallbackImageView = v9;
  [(UIImageView *)v9 setHidden:1];
  [(-[THChapterViewController view](self, "view")) insertSubview:self->mFallbackImageView aboveSubview:[-[THChapterViewController interactiveCanvasController](self, "interactiveCanvasController") canvasView]];
  [(THChapterViewController *)self reloadViewsAndShowThumbnail:1];
}

- (void)contentSizeCategoryDidChange
{
  v2 = [(THChapterViewController *)self chapterViewTableController];

  [(THChapterViewTableController *)v2 contentSizeCategoryDidChange];
}

- (CGRect)visibleScaledBoundsForClippingRepsOnCanvas:(id)a3
{
  id v3 = [(THInteractiveCanvasController *)[(THChapterViewController *)self interactiveCanvasController] canvasView];

  [v3 bounds];
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (THModelLink)chapterLink
{
  return [(THTOCTileModel *)self->mTileModel firstModelLink];
}

- (void)p_hideFallbackImageView
{
  [(UIImageView *)self->mFallbackImageView setHidden:1];
  mFallbackImageView = self->mFallbackImageView;

  [(UIImageView *)mFallbackImageView setImage:0];
}

- (BOOL)p_updateVisibleInfos
{
  if ([(THChapterViewController *)self tileModel]
    && [(THChapterViewController *)self isViewLoaded]
    && objc_msgSend(-[THChapterViewController view](self, "view"), "superview"))
  {
    [self view].bounds;
    -[THChapterViewController updateCanvasViewWithSize:](self, "updateCanvasViewWithSize:", v3, v4);
    [(THSectionController *)[(THChapterViewController *)self sectionController] setCurrentNavigationUnit:+[THNavigationUnit navigationUnitWithContext:[(THTOCTileModel *)[(THChapterViewController *)self tileModel] context] andModelNode:[(THTOCTileModel *)[(THChapterViewController *)self tileModel] browserPageNode]]];
    objc_opt_class();
    [(THSectionController *)[(THChapterViewController *)self sectionController] displaySectionInfoForRelativePageIndex:0];
    double v5 = (void *)TSUDynamicCast();
    objc_opt_class();
    [(-[THChapterViewController interactiveCanvasController](self, "interactiveCanvasController")) infosToDisplay].lastObject;
    double v6 = (void *)TSUDynamicCast();
    id v7 = objc_msgSend(objc_msgSend(v5, "pages"), "lastObject");
    if (v7 != objc_msgSend(objc_msgSend(v6, "pages"), "lastObject"))
    {
      id v8 = +[NSArray arrayWithObject:v5];
LABEL_8:
      [(THInteractiveCanvasController *)[(THChapterViewController *)self interactiveCanvasController] setInfosToDisplay:v8];
      LOBYTE(v9) = 1;
      return (char)v9;
    }
    LOBYTE(v9) = 0;
  }
  else
  {
    id v9 = [[-[THChapterViewController interactiveCanvasController](self, "interactiveCanvasController") infosToDisplay] count];
    if (v9)
    {
      id v8 = +[NSArray array];
      goto LABEL_8;
    }
  }
  return (char)v9;
}

- (void)p_updateVisibleInfosOrRevealCanvas
{
  if (![(THChapterViewController *)self p_updateVisibleInfos])
  {
    [(THInteractiveCanvasController *)[(THChapterViewController *)self interactiveCanvasController] setAllowLayoutAndRenderOnThread:0];
    [(THInteractiveCanvasController *)[(THChapterViewController *)self interactiveCanvasController] setStaticLayoutAndRenderOnThread:0];
    id v3 = [[-[THInteractiveCanvasController canvas](-[THChapterViewController interactiveCanvasController](self, "interactiveCanvasController"), "canvas") topLevelReps] copy];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * i) recursivelyPerformSelectorIfImplemented:"canvasDidLayoutAndRenderOnBackgroundThread"];
        }
        id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }

    mTileModel = self->mTileModel;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_B02D4;
    v10[3] = &unk_456DE0;
    v10[4] = self;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_B02EC;
    v9[3] = &unk_4585E0;
    v9[4] = self;
    v9[5] = mTileModel;
    +[UIView animateWithDuration:v10 animations:v9 completion:0.15];
  }
}

- (id)reloadViewsAndShowThumbnail:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(THChapterViewController *)self isViewLoaded] && self->mTileModel)
  {
    [self view].hidden = 0;
    id v5 = [(THTOCTileModel *)[(THChapterViewController *)self tileModel] browserPageNode];
    if ([(THModelContentNode *)v5 nodeBodyExists])
    {
      [(THModelContentNode *)v5 startLoading];
      if ([(THTOCTileModel *)self->mTileModel tocThumb]) {
        BOOL v6 = !v3;
      }
      else {
        BOOL v6 = 1;
      }
      if (v6)
      {
        [(THChapterViewController *)self p_hideFallbackImageView];
        [(THInteractiveCanvasController *)[(THChapterViewController *)self interactiveCanvasController] setStaticLayoutAndRenderOnThread:0];
        [(THInteractiveCanvasController *)[(THChapterViewController *)self interactiveCanvasController] setAllowLayoutAndRenderOnThread:0];
        [(THModelContentNode *)v5 waitUntilFinishedLoading];
        [(THChapterViewController *)self p_updateVisibleInfos];
      }
      else
      {
        id v8 = +[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", +[TSDBitmapImageProvider temporaryCGImageForImageData:[(THTOCTileModel *)self->mTileModel tocThumb]]);
        [(UIImage *)v8 size];
        double v10 = v9;
        [(UIImage *)v8 size];
        double v12 = v11;
        [(UIImageView *)self->mFallbackImageView frame];
        double v14 = v13 / v10;
        [(UIImageView *)self->mFallbackImageView frame];
        mFallbackImageView = self->mFallbackImageView;
        if (v14 <= v15 / v12)
        {
          [(UIImageView *)mFallbackImageView setContentMode:1];
        }
        else
        {
          [(UIImageView *)mFallbackImageView setContentMode:2];
          [(UIImageView *)self->mFallbackImageView frame];
          double v18 = -(v17 - v12 * v14) * 0.5;
          double v19 = self->mFallbackImageView;
          [(UIImageView *)v19 frameY];
          [(UIImageView *)v19 setFrameY:v20 + v18];
        }
        [(UIImageView *)self->mFallbackImageView setImage:v8];
        [(UIImageView *)self->mFallbackImageView setHidden:0];
        [(UIImageView *)self->mFallbackImageView setAlpha:1.0];
        [(THInteractiveCanvasController *)[(THChapterViewController *)self interactiveCanvasController] setStaticLayoutAndRenderOnThread:1];
        [(THInteractiveCanvasController *)[(THChapterViewController *)self interactiveCanvasController] setAllowLayoutAndRenderOnThread:1];
        mTileModel = self->mTileModel;
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_B0574;
        v22[3] = &unk_456E38;
        v22[4] = self;
        v22[5] = mTileModel;
        [(THModelContentNode *)v5 performWhenFinishedLoading:v22 onError:&stru_458D40];
      }
    }
    else
    {
      [self view].hidden = 1;
    }
  }
  else
  {
    [self.view setHidden:1];
    return 0;
  }
  return v5;
}

- (void)interactiveCanvasControllerDidLayoutAndRenderOnBackgroundThread:(id)a3
{
  if (([(THInteractiveCanvasController *)[(THChapterViewController *)self interactiveCanvasController] currentlyWaitingOnThreadedLayoutAndRender] & 1) == 0)
  {
    [(THChapterViewController *)self p_updateVisibleInfosOrRevealCanvas];
  }
}

- (BOOL)shouldFreeTransformRecognizeSimultaneouslyWithGestureRecognizer:(id)a3
{
  return 0;
}

- (unint64_t)chapterViewTableNumberOfEntries:(id)a3
{
  BOOL v3 = [(THTOCTileModel *)[(THChapterViewController *)self tileModel] landscapeEntries];

  return [(NSArray *)v3 count];
}

- (id)chapterViewTable:(id)a3 entryForIndex:(unint64_t)a4
{
  id v5 = [(THTOCTileModel *)[(THChapterViewController *)self tileModel] landscapeEntries];
  if ([(NSArray *)v5 count] <= a4) {
    return 0;
  }

  return [(NSArray *)v5 objectAtIndexedSubscript:a4];
}

- (void)chapterViewTable:(id)a3 selectedEntryWithIndex:(unint64_t)a4
{
  if (self->_chapterViewTableController == a3)
  {
    BOOL v6 = [(THTOCTileModel *)[(THChapterViewController *)self tileModel] landscapeEntries];
    if ([(NSArray *)v6 count] <= a4) {
      id v7 = 0;
    }
    else {
      id v7 = [(NSArray *)v6 objectAtIndexedSubscript:a4];
    }
    -[THChapterViewControllerDelegate chapterViewController:followLink:](self->mDelegate, "chapterViewController:followLink:", self, [v7 modelLink]);
    [(THChapterViewTableController *)self->_chapterViewTableController dismissAnimated:+[UIView areAnimationsEnabled] completion:0];
    [(THChapterViewController *)self setChapterViewTableController:0];
  }
}

- (void)chapterViewTableDoneButtonPressed:(id)a3
{
  if (self->_chapterViewTableController == a3)
  {
    [a3 dismissAnimated:[UIView areAnimationsEnabled] completion:0];
    [(THChapterViewController *)self setChapterViewTableController:0];
  }
}

- (void)presentRepExpanded:(id)a3
{
  if ([(NSArray *)[(THTOCTileModel *)[(THChapterViewController *)self tileModel] landscapeEntries] count])
  {
    if (!self->_chapterViewTableController) {
      self->_chapterViewTableController = [[THChapterViewTableController alloc] initWithChapterTitle:[(THTOCTileModel *)[(THChapterViewController *)self tileModel] frontTitleText] delegate:self];
    }
    id v4 = [(THChapterViewController *)self chapterViewTableController];
    id v5 = [(THChapterViewControllerDelegate *)self->mDelegate presentingViewControllerForChapterViewController:self];
    BOOL v6 = +[UIView areAnimationsEnabled];
    [(THChapterViewTableController *)v4 presentOnViewController:v5 animated:v6 completion:0];
  }
}

- (BOOL)repIsPresentedExpanded:(id)a3
{
  return 0;
}

- (id)freeTransformRepHandler
{
  return 0;
}

- (BOOL)inFlowMode
{
  return 0;
}

- (CGSize)widgetHostExpandedSize
{
  [self view].frame;
  double v3 = v2;
  double v5 = v4;
  result.double height = v5;
  result.double width = v3;
  return result;
}

- (BOOL)widgetHostingAllowInteractionOnPageForRep:(id)a3
{
  if ([(THChapterViewController *)self im_isCompactWidth]) {
    return 0;
  }
  else {
    return [(THChapterViewController *)self im_isCompactHeight] ^ 1;
  }
}

- (BOOL)widgetHostingAllowAutoplayForRep:(id)a3
{
  return 0;
}

- (BOOL)widgetHostingShouldAllowNaturalHorizontalScrollForRep:(id)a3
{
  return 0;
}

- (id)actionForHyperlink:(id)a3 inRep:(id)a4 gesture:(id)a5
{
  return [(THChapterViewControllerDelegate *)self->mDelegate chapterViewController:self actionForHyperlink:a3 inRep:a4 gesture:a5];
}

- (THDocumentRoot)documentRoot
{
  return (THDocumentRoot *)[(THChapterViewControllerDelegate *)self->mDelegate documentRootForChapterViewController:self];
}

- (BOOL)isCanvasInteractive
{
  return 1;
}

- (void)interactiveCanvasControllerWasTapped:(id)a3
{
}

- (BOOL)interactiveCanvasController:(id)a3 shouldBeginEditingTHWPRep:(id)a4 withGesture:(id)a5
{
  return 0;
}

- (BOOL)canvasViewController:(id)a3 enableSwipeGestureWithNumberOfTouches:(unint64_t)a4
{
  return a4 == 1;
}

- (id)documentRootForSectionController:(id)a3
{
  objc_opt_class();
  [(THTOCTileModel *)[(THChapterViewController *)self tileModel] documentRoot];

  return (id)TSUDynamicCast();
}

- (id)rootModelControllerForSectionController:(id)a3
{
  return [(THChapterViewControllerDelegate *)self->mDelegate documentRootForChapterViewController:self];
}

- (void)sectionControllerNeedsLayout:(id)a3
{
  double v3 = [(THChapterViewController *)self interactiveCanvasController];

  [(THInteractiveCanvasController *)v3 layoutInvalidated];
}

- (void)showCorruptDocumentAlertForSectionController:(id)a3
{
  id v4 = [(id)THBundle() localizedStringForKey:@"This book is either missing content or contains invalid content." value:&stru_46D7E8 table:0];
  double v5 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v4, [(id)THBundle() localizedStringForKey:@"Try downloading the book again" value:&stru_46D7E8 table:0], 1);
  -[UIAlertController addAction:](v5, "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", [(id)THBundle() localizedStringForKey:@"OK" value:&stru_46D7E8 table:0], 1, 0));
  BOOL v6 = +[UIView areAnimationsEnabled];

  [(THChapterViewController *)self presentViewController:v5 animated:v6 completion:0];
}

- (void)sectionControllerInfosDidChange:(id)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterViewController sectionControllerInfosDidChange:]");
  double v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterViewController.m"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:579 description:@"unsupported"];
}

- (id)flowLayoutObserverForSectionController:(id)a3
{
  return 0;
}

- (BOOL)isCompactFlowPresentationForSectionController:(id)a3
{
  return 0;
}

- (CGSize)pageSizeForPagePositionController:(id)a3
{
  double width = self->mPageSize.width;
  double height = self->mPageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)displaySinglePageChapterSeparately:(id)a3
{
  return 0;
}

- (BOOL)isTwoUpForSectionController:(id)a3
{
  return 0;
}

- (BOOL)allowsDescendersToClipForSectionController:(id)a3
{
  return 0;
}

- (id)layoutControllerForSectionController:(id)a3
{
  return 0;
}

- (BOOL)shouldAllowFinishingPartionedAttachmentLayoutForSectionController:(id)a3
{
  return 0;
}

- (BOOL)shouldScaleFlowLayoutsForSectionController:(id)a3
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return (unint64_t)[(THChapterViewControllerDelegate *)self->mDelegate supportedInterfaceOrientationsForChapterViewController:self];
}

- (id)transitionContentView
{
  double v2 = [(THChapterViewController *)self canvasViewController];

  return [(THiOSCanvasViewController *)v2 view];
}

- (THTOCTileModel)tileModel
{
  return self->mTileModel;
}

- (void)setTileModel:(id)a3
{
}

- (unint64_t)chapterIndex
{
  return self->mChapterIndex;
}

- (void)setChapterIndex:(unint64_t)a3
{
  self->mChapterIndex = a3;
}

- (THInteractiveCanvasController)interactiveCanvasController
{
  return self->mInteractiveCanvasController;
}

- (void)setInteractiveCanvasController:(id)a3
{
}

- (THiOSCanvasViewController)canvasViewController
{
  return self->mCanvasViewController;
}

- (void)setCanvasViewController:(id)a3
{
}

- (THSectionController)sectionController
{
  return self->mSectionController;
}

- (void)setSectionController:(id)a3
{
}

- (BOOL)torndown
{
  return self->_torndown;
}

- (void)setTorndown:(BOOL)a3
{
  self->_torndown = a3;
}

- (double)pageControlHeight
{
  return self->_pageControlHeight;
}

- (THChapterViewTableController)chapterViewTableController
{
  return self->_chapterViewTableController;
}

- (void)setChapterViewTableController:(id)a3
{
}

- (THiOSTraitsCache)traitsCache
{
  return self->_traitsCache;
}

- (void)setTraitsCache:(id)a3
{
}

@end