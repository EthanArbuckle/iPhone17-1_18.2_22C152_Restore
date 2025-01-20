@interface PKStackedTextItemView
- ($0DDA3FF1E8F4FFE0EF06F4F911C98BBB)boundingMetricForWidth:(SEL)a3;
- ($0DDA3FF1E8F4FFE0EF06F4F911C98BBB)contentConstraints;
- ($9A4FCDEE54F544F5FF8F2731F5B38A83)_titleFontMetrics;
- (PKStackedTextItem)content;
- (PKStackedTextItemView)initWithCoder:(id)a3;
- (PKStackedTextItemView)initWithFrame:(CGRect)a3;
- (PKStackedTextItemView)initWithStyle:(int64_t)a3;
- (double)_prepareViewForReuse:(id)a3;
- (double)headerPadding;
- (id)_attributedStringWithText:(id)a3 strikethrough:(BOOL)a4;
- (int64_t)style;
- (int64_t)textAlignment;
- (void)_updateAlignmentAnimated:(BOOL)a3;
- (void)_updateSubviewsAnimated:(BOOL)a3;
- (void)layoutIfNeededAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setContent:(id)a3;
- (void)setContent:(id)a3 animated:(BOOL)a4;
- (void)setContentConstraints:(id *)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextAlignment:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation PKStackedTextItemView

- (PKStackedTextItemView)initWithCoder:(id)a3
{
  return 0;
}

- (PKStackedTextItemView)initWithFrame:(CGRect)a3
{
  return -[PKStackedTextItemView initWithStyle:](self, "initWithStyle:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKStackedTextItemView)initWithStyle:(int64_t)a3
{
  v35.receiver = self;
  v35.super_class = (Class)PKStackedTextItemView;
  v4 = -[PKStackedTextItemView initWithFrame:](&v35, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    snapshots = v5->_snapshots;
    v5->_snapshots = v6;

    switch(v5->_style)
    {
      case 0:
        uint64_t v8 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2790]);
        idealTitleFont = v5->_idealTitleFont;
        v5->_idealTitleFont = (UIFont *)v8;

        id PlainLabel = CreatePlainLabel(v5->_idealTitleFont, 0);
        uint64_t v11 = 408;
        goto LABEL_15;
      case 1:
        v12 = (NSString *)*MEMORY[0x1E4FB2790];
        goto LABEL_8;
      case 2:
        v12 = (NSString *)*MEMORY[0x1E4FB2790];
        goto LABEL_7;
      case 3:
        v12 = (NSString *)*MEMORY[0x1E4FB2790];
        uint64_t v13 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28F0], (NSString *)*MEMORY[0x1E4FB2790]);
        idealTertiaryFont = v5->_idealTertiaryFont;
        v5->_idealTertiaryFont = (UIFont *)v13;

        v15 = (UILabel *)CreatePlainLabel(v5->_idealTertiaryFont, 1);
        tertiary = v5->_tertiary;
        v5->_tertiary = v15;

        [(PKStackedTextItemView *)v5 addSubview:v5->_tertiary];
LABEL_7:
        uint64_t v17 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], v12);
        idealSecondaryFont = v5->_idealSecondaryFont;
        v5->_idealSecondaryFont = (UIFont *)v17;

        v19 = (UILabel *)CreatePlainLabel(v5->_idealSecondaryFont, 0);
        secondary = v5->_secondary;
        v5->_secondary = v19;

        [(PKStackedTextItemView *)v5 addSubview:v5->_secondary];
        if (v5->_style != 2)
        {
LABEL_8:
          v21 = (void *)*MEMORY[0x1E4FB0938];
          v22 = (void *)*MEMORY[0x1E4FB2990];
          uint64_t v23 = PKFontForDesign((void *)*MEMORY[0x1E4FB0938], (void *)*MEMORY[0x1E4FB2990], v12, 0, 8);
          primaryFont = v5->_primaryFont;
          v5->_primaryFont = (UIFont *)v23;

          if (PKUIGetMinScreenWidthType()) {
            v25 = (void *)*MEMORY[0x1E4FB2988];
          }
          else {
            v25 = v22;
          }
          uint64_t v26 = PKFontForDesign(v21, v25, v12, 2, 8, *MEMORY[0x1E4FB09B8]);
          significantPrimaryFont = v5->_significantPrimaryFont;
          v5->_significantPrimaryFont = (UIFont *)v26;

          [(UIFont *)v5->_primaryFont lineHeight];
          double v29 = v28;
          [(UIFont *)v5->_significantPrimaryFont lineHeight];
          if (v29 >= v30) {
            uint64_t v31 = 472;
          }
          else {
            uint64_t v31 = 464;
          }
          objc_storeStrong((id *)&v5->_layoutPrimaryFont, *(id *)((char *)&v5->super.super.super.isa + v31));
          objc_storeStrong((id *)&v5->_idealPrimaryFont, v5->_primaryFont);
          id PlainLabel = CreatePlainLabel(v5->_primaryFont, 0);
          uint64_t v11 = 416;
LABEL_15:
          v32 = (Class *)((char *)&v5->super.super.super.isa + v11);
          v33 = *(Class *)((char *)&v5->super.super.super.isa + v11);
          void *v32 = PlainLabel;

          [(PKStackedTextItemView *)v5 addSubview:*v32];
        }
        break;
      default:
        break;
    }
    [(UILabel *)v5->_title setAlpha:0.0];
    [(UILabel *)v5->_primary setAlpha:0.0];
    [(UILabel *)v5->_secondary setAlpha:0.0];
    [(UILabel *)v5->_tertiary setAlpha:0.0];
    [(PKStackedTextItemView *)v5 _updateAlignmentAnimated:0];
  }
  return v5;
}

