@interface WFiTunesCollectionObject
+ (id)JSONKeyPathsByPropertyKey;
- (NSNumber)trackCount;
- (NSString)genre;
- (NSString)type;
@end

@implementation WFiTunesCollectionObject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackCount, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (NSNumber)trackCount
{
  return self->_trackCount;
}

- (NSString)genre
{
  return self->_genre;
}

- (NSString)type
{
  return self->_type;
}

+ (id)JSONKeyPathsByPropertyKey
{
  v8[9] = *MEMORY[0x1E4F143B8];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WFiTunesCollectionObject;
  v2 = objc_msgSendSuper2(&v6, sel_JSONKeyPathsByPropertyKey);
  v3 = (void *)[v2 mutableCopy];

  v7[0] = @"price";
  v7[1] = @"identifier";
  v8[0] = @"collectionPrice";
  v8[1] = @"collectionId";
  v7[2] = @"name";
  v7[3] = @"censoredName";
  v8[2] = @"collectionName";
  v8[3] = @"collectionCensoredName";
  v7[4] = @"kind";
  v7[5] = @"trackCount";
  v8[4] = @"kind";
  v8[5] = @"trackCount";
  v7[6] = @"genre";
  v7[7] = @"viewURL";
  v8[6] = @"primaryGenreName";
  v8[7] = @"collectionViewUrl";
  v7[8] = @"type";
  v8[8] = @"collectionType";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:9];
  [v3 addEntriesFromDictionary:v4];

  return v3;
}

@end