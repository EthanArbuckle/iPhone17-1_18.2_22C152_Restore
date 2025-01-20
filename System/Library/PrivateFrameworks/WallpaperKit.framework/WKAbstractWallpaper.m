@interface WKAbstractWallpaper
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsCopying;
- (BOOL)supportsSerialization;
- (NADescriptionBuilder)wk_descriptionBuilder;
- (NSString)description;
- (NSString)name;
- (NSURL)thumbnailImageURL;
- (UIImage)thumbnailImage;
- (WKAbstractWallpaper)init;
- (WKAbstractWallpaper)initWithIdentifier:(int64_t)a3 name:(id)a4 type:(unint64_t)a5 representedType:(unint64_t)a6 backingType:(unint64_t)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderBlock;
- (id)propertyListRepresentation;
- (int64_t)identifier;
- (unint64_t)backingType;
- (unint64_t)hash;
- (unint64_t)representedType;
- (unint64_t)type;
- (void)setBackingType:(unint64_t)a3;
- (void)setRepresentedType:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation WKAbstractWallpaper

+ (id)new
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [v4 stringWithFormat:@"Attempted to initialize %@ without using designated initializer.", v6];
  id v8 = [v2 exceptionWithName:v3 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (WKAbstractWallpaper)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [v4 stringWithFormat:@"Attempted to initialize %@ without using designated initializer.", v6];
  id v8 = [v2 exceptionWithName:v3 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (WKAbstractWallpaper)initWithIdentifier:(int64_t)a3 name:(id)a4 type:(unint64_t)a5 representedType:(unint64_t)a6 backingType:(unint64_t)a7
{
  id v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WKAbstractWallpaper;
  v14 = [(WKAbstractWallpaper *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_identifier = a3;
    objc_storeStrong((id *)&v14->_name, a4);
    v15->_type = a5;
    v15->_representedType = a6;
    v15->_backingType = a7;
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  int64_t v5 = [(WKAbstractWallpaper *)self identifier];
  v6 = [(WKAbstractWallpaper *)self name];
  v7 = objc_msgSend(v4, "initWithIdentifier:name:type:representedType:backingType:", v5, v6, -[WKAbstractWallpaper type](self, "type"), -[WKAbstractWallpaper representedType](self, "representedType"), -[WKAbstractWallpaper backingType](self, "backingType"));

  return v7;
}

- (BOOL)supportsSerialization
{
  return 0;
}

- (BOOL)supportsCopying
{
  return 0;
}

- (id)propertyListRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[WKAbstractWallpaper identifier](self, "identifier"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", v4, @"identifier");

  int64_t v5 = WKStringFromWallpaperType([(WKAbstractWallpaper *)self type]);
  objc_msgSend(v3, "na_safeSetObject:forKey:", v5, @"type");

  v6 = [(WKAbstractWallpaper *)self name];
  objc_msgSend(v3, "na_safeSetObject:forKey:", v6, @"name");

  return v3;
}

- (NSURL)thumbnailImageURL
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  int64_t v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (UIImage)thumbnailImage
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  int64_t v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

id __34__WKAbstractWallpaper_na_identity__block_invoke()
{
  if (_block_invoke_na_once_token_0_5 != -1) {
    dispatch_once(&_block_invoke_na_once_token_0_5, &__block_literal_global_10_0);
  }
  v0 = (void *)_block_invoke_na_once_object_0_5;
  return v0;
}

uint64_t __34__WKAbstractWallpaper_na_identity__block_invoke_2()
{
  _block_invoke_na_once_object_0_5 = __34__WKAbstractWallpaper_na_identity__block_invoke_3();
  return MEMORY[0x1F41817F8]();
}

id __34__WKAbstractWallpaper_na_identity__block_invoke_3()
{
  v0 = [MEMORY[0x1E4F7A0E0] builder];
  id v1 = (id)[v0 appendIntegerCharacteristic:&__block_literal_global_17_0];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_20_0];
  id v3 = (id)[v0 appendIntegerCharacteristic:&__block_literal_global_22_1];
  id v4 = (id)[v0 appendIntegerCharacteristic:&__block_literal_global_24_0];
  id v5 = (id)[v0 appendIntegerCharacteristic:&__block_literal_global_26];
  id v6 = (id)[v0 appendCharacteristic:&__block_literal_global_28];
  id v7 = (id)[v0 appendCharacteristic:&__block_literal_global_30_0];
  id v8 = [v0 build];

  return v8;
}

uint64_t __34__WKAbstractWallpaper_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __34__WKAbstractWallpaper_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 name];
}

uint64_t __34__WKAbstractWallpaper_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 type];
}

uint64_t __34__WKAbstractWallpaper_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 representedType];
}

uint64_t __34__WKAbstractWallpaper_na_identity__block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 backingType];
}

uint64_t __34__WKAbstractWallpaper_na_identity__block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 supportsSerialization];
  return [v2 numberWithBool:v3];
}

uint64_t __34__WKAbstractWallpaper_na_identity__block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 supportsCopying];
  return [v2 numberWithBool:v3];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (NADescriptionBuilder)wk_descriptionBuilder
{
  uint64_t v3 = [MEMORY[0x1E4F7A0D0] builderWithObject:self];
  objc_initWeak(&location, self);
  unint64_t v4 = [v3 activeMultilinePrefix];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__WKAbstractWallpaper_wk_descriptionBuilder__block_invoke;
  v7[3] = &unk_1E6376718;
  objc_copyWeak(&v9, &location);
  id v5 = v3;
  id v8 = v5;
  [v5 appendBodySectionWithName:0 multilinePrefix:v4 block:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return (NADescriptionBuilder *)v5;
}

void __44__WKAbstractWallpaper_wk_descriptionBuilder__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained descriptionBuilderBlock];
  v2[2](v2, *(void *)(a1 + 32));
}

- (NSString)description
{
  id v2 = [(WKAbstractWallpaper *)self wk_descriptionBuilder];
  uint64_t v3 = [v2 build];

  return (NSString *)v3;
}

- (id)descriptionBuilderBlock
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__WKAbstractWallpaper_descriptionBuilderBlock__block_invoke;
  v4[3] = &unk_1E6376740;
  objc_copyWeak(&v5, &location);
  id v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __46__WKAbstractWallpaper_descriptionBuilderBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", objc_msgSend(WeakRetained, "identifier"), @"identifier");
  id v5 = [WeakRetained name];
  [v3 appendString:v5 withName:@"name"];

  id v6 = WKStringFromWallpaperType([WeakRetained type]);
  [v3 appendString:v6 withName:@"type"];

  id v7 = WKStringFromWallpaperType([WeakRetained representedType]);
  [v3 appendString:v7 withName:@"representedType"];

  id v8 = WKStringFromWallpaperBackingType([WeakRetained backingType]);
  [v3 appendString:v8 withName:@"backingType"];

  id v9 = WKStringFromWallpaperBackingType([WeakRetained supportsSerialization]);
  [v3 appendString:v9 withName:@"supportsSerialization"];
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)representedType
{
  return self->_representedType;
}

- (void)setRepresentedType:(unint64_t)a3
{
  self->_representedType = a3;
}

- (unint64_t)backingType
{
  return self->_backingType;
}

- (void)setBackingType:(unint64_t)a3
{
  self->_backingType = a3;
}

- (void).cxx_destruct
{
}

@end