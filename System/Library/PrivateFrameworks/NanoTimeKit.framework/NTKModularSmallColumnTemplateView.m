@interface NTKModularSmallColumnTemplateView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (NTKModularSmallColumnTemplateView)initWithFrame:(CGRect)a3;
- (id)_bodyFontOfSize:(double)a3;
- (id)_headerFontOfSize:(double)a3;
- (id)_newLabelSubview;
- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3;
- (void)_enumerateSecondaryForegroundColoringViewsWithBlock:(id)a3;
- (void)_layoutContentView;
- (void)_update;
@end

@implementation NTKModularSmallColumnTemplateView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return !a3 || a3 == 7;
}

- (NTKModularSmallColumnTemplateView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)NTKModularSmallColumnTemplateView;
  id v3 = -[NTKModuleView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(NTKModularSmallColumnTemplateView *)v3 _newLabelSubview];
    row1Column1Label = v4->_row1Column1Label;
    v4->_row1Column1Label = (CLKUIColoringLabel *)v5;

    uint64_t v7 = [(NTKModularSmallColumnTemplateView *)v4 _newLabelSubview];
    row2Column1Label = v4->_row2Column1Label;
    v4->_row2Column1Label = (CLKUIColoringLabel *)v7;

    uint64_t v9 = [(NTKModularSmallColumnTemplateView *)v4 _newLabelSubview];
    row1Column2Label = v4->_row1Column2Label;
    v4->_row1Column2Label = (CLKUIColoringLabel *)v9;

    uint64_t v11 = [(NTKModularSmallColumnTemplateView *)v4 _newLabelSubview];
    row2Column2Label = v4->_row2Column2Label;
    v4->_row2Column2Label = (CLKUIColoringLabel *)v11;
  }
  return v4;
}

- (id)_newLabelSubview
{
  id v3 = objc_alloc_init((Class)off_1E62BDB58);
  v4 = [(NTKModularTemplateView *)self timeTravelDate];
  [v3 setInTimeTravel:v4 != 0];

  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__NTKModularSmallColumnTemplateView__newLabelSubview__block_invoke;
  v9[3] = &unk_1E62C0040;
  objc_copyWeak(&v10, &location);
  [v3 setNowProvider:v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__NTKModularSmallColumnTemplateView__newLabelSubview__block_invoke_2;
  v7[3] = &unk_1E62C0068;
  objc_copyWeak(&v8, &location);
  [v3 setNeedsResizeHandler:v7];
  uint64_t v5 = [(NTKModuleView *)self contentView];
  [v5 addSubview:v3];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v3;
}

id __53__NTKModularSmallColumnTemplateView__newLabelSubview__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained timeTravelDate];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F19A20] complicationDate];
  }
  uint64_t v5 = v4;

  return v5;
}

void __53__NTKModularSmallColumnTemplateView__newLabelSubview__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained contentView];
  [v1 setNeedsLayout];
}

- (id)_headerFontOfSize:(double)a3
{
  return (id)[MEMORY[0x1E4F19A50] systemFontOfSize:a3 weight:*MEMORY[0x1E4FB09D0]];
}

- (id)_bodyFontOfSize:(double)a3
{
  return (id)[MEMORY[0x1E4F19A50] systemFontOfSize:a3];
}

- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v8 = [(NTKModularTemplateView *)self complicationTemplate];
  int v5 = [v8 highlightColumn2];
  v6 = &OBJC_IVAR___NTKModularSmallColumnTemplateView__row1Column1Label;
  if (v5)
  {
    v6 = &OBJC_IVAR___NTKModularSmallColumnTemplateView__row1Column2Label;
    uint64_t v7 = &OBJC_IVAR___NTKModularSmallColumnTemplateView__row2Column2Label;
  }
  else
  {
    uint64_t v7 = &OBJC_IVAR___NTKModularSmallColumnTemplateView__row2Column1Label;
  }
  v4[2](v4, *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + *v6));
  v4[2](v4, *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + *v7));
}

- (void)_enumerateSecondaryForegroundColoringViewsWithBlock:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v8 = [(NTKModularTemplateView *)self complicationTemplate];
  int v5 = [v8 highlightColumn2];
  v6 = &OBJC_IVAR___NTKModularSmallColumnTemplateView__row1Column2Label;
  if (v5)
  {
    v6 = &OBJC_IVAR___NTKModularSmallColumnTemplateView__row1Column1Label;
    uint64_t v7 = &OBJC_IVAR___NTKModularSmallColumnTemplateView__row2Column1Label;
  }
  else
  {
    uint64_t v7 = &OBJC_IVAR___NTKModularSmallColumnTemplateView__row2Column2Label;
  }
  v4[2](v4, *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + *v6));
  v4[2](v4, *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + *v7));
}

