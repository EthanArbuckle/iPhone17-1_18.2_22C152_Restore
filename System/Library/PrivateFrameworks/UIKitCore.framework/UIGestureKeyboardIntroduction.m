@interface UIGestureKeyboardIntroduction
- (BOOL)showGestureKeyboardIntroduction;
- (UIGestureKeyboardIntroduction)initWithLayoutStar:(id)a3 completion:(id)a4;
- (void)dismissGestureKeyboardIntroduction;
- (void)dismissGestureKeyboardIntroduction:(id)a3;
- (void)insertText:(id)a3 forKey:(id)a4;
- (void)playGestureKeyboardIntroduction:(id)a3;
- (void)tryGestureKeyboardFromView:(id)a3 withEvent:(id)a4;
@end

@implementation UIGestureKeyboardIntroduction

- (UIGestureKeyboardIntroduction)initWithLayoutStar:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UIGestureKeyboardIntroduction;
  v9 = [(UIGestureKeyboardIntroduction *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->m_layout, a3);
    uint64_t v11 = [v8 copy];
    id m_completionBlock = v10->m_completionBlock;
    v10->id m_completionBlock = (id)v11;
  }
  return v10;
}

- (BOOL)showGestureKeyboardIntroduction
{
  v2 = self;
  v88[2] = *MEMORY[0x1E4F143B8];
  v3 = [(UIKeyboardLayoutStar *)self->m_layout currentKeyplane];
  v4 = [(UIKeyboardLayoutStar *)v2->m_layout currentKeyplaneView];
  v5 = [v3 subtrees];
  v6 = [v5 firstObject];

  id v7 = [v6 keySet];
  id v8 = [v7 subtrees];
  unint64_t v9 = [v8 count];

  if (v9 > 1)
  {
    v12 = [v6 keySet];
    v13 = [v12 subtrees];
    if ((unint64_t)[v13 count] < 2)
    {
      v16 = 0;
    }
    else
    {
      objc_super v14 = [v6 keySet];
      v15 = [v14 subtrees];
      v16 = [v15 objectAtIndexedSubscript:1];
    }
    v17 = [v16 subtrees];
    if ((unint64_t)[v17 count] < 4)
    {
      v19 = 0;
    }
    else
    {
      v18 = [v16 subtrees];
      v19 = [v18 objectAtIndexedSubscript:3];
    }
    v20 = [v6 keySet];
    v21 = [v20 subtrees];
    if ([v21 count])
    {
      [v6 keySet];
      v79 = v2;
      v22 = v6;
      v23 = v3;
      v24 = v4;
      v26 = v25 = v19;
      v27 = [v26 subtrees];
      v28 = [v27 objectAtIndexedSubscript:0];

      v16 = v26;
      v19 = v25;
      v4 = v24;
      v3 = v23;
      v6 = v22;
      v2 = v79;
    }
    else
    {
      v28 = 0;
    }

    v29 = [v28 subtrees];
    if ((unint64_t)[v29 count] <= 4)
    {

      v31 = 0;
    }
    else
    {
      v30 = [v28 subtrees];
      v31 = [v30 objectAtIndexedSubscript:4];

      if (v19
        && v31
        && [v19 displayTypeHint] == 10
        && [v31 displayTypeHint] == 10)
      {
        v32 = +[UIKeyboardImpl activeInstance];
        [v32 setHidden:1];
        v33 = [UIView alloc];
        [v32 frame];
        uint64_t v34 = -[UIView initWithFrame:](v33, "initWithFrame:");
        m_view = v2->m_view;
        v2->m_view = (UIView *)v34;

        v36 = [v32 superview];
        [v36 addSubview:v2->m_view];

        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __64__UIGestureKeyboardIntroduction_showGestureKeyboardIntroduction__block_invoke;
        aBlock[3] = &unk_1E52F55B8;
        aBlock[4] = v2;
        id v82 = v4;
        id v83 = v3;
        id v76 = v32;
        id v84 = v76;
        v37 = (void (**)(void *, void *, uint64_t))_Block_copy(aBlock);
        v77 = v19;
        uint64_t v38 = v37[2](v37, v19, 1);
        m_firstKeyView = v2->m_firstKeyView;
        v2->m_firstKeyView = (UIKBKeyView *)v38;

        v75 = v37;
        uint64_t v40 = v37[2](v37, v31, 0);
        m_secondKeyView = v2->m_secondKeyView;
        v2->m_secondKeyView = (UIKBKeyView *)v40;

        [(UIView *)v2->m_view size];
        double v43 = v42;
        v44 = [UILabel alloc];
        v45 = -[UILabel initWithFrame:](v44, "initWithFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v43, 60.0);
        [(UIView *)v2->m_view center];
        double v47 = v46;
        [(UIView *)v2->m_view size];
        -[UIView setCenter:](v45, "setCenter:", v47, v48 * 0.25);
        [(UILabel *)v45 setUserInteractionEnabled:0];
        [(UILabel *)v45 setNumberOfLines:0];
        v80 = v45;
        [(UILabel *)v45 setTextAlignment:1];
        v78 = _UINSLocalizedStringWithDefaultValue(@"To access the alternate letters on the keyboard,\npull down on the key and release.", @"To access the alternate letters on the keyboard,\npull down on the key and release.");
        v87[0] = *(void *)off_1E52D2048;
        uint64_t v49 = v87[0];
        v50 = [(UIKeyboardLayoutStar *)v2->m_layout renderConfig];
        uint64_t v72 = v49;
        if ([v50 whiteText]) {
          +[UIColor whiteColor];
        }
        else {
        v53 = +[UIColor grayColor];
        }
        v88[0] = v53;
        uint64_t v71 = *(void *)off_1E52D2040;
        v87[1] = *(void *)off_1E52D2040;
        v54 = [off_1E52D39B8 systemFontOfSize:17.0];
        v88[1] = v54;
        uint64_t v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:v87 count:2];

        v74 = (void *)v55;
        v56 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v78 attributes:v55];
        [(UILabel *)v80 setAttributedText:v56];

        [(UIView *)v2->m_view addSubview:v80];
        uint64_t v57 = +[UIButton buttonWithType:1];
        v85[0] = v72;
        v58 = [(UIKeyboardLayoutStar *)v2->m_layout renderConfig];
        v73 = (void *)v57;
        if ([v58 whiteText]) {
          +[UIColor whiteColor];
        }
        else {
        v59 = +[UIColor systemBlueColor];
        }
        v85[1] = v71;
        v86[0] = v59;
        v60 = [off_1E52D39B8 systemFontOfSize:17.0];
        v86[1] = v60;
        v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:v85 count:2];

        id v62 = objc_alloc(MEMORY[0x1E4F28B18]);
        v63 = _UINSLocalizedStringWithDefaultValue(@"OK", @"OK");
        v64 = (void *)[v62 initWithString:v63 attributes:v61];

        [v73 setAttributedTitle:v64 forState:0];
        [v73 addTarget:v2 action:sel_dismissGestureKeyboardIntroduction_ forControlEvents:64];
        [(UIView *)v2->m_view size];
        objc_msgSend(v73, "setSize:", v65 * 0.25, 20.0);
        [(UIView *)v2->m_view center];
        double v67 = v66;
        [(UIView *)v2->m_view size];
        objc_msgSend(v73, "setCenter:", v67, v68 * 7.0 * 0.125);
        [(UIView *)v2->m_view addSubview:v73];
        v2->m_start = CFAbsoluteTimeGetCurrent();
        [(NSTimer *)v2->m_gestureKeyboardInfoTimer invalidate];
        BOOL v11 = 1;
        uint64_t v69 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:v2 target:sel_playGestureKeyboardIntroduction_ selector:0 userInfo:1 repeats:0.02];
        m_gestureKeyboardInfoTimer = v2->m_gestureKeyboardInfoTimer;
        v2->m_gestureKeyboardInfoTimer = (NSTimer *)v69;

        v19 = v77;
        goto LABEL_21;
      }
    }
    (*((void (**)(void))v2->m_completionBlock + 2))();
    id m_completionBlock = v2->m_completionBlock;
    v2->id m_completionBlock = 0;

    BOOL v11 = 0;
