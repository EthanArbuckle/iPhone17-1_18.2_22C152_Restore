@interface SCRCMathSpaceExpression
- (BOOL)beginsWithSpace;
- (BOOL)endsWithSpace;
- (SCRCMathSpaceExpression)initWithDictionary:(id)a3;
- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4;
- (id)mathMLString;
@end

@implementation SCRCMathSpaceExpression

- (SCRCMathSpaceExpression)initWithDictionary:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCRCMathSpaceExpression;
  return [(SCRCMathExpression *)&v4 initWithDictionary:a3];
}

- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4
{
  return (id)[MEMORY[0x263F086A0] scrcStringWithString:@" " treePosition:a4];
}

- (id)mathMLString
{
  return @"<mspace />";
}

- (BOOL)beginsWithSpace
{
  return 1;
}

- (BOOL)endsWithSpace
{
  return 1;
}

@end