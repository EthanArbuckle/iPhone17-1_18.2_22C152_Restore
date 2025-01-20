@interface TUConversationActivity
+ (BOOL)supportsSecureCoding;
+ (id)lookupApplicationNameForBundleIdentifier:(id)a3;
+ (id)placeholderActivity;
- (BOOL)isEligibleForHandoff;
- (BOOL)isEligibleForWebBrowser;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConversationActivity:(id)a3;
- (BOOL)isEquivalentToActivity:(id)a3;
- (BOOL)isPlaceholderActivity;
- (BOOL)isScreenSharingActivity;
- (BOOL)isStaticActivity;
- (BOOL)isSupported;
- (BOOL)isSystemActivity;
- (BOOL)startWhenStaged;
- (NSData)applicationContext;
- (NSDate)timestamp;
- (NSString)activityIdentifier;
- (NSString)bundleIdentifier;
- (NSString)fallbackApplicationName;
- (NSString)representativeBundleIdentifier;
- (NSString)staticIdentifier;
- (NSUUID)UUID;
- (TUConversationActivity)initWithBundleIdentifier:(id)a3 metadata:(id)a4 applicationContext:(id)a5 uuid:(id)a6 activityIdentifier:(id)a7;
- (TUConversationActivity)initWithBundleIdentifier:(id)a3 metadata:(id)a4 applicationContext:(id)a5 uuid:(id)a6 activityIdentifier:(id)a7 fallbackApplicationName:(id)a8;
- (TUConversationActivity)initWithCoder:(id)a3;
- (TUConversationActivity)initWithCreationRequest:(id)a3 bundleIdentifier:(id)a4 systemActivity:(BOOL)a5;
- (TUConversationActivity)initWithMetadata:(id)a3 applicationContext:(id)a4 uuid:(id)a5 activityIdentifier:(id)a6;
- (TUConversationActivityContext)activityContext;
- (TUConversationActivityMetadata)metadata;
- (TUHandle)originator;
- (TUHandle)trustedFromHandle;
- (id)concatenatedDescription;
- (id)concatenatedMetadataDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)localizedApplicationName;
- (id)platformScreenSharingBundleIdentifier;
- (id)representativeDisplayName;
- (id)sanitizedCopy;
- (id)sanitizedCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityContext:(id)a3;
- (void)setActivityIdentifier:(id)a3;
- (void)setApplicationContext:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setFallbackApplicationName:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setOriginator:(id)a3;
- (void)setStartWhenStaged:(BOOL)a3;
- (void)setStaticIdentifier:(id)a3;
- (void)setSupported:(BOOL)a3;
- (void)setSystemActivity:(BOOL)a3;
- (void)setTimestamp:(id)a3;
- (void)setTrustedFromHandle:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation TUConversationActivity

- (TUConversationActivity)initWithMetadata:(id)a3 applicationContext:(id)a4 uuid:(id)a5 activityIdentifier:(id)a6
{
  return [(TUConversationActivity *)self initWithBundleIdentifier:0 metadata:a3 applicationContext:a4 uuid:a5 activityIdentifier:a6 fallbackApplicationName:0];
}

- (TUConversationActivity)initWithBundleIdentifier:(id)a3 metadata:(id)a4 applicationContext:(id)a5 uuid:(id)a6 activityIdentifier:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v12)
  {
    v17 = [(id)objc_opt_class() lookupApplicationNameForBundleIdentifier:v12];
  }
  else
  {
    v17 = 0;
  }
  v18 = [(TUConversationActivity *)self initWithBundleIdentifier:v12 metadata:v13 applicationContext:v14 uuid:v15 activityIdentifier:v16 fallbackApplicationName:v17];

  return v18;
}

