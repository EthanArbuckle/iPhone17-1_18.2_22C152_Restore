@interface SBDisplayItem
+ (SBDisplayItem)displayItemWithProtobufRepresentation:(id)a3;
+ (SBDisplayItem)displayItemWithType:(int64_t)a3 bundleIdentifier:(id)a4 uniqueIdentifier:(id)a5;
+ (id)applicationDisplayItemWithBundleIdentifier:(id)a3 sceneIdentifier:(id)a4;
+ (id)displayItemForLayoutElement:(id)a3;
+ (id)homeScreenDisplayItem;
+ (id)remoteAlertDisplayItemWithServiceBundleIdentifier:(id)a3;
+ (id)switcherServiceDisplayItemWithServiceIdentifier:(id)a3;
+ (id)webAppDisplayItemWithWebAppIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDisplayItemForFloatingDockSuggestions:(id)a3;
- (BOOL)isHomeScreenDisplayItem;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)uniqueIdentifier;
- (NSString)webClipIdentifier;
- (SBDisplayItem)init;
- (SBDisplayItem)initWithLegacyPlistRepresentation:(id)a3;
- (SBDisplayItem)initWithPlistRepresentation:(id)a3;
- (SBDisplayItem)initWithType:(int64_t)a3 bundleIdentifier:(id)a4 uniqueIdentifier:(id)a5;
- (id)_calculateUniqueStringRepresentation;
- (id)_initWithArrayPlistRepresentation:(id)a3;
- (id)_initWithDictionaryPlistRepresentation:(id)a3;
- (id)_initWithLegacyPlistRepresentation:(id)a3 sceneIdentifierFromBundleIdentifierGenerator:(id)a4;
- (id)_initWithPlistRepresentation:(id)a3 sceneIdentifierFromBundleIdentifierGenerator:(id)a4;
- (id)_newSceneIdentifierForBundleIdentifier:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)displayItemForFloatingDockSuggestionsComparison;
- (id)plistRepresentation;
- (id)protobufRepresentation;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)uniqueStringRepresentation;
- (int64_t)compare:(id)a3;
- (int64_t)type;
- (unint64_t)hash;
@end

@implementation SBDisplayItem

- (unint64_t)hash
{
  return [(NSString *)self->_uniqueStringRepresentation hash];
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uniqueStringRepresentation = self->_uniqueStringRepresentation;
    v6 = [v4 uniqueStringRepresentation];
    char v7 = [(NSString *)uniqueStringRepresentation isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)uniqueStringRepresentation
{
  return self->_uniqueStringRepresentation;
}

+ (id)displayItemForLayoutElement:(id)a3
{
  if (!a3)
  {
    v6 = 0;
    goto LABEL_12;
  }
  v3 = [a3 workspaceEntity];
  if ([v3 isApplicationSceneEntity])
  {
    id v4 = [v3 applicationSceneEntity];
    v5 = [v4 sceneHandle];
LABEL_9:
    char v7 = v5;
    v6 = [v5 displayItemRepresentation];
    goto LABEL_10;
  }
  if (![v3 isAppClipPlaceholderEntity])
  {
    if (![v3 isCaptureExtensionEntity])
    {
      v6 = +[SBDisplayItem homeScreenDisplayItem];
      goto LABEL_11;
    }
    id v4 = [v3 captureExtensionEntity];
    v5 = [v4 hostableEntity];
    goto LABEL_9;
  }
  id v4 = [v3 appClipPlaceholderEntity];
  char v7 = [v4 bundleIdentifier];
  v8 = [v4 futureSceneIdentifier];
  v6 = +[SBDisplayItem displayItemWithType:0 bundleIdentifier:v7 uniqueIdentifier:v8];

LABEL_10:
LABEL_11:

LABEL_12:
  return v6;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong(&self->_sceneIdentifierFromBundleIdentifierGenerator, 0);
  objc_storeStrong((id *)&self->_uniqueStringRepresentation, 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBDisplayItem *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = v3;
  unint64_t type = self->_type;
  if (type > 7) {
    v6 = 0;
  }
  else {
    v6 = off_1E6AF9E30[type];
  }
  [v3 appendString:v6 withName:@"type"];
  id v7 = (id)[v4 appendObject:self->_bundleIdentifier withName:@"bundleIdentifier"];
  id v8 = (id)[v4 appendObject:self->_uniqueIdentifier withName:@"uniqueIdentifier"];
  return v4;
}

+ (SBDisplayItem)displayItemWithType:(int64_t)a3 bundleIdentifier:(id)a4 uniqueIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = (void *)[objc_alloc((Class)a1) initWithType:a3 bundleIdentifier:v9 uniqueIdentifier:v8];

  return (SBDisplayItem *)v10;
}

- (SBDisplayItem)initWithType:(int64_t)a3 bundleIdentifier:(id)a4 uniqueIdentifier:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (a3 < 0)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SBDisplayItem.m", 206, @"Must have type & identifier %@, %@", 0, v9 object file lineNumber description];

    if (v9)
    {
LABEL_3:
      if (a3) {
        goto LABEL_6;
      }
      goto LABEL_4;
    }
  }
  else if (v9)
  {
    goto LABEL_3;
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  v22 = v21;
  if ((unint64_t)a3 > 7) {
    v23 = 0;
  }
  else {
    v23 = off_1E6AF9E30[a3];
  }
  [v21 handleFailureInMethod:a2, self, @"SBDisplayItem.m", 207, @"Must have type & identifier %@, %@", v23, 0 object file lineNumber description];

  if (a3) {
    goto LABEL_6;
  }
LABEL_4:
  if ([v9 isEqualToString:@"com.apple.webapp"])
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"SBDisplayItem.m" lineNumber:208 description:@"Web App Bundle ID must be accompanied by SBDisplayItemTypeWebApp type"];
  }
