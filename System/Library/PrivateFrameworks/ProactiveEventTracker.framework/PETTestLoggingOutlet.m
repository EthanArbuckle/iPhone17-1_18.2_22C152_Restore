@interface PETTestLoggingOutlet
- (NSMutableArray)allLoggedKeys;
- (NSMutableArray)allLoggedValues;
- (NSMutableDictionary)keyValues;
- (NSString)lastLoggedKey;
- (NSString)previousLoggedKey;
- (PETTestLoggingOutlet)init;
- (double)lastLoggedDistributionValue;
- (double)previousLoggedDistributionValue;
- (id)getValueForKey:(id)a3;
- (unint64_t)lastLoggedScalarValue;
- (unint64_t)previousLoggedScalarValue;
- (void)logDoubleValue:(double)a3 forEvent:(id)a4 featureId:(id)a5 stringifiedProperties:(id)a6 metaData:(id)a7;
- (void)logErrorForEvent:(id)a3 featureId:(id)a4 reason:(id)a5;
- (void)logUnsignedIntegerValue:(unint64_t)a3 forEvent:(id)a4 featureId:(id)a5 stringifiedProperties:(id)a6 metaData:(id)a7;
- (void)reset;
- (void)setUnsignedIntegerValue:(unint64_t)a3 forEvent:(id)a4 featureId:(id)a5 stringifiedProperties:(id)a6 metaData:(id)a7;
@end

@implementation PETTestLoggingOutlet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValues, 0);
  objc_storeStrong((id *)&self->_allLoggedValues, 0);
  objc_storeStrong((id *)&self->_allLoggedKeys, 0);
  objc_storeStrong((id *)&self->_previousLoggedKey, 0);

  objc_storeStrong((id *)&self->_lastLoggedKey, 0);
}

- (NSMutableDictionary)keyValues
{
  return self->_keyValues;
}

- (NSMutableArray)allLoggedValues
{
  return self->_allLoggedValues;
}

- (NSMutableArray)allLoggedKeys
{
  return self->_allLoggedKeys;
}

- (double)previousLoggedDistributionValue
{
  return self->_previousLoggedDistributionValue;
}

- (unint64_t)previousLoggedScalarValue
{
  return self->_previousLoggedScalarValue;
}

- (NSString)previousLoggedKey
{
  return self->_previousLoggedKey;
}

- (double)lastLoggedDistributionValue
{
  return self->_lastLoggedDistributionValue;
}

- (unint64_t)lastLoggedScalarValue
{
  return self->_lastLoggedScalarValue;
}

- (NSString)lastLoggedKey
{
  return self->_lastLoggedKey;
}

- (id)getValueForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_keyValues objectForKeyedSubscript:a3];
}

- (void)reset
{
  previousLoggedKey = self->_previousLoggedKey;
  self->_previousLoggedKey = 0;

  self->_previousLoggedDistributionValue = 0.0;
  lastLoggedKey = self->_lastLoggedKey;
  self->_lastLoggedKey = 0;

  self->_lastLoggedDistributionValue = 0.0;
  v5 = [MEMORY[0x1E4F1CA48] array];
  allLoggedKeys = self->_allLoggedKeys;
  self->_allLoggedKeys = v5;

  self->_allLoggedValues = [MEMORY[0x1E4F1CA48] array];

  MEMORY[0x1F41817F8]();
}

- (void)logErrorForEvent:(id)a3 featureId:(id)a4 reason:(id)a5
{
  id v5 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"PETEventTrackingException" reason:a5 userInfo:0];
  [v5 raise];
}

