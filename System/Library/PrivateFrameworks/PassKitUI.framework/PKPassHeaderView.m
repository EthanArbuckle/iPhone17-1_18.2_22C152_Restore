@interface PKPassHeaderView
- ($B75038A793E8936108FFEDE39FC44C1F)passSizeInfoForHeight:(SEL)a3;
- (BOOL)expiredPass;
- (BOOL)isSmall;
- (BOOL)showModificationDate;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPass)pass;
- (PKPassFaceViewRendererState)rendererState;
- (PKPassHeaderView)initWithPass:(id)a3;
- (PKPassHeaderView)initWithPass:(id)a3 rendererState:(id)a4;
- (PKPassHeaderViewDelegate)delegate;
- (PKPassLibraryDataProvider)passLibraryOverride;
- (PKPassView)passView;
- (PKPeerPaymentAccount)peerPaymentAccount;
- (UIColor)primaryTextColor;
- (UIColor)secondaryTextColor;
- (id)_primaryTextColor;
- (id)_secondaryTextColor;
- (unint64_t)suppressedContent;
- (void)_passLibraryDidChange:(id)a3;
- (void)_resetFonts;
- (void)_updateContent;
- (void)_updateTextContent;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setExpiredPass:(BOOL)a3;
- (void)setPass:(id)a3;
- (void)setPassLibraryOverride:(id)a3;
- (void)setPeerPaymentAccount:(id)a3;
- (void)setPrimaryTextColor:(id)a3;
- (void)setRendererState:(id)a3;
- (void)setSecondaryTextColor:(id)a3;
- (void)setShowModificationDate:(BOOL)a3;
- (void)setSmall:(BOOL)a3;
- (void)setSuppressedContent:(unint64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateModifiedDate;
- (void)updateShadow:(double)a3;
@end

@implementation PKPassHeaderView

- (PKPassHeaderView)initWithPass:(id)a3
{
  return [(PKPassHeaderView *)self initWithPass:a3 rendererState:0];
}

- (PKPassHeaderView)initWithPass:(id)a3 rendererState:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v39.receiver = self;
  v39.super_class = (Class)PKPassHeaderView;
  v9 = -[PKPassHeaderView initWithFrame:](&v39, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v10 = v9;
  if (v9)
  {
    id v38 = v7;
    p_pass = (id *)&v9->_pass;
    objc_storeStrong((id *)&v9->_pass, a3);
    objc_storeStrong((id *)&v10->_rendererState, a4);
    *(_OWORD *)&v10->_contentInsets.top = StandardContentInsets;
    *(_OWORD *)&v10->_contentInsets.bottom = unk_1A0445310;
    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    if ([*p_pass isRemotePass])
    {
      [v12 addObserver:v10 selector:sel__passLibraryDidChange_ name:*MEMORY[0x1E4F87558] object:0];
    }
    else
    {
      v13 = [*p_pass dataAccessor];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_storeStrong((id *)&v10->_remoteDataAccessor, v13);
        uint64_t v14 = *MEMORY[0x1E4F87558];
        v15 = [(PKRemoteDataAccessor *)v10->_remoteDataAccessor library];
        [v12 addObserver:v10 selector:sel__passLibraryDidChange_ name:v14 object:v15];
      }
    }
    v16 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    passMaskView = v10->_passMaskView;
    v10->_passMaskView = v16;

    v18 = (void *)MEMORY[0x1E4FB1818];
    v19 = PKPassKitUIBundle();
    v20 = [v18 imageNamed:@"CardDetail_PassPocket" inBundle:v19];

    v21 = objc_msgSend(v20, "imageWithAlignmentRectInsets:", 0.0, 15.0, 0.0, 15.0);

    v22 = objc_msgSend(v21, "pkui_resizableImageByTilingCenterPixel");

    uint64_t v23 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v22];
    maskShadow = v10->_maskShadow;
    v10->_maskShadow = (UIImageView *)v23;

    v25 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    title = v10->_title;
    v10->_title = v25;

    [(UILabel *)v10->_title setNumberOfLines:2];
    v27 = v10->_title;
    v28 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v27 setBackgroundColor:v28];

    v29 = v10->_title;
    v30 = [(PKPassHeaderView *)v10 _primaryTextColor];
    [(UILabel *)v29 setTextColor:v30];

    [(UILabel *)v10->_title setMinimumScaleFactor:0.6];
    [(UILabel *)v10->_title setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v10->_title setLineBreakMode:4];
    [(UILabel *)v10->_title setTextAlignment:1];
    [(UILabel *)v10->_title setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
    v31 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    subtitle = v10->_subtitle;
    v10->_subtitle = v31;

    [(UILabel *)v10->_subtitle setMinimumScaleFactor:0.6];
    [(UILabel *)v10->_subtitle setAdjustsFontSizeToFitWidth:1];
    v33 = v10->_subtitle;
    v34 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v33 setBackgroundColor:v34];

    v35 = v10->_subtitle;
    v36 = [(PKPassHeaderView *)v10 _secondaryTextColor];
    [(UILabel *)v35 setTextColor:v36];

    [(UILabel *)v10->_subtitle setAccessibilityIdentifier:*MEMORY[0x1E4F85A60]];
    [(PKPassHeaderView *)v10 _resetFonts];
    [(UIView *)v10->_passMaskView addSubview:v10->_maskShadow];
    [(PKPassHeaderView *)v10 addSubview:v10->_passMaskView];
    [(PKPassHeaderView *)v10 addSubview:v10->_title];
    [(PKPassHeaderView *)v10 addSubview:v10->_subtitle];
    [(PKPassHeaderView *)v10 _updateContent];
    [(PKPassHeaderView *)v10 setAccessibilityIdentifier:*MEMORY[0x1E4F855D8]];

    id v7 = v38;
  }

  return v10;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PKPassHeaderView;
  [(PKPassHeaderView *)&v4 dealloc];
}

