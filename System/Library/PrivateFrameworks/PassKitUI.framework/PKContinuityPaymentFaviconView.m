@interface PKContinuityPaymentFaviconView
- (PKContinuityPaymentFaviconView)initWithCoder:(id)a3;
- (PKContinuityPaymentFaviconView)initWithFrame:(CGRect)a3;
- (PKContinuityPaymentFaviconView)initWithFrame:(CGRect)a3 URL:(id)a4 modelIdentifier:(id)a5 merchantName:(id)a6;
- (double)_iconVerticalOffset;
- (void)_loadMacImage;
- (void)_setupMonogram;
- (void)dealloc;
- (void)layoutSubviews;
@end

@implementation PKContinuityPaymentFaviconView

- (PKContinuityPaymentFaviconView)initWithCoder:(id)a3
{
  return 0;
}

- (PKContinuityPaymentFaviconView)initWithFrame:(CGRect)a3
{
  return -[PKContinuityPaymentFaviconView initWithFrame:URL:modelIdentifier:merchantName:](self, "initWithFrame:URL:modelIdentifier:merchantName:", 0, 0, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (PKContinuityPaymentFaviconView)initWithFrame:(CGRect)a3 URL:(id)a4 modelIdentifier:(id)a5 merchantName:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v52.receiver = self;
  v52.super_class = (Class)PKContinuityPaymentFaviconView;
  v16 = -[PKContinuityPaymentFaviconView initWithFrame:](&v52, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    uint64_t v17 = [v15 copy];
    merchantName = v16->_merchantName;
    v16->_merchantName = (NSString *)v17;

    uint64_t v19 = [v14 copy];
    modelIdentifier = v16->_modelIdentifier;
    v16->_modelIdentifier = (NSString *)v19;

    uint64_t v21 = [MEMORY[0x1E4F290E0] sharedSession];
    urlSession = v16->_urlSession;
    v16->_urlSession = (NSURLSession *)v21;

    v23 = objc_alloc_init(PKShapeView);
    maskView = v16->_maskView;
    v16->_maskView = v23;

    uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", x, y, width, height);
    macImageView = v16->_macImageView;
    v16->_macImageView = (UIImageView *)v25;

    [(UIImageView *)v16->_macImageView setContentMode:1];
    [(PKContinuityPaymentFaviconView *)v16 _loadMacImage];
    v27 = [(PKContinuityPaymentFaviconView *)v16 layer];
    [v27 setAllowsGroupOpacity:0];

    v28 = [(PKContinuityPaymentFaviconView *)v16 layer];
    [v28 setAllowsGroupBlending:0];

    [(PKContinuityPaymentFaviconView *)v16 addSubview:v16->_macImageView];
    uint64_t v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", x, y, width, height);
    imageShadowView = v16->_imageShadowView;
    v16->_imageShadowView = (UIView *)v29;

    [(PKContinuityPaymentFaviconView *)v16 addSubview:v16->_imageShadowView];
    v31 = [(UIView *)v16->_imageShadowView layer];
    objc_msgSend(v31, "setShadowOffset:", 0.0, 1.0);
    id v32 = [MEMORY[0x1E4FB1618] darkGrayColor];
    objc_msgSend(v31, "setShadowColor:", objc_msgSend(v32, "CGColor"));

    LODWORD(v33) = 1050253722;
    [v31 setShadowOpacity:v33];
    [v31 setShadowRadius:1.0];
    [v31 setMasksToBounds:0];
    uint64_t v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", x, y, width, height);
    imageView = v16->_imageView;
    v16->_imageView = (UIImageView *)v34;

    [(UIImageView *)v16->_imageView setContentMode:2];
    v36 = [(UIImageView *)v16->_imageView layer];
    [v36 setMasksToBounds:1];

    v37 = [(UIImageView *)v16->_imageView layer];
    [v37 setCornerRadius:5.0];

    [(PKContinuityPaymentFaviconView *)v16 addSubview:v16->_imageView];
    uint64_t v38 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", x, y, width, height);
    monogramView = v16->_monogramView;
    v16->_monogramView = (UIView *)v38;

    v40 = [(UIView *)v16->_monogramView layer];
    [v40 setCornerRadius:5.0];

    if (v13)
    {
      objc_initWeak(&location, v16->_imageView);
      v41 = v16->_urlSession;
      uint64_t v44 = MEMORY[0x1E4F143A8];
      uint64_t v45 = 3221225472;
      v46 = __81__PKContinuityPaymentFaviconView_initWithFrame_URL_modelIdentifier_merchantName___block_invoke;
      v47 = &unk_1E59CFFA8;
      objc_copyWeak(&v50, &location);
      id v48 = v13;
      v49 = v16;
      v42 = [(NSURLSession *)v41 dataTaskWithURL:v48 completionHandler:&v44];
      objc_msgSend(v42, "resume", v44, v45, v46, v47);

      objc_destroyWeak(&v50);
      objc_destroyWeak(&location);
    }
    else
    {
      [(PKContinuityPaymentFaviconView *)v16 _setupMonogram];
    }
  }
  return v16;
}

void __81__PKContinuityPaymentFaviconView_initWithFrame_URL_modelIdentifier_merchantName___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9 || [v8 statusCode] != 200)
  {
    v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v20 = v12;
      _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Couldn't load favicon: %@", buf, 0xCu);
    }

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v9 localizedDescription];
      *(_DWORD *)buf = 138412290;
      v20 = v13;
      _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Error: %@", buf, 0xCu);
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __81__PKContinuityPaymentFaviconView_initWithFrame_URL_modelIdentifier_merchantName___block_invoke_8;
    v14[3] = &unk_1E59CA7D0;
    v10 = &v15;
    id v15 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], v14);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__PKContinuityPaymentFaviconView_initWithFrame_URL_modelIdentifier_merchantName___block_invoke_2;
    block[3] = &unk_1E59CA7A8;
    v10 = &v17;
    id v17 = v7;
    objc_copyWeak(&v18, (id *)(a1 + 48));
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v18);
  }
}

