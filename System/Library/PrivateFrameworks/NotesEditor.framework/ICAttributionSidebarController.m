@interface ICAttributionSidebarController
+ (id)keyPathsForValuesAffectingAttributionSidebarVisibility;
- (BOOL)attributionSidebarGestureHasBegunToOpen;
- (BOOL)isEnabled;
- (ICAttributionSidebarController)init;
- (ICAttributionSidebarController)initWithTextView:(id)a3;
- (ICAttributionSidebarView)attributionSidebarView;
- (ICNAEventReporter)eventReporter;
- (ICTTTextEditFilter)filter;
- (ICTextView)textView;
- (ICTextViewController)textViewController;
- (NSDate)attributionSidebarGestureStartTime;
- (NSNumber)attributionSidebarGestureBaselineContentOffsetY;
- (UIPanGestureRecognizer)panGestureRecognizer;
- (double)attributionSidebarGestureAcceptedDistanceX;
- (double)attributionSidebarGestureBaselineX;
- (double)attributionSidebarGestureIgnoredDistanceX;
- (id)sidebarWidthDidChangeHandler;
- (int64_t)attributionSidebarVisibility;
- (void)cancelActiveGestures;
- (void)dealloc;
- (void)handlePanGesture:(id)a3;
- (void)hideSidebarAnimated:(BOOL)a3;
- (void)hideSidebarAnimated:(BOOL)a3 contextPath:(int64_t)a4;
- (void)noteDidUpdateShare:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAttributionSidebarGestureAcceptedDistanceX:(double)a3;
- (void)setAttributionSidebarGestureBaselineContentOffsetY:(id)a3;
- (void)setAttributionSidebarGestureBaselineX:(double)a3;
- (void)setAttributionSidebarGestureHasBegunToOpen:(BOOL)a3;
- (void)setAttributionSidebarGestureIgnoredDistanceX:(double)a3;
- (void)setAttributionSidebarGestureStartTime:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFilter:(id)a3;
- (void)setFilter:(id)a3 animated:(BOOL)a4;
- (void)setPanGestureRecognizer:(id)a3;
- (void)setSidebarWidthDidChangeHandler:(id)a3;
- (void)setTextViewController:(id)a3;
- (void)showSidebarAnimated:(BOOL)a3;
@end

@implementation ICAttributionSidebarController

- (void)setSidebarWidthDidChangeHandler:(id)a3
{
}

- (int64_t)attributionSidebarVisibility
{
  v3 = [(ICAttributionSidebarController *)self attributionSidebarView];
  [v3 visibleContentWidth];
  double v5 = v4;

  v6 = [(ICAttributionSidebarController *)self attributionSidebarView];
  [v6 fullContentWidth];
  double v8 = v7;

  double v9 = vabdd_f64(0.0, v5);
  int64_t v10 = v5 > 0.0;
  if (v5 >= v8) {
    int64_t v10 = 2;
  }
  if (v9 >= 0.00999999978) {
    return v10;
  }
  else {
    return 0;
  }
}

- (ICAttributionSidebarView)attributionSidebarView
{
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    objc_opt_class();
    v3 = [(ICAttributionSidebarController *)self textView];
    double v4 = ICDynamicCast();
    double v5 = [v4 attributionSidebarView];
  }
  else
  {
    v3 = [(ICAttributionSidebarController *)self textViewController];
    double v5 = [v3 attributionSidebarView];
  }

  return (ICAttributionSidebarView *)v5;
}

- (ICTextView)textView
{
  textView = self->_textView;
  if (textView)
  {
    v3 = textView;
  }
  else
  {
    double v4 = [(ICAttributionSidebarController *)self textViewController];
    v3 = [v4 textView];
  }

  return v3;
}

