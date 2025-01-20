@interface MOSuggestionAssetTypeOptions
+ (BOOL)supportsSecureCoding;
- (MOSuggestionAssetTypeOptions)initWithCoder:(id)a3;
- (NSArray)requestedTypes;
- (void)encodeWithCoder:(id)a3;
- (void)setRequestedTypes:(id)a3;
@end

@implementation MOSuggestionAssetTypeOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (MOSuggestionAssetTypeOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MOSuggestionAssetTypeOptions;
  v5 = [(MOSuggestionAssetTypeOptions *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"types"];
    requestedTypes = v5->_requestedTypes;
    v5->_requestedTypes = (NSArray *)v9;
  }
  return v5;
}

- (NSArray)requestedTypes
{
  return self->_requestedTypes;
}

- (void)setRequestedTypes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end