- (void)layoutSubviews
{
  v75.receiver = self;
  v75.super_class = (Class)PKPassHeaderView;
  [(PKPassHeaderView *)&v75 layoutSubviews];
  [(PKPassHeaderView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  memset(&slice, 0, sizeof(slice));
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double v11 = v3 + left;
  double v12 = v6 + top;
  double v13 = v8 - (left + self->_contentInsets.right);
  double v15 = v14 - (top + self->_contentInsets.bottom);
  remainder.origin.x = v3 + left;
  remainder.origin.y = v6 + top;
  remainder.size.width = v13;
  remainder.size.height = v15;
  CGFloat sx = 0.0;
  long long v70 = 0u;
  *(_OWORD *)amount = 0u;
  [(PKPassHeaderView *)self passSizeInfoForHeight:self->passImageHeight];
  -[UIView setFrame:](self->_passMaskView, "setFrame:", v4 + -44.0, v6 + -44.0, v8 + 88.0, self->_contentInsets.top + 44.0 + 0.0);
  if ([(UIView *)self->_passMaskView clipsToBounds]) {
    [(UIView *)self->_passMaskView setClipsToBounds:0];
  }
  [(UIImageView *)self->_maskShadow setAlpha:(double)0];
  v16 = [(PKPassView *)self->_passView layer];
  CATransform3DMakeScale(&v69, sx, sx, 1.0);
  [v16 setTransform:&v69];
  [v16 bounds];
  double v18 = v17;
  double v68 = v19;
  [v16 anchorPoint];
  double v21 = v20;
  double v23 = v22;
  v76.origin.x = v11;
  v76.origin.y = v12;
  v76.size.width = v13;
  v76.size.height = v15;
  CGRectDivide(v76, &slice, &remainder, amount[1], CGRectMinYEdge);
  PKSizeAlignedInRect();
  unint64_t v25 = *(void *)&v24;
  unint64_t v27 = *(void *)&v26;
  unint64_t v29 = v28;
  unint64_t v31 = v30;
  v32.n128_f64[0] = sx;
  v33.n128_f64[0] = v24 + 44.0 + v21 * v18 * sx;
  v34.n128_f64[0] = v26 + 44.0 + v23 * v68 * sx;
  PKPointRoundToPixel(v33, v34, v32);
  objc_msgSend(v16, "setPosition:");
  [(UIImageView *)self->_maskShadow pkui_alignmentRect];
  v35.n128_u64[0] = v25;
  v36.n128_u64[0] = v27;
  v37.n128_u64[0] = v29;
  v38.n128_u64[0] = v31;
  PKRectRoundToPixel(v35, v36, v37, v38, v39);
  PKSizeAlignedInRect();
  -[UIImageView pkui_setAlignmentRect:](self->_maskShadow, "pkui_setAlignmentRect:", v40 + 44.0, v41 + 44.0);
  v42 = [(UILabel *)self->_title font];
  [v42 _bodyLeading];
  double v44 = v43;

  v45 = [(UILabel *)self->_subtitle font];
  [v45 _bodyLeading];
  double v47 = v46;

  v48.n128_f64[0] = v44 * 0.2682;
  PKFloatFloorToPixel(v48, v49);
  CGRectDivide(remainder, &slice, &remainder, v50, CGRectMinYEdge);
  [(UILabel *)self->_title minimumScaleFactor];
  double v52 = v51;
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_title, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width / v51, remainder.size.height / v51);
  v55.n128_f64[0] = fmax(fmin(fmin(remainder.size.width / v53, 1.0), fmin(remainder.size.height / v54, 1.0)), v52);
  v56.n128_f64[0] = v53 * v55.n128_f64[0];
  v57.n128_f64[0] = v54 * v55.n128_f64[0];
  PKSizeCeilToPixel(v56, v57, v55);
  CGRectDivide(remainder, &slice, &remainder, v58, CGRectMinYEdge);
  title = self->_title;
  PKSizeAlignedInRect();
  -[UILabel setFrame:](title, "setFrame:");
  v60 = [(UILabel *)self->_subtitle text];
  uint64_t v61 = [v60 length];

  if (v61)
  {
    v62.n128_f64[0] = v47 * 0.1111;
    PKFloatFloorToPixel(v62, v63);
    CGRectDivide(remainder, &slice, &remainder, v64, CGRectMinYEdge);
    -[UILabel pkui_sizeThatFits:](self->_subtitle, "pkui_sizeThatFits:", remainder.size.width, remainder.size.height);
    CGRectDivide(remainder, &slice, &remainder, v65, CGRectMinYEdge);
    subtitle = self->_subtitle;
    PKSizeAlignedInRect();
    -[UILabel setFrame:](subtitle, "setFrame:");
  }
  v62.n128_f64[0] = v44 * 0.1219;
  PKFloatFloorToPixel(v62, v63);
  CGRectDivide(remainder, &slice, &remainder, v67, CGRectMinYEdge);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  self->passImageHeight = a3.height;
  -[PKPassHeaderView passSizeInfoForHeight:](self, "passSizeInfoForHeight:", a3.height, 0, 0, 0);
  double v6 = [(UILabel *)self->_title font];
  [v6 _bodyLeading];
  double v8 = v7;

  v9 = [(UILabel *)self->_subtitle font];
  [v9 _bodyLeading];
  double v11 = v10;

  double bottom = self->_contentInsets.bottom;
  double v13 = width - self->_contentInsets.left - self->_contentInsets.right + -12.0;
  double v14 = height - self->_contentInsets.top - bottom;
  v15.n128_u64[0] = 0;
  CGFloat v16 = self->_contentInsets.top + bottom + 0.0;
  v17.n128_f64[0] = v8 * 0.2682;
  PKFloatFloorToPixel(v17, v15);
  CGFloat v19 = v16 + v18;
  [(UILabel *)self->_title minimumScaleFactor];
  double v21 = v20;
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_title, "pkui_sizeThatFits:forceWordWrap:", 1, v13 / v20, v14 / v20);
  v24.n128_f64[0] = fmax(fmin(fmin(v13 / v22, 1.0), fmin(v13 / v23, 1.0)), v21);
  v25.n128_f64[0] = v22 * v24.n128_f64[0];
  v26.n128_f64[0] = v23 * v24.n128_f64[0];
  PKSizeCeilToPixel(v25, v26, v24);
  double v28 = v19 + v27;
  unint64_t v29 = [(UILabel *)self->_subtitle text];
  uint64_t v30 = [v29 length];

  if (v30)
  {
    v31.n128_f64[0] = v11 * 0.1111;
    PKFloatFloorToPixel(v31, v32);
    double v34 = v28 + v33;
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_subtitle, "pkui_sizeThatFits:forceWordWrap:", 1, v13, v14);
    double v28 = v34 + v32.n128_f64[0];
  }
  v31.n128_f64[0] = v8 * 0.1219;
  PKFloatFloorToPixel(v31, v32);
  double v36 = self->_contentInsets.top + v28 + v35 + self->_contentInsets.bottom;
  double v37 = width;
  result.double height = v36;
  result.double width = v37;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPassHeaderView;
  [(PKPassHeaderView *)&v10 traitCollectionDidChange:v4];
  uint64_t v5 = [(PKPassHeaderView *)self traitCollection];
  double v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      double v7 = [v4 preferredContentSizeCategory];
      double v8 = [v6 preferredContentSizeCategory];
      NSComparisonResult v9 = UIContentSizeCategoryCompareToCategory(v7, v8);

      if (v9) {
        [(PKPassHeaderView *)self _resetFonts];
      }
    }
  }
}

