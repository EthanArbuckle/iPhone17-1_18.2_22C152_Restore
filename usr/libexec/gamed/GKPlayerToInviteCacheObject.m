@interface GKPlayerToInviteCacheObject
+ (id)entityName;
- (id)internalRepresentation;
@end

@implementation GKPlayerToInviteCacheObject

+ (id)entityName
{
  return @"PlayerToInvite";
}

- (id)internalRepresentation
{
  v3 = [(GKPlayerToInviteCacheObject *)self managedObjectContext];
  v4 = [(GKPlayerToInviteCacheObject *)self playerID];
  v5 = +[GKPlayerProfileCacheObject playerProfileWithPlayerID:v4 inManagedObjectContext:v3];

  v6 = +[GKPlayerInternal internalRepresentationForCacheObject:v5];

  return v6;
}

@end