@interface TISticker
+ (BOOL)supportsSecureCoding;
- (NSArray)representations;
- (NSData)metadata;
- (NSDictionary)attributionInfo;
- (NSString)accessibilityLabel;
- (NSString)accessibilityName;
- (NSString)externalURI;
- (NSString)name;
- (NSString)searchText;
- (NSUUID)identifier;
- (TISticker)initWithCoder:(id)a3;
- (TISticker)initWithIdentifier:(id)a3 representations:(id)a4 effectType:(int64_t)a5 name:(id)a6 externalURI:(id)a7 accessibilityLabel:(id)a8 metadata:(id)a9 attributionInfo:(id)a10;
- (TISticker)initWithIdentifier:(id)a3 representations:(id)a4 effectType:(int64_t)a5 name:(id)a6 externalURI:(id)a7 accessibilityLabel:(id)a8 metadata:(id)a9 attributionInfo:(id)a10 searchText:(id)a11 accessibilityName:(id)a12;
- (int64_t)effectType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TISticker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionInfo, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_accessibilityName, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_externalURI, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_representations, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSDictionary)attributionInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (NSData)metadata
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)accessibilityName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)searchText
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)accessibilityLabel
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)externalURI
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (int64_t)effectType
{
  return self->_effectType;
}

- (NSArray)representations
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_representations forKey:@"representations"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeInteger:self->_effectType forKey:@"effectType"];
  [v5 encodeObject:self->_externalURI forKey:@"externalURI"];
  [v5 encodeObject:self->_accessibilityLabel forKey:@"accessibilityLabel"];
  [v5 encodeObject:self->_metadata forKey:@"metdata"];
  [v5 encodeObject:self->_attributionInfo forKey:@"attributionInfo"];
  [v5 encodeObject:self->_searchText forKey:@"searchText"];
  [v5 encodeObject:self->_accessibilityName forKey:@"accessibilityName"];
}

- (TISticker)initWithCoder:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)TISticker;
  id v5 = [(TISticker *)&v36 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    uint64_t v7 = [v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v7;

    v9 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"representations"];
    uint64_t v10 = [v9 copy];
    representations = v5->_representations;
    v5->_representations = (NSArray *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    uint64_t v13 = [v12 copy];
    name = v5->_name;
    v5->_name = (NSString *)v13;

    v5->_effectType = [v4 decodeIntegerForKey:@"effectType"];
    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalURI"];
    uint64_t v16 = [v15 copy];
    externalURI = v5->_externalURI;
    v5->_externalURI = (NSString *)v16;

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessibilityLabel"];
    uint64_t v19 = [v18 copy];
    accessibilityLabel = v5->_accessibilityLabel;
    v5->_accessibilityLabel = (NSString *)v19;

    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadata"];
    uint64_t v22 = [v21 copy];
    metadata = v5->_metadata;
    v5->_metadata = (NSData *)v22;

    v24 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    v25 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v26 = objc_opt_class();
    v27 = objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    v28 = [v4 decodeDictionaryWithKeysOfClasses:v24 objectsOfClasses:v27 forKey:@"attributionInfo"];
    uint64_t v29 = [v28 copy];
    attributionInfo = v5->_attributionInfo;
    v5->_attributionInfo = (NSDictionary *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessibilityName"];
    accessibilityName = v5->_accessibilityName;
    v5->_accessibilityName = (NSString *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"searchText"];
    searchText = v5->_searchText;
    v5->_searchText = (NSString *)v33;
  }
  return v5;
}

- (TISticker)initWithIdentifier:(id)a3 representations:(id)a4 effectType:(int64_t)a5 name:(id)a6 externalURI:(id)a7 accessibilityLabel:(id)a8 metadata:(id)a9 attributionInfo:(id)a10 searchText:(id)a11 accessibilityName:(id)a12
{
  id v30 = a3;
  id v29 = a4;
  id v28 = a6;
  id v27 = a7;
  id v26 = a8;
  id v25 = a9;
  id v24 = a10;
  id v23 = a11;
  id v18 = a12;
  v31.receiver = self;
  v31.super_class = (Class)TISticker;
  uint64_t v19 = [(TISticker *)&v31 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_identifier, a3);
    objc_storeStrong((id *)&v20->_representations, a4);
    v20->_effectType = a5;
    objc_storeStrong((id *)&v20->_name, a6);
    objc_storeStrong((id *)&v20->_externalURI, a7);
    objc_storeStrong((id *)&v20->_accessibilityLabel, a8);
    objc_storeStrong((id *)&v20->_metadata, a9);
    objc_storeStrong((id *)&v20->_attributionInfo, a10);
    objc_storeStrong((id *)&v20->_searchText, a11);
    objc_storeStrong((id *)&v20->_accessibilityName, a12);
  }

  return v20;
}

- (TISticker)initWithIdentifier:(id)a3 representations:(id)a4 effectType:(int64_t)a5 name:(id)a6 externalURI:(id)a7 accessibilityLabel:(id)a8 metadata:(id)a9 attributionInfo:(id)a10
{
  return [(TISticker *)self initWithIdentifier:a3 representations:a4 effectType:a5 name:a6 externalURI:a7 accessibilityLabel:a8 metadata:a9 attributionInfo:a10 searchText:0 accessibilityName:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end