@interface SVXSpeechSynthesisWordTiming
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (SVXSpeechSynthesisWordTiming)initWithCoder:(id)a3;
- (SVXSpeechSynthesisWordTiming)initWithRange:(_NSRange)a3 timeInterval:(double)a4;
- (_NSRange)range;
- (double)timeInterval;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVXSpeechSynthesisWordTiming

- (double)timeInterval
{
  return self->_timeInterval;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x263F08D40];
  NSUInteger location = self->_range.location;
  NSUInteger length = self->_range.length;
  id v7 = a3;
  v8 = objc_msgSend(v4, "valueWithRange:", location, length);
  [v7 encodeObject:v8 forKey:@"SVXSpeechSynthesisWordTiming::range"];

  id v9 = [NSNumber numberWithDouble:self->_timeInterval];
  [v7 encodeObject:v9 forKey:@"SVXSpeechSynthesisWordTiming::timeInterval"];
}

- (SVXSpeechSynthesisWordTiming)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXSpeechSynthesisWordTiming::range"];
  uint64_t v6 = [v5 rangeValue];
  uint64_t v8 = v7;

  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXSpeechSynthesisWordTiming::timeInterval"];

  [v9 doubleValue];
  double v11 = v10;

  return -[SVXSpeechSynthesisWordTiming initWithRange:timeInterval:](self, "initWithRange:timeInterval:", v6, v8, v11);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SVXSpeechSynthesisWordTiming *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v7 = 0;
      if (self->_range.location == [(SVXSpeechSynthesisWordTiming *)v5 range] && self->_range.length == v6)
      {
        double timeInterval = self->_timeInterval;
        [(SVXSpeechSynthesisWordTiming *)v5 timeInterval];
        BOOL v7 = timeInterval == v9;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v3 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", self->_range.location, self->_range.length);
  uint64_t v4 = [v3 hash];
  v5 = [NSNumber numberWithDouble:self->_timeInterval];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v9.receiver = self;
  v9.super_class = (Class)SVXSpeechSynthesisWordTiming;
  v5 = [(SVXSpeechSynthesisWordTiming *)&v9 description];
  unint64_t v6 = NSStringFromRange(self->_range);
  BOOL v7 = (void *)[v4 initWithFormat:@"%@ {range = %@, timeInterval = %f}", v5, v6, *(void *)&self->_timeInterval];

  return v7;
}

- (id)description
{
  return [(SVXSpeechSynthesisWordTiming *)self _descriptionWithIndent:0];
}

- (SVXSpeechSynthesisWordTiming)initWithRange:(_NSRange)a3 timeInterval:(double)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v8.receiver = self;
  v8.super_class = (Class)SVXSpeechSynthesisWordTiming;
  _NSRange result = [(SVXSpeechSynthesisWordTiming *)&v8 init];
  if (result)
  {
    result->_range.NSUInteger location = location;
    result->_range.NSUInteger length = length;
    result->_double timeInterval = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SVXSpeechSynthesisWordTimingMutation *))a3;
  if (v4)
  {
    v5 = [[_SVXSpeechSynthesisWordTimingMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    unint64_t v6 = [(_SVXSpeechSynthesisWordTimingMutation *)v5 generate];
  }
  else
  {
    unint64_t v6 = (void *)[(SVXSpeechSynthesisWordTiming *)self copy];
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  v3 = (void (**)(id, _SVXSpeechSynthesisWordTimingMutation *))a3;
  id v4 = objc_alloc_init(_SVXSpeechSynthesisWordTimingMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  v5 = [(_SVXSpeechSynthesisWordTimingMutation *)v4 generate];

  return v5;
}

@end