LABEL_6:
  v25.receiver = self;
  v25.super_class = (Class)SBDisplayItem;
  v11 = [(SBDisplayItem *)&v25 init];
  v12 = v11;
  if (v11)
  {
    v11->_unint64_t type = a3;
    uint64_t v13 = [v9 copy];
    bundleIdentifier = v12->_bundleIdentifier;
    v12->_bundleIdentifier = (NSString *)v13;

    uint64_t v15 = [v10 copy];
    uniqueIdentifier = v12->_uniqueIdentifier;
    v12->_uniqueIdentifier = (NSString *)v15;

    uint64_t v17 = [(SBDisplayItem *)v12 _calculateUniqueStringRepresentation];
    uniqueStringRepresentation = v12->_uniqueStringRepresentation;
    v12->_uniqueStringRepresentation = (NSString *)v17;
  }
  return v12;
}

- (id)_calculateUniqueStringRepresentation
{
  v3 = NSString;
  unint64_t type = self->_type;
  if (type > 7) {
    v5 = 0;
  }
  else {
    v5 = off_1E6AF9E30[type];
  }
  v6 = [(SBDisplayItem *)self bundleIdentifier];
  id v7 = [(SBDisplayItem *)self uniqueIdentifier];
  id v8 = [v3 stringWithFormat:@"%@-%@-%@", v5, v6, v7];

  return v8;
}

+ (id)applicationDisplayItemWithBundleIdentifier:(id)a3 sceneIdentifier:(id)a4
{
  return +[SBDisplayItem displayItemWithType:0 bundleIdentifier:a3 uniqueIdentifier:a4];
}

+ (id)homeScreenDisplayItem
{
  v2 = FBSystemAppBundleID();
  v3 = +[SBDisplayItem displayItemWithType:1 bundleIdentifier:v2 uniqueIdentifier:0];

  return v3;
}

+ (id)remoteAlertDisplayItemWithServiceBundleIdentifier:(id)a3
{
  return +[SBDisplayItem displayItemWithType:2 bundleIdentifier:a3 uniqueIdentifier:0];
}

+ (id)switcherServiceDisplayItemWithServiceIdentifier:(id)a3
{
  return +[SBDisplayItem displayItemWithType:3 bundleIdentifier:a3 uniqueIdentifier:0];
}

+ (id)webAppDisplayItemWithWebAppIdentifier:(id)a3
{
  return +[SBDisplayItem displayItemWithType:5 bundleIdentifier:@"com.apple.webapp" uniqueIdentifier:a3];
}

- (SBDisplayItem)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBDisplayItem.m" lineNumber:201 description:@"use initWithType:..."];

  return 0;
}

- (SBDisplayItem)initWithPlistRepresentation:(id)a3
{
  return (SBDisplayItem *)[(SBDisplayItem *)self _initWithPlistRepresentation:a3 sceneIdentifierFromBundleIdentifierGenerator:0];
}

