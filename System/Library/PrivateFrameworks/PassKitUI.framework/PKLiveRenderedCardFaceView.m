@interface PKLiveRenderedCardFaceView
+ (BOOL)replacesContentForType:(unint64_t)a3;
- (BOOL)requiresFaceImage;
- (PKLiveRenderedCardFaceView)init;
- (PKLiveRenderedCardFaceView)initWithFrame:(CGRect)a3;
- (PKLiveRenderedCardFaceView)initWithFrame:(CGRect)a3 pass:(id)a4;
- (UIColor)faceImageAverageColor;
- (UIEdgeInsets)faceImageAlignmentInsets;
- (UIEdgeInsets)faceImageContentInsets;
- (UIImage)faceImage;
- (void)_showState:(unint64_t)a3 animated:(BOOL)a4;
- (void)_updateFaceImage;
- (void)clearFaceImage;
- (void)dealloc;
- (void)didAuthenticate;
- (void)didDismiss;
- (void)didPresent;
- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4;
- (void)invalidate;
- (void)layoutSubviews;
- (void)setFaceImage:(id)a3 withAverageColor:(id)a4 alignmentInsets:(UIEdgeInsets)a5 contentInsets:(UIEdgeInsets)a6;
- (void)setMotionEnabled:(BOOL)a3;
@end

@implementation PKLiveRenderedCardFaceView

- (void)clearFaceImage
{
  faceImage = self->_faceImage;
  if (faceImage)
  {
    self->_faceImage = 0;

    faceImageAverageColor = self->_faceImageAverageColor;
    self->_faceImageAverageColor = 0;

    self->_usingFaceImage = 0;
    [(PKLiveRenderedCardFaceView *)self _updateFaceImage];
  }
}

+ (BOOL)replacesContentForType:(unint64_t)a3
{
  return a3 == 2;
}

- (void)setMotionEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    BOOL v3 = a3;
    self->_enabled = a3;
    -[PKTexturedCardView setMotionEnabled:](self->_texturedCardView, "setMotionEnabled:");
    payLaterCardView = self->_payLaterCardView;
    [(PKPayLaterCardView *)payLaterCardView setMotionEnabled:v3];
  }
}

- (BOOL)requiresFaceImage
{
  return self->_requiresFaceImage;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)PKLiveRenderedCardFaceView;
  [(PKLiveRenderedCardFaceView *)&v12 layoutSubviews];
  [(PKLiveRenderedCardFaceView *)self bounds];
  double v7 = v3;
  double v8 = v4;
  if (self->_usingFaceImage)
  {
    double top = self->_faceImageContentInsets.top;
    double left = self->_faceImageContentInsets.left;
    double v3 = v3 + left;
    double v4 = v4 + top;
    double v5 = v5 - (left + self->_faceImageContentInsets.right);
    double v6 = v6 - (top + self->_faceImageContentInsets.bottom);
  }
  -[UIView setFrame:](self->_cardView, "setFrame:", v3, v4, v5, v6);
  logoImageView = self->_logoImageView;
  [(UIImageView *)logoImageView frame];
  -[UIImageView setFrame:](logoImageView, "setFrame:", v7, v8);
}

