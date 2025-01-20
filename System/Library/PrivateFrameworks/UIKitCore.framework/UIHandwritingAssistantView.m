@interface UIHandwritingAssistantView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)assistantFrameForKeyplane:(id)a3 key:(id)a4;
- (TUISystemInputAssistantView)systemInputAssistantView;
- (UIHandwritingAssistantView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5;
- (UIKBHandwritingCandidateView)candidateView;
- (UIKeyboardCandidatePocketShadow)rightBorder;
- (id)candidateList;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)dimKeys:(id)a3;
- (void)setCandidateView:(id)a3;
- (void)setRightBorder:(id)a3;
- (void)setSystemInputAssistantView:(id)a3;
- (void)updateForKeyplane:(id)a3 key:(id)a4;
@end

@implementation UIHandwritingAssistantView

- (UIHandwritingAssistantView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  id v12 = a5;
  v61.receiver = self;
  v61.super_class = (Class)UIHandwritingAssistantView;
  v13 = -[UIKBKeyView initWithFrame:keyplane:key:](&v61, sel_initWithFrame_keyplane_key_, v11, v12, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    [(UIView *)v13 setOpaque:0];
    [(UIView *)v14 setUserInteractionEnabled:1];
    uint64_t v15 = 0;
    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      uint64_t v15 = +[UIKeyboardImpl isFloating] ^ 1;
    }
    [(UIHandwritingAssistantView *)v14 assistantFrameForKeyplane:v11 key:v12];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    uint64_t v63 = 0;
    v64 = &v63;
    uint64_t v65 = 0x2050000000;
    v24 = (void *)_MergedGlobals_3_31;
    uint64_t v66 = _MergedGlobals_3_31;
    if (!_MergedGlobals_3_31)
    {
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __getTUISystemInputAssistantViewClass_block_invoke_0;
      v62[3] = &unk_1E52D9900;
      v62[4] = &v63;
      __getTUISystemInputAssistantViewClass_block_invoke_0((uint64_t)v62);
      v24 = (void *)v64[3];
    }
    v25 = v24;
    _Block_object_dispose(&v63, 8);
    v26 = objc_msgSend([v25 alloc], "initWithFrame:", v17, v19, v21, v23);
    [(UIHandwritingAssistantView *)v14 setSystemInputAssistantView:v26];

    [v12 paddedFrame];
    double v28 = v27;
    v29 = [(UIHandwritingAssistantView *)v14 systemInputAssistantView];
    [v29 setCenterViewWidth:v28];

    v30 = [(UIView *)v14 _inheritedRenderConfig];
    v31 = [(UIHandwritingAssistantView *)v14 systemInputAssistantView];
    [v31 setRenderConfig:v30];

    v32 = [(UIHandwritingAssistantView *)v14 systemInputAssistantView];
    [v32 setBackgroundVisible:0];

    v33 = [(UIHandwritingAssistantView *)v14 systemInputAssistantView];
    [v33 setShowsButtonBarItemsInline:v15];

    v34 = [(UIHandwritingAssistantView *)v14 systemInputAssistantView];
    [v34 setAutoresizingMask:18];

    v35 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    v36 = [v35 systemInputAssistantViewController];
    v37 = [(UIHandwritingAssistantView *)v14 systemInputAssistantView];
    [v37 setDelegate:v36];

    v38 = +[UIKeyboardImpl activeInstance];
    v39 = [v38 inputDelegateManager];
    v40 = [v39 keyInputDelegate];

    if ((objc_msgSend(v40, "__isKindOfUIResponder") & 1) == 0)
    {
      v41 = +[UIKeyboardImpl activeInstance];
      uint64_t v42 = [v41 delegateAsResponder];

      v40 = (void *)v42;
    }
    v43 = _UIResponderFindInputAssistantItem(v40);
    if (v15)
    {
      v44 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      v45 = [v44 systemInputAssistantViewController];
      [v45 setInputAssistantButtonItemsForResponder:0];

      v46 = [(UIHandwritingAssistantView *)v14 systemInputAssistantView];
      [v46 setInputAssistantItem:v43];
    }
    v47 = [(UIHandwritingAssistantView *)v14 systemInputAssistantView];
    [(UIView *)v14 addSubview:v47];

    v48 = [UIKBHandwritingCandidateView alloc];
    [(UIView *)v14 bounds];
    v49 = -[UIKBHandwritingCandidateView initWithFrame:keyplane:key:](v48, "initWithFrame:keyplane:key:", v11, v12);
    [(UIHandwritingAssistantView *)v14 setCandidateView:v49];

    v50 = [(UIHandwritingAssistantView *)v14 candidateView];
    v51 = [(UIHandwritingAssistantView *)v14 systemInputAssistantView];
    [v51 setCenterView:v50];

    [(UIView *)v14 setClipsToBounds:0];
    if (v15)
    {
      +[UIKeyboardCandidatePocketShadow widthWithShadow:0];
      double v53 = v52;
      [(UIView *)v14 bounds];
      +[UIKBHandwritingCandidateView shadowYForBounds:shadowHeight:](UIKBHandwritingCandidateView, "shadowYForBounds:shadowHeight:");
      double v55 = v54;
      v56 = [UIKeyboardCandidatePocketShadow alloc];
      v67.origin.double x = v17;
      v67.origin.double y = v19;
      v67.size.double width = v21;
      v67.size.double height = v23;
      v57 = -[UIKeyboardCandidatePocketShadow initWithFrame:](v56, "initWithFrame:", CGRectGetMaxX(v67) - v53, v55, v53, 36.0);
      [(UIHandwritingAssistantView *)v14 setRightBorder:v57];

      v58 = [(UIHandwritingAssistantView *)v14 rightBorder];
      [v58 setDrawsShadow:0];

      v59 = [(UIHandwritingAssistantView *)v14 rightBorder];
      [(UIView *)v14 addSubview:v59];
    }
  }

  return v14;
}

