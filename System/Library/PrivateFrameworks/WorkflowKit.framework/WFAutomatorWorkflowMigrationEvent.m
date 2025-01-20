@interface WFAutomatorWorkflowMigrationEvent
+ (Class)codableEventClass;
+ (id)serializablePropertyTransformers;
- (BOOL)completed;
- (NSString)key;
- (unsigned)automatorActionCount;
- (void)setAutomatorActionCount:(unsigned int)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setKey:(id)a3;
@end

@implementation WFAutomatorWorkflowMigrationEvent

+ (id)serializablePropertyTransformers
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"automatorActionCount";
  v2 = objc_alloc_init(WFEventSignificantFigureValueTransformer);
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setAutomatorActionCount:(unsigned int)a3
{
  self->_automatorActionCount = a3;
}

- (unsigned)automatorActionCount
{
  return self->_automatorActionCount;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

@end