@interface PXCloudQuotaMockView
- (CGSize)contentViewSizeForWidth:(double)a3;
- (PXCloudQuotaMockView)init;
- (PXCloudQuotaMockView)initWithCloudQuotaFull:(BOOL)a3;
- (PXCloudQuotaMockView)initWithCoder:(id)a3;
- (PXCloudQuotaMockView)initWithContentView:(id)a3;
- (PXCloudQuotaMockView)initWithFrame:(CGRect)a3;
- (id)contentViewFont;
@end

@implementation PXCloudQuotaMockView

- (CGSize)contentViewSizeForWidth:(double)a3
{
  double v3 = 100.0;
  result.height = v3;
  result.width = a3;
  return result;
}

- (id)contentViewFont
{
}

- (PXCloudQuotaMockView)initWithCloudQuotaFull:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  objc_msgSend(v4, "_setCornerRadius:", 10.0, self);
  v5 = [MEMORY[0x1E4FB1618] systemExtraLightGrayColor];
  [v4 setBackgroundColor:v5];

  v6 = [v4 layer];
  [v6 setBorderWidth:2.0];

  id v7 = [MEMORY[0x1E4FB1618] systemLightGrayColor];
  uint64_t v8 = [v7 CGColor];
  v9 = [v4 layer];
  [v9 setBorderColor:v8];

  id v10 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  if (v3) {
    v11 = @"Mock: iCloud storage is full.";
  }
  else {
    v11 = @"Mock: iCloud storage is almost full.";
  }
  [v10 setText:v11];
  PXFontWithTextStyleSymbolicTraits();
}

- (PXCloudQuotaMockView)initWithContentView:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCloudQuotaView.m", 162, @"%s is not available as initializer", "-[PXCloudQuotaMockView initWithContentView:]");

  abort();
}

- (PXCloudQuotaMockView)initWithCoder:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCloudQuotaView.m", 158, @"%s is not available as initializer", "-[PXCloudQuotaMockView initWithCoder:]");

  abort();
}

- (PXCloudQuotaMockView)initWithFrame:(CGRect)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCloudQuotaView.m", 154, @"%s is not available as initializer", "-[PXCloudQuotaMockView initWithFrame:]");

  abort();
}

- (PXCloudQuotaMockView)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCloudQuotaView.m", 150, @"%s is not available as initializer", "-[PXCloudQuotaMockView init]");

  abort();
}

@end