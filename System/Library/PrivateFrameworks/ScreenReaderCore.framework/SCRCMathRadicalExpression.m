@interface SCRCMathRadicalExpression
- (BOOL)_isCubeRoot;
- (BOOL)_isSquareRoot;
- (SCRCMathExpression)radicand;
- (SCRCMathExpression)rootIndex;
- (SCRCMathRadicalExpression)initWithDictionary:(id)a3;
- (id)description;
- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4;
- (id)latexMathModeDescription;
- (id)mathMLString;
- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4;
- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5;
- (id)subExpressions;
- (void)setRadicand:(id)a3;
- (void)setRootIndex:(id)a3;
@end

@implementation SCRCMathRadicalExpression

- (SCRCMathRadicalExpression)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCRCMathRadicalExpression;
  v5 = [(SCRCMathExpression *)&v11 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKey:@"AXMRadicandObject"];
    v7 = +[SCRCMathExpression mathExpressionWithDictionary:v6];
    [(SCRCMathRadicalExpression *)v5 setRadicand:v7];

    v8 = [v4 objectForKey:@"AXMRootIndexObject"];
    v9 = +[SCRCMathExpression mathExpressionWithDictionary:v8];
    [(SCRCMathRadicalExpression *)v5 setRootIndex:v9];
  }
  return v5;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)SCRCMathRadicalExpression;
  v3 = [(SCRCMathRadicalExpression *)&v8 description];
  id v4 = [(SCRCMathRadicalExpression *)self radicand];
  v5 = [(SCRCMathRadicalExpression *)self rootIndex];
  v6 = [v3 stringByAppendingFormat:@" - radicand %@, root index %@", v4, v5];

  return v6;
}

- (id)subExpressions
{
  v3 = [(SCRCMathRadicalExpression *)self rootIndex];
  id v4 = [(SCRCMathRadicalExpression *)self radicand];
  v5 = [(SCRCMathExpression *)self arrayWithoutNilsFromFirstChild:v3 secondChild:v4 thirdChild:0];

  return v5;
}