- ($0DDA3FF1E8F4FFE0EF06F4F911C98BBB)boundingMetricForWidth:(SEL)a3
{
  void (**v9)(CGPoint *__return_ptr, void *, UILabel *, UIFont *, _OWORD *, uint64_t);
  CGSize v10;
  CGSize v11;
  id v12;
  BOOL v13;
  UILabel *secondary;
  UIFont *idealSecondaryFont;
  void (*v16)(CGPoint *__return_ptr, void *, UILabel *, UIFont *, CGPoint *, uint64_t);
  CGSize v17;
  id v18;
  BOOL v19;
  UILabel *tertiary;
  UIFont *idealTertiaryFont;
  void (*v22)(CGPoint *__return_ptr, void *, UILabel *, UIFont *, CGPoint *, uint64_t);
  uint64_t v23;
  CGSize v24;
  CGSize *v25;
  CGSize *v26;
  double height;
  $0DDA3FF1E8F4FFE0EF06F4F911C98BBB *result;
  _OWORD v29[12];
  CGPoint v30;
  CGSize v31;
  long long v32;
  long long v33;
  long long v34;
  long long v35;
  CGPoint v36;
  CGSize v37;
  long long v38;
  long long v39;
  long long v40;
  long long v41;
  CGPoint v42;
  CGSize v43;
  long long v44;
  long long v45;
  long long v46;
  long long v47;
  CGPoint v48;
  CGSize v49;
  uint64_t v50;
  CGPoint v51;
  CGSize v52;
  long long v53;
  long long v54;
  long long v55;
  long long v56;
  void v57[8];
  uint64_t v58;
  id *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  void v64[4];
  long long v65;
  long long v66;
  uint64_t v67;
  CGSize *v68;
  uint64_t v69;
  const char *v70;
  long long v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)&retstr->var1[3].var0.origin.y = 0u;
  *(_OWORD *)&retstr->var1[3].var0.size.height = 0u;
  retstr->var1[2].var0.size = 0u;
  *(_OWORD *)&retstr->var1[2].var1 = 0u;
  *(_OWORD *)&retstr->var1[1].var0.size.height = 0u;
  retstr->var1[2].var0.origin = 0u;
  *(_OWORD *)&retstr->var1[0].var1 = 0u;
  *(_OWORD *)&retstr->var1[1].var0.origin.y = 0u;
  retstr->var1[0].var0.origin = 0u;
  retstr->var1[0].var0.size = 0u;
  retstr->var0 = 0u;
  PKFloatFloorToPixel(*(__n128 *)&a4, (__n128)0);
  double v7 = v6;
  v67 = 0;
  v68 = (CGSize *)&v67;
  v69 = 0x3010000000;
  v70 = "";
  v71 = *MEMORY[0x1E4F1DB30];
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x4010000000;
  v64[3] = "";
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  v65 = *MEMORY[0x1E4F1DB28];
  v66 = v8;
  v58 = 0;
  v59 = (id *)&v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__44;
  v62 = __Block_byref_object_dispose__44;
  v63 = 0;
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __48__PKStackedTextItemView_boundingMetricForWidth___block_invoke;
  v57[3] = &unk_1E59DA7C0;
  *(double *)&v57[7] = v6;
  v57[4] = v64;
  v57[5] = &v67;
  v57[6] = &v58;
  v9 = (void (**)(CGPoint *__return_ptr, void *, UILabel *, UIFont *, _OWORD *, uint64_t))_Block_copy(v57);
  [(PKStackedTextItemView *)self _titleFontMetrics];
  v29[2] = v53;
  v29[3] = v54;
  v29[4] = v55;
  v29[5] = v56;
  v29[0] = v51;
  v29[1] = v52;
  ((void (**)(CGPoint *__return_ptr, void *, UILabel *, UIFont *, CGPoint *, uint64_t))v9)[2](&v42, v9, self->_title, self->_idealTitleFont, &v51, 1);
  v10 = v43;
  retstr->var1[0].var0.origin = v42;
  retstr->var1[0].var0.size = v10;
  *(void *)&retstr->var1[0].var1 = v44;
  objc_storeStrong(v59 + 5, self->_layoutPrimaryFont);
  FontMetricsForFonts((uint64_t)&v51, self->_idealPrimaryFont, v59[5]);
  v29[8] = v53;
  v29[9] = v54;
  v29[10] = v55;
  v29[11] = v56;
  v29[6] = v51;
  v29[7] = v52;
  ((void (**)(CGPoint *__return_ptr, void *, UILabel *, UIFont *, CGPoint *, uint64_t))v9)[2](&v42, v9, self->_primary, self->_idealPrimaryFont, &v51, 1);
  uint64_t v11 = v43;
  retstr->var1[1].var0.origin = v42;
  retstr->var1[1].var0.size = v11;
  *(void *)&retstr->var1[1].var1 = v44;
  FontMetricsForFonts((uint64_t)&v51, self->_idealSecondaryFont, 0);
  v32 = v53;
  v33 = v54;
  v34 = v55;
  objc_super v35 = v56;
  double v30 = v51;
  uint64_t v31 = v52;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = (CGPoint)0;
  v52 = (CGSize)0;
  v12 = v59[5];
  if (v12)
  {
    FontMetricsForFonts((uint64_t)&v51, self->_idealSecondaryFont, v12);
    uint64_t v13 = v59[5] == 0;
  }
  else
  {
    v53 = v32;
    v54 = v33;
    v55 = v34;
    v56 = v35;
    uint64_t v13 = 1;
    v51 = v30;
    v52 = v31;
  }
  secondary = self->_secondary;
  idealSecondaryFont = self->_idealSecondaryFont;
  v16 = (void (*)(CGPoint *__return_ptr, void *, UILabel *, UIFont *, CGPoint *, uint64_t))v9[2];
  v44 = v53;
  v45 = v54;
  v46 = v55;
  v47 = v56;
  v42 = v51;
  v43 = v52;
  v16(&v48, v9, secondary, idealSecondaryFont, &v42, v13);
  uint64_t v17 = v49;
  retstr->var1[2].var0.origin = v48;
  retstr->var1[2].var0.size = v17;
  *(void *)&retstr->var1[2].var1 = v50;
  FontMetricsForFonts((uint64_t)&v42, self->_idealTertiaryFont, 0);
  v38 = v44;
  v39 = v45;
  v40 = v46;
  v41 = v47;
  v36 = v42;
  v37 = v43;
  v18 = v59[5];
  if (v18)
  {
    FontMetricsForFonts((uint64_t)&v42, self->_idealTertiaryFont, v18);
    v53 = v44;
    v54 = v45;
    v55 = v46;
    v56 = v47;
    v51 = v42;
    v52 = v43;
    v19 = v59[5] == 0;
  }
  else
  {
    v53 = v38;
    v54 = v39;
    v55 = v40;
    v56 = v41;
    v19 = 1;
    v51 = v36;
    v52 = v37;
  }
  tertiary = self->_tertiary;
  idealTertiaryFont = self->_idealTertiaryFont;
  v22 = (void (*)(CGPoint *__return_ptr, void *, UILabel *, UIFont *, CGPoint *, uint64_t))v9[2];
  v44 = v53;
  v45 = v54;
  v46 = v55;
  v47 = v56;
  v42 = v51;
  v43 = v52;
  v22(&v48, v9, tertiary, idealTertiaryFont, &v42, v19);
  uint64_t v23 = 0;
  v24 = v49;
  retstr->var1[3].var0.origin = v48;
  retstr->var1[3].var0.size = v24;
  *(void *)&retstr->var1[3].var1 = v50;
  v25 = v68;
  uint64_t v26 = v68 + 2;
  v68[2].width = fmin(v68[2].width, v7);
  height = v25[2].height;
  do
  {
    height = height + *(double *)&v29[v23 + 2] + *((double *)&v29[v23 + 1] + 1) + *((double *)&v29[v23 + 2] + 1);
    v23 += 6;
  }
  while (v23 != 24);
  v25[2].height = height;
  retstr->var0 = *v26;

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(v64, 8);
  _Block_object_dispose(&v67, 8);
  return result;
}