- (void)_layoutContentView
{
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v107 = 0u;
  id v3 = [(NTKModuleView *)self device];
  BOOL v4 = [(NTKComplicationModuleView *)self isXL];
  id v5 = v3;
  v6 = v5;
  if (!v4)
  {
    _LayoutConstantsModularSmall_2(v5, &v107);
    goto LABEL_9;
  }
  id v7 = v5;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstantsExtraLarge___lock_4);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstantsExtraLarge___cachedDevice_4);
  if (!WeakRetained) {
    goto LABEL_7;
  }
  uint64_t v9 = WeakRetained;
  id v10 = objc_loadWeakRetained(&_LayoutConstantsExtraLarge___cachedDevice_4);
  if (v10 != v7)
  {

LABEL_7:
    id v13 = objc_storeWeak(&_LayoutConstantsExtraLarge___cachedDevice_4, v7);
    _LayoutConstantsExtraLarge___previousCLKDeviceVersion_4 = [v7 version];

    ___LayoutConstantsExtraLarge_block_invoke_5(v14, v7);
    goto LABEL_8;
  }
  uint64_t v11 = [v7 version];
  uint64_t v12 = _LayoutConstantsExtraLarge___previousCLKDeviceVersion_4;

  if (v11 != v12) {
    goto LABEL_7;
  }
LABEL_8:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstantsExtraLarge___lock_4);
  long long v109 = xmmword_1E9FA9C80;
  long long v110 = xmmword_1E9FA9C90;
  long long v111 = xmmword_1E9FA9CA0;
  long long v107 = _LayoutConstantsExtraLarge_constants_0;
  long long v108 = *(_OWORD *)algn_1E9FA9C70;