- (PKLiveRenderedCardFaceView)initWithFrame:(CGRect)a3 pass:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  if (v10)
  {
    v102.receiver = self;
    v102.super_class = (Class)PKLiveRenderedCardFaceView;
    v11 = -[PKLiveRenderedCardFaceView initWithFrame:](&v102, sel_initWithFrame_, x, y, width, height);
    self = v11;
    if (v11)
    {
      p_pass = (id *)&v11->_pass;
      objc_storeStrong((id *)&v11->_pass, a4);
      self->_unint64_t type = [*p_pass liveRenderType];
      self->_state = 0;
      v13 = +[PKUIForegroundActiveArbiter sharedInstance];
      v14 = v13;
      if (v13) {
        unsigned int v15 = ([v13 registerObserver:self] >> 8) & 1;
      }
      else {
        LOBYTE(v15) = 1;
      }
      self->_foregroundActive = v15;
      v16 = [*p_pass displayProfile];
      v17 = (void *)MEMORY[0x1E4FB1618];
      v18 = [v16 backgroundColor];
      v19 = objc_msgSend(v17, "pkui_colorWithPKColor:", v18);
      [(PKLiveRenderedCardFaceView *)self setBackgroundColor:v19];

      uint64_t v20 = [*p_pass liveRenderedImageSet];
      unint64_t type = self->_type;
      v22 = (void *)v20;
      v99 = (void *)v20;
      v100 = v16;
      v101 = v14;
      switch(type)
      {
        case 1uLL:
          v23 = [MEMORY[0x1E4FB1E20] traitCollectionWithTraits:&__block_literal_global_142_0];
          v24 = [MEMORY[0x1E4FB1618] systemGray5Color];
          v25 = v24;
          if (v23)
          {
            uint64_t v26 = [v24 resolvedColorWithTraitCollection:v23];

            v25 = (void *)v26;
          }
          v27 = [v25 colorWithAlphaComponent:0.6];

          id v28 = objc_alloc(MEMORY[0x1E4F880F8]);
          id cardView = [v22 diffuseMaterialPropertyImage];
          uint64_t v30 = [cardView imageRef];
          [v22 metalnessMaterialPropertyImage];
          v31 = v22;
          id v32 = objc_claimAutoreleasedReturnValue();
          uint64_t v33 = [v32 imageRef];
          id v34 = [v31 normalMaterialPropertyImage];
          v35 = (PKTexturedCardView *)objc_msgSend(v28, "initWithDiffuse:metalness:normal:", v30, v33, objc_msgSend(v34, "imageRef"));
          texturedCardView = self->_texturedCardView;
          self->_texturedCardView = v35;

          objc_storeStrong((id *)&self->_cardView, v35);
          goto LABEL_38;
        case 2uLL:
          v37 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2990]];
          uint64_t v38 = [v37 fontDescriptorWithSymbolicTraits:2];

          uint64_t v98 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v38 size:22.0];
          v39 = [v10 frontFieldBuckets];
          v40 = [v39 firstObject];
          v41 = [v40 firstObject];
          v97 = [v41 value];

          v42 = (void *)MEMORY[0x1E4FB1618];
          v43 = [v10 displayProfile];
          v44 = [v43 foregroundColor];
          v96 = objc_msgSend(v42, "pkui_colorWithPKColor:", v44);

          v95 = (void *)v38;
          switch([v10 homeKeyLiveRenderType])
          {
            case 0:
              v45 = PKLogFacilityTypeGetObject();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19F450000, v45, OS_LOG_TYPE_DEFAULT, "Attempting to show PKAppleHomeKeyCardView, but unknown type provided, falling back to silver", buf, 2u);
              }

              goto LABEL_14;
            case 1:
LABEL_14:
              v46 = objc_msgSend(MEMORY[0x1E4FB1E20], "traitCollectionWithTraits:", &__block_literal_global_144, v38);
              v47 = [MEMORY[0x1E4FB1618] systemGray5Color];
              v48 = v47;
              v49 = (void *)v98;
              if (v46)
              {
                uint64_t v50 = [v47 resolvedColorWithTraitCollection:v46];

                v48 = (void *)v50;
              }
              v27 = [v48 colorWithAlphaComponent:0.15];

              uint64_t v51 = 2;
              goto LABEL_33;
            case 2:
              uint64_t v51 = 1;
              uint64_t v74 = LightBorderColor();
              goto LABEL_31;
            case 3:
              v27 = (void *)LightBorderColor();
              uint64_t v51 = 0;
              goto LABEL_32;
            case 4:
              uint64_t v51 = 3;
              uint64_t v74 = DarkBorderColor();
LABEL_31:
              v27 = (void *)v74;
LABEL_32:
              v49 = (void *)v98;
LABEL_33:
              if (!v27) {
                goto LABEL_34;
              }
              goto LABEL_37;
            default:
              v49 = (void *)v98;
              uint64_t v51 = 2;
LABEL_34:
              v75 = objc_msgSend(MEMORY[0x1E4FB1E20], "traitCollectionWithTraits:", &__block_literal_global_144, v95);
              v76 = [MEMORY[0x1E4FB1618] systemGray5Color];
              v77 = v76;
              if (v75)
              {
                uint64_t v78 = [v76 resolvedColorWithTraitCollection:v75];

                v77 = (void *)v78;
              }
              v27 = [v77 colorWithAlphaComponent:0.15];

