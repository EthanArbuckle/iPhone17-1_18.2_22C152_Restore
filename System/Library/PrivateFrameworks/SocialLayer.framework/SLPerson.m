@interface SLPerson
+ (BOOL)supportsSecureCoding;
+ (id)createMutableContactWithHandle:(id)a3;
+ (id)errorForPersonDomain:(id)a3 andCode:(int64_t)a4;
+ (id)fetchMeContact;
+ (id)keysForCNContact;
+ (id)predicateForHandle:(id)a3;
- (BOOL)hasMutableContact;
- (BOOL)isEqual:(id)a3;
- (CNContact)contact;
- (CNContactStore)contactStore;
- (NSData)thumbnailImageData;
- (NSString)displayName;
- (NSString)handle;
- (NSString)shortDisplayName;
- (SLPerson)initWithCSPerson:(id)a3 error:(id *)a4;
- (SLPerson)initWithCoder:(id)a3;
- (SLPerson)initWithDictionary:(id)a3;
- (SLPerson)initWithHandle:(id)a3 displayName:(id)a4;
- (SLPerson)initWithPortraitPerson:(id)a3 error:(id *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)fetchCNContactWithHandle:(id)a3;
- (unint64_t)hash;
- (void)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setContact:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setHasMutableContact:(BOOL)a3;
- (void)setShortDisplayName:(id)a3;
- (void)setThumbnailImageData:(id)a3;
@end

@implementation SLPerson

- (SLPerson)initWithPortraitPerson:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SLPerson;
  v7 = [(SLPerson *)&v21 init];
  if (!v7) {
    goto LABEL_16;
  }
  if (v6)
  {
    v8 = [v6 handle];
    uint64_t v9 = [v8 length];

    if (v9)
    {
      uint64_t v10 = [v6 handle];
      handle = v7->_handle;
      v7->_handle = (NSString *)v10;

      v12 = [v6 displayName];
      uint64_t v13 = [v12 length];

      if (v13)
      {
        v14 = [v6 displayName];
LABEL_15:
        displayName = v7->_displayName;
        v7->_displayName = v14;

LABEL_16:
        v17 = v7;
        goto LABEL_20;
      }
      if ([(NSString *)v7->_handle length])
      {
        v18 = SLFrameworkLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          -[SLPerson initWithPortraitPerson:error:]();
        }

        v14 = v7->_handle;
        goto LABEL_15;
      }
      if (a4)
      {
        v15 = objc_opt_class();
        uint64_t v16 = 3;
        goto LABEL_10;
      }
LABEL_19:
      v17 = 0;
      goto LABEL_20;
    }
    if (!a4) {
      goto LABEL_19;
    }
    v15 = objc_opt_class();
    uint64_t v16 = 2;
  }
  else
  {
    if (!a4) {
      goto LABEL_19;
    }
    v15 = objc_opt_class();
    uint64_t v16 = 1;
  }
LABEL_10:
  [v15 errorForPersonDomain:@"com.apple.SocialLayer.SLPerson" andCode:v16];
  v17 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v17;
}

- (SLPerson)initWithCSPerson:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SLPerson;
  v7 = [(SLPerson *)&v19 init];
  if (!v7) {
    goto LABEL_9;
  }
  v8 = [v6 handles];
  uint64_t v9 = [v8 firstObject];

  if (![v9 length])
  {
    if (a4)
    {
      *a4 = [(id)objc_opt_class() errorForPersonDomain:@"com.apple.SocialLayer.SLPerson" andCode:2];
    }
    goto LABEL_15;
  }
  p_handle = (id *)&v7->_handle;
  objc_storeStrong((id *)&v7->_handle, v9);
  v11 = [v6 displayName];
  uint64_t v12 = [v11 length];
  id v13 = v11;
  if (!v12)
  {
    if ([*p_handle length])
    {
      v14 = SLFrameworkLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[SLPerson initWithPortraitPerson:error:]();
      }

      id v13 = *p_handle;
      goto LABEL_8;
    }
    if (a4)
    {
      *a4 = [(id)objc_opt_class() errorForPersonDomain:@"com.apple.SocialLayer.SLPerson" andCode:3];
    }

