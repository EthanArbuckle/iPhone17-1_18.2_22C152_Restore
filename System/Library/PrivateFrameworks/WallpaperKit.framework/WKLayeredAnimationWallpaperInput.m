@interface WKLayeredAnimationWallpaperInput
- (BOOL)isEqual:(id)a3;
- (NSURL)backgroundAnimationFileURL;
- (NSURL)floatingAnimationFileURL;
- (NSURL)foregroundAnimationFileURL;
- (WKLayeredAnimationWallpaperInput)initWithBackgroundAnimationFileURL:(id)a3 foregroundAnimationFileURL:(id)a4 floatingAnimationFileURL:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionBuilderBlock;
- (id)wk_descriptionBuilder;
- (unint64_t)hash;
@end

@implementation WKLayeredAnimationWallpaperInput

- (WKLayeredAnimationWallpaperInput)initWithBackgroundAnimationFileURL:(id)a3 foregroundAnimationFileURL:(id)a4 floatingAnimationFileURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)WKLayeredAnimationWallpaperInput;
  v11 = [(WKLayeredAnimationWallpaperInput *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    backgroundAnimationFileURL = v11->_backgroundAnimationFileURL;
    v11->_backgroundAnimationFileURL = (NSURL *)v12;

    uint64_t v14 = [v9 copy];
    foregroundAnimationFileURL = v11->_foregroundAnimationFileURL;
    v11->_foregroundAnimationFileURL = (NSURL *)v14;

    uint64_t v16 = [v10 copy];
    floatingAnimationFileURL = v11->_floatingAnimationFileURL;
    v11->_floatingAnimationFileURL = (NSURL *)v16;
  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(WKLayeredAnimationWallpaperInput *)self backgroundAnimationFileURL];
  v6 = [(WKLayeredAnimationWallpaperInput *)self foregroundAnimationFileURL];
  v7 = [(WKLayeredAnimationWallpaperInput *)self floatingAnimationFileURL];
  id v8 = (void *)[v4 initWithBackgroundAnimationFileURL:v5 foregroundAnimationFileURL:v6 floatingAnimationFileURL:v7];

  return v8;
}

id __47__WKLayeredAnimationWallpaperInput_na_identity__block_invoke()
{
  if (_block_invoke_na_once_token_0_8 != -1) {
    dispatch_once(&_block_invoke_na_once_token_0_8, &__block_literal_global_3);
  }
  v0 = (void *)_block_invoke_na_once_object_0_8;
  return v0;
}

uint64_t __47__WKLayeredAnimationWallpaperInput_na_identity__block_invoke_2()
{
  _block_invoke_na_once_object_0_8 = __47__WKLayeredAnimationWallpaperInput_na_identity__block_invoke_3();
  return MEMORY[0x1F41817F8]();
}

id __47__WKLayeredAnimationWallpaperInput_na_identity__block_invoke_3()
{
  v0 = [MEMORY[0x1E4F7A0E0] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_9];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_11];
  id v3 = (id)[v0 appendCharacteristic:&__block_literal_global_13_0];
  v4 = [v0 build];

  return v4;
}

uint64_t __47__WKLayeredAnimationWallpaperInput_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 backgroundAnimationFileURL];
}

uint64_t __47__WKLayeredAnimationWallpaperInput_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 foregroundAnimationFileURL];
}

uint64_t __47__WKLayeredAnimationWallpaperInput_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 floatingAnimationFileURL];
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

- (id)wk_descriptionBuilder
{
  id v3 = [MEMORY[0x1E4F7A0D0] builderWithObject:self];
  objc_initWeak(&location, self);
  unint64_t v4 = [v3 activeMultilinePrefix];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__WKLayeredAnimationWallpaperInput_wk_descriptionBuilder__block_invoke;
  v7[3] = &unk_1E6376718;
  objc_copyWeak(&v9, &location);
  id v5 = v3;
  id v8 = v5;
  [v5 appendBodySectionWithName:0 multilinePrefix:v4 block:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v5;
}

void __57__WKLayeredAnimationWallpaperInput_wk_descriptionBuilder__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained descriptionBuilderBlock];
  v2[2](v2, *(void *)(a1 + 32));
}

- (id)description
{
  id v2 = [(WKLayeredAnimationWallpaperInput *)self wk_descriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)descriptionBuilderBlock
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__WKLayeredAnimationWallpaperInput_descriptionBuilderBlock__block_invoke;
  v4[3] = &unk_1E6376740;
  objc_copyWeak(&v5, &location);
  id v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __59__WKLayeredAnimationWallpaperInput_descriptionBuilderBlock__block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v4 = [WeakRetained backgroundAnimationFileURL];
  id v5 = (id)[v10 appendObject:v4 withName:@"backgroundAnimationFileURL"];

  v6 = [WeakRetained foregroundAnimationFileURL];
  id v7 = (id)[v10 appendObject:v6 withName:@"foregroundAnimationFileURL"];

  id v8 = [WeakRetained floatingAnimationFileURL];
  id v9 = (id)[v10 appendObject:v8 withName:@"floatingAnimationFileURL"];
}

- (NSURL)backgroundAnimationFileURL
{
  return self->_backgroundAnimationFileURL;
}

- (NSURL)foregroundAnimationFileURL
{
  return self->_foregroundAnimationFileURL;
}

- (NSURL)floatingAnimationFileURL
{
  return self->_floatingAnimationFileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingAnimationFileURL, 0);
  objc_storeStrong((id *)&self->_foregroundAnimationFileURL, 0);
  objc_storeStrong((id *)&self->_backgroundAnimationFileURL, 0);
}

@end