void __48__PKStackedTextItemView_boundingMetricForWidth___block_invoke(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X8>)
{
  id v34 = a2;
  id v11 = a3;
  *(_OWORD *)a6 = 0u;
  *(_OWORD *)(a6 + 16) = 0u;
  *(void *)(a6 + 32) = 0;
  [v34 alpha];
  if (v12 <= 0.0)
  {
    uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8);
    long long v17 = *(_OWORD *)(v16 + 48);
    *(_OWORD *)a6 = *(_OWORD *)(v16 + 32);
    *(_OWORD *)(a6 + 16) = v17;
    goto LABEL_15;
  }
  uint64_t v13 = [v34 font];
  [v34 setFont:v11];
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = *(double *)(a4 + 32)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 40);
  if (a5)
  {
    v14 = v34;
    if (*(unsigned char *)(a4 + 48))
    {
      v15 = (double *)(a4 + 56);
LABEL_8:
      *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = *v15
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                              + 40);
    }
  }
  else
  {
    v14 = v34;
    if (*(unsigned char *)(a4 + 72))
    {
      v15 = (double *)(a4 + 80);
      goto LABEL_8;
    }
  }
  objc_msgSend(v14, "pkui_sizeThatFits:", 1.79769313e308, 1.79769313e308);
  PKSizeCeilToPixel(v18, v19, v20);
  uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 8);
  *(void *)(v21 + 48) = v22;
  *(void *)(v21 + 56) = v23;
  uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 8);
  double v25 = *(double *)(v24 + 48);
  double v26 = *(double *)(a1 + 56);
  if (v25 > v26)
  {
    *(double *)(v24 + 48) = v26;
    *(unsigned char *)(a6 + 32) = 1;
    double v25 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
  }
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = fmax(v25, *(double *)(*(void *)(*(void *)(a1 + 40) + 8)+ 32));
  uint64_t v27 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v28 = *(_OWORD *)(v27 + 48);
  *(_OWORD *)a6 = *(_OWORD *)(v27 + 32);
  *(_OWORD *)(a6 + 16) = v28;
  uint64_t v29 = *(void *)(v27 + 32);
  *(void *)&long long v28 = *(void *)(v27 + 40);
  uint64_t v30 = *(void *)(v27 + 48);
  uint64_t v31 = *(void *)(v27 + 56);
  *(CGFloat *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = CGRectGetMaxY(*(CGRect *)((char *)&v28 - 8))
                                                               + *(double *)(a4 + 40);
  if (a5 && *(unsigned char *)(a4 + 48)) {
    *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = *(double *)(a4 + 64)
  }
                                                                + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 40);
  [v34 setFont:v13];
  *(_OWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *MEMORY[0x1E4F1DB30];
  uint64_t v32 = *(void *)(*(void *)(a1 + 48) + 8);
  v33 = *(void **)(v32 + 40);
  *(void *)(v32 + 40) = 0;

LABEL_15:
}

