@interface WFAppSessionCompletedEvent
+ (Class)codableEventClass;
+ (id)serializablePropertyTransformers;
- (NSString)key;
- (NSString)source;
- (unsigned)duration;
- (void)setDuration:(unsigned int)a3;
- (void)setKey:(id)a3;
- (void)setSource:(id)a3;
@end

@implementation WFAppSessionCompletedEvent

+ (id)serializablePropertyTransformers
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"duration";
  v2 = objc_alloc_init(WFEventLogarithmicBinningValueTransformer);
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
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setDuration:(unsigned int)a3
{
  self->_duration = a3;
}

- (unsigned)duration
{
  return self->_duration;
}

- (void)setSource:(id)a3
{
}

- (NSString)source
{
  return self->_source;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

@end