- (TUConversationActivity)initWithBundleIdentifier:(id)a3 metadata:(id)a4 applicationContext:(id)a5 uuid:(id)a6 activityIdentifier:(id)a7 fallbackApplicationName:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v36.receiver = self;
  v36.super_class = (Class)TUConversationActivity;
  v20 = [(TUConversationActivity *)&v36 init];
  if (v20)
  {
    uint64_t v21 = [v17 copy];
    v22 = (void *)*((void *)v20 + 2);
    *((void *)v20 + 2) = v21;

    uint64_t v23 = [v18 copy];
    v24 = (void *)*((void *)v20 + 5);
    *((void *)v20 + 5) = v23;

    uint64_t v25 = [v14 copy];
    v26 = (void *)*((void *)v20 + 4);
    *((void *)v20 + 4) = v25;

    uint64_t v27 = [v16 copy];
    v28 = (void *)*((void *)v20 + 3);
    *((void *)v20 + 3) = v27;

    uint64_t v29 = [v15 copy];
    v30 = (void *)*((void *)v20 + 6);
    *((void *)v20 + 6) = v29;

    v20[8] = 1;
    uint64_t v31 = [MEMORY[0x1E4F1C9C8] now];
    v32 = (void *)*((void *)v20 + 9);
    *((void *)v20 + 9) = v31;

    uint64_t v33 = [v19 copy];
    v34 = (void *)*((void *)v20 + 10);
    *((void *)v20 + 10) = v33;

    *(_WORD *)(v20 + 9) = 0;
  }

  return (TUConversationActivity *)v20;
}

- (TUConversationActivity)initWithCreationRequest:(id)a3 bundleIdentifier:(id)a4 systemActivity:(BOOL)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [v9 metadata];
  v11 = [v10 sanitizedCopy];

  id v12 = [v9 applicationContext];
  id v13 = [v9 UUID];
  id v14 = [v9 activityIdentifier];
  id v15 = [(TUConversationActivity *)self initWithBundleIdentifier:v8 metadata:v11 applicationContext:v12 uuid:v13 activityIdentifier:v14];

  v15->_systemActivity = a5;
  uint64_t v16 = [v9 staticIdentifier];

  staticIdentifier = v15->_staticIdentifier;
  v15->_staticIdentifier = (NSString *)v16;

  return v15;
}

+ (id)placeholderActivity
{
  v2 = [TUConversationActivity alloc];
  v3 = [MEMORY[0x1E4F1C9B8] data];
  v4 = [MEMORY[0x1E4F29128] UUID];
  v5 = [(TUConversationActivity *)v2 initWithMetadata:0 applicationContext:v3 uuid:v4 activityIdentifier:@"com.apple.groupactivities.placeholder"];

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(TUConversationActivity *)self UUID];
  [v3 appendFormat:@" UUID=%@", v4];

  v5 = [(TUConversationActivity *)self bundleIdentifier];
  [v3 appendFormat:@" bundleIdentifier=%@", v5];

  v6 = [(TUConversationActivity *)self activityIdentifier];
  [v3 appendFormat:@" activityIdentifier=%@", v6];

  v7 = [(TUConversationActivity *)self metadata];
  [v3 appendFormat:@" metadata=%@", v7];

  objc_msgSend(v3, "appendFormat:", @" isSupported=%d", -[TUConversationActivity isSupported](self, "isSupported"));
  id v8 = [(TUConversationActivity *)self originator];
  [v3 appendFormat:@" originator=%@", v8];

  id v9 = [(TUConversationActivity *)self timestamp];
  [v3 appendFormat:@" timestamp=%@", v9];

  v10 = [(TUConversationActivity *)self trustedFromHandle];
  [v3 appendFormat:@" trustedFromHandle=%@", v10];

  v11 = [(TUConversationActivity *)self fallbackApplicationName];

  if (v11)
  {
    id v12 = [(TUConversationActivity *)self fallbackApplicationName];
    [v3 appendFormat:@" fallbackApplicationName=%@", v12];
  }
  id v13 = self;
  int v14 = [v13 isSystemActivity];

  if (v14)
  {
    id v15 = self;
    objc_msgSend(v3, "appendFormat:", @" self.isSystemActivity=%d", objc_msgSend(v15, "isSystemActivity"));
  }
  uint64_t v16 = self;
  int v17 = [v16 isPlaceholderActivity];

  if (v17)
  {
    id v18 = self;
    objc_msgSend(v3, "appendFormat:", @" self.isPlaceholderActivity=%d", objc_msgSend(v18, "isPlaceholderActivity"));
  }
  id v19 = self;
  int v20 = [v19 startWhenStaged];

  if (v20)
  {
    uint64_t v21 = self;
    objc_msgSend(v3, "appendFormat:", @" self.startWhenStaged=%d", objc_msgSend(v21, "startWhenStaged"));
  }
  [v3 appendString:@">"];
  v22 = (void *)[v3 copy];

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(TUConversationActivity *)self isEqualToConversationActivity:v4];

  return v5;
}

