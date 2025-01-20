@interface SFQuickLookThumbnailImage
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)coreSpotlightIdentifier;
- (NSString)fileProviderIdentifier;
- (NSURL)filePath;
- (SFQuickLookThumbnailImage)initWithCoder:(id)a3;
- (SFQuickLookThumbnailImage)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCoreSpotlightIdentifier:(id)a3;
- (void)setFilePath:(id)a3;
- (void)setFileProviderIdentifier:(id)a3;
@end

@implementation SFQuickLookThumbnailImage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_coreSpotlightIdentifier, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
}

- (void)setFileProviderIdentifier:(id)a3
{
}

- (NSString)fileProviderIdentifier
{
  return self->_fileProviderIdentifier;
}

- (void)setCoreSpotlightIdentifier:(id)a3
{
}

- (NSString)coreSpotlightIdentifier
{
  return self->_coreSpotlightIdentifier;
}

- (void)setFilePath:(id)a3
{
}

- (NSURL)filePath
{
  return self->_filePath;
}

- (unint64_t)hash
{
  v11.receiver = self;
  v11.super_class = (Class)SFQuickLookThumbnailImage;
  unint64_t v3 = [(SFImage *)&v11 hash];
  v4 = [(SFQuickLookThumbnailImage *)self filePath];
  uint64_t v5 = [v4 hash];
  v6 = [(SFQuickLookThumbnailImage *)self coreSpotlightIdentifier];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(SFQuickLookThumbnailImage *)self fileProviderIdentifier];
  unint64_t v9 = v7 ^ [v8 hash] ^ v3;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFQuickLookThumbnailImage *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFQuickLookThumbnailImage *)v5 isMemberOfClass:objc_opt_class()])
    {
      v32.receiver = self;
      v32.super_class = (Class)SFQuickLookThumbnailImage;
      if ([(SFImage *)&v32 isEqual:v5])
      {
        v6 = v5;
        uint64_t v7 = [(SFQuickLookThumbnailImage *)self filePath];
        v8 = [(SFQuickLookThumbnailImage *)v6 filePath];
        if ((v7 == 0) == (v8 != 0))
        {
          char v11 = 0;
LABEL_31:

          goto LABEL_32;
        }
        unint64_t v9 = [(SFQuickLookThumbnailImage *)self filePath];
        if (v9)
        {
          unint64_t v3 = [(SFQuickLookThumbnailImage *)self filePath];
          v10 = [(SFQuickLookThumbnailImage *)v6 filePath];
          if (![v3 isEqual:v10])
          {
            char v11 = 0;
            goto LABEL_29;
          }
          v31 = v10;
        }
        v12 = [(SFQuickLookThumbnailImage *)self coreSpotlightIdentifier];
        v13 = [(SFQuickLookThumbnailImage *)v6 coreSpotlightIdentifier];
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          char v11 = 0;
          goto LABEL_28;
        }
        v15 = [(SFQuickLookThumbnailImage *)self coreSpotlightIdentifier];
        if (v15)
        {
          v25 = v12;
          v16 = [(SFQuickLookThumbnailImage *)self coreSpotlightIdentifier];
          v27 = [(SFQuickLookThumbnailImage *)v6 coreSpotlightIdentifier];
          v28 = v16;
          if (!objc_msgSend(v16, "isEqual:"))
          {
            char v11 = 0;
            v12 = v25;
            goto LABEL_26;
          }
          v29 = v15;
          v30 = v3;
          v12 = v25;
        }
        else
        {
          v29 = 0;
          v30 = v3;
        }
        v17 = [(SFQuickLookThumbnailImage *)self fileProviderIdentifier];
        v18 = [(SFQuickLookThumbnailImage *)v6 fileProviderIdentifier];
        if ((v17 == 0) == (v18 != 0))
        {

          char v11 = 0;
          v15 = v29;
          unint64_t v3 = v30;
          if (!v29) {
            goto LABEL_27;
          }
        }
        else
        {
          v24 = v17;
          v26 = v18;
          uint64_t v19 = [(SFQuickLookThumbnailImage *)self fileProviderIdentifier];
          v15 = v29;
          if (v19)
          {
            v23 = (void *)v19;
            v22 = [(SFQuickLookThumbnailImage *)self fileProviderIdentifier];
            v20 = [(SFQuickLookThumbnailImage *)v6 fileProviderIdentifier];
            char v11 = objc_msgSend(v22, "isEqual:");
          }
          else
          {

            char v11 = 1;
          }
          unint64_t v3 = v30;
          if (!v29) {
            goto LABEL_27;
          }
        }
LABEL_26:

LABEL_27:
LABEL_28:
        v10 = v31;
        if (!v9)
        {
LABEL_30:

          goto LABEL_31;
        }
LABEL_29:

        goto LABEL_30;
      }
    }
    char v11 = 0;
  }
LABEL_32:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SFQuickLookThumbnailImage;
  id v4 = [(SFImage *)&v12 copyWithZone:a3];
  uint64_t v5 = [(SFQuickLookThumbnailImage *)self filePath];
  v6 = (void *)[v5 copy];
  [v4 setFilePath:v6];

  uint64_t v7 = [(SFQuickLookThumbnailImage *)self coreSpotlightIdentifier];
  v8 = (void *)[v7 copy];
  [v4 setCoreSpotlightIdentifier:v8];

  unint64_t v9 = [(SFQuickLookThumbnailImage *)self fileProviderIdentifier];
  v10 = (void *)[v9 copy];
  [v4 setFileProviderIdentifier:v10];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBQuickLookThumbnailImage alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBQuickLookThumbnailImage *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBQuickLookThumbnailImage alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBQuickLookThumbnailImage *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBImage alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBImage *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFQuickLookThumbnailImage)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBImage alloc] initWithData:v5];
  v9.receiver = self;
  v9.super_class = (Class)SFQuickLookThumbnailImage;
  uint64_t v7 = [(SFImage *)&v9 initWithProtobuf:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFQuickLookThumbnailImage)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFQuickLookThumbnailImage;
  uint64_t v5 = [(SFQuickLookThumbnailImage *)&v15 init];
  if (v5)
  {
    v6 = [v4 filePath];

    if (v6)
    {
      uint64_t v7 = [v4 filePath];
      v8 = _SFPBURLHandwrittenTranslator(v7);
      [(SFQuickLookThumbnailImage *)v5 setFilePath:v8];
    }
    objc_super v9 = [v4 coreSpotlightIdentifier];

    if (v9)
    {
      v10 = [v4 coreSpotlightIdentifier];
      [(SFQuickLookThumbnailImage *)v5 setCoreSpotlightIdentifier:v10];
    }
    char v11 = [v4 fileProviderIdentifier];

    if (v11)
    {
      objc_super v12 = [v4 fileProviderIdentifier];
      [(SFQuickLookThumbnailImage *)v5 setFileProviderIdentifier:v12];
    }
    v13 = v5;
  }

  return v5;
}

@end