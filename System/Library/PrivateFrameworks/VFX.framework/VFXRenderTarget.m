@interface VFXRenderTarget
- (BOOL)matchesDescription:(id *)a3 size:(unint64_t)a4 arrayLength:;
- (BOOL)viewportDependant;
- (NSString)name;
- (VFXRenderTarget)initWithDescription:(id *)a3 size:(unint64_t)a4 arrayLength:;
- (id)ciImage;
- (id)description;
- (id)texture;
- (id)textureForSliceIndex:(unint64_t)a3;
- (int64_t)referenceCount;
- (int64_t)timeStamp;
- (unsigned)renderBufferFormat;
- (void)dealloc;
- (void)setName:(id)a3;
- (void)setReferenceCount:(int64_t)a3;
- (void)setTexture:(id)a3;
- (void)setTimeStamp:(int64_t)a3;
@end

@implementation VFXRenderTarget

- (VFXRenderTarget)initWithDescription:(id *)a3 size:(unint64_t)a4 arrayLength:
{
  uint64_t v6 = v4;
  v9.receiver = self;
  v9.super_class = (Class)VFXRenderTarget;
  result = [(VFXRenderTarget *)&v9 init];
  if (result)
  {
    result->_description = ($70D0A97A2D0AFAF0EE8A7EF308C233C5)*a3;
    *(void *)result->_size = v6;
    result->_arrayLength = a4;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXRenderTarget;
  [(VFXRenderTarget *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = sub_1B644F2B4(self->_description.format);
  id result = (id)objc_msgSend_stringWithFormat_(v3, v5, @"Format: %@ ; Size: %gx%g[%d] ; Texture: <%p> ; [rc:%ld/ts:%ld]\n",
                 v6,
                 v4,
                 COERCE_FLOAT(*(void *)self->_size),
                 COERCE_FLOAT(HIDWORD(*(void *)self->_size)),
                 LOBYTE(self->_arrayLength),
                 self->_texture,
                 self->_referenceCount,
                 self->_timeStamp);
  if (self->_name) {
    return (id)objc_msgSend_stringWithFormat_(NSString, v8, @"Name: %@ ; %@",
  }
                 v9,
                 self->_name,
                 result);
  return result;
}

- (BOOL)viewportDependant
{
  return (*((unsigned __int8 *)&self->_description + 3) >> 2) & 1;
}

- (unsigned)renderBufferFormat
{
  return self->_description.format;
}

- (BOOL)matchesDescription:(id *)a3 size:(unint64_t)a4 arrayLength:
{
  uint32x2_t v5 = (uint32x2_t)vcge_f32((float32x2_t)0x3400000034000000, vabd_f32(*(float32x2_t *)self->_size, v4));
  BOOL result = (vpmin_u32(v5, v5).u32[0] & 0x80000000) != 0
        && self->_description.format == a3->var0
        && self->_description.sampleCount == a3->var1
        && ((*((unsigned char *)a3 + 3) ^ *((unsigned char *)&self->_description + 3)) & 5) == 0
        && (((*((unsigned char *)a3 + 3) ^ *((unsigned char *)&self->_description + 3)) & 0x30) == 0
          ? (BOOL v6 = self->_description.textureUsage == a3->var2)
          : (BOOL v6 = 0),
            v6)
        && self->_arrayLength == a4;
  return result;
}

- (void)setName:(id)a3
{
  self->_name = (NSString *)objc_msgSend_copy(a3, v5, v6, v7);
}

- (void)setTexture:(id)a3
{
  id texture = self->_texture;
  if (texture != a3)
  {

    id v6 = a3;
    self->_id texture = v6;
    if (self->_name) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7 && (objc_opt_respondsToSelector() & 1) != 0) {
      objc_msgSend_setLabel_(self->_texture, v8, (uint64_t)self->_name, v9);
    }

    self->_ciImage = 0;
  }
}

- (id)textureForSliceIndex:(unint64_t)a3
{
  sliceTextures = self->_sliceTextures;
  if (!sliceTextures)
  {
    id texture = self->_texture;
    if (objc_msgSend_textureType(texture, a2, a3, v3) != 3 && objc_msgSend_textureType(texture, v8, v9, v10) != 5) {
      return self->_texture;
    }
    id v11 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v15 = objc_msgSend_arrayLength(texture, v12, v13, v14);
    sliceTextures = (NSArray *)objc_msgSend_initWithCapacity_(v11, v16, v15, v17);
    if (objc_msgSend_arrayLength(texture, v18, v19, v20))
    {
      unint64_t v22 = 0;
      do
      {
        uint64_t v23 = objc_msgSend_pixelFormat(texture, a2, v21, v3);
        v25 = objc_msgSend_newTextureViewWithPixelFormat_textureType_levels_slices_(texture, v24, v23, 2, 0, 1, v22, 1);
        objc_msgSend_setObject_atIndexedSubscript_(sliceTextures, v26, (uint64_t)v25, v22);

        ++v22;
      }
      while (v22 < objc_msgSend_arrayLength(texture, v27, v28, v29));
    }
    self->_sliceTextures = sliceTextures;
  }

  return (id)objc_msgSend_objectAtIndexedSubscript_(sliceTextures, a2, a3, v3);
}

- (id)ciImage
{
  id result = self->_ciImage;
  if (!result)
  {
    if (self->_texture)
    {
      id v4 = objc_alloc(MEMORY[0x1E4F1E050]);
      id result = (id)objc_msgSend_initWithMTLTexture_options_(v4, v5, (uint64_t)self->_texture, 0);
      self->_ciImage = (CIImage *)result;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)texture
{
  return self->_texture;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)referenceCount
{
  return self->_referenceCount;
}

- (void)setReferenceCount:(int64_t)a3
{
  self->_referenceCount = a3;
}

- (int64_t)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(int64_t)a3
{
  self->_timeStamp = a3;
}

@end