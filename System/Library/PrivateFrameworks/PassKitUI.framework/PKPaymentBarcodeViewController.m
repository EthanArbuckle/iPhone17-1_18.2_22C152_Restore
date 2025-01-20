@interface PKPaymentBarcodeViewController
- ($3CC2805F0189FCCE51047C0D2B5A52A9)_barcodePadding;
- (BOOL)_canShowWhileLocked;
- (CGSize)_barcodeSize;
- (NSData)barcodeData;
- (PKPaymentBarcodeViewController)initWithPass:(id)a3;
- (void)_closeButtonPressed:(id)a3;
- (void)invalidate;
- (void)setBarcodeData:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKPaymentBarcodeViewController

- (PKPaymentBarcodeViewController)initWithPass:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentBarcodeViewController;
  v6 = [(PKPaymentBarcodeViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pass, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v41.receiver = self;
  v41.super_class = (Class)PKPaymentBarcodeViewController;
  [(PKPaymentBarcodeViewController *)&v41 viewDidLoad];
  [(PKPaymentBarcodeViewController *)self _barcodePadding];
  long long v3 = v39;
  *(_OWORD *)&self->_viewSizeInfo.barcodeTopPadding = *(_OWORD *)location;
  *(_OWORD *)&self->_viewSizeInfo.disclaimerSidePadding = v3;
  self->_viewSizeInfo.altTextInset = v40;
  v4 = [(PKPaymentBarcodeViewController *)self view];
  id v5 = (void *)MEMORY[0x1E4FB14D8];
  v6 = [MEMORY[0x1E4FB1818] imageNamed:@"xmark.circle.fill"];
  v7 = [MEMORY[0x1E4FB1618] labelColor];
  uint64_t v8 = objc_msgSend(v5, "pkui_plainConfigurationWithImage:imageConfiguration:foregroundColor:", v6, 0, v7);

  objc_initWeak(location, self);
  objc_super v9 = (void *)MEMORY[0x1E4FB13F0];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __45__PKPaymentBarcodeViewController_viewDidLoad__block_invoke;
  v36[3] = &unk_1E59CBEE0;
  objc_copyWeak(&v37, location);
  v10 = [v9 actionWithHandler:v36];
  v35 = (void *)v8;
  v11 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v8 primaryAction:v10];
  closeButton = self->_closeButton;
  self->_closeButton = v11;

  [v4 addSubview:self->_closeButton];
  v13 = [MEMORY[0x1E4FB1618] whiteColor];
  [v4 setBackgroundColor:v13];

  [(PKPaymentBarcodeViewController *)self setOverrideUserInterfaceStyle:1];
  v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  disclaimerText = self->_disclaimerText;
  self->_disclaimerText = v14;

  v16 = self->_disclaimerText;
  v17 = PKLocalizedAquamanString(&cfstr_AquamanFraudWa.isa);
  [(UILabel *)v16 setText:v17];

  [v4 addSubview:self->_disclaimerText];
  [(UILabel *)self->_disclaimerText setNumberOfLines:0];
  [(UILabel *)self->_disclaimerText setTextAlignment:1];
  v18 = self->_disclaimerText;
  v19 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  [(UILabel *)v18 setFont:v19];

  v20 = self->_disclaimerText;
  v21 = [MEMORY[0x1E4FB1618] systemGrayColor];
  [(UILabel *)v20 setTextColor:v21];

  id v22 = objc_alloc_init(MEMORY[0x1E4F84558]);
  [v22 setFormat:4];
  v23 = (void *)[[NSString alloc] initWithData:self->_barcodeData encoding:4];
  [v22 setAltText:v23];

  [v22 setMessageData:self->_barcodeData];
  [v22 setShouldRemoveQuietZone:1];
  v24 = [[PKBarcodeStickerView alloc] initWithBarcode:v22 validityState:0];
  [(PKBarcodeStickerView *)v24 setAltTextInset:self->_viewSizeInfo.altTextInset];
  v25 = (void *)MEMORY[0x1E4FB08E0];
  v26 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2988]];
  [v26 pointSize];
  v27 = objc_msgSend(v25, "monospacedSystemFontOfSize:weight:");

  [(PKBarcodeStickerView *)v24 setAltTextFont:v27];
  [(PKBarcodeStickerView *)v24 setAccessibilityElementsHidden:1];
  [(PKBarcodeStickerView *)v24 setShouldMatteCode:0];
  [(PKPaymentBarcodeViewController *)self _barcodeSize];
  -[PKBarcodeStickerView setDesiredBarcodeSize:](v24, "setDesiredBarcodeSize:");
  v28 = [[PKRightAngleRotatingView alloc] initWithRotatedView:v24];
  barcodeView = self->_barcodeView;
  self->_barcodeView = v28;

  [(PKRightAngleRotatingView *)self->_barcodeView setOrientation:3];
  if ((PKShowBarcodeForScreenshotAndBroadcasting() & 1) == 0) {
    [(UIView *)self->_barcodeView pkui_setExcludedFromScreenCapture:1 andBroadcasting:1];
  }
  v30 = [(PKPaymentPass *)self->_pass compactBankLogoDarkImage];
  id v31 = objc_alloc(MEMORY[0x1E4FB1838]);
  v32 = [MEMORY[0x1E4FB1818] imageWithPKImage:v30];
  v33 = (UIImageView *)[v31 initWithImage:v32];
  compactBankLogoView = self->_compactBankLogoView;
  self->_compactBankLogoView = v33;

  [(UIImageView *)self->_compactBankLogoView setContentMode:1];
  [v4 addSubview:self->_compactBankLogoView];
  [v4 addSubview:self->_barcodeView];

  objc_destroyWeak(&v37);
  objc_destroyWeak(location);
}

