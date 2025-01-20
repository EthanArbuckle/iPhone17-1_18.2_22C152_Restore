@interface KPFGingerAnimationRegistry
+ (id)supportedAnimations;
- (BOOL)containsEffect:(id)a3 ofType:(id)a4;
- (Class)effectClassWithName:(id)a3 andType:(id)a4;
- (KPFGingerAnimationRegistry)init;
- (id)p_animationTypeNumberFromString:(id)a3;
- (void)dealloc;
@end

@implementation KPFGingerAnimationRegistry

+ (id)supportedAnimations
{
  return &off_4999B0;
}

- (KPFGingerAnimationRegistry)init
{
  v38.receiver = self;
  v38.super_class = (Class)KPFGingerAnimationRegistry;
  v2 = [(KPFGingerAnimationRegistry *)&v38 init];
  if (v2)
  {
    v3 = +[NSBundle bundleForClass:objc_opt_class()];
    id v4 = +[NSMutableDictionary dictionary];
    id v5 = [(id)objc_opt_class() supportedAnimations];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v35;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v35 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          v11 = [(NSBundle *)v3 classNamed:v10];
          if (v11) {
            [v4 setObject:v11 forKeyedSubscript:v10];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v34 objects:v41 count:16];
      }
      while (v7);
    }
    id v12 = [v4 allValues];
    v2->mClassesForTypeAndName = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = v12;
    id v25 = [v12 countByEnumeratingWithState:&v30 objects:v40 count:16];
    if (v25)
    {
      uint64_t v24 = *(void *)v31;
      do
      {
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          if (*(void *)v31 != v24) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v30 + 1) + 8 * (void)j);
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          id v15 = [v14 supportedTypes];
          id v16 = [v15 countByEnumeratingWithState:&v26 objects:v39 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v27;
            do
            {
              for (k = 0; k != v17; k = (char *)k + 1)
              {
                if (*(void *)v27 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 8 * (void)k);
                id v21 = [(NSMutableDictionary *)v2->mClassesForTypeAndName objectForKeyedSubscript:v20];
                if (!v21)
                {
                  id v21 = +[NSMutableDictionary dictionary];
                  [(NSMutableDictionary *)v2->mClassesForTypeAndName setObject:v21 forKeyedSubscript:v20];
                }
                objc_msgSend(v21, "setObject:forKeyedSubscript:", v14, objc_msgSend(v14, "animationName"));
              }
              id v17 = [v15 countByEnumeratingWithState:&v26 objects:v39 count:16];
            }
            while (v17);
          }
        }
        id v25 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
      }
      while (v25);
    }
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)KPFGingerAnimationRegistry;
  [(KPFGingerAnimationRegistry *)&v3 dealloc];
}

- (id)p_animationTypeNumberFromString:(id)a3
{
  KNAnimationTypeFromKPFAnimationType(a3);
  objc_super v3 = (void *)KNAnimationTypeAsNumber();
  [v3 intValue];
  return v3;
}

- (Class)effectClassWithName:(id)a3 andType:(id)a4
{
  id v5 = [(NSMutableDictionary *)self->mClassesForTypeAndName objectForKeyedSubscript:[(KPFGingerAnimationRegistry *)self p_animationTypeNumberFromString:a4]];

  return (Class)[v5 objectForKeyedSubscript:a3];
}

- (BOOL)containsEffect:(id)a3 ofType:(id)a4
{
  return [self->mClassesForTypeAndName objectForKeyedSubscript:[self p_animationTypeNumberFromString:a4] objectForKeyedSubscript:a3] != 0;
}

@end