- ($9A4FCDEE54F544F5FF8F2731F5B38A83)_titleFontMetrics
{
  FontMetricsForFonts((uint64_t)retstr, self->_idealTitleFont, 0);
  return result;
}

- (double)headerPadding
{
  [(PKStackedTextItemView *)self _titleFontMetrics];
  return v3;
}

- (void)layoutSubviews
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  v79.receiver = self;
  v79.super_class = (Class)PKStackedTextItemView;
  [(PKStackedTextItemView *)&v79 layoutSubviews];
  [(PKStackedTextItemView *)self bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v9 = v3;
  CGFloat v10 = v4;
  if (self->_boundsSize.width == v3 && self->_boundsSize.height == v4)
  {
    [(UILabel *)self->_title frame];
    double v59 = v28;
    double v60 = v27;
    [(UILabel *)self->_primary frame];
    double v57 = v30;
    double v58 = v29;
    [(UILabel *)self->_secondary frame];
    double v20 = v31;
    double v22 = v32;
    [(UILabel *)self->_tertiary frame];
    double v24 = v33;
    double v26 = v34;
  }
  else
  {
    self->_boundsSize.width = v3;
    self->_boundsSize.height = v4;
    primary = self->_primary;
    if (primary)
    {
      uint64_t v13 = 8;
      if (!self->_contentConstraints.textMetrics[1].widthConstrained) {
        uint64_t v13 = 11;
      }
      [(UILabel *)primary setFont:*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKStackedTextItemView__style[v13])];
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __39__PKStackedTextItemView_layoutSubviews__block_invoke;
    aBlock[3] = &__block_descriptor_64_e8_d16__0d8l;
    *(CGFloat *)&aBlock[4] = v6;
    *(CGFloat *)&aBlock[5] = v8;
    *(CGFloat *)&aBlock[6] = v9;
    *(CGFloat *)&aBlock[7] = v10;
    v14 = (double (**)(double))_Block_copy(aBlock);
    -[UILabel pkui_sizeThatFits:](self->_title, "pkui_sizeThatFits:", v14[2](self->_contentConstraints.textMetrics[0].frame.size.width), 1.79769313e308);
    double v59 = v16;
    double v60 = v15;
    -[UILabel pkui_sizeThatFits:](self->_primary, "pkui_sizeThatFits:", ((double (*)(double (**)(double), CGFloat))v14[2])(v14, self->_contentConstraints.textMetrics[1].frame.size.width), 1.79769313e308);
    double v57 = v18;
    double v58 = v17;
    -[UILabel pkui_sizeThatFits:](self->_secondary, "pkui_sizeThatFits:", ((double (*)(double (**)(double), CGFloat))v14[2])(v14, self->_contentConstraints.textMetrics[2].frame.size.width), 1.79769313e308);
    double v20 = v19;
    double v22 = v21;
    -[UILabel pkui_sizeThatFits:](self->_tertiary, "pkui_sizeThatFits:", ((double (*)(double (**)(double), CGFloat))v14[2])(v14, self->_contentConstraints.textMetrics[3].frame.size.width), 1.79769313e308);
    double v24 = v23;
    double v26 = v25;
  }
  int v35 = [(PKStackedTextItemView *)self _shouldReverseLayoutDirection];
  int64_t textAlignment = self->_textAlignment;
  if (textAlignment) {
    char v37 = 0;
  }
  else {
    char v37 = v35;
  }
  if ((v37 & 1) != 0 || (textAlignment == 1 ? (int v38 = v35 ^ 1) : (int v38 = 0), v38 == 1))
  {
    int v39 = 2;
    int v40 = 1;
  }
  else
  {
    int v40 = 0;
    int v39 = 0;
  }
  v77[0] = 0;
  v77[1] = v77;
  v77[2] = 0x4010000000;
  v77[3] = "";
  v74[0] = 0;
  v74[1] = v74;
  v74[2] = 0x4010000000;
  v74[3] = "";
  long long v75 = 0u;
  long long v76 = 0u;
  uint64_t v68 = 0;
  v69 = (id *)&v68;
  uint64_t v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__44;
  v72 = __Block_byref_object_dispose__44;
  id v73 = 0;
  *(CGFloat *)&v77[4] = v6;
  *(CGFloat *)&v77[5] = v8;
  *(CGFloat *)&v77[6] = v9;
  *(CGFloat *)&v77[7] = v10;
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __39__PKStackedTextItemView_layoutSubviews__block_invoke_2;
  v65[3] = &unk_1E59DA808;
  v65[6] = &v68;
  v65[7] = v74;
  int v66 = v39;
  int v67 = 1;
  v65[4] = self;
  v65[5] = v77;
  v41 = _Block_copy(v65);
  v42 = (void (**)(void, void, void, double, double, double, double))v41;
  title = self->_title;
  if (title) {
    (*((void (**)(void *, UILabel *, uint64_t, double, double, double, double))v41 + 2))(v41, title, 1, v60, v59, 0.65, 0.0);
  }
  objc_storeStrong(v69 + 5, self->_layoutPrimaryFont);
  v44 = self->_primary;
  if (v44) {
    ((void (**)(void, UILabel *, uint64_t, double, double, double, double))v42)[2](v42, v44, 1, v58, v57, 0.0, 0.0);
  }
  if (self->_secondary) {
    ((void (*)(void (**)(void, void, void, double, double, double, double), double, double, double, double))v42[2])(v42, v20, v22, 0.0, 0.0);
  }
  if (self->_tertiary) {
    ((void (*)(void (**)(void, void, void, double, double, double, double), double, double, double, double))v42[2])(v42, v24, v26, 0.0, 0.0);
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v45 = self->_snapshots;
  uint64_t v46 = [(NSMutableSet *)v45 countByEnumeratingWithState:&v61 objects:v80 count:16];
  if (v46)
  {
    uint64_t v47 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v62 != v47) {
          objc_enumerationMutation(v45);
        }
        v49 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        [v49 frame];
        double v51 = v50;
        double v53 = v52;
        double v55 = v54;
        double v56 = v6;
        if (v40)
        {
          v82.origin.x = v6;
          v82.origin.y = v8;
          v82.size.width = v9;
          v82.size.height = v10;
          double v56 = CGRectGetMaxX(v82) - v53;
        }
        objc_msgSend(v49, "pkui_setFrame:animated:", self->_animated, v56, v51, v53, v55);
      }
      uint64_t v46 = [(NSMutableSet *)v45 countByEnumeratingWithState:&v61 objects:v80 count:16];
    }
    while (v46);
  }

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(v74, 8);
  _Block_object_dispose(v77, 8);
}

