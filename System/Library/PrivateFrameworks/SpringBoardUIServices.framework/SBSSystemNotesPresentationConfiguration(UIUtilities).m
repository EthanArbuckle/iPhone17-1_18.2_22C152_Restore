@interface SBSSystemNotesPresentationConfiguration(UIUtilities)
- (id)_uiActivityContinuationAction;
@end

@implementation SBSSystemNotesPresentationConfiguration(UIUtilities)

- (id)_uiActivityContinuationAction
{
  v2 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
  v3 = [a1 userActivityData];
  [v2 setObject:v3 forKeyedSubscript:&unk_1EFCEAD70];

  v4 = [a1 userActivity];
  v5 = [v4 activityType];
  [v2 setObject:v5 forKeyedSubscript:&unk_1EFCEAD88];

  v6 = [a1 userActivity];
  v7 = [v6 activityType];
  [v2 setObject:v7 forKeyedSubscript:&unk_1EFCEADA0];

  v8 = [MEMORY[0x1E4F1C9C8] date];
  [v2 setObject:v8 forKeyedSubscript:&unk_1EFCEADB8];

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F42700]) initWithSettings:v2];
  return v9;
}

@end