- (ICAttributionSidebarController)initWithTextView:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICAttributionSidebarController;
  v6 = [(ICAttributionSidebarController *)&v15 init];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_textView, a3);
    double v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v7 selector:sel_noteDidUpdateShare_ name:*MEMORY[0x263F5B080] object:0];

    double v9 = (void *)[objc_alloc(MEMORY[0x263F82A00]) initWithTarget:v7 action:sel_handlePanGesture_];
    [(ICAttributionSidebarController *)v7 setPanGestureRecognizer:v9];

    int64_t v10 = [(ICAttributionSidebarController *)v7 panGestureRecognizer];
    [v10 setAllowedScrollTypesMask:2];

    v11 = [(ICAttributionSidebarController *)v7 panGestureRecognizer];
    [v5 addGestureRecognizer:v11];

    uint64_t v12 = [(ICAttributionSidebarController *)v7 isEnabled];
    v13 = [(ICAttributionSidebarController *)v7 panGestureRecognizer];
    [v13 setEnabled:v12];
  }
  return v7;
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_enabled = a3;
  id v4 = [(ICAttributionSidebarController *)self panGestureRecognizer];
  [v4 setEnabled:v3];
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)hideSidebarAnimated:(BOOL)a3 contextPath:(int64_t)a4
{
  BOOL v5 = a3;
  if (![(ICAttributionSidebarController *)self attributionSidebarVisibility]) {
    return;
  }
  if (!ICInternalSettingsIsTextKit2Enabled())
  {
    double v8 = [(ICAttributionSidebarController *)self textViewController];
    [v8 setAttributionSidebarWidth:0 isGestureActive:v5 animated:0.0 currentVelocity:0.0];
    goto LABEL_7;
  }
  double v7 = [(ICAttributionSidebarController *)self sidebarWidthDidChangeHandler];

  if (v7)
  {
    double v8 = [(ICAttributionSidebarController *)self sidebarWidthDidChangeHandler];
    v8[2](v8, 0, v5, 0.0, 0.0);
LABEL_7:
  }
  double v9 = [(ICAttributionSidebarController *)self textView];
  int64_t v10 = [v9 editorController];
  id v12 = [v10 note];

  v11 = [(ICAttributionSidebarController *)self eventReporter];
  [v11 submitAttributionSideBarViewEventForNote:v12 contextPath:a4 startState:3 endState:1];
}

- (void)hideSidebarAnimated:(BOOL)a3
{
}

- (ICAttributionSidebarController)init
{
  v5.receiver = self;
  v5.super_class = (Class)ICAttributionSidebarController;
  v2 = [(ICAttributionSidebarController *)&v5 init];
  if (v2)
  {
    BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_noteDidUpdateShare_ name:*MEMORY[0x263F5B080] object:0];
  }
  return v2;
}

- (void)setTextViewController:(id)a3
{
  id v15 = a3;
  textViewController = self->_textViewController;
  if (textViewController)
  {
    v6 = [(ICTextViewController *)textViewController textView];
    double v7 = [(ICAttributionSidebarController *)self panGestureRecognizer];
    [v6 removeGestureRecognizer:v7];

    [(ICTextViewController *)self->_textViewController ic_removeObserver:self forKeyPath:@"textView" context:&compoundliteral_2];
  }
  objc_storeStrong((id *)&self->_textViewController, a3);
  objc_msgSend(v15, "ic_addObserver:forKeyPath:context:", self, @"textView", &compoundliteral_2);
  double v8 = [(ICAttributionSidebarController *)self panGestureRecognizer];

  if (!v8)
  {
    double v9 = (void *)[objc_alloc(MEMORY[0x263F82A00]) initWithTarget:self action:sel_handlePanGesture_];
    [(ICAttributionSidebarController *)self setPanGestureRecognizer:v9];

    int64_t v10 = [(ICAttributionSidebarController *)self panGestureRecognizer];
    [v10 setAllowedScrollTypesMask:2];
  }
  v11 = [v15 textView];
  id v12 = [(ICAttributionSidebarController *)self panGestureRecognizer];
  [v11 addGestureRecognizer:v12];

  BOOL v13 = [(ICAttributionSidebarController *)self isEnabled];
  v14 = [(ICAttributionSidebarController *)self panGestureRecognizer];
  [v14 setEnabled:v13];
}

- (void)dealloc
{
  BOOL v3 = [(ICAttributionSidebarController *)self textViewController];
  objc_msgSend(v3, "ic_removeObserver:forKeyPath:context:", self, @"textView", &compoundliteral_2);

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)ICAttributionSidebarController;
  [(ICAttributionSidebarController *)&v5 dealloc];
}

- (ICTTTextEditFilter)filter
{
  v2 = [(ICAttributionSidebarController *)self attributionSidebarView];
  BOOL v3 = [v2 filter];

  return (ICTTTextEditFilter *)v3;
}

- (void)setFilter:(id)a3
{
  id v4 = a3;
  id v5 = [(ICAttributionSidebarController *)self attributionSidebarView];
  [v5 setFilter:v4];
}

- (void)setFilter:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(ICAttributionSidebarController *)self attributionSidebarView];
  [v7 setFilter:v6 animated:v4];
}

