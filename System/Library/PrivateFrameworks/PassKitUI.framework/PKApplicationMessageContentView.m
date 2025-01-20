@interface PKApplicationMessageContentView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKApplicationMessageContentView)initWithCoder:(id)a3;
- (PKApplicationMessageContentView)initWithFrame:(CGRect)a3;
- (double)_layoutWithContext:(double)a3 bounds:(double)a4;
- (double)_prepareViewForReuse:(int)a3 type:(double)a4 state:(double)a5;
- (uint64_t)initWithWidth:(void *)a1;
- (void)_updateForTraitCollection:(uint64_t)a1;
- (void)_updateSubviewsAnimated:(uint64_t)a1;
- (void)dealloc;
- (void)layoutSubviews;
- (void)performBatchUpdates:(uint64_t)a3 animated:;
- (void)setBlurRadius:(void *)a3 animated:(double)a4 withCompletion:;
- (void)setContent:(int)a3 animated:;
- (void)setDismissable:(int)a3 animated:;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKApplicationMessageContentView

- (PKApplicationMessageContentView)initWithCoder:(id)a3
{
  return 0;
}

- (PKApplicationMessageContentView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (uint64_t)initWithWidth:(void *)a1
{
  if (!a1) {
    return 0;
  }
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v37.receiver = a1;
  v37.super_class = (Class)PKApplicationMessageContentView;
  id v5 = objc_msgSendSuper2(&v37, sel_initWithFrame_, v3, v4, a2, 0.0);
  uint64_t v6 = (uint64_t)v5;
  if (v5)
  {
    objc_msgSend(v5, "pkui_setMaskType:", 3);
    v7 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
    [(id)v6 setBackgroundColor:v7];

    [(id)v6 setMaximumContentSizeCategory:*MEMORY[0x1E4FB2790]];
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v9 = *(void **)(v6 + 552);
    *(void *)(v6 + 552) = v8;

    id v10 = objc_alloc_init(MEMORY[0x1E4FB1838]);
    v11 = *(void **)(v6 + 488);
    *(void *)(v6 + 488) = v10;

    id Label_0 = CreateLabel_0(1, 0);
    v13 = *(void **)(v6 + 496);
    *(void *)(v6 + 496) = Label_0;

    v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    id v15 = CreateLabel_0(3, v14);
    v16 = *(void **)(v6 + 504);
    *(void *)(v6 + 504) = v15;

    id v17 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    v18 = *(void **)(v6 + 480);
    *(void *)(v6 + 480) = v17;

    [*(id *)(v6 + 480) addSubview:*(void *)(v6 + 488)];
    v19 = [*(id *)(v6 + 480) layer];
    [v19 setMasksToBounds:1];
    [v19 setCornerCurve:*MEMORY[0x1E4F39EA8]];
    id v20 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.21];
    objc_msgSend(v19, "setBorderColor:", objc_msgSend(v20, "CGColor"));

    [*(id *)(v6 + 480) setAlpha:0.0];
    [*(id *)(v6 + 496) setAlpha:0.0];
    [*(id *)(v6 + 504) setAlpha:0.0];
    id v21 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    v22 = *(void **)(v6 + 432);
    *(void *)(v6 + 432) = v21;

    [*(id *)(v6 + 432) setUserInteractionEnabled:0];
    [*(id *)(v6 + 432) setClipsToBounds:1];
    [*(id *)(v6 + 432) addSubview:*(void *)(v6 + 480)];
    [*(id *)(v6 + 432) addSubview:*(void *)(v6 + 496)];
    [*(id *)(v6 + 432) addSubview:*(void *)(v6 + 504)];
    [(id)v6 addSubview:*(void *)(v6 + 432)];
    v23 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    [v23 setPreferredSymbolConfigurationForImage:0];
    v24 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    [v23 setBaseForegroundColor:v24];

    objc_msgSend(v23, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
    objc_initWeak(&location, (id)v6);
    v25 = (void *)MEMORY[0x1E4FB13F0];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __49__PKApplicationMessageContentView_initWithWidth___block_invoke;
    v34[3] = &unk_1E59CBEE0;
    objc_copyWeak(&v35, &location);
    v26 = [v25 actionWithHandler:v34];
    uint64_t v27 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v23 primaryAction:v26];
    v28 = *(void **)(v6 + 424);
    *(void *)(v6 + 424) = v27;

    v29 = *(void **)(v6 + 424);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __49__PKApplicationMessageContentView_initWithWidth___block_invoke_2;
    v32[3] = &unk_1E59DE560;
    objc_copyWeak(&v33, &location);
    [v29 setConfigurationUpdateHandler:v32];
    [*(id *)(v6 + 424) setAlpha:0.0];
    objc_msgSend(*(id *)(v6 + 424), "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    [*(id *)(v6 + 424) sizeToFit];
    [(id)v6 addSubview:*(void *)(v6 + 424)];
    v30 = [(id)v6 traitCollection];
    if (v30) {
      -[PKApplicationMessageContentView _updateForTraitCollection:](v6, v30);
    }
    else {
      -[PKApplicationMessageContentView _updateSubviewsAnimated:](v6, 0);
    }

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }
  return v6;
}

void __49__PKApplicationMessageContentView_initWithWidth___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v1 = objc_loadWeakRetained(WeakRetained + 75);
    [v1 applicationMessageContentViewDismissTapped:WeakRetained];
  }
}

void __49__PKApplicationMessageContentView_initWithWidth___block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = (void *)MEMORY[0x1E4FB1830];
  uint64_t v4 = *MEMORY[0x1E4FB28C8];
  id v5 = a2;
  uint64_t v6 = [v3 configurationWithTextStyle:v4 scale:2];
  v7 = [MEMORY[0x1E4FB1830] configurationWithWeight:6];
  id v8 = [v6 configurationByApplyingConfiguration:v7];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = [WeakRetained traitCollection];

  if (v10)
  {
    uint64_t v11 = [v8 configurationWithTraitCollection:v10];

    id v8 = (void *)v11;
  }
  id v13 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark.circle.fill" withConfiguration:v8];

  v12 = [v5 configuration];
  [v12 setImage:v13];
  [v5 setConfiguration:v12];
}