void __81__PKContinuityPaymentFaviconView_initWithFrame_URL_modelIdentifier_merchantName___block_invoke_2(uint64_t a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithData:*(void *)(a1 + 32)];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4FB1EB0];
    v4 = (id *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __81__PKContinuityPaymentFaviconView_initWithFrame_URL_modelIdentifier_merchantName___block_invoke_3;
    v6[3] = &unk_1E59CB010;
    objc_copyWeak(&v8, v4);
    id v7 = v2;
    [v3 transitionWithView:WeakRetained duration:5242880 options:v6 animations:0 completion:0.3];

    objc_destroyWeak(&v8);
  }
}

void __81__PKContinuityPaymentFaviconView_initWithFrame_URL_modelIdentifier_merchantName___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setImage:*(void *)(a1 + 32)];
}

uint64_t __81__PKContinuityPaymentFaviconView_initWithFrame_URL_modelIdentifier_merchantName___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupMonogram];
}

- (void)dealloc
{
  [(NSURLSession *)self->_urlSession invalidateAndCancel];
  v3.receiver = self;
  v3.super_class = (Class)PKContinuityPaymentFaviconView;
  [(PKContinuityPaymentFaviconView *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)PKContinuityPaymentFaviconView;
  [(PKContinuityPaymentFaviconView *)&v14 layoutSubviews];
  macImageView = self->_macImageView;
  [(PKContinuityPaymentFaviconView *)self bounds];
  -[UIImageView setFrame:](macImageView, "setFrame:");
  if ([(NSString *)self->_modelIdentifier containsString:@"iMac"]) {
    double v4 = 50.0;
  }
  else {
    double v4 = 60.0;
  }
  -[UIImageView setFrame:](self->_imageView, "setFrame:", 0.0, 0.0, v4, v4);
  v5 = (void *)MEMORY[0x1E4FB14C0];
  [(UIImageView *)self->_imageView bounds];
  objc_msgSend(v5, "bezierPathWithRoundedRect:cornerRadius:");
  id v6 = objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 CGPath];

  [(UIImageView *)self->_macImageView frame];
  double MidX = CGRectGetMidX(v15);
  [(UIImageView *)self->_macImageView frame];
  double MidY = CGRectGetMidY(v16);
  [(PKContinuityPaymentFaviconView *)self _iconVerticalOffset];
  -[UIImageView setCenter:](self->_imageView, "setCenter:", MidX, MidY + v10);
  imageShadowView = self->_imageShadowView;
  [(UIImageView *)self->_imageView frame];
  -[UIView setFrame:](imageShadowView, "setFrame:");
  v12 = [(UIView *)self->_imageShadowView layer];
  [v12 setShadowPath:v7];

  monogramView = self->_monogramView;
  [(UIImageView *)self->_imageView frame];
  -[UIView setFrame:](monogramView, "setFrame:");
}

