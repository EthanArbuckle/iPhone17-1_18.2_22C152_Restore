@interface KPFAnimationRegistry
+ (id)supportedAnimations;
- (BOOL)containsEffect:(id)a3;
- (Class)effectClassWithName:(id)a3;
- (KPFAnimationRegistry)init;
- (void)dealloc;
@end

@implementation KPFAnimationRegistry

+ (id)supportedAnimations
{
  return &off_499890;
}

- (KPFAnimationRegistry)init
{
  v26.receiver = self;
  v26.super_class = (Class)KPFAnimationRegistry;
  v2 = [(KPFAnimationRegistry *)&v26 init];
  if (v2)
  {
    v3 = +[NSBundle bundleForClass:objc_opt_class()];
    id v4 = +[NSMutableDictionary dictionary];
    id v5 = [(id)objc_opt_class() supportedAnimations];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v23;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          v11 = [(NSBundle *)v3 classNamed:v10];
          if (v11) {
            [v4 setObject:v11 forKey:v10];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
      }
      while (v7);
    }
    id v12 = [v4 allValues];
    v2->mClassesForAnimationName = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v13 = [v12 countByEnumeratingWithState:&v18 objects:v27 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          -[NSMutableDictionary setObject:forKey:](v2->mClassesForAnimationName, "setObject:forKey:", *(void *)(*((void *)&v18 + 1) + 8 * (void)j), [*(id *)(*((void *)&v18 + 1) + 8 * (void)j) animationName]);
        }
        id v14 = [v12 countByEnumeratingWithState:&v18 objects:v27 count:16];
      }
      while (v14);
    }
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)KPFAnimationRegistry;
  [(KPFAnimationRegistry *)&v3 dealloc];
}

- (Class)effectClassWithName:(id)a3
{
  return (Class)[(NSMutableDictionary *)self->mClassesForAnimationName objectForKeyedSubscript:a3];
}

- (BOOL)containsEffect:(id)a3
{
  return [(NSMutableDictionary *)self->mClassesForAnimationName objectForKeyedSubscript:a3] != 0;
}

@end