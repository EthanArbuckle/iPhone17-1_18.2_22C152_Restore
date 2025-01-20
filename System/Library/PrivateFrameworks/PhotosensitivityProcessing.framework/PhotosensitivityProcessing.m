uint64_t libAccessibilityLibrary()
{
  uint64_t v0;
  void *v1;
  void *v3[5];
  uint64_t *v4;
  void **v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  long long v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v0 = libAccessibilityLibraryCore_frameworkLibrary;
  v9 = libAccessibilityLibraryCore_frameworkLibrary;
  if (!libAccessibilityLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __libAccessibilityLibraryCore_block_invoke;
    v3[4] = &unk_265460560;
    v4 = &v6;
    v5 = v3;
    v10 = xmmword_265460540;
    v11 = 0;
    v7[3] = _sl_dlopen();
    libAccessibilityLibraryCore_frameworkLibrary = *(void *)(v4[1] + 24);
    v0 = v7[3];
  }
  _Block_object_dispose(&v6, 8);
  v1 = v3[0];
  if (!v0)
  {
    v1 = (void *)abort_report_np();
    __break(1u);
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void sub_259DA2584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_AXSPhotosensitiveVisualDebuggingEnabled()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (uint64_t (*)(void))get_AXSPhotosensitiveVisualDebuggingEnabledSymbolLoc_ptr;
  v7 = get_AXSPhotosensitiveVisualDebuggingEnabledSymbolLoc_ptr;
  if (!get_AXSPhotosensitiveVisualDebuggingEnabledSymbolLoc_ptr)
  {
    v1 = (void *)libAccessibilityLibrary();
    v5[3] = (uint64_t)dlsym(v1, "_AXSPhotosensitiveVisualDebuggingEnabled");
    get_AXSPhotosensitiveVisualDebuggingEnabledSymbolLoc_ptr = (_UNKNOWN *)v5[3];
    v0 = (uint64_t (*)(void))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)+[PSEVideoProcessor needsProcessing]();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return v0();
}

uint64_t soft_AXSPhotosensitiveSourceCopyDebuggingEnabled()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (uint64_t (*)(void))get_AXSPhotosensitiveSourceCopyDebuggingEnabledSymbolLoc_ptr;
  v7 = get_AXSPhotosensitiveSourceCopyDebuggingEnabledSymbolLoc_ptr;
  if (!get_AXSPhotosensitiveSourceCopyDebuggingEnabledSymbolLoc_ptr)
  {
    v1 = (void *)libAccessibilityLibrary();
    v5[3] = (uint64_t)dlsym(v1, "_AXSPhotosensitiveSourceCopyDebuggingEnabled");
    get_AXSPhotosensitiveSourceCopyDebuggingEnabledSymbolLoc_ptr = (_UNKNOWN *)v5[3];
    v0 = (uint64_t (*)(void))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)+[PSEVideoProcessor needsProcessing]();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return v0();
}

uint64_t __libAccessibilityLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  libAccessibilityLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAXDeviceSupportsPhotosensitiveMitigationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __AccessibilityUtilitiesLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_265460580;
    uint64_t v7 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
    v3 = (void *)v5[0];
    v2 = (void *)AccessibilityUtilitiesLibraryCore_frameworkLibrary;
    if (AccessibilityUtilitiesLibraryCore_frameworkLibrary)
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
  v2 = (void *)AccessibilityUtilitiesLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "AXDeviceSupportsPhotosensitiveMitigation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXDeviceSupportsPhotosensitiveMitigationSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

uint64_t __AccessibilityUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUtilitiesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getkAXSPhotosensitiveVisualDebuggingEnabledNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)libAccessibilityLibrary();
  uint64_t result = dlsym(v2, "kAXSPhotosensitiveVisualDebuggingEnabledNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAXSPhotosensitiveVisualDebuggingEnabledNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                               + 8)
                                                                                   + 24);
  return result;
}

void *__getkAXSPhotosensitiveSourceCopyDebuggingEnabledNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)libAccessibilityLibrary();
  uint64_t result = dlsym(v2, "kAXSPhotosensitiveSourceCopyDebuggingEnabledNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAXSPhotosensitiveSourceCopyDebuggingEnabledNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                       + 24);
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t sub_259DA6488(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F24C0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_259DB0390;
  *(void *)(inited + 32) = sub_259DAF610();
  *(void *)(inited + 40) = v5;
  *(_DWORD *)(inited + 48) = 1;
  *(void *)(inited + 56) = sub_259DAF610();
  *(void *)(inited + 64) = v6;
  *(_DWORD *)(inited + 72) = 2;
  *(void *)(inited + 80) = sub_259DAF610();
  *(void *)(inited + 88) = v7;
  *(_DWORD *)(inited + 96) = 4;
  *(void *)(inited + 104) = sub_259DAF610();
  *(void *)(inited + 112) = v8;
  *(_DWORD *)(inited + 120) = 5;
  *(void *)(inited + 128) = sub_259DAF610();
  *(void *)(inited + 136) = v9;
  *(_DWORD *)(inited + 144) = 6;
  *(void *)(inited + 152) = sub_259DAF610();
  *(void *)(inited + 160) = v10;
  *(_DWORD *)(inited + 168) = 7;
  *(void *)(inited + 176) = sub_259DAF610();
  *(void *)(inited + 184) = v11;
  *(_DWORD *)(inited + 192) = 9;
  *(void *)(inited + 200) = sub_259DAF610();
  *(void *)(inited + 208) = v12;
  *(_DWORD *)(inited + 216) = 10;
  *(void *)(inited + 224) = sub_259DAF610();
  *(void *)(inited + 232) = v13;
  *(_DWORD *)(inited + 240) = 11;
  *(void *)(inited + 248) = sub_259DAF610();
  *(void *)(inited + 256) = v14;
  *(_DWORD *)(inited + 264) = 12;
  *(void *)(inited + 272) = sub_259DAF610();
  *(void *)(inited + 280) = v15;
  *(_DWORD *)(inited + 288) = 13;
  *(void *)(inited + 296) = sub_259DAF610();
  *(void *)(inited + 304) = v16;
  *(_DWORD *)(inited + 312) = 14;
  *(void *)(inited + 320) = sub_259DAF610();
  *(void *)(inited + 328) = v17;
  *(_DWORD *)(inited + 336) = 15;
  *(void *)(inited + 344) = sub_259DAF610();
  *(void *)(inited + 352) = v18;
  *(_DWORD *)(inited + 360) = 16;
  *(void *)(inited + 368) = sub_259DAF610();
  *(void *)(inited + 376) = v19;
  *(_DWORD *)(inited + 384) = 17;
  *(void *)(inited + 392) = sub_259DAF610();
  *(void *)(inited + 400) = v20;
  *(_DWORD *)(inited + 408) = 18;
  *(void *)(inited + 416) = sub_259DAF610();
  *(void *)(inited + 424) = v21;
  *(_DWORD *)(inited + 432) = 19;
  *(void *)(inited + 440) = sub_259DAF610();
  *(void *)(inited + 448) = v22;
  *(_DWORD *)(inited + 456) = 20;
  *(void *)(inited + 464) = sub_259DAF610();
  *(void *)(inited + 472) = v23;
  *(_DWORD *)(inited + 480) = 21;
  *(void *)(inited + 488) = sub_259DAF610();
  *(void *)(inited + 496) = v24;
  *(_DWORD *)(inited + 504) = 22;
  *(void *)(inited + 512) = sub_259DAF610();
  *(void *)(inited + 520) = v25;
  *(_DWORD *)(inited + 528) = 25;
  *(void *)(inited + 536) = sub_259DAF610();
  *(void *)(inited + 544) = v26;
  *(_DWORD *)(inited + 552) = 28;
  swift_bridgeObjectRetain();
  unint64_t v27 = sub_259DA67F4(inited);
  if (*(void *)(v27 + 16) && (unint64_t v28 = sub_259DA6CEC(a1, a2), (v29 & 1) != 0)) {
    uint64_t v30 = *(unsigned int *)(*(void *)(v27 + 56) + 4 * v28);
  }
  else {
    uint64_t v30 = 0;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v30;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_259DA67F4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A3F24D0);
  v2 = (void *)sub_259DAF720();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (_DWORD *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    int v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_259DA6CEC(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    *(_DWORD *)(v2[7] + 4 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 6;
    v2[2] = v13;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_259DA6908(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 59) - 1;
  uint64_t result = 30;
  switch(v1)
  {
    case 0:
      uint64_t result = 20;
      switch(*(unsigned char *)(a1 + 60))
      {
        case 1:
          return result;
        case 8:
          uint64_t result = 6;
          break;
        case 0xD:
          uint64_t result = 5;
          break;
        case 0x10:
          uint64_t result = 35;
          break;
        default:
          goto LABEL_9;
      }
      break;
    case 4:
      uint64_t result = 31;
      break;
    case 5:
      return result;
    case 8:
      uint64_t result = 24;
      switch(*(unsigned char *)(a1 + 60))
      {
        case 1:
          uint64_t result = 20;
          break;
        case 8:
          uint64_t result = 25;
          break;
        case 0x10:
          return result;
        case 0x12:
          uint64_t result = 34;
          break;
        default:
          uint64_t result = 22;
          break;
      }
      break;
    case 10:
      if (*(unsigned char *)(a1 + 60) != 17) {
        goto LABEL_9;
      }
      uint64_t result = 19;
      break;
    case 11:
      int v4 = *(unsigned __int8 *)(a1 + 60);
      if (v4 == 18) {
        int v5 = 2;
      }
      else {
        int v5 = 1;
      }
      if (v4 == 16) {
        unsigned int v6 = 29;
      }
      else {
        unsigned int v6 = v5;
      }
      if (v4 == 8) {
        uint64_t result = 33;
      }
      else {
        uint64_t result = v6;
      }
      break;
    default:
LABEL_9:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t sub_259DA6AEC(__IOSurface *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = (__CFString *)IOSurfaceCopyValue(a1, (CFStringRef)*MEMORY[0x263F0EDA0]);
  uint64_t v3 = v2;
  if (v2)
  {
    int v4 = CGColorSpaceCreateWithPropertyList(v2);
    if (v4)
    {
      int v5 = v4;
      CFStringRef v6 = CGColorSpaceCopyName(v4);
      if (v6)
      {
        int v7 = (__CFString *)v6;
        v16[0] = 0uLL;
        sub_259DAF600();

        swift_unknownObjectRelease();
        uint64_t v3 = 0;
        goto LABEL_7;
      }
    }
    swift_unknownObjectRelease();
    uint64_t v3 = 0;
  }
LABEL_7:
  CFTypeRef v8 = IOSurfaceCopyValue(a1, (CFStringRef)*MEMORY[0x263F0EE00]);
  if (v8)
  {
    CFTypeRef v9 = v8;
    CFTypeID v10 = CFGetTypeID(v8);
    if (v10 == CFDataGetTypeID())
    {
      uint64_t v11 = MEMORY[0x25A2EAF50](v9);
      if (v11)
      {
        BOOL v12 = (CGColorSpace *)v11;
        swift_bridgeObjectRelease();
        uint64_t v3 = (__CFString *)CGColorSpaceCopyName(v12);
        if (v3)
        {
          sub_259DAF600();

          swift_unknownObjectRelease();
          uint64_t v3 = 0;
          goto LABEL_14;
        }
      }
    }
    swift_unknownObjectRelease();
  }
LABEL_14:
  memset(v16, 0, sizeof(v16));
  int v17 = 0;
  if (IOSurfaceGetBulkAttachments() || (uint64_t v13 = sub_259DA6908((uint64_t)v16), !v13)) {
    uint64_t v14 = sub_259DA6488((uint64_t)v3, 0);
  }
  else {
    uint64_t v14 = v13;
  }
  swift_bridgeObjectRelease();
  return v14;
}

BOOL sub_259DA6CBC(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

_DWORD *sub_259DA6CD0@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void sub_259DA6CE0(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_259DA6CEC(uint64_t a1, uint64_t a2)
{
  sub_259DAF770();
  sub_259DAF620();
  uint64_t v4 = sub_259DAF780();

  return sub_259DA6DBC(a1, a2, v4);
}

void type metadata accessor for PSEColorSpace()
{
  if (!qword_26A3F24C8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26A3F24C8);
    }
  }
}

unint64_t sub_259DA6DBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    CFTypeID v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_259DAF730() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_259DAF730() & 1) == 0);
    }
  }
  return v6;
}

void *sub_259DA6EA0(void *result, uint64_t a2)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = result;
    if (a2)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A3F29B0);
      uint64_t v4 = (void *)sub_259DAF650();
      v4[2] = a2;
      int v7 = v4;
      v4[4] = v3;
      if (a2 != 1)
      {
        v4[5] = v3;
        uint64_t v5 = a2 - 2;
        if (v5)
        {
          unint64_t v6 = v4 + 6;
          do
          {
            *v6++ = v3;
            swift_unknownObjectRetain();
            --v5;
          }
          while (v5);
        }
        swift_unknownObjectRetain();
      }
    }
    else
    {
      int v7 = (void *)MEMORY[0x263F8EE78];
      swift_unknownObjectRelease();
    }
    sub_259DAF640();
    return v7;
  }
  return result;
}

uint64_t VideoProcessor.validationCallback.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR___SwiftVideoProcessor_validationCallback);
  swift_beginAccess();
  uint64_t v2 = *v1;
  sub_259DA7094(*v1);
  return v2;
}

uint64_t sub_259DA7094(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_259DA70A4(uint64_t a1, double a2, double a3, double a4)
{
  int v7 = *(void (**)(uint64_t, double, double, double))(a1 + 32);
  uint64_t v8 = swift_retain();
  v7(v8, a2, a3, a4);

  return swift_release();
}

uint64_t VideoProcessor.validationCallback.setter(uint64_t a1, uint64_t a2)
{
  sub_259DAD2B8(a1, a2);

  return sub_259DAD3BC(a1);
}

uint64_t sub_259DA7210@<X0>(void *a1@<X0>, uint64_t (**a2)(double *, double *, double *)@<X8>)
{
  uint64_t v3 = (uint64_t *)(*a1 + OBJC_IVAR___SwiftVideoProcessor_validationCallback);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    int v7 = sub_259DAD404;
  }
  else
  {
    int v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)(double *, double *, double *))v6;
  return sub_259DA7094(v4);
}

uint64_t sub_259DA72B0(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  if (*a1)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    *(void *)(v3 + 24) = v2;
    uint64_t v4 = sub_259DAE010;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v3 = 0;
  }
  sub_259DA7094(v1);
  sub_259DAD2B8((uint64_t)v4, v3);

  return sub_259DAD3BC((uint64_t)v4);
}

void (*VideoProcessor.validationCallback.modify(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR___SwiftVideoProcessor_validationCallback;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_259DA73C4;
}

void sub_259DA73C4(void **a1, char a2)
{
  uint64_t v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = v3[3];
    uint64_t v5 = (uint64_t *)(v4 + v3[4]);
    uint64_t v6 = *v5;
    uint64_t v7 = v5[1];
    if (*v5)
    {
      uint64_t v8 = swift_allocObject();
      *(void *)(v8 + 16) = v6;
      *(void *)(v8 + 24) = v7;
      uint64_t v9 = sub_259DAD404;
    }
    else
    {
      uint64_t v9 = 0;
    }
    BOOL v10 = v6 != 0;
    sub_259DA7094(v6);
    sub_259DAD3BC((uint64_t)v9);
    uint64_t v11 = v4 + OBJC_IVAR___SwiftVideoProcessor_bufferConstants;
    swift_beginAccess();
    *(unsigned char *)(v11 + 6) = v10;
  }

  free(v3);
}

uint64_t VideoProcessor.inTestingMode.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___SwiftVideoProcessor_inTestingMode);
  swift_beginAccess();
  return *v1;
}

uint64_t VideoProcessor.inTestingMode.setter(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR___SwiftVideoProcessor_inTestingMode);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*VideoProcessor.inTestingMode.modify())()
{
  return j__swift_endAccess;
}

uint64_t VideoProcessor.debugMode.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___SwiftVideoProcessor_debugMode);
  swift_beginAccess();
  return *v1;
}

uint64_t VideoProcessor.debugMode.setter(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR___SwiftVideoProcessor_debugMode);
  swift_beginAccess();
  unsigned char *v3 = a1;
  uint64_t v4 = v1 + OBJC_IVAR___SwiftVideoProcessor_bufferConstants;
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v4 + 5) = a1;
  return result;
}

uint64_t sub_259DA77BC@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = (unsigned char *)(*a1 + OBJC_IVAR___SwiftVideoProcessor_debugMode);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_259DA7810(char *a1, uint64_t *a2)
{
  char v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t v4 = (unsigned char *)(*a2 + OBJC_IVAR___SwiftVideoProcessor_debugMode);
  swift_beginAccess();
  *uint64_t v4 = v2;
  uint64_t v5 = v3 + OBJC_IVAR___SwiftVideoProcessor_bufferConstants;
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v5 + 5) = v2;
  return result;
}

void (*VideoProcessor.debugMode.modify(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR___SwiftVideoProcessor_debugMode;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_259DA78F8;
}

void sub_259DA78F8(void **a1, char a2)
{
  uint64_t v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = v3[3];
    char v5 = *(unsigned char *)(v4 + v3[4]);
    uint64_t v6 = v4 + OBJC_IVAR___SwiftVideoProcessor_bufferConstants;
    swift_beginAccess();
    *(unsigned char *)(v6 + 5) = v5;
  }

  free(v3);
}

uint64_t VideoProcessor.copySourceOnlyDebugging.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___SwiftVideoProcessor_copySourceOnlyDebugging);
  swift_beginAccess();
  return *v1;
}

uint64_t VideoProcessor.copySourceOnlyDebugging.setter(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR___SwiftVideoProcessor_copySourceOnlyDebugging);
  swift_beginAccess();
  unsigned char *v3 = a1;
  uint64_t v4 = v1 + OBJC_IVAR___SwiftVideoProcessor_bufferConstants;
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v4 + 7) = a1;
  return result;
}

uint64_t sub_259DA7AF4@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = (unsigned char *)(*a1 + OBJC_IVAR___SwiftVideoProcessor_copySourceOnlyDebugging);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_259DA7B48(char *a1, uint64_t *a2)
{
  char v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t v4 = (unsigned char *)(*a2 + OBJC_IVAR___SwiftVideoProcessor_copySourceOnlyDebugging);
  swift_beginAccess();
  *uint64_t v4 = v2;
  uint64_t v5 = v3 + OBJC_IVAR___SwiftVideoProcessor_bufferConstants;
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v5 + 7) = v2;
  return result;
}

void (*VideoProcessor.copySourceOnlyDebugging.modify(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR___SwiftVideoProcessor_copySourceOnlyDebugging;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_259DA7C30;
}

void sub_259DA7C30(void **a1, char a2)
{
  uint64_t v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = v3[3];
    char v5 = *(unsigned char *)(v4 + v3[4]);
    uint64_t v6 = v4 + OBJC_IVAR___SwiftVideoProcessor_bufferConstants;
    swift_beginAccess();
    *(unsigned char *)(v6 + 7) = v5;
  }

  free(v3);
}

