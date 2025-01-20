@interface PKPaymentSetupProductImageAssetURLs
+ (BOOL)supportsSecureCoding;
- (NSURL)digitalCardImageUrl;
- (NSURL)logoImageUrl;
- (NSURL)thumbnailImageUrl;
- (PKPaymentSetupProductImageAssetURLs)initWithCoder:(id)a3;
- (PKPaymentSetupProductImageAssetURLs)initWithImageAssetsDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPaymentSetupProductImageAssetURLs

- (PKPaymentSetupProductImageAssetURLs)initWithImageAssetsDictionary:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKPaymentSetupProductImageAssetURLs;
  v5 = [(PKPaymentSetupProductImageAssetURLs *)&v25 init];
  if (v5)
  {
    double v6 = PKScreenScale();
    v7 = @"2x";
    if (v6 > 2.0) {
      v7 = @"3x";
    }
    v8 = (void *)MEMORY[0x1E4F1CB10];
    v9 = v7;
    v10 = [v4 PKDictionaryForKey:@"digitalCardImage"];
    v11 = [v10 objectForKeyedSubscript:v9];
    uint64_t v12 = [v8 URLWithString:v11];
    digitalCardImageUrl = v5->_digitalCardImageUrl;
    v5->_digitalCardImageUrl = (NSURL *)v12;

    v14 = (void *)MEMORY[0x1E4F1CB10];
    v15 = [v4 PKDictionaryForKey:@"thumbnailImage"];
    v16 = [v15 objectForKeyedSubscript:v9];
    uint64_t v17 = [v14 URLWithString:v16];
    thumbnailImageUrl = v5->_thumbnailImageUrl;
    v5->_thumbnailImageUrl = (NSURL *)v17;

    v19 = (void *)MEMORY[0x1E4F1CB10];
    v20 = [v4 PKDictionaryForKey:@"logoImage"];
    v21 = [v20 objectForKeyedSubscript:v9];

    uint64_t v22 = [v19 URLWithString:v21];
    logoImageUrl = v5->_logoImageUrl;
    v5->_logoImageUrl = (NSURL *)v22;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[PKPaymentSetupProductImageAssetURLs allocWithZone:](PKPaymentSetupProductImageAssetURLs, "allocWithZone:") init];
  uint64_t v6 = [(NSURL *)self->_digitalCardImageUrl copyWithZone:a3];
  digitalCardImageUrl = v5->_digitalCardImageUrl;
  v5->_digitalCardImageUrl = (NSURL *)v6;

  uint64_t v8 = [(NSURL *)self->_thumbnailImageUrl copyWithZone:a3];
  thumbnailImageUrl = v5->_thumbnailImageUrl;
  v5->_thumbnailImageUrl = (NSURL *)v8;

  uint64_t v10 = [(NSURL *)self->_logoImageUrl copyWithZone:a3];
  logoImageUrl = v5->_logoImageUrl;
  v5->_logoImageUrl = (NSURL *)v10;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentSetupProductImageAssetURLs)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentSetupProductImageAssetURLs;
  v5 = [(PKPaymentSetupProductImageAssetURLs *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"digitalCardImage"];
    digitalCardImageUrl = v5->_digitalCardImageUrl;
    v5->_digitalCardImageUrl = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"thumbnailImage"];
    thumbnailImageUrl = v5->_thumbnailImageUrl;
    v5->_thumbnailImageUrl = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"logoImage"];
    logoImageUrl = v5->_logoImageUrl;
    v5->_logoImageUrl = (NSURL *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  digitalCardImageUrl = self->_digitalCardImageUrl;
  id v5 = a3;
  [v5 encodeObject:digitalCardImageUrl forKey:@"digitalCardImage"];
  [v5 encodeObject:self->_thumbnailImageUrl forKey:@"thumbnailImage"];
  [v5 encodeObject:self->_logoImageUrl forKey:@"logoImage"];
}

- (NSURL)digitalCardImageUrl
{
  return self->_digitalCardImageUrl;
}

- (NSURL)thumbnailImageUrl
{
  return self->_thumbnailImageUrl;
}

- (NSURL)logoImageUrl
{
  return self->_logoImageUrl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logoImageUrl, 0);
  objc_storeStrong((id *)&self->_thumbnailImageUrl, 0);
  objc_storeStrong((id *)&self->_digitalCardImageUrl, 0);
}

@end