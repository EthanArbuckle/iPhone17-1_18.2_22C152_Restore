@interface AEAnnotationPopoverViewController
- (AEAnnotation)annotation;
- (AEAnnotationEditorDelegate)delegate;
- (AEAnnotationPopoverViewController)init;
- (AEAnnotationTheme)annotationTheme;
- (BOOL)canPresentInPosition:(int)a3;
- (BOOL)editsOnLaunch;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CGRect)p_containerFrameForView:(id)a3;
- (CGRect)presentationRect;
- (UIView)presentationView;
- (int)position;
- (int)willPresentInPosition:(CGRect)a3 view:(id)a4;
- (void)dealloc;
- (void)didHide;
- (void)didShow;
- (void)hide;
- (void)presentFromRect:(CGRect)a3 view:(id)a4;
- (void)setAnnotation:(id)a3;
- (void)setAnnotationTheme:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditsOnLaunch:(BOOL)a3;
- (void)setPosition:(int)a3;
- (void)setPresentationRect:(CGRect)a3;
- (void)setPresentationView:(id)a3;
- (void)viewDidLoad;
- (void)viewDidUnload;
- (void)willHide;
- (void)willShow;
@end

@implementation AEAnnotationPopoverViewController

- (AEAnnotationPopoverViewController)init
{
  v4.receiver = self;
  v4.super_class = (Class)AEAnnotationPopoverViewController;
  result = [(AEAnnotationPopoverViewController *)&v4 init];
  if (result)
  {
    CGSize size = CGRectNull.size;
    result->_presentationRect.origin = CGRectNull.origin;
    result->_presentationRect.CGSize size = size;
  }
  return result;
}

