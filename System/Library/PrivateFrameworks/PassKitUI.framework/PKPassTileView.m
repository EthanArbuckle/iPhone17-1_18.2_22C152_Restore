@interface PKPassTileView
- (BOOL)_isDynamicHeight;
- (BOOL)isCompact;
- (BOOL)isInActionState;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPassTile)content;
- (PKPassTileView)init;
- (PKPassTileView)initWithCoder:(id)a3;
- (double)_layoutWithBounds:(double)a3 applyLayout:(double)a4;
- (double)_prepareViewForReuse:(void *)a3 type:(long long *)a4 state:;
- (id)viewImageActionView;
- (uint64_t)_updateContentStateAnimated:(uint64_t)a1;
- (unint64_t)groupStyle;
- (unint64_t)overflowType;
- (void)_updateBackgroundAnimated:(unsigned char *)a1;
- (void)_updateStyleAnimated:(uint64_t)a1;
- (void)_updateSubviewsAnimated:(uint64_t)a1;
- (void)beginActionStateTimeout:(int64_t)a3;
- (void)dealloc;
- (void)layoutIfNeededAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)passView:(id)a3 didUpdatePassState:(id)a4;
- (void)performBatchUpdates:(id)a3 animated:(BOOL)a4;
- (void)prepareForReuse;
- (void)setCompact:(BOOL)a3;
- (void)setCompact:(BOOL)a3 animated:(BOOL)a4;
- (void)setContent:(id)a3;
- (void)setContent:(id)a3 animated:(BOOL)a4;
- (void)setEnabled:(BOOL)a3;
- (void)setGroupStyle:(unint64_t)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setInActionState:(BOOL)a3;
- (void)setInActionState:(BOOL)a3 animated:(BOOL)a4;
- (void)setOverflowType:(unint64_t)a3;
- (void)setPassView:(id)a3 passUniqueID:(id)a4;
- (void)setSelected:(BOOL)a3;
@end

@implementation PKPassTileView

- (PKPassTileView)initWithCoder:(id)a3
{
  return 0;
}

