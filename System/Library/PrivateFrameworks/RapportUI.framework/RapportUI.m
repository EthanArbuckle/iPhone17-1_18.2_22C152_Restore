id RPImageForDeviceModel(CFStringRef inTag, int *a2)
{
  __CFString *PreferredIdentifierForTag;
  __CFString *v4;
  CFDictionaryRef v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  int v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  uint64_t vars8;

  PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x263F01908], inTag, 0);
  v4 = PreferredIdentifierForTag;
  if (!PreferredIdentifierForTag)
  {
    v6 = 0;
    v5 = 0;
    goto LABEL_27;
  }
  PreferredIdentifierForTag = (__CFString *)UTTypeCopyDeclaration(PreferredIdentifierForTag);
  v5 = (CFDictionaryRef)PreferredIdentifierForTag;
  v6 = 0;
  if (!PreferredIdentifierForTag)
  {
LABEL_27:
    v12 = 0;
    v11 = -6727;
    goto LABEL_15;
  }
  v7 = *MEMORY[0x263F01A58];
  v8 = *MEMORY[0x263F019F8];
  v9 = v4;
  while (1)
  {
    v10 = v6;
    v6 = [(__CFDictionary *)v5 objectForKeyedSubscript:v7];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
    v4 = [(__CFDictionary *)v5 objectForKeyedSubscript:v8];

    if (!v4) {
      goto LABEL_8;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = -6756;
      goto LABEL_25;
    }

    v5 = UTTypeCopyDeclaration(v4);
    v9 = v4;
    if (!v5)
    {
LABEL_8:
      v11 = -6727;
LABEL_25:

      PreferredIdentifierForTag = 0;
      v5 = 0;
      v12 = 0;
      goto LABEL_15;
    }
  }

  PreferredIdentifierForTag = (__CFString *)UTTypeCopyDeclaringBundleURL(v9);
  v5 = (CFDictionaryRef)PreferredIdentifierForTag;
  if (PreferredIdentifierForTag)
  {
    PreferredIdentifierForTag = [MEMORY[0x263F086E0] bundleWithURL:PreferredIdentifierForTag];
    v12 = PreferredIdentifierForTag;
    v11 = -6704;
    if (PreferredIdentifierForTag)
    {
      PreferredIdentifierForTag = [(__CFString *)PreferredIdentifierForTag pathForResource:v6 ofType:0];
      if (PreferredIdentifierForTag) {
        v11 = 0;
      }
      else {
        v11 = -6704;
      }
    }
  }
  else
  {
    v12 = 0;
    v11 = -6704;
  }
  v4 = v9;
LABEL_15:
  v13 = PreferredIdentifierForTag;

  if (v13)
  {
    v14 = [MEMORY[0x263F1C6B0] imageWithContentsOfFile:v13];
    if (v14) {
      v11 = 0;
    }
    else {
      v11 = -6755;
    }
    if (!a2) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  v14 = 0;
  if (a2) {
LABEL_20:
  }
    *a2 = v11;
LABEL_21:

  return v14;
}

id RPUILocalizedString(void *a1)
{
  uint64_t v1 = RPUILocalizedString_sOnce;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&RPUILocalizedString_sOnce, &__block_literal_global_0);
  }
  v3 = [(id)RPUILocalizedString_sBundle localizedStringForKey:v2 value:0 table:@"Localizable"];
  v4 = v3;
  if (!v3) {
    v3 = v2;
  }
  id v5 = v3;

  return v5;
}

uint64_t __RPUILocalizedString_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.RapportUI"];
  uint64_t v1 = RPUILocalizedString_sBundle;
  RPUILocalizedString_sBundle = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

id RPUILocalizedStringF(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v9 = RPUILocalizedStringV(a1, (uint64_t)&a9);
  return v9;
}

id RPUILocalizedStringV(void *a1, uint64_t a2)
{
  v3 = (objc_class *)NSString;
  id v4 = a1;
  id v5 = [v3 alloc];
  v6 = RPUILocalizedString(v4);
  v7 = (void *)[v5 initWithFormat:v6 arguments:a2];

  if (v7) {
    v8 = v7;
  }
  else {
    v8 = v4;
  }
  id v9 = v8;

  return v9;
}

uint64_t CUDispatchTimerSet()
{
  return MEMORY[0x270F23F20]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x270F243F8]();
}

uint64_t SecondsToUpTicks()
{
  return MEMORY[0x270F24688]();
}

CFDictionaryRef UTTypeCopyDeclaration(CFStringRef inUTI)
{
  return (CFDictionaryRef)MEMORY[0x270EE8550](inUTI);
}

CFURLRef UTTypeCopyDeclaringBundleURL(CFStringRef inUTI)
{
  return (CFURLRef)MEMORY[0x270EE8558](inUTI);
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFStringRef)MEMORY[0x270EE8580](inTagClass, inTag, inConformingToUTI);
}

uint64_t UpTicksToSecondsF()
{
  return MEMORY[0x270F24828]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x270F24858]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F08](*(void *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}