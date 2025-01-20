@interface VUIRestrictions
+ (id)sharedInstance;
- (BOOL)allowsExplicitContent;
- (BOOL)allowsShowingUndownloadedMovies;
- (BOOL)allowsShowingUndownloadedTVShows;
@end

@implementation VUIRestrictions

- (BOOL)allowsShowingUndownloadedTVShows
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  int v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x1E4F74178]];

  return v3 != 2;
}

- (BOOL)allowsShowingUndownloadedMovies
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  int v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x1E4F74170]];

  return v3 != 2;
}

+ (id)sharedInstance
{
  if (sharedInstance___onceToken_0 != -1) {
    dispatch_once(&sharedInstance___onceToken_0, &__block_literal_global_21);
  }
  v2 = (void *)sharedInstance___sharedInstance_2;
  return v2;
}

uint64_t __33__VUIRestrictions_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(VUIRestrictions);
  uint64_t v1 = sharedInstance___sharedInstance_2;
  sharedInstance___sharedInstance_2 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (BOOL)allowsExplicitContent
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  int v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x1E4F73FE8]];

  return v3 != 2;
}

@end