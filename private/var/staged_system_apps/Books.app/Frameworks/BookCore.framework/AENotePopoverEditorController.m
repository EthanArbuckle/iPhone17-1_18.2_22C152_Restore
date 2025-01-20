@interface AENotePopoverEditorController
- (AEAnnotation)annotation;
- (AEAnnotationEditorDelegate)delegate;
- (AEAnnotationTheme)annotationTheme;
- (AENoteEditorViewController)noteEditorViewController;
- (AENotePopoverEditorController)init;
- (BOOL)editsOnLaunch;
- (BOOL)popoverControllerShouldDismissPopover:(id)a3;
- (BOOL)preferVerticalPresentation;
- (CGSize)p_popoverSize;
- (IMTheme)theme;
- (UIPopoverController)popoverController;
- (unint64_t)p_permittedArrowDirectionsWithRect:(CGRect)a3 view:(id)a4;
- (void)dealloc;
- (void)hide;
- (void)noteEditorViewControllerDidEndEditing:(id)a3;
- (void)p_didHide;
- (void)p_didShow;
- (void)p_willHide;
- (void)p_willShow;
- (void)popoverControllerDidDismissPopover:(id)a3;
- (void)presentFromRect:(CGRect)a3 view:(id)a4;
- (void)setAnnotation:(id)a3;
- (void)setAnnotationTheme:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditsOnLaunch:(BOOL)a3;
- (void)setNoteEditorViewController:(id)a3;
- (void)setPopoverController:(id)a3;
- (void)setPreferVerticalPresentation:(BOOL)a3;
- (void)setTheme:(id)a3;
@end

@implementation AENotePopoverEditorController

- (AENotePopoverEditorController)init
{
  v8.receiver = self;
  v8.super_class = (Class)AENotePopoverEditorController;
  v2 = [(AENotePopoverEditorController *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(AENoteEditorViewController);
    noteEditorViewController = v2->_noteEditorViewController;
    v2->_noteEditorViewController = v3;

    [(AENoteEditorViewController *)v2->_noteEditorViewController setDelegate:v2];
    v5 = (UIPopoverController *)[objc_alloc((Class)UIPopoverController) initWithContentViewController:v2->_noteEditorViewController];
    popoverController = v2->_popoverController;
    v2->_popoverController = v5;

    [(UIPopoverController *)v2->_popoverController setDelegate:v2];
  }
  return v2;
}

- (void)dealloc
{
  [(AENoteEditorViewController *)self->_noteEditorViewController setDelegate:0];
  [(UIPopoverController *)self->_popoverController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)AENotePopoverEditorController;
  [(AENotePopoverEditorController *)&v3 dealloc];
}

- (void)presentFromRect:(CGRect)a3 view:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  unint64_t v10 = -[AENotePopoverEditorController p_permittedArrowDirectionsWithRect:view:](self, "p_permittedArrowDirectionsWithRect:view:", v9, x, y, width, height);
  if ((v10 & 0xC) != 0)
  {
    v11 = [v9 window];
    [v11 bounds];
    uint64_t v13 = v12;
    CGFloat v15 = v14;
    uint64_t v17 = v16;
    double v19 = v18;

    CGSize size = CGRectZero.size;
    slice.origin = CGRectZero.origin;
    slice.CGSize size = size;
    remainder.origin = slice.origin;
    remainder.CGSize size = size;
    uint64_t v21 = v13;
    size.double width = v15;
    uint64_t v22 = v17;
    double v23 = v19;
    CGRectDivide(*(CGRect *)((char *)&size - 8), &slice, &remainder, v19 * 0.5, CGRectMinYEdge);
    [v9 convertRect:0 fromView:slice.origin.x, slice.origin.y, slice.size.width, slice.size.height];
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    [v9 convertRect:0 fromView:slice.origin.x, slice.origin.y, slice.size.width, slice.size.height];
    CGFloat v39 = v33;
    CGFloat v40 = v32;
    CGFloat v37 = v35;
    CGFloat v38 = v34;
    v43.origin.double x = x;
    v43.origin.double y = y;
    v43.size.double width = width;
    v43.size.double height = height;
    v49.origin.double x = v25;
    v49.origin.double y = v27;
    v49.size.double width = v29;
    v49.size.double height = v31;
    CGRect v44 = CGRectIntersection(v43, v49);
    if (v44.size.height > 0.0)
    {
      v45.origin.double x = x;
      v45.origin.double y = y;
      v45.size.double width = width;
      v45.size.double height = height;
      v50.origin.double y = v39;
      v50.origin.double x = v40;
      v50.size.double height = v37;
      v50.size.double width = v38;
      CGRect v46 = CGRectIntersection(v45, v50);
      if (v46.size.height > 0.0)
      {
        v47.origin.double x = x;
        v47.origin.double y = y;
        v47.size.double width = width;
        v47.size.double height = height;
        v51.origin.double x = v25;
        v51.size.double width = v29;
        v51.origin.double y = v27;
        v51.size.double height = v31;
        CGRect v48 = CGRectIntersection(v47, v51);
        double x = v48.origin.x;
        double y = v48.origin.y;
        double width = v48.size.width;
        double height = v48.size.height;
      }
    }
  }
  [(AENotePopoverEditorController *)self p_willShow];
  v36 = [(AENotePopoverEditorController *)self popoverController];
  [v36 presentPopoverFromRect:v9 inView:v10 permittedArrowDirections:1 x:x y:y width:width height:height];

  [(AENotePopoverEditorController *)self p_didShow];
}

