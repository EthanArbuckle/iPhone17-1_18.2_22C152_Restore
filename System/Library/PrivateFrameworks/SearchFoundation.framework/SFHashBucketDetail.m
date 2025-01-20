@interface SFHashBucketDetail
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)hash_details;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)hash_prefix;
- (SFHashBucketDetail)initWithCoder:(id)a3;
- (SFHashBucketDetail)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHash_details:(id)a3;
- (void)setHash_prefix:(id)a3;
@end

@implementation SFHashBucketDetail

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hash_details, 0);
  objc_storeStrong((id *)&self->_hash_prefix, 0);
}

- (void)setHash_details:(id)a3
{
}

- (NSArray)hash_details
{
  return self->_hash_details;
}

- (void)setHash_prefix:(id)a3
{
}

- (NSString)hash_prefix
{
  return self->_hash_prefix;
}

- (unint64_t)hash
{
  v3 = [(SFHashBucketDetail *)self hash_prefix];
  uint64_t v4 = [v3 hash];
  v5 = [(SFHashBucketDetail *)self hash_details];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (SFHashBucketDetail *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFHashBucketDetail *)v5 isMemberOfClass:objc_opt_class()])
    {
      unint64_t v6 = v5;
      v7 = [(SFHashBucketDetail *)self hash_prefix];
      v8 = [(SFHashBucketDetail *)v6 hash_prefix];
      if ((v7 == 0) == (v8 != 0))
      {
        char v11 = 0;
LABEL_19:

        goto LABEL_20;
      }
      v9 = [(SFHashBucketDetail *)self hash_prefix];
      if (v9)
      {
        v3 = [(SFHashBucketDetail *)self hash_prefix];
        v10 = [(SFHashBucketDetail *)v6 hash_prefix];
        if (![v3 isEqual:v10])
        {
          char v11 = 0;
LABEL_17:

LABEL_18:
          goto LABEL_19;
        }
        v21 = v10;
      }
      v12 = [(SFHashBucketDetail *)self hash_details];
      v13 = [(SFHashBucketDetail *)v6 hash_details];
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        char v11 = 0;
      }
      else
      {
        uint64_t v15 = [(SFHashBucketDetail *)self hash_details];
        if (v15)
        {
          v16 = (void *)v15;
          v19 = [(SFHashBucketDetail *)self hash_details];
          [(SFHashBucketDetail *)v6 hash_details];
          v17 = v20 = v3;
          char v11 = [v19 isEqual:v17];

          v3 = v20;
        }
        else
        {

          char v11 = 1;
        }
      }
      v10 = v21;
      if (!v9) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    char v11 = 0;
  }
LABEL_20:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(SFHashBucketDetail *)self hash_prefix];
  unint64_t v6 = (void *)[v5 copy];
  objc_msgSend(v4, "setHash_prefix:", v6);

  v7 = [(SFHashBucketDetail *)self hash_details];
  v8 = (void *)[v7 copy];
  objc_msgSend(v4, "setHash_details:", v8);

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBHashBucketDetail alloc] initWithFacade:self];
  v3 = [(_SFPBHashBucketDetail *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBHashBucketDetail alloc] initWithFacade:self];
  v3 = [(_SFPBHashBucketDetail *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v6 = [[_SFPBHashBucketDetail alloc] initWithFacade:self];
  v5 = [(_SFPBHashBucketDetail *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFHashBucketDetail)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  unint64_t v6 = [[_SFPBHashBucketDetail alloc] initWithData:v5];
  v7 = [(SFHashBucketDetail *)self initWithProtobuf:v6];

  return v7;
}

- (SFHashBucketDetail)initWithProtobuf:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SFHashBucketDetail;
  v5 = [(SFHashBucketDetail *)&v22 init];
  if (v5)
  {
    unint64_t v6 = objc_msgSend(v4, "hash_prefix");

    if (v6)
    {
      v7 = objc_msgSend(v4, "hash_prefix");
      [(SFHashBucketDetail *)v5 setHash_prefix:v7];
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
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
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
          uint64_t v15 = [[SFHashDetail alloc] initWithProtobuf:*(void *)(*((void *)&v18 + 1) + 8 * i)];
          if (v15) {
            [v9 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v12);
    }

    [(SFHashBucketDetail *)v5 setHash_details:v9];
    v16 = v5;
  }
  return v5;
}

@end