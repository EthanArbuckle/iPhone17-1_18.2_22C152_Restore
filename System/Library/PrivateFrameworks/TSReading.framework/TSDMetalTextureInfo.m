@interface TSDMetalTextureInfo
+ (id)textureInfoWithCGImage:(CGImage *)a3 forDevice:(id)a4;
+ (id)textureInfoWithName:(id)a3 width:(unsigned int)a4 height:(unsigned int)a5 containsMipmaps:(BOOL)a6;
- (BOOL)containsMipmaps;
- (CGSize)size;
- (MTLTexture)name;
- (TSDMetalTextureInfo)initWithName:(id)a3 width:(unsigned int)a4 height:(unsigned int)a5 containsMipmaps:(BOOL)a6;
- (id)description;
- (unsigned)height;
- (unsigned)width;
- (void)teardown;
@end

@implementation TSDMetalTextureInfo

+ (id)textureInfoWithName:(id)a3 width:(unsigned int)a4 height:(unsigned int)a5 containsMipmaps:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:v9 width:v8 height:v7 containsMipmaps:v6];

  return v10;
}

+ (id)textureInfoWithCGImage:(CGImage *)a3 forDevice:(id)a4
{
  v5 = (objc_class *)MEMORY[0x263F12D88];
  id v6 = a4;
  uint64_t v7 = (void *)[[v5 alloc] initWithDevice:v6];

  uint64_t v11 = 0;
  uint64_t v8 = (void *)[v7 newTextureWithCGImage:a3 options:0 error:&v11];
  id v9 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:width:height:containsMipmaps:", v8, objc_msgSend(v8, "width"), objc_msgSend(v8, "height"), 0);

  return v9;
}

- (TSDMetalTextureInfo)initWithName:(id)a3 width:(unsigned int)a4 height:(unsigned int)a5 containsMipmaps:(BOOL)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TSDMetalTextureInfo;
  v12 = [(TSDMetalTextureInfo *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_containsMipmaps = a6;
    objc_storeStrong((id *)&v12->_name, a3);
    v13->_height = a5;
    v13->_width = a4;
  }

  return v13;
}

- (CGSize)size
{
  LODWORD(v3) = self->_height;
  LODWORD(v2) = self->_width;
  double v4 = (double)v2;
  double v5 = (double)v3;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)teardown
{
  name = self->_name;
  self->_name = 0;

  self->_height = 0;
  self->_width = 0;
}

- (id)description
{
  unint64_t v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)TSDMetalTextureInfo;
  uint64_t v4 = [(TSDMetalTextureInfo *)&v9 description];
  double v5 = (void *)v4;
  if (self->_containsMipmaps) {
    id v6 = @", mipmapped";
  }
  else {
    id v6 = &stru_26D688A48;
  }
  uint64_t v7 = [v3 stringWithFormat:@"%@: {name:%d, size:(%d,%d)%@}", v4, self->_name, self->_width, self->_height, v6];

  return v7;
}

- (BOOL)containsMipmaps
{
  return self->_containsMipmaps;
}

- (MTLTexture)name
{
  return self->_name;
}

- (unsigned)height
{
  return self->_height;
}

- (unsigned)width
{
  return self->_width;
}

- (void).cxx_destruct
{
}

@end