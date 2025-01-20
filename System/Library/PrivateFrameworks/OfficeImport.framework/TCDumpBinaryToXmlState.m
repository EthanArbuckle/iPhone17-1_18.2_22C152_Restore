@interface TCDumpBinaryToXmlState
- (TCDumpBinaryToXmlState)init;
- (id)valueForCurrentField;
- (id)valueForField:(id)a3;
- (void)cacheValueforCurrentField:(id)a3;
- (void)setCurrentField:(id)a3;
@end

@implementation TCDumpBinaryToXmlState

- (TCDumpBinaryToXmlState)init
{
  v6.receiver = self;
  v6.super_class = (Class)TCDumpBinaryToXmlState;
  v2 = [(TCDumpBinaryToXmlState *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mFieldNameToValueMap = v2->mFieldNameToValueMap;
    v2->mFieldNameToValueMap = v3;
  }
  return v2;
}

- (void)setCurrentField:(id)a3
{
}

- (void)cacheValueforCurrentField:(id)a3
{
}

- (id)valueForCurrentField
{
  return (id)[(NSMutableDictionary *)self->mFieldNameToValueMap objectForKey:self->mCurrentFieldName];
}

- (id)valueForField:(id)a3
{
  v3 = [(NSMutableDictionary *)self->mFieldNameToValueMap objectForKey:a3];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFieldNameToValueMap, 0);
  objc_storeStrong((id *)&self->mCurrentFieldName, 0);
}

@end