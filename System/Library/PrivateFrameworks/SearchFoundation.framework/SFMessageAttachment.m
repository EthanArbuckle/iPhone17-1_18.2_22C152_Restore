@interface SFMessageAttachment
+ (BOOL)supportsSecureCoding;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSData)linkMetadata;
- (NSDictionary)dictionaryRepresentation;
- (NSURL)url;
- (SFMessageAttachment)initWithCoder:(id)a3;
- (SFMessageAttachment)initWithProtobuf:(id)a3;
- (SFPhotosLibraryImage)photosLibraryImage;
- (id)copyWithZone:(_NSZone *)a3;
- (int)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLinkMetadata:(id)a3;
- (void)setPhotosLibraryImage:(id)a3;
- (void)setType:(int)a3;
- (void)setUrl:(id)a3;
@end

@implementation SFMessageAttachment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosLibraryImage, 0);
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)setPhotosLibraryImage:(id)a3
{
}

- (SFPhotosLibraryImage)photosLibraryImage
{
  return self->_photosLibraryImage;
}

- (void)setLinkMetadata:(id)a3
{
}

- (NSData)linkMetadata
{
  return self->_linkMetadata;
}

- (void)setUrl:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (int)type
{
  return self->_type;
}

- (unint64_t)hash
{
  uint64_t v3 = [(SFMessageAttachment *)self type];
  v4 = [(SFMessageAttachment *)self url];
  uint64_t v5 = [v4 hash] ^ v3;
  v6 = [(SFMessageAttachment *)self linkMetadata];
  uint64_t v7 = [v6 hash];
  v8 = [(SFMessageAttachment *)self photosLibraryImage];
  unint64_t v9 = v5 ^ v7 ^ [v8 hash];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFMessageAttachment *)a3;
  if (self == v5)
  {
    char v12 = 1;
  }
  else
  {
    if ([(SFMessageAttachment *)v5 isMemberOfClass:objc_opt_class()])
    {
      v6 = v5;
      int v7 = [(SFMessageAttachment *)self type];
      if (v7 != [(SFMessageAttachment *)v6 type])
      {
        char v12 = 0;
LABEL_33:

        goto LABEL_34;
      }
      v8 = [(SFMessageAttachment *)self url];
      unint64_t v9 = [(SFMessageAttachment *)v6 url];
      if ((v8 == 0) == (v9 != 0))
      {
        char v12 = 0;
LABEL_32:

        goto LABEL_33;
      }
      v10 = [(SFMessageAttachment *)self url];
      if (v10)
      {
        uint64_t v3 = [(SFMessageAttachment *)self url];
        v11 = [(SFMessageAttachment *)v6 url];
        if (![v3 isEqual:v11])
        {
          char v12 = 0;
          goto LABEL_30;
        }
        v32 = v11;
      }
      v13 = [(SFMessageAttachment *)self linkMetadata];
      v14 = [(SFMessageAttachment *)v6 linkMetadata];
      v15 = v14;
      if ((v13 == 0) == (v14 != 0))
      {

        char v12 = 0;
        goto LABEL_29;
      }
      v16 = [(SFMessageAttachment *)self linkMetadata];
      if (v16)
      {
        v26 = v13;
        v17 = [(SFMessageAttachment *)self linkMetadata];
        v28 = [(SFMessageAttachment *)v6 linkMetadata];
        v29 = v17;
        if (!objc_msgSend(v17, "isEqual:"))
        {
          char v12 = 0;
          v13 = v26;
          goto LABEL_27;
        }
        v30 = v16;
        v31 = v3;
        v13 = v26;
      }
      else
      {
        v30 = 0;
        v31 = v3;
      }
      v18 = [(SFMessageAttachment *)self photosLibraryImage];
      v19 = [(SFMessageAttachment *)v6 photosLibraryImage];
      if ((v18 == 0) == (v19 != 0))
      {

        char v12 = 0;
        v16 = v30;
        uint64_t v3 = v31;
        if (!v30) {
          goto LABEL_28;
        }
      }
      else
      {
        v25 = v18;
        v27 = v19;
        uint64_t v20 = [(SFMessageAttachment *)self photosLibraryImage];
        v16 = v30;
        if (v20)
        {
          v24 = (void *)v20;
          v23 = [(SFMessageAttachment *)self photosLibraryImage];
          v21 = [(SFMessageAttachment *)v6 photosLibraryImage];
          char v12 = objc_msgSend(v23, "isEqual:");
        }
        else
        {

          char v12 = 1;
        }
        uint64_t v3 = v31;
        if (!v30) {
          goto LABEL_28;
        }
      }
LABEL_27:

LABEL_28:
LABEL_29:
      v11 = v32;
      if (!v10)
      {
LABEL_31:

        goto LABEL_32;
      }
LABEL_30:

      goto LABEL_31;
    }
    char v12 = 0;
  }
LABEL_34:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setType:", -[SFMessageAttachment type](self, "type"));
  uint64_t v5 = [(SFMessageAttachment *)self url];
  v6 = (void *)[v5 copy];
  [v4 setUrl:v6];

  int v7 = [(SFMessageAttachment *)self linkMetadata];
  v8 = (void *)[v7 copy];
  [v4 setLinkMetadata:v8];

  unint64_t v9 = [(SFMessageAttachment *)self photosLibraryImage];
  v10 = (void *)[v9 copy];
  [v4 setPhotosLibraryImage:v10];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBMessageAttachment alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBMessageAttachment *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBMessageAttachment alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBMessageAttachment *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBMessageAttachment alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBMessageAttachment *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFMessageAttachment)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBMessageAttachment alloc] initWithData:v5];
  int v7 = [(SFMessageAttachment *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_type = a3;
}

- (SFMessageAttachment)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SFMessageAttachment;
  uint64_t v5 = [(SFMessageAttachment *)&v17 init];
  if (v5)
  {
    if ([v4 type]) {
      -[SFMessageAttachment setType:](v5, "setType:", [v4 type]);
    }
    v6 = [v4 url];

    if (v6)
    {
      int v7 = [v4 url];
      v8 = _SFPBURLHandwrittenTranslator(v7);
      [(SFMessageAttachment *)v5 setUrl:v8];
    }
    unint64_t v9 = [v4 linkMetadata];

    if (v9)
    {
      v10 = [v4 linkMetadata];
      [(SFMessageAttachment *)v5 setLinkMetadata:v10];
    }
    v11 = [v4 photosLibraryImage];

    if (v11)
    {
      char v12 = [SFPhotosLibraryImage alloc];
      v13 = [v4 photosLibraryImage];
      v14 = [(SFPhotosLibraryImage *)v12 initWithProtobuf:v13];
      [(SFMessageAttachment *)v5 setPhotosLibraryImage:v14];
    }
    v15 = v5;
  }

  return v5;
}

@end