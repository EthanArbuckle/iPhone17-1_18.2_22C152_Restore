@interface SFPeopleSuggestion
+ (BOOL)supportsSecureCoding;
+ (id)TTRPeopleSuggestion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroup;
- (BOOL)isPlaceholder;
- (BOOL)isRestricted;
- (BOOL)isTapToRadar;
- (INImage)donatedImage;
- (NSArray)contacts;
- (NSArray)formattedHandles;
- (NSString)description;
- (NSString)deviceModelIdentifier;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)transportBundleIdentifier;
- (SFPeopleSuggestion)initWithCoder:(id)a3;
- (SFPeopleSuggestion)initWithIdentifier:(id)a3 displayName:(id)a4 transportBundleIdentifier:(id)a5 contact:(id)a6 deviceModelIdentifier:(id)a7;
- (SFPeopleSuggestion)initWithIdentifier:(id)a3 displayName:(id)a4 transportBundleIdentifier:(id)a5 contacts:(id)a6 formattedHandles:(id)a7 donatedImage:(id)a8 placeholder:(BOOL)a9;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIsRestricted:(BOOL)a3;
@end

@implementation SFPeopleSuggestion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)TTRPeopleSuggestion
{
  v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = objc_alloc((Class)a1);
  v5 = [v3 UUIDString];
  LOBYTE(v8) = 0;
  v6 = (void *)[v4 initWithIdentifier:v5 displayName:@"File radar" transportBundleIdentifier:@"com.apple.TapToRadar.shareextension" contacts:MEMORY[0x1E4F1CBF0] formattedHandles:MEMORY[0x1E4F1CBF0] donatedImage:0 placeholder:v8];

  return v6;
}

- (SFPeopleSuggestion)initWithIdentifier:(id)a3 displayName:(id)a4 transportBundleIdentifier:(id)a5 contacts:(id)a6 formattedHandles:(id)a7 donatedImage:(id)a8 placeholder:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v33.receiver = self;
  v33.super_class = (Class)SFPeopleSuggestion;
  v21 = [(SFPeopleSuggestion *)&v33 init];
  if (v21)
  {
    uint64_t v22 = [v15 copy];
    identifier = v21->_identifier;
    v21->_identifier = (NSString *)v22;

    uint64_t v24 = [v16 copy];
    displayName = v21->_displayName;
    v21->_displayName = (NSString *)v24;

    uint64_t v26 = [v17 copy];
    transportBundleIdentifier = v21->_transportBundleIdentifier;
    v21->_transportBundleIdentifier = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    contacts = v21->_contacts;
    v21->_contacts = (NSArray *)v28;

    uint64_t v30 = [v19 copy];
    formattedHandles = v21->_formattedHandles;
    v21->_formattedHandles = (NSArray *)v30;

    objc_storeStrong((id *)&v21->_donatedImage, a8);
    v21->_isPlaceholder = a9;
  }

  return v21;
}

- (SFPeopleSuggestion)initWithIdentifier:(id)a3 displayName:(id)a4 transportBundleIdentifier:(id)a5 contact:(id)a6 deviceModelIdentifier:(id)a7
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)SFPeopleSuggestion;
  id v17 = [(SFPeopleSuggestion *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    displayName = v17->_displayName;
    v17->_displayName = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    transportBundleIdentifier = v17->_transportBundleIdentifier;
    v17->_transportBundleIdentifier = (NSString *)v22;

    uint64_t v24 = [v16 copy];
    deviceModelIdentifier = v17->_deviceModelIdentifier;
    v17->_deviceModelIdentifier = (NSString *)v24;

    if (v15)
    {
      v30[0] = v15;
      uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
      contacts = v17->_contacts;
      v17->_contacts = (NSArray *)v26;
    }
    else
    {
      contacts = v17->_contacts;
      v17->_contacts = (NSArray *)MEMORY[0x1E4F1CBF0];
    }

    v17->_isPlaceholder = 0;
  }

  return v17;
}

