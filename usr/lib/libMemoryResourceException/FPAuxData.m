@interface FPAuxData
- (BOOL)fp_isContainer;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldAggregate;
- (BOOL)supportsFormattedValue;
- (FPAuxData)initWithValue:(int64_t)a3 shouldAggregate:(BOOL)a4;
- (const)formattedValue;
- (id)description;
- (id)formatter;
- (id)fp_jsonRepresentation;
- (int64_t)value;
- (void)setFormatter:(id)a3;
@end

@implementation FPAuxData

- (FPAuxData)initWithValue:(int64_t)a3 shouldAggregate:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)FPAuxData;
  result = [(FPAuxData *)&v7 init];
  if (result)
  {
    result->_aggregate = a4;
    result->_value = a3;
  }
  return result;
}

- (id)description
{
  if ([(FPAuxData *)self supportsFormattedValue])
  {
    v3 = [NSString stringWithFormat:@"%s", [-FPAuxData formattedValue](self, "formattedValue")];
  }
  else
  {
    v4 = [NSNumber numberWithLongLong:-[FPAuxData value](self, "value")];
    v3 = [v4 stringValue];
  }

  return v3;
}

- (BOOL)fp_isContainer
{
  return 0;
}

- (id)fp_jsonRepresentation
{
  return (id)[NSNumber numberWithLongLong:self->_value];
}

- (BOOL)supportsFormattedValue
{
  v2 = [(FPAuxData *)self formatter];
  BOOL v3 = v2 != 0;

  return v3;
}

- (const)formattedValue
{
  BOOL v3 = [(FPAuxData *)self formatter];
  v4 = (const char *)v3[2](v3, [(FPAuxData *)self value]);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_value == v4[2];

  return v5;
}

- (int64_t)value
{
  return self->_value;
}

- (BOOL)shouldAggregate
{
  return self->_aggregate;
}

- (id)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end