id VideoProcessor.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id VideoProcessor.init()()
{
  id v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  v0[OBJC_IVAR___SwiftVideoProcessor_needsInitialization] = 1;
  *(void *)&v0[OBJC_IVAR___SwiftVideoProcessor_device] = 0;
  *(void *)&v0[OBJC_IVAR___SwiftVideoProcessor_commandQueue] = 0;
  *(void *)&v0[OBJC_IVAR___SwiftVideoProcessor_library] = 0;
  *(void *)&v0[OBJC_IVAR___SwiftVideoProcessor_previousSurfaceTime] = 0;
  *(void *)&v0[OBJC_IVAR___SwiftVideoProcessor_cptPSO_RiskComputePass0] = 0;
  *(void *)&v0[OBJC_IVAR___SwiftVideoProcessor_cptPSO_RiskComputePass1] = 0;
  *(void *)&v0[OBJC_IVAR___SwiftVideoProcessor_cptPSO_RiskComputePass2] = 0;
  *(void *)&v0[OBJC_IVAR___SwiftVideoProcessor_cptPSO_RiskComputePass3] = 0;
  uint64_t v3 = OBJC_IVAR___SwiftVideoProcessor_bufferFrameLumaSum;
  uint64_t v4 = v0;
  *(void *)&v1[v3] = sub_259DA6EA0(0, 2);
  uint64_t v5 = OBJC_IVAR___SwiftVideoProcessor_bufferData;
  *(void *)&v4[v5] = sub_259DA6EA0(0, 2);
  uint64_t v6 = OBJC_IVAR___SwiftVideoProcessor_bufferCurState;
  *(void *)&v4[v6] = sub_259DA6EA0(0, 2);
  uint64_t v7 = OBJC_IVAR___SwiftVideoProcessor_bufferGammaKernel;
  *(void *)&v4[v7] = sub_259DA6EA0(0, 2);
  uint64_t v8 = OBJC_IVAR___SwiftVideoProcessor_bufferEnergy;
  *(void *)&v4[v8] = sub_259DA6EA0(0, 2);
  uint64_t v9 = OBJC_IVAR___SwiftVideoProcessor_bufferEnergy2;
  *(void *)&v4[v9] = sub_259DA6EA0(0, 2);
  uint64_t v10 = OBJC_IVAR___SwiftVideoProcessor_bufferContrastKernel;
  *(void *)&v4[v10] = sub_259DA6EA0(0, 2);
  uint64_t v11 = OBJC_IVAR___SwiftVideoProcessor_bufferContrast;
  *(void *)&v4[v11] = sub_259DA6EA0(0, 2);
  uint64_t v12 = OBJC_IVAR___SwiftVideoProcessor_bufferResponses;
  *(void *)&v4[v12] = sub_259DA6EA0(0, 2);
  uint64_t v13 = OBJC_IVAR___SwiftVideoProcessor_bufferResponsesNorm;
  *(void *)&v4[v13] = sub_259DA6EA0(0, 2);
  uint64_t v14 = OBJC_IVAR___SwiftVideoProcessor_bufferResults;
  *(void *)&v4[v14] = sub_259DA6EA0(0, 2);
  *(void *)&v4[OBJC_IVAR___SwiftVideoProcessor_bufferDataDebug] = 0;
  *(void *)&v4[OBJC_IVAR___SwiftVideoProcessor_sourceTexture] = 0;
  *(void *)&v4[OBJC_IVAR___SwiftVideoProcessor_sourceCbCrTexture] = 0;
  *(void *)&v4[OBJC_IVAR___SwiftVideoProcessor_processedTexture] = 0;
  *(_DWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_fps] = 1114636288;
  *(_DWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_nits] = 0;
  *(_DWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_area] = 1151218729;
  *(_DWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_avl] = 1041865114;
  *(_DWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_gain] = 1065353216;
  *(_DWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_energyPoolGammaShape] = 0x40000000;
  *(_DWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_energyPoolExponent] = 0x40000000;
  *(_DWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_energyPoolGammaScale] = 1041865114;
  *(_DWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_probabilityPoolGammaShape] = 1082130432;
  *(_DWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_probabilityPoolExponent] = 1082130432;
  *(_DWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_cA] = 1049012208;
  *(_DWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_tauAdapt] = 1065353216;
  *(_DWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_tauMitigation] = 0x40000000;
  *(void *)&v4[OBJC_IVAR___SwiftVideoProcessor_idxFrameRate] = 0;
  *(void *)&v4[OBJC_IVAR___SwiftVideoProcessor_idxEquivalentSize] = 0;
  *(void *)&v4[OBJC_IVAR___SwiftVideoProcessor_idxEquivalentKernelIndex] = 0;
  *(void *)&v4[OBJC_IVAR___SwiftVideoProcessor_framePoolIndex] = 0;
  uint64_t v15 = &v4[OBJC_IVAR___SwiftVideoProcessor_validationCallback];
  *uint64_t v15 = 0;
  v15[1] = 0;
  v4[OBJC_IVAR___SwiftVideoProcessor_inTestingMode] = 0;
  v4[OBJC_IVAR___SwiftVideoProcessor_debugMode] = 0;
  v4[OBJC_IVAR___SwiftVideoProcessor_copySourceOnlyDebugging] = 0;
  uint64_t v16 = sub_259DAF650();
  *(void *)(v16 + 16) = 10;
  memset_pattern16((void *)(v16 + 32), &unk_259DB0530, 0x50uLL);
  *(void *)&v4[OBJC_IVAR___SwiftVideoProcessor_frameDeltas] = v16;
  *(void *)&v4[OBJC_IVAR___SwiftVideoProcessor_protectionStatus] = 0;
  int v17 = &v4[OBJC_IVAR___SwiftVideoProcessor_bufferConstants];
  *((void *)v17 + 5) = 0;
  v17[48] = 0;
  *((_DWORD *)v17 + 13) = 0;
  *(void *)int v17 = 0;
  *((_WORD *)v17 + 4) = 0;
  *(void *)(v17 + 12) = 0;
  *(void *)(v17 + 28) = 0;
  *(void *)(v17 + 20) = 0;

  v19.receiver = v4;
  v19.super_class = ObjectType;
  return objc_msgSendSuper2(&v19, sel_init);
}

uint64_t sub_259DA80A0(uint64_t result)
{
  char v2 = *(void **)(v1 + OBJC_IVAR___SwiftVideoProcessor_device);
  if (v2)
  {
    uint64_t v3 = v1;
    uint64_t v4 = result;
    uint64_t result = (uint64_t)objc_msgSend((id)swift_unknownObjectRetain(), sel_heapBufferSizeAndAlignWithLength_options_, 4, 544);
    uint64_t v6 = result + v5;
    if (__OFADD__(result, v5)) {
      goto LABEL_119;
    }
    uint64_t v7 = v6 - 1;
    if (__OFSUB__(v6, 1))
    {
LABEL_120:
      __break(1u);
    }
    else
    {
      uint64_t v8 = v5 - 1;
      if (!__OFSUB__(v5, 1))
      {
        uint64_t result = (uint64_t)objc_msgSend(v2, sel_heapBufferSizeAndAlignWithLength_options_, 56, 544);
        uint64_t v10 = result + v9;
        if (!__OFADD__(result, v9))
        {
          BOOL v11 = __OFSUB__(v10, 1);
          uint64_t v12 = v10 - 1;
          if (!v11)
          {
            if (!__OFSUB__(v9, 1))
            {
              uint64_t v13 = v7 & ~v8;
              uint64_t v14 = v12 & ~(v9 - 1);
              uint64_t v15 = v13 + v14;
              if (!__OFADD__(v13, v14))
              {
                uint64_t result = (uint64_t)objc_msgSend(v2, sel_heapBufferSizeAndAlignWithLength_options_, 144, 544);
                uint64_t v17 = result + v16;
                if (!__OFADD__(result, v16))
                {
                  BOOL v11 = __OFSUB__(v17, 1);
                  uint64_t v18 = v17 - 1;
                  if (!v11)
                  {
                    if (!__OFSUB__(v16, 1))
                    {
                      uint64_t v19 = v18 & ~(v16 - 1);
                      BOOL v11 = __OFADD__(v15, v19);
                      uint64_t v20 = v15 + v19;
                      if (!v11)
                      {
                        uint64_t result = (uint64_t)objc_msgSend(v2, sel_heapBufferSizeAndAlignWithLength_options_, 1024, 544);
                        uint64_t v22 = result + v21;
                        if (!__OFADD__(result, v21))
                        {
                          BOOL v11 = __OFSUB__(v22, 1);
                          uint64_t v23 = v22 - 1;
                          if (!v11)
                          {
                            if (!__OFSUB__(v21, 1))
                            {
                              uint64_t v24 = v23 & ~(v21 - 1);
                              BOOL v11 = __OFADD__(v20, v24);
                              uint64_t v25 = v20 + v24;
                              if (!v11)
                              {
                                uint64_t result = (uint64_t)objc_msgSend(v2, sel_heapBufferSizeAndAlignWithLength_options_, 5120, 544);
                                uint64_t v27 = result + v26;
                                if (!__OFADD__(result, v26))
                                {
                                  BOOL v11 = __OFSUB__(v27, 1);
                                  uint64_t v28 = v27 - 1;
                                  if (!v11)
                                  {
                                    if (!__OFSUB__(v26, 1))
                                    {
                                      uint64_t v29 = v28 & ~(v26 - 1);
                                      BOOL v11 = __OFADD__(v25, v29);
                                      uint64_t v30 = v25 + v29;
                                      if (!v11)
                                      {
                                        uint64_t result = (uint64_t)objc_msgSend(v2, sel_heapBufferSizeAndAlignWithLength_options_, 5120, 544);
                                        uint64_t v32 = result + v31;
                                        if (!__OFADD__(result, v31))
                                        {
                                          BOOL v11 = __OFSUB__(v32, 1);
                                          uint64_t v33 = v32 - 1;
                                          if (!v11)
                                          {
                                            if (!__OFSUB__(v31, 1))
                                            {
                                              uint64_t v34 = v33 & ~(v31 - 1);
                                              BOOL v11 = __OFADD__(v30, v34);
                                              uint64_t v35 = v30 + v34;
                                              if (!v11)
                                              {
                                                uint64_t result = (uint64_t)objc_msgSend(v2, sel_heapBufferSizeAndAlignWithLength_options_, 640, 544);
                                                uint64_t v37 = result + v36;
                                                if (!__OFADD__(result, v36))
                                                {
                                                  BOOL v11 = __OFSUB__(v37, 1);
                                                  uint64_t v38 = v37 - 1;
                                                  if (!v11)
                                                  {
                                                    if (!__OFSUB__(v36, 1))
                                                    {
                                                      uint64_t v39 = v38 & ~(v36 - 1);
                                                      BOOL v11 = __OFADD__(v35, v39);
                                                      uint64_t v40 = v35 + v39;
                                                      if (!v11)
                                                      {
                                                        uint64_t result = (uint64_t)objc_msgSend(v2, sel_heapBufferSizeAndAlignWithLength_options_, 640, 544);
                                                        uint64_t v42 = result + v41;
                                                        if (!__OFADD__(result, v41))
                                                        {
                                                          BOOL v11 = __OFSUB__(v42, 1);
                                                          uint64_t v43 = v42 - 1;
                                                          if (!v11)
                                                          {
                                                            if (!__OFSUB__(v41, 1))
                                                            {
                                                              uint64_t v44 = v43 & ~(v41 - 1);
                                                              BOOL v11 = __OFADD__(v40, v44);
                                                              uint64_t v45 = v40 + v44;
                                                              if (!v11)
                                                              {
                                                                uint64_t result = (uint64_t)objc_msgSend(v2, sel_heapBufferSizeAndAlignWithLength_options_, 20, 544);
                                                                uint64_t v47 = result + v46;
                                                                if (!__OFADD__(result, v46))
                                                                {
                                                                  BOOL v11 = __OFSUB__(v47, 1);
                                                                  uint64_t v48 = v47 - 1;
                                                                  if (!v11)
                                                                  {
                                                                    if (!__OFSUB__(v46, 1))
                                                                    {
                                                                      uint64_t v49 = v48 & ~(v46 - 1);
                                                                      BOOL v11 = __OFADD__(v45, v49);
                                                                      uint64_t v50 = v45 + v49;
                                                                      if (!v11)
                                                                      {
                                                                        uint64_t result = (uint64_t)objc_msgSend(v2, sel_heapBufferSizeAndAlignWithLength_options_, 20, 544);
                                                                        uint64_t v52 = result + v51;
                                                                        if (!__OFADD__(result, v51))
                                                                        {
                                                                          BOOL v11 = __OFSUB__(v52, 1);
                                                                          uint64_t v53 = v52 - 1;
                                                                          if (!v11)
                                                                          {
                                                                            if (!__OFSUB__(v51, 1))
                                                                            {
                                                                              uint64_t v54 = v53 & ~(v51 - 1);
                                                                              BOOL v11 = __OFADD__(v50, v54);
                                                                              uint64_t v55 = v50 + v54;
                                                                              if (!v11)
                                                                              {
                                                                                uint64_t result = (uint64_t)objc_msgSend(v2, sel_heapBufferSizeAndAlignWithLength_options_, 40, 544);
                                                                                uint64_t v57 = result + v56;
                                                                                if (!__OFADD__(result, v56))
                                                                                {
                                                                                  BOOL v11 = __OFSUB__(v57, 1);
                                                                                  uint64_t v58 = v57 - 1;
                                                                                  if (!v11)
                                                                                  {
                                                                                    if (!__OFSUB__(v56, 1))
                                                                                    {
                                                                                      uint64_t v59 = v58 & ~(v56 - 1);
                                                                                      uint64_t v60 = v55 + v59;
                                                                                      if (!__OFADD__(v55, v59))
                                                                                      {
                                                                                        id v61 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F128F0]), sel_init);
                                                                                        objc_msgSend(v61, sel_setSize_, v60);
                                                                                        objc_msgSend(v61, sel_setHazardTrackingMode_, 2);
                                                                                        id v62 = objc_msgSend(v2, sel_newHeapWithDescriptor_, v61);
                                                                                        objc_msgSend(v61, sel_setProtectionOptions_, v4);
                                                                                        v109 = v61;
                                                                                        uint64_t result = (uint64_t)objc_msgSend(v2, sel_newHeapWithDescriptor_, v61);
                                                                                        v118 = (void *)result;
                                                                                        if (PSELog)
                                                                                        {
                                                                                          id v63 = (id)PSELog;
                                                                                          sub_259DAF690();
                                                                                          __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F2660);
                                                                                          uint64_t v64 = swift_allocObject();
                                                                                          *(_OWORD *)(v64 + 16) = xmmword_259DB0450;
                                                                                          uint64_t v108 = v4;
                                                                                          id v65 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedLongLong_, v4);
                                                                                          unint64_t v66 = sub_259DAD408();
                                                                                          *(void *)(v64 + 56) = v66;
                                                                                          unint64_t v67 = sub_259DAD448();
                                                                                          *(void *)(v64 + 64) = v67;
                                                                                          *(void *)(v64 + 32) = v65;
                                                                                          id v68 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v60);
                                                                                          *(void *)(v64 + 96) = v66;
                                                                                          *(void *)(v64 + 104) = v67;
                                                                                          *(void *)(v64 + 72) = v68;
                                                                                          sub_259DAF5E0();

                                                                                          swift_bridgeObjectRelease();
                                                                                          char v69 = 0;
                                                                                          unint64_t v70 = 0;
                                                                                          v117 = (uint64_t *)(v3 + OBJC_IVAR___SwiftVideoProcessor_bufferFrameLumaSum);
                                                                                          v71 = (uint64_t *)(v3 + OBJC_IVAR___SwiftVideoProcessor_bufferData);
                                                                                          v72 = (uint64_t *)(v3 + OBJC_IVAR___SwiftVideoProcessor_bufferCurState);
                                                                                          v73 = (uint64_t *)(v3 + OBJC_IVAR___SwiftVideoProcessor_bufferGammaKernel);
                                                                                          v116 = (uint64_t *)(v3 + OBJC_IVAR___SwiftVideoProcessor_bufferEnergy);
                                                                                          v115 = (uint64_t *)(v3 + OBJC_IVAR___SwiftVideoProcessor_bufferEnergy2);
                                                                                          v114 = (uint64_t *)(v3 + OBJC_IVAR___SwiftVideoProcessor_bufferContrastKernel);
                                                                                          v113 = (uint64_t *)(v3 + OBJC_IVAR___SwiftVideoProcessor_bufferContrast);
                                                                                          v112 = (uint64_t *)(v3 + OBJC_IVAR___SwiftVideoProcessor_bufferResponses);
                                                                                          v111 = (uint64_t *)(v3 + OBJC_IVAR___SwiftVideoProcessor_bufferResponsesNorm);
                                                                                          v110 = (uint64_t *)(v3 + OBJC_IVAR___SwiftVideoProcessor_bufferResults);
                                                                                          while (1)
                                                                                          {
                                                                                            char v74 = v69;
                                                                                            if (v62)
                                                                                            {
                                                                                              id v75 = objc_msgSend((id)swift_unknownObjectRetain(), sel_newBufferWithLength_options_, 4, 544);
                                                                                              if (v75)
                                                                                              {
                                                                                                id v76 = v75;
                                                                                                swift_beginAccess();
                                                                                                uint64_t v77 = *v117;
                                                                                                swift_unknownObjectRetain();
                                                                                                uint64_t result = swift_isUniquelyReferenced_nonNull_native();
                                                                                                uint64_t *v117 = v77;
                                                                                                if ((result & 1) == 0) {
                                                                                                  sub_259DAD194();
                                                                                                }
                                                                                                if (v70 >= *(void *)(v77 + 16))
                                                                                                {
                                                                                                  __break(1u);
LABEL_109:
                                                                                                  __break(1u);
LABEL_110:
                                                                                                  __break(1u);
LABEL_111:
                                                                                                  __break(1u);
LABEL_112:
                                                                                                  __break(1u);
LABEL_113:
                                                                                                  __break(1u);
LABEL_114:
                                                                                                  __break(1u);
LABEL_115:
                                                                                                  __break(1u);
LABEL_116:
                                                                                                  __break(1u);
LABEL_117:
                                                                                                  __break(1u);
LABEL_118:
                                                                                                  __break(1u);
LABEL_119:
                                                                                                  __break(1u);
                                                                                                  goto LABEL_120;
                                                                                                }
                                                                                                *(void *)(v77 + 8 * v70 + 32) = v76;
                                                                                                swift_unknownObjectRelease();
                                                                                                sub_259DAF640();
                                                                                                swift_endAccess();
                                                                                                swift_unknownObjectRelease();
                                                                                              }
                                                                                              id v78 = objc_msgSend(v62, sel_newBufferWithLength_options_, 56, 544);
                                                                                              if (v78)
                                                                                              {
                                                                                                id v79 = v78;
                                                                                                swift_beginAccess();
                                                                                                uint64_t v80 = *v71;
                                                                                                swift_unknownObjectRetain();
                                                                                                uint64_t result = swift_isUniquelyReferenced_nonNull_native();
                                                                                                uint64_t *v71 = v80;
                                                                                                if ((result & 1) == 0) {
                                                                                                  sub_259DAD194();
                                                                                                }
                                                                                                if (v70 >= *(void *)(v80 + 16)) {
                                                                                                  goto LABEL_109;
                                                                                                }
                                                                                                *(void *)(v80 + 8 * v70 + 32) = v79;
                                                                                                swift_unknownObjectRelease();
                                                                                                sub_259DAF640();
                                                                                                swift_endAccess();
                                                                                                swift_unknownObjectRelease();
                                                                                              }
                                                                                              id v81 = objc_msgSend(v62, sel_newBufferWithLength_options_, 144, 544);
                                                                                              if (v81)
                                                                                              {
                                                                                                id v82 = v81;
                                                                                                swift_beginAccess();
                                                                                                uint64_t v83 = *v72;
                                                                                                swift_unknownObjectRetain();
                                                                                                uint64_t result = swift_isUniquelyReferenced_nonNull_native();
                                                                                                uint64_t *v72 = v83;
                                                                                                if ((result & 1) == 0) {
                                                                                                  sub_259DAD194();
                                                                                                }
                                                                                                if (v70 >= *(void *)(v83 + 16)) {
                                                                                                  goto LABEL_110;
                                                                                                }
                                                                                                *(void *)(v83 + 8 * v70 + 32) = v82;
                                                                                                swift_unknownObjectRelease();
                                                                                                sub_259DAF640();
                                                                                                swift_endAccess();
                                                                                                swift_unknownObjectRelease();
                                                                                              }
                                                                                              id v84 = objc_msgSend(v62, sel_newBufferWithLength_options_, 1024, 544);
                                                                                              if (v84)
                                                                                              {
                                                                                                id v85 = v84;
                                                                                                swift_beginAccess();
                                                                                                uint64_t v86 = *v73;
                                                                                                swift_unknownObjectRetain();
                                                                                                uint64_t result = swift_isUniquelyReferenced_nonNull_native();
                                                                                                uint64_t *v73 = v86;
                                                                                                if ((result & 1) == 0) {
                                                                                                  sub_259DAD194();
                                                                                                }
                                                                                                if (v70 >= *(void *)(v86 + 16)) {
                                                                                                  goto LABEL_111;
                                                                                                }
                                                                                                *(void *)(v86 + 8 * v70 + 32) = v85;
                                                                                                swift_unknownObjectRelease();
                                                                                                sub_259DAF640();
                                                                                                swift_endAccess();
                                                                                                swift_unknownObjectRelease();
                                                                                              }
                                                                                              id v87 = objc_msgSend(v62, sel_newBufferWithLength_options_, 5120, 544);
                                                                                              if (v87)
                                                                                              {
                                                                                                id v88 = v87;
                                                                                                swift_beginAccess();
                                                                                                uint64_t v89 = *v116;
                                                                                                swift_unknownObjectRetain();
                                                                                                uint64_t result = swift_isUniquelyReferenced_nonNull_native();
                                                                                                uint64_t *v116 = v89;
                                                                                                if ((result & 1) == 0) {
                                                                                                  sub_259DAD194();
                                                                                                }
                                                                                                if (v70 >= *(void *)(v89 + 16)) {
                                                                                                  goto LABEL_112;
                                                                                                }
                                                                                                *(void *)(v89 + 8 * v70 + 32) = v88;
                                                                                                swift_unknownObjectRelease();
                                                                                                sub_259DAF640();
                                                                                                swift_endAccess();
                                                                                                swift_unknownObjectRelease();
                                                                                              }
                                                                                              id v90 = objc_msgSend(v62, sel_newBufferWithLength_options_, 5120, 544);
                                                                                              if (v90)
                                                                                              {
                                                                                                id v91 = v90;
                                                                                                swift_beginAccess();
                                                                                                uint64_t v92 = *v115;
                                                                                                swift_unknownObjectRetain();
                                                                                                uint64_t result = swift_isUniquelyReferenced_nonNull_native();
                                                                                                uint64_t *v115 = v92;
                                                                                                if ((result & 1) == 0) {
                                                                                                  sub_259DAD194();
                                                                                                }
                                                                                                if (v70 >= *(void *)(v92 + 16)) {
                                                                                                  goto LABEL_113;
                                                                                                }
                                                                                                *(void *)(v92 + 8 * v70 + 32) = v91;
                                                                                                swift_unknownObjectRelease();
                                                                                                sub_259DAF640();
                                                                                                swift_endAccess();
                                                                                                swift_unknownObjectRelease();
                                                                                              }
                                                                                              id v93 = objc_msgSend(v62, sel_newBufferWithLength_options_, 640, 544);
                                                                                              if (v93)
                                                                                              {
                                                                                                id v94 = v93;
                                                                                                swift_beginAccess();
                                                                                                uint64_t v95 = *v114;
                                                                                                swift_unknownObjectRetain();
                                                                                                uint64_t result = swift_isUniquelyReferenced_nonNull_native();
                                                                                                uint64_t *v114 = v95;
                                                                                                if ((result & 1) == 0) {
                                                                                                  sub_259DAD194();
                                                                                                }
                                                                                                if (v70 >= *(void *)(v95 + 16)) {
                                                                                                  goto LABEL_114;
                                                                                                }
                                                                                                *(void *)(v95 + 8 * v70 + 32) = v94;
                                                                                                swift_unknownObjectRelease();
                                                                                                sub_259DAF640();
                                                                                                swift_endAccess();
                                                                                                swift_unknownObjectRelease();
                                                                                              }
                                                                                              id v96 = objc_msgSend(v62, sel_newBufferWithLength_options_, 640, 544);
                                                                                              if (v96)
                                                                                              {
                                                                                                id v97 = v96;
                                                                                                swift_beginAccess();
                                                                                                uint64_t v98 = *v113;
                                                                                                swift_unknownObjectRetain();
                                                                                                uint64_t result = swift_isUniquelyReferenced_nonNull_native();
                                                                                                uint64_t *v113 = v98;
                                                                                                if ((result & 1) == 0) {
                                                                                                  sub_259DAD194();
                                                                                                }
                                                                                                if (v70 >= *(void *)(v98 + 16)) {
                                                                                                  goto LABEL_115;
                                                                                                }
                                                                                                *(void *)(v98 + 8 * v70 + 32) = v97;
                                                                                                swift_unknownObjectRelease();
                                                                                                sub_259DAF640();
                                                                                                swift_endAccess();
                                                                                                swift_unknownObjectRelease();
                                                                                              }
                                                                                              id v99 = objc_msgSend(v62, sel_newBufferWithLength_options_, 20, 544);
                                                                                              if (v99)
                                                                                              {
                                                                                                id v100 = v99;
                                                                                                swift_beginAccess();
                                                                                                uint64_t v101 = *v112;
                                                                                                swift_unknownObjectRetain();
                                                                                                uint64_t result = swift_isUniquelyReferenced_nonNull_native();
                                                                                                uint64_t *v112 = v101;
                                                                                                if ((result & 1) == 0) {
                                                                                                  sub_259DAD194();
                                                                                                }
                                                                                                if (v70 >= *(void *)(v101 + 16)) {
                                                                                                  goto LABEL_116;
                                                                                                }
                                                                                                *(void *)(v101 + 8 * v70 + 32) = v100;
                                                                                                swift_unknownObjectRelease();
                                                                                                sub_259DAF640();
                                                                                                swift_endAccess();
                                                                                                swift_unknownObjectRelease();
                                                                                              }
                                                                                              id v102 = objc_msgSend(v62, sel_newBufferWithLength_options_, 20, 544);
                                                                                              if (v102)
                                                                                              {
                                                                                                id v103 = v102;
                                                                                                swift_beginAccess();
                                                                                                uint64_t v104 = *v111;
                                                                                                swift_unknownObjectRetain();
                                                                                                uint64_t result = swift_isUniquelyReferenced_nonNull_native();
                                                                                                uint64_t *v111 = v104;
                                                                                                if ((result & 1) == 0) {
                                                                                                  sub_259DAD194();
                                                                                                }
                                                                                                if (v70 >= *(void *)(v104 + 16)) {
                                                                                                  goto LABEL_117;
                                                                                                }
                                                                                                *(void *)(v104 + 8 * v70 + 32) = v103;
                                                                                                swift_unknownObjectRelease();
                                                                                                sub_259DAF640();
                                                                                                swift_endAccess();
                                                                                                swift_unknownObjectRelease();
                                                                                              }
                                                                                              id v105 = objc_msgSend(v62, sel_newBufferWithLength_options_, 40, 544);
                                                                                              if (v105)
                                                                                              {
                                                                                                id v106 = v105;
                                                                                                swift_beginAccess();
                                                                                                uint64_t v107 = *v110;
                                                                                                swift_unknownObjectRetain();
                                                                                                uint64_t result = swift_isUniquelyReferenced_nonNull_native();
                                                                                                uint64_t *v110 = v107;
                                                                                                if ((result & 1) == 0) {
                                                                                                  sub_259DAD194();
                                                                                                }
                                                                                                if (v70 >= *(void *)(v107 + 16)) {
                                                                                                  goto LABEL_118;
                                                                                                }
                                                                                                *(void *)(v107 + 8 * v70 + 32) = v106;
                                                                                                swift_unknownObjectRelease();
                                                                                                sub_259DAF640();
                                                                                                swift_endAccess();
                                                                                                swift_unknownObjectRelease();
                                                                                              }
                                                                                              swift_unknownObjectRelease();
                                                                                            }
                                                                                            char v69 = 1;
                                                                                            id v62 = v118;
                                                                                            unint64_t v70 = 1;
                                                                                            if (v74)
                                                                                            {
                                                                                              swift_unknownObjectRelease();

                                                                                              swift_unknownObjectRelease();
                                                                                              uint64_t result = swift_unknownObjectRelease();
                                                                                              *(void *)(v3 + OBJC_IVAR___SwiftVideoProcessor_protectionStatus) = v108;
                                                                                              return result;
                                                                                            }
                                                                                          }
                                                                                        }
                                                                                        goto LABEL_162;
                                                                                      }
LABEL_161:
                                                                                      __break(1u);
LABEL_162:
                                                                                      __break(1u);
                                                                                      return result;
                                                                                    }
LABEL_160:
                                                                                    __break(1u);
                                                                                    goto LABEL_161;
                                                                                  }
LABEL_159:
                                                                                  __break(1u);
                                                                                  goto LABEL_160;
                                                                                }
LABEL_158:
                                                                                __break(1u);
                                                                                goto LABEL_159;
                                                                              }
LABEL_157:
                                                                              __break(1u);
                                                                              goto LABEL_158;
                                                                            }
LABEL_156:
                                                                            __break(1u);
                                                                            goto LABEL_157;
                                                                          }
LABEL_155:
                                                                          __break(1u);
                                                                          goto LABEL_156;
                                                                        }
LABEL_154:
                                                                        __break(1u);
                                                                        goto LABEL_155;
                                                                      }
LABEL_153:
                                                                      __break(1u);
                                                                      goto LABEL_154;
                                                                    }
LABEL_152:
                                                                    __break(1u);
                                                                    goto LABEL_153;
                                                                  }
LABEL_151:
                                                                  __break(1u);
                                                                  goto LABEL_152;
                                                                }
LABEL_150:
                                                                __break(1u);
                                                                goto LABEL_151;
                                                              }
LABEL_149:
                                                              __break(1u);
                                                              goto LABEL_150;
                                                            }
LABEL_148:
                                                            __break(1u);
                                                            goto LABEL_149;
                                                          }
LABEL_147:
                                                          __break(1u);
                                                          goto LABEL_148;
                                                        }
LABEL_146:
                                                        __break(1u);
                                                        goto LABEL_147;
                                                      }
LABEL_145:
                                                      __break(1u);
                                                      goto LABEL_146;
                                                    }
LABEL_144:
                                                    __break(1u);
                                                    goto LABEL_145;
                                                  }
LABEL_143:
                                                  __break(1u);
                                                  goto LABEL_144;
                                                }
LABEL_142:
                                                __break(1u);
                                                goto LABEL_143;
                                              }
LABEL_141:
                                              __break(1u);
                                              goto LABEL_142;
                                            }
LABEL_140:
                                            __break(1u);
                                            goto LABEL_141;
                                          }
LABEL_139:
                                          __break(1u);
                                          goto LABEL_140;
                                        }
LABEL_138:
                                        __break(1u);
                                        goto LABEL_139;
                                      }
LABEL_137:
                                      __break(1u);
                                      goto LABEL_138;
                                    }
LABEL_136:
                                    __break(1u);
                                    goto LABEL_137;
                                  }
LABEL_135:
                                  __break(1u);
                                  goto LABEL_136;
                                }
LABEL_134:
                                __break(1u);
                                goto LABEL_135;
                              }
LABEL_133:
                              __break(1u);
                              goto LABEL_134;
                            }
LABEL_132:
                            __break(1u);
                            goto LABEL_133;
                          }
LABEL_131:
                          __break(1u);
                          goto LABEL_132;
                        }
LABEL_130:
                        __break(1u);
                        goto LABEL_131;
                      }
LABEL_129:
                      __break(1u);
                      goto LABEL_130;
                    }
LABEL_128:
                    __break(1u);
                    goto LABEL_129;
                  }
LABEL_127:
                  __break(1u);
                  goto LABEL_128;
                }
LABEL_126:
                __break(1u);
                goto LABEL_127;
              }
LABEL_125:
              __break(1u);
              goto LABEL_126;
            }
