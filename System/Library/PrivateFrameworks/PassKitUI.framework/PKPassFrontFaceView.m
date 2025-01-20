@interface PKPassFrontFaceView
- (BOOL)isRelevancyActive;
- (BOOL)showsBarcodeView;
- (BOOL)showsLinkedApp;
- (BOOL)showsLiveBalance;
- (CGRect)barcodeFrame;
- (CGSize)contentSize;
- (PKBarcodeStickerView)barcodeView;
- (PKLinkedAppIconView)linkedApp;
- (PKPassFrontFaceView)initWithStyle:(int64_t)a3;
- (id)_rebucketAuxiliaryFields:(id)a3;
- (id)_relevantBuckets;
- (id)createContactlessLogoView;
- (id)createExpiredLabel;
- (id)passFaceTemplate;
- (id)templateForHeaderBucket;
- (id)templateForLayoutMode:(int64_t)a3;
- (int64_t)bottomRightItem;
- (void)_positionBarcodeView;
- (void)createBodyContentViews;
- (void)createHeaderContentViews;
- (void)insertContentView:(id)a3 ofType:(int64_t)a4;
- (void)layoutSubviews;
- (void)setBottomRightItem:(int64_t)bottomRightItem;
- (void)setRelevancyActive:(BOOL)a3;
- (void)setShowsBarcodeView:(BOOL)a3;
- (void)setShowsBarcodeView:(BOOL)a3 animated:(BOOL)a4;
- (void)setShowsLinkedApp:(BOOL)a3;
- (void)updateValidity;
@end

@implementation PKPassFrontFaceView

- (id)templateForHeaderBucket
{
  [(PKPassFaceView *)self style];
  PKPassFrontFaceContentSize();
  double v3 = v2;
  v4 = objc_alloc_init(PKPassBucketTemplate);
  [(PKPassBucketTemplate *)v4 setBucketAlignment:1];
  -[PKPassBucketTemplate setBucketRect:](v4, "setBucketRect:", v3 + -15.0 + -115.0, 10.0, 115.0, 40.0);
  [(PKPassBucketTemplate *)v4 setMinFieldPadding:16.0];
  [(PKPassBucketTemplate *)v4 setMaxFields:3];
  v5 = [(PKPassBucketTemplate *)v4 defaultFieldTemplate];
  v6 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:11.0];
  [v5 setLabelFont:v6];

  v7 = [(PKPassBucketTemplate *)v4 defaultFieldTemplate];
  v8 = [MEMORY[0x1E4FB08E0] systemFontOfSize:21.0];
  [v7 setValueFont:v8];

  v9 = [(PKPassBucketTemplate *)v4 defaultFieldTemplate];
  [v9 setTextAlignment:2];

  v10 = [(PKPassBucketTemplate *)v4 defaultFieldTemplate];
  [v10 setVerticalPadding:-3.0];

  return v4;
}

