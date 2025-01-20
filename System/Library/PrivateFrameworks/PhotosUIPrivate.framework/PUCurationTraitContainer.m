@interface PUCurationTraitContainer
- (NSString)actionLabel;
- (PUCurationTraitContainer)initWithLabel:(id)a3 traitValue:(signed __int16)a4 highPrecision:(double)a5 operatingPoint:(double)a6 highRecall:(double)a7;
- (double)highPrecisionOperatingPoint;
- (double)highRecallOperatingPoint;
- (double)operatingPoint;
- (signed)value;
@end

@implementation PUCurationTraitContainer

- (void).cxx_destruct
{
}

- (double)highRecallOperatingPoint
{
  return self->_highRecallOperatingPoint;
}

- (double)operatingPoint
{
  return self->_operatingPoint;
}

- (double)highPrecisionOperatingPoint
{
  return self->_highPrecisionOperatingPoint;
}

- (signed)value
{
  return self->_value;
}

- (NSString)actionLabel
{
  return self->_actionLabel;
}

- (PUCurationTraitContainer)initWithLabel:(id)a3 traitValue:(signed __int16)a4 highPrecision:(double)a5 operatingPoint:(double)a6 highRecall:(double)a7
{
  id v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PUCurationTraitContainer;
  v14 = [(PUCurationTraitContainer *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_actionLabel, a3);
    v15->_value = a4;
    v15->_highPrecisionOperatingPoint = a5;
    v15->_operatingPoint = a6;
    v15->_highRecallOperatingPoint = a7;
  }

  return v15;
}

@end