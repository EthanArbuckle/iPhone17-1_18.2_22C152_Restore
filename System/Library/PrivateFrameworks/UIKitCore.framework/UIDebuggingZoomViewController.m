@interface UIDebuggingZoomViewController
- (BOOL)useViewForEdges;
- (CGImage)image;
- (CGImage)newCaptureSnapshotAtRect:(CGRect)a3 window:(id)a4;
- (OS_dispatch_group)group;
- (OS_dispatch_queue)queue;
- (UIDebuggingZoomLineView)lineView;
- (UIDebuggingZoomLoupeView)loupe;
- (UIDebuggingZoomViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UILabel)distanceLabel;
- (UILabel)label;
- (UIPanGestureRecognizer)pan;
- (UISegmentedControl)directionSegmentedControl;
- (UIView)lastViewSeen;
- (id)drawLinesAtPoint:(CGPoint)a3;
- (id)drawViewLinesAtPoint:(CGPoint)a3 forView:(id)a4;
- (unint64_t)currentDirection;
- (void)dealloc;
- (void)setCurrentDirection:(unint64_t)a3;
- (void)setDirectionSegmentedControl:(id)a3;
- (void)setDistanceLabel:(id)a3;
- (void)setGroup:(id)a3;
- (void)setImage:(CGImage *)a3;
- (void)setLabel:(id)a3;
- (void)setLastViewSeen:(id)a3;
- (void)setLineView:(id)a3;
- (void)setLoupe:(id)a3;
- (void)setPan:(id)a3;
- (void)setQueue:(id)a3;
- (void)setUseViewForEdges:(BOOL)a3;
- (void)toggleDirection:(id)a3;
- (void)toggleMeasuring:(id)a3;
- (void)toggleMode:(id)a3;
- (void)updateGesture:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation UIDebuggingZoomViewController

- (UIDebuggingZoomViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)UIDebuggingZoomViewController;
  v4 = [(UIViewController *)&v10 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    dispatch_group_t v5 = dispatch_group_create();
    group = v4->_group;
    v4->_group = (OS_dispatch_group *)v5;

    uint64_t v7 = dispatch_get_global_queue(0, 0);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v7;

    v4->_currentDirection = 0;
  }
  return v4;
}

- (void)setCurrentDirection:(unint64_t)a3
{
  self->_currentDirection = a3;
  -[UIDebuggingZoomLineView setDirection:](self->_lineView, "setDirection:");
}