LABEL_21:

    goto LABEL_22;
  }
  (*((void (**)(void))v2->m_completionBlock + 2))();
  id v10 = v2->m_completionBlock;
  v2->id m_completionBlock = 0;

  BOOL v11 = 0;
LABEL_22:

  return v11;
}

id __64__UIGestureKeyboardIntroduction_showGestureKeyboardIntroduction__block_invoke(uint64_t a1, void *a2, int a3)
{
  v5 = *(void **)(*(void *)(a1 + 32) + 8);
  id v6 = a2;
  [v5 setState:2 forKey:v6];
  id v7 = [*(id *)(a1 + 40) factory];
  id v8 = [v7 traitsForKey:v6 onKeyplane:*(void *)(a1 + 48)];

  unint64_t v9 = [v8 geometry];
  [v9 displayFrame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  v18 = objc_msgSend(*(id *)(a1 + 40), "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0, v11, v13, v15, v17, 0.0, 0.0, 0.0, 0.0);
  v19 = [*(id *)(a1 + 56) window];
  v20 = [v19 screen];
  [v20 scale];
  objc_msgSend(v18, "setContentScaleFactor:");

  double v21 = v15 + 8.0;
  if (a3) {
    double v21 = -(v15 + 8.0);
  }
  double v22 = v21 * 0.5;
  [*(id *)(*(void *)(a1 + 32) + 16) center];
  double v24 = v22 + v23;
  [*(id *)(*(void *)(a1 + 32) + 16) center];
  [v18 setCenter:v24];
  [*(id *)(*(void *)(a1 + 32) + 16) addSubview:v18];
  [*(id *)(*(void *)(a1 + 32) + 8) setState:4 forKey:v6];
  v25 = [*(id *)(a1 + 40) viewForKey:v6];

  [v25 removeFromSuperview];
  [v18 center];
  objc_msgSend(v25, "setCenter:");
  v26 = +[UIButton buttonWithType:1];
  [v26 addTarget:*(void *)(a1 + 32) action:sel_tryGestureKeyboardFromView_withEvent_ forControlEvents:4095];
  [v18 frame];
  objc_msgSend(v26, "setFrame:");
  [*(id *)(*(void *)(a1 + 32) + 16) addSubview:v26];

  return v25;
}

- (void)insertText:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[UIKeyboardImpl activeInstance];
  unint64_t v9 = [(UIKeyboardLayoutStar *)self->m_layout createKeyEventForStringAction:v7 forKey:v6 inputFlags:0];

  if (qword_1EB261770 != -1) {
    dispatch_once(&qword_1EB261770, &__block_literal_global_320);
  }
  double v10 = [v8 taskQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__UIGestureKeyboardIntroduction_insertText_forKey___block_invoke_3;
  v14[3] = &unk_1E52E3628;
  id v15 = v8;
  id v16 = v9;
  uint64_t v11 = _MergedGlobals_1117;
  id v12 = v9;
  id v13 = v8;
  [v10 performSingleTask:v14 breadcrumb:v11];

  ++self->m_insertedTextLength;
}

void __51__UIGestureKeyboardIntroduction_insertText_forKey___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_58_1 copy];
  v1 = (void *)_MergedGlobals_1117;
  _MergedGlobals_1117 = v0;
}