- (PKPassTileView)init
{
  v17.receiver = self;
  v17.super_class = (Class)PKPassTileView;
  v2 = -[PKPassTileView initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v3 = v2;
  if (v2)
  {
    [(UIView *)v2 pkui_setMaskType:3];
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    snapshots = v3->_snapshots;
    v3->_snapshots = v4;

    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    icon = v3->_icon;
    v3->_icon = v6;

    Label = (UILabel *)CreateLabel();
    title = v3->_title;
    v3->_title = Label;

    v10 = (UILabel *)CreateLabel();
    body = v3->_body;
    v3->_body = v10;

    v12 = (UILabel *)CreateLabel();
    footer = v3->_footer;
    v3->_footer = v12;

    [(UIImageView *)v3->_icon setAlpha:0.0];
    [(UILabel *)v3->_title setAlpha:0.0];
    [(UILabel *)v3->_body setAlpha:0.0];
    [(UIImageView *)v3->_bodyImage setAlpha:0.0];
    [(UILabel *)v3->_footer setAlpha:0.0];
    v14 = objc_alloc_init(PKPassthroughView);
    contentView = v3->_contentView;
    v3->_contentView = v14;

    [(PKPassthroughView *)v3->_contentView setHitTestEnabled:0];
    [(PKPassthroughView *)v3->_contentView addSubview:v3->_icon];
    [(PKPassthroughView *)v3->_contentView addSubview:v3->_title];
    [(PKPassthroughView *)v3->_contentView addSubview:v3->_body];
    [(PKPassthroughView *)v3->_contentView addSubview:v3->_footer];
    [(PKPassTileView *)v3 addSubview:v3->_contentView];
    v3->_enabled = [(PKPassTileView *)v3 isEnabled];
    v3->_selected = [(PKPassTileView *)v3 isSelected];
    v3->_highlighted = [(PKPassTileView *)v3 isHighlighted];
    -[PKPassTileView _updateSubviewsAnimated:]((uint64_t)v3, 0);
  }
  return v3;
}

- (void)_updateSubviewsAnimated:(uint64_t)a1
{
  if (!a1) {
    return;
  }
  if (*(unsigned char *)(a1 + 1057))
  {
    *(unsigned char *)(a1 + 1058) = 1;
    return;
  }
  if (a2) {
    [(id)a1 layoutIfNeededAnimated:1];
  }
  v291 = [*(id *)(a1 + 1080) metadata];
  *(unsigned char *)(a1 + 971) = [v291 isSelectable];
  v4 = [*(id *)(a1 + 912) actions];
  v290 = v4;
  if (*(void *)(a1 + 1096))
  {
    BOOL v5 = 1;
  }
  else if (v4)
  {
    BOOL v5 = [v4 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  *(unsigned char *)(a1 + 972) = v5;
  if (!*(void *)(a1 + 1048))
  {
    uint64_t v6 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB2790], 32770, 0);
    v7 = *(void **)(a1 + 1048);
    *(void *)(a1 + 1048) = v6;
  }
  BOOL isDynamic = -[PKPassTileView _isDynamicHeight](a1);
  uint64_t v9 = *(void *)(a1 + 1088);
  v10 = *(void **)(a1 + 784);
  if (isDynamic)
  {
    [v10 setNumberOfLines:3];
    v11 = (void *)*MEMORY[0x1E4FB2950];
    v12 = (void *)*MEMORY[0x1E4FB2790];
    uint64_t v13 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2950], (void *)*MEMORY[0x1E4FB2790], 32770, 0, *MEMORY[0x1E4FB09E0]);
    v14 = *(void **)(a1 + 1000);
    *(void *)(a1 + 1000) = v13;

    if (v9 == 1) {
      v15 = (void *)*MEMORY[0x1E4FB28E0];
    }
    else {
      v15 = v11;
    }
    if (v9 == 1) {
      double v16 = 16.0;
    }
    else {
      double v16 = 34.0;
    }
    uint64_t v17 = PKFontForDefaultDesign(v15, v12, 0x8000, 0);
    v18 = *(void **)(a1 + 1008);
    *(void *)(a1 + 1008) = v17;

    uint64_t v19 = objc_msgSend(*(id *)(a1 + 1000), "fontWithSize:", PKScaledValueForValueWithMaximumContentSizeCategory((void *)*MEMORY[0x1E4FB2778], v16));
    v20 = *(void **)(a1 + 1016);
    *(void *)(a1 + 1016) = v19;
  }
  else
  {
    [v10 setNumberOfLines:1];
    v21 = (void *)*MEMORY[0x1E4FB0938];
    v22 = (void *)*MEMORY[0x1E4FB2790];
    if (*(unsigned char *)(a1 + 971))
    {
      uint64_t v23 = PKFontForDesign(v21, (void *)*MEMORY[0x1E4FB2998], (void *)*MEMORY[0x1E4FB2790], 4098, 0);
      v24 = *(void **)(a1 + 1000);
      *(void *)(a1 + 1000) = v23;

      v25 = (void **)MEMORY[0x1E4FB2950];
    }
    else
    {
      uint64_t v26 = PKFontForDesign(v21, (void *)*MEMORY[0x1E4FB2988], (void *)*MEMORY[0x1E4FB2790], 32770, 0, *MEMORY[0x1E4FB09E0]);
      v27 = *(void **)(a1 + 1000);
      *(void *)(a1 + 1000) = v26;

      v25 = (void **)MEMORY[0x1E4FB28C8];
    }
    uint64_t v28 = PKFontForDefaultDesign(*v25, v22, 0x8000, 0);
    v29 = *(void **)(a1 + 1008);
    *(void *)(a1 + 1008) = v28;

    id v30 = *(id *)(a1 + 1000);
    v20 = *(void **)(a1 + 1016);
    *(void *)(a1 + 1016) = v30;
  }

  if (*(unsigned char *)(a1 + 971)) {
    int v31 = 1;
  }
  else {
    int v31 = isDynamic;
  }
  if (v31) {
    uint64_t v32 = 35;
  }
  else {
    uint64_t v32 = 36;
  }
  if (v31) {
    uint64_t v33 = 36;
  }
  else {
    uint64_t v33 = 35;
  }
  objc_storeStrong((id *)(a1 + 1024), *(id *)(a1 + OBJC_IVAR___PKPassTileView__snapshots[v32]));
  objc_storeStrong((id *)(a1 + 1032), *(id *)(a1 + OBJC_IVAR___PKPassTileView__snapshots[v33]));
  objc_storeStrong((id *)(a1 + 1040), *(id *)(a1 + 1008));
  *(_OWORD *)(a1 + 976) = *MEMORY[0x1E4F1DB30];
  [*(id *)(a1 + 1008) _bodyLeading];
  int v300 = a2;
  if (v9 == 1)
  {
    double v34 = 9.0;
    double v35 = 10.0;
  }
  else
  {
    PKFloatRoundToPixel();
    double v35 = v36 + 10.0;
    if (*(unsigned char *)(a1 + 971)) {
      PKFloatRoundToPixel();
    }
    double v34 = v36 + 10.0;
  }
  int v37 = *(unsigned __int8 *)(a1 + 971);
  double v38 = 0.0;
  double v39 = 18.0;
  if (isDynamic) {
    double v38 = 2.0;
  }
  else {
    double v39 = 0.0;
  }
  if (v9 == 1) {
    double v40 = 4.0;
  }
  else {
    double v40 = v39;
  }
  if (*(unsigned char *)(a1 + 971)) {
    double v41 = 16.0;
  }
  else {
    double v41 = 13.0;
  }
  long long v42 = *(_OWORD *)(a1 + 864);
  objc_super v316 = *(objc_super *)(a1 + 848);
  long long v317 = v42;
  long long v43 = *(_OWORD *)(a1 + 896);
  long long v318 = *(_OWORD *)(a1 + 880);
  long long v319 = v43;
  if (v37) {
    double v44 = -2.0;
  }
  else {
    double v44 = v38;
  }
  v45 = [*(id *)(a1 + 832) image];
  v46 = [*(id *)(a1 + 840) image];
  BOOL v47 = *(void *)(a1 + 944) != 0;
  *(double *)(a1 + 848) = v35;
  *(double *)(a1 + 856) = v41;
  *(double *)(a1 + 864) = v34;
  *(double *)(a1 + 872) = v41;
  *(double *)(a1 + 880) = v40;
  *(double *)(a1 + 888) = v41;
  *(double *)(a1 + 896) = v44;
  *(unsigned char *)(a1 + 904) = v37;
  *(unsigned char *)(a1 + 905) = 0;
  *(unsigned char *)(a1 + 906) = v45 != 0;
  *(unsigned char *)(a1 + 907) = v46 != 0;
  *(unsigned char *)(a1 + 908) = v47;

  id v294 = *(id *)(a1 + 920);
  v48 = [PKPassTileView_State alloc];
  v49 = *(void **)(a1 + 1080);
  v50 = *(void **)(a1 + 912);
  v51 = [*(id *)(a1 + 928) passState];
  v52 = *(void **)(a1 + 1024);
  v53 = *(void **)(a1 + 1032);
  v54 = *(void **)(a1 + 1040);
  v55 = *(void **)(a1 + 1016);
  int v274 = *(unsigned __int8 *)(a1 + 1073);
  uint64_t v280 = *(void *)(a1 + 1096);
  id v56 = v49;
  id v57 = v50;
  id v298 = v51;
  id v58 = v52;
  id v59 = v53;
  id v60 = v54;
  id v61 = v55;
  if (v48)
  {
    v308.receiver = v48;
    v308.super_class = (Class)PKPassTileView_State;
    v62 = (id *)objc_msgSendSuper2(&v308, sel_init);
    v63 = v62;
    if (v62)
    {
      v296 = v61;
      v288 = v60;
      v292 = v59;
      objc_storeStrong(v62 + 1, v49);
      id v277 = v56;
      v64 = [v56 metadata];
      [v64 preferredStyle];

      uint64_t v65 = [v57 type];
      v66 = 0;
      double v67 = NAN;
      id v278 = v57;
      id v279 = v58;
      v68 = 0;
      v69 = 0;
      v70 = 0;
      v281 = 0;
      id obj = 0;
      v71 = 0;
      v72 = 0;
      switch(v65)
      {
        case 0:
          v73 = [v57 stateTypeDefault];
          v66 = [v57 icon];
          uint64_t v74 = [v73 title];
          id v283 = [v73 body];
          v281 = [v73 accessory];
          id obj = [v73 secondaryAccessory];
          double v67 = NAN;
          goto LABEL_82;
        case 1:
          id v75 = v58;
          v76 = [v57 stateTypeDefaultV2];
          v66 = [v57 icon];
          uint64_t v77 = [v76 accessory];
          id obj = [v76 secondaryAccessory];
          v78 = [v76 title];
          id v284 = [v78 displayableStringWithPassState:v298 inContext:0];

          v79 = [v76 body];
          v69 = [v79 displayableStringWithPassState:v298 inContext:1];

          v70 = [v76 bodyImage];
          v80 = [v76 footer];
          uint64_t v81 = [v80 displayableStringWithPassState:v298 inContext:2];

          uint64_t v82 = [v76 preferredStyle];
          v71 = 0;
          v281 = (void *)v77;
          if (v81)
          {
            v72 = (__CFString *)v81;
            double v67 = NAN;
            id v58 = v75;
          }
          else
          {
            id v58 = v75;
LABEL_72:
            v72 = &stru_1EF1B5B50;
            if ((v82 & 0xFFFFFFFFFFFFFFFELL) != 2) {
              v72 = 0;
            }
            double v67 = NAN;
          }
          v68 = v284;
          goto LABEL_83;
        case 2:
          v73 = [v57 stateTypeCheckIn];
          id obj = [v73 secondaryAccessory];
          v83 = [MEMORY[0x1E4F1C9C8] date];
          v84 = [v73 availableFrom];
          v85 = [v84 date];

          [v85 timeIntervalSinceDate:v83];
          if (!v85 || v86 <= 0.0)
          {
            uint64_t v74 = PKLocalizedPaymentString(&cfstr_PassTileChecki.isa);
            PKLocalizedPaymentString(&cfstr_PassTileChecki_0.isa);
            id v283 = (id)objc_claimAutoreleasedReturnValue();
            v110 = (void *)MEMORY[0x1E4F848E0];
            v111 = PKLocalizedPaymentString(&cfstr_PassTileChecki_1.isa);
            v281 = [v110 createWithTitle:v111 spinnerEnabled:0];
            double v67 = NAN;
            goto LABEL_81;
          }
          v275 = v83;
          v272 = v73;
          v87 = [v73 availableFrom];
          v88 = [v87 timeZone];

          id v285 = (id)[v88 secondsFromGMT];
          v89 = [MEMORY[0x1E4F1CAF0] localTimeZone];
          uint64_t v270 = [v89 secondsFromGMT];

          v90 = [MEMORY[0x1E4F1C9A8] currentCalendar];
          [v90 setTimeZone:v88];
          v91 = [v90 components:30 fromDate:v85];
          uint64_t v92 = [v90 dateFromComponents:v91];

          id v93 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
          [v93 setDay:-1];
          v282 = [v90 dateByAddingComponents:v93 toDate:v92 options:0];
          v94 = [v90 weekdaySymbols];
          unint64_t v95 = [v94 count];

          v96 = 0;
          if (v95 >= 2)
          {
            [v93 setDay:-(uint64_t)v95];
            v96 = [v90 dateByAddingComponents:v93 toDate:v92 options:0];
          }
          v273 = (void *)v92;
          uint64_t v268 = PKLocalizedHourOfDate();
          id v97 = objc_alloc_init(MEMORY[0x1E4F28C10]);
          v98 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
          [v97 setLocale:v98];

          [v97 setLocalizedDateFormatFromTemplate:@"j:mm a"];
          [v97 setTimeZone:v88];
          uint64_t v269 = [v97 stringFromDate:v85];

          v271 = v88;
          if (v285 != (id)v270) {
            goto LABEL_65;
          }
          v83 = v275;
          [v275 timeIntervalSinceDate:v92];
          if (v99 >= 0.0)
          {
            uint64_t v74 = PKLocalizedPaymentString(&cfstr_PassTileChecki_2.isa);
            v107 = (void *)v269;
            PKLocalizedPaymentString(&cfstr_PassTileChecki_3.isa, &cfstr_Lu_0.isa, v268, v269);
            id v283 = (id)objc_claimAutoreleasedReturnValue();
            double v67 = MEMORY[0x1A6220610](v85);
LABEL_79:
            v115 = v273;
            goto LABEL_80;
          }
          [v275 timeIntervalSinceDate:v282];
          if (v100 < 0.0)
          {
LABEL_65:
            v101 = v282;
            if (v96 && ([v275 timeIntervalSinceDate:v96], v101 = v96, v102 >= 0.0))
            {
              id v112 = objc_alloc_init(MEMORY[0x1E4F28C10]);
              v113 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
              [v112 setLocale:v113];

              [v112 setLocalizedDateFormatFromTemplate:@"cccc"];
              [v112 setTimeZone:v88];
              v114 = [v112 stringFromDate:v85];
              uint64_t v74 = PKLocalizedPaymentString(&cfstr_PassTileChecki_6.isa);
              v107 = (void *)v269;
              PKLocalizedPaymentString(&cfstr_PassTileChecki_7.isa, &cfstr_Lu_1.isa, v268, v114, v269);
              id v283 = (id)objc_claimAutoreleasedReturnValue();
              double v67 = MEMORY[0x1A6220610](v282);
            }
            else
            {
              id v103 = objc_alloc_init(MEMORY[0x1E4F28C10]);
              v104 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
              [v103 setLocale:v104];

              [v103 setLocalizedDateFormatFromTemplate:@"MMM d"];
              [v103 setTimeZone:v88];
              v105 = [v103 stringFromDate:v85];
              uint64_t v106 = PKLocalizedPaymentString(&cfstr_PassTileChecki_8.isa);
              v107 = (void *)v269;
              PKLocalizedPaymentString(&cfstr_PassTileChecki_9.isa, &cfstr_Lu_1.isa, v268, v105, v269);
              id v283 = (id)objc_claimAutoreleasedReturnValue();
              double v67 = MEMORY[0x1A6220610](v101);

              uint64_t v74 = v106;
            }
            v83 = v275;
            goto LABEL_79;
          }
          uint64_t v74 = PKLocalizedPaymentString(&cfstr_PassTileChecki_4.isa);
          v107 = (void *)v269;
          PKLocalizedPaymentString(&cfstr_PassTileChecki_5.isa, &cfstr_Lu_0.isa, v268, v269);
          id v283 = (id)objc_claimAutoreleasedReturnValue();
          v115 = (void *)v92;
          double v67 = MEMORY[0x1A6220610](v92);
          v83 = v275;
LABEL_80:

          v281 = 0;
          id v58 = v279;
          v111 = v271;
          v73 = v272;
LABEL_81:

          v66 = 0;
LABEL_82:

          v70 = 0;
          v71 = 0;
          v72 = 0;
          v68 = (void *)v74;
          v69 = v283;
LABEL_83:
          v116 = v72;
          objc_storeStrong(v63 + 4, v66);
          uint64_t v117 = PKPassTileImageToUIImage(v66, v296);
          id v118 = v63[5];
          v63[5] = (id)v117;

          id v286 = v68;
          AttributedString = CreateAttributedString(v68, v58);
          id v120 = v63[10];
          v63[10] = AttributedString;

          v121 = CreateAttributedString(v69, v292);
          id v122 = v63[11];
          v63[11] = v121;

          objc_storeStrong(v63 + 12, v70);
          uint64_t v123 = PKPassTileImageToUIImage(v70, v292);
          id v124 = v63[13];
          v63[13] = (id)v123;

          v276 = v116;
          v125 = CreateAttributedString(v116, v288);
          id v126 = v63[14];
          v63[14] = v125;

          objc_storeStrong(v63 + 15, v71);
          v127.i64[0] = (uint64_t)v63[5];
          v127.i64[1] = (uint64_t)v63[10];
          v128.i64[0] = (uint64_t)v63[11];
          v128.i64[1] = (uint64_t)v63[13];
          *((double *)v63 + 16) = v67;
          int16x8_t v129 = (int16x8_t)vuzp1q_s32((int32x4_t)vtstq_s64(v127, v127), (int32x4_t)vtstq_s64(v128, v128));
          *(int8x8_t *)v129.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v129), (int8x8_t)0x1000100010001);
          *((_DWORD *)v63 + 4) = vmovn_s16(v129).u32[0];
          id v130 = v63[15];
          *((unsigned char *)v63 + 20) = v63[14] != 0;
          *((unsigned char *)v63 + 25) = v130 != 0;
          if (v280 == 2)
          {
            v131 = (void *)[MEMORY[0x1E4F848E8] createDefaultDisclosureAccessoryImage];
          }
          else
          {
            v131 = v281;
          }
          id v57 = v278;
          id v58 = v279;
          id v61 = v296;
          if (v131)
          {
            uint64_t v132 = [v131 type];
            if (v132)
            {
              if (v132 == 2)
              {
                objc_storeStrong(v63 + 6, v131);
                v138 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28F0], (void *)*MEMORY[0x1E4FB2790], 2, 0);
                v139 = [v131 accessoryTypeImage];
                v140 = [v139 image];
                uint64_t v141 = PKPassTileImageToUIImage(v140, v138);
                id v142 = v63[7];
                v63[7] = (id)v141;

                id v61 = v296;
                id v58 = v279;
                *((unsigned char *)v63 + 23) = 1;

                id v57 = v278;
              }
              else if (v132 == 1)
              {
                objc_storeStrong(v63 + 6, v131);
                *((unsigned char *)v63 + 21) = 1;
              }
            }
            else if (!v274)
            {
              objc_storeStrong(v63 + 6, v131);
              *((unsigned char *)v63 + 22) = 1;
            }
          }
          else if (obj && [obj type] == 2)
          {
            objc_storeStrong(v63 + 8, obj);
            v133 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28F0], (void *)*MEMORY[0x1E4FB2790], 0, 0);
            v134 = [obj accessoryTypeImage];
            v135 = [v134 image];
            uint64_t v136 = PKPassTileImageToUIImage(v135, v133);
            id v137 = v63[9];
            v63[9] = (id)v136;

            id v61 = v296;
            id v57 = v278;
            *((unsigned char *)v63 + 24) = 1;

            id v58 = v279;
          }
          if (v71) {
            *((unsigned char *)v63 + 25) = 1;
          }

          id v56 = v277;
          id v59 = v292;
          id v60 = v288;
          break;
        case 3:
          goto LABEL_83;
        case 4:
          v108 = [v57 stateTypeHostedView];
          v109 = [v108 hostedViewProvider];
          v71 = (void *)v109[2]();

          uint64_t v82 = [v108 preferredStyle];
          v66 = 0;
          v281 = 0;
          id v284 = 0;
          v69 = 0;
          v70 = 0;
          id obj = 0;
          goto LABEL_72;
        default:
          v281 = 0;
          id obj = 0;
          v71 = 0;
          v72 = 0;
          goto LABEL_83;
      }
    }
  }
  else
  {
    v63 = 0;
  }

  v143 = *(void **)(a1 + 920);
  *(void *)(a1 + 920) = v63;

  v144 = *(NSObject **)(a1 + 960);
  if (v144)
  {
    dispatch_source_cancel(v144);
    v145 = *(void **)(a1 + 960);
    *(void *)(a1 + 960) = 0;
  }
  uint64_t v146 = *(void *)(a1 + 920);
  if (v146) {
    double v147 = *(double *)(v146 + 128);
  }
  else {
    double v147 = 0.0;
  }
  double v148 = fmax(v147 - CFAbsoluteTimeGetCurrent(), 1.0);
  v149 = MEMORY[0x1E4F14428];
  id v150 = MEMORY[0x1E4F14428];
  dispatch_source_t v151 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v149);
  v152 = *(void **)(a1 + 960);
  *(void *)(a1 + 960) = v151;

  v153 = *(NSObject **)(a1 + 960);
  dispatch_time_t v154 = dispatch_walltime(0, (uint64_t)(v148 * 1000000000.0));
  dispatch_source_set_timer(v153, v154, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  objc_initWeak(&v308.receiver, (id)a1);
  v155 = *(NSObject **)(a1 + 960);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __42__PKPassTileView__updateSubviewsAnimated___block_invoke;
  handler[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v315, &v308.receiver);
  dispatch_source_set_event_handler(v155, handler);
  dispatch_resume(*(dispatch_object_t *)(a1 + 960));
  objc_destroyWeak(&v315);
  objc_destroyWeak(&v308.receiver);
  v156 = *(void **)(a1 + 920);
  v157 = (void **)v294;
  v158 = v156;
  uint64_t v159 = self;
  if (v157 == v158)
  {
    unint64_t v160 = 2;
  }
  else if ((v157 != 0) != (v158 != 0))
  {
    unint64_t v160 = 0;
  }
  else
  {
    unint64_t v160 = +[PKPassTileView_State visuallyCompareTile:toTile:](v159, v157[1], v158[1]);
  }

  v161 = *(void **)(a1 + 920);
  if (v161) {
    v161 = (void *)v161[4];
  }
  v293 = v161;
  v162 = *(void **)(a1 + 920);
  if (v162) {
    v162 = (void *)v162[10];
  }
  v299 = v162;
  v163 = *(void **)(a1 + 920);
  if (v163) {
    v163 = (void *)v163[11];
  }
  v297 = v163;
  v164 = *(void **)(a1 + 920);
  if (v164) {
    v164 = (void *)v164[12];
  }
  obja = v164;
  v165 = *(void **)(a1 + 920);
  if (v165) {
    v165 = (void *)v165[14];
  }
  v295 = v165;
  v166 = *(void **)(a1 + 920);
  if (v166) {
    v166 = (void *)v166[6];
  }
  v167 = v166;
  v168 = *(void **)(a1 + 920);
  if (v168) {
    v168 = (void *)v168[8];
  }
  v289 = v168;
  v169 = *(void **)(a1 + 920);
  if (v169) {
    v169 = (void *)v169[15];
  }
  id v287 = v169;
  v170 = v169;
  long long v312 = *(_OWORD *)(a1 + 752);
  uint64_t v313 = *(void *)(a1 + 768);
  if (v300)
  {
    if (!v157)
    {
      double v173 = 0.0;
      if (!v160) {
        goto LABEL_187;
      }
      v188 = 0;
      goto LABEL_160;
    }
    if (*((unsigned char *)v157 + 16) && v160)
    {
      id v171 = v157[4];
      char v172 = PKEqualObjects();

      double v173 = 0.0;
      if (v172)
      {
LABEL_134:
        if (*((unsigned char *)v157 + 17) && v160)
        {
          id v175 = v157[10];
          char v176 = PKEqualObjects();

          if (v176) {
            goto LABEL_140;
          }
        }
        else if (!*((unsigned char *)v157 + 17))
        {
LABEL_140:
          if (*((unsigned char *)v157 + 18) && v160 > 1)
          {
            id v178 = v157[11];
            char v179 = PKEqualObjects();

            if (v179) {
              goto LABEL_146;
            }
          }
          else if (!*((unsigned char *)v157 + 18))
          {
LABEL_146:
            if (*((unsigned char *)v157 + 19) && v160)
            {
              id v181 = v157[12];
              char v182 = PKEqualObjects();

              if (v182) {
                goto LABEL_152;
              }
            }
            else if (!*((unsigned char *)v157 + 19))
            {
LABEL_152:
              if (*((unsigned char *)v157 + 20) && v160)
              {
                id v185 = v157[14];
                char v186 = PKEqualObjects();

                if (v186)
                {
LABEL_159:
                  v188 = v157[6];
LABEL_160:
                  id v189 = v188;
                  char v190 = PKEqualObjects();

                  if (!v157) {
                    goto LABEL_187;
                  }
LABEL_163:
                  if (*((unsigned char *)v157 + 21) && (v190 & 1) == 0)
                  {
                    objc_super v308 = v316;
                    long long v309 = v317;
                    long long v191 = v319;
                    long long v310 = v318;
                    *(unsigned char *)(a1 + 765) = 1;
                    v192 = *(void **)(a1 + 816);
                    long long v311 = v191;
                    double v173 = fmax(-[PKPassTileView _prepareViewForReuse:type:state:](a1, v192, (void *)2, (long long *)&v308), v173);
                  }
                  if (*((unsigned char *)v157 + 22)) {
                    char v193 = v190;
                  }
                  else {
                    char v193 = 1;
                  }
                  if ((v193 & 1) == 0)
                  {
                    objc_super v308 = v316;
                    long long v309 = v317;
                    long long v194 = v319;
                    long long v310 = v318;
                    *(unsigned char *)(a1 + 766) = 1;
                    v195 = *(void **)(a1 + 824);
                    long long v311 = v194;
                    double v173 = fmax(-[PKPassTileView _prepareViewForReuse:type:state:](a1, v195, (void *)3, (long long *)&v308), v173);
                  }
                  if (*((unsigned char *)v157 + 23)) {
                    char v196 = v190;
                  }
                  else {
                    char v196 = 1;
                  }
                  if ((v196 & 1) == 0)
                  {
                    objc_super v308 = v316;
                    long long v309 = v317;
                    long long v197 = v319;
                    long long v310 = v318;
                    *(unsigned char *)(a1 + 767) = 1;
                    v198 = *(void **)(a1 + 832);
                    long long v311 = v197;
                    double v173 = fmax(-[PKPassTileView _prepareViewForReuse:type:state:](a1, v198, (void *)4, (long long *)&v308), v173);
                  }
                  if (*((unsigned char *)v157 + 24)) {
                    char v199 = v190;
                  }
                  else {
                    char v199 = 1;
                  }
                  if ((v199 & 1) == 0)
                  {
                    objc_super v308 = v316;
                    long long v309 = v317;
                    long long v200 = v319;
                    long long v310 = v318;
                    *(unsigned char *)(a1 + 768) = 1;
                    v201 = *(void **)(a1 + 840);
                    long long v311 = v200;
                    double v173 = fmax(-[PKPassTileView _prepareViewForReuse:type:state:](a1, v201, (void *)4, (long long *)&v308), v173);
                  }
                  if (*((unsigned char *)v157 + 25) && v160)
                  {
                    id v202 = v157[15];
                    char v203 = PKEqualObjects();

                    if (v203) {
                      goto LABEL_187;
                    }
                  }
                  else if (!*((unsigned char *)v157 + 25))
                  {
LABEL_187:
                    *(double *)(a1 + 752) = fmax(*(double *)(a1 + 752), v173 * 0.65);
                    goto LABEL_188;
                  }
                  *(unsigned char *)(a1 + 769) = 1;
                  v204 = *(void **)(a1 + 944);
                  objc_super v308 = v316;
                  long long v309 = v317;
                  long long v310 = v318;
                  long long v311 = v319;
                  double v173 = fmax(-[PKPassTileView _prepareViewForReuse:type:state:](a1, v204, (void *)5, (long long *)&v308), v173);
                  goto LABEL_187;
                }
              }
              else if (!*((unsigned char *)v157 + 20))
              {
                goto LABEL_158;
              }
              *(unsigned char *)(a1 + 764) = 1;
              v187 = *(void **)(a1 + 808);
              objc_super v308 = v316;
              long long v309 = v317;
              long long v310 = v318;
              long long v311 = v319;
              double v173 = fmax(-[PKPassTileView _prepareViewForReuse:type:state:](a1, v187, (void *)1, (long long *)&v308), v173);
LABEL_158:
              if (!v160)
              {
                char v190 = 0;
                goto LABEL_163;
              }
              goto LABEL_159;
            }
            objc_super v308 = v316;
            long long v309 = v317;
            long long v183 = v319;
            long long v310 = v318;
            *(unsigned char *)(a1 + 760) = 1;
            v184 = *(void **)(a1 + 800);
            long long v311 = v183;
            double v173 = fmax(-[PKPassTileView _prepareViewForReuse:type:state:](a1, v184, (void *)5, (long long *)&v308), v173);
            goto LABEL_152;
          }
          *(unsigned char *)(a1 + 762) = 1;
          v180 = *(void **)(a1 + 792);
          objc_super v308 = v316;
          long long v309 = v317;
          long long v310 = v318;
          long long v311 = v319;
          double v173 = fmax(-[PKPassTileView _prepareViewForReuse:type:state:](a1, v180, (void *)1, (long long *)&v308), v173);
          goto LABEL_146;
        }
        *(unsigned char *)(a1 + 761) = 1;
        v177 = *(void **)(a1 + 784);
        objc_super v308 = v316;
        long long v309 = v317;
        long long v310 = v318;
        long long v311 = v319;
        double v173 = fmax(-[PKPassTileView _prepareViewForReuse:type:state:](a1, v177, (void *)1, (long long *)&v308), v173);
        goto LABEL_140;
      }
    }
    else if (!*((unsigned char *)v157 + 16))
    {
      double v173 = 0.0;
      goto LABEL_134;
    }
    *(unsigned char *)(a1 + 760) = 1;
    v174 = *(void **)(a1 + 776);
    objc_super v308 = v316;
    long long v309 = v317;
    long long v310 = v318;
    long long v311 = v319;
    double v173 = fmax(-[PKPassTileView _prepareViewForReuse:type:state:](a1, v174, 0, (long long *)&v308), 0.0);
    goto LABEL_134;
  }
LABEL_188:
  v205 = *(void **)(a1 + 912);
  if (v205) {
    char v206 = [v205 isEnabled];
  }
  else {
    char v206 = 1;
  }
  *(unsigned char *)(a1 + 968) = v206;
  v207 = *(void **)(a1 + 912);
  if (v207) {
    LOBYTE(v207) = [v207 isSelected];
  }
  *(unsigned char *)(a1 + 969) = (_BYTE)v207;
  [(id)a1 setEnabled:*(unsigned __int8 *)(a1 + 968)];
  [(id)a1 setSelected:*(unsigned __int8 *)(a1 + 969)];
  v208 = *(void **)(a1 + 776);
  v209 = *(void **)(a1 + 920);
  if (v209) {
    v209 = (void *)v209[5];
  }
  v210 = v209;
  [v208 setImage:v210];

  v211 = *(void **)(a1 + 784);
  if (v211) {
    [v211 setAttributedText:v299];
  }
  v212 = *(void **)(a1 + 792);
  if (v212) {
    [v212 setAttributedText:v297];
  }
  v213 = *(void **)(a1 + 808);
  if (v213) {
    [v213 setAttributedText:v295];
  }
  if (obja && (uint64_t v214 = *(void *)(a1 + 920)) != 0 && *(unsigned char *)(v214 + 19))
  {
    v215 = *(void **)(a1 + 800);
    if (v215) {
      goto LABEL_206;
    }
    id v216 = objc_alloc_init(MEMORY[0x1E4FB1838]);
    v217 = *(void **)(a1 + 800);
    *(void *)(a1 + 800) = v216;

    *(unsigned char *)(a1 + 763) = 1;
    [*(id *)(a1 + 800) setAlpha:0.0];
    [*(id *)(a1 + 744) addSubview:*(void *)(a1 + 800)];
    v215 = *(void **)(a1 + 800);
    uint64_t v214 = *(void *)(a1 + 920);
    if (v214) {
LABEL_206:
    }
      uint64_t v214 = *(void *)(v214 + 104);
    id v218 = (id)v214;
    [v215 setImage:v218];
  }
  else
  {
    v219 = *(void **)(a1 + 800);
    if (v219) {
      [v219 setImage:0];
    }
  }
  if (v167 && (uint64_t v220 = *(void *)(a1 + 920)) != 0 && *(unsigned char *)(v220 + 21))
  {
    if (!*(void *)(a1 + 816))
    {
      uint64_t v221 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
      v222 = *(void **)(a1 + 816);
      *(void *)(a1 + 816) = v221;

      *(unsigned char *)(a1 + 765) = 1;
      [*(id *)(a1 + 816) setAlpha:0.0];
      [*(id *)(a1 + 744) addSubview:*(void *)(a1 + 816)];
    }
    v223 = [v167 accessoryTypeSpinner];
    int v224 = [v223 isSpinnerEnabled];

    if (v224 != [*(id *)(a1 + 816) isAnimating])
    {
      v225 = *(void **)(a1 + 816);
      if (v224) {
        [v225 startAnimating];
      }
      else {
        [v225 stopAnimating];
      }
    }
  }
  else
  {
    v226 = *(void **)(a1 + 816);
    if (v226) {
      [v226 stopAnimating];
    }
    if (!v167)
    {
LABEL_228:
      v240 = *(void **)(a1 + 824);
      if (v240)
      {
        [v240 setTitle:0 forState:0];
        [*(id *)(a1 + 824) setShowSpinner:0];
      }
      v239 = v289;
      if (!v167) {
        goto LABEL_237;
      }
      goto LABEL_231;
    }
  }
  uint64_t v227 = *(void *)(a1 + 920);
  if (!v227 || !*(unsigned char *)(v227 + 22)) {
    goto LABEL_228;
  }
  v228 = *(void **)(a1 + 824);
  if (!v228)
  {
    uint64_t v305 = 0;
    int64x2_t v306 = vdupq_n_s64(2uLL);
    int64x2_t v307 = v306;
    v229 = [[PKContinuousButton alloc] initWithConfiguration:&v305];
    v230 = *(void **)(a1 + 824);
    *(void *)(a1 + 824) = v229;

    objc_msgSend(*(id *)(a1 + 824), "setContentEdgeInsets:", 12.0, 16.0, 12.0, 16.0);
    v231 = *(void **)(a1 + 824);
    v232 = [MEMORY[0x1E4FB1618] labelColor];
    [v231 setTintColor:v232];

    v233 = *(void **)(a1 + 824);
    v234 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
    [v233 updateTitleColorWithColor:v234];

    *(unsigned char *)(a1 + 766) = 1;
    [*(id *)(a1 + 824) setAlpha:0.0];
    [*(id *)(a1 + 744) addSubview:*(void *)(a1 + 824)];
    v228 = *(void **)(a1 + 824);
  }
  v235 = [v228 titleLabel];
  [v235 setFont:*(void *)(a1 + 1048)];
  v236 = [v167 accessoryTypeButton];
  v237 = *(void **)(a1 + 824);
  v238 = [v236 title];
  [v237 setTitle:v238 forState:0];

  objc_msgSend(*(id *)(a1 + 824), "setShowSpinner:", objc_msgSend(v236, "isSpinnerEnabled"));
  v239 = v289;
LABEL_231:
  uint64_t v241 = *(void *)(a1 + 920);
  if (v241 && *(unsigned char *)(v241 + 23))
  {
    v242 = *(void **)(a1 + 832);
    if (v242) {
      goto LABEL_235;
    }
    id v243 = objc_alloc_init(MEMORY[0x1E4FB1838]);
    v244 = *(void **)(a1 + 832);
    *(void *)(a1 + 832) = v243;

    *(unsigned char *)(a1 + 767) = 1;
    [*(id *)(a1 + 832) setAlpha:0.0];
    [*(id *)(a1 + 744) addSubview:*(void *)(a1 + 832)];
    v242 = *(void **)(a1 + 832);
    uint64_t v241 = *(void *)(a1 + 920);
    if (v241) {
LABEL_235:
    }
      uint64_t v241 = *(void *)(v241 + 56);
    id v245 = (id)v241;
    [v242 setImage:v245];

    goto LABEL_239;
  }
LABEL_237:
  v246 = *(void **)(a1 + 832);
  if (v246) {
    [v246 setImage:0];
  }
LABEL_239:
  if (v239 && (uint64_t v247 = *(void *)(a1 + 920)) != 0 && *(unsigned char *)(v247 + 24))
  {
    v248 = *(void **)(a1 + 840);
    if (v248) {
      goto LABEL_244;
    }
    id v249 = objc_alloc_init(MEMORY[0x1E4FB1838]);
    v250 = *(void **)(a1 + 840);
    *(void *)(a1 + 840) = v249;

    *(unsigned char *)(a1 + 768) = 1;
    [*(id *)(a1 + 840) setAlpha:0.0];
    [*(id *)(a1 + 744) addSubview:*(void *)(a1 + 840)];
    v248 = *(void **)(a1 + 840);
    uint64_t v247 = *(void *)(a1 + 920);
    if (v247) {
LABEL_244:
    }
      uint64_t v247 = *(void *)(v247 + 72);
    id v251 = (id)v247;
    [v248 setImage:v251];
  }
  else
  {
    v252 = *(void **)(a1 + 840);
    if (v252) {
      [v252 setImage:0];
    }
  }
  if (!v170 || (uint64_t v253 = *(void *)(a1 + 920)) == 0 || !*(unsigned char *)(v253 + 25))
  {
    [*(id *)(a1 + 944) removeFromSuperview];
    v257 = *(void **)(a1 + 944);
    *(void *)(a1 + 944) = 0;

    v256 = *(void **)(a1 + 744);
    uint64_t v255 = 0;
    goto LABEL_254;
  }
  if (([*(id *)(a1 + 944) isEqual:v170] & 1) == 0)
  {
    [*(id *)(a1 + 944) removeFromSuperview];
    *(unsigned char *)(a1 + 769) = 1;
    [*(id *)(a1 + 944) setAlpha:0.0];
    objc_storeStrong((id *)(a1 + 944), v287);
    [*(id *)(a1 + 744) addSubview:*(void *)(a1 + 944)];
    v254 = *(void **)(a1 + 744);
    uint64_t v255 = [*(id *)(a1 + 944) isUserInteractionEnabled];
    v256 = v254;
LABEL_254:
    [v256 setHitTestEnabled:v255];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__PKPassTileView__updateSubviewsAnimated___block_invoke_3;
  aBlock[3] = &unk_1E59CC138;
  char v304 = v300;
  aBlock[4] = a1;
  v258 = _Block_copy(aBlock);
  v259 = (void (**)(void, void, void, void))v258;
  uint64_t v260 = *(void *)(a1 + 920);
  if (v260) {
    BOOL v261 = *(unsigned __int8 *)(v260 + 17) != 0;
  }
  else {
    BOOL v261 = 0;
  }
  (*((void (**)(void *, void, BOOL, void))v258 + 2))(v258, *(void *)(a1 + 784), v261, *(unsigned __int8 *)(a1 + 761));
  uint64_t v262 = *(void *)(a1 + 920);
  if (v262) {
    BOOL v263 = *(unsigned __int8 *)(v262 + 18) != 0;
  }
  else {
    BOOL v263 = 0;
  }
  v259[2](v259, *(void *)(a1 + 792), v263, *(unsigned __int8 *)(a1 + 762));
  uint64_t v264 = *(void *)(a1 + 920);
  if (v264) {
    BOOL v265 = *(unsigned __int8 *)(v264 + 20) != 0;
  }
  else {
    BOOL v265 = 0;
  }
  v259[2](v259, *(void *)(a1 + 808), v265, *(unsigned __int8 *)(a1 + 764));
  uint64_t v266 = *(void *)(a1 + 920);
  if (v266) {
    BOOL v267 = *(unsigned __int8 *)(v266 + 25) != 0;
  }
  else {
    BOOL v267 = 0;
  }
  v259[2](v259, *(void *)(a1 + 944), v267, *(unsigned __int8 *)(a1 + 769));
  -[PKPassTileView _updateStyleAnimated:](a1, v300);
  -[PKPassTileView _updateBackgroundAnimated:]((unsigned char *)a1, v300);
  [(id)a1 setNeedsLayout];
  [(id)a1 layoutIfNeeded];
  *(_OWORD *)(a1 + 752) = v312;
  *(void *)(a1 + 768) = v313;
}

- (void)dealloc
{
  [(PKPassView *)self->_passView removePassViewObserver:self];
  effectiveContentTimeout = self->_effectiveContentTimeout;
  if (effectiveContentTimeout) {
    dispatch_source_cancel(effectiveContentTimeout);
  }
  actionStateTimeout = self->_actionStateTimeout;
  if (actionStateTimeout) {
    dispatch_source_cancel(actionStateTimeout);
  }
  v5.receiver = self;
  v5.super_class = (Class)PKPassTileView;
  [(PKPassTileView *)&v5 dealloc];
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)PKPassTileView;
  [(PKPassTileView *)&v7 layoutSubviews];
  [(PKPassTileView *)self bounds];
  -[PKPassTileView _layoutWithBounds:applyLayout:]((uint64_t)self, 1, v3, v4, v5, v6);
}

