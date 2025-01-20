@interface REWorkoutRelevanceProvider
+ (id)relevanceSimulatorID;
- (BOOL)isEqual:(id)a3;
- (REWorkoutRelevanceProvider)initWithDictionary:(id)a3;
- (REWorkoutRelevanceProvider)initWithState:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryEncoding;
- (unint64_t)_hash;
- (unint64_t)state;
@end

@implementation REWorkoutRelevanceProvider

+ (id)relevanceSimulatorID
{
  return @"active_workout";
}

- (REWorkoutRelevanceProvider)initWithDictionary:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"state"];
  v5 = -[REWorkoutRelevanceProvider initWithState:](self, "initWithState:", [v4 unsignedIntegerValue]);

  return v5;
}

- (id)dictionaryEncoding
{
  v6[1] = *MEMORY[0x263EF8340];
  v5 = @"state";
  v2 = [NSNumber numberWithUnsignedInteger:self->_state];
  v6[0] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (REWorkoutRelevanceProvider)initWithState:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)REWorkoutRelevanceProvider;
  result = [(RERelevanceProvider *)&v5 init];
  if (result) {
    result->_state = a3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  unint64_t state = self->_state;
  return (id)[v4 initWithState:state];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (REWorkoutRelevanceProvider *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)REWorkoutRelevanceProvider;
    BOOL v5 = [(RERelevanceProvider *)&v7 isEqual:v4]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && self->_state == v4->_state;
  }

  return v5;
}

- (unint64_t)_hash
{
  return self->_state;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)REWorkoutRelevanceProvider;
  v3 = [(REWorkoutRelevanceProvider *)&v6 description];
  v4 = objc_msgSend(v3, "stringByAppendingFormat:", @" state=%lu", self->_state);

  return v4;
}

- (unint64_t)state
{
  return self->_state;
}

@end