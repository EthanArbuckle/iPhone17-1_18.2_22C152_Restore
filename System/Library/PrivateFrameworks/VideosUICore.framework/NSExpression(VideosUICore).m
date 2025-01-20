@interface NSExpression(VideosUICore)
+ (id)vui_keyPathBitTestExpressionWithKeyPath:()VideosUICore value:;
- (BOOL)vui_isKeyPathBitTestExpression;
@end

@implementation NSExpression(VideosUICore)

+ (id)vui_keyPathBitTestExpressionWithKeyPath:()VideosUICore value:
{
  v15[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = vui_keyPathBitTestExpressionWithKeyPath_value____onceToken;
  id v6 = a4;
  id v7 = a3;
  if (v5 != -1) {
    dispatch_once(&vui_keyPathBitTestExpressionWithKeyPath_value____onceToken, &__block_literal_global_14);
  }
  v8 = [MEMORY[0x1E4F28C68] expressionForKeyPath:v7];

  v9 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v6];

  v10 = (void *)MEMORY[0x1E4F28C68];
  uint64_t v11 = __keyPathBitTestExpressionBlock;
  v15[0] = v8;
  v15[1] = v9;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  v13 = [v10 expressionForBlock:v11 arguments:v12];

  return v13;
}

- (BOOL)vui_isKeyPathBitTestExpression
{
  if ([a1 expressionType] != 19) {
    return 0;
  }
  v2 = [a1 expressionBlock];
  BOOL v3 = v2 == (void *)__keyPathBitTestExpressionBlock;

  return v3;
}

@end