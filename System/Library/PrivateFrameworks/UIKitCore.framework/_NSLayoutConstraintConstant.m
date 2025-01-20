@interface _NSLayoutConstraintConstant
+ (_NSLayoutConstraintConstant)constantWithSymbolicValue:(id)a3 numericValue:(double)a4;
- (NSString)symbolicValue;
- (_NSLayoutConstraintConstant)initWithCoder:(id)a3;
- (_NSLayoutConstraintConstant)initWithSymbolicValue:(id)a3 numericValue:(double)a4;
- (double)numericValue;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _NSLayoutConstraintConstant

+ (_NSLayoutConstraintConstant)constantWithSymbolicValue:(id)a3 numericValue:(double)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithSymbolicValue:a3 numericValue:a4];
  return (_NSLayoutConstraintConstant *)v4;
}

- (_NSLayoutConstraintConstant)initWithSymbolicValue:(id)a3 numericValue:(double)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_NSLayoutConstraintConstant;
  v6 = [(_NSLayoutConstraintConstant *)&v8 init];
  if (v6)
  {
    v6->_symbolicValue = (NSString *)[a3 copy];
    v6->_numericValue = a4;
  }
  return v6;
}

- (_NSLayoutConstraintConstant)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_NSLayoutConstraintConstant;
  v4 = [(_NSLayoutConstraintConstant *)&v7 init];
  if (v4)
  {
    v4->_symbolicValue = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", @"UISymbolicConstant"), "copy");
    [a3 decodeDoubleForKey:@"UINumericConstant"];
    v4->_numericValue = v5;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_symbolicValue forKey:@"UISymbolicConstant"];
  double numericValue = self->_numericValue;
  [a3 encodeDouble:@"UINumericConstant" forKey:numericValue];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_NSLayoutConstraintConstant;
  [(_NSLayoutConstraintConstant *)&v3 dealloc];
}

- (NSString)symbolicValue
{
  return self->_symbolicValue;
}

- (double)numericValue
{
  return self->_numericValue;
}

@end