@interface _SFPBHashBucketDetail_HashDetail
- (BOOL)has_summary;
- (BOOL)has_table_of_contents;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)sba_entity_types;
- (NSData)jsonData;
- (NSString)full_hash;
- (NSString)matched_url_variant;
- (_SFPBHashBucketDetail_HashDetail)initWithDictionary:(id)a3;
- (_SFPBHashBucketDetail_HashDetail)initWithFacade:(id)a3;
- (_SFPBHashBucketDetail_HashDetail)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)sba_entity_typesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)sba_entity_typesCount;
- (void)addSba_entity_types:(int)a3;
- (void)clearSba_entity_types;
- (void)setFull_hash:(id)a3;
- (void)setHas_summary:(BOOL)a3;
- (void)setHas_table_of_contents:(BOOL)a3;
- (void)setMatched_url_variant:(id)a3;
- (void)setSba_entity_types:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBHashBucketDetail_HashDetail

- (_SFPBHashBucketDetail_HashDetail)initWithFacade:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBHashBucketDetail_HashDetail *)self init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "full_hash");

    if (v6)
    {
      v7 = objc_msgSend(v4, "full_hash");
      [(_SFPBHashBucketDetail_HashDetail *)v5 setFull_hash:v7];
    }
    if (objc_msgSend(v4, "hasHas_summary")) {
      -[_SFPBHashBucketDetail_HashDetail setHas_summary:](v5, "setHas_summary:", objc_msgSend(v4, "has_summary"));
    }
    v8 = objc_msgSend(v4, "sba_entity_types");
    if (v8) {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v9 = 0;
    }

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v10 = objc_msgSend(v4, "sba_entity_types", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          if (*(void *)(*((void *)&v19 + 1) + 8 * i)) {
            objc_msgSend(v9, "addObject:");
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }

    [(_SFPBHashBucketDetail_HashDetail *)v5 setSba_entity_types:v9];
    if (objc_msgSend(v4, "hasHas_table_of_contents")) {
      -[_SFPBHashBucketDetail_HashDetail setHas_table_of_contents:](v5, "setHas_table_of_contents:", objc_msgSend(v4, "has_table_of_contents"));
    }
    v15 = objc_msgSend(v4, "matched_url_variant");

    if (v15)
    {
      v16 = objc_msgSend(v4, "matched_url_variant");
      [(_SFPBHashBucketDetail_HashDetail *)v5 setMatched_url_variant:v16];
    }
    v17 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matched_url_variant, 0);
  objc_storeStrong((id *)&self->_sba_entity_types, 0);
  objc_storeStrong((id *)&self->_full_hash, 0);
}

- (NSString)matched_url_variant
{
  return self->_matched_url_variant;
}

- (BOOL)has_table_of_contents
{
  return self->_has_table_of_contents;
}

- (NSArray)sba_entity_types
{
  return self->_sba_entity_types;
}

- (BOOL)has_summary
{
  return self->_has_summary;
}

- (NSString)full_hash
{
  return self->_full_hash;
}

- (_SFPBHashBucketDetail_HashDetail)initWithDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_SFPBHashBucketDetail_HashDetail;
  v5 = [(_SFPBHashBucketDetail_HashDetail *)&v26 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"fullHash"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBHashBucketDetail_HashDetail *)v5 setFull_hash:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"hasSummary"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBHashBucketDetail_HashDetail setHas_summary:](v5, "setHas_summary:", [v8 BOOLValue]);
    }
    id v9 = [v4 objectForKeyedSubscript:@"sbaEntityTypes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v21 = v6;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v23;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v23 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v22 + 1) + 8 * v14);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[_SFPBHashBucketDetail_HashDetail addSba_entity_types:](v5, "addSba_entity_types:", [v15 intValue]);
            }
            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v12);
      }

      v6 = v21;
    }
    v16 = [v4 objectForKeyedSubscript:@"hasTableOfContents"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBHashBucketDetail_HashDetail setHas_table_of_contents:](v5, "setHas_table_of_contents:", [v16 BOOLValue]);
    }
    v17 = [v4 objectForKeyedSubscript:@"matchedUrlVariant"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = (void *)[v17 copy];
      [(_SFPBHashBucketDetail_HashDetail *)v5 setMatched_url_variant:v18];
    }
    long long v19 = v5;
  }
  return v5;
}