- (void)showSidebarAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ICAttributionSidebarController *)self attributionSidebarVisibility] == 2) {
    return;
  }
  id v5 = [(ICAttributionSidebarController *)self attributionSidebarView];
  [v5 fullContentWidth];
  double v7 = v6;

  if (!ICInternalSettingsIsTextKit2Enabled())
  {
    double v9 = [(ICAttributionSidebarController *)self textViewController];
    [v9 setAttributionSidebarWidth:0 isGestureActive:v3 animated:v7 currentVelocity:0.0];
    goto LABEL_6;
  }
  double v8 = [(ICAttributionSidebarController *)self sidebarWidthDidChangeHandler];

  if (v8)
  {
    double v9 = [(ICAttributionSidebarController *)self sidebarWidthDidChangeHandler];
    v9[2](v9, 0, v3, v7, 0.0);
LABEL_6:
  }
  int64_t v10 = [(ICAttributionSidebarController *)self textView];
  v11 = [v10 editorController];
  id v13 = [v11 note];

  if (v13)
  {
    id v12 = [(ICAttributionSidebarController *)self eventReporter];
    [v12 startAttributionSideBarViewEventForNote:v13];
  }
}

+ (id)keyPathsForValuesAffectingAttributionSidebarVisibility
{
  if (ICInternalSettingsIsTextKit2Enabled()) {
    v2 = @"textView.attributionSidebarView.visibleWidth";
  }
  else {
    v2 = @"textViewController.attributionSidebarView.visibleWidth";
  }
  BOOL v3 = [MEMORY[0x263EFFA08] setWithObject:v2];

  return v3;
}

- (void)cancelActiveGestures
{
  BOOL v3 = [(ICAttributionSidebarController *)self panGestureRecognizer];
  [v3 setEnabled:0];

  BOOL v4 = [(ICAttributionSidebarController *)self isEnabled];
  id v5 = [(ICAttributionSidebarController *)self panGestureRecognizer];
  [v5 setEnabled:v4];
}

