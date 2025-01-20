@interface REScriptASTBinaryExpressionListNode
+ (id)parseBuffer:(id)a3 error:(id *)a4;
- (NSArray)expressions;
- (REScriptASTBinaryExpressionListNode)initWithExpressions:(id)a3;
- (id)dependencies;
@end

@implementation REScriptASTBinaryExpressionListNode

+ (id)parseBuffer:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [MEMORY[0x263EFF980] array];
  [v5 push];
  uint64_t v7 = +[REScriptASTBinaryExpressionNode parseBuffer:v5 error:a4];
  if (v7)
  {
    v8 = (void *)v7;
    do
    {
      [v6 addObject:v8];
      [v5 consume];

      [v5 push];
      v8 = +[REScriptASTBinaryExpressionNode parseBuffer:v5 error:a4];
    }
    while (v8);
  }
  [v5 pop];
  if ((unint64_t)[v6 count] < 2)
  {
    v9 = [v6 firstObject];
  }
  else
  {
    v9 = [[REScriptASTBinaryExpressionListNode alloc] initWithExpressions:v6];
  }
  v10 = v9;

  return v10;
}

- (REScriptASTBinaryExpressionListNode)initWithExpressions:(id)a3
{
  id v5 = a3;
  v6 = [v5 firstObject];
  uint64_t v7 = [v6 token];
  v10.receiver = self;
  v10.super_class = (Class)REScriptASTBinaryExpressionListNode;
  v8 = [(REScriptASTNode *)&v10 initWithToken:v7];

  if (v8) {
    objc_storeStrong((id *)&v8->_expressions, a3);
  }

  return v8;
}

- (id)dependencies
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9C0] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_expressions;
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

  objc_super v10 = (void *)[v3 copy];
  return v10;
}

- (NSArray)expressions
{
  return self->_expressions;
}

- (void).cxx_destruct
{
}

@end