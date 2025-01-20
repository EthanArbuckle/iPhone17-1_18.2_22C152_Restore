@interface _SFPBMessageAttachment
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSData)linkMetadata;
- (_SFPBMessageAttachment)initWithDictionary:(id)a3;
- (_SFPBMessageAttachment)initWithFacade:(id)a3;
- (_SFPBMessageAttachment)initWithJSON:(id)a3;
- (_SFPBPhotosLibraryImage)photosLibraryImage;
- (_SFPBURL)url;
- (id)dictionaryRepresentation;
- (int)type;
- (unint64_t)hash;
- (void)setLinkMetadata:(id)a3;
- (void)setPhotosLibraryImage:(id)a3;
- (void)setType:(int)a3;
- (void)setUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBMessageAttachment

- (_SFPBMessageAttachment)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBMessageAttachment *)self init];
  if (v5)
  {
    if ([v4 hasType]) {
      -[_SFPBMessageAttachment setType:](v5, "setType:", [v4 type]);
    }
    v6 = [v4 url];

    if (v6)
    {
      v7 = [_SFPBURL alloc];
      v8 = [v4 url];
      v9 = [(_SFPBURL *)v7 initWithNSURL:v8];
      [(_SFPBMessageAttachment *)v5 setUrl:v9];
    }
    v10 = [v4 linkMetadata];

    if (v10)
    {
      v11 = [v4 linkMetadata];
      [(_SFPBMessageAttachment *)v5 setLinkMetadata:v11];
    }
    v12 = [v4 photosLibraryImage];

    if (v12)
    {
      v13 = [_SFPBPhotosLibraryImage alloc];
      v14 = [v4 photosLibraryImage];
      v15 = [(_SFPBPhotosLibraryImage *)v13 initWithFacade:v14];
      [(_SFPBMessageAttachment *)v5 setPhotosLibraryImage:v15];
    }
    v16 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosLibraryImage, 0);
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (_SFPBPhotosLibraryImage)photosLibraryImage
{
  return self->_photosLibraryImage;
}

- (NSData)linkMetadata
{
  return self->_linkMetadata;
}

- (_SFPBURL)url
{
  return self->_url;
}

- (int)type
{
  return self->_type;
}

- (_SFPBMessageAttachment)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SFPBMessageAttachment;
  v5 = [(_SFPBMessageAttachment *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMessageAttachment setType:](v5, "setType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"url"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [[_SFPBURL alloc] initWithDictionary:v7];
      [(_SFPBMessageAttachment *)v5 setUrl:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"linkMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v9 options:0];
      [(_SFPBMessageAttachment *)v5 setLinkMetadata:v10];
    }
    v11 = [v4 objectForKeyedSubscript:@"photosLibraryImage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[_SFPBPhotosLibraryImage alloc] initWithDictionary:v11];
      [(_SFPBMessageAttachment *)v5 setPhotosLibraryImage:v12];
    }
    v13 = v5;
  }
  return v5;
}

- (_SFPBMessageAttachment)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBMessageAttachment *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBMessageAttachment *)self dictionaryRepresentation];
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
  if (self->_linkMetadata)
  {
    id v4 = [(_SFPBMessageAttachment *)self linkMetadata];
    v5 = [v4 base64EncodedStringWithOptions:0];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"linkMetadata"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"linkMetadata"];
    }
  }
  if (self->_photosLibraryImage)
  {
    uint64_t v7 = [(_SFPBMessageAttachment *)self photosLibraryImage];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"photosLibraryImage"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"photosLibraryImage"];
    }
  }
  if (self->_type)
  {
    uint64_t v10 = [(_SFPBMessageAttachment *)self type];
    if (v10 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E5A2EF58[v10];
    }
    [v3 setObject:v11 forKeyedSubscript:@"type"];
  }
  if (self->_url)
  {
    v12 = [(_SFPBMessageAttachment *)self url];
    v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"url"];
    }
    else
    {
      v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"url"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = 2654435761 * self->_type;
  unint64_t v4 = [(_SFPBURL *)self->_url hash];
  uint64_t v5 = v4 ^ [(NSData *)self->_linkMetadata hash];
  return v5 ^ [(_SFPBPhotosLibraryImage *)self->_photosLibraryImage hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  int type = self->_type;
  if (type != [v4 type]) {
    goto LABEL_18;
  }
  v6 = [(_SFPBMessageAttachment *)self url];
  uint64_t v7 = [v4 url];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v8 = [(_SFPBMessageAttachment *)self url];
  if (v8)
  {
    v9 = (void *)v8;
    uint64_t v10 = [(_SFPBMessageAttachment *)self url];
    v11 = [v4 url];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  v6 = [(_SFPBMessageAttachment *)self linkMetadata];
  uint64_t v7 = [v4 linkMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v13 = [(_SFPBMessageAttachment *)self linkMetadata];
  if (v13)
  {
    v14 = (void *)v13;
    objc_super v15 = [(_SFPBMessageAttachment *)self linkMetadata];
    v16 = [v4 linkMetadata];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  v6 = [(_SFPBMessageAttachment *)self photosLibraryImage];
  uint64_t v7 = [v4 photosLibraryImage];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v18 = [(_SFPBMessageAttachment *)self photosLibraryImage];
    if (!v18)
    {

LABEL_21:
      BOOL v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    v20 = [(_SFPBMessageAttachment *)self photosLibraryImage];
    v21 = [v4 photosLibraryImage];
    char v22 = [v20 isEqual:v21];

    if (v22) {
      goto LABEL_21;
    }
  }
  else
  {
LABEL_17:
  }
LABEL_18:
  BOOL v23 = 0;
LABEL_19:

  return v23;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if ([(_SFPBMessageAttachment *)self type]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_SFPBMessageAttachment *)self url];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v5 = [(_SFPBMessageAttachment *)self linkMetadata];
  if (v5) {
    PBDataWriterWriteDataField();
  }

  v6 = [(_SFPBMessageAttachment *)self photosLibraryImage];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBMessageAttachmentReadFrom(self, (uint64_t)a3);
}

- (void)setPhotosLibraryImage:(id)a3
{
}

- (void)setLinkMetadata:(id)a3
{
  self->_linkMetadata = (NSData *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setUrl:(id)a3
{
}

- (void)setType:(int)a3
{
  self->_int type = a3;
}

@end