LABEL_9:
  double v15 = *((double *)&v109 + 1);
  double v16 = *(double *)&v110;
  double v18 = *((double *)&v108 + 1);
  double v17 = *(double *)&v109;
  double v19 = *((double *)&v110 + 1);
  double v91 = *((double *)&v111 + 1);
  double v20 = *(double *)&v111;
  double v21 = *((double *)&v110 + 1) + *(double *)&v109 * -2.0 - *((double *)&v109 + 1);
  v22 = [(NTKModularTemplateView *)self complicationTemplate];
  uint64_t v23 = [v22 column2Alignment];

  v24 = [(NTKModularTemplateView *)self complicationTemplate];
  int v25 = [v24 highlightColumn2];

  double v105 = 0.0;
  CGFloat Width = 0.0;
  double v103 = 0.0;
  CGFloat v104 = 0.0;
  double v94 = v17;
  double v95 = v15;
  double v92 = v18;
  double v93 = v19;
  if (self->_calculatedFontSize)
  {
    [(CLKUIColoringLabel *)self->_row1Column1Label sizeToFit];
    [(CLKUIColoringLabel *)self->_row1Column1Label bounds];
    CGFloat Width = CGRectGetWidth(v112);
    [(CLKUIColoringLabel *)self->_row2Column1Label sizeToFit];
    [(CLKUIColoringLabel *)self->_row2Column1Label bounds];
    CGFloat v104 = CGRectGetWidth(v113);
    [(CLKUIColoringLabel *)self->_row1Column2Label sizeToFit];
    [(CLKUIColoringLabel *)self->_row1Column2Label bounds];
    double v105 = CGRectGetWidth(v114);
    [(CLKUIColoringLabel *)self->_row2Column2Label sizeToFit];
    [(CLKUIColoringLabel *)self->_row2Column2Label bounds];
    double v103 = CGRectGetWidth(v115);
    v26 = [(NTKModuleView *)self device];
    CLKCeilForDevice();
    double v28 = v27;

    v29 = [(NTKModuleView *)self device];
    CLKCeilForDevice();
    double v31 = v30;

    double v32 = v91;
  }
  else
  {
    double v34 = *((double *)&v107 + 1);
    double v33 = *(double *)&v107;
    uint64_t v87 = v23;
    double v85 = v20;
    if (*(double *)&v107 >= *((double *)&v107 + 1))
    {
      id v36 = 0;
      id v35 = 0;
      double v37 = *(double *)&v108;
      do
      {
        v38 = -[NTKModularSmallColumnTemplateView _headerFontOfSize:](self, "_headerFontOfSize:", v33, *(void *)&v85, v87);
        uint64_t v39 = [(NTKModularSmallColumnTemplateView *)self _bodyFontOfSize:v33];
        v40 = (void *)v39;
        if (v25) {
          v41 = (void *)v39;
        }
        else {
          v41 = v38;
        }
        if (v25) {
          v42 = v38;
        }
        else {
          v42 = (void *)v39;
        }
        id v43 = v41;

        id v44 = v42;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __55__NTKModularSmallColumnTemplateView__layoutContentView__block_invoke;
        aBlock[3] = &unk_1E62C8440;
        double v102 = v21;
        aBlock[4] = self;
        id v36 = v43;
        id v101 = v36;
        v45 = (double (**)(void *, CGFloat *, CGFloat *))_Block_copy(aBlock);
        v97[0] = MEMORY[0x1E4F143A8];
        v97[1] = 3221225472;
        v97[2] = __55__NTKModularSmallColumnTemplateView__layoutContentView__block_invoke_2;
        v97[3] = &unk_1E62C8440;
        double v99 = v21;
        v97[4] = self;
        id v35 = v44;
        id v98 = v35;
        v46 = _Block_copy(v97);
        v47 = (double (**)(void, void, void))v46;
        if (v25)
        {
          double v31 = (*((double (**)(void *, double *, double *, double))v46 + 2))(v46, &v105, &v103, 0.0);
          double v28 = v45[2](v45, &Width, &v104);
        }
        else
        {
          double v28 = ((double (*)(double (**)(void *, CGFloat *, CGFloat *), CGFloat *, CGFloat *, double))v45[2])(v45, &Width, &v104, 0.0);
          double v31 = ((double (**)(void, double *, double *))v47)[2](v47, &v105, &v103);
        }

        double v48 = 0.0;
        if (v31 + v28 > v21) {
          double v48 = v37;
        }
        double v33 = v33 - v48;
      }
      while (v31 + v28 > v21 && v33 >= v34);
    }
    else
    {
      id v35 = 0;
      id v36 = 0;
      double v31 = 0.0;
      double v28 = 0.0;
    }
    -[CLKUIColoringLabel setFont:](self->_row1Column1Label, "setFont:", v36, *(void *)&v85, v87);
    [(CLKUIColoringLabel *)self->_row1Column1Label sizeToFit];
    [(CLKUIColoringLabel *)self->_row1Column2Label setFont:v35];
    [(CLKUIColoringLabel *)self->_row1Column2Label sizeToFit];
    [(CLKUIColoringLabel *)self->_row2Column1Label setFont:v36];
    [(CLKUIColoringLabel *)self->_row2Column1Label sizeToFit];
    [(CLKUIColoringLabel *)self->_row2Column2Label setFont:v35];
    [(CLKUIColoringLabel *)self->_row2Column2Label sizeToFit];
    self->_calculatedFontSize = 1;

    uint64_t v23 = v88;
    double v20 = v86;
    double v32 = v91;
  }
  if (v31 + v28 > v21)
  {
    if (v25)
    {
      if (v31 > v16) {
        double v31 = v16;
      }
      double v28 = v21 - v31;
    }
    else
    {
      if (v28 > v16) {
        double v28 = v16;
      }
      double v31 = v21 - v28;
    }
  }
  [(CLKUIColoringLabel *)self->_row1Column1Label frame];
  double v51 = v50;
  double v53 = v52;
  CGFloat rect = v52;
  [(CLKUIColoringLabel *)self->_row1Column1Label _lastLineBaseline];
  CGFloat v55 = v20 - v54;
  double v90 = v20 - v54;
  -[CLKUIColoringLabel setFrame:](self->_row1Column1Label, "setFrame:", v51, v20 - v54, v28, v53);
  [(CLKUIColoringLabel *)self->_row2Column1Label frame];
  double v57 = v56;
  double v59 = v58;
  CGFloat v89 = v58;
  [(CLKUIColoringLabel *)self->_row2Column1Label _lastLineBaseline];
  double v61 = v20 + v32 - v60;
  -[CLKUIColoringLabel setFrame:](self->_row2Column1Label, "setFrame:", v57, v61, v28, v59);
  [(CLKUIColoringLabel *)self->_row1Column2Label frame];
  double v63 = v62;
  double v65 = v64;
  v116.origin.x = v51;
  v116.origin.y = v55;
  v116.size.width = v28;
  v116.size.height = rect;
  double MinY = CGRectGetMinY(v116);
  if (v105 <= v31) {
    double v67 = v105;
  }
  else {
    double v67 = v31;
  }
  -[CLKUIColoringLabel setFrame:](self->_row1Column2Label, "setFrame:", v63, MinY, v67, v65);
  [(CLKUIColoringLabel *)self->_row2Column2Label frame];
  double v69 = v68;
  double v71 = v70;
  v117.origin.x = v57;
  v117.origin.y = v61;
  v117.size.width = v28;
  v117.size.height = v89;
  double v72 = CGRectGetMinY(v117);
  if (v103 <= v31) {
    double v73 = v103;
  }
  else {
    double v73 = v31;
  }
  -[CLKUIColoringLabel setFrame:](self->_row2Column2Label, "setFrame:", v69, v72, v73, v71);
  v74 = [(NTKModuleView *)self device];
  CLKRoundForDevice();
  double v76 = v75;

  if (v76 <= v92) {
    double v77 = v76;
  }
  else {
    double v77 = v92;
  }
  if (v77 >= v94) {
    double v78 = v77;
  }
  else {
    double v78 = v94;
  }
  v118.origin.y = v90;
  v118.origin.x = v51;
  v118.size.width = v28;
  v118.size.height = rect;
  double v79 = v95 + CGRectGetMaxX(v118);
  if (v79 < v93 - v92 - v31) {
    double v79 = v93 - v92 - v31;
  }
  if (v79 <= v93 - v94 - v31) {
    double v80 = v79;
  }
  else {
    double v80 = v93 - v94 - v31;
  }
  double v81 = v31 - v67;
  if (v23 == 1)
  {
    double v82 = v31 - v73;
  }
  else
  {
    double v81 = 0.0;
    double v82 = 0.0;
  }
  v83 = [(NTKModuleView *)self viewsAndSpacingArrayForSpace:self->_row1Column1Label view:self->_row1Column2Label space:v78 view:v81 + v80];
  [(NTKModuleView *)self naturalHorizontalLayoutForViewsAndSpacing:v83 columnAlignmentSpacing:1];
  v84 = [(NTKModuleView *)self viewsAndSpacingArrayForSpace:self->_row2Column1Label view:self->_row2Column2Label space:v78 view:v82 + v80];
  [(NTKModuleView *)self naturalHorizontalLayoutForViewsAndSpacing:v84 columnAlignmentSpacing:1];
}