- (void)_updateForTraitCollection:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = (void *)*MEMORY[0x1E4FB28C8];
    id v5 = (void *)*MEMORY[0x1E4FB0928];
    id v13 = v3;
    uint64_t v6 = _PKFontForDesign(v3, (void *)*MEMORY[0x1E4FB0928], (void *)*MEMORY[0x1E4FB28C8], 4098, 0, 0);
    v7 = *(void **)(a1 + 560);
    *(void *)(a1 + 560) = v6;

    if (!*(void *)(a1 + 568))
    {
      id v8 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x1E4FB27D0]];
      uint64_t v9 = _PKFontForDesign(v8, v5, v4, 4098, 0, 0);
      id v10 = *(void **)(a1 + 568);
      *(void *)(a1 + 568) = v9;
    }
    uint64_t v11 = _PKFontForDesign(v13, v5, (void *)*MEMORY[0x1E4FB2950], 0x8000, 0, 0);
    v12 = *(void **)(a1 + 576);
    *(void *)(a1 + 576) = v11;

    [*(id *)(a1 + 424) setNeedsUpdateConfiguration];
    -[PKApplicationMessageContentView _updateSubviewsAnimated:](a1, 0);
    [(id)a1 setNeedsLayout];
    id v3 = v13;
  }
}

- (void)_updateSubviewsAnimated:(uint64_t)a1
{
  if (!a1) {
    return;
  }
  if (*(unsigned char *)(a1 + 584))
  {
    *(unsigned char *)(a1 + 585) = 1;
    return;
  }
  if (a2) {
    PKUIViewLayoutIfNeeded((void *)a1, 1, 0);
  }
  [*(id *)(a1 + 576) _bodyLeading];
  PKFloatRoundToPixel();
  double v5 = v4 + 8.0;
  double v6 = *(double *)(a1 + 512);
  double v7 = *(double *)(a1 + 520);
  double v8 = *(double *)(a1 + 528);
  double v9 = *(double *)(a1 + 536);
  *(double *)(a1 + 512) = v5;
  *(void *)(a1 + 520) = 0x4030000000000000;
  *(double *)(a1 + 528) = v5;
  *(void *)(a1 + 536) = 0x4030000000000000;
  id v10 = *(id *)(a1 + 544);
  uint64_t v11 = [PKApplicationMessageContentView_State alloc];
  v12 = *(void **)(a1 + 592);
  id v13 = *(void **)(a1 + 568);
  v14 = *(void **)(a1 + 560);
  id v15 = *(void **)(a1 + 576);
  char v95 = *(unsigned char *)(a1 + 586);
  id v16 = v12;
  id v17 = v13;
  id v97 = v14;
  id v98 = v15;
  int v96 = a2;
  if (v11)
  {
    v102.receiver = v11;
    v102.super_class = (Class)PKApplicationMessageContentView_State;
    v18 = (id *)objc_msgSendSuper2(&v102, sel_init);
    v19 = v18;
    if (v18)
    {
      objc_storeStrong(v18 + 1, v12);
      objc_storeStrong(v19 + 6, v14);
      objc_storeStrong(v19 + 8, v15);
      v94 = v10;
      if ([v16 type])
      {
        id v20 = 0;
        v92 = 0;
      }
      else
      {
        v22 = [v16 contentTypeDefault];
        id v20 = [v22 icon];
        id v21 = [v22 title];
        v92 = [v22 body];

        if (v21)
        {
LABEL_12:
          v23 = [v20 image];
          objc_storeStrong(v19 + 3, v20);
          id v24 = v23;
          v25 = v24;
          v26 = v98;
          id v91 = v16;
          v93 = v21;
          if (v24)
          {
            switch([v24 tintColor])
            {
              case 1:
                uint64_t v27 = [MEMORY[0x1E4FB1618] labelColor];
                goto LABEL_39;
              case 2:
                uint64_t v27 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
                goto LABEL_39;
              case 3:
                uint64_t v27 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
                goto LABEL_39;
              case 4:
                uint64_t v27 = [MEMORY[0x1E4FB1618] quaternaryLabelColor];
                goto LABEL_39;
              case 5:
                uint64_t v27 = [MEMORY[0x1E4FB1618] linkColor];
                goto LABEL_39;
              case 6:
                uint64_t v27 = [MEMORY[0x1E4FB1618] placeholderTextColor];
                goto LABEL_39;
              case 7:
                uint64_t v27 = [MEMORY[0x1E4FB1618] systemFillColor];
                goto LABEL_39;
              case 8:
                uint64_t v27 = [MEMORY[0x1E4FB1618] secondarySystemFillColor];
                goto LABEL_39;
              case 9:
                uint64_t v27 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
                goto LABEL_39;
              case 10:
                uint64_t v27 = [MEMORY[0x1E4FB1618] quaternarySystemFillColor];
                goto LABEL_39;
              case 11:
                uint64_t v27 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
                goto LABEL_39;
              case 12:
                uint64_t v27 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
                goto LABEL_39;
              case 13:
                uint64_t v27 = [MEMORY[0x1E4FB1618] tertiarySystemBackgroundColor];
                goto LABEL_39;
              case 14:
                uint64_t v27 = [MEMORY[0x1E4FB1618] systemBlueColor];
                goto LABEL_39;
              case 15:
                uint64_t v27 = [MEMORY[0x1E4FB1618] systemGreenColor];
                goto LABEL_39;
              case 16:
                uint64_t v27 = [MEMORY[0x1E4FB1618] systemIndigoColor];
                goto LABEL_39;
              case 17:
                uint64_t v27 = [MEMORY[0x1E4FB1618] systemOrangeColor];
                goto LABEL_39;
              case 18:
                uint64_t v27 = [MEMORY[0x1E4FB1618] systemPinkColor];
                goto LABEL_39;
              case 19:
                uint64_t v27 = [MEMORY[0x1E4FB1618] systemPurpleColor];
                goto LABEL_39;
              case 20:
                uint64_t v27 = [MEMORY[0x1E4FB1618] systemRedColor];
                goto LABEL_39;
              case 21:
                uint64_t v27 = [MEMORY[0x1E4FB1618] systemTealColor];
                goto LABEL_39;
              case 22:
                uint64_t v27 = [MEMORY[0x1E4FB1618] systemYellowColor];
                goto LABEL_39;
              case 23:
                uint64_t v27 = [MEMORY[0x1E4FB1618] systemGrayColor];
LABEL_39:
                uint64_t v28 = v27;
                int v29 = 0;
                break;
              case 24:
                goto LABEL_15;
              default:
                int v29 = 0;
                uint64_t v28 = 0;
                break;
            }
          }
          else
          {
LABEL_15:
            uint64_t v28 = 0;
            int v29 = 1;
          }
          if (v28) {
            int v30 = 1;
          }
          else {
            int v30 = v29;
          }

          id v31 = v19[5];
          v19[5] = (id)v28;

          id v32 = v25;
          id v33 = v17;
          if (v25)
          {
            uint64_t v34 = [v32 type];
            if (v34 == 1)
            {
              v89 = v20;
              id v90 = v17;
              if (v33) {
                [MEMORY[0x1E4FB1830] configurationWithFont:v33 scale:3];
              }
              else {
              v39 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
              }
              v40 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x1E4FB27D0]];
              v36 = [v39 configurationWithTraitCollection:v40];

              v41 = (void *)MEMORY[0x1E4FB1818];
              v42 = [v32 name];
              v25 = [v41 _systemImageNamed:v42 withConfiguration:v36];

              int v37 = 1;
              v26 = v98;
LABEL_54:

              if (v25)
              {
                id v20 = v89;
                if ((v30 | v37) == 1)
                {
                  uint64_t v43 = [v25 imageWithRenderingMode:2];

                  v25 = (void *)v43;
                }
                id v38 = v90;
                id v16 = v91;
              }
              else
              {
                id v38 = v90;
                id v16 = v91;
                id v20 = v89;
              }
              goto LABEL_59;
            }
            if (!v34)
            {
              v89 = v20;
              id v90 = v17;
              id v35 = (void *)MEMORY[0x1E4FB1818];
              v36 = [v32 image];
              v25 = [v35 imageWithPKImage:v36];
              int v37 = 0;
              goto LABEL_54;
            }
            id v38 = v17;
            v25 = 0;
          }
          else
          {
            id v38 = v17;
          }
          id v16 = v91;
LABEL_59:

          id v44 = v19[4];
          v19[4] = v25;

          v45 = v97;
          uint64_t AtrributedString = CreateAtrributedString(v93, v97);
          id v47 = v19[7];
          v19[7] = (id)AtrributedString;

          uint64_t v48 = CreateAtrributedString(v92, v26);
          id v49 = v19[9];
          v19[9] = (id)v48;

          BOOL v50 = v19[4] != 0;
          BOOL v51 = v19[7] != 0;
          BOOL v52 = v19[9] != 0;
          *((unsigned char *)v19 + 16) = v95;
          *((unsigned char *)v19 + 17) = v50;
          *((unsigned char *)v19 + 18) = v51;
          *((unsigned char *)v19 + 19) = v52;

          id v10 = v94;
          id v17 = v38;
          goto LABEL_62;
        }
      }
      id v21 = &stru_1EF1B5B50;
      goto LABEL_12;
    }
  }
  else
  {
    v19 = 0;
  }
  v45 = v97;
  v26 = v98;
