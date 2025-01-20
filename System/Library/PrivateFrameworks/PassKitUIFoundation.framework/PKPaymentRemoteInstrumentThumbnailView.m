@interface PKPaymentRemoteInstrumentThumbnailView
- (PKPaymentRemoteInstrumentThumbnailView)initWithRemotePaymentInstrument:(id)a3;
- (PKPaymentRemoteInstrumentThumbnailView)initWithRemotePaymentInstrument:(id)a3 thumbnailSize:(CGSize)a4;
- (UIImageView)cardImageView;
- (UIImageView)placeholderImageView;
- (void)_prepareConstraints;
- (void)_updateCardImage:(CGImage *)a3 size:(CGSize)a4;
- (void)setCardImageView:(id)a3;
- (void)setPlaceholderImageView:(id)a3;
@end

@implementation PKPaymentRemoteInstrumentThumbnailView

- (PKPaymentRemoteInstrumentThumbnailView)initWithRemotePaymentInstrument:(id)a3
{
  return -[PKPaymentRemoteInstrumentThumbnailView initWithRemotePaymentInstrument:thumbnailSize:](self, "initWithRemotePaymentInstrument:thumbnailSize:", a3, 51.0, 33.0);
}

- (PKPaymentRemoteInstrumentThumbnailView)initWithRemotePaymentInstrument:(id)a3 thumbnailSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  v41.receiver = self;
  v41.super_class = (Class)PKPaymentRemoteInstrumentThumbnailView;
  v8 = [(PKPaymentRemoteInstrumentThumbnailView *)&v41 init];
  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x263F1C6D0]);
    double v10 = *MEMORY[0x263F001A8];
    double v11 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v12 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v13 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v14 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x263F001A8], v11, v12, v13);
    placeholderImageView = v8->_placeholderImageView;
    v8->_placeholderImageView = (UIImageView *)v14;

    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x263F1C6D0]), "initWithFrame:", v10, v11, v12, v13);
    cardImageView = v8->_cardImageView;
    v8->_cardImageView = (UIImageView *)v16;

    char v18 = 1;
    [(UIImageView *)v8->_cardImageView setContentMode:1];
    v19 = [v7 primaryPaymentApplication];
    v20 = 0;
    switch([v19 paymentNetworkIdentifier])
    {
      case 1:
        char v18 = 0;
        v20 = @"AmericanExpressRemoteCard";
        break;
      case 2:
        char v18 = 0;
        v20 = @"DiscoverRemoteCard";
        break;
      case 3:
        char v18 = 0;
        v20 = @"MastercardRemoteCard";
        break;
      case 4:
      case 16:
      case 17:
        char v18 = 0;
        v20 = @"VisaRemoteCard";
        break;
      case 11:
        char v18 = 0;
        v20 = @"ChinaUnionPayRemoteCard";
        break;
      case 12:
        char v18 = 0;
        v20 = @"EftposRemoteCard";
        break;
      case 13:
        char v18 = 0;
        v20 = @"InteracRemoteCard";
        break;
      case 15:
        char v18 = 0;
        v20 = @"MaestroRemoteCard";
        break;
      default:
        break;
    }
    PKScreenScale();
    double v22 = (double)(uint64_t)llround(width * v21);
    double v23 = (double)(uint64_t)llround(height * v21);
    v24 = (void *)MEMORY[0x263F5C1F0];
    v25 = [v7 manifestHash];
    v26 = [v25 hexEncoding];
    v27 = objc_msgSend(v24, "thumbnailCachePathForManifestHash:size:", v26, v22, v23);

    v28 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithContentsOfFile:v27];
    if (v28)
    {
      v29 = [(PKPaymentRemoteInstrumentThumbnailView *)v8 cardImageView];
      [v29 setImage:v28];
    }
    else
    {
      if (v18)
      {
        v29 = 0;
      }
      else
      {
        v30 = (void *)MEMORY[0x263F1C6B0];
        v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v29 = [v30 imageNamed:v20 inBundle:v31 compatibleWithTraitCollection:0];
      }
      v32 = [(PKPaymentRemoteInstrumentThumbnailView *)v8 cardImageView];
      [v32 setImage:v29];
    }
    objc_initWeak(&location, v8);
    v33 = [MEMORY[0x263F5BE20] sharedService];
    uint64_t v35 = MEMORY[0x263EF8330];
    uint64_t v36 = 3221225472;
    v37 = __88__PKPaymentRemoteInstrumentThumbnailView_initWithRemotePaymentInstrument_thumbnailSize___block_invoke;
    v38 = &unk_2644F94E0;
    objc_copyWeak(v39, &location);
    v39[1] = *(id *)&width;
    v39[2] = *(id *)&height;
    objc_msgSend(v33, "requestInstrumentThumbnail:forRemoteDevice:size:completion:", v7, 0, &v35, v22, v23);

    -[PKPaymentRemoteInstrumentThumbnailView addSubview:](v8, "addSubview:", v8->_cardImageView, v35, v36, v37, v38);
    [(PKPaymentRemoteInstrumentThumbnailView *)v8 _prepareConstraints];
    objc_destroyWeak(v39);
    objc_destroyWeak(&location);
  }
  return v8;
}