void __55__NTKModularSmallColumnTemplateView__layoutContentView__block_invoke(uint64_t a1, void *a2, void *a3, double a4)
{
  double v7 = *(double *)(a1 + 48) - a4;
  [*(id *)(*(void *)(a1 + 32) + 608) widthForMaxWidth:*(void *)(a1 + 40) withFont:v7];
  id v8 = [*(id *)(a1 + 32) device];
  CLKCeilForDevice();
  *a2 = v9;

  [*(id *)(*(void *)(a1 + 32) + 624) widthForMaxWidth:*(void *)(a1 + 40) withFont:v7];
  id v10 = [*(id *)(a1 + 32) device];
  CLKCeilForDevice();
  *a3 = v11;
}

void __55__NTKModularSmallColumnTemplateView__layoutContentView__block_invoke_2(uint64_t a1, void *a2, void *a3, double a4)
{
  double v7 = *(double *)(a1 + 48) - a4;
  [*(id *)(*(void *)(a1 + 32) + 616) widthForMaxWidth:*(void *)(a1 + 40) withFont:v7];
  id v8 = [*(id *)(a1 + 32) device];
  CLKCeilForDevice();
  *a2 = v9;

  [*(id *)(*(void *)(a1 + 32) + 632) widthForMaxWidth:*(void *)(a1 + 40) withFont:v7];
  id v10 = [*(id *)(a1 + 32) device];
  CLKCeilForDevice();
  *a3 = v11;
}

- (void)_update
{
  id v12 = [(NTKModularTemplateView *)self complicationTemplate];
  self->_calculatedFontSize = 0;
  [(NTKModuleView *)self _updateColors];
  row1Column1Label = self->_row1Column1Label;
  BOOL v4 = [v12 row1Column1TextProvider];
  [(CLKUIColoringLabel *)row1Column1Label setTextProvider:v4];

  row1Column2Label = self->_row1Column2Label;
  v6 = [v12 row1Column2TextProvider];
  [(CLKUIColoringLabel *)row1Column2Label setTextProvider:v6];

  row2Column1Label = self->_row2Column1Label;
  id v8 = [v12 row2Column1TextProvider];
  [(CLKUIColoringLabel *)row2Column1Label setTextProvider:v8];

  row2Column2Label = self->_row2Column2Label;
  id v10 = [v12 row2Column2TextProvider];
  [(CLKUIColoringLabel *)row2Column2Label setTextProvider:v10];

  uint64_t v11 = [(NTKModuleView *)self contentView];
  [v11 setNeedsLayout];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_row2Column2Label, 0);
  objc_storeStrong((id *)&self->_row2Column1Label, 0);
  objc_storeStrong((id *)&self->_row1Column2Label, 0);

  objc_storeStrong((id *)&self->_row1Column1Label, 0);
}

@end