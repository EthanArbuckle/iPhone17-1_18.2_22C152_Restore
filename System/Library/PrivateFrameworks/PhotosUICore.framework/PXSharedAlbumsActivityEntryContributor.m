@interface PXSharedAlbumsActivityEntryContributor
- (BOOL)isEqual:(id)a3;
- (NSString)displayName;
- (NSString)email;
- (PXSharedAlbumsActivityEntryContributor)initWithDisplayName:(id)a3 email:(id)a4;
- (unint64_t)hash;
@end

@implementation PXSharedAlbumsActivityEntryContributor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

- (NSString)email
{
  return self->_email;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_displayName hash];
  return [(NSString *)self->_email hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXSharedAlbumsActivityEntryContributor;
  if (![(PXSharedAlbumsActivityEntryContributor *)&v13 isEqual:v4])
  {
    id v6 = v4;
    if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
    {
      id v7 = 0;
      char v5 = 0;
LABEL_17:

      goto LABEL_18;
    }
    id v7 = v6;

    if (!v7)
    {
      char v5 = 0;
LABEL_18:

      goto LABEL_19;
    }
    id v6 = [(PXSharedAlbumsActivityEntryContributor *)self displayName];
    id v8 = [v7 displayName];
    if (v6 == v8)
    {
    }
    else
    {
      int v9 = [v6 isEqualToString:v8];

      if (!v9)
      {
        char v5 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    v10 = [(PXSharedAlbumsActivityEntryContributor *)self email];
    v11 = [v7 email];
    if (v10 == v11) {
      char v5 = 1;
    }
    else {
      char v5 = [v10 isEqualToString:v11];
    }

    goto LABEL_16;
  }
  char v5 = 1;
LABEL_19:

  return v5;
}

- (PXSharedAlbumsActivityEntryContributor)initWithDisplayName:(id)a3 email:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXSharedAlbumsActivityEntryContributor;
  id v8 = [(PXSharedAlbumsActivityEntryContributor *)&v16 init];
  if (v8)
  {
    int v9 = (__CFString *)[v6 copy];
    v10 = v9;
    v11 = v9 ? v9 : &stru_1F00B0030;
    objc_storeStrong((id *)&v8->_displayName, v11);

    uint64_t v12 = [v7 copy];
    email = v8->_email;
    v8->_email = (NSString *)v12;

    if (![(NSString *)v8->_displayName length])
    {
      v14 = PLSharingGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v7;
        _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_DEFAULT, "Display name is empty for activity entry contributor. Email: %@", buf, 0xCu);
      }
    }
  }

  return v8;
}

@end