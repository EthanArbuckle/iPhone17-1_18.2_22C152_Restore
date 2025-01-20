@interface TFCallbackScope
- (NSArray)names;
- (TFCallbackScope)initWithScope:(unint64_t)a3 names:(id)a4;
- (unint64_t)scope;
@end

@implementation TFCallbackScope

- (unint64_t)scope
{
  return self->_scope;
}

- (NSArray)names
{
  return self->_names;
}

- (void).cxx_destruct
{
}

- (TFCallbackScope)initWithScope:(unint64_t)a3 names:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TFCallbackScope;
  v8 = [(TFCallbackScope *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_scope = a3;
    objc_storeStrong((id *)&v8->_names, a4);
  }

  return v9;
}

@end