- (void)handlePanGesture:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1)
  {
    id v5 = [(ICAttributionSidebarController *)self attributionSidebarView];
    [v5 visibleContentWidth];
    -[ICAttributionSidebarController setAttributionSidebarGestureBaselineX:](self, "setAttributionSidebarGestureBaselineX:");

    [(ICAttributionSidebarController *)self setAttributionSidebarGestureAcceptedDistanceX:0.0];
    [(ICAttributionSidebarController *)self setAttributionSidebarGestureIgnoredDistanceX:0.0];
    double v6 = [MEMORY[0x263EFF910] now];
    [(ICAttributionSidebarController *)self setAttributionSidebarGestureStartTime:v6];

    [(ICAttributionSidebarController *)self setAttributionSidebarGestureHasBegunToOpen:0];
  }
  double v7 = [(ICAttributionSidebarController *)self textView];
  int v8 = objc_msgSend(v7, "ic_isRTL");

  double v9 = [(ICAttributionSidebarController *)self attributionSidebarView];
  [v4 translationInView:v9];
  double v11 = v10;
  double v12 = -v10;

  id v13 = [(ICAttributionSidebarController *)self textViewController];
  v14 = [v13 view];
  [v4 velocityInView:v14];
  double v16 = v15;
  double v18 = v17;

  if (v18 >= 0.0) {
    double v19 = v18;
  }
  else {
    double v19 = -v18;
  }
  if (v16 >= 0.0) {
    double v20 = v16;
  }
  else {
    double v20 = -v16;
  }
  if (v8) {
    double v21 = v12;
  }
  else {
    double v21 = v11;
  }
  double v108 = v16;
  double v109 = v21;
  if (v8) {
    BOOL v22 = v16 < 0.0;
  }
  else {
    BOOL v22 = v16 > 0.0;
  }
  int64_t v23 = [(ICAttributionSidebarController *)self attributionSidebarVisibility];
  double v24 = 1.0;
  if (v23 != 1) {
    double v24 = 3.0;
  }
  double v25 = v19 * v24;
  v26 = [(ICAttributionSidebarController *)self textView];
  [v26 safeAreaInsets];
  double v28 = v27;
  v29 = [(ICAttributionSidebarController *)self textView];
  v30 = [v29 userTitleView];
  [v30 frame];
  double v32 = v31;
  v33 = [(ICAttributionSidebarController *)self textView];
  v34 = [v33 dateView];
  [v34 frame];
  double v36 = v35;

  BOOL v37 = [v4 state] == 3 || objc_msgSend(v4, "state") == 4 || objc_msgSend(v4, "state") == 5;
  v38 = [(ICAttributionSidebarController *)self textView];
  [v4 locationInView:v38];
  double v40 = v39;
  double v42 = v41;

  v43 = [(ICAttributionSidebarController *)self textView];
  v44 = [v43 editorController];
  char v45 = objc_msgSend(v44, "isPositionOnTodoItem:", v40, v42);

  if (v20 > v25 || v37)
  {
    v46 = [(ICAttributionSidebarController *)self textView];
    [v46 contentOffset];
    if (v47 >= -(v28 + v32 + v36)
      && (v22
       || [(ICAttributionSidebarController *)self attributionSidebarVisibility] > 0
       || [(ICAttributionSidebarController *)self attributionSidebarGestureHasBegunToOpen]))
    {
      if ([(ICAttributionSidebarController *)self attributionSidebarVisibility] < 1) {
        char v55 = v45;
      }
      else {
        char v55 = 0;
      }
      if ((v55 & 1) == 0)
      {

        goto LABEL_49;
      }
      v56 = [(ICAttributionSidebarController *)self attributionSidebarGestureStartTime];
      [v56 timeIntervalSinceNow];
      double v58 = v57;

      if (v58 >= 0.0) {
        double v59 = v58;
      }
      else {
        double v59 = -v58;
      }

      if (v59 > 0.1)
      {
LABEL_49:
        [(ICAttributionSidebarController *)self attributionSidebarGestureIgnoredDistanceX];
        [(ICAttributionSidebarController *)self setAttributionSidebarGestureAcceptedDistanceX:v109 - v60];
        [(ICAttributionSidebarController *)self setAttributionSidebarGestureHasBegunToOpen:1];
        v61 = [(ICAttributionSidebarController *)self attributionSidebarView];
        [v61 fullContentWidth];
        double v63 = v62;
        [v61 previewContentWidth];
        double v65 = v64;
        if ([(ICAttributionSidebarController *)self attributionSidebarVisibility]) {
          BOOL v66 = 0;
        }
        else {
          BOOL v66 = v22;
        }
        if (v66
          || [(ICAttributionSidebarController *)self attributionSidebarVisibility] == 2
          && v108 < 0.0)
        {
          v67 = NSNumber;
          v68 = [(ICAttributionSidebarController *)self textView];
          [v68 contentOffset];
          v70 = [v67 numberWithDouble:v69];
          [(ICAttributionSidebarController *)self setAttributionSidebarGestureBaselineContentOffsetY:v70];
        }
        [(ICAttributionSidebarController *)self attributionSidebarGestureBaselineX];
        if (!v37)
        {
          double v74 = v71;
          if ([v4 state] == 2)
          {
            [(ICAttributionSidebarController *)self attributionSidebarGestureBaselineX];
            double v76 = v75;
            [(ICAttributionSidebarController *)self attributionSidebarGestureAcceptedDistanceX];
            double v74 = v76 + v77;
            if (v74 > v63 || v74 < 0.0)
            {
              if (v74 <= v63) {
                double v74 = -((1.0 - 1.0 / (v74 / v63 * -0.55 + 1.0)) * v63);
              }
              else {
                double v74 = v63 + (1.0 - 1.0 / ((v74 - v63) / v63 * 0.55 + 1.0)) * v63;
              }
            }
          }
LABEL_81:
          v83 = [(ICAttributionSidebarController *)self textView];
          v84 = [v83 editorController];
          v85 = [v84 note];

          [v61 visibleContentWidth];
          if (v86 == 0.0 && v74 > 0.0 && v85)
          {
            v87 = [(ICAttributionSidebarController *)self eventReporter];
            [v87 startAttributionSideBarViewEventForNote:v85];
          }
          [v61 fullContentWidth];
          if (v74 >= v88)
          {
            [v61 visibleContentWidth];
            double v91 = v90;
            [v61 fullContentWidth];
            BOOL v89 = v91 < v92;
          }
          else
          {
            BOOL v89 = 0;
          }
          if (v74 <= 0.0)
          {
            [v61 visibleContentWidth];
            BOOL v93 = v94 > 0.0;
          }
          else
          {
            BOOL v93 = 0;
          }
          if (!v89 && !v93)
          {
LABEL_100:
            uint64_t v105 = [v4 state];
            if (ICInternalSettingsIsTextKit2Enabled())
            {
              v106 = [(ICAttributionSidebarController *)self sidebarWidthDidChangeHandler];

              if (!v106)
              {
LABEL_105:

                goto LABEL_106;
              }
              v107 = [(ICAttributionSidebarController *)self sidebarWidthDidChangeHandler];
              ((void (**)(void, BOOL, BOOL, double, double))v107)[2](v107, !v37, v105 != 2, v74, v108);
            }
            else
            {
              v107 = [(ICAttributionSidebarController *)self textViewController];
              [v107 setAttributionSidebarWidth:!v37 isGestureActive:v105 != 2 animated:v74 currentVelocity:v108];
            }

            goto LABEL_105;
          }
          if (v85)
          {
            if (v89)
            {
              v95 = [(ICAttributionSidebarController *)self eventReporter];
              [v95 submitAttributionSideBarViewEventForNote:v85 contextPath:3 startState:2 endState:3];

              v96 = [(ICAttributionSidebarController *)self eventReporter];
              [v96 startAttributionSideBarViewEventForNote:v85];
            }
            else
            {
              if (!v93) {
                goto LABEL_98;
              }
              v96 = [(ICAttributionSidebarController *)self eventReporter];
              [v96 submitAttributionSideBarViewEventForNote:v85 contextPath:3 startState:3 endState:1];
            }
          }
LABEL_98:
          v97 = [(ICAttributionSidebarController *)self attributionSidebarGestureBaselineContentOffsetY];

          if (v97)
          {
            v98 = [(ICAttributionSidebarController *)self textView];
            [v98 contentOffset];
            double v100 = v99;
            v101 = [(ICAttributionSidebarController *)self attributionSidebarGestureBaselineContentOffsetY];
            [v101 floatValue];
            double v103 = v102;
            v104 = [(ICAttributionSidebarController *)self textView];
            objc_msgSend(v104, "setContentOffset:", v100, v103);
          }
          goto LABEL_100;
        }
        if (v20 <= 300.0)
        {
          LOBYTE(v73) = 0;
        }
        else
        {
          v72 = [(ICAttributionSidebarController *)self textView];
          int v73 = [v72 isScrolling] ^ 1;
        }
        v78 = [(ICAttributionSidebarController *)self attributionSidebarView];
        [v78 visibleContentWidth];
        double v80 = v79;

        if (v22)
        {
          if (v80 > v65) {
            char v81 = 1;
          }
          else {
            char v81 = v73;
          }
          double v74 = 0.0;
          if ((v81 & 1) == 0) {
            goto LABEL_78;
          }
        }
        else
        {
          if (v80 < v65) {
            char v82 = 1;
          }
          else {
            char v82 = v73;
          }
          double v74 = 0.0;
          if (v82) {
            goto LABEL_78;
          }
        }
        double v74 = v63;
        if (v63 > 0.0)
        {
LABEL_80:
          [(ICAttributionSidebarController *)self setAttributionSidebarGestureBaselineContentOffsetY:0];
          goto LABEL_81;
        }
LABEL_78:
        if ([(ICAttributionSidebarController *)self attributionSidebarVisibility] >= 1)
        {
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __51__ICAttributionSidebarController_handlePanGesture___block_invoke;
          block[3] = &unk_2640B8140;
          id v111 = v61;
          dispatch_async(MEMORY[0x263EF83A0], block);
        }
        goto LABEL_80;
      }
    }
    else
    {
    }
  }
  [(ICAttributionSidebarController *)self attributionSidebarGestureAcceptedDistanceX];
  [(ICAttributionSidebarController *)self setAttributionSidebarGestureIgnoredDistanceX:v109 - v48];
  if (v19 > v20 * 3.0
    && [(ICAttributionSidebarController *)self attributionSidebarVisibility] == 2)
  {
    v49 = [(ICAttributionSidebarController *)self textView];
    int v50 = [v49 isEditing];

    if (v50)
    {
      if (v19 > 80.0)
      {
        v51 = [(ICAttributionSidebarController *)self textView];
        [v51 resignFirstResponder];
      }
    }
  }
  if (v37 && ![(ICAttributionSidebarController *)self attributionSidebarVisibility])
  {
    [(ICAttributionSidebarController *)self attributionSidebarGestureAcceptedDistanceX];
    if (v52 != 0.0)
    {
      if (!ICInternalSettingsIsTextKit2Enabled())
      {
        v54 = [(ICAttributionSidebarController *)self textViewController];
        [v54 setAttributionSidebarWidth:0 isGestureActive:0 animated:0.0 currentVelocity:v108];
        goto LABEL_65;
      }
      v53 = [(ICAttributionSidebarController *)self sidebarWidthDidChangeHandler];

      if (v53)
      {
        v54 = [(ICAttributionSidebarController *)self sidebarWidthDidChangeHandler];
        v54[2](v54, 0, 0, 0.0, v108);
LABEL_65:
      }
    }
  }
