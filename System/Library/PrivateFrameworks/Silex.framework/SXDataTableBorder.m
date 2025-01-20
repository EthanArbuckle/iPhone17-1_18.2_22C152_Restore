@interface SXDataTableBorder
+ (id)jsonPropertyNameForObjCPropertyName:(id)a3;
- (SXUnitConverter)unitConverter;
- (double)width;
- (void)setUnitConverter:(id)a3;
@end

@implementation SXDataTableBorder

+ (id)jsonPropertyNameForObjCPropertyName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"actualWidth"])
  {
    v5 = @"width";
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXDataTableBorder;
    objc_msgSendSuper2(&v7, sel_jsonPropertyNameForObjCPropertyName_, v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (double)width
{
  v3 = [(SXDataTableBorder *)self unitConverter];

  if (v3)
  {
    id v4 = [(SXDataTableBorder *)self unitConverter];
    uint64_t v5 = [(SXDataTableBorder *)self actualWidth];
    objc_msgSend(v4, "convertValueToPoints:", v5, v6);
    self->_width = v7;
  }
  return self->_width;
}

- (SXUnitConverter)unitConverter
{
  return self->unitConverter;
}

- (void)setUnitConverter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end