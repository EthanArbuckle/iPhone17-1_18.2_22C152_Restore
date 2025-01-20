@interface CNVCardLineSerializationStrategyImpl
+ (id)serializerWithStorage:(id)a3;
- (BOOL)canSerializeArray:(id)a3;
- (BOOL)canSerializeData:(id)a3;
- (BOOL)canSerializeString:(id)a3;
- (CNVCardLineSerializationStrategyImpl)initWithStorage:(id)a3;
- (id)insertionMarker;
- (unint64_t)estimatedDataLength;
- (void)insertLine:(id)a3 atMarker:(id)a4;
- (void)serializeLine:(id)a3;
- (void)serializeName:(id)a3;
- (void)serializeOpaqueValue:(id)a3;
@end

@implementation CNVCardLineSerializationStrategyImpl

+ (id)serializerWithStorage:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithStorage:v4];

  return v5;
}

- (CNVCardLineSerializationStrategyImpl)initWithStorage:(id)a3
{
  id v5 = a3;
  v6 = [(CNVCardLineSerializationStrategyImpl *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storage, a3);
    v8 = v7;
  }

  return v7;
}

- (void)serializeLine:(id)a3
{
  id v9 = a3;
  if ([v9 canSerializeWithStrategy:self])
  {
    [(CNVCardLineSerializationStrategyImpl *)self willSerializeValue];
    id v4 = [v9 groupingName];
    [(CNVCardLineSerializationStrategyImpl *)self serializeGroupingName:v4];

    id v5 = [v9 name];
    [(CNVCardLineSerializationStrategyImpl *)self serializeName:v5];

    v6 = [v9 parameters];
    [(CNVCardLineSerializationStrategyImpl *)self serializeParameters:v6];

    [v9 serializeValueWithStrategy:self];
    [(CNVCardSerializationStorage *)self->_storage appendString:CNVCardLineDelimiter];
    v7 = [v9 groupedLines];
    v8 = [v9 groupingName];
    [(CNVCardLineSerializationStrategyImpl *)self serializeGroupedLines:v7 withGroupingName:v8];
  }
}

- (void)serializeName:(id)a3
{
}

- (BOOL)canSerializeString:(id)a3
{
  return [a3 length] != 0;
}

- (BOOL)canSerializeArray:(id)a3
{
  return [a3 count] != 0;
}

- (BOOL)canSerializeData:(id)a3
{
  return [a3 length] != 0;
}

- (void)serializeOpaqueValue:(id)a3
{
  id v4 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A268] + 16))() & 1) == 0)
  {
    [(CNVCardSerializationStorage *)self->_storage appendData:v4];
    [(CNVCardSerializationStorage *)self->_storage appendString:CNVCardLineDelimiter];
  }
}

- (id)insertionMarker
{
  return (id)[(CNVCardSerializationStorage *)self->_storage insertionMarker];
}

- (unint64_t)estimatedDataLength
{
  return [(CNVCardSerializationStorage *)self->_storage estimatedDataLength];
}

- (void)insertLine:(id)a3 atMarker:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F28E78];
  id v7 = a4;
  id v8 = a3;
  id v11 = [v6 string];
  id v9 = +[CNVCardSerializationStorage storageWithString:v11];
  v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithStorage:v9];
  [v8 serializeWithStrategy:v10];

  [(CNVCardSerializationStorage *)self->_storage insertString:v11 atMarker:v7];
}

- (void).cxx_destruct
{
}

@end