- (void)viewDidLoad
{
  v56[6] = *MEMORY[0x1E4F143B8];
  v54.receiver = self;
  v54.super_class = (Class)UIDebuggingZoomViewController;
  [(UIViewController *)&v54 viewDidLoad];
  v3 = [(UIViewController *)self view];
  v4 = +[UIColor whiteColor];
  [v3 setBackgroundColor:v4];

  dispatch_group_t v5 = -[UIView initWithSize:]([UILabel alloc], "initWithSize:", 200.0, 50.0);
  v6 = +[UIColor blackColor];
  [(UILabel *)v5 setTextColor:v6];

  uint64_t v7 = [off_1E52D39B8 systemFontOfSize:10.0];
  [(UILabel *)v5 setFont:v7];

  [(UIDebuggingZoomViewController *)self setLabel:v5];
  v8 = [(UIDebuggingZoomViewController *)self label];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  v9 = [(UIViewController *)self view];
  objc_super v10 = v5;
  [v9 addSubview:v5];

  v11 = -[UIView initWithSize:]([UILabel alloc], "initWithSize:", 200.0, 50.0);
  v12 = +[UIColor blackColor];
  [(UILabel *)v11 setTextColor:v12];

  v13 = [off_1E52D39B8 systemFontOfSize:10.0];
  [(UILabel *)v11 setFont:v13];

  [(UIDebuggingZoomViewController *)self setDistanceLabel:v11];
  v14 = [(UIDebuggingZoomViewController *)self distanceLabel];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  v15 = [(UIViewController *)self view];
  [v15 addSubview:v11];

  v16 = objc_alloc_init(UIDebuggingZoomLoupeView);
  [(UIDebuggingZoomViewController *)self setLoupe:v16];

  v17 = [(UIDebuggingZoomViewController *)self loupe];
  [v17 setDelegate:self];

  v18 = [(UIDebuggingZoomViewController *)self loupe];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

  v19 = [(UIViewController *)self view];
  v20 = [(UIDebuggingZoomViewController *)self loupe];
  [v19 addSubview:v20];

  v21 = [[UISegmentedControl alloc] initWithItems:&unk_1ED3F1720];
  [(UISegmentedControl *)v21 setSelectedSegmentIndex:0];
  [(UIControl *)v21 addTarget:self action:sel_toggleDirection_ forControlEvents:4096];
  [(UIDebuggingZoomViewController *)self setDirectionSegmentedControl:v21];
  v22 = [(UIViewController *)self view];
  [v22 addSubview:v21];

  v23 = objc_alloc_init(UISwitch);
  [(UIView *)v23 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIControl *)v23 addTarget:self action:sel_toggleMode_ forControlEvents:4096];
  v24 = [(UIViewController *)self view];
  v25 = v23;
  v53 = v23;
  [v24 addSubview:v23];

  v26 = -[UIView initWithSize:]([UILabel alloc], "initWithSize:", 200.0, 20.0);
  v27 = +[UIColor blackColor];
  [(UILabel *)v26 setTextColor:v27];

  v28 = [off_1E52D39B8 systemFontOfSize:10.0];
  [(UILabel *)v26 setFont:v28];

  [(UIView *)v26 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)v26 setText:@"View Mode"];
  v29 = [(UIViewController *)self view];
  [v29 addSubview:v26];

  v56[0] = v21;
  v55[0] = @"segment";
  v55[1] = @"loupe";
  v30 = [(UIDebuggingZoomViewController *)self loupe];
  v56[1] = v30;
  v56[2] = v10;
  v31 = v10;
  v55[2] = @"label";
  v55[3] = @"distanceLabel";
  v56[3] = v11;
  v56[4] = v25;
  v55[4] = @"switch";
  v55[5] = @"modeLabel";
  v56[5] = v26;
  v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:6];

  v33 = [MEMORY[0x1E4F1CA48] array];
  [(UIView *)v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  v34 = (void *)MEMORY[0x1E4F5B268];
  v35 = [(UIViewController *)self view];
  v36 = [v34 constraintWithItem:v35 attribute:9 relatedBy:0 toItem:v21 attribute:9 multiplier:1.0 constant:0.0];
  [v33 addObject:v36];

  v37 = (void *)MEMORY[0x1E4F5B268];
  v38 = [(UIViewController *)self view];
  v39 = [v37 constraintWithItem:v21 attribute:3 relatedBy:0 toItem:v38 attribute:3 multiplier:1.0 constant:10.0];
  [v33 addObject:v39];

  v40 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"V:[segment]-padding-[loupe(>=loupesize)]" options:0 metrics:&unk_1ED3F7B90 views:v32];
  [v33 addObjectsFromArray:v40];

  v41 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"V:[segment]-padding-[switch]" options:0 metrics:&unk_1ED3F7B90 views:v32];
  [v33 addObjectsFromArray:v41];

  v42 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"H:|-padding-[loupe(>=loupesize)]-padding-[switch]-padding-|" options:0 metrics:&unk_1ED3F7B90 views:v32];
  [v33 addObjectsFromArray:v42];

  v43 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"V:[switch]-padding-[modeLabel]" options:0 metrics:&unk_1ED3F7B90 views:v32];
  [v33 addObjectsFromArray:v43];

  v44 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"H:|-padding-[loupe(>=loupesize)]-padding-[modeLabel(>=labelsize)]-padding-|" options:0 metrics:&unk_1ED3F7B90 views:v32];
  [v33 addObjectsFromArray:v44];

  v45 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"V:[loupe]-padding-[label]" options:0 metrics:&unk_1ED3F7B90 views:v32];
  [v33 addObjectsFromArray:v45];

  v46 = (void *)MEMORY[0x1E4F5B268];
  v47 = [(UIViewController *)self view];
  v48 = [v46 constraintWithItem:v47 attribute:9 relatedBy:0 toItem:v31 attribute:9 multiplier:1.0 constant:0.0];
  [v33 addObject:v48];

  v49 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"V:[label]-5-[distanceLabel]-padding-|" options:0 metrics:&unk_1ED3F7B90 views:v32];
  [v33 addObjectsFromArray:v49];

  v50 = (void *)MEMORY[0x1E4F5B268];
  v51 = [(UIViewController *)self view];
  v52 = [v50 constraintWithItem:v51 attribute:9 relatedBy:0 toItem:v11 attribute:9 multiplier:1.0 constant:0.0];
  [v33 addObject:v52];

  [MEMORY[0x1E4F5B268] activateConstraints:v33];
  [(UIViewController *)self setEdgesForExtendedLayout:0];
  [(UIViewController *)self setExtendedLayoutIncludesOpaqueBars:0];
}

