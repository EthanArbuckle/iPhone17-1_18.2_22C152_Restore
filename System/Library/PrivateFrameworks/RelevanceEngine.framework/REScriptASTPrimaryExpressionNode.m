@interface REScriptASTPrimaryExpressionNode
+ (id)parseBuffer:(id)a3 error:(id *)a4;
@end

@implementation REScriptASTPrimaryExpressionNode

+ (id)parseBuffer:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [v5 currentToken];
  unint64_t v7 = [v6 type];

  v8 = 0;
  if (v7 > 0x20) {
    goto LABEL_13;
  }
  if (((1 << v7) & 0x638) != 0)
  {
    v9 = objc_opt_class();
    id v10 = v5;
    goto LABEL_4;
  }
  if (v7 == 6)
  {
    v24 = objc_opt_class();
    id v25 = v5;
    [v25 push];
    v8 = [v24 parseBuffer:v25 error:a4];
    if (v8)
    {
      [v25 consume];
      id v26 = v8;
    }
    else
    {
      [v25 pop];
    }

    if (v8) {
      goto LABEL_13;
    }
    v9 = objc_opt_class();
    id v10 = v25;
LABEL_4:
    v11 = v10;
    [v10 push];
    v8 = [v9 parseBuffer:v11 error:a4];
    if (v8)
    {
      [v11 consume];
      id v12 = v8;
    }
    else
    {
      [v11 pop];
    }

    goto LABEL_13;
  }
  if (v7 == 32)
  {
    [v5 push];
    [v5 next];
    v8 = +[REScriptASTExpressionNode parseBuffer:v5 error:a4];
    if (v8
      && ([v5 currentToken],
          v13 = objc_claimAutoreleasedReturnValue(),
          uint64_t v14 = [v13 type],
          v13,
          v14 == 33))
    {
      [v5 next];
      [v5 consume];
    }
    else
    {
      [v5 pop];
    }
  }
  do
  {
LABEL_13:
    v15 = +[REScriptASTSubscriptExpressionNode parseBuffer:v5 error:a4];
    if (v15)
    {
      v16 = [REScriptASTSubscriptExpressionNode alloc];
      v17 = [v15 startIndex];
      v18 = [v15 endIndex];
      uint64_t v19 = [(REScriptASTSubscriptExpressionNode *)v16 initWithExpression:v8 startIndex:v17 endIndex:v18];
LABEL_17:
      v21 = (void *)v19;

      char v22 = 1;
      v8 = v21;
      goto LABEL_18;
    }
    v17 = +[REScriptASTMemberExpressionNode parseBuffer:v5 error:a4];
    if (v17)
    {
      v20 = [REScriptASTMemberExpressionNode alloc];
      v18 = [v17 member];
      uint64_t v19 = [(REScriptASTMemberExpressionNode *)v20 initWithMember:v18 expression:v8];
      goto LABEL_17;
    }
    char v22 = 0;
LABEL_18:
  }
  while ((v22 & 1) != 0);

  return v8;
}

@end