- (id)candidateList
{
  v2 = [(UIHandwritingAssistantView *)self candidateView];
  v3 = [v2 candidateList];

  return v3;
}

- (CGRect)assistantFrameForKeyplane:(id)a3 key:(id)a4
{
  id v6 = a3;
  [a4 paddedFrame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
    && !+[UIKeyboardImpl isFloating])
  {
    double v14 = -v8;
    double v19 = [v6 firstCachedKeyWithName:@"Delete-Key"];
    [v19 frame];
    double v17 = v20;
  }
  else
  {
    [(UIView *)self bounds];
    double v14 = v13;
    double v10 = v15;
    double v17 = v16;
    double v12 = v18;
  }

  double v21 = v14;
  double v22 = v10;
  double v23 = v17;
  double v24 = v12;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (void)updateForKeyplane:(id)a3 key:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(UIHandwritingAssistantView *)self candidateView];
  [v8 updateForKeyplane:v7 key:v6];

  [v6 paddedFrame];
  double v10 = v9;

  double v11 = [(UIHandwritingAssistantView *)self systemInputAssistantView];
  [v11 setCenterViewWidth:v10];

  id v13 = [(UIView *)self _inheritedRenderConfig];
  double v12 = [(UIHandwritingAssistantView *)self systemInputAssistantView];
  [v12 setRenderConfig:v13];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  double v9 = [(UIHandwritingAssistantView *)self systemInputAssistantView];
  objc_msgSend(v9, "convertPoint:fromView:", self, x, y);
  double v11 = v10;
  double v13 = v12;

  double v14 = [(UIHandwritingAssistantView *)self systemInputAssistantView];
  objc_msgSend(v14, "hitTest:withEvent:", v8, v11, v13);
  double v15 = (UIHandwritingAssistantView *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v22.receiver = self;
    v22.super_class = (Class)UIHandwritingAssistantView;
    -[UIView hitTest:withEvent:](&v22, sel_hitTest_withEvent_, v8, x, y);
    double v15 = (UIHandwritingAssistantView *)objc_claimAutoreleasedReturnValue();
  }
  if (v15 == self)
  {
    int v17 = 0;
  }
  else
  {
    uint64_t v16 = [(UIHandwritingAssistantView *)self systemInputAssistantView];
    if (v15 == (UIHandwritingAssistantView *)v16)
    {
      int v17 = 0;
      double v14 = v15;
    }
    else
    {
      double v14 = (void *)v16;
      v4 = [(UIHandwritingAssistantView *)self candidateView];
      if (![(UIView *)v15 isDescendantOfView:v4])
      {

        goto LABEL_16;
      }
      int v17 = 1;
    }
  }
  double v18 = +[UIKeyboardCandidateController sharedInstance];
  double v19 = [v18 candidateResultSet];
  char v20 = [v19 hasCandidates];

  if (v17) {
  if (v15 != self)
  }

  if ((v20 & 1) == 0)
  {
    double v14 = v15;
    double v15 = 0;
LABEL_16:
  }
  return v15;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = [(UIHandwritingAssistantView *)self systemInputAssistantView];
  objc_msgSend(v8, "convertPoint:fromView:", self, x, y);
  double v10 = v9;
  double v12 = v11;

  double v13 = [(UIHandwritingAssistantView *)self systemInputAssistantView];
  if (objc_msgSend(v13, "pointInside:withEvent:", v7, v10, v12))
  {
    BOOL v14 = 1;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)UIHandwritingAssistantView;
    BOOL v14 = -[UIView pointInside:withEvent:](&v16, sel_pointInside_withEvent_, v7, x, y);
  }

  return v14;
}

- (void)dimKeys:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = objc_msgSend(v4, "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        double v11 = [v4 objectForKeyedSubscript:v10];
        if (([v10 integerValue] & 4) != 0)
        {
          [v11 doubleValue];
          -[UIView setAlpha:](self, "setAlpha:");
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (TUISystemInputAssistantView)systemInputAssistantView
{
  return self->_systemInputAssistantView;
}

- (void)setSystemInputAssistantView:(id)a3
{
}

- (UIKBHandwritingCandidateView)candidateView
{
  return self->_candidateView;
}

- (void)setCandidateView:(id)a3
{
}

- (UIKeyboardCandidatePocketShadow)rightBorder
{
  return self->_rightBorder;
}

- (void)setRightBorder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightBorder, 0);
  objc_storeStrong((id *)&self->_candidateView, 0);
  objc_storeStrong((id *)&self->_systemInputAssistantView, 0);
}

@end