@interface SBContinuityDisplayItem
+ (id)continuityAppDisplayItemWithBundleIdentifier:(id)a3 appSuggestion:(id)a4;
- (BOOL)isEqual:(id)a3;
- (SBBestAppSuggestion)appSuggestion;
- (SBContinuityDisplayItem)initWithType:(int64_t)a3 displayIdentifier:(id)a4 appSuggestion:(id)a5;
- (unint64_t)hash;
@end

@implementation SBContinuityDisplayItem

+ (id)continuityAppDisplayItemWithBundleIdentifier:(id)a3 appSuggestion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithType:4 bundleIdentifier:v7 uniqueIdentifier:0];

  v9 = (void *)v8[6];
  v8[6] = v6;

  return v8;
}

- (SBContinuityDisplayItem)initWithType:(int64_t)a3 displayIdentifier:(id)a4 appSuggestion:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SBContinuityDisplayItem;
  v10 = [(SBDisplayItem *)&v13 initWithType:a3 bundleIdentifier:a4 uniqueIdentifier:0];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_appSuggestion, a5);
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    && ([v4 uniqueStringRepresentation],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [(SBDisplayItem *)self uniqueStringRepresentation],
        v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = BSEqualObjects(),
        v8,
        v7,
        v9))
  {
    v10 = [v4 appSuggestion];
    v11 = [(SBContinuityDisplayItem *)self appSuggestion];
    char v12 = BSEqualObjects();
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = [(SBDisplayItem *)self uniqueStringRepresentation];
  uint64_t v4 = [v3 hash];
  v5 = [(SBContinuityDisplayItem *)self appSuggestion];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (SBBestAppSuggestion)appSuggestion
{
  return self->_appSuggestion;
}

- (void).cxx_destruct
{
}

@end