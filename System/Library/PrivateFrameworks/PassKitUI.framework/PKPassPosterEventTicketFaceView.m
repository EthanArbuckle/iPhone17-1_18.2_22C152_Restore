@interface PKPassPosterEventTicketFaceView
- (id)_relevantBuckets;
- (id)templateForHeaderBucket;
- (id)templateForLayoutMode:(int64_t)a3;
- (void)_updateBodyLabelColorsForRelevancyActive:(BOOL)a3;
- (void)createBodyContentViews;
- (void)createHeaderContentViews;
- (void)layoutSubviews;
- (void)setRelevancyActive:(BOOL)a3;
@end

@implementation PKPassPosterEventTicketFaceView

- (id)_relevantBuckets
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v2 = [(PKPassFaceView *)self pass];
  v3 = +[PKEventTicketFaceBucketsFactory headerFieldsForPass:v2];
  v4 = +[PKEventTicketFaceBucketsFactory primaryFieldsForPass:v2];
  v5 = +[PKEventTicketFaceBucketsFactory secondaryFieldsForPass:v2];
  v6 = +[PKEventTicketFaceBucketsFactory auxiliaryFieldsForPass:v2];
  v9[0] = v3;
  v9[1] = v4;
  v9[2] = v5;
  v9[3] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:4];

  return v7;
}

- (id)templateForHeaderBucket
{
  return 0;
}

- (id)templateForLayoutMode:(int64_t)a3
{
  return 0;
}

- (void)createHeaderContentViews
{
  v111[2] = *MEMORY[0x1E4F143B8];
  v107.receiver = self;
  v107.super_class = (Class)PKPassPosterEventTicketFaceView;
  [(PKPassFrontFaceView *)&v107 createHeaderContentViews];
  int64_t v3 = [(PKPassFaceView *)self style];
  v4 = [(PKPassFaceView *)self pass];
  v5 = [(PKPassFaceView *)self colorProfile];
  v106 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x1E4FB27D0]];
  id v97 = [v4 frontFaceImageAverageColor];
  [v97 CGColor];
  PKColorGetLightness();
  double v7 = v6;
  v8 = (id *)MEMORY[0x1E4F3A2E0];
  if (v6 <= 0.85) {
    v8 = (id *)MEMORY[0x1E4F3A2E8];
  }
  id v105 = *v8;
  if (v7 <= 0.85) {
    [MEMORY[0x1E4FB1618] whiteColor];
  }
  else {
  v100 = [MEMORY[0x1E4FB1618] blackColor];
  }
  v101 = v5;
  if ([v5 supportsAutomaticForegroundVibrancy]) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = [v5 supportsAutomaticLabelVibrancy] ^ 1;
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  v11 = [v10 layer];
  [v11 setAllowsGroupBlending:v9];

  v104 = v10;
  [(PKPassFrontFaceView *)self insertContentView:v10 ofType:0];
  self->_usingSportsLabel = 0;
  CGPoint v102 = (CGPoint)*MEMORY[0x1E4F1DB20];
  CGSize v103 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  self->_cachedLogoLabelRect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  self->_cachedLogoLabelRect.size = v103;
  v98 = [v4 logoText];
  PKPassFaceLogoRect();
  v99 = v4;
  if (!CGRectIsEmpty(v112) && v3 == 9)
  {
    v12 = [v4 stringForSemanticKey:*MEMORY[0x1E4F877A8]];
    v13 = [NSNumber numberWithInt:0];
    int v14 = _PKEnumValueFromString();

    v96 = objc_msgSend(v4, "stringForSemanticKey:", *MEMORY[0x1E4F877C0], 0, 1, 2, 3, 4, 5, 6, 7);
    v95 = [v4 stringForSemanticKey:*MEMORY[0x1E4F876E8]];
    if (v14 != 3) {
      goto LABEL_18;
    }
    id v15 = v96;
    if (!v15) {
      goto LABEL_18;
    }
    v16 = v15;
    uint64_t v17 = [v15 length];

    if (v17
      && (id v18 = v95) != 0
      && (v19 = v18, uint64_t v20 = [v18 length], v19, v20))
    {
      self->_usingSportsLabel = 1;
      v21 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      logoLabel = self->_logoLabel;
      self->_logoLabel = v21;

      v23 = self->_logoLabel;
      v24 = [MEMORY[0x1E4FB1618] clearColor];
      [(UILabel *)v23 setBackgroundColor:v24];

      [(UILabel *)self->_logoLabel setLineBreakMode:4];
      [(UILabel *)self->_logoLabel setNumberOfLines:1];
      if ([v101 supportsAutomaticForegroundVibrancy])
      {
        id v25 = v100;
      }
      else
      {
        id v25 = [v101 foregroundColor];
      }
      v36 = v25;
      int v74 = [v101 supportsAutomaticForegroundVibrancy];
      v75 = v105;
      if (!v74) {
        v75 = 0;
      }
      v76 = self->_logoLabel;
      id v94 = v75;
      v77 = [(UILabel *)v76 layer];
      [v77 setCompositingFilter:v94];

      id v88 = objc_alloc_init(MEMORY[0x1E4F28E48]);
      v78 = PKFontForDefaultDesign(v106, (void *)*MEMORY[0x1E4FB28C8], 32770, 0, *MEMORY[0x1E4FB09B8]);
      uint64_t v89 = *MEMORY[0x1E4FB0700];
      uint64_t v79 = *MEMORY[0x1E4FB0700];
      v110[0] = *MEMORY[0x1E4FB06F8];
      uint64_t v90 = v110[0];
      v110[1] = v79;
      v111[0] = v78;
      v111[1] = v36;
      v92 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v111 forKeys:v110 count:2];
      v93 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v16 attributes:v92];
      [v88 appendAttributedString:v93];
      v80 = PKFontForDefaultDesign(v106, (void *)*MEMORY[0x1E4FB28E0], 32770, 0, *MEMORY[0x1E4FB09E0]);
      v108[0] = *MEMORY[0x1E4FB06C8];
      v81 = NSNumber;
      [v78 capHeight];
      v91 = v80;
      [v80 xHeight];
      PKFloatRoundToPixel();
      v82 = objc_msgSend(v81, "numberWithDouble:");
      v109[0] = v82;
      v109[1] = v80;
      v108[1] = v90;
      v108[2] = v89;
      v109[2] = v36;
      v83 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v109 forKeys:v108 count:3];

      id v84 = objc_alloc(MEMORY[0x1E4F28B18]);
      v85 = PKLocalizedTicketingString(&cfstr_LabelLogoVersu.isa);
      v86 = (void *)[v84 initWithString:v85 attributes:v83];

      [v88 appendAttributedString:v86];
      v87 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v19 attributes:v92];
      [v88 appendAttributedString:v87];
      [(UILabel *)self->_logoLabel setAttributedText:v88];
      [v104 addSubview:self->_logoLabel];
    }
    else
    {
LABEL_18:
      id v26 = v98;
      if (!v26) {
        goto LABEL_27;
      }
      v27 = v26;
      uint64_t v28 = [v26 length];

      if (!v28) {
        goto LABEL_27;
      }
      v29 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      v30 = self->_logoLabel;
      self->_logoLabel = v29;

      v31 = self->_logoLabel;
      v32 = [MEMORY[0x1E4FB1618] clearColor];
      [(UILabel *)v31 setBackgroundColor:v32];

      [(UILabel *)self->_logoLabel setLineBreakMode:4];
      [(UILabel *)self->_logoLabel setNumberOfLines:2];
      v33 = self->_logoLabel;
      v34 = PKFontForDefaultDesign(v106, (void *)*MEMORY[0x1E4FB2950], 32770, 0, *MEMORY[0x1E4FB09B8]);
      [(UILabel *)v33 setFont:v34];

      [(UILabel *)self->_logoLabel setText:v27];
      if ([v101 supportsAutomaticForegroundVibrancy])
      {
        id v35 = v100;
      }
      else
      {
        id v35 = [v101 foregroundColor];
      }
      v36 = v35;
      int v37 = [v101 supportsAutomaticForegroundVibrancy];
      v38 = v105;
      if (!v37) {
        v38 = 0;
      }
      v39 = self->_logoLabel;
      id v40 = v38;
      [(UILabel *)v39 setTextColor:v36];
      v41 = [(UILabel *)self->_logoLabel layer];
      [v41 setCompositingFilter:v40];

      v42 = self->_logoLabel;
      [v104 addSubview:v42];
    }

    v4 = v99;
