@interface WFPhoneNumberSubstitutableState
- (BOOL)reinterpretsStringsAsContactHandlesFromVariable:(BOOL)a3;
- (id)stringInterpretedAsContactHandle:(id)a3 allowsCustomHandles:(BOOL)a4;
- (id)valueItemClasses;
@end

@implementation WFPhoneNumberSubstitutableState

- (id)valueItemClasses
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return v2;
}

- (id)stringInterpretedAsContactHandle:(id)a3 allowsCustomHandles:(BOOL)a4
{
  v4 = objc_msgSend(MEMORY[0x1E4F5A9D0], "phoneNumberWithPhoneNumberString:", a3, a4);
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F5A800]) initWithPhoneNumber:v4];

  return v5;
}

- (BOOL)reinterpretsStringsAsContactHandlesFromVariable:(BOOL)a3
{
  return 1;
}

@end