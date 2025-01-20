@interface REEngineDefaultsClass
@end

@implementation REEngineDefaultsClass

Class __get_REEngineDefaultsClass_block_invoke(uint64_t a1)
{
  if (!RelevanceEngineLibraryCore_0())
  {
    v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("_REEngineDefaults");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_REEngineDefaultsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v4 = __get_REEngineDefaultsClass_block_invoke_cold_1();
    return (Class)__get_REEngineDefaultsClass_block_invoke_0(v4);
  }
  return result;
}

Class __get_REEngineDefaultsClass_block_invoke_0(uint64_t a1)
{
  if (!RelevanceEngineLibraryCore_1())
  {
    v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("_REEngineDefaults");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_REEngineDefaultsClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v4 = __get_REEngineDefaultsClass_block_invoke_cold_1_0();
    return (Class)__get_REEngineDefaultsClass_block_invoke_1(v4);
  }
  return result;
}

Class __get_REEngineDefaultsClass_block_invoke_1(uint64_t a1)
{
  if (!RelevanceEngineLibraryCore_2())
  {
    v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("_REEngineDefaults");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_REEngineDefaultsClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v4 = __get_REEngineDefaultsClass_block_invoke_cold_1_0();
    return (Class)__get_REEngineDefaultsClass_block_invoke_2(v4);
  }
  return result;
}

Class __get_REEngineDefaultsClass_block_invoke_2(uint64_t a1)
{
  if (!RelevanceEngineLibraryCore_3())
  {
    v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("_REEngineDefaults");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_REEngineDefaultsClass_softClass_2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v4 = __get_REEngineDefaultsClass_block_invoke_cold_1_0();
    return __get_REEngineDefaultsClass_block_invoke_3(v4);
  }
  return result;
}

Class __get_REEngineDefaultsClass_block_invoke_3(uint64_t a1)
{
  if (!RelevanceEngineLibraryCore_4())
  {
    v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("_REEngineDefaults");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_REEngineDefaultsClass_softClass_3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v4 = __get_REEngineDefaultsClass_block_invoke_cold_1_0();
    return (Class)__getNLTaggerClass_block_invoke(v4);
  }
  return result;
}

uint64_t __get_REEngineDefaultsClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __62__REEngineLocationManager__beginMonitoringLocationForManager___block_invoke_2_cold_1(v0);
}

uint64_t __get_REEngineDefaultsClass_block_invoke_cold_1_0()
{
  uint64_t v0 = abort_report_np();
  return __49__RETrainingSimulationClient__handleInterruption__block_invoke_cold_1(v0);
}

@end