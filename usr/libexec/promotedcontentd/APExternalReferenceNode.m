@interface APExternalReferenceNode
- (APExpressionNodeProtocol)parent;
- (APExternalReferenceNode)initWithIdentifier:(id)a3;
- (BOOL)evaluate:(id *)a3;
- (BOOL)evaluateUsingLibrary:(id)a3 error:(id *)a4;
- (NSArray)children;
- (NSString)identifier;
- (void)setChildren:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setParent:(id)a3;
@end

@implementation APExternalReferenceNode

- (APExternalReferenceNode)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APExternalReferenceNode;
  v6 = [(APExternalReferenceNode *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (BOOL)evaluate:(id *)a3
{
  return [(APExternalReferenceNode *)self evaluateUsingLibrary:0 error:a3];
}

- (BOOL)evaluateUsingLibrary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(APExternalReferenceNode *)self identifier];
  v8 = [v6 referenceFromIdentifier:v7 error:a4];

  if (v8)
  {
    unsigned __int8 v9 = [v8 evaluateUsingLibrary:v6 error:a4];
  }
  else
  {
    v10 = [(APExternalReferenceNode *)self identifier];
    v11 = +[NSString stringWithFormat:@"Unable to resolve node with identifier '%@'", v10];

    v12 = APLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    if (a4)
    {
      NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
      v16 = v11;
      v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      *a4 = +[NSError errorWithDomain:@"com.apple.ap.targetingexpressions" code:-1131 userInfo:v13];
    }
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (APExpressionNodeProtocol)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  return (APExpressionNodeProtocol *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->_parent);
}

@end