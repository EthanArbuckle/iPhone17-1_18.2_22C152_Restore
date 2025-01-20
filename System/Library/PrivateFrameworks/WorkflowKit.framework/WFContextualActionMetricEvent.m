@interface WFContextualActionMetricEvent
+ (Class)codableEventClass;
+ (id)serializablePropertyTransformers;
- (BOOL)hasTrackpad;
- (NSString)key;
- (NSString)source;
- (unsigned)itemCount;
- (void)setHasTrackpad:(BOOL)a3;
- (void)setItemCount:(unsigned int)a3;
- (void)setKey:(id)a3;
- (void)setSource:(id)a3;
@end

@implementation WFContextualActionMetricEvent

+ (id)serializablePropertyTransformers
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"itemCount";
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
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setItemCount:(unsigned int)a3
{
  self->_itemCount = a3;
}

- (unsigned)itemCount
{
  return self->_itemCount;
}

- (void)setHasTrackpad:(BOOL)a3
{
  self->_hasTrackpad = a3;
}

- (BOOL)hasTrackpad
{
  return self->_hasTrackpad;
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