@interface MOSuggestionAssetsArrayTransport
+ (BOOL)supportsSecureCoding;
- (MOSuggestionAssetsArrayTransport)initWithCoder:(id)a3;
- (NSArray)assets;
- (void)encodeWithCoder:(id)a3;
- (void)setAssets:(id)a3;
@end

@implementation MOSuggestionAssetsArrayTransport

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (MOSuggestionAssetsArrayTransport)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MOSuggestionAssetsArrayTransport;
  v5 = [(MOSuggestionAssetsArrayTransport *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"coderKeyMOSuggestionAssetsArrayTransport"];
    assets = v5->_assets;
    v5->_assets = (NSArray *)v9;
  }
  return v5;
}

- (NSArray)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
}

- (void).cxx_destruct
{
}

@end