LABEL_15:
    v17 = 0;
    goto LABEL_16;
  }
LABEL_8:
  v15 = (NSString *)v13;
  displayName = v7->_displayName;
  v7->_displayName = v15;

LABEL_9:
  v17 = v7;
LABEL_16:

  return v17;
}

- (SLPerson)initWithHandle:(id)a3 displayName:(id)a4
{
  id v6 = (__CFString *)a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SLPerson;
  v8 = [(SLPerson *)&v12 init];
  uint64_t v9 = v8;
  if (v8)
  {
    if (v6) {
      uint64_t v10 = v6;
    }
    else {
      uint64_t v10 = &stru_1EEC19158;
    }
    objc_storeStrong((id *)&v8->_handle, v10);
    objc_storeStrong((id *)&v9->_displayName, a4);
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(SLPerson *)self handle];
  id v7 = [(SLPerson *)self displayName];
  v8 = [(SLPerson *)self shortDisplayName];
  uint64_t v9 = [(SLPerson *)self contact];
  uint64_t v10 = [v3 stringWithFormat:@"[%@: handle: %@  displayName: %@  shortDisplayName: %@ contact: %@]", v5, v6, v7, v8, v9];

  return v10;
}

- (NSString)displayName
{
  v3 = self->_displayName;
  if (![(NSString *)v3 length])
  {
    uint64_t v4 = [(SLPerson *)self shortDisplayName];

    v3 = (NSString *)v4;
  }
  if (![(NSString *)v3 length])
  {
    uint64_t v5 = [(SLPerson *)self handle];

    v3 = (NSString *)v5;
  }
  return v3;
}

- (SLPerson)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SLPerson;
  uint64_t v5 = [(SLPerson *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"h"];
    handle = v5->_handle;
    v5->_handle = (NSString *)v6;

    uint64_t v8 = [v4 objectForKey:@"dn"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v8;

    uint64_t v10 = [v4 objectForKey:@"sdn"];
    shortDisplayName = v5->_shortDisplayName;
    v5->_shortDisplayName = (NSString *)v10;

    uint64_t v12 = [v4 objectForKey:@"c"];
    contact = v5->_contact;
    v5->_contact = (CNContact *)v12;
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(SLPerson *)self handle];

  if (v4)
  {
    uint64_t v5 = [(SLPerson *)self handle];
    [v3 setObject:v5 forKey:@"h"];

    uint64_t v6 = [(SLPerson *)self displayName];

    if (v6)
    {
      id v7 = [(SLPerson *)self displayName];
      [v3 setObject:v7 forKey:@"dn"];

      uint64_t v8 = [(SLPerson *)self shortDisplayName];

      if (v8)
      {
        uint64_t v9 = [(SLPerson *)self shortDisplayName];
        [v3 setObject:v9 forKey:@"sdn"];

        uint64_t v10 = [(SLPerson *)self contact];

        if (v10)
        {
          v11 = [(SLPerson *)self contact];
          [v3 setObject:v11 forKey:@"c"];

          id v12 = v3;
          goto LABEL_15;
        }
        id v13 = SLFrameworkLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[SLPerson dictionaryRepresentation].cold.4();
        }
      }
      else
      {
        id v13 = SLFrameworkLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[SLPerson dictionaryRepresentation]();
        }
      }
    }
    else
    {
      id v13 = SLFrameworkLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[SLPerson dictionaryRepresentation]();
      }
    }
  }
  else
  {
    id v13 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SLPerson dictionaryRepresentation]();
    }
  }

  id v12 = 0;
