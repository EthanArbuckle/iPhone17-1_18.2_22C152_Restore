@interface CNVCardSerializationStorage
+ (CNVCardSerializationStorage)storageWithData:(id)a3;
+ (CNVCardSerializationStorage)storageWithString:(id)a3;
@end

@implementation CNVCardSerializationStorage

+ (CNVCardSerializationStorage)storageWithString:(id)a3
{
  return (CNVCardSerializationStorage *)+[CNVCardStringStorage storageWithString:a3];
}

+ (CNVCardSerializationStorage)storageWithData:(id)a3
{
  return (CNVCardSerializationStorage *)+[CNVCardDataStorage storageWithData:a3];
}

@end