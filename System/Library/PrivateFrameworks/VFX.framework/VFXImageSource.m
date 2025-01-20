@interface VFXImageSource
- (BOOL)isOpaque;
- (BOOL)isPremultiplied;
- (id)textureSource;
- (void)connectToProxy:(__CFXImageProxy *)a3;
@end

@implementation VFXImageSource

- (id)textureSource
{
  v2 = NSStringFromSelector(a2);
  sub_1B63F2F54(16, @"Error: VFXImageSource astract method invoked %@", v3, v4, v5, v6, v7, v8, (uint64_t)v2);
  return 0;
}

- (BOOL)isOpaque
{
  return 1;
}

- (BOOL)isPremultiplied
{
  return 1;
}

- (void)connectToProxy:(__CFXImageProxy *)a3
{
  sub_1B6451C58((uint64_t)a3, self, 0, v3, v4, v5, v6, v7);
  v15[0] = xmmword_1F0FBAC70;
  v15[1] = *(_OWORD *)&off_1F0FBAC80;
  sub_1B6451CE4((uint64_t)a3, (uint64_t)v15, v9, v10, v11, v12, v13, v14);
}

@end