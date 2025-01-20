@interface _UIScrollViewFPSHUD
+ (id)createFPSHUD;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (UILabel)createFormattedLabel;
- (_UIScrollViewFPSHUD)initWithFrame:(CGRect)a3;
- (uint64_t)displayUpdateRequest:(uint64_t)a3 reportedRateForPreviousFrame:;
- (void)updateDebugOverlayBounds:(CGFloat)a3 withScrollView:(CGFloat)a4;
@end

@implementation _UIScrollViewFPSHUD

+ (id)createFPSHUD
{
  v0 = (objc_class *)self;
  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v1 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1) {
    goto LABEL_4;
  }
  int v4 = _UIInternalPreference_UIScrollViewFPSHUD;
  if (_UIInternalPreferencesRevisionVar == _UIInternalPreference_UIScrollViewFPSHUD) {
    goto LABEL_4;
  }
  while (v1 >= v4)
  {
    _UIInternalPreferenceSync(v1, &_UIInternalPreference_UIScrollViewFPSHUD, @"UIScrollViewFPSHUD", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
    v2 = 0;
    int v4 = _UIInternalPreference_UIScrollViewFPSHUD;
    if (v1 == _UIInternalPreference_UIScrollViewFPSHUD) {
      goto LABEL_5;
    }
  }
  if (!byte_1EB2577FC)
  {
LABEL_4:
    v2 = 0;
  }
  else
  {
    id v5 = [v0 alloc];
    v2 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
LABEL_5:
  return v2;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (UILabel)createFormattedLabel
{
  v0 = objc_alloc_init(UILabel);
  [(UILabel *)v0 setTextAlignment:0];
  int v1 = +[UIColor systemWhiteColor];
  [(UILabel *)v0 setTextColor:v1];

  return v0;
}

- (_UIScrollViewFPSHUD)initWithFrame:(CGRect)a3
{
  v42[8] = *MEMORY[0x1E4F143B8];
  v41.receiver = self;
  v41.super_class = (Class)_UIScrollViewFPSHUD;
  v3 = -[UIView initWithFrame:](&v41, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  int v4 = v3;
  if (v3)
  {
    v3->_previousFramePreferred = 0;
    uint64_t v5 = -[_UIScrollViewFPSHUD createFormattedLabel]();
    preferredLabel = v4->_preferredLabel;
    v4->_preferredLabel = (UILabel *)v5;

    uint64_t v7 = -[_UIScrollViewFPSHUD createFormattedLabel]();
    reportedLabel = v4->_reportedLabel;
    v4->_reportedLabel = (UILabel *)v7;

    uint64_t v9 = -[_UIScrollViewFPSHUD createFormattedLabel]();
    mismatchesLabel = v4->_mismatchesLabel;
    v4->_mismatchesLabel = (UILabel *)v9;

    [(UILabel *)v4->_mismatchesLabel setText:@"Mismatches"];
    v11 = objc_alloc_init(_UIScrollViewFPSHUDGraphView);
    preferredGraph = v4->_preferredGraph;
    v4->_preferredGraph = v11;

    v13 = objc_alloc_init(_UIScrollViewFPSHUDGraphView);
    reportedGraph = v4->_reportedGraph;
    v4->_reportedGraph = v13;

    v15 = objc_alloc_init(_UIScrollViewFPSHUDGraphView);
    mismatchesGraph = v4->_mismatchesGraph;
    v4->_mismatchesGraph = v15;

    v17 = objc_alloc_init(UIStackView);
    [(UIStackView *)v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v17 setAxis:1];
    [(UIStackView *)v17 setDistribution:3];
    v18 = +[UIColor systemBlackColor];
    v19 = [v18 colorWithAlphaComponent:0.800000012];
    [(UIStackView *)v17 setBackgroundColor:v19];

    [(UIStackView *)v17 addArrangedSubview:v4->_preferredLabel];
    [(UIStackView *)v17 addArrangedSubview:v4->_preferredGraph];
    [(UIStackView *)v17 addArrangedSubview:v4->_reportedLabel];
    [(UIStackView *)v17 addArrangedSubview:v4->_reportedGraph];
    [(UIStackView *)v17 addArrangedSubview:v4->_mismatchesLabel];
    [(UIStackView *)v17 addArrangedSubview:v4->_mismatchesGraph];
    [(UIStackView *)v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4 addSubview:v17];
    v32 = (void *)MEMORY[0x1E4F5B268];
    v40 = [(UIView *)v17 trailingAnchor];
    v39 = [(UIView *)v4 trailingAnchor];
    v38 = [v40 constraintEqualToAnchor:v39];
    v42[0] = v38;
    v37 = [(UIView *)v17 centerYAnchor];
    v36 = [(UIView *)v4 centerYAnchor];
    v35 = [v37 constraintEqualToAnchor:v36];
    v42[1] = v35;
    v34 = [(UIView *)v4->_preferredGraph heightAnchor];
    v33 = [v34 constraintEqualToConstant:30.0];
    v42[2] = v33;
    v31 = [(UIView *)v4->_preferredGraph widthAnchor];
    v30 = [v31 constraintEqualToConstant:160.0];
    v42[3] = v30;
    v29 = [(UIView *)v4->_reportedGraph heightAnchor];
    v20 = [v29 constraintEqualToConstant:30.0];
    v42[4] = v20;
    v21 = [(UIView *)v4->_reportedGraph widthAnchor];
    v22 = [v21 constraintEqualToConstant:160.0];
    v42[5] = v22;
    v23 = [(UIView *)v4->_mismatchesGraph heightAnchor];
    v24 = [v23 constraintEqualToConstant:5.0];
    v42[6] = v24;
    v25 = [(UIView *)v4->_mismatchesGraph widthAnchor];
    v26 = [v25 constraintEqualToConstant:160.0];
    v42[7] = v26;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:8];
    [v32 activateConstraints:v27];
  }
  return v4;
}

- (uint64_t)displayUpdateRequest:(uint64_t)a3 reportedRateForPreviousFrame:
{
  if (result)
  {
    uint64_t v5 = result;
    v6 = objc_msgSend(NSString, "stringWithFormat:", @"Preferred: %d", *(unsigned int *)(result + 456));
    [*(id *)(v5 + 408) setText:v6];

    -[_UIScrollViewFPSHUDGraphView addValue:](*(void *)(v5 + 432), *(_DWORD *)(v5 + 456));
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"Actual: %d", a3);
    [*(id *)(v5 + 416) setText:v7];

    -[_UIScrollViewFPSHUDGraphView addValue:](*(void *)(v5 + 440), a3);
    if (*(_DWORD *)(v5 + 456) == a3) {
      int v8 = 301;
    }
    else {
      int v8 = 300;
    }
    result = -[_UIScrollViewFPSHUDGraphView addValue:](*(void *)(v5 + 448), v8);
    *(_DWORD *)(v5 + 456) = *(_DWORD *)(a2 + 8);
  }
  return result;
}

- (void)updateDebugOverlayBounds:(CGFloat)a3 withScrollView:(CGFloat)a4
{
  id v11 = a2;
  if (a1)
  {
    v13 = v11;
    if ([a1 isDescendantOfView:v11]) {
      [v13 bringSubviewToFront:a1];
    }
    else {
      [v13 addSubview:a1];
    }
    [a1 frame];
    v16.origin.x = a3;
    v16.origin.y = a4;
    v16.size.width = a5;
    v16.size.height = a6;
    BOOL v12 = CGRectEqualToRect(v15, v16);
    id v11 = v13;
    if (!v12)
    {
      objc_msgSend(a1, "setFrame:", a3, a4, a5, a6);
      id v11 = v13;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mismatchesGraph, 0);
  objc_storeStrong((id *)&self->_reportedGraph, 0);
  objc_storeStrong((id *)&self->_preferredGraph, 0);
  objc_storeStrong((id *)&self->_mismatchesLabel, 0);
  objc_storeStrong((id *)&self->_reportedLabel, 0);
  objc_storeStrong((id *)&self->_preferredLabel, 0);
}

@end