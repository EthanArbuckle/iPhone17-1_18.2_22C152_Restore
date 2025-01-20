@interface VUIVideoAdvisoryView
- (BOOL)_isPortrait;
- (BOOL)reduceMotion;
- (CGSize)_dividerSize;
- (CGSize)_legendSize;
- (CGSize)_logoSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)additionalViewsInfo;
- (NSArray)legendViews;
- (NSMutableArray)additionalViews;
- (UIEdgeInsets)_dividerMargin;
- (UIEdgeInsets)_legendsMargin;
- (UIEdgeInsets)_logoMargin;
- (UIEdgeInsets)_margin;
- (UIView)dividerView;
- (VUIAdditionalAdvisoryInfoView)photoSensitivityView;
- (VUIImageView)logoImageView;
- (VUIVideoAdvisoryView)initWithAdvisoryInfoDictionary:(id)a3 reduceMotion:(BOOL)a4;
- (VUIVideoAdvisoryViewLayout)layout;
- (double)legendAnimationDistance;
- (double)legendYAnimationDistance;
- (void)_configureSubviewsWithDictionary:(id)a3;
- (void)_hideWithCoreAnimationWithPlatterView:(id)a3 completion:(id)a4;
- (void)_showAdditionalViewAtIndex:(unint64_t)a3 animated:(BOOL)a4 platterView:(id)a5 superview:(id)a6 completion:(id)a7;
- (void)_showWithCoreAnimationWithPlatterView:(id)a3 completion:(id)a4;
- (void)hideAnimated:(BOOL)a3 platterView:(id)a4 completion:(id)a5;
- (void)layoutSubviews;
- (void)removeAllViews;
- (void)setAdditionalViews:(id)a3;
- (void)setAdditionalViewsInfo:(id)a3;
- (void)setDividerView:(id)a3;
- (void)setLayout:(id)a3;
- (void)setLegendAnimationDistance:(double)a3;
- (void)setLegendViews:(id)a3;
- (void)setLegendYAnimationDistance:(double)a3;
- (void)setLogoImageView:(id)a3;
- (void)setPhotoSensitivityView:(id)a3;
- (void)setReduceMotion:(BOOL)a3;
- (void)showAnimated:(BOOL)a3 platterView:(id)a4 completion:(id)a5;
@end

@implementation VUIVideoAdvisoryView