- (SFPeopleSuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  v6 = [v4 decodeObjectOfClasses:v5 forKey:@"displayName"];

  v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  v31 = [v4 decodeObjectOfClasses:v7 forKey:@"identifier"];

  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"transportBundleIdentifier"];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2050000000;
  id v12 = (void *)getCNContactClass_softClass;
  uint64_t v40 = getCNContactClass_softClass;
  if (!getCNContactClass_softClass)
  {
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    v34 = __getCNContactClass_block_invoke;
    v35 = &unk_1E5BBBFF8;
    v36 = &v37;
    __getCNContactClass_block_invoke((uint64_t)&v32);
    id v12 = (void *)v38[3];
  }
  id v13 = v12;
  _Block_object_dispose(&v37, 8);
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2050000000;
  id v14 = (void *)getCNMutableContactClass_softClass;
  uint64_t v40 = getCNMutableContactClass_softClass;
  if (!getCNMutableContactClass_softClass)
  {
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    v34 = __getCNMutableContactClass_block_invoke;
    v35 = &unk_1E5BBBFF8;
    v36 = &v37;
    __getCNMutableContactClass_block_invoke((uint64_t)&v32);
    id v14 = (void *)v38[3];
  }
  id v15 = self;
  id v16 = v14;
  _Block_object_dispose(&v37, 8);
  id v17 = objc_msgSend(v10, "setWithObjects:", v11, v13, v16, 0);
  uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"contacts"];

  id v19 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v20 = objc_opt_class();
  v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"formattedHandles"];

  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2050000000;
  v23 = (void *)getINImageClass_softClass;
  uint64_t v40 = getINImageClass_softClass;
  if (!getINImageClass_softClass)
  {
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    v34 = __getINImageClass_block_invoke;
    v35 = &unk_1E5BBBFF8;
    v36 = &v37;
    __getINImageClass_block_invoke((uint64_t)&v32);
    v23 = (void *)v38[3];
  }
  id v24 = v23;
  _Block_object_dispose(&v37, 8);
  v25 = [v4 decodeObjectOfClass:v24 forKey:@"donatedImage"];
  LOBYTE(v30) = [v4 decodeBoolForKey:@"isPlaceholder"];
  uint64_t v26 = [(SFPeopleSuggestion *)v15 initWithIdentifier:v31 displayName:v6 transportBundleIdentifier:v9 contacts:v18 formattedHandles:v22 donatedImage:v25 placeholder:v30];
  if (v26)
  {
    v26->_isRestricted = [v4 decodeBoolForKey:@"isRestricted"];
    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceModelIdentifier"];
    deviceModelIdentifier = v26->_deviceModelIdentifier;
    v26->_deviceModelIdentifier = (NSString *)v27;
  }
  return v26;
}

- (void)encodeWithCoder:(id)a3
{
  displayName = self->_displayName;
  id v5 = a3;
  [v5 encodeObject:displayName forKey:@"displayName"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeObject:self->_transportBundleIdentifier forKey:@"transportBundleIdentifier"];
  [v5 encodeObject:self->_deviceModelIdentifier forKey:@"deviceModelIdentifier"];
  [v5 encodeObject:self->_contacts forKey:@"contacts"];
  [v5 encodeObject:self->_formattedHandles forKey:@"formattedHandles"];
  [v5 encodeObject:self->_donatedImage forKey:@"donatedImage"];
  [v5 encodeBool:self->_isRestricted forKey:@"isRestricted"];
  [v5 encodeBool:self->_isPlaceholder forKey:@"isPlaceholder"];
}