uint64_t __51__UIGestureKeyboardIntroduction_insertText_forKey___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __51__UIGestureKeyboardIntroduction_insertText_forKey___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleKeyEvent:*(void *)(a1 + 40) executionContext:a2];
}

- (void)tryGestureKeyboardFromView:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = [a4 touchesForView:v6];
  id v8 = [v7 anyObject];

  [v8 locationInView:v6];
  CGFloat v10 = v9;
  double v12 = v11;
  double y = self->m_initPoint.y;
  [v6 size];
  double v15 = v14;
  [v6 center];
  double v17 = v16;
  [(UIView *)self->m_view center];
  if (v17 >= v18) {
    uint64_t v19 = 32;
  }
  else {
    uint64_t v19 = 24;
  }
  id v20 = *(id *)((char *)&self->super.isa + v19);
  [v6 center];
  double v22 = v21;
  [(UIView *)self->m_view center];
  if (v22 <= v23) {
    uint64_t v24 = 32;
  }
  else {
    uint64_t v24 = 24;
  }
  id v25 = *(id *)((char *)&self->super.isa + v24);
  double v26 = (v12 - y) / v15;
  switch([v8 phase])
  {
    case 0:
      [(NSTimer *)self->m_gestureKeyboardInfoTimer invalidate];
      m_gestureKeyboardInfoTimer = self->m_gestureKeyboardInfoTimer;
      self->m_gestureKeyboardInfoTimer = 0;

      self->m_initPoint.x = v10;
      self->m_initPoint.double y = v12;
      self->m_hasPeeked = 0;
      v31 = [v25 superview];

      if (v31)
      {
        v32 = [(UIKeyboardLayoutStar *)self->m_layout keyViewAnimator];
        [v32 endTransitionForKeyView:v25];

        dispatch_time_t v33 = dispatch_time(0, 100000000);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __70__UIGestureKeyboardIntroduction_tryGestureKeyboardFromView_withEvent___block_invoke;
        block[3] = &unk_1E52D9F70;
        id v48 = v25;
        dispatch_after(v33, MEMORY[0x1E4F14428], block);
      }
      uint64_t v34 = [v20 superview];

      if (v34)
      {
        v35 = [(UIKeyboardLayoutStar *)self->m_layout keyViewAnimator];
        [v35 endTransitionForKeyView:v20];
      }
      else
      {
        [(UIView *)self->m_view addSubview:v20];
      }
      break;
    case 1:
    case 2:
      v27 = [(UIKeyboardLayoutStar *)self->m_layout keyViewAnimator];
      double v28 = v12 - self->m_initPoint.y;
      [v6 size];
      objc_msgSend(v27, "updateTransitionForKeyView:normalizedDragSize:", v20, 0.0, v28 / v29);

      if (v26 > 0.5) {
        self->m_hasPeeked = 1;
      }
      break;
    case 3:
      if (v26 > 0.5)
      {
        v36 = [v20 key];
        v37 = [v36 secondaryRepresentedStrings];
        uint64_t v38 = [v37 firstObject];
        v39 = [v20 key];
        uint64_t v40 = [v39 gestureKey];
        [(UIGestureKeyboardIntroduction *)self insertText:v38 forKey:v40];

        goto LABEL_17;
      }
      if (self->m_hasPeeked) {
        goto LABEL_20;
      }
      v41 = [v20 key];
      double v43 = [v41 representedString];
      v44 = [v20 key];
      [(UIGestureKeyboardIntroduction *)self insertText:v43 forKey:v44];

      goto LABEL_18;
    case 4:
      if (v26 > 0.5)
      {
LABEL_17:
        v41 = [(UIKeyboardLayoutStar *)self->m_layout keyViewAnimator];
        [v41 endTransitionForKeyView:v20];
LABEL_18:
      }
LABEL_20:
      dispatch_time_t v42 = dispatch_time(0, 100000000);
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __70__UIGestureKeyboardIntroduction_tryGestureKeyboardFromView_withEvent___block_invoke_2;
      v45[3] = &unk_1E52D9F70;
      id v46 = v20;
      dispatch_after(v42, MEMORY[0x1E4F14428], v45);

      break;
    default:
      break;
  }
}