- (BOOL)isEquivalentToActivity:(id)a3
{
  id v7 = a3;
  id v8 = [(TUConversationActivity *)self bundleIdentifier];
  id v9 = [v7 bundleIdentifier];
  if (!TUObjectsAreEqualOrNil((unint64_t)v8, (uint64_t)v9))
  {
    LOBYTE(v11) = 0;
    goto LABEL_21;
  }
  v10 = [(TUConversationActivity *)self metadata];
  if (!v10)
  {
    v3 = [v7 metadata];
    if (!v3)
    {
      int v23 = 0;
LABEL_9:
      id v12 = [(TUConversationActivity *)self applicationContext];
      id v13 = [v7 applicationContext];
      if ([v12 isEqual:v13])
      {
        v22 = v3;
        uint64_t v14 = [(TUConversationActivity *)self activityIdentifier];
        uint64_t v15 = [v7 activityIdentifier];
        uint64_t v21 = (void *)v14;
        uint64_t v16 = (void *)v14;
        int v17 = (void *)v15;
        if ([v16 isEqual:v15]
          && (int v20 = [(TUConversationActivity *)self isPlaceholderActivity],
              v20 == [v7 isPlaceholderActivity]))
        {
          BOOL v18 = [(TUConversationActivity *)self startWhenStaged];
          int v11 = v18 ^ [v7 startWhenStaged] ^ 1;
        }
        else
        {
          LOBYTE(v11) = 0;
        }

        v3 = v22;
      }
      else
      {
        LOBYTE(v11) = 0;
      }

      if (!v23) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  id v4 = [(TUConversationActivity *)self metadata];
  BOOL v5 = [v7 metadata];
  if ([v4 isEquivalentToActivityMetadata:v5])
  {
    int v23 = 1;
    goto LABEL_9;
  }
  LOBYTE(v11) = 0;
LABEL_17:

LABEL_18:
  if (!v10) {

  }
LABEL_21:
  return v11;
}

- (BOOL)isEqualToConversationActivity:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUConversationActivity *)self bundleIdentifier];
  v6 = [v4 bundleIdentifier];
  if (TUObjectsAreEqualOrNil((unint64_t)v5, (uint64_t)v6))
  {
    id v7 = [(TUConversationActivity *)self metadata];
    id v8 = [v4 metadata];
    if (TUObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
    {
      id v9 = [(TUConversationActivity *)self applicationContext];
      v10 = [v4 applicationContext];
      if ([v9 isEqualToData:v10])
      {
        int v11 = [(TUConversationActivity *)self UUID];
        id v12 = [v4 UUID];
        if ([v11 isEqual:v12])
        {
          v37 = v12;
          id v13 = [(TUConversationActivity *)self activityIdentifier];
          [v4 activityIdentifier];
          v38 = v39 = v13;
          if (objc_msgSend(v13, "isEqualToString:"))
          {
            objc_super v36 = v11;
            int v14 = [(TUConversationActivity *)self isSupported];
            if (v14 == [v4 isSupported])
            {
              unint64_t v16 = [(TUConversationActivity *)self originator];
              v34 = [v4 originator];
              v35 = (void *)v16;
              if (TUObjectsAreEqualOrNil(v16, (uint64_t)v34))
              {
                int v17 = [(TUConversationActivity *)self timestamp];
                v32 = [v4 timestamp];
                uint64_t v33 = v17;
                if (objc_msgSend(v17, "isEqualToDate:"))
                {
                  unint64_t v18 = [(TUConversationActivity *)self fallbackApplicationName];
                  v30 = [v4 fallbackApplicationName];
                  uint64_t v31 = (void *)v18;
                  if (TUObjectsAreEqualOrNil(v18, (uint64_t)v30)
                    && (int v19 = [(TUConversationActivity *)self isSystemActivity],
                        v19 == [v4 isSystemActivity]))
                  {
                    unint64_t v20 = [(TUConversationActivity *)self staticIdentifier];
                    v28 = [v4 staticIdentifier];
                    uint64_t v29 = (void *)v20;
                    if (TUObjectsAreEqualOrNil(v20, (uint64_t)v28)
                      && (int v21 = [(TUConversationActivity *)self isPlaceholderActivity],
                          v21 == [v4 isPlaceholderActivity]))
                    {
                      v22 = [(TUConversationActivity *)self trustedFromHandle];
                      uint64_t v27 = [v4 trustedFromHandle];
                      if (TUObjectsAreEqualOrNil((unint64_t)v22, (uint64_t)v27))
                      {
                        int v23 = v22;
                        BOOL v24 = [(TUConversationActivity *)self startWhenStaged];
                        int v25 = v24 ^ [v4 startWhenStaged];
                        v22 = v23;
                        char v15 = v25 ^ 1;
                      }
                      else
                      {
                        char v15 = 0;
                      }
                      id v12 = v37;

                      int v11 = v36;
                    }
                    else
                    {
                      char v15 = 0;
                      int v11 = v36;
                      id v12 = v37;
                    }
                  }
                  else
                  {
                    char v15 = 0;
                    int v11 = v36;
                    id v12 = v37;
                  }
                }
                else
                {
                  char v15 = 0;
                  int v11 = v36;
                  id v12 = v37;
                }
              }
              else
              {
                char v15 = 0;
                int v11 = v36;
                id v12 = v37;
              }
            }
            else
            {
              char v15 = 0;
              int v11 = v36;
              id v12 = v37;
            }
          }
          else
          {
            char v15 = 0;
            id v12 = v37;
          }
        }
        else
        {
          char v15 = 0;
        }
      }
      else
      {
        char v15 = 0;
      }
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  uint64_t v31 = [(TUConversationActivity *)self bundleIdentifier];
  uint64_t v3 = [v31 hash];
  v30 = [(TUConversationActivity *)self metadata];
  uint64_t v4 = [v30 hash] ^ v3;
  uint64_t v29 = [(TUConversationActivity *)self applicationContext];
  uint64_t v5 = [v29 hash];
  v28 = [(TUConversationActivity *)self UUID];
  uint64_t v6 = v4 ^ v5 ^ [v28 hash];
  uint64_t v27 = [(TUConversationActivity *)self activityIdentifier];
  uint64_t v7 = [v27 hash];
  if ([(TUConversationActivity *)self isSupported]) {
    uint64_t v8 = 1231;
  }
  else {
    uint64_t v8 = 1237;
  }
  uint64_t v9 = v6 ^ v7 ^ v8;
  v10 = [(TUConversationActivity *)self originator];
  uint64_t v11 = [v10 hash];
  id v12 = [(TUConversationActivity *)self timestamp];
  uint64_t v13 = v11 ^ [v12 hash];
  int v14 = [(TUConversationActivity *)self fallbackApplicationName];
  uint64_t v15 = v13 ^ [v14 hash];
  if ([(TUConversationActivity *)self isSystemActivity]) {
    uint64_t v16 = 1231;
  }
  else {
    uint64_t v16 = 1237;
  }
  uint64_t v17 = v9 ^ v15 ^ v16;
  unint64_t v18 = [(TUConversationActivity *)self staticIdentifier];
  uint64_t v19 = [v18 hash];
  if ([(TUConversationActivity *)self isPlaceholderActivity]) {
    uint64_t v20 = 1231;
  }
  else {
    uint64_t v20 = 1237;
  }
  uint64_t v21 = v19 ^ v20;
  v22 = [(TUConversationActivity *)self trustedFromHandle];
  uint64_t v23 = v21 ^ [v22 hash];
  if ([(TUConversationActivity *)self startWhenStaged]) {
    uint64_t v24 = 1231;
  }
  else {
    uint64_t v24 = 1237;
  }
  unint64_t v25 = v17 ^ v23 ^ v24;

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(TUConversationActivity *)self bundleIdentifier];
  uint64_t v6 = [(TUConversationActivity *)self metadata];
  uint64_t v7 = [(TUConversationActivity *)self applicationContext];
  uint64_t v8 = [(TUConversationActivity *)self UUID];
  uint64_t v9 = [(TUConversationActivity *)self activityIdentifier];
  v10 = [(TUConversationActivity *)self fallbackApplicationName];
  uint64_t v11 = (void *)[v4 initWithBundleIdentifier:v5 metadata:v6 applicationContext:v7 uuid:v8 activityIdentifier:v9 fallbackApplicationName:v10];

  objc_msgSend(v11, "setSupported:", -[TUConversationActivity isSupported](self, "isSupported"));
  id v12 = [(TUConversationActivity *)self originator];
  [v11 setOriginator:v12];

  uint64_t v13 = [(TUConversationActivity *)self timestamp];
  [v11 setTimestamp:v13];

  objc_msgSend(v11, "setSystemActivity:", -[TUConversationActivity isSystemActivity](self, "isSystemActivity"));
  int v14 = [(TUConversationActivity *)self staticIdentifier];
  [v11 setStaticIdentifier:v14];

  uint64_t v15 = [(TUConversationActivity *)self trustedFromHandle];
  [v11 setTrustedFromHandle:v15];

  objc_msgSend(v11, "setStartWhenStaged:", -[TUConversationActivity startWhenStaged](self, "startWhenStaged"));
  return v11;
}

- (id)sanitizedCopy
{
  return [(TUConversationActivity *)self sanitizedCopyWithZone:0];
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(TUConversationActivity *)self bundleIdentifier];
  uint64_t v6 = [(TUConversationActivity *)self metadata];
  uint64_t v7 = [v6 sanitizedCopy];
  uint64_t v8 = [(TUConversationActivity *)self applicationContext];
  uint64_t v9 = [(TUConversationActivity *)self UUID];
  v10 = [(TUConversationActivity *)self activityIdentifier];
  uint64_t v11 = [(TUConversationActivity *)self fallbackApplicationName];
  id v12 = (void *)[v4 initWithBundleIdentifier:v5 metadata:v7 applicationContext:v8 uuid:v9 activityIdentifier:v10 fallbackApplicationName:v11];

  objc_msgSend(v12, "setSupported:", -[TUConversationActivity isSupported](self, "isSupported"));
  uint64_t v13 = [(TUConversationActivity *)self originator];
  [v12 setOriginator:v13];

  int v14 = [(TUConversationActivity *)self timestamp];
  [v12 setTimestamp:v14];

  objc_msgSend(v12, "setSystemActivity:", -[TUConversationActivity isSystemActivity](self, "isSystemActivity"));
  uint64_t v15 = [(TUConversationActivity *)self staticIdentifier];
  [v12 setStaticIdentifier:v15];

  uint64_t v16 = [(TUConversationActivity *)self trustedFromHandle];
  [v12 setTrustedFromHandle:v16];

  objc_msgSend(v12, "setStartWhenStaged:", -[TUConversationActivity startWhenStaged](self, "startWhenStaged"));

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationActivity)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(sel_bundleIdentifier);
  uint64_t v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  uint64_t v9 = NSStringFromSelector(sel_metadata);
  v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  uint64_t v11 = objc_opt_class();
  id v12 = NSStringFromSelector(sel_applicationContext);
  uint64_t v13 = [v4 decodeObjectOfClass:v11 forKey:v12];

  if (v13)
  {
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = NSStringFromSelector(sel_UUID);
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];

    if (v16)
    {
      uint64_t v17 = objc_opt_class();
      unint64_t v18 = NSStringFromSelector(sel_activityIdentifier);
      uint64_t v19 = [v4 decodeObjectOfClass:v17 forKey:v18];

      if (v19)
      {
        uint64_t v20 = NSStringFromSelector(sel_isSupported);
        char v45 = [v4 decodeBoolForKey:v20];

        uint64_t v21 = objc_opt_class();
        v22 = NSStringFromSelector(sel_originator);
        id obj = [v4 decodeObjectOfClass:v21 forKey:v22];

        uint64_t v23 = objc_opt_class();
        uint64_t v24 = NSStringFromSelector(sel_timestamp);
        unint64_t v25 = [v4 decodeObjectOfClass:v23 forKey:v24];

        if (v25)
        {
          id v46 = v25;
          uint64_t v26 = objc_opt_class();
          uint64_t v27 = NSStringFromSelector(sel_fallbackApplicationName);
          v43 = [v4 decodeObjectOfClass:v26 forKey:v27];

          v28 = NSStringFromSelector(sel_isSystemActivity);
          char v44 = [v4 decodeBoolForKey:v28];

          uint64_t v29 = objc_opt_class();
          v30 = NSStringFromSelector(sel_staticIdentifier);
          uint64_t v31 = [v4 decodeObjectOfClass:v29 forKey:v30];

          uint64_t v32 = objc_opt_class();
          uint64_t v33 = NSStringFromSelector(sel_trustedFromHandle);
          uint64_t v42 = [v4 decodeObjectOfClass:v32 forKey:v33];

          v34 = NSStringFromSelector(sel_startWhenStaged);
          char v41 = [v4 decodeBoolForKey:v34];

          v35 = [(TUConversationActivity *)self initWithBundleIdentifier:v7 metadata:v10 applicationContext:v13 uuid:v16 activityIdentifier:v19 fallbackApplicationName:v43];
          v35->_supported = v45;
          objc_storeStrong((id *)&v35->_originator, obj);
          objc_storeStrong((id *)&v35->_timestamp, v46);
          v35->_systemActivity = v44;
          staticIdentifier = v35->_staticIdentifier;
          v35->_staticIdentifier = v31;
          v37 = v31;

          unint64_t v25 = v46;
          trustedFromHandle = v35->_trustedFromHandle;
          v35->_trustedFromHandle = (TUHandle *)v42;

          v35->_startWhenStaged = v41;
          self = v35;

          v39 = self;
        }
        else
        {
          v39 = 0;
        }
      }
      else
      {
        v39 = 0;
      }
    }
    else
    {
      v39 = 0;
    }
  }
  else
  {
    v39 = 0;
  }

  return v39;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUConversationActivity *)self bundleIdentifier];
  uint64_t v6 = NSStringFromSelector(sel_bundleIdentifier);
  [v4 encodeObject:v5 forKey:v6];

  uint64_t v7 = [(TUConversationActivity *)self metadata];
  uint64_t v8 = NSStringFromSelector(sel_metadata);
  [v4 encodeObject:v7 forKey:v8];

  uint64_t v9 = [(TUConversationActivity *)self applicationContext];
  v10 = NSStringFromSelector(sel_applicationContext);
  [v4 encodeObject:v9 forKey:v10];

  uint64_t v11 = [(TUConversationActivity *)self UUID];
  id v12 = NSStringFromSelector(sel_UUID);
  [v4 encodeObject:v11 forKey:v12];

  uint64_t v13 = [(TUConversationActivity *)self activityIdentifier];
  uint64_t v14 = NSStringFromSelector(sel_activityIdentifier);
  [v4 encodeObject:v13 forKey:v14];

  BOOL v15 = [(TUConversationActivity *)self isSupported];
  uint64_t v16 = NSStringFromSelector(sel_isSupported);
  [v4 encodeBool:v15 forKey:v16];

  uint64_t v17 = [(TUConversationActivity *)self originator];
  unint64_t v18 = NSStringFromSelector(sel_originator);
  [v4 encodeObject:v17 forKey:v18];

  uint64_t v19 = [(TUConversationActivity *)self timestamp];
  uint64_t v20 = NSStringFromSelector(sel_timestamp);
  [v4 encodeObject:v19 forKey:v20];

  uint64_t v21 = [(TUConversationActivity *)self fallbackApplicationName];
  v22 = NSStringFromSelector(sel_fallbackApplicationName);
  [v4 encodeObject:v21 forKey:v22];

  BOOL v23 = [(TUConversationActivity *)self isSystemActivity];
  uint64_t v24 = NSStringFromSelector(sel_isSystemActivity);
  [v4 encodeBool:v23 forKey:v24];

  unint64_t v25 = [(TUConversationActivity *)self staticIdentifier];
  uint64_t v26 = NSStringFromSelector(sel_staticIdentifier);
  [v4 encodeObject:v25 forKey:v26];

  uint64_t v27 = [(TUConversationActivity *)self trustedFromHandle];
  v28 = NSStringFromSelector(sel_trustedFromHandle);
  [v4 encodeObject:v27 forKey:v28];

  BOOL v29 = [(TUConversationActivity *)self startWhenStaged];
  NSStringFromSelector(sel_startWhenStaged);
  id v30 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v29 forKey:v30];
}