- (id)_initWithPlistRepresentation:(id)a3 sceneIdentifierFromBundleIdentifierGenerator:(id)a4
{
  id v6 = a3;
  id v7 = (void *)[a4 copy];
  id sceneIdentifierFromBundleIdentifierGenerator = self->_sceneIdentifierFromBundleIdentifierGenerator;
  self->_id sceneIdentifierFromBundleIdentifierGenerator = v7;

  uint64_t v9 = objc_opt_class();
  id v10 = v6;
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    id v13 = [(SBDisplayItem *)self _initWithDictionaryPlistRepresentation:v12];
  }
  else
  {
    uint64_t v14 = objc_opt_class();
    id v15 = v10;
    if (v14)
    {
      if (objc_opt_isKindOfClass()) {
        v16 = v15;
      }
      else {
        v16 = 0;
      }
    }
    else
    {
      v16 = 0;
    }
    id v17 = v16;

    id v13 = [(SBDisplayItem *)self _initWithArrayPlistRepresentation:v17];
  }
  id v18 = v13;

  return v18;
}

- (id)_initWithDictionaryPlistRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"itemType"];
  id v6 = [v4 objectForKey:@"bundleID"];
  id v7 = [v4 objectForKey:@"uniqueID"];

  id v8 = 0;
  if (v5 && v6)
  {
    uint64_t v9 = SBDisplayItemTypeFromLegacyType(v5);
    if (v9 == 5)
    {
      uint64_t v10 = +[SBWebApplication _webAppIdentifierFromWebClipIdentifier:v7];

      id v7 = (void *)v10;
    }
    self = [(SBDisplayItem *)self initWithType:v9 bundleIdentifier:v6 uniqueIdentifier:v7];
    id v8 = self;
  }

  return v8;
}

- (id)_initWithArrayPlistRepresentation:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && (unint64_t)[v4 count] >= 2)
  {
    id v6 = [v5 objectAtIndexedSubscript:0];
    uint64_t v7 = objc_opt_class();
    id v8 = v6;
    if (v7)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 0;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    id v12 = v9;

    id v15 = [v5 objectAtIndexedSubscript:1];
    uint64_t v16 = objc_opt_class();
    id v17 = v15;
    if (v16)
    {
      if (objc_opt_isKindOfClass()) {
        id v18 = v17;
      }
      else {
        id v18 = 0;
      }
    }
    else
    {
      id v18 = 0;
    }
    uint64_t v10 = v18;

    if ((unint64_t)[v5 count] < 3)
    {
      id v11 = 0;
    }
    else
    {
      v19 = [v5 objectAtIndexedSubscript:2];
      uint64_t v20 = objc_opt_class();
      id v21 = v19;
      if (v20)
      {
        if (objc_opt_isKindOfClass()) {
          v22 = v21;
        }
        else {
          v22 = 0;
        }
      }
      else
      {
        v22 = 0;
      }
      id v11 = v22;
    }
    id v13 = 0;
    if (v12 && v10)
    {
      uint64_t v23 = SBDisplayItemTypeFromLegacyType(v12);
      uint64_t v24 = v23;
      if (v23 || v11)
      {
        if (v23 == 5)
        {
          if (v11)
          {
            uint64_t v25 = +[SBWebApplication _webAppIdentifierFromWebClipIdentifier:v11];

            id v11 = (id)v25;
          }
          else
          {
            id v11 = +[SBWebApplication _webAppIdentifierFromWebClipIdentifier:v10];
            v26 = @"com.apple.webapp";

            uint64_t v10 = v26;
          }
        }
      }
      else
      {
        id v11 = [(SBDisplayItem *)self _newSceneIdentifierForBundleIdentifier:v10];
      }
      self = [(SBDisplayItem *)self initWithType:v24 bundleIdentifier:v10 uniqueIdentifier:v11];
      id v13 = self;
    }
  }
  else
  {
    uint64_t v10 = 0;
    id v11 = 0;
    id v12 = 0;
    id v13 = 0;
  }

  return v13;
}

- (SBDisplayItem)initWithLegacyPlistRepresentation:(id)a3
{
  return (SBDisplayItem *)[(SBDisplayItem *)self _initWithLegacyPlistRepresentation:a3 sceneIdentifierFromBundleIdentifierGenerator:0];
}

