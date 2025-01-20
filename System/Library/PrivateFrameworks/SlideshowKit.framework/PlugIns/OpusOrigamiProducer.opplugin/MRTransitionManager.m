@interface MRTransitionManager
+ (id)sharedManager;
+ (void)initialize;
- (BOOL)canHandleKenBurnsForTransitionID:(id)a3;
- (BOOL)needsSourceLayerImageForPrecomputingForTransitionID:(id)a3;
- (BOOL)needsSourceLayerToBeOpaqueForSimple3DTransitionSubtype:(int64_t)a3;
- (BOOL)needsTargetLayerImageForPrecomputingForTransitionID:(id)a3;
- (BOOL)needsTargetLayerToBeOpaqueForSimple3DTransitionSubtype:(int64_t)a3;
- (BOOL)noContentsMotionForTransitionID:(id)a3;
- (MRTransitionManager)initWithPaths:(id)a3;
- (id)descriptionForTransitionID:(id)a3;
- (id)resourcePathForTransitionID:(id)a3 andResource:(id)a4;
- (id)transitionWithTransitionID:(id)a3;
- (void)cleanup;
- (void)dealloc;
- (void)recycleTransition:(id)a3;
- (void)releaseResources;
@end

@implementation MRTransitionManager

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___MRTransitionManager;
  objc_msgSendSuper2(&v2, "initialize");
  if (!qword_1F1428) {
    qword_1F1428 = [[MRTransitionManager alloc] initWithPaths:0];
  }
}

+ (id)sharedManager
{
  return (id)qword_1F1428;
}

- (MRTransitionManager)initWithPaths:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MRTransitionManager;
  v3 = [(MRTransitionManager *)&v5 init];
  if (v3)
  {
    v3->mTransitionSets = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v3->mTransitionPools = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  return v3;
}

- (void)dealloc
{
  [(MRTransitionManager *)self cleanup];
  v3.receiver = self;
  v3.super_class = (Class)MRTransitionManager;
  [(MRTransitionManager *)&v3 dealloc];
}

- (void)cleanup
{
  self->mTransitionSets = 0;
  self->mTransitionPools = 0;
}

- (void)releaseResources
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obj = self->mTransitionSets;
  id v3 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v8 = [(NSMutableDictionary *)self->mTransitionSets objectForKey:v7];
        id v9 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v16;
          do
          {
            for (j = 0; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v16 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v15 + 1) + 8 * (void)j);
              if ([v13 isRetainedByTransitioner]) {
                NSLog(@"[MRTransitionManager releaseResources] called while resources still in use. May leak.");
              }
              else {
                [v13 cleanup];
              }
            }
            id v10 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v10);
        }
      }
      id v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v4);
  }
  [(NSMutableDictionary *)self->mTransitionSets removeAllObjects];
  [(NSMutableDictionary *)self->mTransitionPools removeAllObjects];
}

- (id)transitionWithTransitionID:(id)a3
{
  if (a3)
  {
    objc_sync_enter(self);
    id v5 = [(NSMutableDictionary *)self->mTransitionPools objectForKey:a3];
    v6 = v5;
    if (v5 && [v5 count])
    {
      uint64_t v7 = (NSNull *)[v6 anyObject];
      if (v7 != +[NSNull null])
      {
        [v6 removeObject:v7];
LABEL_19:
        objc_sync_exit(self);
        return v7;
      }
    }
    else
    {
      id v8 = objc_msgSend(-[MRTransitionManager descriptionForTransitionID:](self, "descriptionForTransitionID:", a3), "objectForKey:", @"className");
      if (v8) {
        id v9 = v8;
      }
      else {
        id v9 = a3;
      }
      id v10 = NSClassFromString((NSString *)[@"MRTransition" stringByAppendingString:v9]);
      uint64_t v11 = +[NSBundle bundleForClass:v10];
      if (v11 == +[NSBundle bundleForClass:objc_opt_class()])
      {
        if (v10)
        {
          uint64_t v7 = (NSNull *)[[v10 alloc] initWithTransitionID:a3];
          if (v7)
          {
            id v12 = [(NSMutableDictionary *)self->mTransitionSets objectForKey:a3];
            if (v12) {
              [v12 addObject:v7];
            }
            else {
              [(NSMutableDictionary *)self->mTransitionSets setObject:+[NSMutableSet setWithObject:v7] forKey:a3];
            }

            goto LABEL_19;
          }
        }
      }
      [(NSMutableDictionary *)self->mTransitionPools setObject:+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", +[NSNull null]) forKey:a3];
    }
    uint64_t v7 = 0;
    goto LABEL_19;
  }
  return 0;
}

- (void)recycleTransition:(id)a3
{
  objc_sync_enter(self);
  id v5 = -[NSMutableDictionary objectForKey:](self->mTransitionPools, "objectForKey:", [a3 transitionID]);
  if (v5) {
    [v5 addObject:a3];
  }
  else {
    -[NSMutableDictionary setObject:forKey:](self->mTransitionPools, "setObject:forKey:", +[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", a3), [a3 transitionID]);
  }
  objc_sync_exit(self);
}

- (id)descriptionForTransitionID:(id)a3
{
  id v4 = +[MPTransitionManager sharedManager];
  return [v4 descriptionForTransitionID:a3];
}

- (id)resourcePathForTransitionID:(id)a3 andResource:(id)a4
{
  id v5 = objc_msgSend(-[MRTransitionManager descriptionForTransitionID:](self, "descriptionForTransitionID:", a3), "objectForKey:", @"resourceFolderPath");
  if (!v5) {
    return a4;
  }
  return [v5 stringByAppendingPathComponent:a4];
}

- (BOOL)canHandleKenBurnsForTransitionID:(id)a3
{
  id v3 = objc_msgSend(-[MRTransitionManager descriptionForTransitionID:](self, "descriptionForTransitionID:", a3), "objectForKey:", @"canHandleKenBurns");
  return [v3 BOOLValue];
}

- (BOOL)noContentsMotionForTransitionID:(id)a3
{
  id v3 = objc_msgSend(-[MRTransitionManager descriptionForTransitionID:](self, "descriptionForTransitionID:", a3), "objectForKey:", @"noContentsMotion");
  return [v3 BOOLValue];
}

- (BOOL)needsSourceLayerImageForPrecomputingForTransitionID:(id)a3
{
  id v3 = objc_msgSend(-[MRTransitionManager descriptionForTransitionID:](self, "descriptionForTransitionID:", a3), "objectForKey:", @"needsSourceLayerImage");
  return [v3 BOOLValue];
}

- (BOOL)needsTargetLayerImageForPrecomputingForTransitionID:(id)a3
{
  id v3 = objc_msgSend(-[MRTransitionManager descriptionForTransitionID:](self, "descriptionForTransitionID:", a3), "objectForKey:", @"needsTargetLayerImage");
  return [v3 BOOLValue];
}

- (BOOL)needsSourceLayerToBeOpaqueForSimple3DTransitionSubtype:(int64_t)a3
{
  return a3 == 6;
}

- (BOOL)needsTargetLayerToBeOpaqueForSimple3DTransitionSubtype:(int64_t)a3
{
  return a3 == 5;
}

@end