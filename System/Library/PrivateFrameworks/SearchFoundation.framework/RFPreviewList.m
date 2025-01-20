@interface RFPreviewList
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)previews;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFPreviewList)initWithCoder:(id)a3;
- (RFPreviewList)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPreviews:(id)a3;
@end

@implementation RFPreviewList

- (RFPreviewList)initWithProtobuf:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)RFPreviewList;
  v5 = [(RFPreviewList *)&v20 init];
  if (v5)
  {
    v6 = [v4 previews];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v8 = objc_msgSend(v4, "previews", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[RFPreview alloc] initWithProtobuf:*(void *)(*((void *)&v16 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v10);
    }

    [(RFPreviewList *)v5 setPreviews:v7];
    v14 = v5;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

- (void)setPreviews:(id)a3
{
}

- (NSArray)previews
{
  return self->_previews;
}

- (unint64_t)hash
{
  v2 = [(RFPreviewList *)self previews];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RFPreviewList *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else if ([(RFPreviewList *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    v6 = [(RFPreviewList *)self previews];
    id v7 = [(RFPreviewList *)v5 previews];
    if ((v6 == 0) == (v7 != 0))
    {
      char v11 = 0;
    }
    else
    {
      v8 = [(RFPreviewList *)self previews];
      if (v8)
      {
        uint64_t v9 = [(RFPreviewList *)self previews];
        uint64_t v10 = [(RFPreviewList *)v5 previews];
        char v11 = [v9 isEqual:v10];
      }
      else
      {
        char v11 = 1;
      }
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(RFPreviewList *)self previews];
  v6 = (void *)[v5 copy];
  [v4 setPreviews:v6];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFPreviewList alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFPreviewList *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFPreviewList alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRFPreviewList *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBRFPreviewList alloc] initWithFacade:self];
  v5 = [(_SFPBRFPreviewList *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (RFPreviewList)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBRFPreviewList alloc] initWithData:v5];
  id v7 = [(RFPreviewList *)self initWithProtobuf:v6];

  return v7;
}

@end