- (void)hide
{
  [(AENotePopoverEditorController *)self p_willHide];
  objc_super v3 = [(AENotePopoverEditorController *)self popoverController];
  [v3 dismissPopoverAnimated:1];

  [(AENotePopoverEditorController *)self p_didHide];
}

- (void)setTheme:(id)a3
{
  v5 = (IMTheme *)a3;
  p_theme = &self->_theme;
  if (self->_theme != v5)
  {
    uint64_t v17 = v5;
    objc_storeStrong((id *)p_theme, a3);
    v7 = [(AENotePopoverEditorController *)self annotation];

    if (v7)
    {
      objc_super v8 = [(AENotePopoverEditorController *)self theme];
      id v9 = [v8 annotationPageTheme];

      unint64_t v10 = [(AENotePopoverEditorController *)self annotation];
      id v11 = [v10 annotationStyle];
      uint64_t v12 = [(AENotePopoverEditorController *)self annotation];
      uint64_t v13 = +[AEAnnotationTheme themeForAnnotationStyle:pageTheme:isUnderline:](AEAnnotationTheme, "themeForAnnotationStyle:pageTheme:isUnderline:", v11, v9, [v12 annotationIsUnderline]);

      if (v13) {
        [(AENotePopoverEditorController *)self setAnnotationTheme:v13];
      }
    }
    theme = self->_theme;
    CGFloat v15 = [(AENotePopoverEditorController *)self noteEditorViewController];
    uint64_t v16 = [v15 textView];
    [(IMTheme *)theme stylizeKeyboard:v16];

    v5 = v17;
  }

  _objc_release_x1(p_theme, v5);
}

- (void)setAnnotationTheme:(id)a3
{
  v5 = (AEAnnotationTheme *)a3;
  p_annotationTheme = &self->_annotationTheme;
  if (self->_annotationTheme != v5)
  {
    double v19 = v5;
    objc_storeStrong((id *)p_annotationTheme, a3);
    v7 = [(AENotePopoverEditorController *)self annotationTheme];
    objc_super v8 = [v7 noteTextColor];
    id v9 = [(AENotePopoverEditorController *)self noteEditorViewController];
    unint64_t v10 = [v9 textView];
    [v10 setTextColor:v8];

    id v11 = [(AENotePopoverEditorController *)self annotationTheme];
    uint64_t v12 = [v11 noteFillColor];
    uint64_t v13 = [(AENotePopoverEditorController *)self popoverController];
    [v13 setBackgroundColor:v12];

    double v14 = [(AENotePopoverEditorController *)self annotationTheme];
    CGFloat v15 = [v14 noteFillColor];
    uint64_t v16 = [(AENotePopoverEditorController *)self popoverController];
    uint64_t v17 = [v16 contentViewController];
    double v18 = [v17 viewIfLoaded];
    [v18 setBackgroundColor:v15];

    v5 = v19;
  }

  _objc_release_x1(p_annotationTheme, v5);
}