- (void)updateShadow:(double)a3
{
  id v5 = [(PKPassView *)self->_passView layer];
  double v4 = fmin(fmax(a3, 0.0), 1.0) * 0.25;
  *(float *)&double v4 = v4;
  [v5 setShadowOpacity:v4];
}

- ($B75038A793E8936108FFEDE39FC44C1F)passSizeInfoForHeight:(SEL)a3
{
  retstr->var2 = 0.0;
  retstr->var0 = 0u;
  retstr->var1 = 0u;
  [(PKPassView *)self->_passView sizeOfFront];
  double v8 = v7;
  double v10 = v9;
  BOOL v11 = [(UIView *)self pkui_userInterfaceIdiomSupportsLargeLayouts];
  double v12 = 98.0;
  if (v11) {
    double v12 = 128.0;
  }
  double v13 = v12 / v8;
  CGFloat v14 = floor(v10 * v13);
  retstr->var0.double width = v12;
  retstr->var0.double height = v14;
  CGFloat v15 = fmin(v14, a4);
  retstr->var1.double width = v12;
  retstr->var1.double height = v15;
  retstr->var2 = v13;
  [(PKPass *)self->_pass thumbnailRect];
  double v17 = CGRectGetMaxY(v18) * v13 + 1.0;
  if (v15 < v17) {
    retstr->var1.double height = v17;
  }
  return result;
}