LABEL_27:
  }
  v43 = [(PKPassFaceView *)self buckets];
  v44 = [v43 firstObject];
  v45 = [v44 firstObject];

  if (!v45) {
    __break(1u);
  }
  self->_cachedDateLabelFrame.origin = v102;
  self->_cachedDateLabelFrame.size = v103;
  v46 = [v45 label];
  v47 = [v45 value];
  if (v47)
  {
    v48 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    dateLabel = self->_dateLabel;
    self->_dateLabel = v48;

    [(UILabel *)self->_dateLabel setNumberOfLines:1];
    [(UILabel *)self->_dateLabel setLineBreakMode:4];
    [(UILabel *)self->_dateLabel setTextAlignment:2];
    v50 = (id *)MEMORY[0x1E4FB28C8];
    if (v46) {
      v50 = (id *)MEMORY[0x1E4FB2950];
    }
    id v51 = *v50;
    v52 = self->_dateLabel;
    v53 = PKFontForDefaultDesign(v106, v51, 32770, 0, *MEMORY[0x1E4FB09B8]);
    [(UILabel *)v52 setFont:v53];

    [(UILabel *)self->_dateLabel setText:v47];
    if ([v101 supportsAutomaticForegroundVibrancy])
    {
      id v54 = v100;
    }
    else
    {
      id v54 = [v101 foregroundColor];
    }
    v55 = v54;
    int v56 = [v101 supportsAutomaticForegroundVibrancy];
    v57 = v105;
    if (!v56) {
      v57 = 0;
    }
    v58 = self->_dateLabel;
    id v59 = v57;
    [(UILabel *)v58 setTextColor:v55];
    v60 = [(UILabel *)self->_dateLabel layer];
    [v60 setCompositingFilter:v59];

    v61 = self->_dateLabel;
    [v104 addSubview:v61];

    v4 = v99;
  }
  self->_cachedTimeLabelFrame.origin = v102;
  self->_cachedTimeLabelFrame.size = v103;
  if (v46)
  {
    v62 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    timeLabel = self->_timeLabel;
    self->_timeLabel = v62;

    [(UILabel *)self->_timeLabel setNumberOfLines:1];
    [(UILabel *)self->_timeLabel setLineBreakMode:4];
    [(UILabel *)self->_timeLabel setTextAlignment:2];
    v64 = self->_timeLabel;
    v65 = (void *)_PKFontForDesign(v106, (void *)*MEMORY[0x1E4FB0930], (void *)*MEMORY[0x1E4FB2950], 0x8000, 32, 0);
    [(UILabel *)v64 setFont:v65];

    [(UILabel *)self->_timeLabel setText:v46];
    if ([v101 supportsAutomaticLabelVibrancy])
    {
      id v66 = v100;
    }
    else
    {
      id v66 = [v101 labelColor];
    }
    v67 = v66;
    int v68 = [v101 supportsAutomaticLabelVibrancy];
    v69 = v105;
    if (!v68) {
      v69 = 0;
    }
    v70 = self->_timeLabel;
    id v71 = v69;
    [(UILabel *)v70 setTextColor:v67];
    v72 = [(UILabel *)self->_timeLabel layer];
    [v72 setCompositingFilter:v71];

    v73 = self->_timeLabel;
    [v104 addSubview:v73];

    v4 = v99;
  }
}

