@interface DASCTSMinBatteryLevelKeySymbolLoc
@end

@implementation DASCTSMinBatteryLevelKeySymbolLoc

void *__get_DASCTSMinBatteryLevelKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!qword_1EBE38928)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __DuetActivitySchedulerLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E6B95890;
    uint64_t v7 = 0;
    qword_1EBE38928 = _sl_dlopen();
    v3 = (void *)v5[0];
    v2 = (void *)qword_1EBE38928;
    if (qword_1EBE38928)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  v2 = (void *)qword_1EBE38928;
LABEL_5:
  result = dlsym(v2, "_DASCTSMinBatteryLevelKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  _MergedGlobals_4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end