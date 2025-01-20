@interface MFMessageScreenshotConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)showBanners;
- (BOOL)showSourceMailbox;
- (CGSize)size;
- (MFMessageScreenshotConfiguration)init;
- (MFMessageScreenshotConfiguration)initWithCoder:(id)a3;
- (UIEdgeInsets)margins;
- (UITraitCollection)traitCollection;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setMargins:(UIEdgeInsets)a3;
- (void)setShowBanners:(BOOL)a3;
- (void)setShowSourceMailbox:(BOOL)a3;
- (void)setSize:(CGSize)a3;
- (void)setTraitCollection:(id)a3;
@end

@implementation MFMessageScreenshotConfiguration

- (MFMessageScreenshotConfiguration)init
{
  v7.receiver = self;
  v7.super_class = (Class)MFMessageScreenshotConfiguration;
  v2 = [(MFMessageScreenshotConfiguration *)&v7 init];
  v3 = (MFMessageScreenshotConfiguration *)v2;
  if (v2)
  {
    *((_WORD *)v2 + 4) = 257;
    *(CGSize *)(v2 + 24) = CGSizeZero;
    long long v4 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    *(_OWORD *)(v2 + 40) = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(_OWORD *)(v2 + 56) = v4;
    v5 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setShowBanners:[self showBanners]];
  [v4 setShowSourceMailbox:[self showSourceMailbox]];
  [(MFMessageScreenshotConfiguration *)self size];
  [v4 setSize:];
  [(MFMessageScreenshotConfiguration *)self margins];
  [v4 setMargins:];
  v5 = [(MFMessageScreenshotConfiguration *)self traitCollection];
  [v4 setTraitCollection:v5];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  id v4 = [(MFMessageScreenshotConfiguration *)self traitCollection];
  [v9 encodeObject:v4 forKey:@"kMFCodingKeyTraitCollection"];

  v5 = +[NSNumber numberWithBool:[(MFMessageScreenshotConfiguration *)self showBanners]];
  [v9 encodeObject:v5 forKey:@"kMFCodingKeyShowBanners"];

  v6 = +[NSNumber numberWithBool:[(MFMessageScreenshotConfiguration *)self showSourceMailbox]];
  [v9 encodeObject:v6 forKey:@"kMFCodingKeyShowSourceMailbox"];

  [(MFMessageScreenshotConfiguration *)self size];
  objc_super v7 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:");
  [v9 encodeObject:v7 forKey:@"kMFCodingKeySize"];

  [(MFMessageScreenshotConfiguration *)self margins];
  v8 = +[NSValue valueWithUIEdgeInsets:](NSValue, "valueWithUIEdgeInsets:");
  [v9 encodeObject:v8 forKey:@"kMFCodingKeyMargins"];
}

- (MFMessageScreenshotConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MFMessageScreenshotConfiguration *)self init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMFCodingKeyShowSourceMailbox"];
    objc_super v7 = v6;
    if (v6) {
      unsigned __int8 v8 = [v6 BOOLValue];
    }
    else {
      unsigned __int8 v8 = 1;
    }
    v5->_showSourceMailbox = v8;
    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMFCodingKeyShowBanners"];

    if (v9) {
      unsigned __int8 v10 = [v9 BOOLValue];
    }
    else {
      unsigned __int8 v10 = 1;
    }
    v5->_showBanners = v10;
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMFCodingKeySize"];
    [v11 CGSizeValue];
    v5->_size.width = v12;
    v5->_size.height = v13;

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMFCodingKeyMargins"];
    [v14 UIEdgeInsetsValue];
    v5->_margins.top = v15;
    v5->_margins.left = v16;
    v5->_margins.bottom = v17;
    v5->_margins.right = v18;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMFCodingKeyTraitCollection"];
    traitCollection = v5->_traitCollection;
    v5->_traitCollection = (UITraitCollection *)v19;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)showSourceMailbox
{
  return self->_showSourceMailbox;
}

- (void)setShowSourceMailbox:(BOOL)a3
{
  self->_showSourceMailbox = a3;
}

- (BOOL)showBanners
{
  return self->_showBanners;
}

- (void)setShowBanners:(BOOL)a3
{
  self->_showBanners = a3;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (UIEdgeInsets)margins
{
  double top = self->_margins.top;
  double left = self->_margins.left;
  double bottom = self->_margins.bottom;
  double right = self->_margins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setMargins:(UIEdgeInsets)a3
{
  self->_margins = a3;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end