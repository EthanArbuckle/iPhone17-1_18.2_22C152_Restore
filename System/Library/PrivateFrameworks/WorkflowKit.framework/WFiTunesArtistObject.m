@interface WFiTunesArtistObject
+ (id)JSONKeyPathsByPropertyKey;
- (NSString)genre;
- (NSString)type;
@end

@implementation WFiTunesArtistObject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_type, 0);
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
  v8[7] = *MEMORY[0x1E4F143B8];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WFiTunesArtistObject;
  v2 = objc_msgSendSuper2(&v6, sel_JSONKeyPathsByPropertyKey);
  v3 = (void *)[v2 mutableCopy];

  v7[0] = @"identifier";
  v7[1] = @"name";
  v8[0] = @"artistId";
  v8[1] = @"artistName";
  v7[2] = @"censoredName";
  v7[3] = @"kind";
  v8[2] = @"artistCensoredName";
  v8[3] = @"kind";
  v7[4] = @"viewURL";
  v7[5] = @"type";
  v8[4] = @"artistLinkUrl";
  v8[5] = @"artistType";
  v7[6] = @"genre";
  v8[6] = @"primaryGenreName";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:7];
  [v3 addEntriesFromDictionary:v4];

  return v3;
}

@end