- (void)_updateContent
{
  passView = self->_passView;
  if (passView)
  {
    double v4 = [(PKPassView *)passView layer];
    [v4 shadowOpacity];
    float v6 = v5;

    double v7 = self->_passView;
    if (v7)
    {
      CGFloat v16 = v7;
      [(PKPassView *)self->_passView removeFromSuperview];
      double v8 = self->_passView;
      self->_passView = 0;
    }
    else
    {
      CGFloat v16 = 0;
    }
  }
  else
  {
    CGFloat v16 = 0;
    float v6 = 0.25;
  }
  unint64_t suppressedContent = self->_suppressedContent;
  if (self->_rendererState && !PKIsLowEndDevice()) {
    uint64_t v10 = 1527;
  }
  else {
    uint64_t v10 = 2039;
  }
  BOOL v11 = [[PKPassView alloc] initWithPass:self->_pass content:4 suppressedContent:suppressedContent | v10 rendererState:self->_rendererState];
  double v12 = self->_passView;
  self->_passView = v11;

  [(PKPassView *)self->_passView setUserInteractionEnabled:0];
  [(PKPassView *)self->_passView setModallyPresented:1];
  [(PKPassView *)self->_passView setPaused:1];
  [(PKPassView *)self->_passView sizeToFit];
  double v13 = [(PKPassView *)self->_passView layer];
  [v13 setShouldRasterize:1];
  [v13 setRasterizationScale:PKUIScreenScale()];
  id v14 = [MEMORY[0x1E4FB1618] blackColor];
  objc_msgSend(v13, "setShadowColor:", objc_msgSend(v14, "CGColor"));

  *(float *)&double v15 = v6;
  [v13 setShadowOpacity:v15];
  objc_msgSend(v13, "setShadowOffset:", 0.0, 12.0);
  [v13 setShadowRadius:18.0];
  [(UIView *)self->_passMaskView insertSubview:self->_passView belowSubview:self->_maskShadow];
  [(PKPassHeaderView *)self _updateTextContent];
  [(PKPassHeaderView *)self setNeedsLayout];
}

