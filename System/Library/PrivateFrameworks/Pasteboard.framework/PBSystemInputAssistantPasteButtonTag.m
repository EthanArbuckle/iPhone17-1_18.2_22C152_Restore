@interface PBSystemInputAssistantPasteButtonTag
+ (BOOL)supportsSecureCoding;
- ($BEA516A46C1BA1F84587E5D243A711F7)backgroundStatisticsRegionForStyle:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (PBSystemInputAssistantPasteButtonTag)initWithCoder:(id)a3;
- (PBSystemInputAssistantPasteButtonTag)initWithSite:(int64_t)a3;
- (float)backgroundStatisticsFailingContrastForStyle:(id)a3;
- (float)backgroundStatisticsForegroundForStyle:(id)a3;
- (float)backgroundStatisticsPassingContrastForStyle:(id)a3;
- (id)_acceptCalloutBarPasteButtonTagVisit:(id)a3 systemInputAssistantPasteButtonTagVisit:(id)a4 undoInteractionHUDIconPasteButtonTagVisit:(id)a5 undoInteractionHUDTextPasteButtonTagVisit:(id)a6 contextMenuPasteButtonTagVisit:(id)a7 editMenuPasteButtonTagVisit:(id)a8;
- (id)resolvedStyleForStyle:(id)a3;
- (int64_t)site;
- (unint64_t)authenticationMessageContextForStyle:(id)a3;
- (unint64_t)hash;
- (unsigned)secureNameForStyle:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PBSystemInputAssistantPasteButtonTag

- (PBSystemInputAssistantPasteButtonTag)initWithSite:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PBSystemInputAssistantPasteButtonTag;
  result = [(PBSystemInputAssistantPasteButtonTag *)&v5 init];
  if (result) {
    result->_site = a3;
  }
  return result;
}

- (PBSystemInputAssistantPasteButtonTag)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PBSystemInputAssistantPasteButtonTag;
  objc_super v5 = [(PBPasteButtonTag *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_site = [v4 decodeIntegerForKey:@"site"];
  }

  return v5;
}

- (unint64_t)authenticationMessageContextForStyle:(id)a3
{
  if (self->_site) {
    return 0x2BB12563A205EBD1;
  }
  if ([a3 userInterfaceStyle]) {
    return 0x5597A8D691A21829;
  }
  return 0x70A52C167AE7B042;
}

- ($BEA516A46C1BA1F84587E5D243A711F7)backgroundStatisticsRegionForStyle:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 displayScale];
  unsigned int v5 = [v3 displayScale];

  return ($BEA516A46C1BA1F84587E5D243A711F7)(((2 * v4 + 4 * v5) << 48) | (v4 << 33) | ((((2 * v4
                                                                                          + 4 * (unint64_t)v5) >> 1) & 0x3FF) << 17) | (2 * v4));
}

- (float)backgroundStatisticsPassingContrastForStyle:(id)a3
{
  id v4 = a3;
  if ([v4 userInterfaceStyle] == 1)
  {
    float v5 = 2.1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PBSystemInputAssistantPasteButtonTag;
    [(PBPasteButtonTag *)&v8 backgroundStatisticsPassingContrastForStyle:v4];
    float v5 = v6;
  }

  return v5;
}

- (float)backgroundStatisticsFailingContrastForStyle:(id)a3
{
  id v4 = a3;
  if ([v4 userInterfaceStyle] == 1)
  {
    float v5 = 1.9;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PBSystemInputAssistantPasteButtonTag;
    [(PBPasteButtonTag *)&v8 backgroundStatisticsFailingContrastForStyle:v4];
    float v5 = v6;
  }

  return v5;
}

- (float)backgroundStatisticsForegroundForStyle:(id)a3
{
  [a3 tintColor];
  UISColorLuminance();
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PBSystemInputAssistantPasteButtonTag;
  id v4 = a3;
  [(PBPasteButtonTag *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_site, @"site", v5.receiver, v5.super_class);
}

- (unint64_t)hash
{
  return self->_site ^ +[PBSystemInputAssistantPasteButtonTag hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_site == v4[1];

  return v5;
}

- (BOOL)isValid
{
  return self->_site < 2;
}

- (id)resolvedStyleForStyle:(id)a3
{
  double v3 = (void *)[a3 copyWithChangeBlock:&__block_literal_global_117];
  return v3;
}

void __62__PBSystemInputAssistantPasteButtonTag_resolvedStyleForStyle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setAccessibilityButtonShapes:0];
  [v3 setAccessibilityContrast:0];
  [v3 setDisplayRange:0];
  [v3 setLocalization:@"en"];
  [v3 setPreferredContentSizeCategory:3];
  [v3 tintColor];
  UISColorLuminance();
  [v3 setUserInterfaceStyle:v2 > 0.5];
}

- (unsigned)secureNameForStyle:(id)a3
{
  return 0x10000;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_acceptCalloutBarPasteButtonTagVisit:(id)a3 systemInputAssistantPasteButtonTagVisit:(id)a4 undoInteractionHUDIconPasteButtonTagVisit:(id)a5 undoInteractionHUDTextPasteButtonTagVisit:(id)a6 contextMenuPasteButtonTagVisit:(id)a7 editMenuPasteButtonTagVisit:(id)a8
{
  if (a4)
  {
    v9 = (*((void (**)(id, PBSystemInputAssistantPasteButtonTag *, id))a4 + 2))(a4, self, a3);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (int64_t)site
{
  return self->_site;
}

@end