- (void)createBodyContentViews
{
  v128.receiver = self;
  v128.super_class = (Class)PKPassPosterEventTicketFaceView;
  [(PKPassFrontFaceView *)&v128 createBodyContentViews];
  int64_t v3 = [(PKPassFaceView *)self pass];
  CGRect v112 = [v3 seatingInformation];
  v4 = [v112 firstSeat];
  v5 = (void *)MEMORY[0x1E4FB1618];
  v111 = v4;
  double v6 = [v4 sectionColor];
  double v7 = objc_msgSend(v5, "pkui_colorWithPKColor:", v6);

  if (v7)
  {
    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    sectionColorView = self->_sectionColorView;
    self->_sectionColorView = v8;

    [(UIView *)self->_sectionColorView setClipsToBounds:1];
    id v10 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    sectionColorMaskView = self->_sectionColorMaskView;
    self->_sectionColorMaskView = v10;

    [(UIView *)self->_sectionColorMaskView setBackgroundColor:v7];
    [(UIView *)self->_sectionColorView addSubview:self->_sectionColorMaskView];
    id v12 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
    v13 = [(UIView *)self->_sectionColorMaskView layer];
    [v13 setMask:v12];

    int v14 = [(UIView *)self->_sectionColorMaskView layer];
    [v14 setMasksToBounds:1];

    if ([(PKPassFrontFaceView *)self isRelevancyActive]) {
      [(PKPassFrontFaceView *)self insertContentView:self->_sectionColorView ofType:2];
    }
  }
  uint64_t v15 = [v3 secondaryLogoImage];
  if (v15)
  {
    v16 = (void *)v15;
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F84790], "constraintsWithMaxSize:", 135.0, 12.0);
    [v16 scale];
    objc_msgSend(v17, "setOutputScale:");
    id v18 = [v16 resizedImageWithConstraints:v17];

    [v18 size];
    self->_secondaryLogoSize.width = v19;
    self->_secondaryLogoSize.height = v20;
    id v21 = objc_alloc(MEMORY[0x1E4FB1838]);
    v110 = v18;
    v22 = [MEMORY[0x1E4FB1818] imageWithPKImage:v18];
    v23 = (UIImageView *)[v21 initWithImage:v22];
    secondaryLogoImageView = self->_secondaryLogoImageView;
    self->_secondaryLogoImageView = v23;

    [(UIImageView *)self->_secondaryLogoImageView setContentMode:1];
    [(PKPassFrontFaceView *)self insertContentView:self->_secondaryLogoImageView ofType:2];
  }
  else
  {
    v110 = 0;
  }
  v126 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x1E4FB27D0]];
  v122 = (void *)*MEMORY[0x1E4FB0930];
  v115 = (void *)*MEMORY[0x1E4FB28F0];
  v118 = (void *)_PKFontForDesign(v126, (void *)*MEMORY[0x1E4FB0930], (void *)*MEMORY[0x1E4FB28F0], 0, 0, 0);
  id v25 = [(PKPassFaceView *)self colorProfile];
  if (([v25 supportsAutomaticForegroundVibrancy] & 1) == 0
    && ![v25 supportsAutomaticLabelVibrancy])
  {
    goto LABEL_18;
  }
  id v26 = [v25 footerBackgroundColor];
  v27 = (void *)MEMORY[0x1E4FB1618];
  uint64_t v28 = [v3 frontFaceImageAverageColor];
  v29 = objc_msgSend(v27, "pkui_colorWithPKColor:", v28);

  BOOL v30 = [(PKPassFrontFaceView *)self isRelevancyActive];
  v31 = v26 ? v26 : v29;
  v32 = v7 != 0 && v30 ? v7 : v31;
  [v32 CGColor];
  PKColorGetLightness();
  double v34 = v33;

  if (v34 > 0.85)
  {
    id v127 = (id)*MEMORY[0x1E4F3A2E0];
    v119 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v35 = [MEMORY[0x1E4FB1618] lightGrayColor];
  }
  else
  {
LABEL_18:
    id v127 = (id)*MEMORY[0x1E4F3A2E8];
    v119 = [MEMORY[0x1E4FB1618] whiteColor];
    uint64_t v35 = [MEMORY[0x1E4FB1618] darkGrayColor];
  }
  v120 = (void *)v35;
  if ([v25 supportsAutomaticForegroundVibrancy]) {
    int v36 = 1;
  }
  else {
    int v36 = [v25 supportsAutomaticLabelVibrancy];
  }
  id v37 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  v38 = [v37 layer];
  [v38 setAllowsGroupBlending:v36 ^ 1u];

  v123 = v37;
  [(PKPassFrontFaceView *)self insertContentView:v37 ofType:2];
  [(PKPassFaceView *)self style];
  PKPassFrontFaceContentSize();
  PKEventTicketV2PassScaleFactor();
  double v40 = v39;
  v41 = [(PKPassFaceView *)self buckets];
  if ([v41 count] == 4)
  {
    v42 = [v41 objectAtIndex:1];
    uint64_t v43 = [v42 firstObject];

    v116 = [v41 objectAtIndex:2];
    unint64_t v44 = [v116 count];
    v109 = v41;
    v45 = [v41 objectAtIndex:3];
    v46 = [v45 firstObject];

    CGSize v124 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    CGPoint v125 = (CGPoint)*MEMORY[0x1E4F1DB20];
    self->_cachedPrimaryFieldFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    self->_cachedPrimaryFieldFrame.size = v124;
    v47 = (id *)MEMORY[0x1E4FB2928];
    v113 = v7;
    v114 = v3;
    v117 = (void *)v43;
    v121 = v46;
    if (v43)
    {
      id v48 = (id)*MEMORY[0x1E4FB2928];
      v49 = PKFontForDefaultDesign(v126, v48, 2, 0, *MEMORY[0x1E4FB09B8]);
      v50 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      primaryFieldLabel = self->_primaryFieldLabel;
      self->_primaryFieldLabel = v50;

      [(UILabel *)self->_primaryFieldLabel setNumberOfLines:2];
      [(UILabel *)self->_primaryFieldLabel setLineBreakMode:4];
      [(UILabel *)self->_primaryFieldLabel setFont:v49];
      [(UILabel *)self->_primaryFieldLabel setTextAlignment:0];
      if (v44)
      {
        if (objc_msgSend(v25, "supportsAutomaticLabelVibrancy", v48))
        {
          id v52 = v120;
        }
        else
        {
          id v52 = [v25 labelColor];
        }
        id v54 = v52;
        int v55 = [v25 supportsAutomaticLabelVibrancy];
      }
      else
      {
        if (objc_msgSend(v25, "supportsAutomaticForegroundVibrancy", v48))
        {
          id v53 = v119;
        }
        else
        {
          id v53 = [v25 foregroundColor];
        }
        id v54 = v53;
        int v55 = [v25 supportsAutomaticForegroundVibrancy];
      }
      int v56 = v127;
      if (!v55) {
        int v56 = 0;
      }
      id v57 = v56;
      [(UILabel *)self->_primaryFieldLabel setTextColor:v54];
      v58 = [(UILabel *)self->_primaryFieldLabel layer];
      [v58 setCompositingFilter:v57];

      id v59 = self->_primaryFieldLabel;
      v60 = [v117 value];
      [(UILabel *)v59 setText:v60];

      [v123 addSubview:self->_primaryFieldLabel];
      double v7 = v113;
      int64_t v3 = v114;
      v46 = v121;
    }
    self->_cachedSecondaryBucketFrame.origin = v125;
    self->_cachedSecondaryBucketFrame.size = v124;
    if (v44)
    {
      id v61 = *v47;
      v62 = (void *)_PKFontForDesign(v126, v122, v61, 0, 32, 0);
      v63 = [v62 fontWithSize:round(v40 * 36.0)];

      double v64 = 26.0;
      BOOL v65 = v44 == 2;
      BOOL v66 = v44 > 2;
      if (v65)
      {
        PKFloatRoundToPixel();
        double v64 = v67;
      }
      int v68 = [[PKDynamicPassBucketView alloc] initWithBucket:v116];
      secondaryBucketView = self->_secondaryBucketView;
      self->_secondaryBucketView = v68;

      [(PKDynamicPassBucketView *)self->_secondaryBucketView setLayoutDirection:1];
      [(PKDynamicPassBucketView *)self->_secondaryBucketView setDistribution:v66];
      [(PKDynamicPassBucketView *)self->_secondaryBucketView setSizingRule:0];
      [(PKDynamicPassBucketView *)self->_secondaryBucketView setSpacing:v64];
      [(PKDynamicPassBucketView *)self->_secondaryBucketView setVerticalPadding:0.0];
      [(PKDynamicPassBucketView *)self->_secondaryBucketView setMinResizeScale:0.6];
      if ([v25 supportsAutomaticLabelVibrancy])
      {
        id v70 = v120;
      }
      else
      {
        id v70 = [v25 labelColor];
      }
      id v71 = v70;
      int v72 = [v25 supportsAutomaticLabelVibrancy];
      v73 = v127;
      if (!v72) {
        v73 = 0;
      }
      id v74 = v73;
      [(PKDynamicPassBucketView *)self->_secondaryBucketView setLabelFont:v118];
      [(PKDynamicPassBucketView *)self->_secondaryBucketView setLabelTextColor:v71];
      [(PKDynamicPassBucketView *)self->_secondaryBucketView setLabelBlendMode:v74];
      if ([v25 supportsAutomaticForegroundVibrancy])
      {
        id v75 = v119;
      }
      else
      {
        id v75 = [v25 foregroundColor];
      }
      v76 = v75;
      int v77 = [v25 supportsAutomaticForegroundVibrancy];
      v78 = v127;
      if (!v77) {
        v78 = 0;
      }
      uint64_t v79 = self->_secondaryBucketView;
      id v80 = v78;
      [(PKDynamicPassBucketView *)v79 setValueFont:v63];
      [(PKDynamicPassBucketView *)self->_secondaryBucketView setValueTextColor:v76];
      [(PKDynamicPassBucketView *)self->_secondaryBucketView setValueBlendMode:v80];
      [(PKPassFrontFaceView *)self insertContentView:self->_secondaryBucketView ofType:2];

      double v7 = v113;
      int64_t v3 = v114;
      v46 = v121;
    }
    self->_cachedSecnamLabelFrame.origin = v125;
    self->_cachedSecnamLabelFrame.size = v124;
    v81 = [v46 label];
    if (v81)
    {
      v82 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      secnamLabel = self->_secnamLabel;
      self->_secnamLabel = v82;

      [(UILabel *)self->_secnamLabel setNumberOfLines:1];
      [(UILabel *)self->_secnamLabel setLineBreakMode:4];
      [(UILabel *)self->_secnamLabel setTextAlignment:0];
      id v84 = self->_secnamLabel;
      v85 = (void *)_PKFontForDesign(v126, v122, v115, 0x8000, 32, 0);
      [(UILabel *)v84 setFont:v85];

      if ([v25 supportsAutomaticLabelVibrancy])
      {
        id v86 = v120;
      }
      else
      {
        id v86 = [v25 labelColor];
      }
      v87 = v86;
      int v88 = [v25 supportsAutomaticLabelVibrancy];
      uint64_t v89 = v127;
      if (!v88) {
        uint64_t v89 = 0;
      }
      uint64_t v90 = self->_secnamLabel;
      id v91 = v89;
      [(UILabel *)v90 setTextColor:v87];
      v92 = [(UILabel *)self->_secnamLabel layer];
      [v92 setCompositingFilter:v91];

      [(UILabel *)self->_secnamLabel setText:v81];
      v93 = self->_secnamLabel;

      [v123 addSubview:v93];
    }
    self->_cachedVenueLabelFrame.origin = v125;
    self->_cachedVenueLabelFrame.size = v124;
    id v94 = [v46 value];
    if (v94)
    {
      v95 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      venueLabel = self->_venueLabel;
      self->_venueLabel = v95;

      if (v81) {
        uint64_t v97 = 1;
      }
      else {
        uint64_t v97 = 2;
      }
      [(UILabel *)self->_venueLabel setNumberOfLines:v97];
      [(UILabel *)self->_venueLabel setLineBreakMode:4 * (v81 != 0)];
      [(UILabel *)self->_venueLabel setTextAlignment:0];
      v98 = self->_venueLabel;
      v99 = (void *)_PKFontForDesign(v126, v122, v115, 0, 32, 0);
      [(UILabel *)v98 setFont:v99];

      if ([v25 supportsAutomaticForegroundVibrancy])
      {
        id v100 = v119;
      }
      else
      {
        id v100 = [v25 foregroundColor];
      }
      v101 = v100;
      int v102 = [v25 supportsAutomaticForegroundVibrancy];
      CGSize v103 = v127;
      if (!v102) {
        CGSize v103 = 0;
      }
      v104 = self->_venueLabel;
      id v105 = v103;
      [(UILabel *)v104 setTextColor:v101];
      v106 = [(UILabel *)self->_venueLabel layer];
      [v106 setCompositingFilter:v105];

      [(UILabel *)self->_venueLabel setText:v94];
      objc_super v107 = self->_venueLabel;

      [v123 addSubview:v107];
      v46 = v121;
    }
  }
  else
  {
    __break(1u);
  }
}

