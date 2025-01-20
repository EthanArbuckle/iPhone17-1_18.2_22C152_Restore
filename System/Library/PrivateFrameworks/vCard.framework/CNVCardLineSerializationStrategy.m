@interface CNVCardLineSerializationStrategy
+ (id)version21StrategyWithDataStorage:(id)a3 encodings:(id)a4;
+ (id)version21StrategyWithStringStorage:(id)a3 encodings:(id)a4;
+ (id)version30StrategyWithDataStorage:(id)a3;
+ (id)version30StrategyWithStringStorage:(id)a3;
@end

@implementation CNVCardLineSerializationStrategy

+ (id)version30StrategyWithStringStorage:(id)a3
{
  v3 = +[CNVCardSerializationStorage storageWithString:a3];
  v4 = +[CNVCardLineSerializationStrategyImpl serializerWithStorage:v3];

  return v4;
}

+ (id)version21StrategyWithStringStorage:(id)a3 encodings:(id)a4
{
  id v5 = a4;
  v6 = +[CNVCardSerializationStorage storageWithString:a3];
  if (![v5 count])
  {
    uint64_t v7 = +[CNVCardEncoding standardEncodings];

    id v5 = (id)v7;
  }
  v8 = +[CNVCardLine21SerializationStrategy serializerWithStorage:v6 encodings:v5];

  return v8;
}

+ (id)version30StrategyWithDataStorage:(id)a3
{
  v3 = +[CNVCardSerializationStorage storageWithData:a3];
  v4 = +[CNVCardLineSerializationStrategyImpl serializerWithStorage:v3];

  return v4;
}

+ (id)version21StrategyWithDataStorage:(id)a3 encodings:(id)a4
{
  id v5 = a4;
  v6 = +[CNVCardSerializationStorage storageWithData:a3];
  if (![v5 count])
  {
    uint64_t v7 = +[CNVCardEncoding standardEncodings];

    id v5 = (id)v7;
  }
  v8 = +[CNVCardLine21SerializationStrategy serializerWithStorage:v6 encodings:v5];

  return v8;
}

@end