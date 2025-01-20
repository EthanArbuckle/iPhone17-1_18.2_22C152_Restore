@interface GKGameStatServiceInterface(NillableShim)
+ (uint64_t)getEntriesForLeaderboard:()NillableShim gameDescriptor:localPlayer:playerScope:timeScope:range:players:locale:from:handler:;
@end

@implementation GKGameStatServiceInterface(NillableShim)

+ (uint64_t)getEntriesForLeaderboard:()NillableShim gameDescriptor:localPlayer:playerScope:timeScope:range:players:locale:from:handler:
{
  return objc_msgSend(a13, "getEntriesForLeaderboard:gameDescriptor:localPlayer:playerScope:timeScope:range:players:locale:handler:");
}

@end