- (void)_updateTextContent
{
  if ([(PKPass *)self->_pass passType] == PKPassTypeSecureElement) {
    pass = self->_pass;
  }
  else {
    pass = 0;
  }
  double v23 = pass;
  title = self->_title;
  float v5 = [(PKPass *)self->_pass localizedDescription];
  [(UILabel *)title setText:v5];

  if (v23)
  {
    if ([(PKPass *)self->_pass passType] == PKPassTypeSecureElement)
    {
      float v6 = [(PKPass *)v23 passLocalizedStringForKey:@"PASS_DETAIL_PASS_SUBTITLE_TEXT"];
      if (!PKEqualObjects())
      {
LABEL_31:
        [(UILabel *)self->_subtitle setText:v6];
        subtitle = self->_subtitle;
        double v22 = [(PKPassHeaderView *)self _secondaryTextColor];
        [(UILabel *)subtitle setTextColor:v22];

        [(UILabel *)self->_subtitle sizeToFit];
LABEL_32:

        goto LABEL_33;
      }
      if ([(PKPass *)v23 isTransitPass])
      {
        double v7 = @"TRANSIT_CARD";
LABEL_9:
        uint64_t v8 = PKLocalizedPaymentString(&v7->isa);
LABEL_21:
        double v17 = (void *)v8;

        float v6 = v17;
        goto LABEL_31;
      }
      if ([(PKPass *)v23 isIdentityPass])
      {
        uint64_t v8 = PKLocalizedIdentityString(&cfstr_GovernmentId.isa);
        goto LABEL_21;
      }
      if ([(PKPass *)v23 supportsBarcodePayment])
      {
        uint64_t v8 = PKLocalizedAquamanString(&cfstr_QrPaymentPass.isa);
        goto LABEL_21;
      }
      if ([(PKPass *)v23 isAccessPass])
      {
        switch([(PKPass *)v23 accessType])
        {
          case 0:
          case 2:
            double v7 = @"ACCESS_BADGE";
            goto LABEL_9;
          case 1:
          case 3:
          case 6:
            double v7 = @"GENERIC_KEY_PASS";
            goto LABEL_9;
          case 4:
            uint64_t v8 = PKLocalizedCredentialString(&cfstr_CarKeyPass.isa);
            goto LABEL_21;
          case 5:
            double v7 = @"RESIDENT_KEY_PASS";
            goto LABEL_9;
          default:
            goto LABEL_31;
        }
        goto LABEL_31;
      }
      if ([(PKPass *)v23 isAppleBalancePass])
      {
        CGRect v18 = [MEMORY[0x1E4F843F0] sharedInstance];
        CGFloat v19 = [v18 appleAccountInformation];
        uint64_t v20 = [v19 appleID];

        float v6 = (void *)v20;
        if (!v20)
        {
          float v6 = PKLocalizedPaymentString(&cfstr_PaymentCard.isa);
        }
        goto LABEL_31;
      }
      if (![(PKPass *)v23 isPayLaterPass])
      {
        double v7 = @"PAYMENT_CARD";
        goto LABEL_9;
      }
    }
    float v6 = 0;
    goto LABEL_31;
  }
  if (self->_showModificationDate)
  {
    float v6 = [(PKPass *)self->_pass modifiedDate];
    if (v6)
    {
      double v9 = PKRelativeDateString();
      uint64_t v10 = PKLocalizedString(&cfstr_LastUpdatedFor.isa, &stru_1EF1B4C70.isa, v9);
    }
    else
    {
      uint64_t v10 = 0;
    }
    [(UILabel *)self->_subtitle setText:v10];
    double v15 = self->_subtitle;
    CGFloat v16 = [(PKPassHeaderView *)self _secondaryTextColor];
    [(UILabel *)v15 setTextColor:v16];

    [(UILabel *)self->_subtitle sizeToFit];
    goto LABEL_32;
  }
  if (self->_expiredPass)
  {
    BOOL v11 = self->_subtitle;
    double v12 = [MEMORY[0x1E4FB1618] systemRedColor];
    [(UILabel *)v11 setTextColor:v12];

    double v13 = self->_subtitle;
    id v14 = PKLocalizedString(&cfstr_NfcPassExpired.isa);
    [(UILabel *)v13 setText:v14];

    [(UILabel *)self->_subtitle sizeToFit];
  }
LABEL_33:
  [(PKPassHeaderView *)self setNeedsLayout];
}

