@interface REScriptASTLiteralNode
+ (id)parseBuffer:(id)a3 error:(id *)a4;
@end

@implementation REScriptASTLiteralNode

+ (id)parseBuffer:(id)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_26CFCD788];
  v7 = [v5 currentToken];
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "type"));
  int v9 = [v6 containsObject:v8];

  if (v9)
  {
    v10 = [REScriptASTLiteralNode alloc];
    v11 = [v5 currentToken];
    a4 = [(REScriptASTNode *)v10 initWithToken:v11];

    [v5 next];
  }
  else if (a4)
  {
    v12 = NSString;
    v13 = [v7 value];
    v14 = [v12 stringWithFormat:@"Unexpected token \"%@\" found. Expecting literal token.", v13];

    v17 = @"REErrorTokenKey";
    v18[0] = v7;
    v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    RECreateErrorWithCodeMessageAndUseInfo(204, v14, v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

@end