LABEL_62:

  v53 = *(void **)(a1 + 544);
  *(void *)(a1 + 544) = v19;

  if (v10) {
    int v54 = v10[4];
  }
  else {
    int v54 = 0;
  }
  uint64_t v55 = *(void *)(a1 + 544);
  if (v55)
  {
    unsigned int v56 = *(_DWORD *)(v55 + 16);
    uint64_t v55 = *(void *)(v55 + 24);
  }
  else
  {
    unsigned int v56 = 0;
  }
  id v57 = (id)v55;
  v58 = *(void **)(a1 + 544);
  if (v58) {
    v58 = (void *)v58[7];
  }
  v59 = v58;
  v60 = *(void **)(a1 + 544);
  if (v60) {
    v60 = (void *)v60[9];
  }
  v61 = v60;
  long long v62 = *(_OWORD *)(a1 + 456);
  objc_super v102 = *(objc_super *)(a1 + 440);
  long long v103 = v62;
  uint64_t v104 = *(void *)(a1 + 472);
  *(double *)(a1 + 448) = v6;
  *(double *)(a1 + 456) = v7;
  *(double *)(a1 + 464) = v8;
  *(double *)(a1 + 472) = v9;
  v63 = &OBJC_IVAR___PKPassBannerMinimalView__leadingView;
  if (v96)
  {
    double v64 = 0.0;
    if ((v54 & 0x100) != 0 && (PKEqualObjects() & 1) == 0) {
      double v64 = fmax(-[PKApplicationMessageContentView _prepareViewForReuse:type:state:](a1, *(void **)(a1 + 480), 0, v6, v7, v8, v9), 0.0);
    }
    if ((v54 & 0x10000) != 0 && (PKEqualObjects() & 1) == 0) {
      double v64 = fmax(-[PKApplicationMessageContentView _prepareViewForReuse:type:state:](a1, *(void **)(a1 + 496), 1, v6, v7, v8, v9), v64);
    }
    if ((v54 & 0x1000000) != 0 && (PKEqualObjects() & 1) == 0) {
      double v64 = fmax(-[PKApplicationMessageContentView _prepareViewForReuse:type:state:](a1, *(void **)(a1 + 504), 1, v6, v7, v8, v9), v64);
    }
    *(double *)(a1 + 440) = fmax(*(double *)(a1 + 440), v64 * 0.65);
  }
  uint64_t v65 = *(void *)(a1 + 544);
  if (v65) {
    uint64_t v66 = *(void *)(v65 + 32);
  }
  else {
    uint64_t v66 = 0;
  }
  [*(id *)(a1 + 488) setImage:v66];
  uint64_t v67 = *(void *)(a1 + 544);
  if (v67) {
    uint64_t v68 = *(void *)(v67 + 40);
  }
  else {
    uint64_t v68 = 0;
  }
  [*(id *)(a1 + 480) setTintColor:v68];
  if ([*(id *)(a1 + 592) type]) {
    goto LABEL_92;
  }
  v99 = v61;
  v69 = v59;
  id v70 = v57;
  v71 = v10;
  v72 = [*(id *)(a1 + 592) contentTypeDefault];
  v73 = [v72 icon];
  v74 = [v73 image];
  uint64_t v75 = [v74 type];

  if (!v75)
  {
    [*(id *)(a1 + 480) setBackgroundColor:0];
    goto LABEL_90;
  }
  v63 = &OBJC_IVAR___PKPassBannerMinimalView__leadingView;
  if (v75 == 1)
  {
    v76 = *(void **)(a1 + 480);
    v77 = [MEMORY[0x1E4FB1618] tertiarySystemGroupedBackgroundColor];
    [v76 setBackgroundColor:v77];

LABEL_90:
    v63 = &OBJC_IVAR___PKPassBannerMinimalView__leadingView;
  }

  id v10 = v71;
  id v57 = v70;
  v59 = v69;
  v61 = v99;
