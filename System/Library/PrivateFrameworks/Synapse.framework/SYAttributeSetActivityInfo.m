@interface SYAttributeSetActivityInfo
- (CSSearchableItemAttributeSet)attributeSet;
- (NSString)activityType;
- (NSString)persistentIdentifier;
- (NSString)targetContentIdentifier;
- (NSURL)canonicalURL;
- (NSURL)webpageURL;
- (SYAttributeSetActivityInfo)initWithAttributeSet:(id)a3;
@end

@implementation SYAttributeSetActivityInfo

- (SYAttributeSetActivityInfo)initWithAttributeSet:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SYAttributeSetActivityInfo;
  v6 = [(SYAttributeSetActivityInfo *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_attributeSet, a3);
  }

  return v7;
}

- (NSString)activityType
{
  v3 = +[SYItemIndexingManager _customKeyForKey:@"sy_activityType"];
  v4 = [(SYAttributeSetActivityInfo *)self attributeSet];
  uint64_t v5 = [v4 valueForCustomKey:v3];
  v6 = (void *)v5;
  v7 = &stru_1F1E16740;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  v8 = v7;

  return (NSString *)v8;
}

- (NSURL)webpageURL
{
  v2 = [(SYAttributeSetActivityInfo *)self attributeSet];
  v3 = [v2 URL];

  return (NSURL *)v3;
}

- (NSURL)canonicalURL
{
  v3 = +[SYItemIndexingManager _customKeyForKey:@"sy_canonicalURL"];
  v4 = [(SYAttributeSetActivityInfo *)self attributeSet];
  uint64_t v5 = [v4 valueForCustomKey:v3];

  if (v5)
  {
    v6 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
  }
  else
  {
    v6 = 0;
  }

  return (NSURL *)v6;
}

- (NSString)targetContentIdentifier
{
  v3 = +[SYItemIndexingManager _customKeyForKey:@"sy_activityTargetContentID"];
  v4 = [(SYAttributeSetActivityInfo *)self attributeSet];
  uint64_t v5 = [v4 valueForCustomKey:v3];

  return (NSString *)v5;
}

- (NSString)persistentIdentifier
{
  v3 = +[SYItemIndexingManager _customKeyForKey:@"sy_activityPersistentID"];
  v4 = [(SYAttributeSetActivityInfo *)self attributeSet];
  uint64_t v5 = [v4 valueForCustomKey:v3];

  return (NSString *)v5;
}

- (CSSearchableItemAttributeSet)attributeSet
{
  return self->_attributeSet;
}

- (void).cxx_destruct
{
}

@end