LABEL_124:
            __break(1u);
            goto LABEL_125;
          }
LABEL_123:
          __break(1u);
          goto LABEL_124;
        }
LABEL_122:
        __break(1u);
        goto LABEL_123;
      }
    }
    __break(1u);
    goto LABEL_122;
  }
  return result;
}

uint64_t sub_259DA8D6C(uint64_t a1)
{
  uint64_t v201 = *MEMORY[0x263EF8340];
  float v2 = *(float *)(v1 + OBJC_IVAR___SwiftVideoProcessor_fps);
  float v3 = fminf(vabds_f32(24.0, v2), 1000.0);
  float v4 = vabds_f32(25.0, v2);
  uint64_t v5 = v4 <= v3;
  if (v4 <= v3) {
    float v3 = v4;
  }
  float v6 = vabds_f32(30.0, v2);
  if (v6 <= v3)
  {
    float v3 = v6;
    uint64_t v5 = 2;
  }
  float v7 = vabds_f32(50.0, v2);
  if (v7 <= v3)
  {
    float v3 = v7;
    uint64_t v5 = 3;
  }
  float v8 = vabds_f32(60.0, v2);
  if (v8 <= v3)
  {
    float v3 = v8;
    uint64_t v5 = 4;
  }
  float v9 = vabds_f32(90.0, v2);
  if (v9 <= v3)
  {
    float v3 = v9;
    uint64_t v5 = 5;
  }
  LODWORD(v182) = 1123024896;
  if (vabds_f32(120.0, v2) > v3) {
    uint64_t v10 = v5;
  }
  else {
    uint64_t v10 = 6;
  }
  long long v180 = xmmword_259DB0460;
  uint64_t v181 = 0x42B4000042700000;
  if (!PSELog)
  {
LABEL_182:
    __break(1u);
LABEL_183:
    __break(1u);
    goto LABEL_184;
  }
  int v12 = *((_DWORD *)&v180 + v10);
  id v13 = (id)PSELog;
  sub_259DAF660();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F2660);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_259DB0470;
  id v15 = objc_allocWithZone(NSNumber);
  LODWORD(v16) = v12;
  id v17 = objc_msgSend(v15, sel_initWithFloat_, v16);
  unint64_t v169 = sub_259DAD408();
  *(void *)(v14 + 56) = v169;
  unint64_t v168 = sub_259DAD448();
  *(void *)(v14 + 64) = v168;
  *(void *)(v14 + 32) = v17;
  uint64_t v18 = 2;
  sub_259DAF5E0();
  swift_bridgeObjectRelease();

  *(void *)(v1 + OBJC_IVAR___SwiftVideoProcessor_idxFrameRate) = v10;
  uint64_t v19 = (void *)sub_259DAF5F0();
  int v20 = MGGetSInt32Answer();

  int v21 = v20 - 1;
  if ((v20 - 1) > 5)
  {
    int v24 = 1151218688;
    uint64_t v23 = 3;
  }
  else
  {
    uint64_t v22 = 8 * v21;
    uint64_t v18 = *(void *)((char *)&unk_259DB0660 + v22);
    uint64_t v23 = *(void *)((char *)&unk_259DB0690 + v22);
    int v24 = dword_259DB06C0[v21];
  }
  *(void *)(v1 + OBJC_IVAR___SwiftVideoProcessor_idxEquivalentKernelIndex) = v18;
  *(void *)(v1 + OBJC_IVAR___SwiftVideoProcessor_idxEquivalentSize) = v23;
  *(_DWORD *)(v1 + OBJC_IVAR___SwiftVideoProcessor_area) = v24;
  uint64_t v25 = v1 + OBJC_IVAR___SwiftVideoProcessor_bufferConstants;
  swift_beginAccess();
  *(unsigned char *)(v25 + 48) = 0;
  *(unsigned char *)(v25 + 8) = 0;
  uint64_t v26 = OBJC_IVAR___SwiftVideoProcessor_fps;
  float v175 = *(float *)(v1 + OBJC_IVAR___SwiftVideoProcessor_fps);
  float v27 = *(float *)(v1 + OBJC_IVAR___SwiftVideoProcessor_energyPoolGammaShape);
  float v28 = *(float *)(v1 + OBJC_IVAR___SwiftVideoProcessor_energyPoolGammaScale);
  uint64_t v29 = sub_259DAF650();
  *(void *)(v29 + 16) = 256;
  bzero((void *)(v29 + 32), 0x400uLL);
  float v30 = v27 + -1.0;
  if ((~COERCE_INT(v27 + -1.0) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_170;
  }
  if (v30 <= -9.2234e18)
  {
LABEL_170:
    __break(1u);
    goto LABEL_171;
  }
  if (v30 >= 9.2234e18)
  {
LABEL_171:
    __break(1u);
    goto LABEL_172;
  }
  unint64_t v31 = (uint64_t)v30;
  if ((uint64_t)v30 < 0)
  {
LABEL_172:
    __break(1u);
LABEL_173:
    __break(1u);
LABEL_174:
    __break(1u);
    goto LABEL_175;
  }
  if (v31 > 7) {
    goto LABEL_173;
  }
  unint64_t v32 = 0;
  float v33 = flt_2707AF5B8[v31 + 8];
  float v34 = -v27;
  float v35 = 0.0;
  float v36 = 0.0;
  uint64_t v174 = v1;
  uint64_t v162 = a1;
  uint64_t v164 = v29 + 32;
  uint64_t v165 = v29;
  uint64_t v166 = v26;
  do
  {
    if ((float)(v35 / v175) > 0.99 && v36 >= 2.0) {
      break;
    }
    float v36 = (float)(1.0 / v175) + v36;
    float v38 = expf((float)-v36 / v28);
    float v39 = v38 * powf(v28, v34);
    float v40 = (float)(v39 * powf(v36, v30)) / v33;
    float v35 = v35 + v40;
    *(float *)(v29 + 4 * v32++ + 32) = v40;
  }
  while (v32 != 256);
  uint64_t v41 = sub_259DAF650();
  *(void *)(v41 + 16) = 640;
  uint64_t v42 = v41 + 32;
  bzero((void *)(v41 + 32), 0xA00uLL);
  uint64_t v43 = sub_259DAF650();
  *(void *)(v43 + 16) = 5;
  *(_OWORD *)(v43 + 32) = 0u;
  uint64_t v44 = v43 + 32;
  *(_OWORD *)(v43 + 48) = 0u;
  *(void *)(v43 + 64) = 0;
  type metadata accessor for UMFKernels();
  unint64_t v45 = 0;
  v176 = *(uint64_t (**)(void))(*(void *)sub_259DAE1F0() + 120);
  uint64_t v171 = OBJC_IVAR___SwiftVideoProcessor_idxFrameRate;
  uint64_t v173 = OBJC_IVAR___SwiftVideoProcessor_idxEquivalentKernelIndex;
  while (1)
  {
    if (v45 >= *(void *)(v43 + 16))
    {
      __break(1u);
LABEL_131:
      __break(1u);
LABEL_132:
      __break(1u);
LABEL_133:
      __break(1u);
LABEL_134:
      __break(1u);
LABEL_135:
      __break(1u);
      goto LABEL_136;
    }
    *(void *)(v44 + 8 * v45) = 0;
    unint64_t v46 = *(void *)(v1 + v173);
    unint64_t v47 = *(void *)(v1 + v171);
    uint64_t v48 = v176();
    if ((v46 & 0x8000000000000000) != 0) {
      goto LABEL_131;
    }
    if (v46 >= *(void *)(v48 + 16)) {
      goto LABEL_132;
    }
    uint64_t v49 = *(void *)(v48 + 8 * v46 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if (v45 >= *(void *)(v49 + 16)) {
      goto LABEL_133;
    }
    uint64_t v50 = *(void *)(v49 + 8 * v45 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if ((v47 & 0x8000000000000000) != 0) {
      goto LABEL_134;
    }
    if (v47 >= *(void *)(v50 + 16)) {
      goto LABEL_135;
    }
    uint64_t v51 = *(void *)(v50 + 8 * v47 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v52 = *(void *)(v51 + 16);
    if (v52) {
      break;
    }
LABEL_31:
    ++v45;
    swift_bridgeObjectRelease();
    if (v45 == 5)
    {
      swift_release();
      long long v180 = xmmword_259DB0480;
      if (!PSELog)
      {
LABEL_190:
        __break(1u);
LABEL_191:
        __break(1u);
      }
      float v59 = *((float *)&v180 + *(void *)(v1 + OBJC_IVAR___SwiftVideoProcessor_idxEquivalentSize));
      id v177 = (id)PSELog;
      sub_259DAF660();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F2660);
      uint64_t v60 = swift_allocObject();
      *(_OWORD *)(v60 + 16) = xmmword_259DB0450;
      id v61 = objc_allocWithZone(NSNumber);
      *(float *)&double v62 = v59;
      id v63 = objc_msgSend(v61, sel_initWithFloat_, v62);
      *(void *)(v60 + 56) = v169;
      *(void *)(v60 + 64) = v168;
      *(void *)(v60 + 32) = v63;
      int v64 = *(_DWORD *)(v1 + v166);
      id v65 = objc_allocWithZone(NSNumber);
      LODWORD(v66) = v64;
      id v67 = objc_msgSend(v65, sel_initWithFloat_, v66);
      *(void *)(v60 + 96) = v169;
      *(void *)(v60 + 104) = v168;
      *(void *)(v60 + 72) = v67;
      sub_259DAF5E0();

      swift_bridgeObjectRelease();
      if (!HIDWORD(v32))
      {
        *(float *)&unsigned int v68 = *(float *)(v1 + OBJC_IVAR___SwiftVideoProcessor_nits)
                       * *(float *)(v1 + OBJC_IVAR___SwiftVideoProcessor_avl);
        float v69 = *(float *)(v1 + v166);
        float v70 = 1.0 - expf(-1.0 / (float)(*(float *)(v1 + OBJC_IVAR___SwiftVideoProcessor_tauAdapt) * v69));
        float v71 = 1.0 - expf(-1.0 / (float)(v69 * *(float *)(v1 + OBJC_IVAR___SwiftVideoProcessor_tauMitigation)));
        float v72 = powf(sqrtf(*(float *)(v1 + OBJC_IVAR___SwiftVideoProcessor_area) * 1.6) / v59, *(float *)(v1 + OBJC_IVAR___SwiftVideoProcessor_cA)+ *(float *)(v1 + OBJC_IVAR___SwiftVideoProcessor_cA));
        float v73 = *(float *)(v1 + OBJC_IVAR___SwiftVideoProcessor_gain);
        float v74 = powf(v69, 1.0 / *(float *)(v1 + OBJC_IVAR___SwiftVideoProcessor_energyPoolExponent));
        LODWORD(v180) = 0;
        *(void *)((char *)&v180 + 4) = __PAIR64__(v68, v32);
        *((float *)&v180 + 3) = v70;
        *(float *)&uint64_t v181 = v71;
        *((float *)&v181 + 1) = v72 * (float)(v73 / v74);
        long long v182 = 0u;
        long long v183 = 0u;
        int v184 = 1065353216;
        long long v185 = 0u;
        memset(v186, 0, sizeof(v186));
        long long v187 = 0u;
        int v188 = 0;
        if (!PSELog) {
          goto LABEL_191;
        }
        id v75 = (id)PSELog;
        sub_259DAF660();
        uint64_t v76 = swift_allocObject();
        *(_OWORD *)(v76 + 16) = xmmword_259DB0470;
        id v77 = objc_allocWithZone(NSNumber);
        *(float *)&double v78 = v70;
        id v79 = objc_msgSend(v77, sel_initWithFloat_, v78);
        *(void *)(v76 + 56) = v169;
        *(void *)(v76 + 64) = v168;
        *(void *)(v76 + 32) = v79;
        sub_259DAF5E0();

        swift_bridgeObjectRelease();
        if (*(void *)(v43 + 16))
        {
          uint64_t v80 = 0;
          unint64_t v81 = 0;
          unint64_t v82 = 0;
          uint64_t v83 = (float32x4_t *)(v41 + 48);
          uint64_t v84 = v41 + 32;
          while (1)
          {
            unint64_t v85 = *(void *)(v44 + 8 * v82);
            if (HIDWORD(v85)) {
              break;
            }
            *((_DWORD *)v186 + v82 + 2) = v85;
            uint64_t v86 = *(void *)(v44 + 8 * v82);
            if (v86 < 0) {
              goto LABEL_165;
            }
            if (v86)
            {
              uint64_t v87 = 32 * v82;
              unint64_t v88 = *(void *)(v41 + 16);
              if (v88 > 32 * v82) {
                uint64_t v87 = *(void *)(v41 + 16);
              }
              unint64_t v89 = v87 - 32 * v82;
              unint64_t v90 = v86 - 1;
              if (v89 >= v86 - 1) {
                unint64_t v89 = v86 - 1;
              }
              unint64_t v91 = v89 + 1;
              if (v91 >= 9)
              {
                uint64_t v94 = v91 & 7;
                if ((v91 & 7) == 0) {
                  uint64_t v94 = 8;
                }
                unint64_t v92 = v91 - v94;
                if (v88 <= v81) {
                  unint64_t v95 = v81;
                }
                else {
                  unint64_t v95 = *(void *)(v41 + 16);
                }
                unint64_t v96 = v95 + v80;
                if (v96 < v90) {
                  unint64_t v90 = v96;
                }
                uint64_t v97 = v90 - v94 + 1;
                float v93 = 0.0;
                uint64_t v98 = v83;
                do
                {
                  float32x4_t v99 = vmulq_f32(v98[-1], v98[-1]);
                  float32x4_t v100 = vmulq_f32(*v98, *v98);
                  float v93 = (float)((float)((float)((float)((float)((float)((float)(v93 + v99.f32[0]) + v99.f32[1])
                                                              + v99.f32[2])
                                                      + v99.f32[3])
                                              + v100.f32[0])
                                      + v100.f32[1])
                              + v100.f32[2])
                      + v100.f32[3];
                  v98 += 2;
                  v97 -= 8;
                }
                while (v97);
              }
              else
              {
                unint64_t v92 = 0;
                float v93 = 0.0;
              }
              while (v81 + v92 < v88)
              {
                float v93 = v93 + (float)(*(float *)(v84 + 4 * v92) * *(float *)(v84 + 4 * v92));
                if (v86 == ++v92) {
                  goto LABEL_71;
                }
              }
              goto LABEL_93;
            }
            float v93 = 0.0;
LABEL_71:
            uint64_t v101 = 4 * v82;
            *(float *)((char *)&v186[1] + v101 + 12) = v93;
            *(_OWORD *)v200 = xmmword_259DB0490;
            *(_OWORD *)&v200[16] = xmmword_259DB04A0;
            *(_DWORD *)v191 = 1068708659;
            *(_OWORD *)&v191[4] = *(_OWORD *)&v200[4];
            long long v192 = xmmword_259DB0490;
            long long v193 = xmmword_259DB04B0;
            long long v194 = xmmword_259DB04C0;
            long long v195 = xmmword_259DB04D0;
            long long v196 = xmmword_259DB04E0;
            long long v197 = xmmword_259DB04F0;
            long long v198 = xmmword_259DB0500;
            uint64_t v199 = 0x4000000040000000;
            *(_DWORD *)((char *)&v187 + v101) = *(_DWORD *)&v191[4 * v82];
            if (v82 == 4) {
              goto LABEL_74;
            }
            ++v82;
            v81 += 32;
            v80 -= 32;
            v83 += 8;
            v84 += 128;
            if (v82 >= *(void *)(v43 + 16)) {
              goto LABEL_73;
            }
          }
          __break(1u);
LABEL_165:
          __break(1u);
          goto LABEL_168;
        }
LABEL_73:
        __break(1u);
LABEL_74:
        id v102 = (void *)PSELog;
        if (PSELog)
        {
          double v178 = *(double *)((char *)&v186[1] + 12);
          uint64_t v103 = 4;
          while (1)
          {
            id v104 = v102;
            sub_259DAF660();
            uint64_t v105 = swift_allocObject();
            *(_OWORD *)(v105 + 16) = xmmword_259DB0470;
            id v106 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithFloat_, v178);
            *(void *)(v105 + 56) = v169;
            *(void *)(v105 + 64) = v168;
            *(void *)(v105 + 32) = v106;
            sub_259DAF5E0();

            swift_bridgeObjectRelease();
            if (v103 == 20) {
              break;
            }
            *(_OWORD *)v191 = *(_OWORD *)((char *)&v186[1] + 12);
            *(_DWORD *)&v191[16] = HIDWORD(v186[2]);
            LODWORD(v107) = *(_DWORD *)&v191[v103];
            double v178 = v107;
            id v102 = (void *)PSELog;
            v103 += 4;
            if (!PSELog) {
              goto LABEL_78;
            }
          }
        }
        else
        {
LABEL_78:
          __break(1u);
        }
        uint64_t v108 = v174;
        v109 = *(void **)(v174 + OBJC_IVAR___SwiftVideoProcessor_device);
        if (!v109) {
          goto LABEL_95;
        }
        id v110 = objc_msgSend((id)swift_unknownObjectRetain(), sel_newBufferWithBytes_length_options_, v42, 640, 0);
        if (!v110) {
          goto LABEL_94;
        }
        v111 = v110;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F2998);
        uint64_t v112 = swift_allocObject();
        *(_OWORD *)(v112 + 16) = xmmword_259DB0470;
        id v113 = objc_msgSend((id)swift_unknownObjectRetain(), sel_contents);
        id v114 = v111;
        *(void *)(v112 + 56) = MEMORY[0x263F8DA28];
        *(void *)(v112 + 32) = v113;
        sub_259DAF760();
        swift_bridgeObjectRelease();
        *(void *)v191 = v41;
        uint64_t v115 = swift_allocObject();
        *(_OWORD *)(v115 + 16) = xmmword_259DB0470;
        *(void *)(v115 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F29A0);
        *(void *)(v115 + 32) = v191;
        swift_bridgeObjectRetain();
        sub_259DAF760();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        id v116 = objc_msgSend(v109, sel_newBufferWithBytes_length_options_, v164, 4 * v32, 0);
        if (!v116)
        {
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          return swift_bridgeObjectRelease();
        }
        id v117 = v116;
        uint64_t v179 = 4 * v32;
        v118 = (unsigned char *)(v174 + OBJC_IVAR___SwiftVideoProcessor_inTestingMode);
        uint64_t result = swift_beginAccess();
        v170 = v118;
        if (*v118 == 1)
        {
          id v172 = v114;
          if (!PSELog)
          {
            __break(1u);
            return result;
          }
          id v120 = (id)PSELog;
          sub_259DAF670();
          uint64_t v121 = swift_allocObject();
          *(_OWORD *)(v121 + 16) = xmmword_259DB0470;
          id v122 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInt_, DWORD1(v180));
          *(void *)(v121 + 56) = v169;
          *(void *)(v121 + 64) = v168;
          *(void *)(v121 + 32) = v122;
          sub_259DAF5E0();

          swift_bridgeObjectRelease();
          if (v32)
          {
            v123 = v109;
            for (unint64_t i = 0; i != v32; ++i)
            {
              if (!PSELog) {
                goto LABEL_183;
              }
              id v125 = (id)PSELog;
              sub_259DAF670();
              uint64_t v126 = swift_allocObject();
              *(_OWORD *)(v126 + 16) = xmmword_259DB0470;
              if (i >= *(void *)(v165 + 16)) {
                goto LABEL_174;
              }
              v127 = (void *)v126;
              int v128 = *(_DWORD *)(v165 + 4 * i + 32);
              id v129 = objc_allocWithZone(NSNumber);
              LODWORD(v130) = v128;
              id v131 = objc_msgSend(v129, sel_initWithFloat_, v130);
              v127[7] = v169;
              v127[8] = v168;
              v127[4] = v131;
              sub_259DAF5E0();

              swift_bridgeObjectRelease();
            }
            swift_bridgeObjectRelease();
            uint64_t v108 = v174;
            v109 = v123;
            id v114 = v172;
          }
          else
          {
            swift_bridgeObjectRelease();
            uint64_t v108 = v174;
            id v114 = v172;
          }
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        v132 = *(void **)(v108 + OBJC_IVAR___SwiftVideoProcessor_commandQueue);
        if (!v132)
        {
LABEL_138:
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          return swift_unknownObjectRelease();
        }
        swift_unknownObjectRetain();
        id v133 = objc_msgSend(v109, sel_newBufferWithBytes_length_options_, &v180, 144, 0);
        if (!v133)
        {
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          return swift_unknownObjectRelease();
        }
        id v134 = v133;
        if (!objc_msgSend(v132, sel_commandBuffer))
        {
LABEL_137:
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          goto LABEL_138;
        }
        v190 = &unk_2707CD8A0;
        v135 = (void *)swift_dynamicCastObjCProtocolConditional();
        if (v135)
        {
          v136 = v135;
          id v137 = objc_msgSend(v135, sel_blitCommandEncoder);
          if (!v137) {
            goto LABEL_126;
          }
          v138 = v137;
          id v167 = v117;
          id v139 = v114;
          uint64_t v140 = v174 + OBJC_IVAR___SwiftVideoProcessor_bufferCurState;
          swift_beginAccess();
          if (*(void *)(*(void *)v140 + 16))
          {
            uint64_t v141 = *(void *)(*(void *)v140 + 32);
            if (v141) {
              objc_msgSend(v138, sel_copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_, v134, 0, v141, 0, 144);
            }
            uint64_t v142 = v174 + OBJC_IVAR___SwiftVideoProcessor_bufferGammaKernel;
            swift_beginAccess();
            if (*(void *)(*(void *)v142 + 16))
            {
              uint64_t v143 = *(void *)(*(void *)v142 + 32);
              if (v143) {
                objc_msgSend(v138, sel_copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_, v167, 0, v143, 0, v179);
              }
              uint64_t v144 = v174 + OBJC_IVAR___SwiftVideoProcessor_bufferContrastKernel;
              swift_beginAccess();
              if (*(void *)(*(void *)v144 + 16))
              {
                uint64_t v145 = *(void *)(*(void *)v144 + 32);
                if (v145) {
                  objc_msgSend(v138, sel_copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_, v139, 0, v145, 0, 640);
                }
                uint64_t v146 = v174 + OBJC_IVAR___SwiftVideoProcessor_bufferContrast;
                swift_beginAccess();
                if (*(void *)(*(void *)v146 + 16))
                {
                  if (*(void *)(*(void *)v146 + 32))
                  {
                    swift_getObjectType();
                    swift_unknownObjectRetain();
                    sub_259DAF6A0();
                    swift_unknownObjectRelease();
                  }
                  uint64_t v147 = v174 + OBJC_IVAR___SwiftVideoProcessor_bufferEnergy;
                  swift_beginAccess();
                  if (*(void *)(*(void *)v147 + 16))
                  {
                    if (*(void *)(*(void *)v147 + 32))
                    {
                      swift_getObjectType();
                      swift_unknownObjectRetain();
                      sub_259DAF6A0();
                      swift_unknownObjectRelease();
                    }
                    uint64_t v148 = v174 + OBJC_IVAR___SwiftVideoProcessor_bufferEnergy2;
                    swift_beginAccess();
                    if (*(void *)(*(void *)v148 + 16))
                    {
                      if (*(void *)(*(void *)v148 + 32))
                      {
                        swift_getObjectType();
                        swift_unknownObjectRetain();
                        sub_259DAF6A0();
                        swift_unknownObjectRelease();
                      }
                      if (*(void *)(v174 + OBJC_IVAR___SwiftVideoProcessor_bufferDataDebug))
                      {
                        swift_getObjectType();
                        swift_unknownObjectRetain();
                        sub_259DAF6A0();
                        swift_unknownObjectRelease();
                      }
                      objc_msgSend(v138, sel_endEncoding, v162);
                      swift_unknownObjectRelease();
                      id v114 = v139;
                      id v117 = v167;
LABEL_126:
                      objc_msgSend(v136, sel_commit, v162);
                      if (*v170 == 1)
                      {
                        swift_unknownObjectRelease();
                        swift_unknownObjectRelease();
                        swift_unknownObjectRelease();
                        swift_unknownObjectRelease();
                        swift_unknownObjectRelease();
                        return swift_unknownObjectRelease();
                      }
                      if (!objc_msgSend(v132, sel_commandBuffer)) {
                        goto LABEL_168;
                      }
                      v189 = &unk_2707CD8A0;
                      v149 = (void *)swift_dynamicCastObjCProtocolConditional();
                      if (!v149)
                      {
                        swift_unknownObjectRelease();
LABEL_168:
                        swift_unknownObjectRelease();
                        swift_unknownObjectRelease();
                        swift_unknownObjectRelease();
                        goto LABEL_138;
                      }
                      v150 = v149;
                      if (objc_msgSend(v149, sel_respondsToSelector_, sel_setProtectionOptions_)) {
                        objc_msgSend(v150, sel_setProtectionOptions_, v163);
                      }
                      id v151 = objc_msgSend(v150, sel_blitCommandEncoder);
                      if (!v151)
                      {
LABEL_163:
                        objc_msgSend(v150, sel_commit);
                        swift_unknownObjectRelease();
                        swift_unknownObjectRelease();
                        swift_unknownObjectRelease();
                        swift_unknownObjectRelease();
                        swift_unknownObjectRelease();
                        swift_unknownObjectRelease();
                        return swift_unknownObjectRelease();
                      }
                      v152 = v151;
                      uint64_t v153 = v174 + OBJC_IVAR___SwiftVideoProcessor_bufferCurState;
                      swift_beginAccess();
                      if (*(void *)(*(void *)v153 + 16) >= 2uLL)
                      {
                        uint64_t v154 = *(void *)(*(void *)v153 + 40);
                        if (v154) {
                          objc_msgSend(v152, sel_copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_, v134, 0, v154, 0, 144);
                        }
                        uint64_t v155 = v174 + OBJC_IVAR___SwiftVideoProcessor_bufferGammaKernel;
                        swift_beginAccess();
                        if (*(void *)(*(void *)v155 + 16) >= 2uLL)
                        {
                          uint64_t v156 = *(void *)(*(void *)v155 + 40);
                          if (v156) {
                            objc_msgSend(v152, sel_copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_, v117, 0, v156, 0, v179);
                          }
                          uint64_t v157 = v174 + OBJC_IVAR___SwiftVideoProcessor_bufferContrastKernel;
                          swift_beginAccess();
                          if (*(void *)(*(void *)v157 + 16) >= 2uLL)
                          {
                            uint64_t v158 = *(void *)(*(void *)v157 + 40);
                            if (v158) {
                              objc_msgSend(v152, sel_copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_, v114, 0, v158, 0, 640);
                            }
                            uint64_t v159 = v174 + OBJC_IVAR___SwiftVideoProcessor_bufferContrast;
                            swift_beginAccess();
                            if (*(void *)(*(void *)v159 + 16) >= 2uLL)
                            {
                              if (*(void *)(*(void *)v159 + 40))
                              {
                                swift_getObjectType();
                                swift_unknownObjectRetain();
                                sub_259DAF6A0();
                                swift_unknownObjectRelease();
                              }
                              uint64_t v160 = v174 + OBJC_IVAR___SwiftVideoProcessor_bufferEnergy;
                              swift_beginAccess();
                              if (*(void *)(*(void *)v160 + 16) >= 2uLL)
                              {
                                if (*(void *)(*(void *)v160 + 40))
                                {
                                  swift_getObjectType();
                                  swift_unknownObjectRetain();
                                  sub_259DAF6A0();
                                  swift_unknownObjectRelease();
                                }
                                uint64_t v161 = v174 + OBJC_IVAR___SwiftVideoProcessor_bufferEnergy2;
                                swift_beginAccess();
                                if (*(void *)(*(void *)v161 + 16) >= 2uLL)
                                {
                                  if (*(void *)(*(void *)v161 + 40))
                                  {
                                    swift_getObjectType();
                                    swift_unknownObjectRetain();
                                    sub_259DAF6A0();
                                    swift_unknownObjectRelease();
                                  }
                                  objc_msgSend(v152, sel_endEncoding);
                                  swift_unknownObjectRelease();
                                  goto LABEL_163;
                                }
                                goto LABEL_189;
                              }
LABEL_188:
                              __break(1u);
LABEL_189:
                              __break(1u);
                              goto LABEL_190;
                            }
LABEL_187:
                            __break(1u);
                            goto LABEL_188;
                          }
LABEL_186:
                          __break(1u);
                          goto LABEL_187;
                        }
LABEL_185:
                        __break(1u);
                        goto LABEL_186;
                      }
LABEL_184:
                      __break(1u);
                      goto LABEL_185;
                    }
                    goto LABEL_181;
                  }
LABEL_180:
                  __break(1u);
LABEL_181:
                  __break(1u);
                  goto LABEL_182;
                }
LABEL_179:
                __break(1u);
                goto LABEL_180;
              }
LABEL_178:
              __break(1u);
              goto LABEL_179;
            }
LABEL_177:
            __break(1u);
            goto LABEL_178;
          }
LABEL_176:
          __break(1u);
          goto LABEL_177;
        }
LABEL_136:
        swift_unknownObjectRelease();
        goto LABEL_137;
      }
LABEL_175:
      __break(1u);
      goto LABEL_176;
    }
  }
  unint64_t v53 = 32 * v45;
  uint64_t v54 = (double *)(v51 + 32);
  while (v53 < *(void *)(v41 + 16))
  {
    float v55 = *v54;
    *(float *)(v42 + 4 * v53) = v55;
    if (v45 >= *(void *)(v43 + 16)) {
      goto LABEL_91;
    }
    uint64_t v56 = *(void *)(v44 + 8 * v45);
    BOOL v57 = __CFADD__(v56, 1);
    uint64_t v58 = v56 + 1;
    if (v57) {
      goto LABEL_92;
    }
    *(void *)(v44 + 8 * v45) = v58;
    ++v53;
    ++v54;
    if (!--v52) {
      goto LABEL_31;
    }
  }
  __break(1u);
LABEL_91:
  __break(1u);
LABEL_92:
  __break(1u);
LABEL_93:
  __break(1u);
LABEL_94:
  swift_unknownObjectRelease();
LABEL_95:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall VideoProcessor.processSurface(sourceSurface:timestamp:destinationSurface:options:)(IOSurfaceRef sourceSurface, Swift::Double timestamp, IOSurfaceRef destinationSurface, NSDictionary options)
{
  float v6 = sourceSurface;
  unint64_t v7 = 0x26A3F2000uLL;
  if (*(unsigned char *)(v4 + OBJC_IVAR___SwiftVideoProcessor_needsInitialization) == 1)
  {
    swift_getObjectType();
    if (!PSELog)
    {
LABEL_295:
      __break(1u);
      goto LABEL_296;
    }
    id v8 = (id)PSELog;
    sub_259DAF690();
    sub_259DAF5E0();

    type metadata accessor for UMFKernels();
    uint64_t v9 = sub_259DAE1F0();
    (*(void (**)(uint64_t))(*(void *)v9 + 152))(v9);
    swift_release();
    id v10 = MTLCreateSystemDefaultDevice();
    uint64_t v11 = OBJC_IVAR___SwiftVideoProcessor_device;
    *(void *)(v283 + OBJC_IVAR___SwiftVideoProcessor_device) = v10;
    swift_unknownObjectRelease();
    int v12 = *(void **)(v283 + v11);
    if (v12)
    {
      *(void *)(v283 + OBJC_IVAR___SwiftVideoProcessor_commandQueue) = objc_msgSend((id)swift_unknownObjectRetain(), sel_newCommandQueue);
      swift_unknownObjectRelease();
      id v13 = self;
      id v14 = objc_msgSend(v13, sel_sharedCaptureManager);
      id v15 = objc_msgSend(v14, sel_newCaptureScopeWithDevice_, v12);

      id v16 = objc_msgSend(v13, sel_sharedCaptureManager);
      objc_msgSend(v16, sel_setDefaultCaptureScope_, v15);

      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      id v18 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
      *(void *)aBlock = 0;
      id v19 = objc_msgSend(v12, sel_newDefaultLibraryWithBundle_error_, v18, aBlock);

      int v20 = *(void **)aBlock;
      if (v19)
      {
        *(void *)(v283 + OBJC_IVAR___SwiftVideoProcessor_library) = v19;
        id v21 = v20;
        swift_unknownObjectRelease();
      }
      else
      {
        id v22 = *(id *)aBlock;
        uint64_t v23 = (void *)sub_259DAF5D0();

        swift_willThrow();
        if (!PSELog)
        {
LABEL_297:
          __break(1u);
          goto LABEL_298;
        }
        id v24 = (id)PSELog;
        sub_259DAF680();
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F2660);
        uint64_t v25 = swift_allocObject();
        *(_OWORD *)(v25 + 16) = xmmword_259DB0470;
        swift_getErrorValue();
        uint64_t v26 = sub_259DAF750();
        uint64_t v28 = v27;
        *(void *)(v25 + 56) = MEMORY[0x263F8D310];
        *(void *)(v25 + 64) = sub_259DAE054();
        *(void *)(v25 + 32) = v26;
        *(void *)(v25 + 40) = v28;
        sub_259DAF5E0();
        swift_bridgeObjectRelease();

        float v6 = sourceSurface;
        unint64_t v7 = 0x26A3F2000uLL;
      }
      sub_259DA80A0(0);
      id v29 = objc_msgSend(v12, sel_newBufferWithLength_options_, 56, 0);
      *(void *)(v283 + OBJC_IVAR___SwiftVideoProcessor_bufferDataDebug) = v29;
      swift_unknownObjectRelease();
      sub_259DA8D6C(0);
      uint64_t v30 = OBJC_IVAR___SwiftVideoProcessor_library;
      unint64_t v31 = *(void **)(v283 + OBJC_IVAR___SwiftVideoProcessor_library);
      if (!v31) {
        goto LABEL_30;
      }
      swift_unknownObjectRetain();
      unint64_t v32 = (void *)sub_259DAF5F0();
      id v33 = objc_msgSend(v31, sel_newFunctionWithName_, v32);

      swift_unknownObjectRelease();
      if (v33)
      {
        *(void *)&long long v284 = 0;
        id v34 = objc_msgSend(v12, sel_newComputePipelineStateWithFunction_error_, v33, &v284);
        id v35 = (id)v284;
        if (v34)
        {
          swift_unknownObjectRelease();
          *(void *)(v283 + OBJC_IVAR___SwiftVideoProcessor_cptPSO_RiskComputePass0) = v34;
          swift_unknownObjectRelease();
        }
        else
        {
          float v36 = v35;
          uint64_t v37 = (void *)sub_259DAF5D0();

          swift_willThrow();
          if (!PSELog)
          {
LABEL_298:
            __break(1u);
            goto LABEL_299;
          }
          id v38 = (id)PSELog;
          sub_259DAF680();
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F2660);
          uint64_t v39 = swift_allocObject();
          *(_OWORD *)(v39 + 16) = xmmword_259DB0470;
          swift_getErrorValue();
          uint64_t v40 = sub_259DAF750();
          uint64_t v42 = v41;
          *(void *)(v39 + 56) = MEMORY[0x263F8D310];
          *(void *)(v39 + 64) = sub_259DAE054();
          *(void *)(v39 + 32) = v40;
          *(void *)(v39 + 40) = v42;
          sub_259DAF5E0();
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();

          float v6 = sourceSurface;
          unint64_t v7 = 0x26A3F2000;
        }
      }
      uint64_t v43 = *(void **)(v283 + v30);
      if (!v43) {
        goto LABEL_30;
      }
      swift_unknownObjectRetain();
      uint64_t v44 = (void *)sub_259DAF5F0();
      id v45 = objc_msgSend(v43, sel_newFunctionWithName_, v44);

      swift_unknownObjectRelease();
      if (v45)
      {
        *(void *)&long long v284 = 0;
        id v46 = objc_msgSend(v12, sel_newComputePipelineStateWithFunction_error_, v45, &v284);
        id v47 = (id)v284;
        if (v46)
        {
          swift_unknownObjectRelease();
          *(void *)(v283 + OBJC_IVAR___SwiftVideoProcessor_cptPSO_RiskComputePass1) = v46;
          swift_unknownObjectRelease();
        }
        else
        {
          uint64_t v48 = v47;
          uint64_t v49 = (void *)sub_259DAF5D0();

          swift_willThrow();
          if (!PSELog)
          {
LABEL_299:
            __break(1u);
            goto LABEL_300;
          }
          id v50 = (id)PSELog;
          sub_259DAF680();
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F2660);
          uint64_t v51 = swift_allocObject();
          *(_OWORD *)(v51 + 16) = xmmword_259DB0470;
          swift_getErrorValue();
          uint64_t v52 = sub_259DAF750();
          uint64_t v54 = v53;
          *(void *)(v51 + 56) = MEMORY[0x263F8D310];
          *(void *)(v51 + 64) = sub_259DAE054();
          *(void *)(v51 + 32) = v52;
          *(void *)(v51 + 40) = v54;
          sub_259DAF5E0();
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();

          float v6 = sourceSurface;
          unint64_t v7 = 0x26A3F2000;
        }
      }
      float v55 = *(void **)(v283 + v30);
      if (!v55) {
        goto LABEL_30;
      }
      swift_unknownObjectRetain();
      uint64_t v56 = (void *)sub_259DAF5F0();
      id v57 = objc_msgSend(v55, sel_newFunctionWithName_, v56);

      swift_unknownObjectRelease();
      if (v57)
      {
        *(void *)&long long v284 = 0;
        id v58 = objc_msgSend(v12, sel_newComputePipelineStateWithFunction_error_, v57, &v284);
        id v59 = (id)v284;
        if (v58)
        {
          swift_unknownObjectRelease();
          *(void *)(v283 + OBJC_IVAR___SwiftVideoProcessor_cptPSO_RiskComputePass2) = v58;
          swift_unknownObjectRelease();
        }
        else
        {
          uint64_t v60 = v59;
          id v61 = (void *)sub_259DAF5D0();

          swift_willThrow();
          if (!PSELog)
          {
LABEL_300:
            __break(1u);
            goto LABEL_301;
          }
          id v62 = (id)PSELog;
          sub_259DAF680();
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F2660);
          uint64_t v63 = swift_allocObject();
          *(_OWORD *)(v63 + 16) = xmmword_259DB0470;
          swift_getErrorValue();
          uint64_t v64 = sub_259DAF750();
          uint64_t v66 = v65;
          *(void *)(v63 + 56) = MEMORY[0x263F8D310];
          *(void *)(v63 + 64) = sub_259DAE054();
          *(void *)(v63 + 32) = v64;
          *(void *)(v63 + 40) = v66;
          sub_259DAF5E0();
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();

          float v6 = sourceSurface;
          unint64_t v7 = 0x26A3F2000;
        }
      }
      id v67 = *(void **)(v283 + v30);
      if (v67
        && (swift_unknownObjectRetain(),
            unsigned int v68 = (void *)sub_259DAF5F0(),
            id v69 = objc_msgSend(v67, sel_newFunctionWithName_, v68),
            v68,
            swift_unknownObjectRelease(),
            v69))
      {
        *(void *)&long long v284 = 0;
        id v70 = objc_msgSend(v12, sel_newComputePipelineStateWithFunction_error_, v69, &v284);
        id v71 = (id)v284;
        if (!v70)
        {
          v262 = v71;
          v263 = (void *)sub_259DAF5D0();

          swift_willThrow();
          if (!PSELog)
          {
LABEL_301:
            __break(1u);
            return;
          }
          id v264 = (id)PSELog;
          sub_259DAF680();
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F2660);
          uint64_t v265 = swift_allocObject();
          *(_OWORD *)(v265 + 16) = xmmword_259DB0470;
          swift_getErrorValue();
          uint64_t v266 = sub_259DAF750();
          uint64_t v268 = v267;
          *(void *)(v265 + 56) = MEMORY[0x263F8D310];
          *(void *)(v265 + 64) = sub_259DAE054();
          *(void *)(v265 + 32) = v266;
          *(void *)(v265 + 40) = v268;
          sub_259DAF5E0();
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();

          float v6 = sourceSurface;
          unint64_t v7 = 0x26A3F2000;
          goto LABEL_32;
        }
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        *(void *)(v283 + OBJC_IVAR___SwiftVideoProcessor_cptPSO_RiskComputePass3) = v70;
      }
      else
      {
LABEL_30:
        swift_unknownObjectRelease();
      }
      swift_unknownObjectRelease();
