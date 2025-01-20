@interface PXCloudQuotaBannerView
- (CGSize)contentViewSizeForWidth:(double)a3;
- (NSDate)lastUpdatedDate;
- (PXCloudQuotaBannerView)init;
- (PXCloudQuotaBannerView)initWithBannerView:(id)a3;
- (PXCloudQuotaBannerView)initWithCoder:(id)a3;
- (PXCloudQuotaBannerView)initWithContentView:(id)a3;
- (PXCloudQuotaBannerView)initWithFrame:(CGRect)a3;
- (UIFont)contentViewFont;
- (int64_t)offerType;
- (void)setOfferType:(int64_t)a3;
@end

@implementation PXCloudQuotaBannerView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_bannerView, 0);
}

- (void)setOfferType:(int64_t)a3
{
  self->_offerType = a3;
}

- (int64_t)offerType
{
  return self->_offerType;
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (CGSize)contentViewSizeForWidth:(double)a3
{
  -[ICQBannerView sizeThatFits:](self->_bannerView, "sizeThatFits:", a3, 1.79769313e308);
  result.height = v4;
  result.width = v3;
  return result;
}

- (UIFont)contentViewFont
{
  return (UIFont *)[(ICQBannerView *)self->_bannerView font];
}

- (PXCloudQuotaBannerView)initWithBannerView:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXCloudQuotaView.m", 119, @"Invalid parameter not satisfying: %@", @"bannerView" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)PXCloudQuotaBannerView;
  v7 = [(PXCloudQuotaView *)&v14 initWithContentView:v6];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_bannerView, a3);
    v9 = [v6 offer];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = [v9 lastUpdated];
      lastUpdatedDate = v8->_lastUpdatedDate;
      v8->_lastUpdatedDate = (NSDate *)v10;
    }
    v8->_offerType = [v9 offerType];
  }
  return v8;
}

- (PXCloudQuotaBannerView)initWithContentView:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCloudQuotaView.m", 115, @"%s is not available as initializer", "-[PXCloudQuotaBannerView initWithContentView:]");

  abort();
}

- (PXCloudQuotaBannerView)initWithCoder:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCloudQuotaView.m", 111, @"%s is not available as initializer", "-[PXCloudQuotaBannerView initWithCoder:]");

  abort();
}

- (PXCloudQuotaBannerView)initWithFrame:(CGRect)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCloudQuotaView.m", 107, @"%s is not available as initializer", "-[PXCloudQuotaBannerView initWithFrame:]");

  abort();
}

- (PXCloudQuotaBannerView)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCloudQuotaView.m", 103, @"%s is not available as initializer", "-[PXCloudQuotaBannerView init]");

  abort();
}

@end