LABEL_15:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLPerson)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SLPerson;
  uint64_t v5 = [(SLPerson *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"h"];
    handle = v5->_handle;
    v5->_handle = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dn"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sdn"];
    shortDisplayName = v5->_shortDisplayName;
    v5->_shortDisplayName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"c"];
    contact = v5->_contact;
    v5->_contact = (CNContact *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  handle = self->_handle;
  id v5 = a3;
  [v5 encodeObject:handle forKey:@"h"];
  [v5 encodeObject:self->_displayName forKey:@"dn"];
  uint64_t v6 = [(SLPerson *)self shortDisplayName];
  [v5 encodeObject:v6 forKey:@"sdn"];

  id v7 = [(SLPerson *)self contact];
  [v5 encodeObject:v7 forKey:@"c"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [SLPerson alloc];
  id v5 = [(SLPerson *)self dictionaryRepresentation];
  uint64_t v6 = [(SLPerson *)v4 initWithDictionary:v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    uint64_t v8 = [(SLPerson *)self handle];
    if (v8 || ([v7 handle], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v4 = [(SLPerson *)self handle];
      uint64_t v9 = [v7 handle];
      int v10 = [v4 isEqualToString:v9];

      if (v8)
      {

        if (!v10) {
          goto LABEL_35;
        }
      }
      else
      {

        if ((v10 & 1) == 0) {
          goto LABEL_35;
        }
      }
    }
    uint64_t v12 = [(SLPerson *)self contact];
    if (v12 || ([v7 contact], (v26 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v13 = [(SLPerson *)self contact];
      v3 = (void *)0x1E4F1B000;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) == 0
        || ([v7 contact],
            id v4 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            (objc_opt_isKindOfClass() & 1) == 0))
      {
        uint64_t v16 = [(SLPerson *)self contact];
        v3 = [v7 contact];
        char v17 = [v16 isEqual:v3];

        if (isKindOfClass)
        {

          if (!v12)
          {

            if ((v17 & 1) == 0) {
              goto LABEL_35;
            }
            goto LABEL_26;
          }
        }
        else
        {

          if (!v12) {
        }
          }

        if ((v17 & 1) == 0) {
          goto LABEL_35;
        }
LABEL_26:
        v18 = [(SLPerson *)self displayName];
        if (!v18)
        {
          v3 = [v7 displayName];
          if (!v3)
          {
LABEL_30:
            v22 = [(SLPerson *)self shortDisplayName];
            if (v22
              || ([v7 shortDisplayName], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              v23 = [(SLPerson *)self shortDisplayName];
              v24 = [v7 shortDisplayName];
              char v11 = [v23 isEqualToString:v24];

              if (v22)
              {
LABEL_38:

                goto LABEL_39;
              }
            }
            else
            {
              char v11 = 1;
            }

            goto LABEL_38;
          }
        }
        objc_super v19 = [(SLPerson *)self displayName];
        v20 = [v7 displayName];
        int v21 = [v19 isEqualToString:v20];

        if (v18)
        {

          if (v21) {
            goto LABEL_30;
          }
        }
        else
        {

          if (v21) {
            goto LABEL_30;
          }
        }
LABEL_35:
        char v11 = 0;
LABEL_39:

        goto LABEL_40;
      }

      objc_super v15 = v26;
      if (v12)
      {
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {
      objc_super v15 = 0;
    }
    uint64_t v12 = v15;
    goto LABEL_25;
  }
  char v11 = 0;
LABEL_40:

  return v11;
}

+ (id)errorForPersonDomain:(id)a3 andCode:(int64_t)a4
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  switch(a4)
  {
    case 3:
      v16[0] = *MEMORY[0x1E4F28568];
      id v6 = [MEMORY[0x1E4F28B50] mainBundle];
      id v7 = [v6 localizedStringForKey:@"SLPerson Init failed." value:&stru_1EEC19158 table:0];
      v17[0] = v7;
      v16[1] = *MEMORY[0x1E4F28588];
      uint64_t v8 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v9 = [v8 localizedStringForKey:@"PPSocialPerson contains an invalid or nil Display Name." value:&stru_1EEC19158 table:0];
      v17[1] = v9;
      int v10 = (void *)MEMORY[0x1E4F1C9E8];
      char v11 = v17;
      uint64_t v12 = v16;
      goto LABEL_7;
    case 2:
      v18[0] = *MEMORY[0x1E4F28568];
      id v6 = [MEMORY[0x1E4F28B50] mainBundle];
      id v7 = [v6 localizedStringForKey:@"SLPerson Init failed." value:&stru_1EEC19158 table:0];
      v19[0] = v7;
      v18[1] = *MEMORY[0x1E4F28588];
      uint64_t v8 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v9 = [v8 localizedStringForKey:@"PPSocialPerson contains an invalid or nil handle." value:&stru_1EEC19158 table:0];
      v19[1] = v9;
      int v10 = (void *)MEMORY[0x1E4F1C9E8];
      char v11 = v19;
      uint64_t v12 = v18;
      goto LABEL_7;
    case 1:
      v20[0] = *MEMORY[0x1E4F28568];
      id v6 = [MEMORY[0x1E4F28B50] mainBundle];
      id v7 = [v6 localizedStringForKey:@"SLPerson Init failed." value:&stru_1EEC19158 table:0];
      v21[0] = v7;
      v20[1] = *MEMORY[0x1E4F28588];
      uint64_t v8 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v9 = [v8 localizedStringForKey:@"Invalid or nil PPSocialPerson." value:&stru_1EEC19158 table:0];
      v21[1] = v9;
      int v10 = (void *)MEMORY[0x1E4F1C9E8];
      char v11 = v21;
      uint64_t v12 = v20;
LABEL_7:
      id v13 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:2];

      goto LABEL_9;
  }
  id v13 = 0;
LABEL_9:
  v14 = [MEMORY[0x1E4F28C58] errorWithDomain:v5 code:a4 userInfo:v13];

  return v14;
}

- (NSString)shortDisplayName
{
  if (!self->_shortDisplayName)
  {
    v3 = [(SLPerson *)self contact];

    if (v3)
    {
      id v4 = (void *)MEMORY[0x1E4F1B910];
      id v5 = [(SLPerson *)self contact];
      id v6 = [v4 stringFromContact:v5 style:1000];
      shortDisplayName = self->_shortDisplayName;
      self->_shortDisplayName = v6;
    }
  }
  uint64_t v8 = self->_shortDisplayName;
  return v8;
}

- (CNContact)contact
{
  contact = self->_contact;
  if (!contact)
  {
    id v4 = [(SLPerson *)self handle];
    id v5 = [(SLPerson *)self fetchCNContactWithHandle:v4];

    if (v5)
    {
      id v6 = v5;
      BOOL v7 = 0;
      uint64_t v8 = self->_contact;
      self->_contact = v6;
    }
    else
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v8 = [(SLPerson *)self handle];
      int v10 = [v9 createMutableContactWithHandle:v8];
      char v11 = self->_contact;
      self->_contact = v10;

      BOOL v7 = 1;
    }

    self->_hasMutableContact = v7;
    contact = self->_contact;
  }
  return contact;
}

- (NSData)thumbnailImageData
{
  thumbnailImageData = self->_thumbnailImageData;
  if (!thumbnailImageData)
  {
    id v4 = [(SLPerson *)self contact];
    if ([MEMORY[0x1E4F1B9C0] croppedImageDataAvailableForContact:v4])
    {
      id v5 = objc_alloc(MEMORY[0x1E4F1B9C0]);
      id v6 = [(SLPerson *)self contactStore];
      BOOL v7 = (void *)[v5 initWithContactStore:v6];

      uint64_t v8 = [v7 croppedImageDataForContact:v4];
      uint64_t v9 = self->_thumbnailImageData;
      self->_thumbnailImageData = v8;
    }
    thumbnailImageData = self->_thumbnailImageData;
  }
  return thumbnailImageData;
}

- (id)fetchCNContactWithHandle:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = SLGeneralTelemetryLogHandle();
    os_signpost_id_t v6 = os_signpost_id_generate(v5);

    BOOL v7 = SLGeneralTelemetryLogHandle();
    uint64_t v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19BE17000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SLPersonFetchCNContact", "", buf, 2u);
    }

    uint64_t v9 = +[SLPerson predicateForHandle:v4];
    int v10 = +[SLPerson keysForCNContact];
    if (!self->_contactStore)
    {
      char v11 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E4F1B980]);
      contactStore = self->_contactStore;
      self->_contactStore = v11;
    }
    id v13 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v4;
      _os_log_impl(&dword_19BE17000, v13, OS_LOG_TYPE_DEFAULT, "Fetching CNContact for handle %@.", buf, 0xCu);
    }

    v14 = self->_contactStore;
    id v23 = 0;
    objc_super v15 = [(CNContactStore *)v14 unifiedContactsMatchingPredicate:v9 keysToFetch:v10 error:&v23];
    uint64_t v16 = v23;
    char v17 = [v15 firstObject];

    v18 = SLFrameworkLogHandle();
    objc_super v19 = v18;
    if (v16)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[SLPerson fetchCNContactWithHandle:](v16, v19);
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v17;
      _os_log_impl(&dword_19BE17000, v19, OS_LOG_TYPE_DEFAULT, "Fetched CNContact %@.", buf, 0xCu);
    }

    if (!v17)
    {
      char v17 = [(id)objc_opt_class() createMutableContactWithHandle:v4];
    }
    v20 = SLGeneralTelemetryLogHandle();
    int v21 = v20;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19BE17000, v21, OS_SIGNPOST_INTERVAL_END, v6, "SLPersonFetchCNContact", "", buf, 2u);
    }
  }
  else
  {
    uint64_t v16 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SLPerson fetchCNContactWithHandle:]();
    }
    char v17 = 0;
  }

  return v17;
}

