@interface VFXCommonProfileProgramGenerator
+ (id)generatorWithProfile:(int)a3 allowingHotReload:(BOOL)a4;
- (VFXCommonProfileProgramGenerator)init;
- (__CFXFXProgram)programWithHashCode:(__CFXProgramHashCode *)a3 engineContext:(__CFXEngineContext *)a4 trackedResource:(id)a5 introspectionDataPtr:(void *)a6;
- (int)profile;
- (void)dealloc;
- (void)emptyShaderCache;
- (void)releaseProgramForResource:(id)a3;
@end

@implementation VFXCommonProfileProgramGenerator

- (VFXCommonProfileProgramGenerator)init
{
  v7.receiver = self;
  v7.super_class = (Class)VFXCommonProfileProgramGenerator;
  v2 = [(VFXCommonProfileProgramGenerator *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_programMutex._os_unfair_lock_opaque = 0;
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    v5 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
    v2->_shaders = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    v3->_trackedResourcesToHashcode = CFDictionaryCreateMutable(v4, 0, 0, v5);
    sub_1B6595954(v3, (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))sub_1B644C4D0, @"kCFXNotificationProfileWillDie", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    sub_1B6595954(v3, (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))sub_1B644C548, @"kCFXShadableDidChange", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v3;
}

- (void)dealloc
{
  sub_1B65959BC(self, @"kCFXNotificationProfileWillDie", 0);
  shaders = self->_shaders;
  if (shaders)
  {
    CFRelease(shaders);
    self->_shaders = 0;
  }
  trackedResourcesToHashcode = self->_trackedResourcesToHashcode;
  if (trackedResourcesToHashcode)
  {
    CFRelease(trackedResourcesToHashcode);
    self->_trackedResourcesToHashcode = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)VFXCommonProfileProgramGenerator;
  [(VFXCommonProfileProgramGenerator *)&v5 dealloc];
}

- (int)profile
{
  sub_1B63F2F54(16, @"Unreachable code: Invalid CommonProfile generator", v2, v3, v4, v5, v6, v7, vars0);
  return -1;
}

- (void)emptyShaderCache
{
  CFDictionaryRemoveAllValues(self->_shaders);
  trackedResourcesToHashcode = self->_trackedResourcesToHashcode;

  CFDictionaryRemoveAllValues(trackedResourcesToHashcode);
}

+ (id)generatorWithProfile:(int)a3 allowingHotReload:(BOOL)a4
{
  BOOL v4 = a4;
  objc_sync_enter(a1);
  if (!a3 && !qword_1E9E48C78[0])
  {
    uint64_t v7 = [VFXCommonProfileProgramGeneratorMetal alloc];
    qword_1E9E48C78[0] = objc_msgSend_initAllowingHotReload_(v7, v8, v4, v9);
  }
  objc_sync_exit(a1);
  return (id)qword_1E9E48C78[a3];
}

- (__CFXFXProgram)programWithHashCode:(__CFXProgramHashCode *)a3 engineContext:(__CFXEngineContext *)a4 trackedResource:(id)a5 introspectionDataPtr:(void *)a6
{
  uint64_t v11 = sub_1B659D890((uint64_t)a3);
  if (v11)
  {
    CFStringRef v18 = (const __CFString *)v11;
    os_unfair_lock_lock(&self->_programMutex);
    Value = (CFSetRef *)CFDictionaryGetValue(self->_shaders, v18);
    if (Value)
    {
      v20 = Value;
      int v21 = CFSetContainsValue(Value[2], a5);
      BOOL v22 = v21 == 0;
      if (!v21) {
        CFSetAddValue(v20[2], a5);
      }
      v23 = (__CFXFXProgram *)v20[1];
    }
    else
    {
      context = (void *)MEMORY[0x1BA9B76E0]();
      v24 = sub_1B63F2EE0();
      os_signpost_id_t v25 = os_signpost_id_generate(v24);
      v26 = sub_1B63F2EE0();
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v28 = v26;
        if (os_signpost_enabled(v26))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6287000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v25, "GenerateShader", "", buf, 2u);
        }
      }
      v23 = (__CFXFXProgram *)objc_msgSend__newProgramWithHashCode_engineContext_introspectionDataPtr_(self, v27, (uint64_t)a3, (uint64_t)a4, a6);
      v29 = sub_1B63F2EE0();
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v30 = v29;
        if (os_signpost_enabled(v29))
        {
          *(_WORD *)v49 = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6287000, v30, OS_SIGNPOST_INTERVAL_END, v25, "GenerateShader", "", v49, 2u);
        }
      }
      if (!v23)
      {
        CFStringRef v47 = CFCopyDescription(a3);
        sub_1B63F2F54(0, @"Warning: Failed to create program for hashcode %@: %@", v40, v41, v42, v43, v44, v45, (uint64_t)v18);
        CFRelease(v47);
LABEL_23:
        os_unfair_lock_unlock(&self->_programMutex);
        return v23;
      }
      sub_1B65834BC((uint64_t)v23, v18, v31, v32, v33, v34, v35, v36);
      v37 = objc_alloc_init(VFXCommonProfileProgramCache);
      v37->_program = (__CFXFXProgram *)CFRetain(v23);
      CFSetAddValue(v37->_owners, a5);
      CFDictionarySetValue(self->_shaders, v18, v37);

      CFRelease(v23);
      BOOL v22 = 1;
    }
    if (v22 && v23 != 0)
    {
      Mutable = (void *)CFDictionaryGetValue(self->_trackedResourcesToHashcode, a5);
      if (!Mutable)
      {
        Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
        CFDictionarySetValue(self->_trackedResourcesToHashcode, a5, Mutable);
        CFRelease(Mutable);
      }
      CFArrayAppendValue((CFMutableArrayRef)Mutable, v18);
    }
    goto LABEL_23;
  }
  sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v12, v13, v14, v15, v16, v17, (uint64_t)"hashcode");
  return 0;
}

- (void)releaseProgramForResource:(id)a3
{
  if (!a3) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", 0, v3, v4, v5, v6, v7, (uint64_t)"trackedResource");
  }
  os_unfair_lock_lock(&self->_programMutex);
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(self->_trackedResourcesToHashcode, a3);
  if (Value)
  {
    CFArrayRef v11 = Value;
    CFIndex Count = CFArrayGetCount(Value);
    if (Count >= 1)
    {
      CFIndex v13 = Count;
      for (CFIndex i = 0; i != v13; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v11, i);
        uint64_t v16 = (CFMutableSetRef *)CFDictionaryGetValue(self->_shaders, ValueAtIndex);
        if (v16)
        {
          v23 = v16;
          CFSetRemoveValue(v16[2], a3);
          if (!CFSetGetCount(v23[2])) {
            CFDictionaryRemoveValue(self->_shaders, ValueAtIndex);
          }
        }
        else if ((byte_1E9DDA858 & 1) == 0)
        {
          byte_1E9DDA858 = 1;
          sub_1B63F2F54(16, @"Error: CFXCommonProfileProgramReleaseHashCode can't find cache for tracked resource", v17, v18, v19, v20, v21, v22, v24);
        }
      }
    }
  }
  CFDictionaryRemoveValue(self->_trackedResourcesToHashcode, a3);

  os_unfair_lock_unlock(&self->_programMutex);
}

@end