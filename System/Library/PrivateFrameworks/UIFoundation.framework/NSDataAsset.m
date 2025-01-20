@interface NSDataAsset
+ (id)_namedDataPrivateAccessorWithName:(id)a3 bundle:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSData)data;
- (NSDataAsset)init;
- (NSDataAsset)initWithName:(NSDataAssetName)name;
- (NSDataAsset)initWithName:(NSDataAssetName)name bundle:(NSBundle *)bundle;
- (NSDataAssetName)name;
- (NSString)typeIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation NSDataAsset

- (NSData)data
{
  result = (NSData *)[(CUINamedData *)self->_namedData data];
  if (!result)
  {
    v3 = (void *)MEMORY[0x1E4F1C9B8];
    return (NSData *)[v3 data];
  }
  return result;
}

- (NSString)typeIdentifier
{
  result = (NSString *)[(CUINamedData *)self->_namedData utiType];
  if (!result)
  {
    v3 = (void *)*MEMORY[0x1E4F44378];
    return (NSString *)[v3 identifier];
  }
  return result;
}

- (NSDataAsset)initWithName:(NSDataAssetName)name bundle:(NSBundle *)bundle
{
  if (!name) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSDataAsset.m", 41, @"You cannot create an instance of %@ with a nil name.", objc_opt_class());
  }
  v11.receiver = self;
  v11.super_class = (Class)NSDataAsset;
  v7 = [(NSDataAsset *)&v11 init];
  if (v7)
  {
    if (!bundle) {
      bundle = (NSBundle *)[MEMORY[0x1E4F28B50] mainBundle];
    }
    if (_NSTextScalingTypeForCurrentEnvironment() == 1) {
      v8 = (void *)[(id)objc_opt_class() _namedDataPrivateAccessorWithName:name bundle:bundle];
    }
    else {
      v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F5E048], "defaultUICatalogForBundle:", bundle), "dataWithName:", name);
    }
    v9 = v8;
    v7->_namedData = v9;
    if (!v9)
    {

      return 0;
    }
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSDataAsset;
  [(NSDataAsset *)&v3 dealloc];
}

- (NSDataAsset)init
{
  return 0;
}

- (NSDataAsset)initWithName:(NSDataAssetName)name
{
  uint64_t v5 = [MEMORY[0x1E4F28B50] mainBundle];

  return [(NSDataAsset *)self initWithName:name bundle:v5];
}

+ (id)_namedDataPrivateAccessorWithName:(id)a3 bundle:(id)a4
{
  uint64_t v5 = (void *)[MEMORY[0x1E4F5E048] defaultUICatalogForBundle:a4];

  return (id)[v5 dataWithName:a3];
}

- (NSDataAssetName)name
{
  NSDataAssetName result = (NSDataAssetName)[(CUINamedData *)self->_namedData name];
  if (!result) {
    return (NSDataAssetName)&stru_1EDD49F70;
  }
  return result;
}

- (unint64_t)hash
{
  return [(CUINamedData *)self->_namedData hash];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  namedData = self->_namedData;
  uint64_t v6 = *((void *)a3 + 1);

  return [(CUINamedData *)namedData isEqual:v6];
}

- (id)description
{
  objc_super v3 = [(NSDataAsset *)self name];
  v4 = [(NSDataAsset *)self typeIdentifier];
  uint64_t v5 = [(NSDataAsset *)self data];
  v7.receiver = self;
  v7.super_class = (Class)NSDataAsset;
  return (id)[NSString stringWithFormat:@"%@ name:'%@' typeIdentifier='%@' data=%p (length=%lu)", -[NSDataAsset description](&v7, sel_description), v3, v4, v5, -[NSData length](v5, "length")];
}

@end