double __39__PKStackedTextItemView_layoutSubviews__block_invoke(uint64_t a1, double a2)
{
  double v2 = fmin(*(double *)(a1 + 48), a2);
  if (a2 <= 0.0) {
    return *(double *)(a1 + 48);
  }
  else {
    return v2;
  }
}

void __39__PKStackedTextItemView_layoutSubviews__block_invoke_2(void *a1, void *a2, int a3, double a4, CGFloat a5)
{
  id v29 = a2;
  uint64_t v8 = *(void *)(a1[5] + 8);
  long long v9 = *(_OWORD *)(v8 + 48);
  long long v35 = *(_OWORD *)(v8 + 32);
  long long v36 = v9;
  long long v33 = 0u;
  long long v34 = 0u;
  *(_OWORD *)amount = 0u;
  long long v32 = 0u;
  memset(v30, 0, sizeof(v30));
  CGFloat v10 = [v29 font];
  FontMetricsForFonts((uint64_t)v30, v10, *(void **)(*(void *)(a1[6] + 8) + 40));

  [v29 alpha];
  double v12 = v11;
  uint64_t v13 = *(CGRect **)(a1[5] + 8);
  v38.origin.x = v13[1].origin.x;
  v38.origin.y = v13[1].origin.y;
  ++v13;
  v38.size.width = v13->size.width;
  v38.size.height = v13->size.height;
  CGRectDivide(v38, (CGRect *)(*(void *)(a1[7] + 8) + 32), v13, amount[0], CGRectMinYEdge);
  if (a3)
  {
    if (!(_BYTE)v32) {
      goto LABEL_7;
    }
    v14 = *(double **)(a1[5] + 8);
    double v15 = *((double *)&v32 + 1);
  }
  else
  {
    if (!BYTE8(v33)) {
      goto LABEL_7;
    }
    v14 = *(double **)(a1[5] + 8);
    double v15 = *(double *)&v34;
  }
  double v16 = v15 + v14[5];
  double v17 = v14[7] - (v15 + 0.0);
  v14[4] = v14[4] + 0.0;
  v14[5] = v16;
  v14[7] = v17;
LABEL_7:
  double v18 = *(CGRect **)(a1[5] + 8);
  v39.origin.x = v18[1].origin.x;
  v39.origin.y = v18[1].origin.y;
  ++v18;
  v39.size.width = v18->size.width;
  v39.size.height = v18->size.height;
  CGRectDivide(v39, (CGRect *)(*(void *)(a1[7] + 8) + 32), v18, a5, CGRectMinYEdge);
  PKSizeAlignedInRect();
  BOOL v20 = v12 > 0.0 && *(unsigned char *)(a1[4] + 520) != 0;
  objc_msgSend(v29, "pkui_setFrame:animated:", v20);
  double v21 = *(CGRect **)(a1[5] + 8);
  v40.origin.x = v21[1].origin.x;
  v40.origin.y = v21[1].origin.y;
  ++v21;
  v40.size.width = v21->size.width;
  v40.size.height = v21->size.height;
  CGRectDivide(v40, (CGRect *)(*(void *)(a1[7] + 8) + 32), v21, amount[1], CGRectMinYEdge);
  if (a3 && (_BYTE)v32)
  {
    double v22 = *(double **)(a1[5] + 8);
    double v23 = *(double *)&v33 + v22[5];
    double v24 = v22[7] - (*(double *)&v33 + 0.0);
    v22[4] = v22[4] + 0.0;
    v22[5] = v23;
    v22[7] = v24;
  }
  if (v12 <= 0.0)
  {
    uint64_t v27 = *(void *)(a1[5] + 8);
    long long v28 = v36;
    *(_OWORD *)(v27 + 32) = v35;
    *(_OWORD *)(v27 + 48) = v28;
  }
  else
  {
    uint64_t v25 = *(void *)(a1[6] + 8);
    double v26 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = 0;
  }
}

- (void)layoutIfNeededAnimated:(BOOL)a3
{
  self->_animated = a3;
  [(PKStackedTextItemView *)self layoutIfNeeded];
  self->_animated = 0;
}

