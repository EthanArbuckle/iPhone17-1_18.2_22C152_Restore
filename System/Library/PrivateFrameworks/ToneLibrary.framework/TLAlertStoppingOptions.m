@interface TLAlertStoppingOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldWaitUntilEndOfCurrentRepetition;
- (TLAlertStoppingOptions)init;
- (TLAlertStoppingOptions)initWithCoder:(id)a3;
- (double)fadeOutDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setFadeOutDuration:(double)a3;
- (void)setShouldWaitUntilEndOfCurrentRepetition:(BOOL)a3;
@end

@implementation TLAlertStoppingOptions

- (TLAlertStoppingOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)TLAlertStoppingOptions;
  result = [(TLAlertStoppingOptions *)&v3 init];
  if (result)
  {
    result->_fadeOutDuration = 0.0;
    result->_shouldWaitUntilEndOfCurrentRepetition = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init((Class)objc_opt_class());
  if (result)
  {
    *((void *)result + 2) = *(void *)&self->_fadeOutDuration;
    *((unsigned char *)result + 8) = self->_shouldWaitUntilEndOfCurrentRepetition;
  }
  return result;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  if (self->_fadeOutDuration > 0.00000011920929) {
    objc_msgSend(v6, "appendFormat:", @"; fadeOutDuration = %f", *(void *)&self->_fadeOutDuration);
  }
  if (self->_shouldWaitUntilEndOfCurrentRepetition) {
    [v6 appendString:@"; shouldWaitUntilEndOfCurrentRepetition = YES"];
  }
  [v6 appendString:@">"];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TLAlertStoppingOptions *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && llround(self->_fadeOutDuration / 0.0001) == llround(v4->_fadeOutDuration / 0.0001))
    {
      BOOL v5 = !self->_shouldWaitUntilEndOfCurrentRepetition ^ v4->_shouldWaitUntilEndOfCurrentRepetition;
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return llround(self->_fadeOutDuration / 0.0001) ^ self->_shouldWaitUntilEndOfCurrentRepetition;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TLAlertStoppingOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TLAlertStoppingOptions;
  BOOL v5 = [(TLAlertStoppingOptions *)&v8 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"fadeOutDuration"];
    v5->_fadeOutDuration = v6;
    v5->_shouldWaitUntilEndOfCurrentRepetition = [v4 decodeBoolForKey:@"shouldWaitUntilEndOfCurrentRepetition"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double fadeOutDuration = self->_fadeOutDuration;
  id v5 = a3;
  [v5 encodeDouble:@"fadeOutDuration" forKey:fadeOutDuration];
  [v5 encodeBool:self->_shouldWaitUntilEndOfCurrentRepetition forKey:@"shouldWaitUntilEndOfCurrentRepetition"];
}

- (double)fadeOutDuration
{
  return self->_fadeOutDuration;
}

- (void)setFadeOutDuration:(double)a3
{
  self->_double fadeOutDuration = a3;
}

- (BOOL)shouldWaitUntilEndOfCurrentRepetition
{
  return self->_shouldWaitUntilEndOfCurrentRepetition;
}

- (void)setShouldWaitUntilEndOfCurrentRepetition:(BOOL)a3
{
  self->_shouldWaitUntilEndOfCurrentRepetition = a3;
}

@end