@interface SSCapabilityCondition
- (BOOL)evaluateWithContext:(id)a3;
@end

@implementation SSCapabilityCondition

- (BOOL)evaluateWithContext:(id)a3
{
  int64_t operator = self->super._operator;
  if (operator)
  {
    if (operator != 1)
    {
      v6 = 0;
LABEL_12:
      BOOL v13 = 0;
      goto LABEL_17;
    }
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 1;
  }
  v6 = (void *)[objc_alloc(NSNumber) initWithBool:v5];
  if (!v6) {
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v6, self->super._value, 0);
  v8 = (void *)SSVMobileInstallationFramework();
  v9 = (uint64_t (*)(void *, void))SSVWeakLinkedSymbolForString("MobileInstallationCheckCapabilitiesMatch", v8);
  if (v9 && (CFDictionaryRef v10 = (const __CFDictionary *)v9(v7, 0)) != 0)
  {
    CFDictionaryRef v11 = v10;
    CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(v10, @"CapabilitiesMatch");
    if (Value) {
      BOOL v13 = CFBooleanGetValue(Value) != 0;
    }
    else {
      BOOL v13 = 0;
    }
    CFRelease(v11);
  }
  else
  {
    BOOL v13 = 0;
  }

LABEL_17:
  return v13;
}

@end