- (void)prepareForReuse
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v3 = [(PKStackedTextItemView *)self layer];
  [v3 removeAllAnimations];

  double v4 = [(UILabel *)self->_title layer];
  [v4 removeAllAnimations];

  double v5 = [(UILabel *)self->_primary layer];
  [v5 removeAllAnimations];

  CGFloat v6 = [(UILabel *)self->_secondary layer];
  [v6 removeAllAnimations];

  double v7 = [(UILabel *)self->_tertiary layer];
  [v7 removeAllAnimations];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v8 = self->_snapshots;
  uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "removeFromSuperview", (void)v13);
      }
      uint64_t v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  [(NSMutableSet *)self->_snapshots removeAllObjects];
}

- (id)_attributedStringWithText:(id)a3 strikethrough:(BOOL)a4
{
  BOOL v4 = a4;
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 length])
  {
    if (v4)
    {
      uint64_t v9 = *MEMORY[0x1E4FB0768];
      v10[0] = &unk_1EF2B98B8;
      CGFloat v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    }
    else
    {
      CGFloat v6 = 0;
    }
    double v7 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5 attributes:v6];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (void)_updateSubviewsAnimated:(BOOL)a3
{
  self->_boundsSize = (CGSize)*MEMORY[0x1E4F1DB30];
  switch(self->_style)
  {
    case 0:
      id v5 = [(PKStackedTextItem *)self->_content title];
      CGFloat v6 = [(PKStackedTextItemView *)self _attributedStringWithText:v5 strikethrough:0];
      double v7 = 0;
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      goto LABEL_10;
    case 1:
      id v5 = [(PKStackedTextItem *)self->_content primary];
      double v7 = [(PKStackedTextItemView *)self _attributedStringWithText:v5 strikethrough:[(PKStackedTextItem *)self->_content isStrikethroughPrimary]];
      uint64_t v8 = 0;
      goto LABEL_7;
    case 2:
      id v5 = [(PKStackedTextItem *)self->_content secondary];
      uint64_t v8 = [(PKStackedTextItemView *)self _attributedStringWithText:v5 strikethrough:0];
      double v7 = 0;
LABEL_7:
      uint64_t v9 = 0;
      goto LABEL_9;
    case 3:
      uint64_t v11 = [(PKStackedTextItem *)self->_content primary];
      double v7 = [(PKStackedTextItemView *)self _attributedStringWithText:v11 strikethrough:[(PKStackedTextItem *)self->_content isStrikethroughPrimary]];

      double v12 = [(PKStackedTextItem *)self->_content secondary];
      uint64_t v8 = [(PKStackedTextItemView *)self _attributedStringWithText:v12 strikethrough:0];

      id v5 = [(PKStackedTextItem *)self->_content tertiary];
      uint64_t v9 = [(PKStackedTextItemView *)self _attributedStringWithText:v5 strikethrough:0];
LABEL_9:
      CGFloat v6 = 0;
LABEL_10:

      if (a3) {
        goto LABEL_11;
      }
      goto LABEL_4;
    default:
      double v7 = 0;
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      CGFloat v6 = 0;
      if (a3)
      {
LABEL_11:
        [(UILabel *)self->_title alpha];
        double v13 = 0.0;
        if (v14 > 0.0)
        {
          long long v15 = [(UILabel *)self->_title text];
          char v16 = PKEqualObjects();

          if ((v16 & 1) == 0)
          {
            [(PKStackedTextItemView *)self _prepareViewForReuse:self->_title];
            double v13 = fmax(v17, 0.0);
          }
        }
        [(UILabel *)self->_primary alpha];
        if (v18 > 0.0)
        {
          [(PKStackedTextItemView *)self _prepareViewForReuse:self->_primary];
          double v13 = fmax(v19, v13);
        }
        [(UILabel *)self->_secondary alpha];
        if (v20 > 0.0)
        {
          [(PKStackedTextItemView *)self _prepareViewForReuse:self->_secondary];
          double v13 = fmax(v21, v13);
        }
        [(UILabel *)self->_tertiary alpha];
        if (v22 > 0.0)
        {
          [(PKStackedTextItemView *)self _prepareViewForReuse:self->_tertiary];
          double v13 = fmax(v23, v13);
        }
        double v10 = v13 * 0.65;
      }
      else
      {
LABEL_4:
        double v10 = 0.0;
      }
      if (self->_primary && (self->_style | 2) == 3)
      {
        BOOL v24 = [(PKStackedTextItem *)self->_content isSignificantPrimary];
        uint64_t v25 = 8;
        if (v24) {
          uint64_t v25 = 9;
        }
        objc_storeStrong((id *)&self->_idealPrimaryFont, *(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKStackedTextItemView__style[v25]));
        [(UILabel *)self->_primary setFont:self->_idealPrimaryFont];
        primary = self->_primary;
        if ([(PKStackedTextItem *)self->_content isDeemphasizedPrimary]) {
          [MEMORY[0x1E4FB1618] secondaryLabelColor];
        }
        else {
        uint64_t v27 = [MEMORY[0x1E4FB1618] labelColor];
        }
        [(UILabel *)primary setTextColor:v27];
      }
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __49__PKStackedTextItemView__updateSubviewsAnimated___block_invoke;
      v29[3] = &__block_descriptor_41_e40_v24__0__UILabel_8__NSAttributedString_16l;
      BOOL v30 = a3;
      *(double *)&v29[4] = v10;
      long long v28 = (void (**)(void *, UILabel *, void *))_Block_copy(v29);
      v28[2](v28, self->_title, v6);
      v28[2](v28, self->_primary, v7);
      v28[2](v28, self->_secondary, v8);
      v28[2](v28, self->_tertiary, v9);
      [(PKStackedTextItemView *)self setNeedsLayout];
      [(PKStackedTextItemView *)self layoutIfNeeded];

      return;
  }
}

