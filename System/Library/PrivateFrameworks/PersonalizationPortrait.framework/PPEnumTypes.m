@interface PPEnumTypes
+ (id)deviceFilterMapping;
+ (id)locationConsumerMapping;
+ (id)locationConsumerValidValueList;
+ (id)reverseDeviceFilterMapping;
+ (id)reverseLocationConsumerMapping;
+ (id)stringForDeviceFilter:(unint64_t)a3;
+ (id)stringForLocationConsumer:(unint64_t)a3;
@end

@implementation PPEnumTypes

+ (id)locationConsumerValidValueList
{
  v2 = [MEMORY[0x1E4F28E78] stringWithString:@"["];
  v3 = +[PPEnumTypes stringForLocationConsumer:1];
  [v2 appendString:v3];

  for (uint64_t i = 2; i != 4; ++i)
  {
    [v2 appendString:@", "];
    v5 = +[PPEnumTypes stringForLocationConsumer:i];
    [v2 appendString:v5];
  }
  [v2 appendString:@"]"];
  return v2;
}

+ (id)reverseLocationConsumerMapping
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
  for (uint64_t i = 0; i != 4; ++i)
  {
    v5 = [NSNumber numberWithUnsignedInteger:i];
    v6 = [a1 stringForLocationConsumer:i];
    [v3 setObject:v5 forKeyedSubscript:v6];
  }
  return v3;
}

+ (id)locationConsumerMapping
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
  for (uint64_t i = 0; i != 4; ++i)
  {
    v5 = [a1 stringForLocationConsumer:i];
    v6 = [NSNumber numberWithUnsignedInteger:i];
    [v3 setObject:v5 forKeyedSubscript:v6];
  }
  return v3;
}

+ (id)reverseDeviceFilterMapping
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  for (uint64_t i = 0; i != 3; ++i)
  {
    v5 = [NSNumber numberWithUnsignedInteger:i];
    v6 = [a1 stringForDeviceFilter:i];
    [v3 setObject:v5 forKeyedSubscript:v6];
  }
  return v3;
}

+ (id)deviceFilterMapping
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  for (uint64_t i = 0; i != 3; ++i)
  {
    v5 = [a1 stringForDeviceFilter:i];
    v6 = [NSNumber numberWithUnsignedInteger:i];
    [v3 setObject:v5 forKeyedSubscript:v6];
  }
  return v3;
}

+ (id)stringForLocationConsumer:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3 < 5) {
    return off_1E550E7D0[a3];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v11 = v9;
    __int16 v12 = 2048;
    unint64_t v13 = a3;
    _os_log_error_impl(&dword_18CAA6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@ called with invalid PPLocationConsumer value of %lu", buf, 0x16u);
  }
  v6 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v7 = *MEMORY[0x1E4F1C3B8];
  v8 = NSStringFromSelector(a2);
  [v6 raise:v7, @"%@ called with invalid PPLocationConsumer value of %lu", v8, a3 format];

  return @"invalid";
}

+ (id)stringForDeviceFilter:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3 < 3) {
    return off_1E550E7B8[a3];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v11 = v9;
    __int16 v12 = 2048;
    unint64_t v13 = a3;
    _os_log_error_impl(&dword_18CAA6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@ called with invalid PPDeviceFilter value of %lu", buf, 0x16u);
  }
  v6 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v7 = *MEMORY[0x1E4F1C3B8];
  v8 = NSStringFromSelector(a2);
  [v6 raise:v7, @"%@ called with invalid PPDeviceFilter value of %lu", v8, a3 format];

  return @"invalid";
}

@end