void __45__PKPaymentBarcodeViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = [v3 sender];

  [WeakRetained _closeButtonPressed:v4];
}

- (void)viewWillLayoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)PKPaymentBarcodeViewController;
  [(PKPaymentBarcodeViewController *)&v27 viewWillLayoutSubviews];
  id v3 = [(PKPaymentBarcodeViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [(PKPaymentBarcodeViewController *)self _barcodeSize];
  double v13 = v12;
  memset(&slice, 0, sizeof(slice));
  v25.origin.x = v5;
  v25.origin.y = v7;
  disclaimerText = self->_disclaimerText;
  v25.size.width = v9;
  v25.size.height = v11;
  -[UILabel pkui_sizeThatFits:forceWordWrap:](disclaimerText, "pkui_sizeThatFits:forceWordWrap:", 1, v9 + self->_viewSizeInfo.disclaimerSidePadding * -2.0, 1.79769313e308);
  CGFloat v16 = v15;
  CGFloat v17 = (v11
       - (v13
        + self->_viewSizeInfo.disclaimerToBarcodePadding
        + v15
        + self->_viewSizeInfo.bankToDisclaimerPadding
        + 24.0
        + self->_viewSizeInfo.barcodeTopPadding * 2.0))
      * 0.5
      + 8.0;
  v28.origin.x = v5;
  v28.origin.y = v7;
  v28.size.width = v9;
  v28.size.height = v11;
  CGRectDivide(v28, &slice, &v25, v17, CGRectMinYEdge);
  closeButton = self->_closeButton;
  if (closeButton)
  {
    [(UIButton *)closeButton sizeToFit];
    [(UIButton *)self->_closeButton frame];
    -[UIButton setFrame:](self->_closeButton, "setFrame:", v5 + v9 - v19 + -12.0, v7 + 12.0);
  }
  if (self->_compactBankLogoView)
  {
    CGRectDivide(v25, &slice, &v25, 24.0, CGRectMinYEdge);
    -[UIImageView setFrame:](self->_compactBankLogoView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }
  CGRectDivide(v25, &slice, &v25, self->_viewSizeInfo.bankToDisclaimerPadding, CGRectMinYEdge);
  if (self->_disclaimerText)
  {
    CGRectDivide(v25, &slice, &v25, v16, CGRectMinYEdge);
    v20 = self->_disclaimerText;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](v20, "setFrame:");
  }
  CGRectDivide(v25, &slice, &v25, self->_viewSizeInfo.disclaimerToBarcodePadding + self->_viewSizeInfo.barcodeTopPadding, CGRectMinYEdge);
  barcodeView = self->_barcodeView;
  if (barcodeView)
  {
    id v22 = [(PKRightAngleRotatingView *)barcodeView rotatedView];
    objc_msgSend(v22, "sizeThatFits:", v13, 1.79769313e308);
    double v24 = v23;

    CGRectDivide(v25, &slice, &v25, v13, CGRectMinYEdge);
    -[PKRightAngleRotatingView setBounds:](self->_barcodeView, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v24, v13);
    -[PKRightAngleRotatingView setCenter:](self->_barcodeView, "setCenter:", v9 * 0.5, v13 * 0.5 + slice.origin.y);
  }
}

- (void)invalidate
{
  v2[4] = self;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__PKPaymentBarcodeViewController_invalidate__block_invoke;
  v3[3] = &unk_1E59CA7D0;
  v3[4] = self;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __44__PKPaymentBarcodeViewController_invalidate__block_invoke_2;
  v2[3] = &unk_1E59CB6D8;
  objc_msgSend(MEMORY[0x1E4FB1EB0], "pkui_animateUsingOptions:animations:completion:", 4, v3, v2);
}

uint64_t __44__PKPaymentBarcodeViewController_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 976) setAlpha:0.0];
}

void __44__PKPaymentBarcodeViewController_invalidate__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 976) removeFromSuperview];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 976);
  *(void *)(v2 + 976) = 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_closeButtonPressed:(id)a3
{
  id v3 = [(PKPaymentBarcodeViewController *)self presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- ($3CC2805F0189FCCE51047C0D2B5A52A9)_barcodePadding
{
  retstr->var4 = 0.0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  result = ($3CC2805F0189FCCE51047C0D2B5A52A9 *)PKUIGetMinScreenWidthType();
  if ((unint64_t)result <= 0xE)
  {
    double v5 = dbl_1A0445730[(void)result];
    double v6 = dbl_1A04457A8[(void)result];
    double v7 = dbl_1A0445820[(void)result];
    double v8 = dbl_1A0445898[(void)result];
    *(void *)&retstr->var0 = qword_1A04456B8[(void)result];
    retstr->var1 = v5;
    retstr->var2 = v6;
    retstr->var3 = v7;
    retstr->var4 = v8;
  }
  return result;
}

- (CGSize)_barcodeSize
{
  unint64_t v2 = PKUIGetMinScreenWidthType();
  if (v2 > 0xE)
  {
    double v4 = *MEMORY[0x1E4F1DB30];
    double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    double v3 = dbl_1A0445910[v2];
    double v4 = dbl_1A0445988[v2];
  }
  result.height = v3;
  result.width = v4;
  return result;
}

- (NSData)barcodeData
{
  return self->_barcodeData;
}

- (void)setBarcodeData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barcodeData, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_compactBankLogoView, 0);
  objc_storeStrong((id *)&self->_barcodeGuide, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_disclaimerText, 0);

  objc_storeStrong((id *)&self->_barcodeView, 0);
}

@end