- (void)layoutSubviews
{
  v53.receiver = self;
  v53.super_class = (Class)PKPassFrontFaceView;
  [(PKPassFaceView *)&v53 layoutSubviews];
  double v3 = [(PKPassFaceView *)self contentView];
  [v3 bounds];
  double v49 = v4;
  CGFloat v50 = v5;
  CGFloat v51 = v7;
  CGFloat v52 = v6;
  [(PKPassFaceView *)self style];
  PKPassFaceLogoRect();
  if (self->_logoLabel)
  {
    CGFloat v12 = v8;
    CGFloat v13 = v9;
    CGFloat v14 = v10;
    CGFloat v15 = v11;
    if (!CGRectIsNull(*(CGRect *)&v8))
    {
      v16 = [(PKPassFaceView *)self pass];
      [v16 logoRect];
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      CGFloat v24 = v23;

      v54.origin.x = v18;
      v54.origin.y = v20;
      v54.size.width = v22;
      CGFloat rect = v24;
      v54.size.height = v24;
      double v25 = v12;
      if (!CGRectIsNull(v54))
      {
        v55.origin.x = v18;
        v55.origin.y = v20;
        v55.size.width = v22;
        v55.size.height = rect;
        double v25 = CGRectGetMaxX(v55) + 8.0;
      }
      [(UILabel *)self->_logoLabel sizeToFit];
      [(UILabel *)self->_logoLabel frame];
      UIRectCenteredYInRect();
      double v27 = v26;
      double v29 = v28;
      double v31 = v30;
      v56.origin.x = v12;
      v56.origin.y = v13;
      v56.size.width = v14;
      v56.size.height = v15;
      -[UILabel setFrame:](self->_logoLabel, "setFrame:", v27, v29, CGRectGetMaxX(v56) - v25, v31);
    }
  }
  if (self->_showsLinkedApp)
  {
    [(PKLinkedAppIconView *)self->_linkedApp intrinsicContentSize];
    double v33 = v32;
    double v35 = v34;
    v57.origin.x = v49;
    v57.origin.y = v52;
    v57.size.height = v50;
    v57.size.width = v51;
    -[PKLinkedAppIconView setFrame:](self->_linkedApp, "setFrame:", v49 + 7.0, CGRectGetMaxY(v57) - (v35 + 7.0), v33, v35);
  }
  bottomRightItemView = self->_bottomRightItemView;
  if (bottomRightItemView)
  {
    [(UIView *)bottomRightItemView frame];
    CGFloat v38 = v37;
    CGFloat v40 = v39;
    double v42 = v41;
    double v44 = v43;
    v58.origin.x = v49;
    v58.origin.y = v52;
    v58.size.width = v51;
    v58.size.height = v50;
    double MaxX = CGRectGetMaxX(v58);
    v59.origin.x = v38;
    v59.origin.y = v40;
    v59.size.width = v42;
    v59.size.height = v44;
    CGFloat v46 = MaxX - (CGRectGetWidth(v59) + 7.0);
    v60.origin.x = v49;
    v60.origin.y = v52;
    v60.size.width = v51;
    v60.size.height = v50;
    double MaxY = CGRectGetMaxY(v60);
    v61.origin.x = v46;
    v61.origin.y = v40;
    v61.size.width = v42;
    v61.size.height = v44;
    -[UIView setFrame:](self->_bottomRightItemView, "setFrame:", v46, MaxY - (CGRectGetHeight(v61) + 7.0), v42, v44);
  }
  [(PKPassFrontFaceView *)self _positionBarcodeView];
}

- (void)_positionBarcodeView
{
  if (self->_barcodeView)
  {
    double v3 = [(PKPassFaceView *)self contentView];
    [v3 bounds];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;

    barcodeView = self->_barcodeView;
    CGFloat v13 = [(PKPassFrontFaceView *)self passFaceTemplate];
    [v13 barcodeMaxSize];
    -[PKBarcodeStickerView sizeThatFits:](barcodeView, "sizeThatFits:");

    v17.origin.x = v5;
    v17.origin.y = v7;
    v17.size.width = v9;
    v17.size.height = v11;
    CGRectGetMaxY(v17);
    CGFloat v14 = [(PKPassFaceView *)self faceTemplate];
    [v14 barcodeBottomInset];

    CGFloat v15 = self->_barcodeView;
    UIRectCenteredXInRect();
    -[PKBarcodeStickerView setFrame:](v15, "setFrame:");
  }
}

- (id)passFaceTemplate
{
  double v3 = [(PKPassFaceView *)self pass];
  double v4 = [v3 displayProfile];
  CGFloat v5 = -[PKPassFrontFaceView templateForLayoutMode:](self, "templateForLayoutMode:", [v4 layoutMode]);

  return v5;
}

- (id)_relevantBuckets
{
  double v3 = [(PKPassFaceView *)self pass];
  double v4 = [v3 frontFieldBuckets];

  CGFloat v5 = [(PKPassFaceView *)self pass];
  uint64_t v6 = [v5 style];

  if (v6 == 8 || v6 == 2)
  {
    id v7 = [(PKPassFrontFaceView *)self _rebucketAuxiliaryFields:v4];
  }
  else
  {
    id v7 = v4;
  }
  double v8 = v7;

  return v8;
}

