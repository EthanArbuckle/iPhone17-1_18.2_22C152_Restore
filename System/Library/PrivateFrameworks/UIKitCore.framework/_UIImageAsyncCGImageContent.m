@interface _UIImageAsyncCGImageContent
- (BOOL)finishedDecompressing;
- (BOOL)isDecompressing;
- (BOOL)isEqual:(id)a3;
- (CGImage)CGImage;
- (_UIImageAsyncCGImageContent)initWithData:(id)a3 immediateLoadWithMaxSize:(CGSize)a4 scale:(double)a5 renderingIntent:(unint64_t)a6 cache:(BOOL)a7;
- (id)description;
- (id)typeName;
- (int64_t)orientation;
- (unint64_t)hash;
- (void)setFinishedDecompressing:(BOOL)a3;
@end

@implementation _UIImageAsyncCGImageContent

- (_UIImageAsyncCGImageContent)initWithData:(id)a3 immediateLoadWithMaxSize:(CGSize)a4 scale:(double)a5 renderingIntent:(unint64_t)a6 cache:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a4.height;
  double width = a4.width;
  id v14 = a3;
  if (!v14)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"_UIImageContent.m" lineNumber:1096 description:@"Need data"];
  }
  v20.receiver = self;
  v20.super_class = (Class)_UIImageAsyncCGImageContent;
  v15 = [(_UIImageContent *)&v20 initWithScale:a5];
  if (v15)
  {
    v16 = [(id *)[_UIOldCGImageDecompressor alloc] initWithData:(void *)a6 immediateLoadWithMaxSize:v7 renderingIntent:width cache:height];
    decompressor = v15->_decompressor;
    v15->_decompressor = (_UIOldCGImageDecompressor *)v16;
  }
  return v15;
}

- (id)typeName
{
  return @"async CGImage";
}

- (id)description
{
  if (self && (id v3 = objc_getProperty(self, a2, 64, 1)) != 0)
  {
    v4 = v3;
    v5 = NSString;
    uint64_t v6 = objc_opt_class();
    BOOL v7 = [v5 stringWithFormat:@"<%@:%p (decompressing) <%@:%p>>", v6, self, objc_opt_class(), v4];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIImageAsyncCGImageContent;
    BOOL v7 = [(_UIImageCGImageContent *)&v9 description];
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (!self ? (id Property = 0) : (id Property = objc_getProperty(self, v6, 64, 1)),
          (unint64_t v9 = (unint64_t)Property, !v5) ? (v10 = 0) : (v10 = objc_getProperty(v5, v8, 64, 1)),
          unint64_t v11 = (unint64_t)v10,
          v9 | v11))
    {
      v13 = (void *)v11;
      id v14 = (id)v9;
      id v15 = v13;
      v16 = v15;
      if (v14 == v15)
      {
        unsigned __int8 v12 = 1;
      }
      else
      {
        unsigned __int8 v12 = 0;
        if (v14 && v15) {
          unsigned __int8 v12 = [v14 isEqual:v15];
        }
      }
    }
    else
    {
      v18.receiver = self;
      v18.super_class = (Class)_UIImageAsyncCGImageContent;
      unsigned __int8 v12 = [(_UIImageCGImageContent *)&v18 isEqual:v5];
    }
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  if (self && (id v3 = objc_getProperty(self, a2, 64, 1)) != 0)
  {
    id v4 = v3;
    unint64_t v5 = [v3 hash];

    return v5;
  }
  else
  {
    explicit = (const void *)atomic_load_explicit((atomic_ullong *volatile)&self->super._imageRef, memory_order_acquire);
    if (!explicit) {
      explicit = (const void *)*MEMORY[0x1E4F1D260];
    }
    return CFHash(explicit);
  }
}

- (BOOL)isDecompressing
{
  if (self) {
    self = (_UIImageAsyncCGImageContent *)objc_getProperty(self, a2, 64, 1);
  }
  return self != 0;
}

- (CGImage)CGImage
{
  if (!self) {
    return (CGImage *)atomic_load_explicit((atomic_ullong *volatile)&self->super._imageRef, memory_order_acquire);
  }
  id v3 = (unsigned __int8 *)objc_getProperty(self, a2, 64, 1);
  if (!v3) {
    return (CGImage *)atomic_load_explicit((atomic_ullong *volatile)&self->super._imageRef, memory_order_acquire);
  }
  id v4 = v3;
  unint64_t v5 = CGImageRetain((CGImageRef)[v3 waitForImageRef]);
  CGImageRelease((CGImageRef)atomic_exchange((atomic_ullong *volatile)&self->super._imageRef, (unint64_t)v5));
  -[_UIOldCGImageDecompressor _waitForMetadata]((uint64_t)v4);
  self->_orientation = ((unint64_t)v4[64] >> 1) & 7;
  objc_setProperty_atomic(self, v6, 0, 64);

  return v5;
}

- (int64_t)orientation
{
  if (!self) {
    return self->_orientation;
  }
  id v3 = (unsigned __int8 *)objc_getProperty(self, a2, 64, 1);
  if (!v3) {
    return self->_orientation;
  }
  id v4 = v3;
  -[_UIOldCGImageDecompressor _waitForMetadata]((uint64_t)v3);
  unint64_t v5 = ((unint64_t)v4[64] >> 1) & 7;

  return v5;
}

- (BOOL)finishedDecompressing
{
  return self->_finishedDecompressing;
}

- (void)setFinishedDecompressing:(BOOL)a3
{
  self->_finishedDecompressing = a3;
}

- (void).cxx_destruct
{
}

@end