- (BOOL)popoverControllerShouldDismissPopover:(id)a3
{
  if (!UIAccessibilityIsVoiceOverRunning() && !UIAccessibilityIsSwitchControlRunning()) {
    [(AENotePopoverEditorController *)self p_willHide];
  }
  return 1;
}

- (void)popoverControllerDidDismissPopover:(id)a3
{
}

- (void)noteEditorViewControllerDidEndEditing:(id)a3
{
  id v4 = a3;
  id v8 = [(AENotePopoverEditorController *)self delegate];
  v5 = [(AENotePopoverEditorController *)self annotation];
  v6 = [v4 textView];

  v7 = [v6 text];
  [v8 editorController:self editedAnnotation:v5 toText:v7];
}

- (void)p_willShow
{
  objc_super v3 = [(AENotePopoverEditorController *)self annotationTheme];
  id v4 = [v3 noteFillColor];
  v5 = [(AENotePopoverEditorController *)self popoverController];
  [v5 setBackgroundColor:v4];

  v6 = [(AENotePopoverEditorController *)self annotationTheme];
  v7 = [v6 noteFillColor];
  id v8 = [(AENotePopoverEditorController *)self popoverController];
  id v9 = [v8 contentViewController];
  unint64_t v10 = [v9 viewIfLoaded];
  [v10 setBackgroundColor:v7];

  id v11 = [(AENotePopoverEditorController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v11 willShowAnnotationEditor:self];
  }
}

- (void)p_didShow
{
  id v4 = [(AENotePopoverEditorController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 didShowAnnotationEditor:self];
  }
  if ([(AENotePopoverEditorController *)self editsOnLaunch])
  {
    objc_super v3 = [(AENotePopoverEditorController *)self noteEditorViewController];
    [v3 beginEditing];
  }
}

- (void)p_willHide
{
  objc_super v3 = [(AENotePopoverEditorController *)self noteEditorViewController];
  [v3 endEditing];

  id v4 = [(AENotePopoverEditorController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 willHideAnnotationEditor:self];
  }
}

- (void)p_didHide
{
  id v3 = [(AENotePopoverEditorController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 didHideAnnotationEditor:self];
  }
}

