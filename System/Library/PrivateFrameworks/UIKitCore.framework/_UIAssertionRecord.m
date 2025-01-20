@interface _UIAssertionRecord
- (BOOL)initialState;
- (NSString)reason;
- (int64_t)activeAssertionCount;
- (unint64_t)type;
- (void)setActiveAssertionCount:(int64_t)a3;
- (void)setInitialState:(BOOL)a3;
- (void)setReason:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation _UIAssertionRecord

- (int64_t)activeAssertionCount
{
  return self->_activeAssertionCount;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)initialState
{
  return self->_initialState;
}

- (void)setInitialState:(BOOL)a3
{
  self->_initialState = a3;
}

- (void)setActiveAssertionCount:(int64_t)a3
{
  self->_activeAssertionCount = a3;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (void).cxx_destruct
{
}

@end