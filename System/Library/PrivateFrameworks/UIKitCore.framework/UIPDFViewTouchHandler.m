@interface UIPDFViewTouchHandler
+ (void)releaseViewManager;
- (BOOL)allowMenu;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)delegateGesture:(id)a3 kind:(int)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)resignFirstResponder;
- (UIPDFViewTouchHandler)initWithView:(id)a3;
- (id)nextResponder;
- (void)briefPressRecognized:(id)a3;
- (void)copy:(id)a3;
- (void)dealloc;
- (void)disableRecognizers;
- (void)doubleTapRecognized:(id)a3;
- (void)enableRecognizers;
- (void)longPressRecognized:(id)a3;
- (void)selectAll:(id)a3;
- (void)setAllowMenu:(BOOL)a3;
- (void)setFirstTouch;
- (void)showMenu;
- (void)singleTapRecognized:(id)a3;
- (void)twoFingerTapRecognized:(id)a3;
@end

@implementation UIPDFViewTouchHandler

+ (void)releaseViewManager
{
  qword_1EB25CF60 = 0;
}

- (UIPDFViewTouchHandler)initWithView:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)UIPDFViewTouchHandler;
  v4 = [(UIPDFViewTouchHandler *)&v14 init];
  v5 = v4;
  if (v4)
  {
    v4->_pdfPageView = (UIPDFPageView *)a3;
    v6 = objc_alloc_init(UIPDFSelectionController);
    v5->_selectionController = v6;
    [(UIPDFSelectionController *)v6 setPageView:a3];
    [(UIPDFPageView *)v5->_pdfPageView setSelectionController:v5->_selectionController];
    v7 = [[UITapGestureRecognizer alloc] initWithTarget:v5 action:sel_doubleTapRecognized_];
    v5->_doubleTapRecognizer = v7;
    [(UITapGestureRecognizer *)v7 setNumberOfTapsRequired:2];
    [(UITapGestureRecognizer *)v5->_doubleTapRecognizer setNumberOfTouchesRequired:1];
    [(UIGestureRecognizer *)v5->_doubleTapRecognizer setDelegate:v5];
    v8 = [[UITapGestureRecognizer alloc] initWithTarget:v5 action:sel_singleTapRecognized_];
    v5->_singleTapRecognizer = v8;
    [(UITapGestureRecognizer *)v8 setNumberOfTapsRequired:1];
    [(UITapGestureRecognizer *)v5->_singleTapRecognizer setNumberOfTouchesRequired:1];
    [(UIGestureRecognizer *)v5->_singleTapRecognizer setDelegate:v5];
    [(UIGestureRecognizer *)v5->_singleTapRecognizer requireGestureRecognizerToFail:v5->_doubleTapRecognizer];
    v9 = [[UITapGestureRecognizer alloc] initWithTarget:v5 action:sel_twoFingerTapRecognized_];
    v5->_twoFingerTapRecognizer = v9;
    [(UITapGestureRecognizer *)v9 setNumberOfTouchesRequired:2];
    [(UIGestureRecognizer *)v5->_twoFingerTapRecognizer setDelegate:v5];
    [(UIGestureRecognizer *)v5->_singleTapRecognizer requireGestureRecognizerToFail:v5->_twoFingerTapRecognizer];
    v10 = [[UILongPressGestureRecognizer alloc] initWithTarget:v5 action:sel_briefPressRecognized_];
    v5->_briefPressRecognizer = v10;
    [(UILongPressGestureRecognizer *)v10 setMinimumPressDuration:0.2];
    [(UIGestureRecognizer *)v5->_briefPressRecognizer setDelegate:v5];
    v11 = [[UILongPressGestureRecognizer alloc] initWithTarget:v5 action:sel_longPressRecognized_];
    v5->_longPressRecognizer = v11;
    [(UIGestureRecognizer *)v11 setDelegate:v5];
    v5->_menuController = +[UIMenuController sharedMenuController];
    v12 = objc_alloc_init(UIPDFMagnifierController);
    v5->_magnifyController = v12;
    [(UIPDFMagnifierController *)v12 setPageView:a3];
    v5->_showMagnifier = 0;
    v5->_showLoupe = 1;
    [(UIPDFViewTouchHandler *)v5 setFirstTouch];
  }
  return v5;
}

