@interface WFWorkoutType
+ (id)allTypes;
- (NSString)name;
- (WFWorkoutType)initWithActivityType:(unint64_t)a3;
- (unint64_t)activityType;
@end

@implementation WFWorkoutType

- (void).cxx_destruct
{
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)activityType
{
  return self->_activityType;
}

- (WFWorkoutType)initWithActivityType:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WFWorkoutType;
  v4 = [(WFWorkoutType *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_activityType = a3;
    uint64_t v6 = softLinkHKUILocalizedWorkoutTypeName(a3);
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

+ (id)allTypes
{
  v2 = [(objc_class *)getHKWorkoutClass() _allWorkoutActivityTypes];
  v3 = objc_msgSend(v2, "if_map:", &__block_literal_global_3587);
  v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_439];

  return v4;
}

uint64_t __25__WFWorkoutType_allTypes__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 name];
  uint64_t v6 = [v4 name];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

WFWorkoutType *__25__WFWorkoutType_allTypes__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [WFWorkoutType alloc];
  uint64_t v4 = [v2 unsignedIntegerValue];

  v5 = [(WFWorkoutType *)v3 initWithActivityType:v4];
  return v5;
}

@end