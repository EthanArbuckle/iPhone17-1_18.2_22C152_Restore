@interface WFExecutableAppShortcutIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)actionIdentifier;
- (NSString)basePhraseTemplate;
- (NSString)bundleIdentifier;
- (NSUUID)parameterIdentifier;
- (WFExecutableAppShortcutIdentifier)initWithBundleIdentifier:(id)a3 basePhraseTemplate:(id)a4 actionIdentifier:(id)a5 parameterIdentifier:(id)a6;
- (WFExecutableAppShortcutIdentifier)initWithCoder:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFExecutableAppShortcutIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterIdentifier, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_basePhraseTemplate, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (NSUUID)parameterIdentifier
{
  return self->_parameterIdentifier;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSString)basePhraseTemplate
{
  return self->_basePhraseTemplate;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFExecutableAppShortcutIdentifier *)self bundleIdentifier];
  [v4 encodeObject:v5 forKey:@"bundleIdentifier"];

  v6 = [(WFExecutableAppShortcutIdentifier *)self basePhraseTemplate];
  [v4 encodeObject:v6 forKey:@"basePhraseTemplate"];

  v7 = [(WFExecutableAppShortcutIdentifier *)self actionIdentifier];
  [v4 encodeObject:v7 forKey:@"actionIdentifier"];

  id v8 = [(WFExecutableAppShortcutIdentifier *)self parameterIdentifier];
  [v4 encodeObject:v8 forKey:@"parameterIdentifier"];
}

- (WFExecutableAppShortcutIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = [v4 decodeObjectOfClass:v5 forKey:@"bundleIdentifier"];

  v7 = self;
  id v8 = [v4 decodeObjectOfClass:v7 forKey:@"basePhraseTemplate"];

  v9 = self;
  v10 = [v4 decodeObjectOfClass:v9 forKey:@"actionIdentifier"];

  v11 = self;
  v12 = [v4 decodeObjectOfClass:v11 forKey:@"parameterIdentifier"];

  v13 = [(WFExecutableAppShortcutIdentifier *)self initWithBundleIdentifier:v6 basePhraseTemplate:v8 actionIdentifier:v10 parameterIdentifier:v12];
  return v13;
}

- (unint64_t)hash
{
  v3 = [(WFExecutableAppShortcutIdentifier *)self bundleIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(WFExecutableAppShortcutIdentifier *)self basePhraseTemplate];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(WFExecutableAppShortcutIdentifier *)self actionIdentifier];
  uint64_t v8 = [v7 hash];
  v9 = [(WFExecutableAppShortcutIdentifier *)self parameterIdentifier];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (WFExecutableAppShortcutIdentifier *)a3;
  v5 = v4;
  if (v4 != self)
  {
    uint64_t v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_35:

      goto LABEL_36;
    }
    v7 = [(WFExecutableAppShortcutIdentifier *)self bundleIdentifier];
    uint64_t v8 = [(WFExecutableAppShortcutIdentifier *)v6 bundleIdentifier];
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
        goto LABEL_33;
      }
      int v15 = [v9 isEqualToString:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    v16 = [(WFExecutableAppShortcutIdentifier *)self basePhraseTemplate];
    v17 = [(WFExecutableAppShortcutIdentifier *)v6 basePhraseTemplate];
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
      if (!v14 || !v18) {
        goto LABEL_32;
      }
      int v21 = [v14 isEqualToString:v18];

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_33:

        goto LABEL_34;
      }
    }
    v22 = [(WFExecutableAppShortcutIdentifier *)self actionIdentifier];
    v23 = [(WFExecutableAppShortcutIdentifier *)v6 actionIdentifier];
    id v20 = v22;
    id v24 = v23;
    id v31 = v20;
    v32 = v24;
    if (v20 != v24)
    {
      LOBYTE(v12) = 0;
      if (v20)
      {
        v25 = v24;
        if (v24)
        {
          int v12 = [v20 isEqualToString:v24];

          if (!v12)
          {
            v19 = v32;
LABEL_32:

            goto LABEL_33;
          }
          goto LABEL_24;
        }
      }
      else
      {
        v25 = v24;
      }
LABEL_31:

      id v20 = v31;
      v19 = v32;
      goto LABEL_32;
    }

LABEL_24:
    v26 = [(WFExecutableAppShortcutIdentifier *)self parameterIdentifier];
    v27 = [(WFExecutableAppShortcutIdentifier *)v6 parameterIdentifier];
    id v28 = v26;
    id v29 = v27;
    v25 = v29;
    if (v28 == v29)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v28 && v29) {
        LOBYTE(v12) = [v28 isEqual:v29];
      }
    }

    id v20 = v28;
    goto LABEL_31;
  }
  LOBYTE(v12) = 1;
LABEL_36:

  return v12;
}

- (WFExecutableAppShortcutIdentifier)initWithBundleIdentifier:(id)a3 basePhraseTemplate:(id)a4 actionIdentifier:(id)a5 parameterIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)WFExecutableAppShortcutIdentifier;
  int v15 = [(WFExecutableAppShortcutIdentifier *)&v19 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v16->_basePhraseTemplate, a4);
    objc_storeStrong((id *)&v16->_actionIdentifier, a5);
    objc_storeStrong((id *)&v16->_parameterIdentifier, a6);
    v17 = v16;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end