- (VUIVideoAdvisoryView)initWithAdvisoryInfoDictionary:(id)a3 reduceMotion:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VUIVideoAdvisoryView;
  v7 = -[VUIVideoAdvisoryView initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v7)
  {
    uint64_t v8 = objc_opt_new();
    layout = v7->_layout;
    v7->_layout = (VUIVideoAdvisoryViewLayout *)v8;

    [(VUIVideoAdvisoryView *)v7 _configureSubviewsWithDictionary:v6];
  }
  double v10 = 40.0;
  if (v4) {
    double v10 = 0.0;
  }
  v7->_legendAnimationDistance = v10;
  double v11 = 100.0;
  if (v4) {
    double v11 = 0.0;
  }
  v7->_legendYAnimationDistance = v11;
  v7->_reduceMotion = v4;
  v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  additionalViews = v7->_additionalViews;
  v7->_additionalViews = v12;

  return v7;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  [(VUIVideoAdvisoryView *)self _logoSize];
  double v54 = v6;
  double v55 = v7;
  [(VUIVideoAdvisoryView *)self _logoMargin];
  double v52 = v9;
  double v53 = v8;
  double v50 = v10;
  double v48 = v11;
  [(VUIVideoAdvisoryView *)self _legendsMargin];
  double v51 = v12;
  double v14 = v13;
  double v49 = v15;
  double v17 = v16;
  v18 = [(VUIVideoAdvisoryView *)self layout];
  v19 = [v18 legendLayout];
  [v19 margin];
  double v21 = v20;
  double v23 = v22;

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v24 = [(VUIVideoAdvisoryView *)self legendViews];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v56 objects:v60 count:16];
  double v46 = v17;
  double v47 = v14;
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v57;
    double v28 = v14 + v17;
    double v29 = v21 + v23;
    double v30 = 0.0;
    double v31 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v57 != v27) {
          objc_enumerationMutation(v24);
        }
        v33 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        objc_msgSend(v33, "sizeThatFits:", width, height, *(void *)&v46);
        double v30 = v30 + v34;
        objc_msgSend(v33, "legendDescriptionSizeThatFits:", width, height);
        double v36 = v35;
        objc_msgSend(v33, "legendNameSizeThatFits:", width, height);
        double v38 = v28 + v36 + v37 + v29 * 2.0;
        if (v38 > v31) {
          double v31 = v38;
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v56 objects:v60 count:16];
    }
    while (v26);
  }
  else
  {
    double v30 = 0.0;
    double v31 = 0.0;
  }

  v39 = [(VUIVideoAdvisoryView *)self legendViews];
  unint64_t v40 = [v39 count];

  v41 = [(VUIVideoAdvisoryView *)self legendViews];
  if ([v41 count]) {
    double v42 = v47 + v46 + v54 + v50 + v48 + v31;
  }
  else {
    double v42 = v54;
  }
  if (v30 + (double)v40 * (v51 + v49) >= v55 + v53 + v52) {
    double v43 = v30 + (double)v40 * (v51 + v49);
  }
  else {
    double v43 = v55 + v53 + v52;
  }

  double v44 = v42;
  double v45 = v43;
  result.double height = v45;
  result.double width = v44;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  v102.receiver = self;
  v102.super_class = (Class)VUIVideoAdvisoryView;
  [(VUIVideoAdvisoryView *)&v102 layoutSubviews];
  v3 = [(VUIVideoAdvisoryView *)self layout];
  int v4 = [(VUIVideoAdvisoryView *)self vuiIsRTL];
  [(VUIVideoAdvisoryView *)self bounds];
  double v90 = v5;
  double v92 = v6;
  double v8 = v7;
  double v10 = v9;
  [(VUIVideoAdvisoryView *)self _logoSize];
  double v12 = v11;
  double v87 = v13;
  [(VUIVideoAdvisoryView *)self _logoMargin];
  double v93 = v14;
  double v16 = v15;
  double v82 = v17;
  double v19 = v18;
  double v88 = v18;
  [(VUIVideoAdvisoryView *)self _dividerSize];
  double v89 = v20;
  double v81 = v21;
  [(VUIVideoAdvisoryView *)self _dividerMargin];
  double v80 = v22;
  double v91 = v23;
  double v84 = v24;
  [(VUIVideoAdvisoryView *)self _legendSize];
  double v26 = v25;
  [(VUIVideoAdvisoryView *)self _legendsMargin];
  double v85 = v27;
  double v86 = v28;
  double v83 = v29;
  double v30 = v8 - v19 - v12;
  double v31 = v12;
  double v32 = v90 + v16;
  if (v4) {
    double v33 = v30;
  }
  else {
    double v33 = v90 + v16;
  }
  VUIRoundValue();
  double v35 = v34;
  double v36 = [(VUIVideoAdvisoryView *)self logoImageView];
  objc_msgSend(v36, "setFrame:", v33, v35, v31, v87);

  if (v4) {
    double v37 = v30 - (v88 + v91 - v89);
  }
  else {
    double v37 = v32 + v91 + v88 + v31 + v32;
  }
  double v38 = [(VUIVideoAdvisoryView *)self dividerView];

  if (v38)
  {
    v39 = [(VUIVideoAdvisoryView *)self dividerView];
    [v39 frame];
    double v41 = v40;

    if (v41 > 0.0) {
      double v41 = v81;
    }
    double v42 = [(VUIVideoAdvisoryView *)self dividerView];
    objc_msgSend(v42, "setFrame:", v37, v92 + v80, v89, v41);

    double v43 = v89;
  }
  else
  {
    double v43 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  }
  double v44 = [(VUIVideoAdvisoryView *)self legendViews];
  uint64_t v45 = [v44 count];

  if (v45)
  {
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    double v46 = [(VUIVideoAdvisoryView *)self legendViews];
    uint64_t v47 = [v46 countByEnumeratingWithState:&v98 objects:v104 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)v99;
      double v50 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v48; ++i)
        {
          if (*(void *)v99 != v49) {
            objc_enumerationMutation(v46);
          }
          double v52 = *(void **)(*((void *)&v98 + 1) + 8 * i);
          [v3 legendNameMinWidth];
          double v54 = v53;
          objc_msgSend(v52, "legendNameSizeThatFits:", v8, v10);
          if (v54 >= v55) {
            double v55 = v54;
          }
          [v3 setLegendNameMinWidth:v55];
          objc_msgSend(v52, "sizeThatFits:", v8, v10);
          if (v50 < v56) {
            double v50 = v56;
          }
        }
        uint64_t v48 = [v46 countByEnumeratingWithState:&v98 objects:v104 count:16];
      }
      while (v48);
    }
    else
    {
      double v50 = 0.0;
    }

    long long v57 = [(VUIVideoAdvisoryView *)self legendViews];
    unint64_t v58 = [v57 count];

    if (v58 < 2)
    {
      if (v10 - (v93 + v82) < v50) {
        double v50 = v10 - (v93 + v82);
      }
      double v26 = v50;
      double v59 = v85;
    }
    else
    {
      double v59 = v85;
      v60 = [(VUIVideoAdvisoryView *)self legendViews];
      [v60 count];
      uint64_t v61 = [(VUIVideoAdvisoryView *)self legendViews];
      [v61 count];
    }
    VUIRoundValue();
    double v63 = v62;
    if (v4) {
      double v64 = v37 + v83 * -2.0;
    }
    else {
      double v64 = v8 - v37 + v83 * -2.0;
    }
    v65 = [(VUIVideoAdvisoryView *)self legendViews];
    uint64_t v66 = [v65 count];

    if (v66 == 1)
    {
      [v3 legendMaxWidth];
      double v64 = v67;
    }
    if (v4) {
      double v68 = v37 - (v83 + v84 + v64);
    }
    else {
      double v68 = v37 + v83 + v84 + v43;
    }
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    v69 = [(VUIVideoAdvisoryView *)self legendViews];
    uint64_t v70 = [v69 countByEnumeratingWithState:&v94 objects:v103 count:16];
    if (v70)
    {
      uint64_t v71 = v70;
      double v72 = v92 + v93 + v63;
      uint64_t v73 = *(void *)v95;
      do
      {
        for (uint64_t j = 0; j != v71; ++j)
        {
          if (*(void *)v95 != v73) {
            objc_enumerationMutation(v69);
          }
          v75 = *(void **)(*((void *)&v94 + 1) + 8 * j);
          v76 = [v75 layer];
          v77 = [v76 presentationLayer];
          double v78 = 0.0;
          if (!v77)
          {
            [(VUIVideoAdvisoryView *)self legendAnimationDistance];
            if (v4) {
              double v78 = -v79;
            }
            else {
              double v78 = v79;
            }
          }

          objc_msgSend(v75, "setFrame:", v68 + v78, v72, v64, v26);
          double v72 = v86 + v59 + v26 + v72;
        }
        uint64_t v71 = [v69 countByEnumeratingWithState:&v94 objects:v103 count:16];
      }
      while (v71);
    }
  }
}

