@interface GKProfileServiceInterface(NillableShim)
+ (uint64_t)getProfilesForPlayerIDs:()NillableShim fetchOptions:from:handler:;
@end

@implementation GKProfileServiceInterface(NillableShim)

+ (uint64_t)getProfilesForPlayerIDs:()NillableShim fetchOptions:from:handler:
{
  return [a5 getProfilesForPlayerIDs:a3 fetchOptions:a4 handler:a6];
}

@end