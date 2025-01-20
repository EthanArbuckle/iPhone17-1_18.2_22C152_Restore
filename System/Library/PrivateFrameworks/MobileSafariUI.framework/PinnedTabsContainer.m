@interface PinnedTabsContainer
+ (id)containerWithActiveProfileIdentifier:(id)a3;
+ (id)containerWithPrivateBrowsing:(BOOL)a3;
- (BOOL)isInDefaultProfile;
- (BOOL)isPrivateBrowsingEnabled;
- (NSString)activeProfileIdentifier;
@end

@implementation PinnedTabsContainer

- (void).cxx_destruct
{
}

- (BOOL)isPrivateBrowsingEnabled
{
  return self->_privateBrowsingEnabled;
}

+ (id)containerWithPrivateBrowsing:(BOOL)a3
{
  v4 = objc_alloc_init(PinnedTabsContainer);
  v4->_privateBrowsingEnabled = a3;
  v4->_isInDefaultProfile = 1;
  objc_storeStrong((id *)&v4->_activeProfileIdentifier, (id)*MEMORY[0x1E4F980C8]);
  return v4;
}

- (BOOL)isInDefaultProfile
{
  return self->_isInDefaultProfile;
}

+ (id)containerWithActiveProfileIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PinnedTabsContainer);
  uint64_t v5 = [v3 copy];

  activeProfileIdentifier = v4->_activeProfileIdentifier;
  v4->_activeProfileIdentifier = (NSString *)v5;

  return v4;
}

- (NSString)activeProfileIdentifier
{
  return self->_activeProfileIdentifier;
}

@end