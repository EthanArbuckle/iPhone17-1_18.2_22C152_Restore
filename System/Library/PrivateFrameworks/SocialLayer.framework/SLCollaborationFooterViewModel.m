@interface SLCollaborationFooterViewModel
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isShareLink;
- (CKContainerSetupInfo)containerSetupInfo;
- (NSString)optionsSummary;
- (NSString)subtitle;
- (NSString)title;
- (NSURL)fileURL;
- (SLCollaborationFooterViewModel)initWithCoder:(id)a3;
- (SLCollaborationFooterViewModel)initWithContainerSetupInfo:(id)a3;
- (SLCollaborationFooterViewModel)initWithFileURL:(id)a3;
- (SLCollaborationFooterViewModel)initWithMetadata:(id)a3;
- (SLCollaborationFooterViewModel)initWithTitle:(id)a3 subtitle:(id)a4;
- (_SWCollaborationMetadata)metadata;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setIsShareLink:(BOOL)a3;
- (void)setOptionsSummary:(id)a3;
@end

@implementation SLCollaborationFooterViewModel

- (SLCollaborationFooterViewModel)initWithTitle:(id)a3 subtitle:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)SLCollaborationFooterViewModel;
  id v5 = a4;
  id v6 = a3;
  v7 = [(SLCollaborationFooterViewModel *)&v13 init];
  v7->_type = 0;
  uint64_t v8 = objc_msgSend(v6, "copy", v13.receiver, v13.super_class);

  title = v7->_title;
  v7->_title = (NSString *)v8;

  uint64_t v10 = [v5 copy];
  subtitle = v7->_subtitle;
  v7->_subtitle = (NSString *)v10;

  return v7;
}

- (SLCollaborationFooterViewModel)initWithFileURL:(id)a3
{
  v4 = (NSURL *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SLCollaborationFooterViewModel;
  id v5 = [(SLCollaborationFooterViewModel *)&v8 init];
  v5->_type = 1;
  fileURL = v5->_fileURL;
  v5->_fileURL = v4;

  return v5;
}

- (SLCollaborationFooterViewModel)initWithContainerSetupInfo:(id)a3
{
  v4 = (CKContainerSetupInfo *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SLCollaborationFooterViewModel;
  id v5 = [(SLCollaborationFooterViewModel *)&v8 init];
  v5->_type = 2;
  containerSetupInfo = v5->_containerSetupInfo;
  v5->_containerSetupInfo = v4;

  return v5;
}

- (SLCollaborationFooterViewModel)initWithMetadata:(id)a3
{
  v4 = (_SWCollaborationMetadata *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SLCollaborationFooterViewModel;
  id v5 = [(SLCollaborationFooterViewModel *)&v8 init];
  v5->_type = 3;
  metadata = v5->_metadata;
  v5->_metadata = v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLCollaborationFooterViewModel)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = NSStringFromSelector(sel_type);
  uint64_t v6 = [v4 decodeIntegerForKey:v5];

  uint64_t v7 = objc_opt_class();
  objc_super v8 = NSStringFromSelector(sel_title);
  v9 = [v4 decodeObjectOfClass:v7 forKey:v8];

  uint64_t v10 = objc_opt_class();
  v11 = NSStringFromSelector(sel_subtitle);
  v12 = [v4 decodeObjectOfClass:v10 forKey:v11];

  uint64_t v13 = objc_opt_class();
  v14 = NSStringFromSelector(sel_fileURL);
  v15 = [v4 decodeObjectOfClass:v13 forKey:v14];

  uint64_t v16 = objc_opt_class();
  v17 = NSStringFromSelector(sel_containerSetupInfo);
  v18 = [v4 decodeObjectOfClass:v16 forKey:v17];

  uint64_t v19 = objc_opt_class();
  v20 = NSStringFromSelector(sel_metadata);
  v21 = [v4 decodeObjectOfClass:v19 forKey:v20];

  switch(v6)
  {
    case 0:
      v22 = [(SLCollaborationFooterViewModel *)self initWithTitle:v9 subtitle:v12];
      goto LABEL_6;
    case 1:
      v22 = [(SLCollaborationFooterViewModel *)self initWithFileURL:v15];
      goto LABEL_6;
    case 2:
      v22 = [(SLCollaborationFooterViewModel *)self initWithContainerSetupInfo:v18];
      goto LABEL_6;
    case 3:
      v22 = [(SLCollaborationFooterViewModel *)self initWithMetadata:v21];
LABEL_6:
      self = v22;
      break;
    default:
      break;
  }
  if (self)
  {
    uint64_t v23 = objc_opt_class();
    v24 = NSStringFromSelector(sel_optionsSummary);
    v25 = [v4 decodeObjectOfClass:v23 forKey:v24];
    optionsSummary = self->_optionsSummary;
    self->_optionsSummary = v25;

    v27 = NSStringFromSelector(sel_isShareLink);
    self->_isShareLink = [v4 decodeBoolForKey:v27];
  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SLCollaborationFooterViewModel *)self type];
  uint64_t v6 = NSStringFromSelector(sel_type);
  [v4 encodeInteger:v5 forKey:v6];

  uint64_t v7 = [(SLCollaborationFooterViewModel *)self title];
  objc_super v8 = NSStringFromSelector(sel_title);
  [v4 encodeObject:v7 forKey:v8];

  v9 = [(SLCollaborationFooterViewModel *)self subtitle];
  uint64_t v10 = NSStringFromSelector(sel_subtitle);
  [v4 encodeObject:v9 forKey:v10];

  v11 = [(SLCollaborationFooterViewModel *)self fileURL];
  v12 = NSStringFromSelector(sel_fileURL);
  [v4 encodeObject:v11 forKey:v12];

  uint64_t v13 = [(SLCollaborationFooterViewModel *)self containerSetupInfo];
  v14 = NSStringFromSelector(sel_containerSetupInfo);
  [v4 encodeObject:v13 forKey:v14];

  v15 = [(SLCollaborationFooterViewModel *)self metadata];
  uint64_t v16 = NSStringFromSelector(sel_metadata);
  [v4 encodeObject:v15 forKey:v16];

  v17 = [(SLCollaborationFooterViewModel *)self optionsSummary];
  v18 = NSStringFromSelector(sel_optionsSummary);
  [v4 encodeObject:v17 forKey:v18];

  BOOL v19 = [(SLCollaborationFooterViewModel *)self isShareLink];
  NSStringFromSelector(sel_isShareLink);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v19 forKey:v20];
}

