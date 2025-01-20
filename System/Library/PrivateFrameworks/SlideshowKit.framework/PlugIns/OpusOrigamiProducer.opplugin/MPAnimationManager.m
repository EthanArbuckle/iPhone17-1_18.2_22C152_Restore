@interface MPAnimationManager
+ (id)sharedManager;
+ (void)loadAnimationManagerWithPaths:(id)a3;
+ (void)releaseSharedManager;
- (MPAnimationManager)initWithPaths:(id)a3;
- (id)animationDescriptionForAnimationID:(id)a3;
- (id)animationDescriptionForAnimationSetID:(id)a3;
- (void)dealloc;
@end

@implementation MPAnimationManager

+ (id)sharedManager
{
  id result = (id)qword_1F13D8;
  if (!qword_1F13D8)
  {
    objc_sync_enter(a1);
    if (!qword_1F13D8) {
      qword_1F13D8 = [[MPAnimationManager alloc] initWithPaths:0];
    }
    objc_sync_exit(a1);
    return (id)qword_1F13D8;
  }
  return result;
}

+ (void)releaseSharedManager
{
  if (qword_1F13D8)
  {
    objc_sync_enter(a1);

    qword_1F13D8 = 0;
    objc_sync_exit(a1);
  }
}

- (void)dealloc
{
  self->mAnimationSets = 0;
  self->mAnimations = 0;
  v3.receiver = self;
  v3.super_class = (Class)MPAnimationManager;
  [(MPAnimationManager *)&v3 dealloc];
}

- (id)animationDescriptionForAnimationSetID:(id)a3
{
  return [(NSMutableDictionary *)self->mAnimationSets objectForKey:a3];
}

- (id)animationDescriptionForAnimationID:(id)a3
{
  return [(NSMutableDictionary *)self->mAnimations objectForKey:a3];
}

+ (void)loadAnimationManagerWithPaths:(id)a3
{
  if (qword_1F13D8)
  {

    qword_1F13D8 = 0;
  }
  qword_1F13D8 = [[MPAnimationManager alloc] initWithPaths:a3];
}

- (MPAnimationManager)initWithPaths:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)MPAnimationManager;
  v16 = [(MPAnimationManager *)&v21 init];
  if (v16)
  {
    v16->mAnimations = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v16->mAnimationSets = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v4 = +[NSMutableArray array];
    v5 = v4;
    if (a3) {
      [v4 addObjectsFromArray:a3];
    }
    else {
      objc_msgSend(v4, "addObject:", -[NSString stringByAppendingPathComponent:](-[NSBundle resourcePath](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class()), "resourcePath"), "stringByAppendingPathComponent:", @"Content"));
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v11 = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", [v10 stringByAppendingPathComponent:@"AnimationDescriptions.plist"]);
          if (v11)
          {
            id v12 = +[NSPropertyListSerialization propertyListWithData:v11 options:2 format:0 error:0];
            if (v12) {
              [(NSMutableDictionary *)v16->mAnimations addEntriesFromDictionary:v12];
            }
          }
          v13 = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", [v10 stringByAppendingPathComponent:@"AnimatedSets.plist"]);
          if (v13)
          {
            id v14 = +[NSPropertyListSerialization propertyListWithData:v13 options:2 format:0 error:0];
            if (v14) {
              [(NSMutableDictionary *)v16->mAnimationSets addEntriesFromDictionary:v14];
            }
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v7);
    }
  }
  return v16;
}

@end