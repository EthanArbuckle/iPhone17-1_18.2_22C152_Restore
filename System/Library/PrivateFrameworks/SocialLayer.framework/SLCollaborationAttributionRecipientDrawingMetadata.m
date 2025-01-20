@interface SLCollaborationAttributionRecipientDrawingMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CNContact)contact;
- (NSData)contactImageData;
- (SLCollaborationAttributionRecipientDrawingMetadata)initWithCoder:(id)a3;
- (SLCollaborationAttributionRecipientDrawingMetadata)initWithContact:(id)a3 contactImageData:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SLCollaborationAttributionRecipientDrawingMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLCollaborationAttributionRecipientDrawingMetadata)initWithContact:(id)a3 contactImageData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SLCollaborationAttributionRecipientDrawingMetadata;
  v9 = [(SLCollaborationAttributionRecipientDrawingMetadata *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contact, a3);
    objc_storeStrong((id *)&v10->_contactImageData, a4);
  }

  return v10;
}

- (SLCollaborationAttributionRecipientDrawingMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SLCollaborationAttributionRecipientDrawingMetadata;
  v5 = [(SLCollaborationAttributionRecipientDrawingMetadata *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contact"];
    contact = v5->_contact;
    v5->_contact = (CNContact *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contactImageData"];
    contactImageData = v5->_contactImageData;
    v5->_contactImageData = (NSData *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SLCollaborationAttributionRecipientDrawingMetadata *)self contact];
  [v4 encodeObject:v5 forKey:@"contact"];

  id v6 = [(SLCollaborationAttributionRecipientDrawingMetadata *)self contactImageData];
  [v4 encodeObject:v6 forKey:@"contactImageData"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(SLCollaborationAttributionRecipientDrawingMetadata *)self contact];
  id v6 = [(SLCollaborationAttributionRecipientDrawingMetadata *)self contactImageData];
  id v7 = (void *)[v4 initWithContact:v5 contactImageData:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = (SLCollaborationAttributionRecipientDrawingMetadata *)v5;
    if (v6 == self)
    {
      char v20 = 1;
LABEL_21:

      goto LABEL_22;
    }
    id v7 = [(SLCollaborationAttributionRecipientDrawingMetadata *)self contact];
    if (!v7)
    {
      v3 = [(SLCollaborationAttributionRecipientDrawingMetadata *)v6 contact];
      if (!v3) {
        goto LABEL_9;
      }
    }
    uint64_t v8 = [(SLCollaborationAttributionRecipientDrawingMetadata *)self contact];
    if (!v8) {
      goto LABEL_18;
    }
    v9 = (void *)v8;
    uint64_t v10 = [(SLCollaborationAttributionRecipientDrawingMetadata *)v6 contact];
    if (!v10) {
      goto LABEL_17;
    }
    objc_super v11 = (void *)v10;
    objc_super v12 = [(SLCollaborationAttributionRecipientDrawingMetadata *)self contact];
    v13 = [(SLCollaborationAttributionRecipientDrawingMetadata *)v6 contact];
    int v14 = [v12 isEqual:v13];

    if (v7)
    {

      if (v14) {
        goto LABEL_9;
      }
    }
    else
    {

      if (v14)
      {
LABEL_9:
        id v7 = [(SLCollaborationAttributionRecipientDrawingMetadata *)self contactImageData];
        if (!v7)
        {
          v3 = [(SLCollaborationAttributionRecipientDrawingMetadata *)v6 contactImageData];
          if (!v3)
          {
            char v20 = 1;
            goto LABEL_19;
          }
        }
        uint64_t v15 = [(SLCollaborationAttributionRecipientDrawingMetadata *)self contactImageData];
        if (!v15)
        {
LABEL_18:
          char v20 = 0;
          if (v7) {
            goto LABEL_20;
          }
LABEL_19:

          goto LABEL_20;
        }
        v9 = (void *)v15;
        uint64_t v16 = [(SLCollaborationAttributionRecipientDrawingMetadata *)v6 contactImageData];
        if (v16)
        {
          v17 = (void *)v16;
          v18 = [(SLCollaborationAttributionRecipientDrawingMetadata *)self contactImageData];
          v19 = [(SLCollaborationAttributionRecipientDrawingMetadata *)v6 contactImageData];
          char v20 = [v18 isEqualToData:v19];

          if (!v7) {
            goto LABEL_19;
          }
LABEL_20:

          goto LABEL_21;
        }
LABEL_17:

        goto LABEL_18;
      }
    }
    char v20 = 0;
    goto LABEL_21;
  }
  char v20 = 0;
LABEL_22:

  return v20;
}

- (unint64_t)hash
{
  v3 = [(SLCollaborationAttributionRecipientDrawingMetadata *)self contact];
  uint64_t v4 = [v3 hash];
  id v5 = [(SLCollaborationAttributionRecipientDrawingMetadata *)self contactImageData];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NSData)contactImageData
{
  return self->_contactImageData;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_contactImageData, 0);
}

@end