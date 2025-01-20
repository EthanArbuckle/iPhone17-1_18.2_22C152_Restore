@interface REScriptASTPrefixExpressionNode
+ (id)parseBuffer:(id)a3 error:(id *)a4;
- (REScriptASTNode)node;
- (REScriptASTPrefixExpressionNode)initWithPrefixOperatorToken:(id)a3 primaryExpression:(id)a4;
- (REScriptToken)prefixOperator;
- (id)dependencies;
@end

@implementation REScriptASTPrefixExpressionNode

+ (id)parseBuffer:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [v5 currentToken];
  uint64_t v7 = [v6 type];

  if (v7 == 21)
  {
    [v5 push];
    v8 = [v5 currentToken];
    [v5 next];
    v9 = +[REScriptASTPrimaryExpressionNode parseBuffer:v5 error:a4];
    if (v9)
    {
      v10 = [[REScriptASTPrefixExpressionNode alloc] initWithPrefixOperatorToken:v8 primaryExpression:v9];
      [v5 consume];
    }
    else
    {
      [v5 pop];
      v10 = 0;
    }
  }
  else
  {
    v10 = +[REScriptASTPrimaryExpressionNode parseBuffer:v5 error:a4];
  }

  return v10;
}

- (REScriptASTPrefixExpressionNode)initWithPrefixOperatorToken:(id)a3 primaryExpression:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REScriptASTPrefixExpressionNode;
  v9 = [(REScriptASTNode *)&v12 initWithToken:v7];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_prefixOperator, a3);
    objc_storeStrong((id *)&v10->_node, a4);
  }

  return v10;
}

- (id)dependencies
{
  return [(REScriptASTNode *)self->_node dependencies];
}

- (REScriptToken)prefixOperator
{
  return self->_prefixOperator;
}

- (REScriptASTNode)node
{
  return self->_node;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_node, 0);
  objc_storeStrong((id *)&self->_prefixOperator, 0);
}

@end