- (void)removeAllViews
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(VUIVideoAdvisoryView *)self additionalViews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) removeFromSuperview];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(VUIVideoAdvisoryView *)self removeFromSuperview];
}

- (BOOL)_isPortrait
{
  v2 = [(VUIVideoAdvisoryView *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (!v3 && (unint64_t)(objc_msgSend(MEMORY[0x1E4FB1F48], "vui_interfaceOrientation") - 1) < 2
    || (BOOL v4 = +[VUIUtilities isIpadPortrait]))
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (UIEdgeInsets)_margin
{
  BOOL v3 = [(VUIVideoAdvisoryView *)self _isPortrait];
  BOOL v4 = [(VUIVideoAdvisoryView *)self layout];
  uint64_t v5 = v4;
  if (v3) {
    [v4 portraitMargin];
  }
  else {
    [v4 margin];
  }
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;

  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (CGSize)_logoSize
{
  BOOL v3 = [(VUIVideoAdvisoryView *)self _isPortrait];
  BOOL v4 = [(VUIVideoAdvisoryView *)self layout];
  uint64_t v5 = v4;
  if (v3) {
    [v4 portraitLogoSize];
  }
  else {
    [v4 logoSize];
  }
  double v8 = v6;
  double v9 = v7;

  double v10 = v8;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)_legendSize
{
  BOOL v3 = [(VUIVideoAdvisoryView *)self _isPortrait];
  BOOL v4 = [(VUIVideoAdvisoryView *)self layout];
  uint64_t v5 = v4;
  if (v3) {
    [v4 portraitLegendSize];
  }
  else {
    [v4 legendSize];
  }
  double v8 = v6;
  double v9 = v7;

  double v10 = v8;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)_dividerSize
{
  [(VUIVideoAdvisoryView *)self bounds];
  double v4 = v3;
  BOOL v5 = [(VUIVideoAdvisoryView *)self _isPortrait];
  double v6 = [(VUIVideoAdvisoryView *)self layout];
  double v7 = v6;
  if (v5) {
    [v6 portraitDividerSize];
  }
  else {
    [v6 dividerSize];
  }
  double v9 = v8;

  double v10 = v9;
  double v11 = v4;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (UIEdgeInsets)_logoMargin
{
  BOOL v3 = [(VUIVideoAdvisoryView *)self _isPortrait];
  double v4 = [(VUIVideoAdvisoryView *)self layout];
  BOOL v5 = v4;
  if (v3) {
    [v4 portraitLogoMargin];
  }
  else {
    [v4 logoMargin];
  }
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;

  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (UIEdgeInsets)_legendsMargin
{
  BOOL v3 = [(VUIVideoAdvisoryView *)self _isPortrait];
  double v4 = [(VUIVideoAdvisoryView *)self layout];
  BOOL v5 = v4;
  if (v3) {
    [v4 portraitLegendsMargin];
  }
  else {
    [v4 legendsMargin];
  }
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;

  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (UIEdgeInsets)_dividerMargin
{
  BOOL v3 = [(VUIVideoAdvisoryView *)self _isPortrait];
  double v4 = [(VUIVideoAdvisoryView *)self layout];
  BOOL v5 = v4;
  if (v3) {
    [v4 portraitDividerMargin];
  }
  else {
    [v4 dividerMargin];
  }
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;

  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (void)_configureSubviewsWithDictionary:(id)a3
{
  id v26 = a3;
  double v4 = objc_opt_new();
  BOOL v5 = [v26 objectForKeyedSubscript:@"VUIAdvisoryViewLogoImageKey"];
  if (v5) {
    [v4 setImage:v5];
  }
  [v4 setAlpha:0.0];
  [(VUIVideoAdvisoryView *)self addSubview:v4];
  [(VUIVideoAdvisoryView *)self setLogoImageView:v4];
  double v6 = [v26 objectForKeyedSubscript:@"VUIAdvisoryViewLegendsKey"];
  double v7 = objc_opt_new();
  if ([v6 count])
  {
    double v24 = v5;
    double v25 = v4;
    [(VUIVideoAdvisoryView *)self _dividerSize];
    double v9 = v8;
    double v10 = objc_opt_new();
    double v11 = [(VUIVideoAdvisoryView *)self layout];
    double v12 = [v11 dividerColor];
    [v10 setBackgroundColor:v12];

    objc_msgSend(v10, "setFrame:", 0.0, 0.0, v9, 0.0);
    [(VUIVideoAdvisoryView *)self addSubview:v10];
    double v23 = v10;
    [(VUIVideoAdvisoryView *)self setDividerView:v10];
    unint64_t v13 = [v6 count];
    if (v13 >= 6) {
      uint64_t v14 = 6;
    }
    else {
      uint64_t v14 = v13;
    }
    if (v14)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        double v16 = [v6 objectAtIndexedSubscript:i];
        double v17 = [VUIVideoAdvisoryLegendView alloc];
        double v18 = [(VUIVideoAdvisoryView *)self layout];
        double v19 = [(VUIVideoAdvisoryLegendView *)v17 initWithLayout:v18];

        double v20 = [v16 objectForKeyedSubscript:@"VUIAdvisoryViewLegendDescriptionKey"];
        [(VUIVideoAdvisoryLegendView *)v19 setLegendDescription:v20];
        double v21 = [v16 objectForKeyedSubscript:@"VUIAdvisoryViewLegendNameKey"];
        if ([v21 length]) {
          [(VUIVideoAdvisoryLegendView *)v19 setLegendName:v21];
        }
        [(VUIVideoAdvisoryLegendView *)v19 setAlpha:0.0];
        [(VUIVideoAdvisoryView *)self addSubview:v19];
        [v7 addObject:v19];
      }
    }
    [(VUIVideoAdvisoryView *)self setLegendViews:v7];

    BOOL v5 = v24;
    double v4 = v25;
  }
  double v22 = [v26 objectForKeyedSubscript:@"VUIAdvisoryViewAdditionalViewsDictionaryKey"];
  [(VUIVideoAdvisoryView *)self setAdditionalViewsInfo:v22];
}

- (VUIVideoAdvisoryViewLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (VUIAdditionalAdvisoryInfoView)photoSensitivityView
{
  return self->_photoSensitivityView;
}

- (void)setPhotoSensitivityView:(id)a3
{
}

- (VUIImageView)logoImageView
{
  return self->_logoImageView;
}

- (void)setLogoImageView:(id)a3
{
}

- (UIView)dividerView
{
  return self->_dividerView;
}

- (void)setDividerView:(id)a3
{
}

- (NSArray)legendViews
{
  return self->_legendViews;
}

- (void)setLegendViews:(id)a3
{
}

- (NSArray)additionalViewsInfo
{
  return self->_additionalViewsInfo;
}

- (void)setAdditionalViewsInfo:(id)a3
{
}

- (NSMutableArray)additionalViews
{
  return self->_additionalViews;
}

- (void)setAdditionalViews:(id)a3
{
}

- (double)legendAnimationDistance
{
  return self->_legendAnimationDistance;
}

- (void)setLegendAnimationDistance:(double)a3
{
  self->_legendAnimationDistance = a3;
}

- (double)legendYAnimationDistance
{
  return self->_legendYAnimationDistance;
}

- (void)setLegendYAnimationDistance:(double)a3
{
  self->_legendYAnimationDistance = a3;
}

- (BOOL)reduceMotion
{
  return self->_reduceMotion;
}

- (void)setReduceMotion:(BOOL)a3
{
  self->_reduceMotion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalViews, 0);
  objc_storeStrong((id *)&self->_additionalViewsInfo, 0);
  objc_storeStrong((id *)&self->_legendViews, 0);
  objc_storeStrong((id *)&self->_dividerView, 0);
  objc_storeStrong((id *)&self->_logoImageView, 0);
  objc_storeStrong((id *)&self->_photoSensitivityView, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

- (void)showAnimated:(BOOL)a3 platterView:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  double v9 = (void (**)(void))a5;
  if (v6)
  {
    [(VUIVideoAdvisoryView *)self _showWithCoreAnimationWithPlatterView:v8 completion:v9];
  }
  else
  {
    double v10 = [(VUIVideoAdvisoryView *)self dividerView];

    if (v10)
    {
      double v11 = [(VUIVideoAdvisoryView *)self dividerView];
      [v11 frame];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;

      [(VUIVideoAdvisoryView *)self _dividerSize];
      double v19 = v18;
      double v20 = [(VUIVideoAdvisoryView *)self dividerView];
      objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);
    }
    double v21 = [(VUIVideoAdvisoryView *)self logoImageView];
    [v21 setAlpha:1.0];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    double v22 = [(VUIVideoAdvisoryView *)self legendViews];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v34;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(v22);
          }
          [*(id *)(*((void *)&v33 + 1) + 8 * v26++) setAlpha:1.0];
        }
        while (v24 != v26);
        uint64_t v24 = [v22 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v24);
    }

    if (v8)
    {
      [(VUIVideoAdvisoryView *)self frame];
      double v28 = v27 + -15.0;
      [v8 frame];
      double v30 = v29;
      [(VUIVideoAdvisoryView *)self frame];
      double v32 = v31 + 30.0;
      [v8 frame];
      objc_msgSend(v8, "setFrame:", v28, v30, v32);
    }
    v9[2](v9);
  }
}

- (void)_showWithCoreAnimationWithPlatterView:(id)a3 completion:(id)a4
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x1E4F39CF8] begin];
  id v8 = (void *)MEMORY[0x1E4F39CF8];
  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = __83__VUIVideoAdvisoryView_Animator___showWithCoreAnimationWithPlatterView_completion___block_invoke;
  v85[3] = &unk_1E6DF3DD0;
  id v78 = v7;
  id v86 = v78;
  [v8 setCompletionBlock:v85];
  double v9 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"bounds"];
  [v9 setMass:1.0];
  [v9 setStiffness:60.0];
  [v9 setDamping:16.0];
  [v9 setInitialVelocity:0.0];
  [v9 settlingDuration];
  objc_msgSend(v9, "setDuration:");
  double v10 = [(VUIVideoAdvisoryView *)self dividerView];
  double v11 = [v10 layer];

  [v11 bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [(VUIVideoAdvisoryView *)self bounds];
  double v19 = v18;
  double v20 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v13, v15, v17, 0.0);
  [v9 setFromValue:v20];

  double v21 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v13, v15, v17, v19);
  [v9 setToValue:v21];

  [v11 addAnimation:v9 forKey:@"bounds"];
  v77 = v11;
  objc_msgSend(v11, "setBounds:", v13, v15, v17, v19);
  if (v6)
  {
    double v22 = [v6 layer];
    [v22 bounds];
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    [(VUIVideoAdvisoryView *)self bounds];
    double v30 = v29 + 30.0;
    double v31 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v24, v26, 0.0, v28);
    [v9 setFromValue:v31];

    double v32 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v24, v26, v30, v28);
    [v9 setToValue:v32];

    [v22 addAnimation:v9 forKey:@"bounds"];
    objc_msgSend(v22, "setBounds:", v24, v26, v30, v28);
  }
  double v79 = v6;
  [v9 settlingDuration];
  double v34 = v33;
  id v35 = objc_alloc(MEMORY[0x1E4F39C10]);
  LODWORD(v36) = 1043207291;
  LODWORD(v37) = 1062501089;
  LODWORD(v38) = 1043207291;
  LODWORD(v39) = 1062501089;
  uint64_t v40 = [v35 initWithControlPoints:v36 :v38 :v37 :v39];
  double v41 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  v76 = (void *)v40;
  [v41 setTimingFunction:v40];
  [v41 setBeginTime:v34 + CACurrentMediaTime()];
  double v42 = [MEMORY[0x1E4F28ED0] numberWithFloat:0.0];
  [v41 setFromValue:v42];

  LODWORD(v43) = 1.0;
  double v44 = [MEMORY[0x1E4F28ED0] numberWithFloat:v43];
  [v41 setToValue:v44];

  [v41 setDuration:0.879999995];
  [v41 setRemovedOnCompletion:0];
  uint64_t v45 = *MEMORY[0x1E4F39FA8];
  [v41 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v9 setKeyPath:@"position"];
  [v9 setRemovedOnCompletion:0];
  uint64_t v75 = v45;
  [v9 setFillMode:v45];
  int v46 = [(VUIVideoAdvisoryView *)self vuiIsRTL];
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  obuint64_t j = [(VUIVideoAdvisoryView *)self legendViews];
  uint64_t v47 = [obj countByEnumeratingWithState:&v81 objects:v87 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = self;
    uint64_t v50 = *(void *)v82;
    do
    {
      uint64_t v51 = 0;
      double v52 = v9;
      do
      {
        if (*(void *)v82 != v50) {
          objc_enumerationMutation(obj);
        }
        double v53 = [*(id *)(*((void *)&v81 + 1) + 8 * v51) layer];
        [v53 position];
        double v55 = v54;
        double v57 = v56;
        [(VUIVideoAdvisoryView *)v49 legendAnimationDistance];
        if (!v46) {
          double v58 = -v58;
        }
        double v59 = v55 + v58;
        v60 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v55, v57);
        [v52 setFromValue:v60];

        uint64_t v61 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v59, v57);
        [v52 setToValue:v61];

        [v52 setBeginTime:v34 + CACurrentMediaTime()];
        [v41 setBeginTime:v34 + CACurrentMediaTime()];
        [v53 addAnimation:v52 forKey:@"position"];
        objc_msgSend(v53, "setPosition:", v59, v57);
        [v53 addAnimation:v41 forKey:@"opacity"];
        [v53 setOpacity:0.0];
        double v34 = v34 + 0.200000003;
        double v9 = (void *)[v52 copy];

        ++v51;
        double v52 = v9;
      }
      while (v48 != v51);
      uint64_t v48 = [obj countByEnumeratingWithState:&v81 objects:v87 count:16];
    }
    while (v48);
  }
  else
  {
    uint64_t v49 = self;
  }

  [v9 settlingDuration];
  double v63 = v62;
  id v64 = objc_alloc(MEMORY[0x1E4F39C10]);
  LODWORD(v65) = 1051260355;
  LODWORD(v66) = 1059816735;
  LODWORD(v67) = 1.0;
  double v68 = (void *)[v64 initWithControlPoints:v65 :0.0 :v66 :v67];
  v69 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  [v69 setTimingFunction:v68];
  [v69 setBeginTime:v63 + CACurrentMediaTime()];
  uint64_t v70 = [MEMORY[0x1E4F28ED0] numberWithFloat:0.0];
  [v69 setFromValue:v70];

  LODWORD(v71) = 1.0;
  double v72 = [MEMORY[0x1E4F28ED0] numberWithFloat:v71];
  [v69 setToValue:v72];

  [v69 setDuration:0.88];
  [v69 setRemovedOnCompletion:0];
  [v69 setFillMode:v75];
  uint64_t v73 = [(VUIVideoAdvisoryView *)v49 logoImageView];
  v74 = [v73 layer];

  [v74 addAnimation:v69 forKey:@"opacity"];
  [v74 setOpacity:0.0];
  [MEMORY[0x1E4F39CF8] commit];
}