void __49__PKStackedTextItemView__updateSubviewsAnimated___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    id v5 = a2;
    [v5 setAttributedText:a3];
    id v12 = [v5 layer];

    if (a3) {
      double v6 = 1.0;
    }
    else {
      double v6 = 0.0;
    }
    [v12 opacity];
    double v8 = v7;
    if (v6 != v7)
    {
      if (*(unsigned char *)(a1 + 40))
      {
        uint64_t v9 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"opacity"];
        [v9 setBeginTime:*(double *)(a1 + 32)];
        objc_msgSend(v9, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v8, v6);
        id v10 = (id)objc_msgSend(v12, "pkui_addAdditiveAnimation:", v9);
      }
      double v11 = 0.0;
      if (a3) {
        *(float *)&double v11 = 1.0;
      }
      [v12 setOpacity:v11];
    }
  }
}

- (void)_updateAlignmentAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(PKStackedTextItemView *)self _shouldReverseLayoutDirection];
  int64_t textAlignment = self->_textAlignment;
  BOOL v7 = textAlignment == 0;
  if (textAlignment == 1) {
    unsigned int v8 = v5 ^ 1;
  }
  else {
    unsigned int v8 = 0;
  }
  if ((v7 & v5) != 0) {
    double v9 = 1.0;
  }
  else {
    double v9 = (double)v8;
  }
  id v22 = [(PKStackedTextItemView *)self layer];
  [v22 anchorPoint];
  double v12 = v11;
  double v13 = v10;
  if (v9 != v11 || v10 != 0.0)
  {
    [v22 bounds];
    double v15 = v14;
    double v17 = v16;
    [v22 position];
    double v19 = v18;
    double v21 = v20;
    objc_msgSend(v22, "setAnchorPoint:", v9, 0.0);
    objc_msgSend(v22, "setPosition:", v19 - v12 * v15 + v9 * v15, v21 - v13 * v17 + v17 * 0.0);
  }
  [(PKStackedTextItemView *)self setNeedsLayout];
  [(PKStackedTextItemView *)self layoutIfNeededAnimated:v3];
}

- (double)_prepareViewForReuse:(id)a3
{
  id v4 = a3;
  int v5 = [v4 superview];
  if (v5)
  {
    double v6 = [v4 snapshotViewAfterScreenUpdates:0];
    if (v6)
    {
      [v4 frame];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v15 = [v4 layer];
      double v16 = [v15 presentationLayer];
      double v17 = v16;
      if (v16)
      {
        [v16 anchorPoint];
        double v19 = v18;
        double v21 = v20;
        [v17 position];
        double v23 = v22;
        double v25 = v24;
        [v17 bounds];
        double v12 = v26;
        double v14 = v27;
        double v8 = v23 - v19 * v26;
        double v10 = v25 - v21 * v27;
      }
      objc_msgSend(v6, "setFrame:", v8, v10, v12, v14);
      [v5 addSubview:v6];
      long long v28 = [v6 layer];
      objc_msgSend(v28, "setAllowsGroupOpacity:", objc_msgSend(v15, "allowsGroupOpacity"));
      id v29 = [v15 compositingFilter];
      [v28 setCompositingFilter:v29];

      BOOL v30 = self->_snapshots;
      [(NSMutableSet *)v30 addObject:v6];
      double v31 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"opacity"];
      [v28 opacity];
      objc_msgSend(v31, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v32, 0.0);
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __46__PKStackedTextItemView__prepareViewForReuse___block_invoke;
      v42[3] = &unk_1E59CAEA8;
      id v43 = v6;
      v44 = v30;
      long long v33 = v30;
      objc_msgSend(v31, "pkui_setCompletionHandler:", v42);
      id v34 = (id)objc_msgSend(v28, "pkui_addAdditiveAnimation:", v31);
      [v28 setOpacity:0.0];
      [v31 duration];
      double v36 = v35;
    }
    else
    {
      double v36 = 0.0;
    }
  }
  else
  {
    double v36 = 0.0;
  }
  char v37 = (void *)MEMORY[0x1E4FB1EB0];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __46__PKStackedTextItemView__prepareViewForReuse___block_invoke_2;
  v40[3] = &unk_1E59CA7D0;
  id v41 = v4;
  id v38 = v4;
  [v37 performWithoutAnimation:v40];

  return v36;
}

uint64_t __46__PKStackedTextItemView__prepareViewForReuse___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  uint64_t v3 = *(void *)(a1 + 32);
  double v2 = *(void **)(a1 + 40);

  return [v2 removeObject:v3];
}

void __46__PKStackedTextItemView__prepareViewForReuse___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) layer];
  [v2 removeAllAnimations];
  [*(id *)(a1 + 32) setAlpha:0.0];
  [v2 clearHasBeenCommitted];
}

- (void)setTextAlignment:(int64_t)a3
{
}

- (void)setTextAlignment:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_textAlignment != a3)
  {
    BOOL v4 = a4;
    [(PKStackedTextItemView *)self layoutIfNeeded];
    self->_int64_t textAlignment = a3;
    [(PKStackedTextItemView *)self _updateAlignmentAnimated:v4];
  }
}