- (double)_layoutWithBounds:(double)a3 applyLayout:(double)a4
{
  uint64_t v275 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0.0;
  }
  int v10 = [(id)a1 _shouldReverseLayoutDirection];
  int v11 = [*(id *)(a1 + 912) isFullBleed];
  BOOL isDynamic = -[PKPassTileView _isDynamicHeight](a1);
  uint64_t v13 = *(void *)(a1 + 1088);
  if (v10) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 0x200000000;
  }
  [*(id *)(a1 + 776) alpha];
  double v16 = v15;
  double v17 = *(double *)(a1 + 848);
  double v18 = *(double *)(a1 + 856);
  double v19 = v18 + *(double *)(a1 + 872);
  double r1_8 = a5;
  double v20 = a6 - (v17 + *(double *)(a1 + 864));
  double v21 = *MEMORY[0x1E4F1DAD8];
  double v22 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  uint64_t v262 = 0;
  BOOL v263 = (CGRect *)&v262;
  uint64_t v264 = 0x4010000000;
  BOOL v265 = "";
  uint64_t v256 = 0;
  v257 = (CGRect *)&v256;
  uint64_t v258 = 0x4010000000;
  v259 = "";
  long long v260 = 0u;
  long long v261 = 0u;
  double v240 = v22;
  double v241 = v21;
  double v266 = v21;
  double v267 = v22;
  double v242 = v20;
  double v243 = a5 - v19;
  double v268 = a5 - v19;
  double v269 = v20;
  if (v13 == 1) {
    double v23 = 24.0;
  }
  else {
    double v23 = 28.0;
  }
  if (v13 != 1 && isDynamic) {
    double v23 = PKScaledValueForValueWithMaximumContentSizeCategory((void *)*MEMORY[0x1E4FB2778], 34.0);
  }
  double r1 = v16;
  double v244 = v17;
  double r1_24 = v18;
  if (v16 <= 0.0)
  {
    v27 = (CGSize *)v257;
    CGPoint v28 = (CGPoint)*MEMORY[0x1E4F1DB28];
    CGSize v29 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v257[1].origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v27[3] = v29;
    slice.origin = v28;
    slice.CGSize size = v29;
    double height = v242;
    double width = v243;
    double x = v241;
    double y = v240;
  }
  else
  {
    if (isDynamic) {
      CGRectEdge v24 = CGRectMinYEdge;
    }
    else {
      CGRectEdge v24 = v14;
    }
    CGRectDivide(v263[1], v257 + 1, v263 + 1, v23, v24);
    v25 = v257;
    CGSize size = v257[1].size;
    slice.origin = v257[1].origin;
    slice.CGSize size = size;
    if (isDynamic)
    {
      if (v13 != 1)
      {
        CGRectDivide(v257[1], &slice, v257 + 1, v23, (CGRectEdge)v14);
        v25 = v257;
      }
      CGRectDivide(v263[1], v25 + 1, v263 + 1, *(CGFloat *)(a1 + 880), CGRectMinYEdge);
    }
    else
    {
      CGRectDivide(v263[1], v257 + 1, v263 + 1, *(CGFloat *)(a1 + 888), (CGRectEdge)v14);
    }
    double width = v263[1].size.width;
    double x = v263[1].origin.x;
    double y = v263[1].origin.y;
    double height = v263[1].size.height;
  }
  BOOL v32 = *(double *)(a1 + 976) == width && *(double *)(a1 + 984) == height;
  uint64_t v248 = a1;
  if (v32)
  {
    [*(id *)(a1 + 784) frame];
    double v228 = v35;
    double v238 = v36;
    [*(id *)(a1 + 792) frame];
    double v217 = v37;
    unint64_t v220 = v38;
    [*(id *)(a1 + 800) frame];
    unint64_t v216 = v39;
    unint64_t v219 = v40;
    [*(id *)(a1 + 808) frame];
    double v227 = v41;
    double v43 = v42;
    [*(id *)(a1 + 816) frame];
    [*(id *)(a1 + 824) frame];
    [*(id *)(a1 + 832) frame];
    [*(id *)(a1 + 840) frame];
    [*(id *)(a1 + 944) frame];
    double v218 = v44;
    double v229 = v45;
  }
  else
  {
    *(double *)(a1 + 976) = width;
    *(double *)(a1 + 984) = height;
    uint64_t v33 = [*(id *)(a1 + 784) text];
    if (v33)
    {
      if (isDynamic)
      {
        objc_msgSend(*(id *)(a1 + 784), "pkui_sizeThatFits:forceWordWrap:", 1, *(double *)(a1 + 976), *(double *)(a1 + 984));
        double v238 = v34;
      }
      else
      {
        [*(id *)(a1 + 1024) _bodyLeading];
        double v238 = v46;
      }
      double v228 = width;
    }
    else
    {
      double v228 = *MEMORY[0x1E4F1DB30];
      double v238 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }

    [*(id *)(a1 + 1032) _bodyLeading];
    unint64_t v220 = v47;
    v48 = [*(id *)(a1 + 800) image];
    v49 = v48;
    if (v11) {
      double v50 = a3;
    }
    else {
      double v50 = x;
    }
    if (v11) {
      double v51 = a4;
    }
    else {
      double v51 = y;
    }
    if (v11) {
      double v52 = r1_8;
    }
    else {
      double v52 = width;
    }
    if (v11) {
      double v53 = a6;
    }
    else {
      double v53 = height;
    }
    if (v48)
    {
      uint64_t v273 = 0;
      long long v271 = 0u;
      long long v272 = 0u;
      long long v270 = 0u;
      objc_msgSend(v48, "pkui_alignmentSizeThatFits:maximumScale:", v52, v53, 1.0);
      v54.n128_f64[0] = v50 + (v52 - *(double *)&v270) * 0.5 + *((double *)&v271 + 1);
      v55.n128_f64[0] = *(double *)&v271 + v51 + (v53 - *((double *)&v270 + 1)) * 0.5;
      v56.n128_f64[0] = *(double *)&v270 - (*((double *)&v271 + 1) + *((double *)&v272 + 1));
      v57.n128_f64[0] = *(double *)&v271 + *(double *)&v272;
      v58.n128_f64[0] = *((double *)&v270 + 1) - (*(double *)&v271 + *(double *)&v272);
      PKRectRoundToPixel(v54, v55, v56, v58, v57);
      unint64_t v216 = v59;
      unint64_t v219 = v60;
    }
    else
    {
      unint64_t v216 = *(void *)(MEMORY[0x1E4F1DB28] + 16);
      unint64_t v219 = *(void *)(MEMORY[0x1E4F1DB28] + 24);
    }

    id v61 = [*(id *)(a1 + 808) text];
    if (v61)
    {
      [*(id *)(a1 + 1040) _bodyLeading];
      double v43 = v62;
      double v227 = width;
    }
    else
    {
      double v43 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      double v227 = *MEMORY[0x1E4F1DB30];
    }

    [*(id *)(a1 + 816) intrinsicContentSize];
    objc_msgSend(*(id *)(a1 + 824), "sizeThatFits:", width, height);
    v63 = [*(id *)(a1 + 832) image];
    v64 = v63;
    if (v63)
    {
      uint64_t v273 = 0;
      long long v271 = 0u;
      long long v272 = 0u;
      long long v270 = 0u;
      objc_msgSend(v63, "pkui_alignmentSizeThatFits:maximumScale:", width, height, 1.0);
      v65.n128_f64[0] = x + (width - *(double *)&v270) * 0.5 + *((double *)&v271 + 1);
      v66.n128_f64[0] = *(double *)&v271 + y + (height - *((double *)&v270 + 1)) * 0.5;
      v67.n128_f64[0] = *(double *)&v270 - (*((double *)&v271 + 1) + *((double *)&v272 + 1));
      v68.n128_f64[0] = *(double *)&v271 + *(double *)&v272;
      v69.n128_f64[0] = *((double *)&v270 + 1) - (*(double *)&v271 + *(double *)&v272);
      PKRectRoundToPixel(v65, v66, v67, v69, v68);
    }

    v70 = [*(id *)(a1 + 840) image];
    v71 = v70;
    if (v70)
    {
      uint64_t v273 = 0;
      long long v271 = 0u;
      long long v272 = 0u;
      long long v270 = 0u;
      objc_msgSend(v70, "pkui_alignmentSizeThatFits:maximumScale:", width, height, 1.0);
      v72.n128_f64[0] = x + (width - *(double *)&v270) * 0.5 + *((double *)&v271 + 1);
      v73.n128_f64[0] = *(double *)&v271 + y + (height - *((double *)&v270 + 1)) * 0.5;
      v74.n128_f64[0] = *(double *)&v270 - (*((double *)&v271 + 1) + *((double *)&v272 + 1));
      v75.n128_f64[0] = *(double *)&v271 + *(double *)&v272;
      v76.n128_f64[0] = *((double *)&v270 + 1) - (*(double *)&v271 + *(double *)&v272);
      PKRectRoundToPixel(v72, v73, v74, v76, v75);
    }

    objc_msgSend(*(id *)(a1 + 944), "sizeThatFits:", width, 1.79769313e308);
    double v218 = v77;
    double v229 = v78;
    double v217 = width;
  }
  uint64_t v79 = [*(id *)(a1 + 800) image];

  uint64_t v80 = [*(id *)(a1 + 792) text];

  if (!*(void *)(a1 + 944))
  {
    if (v79 | v80)
    {
      double v81 = v238;
      if (v238 > 0.0) {
        double v81 = *(double *)(a1 + 896);
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 808), "text", v81);

  PKFloatCeilToPixel();
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 744), "setFrame:", a3 + r1_24, a4 + v244, v243, v242);
    uint64_t v82 = [*(id *)(a1 + 776) image];
    double v83 = slice.origin.x;
    v84 = v82;
    double v215 = a6;
    if (v82)
    {
      double v85 = v43;
      double v86 = slice.origin.y;
      double v87 = slice.size.width;
      double v88 = slice.size.height;
      uint64_t v273 = 0;
      long long v271 = 0u;
      long long v272 = 0u;
      long long v270 = 0u;
      objc_msgSend(v82, "pkui_alignmentSizeThatFits:maximumScale:", slice.size.width, slice.size.height, 1.0);
      v89.n128_f64[0] = v83 + (v87 - *(double *)&v270) * 0.5 + *((double *)&v271 + 1);
      v90.n128_f64[0] = *(double *)&v271 + v86 + (v88 - *((double *)&v270 + 1)) * 0.5;
      v91.n128_f64[0] = *(double *)&v270 - (*((double *)&v271 + 1) + *((double *)&v272 + 1));
      v92.n128_f64[0] = *(double *)&v271 + *(double *)&v272;
      v93.n128_f64[0] = *((double *)&v270 + 1) - (*(double *)&v271 + *(double *)&v272);
      PKRectRoundToPixel(v89, v90, v91, v93, v92);
      PKSizeAlignedInRect();
      double v83 = v97;
      double v43 = v85;
    }
    else
    {
      double v94 = slice.origin.y;
      double v95 = slice.size.width;
      double v96 = slice.size.height;
    }
    double v214 = v43;
    BOOL v99 = r1 > 0.0 && *(unsigned char *)(v248 + 1056) != 0;
    objc_msgSend(*(id *)(v248 + 776), "pkui_setFrame:animated:", v99, v83, v94, v95, v96);
    [*(id *)(v248 + 816) sizeToFit];
    PKFloatRoundToPixel();
    double v100 = *MEMORY[0x1E4F1DB20];
    CGFloat v101 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat v102 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    double r1_24a = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    if (*(void *)(v248 + 840))
    {
      PKSizeAlignedInRect();
      double v221 = v103;
      double r2 = v104;
      double v106 = v105;
      double v108 = v107;
      [*(id *)(v248 + 840) alpha];
      double v110 = v109;
      BOOL v111 = v109 <= 0.0 || *(unsigned char *)(v248 + 1056) == 0;
      BOOL v112 = !v111;
      objc_msgSend(*(id *)(v248 + 840), "pkui_setFrame:animated:", v112, v221, v106, v108, r2);
      if (v110 > 0.0)
      {
        v276.origin.double x = v100;
        v276.origin.double y = v101;
        v276.size.double width = r1_24a;
        v276.size.double height = v102;
        v287.origin.double x = v221;
        v287.origin.double y = v106;
        v287.size.double width = v108;
        v287.size.double height = r2;
        CGRect v277 = CGRectUnion(v276, v287);
        double r1_24a = v277.size.width;
        double v100 = v277.origin.x;
        CGFloat v101 = v277.origin.y;
        CGFloat v102 = v277.size.height;
      }
    }
    if (*(void *)(v248 + 832))
    {
      PKSizeAlignedInRect();
      double v222 = v114;
      double v223 = v113;
      double v116 = v115;
      double v118 = v117;
      [*(id *)(v248 + 832) alpha];
      double v120 = v119;
      BOOL v121 = v119 <= 0.0 || *(unsigned char *)(v248 + 1056) == 0;
      BOOL v122 = !v121;
      objc_msgSend(*(id *)(v248 + 832), "pkui_setFrame:animated:", v122, v223, v116, v118, v222);
      if (v120 > 0.0)
      {
        v278.origin.double x = v100;
        v278.origin.double y = v101;
        v278.size.double width = r1_24a;
        v278.size.double height = v102;
        v288.size.double height = v222;
        v288.origin.double x = v223;
        v288.origin.double y = v116;
        v288.size.double width = v118;
        CGRect v279 = CGRectUnion(v278, v288);
        double r1_24a = v279.size.width;
        double v100 = v279.origin.x;
        CGFloat v101 = v279.origin.y;
        CGFloat v102 = v279.size.height;
      }
    }
    if (*(void *)(v248 + 816))
    {
      if (*(unsigned char *)(v248 + 904))
      {
        v280.origin.double x = x;
        v280.origin.double y = y;
        v280.size.double width = width;
        v280.size.double height = height;
        CGRectInset(v280, -4.0, -2.0);
      }
      PKSizeAlignedInRect();
      double v224 = v124;
      double v225 = v123;
      double v126 = v125;
      double v128 = v127;
      [*(id *)(v248 + 816) alpha];
      double v130 = v129;
      BOOL v132 = v129 > 0.0 && *(unsigned char *)(v248 + 1056) != 0;
      objc_msgSend(*(id *)(v248 + 816), "pkui_setFrame:animated:", v132, v225, v126, v128, v224);
      if (v130 > 0.0)
      {
        v281.origin.double x = v100;
        v281.origin.double y = v101;
        v281.size.double width = r1_24a;
        v281.size.double height = v102;
        v289.size.double height = v224;
        v289.origin.double x = v225;
        v289.origin.double y = v126;
        v289.size.double width = v128;
        CGRect v282 = CGRectUnion(v281, v289);
        double r1_24a = v282.size.width;
        double v100 = v282.origin.x;
        CGFloat v101 = v282.origin.y;
        CGFloat v102 = v282.size.height;
      }
    }
    if (*(void *)(v248 + 824))
    {
      PKSizeAlignedInRect();
      double r1a = v133;
      double v226 = v134;
      double v136 = v135;
      double v138 = v137;
      [*(id *)(v248 + 824) alpha];
      double v140 = v139;
      BOOL v141 = v139 <= 0.0 || *(unsigned char *)(v248 + 1056) == 0;
      BOOL v142 = !v141;
      objc_msgSend(*(id *)(v248 + 824), "pkui_setFrame:animated:", v142, r1a, v136, v138, v226);
      if (v140 > 0.0)
      {
        v283.origin.double x = v100;
        v283.origin.double y = v101;
        v283.size.double width = r1_24a;
        v283.size.double height = v102;
        v290.origin.double x = r1a;
        v290.origin.double y = v136;
        v290.size.double width = v138;
        v290.size.double height = v226;
        CGRect v284 = CGRectUnion(v283, v290);
        double r1_24a = v284.size.width;
        double v100 = v284.origin.x;
        CGFloat v101 = v284.origin.y;
        CGFloat v102 = v284.size.height;
      }
    }
    v285.origin.double x = v100;
    v285.origin.double y = v101;
    v285.size.double width = r1_24a;
    v285.size.double height = v102;
    BOOL IsNull = CGRectIsNull(v285);
    BOOL v144 = v13 != 1;
    double v145 = v100 + -2.0;
    p_double x = &v263->origin.x;
    v263[1].origin.double x = x;
    p_x[5] = y;
    double v147 = r1_24a + 2.0;
    if (IsNull) {
      double v147 = r1_24a;
    }
    p_x[6] = width;
    p_x[7] = height;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__PKPassTileView__layoutWithBounds_applyLayout___block_invoke;
    aBlock[3] = &unk_1E59CC110;
    aBlock[6] = &v256;
    if (IsNull | v10) {
      double v145 = v100;
    }
    BOOL v254 = !IsNull;
    *(double *)&aBlock[7] = v145;
    *(CGFloat *)&aBlock[8] = v101;
    *(double *)&aBlock[9] = v147;
    *(CGFloat *)&aBlock[10] = v102;
    aBlock[11] = v14;
    aBlock[4] = v248;
    void aBlock[5] = &v262;
    r1b = (void (**)(double, double))_Block_copy(aBlock);
    double v148 = v84;
    if (v144) {
      uint64_t v149 = v14 & 2 | 0x100000000;
    }
    else {
      uint64_t v149 = 0x100000001;
    }
    double v150 = v238;
    uint64_t v239 = v149;
    r1b[2](v228, v150);
    if (*(void *)(v248 + 944))
    {
      if (!v11)
      {
        r1b[2](v218, v229);
        uint64_t v165 = v248;
        goto LABEL_130;
      }
      [*(id *)(v248 + 800) alpha];
      double v154 = v153;
      v155 = *(void **)(v248 + 744);
      v156 = [v155 superview];
      objc_msgSend(v155, "convertRect:fromView:", v156, a3, a4, r1_8, v215);
      double v158 = v157;
      double v160 = v159;
      double v162 = v161;
      double v164 = v163;

      uint64_t v165 = v248;
      v166 = *(void **)(v248 + 944);
      if (*(unsigned char *)(v248 + 1056)) {
        BOOL v167 = v154 > 0.0;
      }
      else {
        BOOL v167 = 0;
      }
LABEL_120:
      objc_msgSend(v166, "pkui_setFrame:animated:", v167, v158, v160, v162, v164);
LABEL_130:
      ((void (*)(void (**)(double, double), void, uint64_t, double, double))r1b[2])(r1b, *(void *)(v165 + 808), v239, v227, v214);
      long long v251 = 0u;
      long long v252 = 0u;
      long long v249 = 0u;
      long long v250 = 0u;
      id v178 = *(id *)(v165 + 992);
      uint64_t v179 = [v178 countByEnumeratingWithState:&v249 objects:v274 count:16];
      if (v179)
      {
        uint64_t v180 = *(void *)v250;
        id v181 = (double *)MEMORY[0x1E4FB2848];
        CGFloat rect = width;
        do
        {
          uint64_t v182 = 0;
          do
          {
            if (*(void *)v250 != v180) {
              objc_enumerationMutation(v178);
            }
            CGFloat v183 = height;
            uint64_t v184 = *(void *)(*((void *)&v249 + 1) + 8 * v182);
            if (v184)
            {
              int v185 = *(unsigned __int8 *)(v184 + 112);
              char v186 = v181 + 1;
              v187 = v181 + 2;
              v188 = v181 + 3;
              id v189 = (double *)(v184 + 24);
              char v190 = (double *)(v184 + 32);
              long long v191 = (double *)(v184 + 40);
              v192 = (double *)(v184 + 48);
              uint64_t v194 = v184 + 8;
              uint64_t v184 = *(void *)(v184 + 8);
              uint64_t v193 = *(void *)(v194 + 8);
              if (v193)
              {
                id v189 = v181;
              }
              else
              {
                v188 = v192;
                v187 = v191;
                char v186 = v190;
              }
              double v195 = *v189;
              double v196 = *v186;
              double v197 = *v187;
              double v198 = *v188;
            }
            else
            {
              uint64_t v193 = 0;
              int v185 = 0;
              double v198 = 0.0;
              double v197 = 0.0;
              double v196 = 0.0;
              double v195 = 0.0;
            }
            id v199 = (id)v184;
            [v199 frame];
            double v202 = v195 + v201;
            double v204 = v203 - (v198 + v196);
            double v206 = v205 - (v197 + v195);
            switch(v193)
            {
              case 0:
              case 3:
              case 4:
              case 5:
                goto LABEL_145;
              case 1:
                PKSizeAlignedInRect();
                break;
              case 2:
                if (v185)
                {
                  v286.origin.double x = x;
                  v286.origin.double y = y;
                  v286.size.double width = rect;
                  v286.size.double height = v183;
                  CGRectInset(v286, -4.0, -2.0);
                }
LABEL_145:
                PKSizeAlignedInRect();
                double v202 = v208;
                double v204 = v209;
                double v206 = v210;
                break;
              default:
                double v207 = v196 + v200;
                break;
            }
            objc_msgSend(v199, "pkui_setFrame:animated:", *(unsigned __int8 *)(v248 + 1056), v207 - v196, v202 - v195, v204 - (-v198 - v196), v206 - (-v197 - v195));

            double height = v183;
            ++v182;
          }
          while (v179 != v182);
          double v148 = v84;
          uint64_t v211 = [v178 countByEnumeratingWithState:&v249 objects:v274 count:16];
          uint64_t v179 = v211;
        }
        while (v211);
      }

      goto LABEL_151;
    }
    if (v79)
    {
      uint64_t v168 = *(void *)(v248 + 800);
      if (v11)
      {
        [*(id *)(v248 + 800) alpha];
        double v170 = v169;
        id v171 = *(void **)(v248 + 744);
        char v172 = [v171 superview];
        objc_msgSend(v171, "convertRect:fromView:", v172, a3, a4, r1_8, v215);
        double v158 = v173;
        double v160 = v174;
        double v162 = v175;
        double v164 = v176;

        uint64_t v165 = v248;
        v166 = *(void **)(v248 + 800);
        if (*(unsigned char *)(v248 + 1056)) {
          BOOL v167 = v170 > 0.0;
        }
        else {
          BOOL v167 = 0;
        }
        goto LABEL_120;
      }
      uint64_t v177 = 0x100000001;
      v152.n128_u64[0] = v219;
      v151.n128_u64[0] = v216;
    }
    else
    {
      uint64_t v168 = *(void *)(v248 + 792);
      v151.n128_f64[0] = v217;
      uint64_t v177 = v239;
      v152.n128_u64[0] = v220;
    }
    ((void (*)(void (**)(double, double), uint64_t, uint64_t, __n128, __n128))r1b[2])(r1b, v168, v177, v151, v152);
    uint64_t v165 = v248;
    goto LABEL_130;
  }