LABEL_37:
              v79 = (PKTexturedCardView *)[objc_alloc(MEMORY[0x1E4F88100]) initWithStyle:v51 text:v97 font:v49 textColor:v96];
              v80 = self->_texturedCardView;
              self->_texturedCardView = v79;

              objc_storeStrong((id *)&self->_cardView, v79);
              id cardView = v95;
              break;
          }
          goto LABEL_38;
        case 3uLL:
          v52 = [MEMORY[0x1E4FB1E20] traitCollectionWithTraits:&__block_literal_global_144];
          v53 = [MEMORY[0x1E4FB1618] systemGray5Color];
          v54 = v53;
          if (v52)
          {
            uint64_t v55 = [v53 resolvedColorWithTraitCollection:v52];

            v54 = (void *)v55;
          }
          v27 = [v54 colorWithAlphaComponent:0.15];

          v56 = (PKTexturedCardView *)objc_alloc_init(MEMORY[0x1E4F880F0]);
          v57 = self->_texturedCardView;
          self->_texturedCardView = v56;

          v58 = v56;
          goto LABEL_26;
        case 4uLL:
          v59 = [MEMORY[0x1E4FB1E20] traitCollectionWithTraits:&__block_literal_global_142_0];
          v60 = [MEMORY[0x1E4FB1618] systemGray5Color];
          v61 = v60;
          if (v59)
          {
            uint64_t v62 = [v60 resolvedColorWithTraitCollection:v59];

            v61 = (void *)v62;
          }
          v27 = [v61 colorWithAlphaComponent:0.6];

          v63 = [*p_pass paymentPass];
          id cardView = [v63 associatedAccountServiceAccountIdentifier];

          v64 = [MEMORY[0x1E4F84270] sharedInstance];
          v65 = (void *)[objc_alloc(MEMORY[0x1E4F84200]) initWithAccountIdentifier:cardView accountService:v64];
          id v66 = objc_alloc(MEMORY[0x1E4F88128]);
          id v67 = [v22 overlayMaterialPropertyImage];
          v68 = (PKPayLaterCardView *)objc_msgSend(v66, "initWithOverlay:magnitudesProvider:", objc_msgSend(v67, "imageRef"), v65);
          payLaterCardView = self->_payLaterCardView;
          self->_payLaterCardView = v68;

          objc_storeStrong((id *)&self->_cardView, v68);
          goto LABEL_38;
        case 5uLL:
          self->_requiresFaceImage = 1;
          v70 = [MEMORY[0x1E4FB1E20] traitCollectionWithTraits:&__block_literal_global_144];
          v71 = [MEMORY[0x1E4FB1618] systemGray5Color];
          v72 = v71;
          if (v70)
          {
            uint64_t v73 = [v71 resolvedColorWithTraitCollection:v70];

            v72 = (void *)v73;
          }
          v27 = [v72 colorWithAlphaComponent:0.15];

          v58 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
LABEL_26:
          id cardView = self->_cardView;
          self->_id cardView = v58;
LABEL_38:

          v81 = self->_cardView;
          if (v81)
          {
            [(PKLiveRenderedCardFaceView *)self addSubview:self->_cardView];
            v82 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
            logoImageView = self->_logoImageView;
            self->_logoImageView = v82;

            v84 = self->_logoImageView;
            v85 = (void *)MEMORY[0x1E4FB1818];
            v86 = [*p_pass logoImage];
            v87 = [v85 imageWithPKImage:v86];
            [(UIImageView *)v84 setImage:v87];

            [(UIImageView *)self->_logoImageView sizeToFit];
            [(PKLiveRenderedCardFaceView *)self addSubview:self->_logoImageView];
            v88 = [(PKLiveRenderedCardFaceView *)self layer];
            [*p_pass style];
            PKPassFrontFaceContentSize();
            [v27 CGColor];
            PKPaymentStyleApplyCorners();
          }
          else
          {
            v88 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
            {
              unint64_t v91 = self->_type;
              v92 = [*p_pass uniqueID];
              *(_DWORD *)buf = 134218242;
              unint64_t v104 = v91;
              __int16 v105 = 2112;
              v106 = v92;
              _os_log_impl(&dword_19F450000, v88, OS_LOG_TYPE_DEFAULT, "PKLiveRenderedCardFaceView: live render type %lu recognized but failed to initialize for pass %@.", buf, 0x16u);
            }
          }

          if (v81) {
            break;
          }
          goto LABEL_42;
        default:
          v93 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
          {
            v94 = [*p_pass uniqueID];
            *(_DWORD *)buf = 134218242;
            unint64_t v104 = type;
            __int16 v105 = 2112;
            v106 = v94;
            _os_log_impl(&dword_19F450000, v93, OS_LOG_TYPE_DEFAULT, "PKLiveRenderedCardFaceView: invalid live render type %lu for pass %@.", buf, 0x16u);
          }
          __break(1u);
          return result;
      }
    }
    self = self;
    v89 = self;
  }
  else
  {
LABEL_42:
    v89 = 0;
  }

  return v89;
}