- (BOOL)isTapToRadar
{
  v2 = [(SFPeopleSuggestion *)self transportBundleIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.TapToRadar.shareextension"];

  return v3;
}

- (NSString)description
{
  char v3 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)SFPeopleSuggestion;
  id v4 = [(SFPeopleSuggestion *)&v15 description];
  id v5 = [(SFPeopleSuggestion *)self displayName];
  v6 = [(SFPeopleSuggestion *)self identifier];
  v7 = [(SFPeopleSuggestion *)self transportBundleIdentifier];
  uint64_t v8 = [(SFPeopleSuggestion *)self deviceModelIdentifier];
  v9 = [(SFPeopleSuggestion *)self contacts];
  v10 = [(SFPeopleSuggestion *)self donatedImage];
  [(SFPeopleSuggestion *)self isRestricted];
  uint64_t v11 = NSStringFromBOOL();
  [(SFPeopleSuggestion *)self isPlaceholder];
  id v12 = NSStringFromBOOL();
  id v13 = [v3 stringWithFormat:@"<%@ displayName:%@ identifier:%@ transportBundleIdentifier:%@ deviceModelIdentifier:%{private}@ contacts:%@ donatedImage:%@ isRestricted:%@ isPlaceholder:%@>", v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (unint64_t)hash
{
  char v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [v4 hash];

  v6 = [(SFPeopleSuggestion *)self identifier];
  unint64_t v7 = [v6 hash] ^ v5;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFPeopleSuggestion *)a3;
  if (self == v4)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      v6 = [(SFPeopleSuggestion *)self identifier];
      unint64_t v7 = [(SFPeopleSuggestion *)v5 identifier];
      id v8 = v6;
      id v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {
      }
      else
      {
        if ((v8 == 0) == (v9 != 0))
        {
          LOBYTE(v12) = 0;
          id v17 = v9;
          id v15 = v8;
          goto LABEL_54;
        }
        int v11 = [v8 isEqual:v9];

        if (!v11)
        {
          LOBYTE(v12) = 0;
LABEL_55:

          goto LABEL_56;
        }
      }
      id v13 = [(SFPeopleSuggestion *)self displayName];
      id v14 = [(SFPeopleSuggestion *)v5 displayName];
      id v15 = v13;
      id v16 = v14;
      id v17 = v16;
      if (v15 == v16)
      {
      }
      else
      {
        if ((v15 == 0) == (v16 != 0))
        {
          LOBYTE(v12) = 0;
          v23 = v16;
          id v21 = v15;
          goto LABEL_53;
        }
        int v18 = [v15 isEqual:v16];

        if (!v18)
        {
          LOBYTE(v12) = 0;
LABEL_54:

          goto LABEL_55;
        }
      }
      id v19 = [(SFPeopleSuggestion *)self transportBundleIdentifier];
      uint64_t v20 = [(SFPeopleSuggestion *)v5 transportBundleIdentifier];
      id v21 = v19;
      id v22 = v20;
      v23 = v22;
      if (v21 == v22)
      {

        id v61 = v21;
      }
      else
      {
        if ((v21 == 0) == (v22 != 0))
        {
          LOBYTE(v12) = 0;
          uint64_t v32 = v22;
          id v28 = v21;
LABEL_52:

          goto LABEL_53;
        }
        id v24 = v21;
        int v25 = [v21 isEqual:v22];

        id v61 = v24;
        if (!v25)
        {
          LOBYTE(v12) = 0;
          id v21 = v24;
LABEL_53:

          goto LABEL_54;
        }
      }
      v59 = v23;
      uint64_t v26 = [(SFPeopleSuggestion *)self deviceModelIdentifier];
      uint64_t v27 = [(SFPeopleSuggestion *)v5 deviceModelIdentifier];
      id v28 = v26;
      id v29 = v27;
      id v60 = v29;
      if (v28 == v29)
      {
      }
      else
      {
        uint64_t v30 = v29;
        if ((v28 == 0) == (v29 != 0))
        {
          LOBYTE(v12) = 0;
          uint64_t v40 = v29;
          v41 = v28;
          v23 = v59;
LABEL_50:

          goto LABEL_51;
        }
        int v31 = [v28 isEqual:v29];

        if (!v31)
        {
          LOBYTE(v12) = 0;
          v23 = v59;
LABEL_51:
          uint64_t v32 = v60;
          id v21 = v61;
          goto LABEL_52;
        }
      }
      id v56 = v28;
      uint64_t v33 = [(SFPeopleSuggestion *)self contacts];
      v34 = [(SFPeopleSuggestion *)v5 contacts];
      id v35 = v33;
      id v36 = v34;
      id v57 = v36;
      id v58 = v35;
      if (v35 == v36)
      {
      }
      else
      {
        uint64_t v37 = v36;
        if ((v35 == 0) == (v36 != 0))
        {
          LOBYTE(v12) = 0;
          v49 = v36;
          id v46 = v35;
          goto LABEL_43;
        }
        v38 = v35;
        int v39 = [v35 isEqual:v36];

        if (!v39)
        {
          LOBYTE(v12) = 0;
          v23 = v59;
          id v28 = v56;
LABEL_49:
          uint64_t v40 = v57;
          v41 = v58;
          goto LABEL_50;
        }
      }
      v42 = [(SFPeopleSuggestion *)self donatedImage];
      v43 = [(SFPeopleSuggestion *)v5 donatedImage];
      id v44 = v42;
      id v45 = v43;
      id v46 = v44;
      v47 = v45;
      if (v46 == v45)
      {
        id v55 = v45;

        goto LABEL_40;
      }
      if ((v46 == 0) != (v45 != 0))
      {
        int v48 = [v46 isEqual:v45];
        id v55 = v47;

        if (!v48)
        {
          LOBYTE(v12) = 0;
          v23 = v59;
          id v28 = v56;
LABEL_47:
          v49 = v55;
          goto LABEL_48;
        }
LABEL_40:
        BOOL v50 = [(SFPeopleSuggestion *)self isRestricted];
        id v28 = v56;
        if (v50 == [(SFPeopleSuggestion *)v5 isRestricted])
        {
          BOOL v51 = [(SFPeopleSuggestion *)self isPlaceholder];
          BOOL v52 = v51 == [(SFPeopleSuggestion *)v5 isPlaceholder];
          v23 = v59;
          if (v52)
          {
            BOOL v53 = [(SFPeopleSuggestion *)self isTapToRadar];
            BOOL v12 = v53 ^ [(SFPeopleSuggestion *)v5 isTapToRadar] ^ 1;
          }
          else
          {
            LOBYTE(v12) = 0;
          }
        }
        else
        {
          LOBYTE(v12) = 0;
          v23 = v59;
        }
        goto LABEL_47;
      }

      v49 = v47;
      LOBYTE(v12) = 0;
LABEL_43:
      v23 = v59;
      id v28 = v56;
LABEL_48:

      goto LABEL_49;
    }
    LOBYTE(v12) = 0;
  }
LABEL_56:

  return v12;
}

- (BOOL)isGroup
{
  v2 = [(SFPeopleSuggestion *)self contacts];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)transportBundleIdentifier
{
  return self->_transportBundleIdentifier;
}

- (NSString)deviceModelIdentifier
{
  return self->_deviceModelIdentifier;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (NSArray)formattedHandles
{
  return self->_formattedHandles;
}

- (INImage)donatedImage
{
  return self->_donatedImage;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (BOOL)isRestricted
{
  return self->_isRestricted;
}

- (void)setIsRestricted:(BOOL)a3
{
  self->_isRestricted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_donatedImage, 0);
  objc_storeStrong((id *)&self->_formattedHandles, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_deviceModelIdentifier, 0);
  objc_storeStrong((id *)&self->_transportBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end