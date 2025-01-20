@interface REScriptASTNode
+ (id)parseBuffer:(id)a3 error:(id *)a4;
- (NSSet)dependencies;
- (REScriptASTNode)initWithToken:(id)a3;
- (REScriptToken)token;
@end

@implementation REScriptASTNode

+ (id)parseBuffer:(id)a3 error:(id *)a4
{
  return 0;
}

- (REScriptASTNode)initWithToken:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REScriptASTNode;
  v6 = [(REScriptASTNode *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_token, a3);
  }

  return v7;
}

- (NSSet)dependencies
{
  return (NSSet *)[MEMORY[0x263EFFA08] set];
}

- (REScriptToken)token
{
  return self->_token;
}

- (void).cxx_destruct
{
}

@end