LABEL_32:
      *(unsigned char *)(v283 + *(void *)(v7 + 1288)) = 0;
    }
  }
  uint64_t v72 = OBJC_IVAR___SwiftVideoProcessor_previousSurfaceTime;
  double v73 = timestamp - *(double *)(v283 + OBJC_IVAR___SwiftVideoProcessor_previousSurfaceTime);
  if (v73 <= 0.00833333333) {
    double v73 = 0.00833333333;
  }
  if (v73 <= 0.0416666667) {
    double v74 = v73;
  }
  else {
    double v74 = 0.0416666667;
  }
  uint64_t v75 = OBJC_IVAR___SwiftVideoProcessor_framePoolIndex;
  unint64_t v76 = *(void *)(v283 + OBJC_IVAR___SwiftVideoProcessor_framePoolIndex);
  uint64_t v77 = OBJC_IVAR___SwiftVideoProcessor_frameDeltas;
  double v78 = *(char **)(v283 + OBJC_IVAR___SwiftVideoProcessor_frameDeltas);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v283 + v77) = v78;
  if (isUniquelyReferenced_nonNull_native)
  {
    if ((v76 & 0x8000000000000000) == 0) {
      goto LABEL_40;
    }
LABEL_259:
    __break(1u);
    goto LABEL_260;
  }
  double v78 = sub_259DAD1A8((uint64_t)v78);
  *(void *)(v283 + v77) = v78;
  if ((v76 & 0x8000000000000000) != 0) {
    goto LABEL_259;
  }
