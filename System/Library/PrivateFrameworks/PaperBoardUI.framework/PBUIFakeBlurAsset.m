@interface PBUIFakeBlurAsset
- (NSString)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)initWithActualStyle:(void *)a3 imageURL:(void *)a4 image:;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (uint64_t)actualStyle;
- (uint64_t)image;
- (uint64_t)imageURL;
@end

@implementation PBUIFakeBlurAsset

- (uint64_t)imageURL
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (uint64_t)actualStyle
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (uint64_t)image
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (id)initWithActualStyle:(void *)a3 imageURL:(void *)a4 image:
{
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)PBUIFakeBlurAsset;
    v9 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v9;
    if (v9)
    {
      v9[1] = a2;
      uint64_t v10 = [v7 copy];
      id v11 = a1[2];
      a1[2] = (id)v10;

      objc_storeStrong(a1 + 3, a4);
    }
  }

  return a1;
}

- (NSString)description
{
  return (NSString *)[(PBUIFakeBlurAsset *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(PBUIFakeBlurAsset *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v5 = PBUIWallpaperStyleDescription(self->_actualStyle);
  [v4 appendString:v5 withName:@"actualStyle"];

  id v6 = (id)[v4 appendObject:self->_imageURL withName:@"imageURL"];
  id v7 = (id)[v4 appendObject:self->_image withName:@"image"];
  return v4;
}

- (id)succinctDescription
{
  v2 = [(PBUIFakeBlurAsset *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
}

@end