- (PKLiveRenderedCardFaceView)init
{
  return 0;
}

- (PKLiveRenderedCardFaceView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (void)dealloc
{
  [(PKLiveRenderedCardFaceView *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKLiveRenderedCardFaceView;
  [(PKLiveRenderedCardFaceView *)&v3 dealloc];
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    [(PKTexturedCardView *)self->_texturedCardView invalidate];
    payLaterCardView = self->_payLaterCardView;
    [(PKPayLaterCardView *)payLaterCardView invalidate];
  }
}

- (void)didAuthenticate
{
}

- (void)didPresent
{
}

- (void)didDismiss
{
  [(PKLiveRenderedCardFaceView *)self _showState:0 animated:1];
  payLaterCardView = self->_payLaterCardView;

  [(PKPayLaterCardView *)payLaterCardView setPresented:0];
}

- (void)setFaceImage:(id)a3 withAverageColor:(id)a4 alignmentInsets:(UIEdgeInsets)a5 contentInsets:(UIEdgeInsets)a6
{
  double right = a6.right;
  double bottom = a6.bottom;
  double left = a6.left;
  double top = a6.top;
  double v10 = a5.right;
  double v11 = a5.bottom;
  double v12 = a5.left;
  double v13 = a5.top;
  uint64_t v26 = (UIImage *)a3;
  id v17 = a4;
  if (v26)
  {
    v18 = v17;
    if (self->_faceImage == v26
      && (self->_faceImageAlignmentInsets.left == v12 ? (BOOL v19 = self->_faceImageAlignmentInsets.top == v13) : (BOOL v19 = 0),
          v19 ? (BOOL v20 = self->_faceImageAlignmentInsets.right == v10) : (BOOL v20 = 0),
          v20 ? (BOOL v21 = self->_faceImageAlignmentInsets.bottom == v11) : (BOOL v21 = 0),
          v21))
    {
      double v22 = self->_faceImageContentInsets.top;
      if (self->_faceImageContentInsets.left != left
        || v22 != top
        || self->_faceImageContentInsets.right != right
        || self->_faceImageContentInsets.bottom != bottom)
      {
        self->_faceImageContentInsets.double top = top;
        self->_faceImageContentInsets.double left = left;
        self->_faceImageContentInsets.double bottom = bottom;
        self->_faceImageContentInsets.double right = right;
        [(PKLiveRenderedCardFaceView *)self setNeedsLayout];
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_faceImage, a3);
      objc_storeStrong((id *)&self->_faceImageAverageColor, a4);
      self->_faceImageAlignmentInsets.double top = v13;
      self->_faceImageAlignmentInsets.double left = v12;
      self->_faceImageAlignmentInsets.double bottom = v11;
      self->_faceImageAlignmentInsets.double right = v10;
      self->_faceImageContentInsets.double top = top;
      self->_faceImageContentInsets.double left = left;
      self->_faceImageContentInsets.double bottom = bottom;
      self->_faceImageContentInsets.double right = right;
      [(PKLiveRenderedCardFaceView *)self _updateFaceImage];
    }
  }
  else
  {
    __break(1u);
  }
}

- (void)_updateFaceImage
{
  if (self->_type == 5 && !self->_invalidated)
  {
    [(PKPass *)self->_pass style];
    self->_usingFaceImage = self->_faceImage != 0;
    if (self->_faceImage)
    {
      objc_super v3 = self->_cardView;
      double top = self->_faceImageAlignmentInsets.top;
      double left = self->_faceImageAlignmentInsets.left;
      double bottom = self->_faceImageAlignmentInsets.bottom;
      double right = self->_faceImageAlignmentInsets.right;
      [(UIImage *)self->_faceImage scale];
      double v9 = v8;
      double v10 = [MEMORY[0x1E4FB1E20] traitCollectionWithTraits:&__block_literal_global_74];
      uint64_t v37 = 0;
      uint64_t v38 = &v37;
      uint64_t v39 = 0x2020000000;
      uint64_t v40 = 0;
      uint64_t v33 = 0;
      id v34 = &v33;
      uint64_t v35 = 0x2020000000;
      uint64_t v36 = 0;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __46__PKLiveRenderedCardFaceView__updateFaceImage__block_invoke_2;
      v32[3] = &unk_1E59D2AB0;
      v32[4] = self;
      v32[5] = &v37;
      v32[6] = &v33;
      PKUIPerformWithEffectiveTraitCollection(v10, v32);
      id v11 = objc_alloc(MEMORY[0x1E4F88160]);
      double v12 = (PKSpotlightCardView *)objc_msgSend(v11, "initWithDiffuse:contentInsets:averageColor:", v38[3], v34[3], top * v9, left * v9, bottom * v9, right * v9);
      spotlightCardView = self->_spotlightCardView;
      self->_spotlightCardView = v12;

      objc_storeStrong((id *)&self->_texturedCardView, v12);
      objc_storeStrong((id *)&self->_cardView, v12);
      [(PKTexturedCardView *)self->_texturedCardView setMotionEnabled:self->_enabled];
      CGImageRelease((CGImageRef)v38[3]);
      CGColorRelease((CGColorRef)v34[3]);
      [(PKLiveRenderedCardFaceView *)self insertSubview:self->_cardView belowSubview:v3];
      [(UIView *)v3 removeFromSuperview];
      [(PKLiveRenderedCardFaceView *)self setNeedsLayout];
      int v14 = [(PKSpotlightCardView *)self->_spotlightCardView isLight];
      _Block_object_dispose(&v33, 8);
      _Block_object_dispose(&v37, 8);
    }
    else
    {
      unsigned int v15 = self->_spotlightCardView;
      if (v15)
      {
        v16 = (objc_class *)MEMORY[0x1E4FB1EB0];
        id v17 = v15;
        v18 = (UIView *)objc_alloc_init(v16);
        id cardView = self->_cardView;
        self->_id cardView = v18;

        BOOL v20 = self->_spotlightCardView;
        self->_spotlightCardView = 0;

        texturedCardView = self->_texturedCardView;
        self->_texturedCardView = 0;

        [(PKLiveRenderedCardFaceView *)self insertSubview:self->_cardView belowSubview:v17];
        [(PKSpotlightCardView *)v17 removeFromSuperview];
        [(PKSpotlightCardView *)v17 invalidate];
        [(PKLiveRenderedCardFaceView *)self setNeedsLayout];
      }
      int v14 = 1;
    }
    double v22 = [(PKLiveRenderedCardFaceView *)self layer];
    PKPassFrontFaceContentSize();
    if (v14)
    {
      v23 = [MEMORY[0x1E4FB1E20] traitCollectionWithTraits:&__block_literal_global_144];
      v24 = [MEMORY[0x1E4FB1618] systemGray5Color];
      v25 = v24;
      if (v23)
      {
        uint64_t v26 = [v24 resolvedColorWithTraitCollection:v23];

        v25 = (void *)v26;
      }
      double v27 = 0.15;
    }
    else
    {
      v23 = [MEMORY[0x1E4FB1E20] traitCollectionWithTraits:&__block_literal_global_142_0];
      id v28 = [MEMORY[0x1E4FB1618] systemGray5Color];
      v25 = v28;
      if (v23)
      {
        uint64_t v29 = [v28 resolvedColorWithTraitCollection:v23];

        v25 = (void *)v29;
      }
      double v27 = 0.6;
    }
    uint64_t v30 = [v25 colorWithAlphaComponent:v27];

    id v31 = v30;
    [v31 CGColor];
    PKPaymentStyleApplyCorners();
  }
}

uint64_t __46__PKLiveRenderedCardFaceView__updateFaceImage__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setUserInterfaceStyle:1];
}

