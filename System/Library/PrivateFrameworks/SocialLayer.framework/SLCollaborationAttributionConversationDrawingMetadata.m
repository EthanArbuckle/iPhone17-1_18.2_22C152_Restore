@interface SLCollaborationAttributionConversationDrawingMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroupConversation;
- (NSArray)recipientDrawingMetadata;
- (NSString)groupID;
- (NSURL)groupPhotoFileURL;
- (SLCollaborationAttributionConversationDrawingMetadata)initWithCoder:(id)a3;
- (SLCollaborationAttributionConversationDrawingMetadata)initWithGroupPhotoFileURL:(id)a3 recipientDrawingMetadata:(id)a4 groupID:(id)a5;
- (SLCollaborationAttributionConversationDrawingMetadata)initWithRecipientDrawingMetadata:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SLCollaborationAttributionConversationDrawingMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLCollaborationAttributionConversationDrawingMetadata)initWithRecipientDrawingMetadata:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SLCollaborationAttributionConversationDrawingMetadata;
  v5 = [(SLCollaborationAttributionConversationDrawingMetadata *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_isGroupConversation = 0;
    v11[0] = v4;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    recipientDrawingMetadata = v6->_recipientDrawingMetadata;
    v6->_recipientDrawingMetadata = (NSArray *)v7;
  }
  return v6;
}

- (SLCollaborationAttributionConversationDrawingMetadata)initWithGroupPhotoFileURL:(id)a3 recipientDrawingMetadata:(id)a4 groupID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ((unint64_t)[v10 count] >= 2)
  {
    v16.receiver = self;
    v16.super_class = (Class)SLCollaborationAttributionConversationDrawingMetadata;
    v13 = [(SLCollaborationAttributionConversationDrawingMetadata *)&v16 init];
    p_isa = (id *)&v13->super.isa;
    if (v13)
    {
      v13->_isGroupConversation = 1;
      objc_storeStrong((id *)&v13->_groupPhotoFileURL, a3);
      objc_storeStrong(p_isa + 3, a4);
      objc_storeStrong(p_isa + 4, a5);
    }
    self = p_isa;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SLCollaborationAttributionConversationDrawingMetadata *)self groupPhotoFileURL];
  v5 = [v4 absoluteString];
  v6 = [(SLCollaborationAttributionConversationDrawingMetadata *)self groupID];
  uint64_t v7 = [(SLCollaborationAttributionConversationDrawingMetadata *)self recipientDrawingMetadata];
  v8 = [v3 stringWithFormat:@"<SLCollaborationAttributionConversationDrawingMetadata: %p> groupPhotoFileURL:[%@] groupID:[%@] recipientDrawingMetadata:[%@]", self, v5, v6, v7];

  return v8;
}