uint64_t __70__UIGestureKeyboardIntroduction_tryGestureKeyboardFromView_withEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

uint64_t __70__UIGestureKeyboardIntroduction_tryGestureKeyboardFromView_withEvent___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)playGestureKeyboardIntroduction:(id)a3
{
  double v4 = CFAbsoluteTimeGetCurrent() - self->m_start;
  if (v4 >= 8.0)
  {
    CGFloat v10 = [(UIView *)self->m_firstKeyView superview];

    if (v10) {
      [(UIKBKeyView *)self->m_firstKeyView removeFromSuperview];
    }
    double v11 = [(UIView *)self->m_secondKeyView superview];

    if (v11) {
      [(UIKBKeyView *)self->m_secondKeyView removeFromSuperview];
    }
    [(NSTimer *)self->m_gestureKeyboardInfoTimer invalidate];
    m_gestureKeyboardInfoTimer = self->m_gestureKeyboardInfoTimer;
    self->m_gestureKeyboardInfoTimer = 0;
  }
  else
  {
    double v5 = floor(v4 * 0.5);
    double v6 = v4 - (v5 + v5);
    if (v6 < 1.3)
    {
      id v7 = [(UIView *)self->m_firstKeyView superview];

      if (v7) {
        [(UIKBKeyView *)self->m_firstKeyView removeFromSuperview];
      }
      id v8 = [(UIView *)self->m_secondKeyView superview];

      if (v8)
      {
        m_secondKeyView = self->m_secondKeyView;
        [(UIKBKeyView *)m_secondKeyView removeFromSuperview];
      }
      return;
    }
    int v13 = (int)v4 & 3;
    if ((int)v4 <= 0) {
      int v13 = -(-(int)v4 & 3);
    }
    BOOL v14 = v13 < 2;
    uint64_t v15 = 32;
    if (v14) {
      uint64_t v15 = 24;
    }
    uint64_t v19 = (NSTimer *)*(id *)((char *)&self->super.isa + v15);
    -[UIView addSubview:](self->m_view, "addSubview:");
    double v16 = v6 + -1.3;
    if (v16 >= 0.5)
    {
      if (self->m_isInTransition)
      {
        double v18 = [(UIKeyboardLayoutStar *)self->m_layout keyViewAnimator];
        [v18 endTransitionForKeyView:v19];

        self->m_isInTransition = 0;
      }
    }
    else
    {
      double v17 = [(UIKeyboardLayoutStar *)self->m_layout keyViewAnimator];
      objc_msgSend(v17, "updateTransitionForKeyView:normalizedDragSize:", v19, 0.0, v16 + v16);

      self->m_isInTransition = 1;
    }
    m_gestureKeyboardInfoTimer = v19;
  }
}