LABEL_40:
  if (v76 >= *((void *)v78 + 2))
  {
LABEL_260:
    __break(1u);
    goto LABEL_261;
  }
  *(double *)&v78[8 * v76 + 32] = v74;
  uint64_t v80 = *(void *)(v283 + v77);
  *(void *)(v283 + v75) = (v76 + 1) % 0xA;
  if (*(void *)(v80 + 16) < 0xAuLL)
  {
LABEL_261:
    __break(1u);
    goto LABEL_262;
  }
  double v82 = *(double *)(v80 + 32);
  double v81 = *(double *)(v80 + 40);
  double v84 = *(double *)(v80 + 48);
  double v83 = *(double *)(v80 + 56);
  double v86 = *(double *)(v80 + 64);
  double v85 = *(double *)(v80 + 72);
  double v88 = *(double *)(v80 + 80);
  double v87 = *(double *)(v80 + 88);
  double v89 = *(double *)(v80 + 96);
  double v90 = *(double *)(v80 + 104);
  double v91 = fmax(v82, 0.001);
  if (v91 <= v81) {
    double v91 = *(double *)(v80 + 40);
  }
  if (v91 <= v84) {
    double v91 = *(double *)(v80 + 48);
  }
  if (v91 <= v83) {
    double v91 = *(double *)(v80 + 56);
  }
  if (v91 <= v86) {
    double v91 = *(double *)(v80 + 64);
  }
  if (v91 <= v85) {
    double v91 = *(double *)(v80 + 72);
  }
  if (v91 <= v88) {
    double v91 = *(double *)(v80 + 80);
  }
  if (v91 <= v87) {
    double v91 = *(double *)(v80 + 88);
  }
  if (v91 <= v89) {
    double v91 = *(double *)(v80 + 96);
  }
  double v92 = fmin(v82, 10.0);
  if (v81 < v92) {
    double v92 = *(double *)(v80 + 40);
  }
  if (v84 < v92) {
    double v92 = *(double *)(v80 + 48);
  }
  if (v83 < v92) {
    double v92 = *(double *)(v80 + 56);
  }
  if (v86 < v92) {
    double v92 = *(double *)(v80 + 64);
  }
  if (v85 < v92) {
    double v92 = *(double *)(v80 + 72);
  }
  if (v88 < v92) {
    double v92 = *(double *)(v80 + 80);
  }
  if (v87 < v92) {
    double v92 = *(double *)(v80 + 88);
  }
  if (v89 < v92) {
    double v92 = *(double *)(v80 + 96);
  }
  if (v90 < v92) {
    double v92 = *(double *)(v80 + 104);
  }
  if (v91 <= v90) {
    double v91 = *(double *)(v80 + 104);
  }
  double v93 = v82 + 0.0 + v81 + v84 + v83 + v86 + v85 + v88 + v87 + v89 + v90;
  double v94 = (v82 - v93 / 10.0) * (v82 - v93 / 10.0) / 10.0
      + (v81 - v93 / 10.0) * (v81 - v93 / 10.0) / 10.0
      + (v84 - v93 / 10.0) * (v84 - v93 / 10.0) / 10.0
      + (v83 - v93 / 10.0) * (v83 - v93 / 10.0) / 10.0
      + (v86 - v93 / 10.0) * (v86 - v93 / 10.0) / 10.0
      + (v85 - v93 / 10.0) * (v85 - v93 / 10.0) / 10.0
      + (v88 - v93 / 10.0) * (v88 - v93 / 10.0) / 10.0
      + (v87 - v93 / 10.0) * (v87 - v93 / 10.0) / 10.0
      + (v89 - v93 / 10.0) * (v89 - v93 / 10.0) / 10.0
      + (v90 - v93 / 10.0) * (v90 - v93 / 10.0) / 10.0;
  float v95 = *(float *)(v283 + OBJC_IVAR___SwiftVideoProcessor_fps);
  double v96 = fabs(sqrt(v94));
  BOOL v97 = v94 == -INFINITY;
  double v98 = INFINITY;
  if (!v97) {
    double v98 = v96;
  }
  float v99 = v93 - v92 - v91;
  uint64_t v272 = OBJC_IVAR___SwiftVideoProcessor_fps;
  *(float *)(v283 + OBJC_IVAR___SwiftVideoProcessor_fps) = 8.0 / v99;
  *(Swift::Double *)(v283 + v72) = timestamp;
  BOOL v100 = v98 / (v93 / 10.0) > 0.1;
  uint64_t v101 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferConstants;
  swift_beginAccess();
  *(unsigned char *)(v101 + 7) = v100;
  size_t Width = IOSurfaceGetWidth(v6);
  size_t Height = IOSurfaceGetHeight(v6);
  uint64_t v103 = sub_259DA6AEC(v6);
  if (!PSELog) {
    goto LABEL_291;
  }
  uint64_t v104 = v103;
  id v105 = (id)PSELog;
  sub_259DAF670();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F2660);
  uint64_t v106 = swift_allocObject();
  *(_OWORD *)(v106 + 16) = xmmword_259DB0470;
  id v107 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInt_, v104);
  id v281 = (id)sub_259DAD408();
  *(void *)(v106 + 56) = v281;
  unint64_t v278 = sub_259DAD448();
  *(void *)(v106 + 64) = v278;
  *(void *)(v106 + 32) = v107;
  sub_259DAF5E0();

  swift_bridgeObjectRelease();
  int v108 = v104 - 1;
  if (v104 - 1) < 0x1E && ((0x29AB10FBu >> v108))
  {
    uint64_t v114 = 4 * v108;
    int v113 = *(_DWORD *)((char *)&unk_259DB06D8 + v114);
    int v112 = *(_DWORD *)((char *)&unk_259DB0750 + v114);
  }
  else
  {
    if (!PSELog)
    {
LABEL_292:
      __break(1u);
      goto LABEL_293;
    }
    id v109 = (id)PSELog;
    sub_259DAF670();
    uint64_t v110 = swift_allocObject();
    *(_OWORD *)(v110 + 16) = xmmword_259DB0470;
    id v111 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInt_, v104);
    *(void *)(v110 + 56) = v281;
    *(void *)(v110 + 64) = v278;
    *(void *)(v110 + 32) = v111;
    sub_259DAF5E0();

    swift_bridgeObjectRelease();
    int v112 = 0;
    int v113 = 1;
  }
  *(_DWORD *)(v101 + 12) = v113;
  *(_DWORD *)(v101 + 16) = v112;
  uint64_t ProtectionOptions = IOSurfaceGetProtectionOptions();
  uint64_t v116 = ProtectionOptions;
  if (ProtectionOptions)
  {
    uint64_t v117 = OBJC_IVAR___SwiftVideoProcessor_protectionStatus;
    if (ProtectionOptions != *(void *)(v283 + OBJC_IVAR___SwiftVideoProcessor_protectionStatus))
    {
      if (!PSELog)
      {
LABEL_296:
        __break(1u);
        goto LABEL_297;
      }
      id v269 = (id)PSELog;
      sub_259DAF660();
      uint64_t v119 = swift_allocObject();
      *(_OWORD *)(v119 + 16) = xmmword_259DB0450;
      id v120 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedLongLong_, v116);
      *(void *)(v119 + 56) = v281;
      *(void *)(v119 + 64) = v278;
      *(void *)(v119 + 32) = v120;
      id v121 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedLongLong_, *(void *)(v283 + v117));
      *(void *)(v119 + 96) = v281;
      *(void *)(v119 + 104) = v278;
      *(void *)(v119 + 72) = v121;
      sub_259DAF5E0();

      swift_bridgeObjectRelease();
      sub_259DA80A0(v116);
