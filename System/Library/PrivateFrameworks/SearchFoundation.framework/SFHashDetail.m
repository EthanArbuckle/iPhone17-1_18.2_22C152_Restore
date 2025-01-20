@interface SFHashDetail
+ (BOOL)supportsSecureCoding;
- (BOOL)hasHas_summary;
- (BOOL)hasHas_table_of_contents;
- (BOOL)has_ee;
- (BOOL)has_summary;
- (BOOL)has_table_of_contents;
- (BOOL)isEqual:(id)a3;
- (NSArray)sba_entity_types;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)full_hash;
- (NSString)matched_url_variant;
- (SFHashDetail)initWithCoder:(id)a3;
- (SFHashDetail)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setFull_hash:(id)a3;
- (void)setHas_summary:(BOOL)a3;
- (void)setHas_table_of_contents:(BOOL)a3;
- (void)setMatched_url_variant:(id)a3;
- (void)setSba_entity_types:(id)a3;
@end

@implementation SFHashDetail

- (SFHashDetail)initWithProtobuf:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SFHashDetail;
  v5 = [(SFHashDetail *)&v23 init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "full_hash");

    if (v6)
    {
      v7 = objc_msgSend(v4, "full_hash");
      [(SFHashDetail *)v5 setFull_hash:v7];
    }
    if (objc_msgSend(v4, "has_summary")) {
      -[SFHashDetail setHas_summary:](v5, "setHas_summary:", objc_msgSend(v4, "has_summary"));
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
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
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
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v12);
    }

    [(SFHashDetail *)v5 setSba_entity_types:v9];
    if (objc_msgSend(v4, "has_table_of_contents")) {
      -[SFHashDetail setHas_table_of_contents:](v5, "setHas_table_of_contents:", objc_msgSend(v4, "has_table_of_contents"));
    }
    v15 = objc_msgSend(v4, "matched_url_variant");

    if (v15)
    {
      v16 = objc_msgSend(v4, "matched_url_variant");
      [(SFHashDetail *)v5 setMatched_url_variant:v16];
    }
    v17 = v5;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matched_url_variant, 0);
  objc_storeStrong((id *)&self->_sba_entity_types, 0);
  objc_storeStrong((id *)&self->_full_hash, 0);
}

- (void)setMatched_url_variant:(id)a3
{
}

- (NSString)matched_url_variant
{
  return self->_matched_url_variant;
}

- (BOOL)has_table_of_contents
{
  return self->_has_table_of_contents;
}

- (void)setSba_entity_types:(id)a3
{
}

- (NSArray)sba_entity_types
{
  return self->_sba_entity_types;
}

- (BOOL)has_summary
{
  return self->_has_summary;
}

- (void)setFull_hash:(id)a3
{
}

- (NSString)full_hash
{
  return self->_full_hash;
}