uint64_t __83__VUIVideoAdvisoryView_Animator___showWithCoreAnimationWithPlatterView_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)hideAnimated:(BOOL)a3 platterView:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  double v9 = (void (**)(void))a5;
  if (v6)
  {
    [(VUIVideoAdvisoryView *)self _hideWithCoreAnimationWithPlatterView:v8 completion:v9];
  }
  else
  {
    double v10 = [(VUIVideoAdvisoryView *)self dividerView];

    if (v10)
    {
      double v11 = [(VUIVideoAdvisoryView *)self dividerView];
      [v11 frame];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;

      double v18 = [(VUIVideoAdvisoryView *)self dividerView];
      objc_msgSend(v18, "setFrame:", v13, v15, v17, 0.0);
    }
    double v19 = [(VUIVideoAdvisoryView *)self logoImageView];
    [v19 setAlpha:0.0];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    double v20 = [(VUIVideoAdvisoryView *)self legendViews];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v29;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v29 != v23) {
            objc_enumerationMutation(v20);
          }
          [*(id *)(*((void *)&v28 + 1) + 8 * v24++) setAlpha:0.0];
        }
        while (v22 != v24);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v22);
    }

    double v25 = [(VUIVideoAdvisoryView *)self additionalViewsInfo];
    uint64_t v26 = [v25 count];

    if (v26)
    {
      double v27 = [(VUIVideoAdvisoryView *)self superview];
      [(VUIVideoAdvisoryView *)self _showAdditionalViewAtIndex:0 animated:0 platterView:v8 superview:v27 completion:v9];
    }
    else
    {
      v9[2](v9);
    }
  }
}

