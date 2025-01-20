@interface WKParameterizedCAWallpaperInput
- (BOOL)isEqual:(id)a3;
- (NSURL)fileURL;
- (WKParameterizedCAWallpaperInput)initWithFileURL:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionBuilderBlock;
- (id)wk_descriptionBuilder;
- (unint64_t)hash;
@end

@implementation WKParameterizedCAWallpaperInput

- (WKParameterizedCAWallpaperInput)initWithFileURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WKParameterizedCAWallpaperInput;
  v5 = [(WKParameterizedCAWallpaperInput *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    fileURL = v5->_fileURL;
    v5->_fileURL = (NSURL *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(WKParameterizedCAWallpaperInput *)self fileURL];
  uint64_t v6 = (void *)[v4 initWithFileURL:v5];

  return v6;
}

id __46__WKParameterizedCAWallpaperInput_na_identity__block_invoke()
{
  if (_block_invoke_na_once_token_0_12 != -1) {
    dispatch_once(&_block_invoke_na_once_token_0_12, &__block_literal_global_3_0);
  }
  v0 = (void *)_block_invoke_na_once_object_0_12;
  return v0;
}

uint64_t __46__WKParameterizedCAWallpaperInput_na_identity__block_invoke_2()
{
  _block_invoke_na_once_object_0_12 = __46__WKParameterizedCAWallpaperInput_na_identity__block_invoke_3();
  return MEMORY[0x1F41817F8]();
}

id __46__WKParameterizedCAWallpaperInput_na_identity__block_invoke_3()
{
  v0 = [MEMORY[0x1E4F7A0E0] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_9_1];
  v2 = [v0 build];

  return v2;
}

uint64_t __46__WKParameterizedCAWallpaperInput_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 fileURL];
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
  v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (id)wk_descriptionBuilder
{
  v3 = [MEMORY[0x1E4F7A0D0] builderWithObject:self];
  objc_initWeak(&location, self);
  unint64_t v4 = [v3 activeMultilinePrefix];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__WKParameterizedCAWallpaperInput_wk_descriptionBuilder__block_invoke;
  v7[3] = &unk_1E6376718;
  objc_copyWeak(&v9, &location);
  id v5 = v3;
  id v8 = v5;
  [v5 appendBodySectionWithName:0 multilinePrefix:v4 block:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v5;
}

void __56__WKParameterizedCAWallpaperInput_wk_descriptionBuilder__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained descriptionBuilderBlock];
  v2[2](v2, *(void *)(a1 + 32));
}

- (id)description
{
  v2 = [(WKParameterizedCAWallpaperInput *)self wk_descriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)descriptionBuilderBlock
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__WKParameterizedCAWallpaperInput_descriptionBuilderBlock__block_invoke;
  v4[3] = &unk_1E6376740;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __58__WKParameterizedCAWallpaperInput_descriptionBuilderBlock__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v4 = [WeakRetained fileURL];
  id v5 = (id)[v6 appendObject:v4 withName:@"fileURL"];
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void).cxx_destruct
{
}

@end