- (void)toggleMode:(id)a3
{
  id v4 = a3;
  -[UIDebuggingZoomViewController setUseViewForEdges:](self, "setUseViewForEdges:", [v4 isOn]);
  char v5 = [v4 isOn];

  if ((v5 & 1) == 0)
  {
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    objc_super v10 = [(UIDebuggingZoomViewController *)self lineView];
    objc_msgSend(v10, "setRect:", v6, v7, v8, v9);

    id v11 = [(UIDebuggingZoomViewController *)self lineView];
    [v11 setNeedsDisplay];
  }
}

- (void)toggleDirection:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [v13 selectedSegmentIndex];
  char v5 = +[UIDebuggingInformationOverlay overlay];
  double v6 = v5;
  if (v4)
  {
    char v7 = [v5 touchCaptureEnabled];

    if ((v7 & 1) == 0)
    {
      double v8 = +[UIDebuggingInformationOverlay overlay];
      [v8 setTouchCaptureEnabled:1];

      double v9 = [(UIDebuggingZoomViewController *)self lineView];
      [v9 setHidden:0];
    }
    if ([v13 selectedSegmentIndex] == 1)
    {
      objc_super v10 = self;
      uint64_t v11 = 0;
    }
    else
    {
      objc_super v10 = self;
      uint64_t v11 = 1;
    }
    [(UIDebuggingZoomViewController *)v10 setCurrentDirection:v11];
  }
  else
  {
    [v5 setTouchCaptureEnabled:0];

    v12 = [(UIDebuggingZoomViewController *)self lineView];
    [v12 setHidden:1];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v18.receiver = self;
  v18.super_class = (Class)UIDebuggingZoomViewController;
  [(UIViewController *)&v18 viewDidAppear:a3];
  uint64_t v4 = [(UIDebuggingZoomViewController *)self lineView];

  if (!v4)
  {
    char v5 = [UIDebuggingZoomLineView alloc];
    double v6 = [(UIViewController *)self view];
    char v7 = [v6 window];
    [v7 frame];
    double v8 = -[UIDebuggingZoomLineView initWithFrame:](v5, "initWithFrame:");
    [(UIDebuggingZoomViewController *)self setLineView:v8];

    double v9 = [(UIViewController *)self view];
    objc_super v10 = [v9 window];
    uint64_t v11 = [v10 rootViewController];
    v12 = [v11 view];
    id v13 = [(UIDebuggingZoomViewController *)self lineView];
    [v12 insertSubview:v13 atIndex:0];

    v14 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:sel_updateGesture_];
    v15 = [(UIDebuggingZoomViewController *)self lineView];
    [v15 addGestureRecognizer:v14];

    [(UIDebuggingZoomViewController *)self setPan:v14];
    v16 = [(UIDebuggingZoomViewController *)self lineView];
    v17 = +[UIDebuggingInformationOverlay overlay];
    objc_msgSend(v16, "setHidden:", objc_msgSend(v17, "touchCaptureEnabled") ^ 1);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIDebuggingZoomViewController;
  [(UIViewController *)&v6 viewWillDisappear:a3];
  uint64_t v4 = [(UIDebuggingZoomViewController *)self lineView];
  [v4 setHidden:1];

  char v5 = +[UIDebuggingInformationOverlay overlay];
  [v5 setTouchCaptureEnabled:0];
}