- (void)_showAdditionalViewAtIndex:(unint64_t)a3 animated:(BOOL)a4 platterView:(id)a5 superview:(id)a6 completion:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  double v15 = [(VUIVideoAdvisoryView *)self additionalViewsInfo];
  double v16 = [v15 objectAtIndexedSubscript:a3];

  double v17 = [[VUIAdditionalAdvisoryInfoView alloc] initWithAdvisoryInfoDictionary:v16 reduceMotion:[(VUIVideoAdvisoryView *)self reduceMotion]];
  double v18 = [(VUIVideoAdvisoryView *)self additionalViews];
  [v18 addObject:v17];

  double v19 = [v16 objectForKeyedSubscript:@"VUIIAdditionalAdvisoryInfoDisplayDurationKey"];
  [v19 floatValue];
  double v20 = 6.0;
  if (v21 > 0.0)
  {
    [v19 floatValue];
    double v20 = v22;
  }
  id v23 = v13;
  [v23 frame];
  -[VUIAdditionalAdvisoryInfoView sizeThatFits:](v17, "sizeThatFits:", v24, v25);
  double v27 = v26;
  [(VUIVideoAdvisoryView *)self frame];
  double v29 = v28;
  [(VUIVideoAdvisoryView *)self frame];
  double v31 = v30;
  [(VUIVideoAdvisoryView *)self frame];
  double v33 = v32;
  [v23 frame];
  -[VUIVideoAdvisoryView sizeThatFits:](self, "sizeThatFits:", v34, v35);
  double v37 = v36;
  [v23 frame];
  -[VUIAdditionalAdvisoryInfoView sizeThatFits:](v17, "sizeThatFits:", v38, v39);
  double v41 = v40;
  int v42 = [(VUIVideoAdvisoryView *)self vuiIsRTL];
  double v43 = v41 - v37;
  if (!v42) {
    double v43 = 0.0;
  }
  -[VUIAdditionalAdvisoryInfoView setFrame:](v17, "setFrame:", v29 - v43, v31, v27, v33);
  [v23 addSubview:v17];
  [(VUIAdditionalAdvisoryInfoView *)v17 layoutIfNeeded];
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__VUIVideoAdvisoryView_Animator___showAdditionalViewAtIndex_animated_platterView_superview_completion___block_invoke;
  block[3] = &unk_1E6DFC280;
  objc_copyWeak(v53, &location);
  v53[1] = (id)a3;
  BOOL v54 = a4;
  uint64_t v49 = v17;
  id v50 = v12;
  v53[2] = *(id *)&v20;
  id v51 = v23;
  id v52 = v14;
  id v44 = v14;
  id v45 = v23;
  id v46 = v12;
  uint64_t v47 = v17;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v53);
  objc_destroyWeak(&location);
}

