@interface _SFPBHashBucketDetail
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)hash_details;
- (NSData)jsonData;
- (NSString)hash_prefix;
- (_SFPBHashBucketDetail)initWithDictionary:(id)a3;
- (_SFPBHashBucketDetail)initWithFacade:(id)a3;
- (_SFPBHashBucketDetail)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)hash_detailsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)hash_detailsCount;
- (void)addHash_details:(id)a3;
- (void)clearHash_details;
- (void)setHash_details:(id)a3;
- (void)setHash_prefix:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBHashBucketDetail

- (_SFPBHashBucketDetail)initWithFacade:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBHashBucketDetail *)self init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "hash_prefix");

    if (v6)
    {
      v7 = objc_msgSend(v4, "hash_prefix");
      [(_SFPBHashBucketDetail *)v5 setHash_prefix:v7];
    }
    v8 = objc_msgSend(v4, "hash_details");
    if (v8) {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v9 = 0;
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v10 = objc_msgSend(v4, "hash_details", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [[_SFPBHashBucketDetail_HashDetail alloc] initWithFacade:*(void *)(*((void *)&v18 + 1) + 8 * i)];
          if (v15) {
            [v9 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    [(_SFPBHashBucketDetail *)v5 setHash_details:v9];
    v16 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hash_details, 0);
  objc_storeStrong((id *)&self->_hash_prefix, 0);
}

- (NSArray)hash_details
{
  return self->_hash_details;
}

- (NSString)hash_prefix
{
  return self->_hash_prefix;
}

- (_SFPBHashBucketDetail)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_SFPBHashBucketDetail;
  v5 = [(_SFPBHashBucketDetail *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"hashPrefix"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBHashBucketDetail *)v5 setHash_prefix:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"hashDetails"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v18 = v6;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v20;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [[_SFPBHashBucketDetail_HashDetail alloc] initWithDictionary:v14];
              [(_SFPBHashBucketDetail *)v5 addHash_details:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v11);
      }

      v6 = v18;
    }
    v16 = v5;
  }
  return v5;
}

- (_SFPBHashBucketDetail)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBHashBucketDetail *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBHashBucketDetail *)self dictionaryRepresentation];
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
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_hash_details count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v5 = self->_hash_details;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"hashDetails"];
  }
  if (self->_hash_prefix)
  {
    uint64_t v12 = [(_SFPBHashBucketDetail *)self hash_prefix];
    uint64_t v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"hashPrefix"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_hash_prefix hash];
  return [(NSArray *)self->_hash_details hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_SFPBHashBucketDetail *)self hash_prefix];
  uint64_t v6 = objc_msgSend(v4, "hash_prefix");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_SFPBHashBucketDetail *)self hash_prefix];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = [(_SFPBHashBucketDetail *)self hash_prefix];
    uint64_t v10 = objc_msgSend(v4, "hash_prefix");
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_SFPBHashBucketDetail *)self hash_details];
  uint64_t v6 = objc_msgSend(v4, "hash_details");
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_SFPBHashBucketDetail *)self hash_details];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_SFPBHashBucketDetail *)self hash_details];
    long long v15 = objc_msgSend(v4, "hash_details");
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBHashBucketDetail *)self hash_prefix];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  uint64_t v6 = [(_SFPBHashBucketDetail *)self hash_details];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBHashBucketDetailReadFrom(self, (uint64_t)a3);
}

- (id)hash_detailsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_hash_details objectAtIndexedSubscript:a3];
}

- (unint64_t)hash_detailsCount
{
  return [(NSArray *)self->_hash_details count];
}

- (void)addHash_details:(id)a3
{
  id v4 = a3;
  hash_details = self->_hash_details;
  id v8 = v4;
  if (!hash_details)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_hash_details;
    self->_hash_details = v6;

    id v4 = v8;
    hash_details = self->_hash_details;
  }
  [(NSArray *)hash_details addObject:v4];
}

- (void)clearHash_details
{
}

- (void)setHash_details:(id)a3
{
  self->_hash_details = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setHash_prefix:(id)a3
{
  self->_hash_prefix = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end