LABEL_92:
  v78 = *(void **)(a1 + 496);
  if (v78) {
    [v78 setAttributedText:v59];
  }
  v79 = *(void **)(a1 + v63[786]);
  if (v79) {
    [v79 setAttributedText:v61];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKApplicationMessageContentView__updateSubviewsAnimated___block_invoke_2;
  aBlock[3] = &unk_1E59DE5B0;
  char v101 = v96;
  aBlock[4] = a1;
  v80 = _Block_copy(aBlock);
  if (v96)
  {
    int v82 = [(id)a1 _shouldReverseLayoutDirection];
    [(id)a1 bounds];
    if (v82) {
      uint64_t v87 = 0x200000101;
    }
    else {
      uint64_t v87 = 0x200000001;
    }
    v81.n128_f64[0] = -[PKApplicationMessageContentView _layoutWithContext:bounds:](a1, v87, v83, v84, v85, v86);
  }
  (*((void (**)(void *, void, void, __n128))v80 + 2))(v80, *(void *)(a1 + 424), v56 & 1, v81);
  (*((void (**)(void *, void, void))v80 + 2))(v80, *(void *)(a1 + 496), HIWORD(v56) & 1);
  (*((void (**)(void *, void, void))v80 + 2))(v80, *(void *)(a1 + 504), HIBYTE(v56) & 1);
  (*((void (**)(void *, void, void))v80 + 2))(v80, *(void *)(a1 + 480), (v56 >> 8) & 1);
  [(id)a1 setNeedsLayout];
  PKUIViewLayoutIfNeeded((void *)a1, 0, 0);
  long long v88 = v103;
  *(objc_super *)(a1 + 440) = v102;
  *(_OWORD *)(a1 + 456) = v88;
  *(void *)(a1 + 472) = v104;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKApplicationMessageContentView;
  [(PKApplicationMessageContentView *)&v2 dealloc];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKApplicationMessageContentView;
  [(PKApplicationMessageContentView *)&v9 traitCollectionDidChange:v4];
  double v5 = [(PKApplicationMessageContentView *)self traitCollection];
  if (!v4
    || ([v4 preferredContentSizeCategory],
        double v6 = (NSString *)objc_claimAutoreleasedReturnValue(),
        [v5 preferredContentSizeCategory],
        double v7 = (NSString *)objc_claimAutoreleasedReturnValue(),
        NSComparisonResult v8 = UIContentSizeCategoryCompareToCategory(v6, v7),
        v7,
        v6,
        v8))
  {
    -[PKApplicationMessageContentView _updateForTraitCollection:]((uint64_t)self, v5);
  }
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)PKApplicationMessageContentView;
  [(PKApplicationMessageContentView *)&v10 layoutSubviews];
  unsigned int IsAnimated = PKCATrackedLayoutIsAnimated();
  int v4 = [(PKApplicationMessageContentView *)self _shouldReverseLayoutDirection];
  [(PKApplicationMessageContentView *)self bounds];
  uint64_t v9 = 0x100000000;
  if (v4) {
    uint64_t v9 = 0x100000100;
  }
  -[PKApplicationMessageContentView _layoutWithContext:bounds:]((uint64_t)self, v9 | IsAnimated, v5, v6, v7, v8);
}

