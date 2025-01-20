@interface REMURLAttachment
+ (BOOL)supportsSecureCoding;
+ (id)cdEntityName;
- (BOOL)isEqual:(id)a3;
- (NSData)metadata;
- (NSURL)url;
- (REMURLAttachment)initWithCoder:(id)a3;
- (REMURLAttachment)initWithObjectID:(id)a3 accountID:(id)a4 reminderID:(id)a5 url:(id)a6 metadata:(id)a7;
- (id)_deepCopy;
- (id)debugDescription;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation REMURLAttachment

+ (id)cdEntityName
{
  return @"REMCDURLAttachment";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)REMURLAttachment;
  id v4 = a3;
  [(REMAttachment *)&v7 encodeWithCoder:v4];
  v5 = [(REMURLAttachment *)self url];
  [v4 encodeObject:v5 forKey:@"url"];

  v6 = [(REMURLAttachment *)self metadata];
  [v4 encodeObject:v6 forKey:@"metadata"];
}

- (REMURLAttachment)initWithObjectID:(id)a3 accountID:(id)a4 reminderID:(id)a5 url:(id)a6 metadata:(id)a7
{
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = *MEMORY[0x1E4F226F8];
  v19.receiver = self;
  v19.super_class = (Class)REMURLAttachment;
  v16 = [(REMAttachment *)&v19 initWithObjectID:a3 accountID:a4 reminderID:a5 UTI:v15];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_url, a6);
    objc_storeStrong((id *)&v17->_metadata, a7);
  }

  return v17;
}

- (REMURLAttachment)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REMURLAttachment;
  v5 = [(REMAttachment *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadata"];
    metadata = v5->_metadata;
    v5->_metadata = (NSData *)v8;
  }
  return v5;
}

- (id)_deepCopy
{
  v7.receiver = self;
  v7.super_class = (Class)REMURLAttachment;
  v3 = [(REMAttachment *)&v7 _deepCopy];
  id v4 = [(REMURLAttachment *)self url];
  [v3 setUrl:v4];

  v5 = [(REMURLAttachment *)self metadata];
  [v3 setMetadata:v5];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REMURLAttachment *)a3;
  v5 = v4;
  if (v4 != self)
  {
    uint64_t v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v7 = [(REMURLAttachment *)self url];
      uint64_t v8 = [(REMURLAttachment *)v6 url];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        v9 = (void *)v8;
        v10 = [(REMURLAttachment *)self url];
        objc_super v11 = [(REMURLAttachment *)v6 url];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_5;
        }
      }
      id v14 = [(REMURLAttachment *)self metadata];
      uint64_t v15 = [(REMURLAttachment *)v6 metadata];
      if (v14 == (void *)v15)
      {
        char v13 = 1;
        v16 = v14;
      }
      else
      {
        v16 = (void *)v15;
        v17 = [(REMURLAttachment *)self metadata];
        v18 = [(REMURLAttachment *)v6 metadata];
        char v13 = [v17 isEqual:v18];
      }
      goto LABEL_12;
    }
LABEL_5:
    char v13 = 0;
LABEL_12:

    goto LABEL_13;
  }
  char v13 = 1;
LABEL_13:

  return v13;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMAttachment *)self objectID];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p objectID: %@>", v4, self, v5];

  return v6;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMAttachment *)self objectID];
  uint64_t v6 = [(REMURLAttachment *)self url];
  objc_super v7 = [v3 stringWithFormat:@"<%@: %p objectID: %@, url: %@>", v4, self, v5, v6];

  return v7;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end