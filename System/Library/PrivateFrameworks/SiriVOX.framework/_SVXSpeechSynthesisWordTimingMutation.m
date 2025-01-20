@interface _SVXSpeechSynthesisWordTimingMutation
- (_SVXSpeechSynthesisWordTimingMutation)init;
- (_SVXSpeechSynthesisWordTimingMutation)initWithBaseModel:(id)a3;
- (id)generate;
- (void)setRange:(_NSRange)a3;
- (void)setTimeInterval:(double)a3;
@end

@implementation _SVXSpeechSynthesisWordTimingMutation

- (void).cxx_destruct
{
}

- (id)generate
{
  baseModel = self->_baseModel;
  if (baseModel)
  {
    if ((*(unsigned char *)&self->_mutationFlags & 1) == 0)
    {
      v4 = (SVXSpeechSynthesisWordTiming *)[(SVXSpeechSynthesisWordTiming *)baseModel copy];
      goto LABEL_12;
    }
    if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
    {
      NSUInteger location = self->_range.location;
      NSUInteger length = self->_range.length;
      if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
        goto LABEL_7;
      }
    }
    else
    {
      NSUInteger location = [(SVXSpeechSynthesisWordTiming *)baseModel range];
      NSUInteger length = v10;
      if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
      {
LABEL_7:
        double timeInterval = self->_timeInterval;
LABEL_10:
        v5 = [SVXSpeechSynthesisWordTiming alloc];
        NSUInteger v7 = location;
        NSUInteger v8 = length;
        double v6 = timeInterval;
        goto LABEL_11;
      }
    }
    [(SVXSpeechSynthesisWordTiming *)self->_baseModel timeInterval];
    double timeInterval = v13;
    goto LABEL_10;
  }
  v5 = [SVXSpeechSynthesisWordTiming alloc];
  double v6 = self->_timeInterval;
  NSUInteger v7 = self->_range.location;
  NSUInteger v8 = self->_range.length;
LABEL_11:
  v4 = -[SVXSpeechSynthesisWordTiming initWithRange:timeInterval:](v5, "initWithRange:timeInterval:", v7, v8, v6);
LABEL_12:

  return v4;
}

- (void)setTimeInterval:(double)a3
{
  self->_double timeInterval = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (_SVXSpeechSynthesisWordTimingMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXSpeechSynthesisWordTimingMutation;
  double v6 = [(_SVXSpeechSynthesisWordTimingMutation *)&v9 init];
  NSUInteger v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (_SVXSpeechSynthesisWordTimingMutation)init
{
  return [(_SVXSpeechSynthesisWordTimingMutation *)self initWithBaseModel:0];
}

@end