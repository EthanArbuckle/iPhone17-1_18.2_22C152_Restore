@interface _UILegibilitySettings(SpringBoard)
- (BOOL)sb_isEqualToLegibilitySettings:()SpringBoard;
- (__CFString)sb_styleString;
- (id)descriptionBuilderWithMultilinePrefix:()SpringBoard;
- (id)descriptionWithMultilinePrefix:()SpringBoard;
- (id)sb_copy;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (uint64_t)sb_description;
@end

@implementation _UILegibilitySettings(SpringBoard)

- (uint64_t)sb_description
{
  return [a1 descriptionWithMultilinePrefix:0];
}

- (__CFString)sb_styleString
{
  uint64_t v1 = [a1 style];
  v2 = @"Default";
  if (v1 == 2) {
    v2 = @"Dark";
  }
  if (v1 == 1) {
    return @"Light";
  }
  else {
    return v2;
  }
}

- (BOOL)sb_isEqualToLegibilitySettings:()SpringBoard
{
  id v4 = a3;
  if (a1 == v4 || ([a1 isEqual:v4] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    uint64_t v6 = [a1 primaryColor];
    uint64_t v7 = [v4 primaryColor];
    uint64_t v8 = [a1 secondaryColor];
    uint64_t v9 = [v4 secondaryColor];
    BOOL v5 = (([(id)v6 _isSimilarToColor:v7 withinPercentage:0.01] & 1) != 0 || !(v6 | v7))
      && (([(id)v8 _isSimilarToColor:v9 withinPercentage:0.01] & 1) != 0 || !(v8 | v9));
  }
  return v5;
}

- (id)sb_copy
{
  id v2 = objc_alloc(MEMORY[0x1E4F43228]);
  uint64_t v3 = [a1 style];
  id v4 = [a1 primaryColor];
  BOOL v5 = [a1 secondaryColor];
  uint64_t v6 = [a1 shadowColor];
  uint64_t v7 = (void *)[v2 initWithStyle:v3 primaryColor:v4 secondaryColor:v5 shadowColor:v6];

  return v7;
}

- (id)succinctDescription
{
  uint64_t v1 = [a1 succinctDescriptionBuilder];
  id v2 = [v1 build];

  return v2;
}

- (id)succinctDescriptionBuilder
{
  id v2 = [MEMORY[0x1E4F4F718] builderWithObject:a1];
  uint64_t v3 = objc_msgSend(a1, "sb_styleString");
  id v4 = (id)[v2 appendObject:v3 withName:@"style"];

  return v2;
}

- (id)descriptionWithMultilinePrefix:()SpringBoard
{
  uint64_t v1 = objc_msgSend(a1, "descriptionBuilderWithMultilinePrefix:");
  id v2 = [v1 build];

  return v2;
}

- (id)descriptionBuilderWithMultilinePrefix:()SpringBoard
{
  id v4 = a3;
  BOOL v5 = [a1 succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76___UILegibilitySettings_SpringBoard__descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E548CBA0;
  id v6 = v5;
  id v10 = v6;
  v11 = a1;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

@end