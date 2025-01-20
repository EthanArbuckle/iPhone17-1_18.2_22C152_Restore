@interface WBSWeakReferenceWrapper
+ (id)wrapperWithObject:(id)a3;
- (WBSWeakReferenceWrapper)initWithObject:(id)a3;
- (id)object;
@end

@implementation WBSWeakReferenceWrapper

- (id)object
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);
  return WeakRetained;
}

+ (id)wrapperWithObject:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithObject:v4];

  return v5;
}

- (WBSWeakReferenceWrapper)initWithObject:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WBSWeakReferenceWrapper;
  v5 = [(WBSWeakReferenceWrapper *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak(&v5->_object, v4);
    v7 = v6;
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end