- (double)_layoutWithContext:(double)a3 bounds:(double)a4
{
  uint64_t v153 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0.0;
  }
  unint64_t v10 = a2 & 0xFFFFFFFF00000000;
  BOOL v11 = (a2 & 0xFFFFFFFF00000000) == 0x100000000;
  objc_msgSend(*(id *)(a1 + 424), "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  uint64_t v116 = a1;
  v12 = [*(id *)(a1 + 424) imageView];
  id v13 = [v12 image];

  [v13 alignmentRectInsets];
  PKSizeAlignedInRect();
  CGFloat v18 = v14;
  double v108 = v17;
  double v109 = v15;
  CGFloat v19 = v16;
  if (v11) {
    objc_msgSend(*(id *)(v116 + 424), "setFrame:", v14, v15, v16, v17);
  }
  uint64_t v20 = v116;
  uint64_t v21 = *(void *)(v116 + 544);
  if (!v21 || (CGFloat v22 = v108, v23 = v109, (*(unsigned char *)(v21 + 16) & 1) == 0))
  {
    CGFloat v18 = *MEMORY[0x1E4F1DB20];
    CGFloat v23 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat v19 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat v22 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v24 = *(double *)(v116 + 512);
  double v25 = *(double *)(v116 + 520);
  double v26 = a3 + v25;
  double v27 = a4 + v24;
  double v28 = a5 - (v25 + *(double *)(v116 + 536));
  double v29 = a6 - (v24 + *(double *)(v116 + 528));
  CGFloat r1 = v29;
  if (v10 == 0x100000000)
  {
    objc_msgSend(*(id *)(v116 + 432), "pkui_setFrame:animated:", a2 & 1, v26, v27, v28, v29);
    double v29 = r1;
  }
  double rect = *MEMORY[0x1E4F1DAD8];
  double v114 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v30 = v26;
  double v31 = v27;
  double v32 = v28;
  v157.origin.CGFloat x = v18;
  v157.origin.CGFloat y = v23;
  v157.size.CGFloat width = v19;
  v157.size.CGFloat height = v22;
  CGRect v154 = CGRectIntersection(*(CGRect *)(&v29 - 3), v157);
  CGRect v155 = CGRectOffset(v154, -v26, -v27);
  CGFloat y = v155.origin.y;
  CGFloat x = v155.origin.x;
  CGFloat height = v155.size.height;
  CGFloat width = v155.size.width;
  if ((a2 & 0x100) != 0) {
    uint64_t v33 = 2;
  }
  else {
    uint64_t v33 = 0x200000000;
  }
  uint64_t v34 = *(void *)(v116 + 544);
  if (v34) {
    unsigned int v113 = *(_DWORD *)(v34 + 16);
  }
  else {
    unsigned int v113 = 0;
  }
  uint64_t v143 = 0;
  v144 = (double *)&v143;
  uint64_t v145 = 0x2020000000;
  v156.origin.CGFloat y = v114;
  double v146 = v114;
  uint64_t v138 = 0;
  v139 = (CGRect *)&v138;
  uint64_t v140 = 0x4010000000;
  v141 = "";
  uint64_t v133 = 0;
  v134 = (CGRect *)&v133;
  uint64_t v135 = 0x4010000000;
  v136 = "";
  memset(&v137, 0, sizeof(v137));
  v156.origin.CGFloat x = rect;
  v142.origin.CGFloat x = rect;
  v142.origin.CGFloat y = v114;
  v156.size.CGFloat height = r1;
  v142.size.CGFloat width = v28;
  v142.size.CGFloat height = r1;
  v156.size.CGFloat width = v28;
  CGRectDivide(v156, &v137, &v142, 45.0, (CGRectEdge)v33);
  uint64_t v35 = *(void *)(v116 + 544);
  if (v35)
  {
    id v36 = *(id *)(v35 + 24);
    int v37 = v36;
    if (v36)
    {
      uint64_t v38 = [v36 style];
      if (v38)
      {
        uint64_t v20 = v116;
        if (v38 == 1)
        {
          PKPassFrontFaceContentSize();
          PKSizeScaleAspectFit();
          double v39 = 4.0;
        }
        else
        {
          double v39 = 0.0;
        }
        goto LABEL_22;
      }
      uint64_t v20 = v116;
    }
  }
  else
  {
    int v37 = 0;
  }
  PKSizeScaleAspectFit();
  double v39 = 8.0;
LABEL_22:
  PKSizeAlignedInRect();
  double rect_16 = v41;
  double rect_24 = v40;
  double rect_8 = v42;
  double v122 = v43;
  if (HIDWORD(a2) == 1)
  {
    objc_msgSend(*(id *)(v20 + 480), "pkui_setCornerRadius:animated:", a2 & ((unsigned __int16)(v113 & 0x100) >> 8), v39);
    objc_msgSend(*(id *)(v116 + 480), "pkui_setFrame:animated:", a2 & ((unsigned __int16)(v113 & 0x100) >> 8), rect_24, rect_16, rect_8, v122);
  }
  if ((v113 & 0x100) != 0) {
    v144[3] = fmax(v114 + v122, v144[3]);
  }

  CGRectDivide(v139[1], v134 + 1, v139 + 1, 14.0, (CGRectEdge)v33);
  p_CGFloat x = &v139->origin.x;
  double v46 = v139[1].origin.x;
  double v45 = v139[1].origin.y;
  double v47 = v139[1].size.width;
  double v48 = v139[1].size.height;
  uint64_t v49 = v116;
  if (HIDWORD(a2) == 1)
  {
    [*(id *)(v116 + 480) bounds];
    double v117 = v50;
    double v52 = v51;
    double v54 = v53;
    double v56 = v55;
    id v57 = [*(id *)(v116 + 488) image];
    if (v57)
    {
      v58 = *(void **)(v116 + 544);
      if (v58) {
        v58 = (void *)v58[3];
      }
      v59 = v58;
      v60 = [v59 image];
      char v61 = [v60 hasBackground];

      if (v61) {
        objc_msgSend(v57, "pkui_alignmentSizeThatFills:", v54, v56);
      }
      else {
        objc_msgSend(v57, "pkui_alignmentSizeThatFits:maximumScale:", v54, v56, 1.0);
      }
      uint64_t v49 = v116;
      v62.n128_f64[0] = v150 + v52 + (v54 - v147) * 0.5;
      v63.n128_f64[0] = v149 + v117 + (v56 - v148) * 0.5;
      v64.n128_f64[0] = v147 - (v152 + v150);
      v66.n128_f64[0] = v151 + v149;
      v65.n128_f64[0] = v148 - (v151 + v149);
      PKRectRoundToPixel(v62, v63, v64, v65, v66);
      double v52 = v68;
      double v54 = v69;
      double v56 = v70;
    }
    else
    {
      double v67 = v117;
    }
    objc_msgSend(*(id *)(v49 + 488), "pkui_setFrame:animated:", a2 & ((v113 & 0x100) != 0), v52, v67, v54, v56);

    p_CGFloat x = &v139->origin.x;
    uint64_t v49 = v116;
  }
  if ((v113 & 0x100) != 0) {
    double v71 = v46;
  }
  else {
    double v71 = rect;
  }
  double v72 = v114;
  if ((v113 & 0x100) != 0) {
    double v72 = v45;
  }
  p_x[4] = v71;
  p_x[5] = v72;
  if ((v113 & 0x100) != 0) {
    double v73 = v47;
  }
  else {
    double v73 = v28;
  }
  if ((v113 & 0x100) != 0) {
    double v74 = v48;
  }
  else {
    double v74 = r1;
  }
  p_x[6] = v73;
  p_x[7] = v74;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__PKApplicationMessageContentView__layoutContentViewWithContext_bounds_occludedBounds___block_invoke;
  aBlock[3] = &unk_1E59DE588;
  *(CGFloat *)&aBlock[8] = x;
  *(CGFloat *)&aBlock[9] = y;
  *(CGFloat *)&aBlock[10] = width;
  *(CGFloat *)&aBlock[11] = height;
  aBlock[12] = v33;
  int v128 = v33;
  int v129 = 0;
  BOOL v131 = HIDWORD(a2) == 2;
  BOOL v132 = HIDWORD(a2) == 1;
  uint64_t v130 = a2;
  aBlock[4] = v49;
  void aBlock[5] = &v138;
  aBlock[6] = &v133;
  aBlock[7] = &v143;
  v110 = _Block_copy(aBlock);
  (*((void (**)(void *, void, void))v110 + 2))(v110, *(void *)(v116 + 496), HIWORD(v113) & 1);
  CGRectDivide(v139[1], v134 + 1, v139 + 1, 1.0, CGRectMinYEdge);
  (*((void (**)(void *, void, void))v110 + 2))(v110, *(void *)(v116 + 504), HIBYTE(v113) & 1);
  if (HIDWORD(a2) == 1)
  {
    long long v125 = 0u;
    long long v126 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    id v75 = *(id *)(v116 + 552);
    uint64_t v76 = [v75 countByEnumeratingWithState:&v123 objects:&v147 count:16];
    if (v76)
    {
      uint64_t v77 = *(void *)v124;
      v78 = (double *)MEMORY[0x1E4FB2848];
      do
      {
        uint64_t v79 = 0;
        do
        {
          if (*(void *)v124 != v77) {
            objc_enumerationMutation(v75);
          }
          uint64_t v80 = *(void *)(*((void *)&v123 + 1) + 8 * v79);
          if (v80)
          {
            int v81 = *(_DWORD *)(v80 + 8);
            int v82 = v78 + 1;
            double v83 = v78 + 2;
            double v84 = v78 + 3;
            double v85 = (double *)(v80 + 24);
            if (v81)
            {
              double v85 = v78;
            }
            else
            {
              double v84 = (double *)(v80 + 48);
              double v83 = (double *)(v80 + 40);
              int v82 = (double *)(v80 + 32);
            }
            double v86 = *v85;
            double v87 = *v82;
            double v88 = *v83;
            double v89 = *v84;
            uint64_t v80 = *(void *)(v80 + 16);
          }
          else
          {
            int v81 = 0;
            double v89 = 0.0;
            double v88 = 0.0;
            double v87 = 0.0;
            double v86 = 0.0;
          }
          id v90 = (id)v80;
          [v90 frame];
          double v94 = v93 - (v89 + v87);
          double v96 = v95 - (v88 + v86);
          if (v81)
          {
            double v97 = v86 + v92;
            if (v81 == 1) {
              PKSizeAlignedInRect();
            }
            else {
              double v98 = v87 + v91;
            }
          }
          else
          {
            PKSizeAlignedInRect();
            double v97 = v99;
            double v94 = v100;
            double v96 = v101;
          }
          objc_msgSend(v90, "pkui_setFrame:animated:", a2 & 1, v98 - v87, v97 - v86, v94 - (-v89 - v87), v96 - (-v88 - v86));

          ++v79;
        }
        while (v76 != v79);
        uint64_t v102 = [v75 countByEnumeratingWithState:&v123 objects:&v147 count:16];
        uint64_t v76 = v102;
      }
      while (v102);
    }
  }
  _Block_object_dispose(&v133, 8);
  _Block_object_dispose(&v138, 8);
  _Block_object_dispose(&v143, 8);
  return a5;
}

void __87__PKApplicationMessageContentView__layoutContentViewWithContext_bounds_occludedBounds___block_invoke(uint64_t a1, void *a2, unsigned int a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v46 = *(_OWORD *)(v6 + 32);
  long long v47 = *(_OWORD *)(v6 + 48);
  id v45 = v5;
  objc_msgSend(v5, "pkui_sizeThatFits:", *(double *)(v6 + 48), 1.79769313e308);
  double v44 = v7;
  CGFloat v9 = v8;
  unint64_t v10 = *(CGRect **)(*(void *)(a1 + 40) + 8);
  v49.origin.double x = v10[1].origin.x;
  v49.origin.double y = v10[1].origin.y;
  ++v10;
  v49.size.double width = v10->size.width;
  v49.size.double height = v10->size.height;
  CGRectDivide(v49, (CGRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), v10, v9, CGRectMinYEdge);
  int v11 = *(_DWORD *)(a1 + 100);
  CGFloat v12 = *(double *)(a1 + 64);
  CGFloat v13 = *(double *)(a1 + 72);
  CGFloat v14 = *(double *)(a1 + 80);
  CGFloat v15 = *(double *)(a1 + 88);
  CGRect v50 = CGRectStandardize(*(CGRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32));
  double x = v50.origin.x;
  double y = v50.origin.y;
  double width = v50.size.width;
  double height = v50.size.height;
  v52.origin.double x = v12;
  v52.origin.double y = v13;
  v52.size.double width = v14;
  v52.size.double height = v15;
  CGRect v51 = CGRectIntersection(v50, v52);
  double v20 = v51.origin.x;
  double v21 = v51.origin.y;
  double v22 = v51.size.width;
  double v23 = v51.size.height;
  if (CGRectIsNull(v51))
  {
    double v24 = v44;
  }
  else
  {
    double v24 = v44;
    switch(v11)
    {
      case 0:
        double v27 = x + width;
        double x = fmin(v20 + v22, x + width);
        double width = v27 - x;
        break;
      case 1:
        double v43 = y + height;
        double y = fmin(v21 + v23, y + height);
        double height = v43 - y;
        break;
      case 2:
        double width = fmax(v20 - x, 0.0);
        break;
      case 3:
        double height = fmax(v21 - y, 0.0);
        break;
      default:
        __break(1u);
        JUMPOUT(0x1A02B98D8);
    }
  }
  double v25 = *(double **)(*(void *)(a1 + 48) + 8);
  v25[4] = x;
  v25[5] = y;
  v25[6] = width;
  v25[7] = height;
  double v26 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 48);
  if (v26 < v24) {
    objc_msgSend(v45, "pkui_sizeThatFits:", v26, 1.79769313e308);
  }
  PKSizeAlignedInRect();
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  int v36 = *(unsigned __int8 *)(a1 + 120);
  if (*(unsigned char *)(a1 + 120))
  {
    [v45 alpha];
    int v36 = 0;
    BOOL v38 = v37 <= 0.0;
    if (*(unsigned char *)(a1 + 120))
    {
      if (v37 > 0.0)
      {
        [v45 frame];
        BOOL v38 = 0;
        int v36 = v33 != v39;
        if (v35 != v40) {
          int v36 = 1;
        }
      }
    }
  }
  else
  {
    BOOL v38 = 1;
  }
  if (*(unsigned char *)(a1 + 121)) {
    goto LABEL_36;
  }
  if (!*(unsigned char *)(a1 + 120)) {
    BOOL v38 = 1;
  }
  if (((v38 | v36) & 1) == 0)
  {
LABEL_36:
    if (*(unsigned char *)(a1 + 112)) {
      uint64_t v41 = a3;
    }
    else {
      uint64_t v41 = 0;
    }
    objc_msgSend(v45, "pkui_setFrame:animated:", v41, v29, v31, v33, v35);
    if (a3)
    {
LABEL_20:
      *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = fmax(v31 + v35, *(double *)(*(void *)(*(void *)(a1 + 56) + 8)+ 24));
      goto LABEL_26;
    }
  }
  else
  {
    if (v36) {
      *(double *)(*(void *)(a1 + 32) + 440) = fmax(-[PKApplicationMessageContentView _prepareViewForReuse:type:state:](*(void *)(a1 + 32), v45, 1, *(double *)(*(void *)(a1 + 32) + 448), *(double *)(*(void *)(a1 + 32) + 456), *(double *)(*(void *)(a1 + 32) + 464), *(double *)(*(void *)(a1 + 32) + 472))* 0.65, *(double *)(*(void *)(a1 + 32) + 440));
    }
    if (a3) {
      goto LABEL_20;
    }
  }
  uint64_t v42 = *(void *)(*(void *)(a1 + 40) + 8);
  *(_OWORD *)(v42 + 32) = v46;
  *(_OWORD *)(v42 + 48) = v47;
LABEL_26:
}