- (void)setContent:(id)a3
{
}

- (void)setContent:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    [(PKStackedTextItemView *)self layoutIfNeeded];
    objc_storeStrong((id *)&self->_content, a3);
    self->_contentConstraints.boundingSize = 0u;
    self->_contentConstraints.textMetrics[0].frame.origin = 0u;
    self->_contentConstraints.textMetrics[0].frame.size = 0u;
    *(_OWORD *)&self->_contentConstraints.textMetrics[0].widthConstrained = 0u;
    *(_OWORD *)&self->_contentConstraints.textMetrics[1].frame.origin.y = 0u;
    *(_OWORD *)&self->_contentConstraints.textMetrics[1].frame.size.height = 0u;
    self->_contentConstraints.textMetrics[2].frame.origin = 0u;
    self->_contentConstraints.textMetrics[2].frame.size = 0u;
    *(_OWORD *)&self->_contentConstraints.textMetrics[2].widthConstrained = 0u;
    *(_OWORD *)&self->_contentConstraints.textMetrics[3].frame.origin.y = 0u;
    *(_OWORD *)&self->_contentConstraints.textMetrics[3].frame.size.height = 0u;
    [(PKStackedTextItemView *)self _updateSubviewsAnimated:v4];
  }
}

- (void)setContentConstraints:(id *)a3
{
  CGPoint origin = a3->var1[0].var0.origin;
  CGSize size = a3->var1[0].var0.size;
  self->_contentConstraints.boundingSize = a3->var0;
  self->_contentConstraints.textMetrics[0].frame.CGPoint origin = origin;
  self->_contentConstraints.textMetrics[0].frame.CGSize size = size;
  CGPoint v5 = a3->var1[2].var0.origin;
  long long v7 = *(_OWORD *)&a3->var1[0].var1;
  long long v6 = *(_OWORD *)&a3->var1[1].var0.origin.y;
  *(_OWORD *)&self->_contentConstraints.textMetrics[1].frame.size.height = *(_OWORD *)&a3->var1[1].var0.size.height;
  self->_contentConstraints.textMetrics[2].frame.CGPoint origin = v5;
  *(_OWORD *)&self->_contentConstraints.textMetrics[0].widthConstrained = v7;
  *(_OWORD *)&self->_contentConstraints.textMetrics[1].frame.origin.y = v6;
  long long v8 = *(_OWORD *)&a3->var1[3].var0.size.height;
  CGSize v10 = a3->var1[2].var0.size;
  long long v9 = *(_OWORD *)&a3->var1[2].var1;
  *(_OWORD *)&self->_contentConstraints.textMetrics[3].frame.origin.y = *(_OWORD *)&a3->var1[3].var0.origin.y;
  *(_OWORD *)&self->_contentConstraints.textMetrics[3].frame.size.height = v8;
  self->_contentConstraints.textMetrics[2].frame.CGSize size = v10;
  *(_OWORD *)&self->_contentConstraints.textMetrics[2].widthConstrained = v9;
  self->_boundsSize = (CGSize)*MEMORY[0x1E4F1DB30];
  [(PKStackedTextItemView *)self setNeedsLayout];
}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (PKStackedTextItem)content
{
  return self->_content;
}

- ($0DDA3FF1E8F4FFE0EF06F4F911C98BBB)contentConstraints
{
  long long v3 = *(_OWORD *)&self[3].var1[3].var1;
  *(CGSize *)&retstr->var1[2].var1 = self[3].var1[3].var0.size;
  *(_OWORD *)&retstr->var1[3].var0.origin.y = v3;
  *(_OWORD *)&retstr->var1[3].var0.size.height = *(_OWORD *)&self[4].var0.height;
  long long v4 = *(_OWORD *)&self[3].var1[2].var0.origin.y;
  *(_OWORD *)&retstr->var1[1].var0.origin.y = *(_OWORD *)&self[3].var1[1].var1;
  *(_OWORD *)&retstr->var1[1].var0.size.height = v4;
  CGPoint origin = self[3].var1[3].var0.origin;
  retstr->var1[2].var0.CGPoint origin = *(CGPoint *)&self[3].var1[2].var0.size.height;
  retstr->var1[2].var0.CGSize size = (CGSize)origin;
  CGPoint v6 = *(CGPoint *)&self[3].var1[0].var0.size.height;
  retstr->var0 = *(CGSize *)&self[3].var1[0].var0.origin.y;
  retstr->var1[0].var0.CGPoint origin = v6;
  CGSize size = self[3].var1[1].var0.size;
  retstr->var1[0].var0.CGSize size = (CGSize)self[3].var1[1].var0.origin;
  *(CGSize *)&retstr->var1[0].var1 = size;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_idealTertiaryFont, 0);
  objc_storeStrong((id *)&self->_idealSecondaryFont, 0);
  objc_storeStrong((id *)&self->_idealPrimaryFont, 0);
  objc_storeStrong((id *)&self->_idealTitleFont, 0);
  objc_storeStrong((id *)&self->_layoutPrimaryFont, 0);
  objc_storeStrong((id *)&self->_primaryFont, 0);
  objc_storeStrong((id *)&self->_significantPrimaryFont, 0);
  objc_storeStrong((id *)&self->_snapshots, 0);
  objc_storeStrong((id *)&self->_tertiary, 0);
  objc_storeStrong((id *)&self->_secondary, 0);
  objc_storeStrong((id *)&self->_primary, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end