CGColorRef __46__PKLiveRenderedCardFaceView__updateFaceImage__block_invoke_2(void *a1)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) = CGImageRetain((CGImageRef)[*(id *)(a1[4] + 480) CGImage]);
  CGColorRef result = CGColorRetain((CGColorRef)[*(id *)(a1[4] + 488) CGColor]);
  *(void *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
  if (self->_foregroundActive != ((*(void *)&a4.var0 >> 8) & 1))
  {
    self->_foregroundActive = (unsigned __int16)(*(_WORD *)&a4 & 0x100) >> 8;
    if ((*(_WORD *)&a4 & 0x100) != 0) {
      [(PKPayLaterCardView *)self->_payLaterCardView refreshMagnitudes];
    }
  }
}

- (void)_showState:(unint64_t)a3 animated:(BOOL)a4
{
  if (self->_type == 1 && !self->_invalidated && self->_state != a3)
  {
    BOOL v5 = a4;
    self->_state = a3;
    if (a3 == 1)
    {
      uint64_t v6 = [(PKPass *)self->_pass liveRenderedArmedStateImageSet];
    }
    else
    {
      if (a3) {
        return;
      }
      uint64_t v6 = [(PKPass *)self->_pass liveRenderedImageSet];
    }
    double v7 = (void *)v6;
    if (v6)
    {
      id v8 = objc_alloc(MEMORY[0x1E4F880F8]);
      id v9 = [v7 diffuseMaterialPropertyImage];
      uint64_t v10 = [v9 imageRef];
      id v11 = [v7 metalnessMaterialPropertyImage];
      uint64_t v12 = [v11 imageRef];
      id v13 = [v7 normalMaterialPropertyImage];
      int v14 = objc_msgSend(v8, "initWithDiffuse:metalness:normal:", v10, v12, objc_msgSend(v13, "imageRef"));

      [v14 setMotionEnabled:self->_enabled];
      [v14 setAlpha:0.0];
      p_id cardView = &self->_cardView;
      [(UIView *)self->_cardView frame];
      objc_msgSend(v14, "setFrame:");
      [(PKLiveRenderedCardFaceView *)self insertSubview:v14 aboveSubview:self->_cardView];
      if (v5)
      {
        v16 = (void *)MEMORY[0x1E4FB1EB0];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __50__PKLiveRenderedCardFaceView__showState_animated___block_invoke;
        v20[3] = &unk_1E59CA870;
        id v21 = v14;
        double v22 = self;
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __50__PKLiveRenderedCardFaceView__showState_animated___block_invoke_2;
        v18[3] = &unk_1E59CAEA8;
        v18[4] = self;
        id v19 = v21;
        objc_msgSend(v16, "pkui_animateUsingOptions:animations:completion:", 4, v20, v18);
      }
      else
      {
        [v14 setAlpha:1.0];
        [(UIView *)*p_cardView removeFromSuperview];
        p_texturedCardView = &self->_texturedCardView;
        [(PKTexturedCardView *)*p_texturedCardView invalidate];
        objc_storeStrong((id *)p_texturedCardView, v14);
        objc_storeStrong((id *)p_cardView, v14);
      }
    }
  }
}

