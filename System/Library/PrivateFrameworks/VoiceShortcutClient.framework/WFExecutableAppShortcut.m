@interface WFExecutableAppShortcut
+ (BOOL)supportsSecureCoding;
- (BOOL)isDeprecatedStyle;
- (LNAutoShortcut)underlyingAutoShortcut;
- (LNAutoShortcutLocalizedPhrase)phrase;
- (LNFullyQualifiedActionIdentifier)fullyQualifiedIdentifier;
- (NSArray)alternatePhrases;
- (NSString)attributionBundleIdentifier;
- (NSString)base64ArchivedData;
- (NSString)bundleIdentifier;
- (NSString)id;
- (NSString)shortTitle;
- (NSString)shortcutDescription;
- (NSString)triggerPhrase;
- (WFAppShortcutNamedQueryInfo)namedQueryInfo;
- (WFAutoShortcutEntityInfo)entityInfo;
- (WFExecutableAppShortcut)initWithAutoShortcut:(id)a3 phrase:(id)a4 alternatePhrases:(id)a5 entityInfo:(id)a6;
- (WFExecutableAppShortcut)initWithAutoShortcut:(id)a3 phrase:(id)a4 entityInfo:(id)a5;
- (WFExecutableAppShortcut)initWithCoder:(id)a3;
- (unint64_t)chicletColor;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFExecutableAppShortcut

- (WFAutoShortcutEntityInfo)entityInfo
{
  return self->_entityInfo;
}

- (BOOL)isDeprecatedStyle
{
  v3 = [(WFExecutableAppShortcut *)self underlyingAutoShortcut];
  v4 = [v3 localizedShortTitle];
  if ([v4 length])
  {
    v5 = [(WFExecutableAppShortcut *)self underlyingAutoShortcut];
    v6 = [v5 systemImageName];
    uint64_t v7 = [v6 length];

    if (!v7) {
      return 1;
    }
    v8 = [(WFExecutableAppShortcut *)self phrase];
    v9 = [v8 parameterIdentifier];

    if (!v9) {
      return 0;
    }
    v3 = [(WFExecutableAppShortcut *)self entityInfo];
    BOOL v10 = v3 == 0;
  }
  else
  {

    BOOL v10 = 1;
  }

  return v10;
}

- (LNAutoShortcut)underlyingAutoShortcut
{
  return self->_underlyingAutoShortcut;
}

- (NSString)id
{
  v2 = [(WFExecutableAppShortcut *)self phrase];
  v3 = [v2 signature];

  return (NSString *)v3;
}

- (LNAutoShortcutLocalizedPhrase)phrase
{
  return self->_phrase;
}

- (WFExecutableAppShortcut)initWithAutoShortcut:(id)a3 phrase:(id)a4 alternatePhrases:(id)a5 entityInfo:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)WFExecutableAppShortcut;
  v15 = [(WFExecutableAppShortcut *)&v21 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_underlyingAutoShortcut, a3);
    objc_storeStrong((id *)&v16->_phrase, a4);
    objc_storeStrong((id *)&v16->_alternatePhrases, a5);
    objc_storeStrong((id *)&v16->_entityInfo, a6);
    uint64_t v17 = [v11 shortcutTileColor];
    if ((unint64_t)(v17 - 1) >= 0xE) {
      unint64_t v18 = 0;
    }
    else {
      unint64_t v18 = v17;
    }
    v16->_chicletColor = v18;
    v19 = v16;
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityInfo, 0);
  objc_storeStrong((id *)&self->_alternatePhrases, 0);
  objc_storeStrong((id *)&self->_phrase, 0);
  objc_storeStrong((id *)&self->_underlyingAutoShortcut, 0);
}

- (unint64_t)chicletColor
{
  return self->_chicletColor;
}

- (NSArray)alternatePhrases
{
  return self->_alternatePhrases;
}

- (WFExecutableAppShortcut)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"underlyingAutoShortcut"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phrase"];
  uint64_t v7 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"alternatePhrases"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entityInfo"];

  v9 = [(WFExecutableAppShortcut *)self initWithAutoShortcut:v5 phrase:v6 alternatePhrases:v7 entityInfo:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFExecutableAppShortcut *)self underlyingAutoShortcut];
  [v4 encodeObject:v5 forKey:@"underlyingAutoShortcut"];

  v6 = [(WFExecutableAppShortcut *)self phrase];
  [v4 encodeObject:v6 forKey:@"phrase"];

  uint64_t v7 = [(WFExecutableAppShortcut *)self alternatePhrases];
  [v4 encodeObject:v7 forKey:@"alternatePhrases"];

  id v8 = [(WFExecutableAppShortcut *)self entityInfo];
  [v4 encodeObject:v8 forKey:@"entityInfo"];
}