LABEL_151:
  _Block_object_dispose(&v256, 8);
  _Block_object_dispose(&v262, 8);
  return r1_8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = -[PKPassTileView _layoutWithBounds:applyLayout:]((uint64_t)self, 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (BOOL)_isDynamicHeight
{
  v1 = [*(id *)(a1 + 912) stateTypeDefaultV2];
  v2 = v1;
  if (v1) {
    BOOL v3 = ([v1 preferredStyle] & 0xFFFFFFFFFFFFFFFELL) == 4;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

void __48__PKPassTileView__layoutWithBounds_applyLayout___block_invoke(uint64_t a1, void *a2, double a3, CGFloat a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  CGPoint v34 = *(CGPoint *)(v8 + 32);
  long long v35 = *(_OWORD *)(v8 + 48);
  id v33 = v7;
  [v7 alpha];
  double v10 = v9;
  int v11 = *(CGRect **)(*(void *)(a1 + 40) + 8);
  v37.origin.double x = v11[1].origin.x;
  v37.origin.double y = v11[1].origin.y;
  ++v11;
  v37.size.double width = v11->size.width;
  v37.size.double height = v11->size.height;
  CGRectDivide(v37, (CGRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), v11, a4, CGRectMinYEdge);
  if (*(unsigned char *)(a1 + 96))
  {
    double v31 = a3;
    double v32 = v10;
    int v12 = *(_DWORD *)(a1 + 92);
    CGFloat v13 = *(double *)(a1 + 56);
    CGFloat v14 = *(double *)(a1 + 64);
    CGFloat v15 = *(double *)(a1 + 72);
    CGFloat v16 = *(double *)(a1 + 80);
    CGRect v38 = CGRectStandardize(*(CGRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32));
    double x = v38.origin.x;
    double y = v38.origin.y;
    double width = v38.size.width;
    double height = v38.size.height;
    v40.origin.double x = v13;
    v40.origin.double y = v14;
    v40.size.double width = v15;
    v40.size.double height = v16;
    CGRect v39 = CGRectIntersection(v38, v40);
    double v21 = v39.origin.x;
    double v22 = v39.origin.y;
    double v23 = v39.size.width;
    double v24 = v39.size.height;
    if (!CGRectIsNull(v39))
    {
      switch(v12)
      {
        case 0:
          double v29 = x + width;
          double x = fmin(v21 + v23, x + width);
          double width = v29 - x;
          break;
        case 1:
          double v30 = y + height;
          double y = fmin(v22 + v24, y + height);
          double height = v30 - y;
          break;
        case 2:
          double width = fmax(v21 - x, 0.0);
          break;
        case 3:
          double height = fmax(v22 - y, 0.0);
          break;
        default:
          __break(1u);
          JUMPOUT(0x19FE15210);
      }
    }
    double v10 = v32;
    v25 = *(double **)(*(void *)(a1 + 48) + 8);
    v25[4] = x;
    v25[5] = y;
    v25[6] = width;
    v25[7] = height;
  }
  PKSizeAlignedInRect();
  BOOL v26 = v10 > 0.0 && *(unsigned char *)(*(void *)(a1 + 32) + 1056) != 0;
  objc_msgSend(v33, "pkui_setFrame:animated:", v26, *(void *)&v31);
  uint64_t v27 = *(void *)(*(void *)(a1 + 40) + 8);
  CGPoint v28 = (CGRect *)(v27 + 32);
  if (v10 <= 0.0)
  {
    v28->origin = v34;
    *(_OWORD *)(v27 + 48) = v35;
  }
  else
  {
    CGRectDivide(*(CGRect *)(v27 + 32), (CGRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), v28, *(CGFloat *)(*(void *)(a1 + 32) + 896), CGRectMinYEdge);
  }
}

- (void)layoutIfNeededAnimated:(BOOL)a3
{
  self->_animated = a3;
  [(PKPassTileView *)self layoutIfNeeded];
  self->_animated = 0;
}

- (void)prepareForReuse
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  actionStateTimeout = self->_actionStateTimeout;
  if (actionStateTimeout)
  {
    dispatch_source_cancel(actionStateTimeout);
    double v4 = self->_actionStateTimeout;
    self->_actionStateTimeout = 0;
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __33__PKPassTileView_prepareForReuse__block_invoke;
  v23[3] = &unk_1E59CA7D0;
  v23[4] = self;
  [(PKPassTileView *)self performBatchUpdates:v23 animated:0];
  double v5 = [(PKPassTileView *)self layer];
  [v5 removeAllAnimations];

  double v6 = [(UIImageView *)self->_icon layer];
  [v6 removeAllAnimations];

  id v7 = [(UILabel *)self->_title layer];
  [v7 removeAllAnimations];

  uint64_t v8 = [(UILabel *)self->_body layer];
  [v8 removeAllAnimations];

  double v9 = [(UIImageView *)self->_bodyImage layer];
  [v9 removeAllAnimations];

  double v10 = [(UILabel *)self->_footer layer];
  [v10 removeAllAnimations];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  int v11 = self->_snapshots;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * v15);
        if (v16) {
          double v17 = *(void **)(v16 + 8);
        }
        else {
          double v17 = 0;
        }
        objc_msgSend(v17, "removeFromSuperview", (void)v19);
        ++v15;
      }
      while (v13 != v15);
      uint64_t v18 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
      uint64_t v13 = v18;
    }
    while (v18);
  }

  [(NSMutableArray *)self->_snapshots removeAllObjects];
}