- (NSString)representativeBundleIdentifier
{
  if ([(TUConversationActivity *)self isEligibleForWebBrowser])
  {
    uint64_t v3 = @"com.apple.Safari";
  }
  else
  {
    if ([(TUConversationActivity *)self isScreenSharingActivity]) {
      [(TUConversationActivity *)self platformScreenSharingBundleIdentifier];
    }
    else {
    uint64_t v3 = [(TUConversationActivity *)self bundleIdentifier];
    }
  }

  return (NSString *)v3;
}

- (BOOL)isEligibleForHandoff
{
  v2 = [(TUConversationActivity *)self metadata];
  char v3 = [v2 supportsContinuationOnTV];

  return v3;
}

- (BOOL)isEligibleForWebBrowser
{
  return 0;
}

- (BOOL)isPlaceholderActivity
{
  v2 = [(TUConversationActivity *)self activityIdentifier];
  char v3 = [v2 isEqual:@"com.apple.groupactivities.placeholder"];

  return v3;
}

- (BOOL)isStaticActivity
{
  v2 = [(TUConversationActivity *)self staticIdentifier];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setBundleIdentifier:(id)a3
{
  uint64_t v5 = (NSString *)a3;
  if (self->_bundleIdentifier != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)&self->_bundleIdentifier, a3);
    if (self->_bundleIdentifier)
    {
      uint64_t v6 = [(id)objc_opt_class() lookupApplicationNameForBundleIdentifier:v8];
      fallbackApplicationName = self->_fallbackApplicationName;
      self->_fallbackApplicationName = v6;
    }
    else
    {
      fallbackApplicationName = self->_fallbackApplicationName;
      self->_fallbackApplicationName = 0;
    }

    uint64_t v5 = v8;
  }
}

