@interface REScriptASTFunctionCallNode
+ (id)parseBuffer:(id)a3 error:(id *)a4;
- (NSArray)arguments;
- (REScriptASTFunctionCallNode)initWithFunctionName:(id)a3 arguments:(id)a4;
- (REScriptToken)functionIdentifier;
- (id)dependencies;
@end

@implementation REScriptASTFunctionCallNode

+ (id)parseBuffer:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (!REExpectTokenTypeInBuffer(v5, 6uLL, a4))
  {
    v11 = 0;
    goto LABEL_19;
  }
  v6 = [v5 currentToken];
  [v5 push];
  [v5 next];
  if (REExpectTokenTypeInBuffer(v5, 0x20uLL, a4))
  {
    [v5 next];
    v7 = [MEMORY[0x263EFF980] array];
    uint64_t v8 = +[REScriptASTExpressionNode parseBuffer:v5 error:a4];
    if (v8)
    {
      v9 = (void *)v8;
      [v7 addObject:v8];
      if (REExpectTokenTypeInBuffer(v5, 0x1BuLL, a4))
      {
        while (1)
        {
          [v5 next];
          v10 = +[REScriptASTExpressionNode parseBuffer:v5 error:a4];

          if (!v10) {
            break;
          }
          [v7 addObject:v10];
          v9 = v10;
          if (!REExpectTokenTypeInBuffer(v5, 0x1BuLL, a4)) {
            goto LABEL_12;
          }
        }
        [v5 pop];
        goto LABEL_16;
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
LABEL_12:
    if (REExpectTokenTypeInBuffer(v5, 0x21uLL, a4))
    {
      [v5 next];
      [v5 consume];
      v12 = [REScriptASTFunctionCallNode alloc];
      v13 = (void *)[v7 copy];
      v11 = [(REScriptASTFunctionCallNode *)v12 initWithFunctionName:v6 arguments:v13];

LABEL_17:
      goto LABEL_18;
    }
    [v5 pop];

LABEL_16:
    v11 = 0;
    goto LABEL_17;
  }
  [v5 pop];
  v11 = 0;
LABEL_18:

LABEL_19:
  return v11;
}

- (REScriptASTFunctionCallNode)initWithFunctionName:(id)a3 arguments:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REScriptASTFunctionCallNode;
  v9 = [(REScriptASTNode *)&v12 initWithToken:v7];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_functionIdentifier, a3);
    objc_storeStrong((id *)&v10->_arguments, a4);
  }

  return v10;
}

- (id)dependencies
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9C0] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_arguments;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "dependencies", (void)v12);
        [v3 unionSet:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = (void *)[v3 copy];
  return v10;
}

- (REScriptToken)functionIdentifier
{
  return self->_functionIdentifier;
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_functionIdentifier, 0);
}

@end