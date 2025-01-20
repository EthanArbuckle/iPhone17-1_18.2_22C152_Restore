@interface SXJSONObjectMergerClassProvider
- (Class)objectClass;
- (SXJSONObjectMergerClassProvider)initWithObjectClass:(Class)a3;
@end

@implementation SXJSONObjectMergerClassProvider

- (SXJSONObjectMergerClassProvider)initWithObjectClass:(Class)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SXJSONObjectMergerClassProvider;
  v4 = [(SXJSONObjectMergerClassProvider *)&v7 init];
  v5 = v4;
  if (v4) {
    objc_storeStrong((id *)&v4->_objectClass, a3);
  }
  return v5;
}

- (Class)objectClass
{
  return self->_objectClass;
}

- (void).cxx_destruct
{
}

@end