LABEL_94:
      sub_259DA8D6C(v116);
      goto LABEL_95;
    }
  }
  if (timestamp - *(double *)(v283 + v72) > 1.0 || vabds_f32(*(float *)(v283 + v272), v95) >= 5.0)
  {
    if (!PSELog)
    {
LABEL_294:
      __break(1u);
      goto LABEL_295;
    }
    id v118 = (id)PSELog;
    sub_259DAF660();
    sub_259DAF5E0();

    goto LABEL_94;
  }
LABEL_95:
  id v122 = *(void **)(v283 + OBJC_IVAR___SwiftVideoProcessor_device);
  if (!v122) {
    return;
  }
  v286 = &unk_2707CD030;
  v123 = (void *)swift_dynamicCastObjCProtocolConditional();
  swift_unknownObjectRetain();
  if (v123)
  {
    OSType PixelFormat = IOSurfaceGetPixelFormat(sourceSurface);
    if (PixelFormat == 1953903154)
    {
      if (objc_msgSend(v123, sel_supportsYCBCRFormats12)) {
        goto LABEL_104;
      }
      uint64_t v126 = 0x100000002;
    }
    else
    {
      if (PixelFormat != 1953903152) {
        goto LABEL_104;
      }
      unsigned __int8 v125 = objc_msgSend(v123, sel_supportsYCBCRFormats12);
      uint64_t v126 = 0x200000002;
      if (v125) {
        goto LABEL_104;
      }
    }
    *(unsigned char *)(v101 + 48) = 1;
    *(unsigned char *)(v101 + 8) = 1;
    *(void *)(v101 + 40) = v126;
  }
LABEL_104:
  if (*(unsigned char *)(v101 + 48) == 1)
  {
    size_t WidthOfPlane = IOSurfaceGetWidthOfPlane(sourceSurface, 0);
    size_t HeightOfPlane = IOSurfaceGetHeightOfPlane(sourceSurface, 0);
    id v129 = objc_msgSend(self, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 115, WidthOfPlane, HeightOfPlane, 0);
    objc_msgSend(v129, sel_setUsage_, 2);
    objc_msgSend(v129, sel_setProtectionOptions_, v116);
    id v130 = objc_msgSend(v122, sel_newTextureWithDescriptor_iosurface_plane_, v129, destinationSurface, 0);
    uint64_t v131 = v283;
    *(void *)(v283 + OBJC_IVAR___SwiftVideoProcessor_processedTexture) = v130;
    swift_unknownObjectRelease();
    objc_msgSend(v129, sel_setUsage_, 1);
    objc_msgSend(v129, sel_setPixelFormat_, 20);
    id v132 = objc_msgSend(v122, sel_newTextureWithDescriptor_iosurface_plane_, v129, sourceSurface, 0);
    *(void *)(v283 + OBJC_IVAR___SwiftVideoProcessor_sourceTexture) = v132;
    swift_unknownObjectRelease();
    objc_msgSend(v129, sel_setWidth_, IOSurfaceGetWidthOfPlane(sourceSurface, 1uLL));
    objc_msgSend(v129, sel_setHeight_, IOSurfaceGetHeightOfPlane(sourceSurface, 1uLL));
    objc_msgSend(v129, sel_setPixelFormat_, 60);
    id v133 = objc_msgSend(v122, sel_newTextureWithDescriptor_iosurface_plane_, v129, sourceSurface, 1);

    uint64_t v134 = OBJC_IVAR___SwiftVideoProcessor_sourceCbCrTexture;
  }
  else
  {
    v135 = self;
    id v136 = objc_msgSend(v135, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, sub_259DAD494(sourceSurface), Width, Height, 0);
    objc_msgSend(v136, sel_setUsage_, 1);
    objc_msgSend(v136, sel_setProtectionOptions_, v116);
    id v137 = objc_msgSend(v122, sel_newTextureWithDescriptor_iosurface_plane_, v136, sourceSurface, 0);
    uint64_t v131 = v283;
    *(void *)(v283 + OBJC_IVAR___SwiftVideoProcessor_sourceTexture) = v137;
    swift_unknownObjectRelease();
    *(void *)(v283 + OBJC_IVAR___SwiftVideoProcessor_sourceCbCrTexture) = 0;
    swift_unknownObjectRelease();
    objc_msgSend(v136, sel_setUsage_, 2);
    objc_msgSend(v136, sel_setPixelFormat_, sub_259DAD494(destinationSurface));
    id v133 = objc_msgSend(v122, sel_newTextureWithDescriptor_iosurface_plane_, v136, destinationSurface, 0);

    uint64_t v134 = OBJC_IVAR___SwiftVideoProcessor_processedTexture;
  }
  *(void *)(v131 + v134) = v133;
  swift_unknownObjectRelease();
  strcpy((char *)&v284, "displayMaxNits");
  HIBYTE(v284) = -18;
  id v138 = [(objc_class *)options.super.isa __swift_objectForKeyedSubscript:sub_259DAF740()];
  swift_unknownObjectRelease();
  if (v138)
  {
    sub_259DAF6F0();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v284 = 0u;
    long long v285 = 0u;
  }
  sub_259DAD6DC((uint64_t)&v284, (uint64_t)aBlock);
  if (*(void *)&aBlock[24])
  {
    if (swift_dynamicCast())
    {
      id v139 = (id)v289;
      goto LABEL_115;
    }
  }
  else
  {
    sub_259DAD744((uint64_t)aBlock);
  }
  id v139 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, 0);
LABEL_115:
  objc_msgSend(v139, sel_floatValue);
  int v141 = v140;

  *(_DWORD *)(v101 + 20) = v141;
  *(void *)&long long v284 = 0xD000000000000010;
  *((void *)&v284 + 1) = 0x8000000259DB0AC0;
  id v142 = [(objc_class *)options.super.isa __swift_objectForKeyedSubscript:sub_259DAF740()];
  swift_unknownObjectRelease();
  if (v142)
  {
    sub_259DAF6F0();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v284 = 0u;
    long long v285 = 0u;
  }
  sub_259DAD6DC((uint64_t)&v284, (uint64_t)aBlock);
  if (*(void *)&aBlock[24])
  {
    if (swift_dynamicCast())
    {
      id v143 = (id)v289;
      goto LABEL_123;
    }
  }
  else
  {
    sub_259DAD744((uint64_t)aBlock);
  }
  id v143 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, 0);
LABEL_123:
  objc_msgSend(v143, sel_floatValue);
  int v145 = v144;

  *(_DWORD *)(v101 + 24) = v145;
  *(void *)&long long v284 = 0xD000000000000010;
  *((void *)&v284 + 1) = 0x8000000259DB0AE0;
  id v146 = [(objc_class *)options.super.isa __swift_objectForKeyedSubscript:sub_259DAF740()];
  swift_unknownObjectRelease();
  if (v146)
  {
    sub_259DAF6F0();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v284 = 0u;
    long long v285 = 0u;
  }
  sub_259DAD6DC((uint64_t)&v284, (uint64_t)aBlock);
  if (*(void *)&aBlock[24])
  {
    if (swift_dynamicCast())
    {
      id v147 = (id)v289;
      goto LABEL_131;
    }
  }
  else
  {
    sub_259DAD744((uint64_t)aBlock);
  }
  id v147 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, 1);
LABEL_131:
  objc_msgSend(v147, sel_floatValue);
  int v149 = v148;

  *(_DWORD *)(v101 + 28) = v149;
  if (!PSELog)
  {
LABEL_293:
    __break(1u);
    goto LABEL_294;
  }
  id v150 = (id)PSELog;
  sub_259DAF660();
  uint64_t v151 = swift_allocObject();
  *(_OWORD *)(v151 + 16) = xmmword_259DB0510;
  int v152 = *(_DWORD *)(v101 + 20);
  id v153 = objc_allocWithZone(NSNumber);
  LODWORD(v154) = v152;
  id v155 = objc_msgSend(v153, sel_initWithFloat_, v154);
  *(void *)(v151 + 56) = v281;
  *(void *)(v151 + 64) = v278;
  *(void *)(v151 + 32) = v155;
  int v156 = *(_DWORD *)(v101 + 24);
  id v157 = objc_allocWithZone(NSNumber);
  LODWORD(v158) = v156;
  id v159 = objc_msgSend(v157, sel_initWithFloat_, v158);
  *(void *)(v151 + 96) = v281;
  *(void *)(v151 + 104) = v278;
  *(void *)(v151 + 72) = v159;
  int v160 = *(_DWORD *)(v101 + 28);
  id v161 = objc_allocWithZone(NSNumber);
  LODWORD(v162) = v160;
  id v163 = objc_msgSend(v161, sel_initWithFloat_, v162);
  *(void *)(v151 + 136) = v281;
  *(void *)(v151 + 144) = v278;
  *(void *)(v151 + 112) = v163;
  sub_259DAF5E0();

  swift_bridgeObjectRelease();
  *(void *)&long long v284 = 0x46746E6572727563;
  *((void *)&v284 + 1) = 0xEA00000000005350;
  id v164 = [(objc_class *)options.super.isa __swift_objectForKeyedSubscript:sub_259DAF740()];
  swift_unknownObjectRelease();
  if (v164)
  {
    sub_259DAF6F0();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v284 = 0u;
    long long v285 = 0u;
  }
  sub_259DAD6DC((uint64_t)&v284, (uint64_t)aBlock);
  if (*(void *)&aBlock[24])
  {
    if (swift_dynamicCast())
    {
      id v165 = (id)v289;
      goto LABEL_140;
    }
  }
  else
  {
    sub_259DAD744((uint64_t)aBlock);
  }
  id v165 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, 0);
