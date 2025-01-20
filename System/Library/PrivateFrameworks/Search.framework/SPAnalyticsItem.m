@interface SPAnalyticsItem
- (BOOL)isDisplayNameCorrectionsMatch;
- (BOOL)isLocalApplicationResult;
- (BOOL)isLocalShortcut;
- (BOOL)isStaticCorrection;
- (NSString)applicationBundleIdentifier;
- (NSString)contactIdentifier;
- (NSString)identifier;
- (NSString)sectionBundleIdentifier;
- (SPAnalyticsItem)initWithResult:(id)a3;
- (int)topHit;
- (int)type;
- (void)setIsDisplayNameCorrectionsMatch:(BOOL)a3;
- (void)setIsLocalApplicationResult:(BOOL)a3;
- (void)setIsLocalShortcut:(BOOL)a3;
- (void)setIsStaticCorrection:(BOOL)a3;
@end

@implementation SPAnalyticsItem

- (SPAnalyticsItem)initWithResult:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SPAnalyticsItem;
  v5 = [(SPAnalyticsItem *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 applicationBundleIdentifier];
    applicationBundleIdentifier = v5->_applicationBundleIdentifier;
    v5->_applicationBundleIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 sectionBundleIdentifier];
    sectionBundleIdentifier = v5->_sectionBundleIdentifier;
    v5->_sectionBundleIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 identifier];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    uint64_t v12 = [v4 contactIdentifier];
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v12;

    v5->_type = [v4 type];
    v5->_isLocalApplicationResult = [v4 isLocalApplicationResult];
    v5->_topHit = [v4 topHit];
    v5->_isStaticCorrection = [v4 isStaticCorrection];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = [v4 rankingItem];
      if ([v14 didMatchRankingDescriptor:*MEMORY[0x263F78EC0]]) {
        v5->_isDisplayNameCorrectionsMatch = 1;
      }
      v15 = [v4 launchString];

      if (v15) {
        v5->_isLocalShortcut = 1;
      }
    }
  }

  return v5;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (NSString)sectionBundleIdentifier
{
  return self->_sectionBundleIdentifier;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (int)type
{
  return self->_type;
}

- (BOOL)isLocalShortcut
{
  return self->_isLocalShortcut;
}

- (void)setIsLocalShortcut:(BOOL)a3
{
  self->_isLocalShortcut = a3;
}

- (BOOL)isLocalApplicationResult
{
  return self->_isLocalApplicationResult;
}

- (void)setIsLocalApplicationResult:(BOOL)a3
{
  self->_isLocalApplicationResult = a3;
}

- (BOOL)isDisplayNameCorrectionsMatch
{
  return self->_isDisplayNameCorrectionsMatch;
}

- (void)setIsDisplayNameCorrectionsMatch:(BOOL)a3
{
  self->_isDisplayNameCorrectionsMatch = a3;
}

- (BOOL)isStaticCorrection
{
  return self->_isStaticCorrection;
}

- (void)setIsStaticCorrection:(BOOL)a3
{
  self->_isStaticCorrection = a3;
}

- (int)topHit
{
  return self->_topHit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_sectionBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
}

@end