- (void)logDoubleValue:(double)a3 forEvent:(id)a4 featureId:(id)a5 stringifiedProperties:(id)a6 metaData:(id)a7
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v9 = +[PETLoggingUtils keyStringForEvent:a4 featureId:a5 stringifiedProperties:a6 metaData:a7];
  if ((unint64_t)[v9 length] >= 0x100)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412546;
      v20 = v9;
      __int16 v21 = 1024;
      int v22 = 255;
      _os_log_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "AggD key %@ exceeds max length of %d. Try to shorten the event/property names", (uint8_t *)&v19, 0x12u);
    }
    v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"PETEventTrackingException" reason:@"key exceeds max length" userInfo:0];
    [v10 raise];
  }
  objc_storeStrong((id *)&self->_previousLoggedKey, self->_lastLoggedKey);
  self->_previousLoggedDistributionValue = self->_lastLoggedDistributionValue;
  lastLoggedKey = self->_lastLoggedKey;
  self->_lastLoggedKey = (NSString *)v9;
  id v12 = v9;

  self->_lastLoggedDistributionValue = a3;
  [(NSMutableArray *)self->_allLoggedKeys addObject:v12];
  allLoggedValues = self->_allLoggedValues;
  v14 = [NSNumber numberWithDouble:a3];
  [(NSMutableArray *)allLoggedValues addObject:v14];

  v15 = NSNumber;
  v16 = [(NSMutableDictionary *)self->_keyValues objectForKeyedSubscript:v12];
  [v16 doubleValue];
  v18 = [v15 numberWithDouble:v17 + a3];
  [(NSMutableDictionary *)self->_keyValues setObject:v18 forKeyedSubscript:v12];
}

- (void)setUnsignedIntegerValue:(unint64_t)a3 forEvent:(id)a4 featureId:(id)a5 stringifiedProperties:(id)a6 metaData:(id)a7
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v9 = +[PETLoggingUtils keyStringForEvent:a4 featureId:a5 stringifiedProperties:a6 metaData:a7];
  if ((unint64_t)[v9 length] >= 0x100)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      double v17 = v9;
      __int16 v18 = 1024;
      int v19 = 255;
      _os_log_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "AggD key %@ exceeds max length of %d. Try to shorten the event/property names", (uint8_t *)&v16, 0x12u);
    }
    v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"PETEventTrackingException" reason:@"key exceeds max length" userInfo:0];
    [v10 raise];
  }
  objc_storeStrong((id *)&self->_previousLoggedKey, self->_lastLoggedKey);
  lastLoggedKey = self->_lastLoggedKey;
  self->_previousLoggedScalarValue = self->_lastLoggedScalarValue;
  self->_lastLoggedKey = (NSString *)v9;
  id v12 = v9;

  self->_lastLoggedScalarValue = a3;
  [(NSMutableArray *)self->_allLoggedKeys addObject:v12];
  allLoggedValues = self->_allLoggedValues;
  v14 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableArray *)allLoggedValues addObject:v14];

  v15 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)self->_keyValues setObject:v15 forKeyedSubscript:v12];
}

- (void)logUnsignedIntegerValue:(unint64_t)a3 forEvent:(id)a4 featureId:(id)a5 stringifiedProperties:(id)a6 metaData:(id)a7
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v9 = +[PETLoggingUtils keyStringForEvent:a4 featureId:a5 stringifiedProperties:a6 metaData:a7];
  if ((unint64_t)[v9 length] >= 0x100)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412546;
      int v19 = v9;
      __int16 v20 = 1024;
      int v21 = 255;
      _os_log_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "AggD key %@ exceeds max length of %d. Try to shorten the event/property names", (uint8_t *)&v18, 0x12u);
    }
    v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"PETEventTrackingException" reason:@"key exceeds max length" userInfo:0];
    [v10 raise];
  }
  objc_storeStrong((id *)&self->_previousLoggedKey, self->_lastLoggedKey);
  lastLoggedKey = self->_lastLoggedKey;
  self->_previousLoggedScalarValue = self->_lastLoggedScalarValue;
  self->_lastLoggedKey = (NSString *)v9;
  id v12 = v9;

  self->_lastLoggedScalarValue = a3;
  [(NSMutableArray *)self->_allLoggedKeys addObject:v12];
  allLoggedValues = self->_allLoggedValues;
  v14 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableArray *)allLoggedValues addObject:v14];

  v15 = NSNumber;
  int v16 = [(NSMutableDictionary *)self->_keyValues objectForKeyedSubscript:v12];
  double v17 = objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "unsignedIntegerValue") + a3);
  [(NSMutableDictionary *)self->_keyValues setObject:v17 forKeyedSubscript:v12];
}

- (PETTestLoggingOutlet)init
{
  v10.receiver = self;
  v10.super_class = (Class)PETTestLoggingOutlet;
  v2 = [(PETTestLoggingOutlet *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    allLoggedKeys = v2->_allLoggedKeys;
    v2->_allLoggedKeys = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    allLoggedValues = v2->_allLoggedValues;
    v2->_allLoggedValues = (NSMutableArray *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    keyValues = v2->_keyValues;
    v2->_keyValues = v7;
  }
  return v2;
}

@end