- (id)_initWithLegacyPlistRepresentation:(id)a3 sceneIdentifierFromBundleIdentifierGenerator:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)[a4 copy];
  id sceneIdentifierFromBundleIdentifierGenerator = self->_sceneIdentifierFromBundleIdentifierGenerator;
  self->_id sceneIdentifierFromBundleIdentifierGenerator = v7;

  uint64_t v9 = objc_opt_class();
  uint64_t v10 = SBSafeCast(v9, v6);

  if (v10 && [v10 count] == 2)
  {
    id v11 = [v10 objectAtIndexedSubscript:0];
    uint64_t v12 = SBDisplayItemTypeFromLegacyType(v11);
    id v13 = [v10 objectAtIndexedSubscript:1];
    uint64_t v14 = v13;
    if (v12 == 5)
    {
      id v15 = @"com.apple.webapp";
      id v17 = +[SBWebApplication _webAppIdentifierFromWebClipIdentifier:v14];
    }
    else
    {
      id v15 = 0;
      uint64_t v16 = 0;
      if (v12)
      {
LABEL_9:
        self = [(SBDisplayItem *)self initWithType:v12 bundleIdentifier:v15 uniqueIdentifier:v16];

        id v18 = self;
        goto LABEL_10;
      }
      id v15 = v13;
      id v17 = [(SBDisplayItem *)self _newSceneIdentifierForBundleIdentifier:v15];
    }
    uint64_t v16 = v17;
    goto LABEL_9;
  }
  id v18 = 0;
LABEL_10:

  return v18;
}

- (id)_newSceneIdentifierForBundleIdentifier:(id)a3
{
  id sceneIdentifierFromBundleIdentifierGenerator = self->_sceneIdentifierFromBundleIdentifierGenerator;
  if (sceneIdentifierFromBundleIdentifierGenerator)
  {
    id v4 = (void (*)(void *, id))sceneIdentifierFromBundleIdentifierGenerator[2];
    id v5 = a3;
    id v6 = v4(sceneIdentifierFromBundleIdentifierGenerator, v5);
  }
  else
  {
    id v7 = a3;
    id v5 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
    id v6 = (void *)[v5 newSceneIdentifierForBundleIdentifier:v7];
  }
  return v6;
}

- (NSString)webClipIdentifier
{
  if ([(SBDisplayItem *)self type] == 5)
  {
    v3 = [(SBDisplayItem *)self uniqueIdentifier];
    id v4 = +[SBWebApplication _webClipIdentifierFromWebAppIdentifier:v3];
  }
  else
  {
    id v4 = 0;
  }
  return (NSString *)v4;
}

- (id)plistRepresentation
{
  v13[2] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(SBDisplayItem *)self type];
  unint64_t v4 = v3;
  id v5 = (void *)MEMORY[0x1E4F1CA60];
  v12[0] = @"itemType";
  if (v3 > 7) {
    id v6 = 0;
  }
  else {
    id v6 = off_1E6AF9E30[v3];
  }
  v13[0] = v6;
  v12[1] = @"bundleID";
  id v7 = [(SBDisplayItem *)self bundleIdentifier];
  v13[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  uint64_t v9 = [v5 dictionaryWithDictionary:v8];

  if (v4 == 5) {
    [(SBDisplayItem *)self webClipIdentifier];
  }
  else {
  uint64_t v10 = [(SBDisplayItem *)self uniqueIdentifier];
  }
  if (v10) {
    [v9 setObject:v10 forKey:@"uniqueID"];
  }

  return v9;
}

