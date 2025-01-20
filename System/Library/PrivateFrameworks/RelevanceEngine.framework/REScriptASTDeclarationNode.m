@interface REScriptASTDeclarationNode
+ (id)parseBuffer:(id)a3 error:(id *)a4;
- (REScriptASTDeclarationNode)initWithName:(id)a3 type:(id)a4 expression:(id)a5;
- (REScriptASTNode)value;
- (REScriptToken)name;
- (REScriptToken)type;
- (id)dependencies;
@end

@implementation REScriptASTDeclarationNode

+ (id)parseBuffer:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (!REExpectTokenTypeInBuffer(v5, 6uLL, a4))
  {
    v11 = 0;
    goto LABEL_17;
  }
  v6 = [v5 currentToken];
  [v5 push];
  [v5 next];
  if (REExpectTokenTypeInBuffer(v5, 6uLL, a4))
  {
    v7 = [v5 currentToken];
    [v5 next];
    [v5 consume];
    [v5 push];
    v8 = +[REScriptASTBinaryExpressionListNode parseBuffer:v5 error:a4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [v8 expressions];
      id v10 = [v9 firstObject];

      if (!v10) {
        goto LABEL_14;
      }
    }
    else
    {
      id v10 = v8;
      if (!v10) {
        goto LABEL_14;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [v10 binaryOperator];
      if ([v12 type] == 30)
      {
        v13 = [v10 binaryOperator];
        uint64_t v14 = [v13 type];

        if (v14 == 29)
        {
          [v5 consume];
LABEL_15:
          v11 = [[REScriptASTDeclarationNode alloc] initWithName:v7 type:v6 expression:v8];

          goto LABEL_16;
        }
      }
      else
      {
      }
    }
LABEL_14:
    [v5 pop];

    v8 = 0;
    goto LABEL_15;
  }
  [v5 pop];
  v11 = 0;
LABEL_16:

LABEL_17:
  return v11;
}

- (REScriptASTDeclarationNode)initWithName:(id)a3 type:(id)a4 expression:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)REScriptASTDeclarationNode;
  v12 = [(REScriptASTNode *)&v15 initWithToken:v9];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_type, a4);
    objc_storeStrong((id *)&v13->_value, a5);
  }

  return v13;
}

- (id)dependencies
{
  v2 = [(REScriptASTNode *)self->_value dependencies];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x263EFFA08] set];
  }
  id v5 = v4;

  return v5;
}

- (REScriptToken)type
{
  return self->_type;
}

- (REScriptToken)name
{
  return self->_name;
}

- (REScriptASTNode)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end