+ (id)createMutableContactWithHandle:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (![v3 length])
  {
    os_signpost_id_t v6 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SLPerson fetchCNContactWithHandle:]();
    }
    goto LABEL_11;
  }
  id v4 = v3;
  if ([v4 length])
  {
    id v5 = [v4 lowercaseString];
    if ([v5 hasPrefix:@"urn:biz:"])
    {

      goto LABEL_9;
    }
    int v7 = [v5 hasPrefix:@"biz:"];

    if (v7)
    {
LABEL_9:
      os_signpost_id_t v6 = SLFrameworkLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        +[SLPerson createMutableContactWithHandle:]();
      }
LABEL_11:
      id v8 = 0;
      goto LABEL_12;
    }
  }
  else
  {
  }
  int v10 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl(&dword_19BE17000, v10, OS_LOG_TYPE_DEFAULT, "Creating a CNContact for handle %@.", buf, 0xCu);
  }

  if (SLHandleIsEmail(v4))
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
    char v11 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:0 value:v4];
    uint64_t v16 = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
    [v8 setEmailAddresses:v12];
LABEL_21:

    goto LABEL_23;
  }
  if (SLHandleIsPhoneNumber(v4))
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
    id v13 = (void *)MEMORY[0x1E4F1BA20];
    v14 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v4];
    char v11 = [v13 labeledValueWithLabel:0 value:v14];

    objc_super v15 = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    [v8 setPhoneNumbers:v12];
    goto LABEL_21;
  }
  id v8 = 0;
