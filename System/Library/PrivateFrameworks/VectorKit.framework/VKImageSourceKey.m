@interface VKImageSourceKey
- ($C28CD4A45FD07A4F97CC9D5F91F25271)transitLineColor;
- (BOOL)hasDataValue;
- (CGPoint)imageCenter;
- (NSArray)fallbackImageKeys;
- (NSString)imageName;
- (NSString)relatedText;
- (NSString)shieldText;
- (NSString)shieldTextLocale;
- (NSString)text;
- (VKImageSourceKey)initWithDataType:(unsigned __int8)a3;
- (VKImageSourceKey)initWithIconAttributeKey:(unsigned int)a3 attributeValue:(unsigned int)a4;
- (VKImageSourceKey)initWithIconName:(const char *)a3;
- (VKImageSourceKey)initWithLabelImageKey:(const void *)a3;
- (VKImageSourceKey)initWithShieldName:(const char *)a3 text:(const char *)a4 locale:(const char *)a5 color:(Color<unsigned)char;
- (VKImageSourceKey)initWithShieldText:(const char *)a3 locale:(const char *)a4 type:(unsigned int)a5 color:(Color<unsigned)char;
- (float)contentScale;
- (id).cxx_construct;
- (id)_initWithKeyType:(unsigned int)a3;
- (int64_t)sizeGroup;
- (unsigned)countryCode;
- (unsigned)dataType;
- (unsigned)dataValue;
- (unsigned)iconAttributeKey;
- (unsigned)iconAttributeValue;
- (unsigned)keyType;
- (unsigned)secondaryVariant;
- (unsigned)shieldType;
- (unsigned)variant;
- (void)setDataType:(unsigned __int8)a3;
- (void)setDataValue:(unsigned int)a3;
- (void)setFallbackImageKeys:(id)a3;
- (void)setImageCenter:(CGPoint)a3;
- (void)setRelatedText:(id)a3;
- (void)setSizeGroup:(int64_t)a3;
- (void)setText:(id)a3;
@end

@implementation VKImageSourceKey

- (id).cxx_construct
{
  *((_DWORD *)self + 29) = 0;
  *((_DWORD *)self + 30) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackImageKeys, 0);
  objc_storeStrong((id *)&self->_relatedText, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_shieldTextLocale, 0);
  objc_storeStrong((id *)&self->_shieldText, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
}

- (unsigned)countryCode
{
  return self->_countryCode;
}

- (float)contentScale
{
  return self->_contentScale;
}

- (void)setSizeGroup:(int64_t)a3
{
  self->_sizeGroup = a3;
}

- (int64_t)sizeGroup
{
  return self->_sizeGroup;
}

- (void)setFallbackImageKeys:(id)a3
{
}

- (NSArray)fallbackImageKeys
{
  return self->_fallbackImageKeys;
}

- (void)setImageCenter:(CGPoint)a3
{
  self->_imageCenter = a3;
}