- (CGSize)contentSize
{
  double v2 = [(PKPassFaceView *)self pass];
  [v2 style];
  PKPassFrontFaceContentSize();
  double v4 = v3;
  double v6 = v5;
  if (([v2 hasValidNFCPayload] & 1) != 0 || objc_msgSend(v2, "supportsIssuerBinding"))
  {
    if (PKValueAddedServicesEnabled())
    {
      if (([v2 isValid] & 1) != 0
        || ([v2 barcode], id v7 = objc_claimAutoreleasedReturnValue(), v7, !v7))
      {
        PKPassHeightAdjustmentForStyle();
        double v6 = v6 - v8;
      }
    }
  }

  double v9 = v4;
  double v10 = v6;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)createBodyContentViews
{
  v22.receiver = self;
  v22.super_class = (Class)PKPassFrontFaceView;
  [(PKPassFaceView *)&v22 createBodyContentViews];
  double v3 = [(PKPassFaceView *)self pass];
  uint64_t v4 = [v3 style];
  double v5 = [v3 barcode];
  if (!v5 || v4 == 7 || v4 == 6)
  {
    if (v4 == 6) {
      goto LABEL_23;
    }
  }
  else
  {
    double v6 = [(PKPassFaceView *)self faceTemplate];
    [v6 barcodeBottomInset];
    if (v7 == 0.0 || v4 == 9)
    {
    }
    else
    {
      BOOL showsBarcodeView = self->_showsBarcodeView;

      if (showsBarcodeView)
      {
        barcodeView = self->_barcodeView;
        if (!barcodeView)
        {
          double v10 = [[PKBarcodeStickerView alloc] initWithBarcode:v5 validityState:+[PKBarcodeStickerView validityStateForPass:v3] passStyle:v4];
          CGFloat v11 = self->_barcodeView;
          self->_barcodeView = v10;

          CGFloat v12 = [v3 altImage];
          if (v12)
          {
            CGFloat v13 = self->_barcodeView;
            CGFloat v14 = [MEMORY[0x1E4FB1818] imageWithPKImage:v12];
            [(PKBarcodeStickerView *)v13 setAltImage:v14];
          }
          [(PKBarcodeStickerView *)self->_barcodeView sizeToFit];
          [(PKBarcodeStickerView *)self->_barcodeView setAlpha:1.0];
          [(PKBarcodeStickerView *)self->_barcodeView layoutIfNeeded];

          barcodeView = self->_barcodeView;
        }
        [(PKPassFrontFaceView *)self insertContentView:barcodeView ofType:2];
      }
    }
  }
  if (self->_showsLinkedApp && [v3 linksToApp])
  {
    linkedApp = self->_linkedApp;
    if (linkedApp) {
      BOOL v16 = 1;
    }
    else {
      BOOL v16 = v4 == 9;
    }
    if (!v16)
    {
      CGRect v17 = [[PKLinkedApplication alloc] initWithPass:v3];
      [(PKLinkedApplication *)v17 setUseSmallIcon:1];
      CGFloat v18 = [[PKLinkedAppIconView alloc] initWithLinkedApplication:v17];
      double v19 = self->_linkedApp;
      self->_linkedApp = v18;

      CGFloat v20 = [(PKLinkedAppIconView *)self->_linkedApp layer];
      double v21 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v21 scale];
      objc_msgSend(v20, "setRasterizationScale:");

      linkedApp = self->_linkedApp;
    }
    [(PKPassFrontFaceView *)self insertContentView:linkedApp ofType:2];
  }
LABEL_23:
}

- (void)createHeaderContentViews
{
  v18.receiver = self;
  v18.super_class = (Class)PKPassFrontFaceView;
  [(PKPassFaceView *)&v18 createHeaderContentViews];
  int64_t v3 = [(PKPassFaceView *)self style];
  uint64_t v4 = [(PKPassFaceView *)self pass];
  double v5 = [v4 logoText];

  if (v5)
  {
    PKPassFaceLogoRect();
    if (!CGRectIsEmpty(v19) && v3 != 9)
    {
      double v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      logoLabel = self->_logoLabel;
      self->_logoLabel = v6;

      double v8 = self->_logoLabel;
      double v9 = [MEMORY[0x1E4FB1618] clearColor];
      [(UILabel *)v8 setBackgroundColor:v9];

      double v10 = [(PKPassFaceView *)self colorProfile];
      int v11 = [v10 isLight];
      CGFloat v12 = (void *)MEMORY[0x1E4F1CA60];
      CGFloat v13 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:18.0];
      if (v11) {
        [v10 foregroundAttributesForFont:v13];
      }
      else {
      CGFloat v14 = [v10 labelAttributesForFont:v13];
      }
      CGFloat v15 = [v12 dictionaryWithDictionary:v14];

      id v16 = objc_alloc_init(MEMORY[0x1E4FB0848]);
      [v16 setLineBreakMode:4];
      [v16 setAlignment:0];
      [v15 setObject:v16 forKey:*MEMORY[0x1E4FB0738]];
      CGRect v17 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5 attributes:v15];
      [(UILabel *)self->_logoLabel setAttributedText:v17];
      [(PKPassFrontFaceView *)self insertContentView:self->_logoLabel ofType:0];
    }
  }
}