- (void)dealloc
{
  objc_msgSend(+[UIPDFViewManager sharedViewManager](UIPDFViewManager, "sharedViewManager"), "viewReleased:", self->_pdfPageView);
  [(UIGestureRecognizer *)self->_doubleTapRecognizer removeTarget:self action:0];
  [(UIGestureRecognizer *)self->_doubleTapRecognizer setDelegate:0];

  [(UIGestureRecognizer *)self->_singleTapRecognizer removeTarget:self action:0];
  [(UIGestureRecognizer *)self->_singleTapRecognizer setDelegate:0];

  [(UIGestureRecognizer *)self->_twoFingerTapRecognizer removeTarget:self action:0];
  [(UIGestureRecognizer *)self->_twoFingerTapRecognizer setDelegate:0];

  [(UIGestureRecognizer *)self->_briefPressRecognizer removeTarget:self action:0];
  [(UIGestureRecognizer *)self->_briefPressRecognizer setDelegate:0];

  [(UIGestureRecognizer *)self->_longPressRecognizer removeTarget:self action:0];
  [(UIGestureRecognizer *)self->_longPressRecognizer setDelegate:0];

  [(UIPDFSelectionController *)self->_selectionController setPageView:0];
  [(UIPDFMagnifierController *)self->_magnifyController hide];

  v3.receiver = self;
  v3.super_class = (Class)UIPDFViewTouchHandler;
  [(UIResponder *)&v3 dealloc];
}

- (void)enableRecognizers
{
  [(UIView *)self->_pdfPageView addGestureRecognizer:self->_singleTapRecognizer];
  [(UIView *)self->_pdfPageView addGestureRecognizer:self->_doubleTapRecognizer];
  [(UIView *)self->_pdfPageView addGestureRecognizer:self->_briefPressRecognizer];
  [(UIView *)self->_pdfPageView addGestureRecognizer:self->_longPressRecognizer];
  pdfPageView = self->_pdfPageView;
  twoFingerTapRecognizer = self->_twoFingerTapRecognizer;
  [(UIView *)pdfPageView addGestureRecognizer:twoFingerTapRecognizer];
}

- (void)disableRecognizers
{
  [(UIView *)self->_pdfPageView removeGestureRecognizer:self->_singleTapRecognizer];
  [(UIView *)self->_pdfPageView removeGestureRecognizer:self->_doubleTapRecognizer];
  [(UIView *)self->_pdfPageView removeGestureRecognizer:self->_briefPressRecognizer];
  [(UIView *)self->_pdfPageView removeGestureRecognizer:self->_longPressRecognizer];
  pdfPageView = self->_pdfPageView;
  twoFingerTapRecognizer = self->_twoFingerTapRecognizer;
  [(UIView *)pdfPageView removeGestureRecognizer:twoFingerTapRecognizer];
}

- (id)nextResponder
{
  return self->_pdfPageView;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)resignFirstResponder
{
  BOOL v3 = [(UIResponder *)self canResignFirstResponder];
  if (v3)
  {
    [(UIPDFSelectionController *)self->_selectionController clearSelection];
    v5.receiver = self;
    v5.super_class = (Class)UIPDFViewTouchHandler;
    LOBYTE(v3) = [(UIResponder *)&v5 resignFirstResponder];
  }
  return v3;
}

- (void)setFirstTouch
{
  self->_firstTouch = 1;
  self->_useDelegateForLinks = 1;
}

