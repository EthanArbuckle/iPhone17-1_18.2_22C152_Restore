@interface NUNIClassicTextureGroup
- (NSArray)textures;
- (NUNIClassicTextureGroup)initWithTextures:(id)a3;
@end

@implementation NUNIClassicTextureGroup

- (NUNIClassicTextureGroup)initWithTextures:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUNIClassicTextureGroup;
  v6 = [(NUNIClassicTextureGroup *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_textures, a3);
  }

  return v7;
}

- (NSArray)textures
{
  return self->_textures;
}

- (void).cxx_destruct
{
}

@end