- (id)copyWithZone:(_NSZone *)a3
{
  switch([(SLCollaborationFooterViewModel *)self type])
  {
    case 0:
      id v4 = [SLCollaborationFooterViewModel alloc];
      int64_t v5 = [(SLCollaborationFooterViewModel *)self title];
      uint64_t v6 = [(SLCollaborationFooterViewModel *)self subtitle];
      uint64_t v7 = [(SLCollaborationFooterViewModel *)v4 initWithTitle:v5 subtitle:v6];

      goto LABEL_8;
    case 1:
      objc_super v8 = [SLCollaborationFooterViewModel alloc];
      int64_t v5 = [(SLCollaborationFooterViewModel *)self fileURL];
      uint64_t v9 = [(SLCollaborationFooterViewModel *)v8 initWithFileURL:v5];
      goto LABEL_7;
    case 2:
      uint64_t v10 = [SLCollaborationFooterViewModel alloc];
      int64_t v5 = [(SLCollaborationFooterViewModel *)self containerSetupInfo];
      uint64_t v9 = [(SLCollaborationFooterViewModel *)v10 initWithContainerSetupInfo:v5];
      goto LABEL_7;
    case 3:
      v11 = [SLCollaborationFooterViewModel alloc];
      int64_t v5 = [(SLCollaborationFooterViewModel *)self metadata];
      uint64_t v9 = [(SLCollaborationFooterViewModel *)v11 initWithMetadata:v5];
LABEL_7:
      uint64_t v7 = (SLCollaborationFooterViewModel *)v9;
LABEL_8:

      break;
    default:
      uint64_t v7 = 0;
      break;
  }
  v12 = [(SLCollaborationFooterViewModel *)self optionsSummary];
  [(SLCollaborationFooterViewModel *)v7 setOptionsSummary:v12];

  [(SLCollaborationFooterViewModel *)v7 setIsShareLink:[(SLCollaborationFooterViewModel *)self isShareLink]];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (SLCollaborationFooterViewModel *)a3;
  if (self == v6)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = v6;
      uint64_t v8 = [(SLCollaborationFooterViewModel *)v7 type];
      if (v8 == [(SLCollaborationFooterViewModel *)self type])
      {
        switch([(SLCollaborationFooterViewModel *)self type])
        {
          case 0:
            uint64_t v9 = [(SLCollaborationFooterViewModel *)self title];
            if (v9
              || ([(SLCollaborationFooterViewModel *)v7 title],
                  (v26 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              v3 = [(SLCollaborationFooterViewModel *)self title];
              id v4 = [(SLCollaborationFooterViewModel *)v7 title];
              if (![v3 isEqualToString:v4])
              {
                int v20 = 0;
                goto LABEL_32;
              }
              v25 = v3;
              int v10 = 1;
            }
            else
            {
              v26 = 0;
              int v10 = 0;
            }
            v21 = [(SLCollaborationFooterViewModel *)self subtitle];
            if (v21
              || ([(SLCollaborationFooterViewModel *)v7 subtitle],
                  (v24 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              v3 = [(SLCollaborationFooterViewModel *)self subtitle];
              v22 = [(SLCollaborationFooterViewModel *)v7 subtitle];
              int v20 = [v3 isEqualToString:v22];

              if (v21) {
                goto LABEL_30;
              }
            }
            else
            {
              v24 = 0;
              int v20 = 1;
            }

LABEL_30:
            if (!v10) {
              goto LABEL_33;
            }
            v3 = v25;
LABEL_32:

LABEL_33:
            if (v9)
            {

              if (!v20) {
                goto LABEL_37;
              }
            }
            else
            {

              if ((v20 & 1) == 0) {
                goto LABEL_37;
              }
            }
LABEL_15:
            v15 = [(SLCollaborationFooterViewModel *)self optionsSummary];
            if (v15
              || ([(SLCollaborationFooterViewModel *)v7 optionsSummary],
                  (v3 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              uint64_t v16 = [(SLCollaborationFooterViewModel *)self optionsSummary];
              v17 = [(SLCollaborationFooterViewModel *)v7 optionsSummary];
              int v18 = [v16 isEqual:v17];

              if (v15)
              {

                if (!v18) {
                  goto LABEL_37;
                }
              }
              else
              {

                if ((v18 & 1) == 0) {
                  goto LABEL_37;
                }
              }
            }
            BOOL v19 = [(SLCollaborationFooterViewModel *)self isShareLink];
            BOOL v11 = v19 ^ [(SLCollaborationFooterViewModel *)v7 isShareLink] ^ 1;
            break;
          case 1:
            v12 = [(SLCollaborationFooterViewModel *)self fileURL];
            uint64_t v13 = [(SLCollaborationFooterViewModel *)v7 fileURL];
            goto LABEL_14;
          case 2:
            v12 = [(SLCollaborationFooterViewModel *)self containerSetupInfo];
            uint64_t v13 = [(SLCollaborationFooterViewModel *)v7 containerSetupInfo];
            goto LABEL_14;
          case 3:
            v12 = [(SLCollaborationFooterViewModel *)self metadata];
            uint64_t v13 = [(SLCollaborationFooterViewModel *)v7 metadata];
LABEL_14:
            v3 = (void *)v13;
            char v14 = [v12 isEqual:v13];

            if (v14) {
              goto LABEL_15;
            }
            goto LABEL_37;
          default:
            goto LABEL_37;
        }
      }
      else
      {
LABEL_37:
        LOBYTE(v11) = 0;
      }
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }

  return v11;
}

- (NSString)optionsSummary
{
  return self->_optionsSummary;
}

- (void)setOptionsSummary:(id)a3
{
}

- (BOOL)isShareLink
{
  return self->_isShareLink;
}

- (void)setIsShareLink:(BOOL)a3
{
  self->_isShareLink = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (CKContainerSetupInfo)containerSetupInfo
{
  return self->_containerSetupInfo;
}

- (_SWCollaborationMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_containerSetupInfo, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_optionsSummary, 0);
}

@end