uint64_t __50__PKLiveRenderedCardFaceView__showState_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  v2 = *(void **)(*(void *)(a1 + 40) + 432);

  return [v2 setAlpha:0.0];
}

uint64_t __50__PKLiveRenderedCardFaceView__showState_animated___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(*(void *)(a1 + 32) + 432) removeFromSuperview];
    [*(id *)(*(void *)(a1 + 32) + 448) invalidate];
    objc_super v3 = *(void **)(a1 + 40);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 448), v3);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 432), v3);
    uint64_t v4 = *(void *)(a1 + 32);
    BOOL v5 = *(void **)(v4 + 448);
    uint64_t v6 = *(unsigned __int8 *)(v4 + 474);
    return [v5 setMotionEnabled:v6];
  }
  else
  {
    [*(id *)(a1 + 40) removeFromSuperview];
    [*(id *)(a1 + 40) invalidate];
    id v8 = *(void **)(*(void *)(a1 + 32) + 432);
    return [v8 setAlpha:1.0];
  }
}

- (UIImage)faceImage
{
  return self->_faceImage;
}

- (UIColor)faceImageAverageColor
{
  return self->_faceImageAverageColor;
}

- (UIEdgeInsets)faceImageAlignmentInsets
{
  double top = self->_faceImageAlignmentInsets.top;
  double left = self->_faceImageAlignmentInsets.left;
  double bottom = self->_faceImageAlignmentInsets.bottom;
  double right = self->_faceImageAlignmentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)faceImageContentInsets
{
  double top = self->_faceImageContentInsets.top;
  double left = self->_faceImageContentInsets.left;
  double bottom = self->_faceImageContentInsets.bottom;
  double right = self->_faceImageContentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceImageAverageColor, 0);
  objc_storeStrong((id *)&self->_faceImage, 0);
  objc_storeStrong((id *)&self->_payLaterCardView, 0);
  objc_storeStrong((id *)&self->_spotlightCardView, 0);
  objc_storeStrong((id *)&self->_texturedCardView, 0);
  objc_storeStrong((id *)&self->_logoImageView, 0);
  objc_storeStrong((id *)&self->_cardView, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end