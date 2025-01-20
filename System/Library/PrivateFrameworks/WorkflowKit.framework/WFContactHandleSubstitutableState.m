@interface WFContactHandleSubstitutableState
- (BOOL)reinterpretsStringsAsContactHandlesFromVariable:(BOOL)a3;
- (id)stringInterpretedAsContactHandle:(id)a3 allowsCustomHandles:(BOOL)a4;
- (id)valueItemClasses;
@end

@implementation WFContactHandleSubstitutableState

- (id)valueItemClasses
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  return v2;
}

- (id)stringInterpretedAsContactHandle:(id)a3 allowsCustomHandles:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = (objc_class *)MEMORY[0x1E4F5A800];
  id v6 = a3;
  v7 = (void *)[[v5 alloc] initWithHandleString:v6 allowsCustomHandles:v4];

  return v7;
}

- (BOOL)reinterpretsStringsAsContactHandlesFromVariable:(BOOL)a3
{
  return !a3;
}

@end