uint64_t __33__PKPassTileView_prepareForReuse__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setContent:0];
  [*(id *)(a1 + 32) setInActionState:0];
  v2 = *(void **)(a1 + 32);

  return [v2 setCompact:0];
}

- (void)beginActionStateTimeout:(int64_t)a3
{
  [(PKPassTileView *)self setInActionState:1 animated:1];
  actionStateTimeout = self->_actionStateTimeout;
  if (actionStateTimeout)
  {
    dispatch_source_cancel(actionStateTimeout);
    double v6 = self->_actionStateTimeout;
    self->_actionStateTimeout = 0;
  }
  id v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
  uint64_t v8 = self->_actionStateTimeout;
  self->_actionStateTimeout = v7;

  double v9 = self->_actionStateTimeout;
  if (a3 == 1) {
    int64_t v10 = 10000000000;
  }
  else {
    int64_t v10 = 1250000000;
  }
  dispatch_time_t v11 = dispatch_time(0, v10);
  dispatch_source_set_timer(v9, v11, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  objc_initWeak(&location, self);
  uint64_t v12 = self->_actionStateTimeout;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__PKPassTileView_beginActionStateTimeout___block_invoke;
  v13[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v14, &location);
  dispatch_source_set_event_handler(v12, v13);
  dispatch_resume((dispatch_object_t)self->_actionStateTimeout);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __42__PKPassTileView_beginActionStateTimeout___block_invoke(uint64_t a1)
{
  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v3 = WeakRetained;
    dispatch_source_cancel(WeakRetained[133]);
    dispatch_source_t v2 = v3[133];
    v3[133] = 0;

    [(dispatch_source_t *)v3 setInActionState:[v3[135] isInProgress] animated:1];
    WeakRetained = v3;
  }
}

- (void)performBatchUpdates:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    int64_t v10 = (void (**)(void, void *))v6;
    if (self->_deferringUpdate) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"PKPassTileView recursive batch updates are not supported."];
    }
    if (v4) {
      [(PKPassTileView *)self layoutIfNeeded];
    }
    self->_deferringUpdate = 1;
    v10[2](v10, v7);
    self->_deferringUpdate = 0;
    BOOL deferredSubviewUpdate = self->_deferredSubviewUpdate;
    self->_BOOL deferredSubviewUpdate = 0;
    char v9 = -[PKPassTileView _updateContentStateAnimated:]((uint64_t)self, v4);
    id v7 = v10;
    if ((v9 & 1) == 0)
    {
      if (deferredSubviewUpdate) {
        -[PKPassTileView _updateSubviewsAnimated:]((uint64_t)self, v4);
      }
      else {
        [(PKPassTileView *)self layoutIfNeededAnimated:v4];
      }
      id v7 = v10;
    }
  }
}