- (void)updateGesture:(id)a3
{
  id v48 = a3;
  BOOL v4 = [v48 state] == 2;
  char v5 = v48;
  if (v4)
  {
    [v48 locationInView:0];
    double v7 = v6;
    double v9 = v8;
    objc_super v10 = [(UIDebuggingZoomViewController *)self loupe];
    objc_msgSend(v10, "setCurrentlyInspectedPoint:", v7, v9);

    uint64_t v11 = +[UIDebuggingInformationOverlay overlay];
    v12 = [v11 inspectedWindow];
    id v13 = objc_msgSend(v12, "hitTest:withEvent:", 0, v7, v9);

    v14 = [v13 superview];
    [v13 frame];
    objc_msgSend(v14, "convertPoint:toView:", 0);
    double v16 = v15;
    double v18 = v17;
    [v13 frame];
    double v20 = v19;
    double v22 = v21;

    v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    v25 = [(UIDebuggingZoomViewController *)self label];
    [v25 setText:v24];

    if ([(UIDebuggingZoomViewController *)self useViewForEdges])
    {
      v26 = [(UIDebuggingZoomViewController *)self lineView];
      objc_msgSend(v26, "setRect:", v16, v18, v20, v22);

      v27 = [(UIDebuggingZoomViewController *)self lastViewSeen];

      if (v27)
      {
        v28 = [(UIDebuggingZoomViewController *)self lastViewSeen];
        v29 = -[UIDebuggingZoomViewController drawViewLinesAtPoint:forView:](self, "drawViewLinesAtPoint:forView:", v28, v7, v9);

        goto LABEL_9;
      }
      uint64_t v30 = -[UIDebuggingZoomViewController drawViewLinesAtPoint:forView:](self, "drawViewLinesAtPoint:forView:", 0, v7, v9);
    }
    else
    {
      uint64_t v30 = -[UIDebuggingZoomViewController drawLinesAtPoint:](self, "drawLinesAtPoint:", v7, v9);
    }
    v29 = (void *)v30;
LABEL_9:
    v31 = [(UIDebuggingZoomViewController *)self lineView];
    v32 = [v29 objectAtIndexedSubscript:0];
    [v32 CGPointValue];
    objc_msgSend(v31, "setStart:");

    v33 = [(UIDebuggingZoomViewController *)self lineView];
    v34 = [v29 objectAtIndexedSubscript:1];
    [v34 CGPointValue];
    objc_msgSend(v33, "setEnd:");

    unint64_t v35 = [(UIDebuggingZoomViewController *)self currentDirection];
    if (v35 == 1)
    {
      v36 = NSString;
      v37 = [(UIDebuggingZoomViewController *)self lineView];
      [v37 end];
      double v44 = v43;
      v40 = [(UIDebuggingZoomViewController *)self lineView];
      [v40 start];
      double v42 = v44 - v45;
    }
    else
    {
      if (v35)
      {
LABEL_14:

        char v5 = v48;
        goto LABEL_15;
      }
      v36 = NSString;
      v37 = [(UIDebuggingZoomViewController *)self lineView];
      [v37 end];
      double v39 = v38;
      v40 = [(UIDebuggingZoomViewController *)self lineView];
      [v40 start];
      double v42 = v39 - v41;
    }
    v46 = objc_msgSend(v36, "stringWithFormat:", @"%.1f", *(void *)&v42);
    v47 = [(UIDebuggingZoomViewController *)self distanceLabel];
    [v47 setText:v46];

    goto LABEL_14;
  }
LABEL_15:
}

