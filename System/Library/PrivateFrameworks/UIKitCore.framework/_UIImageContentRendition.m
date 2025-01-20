@interface _UIImageContentRendition
+ (id)renditionWithResult:(uint64_t)a1;
+ (id)renditionWithResult:(void *)a3 color:;
+ (id)renditionWithResult:(void *)a3 color:(void *)a4 effects:;
+ (id)renditionWithResult:(void *)a3 color:(void *)a4 effects:(int)a5 drawMode:;
- (uint64_t)CGImage;
- (uint64_t)drawInContext:(uint64_t)result;
- (void)dealloc;
- (void)rbSymbolConfiguration;
@end

@implementation _UIImageContentRendition

- (uint64_t)CGImage
{
  if (result)
  {
    uint64_t v1 = result;
    result = *(void *)(result + 8);
    if (!result)
    {
      -[_UIImageContentRenditionResult CGImageProvider](*(void **)(v1 + 32));
      v2 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
      v3 = (CGImage *)v2[2]();
      *(void *)(v1 + 8) = CGImageRetain(v3);

      return *(void *)(v1 + 8);
    }
  }
  return result;
}

+ (id)renditionWithResult:(void *)a3 color:(void *)a4 effects:(int)a5 drawMode:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  self;
  uint64_t v11 = objc_opt_new();
  v12 = *(void **)(v11 + 32);
  *(void *)(v11 + 32) = v8;
  id v13 = v8;

  v14 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v9;
  id v15 = v9;

  v16 = *(void **)(v11 + 48);
  *(void *)(v11 + 48) = v10;

  *(_DWORD *)(v11 + 24) = a5;
  return (id)v11;
}

- (void)dealloc
{
  CGImage = self->_CGImage;
  if (CGImage) {
    CGImageRelease(CGImage);
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIImageContentRendition;
  [(_UIImageContentRendition *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effects, 0);
  objc_storeStrong((id *)&self->_multiplyColor, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_rbSymbolConfig, 0);
}

+ (id)renditionWithResult:(void *)a3 color:
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = self;
  v7 = +[_UIImageContentRendition renditionWithResult:color:effects:](v6, v5, v4, 0);

  return v7;
}

+ (id)renditionWithResult:(void *)a3 color:(void *)a4 effects:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = a2;
  uint64_t v9 = self;
  id v10 = +[_UIImageContentRendition renditionWithResult:color:effects:drawMode:](v9, v8, v7, v6, 0);

  return v10;
}

+ (id)renditionWithResult:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v3 = self;
  id v4 = +[_UIImageContentRendition renditionWithResult:color:](v3, v2, 0);

  return v4;
}

- (uint64_t)drawInContext:(uint64_t)result
{
  if (result)
  {
    uint64_t v1 = *(void *)(result + 32);
    if (v1)
    {
      result = *(void *)(v1 + 24);
      if (result) {
        return (*(uint64_t (**)(void))(result + 16))();
      }
    }
  }
  return result;
}

- (void)rbSymbolConfiguration
{
  if (a1)
  {
    id v2 = a1;
    uint64_t v3 = (void *)a1[2];
    if (!v3)
    {
      -[_UIImageContentRenditionResult rbSymbolConfigurationProvider]((void *)a1[4]);
      id v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      uint64_t v5 = v4[2]();
      id v6 = (void *)v2[2];
      v2[2] = v5;

      uint64_t v3 = (void *)v2[2];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

@end