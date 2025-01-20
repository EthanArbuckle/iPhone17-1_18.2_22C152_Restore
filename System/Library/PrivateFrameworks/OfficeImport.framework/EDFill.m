@interface EDFill
+ (EDFill)fillWithResources:(id)a3;
- (BOOL)isEmpty;
- (EDFill)initWithResources:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation EDFill

+ (EDFill)fillWithResources:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithResources:v3];

  return (EDFill *)v4;
}

- (EDFill)initWithResources:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EDFill;
  v5 = [(EDFill *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->mResources, v4);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  v6 = (void *)[v4 initWithResources:WeakRetained];

  return v6;
}

- (BOOL)isEmpty
{
  return 1;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDFill;
  v2 = [(EDFill *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end