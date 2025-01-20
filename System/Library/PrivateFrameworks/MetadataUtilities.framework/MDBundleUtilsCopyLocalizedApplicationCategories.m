@interface MDBundleUtilsCopyLocalizedApplicationCategories
@end

@implementation MDBundleUtilsCopyLocalizedApplicationCategories

double ___MDBundleUtilsCopyLocalizedApplicationCategories_block_invoke()
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = si_tracing_current_span();
  long long v1 = *(_OWORD *)(v0 + 16);
  long long v17 = *(_OWORD *)v0;
  long long v18 = v1;
  uint64_t v19 = *(void *)(v0 + 32);
  unint64_t v2 = si_tracing_calc_traceid();
  unint64_t spanid = si_tracing_calc_next_spanid();
  *(void *)uint64_t v0 = v2;
  *(void *)(v0 + 8) = spanid;
  *(void *)(v0 + 16) = 0;
  *(_DWORD *)(v0 + 24) = -1;
  *(unsigned char *)(v0 + 28) = 102;
  *(void *)(v0 + 32) = "locAppCategories";
  si_tracing_log_span_begin();
  CFDictionaryRef v4 = (const __CFDictionary *)copyAppCategoryMap();
  _MDBundleUtilsCopyLocalizedApplicationCategories_sLocalizedApplicationCategoriesMap = (uint64_t)v4;
  if (v4)
  {
    CFIndex Count = CFDictionaryGetCount(v4);
    CFDictionaryRef v9 = (const __CFDictionary *)_MDBundleUtilsCopyLocalizedApplicationCategories_sLocalizedApplicationCategoriesMap;
    if (_MDBundleUtilsCopyLocalizedApplicationCategories_sLocalizedApplicationCategoriesMap)
    {
      CFIndex v10 = Count;
      MEMORY[0x1F4188790](v8, Count, 8 * Count, v6, v7);
      v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v12, v11);
      CFDictionaryGetKeysAndValues(v9, (const void **)v12, 0);
      if (getCoreTypesBundleURL_onceToken != -1) {
        dispatch_once(&getCoreTypesBundleURL_onceToken, &__block_literal_global_48);
      }
      CFArrayRef v13 = (const __CFArray *)gCoreTypesBundleLocalizations;
      if (gCoreTypesBundleLocalizations && CFArrayGetCount((CFArrayRef)gCoreTypesBundleLocalizations))
      {
        os_unfair_lock_lock((os_unfair_lock_t)&coreTypesLocalizedPropertiesCopy_sCoreTypesLock);
        if (getCoreTypesBundleURL_onceToken != -1) {
          dispatch_once(&getCoreTypesBundleURL_onceToken, &__block_literal_global_48);
        }
        v14 = localizedPropertyCopy((const void **)v12, v10, (const __CFURL *)gCoreTypesLocTableURL, 0, v13, 0);
        os_unfair_lock_unlock((os_unfair_lock_t)&coreTypesLocalizedPropertiesCopy_sCoreTypesLock);
      }
      else
      {
        v14 = 0;
      }
      _MDBundleUtilsCopyLocalizedApplicationCategories_sLocalizedApplicationCategories = (uint64_t)v14;
    }
  }
  si_tracing_log_span_end(*(void *)v0);
  double result = *(double *)&v17;
  long long v16 = v18;
  *(_OWORD *)uint64_t v0 = v17;
  *(_OWORD *)(v0 + 16) = v16;
  *(void *)(v0 + 32) = v19;
  return result;
}

@end