- (void)_updateBodyLabelColorsForRelevancyActive:(BOOL)a3
{
  id v40 = [(PKPassFaceView *)self pass];
  v5 = [(PKPassFaceView *)self colorProfile];
  if (([v5 supportsAutomaticForegroundVibrancy] & 1) == 0
    && ![v5 supportsAutomaticLabelVibrancy])
  {
    goto LABEL_31;
  }
  double v6 = [v40 seatingInformation];
  double v7 = [v6 firstSeat];
  v8 = (void *)MEMORY[0x1E4FB1618];
  uint64_t v9 = [v7 sectionColor];
  uint64_t v10 = objc_msgSend(v8, "pkui_colorWithPKColor:", v9);

  v11 = [v5 footerBackgroundColor];
  id v12 = (void *)MEMORY[0x1E4FB1618];
  v13 = [v40 frontFaceImageAverageColor];
  uint64_t v14 = objc_msgSend(v12, "pkui_colorWithPKColor:", v13);

  v38 = (void *)v14;
  double v39 = (void *)v10;
  if (v11) {
    uint64_t v15 = v11;
  }
  else {
    uint64_t v15 = (void *)v14;
  }
  if (a3 && v10 != 0) {
    v16 = (void *)v10;
  }
  else {
    v16 = v15;
  }
  [v16 CGColor];
  PKColorGetLightness();
  double v18 = v17;
  CGFloat v19 = (id *)MEMORY[0x1E4F3A2E0];
  if (v17 <= 0.85) {
    CGFloat v19 = (id *)MEMORY[0x1E4F3A2E8];
  }
  id v20 = *v19;
  if (v18 > 0.85)
  {
    id v21 = [MEMORY[0x1E4FB1618] blackColor];
    [MEMORY[0x1E4FB1618] lightGrayColor];
  }
  else
  {
    id v21 = [MEMORY[0x1E4FB1618] whiteColor];
    [MEMORY[0x1E4FB1618] darkGrayColor];
  uint64_t v22 = };
  v23 = (void *)v22;
  if (self->_primaryFieldLabel)
  {
    v24 = v6;
    id v25 = (void *)v22;
    int v36 = v7;
    id v37 = v11;
    id v26 = v24;
    v27 = [(PKPassFaceView *)self buckets];
    uint64_t v28 = [v27 objectAtIndex:2];
    uint64_t v29 = [v28 count];

    if (v29)
    {
      char v30 = [v5 supportsAutomaticLabelVibrancy];
      v23 = v25;
      v31 = v25;
      if ((v30 & 1) == 0)
      {
LABEL_18:

        double v6 = v26;
        double v7 = v36;
        v11 = v37;
        goto LABEL_19;
      }
    }
    else
    {
      int v35 = [v5 supportsAutomaticForegroundVibrancy];
      v31 = v21;
      v23 = v25;
      if (!v35) {
        goto LABEL_18;
      }
    }
    [(UILabel *)self->_primaryFieldLabel setTextColor:v31];
    v32 = [(UILabel *)self->_primaryFieldLabel layer];
    [v32 setCompositingFilter:v20];

    v23 = v25;
    goto LABEL_18;
  }
LABEL_19:
  if (self->_secondaryBucketView)
  {
    if ([v5 supportsAutomaticLabelVibrancy])
    {
      [(PKDynamicPassBucketView *)self->_secondaryBucketView setLabelTextColor:v23];
      [(PKDynamicPassBucketView *)self->_secondaryBucketView setLabelBlendMode:v20];
    }
    if ([v5 supportsAutomaticForegroundVibrancy])
    {
      [(PKDynamicPassBucketView *)self->_secondaryBucketView setValueTextColor:v21];
      [(PKDynamicPassBucketView *)self->_secondaryBucketView setValueBlendMode:v20];
    }
  }
  if (self->_secnamLabel && [v5 supportsAutomaticLabelVibrancy])
  {
    [(UILabel *)self->_secnamLabel setTextColor:v23];
    double v33 = [(UILabel *)self->_secnamLabel layer];
    [v33 setCompositingFilter:v20];
  }
  if (self->_venueLabel && [v5 supportsAutomaticForegroundVibrancy])
  {
    [(UILabel *)self->_venueLabel setTextColor:v21];
    double v34 = [(UILabel *)self->_venueLabel layer];
    [v34 setCompositingFilter:v20];
  }
LABEL_31:
}

