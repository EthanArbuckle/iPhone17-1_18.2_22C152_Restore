@interface PKInAppPaymentPresentationHostContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHostContext:(id)a3;
- (BOOL)omitPresentationTarget;
- (NSData)analyticsArchivedSessionToken;
- (NSString)analyticsSubject;
- (NSString)applicationIdentifier;
- (NSString)applicationName;
- (NSString)bundleIdentifier;
- (NSString)identifier;
- (NSString)sceneBundleIdentifier;
- (NSString)sceneIdentifier;
- (NSString)teamID;
- (PKInAppPaymentPresentationHostContext)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAnalyticsArchivedSessionToken:(id)a3;
- (void)setAnalyticsSubject:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setApplicationName:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setOmitPresentationTarget:(BOOL)a3;
- (void)setSceneBundleIdentifier:(id)a3;
- (void)setSceneIdentifier:(id)a3;
- (void)setTeamID:(id)a3;
@end

@implementation PKInAppPaymentPresentationHostContext

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[PKInAppPaymentPresentationHostContext allocWithZone:a3] init];
  uint64_t v5 = [(NSString *)self->_identifier copy];
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_sceneIdentifier copy];
  sceneIdentifier = v4->_sceneIdentifier;
  v4->_sceneIdentifier = (NSString *)v7;

  uint64_t v9 = [(NSString *)self->_teamID copy];
  teamID = v4->_teamID;
  v4->_teamID = (NSString *)v9;

  uint64_t v11 = [(NSString *)self->_applicationName copy];
  applicationName = v4->_applicationName;
  v4->_applicationName = (NSString *)v11;

  uint64_t v13 = [(NSString *)self->_bundleIdentifier copy];
  bundleIdentifier = v4->_bundleIdentifier;
  v4->_bundleIdentifier = (NSString *)v13;

  uint64_t v15 = [(NSString *)self->_applicationIdentifier copy];
  applicationIdentifier = v4->_applicationIdentifier;
  v4->_applicationIdentifier = (NSString *)v15;

  uint64_t v17 = [(NSString *)self->_sceneBundleIdentifier copy];
  sceneBundleIdentifier = v4->_sceneBundleIdentifier;
  v4->_sceneBundleIdentifier = (NSString *)v17;

  v4->_omitPresentationTarget = self->_omitPresentationTarget;
  return v4;
}

- (PKInAppPaymentPresentationHostContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKInAppPaymentPresentationHostContext;
  uint64_t v5 = [(PKInAppPaymentPresentationHostContext *)&v14 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(PKInAppPaymentPresentationHostContext *)v5 setIdentifier:v6];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sceneIdentifier"];
    [(PKInAppPaymentPresentationHostContext *)v5 setSceneIdentifier:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"teamID"];
    [(PKInAppPaymentPresentationHostContext *)v5 setTeamID:v8];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationName"];
    [(PKInAppPaymentPresentationHostContext *)v5 setApplicationName:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    [(PKInAppPaymentPresentationHostContext *)v5 setBundleIdentifier:v10];

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationIdentifier"];
    [(PKInAppPaymentPresentationHostContext *)v5 setApplicationIdentifier:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sceneBundleIdentifier"];
    [(PKInAppPaymentPresentationHostContext *)v5 setSceneBundleIdentifier:v12];

    -[PKInAppPaymentPresentationHostContext setOmitPresentationTarget:](v5, "setOmitPresentationTarget:", [v4 decodeBoolForKey:@"omitPresentationTarget"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  id v4 = [(PKInAppPaymentPresentationHostContext *)self identifier];
  [v11 encodeObject:v4 forKey:@"identifier"];

  uint64_t v5 = [(PKInAppPaymentPresentationHostContext *)self sceneIdentifier];
  [v11 encodeObject:v5 forKey:@"sceneIdentifier"];

  v6 = [(PKInAppPaymentPresentationHostContext *)self teamID];
  [v11 encodeObject:v6 forKey:@"teamID"];

  uint64_t v7 = [(PKInAppPaymentPresentationHostContext *)self applicationName];
  [v11 encodeObject:v7 forKey:@"applicationName"];

  v8 = [(PKInAppPaymentPresentationHostContext *)self bundleIdentifier];
  [v11 encodeObject:v8 forKey:@"bundleIdentifier"];

  uint64_t v9 = [(PKInAppPaymentPresentationHostContext *)self applicationIdentifier];
  [v11 encodeObject:v9 forKey:@"applicationIdentifier"];

  v10 = [(PKInAppPaymentPresentationHostContext *)self sceneBundleIdentifier];
  [v11 encodeObject:v10 forKey:@"sceneBundleIdentifier"];

  objc_msgSend(v11, "encodeBool:forKey:", -[PKInAppPaymentPresentationHostContext omitPresentationTarget](self, "omitPresentationTarget"), @"omitPresentationTarget");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_sceneIdentifier];
  [v3 safelyAddObject:self->_teamID];
  [v3 safelyAddObject:self->_applicationName];
  [v3 safelyAddObject:self->_bundleIdentifier];
  [v3 safelyAddObject:self->_applicationName];
  [v3 safelyAddObject:self->_sceneBundleIdentifier];
  id v4 = [NSNumber numberWithBool:self->_omitPresentationTarget];
  [v3 safelyAddObject:v4];

  v8.receiver = self;
  v8.super_class = (Class)PKInAppPaymentPresentationHostContext;
  id v5 = [(PKInAppPaymentPresentationHostContext *)&v8 hash];
  unint64_t v6 = PKCombinedHash((uint64_t)v5, v3);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKInAppPaymentPresentationHostContext *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKInAppPaymentPresentationHostContext *)self isEqualToHostContext:v5];

  return v6;
}

- (BOOL)isEqualToHostContext:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    identifier = self->_identifier;
    uint64_t v7 = [v4 identifier];
    objc_super v8 = identifier;
    uint64_t v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {
    }
    else
    {
      LOBYTE(v11) = 0;
      if (!v8 || !v9)
      {
        uint64_t v15 = v9;
LABEL_58:

        goto LABEL_59;
      }
      BOOL v12 = [(NSString *)v8 isEqualToString:v9];

      if (!v12)
      {
        LOBYTE(v11) = 0;
LABEL_60:

        goto LABEL_61;
      }
    }
    sceneIdentifier = self->_sceneIdentifier;
    objc_super v14 = [v5 sceneIdentifier];
    uint64_t v15 = sceneIdentifier;
    v16 = v14;
    objc_super v8 = v16;
    if (v15 == v16)
    {
    }
    else
    {
      LOBYTE(v11) = 0;
      if (!v15 || !v16)
      {
        v20 = v16;
LABEL_57:

        goto LABEL_58;
      }
      BOOL v17 = [(NSString *)v15 isEqualToString:v16];

      if (!v17)
      {
        LOBYTE(v11) = 0;
LABEL_59:

        goto LABEL_60;
      }
    }
    teamID = self->_teamID;
    v19 = [v5 teamID];
    v20 = teamID;
    v21 = v19;
    uint64_t v15 = v21;
    if (v20 == v21)
    {
    }
    else
    {
      LOBYTE(v11) = 0;
      if (!v20 || !v21)
      {
        v25 = v21;
LABEL_56:

        goto LABEL_57;
      }
      BOOL v22 = [(NSString *)v20 isEqualToString:v21];

      if (!v22)
      {
        LOBYTE(v11) = 0;
        goto LABEL_58;
      }
    }
    applicationName = self->_applicationName;
    v24 = [v5 applicationName];
    v25 = applicationName;
    v26 = v24;
    v20 = v26;
    if (v25 == v26)
    {
    }
    else
    {
      LOBYTE(v11) = 0;
      if (!v25 || !v26)
      {
        v30 = v26;
LABEL_55:

        goto LABEL_56;
      }
      BOOL v27 = [(NSString *)v25 isEqualToString:v26];

      if (!v27)
      {
        LOBYTE(v11) = 0;
        goto LABEL_57;
      }
    }
    bundleIdentifier = self->_bundleIdentifier;
    v29 = [v5 bundleIdentifier];
    v30 = bundleIdentifier;
    v31 = v29;
    v25 = v31;
    if (v30 == v31)
    {
    }
    else
    {
      LOBYTE(v11) = 0;
      if (!v30 || !v31)
      {
        v34 = v31;
LABEL_54:

        goto LABEL_55;
      }
      BOOL v11 = [(NSString *)v30 isEqualToString:v31];

      if (!v11) {
        goto LABEL_56;
      }
    }
    v32 = self->_applicationName;
    v33 = [v5 applicationName];
    v34 = v32;
    v35 = v33;
    v30 = v35;
    if (v34 == v35)
    {
    }
    else
    {
      if (!v34 || !v35)
      {

        goto LABEL_53;
      }
      BOOL v11 = [(NSString *)v34 isEqualToString:v35];

      if (!v11) {
        goto LABEL_55;
      }
    }
    sceneBundleIdentifier = self->_sceneBundleIdentifier;
    v37 = [v5 sceneBundleIdentifier];
    v38 = sceneBundleIdentifier;
    v39 = v37;
    v34 = v39;
    if (v38 == v39)
    {

LABEL_51:
      int omitPresentationTarget = self->_omitPresentationTarget;
      LOBYTE(v11) = omitPresentationTarget == [v5 omitPresentationTarget];
      goto LABEL_54;
    }
    if (v38 && v39)
    {
      BOOL v42 = [(NSString *)v38 isEqualToString:v39];

      if (!v42) {
        goto LABEL_53;
      }
      goto LABEL_51;
    }

LABEL_53:
    LOBYTE(v11) = 0;
    goto LABEL_54;
  }
  LOBYTE(v11) = 0;
LABEL_61:

  return v11;
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (void)setApplicationName:(id)a3
{
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void)setSceneIdentifier:(id)a3
{
}

- (NSString)sceneBundleIdentifier
{
  return self->_sceneBundleIdentifier;
}

- (void)setSceneBundleIdentifier:(id)a3
{
}

- (NSString)teamID
{
  return self->_teamID;
}

- (void)setTeamID:(id)a3
{
}

- (BOOL)omitPresentationTarget
{
  return self->_omitPresentationTarget;
}

- (void)setOmitPresentationTarget:(BOOL)a3
{
  self->_int omitPresentationTarget = a3;
}

- (NSString)analyticsSubject
{
  return self->_analyticsSubject;
}

- (void)setAnalyticsSubject:(id)a3
{
}

- (NSData)analyticsArchivedSessionToken
{
  return self->_analyticsArchivedSessionToken;
}

- (void)setAnalyticsArchivedSessionToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsArchivedSessionToken, 0);
  objc_storeStrong((id *)&self->_analyticsSubject, 0);
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_sceneBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);
}

@end