LABEL_23:
  os_signpost_id_t v6 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v8;
    _os_log_impl(&dword_19BE17000, v6, OS_LOG_TYPE_DEFAULT, "Created contact: %@.", buf, 0xCu);
  }
LABEL_12:

  return v8;
}

+ (id)fetchMeContact
{
  if (fetchMeContact_oncePredicate != -1) {
    dispatch_once(&fetchMeContact_oncePredicate, &__block_literal_global_7);
  }
  v2 = (void *)fetchMeContact_meContact;
  return v2;
}

void __26__SLPerson_fetchMeContact__block_invoke()
{
  v0 = +[SLPerson keysForCNContact];
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F1B908]) initWithKeysToFetch:v0];
  v2 = [MEMORY[0x1E4F1B8F8] predicateForMeContact];
  [v1 setPredicate:v2];

  id v3 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  id v10 = 0;
  id v4 = [v3 executeFetchRequest:v1 error:&v10];
  id v5 = v10;

  os_signpost_id_t v6 = [v4 value];
  if (v5)
  {
    int v7 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __26__SLPerson_fetchMeContact__block_invoke_cold_1();
    }
  }
  uint64_t v8 = [v6 firstObject];
  uint64_t v9 = (void *)fetchMeContact_meContact;
  fetchMeContact_meContact = v8;
}

