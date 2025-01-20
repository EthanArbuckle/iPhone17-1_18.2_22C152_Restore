@interface TIStatisticKey
+ (id)statisticKeyWithAggdName:(id)a3 andCounterName:(id)a4 andInputMode:(id)a5;
- (NSString)aggdName;
- (NSString)counterName;
- (NSString)inputMode;
- (TIStatisticKey)initWithAggdName:(id)a3 andCounterName:(id)a4 andInputMode:(id)a5;
@end

@implementation TIStatisticKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputMode, 0);
  objc_storeStrong((id *)&self->_aggdName, 0);

  objc_storeStrong((id *)&self->_counterName, 0);
}

- (NSString)inputMode
{
  return self->_inputMode;
}

- (NSString)aggdName
{
  return self->_aggdName;
}

- (NSString)counterName
{
  return self->_counterName;
}

- (TIStatisticKey)initWithAggdName:(id)a3 andCounterName:(id)a4 andInputMode:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TIStatisticKey;
  v12 = [(TIStatisticKey *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_aggdName, a3);
    objc_storeStrong((id *)&v13->_counterName, a4);
    objc_storeStrong((id *)&v13->_inputMode, a5);
  }

  return v13;
}

+ (id)statisticKeyWithAggdName:(id)a3 andCounterName:(id)a4 andInputMode:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[TIStatisticKey alloc] initWithAggdName:v9 andCounterName:v8 andInputMode:v7];

  return v10;
}

@end