- (id)localizedApplicationName
{
  BOOL v3 = [(TUConversationActivity *)self bundleIdentifier];

  if (v3)
  {
    id v4 = objc_opt_class();
    uint64_t v5 = [(TUConversationActivity *)self bundleIdentifier];
    BOOL v3 = [v4 lookupApplicationNameForBundleIdentifier:v5];

    if (![v3 length])
    {
      uint64_t v6 = [(TUConversationActivity *)self fallbackApplicationName];
      uint64_t v7 = [v6 length];

      if (v7)
      {
        uint64_t v8 = [(TUConversationActivity *)self fallbackApplicationName];
        uint64_t v9 = [v8 copy];

        BOOL v3 = (void *)v9;
      }
    }
  }

  return v3;
}

- (id)representativeDisplayName
{
  if ([(TUConversationActivity *)self isEligibleForWebBrowser])
  {
    BOOL v3 = [(TUConversationActivity *)self metadata];
    id v4 = [v3 fallbackURL];
    uint64_t v5 = [v4 host];
  }
  else
  {
    uint64_t v5 = [(TUConversationActivity *)self localizedApplicationName];
  }

  return v5;
}

+ (id)lookupApplicationNameForBundleIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.TelephonyUtilities"])
  {
    id v4 = 0;
    goto LABEL_11;
  }
  id v10 = 0;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v3 allowPlaceholder:1 error:&v10];
  id v6 = v10;
  if (v6)
  {
    uint64_t v7 = TUDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[TUConversationActivity lookupApplicationNameForBundleIdentifier:v7];
    }
  }
  else if (v5)
  {
    uint64_t v8 = [v5 localizedName];
    goto LABEL_10;
  }
  uint64_t v8 = 0;
