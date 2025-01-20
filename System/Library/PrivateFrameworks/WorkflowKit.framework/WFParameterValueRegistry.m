@interface WFParameterValueRegistry
+ (id)allParameterValueClassesInWorkflowKit;
+ (id)registeredValueClasses;
+ (void)createRegisteredValueClassesSet;
+ (void)initialize;
+ (void)rediscoverParameterValueClassesIfNeeded;
+ (void)registerValueClass:(Class)a3;
@end

@implementation WFParameterValueRegistry

+ (id)allParameterValueClassesInWorkflowKit
{
  static WFParameterValueRegistry.allParameterValueClassesInWorkflowKit()();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5166A8);
  v2 = (void *)sub_1C8532828();
  swift_bridgeObjectRelease();
  return v2;
}

+ (void)rediscoverParameterValueClassesIfNeeded
{
  if (rediscoverParameterValueClassesIfNeeded_onceToken != -1) {
    dispatch_once(&rediscoverParameterValueClassesIfNeeded_onceToken, &__block_literal_global_24500);
  }
  WFRegisterClassesFromClassVendingMethodsIfNeeded();
}

uint64_t __67__WFParameterValueRegistry_rediscoverParameterValueClassesIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) registerValueClass:a2];
}

uint64_t __67__WFParameterValueRegistry_rediscoverParameterValueClassesIfNeeded__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)rediscoverParameterValueClassesIfNeeded_calledParameterValueClassVendingSelectors;
  rediscoverParameterValueClassesIfNeeded_calledParameterValueClassVendingSelectors = v0;

  rediscoverParameterValueClassesIfNeeded_lock = 0;
  return MEMORY[0x1F40C9F00](WFDyldBulkImageLoadCallback_24509);
}

+ (void)createRegisteredValueClassesSet
{
  v2 = (void *)MEMORY[0x1E4F1CA80];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, objc_opt_class(), 0);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v2 setWithSet:v11];
  v10 = (void *)_mutableRegisteredValueClasses;
  _mutableRegisteredValueClasses = v9;
}

+ (id)registeredValueClasses
{
  [a1 rediscoverParameterValueClassesIfNeeded];
  v2 = (void *)[(id)_mutableRegisteredValueClasses copy];
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)objc_opt_new();
  }
  uint64_t v5 = v4;

  return v5;
}

+ (void)registerValueClass:(Class)a3
{
  if (([(objc_class *)a3 conformsToProtocol:&unk_1F2322810] & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:a1 file:@"WFParameterValueRegistry.m" lineNumber:34 description:@"Parameter value classes must conform to NSSecureCoding"];
  }
  uint64_t v6 = (void *)_mutableRegisteredValueClasses;
  [v6 addObject:a3];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    [a1 createRegisteredValueClassesSet];
  }
}

@end