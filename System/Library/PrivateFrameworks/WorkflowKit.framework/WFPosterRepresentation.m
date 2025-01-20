@interface WFPosterRepresentation
+ (BOOL)supportsSecureCoding;
+ (id)defaultPoster;
+ (id)posterWithSerializedRepresentation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (NSString)providerBundleIdentifier;
- (NSString)wfName;
- (NSUUID)UUID;
- (WFPosterRepresentation)initWithCoder:(id)a3;
- (WFPosterRepresentation)initWithUUID:(id)a3 name:(id)a4 providerBundleIdentifier:(id)a5;
- (id)description;
- (id)serializedRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFPosterRepresentation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (NSString)providerBundleIdentifier
{
  return self->_providerBundleIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFPosterRepresentation *)self UUID];
  [v4 encodeObject:v5 forKey:@"UUID"];

  v6 = [(WFPosterRepresentation *)self name];
  [v4 encodeObject:v6 forKey:@"name"];

  id v7 = [(WFPosterRepresentation *)self providerBundleIdentifier];
  [v4 encodeObject:v7 forKey:@"providerBundleIdentifier"];
}

- (WFPosterRepresentation)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFPosterRepresentation;
  v5 = [(WFPosterRepresentation *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"providerBundleIdentifier"];
    providerBundleIdentifier = v5->_providerBundleIdentifier;
    v5->_providerBundleIdentifier = (NSString *)v10;

    v12 = v5;
  }

  return v5;
}

- (unint64_t)hash
{
  v3 = [(WFPosterRepresentation *)self UUID];
  uint64_t v4 = [v3 hash];
  v5 = [(WFPosterRepresentation *)self name];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(WFPosterRepresentation *)self providerBundleIdentifier];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (WFPosterRepresentation *)a3;
  v5 = v4;
  if (self != v4)
  {
    uint64_t v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_27:

      goto LABEL_28;
    }
    id v7 = [(WFPosterRepresentation *)self UUID];
    unint64_t v8 = [(WFPosterRepresentation *)v6 UUID];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      id v14 = v9;
      if (!v9 || !v10) {
        goto LABEL_25;
      }
      int v15 = [v9 isEqual:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    v16 = [(WFPosterRepresentation *)self name];
    v17 = [(WFPosterRepresentation *)v6 name];
    id v14 = v16;
    id v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      id v20 = v14;
      if (!v14 || !v18)
      {
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      int v12 = [v14 isEqualToString:v18];

      if (!v12) {
        goto LABEL_25;
      }
    }
    v21 = [(WFPosterRepresentation *)self providerBundleIdentifier];
    v22 = [(WFPosterRepresentation *)v6 providerBundleIdentifier];
    id v20 = v21;
    id v23 = v22;
    v19 = v23;
    if (v20 == v23)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v20 && v23) {
        LOBYTE(v12) = [v20 isEqualToString:v23];
      }
    }

    goto LABEL_24;
  }
  LOBYTE(v12) = 1;
LABEL_28:

  return v12;
}

- (NSString)wfName
{
  return (NSString *)WFLocalizedString(@"Wallpaper");
}

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)WFPosterRepresentation;
  uint64_t v4 = [(WFPosterRepresentation *)&v10 description];
  v5 = [(WFPosterRepresentation *)self UUID];
  uint64_t v6 = [(WFPosterRepresentation *)self name];
  id v7 = [(WFPosterRepresentation *)self providerBundleIdentifier];
  unint64_t v8 = [v3 stringWithFormat:@"<%@, UUID: %@, name: %@, providerBundleId: %@>", v4, v5, v6, v7];

  return v8;
}

- (id)serializedRepresentation
{
  v3 = objc_opt_new();
  uint64_t v4 = [(WFPosterRepresentation *)self UUID];
  v5 = [v4 UUIDString];
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v5, @"UUID");

  uint64_t v6 = [(WFPosterRepresentation *)self name];
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v6, @"name");

  id v7 = [(WFPosterRepresentation *)self providerBundleIdentifier];
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v7, @"providerBundleIdentifier");

  unint64_t v8 = (void *)[v3 copy];
  return v8;
}

- (WFPosterRepresentation)initWithUUID:(id)a3 name:(id)a4 providerBundleIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WFPosterRepresentation;
  int v12 = [(WFPosterRepresentation *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_UUID, a3);
    uint64_t v14 = [v10 copy];
    name = v13->_name;
    v13->_name = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    providerBundleIdentifier = v13->_providerBundleIdentifier;
    v13->_providerBundleIdentifier = (NSString *)v16;

    id v18 = v13;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultPoster
{
  v3 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
  uint64_t v4 = [v3 objectForKey:@"WFShortcutsDefaultPosterRepresentation"];

  v5 = [a1 posterWithSerializedRepresentation:v4];

  return v5;
}

+ (id)posterWithSerializedRepresentation:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [v4 objectForKey:@"UUID"];
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = 0;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
    id v8 = v6;

    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v8];
    if (v9)
    {
      id v10 = [v4 objectForKey:@"name"];
      if (v10)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v11 = v10;
        }
        else {
          id v11 = 0;
        }
      }
      else
      {
        id v11 = 0;
      }
      id v12 = v11;

      v13 = [v4 objectForKey:@"providerBundleIdentifier"];
      if (v13)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v14 = v13;
        }
        else {
          uint64_t v14 = 0;
        }
      }
      else
      {
        uint64_t v14 = 0;
      }
      id v15 = v14;

      id v7 = (void *)[objc_alloc((Class)a1) initWithUUID:v9 name:v12 providerBundleIdentifier:v15];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

@end