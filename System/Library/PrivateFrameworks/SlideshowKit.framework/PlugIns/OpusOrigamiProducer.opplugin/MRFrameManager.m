@interface MRFrameManager
+ (id)sharedManager;
+ (void)initialize;
- (MRFrameManager)init;
- (id)frameWithFrameID:(id)a3;
- (id)resourcePathForFrameID:(id)a3 andResource:(id)a4;
- (id)sizeScriptForFrameID:(id)a3;
- (void)cleanup;
- (void)dealloc;
- (void)recycleFrame:(id)a3;
- (void)releaseResources;
@end

@implementation MRFrameManager

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___MRFrameManager;
  objc_msgSendSuper2(&v2, "initialize");
  if (!qword_1F1440) {
    qword_1F1440 = objc_alloc_init(MRFrameManager);
  }
}

+ (id)sharedManager
{
  return (id)qword_1F1440;
}

- (MRFrameManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)MRFrameManager;
  objc_super v2 = [(MRFrameManager *)&v4 init];
  if (v2)
  {
    v2->mFrameSets = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->mFramePools = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  return v2;
}

- (void)dealloc
{
  [(MRFrameManager *)self cleanup];
  v3.receiver = self;
  v3.super_class = (Class)MRFrameManager;
  [(MRFrameManager *)&v3 dealloc];
}

- (void)cleanup
{
  self->mFrameSets = 0;
  self->mFramePools = 0;
}

- (void)releaseResources
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obj = self->mFrameSets;
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
        id v8 = [(NSMutableDictionary *)self->mFrameSets objectForKey:v7];
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
              if ([v13 isRetainedBySlideProvider]) {
                NSLog(@"[MRFrameManager releaseResources] called while resources still in use. May leak.");
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
  [(NSMutableDictionary *)self->mFrameSets removeAllObjects];
  [(NSMutableDictionary *)self->mFramePools removeAllObjects];
}

- (id)frameWithFrameID:(id)a3
{
  if (a3)
  {
    objc_sync_enter(self);
    id v5 = [(NSMutableDictionary *)self->mFramePools objectForKey:a3];
    v6 = v5;
    if (v5 && [v5 count])
    {
      uint64_t v7 = (NSNull *)[v6 anyObject];
      if (v7 != +[NSNull null])
      {
        [v6 removeObject:v7];
LABEL_21:
        objc_sync_exit(self);
        return v7;
      }
    }
    else
    {
      id v8 = objc_msgSend(objc_msgSend(+[MPFrameManager sharedManager](MPFrameManager, "sharedManager"), "descriptionForFrameID:", a3), "objectForKey:", @"className");
      if (v8) {
        id v9 = v8;
      }
      else {
        id v9 = a3;
      }
      id v10 = NSClassFromString((NSString *)[@"MRFrame" stringByAppendingString:v9]);
      uint64_t v11 = +[NSBundle bundleForClass:v10];
      if (v11 == +[NSBundle bundleForClass:objc_opt_class()] && v10 != 0)
      {
        uint64_t v7 = (NSNull *)[[v10 alloc] initWithFrameID:a3];
        if (v7)
        {
          id v13 = [(NSMutableDictionary *)self->mFrameSets objectForKey:a3];
          if (v13) {
            [v13 addObject:v7];
          }
          else {
            [(NSMutableDictionary *)self->mFrameSets setObject:+[NSMutableSet setWithObject:v7] forKey:a3];
          }

          goto LABEL_21;
        }
      }
      [(NSMutableDictionary *)self->mFramePools setObject:+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", +[NSNull null]) forKey:a3];
    }
    uint64_t v7 = 0;
    goto LABEL_21;
  }
  return 0;
}

- (void)recycleFrame:(id)a3
{
  objc_sync_enter(self);
  id v5 = -[NSMutableDictionary objectForKey:](self->mFramePools, "objectForKey:", [a3 frameID]);
  if (v5) {
    [v5 addObject:a3];
  }
  else {
    -[NSMutableDictionary setObject:forKey:](self->mFramePools, "setObject:forKey:", +[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", a3), [a3 frameID]);
  }
  objc_sync_exit(self);
}

- (id)resourcePathForFrameID:(id)a3 andResource:(id)a4
{
  id v5 = objc_msgSend(objc_msgSend(+[MPFrameManager sharedManager](MPFrameManager, "sharedManager"), "descriptionForFrameID:", a3), "objectForKey:", @"resourceFolderPath");
  if (!v5) {
    return a4;
  }
  return [v5 stringByAppendingPathComponent:a4];
}

- (id)sizeScriptForFrameID:(id)a3
{
  id v3 = objc_msgSend(+[MPFrameManager sharedManager](MPFrameManager, "sharedManager"), "descriptionForFrameID:", a3);
  return [v3 objectForKey:@"sizeScript"];
}

@end