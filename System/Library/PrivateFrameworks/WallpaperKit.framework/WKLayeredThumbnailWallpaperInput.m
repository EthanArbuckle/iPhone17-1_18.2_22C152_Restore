@interface WKLayeredThumbnailWallpaperInput
+ (WKLayeredThumbnailWallpaperInput)new;
- (BOOL)isEqual:(id)a3;
- (NADescriptionBuilder)wk_descriptionBuilder;
- (NSString)description;
- (NSURL)backgroundThumbnailImageURL;
- (NSURL)floatingThumbnailImageURL;
- (NSURL)foregroundThumbnailImageURL;
- (WKLayeredThumbnailWallpaperInput)init;
- (WKLayeredThumbnailWallpaperInput)initWithBackgroundThumbnailImageURL:(id)a3 foregroundThumbnailImageURL:(id)a4 floatingThumbnailImageURL:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderBlock;
- (unint64_t)hash;
@end

@implementation WKLayeredThumbnailWallpaperInput

+ (WKLayeredThumbnailWallpaperInput)new
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

- (WKLayeredThumbnailWallpaperInput)init
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

- (WKLayeredThumbnailWallpaperInput)initWithBackgroundThumbnailImageURL:(id)a3 foregroundThumbnailImageURL:(id)a4 floatingThumbnailImageURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)WKLayeredThumbnailWallpaperInput;
  v11 = [(WKLayeredThumbnailWallpaperInput *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    backgroundThumbnailImageURL = v11->_backgroundThumbnailImageURL;
    v11->_backgroundThumbnailImageURL = (NSURL *)v12;

    uint64_t v14 = [v9 copy];
    foregroundThumbnailImageURL = v11->_foregroundThumbnailImageURL;
    v11->_foregroundThumbnailImageURL = (NSURL *)v14;

    uint64_t v16 = [v10 copy];
    floatingThumbnailImageURL = v11->_floatingThumbnailImageURL;
    v11->_floatingThumbnailImageURL = (NSURL *)v16;
  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(WKLayeredThumbnailWallpaperInput *)self backgroundThumbnailImageURL];
  v6 = [(WKLayeredThumbnailWallpaperInput *)self foregroundThumbnailImageURL];
  v7 = [(WKLayeredThumbnailWallpaperInput *)self floatingThumbnailImageURL];
  id v8 = (void *)[v4 initWithBackgroundThumbnailImageURL:v5 foregroundThumbnailImageURL:v6 floatingThumbnailImageURL:v7];

  return v8;
}

id __47__WKLayeredThumbnailWallpaperInput_na_identity__block_invoke()
{
  if (_block_invoke_na_once_token_0_7 != -1) {
    dispatch_once(&_block_invoke_na_once_token_0_7, &__block_literal_global_5_1);
  }
  v0 = (void *)_block_invoke_na_once_object_0_7;
  return v0;
}

uint64_t __47__WKLayeredThumbnailWallpaperInput_na_identity__block_invoke_2()
{
  _block_invoke_na_once_object_0_7 = __47__WKLayeredThumbnailWallpaperInput_na_identity__block_invoke_3();
  return MEMORY[0x1F41817F8]();
}

id __47__WKLayeredThumbnailWallpaperInput_na_identity__block_invoke_3()
{
  v0 = [MEMORY[0x1E4F7A0E0] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_12_0];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_14_1];
  id v3 = (id)[v0 appendCharacteristic:&__block_literal_global_16];
  v4 = [v0 build];

  return v4;
}

uint64_t __47__WKLayeredThumbnailWallpaperInput_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 backgroundThumbnailImageURL];
}

uint64_t __47__WKLayeredThumbnailWallpaperInput_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 foregroundThumbnailImageURL];
}

uint64_t __47__WKLayeredThumbnailWallpaperInput_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 floatingThumbnailImageURL];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  id v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (NADescriptionBuilder)wk_descriptionBuilder
{
  id v3 = [MEMORY[0x1E4F7A0D0] builderWithObject:self];
  objc_initWeak(&location, self);
  unint64_t v4 = [v3 activeMultilinePrefix];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__WKLayeredThumbnailWallpaperInput_wk_descriptionBuilder__block_invoke;
  v7[3] = &unk_1E6376718;
  objc_copyWeak(&v9, &location);
  id v5 = v3;
  id v8 = v5;
  [v5 appendBodySectionWithName:0 multilinePrefix:v4 block:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return (NADescriptionBuilder *)v5;
}

void __57__WKLayeredThumbnailWallpaperInput_wk_descriptionBuilder__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained descriptionBuilderBlock];
  v2[2](v2, *(void *)(a1 + 32));
}

- (NSString)description
{
  id v2 = [(WKLayeredThumbnailWallpaperInput *)self wk_descriptionBuilder];
  id v3 = [v2 build];

  return (NSString *)v3;
}

- (id)descriptionBuilderBlock
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__WKLayeredThumbnailWallpaperInput_descriptionBuilderBlock__block_invoke;
  v4[3] = &unk_1E6376740;
  objc_copyWeak(&v5, &location);
  id v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __59__WKLayeredThumbnailWallpaperInput_descriptionBuilderBlock__block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v4 = [WeakRetained backgroundThumbnailImageURL];
  id v5 = [v4 path];
  id v6 = (id)[v13 appendObject:v5 withName:@"backgroundThumbnailImageURL"];

  v7 = [WeakRetained foregroundThumbnailImageURL];
  id v8 = [v7 path];
  id v9 = (id)[v13 appendObject:v8 withName:@"foregroundThumbnailImageURL"];

  id v10 = [WeakRetained floatingThumbnailImageURL];
  v11 = [v10 path];
  id v12 = (id)[v13 appendObject:v11 withName:@"floatingThumbnailImageURL"];
}

- (NSURL)backgroundThumbnailImageURL
{
  return self->_backgroundThumbnailImageURL;
}

- (NSURL)foregroundThumbnailImageURL
{
  return self->_foregroundThumbnailImageURL;
}

- (NSURL)floatingThumbnailImageURL
{
  return self->_floatingThumbnailImageURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingThumbnailImageURL, 0);
  objc_storeStrong((id *)&self->_foregroundThumbnailImageURL, 0);
  objc_storeStrong((id *)&self->_backgroundThumbnailImageURL, 0);
}

@end