- (void)setShowsLinkedApp:(BOOL)a3
{
  if (((!self->_showsLinkedApp ^ a3) & 1) == 0)
  {
    self->_showsLinkedApp = a3;
    [(PKLinkedAppIconView *)self->_linkedApp setHidden:!a3];
    if (self->_linkedApp)
    {
      if (self->_showsLinkedApp)
      {
        -[PKPassFrontFaceView insertContentView:ofType:](self, "insertContentView:ofType:");
      }
      else
      {
        -[PKPassFaceView removeContentView:ofType:](self, "removeContentView:ofType:");
      }
    }
  }
}

- (void)setShowsBarcodeView:(BOOL)a3 animated:(BOOL)a4
{
  if (((!self->_showsBarcodeView ^ a3) & 1) == 0)
  {
    BOOL v4 = a4;
    self->_BOOL showsBarcodeView = a3;
    if (a3 && !self->_barcodeView) {
      [(PKPassFrontFaceView *)self createBodyContentViews];
    }
    if (self->_barcodeView)
    {
      if (self->_showsBarcodeView) {
        -[PKPassFrontFaceView insertContentView:ofType:](self, "insertContentView:ofType:");
      }
      double v6 = 0.2;
      if (!v4) {
        double v6 = 0.0;
      }
      v7[4] = self;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __52__PKPassFrontFaceView_setShowsBarcodeView_animated___block_invoke;
      v8[3] = &unk_1E59CA7D0;
      v8[4] = self;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __52__PKPassFrontFaceView_setShowsBarcodeView_animated___block_invoke_2;
      v7[3] = &unk_1E59CB6D8;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v8 animations:v7 completion:v6];
    }
  }
}

- (void)setShowsBarcodeView:(BOOL)a3
{
}

- (void)setBottomRightItem:(int64_t)bottomRightItem
{
  if (self->_bottomRightItem == bottomRightItem) {
    return;
  }
  self->_bottomRightItem = bottomRightItem;
  if (self->_bottomRightItemView)
  {
    [(PKPassFaceView *)self removeContentView:self->_bottomRightItemView ofType:2];
    bottomRightItemView = self->_bottomRightItemView;
    self->_bottomRightItemView = 0;

    bottomRightItem = self->_bottomRightItem;
  }
  if (bottomRightItem == 2)
  {
    double v5 = [(PKPassFrontFaceView *)self createExpiredLabel];
  }
  else
  {
    if (bottomRightItem != 1) {
      goto LABEL_9;
    }
    double v5 = [(PKPassFrontFaceView *)self createContactlessLogoView];
  }
  double v6 = self->_bottomRightItemView;
  self->_bottomRightItemView = v5;

LABEL_9:
  double v7 = self->_bottomRightItemView;
  if (v7)
  {
    [(PKPassFrontFaceView *)self insertContentView:v7 ofType:2];
    [(PKPassFrontFaceView *)self setNeedsLayout];
  }
}

- (void)setRelevancyActive:(BOOL)a3
{
  if (self->_relevancyActive != a3) {
    self->_relevancyActive = a3;
  }
}

- (PKPassFrontFaceView)initWithStyle:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPassFrontFaceView;
  CGSize result = [(PKPassFaceView *)&v4 initWithStyle:a3];
  if (result)
  {
    result->_bottomRightItem = 0;
    result->_showsLinkedApp = 1;
    result->_BOOL showsBarcodeView = 1;
  }
  return result;
}

- (void)insertContentView:(id)a3 ofType:(int64_t)a4
{
  double v6 = (PKLinkedAppIconView *)a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPassFrontFaceView;
  [(PKPassFaceView *)&v8 insertContentView:v6 ofType:a4];
  if (self->_linkedApp == v6 || (PKLinkedAppIconView *)self->_bottomRightItemView == v6)
  {
    double v7 = [(PKLinkedAppIconView *)v6 superview];
    [v7 bringSubviewToFront:v6];
  }
}