- (void)toggleMeasuring:(id)a3
{
  BOOL v4 = +[UIDebuggingInformationOverlay overlay];
  uint64_t v5 = [v4 touchCaptureEnabled];

  double v6 = +[UIDebuggingInformationOverlay overlay];
  [v6 setTouchCaptureEnabled:v5 ^ 1];

  id v7 = [(UIDebuggingZoomViewController *)self lineView];
  [v7 setHidden:v5];
}

- (id)drawLinesAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  image = self->_image;
  if (!image)
  {
    id v7 = +[UIDebuggingInformationOverlay overlay];
    double v8 = [v7 inspectedWindow];

    [v8 frame];
    self->_image = -[UIDebuggingZoomViewController newCaptureSnapshotAtRect:window:](self, "newCaptureSnapshotAtRect:window:", v8);

    image = self->_image;
  }
  size_t BitsPerPixel = CGImageGetBitsPerPixel(image);
  size_t BytesPerRow = CGImageGetBytesPerRow(image);
  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  v12 = +[UIScreen mainScreen];
  [v12 scale];
  double v14 = v13;

  DataProvider = CGImageGetDataProvider(image);
  CFDataRef v16 = CGDataProviderCopyData(DataProvider);
  BytePtr = CFDataGetBytePtr(v16);
  if (BytePtr)
  {
    double v18 = BytePtr;
    uint64_t v42 = 0;
    double v43 = (double *)&v42;
    uint64_t v44 = 0x2020000000;
    uint64_t v45 = 0;
    uint64_t v38 = 0;
    double v39 = (double *)&v38;
    uint64_t v40 = 0x2020000000;
    uint64_t v41 = 0;
    double v19 = round(x * v14);
    double v20 = round(y * v14);
    if ([(UIDebuggingZoomViewController *)self currentDirection]) {
      double v21 = v19;
    }
    else {
      double v21 = v20;
    }
    v39[3] = v21;
    v43[3] = v21;
    double v22 = [(UIDebuggingZoomViewController *)self group];
    v23 = [(UIDebuggingZoomViewController *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__UIDebuggingZoomViewController_drawLinesAtPoint___block_invoke;
    block[3] = &unk_1E530CDF0;
    *(double *)&block[6] = v19;
    *(double *)&block[7] = v20;
    block[8] = BytesPerRow;
    block[9] = BitsPerPixel;
    block[10] = v18;
    block[11] = &v18[(int)(v20 * (double)BytesPerRow + v19 * (double)(BitsPerPixel >> 3))];
    block[4] = self;
    block[5] = &v42;
    dispatch_group_async(v22, v23, block);

    v24 = [(UIDebuggingZoomViewController *)self group];
    v25 = [(UIDebuggingZoomViewController *)self queue];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __50__UIDebuggingZoomViewController_drawLinesAtPoint___block_invoke_2;
    v36[3] = &unk_1E530CE18;
    *(double *)&v36[7] = v19;
    *(double *)&v36[8] = v20;
    v36[9] = BytesPerRow;
    v36[10] = BitsPerPixel;
    v36[11] = v18;
    v36[12] = &v18[(int)(v20 * (double)BytesPerRow + v19 * (double)(BitsPerPixel >> 3))];
    v36[4] = self;
    v36[5] = &v38;
    v36[6] = image;
    dispatch_group_async(v24, v25, v36);

    v26 = [(UIDebuggingZoomViewController *)self group];
    dispatch_group_wait(v26, 0xFFFFFFFFFFFFFFFFLL);

    unint64_t v27 = [(UIDebuggingZoomViewController *)self currentDirection];
    double v28 = v39[3] / v14;
    if (v27)
    {
      double v29 = v43[3] / v14;
      double v30 = v20 / v14;
      double v31 = v39[3] / v14;
      double v28 = v30;
    }
    else
    {
      double v29 = v19 / v14;
      double v30 = v43[3] / v14;
      double v31 = v19 / v14;
    }
    v32 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v29, v30);
    [v11 addObject:v32];

    v33 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v31, v28);
    [v11 addObject:v33];

    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(&v42, 8);
  }
  CFRelease(v16);
  v34 = (void *)[v11 copy];

  return v34;
}

