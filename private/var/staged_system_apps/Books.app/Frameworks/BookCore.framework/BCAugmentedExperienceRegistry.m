@interface BCAugmentedExperienceRegistry
+ (id)sharedRegistry;
- (BCAugmentedExperienceRegistry)init;
- (NSMutableDictionary)presenters;
- (id)presenterForExperienceType:(int64_t)a3;
- (void)registerPresenterClass:(Class)a3 forExperienceType:(int64_t)a4;
- (void)setPresenters:(id)a3;
@end

@implementation BCAugmentedExperienceRegistry

+ (id)sharedRegistry
{
  if (qword_345B98 != -1) {
    dispatch_once(&qword_345B98, &stru_2C70B0);
  }
  v2 = (void *)qword_345B90;

  return v2;
}

- (BCAugmentedExperienceRegistry)init
{
  v6.receiver = self;
  v6.super_class = (Class)BCAugmentedExperienceRegistry;
  v2 = [(BCAugmentedExperienceRegistry *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    presenters = v2->_presenters;
    v2->_presenters = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)registerPresenterClass:(Class)a3 forExperienceType:(int64_t)a4
{
  id v7 = [(BCAugmentedExperienceRegistry *)self presenters];
  objc_super v6 = +[NSNumber numberWithInteger:a4];
  [v7 setObject:a3 forKey:v6];
}

- (id)presenterForExperienceType:(int64_t)a3
{
  v4 = [(BCAugmentedExperienceRegistry *)self presenters];
  v5 = +[NSNumber numberWithInteger:a3];
  objc_super v6 = (objc_class *)[v4 objectForKey:v5];

  if (v6)
  {
    id v7 = objc_alloc_init(v6);
    if ([v7 conformsToProtocol:&OBJC_PROTOCOL___BCAugmentedExperiencePresenting]) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (NSMutableDictionary)presenters
{
  return self->_presenters;
}

- (void)setPresenters:(id)a3
{
}

- (void).cxx_destruct
{
}

@end