uint64_t __52__PKPassFrontFaceView_setShowsBarcodeView_animated___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  double v2 = 1.0;
  if (!*(unsigned char *)(v1 + 921)) {
    double v2 = 0.0;
  }
  return [*(id *)(v1 + 904) setAlpha:v2];
}

uint64_t __52__PKPassFrontFaceView_setShowsBarcodeView_animated___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (!*(unsigned char *)(result + 921)) {
    return [(id)result removeContentView:*(void *)(result + 904) ofType:2];
  }
  return result;
}

- (id)templateForLayoutMode:(int64_t)a3
{
  return 0;
}

- (id)createContactlessLogoView
{
  if ([(PKPassFaceView *)self style] == 9)
  {
    int64_t v3 = 0;
  }
  else
  {
    objc_super v4 = PKPassKitUIBundle();
    double v5 = [v4 URLForResource:@"ContactlessLogo" withExtension:@"pdf"];

    double v6 = PKUIScreenScale();
    double v7 = PKUIImageFromPDF(v5, 21.0, 24.0, v6);
    objc_super v8 = [v7 imageWithRenderingMode:2];

    int64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v8];
    [v3 setContentMode:1];
    objc_msgSend(v3, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 21.0, 24.0);
    double v9 = [(PKPassFaceView *)self colorProfile];
    double v10 = [v9 foregroundColor];
    [v3 setTintColor:v10];

    [v3 setAlpha:0.7];
  }

  return v3;
}

- (id)createExpiredLabel
{
  if ([(PKPassFaceView *)self style] == 9)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    objc_super v4 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28E0], (NSString *)*MEMORY[0x1E4FB2788]);
    [v3 setFont:v4];

    double v5 = PKLocalizedString(&cfstr_NfcPassExpired.isa);
    [v3 setText:v5];

    [v3 setTextAlignment:2];
    double v6 = [(PKPassFaceView *)self colorProfile];
    double v7 = [v6 foregroundColor];
    [v3 setTextColor:v7];

    [v3 sizeToFit];
  }

  return v3;
}

- (void)updateValidity
{
  id v3 = [(PKPassFrontFaceView *)self barcodeView];
  objc_super v4 = [(PKPassFaceView *)self pass];
  objc_msgSend(v3, "setValidity:", +[PKBarcodeStickerView validityStateForPass:](PKBarcodeStickerView, "validityStateForPass:", v4));

  [(PKPassFrontFaceView *)self _positionBarcodeView];
}

- (CGRect)barcodeFrame
{
  barcodeView = self->_barcodeView;
  if (barcodeView)
  {
    [(PKBarcodeStickerView *)barcodeView frame];
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB20];
    double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (PKBarcodeStickerView)barcodeView
{
  return self->_barcodeView;
}

- (id)_rebucketAuxiliaryFields:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((unint64_t)[v4 count] > 3)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_super v8 = [v4 lastObject];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          CGFloat v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v13 row] == 1) {
            CGFloat v14 = v7;
          }
          else {
            CGFloat v14 = v6;
          }
          [v14 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }
    CGFloat v15 = [(PKPassFaceView *)self pass];
    id v16 = [v15 frontFieldBuckets];
    CGRect v17 = (void *)[v16 mutableCopy];

    [v17 removeLastObject];
    [v17 addObject:v6];
    [v17 addObject:v7];
    double v5 = (void *)[v17 copy];
  }
  else
  {
    double v5 = (void *)[v4 copy];
  }

  return v5;
}

- (BOOL)showsLinkedApp
{
  return self->_showsLinkedApp;
}

- (int64_t)bottomRightItem
{
  return self->_bottomRightItem;
}

- (BOOL)showsBarcodeView
{
  return self->_showsBarcodeView;
}

- (BOOL)showsLiveBalance
{
  return self->_showsLiveBalance;
}

- (PKLinkedAppIconView)linkedApp
{
  return self->_linkedApp;
}

- (BOOL)isRelevancyActive
{
  return self->_relevancyActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedApp, 0);
  objc_storeStrong((id *)&self->_bottomRightItemView, 0);
  objc_storeStrong((id *)&self->_barcodeView, 0);

  objc_storeStrong((id *)&self->_logoLabel, 0);
}

@end