@interface DBSArrangementLayoutViewController
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CGPoint)unitDragPoint;
- (CGSize)externalDisplaySize;
- (CGSize)nativeDisplaySize;
- (DBSArrangementLayoutViewController)initWithNativeDisplaySize:(CGSize)a3 nativeDisplayName:(id)a4 externalDisplaySize:(CGSize)a5 externalDisplayName:(id)a6 currentNativeDisplayLocation:(unint64_t)a7;
- (DBSArrangementLayoutViewControllerDelegate)delegate;
- (DBSNativeDisplayIconView)dragView;
- (NSString)externalDisplayName;
- (NSString)nativeDisplayName;
- (UIPanGestureRecognizer)dragGestureRecognizer;
- (UITapGestureRecognizer)tapGestureRecogniser;
- (id)currentDisplayIconView;
- (id)nativeDisplayImageWithWidth:(double)a3;
- (unint64_t)nativeDisplayLocation;
- (void)didDrag:(id)a3;
- (void)didTap:(id)a3;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setDragGestureRecognizer:(id)a3;
- (void)setDragView:(id)a3;
- (void)setExternalDisplayName:(id)a3;
- (void)setExternalDisplaySize:(CGSize)a3;
- (void)setNativeDisplayLocation:(unint64_t)a3;
- (void)setNativeDisplayName:(id)a3;
- (void)setNativeDisplaySize:(CGSize)a3;
- (void)setTapGestureRecogniser:(id)a3;
- (void)setUnitDragPoint:(CGPoint)a3;
- (void)updateCurrentDisplayLocation:(unint64_t)a3;
- (void)updateOrientationTo:(int64_t)a3 withNativeDisplaySize:(CGSize)a4;
@end

@implementation DBSArrangementLayoutViewController

- (DBSArrangementLayoutViewController)initWithNativeDisplaySize:(CGSize)a3 nativeDisplayName:(id)a4 externalDisplaySize:(CGSize)a5 externalDisplayName:(id)a6 currentNativeDisplayLocation:(unint64_t)a7
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  CGFloat v12 = a3.height;
  CGFloat v13 = a3.width;
  id v15 = a4;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)DBSArrangementLayoutViewController;
  v17 = [(DBSArrangementLayoutViewController *)&v20 init];
  v18 = v17;
  if (v17)
  {
    v17->_nativeDisplaySize.CGFloat width = v13;
    v17->_nativeDisplaySize.CGFloat height = v12;
    objc_storeStrong((id *)&v17->_nativeDisplayName, a4);
    v18->_externalDisplaySize.CGFloat width = width;
    v18->_externalDisplaySize.CGFloat height = height;
    objc_storeStrong((id *)&v18->_externalDisplayName, a6);
    v18->_nativeDisplayLocation = a7;
  }

  return v18;
}

- (void)updateCurrentDisplayLocation:(unint64_t)a3
{
  if (self->_nativeDisplayLocation != a3)
  {
    self->_nativeDisplayLocation = a3;
    id v4 = [(DBSArrangementLayoutViewController *)self view];
    [v4 placeCurrentDisplayAtLocation:a3];
  }
}

- (id)nativeDisplayImageWithWidth:(double)a3
{
  id v4 = [(DBSArrangementLayoutViewController *)self delegate];
  v5 = [v4 nativeDisplayImageWithWidth:a3];

  return v5;
}

- (void)loadView
{
  v18 = [[DBSArrangementLayoutView alloc] initWithDataSource:self];
  [(DBSArrangementLayoutViewController *)self setView:v18];
  [(DBSArrangementLayoutView *)v18 setDataSource:self];
  v3 = (void *)[objc_alloc(MEMORY[0x263F82A00]) initWithTarget:self action:sel_didDrag_];
  id v4 = [(DBSArrangementLayoutViewController *)self view];
  [v4 addGestureRecognizer:v3];

  [v3 setDelegate:self];
  [(DBSArrangementLayoutViewController *)self setDragGestureRecognizer:v3];
  v5 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_didTap_];
  v6 = [(DBSArrangementLayoutViewController *)self view];
  [v6 addGestureRecognizer:v5];

  [v5 setDelegate:self];
  [(DBSArrangementLayoutViewController *)self setTapGestureRecogniser:v5];
  v7 = [(DBSArrangementLayoutViewController *)self view];
  objc_msgSend(v7, "placeCurrentDisplayAtLocation:", -[DBSArrangementLayoutViewController nativeDisplayLocation](self, "nativeDisplayLocation"));

  v8 = [DBSNativeDisplayIconView alloc];
  v9 = [(DBSArrangementLayoutViewController *)self nativeDisplayName];
  v10 = -[DBSNativeDisplayIconView initWithFrame:displayName:](v8, "initWithFrame:displayName:", v9, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(DBSArrangementLayoutViewController *)self setDragView:v10];

  v11 = [(DBSArrangementLayoutViewController *)self dragView];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:1];

  CGFloat v12 = [(DBSArrangementLayoutViewController *)self dragView];
  [v12 setIsCurrentDisplayLocation:1];

  CGFloat v13 = [(DBSArrangementLayoutView *)v18 northDisplay];
  v14 = [v13 imageView];
  id v15 = [v14 image];
  id v16 = [(DBSArrangementLayoutViewController *)self dragView];
  v17 = [v16 imageView];
  [v17 setImage:v15];
}