- (CGPoint)imageCenter
{
  double x = self->_imageCenter.x;
  double y = self->_imageCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (unsigned)dataValue
{
  return self->_dataValue;
}

- (BOOL)hasDataValue
{
  return self->_hasDataValue;
}

- (void)setRelatedText:(id)a3
{
}

- (NSString)relatedText
{
  return self->_relatedText;
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setDataType:(unsigned __int8)a3
{
  self->_dataType = a3;
}

- (unsigned)dataType
{
  return self->_dataType;
}

- (unsigned)iconAttributeValue
{
  return self->_iconAttributeValue;
}

- (unsigned)iconAttributeKey
{
  return self->_iconAttributeKey;
}

- (unsigned)shieldType
{
  return self->_shieldType;
}

- (NSString)shieldTextLocale
{
  return self->_shieldTextLocale;
}

- (NSString)shieldText
{
  return self->_shieldText;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (unsigned)keyType
{
  return self->_keyType;
}

- (unsigned)secondaryVariant
{
  return self->_iconVariant.secondary;
}

- (unsigned)variant
{
  return self->_iconVariant.primary;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)transitLineColor
{
  LOBYTE(v2) = self->_shieldColor._backing._e[0];
  float v3 = (float)v2;
  LOBYTE(v2) = self->_shieldColor._backing._e[1];
  float v4 = (float)v2;
  LOBYTE(v2) = self->_shieldColor._backing._e[2];
  float v5 = (float)v2;
  unsigned int v6 = self->_shieldColor._backing._e[3];
  if ((float)(v3 * 0.0039216) >= 0.0031308) {
    float v7 = (float)(powf(v3 * 0.0039216, 0.41667) * 1.055) + -0.055;
  }
  else {
    float v7 = v3 * 0.050667;
  }
  float v8 = v5 * 0.0039216;
  if ((float)(v4 * 0.0039216) >= 0.0031308) {
    float v9 = (float)(powf(v4 * 0.0039216, 0.41667) * 1.055) + -0.055;
  }
  else {
    float v9 = v4 * 0.050667;
  }
  if (v8 >= 0.0031308) {
    float v10 = (float)(powf(v8, 0.41667) * 1.055) + -0.055;
  }
  else {
    float v10 = v5 * 0.050667;
  }
  float v11 = (float)v6 * 0.0039216;
  float v12 = v7;
  float v13 = v9;
  result.var3 = v11;
  result.var2 = v10;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

- (void)setDataValue:(unsigned int)a3
{
  self->_dataValue = a3;
  self->_hasDataValue = 1;
}

- (VKImageSourceKey)initWithLabelImageKey:(const void *)a3
{
  float v4 = self;
  float v5 = 0;
  self->_sizeGroup = +[VKInternalIconManager convertGrlSizeGroup:*(unsigned __int8 *)(*(void *)a3 + 168)];
  uint64_t v6 = *(void *)a3;
  v4->_contentScale = *(float *)(*(void *)a3 + 56);
  v4->_iconVariant = *(IconVariant *)(v6 + 172);
  uint64_t v7 = *(void *)a3;
  v4->_countryCode = *(_DWORD *)(*(void *)a3 + 192);
  switch(*(unsigned char *)(v7 + 113))
  {
    case 1:
      float v8 = (void *)(v7 + 120);
      if (*(char *)(v7 + 143) < 0) {
        float v8 = (void *)*v8;
      }
      uint64_t v9 = *(unsigned int *)(v7 + 152);
      int v16 = *(_DWORD *)(v7 + 160);
      float v10 = [(VKImageSourceKey *)v4 initWithShieldText:v8 locale:0 type:v9 color:&v16];
      goto LABEL_14;
    case 2:
      float v11 = (void *)(v7 + 16);
      if (*(char *)(v7 + 39) < 0) {
        float v11 = (void *)*v11;
      }
      float v12 = (void *)(v7 + 120);
      if (*(char *)(v7 + 143) < 0) {
        float v12 = (void *)*v12;
      }
      int v15 = *(_DWORD *)(v7 + 160);
      float v10 = [(VKImageSourceKey *)v4 initWithShieldName:v11 text:v12 locale:0 color:&v15];
      goto LABEL_14;
    case 8:
      float v10 = [(VKImageSourceKey *)v4 initWithIconAttributeKey:*(unsigned int *)(v7 + 60) attributeValue:*(unsigned __int16 *)(v7 + 64)];
      goto LABEL_14;
    case 9:
      float v13 = (void *)(v7 + 16);
      if (*(char *)(v7 + 39) < 0) {
        float v13 = (void *)*v13;
      }
      float v10 = [(VKImageSourceKey *)v4 initWithIconName:v13];
LABEL_14:
      float v4 = v10;
      float v5 = v4;
      break;
    default:
      break;
  }

  return v5;
}

- (VKImageSourceKey)initWithIconName:(const char *)a3
{
  float v4 = [(VKImageSourceKey *)self _initWithKeyType:5];
  if (v4)
  {
    if (a3 && *a3)
    {
      uint64_t v5 = [[NSString alloc] initWithUTF8String:a3];
      imageName = v4->_imageName;
      v4->_imageName = (NSString *)v5;
    }
    uint64_t v7 = v4;
  }

  return v4;
}

- (VKImageSourceKey)initWithIconAttributeKey:(unsigned int)a3 attributeValue:(unsigned int)a4
{
  uint64_t v6 = [(VKImageSourceKey *)self _initWithKeyType:2];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_iconAttributeKedouble y = a3;
    v6->_iconAttributeValue = a4;
    float v8 = v6;
  }

  return v7;
}

- (VKImageSourceKey)initWithShieldName:(const char *)a3 text:(const char *)a4 locale:(const char *)a5 color:(Color<unsigned)char
{
  uint64_t v6 = *(unsigned __int8 **)a6._backing._e;
  float v10 = [(VKImageSourceKey *)self _initWithKeyType:4];
  if (v10)
  {
    if (a3 && *a3)
    {
      uint64_t v11 = [[NSString alloc] initWithUTF8String:a3];
      imageName = v10->_imageName;
      v10->_imageName = (NSString *)v11;
    }
    if (a4 && *a4)
    {
      uint64_t v13 = [[NSString alloc] initWithUTF8String:a4];
      shieldText = v10->_shieldText;
      v10->_shieldText = (NSString *)v13;
    }
    if (a5 && *a5)
    {
      uint64_t v15 = [[NSString alloc] initWithUTF8String:a5];
      shieldTextLocale = v10->_shieldTextLocale;
      v10->_shieldTextLocale = (NSString *)v15;
    }
    v10->_shieldColor._backing._e[0] = *v6;
    v10->_shieldColor._backing._e[1] = v6[1];
    v10->_shieldColor._backing._e[2] = v6[2];
    v10->_shieldColor._backing._e[3] = v6[3];
    v17 = v10;
  }

  return v10;
}

- (VKImageSourceKey)initWithShieldText:(const char *)a3 locale:(const char *)a4 type:(unsigned int)a5 color:(Color<unsigned)char
{
  uint64_t v6 = *(unsigned __int8 **)a6._backing._e;
  float v10 = [(VKImageSourceKey *)self _initWithKeyType:1];
  if (v10)
  {
    if (a3 && *a3)
    {
      uint64_t v11 = [[NSString alloc] initWithUTF8String:a3];
      shieldText = v10->_shieldText;
      v10->_shieldText = (NSString *)v11;
    }
    if (a4 && *a4)
    {
      uint64_t v13 = [[NSString alloc] initWithUTF8String:a4];
      shieldTextLocale = v10->_shieldTextLocale;
      v10->_shieldTextLocale = (NSString *)v13;
    }
    v10->_shieldType = a5;
    v10->_shieldColor._backing._e[0] = *v6;
    v10->_shieldColor._backing._e[1] = v6[1];
    v10->_shieldColor._backing._e[2] = v6[2];
    v10->_shieldColor._backing._e[3] = v6[3];
    uint64_t v15 = v10;
  }

  return v10;
}

- (VKImageSourceKey)initWithDataType:(unsigned __int8)a3
{
  $C28CD4A45FD07A4F97CC9D5F91F25271 result = [(VKImageSourceKey *)self _initWithKeyType:3];
  if (result) {
    result->_dataType = a3;
  }
  return result;
}

- (id)_initWithKeyType:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VKImageSourceKey;
  id result = [(VKImageSourceKey *)&v5 init];
  if (result) {
    *((_DWORD *)result + 2) = a3;
  }
  return result;
}

@end