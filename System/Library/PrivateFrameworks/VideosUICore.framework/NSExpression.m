@interface NSExpression
@end

@implementation NSExpression

void __76__NSExpression_VideosUICore__vui_keyPathBitTestExpressionWithKeyPath_value___block_invoke()
{
  v0 = (void *)__keyPathBitTestExpressionBlock;
  __keyPathBitTestExpressionBlock = (uint64_t)&__block_literal_global_3;
}

id __76__NSExpression_VideosUICore__vui_keyPathBitTestExpressionWithKeyPath_value___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  v4 = [v3 objectAtIndex:0];
  v5 = [v3 objectAtIndex:1];

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = 0;
  if (isKindOfClass)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v5;
      uint64_t v9 = [v4 unsignedIntegerValue];
      uint64_t v10 = [v8 unsignedIntegerValue];

      uint64_t v7 = v10 & v9;
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  v11 = [NSNumber numberWithUnsignedInteger:v7];

  return v11;
}

@end