void __103__VUIVideoAdvisoryView_Animator___showAdditionalViewAtIndex_animated_platterView_superview_completion___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  double v4 = WeakRetained;
  if (*(void *)(a1 + 72))
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v6 = [WeakRetained dividerView];
    BOOL v5 = v6 == 0;
  }
  uint64_t v7 = *(unsigned __int8 *)(a1 + 88);
  double v9 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __103__VUIVideoAdvisoryView_Animator___showAdditionalViewAtIndex_animated_platterView_superview_completion___block_invoke_2;
  v10[3] = &unk_1E6DFC258;
  v15[1] = *(id *)(a1 + 80);
  objc_copyWeak(v15, v2);
  v15[2] = *(id *)(a1 + 72);
  char v16 = *(unsigned char *)(a1 + 88);
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 32);
  [v9 showWithAnimatedLogoAndText:v7 animateDivider:v5 platterView:v8 completion:v10];

  objc_destroyWeak(v15);
}

void __103__VUIVideoAdvisoryView_Animator___showAdditionalViewAtIndex_animated_platterView_superview_completion___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1CB00];
  double v3 = *(double *)(a1 + 72);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __103__VUIVideoAdvisoryView_Animator___showAdditionalViewAtIndex_animated_platterView_superview_completion___block_invoke_3;
  v5[3] = &unk_1E6DFC230;
  objc_copyWeak(v10, (id *)(a1 + 64));
  v10[1] = *(id *)(a1 + 80);
  char v11 = *(unsigned char *)(a1 + 88);
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 48);
  id v4 = (id)[v2 scheduledTimerWithTimeInterval:0 repeats:v5 block:v3];

  objc_destroyWeak(v10);
}