- (void)_resetFonts
{
  if (self->_small) {
    uint64_t v3 = 32770;
  }
  else {
    uint64_t v3 = 0x8000;
  }
  title = self->_title;
  float v5 = (void *)*MEMORY[0x1E4FB2790];
  float v6 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2988], (void *)*MEMORY[0x1E4FB2790], v3, 0);
  [(UILabel *)title setFont:v6];

  subtitle = self->_subtitle;
  uint64_t v8 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2950], v5, 0x8000, 0);
  [(UILabel *)subtitle setFont:v8];

  [(PKPassHeaderView *)self setNeedsLayout];
}

- (void)updateModifiedDate
{
  if (self->_subtitle)
  {
    id v5 = [(PKPass *)self->_pass modifiedDate];
    if (v5)
    {
      uint64_t v3 = PKRelativeDateString();
      double v4 = PKLocalizedString(&cfstr_LastUpdatedFor.isa, &stru_1EF1B4C70.isa, v3);
    }
    else
    {
      double v4 = 0;
    }
    [(UILabel *)self->_subtitle setText:v4];
    [(UILabel *)self->_subtitle sizeToFit];
    [(PKPassHeaderView *)self setNeedsLayout];
  }
}

- (void)_passLibraryDidChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__PKPassHeaderView__passLibraryDidChange___block_invoke;
  v6[3] = &unk_1E59CA870;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __42__PKPassHeaderView__passLibraryDidChange___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(*(void *)(a1 + 32) + 496) isRemotePass];
  int v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 496);
  if (v5) {
    BOOL v6 = v2 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (!v5) {
      return;
    }
  }
  else
  {
    id v7 = [*(id *)(a1 + 40) object];

    if (v7) {
      return;
    }
    uint64_t v4 = *(void *)(a1 + 32);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__PKPassHeaderView__passLibraryDidChange___block_invoke_2;
  aBlock[3] = &unk_1E59DC900;
  aBlock[4] = v4;
  uint64_t v8 = (void (**)(void *, void *))_Block_copy(aBlock);
  uint64_t v9 = *(void *)(a1 + 32);
  if (v3 && (uint64_t v10 = *(void **)(v9 + 560)) != 0)
  {
    BOOL v11 = [*(id *)(v9 + 496) passTypeIdentifier];
    double v12 = [*(id *)(*(void *)(a1 + 32) + 496) serialNumber];
    double v13 = [v10 passWithPassTypeIdentifier:v11 serialNumber:v12];
  }
  else
  {
    BOOL v11 = [*(id *)(v9 + 408) library];
    double v12 = [*(id *)(*(void *)(a1 + 32) + 496) passTypeIdentifier];
    id v14 = [*(id *)(*(void *)(a1 + 32) + 496) serialNumber];
    double v13 = [v11 passWithPassTypeIdentifier:v12 serialNumber:v14];
  }
  v8[2](v8, v13);
}

void __42__PKPassHeaderView__passLibraryDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  if (v4)
  {
    if ([*(id *)(v5 + 496) isEqualToPassIncludingMetadata:v4]) {
      goto LABEL_6;
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 496), a2);
    [*(id *)(a1 + 32) _updateContent];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 552));
    [WeakRetained passHeaderViewDidChangePass:*(void *)(a1 + 32)];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v5 + 552));
    [WeakRetained passHeaderViewPassWasDeleted:*(void *)(a1 + 32)];
  }