- (void)dismissGestureKeyboardIntroduction:(id)a3
{
  [(NSTimer *)self->m_gestureKeyboardInfoTimer invalidate];
  m_gestureKeyboardInfoTimer = self->m_gestureKeyboardInfoTimer;
  self->m_gestureKeyboardInfoTimer = 0;

  [(UIKBKeyView *)self->m_firstKeyView removeFromSuperview];
  m_firstKeyView = self->m_firstKeyView;
  self->m_firstKeyView = 0;

  [(UIKBKeyView *)self->m_secondKeyView removeFromSuperview];
  m_secondKeyView = self->m_secondKeyView;
  self->m_secondKeyView = 0;

  [(UIView *)self->m_view removeFromSuperview];
  id v11 = +[UIKeyboardImpl activeInstance];
  [v11 setHidden:0];
  if (self->m_insertedTextLength)
  {
    unint64_t v8 = 0;
    do
    {
      [v11 deleteFromInput];
      ++v8;
    }
    while (self->m_insertedTextLength > v8);
  }
  id m_completionBlock = (void (**)(id, BOOL))self->m_completionBlock;
  if (m_completionBlock)
  {
    m_completionBlock[2](m_completionBlock, a3 != 0);
    id v10 = self->m_completionBlock;
    self->id m_completionBlock = 0;
  }
}

- (void)dismissGestureKeyboardIntroduction
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_gestureKeyboardInfoTimer, 0);
  objc_storeStrong(&self->m_completionBlock, 0);
  objc_storeStrong((id *)&self->m_secondKeyView, 0);
  objc_storeStrong((id *)&self->m_firstKeyView, 0);
  objc_storeStrong((id *)&self->m_view, 0);
  objc_storeStrong((id *)&self->m_layout, 0);
}

@end