+ (id)predicateForHandle:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    if (SLHandleIsPhoneNumber(v3))
    {
      id v4 = (void *)MEMORY[0x1E4F1B8F8];
      id v5 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v3];
      os_signpost_id_t v6 = [v4 predicateForContactsMatchingPhoneNumber:v5];

      goto LABEL_10;
    }
    if (SLHandleIsEmail(v3))
    {
      os_signpost_id_t v6 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:v3];
      goto LABEL_10;
    }
    int v7 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[SLPerson predicateForHandle:]();
    }
  }
  os_signpost_id_t v6 = 0;
LABEL_10:

  return v6;
}

+ (id)keysForCNContact
{
  if (keysForCNContact_onceToken != -1) {
    dispatch_once(&keysForCNContact_onceToken, &__block_literal_global_59);
  }
  v2 = (void *)keysForCNContact_keys;
  return v2;
}

void __28__SLPerson_keysForCNContact__block_invoke()
{
  v9[6] = *MEMORY[0x1E4F143B8];
  int v0 = SLIsRunningInDaemon();
  uint64_t v1 = *MEMORY[0x1E4F1ADC8];
  if (v0)
  {
    v9[0] = *MEMORY[0x1E4F1AE08];
    v9[1] = v1;
    uint64_t v2 = *MEMORY[0x1E4F1AF98];
    v9[2] = *MEMORY[0x1E4F1AEE0];
    v9[3] = v2;
    v9[4] = *MEMORY[0x1E4F1AE20];
    id v3 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
    v9[5] = v3;
    id v4 = v9;
  }
  else
  {
    v8[0] = *MEMORY[0x1E4F1AE08];
    v8[1] = v1;
    uint64_t v5 = *MEMORY[0x1E4F1AF98];
    v8[2] = *MEMORY[0x1E4F1AEE0];
    v8[3] = v5;
    v8[4] = *MEMORY[0x1E4F1AE20];
    id v3 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
    v8[5] = v3;
    id v4 = v8;
  }
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:6];
  int v7 = (void *)keysForCNContact_keys;
  keysForCNContact_keys = v6;
}

- (unint64_t)hash
{
  id v3 = [(SLPerson *)self handle];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(SLPerson *)self displayName];
  uint64_t v6 = [v5 hash] ^ v4;
  int v7 = [(SLPerson *)self shortDisplayName];
  unint64_t v8 = v6 ^ [v7 hash];

  if (![(SLPerson *)self hasMutableContact])
  {
    uint64_t v9 = [(SLPerson *)self contact];
    v8 ^= [v9 hash];
  }
  return v8;
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setShortDisplayName:(id)a3
{
}

- (void)setContact:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (BOOL)hasMutableContact
{
  return self->_hasMutableContact;
}

- (void)setHasMutableContact:(BOOL)a3
{
  self->_hasMutableContact = a3;
}

- (void)setThumbnailImageData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailImageData, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_shortDisplayName, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

- (void)initWithPortraitPerson:error:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_19BE17000, v0, OS_LOG_TYPE_DEBUG, "SLP falling back to handle as displayName.", v1, 2u);
}

- (void)dictionaryRepresentation
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "SLP contact was nil. Failing dictionary serialization.", v2, v3, v4, v5, v6);
}

- (void)fetchCNContactWithHandle:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "Failed to create contact for handle: %@", v2, v3, v4, v5, v6);
}

- (void)fetchCNContactWithHandle:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 localizedDescription];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_19BE17000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch a CNContact. Error: %@", v4, 0xCu);
}

+ (void)createMutableContactWithHandle:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "Refusing to create contact for business handle: %@", v2, v3, v4, v5, v6);
}

void __26__SLPerson_fetchMeContact__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "Could not fetch MeCard from CNContactStore:%@", v2, v3, v4, v5, v6);
}

+ (void)predicateForHandle:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "Failed to determine handle type for handle %@.", v2, v3, v4, v5, v6);
}

@end