- (void)didDrag:(id)a3
{
  id v58 = a3;
  id v4 = [(DBSArrangementLayoutViewController *)self currentDisplayIconView];
  if ([v58 state] == 1)
  {
    [v4 frame];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v13 = [(DBSArrangementLayoutViewController *)self dragView];
    v14 = [v13 superview];

    if (!v14)
    {
      id v15 = [(DBSArrangementLayoutViewController *)self arrangementView];
      id v16 = [v15 northDisplay];
      v17 = [v16 imageView];
      v18 = [v17 image];
      v19 = [(DBSArrangementLayoutViewController *)self dragView];
      objc_super v20 = [v19 imageView];
      [v20 setImage:v18];

      v21 = [(DBSArrangementLayoutViewController *)self view];
      v22 = [(DBSArrangementLayoutViewController *)self dragView];
      [v21 addSubview:v22];
    }
    [v58 locationInView:v4];
    double v24 = v23;
    double v26 = v25;
    v60.origin.x = v6;
    v60.origin.y = v8;
    v60.size.CGFloat width = v10;
    v60.size.CGFloat height = v12;
    double v27 = v24 / CGRectGetWidth(v60);
    v61.origin.x = v6;
    v61.origin.y = v8;
    v61.size.CGFloat width = v10;
    v61.size.CGFloat height = v12;
    -[DBSArrangementLayoutViewController setUnitDragPoint:](self, "setUnitDragPoint:", v27, v26 / CGRectGetHeight(v61));
    [v4 frame];
    -[DBSNativeDisplayIconView setFrame:](self->_dragView, "setFrame:");
    v28 = [(DBSArrangementLayoutViewController *)self currentDisplayIconView];
    [v28 setIsCurrentDisplayLocation:0];
    goto LABEL_9;
  }
  if ([v58 state] == 2)
  {
    [(DBSNativeDisplayIconView *)self->_dragView frame];
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    v37 = [(DBSArrangementLayoutViewController *)self view];
    [v58 locationInView:v37];
    double v39 = v38;
    double v41 = v40;

    [(DBSArrangementLayoutViewController *)self unitDragPoint];
    double v43 = v42;
    v62.origin.x = v30;
    v62.origin.y = v32;
    v62.size.CGFloat width = v34;
    v62.size.CGFloat height = v36;
    double v44 = v39 - v43 * CGRectGetWidth(v62);
    [(DBSArrangementLayoutViewController *)self unitDragPoint];
    double v46 = v45;
    v63.origin.x = v30;
    v63.origin.y = v32;
    v63.size.CGFloat width = v34;
    v63.size.CGFloat height = v36;
    double v47 = v41 - v46 * CGRectGetHeight(v63);
    v64.origin.x = v30;
    v64.origin.y = v32;
    v64.size.CGFloat width = v34;
    v64.size.CGFloat height = v36;
    double Width = CGRectGetWidth(v64);
    v65.origin.x = v30;
    v65.origin.y = v32;
    v65.size.CGFloat width = v34;
    v65.size.CGFloat height = v36;
    -[DBSNativeDisplayIconView setFrame:](self->_dragView, "setFrame:", v44, v47, Width, CGRectGetHeight(v65));
    goto LABEL_10;
  }
  if ([v58 state] == 3)
  {
    -[DBSArrangementLayoutViewController setUnitDragPoint:](self, "setUnitDragPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
    v49 = [(DBSArrangementLayoutViewController *)self arrangementView];
    v50 = [(DBSArrangementLayoutViewController *)self dragView];
    [v50 frame];
    double MidX = CGRectGetMidX(v66);
    v52 = [(DBSArrangementLayoutViewController *)self dragView];
    [v52 frame];
    uint64_t v53 = objc_msgSend(v49, "displayLocationForPointInView:", MidX, CGRectGetMidY(v67));

    v54 = [(DBSArrangementLayoutViewController *)self dragView];
    [v54 removeFromSuperview];

    [(DBSArrangementLayoutViewController *)self setNativeDisplayLocation:v53];
    v55 = [(DBSArrangementLayoutViewController *)self arrangementView];
    [v55 placeCurrentDisplayAtLocation:v53];

    v28 = [(DBSArrangementLayoutViewController *)self delegate];
    [v28 nativeDisplayLocationDidChange:v53];
LABEL_9:

    goto LABEL_10;
  }
  if ([v58 state] == 4)
  {
    -[DBSArrangementLayoutViewController setUnitDragPoint:](self, "setUnitDragPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
    v56 = [(DBSArrangementLayoutViewController *)self dragView];
    [v56 removeFromSuperview];

    v57 = [(DBSArrangementLayoutViewController *)self arrangementView];
    objc_msgSend(v57, "placeCurrentDisplayAtLocation:", -[DBSArrangementLayoutViewController nativeDisplayLocation](self, "nativeDisplayLocation"));
  }
LABEL_10:
}

- (void)didTap:(id)a3
{
  id v4 = a3;
  id v48 = [(DBSArrangementLayoutViewController *)self arrangementView];
  [v4 locationInView:v48];
  CGFloat v6 = v5;
  CGFloat v8 = v7;

  double v9 = [v48 northDisplay];
  [v9 bounds];
  objc_msgSend(v9, "convertRect:toView:", v48);
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  v18 = [v48 eastDisplay];
  [v18 bounds];
  objc_msgSend(v18, "convertRect:toView:", v48);
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v46 = v24;
  CGFloat v47 = v23;
  double v25 = [v48 southDisplay];
  [v25 bounds];
  objc_msgSend(v25, "convertRect:toView:", v48);
  CGFloat v44 = v27;
  CGFloat v45 = v26;
  CGFloat v42 = v29;
  CGFloat v43 = v28;
  CGFloat v30 = [v48 westDisplay];
  [v30 bounds];
  objc_msgSend(v30, "convertRect:toView:", v48);
  CGFloat v40 = v32;
  CGFloat v41 = v31;
  CGFloat v38 = v34;
  CGFloat v39 = v33;
  unint64_t v35 = [(DBSArrangementLayoutViewController *)self nativeDisplayLocation];
  v54.origin.x = v11;
  v54.origin.y = v13;
  v54.size.CGFloat width = v15;
  v54.size.CGFloat height = v17;
  v50.x = v6;
  v50.y = v8;
  if (CGRectContainsPoint(v54, v50))
  {
    unint64_t v35 = 0;
  }
  else
  {
    v55.origin.x = v20;
    v55.origin.y = v22;
    v55.size.CGFloat height = v46;
    v55.size.CGFloat width = v47;
    v51.x = v6;
    v51.y = v8;
    if (CGRectContainsPoint(v55, v51))
    {
      unint64_t v35 = 1;
    }
    else
    {
      v56.origin.y = v44;
      v56.origin.x = v45;
      v56.size.CGFloat height = v42;
      v56.size.CGFloat width = v43;
      v52.x = v6;
      v52.y = v8;
      if (CGRectContainsPoint(v56, v52))
      {
        unint64_t v35 = 2;
      }
      else
      {
        v57.origin.y = v40;
        v57.origin.x = v41;
        v57.size.CGFloat height = v38;
        v57.size.CGFloat width = v39;
        v53.x = v6;
        v53.y = v8;
        if (CGRectContainsPoint(v57, v53)) {
          unint64_t v35 = 3;
        }
      }
    }
  }
  [(DBSArrangementLayoutViewController *)self setNativeDisplayLocation:v35];
  CGFloat v36 = [(DBSArrangementLayoutViewController *)self arrangementView];
  [v36 placeCurrentDisplayAtLocation:v35];

  v37 = [(DBSArrangementLayoutViewController *)self delegate];
  [v37 nativeDisplayLocationDidChange:v35];
}

- (id)currentDisplayIconView
{
  switch([(DBSArrangementLayoutViewController *)self nativeDisplayLocation])
  {
    case 0uLL:
      v3 = [(DBSArrangementLayoutViewController *)self arrangementView];
      uint64_t v4 = [v3 northDisplay];
      goto LABEL_7;
    case 1uLL:
      v3 = [(DBSArrangementLayoutViewController *)self arrangementView];
      uint64_t v4 = [v3 eastDisplay];
      goto LABEL_7;
    case 2uLL:
      v3 = [(DBSArrangementLayoutViewController *)self arrangementView];
      uint64_t v4 = [v3 southDisplay];
      goto LABEL_7;
    case 3uLL:
      v3 = [(DBSArrangementLayoutViewController *)self arrangementView];
      uint64_t v4 = [v3 westDisplay];
LABEL_7:
      double v5 = (void *)v4;

      break;
    default:
      double v5 = 0;
      break;
  }
  return v5;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(DBSArrangementLayoutViewController *)self dragGestureRecognizer];

  if (v5 == v4)
  {
    CGFloat v13 = [(DBSArrangementLayoutViewController *)self currentDisplayIconView];
    [v4 locationInView:v13];
    CGFloat v9 = v14;
    CGFloat v11 = v15;
    double v12 = v13;
  }
  else
  {
    id v6 = [(DBSArrangementLayoutViewController *)self tapGestureRecogniser];

    if (v6 != v4)
    {
LABEL_7:
      BOOL v17 = 0;
      goto LABEL_8;
    }
    double v7 = [(DBSArrangementLayoutViewController *)self arrangementView];
    [v4 locationInView:v7];
    CGFloat v9 = v8;
    CGFloat v11 = v10;

    double v12 = [(DBSArrangementLayoutViewController *)self arrangementView];
    CGFloat v13 = v12;
  }
  [v12 bounds];
  v19.x = v9;
  v19.y = v11;
  BOOL v16 = CGRectContainsPoint(v20, v19);

  if (!v16) {
    goto LABEL_7;
  }
  BOOL v17 = 1;
LABEL_8:

  return v17;
}

- (void)updateOrientationTo:(int64_t)a3 withNativeDisplaySize:(CGSize)a4
{
  -[DBSArrangementLayoutViewController setNativeDisplaySize:](self, "setNativeDisplaySize:", a4.width, a4.height);
  id v6 = [(DBSArrangementLayoutViewController *)self arrangementView];
  [v6 updateForOrientation:a3];
}

- (DBSArrangementLayoutViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)nativeDisplayLocation
{
  return self->_nativeDisplayLocation;
}

- (void)setNativeDisplayLocation:(unint64_t)a3
{
  self->_nativeDisplayLocation = a3;
}

- (CGSize)nativeDisplaySize
{
  double width = self->_nativeDisplaySize.width;
  double height = self->_nativeDisplaySize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setNativeDisplaySize:(CGSize)a3
{
  self->_nativeDisplaySize = a3;
}

- (CGSize)externalDisplaySize
{
  double width = self->_externalDisplaySize.width;
  double height = self->_externalDisplaySize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setExternalDisplaySize:(CGSize)a3
{
  self->_externalDisplaySize = a3;
}

- (NSString)nativeDisplayName
{
  return self->_nativeDisplayName;
}

- (void)setNativeDisplayName:(id)a3
{
}

- (NSString)externalDisplayName
{
  return self->_externalDisplayName;
}

- (void)setExternalDisplayName:(id)a3
{
}

- (UIPanGestureRecognizer)dragGestureRecognizer
{
  return self->_dragGestureRecognizer;
}

- (void)setDragGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)tapGestureRecogniser
{
  return self->_tapGestureRecogniser;
}

- (void)setTapGestureRecogniser:(id)a3
{
}

- (DBSNativeDisplayIconView)dragView
{
  return self->_dragView;
}

- (void)setDragView:(id)a3
{
}

- (CGPoint)unitDragPoint
{
  double x = self->_unitDragPoint.x;
  double y = self->_unitDragPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setUnitDragPoint:(CGPoint)a3
{
  self->_unitDragPoint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragView, 0);
  objc_storeStrong((id *)&self->_tapGestureRecogniser, 0);
  objc_storeStrong((id *)&self->_dragGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_externalDisplayName, 0);
  objc_storeStrong((id *)&self->_nativeDisplayName, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end