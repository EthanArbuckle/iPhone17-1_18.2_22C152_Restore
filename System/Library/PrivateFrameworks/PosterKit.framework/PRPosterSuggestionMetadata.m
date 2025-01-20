@interface PRPosterSuggestionMetadata
+ (BOOL)supportsSecureCoding;
+ (id)decodeObjectWithJSON:(id)a3;
- (ATXFaceGalleryItem)suggestedGalleryItem;
- (BOOL)isEqual:(id)a3;
- (Class)classForCoder;
- (NSDate)lastModifiedDate;
- (NSDictionary)suggestedComplicationsByIdentifier;
- (NSString)attributeType;
- (NSString)description;
- (PRPosterSuggestionMetadata)initWithCoder:(id)a3;
- (PRPosterSuggestionMetadata)initWithLastModifiedDate:(id)a3;
- (PRPosterSuggestionMetadata)initWithSuggestedGalleryItem:(id)a3 suggestedComplicationsByIdentifier:(id)a4 lastModifiedDate:(id)a5;
- (id)encodeJSON;
- (id)metadataBySettingLastModifiedDateToNow;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRPosterSuggestionMetadata

- (PRPosterSuggestionMetadata)initWithSuggestedGalleryItem:(id)a3 suggestedComplicationsByIdentifier:(id)a4 lastModifiedDate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = [(PRPosterSuggestionMetadata *)self initWithLastModifiedDate:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_suggestedGalleryItem, a3);
    uint64_t v13 = [v10 copy];
    suggestedComplicationsByIdentifier = v12->_suggestedComplicationsByIdentifier;
    v12->_suggestedComplicationsByIdentifier = (NSDictionary *)v13;
  }
  return v12;
}

- (PRPosterSuggestionMetadata)initWithLastModifiedDate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRPosterSuggestionMetadata;
  v5 = [(PRPosterSuggestionMetadata *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    lastModifiedDate = v5->_lastModifiedDate;
    v5->_lastModifiedDate = (NSDate *)v6;
  }
  return v5;
}

- (id)metadataBySettingLastModifiedDateToNow
{
  v3 = [PRPosterSuggestionMetadata alloc];
  id v4 = [(PRPosterSuggestionMetadata *)self suggestedGalleryItem];
  v5 = [(PRPosterSuggestionMetadata *)self suggestedComplicationsByIdentifier];
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  v7 = [(PRPosterSuggestionMetadata *)v3 initWithSuggestedGalleryItem:v4 suggestedComplicationsByIdentifier:v5 lastModifiedDate:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = (PRPosterSuggestionMetadata *)a3;
  if (self == v4)
  {
    BOOL v31 = 1;
  }
  else
  {
    v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v7 = v4;
      v8 = [(PRPosterSuggestionMetadata *)self suggestedGalleryItem];
      objc_super v9 = [(PRPosterSuggestionMetadata *)v7 suggestedGalleryItem];
      int v10 = ATXFaceGalleryItemEqualObjects(v8, v9);

      if (!v10) {
        goto LABEL_16;
      }
      v11 = (void *)MEMORY[0x1E4F1CAD0];
      v12 = [(PRPosterSuggestionMetadata *)self suggestedComplicationsByIdentifier];
      uint64_t v13 = [v12 allKeys];
      v14 = [v11 setWithArray:v13];
      v15 = (void *)MEMORY[0x1E4F1CAD0];
      v16 = [(PRPosterSuggestionMetadata *)v7 suggestedComplicationsByIdentifier];
      v17 = [v16 allKeys];
      v18 = [v15 setWithArray:v17];
      int v19 = BSEqualObjects();

      if (v19)
      {
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        v20 = [(PRPosterSuggestionMetadata *)self suggestedComplicationsByIdentifier];
        v21 = [v20 allKeys];

        uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v34;
          while (2)
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v34 != v24) {
                objc_enumerationMutation(v21);
              }
              uint64_t v26 = *(void *)(*((void *)&v33 + 1) + 8 * i);
              v27 = [(PRPosterSuggestionMetadata *)self suggestedComplicationsByIdentifier];
              v28 = [v27 objectForKey:v26];

              v29 = [(PRPosterSuggestionMetadata *)v7 suggestedComplicationsByIdentifier];
              v30 = [v29 objectForKey:v26];

              LODWORD(v29) = ATXComplicationEqualObjects((uint64_t)v28, v30);
              if (!v29)
              {
                BOOL v31 = 0;
                goto LABEL_18;
              }
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v33 objects:v37 count:16];
            if (v23) {
              continue;
            }
            break;
          }
        }
        BOOL v31 = 1;