- (SLCollaborationAttributionConversationDrawingMetadata)initWithCoder:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SLCollaborationAttributionConversationDrawingMetadata;
  v5 = [(SLCollaborationAttributionConversationDrawingMetadata *)&v16 init];
  if (v5)
  {
    v5->_isGroupConversation = [v4 decodeBoolForKey:@"isGroupConversation"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"recipientDrawingMetadata"];
    recipientDrawingMetadata = v5->_recipientDrawingMetadata;
    v5->_recipientDrawingMetadata = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupPhotoFileURL"];
    groupPhotoFileURL = v5->_groupPhotoFileURL;
    v5->_groupPhotoFileURL = (NSURL *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupID"];
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[SLCollaborationAttributionConversationDrawingMetadata isGroupConversation](self, "isGroupConversation"), @"isGroupConversation");
  v5 = [(SLCollaborationAttributionConversationDrawingMetadata *)self recipientDrawingMetadata];
  [v4 encodeObject:v5 forKey:@"recipientDrawingMetadata"];

  v6 = [(SLCollaborationAttributionConversationDrawingMetadata *)self groupPhotoFileURL];
  [v4 encodeObject:v6 forKey:@"groupPhotoFileURL"];

  id v7 = [(SLCollaborationAttributionConversationDrawingMetadata *)self groupID];
  [v4 encodeObject:v7 forKey:@"groupID"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = [(SLCollaborationAttributionConversationDrawingMetadata *)self isGroupConversation];
  id v5 = objc_alloc((Class)objc_opt_class());
  if (v4)
  {
    v6 = [(SLCollaborationAttributionConversationDrawingMetadata *)self groupPhotoFileURL];
    id v7 = [(SLCollaborationAttributionConversationDrawingMetadata *)self recipientDrawingMetadata];
    v8 = [(SLCollaborationAttributionConversationDrawingMetadata *)self groupID];
    uint64_t v9 = (void *)[v5 initWithGroupPhotoFileURL:v6 recipientDrawingMetadata:v7 groupID:v8];
  }
  else
  {
    v6 = [(SLCollaborationAttributionConversationDrawingMetadata *)self recipientDrawingMetadata];
    id v7 = [v6 firstObject];
    uint64_t v9 = (void *)[v5 initWithRecipientDrawingMetadata:v7];
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = (SLCollaborationAttributionConversationDrawingMetadata *)v5;
    if (v6 == self)
    {
      char v8 = 1;
      goto LABEL_26;
    }
    BOOL v7 = [(SLCollaborationAttributionConversationDrawingMetadata *)self isGroupConversation];
    if (v7 != [(SLCollaborationAttributionConversationDrawingMetadata *)v6 isGroupConversation])
    {
LABEL_4:
      char v8 = 0;
LABEL_26:

      goto LABEL_27;
    }
    uint64_t v9 = [(SLCollaborationAttributionConversationDrawingMetadata *)self recipientDrawingMetadata];
    if (v9
      || ([(SLCollaborationAttributionConversationDrawingMetadata *)v6 recipientDrawingMetadata], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v10 = [(SLCollaborationAttributionConversationDrawingMetadata *)self recipientDrawingMetadata];
      if (!v10) {
        goto LABEL_23;
      }
      uint64_t v11 = (void *)v10;
      uint64_t v12 = [(SLCollaborationAttributionConversationDrawingMetadata *)v6 recipientDrawingMetadata];
      if (!v12) {
        goto LABEL_22;
      }
      uint64_t v13 = (void *)v12;
      v14 = [(SLCollaborationAttributionConversationDrawingMetadata *)self recipientDrawingMetadata];
      v15 = [(SLCollaborationAttributionConversationDrawingMetadata *)v6 recipientDrawingMetadata];
      int v16 = [v14 isEqualToArray:v15];

      if (v9)
      {

        if (!v16) {
          goto LABEL_4;
        }
      }
      else
      {

        if ((v16 & 1) == 0) {
          goto LABEL_4;
        }
      }
    }
    uint64_t v9 = [(SLCollaborationAttributionConversationDrawingMetadata *)self groupPhotoFileURL];
    if (!v9)
    {
      v3 = [(SLCollaborationAttributionConversationDrawingMetadata *)v6 groupPhotoFileURL];
      if (!v3) {
        goto LABEL_29;
      }
    }
    uint64_t v17 = [(SLCollaborationAttributionConversationDrawingMetadata *)self groupPhotoFileURL];
    if (!v17)
    {
LABEL_23:
      char v8 = 0;
      if (!v9) {
        uint64_t v9 = v3;
      }
      goto LABEL_25;
    }
    uint64_t v11 = (void *)v17;
    uint64_t v18 = [(SLCollaborationAttributionConversationDrawingMetadata *)v6 groupPhotoFileURL];
    if (v18)
    {
      v19 = (void *)v18;
      v20 = [(SLCollaborationAttributionConversationDrawingMetadata *)self groupPhotoFileURL];
      v21 = [(SLCollaborationAttributionConversationDrawingMetadata *)v6 groupPhotoFileURL];
      int v22 = [v20 isEqual:v21];

      if (v9)
      {

        if (!v22) {
          goto LABEL_4;
        }
      }
      else
      {

        if ((v22 & 1) == 0) {
          goto LABEL_4;
        }
      }
LABEL_29:
      uint64_t v9 = [(SLCollaborationAttributionConversationDrawingMetadata *)self groupID];
      if (!v9)
      {
        v3 = [(SLCollaborationAttributionConversationDrawingMetadata *)v6 groupID];
        if (!v3)
        {
          char v8 = 1;
LABEL_39:

          goto LABEL_25;
        }
      }
      uint64_t v24 = [(SLCollaborationAttributionConversationDrawingMetadata *)self groupID];
      if (v24)
      {
        v25 = (void *)v24;
        uint64_t v26 = [(SLCollaborationAttributionConversationDrawingMetadata *)v6 groupID];
        if (v26)
        {
          v27 = (void *)v26;
          v28 = [(SLCollaborationAttributionConversationDrawingMetadata *)self groupID];
          v29 = [(SLCollaborationAttributionConversationDrawingMetadata *)v6 groupID];
          char v8 = [v28 isEqualToString:v29];

          if (!v9) {
            goto LABEL_39;
          }
LABEL_25:

          goto LABEL_26;
        }
      }
      char v8 = 0;
      if (!v9) {
        goto LABEL_39;
      }
      goto LABEL_25;
    }
LABEL_22:

    goto LABEL_23;
  }
  char v8 = 0;
LABEL_27:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(SLCollaborationAttributionConversationDrawingMetadata *)self isGroupConversation];
  BOOL v4 = [(SLCollaborationAttributionConversationDrawingMetadata *)self recipientDrawingMetadata];
  uint64_t v5 = [v4 hash];
  v6 = [(SLCollaborationAttributionConversationDrawingMetadata *)self groupPhotoFileURL];
  uint64_t v7 = v5 ^ [v6 hash] ^ v3;
  char v8 = [(SLCollaborationAttributionConversationDrawingMetadata *)self groupID];
  unint64_t v9 = v7 ^ [v8 hash];

  return v9;
}

- (BOOL)isGroupConversation
{
  return self->_isGroupConversation;
}

- (NSURL)groupPhotoFileURL
{
  return self->_groupPhotoFileURL;
}

- (NSArray)recipientDrawingMetadata
{
  return self->_recipientDrawingMetadata;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_recipientDrawingMetadata, 0);
  objc_storeStrong((id *)&self->_groupPhotoFileURL, 0);
}

@end