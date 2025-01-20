@interface MusicKit_SoftLinking_MPMediaLibrary(MusicKit_SoftLinking_FilteringSupport)
+ (uint64_t)_softLinkingContentGroupsForUnderlyingContentGroups:()MusicKit_SoftLinking_FilteringSupport;
+ (uint64_t)_underlyingContentGroupsForSoftLinkingContentGroups:()MusicKit_SoftLinking_FilteringSupport;
+ (uint64_t)_underlyingFilteringOptionsForSoftLinkingFilteringOptions:()MusicKit_SoftLinking_FilteringSupport;
- (uint64_t)filterAvailableContentGroups:()MusicKit_SoftLinking_FilteringSupport withOptions:;
@end

@implementation MusicKit_SoftLinking_MPMediaLibrary(MusicKit_SoftLinking_FilteringSupport)

- (uint64_t)filterAvailableContentGroups:()MusicKit_SoftLinking_FilteringSupport withOptions:
{
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F385E0], "_underlyingContentGroupsForSoftLinkingContentGroups:");
  uint64_t v7 = [MEMORY[0x1E4F385E0] _underlyingFilteringOptionsForSoftLinkingFilteringOptions:a4];
  v8 = [a1 _underlyingMediaLibrary];
  uint64_t v9 = [v8 filterAvailableContentGroups:v6 withOptions:v7];

  v10 = (void *)MEMORY[0x1E4F385E0];
  return [v10 _softLinkingContentGroupsForUnderlyingContentGroups:v9];
}

+ (uint64_t)_underlyingContentGroupsForSoftLinkingContentGroups:()MusicKit_SoftLinking_FilteringSupport
{
  return a3 & 0x7FF;
}

+ (uint64_t)_softLinkingContentGroupsForUnderlyingContentGroups:()MusicKit_SoftLinking_FilteringSupport
{
  return a3 & 0x7FF;
}

+ (uint64_t)_underlyingFilteringOptionsForSoftLinkingFilteringOptions:()MusicKit_SoftLinking_FilteringSupport
{
  return a3 & 2;
}

@end