- (double)_prepareViewForReuse:(int)a3 type:(double)a4 state:(double)a5
{
  id v13 = a2;
  CGFloat v14 = v13;
  if (a1)
  {
    CGFloat v15 = [v13 superview];
    if (v15)
    {
      double v16 = [v14 snapshotViewAfterScreenUpdates:0];
      if (v16)
      {
        [v14 frame];
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;
        double v24 = v23;
        double v25 = [v14 layer];
        double v26 = [v25 presentationLayer];
        double v27 = v26;
        if (v26)
        {
          [v26 anchorPoint];
          double v29 = v28;
          double v61 = v30;
          [v27 position];
          double v31 = a5;
          double v32 = a7;
          double v34 = v33;
          double v62 = a4;
          double v35 = a6;
          double v37 = v36;
          [v27 bounds];
          double v22 = v38;
          double v24 = v39;
          double v18 = v34 - v29 * v38;
          a7 = v32;
          a5 = v31;
          double v20 = v37 - v61 * v39;
          a6 = v35;
          a4 = v62;
        }
        objc_msgSend(v16, "setFrame:", v18, v20, v22, v24);
        [v15 addSubview:v16];
        double v40 = [v16 layer];
        objc_msgSend(v40, "setAllowsGroupOpacity:", objc_msgSend(v25, "allowsGroupOpacity"));
        uint64_t v41 = [v25 compositingFilter];
        [v40 setCompositingFilter:v41];

        uint64_t v42 = [PKApplicationMessageContentView_SubviewSnapshot alloc];
        [v14 alignmentRectInsets];
        double v44 = v43;
        long long v46 = v45;
        double v48 = v47;
        CGRect v50 = v49;
        id v51 = v16;
        if (v42)
        {
          v69.receiver = v42;
          v69.super_class = (Class)PKApplicationMessageContentView_SubviewSnapshot;
          CGRect v52 = (id *)objc_msgSendSuper2(&v69, sel_init);
          double v53 = v52;
          if (v52)
          {
            objc_storeStrong(v52 + 2, v16);
            v53[3] = v44;
            v53[4] = v46;
            v53[5] = v48;
            v53[6] = v50;
            *((_DWORD *)v53 + 2) = a3;
            *((double *)v53 + 7) = a4;
            *((double *)v53 + 8) = a5;
            *((double *)v53 + 9) = a6;
            *((double *)v53 + 10) = a7;
          }
          double v54 = v53;
        }
        else
        {
          double v54 = 0;
        }

        id v55 = *(id *)(a1 + 552);
        [v55 addObject:v54];
        v65[0] = MEMORY[0x1E4F143A8];
        v65[1] = 3221225472;
        v65[2] = __67__PKApplicationMessageContentView__prepareViewForReuse_type_state___block_invoke;
        v65[3] = &unk_1E59CC188;
        id v66 = v51;
        id v67 = v55;
        double v68 = v54;
        double v56 = v54;
        id v57 = v55;
        v69.receiver = 0;
        _PKViewSetAlphaAnimated(v66, v65, (double *)&v69, 0.0, 0.0);
        double v58 = *(double *)&v69.receiver;
      }
      else
      {
        double v58 = 0.0;
      }
    }
    else
    {
      double v58 = 0.0;
    }
    v59 = (void *)MEMORY[0x1E4FB1EB0];
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __67__PKApplicationMessageContentView__prepareViewForReuse_type_state___block_invoke_2;
    v63[3] = &unk_1E59CA7D0;
    id v64 = v14;
    [v59 performWithoutAnimation:v63];
  }
  else
  {
    double v58 = 0.0;
  }

  return v58;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  int v6 = [(PKApplicationMessageContentView *)self _shouldReverseLayoutDirection];
  double v7 = *MEMORY[0x1E4F1DAD8];
  double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (v6) {
    uint64_t v9 = 256;
  }
  else {
    uint64_t v9 = 0;
  }

  double v10 = -[PKApplicationMessageContentView _layoutWithContext:bounds:]((uint64_t)self, v9, v7, v8, width, height);
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)performBatchUpdates:(uint64_t)a3 animated:
{
  id v5 = a2;
  if (a1 && v5)
  {
    double v7 = v5;
    if (a1[584]) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"PKApplicationMessageContentView recursive batch updates are not supported."];
    }
    if (a3) {
      [a1 layoutIfNeeded];
    }
    a1[584] = 1;
    v7[2]();
    a1[584] = 0;
    int v6 = a1[585];
    a1[585] = 0;
    if (v6) {
      -[PKApplicationMessageContentView _updateSubviewsAnimated:]((uint64_t)a1, a3);
    }
    else {
      PKUIViewLayoutIfNeeded(a1, a3, 0);
    }
    id v5 = v7;
  }
}

