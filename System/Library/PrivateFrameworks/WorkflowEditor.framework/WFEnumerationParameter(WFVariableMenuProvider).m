@interface WFEnumerationParameter(WFVariableMenuProvider)
- (id)clearButtonMenuItemWithVariable:()WFVariableMenuProvider parameterState:setVariableHandler:;
@end

@implementation WFEnumerationParameter(WFVariableMenuProvider)

- (id)clearButtonMenuItemWithVariable:()WFVariableMenuProvider parameterState:setVariableHandler:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([a1 hideClearButton])
  {
    v11 = 0;
  }
  else
  {
    v13.receiver = a1;
    v13.super_class = (Class)&off_26E815D98;
    v11 = objc_msgSendSuper2(&v13, sel_clearButtonMenuItemWithVariable_parameterState_setVariableHandler_, v8, v9, v10);
  }

  return v11;
}

@end