LABEL_140:
  objc_msgSend(v165, sel_floatValue);
  float v167 = v166;

  if (v167 <= 0.0) {
    float v167 = *(float *)(v283 + v272);
  }
  *(float *)(v101 + 32) = v167;
  unint64_t v168 = *(void **)(v283 + OBJC_IVAR___SwiftVideoProcessor_commandQueue);
  if (!v168) {
    goto LABEL_253;
  }
  swift_unknownObjectRetain();
  dispatch_semaphore_t v169 = dispatch_semaphore_create(0);
  if (objc_msgSend(v168, sel_commandBuffer))
  {
    v170 = (void *)swift_dynamicCastObjCProtocolConditional();
    if (!v170)
    {
LABEL_251:
      swift_unknownObjectRelease();
      goto LABEL_252;
    }
    uint64_t v171 = v170;
    if (objc_msgSend(v170, sel_respondsToSelector_, sel_setProtectionOptions_)) {
      objc_msgSend(v171, sel_setProtectionOptions_, v116);
    }
    uint64_t v172 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v173 = swift_allocObject();
    *(void *)(v173 + 16) = v172;
    *(void *)(v173 + 24) = v169;
    *(void *)&aBlock[32] = sub_259DAD81C;
    uint64_t v292 = v173;
    *(void *)aBlock = MEMORY[0x263EF8330];
    *(void *)&aBlock[8] = 1107296256;
    *(void *)&aBlock[16] = sub_259DACE74;
    *(void *)&aBlock[24] = &block_descriptor;
    uint64_t v174 = _Block_copy(aBlock);
    v280 = v169;
    v169;
    swift_release();
    objc_msgSend(v171, sel_addCompletedHandler_, v174);
    _Block_release(v174);
    swift_unknownObjectRetain();
    v295 = &unk_2707CD8A0;
    float v175 = (void *)swift_dynamicCastObjCProtocolUnconditional();
    id v282 = v171;
    if ((objc_msgSend(v175, sel_respondsToSelector_, sel_protectionOptions) & 1) != 0
      && !objc_msgSend(v175, sel_protectionOptions))
    {
      char v176 = 0;
      unint64_t v177 = 0;
    }
    else
    {
      char v176 = 1;
      unint64_t v177 = 1;
    }
    uint64_t v178 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferConstants;
    swift_beginAccess();
    *(unsigned char *)(v178 + 9) = v176;
    int64_t v179 = IOSurfaceGetWidth(sourceSurface);
    int64_t v180 = IOSurfaceGetHeight(sourceSurface);
    if ((unsigned __int128)(v179 * (__int128)v180) >> 64 == (v179 * v180) >> 63)
    {
      uint64_t v181 = v180;
      *(float *)uint64_t v178 = (float)(v179 * v180);
      id v182 = objc_msgSend(v282, sel_blitCommandEncoder);
      if (!v182) {
        goto LABEL_157;
      }
      long long v183 = v182;
      uint64_t v184 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferFrameLumaSum;
      swift_beginAccess();
      if (v177 < *(void *)(*(void *)v184 + 16))
      {
        if (!*(void *)(*(void *)v184 + 8 * v177 + 32))
        {
LABEL_156:
          swift_unknownObjectRelease();
LABEL_157:
          id v185 = objc_msgSend(v282, sel_computeCommandEncoder);
          if (!v185)
          {
LABEL_248:
            swift_unknownObjectRelease();
            objc_msgSend(v282, sel_commit);
            sub_259DAF6B0();
            dispatch_semaphore_t v169 = v280;
            goto LABEL_251;
          }
          v186 = v185;
          long long v187 = (void *)sub_259DAF5F0();
          objc_msgSend(v186, sel_setLabel_, v187);

          int v188 = *(void **)(v283 + OBJC_IVAR___SwiftVideoProcessor_cptPSO_RiskComputePass0);
          if (!v188) {
            goto LABEL_175;
          }
          swift_unknownObjectRetain();
          objc_msgSend(v186, sel_setComputePipelineState_, v188);
          objc_msgSend(v186, sel_setTexture_atIndex_, *(void *)(v283 + OBJC_IVAR___SwiftVideoProcessor_sourceTexture), 0);
          objc_msgSend(v186, sel_setTexture_atIndex_, *(void *)(v283 + OBJC_IVAR___SwiftVideoProcessor_sourceCbCrTexture), 1);
          objc_msgSend(v186, sel_setTexture_atIndex_, *(void *)(v283 + OBJC_IVAR___SwiftVideoProcessor_processedTexture), 2);
          swift_beginAccess();
          objc_msgSend(v186, sel_setBytes_length_atIndex_, v178, 56, 0);
          swift_endAccess();
          uint64_t v189 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferFrameLumaSum;
          swift_beginAccess();
          if (v177 < *(void *)(*(void *)v189 + 16))
          {
            uint64_t v190 = *(void *)(*(void *)v189 + 8 * v177 + 32);
            if (v190) {
              objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v190, 0, 1);
            }
            uint64_t v191 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferData;
            swift_beginAccess();
            if (v177 < *(void *)(*(void *)v191 + 16))
            {
              uint64_t v192 = *(void *)(*(void *)v191 + 8 * v177 + 32);
              if (v192) {
                objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v192, 0, 2);
              }
              uint64_t v193 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferGammaKernel;
              swift_beginAccess();
              if (v177 < *(void *)(*(void *)v193 + 16))
              {
                uint64_t v194 = *(void *)(*(void *)v193 + 8 * v177 + 32);
                if (v194) {
                  objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v194, 0, 3);
                }
                uint64_t v195 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferCurState;
                swift_beginAccess();
                if (v177 < *(void *)(*(void *)v195 + 16))
                {
                  uint64_t v196 = *(void *)(*(void *)v195 + 8 * v177 + 32);
                  if (v196) {
                    objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v196, 0, 4);
                  }
                  uint64_t v197 = (uint64_t)objc_msgSend(v188, sel_threadExecutionWidth);
                  uint64_t v198 = (uint64_t)objc_msgSend(v188, sel_maxTotalThreadsPerThreadgroup);
                  if (v197)
                  {
                    if (v198 == 0x8000000000000000 && v197 == -1) {
                      goto LABEL_272;
                    }
                    MTLSizeMake(v197, v198 / v197, aBlock);
                    long long v273 = *(_OWORD *)aBlock;
                    uint64_t v199 = *(void *)&aBlock[16];
                    MTLSizeMake(v179, v181, aBlock);
                    long long v289 = v273;
                    uint64_t v290 = v199;
                    objc_msgSend(v186, sel_dispatchThreads_threadsPerThreadgroup_, aBlock, &v289);
                    swift_unknownObjectRelease();
LABEL_175:
                    if (*(unsigned char *)(v178 + 7))
                    {
LABEL_239:
                      objc_msgSend(v186, sel_endEncoding);
                      char v250 = *(unsigned char *)(v178 + 4);
                      char v251 = *(unsigned char *)(v178 + 5);
                      char v252 = *(unsigned char *)(v178 + 6);
                      char v253 = *(unsigned char *)(v178 + 7);
                      char v254 = *(unsigned char *)(v178 + 8);
                      char v255 = *(unsigned char *)(v178 + 9);
                      uint64_t v256 = *(void *)(v178 + 40);
                      char v257 = *(unsigned char *)(v178 + 48);
                      int v258 = *(_DWORD *)(v178 + 52);
                      *(_DWORD *)aBlock = *(_DWORD *)v178;
                      aBlock[4] = v250;
                      aBlock[5] = v251;
                      aBlock[6] = v252;
                      aBlock[7] = v253;
                      aBlock[8] = v254;
                      aBlock[9] = v255;
                      *(void *)&aBlock[12] = *(void *)(v178 + 12);
                      *(_OWORD *)&aBlock[20] = *(_OWORD *)(v178 + 20);
                      uint64_t v292 = v256;
                      char v293 = v257;
                      int v294 = v258;
                      if (!IncludesDebugInfo((uint64_t)aBlock)
                        || (v255 & 1) != 0
                        || (id v259 = objc_msgSend(v282, sel_blitCommandEncoder)) == 0)
                      {
LABEL_247:
                        swift_unknownObjectRelease();
                        goto LABEL_248;
                      }
                      v260 = v259;
                      uint64_t v261 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferData;
                      swift_beginAccess();
                      if (*(void *)(*(void *)v261 + 16))
                      {
                        if (*(void *)(*(void *)v261 + 32))
                        {
                          if (*(void *)(v283 + OBJC_IVAR___SwiftVideoProcessor_bufferDataDebug)) {
                            objc_msgSend(v260, sel_copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_);
                          }
                        }
                        objc_msgSend(v260, sel_endEncoding);
                        swift_unknownObjectRelease();
                        goto LABEL_247;
                      }
                      goto LABEL_278;
                    }
                    uint64_t v200 = *(void *)(v283 + OBJC_IVAR___SwiftVideoProcessor_cptPSO_RiskComputePass1);
                    if (!v200) {
                      goto LABEL_202;
                    }
                    swift_unknownObjectRetain();
                    objc_msgSend(v186, sel_setComputePipelineState_, v200);
                    swift_beginAccess();
                    objc_msgSend(v186, sel_setBytes_length_atIndex_, v178, 56, 0);
                    swift_endAccess();
                    uint64_t v201 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferFrameLumaSum;
                    swift_beginAccess();
                    if (v177 < *(void *)(*(void *)v201 + 16))
                    {
                      uint64_t v202 = *(void *)(*(void *)v201 + 8 * v177 + 32);
                      if (v202) {
                        objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v202, 0, 1);
                      }
                      uint64_t v203 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferData;
                      swift_beginAccess();
                      if (v177 < *(void *)(*(void *)v203 + 16))
                      {
                        uint64_t v204 = *(void *)(*(void *)v203 + 8 * v177 + 32);
                        if (v204) {
                          objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v204, 0, 2);
                        }
                        uint64_t v205 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferGammaKernel;
                        swift_beginAccess();
                        if (v177 < *(void *)(*(void *)v205 + 16))
                        {
                          uint64_t v206 = *(void *)(*(void *)v205 + 8 * v177 + 32);
                          if (v206) {
                            objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v206, 0, 3);
                          }
                          uint64_t v207 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferCurState;
                          swift_beginAccess();
                          if (v177 < *(void *)(*(void *)v207 + 16))
                          {
                            uint64_t v208 = *(void *)(*(void *)v207 + 8 * v177 + 32);
                            if (v208) {
                              objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v208, 0, 4);
                            }
                            uint64_t v209 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferContrastKernel;
                            swift_beginAccess();
                            if (v177 < *(void *)(*(void *)v209 + 16))
                            {
                              uint64_t v210 = *(void *)(*(void *)v209 + 8 * v177 + 32);
                              if (v210) {
                                objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v210, 0, 5);
                              }
                              uint64_t v211 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferContrast;
                              swift_beginAccess();
                              if (v177 < *(void *)(*(void *)v211 + 16))
                              {
                                uint64_t v212 = *(void *)(*(void *)v211 + 8 * v177 + 32);
                                if (v212) {
                                  objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v212, 0, 6);
                                }
                                uint64_t v213 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferResponses;
                                swift_beginAccess();
                                if (v177 >= *(void *)(*(void *)v213 + 16)) {
                                  goto LABEL_279;
                                }
                                uint64_t v214 = *(void *)(*(void *)v213 + 8 * v177 + 32);
                                if (v214) {
                                  objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v214, 0, 7);
                                }
                                uint64_t v215 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferResponsesNorm;
                                swift_beginAccess();
                                if (v177 >= *(void *)(*(void *)v215 + 16)) {
                                  goto LABEL_281;
                                }
                                uint64_t v216 = *(void *)(*(void *)v215 + 8 * v177 + 32);
                                if (v216) {
                                  objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v216, 0, 8);
                                }
                                MTLSizeMake(160, 1, aBlock);
                                *(_OWORD *)buffera = *(_OWORD *)aBlock;
                                uint64_t v217 = *(void *)&aBlock[16];
                                MTLSizeMake(32, 1, aBlock);
                                uint64_t v218 = *(void *)&aBlock[16];
                                long long v219 = *(_OWORD *)aBlock;
                                *(_OWORD *)aBlock = *(_OWORD *)buffera;
                                *(void *)&aBlock[16] = v217;
                                long long v289 = v219;
                                uint64_t v290 = v218;
                                objc_msgSend(v186, sel_dispatchThreads_threadsPerThreadgroup_, aBlock, &v289);
                                swift_unknownObjectRelease();
LABEL_202:
                                uint64_t v220 = *(void *)(v283 + OBJC_IVAR___SwiftVideoProcessor_cptPSO_RiskComputePass2);
                                if (!v220)
                                {
LABEL_228:
                                  uint64_t v240 = *(void *)(v283 + OBJC_IVAR___SwiftVideoProcessor_cptPSO_RiskComputePass3);
                                  if (v240)
                                  {
                                    swift_unknownObjectRetain();
                                    objc_msgSend(v186, sel_setComputePipelineState_, v240);
                                    swift_beginAccess();
                                    objc_msgSend(v186, sel_setBytes_length_atIndex_, v178, 56, 0);
                                    swift_endAccess();
                                    uint64_t v241 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferCurState;
                                    swift_beginAccess();
                                    if (v177 >= *(void *)(*(void *)v241 + 16))
                                    {
LABEL_286:
                                      __break(1u);
LABEL_287:
                                      __break(1u);
LABEL_288:
                                      __break(1u);
LABEL_289:
                                      __break(1u);
LABEL_290:
                                      __break(1u);
LABEL_291:
                                      __break(1u);
                                      goto LABEL_292;
                                    }
                                    uint64_t v242 = *(void *)(*(void *)v241 + 8 * v177 + 32);
                                    if (v242) {
                                      objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v242, 0, 4);
                                    }
                                    uint64_t v243 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferData;
                                    swift_beginAccess();
                                    if (v177 >= *(void *)(*(void *)v243 + 16)) {
                                      goto LABEL_288;
                                    }
                                    uint64_t v244 = *(void *)(*(void *)v243 + 8 * v177 + 32);
                                    if (v244) {
                                      objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v244, 0, 2);
                                    }
                                    uint64_t v245 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferResults;
                                    swift_beginAccess();
                                    if (v177 >= *(void *)(*(void *)v245 + 16)) {
                                      goto LABEL_290;
                                    }
                                    uint64_t v246 = *(void *)(*(void *)v245 + 8 * v177 + 32);
                                    if (v246) {
                                      objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v246, 0, 11);
                                    }
                                    MTLSizeMake(1, 1, aBlock);
                                    *(_OWORD *)bufferc = *(_OWORD *)aBlock;
                                    uint64_t v247 = *(void *)&aBlock[16];
                                    MTLSizeMake(1, 1, aBlock);
                                    uint64_t v248 = *(void *)&aBlock[16];
                                    long long v249 = *(_OWORD *)aBlock;
                                    *(_OWORD *)aBlock = *(_OWORD *)bufferc;
                                    *(void *)&aBlock[16] = v247;
                                    long long v287 = v249;
                                    uint64_t v288 = v248;
                                    objc_msgSend(v186, sel_dispatchThreads_threadsPerThreadgroup_, aBlock, &v287);
                                    swift_unknownObjectRelease();
                                  }
                                  goto LABEL_239;
                                }
                                swift_unknownObjectRetain();
                                objc_msgSend(v186, sel_setComputePipelineState_, v220);
                                swift_beginAccess();
                                objc_msgSend(v186, sel_setBytes_length_atIndex_, v178, 56, 0);
                                swift_endAccess();
                                uint64_t v221 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferData;
                                swift_beginAccess();
                                if (v177 < *(void *)(*(void *)v221 + 16))
                                {
                                  uint64_t v222 = *(void *)(*(void *)v221 + 8 * v177 + 32);
                                  if (v222) {
                                    objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v222, 0, 2);
                                  }
                                  uint64_t v223 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferGammaKernel;
                                  swift_beginAccess();
                                  if (v177 >= *(void *)(*(void *)v223 + 16)) {
                                    goto LABEL_280;
                                  }
                                  uint64_t v224 = *(void *)(*(void *)v223 + 8 * v177 + 32);
                                  if (v224) {
                                    objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v224, 0, 3);
                                  }
                                  uint64_t v225 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferCurState;
                                  swift_beginAccess();
                                  if (v177 >= *(void *)(*(void *)v225 + 16)) {
                                    goto LABEL_282;
                                  }
                                  uint64_t v226 = *(void *)(*(void *)v225 + 8 * v177 + 32);
                                  if (v226) {
                                    objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v226, 0, 4);
                                  }
                                  uint64_t v227 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferResponses;
                                  swift_beginAccess();
                                  if (v177 >= *(void *)(*(void *)v227 + 16)) {
                                    goto LABEL_283;
                                  }
                                  uint64_t v228 = *(void *)(*(void *)v227 + 8 * v177 + 32);
                                  if (v228) {
                                    objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v228, 0, 7);
                                  }
                                  uint64_t v229 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferResponsesNorm;
                                  swift_beginAccess();
                                  if (v177 >= *(void *)(*(void *)v229 + 16)) {
                                    goto LABEL_284;
                                  }
                                  uint64_t v230 = *(void *)(*(void *)v229 + 8 * v177 + 32);
                                  if (v230) {
                                    objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v230, 0, 8);
                                  }
                                  uint64_t v231 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferEnergy;
                                  swift_beginAccess();
                                  if (v177 >= *(void *)(*(void *)v231 + 16)) {
                                    goto LABEL_285;
                                  }
                                  uint64_t v232 = *(void *)(*(void *)v231 + 8 * v177 + 32);
                                  if (v232) {
                                    objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v232, 0, 9);
                                  }
                                  uint64_t v233 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferEnergy2;
                                  swift_beginAccess();
                                  if (v177 >= *(void *)(*(void *)v233 + 16)) {
                                    goto LABEL_287;
                                  }
                                  uint64_t v234 = *(void *)(*(void *)v233 + 8 * v177 + 32);
                                  if (v234) {
                                    objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v234, 0, 10);
                                  }
                                  uint64_t v235 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferResults;
                                  swift_beginAccess();
                                  if (v177 >= *(void *)(*(void *)v235 + 16)) {
                                    goto LABEL_289;
                                  }
                                  uint64_t v236 = *(void *)(*(void *)v235 + 8 * v177 + 32);
                                  if (v236) {
                                    objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v236, 0, 11);
                                  }
                                  MTLSizeMake(1280, 1, aBlock);
                                  *(_OWORD *)bufferb = *(_OWORD *)aBlock;
                                  uint64_t v237 = *(void *)&aBlock[16];
                                  MTLSizeMake(256, 1, aBlock);
                                  uint64_t v238 = *(void *)&aBlock[16];
                                  long long v239 = *(_OWORD *)aBlock;
                                  *(_OWORD *)aBlock = *(_OWORD *)bufferb;
                                  *(void *)&aBlock[16] = v237;
                                  long long v289 = v239;
                                  uint64_t v290 = v238;
                                  objc_msgSend(v186, sel_dispatchThreads_threadsPerThreadgroup_, aBlock, &v289);
                                  swift_unknownObjectRelease();
                                  goto LABEL_228;
                                }
LABEL_277:
                                __break(1u);
LABEL_278:
                                __break(1u);
LABEL_279:
                                __break(1u);
LABEL_280:
                                __break(1u);
LABEL_281:
                                __break(1u);
LABEL_282:
                                __break(1u);
LABEL_283:
                                __break(1u);
LABEL_284:
                                __break(1u);
LABEL_285:
                                __break(1u);
                                goto LABEL_286;
                              }
LABEL_276:
                              __break(1u);
                              goto LABEL_277;
                            }
LABEL_275:
                            __break(1u);
                            goto LABEL_276;
                          }
LABEL_274:
                          __break(1u);
                          goto LABEL_275;
                        }
LABEL_273:
                        __break(1u);
                        goto LABEL_274;
                      }
                      goto LABEL_271;
                    }
LABEL_270:
                    __break(1u);
LABEL_271:
                    __break(1u);
LABEL_272:
                    __break(1u);
                    goto LABEL_273;
                  }
LABEL_269:
                  __break(1u);
                  goto LABEL_270;
                }
LABEL_268:
                __break(1u);
                goto LABEL_269;
              }
LABEL_267:
              __break(1u);
              goto LABEL_268;
            }
LABEL_266:
            __break(1u);
            goto LABEL_267;
          }
LABEL_265:
          __break(1u);
          goto LABEL_266;
        }
        swift_getObjectType();
        if (((unint64_t)objc_msgSend((id)swift_unknownObjectRetain(), sel_length) & 0x8000000000000000) == 0)
        {
          sub_259DAF6A0();
          objc_msgSend(v183, sel_endEncoding);
          swift_unknownObjectRelease();
          goto LABEL_156;
        }
LABEL_264:
        __break(1u);
        goto LABEL_265;
      }
LABEL_263:
      __break(1u);
      goto LABEL_264;
    }
LABEL_262:
    __break(1u);
    goto LABEL_263;
  }
LABEL_252:
  swift_unknownObjectRelease();

LABEL_253:
  swift_unknownObjectRelease();
}

uint64_t sub_259DACE74(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

id VideoProcessor.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

BOOL sub_259DAD164(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_259DAD178@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_259DAD188(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_259DAD194()
{
}

char *sub_259DAD1A8(uint64_t a1)
{
  return sub_259DAD1BC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_259DAD1BC(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F29A8);
    id v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    id v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v13 = v10 + 32;
  id v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_259DAD2B8(uint64_t a1, uint64_t a2)
{
  char v5 = (uint64_t *)(v2 + OBJC_IVAR___SwiftVideoProcessor_validationCallback);
  swift_beginAccess();
  uint64_t v6 = *v5;
  uint64_t *v5 = a1;
  v5[1] = a2;
  sub_259DA7094(a1);
  sub_259DAD3BC(v6);
  uint64_t v7 = *v5;
  uint64_t v8 = v5[1];
  if (*v5)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v7;
    *(void *)(v9 + 24) = v8;
    id v10 = sub_259DAD404;
  }
  else
  {
    id v10 = 0;
  }
  BOOL v11 = v7 != 0;
  sub_259DA7094(v7);
  sub_259DAD3BC((uint64_t)v10);
  uint64_t v12 = v2 + OBJC_IVAR___SwiftVideoProcessor_bufferConstants;
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v12 + 6) = v11;
  return result;
}

uint64_t sub_259DAD3BC(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_259DAD3CC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

unint64_t sub_259DAD408()
{
  unint64_t result = qword_26A3F2668;
  if (!qword_26A3F2668)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A3F2668);
  }
  return result;
}

unint64_t sub_259DAD448()
{
  unint64_t result = qword_26A3F2670;
  if (!qword_26A3F2670)
  {
    sub_259DAD408();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F2670);
  }
  return result;
}

uint64_t sub_259DAD494(__IOSurface *a1)
{
  signed int PixelFormat = IOSurfaceGetPixelFormat(a1);
  uint64_t result = 508;
  if (PixelFormat <= 1380401728)
  {
    if (PixelFormat <= 645166643)
    {
      if (PixelFormat > 645166639)
      {
        if (PixelFormat == 645166640) {
          return 580;
        }
        if (PixelFormat == 645166642) {
          return 581;
        }
        return 70;
      }
      if (PixelFormat != 641230384 && PixelFormat != 641234480) {
        return 70;
      }
    }
    else
    {
      if (PixelFormat <= 875704421)
      {
        if (PixelFormat == 645166644) {
          return 582;
        }
        int v3 = 645428784;
LABEL_25:
        if (PixelFormat == v3) {
          return result;
        }
        return 70;
      }
      if (PixelFormat != 875704422 && PixelFormat != 875704438)
      {
        if (PixelFormat == 1111970369) {
          return 80;
        }
        return 70;
      }
    }
    return 500;
  }
  if (PixelFormat > 1953903151)
  {
    if (PixelFormat <= 1999843441)
    {
      if (PixelFormat == 1953903152) {
        return 570;
      }
      if (PixelFormat == 1953903154) {
        return 571;
      }
      return 70;
    }
    if (PixelFormat == 1999843442) {
      return 554;
    }
    if (PixelFormat == 2016686640) {
      return 505;
    }
    int v3 = 2019963440;
    goto LABEL_25;
  }
  if (PixelFormat <= 1815162993)
  {
    if (PixelFormat == 1380411457) {
      return 115;
    }
    return 70;
  }
  if (PixelFormat == 1815162994) {
    return 94;
  }
  if (PixelFormat != 1882468912)
  {
    int v3 = 1885745712;
    goto LABEL_25;
  }
  return result;
}