- (uint64_t)_updateContentStateAnimated:(uint64_t)a1
{
  if (a1 && !*(unsigned char *)(a1 + 1057))
  {
    int v5 = *(unsigned __int8 *)(a1 + 1072);
    id v6 = [*(id *)(a1 + 1080) state];
    id v7 = v6;
    if (*(unsigned char *)(a1 + 1072))
    {
      uint64_t v8 = [v6 actionState];
      char v9 = v8;
      if (v8)
      {
        id v10 = v8;

        id v7 = v10;
      }
    }
    [(id)a1 setUserInteractionEnabled:v5 == 0];
    dispatch_time_t v11 = *(void **)(a1 + 928);
    uint64_t v12 = *(void *)(a1 + 936);
    id v13 = *(id *)(a1 + 912);
    id v14 = v7;
    id v15 = v11;
    uint64_t v16 = v15;
    if (v13 == v14)
    {
      double v17 = [v15 passState];
      if ([v17 hash] == v12)
      {

LABEL_11:
        uint64_t v3 = 0;
LABEL_18:

        return v3;
      }
      double v30 = [v14 stateTypeDefaultV2];
      uint64_t v18 = [v30 title];
      long long v19 = [v18 valueTypeForeignReference];
      uint64_t v20 = [v19 foreignReferenceType];

      if (!v20)
      {
        double v29 = v18;
        long long v21 = [v30 body];
        long long v22 = [v21 valueTypeForeignReference];
        uint64_t v23 = [v22 foreignReferenceType];

        if (!v23)
        {
          BOOL v26 = [v30 footer];
          uint64_t v27 = [v26 valueTypeForeignReference];
          uint64_t v28 = [v27 foreignReferenceType];

          if (!v28) {
            goto LABEL_11;
          }
LABEL_17:
          double v24 = [*(id *)(a1 + 928) passState];
          *(void *)(a1 + 936) = [v24 hash];

          objc_storeStrong((id *)(a1 + 912), v7);
          -[PKPassTileView _updateSubviewsAnimated:](a1, a2);
          uint64_t v3 = 1;
          goto LABEL_18;
        }

        uint64_t v18 = v29;
      }

      id v13 = v14;
    }

    goto LABEL_17;
  }
  return 0;
}

void __42__PKPassTileView__updateSubviewsAnimated___block_invoke(uint64_t a1)
{
  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    dispatch_source_cancel(WeakRetained[120]);
    dispatch_source_t v2 = v3[120];
    v3[120] = 0;

    -[PKPassTileView _updateSubviewsAnimated:](v3, 1);
    WeakRetained = v3;
  }
}