LABEL_10:
  id v4 = v8;

LABEL_11:

  return v4;
}

- (BOOL)isScreenSharingActivity
{
  id v3 = [(TUConversationActivity *)self activityIdentifier];
  int v4 = [v3 isEqualToString:@"com.apple.FaceTime.ScreenSharing"];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = [(TUConversationActivity *)self bundleIdentifier];
  if ([v5 isEqualToString:@"com.apple.TelephonyUtilities"]) {
    char v6 = 1;
  }
  else {
    char v6 = [v5 isEqualToString:@"com.apple.InCallService"];
  }

  return v6;
}

- (id)concatenatedMetadataDescription
{
  id v3 = [(TUConversationActivity *)self metadata];

  if (!v3) {
    goto LABEL_7;
  }
  int v4 = [(TUConversationActivity *)self metadata];
  uint64_t v5 = [v4 title];

  char v6 = [(TUConversationActivity *)self metadata];
  uint64_t v7 = [v6 subTitle];

  if (!v5)
  {
    if (v7)
    {
      uint64_t v9 = [(TUConversationActivity *)self metadata];
      uint64_t v14 = [v9 subTitle];
LABEL_9:
      id v10 = v14;
      uint64_t v13 = (void *)[v14 copy];
      goto LABEL_10;
    }
LABEL_7:
    uint64_t v13 = 0;
    goto LABEL_11;
  }
  if (!v7)
  {
    uint64_t v9 = [(TUConversationActivity *)self metadata];
    uint64_t v14 = [v9 title];
    goto LABEL_9;
  }
  uint64_t v8 = NSString;
  uint64_t v9 = [(TUConversationActivity *)self metadata];
  id v10 = [v9 title];
  uint64_t v11 = [(TUConversationActivity *)self metadata];
  id v12 = [v11 subTitle];
  uint64_t v13 = [v8 stringWithFormat:@"%@ ⋅ %@", v10, v12];

LABEL_10:
LABEL_11:

  return v13;
}

