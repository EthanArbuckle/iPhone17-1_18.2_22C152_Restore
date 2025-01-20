@interface WFParameter
@end

@implementation WFParameter

uint64_t __105__WFParameter_WFVariableMenuProvider__clearButtonMenuItemWithVariable_parameterState_setVariableHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __142__WFParameter_WFVariableMenuProvider__variableMenuElementsWithVariable_parameterState_variableProvider_variableUIDelegate_setVariableHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) containsObject:*MEMORY[0x263F87510]];
  v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __142__WFParameter_WFVariableMenuProvider__variableMenuElementsWithVariable_parameterState_variableProvider_variableUIDelegate_setVariableHandler___block_invoke_2;
  v5[3] = &unk_264BFD280;
  id v6 = *(id *)(a1 + 56);
  [v3 showActionOutputPickerAllowingShortcutInput:v2 variableProvider:v4 completionHandler:v5];
}

uint64_t __142__WFParameter_WFVariableMenuProvider__variableMenuElementsWithVariable_parameterState_variableProvider_variableUIDelegate_setVariableHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __142__WFParameter_WFVariableMenuProvider__variableMenuElementsWithVariable_parameterState_variableProvider_variableUIDelegate_setVariableHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __142__WFParameter_WFVariableMenuProvider__variableMenuElementsWithVariable_parameterState_variableProvider_variableUIDelegate_setVariableHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __142__WFParameter_WFVariableMenuProvider__variableMenuElementsWithVariable_parameterState_variableProvider_variableUIDelegate_setVariableHandler___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

@end