- (unint64_t)hash
{
  v3 = [(SFHashDetail *)self full_hash];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(SFHashDetail *)self has_summary];
  v6 = [(SFHashDetail *)self sba_entity_types];
  uint64_t v7 = v4 ^ [v6 hash] ^ v5;
  uint64_t v8 = [(SFHashDetail *)self has_table_of_contents];
  id v9 = [(SFHashDetail *)self matched_url_variant];
  unint64_t v10 = v7 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (SFHashDetail *)a3;
  if (self == v6)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFHashDetail *)v6 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v7 = v6;
      uint64_t v8 = [(SFHashDetail *)self full_hash];
      id v9 = [(SFHashDetail *)v7 full_hash];
      if ((v8 == 0) == (v9 != 0))
      {
        char v11 = 0;
LABEL_19:

        goto LABEL_20;
      }
      unint64_t v10 = [(SFHashDetail *)self full_hash];
      if (v10)
      {
        v3 = [(SFHashDetail *)self full_hash];
        uint64_t v4 = [(SFHashDetail *)v7 full_hash];
        if (![v3 isEqual:v4])
        {
          char v11 = 0;
          goto LABEL_17;
        }
      }
      BOOL v12 = [(SFHashDetail *)self has_summary];
      if (v12 == [(SFHashDetail *)v7 has_summary])
      {
        uint64_t v13 = [(SFHashDetail *)self sba_entity_types];
        v14 = [(SFHashDetail *)v7 sba_entity_types];
        if ((v13 == 0) != (v14 != 0))
        {
          v31 = v13;
          v32 = v14;
          v15 = [(SFHashDetail *)self sba_entity_types];
          if (v15)
          {
            v26 = v3;
            v16 = [(SFHashDetail *)self sba_entity_types];
            v29 = [(SFHashDetail *)v7 sba_entity_types];
            v30 = v16;
            if (!objc_msgSend(v16, "isEqual:"))
            {
              char v11 = 0;
              v3 = v26;
LABEL_30:

LABEL_31:
              if (!v10) {
                goto LABEL_18;
              }
              goto LABEL_17;
            }
            v28 = v15;
            v3 = v26;
          }
          else
          {
            v28 = 0;
          }
          BOOL v18 = [(SFHashDetail *)self has_table_of_contents];
          if (v18 == [(SFHashDetail *)v7 has_table_of_contents])
          {
            long long v19 = [(SFHashDetail *)self matched_url_variant];
            long long v20 = [(SFHashDetail *)v7 matched_url_variant];
            if ((v19 == 0) != (v20 != 0))
            {
              uint64_t v25 = v20;
              v27 = v19;
              uint64_t v21 = [(SFHashDetail *)self matched_url_variant];
              if (v21)
              {
                v24 = (void *)v21;
                long long v22 = [(SFHashDetail *)self matched_url_variant];
                objc_super v23 = [(SFHashDetail *)v7 matched_url_variant];
                char v11 = [v22 isEqual:v23];
              }
              else
              {

                char v11 = 1;
              }
LABEL_29:
              uint64_t v13 = v31;
              v15 = v28;
              if (!v28) {
                goto LABEL_31;
              }
              goto LABEL_30;
            }
          }
          char v11 = 0;
          goto LABEL_29;
        }
      }
      char v11 = 0;
      if (!v10)
      {
LABEL_18:

        goto LABEL_19;
      }
LABEL_17:

      goto LABEL_18;
    }
    char v11 = 0;
  }
LABEL_20:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(SFHashDetail *)self full_hash];
  v6 = (void *)[v5 copy];
  objc_msgSend(v4, "setFull_hash:", v6);

  objc_msgSend(v4, "setHas_summary:", -[SFHashDetail has_summary](self, "has_summary"));
  uint64_t v7 = [(SFHashDetail *)self sba_entity_types];
  uint64_t v8 = (void *)[v7 copy];
  objc_msgSend(v4, "setSba_entity_types:", v8);

  objc_msgSend(v4, "setHas_table_of_contents:", -[SFHashDetail has_table_of_contents](self, "has_table_of_contents"));
  id v9 = [(SFHashDetail *)self matched_url_variant];
  unint64_t v10 = (void *)[v9 copy];
  objc_msgSend(v4, "setMatched_url_variant:", v10);

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBHashBucketDetail_HashDetail alloc] initWithFacade:self];
  v3 = [(_SFPBHashBucketDetail_HashDetail *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBHashBucketDetail_HashDetail alloc] initWithFacade:self];
  v3 = [(_SFPBHashBucketDetail_HashDetail *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBHashBucketDetail_HashDetail alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBHashBucketDetail_HashDetail *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFHashDetail)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBHashBucketDetail_HashDetail alloc] initWithData:v5];
  uint64_t v7 = [(SFHashDetail *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasHas_table_of_contents
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHas_table_of_contents:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_has_table_of_contents = a3;
}

- (BOOL)hasHas_summary
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHas_summary:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_has_summary = a3;
}

- (BOOL)has_ee
{
  v2 = [(SFHashDetail *)self sba_entity_types];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

@end