uint64_t __50__UIDebuggingZoomViewController_drawLinesAtPoint___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56) + 1.0;
  if ([*(id *)(a1 + 32) currentDirection]) {
    double v4 = v2;
  }
  else {
    double v4 = v3;
  }
  if (v4 > 0.0)
  {
    do
    {
      uint64_t v5 = [*(id *)(a1 + 32) currentDirection];
      double v6 = v3 + -1.0;
      double v7 = v2 + -1.0;
      if (v5) {
        double v2 = v2 + -1.0;
      }
      else {
        double v3 = v3 + -1.0;
      }
      if (v5) {
        double v6 = v7;
      }
      uint64_t v8 = *(void *)(a1 + 88);
      double v9 = 0.0;
      if (*(unsigned char *)(v8 + 3))
      {
        uint64_t v10 = *(void *)(a1 + 80)
            + (int)(v3 * (double)*(unint64_t *)(a1 + 64) + v2 * (double)(*(void *)(a1 + 72) >> 3));
        if (*(unsigned char *)(v10 + 3))
        {
          for (uint64_t i = 1; i != 4; ++i)
            double v9 = v9
               + (double)((*(unsigned __int8 *)(v8 + i) - *(unsigned __int8 *)(v10 + i))
                        * (*(unsigned __int8 *)(v8 + i) - *(unsigned __int8 *)(v10 + i)));
          float v12 = v9;
          double v9 = sqrtf(v12);
        }
      }
    }
    while (v9 <= 10.0 && v6 > 0.0);
  }
  uint64_t result = [*(id *)(a1 + 32) currentDirection];
  if (result) {
    double v14 = v2;
  }
  else {
    double v14 = v3;
  }
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v14;
  return result;
}

uint64_t __50__UIDebuggingZoomViewController_drawLinesAtPoint___block_invoke_2(uint64_t a1)
{
  size_t Width = CGImageGetWidth(*(CGImageRef *)(a1 + 48));
  size_t Height = CGImageGetHeight(*(CGImageRef *)(a1 + 48));
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  uint64_t v6 = [*(id *)(a1 + 32) currentDirection];
  double v7 = -1.0;
  if (v6)
  {
    double v4 = v4 + -1.0;
    double v8 = (double)(Width - 1);
    if (v4 >= v8) {
      goto LABEL_17;
    }
    double v9 = (double)(Height - 1);
  }
  else
  {
    double v5 = v5 + -1.0;
    double v9 = (double)(Height - 1);
    if (v5 >= v9) {
      goto LABEL_17;
    }
    double v8 = (double)(Width - 1);
  }
  do
  {
    uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "currentDirection", v7);
    BOOL v11 = v5 + 1.0 < v9;
    if (v10)
    {
      BOOL v11 = v4 + 1.0 < v8;
      double v4 = v4 + 1.0;
    }
    else
    {
      double v5 = v5 + 1.0;
    }
    uint64_t v12 = *(void *)(a1 + 96);
    double v7 = 0.0;
    if (*(unsigned char *)(v12 + 3))
    {
      uint64_t v13 = *(void *)(a1 + 88)
          + (int)(v5 * (double)*(unint64_t *)(a1 + 72) + v4 * (double)(*(void *)(a1 + 80) >> 3));
      if (*(unsigned char *)(v13 + 3))
      {
        for (uint64_t i = 1; i != 4; ++i)
          double v7 = v7
             + (double)((*(unsigned __int8 *)(v12 + i) - *(unsigned __int8 *)(v13 + i))
                      * (*(unsigned __int8 *)(v12 + i) - *(unsigned __int8 *)(v13 + i)));
        float v15 = v7;
        double v7 = sqrtf(v15);
      }
    }
    if (v7 > 10.0) {
      BOOL v11 = 0;
    }
  }
  while (v11);
