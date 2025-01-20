@interface CHDErrorBar
+ (CHDErrorBar)errorBarWithChart:(id)a3;
- (BOOL)isNoEndCap;
- (CHDErrorBar)initWithChart:(id)a3;
- (double)value;
- (id)description;
- (id)graphicProperties;
- (id)minusValues;
- (id)plusValues;
- (int)direction;
- (int)type;
- (int)valueType;
- (void)setDirection:(int)a3;
- (void)setGraphicProperties:(id)a3;
- (void)setMinusValues:(id)a3;
- (void)setNoEndCap:(BOOL)a3;
- (void)setPlusValues:(id)a3;
- (void)setType:(int)a3;
- (void)setValue:(double)a3;
- (void)setValueType:(int)a3;
@end

@implementation CHDErrorBar

+ (CHDErrorBar)errorBarWithChart:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithChart:v3];

  return (CHDErrorBar *)v4;
}

- (CHDErrorBar)initWithChart:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHDErrorBar;
  v6 = [(CHDErrorBar *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mChart, a3);
    v7->mValue = 0.0;
    *(void *)&v7->mType = 0x200000000;
    v7->mDirection = 1;
    v7->mNoEndCap = 0;
  }

  return v7;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (void)setDirection:(int)a3
{
  self->mDirection = a3;
}

- (void)setValueType:(int)a3
{
  self->mValueType = a3;
}

- (void)setNoEndCap:(BOOL)a3
{
  self->mNoEndCap = a3;
}

- (int)valueType
{
  return self->mValueType;
}

- (int)type
{
  return self->mType;
}

- (void)setPlusValues:(id)a3
{
  id v5 = (CHDData *)a3;
  if (self->mPlusValues != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->mPlusValues, a3);
    v6 = [(CHDChart *)self->mChart processors];
    [v6 markObject:v7 processor:objc_opt_class()];

    id v5 = v7;
  }
}

- (void)setGraphicProperties:(id)a3
{
  id v5 = (OADGraphicProperties *)a3;
  mGraphicProperties = self->mGraphicProperties;
  p_mGraphicProperties = &self->mGraphicProperties;
  if (mGraphicProperties != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mGraphicProperties, a3);
    id v5 = v8;
  }
}

- (int)direction
{
  return self->mDirection;
}

- (id)minusValues
{
  return self->mMinusValues;
}

- (id)plusValues
{
  return self->mPlusValues;
}

- (void)setMinusValues:(id)a3
{
  id v5 = (CHDData *)a3;
  if (self->mMinusValues != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->mMinusValues, a3);
    v6 = [(CHDChart *)self->mChart processors];
    [v6 markObject:v7 processor:objc_opt_class()];

    id v5 = v7;
  }
}

- (double)value
{
  return self->mValue;
}

- (void)setValue:(double)a3
{
  self->mValue = a3;
}

- (BOOL)isNoEndCap
{
  return self->mNoEndCap;
}

- (id)graphicProperties
{
  return self->mGraphicProperties;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)CHDErrorBar;
  v2 = [(CHDErrorBar *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mGraphicProperties, 0);
  objc_storeStrong((id *)&self->mPlusValues, 0);
  objc_storeStrong((id *)&self->mMinusValues, 0);
  objc_storeStrong((id *)&self->mChart, 0);
}

@end