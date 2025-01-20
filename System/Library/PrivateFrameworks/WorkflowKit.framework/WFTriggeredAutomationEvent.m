@interface WFTriggeredAutomationEvent
+ (Class)codableEventClass;
+ (id)serializablePropertyTransformers;
- (BOOL)requiredRuntimeConfirmation;
- (NSString)key;
- (NSString)triggerType;
- (unsigned)batchCount;
- (unsigned)batchDroppedCount;
- (void)setBatchCount:(unsigned int)a3;
- (void)setBatchDroppedCount:(unsigned int)a3;
- (void)setKey:(id)a3;
- (void)setRequiredRuntimeConfirmation:(BOOL)a3;
- (void)setTriggerType:(id)a3;
@end

@implementation WFTriggeredAutomationEvent

+ (id)serializablePropertyTransformers
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"batchCount";
  v2 = objc_alloc_init(WFEventSignificantFigureValueTransformer);
  v6[1] = @"batchDroppedCount";
  v7[0] = v2;
  v3 = objc_alloc_init(WFEventSignificantFigureValueTransformer);
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerType, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setBatchDroppedCount:(unsigned int)a3
{
  self->_batchDroppedCount = a3;
}

- (unsigned)batchDroppedCount
{
  return self->_batchDroppedCount;
}

- (void)setBatchCount:(unsigned int)a3
{
  self->_batchCount = a3;
}

- (unsigned)batchCount
{
  return self->_batchCount;
}

- (void)setRequiredRuntimeConfirmation:(BOOL)a3
{
  self->_requiredRuntimeConfirmation = a3;
}

- (BOOL)requiredRuntimeConfirmation
{
  return self->_requiredRuntimeConfirmation;
}

- (void)setTriggerType:(id)a3
{
}

- (NSString)triggerType
{
  return self->_triggerType;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

@end