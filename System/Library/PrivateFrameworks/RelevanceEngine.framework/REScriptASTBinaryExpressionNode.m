@interface REScriptASTBinaryExpressionNode
+ (id)parseBuffer:(id)a3 error:(id *)a4;
- (REScriptASTBinaryExpressionNode)initWithOperator:(id)a3 expression:(id)a4;
- (REScriptASTNode)expression;
- (REScriptToken)binaryOperator;
- (id)dependencies;
@end

@implementation REScriptASTBinaryExpressionNode

+ (id)parseBuffer:(id)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [v5 currentToken];
  v7 = [v5 currentToken];
  unint64_t v8 = [v7 type];

  if (v8 > 0x2D || ((1 << v8) & 0x3F0070180000) == 0)
  {
    if (a4)
    {
      v13 = NSString;
      v14 = [v6 value];
      v15 = [v13 stringWithFormat:@"Unexpected token \"%@\" found. Expecting operator token.", v14];

      v17 = @"REErrorTokenKey";
      v18[0] = v6;
      v16 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
      RECreateErrorWithCodeMessageAndUseInfo(204, v15, v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = 0;
  }
  else
  {
    [v5 push];
    [v5 next];
    v10 = +[REScriptASTPrefixExpressionNode parseBuffer:v5 error:a4];
    if (v10)
    {
      [v5 consume];
      v11 = [[REScriptASTBinaryExpressionNode alloc] initWithOperator:v6 expression:v10];
    }
    else
    {
      [v5 pop];
      v11 = 0;
    }
  }
  return v11;
}

- (REScriptASTBinaryExpressionNode)initWithOperator:(id)a3 expression:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REScriptASTBinaryExpressionNode;
  v9 = [(REScriptASTNode *)&v12 initWithToken:v7];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_binaryOperator, a3);
    objc_storeStrong((id *)&v10->_expression, a4);
  }

  return v10;
}

- (id)dependencies
{
  return [(REScriptASTNode *)self->_expression dependencies];
}

- (REScriptToken)binaryOperator
{
  return self->_binaryOperator;
}

- (REScriptASTNode)expression
{
  return self->_expression;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expression, 0);
  objc_storeStrong((id *)&self->_binaryOperator, 0);
}

@end