LABEL_17:
  uint64_t result = [*(id *)(a1 + 32) currentDirection];
  if (result == 1) {
    double v17 = v4;
  }
  else {
    double v17 = v5;
  }
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v17;
  return result;
}

- (id)drawViewLinesAtPoint:(CGPoint)a3 forView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v28[2] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (v7)
  {
    double v8 = v7;
    double v9 = [v7 window];
    objc_msgSend(v9, "convertPoint:toView:", v8, x, y);
    double x = v10;
    double y = v11;
  }
  else
  {
    double v9 = +[UIDebuggingInformationOverlay overlay];
    double v8 = [v9 inspectedWindow];
  }

  uint64_t v12 = objc_msgSend(v8, "hitTest:withEvent:", 0, x, y);
  unint64_t v13 = [(UIDebuggingZoomViewController *)self currentDirection];
  [v12 bounds];
  objc_msgSend(v12, "convertPoint:toView:", 0);
  if (v13)
  {
    double v16 = v14;
    double v17 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:");
    v27[0] = v17;
    double v18 = (void *)MEMORY[0x1E4F29238];
    [v12 bounds];
    double v20 = objc_msgSend(v18, "valueWithCGPoint:", v16 + v19, y);
    v27[1] = v20;
    double v21 = v27;
  }
  else
  {
    double v22 = v15;
    double v17 = [MEMORY[0x1E4F29238] valueWithCGPoint:x];
    v28[0] = v17;
    v23 = (void *)MEMORY[0x1E4F29238];
    [v12 bounds];
    double v20 = objc_msgSend(v23, "valueWithCGPoint:", x, v22 + v24);
    v28[1] = v20;
    double v21 = v28;
  }
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];

  return v25;
}

- (void)dealloc
{
  image = self->_image;
  if (image) {
    CFRelease(image);
  }
  v4.receiver = self;
  v4.super_class = (Class)UIDebuggingZoomViewController;
  [(UIViewController *)&v4 dealloc];
}