LABEL_106:
}

uint64_t __51__ICAttributionSidebarController_handlePanGesture___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) unfocusAttributionDetails];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  if ([(ICAttributionSidebarController *)self ic_didAddObserverForContext:a6 inScope:"/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/iOS/Editor/Attributions/ICAttributionSidebarController.m"])
  {
    char v13 = [(ICAttributionSidebarController *)self ic_shouldIgnoreObserveValue:v11 ofObject:v12 forKeyPath:v10];

    if (a6 == &compoundliteral_2
      && (v13 & 1) == 0
      && [v10 isEqualToString:@"textView"])
    {
      v14 = [(ICAttributionSidebarController *)self panGestureRecognizer];
      double v15 = [v14 view];
      double v16 = [(ICAttributionSidebarController *)self panGestureRecognizer];
      [v15 removeGestureRecognizer:v16];

      double v17 = [(ICAttributionSidebarController *)self textViewController];
      double v18 = [v17 textView];
      double v19 = [(ICAttributionSidebarController *)self panGestureRecognizer];
      [v18 addGestureRecognizer:v19];
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)ICAttributionSidebarController;
    [(ICAttributionSidebarController *)&v20 observeValueForKeyPath:v10 ofObject:v12 change:v11 context:a6];
  }
}

- (void)noteDidUpdateShare:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 object];

  ICCheckedDynamicCast();
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  double v6 = [(ICAttributionSidebarController *)self textView];
  double v7 = [v6 editorController];
  int v8 = [v7 note];

  double v9 = [v8 objectID];
  id v10 = [v12 objectID];
  if ([v9 isEqual:v10])
  {
    char v11 = [v8 isSharedViaICloud];

    if ((v11 & 1) == 0) {
      [(ICAttributionSidebarController *)self hideSidebarAnimated:1];
    }
  }
  else
  {
  }
}