void __59__PKApplicationMessageContentView__updateSubviewsAnimated___block_invoke_2(uint64_t a1, void *a2, unsigned int a3)
{
  double v3 = (double)a3;
  if (*(unsigned char *)(a1 + 40))
  {
    double v4 = 0.0;
    if (a3) {
      double v4 = *(double *)(*(void *)(a1 + 32) + 440);
    }
    uint64_t v5 = 0;
    _PKViewSetAlphaAnimated(a2, 0, (double *)&v5, v3, v4);
  }
  else
  {
    objc_msgSend(a2, "pkui_setAlpha:animated:", 0, v3);
  }
}

uint64_t __67__PKApplicationMessageContentView__prepareViewForReuse_type_state___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  objc_super v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);

  return [v2 removeObjectIdenticalTo:v3];
}

void __67__PKApplicationMessageContentView__prepareViewForReuse_type_state___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) layer];
  [v2 removeAllAnimations];
  [*(id *)(a1 + 32) setAlpha:0.0];
  [v2 clearHasBeenCommitted];
}

- (void)setContent:(int)a3 animated:
{
  id v6 = a2;
  if (a1 && *(id *)(a1 + 592) != v6)
  {
    id v7 = v6;
    if (a3 && !*(unsigned char *)(a1 + 584)) {
      [(id)a1 layoutIfNeeded];
    }
    objc_storeStrong((id *)(a1 + 592), a2);
    -[PKApplicationMessageContentView _updateSubviewsAnimated:](a1, a3);
    id v6 = v7;
  }
}

