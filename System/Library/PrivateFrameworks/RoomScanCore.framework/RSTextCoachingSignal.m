@interface RSTextCoachingSignal
- (NSString)text;
- (RSTextCoachingSignal)init;
- (float)score;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)state;
- (int64_t)type;
@end

@implementation RSTextCoachingSignal

- (void).cxx_destruct
{
}

- (float)score
{
  return self->_score;
}

- (NSString)text
{
  return self->_text;
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)type
{
  return self->_type;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(RSTextCoachingSignal);
  v4->_type = self->_type;
  objc_storeStrong((id *)&v4->_text, self->_text);
  v4->_score = self->_score;
  v4->_state = self->_state;
  return v4;
}

- (RSTextCoachingSignal)init
{
  return (RSTextCoachingSignal *)sub_25B51F704(self, -1, 0.0);
}

@end