- (void)_setupMonogram
{
  monogramView = self->_monogramView;
  double v4 = [MEMORY[0x1E4FB1618] labelColor];
  [(UIView *)monogramView setBackgroundColor:v4];

  [(UIImageView *)self->_imageView removeFromSuperview];
  id v5 = objc_alloc(MEMORY[0x1E4FB1930]);
  [(UIView *)self->_monogramView bounds];
  id v9 = (id)objc_msgSend(v5, "initWithFrame:");
  [v9 setAutoresizingMask:18];
  id v6 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v9 setTextColor:v6];

  uint64_t v7 = [MEMORY[0x1E4FB08E0] systemFontOfSize:38.0 weight:*MEMORY[0x1E4FB09D8]];
  [v9 setFont:v7];

  [v9 setTextAlignment:1];
  if ([(NSString *)self->_merchantName length])
  {
    id v8 = -[NSString substringWithRange:](self->_merchantName, "substringWithRange:", 0, 1);
    [v9 setText:v8];
  }
  [(UIView *)self->_monogramView addSubview:v9];
  [(PKContinuityPaymentFaviconView *)self addSubview:self->_monogramView];
  [(PKContinuityPaymentFaviconView *)self setNeedsLayout];
}

- (void)_loadMacImage
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if ([(NSString *)self->_modelIdentifier containsString:@"MacBookPro"]
    || [(NSString *)self->_modelIdentifier containsString:@"MacBookAir"]
    || [(NSString *)self->_modelIdentifier containsString:@"MacBook"])
  {
    objc_super v3 = @"laptopcomputer";
  }
  else if ([(NSString *)self->_modelIdentifier containsString:@"iMac"])
  {
    objc_super v3 = @"desktopcomputer";
  }
  else
  {
    objc_super v3 = @"display";
  }
  double v4 = (void *)MEMORY[0x1E4FB1830];
  id v5 = [MEMORY[0x1E4FB1618] labelColor];
  v12[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  uint64_t v7 = [v4 _configurationWithHierarchicalColors:v6];

  id v8 = [MEMORY[0x1E4FB1830] configurationWithWeight:2];
  id v9 = [MEMORY[0x1E4FB1818] systemImageNamed:v3];
  double v10 = [v9 imageByApplyingSymbolConfiguration:v8];
  v11 = [v10 imageByApplyingSymbolConfiguration:v7];

  [(UIImageView *)self->_macImageView setImage:v11];
}

- (double)_iconVerticalOffset
{
  double v3 = 0.0;
  if (![(NSString *)self->_modelIdentifier containsString:@"MacBookPro"]
    && ![(NSString *)self->_modelIdentifier containsString:@"MacBookAir"]
    && ![(NSString *)self->_modelIdentifier containsString:@"MacBook"])
  {
    if ([(NSString *)self->_modelIdentifier containsString:@"iMac"]) {
      return -22.0;
    }
    else {
      return -11.0;
    }
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantName, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_maskView, 0);
  objc_storeStrong((id *)&self->_imageShadowView, 0);
  objc_storeStrong((id *)&self->_monogramView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_macImageView, 0);

  objc_storeStrong((id *)&self->_urlSession, 0);
}

@end