@interface MOSuggestionAssetPrototype
+ (BOOL)supportsSecureCoding;
- (MOSuggestionAssetPrototype)initWithCoder:(id)a3;
- (NSString)assetType;
- (NSString)identifier;
- (id)init:(id)a3 identifier:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MOSuggestionAssetPrototype

- (id)init:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MOSuggestionAssetPrototype;
  v9 = [(MOSuggestionAssetPrototype *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetType, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  assetType = self->_assetType;
  id v5 = a3;
  [v5 encodeObject:assetType forKey:@"MOSuggestionAssetPrototypeType"];
  [v5 encodeObject:self->_identifier forKey:@"MOSuggestionAssetPrototypeIdentifier"];
}

- (MOSuggestionAssetPrototype)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MOSuggestionAssetPrototype;
  id v5 = [(MOSuggestionAssetPrototype *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MOSuggestionAssetPrototypeType"];
    assetType = v5->_assetType;
    v5->_assetType = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MOSuggestionAssetPrototypeIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;
  }
  return v5;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
}

@end