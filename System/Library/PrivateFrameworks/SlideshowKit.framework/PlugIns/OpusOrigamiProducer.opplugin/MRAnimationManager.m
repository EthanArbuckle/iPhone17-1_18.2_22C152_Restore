@interface MRAnimationManager
+ (id)sharedManager;
+ (void)initialize;
+ (void)loadAnimationManagerWithPaths:(id)a3;
- (MRAnimationManager)initWithPaths:(id)a3;
- (void)cleanup;
- (void)dealloc;
@end

@implementation MRAnimationManager

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___MRAnimationManager;
  objc_msgSendSuper2(&v2, "initialize");
  if (!qword_1F1430) {
    qword_1F1430 = [[MRAnimationManager alloc] initWithPaths:0];
  }
}

+ (id)sharedManager
{
  return (id)qword_1F1430;
}

+ (void)loadAnimationManagerWithPaths:(id)a3
{
  if (qword_1F1430)
  {

    qword_1F1430 = 0;
  }
  qword_1F1430 = [[MRAnimationManager alloc] initWithPaths:a3];
}

- (MRAnimationManager)initWithPaths:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)MRAnimationManager;
  v4 = [(MRAnimationManager *)&v18 init];
  if (v4)
  {
    v4->mAnimations = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v5 = +[NSMutableArray array];
    v6 = v5;
    if (a3) {
      [v5 addObjectsFromArray:a3];
    }
    else {
      objc_msgSend(v5, "addObject:", -[NSString stringByAppendingPathComponent:](-[NSBundle resourcePath](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class()), "resourcePath"), "stringByAppendingPathComponent:", @"Content"));
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", [*(id *)(*((void *)&v14 + 1) + 8 * i) stringByAppendingPathComponent:@"AnimationDescriptions.plist"]);
          if (v11)
          {
            id v12 = +[NSPropertyListSerialization propertyListWithData:v11 options:2 format:0 error:0];
            if (v12) {
              [(NSMutableDictionary *)v4->mAnimations addEntriesFromDictionary:v12];
            }
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v8);
    }
  }
  return v4;
}

- (void)dealloc
{
  [(MRAnimationManager *)self cleanup];
  v3.receiver = self;
  v3.super_class = (Class)MRAnimationManager;
  [(MRAnimationManager *)&v3 dealloc];
}

- (void)cleanup
{
  self->mAnimations = 0;
}

@end