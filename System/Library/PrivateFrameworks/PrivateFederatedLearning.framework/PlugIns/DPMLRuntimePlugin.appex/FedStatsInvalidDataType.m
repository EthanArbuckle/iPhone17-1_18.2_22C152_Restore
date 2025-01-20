@interface FedStatsInvalidDataType
+ (id)createFromDict:(id)a3 possibleError:(id *)a4;
- (FedStatsInvalidDataType)init;
- (id)decodeFromIndex:(id)a3 possibleError:(id *)a4;
- (id)decodeFromOneHotVector:(id)a3 possibleError:(id *)a4;
- (id)encodeToIndex:(id)a3 possibleError:(id *)a4;
- (id)encodeToOneHotVector:(id)a3 possibleError:(id *)a4;
- (id)sampleForIndex:(unint64_t)a3;
- (int64_t)dataType;
- (unint64_t)classCount;
@end

@implementation FedStatsInvalidDataType

- (FedStatsInvalidDataType)init
{
  v3.receiver = self;
  v3.super_class = (Class)FedStatsInvalidDataType;
  return [(FedStatsInvalidDataType *)&v3 init];
}

+ (id)createFromDict:(id)a3 possibleError:(id *)a4
{
  if (a4)
  {
    *a4 = +[FedStatsError errorWithCode:900 description:@"This is only a placeholder class for invalid types."];
  }
  id v6 = objc_alloc_init((Class)a1);
  return v6;
}

- (int64_t)dataType
{
  return -2;
}

- (id)encodeToIndex:(id)a3 possibleError:(id *)a4
{
  if (a4)
  {
    *a4 = +[FedStatsError errorWithCode:900 description:@"This is only a placeholder class for invalid types."];
  }
  return 0;
}

- (id)decodeFromIndex:(id)a3 possibleError:(id *)a4
{
  if (a4)
  {
    *a4 = +[FedStatsError errorWithCode:900 description:@"This is only a placeholder class for invalid types."];
  }
  return 0;
}

- (id)encodeToOneHotVector:(id)a3 possibleError:(id *)a4
{
  if (a4)
  {
    *a4 = +[FedStatsError errorWithCode:900 description:@"This is only a placeholder class for invalid types."];
  }
  return 0;
}

- (id)decodeFromOneHotVector:(id)a3 possibleError:(id *)a4
{
  if (a4)
  {
    *a4 = +[FedStatsError errorWithCode:900 description:@"This is only a placeholder class for invalid types."];
  }
  return 0;
}

- (unint64_t)classCount
{
  return 0;
}

- (id)sampleForIndex:(unint64_t)a3
{
  return &off_1000346A0;
}

@end