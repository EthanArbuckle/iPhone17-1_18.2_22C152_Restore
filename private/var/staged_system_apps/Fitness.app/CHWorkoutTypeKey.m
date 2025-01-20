@interface CHWorkoutTypeKey
+ (BOOL)historyFilterDisambiguatesLocationForActivityType:(unint64_t)a3;
+ (id)emptyKey;
+ (id)initForWorkout:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIndoor;
- (NSString)workoutBrandName;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)swimLocationType;
- (unint64_t)activityType;
- (unint64_t)hash;
- (void)setActivityType:(unint64_t)a3;
- (void)setIndoor:(BOOL)a3;
- (void)setSwimLocationType:(int64_t)a3;
- (void)setWorkoutBrandName:(id)a3;
@end

@implementation CHWorkoutTypeKey

+ (id)emptyKey
{
  v2 = objc_alloc_init(CHWorkoutTypeKey);
  [(CHWorkoutTypeKey *)v2 setActivityType:_HKWorkoutActivityTypeNone];
  [(CHWorkoutTypeKey *)v2 setIndoor:0];
  [(CHWorkoutTypeKey *)v2 setWorkoutBrandName:0];

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[2] = self->_activityType;
  *((unsigned char *)v5 + 8) = self->_indoor;
  id v6 = [(NSString *)self->_workoutBrandName copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  v5[4] = self->_swimLocationType;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    workoutBrandName = self->_workoutBrandName;
    v7 = [v5 workoutBrandName];
    if (workoutBrandName == v7)
    {
      unsigned int v11 = 1;
    }
    else
    {
      v8 = [v5 workoutBrandName];
      if (v8)
      {
        v9 = self->_workoutBrandName;
        v10 = [v5 workoutBrandName];
        unsigned int v11 = [(NSString *)v9 isEqualToString:v10];
      }
      else
      {
        unsigned int v11 = 0;
      }
    }
    id v13 = [(CHWorkoutTypeKey *)self activityType];
    if (v13 == [v5 activityType]
      && (unsigned int v14 = [(CHWorkoutTypeKey *)self isIndoor],
          (v11 & ~(v14 ^ [v5 isIndoor])) == 1))
    {
      id swimLocationType = self->_swimLocationType;
      BOOL v12 = swimLocationType == [v5 swimLocationType];
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  BOOL indoor = self->_indoor;
  unint64_t activityType = self->_activityType;
  if (activityType == 46)
  {
    p_workoutBrandName = &self->_workoutBrandName;
    workoutBrandName = self->_workoutBrandName;
    id v5 = p_workoutBrandName[1];
    uint64_t v7 = 200000;
    if (v5 != (NSString *)2) {
      uint64_t v7 = 0;
    }
    if (v5 == (NSString *)1) {
      uint64_t v8 = 100000;
    }
    else {
      uint64_t v8 = v7;
    }
    unint64_t v9 = [(NSString *)workoutBrandName hash] ^ v8;
  }
  else
  {
    unint64_t v9 = [(NSString *)self->_workoutBrandName hash];
  }
  uint64_t v10 = 20000;
  if (!indoor) {
    uint64_t v10 = 0;
  }
  return v9 ^ activityType ^ v10;
}

+ (id)initForWorkout:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(CHWorkoutTypeKey);
  id v5 = [v3 fiui_activityType];

  -[CHWorkoutTypeKey setActivityType:](v4, "setActivityType:", [v5 effectiveTypeIdentifier]);
  if ([objc_opt_class() historyFilterDisambiguatesLocationForActivityType:[v5 effectiveTypeIdentifier]]-[CHWorkoutTypeKey setIndoor:](v4, "setIndoor:", [v5 isIndoor])) {
  if ([v5 effectiveTypeIdentifier] == (id)46)
  }
    -[CHWorkoutTypeKey setSwimLocationType:](v4, "setSwimLocationType:", [v5 swimmingLocationType]);
  if ([v5 effectiveTypeIdentifier] == (id)14) {
    [(CHWorkoutTypeKey *)v4 setActivityType:77];
  }

  return v4;
}

+ (BOOL)historyFilterDisambiguatesLocationForActivityType:(unint64_t)a3
{
  if (a3 <= 0x34 && ((1 << a3) & 0x10402000000000) != 0) {
    return 0;
  }
  else {
    return +[FIWorkoutActivityType shouldDisambiguateOnLocationType:](FIWorkoutActivityType, "shouldDisambiguateOnLocationType:");
  }
}

- (unint64_t)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(unint64_t)a3
{
  self->_unint64_t activityType = a3;
}

- (BOOL)isIndoor
{
  return self->_indoor;
}

- (void)setIndoor:(BOOL)a3
{
  self->_BOOL indoor = a3;
}

- (NSString)workoutBrandName
{
  return self->_workoutBrandName;
}

- (void)setWorkoutBrandName:(id)a3
{
}

- (int64_t)swimLocationType
{
  return self->_swimLocationType;
}

- (void)setSwimLocationType:(int64_t)a3
{
  self->_id swimLocationType = a3;
}

- (void).cxx_destruct
{
}

@end