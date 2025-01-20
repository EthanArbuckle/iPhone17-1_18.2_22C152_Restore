@interface REScriptASTRuleNode
+ (id)parseBuffer:(id)a3 error:(id *)a4;
- (NSDictionary)options;
- (REScriptASTNode)expression;
- (REScriptASTRuleNode)initWithType:(id)a3 options:(id)a4 name:(id)a5 expression:(id)a6;
- (REScriptToken)name;
- (REScriptToken)type;
- (id)dependencies;
@end

@implementation REScriptASTRuleNode

+ (id)parseBuffer:(id)a3 error:(id *)a4
{
  v21[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [v5 currentToken];
  uint64_t v7 = [v6 type];

  if ((unint64_t)(v7 - 13) < 3)
  {
    v8 = [v5 currentToken];
    [v5 push];
    [v5 next];
    v9 = REScriptParseOptionsValues(v5, a4);
    if (!v9 || !REExpectTokenTypeInBuffer(v5, 6uLL, a4))
    {
      [v5 pop];
      a4 = 0;
LABEL_16:

      goto LABEL_17;
    }
    v10 = [v5 currentToken];
    [v5 next];
    if (!REExpectTokenTypeInBuffer(v5, 0x22uLL, a4))
    {
      [v5 pop];
      a4 = 0;
LABEL_15:

      goto LABEL_16;
    }
    [v5 next];
    v11 = +[REScriptASTExpressionNode parseBuffer:v5 error:a4];
    if (v11)
    {
      if (REExpectTokenTypeInBuffer(v5, 0x23uLL, a4))
      {
        [v5 next];
        [v5 consume];
        v12 = [REScriptASTRuleNode alloc];
        v13 = (void *)[v9 copy];
        a4 = [(REScriptASTRuleNode *)v12 initWithType:v8 options:v13 name:v10 expression:v11];

LABEL_14:
        goto LABEL_15;
      }
      [v5 pop];
    }
    a4 = 0;
    goto LABEL_14;
  }
  if (a4)
  {
    v14 = [v5 currentToken];
    v15 = NSString;
    v16 = [v14 value];
    v17 = [v15 stringWithFormat:@"Unexpected token \"%@\" found. Expecting rule type token.", v16];

    v20 = @"REErrorTokenKey";
    v21[0] = v14;
    v18 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    RECreateErrorWithCodeMessageAndUseInfo(204, v17, v18);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }
LABEL_17:

  return a4;
}

- (REScriptASTRuleNode)initWithType:(id)a3 options:(id)a4 name:(id)a5 expression:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)REScriptASTRuleNode;
  v15 = [(REScriptASTNode *)&v18 initWithToken:v11];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_type, a3);
    objc_storeStrong((id *)&v16->_name, a5);
    objc_storeStrong((id *)&v16->_options, a4);
    objc_storeStrong((id *)&v16->_expression, a6);
  }

  return v16;
}

- (id)dependencies
{
  return [(REScriptASTNode *)self->_expression dependencies];
}

- (REScriptToken)type
{
  return self->_type;
}

- (REScriptToken)name
{
  return self->_name;
}

- (NSDictionary)options
{
  return self->_options;
}

- (REScriptASTNode)expression
{
  return self->_expression;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expression, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end