- (void)layoutSubviews
{
  v227.receiver = self;
  v227.super_class = (Class)PKPassPosterEventTicketFaceView;
  [(PKPassFrontFaceView *)&v227 layoutSubviews];
  int64_t v3 = [(PKPassFaceView *)self style];
  v4 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x1E4FB27D0]];
  PKPassFrontFaceContentSize();
  double v6 = v5;
  double v225 = v7;
  PKFloatRoundToPixel();
  double v9 = v8;
  double v218 = v6 + -28.0;
  PKFloatRoundToPixel();
  double v220 = v10;
  PKPassFaceLogoRect();
  CGFloat v15 = v11;
  CGFloat v16 = v12;
  CGFloat v17 = v13;
  CGFloat v18 = v14;
  double v224 = v6;
  if (self->_logoLabel && !CGRectIsNull(*(CGRect *)&v11))
  {
    p_cachedLogoLabelRect = &self->_cachedLogoLabelRect;
    if (CGRectIsNull(self->_cachedLogoLabelRect))
    {
      double v222 = v9;
      if (self->_usingSportsLabel) {
        CGFloat v17 = v220;
      }
      else {
        CGFloat v17 = v9;
      }
      id v20 = [(PKPassFaceView *)self pass];
      [v20 logoRect];
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      CGFloat v28 = v27;

      v228.origin.double x = v22;
      v228.origin.CGFloat y = v24;
      v228.size.double width = v26;
      v228.size.double height = v28;
      if (CGRectIsNull(v228))
      {
        v229.origin.double x = v15;
        v229.origin.CGFloat y = v16;
        v229.size.double width = v17;
        v229.size.double height = v18;
        double MinX = CGRectGetMinX(v229);
      }
      else
      {
        v230.origin.double x = v22;
        v230.origin.CGFloat y = v24;
        v230.size.double width = v26;
        v230.size.double height = v28;
        double MinX = CGRectGetMaxX(v230) + 8.0;
      }
      v231.origin.double x = v15;
      v231.origin.CGFloat y = v16;
      v231.size.double width = v17;
      v231.size.double height = v18;
      CGFloat v30 = CGRectGetMaxX(v231) - MinX;
      v31 = [(UILabel *)self->_logoLabel font];
      [v31 _bodyLeading];
      v33.n128_u64[0] = v32;
      v34.n128_f64[0] = v30;
      PKSizeCeilToPixel(v34, v33, v35);
      double v38 = v37;
      if (!self->_usingSportsLabel)
      {
        -[UILabel sizeThatFits:](self->_logoLabel, "sizeThatFits:", v36, 1.79769313e308);
        if (v39 <= v38)
        {
          id v40 = PKFontForDefaultDesign(v4, (void *)*MEMORY[0x1E4FB28C8], 32770, 0, *MEMORY[0x1E4FB09B8]);
          [(UILabel *)self->_logoLabel setFont:v40];
          -[UILabel sizeThatFits:](self->_logoLabel, "sizeThatFits:", 1.79769313e308, v38);
        }
      }
      UIRectCenteredYInRect();
      p_cachedLogoLabelRect->origin.double x = v41;
      self->_cachedLogoLabelRect.origin.CGFloat y = v42;
      self->_cachedLogoLabelRect.size.double width = v43;
      self->_cachedLogoLabelRect.size.double height = v44;

      double v9 = v222;
      double v6 = v224;
    }
    -[UILabel setFrame:](self->_logoLabel, "setFrame:", p_cachedLogoLabelRect->origin.x, self->_cachedLogoLabelRect.origin.y, self->_cachedLogoLabelRect.size.width, self->_cachedLogoLabelRect.size.height);
  }
  if (self->_dateLabel)
  {
    double v45 = v6;
    p_cachedDateLabelFrame = &self->_cachedDateLabelFrame;
    if (CGRectIsNull(self->_cachedDateLabelFrame))
    {
      double v47 = v9;
      -[UILabel sizeThatFits:](self->_dateLabel, "sizeThatFits:", v9, 1.79769313e308);
      double width = v48;
      double height = v50;
      v232.origin.double x = v15;
      v232.origin.CGFloat y = v16;
      v232.size.double width = v17;
      v232.size.double height = v18;
      double MinY = CGRectGetMinY(v232);
      if (!self->_timeLabel)
      {
        PKFloatRoundToPixel();
        double MinY = MinY + v53;
      }
      double x = v45 + -14.0 - width;
      p_cachedDateLabelFrame->origin.double x = x;
      self->_cachedDateLabelFrame.origin.CGFloat y = MinY;
      self->_cachedDateLabelFrame.size.double width = width;
      self->_cachedDateLabelFrame.size.double height = height;
    }
    else
    {
      double v47 = v9;
      double x = p_cachedDateLabelFrame->origin.x;
      double MinY = self->_cachedDateLabelFrame.origin.y;
      double width = self->_cachedDateLabelFrame.size.width;
      double height = self->_cachedDateLabelFrame.size.height;
    }
    -[UILabel setFrame:](self->_dateLabel, "setFrame:", x, MinY, width, height);
    double v6 = v45;
    double v9 = v47;
  }
  if (self->_timeLabel)
  {
    p_cachedTimeLabelFrame = &self->_cachedTimeLabelFrame;
    if (CGRectIsNull(self->_cachedTimeLabelFrame))
    {
      -[UILabel sizeThatFits:](self->_timeLabel, "sizeThatFits:", v9, 1.79769313e308);
      double v57 = v56;
      double v59 = v58;
      double v60 = v6 + -14.0 - v56;
      double MaxY = CGRectGetMaxY(self->_cachedDateLabelFrame);
      p_cachedTimeLabelFrame->origin.double x = v60;
      self->_cachedTimeLabelFrame.origin.CGFloat y = MaxY;
      self->_cachedTimeLabelFrame.size.double width = v57;
      self->_cachedTimeLabelFrame.size.double height = v59;
    }
    else
    {
      double v60 = p_cachedTimeLabelFrame->origin.x;
      double MaxY = self->_cachedTimeLabelFrame.origin.y;
      double v57 = self->_cachedTimeLabelFrame.size.width;
      double v59 = self->_cachedTimeLabelFrame.size.height;
    }
    -[UILabel setFrame:](self->_timeLabel, "setFrame:", v60, MaxY, v57, v59);
  }
  v62 = [(PKPassFaceView *)self backgroundView];
  [v62 bounds];
  double v64 = v63;
  double v66 = v65;
  double v68 = v67;
  double v70 = v69;

  if (self->_sectionColorView)
  {
    v233.origin.double x = MEMORY[0x1A62220C0](v3);
    -[UIView setFrame:](self->_sectionColorView, "setFrame:", 0.0, v225 - CGRectGetHeight(v233), v6);
    id v71 = [(PKPassFaceView *)self contentView];
    [v71 sendSubviewToBack:self->_sectionColorView];

    -[PKPassPosterEventTicketFaceView convertRect:toView:](self, "convertRect:toView:", self->_sectionColorView, v64, v66, v68, v70);
    -[UIView setFrame:](self->_sectionColorMaskView, "setFrame:");
    int v72 = [(UIView *)self->_sectionColorMaskView layer];
    v73 = [v72 mask];

    objc_msgSend(v73, "setFrame:", v64, v66, v68, v70);
    id v74 = [(PKPassFaceView *)self backgroundView];
    id v75 = [v74 image];

    id v76 = v75;
    objc_msgSend(v73, "setContents:", objc_msgSend(v76, "CGImage"));
  }
  secondaryLogoImageView = self->_secondaryLogoImageView;
  if (secondaryLogoImageView) {
    -[UIImageView setFrame:](secondaryLogoImageView, "setFrame:", v6 - self->_secondaryLogoSize.width + -14.0, v225 - self->_secondaryLogoSize.height + -14.0);
  }
  v234.origin.double x = MEMORY[0x1A62220C0](v3);
  CGFloat v78 = v234.origin.x;
  CGFloat y = v234.origin.y;
  CGFloat v80 = v234.size.width;
  CGFloat v81 = v234.size.height;
  CGRectGetMinY(v234);
  v235.origin.double x = v78;
  v235.origin.CGFloat y = y;
  v235.size.double width = v80;
  v235.size.double height = v81;
  double v221 = CGRectGetHeight(v235);
  PKEventTicketV2PassScaleFactor();
  PKFloatRoundToPixel();
  double v83 = v82;
  CGFloat v84 = *MEMORY[0x1E4F1DB20];
  double v85 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v87 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v86 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  double v88 = v86;
  CGFloat v223 = v87;
  double v89 = v85;
  double v90 = *MEMORY[0x1E4F1DB20];
  if (self->_venueLabel)
  {
    p_cachedVenueLabelFrame = &self->_cachedVenueLabelFrame;
    if (CGRectIsNull(self->_cachedVenueLabelFrame))
    {
      v92 = [(UILabel *)self->_secnamLabel font];
      v93 = [(UILabel *)self->_venueLabel font];
      id v94 = v93;
      double v95 = self->_secondaryLogoSize.width;
      double v213 = v84;
      double v216 = v83;
      if (self->_secnamLabel)
      {
        double rect = v85;
        double v96 = v95 + 14.0;
        BOOL v97 = v95 <= 0.0;
        double v98 = 0.0;
        if (!v97) {
          double v98 = v96;
        }
        double v99 = v218 - v98;
        -[UILabel sizeThatFits:](self->_venueLabel, "sizeThatFits:", v218 - v98, 1.79769313e308);
        double v101 = v100;
        double v103 = v102;
        [v92 _bodyLeading];
        v105.n128_u64[0] = v104;
        v106.n128_f64[0] = v99;
        PKSizeCeilToPixel(v106, v105, v107);
        double v109 = v108;
        double v111 = v110;
        [(UILabel *)self->_secnamLabel sizeThatFits:1.79769313e308];
        double v114 = v113;
        if (v112 > v109 || v221 < 120.0)
        {
          v116 = (void *)*MEMORY[0x1E4FB0930];
          v117 = (void *)*MEMORY[0x1E4FB28E0];
          uint64_t v118 = _PKFontForDesign(v4, (void *)*MEMORY[0x1E4FB0930], (void *)*MEMORY[0x1E4FB28E0], 0x8000, 32, 0);

          uint64_t v119 = _PKFontForDesign(v4, v116, v117, 0, 32, 0);
          [(UILabel *)self->_secnamLabel setFont:v118];
          [(UILabel *)self->_venueLabel setFont:v119];
          -[UILabel sizeThatFits:](self->_venueLabel, "sizeThatFits:", 1.79769313e308, v111);
          double v101 = v120;
          double v103 = v121;
          -[UILabel sizeThatFits:](self->_secnamLabel, "sizeThatFits:", 1.79769313e308, v111);
          double v114 = v122;
          id v94 = (void *)v119;
          v92 = (void *)v118;
        }
        if (v101 >= v99) {
          double v123 = v99;
        }
        else {
          double v123 = v101;
        }
        if (v112 >= v99) {
          double v124 = v99;
        }
        else {
          double v124 = v112;
        }
        double v85 = rect;
      }
      else
      {
        double v124 = *MEMORY[0x1E4F1DB30];
        double v114 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
        double v125 = v218 - v95 + -14.0;
        if (v220 < v125) {
          double v125 = v220;
        }
        if (v95 <= 0.0) {
          double v126 = v220;
        }
        else {
          double v126 = v125;
        }
        venueLabel = self->_venueLabel;
        [v93 _bodyLeading];
        PKFloatCeilToPixel();
        -[UILabel sizeThatFits:](venueLabel, "sizeThatFits:", 1.79769313e308, v128);
        if (v129 <= v126)
        {
          double v123 = v129;
          double v103 = v130;
        }
        else
        {
          id v131 = (id)_PKFontForDesign(v4, (void *)*MEMORY[0x1E4FB0930], (void *)*MEMORY[0x1E4FB28E0], 0, 32, 0);

          [(UILabel *)self->_venueLabel setFont:v131];
          -[UILabel sizeThatFits:](self->_venueLabel, "sizeThatFits:", v126, 1.79769313e308);
          double v123 = v132;
          double v103 = v133;
          id v94 = v131;
        }
      }
      [v94 descender];
      PKFloatCeilToPixel();
      double v135 = v225 - v103 + -14.0 - v134;
      p_cachedVenueLabelFrame->origin.double x = 14.0;
      self->_cachedVenueLabelFrame.origin.CGFloat y = v135;
      self->_cachedVenueLabelFrame.size.double width = v123;
      self->_cachedVenueLabelFrame.size.double height = v103;
      if (self->_secnamLabel)
      {
        double v136 = 14.0;
        double v137 = v123;
        double v138 = v103;
        CGFloat v139 = CGRectGetMinY(*(CGRect *)(&v135 - 1));
        self->_cachedSecnamLabelFrame.origin.double x = 14.0;
        self->_cachedSecnamLabelFrame.origin.CGFloat y = v139 - v114 + -2.0;
        self->_cachedSecnamLabelFrame.size.double width = v124;
        self->_cachedSecnamLabelFrame.size.double height = v114;
      }

      CGFloat v84 = v213;
      double v83 = v216;
    }
    double v90 = p_cachedVenueLabelFrame->origin.x;
    double v89 = self->_cachedVenueLabelFrame.origin.y;
    double v87 = self->_cachedVenueLabelFrame.size.width;
    double v88 = self->_cachedVenueLabelFrame.size.height;
    -[UILabel setFrame:](self->_venueLabel, "setFrame:", p_cachedVenueLabelFrame->origin.x, v89, v87, v88);
    secnamLabel = self->_secnamLabel;
    if (secnamLabel)
    {
      double v90 = self->_cachedSecnamLabelFrame.origin.x;
      double v89 = self->_cachedSecnamLabelFrame.origin.y;
      double v87 = self->_cachedSecnamLabelFrame.size.width;
      double v88 = self->_cachedSecnamLabelFrame.size.height;
      -[UILabel setFrame:](secnamLabel, "setFrame:", v90, v89, v87, v88);
    }
  }
  CGFloat v226 = v87;
  if (self->_secondaryBucketView)
  {
    p_cachedSecondaryBucketFrame = &self->_cachedSecondaryBucketFrame;
    if (CGRectIsNull(self->_cachedSecondaryBucketFrame))
    {
      double v217 = v83;
      if (self->_primaryFieldLabel)
      {
        v142 = [(PKDynamicPassBucketView *)self->_secondaryBucketView bucket];
        unint64_t v143 = [v142 count];

        double v144 = v83 + 24.0;
        if (v143 <= 1) {
          double v144 = v220;
        }
        double v145 = v218 - v144;
      }
      else
      {
        double v145 = v218;
      }
      -[PKDynamicPassBucketView fittedSizeFor:](self->_secondaryBucketView, "fittedSizeFor:", v145, 1.79769313e308);
      double v147 = v146;
      CGFloat v149 = v148;
      v150 = [(PKDynamicPassBucketView *)self->_secondaryBucketView labelFont];
      v151 = [(PKDynamicPassBucketView *)self->_secondaryBucketView resizedValueFont];
      v152 = v151;
      if (v151)
      {
        id v153 = v151;
      }
      else
      {
        id v153 = [(PKDynamicPassBucketView *)self->_secondaryBucketView valueFont];
      }
      v154 = v153;

      v236.origin.double x = v90;
      v236.origin.CGFloat y = v89;
      v236.size.double width = v87;
      v236.size.double height = v88;
      if (!CGRectIsNull(v236))
      {
        v237.origin.double x = v90;
        v237.origin.CGFloat y = v89;
        v237.size.double width = v87;
        v237.size.double height = v88;
        CGRectGetMinY(v237);
      }
      [v150 ascender];
      double v156 = v155;
      [v150 capHeight];
      v158.n128_f64[0] = v156 - v157;
      PKFloatFloorToPixel(v158, v159);
      [v154 descender];
      PKFloatFloorToPixel(v160, v161);
      PKFloatRoundToPixel();
      p_cachedSecondaryBucketFrame->origin.double x = v224 + -14.0 - v147;
      self->_cachedSecondaryBucketFrame.origin.CGFloat y = v162;
      self->_cachedSecondaryBucketFrame.size.double width = v147;
      self->_cachedSecondaryBucketFrame.size.double height = v149;

      double v83 = v217;
    }
    CGFloat v84 = p_cachedSecondaryBucketFrame->origin.x;
    double v85 = self->_cachedSecondaryBucketFrame.origin.y;
    CGFloat v86 = self->_cachedSecondaryBucketFrame.size.height;
    CGFloat v223 = self->_cachedSecondaryBucketFrame.size.width;
    -[PKDynamicPassBucketView setFrame:](self->_secondaryBucketView, "setFrame:", p_cachedSecondaryBucketFrame->origin.x, v85);
  }
  if (self->_primaryFieldLabel)
  {
    p_cachedPrimaryFieldFrame = &self->_cachedPrimaryFieldFrame;
    if (CGRectIsNull(self->_cachedPrimaryFieldFrame))
    {
      v164 = [(PKDynamicPassBucketView *)self->_secondaryBucketView bucket];
      unint64_t v165 = [v164 count];

      CGFloat recta = v85;
      double v219 = v86;
      if (self->_secondaryBucketView)
      {
        if (v165 <= 1) {
          double v166 = v220;
        }
        else {
          double v166 = v83;
        }
      }
      else
      {
        PKFloatRoundToPixel();
        double v166 = v167;
      }
      PKEventTicketV2PassScaleFactor();
      double v169 = v168;
      v170 = [(UILabel *)self->_primaryFieldLabel font];
      primaryFieldLabel = self->_primaryFieldLabel;
      [v170 _bodyLeading];
      PKFloatCeilToPixel();
      -[UILabel sizeThatFits:](primaryFieldLabel, "sizeThatFits:", 1.79769313e308, v172);
      double v174 = v173;
      double v176 = v175;
      if (v173 <= v166) {
        goto LABEL_90;
      }
      if (self->_secondaryBucketView && v165 >= 2)
      {
        v177 = PKFontForDefaultDesign(v4, (void *)*MEMORY[0x1E4FB2908], 2, 0, *MEMORY[0x1E4FB09B8]);
        [v177 pointSize];
        id v179 = [v177 fontWithSize:round(v169 * v178 + v169 * v178) * 0.5];

        [(UILabel *)self->_primaryFieldLabel setFont:v179];
        v180 = self->_primaryFieldLabel;
        [v179 _bodyLeading];

        PKFloatCeilToPixel();
        -[UILabel sizeThatFits:](v180, "sizeThatFits:", 1.79769313e308, v181);
        double v174 = v182;
        double v176 = v183;

        v170 = v179;
      }
      if (v174 <= v166)
      {
LABEL_90:
        CGFloat v188 = v219;
      }
      else
      {
        double v184 = *MEMORY[0x1E4FB09B8];
        double v185 = v166;
        if (v165 < 2)
        {
          v186 = PKFontForDefaultDesign(v4, (void *)*MEMORY[0x1E4FB2990], 2, 0, v184);
          [v186 pointSize];
        }
        else
        {
          v186 = PKFontForDefaultDesign(v4, (void *)*MEMORY[0x1E4FB2950], 2, 0, v184);
          double v187 = 13.5;
        }
        CGFloat v188 = v219;
        v189 = [v186 fontWithSize:round(v169 * v187 + v169 * v187) * 0.5];

        id v190 = v189;
        [(UILabel *)self->_primaryFieldLabel setFont:v190];

        -[UILabel sizeThatFits:](self->_primaryFieldLabel, "sizeThatFits:", v185, 1.79769313e308);
        double v174 = v191;
        double v176 = v192;
        v170 = v190;
      }
      secondaryBucketView = self->_secondaryBucketView;
      if (secondaryBucketView && v165 >= 2)
      {
        v194 = [(PKDynamicPassBucketView *)secondaryBucketView resizedValueFont];
        v195 = v194;
        if (v194)
        {
          id v196 = v194;
        }
        else
        {
          id v196 = [(PKDynamicPassBucketView *)self->_secondaryBucketView valueFont];
        }
        v206 = v196;

        v240.origin.double x = v84;
        v240.origin.CGFloat y = recta;
        v240.size.double width = v223;
        v240.size.double height = v188;
        CGFloat v207 = CGRectGetMaxY(v240) - v176;
        [v206 descender];
        PKFloatCeilToPixel();
        CGFloat v209 = v207 + v208;
        [v170 descender];
        PKFloatCeilToPixel();
        double v205 = v209 - v210;
        [v170 _bodyLeading];
        PKFloatCeilToPixel();
        if (v176 <= v211)
        {
          [v206 capHeight];
          [v170 capHeight];
          PKFloatRoundToPixel();
          double v205 = v205 - v212;
        }
      }
      else
      {
        v238.origin.double x = v90;
        v238.origin.CGFloat y = v89;
        v238.size.double width = v226;
        v238.size.double height = v88;
        if (!CGRectIsNull(v238))
        {
          v239.origin.double x = v90;
          v239.origin.CGFloat y = v89;
          v239.size.double width = v226;
          v239.size.double height = v88;
          CGRectGetMinY(v239);
        }
        [v170 ascender];
        double v198 = v197;
        [v170 capHeight];
        v200.n128_f64[0] = v198 - v199;
        PKFloatFloorToPixel(v200, v201);
        [v170 descender];
        PKFloatFloorToPixel(v202, v203);
        PKFloatRoundToPixel();
        double v205 = v204;
      }
      p_cachedPrimaryFieldFrame->origin.double x = 14.0;
      self->_cachedPrimaryFieldFrame.origin.CGFloat y = v205;
      self->_cachedPrimaryFieldFrame.size.double width = v174;
      self->_cachedPrimaryFieldFrame.size.double height = v176;
    }
    -[UILabel setFrame:](self->_primaryFieldLabel, "setFrame:", p_cachedPrimaryFieldFrame->origin.x, self->_cachedPrimaryFieldFrame.origin.y, self->_cachedPrimaryFieldFrame.size.width, self->_cachedPrimaryFieldFrame.size.height);
  }
}

- (void)setRelevancyActive:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(PKPassFrontFaceView *)self isRelevancyActive];
  v6.receiver = self;
  v6.super_class = (Class)PKPassPosterEventTicketFaceView;
  [(PKPassFrontFaceView *)&v6 setRelevancyActive:v3];
  if (v5 != v3 && self->_sectionColorView)
  {
    if (v3) {
      -[PKPassFrontFaceView insertContentView:ofType:](self, "insertContentView:ofType:");
    }
    else {
      -[PKPassFaceView removeContentView:ofType:](self, "removeContentView:ofType:");
    }
    [(PKPassPosterEventTicketFaceView *)self _updateBodyLabelColorsForRelevancyActive:v3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_venueLabel, 0);
  objc_storeStrong((id *)&self->_secnamLabel, 0);
  objc_storeStrong((id *)&self->_secondaryBucketView, 0);
  objc_storeStrong((id *)&self->_primaryFieldLabel, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_sectionColorMaskView, 0);
  objc_storeStrong((id *)&self->_sectionColorView, 0);
  objc_storeStrong((id *)&self->_secondaryLogoImageView, 0);

  objc_storeStrong((id *)&self->_logoLabel, 0);
}

@end