- (BOOL)delegateGesture:(id)a3 kind:(int)a4
{
  if (self->_useDelegateForLinks)
  {
    v7 = [(UIPDFPageView *)self->_pdfPageView annotationController];
    [a3 locationInView:self->_pdfPageView];
    BOOL v8 = -[UIPDFAnnotationController isLinkAnnotationAt:](v7, "isLinkAnnotationAt:");
    if (v8)
    {
      if (a4)
      {
        if (a4 == 2)
        {
          BOOL v9 = [(UIPDFAnnotationController *)[(UIPDFPageView *)self->_pdfPageView annotationController] annotationLongPressRecognized:a3];
        }
        else
        {
          if (a4 != 1)
          {
LABEL_11:
            LOBYTE(v8) = 1;
            return v8;
          }
          BOOL v9 = [(UIPDFAnnotationController *)[(UIPDFPageView *)self->_pdfPageView annotationController] annotationBriefPressRecognized:a3];
        }
      }
      else
      {
        BOOL v9 = [(UIPDFAnnotationController *)[(UIPDFPageView *)self->_pdfPageView annotationController] annotationSingleTapRecognized:a3];
      }
      self->_useDelegateForLinks = v9;
      goto LABEL_11;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (void)briefPressRecognized:(id)a3
{
  if (![(UIPDFViewTouchHandler *)self delegateGesture:a3 kind:1])
  {
    objc_msgSend(+[UIPDFViewManager sharedViewManager](UIPDFViewManager, "sharedViewManager"), "makeViewActive:", objc_msgSend(a3, "view"));
    [a3 locationInView:self->_pdfPageView];
    double v6 = v5;
    double v8 = v7;
    switch([a3 state])
    {
      case 1:
        [(UIPDFPageView *)self->_pdfPageView clearSearchHighlights];
        -[UIPDFSelectionController startTracking:showMagnifier:](self->_selectionController, "startTracking:showMagnifier:", &self->_showMagnifier, v6, v8);
        if (self->_showMagnifier)
        {
          [(UIPDFSelectionController *)self->_selectionController initialSelectionPoint];
          -[UIPDFMagnifierController setPosition:viewPoint:](self->_magnifyController, "setPosition:viewPoint:");
          [(UIPDFMagnifierController *)self->_magnifyController showMagnifier];
        }
        self->_trackingSelection = 1;
        break;
      case 2:
        -[UIPDFSelectionController tracking:showMagnifier:](self->_selectionController, "tracking:showMagnifier:", &self->_showMagnifier, v6, v8);
        if (self->_trackingSelection)
        {
          if (!self->_showMagnifier) {
            goto LABEL_18;
          }
          [(UIPDFSelectionController *)self->_selectionController currentSelectionPoint];
          -[UIPDFMagnifierController setPosition:viewPoint:](self->_magnifyController, "setPosition:viewPoint:");
          magnifyController = self->_magnifyController;
          [(UIPDFMagnifierController *)magnifyController move];
        }
        break;
      case 3:
        if (self->_showMagnifier) {
          [(UIPDFMagnifierController *)self->_magnifyController hide];
        }
        -[UIPDFSelectionController endTracking:](self->_selectionController, "endTracking:", v6, v8);
        [(UIPDFViewTouchHandler *)self showMenu];
        break;
      case 4:
        if (self->_showMagnifier)
        {
LABEL_18:
          v10 = self->_magnifyController;
          [(UIPDFMagnifierController *)v10 hide];
        }
        break;
      default:
        return;
    }
  }
}

- (void)longPressRecognized:(id)a3
{
  if ([(UIPDFMagnifierController *)self->_magnifyController visible]
    || ![(UIPDFViewTouchHandler *)self delegateGesture:a3 kind:2])
  {
    objc_msgSend(+[UIPDFViewManager sharedViewManager](UIPDFViewManager, "sharedViewManager"), "makeViewActive:", objc_msgSend(a3, "view"));
    [a3 locationInView:self->_pdfPageView];
    double v6 = v5;
    double v8 = v7;
    char v10 = 0;
    -[UIPDFMagnifierController setPosition:viewPoint:](self->_magnifyController, "setPosition:viewPoint:", v5, v7, v5, v7);
    switch([a3 state])
    {
      case 1:
        [(UIPDFPageView *)self->_pdfPageView clearSearchHighlights];
        [(UIPDFSelectionController *)self->_selectionController clearSelection];
        -[UIPDFSelectionController startTracking:showMagnifier:](self->_selectionController, "startTracking:showMagnifier:", &v10, v6, v8);
        if (v10) {
          [(UIPDFMagnifierController *)self->_magnifyController showLoupe];
        }
        break;
      case 2:
        -[UIPDFSelectionController tracking:showMagnifier:](self->_selectionController, "tracking:showMagnifier:", &self->_showLoupe, v6, v8);
        magnifyController = self->_magnifyController;
        if (!self->_showLoupe) {
          goto LABEL_10;
        }
        [(UIPDFMagnifierController *)magnifyController move];
        break;
      case 3:
        [(UIPDFMagnifierController *)self->_magnifyController hide];
        -[UIPDFSelectionController endTracking:](self->_selectionController, "endTracking:", v6, v8);
        [(UIPDFViewTouchHandler *)self showMenu];
        break;
      case 4:
        magnifyController = self->_magnifyController;
LABEL_10:
        [(UIPDFMagnifierController *)magnifyController hide];
        break;
      default:
        return;
    }
  }
}

- (void)doubleTapRecognized:(id)a3
{
  if ([a3 state] == 3)
  {
    objc_msgSend(+[UIPDFViewManager sharedViewManager](UIPDFViewManager, "sharedViewManager"), "makeViewActive:", objc_msgSend(a3, "view"));
    [a3 locationInView:self->_pdfPageView];
    pdfPageView = self->_pdfPageView;
    -[UIPDFPageView doubleTapAt:](pdfPageView, "doubleTapAt:");
  }
}

- (void)singleTapRecognized:(id)a3
{
  if (![(UIPDFViewTouchHandler *)self delegateGesture:a3 kind:0]
    && [a3 state] == 3)
  {
    objc_msgSend(+[UIPDFViewManager sharedViewManager](UIPDFViewManager, "sharedViewManager"), "makeViewActive:", objc_msgSend(a3, "view"));
    [a3 locationInView:self->_pdfPageView];
    pdfPageView = self->_pdfPageView;
    -[UIPDFPageView singleTapAt:](pdfPageView, "singleTapAt:");
  }
}

- (void)twoFingerTapRecognized:(id)a3
{
  if ([a3 state] == 3)
  {
    objc_msgSend(+[UIPDFViewManager sharedViewManager](UIPDFViewManager, "sharedViewManager"), "makeViewActive:", objc_msgSend(a3, "view"));
    [(UIPDFPageView *)self->_pdfPageView clearSearchHighlights];
    [(UIPDFSelectionController *)self->_selectionController clearSelection];
    [a3 locationOfTouch:0 inView:self->_pdfPageView];
    double v6 = v5;
    double v8 = v7;
    [a3 locationOfTouch:1 inView:self->_pdfPageView];
    -[UIPDFSelectionController startTracking:andPoint:](self->_selectionController, "startTracking:andPoint:", v6, v8, v9, v10);
    selectionController = self->_selectionController;
    -[UIPDFSelectionController endTracking:](selectionController, "endTracking:", v6, v8);
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if (self->_firstTouch)
  {
    [(UIPDFAnnotationController *)[(UIPDFPageView *)self->_pdfPageView annotationController] addLinkAnnotationViews];
    self->_firstTouch = 0;
    self->_useDelegateForLinks = 1;
  }
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  [a3 locationInView:self->_pdfPageView];
  double v6 = v5;
  double v8 = v7;
  double v9 = [(UIPDFPageView *)self->_pdfPageView annotationController];
  if (-[UIPDFAnnotationController willHandleTouchGestureAtPoint:](v9, "willHandleTouchGestureAtPoint:", v6, v8))
  {
    if (self->_useDelegateForLinks)
    {
      BOOL v10 = -[UIPDFAnnotationController isLinkAnnotationAt:](v9, "isLinkAnnotationAt:", v6, v8);
      if (v10)
      {
        LOBYTE(v10) = [(UIPDFAnnotationController *)v9 linkAnnotationShouldBegin:a3];
      }
      return v10;
    }
LABEL_14:
    LOBYTE(v10) = 0;
    return v10;
  }
  if (![(UIPDFPageView *)self->_pdfPageView allowSelection]
    && (self->_briefPressRecognizer == a3 || self->_longPressRecognizer == a3))
  {
    goto LABEL_14;
  }
  if (self->_twoFingerTapRecognizer == a3)
  {
    pdfPageView = self->_pdfPageView;
    LOBYTE(v10) = [(UIPDFPageView *)pdfPageView allowTwoFingerSelection];
  }
  else if (self->_briefPressRecognizer == a3)
  {
    [a3 locationInView:self->_pdfPageView];
    selectionController = self->_selectionController;
    LOBYTE(v10) = -[UIPDFSelectionController shouldTrackAt:](selectionController, "shouldTrackAt:");
  }
  else if (self->_singleTapRecognizer == a3)
  {
    [a3 locationInView:self->_pdfPageView];
    v13 = self->_pdfPageView;
    LOBYTE(v10) = -[UIPDFPageView willDoSomethingWithTap:](v13, "willDoSomethingWithTap:");
  }
  else
  {
    LOBYTE(v10) = 1;
  }
  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (!self->_allowMenu) {
    return 0;
  }
  if (sel_copy_ == a3
    && (double v8 = [(UIPDFPageView *)self->_pdfPageView page], [(UIPDFPage *)v8 selection]))
  {
    Document = CGPDFPageGetDocument([(UIPDFPage *)v8 CGPage]);
    return CGPDFDocumentAllowsCopying(Document);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UIPDFViewTouchHandler;
    return [(UIResponder *)&v10 canPerformAction:a3 withSender:a4];
  }
}

- (void)copy:(id)a3
{
  BOOL v3 = [[(UIPDFPageView *)self->_pdfPageView page] selection];
  [(UIPDFSelection *)v3 copyToPasteboard];
}

- (void)selectAll:(id)a3
{
  [(UIPDFSelectionController *)self->_selectionController extendSelectionToParagraph];
  [(UIPDFPageView *)self->_pdfPageView setNeedsDisplay];
  [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_showMenu selector:0 userInfo:0 repeats:0.4];
  pdfPageView = self->_pdfPageView;
  [(UIPDFPageView *)pdfPageView setNeedsDisplay];
}

- (void)showMenu
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [[(UIPDFPageView *)self->_pdfPageView page] selection];
  if (v3)
  {
    v4 = v3;
    [(UIResponder *)self becomeFirstResponder];
    [(UIPDFSelection *)v4 bounds];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    memset(&v31, 0, sizeof(v31));
    [(UIPDFSelection *)v4 transform];
    CGAffineTransform v30 = v31;
    v34.origin.double x = v6;
    v34.origin.double y = v8;
    v34.size.double width = v10;
    v34.size.double height = v12;
    CGRect v35 = CGRectApplyAffineTransform(v34, &v30);
    -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pdfPageView, "convertRectFromPDFPageSpace:", v35.origin.x, v35.origin.y, v35.size.width, v35.size.height);
    CGRect v37 = CGRectInset(v36, -2.0, -2.0);
    double x = v37.origin.x;
    double y = v37.origin.y;
    double width = v37.size.width;
    double height = v37.size.height;
    [(UIPDFPageView *)self->_pdfPageView delegate];
    if (objc_opt_respondsToSelector())
    {
      v17 = [(UIPDFPageView *)self->_pdfPageView delegate];
      [(UIMenuController *)self->_menuController setMenuItems:[v17 menuItems:MEMORY[0x1E4F1CBF0] forPage:self->_pdfPageView]];
    }
    if (!objc_msgSend(-[UIPDFSelection string](v4, "string"), "length")
      || (id v18 = [(UIPDFSelection *)v4 string],
          !objc_msgSend((id)objc_msgSend(v18, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceAndNewlineCharacterSet")), "length")))
    {
      v19 = [(UIMenuController *)self->_menuController menuItems];
      id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v26 objects:v32 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v27 != v23) {
              objc_enumerationMutation(v19);
            }
            v25 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            if ((char *)[v25 action] != sel_lookupSelection_) {
              [v20 addObject:v25];
            }
          }
          uint64_t v22 = [(NSArray *)v19 countByEnumeratingWithState:&v26 objects:v32 count:16];
        }
        while (v22);
      }
      [(UIMenuController *)self->_menuController setMenuItems:v20];
    }
    -[UIMenuController setTargetRect:inView:](self->_menuController, "setTargetRect:inView:", self->_pdfPageView, x, y, width, height);
    [(UIMenuController *)self->_menuController update];
    [(UIMenuController *)self->_menuController setMenuVisible:1 animated:1];
  }
}

- (BOOL)allowMenu
{
  return self->_allowMenu;
}

- (void)setAllowMenu:(BOOL)a3
{
  self->_allowMenu = a3;
}

@end