@interface PKPassBarcodeFooterView
- (void)layoutSubviews;
@end

@implementation PKPassBarcodeFooterView

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKPassBarcodeFooterView;
  [(PKPassFooterContentView *)&v4 layoutSubviews];
  if ((unint64_t)PKUIGetMinScreenType() <= 3)
  {
    v3 = [(PKPassFooterContentView *)self bottomRule];
    [v3 frame];
    objc_msgSend(v3, "setFrame:");
  }
}

@end