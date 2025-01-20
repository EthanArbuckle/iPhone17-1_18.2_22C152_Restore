@interface VMUAnalyzerSummaryField
- (NSObject)objectValue;
- (NSString)formattedValue;
- (NSString)key;
- (VMUAnalyzerSummaryField)initWithKey:(id)a3 numericalValue:(unint64_t)a4 objectValue:(id)a5 fieldType:(int)a6;
- (int)fieldType;
- (unint64_t)numericalValue;
- (void)setFieldType:(int)a3;
- (void)setFormattedValue:(id)a3;
- (void)setKey:(id)a3;
- (void)setNumericalValue:(unint64_t)a3;
- (void)setObjectValue:(id)a3;
@end

@implementation VMUAnalyzerSummaryField

- (VMUAnalyzerSummaryField)initWithKey:(id)a3 numericalValue:(unint64_t)a4 objectValue:(id)a5 fieldType:(int)a6
{
  id v11 = a3;
  id v12 = a5;
  v13 = [(VMUAnalyzerSummaryField *)self init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_key, a3);
    v14->_numericalValue = a4;
    objc_storeStrong((id *)&v14->_objectValue, a5);
    v14->_fieldType = a6;
  }

  return v14;
}

- (NSString)formattedValue
{
  if (self->_fieldType == 2)
  {
    v2 = [NSString stringWithUTF8String:VMUMemorySizeString(self->_numericalValue)];
  }
  else
  {
    if (self->_objectValue) {
      [self->_objectValue description];
    }
    else {
    v2 = [NSString stringWithFormat:@"%llu", self->_numericalValue];
    }
  }

  return (NSString *)v2;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (unint64_t)numericalValue
{
  return self->_numericalValue;
}

- (void)setNumericalValue:(unint64_t)a3
{
  self->_numericalValue = a3;
}

- (NSObject)objectValue
{
  return self->_objectValue;
}

- (void)setObjectValue:(id)a3
{
}

- (int)fieldType
{
  return self->_fieldType;
}

- (void)setFieldType:(int)a3
{
  self->_fieldType = a3;
}

- (void)setFormattedValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedValue, 0);
  objc_storeStrong((id *)&self->_objectValue, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end