- (CGImage)newCaptureSnapshotAtRect:(CGRect)a3 window:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v67[16] = *MEMORY[0x1E4F143B8];
  double v8 = (id *)a4;
  id v53 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
  -[UIWindow _fbsScene](v8);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  double v10 = [v8 screen];
  double v11 = +[UIWindow allWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 forScreen:v10];

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v55 = v11;
  id v54 = v9;
  uint64_t v57 = [v55 countByEnumeratingWithState:&v62 objects:v67 count:16];
  if (v57)
  {
    uint64_t v56 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v57; ++i)
      {
        if (*(void *)v63 != v56) {
          objc_enumerationMutation(v55);
        }
        unint64_t v13 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        -[UIWindow _fbsScene](v8);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        id v15 = v9;
        double v16 = v15;
        if (v14 == v15)
        {
        }
        else
        {
          if (!v9) {
            goto LABEL_13;
          }
          if (!v14) {
            goto LABEL_13;
          }
          [v14 settings];
          double v18 = v17 = v8;
          [v18 frame];
          CGFloat v20 = v19;
          CGFloat v22 = v21;
          CGFloat v24 = v23;
          CGFloat v26 = v25;
          unint64_t v27 = [v16 settings];
          [v27 frame];
          v69.origin.double x = v28;
          v69.origin.double y = v29;
          v69.size.double width = v30;
          v69.size.double height = v31;
          v68.origin.double x = v20;
          v68.origin.double y = v22;
          v68.size.double width = v24;
          v68.size.double height = v26;
          BOOL v32 = CGRectEqualToRect(v68, v69);

          id v9 = v54;
          double v8 = v17;
          if (!v32)
          {
LABEL_13:

LABEL_14:
            continue;
          }
          v33 = [v14 settings];
          uint64_t v34 = [v33 interfaceOrientation];
          unint64_t v35 = [v16 settings];
          uint64_t v36 = [v35 interfaceOrientation];

          double v8 = v17;
          BOOL v37 = v34 == v36;
          id v9 = v54;
          if (!v37) {
            goto LABEL_14;
          }
        }
        uint64_t v38 = +[UIDebuggingInformationOverlay overlay];

        if (v13 != v38) {
          [v53 addObject:v13];
        }
      }
      uint64_t v57 = [v55 countByEnumeratingWithState:&v62 objects:v67 count:16];
    }
    while (v57);
  }

  uint64_t v39 = [v53 count];
  MEMORY[0x1F4188790](v39);
  uint64_t v41 = (char *)&v52 - v40;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v42 = v53;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v58 objects:v66 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = 0;
    uint64_t v46 = *(void *)v59;
    do
    {
      for (uint64_t j = 0; j != v44; ++j)
      {
        if (*(void *)v59 != v46) {
          objc_enumerationMutation(v42);
        }
        *(_DWORD *)&v41[4 * v45 + 4 * j] = [*(id *)(*((void *)&v58 + 1) + 8 * j) _contextId];
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v58 objects:v66 count:16];
      v45 += j;
    }
    while (v44);
  }
  else
  {
    uint64_t v45 = 0;
  }

  id v48 = +[UIWindow createIOSurfaceWithContextIds:count:frame:](UIWindow, "createIOSurfaceWithContextIds:count:frame:", v41, v45, x, y, width, height);
  if (v48)
  {
    v49 = v48;
    v50 = _UICreateCGImageFromIOSurfaceWithOptions((CGImage *)v48, 0);
    CFRelease(v49);
  }
  else
  {
    v50 = 0;
  }

  return v50;
}

- (unint64_t)currentDirection
{
  return self->_currentDirection;
}

- (UIDebuggingZoomLoupeView)loupe
{
  return self->_loupe;
}

- (void)setLoupe:(id)a3
{
}

- (UIDebuggingZoomLineView)lineView
{
  return self->_lineView;
}

- (void)setLineView:(id)a3
{
}

- (UIPanGestureRecognizer)pan
{
  return self->_pan;
}

- (void)setPan:(id)a3
{
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CGImage)image
{
  return self->_image;
}

- (void)setImage:(CGImage *)a3
{
  self->_image = a3;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (UILabel)distanceLabel
{
  return self->_distanceLabel;
}

- (void)setDistanceLabel:(id)a3
{
}

- (UISegmentedControl)directionSegmentedControl
{
  return self->_directionSegmentedControl;
}

- (void)setDirectionSegmentedControl:(id)a3
{
}

- (BOOL)useViewForEdges
{
  return self->_useViewForEdges;
}

- (void)setUseViewForEdges:(BOOL)a3
{
  self->_useViewForEdges = a3;
}

- (UIView)lastViewSeen
{
  return self->_lastViewSeen;
}

- (void)setLastViewSeen:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastViewSeen, 0);
  objc_storeStrong((id *)&self->_directionSegmentedControl, 0);
  objc_storeStrong((id *)&self->_distanceLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_pan, 0);
  objc_storeStrong((id *)&self->_lineView, 0);
  objc_storeStrong((id *)&self->_loupe, 0);
}

@end