LABEL_18:
      }
      else
      {
LABEL_16:
        BOOL v31 = 0;
      }
    }
    else
    {
      BOOL v31 = 0;
    }
  }

  return v31;
}

- (unint64_t)hash
{
  v3 = [(PRPosterSuggestionMetadata *)self suggestedGalleryItem];
  uint64_t v4 = [v3 hash];
  v5 = [(PRPosterSuggestionMetadata *)self suggestedComplicationsByIdentifier];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  objc_super v9 = __41__PRPosterSuggestionMetadata_description__block_invoke;
  int v10 = &unk_1E54DAA08;
  v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __41__PRPosterSuggestionMetadata_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PRPosterSuggestionMetadata *)self suggestedGalleryItem];
  [v4 encodeObject:v5 forKey:@"suggestedGalleryItem"];

  unint64_t v6 = [(PRPosterSuggestionMetadata *)self suggestedComplicationsByIdentifier];
  [v4 encodeObject:v6 forKey:@"suggestedComplicationsByIdentifier"];

  id v7 = [(PRPosterSuggestionMetadata *)self lastModifiedDate];
  [v4 encodeObject:v7 forKey:@"lastModifiedDate"];
}

- (PRPosterSuggestionMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastModifiedDate"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suggestedGalleryItem"];
  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  int v10 = objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
  v11 = [v4 decodeObjectOfClasses:v10 forKey:@"suggestedComplicationsByIdentifier"];

  id v12 = (void *)MEMORY[0x1E4F1CC08];
  if (v11) {
    id v12 = v11;
  }
  id v13 = v12;

  v14 = [(PRPosterSuggestionMetadata *)self initWithSuggestedGalleryItem:v6 suggestedComplicationsByIdentifier:v13 lastModifiedDate:v5];
  return v14;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v10 = a3;
  id v4 = [(PRPosterSuggestionMetadata *)self suggestedGalleryItem];
  id v5 = (id)[v10 appendObject:v4 withName:@"suggestedGalleryItem"];

  unint64_t v6 = [(PRPosterSuggestionMetadata *)self suggestedComplicationsByIdentifier];
  id v7 = (id)[v10 appendObject:v6 withName:@"suggestedComplicationsByIdentifier"];

  uint64_t v8 = [(PRPosterSuggestionMetadata *)self lastModifiedDate];
  id v9 = (id)[v10 appendObject:v8 withName:@"lastModifiedDate"];
}

- (ATXFaceGalleryItem)suggestedGalleryItem
{
  return self->_suggestedGalleryItem;
}

- (NSDictionary)suggestedComplicationsByIdentifier
{
  return self->_suggestedComplicationsByIdentifier;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_suggestedComplicationsByIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestedGalleryItem, 0);
}

- (NSString)attributeType
{
  return (NSString *)@"PRPosterRoleAttributeTypeSuggestionMetadata";
}

- (id)encodeJSON
{
  return sub_18C2ABF40(self, (uint64_t)a2, PRPosterSuggestionMetadata.encodeJSON());
}

+ (id)decodeObjectWithJSON:(id)a3
{
  return sub_18C2ACD48((uint64_t)a1, (uint64_t)a2, a3, (uint64_t (*)(uint64_t, unint64_t))static PRPosterSuggestionMetadata.decodeObject(withJSON:));
}

@end