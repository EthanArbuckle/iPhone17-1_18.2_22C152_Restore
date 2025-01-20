@interface SCRCMathTableRowExpression
- (BOOL)canBeWrappedInLatexMathIndicators;
- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4;
- (id)latexDescriptionInMathMode:(BOOL)a3;
- (id)mathMLTag;
@end

@implementation SCRCMathTableRowExpression

- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4
{
  id v6 = a4;
  v7 = [MEMORY[0x263F089B8] scrcString];
  v8 = [(SCRCMathArrayExpression *)self children];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      v11 = [(SCRCMathArrayExpression *)self children];
      v12 = [v11 objectAtIndex:i];

      if (i)
      {
        v13 = [MEMORY[0x263F086A0] scrcStringWithString:@" " treePosition:v6];
        [v7 appendAttributedString:v13];
      }
      v14 = [v6 indexPathByAddingIndex:i];
      v15 = [v12 dollarCodeDescriptionWithNumberOfOuterRadicals:a3 treePosition:v14];
      [v7 appendAttributedString:v15];
    }
  }

  return v7;
}

- (id)mathMLTag
{
  return @"mtr";
}

- (id)latexDescriptionInMathMode:(BOOL)a3
{
  return [(SCRCMathExpression *)self latexDescriptionForChildrenJoinedByString:@" & "];
}

- (BOOL)canBeWrappedInLatexMathIndicators
{
  return 0;
}

@end