- (void)dealloc
{
  [(AEAnnotationPopoverViewController *)self releaseOutlets];
  v3.receiver = self;
  v3.super_class = (Class)AEAnnotationPopoverViewController;
  [(AEAnnotationPopoverViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)AEAnnotationPopoverViewController;
  [(AEAnnotationPopoverViewController *)&v4 viewDidLoad];
  objc_super v3 = [(AEAnnotationPopoverViewController *)self view];
  [v3 setUserInteractionEnabled:1];
}

- (void)viewDidUnload
{
  v3.receiver = self;
  v3.super_class = (Class)AEAnnotationPopoverViewController;
  [(AEAnnotationPopoverViewController *)&v3 viewDidUnload];
  [(AEAnnotationPopoverViewController *)self releaseOutlets];
}

- (BOOL)canPresentInPosition:(int)a3
{
  return a3 == 0;
}

- (CGRect)p_containerFrameForView:(id)a3
{
  id v4 = a3;
  if ([(AEAnnotationPopoverViewController *)self im_isCompactHeight]) {
    double v5 = 12.0;
  }
  else {
    double v5 = 44.0;
  }
  [v4 frame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v16.origin.x = v7;
  v16.origin.y = v9;
  v16.size.width = v11;
  v16.size.height = v13;
  CGRect result = CGRectInset(v16, 20.0, 20.0);
  double v14 = v5 + result.origin.y;
  double v15 = result.size.height - v5;
  result.size.height = v15;
  result.origin.y = v14;
  return result;
}

- (int)willPresentInPosition:(CGRect)a3 view:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  double v10 = [(AEAnnotationPopoverViewController *)self view];
  [v10 bounds];
  CGFloat v29 = v12;
  CGFloat v30 = v11;
  CGFloat v27 = v14;
  CGFloat v28 = v13;

  [(AEAnnotationPopoverViewController *)self p_containerFrameForView:v9];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  v31.origin.CGFloat x = v16;
  v31.origin.CGFloat y = v18;
  v31.size.CGFloat width = v20;
  v31.size.CGFloat height = v22;
  double MinY = CGRectGetMinY(v31);
  v32.origin.CGFloat y = v29;
  v32.origin.CGFloat x = v30;
  v32.size.CGFloat height = v27;
  v32.size.CGFloat width = v28;
  CGFloat v24 = MinY + CGRectGetHeight(v32) + 2.0;
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  CGRectGetMinX(v33);
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  CGRectGetWidth(v34);
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  if (CGRectGetMinY(v35) >= v24) {
    return 0;
  }
  int v25 = 1;
  if (![(AEAnnotationPopoverViewController *)self canPresentInPosition:1]) {
    return 0;
  }
  return v25;
}

- (void)presentFromRect:(CGRect)a3 view:(id)a4
{
  id v5 = a4;
  [(AEAnnotationPopoverViewController *)self setPresentationView:v5];
  double v6 = [(AEAnnotationPopoverViewController *)self view];
  [v6 setAlpha:0.0];

  CGFloat v7 = [(AEAnnotationPopoverViewController *)self view];
  [v7 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  [(AEAnnotationPopoverViewController *)self p_containerFrameForView:v5];
  CGFloat x = v59.origin.x;
  CGFloat y = v59.origin.y;
  CGFloat width = v59.size.width;
  CGFloat height = v59.size.height;
  double MinX = CGRectGetMinX(v59);
  CGFloat rect = v9;
  v60.origin.CGFloat x = v9;
  v60.origin.CGFloat y = v11;
  v60.size.CGFloat width = v13;
  v60.size.CGFloat height = v15;
  double v52 = MinX + CGRectGetWidth(v60) * 0.5 + 2.0;
  v61.origin.CGFloat x = x;
  v61.origin.CGFloat y = y;
  v61.size.CGFloat width = width;
  v61.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v61);
  v62.origin.CGFloat x = v9;
  v62.origin.CGFloat y = v11;
  v62.size.CGFloat width = v13;
  v62.size.CGFloat height = v15;
  double v50 = MaxX - (CGRectGetWidth(v62) * 0.5 + 2.0);
  v63.origin.CGFloat x = x;
  v63.origin.CGFloat y = y;
  v63.size.CGFloat width = width;
  v63.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v63);
  v64.origin.CGFloat x = rect;
  CGFloat v48 = v11;
  v64.origin.CGFloat y = v11;
  v64.size.CGFloat width = v13;
  CGFloat v47 = v15;
  v64.size.CGFloat height = v15;
  double v21 = MinY + CGRectGetHeight(v64) + 2.0;
  CGFloat v46 = x;
  v65.origin.CGFloat x = x;
  v65.origin.CGFloat y = y;
  v65.size.CGFloat width = width;
  v65.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v65);
  double v23 = CGRectGetMinX(a3);
  double v24 = v23 + CGRectGetWidth(a3) * 0.5;
  double v25 = CGRectGetMinY(a3);
  if (v25 < v21 && [(AEAnnotationPopoverViewController *)self canPresentInPosition:1])
  {
    [(AEAnnotationPopoverViewController *)self setPosition:1];
    double v25 = CGRectGetMaxY(a3);
    v66.origin.CGFloat x = v46;
    v66.origin.CGFloat y = y;
    v66.size.CGFloat width = width;
    v66.size.CGFloat height = height;
    double v21 = CGRectGetMinY(v66) + 2.0;
    v67.origin.CGFloat x = v46;
    v67.origin.CGFloat y = y;
    v67.size.CGFloat width = width;
    v67.size.CGFloat height = height;
    double v26 = CGRectGetMaxY(v67);
    v68.origin.CGFloat x = rect;
    v68.size.CGFloat width = v13;
    v68.origin.CGFloat y = v48;
    v68.size.CGFloat height = v47;
    double MaxY = v26 - CGRectGetHeight(v68);
  }
  else
  {
    [(AEAnnotationPopoverViewController *)self setPosition:0];
  }
  double v27 = MaxY + -2.0;
  double v28 = v50;
  if (v24 <= v50) {
    double v28 = v24;
  }
  if (v24 >= v52) {
    double v29 = v28;
  }
  else {
    double v29 = v52;
  }
  if (v25 <= v27) {
    double v27 = v25;
  }
  if (v25 >= v21) {
    double v30 = v27;
  }
  else {
    double v30 = v21;
  }
  -[AEAnnotationPopoverViewController setPresentationRect:](self, "setPresentationRect:", v29 + -1.0, v30 + -1.0, 2.0, 2.0);
  unsigned int v31 = [(AEAnnotationPopoverViewController *)self position];
  CGRect v32 = [(AEAnnotationPopoverViewController *)self view];
  CGRect v33 = [v32 layer];
  CGRect v34 = v33;
  double v35 = 0.0;
  if (v31 != 1) {
    double v35 = 1.0;
  }
  [v33 setAnchorPoint:0.5, v35];

  v36 = [(AEAnnotationPopoverViewController *)self view];
  [v36 setCenter:v29, v30];

  v37 = [(AEAnnotationPopoverViewController *)self view];
  [v37 frame];
  CGRect v70 = CGRectIntegral(v69);
  double v38 = v70.origin.x;
  double v39 = v70.origin.y;
  double v40 = v70.size.width;
  double v41 = v70.size.height;
  v42 = [(AEAnnotationPopoverViewController *)self view];
  [v42 setFrame:v38, v39, v40, v41];

  v43 = [(AEAnnotationPopoverViewController *)self view];
  [v5 addSubview:v43];

  v44 = [v5 window];
  [v44 setUserInteractionEnabled:0];

  [(AEAnnotationPopoverViewController *)self willShow];
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_53F24;
  v58[3] = &unk_2C3C50;
  v58[4] = self;
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_53F6C;
  v55[3] = &unk_2C40E8;
  id v56 = v5;
  v57 = self;
  id v45 = v5;
  +[UIView animateWithDuration:v58 animations:v55 completion:0.15];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(AEAnnotationPopoverViewController *)self view];
  [v5 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  double v14 = [(AEAnnotationPopoverViewController *)self view];
  [v4 locationInView:v14];
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  v21.origin.CGFloat x = v7;
  v21.origin.CGFloat y = v9;
  v21.size.CGFloat width = v11;
  v21.size.CGFloat height = v13;
  v20.CGFloat x = v16;
  v20.CGFloat y = v18;
  LOBYTE(v4) = !CGRectContainsPoint(v21, v20);

  return (char)v4;
}