LABEL_6:
}

- (void)setPeerPaymentAccount:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_peerPaymentAccount, a3);
    [(PKPassHeaderView *)self _updateTextContent];
  }
}

- (void)setRendererState:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_rendererState, a3);
    [(PKPassHeaderView *)self _updateContent];
  }
}

- (void)setSuppressedContent:(unint64_t)a3
{
  if (self->_suppressedContent != a3)
  {
    self->_unint64_t suppressedContent = a3;
    [(PKPassView *)self->_passView setSuppressedContent:a3 | 0x7F7];
  }
}

- (void)setShowModificationDate:(BOOL)a3
{
  if (((!self->_showModificationDate ^ a3) & 1) == 0)
  {
    self->_showModificationDate = a3;
    [(PKPassHeaderView *)self _updateTextContent];
  }
}

- (void)setExpiredPass:(BOOL)a3
{
  if (((!self->_expiredPass ^ a3) & 1) == 0)
  {
    self->_expiredPass = a3;
    [(PKPassHeaderView *)self _updateTextContent];
  }
}

- (id)_primaryTextColor
{
  primaryTextColor = self->_primaryTextColor;
  if (primaryTextColor)
  {
    int v3 = primaryTextColor;
  }
  else
  {
    int v3 = [MEMORY[0x1E4FB1618] labelColor];
  }

  return v3;
}

- (id)_secondaryTextColor
{
  secondaryTextColor = self->_secondaryTextColor;
  if (secondaryTextColor)
  {
    int v3 = secondaryTextColor;
  }
  else
  {
    int v3 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }

  return v3;
}

- (void)setPrimaryTextColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_primaryTextColor != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_primaryTextColor, a3);
    BOOL v6 = [(PKPassHeaderView *)self _primaryTextColor];
    [(UILabel *)self->_title setTextColor:v6];

    id v5 = v7;
  }
}

- (void)setSecondaryTextColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_secondaryTextColor != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_secondaryTextColor, a3);
    BOOL v6 = [(PKPassHeaderView *)self _secondaryTextColor];
    [(UILabel *)self->_subtitle setTextColor:v6];

    id v5 = v7;
  }
}

- (void)setSmall:(BOOL)a3
{
  if (((!self->_small ^ a3) & 1) == 0)
  {
    self->_small = a3;
    if (a3) {
      int v3 = &SmallContentInsets;
    }
    else {
      int v3 = &StandardContentInsets;
    }
    long long v4 = v3[1];
    *(_OWORD *)&self->_contentInsets.double top = *v3;
    *(_OWORD *)&self->_contentInsets.double bottom = v4;
    [(PKPassHeaderView *)self _resetFonts];
  }
}

- (void)setPass:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToPassIncludingMetadata:self->_pass] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_pass, a3);
    [(PKPassHeaderView *)self _updateContent];
  }
}

- (PKPass)pass
{
  return self->_pass;
}

- (PKPassView)passView
{
  return self->_passView;
}

- (BOOL)isSmall
{
  return self->_small;
}

- (PKPeerPaymentAccount)peerPaymentAccount
{
  return self->_peerPaymentAccount;
}

- (PKPassFaceViewRendererState)rendererState
{
  return self->_rendererState;
}

- (unint64_t)suppressedContent
{
  return self->_suppressedContent;
}

- (BOOL)showModificationDate
{
  return self->_showModificationDate;
}

- (BOOL)expiredPass
{
  return self->_expiredPass;
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (UIColor)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (PKPassHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPassHeaderViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKPassLibraryDataProvider)passLibraryOverride
{
  return self->_passLibraryOverride;
}

- (void)setPassLibraryOverride:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passLibraryOverride, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_storeStrong((id *)&self->_rendererState, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_passView, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_maskShadow, 0);
  objc_storeStrong((id *)&self->_passMaskView, 0);

  objc_storeStrong((id *)&self->_remoteDataAccessor, 0);
}

@end