- (NSString)base64ArchivedData
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v7 = 0;
  v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v7];
  id v3 = v7;
  if (v2)
  {
    id v4 = [v2 base64EncodedStringWithOptions:0];
  }
  else
  {
    v5 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[WFExecutableAppShortcut base64ArchivedData]";
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1B3C5C000, v5, OS_LOG_TYPE_ERROR, "%s Failed to archive auto shortcut into data with error: %@", buf, 0x16u);
    }

    id v4 = 0;
  }

  return (NSString *)v4;
}

- (WFAppShortcutNamedQueryInfo)namedQueryInfo
{
  id v3 = [(WFExecutableAppShortcut *)self phrase];
  uint64_t v4 = [v3 optionsCollectionTitle];
  if (!v4)
  {
    uint64_t v12 = 0;
    goto LABEL_5;
  }
  v5 = (void *)v4;
  v6 = [(WFExecutableAppShortcut *)self phrase];
  id v7 = [v6 optionsCollectionSystemImageName];

  if (v7)
  {
    id v8 = [WFAppShortcutNamedQueryInfo alloc];
    id v3 = [(WFExecutableAppShortcut *)self phrase];
    v9 = [v3 optionsCollectionTitle];
    __int16 v10 = [(WFExecutableAppShortcut *)self phrase];
    id v11 = [v10 optionsCollectionSystemImageName];
    uint64_t v12 = [(WFAppShortcutNamedQueryInfo *)v8 initWithName:v9 symbolName:v11];

LABEL_5:
    goto LABEL_7;
  }
  uint64_t v12 = 0;
LABEL_7:
  return v12;
}

- (NSString)shortcutDescription
{
  id v3 = [(WFExecutableAppShortcut *)self underlyingAutoShortcut];
  uint64_t v4 = [v3 localizedAutoShortcutDescription];
  if (v4)
  {
    v5 = [(WFExecutableAppShortcut *)self underlyingAutoShortcut];
    v6 = [v5 bundleIdentifier];
  }
  else
  {
    v6 = &stru_1F0C7EBE0;
  }

  return (NSString *)v6;
}

- (LNFullyQualifiedActionIdentifier)fullyQualifiedIdentifier
{
  id v3 = objc_alloc(MEMORY[0x1E4F72CA0]);
  uint64_t v4 = [(WFExecutableAppShortcut *)self underlyingAutoShortcut];
  v5 = [v4 actionIdentifier];
  v6 = [(WFExecutableAppShortcut *)self underlyingAutoShortcut];
  id v7 = [v6 bundleIdentifier];
  id v8 = (void *)[v3 initWithActionIdentifier:v5 bundleIdentifier:v7];

  return (LNFullyQualifiedActionIdentifier *)v8;
}

- (NSString)shortTitle
{
  id v3 = [(WFExecutableAppShortcut *)self entityInfo];

  if (v3)
  {
    uint64_t v4 = [(WFExecutableAppShortcut *)self entityInfo];
    v5 = [v4 name];
  }
  else
  {
    uint64_t v4 = [(WFExecutableAppShortcut *)self underlyingAutoShortcut];
    v6 = [v4 localizedShortTitle];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [(WFExecutableAppShortcut *)self triggerPhrase];
    }
    v5 = v8;
  }
  return (NSString *)v5;
}

- (NSString)triggerPhrase
{
  v2 = [(WFExecutableAppShortcut *)self phrase];
  id v3 = [v2 localizedPhrase];

  return (NSString *)v3;
}

- (NSString)attributionBundleIdentifier
{
  id v3 = [(WFExecutableAppShortcut *)self underlyingAutoShortcut];
  uint64_t v4 = [v3 attributionBundleIdentifier];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [(WFExecutableAppShortcut *)self underlyingAutoShortcut];
    id v6 = [v7 bundleIdentifier];
  }
  return (NSString *)v6;
}

- (NSString)bundleIdentifier
{
  v2 = [(WFExecutableAppShortcut *)self underlyingAutoShortcut];
  id v3 = [v2 bundleIdentifier];

  return (NSString *)v3;
}

- (WFExecutableAppShortcut)initWithAutoShortcut:(id)a3 phrase:(id)a4 entityInfo:(id)a5
{
  return [(WFExecutableAppShortcut *)self initWithAutoShortcut:a3 phrase:a4 alternatePhrases:0 entityInfo:a5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end