- (BOOL)_isSquareRoot
{
  v3 = [(SCRCMathRadicalExpression *)self rootIndex];

  if (!v3) {
    return 1;
  }
  id v4 = [(SCRCMathRadicalExpression *)self rootIndex];
  if ([v4 isInteger])
  {
    v5 = [(SCRCMathRadicalExpression *)self rootIndex];
    BOOL v6 = [v5 integerValue] == 2;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_isCubeRoot
{
  v3 = [(SCRCMathRadicalExpression *)self rootIndex];
  if ([v3 isInteger])
  {
    id v4 = [(SCRCMathRadicalExpression *)self rootIndex];
    BOOL v5 = [v4 integerValue] == 3;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = [(SCRCMathRadicalExpression *)self radicand];
  objc_super v8 = [v7 speakableDescriptionWithSpeakingStyle:a3 arePausesAllowed:v4];

  if ([(SCRCMathRadicalExpression *)self _isSquareRoot])
  {
    v9 = (void *)MEMORY[0x263F086A0];
    v10 = [(SCRCMathExpression *)self localizedStringForKey:@"square.root.formatter"];
    objc_msgSend(v9, "scrcStringWithFormat:", v10, v8);
    v13 = LABEL_5:;
    goto LABEL_7;
  }
  BOOL v11 = [(SCRCMathRadicalExpression *)self _isCubeRoot];
  v12 = (void *)MEMORY[0x263F086A0];
  if (v11)
  {
    v10 = [(SCRCMathExpression *)self localizedStringForKey:@"cube.root.formatter"];
    objc_msgSend(v12, "scrcStringWithFormat:", v10, v8);
    goto LABEL_5;
  }
  v10 = [(SCRCMathExpression *)self localizedStringForKey:@"nth.root.formatter"];
  v14 = [(SCRCMathRadicalExpression *)self rootIndex];
  v15 = [v14 speakableDescriptionWithSpeakingStyle:a3 arePausesAllowed:v4];
  v13 = objc_msgSend(v12, "scrcStringWithFormat:", v10, v15, v8);

LABEL_7:
  return v13;
}

- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5
{
  v40[1] = *MEMORY[0x263EF8340];
  id v8 = a5;
  v9 = v8;
  if (!a4)
  {
    BOOL v11 = 0;
    goto LABEL_22;
  }
  unint64_t v10 = a4 - 1;
  if (a4 == 1)
  {
    v37.receiver = self;
    v37.super_class = (Class)SCRCMathRadicalExpression;
    BOOL v11 = [(SCRCMathExpression *)&v37 speakableSegmentsWithSpeakingStyle:a3 upToDepth:1 treePosition:v8];
    goto LABEL_22;
  }
  uint64_t v12 = [v8 indexPathByAddingIndex:0];
  if ([(SCRCMathRadicalExpression *)self _isSquareRoot])
  {
    v13 = [(SCRCMathExpression *)self localizedAttributedStringForKey:@"segment.square.root.index", v12, v12 treePosition];
    v40[0] = v13;
    v14 = (void *)MEMORY[0x263EFF8C0];
    v15 = (void **)v40;
  }
  else
  {
    if (![(SCRCMathRadicalExpression *)self _isCubeRoot])
    {
      v13 = [(SCRCMathRadicalExpression *)self rootIndex];
      uint64_t v16 = [v13 speakableSegmentsWithSpeakingStyle:a3 upToDepth:v10 treePosition:v12 localizablePrefix:@"segment.nth.root.index.prefix" localizableSuffix:@"segment.nth.root.index.suffix"];
      goto LABEL_11;
    }
    v13 = [(SCRCMathExpression *)self localizedAttributedStringForKey:@"segment.cube.root.index" treePosition:v12];
    v39 = v13;
    v14 = (void *)MEMORY[0x263EFF8C0];
    v15 = &v39;
  }
  uint64_t v16 = [v14 arrayWithObjects:v15 count:1];
LABEL_11:
  v17 = (void *)v16;

  v18 = [(SCRCMathRadicalExpression *)self radicand];
  v32 = v9;
  v19 = [v9 indexPathByAddingIndex:1];
  v20 = [v18 speakableSegmentsWithSpeakingStyle:a3 upToDepth:v10 treePosition:v19 localizablePrefix:@"segment.radicand.prefix" localizableSuffix:@"segment.radicand.suffix"];

  BOOL v11 = [MEMORY[0x263EFF980] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v21 = [(SCRCMathExpression *)self localizedSegmentOrderingForKey:@"Radical"];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        char v27 = [v26 isEqualToString:@"radicand"];
        v28 = v20;
        if ((v27 & 1) == 0)
        {
          int v29 = [v26 isEqualToString:@"root index"];
          v28 = v17;
          if (!v29) {
            continue;
          }
        }
        [v11 addObjectsFromArray:v28];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v23);
  }

  v9 = v32;
LABEL_22:

  return v11;
}

- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4
{
  id v6 = a4;
  v7 = [MEMORY[0x263F089B8] scrcString];
  id v8 = [(SCRCMathRadicalExpression *)self rootIndex];

  BOOL v9 = v8 == 0;
  if (v8) {
    unint64_t v10 = @"ixrte";
  }
  else {
    unint64_t v10 = @"sqrte";
  }
  if (v9) {
    BOOL v11 = @"sqrts";
  }
  else {
    BOOL v11 = @"ixrts";
  }
  if (a3)
  {
    BOOL v11 = [(__CFString *)v11 stringByAppendingFormat:@"%lu", a3];
    unint64_t v10 = [(__CFString *)v10 stringByAppendingFormat:@"%lu", a3];
  }
  uint64_t v12 = [(SCRCMathRadicalExpression *)self rootIndex];

  if (v12)
  {
    v13 = [MEMORY[0x263F086A0] scrcStringWithDollarCode:v11 treePosition:v6];
    [v7 appendAttributedString:v13];

    v14 = [(SCRCMathRadicalExpression *)self rootIndex];
    unint64_t v15 = a3 + 1;
    uint64_t v16 = [v6 indexPathByAddingIndex:0];
    v17 = [v14 dollarCodeDescriptionWithNumberOfOuterRadicals:v15 treePosition:v16];
    [v7 appendAttributedString:v17];

    v18 = [MEMORY[0x263F086A0] scrcStringWithDollarCode:@"ixrtd" treePosition:v6];
    [v7 appendAttributedString:v18];

    v19 = [(SCRCMathRadicalExpression *)self radicand];
    v20 = [v6 indexPathByAddingIndex:1];
    v21 = [v19 dollarCodeDescriptionWithNumberOfOuterRadicals:v15 treePosition:v20];
    [v7 appendAttributedString:v21];

    uint64_t v22 = [MEMORY[0x263F086A0] scrcStringWithDollarCode:v10 treePosition:v6];
    [v7 appendAttributedString:v22];
  }
  else
  {
    uint64_t v22 = [v6 indexPathByAddingIndex:0];
    uint64_t v23 = [MEMORY[0x263F086A0] scrcStringWithDollarCode:v11 treePosition:v22];
    [v7 appendAttributedString:v23];

    uint64_t v24 = [(SCRCMathRadicalExpression *)self radicand];
    v25 = [v6 indexPathByAddingIndex:1];
    v26 = [v24 dollarCodeDescriptionWithNumberOfOuterRadicals:a3 + 1 treePosition:v25];
    [v7 appendAttributedString:v26];

    char v27 = [MEMORY[0x263F086A0] scrcStringWithDollarCode:v10 treePosition:v22];
    [v7 appendAttributedString:v27];
  }
  return v7;
}

- (id)mathMLString
{
  v3 = [(SCRCMathRadicalExpression *)self rootIndex];

  if (v3)
  {
    BOOL v4 = NSString;
    BOOL v5 = [(SCRCMathRadicalExpression *)self radicand];
    id v6 = [v5 mathMLString];
    v7 = [(SCRCMathRadicalExpression *)self rootIndex];
    id v8 = [v7 mathMLString];
    BOOL v9 = [v4 stringWithFormat:@"%@%@", v6, v8];
    unint64_t v10 = [v9 stringWrappedInMathMLTag:@"mroot"];
  }
  else
  {
    BOOL v5 = [(SCRCMathRadicalExpression *)self radicand];
    id v6 = [v5 mathMLString];
    unint64_t v10 = [v6 stringWrappedInMathMLTag:@"msqrt"];
  }

  return v10;
}

- (id)latexMathModeDescription
{
  v3 = (void *)[@"\\sqrt" mutableCopy];
  rootIndex = self->_rootIndex;
  if (rootIndex)
  {
    BOOL v5 = [(SCRCMathExpression *)rootIndex latexDescriptionInMathMode:1];
    [v3 appendFormat:@"[%@]", v5];
  }
  radicand = self->_radicand;
  if (radicand)
  {
    v7 = [(SCRCMathExpression *)radicand latexDescriptionInMathMode:1];
    [v3 appendFormat:@"{%@}", v7];
  }
  return v3;
}

- (SCRCMathExpression)radicand
{
  return self->_radicand;
}

- (void)setRadicand:(id)a3
{
}

- (SCRCMathExpression)rootIndex
{
  return self->_rootIndex;
}

- (void)setRootIndex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootIndex, 0);
  objc_storeStrong((id *)&self->_radicand, 0);
}

@end