void __88__PKPaymentRemoteInstrumentThumbnailView_initWithRemotePaymentInstrument_thumbnailSize___block_invoke(uint64_t a1, CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __88__PKPaymentRemoteInstrumentThumbnailView_initWithRemotePaymentInstrument_thumbnailSize___block_invoke_2;
  v4[3] = &unk_2644F94B8;
  objc_copyWeak(v5, (id *)(a1 + 32));
  v5[1] = (id)cf;
  long long v6 = *(_OWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x263EF83A0], v4);
  objc_destroyWeak(v5);
}

void __88__PKPaymentRemoteInstrumentThumbnailView_initWithRemotePaymentInstrument_thumbnailSize___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateCardImage:size:", *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));

  v3 = *(const void **)(a1 + 40);
  if (v3)
  {
    CFRelease(v3);
  }
}

- (void)_prepareConstraints
{
  [(PKPaymentRemoteInstrumentThumbnailView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  v3 = [(PKPaymentRemoteInstrumentThumbnailView *)self cardImageView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  v4 = (void *)MEMORY[0x263F08938];
  v5 = [(PKPaymentRemoteInstrumentThumbnailView *)self cardImageView];
  long long v6 = [v4 constraintWithItem:v5 attribute:7 relatedBy:0 toItem:self attribute:7 multiplier:1.0 constant:0.0];
  [v6 setActive:1];

  id v7 = (void *)MEMORY[0x263F08938];
  v8 = [(PKPaymentRemoteInstrumentThumbnailView *)self cardImageView];
  id v9 = [v7 constraintWithItem:v8 attribute:8 relatedBy:0 toItem:self attribute:8 multiplier:1.0 constant:0.0];
  [v9 setActive:1];

  double v10 = (void *)MEMORY[0x263F08938];
  double v11 = [(PKPaymentRemoteInstrumentThumbnailView *)self cardImageView];
  double v12 = [v10 constraintWithItem:v11 attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
  [v12 setActive:1];

  double v13 = (void *)MEMORY[0x263F08938];
  id v15 = [(PKPaymentRemoteInstrumentThumbnailView *)self cardImageView];
  uint64_t v14 = [v13 constraintWithItem:v15 attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];
  [v14 setActive:1];
}

- (void)_updateCardImage:(CGImage *)a3 size:(CGSize)a4
{
  id v6 = (id)[objc_alloc(MEMORY[0x263F1C6B0]) initWithCGImage:a3];
  v5 = [(PKPaymentRemoteInstrumentThumbnailView *)self cardImageView];
  [v5 setImage:v6];

  [(PKPaymentRemoteInstrumentThumbnailView *)self setNeedsLayout];
}

- (UIImageView)placeholderImageView
{
  return self->_placeholderImageView;
}

- (void)setPlaceholderImageView:(id)a3
{
}

- (UIImageView)cardImageView
{
  return self->_cardImageView;
}

- (void)setCardImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardImageView, 0);

  objc_storeStrong((id *)&self->_placeholderImageView, 0);
}

@end