- (double)_prepareViewForReuse:(void *)a3 type:(long long *)a4 state:
{
  id v7 = a2;
  uint64_t v8 = [v7 superview];
  if (v8)
  {
    char v9 = [v7 snapshotViewAfterScreenUpdates:0];
    if (v9)
    {
      [v7 frame];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      uint64_t v18 = [v7 layer];
      long long v19 = [v18 presentationLayer];
      uint64_t v20 = v19;
      if (v19)
      {
        [v19 anchorPoint];
        double v22 = v21;
        double v24 = v23;
        [v20 position];
        double v26 = v25;
        double v28 = v27;
        [v20 bounds];
        double v15 = v29;
        double v17 = v30;
        double v11 = v26 - v22 * v29;
        double v13 = v28 - v24 * v30;
      }
      objc_msgSend(v9, "setFrame:", v11, v13, v15, v17);
      [v8 addSubview:v9];
      double v31 = [v9 layer];
      objc_msgSend(v31, "setAllowsGroupOpacity:", objc_msgSend(v18, "allowsGroupOpacity"));
      double v32 = [v18 compositingFilter];
      [v31 setCompositingFilter:v32];

      id v33 = [PKPassTileView_SubviewSnapshot alloc];
      [v7 alignmentRectInsets];
      long long v35 = v34;
      CGRect v37 = v36;
      CGRect v39 = v38;
      double v41 = v40;
      long long v42 = a4[1];
      long long v63 = *a4;
      long long v64 = v42;
      long long v43 = a4[3];
      long long v65 = a4[2];
      long long v66 = v43;
      id v44 = v9;
      if (v33)
      {
        v67.receiver = v33;
        v67.super_class = (Class)PKPassTileView_SubviewSnapshot;
        double v45 = (id *)objc_msgSendSuper2(&v67, sel_init);
        double v46 = v45;
        if (v45)
        {
          objc_storeStrong(v45 + 1, v9);
          v46[3] = v35;
          v46[4] = v37;
          v46[5] = v39;
          v46[6] = v41;
          v46[2] = a3;
          long long v47 = v64;
          *(_OWORD *)(v46 + 7) = v63;
          *(_OWORD *)(v46 + 9) = v47;
          long long v48 = v66;
          *(_OWORD *)(v46 + 11) = v65;
          *(_OWORD *)(v46 + 13) = v48;
        }
        v49 = v46;
      }
      else
      {
        v49 = 0;
      }

      id v50 = *(id *)(a1 + 992);
      [v50 addObject:v49];
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __50__PKPassTileView__prepareViewForReuse_type_state___block_invoke;
      v59[3] = &unk_1E59CC188;
      id v60 = v44;
      id v61 = v50;
      double v62 = v49;
      double v51 = v49;
      id v52 = v50;
      *(void *)&long long v63 = 0;
      _PKViewSetAlphaAnimated(v60, v59, (double *)&v63, 0.0, 0.0);
      double v53 = *(double *)&v63;
    }
    else
    {
      double v53 = 0.0;
    }
  }
  else
  {
    double v53 = 0.0;
  }
  __n128 v54 = (void *)MEMORY[0x1E4FB1EB0];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __50__PKPassTileView__prepareViewForReuse_type_state___block_invoke_2;
  v57[3] = &unk_1E59CA7D0;
  id v55 = v7;
  id v58 = v55;
  [v54 performWithoutAnimation:v57];

  return v53;
}

void __42__PKPassTileView__updateSubviewsAnimated___block_invoke_3(uint64_t a1, void *a2, unsigned int a3, int a4)
{
  double v4 = (double)a3;
  if (*(unsigned char *)(a1 + 40))
  {
    double v5 = 0.0;
    if (a3)
    {
      if (a4) {
        double v5 = *(double *)(*(void *)(a1 + 32) + 752);
      }
    }
    uint64_t v6 = 0;
    _PKViewSetAlphaAnimated(a2, 0, (double *)&v6, v4, v5);
  }
  else
  {
    objc_msgSend(a2, "pkui_setAlpha:animated:", 0, v4);
  }
}

- (void)_updateStyleAnimated:(uint64_t)a1
{
  if (a1 && !*(unsigned char *)(a1 + 1057))
  {
    if (*(unsigned char *)(a1 + 968))
    {
      if (*(unsigned char *)(a1 + 969) || !*(unsigned char *)(a1 + 971))
      {
        uint64_t v4 = 0;
        uint64_t v5 = *(unsigned __int8 *)(a1 + 971);
        double v6 = 1.0;
      }
      else
      {
        uint64_t v5 = 0;
        uint64_t v4 = 1;
        double v6 = 0.6;
      }
    }
    else
    {
      uint64_t v5 = 0;
      uint64_t v4 = 2;
      double v6 = 0.3;
    }
    if ([(id)a1 overrideUserInterfaceStyle] != v5) {
      [(id)a1 setOverrideUserInterfaceStyle:v5];
    }
    char v7 = *(unsigned char *)(a1 + 970);
    if (v7) {
      char v7 = *(unsigned char *)(a1 + 972) != 0;
    }
    uint64_t v8 = *(void *)(a1 + 1088);
    if (v8 == 1) {
      char v9 = v7;
    }
    else {
      char v9 = 0;
    }
    double v10 = [MEMORY[0x1E4FB1618] labelColor];
    double v11 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    if (v4 == 2)
    {
      uint64_t v12 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];

      uint64_t v13 = [MEMORY[0x1E4FB1618] quaternaryLabelColor];
    }
    else
    {
      if (v4 != 1)
      {
        if (v8 == 1)
        {
          if (v9) {
            [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
          }
          else {
          uint64_t v15 = [MEMORY[0x1E4FB1618] linkColor];
          }

          double v10 = (void *)v15;
        }
        uint64_t v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
LABEL_27:

        double v83 = (void *)v14;
        double v16 = *(void **)(a1 + 920);
        if (v16) {
          double v16 = (void *)v16[4];
        }
        double v17 = v16;
        uint64_t v18 = v17;
        id v19 = 0;
        v108[0] = 0;
        int v20 = 1;
        if (v17 && v8 != 1)
        {
          PKPassTileViewTileImageTintColor(v17, v108);
          id v19 = (id)objc_claimAutoreleasedReturnValue();
          int v20 = v108[0];
        }
        double v21 = v6;
        if (!v19 && v20)
        {
          id v19 = v10;
          double v21 = 1.0;
        }
        uint64_t v22 = *(void *)(a1 + 920);
        if (v22)
        {
          id v23 = *(id *)(v22 + 96);
          v108[0] = 0;
          if (v23)
          {
            __n128 v76 = v23;
            PKPassTileViewTileImageTintColor(v23, v108);
            id v23 = (id)objc_claimAutoreleasedReturnValue();
            int v24 = v108[0];
LABEL_40:
            double v25 = v6;
            if (!v23 && v24)
            {
              id v23 = v10;
              double v25 = 1.0;
            }
            double v26 = *(void **)(a1 + 920);
            double v87 = v23;
            if (v26) {
              double v26 = (void *)v26[8];
            }
            double v27 = v26;
            double v28 = [v27 accessoryTypeImage];
            double v29 = [v28 image];

            v108[0] = 0;
            uint64_t v80 = v29;
            if (v29)
            {
              PKPassTileViewTileImageTintColor(v29, v108);
              id v30 = (id)objc_claimAutoreleasedReturnValue();
              int v31 = v108[0];
            }
            else
            {
              id v30 = 0;
              int v31 = 1;
            }
            double v32 = v6;
            if (!v30 && v31)
            {
              id v30 = v10;
              double v32 = 1.0;
            }
            id v33 = *(void **)(a1 + 920);
            double v85 = v30;
            if (v33) {
              id v33 = (void *)v33[6];
            }
            CGPoint v34 = v33;
            long long v35 = [v34 accessoryTypeImage];
            double v36 = [v35 image];

            v108[0] = 0;
            if (v36)
            {
              PKPassTileViewTileImageTintColor(v36, v108);
              id v37 = (id)objc_claimAutoreleasedReturnValue();
              int v38 = v108[0];
            }
            else
            {
              id v37 = 0;
              int v38 = 1;
            }
            double v39 = v6;
            if (!v37 && v38)
            {
              id v37 = v10;
              double v39 = 1.0;
            }
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = __39__PKPassTileView__updateStyleAnimated___block_invoke;
            aBlock[3] = &unk_1E59CC160;
            int v81 = a2;
            char v107 = a2;
            aBlock[4] = a1;
            CGRect v40 = _Block_copy(aBlock);
            double v41 = (void (**)(void, void, void, void, double))v40;
            uint64_t v42 = *(void *)(a1 + 920);
            double v77 = v18;
            if (v42) {
              BOOL v43 = *(unsigned __int8 *)(v42 + 16) != 0;
            }
            else {
              BOOL v43 = 0;
            }
            (*((void (**)(void *, void, BOOL, void, double))v40 + 2))(v40, *(void *)(a1 + 776), v43, *(unsigned __int8 *)(a1 + 760), v21);
            uint64_t v44 = *(void *)(a1 + 920);
            if (v44) {
              BOOL v45 = *(unsigned __int8 *)(v44 + 19) != 0;
            }
            else {
              BOOL v45 = 0;
            }
            v41[2](v41, *(void *)(a1 + 800), v45, *(unsigned __int8 *)(a1 + 763), v25);
            uint64_t v46 = *(void *)(a1 + 920);
            if (v46) {
              BOOL v47 = *(unsigned __int8 *)(v46 + 21) != 0;
            }
            else {
              BOOL v47 = 0;
            }
            v41[2](v41, *(void *)(a1 + 816), v47, *(unsigned __int8 *)(a1 + 765), v6);
            uint64_t v48 = *(void *)(a1 + 920);
            if (v48) {
              BOOL v49 = *(unsigned __int8 *)(v48 + 22) != 0;
            }
            else {
              BOOL v49 = 0;
            }
            v41[2](v41, *(void *)(a1 + 824), v49, *(unsigned __int8 *)(a1 + 766), v6);
            uint64_t v50 = *(void *)(a1 + 920);
            if (v50) {
              BOOL v51 = *(unsigned __int8 *)(v50 + 23) != 0;
            }
            else {
              BOOL v51 = 0;
            }
            v41[2](v41, *(void *)(a1 + 832), v51, *(unsigned __int8 *)(a1 + 767), v39);
            uint64_t v52 = *(void *)(a1 + 920);
            if (v52) {
              BOOL v53 = *(unsigned __int8 *)(v52 + 24) != 0;
            }
            else {
              BOOL v53 = 0;
            }
            v41[2](v41, *(void *)(a1 + 840), v53, *(unsigned __int8 *)(a1 + 768), v32);
            uint64_t v54 = *(void *)(a1 + 920);
            uint64_t v79 = v36;
            if (v54) {
              BOOL v55 = *(unsigned __int8 *)(v54 + 25) != 0;
            }
            else {
              BOOL v55 = 0;
            }
            v41[2](v41, *(void *)(a1 + 944), v55, *(unsigned __int8 *)(a1 + 769), v6);
            v104[0] = MEMORY[0x1E4F143A8];
            v104[1] = 3221225472;
            v104[2] = __39__PKPassTileView__updateStyleAnimated___block_invoke_2;
            v104[3] = &unk_1E59CA870;
            v104[4] = a1;
            id v75 = v19;
            id v105 = v75;
            __n128 v89 = (void (**)(void))_Block_copy(v104);
            v102[0] = MEMORY[0x1E4F143A8];
            v102[1] = 3221225472;
            v102[2] = __39__PKPassTileView__updateStyleAnimated___block_invoke_3;
            v102[3] = &unk_1E59CA870;
            v102[4] = a1;
            id v56 = v10;
            id v103 = v56;
            __n128 v57 = (void (**)(void))_Block_copy(v102);
            v100[0] = MEMORY[0x1E4F143A8];
            v100[1] = 3221225472;
            v100[2] = __39__PKPassTileView__updateStyleAnimated___block_invoke_4;
            v100[3] = &unk_1E59CA870;
            v100[4] = a1;
            id v58 = v56;
            id v101 = v58;
            unint64_t v59 = (void (**)(void))_Block_copy(v100);
            v98[0] = MEMORY[0x1E4F143A8];
            v98[1] = 3221225472;
            v98[2] = __39__PKPassTileView__updateStyleAnimated___block_invoke_5;
            v98[3] = &unk_1E59CA870;
            v98[4] = a1;
            id v72 = v87;
            id v99 = v72;
            id v60 = (void (**)(void))_Block_copy(v98);
            v96[0] = MEMORY[0x1E4F143A8];
            v96[1] = 3221225472;
            v96[2] = __39__PKPassTileView__updateStyleAnimated___block_invoke_6;
            v96[3] = &unk_1E59CA870;
            v96[4] = a1;
            id v78 = v83;
            id v97 = v78;
            id v61 = _Block_copy(v96);
            v94[0] = MEMORY[0x1E4F143A8];
            v94[1] = 3221225472;
            v94[2] = __39__PKPassTileView__updateStyleAnimated___block_invoke_7;
            v94[3] = &unk_1E59CA870;
            v94[4] = a1;
            id v73 = v37;
            id v95 = v73;
            double v62 = (void (**)(void))_Block_copy(v94);
            v92[0] = MEMORY[0x1E4F143A8];
            v92[1] = 3221225472;
            v92[2] = __39__PKPassTileView__updateStyleAnimated___block_invoke_8;
            v92[3] = &unk_1E59CA870;
            v92[4] = a1;
            id v74 = v85;
            id v93 = v74;
            long long v63 = (void (**)(void))_Block_copy(v92);
            v90[0] = MEMORY[0x1E4F143A8];
            v90[1] = 3221225472;
            v90[2] = __39__PKPassTileView__updateStyleAnimated___block_invoke_9;
            v90[3] = &unk_1E59CA870;
            v90[4] = a1;
            id v64 = v58;
            id v91 = v64;
            long long v65 = (void (**)(void))_Block_copy(v90);
            double v86 = v59;
            double v88 = v57;
            uint64_t v82 = v63;
            v84 = v61;
            if (v81)
            {
              if (*(unsigned char *)(a1 + 760)) {
                v89[2]();
              }
              else {
                objc_msgSend(MEMORY[0x1E4FB1EB0], "pkui_animateUsingOptions:animations:completion:", 6, v89, 0);
              }
              objc_super v67 = v60;
              __n128 v69 = v72;
              __n128 v68 = v73;
              if (*(unsigned char *)(a1 + 761)) {
                v88[2](v88);
              }
              else {
                objc_msgSend(MEMORY[0x1E4FB1EB0], "pkui_animateUsingOptions:animations:completion:", 6, v88, 0);
              }
              if (*(unsigned char *)(a1 + 762)) {
                v86[2](v86);
              }
              else {
                objc_msgSend(MEMORY[0x1E4FB1EB0], "pkui_animateUsingOptions:animations:completion:", 6, v86, 0);
              }
              v70 = v64;
              v71 = v74;
              if (*(unsigned char *)(a1 + 763)) {
                v67[2](v67);
              }
              else {
                objc_msgSend(MEMORY[0x1E4FB1EB0], "pkui_animateUsingOptions:animations:completion:", 6, v67, 0);
              }
              if (*(unsigned char *)(a1 + 764)) {
                (*((void (**)(void *))v61 + 2))(v61);
              }
              else {
                objc_msgSend(MEMORY[0x1E4FB1EB0], "pkui_animateUsingOptions:animations:completion:", 6, v61, 0);
              }
              if (*(unsigned char *)(a1 + 767)) {
                v62[2](v62);
              }
              else {
                objc_msgSend(MEMORY[0x1E4FB1EB0], "pkui_animateUsingOptions:animations:completion:", 6, v62, 0);
              }
              if (*(unsigned char *)(a1 + 768)) {
                v82[2](v82);
              }
              else {
                objc_msgSend(MEMORY[0x1E4FB1EB0], "pkui_animateUsingOptions:animations:completion:", 6, v82, 0);
              }
              long long v66 = v77;
              if (!*(unsigned char *)(a1 + 769))
              {
                objc_msgSend(MEMORY[0x1E4FB1EB0], "pkui_animateUsingOptions:animations:completion:", 6, v65, 0);
                goto LABEL_98;
              }
            }
            else
            {
              v89[2]();
              v57[2](v57);
              v59[2](v59);
              v60[2](v60);
              (*((void (**)(void *))v61 + 2))(v61);
              v62[2](v62);
              v63[2](v63);
              long long v66 = v77;
              objc_super v67 = v60;
              __n128 v69 = v72;
              __n128 v68 = v73;
              v70 = v64;
              v71 = v74;
            }
            v65[2](v65);
LABEL_98:

            return;
          }
          __n128 v76 = 0;
        }
        else
        {
          __n128 v76 = 0;
          id v23 = 0;
        }
        int v24 = 1;
        goto LABEL_40;
      }
      uint64_t v12 = [MEMORY[0x1E4FB1618] secondaryLabelColor];

      uint64_t v13 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    }
    uint64_t v14 = v13;
    double v10 = (void *)v12;
    goto LABEL_27;
  }
}

