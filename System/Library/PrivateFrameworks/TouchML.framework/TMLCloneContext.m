@interface TMLCloneContext
- (JSContext)jsContext;
- (JSValue)apiObject;
- (NSString)apiObjectKey;
- (TMLCloneContext)initWithMetaContext:(id)a3;
- (TMLMetaContext)metaContext;
- (TMLMetaObject)rootObject;
- (void)setApiObject:(id)a3;
- (void)setApiObjectKey:(id)a3;
- (void)setJsContext:(id)a3;
@end

@implementation TMLCloneContext

- (TMLCloneContext)initWithMetaContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TMLCloneContext;
  v6 = [(TMLCloneContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_metaContext, a3);
  }

  return v7;
}

- (TMLMetaObject)rootObject
{
  return (TMLMetaObject *)objc_msgSend_rootObject(self->_metaContext, a2, v2);
}

- (TMLMetaContext)metaContext
{
  return self->_metaContext;
}

- (JSContext)jsContext
{
  return self->_jsContext;
}

- (void)setJsContext:(id)a3
{
  self->_jsContext = (JSContext *)a3;
}

- (JSValue)apiObject
{
  return self->_apiObject;
}

- (void)setApiObject:(id)a3
{
  self->_apiObject = (JSValue *)a3;
}

- (NSString)apiObjectKey
{
  return self->_apiObjectKey;
}

- (void)setApiObjectKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apiObjectKey, 0);
  objc_storeStrong((id *)&self->_metaContext, 0);
}

@end