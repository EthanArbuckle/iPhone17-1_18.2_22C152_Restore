@interface COSWristAttributeConfidenceSummary
- (COSWristAttributeConfidenceSummary)initWithAttribute:(unint64_t)a3 andConfidenceValue:(double)a4;
- (double)confidence;
- (id)attributeDescription:(unint64_t)a3;
- (id)description;
- (unint64_t)attribute;
@end

@implementation COSWristAttributeConfidenceSummary

- (COSWristAttributeConfidenceSummary)initWithAttribute:(unint64_t)a3 andConfidenceValue:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)COSWristAttributeConfidenceSummary;
  result = [(COSWristAttributeConfidenceSummary *)&v7 init];
  if (result)
  {
    result->_attribute = a3;
    result->_confidence = a4;
  }
  return result;
}

- (id)attributeDescription:(unint64_t)a3
{
  if (a3 > 8) {
    return &stru_100249230;
  }
  else {
    return *(&off_1002473E8 + a3);
  }
}

- (id)description
{
  v3 = [(COSWristAttributeConfidenceSummary *)self attributeDescription:self->_attribute];
  v4 = +[NSString stringWithFormat:@"%@ - %.2f%%", v3, self->_confidence * 100.0];

  return v4;
}

- (unint64_t)attribute
{
  return self->_attribute;
}

- (double)confidence
{
  return self->_confidence;
}

@end