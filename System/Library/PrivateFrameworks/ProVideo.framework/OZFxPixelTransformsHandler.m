@interface OZFxPixelTransformsHandler
- (BOOL)conformsToProtocol:(id)a3 version:(unsigned int)a4;
- (OZFxPixelTransformsHandler)init;
- (PCMatrix44Tmpl<double>)destinationInversePixelTransform;
- (PCMatrix44Tmpl<double>)destinationPixelTransform;
- (PCMatrix44Tmpl<double>)inversePixelTransform;
- (PCMatrix44Tmpl<double>)pixelTransform;
- (void)setAgent:(const void *)a3;
- (void)setPostTransform:(const void *)a3;
- (void)setPreTransform:(const void *)a3;
@end

@implementation OZFxPixelTransformsHandler

- (OZFxPixelTransformsHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)OZFxPixelTransformsHandler;
  return [(OZFxPixelTransformsHandler *)&v3 init];
}

- (void)setAgent:(const void *)a3
{
  *(void *)getPixelTransformsAPIData() = a3;
}

- (void)setPreTransform:(const void *)a3
{
  v4 = (char *)getPixelTransformsAPIData() + 8;
  if (v4 != a3)
  {
    for (uint64_t i = 0; i != 4; ++i)
    {
      for (uint64_t j = 0; j != 32; j += 8)
        *(void *)&v4[j] = *(void *)((char *)a3 + j);
      v4 += 32;
      a3 = (char *)a3 + 32;
    }
  }
}

- (void)setPostTransform:(const void *)a3
{
  v4 = (char *)getPixelTransformsAPIData() + 136;
  if (v4 != a3)
  {
    for (uint64_t i = 0; i != 4; ++i)
    {
      for (uint64_t j = 0; j != 32; j += 8)
        *(void *)&v4[j] = *(void *)((char *)a3 + j);
      v4 += 32;
      a3 = (char *)a3 + 32;
    }
  }
}

- (PCMatrix44Tmpl<double>)pixelTransform
{
  PixelTransformsAPIData = (OZFxPixelTransformsAPIData *)getPixelTransformsAPIData();

  return (PCMatrix44Tmpl<double> *)OZFxPixelTransformsAPIData::pixelTransform(PixelTransformsAPIData, (uint64_t)retstr);
}

- (PCMatrix44Tmpl<double>)inversePixelTransform
{
  PixelTransformsAPIData = (OZFxPixelTransformsAPIData *)getPixelTransformsAPIData();

  OZFxPixelTransformsAPIData::inversePixelTransform(PixelTransformsAPIData, (uint64_t)retstr);
  return result;
}

- (PCMatrix44Tmpl<double>)destinationPixelTransform
{
  PixelTransformsAPIData = (OZFxPixelTransformsAPIData *)getPixelTransformsAPIData();

  return (PCMatrix44Tmpl<double> *)OZFxPixelTransformsAPIData::destinationPixelTransform(PixelTransformsAPIData, (uint64_t)retstr);
}

- (PCMatrix44Tmpl<double>)destinationInversePixelTransform
{
  PixelTransformsAPIData = (OZFxPixelTransformsAPIData *)getPixelTransformsAPIData();

  OZFxPixelTransformsAPIData::destinationInversePixelTransform(PixelTransformsAPIData, (uint64_t)retstr);
  return result;
}

- (BOOL)conformsToProtocol:(id)a3 version:(unsigned int)a4
{
  return a4 < 2 && &unk_1F1219AD0 == a3;
}

@end