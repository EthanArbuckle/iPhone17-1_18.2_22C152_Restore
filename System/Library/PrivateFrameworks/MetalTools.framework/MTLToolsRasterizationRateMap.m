@interface MTLToolsRasterizationRateMap
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)parameterBufferSizeAndAlign;
- ($94F468A8D4C62B317260615823C2B210)mapPhysicalToScreenCoordinates:(id)a3 forLayer:(unint64_t)a4;
- ($94F468A8D4C62B317260615823C2B210)mapScreenToPhysicalCoordinates:(id)a3 forLayer:(unint64_t)a4;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)physicalGranularity;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)physicalSizeForLayer:(SEL)a3;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)screenSize;
- (MTLDevice)device;
- (NSString)label;
- (float)minFactor;
- (id)formattedDescription:(unint64_t)a3;
- (unint64_t)layerCount;
- (unint64_t)mutability;
- (void)copyParameterDataToBuffer:(id)a3 offset:(unint64_t)a4;
- (void)resetUsingDescriptor:(id)a3;
@end

@implementation MTLToolsRasterizationRateMap

- (MTLDevice)device
{
  return (MTLDevice *)self->super._parent;
}

- (NSString)label
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSString *)[v2 label];
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)screenSize
{
  result = [(MTLToolsObject *)self baseObject];
  if (result)
  {
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)[($F99D9A4FB75BC57F3386B8DC8EE08D7A *)result screenSize];
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
  }
  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)physicalGranularity
{
  result = [(MTLToolsObject *)self baseObject];
  if (result)
  {
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)[($F99D9A4FB75BC57F3386B8DC8EE08D7A *)result physicalGranularity];
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
  }
  return result;
}

- (unint64_t)layerCount
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 layerCount];
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)parameterBufferSizeAndAlign
{
  id v2 = [(MTLToolsObject *)self baseObject];

  unint64_t v3 = [v2 parameterBufferSizeAndAlign];
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)physicalSizeForLayer:(SEL)a3
{
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result = [(MTLToolsObject *)self baseObject];
  if (result)
  {
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)[($F99D9A4FB75BC57F3386B8DC8EE08D7A *)result physicalSizeForLayer:a4];
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
  }
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)mapScreenToPhysicalCoordinates:(id)a3 forLayer:(unint64_t)a4
{
  float var1 = a3.var1;
  float var0 = a3.var0;
  id v7 = [(MTLToolsObject *)self baseObject];
  *(float *)&double v8 = var0;
  *(float *)&double v9 = var1;

  objc_msgSend(v7, "mapScreenToPhysicalCoordinates:forLayer:", a4, v8, v9);
  result.float var1 = v11;
  result.float var0 = v10;
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)mapPhysicalToScreenCoordinates:(id)a3 forLayer:(unint64_t)a4
{
  float var1 = a3.var1;
  float var0 = a3.var0;
  id v7 = [(MTLToolsObject *)self baseObject];
  *(float *)&double v8 = var0;
  *(float *)&double v9 = var1;

  objc_msgSend(v7, "mapPhysicalToScreenCoordinates:forLayer:", a4, v8, v9);
  result.float var1 = v11;
  result.float var0 = v10;
  return result;
}

- (float)minFactor
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 minFactor];
  return result;
}

- (unint64_t)mutability
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 mutability];
}

- (void)copyParameterDataToBuffer:(id)a3 offset:(unint64_t)a4
{
  uint64_t v6 = [a3 baseObject];
  id v7 = [(MTLToolsObject *)self baseObject];

  [v7 copyParameterDataToBuffer:v6 offset:a4];
}

- (void)resetUsingDescriptor:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 resetUsingDescriptor:a3];
}

- (id)formattedDescription:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return (id)[v4 formattedDescription:a3];
}

@end