- (void)willShow
{
  id v3 = [(AEAnnotationPopoverViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 willShowAnnotationEditor:self];
  }
}

- (void)didShow
{
  id v3 = [AETouchOutsideViewGestureRecognizer alloc];
  id v4 = [(AEAnnotationPopoverViewController *)self view];
  id v5 = [(AETouchOutsideViewGestureRecognizer *)v3 initWithTarget:self action:"hide" watchView:v4];
  mHideOnTouchGestureRecognizer = self->mHideOnTouchGestureRecognizer;
  self->mHideOnTouchGestureRecognizer = v5;

  CGFloat v7 = [(AEAnnotationPopoverViewController *)self view];
  double v8 = [v7 superview];
  [v8 addGestureRecognizer:self->mHideOnTouchGestureRecognizer];

  CGFloat v9 = +[NSNotificationCenter defaultCenter];
  double v10 = AEAnnotationPopoverShouldHideNotification;
  CGFloat v11 = +[NSOperationQueue mainQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_54278;
  v15[3] = &unk_2C5940;
  v15[4] = self;
  double v12 = [v9 addObserverForName:v10 object:0 queue:v11 usingBlock:v15];
  id mObserver = self->mObserver;
  self->id mObserver = v12;

  double v14 = [(AEAnnotationPopoverViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v14 didShowAnnotationEditor:self];
  }
}

- (void)willHide
{
  id v3 = [(AETouchOutsideViewGestureRecognizer *)self->mHideOnTouchGestureRecognizer view];
  [v3 removeGestureRecognizer:self->mHideOnTouchGestureRecognizer];

  mHideOnTouchGestureRecognizer = self->mHideOnTouchGestureRecognizer;
  self->mHideOnTouchGestureRecognizer = 0;

  if (self->mObserver)
  {
    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 removeObserver:self->mObserver name:AEAnnotationPopoverShouldHideNotification object:0];

    id mObserver = self->mObserver;
    self->id mObserver = 0;
  }
  id v7 = [(AEAnnotationPopoverViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 willHideAnnotationEditor:self];
  }
}

- (void)didHide
{
  v2 = self;
  id v4 = [(AEAnnotationPopoverViewController *)v2 delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 didHideAnnotationEditor:v2];
  }
  -[AEAnnotationPopoverViewController setPresentationRect:](v2, "setPresentationRect:", CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
  [(AEAnnotationPopoverViewController *)v2 setPresentationView:0];
  id v3 = self;
}

- (void)hide
{
  if (self->mHideOnTouchGestureRecognizer)
  {
    [(AEAnnotationPopoverViewController *)self willHide];
    id v3 = [(AEAnnotationPopoverViewController *)self view];
    [v3 setUserInteractionEnabled:0];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_54538;
    v10[3] = &unk_2C3C50;
    id v11 = v3;
    id v5 = _NSConcreteStackBlock;
    uint64_t v6 = 3221225472;
    id v7 = sub_54544;
    double v8 = &unk_2C5968;
    id v9 = v11;
    id v4 = v11;
    +[UIView animateWithDuration:v10 animations:&v5 completion:0.2];
    [(AEAnnotationPopoverViewController *)self didHide];
  }
}

- (AEAnnotation)annotation
{
  return self->mAnnotation;
}

- (void)setAnnotation:(id)a3
{
}

- (AEAnnotationTheme)annotationTheme
{
  return self->mAnnotationTheme;
}

- (void)setAnnotationTheme:(id)a3
{
}

- (int)position
{
  return self->mPosition;
}

- (void)setPosition:(int)a3
{
  self->mPosition = a3;
}

- (CGRect)presentationRect
{
  double x = self->_presentationRect.origin.x;
  double y = self->_presentationRect.origin.y;
  double width = self->_presentationRect.size.width;
  double height = self->_presentationRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPresentationRect:(CGRect)a3
{
  self->_presentationRect = a3;
}

- (UIView)presentationView
{
  return self->_presentationView;
}

- (void)setPresentationView:(id)a3
{
}

- (BOOL)editsOnLaunch
{
  return self->_editsOnLaunch;
}

- (void)setEditsOnLaunch:(BOOL)a3
{
  self->_editsOnLaunch = a3;
}

- (AEAnnotationEditorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AEAnnotationEditorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_presentationView, 0);
  objc_storeStrong(&self->mObserver, 0);
  objc_storeStrong((id *)&self->mAnnotationTheme, 0);
  objc_storeStrong((id *)&self->mAnnotation, 0);

  objc_storeStrong((id *)&self->mHideOnTouchGestureRecognizer, 0);
}

@end