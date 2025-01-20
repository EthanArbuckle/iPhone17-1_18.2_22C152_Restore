@interface REDailyRoutineRelevanceProvider
+ (id)relevanceSimulatorID;
- (BOOL)isEqual:(id)a3;
- (REDailyRoutineRelevanceProvider)init;
- (REDailyRoutineRelevanceProvider)initWithDailyRoutineType:(unint64_t)a3;
- (REDailyRoutineRelevanceProvider)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryEncoding;
- (unint64_t)_hash;
- (unint64_t)type;
@end

@implementation REDailyRoutineRelevanceProvider

- (REDailyRoutineRelevanceProvider)init
{
  return [(REDailyRoutineRelevanceProvider *)self initWithDailyRoutineType:2];
}

- (REDailyRoutineRelevanceProvider)initWithDailyRoutineType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)REDailyRoutineRelevanceProvider;
  result = [(RERelevanceProvider *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

+ (id)relevanceSimulatorID
{
  return @"routine_type";
}

- (REDailyRoutineRelevanceProvider)initWithDictionary:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"routine_type"];
  if ([v4 compare:@"morning" options:1])
  {
    if ([v4 compare:@"evening" options:1]) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 1;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = [(REDailyRoutineRelevanceProvider *)self initWithDailyRoutineType:v5];

  return v6;
}

- (id)dictionaryEncoding
{
  v7[1] = *MEMORY[0x263EF8340];
  unint64_t type = self->_type;
  if (type > 2) {
    v3 = &stru_26CFA57D0;
  }
  else {
    v3 = off_2644BE368[type];
  }
  v6 = @"routine_type";
  v7[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)REDailyRoutineRelevanceProvider;
  id result = [(RERelevanceProvider *)&v5 copyWithZone:a3];
  *((void *)result + 4) = self->_type;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (REDailyRoutineRelevanceProvider *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)REDailyRoutineRelevanceProvider;
    BOOL v5 = [(RERelevanceProvider *)&v7 isEqual:v4]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && self->_type == v4->_type;
  }

  return v5;
}

- (unint64_t)_hash
{
  v2 = [NSNumber numberWithUnsignedInteger:self->_type];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t type = self->_type;
  if (type > 2) {
    unint64_t v3 = 0;
  }
  else {
    unint64_t v3 = off_2644BE368[type];
  }
  v7.receiver = self;
  v7.super_class = (Class)REDailyRoutineRelevanceProvider;
  v4 = [(REDailyRoutineRelevanceProvider *)&v7 description];
  BOOL v5 = [v4 stringByAppendingFormat:@" type=%@", v3];

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

@end