+ (SBDisplayItem)displayItemWithProtobufRepresentation:(id)a3
{
  id v3 = a3;
  unint64_t v4 = v3;
  if (v3)
  {
    switch(-[SBPBDisplayItem type]((uint64_t)v3))
    {
      case 1u:
        uint64_t v5 = 1;
        goto LABEL_9;
      case 2u:
        uint64_t v5 = 2;
        goto LABEL_9;
      case 3u:
        uint64_t v5 = 3;
        goto LABEL_9;
      case 4u:
        uint64_t v5 = 4;
        goto LABEL_9;
      case 5u:
        id v7 = -[SBPBDisplayItem bundleIdentifier]((uint64_t)v4);
        uint64_t v10 = -[SBPBDisplayItem webClipIdentifier]((uint64_t)v4);
        if (v10)
        {
          id v8 = +[SBWebApplication _webAppIdentifierFromWebClipIdentifier:v10];
        }
        else
        {
          id v8 = 0;
        }

        uint64_t v5 = 5;
        goto LABEL_10;
      default:
        uint64_t v5 = 0;
LABEL_9:
        id v7 = -[SBPBDisplayItem bundleIdentifier]((uint64_t)v4);
        id v8 = -[SBPBDisplayItem sceneIdentifier]((uint64_t)v4);
LABEL_10:
        id v6 = +[SBDisplayItem displayItemWithType:v5 bundleIdentifier:v7 uniqueIdentifier:v8];

        break;
    }
  }
  else
  {
    id v6 = 0;
  }

  return (SBDisplayItem *)v6;
}

- (id)protobufRepresentation
{
  unint64_t v4 = objc_alloc_init(SBPBDisplayItem);
  uint64_t v5 = [(SBDisplayItem *)self type];
  int v6 = protobufDisplayItemTypeFromType(v5);
  -[SBPBDisplayItem setType:]((uint64_t)v4, v6);
  id v7 = [(SBDisplayItem *)self bundleIdentifier];
  -[SBPBDisplayItem setBundleIdentifier:]((uint64_t)v4, v7);

  if (v5 == 5)
  {
    id v8 = [(SBDisplayItem *)self webClipIdentifier];

    if (!v8)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"SBDisplayItem.m" lineNumber:371 description:@"Malformed display item"];
    }
    uint64_t v9 = [(SBDisplayItem *)self webClipIdentifier];
    -[SBPBDisplayItem setWebClipIdentifier:]((uint64_t)v4, v9);
  }
  else
  {
    uint64_t v9 = [(SBDisplayItem *)self uniqueIdentifier];
    -[SBPBDisplayItem setSceneIdentifier:]((uint64_t)v4, v9);
  }

  return v4;
}

- (BOOL)isHomeScreenDisplayItem
{
  if ([(SBDisplayItem *)self type] != 1) {
    return 0;
  }
  id v3 = [(SBDisplayItem *)self bundleIdentifier];
  unint64_t v4 = FBSystemAppBundleID();
  char v5 = [v3 isEqual:v4];

  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  char v5 = self;
  int v6 = SBSafeCast((uint64_t)v5, v4);

  if (v6)
  {
    id v7 = [(SBDisplayItem *)self uniqueIdentifier];
    id v8 = [v6 uniqueIdentifier];
    int64_t v9 = [v7 compare:v8];

    if (!v9)
    {
      uint64_t v10 = [(SBDisplayItem *)self type];
      if (v10 <= [v6 type])
      {
        uint64_t v11 = [(SBDisplayItem *)self type];
        if (v11 >= [v6 type]) {
          int64_t v9 = 0;
        }
        else {
          int64_t v9 = -1;
        }
      }
      else
      {
        int64_t v9 = 1;
      }
    }
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  return (NSString *)[(SBDisplayItem *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBDisplayItem *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)displayItemForFloatingDockSuggestionsComparison
{
  id v3 = [(SBDisplayItem *)self bundleIdentifier];
  unint64_t v4 = [(SBDisplayItem *)self type];
  if (v4 > 7)
  {
    int v6 = 0;
  }
  else
  {
    if (((1 << v4) & 0xEE) != 0)
    {
      char v5 = self;
    }
    else
    {
      char v5 = [(id)objc_opt_class() displayItemWithType:0 bundleIdentifier:v3 uniqueIdentifier:0];
    }
    int v6 = v5;
  }

  return v6;
}

- (BOOL)isEqualToDisplayItemForFloatingDockSuggestions:(id)a3
{
  id v4 = a3;
  if ([(SBDisplayItem *)self isEqual:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    unint64_t v6 = [(SBDisplayItem *)self type];
    if (v6 == [v4 type])
    {
      id v7 = [(SBDisplayItem *)self bundleIdentifier];
      id v8 = [v4 bundleIdentifier];
      int v9 = BSEqualObjects();
      unsigned int v10 = (0x11u >> v6) & 1;
      if (v6 > 7) {
        LOBYTE(v10) = 0;
      }
      if (v9) {
        BOOL v5 = v10;
      }
      else {
        BOOL v5 = 0;
      }
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

@end