- (ICNAEventReporter)eventReporter
{
  v2 = [(ICAttributionSidebarController *)self textView];
  BOOL v3 = [v2 editorController];
  id v4 = [v3 eventReporter];

  return (ICNAEventReporter *)v4;
}

- (ICTextViewController)textViewController
{
  return self->_textViewController;
}

- (id)sidebarWidthDidChangeHandler
{
  return self->_sidebarWidthDidChangeHandler;
}

- (double)attributionSidebarGestureBaselineX
{
  return self->_attributionSidebarGestureBaselineX;
}

- (void)setAttributionSidebarGestureBaselineX:(double)a3
{
  self->_attributionSidebarGestureBaselineX = a3;
}

- (NSNumber)attributionSidebarGestureBaselineContentOffsetY
{
  return self->_attributionSidebarGestureBaselineContentOffsetY;
}

- (void)setAttributionSidebarGestureBaselineContentOffsetY:(id)a3
{
}

- (double)attributionSidebarGestureAcceptedDistanceX
{
  return self->_attributionSidebarGestureAcceptedDistanceX;
}

- (void)setAttributionSidebarGestureAcceptedDistanceX:(double)a3
{
  self->_attributionSidebarGestureAcceptedDistanceX = a3;
}

- (double)attributionSidebarGestureIgnoredDistanceX
{
  return self->_attributionSidebarGestureIgnoredDistanceX;
}

- (void)setAttributionSidebarGestureIgnoredDistanceX:(double)a3
{
  self->_attributionSidebarGestureIgnoredDistanceX = a3;
}

- (BOOL)attributionSidebarGestureHasBegunToOpen
{
  return self->_attributionSidebarGestureHasBegunToOpen;
}

- (void)setAttributionSidebarGestureHasBegunToOpen:(BOOL)a3
{
  self->_attributionSidebarGestureHasBegunToOpen = a3;
}

- (NSDate)attributionSidebarGestureStartTime
{
  return self->_attributionSidebarGestureStartTime;
}

- (void)setAttributionSidebarGestureStartTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionSidebarGestureStartTime, 0);
  objc_storeStrong((id *)&self->_attributionSidebarGestureBaselineContentOffsetY, 0);
  objc_storeStrong(&self->_sidebarWidthDidChangeHandler, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_textViewController, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end