- (_SFPBHashBucketDetail_HashDetail)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBHashBucketDetail_HashDetail *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBHashBucketDetail_HashDetail *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_full_hash)
  {
    id v4 = [(_SFPBHashBucketDetail_HashDetail *)self full_hash];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"fullHash"];
  }
  if (self->_has_summary)
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBHashBucketDetail_HashDetail has_summary](self, "has_summary"));
    [v3 setObject:v6 forKeyedSubscript:@"hasSummary"];
  }
  if (self->_has_table_of_contents)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBHashBucketDetail_HashDetail has_table_of_contents](self, "has_table_of_contents"));
    [v3 setObject:v7 forKeyedSubscript:@"hasTableOfContents"];
  }
  if (self->_matched_url_variant)
  {
    v8 = [(_SFPBHashBucketDetail_HashDetail *)self matched_url_variant];
    id v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"matchedUrlVariant"];
  }
  if ([(NSArray *)self->_sba_entity_types count])
  {
    id v10 = [(_SFPBHashBucketDetail_HashDetail *)self sba_entity_types];
    uint64_t v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"sbaEntityTypes"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_full_hash hash];
  uint64_t v4 = 2654435761;
  if (self->_has_summary) {
    uint64_t v5 = 2654435761;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = [(NSArray *)self->_sba_entity_types hash];
  if (!self->_has_table_of_contents) {
    uint64_t v4 = 0;
  }
  return v5 ^ v3 ^ v6 ^ v4 ^ [(NSString *)self->_matched_url_variant hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  uint64_t v5 = [(_SFPBHashBucketDetail_HashDetail *)self full_hash];
  uint64_t v6 = objc_msgSend(v4, "full_hash");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_18;
  }
  uint64_t v7 = [(_SFPBHashBucketDetail_HashDetail *)self full_hash];
  if (v7)
  {
    v8 = (void *)v7;
    id v9 = [(_SFPBHashBucketDetail_HashDetail *)self full_hash];
    id v10 = objc_msgSend(v4, "full_hash");
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  int has_summary = self->_has_summary;
  if (has_summary != objc_msgSend(v4, "has_summary")) {
    goto LABEL_19;
  }
  uint64_t v5 = [(_SFPBHashBucketDetail_HashDetail *)self sba_entity_types];
  uint64_t v6 = objc_msgSend(v4, "sba_entity_types");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_18;
  }
  uint64_t v13 = [(_SFPBHashBucketDetail_HashDetail *)self sba_entity_types];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    v15 = [(_SFPBHashBucketDetail_HashDetail *)self sba_entity_types];
    v16 = objc_msgSend(v4, "sba_entity_types");
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  int has_table_of_contents = self->_has_table_of_contents;
  if (has_table_of_contents != objc_msgSend(v4, "has_table_of_contents")) {
    goto LABEL_19;
  }
  uint64_t v5 = [(_SFPBHashBucketDetail_HashDetail *)self matched_url_variant];
  uint64_t v6 = objc_msgSend(v4, "matched_url_variant");
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v19 = [(_SFPBHashBucketDetail_HashDetail *)self matched_url_variant];
  if (!v19)
  {

LABEL_22:
    BOOL v24 = 1;
    goto LABEL_20;
  }
  long long v20 = (void *)v19;
  long long v21 = [(_SFPBHashBucketDetail_HashDetail *)self matched_url_variant];
  long long v22 = objc_msgSend(v4, "matched_url_variant");
  char v23 = [v21 isEqual:v22];

  if (v23) {
    goto LABEL_22;
  }
LABEL_19:
  BOOL v24 = 0;
LABEL_20:

  return v24;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_SFPBHashBucketDetail_HashDetail *)self full_hash];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBHashBucketDetail_HashDetail *)self has_summary]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v6 = [(_SFPBHashBucketDetail_HashDetail *)self sba_entity_types];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v10) intValue];
        PBDataWriterWriteInt32Field();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  if ([(_SFPBHashBucketDetail_HashDetail *)self has_table_of_contents]) {
    PBDataWriterWriteBOOLField();
  }
  int v11 = [(_SFPBHashBucketDetail_HashDetail *)self matched_url_variant];
  if (v11) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBHashBucketDetail_HashDetailReadFrom(self, (uint64_t)a3);
}

- (void)setMatched_url_variant:(id)a3
{
  self->_matched_url_variant = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setHas_table_of_contents:(BOOL)a3
{
  self->_int has_table_of_contents = a3;
}

- (int)sba_entity_typesAtIndex:(unint64_t)a3
{
  NSUInteger v3 = [(NSArray *)self->_sba_entity_types objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)sba_entity_typesCount
{
  return [(NSArray *)self->_sba_entity_types count];
}

- (void)addSba_entity_types:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  sba_entity_types = self->_sba_entity_types;
  if (!sba_entity_types)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_sba_entity_types;
    self->_sba_entity_types = v6;

    sba_entity_types = self->_sba_entity_types;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)sba_entity_types addObject:v8];
}

- (void)clearSba_entity_types
{
}

- (void)setSba_entity_types:(id)a3
{
  self->_sba_entity_types = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setHas_summary:(BOOL)a3
{
  self->_int has_summary = a3;
}

- (void)setFull_hash:(id)a3
{
  self->_full_hash = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end