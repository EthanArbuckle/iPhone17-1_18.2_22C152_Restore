@interface APTargetingExpression
- (APExpressionEvaluationProtocol)rootNode;
- (APTargetingExpression)initWithDictionary:(id)a3;
- (APTargetingExpression)initWithString:(id)a3;
- (BOOL)evaluate:(id *)a3;
- (BOOL)evaluateUsingLibrary:(id)a3 error:(id *)a4;
- (NSDictionary)expressionDict;
- (NSError)error;
- (NSString)identifier;
- (void)setError:(id)a3;
- (void)setExpressionDict:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setRootNode:(id)a3;
@end

@implementation APTargetingExpression

- (APTargetingExpression)initWithString:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 length])
  {
    v6 = [v5 dataUsingEncoding:4];
    id v17 = 0;
    v7 = +[NSJSONSerialization JSONObjectWithData:v6 options:4 error:&v17];
    id v8 = v17;
    id v9 = v17;
    if (v9)
    {
      objc_storeStrong((id *)&self->_error, v8);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        self = [(APTargetingExpression *)self initWithDictionary:v7];
        v11 = self;
LABEL_10:

        goto LABEL_11;
      }
      v12 = +[NSString stringWithFormat:@"Invalid JSON object type in '%@'", v5];
      NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
      v19 = v12;
      v13 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      v14 = +[NSError errorWithDomain:@"com.apple.ap.targetingexpressions" code:-1112 userInfo:v13];
      error = self->_error;
      self->_error = v14;
    }
    v11 = 0;
    goto LABEL_10;
  }
  NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
  CFStringRef v21 = @"Targeting expression is nil or empty.";
  id v9 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  v10 = +[NSError errorWithDomain:@"com.apple.ap.targetingexpressions" code:-1122 userInfo:v9];
  v11 = 0;
  v6 = self->_error;
  self->_error = v10;
LABEL_11:

  return v11;
}

- (APTargetingExpression)initWithDictionary:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)APTargetingExpression;
  v5 = [(APTargetingExpression *)&v39 init];
  if (!v5) {
    goto LABEL_18;
  }
  v6 = [v4 allKeys];
  uint64_t v7 = [v6 firstObject];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
    CFStringRef v49 = @"'identifier' must be a string.";
    v24 = &v49;
    v25 = &v48;
LABEL_13:
    v26 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v25 count:1];
    uint64_t v27 = +[NSError errorWithDomain:@"com.apple.ap.targetingexpressions" code:-1112 userInfo:v26];
    error = v5->_error;
    v5->_error = (NSError *)v27;

    v29 = v5;
    goto LABEL_18;
  }
  id v9 = [v4 allValues];
  uint64_t v10 = [v9 firstObject];
  expressionDict = v5->_expressionDict;
  v5->_expressionDict = (NSDictionary *)v10;

  v12 = [(APTargetingExpression *)v5 expressionDict];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
    CFStringRef v47 = @"Targeting expression must be a dictionary.";
    v24 = &v47;
    v25 = &v46;
    goto LABEL_13;
  }
  v14 = [(APTargetingExpression *)v5 expressionDict];
  v15 = [v14 objectForKeyedSubscript:@"expression"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = [(APTargetingExpression *)v5 expressionDict];
    id v17 = [v16 objectForKeyedSubscript:@"subexpressions"];

    if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      NSErrorUserInfoKey v42 = NSLocalizedDescriptionKey;
      CFStringRef v43 = @"'subExpressions' must be a dictionary.";
      v34 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
      uint64_t v35 = +[NSError errorWithDomain:@"com.apple.ap.targetingexpressions" code:-1112 userInfo:v34];
      v36 = v5->_error;
      v5->_error = (NSError *)v35;

      v37 = v5;
    }
    else
    {
      NSErrorUserInfoKey v18 = [(APTargetingExpression *)v5 expressionDict];
      v19 = [v18 objectForKeyedSubscript:@"data"];

      if (v19)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
          CFStringRef v41 = @"'data' must be a dictionary.";
          NSErrorUserInfoKey v20 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
          uint64_t v21 = +[NSError errorWithDomain:@"com.apple.ap.targetingexpressions" code:-1112 userInfo:v20];
          v22 = v5->_error;
          v5->_error = (NSError *)v21;
        }
      }
      v23 = v5;
    }
  }
  else
  {
    NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
    CFStringRef v45 = @"'expression' must be an array.";
    v30 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    uint64_t v31 = +[NSError errorWithDomain:@"com.apple.ap.targetingexpressions" code:-1112 userInfo:v30];
    v32 = v5->_error;
    v5->_error = (NSError *)v31;

    v33 = v5;
  }

LABEL_18:
  return v5;
}

- (APExpressionEvaluationProtocol)rootNode
{
  rootNode = self->_rootNode;
  if (!rootNode)
  {
    id v4 = [APTargetingExpressionNode alloc];
    v5 = [(APTargetingExpression *)self identifier];
    v6 = [(APTargetingExpression *)self expressionDict];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"expression"];
    id v8 = [(APTargetingExpression *)self expressionDict];
    id v9 = [v8 objectForKeyedSubscript:@"subexpressions"];
    uint64_t v10 = [(APTargetingExpression *)self expressionDict];
    v11 = [v10 objectForKeyedSubscript:@"data"];
    id v17 = 0;
    v12 = [(APTargetingExpressionNode *)v4 initWithParent:0 identifier:v5 expressionOrReference:v7 subExpressions:v9 data:v11 error:&v17];
    v13 = (NSError *)v17;
    v14 = self->_rootNode;
    self->_rootNode = v12;

    error = self->_error;
    self->_error = v13;

    rootNode = self->_rootNode;
  }

  return rootNode;
}

- (BOOL)evaluate:(id *)a3
{
  return [(APTargetingExpression *)self evaluateUsingLibrary:0 error:a3];
}

- (BOOL)evaluateUsingLibrary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(APTargetingExpression *)self rootNode];
  LOBYTE(a4) = [v7 evaluateUsingLibrary:v6 error:a4];

  return (char)a4;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setRootNode:(id)a3
{
}

- (NSDictionary)expressionDict
{
  return self->_expressionDict;
}

- (void)setExpressionDict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expressionDict, 0);
  objc_storeStrong((id *)&self->_rootNode, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end