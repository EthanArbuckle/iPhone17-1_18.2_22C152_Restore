@interface _UITextInputImplicitObjectWrapper
+ (id)wrapperForObject:(id)a3;
- (id)weakObject;
- (void)setWeakObject:(id)a3;
@end

@implementation _UITextInputImplicitObjectWrapper

+ (id)wrapperForObject:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setWeakObject:v4];

  return v5;
}

- (void)setWeakObject:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)weakObject
{
  id WeakRetained = objc_loadWeakRetained(&self->_weakObject);
  return WeakRetained;
}

@end