void __103__VUIVideoAdvisoryView_Animator___showAdditionalViewAtIndex_animated_platterView_superview_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  unint64_t v3 = *(void *)(a1 + 72) + 1;
  id v4 = [WeakRetained additionalViewsInfo];
  unint64_t v5 = [v4 count];

  if (v3 < v5) {
    [WeakRetained _showAdditionalViewAtIndex:v3 animated:*(unsigned __int8 *)(a1 + 80) platterView:*(void *)(a1 + 32) superview:*(void *)(a1 + 40) completion:*(void *)(a1 + 56)];
  }
  id v6 = [WeakRetained additionalViewsInfo];
  BOOL v7 = v3 >= [v6 count];

  id v8 = *(void **)(a1 + 48);
  uint64_t v9 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v10 = *(void *)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __103__VUIVideoAdvisoryView_Animator___showAdditionalViewAtIndex_animated_platterView_superview_completion___block_invoke_4;
  v11[3] = &unk_1E6DFBEF8;
  id v12 = v8;
  BOOL v14 = v7;
  id v13 = *(id *)(a1 + 56);
  [v12 hideAnimated:v9 platterView:v10 hidePlatterView:v7 completion:v11];
}

uint64_t __103__VUIVideoAdvisoryView_Animator___showAdditionalViewAtIndex_animated_platterView_superview_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) removeFromSuperview];
  if (*(unsigned char *)(a1 + 48))
  {
    unint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

- (void)_hideWithCoreAnimationWithPlatterView:(id)a3 completion:(id)a4
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(VUIVideoAdvisoryView *)self additionalViewsInfo];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    uint64_t v10 = [(VUIVideoAdvisoryView *)self superview];
    [(VUIVideoAdvisoryView *)self _showAdditionalViewAtIndex:0 animated:1 platterView:v6 superview:v10 completion:v7];
  }
  unint64_t v11 = 0x1E4F39000uLL;
  [MEMORY[0x1E4F39CF8] begin];
  id v12 = (void *)MEMORY[0x1E4F39CF8];
  v117[0] = MEMORY[0x1E4F143A8];
  v117[1] = 3221225472;
  v117[2] = __83__VUIVideoAdvisoryView_Animator___hideWithCoreAnimationWithPlatterView_completion___block_invoke;
  v117[3] = &unk_1E6DF41E8;
  id v105 = v7;
  v117[4] = self;
  id v118 = v105;
  [v12 setCompletionBlock:v117];
  id v13 = [(VUIVideoAdvisoryView *)self additionalViewsInfo];
  uint64_t v14 = [v13 count];

  id v15 = objc_alloc(MEMORY[0x1E4F39C10]);
  if (v14)
  {
    id v101 = v6;
    LODWORD(v18) = 1059816735;
    LODWORD(v16) = 1051260355;
    uint64_t v19 = [v15 initWithControlPoints:v16 :0.0 :0.0 :v18];
    double v20 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
    [v20 setDuration:0.883000016];
    v104 = (void *)v19;
    [v20 setTimingFunction:v19];
    float v21 = [(VUIVideoAdvisoryView *)self logoImageView];
    float v22 = [v21 layer];

    v103 = v20;
    [v22 addAnimation:v20 forKey:@"opacity"];
    v106 = v22;
    [v22 setOpacity:0.0];
    id v23 = objc_alloc(MEMORY[0x1E4F39C10]);
    LODWORD(v24) = 1043207291;
    LODWORD(v25) = 1.0;
    LODWORD(v26) = 1062501089;
    uint64_t v27 = [v23 initWithControlPoints:v24 :0.0 :v26 :v25];
    double v28 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
    objc_super v102 = (void *)v27;
    [v28 setTimingFunction:v27];
    [v28 setDuration:0.300000012];
    [v28 setRemovedOnCompletion:0];
    [v28 setFromValue:&unk_1F3F3E728];
    [v28 setToValue:&unk_1F3F3E738];
    uint64_t v107 = *MEMORY[0x1E4F39FA8];
    objc_msgSend(v28, "setFillMode:");
    double v29 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position"];
    [v29 setMass:1.0];
    [v29 setStiffness:24.0];
    [v29 setDamping:15.0];
    [v29 setInitialVelocity:0.0];
    [v29 settlingDuration];
    objc_msgSend(v29, "setDuration:");
    long long v111 = 0u;
    long long v112 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    double v30 = self;
    double v31 = [(VUIVideoAdvisoryView *)self legendViews];
    double v32 = [v31 reverseObjectEnumerator];

    uint64_t v33 = [v32 countByEnumeratingWithState:&v109 objects:v119 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v110;
      double v36 = 0.1;
      do
      {
        uint64_t v37 = 0;
        double v38 = v29;
        double v39 = v28;
        do
        {
          if (*(void *)v110 != v35) {
            objc_enumerationMutation(v32);
          }
          double v40 = [*(id *)(*((void *)&v109 + 1) + 8 * v37) layer];
          double v41 = [v40 presentationLayer];
          [v41 position];
          double v43 = v42;
          double v45 = v44;

          [(VUIVideoAdvisoryView *)v30 legendYAnimationDistance];
          double v47 = v45 + v46;
          uint64_t v48 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v43, v45);
          [v38 setFromValue:v48];

          uint64_t v49 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v43, v47);
          [v38 setToValue:v49];

          [v38 setRemovedOnCompletion:0];
          [v38 setFillMode:v107];
          [v40 addAnimation:v38 forKey:@"position"];
          objc_msgSend(v40, "setPosition:", v43, v47);
          [v40 addAnimation:v39 forKey:@"opacity"];
          [v39 setBeginTime:v36 + CACurrentMediaTime()];
          LODWORD(v50) = 1.0;
          [v40 setOpacity:v50];
          double v36 = v36 + 0.100000001;
          double v29 = (void *)[v38 copy];

          double v28 = (void *)[v39 copy];
          ++v37;
          double v38 = v29;
          double v39 = v28;
        }
        while (v34 != v37);
        uint64_t v34 = [v32 countByEnumeratingWithState:&v109 objects:v119 count:16];
      }
      while (v34);
    }

    id v51 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"bounds"];
    [v51 setDuration:0.88];
    id v52 = objc_alloc(MEMORY[0x1E4F39C10]);
    LODWORD(v53) = 1051260355;
    LODWORD(v54) = 1062501089;
    double v55 = (void *)[v52 initWithControlPoints:v53 :0.0 :v54 :0.0];
    [v51 setTimingFunction:v55];
    double v56 = [(VUIVideoAdvisoryView *)v30 dividerView];
    double v57 = [v56 layer];

    [v57 bounds];
    double v59 = v58;
    double v61 = v60;
    double v63 = v62;
    double v65 = v64;
    double v66 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:");
    [v51 setFromValue:v66];

    double v67 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v59, v61, v63, 0.0);
    [v51 setToValue:v67];

    [v51 setRemovedOnCompletion:0];
    [v51 setFillMode:v107];
    [v57 addAnimation:v51 forKey:@"bounds"];
    objc_msgSend(v57, "setBounds:", v59, v61, v63, v65);

    id v6 = v101;
    unint64_t v11 = 0x1E4F39000;
  }
  else
  {
    LODWORD(v16) = 1051260355;
    LODWORD(v17) = 1062501089;
    LODWORD(v18) = 1062501089;
    uint64_t v68 = [v15 initWithControlPoints:v16 :0.0 :v17 :v18];
    v69 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
    [v69 setDuration:0.430000007];
    v104 = (void *)v68;
    [v69 setTimingFunction:v68];
    LODWORD(v70) = 1.0;
    double v71 = [MEMORY[0x1E4F28ED0] numberWithFloat:v70];
    [v69 setFromValue:v71];

    double v72 = [MEMORY[0x1E4F28ED0] numberWithFloat:0.0];
    [v69 setToValue:v72];

    uint64_t v73 = [(VUIVideoAdvisoryView *)self logoImageView];
    v74 = [v73 layer];

    [v74 addAnimation:v69 forKey:@"opacity"];
    v106 = v74;
    [v74 setOpacity:0.0];
    if (v6)
    {
      uint64_t v75 = [v6 layer];
      [v75 addAnimation:v69 forKey:@"opacity"];
      [v75 setOpacity:0.0];
    }
    v103 = v69;
    id v76 = objc_alloc(MEMORY[0x1E4F39C10]);
    LODWORD(v77) = 1051260355;
    LODWORD(v78) = 1062501089;
    LODWORD(v79) = 1062501089;
    uint64_t v80 = [v76 initWithControlPoints:v77 :0.0 :v78 :v79];
    double v28 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
    [v28 setDuration:0.430000007];
    objc_super v102 = (void *)v80;
    [v28 setTimingFunction:v80];
    long long v115 = 0u;
    long long v116 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    v108 = self;
    long long v81 = [(VUIVideoAdvisoryView *)self legendViews];
    uint64_t v82 = [v81 countByEnumeratingWithState:&v113 objects:v120 count:16];
    if (v82)
    {
      uint64_t v83 = v82;
      uint64_t v84 = *(void *)v114;
      do
      {
        for (uint64_t i = 0; i != v83; ++i)
        {
          if (*(void *)v114 != v84) {
            objc_enumerationMutation(v81);
          }
          id v86 = [*(id *)(*((void *)&v113 + 1) + 8 * i) layer];
          [v86 addAnimation:v28 forKey:@"opacity"];
          [v106 setOpacity:0.0];
        }
        uint64_t v83 = [v81 countByEnumeratingWithState:&v113 objects:v120 count:16];
      }
      while (v83);
    }

    double v29 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"bounds"];
    [v29 setDuration:0.88];
    id v87 = objc_alloc(MEMORY[0x1E4F39C10]);
    LODWORD(v88) = 1051260355;
    LODWORD(v89) = 1062501089;
    id v51 = (void *)[v87 initWithControlPoints:v88 :0.0 :v89 :0.0];
    [v29 setTimingFunction:v51];
    double v90 = [(VUIVideoAdvisoryView *)v108 dividerView];
    double v55 = [v90 layer];

    [v55 bounds];
    double v92 = v91;
    double v94 = v93;
    double v96 = v95;
    double v98 = v97;
    long long v99 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:");
    [v29 setFromValue:v99];

    long long v100 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v92, v94, v96, 0.0);
    [v29 setToValue:v100];

    [v29 setRemovedOnCompletion:0];
    [v29 setFillMode:*MEMORY[0x1E4F39FA8]];
    [v55 addAnimation:v29 forKey:@"bounds"];
    objc_msgSend(v55, "setBounds:", v92, v94, v96, v98);
  }

  [*(id *)(v11 + 3320) commit];
}

void __83__VUIVideoAdvisoryView_Animator___hideWithCoreAnimationWithPlatterView_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    v2 = [*(id *)(a1 + 32) additionalViewsInfo];
    uint64_t v3 = [v2 count];

    if (!v3)
    {
      id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      v4();
    }
  }
}

@end