- (void)_updateBackgroundAnimated:(unsigned char *)a1
{
  if (a1)
  {
    if (a1[970] && a1[972])
    {
      uint64_t v4 = [MEMORY[0x1E4FB1618] tableCellDefaultSelectionTintColor];
    }
    else
    {
      uint64_t v4 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
    }
    uint64_t v5 = v4;
    if (a2)
    {
      double v6 = (void *)MEMORY[0x1E4FB1EB0];
      if (a1[970])
      {
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __44__PKPassTileView__updateBackgroundAnimated___block_invoke;
        v10[3] = &unk_1E59CA870;
        v10[4] = a1;
        id v11 = v4;
        [v6 _animateUsingDefaultTimingWithOptions:1030 animations:v10 completion:0];
        char v7 = v11;
      }
      else
      {
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __44__PKPassTileView__updateBackgroundAnimated___block_invoke_2;
        v8[3] = &unk_1E59CA870;
        v8[4] = a1;
        id v9 = v4;
        [v6 _animateUsingDefaultTimingWithOptions:2 animations:v8 completion:0];
        char v7 = v9;
      }
    }
    else
    {
      [a1 setBackgroundColor:v4];
    }
  }
}

void __39__PKPassTileView__updateStyleAnimated___block_invoke(uint64_t a1, void *a2, int a3, int a4, double a5)
{
  double v5 = 0.0;
  if (!a3) {
    a5 = 0.0;
  }
  if (*(unsigned char *)(a1 + 40))
  {
    if (a3)
    {
      if (a4) {
        double v5 = *(double *)(*(void *)(a1 + 32) + 752);
      }
    }
    uint64_t v6 = 0;
    _PKViewSetAlphaAnimated(a2, 0, (double *)&v6, a5, v5);
  }
  else
  {
    objc_msgSend(a2, "pkui_setAlpha:animated:", 0, a5);
  }
}

uint64_t __39__PKPassTileView__updateStyleAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 776) setTintColor:*(void *)(a1 + 40)];
}

uint64_t __39__PKPassTileView__updateStyleAnimated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 784) setTintColor:*(void *)(a1 + 40)];
}

uint64_t __39__PKPassTileView__updateStyleAnimated___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 792) setTintColor:*(void *)(a1 + 40)];
}

uint64_t __39__PKPassTileView__updateStyleAnimated___block_invoke_5(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 800) setTintColor:*(void *)(a1 + 40)];
}

uint64_t __39__PKPassTileView__updateStyleAnimated___block_invoke_6(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 808) setTintColor:*(void *)(a1 + 40)];
}

uint64_t __39__PKPassTileView__updateStyleAnimated___block_invoke_7(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 832) setTintColor:*(void *)(a1 + 40)];
}

uint64_t __39__PKPassTileView__updateStyleAnimated___block_invoke_8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 840) setTintColor:*(void *)(a1 + 40)];
}

uint64_t __39__PKPassTileView__updateStyleAnimated___block_invoke_9(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 944) setTintColor:*(void *)(a1 + 40)];
}

uint64_t __44__PKPassTileView__updateBackgroundAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBackgroundColor:*(void *)(a1 + 40)];
}

uint64_t __44__PKPassTileView__updateBackgroundAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBackgroundColor:*(void *)(a1 + 40)];
}

uint64_t __50__PKPassTileView__prepareViewForReuse_type_state___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  dispatch_source_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);

  return [v2 removeObjectIdenticalTo:v3];
}

void __50__PKPassTileView__prepareViewForReuse_type_state___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) layer];
  [v2 removeAllAnimations];
  [*(id *)(a1 + 32) setAlpha:0.0];
  [v2 clearHasBeenCommitted];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKPassTileView;
  -[PKPassTileView setEnabled:](&v5, sel_setEnabled_);
  if (self->_enabled != v3)
  {
    self->_enabled = v3;
    -[PKPassTileView _updateStyleAnimated:]((uint64_t)self, 0);
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKPassTileView;
  -[PKPassTileView setSelected:](&v5, sel_setSelected_);
  if (self->_selected != v3)
  {
    self->_selected = v3;
    -[PKPassTileView _updateStyleAnimated:]((uint64_t)self, 0);
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKPassTileView;
  -[PKPassTileView setHighlighted:](&v5, sel_setHighlighted_);
  if (self->_highlighted != v3)
  {
    self->_highlighted = v3;
    -[PKPassTileView _updateBackgroundAnimated:](self, 1);
  }
}

- (void)setPassView:(id)a3 passUniqueID:(id)a4
{
  double v10 = (PKPassView *)a3;
  id v7 = a4;
  if (![(NSString *)self->_passUniqueID isEqualToString:v7])
  {
    objc_storeStrong((id *)&self->_passUniqueID, a4);
    p_passView = &self->_passView;
    passView = self->_passView;
    if (passView == v10)
    {
LABEL_6:
      -[PKPassTileView _updateSubviewsAnimated:]((uint64_t)self, 1);
      goto LABEL_7;
    }
LABEL_5:
    [(PKPassView *)passView removePassViewObserver:self];
    [(PKPassView *)v10 addPassViewObserver:self];
    objc_storeStrong((id *)p_passView, a3);
    goto LABEL_6;
  }
  p_passView = &self->_passView;
  passView = self->_passView;
  if (passView != v10) {
    goto LABEL_5;
  }
LABEL_7:
}

- (void)setContent:(id)a3
{
}

- (void)setContent:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  p_content = (void **)&self->_content;
  passView = self->_passView;
  unint64_t lastPassStateHash = self->_lastPassStateHash;
  id v11 = self->_content;
  id v36 = v7;
  uint64_t v12 = passView;
  if (!PKEqualObjects()) {
    goto LABEL_4;
  }
  uint64_t v13 = [(PKPassTile *)v11 state];
  uint64_t v14 = [v36 state];
  id v15 = v13;
  id v16 = v14;
  if (v15 != v16)
  {
LABEL_3:

LABEL_4:
    double v17 = v36;
LABEL_5:
    if (v4 && !self->_deferringUpdate)
    {
      [(PKPassTileView *)self layoutIfNeeded];
      double v17 = v36;
    }
    uint64_t v18 = +[PKPassTileView_State visuallyCompareTile:toTile:]((uint64_t)PKPassTileView_State, *p_content, v17);
    objc_storeStrong((id *)&self->_content, a3);
    id v19 = [*p_content axID];
    [(PKPassTileView *)self setAccessibilityIdentifier:v19];

    if (v18 != 2)
    {
      actionStateTimeout = self->_actionStateTimeout;
      if (actionStateTimeout)
      {
        dispatch_source_cancel(actionStateTimeout);
        double v21 = self->_actionStateTimeout;
        self->_actionStateTimeout = 0;
      }
    }
    if (!self->_actionStateTimeout) {
      self->_inActionState = [*p_content isInProgress];
    }
    -[PKPassTileView _updateContentStateAnimated:]((uint64_t)self, v4);
    goto LABEL_14;
  }
  uint64_t v22 = [(PKPassView *)v12 passState];
  if ([v22 hash] != lastPassStateHash)
  {
    CGPoint v34 = v22;
    long long v35 = [v15 stateTypeDefaultV2];
    id v23 = [v35 title];
    int v24 = [v23 valueTypeForeignReference];
    uint64_t v25 = [v24 foreignReferenceType];

    if (!v25)
    {
      id v33 = v23;
      double v26 = [v35 body];
      double v27 = [v26 valueTypeForeignReference];
      uint64_t v28 = [v27 foreignReferenceType];

      if (v28)
      {
        BOOL v29 = 1;
      }
      else
      {
        id v30 = [v35 footer];
        int v31 = [v30 valueTypeForeignReference];
        uint64_t v32 = [v31 foreignReferenceType];

        BOOL v29 = v32 != 0;
      }

      double v17 = v36;
      if (!v29) {
        goto LABEL_15;
      }
      goto LABEL_5;
    }

    id v16 = v15;
    goto LABEL_3;
  }

LABEL_14:
  double v17 = v36;
LABEL_15:
}

- (void)setInActionState:(BOOL)a3
{
}

- (void)setInActionState:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_inActionState != a3)
  {
    BOOL v4 = a4;
    if (a4 && !self->_deferringUpdate) {
      [(PKPassTileView *)self layoutIfNeeded];
    }
    self->_inActionState = a3;
    -[PKPassTileView _updateContentStateAnimated:]((uint64_t)self, v4);
  }
}

- (void)setCompact:(BOOL)a3
{
}

- (void)setCompact:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_compact != a3)
  {
    BOOL v4 = a4;
    if (a4 && !self->_deferringUpdate) {
      [(PKPassTileView *)self layoutIfNeeded];
    }
    self->_compact = a3;
    -[PKPassTileView _updateSubviewsAnimated:]((uint64_t)self, v4);
  }
}

- (void)setGroupStyle:(unint64_t)a3
{
  if (self)
  {
    if (self->_groupStyle != a3)
    {
      self->_groupStyle = a3;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __41__PKPassTileView_setGroupStyle_animated___block_invoke;
      aBlock[3] = &__block_descriptor_33_e17_v16__0__UILabel_8l;
      BOOL v6 = a3 == 1;
      BOOL v4 = (void (**)(void *, UILabel *))_Block_copy(aBlock);
      v4[2](v4, self->_title);
      v4[2](v4, self->_body);
      v4[2](v4, self->_footer);
      -[PKPassTileView _updateSubviewsAnimated:]((uint64_t)self, 0);
    }
  }
}

uint64_t __41__PKPassTileView_setGroupStyle_animated___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = 4;
  }
  return [a2 setTextAlignment:v2];
}

- (id)viewImageActionView
{
  return self->_bodyImage;
}

- (void)passView:(id)a3 didUpdatePassState:(id)a4
{
}

- (PKPassTile)content
{
  return self->_content;
}

- (BOOL)isInActionState
{
  return self->_inActionState;
}

- (BOOL)isCompact
{
  return self->_compact;
}

- (unint64_t)groupStyle
{
  return self->_groupStyle;
}

- (unint64_t)overflowType
{
  return self->_overflowType;
}

- (void)setOverflowType:(unint64_t)a3
{
  self->_overflowType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_actionStateTimeout, 0);
  objc_storeStrong((id *)&self->_buttonFont, 0);
  objc_storeStrong((id *)&self->_footerFont, 0);
  objc_storeStrong((id *)&self->_bodyFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_iconFont, 0);
  objc_storeStrong((id *)&self->_regularFont, 0);
  objc_storeStrong((id *)&self->_significantFont, 0);
  objc_storeStrong((id *)&self->_snapshots, 0);
  objc_storeStrong((id *)&self->_effectiveContentTimeout, 0);
  objc_storeStrong((id *)&self->_passUniqueID, 0);
  objc_storeStrong((id *)&self->_hostedView, 0);
  objc_storeStrong((id *)&self->_passView, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_contentState, 0);
  objc_storeStrong((id *)&self->_secondaryImage, 0);
  objc_storeStrong((id *)&self->_accessoryImage, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_bodyImage, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_icon, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end