- (void)setDismissable:(int)a3 animated:
{
  if (a1)
  {
    char v3 = a2;
    if (a1[586] != a2)
    {
      if (a3 && !a1[584]) {
        [a1 layoutIfNeeded];
      }
      a1[586] = v3;
      -[PKApplicationMessageContentView _updateSubviewsAnimated:]((uint64_t)a1, a3);
    }
  }
}

- (void)setBlurRadius:(void *)a3 animated:(double)a4 withCompletion:
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  double v8 = (void (**)(void, void))v7;
  if (a1)
  {
    if (*(double *)(a1 + 416) == a4)
    {
      if (v7) {
        (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
      }
    }
    else
    {
      if (!*(void *)(a1 + 408))
      {
        id v9 = objc_alloc(MEMORY[0x1E4F39BC0]);
        uint64_t v10 = [v9 initWithType:*MEMORY[0x1E4F3A0D0]];
        double v11 = *(void **)(a1 + 408);
        *(void *)(a1 + 408) = v10;

        [*(id *)(a1 + 408) setName:@"blur"];
        CGFloat v12 = [(id)a1 layer];
        v20[0] = *(void *)(a1 + 408);
        id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
        [v12 setFilters:v13];
      }
      CGFloat v14 = [(id)a1 layer];
      if (a2)
      {
        CGFloat v15 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"filters.blur.inputRadius"];
        objc_msgSend(v15, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", *(double *)(a1 + 416), a4);
        if (v8)
        {
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __73__PKApplicationMessageContentView_setBlurRadius_animated_withCompletion___block_invoke;
          v18[3] = &unk_1E59CA9F8;
          double v19 = v8;
          objc_msgSend(v15, "pkui_setCompletionHandler:", v18);
        }
        id v16 = (id)objc_msgSend(v14, "pkui_addAdditiveAnimation:", v15);
      }
      *(double *)(a1 + 416) = a4;
      double v17 = [NSNumber numberWithDouble:a4];
      [v14 setValue:v17 forKeyPath:@"filters.blur.inputRadius"];

      if (v8 && (a2 & 1) == 0) {
        v8[2](v8, 1);
      }
    }
  }
}

uint64_t __73__PKApplicationMessageContentView_setBlurRadius_animated_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_regularFont, 0);
  objc_storeStrong((id *)&self->_fixedSignificantFont, 0);
  objc_storeStrong((id *)&self->_significantFont, 0);
  objc_storeStrong((id *)&self->_snapshots, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_iconContainer, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_dismiss, 0);

  objc_storeStrong((id *)&self->_blurFilter, 0);
}

@end