- (unint64_t)p_permittedArrowDirectionsWithRect:(CGRect)a3 view:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  unsigned int v10 = [(AENotePopoverEditorController *)self preferVerticalPresentation];
  [(AENotePopoverEditorController *)self p_popoverSize];
  double v12 = v11;
  double v14 = v13;
  v46.origin.CGFloat x = x;
  v46.origin.CGFloat y = y;
  v46.size.CGFloat width = width;
  v46.size.CGFloat height = height;
  double v43 = CGRectGetMinY(v46) - v14;
  v47.origin.CGFloat x = x;
  v47.origin.CGFloat y = y;
  v47.size.CGFloat width = width;
  v47.size.CGFloat height = height;
  double v41 = v14 + CGRectGetMaxY(v47);
  v48.origin.CGFloat x = x;
  v48.origin.CGFloat y = y;
  v48.size.CGFloat width = width;
  v48.size.CGFloat height = height;
  double v44 = CGRectGetMinX(v48) - v12;
  v49.origin.CGFloat x = x;
  v49.origin.CGFloat y = y;
  v49.size.CGFloat width = width;
  v49.size.CGFloat height = height;
  double v45 = v12 + CGRectGetMaxX(v49);
  CGFloat v15 = [(AENotePopoverEditorController *)self noteEditorViewController];
  uint64_t v16 = [v15 bc_windowForViewController];
  uint64_t v17 = [v16 windowScene];
  double v18 = (char *)[v17 interfaceOrientation];

  p_CGFloat y = &CGRectZero.origin.y;
  p_CGFloat height = &CGRectZero.size.height;
  p_CGSize size = &CGRectZero.size;
  double v22 = CGRectZero.origin.x;
  if ((unint64_t)(v18 - 1) <= 3)
  {
    p_CGFloat height = (CGFloat *)((char *)&unk_2A2740 + 8 * (void)(v18 - 1));
    p_CGSize size = (CGSize *)((char *)&unk_2A2760 + 8 * (void)(v18 - 1));
    p_CGFloat y = (CGFloat *)((char *)&unk_2A2780 + 8 * (void)(v18 - 1));
    double v22 = 0.0;
  }
  [v9 convertRect:0 fromView:v22 *p_y p_size->width *p_height *(void *)&v41];
  double v23 = CGRectGetMinY(v50) + -10.0;
  v51.origin.CGFloat x = x;
  v51.origin.CGFloat y = y;
  v51.size.CGFloat width = width;
  v51.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v51);
  double v25 = v23 + -28.5 + -17.5;
  [v9 frame:v44];
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;

  v52.origin.CGFloat x = v27;
  v52.origin.CGFloat y = v29;
  v52.size.CGFloat width = v31;
  v52.size.CGFloat height = v33;
  BOOL v34 = v45 <= CGRectGetWidth(v52) + -10.0;
  BOOL v35 = MinY <= v25 && v44 >= 10.0;
  if (MinY > v25) {
    BOOL v34 = 0;
  }
  if (v10)
  {
    double v36 = v43;
    if (v43 < 10.0 && v42 > v23) {
      goto LABEL_11;
    }
    return (v42 <= v23) | (2 * (v36 >= 10.0));
  }
  double v36 = v43;
  if (!v35 && !v34) {
    return (v42 <= v23) | (2 * (v36 >= 10.0));
  }
LABEL_11:
  BOOL v37 = !v34;
  uint64_t v38 = 4;
  if (v37) {
    uint64_t v38 = 0;
  }
  BOOL v37 = !v35;
  uint64_t v39 = 8;
  if (v37) {
    uint64_t v39 = 0;
  }
  return v38 | v39;
}

- (CGSize)p_popoverSize
{
  v2 = [(AENotePopoverEditorController *)self noteEditorViewController];
  [v2 preferredContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v6 + 13.0;
  double v8 = v4;
  result.CGFloat height = v7;
  result.CGFloat width = v8;
  return result;
}

- (AEAnnotationEditorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AEAnnotationEditorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AEAnnotation)annotation
{
  return self->_annotation;
}

- (void)setAnnotation:(id)a3
{
}

- (AEAnnotationTheme)annotationTheme
{
  return self->_annotationTheme;
}

- (IMTheme)theme
{
  return self->_theme;
}

- (BOOL)editsOnLaunch
{
  return self->_editsOnLaunch;
}

- (void)setEditsOnLaunch:(BOOL)a3
{
  self->_editsOnLaunch = a3;
}

- (BOOL)preferVerticalPresentation
{
  return self->_preferVerticalPresentation;
}

- (void)setPreferVerticalPresentation:(BOOL)a3
{
  self->_preferVerticalPresentation = a3;
}

- (AENoteEditorViewController)noteEditorViewController
{
  return self->_noteEditorViewController;
}

- (void)setNoteEditorViewController:(id)a3
{
}

- (UIPopoverController)popoverController
{
  return self->_popoverController;
}

- (void)setPopoverController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popoverController, 0);
  objc_storeStrong((id *)&self->_noteEditorViewController, 0);
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong((id *)&self->_annotationTheme, 0);
  objc_storeStrong((id *)&self->_annotation, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end