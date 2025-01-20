@interface _UISticker
+ (BOOL)supportsSecureCoding;
- (BOOL)hasLiveEffect;
- (BOOL)isAnimated;
- (NSArray)representations;
- (NSData)metadata;
- (NSDictionary)attributionInfo;
- (NSString)accessibilityLabel;
- (NSString)accessibilityName;
- (NSString)externalURI;
- (NSString)identifier;
- (NSString)name;
- (NSString)sanitizedPrompt;
- (NSString)searchText;
- (_UISticker)init;
- (_UISticker)initWithCoder:(id)a3;
- (_UIStickerRepresentation)bakedInRep;
- (int64_t)effectType;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityName:(id)a3;
- (void)setAttributionInfo:(id)a3;
- (void)setBakedInRep:(id)a3;
- (void)setEffectType:(int64_t)a3;
- (void)setExternalURI:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setName:(id)a3;
- (void)setRepresentations:(id)a3;
- (void)setSanitizedPrompt:(id)a3;
- (void)setSearchText:(id)a3;
@end

@implementation _UISticker

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UISticker)init
{
  v12.receiver = self;
  v12.super_class = (Class)_UISticker;
  v2 = [(_UISticker *)&v12 init];
  v3 = v2;
  if (v2)
  {
    identifier = v2->_identifier;
    v2->_identifier = 0;

    representations = v3->_representations;
    v3->_representations = 0;

    name = v3->_name;
    v3->_effectType = -1;
    v3->_name = 0;

    externalURI = v3->_externalURI;
    v3->_externalURI = 0;

    accessibilityLabel = v3->_accessibilityLabel;
    v3->_accessibilityLabel = 0;

    metadata = v3->_metadata;
    v3->_metadata = 0;

    attributionInfo = v3->_attributionInfo;
    v3->_attributionInfo = 0;
  }
  return v3;
}

- (_UISticker)initWithCoder:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)_UISticker;
  v5 = [(_UISticker *)&v33 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"i"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"r"];
    representations = v5->_representations;
    v5->_representations = (NSArray *)v8;

    v5->_effectType = [v4 decodeIntegerForKey:@"et"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"n"];
    name = v5->_name;
    v5->_name = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eu"];
    externalURI = v5->_externalURI;
    v5->_externalURI = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"al"];
    accessibilityLabel = v5->_accessibilityLabel;
    v5->_accessibilityLabel = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"m"];
    metadata = v5->_metadata;
    v5->_metadata = (NSData *)v16;

    v18 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeDictionaryWithKeysOfClasses:v18 objectsOfClasses:v21 forKey:@"ai"];
    attributionInfo = v5->_attributionInfo;
    v5->_attributionInfo = (NSDictionary *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"b"];
    bakedInRep = v5->_bakedInRep;
    v5->_bakedInRep = (_UIStickerRepresentation *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"st"];
    searchText = v5->_searchText;
    v5->_searchText = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sp"];
    sanitizedPrompt = v5->_sanitizedPrompt;
    v5->_sanitizedPrompt = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"an"];
    accessibilityName = v5->_accessibilityName;
    v5->_accessibilityName = (NSString *)v30;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_UISticker *)self identifier];
  [v4 encodeObject:v5 forKey:@"i"];

  uint64_t v6 = [(_UISticker *)self representations];
  [v4 encodeObject:v6 forKey:@"r"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[_UISticker effectType](self, "effectType"), @"et");
  v7 = [(_UISticker *)self name];
  [v4 encodeObject:v7 forKey:@"n"];

  uint64_t v8 = [(_UISticker *)self externalURI];
  [v4 encodeObject:v8 forKey:@"eu"];

  v9 = [(_UISticker *)self accessibilityLabel];
  [v4 encodeObject:v9 forKey:@"al"];

  uint64_t v10 = [(_UISticker *)self metadata];
  [v4 encodeObject:v10 forKey:@"m"];

  v11 = [(_UISticker *)self attributionInfo];
  [v4 encodeObject:v11 forKey:@"ai"];

  uint64_t v12 = [(_UISticker *)self bakedInRep];
  [v4 encodeObject:v12 forKey:@"b"];

  v13 = [(_UISticker *)self searchText];
  [v4 encodeObject:v13 forKey:@"st"];

  uint64_t v14 = [(_UISticker *)self sanitizedPrompt];
  [v4 encodeObject:v14 forKey:@"sp"];

  id v15 = [(_UISticker *)self accessibilityName];
  [v4 encodeObject:v15 forKey:@"an"];
}

- (BOOL)isAnimated
{
  v3 = [(_UISticker *)self representations];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 0;
  }
  v5 = [(_UISticker *)self representations];
  uint64_t v6 = [v5 firstObject];
  v7 = [v6 role];
  char v8 = [v7 isEqualToString:@"com.apple.stickers.role.animated"];

  return v8;
}

- (BOOL)hasLiveEffect
{
  return (unint64_t)([(_UISticker *)self effectType] - 3) < 2;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSArray)representations
{
  return self->_representations;
}

- (void)setRepresentations:(id)a3
{
}

- (_UIStickerRepresentation)bakedInRep
{
  return self->_bakedInRep;
}

- (void)setBakedInRep:(id)a3
{
}

- (int64_t)effectType
{
  return self->_effectType;
}

- (void)setEffectType:(int64_t)a3
{
  self->_effectType = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)externalURI
{
  return self->_externalURI;
}

- (void)setExternalURI:(id)a3
{
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)setSearchText:(id)a3
{
}

- (NSString)sanitizedPrompt
{
  return self->_sanitizedPrompt;
}

- (void)setSanitizedPrompt:(id)a3
{
}

- (NSString)accessibilityName
{
  return self->_accessibilityName;
}

- (void)setAccessibilityName:(id)a3
{
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (void)setAccessibilityLabel:(id)a3
{
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSDictionary)attributionInfo
{
  return self->_attributionInfo;
}

- (void)setAttributionInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionInfo, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_accessibilityName, 0);
  objc_storeStrong((id *)&self->_sanitizedPrompt, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_externalURI, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bakedInRep, 0);
  objc_storeStrong((id *)&self->_representations, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end