@interface _TUIKeyboardCorrectionListAccumulatorPolicy
+ (id)standard;
- (_TUIKeyboardCorrectionListAccumulatorPolicy)init;
- (double)accumulatorTimeout;
- (void)setAccumulatorTimeout:(double)a3;
@end

@implementation _TUIKeyboardCorrectionListAccumulatorPolicy

- (void)setAccumulatorTimeout:(double)a3
{
  self->_accumulatorTimeout = a3;
}

- (double)accumulatorTimeout
{
  return self->_accumulatorTimeout;
}

- (_TUIKeyboardCorrectionListAccumulatorPolicy)init
{
  v3.receiver = self;
  v3.super_class = (Class)_TUIKeyboardCorrectionListAccumulatorPolicy;
  result = [(_TUIKeyboardCorrectionListAccumulatorPolicy *)&v3 init];
  if (result) {
    result->_accumulatorTimeout = 0.25;
  }
  return result;
}

+ (id)standard
{
  v2 = objc_alloc_init(_TUIKeyboardCorrectionListAccumulatorPolicy);
  return v2;
}

@end