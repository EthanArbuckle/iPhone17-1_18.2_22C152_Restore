@interface REActivityRelevanceProvider
+ (id)relevanceSimulatorID;
- (BOOL)closedActiveEngergy;
- (BOOL)closedExerciseTime;
- (BOOL)closedStandHour;
- (BOOL)isEqual:(id)a3;
- (REActivityRelevanceProvider)initWithActiveEnergyState:(BOOL)a3 exerciseTimeState:(BOOL)a4 standHourState:(BOOL)a5;
- (REActivityRelevanceProvider)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryEncoding;
- (unint64_t)_hash;
@end

@implementation REActivityRelevanceProvider

+ (id)relevanceSimulatorID
{
  return @"activity_rings";
}

- (REActivityRelevanceProvider)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"energy"];
  v6 = [v4 objectForKeyedSubscript:@"exercise"];
  v7 = [v4 objectForKeyedSubscript:@"stand"];

  v8 = -[REActivityRelevanceProvider initWithActiveEnergyState:exerciseTimeState:standHourState:](self, "initWithActiveEnergyState:exerciseTimeState:standHourState:", [v5 BOOLValue], objc_msgSend(v6, "BOOLValue"), objc_msgSend(v7, "BOOLValue"));
  return v8;
}

- (id)dictionaryEncoding
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [NSNumber numberWithBool:self->_closedActiveEngergy];
  [v3 setObject:v4 forKeyedSubscript:@"energy"];

  v5 = [NSNumber numberWithBool:self->_closedExerciseTime];
  [v3 setObject:v5 forKeyedSubscript:@"exercise"];

  v6 = [NSNumber numberWithBool:self->_closedStandHour];
  [v3 setObject:v6 forKeyedSubscript:@"stand"];

  v7 = (void *)[v3 copy];
  return v7;
}

- (REActivityRelevanceProvider)initWithActiveEnergyState:(BOOL)a3 exerciseTimeState:(BOOL)a4 standHourState:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)REActivityRelevanceProvider;
  result = [(RERelevanceProvider *)&v9 init];
  if (result)
  {
    result->_closedStandHour = a5;
    result->_closedExerciseTime = a4;
    result->_closedActiveEngergy = a3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BOOL closedActiveEngergy = self->_closedActiveEngergy;
  BOOL closedExerciseTime = self->_closedExerciseTime;
  BOOL closedStandHour = self->_closedStandHour;
  return (id)[v4 initWithActiveEnergyState:closedActiveEngergy exerciseTimeState:closedExerciseTime standHourState:closedStandHour];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REActivityRelevanceProvider *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)REActivityRelevanceProvider;
    if ([(RERelevanceProvider *)&v8 isEqual:v4]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      BOOL v6 = self->_closedStandHour == v5[34]
        && self->_closedExerciseTime == v5[33]
        && self->_closedActiveEngergy == v5[32];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)_hash
{
  return self->_closedStandHour | (16 * self->_closedExerciseTime) | ((unint64_t)self->_closedActiveEngergy << 8);
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)REActivityRelevanceProvider;
  v3 = [(REActivityRelevanceProvider *)&v9 description];
  id v4 = [NSNumber numberWithBool:self->_closedStandHour];
  v5 = [NSNumber numberWithBool:self->_closedExerciseTime];
  BOOL v6 = [NSNumber numberWithBool:self->_closedActiveEngergy];
  v7 = [v3 stringByAppendingFormat:@" stand=%@, exercise=%@, energy=%@", v4, v5, v6];

  return v7;
}

- (BOOL)closedActiveEngergy
{
  return self->_closedActiveEngergy;
}

- (BOOL)closedExerciseTime
{
  return self->_closedExerciseTime;
}

- (BOOL)closedStandHour
{
  return self->_closedStandHour;
}

@end