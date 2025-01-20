@interface FCUserEventHistoryPruningPolicy
- (FCUserEventHistoryPruningPolicy)initWithType:(int64_t)a3 value:(unint64_t)a4;
- (id)description;
- (int64_t)type;
- (unint64_t)value;
- (void)setType:(int64_t)a3;
- (void)setValue:(unint64_t)a3;
@end

@implementation FCUserEventHistoryPruningPolicy

- (FCUserEventHistoryPruningPolicy)initWithType:(int64_t)a3 value:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)FCUserEventHistoryPruningPolicy;
  result = [(FCUserEventHistoryPruningPolicy *)&v7 init];
  if (result)
  {
    result->_type = a3;
    result->_value = a4;
  }
  return result;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  unint64_t v4 = [(FCUserEventHistoryPruningPolicy *)self type];
  if (v4 > 3) {
    v5 = @"MaxTotalSize";
  }
  else {
    v5 = off_1E5B50918[v4];
  }
  [v3 appendFormat:@"; type: %@", v5];
  objc_msgSend(v3, "appendFormat:", @"; value: %lu", -[FCUserEventHistoryPruningPolicy value](self, "value"));
  [v3 appendString:@">"];
  return v3;
}

- (unint64_t)value
{
  return self->_value;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setValue:(unint64_t)a3
{
  self->_value = a3;
}

@end