uint64_t sub_259DAD6DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F26D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_259DAD744(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F26D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_259DAD7A4()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_259DAD7DC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_259DAD81C()
{
  uint64_t v1 = *(void *)(v0 + 16) + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x25A2EB670](v1);
  if (v2)
  {
    int v3 = (char *)v2;
    uint64_t v4 = v2 + OBJC_IVAR___SwiftVideoProcessor_bufferConstants;
    swift_beginAccess();
    char v5 = *(unsigned char *)(v4 + 4);
    char v6 = *(unsigned char *)(v4 + 5);
    char v7 = *(unsigned char *)(v4 + 6);
    char v8 = *(unsigned char *)(v4 + 7);
    char v9 = *(unsigned char *)(v4 + 8);
    char v10 = *(unsigned char *)(v4 + 9);
    uint64_t v11 = *(void *)(v4 + 40);
    char v12 = *(unsigned char *)(v4 + 48);
    int v13 = *(_DWORD *)(v4 + 52);
    int v27 = *(_DWORD *)v4;
    char v28 = v5;
    char v29 = v6;
    char v30 = v7;
    char v31 = v8;
    char v32 = v9;
    char v33 = v10;
    uint64_t v34 = *(void *)(v4 + 12);
    long long v35 = *(_OWORD *)(v4 + 20);
    uint64_t v36 = v11;
    char v37 = v12;
    int v38 = v13;
    if (!IncludesDebugInfo((uint64_t)&v27)) {
      goto LABEL_10;
    }
    if (v10) {
      goto LABEL_10;
    }
    id v14 = *(void **)&v3[OBJC_IVAR___SwiftVideoProcessor_bufferDataDebug];
    if (!v14) {
      goto LABEL_10;
    }
    id v15 = (float *)objc_msgSend((id)swift_unknownObjectRetain(), sel_contents);
    id v16 = v14;
    if (*(unsigned char *)(v4 + 5) != 1)
    {
LABEL_8:
      id v21 = &v3[OBJC_IVAR___SwiftVideoProcessor_validationCallback];
      swift_beginAccess();
      id v22 = *(void (**)(uint64_t, double, double, double))v21;
      if (*(void *)v21)
      {
        double v23 = *v15;
        double v24 = v15[7];
        double v25 = v15[8] * 100.0;
        uint64_t v26 = swift_retain();
        v22(v26, v23, v24, v25);
        sub_259DAD3BC((uint64_t)v22);
      }
LABEL_10:
      sub_259DAF6C0();

      return;
    }
    if (PSELog)
    {
      id v17 = (id)PSELog;
      sub_259DAF690();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F2660);
      uint64_t v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_259DB0520;
      uint64_t v19 = MEMORY[0x263F8D5C8];
      uint64_t v20 = MEMORY[0x263F8D648];
      *(void *)(v18 + 56) = MEMORY[0x263F8D5C8];
      *(void *)(v18 + 64) = v20;
      *(float *)(v18 + 32) = *v15;
      *(void *)(v18 + 96) = v19;
      *(void *)(v18 + 104) = v20;
      *(float *)(v18 + 72) = v15[1];
      *(void *)(v18 + 136) = v19;
      *(void *)(v18 + 144) = v20;
      *(float *)(v18 + 112) = v15[2];
      *(void *)(v18 + 176) = v19;
      *(void *)(v18 + 184) = v20;
      *(float *)(v18 + 152) = v15[3];
      *(void *)(v18 + 216) = v19;
      *(void *)(v18 + 224) = v20;
      *(float *)(v18 + 192) = v15[4];
      *(void *)(v18 + 256) = v19;
      *(void *)(v18 + 264) = v20;
      *(float *)(v18 + 232) = v15[5];
      *(void *)(v18 + 296) = v19;
      *(void *)(v18 + 304) = v20;
      *(float *)(v18 + 272) = v15[6];
      *(void *)(v18 + 336) = v19;
      *(void *)(v18 + 344) = v20;
      *(float *)(v18 + 312) = v15[7];
      *(void *)(v18 + 376) = v19;
      *(void *)(v18 + 384) = v20;
      *(float *)(v18 + 352) = v15[13];
      *(void *)(v18 + 416) = v19;
      *(void *)(v18 + 424) = v20;
      *(float *)(v18 + 392) = v15[8];
      *(void *)(v18 + 456) = v19;
      *(void *)(v18 + 464) = v20;
      *(float *)(v18 + 432) = v15[11];
      *(void *)(v18 + 496) = v19;
      *(void *)(v18 + 504) = v20;
      *(float *)(v18 + 472) = v15[12];
      *(void *)(v18 + 536) = v19;
      *(void *)(v18 + 544) = v20;
      *(float *)(v18 + 512) = v15[9];
      *(void *)(v18 + 576) = v19;
      *(void *)(v18 + 584) = v20;
      *(float *)(v18 + 552) = v15[10];
      sub_259DAF5E0();
      swift_bridgeObjectRelease();

      goto LABEL_8;
    }
    __break(1u);
  }
  else
  {
    sub_259DAF6C0();
  }
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t type metadata accessor for VideoProcessor()
{
  return self;
}

uint64_t destroy for VideoProcessor.KernelData()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s26PhotosensitivityProcessing14VideoProcessorC10KernelDataVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for VideoProcessor.KernelData(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for VideoProcessor.KernelData(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for VideoProcessor.KernelData(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for VideoProcessor.KernelData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VideoProcessor.KernelData()
{
  return &type metadata for VideoProcessor.KernelData;
}

void *initializeBufferWithCopyOfBuffer for VideoProcessor.ArrayData(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for VideoProcessor.ArrayData()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for VideoProcessor.ArrayData(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for VideoProcessor.ArrayData(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for VideoProcessor.ArrayData(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for VideoProcessor.ArrayData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VideoProcessor.ArrayData()
{
  return &type metadata for VideoProcessor.ArrayData;
}

uint64_t sub_259DADE60(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_259DADEB4(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 56)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 4);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t sub_259DADF08(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 56) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 56) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 4) = a2 + 1;
    }
  }
  return result;
}

void type metadata accessor for ConstBuf(uint64_t a1)
{
}

void type metadata accessor for IOSurfaceProtectionOptions(uint64_t a1)
{
}

void sub_259DADF80(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_259DADFC8()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_259DAE000()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_259DAE010(double a1, double a2, double a3)
{
  uint64_t v4 = *(uint64_t (**)(double *, double *, double *))(v3 + 16);
  double v7 = a2;
  double v8 = a1;
  double v6 = a3;
  return v4(&v8, &v7, &v6);
}

unint64_t sub_259DAE054()
{
  unint64_t result = qword_26A3F2990;
  if (!qword_26A3F2990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F2990);
  }
  return result;
}

BOOL IncludesDebugInfo(uint64_t a1)
{
  return *(unsigned char *)(a1 + 6) || *(unsigned char *)(a1 + 5) != 0;
}

uint64_t MTLSizeMake@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  a3[2] = 1;
  return result;
}

uint64_t sub_259DAE0D0(double *a1, double *a2, double *a3)
{
  return (*(uint64_t (**)(double, double, double))(v3 + 16))(*a1, *a2, *a3);
}

uint64_t sub_259DAE11C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_259DAE154(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 48) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_259DAE19C())()
{
  return j__swift_endAccess;
}

uint64_t sub_259DAE1F0()
{
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_259DB07D0;
  *(_OWORD *)(v0 + 32) = xmmword_259DB07E0;
  uint64_t v1 = sub_259DAF650();
  *(void *)(v1 + 16) = 10;
  *(_OWORD *)(v1 + 32) = 0u;
  *(_OWORD *)(v1 + 48) = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  *(_OWORD *)(v1 + 80) = 0u;
  *(_OWORD *)(v1 + 96) = 0u;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F2B40);
  uint64_t v2 = (void *)sub_259DAF650();
  v2[2] = 7;
  v2[4] = v1;
  v2[5] = v1;
  v2[6] = v1;
  v2[7] = v1;
  v2[8] = v1;
  v2[9] = v1;
  v2[10] = v1;
  swift_bridgeObjectRetain_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F2B48);
  uint64_t v3 = (void *)sub_259DAF650();
  v3[2] = 5;
  v3[4] = v2;
  v3[5] = v2;
  v3[6] = v2;
  v3[7] = v2;
  v3[8] = v2;
  swift_bridgeObjectRetain_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F2B50);
  uint64_t v4 = (void *)sub_259DAF650();
  v4[2] = 3;
  v4[4] = v3;
  v4[5] = v3;
  v4[6] = v3;
  *(void *)(v0 + 48) = v4;
  swift_bridgeObjectRetain_n();
  sub_259DAE324();
  return v0;
}

void sub_259DAE324()
{
  uint64_t v1 = v0;
  type metadata accessor for VideoProcessor();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v4 = (void *)sub_259DAF5F0();
  int v5 = (void *)sub_259DAF5F0();
  id v6 = objc_msgSend(v3, sel_pathForResource_ofType_, v4, v5);

  if (!v6) {
    return;
  }
  uint64_t v7 = sub_259DAF610();
  uint64_t v9 = v8;

  id v10 = objc_allocWithZone(MEMORY[0x263F08B48]);
  id v11 = sub_259DAEAE8(v7, v9, 1);
  if (!v11) {
    return;
  }
  uint64_t v54 = 0;
  id v12 = v11;
  int v13 = (void *)sub_259DAF5F0();
  id v14 = objc_msgSend(v12, sel_componentsSeparatedByString_, v13);

  uint64_t v15 = sub_259DAF630();
  uint64_t v61 = *(void *)(v15 + 16);
  if (!v61) {
    goto LABEL_52;
  }
  id v53 = v12;
  uint64_t v16 = 0;
  unint64_t v17 = 0;
  uint64_t v18 = (uint64_t (**)(uint64_t *))(*v1 + 136);
  uint64_t v60 = *v18;
  id v59 = v18;
  uint64_t v58 = v15 + 32;
  uint64_t v56 = v1;
  uint64_t v55 = v15;
  do
  {
    unint64_t v19 = 0;
    uint64_t v57 = v16;
    while (1)
    {
      unint64_t v20 = 0;
      unint64_t v62 = v19;
      while (1)
      {
        if (v17 >= *(void *)(v15 + 16))
        {
          __break(1u);
LABEL_55:
          __break(1u);
LABEL_56:
          __break(1u);
LABEL_57:
          __break(1u);
          __break(1u);
          return;
        }
        unint64_t v65 = v20;
        uint64_t v21 = *(void *)(v58 + 16 * v17 + 8);
        uint64_t v67 = *(void *)(v58 + 16 * v17);
        uint64_t v68 = v21;
        uint64_t v71 = 44;
        unint64_t v72 = 0xE100000000000000;
        unint64_t v66 = sub_259DAED94();
        uint64_t v22 = sub_259DAF6D0();
        int64_t v23 = *(void *)(v22 + 16);
        if (v23)
        {
          unint64_t v64 = v17;
          uint64_t v71 = MEMORY[0x263F8EE78];
          sub_259DAEDE8(0, v23, 0);
          uint64_t v24 = sub_259DAF5C0();
          uint64_t v25 = *(void *)(*(void *)(v24 - 8) + 64);
          uint64_t v26 = (uint64_t (**)(char *, uint64_t))(*(void *)(v24 - 8) + 8);
          uint64_t v63 = v22;
          int v27 = (uint64_t *)(v22 + 40);
          while (1)
          {
            uint64_t v28 = *v27;
            uint64_t v67 = *(v27 - 1);
            uint64_t v68 = v28;
            ((void (*)(void))MEMORY[0x270FA5388])();
            swift_bridgeObjectRetain();
            sub_259DAF5B0();
            uint64_t v29 = sub_259DAF6E0();
            uint64_t v31 = v30;
            uint64_t v32 = (*v26)((char *)&v53 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0), v24);
            double v70 = 0.0;
            MEMORY[0x270FA5388](v32);
            if ((v31 & 0x1000000000000000) != 0)
            {
LABEL_30:
              uint64_t v39 = v54;
              sub_259DAF700();
              uint64_t v54 = v39;
              goto LABEL_21;
            }
            if ((v31 & 0x2000000000000000) != 0)
            {
              uint64_t v67 = v29;
              uint64_t v68 = v31 & 0xFFFFFFFFFFFFFFLL;
              if v29 <= 0x20u && ((0x100003E01uLL >> v29)) {
                goto LABEL_20;
              }
            }
            else
            {
              if ((v29 & 0x1000000000000000) == 0) {
                goto LABEL_30;
              }
              unint64_t v33 = *(unsigned __int8 *)((v31 & 0xFFFFFFFFFFFFFFFLL) + 0x20);
              if (v33 < 0x21 && ((0x100003E01uLL >> v33) & 1) != 0)
              {
LABEL_20:
                BOOL v69 = 0;
                goto LABEL_21;
              }
            }
            uint64_t v34 = (unsigned char *)_swift_stdlib_strtod_clocale();
            if (!v34) {
              goto LABEL_20;
            }
            BOOL v69 = *v34 == 0;
LABEL_21:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v69) {
              double v35 = v70;
            }
            else {
              double v35 = 0.0;
            }
            uint64_t v36 = v71;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_259DAEDE8(0, *(void *)(v36 + 16) + 1, 1);
              uint64_t v36 = v71;
            }
            unint64_t v38 = *(void *)(v36 + 16);
            unint64_t v37 = *(void *)(v36 + 24);
            if (v38 >= v37 >> 1)
            {
              sub_259DAEDE8((char *)(v37 > 1), v38 + 1, 1);
              uint64_t v36 = v71;
            }
            v27 += 2;
            *(void *)(v36 + 16) = v38 + 1;
            *(double *)(v36 + 8 * v38 + 32) = v35;
            if (!--v23)
            {
              swift_bridgeObjectRelease();
              uint64_t v15 = v55;
              unint64_t v17 = v64;
              uint64_t v16 = v57;
              goto LABEL_32;
            }
          }
        }
        swift_bridgeObjectRelease();
        uint64_t v36 = MEMORY[0x263F8EE78];
LABEL_32:
        uint64_t v40 = (void (*)(uint64_t *, void))v60(&v67);
        uint64_t v42 = v41;
        uint64_t v43 = *v41;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *uint64_t v42 = v43;
        unint64_t v45 = v62;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          uint64_t v43 = sub_259DAEC34(v43);
          *uint64_t v42 = v43;
        }
        if (v16 >= v43[2]) {
          goto LABEL_55;
        }
        id v46 = v43 + 4;
        id v47 = (void *)v43[v16 + 4];
        char v48 = swift_isUniquelyReferenced_nonNull_native();
        v46[v16] = v47;
        if ((v48 & 1) == 0)
        {
          id v47 = sub_259DAEBFC(v47);
          v46[v16] = v47;
        }
        if (v45 >= v47[2]) {
          goto LABEL_56;
        }
        uint64_t v49 = v47 + 4;
        id v50 = (void *)v47[v45 + 4];
        char v51 = swift_isUniquelyReferenced_nonNull_native();
        v49[v45] = v50;
        if ((v51 & 1) == 0)
        {
          id v50 = sub_259DAEBC4(v50);
          v49[v45] = v50;
        }
        unint64_t v52 = v65;
        if (v65 >= v50[2]) {
          goto LABEL_57;
        }
        ++v17;
        v50[v65 + 4] = v36;
        swift_bridgeObjectRelease();
        v40(&v67, 0);
        if (v52 == 6) {
          break;
        }
        unint64_t v20 = v52 + 1;
        if (v17 == v61) {
          goto LABEL_51;
        }
      }
      if (v45 == 4) {
        break;
      }
      unint64_t v19 = v45 + 1;
      if (v17 == v61) {
        goto LABEL_51;
      }
    }
    if (v16 > 1) {
      uint64_t v16 = 0;
    }
    else {
      ++v16;
    }
  }
  while (v17 != v61);
LABEL_51:
  id v12 = v53;
LABEL_52:

  swift_bridgeObjectRelease();
}

uint64_t sub_259DAEAB0()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 56, 7);
}

id sub_259DAEAE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  int v5 = (void *)sub_259DAF5F0();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  id v6 = objc_msgSend(v3, sel_initWithContentsOfFile_encoding_error_, v5, a3, v10);

  if (v6)
  {
    id v7 = v10[0];
  }
  else
  {
    id v8 = v10[0];
    sub_259DAF5D0();

    swift_willThrow();
  }
  return v6;
}

void *sub_259DAEBC4(void *a1)
{
  return sub_259DAEC6C(0, a1[2], 0, a1, &qword_26A3F2B60, &qword_26A3F2B40);
}

void *sub_259DAEBFC(void *a1)
{
  return sub_259DAEC6C(0, a1[2], 0, a1, &qword_26A3F2B68, &qword_26A3F2B48);
}

void *sub_259DAEC34(void *a1)
{
  return sub_259DAEC6C(0, a1[2], 0, a1, (uint64_t *)&unk_26A3F2B70, &qword_26A3F2B50);
}

void *sub_259DAEC6C(void *result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    int v13 = (void *)swift_allocObject();
    int64_t v14 = _swift_stdlib_malloc_size(v13);
    uint64_t v15 = v14 - 32;
    if (v14 < 32) {
      uint64_t v15 = v14 - 25;
    }
    v13[2] = v11;
    v13[3] = 2 * (v15 >> 3);
  }
  else
  {
    int v13 = (void *)MEMORY[0x263F8EE78];
  }
  if (v8)
  {
    if (v13 != a4 || v13 + 4 >= &a4[v11 + 4]) {
      memmove(v13 + 4, a4 + 4, 8 * v11);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v13;
}

unint64_t sub_259DAED94()
{
  unint64_t result = qword_26A3F2B58;
  if (!qword_26A3F2B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F2B58);
  }
  return result;
}

char *sub_259DAEDE8(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_259DAEE9C(a1, a2, a3, *v3);
  void *v3 = result;
  return result;
}

unsigned char *sub_259DAEE08@<X0>(unsigned char *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3 = *result;
  BOOL v4 = v3 > 0x20;
  uint64_t v5 = (1 << v3) & 0x100003E01;
  BOOL v6 = v4 || v5 == 0;
  v7 = v6 && (unint64_t result = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

uint64_t type metadata accessor for UMFKernels()
{
  return self;
}

char *sub_259DAEE9C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F29A8);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  int v13 = v10 + 32;
  int64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

uint64_t sub_259DAF5B0()
{
  return MEMORY[0x270EEE180]();
}

uint64_t sub_259DAF5C0()
{
  return MEMORY[0x270EEE250]();
}

uint64_t sub_259DAF5D0()
{
  return MEMORY[0x270EEF838]();
}

uint64_t sub_259DAF5E0()
{
  return MEMORY[0x270FA2C70]();
}

uint64_t sub_259DAF5F0()
{
  return MEMORY[0x270EF19A8]();
}

uint64_t sub_259DAF600()
{
  return MEMORY[0x270EF19D8]();
}

uint64_t sub_259DAF610()
{
  return MEMORY[0x270EF19F0]();
}

uint64_t sub_259DAF620()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_259DAF630()
{
  return MEMORY[0x270EF1BB0]();
}

uint64_t sub_259DAF640()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_259DAF650()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_259DAF660()
{
  return MEMORY[0x270FA2E48]();
}

uint64_t sub_259DAF670()
{
  return MEMORY[0x270FA2E50]();
}

uint64_t sub_259DAF680()
{
  return MEMORY[0x270FA2E68]();
}

uint64_t sub_259DAF690()
{
  return MEMORY[0x270FA2E88]();
}

uint64_t sub_259DAF6A0()
{
  return MEMORY[0x270FA10B0]();
}

uint64_t sub_259DAF6B0()
{
  return MEMORY[0x270FA0F18]();
}

uint64_t sub_259DAF6C0()
{
  return MEMORY[0x270FA0F20]();
}

uint64_t sub_259DAF6D0()
{
  return MEMORY[0x270EF23E0]();
}

uint64_t sub_259DAF6E0()
{
  return MEMORY[0x270EF2480]();
}

uint64_t sub_259DAF6F0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_259DAF700()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_259DAF710()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_259DAF720()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_259DAF730()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_259DAF740()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_259DAF750()
{
  return MEMORY[0x270EF2688]();
}

uint64_t sub_259DAF760()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_259DAF770()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_259DAF780()
{
  return MEMORY[0x270F9FC90]();
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CGColorSpaceCopyName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x270EE5C38](space);
}

CGColorSpaceRef CGColorSpaceCreateWithICCData(CFTypeRef data)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C98](data);
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CB8](plist);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x270EE5D10](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x270EF4C20](buffer, key);
}

uint64_t IOSurfaceGetBulkAttachments()
{
  return MEMORY[0x270EF4C90]();
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D48](buffer);
}

size_t IOSurfaceGetHeightOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x270EF4D58](buffer, planeIndex);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D80](buffer);
}

uint64_t IOSurfaceGetProtectionOptions()
{
  return MEMORY[0x270EF4DA0]();
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4DE0](buffer);
}

size_t IOSurfaceGetWidthOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x270EF4DF0](buffer, planeIndex);
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E20]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x270FA0170]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

float expf(float a1)
{
  MEMORY[0x270ED9870](a1);
  return result;
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD00](a1, a2);
  return result;
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x270FA0298]();
}

uint64_t swift_dynamicCastObjCProtocolUnconditional()
{
  return MEMORY[0x270FA02A0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}