- (id)concatenatedDescription
{
  v2 = [(TUConversationActivity *)self concatenatedMetadataDescription];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    uint64_t v5 = TUBundle();
    id v4 = [v5 localizedStringForKey:@"ACTIVITY" value:&stru_1EECEA668 table:@"TelephonyUtilities"];
  }

  return v4;
}

- (id)platformScreenSharingBundleIdentifier
{
  return @"com.apple.InCallService";
}

- (TUConversationActivityContext)activityContext
{
  v2 = [(TUConversationActivity *)self metadata];
  id v3 = [v2 context];

  return (TUConversationActivityContext *)v3;
}

- (void)setActivityContext:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "[WARN] Not setting activity context: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (NSData)applicationContext
{
  return self->_applicationContext;
}

- (void)setApplicationContext:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (void)setActivityIdentifier:(id)a3
{
}

- (TUConversationActivityMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (BOOL)isSupported
{
  return self->_supported;
}

- (void)setSupported:(BOOL)a3
{
  self->_supported = a3;
}

- (TUHandle)originator
{
  return self->_originator;
}

- (void)setOriginator:(id)a3
{
}

- (BOOL)isSystemActivity
{
  return self->_systemActivity;
}

- (void)setSystemActivity:(BOOL)a3
{
  self->_systemActivity = a3;
}

- (TUHandle)trustedFromHandle
{
  return self->_trustedFromHandle;
}

- (void)setTrustedFromHandle:(id)a3
{
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSString)fallbackApplicationName
{
  return self->_fallbackApplicationName;
}

- (void)setFallbackApplicationName:(id)a3
{
}

- (NSString)staticIdentifier
{
  return self->_staticIdentifier;
}

- (void)setStaticIdentifier:(id)a3
{
}

- (BOOL)startWhenStaged
{
  return self->_startWhenStaged;
}

- (void)setStartWhenStaged:(BOOL)a3
{
  self->_startWhenStaged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticIdentifier, 0);
  objc_storeStrong((id *)&self->_fallbackApplicationName, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_trustedFromHandle, 0);
  objc_storeStrong((id *)&self->_originator, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationContext, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

+ (void)lookupApplicationNameForBundleIdentifier:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_19C496000, log, OS_LOG_TYPE_ERROR, "Lookup failed when trying to retrieve a name for bundle ID %@ with error %@", (uint8_t *)&v3, 0x16u);
}

@end