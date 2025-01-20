@interface WCAFetchRequest
+ (BOOL)supportsSecureCoding;
- (WCAAsset)asset;
- (WCAFetchRequest)initWithCoder:(id)a3;
- (id)completionHandler;
- (void)encodeWithCoder:(id)a3;
- (void)setAsset:(id)a3;
- (void)setCompletionHandler:(id)a3;
@end

@implementation WCAFetchRequest

- (void)encodeWithCoder:(id)a3
{
}

- (void)setCompletionHandler:(id)a3
{
}

- (void)setAsset:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WCAFetchRequest)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WCAFetchRequest;
  id v3 = a3;
  v4 = [(WCAFetchRequest *)&v8 init];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_asset", v8.receiver, v8.super_class);

  asset = v4->_asset;
  v4->_asset = (WCAAsset *)v5;

  return v4;
}

- (WCAAsset)asset
{
  return self->_asset;
}

@end