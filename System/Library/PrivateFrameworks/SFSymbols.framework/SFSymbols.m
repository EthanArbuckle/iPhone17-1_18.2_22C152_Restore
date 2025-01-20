unint64_t sub_22D3194A0(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(void *)(a1 + 16))
  {
    v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD77EB0);
  v2 = (void *)sub_22D34B928();
  v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v8 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_22D3195C4(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (void *)(v2[7] + 16 * result);
    *v12 = v8;
    v12[1] = v7;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
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

unint64_t sub_22D3195C4(uint64_t a1, uint64_t a2)
{
  sub_22D34BA48();
  sub_22D34B778();
  uint64_t v4 = sub_22D34BA78();
  return sub_22D31963C(a1, a2, v4);
}

unint64_t sub_22D31963C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_22D34B9A8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_22D34B9A8() & 1) == 0);
    }
  }
  return v6;
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

SFSSymbolAssetInfo *SFSResolveNameAndStatus(void *a1, void *a2, int a3)
{
  id v5 = a1;
  if ([a2 integerValue] != 1)
  {
    uint64_t v12 = [SFSSymbolAssetInfo alloc];
    v7 = +[SFSCoreGlyphsBundle public];
    v8 = v12;
    id v9 = v5;
    v10 = v7;
    uint64_t v11 = 0;
    goto LABEL_5;
  }
  if (a3)
  {
    unint64_t v6 = [SFSSymbolAssetInfo alloc];
    v7 = +[SFSCoreGlyphsBundle private];
    v8 = v6;
    id v9 = v5;
    v10 = v7;
    uint64_t v11 = 1;
LABEL_5:
    v13 = [(SFSSymbolAssetInfo *)v8 initWithName:v9 bundle:v10 andType:v11];

    goto LABEL_7;
  }
  v13 = 0;
LABEL_7:

  return v13;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t libAppleArchiveLibrary()
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v0 = libAppleArchiveLibraryCore_frameworkLibrary;
  uint64_t v9 = libAppleArchiveLibraryCore_frameworkLibrary;
  if (!libAppleArchiveLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __libAppleArchiveLibraryCore_block_invoke;
    v3[4] = &unk_26493C678;
    uint64_t v4 = &v6;
    id v5 = v3;
    long long v10 = xmmword_26493C658;
    uint64_t v11 = 0;
    v7[3] = _sl_dlopen();
    libAppleArchiveLibraryCore_frameworkLibrary = *(void *)(v4[1] + 24);
    uint64_t v0 = v7[3];
  }
  _Block_object_dispose(&v6, 8);
  uint64_t v1 = v3[0];
  if (!v0)
  {
    uint64_t v1 = (void *)abort_report_np();
    __break(1u);
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void sub_22D31A50C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_AAByteStreamClose(uint64_t a1)
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v2 = (uint64_t (*)(uint64_t))getAAByteStreamCloseSymbolLoc_ptr;
  long long v10 = getAAByteStreamCloseSymbolLoc_ptr;
  if (!getAAByteStreamCloseSymbolLoc_ptr)
  {
    long long v3 = (void *)libAppleArchiveLibrary();
    v8[3] = (uint64_t)dlsym(v3, "AAByteStreamClose");
    getAAByteStreamCloseSymbolLoc_ptr = (_UNKNOWN *)v8[3];
    v2 = (uint64_t (*)(uint64_t))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    +[SFSDirectoryCompressor compressDirectoryAtURL:intoURL:withDenylist:error:]();
    uint64_t v6 = v5;
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v6);
  }
  return v2(a1);
}

uint64_t soft_AAArchiveStreamClose(uint64_t a1)
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v2 = (uint64_t (*)(uint64_t))getAAArchiveStreamCloseSymbolLoc_ptr;
  long long v10 = getAAArchiveStreamCloseSymbolLoc_ptr;
  if (!getAAArchiveStreamCloseSymbolLoc_ptr)
  {
    long long v3 = (void *)libAppleArchiveLibrary();
    v8[3] = (uint64_t)dlsym(v3, "AAArchiveStreamClose");
    getAAArchiveStreamCloseSymbolLoc_ptr = (_UNKNOWN *)v8[3];
    v2 = (uint64_t (*)(uint64_t))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    +[SFSDirectoryCompressor compressDirectoryAtURL:intoURL:withDenylist:error:]();
    uint64_t v6 = v5;
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v6);
  }
  return v2(a1);
}

uint64_t soft_AAFileStreamOpenWithPath(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))getAAFileStreamOpenWithPathSymbolLoc_ptr;
  uint64_t v12 = getAAFileStreamOpenWithPathSymbolLoc_ptr;
  if (!getAAFileStreamOpenWithPathSymbolLoc_ptr)
  {
    id v5 = (void *)libAppleArchiveLibrary();
    v10[3] = (uint64_t)dlsym(v5, "AAFileStreamOpenWithPath");
    getAAFileStreamOpenWithPathSymbolLoc_ptr = (_UNKNOWN *)v10[3];
    uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v4)
  {
    +[SFSDirectoryCompressor compressDirectoryAtURL:intoURL:withDenylist:error:]();
    uint64_t v8 = v7;
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(v8);
  }
  return v4(a1, a2, 420);
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

unint64_t sub_22D31A864()
{
  unint64_t result = sub_22D3194A0((uint64_t)&unk_26E0AC5A0);
  qword_26AD77E48 = result;
  return result;
}

uint64_t private_nofill_to_fill.getter()
{
  if (qword_26AD77E50 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

void sub_22D31A8E8()
{
  qword_26AD77E68 = (uint64_t)&unk_26E0A78C0;
}

uint64_t private_symbol_order.getter()
{
  if (qword_26AD77E70 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

unint64_t sub_22D31A958()
{
  unint64_t result = sub_22D3194A0((uint64_t)&unk_26E0A6B00);
  qword_26AD77E60 = result;
  return result;
}

uint64_t private_name_aliases.getter()
{
  if (qword_26AD77E58 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

unint64_t sub_22D31A9DC()
{
  unint64_t result = sub_22D3194A0((uint64_t)&unk_26E091D38);
  qword_26AD77E88 = result;
  return result;
}

uint64_t nofill_to_fill.getter()
{
  if (qword_26AD77E90 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

void sub_22D31AA60()
{
  qword_26AD77EA8 = (uint64_t)&unk_26E074AB8;
}

uint64_t symbol_order.getter()
{
  if (qword_26AD77EA0 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

unint64_t sub_22D31AAD0()
{
  unint64_t result = sub_22D3194A0((uint64_t)&unk_26E06D958);
  qword_26AD77E98 = result;
  return result;
}

uint64_t name_aliases.getter()
{
  if (qword_26AD77E80 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

BOOL filter_denylist(void *a1, uint64_t a2, uint64_t a3)
{
  id v4 = a1;
  id v5 = [NSURL fileURLWithFileSystemRepresentation:a3 isDirectory:0 relativeToURL:0];
  uint64_t v6 = [v5 lastPathComponent];
  BOOL v7 = v6 && ([v4 containsObject:v6] & 1) != 0;

  return v7;
}

void *__getAAFileStreamOpenWithPathSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)libAppleArchiveLibrary();
  unint64_t result = dlsym(v2, "AAFileStreamOpenWithPath");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAAFileStreamOpenWithPathSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __libAppleArchiveLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  libAppleArchiveLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAACompressionOutputStreamOpenSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)libAppleArchiveLibrary();
  uint64_t result = dlsym(v2, "AACompressionOutputStreamOpen");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAACompressionOutputStreamOpenSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAAByteStreamCloseSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)libAppleArchiveLibrary();
  uint64_t result = dlsym(v2, "AAByteStreamClose");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAAByteStreamCloseSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAAEncodeArchiveOutputStreamOpenSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)libAppleArchiveLibrary();
  uint64_t result = dlsym(v2, "AAEncodeArchiveOutputStreamOpen");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAAEncodeArchiveOutputStreamOpenSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAAFieldKeySetCreateWithStringSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)libAppleArchiveLibrary();
  uint64_t result = dlsym(v2, "AAFieldKeySetCreateWithString");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAAFieldKeySetCreateWithStringSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAAArchiveStreamCloseSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)libAppleArchiveLibrary();
  uint64_t result = dlsym(v2, "AAArchiveStreamClose");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAAArchiveStreamCloseSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAAPathListCreateWithDirectoryContentsSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)libAppleArchiveLibrary();
  uint64_t result = dlsym(v2, "AAPathListCreateWithDirectoryContents");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAAPathListCreateWithDirectoryContentsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAAArchiveStreamWritePathListSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)libAppleArchiveLibrary();
  uint64_t result = dlsym(v2, "AAArchiveStreamWritePathList");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAAArchiveStreamWritePathListSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAAPathListDestroySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)libAppleArchiveLibrary();
  uint64_t result = dlsym(v2, "AAPathListDestroy");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAAPathListDestroySymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAADecompressionInputStreamOpenSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)libAppleArchiveLibrary();
  uint64_t result = dlsym(v2, "AADecompressionInputStreamOpen");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAADecompressionInputStreamOpenSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAADecodeArchiveInputStreamOpenSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)libAppleArchiveLibrary();
  uint64_t result = dlsym(v2, "AADecodeArchiveInputStreamOpen");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAADecodeArchiveInputStreamOpenSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAAExtractArchiveOutputStreamOpenSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)libAppleArchiveLibrary();
  uint64_t result = dlsym(v2, "AAExtractArchiveOutputStreamOpen");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAAExtractArchiveOutputStreamOpenSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAAArchiveStreamProcessSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)libAppleArchiveLibrary();
  uint64_t result = dlsym(v2, "AAArchiveStreamProcess");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAAArchiveStreamProcessSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id resolveNumeralForLocale(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 numberingSystem];
  id v5 = [v3 objectForKeyedSubscript:v4];

  return v5;
}

id resolveLanguageForLocale(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 languageCode];
  id v5 = [v3 objectForKeyedSubscript:v4];

  return v5;
}

__CFString *directionLookupKey(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x263EFF960];
  v2 = [a1 languageCode];
  uint64_t v3 = [v1 characterDirectionForLanguage:v2];

  if (v3 == 2) {
    return @"rtl";
  }
  else {
    return 0;
  }
}

id resolveDirectionForLocale(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = directionLookupKey(a2);
  if (v4)
  {
    id v5 = [v3 objectForKeyedSubscript:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

uint64_t sub_22D31BA94()
{
  uint64_t v0 = sub_22D34B538();
  __swift_allocate_value_buffer(v0, qword_2685684A8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2685684A8);
  return sub_22D34B4F8();
}

uint64_t sub_22D31BAEC()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for CSVDecoder()
{
  return self;
}

void *sub_22D31BB20()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F08B08]);
  swift_bridgeObjectRetain();
  uint64_t v1 = (void *)sub_22D34B708();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithString_, v1);

  objc_msgSend(v2, sel_setCharactersToBeSkipped_, 0);
  id v3 = (void *)MEMORY[0x263F8EE78];
  id v4 = (char *)MEMORY[0x263F8EE78];
  while (1)
  {
    if ((objc_msgSend(v2, sel_isAtEnd, v28, v29) & 1) == 0)
    {
      sub_22D34B828();
      uint64_t v6 = v5;
      swift_bridgeObjectRelease();
      if (!v6)
      {
        sub_22D34B828();
        uint64_t v8 = v7;
        swift_bridgeObjectRelease();
        if (!v8)
        {
          sub_22D34B828();
          if (!v9) {
            goto LABEL_12;
          }
          swift_bridgeObjectRelease();
        }
      }
    }
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      id v3 = sub_22D344174(0, v3[2] + 1, 1, v3);
    }
    unint64_t v11 = v3[2];
    unint64_t v10 = v3[3];
    if (v11 >= v10 >> 1) {
      id v3 = sub_22D344174((void *)(v10 > 1), v11 + 1, 1, v3);
    }
    v3[2] = v11 + 1;
    v3[v11 + 4] = v4;
    swift_bridgeObjectRelease();
    id v4 = (char *)MEMORY[0x263F8EE78];
LABEL_12:
    if (objc_msgSend(v2, sel_isAtEnd)) {
      break;
    }
    while (1)
    {
      sub_22D34B828();
      uint64_t v13 = v12;
      swift_bridgeObjectRelease();
      if (v13)
      {
        uint64_t v28 = 0;
        unint64_t v29 = 0xE000000000000000;
        do
        {
          while (1)
          {
            sub_22D34B838();
            sub_22D34B788();
            swift_bridgeObjectRelease();
            sub_22D34B828();
            uint64_t v15 = v14;
            swift_bridgeObjectRelease();
            if (!v15) {
              break;
            }
            sub_22D34B788();
          }
          sub_22D34B828();
          uint64_t v17 = v16;
          swift_bridgeObjectRelease();
        }
        while (!v17);
        uint64_t v18 = 0;
        unint64_t v19 = 0xE000000000000000;
      }
      else
      {
        if (qword_2685684A0 != -1) {
          swift_once();
        }
        uint64_t v20 = sub_22D34B538();
        __swift_project_value_buffer(v20, (uint64_t)qword_2685684A8);
        uint64_t v21 = sub_22D34B848();
        uint64_t v18 = v22 ? v21 : 0;
        unint64_t v19 = v22 ? v22 : 0xE000000000000000;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        id v4 = sub_22D344070(0, *((void *)v4 + 2) + 1, 1, v4);
      }
      unint64_t v24 = *((void *)v4 + 2);
      unint64_t v23 = *((void *)v4 + 3);
      if (v24 >= v23 >> 1) {
        id v4 = sub_22D344070((char *)(v23 > 1), v24 + 1, 1, v4);
      }
      *((void *)v4 + 2) = v24 + 1;
      v25 = &v4[16 * v24];
      *((void *)v25 + 4) = v18;
      *((void *)v25 + 5) = v19;
      sub_22D34B828();
      if (!v26) {
        break;
      }
      swift_bridgeObjectRelease();
    }
  }

  swift_bridgeObjectRelease();
  return v3;
}

id sub_22D31BE84()
{
  type metadata accessor for BundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_26856ADE0 = (uint64_t)result;
  return result;
}

uint64_t SymbolCategory.Key.rawValue.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

SFSymbols::SymbolCategory::Key __swiftcall SymbolCategory.Key.init(rawValue:)(SFSymbols::SymbolCategory::Key rawValue)
{
  *uint64_t v1 = rawValue;
  return rawValue;
}

void static SymbolCategory.Key.all.getter(void *a1@<X8>)
{
  *a1 = 7105633;
  a1[1] = 0xE300000000000000;
}

void *sub_22D31BF24@<X0>(void *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t sub_22D31BF30@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_22D31BF3C()
{
  return sub_22D34BA78();
}

uint64_t sub_22D31BF98()
{
  swift_bridgeObjectRetain();
  sub_22D34B778();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22D31BFF0()
{
  return sub_22D34BA78();
}

uint64_t sub_22D31C048(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_22D34B9A8();
  }
}

uint64_t SymbolCategory.key.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t SymbolCategory.iconName.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SymbolCategory.localizedTitle.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_22D31C0E8()
{
  unint64_t result = qword_2685684D8;
  if (!qword_2685684D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685684D8);
  }
  return result;
}

uint64_t type metadata accessor for BundleClass()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for SymbolCategory(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SymbolCategory()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for SymbolCategory(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SymbolCategory(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void *assignWithTake for SymbolCategory(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SymbolCategory(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SymbolCategory(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SymbolCategory()
{
  return &type metadata for SymbolCategory;
}

void *initializeBufferWithCopyOfBuffer for SymbolCategory.Key(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for SymbolCategory.Key()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for SymbolCategory.Key(void *a1, void *a2)
{
  *a1 = *a2;
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

void *assignWithTake for SymbolCategory.Key(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SymbolCategory.Key(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SymbolCategory.Key(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SymbolCategory.Key()
{
  return &type metadata for SymbolCategory.Key;
}

BOOL sub_22D31C524(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_22D31C538()
{
  return sub_22D34BA78();
}

uint64_t sub_22D31C580()
{
  return sub_22D34BA58();
}

uint64_t sub_22D31C5AC()
{
  return sub_22D34BA78();
}

uint64_t sub_22D31C5F0()
{
  uint64_t v1 = 0x6572706D6F437369;
  if (*v0 != 1) {
    uint64_t v1 = 0x617A696C61636F6CLL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x656D616E656C6966;
  }
}

uint64_t sub_22D31C65C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_22D32C554(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_22D31C684()
{
  return 0;
}

void sub_22D31C690(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_22D31C69C(uint64_t a1)
{
  unint64_t v2 = sub_22D32F544();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_22D31C6D8(uint64_t a1)
{
  unint64_t v2 = sub_22D32F544();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_22D31C714@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685686E0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22D32EE94();
  sub_22D34BA98();
  if (!v2)
  {
    char v19 = 0;
    sub_22D32EEE8();
    sub_22D34B978();
    uint64_t v9 = v16;
    uint64_t v14 = v18;
    uint64_t v15 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685686F8);
    char v19 = 1;
    sub_22D32DC7C(&qword_268568700, &qword_2685686F8, (void (*)(void))sub_22D32EF3C);
    sub_22D34B978();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v11 = v15;
    uint64_t v10 = v16;
    *a2 = v9;
    a2[1] = v11;
    a2[2] = v14;
    a2[3] = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

double sub_22D31C924@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_22D32C6DC(a1, (uint64_t)v6);
  if (!v2)
  {
    double result = *(double *)v6;
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(void *)(a2 + 32) = v7;
  }
  return result;
}

BOOL sub_22D31C96C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_22D31C98C()
{
  if (*v0) {
    return 0x7365726F7473;
  }
  else {
    return 0x6E6F6973726576;
  }
}

uint64_t sub_22D31C9C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_22D32C918(a1, a2);
  *a3 = result;
  return result;
}

void sub_22D31C9EC(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_22D31C9F8(uint64_t a1)
{
  unint64_t v2 = sub_22D32EE94();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_22D31CA34(uint64_t a1)
{
  unint64_t v2 = sub_22D32EE94();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_22D31CA70@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_22D31C714(a1, a2);
}

uint64_t SymbolMetadataStore.load(from:)(uint64_t a1)
{
  type metadata accessor for DirectoryDecompressor();
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 16) = sub_22D3367D4;
  *(void *)(inited + 24) = 0;
  sub_22D31CB1C(a1, inited);
  swift_setDeallocating();
  return swift_release();
}

unint64_t sub_22D31CB1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (uint64_t)v3;
  uint64_t v5 = v2;
  uint64_t v81 = a2;
  uint64_t v7 = sub_22D34B638();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v73 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v73 - v15;
  sub_22D34B608();
  uint64_t v83 = sub_22D34B648();
  unint64_t v84 = v17;
  if (v3)
  {

    sub_22D31D53C(a1);
    sub_22D34B608();
    id v18 = objc_allocWithZone(MEMORY[0x263F086E0]);
    char v19 = (void *)sub_22D34B5E8();
    id v20 = objc_msgSend(v18, sel_initWithURL_, v19);

    *(void *)(v5 + 152) = v20;
    uint64_t v21 = *(void (**)(char *, uint64_t))(v8 + 8);
    v21(v14, v7);
    return ((uint64_t (*)(char *, uint64_t))v21)(v16, v7);
  }
  uint64_t v79 = v8;
  v76 = v11;
  uint64_t v100 = a1;
  uint64_t v87 = v7;
  v77 = v14;
  sub_22D34B5B8();
  swift_allocObject();
  sub_22D34B5A8();
  sub_22D32E16C();
  sub_22D34B598();
  unint64_t result = swift_release();
  uint64_t v75 = v2;
  v74 = 0;
  v88 = v16;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v85 = 0;
  uint64_t v86 = 0;
  uint64_t v80 = 0;
  uint64_t v82 = 0;
  uint64_t v25 = 0;
  int64_t v26 = 0;
  uint64_t v95 = v99;
  uint64_t v27 = 1 << *(unsigned char *)(v99 + 32);
  uint64_t v28 = -1;
  if (v27 < 64) {
    uint64_t v28 = ~(-1 << v27);
  }
  unint64_t v29 = v28 & *(void *)(v99 + 64);
  uint64_t v90 = v99 + 64;
  int64_t v91 = (unint64_t)(v27 + 63) >> 6;
  uint64_t v30 = v87;
LABEL_6:
  uint64_t v78 = v23;
  for (i = v4; v29; uint64_t v4 = i)
  {
    while (1)
    {
      unint64_t v31 = __clz(__rbit64(v29));
      v29 &= v29 - 1;
      unint64_t v32 = v31 | (v26 << 6);
LABEL_24:
      v37 = (uint64_t *)(*(void *)(v95 + 48) + 16 * v32);
      uint64_t v39 = *v37;
      v38 = (void *)v37[1];
      uint64_t v40 = *(void *)(v95 + 56) + 40 * v32;
      v41 = *(uint64_t **)v40;
      uint64_t v42 = *(void *)(v40 + 8);
      uint64_t v93 = *(unsigned __int8 *)(v40 + 16);
      v94 = v41;
      uint64_t v43 = *(void *)(v40 + 32);
      uint64_t v92 = *(void *)(v40 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v44._countAndFlagsBits = v39;
      v44._object = v38;
      unint64_t result = (unint64_t)Version.init(string:)(v44);
      if ((v99 & 1) == 0) {
        break;
      }
      swift_bridgeObjectRelease();
      unint64_t result = swift_bridgeObjectRelease();
      if (!v29) {
        goto LABEL_10;
      }
    }
    uint64_t v45 = v25;
    uint64_t v46 = v96;
    if (v96 <= 1)
    {
      uint64_t v48 = v97;
      uint64_t v47 = v98;
      if (!v86) {
        goto LABEL_40;
      }
      if (v85 == v96)
      {
        if (v82 == v97)
        {
          if (v80 < v98)
          {
            uint64_t v46 = v85;
            uint64_t v48 = v82;
            goto LABEL_39;
          }
        }
        else if (v82 < v97)
        {
          uint64_t v46 = v85;
LABEL_39:
          unint64_t result = sub_22D32E26C(v85, v82, v80, i, v86);
LABEL_40:
          uint64_t v23 = v92;
          uint64_t v24 = v93;
          uint64_t v85 = v46;
          uint64_t v86 = v42;
          uint64_t v4 = (uint64_t)v94;
          uint64_t v80 = v47;
          uint64_t v82 = v48;
          uint64_t v25 = v43;
          uint64_t v30 = v87;
          goto LABEL_6;
        }
      }
      else if (v85 < v96)
      {
        goto LABEL_39;
      }
      swift_bridgeObjectRelease();
      unint64_t result = swift_bridgeObjectRelease();
      uint64_t v30 = v87;
    }
    else
    {
      swift_bridgeObjectRelease();
      unint64_t result = swift_bridgeObjectRelease();
    }
    uint64_t v25 = v45;
  }
LABEL_10:
  int64_t v33 = v26 + 1;
  if (__OFADD__(v26, 1))
  {
    __break(1u);
    goto LABEL_49;
  }
  v34 = v88;
  if (v33 >= v91) {
    goto LABEL_41;
  }
  unint64_t v35 = *(void *)(v90 + 8 * v33);
  ++v26;
  if (v35) {
    goto LABEL_23;
  }
  int64_t v26 = v33 + 1;
  if (v33 + 1 >= v91) {
    goto LABEL_41;
  }
  unint64_t v35 = *(void *)(v90 + 8 * v26);
  if (v35) {
    goto LABEL_23;
  }
  int64_t v26 = v33 + 2;
  if (v33 + 2 >= v91) {
    goto LABEL_41;
  }
  unint64_t v35 = *(void *)(v90 + 8 * v26);
  if (v35)
  {
LABEL_23:
    unint64_t v29 = (v35 - 1) & v35;
    unint64_t v32 = __clz(__rbit64(v35)) + (v26 << 6);
    goto LABEL_24;
  }
  int64_t v36 = v33 + 3;
  if (v36 >= v91)
  {
LABEL_41:
    swift_release();
    uint64_t v49 = v86;
    if (v86)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v50 = (uint64_t)v77;
      uint64_t v51 = v24;
      uint64_t v100 = v25;
      sub_22D34B608();
      swift_bridgeObjectRelease();
      id v52 = objc_allocWithZone(MEMORY[0x263F086E0]);
      v53 = (void *)sub_22D34B5E8();
      id v54 = objc_msgSend(v52, sel_initWithURL_, v53);

      uint64_t v55 = v50;
      uint64_t v56 = v75;

      *(void *)(v56 + 152) = v54;
      uint64_t v86 = v49;
      v57 = *(void (**)(uint64_t, uint64_t))(v79 + 8);
      v57(v55, v30);
      if (v51)
      {
        uint64_t v95 = v51;
        v61 = v76;
        uint64_t v62 = i;
        sub_22D34B608();
        v63 = v74;
        uint64_t v64 = sub_22D34B648();
        if (v63)
        {

          sub_22D32E1C0();
          swift_allocError();
          v66 = (void (*)(char *, uint64_t))v57;
          uint64_t v67 = v86;
          *(void *)uint64_t v68 = v62;
          *(void *)(v68 + 8) = v67;
          *(unsigned char *)(v68 + 16) = 1;
          swift_willThrow();
          sub_22D32E214(v83, v84);
          v66(v61, v30);
          v66(v34, v30);
          return sub_22D32E26C(v85, v82, v80, v62, v67);
        }
        else
        {
          uint64_t v69 = v64;
          unint64_t v70 = v65;
          uint64_t v71 = swift_bridgeObjectRelease();
          v94 = &v73;
          MEMORY[0x270FA5388](v71);
          *(&v73 - 2) = v75;
          uint64_t v72 = v81;
          swift_retain();
          sub_22D32E2DC(v69, v70);
          sub_22D33609C(v72, v69, v70, (void (*)(char *))sub_22D32E2B0, (uint64_t)(&v73 - 4));
          sub_22D32E214(v83, v84);
          sub_22D32E214(v69, v70);
          v57((uint64_t)v76, v30);
          v57((uint64_t)v34, v30);
          return sub_22D32E26C(v85, v82, v80, i, v86);
        }
      }
      else
      {
        v58 = v57;
        uint64_t v59 = v86;
        sub_22D34B5F8();
        swift_bridgeObjectRelease();
        sub_22D31D53C(v55);
        sub_22D32E214(v83, v84);
        v58(v55, v30);
        v58((uint64_t)v34, v30);
        return sub_22D32E26C(v85, v82, v80, i, v59);
      }
    }
    else
    {
      sub_22D32E1C0();
      swift_allocError();
      *(void *)uint64_t v60 = 0;
      *(void *)(v60 + 8) = 0;
      *(unsigned char *)(v60 + 16) = 2;
      swift_willThrow();
      sub_22D32E214(v83, v84);
      (*(void (**)(char *, uint64_t))(v79 + 8))(v34, v30);
      return sub_22D32E26C(v85, v82, v80, v4, 0);
    }
  }
  unint64_t v35 = *(void *)(v90 + 8 * v36);
  if (v35)
  {
    int64_t v26 = v36;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v26 = v36 + 1;
    if (__OFADD__(v36, 1)) {
      break;
    }
    if (v26 >= v91) {
      goto LABEL_41;
    }
    unint64_t v35 = *(void *)(v90 + 8 * v26);
    ++v36;
    if (v35) {
      goto LABEL_23;
    }
  }
LABEL_49:
  __break(1u);
  return result;
}

uint64_t SymbolMetadataStore.load(from:decryptor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for DirectoryDecompressor();
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 16) = a2;
  *(void *)(inited + 24) = a3;
  swift_retain();
  sub_22D31CB1C(a1, inited);
  swift_setDeallocating();
  return swift_release();
}

uint64_t sub_22D31D53C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v109 = sub_22D34B638();
  uint64_t v4 = *(void *)(v109 - 8);
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v102 = (char *)&v100 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  v107 = (char *)&v100 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  v106 = (char *)&v100 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  v105 = (char *)&v100 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  v104 = (char *)&v100 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  unint64_t v17 = (char *)&v100 - v16;
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  v103 = (char *)&v100 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  unint64_t v22 = (char *)&v100 - v21;
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  uint64_t v25 = (char *)&v100 - v24;
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  uint64_t v28 = (char *)&v100 - v27;
  MEMORY[0x270FA5388](v26);
  uint64_t v30 = (char *)&v100 - v29;
  uint64_t v111 = a1;
  sub_22D34B5F8();
  v101 = v30;
  uint64_t v31 = sub_22D34B648();
  unint64_t v33 = v32;
  SymbolMetadataStore.ingestCSVData(_:)(v31, v32);
  sub_22D32E214(v31, v33);
  swift_bridgeObjectRetain();
  sub_22D34B5F8();
  swift_bridgeObjectRelease();
  sub_22D34B618();
  uint64_t v34 = v4 + 8;
  unint64_t v35 = *(void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v110 = v34;
  v35(v25, v109);
  uint64_t v36 = sub_22D34B648();
  uint64_t v108 = v2;
  uint64_t v37 = v36;
  unint64_t v39 = v38;
  SymbolMetadataStore.ingestSymbolCategoriesPlistData(_:)();
  sub_22D32E214(v37, v39);
  uint64_t v40 = v109;
  v35(v28, v109);
  swift_bridgeObjectRetain();
  sub_22D34B5F8();
  swift_bridgeObjectRelease();
  sub_22D34B618();
  v35(v25, v40);
  uint64_t v41 = sub_22D34B648();
  unint64_t v43 = v42;
  SymbolMetadataStore.ingestSymbolCategoriesPlistData(_:)();
  sub_22D32E214(v41, v43);
  uint64_t v44 = v109;
  v35(v28, v109);
  swift_bridgeObjectRetain();
  sub_22D34B5F8();
  swift_bridgeObjectRelease();
  sub_22D34B618();
  v35(v25, v44);
  uint64_t v45 = sub_22D34B648();
  unint64_t v47 = v46;
  SymbolMetadataStore.ingestSymbolCategoriesPlistData(_:)();
  sub_22D32E214(v45, v47);
  uint64_t v48 = v109;
  v35(v28, v109);
  swift_arrayDestroy();
  swift_bridgeObjectRetain();
  sub_22D34B5F8();
  swift_bridgeObjectRelease();
  sub_22D34B618();
  v35(v25, v48);
  uint64_t v49 = sub_22D34B648();
  unint64_t v51 = v50;
  SymbolMetadataStore.ingestNameAvailabilityPlistData(_:)();
  sub_22D32E214(v49, v51);
  v35(v22, v48);
  swift_bridgeObjectRetain();
  sub_22D34B5F8();
  swift_bridgeObjectRelease();
  sub_22D34B618();
  v35(v25, v48);
  uint64_t v52 = sub_22D34B648();
  unint64_t v54 = v53;
  SymbolMetadataStore.ingestNameAvailabilityPlistData(_:)();
  sub_22D32E214(v52, v54);
  v35(v22, v48);
  swift_arrayDestroy();
  swift_bridgeObjectRetain();
  sub_22D34B5F8();
  swift_bridgeObjectRelease();
  sub_22D34B618();
  v35(v25, v48);
  uint64_t v55 = sub_22D34B648();
  unint64_t v57 = v56;
  SymbolMetadataStore.ingestAliasStringsData(_:)();
  sub_22D32E214(v55, v57);
  v35(v103, v48);
  swift_bridgeObjectRetain();
  sub_22D34B5F8();
  swift_bridgeObjectRelease();
  sub_22D34B618();
  v35(v25, v48);
  uint64_t v58 = sub_22D34B648();
  unint64_t v60 = v59;
  SymbolMetadataStore.ingestAliasStringsData(_:)();
  sub_22D32E214(v58, v60);
  v35(v103, v48);
  swift_arrayDestroy();
  char v61 = 0;
  do
  {
    char v62 = v61;
    swift_bridgeObjectRetain();
    sub_22D34B5F8();
    swift_bridgeObjectRelease();
    sub_22D34B618();
    v35(v25, v48);
    uint64_t v63 = sub_22D34B648();
    unint64_t v65 = v64;
    sub_22D34B5B8();
    swift_allocObject();
    sub_22D34B5A8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268568518);
    sub_22D32CBD4();
    sub_22D34B598();
    swift_release();
    uint64_t v66 = v112;
    uint64_t v67 = v108;
    swift_bridgeObjectRelease();
    sub_22D32E214(v63, v65);
    *(void *)(v67 + 64) = v66;
    uint64_t v48 = v109;
    v35(v17, v109);
    char v61 = 1;
  }
  while ((v62 & 1) == 0);
  swift_arrayDestroy();
  swift_bridgeObjectRetain();
  sub_22D34B5F8();
  swift_bridgeObjectRelease();
  sub_22D34B618();
  v35(v25, v48);
  uint64_t v68 = sub_22D34B648();
  unint64_t v70 = v69;
  SymbolMetadataStore.ingestLayerSetAvailabilityPlistData(_:)();
  sub_22D32E214(v68, v70);
  uint64_t v71 = v102;
  v35(v104, v48);
  swift_bridgeObjectRetain();
  sub_22D34B5F8();
  swift_bridgeObjectRelease();
  sub_22D34B618();
  v35(v25, v48);
  uint64_t v72 = sub_22D34B648();
  unint64_t v74 = v73;
  SymbolMetadataStore.ingestLayerSetAvailabilityPlistData(_:)();
  sub_22D32E214(v72, v74);
  v35(v104, v48);
  swift_arrayDestroy();
  swift_bridgeObjectRetain();
  sub_22D34B5F8();
  swift_bridgeObjectRelease();
  sub_22D34B618();
  v35(v25, v48);
  uint64_t v75 = sub_22D34B648();
  unint64_t v77 = v76;
  SymbolMetadataStore.ingestFeatureAvailabilityPlistData(_:)();
  sub_22D32E214(v75, v77);
  v35(v105, v48);
  swift_bridgeObjectRetain();
  sub_22D34B5F8();
  swift_bridgeObjectRelease();
  sub_22D34B618();
  v35(v25, v48);
  uint64_t v78 = sub_22D34B648();
  unint64_t v80 = v79;
  SymbolMetadataStore.ingestFeatureAvailabilityPlistData(_:)();
  sub_22D32E214(v78, v80);
  v35(v105, v48);
  swift_arrayDestroy();
  swift_bridgeObjectRetain();
  sub_22D34B5F8();
  swift_bridgeObjectRelease();
  sub_22D34B618();
  v35(v25, v48);
  uint64_t v81 = sub_22D34B648();
  unint64_t v83 = v82;
  SymbolMetadataStore.ingestSymbolPropertiesPlistData(_:)();
  sub_22D32E214(v81, v83);
  v35(v106, v48);
  swift_bridgeObjectRetain();
  sub_22D34B5F8();
  swift_bridgeObjectRelease();
  sub_22D34B618();
  v35(v25, v48);
  uint64_t v84 = sub_22D34B648();
  unint64_t v86 = v85;
  SymbolMetadataStore.ingestSymbolPropertiesPlistData(_:)();
  sub_22D32E214(v84, v86);
  v35(v106, v48);
  swift_arrayDestroy();
  swift_bridgeObjectRetain();
  sub_22D34B5F8();
  swift_bridgeObjectRelease();
  sub_22D34B618();
  v35(v25, v48);
  uint64_t v87 = sub_22D34B648();
  unint64_t v89 = v88;
  SymbolMetadataStore.ingestSymbolSearchPlistData(_:)();
  sub_22D32E214(v87, v89);
  v35(v107, v48);
  swift_bridgeObjectRetain();
  sub_22D34B5F8();
  swift_bridgeObjectRelease();
  sub_22D34B618();
  v35(v25, v48);
  uint64_t v90 = sub_22D34B648();
  unint64_t v92 = v91;
  SymbolMetadataStore.ingestSymbolSearchPlistData(_:)();
  sub_22D32E214(v90, v92);
  v35(v107, v48);
  swift_arrayDestroy();
  swift_bridgeObjectRetain();
  sub_22D34B5F8();
  swift_bridgeObjectRelease();
  sub_22D34B618();
  v35(v25, v48);
  uint64_t v93 = sub_22D34B648();
  unint64_t v95 = v94;
  SymbolMetadataStore.ingestSymbolOrderPlistData(_:)();
  sub_22D32E214(v93, v95);
  v35(v71, v48);
  swift_bridgeObjectRetain();
  sub_22D34B5F8();
  swift_bridgeObjectRelease();
  sub_22D34B618();
  v35(v25, v48);
  uint64_t v96 = sub_22D34B648();
  unint64_t v98 = v97;
  SymbolMetadataStore.ingestSymbolOrderPlistData(_:)();
  sub_22D32E214(v96, v98);
  v35(v71, v48);
  swift_arrayDestroy();
  return ((uint64_t (*)(char *, uint64_t))v35)(v101, v48);
}

uint64_t SymbolMetadataStore.ingestCSVData(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (char *)MEMORY[0x263F8EE78];
  uint64_t v3 = _s9SFSymbols18SystemSymbolCSVRowV6decode_22additionalColumnTitlesSayACG10Foundation4DataV_SaySSGtFZ_0(a1, a2, MEMORY[0x263F8EE78]);
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    uint64_t v5 = (void *)(v3 + 128);
    uint64_t v6 = (char *)MEMORY[0x263F8EE80];
    uint64_t v7 = (char *)MEMORY[0x263F8EE80];
    while (1)
    {
      int v57 = *((_DWORD *)v5 - 24);
      uint64_t v9 = *(v5 - 10);
      uint64_t v48 = *(v5 - 11);
      char v49 = *((unsigned char *)v5 - 72);
      uint64_t v10 = *(v5 - 7);
      uint64_t v50 = *(v5 - 8);
      long long v58 = *((_OWORD *)v5 - 3);
      char v51 = *((unsigned char *)v5 - 32);
      uint64_t v11 = *(v5 - 2);
      uint64_t v52 = *(v5 - 3);
      char v53 = *((unsigned char *)v5 - 8);
      uint64_t v12 = *v5;
      swift_bridgeObjectRetain();
      uint64_t v56 = v12;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v2 = sub_22D3444B4(0, *((void *)v2 + 2) + 1, 1, v2);
      }
      unint64_t v14 = *((void *)v2 + 2);
      unint64_t v13 = *((void *)v2 + 3);
      if (v14 >= v13 >> 1) {
        uint64_t v2 = sub_22D3444B4((char *)(v13 > 1), v14 + 1, 1, v2);
      }
      *((void *)v2 + 2) = v14 + 1;
      *(_DWORD *)&v2[4 * v14 + 32] = v57;
      swift_bridgeObjectRetain();
      uint64_t v55 = v10;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v54 = v11;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v59 = v6;
      unint64_t v17 = sub_22D3229EC(v57);
      uint64_t v18 = *((void *)v6 + 2);
      BOOL v19 = (v16 & 1) == 0;
      uint64_t v20 = v18 + v19;
      if (__OFADD__(v18, v19)) {
        break;
      }
      char v21 = v16;
      if (*((void *)v6 + 3) >= v20)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          sub_22D32679C();
        }
      }
      else
      {
        sub_22D323018(v20, isUniquelyReferenced_nonNull_native);
        unint64_t v22 = sub_22D3229EC(v57);
        if ((v21 & 1) != (v23 & 1)) {
          goto LABEL_35;
        }
        unint64_t v17 = v22;
      }
      uint64_t v6 = v59;
      uint64_t v46 = v4;
      unint64_t v47 = v2;
      if (v21)
      {
        uint64_t v24 = *((void *)v59 + 7) + 104 * v17;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        *(_DWORD *)uint64_t v24 = v57;
        uint64_t v25 = v48;
        *(void *)(v24 + 8) = v48;
        *(void *)(v24 + 16) = v9;
        *(unsigned char *)(v24 + 24) = v49;
        *(void *)(v24 + 32) = v50;
        *(void *)(v24 + 40) = v55;
        *(_OWORD *)(v24 + 48) = v58;
        *(unsigned char *)(v24 + 64) = v51;
        *(void *)(v24 + 72) = v52;
        *(void *)(v24 + 80) = v54;
        *(unsigned char *)(v24 + 88) = v53;
        *(void *)(v24 + 96) = v56;
      }
      else
      {
        *(void *)&v59[8 * (v17 >> 6) + 64] |= 1 << v17;
        *(_DWORD *)(*((void *)v6 + 6) + 4 * v17) = v57;
        uint64_t v26 = *((void *)v6 + 7) + 104 * v17;
        *(_DWORD *)uint64_t v26 = v57;
        *(void *)(v26 + 8) = v48;
        *(void *)(v26 + 16) = v9;
        *(unsigned char *)(v26 + 24) = v49;
        *(void *)(v26 + 32) = v50;
        *(void *)(v26 + 40) = v55;
        *(_OWORD *)(v26 + 48) = v58;
        *(unsigned char *)(v26 + 64) = v51;
        *(void *)(v26 + 72) = v52;
        *(void *)(v26 + 80) = v54;
        *(unsigned char *)(v26 + 88) = v53;
        *(void *)(v26 + 96) = v56;
        uint64_t v27 = *((void *)v6 + 2);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28) {
          goto LABEL_32;
        }
        *((void *)v6 + 2) = v29;
        uint64_t v25 = v48;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char v30 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v59 = v7;
      unint64_t v32 = sub_22D3195C4(v25, v9);
      uint64_t v33 = *((void *)v7 + 2);
      BOOL v34 = (v31 & 1) == 0;
      uint64_t v35 = v33 + v34;
      if (__OFADD__(v33, v34)) {
        goto LABEL_31;
      }
      char v36 = v31;
      if (*((void *)v7 + 3) >= v35)
      {
        if ((v30 & 1) == 0) {
          sub_22D32654C();
        }
      }
      else
      {
        sub_22D322C44(v35, v30);
        unint64_t v37 = sub_22D3195C4(v25, v9);
        if ((v36 & 1) != (v38 & 1)) {
          goto LABEL_34;
        }
        unint64_t v32 = v37;
      }
      uint64_t v7 = v59;
      if (v36)
      {
        uint64_t v8 = *((void *)v59 + 7) + 104 * v32;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        *(_DWORD *)uint64_t v8 = v57;
        *(void *)(v8 + 8) = v25;
        *(void *)(v8 + 16) = v9;
        *(unsigned char *)(v8 + 24) = v49;
        *(void *)(v8 + 32) = v50;
        *(void *)(v8 + 40) = v55;
        *(_OWORD *)(v8 + 48) = v58;
        *(unsigned char *)(v8 + 64) = v51;
        *(void *)(v8 + 72) = v52;
        *(void *)(v8 + 80) = v54;
        *(unsigned char *)(v8 + 88) = v53;
        *(void *)(v8 + 96) = v56;
      }
      else
      {
        *(void *)&v59[8 * (v32 >> 6) + 64] |= 1 << v32;
        unint64_t v39 = (uint64_t *)(*((void *)v7 + 6) + 16 * v32);
        *unint64_t v39 = v25;
        v39[1] = v9;
        uint64_t v40 = *((void *)v7 + 7) + 104 * v32;
        *(_DWORD *)uint64_t v40 = v57;
        *(void *)(v40 + 8) = v25;
        *(void *)(v40 + 16) = v9;
        *(unsigned char *)(v40 + 24) = v49;
        *(void *)(v40 + 32) = v50;
        *(void *)(v40 + 40) = v55;
        *(_OWORD *)(v40 + 48) = v58;
        *(unsigned char *)(v40 + 64) = v51;
        *(void *)(v40 + 72) = v52;
        *(void *)(v40 + 80) = v54;
        *(unsigned char *)(v40 + 88) = v53;
        *(void *)(v40 + 96) = v56;
        uint64_t v41 = *((void *)v7 + 2);
        BOOL v28 = __OFADD__(v41, 1);
        uint64_t v42 = v41 + 1;
        if (v28) {
          goto LABEL_33;
        }
        *((void *)v7 + 2) = v42;
        swift_bridgeObjectRetain();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      v5 += 13;
      uint64_t v2 = v47;
      uint64_t v4 = v46 - 1;
      if (v46 == 1) {
        goto LABEL_29;
      }
    }
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    sub_22D34B9E8();
    __break(1u);
LABEL_35:
    sub_22D34B9E8();
    __break(1u);
    uint64_t result = swift_release();
    __break(1u);
  }
  else
  {
    uint64_t v6 = (char *)MEMORY[0x263F8EE80];
    uint64_t v7 = (char *)MEMORY[0x263F8EE80];
LABEL_29:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *uint64_t v45 = v2;
    swift_bridgeObjectRelease();
    v45[2] = v7;
    swift_bridgeObjectRelease();
    v45[1] = v6;
    unint64_t v59 = v2;
    swift_bridgeObjectRetain_n();
    sub_22D32A990(&v59, v45);
    swift_bridgeObjectRelease();
    unint64_t v43 = v59;
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v45 = v43;
  }
  return result;
}

uint64_t SymbolMetadataStore.ingestSymbolCategoriesPlistData(_:)()
{
  uint64_t v1 = v0;
  sub_22D34B5B8();
  swift_allocObject();
  sub_22D34B5A8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685684E0);
  sub_22D32DC7C(&qword_2685684E8, &qword_2685684E0, (void (*)(void))sub_22D32CB14);
  sub_22D34B598();
  swift_release();
  uint64_t v2 = 0;
  int64_t v3 = 0;
  uint64_t v4 = v46;
  uint64_t v5 = v46 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(v46 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(v46 + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v41 = v46 + 64;
  uint64_t v42 = v46;
  int64_t v40 = v9;
  if (!v8) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v10 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v10 | (v3 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v3 << 6))
  {
    uint64_t v12 = *(void *)(*(void *)(v4 + 56) + 8 * i);
    uint64_t v13 = *(void *)(v12 + 16);
    if (v13)
    {
      unint64_t v43 = v8;
      int64_t v44 = v3;
      unint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * i);
      uint64_t v18 = v17[1];
      uint64_t v45 = *v17;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      BOOL v19 = (uint64_t *)(v12 + 40);
      do
      {
        uint64_t v21 = *(v19 - 1);
        uint64_t v20 = *v19;
        uint64_t v22 = v18;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_22D32E15C((uint64_t)v2);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v46 = *(void *)(v1 + 24);
        uint64_t v24 = v46;
        uint64_t v25 = v1;
        *(void *)(v1 + 24) = 0x8000000000000000;
        unint64_t v27 = sub_22D322B3C(v21, v20);
        uint64_t v28 = *(void *)(v24 + 16);
        BOOL v29 = (v26 & 1) == 0;
        uint64_t v30 = v28 + v29;
        if (__OFADD__(v28, v29))
        {
          __break(1u);
LABEL_41:
          __break(1u);
          goto LABEL_42;
        }
        char v31 = v26;
        if (*(void *)(v24 + 24) >= v30)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_22D3269DC();
            uint64_t v24 = v46;
          }
        }
        else
        {
          sub_22D3233BC(v30, isUniquelyReferenced_nonNull_native);
          uint64_t v24 = v46;
          unint64_t v32 = sub_22D322B3C(v21, v20);
          if ((v31 & 1) != (v33 & 1)) {
            goto LABEL_44;
          }
          unint64_t v27 = v32;
        }
        *(void *)(v25 + 24) = v24;
        swift_bridgeObjectRelease();
        BOOL v34 = *(void **)(v25 + 24);
        if ((v31 & 1) == 0)
        {
          v34[(v27 >> 6) + 8] |= 1 << v27;
          uint64_t v35 = (uint64_t *)(v34[6] + 16 * v27);
          *uint64_t v35 = v21;
          v35[1] = v20;
          *(void *)(v34[7] + 8 * v27) = MEMORY[0x263F8EE88];
          uint64_t v36 = v34[2];
          uint64_t v37 = v36 + 1;
          BOOL v38 = __OFADD__(v36, 1);
          swift_bridgeObjectRetain();
          if (v38) {
            goto LABEL_41;
          }
          v34[2] = v37;
        }
        v19 += 2;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v18 = v22;
        sub_22D327CB4(&v46, v45, v22);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v2 = sub_22D32258C;
        --v13;
        uint64_t v1 = v25;
      }
      while (v13);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v2 = sub_22D32258C;
      uint64_t v5 = v41;
      uint64_t v4 = v42;
      int64_t v9 = v40;
      unint64_t v8 = v43;
      int64_t v3 = v44;
      if (v43) {
        goto LABEL_4;
      }
    }
    else if (v8)
    {
      goto LABEL_4;
    }
LABEL_7:
    if (__OFADD__(v3++, 1))
    {
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    if (v3 >= v9) {
      goto LABEL_39;
    }
    unint64_t v15 = *(void *)(v5 + 8 * v3);
    if (!v15) {
      break;
    }
LABEL_17:
    unint64_t v8 = (v15 - 1) & v15;
  }
  int64_t v16 = v3 + 1;
  if (v3 + 1 >= v9) {
    goto LABEL_39;
  }
  unint64_t v15 = *(void *)(v5 + 8 * v16);
  if (v15) {
    goto LABEL_16;
  }
  int64_t v16 = v3 + 2;
  if (v3 + 2 >= v9) {
    goto LABEL_39;
  }
  unint64_t v15 = *(void *)(v5 + 8 * v16);
  if (v15) {
    goto LABEL_16;
  }
  int64_t v16 = v3 + 3;
  if (v3 + 3 >= v9)
  {
LABEL_39:
    swift_release();
    return sub_22D32E15C((uint64_t)v2);
  }
  unint64_t v15 = *(void *)(v5 + 8 * v16);
  if (v15)
  {
LABEL_16:
    int64_t v3 = v16;
    goto LABEL_17;
  }
  while (1)
  {
    int64_t v3 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v3 >= v9) {
      goto LABEL_39;
    }
    unint64_t v15 = *(void *)(v5 + 8 * v3);
    ++v16;
    if (v15) {
      goto LABEL_17;
    }
  }
LABEL_43:
  __break(1u);
LABEL_44:
  uint64_t result = sub_22D34B9E8();
  __break(1u);
  return result;
}

uint64_t SymbolMetadataStore.ingestNameAvailabilityPlistData(_:)()
{
  uint64_t v1 = v0;
  sub_22D34B5B8();
  swift_allocObject();
  sub_22D34B5A8();
  sub_22D32CB80();
  sub_22D34B598();
  swift_release();
  uint64_t v2 = sub_22D321CAC((uint64_t)v86);
  int64_t v3 = 0;
  uint64_t v80 = v2 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(v2 + 64);
  int64_t v82 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v84 = v2;
  while (v6)
  {
    unint64_t v11 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    unint64_t v12 = v11 | (v3 << 6);
LABEL_22:
    int64_t v16 = (uint64_t *)(*(void *)(v84 + 48) + 16 * v12);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    BOOL v19 = (uint64_t *)(*(void *)(v84 + 56) + 24 * v12);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    uint64_t v22 = v19[2];
    uint64_t v23 = v1;
    uint64_t v24 = *(void *)(v1 + 96);
    uint64_t v25 = *(void *)(v24 + 16);
    swift_bridgeObjectRetain_n();
    if (v25 && (unint64_t v26 = sub_22D3195C4(v18, v17), (v27 & 1) != 0))
    {
      unint64_t v7 = *(void *)(*(void *)(v24 + 56) + 8 * v26);
      swift_bridgeObjectRetain();
    }
    else
    {
      unint64_t v7 = sub_22D321FE4(MEMORY[0x263F8EE78]);
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_22D325B50(v20, v21, v22, 1701667182, 0xE400000000000000, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    char v9 = swift_isUniquelyReferenced_nonNull_native();
    sub_22D325B50(v20, v21, v22, 0x6F7268636F6E6F6DLL, 0xEA0000000000656DLL, v9);
    swift_bridgeObjectRelease();
    uint64_t v1 = v23;
    char v10 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v86 = *(void **)(v23 + 96);
    *(void *)(v23 + 96) = 0x8000000000000000;
    sub_22D3259D0(v7, v18, v17, v10);
    *(void *)(v23 + 96) = v86;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  int64_t v13 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
LABEL_85:
    __break(1u);
    goto LABEL_86;
  }
  if (v13 >= v82) {
    goto LABEL_25;
  }
  unint64_t v14 = *(void *)(v80 + 8 * v13);
  ++v3;
  if (v14) {
    goto LABEL_21;
  }
  int64_t v3 = v13 + 1;
  if (v13 + 1 >= v82) {
    goto LABEL_25;
  }
  unint64_t v14 = *(void *)(v80 + 8 * v3);
  if (v14) {
    goto LABEL_21;
  }
  int64_t v3 = v13 + 2;
  if (v13 + 2 >= v82) {
    goto LABEL_25;
  }
  unint64_t v14 = *(void *)(v80 + 8 * v3);
  if (v14)
  {
LABEL_21:
    unint64_t v6 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v3 << 6);
    goto LABEL_22;
  }
  int64_t v15 = v13 + 3;
  if (v15 < v82)
  {
    unint64_t v14 = *(void *)(v80 + 8 * v15);
    if (!v14)
    {
      while (1)
      {
        int64_t v3 = v15 + 1;
        if (__OFADD__(v15, 1)) {
          break;
        }
        if (v3 >= v82) {
          goto LABEL_25;
        }
        unint64_t v14 = *(void *)(v80 + 8 * v3);
        ++v15;
        if (v14) {
          goto LABEL_21;
        }
      }
LABEL_88:
      __break(1u);
      goto LABEL_89;
    }
    int64_t v3 = v15;
    goto LABEL_21;
  }
LABEL_25:
  swift_release();
  uint64_t v28 = v87;
  uint64_t v75 = v1;
  uint64_t v29 = *(void *)(v87 + 64);
  uint64_t v81 = v87 + 64;
  uint64_t v30 = 1 << *(unsigned char *)(v87 + 32);
  swift_bridgeObjectRelease();
  int64_t v31 = 0;
  if (v30 < 64) {
    uint64_t v32 = ~(-1 << v30);
  }
  else {
    uint64_t v32 = -1;
  }
  unint64_t v33 = v32 & v29;
  int64_t v83 = (unint64_t)(v30 + 63) >> 6;
  unint64_t v77 = (void *)MEMORY[0x263F8EE80];
  if ((v32 & v29) == 0) {
    goto LABEL_32;
  }
  while (2)
  {
    while (1)
    {
      unint64_t v34 = __clz(__rbit64(v33));
      v33 &= v33 - 1;
      unint64_t v35 = v34 | (v31 << 6);
LABEL_30:
      uint64_t v36 = (uint64_t *)(*(void *)(v28 + 48) + 16 * v35);
      uint64_t v37 = *v36;
      BOOL v38 = (void *)v36[1];
      uint64_t v39 = *(void *)(*(void *)(v28 + 56) + 8 * v35);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v40._countAndFlagsBits = v37;
      v40._object = v38;
      Version.init(string:)(v40);
      if ((v89 & 1) == 0) {
        break;
      }
      swift_bridgeObjectRelease();
      if (!v33) {
        goto LABEL_32;
      }
    }
    int64_t v44 = 0;
    uint64_t v76 = (uint64_t)v86;
    uint64_t v45 = v39 + 64;
    uint64_t v46 = 1 << *(unsigned char *)(v39 + 32);
    if (v46 < 64) {
      uint64_t v47 = ~(-1 << v46);
    }
    else {
      uint64_t v47 = -1;
    }
    unint64_t v48 = v47 & *(void *)(v39 + 64);
    int64_t v85 = (unint64_t)(v46 + 63) >> 6;
    uint64_t v78 = MEMORY[0x263F8EE80];
    while (v48)
    {
      unint64_t v49 = __clz(__rbit64(v48));
      v48 &= v48 - 1;
      unint64_t v50 = v49 | (v44 << 6);
LABEL_65:
      char v53 = (uint64_t *)(*(void *)(v39 + 56) + 16 * v50);
      uint64_t v55 = *v53;
      uint64_t v54 = (void *)v53[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v56 = sub_22D34B938();
      swift_bridgeObjectRelease();
      if (v56 >= 7) {
        goto LABEL_51;
      }
      v57._countAndFlagsBits = v55;
      v57._object = v54;
      Version.init(string:)(v57);
      if ((v89 & 1) == 0)
      {
        unint64_t v74 = v86;
        char v58 = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v86 = (void *)v78;
        unint64_t v60 = sub_22D322AF8(v56);
        uint64_t v61 = *(void *)(v78 + 16);
        BOOL v62 = (v59 & 1) == 0;
        uint64_t v63 = v61 + v62;
        if (__OFADD__(v61, v62)) {
          goto LABEL_90;
        }
        if (*(void *)(v78 + 24) >= v63)
        {
          if ((v58 & 1) == 0)
          {
            char v71 = v59;
            sub_22D326D50();
            char v59 = v71;
          }
        }
        else
        {
          char v79 = v59;
          sub_22D323A04(v63, v58);
          unint64_t v64 = sub_22D322AF8(v56);
          int v66 = v65 & 1;
          char v59 = v79;
          if ((v79 & 1) != v66) {
            goto LABEL_92;
          }
          unint64_t v60 = v64;
        }
        uint64_t v78 = (uint64_t)v86;
        if (v59)
        {
          uint64_t v67 = (void *)(v86[7] + 24 * v60);
          *uint64_t v67 = v74;
          v67[1] = v87;
          v67[2] = v88;
        }
        else
        {
          v86[(v60 >> 6) + 8] |= 1 << v60;
          *(unsigned char *)(v86[6] + v60) = v56;
          uint64_t v68 = (void *)(v86[7] + 24 * v60);
          *uint64_t v68 = v74;
          v68[1] = v87;
          v68[2] = v88;
          uint64_t v69 = v86[2];
          BOOL v41 = __OFADD__(v69, 1);
          uint64_t v70 = v69 + 1;
          if (v41) {
            goto LABEL_91;
          }
          v86[2] = v70;
        }
LABEL_51:
        swift_bridgeObjectRelease();
        continue;
      }
    }
    BOOL v41 = __OFADD__(v44++, 1);
    if (v41)
    {
      __break(1u);
      goto LABEL_85;
    }
    if (v44 < v85)
    {
      unint64_t v51 = *(void *)(v45 + 8 * v44);
      if (!v51)
      {
        int64_t v52 = v44 + 1;
        if (v44 + 1 >= v85) {
          goto LABEL_81;
        }
        unint64_t v51 = *(void *)(v45 + 8 * v52);
        if (!v51)
        {
          int64_t v52 = v44 + 2;
          if (v44 + 2 >= v85) {
            goto LABEL_81;
          }
          unint64_t v51 = *(void *)(v45 + 8 * v52);
          if (!v51)
          {
            int64_t v52 = v44 + 3;
            if (v44 + 3 >= v85) {
              goto LABEL_81;
            }
            unint64_t v51 = *(void *)(v45 + 8 * v52);
            if (!v51)
            {
              while (1)
              {
                int64_t v44 = v52 + 1;
                if (__OFADD__(v52, 1)) {
                  goto LABEL_87;
                }
                if (v44 >= v85) {
                  goto LABEL_81;
                }
                unint64_t v51 = *(void *)(v45 + 8 * v44);
                ++v52;
                if (v51) {
                  goto LABEL_64;
                }
              }
            }
          }
        }
        int64_t v44 = v52;
      }
LABEL_64:
      unint64_t v48 = (v51 - 1) & v51;
      unint64_t v50 = __clz(__rbit64(v51)) + (v44 << 6);
      goto LABEL_65;
    }
LABEL_81:
    uint64_t v28 = v87;
    swift_release();
    char v72 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v86 = v77;
    sub_22D32587C(v78, v76, v87, v88, v72);
    swift_bridgeObjectRelease();
    if (v33) {
      continue;
    }
    break;
  }
LABEL_32:
  BOOL v41 = __OFADD__(v31++, 1);
  if (v41)
  {
LABEL_86:
    __break(1u);
LABEL_87:
    __break(1u);
    goto LABEL_88;
  }
  if (v31 >= v83) {
    goto LABEL_83;
  }
  unint64_t v42 = *(void *)(v81 + 8 * v31);
  if (v42) {
    goto LABEL_42;
  }
  int64_t v43 = v31 + 1;
  if (v31 + 1 >= v83) {
    goto LABEL_83;
  }
  unint64_t v42 = *(void *)(v81 + 8 * v43);
  if (v42)
  {
LABEL_41:
    int64_t v31 = v43;
LABEL_42:
    unint64_t v33 = (v42 - 1) & v42;
    unint64_t v35 = __clz(__rbit64(v42)) + (v31 << 6);
    goto LABEL_30;
  }
  int64_t v43 = v31 + 2;
  if (v31 + 2 >= v83) {
    goto LABEL_83;
  }
  unint64_t v42 = *(void *)(v81 + 8 * v43);
  if (v42) {
    goto LABEL_41;
  }
  int64_t v43 = v31 + 3;
  if (v31 + 3 >= v83)
  {
LABEL_83:
    swift_release();
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)(v75 + 88) = v77;
  }
  else
  {
    unint64_t v42 = *(void *)(v81 + 8 * v43);
    if (v42) {
      goto LABEL_41;
    }
    while (1)
    {
      int64_t v31 = v43 + 1;
      if (__OFADD__(v43, 1)) {
        break;
      }
      if (v31 >= v83) {
        goto LABEL_83;
      }
      unint64_t v42 = *(void *)(v81 + 8 * v31);
      ++v43;
      if (v42) {
        goto LABEL_42;
      }
    }
LABEL_89:
    __break(1u);
LABEL_90:
    __break(1u);
LABEL_91:
    __break(1u);
LABEL_92:
    uint64_t result = sub_22D34B9E8();
    __break(1u);
  }
  return result;
}

uint64_t SymbolMetadataStore.ingestAliasStringsData(_:)()
{
  uint64_t v1 = v0;
  sub_22D34B5B8();
  swift_allocObject();
  sub_22D34B5A8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268568508);
  sub_22D32CDD4(&qword_268568510, &qword_268568508);
  sub_22D34B598();
  swift_release();
  int64_t v2 = 0;
  uint64_t v3 = v41;
  uint64_t v4 = v41 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(v41 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(v41 + 64);
  uint64_t v37 = 0;
  int64_t v40 = (unint64_t)(v5 + 63) >> 6;
  while (v7)
  {
    unint64_t v8 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v9 = v8 | (v2 << 6);
LABEL_20:
    if (*(void *)(v1[12] + 16))
    {
      uint64_t v13 = 16 * v9;
      unint64_t v14 = (uint64_t *)(*(void *)(v3 + 48) + v13);
      int64_t v15 = (uint64_t *)(*(void *)(v3 + 56) + v13);
      uint64_t v17 = *v15;
      uint64_t v16 = v15[1];
      uint64_t v19 = *v14;
      uint64_t v18 = v14[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_22D3195C4(v19, v18);
      if (v20)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v41 = v1[9];
        v1[9] = 0x8000000000000000;
        sub_22D325CAC(v17, v16, v19, v18, isUniquelyReferenced_nonNull_native);
        v1[9] = v41;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_22D32E15C((uint64_t)v37);
        char v35 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v41 = v1[10];
        uint64_t v22 = v41;
        v1[10] = 0x8000000000000000;
        unint64_t v23 = sub_22D3195C4(v17, v16);
        uint64_t v24 = *(void *)(v22 + 16);
        char v38 = v25;
        BOOL v26 = (v25 & 1) == 0;
        uint64_t v27 = v24 + v26;
        if (__OFADD__(v24, v26)) {
          goto LABEL_39;
        }
        if (*(void *)(v22 + 24) >= v27)
        {
          unint64_t v36 = v23;
          if ((v35 & 1) == 0)
          {
            sub_22D327430(&qword_268568618);
            uint64_t v22 = v41;
          }
        }
        else
        {
          sub_22D324AA0(v27, v35, &qword_268568618);
          uint64_t v22 = v41;
          unint64_t v36 = sub_22D3195C4(v17, v16);
          if ((v38 & 1) != (v28 & 1)) {
            goto LABEL_41;
          }
        }
        v1[10] = v22;
        swift_bridgeObjectRelease();
        uint64_t v29 = (void *)v1[10];
        if ((v38 & 1) == 0)
        {
          v29[(v36 >> 6) + 8] |= 1 << v36;
          uint64_t v30 = (uint64_t *)(v29[6] + 16 * v36);
          *uint64_t v30 = v17;
          v30[1] = v16;
          *(void *)(v29[7] + 8 * v36) = MEMORY[0x263F8EE88];
          uint64_t v31 = v29[2];
          uint64_t v32 = v31 + 1;
          BOOL v33 = __OFADD__(v31, 1);
          BOOL v39 = v33;
          swift_bridgeObjectRetain();
          if (v39) {
            goto LABEL_40;
          }
          v29[2] = v32;
        }
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        sub_22D327CB4(&v41, v19, v18);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v37 = sub_22D32258C;
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
    }
  }
  int64_t v10 = v2 + 1;
  if (__OFADD__(v2, 1))
  {
    __break(1u);
    goto LABEL_38;
  }
  if (v10 >= v40) {
    goto LABEL_36;
  }
  unint64_t v11 = *(void *)(v4 + 8 * v10);
  ++v2;
  if (v11) {
    goto LABEL_19;
  }
  int64_t v2 = v10 + 1;
  if (v10 + 1 >= v40) {
    goto LABEL_36;
  }
  unint64_t v11 = *(void *)(v4 + 8 * v2);
  if (v11) {
    goto LABEL_19;
  }
  int64_t v2 = v10 + 2;
  if (v10 + 2 >= v40) {
    goto LABEL_36;
  }
  unint64_t v11 = *(void *)(v4 + 8 * v2);
  if (v11)
  {
LABEL_19:
    unint64_t v7 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v2 << 6);
    goto LABEL_20;
  }
  int64_t v12 = v10 + 3;
  if (v12 >= v40)
  {
LABEL_36:
    swift_release();
    return sub_22D32E15C((uint64_t)v37);
  }
  unint64_t v11 = *(void *)(v4 + 8 * v12);
  if (v11)
  {
    int64_t v2 = v12;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v2 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v2 >= v40) {
      goto LABEL_36;
    }
    unint64_t v11 = *(void *)(v4 + 8 * v2);
    ++v12;
    if (v11) {
      goto LABEL_19;
    }
  }
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  uint64_t result = sub_22D34B9E8();
  __break(1u);
  return result;
}

uint64_t SymbolMetadataStore.ingestCategoriesPlistData(_:)()
{
  sub_22D34B5B8();
  swift_allocObject();
  sub_22D34B5A8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268568518);
  sub_22D32CBD4();
  sub_22D34B598();
  swift_release();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v0 + 64) = v2;
  return result;
}

uint64_t SymbolMetadataStore.ingestLayerSetAvailabilityPlistData(_:)()
{
  uint64_t v1 = v0;
  sub_22D34B5B8();
  swift_allocObject();
  sub_22D34B5A8();
  sub_22D32CC9C();
  sub_22D34B598();
  swift_release();
  uint64_t v2 = 0;
  int64_t v3 = 0;
  uint64_t v4 = v101;
  uint64_t v5 = v101 + 8;
  uint64_t v6 = 1 << *((unsigned char *)v101 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & v101[8];
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v93 = v101;
  uint64_t v94 = v1;
  unint64_t v92 = v101 + 8;
  uint64_t v90 = 0;
  int64_t v91 = v9;
  if (v8) {
    goto LABEL_7;
  }
LABEL_8:
  int64_t v11 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v11 < v9)
    {
      unint64_t v12 = v5[v11];
      ++v3;
      if (v12) {
        goto LABEL_20;
      }
      int64_t v3 = v11 + 1;
      if (v11 + 1 >= v9) {
        goto LABEL_68;
      }
      unint64_t v12 = v5[v3];
      if (v12) {
        goto LABEL_20;
      }
      int64_t v3 = v11 + 2;
      if (v11 + 2 >= v9) {
        goto LABEL_68;
      }
      unint64_t v12 = v5[v3];
      if (v12)
      {
LABEL_20:
        uint64_t string_8 = (v12 - 1) & v12;
        for (unint64_t i = __clz(__rbit64(v12)) + (v3 << 6); ; unint64_t i = __clz(__rbit64(v8)) | (v3 << 6))
        {
          unint64_t v14 = (uint64_t *)(v4[6] + 16 * i);
          uint64_t v15 = v14[1];
          uint64_t v16 = (uint64_t *)(v4[7] + 32 * i);
          uint64_t v17 = (void *)v16[1];
          uint64_t v97 = *v14;
          uint64_t string = v16[2];
          uint64_t v18 = (void *)v16[3];
          if (!v17) {
            break;
          }
          int64_t v19 = v3;
          uint64_t v20 = *v16;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain();
          v21._countAndFlagsBits = v20;
          int64_t v3 = v19;
          v21._object = v17;
          Version.init(string:)(v21);
          if (v104 == 1) {
            goto LABEL_28;
          }
          unint64_t v95 = v101;
          swift_bridgeObjectRetain();
          sub_22D32E15C((uint64_t)v2);
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v23 = *(void *)(v1 + 96);
          *(void *)(v1 + 96) = 0x8000000000000000;
          unint64_t v25 = sub_22D3195C4(v97, v15);
          uint64_t v26 = *(void *)(v23 + 16);
          BOOL v27 = (v24 & 1) == 0;
          uint64_t v28 = v26 + v27;
          if (__OFADD__(v26, v27)) {
            goto LABEL_70;
          }
          char v29 = v24;
          if (*(void *)(v23 + 24) >= v28)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
              sub_22D327430(&qword_268568608);
            }
          }
          else
          {
            sub_22D324AA0(v28, isUniquelyReferenced_nonNull_native, &qword_268568608);
            unint64_t v30 = sub_22D3195C4(v97, v15);
            if ((v29 & 1) != (v31 & 1)) {
              goto LABEL_79;
            }
            unint64_t v25 = v30;
          }
          *(void *)(v1 + 96) = v23;
          swift_bridgeObjectRelease();
          uint64_t v32 = *(void **)(v1 + 96);
          swift_bridgeObjectRetain();
          if ((v29 & 1) == 0)
          {
            unint64_t v33 = sub_22D321FE4(MEMORY[0x263F8EE78]);
            v32[(v25 >> 6) + 8] |= 1 << v25;
            unint64_t v34 = (uint64_t *)(v32[6] + 16 * v25);
            uint64_t *v34 = v97;
            v34[1] = v15;
            *(void *)(v32[7] + 8 * v25) = v33;
            uint64_t v35 = v32[2];
            BOOL v36 = __OFADD__(v35, 1);
            uint64_t v37 = v35 + 1;
            if (v36) {
              goto LABEL_72;
            }
            v32[2] = v37;
            swift_bridgeObjectRetain();
          }
          uint64_t v38 = v32[7];
          swift_bridgeObjectRelease();
          uint64_t v39 = 8 * v25;
          char v40 = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v41 = *(void **)(v38 + 8 * v25);
          v101 = v41;
          *(void *)(v38 + 8 * v25) = 0x8000000000000000;
          unint64_t v43 = sub_22D322B3C(0x6C6F6369746C756DLL, 0xEA0000000000726FLL);
          uint64_t v44 = v41[2];
          BOOL v45 = (v42 & 1) == 0;
          uint64_t v46 = v44 + v45;
          if (__OFADD__(v44, v45)) {
            goto LABEL_71;
          }
          char v47 = v42;
          if (v41[3] >= v46)
          {
            if ((v40 & 1) == 0) {
              sub_22D326EF4();
            }
          }
          else
          {
            sub_22D323DEC(v46, v40);
            unint64_t v48 = sub_22D322B3C(0x6C6F6369746C756DLL, 0xEA0000000000726FLL);
            if ((v47 & 1) != (v49 & 1)) {
              goto LABEL_80;
            }
            unint64_t v43 = v48;
          }
          int64_t v3 = v19;
          if (v47)
          {
            unint64_t v50 = (void *)(v41[7] + 24 * v43);
            *unint64_t v50 = v95;
            v50[1] = v102;
            v50[2] = v103;
          }
          else
          {
            v41[(v43 >> 6) + 8] |= 1 << v43;
            unint64_t v51 = (void *)(v41[6] + 16 * v43);
            *unint64_t v51 = 0x6C6F6369746C756DLL;
            v51[1] = 0xEA0000000000726FLL;
            int64_t v52 = (void *)(v41[7] + 24 * v43);
            *int64_t v52 = v95;
            v52[1] = v102;
            v52[2] = v103;
            uint64_t v53 = v41[2];
            BOOL v36 = __OFADD__(v53, 1);
            uint64_t v54 = v53 + 1;
            if (v36) {
              goto LABEL_73;
            }
            v41[2] = v54;
          }
          *(void *)(v38 + v39) = v41;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v2 = sub_22D32F83C;
          uint64_t v4 = v93;
          uint64_t v1 = v94;
          int64_t v9 = v91;
          uint64_t v5 = v92;
          if (!v18)
          {
LABEL_5:
            swift_bridgeObjectRelease();
LABEL_6:
            swift_bridgeObjectRelease();
            unint64_t v8 = string_8;
            if (!string_8) {
              goto LABEL_8;
            }
            goto LABEL_7;
          }
LABEL_46:
          swift_bridgeObjectRetain_n();
          v55._countAndFlagsBits = string;
          v55._object = v18;
          Version.init(string:)(v55);
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          if (v104 == 1) {
            goto LABEL_6;
          }
          int64_t v96 = v3;
          stringa = v101;
          sub_22D32E15C((uint64_t)v90);
          char v56 = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v57 = *(void *)(v1 + 96);
          *(void *)(v1 + 96) = 0x8000000000000000;
          unint64_t v59 = sub_22D3195C4(v97, v15);
          uint64_t v60 = *(void *)(v57 + 16);
          BOOL v61 = (v58 & 1) == 0;
          uint64_t v62 = v60 + v61;
          if (__OFADD__(v60, v61)) {
            goto LABEL_75;
          }
          char v63 = v58;
          if (*(void *)(v57 + 24) >= v62)
          {
            if ((v56 & 1) == 0) {
              sub_22D327430(&qword_268568608);
            }
          }
          else
          {
            sub_22D324AA0(v62, v56, &qword_268568608);
            unint64_t v64 = sub_22D3195C4(v97, v15);
            if ((v63 & 1) != (v65 & 1)) {
              goto LABEL_79;
            }
            unint64_t v59 = v64;
          }
          *(void *)(v94 + 96) = v57;
          swift_bridgeObjectRelease();
          int v66 = *(void **)(v94 + 96);
          swift_bridgeObjectRetain();
          if ((v63 & 1) == 0)
          {
            unint64_t v67 = sub_22D321FE4(MEMORY[0x263F8EE78]);
            v66[(v59 >> 6) + 8] |= 1 << v59;
            uint64_t v68 = (uint64_t *)(v66[6] + 16 * v59);
            *uint64_t v68 = v97;
            v68[1] = v15;
            *(void *)(v66[7] + 8 * v59) = v67;
            uint64_t v69 = v66[2];
            BOOL v36 = __OFADD__(v69, 1);
            uint64_t v70 = v69 + 1;
            if (v36) {
              goto LABEL_77;
            }
            v66[2] = v70;
            swift_bridgeObjectRetain();
          }
          int64_t v71 = v9;
          uint64_t v72 = v66[7];
          swift_bridgeObjectRelease();
          uint64_t v73 = 8 * v59;
          char v74 = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v75 = *(void **)(v72 + 8 * v59);
          v101 = v75;
          *(void *)(v72 + 8 * v59) = 0x8000000000000000;
          unint64_t v77 = sub_22D322B3C(0x6863726172656968, 0xEC0000006C616369);
          uint64_t v78 = v75[2];
          BOOL v79 = (v76 & 1) == 0;
          uint64_t v80 = v78 + v79;
          if (__OFADD__(v78, v79)) {
            goto LABEL_76;
          }
          char v81 = v76;
          if (v75[3] >= v80)
          {
            if ((v74 & 1) == 0) {
              sub_22D326EF4();
            }
          }
          else
          {
            sub_22D323DEC(v80, v74);
            unint64_t v82 = sub_22D322B3C(0x6863726172656968, 0xEC0000006C616369);
            if ((v81 & 1) != (v83 & 1)) {
              goto LABEL_80;
            }
            unint64_t v77 = v82;
          }
          int64_t v9 = v71;
          if (v81)
          {
            uint64_t v84 = (void *)(v75[7] + 24 * v77);
            *uint64_t v84 = stringa;
            v84[1] = v102;
            v84[2] = v103;
          }
          else
          {
            v75[(v77 >> 6) + 8] |= 1 << v77;
            uint64_t v85 = v75[6] + 16 * v77;
            strcpy((char *)v85, "hierarchical");
            *(unsigned char *)(v85 + 13) = 0;
            *(_WORD *)(v85 + 14) = -5120;
            unint64_t v86 = (void *)(v75[7] + 24 * v77);
            *unint64_t v86 = stringa;
            v86[1] = v102;
            v86[2] = v103;
            uint64_t v87 = v75[2];
            BOOL v36 = __OFADD__(v87, 1);
            uint64_t v88 = v87 + 1;
            if (v36) {
              goto LABEL_78;
            }
            v75[2] = v88;
          }
          uint64_t v4 = v93;
          uint64_t v1 = v94;
          uint64_t v5 = v92;
          *(void *)(v72 + v73) = v101;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v90 = sub_22D32F83C;
          int64_t v3 = v96;
          unint64_t v8 = string_8;
          if (!string_8) {
            goto LABEL_8;
          }
LABEL_7:
          uint64_t string_8 = (v8 - 1) & v8;
        }
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
LABEL_28:
        if (!v18) {
          goto LABEL_5;
        }
        goto LABEL_46;
      }
      int64_t v13 = v11 + 3;
      if (v13 < v9)
      {
        unint64_t v12 = v5[v13];
        int64_t v3 = v13;
        if (!v12)
        {
          while (1)
          {
            int64_t v3 = v13 + 1;
            if (__OFADD__(v13, 1)) {
              goto LABEL_74;
            }
            if (v3 >= v9) {
              goto LABEL_68;
            }
            unint64_t v12 = v5[v3];
            ++v13;
            if (v12) {
              goto LABEL_20;
            }
          }
        }
        goto LABEL_20;
      }
    }
LABEL_68:
    swift_release();
    sub_22D32E15C((uint64_t)v2);
    return sub_22D32E15C((uint64_t)v90);
  }
  __break(1u);
LABEL_70:
  __break(1u);
LABEL_71:
  __break(1u);
LABEL_72:
  __break(1u);
LABEL_73:
  __break(1u);
LABEL_74:
  __break(1u);
LABEL_75:
  __break(1u);
LABEL_76:
  __break(1u);
LABEL_77:
  __break(1u);
LABEL_78:
  __break(1u);
LABEL_79:
  sub_22D34B9E8();
  __break(1u);
LABEL_80:
  uint64_t result = sub_22D34B9E8();
  __break(1u);
  return result;
}

uint64_t SymbolMetadataStore.ingestFeatureAvailabilityPlistData(_:)()
{
  uint64_t v1 = v0;
  sub_22D34B5B8();
  swift_allocObject();
  sub_22D34B5A8();
  sub_22D32CCF0();
  sub_22D34B598();
  swift_release();
  uint64_t v2 = 0;
  int64_t v3 = 0;
  unint64_t v67 = v79 + 8;
  uint64_t v69 = v79;
  uint64_t v70 = v1;
  uint64_t v4 = 1 << *((unsigned char *)v79 + 32);
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & v79[8];
  int64_t v68 = (unint64_t)(v4 + 63) >> 6;
LABEL_6:
  if (v6)
  {
    uint64_t v71 = (v6 - 1) & v6;
    int64_t v72 = v3;
    unint64_t v7 = __clz(__rbit64(v6)) | (v3 << 6);
    goto LABEL_22;
  }
  int64_t v8 = v3 + 1;
  if (__OFADD__(v3, 1)) {
    goto LABEL_72;
  }
  if (v8 >= v68) {
    goto LABEL_65;
  }
  unint64_t v9 = v67[v8];
  int64_t v10 = v3 + 1;
  if (!v9)
  {
    int64_t v10 = v3 + 2;
    if (v3 + 2 >= v68) {
      goto LABEL_65;
    }
    unint64_t v9 = v67[v10];
    if (!v9)
    {
      int64_t v10 = v3 + 3;
      if (v3 + 3 >= v68) {
        goto LABEL_65;
      }
      unint64_t v9 = v67[v10];
      if (!v9)
      {
        uint64_t v11 = v3 + 4;
        if (v3 + 4 < v68)
        {
          unint64_t v9 = v67[v11];
          if (v9)
          {
            int64_t v10 = v3 + 4;
            goto LABEL_21;
          }
          while (1)
          {
            int64_t v10 = v11 + 1;
            if (__OFADD__(v11, 1)) {
              goto LABEL_73;
            }
            if (v10 >= v68) {
              break;
            }
            unint64_t v9 = v67[v10];
            ++v11;
            if (v9) {
              goto LABEL_21;
            }
          }
        }
LABEL_65:
        swift_release();
        return sub_22D32E15C((uint64_t)v2);
      }
    }
  }
LABEL_21:
  uint64_t v71 = (v9 - 1) & v9;
  int64_t v72 = v10;
  unint64_t v7 = __clz(__rbit64(v9)) + (v10 << 6);
LABEL_22:
  unint64_t v12 = (uint64_t *)(v69[6] + 16 * v7);
  uint64_t v13 = *(void *)(v69[7] + 8 * v7);
  uint64_t v14 = v12[1];
  uint64_t v76 = *v12;
  uint64_t v77 = v13 + 64;
  uint64_t v15 = 1 << *(unsigned char *)(v13 + 32);
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & *(void *)(v13 + 64);
  int64_t v78 = (unint64_t)(v15 + 63) >> 6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  int64_t v18 = 0;
  uint64_t v75 = v14;
  if (v17)
  {
LABEL_26:
    unint64_t v19 = __clz(__rbit64(v17));
    v17 &= v17 - 1;
    unint64_t v20 = v19 | (v18 << 6);
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v29 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
      __break(1u);
      goto LABEL_67;
    }
    if (v29 >= v78) {
      goto LABEL_5;
    }
    unint64_t v30 = *(void *)(v77 + 8 * v29);
    ++v18;
    if (v30) {
      goto LABEL_42;
    }
    int64_t v18 = v29 + 1;
    if (v29 + 1 >= v78) {
      goto LABEL_5;
    }
    unint64_t v30 = *(void *)(v77 + 8 * v18);
    if (v30) {
      goto LABEL_42;
    }
    int64_t v18 = v29 + 2;
    if (v29 + 2 >= v78) {
      goto LABEL_5;
    }
    unint64_t v30 = *(void *)(v77 + 8 * v18);
    if (v30) {
      goto LABEL_42;
    }
    int64_t v31 = v29 + 3;
    if (v31 >= v78)
    {
LABEL_5:
      swift_bridgeObjectRelease();
      swift_release();
      unint64_t v6 = v71;
      int64_t v3 = v72;
      goto LABEL_6;
    }
    unint64_t v30 = *(void *)(v77 + 8 * v31);
    if (!v30) {
      break;
    }
    int64_t v18 = v31;
LABEL_42:
    unint64_t v17 = (v30 - 1) & v30;
    unint64_t v20 = __clz(__rbit64(v30)) + (v18 << 6);
LABEL_27:
    uint64_t v21 = 16 * v20;
    uint64_t v22 = (uint64_t *)(*(void *)(v13 + 48) + v21);
    uint64_t v24 = *v22;
    uint64_t v23 = v22[1];
    unint64_t v25 = (uint64_t *)(*(void *)(v13 + 56) + v21);
    uint64_t v26 = *v25;
    BOOL v27 = (void *)v25[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v28._countAndFlagsBits = v26;
    v28._object = v27;
    Version.init(string:)(v28);
    if (v82 == 1)
    {
      swift_bridgeObjectRelease();
      if (v17) {
        goto LABEL_26;
      }
    }
    else
    {
      char v74 = v79;
      swift_bridgeObjectRetain();
      sub_22D32E15C((uint64_t)v2);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v33 = *(void *)(v1 + 96);
      *(void *)(v1 + 96) = 0x8000000000000000;
      unint64_t v35 = sub_22D3195C4(v76, v14);
      uint64_t v36 = *(void *)(v33 + 16);
      BOOL v37 = (v34 & 1) == 0;
      uint64_t v38 = v36 + v37;
      if (__OFADD__(v36, v37)) {
        goto LABEL_68;
      }
      char v39 = v34;
      if (*(void *)(v33 + 24) >= v38)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          sub_22D327430(&qword_268568608);
        }
      }
      else
      {
        sub_22D324AA0(v38, isUniquelyReferenced_nonNull_native, &qword_268568608);
        unint64_t v40 = sub_22D3195C4(v76, v75);
        if ((v39 & 1) != (v41 & 1)) {
          goto LABEL_74;
        }
        unint64_t v35 = v40;
      }
      *(void *)(v1 + 96) = v33;
      swift_bridgeObjectRelease();
      char v42 = *(void **)(v1 + 96);
      swift_bridgeObjectRetain();
      if ((v39 & 1) == 0)
      {
        unint64_t v43 = sub_22D321FE4(MEMORY[0x263F8EE78]);
        v42[(v35 >> 6) + 8] |= 1 << v35;
        uint64_t v44 = (uint64_t *)(v42[6] + 16 * v35);
        *uint64_t v44 = v76;
        v44[1] = v75;
        *(void *)(v42[7] + 8 * v35) = v43;
        uint64_t v45 = v42[2];
        BOOL v46 = __OFADD__(v45, 1);
        uint64_t v47 = v45 + 1;
        if (v46) {
          goto LABEL_70;
        }
        v42[2] = v47;
        swift_bridgeObjectRetain();
      }
      uint64_t v48 = v42[7];
      swift_bridgeObjectRelease();
      uint64_t v49 = 8 * v35;
      char v50 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v51 = *(void **)(v48 + 8 * v35);
      BOOL v79 = v51;
      uint64_t v73 = v48;
      *(void *)(v48 + 8 * v35) = 0x8000000000000000;
      unint64_t v53 = sub_22D322B3C(v24, v23);
      uint64_t v54 = v51[2];
      BOOL v55 = (v52 & 1) == 0;
      uint64_t v56 = v54 + v55;
      if (__OFADD__(v54, v55)) {
        goto LABEL_69;
      }
      char v57 = v52;
      if (v51[3] >= v56)
      {
        if (v50)
        {
          uint64_t v60 = v51;
          if ((v52 & 1) == 0) {
            goto LABEL_61;
          }
        }
        else
        {
          sub_22D326EF4();
          uint64_t v60 = v51;
          if ((v57 & 1) == 0) {
            goto LABEL_61;
          }
        }
      }
      else
      {
        sub_22D323DEC(v56, v50);
        unint64_t v58 = sub_22D322B3C(v24, v23);
        if ((v57 & 1) != (v59 & 1)) {
          goto LABEL_75;
        }
        unint64_t v53 = v58;
        uint64_t v60 = v51;
        if ((v57 & 1) == 0)
        {
LABEL_61:
          v60[(v53 >> 6) + 8] |= 1 << v53;
          uint64_t v62 = (uint64_t *)(v60[6] + 16 * v53);
          *uint64_t v62 = v24;
          v62[1] = v23;
          char v63 = (void *)(v60[7] + 24 * v53);
          void *v63 = v74;
          v63[1] = v80;
          v63[2] = v81;
          uint64_t v64 = v60[2];
          BOOL v46 = __OFADD__(v64, 1);
          uint64_t v65 = v64 + 1;
          if (v46) {
            goto LABEL_71;
          }
          v60[2] = v65;
          swift_bridgeObjectRetain();
          goto LABEL_63;
        }
      }
      BOOL v61 = (void *)(v60[7] + 24 * v53);
      void *v61 = v74;
      v61[1] = v80;
      v61[2] = v81;
LABEL_63:
      *(void *)(v73 + v49) = v60;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = v75;
      swift_bridgeObjectRelease();
      uint64_t v2 = sub_22D322460;
      uint64_t v1 = v70;
      if (v17) {
        goto LABEL_26;
      }
    }
  }
  while (1)
  {
    int64_t v18 = v31 + 1;
    if (__OFADD__(v31, 1)) {
      break;
    }
    if (v18 >= v78) {
      goto LABEL_5;
    }
    unint64_t v30 = *(void *)(v77 + 8 * v18);
    ++v31;
    if (v30) {
      goto LABEL_42;
    }
  }
LABEL_67:
  __break(1u);
LABEL_68:
  __break(1u);
LABEL_69:
  __break(1u);
LABEL_70:
  __break(1u);
LABEL_71:
  __break(1u);
LABEL_72:
  __break(1u);
LABEL_73:
  __break(1u);
LABEL_74:
  sub_22D34B9E8();
  __break(1u);
LABEL_75:
  uint64_t result = sub_22D34B9E8();
  __break(1u);
  return result;
}

uint64_t SymbolMetadataStore.ingestSymbolPropertiesPlistData(_:)()
{
  uint64_t v1 = v0;
  sub_22D34B5B8();
  swift_allocObject();
  sub_22D34B5A8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268568540);
  sub_22D32CD44();
  sub_22D34B598();
  swift_release();
  uint64_t v2 = 0;
  int64_t v3 = 0;
  uint64_t v69 = v81 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(v81 + 32);
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(v81 + 64);
  int64_t v70 = (unint64_t)(v4 + 63) >> 6;
LABEL_6:
  if (!v6)
  {
    int64_t v8 = v3 + 1;
    if (__OFADD__(v3, 1)) {
      goto LABEL_71;
    }
    if (v8 >= v70) {
      goto LABEL_64;
    }
    unint64_t v9 = *(void *)(v69 + 8 * v8);
    int64_t v10 = v3 + 1;
    if (!v9)
    {
      int64_t v10 = v3 + 2;
      if (v3 + 2 >= v70) {
        goto LABEL_64;
      }
      unint64_t v9 = *(void *)(v69 + 8 * v10);
      if (!v9)
      {
        int64_t v10 = v3 + 3;
        if (v3 + 3 >= v70) {
          goto LABEL_64;
        }
        unint64_t v9 = *(void *)(v69 + 8 * v10);
        if (!v9)
        {
          uint64_t v11 = v3 + 4;
          if (v3 + 4 < v70)
          {
            unint64_t v9 = *(void *)(v69 + 8 * v11);
            if (v9)
            {
              int64_t v10 = v3 + 4;
              goto LABEL_21;
            }
            while (1)
            {
              int64_t v10 = v11 + 1;
              if (__OFADD__(v11, 1)) {
                goto LABEL_72;
              }
              if (v10 >= v70) {
                break;
              }
              unint64_t v9 = *(void *)(v69 + 8 * v10);
              ++v11;
              if (v9) {
                goto LABEL_21;
              }
            }
          }
LABEL_64:
          swift_release();
          return sub_22D32E15C((uint64_t)v2);
        }
      }
    }
LABEL_21:
    uint64_t v71 = (v9 - 1) & v9;
    int64_t v72 = v10;
    unint64_t v7 = __clz(__rbit64(v9)) + (v10 << 6);
    goto LABEL_22;
  }
  uint64_t v71 = (v6 - 1) & v6;
  int64_t v72 = v3;
  unint64_t v7 = __clz(__rbit64(v6)) | (v3 << 6);
LABEL_22:
  unint64_t v12 = (uint64_t *)(*(void *)(v81 + 48) + 16 * v7);
  uint64_t v13 = *(void *)(*(void *)(v81 + 56) + 8 * v7);
  uint64_t v15 = *v12;
  uint64_t v14 = v12[1];
  uint64_t v73 = v13 + 64;
  uint64_t v16 = 1 << *(unsigned char *)(v13 + 32);
  if (v16 < 64) {
    uint64_t v17 = ~(-1 << v16);
  }
  else {
    uint64_t v17 = -1;
  }
  unint64_t v18 = v17 & *(void *)(v13 + 64);
  int64_t v74 = (unint64_t)(v16 + 63) >> 6;
  swift_bridgeObjectRetain();
  uint64_t v75 = v13;
  swift_bridgeObjectRetain();
  for (int64_t i = 0; ; int64_t i = v77)
  {
    if (v18)
    {
      unint64_t v21 = __clz(__rbit64(v18));
      uint64_t v22 = (v18 - 1) & v18;
      unint64_t v23 = v21 | (i << 6);
    }
    else
    {
      int64_t v24 = i + 1;
      if (__OFADD__(i, 1)) {
        goto LABEL_69;
      }
      if (v24 >= v74)
      {
LABEL_5:
        swift_bridgeObjectRelease();
        swift_release();
        unint64_t v6 = v71;
        int64_t v3 = v72;
        goto LABEL_6;
      }
      unint64_t v25 = *(void *)(v73 + 8 * v24);
      ++i;
      if (!v25)
      {
        int64_t i = v24 + 1;
        if (v24 + 1 >= v74) {
          goto LABEL_5;
        }
        unint64_t v25 = *(void *)(v73 + 8 * i);
        if (!v25)
        {
          int64_t i = v24 + 2;
          if (v24 + 2 >= v74) {
            goto LABEL_5;
          }
          unint64_t v25 = *(void *)(v73 + 8 * i);
          if (!v25)
          {
            int64_t v26 = v24 + 3;
            if (v26 >= v74) {
              goto LABEL_5;
            }
            unint64_t v25 = *(void *)(v73 + 8 * v26);
            if (!v25)
            {
              while (1)
              {
                int64_t i = v26 + 1;
                if (__OFADD__(v26, 1)) {
                  goto LABEL_70;
                }
                if (i >= v74) {
                  goto LABEL_5;
                }
                unint64_t v25 = *(void *)(v73 + 8 * i);
                ++v26;
                if (v25) {
                  goto LABEL_43;
                }
              }
            }
            int64_t i = v26;
          }
        }
      }
LABEL_43:
      uint64_t v22 = (v25 - 1) & v25;
      unint64_t v23 = __clz(__rbit64(v25)) + (i << 6);
    }
    uint64_t v27 = 16 * v23;
    Swift::String v28 = (uint64_t *)(*(void *)(v75 + 48) + v27);
    uint64_t v29 = v28[1];
    uint64_t v80 = *v28;
    unint64_t v30 = (uint64_t *)(*(void *)(v75 + 56) + v27);
    uint64_t v31 = v30[1];
    uint64_t v78 = *v30;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v79 = v31;
    swift_bridgeObjectRetain();
    sub_22D32E15C((uint64_t)v2);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v33 = *(void *)(v1 + 104);
    *(void *)(v1 + 104) = 0x8000000000000000;
    unint64_t v35 = sub_22D3195C4(v15, v14);
    uint64_t v36 = *(void *)(v33 + 16);
    BOOL v37 = (v34 & 1) == 0;
    uint64_t v38 = v36 + v37;
    if (__OFADD__(v36, v37)) {
      break;
    }
    char v39 = v34;
    if (*(void *)(v33 + 24) >= v38)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        sub_22D327430(&qword_2685685F8);
      }
    }
    else
    {
      sub_22D324AA0(v38, isUniquelyReferenced_nonNull_native, &qword_2685685F8);
      unint64_t v40 = sub_22D3195C4(v15, v14);
      if ((v39 & 1) != (v41 & 1)) {
        goto LABEL_73;
      }
      unint64_t v35 = v40;
    }
    *(void *)(v1 + 104) = v33;
    swift_bridgeObjectRelease();
    char v42 = *(void **)(v1 + 104);
    swift_bridgeObjectRetain();
    if ((v39 & 1) == 0)
    {
      unint64_t v43 = sub_22D322118(MEMORY[0x263F8EE78]);
      v42[(v35 >> 6) + 8] |= 1 << v35;
      uint64_t v44 = (uint64_t *)(v42[6] + 16 * v35);
      *uint64_t v44 = v15;
      v44[1] = v14;
      *(void *)(v42[7] + 8 * v35) = v43;
      uint64_t v45 = v42[2];
      BOOL v46 = __OFADD__(v45, 1);
      uint64_t v47 = v45 + 1;
      if (v46) {
        goto LABEL_67;
      }
      v42[2] = v47;
      swift_bridgeObjectRetain();
    }
    unint64_t v76 = v22;
    int64_t v77 = i;
    uint64_t v48 = v15;
    uint64_t v49 = v14;
    uint64_t v50 = v1;
    uint64_t v51 = v42[7];
    swift_bridgeObjectRelease();
    uint64_t v52 = 8 * v35;
    char v53 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v54 = *(void **)(v51 + 8 * v35);
    *(void *)(v51 + 8 * v35) = 0x8000000000000000;
    unint64_t v56 = sub_22D322B3C(v80, v29);
    uint64_t v57 = v54[2];
    BOOL v58 = (v55 & 1) == 0;
    uint64_t v59 = v57 + v58;
    if (__OFADD__(v57, v58)) {
      goto LABEL_66;
    }
    char v60 = v55;
    if (v54[3] >= v59)
    {
      if (v53)
      {
        char v63 = v54;
        if (v55) {
          goto LABEL_26;
        }
      }
      else
      {
        sub_22D327274();
        char v63 = v54;
        if (v60) {
          goto LABEL_26;
        }
      }
    }
    else
    {
      sub_22D324768(v59, v53);
      unint64_t v61 = sub_22D322B3C(v80, v29);
      if ((v60 & 1) != (v62 & 1)) {
        goto LABEL_74;
      }
      unint64_t v56 = v61;
      char v63 = v54;
      if (v60)
      {
LABEL_26:
        unint64_t v20 = (void *)(v63[7] + 16 * v56);
        swift_bridgeObjectRelease();
        *unint64_t v20 = v78;
        v20[1] = v79;
        goto LABEL_27;
      }
    }
    v63[(v56 >> 6) + 8] |= 1 << v56;
    uint64_t v64 = (uint64_t *)(v63[6] + 16 * v56);
    *uint64_t v64 = v80;
    v64[1] = v29;
    uint64_t v65 = (void *)(v63[7] + 16 * v56);
    *uint64_t v65 = v78;
    v65[1] = v79;
    uint64_t v66 = v63[2];
    BOOL v46 = __OFADD__(v66, 1);
    uint64_t v67 = v66 + 1;
    if (v46) {
      goto LABEL_68;
    }
    v63[2] = v67;
    swift_bridgeObjectRetain();
LABEL_27:
    *(void *)(v51 + v52) = v63;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v14 = v49;
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_22D322978;
    uint64_t v1 = v50;
    uint64_t v15 = v48;
    unint64_t v18 = v76;
  }
  __break(1u);
LABEL_66:
  __break(1u);
LABEL_67:
  __break(1u);
LABEL_68:
  __break(1u);
LABEL_69:
  __break(1u);
LABEL_70:
  __break(1u);
LABEL_71:
  __break(1u);
LABEL_72:
  __break(1u);
LABEL_73:
  sub_22D34B9E8();
  __break(1u);
LABEL_74:
  uint64_t result = sub_22D34B9E8();
  __break(1u);
  return result;
}

uint64_t SymbolMetadataStore.ingestSymbolSearchPlistData(_:)()
{
  sub_22D34B5B8();
  swift_allocObject();
  sub_22D34B5A8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685684E0);
  sub_22D32DC7C(&qword_2685684E8, &qword_2685684E0, (void (*)(void))sub_22D32CB14);
  sub_22D34B598();
  uint64_t v42 = v0;
  swift_release();
  uint64_t v1 = 0;
  int64_t v2 = 0;
  uint64_t v3 = v44;
  uint64_t v4 = v44 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(v44 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(v44 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v38 = v44 + 64;
  uint64_t v39 = v44;
  int64_t v37 = v8;
  if (!v7) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v9 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  for (unint64_t i = v9 | (v2 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v2 << 6))
  {
    uint64_t v11 = *(void *)(*(void *)(v3 + 56) + 8 * i);
    uint64_t v12 = *(void *)(v11 + 16);
    if (v12)
    {
      unint64_t v40 = v7;
      int64_t v41 = v2;
      uint64_t v16 = (uint64_t *)(*(void *)(v3 + 48) + 16 * i);
      uint64_t v17 = v16[1];
      uint64_t v43 = *v16;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v18 = (uint64_t *)(v11 + 40);
      do
      {
        uint64_t v19 = *(v18 - 1);
        uint64_t v20 = *v18;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_22D32E15C((uint64_t)v1);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v44 = *(void *)(v42 + 32);
        uint64_t v22 = v44;
        *(void *)(v42 + 32) = 0x8000000000000000;
        unint64_t v24 = sub_22D3195C4(v43, v17);
        uint64_t v25 = *(void *)(v22 + 16);
        BOOL v26 = (v23 & 1) == 0;
        uint64_t v27 = v25 + v26;
        if (__OFADD__(v25, v26))
        {
          __break(1u);
LABEL_41:
          __break(1u);
          goto LABEL_42;
        }
        char v28 = v23;
        if (*(void *)(v22 + 24) >= v27)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_22D327430(&qword_268568618);
            uint64_t v22 = v44;
          }
        }
        else
        {
          sub_22D324AA0(v27, isUniquelyReferenced_nonNull_native, &qword_268568618);
          uint64_t v22 = v44;
          unint64_t v29 = sub_22D3195C4(v43, v17);
          if ((v28 & 1) != (v30 & 1)) {
            goto LABEL_44;
          }
          unint64_t v24 = v29;
        }
        *(void *)(v42 + 32) = v22;
        swift_bridgeObjectRelease();
        uint64_t v31 = *(void **)(v42 + 32);
        if ((v28 & 1) == 0)
        {
          v31[(v24 >> 6) + 8] |= 1 << v24;
          uint64_t v32 = (uint64_t *)(v31[6] + 16 * v24);
          *uint64_t v32 = v43;
          v32[1] = v17;
          *(void *)(v31[7] + 8 * v24) = MEMORY[0x263F8EE88];
          uint64_t v33 = v31[2];
          uint64_t v34 = v33 + 1;
          BOOL v35 = __OFADD__(v33, 1);
          swift_bridgeObjectRetain();
          if (v35) {
            goto LABEL_41;
          }
          v31[2] = v34;
        }
        v18 += 2;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        sub_22D327CB4(&v44, v19, v20);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v1 = sub_22D32258C;
        --v12;
      }
      while (v12);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v1 = sub_22D32258C;
      uint64_t v4 = v38;
      uint64_t v3 = v39;
      int64_t v8 = v37;
      unint64_t v7 = v40;
      int64_t v2 = v41;
      if (v40) {
        goto LABEL_4;
      }
    }
    else if (v7)
    {
      goto LABEL_4;
    }
LABEL_7:
    if (__OFADD__(v2++, 1))
    {
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    if (v2 >= v8) {
      goto LABEL_39;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v2);
    if (!v14) {
      break;
    }
LABEL_17:
    unint64_t v7 = (v14 - 1) & v14;
  }
  int64_t v15 = v2 + 1;
  if (v2 + 1 >= v8) {
    goto LABEL_39;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_16;
  }
  int64_t v15 = v2 + 2;
  if (v2 + 2 >= v8) {
    goto LABEL_39;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_16;
  }
  int64_t v15 = v2 + 3;
  if (v2 + 3 >= v8)
  {
LABEL_39:
    swift_release();
    return sub_22D32E15C((uint64_t)v1);
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_16:
    int64_t v2 = v15;
    goto LABEL_17;
  }
  while (1)
  {
    int64_t v2 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v2 >= v8) {
      goto LABEL_39;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v2);
    ++v15;
    if (v14) {
      goto LABEL_17;
    }
  }
LABEL_43:
  __break(1u);
LABEL_44:
  uint64_t result = sub_22D34B9E8();
  __break(1u);
  return result;
}

uint64_t SymbolMetadataStore.ingestSymbolOrderPlistData(_:)()
{
  uint64_t v1 = v0;
  sub_22D34B5B8();
  swift_allocObject();
  sub_22D34B5A8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268568550);
  sub_22D32CDD4(&qword_268568558, &qword_268568550);
  sub_22D34B598();
  swift_release();
  int64_t v2 = 0;
  uint64_t v34 = v35;
  uint64_t v3 = 1 << v35[32];
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *((void *)v35 + 8);
  uint64_t v32 = v35 + 64;
  int64_t v33 = (unint64_t)(v3 + 63) >> 6;
  while (1)
  {
    if (v5)
    {
      unint64_t v6 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v7 = v6 | (v2 << 6);
      goto LABEL_22;
    }
    int64_t v8 = v2 + 1;
    if (__OFADD__(v2, 1)) {
      goto LABEL_37;
    }
    if (v8 >= v33) {
      break;
    }
    unint64_t v9 = *(void *)&v32[8 * v8];
    ++v2;
    if (!v9)
    {
      int64_t v2 = v8 + 1;
      if (v8 + 1 >= v33) {
        break;
      }
      unint64_t v9 = *(void *)&v32[8 * v2];
      if (!v9)
      {
        int64_t v2 = v8 + 2;
        if (v8 + 2 >= v33) {
          break;
        }
        unint64_t v9 = *(void *)&v32[8 * v2];
        if (!v9)
        {
          int64_t v10 = v8 + 3;
          if (v10 >= v33) {
            break;
          }
          unint64_t v9 = *(void *)&v32[8 * v10];
          if (!v9)
          {
            while (1)
            {
              int64_t v2 = v10 + 1;
              if (__OFADD__(v10, 1)) {
                goto LABEL_38;
              }
              if (v2 >= v33) {
                goto LABEL_33;
              }
              unint64_t v9 = *(void *)&v32[8 * v2];
              ++v10;
              if (v9) {
                goto LABEL_21;
              }
            }
          }
          int64_t v2 = v10;
        }
      }
    }
LABEL_21:
    unint64_t v5 = (v9 - 1) & v9;
    unint64_t v7 = __clz(__rbit64(v9)) + (v2 << 6);
LABEL_22:
    uint64_t v11 = (uint64_t *)(*((void *)v34 + 6) + 16 * v7);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    uint64_t v14 = *(void *)(*((void *)v34 + 7) + 8 * v7);
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    BOOL v35 = v1[5];
    uint64_t v16 = v35;
    v1[5] = (char *)0x8000000000000000;
    unint64_t v18 = sub_22D3195C4(v13, v12);
    uint64_t v19 = *((void *)v16 + 2);
    BOOL v20 = (v17 & 1) == 0;
    uint64_t v21 = v19 + v20;
    if (__OFADD__(v19, v20))
    {
      __break(1u);
LABEL_36:
      __break(1u);
LABEL_37:
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      sub_22D34B9E8();
      __break(1u);
      uint64_t result = swift_release();
      __break(1u);
      return result;
    }
    char v22 = v17;
    if (*((void *)v16 + 3) >= v21)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        uint64_t v25 = v35;
        if (v17) {
          goto LABEL_4;
        }
      }
      else
      {
        sub_22D3275E0();
        uint64_t v25 = v35;
        if (v22) {
          goto LABEL_4;
        }
      }
    }
    else
    {
      sub_22D324DB4(v21, isUniquelyReferenced_nonNull_native);
      unint64_t v23 = sub_22D3195C4(v13, v12);
      if ((v22 & 1) != (v24 & 1)) {
        goto LABEL_39;
      }
      unint64_t v18 = v23;
      uint64_t v25 = v35;
      if (v22)
      {
LABEL_4:
        *(void *)(*((void *)v25 + 7) + 8 * v18) = v14;
        goto LABEL_5;
      }
    }
    *(void *)&v25[8 * (v18 >> 6) + 64] |= 1 << v18;
    BOOL v26 = (uint64_t *)(*((void *)v25 + 6) + 16 * v18);
    *BOOL v26 = v13;
    v26[1] = v12;
    *(void *)(*((void *)v25 + 7) + 8 * v18) = v14;
    uint64_t v27 = *((void *)v25 + 2);
    BOOL v28 = __OFADD__(v27, 1);
    uint64_t v29 = v27 + 1;
    if (v28) {
      goto LABEL_36;
    }
    *((void *)v25 + 2) = v29;
    swift_bridgeObjectRetain();
LABEL_5:
    v1[5] = v25;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
LABEL_33:
  swift_release();
  BOOL v35 = *v1;
  swift_bridgeObjectRetain_n();
  sub_22D32A990(&v35, v1);
  swift_bridgeObjectRelease();
  char v30 = v35;
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = v30;
  return result;
}

uint64_t sub_22D321B98()
{
  if (*v0) {
    return 0x5F6F745F72616579;
  }
  else {
    return 0x736C6F626D7973;
  }
}

uint64_t sub_22D321BE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_22D32D0B4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_22D321C08(uint64_t a1)
{
  unint64_t v2 = sub_22D32D40C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_22D321C44(uint64_t a1)
{
  unint64_t v2 = sub_22D32D40C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_22D321C80@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_22D32D1CC(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_22D321CAC(uint64_t a1)
{
  uint64_t v2 = a1 + 64;
  uint64_t v36 = MEMORY[0x263F8EE80];
  uint64_t v40 = MEMORY[0x263F8EE80];
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v6 = (unint64_t)(63 - v3) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  if (!v5) {
    goto LABEL_8;
  }
LABEL_5:
  unint64_t v9 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v10 = v9 | (v8 << 6);
  while (1)
  {
    uint64_t v11 = 16 * v10;
    uint64_t v12 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v14 = *v12;
    uint64_t v13 = v12[1];
    int64_t v15 = (uint64_t *)(*(void *)(a1 + 56) + v11);
    uint64_t v16 = *v15;
    char v17 = (void *)v15[1];
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    v18._countAndFlagsBits = v16;
    v18._object = v17;
    Version.init(string:)(v18);
    if (v39)
    {
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      if (v5) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v23 = v36;
      unint64_t v24 = *(void *)(v36 + 16);
      if (*(void *)(v36 + 24) <= v24)
      {
        sub_22D324128(v24 + 1, 1);
        uint64_t v23 = v40;
      }
      uint64_t v36 = v23;
      sub_22D34BA48();
      sub_22D34B778();
      uint64_t result = sub_22D34BA78();
      uint64_t v25 = v36 + 64;
      uint64_t v26 = -1 << *(unsigned char *)(v36 + 32);
      unint64_t v27 = result & ~v26;
      unint64_t v28 = v27 >> 6;
      if (((-1 << v27) & ~*(void *)(v36 + 64 + 8 * (v27 >> 6))) == 0)
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v26) >> 6;
        while (++v28 != v31 || (v30 & 1) == 0)
        {
          BOOL v32 = v28 == v31;
          if (v28 == v31) {
            unint64_t v28 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v25 + 8 * v28);
          if (v33 != -1)
          {
            unint64_t v29 = __clz(__rbit64(~v33)) + (v28 << 6);
            goto LABEL_36;
          }
        }
        goto LABEL_40;
      }
      unint64_t v29 = __clz(__rbit64((-1 << v27) & ~*(void *)(v36 + 64 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
LABEL_36:
      *(void *)(v25 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v29;
      uint64_t v34 = (void *)(*(void *)(v36 + 48) + 16 * v29);
      void *v34 = v14;
      v34[1] = v13;
      uint64_t v35 = *(void *)(v36 + 56) + 24 * v29;
      *(_OWORD *)uint64_t v35 = v37;
      *(void *)(v35 + 16) = v38;
      ++*(void *)(v36 + 16);
      uint64_t result = swift_bridgeObjectRelease();
      if (v5) {
        goto LABEL_5;
      }
    }
LABEL_8:
    int64_t v19 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
    if (v19 >= v6) {
      goto LABEL_38;
    }
    unint64_t v20 = *(void *)(v2 + 8 * v19);
    int64_t v21 = v8 + 1;
    if (!v20)
    {
      int64_t v21 = v8 + 2;
      if (v8 + 2 >= v6) {
        goto LABEL_38;
      }
      unint64_t v20 = *(void *)(v2 + 8 * v21);
      if (!v20)
      {
        int64_t v21 = v8 + 3;
        if (v8 + 3 >= v6) {
          goto LABEL_38;
        }
        unint64_t v20 = *(void *)(v2 + 8 * v21);
        if (!v20)
        {
          int64_t v21 = v8 + 4;
          if (v8 + 4 >= v6) {
            goto LABEL_38;
          }
          unint64_t v20 = *(void *)(v2 + 8 * v21);
          if (!v20) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v5 = (v20 - 1) & v20;
    unint64_t v10 = __clz(__rbit64(v20)) + (v21 << 6);
    int64_t v8 = v21;
  }
  int64_t v22 = v8 + 5;
  if (v8 + 5 >= v6)
  {
LABEL_38:
    sub_22D32E154();
    return v36;
  }
  unint64_t v20 = *(void *)(v2 + 8 * v22);
  if (v20)
  {
    int64_t v21 = v8 + 5;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v21 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v21 >= v6) {
      goto LABEL_38;
    }
    unint64_t v20 = *(void *)(v2 + 8 * v21);
    ++v22;
    if (v20) {
      goto LABEL_23;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

unint64_t sub_22D321FE4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268568610);
  uint64_t v2 = (void *)sub_22D34B928();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 64);
  while (1)
  {
    uint64_t v5 = *(v4 - 4);
    uint64_t v6 = *(v4 - 3);
    uint64_t v8 = *(v4 - 2);
    uint64_t v7 = *(v4 - 1);
    uint64_t v9 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_22D322B3C(v5, v6);
    if (v11) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v12 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v12 = v5;
    v12[1] = v6;
    uint64_t v13 = (void *)(v2[7] + 24 * result);
    void *v13 = v8;
    v13[1] = v7;
    v13[2] = v9;
    uint64_t v14 = v2[2];
    BOOL v15 = __OFADD__(v14, 1);
    uint64_t v16 = v14 + 1;
    if (v15) {
      goto LABEL_11;
    }
    v4 += 5;
    v2[2] = v16;
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

unint64_t sub_22D322118(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268568600);
  uint64_t v2 = (void *)sub_22D34B928();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_22D322B3C(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v11 = (uint64_t *)(v2[6] + 16 * result);
    *char v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
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

unint64_t sub_22D32223C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685685E0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685685D8);
  uint64_t v6 = sub_22D34B928();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = (uint64_t)&v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v24[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_22D32E0A8(v12, (uint64_t)v5);
    unint64_t result = sub_22D322BC0((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_22D34B6B8();
    (*(void (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    uint64_t v19 = v7[7];
    uint64_t v20 = type metadata accessor for CustomSymbol();
    unint64_t result = sub_22D32E040(v9, v19 + *(void *)(*(void *)(v20 - 8) + 72) * v16, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
    uint64_t v21 = v7[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_11;
    }
    v7[2] = v23;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_22D322460@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_22D321FE4(MEMORY[0x263F8EE78]);
  *a1 = result;
  return result;
}

uint64_t sub_22D322490()
{
  if (*v0) {
    return 1852793705;
  }
  else {
    return 7955819;
  }
}

uint64_t sub_22D3224BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_22D32D460(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_22D3224E4(uint64_t a1)
{
  unint64_t v2 = sub_22D32D73C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_22D322520(uint64_t a1)
{
  unint64_t v2 = sub_22D32D73C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_22D32255C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_22D32D534(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

void sub_22D32258C(void *a1@<X8>)
{
  *a1 = MEMORY[0x263F8EE88];
}

uint64_t sub_22D32259C()
{
  if (*v0) {
    return 0x6863726172656968;
  }
  else {
    return 0x6C6F6369746C756DLL;
  }
}

uint64_t sub_22D3225E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_22D32D790(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_22D32260C(uint64_t a1)
{
  unint64_t v2 = sub_22D32EE40();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_22D322648(uint64_t a1)
{
  unint64_t v2 = sub_22D32EE40();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_22D322684@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_22D32D8A8(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_22D3226B4()
{
  return 1;
}

uint64_t sub_22D3226C4()
{
  return 0x736C6F626D7973;
}

void sub_22D3226E0(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_22D3226EC(uint64_t a1)
{
  unint64_t v2 = sub_22D32DC28();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_22D322728(uint64_t a1)
{
  unint64_t v2 = sub_22D32DC28();
  return MEMORY[0x270FA00B8](a1, v2);
}

void *sub_22D322764@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_22D32DA8C(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_22D322790()
{
  return sub_22D34BA78();
}

uint64_t sub_22D3227D4()
{
  return sub_22D34BA58();
}

uint64_t sub_22D3227FC()
{
  return sub_22D34BA78();
}

uint64_t sub_22D32283C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x736C6F626D7973 && a2 == 0xE700000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_22D34B9A8();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_22D3228D4(uint64_t a1)
{
  unint64_t v2 = sub_22D32DEC8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_22D322910(uint64_t a1)
{
  unint64_t v2 = sub_22D32DEC8();
  return MEMORY[0x270FA00B8](a1, v2);
}

void *sub_22D32294C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_22D32DD50(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

unint64_t sub_22D322978@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_22D322118(MEMORY[0x263F8EE78]);
  *a1 = result;
  return result;
}

unint64_t sub_22D3229A8(uint64_t a1)
{
  uint64_t v2 = sub_22D34BA38();
  return sub_22D325F28(a1, v2);
}

unint64_t sub_22D3229EC(int a1)
{
  sub_22D34BA48();
  sub_22D34BA68();
  uint64_t v2 = sub_22D34BA78();
  return sub_22D325FC4(a1, v2);
}

unint64_t sub_22D322A5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_22D34BA48();
  sub_22D34BA58();
  sub_22D34BA58();
  sub_22D34BA58();
  uint64_t v6 = sub_22D34BA78();
  return sub_22D326060(a1, a2, a3, v6);
}

unint64_t sub_22D322AF8(unsigned __int8 a1)
{
  uint64_t v2 = sub_22D32F858();
  return sub_22D3260E8(a1, v2);
}

unint64_t sub_22D322B3C(uint64_t a1, uint64_t a2)
{
  sub_22D34BA48();
  swift_bridgeObjectRetain();
  sub_22D34B778();
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_22D34BA78();
  return sub_22D31963C(a1, a2, v4);
}

unint64_t sub_22D322BC0(uint64_t a1)
{
  sub_22D34B6B8();
  sub_22D32E110(&qword_2685685C0);
  uint64_t v2 = sub_22D34B6C8();
  return sub_22D3263A0(a1, v2);
}

uint64_t sub_22D322C44(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268568650);
  char v43 = a2;
  uint64_t v6 = sub_22D34B918();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    int64_t v41 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v40 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v42 = v5;
    while (1)
    {
      if (v10)
      {
        unint64_t v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v44 = v13;
        unint64_t v21 = v20 | (v13 << 6);
      }
      else
      {
        int64_t v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v40) {
          goto LABEL_33;
        }
        unint64_t v23 = v41[v22];
        int64_t v24 = v13 + 1;
        if (!v23)
        {
          int64_t v24 = v13 + 2;
          if (v13 + 2 >= v40) {
            goto LABEL_33;
          }
          unint64_t v23 = v41[v24];
          if (!v23)
          {
            uint64_t v25 = v13 + 3;
            if (v13 + 3 >= v40)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v2;
              if (v43)
              {
                uint64_t v39 = 1 << *(unsigned char *)(v5 + 32);
                if (v39 >= 64) {
                  bzero(v41, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v41 = -1 << v39;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v41[v25];
            if (!v23)
            {
              while (1)
              {
                int64_t v24 = v25 + 1;
                if (__OFADD__(v25, 1)) {
                  goto LABEL_40;
                }
                if (v24 >= v40) {
                  goto LABEL_33;
                }
                unint64_t v23 = v41[v24];
                ++v25;
                if (v23) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v24 = v13 + 3;
          }
        }
LABEL_30:
        unint64_t v10 = (v23 - 1) & v23;
        int64_t v44 = v24;
        unint64_t v21 = __clz(__rbit64(v23)) + (v24 << 6);
      }
      uint64_t v30 = *(void *)(v5 + 56);
      unint64_t v31 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
      uint64_t v33 = *v31;
      uint64_t v32 = v31[1];
      uint64_t v34 = (int *)(v30 + 104 * v21);
      uint64_t v35 = *((void *)v34 + 2);
      uint64_t v51 = *((void *)v34 + 1);
      char v50 = *((unsigned char *)v34 + 24);
      uint64_t v36 = *((void *)v34 + 5);
      uint64_t v49 = *((void *)v34 + 4);
      long long v52 = *((_OWORD *)v34 + 3);
      char v48 = *((unsigned char *)v34 + 64);
      uint64_t v37 = *((void *)v34 + 10);
      uint64_t v47 = *((void *)v34 + 9);
      int v45 = *v34;
      char v46 = *((unsigned char *)v34 + 88);
      uint64_t v38 = *((void *)v34 + 12);
      if ((v43 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_22D34BA48();
      sub_22D34B778();
      uint64_t result = sub_22D34BA78();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v28 = v16 == v27;
          if (v16 == v27) {
            unint64_t v16 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v11 + 8 * v16);
        }
        while (v29 == -1);
        unint64_t v17 = __clz(__rbit64(~v29)) + (v16 << 6);
      }
      *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
      *uint64_t v18 = v33;
      v18[1] = v32;
      uint64_t v19 = *(void *)(v7 + 56) + 104 * v17;
      *(_DWORD *)uint64_t v19 = v45;
      *(void *)(v19 + 8) = v51;
      *(void *)(v19 + 16) = v35;
      *(unsigned char *)(v19 + 24) = v50;
      *(void *)(v19 + 32) = v49;
      *(void *)(v19 + 40) = v36;
      *(_OWORD *)(v19 + 48) = v52;
      *(unsigned char *)(v19 + 64) = v48;
      *(void *)(v19 + 72) = v47;
      *(void *)(v19 + 80) = v37;
      *(unsigned char *)(v19 + 88) = v46;
      *(void *)(v19 + 96) = v38;
      ++*(void *)(v7 + 16);
      uint64_t v5 = v42;
      int64_t v13 = v44;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_22D323018(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268568648);
  char v37 = a2;
  uint64_t result = sub_22D34B918();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v35 = (void *)(v5 + 64);
    uint64_t v36 = v5;
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v34 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v19 = v18 | (v8 << 6);
      }
      else
      {
        int64_t v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = (uint64_t)v35;
        if (v20 >= v34) {
          goto LABEL_33;
        }
        unint64_t v21 = v35[v20];
        ++v8;
        if (!v21)
        {
          int64_t v8 = v20 + 1;
          if (v20 + 1 >= v34) {
            goto LABEL_33;
          }
          unint64_t v21 = v35[v8];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v34)
            {
LABEL_33:
              if ((v37 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
              if (v33 >= 64) {
                bzero(v35, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v35 = -1 << v33;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v21 = v35[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v8 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v34) {
                  goto LABEL_33;
                }
                unint64_t v21 = v35[v8];
                ++v22;
                if (v21) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v22;
          }
        }
LABEL_30:
        unint64_t v11 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      int v27 = *(_DWORD *)(*(void *)(v5 + 48) + 4 * v19);
      uint64_t v28 = *(void *)(v5 + 56) + 104 * v19;
      int v44 = *(_DWORD *)v28;
      uint64_t v29 = *(void *)(v28 + 16);
      uint64_t v43 = *(void *)(v28 + 8);
      char v42 = *(unsigned char *)(v28 + 24);
      uint64_t v30 = *(void *)(v28 + 40);
      uint64_t v41 = *(void *)(v28 + 32);
      long long v45 = *(_OWORD *)(v28 + 48);
      char v40 = *(unsigned char *)(v28 + 64);
      uint64_t v31 = *(void *)(v28 + 80);
      uint64_t v39 = *(void *)(v28 + 72);
      char v38 = *(unsigned char *)(v28 + 88);
      uint64_t v32 = *(void *)(v28 + 96);
      if ((v37 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_22D34BA48();
      sub_22D34BA68();
      uint64_t result = sub_22D34BA78();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v25 = v15 == v24;
          if (v15 == v24) {
            unint64_t v15 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        unint64_t v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(_DWORD *)(*(void *)(v7 + 48) + 4 * v16) = v27;
      uint64_t v17 = *(void *)(v7 + 56) + 104 * v16;
      *(_DWORD *)uint64_t v17 = v44;
      *(void *)(v17 + 8) = v43;
      *(void *)(v17 + 16) = v29;
      *(unsigned char *)(v17 + 24) = v42;
      *(void *)(v17 + 32) = v41;
      *(void *)(v17 + 40) = v30;
      *(_OWORD *)(v17 + 48) = v45;
      *(unsigned char *)(v17 + 64) = v40;
      *(void *)(v17 + 72) = v39;
      *(void *)(v17 + 80) = v31;
      *(unsigned char *)(v17 + 88) = v38;
      *(void *)(v17 + 96) = v32;
      ++*(void *)(v7 + 16);
      uint64_t v5 = v36;
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_22D3233BC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268568638);
  char v36 = a2;
  uint64_t v6 = sub_22D34B918();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_22D34BA48();
    swift_bridgeObjectRetain();
    sub_22D34B778();
    swift_bridgeObjectRelease();
    uint64_t result = sub_22D34BA78();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  int64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_22D3236E4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268568620);
  char v34 = a2;
  uint64_t result = sub_22D34B918();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v33 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v32 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v19 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }
      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v21 >= v32) {
          goto LABEL_33;
        }
        unint64_t v22 = v33[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v32) {
            goto LABEL_33;
          }
          unint64_t v22 = v33[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v32)
            {
LABEL_33:
              if ((v34 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v31 = 1 << *(unsigned char *)(v5 + 32);
              if (v31 >= 64) {
                bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v33 = -1 << v31;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v22 = v33[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v32) {
                  goto LABEL_33;
                }
                unint64_t v22 = v33[v8];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v23;
          }
        }
LABEL_30:
        unint64_t v11 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      uint64_t v28 = *(void *)(v5 + 48) + 24 * v20;
      long long v35 = *(_OWORD *)v28;
      uint64_t v29 = *(void *)(v28 + 16);
      uint64_t v30 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
      if ((v34 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      sub_22D34BA48();
      sub_22D34BA58();
      sub_22D34BA58();
      sub_22D34BA58();
      uint64_t result = sub_22D34BA78();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
        long long v17 = v35;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v13) >> 6;
        long long v17 = v35;
        do
        {
          if (++v15 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v26 = v15 == v25;
          if (v15 == v25) {
            unint64_t v15 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v12 + 8 * v15);
        }
        while (v27 == -1);
        unint64_t v16 = __clz(__rbit64(~v27)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t v18 = *(void *)(v7 + 48) + 24 * v16;
      *(_OWORD *)uint64_t v18 = v17;
      *(void *)(v18 + 16) = v29;
      *(void *)(*(void *)(v7 + 56) + 8 * v16) = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_22D323A04(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268568628);
  uint64_t v6 = sub_22D34B918();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_39;
  }
  char v34 = a2;
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  swift_retain();
  int64_t v12 = 0;
LABEL_9:
  if (v10)
  {
    unint64_t v19 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    unint64_t v20 = v19 | (v12 << 6);
LABEL_31:
    char v29 = *(unsigned char *)(*(void *)(v5 + 48) + v20);
    uint64_t v30 = *(void *)(v5 + 56) + 24 * v20;
    uint64_t v31 = *(void *)(v30 + 16);
    long long v37 = *(_OWORD *)v30;
    sub_22D34BA48();
    sub_22D34B778();
    swift_bridgeObjectRelease();
    uint64_t v13 = sub_22D34BA78();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = v13 & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      goto LABEL_8;
    }
    char v25 = 0;
    unint64_t v26 = (unint64_t)(63 - v14) >> 6;
    while (++v16 != v26 || (v25 & 1) == 0)
    {
      BOOL v27 = v16 == v26;
      if (v16 == v26) {
        unint64_t v16 = 0;
      }
      v25 |= v27;
      uint64_t v28 = *(void *)(v11 + 8 * v16);
      if (v28 != -1)
      {
        unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
LABEL_8:
        *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
        *(unsigned char *)(*(void *)(v7 + 48) + v17) = v29;
        uint64_t v18 = *(void *)(v7 + 56) + 24 * v17;
        *(_OWORD *)uint64_t v18 = v37;
        *(void *)(v18 + 16) = v31;
        ++*(void *)(v7 + 16);
        goto LABEL_9;
      }
    }
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
    JUMPOUT(0x22D323DD0);
  }
  int64_t v21 = v12 + 1;
  if (__OFADD__(v12, 1)) {
    goto LABEL_40;
  }
  if (v21 >= v35)
  {
    swift_release();
    unint64_t v22 = (void *)(v5 + 64);
    if (v34)
    {
LABEL_35:
      uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
      if (v32 >= 64) {
        bzero(v22, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
      }
      else {
        *unint64_t v22 = -1 << v32;
      }
      *(void *)(v5 + 16) = 0;
    }
  }
  else
  {
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v12;
    if (v23) {
      goto LABEL_30;
    }
    int64_t v12 = v21 + 1;
    if (v21 + 1 >= v35) {
      goto LABEL_32;
    }
    unint64_t v23 = *(void *)(v36 + 8 * v12);
    if (v23)
    {
LABEL_30:
      unint64_t v10 = (v23 - 1) & v23;
      unint64_t v20 = __clz(__rbit64(v23)) + (v12 << 6);
      goto LABEL_31;
    }
    int64_t v24 = v21 + 2;
    if (v24 < v35)
    {
      unint64_t v23 = *(void *)(v36 + 8 * v24);
      if (!v23)
      {
        while (1)
        {
          int64_t v12 = v24 + 1;
          if (__OFADD__(v24, 1)) {
            goto LABEL_41;
          }
          if (v12 >= v35) {
            goto LABEL_32;
          }
          unint64_t v23 = *(void *)(v36 + 8 * v12);
          ++v24;
          if (v23) {
            goto LABEL_30;
          }
        }
      }
      int64_t v12 = v24;
      goto LABEL_30;
    }
LABEL_32:
    swift_release();
    if (v34) {
      goto LABEL_35;
    }
  }
LABEL_39:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_22D323DEC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268568610);
  char v39 = a2;
  uint64_t v6 = sub_22D34B918();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v38 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v36 = v2;
  int64_t v37 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37) {
      break;
    }
    unint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v38 + 8 * v22);
    ++v13;
    if (!v24)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v37) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v38 + 8 * v13);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v36;
          if ((v39 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v13 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v37) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v38 + 8 * v13);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(v5 + 56) + 24 * v21;
    long long v40 = *(_OWORD *)v33;
    uint64_t v34 = *(void *)(v33 + 16);
    if ((v39 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_22D34BA48();
    swift_bridgeObjectRetain();
    sub_22D34B778();
    swift_bridgeObjectRelease();
    uint64_t result = sub_22D34BA78();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v16 == v27;
        if (v16 == v27) {
          unint64_t v16 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v11 + 8 * v16);
      }
      while (v29 == -1);
      unint64_t v17 = __clz(__rbit64(~v29)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v32;
    v18[1] = v31;
    uint64_t v19 = *(void *)(v7 + 56) + 24 * v17;
    *(_OWORD *)uint64_t v19 = v40;
    *(void *)(v19 + 16) = v34;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  unint64_t v23 = (void *)(v5 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_22D324128(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268568630);
  char v37 = a2;
  uint64_t v6 = sub_22D34B918();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v36 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v35 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v21 = v20 | (v13 << 6);
      }
      else
      {
        int64_t v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v35) {
          goto LABEL_33;
        }
        unint64_t v23 = v36[v22];
        ++v13;
        if (!v23)
        {
          int64_t v13 = v22 + 1;
          if (v22 + 1 >= v35) {
            goto LABEL_33;
          }
          unint64_t v23 = v36[v13];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v35)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v2;
              if (v37)
              {
                uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
                if (v34 >= 64) {
                  bzero(v36, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v36 = -1 << v34;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v36[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v13 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_40;
                }
                if (v13 >= v35) {
                  goto LABEL_33;
                }
                unint64_t v23 = v36[v13];
                ++v24;
                if (v23) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v13 = v24;
          }
        }
LABEL_30:
        unint64_t v10 = (v23 - 1) & v23;
        unint64_t v21 = __clz(__rbit64(v23)) + (v13 << 6);
      }
      uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
      uint64_t v31 = *v29;
      uint64_t v30 = v29[1];
      uint64_t v32 = *(void *)(v5 + 56) + 24 * v21;
      long long v38 = *(_OWORD *)v32;
      uint64_t v33 = *(void *)(v32 + 16);
      if ((v37 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      sub_22D34BA48();
      sub_22D34B778();
      uint64_t result = sub_22D34BA78();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v27 = v16 == v26;
          if (v16 == v26) {
            unint64_t v16 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v11 + 8 * v16);
        }
        while (v28 == -1);
        unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
      }
      *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
      *uint64_t v18 = v31;
      v18[1] = v30;
      uint64_t v19 = *(void *)(v7 + 56) + 24 * v17;
      *(_OWORD *)uint64_t v19 = v38;
      *(void *)(v19 + 16) = v33;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_22D324440(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD77EB0);
  char v42 = a2;
  uint64_t v6 = sub_22D34B918();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  char v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    int64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    uint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    int64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_22D34BA48();
    sub_22D34B778();
    uint64_t result = sub_22D34BA78();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    uint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *uint64_t v19 = v34;
    v19[1] = v33;
    unint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    *unint64_t v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  int64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_22D324768(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268568600);
  char v42 = a2;
  uint64_t v6 = sub_22D34B918();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  char v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    int64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    uint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    int64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_22D34BA48();
    swift_bridgeObjectRetain();
    sub_22D34B778();
    swift_bridgeObjectRelease();
    uint64_t result = sub_22D34BA78();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    uint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *uint64_t v19 = v34;
    v19[1] = v33;
    unint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    *unint64_t v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  int64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_22D324AA0(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  char v37 = a2;
  uint64_t v7 = sub_22D34B918();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v36 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  int64_t v35 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v35) {
      break;
    }
    int64_t v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_33:
          swift_release();
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v35) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(*(void *)(v6 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_22D34BA48();
    sub_22D34B778();
    uint64_t result = sub_22D34BA78();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    *uint64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  int64_t v23 = (void *)(v6 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v6 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v23 = -1 << v34;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v4 = v8;
  return result;
}

uint64_t sub_22D324DB4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685685F0);
  char v37 = a2;
  uint64_t v6 = sub_22D34B918();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_22D34BA48();
    sub_22D34B778();
    uint64_t result = sub_22D34BA78();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  int64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_22D3250C0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268568658);
  uint64_t result = sub_22D34B918();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v34 = (uint64_t *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v31 = -1 << v9;
    uint64_t v32 = v9;
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v19 = v18 | (v8 << 6);
      }
      else
      {
        int64_t v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v20 >= v33) {
          goto LABEL_33;
        }
        unint64_t v21 = v34[v20];
        ++v8;
        if (!v21)
        {
          int64_t v8 = v20 + 1;
          if (v20 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v21 = v34[v8];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v33)
            {
LABEL_33:
              if (a2)
              {
                if (v32 >= 64) {
                  bzero(v34, 8 * v33);
                }
                else {
                  uint64_t *v34 = v31;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v21 = v34[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v8 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_41;
                }
                if (v8 >= v33) {
                  goto LABEL_33;
                }
                unint64_t v21 = v34[v8];
                ++v22;
                if (v21) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v22;
          }
        }
LABEL_30:
        unint64_t v11 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      uint64_t v27 = *(void *)(*(void *)(v5 + 48) + 8 * v19);
      uint64_t v28 = (uint64_t *)(*(void *)(v5 + 56) + 16 * v19);
      uint64_t v29 = *v28;
      uint64_t v30 = v28[1];
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      uint64_t result = sub_22D34BA38();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v25 = v15 == v24;
          if (v15 == v24) {
            unint64_t v15 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        unint64_t v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(void *)(*(void *)(v7 + 48) + 8 * v16) = v27;
      unint64_t v17 = (void *)(*(void *)(v7 + 56) + 16 * v16);
      *unint64_t v17 = v29;
      v17[1] = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_22D325378(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for CustomSymbol();
  uint64_t v49 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v54 = (uint64_t)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22D34B6B8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v51 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685685D8);
  int v50 = a2;
  uint64_t v11 = v10;
  uint64_t v12 = sub_22D34B918();
  uint64_t v13 = v12;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v14 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v15 = *(void *)(v11 + 64);
  char v46 = (void *)(v11 + 64);
  if (v14 < 64) {
    uint64_t v16 = ~(-1 << v14);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & v15;
  int v44 = v2;
  int64_t v45 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v47 = (void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  long long v52 = (void (**)(char *, unint64_t, uint64_t))(v8 + 32);
  uint64_t v53 = v7;
  uint64_t v18 = v12 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  uint64_t v48 = v11;
  unint64_t v21 = v51;
  while (1)
  {
    if (v17)
    {
      unint64_t v23 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v24 = v23 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v25 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v45) {
      break;
    }
    uint64_t v26 = v46;
    unint64_t v27 = v46[v25];
    ++v20;
    if (!v27)
    {
      int64_t v20 = v25 + 1;
      if (v25 + 1 >= v45) {
        goto LABEL_34;
      }
      unint64_t v27 = v46[v20];
      if (!v27)
      {
        int64_t v28 = v25 + 2;
        if (v28 >= v45)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v44;
          if ((v50 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v27 = v46[v28];
        if (!v27)
        {
          while (1)
          {
            int64_t v20 = v28 + 1;
            if (__OFADD__(v28, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v45) {
              goto LABEL_34;
            }
            unint64_t v27 = v46[v20];
            ++v28;
            if (v27) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v28;
      }
    }
LABEL_21:
    unint64_t v17 = (v27 - 1) & v27;
    unint64_t v24 = __clz(__rbit64(v27)) + (v20 << 6);
    unint64_t v21 = v51;
LABEL_22:
    uint64_t v29 = v8;
    uint64_t v30 = *(void *)(v8 + 72);
    unint64_t v31 = *(void *)(v11 + 48) + v30 * v24;
    if (v50)
    {
      (*v52)(v21, v31, v53);
      uint64_t v32 = *(void *)(v11 + 56);
      uint64_t v33 = *(void *)(v49 + 72);
      sub_22D32E040(v32 + v33 * v24, v54, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
    }
    else
    {
      (*v47)(v21, v31, v53);
      uint64_t v34 = *(void *)(v11 + 56);
      uint64_t v33 = *(void *)(v49 + 72);
      sub_22D32DFD8(v34 + v33 * v24, v54, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
    }
    sub_22D32E110(&qword_2685685C0);
    uint64_t result = sub_22D34B6C8();
    uint64_t v35 = -1 << *(unsigned char *)(v13 + 32);
    unint64_t v36 = result & ~v35;
    unint64_t v37 = v36 >> 6;
    if (((-1 << v36) & ~*(void *)(v18 + 8 * (v36 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v36) & ~*(void *)(v18 + 8 * (v36 >> 6)))) | v36 & 0x7FFFFFFFFFFFFFC0;
      unint64_t v21 = v51;
    }
    else
    {
      char v38 = 0;
      unint64_t v39 = (unint64_t)(63 - v35) >> 6;
      unint64_t v21 = v51;
      do
      {
        if (++v37 == v39 && (v38 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v40 = v37 == v39;
        if (v37 == v39) {
          unint64_t v37 = 0;
        }
        v38 |= v40;
        uint64_t v41 = *(void *)(v18 + 8 * v37);
      }
      while (v41 == -1);
      unint64_t v22 = __clz(__rbit64(~v41)) + (v37 << 6);
    }
    *(void *)(v18 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    (*v52)((char *)(*(void *)(v13 + 48) + v30 * v22), (unint64_t)v21, v53);
    uint64_t result = sub_22D32E040(v54, *(void *)(v13 + 56) + v33 * v22, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
    ++*(void *)(v13 + 16);
    uint64_t v11 = v48;
    uint64_t v8 = v29;
  }
  swift_release();
  uint64_t v3 = v44;
  uint64_t v26 = v46;
  if ((v50 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v42 = 1 << *(unsigned char *)(v11 + 32);
  if (v42 >= 64) {
    bzero(v26, ((unint64_t)(v42 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v26 = -1 << v42;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v13;
  return result;
}

unint64_t sub_22D32587C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = (void **)v5;
  uint64_t v12 = (void *)*v5;
  unint64_t v14 = sub_22D322A5C(a2, a3, a4);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= v17 && (a5 & 1) != 0)
  {
LABEL_7:
    int64_t v20 = *v6;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];
      unint64_t result = swift_bridgeObjectRelease();
      *(void *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_22D326B94();
    goto LABEL_7;
  }
  sub_22D3236E4(v17, a5 & 1);
  unint64_t v23 = sub_22D322A5C(a2, a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_15:
    unint64_t result = sub_22D34B9E8();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  int64_t v20 = *v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  return sub_22D325E34(v14, a2, a3, a4, a1, v20);
}

uint64_t sub_22D3259D0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_22D3195C4(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_22D327430(&qword_268568608);
LABEL_7:
    char v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_22D324AA0(v15, a4 & 1, &qword_268568608);
  unint64_t v21 = sub_22D3195C4(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_22D34B9E8();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  char v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;
  return swift_bridgeObjectRetain();
}

uint64_t sub_22D325B50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v7 = (void **)v6;
  BOOL v14 = (void *)*v6;
  unint64_t v16 = sub_22D322B3C(a4, a5);
  uint64_t v17 = v14[2];
  BOOL v18 = (v15 & 1) == 0;
  uint64_t result = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v20 = v15;
  uint64_t v21 = v14[3];
  if (v21 >= result && (a6 & 1) != 0)
  {
LABEL_7:
    char v22 = *v7;
    if (v20)
    {
LABEL_8:
      unint64_t v23 = (uint64_t *)(v22[7] + 24 * v16);
      *unint64_t v23 = a1;
      v23[1] = a2;
      v23[2] = a3;
      return result;
    }
    goto LABEL_11;
  }
  if (v21 >= result && (a6 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_22D326EF4();
    goto LABEL_7;
  }
  sub_22D323DEC(result, a6 & 1);
  uint64_t result = sub_22D322B3C(a4, a5);
  if ((v20 & 1) != (v24 & 1))
  {
LABEL_15:
    uint64_t result = sub_22D34B9E8();
    __break(1u);
    return result;
  }
  unint64_t v16 = result;
  char v22 = *v7;
  if (v20) {
    goto LABEL_8;
  }
LABEL_11:
  sub_22D325E84(v16, a4, a5, a1, a2, a3, v22);
  return swift_bridgeObjectRetain();
}

uint64_t sub_22D325CAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_22D3195C4(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_22D3270B8();
LABEL_7:
    char v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_bridgeObjectRelease();
      *uint64_t v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_22D324440(v17, a5 & 1);
  unint64_t v23 = sub_22D3195C4(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_22D34B9E8();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  char v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  BOOL v25 = (uint64_t *)(v20[6] + 16 * v14);
  uint64_t *v25 = a3;
  v25[1] = a4;
  uint64_t v26 = (void *)(v20[7] + 16 * v14);
  *uint64_t v26 = a1;
  v26[1] = a2;
  uint64_t v27 = v20[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v29;
  return swift_bridgeObjectRetain();
}

unint64_t sub_22D325E34(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  a6[(result >> 6) + 8] |= 1 << result;
  uint64_t v6 = (void *)(a6[6] + 24 * result);
  *uint64_t v6 = a2;
  v6[1] = a3;
  _OWORD v6[2] = a4;
  *(void *)(a6[7] + 8 * result) = a5;
  uint64_t v7 = a6[2];
  BOOL v8 = __OFADD__(v7, 1);
  uint64_t v9 = v7 + 1;
  if (v8) {
    __break(1u);
  }
  else {
    a6[2] = v9;
  }
  return result;
}

unint64_t sub_22D325E84(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  a7[(result >> 6) + 8] |= 1 << result;
  uint64_t v7 = (void *)(a7[6] + 16 * result);
  void *v7 = a2;
  v7[1] = a3;
  BOOL v8 = (void *)(a7[7] + 24 * result);
  void *v8 = a4;
  v8[1] = a5;
  v8[2] = a6;
  uint64_t v9 = a7[2];
  BOOL v10 = __OFADD__(v9, 1);
  uint64_t v11 = v9 + 1;
  if (v10) {
    __break(1u);
  }
  else {
    a7[2] = v11;
  }
  return result;
}

unint64_t sub_22D325ED8(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  a6[(result >> 6) + 8] |= 1 << result;
  uint64_t v6 = (void *)(a6[6] + 16 * result);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t v7 = (void *)(a6[7] + 16 * result);
  void *v7 = a4;
  v7[1] = a5;
  uint64_t v8 = a6[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a6[2] = v10;
  }
  return result;
}

unint64_t sub_22D325F28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_22D325FC4(int a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_22D326060(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t result = a4 & ~v6;
  if ((*(void *)(v4 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v8 = ~v6;
    do
    {
      BOOL v9 = (uint64_t *)(*(void *)(v4 + 48) + 24 * result);
      uint64_t v10 = *v9;
      uint64_t v11 = v9[1];
      uint64_t v12 = v9[2];
      if (v10 == a1 && v11 == a2 && v12 == a3) {
        break;
      }
      unint64_t result = (result + 1) & v8;
    }
    while (((*(void *)(v4 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0);
  }
  return result;
}

unint64_t sub_22D3260E8(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0xEA0000000000736CLL;
      uint64_t v8 = 0x6F626D7953204653;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          unint64_t v7 = 0xE500000000000000;
          uint64_t v8 = 0x534F63616DLL;
          break;
        case 2:
          uint64_t v8 = 0x617461432063614DLL;
          unint64_t v7 = 0xEC0000007473796CLL;
          break;
        case 3:
          unint64_t v7 = 0xE300000000000000;
          uint64_t v8 = 5459817;
          break;
        case 4:
          unint64_t v7 = 0xE700000000000000;
          uint64_t v8 = 0x534F6863746177;
          break;
        case 5:
          unint64_t v7 = 0xE400000000000000;
          uint64_t v8 = 1397716596;
          break;
        case 6:
          unint64_t v7 = 0xE800000000000000;
          uint64_t v8 = 0x534F6E6F69736976;
          break;
        default:
          break;
      }
      uint64_t v9 = 0x6F626D7953204653;
      unint64_t v10 = 0xEA0000000000736CLL;
      switch(v6)
      {
        case 1:
          unint64_t v10 = 0xE500000000000000;
          if (v8 == 0x534F63616DLL) {
            goto LABEL_21;
          }
          goto LABEL_22;
        case 2:
          unint64_t v10 = 0xEC0000007473796CLL;
          if (v8 != 0x617461432063614DLL) {
            goto LABEL_22;
          }
          goto LABEL_21;
        case 3:
          unint64_t v10 = 0xE300000000000000;
          if (v8 != 5459817) {
            goto LABEL_22;
          }
          goto LABEL_21;
        case 4:
          unint64_t v10 = 0xE700000000000000;
          if (v8 != 0x534F6863746177) {
            goto LABEL_22;
          }
          goto LABEL_21;
        case 5:
          unint64_t v10 = 0xE400000000000000;
          uint64_t v9 = 1397716596;
          goto LABEL_20;
        case 6:
          unint64_t v10 = 0xE800000000000000;
          if (v8 != 0x534F6E6F69736976) {
            goto LABEL_22;
          }
          goto LABEL_21;
        default:
LABEL_20:
          if (v8 != v9) {
            goto LABEL_22;
          }
LABEL_21:
          if (v7 == v10)
          {
            swift_bridgeObjectRelease_n();
            return v4;
          }
LABEL_22:
          char v11 = sub_22D34B9A8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v11) {
            return v4;
          }
          unint64_t v4 = (v4 + 1) & v5;
          if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
            return v4;
          }
          break;
      }
    }
  }
  return v4;
}

unint64_t sub_22D3263A0(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_22D34B6B8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    char v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    char v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_22D32E110(&qword_2685685E8);
      char v15 = sub_22D34B6F8();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

void *sub_22D32654C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268568650);
  char v38 = v0;
  uint64_t v1 = *v0;
  uint64_t v2 = sub_22D34B908();
  uint64_t v3 = v2;
  if (!*(void *)(v1 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    uint64_t *v38 = v3;
    return result;
  }
  unint64_t result = (void *)(v2 + 64);
  uint64_t v5 = v1 + 64;
  unint64_t v6 = (unint64_t)((1 << *(unsigned char *)(v3 + 32)) + 63) >> 6;
  if (v3 != v1 || (unint64_t)result >= v1 + 64 + 8 * v6) {
    unint64_t result = memmove(result, (const void *)(v1 + 64), 8 * v6);
  }
  int64_t v8 = 0;
  *(void *)(v3 + 16) = *(void *)(v1 + 16);
  uint64_t v9 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & *(void *)(v1 + 64);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  while (1)
  {
    if (v11)
    {
      unint64_t v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v14 = v13 | (v8 << 6);
      goto LABEL_12;
    }
    int64_t v35 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v35 >= v12) {
      goto LABEL_26;
    }
    unint64_t v36 = *(void *)(v5 + 8 * v35);
    ++v8;
    if (!v36)
    {
      int64_t v8 = v35 + 1;
      if (v35 + 1 >= v12) {
        goto LABEL_26;
      }
      unint64_t v36 = *(void *)(v5 + 8 * v8);
      if (!v36) {
        break;
      }
    }
LABEL_25:
    unint64_t v11 = (v36 - 1) & v36;
    unint64_t v14 = __clz(__rbit64(v36)) + (v8 << 6);
LABEL_12:
    uint64_t v15 = 16 * v14;
    BOOL v16 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v14);
    uint64_t v17 = *v16;
    uint64_t v18 = v16[1];
    uint64_t v19 = 104 * v14;
    uint64_t v20 = *(void *)(v1 + 56) + v19;
    int v21 = *(_DWORD *)v20;
    uint64_t v22 = *(void *)(v20 + 8);
    uint64_t v23 = *(void *)(v20 + 16);
    char v24 = *(unsigned char *)(v20 + 24);
    uint64_t v25 = *(void *)(v20 + 32);
    uint64_t v26 = *(void *)(v20 + 40);
    char v27 = *(unsigned char *)(v20 + 64);
    uint64_t v29 = *(void *)(v20 + 72);
    uint64_t v28 = *(void *)(v20 + 80);
    char v30 = *(unsigned char *)(v20 + 88);
    uint64_t v31 = *(void *)(v20 + 96);
    uint64_t v32 = (void *)(*(void *)(v3 + 48) + v15);
    long long v33 = *(_OWORD *)(v20 + 48);
    *uint64_t v32 = v17;
    v32[1] = v18;
    uint64_t v34 = *(void *)(v3 + 56) + v19;
    *(_DWORD *)uint64_t v34 = v21;
    *(void *)(v34 + 8) = v22;
    *(void *)(v34 + 16) = v23;
    *(unsigned char *)(v34 + 24) = v24;
    *(void *)(v34 + 32) = v25;
    *(void *)(v34 + 40) = v26;
    *(_OWORD *)(v34 + 48) = v33;
    *(unsigned char *)(v34 + 64) = v27;
    *(void *)(v34 + 72) = v29;
    *(void *)(v34 + 80) = v28;
    *(unsigned char *)(v34 + 88) = v30;
    *(void *)(v34 + 96) = v31;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v37 = v35 + 2;
  if (v37 >= v12) {
    goto LABEL_26;
  }
  unint64_t v36 = *(void *)(v5 + 8 * v37);
  if (v36)
  {
    int64_t v8 = v37;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v8 = v37 + 1;
    if (__OFADD__(v37, 1)) {
      break;
    }
    if (v8 >= v12) {
      goto LABEL_26;
    }
    unint64_t v36 = *(void *)(v5 + 8 * v8);
    ++v37;
    if (v36) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_22D32679C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268568648);
  int64_t v35 = v0;
  uint64_t v1 = *v0;
  uint64_t v2 = sub_22D34B908();
  uint64_t v3 = v2;
  if (!*(void *)(v1 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *int64_t v35 = v3;
    return result;
  }
  unint64_t result = (void *)(v2 + 64);
  uint64_t v5 = v1 + 64;
  unint64_t v6 = (unint64_t)((1 << *(unsigned char *)(v3 + 32)) + 63) >> 6;
  if (v3 != v1 || (unint64_t)result >= v1 + 64 + 8 * v6) {
    unint64_t result = memmove(result, (const void *)(v1 + 64), 8 * v6);
  }
  int64_t v8 = 0;
  *(void *)(v3 + 16) = *(void *)(v1 + 16);
  uint64_t v9 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & *(void *)(v1 + 64);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  while (1)
  {
    if (v11)
    {
      unint64_t v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v14 = v13 | (v8 << 6);
      goto LABEL_12;
    }
    int64_t v32 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v32 >= v12) {
      goto LABEL_26;
    }
    unint64_t v33 = *(void *)(v5 + 8 * v32);
    ++v8;
    if (!v33)
    {
      int64_t v8 = v32 + 1;
      if (v32 + 1 >= v12) {
        goto LABEL_26;
      }
      unint64_t v33 = *(void *)(v5 + 8 * v8);
      if (!v33) {
        break;
      }
    }
LABEL_25:
    unint64_t v11 = (v33 - 1) & v33;
    unint64_t v14 = __clz(__rbit64(v33)) + (v8 << 6);
LABEL_12:
    uint64_t v15 = 4 * v14;
    int v16 = *(_DWORD *)(*(void *)(v1 + 48) + 4 * v14);
    uint64_t v17 = 104 * v14;
    uint64_t v18 = *(void *)(v1 + 56) + v17;
    int v19 = *(_DWORD *)v18;
    uint64_t v20 = *(void *)(v18 + 8);
    uint64_t v21 = *(void *)(v18 + 16);
    char v22 = *(unsigned char *)(v18 + 24);
    uint64_t v23 = *(void *)(v18 + 32);
    uint64_t v24 = *(void *)(v18 + 40);
    char v25 = *(unsigned char *)(v18 + 64);
    uint64_t v27 = *(void *)(v18 + 72);
    uint64_t v26 = *(void *)(v18 + 80);
    char v28 = *(unsigned char *)(v18 + 88);
    uint64_t v29 = *(void *)(v18 + 96);
    long long v30 = *(_OWORD *)(v18 + 48);
    *(_DWORD *)(*(void *)(v3 + 48) + v15) = v16;
    uint64_t v31 = *(void *)(v3 + 56) + v17;
    *(_DWORD *)uint64_t v31 = v19;
    *(void *)(v31 + 8) = v20;
    *(void *)(v31 + 16) = v21;
    *(unsigned char *)(v31 + 24) = v22;
    *(void *)(v31 + 32) = v23;
    *(void *)(v31 + 40) = v24;
    *(_OWORD *)(v31 + 48) = v30;
    *(unsigned char *)(v31 + 64) = v25;
    *(void *)(v31 + 72) = v27;
    *(void *)(v31 + 80) = v26;
    *(unsigned char *)(v31 + 88) = v28;
    *(void *)(v31 + 96) = v29;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v34 = v32 + 2;
  if (v34 >= v12) {
    goto LABEL_26;
  }
  unint64_t v33 = *(void *)(v5 + 8 * v34);
  if (v33)
  {
    int64_t v8 = v34;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v8 = v34 + 1;
    if (__OFADD__(v34, 1)) {
      break;
    }
    if (v8 >= v12) {
      goto LABEL_26;
    }
    unint64_t v33 = *(void *)(v5 + 8 * v8);
    ++v34;
    if (v33) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_22D3269DC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268568638);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_22D34B908();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_22D326B94()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268568620);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_22D34B908();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 24 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + 24 * v15;
    uint64_t v18 = *(void *)(v17 + 16);
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = *(void *)(v4 + 48) + v16;
    *(_OWORD *)uint64_t v21 = *(_OWORD *)v17;
    *(void *)(v21 + 16) = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_22D326D50()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268568628);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_22D34B908();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v23 = __clz(__rbit64(v21));
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = v23 + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void *)(v2 + 56) + 24 * v15;
    uint64_t v17 = *(void *)(v16 + 16);
    long long v18 = *(_OWORD *)v16;
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    uint64_t v19 = *(void *)(v4 + 56) + 24 * v15;
    *(_OWORD *)uint64_t v19 = v18;
    *(void *)(v19 + 16) = v17;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_22D326EF4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268568610);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_22D34B908();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v26 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v26 >= v13) {
      goto LABEL_26;
    }
    unint64_t v27 = *(void *)(v6 + 8 * v26);
    ++v9;
    if (!v27)
    {
      int64_t v9 = v26 + 1;
      if (v26 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v27 = *(void *)(v6 + 8 * v9);
      if (!v27) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v27 - 1) & v27;
    unint64_t v15 = __clz(__rbit64(v27)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 24 * v15;
    uint64_t v21 = *(void *)(v2 + 56) + v20;
    uint64_t v22 = *(void *)(v21 + 16);
    unint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    long long v24 = *(_OWORD *)v21;
    *unint64_t v23 = v19;
    v23[1] = v18;
    uint64_t v25 = *(void *)(v4 + 56) + v20;
    *(_OWORD *)uint64_t v25 = v24;
    *(void *)(v25 + 16) = v22;
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v28 = v26 + 2;
  if (v28 >= v13) {
    goto LABEL_26;
  }
  unint64_t v27 = *(void *)(v6 + 8 * v28);
  if (v27)
  {
    int64_t v9 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v27 = *(void *)(v6 + 8 * v9);
    ++v28;
    if (v27) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_22D3270B8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD77EB0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_22D34B908();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    unint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v23 = v19;
    v23[1] = v18;
    long long v24 = (void *)(*(void *)(v4 + 56) + v16);
    *long long v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_22D327274()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268568600);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_22D34B908();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    unint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v23 = v19;
    v23[1] = v18;
    long long v24 = (void *)(*(void *)(v4 + 56) + v16);
    *long long v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_22D327430(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_22D34B908();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    uint64_t *v2 = v5;
    return result;
  }
  unint64_t result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    unint64_t result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (void *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    uint64_t v21 = *(void *)(*(void *)(v3 + 56) + v20);
    uint64_t v22 = (void *)(*(void *)(v5 + 48) + v17);
    *uint64_t v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_22D3275E0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685685F0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_22D34B908();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    uint64_t v22 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v22 = v19;
    v22[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_22D327790()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268568658);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_22D34B908();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 16 * v15;
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 56) + v18);
    uint64_t v21 = *v19;
    uint64_t v20 = v19[1];
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    uint64_t v22 = (void *)(*(void *)(v4 + 56) + v18);
    *uint64_t v22 = v21;
    v22[1] = v20;
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

char *sub_22D327940()
{
  uint64_t v1 = type metadata accessor for CustomSymbol();
  uint64_t v40 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1 - 8);
  unint64_t v39 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_22D34B6B8();
  uint64_t v3 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  int64_t v37 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685685D8);
  int64_t v32 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_22D34B908();
  uint64_t v7 = *(void *)(v5 + 16);
  uint64_t v42 = v6;
  if (!v7)
  {
    unint64_t result = (char *)swift_release();
    uint64_t v30 = v42;
    uint64_t v29 = v32;
LABEL_25:
    *uint64_t v29 = v30;
    return result;
  }
  uint64_t v8 = v6;
  unint64_t result = (char *)(v6 + 64);
  uint64_t v10 = (char *)(v5 + 64);
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  uint64_t v33 = v5 + 64;
  if (v8 != v5 || result >= &v10[8 * v11])
  {
    unint64_t result = (char *)memmove(result, v10, 8 * v11);
    uint64_t v8 = v42;
  }
  int64_t v12 = 0;
  *(void *)(v8 + 16) = *(void *)(v5 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5;
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & *(void *)(v5 + 64);
  uint64_t v36 = v3 + 16;
  int64_t v34 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v35 = v3 + 32;
  uint64_t v17 = v37;
  uint64_t v16 = v38;
  uint64_t v18 = (uint64_t)v39;
  for (uint64_t i = v42;
        ;
        unint64_t result = (char *)sub_22D32E040(v18, *(void *)(i + 56) + v25, (uint64_t (*)(void))type metadata accessor for CustomSymbol))
  {
    if (v15)
    {
      unint64_t v20 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v21 = v20 | (v12 << 6);
      uint64_t v22 = v41;
      goto LABEL_9;
    }
    int64_t v26 = v12 + 1;
    uint64_t v22 = v41;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v26 >= v34) {
      goto LABEL_23;
    }
    unint64_t v27 = *(void *)(v33 + 8 * v26);
    ++v12;
    if (!v27)
    {
      int64_t v12 = v26 + 1;
      if (v26 + 1 >= v34) {
        goto LABEL_23;
      }
      unint64_t v27 = *(void *)(v33 + 8 * v12);
      if (!v27) {
        break;
      }
    }
LABEL_22:
    unint64_t v15 = (v27 - 1) & v27;
    unint64_t v21 = __clz(__rbit64(v27)) + (v12 << 6);
LABEL_9:
    unint64_t v23 = *(void *)(v3 + 72) * v21;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v17, *(void *)(v22 + 48) + v23, v16);
    uint64_t v24 = *(void *)(v22 + 56);
    unint64_t v25 = *(void *)(v40 + 72) * v21;
    sub_22D32DFD8(v24 + v25, v18, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(i + 48) + v23, v17, v16);
  }
  int64_t v28 = v26 + 2;
  if (v28 >= v34)
  {
LABEL_23:
    unint64_t result = (char *)swift_release();
    uint64_t v29 = v32;
    uint64_t v30 = v42;
    goto LABEL_25;
  }
  unint64_t v27 = *(void *)(v33 + 8 * v28);
  if (v27)
  {
    int64_t v12 = v28;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v12 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v12 >= v34) {
      goto LABEL_23;
    }
    unint64_t v27 = *(void *)(v33 + 8 * v12);
    ++v28;
    if (v27) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_22D327CB4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_22D34BA48();
  swift_bridgeObjectRetain();
  sub_22D34B778();
  uint64_t v8 = sub_22D34BA78();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    int64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_22D34B9A8() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_22D34B9A8() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_22D3290C4(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_22D327E64(_DWORD *a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_22D34BA48();
  sub_22D34BA68();
  uint64_t v6 = sub_22D34BA78();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v2;
    uint64_t *v2 = 0x8000000000000000;
    sub_22D329260(a2, v8, isUniquelyReferenced_nonNull_native);
    uint64_t *v2 = v13;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  if (*(_DWORD *)(v9 + 4 * v8) != a2)
  {
    uint64_t v10 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v10;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(_DWORD *)(v9 + 4 * v8) != a2);
  }
  uint64_t result = 0;
  LODWORD(a2) = *(_DWORD *)(*(void *)(*v2 + 48) + 4 * v8);
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_22D327F84(uint64_t a1, uint64_t a2)
{
  uint64_t v46 = a1;
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685685B8);
  MEMORY[0x270FA5388](v57);
  uint64_t v5 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22D34B6B8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v48 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v43 - v10;
  uint64_t v12 = type metadata accessor for SymbolKey(0);
  uint64_t v55 = *(void *)(v12 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  long long v52 = (char *)&v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v53 = (_DWORD *)((char *)&v43 - v16);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  BOOL v19 = (char *)&v43 - v18;
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v44 = (uint64_t)&v43 - v21;
  MEMORY[0x270FA5388](v20);
  unint64_t v23 = (char *)&v43 - v22;
  int64_t v45 = v2;
  uint64_t v24 = *v2;
  sub_22D34BA48();
  uint64_t v58 = a2;
  sub_22D32DFD8(a2, (uint64_t)v23, type metadata accessor for SymbolKey);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v11, v23, v6);
    sub_22D34BA58();
    sub_22D32E110(&qword_2685685C0);
    swift_bridgeObjectRetain();
    sub_22D34B6D8();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
  }
  else
  {
    sub_22D34BA58();
    sub_22D34BA68();
    swift_bridgeObjectRetain();
  }
  uint64_t v25 = sub_22D34BA78();
  uint64_t v26 = -1 << *(unsigned char *)(v24 + 32);
  unint64_t v27 = v25 & ~v26;
  uint64_t v49 = v24;
  uint64_t v56 = v24 + 56;
  if (((*(void *)(v24 + 56 + ((v27 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v27) & 1) == 0)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    uint64_t v38 = v45;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v40 = v58;
    uint64_t v41 = v44;
    sub_22D32DFD8(v58, v44, type metadata accessor for SymbolKey);
    uint64_t v59 = *v38;
    uint64_t *v38 = 0x8000000000000000;
    sub_22D3293B0(v41, v27, isUniquelyReferenced_nonNull_native);
    uint64_t *v38 = v59;
    swift_bridgeObjectRelease();
    sub_22D32E040(v40, v46, type metadata accessor for SymbolKey);
    return 1;
  }
  uint64_t v54 = ~v26;
  uint64_t v55 = *(void *)(v55 + 72);
  int v50 = (void (**)(uint64_t, uint64_t))(v7 + 8);
  uint64_t v51 = v6;
  uint64_t v47 = (void (**)(char *, char *, uint64_t))(v7 + 32);
  uint64_t v28 = (uint64_t)v52;
  uint64_t v29 = v49;
  while (1)
  {
    unint64_t v30 = v55 * v27;
    sub_22D32DFD8(*(void *)(v29 + 48) + v55 * v27, (uint64_t)v19, type metadata accessor for SymbolKey);
    uint64_t v31 = &v5[*(int *)(v57 + 48)];
    sub_22D32DFD8((uint64_t)v19, (uint64_t)v5, type metadata accessor for SymbolKey);
    sub_22D32DFD8(v58, (uint64_t)v31, type metadata accessor for SymbolKey);
    if (swift_getEnumCaseMultiPayload() != 1) {
      break;
    }
    sub_22D32DFD8((uint64_t)v5, v28, type metadata accessor for SymbolKey);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      int64_t v32 = v48;
      uint64_t v33 = v51;
      (*v47)(v48, v31, v51);
      char v34 = sub_22D34B6A8();
      uint64_t v35 = *v50;
      uint64_t v36 = v32;
      uint64_t v28 = (uint64_t)v52;
      (*v50)((uint64_t)v36, v33);
      uint64_t v37 = v33;
      uint64_t v29 = v49;
      v35(v28, v37);
      if (v34) {
        goto LABEL_17;
      }
      goto LABEL_15;
    }
    (*v50)(v28, v51);
LABEL_7:
    sub_22D32DF1C((uint64_t)v5);
LABEL_8:
    sub_22D32DF7C((uint64_t)v19);
    unint64_t v27 = (v27 + 1) & v54;
    if (((*(void *)(v56 + ((v27 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v27) & 1) == 0) {
      goto LABEL_16;
    }
  }
  sub_22D32DFD8((uint64_t)v5, (uint64_t)v53, type metadata accessor for SymbolKey);
  if (swift_getEnumCaseMultiPayload() == 1) {
    goto LABEL_7;
  }
  if (*v53 != *(_DWORD *)v31)
  {
LABEL_15:
    sub_22D32DF7C((uint64_t)v5);
    goto LABEL_8;
  }
LABEL_17:
  sub_22D32DF7C((uint64_t)v5);
  sub_22D32DF7C((uint64_t)v19);
  swift_bridgeObjectRelease();
  sub_22D32DF7C(v58);
  sub_22D32DFD8(*(void *)(*v45 + 48) + v30, v46, type metadata accessor for SymbolKey);
  return 0;
}

uint64_t sub_22D3285E4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268568640);
  uint64_t v3 = sub_22D34B8A8();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_22D34BA48();
      sub_22D34B778();
      uint64_t result = sub_22D34BA78();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_22D3288C4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685685D0);
  uint64_t result = sub_22D34B8A8();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v6 = (void *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v2 + 56);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        unint64_t v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v14 = v13 | (v5 << 6);
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          int64_t v5 = v15 + 1;
          if (v15 + 1 >= v10) {
            goto LABEL_33;
          }
          unint64_t v16 = v6[v5];
          if (!v16)
          {
            int64_t v5 = v15 + 2;
            if (v15 + 2 >= v10) {
              goto LABEL_33;
            }
            unint64_t v16 = v6[v5];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
                if (v26 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v26;
                }
                uint64_t v1 = v0;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v5 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v10) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v6[v5];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v9 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      int v18 = *(_DWORD *)(*(void *)(v2 + 48) + 4 * v14);
      sub_22D34BA48();
      sub_22D34BA68();
      uint64_t result = sub_22D34BA78();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(_DWORD *)(*(void *)(v4 + 48) + 4 * v12) = v18;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_22D328B70()
{
  uint64_t v1 = v0;
  uint64_t v48 = sub_22D34B6B8();
  uint64_t v2 = *(void *)(v48 - 8);
  MEMORY[0x270FA5388](v48);
  uint64_t v47 = (char *)&v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for SymbolKey(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  int64_t v10 = (char *)&v44 - v9;
  uint64_t v11 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685685C8);
  uint64_t v12 = sub_22D34B8A8();
  uint64_t v51 = v11;
  if (*(void *)(v11 + 16))
  {
    uint64_t v13 = 1 << *(unsigned char *)(v51 + 32);
    uint64_t v14 = *(void *)(v51 + 56);
    int v50 = (void *)(v51 + 56);
    if (v13 < 64) {
      uint64_t v15 = ~(-1 << v13);
    }
    else {
      uint64_t v15 = -1;
    }
    unint64_t v16 = v15 & v14;
    int64_t v49 = (unint64_t)(v13 + 63) >> 6;
    uint64_t v46 = (void (**)(char *, char *, uint64_t))(v2 + 32);
    uint64_t v44 = v1;
    int64_t v45 = (void (**)(char *, uint64_t))(v2 + 8);
    uint64_t v17 = v12 + 56;
    uint64_t result = swift_retain();
    for (int64_t i = 0; ; int64_t i = v53)
    {
      if (v16)
      {
        uint64_t v52 = (v16 - 1) & v16;
        int64_t v53 = i;
        unint64_t v21 = __clz(__rbit64(v16)) | (i << 6);
      }
      else
      {
        int64_t v22 = i + 1;
        if (__OFADD__(i, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        if (v22 >= v49) {
          goto LABEL_36;
        }
        unint64_t v23 = v50[v22];
        int64_t v24 = i + 1;
        if (!v23)
        {
          int64_t v24 = i + 2;
          if (i + 2 >= v49) {
            goto LABEL_36;
          }
          unint64_t v23 = v50[v24];
          if (!v23)
          {
            int64_t v24 = i + 3;
            if (i + 3 >= v49) {
              goto LABEL_36;
            }
            unint64_t v23 = v50[v24];
            if (!v23)
            {
              uint64_t v25 = i + 4;
              if (i + 4 >= v49)
              {
LABEL_36:
                swift_release();
                uint64_t v1 = v44;
                uint64_t v43 = 1 << *(unsigned char *)(v51 + 32);
                if (v43 > 63) {
                  bzero(v50, ((unint64_t)(v43 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *int v50 = -1 << v43;
                }
                *(void *)(v51 + 16) = 0;
                break;
              }
              unint64_t v23 = v50[v25];
              if (!v23)
              {
                while (1)
                {
                  int64_t v24 = v25 + 1;
                  if (__OFADD__(v25, 1)) {
                    goto LABEL_43;
                  }
                  if (v24 >= v49) {
                    goto LABEL_36;
                  }
                  unint64_t v23 = v50[v24];
                  ++v25;
                  if (v23) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v24 = i + 4;
            }
          }
        }
LABEL_23:
        uint64_t v52 = (v23 - 1) & v23;
        int64_t v53 = v24;
        unint64_t v21 = __clz(__rbit64(v23)) + (v24 << 6);
      }
      uint64_t v26 = *(void *)(v5 + 72);
      sub_22D32E040(*(void *)(v51 + 48) + v26 * v21, (uint64_t)v10, type metadata accessor for SymbolKey);
      sub_22D34BA48();
      sub_22D32DFD8((uint64_t)v10, (uint64_t)v8, type metadata accessor for SymbolKey);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        BOOL v27 = v47;
        uint64_t v28 = v8;
        uint64_t v29 = v12;
        unint64_t v30 = v10;
        uint64_t v31 = v8;
        uint64_t v32 = v5;
        uint64_t v33 = v4;
        uint64_t v34 = v48;
        (*v46)(v47, v28, v48);
        sub_22D34BA58();
        sub_22D32E110(&qword_2685685C0);
        sub_22D34B6D8();
        uint64_t v35 = v34;
        uint64_t v4 = v33;
        uint64_t v5 = v32;
        uint64_t v8 = v31;
        int64_t v10 = v30;
        uint64_t v12 = v29;
        (*v45)(v27, v35);
      }
      else
      {
        sub_22D34BA58();
        sub_22D34BA68();
      }
      uint64_t result = sub_22D34BA78();
      uint64_t v36 = -1 << *(unsigned char *)(v12 + 32);
      unint64_t v37 = result & ~v36;
      unint64_t v38 = v37 >> 6;
      if (((-1 << v37) & ~*(void *)(v17 + 8 * (v37 >> 6))) != 0)
      {
        unint64_t v20 = __clz(__rbit64((-1 << v37) & ~*(void *)(v17 + 8 * (v37 >> 6)))) | v37 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v39 = 0;
        unint64_t v40 = (unint64_t)(63 - v36) >> 6;
        do
        {
          if (++v38 == v40 && (v39 & 1) != 0)
          {
            __break(1u);
            goto LABEL_42;
          }
          BOOL v41 = v38 == v40;
          if (v38 == v40) {
            unint64_t v38 = 0;
          }
          v39 |= v41;
          uint64_t v42 = *(void *)(v17 + 8 * v38);
        }
        while (v42 == -1);
        unint64_t v20 = __clz(__rbit64(~v42)) + (v38 << 6);
      }
      *(void *)(v17 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
      uint64_t result = sub_22D32E040((uint64_t)v10, *(void *)(v12 + 48) + v20 * v26, type metadata accessor for SymbolKey);
      ++*(void *)(v12 + 16);
      unint64_t v16 = v52;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v12;
  return result;
}

uint64_t sub_22D3290C4(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_22D3285E4();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_22D3299A8();
      goto LABEL_22;
    }
    sub_22D329F64();
  }
  uint64_t v11 = *v4;
  sub_22D34BA48();
  sub_22D34B778();
  uint64_t result = sub_22D34BA78();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    uint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_22D34B9A8(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_22D34B9D8();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        int v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_22D34B9A8();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  unint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *unint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

uint64_t sub_22D329260(uint64_t result, unint64_t a2, char a3)
{
  int v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_22D3288C4();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_22D329B5C();
      goto LABEL_14;
    }
    sub_22D32A214();
  }
  uint64_t v8 = *v3;
  sub_22D34BA48();
  sub_22D34BA68();
  uint64_t result = sub_22D34BA78();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(_DWORD *)(v10 + 4 * a2) == v5)
    {
LABEL_13:
      uint64_t result = sub_22D34B9D8();
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        if (*(_DWORD *)(v10 + 4 * a2) == v5) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_DWORD *)(*(void *)(v12 + 48) + 4 * a2) = v5;
  uint64_t v13 = *(void *)(v12 + 16);
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    *(void *)(v12 + 16) = v15;
  }
  return result;
}

uint64_t sub_22D3293B0(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v62 = a1;
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685685B8);
  MEMORY[0x270FA5388](v61);
  unint64_t v7 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_22D34B6B8();
  uint64_t v8 = *(void *)(v57 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v57);
  uint64_t v54 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v59 = (uint64_t)&v49 - v11;
  uint64_t v12 = type metadata accessor for SymbolKey(0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  BOOL v16 = (char *)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v55 = (char *)&v49 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  unint64_t v21 = (char *)&v49 - v20;
  MEMORY[0x270FA5388](v19);
  BOOL v23 = (char *)&v49 - v22;
  unint64_t v24 = *(void *)(*v3 + 16);
  unint64_t v25 = *(void *)(*v3 + 24);
  uint64_t v51 = v3;
  uint64_t v50 = v13;
  if (v25 > v24 && (a3 & 1) != 0) {
    goto LABEL_23;
  }
  if (a3)
  {
    sub_22D328B70();
  }
  else
  {
    if (v25 > v24)
    {
      sub_22D329CF4();
      goto LABEL_23;
    }
    sub_22D32A490();
  }
  uint64_t v60 = *v3;
  sub_22D34BA48();
  sub_22D32DFD8(v62, (uint64_t)v23, type metadata accessor for SymbolKey);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v26 = v59;
    BOOL v27 = v23;
    uint64_t v28 = v57;
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v59, v27, v57);
    sub_22D34BA58();
    sub_22D32E110(&qword_2685685C0);
    sub_22D34B6D8();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v26, v28);
  }
  else
  {
    sub_22D34BA58();
    sub_22D34BA68();
  }
  uint64_t v29 = sub_22D34BA78();
  uint64_t v30 = -1 << *(unsigned char *)(v60 + 32);
  a2 = v29 & ~v30;
  uint64_t v53 = v60 + 56;
  if ((*(void *)(v60 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v59 = ~v30;
    uint64_t v58 = *(void *)(v13 + 72);
    uint64_t v56 = (void (**)(char *, uint64_t))(v8 + 8);
    uint64_t v52 = (void (**)(char *, char *, uint64_t))(v8 + 32);
    uint64_t v31 = (int *)v55;
    uint64_t v32 = v53;
    do
    {
      sub_22D32DFD8(*(void *)(v60 + 48) + v58 * a2, (uint64_t)v21, type metadata accessor for SymbolKey);
      uint64_t v33 = &v7[*(int *)(v61 + 48)];
      sub_22D32DFD8((uint64_t)v21, (uint64_t)v7, type metadata accessor for SymbolKey);
      sub_22D32DFD8(v62, (uint64_t)v33, type metadata accessor for SymbolKey);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        sub_22D32DFD8((uint64_t)v7, (uint64_t)v16, type metadata accessor for SymbolKey);
        if (swift_getEnumCaseMultiPayload() != 1)
        {
          (*v56)(v16, v57);
LABEL_14:
          sub_22D32DF1C((uint64_t)v7);
          goto LABEL_15;
        }
        uint64_t v34 = v16;
        uint64_t v35 = v54;
        uint64_t v36 = v12;
        uint64_t v37 = v57;
        (*v52)(v54, v33, v57);
        char v38 = sub_22D34B6A8();
        char v39 = *v56;
        unint64_t v40 = v35;
        BOOL v16 = v34;
        uint64_t v31 = (int *)v55;
        (*v56)(v40, v37);
        uint64_t v41 = v37;
        uint64_t v12 = v36;
        uint64_t v32 = v53;
        v39(v16, v41);
        sub_22D32DF7C((uint64_t)v7);
        if (v38) {
          goto LABEL_22;
        }
      }
      else
      {
        sub_22D32DFD8((uint64_t)v7, (uint64_t)v31, type metadata accessor for SymbolKey);
        if (swift_getEnumCaseMultiPayload() == 1) {
          goto LABEL_14;
        }
        int v42 = *v31;
        int v43 = *(_DWORD *)v33;
        sub_22D32DF7C((uint64_t)v7);
        if (v42 == v43)
        {
LABEL_22:
          sub_22D32DF7C((uint64_t)v21);
          sub_22D34B9D8();
          __break(1u);
          break;
        }
      }
LABEL_15:
      sub_22D32DF7C((uint64_t)v21);
      a2 = (a2 + 1) & v59;
    }
    while (((*(void *)(v32 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_23:
  uint64_t v44 = *v51;
  *(void *)(*v51 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = sub_22D32E040(v62, *(void *)(v44 + 48) + *(void *)(v50 + 72) * a2, type metadata accessor for SymbolKey);
  uint64_t v46 = *(void *)(v44 + 16);
  BOOL v47 = __OFADD__(v46, 1);
  uint64_t v48 = v46 + 1;
  if (v47) {
    __break(1u);
  }
  else {
    *(void *)(v44 + 16) = v48;
  }
  return result;
}

void *sub_22D3299A8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268568640);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_22D34B898();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_22D329B5C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685685D0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_22D34B898();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_DWORD *)(*(void *)(v4 + 48) + 4 * v15) = *(_DWORD *)(*(void *)(v2 + 48) + 4 * v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_22D329CF4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SymbolKey(0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  int v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685685C8);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_22D34B898();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_27:
    *uint64_t v1 = v8;
    return result;
  }
  unint64_t v24 = v1;
  uint64_t result = (void *)(v7 + 56);
  uint64_t v10 = v6 + 56;
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v10 + 8 * v11) {
    uint64_t result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  }
  int64_t v12 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & *(void *)(v6 + 56);
  int64_t v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      unint64_t v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v18 = v17 | (v12 << 6);
      goto LABEL_9;
    }
    int64_t v20 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v20 >= v16) {
      goto LABEL_25;
    }
    unint64_t v21 = *(void *)(v10 + 8 * v20);
    ++v12;
    if (!v21)
    {
      int64_t v12 = v20 + 1;
      if (v20 + 1 >= v16) {
        goto LABEL_25;
      }
      unint64_t v21 = *(void *)(v10 + 8 * v12);
      if (!v21)
      {
        int64_t v12 = v20 + 2;
        if (v20 + 2 >= v16) {
          goto LABEL_25;
        }
        unint64_t v21 = *(void *)(v10 + 8 * v12);
        if (!v21) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v15 = (v21 - 1) & v21;
    unint64_t v18 = __clz(__rbit64(v21)) + (v12 << 6);
LABEL_9:
    unint64_t v19 = *(void *)(v3 + 72) * v18;
    sub_22D32DFD8(*(void *)(v6 + 48) + v19, (uint64_t)v5, type metadata accessor for SymbolKey);
    uint64_t result = (void *)sub_22D32E040((uint64_t)v5, *(void *)(v8 + 48) + v19, type metadata accessor for SymbolKey);
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v16)
  {
LABEL_25:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v24;
    goto LABEL_27;
  }
  unint64_t v21 = *(void *)(v10 + 8 * v22);
  if (v21)
  {
    int64_t v12 = v22;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v12 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v12 >= v16) {
      goto LABEL_25;
    }
    unint64_t v21 = *(void *)(v10 + 8 * v12);
    ++v22;
    if (v21) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_22D329F64()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268568640);
  uint64_t v3 = sub_22D34B8A8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_22D34BA48();
    swift_bridgeObjectRetain();
    sub_22D34B778();
    uint64_t result = sub_22D34BA78();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    void *v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_22D32A214()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685685D0);
  uint64_t result = sub_22D34B8A8();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v10) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    int v18 = *(_DWORD *)(*(void *)(v2 + 48) + 4 * v14);
    sub_22D34BA48();
    sub_22D34BA68();
    uint64_t result = sub_22D34BA78();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(_DWORD *)(*(void *)(v4 + 48) + 4 * v12) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_22D32A490()
{
  uint64_t v1 = v0;
  uint64_t v45 = sub_22D34B6B8();
  uint64_t v2 = *(void *)(v45 - 8);
  MEMORY[0x270FA5388](v45);
  uint64_t v44 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for SymbolKey(0);
  uint64_t v48 = *(void *)(v4 - 8);
  uint64_t v49 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  unint64_t v9 = (char *)&v41 - v8;
  uint64_t v10 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685685C8);
  uint64_t v11 = sub_22D34B8A8();
  uint64_t v12 = v10;
  uint64_t v13 = v11;
  if (!*(void *)(v12 + 16))
  {
    uint64_t result = swift_release();
LABEL_38:
    *uint64_t v1 = v13;
    return result;
  }
  uint64_t v14 = 1 << *(unsigned char *)(v12 + 32);
  uint64_t v15 = *(void *)(v12 + 56);
  uint64_t v46 = v12 + 56;
  if (v14 < 64) {
    uint64_t v16 = ~(-1 << v14);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & v15;
  int64_t v47 = (unint64_t)(v14 + 63) >> 6;
  int v43 = (void (**)(char *, char *, uint64_t))(v2 + 32);
  uint64_t v41 = v1;
  int v42 = (void (**)(char *, uint64_t))(v2 + 8);
  uint64_t v18 = v11 + 56;
  uint64_t result = swift_retain();
  for (int64_t i = 0; ; int64_t i = v50)
  {
    if (v17)
    {
      unint64_t v22 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      int64_t v50 = i;
      unint64_t v23 = v22 | (i << 6);
      goto LABEL_24;
    }
    int64_t v24 = i + 1;
    if (__OFADD__(i, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v24 >= v47) {
      goto LABEL_36;
    }
    unint64_t v25 = *(void *)(v46 + 8 * v24);
    int64_t v26 = i + 1;
    if (!v25)
    {
      int64_t v26 = i + 2;
      if (i + 2 >= v47) {
        goto LABEL_36;
      }
      unint64_t v25 = *(void *)(v46 + 8 * v26);
      if (!v25)
      {
        int64_t v26 = i + 3;
        if (i + 3 >= v47) {
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v46 + 8 * v26);
        if (!v25) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v17 = (v25 - 1) & v25;
    int64_t v50 = v26;
    unint64_t v23 = __clz(__rbit64(v25)) + (v26 << 6);
LABEL_24:
    uint64_t v28 = *(void *)(v48 + 72);
    sub_22D32DFD8(*(void *)(v12 + 48) + v28 * v23, (uint64_t)v9, type metadata accessor for SymbolKey);
    sub_22D34BA48();
    sub_22D32DFD8((uint64_t)v9, (uint64_t)v7, type metadata accessor for SymbolKey);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      int64_t v29 = v9;
      uint64_t v30 = v7;
      uint64_t v32 = v44;
      uint64_t v31 = v45;
      (*v43)(v44, v30, v45);
      sub_22D34BA58();
      sub_22D32E110(&qword_2685685C0);
      sub_22D34B6D8();
      uint64_t v33 = v32;
      uint64_t v7 = v30;
      unint64_t v9 = v29;
      (*v42)(v33, v31);
    }
    else
    {
      sub_22D34BA58();
      sub_22D34BA68();
    }
    uint64_t result = sub_22D34BA78();
    uint64_t v34 = -1 << *(unsigned char *)(v13 + 32);
    unint64_t v35 = result & ~v34;
    unint64_t v36 = v35 >> 6;
    if (((-1 << v35) & ~*(void *)(v18 + 8 * (v35 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v35) & ~*(void *)(v18 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v37 = 0;
      unint64_t v38 = (unint64_t)(63 - v34) >> 6;
      do
      {
        if (++v36 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v39 = v36 == v38;
        if (v36 == v38) {
          unint64_t v36 = 0;
        }
        v37 |= v39;
        uint64_t v40 = *(void *)(v18 + 8 * v36);
      }
      while (v40 == -1);
      unint64_t v21 = __clz(__rbit64(~v40)) + (v36 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t result = sub_22D32E040((uint64_t)v9, *(void *)(v13 + 48) + v21 * v28, type metadata accessor for SymbolKey);
    ++*(void *)(v13 + 16);
  }
  uint64_t v27 = i + 4;
  if (i + 4 >= v47)
  {
LABEL_36:
    uint64_t result = swift_release_n();
    uint64_t v1 = v41;
    goto LABEL_38;
  }
  unint64_t v25 = *(void *)(v46 + 8 * v27);
  if (v25)
  {
    int64_t v26 = i + 4;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v26 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v26 >= v47) {
      goto LABEL_36;
    }
    unint64_t v25 = *(void *)(v46 + 8 * v26);
    ++v27;
    if (v25) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_22D32A990(char **a1, void *a2)
{
  uint64_t v4 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v4 = sub_22D33D2A8((uint64_t)v4);
  }
  uint64_t v5 = *((void *)v4 + 2);
  v7[0] = (uint64_t)(v4 + 32);
  v7[1] = v5;
  uint64_t result = sub_22D32AA04(v7, a2);
  *a1 = v4;
  return result;
}

uint64_t sub_22D32AA04(uint64_t *a1, void *a2)
{
  uint64_t v5 = a1[1];
  uint64_t result = sub_22D34B988();
  if (result >= v5)
  {
    if (v5 < 0) {
      goto LABEL_200;
    }
    if (v5) {
      return sub_22D32B958(0, v5, 1, a1, a2);
    }
    return result;
  }
  if (v5 >= 0) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = v5 + 1;
  }
  if (v5 < -1) {
    goto LABEL_199;
  }
  uint64_t v164 = result;
  uint64_t v175 = v2;
  v161 = a1;
  if (v5 <= 1)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    v171 = (char *)(MEMORY[0x263F8EE78] + 32);
    uint64_t v163 = MEMORY[0x263F8EE78];
    if (v5 != 1)
    {
      unint64_t v12 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_166:
      if (v12 >= 2)
      {
        uint64_t v154 = *v161;
        do
        {
          unint64_t v155 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_194;
          }
          if (!v154) {
            goto LABEL_207;
          }
          uint64_t v156 = *(void *)(v9 + 32 + 16 * v155);
          uint64_t v157 = *(void *)(v9 + 32 + 16 * (v12 - 1) + 8);
          uint64_t result = sub_22D32BCF8((unsigned int *)(v154 + 4 * v156), (unsigned int *)(v154 + 4 * *(void *)(v9 + 32 + 16 * (v12 - 1))), v154 + 4 * v157, v171, a2);
          if (v175) {
            break;
          }
          if (v157 < v156) {
            goto LABEL_195;
          }
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)sub_22D33C998(v9);
            uint64_t v9 = result;
          }
          if (v155 >= *(void *)(v9 + 16)) {
            goto LABEL_196;
          }
          v158 = (void *)(v9 + 32 + 16 * v155);
          void *v158 = v156;
          v158[1] = v157;
          unint64_t v159 = *(void *)(v9 + 16);
          if (v12 > v159) {
            goto LABEL_197;
          }
          uint64_t result = (uint64_t)memmove((void *)(v9 + 32 + 16 * (v12 - 1)), (const void *)(v9 + 32 + 16 * v12), 16 * (v159 - v12));
          *(void *)(v9 + 16) = v159 - 1;
          unint64_t v12 = v159 - 1;
        }
        while (v159 > 2);
      }
LABEL_177:
      swift_bridgeObjectRelease();
      *(void *)(v163 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v8 = v7 >> 1;
    uint64_t result = sub_22D34B808();
    *(void *)(result + 16) = v8;
    uint64_t v163 = result;
    v171 = (char *)(result + 32);
  }
  uint64_t v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v162 = *a1 + 8;
  uint64_t v160 = *a1 - 4;
  uint64_t v9 = MEMORY[0x263F8EE78];
  v174 = a2;
  uint64_t v168 = v5;
  uint64_t v179 = *a1;
  while (2)
  {
    uint64_t v13 = v10 + 1;
    uint64_t v169 = v10;
    if (v10 + 1 >= v5) {
      goto LABEL_73;
    }
    uint64_t v14 = *(unsigned int *)(v11 + 4 * v13);
    uint64_t v15 = *(unsigned int *)(v11 + 4 * v10);
    uint64_t v16 = (uint64_t (*)(uint64_t))a2[6];
    uint64_t v165 = v9;
    unint64_t v17 = a2;
    if (v16)
    {
      swift_retain();
      uint64_t v18 = v16(v14);
      char v20 = v19;
      uint64_t result = sub_22D32E15C((uint64_t)v16);
      if ((v20 & 1) == 0) {
        goto LABEL_26;
      }
    }
    else
    {
      uint64_t v21 = a2[1];
      if (*(void *)(v21 + 16))
      {
        uint64_t v22 = a2[5];
        uint64_t result = sub_22D3229EC(v14);
        if (v23)
        {
          if (*(void *)(v22 + 16))
          {
            uint64_t v24 = *(void *)(v21 + 56) + 104 * result;
            uint64_t v25 = *(void *)(v24 + 16);
            uint64_t v26 = *(void *)(v24 + 8);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain_n();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            unint64_t v27 = sub_22D3195C4(v26, v25);
            if (v28)
            {
              uint64_t v29 = *(void *)(*(void *)(v22 + 56) + 8 * v27);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v18 = v29;
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t result = swift_bridgeObjectRelease_n();
              a2 = v174;
              uint64_t v5 = v168;
              goto LABEL_27;
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t result = swift_bridgeObjectRelease_n();
            unint64_t v17 = v174;
            uint64_t v5 = v168;
          }
        }
      }
    }
    uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_26:
    a2 = v17;
LABEL_27:
    uint64_t v30 = (uint64_t (*)(uint64_t))a2[6];
    if (v30)
    {
      swift_retain();
      uint64_t v176 = v30(v15);
      char v32 = v31;
      uint64_t result = sub_22D32E15C((uint64_t)v30);
      if ((v32 & 1) == 0) {
        goto LABEL_37;
      }
      goto LABEL_36;
    }
    uint64_t v33 = a2[1];
    if (!*(void *)(v33 + 16) || (v34 = a2[5], uint64_t result = sub_22D3229EC(v15), (v35 & 1) == 0) || !*(void *)(v34 + 16))
    {
LABEL_36:
      uint64_t v176 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_37;
    }
    uint64_t v36 = *(void *)(v33 + 56) + 104 * result;
    uint64_t v37 = *(void *)(v36 + 16);
    uint64_t v38 = *(void *)(v36 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v39 = sub_22D3195C4(v38, v37);
    if ((v40 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease_n();
      a2 = v174;
      goto LABEL_36;
    }
    uint64_t v176 = *(void *)(*(void *)(v34 + 56) + 8 * v39);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease_n();
    a2 = v174;
LABEL_37:
    uint64_t v10 = v169;
    uint64_t v13 = v169 + 2;
    uint64_t v11 = v179;
    if (v169 + 2 >= v5) {
      goto LABEL_63;
    }
    uint64_t v41 = (int *)(v162 + 4 * v169);
    uint64_t v172 = v18;
    do
    {
      uint64_t v44 = *(v41 - 1);
      uint64_t v43 = *v41;
      uint64_t v45 = (uint64_t (*)(uint64_t))a2[6];
      if (!v45)
      {
        int v42 = a2;
        uint64_t v49 = a2[1];
        if (*(void *)(v49 + 16))
        {
          uint64_t v50 = a2[5];
          uint64_t result = sub_22D3229EC(*v41);
          if (v51)
          {
            if (*(void *)(v50 + 16))
            {
              uint64_t v52 = *(void *)(v49 + 56) + 104 * result;
              uint64_t v53 = *(void *)(v52 + 16);
              uint64_t v54 = *(void *)(v52 + 8);
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain_n();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              unint64_t v55 = sub_22D3195C4(v54, v53);
              if (v56)
              {
                uint64_t v46 = *(void *)(*(void *)(v50 + 56) + 8 * v55);
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                uint64_t result = swift_bridgeObjectRelease_n();
                int v42 = v174;
                uint64_t v18 = v172;
                goto LABEL_52;
              }
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t result = swift_bridgeObjectRelease_n();
              int v42 = v174;
              uint64_t v18 = v172;
            }
          }
        }
LABEL_51:
        uint64_t v46 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_52;
      }
      int v42 = a2;
      swift_retain();
      uint64_t v46 = v45(v43);
      char v48 = v47;
      uint64_t result = sub_22D32E15C((uint64_t)v45);
      if (v48) {
        goto LABEL_51;
      }
LABEL_52:
      uint64_t v57 = (uint64_t (*)(uint64_t))v42[6];
      if (v57)
      {
        swift_retain();
        uint64_t v58 = v57(v44);
        char v60 = v59;
        uint64_t result = sub_22D32E15C((uint64_t)v57);
        if (v60) {
          goto LABEL_40;
        }
      }
      else
      {
        uint64_t v61 = v42[1];
        if (!*(void *)(v61 + 16)) {
          goto LABEL_40;
        }
        uint64_t v62 = v42[5];
        uint64_t result = sub_22D3229EC(v44);
        if ((v63 & 1) == 0 || !*(void *)(v62 + 16)) {
          goto LABEL_40;
        }
        uint64_t v64 = *(void *)(v61 + 56) + 104 * result;
        uint64_t v65 = *(void *)(v64 + 16);
        uint64_t v66 = *(void *)(v64 + 8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        unint64_t v67 = sub_22D3195C4(v66, v65);
        if ((v68 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease_n();
          int v42 = v174;
          uint64_t v18 = v172;
LABEL_40:
          uint64_t v11 = v179;
          if (v18 < v176 == (v46 == 0x7FFFFFFFFFFFFFFFLL)) {
            goto LABEL_61;
          }
          goto LABEL_41;
        }
        uint64_t v58 = *(void *)(*(void *)(v62 + 56) + 8 * v67);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease_n();
        int v42 = v174;
        uint64_t v18 = v172;
      }
      uint64_t v11 = v179;
      if (v18 < v176 == v46 >= v58)
      {
LABEL_61:
        uint64_t v5 = v168;
        uint64_t v10 = v169;
        a2 = v42;
        goto LABEL_63;
      }
LABEL_41:
      ++v41;
      ++v13;
      a2 = v42;
    }
    while (v168 != v13);
    uint64_t v5 = v168;
    uint64_t v10 = v169;
    uint64_t v13 = v168;
LABEL_63:
    if (v18 < v176)
    {
      uint64_t v9 = v165;
      if (v13 < v10) {
        goto LABEL_201;
      }
      if (v10 >= v13) {
        goto LABEL_73;
      }
      uint64_t v69 = v13 - 1;
      do
      {
        if (v10 != v69)
        {
          if (!v11) {
            goto LABEL_206;
          }
          int v70 = *(_DWORD *)(v11 + 4 * v10);
          *(_DWORD *)(v11 + 4 * v10) = *(_DWORD *)(v11 + 4 * v69);
          *(_DWORD *)(v11 + 4 * v69) = v70;
        }
        BOOL v135 = ++v10 < v69--;
      }
      while (v135);
      uint64_t v10 = v169;
      if (v13 < v5) {
        goto LABEL_74;
      }
LABEL_115:
      if (v13 < v10) {
        goto LABEL_193;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_22D33C7B8(0, *(void *)(v9 + 16) + 1, 1, (char *)v9);
        uint64_t v9 = result;
      }
      unint64_t v104 = *(void *)(v9 + 16);
      unint64_t v103 = *(void *)(v9 + 24);
      unint64_t v12 = v104 + 1;
      uint64_t v11 = v179;
      if (v104 >= v103 >> 1)
      {
        uint64_t result = (uint64_t)sub_22D33C7B8((char *)(v103 > 1), v104 + 1, 1, (char *)v9);
        uint64_t v11 = v179;
        uint64_t v9 = result;
      }
      *(void *)(v9 + 16) = v12;
      uint64_t v173 = v9 + 32;
      v105 = (uint64_t *)(v9 + 32 + 16 * v104);
      uint64_t *v105 = v169;
      v105[1] = v13;
      uint64_t v178 = v13;
      if (!v104)
      {
        unint64_t v12 = 1;
LABEL_14:
        uint64_t v5 = v168;
        uint64_t v10 = v178;
        if (v178 >= v168) {
          goto LABEL_166;
        }
        continue;
      }
      uint64_t v106 = v9 + 32;
      while (2)
      {
        unint64_t v107 = v12 - 1;
        if (v12 >= 4)
        {
          unint64_t v112 = v106 + 16 * v12;
          uint64_t v113 = *(void *)(v112 - 64);
          uint64_t v114 = *(void *)(v112 - 56);
          BOOL v118 = __OFSUB__(v114, v113);
          uint64_t v115 = v114 - v113;
          if (v118) {
            goto LABEL_182;
          }
          uint64_t v117 = *(void *)(v112 - 48);
          uint64_t v116 = *(void *)(v112 - 40);
          BOOL v118 = __OFSUB__(v116, v117);
          uint64_t v110 = v116 - v117;
          char v111 = v118;
          if (v118) {
            goto LABEL_183;
          }
          unint64_t v119 = v12 - 2;
          v120 = (uint64_t *)(v106 + 16 * (v12 - 2));
          uint64_t v122 = *v120;
          uint64_t v121 = v120[1];
          BOOL v118 = __OFSUB__(v121, v122);
          uint64_t v123 = v121 - v122;
          if (v118) {
            goto LABEL_184;
          }
          BOOL v118 = __OFADD__(v110, v123);
          uint64_t v124 = v110 + v123;
          if (v118) {
            goto LABEL_186;
          }
          if (v124 >= v115)
          {
            v142 = (uint64_t *)(v106 + 16 * v107);
            uint64_t v144 = *v142;
            uint64_t v143 = v142[1];
            BOOL v118 = __OFSUB__(v143, v144);
            uint64_t v145 = v143 - v144;
            if (v118) {
              goto LABEL_192;
            }
            BOOL v135 = v110 < v145;
          }
          else
          {
LABEL_135:
            if (v111) {
              goto LABEL_185;
            }
            unint64_t v119 = v12 - 2;
            v125 = (uint64_t *)(v106 + 16 * (v12 - 2));
            uint64_t v127 = *v125;
            uint64_t v126 = v125[1];
            BOOL v128 = __OFSUB__(v126, v127);
            uint64_t v129 = v126 - v127;
            char v130 = v128;
            if (v128) {
              goto LABEL_187;
            }
            v131 = (uint64_t *)(v106 + 16 * v107);
            uint64_t v133 = *v131;
            uint64_t v132 = v131[1];
            BOOL v118 = __OFSUB__(v132, v133);
            uint64_t v134 = v132 - v133;
            if (v118) {
              goto LABEL_189;
            }
            if (__OFADD__(v129, v134)) {
              goto LABEL_191;
            }
            if (v129 + v134 < v110) {
              goto LABEL_147;
            }
            BOOL v135 = v110 < v134;
          }
          if (v135) {
            unint64_t v107 = v119;
          }
        }
        else
        {
          if (v12 == 3)
          {
            uint64_t v109 = *(void *)(v9 + 32);
            uint64_t v108 = *(void *)(v9 + 40);
            BOOL v118 = __OFSUB__(v108, v109);
            uint64_t v110 = v108 - v109;
            char v111 = v118;
            goto LABEL_135;
          }
          uint64_t v136 = *(void *)(v9 + 32);
          uint64_t v137 = *(void *)(v9 + 40);
          BOOL v118 = __OFSUB__(v137, v136);
          uint64_t v129 = v137 - v136;
          char v130 = v118;
LABEL_147:
          if (v130) {
            goto LABEL_188;
          }
          v138 = (uint64_t *)(v106 + 16 * v107);
          uint64_t v140 = *v138;
          uint64_t v139 = v138[1];
          BOOL v118 = __OFSUB__(v139, v140);
          uint64_t v141 = v139 - v140;
          if (v118) {
            goto LABEL_190;
          }
          if (v141 < v129) {
            goto LABEL_14;
          }
        }
        unint64_t v146 = v107 - 1;
        if (v107 - 1 >= v12)
        {
          __break(1u);
LABEL_179:
          __break(1u);
LABEL_180:
          __break(1u);
LABEL_181:
          __break(1u);
LABEL_182:
          __break(1u);
LABEL_183:
          __break(1u);
LABEL_184:
          __break(1u);
LABEL_185:
          __break(1u);
LABEL_186:
          __break(1u);
LABEL_187:
          __break(1u);
LABEL_188:
          __break(1u);
LABEL_189:
          __break(1u);
LABEL_190:
          __break(1u);
LABEL_191:
          __break(1u);
LABEL_192:
          __break(1u);
LABEL_193:
          __break(1u);
LABEL_194:
          __break(1u);
LABEL_195:
          __break(1u);
LABEL_196:
          __break(1u);
LABEL_197:
          __break(1u);
LABEL_198:
          __break(1u);
LABEL_199:
          __break(1u);
LABEL_200:
          __break(1u);
LABEL_201:
          __break(1u);
LABEL_202:
          __break(1u);
          goto LABEL_203;
        }
        if (!v11) {
          goto LABEL_205;
        }
        uint64_t v147 = v9;
        v148 = (uint64_t *)(v106 + 16 * v146);
        uint64_t v149 = v106;
        uint64_t v150 = *v148;
        v151 = (void *)(v149 + 16 * v107);
        uint64_t v152 = v151[1];
        uint64_t result = sub_22D32BCF8((unsigned int *)(v11 + 4 * *v148), (unsigned int *)(v11 + 4 * *v151), v11 + 4 * v152, v171, a2);
        if (v175) {
          goto LABEL_177;
        }
        if (v152 < v150) {
          goto LABEL_179;
        }
        if (v107 > *(void *)(v147 + 16)) {
          goto LABEL_180;
        }
        uint64_t *v148 = v150;
        uint64_t v106 = v173;
        *(void *)(v173 + 16 * v146 + 8) = v152;
        unint64_t v153 = *(void *)(v147 + 16);
        if (v107 >= v153) {
          goto LABEL_181;
        }
        uint64_t v9 = v147;
        unint64_t v12 = v153 - 1;
        uint64_t result = (uint64_t)memmove(v151, v151 + 2, 16 * (v153 - 1 - v107));
        *(void *)(v147 + 16) = v153 - 1;
        uint64_t v11 = v179;
        if (v153 <= 2) {
          goto LABEL_14;
        }
        continue;
      }
    }
    break;
  }
  uint64_t v9 = v165;
LABEL_73:
  if (v13 >= v5) {
    goto LABEL_115;
  }
LABEL_74:
  if (__OFSUB__(v13, v10)) {
    goto LABEL_198;
  }
  if (v13 - v10 >= v164)
  {
LABEL_114:
    uint64_t v10 = v169;
    goto LABEL_115;
  }
  if (__OFADD__(v169, v164)) {
    goto LABEL_202;
  }
  if (v169 + v164 >= v5) {
    uint64_t v71 = v5;
  }
  else {
    uint64_t v71 = v169 + v164;
  }
  if (v71 >= v169)
  {
    if (v13 == v71)
    {
      uint64_t v10 = v169;
      goto LABEL_115;
    }
    uint64_t v166 = v9;
    uint64_t v167 = v71;
    int64_t v72 = (unsigned int *)(v160 + 4 * v13);
LABEL_88:
    uint64_t v74 = *(unsigned int *)(v11 + 4 * v13);
    uint64_t v75 = v169;
    v170 = v72;
    uint64_t v177 = v13;
    while (2)
    {
      uint64_t v76 = *v72;
      int64_t v77 = (uint64_t (*)(uint64_t))a2[6];
      if (v77)
      {
        swift_retain();
        uint64_t v78 = v77(v74);
        char v80 = v79;
        uint64_t result = sub_22D32E15C((uint64_t)v77);
        if ((v80 & 1) == 0)
        {
LABEL_99:
          char v89 = (uint64_t (*)(uint64_t))a2[6];
          if (v89)
          {
            uint64_t v90 = a2;
            swift_retain();
            uint64_t v91 = v89(v76);
            char v93 = v92;
            uint64_t result = sub_22D32E15C((uint64_t)v89);
            if ((v93 & 1) == 0)
            {
LABEL_101:
              uint64_t v11 = v179;
              if (v78 >= v91) {
                goto LABEL_86;
              }
LABEL_110:
              uint64_t v73 = v177;
              if (!v11) {
                goto LABEL_204;
              }
              unsigned int v102 = *v72;
              uint64_t v74 = v72[1];
              *int64_t v72 = v74;
              v72[1] = v102;
              --v72;
              if (v177 == ++v75) {
                goto LABEL_87;
              }
              continue;
            }
          }
          else
          {
            uint64_t v90 = a2;
            uint64_t v94 = a2[1];
            if (*(void *)(v94 + 16))
            {
              uint64_t v95 = a2[5];
              uint64_t result = sub_22D3229EC(v76);
              if (v96)
              {
                if (*(void *)(v95 + 16))
                {
                  uint64_t v97 = *(void *)(v94 + 56) + 104 * result;
                  uint64_t v98 = *(void *)(v97 + 16);
                  uint64_t v99 = *(void *)(v97 + 8);
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain_n();
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  unint64_t v100 = sub_22D3195C4(v99, v98);
                  if (v101)
                  {
                    uint64_t v91 = *(void *)(*(void *)(v95 + 56) + 8 * v100);
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    uint64_t result = swift_bridgeObjectRelease_n();
                    a2 = v174;
                    goto LABEL_101;
                  }
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  uint64_t result = swift_bridgeObjectRelease_n();
                  uint64_t v90 = v174;
                }
              }
            }
          }
          uint64_t v11 = v179;
          a2 = v90;
          if (v78 == 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_86:
            uint64_t v73 = v177;
LABEL_87:
            uint64_t v13 = v73 + 1;
            int64_t v72 = v170 + 1;
            if (v13 == v167)
            {
              uint64_t v13 = v167;
              uint64_t v9 = v166;
              goto LABEL_114;
            }
            goto LABEL_88;
          }
          goto LABEL_110;
        }
      }
      else
      {
        uint64_t v81 = a2[1];
        if (*(void *)(v81 + 16))
        {
          uint64_t v82 = a2[5];
          uint64_t result = sub_22D3229EC(v74);
          if (v83)
          {
            if (*(void *)(v82 + 16))
            {
              uint64_t v84 = *(void *)(v81 + 56) + 104 * result;
              uint64_t v85 = *(void *)(v84 + 16);
              uint64_t v86 = *(void *)(v84 + 8);
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain_n();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              unint64_t v87 = sub_22D3195C4(v86, v85);
              if (v88)
              {
                uint64_t v78 = *(void *)(*(void *)(v82 + 56) + 8 * v87);
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                uint64_t result = swift_bridgeObjectRelease_n();
                a2 = v174;
                goto LABEL_99;
              }
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t result = swift_bridgeObjectRelease_n();
              a2 = v174;
            }
          }
        }
      }
      break;
    }
    uint64_t v78 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_99;
  }
LABEL_203:
  __break(1u);
LABEL_204:
  __break(1u);
LABEL_205:
  __break(1u);
LABEL_206:
  __break(1u);
LABEL_207:
  __break(1u);
  return result;
}

unint64_t sub_22D32B958(unint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4, void *a5)
{
  unint64_t v35 = result;
  if (a3 != a2)
  {
    uint64_t v39 = *a4;
    uint64_t v6 = (unsigned int *)(*a4 + 4 * a3 - 4);
LABEL_5:
    uint64_t v7 = *(unsigned int *)(v39 + 4 * a3);
    unint64_t v8 = v35;
    uint64_t v36 = v6;
    uint64_t v40 = a3;
    while (1)
    {
      uint64_t v9 = *v6;
      uint64_t v10 = (uint64_t (*)(uint64_t))a5[6];
      if (!v10) {
        break;
      }
      swift_retain();
      uint64_t v11 = v10(v7);
      char v13 = v12;
      uint64_t result = sub_22D32E15C((uint64_t)v10);
      if (v13) {
        goto LABEL_15;
      }
LABEL_16:
      uint64_t v21 = (uint64_t (*)(uint64_t))a5[6];
      if (v21)
      {
        swift_retain();
        uint64_t v22 = v21(v9);
        char v24 = v23;
        uint64_t result = sub_22D32E15C((uint64_t)v21);
        if ((v24 & 1) == 0) {
          goto LABEL_18;
        }
      }
      else
      {
        uint64_t v26 = a5[1];
        if (*(void *)(v26 + 16))
        {
          uint64_t v27 = a5[5];
          uint64_t result = sub_22D3229EC(v9);
          if (v28)
          {
            if (*(void *)(v27 + 16))
            {
              uint64_t v29 = *(void *)(v26 + 56) + 104 * result;
              uint64_t v30 = *(void *)(v29 + 16);
              uint64_t v38 = *(void *)(v29 + 8);
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain_n();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              unint64_t v31 = sub_22D3195C4(v38, v30);
              if (v32)
              {
                uint64_t v22 = *(void *)(*(void *)(v27 + 56) + 8 * v31);
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                uint64_t result = swift_bridgeObjectRelease_n();
LABEL_18:
                uint64_t v25 = v40;
                if (v11 >= v22) {
                  goto LABEL_4;
                }
                goto LABEL_27;
              }
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t result = swift_bridgeObjectRelease_n();
            }
          }
        }
      }
      uint64_t v25 = v40;
      if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_4;
      }
LABEL_27:
      if (!v39)
      {
        __break(1u);
        return result;
      }
      unsigned int v33 = *v6;
      uint64_t v7 = v6[1];
      *uint64_t v6 = v7;
      v6[1] = v33;
      --v6;
      if (v25 == ++v8)
      {
LABEL_4:
        a3 = v25 + 1;
        uint64_t v6 = v36 + 1;
        if (a3 == a2) {
          return result;
        }
        goto LABEL_5;
      }
    }
    uint64_t v14 = a5[1];
    if (*(void *)(v14 + 16))
    {
      uint64_t v15 = a5[5];
      uint64_t result = sub_22D3229EC(v7);
      if (v16)
      {
        if (*(void *)(v15 + 16))
        {
          uint64_t v17 = *(void *)(v14 + 56) + 104 * result;
          uint64_t v18 = *(void *)(v17 + 16);
          uint64_t v37 = *(void *)(v17 + 8);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          unint64_t v19 = sub_22D3195C4(v37, v18);
          if (v20)
          {
            uint64_t v11 = *(void *)(*(void *)(v15 + 56) + 8 * v19);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t result = swift_bridgeObjectRelease_n();
            goto LABEL_16;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease_n();
        }
      }
    }
LABEL_15:
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_16;
  }
  return result;
}

uint64_t sub_22D32BCF8(unsigned int *__dst, unsigned int *__src, unint64_t a3, char *a4, void *a5)
{
  uint64_t v7 = __src;
  unint64_t v8 = __dst;
  int64_t v9 = (char *)__src - (char *)__dst;
  int64_t v10 = (char *)__src - (char *)__dst + 3;
  if ((char *)__src - (char *)__dst >= 0) {
    int64_t v10 = (char *)__src - (char *)__dst;
  }
  uint64_t v11 = v10 >> 2;
  uint64_t v12 = a3 - (void)__src;
  uint64_t v13 = a3 - (void)__src + 3;
  if ((uint64_t)(a3 - (void)__src) >= 0) {
    uint64_t v13 = a3 - (void)__src;
  }
  uint64_t v14 = v13 >> 2;
  if (v11 >= v13 >> 2)
  {
    if (a4 != (char *)__src || &__src[v14] <= (unsigned int *)a4) {
      memmove(a4, __src, 4 * v14);
    }
    char v16 = &a4[4 * v14];
    uint64_t v15 = (unsigned int *)a4;
    if (v8 >= v7 || v12 < 4) {
      goto LABEL_40;
    }
    char v48 = (unsigned int *)(a3 - 4);
    uint64_t v84 = (unsigned int *)a4;
    while (1)
    {
      char v93 = v16;
      uint64_t v50 = v16 - 4;
      uint64_t v49 = *((unsigned int *)v16 - 1);
      char v88 = v7;
      char v51 = v7 - 1;
      uint64_t v52 = *(v7 - 1);
      uint64_t v53 = (uint64_t (*)(uint64_t))a5[6];
      if (!v53) {
        break;
      }
      swift_retain();
      uint64_t v90 = v53(v49);
      char v55 = v54;
      sub_22D32E15C((uint64_t)v53);
      if (v55) {
        goto LABEL_59;
      }
LABEL_60:
      uint64_t v64 = (char *)(v48 + 1);
      uint64_t v65 = (uint64_t (*)(uint64_t))a5[6];
      if (v65)
      {
        uint64_t v85 = v48;
        uint64_t v66 = v51;
        unint64_t v67 = v50;
        char v68 = a5;
        uint64_t v69 = v8;
        int v70 = v64;
        swift_retain();
        uint64_t v71 = v65(v52);
        char v73 = v72;
        sub_22D32E15C((uint64_t)v65);
        uint64_t v64 = v70;
        unint64_t v8 = v69;
        a5 = v68;
        uint64_t v50 = v67;
        char v51 = v66;
        char v48 = v85;
        if ((v73 & 1) == 0) {
          goto LABEL_62;
        }
      }
      else
      {
        uint64_t v75 = a5[1];
        if (*(void *)(v75 + 16))
        {
          uint64_t v76 = a5[5];
          unint64_t v77 = sub_22D3229EC(v52);
          uint64_t v64 = (char *)(v48 + 1);
          if (v78)
          {
            if (*(void *)(v76 + 16))
            {
              uint64_t v79 = *(void *)(v75 + 56) + 104 * v77;
              uint64_t v80 = *(void *)(v79 + 16);
              uint64_t v83 = *(void *)(v79 + 8);
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain_n();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              unint64_t v81 = sub_22D3195C4(v83, v80);
              if (v82)
              {
                uint64_t v71 = *(void *)(*(void *)(v76 + 56) + 8 * v81);
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease_n();
                uint64_t v64 = (char *)(v48 + 1);
LABEL_62:
                uint64_t v7 = v88;
                char v16 = v93;
                if (v90 >= v71) {
                  goto LABEL_63;
                }
                goto LABEL_75;
              }
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease_n();
              uint64_t v64 = (char *)(v48 + 1);
            }
          }
        }
      }
      uint64_t v7 = v88;
      char v16 = v93;
      if (v90 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_63:
        char v51 = (unsigned int *)v50;
        if (v64 != v16)
        {
          char v16 = v50;
LABEL_80:
          *char v48 = *v51;
          goto LABEL_81;
        }
        BOOL v74 = v48 >= (unsigned int *)v16;
        char v16 = v50;
        if (v74) {
          goto LABEL_80;
        }
        goto LABEL_81;
      }
LABEL_75:
      if (v64 != (char *)v7)
      {
        uint64_t v7 = v51;
        goto LABEL_80;
      }
      BOOL v74 = v48 >= v7;
      uint64_t v7 = v51;
      if (v74) {
        goto LABEL_80;
      }
LABEL_81:
      if (v7 <= v8)
      {
        uint64_t v15 = v84;
        goto LABEL_40;
      }
      --v48;
      uint64_t v15 = v84;
      if (v16 <= (char *)v84) {
        goto LABEL_40;
      }
    }
    uint64_t v56 = a5[1];
    if (*(void *)(v56 + 16))
    {
      uint64_t v57 = a5[5];
      unint64_t v58 = sub_22D3229EC(v49);
      if (v59)
      {
        if (*(void *)(v57 + 16))
        {
          uint64_t v60 = *(void *)(v56 + 56) + 104 * v58;
          uint64_t v61 = *(void *)(v60 + 16);
          uint64_t v91 = *(void *)(v60 + 8);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          unint64_t v62 = sub_22D3195C4(v91, v61);
          if (v63)
          {
            uint64_t v90 = *(void *)(*(void *)(v57 + 56) + 8 * v62);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease_n();
            goto LABEL_60;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
        }
      }
    }
LABEL_59:
    uint64_t v90 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_60;
  }
  uint64_t v15 = (unsigned int *)a4;
  if (a4 != (char *)__dst || &__dst[v11] <= (unsigned int *)a4) {
    memmove(a4, __dst, 4 * v11);
  }
  char v16 = &a4[4 * v11];
  if ((unint64_t)v7 < a3 && v9 >= 4)
  {
    char v92 = &a4[4 * v11];
    while (1)
    {
      uint64_t v17 = v7;
      uint64_t v18 = *v7;
      uint64_t v19 = *v15;
      char v20 = (uint64_t (*)(uint64_t))a5[6];
      if (!v20) {
        break;
      }
      swift_retain();
      uint64_t v21 = v20(v18);
      char v23 = v22;
      sub_22D32E15C((uint64_t)v20);
      if (v23) {
        goto LABEL_21;
      }
LABEL_22:
      char v32 = (uint64_t (*)(uint64_t))a5[6];
      if (v32)
      {
        swift_retain();
        uint64_t v33 = v32(v19);
        char v35 = v34;
        sub_22D32E15C((uint64_t)v32);
        if ((v35 & 1) == 0) {
          goto LABEL_24;
        }
      }
      else
      {
        uint64_t v39 = a5[1];
        if (*(void *)(v39 + 16))
        {
          uint64_t v40 = a5[5];
          unint64_t v41 = sub_22D3229EC(v19);
          if (v42)
          {
            if (*(void *)(v40 + 16))
            {
              uint64_t v43 = *(void *)(v39 + 56) + 104 * v41;
              uint64_t v44 = *(void *)(v43 + 16);
              uint64_t v87 = *(void *)(v43 + 8);
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain_n();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              unint64_t v45 = sub_22D3195C4(v87, v44);
              if (v46)
              {
                uint64_t v33 = *(void *)(*(void *)(v40 + 56) + 8 * v45);
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease_n();
LABEL_24:
                BOOL v36 = v21 < v33;
                uint64_t v7 = v17;
                char v16 = v92;
                if (v36) {
                  goto LABEL_35;
                }
                goto LABEL_25;
              }
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease_n();
            }
          }
        }
      }
      BOOL v38 = v21 == 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v7 = v17;
      char v16 = v92;
      if (!v38)
      {
LABEL_35:
        uint64_t v37 = v7;
        BOOL v38 = v8 == v7++;
        if (v38) {
          goto LABEL_37;
        }
LABEL_36:
        unsigned int *v8 = *v37;
        goto LABEL_37;
      }
LABEL_25:
      uint64_t v37 = v15;
      BOOL v38 = v8 == v15++;
      if (!v38) {
        goto LABEL_36;
      }
LABEL_37:
      ++v8;
      if (v15 >= (unsigned int *)v16 || (unint64_t)v7 >= a3) {
        goto LABEL_39;
      }
    }
    uint64_t v24 = a5[1];
    if (*(void *)(v24 + 16))
    {
      uint64_t v25 = a5[5];
      unint64_t v26 = sub_22D3229EC(v18);
      if (v27)
      {
        if (*(void *)(v25 + 16))
        {
          uint64_t v28 = *(void *)(v24 + 56) + 104 * v26;
          uint64_t v29 = *(void *)(v28 + 16);
          uint64_t v86 = *(void *)(v28 + 8);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          unint64_t v30 = sub_22D3195C4(v86, v29);
          if (v31)
          {
            uint64_t v21 = *(void *)(*(void *)(v25 + 56) + 8 * v30);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease_n();
            goto LABEL_22;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
        }
      }
    }
LABEL_21:
    uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_22;
  }
LABEL_39:
  uint64_t v7 = v8;
LABEL_40:
  if (v7 != v15
    || v7 >= (unsigned int *)((char *)v15
                            + ((v16 - (char *)v15 + (v16 - (char *)v15 < 0 ? 3uLL : 0)) & 0xFFFFFFFFFFFFFFFCLL)))
  {
    memmove(v7, v15, 4 * ((v16 - (char *)v15) / 4));
  }
  return 1;
}

uint64_t sub_22D32C554(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x656D616E656C6966 && a2 == 0xE800000000000000;
  if (v2 || (sub_22D34B9A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6572706D6F437369 && a2 == 0xEC00000064657373 || (sub_22D34B9A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x617A696C61636F6CLL && a2 == 0xEC0000006E6F6974)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_22D34B9A8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_22D32C6DC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268568740);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22D32F544();
  sub_22D34BA98();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v22 = 0;
  uint64_t v9 = sub_22D34B968();
  uint64_t v11 = v10;
  char v21 = 1;
  swift_bridgeObjectRetain();
  int v19 = sub_22D34B958();
  char v20 = 2;
  uint64_t v12 = sub_22D34B948();
  uint64_t v14 = v13;
  uint64_t v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v18 = v12;
  v15(v8, v5);
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v11;
  *(unsigned char *)(a2 + 16) = v19;
  *(void *)(a2 + 24) = v18;
  *(void *)(a2 + 32) = v14;
  return result;
}

uint64_t sub_22D32C918(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000;
  if (v2 || (sub_22D34B9A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7365726F7473 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_22D34B9A8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

unint64_t sub_22D32CA04(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return MEMORY[0x263F8EE80];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268568658);
  uint64_t v3 = (void *)sub_22D34B928();
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  unint64_t result = sub_22D3229A8(v4);
  if (v8)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  uint64_t v9 = a1 + 9;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v4;
    uint64_t v10 = (void *)(v3[7] + 16 * result);
    void *v10 = v5;
    v10[1] = v6;
    uint64_t v11 = v3[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      break;
    }
    v3[2] = v13;
    if (!--v1) {
      goto LABEL_8;
    }
    uint64_t v14 = v9 + 3;
    uint64_t v4 = *(v9 - 2);
    uint64_t v5 = *(v9 - 1);
    uint64_t v15 = *v9;
    swift_bridgeObjectRetain();
    unint64_t result = sub_22D3229A8(v4);
    uint64_t v9 = v14;
    uint64_t v6 = v15;
    if (v16) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_22D32CB14()
{
  unint64_t result = qword_2685684F0;
  if (!qword_2685684F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2685684F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685684F0);
  }
  return result;
}

unint64_t sub_22D32CB80()
{
  unint64_t result = qword_268568500;
  if (!qword_268568500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568500);
  }
  return result;
}

unint64_t sub_22D32CBD4()
{
  unint64_t result = qword_268568520;
  if (!qword_268568520)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268568518);
    sub_22D32CC48();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568520);
  }
  return result;
}

unint64_t sub_22D32CC48()
{
  unint64_t result = qword_268568528;
  if (!qword_268568528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568528);
  }
  return result;
}

unint64_t sub_22D32CC9C()
{
  unint64_t result = qword_268568530;
  if (!qword_268568530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568530);
  }
  return result;
}

unint64_t sub_22D32CCF0()
{
  unint64_t result = qword_268568538;
  if (!qword_268568538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568538);
  }
  return result;
}

unint64_t sub_22D32CD44()
{
  unint64_t result = qword_268568548;
  if (!qword_268568548)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268568540);
    sub_22D32CDD4(&qword_268568510, &qword_268568508);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568548);
  }
  return result;
}

uint64_t sub_22D32CDD4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *_s19FeatureAvailabilityVMa()
{
  return &_s19FeatureAvailabilityVN;
}

ValueMetadata *_s20LayerSetAvailabilityVMa()
{
  return &_s20LayerSetAvailabilityVN;
}

uint64_t _s15CodableCategoryVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s15CodableCategoryVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s15CodableCategoryVMa()
{
  return &_s15CodableCategoryVN;
}

uint64_t _s21NameAvailabilityPlistVwxx()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s21NameAvailabilityPlistVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *_s21NameAvailabilityPlistVwca(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *_s21NameAvailabilityPlistVwta(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s21NameAvailabilityPlistVwet(uint64_t *a1, int a2)
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

uint64_t _s21NameAvailabilityPlistVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s21NameAvailabilityPlistVMa()
{
  return &_s21NameAvailabilityPlistVN;
}

uint64_t sub_22D32D0B4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x736C6F626D7973 && a2 == 0xE700000000000000;
  if (v2 || (sub_22D34B9A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x5F6F745F72616579 && a2 == 0xEF657361656C6572)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_22D34B9A8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_22D32D1CC(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268568560);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_22D32D40C();
  sub_22D34BA98();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268568508);
    HIBYTE(v9) = 0;
    sub_22D32CDD4(&qword_268568510, &qword_268568508);
    sub_22D34B978();
    uint64_t v7 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268568540);
    HIBYTE(v9) = 1;
    sub_22D32CD44();
    swift_bridgeObjectRetain();
    sub_22D34B978();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_22D32D40C()
{
  unint64_t result = qword_268568568;
  if (!qword_268568568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568568);
  }
  return result;
}

uint64_t sub_22D32D460(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 7955819 && a2 == 0xE300000000000000;
  if (v2 || (sub_22D34B9A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1852793705 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_22D34B9A8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_22D32D534(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268568570);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22D32D73C();
  sub_22D34BA98();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    char v11 = 0;
    uint64_t v7 = sub_22D34B968();
    char v10 = 1;
    swift_bridgeObjectRetain();
    sub_22D34B968();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_22D32D73C()
{
  unint64_t result = qword_268568578;
  if (!qword_268568578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568578);
  }
  return result;
}

uint64_t sub_22D32D790(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6C6F6369746C756DLL && a2 == 0xEA0000000000726FLL;
  if (v2 || (sub_22D34B9A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6863726172656968 && a2 == 0xEC0000006C616369)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_22D34B9A8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_22D32D8A8(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685686D0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22D32EE40();
  sub_22D34BA98();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  else
  {
    char v11 = 0;
    uint64_t v7 = sub_22D34B948();
    char v10 = 1;
    sub_22D34B948();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

void *sub_22D32DA8C(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268568580);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22D32DC28();
  sub_22D34BA98();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268568590);
    sub_22D32DC7C(&qword_268568598, &qword_268568590, (void (*)(void))sub_22D32DCFC);
    sub_22D34B978();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v7 = (void *)v9[1];
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_22D32DC28()
{
  unint64_t result = qword_268568588;
  if (!qword_268568588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568588);
  }
  return result;
}

uint64_t sub_22D32DC7C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_22D32DCFC()
{
  unint64_t result = qword_2685685A0;
  if (!qword_2685685A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685685A0);
  }
  return result;
}

void *sub_22D32DD50(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685685A8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22D32DEC8();
  sub_22D34BA98();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268568540);
    sub_22D32CD44();
    sub_22D34B978();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v7 = (void *)v9[1];
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_22D32DEC8()
{
  unint64_t result = qword_2685685B0;
  if (!qword_2685685B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685685B0);
  }
  return result;
}

uint64_t sub_22D32DF1C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685685B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22D32DF7C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SymbolKey(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22D32DFD8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_22D32E040(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_22D32E0A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685685E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22D32E110(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_22D34B6B8();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22D32E154()
{
  return swift_release();
}

uint64_t sub_22D32E15C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

unint64_t sub_22D32E16C()
{
  unint64_t result = qword_268568660;
  if (!qword_268568660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568660);
  }
  return result;
}

unint64_t sub_22D32E1C0()
{
  unint64_t result = qword_268568668;
  if (!qword_268568668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568668);
  }
  return result;
}

uint64_t sub_22D32E214(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t sub_22D32E26C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_22D32E2B0(uint64_t a1)
{
  return sub_22D31D53C(a1);
}

uint64_t sub_22D32E2DC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

id sub_22D32E338(id result, uint64_t a2, char a3)
{
  if (a3 == 1) {
    return (id)swift_bridgeObjectRetain();
  }
  if (!a3) {
    return result;
  }
  return result;
}

void _s9LoadErrorOwxx(uint64_t a1)
{
}

void sub_22D32E368(void *a1, uint64_t a2, char a3)
{
  if (a3 == 1)
  {
    swift_bridgeObjectRelease();
  }
  else if (!a3)
  {
  }
}

uint64_t _s9LoadErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_22D32E338(*(id *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s9LoadErrorOwca(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_22D32E338(*(id *)a2, v4, v5);
  char v6 = *(void **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_22D32E368(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t _s9LoadErrorOwta(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_22D32E368(v4, v5, v6);
  return a1;
}

uint64_t _s9LoadErrorOwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s9LoadErrorOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_22D32E514(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_22D32E530(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *_s9LoadErrorOMa()
{
  return &_s9LoadErrorON;
}

uint64_t _s13MetadataIndexVwxx()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s13MetadataIndexVwcp(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

void *_s13MetadataIndexVwca(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s13MetadataIndexVwta(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s13MetadataIndexVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s13MetadataIndexVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s13MetadataIndexVMa()
{
  return &_s13MetadataIndexVN;
}

uint64_t sub_22D32E6C8()
{
  return 0;
}

ValueMetadata *_s19FeatureAvailabilityV10CodingKeysOMa()
{
  return &_s19FeatureAvailabilityV10CodingKeysON;
}

uint64_t _s19FeatureAvailabilityV10CodingKeysOwet_0(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *_s19FeatureAvailabilityV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x22D32E7CCLL);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *_s20LayerSetAvailabilityV10CodingKeysOMa()
{
  return &_s20LayerSetAvailabilityV10CodingKeysON;
}

ValueMetadata *_s15CodableCategoryV10CodingKeysOMa()
{
  return &_s15CodableCategoryV10CodingKeysON;
}

ValueMetadata *_s21NameAvailabilityPlistV10CodingKeysOMa()
{
  return &_s21NameAvailabilityPlistV10CodingKeysON;
}

uint64_t _s20LayerSetAvailabilityV9LayerSetsVwxx_0()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s20LayerSetAvailabilityV9LayerSetsVwcp_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *_s20LayerSetAvailabilityV9LayerSetsVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *_s20LayerSetAvailabilityV9LayerSetsVwta_0(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s20LayerSetAvailabilityV9LayerSetsVwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t _s20LayerSetAvailabilityV9LayerSetsVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *_s20LayerSetAvailabilityV9LayerSetsVMa()
{
  return &_s20LayerSetAvailabilityV9LayerSetsVN;
}

unint64_t sub_22D32EA24()
{
  unint64_t result = qword_268568670;
  if (!qword_268568670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568670);
  }
  return result;
}

unint64_t sub_22D32EA7C()
{
  unint64_t result = qword_268568678;
  if (!qword_268568678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568678);
  }
  return result;
}

unint64_t sub_22D32EAD4()
{
  unint64_t result = qword_268568680;
  if (!qword_268568680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568680);
  }
  return result;
}

unint64_t sub_22D32EB2C()
{
  unint64_t result = qword_268568688;
  if (!qword_268568688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568688);
  }
  return result;
}

unint64_t sub_22D32EB84()
{
  unint64_t result = qword_268568690;
  if (!qword_268568690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568690);
  }
  return result;
}

unint64_t sub_22D32EBDC()
{
  unint64_t result = qword_268568698;
  if (!qword_268568698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568698);
  }
  return result;
}

unint64_t sub_22D32EC34()
{
  unint64_t result = qword_2685686A0;
  if (!qword_2685686A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685686A0);
  }
  return result;
}

unint64_t sub_22D32EC8C()
{
  unint64_t result = qword_2685686A8;
  if (!qword_2685686A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685686A8);
  }
  return result;
}

unint64_t sub_22D32ECE4()
{
  unint64_t result = qword_2685686B0;
  if (!qword_2685686B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685686B0);
  }
  return result;
}

unint64_t sub_22D32ED3C()
{
  unint64_t result = qword_2685686B8;
  if (!qword_2685686B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685686B8);
  }
  return result;
}

unint64_t sub_22D32ED94()
{
  unint64_t result = qword_2685686C0;
  if (!qword_2685686C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685686C0);
  }
  return result;
}

unint64_t sub_22D32EDEC()
{
  unint64_t result = qword_2685686C8;
  if (!qword_2685686C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685686C8);
  }
  return result;
}

unint64_t sub_22D32EE40()
{
  unint64_t result = qword_2685686D8;
  if (!qword_2685686D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685686D8);
  }
  return result;
}

unint64_t sub_22D32EE94()
{
  unint64_t result = qword_2685686E8;
  if (!qword_2685686E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685686E8);
  }
  return result;
}

unint64_t sub_22D32EEE8()
{
  unint64_t result = qword_2685686F0;
  if (!qword_2685686F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685686F0);
  }
  return result;
}

unint64_t sub_22D32EF3C()
{
  unint64_t result = qword_268568708;
  if (!qword_268568708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568708);
  }
  return result;
}

uint64_t sub_22D32EF90(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_22D32EF98(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *_s13MetadataIndexV10CodingKeysOMa()
{
  return &_s13MetadataIndexV10CodingKeysON;
}

uint64_t _s15CodableCategoryV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s15CodableCategoryV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x22D32F110);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *_s20LayerSetAvailabilityV9LayerSetsV10CodingKeysOMa()
{
  return &_s20LayerSetAvailabilityV9LayerSetsV10CodingKeysON;
}

uint64_t _s13MetadataIndexV10StoreIndexVwxx()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t _s13MetadataIndexV10StoreIndexVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s13MetadataIndexV10StoreIndexVwca(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s13MetadataIndexV10StoreIndexVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s13MetadataIndexV10StoreIndexVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s13MetadataIndexV10StoreIndexVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s13MetadataIndexV10StoreIndexVMa()
{
  return &_s13MetadataIndexV10StoreIndexVN;
}

unint64_t sub_22D32F338()
{
  unint64_t result = qword_268568710;
  if (!qword_268568710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568710);
  }
  return result;
}

unint64_t sub_22D32F390()
{
  unint64_t result = qword_268568718;
  if (!qword_268568718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568718);
  }
  return result;
}

unint64_t sub_22D32F3E8()
{
  unint64_t result = qword_268568720;
  if (!qword_268568720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568720);
  }
  return result;
}

unint64_t sub_22D32F440()
{
  unint64_t result = qword_268568728;
  if (!qword_268568728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568728);
  }
  return result;
}

unint64_t sub_22D32F498()
{
  unint64_t result = qword_268568730;
  if (!qword_268568730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568730);
  }
  return result;
}

unint64_t sub_22D32F4F0()
{
  unint64_t result = qword_268568738;
  if (!qword_268568738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568738);
  }
  return result;
}

unint64_t sub_22D32F544()
{
  unint64_t result = qword_268568748;
  if (!qword_268568748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568748);
  }
  return result;
}

uint64_t _s13MetadataIndexV10StoreIndexV10CodingKeysOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s13MetadataIndexV10StoreIndexV10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x22D32F6F4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

unsigned char *sub_22D32F71C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *_s13MetadataIndexV10StoreIndexV10CodingKeysOMa()
{
  return &_s13MetadataIndexV10StoreIndexV10CodingKeysON;
}

unint64_t sub_22D32F738()
{
  unint64_t result = qword_268568750;
  if (!qword_268568750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568750);
  }
  return result;
}

unint64_t sub_22D32F790()
{
  unint64_t result = qword_268568758;
  if (!qword_268568758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568758);
  }
  return result;
}

unint64_t sub_22D32F7E8()
{
  unint64_t result = qword_268568760;
  if (!qword_268568760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568760);
  }
  return result;
}

uint64_t sub_22D32F858()
{
  return sub_22D34BA78();
}

uint64_t sub_22D32F97C(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xEA0000000000656DLL;
  uint64_t v3 = 0x6F7268636F6E6F6DLL;
  unint64_t v4 = 0xEA0000000000656DLL;
  uint64_t v5 = a1;
  uint64_t v6 = 0x6F7268636F6E6F6DLL;
  switch(v5)
  {
    case 1:
      uint64_t v6 = 0x6863726172656968;
      unint64_t v4 = 0xEC0000006C616369;
      break;
    case 2:
      uint64_t v6 = 0x6C6F6369746C756DLL;
      unint64_t v4 = 0xEA0000000000726FLL;
      break;
    case 3:
      unint64_t v4 = 0xE700000000000000;
      uint64_t v6 = 0x657474656C6170;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xEC0000006C616369;
      if (v6 == 0x6863726172656968) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      uint64_t v3 = 0x6C6F6369746C756DLL;
      unint64_t v2 = 0xEA0000000000726FLL;
      goto LABEL_9;
    case 3:
      unint64_t v2 = 0xE700000000000000;
      if (v6 == 0x657474656C6170) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v6 != v3) {
        goto LABEL_14;
      }
LABEL_12:
      if (v4 == v2) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_22D34B9A8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_22D32FB24(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xEA0000000000736CLL;
  uint64_t v3 = 0x6F626D7953204653;
  uint64_t v4 = a1;
  uint64_t v5 = 0x6F626D7953204653;
  unint64_t v6 = 0xEA0000000000736CLL;
  switch(v4)
  {
    case 1:
      unint64_t v6 = 0xE500000000000000;
      uint64_t v5 = 0x534F63616DLL;
      break;
    case 2:
      uint64_t v5 = 0x617461432063614DLL;
      unint64_t v6 = 0xEC0000007473796CLL;
      break;
    case 3:
      unint64_t v6 = 0xE300000000000000;
      uint64_t v5 = 5459817;
      break;
    case 4:
      unint64_t v6 = 0xE700000000000000;
      uint64_t v5 = 0x534F6863746177;
      break;
    case 5:
      unint64_t v6 = 0xE400000000000000;
      uint64_t v5 = 1397716596;
      break;
    case 6:
      unint64_t v6 = 0xE800000000000000;
      uint64_t v5 = 0x534F6E6F69736976;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xE500000000000000;
      if (v5 == 0x534F63616DLL) {
        goto LABEL_19;
      }
      goto LABEL_22;
    case 2:
      unint64_t v2 = 0xEC0000007473796CLL;
      if (v5 != 0x617461432063614DLL) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 3:
      unint64_t v2 = 0xE300000000000000;
      if (v5 != 5459817) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 4:
      unint64_t v2 = 0xE700000000000000;
      if (v5 != 0x534F6863746177) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 5:
      unint64_t v2 = 0xE400000000000000;
      uint64_t v3 = 1397716596;
      goto LABEL_18;
    case 6:
      unint64_t v2 = 0xE800000000000000;
      if (v5 != 0x534F6E6F69736976) {
        goto LABEL_22;
      }
      goto LABEL_19;
    default:
LABEL_18:
      if (v5 != v3) {
        goto LABEL_22;
      }
LABEL_19:
      if (v6 == v2) {
        char v7 = 1;
      }
      else {
LABEL_22:
      }
        char v7 = sub_22D34B9A8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

SFSymbols::Availability::Platform_optional __swiftcall Availability.Platform.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v2 = v1;
  unint64_t v3 = sub_22D34B938();
  result.value = swift_bridgeObjectRelease();
  char v5 = 7;
  if (v3 < 7) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

uint64_t Availability.Platform.rawValue.getter()
{
  uint64_t result = 0x6F626D7953204653;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x534F63616DLL;
      break;
    case 2:
      uint64_t result = 0x617461432063614DLL;
      break;
    case 3:
      uint64_t result = 5459817;
      break;
    case 4:
      uint64_t result = 0x534F6863746177;
      break;
    case 5:
      uint64_t result = 1397716596;
      break;
    case 6:
      uint64_t result = 0x534F6E6F69736976;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_22D32FE98(unsigned __int8 *a1, char *a2)
{
  return sub_22D32FB24(*a1, *a2);
}

SFSymbols::Availability::Platform_optional sub_22D32FEA4(Swift::String *a1)
{
  return Availability.Platform.init(rawValue:)(*a1);
}

void sub_22D32FEB0(uint64_t a1@<X8>)
{
  unint64_t v2 = 0xEA0000000000736CLL;
  uint64_t v3 = 0x6F626D7953204653;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE500000000000000;
      uint64_t v3 = 0x534F63616DLL;
      goto LABEL_3;
    case 2:
      strcpy((char *)a1, "Mac Catalyst");
      *(unsigned char *)(a1 + 13) = 0;
      *(_WORD *)(a1 + 14) = -5120;
      break;
    case 3:
      *(void *)a1 = 5459817;
      *(void *)(a1 + 8) = 0xE300000000000000;
      break;
    case 4:
      *(void *)a1 = 0x534F6863746177;
      *(void *)(a1 + 8) = 0xE700000000000000;
      break;
    case 5:
      *(void *)a1 = 1397716596;
      *(void *)(a1 + 8) = 0xE400000000000000;
      break;
    case 6:
      *(void *)a1 = 0x534F6E6F69736976;
      *(void *)(a1 + 8) = 0xE800000000000000;
      break;
    default:
LABEL_3:
      *(void *)a1 = v3;
      *(void *)(a1 + 8) = v2;
      break;
  }
}

uint64_t sub_22D32FFA4()
{
  return sub_22D32F858();
}

uint64_t sub_22D32FFB0()
{
  sub_22D34B778();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22D3300C0()
{
  return sub_22D32F858();
}

SFSymbols::Version_optional __swiftcall Availability.earliestSupportedRelease(for:)(SFSymbols::Availability::Platform a1)
{
  int v3 = *(unsigned __int8 *)a1;
  uint64_t v4 = *v2;
  uint64_t v5 = v2[1];
  uint64_t v7 = v2[2];
  uint64_t v6 = v2[3];
  uint64_t v8 = v1;
  switch(*(unsigned char *)a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      char v10 = sub_22D34B9A8();
      v9.value.major = swift_bridgeObjectRelease();
      if (v10) {
        goto LABEL_4;
      }
      uint64_t v11 = (v3 - 1);
      switch(v3)
      {
        case 2:
          swift_bridgeObjectRelease();
          goto LABEL_9;
        default:
          char v12 = sub_22D34B9A8();
          v9.value.major = swift_bridgeObjectRelease();
          if (v12)
          {
LABEL_9:
            uint64_t v28 = v4;
            uint64_t v29 = v5;
            uint64_t v30 = v7;
            uint64_t v31 = v6;
            char v27 = 3;
            return Availability.earliestSupportedRelease(for:)((SFSymbols::Availability::Platform)&v27);
          }
          if (!*(void *)(v6 + 16)) {
            goto LABEL_17;
          }
          v9.value.major = sub_22D322A5C(v4, v5, v7);
          if ((v9.value.minor & 1) == 0) {
            goto LABEL_17;
          }
          uint64_t v13 = *(void *)(*(void *)(v6 + 56) + 8 * v9.value.major);
          if (!*(void *)(v13 + 16)) {
            goto LABEL_17;
          }
          swift_bridgeObjectRetain();
          unint64_t v14 = sub_22D322AF8(v3);
          if (v15)
          {
            char v16 = (uint64_t *)(*(void *)(v13 + 56) + 24 * v14);
            uint64_t v18 = *v16;
            uint64_t v17 = v16[1];
            uint64_t v19 = v16[2];
            swift_bridgeObjectRelease();
            switch(v11)
            {
              case 0:
                v9.value.major = swift_bridgeObjectRelease();
                goto LABEL_19;
              case 1:
              case 2:
              case 3:
              case 4:
              case 5:
                char v20 = sub_22D34B9A8();
                v9.value.major = swift_bridgeObjectRelease();
                if (v20)
                {
LABEL_19:
                  BOOL v21 = v18 > 11;
                  BOOL v22 = v19 > 0;
                  if (v17) {
                    BOOL v22 = v17 > 0;
                  }
                  if (v18 == 11) {
                    BOOL v21 = v22;
                  }
                  BOOL v23 = !v21;
                  uint64_t v24 = 11;
                  if (v23)
                  {
                    uint64_t v25 = 0;
                  }
                  else
                  {
                    uint64_t v24 = v18;
                    uint64_t v25 = v17;
                  }
                  *(void *)uint64_t v8 = v24;
                  *(void *)(v8 + 8) = v25;
                  if (v23) {
                    uint64_t v26 = 0;
                  }
                  else {
                    uint64_t v26 = v19;
                  }
                  *(void *)(v8 + 16) = v26;
                  *(unsigned char *)(v8 + 24) = 0;
                }
                else
                {
                  *(void *)uint64_t v8 = v18;
                  *(void *)(v8 + 8) = v17;
                  *(void *)(v8 + 16) = v19;
                  *(unsigned char *)(v8 + 24) = 0;
                }
                break;
              default:
                JUMPOUT(0);
            }
          }
          else
          {
            v9.value.major = swift_bridgeObjectRelease();
LABEL_17:
            *(void *)uint64_t v8 = 0;
            *(void *)(v8 + 8) = 0;
            *(void *)(v8 + 16) = 0;
            *(unsigned char *)(v8 + 24) = 1;
          }
          return result;
      }
    default:
      v9.value.major = swift_bridgeObjectRelease();
LABEL_4:
      if (__OFSUB__(v4, 2018))
      {
        __break(1u);
        JUMPOUT(0x22D3304A8);
      }
      *(void *)uint64_t v8 = v4 - 2018;
      *(void *)(v8 + 8) = v5;
      *(void *)(v8 + 16) = 0;
      *(unsigned char *)(v8 + 24) = 0;
      break;
  }
  return v9;
}

unint64_t sub_22D3304F8()
{
  unint64_t result = qword_268568768;
  if (!qword_268568768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568768);
  }
  return result;
}

ValueMetadata *type metadata accessor for Availability()
{
  return &type metadata for Availability;
}

uint64_t getEnumTagSinglePayload for Availability.Platform(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for Availability.Platform(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *unint64_t result = a2 + 6;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x22D3306B8);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Availability.Platform()
{
  return &type metadata for Availability.Platform;
}

void static Version.sfSymbolsHost.getter(void *a1@<X8>)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = 4;
}

uint64_t Alias.name.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Alias.availability.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t v2 = *(void *)(v1 + 40);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 16);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v2;
  return swift_bridgeObjectRetain();
}

uint64_t destroy for Alias()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Alias(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for Alias(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for Alias(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for Alias()
{
  return &type metadata for Alias;
}

SFSymbols::SymbolProperty __swiftcall SymbolProperty.init(rawValue:)(SFSymbols::SymbolProperty rawValue)
{
  *uint64_t v1 = rawValue;
  return rawValue;
}

uint64_t SymbolProperty.rawValue.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_22D3308E4()
{
  unint64_t result = qword_268568770;
  if (!qword_268568770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568770);
  }
  return result;
}

ValueMetadata *type metadata accessor for SymbolProperty()
{
  return &type metadata for SymbolProperty;
}

uint64_t sub_22D33094C(uint64_t a1, void *a2)
{
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = sub_22D33D608(v3);
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[2];
  if (v5)
  {
    uint64_t v6 = a2[4];
    uint64_t v7 = a2[5];
    int v8 = a2 + 4;
    swift_bridgeObjectRetain();
    LOBYTE(v6) = sub_22D336AF8(v6, v7, v4);
    swift_bridgeObjectRelease();
    if ((v6 & 1) == 0 && v5 != 1)
    {
      uint64_t v10 = v4 + 56;
      uint64_t v9 = 1;
      uint64_t v26 = v5;
      do
      {
        if (*(void *)(v4 + 16))
        {
          uint64_t v11 = &v8[2 * v9];
          uint64_t v13 = *v11;
          uint64_t v12 = v11[1];
          sub_22D34BA48();
          swift_bridgeObjectRetain();
          sub_22D34B778();
          uint64_t v14 = sub_22D34BA78();
          uint64_t v15 = -1 << *(unsigned char *)(v4 + 32);
          unint64_t v16 = v14 & ~v15;
          if ((*(void *)(v10 + ((v16 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v16))
          {
            uint64_t v17 = *(void *)(v4 + 48);
            uint64_t v18 = (void *)(v17 + 16 * v16);
            BOOL v19 = *v18 == v13 && v18[1] == v12;
            if (v19 || (sub_22D34B9A8() & 1) != 0)
            {
LABEL_24:
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              return v9;
            }
            uint64_t v20 = ~v15;
            for (unint64_t i = v16 + 1; ; unint64_t i = v22 + 1)
            {
              uint64_t v22 = i & v20;
              if (((*(void *)(v10 + (((i & v20) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v20)) & 1) == 0) {
                break;
              }
              BOOL v23 = (void *)(v17 + 16 * v22);
              BOOL v24 = *v23 == v13 && v23[1] == v12;
              if (v24 || (sub_22D34B9A8() & 1) != 0) {
                goto LABEL_24;
              }
            }
          }
          swift_bridgeObjectRelease();
          uint64_t v5 = v26;
        }
        ++v9;
      }
      while (v9 != v5);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

BOOL static AccessLevel.< infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

uint64_t AccessLevel.rawValue.getter()
{
  return *v0;
}

SFSymbols::AccessLevel_optional __swiftcall AccessLevel.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 4;
  if ((unint64_t)rawValue < 4) {
    char v2 = rawValue;
  }
  *uint64_t v1 = v2;
  return (SFSymbols::AccessLevel_optional)rawValue;
}

SFSymbols::AccessLevel_optional sub_22D330B58(Swift::Int *a1)
{
  return AccessLevel.init(rawValue:)(*a1);
}

void sub_22D330B60(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_22D330B6C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

BOOL sub_22D330B80(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 >= *a1;
}

BOOL sub_22D330B94(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 >= *a2;
}

BOOL sub_22D330BA8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 < *a1;
}

SFSymbols::RenderingMode_optional __swiftcall RenderingMode.init(rawValue:)(Swift::String rawValue)
{
  char v2 = v1;
  unint64_t v3 = sub_22D34B938();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

uint64_t RenderingMode.rawValue.getter()
{
  uint64_t result = 0x6F7268636F6E6F6DLL;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6863726172656968;
      break;
    case 2:
      uint64_t result = 0x6C6F6369746C756DLL;
      break;
    case 3:
      uint64_t result = 0x657474656C6170;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_22D330CB4(unsigned __int8 *a1, char *a2)
{
  return sub_22D32F97C(*a1, *a2);
}

uint64_t sub_22D330CC0()
{
  return sub_22D34BA78();
}

uint64_t sub_22D330DA8()
{
  sub_22D34B778();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22D330E78()
{
  return sub_22D34BA78();
}

SFSymbols::RenderingMode_optional sub_22D330F5C(Swift::String *a1)
{
  return RenderingMode.init(rawValue:)(*a1);
}

void sub_22D330F68(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xEA0000000000656DLL;
  uint64_t v3 = 0x6F7268636F6E6F6DLL;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xEC0000006C616369;
      uint64_t v3 = 0x6863726172656968;
      goto LABEL_3;
    case 2:
      *a1 = 0x6C6F6369746C756DLL;
      a1[1] = 0xEA0000000000726FLL;
      break;
    case 3:
      *a1 = 0x657474656C6170;
      a1[1] = 0xE700000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t SystemSymbolCSVRow.privateScalar.getter()
{
  return *v0;
}

uint64_t SystemSymbolCSVRow.name.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SystemSymbolCSVRow.mirrorForRTL.getter()
{
  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t SystemSymbolCSVRow.locale.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SystemSymbolCSVRow.publicScalars.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SystemSymbolCSVRow.functions.getter()
{
  return swift_bridgeObjectRetain();
}

void SystemSymbolCSVRow.accessLevel.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 64);
}

uint64_t SystemSymbolCSVRow.useRestrictionText.getter()
{
  uint64_t v1 = *(void *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

void SystemSymbolCSVRow.defaultRenderingMode.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 88);
}

uint64_t SystemSymbolCSVRow.additionalColumns.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_22D3310E0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  BOOL v7 = a3[4] == a1 && a3[5] == a2;
  if (v7 || (sub_22D34B9A8() & 1) != 0) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v10 = a3 + 7;
  uint64_t v11 = 1;
  while (1)
  {
    if (v3 == v11) {
      return 0;
    }
    ++v9;
    if (*(v10 - 1) == a1 && *v10 == a2) {
      break;
    }
    char v13 = sub_22D34B9A8();
    uint64_t result = v11++;
    v10 += 2;
    if (v13) {
      return result;
    }
  }
  return v9;
}

char sub_22D3311C8@<W0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, int a7@<W6>, uint64_t a8@<X7>, uint64_t a9@<X8>, char a10, uint64_t a11, char a12, uint64_t a13, char a14, uint64_t a15, unint64_t a16, char a17, unint64_t a18, char a19, unint64_t a20,char a21)
{
  LODWORD(v138) = a7;
  uint64_t v137 = a6;
  uint64_t v144 = sub_22D34B538();
  LOBYTE(v29) = MEMORY[0x270FA5388]();
  uint64_t v139 = (char *)&v125 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 0x8000000000000000) == 0)
  {
    uint64_t v32 = *a1;
    uint64_t v33 = *(void *)(v32 + 16);
    if (v33 > a2 && (a3 & 0x8000000000000000) == 0 && v33 > a3)
    {
      uint64_t v130 = v30;
      uint64_t v133 = v21;
      uint64_t v135 = v33;
      char v34 = (uint64_t *)(v32 + 32 + 16 * a2);
      uint64_t v36 = *v34;
      uint64_t v35 = v34[1];
      uint64_t v132 = v32 + 32;
      uint64_t v37 = (unint64_t *)(v32 + 32 + 16 * a3);
      unint64_t v38 = *v37;
      unint64_t v39 = v37[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v29 = sub_22D333478(v38, v39, 0x10uLL);
      if ((v29 & 0x100000000) == 0 && (v29 & 0xFFFFF800) != 0xD800 && v29 <= 0x10FFFF)
      {
        uint64_t v128 = v35;
        uint64_t v129 = (void *)a9;
        unint64_t v126 = v29;
        uint64_t v127 = v36;
        uint64_t v131 = v32;
        uint64_t v134 = a8;
        if (a5)
        {
          unint64_t v41 = (char *)MEMORY[0x263F8EE78];
        }
        else
        {
          unint64_t v41 = (char *)MEMORY[0x263F8EE78];
          uint64_t v42 = v135;
          if ((a4 & 0x8000000000000000) != 0 || v135 <= (uint64_t)a4)
          {
LABEL_53:
            unint64_t v136 = (unint64_t)v41;
            if (v138)
            {
              uint64_t v75 = MEMORY[0x263F8EE78];
            }
            else
            {
              uint64_t v75 = MEMORY[0x263F8EE78];
              if ((v137 & 0x8000000000000000) == 0 && v42 > v137)
              {
                if (*(void *)(v32 + 16) > (unint64_t)v137)
                {
                  uint64_t v76 = (uint64_t *)(v132 + 16 * v137);
                  uint64_t v78 = *v76;
                  uint64_t v77 = v76[1];
                  uint64_t v142 = v78;
                  uint64_t v143 = v77;
                  uint64_t v140 = 44;
                  unint64_t v141 = 0xE100000000000000;
                  unint64_t v138 = sub_22D333420();
                  uint64_t v79 = sub_22D34B868();
                  int64_t v80 = *(void *)(v79 + 16);
                  if (v80)
                  {
                    uint64_t v140 = v75;
                    sub_22D33C9CC(0, v80, 0);
                    unint64_t v81 = (void (**)(char *, uint64_t))(v130 + 8);
                    uint64_t v137 = v79;
                    char v82 = (uint64_t *)(v79 + 40);
                    do
                    {
                      uint64_t v83 = *v82;
                      uint64_t v142 = *(v82 - 1);
                      uint64_t v143 = v83;
                      swift_bridgeObjectRetain();
                      uint64_t v84 = v139;
                      sub_22D34B4E8();
                      uint64_t v85 = sub_22D34B878();
                      uint64_t v87 = v86;
                      (*v81)(v84, v144);
                      swift_bridgeObjectRelease();
                      char v88 = (void *)v140;
                      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                      {
                        sub_22D33C9CC(0, v88[2] + 1, 1);
                        char v88 = (void *)v140;
                      }
                      unint64_t v90 = v88[2];
                      unint64_t v89 = v88[3];
                      if (v90 >= v89 >> 1)
                      {
                        sub_22D33C9CC((char *)(v89 > 1), v90 + 1, 1);
                        char v88 = (void *)v140;
                      }
                      v82 += 2;
                      v88[2] = v90 + 1;
                      uint64_t v91 = &v88[2 * v90];
                      v91[4] = v85;
                      v91[5] = v87;
                      --v80;
                    }
                    while (v80);
                    swift_bridgeObjectRelease();
                    a8 = v134;
                  }
                  else
                  {
                    swift_bridgeObjectRelease();
                    char v88 = (void *)MEMORY[0x263F8EE78];
                  }
                  uint64_t v94 = v88[2];
                  if (v94)
                  {
                    uint64_t v95 = v88 + 5;
                    uint64_t v75 = MEMORY[0x263F8EE78];
                    do
                    {
                      uint64_t v100 = *(v95 - 1);
                      uint64_t v99 = *v95;
                      uint64_t v101 = HIBYTE(*v95) & 0xF;
                      if ((*v95 & 0x2000000000000000) == 0) {
                        uint64_t v101 = v100 & 0xFFFFFFFFFFFFLL;
                      }
                      if (v101)
                      {
                        swift_bridgeObjectRetain();
                        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                        uint64_t v142 = v75;
                        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
                        {
                          sub_22D33C9CC(0, *(void *)(v75 + 16) + 1, 1);
                          uint64_t v75 = v142;
                        }
                        unint64_t v97 = *(void *)(v75 + 16);
                        unint64_t v96 = *(void *)(v75 + 24);
                        if (v97 >= v96 >> 1)
                        {
                          sub_22D33C9CC((char *)(v96 > 1), v97 + 1, 1);
                          uint64_t v75 = v142;
                        }
                        *(void *)(v75 + 16) = v97 + 1;
                        unint64_t v98 = v75 + 16 * v97;
                        *(void *)(v98 + 32) = v100;
                        *(void *)(v98 + 40) = v99;
                        a8 = v134;
                      }
                      v95 += 2;
                      --v94;
                    }
                    while (v94);
                  }
                  else
                  {
                    uint64_t v75 = MEMORY[0x263F8EE78];
                  }
                  LOBYTE(v29) = swift_bridgeObjectRelease();
                  uint64_t v32 = v131;
                  uint64_t v42 = v135;
                  if (a10) {
                    goto LABEL_89;
                  }
LABEL_67:
                  if (a8 < 0 || v42 <= a8) {
                    goto LABEL_89;
                  }
                  if (*(void *)(v32 + 16) > (unint64_t)a8)
                  {
                    char v92 = (unint64_t *)(v132 + 16 * a8);
                    unint64_t v29 = *v92;
                    if (*v92 == 1163219540 && v92[1] == 0xE400000000000000)
                    {
                      uint64_t v93 = 3;
                      uint64_t v42 = v135;
                      goto LABEL_96;
                    }
                    LOBYTE(v29) = sub_22D34B9A8();
                    uint64_t v42 = v135;
                    if (v29)
                    {
                      uint64_t v93 = 3;
                      goto LABEL_96;
                    }
LABEL_89:
                    if ((a12 & 1) == 0 && (a11 & 0x8000000000000000) == 0 && v42 > a11)
                    {
                      if (*(void *)(v32 + 16) <= (unint64_t)a11)
                      {
LABEL_148:
                        __break(1u);
                        return v29;
                      }
                      unint64_t v103 = (uint64_t *)(v132 + 16 * a11);
                      uint64_t v104 = *v103;
                      uint64_t v105 = v103[1];
                      if (*v103 != 0x63696C627550 || v105 != 0xE600000000000000)
                      {
                        LOBYTE(v29) = sub_22D34B9A8();
                        if (v29)
                        {
                          uint64_t v93 = 0;
                          uint64_t v42 = v135;
                          goto LABEL_96;
                        }
                        if (v104 == 0xD000000000000017 && v105 == 0x800000022D396570
                          || (LOBYTE(v29) = sub_22D34B9A8(), (v29 & 1) != 0))
                        {
                          uint64_t v93 = 1;
                          uint64_t v42 = v135;
                          goto LABEL_96;
                        }
                        if (v104 == 0x65746176697250 && v105 == 0xE700000000000000)
                        {
                          uint64_t v93 = 2;
                          uint64_t v42 = v135;
                          goto LABEL_96;
                        }
                        LOBYTE(v29) = sub_22D34B9A8();
                        uint64_t v42 = v135;
                        if (v29)
                        {
                          uint64_t v93 = 2;
                          goto LABEL_96;
                        }
                      }
                    }
                    uint64_t v93 = 0;
LABEL_96:
                    if (a14)
                    {
LABEL_104:
                      uint64_t v106 = 0;
                      unint64_t v107 = 0;
                      goto LABEL_105;
                    }
                    uint64_t v106 = 0;
                    unint64_t v107 = 0;
                    if (a13 < 0 || v42 <= a13)
                    {
LABEL_105:
                      uint64_t v110 = (void *)sub_22D3194A0(MEMORY[0x263F8EE78]);
                      uint64_t v111 = v131;
                      swift_bridgeObjectRetain();
                      uint64_t v112 = sub_22D332288(v110, a15, v111);
                      LOBYTE(v29) = swift_bridgeObjectRelease();
                      uint64_t v113 = 0;
                      if (a17)
                      {
                        unint64_t v115 = 0;
                        uint64_t v114 = v135;
                      }
                      else
                      {
                        uint64_t v114 = v135;
                        unint64_t v115 = 0;
                        if ((a16 & 0x8000000000000000) == 0 && v135 > (uint64_t)a16)
                        {
                          if (*(void *)(v131 + 16) > a16)
                          {
                            uint64_t v116 = (uint64_t *)(v132 + 16 * a16);
                            uint64_t v113 = *v116;
                            unint64_t v115 = v116[1];
                            uint64_t v117 = HIBYTE(v115) & 0xF;
                            if ((v115 & 0x2000000000000000) == 0) {
                              uint64_t v117 = v113 & 0xFFFFFFFFFFFFLL;
                            }
                            if (v117)
                            {
                              LOBYTE(v29) = swift_bridgeObjectRetain();
                            }
                            else
                            {
                              uint64_t v113 = 0;
                              unint64_t v115 = 0;
                            }
                            goto LABEL_114;
                          }
LABEL_145:
                          __break(1u);
                          goto LABEL_146;
                        }
                      }
LABEL_114:
                      uint64_t v118 = 0;
                      if ((a19 & 1) != 0 || (a18 & 0x8000000000000000) != 0 || v114 <= (uint64_t)a18)
                      {
LABEL_122:
                        if (a21)
                        {
                          uint64_t v120 = 4;
                          goto LABEL_128;
                        }
                        uint64_t v120 = 4;
                        if ((a20 & 0x8000000000000000) != 0 || v114 <= (uint64_t)a20) {
                          goto LABEL_128;
                        }
                        if (*(void *)(v131 + 16) > a20)
                        {
                          v121._countAndFlagsBits = sub_22D34B758();
                          LOBYTE(v29) = RenderingMode.init(rawValue:)(v121);
                          uint64_t v120 = v142;
LABEL_128:
                          uint64_t v122 = v129;
                          uint64_t v123 = v127;
                          *uint64_t v129 = v126;
                          v122[1] = v123;
                          v122[2] = v128;
                          v122[3] = v118;
                          v122[4] = v106;
                          v122[5] = v107;
                          v122[6] = v136;
                          v122[7] = v75;
                          v122[8] = v93;
                          v122[9] = v113;
                          v122[10] = v115;
                          v122[11] = v120;
                          v122[12] = v112;
                          return v29;
                        }
                        goto LABEL_147;
                      }
                      if (*(void *)(v131 + 16) > a18)
                      {
                        unint64_t v119 = (unint64_t *)(v132 + 16 * a18);
                        unint64_t v29 = *v119;
                        if (*v119 == 1163219540 && v119[1] == 0xE400000000000000)
                        {
                          uint64_t v118 = 1;
                        }
                        else
                        {
                          LOBYTE(v29) = sub_22D34B9A8();
                          uint64_t v114 = v135;
                          uint64_t v118 = v29 & 1;
                        }
                        goto LABEL_122;
                      }
LABEL_146:
                      __break(1u);
LABEL_147:
                      __break(1u);
                      goto LABEL_148;
                    }
                    if (*(void *)(v131 + 16) > (unint64_t)a13)
                    {
                      uint64_t v108 = (uint64_t *)(v132 + 16 * a13);
                      uint64_t v106 = *v108;
                      unint64_t v107 = v108[1];
                      uint64_t v109 = HIBYTE(v107) & 0xF;
                      if ((v107 & 0x2000000000000000) == 0) {
                        uint64_t v109 = v106 & 0xFFFFFFFFFFFFLL;
                      }
                      if (v109)
                      {
                        swift_bridgeObjectRetain();
                        goto LABEL_105;
                      }
                      goto LABEL_104;
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
            }
            if (a10) {
              goto LABEL_89;
            }
            goto LABEL_67;
          }
          if (*(void *)(v32 + 16) <= a4)
          {
            __break(1u);
            goto LABEL_142;
          }
          uint64_t v43 = (uint64_t *)(v132 + 16 * a4);
          uint64_t v45 = *v43;
          uint64_t v44 = v43[1];
          uint64_t v142 = v45;
          uint64_t v143 = v44;
          uint64_t v140 = 44;
          unint64_t v141 = 0xE100000000000000;
          unint64_t v136 = sub_22D333420();
          uint64_t v46 = sub_22D34B868();
          int64_t v47 = *(void *)(v46 + 16);
          if (v47)
          {
            uint64_t v140 = (uint64_t)v41;
            sub_22D33C9CC(0, v47, 0);
            char v48 = (void (**)(char *, uint64_t))(v130 + 8);
            uint64_t v125 = v46;
            uint64_t v49 = (uint64_t *)(v46 + 40);
            do
            {
              uint64_t v50 = *v49;
              uint64_t v142 = *(v49 - 1);
              uint64_t v143 = v50;
              swift_bridgeObjectRetain();
              char v51 = v139;
              sub_22D34B4E8();
              uint64_t v52 = sub_22D34B878();
              uint64_t v54 = v53;
              (*v48)(v51, v144);
              swift_bridgeObjectRelease();
              char v55 = (void *)v140;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              {
                sub_22D33C9CC(0, v55[2] + 1, 1);
                char v55 = (void *)v140;
              }
              unint64_t v57 = v55[2];
              unint64_t v56 = v55[3];
              if (v57 >= v56 >> 1)
              {
                sub_22D33C9CC((char *)(v56 > 1), v57 + 1, 1);
                char v55 = (void *)v140;
              }
              v49 += 2;
              v55[2] = v57 + 1;
              unint64_t v58 = &v55[2 * v57];
              v58[4] = v52;
              v58[5] = v54;
              --v47;
            }
            while (v47);
            swift_bridgeObjectRelease();
          }
          else
          {
            swift_bridgeObjectRelease();
            char v55 = (void *)MEMORY[0x263F8EE78];
          }
          uint64_t v59 = v55[2];
          if (v59)
          {
            swift_bridgeObjectRetain();
            uint64_t v60 = v55 + 5;
            uint64_t v61 = (char *)MEMORY[0x263F8EE78];
            a8 = v134;
            do
            {
              unint64_t v62 = *(v60 - 1);
              unint64_t v63 = *v60;
              swift_bridgeObjectRetain();
              unint64_t v64 = sub_22D333478(v62, v63, 0x10uLL);
              if ((v64 & 0x100000000) == 0)
              {
                int v65 = v64;
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                  uint64_t v61 = sub_22D3445B0(0, *((void *)v61 + 2) + 1, 1, v61);
                }
                unint64_t v67 = *((void *)v61 + 2);
                unint64_t v66 = *((void *)v61 + 3);
                if (v67 >= v66 >> 1) {
                  uint64_t v61 = sub_22D3445B0((char *)(v66 > 1), v67 + 1, 1, v61);
                }
                *((void *)v61 + 2) = v67 + 1;
                *(_DWORD *)&v61[4 * v67 + 32] = v65;
              }
              v60 += 2;
              --v59;
            }
            while (v59);
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v61 = (char *)MEMORY[0x263F8EE78];
            a8 = v134;
          }
          swift_bridgeObjectRelease();
          uint64_t v68 = *((void *)v61 + 2);
          if (v68)
          {
            swift_bridgeObjectRetain();
            uint64_t v69 = 0;
            unint64_t v41 = (char *)MEMORY[0x263F8EE78];
            do
            {
              unsigned int v70 = *(_DWORD *)&v61[4 * v69 + 32];
              if (v70 <= 0x10FFFF && (v70 & 0xFFFFF800) != 55296)
              {
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                  unint64_t v41 = sub_22D3444B4(0, *((void *)v41 + 2) + 1, 1, v41);
                }
                unint64_t v73 = *((void *)v41 + 2);
                unint64_t v72 = *((void *)v41 + 3);
                BOOL v74 = v41;
                if (v73 >= v72 >> 1) {
                  BOOL v74 = sub_22D3444B4((char *)(v72 > 1), v73 + 1, 1, v41);
                }
                *((void *)v74 + 2) = v73 + 1;
                unint64_t v41 = v74;
                *(_DWORD *)&v74[4 * v73 + 32] = v70;
              }
              ++v69;
            }
            while (v68 != v69);
            swift_bridgeObjectRelease();
          }
          else
          {
            unint64_t v41 = (char *)MEMORY[0x263F8EE78];
          }
          LOBYTE(v29) = swift_bridgeObjectRelease();
          uint64_t v32 = v131;
        }
        uint64_t v42 = v135;
        goto LABEL_53;
      }
      LOBYTE(v29) = swift_bridgeObjectRelease();
    }
  }
  *(void *)(a9 + 96) = 0;
  *(_OWORD *)(a9 + 64) = 0u;
  *(_OWORD *)(a9 + 80) = 0u;
  *(_OWORD *)(a9 + 32) = 0u;
  *(_OWORD *)(a9 + 48) = 0u;
  *(_OWORD *)a9 = 0u;
  *(_OWORD *)(a9 + 16) = 0u;
  return v29;
}

uint64_t sub_22D331D30(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v3 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v4 = 0;
  uint64_t v5 = result + 64;
  uint64_t v6 = 1 << *(unsigned char *)(result + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(result + 64);
  int64_t v27 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v9 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v10 = v9 | (v4 << 6);
      goto LABEL_25;
    }
    int64_t v11 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_36;
    }
    if (v11 >= v27) {
      return 1;
    }
    unint64_t v12 = *(void *)(v5 + 8 * v11);
    ++v4;
    if (!v12)
    {
      int64_t v4 = v11 + 1;
      if (v11 + 1 >= v27) {
        return 1;
      }
      unint64_t v12 = *(void *)(v5 + 8 * v4);
      if (!v12)
      {
        int64_t v4 = v11 + 2;
        if (v11 + 2 >= v27) {
          return 1;
        }
        unint64_t v12 = *(void *)(v5 + 8 * v4);
        if (!v12)
        {
          int64_t v4 = v11 + 3;
          if (v11 + 3 >= v27) {
            return 1;
          }
          unint64_t v12 = *(void *)(v5 + 8 * v4);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_24:
    unint64_t v8 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v4 << 6);
LABEL_25:
    uint64_t v14 = 16 * v10;
    uint64_t v15 = (uint64_t *)(*(void *)(v3 + 48) + v14);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    uint64_t v18 = (uint64_t *)(*(void *)(v3 + 56) + v14);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v21 = sub_22D3195C4(v16, v17);
    char v23 = v22;
    swift_bridgeObjectRelease();
    if ((v23 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
    BOOL v24 = (void *)(*(void *)(a2 + 56) + 16 * v21);
    if (*v24 == v20 && v24[1] == v19)
    {
      uint64_t result = swift_bridgeObjectRelease();
    }
    else
    {
      char v26 = sub_22D34B9A8();
      uint64_t result = swift_bridgeObjectRelease();
      if ((v26 & 1) == 0) {
        return 0;
      }
    }
  }
  int64_t v13 = v11 + 4;
  if (v13 >= v27) {
    return 1;
  }
  unint64_t v12 = *(void *)(v5 + 8 * v13);
  if (v12)
  {
    int64_t v4 = v13;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v4 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v4 >= v27) {
      return 1;
    }
    unint64_t v12 = *(void *)(v5 + 8 * v4);
    ++v13;
    if (v12) {
      goto LABEL_24;
    }
  }
LABEL_36:
  __break(1u);
  return result;
}

uint64_t _s9SFSymbols18SystemSymbolCSVRowV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a1 != *(_DWORD *)a2) {
    return 0;
  }
  int v2 = *(unsigned __int8 *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  char v22 = *(void **)(a1 + 56);
  int v21 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v20 = *(void *)(a1 + 80);
  uint64_t v14 = *(void *)(a1 + 96);
  int v6 = *(unsigned __int8 *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v10 = *(void *)(a2 + 48);
  unint64_t v9 = *(void **)(a2 + 56);
  int v11 = *(unsigned __int8 *)(a2 + 64);
  uint64_t v17 = *(void *)(a2 + 72);
  uint64_t v18 = *(void *)(a1 + 72);
  uint64_t v19 = *(void *)(a2 + 80);
  int v15 = *(unsigned __int8 *)(a2 + 88);
  int v16 = *(unsigned __int8 *)(a1 + 88);
  uint64_t v13 = *(void *)(a2 + 96);
  if (*(void *)(a1 + 8) == *(void *)(a2 + 8) && *(void *)(a1 + 16) == *(void *)(a2 + 16))
  {
    if (v2 != v6) {
      return 0;
    }
  }
  else if (sub_22D34B9A8() & 1) == 0 || ((v2 ^ v6))
  {
    return 0;
  }
  if (v3)
  {
    if (!v8 || (v4 != v7 || v3 != v8) && (sub_22D34B9A8() & 1) == 0) {
      return 0;
    }
  }
  else if (v8)
  {
    return 0;
  }
  if (!sub_22D3423B0(v5, v10) || (sub_22D342424(v22, v9) & 1) == 0 || v21 != v11) {
    return 0;
  }
  if (!v20)
  {
    if (!v19) {
      goto LABEL_25;
    }
    return 0;
  }
  if (!v19 || (v18 != v17 || v20 != v19) && (sub_22D34B9A8() & 1) == 0) {
    return 0;
  }
LABEL_25:
  if (v16 == 4)
  {
    if (v15 != 4) {
      return 0;
    }
  }
  else if (v15 == 4 || (sub_22D32F97C(v16, v15) & 1) == 0)
  {
    return 0;
  }
  return sub_22D331D30(v14, v13);
}

uint64_t sub_22D332168(uint64_t result, int64_t a2)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v4 = *(void **)v2;
  int64_t v5 = *(void *)(*(void *)v2 + 16);
  if (v5 < a2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v6 = result;
  int64_t v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t v4 = sub_22D344174(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685684F8);
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_19;
  }
  uint64_t v12 = v4[2];
  BOOL v13 = __OFSUB__(v12, a2);
  uint64_t v14 = v12 - a2;
  if (v13) {
    goto LABEL_25;
  }
  int v15 = (char *)&v4[a2 + 4];
  if (v6 != a2 || &v4[v6 + 4] >= (void *)&v15[8 * v14]) {
    uint64_t result = (uint64_t)memmove(&v4[v6 + 4], v15, 8 * v14);
  }
  uint64_t v16 = v4[2];
  BOOL v13 = __OFADD__(v16, v8);
  uint64_t v17 = v16 - v7;
  if (!v13)
  {
    v4[2] = v17;
LABEL_19:
    *(void *)uint64_t v2 = v4;
    return result;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_22D332288(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3;
  uint64_t v6 = a2 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(a2 + 64);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v40 = a3 + 32;
  swift_bridgeObjectRetain();
  int64_t v11 = 0;
  uint64_t v39 = v3;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v11 << 6);
      goto LABEL_19;
    }
    BOOL v14 = __OFADD__(v11++, 1);
    if (v14)
    {
      __break(1u);
      goto LABEL_38;
    }
    if (v11 >= v10) {
      goto LABEL_36;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v11);
    if (!v15) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v11 << 6);
LABEL_19:
    uint64_t v17 = *(void *)(*(void *)(a2 + 48) + 8 * v13);
    if ((v17 & 0x8000000000000000) == 0 && v17 < *(void *)(v3 + 16))
    {
      uint64_t v18 = (uint64_t *)(*(void *)(a2 + 56) + 16 * v13);
      uint64_t v20 = *v18;
      uint64_t v19 = v18[1];
      int v21 = (uint64_t *)(v40 + 16 * v17);
      uint64_t v22 = v21[1];
      uint64_t v42 = *v21;
      swift_bridgeObjectRetain_n();
      uint64_t v43 = v22;
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v41 = v20;
      uint64_t v44 = v19;
      unint64_t v25 = sub_22D3195C4(v20, v19);
      uint64_t v26 = a1[2];
      BOOL v27 = (v24 & 1) == 0;
      uint64_t v28 = v26 + v27;
      if (__OFADD__(v26, v27)) {
        goto LABEL_39;
      }
      char v29 = v24;
      if (a1[3] >= v28)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          sub_22D3270B8();
        }
        uint64_t v30 = v44;
        if (v29) {
          goto LABEL_34;
        }
      }
      else
      {
        sub_22D324440(v28, isUniquelyReferenced_nonNull_native);
        uint64_t v30 = v44;
        unint64_t v31 = sub_22D3195C4(v41, v44);
        if ((v29 & 1) != (v32 & 1)) {
          goto LABEL_41;
        }
        unint64_t v25 = v31;
        if (v29)
        {
LABEL_34:
          uint64_t v37 = (void *)(a1[7] + 16 * v25);
          swift_bridgeObjectRelease();
          void *v37 = v42;
          v37[1] = v43;
          goto LABEL_35;
        }
      }
      a1[(v25 >> 6) + 8] |= 1 << v25;
      uint64_t v33 = (uint64_t *)(a1[6] + 16 * v25);
      *uint64_t v33 = v41;
      v33[1] = v30;
      char v34 = (void *)(a1[7] + 16 * v25);
      void *v34 = v42;
      v34[1] = v43;
      uint64_t v35 = a1[2];
      BOOL v14 = __OFADD__(v35, 1);
      uint64_t v36 = v35 + 1;
      if (v14) {
        goto LABEL_40;
      }
      a1[2] = v36;
      swift_bridgeObjectRetain();
LABEL_35:
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      uint64_t v3 = v39;
    }
  }
  int64_t v16 = v11 + 1;
  if (v11 + 1 >= v10) {
    goto LABEL_36;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15) {
    goto LABEL_17;
  }
  int64_t v16 = v11 + 2;
  if (v11 + 2 >= v10) {
    goto LABEL_36;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15) {
    goto LABEL_17;
  }
  int64_t v16 = v11 + 3;
  if (v11 + 3 >= v10) {
    goto LABEL_36;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15) {
    goto LABEL_17;
  }
  int64_t v16 = v11 + 4;
  if (v11 + 4 >= v10)
  {
LABEL_36:
    swift_release();
    return (uint64_t)a1;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
LABEL_17:
    int64_t v11 = v16;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v11 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v11 >= v10) {
      goto LABEL_36;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v11);
    ++v16;
    if (v15) {
      goto LABEL_18;
    }
  }
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  uint64_t result = sub_22D34B9E8();
  __break(1u);
  return result;
}

uint64_t _s9SFSymbols18SystemSymbolCSVRowV6decode_22additionalColumnTitlesSayACG10Foundation4DataV_SaySSGtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_22D34B748();
  MEMORY[0x270FA5388]();
  sub_22D34B738();
  sub_22D34B728();
  if (!v4) {
    return MEMORY[0x263F8EE78];
  }
  int64_t v5 = sub_22D31BB20();
  swift_bridgeObjectRelease();
  unint64_t v107 = v5;
  if (!v5[2])
  {
LABEL_46:
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  uint64_t v6 = (void *)v5[4];
  swift_bridgeObjectRetain();
  sub_22D332168(0, 1);
  uint64_t v86 = sub_22D33094C((uint64_t)&unk_26E0A67A8, v6);
  char v8 = v7;
  swift_arrayDestroy();
  if ((v8 & 1) != 0
    || (v85 = sub_22D33094C((uint64_t)&unk_26E0A6698, v6), char v10 = v9, swift_arrayDestroy(), (v10 & 1) != 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_46;
  }
  uint64_t v84 = sub_22D3310E0(0x6E6F6974636E7546, 0xE900000000000073, v6);
  char v12 = v11;
  unint64_t v83 = sub_22D3310E0(0x7365646F63696E55, 0xE800000000000000, v6);
  char v91 = v13;
  uint64_t v82 = sub_22D3310E0(0x4C20737365636341, 0xEC0000006C657665, v6);
  char v89 = v14;
  uint64_t v81 = sub_22D3310E0(0x6E656469666E6F43, 0xEC0000006C616974, v6);
  char v87 = v15;
  uint64_t v80 = sub_22D33094C((uint64_t)&unk_26E0A66E8, v6);
  char v69 = v16;
  swift_arrayDestroy();
  unint64_t v79 = sub_22D33094C((uint64_t)&unk_26E0A6728, v6);
  char v67 = v17;
  swift_arrayDestroy();
  unint64_t v78 = sub_22D3310E0(0xD000000000000011, 0x800000022D396550, v6);
  char v65 = v18;
  unint64_t v77 = sub_22D33094C((uint64_t)&unk_26E0A6768, v6);
  char v63 = v19;
  swift_arrayDestroy();
  uint64_t v20 = (void *)sub_22D32CA04(MEMORY[0x263F8EE78]);
  uint64_t v95 = *(void *)(a3 + 16);
  if (!v95)
  {
LABEL_50:
    swift_bridgeObjectRelease();
    uint64_t v49 = v107;
    uint64_t v76 = v107[2];
    if (v76)
    {
      int v75 = v12 & 1;
      char v73 = v91 & 1;
      char v72 = v89 & 1;
      char v71 = v87 & 1;
      char v70 = v69 & 1;
      char v68 = v67 & 1;
      char v66 = v65 & 1;
      char v64 = v63 & 1;
      swift_bridgeObjectRetain();
      uint64_t v50 = 0;
      uint64_t v51 = 0;
      int64_t v47 = (char *)MEMORY[0x263F8EE78];
      unint64_t v62 = v20;
      uint64_t v61 = v107;
      do
      {
        uint64_t v106 = v49[v50 + 4];
        swift_bridgeObjectRetain();
        sub_22D3311C8(&v106, v86, v85, v83, v73, v84, v75, v81, (uint64_t)v97, v71, v82, v72, v80, v70, (uint64_t)v20, v79, v68, v77, v64,
          v78,
          v66);
        swift_bridgeObjectRelease();
        uint64_t v53 = v98;
        if (v98)
        {
          int v54 = v97[0];
          char v55 = v99;
          long long v94 = v100;
          long long v92 = v101;
          char v56 = v102;
          long long v96 = v103;
          char v58 = v104;
          uint64_t v57 = v105;
          uint64_t v90 = v51;
          uint64_t v88 = v97[1];
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            int64_t v47 = sub_22D344394(0, *((void *)v47 + 2) + 1, 1, v47);
          }
          unint64_t v60 = *((void *)v47 + 2);
          unint64_t v59 = *((void *)v47 + 3);
          if (v60 >= v59 >> 1) {
            int64_t v47 = sub_22D344394((char *)(v59 > 1), v60 + 1, 1, v47);
          }
          *((void *)v47 + 2) = v60 + 1;
          uint64_t v52 = &v47[104 * v60];
          *((_DWORD *)v52 + 8) = v54;
          *((void *)v52 + 5) = v88;
          *((void *)v52 + 6) = v53;
          v52[56] = v55 & 1;
          *((_OWORD *)v52 + 4) = v94;
          *((_OWORD *)v52 + 5) = v92;
          v52[96] = v56;
          *(_OWORD *)(v52 + 104) = v96;
          v52[120] = v58;
          *((void *)v52 + 16) = v57;
          uint64_t v20 = v62;
          uint64_t v49 = v61;
          uint64_t v51 = v90;
        }
        ++v50;
      }
      while (v76 != v50);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      int64_t v47 = (char *)MEMORY[0x263F8EE78];
    }
    swift_bridgeObjectRelease();
    return (uint64_t)v47;
  }
  char v74 = v12;
  uint64_t v93 = a3 + 32;
  uint64_t v21 = v6[2];
  swift_bridgeObjectRetain();
  uint64_t v22 = 0;
  while (1)
  {
    if (!v21) {
      goto LABEL_9;
    }
    unint64_t v24 = v6[2];
    if (!v24) {
      break;
    }
    unint64_t v25 = (uint64_t *)(v93 + 16 * v22);
    uint64_t v27 = *v25;
    uint64_t v26 = v25[1];
    BOOL v28 = v6[4] == *v25 && v6[5] == v26;
    if (v28 || (sub_22D34B9A8() & 1) != 0)
    {
      uint64_t v29 = 0;
    }
    else
    {
      if (v21 == 1) {
        goto LABEL_9;
      }
      if (v24 < 2) {
        goto LABEL_66;
      }
      if ((v6[6] != v27 || v6[7] != v26) && (sub_22D34B9A8() & 1) == 0)
      {
        uint64_t v44 = v6 + 9;
        uint64_t v45 = 2;
        while (v21 != v45)
        {
          if (v24 == v45) {
            goto LABEL_65;
          }
          if (*(v44 - 1) == v27 && *v44 == v26)
          {
            uint64_t v29 = v45;
            goto LABEL_18;
          }
          uint64_t v29 = v45++;
          v44 += 2;
          if (sub_22D34B9A8()) {
            goto LABEL_18;
          }
        }
        goto LABEL_9;
      }
      uint64_t v29 = 1;
    }
LABEL_18:
    swift_bridgeObjectRetain_n();
    uint64_t v30 = v20;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v97[0] = v30;
    unint64_t v33 = sub_22D3229A8(v29);
    uint64_t v34 = v30[2];
    BOOL v35 = (v32 & 1) == 0;
    uint64_t v36 = v34 + v35;
    if (__OFADD__(v34, v35)) {
      goto LABEL_63;
    }
    char v37 = v32;
    if (v30[3] >= v36)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        uint64_t v20 = (void *)v97[0];
        if ((v32 & 1) == 0) {
          goto LABEL_25;
        }
      }
      else
      {
        sub_22D327790();
        uint64_t v20 = (void *)v97[0];
        if ((v37 & 1) == 0) {
          goto LABEL_25;
        }
      }
    }
    else
    {
      sub_22D3250C0(v36, isUniquelyReferenced_nonNull_native);
      unint64_t v38 = sub_22D3229A8(v29);
      if ((v37 & 1) != (v39 & 1)) {
        goto LABEL_67;
      }
      unint64_t v33 = v38;
      uint64_t v20 = (void *)v97[0];
      if ((v37 & 1) == 0)
      {
LABEL_25:
        v20[(v33 >> 6) + 8] |= 1 << v33;
        *(void *)(v20[6] + 8 * v33) = v29;
        uint64_t v40 = (void *)(v20[7] + 16 * v33);
        *uint64_t v40 = v27;
        v40[1] = v26;
        uint64_t v41 = v20[2];
        BOOL v42 = __OFADD__(v41, 1);
        uint64_t v43 = v41 + 1;
        if (v42) {
          goto LABEL_64;
        }
        v20[2] = v43;
        goto LABEL_8;
      }
    }
    char v23 = (void *)(v20[7] + 16 * v33);
    swift_bridgeObjectRelease();
    *char v23 = v27;
    v23[1] = v26;
LABEL_8:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_9:
    if (++v22 == v95)
    {
      swift_bridgeObjectRelease();
      char v12 = v74;
      goto LABEL_50;
    }
  }
  __break(1u);
LABEL_63:
  __break(1u);
LABEL_64:
  __break(1u);
LABEL_65:
  __break(1u);
LABEL_66:
  __break(1u);
LABEL_67:
  uint64_t result = sub_22D34B9E8();
  __break(1u);
  return result;
}

unint64_t sub_22D332E48()
{
  unint64_t result = qword_268568778;
  if (!qword_268568778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568778);
  }
  return result;
}

unint64_t sub_22D332EA0()
{
  unint64_t result = qword_268568780;
  if (!qword_268568780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568780);
  }
  return result;
}

ValueMetadata *type metadata accessor for AccessLevel()
{
  return &type metadata for AccessLevel;
}

uint64_t _s9SFSymbols11AccessLevelOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s9SFSymbols11AccessLevelOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x22D333068);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RenderingMode()
{
  return &type metadata for RenderingMode;
}

uint64_t destroy for SystemSymbolCSVRow()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SystemSymbolCSVRow(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v6 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v6;
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SystemSymbolCSVRow(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy104_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for SystemSymbolCSVRow(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v5 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SystemSymbolCSVRow(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 104)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SystemSymbolCSVRow(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 104) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 104) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SystemSymbolCSVRow()
{
  return &type metadata for SystemSymbolCSVRow;
}

unint64_t sub_22D333420()
{
  unint64_t result = qword_268568788;
  if (!qword_268568788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568788);
  }
  return result;
}

unint64_t sub_22D333478(unint64_t result, unint64_t a2, unint64_t a3)
{
  if (a3 - 37 < 0xFFFFFFFFFFFFFFDDLL)
  {
    __break(1u);
LABEL_76:
    swift_bridgeObjectRelease();
    uint64_t v13 = 0;
    LOBYTE(v12) = 1;
LABEL_14:
    LOBYTE(v42[0]) = v12;
    return v13 | ((unint64_t)v12 << 32);
  }
  uint64_t v4 = HIBYTE(a2) & 0xF;
  uint64_t v5 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v6) {
    goto LABEL_76;
  }
  if ((a2 & 0x1000000000000000) != 0)
  {
    unint64_t v10 = sub_22D344E8C(result, a2, a3);
    swift_bridgeObjectRelease();
    uint64_t v12 = HIDWORD(v10) & 1;
LABEL_12:
    uint64_t v13 = v10;
    if (v12) {
      uint64_t v13 = 0;
    }
    goto LABEL_14;
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0) {
      int v8 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      int v8 = (unsigned __int8 *)sub_22D34B8E8();
    }
    char v9 = sub_22D344C10(v8, v5, a3);
    LODWORD(v10) = v9;
    char v43 = BYTE4(v9) & 1;
    char v11 = BYTE4(v9) & 1;
    goto LABEL_11;
  }
  v42[0] = result;
  v42[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (result == 43)
  {
    if (v4)
    {
      uint64_t v25 = v4 - 1;
      if (v25)
      {
        unsigned int v15 = 0;
        unsigned __int8 v26 = a3 + 48;
        unsigned __int8 v27 = a3 + 55;
        unsigned __int8 v28 = a3 + 87;
        if (a3 > 0xA)
        {
          unsigned __int8 v26 = 58;
        }
        else
        {
          unsigned __int8 v28 = 97;
          unsigned __int8 v27 = 65;
        }
        uint64_t v29 = (unsigned __int8 *)v42 + 1;
        char v11 = 1;
        do
        {
          unsigned int v30 = *v29;
          if (v30 < 0x30 || v30 >= v26)
          {
            if (v30 < 0x41 || v30 >= v27)
            {
              LODWORD(v10) = 0;
              if (v30 < 0x61 || v30 >= v28) {
                goto LABEL_11;
              }
              char v31 = -87;
            }
            else
            {
              char v31 = -55;
            }
          }
          else
          {
            char v31 = -48;
          }
          unint64_t v32 = v15 * (unint64_t)a3;
          if ((v32 & 0xFFFFFFFF00000000) != 0) {
            goto LABEL_74;
          }
          unsigned __int8 v33 = v30 + v31;
          BOOL v24 = __CFADD__(v32, v33);
          unsigned int v15 = v32 + v33;
          if (v24) {
            goto LABEL_74;
          }
          ++v29;
          --v25;
        }
        while (v25);
LABEL_73:
        char v11 = 0;
        LODWORD(v10) = v15;
        goto LABEL_11;
      }
      goto LABEL_74;
    }
  }
  else
  {
    if (result != 45)
    {
      if (v4)
      {
        unsigned int v15 = 0;
        unsigned __int8 v34 = a3 + 48;
        unsigned __int8 v35 = a3 + 55;
        unsigned __int8 v36 = a3 + 87;
        if (a3 > 0xA)
        {
          unsigned __int8 v34 = 58;
        }
        else
        {
          unsigned __int8 v36 = 97;
          unsigned __int8 v35 = 65;
        }
        char v37 = (unsigned __int8 *)v42;
        char v11 = 1;
        while (1)
        {
          unsigned int v38 = *v37;
          if (v38 < 0x30 || v38 >= v34)
          {
            if (v38 < 0x41 || v38 >= v35)
            {
              LODWORD(v10) = 0;
              if (v38 < 0x61 || v38 >= v36) {
                goto LABEL_11;
              }
              char v39 = -87;
            }
            else
            {
              char v39 = -55;
            }
          }
          else
          {
            char v39 = -48;
          }
          unint64_t v40 = v15 * (unint64_t)a3;
          if ((v40 & 0xFFFFFFFF00000000) != 0) {
            goto LABEL_74;
          }
          unsigned __int8 v41 = v38 + v39;
          BOOL v24 = __CFADD__(v40, v41);
          unsigned int v15 = v40 + v41;
          if (v24) {
            goto LABEL_74;
          }
          ++v37;
          if (!--v4) {
            goto LABEL_73;
          }
        }
      }
      goto LABEL_74;
    }
    if (v4)
    {
      uint64_t v14 = v4 - 1;
      if (v14)
      {
        unsigned int v15 = 0;
        unsigned __int8 v16 = a3 + 48;
        unsigned __int8 v17 = a3 + 55;
        unsigned __int8 v18 = a3 + 87;
        if (a3 > 0xA)
        {
          unsigned __int8 v16 = 58;
        }
        else
        {
          unsigned __int8 v18 = 97;
          unsigned __int8 v17 = 65;
        }
        char v19 = (unsigned __int8 *)v42 + 1;
        char v11 = 1;
        while (1)
        {
          unsigned int v20 = *v19;
          if (v20 < 0x30 || v20 >= v16)
          {
            if (v20 < 0x41 || v20 >= v17)
            {
              LODWORD(v10) = 0;
              if (v20 < 0x61 || v20 >= v18) {
                goto LABEL_11;
              }
              char v21 = -87;
            }
            else
            {
              char v21 = -55;
            }
          }
          else
          {
            char v21 = -48;
          }
          unint64_t v22 = v15 * (unint64_t)a3;
          if ((v22 & 0xFFFFFFFF00000000) != 0) {
            break;
          }
          unsigned __int8 v23 = v20 + v21;
          BOOL v24 = v22 >= v23;
          unsigned int v15 = v22 - v23;
          if (!v24) {
            break;
          }
          ++v19;
          if (!--v14) {
            goto LABEL_73;
          }
        }
      }
LABEL_74:
      LODWORD(v10) = 0;
      char v11 = 1;
LABEL_11:
      swift_bridgeObjectRelease();
      LODWORD(v12) = v11 & 1;
      goto LABEL_12;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_22D3337B8()
{
  uint64_t v0 = sub_22D34B538();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  BOOL v7 = (char *)&v10 - v6;
  __swift_allocate_value_buffer(v5, qword_26856ADE8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26856ADE8);
  sub_22D34B518();
  sub_22D34B508();
  sub_22D34B528();
  int v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  return ((uint64_t (*)(char *, uint64_t))v8)(v7, v0);
}

uint64_t sub_22D3338E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v168 = a4;
  uint64_t v170 = type metadata accessor for CustomSymbol();
  MEMORY[0x270FA5388](v170);
  uint64_t v169 = (uint64_t)&v159 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v166 = 0;
  uint64_t v8 = type metadata accessor for SymbolMetadata.Backing(0);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  char v11 = (char *)&v159 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  v171 = (char *)&v159 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  unsigned __int8 v17 = (char *)&v159 - v16;
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  unsigned int v20 = (char *)&v159 - v19;
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  unsigned __int8 v23 = (char *)&v159 - v22;
  MEMORY[0x270FA5388](v21);
  unsigned __int8 v26 = (char *)&v159 - v24;
  uint64_t v172 = a2;
  if (!*(void *)(a2 + 16) && !*(void *)(a3 + 16)) {
    return 0;
  }
  uint64_t v163 = v25;
  sub_22D334D70(a1, (uint64_t)&v159 - v24);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v173 = v8;
  uint64_t v164 = v11;
  uint64_t v28 = a1;
  uint64_t v167 = v17;
  if (EnumCaseMultiPayload == 1)
  {
    sub_22D334FC0((uint64_t)v26, type metadata accessor for SymbolMetadata.Backing);
    uint64_t v29 = a3;
  }
  else
  {
    LODWORD(v162) = *(_DWORD *)v26;
    uint64_t v165 = a1;
    uint64_t v161 = *((void *)v26 + 10);
    long long v30 = *(_OWORD *)(v26 + 216);
    v179[0] = *(_OWORD *)(v26 + 200);
    v179[1] = v30;
    long long v31 = *(_OWORD *)(v26 + 248);
    v179[2] = *(_OWORD *)(v26 + 232);
    v179[3] = v31;
    long long v32 = *(_OWORD *)(v26 + 152);
    long long v176 = *(_OWORD *)(v26 + 136);
    long long v177 = v32;
    long long v33 = *(_OWORD *)(v26 + 184);
    v178[0] = *(_OWORD *)(v26 + 168);
    v178[1] = v33;
    long long v34 = *(_OWORD *)(v26 + 120);
    long long v174 = *(_OWORD *)(v26 + 104);
    long long v175 = v34;
    sub_22D335738(&v174);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v28 = v165;
    swift_bridgeObjectRelease();
    uint64_t v29 = a3;
    if (sub_22D336C30(v162, a3)) {
      return 80;
    }
  }
  sub_22D334D70(v28, (uint64_t)v23);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_bridgeObjectRetain();
    sub_22D334FC0((uint64_t)v23, type metadata accessor for SymbolMetadata.Backing);
    uint64_t v35 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v35 = *((void *)v23 + 6);
    unint64_t v162 = *((void *)v23 + 5);
    long long v36 = *(_OWORD *)(v23 + 216);
    v179[0] = *(_OWORD *)(v23 + 200);
    v179[1] = v36;
    long long v37 = *(_OWORD *)(v23 + 248);
    v179[2] = *(_OWORD *)(v23 + 232);
    v179[3] = v37;
    long long v38 = *(_OWORD *)(v23 + 152);
    long long v176 = *(_OWORD *)(v23 + 136);
    long long v177 = v38;
    long long v39 = *(_OWORD *)(v23 + 184);
    v178[0] = *(_OWORD *)(v23 + 168);
    v178[1] = v39;
    long long v40 = *(_OWORD *)(v23 + 120);
    long long v174 = *(_OWORD *)(v23 + 104);
    long long v175 = v40;
    swift_bridgeObjectRetain();
    sub_22D335738(&v174);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v29 = a3;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v41 = sub_22D334DD4(v35, v29);
  swift_bridgeObjectRelease();
  uint64_t v42 = *(void *)(v41 + 16);
  swift_release();
  if (v42) {
    return 80;
  }
  sub_22D334D70(v28, (uint64_t)v20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v44 = v169;
    sub_22D334F5C((uint64_t)v20, v169);
    uint64_t v45 = (uint64_t *)(v44 + *(int *)(v170 + 20));
    uint64_t v47 = *v45;
    uint64_t v46 = v45[1];
    swift_bridgeObjectRetain();
    sub_22D334FC0(v44, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
  }
  else
  {
    uint64_t v47 = *((void *)v20 + 1);
    uint64_t v46 = *((void *)v20 + 2);
    long long v48 = *(_OWORD *)(v20 + 216);
    v179[0] = *(_OWORD *)(v20 + 200);
    v179[1] = v48;
    long long v49 = *(_OWORD *)(v20 + 248);
    v179[2] = *(_OWORD *)(v20 + 232);
    v179[3] = v49;
    long long v50 = *(_OWORD *)(v20 + 152);
    long long v176 = *(_OWORD *)(v20 + 136);
    long long v177 = v50;
    long long v51 = *(_OWORD *)(v20 + 184);
    v178[0] = *(_OWORD *)(v20 + 168);
    v178[1] = v51;
    long long v52 = *(_OWORD *)(v20 + 120);
    long long v174 = *(_OWORD *)(v20 + 104);
    long long v175 = v52;
    sub_22D335738(&v174);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  *(void *)&long long v174 = v47;
  *((void *)&v174 + 1) = v46;
  *(void *)&v182[0] = 46;
  *((void *)&v182[0] + 1) = 0xE100000000000000;
  unint64_t v162 = sub_22D333420();
  uint64_t v53 = sub_22D34B868();
  swift_bridgeObjectRelease();
  *(void *)&v182[0] = 46;
  *((void *)&v182[0] + 1) = 0xE100000000000000;
  uint64_t v54 = (uint64_t)v167;
  sub_22D334D70(v28, (uint64_t)v167);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v55 = v169;
    sub_22D334F5C(v54, v169);
    swift_bridgeObjectRetain();
    sub_22D334FC0(v55, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
  }
  else
  {
    long long v56 = *(_OWORD *)(v54 + 216);
    v179[0] = *(_OWORD *)(v54 + 200);
    v179[1] = v56;
    long long v57 = *(_OWORD *)(v54 + 248);
    v179[2] = *(_OWORD *)(v54 + 232);
    v179[3] = v57;
    long long v58 = *(_OWORD *)(v54 + 152);
    long long v176 = *(_OWORD *)(v54 + 136);
    long long v177 = v58;
    long long v59 = *(_OWORD *)(v54 + 184);
    v178[0] = *(_OWORD *)(v54 + 168);
    v178[1] = v59;
    long long v60 = *(_OWORD *)(v54 + 120);
    long long v174 = *(_OWORD *)(v54 + 104);
    long long v175 = v60;
    sub_22D335738(&v174);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_22D34B788();
  swift_bridgeObjectRelease();
  sub_22D34B788();
  long long v61 = v182[0];
  *(void *)&long long v174 = 46;
  *((void *)&v174 + 1) = 0xE100000000000000;
  *(void *)&v182[0] = v168;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685684F8);
  sub_22D335020();
  sub_22D34B6E8();
  swift_bridgeObjectRelease();
  sub_22D34B788();
  swift_bridgeObjectRelease();
  sub_22D34B788();
  if (v174 == v61)
  {
    uint64_t v43 = 1000;
LABEL_20:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  char v62 = sub_22D34B9A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v62)
  {
    uint64_t v43 = 1000;
LABEL_23:
    swift_bridgeObjectRelease();
    return v43;
  }
  uint64_t v64 = swift_bridgeObjectRetain();
  uint64_t v65 = sub_22D33D608(v64);
  swift_bridgeObjectRelease();
  uint64_t v66 = v172;
  char v67 = sub_22D33507C(v65, v172);
  swift_bridgeObjectRelease();
  uint64_t v167 = (char *)v53;
  if (v67)
  {
    uint64_t v68 = *(void *)(v66 + 16);
    uint64_t v69 = *(void *)(v53 + 16);
    if (v69)
    {
      uint64_t v173 = *(void *)(v66 + 16);
      unint64_t v70 = 0;
      uint64_t v71 = v53 + 32;
      uint64_t v72 = v66 + 56;
      float v73 = 0.0;
      float v74 = 20.0;
      do
      {
        if (v70 >= *(void *)(v53 + 16))
        {
          __break(1u);
LABEL_118:
          __break(1u);
          goto LABEL_119;
        }
        if (*(void *)(v66 + 16))
        {
          int v75 = (uint64_t *)(v71 + 16 * v70);
          uint64_t v77 = *v75;
          uint64_t v76 = v75[1];
          sub_22D34BA48();
          swift_bridgeObjectRetain();
          sub_22D34B778();
          uint64_t v78 = sub_22D34BA78();
          uint64_t v79 = v66;
          uint64_t v80 = -1 << *(unsigned char *)(v66 + 32);
          unint64_t v81 = v78 & ~v80;
          if ((*(void *)(v72 + ((v81 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v81))
          {
            uint64_t v82 = *(void *)(v79 + 48);
            unint64_t v83 = (void *)(v82 + 16 * v81);
            BOOL v84 = *v83 == v77 && v83[1] == v76;
            if (v84 || (sub_22D34B9A8() & 1) != 0)
            {
LABEL_38:
              swift_bridgeObjectRelease();
              float v73 = v74 + v73;
            }
            else
            {
              uint64_t v85 = ~v80;
              while (1)
              {
                unint64_t v81 = (v81 + 1) & v85;
                if (((*(void *)(v72 + ((v81 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v81) & 1) == 0) {
                  break;
                }
                uint64_t v86 = (void *)(v82 + 16 * v81);
                BOOL v87 = *v86 == v77 && v86[1] == v76;
                if (v87 || (sub_22D34B9A8() & 1) != 0) {
                  goto LABEL_38;
                }
              }
              swift_bridgeObjectRelease();
            }
            uint64_t v53 = (uint64_t)v167;
            uint64_t v66 = v172;
          }
          else
          {
            swift_bridgeObjectRelease();
            uint64_t v53 = (uint64_t)v167;
            uint64_t v66 = v79;
          }
        }
        ++v70;
        float v74 = v74 * 0.9;
      }
      while (v70 != v69);
      swift_bridgeObjectRelease();
      uint64_t v68 = v173;
    }
    else
    {
      swift_bridgeObjectRelease();
      float v73 = 0.0;
    }
    float v109 = roundf((float)((float)v68 / (float)v69) * v73);
    if ((~LODWORD(v109) & 0x7F800000) == 0) {
      goto LABEL_120;
    }
    if (v109 <= -9.2234e18)
    {
LABEL_121:
      __break(1u);
    }
    else if (v109 < 9.2234e18)
    {
      uint64_t v43 = (uint64_t)v109 + 800;
      if (!__OFADD__((uint64_t)v109, 800)) {
        return v43;
      }
      __break(1u);
      goto LABEL_63;
    }
    __break(1u);
    goto LABEL_123;
  }
  uint64_t v88 = v163;
  sub_22D334D70(v28, v163);
  int v89 = swift_getEnumCaseMultiPayload();
  uint64_t v165 = v28;
  if (v89 == 1)
  {
    sub_22D334FC0(v88, type metadata accessor for SymbolMetadata.Backing);
LABEL_65:
    uint64_t v108 = MEMORY[0x263F8EE78];
LABEL_66:
    uint64_t v163 = *(void *)(v108 + 16);
    if (!v163)
    {
LABEL_76:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v120 = v165;
      uint64_t v121 = SymbolMetadata.tags.getter();
      uint64_t v122 = sub_22D334A94(v121);
      swift_bridgeObjectRelease();
      uint64_t v180 = MEMORY[0x263F8EE88];
      uint64_t v123 = *((void *)v122 + 2);
      if (v123)
      {
        swift_bridgeObjectRetain();
        uint64_t v124 = (uint64_t *)(v122 + 40);
        do
        {
          uint64_t v125 = *(v124 - 1);
          uint64_t v126 = *v124;
          swift_bridgeObjectRetain_n();
          sub_22D327CB4((uint64_t *)&v174, v125, v126);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v124 += 2;
          --v123;
        }
        while (v123);
        swift_bridgeObjectRelease_n();
        uint64_t v127 = (char *)v180;
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v127 = (char *)MEMORY[0x263F8EE88];
      }
      uint64_t v43 = *(void *)(v168 + 16);
      uint64_t v131 = v171;
      if (v43)
      {
        uint64_t v166 = v168 + 32;
        unint64_t v159 = (long long *)(v164 + 104);
        uint64_t v160 = (long long *)(v171 + 104);
        swift_bridgeObjectRetain_n();
        uint64_t v132 = 0;
        uint64_t v167 = v127;
        while (1)
        {
          uint64_t v133 = (uint64_t *)(v166 + 16 * v132);
          uint64_t v134 = v133[1];
          uint64_t v172 = *v133;
          sub_22D334D70(v120, (uint64_t)v131);
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            uint64_t v135 = v169;
            sub_22D334F5C((uint64_t)v131, v169);
            unint64_t v136 = (uint64_t *)(v135 + *(int *)(v170 + 20));
            uint64_t v138 = *v136;
            uint64_t v137 = v136[1];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            sub_22D334FC0(v135, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
          }
          else
          {
            uint64_t v138 = v131[1];
            uint64_t v137 = v131[2];
            uint64_t v161 = v131[5];
            uint64_t v163 = *((void *)v171 + 10);
            long long v139 = v160[7];
            v179[0] = v160[6];
            v179[1] = v139;
            long long v140 = v160[9];
            v179[2] = v160[8];
            v179[3] = v140;
            long long v141 = v160[3];
            long long v176 = v160[2];
            long long v177 = v141;
            long long v142 = v160[5];
            v178[0] = v160[4];
            v178[1] = v142;
            long long v143 = v160[1];
            long long v174 = *v160;
            long long v175 = v143;
            swift_bridgeObjectRetain();
            sub_22D335738(&v174);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v131 = v171;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
          *(void *)&long long v174 = v138;
          *((void *)&v174 + 1) = v137;
          uint64_t v144 = v172;
          uint64_t v180 = v172;
          unint64_t v181 = v134;
          char v145 = sub_22D34B888();
          swift_bridgeObjectRelease();
          if (v145 & 1) != 0 || (sub_22D336AF8(v144, v134, (uint64_t)v167))
          {
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v146 = (uint64_t)v164;
            sub_22D334D70(v120, (uint64_t)v164);
            if (swift_getEnumCaseMultiPayload() == 1)
            {
              sub_22D334FC0(v146, type metadata accessor for SymbolMetadata.Backing);
              uint64_t v147 = (void *)MEMORY[0x263F8EE78];
            }
            else
            {
              uint64_t v147 = *(void **)(v146 + 56);
              long long v148 = v159[7];
              v179[0] = v159[6];
              v179[1] = v148;
              long long v149 = v159[9];
              v179[2] = v159[8];
              v179[3] = v149;
              long long v150 = v159[3];
              long long v176 = v159[2];
              long long v177 = v150;
              long long v151 = v159[5];
              v178[0] = v159[4];
              v178[1] = v151;
              long long v152 = v159[1];
              long long v174 = *v159;
              long long v175 = v152;
              sub_22D335738(&v174);
              swift_bridgeObjectRelease();
              uint64_t v131 = v171;
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v120 = v165;
              swift_bridgeObjectRelease();
            }
            uint64_t v153 = v147[2];
            if (!v153) {
              goto LABEL_112;
            }
            if ((v147[4] != v172 || v147[5] != v134) && (sub_22D34B9A8() & 1) == 0)
            {
              if (v153 == 1)
              {
LABEL_112:
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                uint64_t v43 = 0;
                goto LABEL_20;
              }
              uint64_t v154 = v120;
              unint64_t v155 = v147 + 7;
              uint64_t v156 = 1;
              while (1)
              {
                uint64_t v157 = v156 + 1;
                if (__OFADD__(v156, 1)) {
                  break;
                }
                BOOL v158 = *(v155 - 1) == v172 && *v155 == v134;
                if (v158 || (sub_22D34B9A8() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  uint64_t v120 = v154;
                  uint64_t v131 = v171;
                  goto LABEL_89;
                }
                v155 += 2;
                ++v156;
                if (v157 == v153) {
                  goto LABEL_112;
                }
              }
LABEL_119:
              __break(1u);
LABEL_120:
              __break(1u);
              goto LABEL_121;
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
LABEL_89:
          if (++v132 == v43) {
            goto LABEL_20;
          }
        }
      }
      goto LABEL_23;
    }
    unint64_t v110 = 0;
    uint64_t v161 = v108 + 32;
    while (1)
    {
      if (v110 >= *(void *)(v108 + 16)) {
        goto LABEL_118;
      }
      uint64_t v111 = *(void *)(v161 + 48 * v110 + 8);
      *(void *)&long long v174 = *(void *)(v161 + 48 * v110);
      *((void *)&v174 + 1) = v111;
      uint64_t v180 = 46;
      unint64_t v181 = 0xE100000000000000;
      uint64_t v112 = sub_22D34B868();
      uint64_t v113 = (char *)sub_22D34B818();
      uint64_t v180 = (uint64_t)v113;
      uint64_t v114 = *(void *)(v112 + 16);
      if (v114)
      {
        unint64_t v115 = (uint64_t *)(v112 + 40);
        do
        {
          uint64_t v116 = *(v115 - 1);
          uint64_t v117 = *v115;
          swift_bridgeObjectRetain();
          sub_22D327CB4((uint64_t *)&v174, v116, v117);
          swift_bridgeObjectRelease();
          v115 += 2;
          --v114;
        }
        while (v114);
        swift_bridgeObjectRelease();
        uint64_t v118 = (char *)v180;
      }
      else
      {
        uint64_t v118 = v113;
        swift_bridgeObjectRelease();
      }
      char v119 = sub_22D33507C((uint64_t)v118, v172);
      swift_bridgeObjectRelease();
      if (v119) {
        break;
      }
      if (++v110 == v163) {
        goto LABEL_76;
      }
    }
    swift_bridgeObjectRelease();
    float v128 = (float)*(uint64_t *)(v172 + 16);
    uint64_t v129 = *((void *)v167 + 2);
    swift_bridgeObjectRelease();
    float v130 = roundf((float)(v128 / (float)v129) * 100.0);
    if ((~LODWORD(v130) & 0x7F800000) != 0)
    {
      if (v130 > -9.2234e18)
      {
        if (v130 < 9.2234e18)
        {
          uint64_t v43 = (uint64_t)v130 + 700;
          if (!__OFADD__((uint64_t)v130, 700)) {
            return v43;
          }
          goto LABEL_126;
        }
LABEL_125:
        __break(1u);
LABEL_126:
        __break(1u);
        goto LABEL_127;
      }
LABEL_124:
      __break(1u);
      goto LABEL_125;
    }
LABEL_123:
    __break(1u);
    goto LABEL_124;
  }
  int v90 = *(_DWORD *)v88;
  uint64_t v92 = *(void *)(v88 + 8);
  uint64_t v91 = *(void *)(v88 + 16);
  char v93 = *(unsigned char *)(v88 + 24);
  char v94 = *(unsigned char *)(v88 + 64);
  char v95 = *(unsigned char *)(v88 + 88);
  uint64_t v96 = *(void *)(v88 + 96);
  long long v97 = *(_OWORD *)(v88 + 216);
  long long v184 = *(_OWORD *)(v88 + 200);
  long long v185 = v97;
  long long v98 = *(_OWORD *)(v88 + 248);
  long long v186 = *(_OWORD *)(v88 + 232);
  long long v187 = v98;
  long long v99 = *(_OWORD *)(v88 + 152);
  v182[2] = *(_OWORD *)(v88 + 136);
  v182[3] = v99;
  long long v100 = *(_OWORD *)(v88 + 184);
  v182[4] = *(_OWORD *)(v88 + 168);
  long long v183 = v100;
  long long v101 = *(_OWORD *)(v88 + 120);
  v182[0] = *(_OWORD *)(v88 + 104);
  v182[1] = v101;
  *(_OWORD *)((char *)&v179[6] + 8) = *(_OWORD *)(v88 + 200);
  *(_OWORD *)((char *)&v179[7] + 8) = *(_OWORD *)(v88 + 216);
  *(_OWORD *)((char *)&v179[8] + 8) = *(_OWORD *)(v88 + 232);
  *(_OWORD *)((char *)&v179[9] + 8) = *(_OWORD *)(v88 + 248);
  *(_OWORD *)((char *)&v179[2] + 8) = *(_OWORD *)(v88 + 136);
  *(_OWORD *)((char *)&v179[3] + 8) = *(_OWORD *)(v88 + 152);
  *(_OWORD *)((char *)&v179[4] + 8) = *(_OWORD *)(v88 + 168);
  *(_OWORD *)((char *)&v179[5] + 8) = *(_OWORD *)(v88 + 184);
  *(_OWORD *)((char *)v179 + 8) = *(_OWORD *)(v88 + 104);
  *(_OWORD *)((char *)&v179[1] + 8) = *(_OWORD *)(v88 + 120);
  LODWORD(v174) = v90;
  *((void *)&v174 + 1) = v92;
  *(void *)&long long v175 = v91;
  BYTE8(v175) = v93;
  long long v102 = *(_OWORD *)(v88 + 48);
  long long v176 = *(_OWORD *)(v88 + 32);
  long long v177 = v102;
  LOBYTE(v178[0]) = v94;
  *(_OWORD *)((char *)v178 + 8) = *(_OWORD *)(v88 + 72);
  BYTE8(v178[1]) = v95;
  *(void *)&v179[0] = v96;
  if (!*(void *)(v183 + 16))
  {
LABEL_64:
    sub_22D335860(&v174);
    goto LABEL_65;
  }
  swift_bridgeObjectRetain();
  sub_22D3195C4(v92, v91);
  if ((v103 & 1) == 0)
  {
LABEL_63:
    swift_bridgeObjectRelease();
    goto LABEL_64;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v104 = swift_bridgeObjectRetain();
  uint64_t v105 = (char *)sub_22D347990(v104);
  swift_bridgeObjectRelease();
  uint64_t v180 = (uint64_t)v105;
  uint64_t v106 = v166;
  sub_22D347924((char **)&v180);
  if (!v106)
  {
    swift_bridgeObjectRelease();
    unint64_t v107 = (char *)v180;
    sub_22D3359E0(v182);
    uint64_t v108 = sub_22D348620((uint64_t)v107, (uint64_t)v182);
    uint64_t v166 = 0;
    sub_22D335738(v182);
    swift_release();
    sub_22D335860(&v174);
    goto LABEL_66;
  }
LABEL_127:
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

char *sub_22D334A94(uint64_t a1)
{
  uint64_t v1 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v2 = -1;
  if (v1 < 64) {
    uint64_t v2 = ~(-1 << v1);
  }
  uint64_t v3 = v2 & *(void *)(a1 + 56);
  int64_t v21 = (unint64_t)(v1 + 63) >> 6;
  uint64_t result = (char *)swift_bridgeObjectRetain();
  int64_t v5 = 0;
  uint64_t v6 = (char *)MEMORY[0x263F8EE78];
  while (1)
  {
    if (v3)
    {
      v3 &= v3 - 1;
    }
    else
    {
      int64_t v7 = v5 + 1;
      if (__OFADD__(v5, 1)) {
        goto LABEL_44;
      }
      if (v7 >= v21)
      {
LABEL_39:
        swift_release();
        return v6;
      }
      uint64_t v8 = *(void *)(v20 + 8 * v7);
      ++v5;
      if (!v8)
      {
        int64_t v5 = v7 + 1;
        if (v7 + 1 >= v21) {
          goto LABEL_39;
        }
        uint64_t v8 = *(void *)(v20 + 8 * v5);
        if (!v8)
        {
          int64_t v5 = v7 + 2;
          if (v7 + 2 >= v21) {
            goto LABEL_39;
          }
          uint64_t v8 = *(void *)(v20 + 8 * v5);
          if (!v8)
          {
            int64_t v5 = v7 + 3;
            if (v7 + 3 >= v21) {
              goto LABEL_39;
            }
            uint64_t v8 = *(void *)(v20 + 8 * v5);
            if (!v8)
            {
              int64_t v9 = v7 + 4;
              if (v9 >= v21) {
                goto LABEL_39;
              }
              uint64_t v8 = *(void *)(v20 + 8 * v9);
              if (!v8)
              {
                while (1)
                {
                  int64_t v5 = v9 + 1;
                  if (__OFADD__(v9, 1)) {
                    goto LABEL_45;
                  }
                  if (v5 >= v21) {
                    goto LABEL_39;
                  }
                  uint64_t v8 = *(void *)(v20 + 8 * v5);
                  ++v9;
                  if (v8) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v9;
            }
          }
        }
      }
LABEL_23:
      uint64_t v3 = (v8 - 1) & v8;
    }
    uint64_t v10 = qword_2685684C8;
    swift_bridgeObjectRetain();
    if (v10 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_22D34B538();
    __swift_project_value_buffer(v11, (uint64_t)qword_26856ADE8);
    sub_22D333420();
    uint64_t v12 = sub_22D34B858();
    uint64_t result = (char *)swift_bridgeObjectRelease();
    uint64_t v13 = *(void *)(v12 + 16);
    int64_t v14 = *((void *)v6 + 2);
    int64_t v15 = v14 + v13;
    if (__OFADD__(v14, v13)) {
      break;
    }
    uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
    if (result && v15 <= *((void *)v6 + 3) >> 1)
    {
      if (!*(void *)(v12 + 16)) {
        goto LABEL_4;
      }
    }
    else
    {
      if (v14 <= v15) {
        int64_t v16 = v14 + v13;
      }
      else {
        int64_t v16 = v14;
      }
      uint64_t result = sub_22D344070(result, v16, 1, v6);
      uint64_t v6 = result;
      if (!*(void *)(v12 + 16))
      {
LABEL_4:
        if (v13) {
          goto LABEL_41;
        }
        goto LABEL_5;
      }
    }
    if ((*((void *)v6 + 3) >> 1) - *((void *)v6 + 2) < v13) {
      goto LABEL_42;
    }
    uint64_t result = (char *)swift_arrayInitWithCopy();
    if (v13)
    {
      uint64_t v17 = *((void *)v6 + 2);
      BOOL v18 = __OFADD__(v17, v13);
      uint64_t v19 = v17 + v13;
      if (v18) {
        goto LABEL_43;
      }
      *((void *)v6 + 2) = v19;
    }
LABEL_5:
    uint64_t result = (char *)swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
  return result;
}

uint64_t sub_22D334D70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SymbolMetadata.Backing(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22D334DD4(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3 = isStackAllocationSafe;
  v10[1] = *MEMORY[0x263EF8340];
  char v4 = *(unsigned char *)(a2 + 32);
  unint64_t v5 = (unint64_t)((1 << v4) + 63) >> 6;
  size_t v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    uint64_t v7 = sub_22D335370((void *)((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0)), v5, v3, a2);
    swift_release();
  }
  else
  {
    uint64_t v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    uint64_t v7 = sub_22D335370((unint64_t *)v8, v5, v3, a2);
    swift_release();
    MEMORY[0x230F7CA80](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_22D334F5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CustomSymbol();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22D334FC0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_22D335020()
{
  unint64_t result = qword_268568790;
  if (!qword_268568790)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2685684F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568790);
  }
  return result;
}

uint64_t sub_22D33507C(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 16) < *(void *)(a2 + 16)) {
    return 0;
  }
  uint64_t v3 = a2;
  uint64_t v4 = a1;
  uint64_t v31 = a2 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  if (-v5 < 64) {
    uint64_t v6 = ~(-1 << -(char)v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(a2 + 56);
  int64_t v30 = (unint64_t)(63 - v5) >> 6;
  uint64_t v32 = a1 + 56;
  uint64_t result = swift_bridgeObjectRetain();
  for (int64_t i = 0; ; int64_t i = v12)
  {
    if (v7)
    {
      unint64_t v10 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v11 = v10 | (i << 6);
      int64_t v12 = i;
      if (!*(void *)(v4 + 16)) {
        goto LABEL_40;
      }
      goto LABEL_25;
    }
    int64_t v13 = i + 1;
    if (__OFADD__(i, 1))
    {
      __break(1u);
      goto LABEL_45;
    }
    if (v13 >= v30) {
      goto LABEL_41;
    }
    unint64_t v14 = *(void *)(v31 + 8 * v13);
    int64_t v12 = i + 1;
    if (!v14)
    {
      int64_t v12 = i + 2;
      if (i + 2 >= v30) {
        goto LABEL_41;
      }
      unint64_t v14 = *(void *)(v31 + 8 * v12);
      if (!v14)
      {
        int64_t v12 = i + 3;
        if (i + 3 >= v30) {
          goto LABEL_41;
        }
        unint64_t v14 = *(void *)(v31 + 8 * v12);
        if (!v14) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v11 = __clz(__rbit64(v14)) + (v12 << 6);
    if (!*(void *)(v4 + 16))
    {
LABEL_40:
      uint64_t v2 = 0;
      goto LABEL_42;
    }
LABEL_25:
    uint64_t v16 = v3;
    uint64_t v17 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v11);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_22D34BA48();
    swift_bridgeObjectRetain();
    sub_22D34B778();
    uint64_t v20 = sub_22D34BA78();
    uint64_t v21 = v4;
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = v20 & ~v22;
    if (((*(void *)(v32 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0) {
      goto LABEL_39;
    }
    uint64_t v24 = *(void *)(v21 + 48);
    uint64_t v25 = (void *)(v24 + 16 * v23);
    BOOL v26 = *v25 == v19 && v25[1] == v18;
    if (!v26 && (sub_22D34B9A8() & 1) == 0)
    {
      uint64_t v27 = ~v22;
      while (1)
      {
        unint64_t v23 = (v23 + 1) & v27;
        if (((*(void *)(v32 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0) {
          break;
        }
        uint64_t v28 = (void *)(v24 + 16 * v23);
        BOOL v29 = *v28 == v19 && v28[1] == v18;
        if (v29 || (sub_22D34B9A8() & 1) != 0) {
          goto LABEL_7;
        }
      }
LABEL_39:
      swift_bridgeObjectRelease();
      uint64_t v2 = 0;
LABEL_42:
      sub_22D32E154();
      return v2;
    }
LABEL_7:
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v3 = v16;
    uint64_t v4 = v21;
  }
  int64_t v15 = i + 4;
  if (i + 4 >= v30)
  {
LABEL_41:
    uint64_t v2 = 1;
    goto LABEL_42;
  }
  unint64_t v14 = *(void *)(v31 + 8 * v15);
  if (v14)
  {
    int64_t v12 = i + 4;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v12 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v12 >= v30) {
      goto LABEL_41;
    }
    unint64_t v14 = *(void *)(v31 + 8 * v12);
    ++v15;
    if (v14) {
      goto LABEL_24;
    }
  }
LABEL_45:
  __break(1u);
  return result;
}

uint64_t sub_22D335370(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v7 = 0;
  if (v6)
  {
    uint64_t v8 = 0;
    uint64_t v9 = a4 + 56;
    uint64_t v10 = a3 + 32;
    do
    {
      int v15 = *(_DWORD *)(v10 + 4 * v8);
      sub_22D34BA48();
      sub_22D34BA68();
      uint64_t v16 = sub_22D34BA78();
      uint64_t v17 = -1 << *(unsigned char *)(a4 + 32);
      unint64_t v18 = v16 & ~v17;
      uint64_t v11 = v18 >> 6;
      uint64_t v12 = 1 << v18;
      if (((1 << v18) & *(void *)(v9 + 8 * (v18 >> 6))) != 0)
      {
        uint64_t v19 = *(void *)(a4 + 48);
        if (*(_DWORD *)(v19 + 4 * v18) == v15)
        {
LABEL_4:
          uint64_t v13 = v11;
          unint64_t v14 = a1[v11];
          a1[v13] = v12 | v14;
          if ((v12 & v14) == 0 && __OFADD__(v7++, 1))
          {
            __break(1u);
            break;
          }
        }
        else
        {
          for (unint64_t i = v18 + 1; ; unint64_t i = v21 + 1)
          {
            unint64_t v21 = i & ~v17;
            if (((*(void *)(v9 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0) {
              break;
            }
            if (*(_DWORD *)(v19 + 4 * v21) == v15)
            {
              uint64_t v11 = v21 >> 6;
              uint64_t v12 = 1 << v21;
              goto LABEL_4;
            }
          }
        }
      }
      ++v8;
    }
    while (v8 != v6);
  }
  swift_retain();
  return sub_22D3354CC(a1, a2, v7, a4);
}

uint64_t sub_22D3354CC(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v9 = MEMORY[0x263F8EE88];
LABEL_36:
    swift_release();
    return v9;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685685D0);
  uint64_t result = sub_22D34B8B8();
  uint64_t v9 = result;
  uint64_t v28 = a1;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    uint64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_39;
    }
    if (v15 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v28[v15];
    ++v11;
    if (!v16)
    {
      uint64_t v11 = v15 + 1;
      if (v15 + 1 >= a2) {
        goto LABEL_36;
      }
      unint64_t v16 = v28[v11];
      if (!v16)
      {
        uint64_t v11 = v15 + 2;
        if (v15 + 2 >= a2) {
          goto LABEL_36;
        }
        unint64_t v16 = v28[v11];
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    int v18 = *(_DWORD *)(*(void *)(v4 + 48) + 4 * v14);
    sub_22D34BA48();
    sub_22D34BA68();
    uint64_t result = sub_22D34BA78();
    uint64_t v19 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v21 == v24;
        if (v21 == v24) {
          unint64_t v21 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v12 + 8 * v21);
      }
      while (v26 == -1);
      unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
    }
    *(void *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(_DWORD *)(*(void *)(v9 + 48) + 4 * v22) = v18;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v17 = v15 + 3;
  if (v17 >= a2) {
    goto LABEL_36;
  }
  unint64_t v16 = v28[v17];
  if (v16)
  {
    uint64_t v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v28[v11];
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

void *sub_22D335738(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t v4 = (void *)a1[16];
  uint64_t v5 = (void *)a1[19];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22D32E15C(v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return a1;
}

void *sub_22D335860(void *a1)
{
  uint64_t v3 = a1[19];
  uint64_t v4 = (void *)a1[29];
  uint64_t v5 = (void *)a1[32];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22D32E15C(v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return a1;
}

void *sub_22D3359E0(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t v7 = (void *)a1[16];
  uint64_t v3 = (void *)a1[19];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_22D335B04(v2);
  id v4 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v5 = v7;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_22D335B04(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_22D335B14(unint64_t a1, unint64_t a2, char a3)
{
  unint64_t v3 = a2;
  unint64_t v4 = a1;
  unint64_t v54 = a1;
  uint64_t v55 = a2;
  if (qword_2685684C8 != -1) {
    goto LABEL_97;
  }
  while (1)
  {
    uint64_t v5 = sub_22D34B538();
    __swift_project_value_buffer(v5, (uint64_t)qword_26856ADE8);
    sub_22D333420();
    uint64_t v6 = sub_22D34B858();
    uint64_t v7 = *(void *)(v6 + 16);
    unint64_t v8 = MEMORY[0x263F8EE78];
    if (v7)
    {
      uint64_t v9 = (uint64_t *)(v6 + 40);
      do
      {
        uint64_t v14 = *(v9 - 1);
        uint64_t v13 = *v9;
        uint64_t v15 = HIBYTE(*v9) & 0xF;
        if ((*v9 & 0x2000000000000000) == 0) {
          uint64_t v15 = v14 & 0xFFFFFFFFFFFFLL;
        }
        if (v15)
        {
          swift_bridgeObjectRetain();
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          unint64_t v54 = v8;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_22D33C9CC(0, *(void *)(v8 + 16) + 1, 1);
            unint64_t v8 = v54;
          }
          unint64_t v11 = *(void *)(v8 + 16);
          unint64_t v10 = *(void *)(v8 + 24);
          if (v11 >= v10 >> 1)
          {
            sub_22D33C9CC((char *)(v10 > 1), v11 + 1, 1);
            unint64_t v8 = v54;
          }
          *(void *)(v8 + 16) = v11 + 1;
          unint64_t v12 = v8 + 16 * v11;
          *(void *)(v12 + 32) = v14;
          *(void *)(v12 + 40) = v13;
        }
        v9 += 2;
        --v7;
      }
      while (v7);
    }
    swift_bridgeObjectRelease();
    int64_t v17 = *(void *)(v8 + 16);
    if (v17)
    {
      unint64_t v54 = MEMORY[0x263F8EE78];
      sub_22D33C9CC(0, v17, 0);
      unint64_t v18 = v54;
      unint64_t v19 = v8 + 40;
      do
      {
        uint64_t v20 = sub_22D34B758();
        uint64_t v22 = v21;
        unint64_t v54 = v18;
        unint64_t v24 = *(void *)(v18 + 16);
        unint64_t v23 = *(void *)(v18 + 24);
        if (v24 >= v23 >> 1)
        {
          sub_22D33C9CC((char *)(v23 > 1), v24 + 1, 1);
          unint64_t v18 = v54;
        }
        v19 += 16;
        *(void *)(v18 + 16) = v24 + 1;
        unint64_t v25 = v18 + 16 * v24;
        *(void *)(v25 + 32) = v20;
        *(void *)(v25 + 40) = v22;
        --v17;
      }
      while (v17);
      swift_release();
      unint64_t v26 = v18;
    }
    else
    {
      swift_release();
      unint64_t v26 = MEMORY[0x263F8EE78];
    }
    uint64_t v27 = swift_bridgeObjectRetain();
    uint64_t v52 = sub_22D33D608(v27);
    swift_bridgeObjectRelease();
    if ((v3 & 0x2000000000000000) != 0) {
      uint64_t v28 = HIBYTE(v3) & 0xF;
    }
    else {
      uint64_t v28 = v4 & 0xFFFFFFFFFFFFLL;
    }
    if (v28)
    {
      uint64_t v29 = 0;
      do
      {
        if ((v3 & 0x1000000000000000) != 0)
        {
          uint64_t v30 = sub_22D34B8C8();
        }
        else
        {
          if ((v3 & 0x2000000000000000) != 0)
          {
            unint64_t v54 = v4;
            uint64_t v55 = v3 & 0xFFFFFFFFFFFFFFLL;
          }
          else if ((v4 & 0x1000000000000000) == 0)
          {
            sub_22D34B8E8();
          }
          uint64_t v30 = sub_22D34B8F8();
        }
        v29 += v31;
        sub_22D327E64(&v54, v30);
      }
      while (v29 < v28);
    }
    swift_bridgeObjectRelease();
    if ((a3 & 1) == 0) {
      return v52;
    }
    unint64_t v4 = *(void *)(v26 + 16);
    if (!v4) {
      return v52;
    }
    swift_bridgeObjectRetain();
    unint64_t v32 = v26;
    unint64_t v33 = 0;
    while (v33 < *(void *)(v32 + 16))
    {
      long long v34 = (unint64_t *)(v26 + 32 + 16 * v33);
      unint64_t v3 = *v34;
      unint64_t v35 = v34[1];
      uint64_t v36 = HIBYTE(v35) & 0xF;
      uint64_t v37 = v3 & 0xFFFFFFFFFFFFLL;
      if ((v35 & 0x2000000000000000) != 0) {
        uint64_t v38 = HIBYTE(v35) & 0xF;
      }
      else {
        uint64_t v38 = v3 & 0xFFFFFFFFFFFFLL;
      }
      if (!v38) {
        goto LABEL_36;
      }
      if ((v35 & 0x1000000000000000) != 0)
      {
        swift_bridgeObjectRetain();
        unint64_t v3 = sub_22D344E8C(v3, v35, 16);
        swift_bridgeObjectRelease();
        unint64_t v32 = v26;
        uint64_t v40 = v3;
        if ((v3 & 0x100000000) == 0) {
          goto LABEL_85;
        }
      }
      else
      {
        if ((v35 & 0x2000000000000000) == 0)
        {
          if ((v3 & 0x1000000000000000) != 0) {
            long long v39 = (unsigned __int8 *)((v35 & 0xFFFFFFFFFFFFFFFLL) + 32);
          }
          else {
            long long v39 = (unsigned __int8 *)sub_22D34B8E8();
          }
          uint64_t v40 = (uint64_t)sub_22D344C10(v39, v37, 16);
          unint64_t v32 = v26;
          if ((v40 & 0x100000000) != 0) {
            goto LABEL_36;
          }
          goto LABEL_85;
        }
        unint64_t v54 = v3;
        uint64_t v55 = v35 & 0xFFFFFFFFFFFFFFLL;
        if (v3 == 43)
        {
          if (!v36) {
            goto LABEL_96;
          }
          if (--v36)
          {
            LODWORD(v40) = 0;
            uint64_t v45 = (unsigned __int8 *)&v54 + 1;
            while (1)
            {
              int v46 = *v45;
              unsigned __int8 v47 = v46 - 48;
              if ((v46 - 48) >= 0xA)
              {
                if ((v46 - 65) < 6)
                {
                  unsigned __int8 v47 = v46 - 55;
                }
                else
                {
                  if ((v46 - 97) > 5) {
                    goto LABEL_83;
                  }
                  unsigned __int8 v47 = v46 - 87;
                }
              }
              if (v40 >> 28) {
                goto LABEL_83;
              }
              uint64_t v40 = 16 * v40 + v47;
              ++v45;
              if (!--v36) {
                goto LABEL_84;
              }
            }
          }
        }
        else if (v3 == 45)
        {
          if (!v36) {
            goto LABEL_95;
          }
          if (--v36)
          {
            LODWORD(v40) = 0;
            uint64_t v41 = (unsigned __int8 *)&v54 + 1;
            while (1)
            {
              int v42 = *v41;
              unsigned __int8 v43 = v42 - 48;
              if ((v42 - 48) >= 0xA)
              {
                if ((v42 - 65) < 6)
                {
                  unsigned __int8 v43 = v42 - 55;
                }
                else
                {
                  if ((v42 - 97) > 5) {
                    goto LABEL_83;
                  }
                  unsigned __int8 v43 = v42 - 87;
                }
              }
              if (v40 >> 28) {
                goto LABEL_83;
              }
              unsigned int v44 = 16 * v40;
              uint64_t v40 = 16 * v40 - v43;
              if (v44 < v43) {
                goto LABEL_83;
              }
              ++v41;
              if (!--v36) {
                goto LABEL_84;
              }
            }
          }
        }
        else if (v36)
        {
          LODWORD(v40) = 0;
          long long v48 = &v54;
          while (1)
          {
            int v49 = *(unsigned __int8 *)v48;
            unsigned __int8 v50 = v49 - 48;
            if ((v49 - 48) >= 0xA)
            {
              if ((v49 - 65) < 6)
              {
                unsigned __int8 v50 = v49 - 55;
              }
              else
              {
                if ((v49 - 97) > 5) {
                  break;
                }
                unsigned __int8 v50 = v49 - 87;
              }
            }
            if (v40 >> 28) {
              break;
            }
            uint64_t v40 = 16 * v40 + v50;
            long long v48 = (unint64_t *)((char *)v48 + 1);
            if (!--v36) {
              goto LABEL_84;
            }
          }
LABEL_83:
          uint64_t v40 = 0;
          LOBYTE(v36) = 1;
LABEL_84:
          if (v36) {
            goto LABEL_36;
          }
LABEL_85:
          if (WORD1(v40) <= 0x10u && (v40 & 0xFFFFF800) != 0xD800)
          {
            sub_22D327E64(&v54, v40);
            unint64_t v32 = v26;
          }
        }
      }
LABEL_36:
      if (++v33 == v4)
      {
        swift_bridgeObjectRelease();
        return v52;
      }
    }
    __break(1u);
LABEL_95:
    __break(1u);
LABEL_96:
    __break(1u);
LABEL_97:
    swift_once();
  }
}

uint64_t sub_22D33609C(uint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(char *), uint64_t a5)
{
  uint64_t v43 = a5;
  unsigned int v44 = a4;
  uint64_t v51 = a2;
  unint64_t v52 = a3;
  v53[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v6 = sub_22D34B638();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  long long v48 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  unint64_t v12 = (char *)&v41 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v41 - v13;
  id v42 = self;
  id v15 = objc_msgSend(v42, sel_defaultManager);
  unint64_t v16 = NSTemporaryDirectory();
  sub_22D34B718();

  sub_22D34B5D8();
  swift_bridgeObjectRelease();
  int64_t v17 = (void *)sub_22D34B5E8();
  unint64_t v18 = *(void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v49 = v7 + 8;
  uint64_t v50 = v6;
  v18(v12, v6);
  v53[0] = 0;
  id v19 = objc_msgSend(v15, sel_URLForDirectory_inDomain_appropriateForURL_create_error_, 99, 1, v17, 1, v53);

  id v20 = v53[0];
  if (v19)
  {
    uint64_t v45 = v18;
    sub_22D34B628();

    uint64_t v21 = v48;
    sub_22D34B5F8();
    uint64_t v22 = *(uint64_t (**)(uint64_t, unint64_t))(a1 + 16);
    uint64_t v46 = a1;
    swift_retain();
    uint64_t v23 = v47;
    uint64_t v24 = v22(v51, v52);
    if (v23)
    {
      swift_release();
      uint64_t v26 = v50;
      unint64_t v32 = v45;
      v45(v21, v50);
      v32(v14, v26);
    }
    else
    {
      uint64_t v28 = v24;
      unint64_t v29 = v25;
      uint64_t v30 = swift_release();
      MEMORY[0x270FA5388](v30);
      *(&v41 - 4) = v28;
      *(&v41 - 3) = v29;
      *(&v41 - 2) = (uint64_t)v21;
      sub_22D3364E8((void (*)(char *))sub_22D336A9C, (uint64_t)(&v41 - 6));
      uint64_t v31 = v50;
      sub_22D32E214(v28, v29);
      v44(v21);
      long long v34 = v45;
      v45(v21, v31);
      id v35 = objc_msgSend(v42, sel_defaultManager);
      uint64_t v36 = (void *)sub_22D34B5E8();
      v53[0] = 0;
      unsigned __int8 v37 = objc_msgSend(v35, sel_removeItemAtURL_error_, v36, v53);

      if (v37)
      {
        id v38 = v53[0];
      }
      else
      {
        id v39 = v53[0];
        uint64_t v40 = (void *)sub_22D34B5C8();

        swift_willThrow();
      }
      v34(v14, v31);
    }
  }
  else
  {
    uint64_t v27 = v20;
    sub_22D34B5C8();

    swift_willThrow();
  }
  swift_release();
  return sub_22D32E214(v51, v52);
}

uint64_t sub_22D3364E8(void (*a1)(char *), uint64_t a2)
{
  uint64_t v26 = a1;
  v25[1] = a2;
  v28[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = sub_22D34B638();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v25 - v7;
  uint64_t v9 = self;
  id v10 = objc_msgSend(v9, sel_defaultManager);
  uint64_t v11 = NSTemporaryDirectory();
  sub_22D34B718();

  sub_22D34B5D8();
  swift_bridgeObjectRelease();
  unint64_t v12 = (void *)sub_22D34B5E8();
  uint64_t v13 = *(void (**)(char *, uint64_t))(v3 + 8);
  v13(v6, v2);
  v28[0] = 0;
  id v14 = objc_msgSend(v10, sel_URLForDirectory_inDomain_appropriateForURL_create_error_, 99, 1, v12, 1, v28);

  id v15 = v28[0];
  if (v14)
  {
    sub_22D34B628();

    uint64_t v16 = v27;
    v26(v8);
    if (!v16)
    {
      id v17 = objc_msgSend(v9, sel_defaultManager);
      unint64_t v18 = (void *)sub_22D34B5E8();
      v28[0] = 0;
      unsigned __int8 v19 = objc_msgSend(v17, sel_removeItemAtURL_error_, v18, v28);

      if (v19)
      {
        id v20 = v28[0];
      }
      else
      {
        id v23 = v28[0];
        uint64_t v24 = (void *)sub_22D34B5C8();

        swift_willThrow();
      }
    }
    return ((uint64_t (*)(char *, uint64_t))v13)(v8, v2);
  }
  else
  {
    uint64_t v21 = v15;
    sub_22D34B5C8();

    return swift_willThrow();
  }
}

uint64_t type metadata accessor for DirectoryCompressor()
{
  return self;
}

uint64_t sub_22D3367D4(unint64_t a1, unint64_t a2)
{
  sub_22D32E2DC(a1, a2);
  uint64_t v4 = sub_22D342680(1, a1, a2);
  unint64_t v6 = v5;
  sub_22D32E214(a1, a2);
  if (v6 >> 60 == 15) {
    return 0;
  }
  else {
    return v4;
  }
}

uint64_t sub_22D33684C()
{
  v13[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = sub_22D34B638();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D34B608();
  sub_22D34B688();
  if (!v0)
  {
    unint64_t v5 = self;
    unint64_t v6 = (void *)sub_22D34B5E8();
    uint64_t v7 = (void *)sub_22D34B5E8();
    v13[0] = 0;
    unsigned __int8 v8 = objc_msgSend(v5, sel_decompressDataAtURL_toURL_error_, v6, v7, v13);

    if (v8)
    {
      uint64_t v9 = *(uint64_t (**)(char *, uint64_t))(v2 + 8);
      id v10 = v13[0];
      return v9(v4, v1);
    }
    id v12 = v13[0];
    sub_22D34B5C8();

    swift_willThrow();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_22D336A40()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for DirectoryDecompressor()
{
  return self;
}

uint64_t sub_22D336A9C()
{
  return sub_22D33684C();
}

double SymbolMetadataStore.availability(forSystemName:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v4[0] = 1701667182;
  v4[1] = 0xE400000000000000;
  return sub_22D339CD0(v4, a1, a2, a3);
}

uint64_t sub_22D336AF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_22D34BA48();
    sub_22D34B778();
    uint64_t v6 = sub_22D34BA78();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_22D34B9A8() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          uint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_22D34B9A8() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

BOOL sub_22D336C30(int a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  sub_22D34BA48();
  sub_22D34BA68();
  uint64_t v4 = sub_22D34BA78();
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = v4 & ~v5;
  uint64_t v7 = a2 + 56;
  if (((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
    return 0;
  }
  uint64_t v8 = *(void *)(a2 + 48);
  if (*(_DWORD *)(v8 + 4 * v6) == a1) {
    return 1;
  }
  uint64_t v10 = ~v5;
  unint64_t v11 = (v6 + 1) & v10;
  if (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
    return 0;
  }
  do
  {
    int v12 = *(_DWORD *)(v8 + 4 * v11);
    BOOL result = v12 == a1;
    if (v12 == a1) {
      break;
    }
    unint64_t v11 = (v11 + 1) & v10;
  }
  while (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return result;
}

uint64_t sub_22D336D20(uint64_t a1, uint64_t a2)
{
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685685B8);
  MEMORY[0x270FA5388](v54);
  uint64_t v5 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_22D34B6B8();
  uint64_t v6 = *(void *)(v49 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v49);
  uint64_t v46 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v43 - v9;
  uint64_t v11 = type metadata accessor for SymbolKey(0);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v50 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (_DWORD *)((char *)&v43 - v15);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  unsigned __int8 v19 = (char *)&v43 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v22 = (char *)&v43 - v21;
  if (*(void *)(a2 + 16))
  {
    uint64_t v52 = v20;
    sub_22D34BA48();
    sub_22D33DAD0(a1, (uint64_t)v22, type metadata accessor for SymbolKey);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v23 = v49;
      (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v10, v22, v49);
      sub_22D34BA58();
      sub_22D340850(&qword_2685685C0, MEMORY[0x263F07508]);
      sub_22D34B6D8();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v23);
    }
    else
    {
      sub_22D34BA58();
      sub_22D34BA68();
    }
    uint64_t v24 = sub_22D34BA78();
    uint64_t v25 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v26 = v24 & ~v25;
    uint64_t v27 = a2 + 56;
    if ((*(void *)(a2 + 56 + ((v26 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v26))
    {
      uint64_t v52 = *(void *)(v52 + 72);
      uint64_t v53 = a1;
      long long v48 = (void (**)(uint64_t, uint64_t))(v6 + 8);
      unsigned int v44 = (void (**)(char *, char *, uint64_t))(v6 + 32);
      uint64_t v45 = ~v25;
      uint64_t v28 = ~v25;
      uint64_t v29 = (uint64_t)v50;
      uint64_t v51 = a2;
      do
      {
        sub_22D33DAD0(*(void *)(a2 + 48) + v52 * v26, (uint64_t)v19, type metadata accessor for SymbolKey);
        uint64_t v30 = &v5[*(int *)(v54 + 48)];
        sub_22D33DAD0((uint64_t)v19, (uint64_t)v5, type metadata accessor for SymbolKey);
        sub_22D33DAD0(v53, (uint64_t)v30, type metadata accessor for SymbolKey);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          sub_22D33DAD0((uint64_t)v5, v29, type metadata accessor for SymbolKey);
          if (swift_getEnumCaseMultiPayload() != 1)
          {
            (*v48)(v29, v49);
LABEL_8:
            sub_22D3415D4((uint64_t)v5, &qword_2685685B8);
            goto LABEL_9;
          }
          uint64_t v31 = v46;
          unint64_t v32 = v19;
          uint64_t v33 = v27;
          uint64_t v34 = v11;
          id v35 = v16;
          uint64_t v36 = v49;
          (*v44)(v46, v30, v49);
          int v47 = sub_22D34B6A8();
          unsigned __int8 v37 = *v48;
          id v38 = v31;
          uint64_t v29 = (uint64_t)v50;
          (*v48)((uint64_t)v38, v36);
          uint64_t v39 = v36;
          uint64_t v16 = v35;
          uint64_t v11 = v34;
          uint64_t v27 = v33;
          unsigned __int8 v19 = v32;
          uint64_t v28 = v45;
          v37(v29, v39);
          sub_22D33DB38((uint64_t)v5, type metadata accessor for SymbolKey);
          if (v47) {
            goto LABEL_16;
          }
        }
        else
        {
          sub_22D33DAD0((uint64_t)v5, (uint64_t)v16, type metadata accessor for SymbolKey);
          if (swift_getEnumCaseMultiPayload() == 1) {
            goto LABEL_8;
          }
          int v40 = *v16;
          int v41 = *(_DWORD *)v30;
          sub_22D33DB38((uint64_t)v5, type metadata accessor for SymbolKey);
          if (v40 == v41)
          {
LABEL_16:
            sub_22D33DB38((uint64_t)v19, type metadata accessor for SymbolKey);
            return 1;
          }
        }
LABEL_9:
        sub_22D33DB38((uint64_t)v19, type metadata accessor for SymbolKey);
        unint64_t v26 = (v26 + 1) & v28;
        a2 = v51;
      }
      while (((*(void *)(v27 + ((v26 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v26) & 1) != 0);
    }
  }
  return 0;
}

uint64_t SymbolKey.hash(into:)()
{
  uint64_t v1 = sub_22D34B6B8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for SymbolKey(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D33DAD0(v0, (uint64_t)v7, type metadata accessor for SymbolKey);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v7, v1);
    sub_22D34BA58();
    sub_22D340850(&qword_2685685C0, MEMORY[0x263F07508]);
    sub_22D34B6D8();
    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  else
  {
    sub_22D34BA58();
    return sub_22D34BA68();
  }
}

uint64_t SymbolKey.hashValue.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22D34B6B8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for SymbolKey(0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D34BA48();
  sub_22D33DAD0(v1, (uint64_t)v8, type metadata accessor for SymbolKey);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
    sub_22D34BA58();
    sub_22D340850(&qword_2685685C0, MEMORY[0x263F07508]);
    sub_22D34B6D8();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    sub_22D34BA58();
    sub_22D34BA68();
  }
  return sub_22D34BA78();
}

uint64_t sub_22D3376A0()
{
  uint64_t v1 = sub_22D34B6B8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D33DAD0(v0, (uint64_t)v7, type metadata accessor for SymbolKey);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v5, v7, v1);
    sub_22D34BA58();
    sub_22D340850(&qword_2685685C0, MEMORY[0x263F07508]);
    sub_22D34B6D8();
    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
  else
  {
    sub_22D34BA58();
    return sub_22D34BA68();
  }
}

uint64_t sub_22D337870()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22D34B6B8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D34BA48();
  sub_22D33DAD0(v1, (uint64_t)v8, type metadata accessor for SymbolKey);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v8, v2);
    sub_22D34BA58();
    sub_22D340850(&qword_2685685C0, MEMORY[0x263F07508]);
    sub_22D34B6D8();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  else
  {
    sub_22D34BA58();
    sub_22D34BA68();
  }
  return sub_22D34BA78();
}

double sub_22D337A64()
{
  return sub_22D337A70(&xmmword_268568798);
}

double sub_22D337A70@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685688B0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = &v23[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_22D34B638();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = &v23[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = &v23[-v10];
  long long v24 = MEMORY[0x263F8EE78];
  *(void *)&long long v25 = MEMORY[0x263F8EE80];
  *((void *)&v25 + 1) = MEMORY[0x263F8EE80];
  *(void *)&long long v26 = MEMORY[0x263F8EE80];
  *((void *)&v26 + 1) = MEMORY[0x263F8EE80];
  long long v27 = 0uLL;
  long long v28 = MEMORY[0x263F8EE78];
  *(void *)&long long v29 = MEMORY[0x263F8EE80];
  *((void *)&v29 + 1) = MEMORY[0x263F8EE80];
  *(void *)&long long v30 = MEMORY[0x263F8EE80];
  *((void *)&v30 + 1) = MEMORY[0x263F8EE80];
  long long v31 = MEMORY[0x263F8EE78];
  long long v32 = 0u;
  long long v33 = 0u;
  if (qword_2685684C0 != -1) {
    swift_once();
  }
  uint64_t v12 = (void *)qword_26856ADE0;
  uint64_t v13 = (void *)sub_22D34B708();
  id v14 = objc_msgSend(v12, sel_URLForResource_withExtension_, v13, 0);

  if (!v14)
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    goto LABEL_7;
  }
  sub_22D34B628();

  uint64_t v15 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 32);
  v15(v4, v9, v5);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
LABEL_7:
    sub_22D3415D4((uint64_t)v4, &qword_2685688B0);
    goto LABEL_8;
  }
  v15(v11, v4, v5);
  type metadata accessor for DirectoryDecompressor();
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 16) = sub_22D3367D4;
  *(void *)(inited + 24) = 0;
  sub_22D31CB1C((uint64_t)v11, inited);
  swift_setDeallocating();
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v11, v5);
LABEL_8:
  long long v17 = v31;
  a1[6] = v30;
  a1[7] = v17;
  long long v18 = v33;
  a1[8] = v32;
  a1[9] = v18;
  long long v19 = v27;
  a1[2] = v26;
  a1[3] = v19;
  long long v20 = v29;
  a1[4] = v28;
  a1[5] = v20;
  double result = *(double *)&v24;
  long long v22 = v25;
  *a1 = v24;
  a1[1] = v22;
  return result;
}

double SymbolMetadataStore.init()@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1 = MEMORY[0x263F8EE78];
  uint64_t v2 = MEMORY[0x263F8EE80];
  *(void *)a1 = MEMORY[0x263F8EE78];
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v2;
  *(void *)(a1 + 24) = v2;
  *(void *)(a1 + 32) = v2;
  *(void *)(a1 + 40) = v2;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = v1;
  *(void *)(a1 + 72) = v2;
  *(void *)(a1 + 80) = v2;
  *(void *)(a1 + 88) = v2;
  *(void *)(a1 + 96) = v2;
  *(void *)(a1 + 104) = v2;
  *(void *)(a1 + 112) = v1;
  *(void *)(a1 + 120) = v2;
  double result = 0.0;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  return result;
}

void *static SymbolMetadataStore.system.getter@<X0>(long long *a1@<X8>)
{
  if (qword_2685684D0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  long long v2 = xmmword_2685687E8;
  v12[6] = xmmword_2685687F8;
  long long v3 = xmmword_268568808;
  v12[7] = xmmword_268568808;
  v12[8] = xmmword_268568818;
  long long v4 = xmmword_268568818;
  v12[9] = xmmword_268568828;
  long long v5 = xmmword_2685687B8;
  long long v6 = xmmword_2685687A8;
  v12[2] = xmmword_2685687B8;
  v12[3] = xmmword_2685687C8;
  long long v7 = xmmword_2685687C8;
  long long v8 = xmmword_2685687D8;
  v12[4] = xmmword_2685687D8;
  v12[5] = xmmword_2685687E8;
  v12[0] = xmmword_268568798;
  long long v9 = xmmword_268568798;
  v12[1] = xmmword_2685687A8;
  a1[6] = xmmword_2685687F8;
  a1[7] = v3;
  long long v10 = xmmword_268568828;
  a1[8] = v4;
  a1[9] = v10;
  a1[2] = v5;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v2;
  *a1 = v9;
  a1[1] = v6;
  return sub_22D3359E0(v12);
}

void *static SymbolMetadataStore.system.setter(long long *a1)
{
  if (qword_2685684D0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  v8[7] = xmmword_268568808;
  v8[8] = xmmword_268568818;
  v8[9] = xmmword_268568828;
  v8[2] = xmmword_2685687B8;
  v8[3] = xmmword_2685687C8;
  v8[4] = xmmword_2685687D8;
  v8[5] = xmmword_2685687E8;
  v8[6] = xmmword_2685687F8;
  v8[0] = xmmword_268568798;
  v8[1] = xmmword_2685687A8;
  long long v2 = a1[7];
  xmmword_2685687F8 = a1[6];
  xmmword_268568808 = v2;
  long long v3 = a1[9];
  xmmword_268568818 = a1[8];
  xmmword_268568828 = v3;
  long long v4 = a1[3];
  xmmword_2685687B8 = a1[2];
  xmmword_2685687C8 = v4;
  long long v5 = a1[5];
  xmmword_2685687D8 = a1[4];
  xmmword_2685687E8 = v5;
  long long v6 = a1[1];
  xmmword_268568798 = *a1;
  xmmword_2685687A8 = v6;
  return sub_22D335738(v8);
}

uint64_t (*static SymbolMetadataStore.system.modify())()
{
  if (qword_2685684D0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

size_t sub_22D338048()
{
  uint64_t v1 = type metadata accessor for CustomSymbol();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1 - 8);
  long long v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = type metadata accessor for SymbolKey(0);
  uint64_t v5 = *(void *)(v32 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v32);
  long long v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  long long v10 = (_DWORD *)((char *)&v29 - v9);
  uint64_t v11 = *v0;
  uint64_t v12 = v0[14];
  int64_t v13 = *(void *)(*v0 + 16);
  uint64_t v31 = v12;
  if (v13)
  {
    long long v30 = v4;
    uint64_t v33 = v2;
    size_t v34 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    int64_t v14 = v13;
    sub_22D33C9EC(0, v13, 0);
    uint64_t v15 = 0;
    size_t v16 = v34;
    do
    {
      uint64_t v17 = v11;
      _DWORD *v10 = *(_DWORD *)(v11 + 4 * v15 + 32);
      swift_storeEnumTagMultiPayload();
      size_t v34 = v16;
      unint64_t v19 = *(void *)(v16 + 16);
      unint64_t v18 = *(void *)(v16 + 24);
      if (v19 >= v18 >> 1)
      {
        sub_22D33C9EC(v18 > 1, v19 + 1, 1);
        size_t v16 = v34;
      }
      ++v15;
      *(void *)(v16 + 16) = v19 + 1;
      sub_22D33DA68((uint64_t)v10, v16+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v19, type metadata accessor for SymbolKey);
      uint64_t v11 = v17;
    }
    while (v14 != v15);
    swift_bridgeObjectRelease();
    long long v4 = v30;
    uint64_t v12 = v31;
    uint64_t v2 = v33;
  }
  int64_t v20 = *(void *)(v12 + 16);
  size_t v21 = MEMORY[0x263F8EE78];
  if (v20)
  {
    size_t v34 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_22D33C9EC(0, v20, 0);
    uint64_t v22 = v12 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
    uint64_t v33 = *(void *)(v2 + 72);
    do
    {
      sub_22D33DAD0(v22, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
      uint64_t v23 = sub_22D34B6B8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16))(v8, v4, v23);
      swift_storeEnumTagMultiPayload();
      sub_22D33DB38((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
      size_t v24 = v34;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_22D33C9EC(0, *(void *)(v24 + 16) + 1, 1);
        size_t v24 = v34;
      }
      unint64_t v26 = *(void *)(v24 + 16);
      unint64_t v25 = *(void *)(v24 + 24);
      if (v26 >= v25 >> 1)
      {
        sub_22D33C9EC(v25 > 1, v26 + 1, 1);
        size_t v24 = v34;
      }
      *(void *)(v24 + 16) = v26 + 1;
      sub_22D33DA68((uint64_t)v8, v24+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v26, type metadata accessor for SymbolKey);
      v22 += v33;
      --v20;
    }
    while (v20);
    swift_bridgeObjectRelease();
    size_t v21 = MEMORY[0x263F8EE78];
  }
  else
  {
    size_t v24 = MEMORY[0x263F8EE78];
  }
  size_t v34 = v21;
  size_t v27 = swift_bridgeObjectRetain();
  sub_22D33D180(v27);
  sub_22D33D180(v24);
  swift_bridgeObjectRelease();
  return v34;
}

uint64_t sub_22D33845C(uint64_t *a1)
{
  uint64_t v3 = type metadata accessor for SymbolKey(0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (_DWORD *)((char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = *a1;
  uint64_t v7 = a1[1];
  long long v9 = v1[5];
  v27[4] = v1[4];
  v27[5] = v9;
  long long v10 = v1[3];
  v27[2] = v1[2];
  v27[3] = v10;
  long long v11 = v1[9];
  v27[8] = v1[8];
  v27[9] = v11;
  long long v12 = v1[7];
  v27[6] = v1[6];
  v27[7] = v12;
  long long v13 = v1[1];
  v27[0] = *v1;
  v27[1] = v13;
  uint64_t v14 = *((void *)&v13 + 1);
  if (!*(void *)(*((void *)&v13 + 1) + 16)) {
    return MEMORY[0x263F8EE88];
  }
  swift_bridgeObjectRetain();
  unint64_t v15 = sub_22D322A58(v8, v7);
  if ((v16 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  uint64_t v17 = *(void *)(*(void *)(v14 + 56) + 8 * v15);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_22D3359E0(v27);
  uint64_t v18 = sub_22D33DD28(v17, (uint64_t)v27);
  sub_22D335738(v27);
  swift_bridgeObjectRelease();
  int64_t v19 = *(void *)(v18 + 16);
  if (v19)
  {
    uint64_t v26 = MEMORY[0x263F8EE78];
    sub_22D33C9EC(0, v19, 0);
    uint64_t v20 = 0;
    uint64_t v21 = v26;
    do
    {
      *uint64_t v6 = *(_DWORD *)(v18 + 4 * v20 + 32);
      swift_storeEnumTagMultiPayload();
      uint64_t v26 = v21;
      unint64_t v23 = *(void *)(v21 + 16);
      unint64_t v22 = *(void *)(v21 + 24);
      if (v23 >= v22 >> 1)
      {
        sub_22D33C9EC(v22 > 1, v23 + 1, 1);
        uint64_t v21 = v26;
      }
      ++v20;
      *(void *)(v21 + 16) = v23 + 1;
      sub_22D33DA68((uint64_t)v6, v21+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(void *)(v4 + 72) * v23, type metadata accessor for SymbolKey);
    }
    while (v19 != v20);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v21 = MEMORY[0x263F8EE78];
  }
  uint64_t v24 = sub_22D33DB98(v21);
  swift_bridgeObjectRelease();
  return v24;
}

uint64_t sub_22D3386C0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v1 + 48);
  if (!v4)
  {
    uint64_t v6 = *(void *)(v1 + 8);
    if (*(void *)(v6 + 16))
    {
      uint64_t v7 = *(void *)(v2 + 40);
      unint64_t v8 = sub_22D3229EC(a1);
      if (v9)
      {
        if (*(void *)(v7 + 16))
        {
          uint64_t v10 = *(void *)(v6 + 56) + 104 * v8;
          uint64_t v11 = *(void *)(v10 + 16);
          uint64_t v12 = *(void *)(v10 + 8);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          unint64_t v13 = sub_22D3195C4(v12, v11);
          if (v14)
          {
            uint64_t v5 = *(void *)(*(void *)(v7 + 56) + 8 * v13);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease_n();
            return v5;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
        }
      }
    }
    return 0;
  }
  swift_retain();
  uint64_t v5 = v4(a1);
  sub_22D32E15C((uint64_t)v4);
  return v5;
}

uint64_t SymbolMetadataStore.categories.getter()
{
  long long v1 = v0[7];
  v9[6] = v0[6];
  v9[7] = v1;
  long long v2 = v0[9];
  v9[8] = v0[8];
  v9[9] = v2;
  long long v3 = v0[3];
  void v9[2] = v0[2];
  v9[3] = v3;
  long long v4 = v0[5];
  v9[4] = v0[4];
  v9[5] = v4;
  long long v5 = v0[1];
  v9[0] = *v0;
  v9[1] = v5;
  sub_22D3359E0(v9);
  uint64_t v6 = swift_bridgeObjectRetain();
  uint64_t v7 = sub_22D33D6A0(v6, (uint64_t)v9);
  sub_22D335738(v9);
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_22D3388EC(uint64_t a1, uint64_t a2)
{
  long long v5 = *(void **)(v2 + 128);
  uint64_t v6 = *(void **)(v2 + 152);
  if (!v5)
  {
LABEL_8:
    if (!v6) {
      goto LABEL_19;
    }
LABEL_11:
    id v13 = v6;
    uint64_t v14 = sub_22D34B588();
    if (v14 == a1 && v15 == a2)
    {
      swift_bridgeObjectRelease();

      goto LABEL_19;
    }
    uint64_t v11 = v14;
    char v17 = sub_22D34B9A8();

    if (v17)
    {
      swift_bridgeObjectRelease();
      goto LABEL_19;
    }
    return v11;
  }
  id v7 = v5;
  uint64_t v8 = sub_22D34B588();
  if (v8 != a1 || v9 != a2)
  {
    uint64_t v11 = v8;
    char v12 = sub_22D34B9A8();

    if ((v12 & 1) == 0) {
      return v11;
    }
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  swift_bridgeObjectRelease();

  if (v6) {
    goto LABEL_11;
  }
LABEL_19:
  if (qword_2685684C0 != -1) {
    swift_once();
  }
  return sub_22D34B588();
}

uint64_t SymbolMetadataStore.sortPrivateScalars(_:)(char *a1, char *a2)
{
  uint64_t v5 = (uint64_t)v2[6];
  swift_retain();
  sub_22D32E15C(v5);
  v2[6] = a1;
  v2[7] = a2;
  uint64_t v8 = *v2;
  swift_bridgeObjectRetain_n();
  sub_22D32A990(&v8, v2);
  swift_bridgeObjectRelease();
  uint64_t v6 = v8;
  uint64_t result = swift_bridgeObjectRelease();
  char *v2 = v6;
  return result;
}

uint64_t SymbolMetadataStore.symbolMetadata(forSystemName:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for SymbolKey(0);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268568838);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  id v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v18 - v14;
  SymbolMetadataStore.symbolKey(forSystemName:)(a1, a2, (uint64_t *)((char *)&v18 - v14));
  sub_22D33DA04((uint64_t)v15, (uint64_t)v13, &qword_268568838);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v13, 1, v6) == 1)
  {
    uint64_t v16 = type metadata accessor for SymbolMetadata(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(a3, 1, 1, v16);
  }
  else
  {
    sub_22D33DA68((uint64_t)v13, (uint64_t)v9, type metadata accessor for SymbolKey);
    SymbolMetadataStore.symbolMetadata(for:)((uint64_t)v9, a3);
    sub_22D33DB38((uint64_t)v9, type metadata accessor for SymbolKey);
  }
  return sub_22D3415D4((uint64_t)v15, &qword_268568838);
}

uint64_t SymbolMetadataStore.symbolKey(forSystemName:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X8>)
{
  uint64_t v7 = *(void *)(v3 + 16);
  uint64_t v8 = *(void *)(v3 + 72);
  if (*(void *)(v7 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v9 = sub_22D3195C4(a1, a2);
    if (v10)
    {
      int v11 = *(_DWORD *)(*(void *)(v7 + 56) + 104 * v9);
      swift_bridgeObjectRelease();
      *a3 = v11;
      uint64_t v12 = type metadata accessor for SymbolKey(0);
      swift_storeEnumTagMultiPayload();
      id v13 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
      uint64_t v14 = a3;
      uint64_t v15 = 0;
      uint64_t v16 = v12;
LABEL_12:
      return v13(v14, v15, 1, v16);
    }
    swift_bridgeObjectRelease();
  }
  if (!*(void *)(v8 + 16))
  {
LABEL_11:
    uint64_t v23 = type metadata accessor for SymbolKey(0);
    id v13 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56);
    uint64_t v16 = v23;
    uint64_t v14 = a3;
    uint64_t v15 = 1;
    goto LABEL_12;
  }
  swift_bridgeObjectRetain();
  unint64_t v17 = sub_22D3195C4(a1, a2);
  if ((v18 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  int64_t v19 = (uint64_t *)(*(void *)(v8 + 56) + 16 * v17);
  uint64_t v20 = *v19;
  uint64_t v21 = v19[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  SymbolMetadataStore.symbolKey(forSystemName:)(v20, v21);
  return swift_bridgeObjectRelease();
}

void *SymbolMetadataStore.symbolMetadata(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for CustomSymbol();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v61 = (uint64_t)&v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268568840);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  int v11 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  id v13 = (char *)&v61 - v12;
  uint64_t v64 = sub_22D34B6B8();
  uint64_t v63 = *(void *)(v64 - 8);
  MEMORY[0x270FA5388](v64);
  char v62 = (char *)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for SymbolKey(0);
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  char v18 = (char *)&v61 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (int *)((char *)&v61 - v19);
  long long v21 = v2[7];
  long long v71 = v2[6];
  long long v72 = v21;
  long long v22 = v2[9];
  long long v73 = v2[8];
  long long v74 = v22;
  long long v23 = v2[3];
  long long v67 = v2[2];
  long long v68 = v23;
  long long v24 = v2[5];
  long long v69 = v2[4];
  long long v70 = v24;
  long long v25 = v2[1];
  long long v65 = *v2;
  long long v66 = v25;
  sub_22D33DAD0(a1, (uint64_t)&v61 - v19, type metadata accessor for SymbolKey);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_22D33DB38((uint64_t)v20, type metadata accessor for SymbolKey);
  }
  else
  {
    uint64_t v26 = *((void *)&v65 + 1);
    if (*(void *)(*((void *)&v65 + 1) + 16))
    {
      unint64_t v27 = sub_22D3229EC(*v20);
      if (v28)
      {
        uint64_t v29 = *(void *)(v26 + 56) + 104 * v27;
        int v30 = *(_DWORD *)v29;
        uint64_t v31 = *(void *)(v29 + 8);
        uint64_t v32 = *(void *)(v29 + 16);
        char v33 = *(unsigned char *)(v29 + 24);
        uint64_t v34 = *(void *)(v29 + 32);
        uint64_t v35 = *(void *)(v29 + 40);
        uint64_t v37 = *(void *)(v29 + 48);
        uint64_t v36 = *(void *)(v29 + 56);
        char v38 = *(unsigned char *)(v29 + 64);
        uint64_t v39 = *(void *)(v29 + 72);
        uint64_t v40 = *(void *)(v29 + 80);
        char v41 = *(unsigned char *)(v29 + 88);
        uint64_t v42 = *(void *)(v29 + 96);
        long long v43 = v72;
        *(_OWORD *)(a2 + 200) = v71;
        *(_OWORD *)(a2 + 216) = v43;
        long long v44 = v74;
        *(_OWORD *)(a2 + 232) = v73;
        *(_OWORD *)(a2 + 248) = v44;
        long long v45 = v68;
        *(_OWORD *)(a2 + 136) = v67;
        *(_OWORD *)(a2 + 152) = v45;
        long long v46 = v70;
        *(_OWORD *)(a2 + 168) = v69;
        *(_OWORD *)(a2 + 184) = v46;
        long long v47 = v66;
        *(_OWORD *)(a2 + 104) = v65;
        *(_DWORD *)a2 = v30;
        *(void *)(a2 + 8) = v31;
        *(void *)(a2 + 16) = v32;
        *(unsigned char *)(a2 + 24) = v33;
        *(void *)(a2 + 32) = v34;
        *(void *)(a2 + 40) = v35;
        *(void *)(a2 + 48) = v37;
        *(void *)(a2 + 56) = v36;
        *(unsigned char *)(a2 + 64) = v38;
        *(void *)(a2 + 72) = v39;
        *(void *)(a2 + 80) = v40;
        *(unsigned char *)(a2 + 88) = v41;
        *(void *)(a2 + 96) = v42;
        *(_OWORD *)(a2 + 120) = v47;
        type metadata accessor for SymbolMetadata.Backing(0);
        swift_storeEnumTagMultiPayload();
        uint64_t v48 = type metadata accessor for SymbolMetadata(0);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(a2, 0, 1, v48);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        return sub_22D3359E0(&v65);
      }
    }
  }
  sub_22D33DAD0(a1, (uint64_t)v18, type metadata accessor for SymbolKey);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v50 = v63;
    uint64_t v51 = (uint64_t)v62;
    uint64_t v52 = v64;
    (*(void (**)(char *, char *, uint64_t))(v63 + 32))(v62, v18, v64);
    uint64_t v53 = *((void *)&v72 + 1);
    if (*(void *)(*((void *)&v72 + 1) + 16) && (unint64_t v54 = sub_22D322BC0(v51), (v55 & 1) != 0))
    {
      sub_22D33DAD0(*(void *)(v53 + 56) + *(void *)(v6 + 72) * v54, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
      uint64_t v56 = 0;
    }
    else
    {
      uint64_t v56 = 1;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v13, v56, 1, v5);
    sub_22D33DA04((uint64_t)v13, (uint64_t)v11, &qword_268568840);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v5) == 1)
    {
      uint64_t v58 = type metadata accessor for SymbolMetadata(0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v58 - 8) + 56))(a2, 1, 1, v58);
    }
    else
    {
      uint64_t v59 = v61;
      sub_22D33DA68((uint64_t)v11, v61, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
      sub_22D33DAD0(v59, a2, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
      type metadata accessor for SymbolMetadata.Backing(0);
      swift_storeEnumTagMultiPayload();
      sub_22D33DB38(v59, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
      uint64_t v60 = type metadata accessor for SymbolMetadata(0);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v60 - 8) + 56))(a2, 0, 1, v60);
    }
    sub_22D3415D4((uint64_t)v13, &qword_268568840);
    return (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v50 + 8))(v51, v52);
  }
  else
  {
    sub_22D33DB38((uint64_t)v18, type metadata accessor for SymbolKey);
    uint64_t v57 = type metadata accessor for SymbolMetadata(0);
    return (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 56))(a2, 1, 1, v57);
  }
}

Swift::String_optional __swiftcall SymbolMetadataStore.modernSystemName(forAlias:)(Swift::String forAlias)
{
  object = forAlias._object;
  uint64_t countAndFlagsBits = forAlias._countAndFlagsBits;
  uint64_t v50 = type metadata accessor for CustomSymbol();
  MEMORY[0x270FA5388](v50);
  uint64_t v49 = (uint64_t)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = type metadata accessor for SymbolMetadata.Backing(0);
  uint64_t v4 = MEMORY[0x270FA5388](v54);
  uint64_t v48 = (uint64_t)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v53 = (char *)&v45 - v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268568848);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = type metadata accessor for SymbolMetadata(0);
  uint64_t v51 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  int v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268568838);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (_DWORD *)((char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = type metadata accessor for SymbolKey(0);
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  char v18 = (char *)&v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  SymbolMetadataStore.symbolKey(forSystemName:)(countAndFlagsBits, (uint64_t)object, v14);
  if ((*(unsigned int (**)(_DWORD *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    sub_22D3415D4((uint64_t)v14, &qword_268568838);
LABEL_13:
    uint64_t v32 = 0;
    char v33 = 0;
    goto LABEL_14;
  }
  uint64_t v19 = (uint64_t)v53;
  uint64_t v46 = countAndFlagsBits;
  long long v47 = object;
  sub_22D33DA68((uint64_t)v14, (uint64_t)v18, type metadata accessor for SymbolKey);
  SymbolMetadataStore.symbolMetadata(for:)((uint64_t)v18, (uint64_t)v9);
  uint64_t v20 = (uint64_t)v18;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v51 + 48))(v9, 1, v52) == 1)
  {
    sub_22D33DB38((uint64_t)v18, type metadata accessor for SymbolKey);
    sub_22D3415D4((uint64_t)v9, &qword_268568848);
    goto LABEL_13;
  }
  sub_22D33DA68((uint64_t)v9, (uint64_t)v11, type metadata accessor for SymbolMetadata);
  sub_22D33DAD0((uint64_t)v11, v19, type metadata accessor for SymbolMetadata.Backing);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v21 = v49;
    sub_22D33DA68(v19, v49, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
    uint64_t v22 = v50;
    long long v23 = (uint64_t *)(v21 + *(int *)(v50 + 20));
    uint64_t v25 = *v23;
    long long v24 = (void *)v23[1];
    swift_bridgeObjectRetain();
    sub_22D33DB38(v21, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
  }
  else
  {
    uint64_t v25 = *(void *)(v19 + 8);
    long long v24 = *(void **)(v19 + 16);
    uint64_t v52 = *(void *)(v19 + 40);
    long long v26 = *(_OWORD *)(v19 + 216);
    long long v61 = *(_OWORD *)(v19 + 200);
    long long v62 = v26;
    long long v27 = *(_OWORD *)(v19 + 248);
    long long v63 = *(_OWORD *)(v19 + 232);
    long long v64 = v27;
    long long v28 = *(_OWORD *)(v19 + 152);
    long long v57 = *(_OWORD *)(v19 + 136);
    long long v58 = v28;
    long long v29 = *(_OWORD *)(v19 + 184);
    long long v59 = *(_OWORD *)(v19 + 168);
    long long v60 = v29;
    long long v30 = *(_OWORD *)(v19 + 120);
    long long v55 = *(_OWORD *)(v19 + 104);
    long long v56 = v30;
    sub_22D335738(&v55);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v21 = v49;
    uint64_t v22 = v50;
  }
  if (v25 == v46 && v24 == v47)
  {
    swift_bridgeObjectRelease();
LABEL_12:
    sub_22D33DB38((uint64_t)v11, type metadata accessor for SymbolMetadata);
    sub_22D33DB38(v20, type metadata accessor for SymbolKey);
    goto LABEL_13;
  }
  char v31 = sub_22D34B9A8();
  swift_bridgeObjectRelease();
  if (v31) {
    goto LABEL_12;
  }
  uint64_t v36 = v48;
  sub_22D33DAD0((uint64_t)v11, v48, type metadata accessor for SymbolMetadata.Backing);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_22D33DA68(v36, v21, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
    uint64_t v37 = (uint64_t *)(v21 + *(int *)(v22 + 20));
    uint64_t v32 = *v37;
    char v33 = (void *)v37[1];
    swift_bridgeObjectRetain();
    sub_22D33DB38(v21, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
  }
  else
  {
    uint64_t v38 = v36;
    uint64_t v32 = *(void *)(v36 + 8);
    char v33 = *(void **)(v38 + 16);
    long long v39 = *(_OWORD *)(v38 + 216);
    long long v61 = *(_OWORD *)(v38 + 200);
    long long v62 = v39;
    long long v40 = *(_OWORD *)(v38 + 248);
    long long v63 = *(_OWORD *)(v38 + 232);
    long long v64 = v40;
    long long v41 = *(_OWORD *)(v38 + 152);
    long long v57 = *(_OWORD *)(v38 + 136);
    long long v58 = v41;
    long long v42 = *(_OWORD *)(v38 + 184);
    long long v59 = *(_OWORD *)(v38 + 168);
    long long v60 = v42;
    long long v43 = *(_OWORD *)(v38 + 120);
    long long v55 = *(_OWORD *)(v38 + 104);
    long long v56 = v43;
    sub_22D335738(&v55);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_22D33DB38((uint64_t)v11, type metadata accessor for SymbolMetadata);
  sub_22D33DB38(v20, type metadata accessor for SymbolKey);
LABEL_14:
  uint64_t v34 = v32;
  uint64_t v35 = v33;
  result.value._object = v35;
  result.value._uint64_t countAndFlagsBits = v34;
  return result;
}

double sub_22D339CD0@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = v4;
  uint64_t v7 = *(void *)(v4 + 96);
  if (!*(void *)(v7 + 16)) {
    goto LABEL_11;
  }
  uint64_t v11 = *a1;
  uint64_t v10 = a1[1];
  uint64_t v12 = *(void *)(v5 + 88);
  swift_bridgeObjectRetain();
  unint64_t v13 = sub_22D3195C4(a2, a3);
  if ((v14 & 1) == 0
    || (uint64_t v15 = *(void *)(*(void *)(v7 + 56) + 8 * v13),
        swift_bridgeObjectRetain(),
        swift_bridgeObjectRelease(),
        !*(void *)(v15 + 16)))
  {
LABEL_10:
    swift_bridgeObjectRelease();
LABEL_11:
    double result = 0.0;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    return result;
  }
  swift_bridgeObjectRetain();
  unint64_t v16 = sub_22D322A58(v11, v10);
  if ((v17 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  uint64_t v18 = *(void *)(v15 + 56) + 24 * v16;
  long long v21 = *(_OWORD *)v18;
  uint64_t v19 = *(void *)(v18 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)a4 = v21;
  *(void *)(a4 + 16) = v19;
  *(void *)(a4 + 24) = v12;
  swift_bridgeObjectRetain();
  return result;
}

uint64_t type metadata accessor for SymbolKey(uint64_t a1)
{
  return sub_22D34150C(a1, (uint64_t *)&unk_268568868);
}

uint64_t sub_22D339E24(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(v3 + 104);
  if (!*(void *)(v4 + 16)) {
    return 0;
  }
  uint64_t v8 = *a1;
  uint64_t v7 = a1[1];
  swift_bridgeObjectRetain();
  unint64_t v9 = sub_22D3195C4(a2, a3);
  if ((v10 & 1) == 0
    || (uint64_t v11 = *(void *)(*(void *)(v4 + 56) + 8 * v9),
        swift_bridgeObjectRetain(),
        swift_bridgeObjectRelease(),
        !*(void *)(v11 + 16)))
  {
LABEL_8:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  unint64_t v12 = sub_22D322A58(v8, v7);
  if ((v13 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  uint64_t v14 = *(void *)(*(void *)(v11 + 56) + 16 * v12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t SymbolMetadataStore.customSymbols.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SymbolMetadataStore.customSymbols.setter(uint64_t a1)
{
  swift_bridgeObjectRelease();
  *(void *)(v1 + 112) = a1;
  return sub_22D339F4C();
}

uint64_t sub_22D339F4C()
{
  uint64_t v1 = sub_22D34B6B8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v41 = (uint64_t)v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for CustomSymbol();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v8 = (char *)v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  char v10 = (char *)v35 - v9;
  uint64_t v11 = *(void *)(v0 + 112);
  swift_bridgeObjectRetain();
  unint64_t v12 = (void *)sub_22D32223C(MEMORY[0x263F8EE78]);
  if (*(void *)(v11 + 16))
  {
    uint64_t v42 = *(void *)(v11 + 16);
    uint64_t v36 = v0;
    uint64_t v37 = v2;
    uint64_t v13 = v11 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    uint64_t v14 = *(void *)(v5 + 72);
    long long v40 = (void (**)(uint64_t, char *, uint64_t))(v2 + 16);
    uint64_t v38 = (void (**)(uint64_t, uint64_t))(v2 + 8);
    v35[1] = v11;
    swift_bridgeObjectRetain();
    uint64_t v15 = v41;
    long long v39 = v10;
    while (1)
    {
      sub_22D33DAD0(v13, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
      char v17 = *v40;
      uint64_t v18 = v1;
      (*v40)(v15, v10, v1);
      uint64_t v19 = (uint64_t)v10;
      uint64_t v20 = (uint64_t)v8;
      sub_22D33DAD0(v19, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      long long v43 = v12;
      unint64_t v23 = sub_22D322BC0(v15);
      uint64_t v24 = v12[2];
      BOOL v25 = (v22 & 1) == 0;
      uint64_t v26 = v24 + v25;
      if (__OFADD__(v24, v25)) {
        break;
      }
      char v27 = v22;
      if (v12[3] >= v26)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          sub_22D327940();
        }
      }
      else
      {
        sub_22D325378(v26, isUniquelyReferenced_nonNull_native);
        unint64_t v28 = sub_22D322BC0(v41);
        if ((v27 & 1) != (v29 & 1)) {
          goto LABEL_18;
        }
        unint64_t v23 = v28;
      }
      uint64_t v1 = v18;
      uint64_t v15 = v41;
      unint64_t v12 = v43;
      if (v27)
      {
        uint64_t v16 = v43[7] + v23 * v14;
        uint64_t v8 = (char *)v20;
        sub_22D341570(v20, v16);
      }
      else
      {
        v43[(v23 >> 6) + 8] |= 1 << v23;
        v17(v12[6] + *(void *)(v37 + 72) * v23, (char *)v15, v18);
        uint64_t v30 = v12[7] + v23 * v14;
        uint64_t v8 = (char *)v20;
        sub_22D33DA68(v20, v30, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
        uint64_t v31 = v12[2];
        BOOL v32 = __OFADD__(v31, 1);
        uint64_t v33 = v31 + 1;
        if (v32) {
          goto LABEL_17;
        }
        v12[2] = v33;
        unint64_t v12 = v43;
      }
      swift_bridgeObjectRelease();
      (*v38)(v15, v18);
      char v10 = v39;
      sub_22D33DB38((uint64_t)v39, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
      v13 += v14;
      if (!--v42)
      {
        swift_bridgeObjectRelease();
        uint64_t v0 = v36;
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    uint64_t result = sub_22D34B9E8();
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)(v0 + 120) = v12;
  }
  return result;
}

uint64_t (*SymbolMetadataStore.customSymbols.modify(void *a1))(uint64_t a1, char a2)
{
  *a1 = v1;
  return sub_22D33A340;
}

uint64_t sub_22D33A340(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return sub_22D339F4C();
  }
  return result;
}

size_t SymbolMetadataStore.symbolKeys(matching:)(long long *a1)
{
  uint64_t v3 = 0;
  uint64_t v4 = type metadata accessor for SymbolKey(0);
  uint64_t v77 = *(void *)(v4 - 8);
  uint64_t v78 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v72 = (uint64_t)&v67 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v71 = (uint64_t)&v67 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v67 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v74 = (uint64_t)&v67 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  long long v68 = (char *)&v67 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  long long v73 = (char *)&v67 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v75 = (uint64_t)&v67 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  char v22 = (char *)&v67 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v67 - v23;
  long long v25 = a1[1];
  long long v100 = *a1;
  long long v101 = v25;
  long long v26 = a1[3];
  long long v102 = a1[2];
  long long v103 = v26;
  long long v27 = v1[7];
  long long v96 = v1[6];
  long long v97 = v27;
  long long v28 = v1[9];
  long long v98 = v1[8];
  long long v99 = v28;
  long long v29 = v1[3];
  long long v92 = v1[2];
  long long v93 = v29;
  long long v30 = v1[5];
  long long v94 = v1[4];
  long long v95 = v30;
  long long v31 = v1[1];
  long long v90 = *v1;
  long long v91 = v31;
  uint64_t v32 = sub_22D338048();
  sub_22D3407A4((uint64_t)&v100, (uint64_t)v105, &qword_268568850);
  size_t result = sub_22D3407A4((uint64_t)v105, (uint64_t)&v106, &qword_268568850);
  uint64_t v34 = v107;
  uint64_t v76 = v11;
  if (!v107) {
    goto LABEL_19;
  }
  uint64_t v35 = v106;
  swift_bridgeObjectRelease();
  if (v35 == 7105633 && v34 == 0xE300000000000000 || (sub_22D34B9A8() & 1) != 0)
  {
    long long v86 = v96;
    long long v87 = v97;
    long long v88 = v98;
    long long v89 = v99;
    long long v82 = v92;
    long long v83 = v93;
    long long v84 = v94;
    long long v85 = v95;
    long long v80 = v90;
    long long v81 = v91;
    size_t result = sub_22D338048();
    size_t v36 = result;
    uint64_t v32 = MEMORY[0x263F8EE78];
    *(void *)&long long v80 = MEMORY[0x263F8EE78];
    uint64_t v70 = *(void *)(result + 16);
    if (v70)
    {
      long long v69 = v22;
      uint64_t v67 = 0;
      unint64_t v37 = 0;
      uint64_t v38 = MEMORY[0x263F8EE78];
      uint64_t v11 = v76;
      while (v37 < *(void *)(v36 + 16))
      {
        unint64_t v39 = (*(unsigned __int8 *)(v77 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v77 + 80);
        uint64_t v40 = *(void *)(v77 + 72);
        sub_22D33DAD0(v36 + v39 + v40 * v37, (uint64_t)v24, type metadata accessor for SymbolKey);
        sub_22D33DAD0((uint64_t)v24, (uint64_t)v22, type metadata accessor for SymbolKey);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          sub_22D33DB38((uint64_t)v22, type metadata accessor for SymbolKey);
          size_t result = sub_22D33DB38((uint64_t)v24, type metadata accessor for SymbolKey);
        }
        else
        {
          sub_22D33DA68((uint64_t)v24, v75, type metadata accessor for SymbolKey);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            sub_22D33C9EC(0, *(void *)(v38 + 16) + 1, 1);
          }
          uint64_t v38 = v80;
          unint64_t v42 = *(void *)(v80 + 16);
          unint64_t v41 = *(void *)(v80 + 24);
          if (v42 >= v41 >> 1)
          {
            sub_22D33C9EC(v41 > 1, v42 + 1, 1);
            uint64_t v38 = v80;
          }
          *(void *)(v38 + 16) = v42 + 1;
          size_t result = sub_22D33DA68(v75, v38 + v39 + v42 * v40, type metadata accessor for SymbolKey);
          uint64_t v11 = v76;
        }
        if (v70 == ++v37)
        {
          uint64_t v32 = v80;
          uint64_t v3 = v67;
          goto LABEL_18;
        }
      }
      __break(1u);
      goto LABEL_59;
    }
    uint64_t v11 = v76;
LABEL_18:
    size_t result = swift_bridgeObjectRelease();
LABEL_19:
    if ((BYTE1(v102) & 1) == 0) {
      goto LABEL_20;
    }
LABEL_32:
    if ((BYTE2(v102) & 1) == 0)
    {
      *(void *)&long long v80 = MEMORY[0x263F8EE78];
      uint64_t v52 = *(void *)(v32 + 16);
      if (v52)
      {
        unint64_t v53 = 0;
        while (v53 < *(void *)(v32 + 16))
        {
          unint64_t v54 = (*(unsigned __int8 *)(v77 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v77 + 80);
          uint64_t v55 = *(void *)(v77 + 72);
          sub_22D33DAD0(v32 + v54 + v55 * v53, (uint64_t)v11, type metadata accessor for SymbolKey);
          uint64_t v56 = v71;
          sub_22D33DAD0((uint64_t)v11, v71, type metadata accessor for SymbolKey);
          int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
          sub_22D33DB38(v56, type metadata accessor for SymbolKey);
          if (EnumCaseMultiPayload == 1)
          {
            size_t result = sub_22D33DB38((uint64_t)v11, type metadata accessor for SymbolKey);
          }
          else
          {
            sub_22D33DA68((uint64_t)v11, v72, type metadata accessor for SymbolKey);
            uint64_t v58 = v80;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_22D33C9EC(0, *(void *)(v58 + 16) + 1, 1);
              uint64_t v58 = v80;
            }
            unint64_t v60 = *(void *)(v58 + 16);
            unint64_t v59 = *(void *)(v58 + 24);
            if (v60 >= v59 >> 1)
            {
              sub_22D33C9EC(v59 > 1, v60 + 1, 1);
              uint64_t v58 = v80;
            }
            *(void *)(v58 + 16) = v60 + 1;
            size_t result = sub_22D33DA68(v72, v58 + v54 + v60 * v55, type metadata accessor for SymbolKey);
            uint64_t v11 = v76;
          }
          if (v52 == ++v53) {
            goto LABEL_44;
          }
        }
        goto LABEL_60;
      }
LABEL_44:
      swift_bridgeObjectRelease();
      uint64_t v32 = v80;
    }
    if ((BYTE3(v102) & 1) == 0)
    {
      sub_22D3359E0(&v90);
      uint64_t v61 = sub_22D33FBB0(v32, (uint64_t)&v90);
      sub_22D335738(&v90);
      swift_bridgeObjectRelease();
      uint64_t v32 = v61;
    }
    if (*(void *)(*((void *)&v102 + 1) + 16))
    {
      sub_22D3402CC((uint64_t)&v100);
      uint64_t v62 = sub_22D340044(v32, (uint64_t)&v100);
      sub_22D340334((uint64_t)&v100);
      swift_bridgeObjectRelease();
      uint64_t v32 = v62;
    }
    if (*(void *)(v103 + 16))
    {
      sub_22D3359E0(&v90);
      sub_22D3402CC((uint64_t)&v100);
      uint64_t v63 = sub_22D34039C(v32, (uint64_t)&v90, (uint64_t)&v100);
      sub_22D340334((uint64_t)&v100);
      sub_22D335738(&v90);
      swift_bridgeObjectRelease();
      uint64_t v32 = v63;
    }
    sub_22D3407A4((uint64_t)&v101, (uint64_t)v104, &qword_268568858);
    sub_22D3407A4((uint64_t)v104, (uint64_t)&v108, &qword_268568858);
    if (v109)
    {
      long long v86 = v96;
      long long v87 = v97;
      long long v88 = v98;
      long long v89 = v99;
      long long v82 = v92;
      long long v83 = v93;
      long long v84 = v94;
      long long v85 = v95;
      long long v80 = v90;
      long long v81 = v91;
      v79[0] = v100;
      v79[1] = v101;
      v79[2] = v102;
      v79[3] = v103;
      uint64_t v64 = sub_22D33AD38(v32, v108, v109, (uint64_t)v79, v102);
      swift_bridgeObjectRelease();
      return v64;
    }
    return v32;
  }
  long long v86 = v96;
  long long v87 = v97;
  long long v88 = v98;
  long long v89 = v99;
  long long v82 = v92;
  long long v83 = v93;
  long long v84 = v94;
  long long v85 = v95;
  long long v80 = v90;
  long long v81 = v91;
  *(void *)&v79[0] = v35;
  *((void *)&v79[0] + 1) = v34;
  uint64_t v65 = sub_22D33845C((uint64_t *)v79);
  if (!*(void *)(v65 + 16))
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  long long v86 = v96;
  long long v87 = v97;
  long long v88 = v98;
  long long v89 = v99;
  long long v82 = v92;
  long long v83 = v93;
  long long v84 = v94;
  long long v85 = v95;
  long long v80 = v90;
  long long v81 = v91;
  size_t v66 = sub_22D338048();
  uint64_t v32 = sub_22D33F988(v66, v65);
  swift_bridgeObjectRelease();
  size_t result = swift_bridgeObjectRelease();
  uint64_t v11 = v76;
  if (BYTE1(v102)) {
    goto LABEL_32;
  }
LABEL_20:
  *(void *)&long long v80 = MEMORY[0x263F8EE78];
  uint64_t v43 = *(void *)(v32 + 16);
  uint64_t v67 = v3;
  if (!v43)
  {
LABEL_31:
    size_t result = swift_bridgeObjectRelease();
    uint64_t v32 = v80;
    goto LABEL_32;
  }
  unint64_t v44 = 0;
  uint64_t v45 = (uint64_t)v68;
  uint64_t v46 = (uint64_t)v73;
  while (v44 < *(void *)(v32 + 16))
  {
    unint64_t v47 = (*(unsigned __int8 *)(v77 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v77 + 80);
    uint64_t v48 = *(void *)(v77 + 72);
    sub_22D33DAD0(v32 + v47 + v48 * v44, v46, type metadata accessor for SymbolKey);
    sub_22D33DAD0(v46, v45, type metadata accessor for SymbolKey);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_22D33DB38(v45, type metadata accessor for SymbolKey);
      sub_22D33DA68(v46, v74, type metadata accessor for SymbolKey);
      uint64_t v49 = v80;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_22D33C9EC(0, *(void *)(v49 + 16) + 1, 1);
        uint64_t v49 = v80;
      }
      unint64_t v51 = *(void *)(v49 + 16);
      unint64_t v50 = *(void *)(v49 + 24);
      if (v51 >= v50 >> 1)
      {
        sub_22D33C9EC(v50 > 1, v51 + 1, 1);
        uint64_t v49 = v80;
      }
      *(void *)(v49 + 16) = v51 + 1;
      size_t result = sub_22D33DA68(v74, v49 + v47 + v51 * v48, type metadata accessor for SymbolKey);
      uint64_t v11 = v76;
      uint64_t v45 = (uint64_t)v68;
    }
    else
    {
      size_t result = sub_22D33DB38(v46, type metadata accessor for SymbolKey);
    }
    if (v43 == ++v44) {
      goto LABEL_31;
    }
  }
LABEL_59:
  __break(1u);
LABEL_60:
  __break(1u);
  return result;
}

uint64_t sub_22D33AD38(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v11 = type metadata accessor for CustomSymbol();
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v50 = (uint64_t)v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for SymbolMetadataStore.RelevantSymbol(0);
  uint64_t v55 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v59 = (uint64_t)v49 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for SymbolKey(0);
  uint64_t v56 = *(void *)(v18 - 8);
  uint64_t v57 = v18;
  MEMORY[0x270FA5388](v18);
  uint64_t v58 = (_DWORD *)((char *)v49 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  long long v20 = v6[7];
  v62[6] = v6[6];
  v62[7] = v20;
  long long v21 = v6[9];
  v62[8] = v6[8];
  v62[9] = v21;
  long long v22 = v6[3];
  v62[2] = v6[2];
  v62[3] = v22;
  long long v23 = v6[5];
  v62[4] = v6[4];
  v62[5] = v23;
  long long v24 = v6[1];
  v62[0] = *v6;
  v62[1] = v24;
  swift_bridgeObjectRetain();
  uint64_t v26 = sub_22D335B14(a2, a3, a5);
  uint64_t v27 = v25;
  uint64_t v29 = v28;
  if (*(void *)(v26 + 16) || *(void *)(v25 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v30 = swift_bridgeObjectRetain();
    uint64_t v31 = sub_22D33F710(v30, v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_22D3359E0(v62);
    swift_bridgeObjectRetain();
    uint64_t v32 = sub_22D33DF50(a1, v62, v26, v27, v29, v31);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_22D335738(v62);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)&v60[0] = v32;
    swift_bridgeObjectRetain();
    sub_22D33B548((void **)v60);
    swift_bridgeObjectRelease();
    uint64_t v33 = *(void *)&v60[0];
    int64_t v34 = *(void *)(*(void *)&v60[0] + 16);
    if (v34)
    {
      uint64_t v61 = MEMORY[0x263F8EE78];
      sub_22D33C9EC(0, v34, 0);
      uint64_t v35 = *(unsigned __int8 *)(v55 + 80);
      v49[1] = v33;
      uint64_t v36 = v33 + ((v35 + 32) & ~v35);
      uint64_t v55 = *(void *)(v55 + 72);
      do
      {
        uint64_t v37 = v59;
        sub_22D33DAD0(v36, v59, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        sub_22D33DAD0(v37 + *(int *)(v16 + 20), (uint64_t)v15, type metadata accessor for SymbolMetadata.Backing);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          uint64_t v38 = v50;
          sub_22D33DA68((uint64_t)v15, v50, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
          uint64_t v39 = sub_22D34B6B8();
          (*(void (**)(_DWORD *, uint64_t, uint64_t))(*(void *)(v39 - 8) + 16))(v58, v38, v39);
          sub_22D33DB38(v38, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
        }
        else
        {
          int v54 = *(_DWORD *)v15;
          uint64_t v40 = *((void *)v15 + 5);
          uint64_t v51 = *((void *)v15 + 2);
          uint64_t v52 = v40;
          uint64_t v53 = *((void *)v15 + 10);
          long long v41 = *(_OWORD *)(v15 + 216);
          v60[6] = *(_OWORD *)(v15 + 200);
          v60[7] = v41;
          long long v42 = *(_OWORD *)(v15 + 248);
          v60[8] = *(_OWORD *)(v15 + 232);
          v60[9] = v42;
          long long v43 = *(_OWORD *)(v15 + 152);
          v60[2] = *(_OWORD *)(v15 + 136);
          v60[3] = v43;
          long long v44 = *(_OWORD *)(v15 + 184);
          v60[4] = *(_OWORD *)(v15 + 168);
          v60[5] = v44;
          long long v45 = *(_OWORD *)(v15 + 120);
          v60[0] = *(_OWORD *)(v15 + 104);
          v60[1] = v45;
          sub_22D335738(v60);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          *uint64_t v58 = v54;
        }
        swift_storeEnumTagMultiPayload();
        sub_22D33DB38(v59, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        a1 = v61;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_22D33C9EC(0, *(void *)(a1 + 16) + 1, 1);
          a1 = v61;
        }
        unint64_t v47 = *(void *)(a1 + 16);
        unint64_t v46 = *(void *)(a1 + 24);
        if (v47 >= v46 >> 1)
        {
          sub_22D33C9EC(v46 > 1, v47 + 1, 1);
          a1 = v61;
        }
        *(void *)(a1 + 16) = v47 + 1;
        sub_22D33DA68((uint64_t)v58, a1+ ((*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80))+ *(void *)(v56 + 72) * v47, type metadata accessor for SymbolKey);
        v36 += v55;
        --v34;
      }
      while (v34);
      swift_release();
    }
    else
    {
      swift_release();
      return MEMORY[0x263F8EE78];
    }
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return a1;
}

void *SymbolMetadataStore.symbolMetadata(matching:)(uint64_t a1)
{
  char v2 = *(unsigned char *)(a1 + 32);
  char v3 = *(unsigned char *)(a1 + 33);
  char v4 = *(unsigned char *)(a1 + 34);
  char v5 = *(unsigned char *)(a1 + 35);
  uint64_t v6 = *(void *)(a1 + 56);
  long long v7 = v1[7];
  v23[6] = v1[6];
  v23[7] = v7;
  long long v8 = v1[9];
  v23[8] = v1[8];
  v23[9] = v8;
  long long v9 = v1[3];
  v23[2] = v1[2];
  v23[3] = v9;
  long long v10 = v1[5];
  v23[4] = v1[4];
  v23[5] = v10;
  long long v11 = v1[1];
  v23[0] = *v1;
  v23[1] = v11;
  long long v12 = *(_OWORD *)(a1 + 16);
  v16[0] = *(_OWORD *)a1;
  v16[1] = v12;
  char v17 = v2;
  char v18 = v3;
  char v19 = v4;
  char v20 = v5;
  long long v21 = *(_OWORD *)(a1 + 40);
  uint64_t v22 = v6;
  size_t v13 = SymbolMetadataStore.symbolKeys(matching:)(v16);
  sub_22D3359E0(v23);
  uint64_t v14 = sub_22D33ED00(v13, v23);
  sub_22D335738(v23);
  swift_bridgeObjectRelease();
  return v14;
}

void *SymbolMetadataStore.localizationOverrideBundle.getter()
{
  uint64_t v1 = *(void **)(v0 + 128);
  id v2 = v1;
  return v1;
}

void SymbolMetadataStore.localizationOverrideBundle.setter(uint64_t a1)
{
  *(void *)(v1 + 128) = a1;
}

uint64_t (*SymbolMetadataStore.localizationOverrideBundle.modify())()
{
  return nullsub_1;
}

uint64_t SymbolMetadataStore.localizationOverrideTableName.getter()
{
  uint64_t v1 = *(void *)(v0 + 136);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SymbolMetadataStore.localizationOverrideTableName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 136) = a1;
  *(void *)(v2 + 144) = a2;
  return result;
}

uint64_t (*SymbolMetadataStore.localizationOverrideTableName.modify())()
{
  return nullsub_1;
}

uint64_t sub_22D33B548(void **a1)
{
  uint64_t v2 = *(void *)(type metadata accessor for SymbolMetadataStore.RelevantSymbol(0) - 8);
  char v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    char v3 = (void *)sub_22D33D2D0(v3);
  }
  uint64_t v4 = v3[2];
  v6[0] = (char *)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  uint64_t result = sub_22D33B5F0(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_22D33B5F0(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v128 = type metadata accessor for SymbolMetadataStore.RelevantSymbol(0);
  uint64_t v4 = *(void *)(v128 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v128);
  uint64_t v123 = (uint64_t)&v118 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v134 = (uint64_t)&v118 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v132 = (uint64_t *)((char *)&v118 - v10);
  MEMORY[0x270FA5388](v9);
  uint64_t v131 = (uint64_t *)((char *)&v118 - v11);
  uint64_t v12 = a1[1];
  uint64_t result = sub_22D34B988();
  if (result >= v12)
  {
    if (v12 < 0) {
      goto LABEL_140;
    }
    if (v12) {
      return sub_22D33C050(0, v12, 1, a1);
    }
    return result;
  }
  if (v12 >= 0) {
    uint64_t v14 = v12;
  }
  else {
    uint64_t v14 = v12 + 1;
  }
  if (v12 < -1) {
    goto LABEL_139;
  }
  uint64_t v120 = result;
  if (v12 > 1)
  {
    uint64_t v15 = v14 >> 1;
    uint64_t result = sub_22D34B808();
    *(void *)(result + 16) = v15;
    uint64_t v16 = *(unsigned __int8 *)(v4 + 80);
    uint64_t v119 = result;
    unint64_t v125 = result + ((v16 + 32) & ~v16);
LABEL_12:
    uint64_t v18 = 0;
    uint64_t v17 = MEMORY[0x263F8EE78];
    uint64_t v126 = a1;
    uint64_t v127 = v4;
    while (1)
    {
      uint64_t v20 = v18;
      uint64_t v21 = v18 + 1;
      if (v18 + 1 >= v12)
      {
        uint64_t v27 = v18 + 1;
      }
      else
      {
        uint64_t v22 = *a1;
        uint64_t v136 = *(void *)(v4 + 72);
        long long v23 = v131;
        sub_22D33DAD0(v22 + v136 * v21, (uint64_t)v131, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        uint64_t v24 = v22 + v136 * v20;
        uint64_t v124 = v20;
        uint64_t v25 = v132;
        sub_22D33DAD0(v24, (uint64_t)v132, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        uint64_t v133 = *v23;
        uint64_t v130 = *v25;
        uint64_t v26 = (uint64_t)v25;
        uint64_t v20 = v124;
        sub_22D33DB38(v26, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        uint64_t result = sub_22D33DB38((uint64_t)v23, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        uint64_t v27 = v20 + 2;
        uint64_t v135 = v12;
        uint64_t v122 = v22;
        if (v20 + 2 >= v12)
        {
          uint64_t v4 = v127;
        }
        else
        {
          uint64_t v121 = v17;
          uint64_t v129 = v136 * v21;
          uint64_t v28 = v22;
          uint64_t v29 = v136 * v27;
          while (1)
          {
            uint64_t v30 = v27;
            uint64_t v31 = v131;
            int v32 = v130 < v133;
            sub_22D33DAD0(v28 + v29, (uint64_t)v131, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
            uint64_t v33 = v132;
            sub_22D33DAD0(v28 + v129, (uint64_t)v132, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
            int v34 = *v33 >= *v31;
            sub_22D33DB38((uint64_t)v33, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
            uint64_t result = sub_22D33DB38((uint64_t)v31, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
            if (v32 == v34) {
              break;
            }
            ++v27;
            v28 += v136;
            uint64_t v12 = v135;
            if (v135 == v30 + 1)
            {
              uint64_t v27 = v135;
              a1 = v126;
              uint64_t v4 = v127;
              uint64_t v17 = v121;
              uint64_t v20 = v124;
              goto LABEL_24;
            }
          }
          a1 = v126;
          uint64_t v4 = v127;
          uint64_t v17 = v121;
          uint64_t v20 = v124;
          uint64_t v12 = v135;
        }
LABEL_24:
        if (v130 < v133)
        {
          if (v27 < v20) {
            goto LABEL_141;
          }
          if (v20 < v27)
          {
            uint64_t v121 = v17;
            uint64_t v118 = v2;
            uint64_t v35 = v20;
            uint64_t v36 = 0;
            uint64_t v37 = v136;
            uint64_t v38 = v136 * (v27 - 1);
            uint64_t v39 = v27 * v136;
            uint64_t v40 = v35;
            uint64_t v41 = v35 * v136;
            do
            {
              if (v40 != v27 + v36 - 1)
              {
                uint64_t v42 = v122;
                if (!v122) {
                  goto LABEL_146;
                }
                unint64_t v43 = v122 + v41;
                sub_22D33DA68(v122 + v41, v123, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
                if (v41 < v38 || v43 >= v42 + v39)
                {
                  swift_arrayInitWithTakeFrontToBack();
                }
                else if (v41 != v38)
                {
                  swift_arrayInitWithTakeBackToFront();
                }
                uint64_t result = sub_22D33DA68(v123, v42 + v38, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
                uint64_t v12 = v135;
                uint64_t v37 = v136;
              }
              ++v40;
              --v36;
              v38 -= v37;
              v39 -= v37;
              v41 += v37;
            }
            while (v40 < v27 + v36);
            uint64_t v2 = v118;
            a1 = v126;
            uint64_t v4 = v127;
            uint64_t v17 = v121;
            uint64_t v20 = v124;
          }
        }
      }
      if (v27 < v12)
      {
        if (__OFSUB__(v27, v20)) {
          goto LABEL_138;
        }
        if (v27 - v20 < v120)
        {
          if (__OFADD__(v20, v120)) {
            goto LABEL_142;
          }
          if (v20 + v120 >= v12) {
            uint64_t v44 = v12;
          }
          else {
            uint64_t v44 = v20 + v120;
          }
          if (v44 < v20)
          {
LABEL_143:
            __break(1u);
LABEL_144:
            __break(1u);
LABEL_145:
            __break(1u);
LABEL_146:
            __break(1u);
LABEL_147:
            __break(1u);
            return result;
          }
          if (v27 != v44)
          {
            uint64_t v124 = v20;
            uint64_t v121 = v17;
            uint64_t v122 = v44;
            uint64_t v118 = v2;
            uint64_t v45 = *(void *)(v4 + 72);
            uint64_t v46 = v45 * (v27 - 1);
            uint64_t v129 = v45;
            uint64_t v47 = v27 * v45;
            do
            {
              uint64_t v49 = 0;
              uint64_t v50 = v124;
              uint64_t v133 = v27;
              uint64_t v130 = v47;
              while (1)
              {
                uint64_t v135 = v50;
                uint64_t v51 = *a1;
                uint64_t v52 = v47 + v49 + *a1;
                uint64_t v53 = v131;
                sub_22D33DAD0(v52, (uint64_t)v131, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
                uint64_t v54 = v46;
                uint64_t v55 = v46 + v49 + v51;
                uint64_t v56 = v132;
                sub_22D33DAD0(v55, (uint64_t)v132, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
                uint64_t v136 = *v53;
                uint64_t v57 = *v56;
                sub_22D33DB38((uint64_t)v56, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
                uint64_t result = sub_22D33DB38((uint64_t)v53, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
                if (v57 >= v136) {
                  break;
                }
                uint64_t v58 = *a1;
                if (!*a1) {
                  goto LABEL_144;
                }
                uint64_t v47 = v130;
                uint64_t v46 = v54;
                uint64_t v59 = v58 + v54 + v49;
                sub_22D33DA68(v58 + v130 + v49, v134, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
                swift_arrayInitWithTakeFrontToBack();
                uint64_t result = sub_22D33DA68(v134, v59, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
                v49 -= v129;
                uint64_t v50 = v135 + 1;
                uint64_t v48 = v133;
                if (v133 == v135 + 1) {
                  goto LABEL_49;
                }
              }
              uint64_t v48 = v133;
              uint64_t v46 = v54;
              uint64_t v47 = v130;
LABEL_49:
              uint64_t v27 = v48 + 1;
              v46 += v129;
              v47 += v129;
            }
            while (v27 != v122);
            uint64_t v27 = v122;
            uint64_t v2 = v118;
            uint64_t v17 = v121;
            uint64_t v20 = v124;
          }
        }
      }
      if (v27 < v20) {
        goto LABEL_133;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v133 = v27;
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_22D33C7B8(0, *(void *)(v17 + 16) + 1, 1, (char *)v17);
        uint64_t v17 = result;
      }
      unint64_t v61 = *(void *)(v17 + 16);
      unint64_t v60 = *(void *)(v17 + 24);
      unint64_t v19 = v61 + 1;
      if (v61 >= v60 >> 1)
      {
        uint64_t result = (uint64_t)sub_22D33C7B8((char *)(v60 > 1), v61 + 1, 1, (char *)v17);
        uint64_t v17 = result;
      }
      *(void *)(v17 + 16) = v19;
      uint64_t v62 = v17 + 32;
      uint64_t v63 = (uint64_t *)(v17 + 32 + 16 * v61);
      uint64_t v64 = v133;
      uint64_t *v63 = v20;
      v63[1] = v64;
      if (v61)
      {
        while (1)
        {
          unint64_t v65 = v19 - 1;
          if (v19 >= 4)
          {
            unint64_t v70 = v62 + 16 * v19;
            uint64_t v71 = *(void *)(v70 - 64);
            uint64_t v72 = *(void *)(v70 - 56);
            BOOL v76 = __OFSUB__(v72, v71);
            uint64_t v73 = v72 - v71;
            if (v76) {
              goto LABEL_122;
            }
            uint64_t v75 = *(void *)(v70 - 48);
            uint64_t v74 = *(void *)(v70 - 40);
            BOOL v76 = __OFSUB__(v74, v75);
            uint64_t v68 = v74 - v75;
            char v69 = v76;
            if (v76) {
              goto LABEL_123;
            }
            unint64_t v77 = v19 - 2;
            uint64_t v78 = (uint64_t *)(v62 + 16 * (v19 - 2));
            uint64_t v80 = *v78;
            uint64_t v79 = v78[1];
            BOOL v76 = __OFSUB__(v79, v80);
            uint64_t v81 = v79 - v80;
            if (v76) {
              goto LABEL_124;
            }
            BOOL v76 = __OFADD__(v68, v81);
            uint64_t v82 = v68 + v81;
            if (v76) {
              goto LABEL_126;
            }
            if (v82 >= v73)
            {
              long long v100 = (uint64_t *)(v62 + 16 * v65);
              uint64_t v102 = *v100;
              uint64_t v101 = v100[1];
              BOOL v76 = __OFSUB__(v101, v102);
              uint64_t v103 = v101 - v102;
              if (v76) {
                goto LABEL_132;
              }
              BOOL v93 = v68 < v103;
              goto LABEL_93;
            }
          }
          else
          {
            if (v19 != 3)
            {
              uint64_t v94 = *(void *)(v17 + 32);
              uint64_t v95 = *(void *)(v17 + 40);
              BOOL v76 = __OFSUB__(v95, v94);
              uint64_t v87 = v95 - v94;
              char v88 = v76;
              goto LABEL_87;
            }
            uint64_t v67 = *(void *)(v17 + 32);
            uint64_t v66 = *(void *)(v17 + 40);
            BOOL v76 = __OFSUB__(v66, v67);
            uint64_t v68 = v66 - v67;
            char v69 = v76;
          }
          if (v69) {
            goto LABEL_125;
          }
          unint64_t v77 = v19 - 2;
          long long v83 = (uint64_t *)(v62 + 16 * (v19 - 2));
          uint64_t v85 = *v83;
          uint64_t v84 = v83[1];
          BOOL v86 = __OFSUB__(v84, v85);
          uint64_t v87 = v84 - v85;
          char v88 = v86;
          if (v86) {
            goto LABEL_127;
          }
          long long v89 = (uint64_t *)(v62 + 16 * v65);
          uint64_t v91 = *v89;
          uint64_t v90 = v89[1];
          BOOL v76 = __OFSUB__(v90, v91);
          uint64_t v92 = v90 - v91;
          if (v76) {
            goto LABEL_129;
          }
          if (__OFADD__(v87, v92)) {
            goto LABEL_131;
          }
          if (v87 + v92 >= v68)
          {
            BOOL v93 = v68 < v92;
LABEL_93:
            if (v93) {
              unint64_t v65 = v77;
            }
            goto LABEL_95;
          }
LABEL_87:
          if (v88) {
            goto LABEL_128;
          }
          long long v96 = (uint64_t *)(v62 + 16 * v65);
          uint64_t v98 = *v96;
          uint64_t v97 = v96[1];
          BOOL v76 = __OFSUB__(v97, v98);
          uint64_t v99 = v97 - v98;
          if (v76) {
            goto LABEL_130;
          }
          if (v99 < v87) {
            goto LABEL_14;
          }
LABEL_95:
          unint64_t v104 = v65 - 1;
          if (v65 - 1 >= v19)
          {
            __break(1u);
LABEL_119:
            __break(1u);
LABEL_120:
            __break(1u);
LABEL_121:
            __break(1u);
LABEL_122:
            __break(1u);
LABEL_123:
            __break(1u);
LABEL_124:
            __break(1u);
LABEL_125:
            __break(1u);
LABEL_126:
            __break(1u);
LABEL_127:
            __break(1u);
LABEL_128:
            __break(1u);
LABEL_129:
            __break(1u);
LABEL_130:
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
LABEL_136:
            __break(1u);
LABEL_137:
            __break(1u);
LABEL_138:
            __break(1u);
LABEL_139:
            __break(1u);
LABEL_140:
            __break(1u);
LABEL_141:
            __break(1u);
LABEL_142:
            __break(1u);
            goto LABEL_143;
          }
          if (!*v126) {
            goto LABEL_145;
          }
          uint64_t v105 = v17;
          uint64_t v106 = (uint64_t *)(v62 + 16 * v104);
          uint64_t v107 = *v106;
          unint64_t v108 = (void *)(v62 + 16 * v65);
          uint64_t v109 = v108[1];
          uint64_t result = sub_22D33C30C(*v126 + *(void *)(v127 + 72) * *v106, *v126 + *(void *)(v127 + 72) * *v108, *v126 + *(void *)(v127 + 72) * v109, v125);
          if (v2) {
            goto LABEL_116;
          }
          if (v109 < v107) {
            goto LABEL_119;
          }
          if (v65 > *(void *)(v105 + 16)) {
            goto LABEL_120;
          }
          uint64_t *v106 = v107;
          *(void *)(v62 + 16 * v104 + 8) = v109;
          unint64_t v110 = *(void *)(v105 + 16);
          if (v65 >= v110) {
            goto LABEL_121;
          }
          uint64_t v17 = v105;
          unint64_t v19 = v110 - 1;
          uint64_t result = (uint64_t)memmove((void *)(v62 + 16 * v65), v108 + 2, 16 * (v110 - 1 - v65));
          *(void *)(v105 + 16) = v110 - 1;
          if (v110 <= 2) {
            goto LABEL_14;
          }
        }
      }
      unint64_t v19 = 1;
LABEL_14:
      a1 = v126;
      uint64_t v4 = v127;
      uint64_t v12 = v126[1];
      uint64_t v18 = v133;
      if (v133 >= v12) {
        goto LABEL_105;
      }
    }
  }
  uint64_t v17 = MEMORY[0x263F8EE78];
  unint64_t v125 = MEMORY[0x263F8EE78]
       + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v119 = MEMORY[0x263F8EE78];
  if (v12 == 1) {
    goto LABEL_12;
  }
  unint64_t v19 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_105:
  if (v19 >= 2)
  {
    uint64_t v111 = v4;
    uint64_t v112 = *a1;
    do
    {
      unint64_t v113 = v19 - 2;
      if (v19 < 2) {
        goto LABEL_134;
      }
      if (!v112) {
        goto LABEL_147;
      }
      uint64_t v114 = *(void *)(v17 + 32 + 16 * v113);
      uint64_t v115 = *(void *)(v17 + 32 + 16 * (v19 - 1) + 8);
      uint64_t result = sub_22D33C30C(v112 + *(void *)(v111 + 72) * v114, v112 + *(void *)(v111 + 72) * *(void *)(v17 + 32 + 16 * (v19 - 1)), v112 + *(void *)(v111 + 72) * v115, v125);
      if (v2) {
        break;
      }
      if (v115 < v114) {
        goto LABEL_135;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_22D33C998(v17);
        uint64_t v17 = result;
      }
      if (v113 >= *(void *)(v17 + 16)) {
        goto LABEL_136;
      }
      uint64_t v116 = (void *)(v17 + 32 + 16 * v113);
      *uint64_t v116 = v114;
      v116[1] = v115;
      unint64_t v117 = *(void *)(v17 + 16);
      if (v19 > v117) {
        goto LABEL_137;
      }
      uint64_t result = (uint64_t)memmove((void *)(v17 + 32 + 16 * (v19 - 1)), (const void *)(v17 + 32 + 16 * v19), 16 * (v117 - v19));
      *(void *)(v17 + 16) = v117 - 1;
      unint64_t v19 = v117 - 1;
    }
    while (v117 > 2);
  }
LABEL_116:
  swift_bridgeObjectRelease();
  *(void *)(v119 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_22D33C050(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v33 = a1;
  uint64_t v34 = type metadata accessor for SymbolMetadataStore.RelevantSymbol(0);
  uint64_t v7 = MEMORY[0x270FA5388](v34);
  uint64_t v41 = (uint64_t)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v37 = (uint64_t *)((char *)&v31 - v10);
  uint64_t result = MEMORY[0x270FA5388](v9);
  uint64_t v36 = (uint64_t *)((char *)&v31 - v13);
  uint64_t v40 = a3;
  uint64_t v32 = a2;
  if (a3 != a2)
  {
    uint64_t v14 = *(void *)(v12 + 72);
    uint64_t v15 = v14 * (v40 - 1);
    uint64_t v38 = v14;
    uint64_t v16 = v14 * v40;
    uint64_t v35 = a4;
LABEL_5:
    uint64_t v17 = 0;
    uint64_t v18 = v33;
    uint64_t v39 = v16;
    while (1)
    {
      uint64_t v19 = *a4;
      uint64_t v20 = v16 + v17 + *a4;
      uint64_t v21 = v36;
      sub_22D33DAD0(v20, (uint64_t)v36, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
      uint64_t v22 = v15 + v17 + v19;
      uint64_t v23 = v15;
      uint64_t v24 = v37;
      sub_22D33DAD0(v22, (uint64_t)v37, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
      uint64_t v42 = *v21;
      uint64_t v25 = *v24;
      uint64_t v26 = (uint64_t)v24;
      uint64_t v15 = v23;
      sub_22D33DB38(v26, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
      uint64_t v27 = (uint64_t)v21;
      uint64_t v16 = v39;
      uint64_t result = sub_22D33DB38(v27, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
      BOOL v28 = v25 < v42;
      a4 = v35;
      if (!v28)
      {
LABEL_4:
        uint64_t v15 = v23 + v38;
        v16 += v38;
        if (++v40 == v32) {
          return result;
        }
        goto LABEL_5;
      }
      uint64_t v29 = *v35;
      if (!*v35) {
        break;
      }
      uint64_t v30 = v29 + v23 + v17;
      sub_22D33DA68(v29 + v16 + v17, v41, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = sub_22D33DA68(v41, v30, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
      v17 -= v38;
      if (v40 == ++v18) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_22D33C30C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v45 = type metadata accessor for SymbolMetadataStore.RelevantSymbol(0);
  uint64_t v8 = MEMORY[0x270FA5388](v45);
  uint64_t v47 = (uint64_t *)((char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t result = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (uint64_t *)((char *)&v42 - v11);
  uint64_t v14 = *(void *)(v13 + 72);
  if (!v14)
  {
    __break(1u);
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
    return result;
  }
  if (a2 - a1 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_69;
  }
  int64_t v15 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_70;
  }
  uint64_t v16 = (uint64_t)(a2 - a1) / v14;
  unint64_t v50 = a1;
  unint64_t v49 = a4;
  if (v16 >= v15 / v14)
  {
    uint64_t v18 = v15 / v14 * v14;
    if (a4 < a2 || a2 + v18 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a2)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v28 = a4 + v18;
    unint64_t v48 = a4 + v18;
    unint64_t v50 = a2;
    if (v18 >= 1 && a1 < a2)
    {
      uint64_t v30 = -v14;
      unint64_t v43 = a1;
      unint64_t v44 = a4;
      do
      {
        unint64_t v46 = a3 + v30;
        sub_22D33DAD0(v28 + v30, (uint64_t)v12, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        unint64_t v31 = a2 + v30;
        uint64_t v32 = v12;
        uint64_t v33 = v47;
        sub_22D33DAD0(a2 + v30, (uint64_t)v47, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        uint64_t v34 = *v32;
        uint64_t v35 = *v33;
        uint64_t v36 = (uint64_t)v33;
        uint64_t v12 = v32;
        sub_22D33DB38(v36, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        sub_22D33DB38((uint64_t)v32, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        if (v35 >= v34)
        {
          unint64_t v40 = v48;
          v48 += v30;
          unint64_t v37 = v46;
          if (a3 < v40 || v46 >= v40)
          {
            swift_arrayInitWithTakeFrontToBack();
            unint64_t v31 = a2;
            unint64_t v39 = v43;
            unint64_t v38 = v44;
          }
          else
          {
            unint64_t v39 = v43;
            unint64_t v38 = v44;
            if (a3 != v40) {
              swift_arrayInitWithTakeBackToFront();
            }
            unint64_t v31 = a2;
          }
        }
        else
        {
          unint64_t v37 = v46;
          if (a3 < a2 || v46 >= a2)
          {
            swift_arrayInitWithTakeFrontToBack();
            unint64_t v39 = v43;
            unint64_t v38 = v44;
          }
          else
          {
            unint64_t v39 = v43;
            unint64_t v38 = v44;
            if (a3 != a2) {
              swift_arrayInitWithTakeBackToFront();
            }
          }
          v50 += v30;
        }
        unint64_t v28 = v48;
        if (v48 <= v38) {
          break;
        }
        a2 = v31;
        a3 = v37;
      }
      while (v31 > v39);
    }
  }
  else
  {
    uint64_t v17 = v16 * v14;
    if (a4 < a1 || a1 + v17 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v46 = a4 + v17;
    unint64_t v48 = a4 + v17;
    if (v17 >= 1 && a2 < a3)
    {
      uint64_t v20 = v47;
      do
      {
        sub_22D33DAD0(a2, (uint64_t)v12, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        sub_22D33DAD0(a4, (uint64_t)v20, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        uint64_t v21 = *v12;
        uint64_t v22 = *v20;
        sub_22D33DB38((uint64_t)v20, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        sub_22D33DB38((uint64_t)v12, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        unint64_t v23 = v50;
        if (v22 >= v21)
        {
          unint64_t v26 = v49 + v14;
          if (v50 < v49 || v50 >= v26)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v50 != v49)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v49 = v26;
          unint64_t v24 = a2;
        }
        else
        {
          unint64_t v24 = a2 + v14;
          if (v50 < a2 || v50 >= v24)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v50 == a2)
          {
            unint64_t v23 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        unint64_t v50 = v23 + v14;
        a4 = v49;
        if (v49 >= v46) {
          break;
        }
        a2 = v24;
      }
      while (v24 < a3);
    }
  }
  sub_22D33C8B4(&v50, &v49, (uint64_t *)&v48);
  return 1;
}

char *sub_22D33C7B8(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268568880);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_22D33C8B4(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = type metadata accessor for SymbolMetadataStore.RelevantSymbol(0);
  uint64_t v7 = *(void *)(*(void *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    return result;
  }
  if (v5 - v4 == 0x8000000000000000 && v7 == -1) {
    goto LABEL_17;
  }
  if (v3 < v4 || v3 >= v4 + (uint64_t)(v5 - v4) / v7 * v7)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v3 != v4)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_22D33C998(uint64_t a1)
{
  return sub_22D33C7B8(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_22D33C9AC(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_22D33CB64(a1, a2, a3, *v3);
  *unint64_t v3 = result;
  return result;
}

char *sub_22D33C9CC(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_22D33CC80(a1, a2, a3, *v3);
  *unint64_t v3 = result;
  return result;
}

size_t sub_22D33C9EC(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_22D33CEA0(a1, a2, a3, (void *)*v3, &qword_2685688A0, type metadata accessor for SymbolKey);
  *unint64_t v3 = result;
  return result;
}

char *sub_22D33CA28(char *a1, int64_t a2, char a3)
{
  size_t result = sub_22D33CD84(a1, a2, a3, *v3);
  *unint64_t v3 = result;
  return result;
}

char *sub_22D33CA48(char *a1, int64_t a2, char a3)
{
  size_t result = sub_22D33D07C(a1, a2, a3, *v3);
  *unint64_t v3 = result;
  return result;
}

char *sub_22D33CA68(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685688C0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
  }
  swift_release();
  return v10;
}

char *sub_22D33CB64(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685688B8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[48 * v8]) {
      memmove(v12, v13, 48 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_22D33CC80(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD77E78);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_22D33CD84(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685688A8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[48 * v8]) {
      memmove(v12, v13, 48 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

size_t sub_22D33CEA0(size_t result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  char v8 = result;
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  if (!v12)
  {
    uint64_t v16 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_29;
  }
  long long v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(result - v15) / v14);
LABEL_19:
  uint64_t v18 = *(void *)(a6(0) - 8);
  if (v8)
  {
    if (v16 < a4
      || (unint64_t v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80),
          (char *)v16 + v19 >= (char *)a4 + v19 + *(void *)(v18 + 72) * v11))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v16;
}

char *sub_22D33D07C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268568898);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

size_t sub_22D33D180(size_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  unint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  size_t v6 = result;
  size_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result && v5 <= v3[3] >> 1)
  {
    if (*(void *)(v6 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  if (v4 <= v5) {
    int64_t v11 = v4 + v2;
  }
  else {
    int64_t v11 = v4;
  }
  size_t result = sub_22D344798(result, v11, 1, v3);
  unint64_t v3 = (void *)result;
  if (!*(void *)(v6 + 16))
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_5:
  uint64_t v7 = (v3[3] >> 1) - v3[2];
  size_t result = type metadata accessor for SymbolKey(0);
  if (v7 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  size_t result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    size_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v8 = v3[2];
  BOOL v9 = __OFADD__(v8, v2);
  uint64_t v10 = v8 + v2;
  if (!v9)
  {
    v3[2] = v10;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

char *sub_22D33D2A8(uint64_t a1)
{
  return sub_22D33CA68(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_22D33D2BC(uint64_t a1)
{
  return sub_22D33CC80(0, *(void *)(a1 + 16), 0, (char *)a1);
}

size_t sub_22D33D2D0(void *a1)
{
  return sub_22D33CEA0(0, a1[2], 0, a1, &qword_268568888, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
}

uint64_t _s9SFSymbols9SymbolKeyO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = sub_22D34B6B8();
  uint64_t v4 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  size_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for SymbolKey(0);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (_DWORD *)((char *)&v22 - v11);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685685B8);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = &v16[*(int *)(v14 + 56)];
  sub_22D33DAD0(a1, (uint64_t)v16, type metadata accessor for SymbolKey);
  sub_22D33DAD0(a2, (uint64_t)v17, type metadata accessor for SymbolKey);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    sub_22D33DAD0((uint64_t)v16, (uint64_t)v12, type metadata accessor for SymbolKey);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      char v19 = *v12 == *(_DWORD *)v17;
      goto LABEL_6;
    }
LABEL_8:
    sub_22D3415D4((uint64_t)v16, &qword_2685685B8);
    char v19 = 0;
    return v19 & 1;
  }
  sub_22D33DAD0((uint64_t)v16, (uint64_t)v10, type metadata accessor for SymbolKey);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v10, v23);
    goto LABEL_8;
  }
  uint64_t v18 = v23;
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v17, v23);
  char v19 = sub_22D34B6A8();
  uint64_t v20 = *(void (**)(char *, uint64_t))(v4 + 8);
  v20(v6, v18);
  v20(v10, v18);
LABEL_6:
  sub_22D33DB38((uint64_t)v16, type metadata accessor for SymbolKey);
  return v19 & 1;
}

uint64_t sub_22D33D608(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_22D34B818();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_22D327CB4(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_22D33D6A0(uint64_t a1, uint64_t a2)
{
  int64_t v3 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v3)
  {
    uint64_t v28 = MEMORY[0x263F8EE78];
    sub_22D33CA28(0, v3, 0);
    uint64_t result = v28;
    uint64_t v6 = (uint64_t *)(a1 + 56);
    unint64_t v24 = *(void **)(a2 + 128);
    uint64_t v23 = a2;
    while (1)
    {
      uint64_t v27 = result;
      uint64_t v7 = *(v6 - 3);
      uint64_t v8 = *(v6 - 2);
      uint64_t v9 = *v6;
      uint64_t v25 = *(v6 - 1);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      sub_22D34B8D8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      uint64_t v26 = v7;
      sub_22D34B788();
      swift_bridgeObjectRelease();
      if (!v24) {
        goto LABEL_7;
      }
      id v10 = v24;
      uint64_t v12 = sub_22D34B588();
      uint64_t v13 = v11;
      if (v12 == 0xD000000000000013 && v11 == 0x800000022D3965F0) {
        break;
      }
      char v17 = sub_22D34B9A8();

      if ((v17 & 1) == 0) {
        goto LABEL_19;
      }
      swift_bridgeObjectRelease();
      a2 = v23;
      uint64_t v14 = *(void **)(v23 + 152);
      if (!v14) {
        goto LABEL_16;
      }
LABEL_8:
      id v15 = v14;
      uint64_t v12 = sub_22D34B588();
      uint64_t v13 = v16;
      if (v12 == 0xD000000000000013 && v16 == 0x800000022D3965F0)
      {
        swift_bridgeObjectRelease();

LABEL_16:
        if (qword_2685684C0 != -1) {
          swift_once();
        }
        uint64_t v12 = sub_22D34B588();
        uint64_t v13 = v19;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_20;
      }
      char v18 = sub_22D34B9A8();

      if (v18)
      {
        swift_bridgeObjectRelease();
        a2 = v23;
        goto LABEL_16;
      }
LABEL_19:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      a2 = v23;
LABEL_20:
      swift_bridgeObjectRelease();
      uint64_t result = v27;
      unint64_t v21 = *(void *)(v27 + 16);
      unint64_t v20 = *(void *)(v27 + 24);
      if (v21 >= v20 >> 1)
      {
        sub_22D33CA28((char *)(v20 > 1), v21 + 1, 1);
        uint64_t result = v27;
      }
      v6 += 4;
      *(void *)(result + 16) = v21 + 1;
      uint64_t v22 = (void *)(result + 48 * v21);
      v22[4] = v26;
      v22[5] = v8;
      v22[6] = v25;
      v22[7] = v9;
      v22[8] = v12;
      v22[9] = v13;
      if (!--v3) {
        return result;
      }
    }
    swift_bridgeObjectRelease();

LABEL_7:
    uint64_t v14 = *(void **)(a2 + 152);
    if (!v14) {
      goto LABEL_16;
    }
    goto LABEL_8;
  }
  return result;
}

uint64_t sub_22D33DA04(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_22D33DA68(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_22D33DAD0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_22D33DB38(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_22D33DB98(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SymbolKey(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v13 - v7;
  uint64_t v9 = *(void *)(a1 + 16);
  sub_22D340850(&qword_268568878, (void (*)(uint64_t))type metadata accessor for SymbolKey);
  uint64_t result = sub_22D34B818();
  uint64_t v14 = result;
  if (v9)
  {
    uint64_t v11 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v12 = *(void *)(v3 + 72);
    do
    {
      sub_22D33DAD0(v11, (uint64_t)v6, type metadata accessor for SymbolKey);
      sub_22D327F84((uint64_t)v8, (uint64_t)v6);
      sub_22D33DB38((uint64_t)v8, type metadata accessor for SymbolKey);
      v11 += v12;
      --v9;
    }
    while (v9);
    return v14;
  }
  return result;
}

uint64_t sub_22D33DD28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 56;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 56);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  uint64_t v11 = MEMORY[0x263F8EE78];
  while (v7)
  {
    unint64_t v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v13 = v12 | (v10 << 6);
LABEL_22:
    uint64_t v17 = *(void *)(a2 + 16);
    if (*(void *)(v17 + 16))
    {
      char v18 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v13);
      uint64_t v19 = *v18;
      uint64_t v20 = v18[1];
      swift_bridgeObjectRetain();
      unint64_t v21 = sub_22D3195C4(v19, v20);
      if (v22)
      {
        int v25 = *(_DWORD *)(*(void *)(v17 + 56) + 104 * v21);
        swift_bridgeObjectRelease();
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_22D3444B4(0, *(void *)(v11 + 16) + 1, 1, (char *)v11);
          uint64_t v11 = result;
        }
        unint64_t v24 = *(void *)(v11 + 16);
        unint64_t v23 = *(void *)(v11 + 24);
        if (v24 >= v23 >> 1)
        {
          uint64_t result = (uint64_t)sub_22D3444B4((char *)(v23 > 1), v24 + 1, 1, (char *)v11);
          uint64_t v11 = result;
        }
        *(void *)(v11 + 16) = v24 + 1;
        *(_DWORD *)(v11 + 4 * v24 + 32) = v25;
      }
      else
      {
        uint64_t result = swift_bridgeObjectRelease();
      }
    }
  }
  int64_t v14 = v10 + 1;
  if (__OFADD__(v10, 1))
  {
    __break(1u);
    goto LABEL_32;
  }
  if (v14 >= v8) {
    goto LABEL_30;
  }
  unint64_t v15 = *(void *)(v4 + 8 * v14);
  ++v10;
  if (v15) {
    goto LABEL_21;
  }
  int64_t v10 = v14 + 1;
  if (v14 + 1 >= v8) {
    goto LABEL_30;
  }
  unint64_t v15 = *(void *)(v4 + 8 * v10);
  if (v15) {
    goto LABEL_21;
  }
  int64_t v10 = v14 + 2;
  if (v14 + 2 >= v8) {
    goto LABEL_30;
  }
  unint64_t v15 = *(void *)(v4 + 8 * v10);
  if (v15) {
    goto LABEL_21;
  }
  int64_t v10 = v14 + 3;
  if (v14 + 3 >= v8) {
    goto LABEL_30;
  }
  unint64_t v15 = *(void *)(v4 + 8 * v10);
  if (v15)
  {
LABEL_21:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
    goto LABEL_22;
  }
  int64_t v16 = v14 + 4;
  if (v16 >= v8)
  {
LABEL_30:
    swift_release();
    return v11;
  }
  unint64_t v15 = *(void *)(v4 + 8 * v16);
  if (v15)
  {
    int64_t v10 = v16;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v8) {
      goto LABEL_30;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v10);
    ++v16;
    if (v15) {
      goto LABEL_21;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

void *sub_22D33DF50(uint64_t a1, _OWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v116 = a6;
  uint64_t v114 = a5;
  uint64_t v113 = a4;
  uint64_t v112 = a3;
  unint64_t v7 = a2;
  long long v9 = a2[7];
  long long v143 = a2[6];
  long long v144 = v9;
  long long v10 = a2[9];
  long long v145 = a2[8];
  long long v146 = v10;
  long long v11 = a2[3];
  long long v139 = a2[2];
  long long v140 = v11;
  long long v12 = a2[5];
  long long v141 = a2[4];
  long long v142 = v12;
  long long v13 = a2[1];
  long long v137 = *a2;
  long long v138 = v13;
  uint64_t v121 = type metadata accessor for CustomSymbol();
  uint64_t v14 = *(void *)(v121 - 8);
  MEMORY[0x270FA5388](v121);
  uint64_t v108 = (uint64_t)v101 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268568840);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  uint64_t v125 = (uint64_t)v101 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v115 = (char *)v101 - v19;
  uint64_t v128 = sub_22D34B6B8();
  uint64_t v20 = *(void *)(v128 - 8);
  MEMORY[0x270FA5388](v128);
  char v22 = (char *)v101 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v147 = type metadata accessor for SymbolKey(0);
  uint64_t v132 = *(void *)(v147 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v147);
  uint64_t v127 = (uint64_t)v101 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v136 = (int *)((char *)v101 - v25);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268568848);
  MEMORY[0x270FA5388](v26 - 8);
  uint64_t v28 = (char *)v101 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v134 = type metadata accessor for SymbolMetadata(0);
  uint64_t v29 = *(void *)(v134 - 8);
  MEMORY[0x270FA5388](v134);
  unint64_t v31 = (char *)v101 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_268568890);
  MEMORY[0x270FA5388](v32 - 8);
  uint64_t v135 = (char *)v101 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = type metadata accessor for SymbolMetadataStore.RelevantSymbol(0);
  uint64_t v35 = MEMORY[0x270FA5388](v34);
  uint64_t v111 = (uint64_t)v101 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = MEMORY[0x270FA5388](v35);
  uint64_t v107 = (uint64_t)v101 - v39;
  uint64_t v123 = *(void *)(a1 + 16);
  if (v123)
  {
    uint64_t v129 = v37;
    uint64_t v126 = v22;
    v101[2] = v6;
    uint64_t v133 = a1 + ((*(unsigned __int8 *)(v132 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v132 + 80));
    uint64_t v105 = v28 + 104;
    uint64_t v132 = *(void *)(v132 + 72);
    uint64_t v130 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v29 + 56);
    uint64_t v120 = (void (**)(char *, uint64_t, uint64_t))(v20 + 32);
    uint64_t v119 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    uint64_t v103 = v14;
    uint64_t v118 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
    unint64_t v117 = (void (**)(char *, uint64_t))(v20 + 8);
    uint64_t v124 = (unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48);
    uint64_t v131 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v38 + 56);
    uint64_t v104 = v38;
    unint64_t v110 = (uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v38 + 48);
    v101[1] = a1;
    swift_bridgeObjectRetain();
    uint64_t v40 = 0;
    uint64_t v102 = v116 + 56;
    uint64_t v122 = (void *)MEMORY[0x263F8EE78];
    uint64_t v109 = v7;
    uint64_t v41 = (uint64_t)v115;
    uint64_t v42 = (uint64_t)v136;
    uint64_t v43 = v123;
    uint64_t v106 = v31;
    while (1)
    {
      uint64_t v45 = v133 + v132 * v40;
      sub_22D33DAD0(v45, v42, type metadata accessor for SymbolKey);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        sub_22D33DB38(v42, type metadata accessor for SymbolKey);
      }
      else
      {
        uint64_t v46 = v7[1];
        if (*(void *)(v46 + 16))
        {
          unint64_t v47 = sub_22D3229EC(*v136);
          if (v48)
          {
            uint64_t v49 = *(void *)(v46 + 56) + 104 * v47;
            uint64_t v50 = *(void *)(v49 + 8);
            uint64_t v51 = *(void *)(v49 + 16);
            char v52 = *(unsigned char *)(v49 + 24);
            uint64_t v53 = *(void *)(v49 + 32);
            uint64_t v54 = *(void *)(v49 + 40);
            uint64_t v56 = *(void *)(v49 + 48);
            uint64_t v55 = *(void *)(v49 + 56);
            char v57 = *(unsigned char *)(v49 + 64);
            uint64_t v58 = *(void *)(v49 + 72);
            uint64_t v59 = *(void *)(v49 + 80);
            char v60 = *(unsigned char *)(v49 + 88);
            uint64_t v61 = *(void *)(v49 + 96);
            *(_DWORD *)uint64_t v28 = *(_DWORD *)v49;
            *((void *)v28 + 1) = v50;
            *((void *)v28 + 2) = v51;
            v28[24] = v52;
            *((void *)v28 + 4) = v53;
            *((void *)v28 + 5) = v54;
            *((void *)v28 + 6) = v56;
            *((void *)v28 + 7) = v55;
            v28[64] = v57;
            *((void *)v28 + 9) = v58;
            *((void *)v28 + 10) = v59;
            v28[88] = v60;
            *((void *)v28 + 12) = v61;
            long long v62 = v144;
            uint64_t v63 = v105;
            *((_OWORD *)v105 + 6) = v143;
            *((_OWORD *)v63 + 7) = v62;
            long long v64 = v146;
            *((_OWORD *)v63 + 8) = v145;
            *((_OWORD *)v63 + 9) = v64;
            long long v65 = v140;
            *((_OWORD *)v63 + 2) = v139;
            *((_OWORD *)v63 + 3) = v65;
            long long v66 = v142;
            *((_OWORD *)v63 + 4) = v141;
            *((_OWORD *)v63 + 5) = v66;
            long long v67 = v138;
            *(_OWORD *)uint64_t v63 = v137;
            *((_OWORD *)v63 + 1) = v67;
            type metadata accessor for SymbolMetadata.Backing(0);
            swift_storeEnumTagMultiPayload();
            uint64_t v68 = v134;
            (*v130)(v28, 0, 1, v134);
            unint64_t v7 = v109;
            swift_bridgeObjectRetain();
            uint64_t v41 = (uint64_t)v115;
            swift_bridgeObjectRetain();
            uint64_t v43 = v123;
            swift_bridgeObjectRetain();
            unint64_t v31 = v106;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            sub_22D3359E0(v7);
            goto LABEL_20;
          }
        }
      }
      uint64_t v69 = v45;
      uint64_t v70 = v127;
      sub_22D33DAD0(v69, v127, type metadata accessor for SymbolKey);
      if (swift_getEnumCaseMultiPayload() != 1)
      {
        sub_22D33DB38(v70, type metadata accessor for SymbolKey);
        (*v130)(v28, 1, 1, v134);
        uint64_t v42 = (uint64_t)v136;
LABEL_4:
        sub_22D3415D4((uint64_t)v28, &qword_268568848);
        unint64_t v44 = (uint64_t *)v135;
        (*v131)(v135, 1, 1, v129);
        goto LABEL_5;
      }
      uint64_t v71 = v70;
      uint64_t v72 = (uint64_t)v126;
      (*v120)(v126, v71, v128);
      uint64_t v73 = v7[15];
      if (*(void *)(v73 + 16) && (unint64_t v74 = sub_22D322BC0(v72), (v75 & 1) != 0))
      {
        sub_22D33DAD0(*(void *)(v73 + 56) + *(void *)(v103 + 72) * v74, v41, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
        uint64_t v76 = 0;
      }
      else
      {
        uint64_t v76 = 1;
      }
      uint64_t v77 = 1;
      uint64_t v78 = v121;
      (*v119)(v41, v76, 1, v121);
      uint64_t v79 = v125;
      sub_22D33DA04(v41, v125, &qword_268568840);
      if ((*v118)(v79, 1, v78) != 1)
      {
        uint64_t v80 = v108;
        sub_22D33DA68(v125, v108, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
        sub_22D33DAD0(v80, (uint64_t)v28, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
        type metadata accessor for SymbolMetadata.Backing(0);
        swift_storeEnumTagMultiPayload();
        sub_22D33DB38(v80, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
        uint64_t v77 = 0;
      }
      uint64_t v81 = v77;
      uint64_t v68 = v134;
      (*v130)(v28, v81, 1, v134);
      sub_22D3415D4(v41, &qword_268568840);
      (*v117)(v126, v128);
LABEL_20:
      uint64_t v42 = (uint64_t)v136;
      if ((*v124)(v28, 1, v68) == 1) {
        goto LABEL_4;
      }
      sub_22D33DA68((uint64_t)v28, (uint64_t)v31, type metadata accessor for SymbolMetadata);
      uint64_t v82 = sub_22D3338E8((uint64_t)v31, v112, v113, v114);
      unint64_t v44 = (uint64_t *)v135;
      if (v83)
      {
        uint64_t v88 = *(void *)(v116 + 16);
        if (v88)
        {
          swift_bridgeObjectRetain();
          uint64_t v89 = v102;
          while (1)
          {
            uint64_t v90 = *(uint64_t (**)(char *))(v89 - 8);
            swift_bridgeObjectRetain();
            swift_retain();
            char v91 = v90(v31);
            swift_release();
            swift_bridgeObjectRelease();
            if ((v91 & 1) == 0) {
              break;
            }
            v89 += 32;
            if (!--v88)
            {
              swift_bridgeObjectRelease();
              uint64_t v86 = v129;
              unint64_t v44 = (uint64_t *)v135;
              sub_22D33DAD0((uint64_t)v31, (uint64_t)&v135[*(int *)(v129 + 20)], type metadata accessor for SymbolMetadata);
              uint64_t v87 = 0;
              *unint64_t v44 = 1000;
              uint64_t v85 = v109;
              uint64_t v41 = (uint64_t)v115;
              goto LABEL_28;
            }
          }
          swift_bridgeObjectRelease();
          uint64_t v87 = 1;
          uint64_t v85 = v109;
        }
        else
        {
          uint64_t v85 = v7;
          uint64_t v87 = 1;
        }
        uint64_t v41 = (uint64_t)v115;
        uint64_t v42 = (uint64_t)v136;
        unint64_t v44 = (uint64_t *)v135;
        uint64_t v86 = v129;
      }
      else
      {
        uint64_t v84 = v82;
        uint64_t v85 = v7;
        uint64_t v86 = v129;
        sub_22D33DAD0((uint64_t)v31, (uint64_t)&v135[*(int *)(v129 + 20)], type metadata accessor for SymbolMetadata);
        uint64_t v87 = 0;
        *unint64_t v44 = v84;
LABEL_28:
        uint64_t v42 = (uint64_t)v136;
      }
      sub_22D33DB38((uint64_t)v31, type metadata accessor for SymbolMetadata);
      (*v131)((char *)v44, v87, 1, v86);
      int v92 = (*v110)(v44, 1, v86);
      unint64_t v7 = v85;
      uint64_t v43 = v123;
      if (v92 != 1)
      {
        uint64_t v93 = v107;
        sub_22D33DA68((uint64_t)v44, v107, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        sub_22D33DA68(v93, v111, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        if (swift_isUniquelyReferenced_nonNull_native()) {
          uint64_t v94 = v122;
        }
        else {
          uint64_t v94 = (void *)sub_22D3447B8(0, v122[2] + 1, 1, v122);
        }
        unint64_t v96 = v94[2];
        unint64_t v95 = v94[3];
        uint64_t v97 = v104;
        if (v96 >= v95 >> 1)
        {
          size_t v99 = sub_22D3447B8(v95 > 1, v96 + 1, 1, v94);
          uint64_t v97 = v104;
          uint64_t v94 = (void *)v99;
        }
        v94[2] = v96 + 1;
        unint64_t v98 = (*(unsigned __int8 *)(v97 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v97 + 80);
        uint64_t v122 = v94;
        sub_22D33DA68(v111, (uint64_t)v94 + v98 + *(void *)(v97 + 72) * v96, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        uint64_t v42 = (uint64_t)v136;
        goto LABEL_6;
      }
LABEL_5:
      sub_22D3415D4((uint64_t)v44, &qword_268568890);
LABEL_6:
      if (++v40 == v43)
      {
        swift_bridgeObjectRelease();
        return v122;
      }
    }
  }
  return (void *)MEMORY[0x263F8EE78];
}

void *sub_22D33ED00(uint64_t a1, long long *a2)
{
  long long v4 = a2[7];
  long long v111 = a2[6];
  long long v112 = v4;
  long long v5 = a2[9];
  long long v113 = a2[8];
  long long v114 = v5;
  long long v6 = a2[3];
  long long v107 = a2[2];
  long long v108 = v6;
  long long v7 = a2[5];
  long long v109 = a2[4];
  long long v110 = v7;
  long long v8 = *a2;
  long long v9 = a2[1];
  uint64_t v102 = a2;
  long long v105 = v8;
  long long v106 = v9;
  uint64_t v92 = type metadata accessor for CustomSymbol();
  uint64_t v10 = *(void *)(v92 - 8);
  MEMORY[0x270FA5388](v92);
  uint64_t v81 = (uint64_t)v78 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268568840);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v97 = (uint64_t)v78 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v93 = (char *)v78 - v15;
  uint64_t v98 = sub_22D34B6B8();
  uint64_t v16 = *(void *)(v98 - 8);
  MEMORY[0x270FA5388](v98);
  unint64_t v96 = (char *)v78 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v115 = type metadata accessor for SymbolKey(0);
  uint64_t v18 = *(void *)(v115 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v115);
  uint64_t v104 = (uint64_t)v78 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  char v22 = (int *)((char *)v78 - v21);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_268568848);
  MEMORY[0x270FA5388](v23 - 8);
  uint64_t v25 = (char *)v78 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = type metadata accessor for SymbolMetadata(0);
  uint64_t v87 = *(void *)(v26 - 8);
  uint64_t v27 = MEMORY[0x270FA5388](v26);
  uint64_t v95 = (uint64_t)v78 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  uint64_t v86 = (uint64_t)v78 - v30;
  uint64_t v31 = *(void *)(a1 + 16);
  if (!v31) {
    return (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v100 = v29;
  v78[1] = v2;
  uint64_t v32 = a1 + ((*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80));
  uint64_t v101 = *(void *)(v18 + 72);
  uint64_t v80 = v25 + 104;
  size_t v99 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v87 + 56);
  char v91 = (void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32);
  uint64_t v90 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
  uint64_t v89 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  uint64_t v88 = (void (**)(char *, uint64_t))(v16 + 8);
  uint64_t v94 = (unsigned int (**)(char *, uint64_t, uint64_t))(v87 + 48);
  v78[0] = a1;
  swift_bridgeObjectRetain();
  uint64_t v33 = (void *)MEMORY[0x263F8EE78];
  uint64_t v79 = v10;
  uint64_t v34 = (uint64_t)v93;
  uint64_t v35 = (uint64_t)v96;
  do
  {
    sub_22D33DAD0(v32, (uint64_t)v22, type metadata accessor for SymbolKey);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_22D33DB38((uint64_t)v22, type metadata accessor for SymbolKey);
    }
    else
    {
      uint64_t v36 = v102[1];
      if (*(void *)(v36 + 16))
      {
        unint64_t v37 = sub_22D3229EC(*v22);
        if (v38)
        {
          uint64_t v39 = *(void *)(v36 + 56) + 104 * v37;
          int v40 = *(_DWORD *)v39;
          uint64_t v42 = *(void *)(v39 + 8);
          uint64_t v82 = *(void *)(v39 + 16);
          uint64_t v41 = v82;
          char v43 = *(unsigned char *)(v39 + 24);
          uint64_t v44 = *(void *)(v39 + 32);
          uint64_t v83 = *(void *)(v39 + 40);
          uint64_t v45 = v83;
          uint64_t v46 = *(void *)(v39 + 56);
          uint64_t v84 = *(void *)(v39 + 48);
          uint64_t v47 = v84;
          uint64_t v85 = v46;
          char v48 = *(unsigned char *)(v39 + 64);
          uint64_t v49 = *(void *)(v39 + 72);
          uint64_t v50 = *(void *)(v39 + 80);
          char v51 = *(unsigned char *)(v39 + 88);
          uint64_t v52 = *(void *)(v39 + 96);
          *(_DWORD *)uint64_t v25 = v40;
          *((void *)v25 + 1) = v42;
          *((void *)v25 + 2) = v41;
          v25[24] = v43;
          *((void *)v25 + 4) = v44;
          *((void *)v25 + 5) = v45;
          *((void *)v25 + 6) = v47;
          *((void *)v25 + 7) = v46;
          v25[64] = v48;
          *((void *)v25 + 9) = v49;
          *((void *)v25 + 10) = v50;
          v25[88] = v51;
          *((void *)v25 + 12) = v52;
          long long v53 = v112;
          uint64_t v54 = v80;
          *((_OWORD *)v80 + 6) = v111;
          *((_OWORD *)v54 + 7) = v53;
          long long v55 = v114;
          *((_OWORD *)v54 + 8) = v113;
          *((_OWORD *)v54 + 9) = v55;
          long long v56 = v108;
          *((_OWORD *)v54 + 2) = v107;
          *((_OWORD *)v54 + 3) = v56;
          long long v57 = v110;
          *((_OWORD *)v54 + 4) = v109;
          *((_OWORD *)v54 + 5) = v57;
          long long v58 = v106;
          *(_OWORD *)uint64_t v54 = v105;
          *((_OWORD *)v54 + 1) = v58;
          type metadata accessor for SymbolMetadata.Backing(0);
          swift_storeEnumTagMultiPayload();
          uint64_t v59 = *v99;
          uint64_t v103 = v33;
          uint64_t v60 = v100;
          v59(v25, 0, 1, v100);
          swift_bridgeObjectRetain();
          uint64_t v35 = (uint64_t)v96;
          swift_bridgeObjectRetain();
          uint64_t v34 = (uint64_t)v93;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_22D3359E0(v102);
          uint64_t v61 = v60;
          goto LABEL_19;
        }
      }
    }
    sub_22D33DAD0(v32, v104, type metadata accessor for SymbolKey);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      sub_22D33DB38(v104, type metadata accessor for SymbolKey);
      (*v99)(v25, 1, 1, v100);
LABEL_4:
      sub_22D3415D4((uint64_t)v25, &qword_268568848);
      goto LABEL_5;
    }
    (*v91)(v35, v104, v98);
    uint64_t v62 = v102[15];
    uint64_t v63 = *(void *)(v62 + 16);
    uint64_t v103 = v33;
    if (v63 && (unint64_t v64 = sub_22D322BC0(v35), (v65 & 1) != 0))
    {
      sub_22D33DAD0(*(void *)(v62 + 56) + *(void *)(v79 + 72) * v64, v34, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
      uint64_t v66 = 0;
    }
    else
    {
      uint64_t v66 = 1;
    }
    uint64_t v67 = 1;
    uint64_t v68 = v92;
    (*v90)(v34, v66, 1, v92);
    uint64_t v69 = v34;
    uint64_t v70 = v34;
    uint64_t v71 = v97;
    sub_22D33DA04(v69, v97, &qword_268568840);
    if ((*v89)(v71, 1, v68) != 1)
    {
      uint64_t v72 = v81;
      sub_22D33DA68(v97, v81, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
      sub_22D33DAD0(v72, (uint64_t)v25, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
      type metadata accessor for SymbolMetadata.Backing(0);
      swift_storeEnumTagMultiPayload();
      sub_22D33DB38(v72, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
      uint64_t v67 = 0;
    }
    uint64_t v73 = v100;
    (*v99)(v25, v67, 1, v100);
    sub_22D3415D4(v70, &qword_268568840);
    uint64_t v35 = (uint64_t)v96;
    (*v88)(v96, v98);
    uint64_t v61 = v73;
    uint64_t v34 = v70;
LABEL_19:
    uint64_t v33 = v103;
    if ((*v94)(v25, 1, v61) == 1) {
      goto LABEL_4;
    }
    uint64_t v74 = v86;
    sub_22D33DA68((uint64_t)v25, v86, type metadata accessor for SymbolMetadata);
    sub_22D33DA68(v74, v95, type metadata accessor for SymbolMetadata);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v33 = (void *)sub_22D3447D8(0, v33[2] + 1, 1, v33);
    }
    unint64_t v76 = v33[2];
    unint64_t v75 = v33[3];
    if (v76 >= v75 >> 1) {
      uint64_t v33 = (void *)sub_22D3447D8(v75 > 1, v76 + 1, 1, v33);
    }
    v33[2] = v76 + 1;
    sub_22D33DA68(v95, (uint64_t)v33+ ((*(unsigned __int8 *)(v87 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v87 + 80))+ *(void *)(v87 + 72) * v76, type metadata accessor for SymbolMetadata);
    uint64_t v34 = (uint64_t)v93;
LABEL_5:
    v32 += v101;
    --v31;
  }
  while (v31);
  swift_bridgeObjectRelease();
  return v33;
}

uint64_t sub_22D33F710(uint64_t result, uint64_t a2)
{
  unint64_t v2 = *(void *)(result + 16);
  if (v2)
  {
    uint64_t v3 = a2;
    unint64_t v4 = 0;
    uint64_t v31 = result + 32;
    uint64_t v5 = a2 + 56;
    uint64_t v28 = MEMORY[0x263F8EE78];
    unint64_t v29 = *(void *)(result + 16);
    while (1)
    {
      if (v4 <= v2) {
        unint64_t v6 = v2;
      }
      else {
        unint64_t v6 = v4;
      }
      unint64_t v34 = v6;
      while (1)
      {
        if (v4 == v34)
        {
          __break(1u);
          return result;
        }
        uint64_t v7 = v31 + 32 * v4;
        uint64_t v8 = *(void *)v7;
        uint64_t v9 = *(void *)(v7 + 24);
        ++v4;
        long long v33 = *(_OWORD *)(v7 + 8);
        uint64_t v10 = sub_22D34B758();
        uint64_t v12 = v11;
        if (*(void *)(v3 + 16)) {
          break;
        }
LABEL_8:
        uint64_t result = swift_bridgeObjectRelease();
        if (v4 == v2) {
          return v28;
        }
      }
      uint64_t v13 = v10;
      uint64_t v30 = v8;
      sub_22D34BA48();
      swift_bridgeObjectRetain();
      swift_retain();
      sub_22D34B778();
      uint64_t v14 = sub_22D34BA78();
      uint64_t v15 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v16 = v14 & ~v15;
      if (((*(void *)(v5 + ((v16 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v16) & 1) == 0) {
        goto LABEL_7;
      }
      uint64_t v17 = *(void *)(a2 + 48);
      uint64_t v18 = (void *)(v17 + 16 * v16);
      BOOL v19 = *v18 == v13 && v18[1] == v12;
      if (!v19 && (sub_22D34B9A8() & 1) == 0) {
        break;
      }
LABEL_24:
      swift_bridgeObjectRelease();
      uint64_t v23 = v28;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_22D33CA48(0, *(void *)(v28 + 16) + 1, 1);
        uint64_t v23 = v28;
      }
      unint64_t v2 = v29;
      uint64_t v24 = v30;
      unint64_t v26 = *(void *)(v23 + 16);
      unint64_t v25 = *(void *)(v23 + 24);
      if (v26 >= v25 >> 1)
      {
        uint64_t result = (uint64_t)sub_22D33CA48((char *)(v25 > 1), v26 + 1, 1);
        uint64_t v24 = v30;
        uint64_t v23 = v28;
      }
      *(void *)(v23 + 16) = v26 + 1;
      uint64_t v28 = v23;
      uint64_t v27 = v23 + 32 * v26;
      *(void *)(v27 + 32) = v24;
      *(_OWORD *)(v27 + 40) = v33;
      *(void *)(v27 + 56) = v9;
      uint64_t v3 = a2;
      if (v4 == v29) {
        return v28;
      }
    }
    uint64_t v20 = ~v15;
    while (1)
    {
      unint64_t v16 = (v16 + 1) & v20;
      if (((*(void *)(v5 + ((v16 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v16) & 1) == 0) {
        break;
      }
      uint64_t v21 = (void *)(v17 + 16 * v16);
      BOOL v22 = *v21 == v13 && v21[1] == v12;
      if (v22 || (sub_22D34B9A8() & 1) != 0) {
        goto LABEL_24;
      }
    }
LABEL_7:
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v3 = a2;
    unint64_t v2 = v29;
    goto LABEL_8;
  }
  return MEMORY[0x263F8EE78];
}

uint64_t sub_22D33F988(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for SymbolKey(0) - 8;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v19 - v10;
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v21 = MEMORY[0x263F8EE78];
  uint64_t v13 = *(void *)(a1 + 16);
  if (v13)
  {
    uint64_t v19 = v2;
    uint64_t v14 = *(void *)(v9 + 72);
    unint64_t v20 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    uint64_t v15 = a1 + v20;
    uint64_t v16 = MEMORY[0x263F8EE78];
    do
    {
      sub_22D33DAD0(v15, (uint64_t)v11, type metadata accessor for SymbolKey);
      if (sub_22D336D20((uint64_t)v11, a2))
      {
        sub_22D33DA68((uint64_t)v11, (uint64_t)v8, type metadata accessor for SymbolKey);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_22D33C9EC(0, *(void *)(v16 + 16) + 1, 1);
        }
        uint64_t v16 = v21;
        unint64_t v18 = *(void *)(v21 + 16);
        unint64_t v17 = *(void *)(v21 + 24);
        if (v18 >= v17 >> 1)
        {
          sub_22D33C9EC(v17 > 1, v18 + 1, 1);
          uint64_t v16 = v21;
        }
        *(void *)(v16 + 16) = v18 + 1;
        sub_22D33DA68((uint64_t)v8, v16 + v20 + v18 * v14, type metadata accessor for SymbolKey);
      }
      else
      {
        sub_22D33DB38((uint64_t)v11, type metadata accessor for SymbolKey);
      }
      v15 += v14;
      --v13;
    }
    while (v13);
    return v21;
  }
  return result;
}

uint64_t sub_22D33FBB0(uint64_t a1, uint64_t a2)
{
  uint64_t v37 = a2;
  uint64_t v34 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x270FA5388](v34);
  uint64_t v5 = (char *)v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268568848);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for SymbolKey(0) - 8;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v38 = (uint64_t)v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v31 - v13;
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v40 = MEMORY[0x263F8EE78];
  uint64_t v16 = *(void *)(a1 + 16);
  if (v16)
  {
    v31[0] = v2;
    unint64_t v17 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
    uint64_t v36 = *(void *)(v12 + 72);
    unint64_t v35 = v17;
    uint64_t v18 = a1 + v17;
    long long v33 = v5;
    uint64_t v19 = v5 + 104;
    uint64_t v20 = MEMORY[0x263F8EE78];
    while (1)
    {
      sub_22D33DAD0(v18, (uint64_t)v14, type metadata accessor for SymbolKey);
      SymbolMetadataStore.symbolMetadata(for:)((uint64_t)v14, (uint64_t)v8);
      uint64_t v27 = type metadata accessor for SymbolMetadata(0);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 48))(v8, 1, v27) == 1) {
        break;
      }
      uint64_t v28 = v33;
      sub_22D33DAD0((uint64_t)v8, (uint64_t)v33, type metadata accessor for SymbolMetadata.Backing);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        sub_22D33DB38((uint64_t)v28, type metadata accessor for SymbolMetadata.Backing);
        sub_22D33DB38((uint64_t)v8, type metadata accessor for SymbolMetadata);
        goto LABEL_10;
      }
      v31[2] = v28[2];
      uint64_t v32 = v28[5];
      v31[1] = v28[10];
      long long v21 = v19[7];
      v39[6] = v19[6];
      v39[7] = v21;
      long long v22 = v19[9];
      v39[8] = v19[8];
      v39[9] = v22;
      long long v23 = v19[3];
      v39[2] = v19[2];
      v39[3] = v23;
      long long v24 = v19[5];
      v39[4] = v19[4];
      v39[5] = v24;
      long long v25 = v19[1];
      v39[0] = *v19;
      v39[1] = v25;
      sub_22D335738(v39);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_22D33DB38((uint64_t)v8, type metadata accessor for SymbolMetadata);
      if (!v32) {
        goto LABEL_10;
      }
      swift_bridgeObjectRelease();
      sub_22D33DB38((uint64_t)v14, type metadata accessor for SymbolKey);
      uint64_t v26 = v36;
LABEL_5:
      v18 += v26;
      if (!--v16) {
        return v40;
      }
    }
    sub_22D3415D4((uint64_t)v8, &qword_268568848);
LABEL_10:
    sub_22D33DA68((uint64_t)v14, v38, type metadata accessor for SymbolKey);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      sub_22D33C9EC(0, *(void *)(v20 + 16) + 1, 1);
    }
    uint64_t v20 = v40;
    unint64_t v30 = *(void *)(v40 + 16);
    unint64_t v29 = *(void *)(v40 + 24);
    if (v30 >= v29 >> 1)
    {
      sub_22D33C9EC(v29 > 1, v30 + 1, 1);
      uint64_t v20 = v40;
    }
    *(void *)(v20 + 16) = v30 + 1;
    uint64_t v26 = v36;
    sub_22D33DA68(v38, v20 + v35 + v30 * v36, type metadata accessor for SymbolKey);
    goto LABEL_5;
  }
  return result;
}

uint64_t sub_22D340044(uint64_t a1, uint64_t a2)
{
  void (*v18)(char *__return_ptr, char *);
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;

  long long v24 = a2;
  uint64_t v4 = type metadata accessor for SymbolKey(0) - 8;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v21 - v9;
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v26 = MEMORY[0x263F8EE78];
  uint64_t v12 = *(void *)(a1 + 16);
  if (v12)
  {
    long long v21 = v2;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)(v8 + 72);
    long long v22 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    long long v23 = a1 + v22;
    uint64_t v15 = MEMORY[0x263F8EE78];
    do
    {
      sub_22D33DAD0(v23 + v14 * v13, (uint64_t)v10, type metadata accessor for SymbolKey);
      uint64_t v27 = *(void *)(v24 + 40);
      uint64_t v16 = *(void *)(v27 + 16);
      if (v16)
      {
        uint64_t v17 = swift_bridgeObjectRetain() + 40;
        do
        {
          uint64_t v18 = *(void (**)(char *__return_ptr, char *))(v17 - 8);
          swift_retain();
          v18(&v25, v10);
          swift_release();
          if (v25 != 1)
          {
            sub_22D341544((uint64_t)&v27);
            sub_22D33DB38((uint64_t)v10, type metadata accessor for SymbolKey);
            goto LABEL_4;
          }
          v17 += 16;
          --v16;
        }
        while (v16);
        sub_22D341544((uint64_t)&v27);
      }
      sub_22D33DA68((uint64_t)v10, (uint64_t)v7, type metadata accessor for SymbolKey);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_22D33C9EC(0, *(void *)(v15 + 16) + 1, 1);
      }
      uint64_t v15 = v26;
      uint64_t v20 = *(void *)(v26 + 16);
      uint64_t v19 = *(void *)(v26 + 24);
      if (v20 >= v19 >> 1)
      {
        sub_22D33C9EC(v19 > 1, v20 + 1, 1);
        uint64_t v15 = v26;
      }
      *(void *)(v15 + 16) = v20 + 1;
      sub_22D33DA68((uint64_t)v7, v15 + v22 + v20 * v14, type metadata accessor for SymbolKey);
LABEL_4:
      ++v13;
    }
    while (v13 != v12);
    return v26;
  }
  return result;
}

uint64_t sub_22D3402CC(uint64_t a1)
{
  return a1;
}

uint64_t sub_22D340334(uint64_t a1)
{
  return a1;
}

uint64_t sub_22D34039C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v23)(char *__return_ptr, char *);
  unint64_t v24;
  unint64_t v25;
  void v26[2];
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;

  unint64_t v29 = a3;
  uint64_t v34 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268568848);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v33 = type metadata accessor for SymbolMetadata(0);
  uint64_t v8 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for SymbolKey(0) - 8;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  unint64_t v30 = (uint64_t)v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v26 - v15;
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v36 = MEMORY[0x263F8EE78];
  uint64_t v32 = *(void *)(a1 + 16);
  if (v32)
  {
    v26[1] = v3;
    uint64_t v18 = 0;
    uint64_t v19 = *(void *)(v14 + 72);
    uint64_t v27 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
    uint64_t v31 = a1 + v27;
    uint64_t v20 = MEMORY[0x263F8EE78];
    uint64_t v28 = v19;
    while (1)
    {
      sub_22D33DAD0(v31 + v19 * v18, (uint64_t)v16, type metadata accessor for SymbolKey);
      SymbolMetadataStore.symbolMetadata(for:)((uint64_t)v16, (uint64_t)v7);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v7, 1, v33) == 1)
      {
        sub_22D3415D4((uint64_t)v7, &qword_268568848);
      }
      else
      {
        sub_22D33DA68((uint64_t)v7, (uint64_t)v10, type metadata accessor for SymbolMetadata);
        uint64_t v37 = *(void *)(v29 + 48);
        uint64_t v21 = *(void *)(v37 + 16);
        if (!v21)
        {
LABEL_12:
          sub_22D33DB38((uint64_t)v10, type metadata accessor for SymbolMetadata);
          sub_22D33DA68((uint64_t)v16, v30, type metadata accessor for SymbolKey);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            sub_22D33C9EC(0, *(void *)(v20 + 16) + 1, 1);
          }
          uint64_t v20 = v36;
          long long v25 = *(void *)(v36 + 16);
          long long v24 = *(void *)(v36 + 24);
          if (v25 >= v24 >> 1)
          {
            sub_22D33C9EC(v24 > 1, v25 + 1, 1);
            uint64_t v20 = v36;
          }
          *(void *)(v20 + 16) = v25 + 1;
          uint64_t v19 = v28;
          sub_22D33DA68(v30, v20 + v27 + v25 * v28, type metadata accessor for SymbolKey);
          goto LABEL_5;
        }
        uint64_t v22 = swift_bridgeObjectRetain() + 40;
        while (1)
        {
          long long v23 = *(void (**)(char *__return_ptr, char *))(v22 - 8);
          swift_retain();
          v23(&v35, v10);
          swift_release();
          if (v35 != 1) {
            break;
          }
          v22 += 16;
          if (!--v21)
          {
            sub_22D341544((uint64_t)&v37);
            goto LABEL_12;
          }
        }
        sub_22D341544((uint64_t)&v37);
        sub_22D33DB38((uint64_t)v10, type metadata accessor for SymbolMetadata);
        uint64_t v19 = v28;
      }
      sub_22D33DB38((uint64_t)v16, type metadata accessor for SymbolKey);
LABEL_5:
      if (++v18 == v32) {
        return v36;
      }
    }
  }
  return result;
}

uint64_t sub_22D3407A4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_22D340808()
{
  return sub_22D340850(&qword_268568860, (void (*)(uint64_t))type metadata accessor for SymbolKey);
}

uint64_t sub_22D340850(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22D340898@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + 112);
  return swift_bridgeObjectRetain();
}

uint64_t sub_22D3408A4(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a2 + 112) = v3;
  return sub_22D339F4C();
}

uint64_t *initializeBufferWithCopyOfBuffer for SymbolKey(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_22D34B6B8();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
  }
  return a1;
}

uint64_t destroy for SymbolKey(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    uint64_t v3 = sub_22D34B6B8();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  return result;
}

void *initializeWithCopy for SymbolKey(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_22D34B6B8();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithCopy for SymbolKey(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_22D33DB38((uint64_t)a1, type metadata accessor for SymbolKey);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_22D34B6B8();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

void *initializeWithTake for SymbolKey(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_22D34B6B8();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for SymbolKey(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_22D33DB38((uint64_t)a1, type metadata accessor for SymbolKey);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_22D34B6B8();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for SymbolKey(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for SymbolKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_22D340DE0()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_22D340DF0()
{
  uint64_t result = sub_22D34B6B8();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void destroy for SymbolMetadataStore(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 48)) {
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 152);
}

void *initializeWithCopy for SymbolMetadataStore(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v8 = a2 + 6;
  uint64_t v7 = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7)
  {
    uint64_t v9 = a2[7];
    a1[6] = v7;
    a1[7] = v9;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 3) = *v8;
  }
  uint64_t v10 = a2[9];
  a1[8] = a2[8];
  a1[9] = v10;
  uint64_t v11 = a2[11];
  a1[10] = a2[10];
  a1[11] = v11;
  uint64_t v12 = a2[13];
  a1[12] = a2[12];
  a1[13] = v12;
  uint64_t v13 = a2[15];
  a1[14] = a2[14];
  a1[15] = v13;
  uint64_t v14 = a2[17];
  uint64_t v20 = (void *)a2[16];
  a1[16] = v20;
  a1[17] = v14;
  uint64_t v16 = a2[18];
  uint64_t v15 = (void *)a2[19];
  a1[18] = v16;
  a1[19] = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v17 = v20;
  swift_bridgeObjectRetain();
  id v18 = v15;
  return a1;
}

void *assignWithCopy for SymbolMetadataStore(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[6];
  if (!a1[6])
  {
    if (v4)
    {
      uint64_t v6 = a2[7];
      a1[6] = v4;
      a1[7] = v6;
      swift_retain();
      goto LABEL_8;
    }
LABEL_7:
    *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
    goto LABEL_8;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v5 = a2[7];
  a1[6] = v4;
  a1[7] = v5;
  swift_retain();
  swift_release();
LABEL_8:
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[12] = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[13] = a2[13];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[14] = a2[14];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[15] = a2[15];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)a1[16];
  uint64_t v8 = (void *)a2[16];
  a1[16] = v8;
  id v9 = v8;

  a1[17] = a2[17];
  a1[18] = a2[18];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = (void *)a1[19];
  uint64_t v11 = (void *)a2[19];
  a1[19] = v11;
  id v12 = v11;

  return a1;
}

__n128 __swift_memcpy160_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  __n128 result = *(__n128 *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  long long v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(__n128 *)(a1 + 96) = result;
  *(_OWORD *)(a1 + 112) = v7;
  return result;
}

uint64_t assignWithTake for SymbolMetadataStore(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 48);
  if (!*(void *)(a1 + 48))
  {
    if (v4)
    {
      uint64_t v6 = *(void *)(a2 + 56);
      *(void *)(a1 + 48) = v4;
      *(void *)(a1 + 56) = v6;
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    goto LABEL_8;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = v4;
  *(void *)(a1 + 56) = v5;
  swift_release();
LABEL_8:
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  swift_bridgeObjectRelease();
  long long v7 = *(void **)(a1 + 128);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);

  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRelease();
  long long v8 = *(void **)(a1 + 152);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);

  return a1;
}

uint64_t getEnumTagSinglePayload for SymbolMetadataStore(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 160)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SymbolMetadataStore(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 152) = 0;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 160) = 1;
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
    *(unsigned char *)(result + 160) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SymbolMetadataStore()
{
  return &type metadata for SymbolMetadataStore;
}

uint64_t type metadata accessor for SymbolMetadataStore.RelevantSymbol(uint64_t a1)
{
  return sub_22D34150C(a1, (uint64_t *)&unk_2685688C8);
}

uint64_t sub_22D34150C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22D341544(uint64_t a1)
{
  return a1;
}

uint64_t sub_22D341570(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CustomSymbol();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_22D3415D4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *sub_22D341630(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    uint64_t v5 = *(int *)(a3 + 20);
    uint64_t v6 = (char *)a1 + v5;
    long long v7 = (char *)a2 + v5;
    type metadata accessor for SymbolMetadata.Backing(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v8 = sub_22D34B6B8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
      uint64_t v9 = *(int *)(type metadata accessor for CustomSymbol() + 20);
      uint64_t v10 = &v6[v9];
      uint64_t v11 = &v7[v9];
      uint64_t v12 = *((void *)v11 + 1);
      *(void *)uint64_t v10 = *(void *)v11;
      *((void *)v10 + 1) = v12;
      swift_bridgeObjectRetain();
    }
    else
    {
      *(_DWORD *)uint64_t v6 = *(_DWORD *)v7;
      uint64_t v14 = *((void *)v7 + 2);
      *((void *)v6 + 1) = *((void *)v7 + 1);
      *((void *)v6 + 2) = v14;
      v6[24] = v7[24];
      uint64_t v15 = *((void *)v7 + 5);
      *((void *)v6 + 4) = *((void *)v7 + 4);
      *((void *)v6 + 5) = v15;
      uint64_t v16 = *((void *)v7 + 7);
      *((void *)v6 + 6) = *((void *)v7 + 6);
      *((void *)v6 + 7) = v16;
      v6[64] = v7[64];
      uint64_t v17 = *((void *)v7 + 10);
      *((void *)v6 + 9) = *((void *)v7 + 9);
      *((void *)v6 + 10) = v17;
      v6[88] = v7[88];
      uint64_t v18 = *((void *)v7 + 13);
      *((void *)v6 + 12) = *((void *)v7 + 12);
      *((void *)v6 + 13) = v18;
      uint64_t v19 = *((void *)v7 + 15);
      *((void *)v6 + 14) = *((void *)v7 + 14);
      *((void *)v6 + 15) = v19;
      uint64_t v20 = *((void *)v7 + 17);
      *((void *)v6 + 16) = *((void *)v7 + 16);
      *((void *)v6 + 17) = v20;
      *((void *)v6 + 18) = *((void *)v7 + 18);
      uint64_t v33 = *((void *)v7 + 19);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v33)
      {
        uint64_t v21 = *((void *)v7 + 20);
        *((void *)v6 + 19) = v33;
        *((void *)v6 + 20) = v21;
        swift_retain();
      }
      else
      {
        *(_OWORD *)(v6 + 152) = *(_OWORD *)(v7 + 152);
      }
      uint64_t v22 = *((void *)v7 + 22);
      *((void *)v6 + 21) = *((void *)v7 + 21);
      *((void *)v6 + 22) = v22;
      uint64_t v23 = *((void *)v7 + 24);
      *((void *)v6 + 23) = *((void *)v7 + 23);
      *((void *)v6 + 24) = v23;
      uint64_t v24 = *((void *)v7 + 26);
      *((void *)v6 + 25) = *((void *)v7 + 25);
      *((void *)v6 + 26) = v24;
      uint64_t v25 = *((void *)v7 + 28);
      *((void *)v6 + 27) = *((void *)v7 + 27);
      *((void *)v6 + 28) = v25;
      uint64_t v27 = (void *)*((void *)v7 + 29);
      uint64_t v26 = *((void *)v7 + 30);
      *((void *)v6 + 29) = v27;
      *((void *)v6 + 30) = v26;
      uint64_t v28 = *((void *)v7 + 31);
      unint64_t v29 = (void *)*((void *)v7 + 32);
      uint64_t v34 = v27;
      *((void *)v6 + 31) = v28;
      *((void *)v6 + 32) = v29;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v30 = v34;
      swift_bridgeObjectRetain();
      id v31 = v29;
    }
    swift_storeEnumTagMultiPayload();
  }
  return v3;
}

void sub_22D341908(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  type metadata accessor for SymbolMetadata.Backing(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v3 = sub_22D34B6B8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
    type metadata accessor for CustomSymbol();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*(void *)(v2 + 152)) {
      swift_release();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    int v4 = *(void **)(v2 + 256);
  }
}

void *sub_22D341A84(void *a1, void *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  type metadata accessor for SymbolMetadata.Backing(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_22D34B6B8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
    uint64_t v8 = *(int *)(type metadata accessor for CustomSymbol() + 20);
    uint64_t v9 = &v5[v8];
    uint64_t v10 = &v6[v8];
    uint64_t v11 = *((void *)v10 + 1);
    *(void *)uint64_t v9 = *(void *)v10;
    *((void *)v9 + 1) = v11;
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v32 = v3;
    *(_DWORD *)uint64_t v5 = *(_DWORD *)v6;
    uint64_t v12 = *((void *)v6 + 2);
    *((void *)v5 + 1) = *((void *)v6 + 1);
    *((void *)v5 + 2) = v12;
    v5[24] = v6[24];
    uint64_t v13 = *((void *)v6 + 5);
    *((void *)v5 + 4) = *((void *)v6 + 4);
    *((void *)v5 + 5) = v13;
    uint64_t v14 = *((void *)v6 + 7);
    *((void *)v5 + 6) = *((void *)v6 + 6);
    *((void *)v5 + 7) = v14;
    v5[64] = v6[64];
    uint64_t v15 = *((void *)v6 + 10);
    *((void *)v5 + 9) = *((void *)v6 + 9);
    *((void *)v5 + 10) = v15;
    v5[88] = v6[88];
    uint64_t v16 = *((void *)v6 + 13);
    *((void *)v5 + 12) = *((void *)v6 + 12);
    *((void *)v5 + 13) = v16;
    uint64_t v17 = *((void *)v6 + 15);
    *((void *)v5 + 14) = *((void *)v6 + 14);
    *((void *)v5 + 15) = v17;
    uint64_t v29 = *((void *)v6 + 17);
    *((void *)v5 + 16) = *((void *)v6 + 16);
    *((void *)v5 + 17) = v29;
    *((void *)v5 + 18) = *((void *)v6 + 18);
    uint64_t v30 = *((void *)v6 + 19);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v30)
    {
      uint64_t v18 = *((void *)v6 + 20);
      *((void *)v5 + 19) = v30;
      *((void *)v5 + 20) = v18;
      swift_retain();
    }
    else
    {
      *(_OWORD *)(v5 + 152) = *(_OWORD *)(v6 + 152);
    }
    uint64_t v19 = *((void *)v6 + 22);
    *((void *)v5 + 21) = *((void *)v6 + 21);
    *((void *)v5 + 22) = v19;
    uint64_t v20 = *((void *)v6 + 24);
    *((void *)v5 + 23) = *((void *)v6 + 23);
    *((void *)v5 + 24) = v20;
    uint64_t v21 = *((void *)v6 + 26);
    *((void *)v5 + 25) = *((void *)v6 + 25);
    *((void *)v5 + 26) = v21;
    uint64_t v22 = *((void *)v6 + 28);
    *((void *)v5 + 27) = *((void *)v6 + 27);
    *((void *)v5 + 28) = v22;
    uint64_t v23 = *((void *)v6 + 30);
    id v31 = (void *)*((void *)v6 + 29);
    *((void *)v5 + 29) = v31;
    *((void *)v5 + 30) = v23;
    uint64_t v25 = *((void *)v6 + 31);
    uint64_t v24 = (void *)*((void *)v6 + 32);
    *((void *)v5 + 31) = v25;
    *((void *)v5 + 32) = v24;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v26 = v31;
    swift_bridgeObjectRetain();
    id v27 = v24;
    uint64_t v3 = v32;
  }
  swift_storeEnumTagMultiPayload();
  return v3;
}

void *sub_22D341D00(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  if (a1 != a2)
  {
    uint64_t v4 = *(int *)(a3 + 20);
    uint64_t v5 = (char *)a1 + v4;
    uint64_t v6 = (char *)a2 + v4;
    sub_22D33DB38((uint64_t)a1 + v4, type metadata accessor for SymbolMetadata.Backing);
    type metadata accessor for SymbolMetadata.Backing(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_22D34B6B8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
      uint64_t v8 = *(int *)(type metadata accessor for CustomSymbol() + 20);
      uint64_t v9 = &v5[v8];
      uint64_t v10 = &v6[v8];
      *(void *)uint64_t v9 = *(void *)v10;
      *((void *)v9 + 1) = *((void *)v10 + 1);
      swift_bridgeObjectRetain();
    }
    else
    {
      *(_DWORD *)uint64_t v5 = *(_DWORD *)v6;
      *((void *)v5 + 1) = *((void *)v6 + 1);
      *((void *)v5 + 2) = *((void *)v6 + 2);
      v5[24] = v6[24];
      *((void *)v5 + 4) = *((void *)v6 + 4);
      *((void *)v5 + 5) = *((void *)v6 + 5);
      *((void *)v5 + 6) = *((void *)v6 + 6);
      *((void *)v5 + 7) = *((void *)v6 + 7);
      v5[64] = v6[64];
      *((void *)v5 + 9) = *((void *)v6 + 9);
      *((void *)v5 + 10) = *((void *)v6 + 10);
      v5[88] = v6[88];
      *((void *)v5 + 12) = *((void *)v6 + 12);
      *((void *)v5 + 13) = *((void *)v6 + 13);
      *((void *)v5 + 14) = *((void *)v6 + 14);
      *((void *)v5 + 15) = *((void *)v6 + 15);
      *((void *)v5 + 16) = *((void *)v6 + 16);
      *((void *)v5 + 17) = *((void *)v6 + 17);
      *((void *)v5 + 18) = *((void *)v6 + 18);
      uint64_t v16 = *((void *)v6 + 19);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v16)
      {
        uint64_t v11 = *((void *)v6 + 20);
        *((void *)v5 + 19) = v16;
        *((void *)v5 + 20) = v11;
        swift_retain();
      }
      else
      {
        *(_OWORD *)(v5 + 152) = *(_OWORD *)(v6 + 152);
      }
      *((void *)v5 + 21) = *((void *)v6 + 21);
      *((void *)v5 + 22) = *((void *)v6 + 22);
      *((void *)v5 + 23) = *((void *)v6 + 23);
      *((void *)v5 + 24) = *((void *)v6 + 24);
      *((void *)v5 + 25) = *((void *)v6 + 25);
      *((void *)v5 + 26) = *((void *)v6 + 26);
      *((void *)v5 + 27) = *((void *)v6 + 27);
      *((void *)v5 + 28) = *((void *)v6 + 28);
      uint64_t v17 = (void *)*((void *)v6 + 29);
      *((void *)v5 + 29) = v17;
      *((void *)v5 + 30) = *((void *)v6 + 30);
      *((void *)v5 + 31) = *((void *)v6 + 31);
      uint64_t v12 = (void *)*((void *)v6 + 32);
      *((void *)v5 + 32) = v12;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v13 = v17;
      swift_bridgeObjectRetain();
      id v14 = v12;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_22D34201C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = type metadata accessor for SymbolMetadata.Backing(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_22D34B6B8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v5, v6, v8);
    uint64_t v9 = type metadata accessor for CustomSymbol();
    *(_OWORD *)&v5[*(int *)(v9 + 20)] = *(_OWORD *)&v6[*(int *)(v9 + 20)];
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  return a1;
}

void *sub_22D342100(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  if (a1 != a2)
  {
    uint64_t v4 = *(int *)(a3 + 20);
    uint64_t v5 = (char *)a1 + v4;
    uint64_t v6 = (char *)a2 + v4;
    sub_22D33DB38((uint64_t)a1 + v4, type metadata accessor for SymbolMetadata.Backing);
    uint64_t v7 = type metadata accessor for SymbolMetadata.Backing(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v8 = sub_22D34B6B8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v5, v6, v8);
      uint64_t v9 = type metadata accessor for CustomSymbol();
      *(_OWORD *)&v5[*(int *)(v9 + 20)] = *(_OWORD *)&v6[*(int *)(v9 + 20)];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_22D342208(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22D34221C);
}

uint64_t sub_22D34221C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1 + *(int *)(a3 + 20);
  uint64_t v5 = type metadata accessor for SymbolMetadata(0);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48);
  return v6(v4, a2, v5);
}

uint64_t sub_22D34228C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22D3422A0);
}

uint64_t sub_22D3422A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1 + *(int *)(a4 + 20);
  uint64_t v6 = type metadata accessor for SymbolMetadata(0);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(v5, a2, a2, v6);
}

uint64_t sub_22D342314()
{
  uint64_t result = type metadata accessor for SymbolMetadata.Backing(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

BOOL sub_22D3423B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  if (*(_DWORD *)(a1 + 32) != *(_DWORD *)(a2 + 32)) {
    return 0;
  }
  if (v2 == 1) {
    return 1;
  }
  uint64_t v4 = v2 - 2;
  uint64_t v5 = (int *)(a1 + 36);
  uint64_t v6 = (int *)(a2 + 36);
  do
  {
    int v8 = *v5++;
    int v7 = v8;
    int v10 = *v6++;
    int v9 = v10;
    BOOL v12 = v4-- != 0;
    BOOL result = v7 == v9;
  }
  while (v7 == v9 && v12);
  return result;
}

uint64_t sub_22D342424(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (char v6 = sub_22D34B9A8(), result = 0, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1;
    }
    int v9 = a1 + 7;
    for (unint64_t i = a2 + 7; ; i += 2)
    {
      BOOL v11 = *(v9 - 1) == *(i - 1) && *v9 == *i;
      if (!v11 && (sub_22D34B9A8() & 1) == 0) {
        break;
      }
      v9 += 2;
      if (!--v8) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

BOOL sub_22D3424EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  if (*(unsigned __int8 *)(a1 + 32) != *(unsigned __int8 *)(a2 + 32)) {
    return 0;
  }
  if (v2 == 1) {
    return 1;
  }
  uint64_t v4 = v2 - 2;
  BOOL v5 = (unsigned __int8 *)(a1 + 33);
  char v6 = (unsigned __int8 *)(a2 + 33);
  do
  {
    int v8 = *v5++;
    int v7 = v8;
    int v10 = *v6++;
    int v9 = v10;
    BOOL v12 = v4-- != 0;
    BOOL result = v7 == v9;
  }
  while (v7 == v9 && v12);
  return result;
}

const __CFData *static Crypton.encryptObfuscateFontTable(tableTag:from:)(CTFontTableTag table, CTFontRef font)
{
  CFDataRef v2 = CTFontCopyTable(font, table, 0);
  if (!v2) {
    return v2;
  }
  uint64_t v3 = sub_22D34B678();
  unint64_t v5 = v4;

  CFDataRef result = (const __CFData *)sub_22D342680(0, v3, v5);
  if (v7 >> 60 != 15)
  {
    CFDataRef v2 = result;
    sub_22D32E214(v3, v5);
    return v2;
  }
  __break(1u);
  return result;
}

void *static Crypton.decryptObfuscatedFontTable(tableTag:from:)(CTFontTableTag table, CTFontRef font)
{
  CFDataRef v2 = CTFontCopyTable(font, table, 0);
  if (v2)
  {
    uint64_t v3 = sub_22D34B678();
    unint64_t v5 = v4;

    CFDataRef v2 = (void *)sub_22D342680(1, v3, v5);
    sub_22D32E214(v3, v5);
  }
  return v2;
}

uint64_t sub_22D342680(char a1, unint64_t a2, unint64_t a3)
{
  uint64_t v102 = *MEMORY[0x263EF8340];
  if (a1) {
    char v3 = -1;
  }
  else {
    char v3 = 1;
  }
  unint64_t v4 = a3 >> 62;
  unint64_t v6 = a2;
  uint64_t v7 = 0;
  unint64_t v94 = HIDWORD(a2);
  unint64_t v95 = BYTE6(a3);
  switch(a3 >> 62)
  {
    case 1uLL:
      LODWORD(v7) = HIDWORD(a2) - a2;
      if (__OFSUB__(HIDWORD(a2), a2)) {
        goto LABEL_181;
      }
      uint64_t v7 = (int)v7;
LABEL_9:
      if (__OFADD__(v7, 8 * v3)) {
        goto LABEL_177;
      }
      break;
    case 2uLL:
      uint64_t v9 = *(void *)(a2 + 16);
      uint64_t v8 = *(void *)(a2 + 24);
      BOOL v10 = __OFSUB__(v8, v9);
      uint64_t v7 = v8 - v9;
      if (!v10) {
        goto LABEL_9;
      }
      goto LABEL_182;
    case 3uLL:
      goto LABEL_9;
    default:
      uint64_t v7 = BYTE6(a3);
      goto LABEL_9;
  }
  uint64_t v11 = sub_22D343228(v7 + 8 * v3);
  uint64_t v100 = v11;
  unint64_t v101 = v12;
  uint64_t v88 = (uint64_t)v6 >> 32;
  uint64_t v89 = (int)v6;
  id v13 = &unk_26E06D860;
  unint64_t v86 = v6 >> 16;
  unint64_t v87 = v6 >> 8;
  unint64_t v84 = v6 >> 40;
  unint64_t v85 = v6 >> 24;
  unint64_t v82 = HIBYTE(v6);
  unint64_t v83 = HIWORD(v6);
  unint64_t v80 = a3 >> 16;
  unint64_t v81 = a3 >> 8;
  unint64_t v78 = HIDWORD(a3);
  unint64_t v79 = a3 >> 24;
  unint64_t v77 = a3 >> 40;
  unint64_t v96 = v6;
  char v92 = a3;
  switch((int)v4)
  {
    case 1:
      LODWORD(v14) = v94 - v6;
      if (__OFSUB__(v94, v6)) {
        goto LABEL_183;
      }
      int64_t v14 = (int)v14;
LABEL_15:
      if ((a1 & 1) == 0)
      {
        if (v4)
        {
          if (v4 == 1)
          {
            LODWORD(v17) = v94 - v6;
            if (__OFSUB__(v94, v6)) {
              goto LABEL_185;
            }
            unint64_t v17 = (int)v17;
          }
          else
          {
            uint64_t v38 = *(void *)(v6 + 16);
            uint64_t v37 = *(void *)(v6 + 24);
            BOOL v10 = __OFSUB__(v37, v38);
            unint64_t v17 = v37 - v38;
            if (v10) {
              goto LABEL_186;
            }
          }
        }
        else
        {
          unint64_t v17 = v95;
        }
LABEL_51:
        BOOL v10 = __OFADD__(v17, 8);
        uint64_t v39 = v17 + 8;
        if (v10) {
          goto LABEL_180;
        }
        uint64_t v18 = v39 % 10;
        if (((v39 % 10) & 0x8000000000000000) == 0)
        {
          sub_22D34B668();
          uint64_t v40 = (unint64_t)(v18 + 1) < 0xA ? v18 + 1 : v18 - 9;
          if ((v40 & 0x8000000000000000) == 0)
          {
            sub_22D34B668();
            uint64_t v41 = v18 + 2;
            if ((unint64_t)(v18 + 2) >= 0xA) {
              uint64_t v41 = v18 - 8;
            }
            if ((v41 & 0x8000000000000000) == 0)
            {
              sub_22D34B668();
              uint64_t v42 = v18 + 3;
              if ((unint64_t)(v18 + 3) >= 0xA) {
                uint64_t v42 = v18 - 7;
              }
              if ((v42 & 0x8000000000000000) == 0)
              {
                sub_22D34B668();
                uint64_t v43 = v18 + 4;
                if ((unint64_t)(v18 + 4) >= 0xA) {
                  uint64_t v43 = v18 - 6;
                }
                if ((v43 & 0x8000000000000000) == 0)
                {
                  sub_22D34B668();
                  uint64_t v44 = v18 + 5;
                  if ((unint64_t)(v18 + 5) >= 0xA) {
                    uint64_t v44 = v18 - 5;
                  }
                  if ((v44 & 0x8000000000000000) == 0)
                  {
                    sub_22D34B668();
                    uint64_t v45 = v18 + 6;
                    if ((unint64_t)(v18 + 6) >= 0xA) {
                      uint64_t v45 = v18 - 4;
                    }
                    if ((v45 & 0x8000000000000000) == 0)
                    {
                      sub_22D34B668();
                      uint64_t v46 = v18 + 7;
                      if ((unint64_t)(v18 + 7) >= 0xA) {
                        uint64_t v46 = v18 - 3;
                      }
                      if ((v46 & 0x8000000000000000) == 0)
                      {
                        sub_22D34B668();
                        sub_22D34B698();
                        uint64_t v35 = 0;
                        uint64_t v91 = 8;
LABEL_76:
                        int v74 = v3;
                        if ((char)(v13[v18 + 32] * v3) != (char)v13[v18 + 32] * v3) {
                          goto LABEL_179;
                        }
                        uint64_t v76 = v18;
                        sub_22D34B668();
                        BOOL v47 = __OFSUB__(v94, v6);
                        BOOL v72 = v47;
                        if (v4 == 3) {
                          return v100;
                        }
                        uint64_t v48 = 0;
                        uint64_t v71 = (int)v94 - (int)v6;
                        uint64_t v49 = 0x7FFFFFFFFFFFFFFELL;
                        uint64_t v50 = v95;
                        if (!v4) {
                          goto LABEL_87;
                        }
LABEL_83:
                        if (v4 != 1)
                        {
                          uint64_t v52 = *(void *)(v96 + 16);
                          uint64_t v51 = *(void *)(v96 + 24);
                          BOOL v10 = __OFSUB__(v51, v52);
                          uint64_t v50 = v51 - v52;
                          if (!v10)
                          {
LABEL_87:
                            while (1)
                            {
                              uint64_t v53 = v35 + 1;
                              if (v35 + 1 >= v50) {
                                return v100;
                              }
                              uint64_t v54 = v48 + 1;
                              if (a1)
                              {
                                switch(v101 >> 62)
                                {
                                  case 1uLL:
                                    if (v54 > v100 >> 32 || v54 <= (int)v100) {
                                      goto LABEL_169;
                                    }
                                    uint64_t v63 = sub_22D34B548();
                                    if (!v63) {
                                      goto LABEL_194;
                                    }
                                    uint64_t v56 = v63;
                                    uint64_t v64 = sub_22D34B568();
                                    uint64_t v58 = v48 - v64;
                                    if (!__OFSUB__(v48, v64)) {
                                      goto LABEL_120;
                                    }
                                    goto LABEL_173;
                                  case 2uLL:
                                    if (v54 <= *(void *)(v100 + 16)) {
                                      goto LABEL_170;
                                    }
                                    if (v54 > *(void *)(v100 + 24)) {
                                      goto LABEL_174;
                                    }
                                    uint64_t v65 = sub_22D34B548();
                                    if (!v65) {
                                      goto LABEL_195;
                                    }
                                    uint64_t v56 = v65;
                                    uint64_t v66 = sub_22D34B568();
                                    uint64_t v58 = v48 - v66;
                                    if (!__OFSUB__(v48, v66)) {
                                      goto LABEL_120;
                                    }
                                    goto LABEL_176;
                                  case 3uLL:
                                    goto LABEL_192;
                                  default:
                                    if (v54 > (unint64_t)BYTE6(v101)) {
                                      goto LABEL_166;
                                    }
                                    uint64_t v97 = v100;
                                    __int16 v98 = v101;
                                    int v99 = *(_DWORD *)((char *)&v101 + 2);
                                    uint64_t v59 = *((unsigned __int8 *)&v97 + v48);
                                    goto LABEL_121;
                                }
                              }
                              if (v4)
                              {
                                if (v4 == 1)
                                {
                                  if (v53 <= v89 || v53 > v88) {
                                    goto LABEL_165;
                                  }
                                  uint64_t v55 = sub_22D34B548();
                                  if (!v55) {
                                    goto LABEL_191;
                                  }
                                  uint64_t v56 = v55;
                                  uint64_t v57 = sub_22D34B568();
                                  uint64_t v58 = v35 - v57;
                                  if (__OFSUB__(v35, v57)) {
                                    goto LABEL_171;
                                  }
                                }
                                else
                                {
                                  if (v53 <= *(void *)(v96 + 16)) {
                                    goto LABEL_168;
                                  }
                                  if (v53 > *(void *)(v96 + 24)) {
                                    goto LABEL_172;
                                  }
                                  uint64_t v60 = sub_22D34B548();
                                  if (!v60) {
                                    goto LABEL_193;
                                  }
                                  uint64_t v56 = v60;
                                  uint64_t v61 = sub_22D34B568();
                                  uint64_t v58 = v35 - v61;
                                  if (__OFSUB__(v35, v61)) {
                                    goto LABEL_175;
                                  }
                                }
LABEL_120:
                                uint64_t v59 = *(unsigned __int8 *)(v56 + v58);
                              }
                              else
                              {
                                if (v53 > v95) {
                                  goto LABEL_167;
                                }
                                LOBYTE(v97) = v96;
                                BYTE1(v97) = v87;
                                BYTE2(v97) = v86;
                                BYTE3(v97) = v85;
                                BYTE4(v97) = v94;
                                BYTE5(v97) = v84;
                                BYTE6(v97) = v83;
                                HIBYTE(v97) = v82;
                                LOBYTE(v98) = v92;
                                HIBYTE(v98) = v81;
                                LOBYTE(v99) = v80;
                                BYTE1(v99) = v79;
                                BYTE2(v99) = v78;
                                HIBYTE(v99) = v77;
                                uint64_t v59 = *((unsigned __int8 *)&v97 + v35);
                              }
LABEL_121:
                              BOOL v10 = __OFADD__(v59, v54);
                              uint64_t v67 = v59 + v54;
                              if (v10) {
                                goto LABEL_144;
                              }
                              BOOL v10 = __OFADD__(v67, v76);
                              uint64_t v68 = v67 + v76;
                              if (v10) {
                                goto LABEL_145;
                              }
                              uint64_t v69 = v68 % 10;
                              if (v69 < 0) {
                                goto LABEL_146;
                              }
                              if (__OFADD__(v91, v54)) {
                                goto LABEL_147;
                              }
                              char v70 = *((unsigned char *)&unk_26E06D860 + v69 + 32);
                              if (v4)
                              {
                                if (v4 == 1)
                                {
                                  if (v53 < v89 || v53 >= v88) {
                                    goto LABEL_159;
                                  }
                                  if (!sub_22D34B548()) {
                                    goto LABEL_189;
                                  }
                                  if (__OFSUB__(v53, sub_22D34B568())) {
                                    goto LABEL_162;
                                  }
                                }
                                else
                                {
                                  if (v53 < *(void *)(v96 + 16)) {
                                    goto LABEL_161;
                                  }
                                  if (v53 >= *(void *)(v96 + 24)) {
                                    goto LABEL_163;
                                  }
                                  if (!sub_22D34B548()) {
                                    goto LABEL_190;
                                  }
                                  if (__OFSUB__(v53, sub_22D34B568())) {
                                    goto LABEL_164;
                                  }
                                }
                              }
                              else
                              {
                                if (v53 >= v95) {
                                  goto LABEL_160;
                                }
                                BYTE1(v97) = v87;
                                BYTE2(v97) = v86;
                                BYTE3(v97) = v85;
                                BYTE4(v97) = v94;
                                BYTE5(v97) = v84;
                                BYTE6(v97) = v83;
                                HIBYTE(v97) = v82;
                                LOBYTE(v98) = v92;
                                HIBYTE(v98) = v81;
                                LOBYTE(v99) = v80;
                                BYTE1(v99) = v79;
                                BYTE2(v99) = v78;
                                HIBYTE(v99) = v77;
                              }
                              if ((char)(v70 * v74) != v70 * v74) {
                                goto LABEL_148;
                              }
                              sub_22D34B668();
                              if (!v49) {
                                goto LABEL_149;
                              }
                              --v49;
                              ++v35;
                              ++v48;
                              uint64_t v50 = v95;
                              if (v4) {
                                goto LABEL_83;
                              }
                            }
                          }
LABEL_158:
                          __break(1u);
LABEL_159:
                          __break(1u);
LABEL_160:
                          __break(1u);
LABEL_161:
                          __break(1u);
LABEL_162:
                          __break(1u);
LABEL_163:
                          __break(1u);
LABEL_164:
                          __break(1u);
LABEL_165:
                          __break(1u);
LABEL_166:
                          __break(1u);
LABEL_167:
                          __break(1u);
LABEL_168:
                          __break(1u);
LABEL_169:
                          __break(1u);
LABEL_170:
                          __break(1u);
LABEL_171:
                          __break(1u);
LABEL_172:
                          __break(1u);
LABEL_173:
                          __break(1u);
LABEL_174:
                          __break(1u);
LABEL_175:
                          __break(1u);
LABEL_176:
                          __break(1u);
LABEL_177:
                          __break(1u);
                          goto LABEL_178;
                        }
                        uint64_t v50 = v71;
                        if (!v72) {
                          goto LABEL_87;
                        }
LABEL_157:
                        __break(1u);
                        goto LABEL_158;
                      }
                    }
                  }
                }
              }
            }
          }
        }
LABEL_156:
        __break(1u);
        goto LABEL_157;
      }
      uint64_t v18 = v14 % 10;
LABEL_22:
      char v73 = v3;
      unint64_t v75 = v12;
      uint64_t v90 = v11;
      if (v4 == 3)
      {
        __break(1u);
        JUMPOUT(0x22D3431E8);
      }
      uint64_t v19 = 0;
      uint64_t v20 = (char *)MEMORY[0x263F8EE78];
      do
      {
        if (v4)
        {
          if (v4 == 1)
          {
            if (v19 < v89 || v19 >= v88) {
              goto LABEL_150;
            }
            uint64_t v21 = sub_22D34B548();
            if (!v21) {
              goto LABEL_187;
            }
            uint64_t v22 = v21;
            uint64_t v23 = sub_22D34B568();
            uint64_t v24 = v19 - v23;
            if (__OFSUB__(v19, v23)) {
              goto LABEL_153;
            }
          }
          else
          {
            if (v19 < *(void *)(v6 + 16)) {
              goto LABEL_152;
            }
            if (v19 >= *(void *)(v6 + 24)) {
              goto LABEL_154;
            }
            uint64_t v26 = sub_22D34B548();
            if (!v26) {
              goto LABEL_188;
            }
            uint64_t v22 = v26;
            uint64_t v27 = sub_22D34B568();
            uint64_t v24 = v19 - v27;
            if (__OFSUB__(v19, v27)) {
              goto LABEL_155;
            }
          }
          char v25 = *(unsigned char *)(v22 + v24);
        }
        else
        {
          if (v19 >= v95) {
            goto LABEL_151;
          }
          LOBYTE(v97) = v6;
          BYTE1(v97) = v87;
          BYTE2(v97) = v86;
          BYTE3(v97) = v85;
          BYTE4(v97) = v94;
          BYTE5(v97) = v84;
          BYTE6(v97) = v83;
          HIBYTE(v97) = v82;
          LOBYTE(v98) = v92;
          HIBYTE(v98) = v81;
          LOBYTE(v99) = v80;
          BYTE1(v99) = v79;
          BYTE2(v99) = v78;
          HIBYTE(v99) = v77;
          char v25 = *((unsigned char *)&v97 + v19);
        }
        uint64_t v28 = (v18 + v19) % 10;
        if (v28 < 0)
        {
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
LABEL_154:
          __break(1u);
LABEL_155:
          __break(1u);
          goto LABEL_156;
        }
        uint64_t v29 = v18;
        uint64_t v30 = v13;
        char v31 = v13[v28 + 32];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v20 = sub_22D3446AC(0, *((void *)v20 + 2) + 1, 1, v20);
        }
        unint64_t v33 = *((void *)v20 + 2);
        unint64_t v32 = *((void *)v20 + 3);
        if (v33 >= v32 >> 1) {
          uint64_t v20 = sub_22D3446AC((char *)(v32 > 1), v33 + 1, 1, v20);
        }
        ++v19;
        *((void *)v20 + 2) = v33 + 1;
        v20[v33 + 32] = v25 + (v31 ^ 0x7F) + 1;
        unint64_t v6 = v96;
        id v13 = v30;
        uint64_t v18 = v29;
      }
      while (v19 != 8);
      BOOL v34 = sub_22D3424EC((uint64_t)&unk_26E06D838, (uint64_t)v20);
      swift_bridgeObjectRelease();
      if (v34)
      {
        uint64_t v35 = 8;
        sub_22D34B698();
        if ((v29 & 0x8000000000000000) == 0)
        {
          uint64_t v91 = 0;
          char v3 = v73;
          goto LABEL_76;
        }
LABEL_178:
        __break(1u);
LABEL_179:
        __break(1u);
LABEL_180:
        __break(1u);
LABEL_181:
        __break(1u);
LABEL_182:
        __break(1u);
LABEL_183:
        __break(1u);
LABEL_184:
        __break(1u);
LABEL_185:
        __break(1u);
LABEL_186:
        __break(1u);
LABEL_187:
        __break(1u);
LABEL_188:
        __break(1u);
LABEL_189:
        __break(1u);
LABEL_190:
        __break(1u);
LABEL_191:
        __break(1u);
LABEL_192:
        __break(1u);
LABEL_193:
        __break(1u);
LABEL_194:
        __break(1u);
LABEL_195:
        __break(1u);
      }
      sub_22D32E214(v90, v75);
      return 0;
    case 2:
      uint64_t v16 = *(void *)(v6 + 16);
      uint64_t v15 = *(void *)(v6 + 24);
      BOOL v10 = __OFSUB__(v15, v16);
      int64_t v14 = v15 - v16;
      if (!v10) {
        goto LABEL_15;
      }
      goto LABEL_184;
    case 3:
      unint64_t v17 = 0;
      uint64_t v18 = 0;
      if (a1) {
        goto LABEL_22;
      }
      goto LABEL_51;
    default:
      int64_t v14 = v95;
      goto LABEL_15;
  }
}

ValueMetadata *type metadata accessor for Crypton()
{
  return &type metadata for Crypton;
}

uint64_t sub_22D343228(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      sub_22D34B578();
      swift_allocObject();
      sub_22D34B558();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_22D34B658();
        CFDataRef result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

SFSymbols::Version_optional __swiftcall Version.init(string:)(Swift::String string)
{
  object = string._object;
  uint64_t countAndFlagsBits = string._countAndFlagsBits;
  uint64_t v4 = v1;
  uint64_t v5 = sub_22D34B538();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = countAndFlagsBits;
  uint64_t v55 = (uint64_t)object;
  sub_22D34B4E8();
  sub_22D333420();
  uint64_t v9 = sub_22D34B878();
  uint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRelease();
  uint64_t v54 = v9;
  uint64_t v55 = v11;
  uint64_t v52 = 46;
  unint64_t v53 = 0xE100000000000000;
  uint64_t v12 = sub_22D34B868();
  swift_bridgeObjectRelease();
  unint64_t v13 = *(void *)(v12 + 16);
  if (v13 - 4 < 0xFFFFFFFFFFFFFFFDLL)
  {
LABEL_59:
    Swift::Int isUniquelyReferenced_nonNull_native = swift_bridgeObjectRelease();
    *(void *)uint64_t v4 = 0;
    *(void *)(v4 + 8) = 0;
    *(void *)(v4 + 16) = 0;
    *(unsigned char *)(v4 + 24) = 1;
    goto LABEL_71;
  }
  uint64_t v50 = (char *)&v54 + 1;
  uint64_t v51 = (char *)&v54 + 2;
  Swift::Int isUniquelyReferenced_nonNull_native = swift_bridgeObjectRetain();
  uint64_t v17 = 0;
  Swift::Int v18 = MEMORY[0x263F8EE78];
  while (1)
  {
    uint64_t v19 = (uint64_t *)(v12 + 32 + 16 * v17);
    uint64_t v20 = *v19;
    unint64_t v21 = v19[1];
    uint64_t v22 = HIBYTE(v21) & 0xF;
    uint64_t v23 = v20 & 0xFFFFFFFFFFFFLL;
    if ((v21 & 0x2000000000000000) != 0) {
      uint64_t v24 = HIBYTE(v21) & 0xF;
    }
    else {
      uint64_t v24 = v20 & 0xFFFFFFFFFFFFLL;
    }
    if (!v24) {
      goto LABEL_4;
    }
    if ((v21 & 0x1000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v27 = (uint64_t)sub_22D344C28(v20, v21, 10);
      char v43 = v42;
      Swift::Int isUniquelyReferenced_nonNull_native = swift_bridgeObjectRelease();
      if ((v43 & 1) == 0) {
        goto LABEL_41;
      }
      goto LABEL_4;
    }
    if ((v21 & 0x2000000000000000) != 0) {
      break;
    }
    if ((v20 & 0x1000000000000000) != 0) {
      char v25 = (unsigned __int8 *)((v21 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      char v25 = (unsigned __int8 *)sub_22D34B8E8();
    }
    Swift::Int isUniquelyReferenced_nonNull_native = (Swift::Int)sub_22D344F74(v25, v23, 10);
    if ((v26 & 1) == 0)
    {
      uint64_t v27 = isUniquelyReferenced_nonNull_native;
LABEL_41:
      Swift::Int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        Swift::Int isUniquelyReferenced_nonNull_native = (Swift::Int)sub_22D344298(0, *(void *)(v18 + 16) + 1, 1, (char *)v18);
        Swift::Int v18 = isUniquelyReferenced_nonNull_native;
      }
      unint64_t v38 = *(void *)(v18 + 16);
      unint64_t v37 = *(void *)(v18 + 24);
      if (v38 >= v37 >> 1)
      {
        Swift::Int isUniquelyReferenced_nonNull_native = (Swift::Int)sub_22D344298((char *)(v37 > 1), v38 + 1, 1, (char *)v18);
        Swift::Int v18 = isUniquelyReferenced_nonNull_native;
      }
      *(void *)(v18 + 16) = v38 + 1;
      *(void *)(v18 + 8 * v38 + 32) = v27;
    }
LABEL_4:
    if (++v17 == v13)
    {
      swift_bridgeObjectRelease();
      uint64_t v44 = *(void *)(v18 + 16);
      Swift::Int isUniquelyReferenced_nonNull_native = swift_bridgeObjectRelease();
      if (v44 != v13) {
        goto LABEL_59;
      }
      unint64_t v45 = *(void *)(v18 + 16);
      if (!v45) {
        goto LABEL_68;
      }
      uint64_t v46 = *(void *)(v18 + 32);
      if (v13 >= 2)
      {
        if (v45 < 2) {
          goto LABEL_69;
        }
        uint64_t v48 = *(void *)(v18 + 40);
        if (v13 >= 3)
        {
          if (v45 < 3) {
            goto LABEL_70;
          }
          uint64_t v47 = *(void *)(v18 + 48);
        }
        else
        {
          uint64_t v47 = 0;
        }
      }
      else
      {
        uint64_t v47 = 0;
        uint64_t v48 = 0;
      }
      Swift::Int isUniquelyReferenced_nonNull_native = swift_bridgeObjectRelease();
      *(void *)uint64_t v4 = v46;
      *(void *)(v4 + 8) = v48;
      *(void *)(v4 + 16) = v47;
      *(unsigned char *)(v4 + 24) = 0;
      goto LABEL_71;
    }
  }
  uint64_t v54 = v20;
  uint64_t v55 = v21 & 0xFFFFFFFFFFFFFFLL;
  if (v20 == 43)
  {
    if (!v22) {
      goto LABEL_67;
    }
    if (v22 == 1 || (BYTE1(v20) - 48) > 9u) {
      goto LABEL_4;
    }
    uint64_t v27 = (BYTE1(v20) - 48);
    uint64_t v32 = v22 - 2;
    if (v22 != 2)
    {
      unint64_t v33 = (unsigned __int8 *)v51;
      while (1)
      {
        unsigned int v34 = *v33 - 48;
        if (v34 > 9) {
          goto LABEL_4;
        }
        uint64_t v35 = 10 * v27;
        if ((unsigned __int128)(v27 * (__int128)10) >> 64 != (10 * v27) >> 63) {
          goto LABEL_4;
        }
        uint64_t v27 = v35 + v34;
        if (__OFADD__(v35, v34)) {
          goto LABEL_4;
        }
        ++v33;
        if (!--v32) {
          goto LABEL_41;
        }
      }
    }
    goto LABEL_41;
  }
  if (v20 != 45)
  {
    if (v22 && (v20 - 48) <= 9u)
    {
      uint64_t v27 = (v20 - 48);
      uint64_t v36 = v22 - 1;
      if (v22 != 1)
      {
        uint64_t v39 = (unsigned __int8 *)v50;
        while (1)
        {
          unsigned int v40 = *v39 - 48;
          if (v40 > 9) {
            goto LABEL_4;
          }
          uint64_t v41 = 10 * v27;
          if ((unsigned __int128)(v27 * (__int128)10) >> 64 != (10 * v27) >> 63) {
            goto LABEL_4;
          }
          uint64_t v27 = v41 + v40;
          if (__OFADD__(v41, v40)) {
            goto LABEL_4;
          }
          ++v39;
          if (!--v36) {
            goto LABEL_41;
          }
        }
      }
      goto LABEL_41;
    }
    goto LABEL_4;
  }
  if (v22)
  {
    if (v22 != 1 && (BYTE1(v20) - 48) <= 9u)
    {
      uint64_t v27 = -(uint64_t)(BYTE1(v20) - 48);
      uint64_t v28 = v22 - 2;
      if (v22 != 2)
      {
        uint64_t v29 = (unsigned __int8 *)v51;
        while (1)
        {
          unsigned int v30 = *v29 - 48;
          if (v30 > 9) {
            goto LABEL_4;
          }
          uint64_t v31 = 10 * v27;
          if ((unsigned __int128)(v27 * (__int128)10) >> 64 != (10 * v27) >> 63) {
            goto LABEL_4;
          }
          uint64_t v27 = v31 - v30;
          if (__OFSUB__(v31, v30)) {
            goto LABEL_4;
          }
          ++v29;
          if (!--v28) {
            goto LABEL_41;
          }
        }
      }
      goto LABEL_41;
    }
    goto LABEL_4;
  }
  __break(1u);
LABEL_67:
  __break(1u);
LABEL_68:
  __break(1u);
LABEL_69:
  __break(1u);
LABEL_70:
  __break(1u);
LABEL_71:
  result.value.patch = v15;
  result.value.minor = v23;
  result.value.major = isUniquelyReferenced_nonNull_native;
  result.is_nil = v16;
  return result;
}

SFSymbols::Version __swiftcall Version.init(major:minor:patch:)(Swift::Int major, Swift::Int minor, Swift::Int patch)
{
  *char v3 = major;
  v3[1] = minor;
  v3[2] = patch;
  result.patch = patch;
  result.minor = minor;
  result.major = major;
  return result;
}

uint64_t Version.major.getter()
{
  return *(void *)v0;
}

uint64_t Version.minor.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t Version.patch.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t Version.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22D34BA88();
  if (!v2)
  {
    __swift_project_boxed_opaque_existential_1(v14, v14[3]);
    uint64_t v5 = sub_22D34B9B8();
    uint64_t v7 = v6;
    swift_bridgeObjectRetain();
    v8._uint64_t countAndFlagsBits = v5;
    v8._object = v7;
    Version.init(string:)(v8);
    if (v13 == 1)
    {
      sub_22D344D10();
      swift_allocError();
      *uint64_t v9 = v5;
      v9[1] = (uint64_t)v7;
      swift_willThrow();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    }
    else
    {
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
      *(_OWORD *)a2 = v11;
      *(void *)(a2 + 16) = v12;
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t Version.encode(to:)(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22D34BAA8();
  Version.description.getter();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  sub_22D34B9C8();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
}

uint64_t Version.description.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = v0[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685688E0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22D34D120;
  *(void *)(inited + 32) = v1;
  *(void *)(inited + 40) = v2;
  if (v3)
  {
    int64_t v5 = 3;
    uint64_t v6 = sub_22D344298((char *)1, 3, 1, (char *)inited);
    *((void *)v6 + 2) = 3;
    *((void *)v6 + 6) = v3;
  }
  else
  {
    int64_t v5 = 2;
  }
  uint64_t v28 = MEMORY[0x263F8EE78];
  swift_bridgeObjectRetain();
  sub_22D33C9CC(0, v5, 0);
  uint64_t v7 = v28;
  uint64_t v8 = sub_22D34B998();
  uint64_t v10 = v9;
  unint64_t v12 = *(void *)(v28 + 16);
  unint64_t v11 = *(void *)(v28 + 24);
  if (v12 >= v11 >> 1)
  {
    sub_22D33C9CC((char *)(v11 > 1), v12 + 1, 1);
    uint64_t v7 = v28;
  }
  *(void *)(v7 + 16) = v12 + 1;
  uint64_t v13 = v7 + 16 * v12;
  *(void *)(v13 + 32) = v8;
  *(void *)(v13 + 40) = v10;
  uint64_t v14 = sub_22D34B998();
  uint64_t v16 = v15;
  unint64_t v18 = *(void *)(v7 + 16);
  unint64_t v17 = *(void *)(v7 + 24);
  if (v18 >= v17 >> 1) {
    sub_22D33C9CC((char *)(v17 > 1), v18 + 1, 1);
  }
  *(void *)(v7 + 16) = v18 + 1;
  uint64_t v19 = v7 + 16 * v18;
  *(void *)(v19 + 32) = v14;
  *(void *)(v19 + 40) = v16;
  if (v3)
  {
    uint64_t v20 = sub_22D34B998();
    uint64_t v22 = v21;
    unint64_t v24 = *(void *)(v7 + 16);
    unint64_t v23 = *(void *)(v7 + 24);
    if (v24 >= v23 >> 1) {
      sub_22D33C9CC((char *)(v23 > 1), v24 + 1, 1);
    }
    *(void *)(v7 + 16) = v24 + 1;
    uint64_t v25 = v7 + 16 * v24;
    *(void *)(v25 + 32) = v20;
    *(void *)(v25 + 40) = v22;
  }
  swift_bridgeObjectRelease_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685684F8);
  sub_22D335020();
  uint64_t v26 = sub_22D34B6E8();
  swift_bridgeObjectRelease();
  return v26;
}

BOOL static Version.< infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  BOOL v6 = v3 == v5;
  BOOL v7 = v3 < v5;
  if (v6) {
    BOOL v7 = a1[2] < a2[2];
  }
  BOOL v6 = v2 == v4;
  BOOL v8 = v2 < v4;
  if (v6) {
    return v7;
  }
  else {
    return v8;
  }
}

uint64_t Version.hash(into:)()
{
  return sub_22D34BA58();
}

BOOL static Version.== infix(_:_:)(void *a1, void *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

uint64_t Version.hashValue.getter()
{
  return sub_22D34BA78();
}

uint64_t sub_22D343D58()
{
  return sub_22D34BA78();
}

uint64_t sub_22D343DC4()
{
  return sub_22D34BA58();
}

uint64_t sub_22D343E0C()
{
  return sub_22D34BA78();
}

BOOL sub_22D343E74(void *a1, void *a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a2[1];
  BOOL v4 = v2 == v3;
  BOOL v5 = v2 < v3;
  if (v4) {
    BOOL v5 = a1[2] < a2[2];
  }
  if (*a1 == *a2) {
    return v5;
  }
  else {
    return *a1 < *a2;
  }
}

BOOL sub_22D343EAC(void *a1, void *a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a2[1];
  BOOL v4 = v3 == v2;
  BOOL v5 = v3 < v2;
  if (v4) {
    BOOL v5 = a2[2] < a1[2];
  }
  if (*a2 == *a1) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = *a2 < *a1;
  }
  return !v6;
}

BOOL sub_22D343EE8(void *a1, void *a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a2[1];
  BOOL v4 = v2 == v3;
  BOOL v5 = v2 < v3;
  if (v4) {
    BOOL v5 = a1[2] < a2[2];
  }
  if (*a1 == *a2) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = *a1 < *a2;
  }
  return !v6;
}

BOOL sub_22D343F24(void *a1, void *a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a2[1];
  BOOL v4 = v3 == v2;
  BOOL v5 = v3 < v2;
  if (v4) {
    BOOL v5 = a2[2] < a1[2];
  }
  if (*a2 == *a1) {
    return v5;
  }
  else {
    return *a2 < *a1;
  }
}

uint64_t sub_22D343F60@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return Version.init(from:)(a1, a2);
}

uint64_t sub_22D343F78(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22D34BAA8();
  Version.description.getter();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  sub_22D34B9C8();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
}

BOOL sub_22D344040(void *a1, void *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

char *sub_22D344070(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD77E78);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_22D344174(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268568928);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    void v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685684F8);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_22D344298(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685688E0);
    uint64_t v10 = (char *)swift_allocObject();
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
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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

char *sub_22D344394(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268568918);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 104);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[104 * v8]) {
      memmove(v12, v13, 104 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_22D3444B4(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685688C0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_22D3445B0(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268568920);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_22D3446AC(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268568908);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

size_t sub_22D344798(size_t a1, int64_t a2, char a3, void *a4)
{
  return sub_22D3447F8(a1, a2, a3, a4, &qword_2685688A0, type metadata accessor for SymbolKey);
}

size_t sub_22D3447B8(size_t a1, int64_t a2, char a3, void *a4)
{
  return sub_22D3447F8(a1, a2, a3, a4, &qword_268568888, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
}

size_t sub_22D3447D8(size_t a1, int64_t a2, char a3, void *a4)
{
  return sub_22D3447F8(a1, a2, a3, a4, &qword_268568910, type metadata accessor for SymbolMetadata);
}

size_t sub_22D3447F8(size_t result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  char v8 = result;
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  if (!v12)
  {
    uint64_t v16 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  SFSymbols::Version result = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_29;
  }
  long long v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(result - v15) / v14);
LABEL_19:
  uint64_t v18 = *(void *)(a6(0) - 8);
  if (v8)
  {
    if (v16 < a4
      || (unint64_t v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80),
          (char *)v16 + v19 >= (char *)a4 + v19 + *(void *)(v18 + 72) * v11))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v16;
}

void *sub_22D3449D4(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_22D3449EC(a1, a2, a3, a4, &qword_268568900);
}

void *sub_22D3449E0(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_22D3449EC(a1, a2, a3, a4, &qword_2685688F0);
}

void *sub_22D3449EC(void *result, int64_t a2, char a3, void *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if (a3)
  {
    unint64_t v7 = a4[3];
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v8 = a2;
      }
    }
  }
  else
  {
    int64_t v8 = a2;
  }
  uint64_t v9 = a4[2];
  if (v8 <= v9) {
    uint64_t v10 = a4[2];
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v11 = (void *)swift_allocObject();
    int64_t v12 = _swift_stdlib_malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    v11[2] = v9;
    v11[3] = 2 * (v13 >> 4);
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x263F8EE78];
  }
  if (v6)
  {
    if (v11 != a4 || v11 + 4 >= &a4[2 * v9 + 4]) {
      memmove(v11 + 4, a4 + 4, 16 * v9);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685688F8);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v11;
}

char *sub_22D344B0C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268568898);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

unsigned __int8 *sub_22D344C10(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  return sub_22D3451F0(a1, a2, a3);
}

unsigned __int8 *sub_22D344C28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_22D34B7E8();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    int64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_22D345470();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    int64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    int64_t v7 = (unsigned __int8 *)sub_22D34B8E8();
  }
LABEL_7:
  int64_t v11 = sub_22D344F74(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unint64_t sub_22D344D10()
{
  unint64_t result = qword_2685688D8;
  if (!qword_2685688D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685688D8);
  }
  return result;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

unint64_t sub_22D344DB8()
{
  unint64_t result = qword_2685688E8;
  if (!qword_2685688E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685688E8);
  }
  return result;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for Version(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for Version(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for Version()
{
  return &type metadata for Version;
}

ValueMetadata *type metadata accessor for Version.DecodingError()
{
  return &type metadata for Version.DecodingError;
}

uint64_t sub_22D344E8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_22D34B7E8();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    int64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_22D345470();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    int64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    int64_t v7 = (unsigned __int8 *)sub_22D34B8E8();
  }
LABEL_7:
  int64_t v11 = sub_22D3451F0(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11 | ((((unint64_t)v11 >> 32) & 1) << 32);
}

unsigned __int8 *sub_22D344F74(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (unint64_t i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  uint64_t v13 = 0;
                  if (v11 < 0x61 || v11 >= v8) {
                    return (unsigned __int8 *)v13;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v14 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v14 - (v11 + v12);
              if (__OFSUB__(v14, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_66;
    }
    if (a2)
    {
      unsigned __int8 v23 = a3 + 48;
      unsigned __int8 v24 = a3 + 55;
      unsigned __int8 v25 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v23 = 58;
      }
      else
      {
        unsigned __int8 v25 = 97;
        unsigned __int8 v24 = 65;
      }
      if (result)
      {
        uint64_t v26 = 0;
        do
        {
          unsigned int v27 = *result;
          if (v27 < 0x30 || v27 >= v23)
          {
            if (v27 < 0x41 || v27 >= v24)
            {
              uint64_t v13 = 0;
              if (v27 < 0x61 || v27 >= v25) {
                return (unsigned __int8 *)v13;
              }
              char v28 = -87;
            }
            else
            {
              char v28 = -55;
            }
          }
          else
          {
            char v28 = -48;
          }
          uint64_t v29 = v26 * a3;
          if ((unsigned __int128)(v26 * (__int128)a3) >> 64 != (v26 * a3) >> 63) {
            return 0;
          }
          uint64_t v26 = v29 + (v27 + v28);
          if (__OFADD__(v29, (v27 + v28))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v29 + (v27 + v28));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_66:
    __break(1u);
    return result;
  }
  uint64_t v15 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v16 = a3 + 48;
  unsigned __int8 v17 = a3 + 55;
  unsigned __int8 v18 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v16 = 58;
  }
  else
  {
    unsigned __int8 v18 = 97;
    unsigned __int8 v17 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  unint64_t v19 = result + 1;
  do
  {
    unsigned int v20 = *v19;
    if (v20 < 0x30 || v20 >= v16)
    {
      if (v20 < 0x41 || v20 >= v17)
      {
        uint64_t v13 = 0;
        if (v20 < 0x61 || v20 >= v18) {
          return (unsigned __int8 *)v13;
        }
        char v21 = -87;
      }
      else
      {
        char v21 = -55;
      }
    }
    else
    {
      char v21 = -48;
    }
    uint64_t v22 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v22 + (v20 + v21);
    if (__OFADD__(v22, (v20 + v21))) {
      return 0;
    }
    ++v19;
    --v15;
  }
  while (v15);
  return (unsigned __int8 *)v9;
}

unsigned __int8 *sub_22D3451F0(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v16 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v17 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v18 = a3 + 55;
        }
        else
        {
          unsigned __int8 v17 = 97;
          unsigned __int8 v18 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v19 = a3 + 48;
        }
        else {
          unsigned __int8 v19 = 58;
        }
        if (result)
        {
          unsigned int v8 = 0;
          unsigned int v20 = result + 1;
          do
          {
            unsigned int v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v21 < 0x61 || v21 >= v17) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v22 = -87;
              }
              else
              {
                char v22 = -55;
              }
            }
            else
            {
              char v22 = -48;
            }
            unint64_t v23 = v8 * (unint64_t)a3;
            if ((v23 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v24 = v21 + v22;
            unsigned int v8 = v23 + v24;
            if (__CFADD__(v23, v24)) {
              goto LABEL_72;
            }
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          unsigned __int8 v13 = 0;
          unsigned int v12 = v8;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
LABEL_72:
      unsigned int v12 = 0;
      unsigned __int8 v13 = 1;
      return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        unsigned __int8 v25 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v26 = a3 + 55;
        }
        else
        {
          unsigned __int8 v25 = 97;
          unsigned __int8 v26 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v27 = a3 + 48;
        }
        else {
          unsigned __int8 v27 = 58;
        }
        if (result)
        {
          unsigned int v28 = 0;
          do
          {
            unsigned int v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v29 < 0x61 || v29 >= v25) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v30 = -87;
              }
              else
              {
                char v30 = -55;
              }
            }
            else
            {
              char v30 = -48;
            }
            unint64_t v31 = v28 * (unint64_t)a3;
            if ((v31 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v32 = v29 + v30;
            unsigned int v28 = v31 + v32;
            if (__CFADD__(v31, v32)) {
              goto LABEL_72;
            }
            ++result;
            --a2;
          }
          while (a2);
          unsigned __int8 v13 = 0;
          unsigned int v12 = v28;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      uint64_t v4 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v5 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v6 = a3 + 55;
        }
        else
        {
          unsigned __int8 v5 = 97;
          unsigned __int8 v6 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v7 = a3 + 48;
        }
        else {
          unsigned __int8 v7 = 58;
        }
        if (result)
        {
          unsigned int v8 = 0;
          uint64_t v9 = result + 1;
          while (1)
          {
            unsigned int v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v10 < 0x61 || v10 >= v5) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v11 = -87;
              }
              else
              {
                char v11 = -55;
              }
            }
            else
            {
              char v11 = -48;
            }
            unint64_t v14 = v8 * (unint64_t)a3;
            if ((v14 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v15 = v10 + v11;
            unsigned int v8 = v14 - v15;
            if (v14 < v15) {
              goto LABEL_72;
            }
            ++v9;
            if (!--v4) {
              goto LABEL_48;
            }
          }
        }
LABEL_71:
        unsigned int v12 = 0;
        unsigned __int8 v13 = 0;
        return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_22D345470()
{
  unint64_t v0 = sub_22D34B7F8();
  uint64_t v4 = sub_22D3454F0(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_22D3454F0(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_22D345648(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      char v11 = sub_22D345748(v9, 0);
      unint64_t v12 = sub_22D3457B0((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_22D34B8E8();
LABEL_4:
        JUMPOUT(0x230F7C1A0);
      }
    }
    else
    {
      char v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x230F7C1A0](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x230F7C1A0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_22D345648(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_22D3459C4(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_22D3459C4(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

void *sub_22D345748(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268568908);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  uint64_t v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_22D3457B0(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    void v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    __n128 result = v12;
    if (v17 == v15) {
      __n128 result = sub_22D3459C4(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      __n128 result = sub_22D34B7C8();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        __n128 result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          __n128 result = sub_22D34B8E8();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    __n128 result = sub_22D3459C4(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_22D34B798();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_22D3459C4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_22D34B7D8();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x230F7C1E0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

unint64_t SymbolMetadata.privateScalar.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (unsigned int *)((char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_22D334D70(v1, (uint64_t)v4);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    sub_22D334FC0((uint64_t)v4, type metadata accessor for SymbolMetadata.Backing);
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = *v4;
    long long v7 = *(_OWORD *)(v4 + 54);
    v13[6] = *(_OWORD *)(v4 + 50);
    v13[7] = v7;
    long long v8 = *(_OWORD *)(v4 + 62);
    v13[8] = *(_OWORD *)(v4 + 58);
    v13[9] = v8;
    long long v9 = *(_OWORD *)(v4 + 38);
    id v13[2] = *(_OWORD *)(v4 + 34);
    v13[3] = v9;
    long long v10 = *(_OWORD *)(v4 + 46);
    v13[4] = *(_OWORD *)(v4 + 42);
    v13[5] = v10;
    long long v11 = *(_OWORD *)(v4 + 30);
    v13[0] = *(_OWORD *)(v4 + 26);
    v13[1] = v11;
    sub_22D335738(v13);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v6 | ((unint64_t)(EnumCaseMultiPayload == 1) << 32);
}

uint64_t type metadata accessor for SymbolMetadata.Backing(uint64_t a1)
{
  return sub_22D34150C(a1, (uint64_t *)&unk_268568940);
}

uint64_t SymbolMetadata.publicScalars.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D334D70(v1, (uint64_t)v4);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_22D334FC0((uint64_t)v4, type metadata accessor for SymbolMetadata.Backing);
    return MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v5 = *((void *)v4 + 6);
    long long v6 = *(_OWORD *)(v4 + 216);
    v12[6] = *(_OWORD *)(v4 + 200);
    v12[7] = v6;
    long long v7 = *(_OWORD *)(v4 + 248);
    v12[8] = *(_OWORD *)(v4 + 232);
    v12[9] = v7;
    long long v8 = *(_OWORD *)(v4 + 152);
    v12[2] = *(_OWORD *)(v4 + 136);
    v12[3] = v8;
    long long v9 = *(_OWORD *)(v4 + 184);
    v12[4] = *(_OWORD *)(v4 + 168);
    v12[5] = v9;
    long long v10 = *(_OWORD *)(v4 + 120);
    v12[0] = *(_OWORD *)(v4 + 104);
    v12[1] = v10;
    sub_22D335738(v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v5;
}

uint64_t SymbolMetadata.name.getter()
{
  uint64_t v1 = type metadata accessor for CustomSymbol();
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x270FA5388](v4);
  long long v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D334D70(v0, (uint64_t)v6);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_22D334F5C((uint64_t)v6, (uint64_t)v3);
    uint64_t v7 = *(void *)&v3[*(int *)(v1 + 20)];
    swift_bridgeObjectRetain();
    sub_22D334FC0((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
  }
  else
  {
    uint64_t v7 = *((void *)v6 + 1);
    long long v8 = *(_OWORD *)(v6 + 216);
    v14[6] = *(_OWORD *)(v6 + 200);
    v14[7] = v8;
    long long v9 = *(_OWORD *)(v6 + 248);
    v14[8] = *(_OWORD *)(v6 + 232);
    v14[9] = v9;
    long long v10 = *(_OWORD *)(v6 + 152);
    v14[2] = *(_OWORD *)(v6 + 136);
    void v14[3] = v10;
    long long v11 = *(_OWORD *)(v6 + 184);
    void v14[4] = *(_OWORD *)(v6 + 168);
    v14[5] = v11;
    long long v12 = *(_OWORD *)(v6 + 120);
    v14[0] = *(_OWORD *)(v6 + 104);
    v14[1] = v12;
    sub_22D335738(v14);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t SymbolMetadata.aliases.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D334D70(v1, (uint64_t)v4);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_22D334FC0((uint64_t)v4, type metadata accessor for SymbolMetadata.Backing);
    return MEMORY[0x263F8EE78];
  }
  int v5 = *(_DWORD *)v4;
  uint64_t v7 = *((void *)v4 + 1);
  uint64_t v6 = *((void *)v4 + 2);
  char v8 = v4[24];
  char v9 = v4[64];
  char v10 = v4[88];
  uint64_t v11 = *((void *)v4 + 12);
  long long v12 = *(_OWORD *)(v4 + 216);
  long long v46 = *(_OWORD *)(v4 + 200);
  long long v47 = v12;
  long long v13 = *(_OWORD *)(v4 + 248);
  long long v48 = *(_OWORD *)(v4 + 232);
  long long v49 = v13;
  long long v14 = *(_OWORD *)(v4 + 152);
  v44[2] = *(_OWORD *)(v4 + 136);
  v44[3] = v14;
  long long v15 = *(_OWORD *)(v4 + 184);
  v44[4] = *(_OWORD *)(v4 + 168);
  long long v45 = v15;
  long long v16 = *(_OWORD *)(v4 + 120);
  v44[0] = *(_OWORD *)(v4 + 104);
  v44[1] = v16;
  long long v40 = *(_OWORD *)(v4 + 200);
  long long v41 = *(_OWORD *)(v4 + 216);
  long long v42 = *(_OWORD *)(v4 + 232);
  long long v43 = *(_OWORD *)(v4 + 248);
  long long v36 = *(_OWORD *)(v4 + 136);
  long long v37 = *(_OWORD *)(v4 + 152);
  long long v38 = *(_OWORD *)(v4 + 168);
  long long v39 = *(_OWORD *)(v4 + 184);
  long long v34 = *(_OWORD *)(v4 + 104);
  long long v35 = *(_OWORD *)(v4 + 120);
  LODWORD(v26[0]) = v5;
  v26[1] = v7;
  v26[2] = v6;
  char v27 = v8;
  long long v17 = *((_OWORD *)v4 + 3);
  long long v28 = *((_OWORD *)v4 + 2);
  long long v29 = v17;
  char v30 = v9;
  long long v31 = *(_OWORD *)(v4 + 72);
  char v32 = v10;
  uint64_t v33 = v11;
  if (!*(void *)(v45 + 16))
  {
LABEL_7:
    sub_22D335860(v26);
    return MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  sub_22D3195C4(v7, v6);
  if ((v18 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v19 = swift_bridgeObjectRetain();
  unsigned int v20 = (char *)sub_22D347990(v19);
  swift_bridgeObjectRelease();
  unsigned __int8 v25 = v20;
  sub_22D347924(&v25);
  swift_bridgeObjectRelease();
  uint64_t v21 = v25;
  sub_22D3359E0(v44);
  uint64_t v22 = sub_22D348620((uint64_t)v21, (uint64_t)v44);
  sub_22D335738(v44);
  swift_release();
  sub_22D335860(v26);
  return v22;
}

uint64_t SymbolMetadata.tags.getter()
{
  uint64_t v1 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v22[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D334D70(v0, (uint64_t)v3);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_22D334FC0((uint64_t)v3, type metadata accessor for SymbolMetadata.Backing);
    return MEMORY[0x263F8EE88];
  }
  int v4 = *(_DWORD *)v3;
  uint64_t v6 = *((void *)v3 + 1);
  uint64_t v5 = *((void *)v3 + 2);
  char v7 = v3[24];
  char v8 = v3[64];
  char v9 = v3[88];
  uint64_t v10 = *((void *)v3 + 12);
  long long v11 = *(_OWORD *)(v3 + 120);
  long long v30 = *(_OWORD *)(v3 + 104);
  long long v31 = v11;
  uint64_t v12 = *((void *)v3 + 17);
  long long v13 = *((_OWORD *)v3 + 14);
  long long v37 = *((_OWORD *)v3 + 13);
  long long v38 = v13;
  long long v39 = *((_OWORD *)v3 + 15);
  uint64_t v40 = *((void *)v3 + 32);
  long long v14 = *((_OWORD *)v3 + 10);
  long long v33 = *((_OWORD *)v3 + 9);
  long long v34 = v14;
  long long v15 = *((_OWORD *)v3 + 12);
  long long v35 = *((_OWORD *)v3 + 11);
  long long v36 = v15;
  LODWORD(v22[0]) = v4;
  v22[1] = v6;
  v22[2] = v5;
  char v23 = v7;
  long long v16 = *((_OWORD *)v3 + 3);
  long long v24 = *((_OWORD *)v3 + 2);
  long long v25 = v16;
  char v26 = v8;
  long long v27 = *(_OWORD *)(v3 + 72);
  char v28 = v9;
  uint64_t v29 = v10;
  uint64_t v32 = v12;
  if (!*(void *)(v12 + 16))
  {
LABEL_7:
    sub_22D335860(v22);
    return MEMORY[0x263F8EE88];
  }
  swift_bridgeObjectRetain();
  unint64_t v17 = sub_22D3195C4(v6, v5);
  if ((v18 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  uint64_t v19 = *(void *)(*(void *)(v12 + 56) + 8 * v17);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_22D335860(v22);
  return v19;
}

uint64_t SymbolMetadata.functions.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x270FA5388](v2);
  int v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D334D70(v1, (uint64_t)v4);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_22D334FC0((uint64_t)v4, type metadata accessor for SymbolMetadata.Backing);
    return MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v5 = *((void *)v4 + 7);
    long long v6 = *(_OWORD *)(v4 + 216);
    v12[6] = *(_OWORD *)(v4 + 200);
    v12[7] = v6;
    long long v7 = *(_OWORD *)(v4 + 248);
    v12[8] = *(_OWORD *)(v4 + 232);
    v12[9] = v7;
    long long v8 = *(_OWORD *)(v4 + 152);
    v12[2] = *(_OWORD *)(v4 + 136);
    v12[3] = v8;
    long long v9 = *(_OWORD *)(v4 + 184);
    v12[4] = *(_OWORD *)(v4 + 168);
    v12[5] = v9;
    long long v10 = *(_OWORD *)(v4 + 120);
    v12[0] = *(_OWORD *)(v4 + 104);
    v12[1] = v10;
    sub_22D335738(v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v5;
}

uint64_t SymbolMetadata.localeSuffix.getter()
{
  uint64_t v1 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D334D70(v0, (uint64_t)v3);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_22D334FC0((uint64_t)v3, type metadata accessor for SymbolMetadata.Backing);
    return 0;
  }
  else
  {
    uint64_t v4 = *((void *)v3 + 4);
    long long v5 = *(_OWORD *)(v3 + 216);
    v11[6] = *(_OWORD *)(v3 + 200);
    v11[7] = v5;
    long long v6 = *(_OWORD *)(v3 + 248);
    v11[8] = *(_OWORD *)(v3 + 232);
    v11[9] = v6;
    long long v7 = *(_OWORD *)(v3 + 152);
    v11[2] = *(_OWORD *)(v3 + 136);
    v11[3] = v7;
    long long v8 = *(_OWORD *)(v3 + 184);
    v11[4] = *(_OWORD *)(v3 + 168);
    v11[5] = v8;
    long long v9 = *(_OWORD *)(v3 + 120);
    v11[0] = *(_OWORD *)(v3 + 104);
    v11[1] = v9;
    sub_22D335738(v11);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t SymbolMetadata.key.getter@<X0>(_DWORD *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for CustomSymbol();
  MEMORY[0x270FA5388](v4 - 8);
  long long v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x270FA5388](v7);
  long long v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D334D70(v2, (uint64_t)v9);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_22D334F5C((uint64_t)v9, (uint64_t)v6);
    uint64_t v10 = sub_22D34B6B8();
    (*(void (**)(_DWORD *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, v6, v10);
    sub_22D334FC0((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for CustomSymbol);
  }
  else
  {
    int v11 = *(_DWORD *)v9;
    long long v12 = *(_OWORD *)(v9 + 216);
    v18[6] = *(_OWORD *)(v9 + 200);
    v18[7] = v12;
    long long v13 = *(_OWORD *)(v9 + 248);
    v18[8] = *(_OWORD *)(v9 + 232);
    v18[9] = v13;
    long long v14 = *(_OWORD *)(v9 + 152);
    v18[2] = *(_OWORD *)(v9 + 136);
    v18[3] = v14;
    long long v15 = *(_OWORD *)(v9 + 184);
    v18[4] = *(_OWORD *)(v9 + 168);
    v18[5] = v15;
    long long v16 = *(_OWORD *)(v9 + 120);
    v18[0] = *(_OWORD *)(v9 + 104);
    v18[1] = v16;
    sub_22D335738(v18);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *a1 = v11;
  }
  type metadata accessor for SymbolKey(0);
  return swift_storeEnumTagMultiPayload();
}

unint64_t SymbolMetadata.additionalCSVColumns.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D334D70(v1, (uint64_t)v4);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_22D334FC0((uint64_t)v4, type metadata accessor for SymbolMetadata.Backing);
    return sub_22D3194A0(MEMORY[0x263F8EE78]);
  }
  else
  {
    uint64_t v5 = *((void *)v4 + 12);
    long long v6 = *(_OWORD *)(v4 + 216);
    v12[6] = *(_OWORD *)(v4 + 200);
    v12[7] = v6;
    long long v7 = *(_OWORD *)(v4 + 248);
    v12[8] = *(_OWORD *)(v4 + 232);
    v12[9] = v7;
    long long v8 = *(_OWORD *)(v4 + 152);
    v12[2] = *(_OWORD *)(v4 + 136);
    v12[3] = v8;
    long long v9 = *(_OWORD *)(v4 + 184);
    v12[4] = *(_OWORD *)(v4 + 168);
    v12[5] = v9;
    long long v10 = *(_OWORD *)(v4 + 120);
    v12[0] = *(_OWORD *)(v4 + 104);
    v12[1] = v10;
    sub_22D335738(v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v5;
}

uint64_t SymbolMetadata.useRestrictionsDescription.getter()
{
  uint64_t v1 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D334D70(v0, (uint64_t)v3);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_22D334FC0((uint64_t)v3, type metadata accessor for SymbolMetadata.Backing);
    return 0;
  }
  else
  {
    uint64_t v4 = *((void *)v3 + 9);
    long long v5 = *(_OWORD *)(v3 + 216);
    v11[6] = *(_OWORD *)(v3 + 200);
    v11[7] = v5;
    long long v6 = *(_OWORD *)(v3 + 248);
    v11[8] = *(_OWORD *)(v3 + 232);
    v11[9] = v6;
    long long v7 = *(_OWORD *)(v3 + 152);
    v11[2] = *(_OWORD *)(v3 + 136);
    v11[3] = v7;
    long long v8 = *(_OWORD *)(v3 + 184);
    v11[4] = *(_OWORD *)(v3 + 168);
    v11[5] = v8;
    long long v9 = *(_OWORD *)(v3 + 120);
    v11[0] = *(_OWORD *)(v3 + 104);
    v11[1] = v9;
    sub_22D335738(v11);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t SymbolMetadata.useRestrictionsLocalizedDescription.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SymbolMetadata.Backing(0);
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  long long v5 = (char *)v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  long long v7 = (char *)v30 - v6;
  sub_22D334D70(v1, (uint64_t)v30 - v6);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_22D334FC0((uint64_t)v7, type metadata accessor for SymbolMetadata.Backing);
    return 0;
  }
  int v8 = *(_DWORD *)v7;
  uint64_t v9 = *((void *)v7 + 1);
  uint64_t v10 = *((void *)v7 + 2);
  char v11 = v7[24];
  char v12 = v7[64];
  char v13 = v7[88];
  uint64_t v14 = *((void *)v7 + 12);
  long long v15 = *(_OWORD *)(v7 + 216);
  long long v38 = *(_OWORD *)(v7 + 200);
  long long v39 = v15;
  long long v16 = *(_OWORD *)(v7 + 248);
  long long v40 = *(_OWORD *)(v7 + 232);
  long long v41 = v16;
  long long v17 = *(_OWORD *)(v7 + 152);
  long long v34 = *(_OWORD *)(v7 + 136);
  long long v35 = v17;
  long long v18 = *(_OWORD *)(v7 + 184);
  long long v36 = *(_OWORD *)(v7 + 168);
  long long v37 = v18;
  long long v19 = *(_OWORD *)(v7 + 120);
  long long v32 = *(_OWORD *)(v7 + 104);
  long long v33 = v19;
  LODWORD(v42[0]) = v8;
  v42[1] = v9;
  void v42[2] = v10;
  char v43 = v11;
  long long v20 = *((_OWORD *)v7 + 3);
  long long v44 = *((_OWORD *)v7 + 2);
  long long v45 = v20;
  char v46 = v12;
  long long v47 = *(_OWORD *)(v7 + 72);
  char v48 = v13;
  uint64_t v49 = v14;
  long long v56 = *(_OWORD *)(v7 + 200);
  long long v57 = *(_OWORD *)(v7 + 216);
  long long v58 = *(_OWORD *)(v7 + 232);
  long long v59 = *(_OWORD *)(v7 + 248);
  long long v52 = *(_OWORD *)(v7 + 136);
  long long v53 = *(_OWORD *)(v7 + 152);
  long long v54 = *(_OWORD *)(v7 + 168);
  long long v55 = *(_OWORD *)(v7 + 184);
  long long v50 = *(_OWORD *)(v7 + 104);
  long long v51 = *(_OWORD *)(v7 + 120);
  sub_22D334D70(v1, (uint64_t)v5);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_22D334FC0((uint64_t)v5, type metadata accessor for SymbolMetadata.Backing);
LABEL_7:
    sub_22D335860(v42);
    return 0;
  }
  uint64_t v22 = *((void *)v5 + 9);
  uint64_t v21 = *((void *)v5 + 10);
  long long v23 = *(_OWORD *)(v5 + 216);
  v31[6] = *(_OWORD *)(v5 + 200);
  v31[7] = v23;
  long long v24 = *(_OWORD *)(v5 + 248);
  v31[8] = *(_OWORD *)(v5 + 232);
  v31[9] = v24;
  long long v25 = *(_OWORD *)(v5 + 152);
  v31[2] = *(_OWORD *)(v5 + 136);
  void v31[3] = v25;
  long long v26 = *(_OWORD *)(v5 + 184);
  v31[4] = *(_OWORD *)(v5 + 168);
  v31[5] = v26;
  long long v27 = *(_OWORD *)(v5 + 120);
  v31[0] = *(_OWORD *)(v5 + 104);
  v31[1] = v27;
  sub_22D335738(v31);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v21) {
    goto LABEL_7;
  }
  v30[6] = v38;
  v30[7] = v39;
  v30[8] = v40;
  v30[9] = v41;
  v30[2] = v34;
  v30[3] = v35;
  v30[4] = v36;
  v30[5] = v37;
  v30[0] = v32;
  v30[1] = v33;
  uint64_t v28 = sub_22D3388EC(v22, v21);
  swift_bridgeObjectRelease();
  sub_22D335860(v42);
  return v28;
}

uint64_t SymbolMetadata.accessLevel.getter@<X0>(char *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D334D70(v2, (uint64_t)v6);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t result = sub_22D334FC0((uint64_t)v6, type metadata accessor for SymbolMetadata.Backing);
    char v8 = 0;
  }
  else
  {
    char v8 = v6[64];
    long long v9 = *(_OWORD *)(v6 + 216);
    v14[6] = *(_OWORD *)(v6 + 200);
    v14[7] = v9;
    long long v10 = *(_OWORD *)(v6 + 248);
    v14[8] = *(_OWORD *)(v6 + 232);
    v14[9] = v10;
    long long v11 = *(_OWORD *)(v6 + 152);
    v14[2] = *(_OWORD *)(v6 + 136);
    void v14[3] = v11;
    long long v12 = *(_OWORD *)(v6 + 184);
    void v14[4] = *(_OWORD *)(v6 + 168);
    v14[5] = v12;
    long long v13 = *(_OWORD *)(v6 + 120);
    v14[0] = *(_OWORD *)(v6 + 104);
    v14[1] = v13;
    sub_22D335738(v14);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  *a1 = v8;
  return result;
}

uint64_t SymbolMetadata.mirrorForRTL.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D334D70(v1, (uint64_t)v4);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_22D334FC0((uint64_t)v4, type metadata accessor for SymbolMetadata.Backing);
    return 0;
  }
  else
  {
    uint64_t v5 = v4[24];
    long long v6 = *(_OWORD *)(v4 + 216);
    v12[6] = *(_OWORD *)(v4 + 200);
    v12[7] = v6;
    long long v7 = *(_OWORD *)(v4 + 248);
    v12[8] = *(_OWORD *)(v4 + 232);
    v12[9] = v7;
    long long v8 = *(_OWORD *)(v4 + 152);
    v12[2] = *(_OWORD *)(v4 + 136);
    v12[3] = v8;
    long long v9 = *(_OWORD *)(v4 + 184);
    v12[4] = *(_OWORD *)(v4 + 168);
    v12[5] = v9;
    long long v10 = *(_OWORD *)(v4 + 120);
    v12[0] = *(_OWORD *)(v4 + 104);
    v12[1] = v10;
    sub_22D335738(v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v5;
}

uint64_t SymbolMetadata.glyphOrder.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (unsigned int *)((char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_22D334D70(v1, (uint64_t)v4);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_22D334FC0((uint64_t)v4, type metadata accessor for SymbolMetadata.Backing);
    return 0;
  }
  else
  {
    uint64_t v6 = *v4;
    uint64_t v7 = *((void *)v4 + 1);
    uint64_t v8 = *((void *)v4 + 2);
    char v9 = *((unsigned char *)v4 + 24);
    char v10 = *((unsigned char *)v4 + 64);
    char v11 = *((unsigned char *)v4 + 88);
    uint64_t v12 = *((void *)v4 + 12);
    long long v13 = *(_OWORD *)(v4 + 54);
    v20[6] = *(_OWORD *)(v4 + 50);
    v20[7] = v13;
    long long v14 = *(_OWORD *)(v4 + 62);
    v20[8] = *(_OWORD *)(v4 + 58);
    v20[9] = v14;
    long long v15 = *(_OWORD *)(v4 + 38);
    v20[2] = *(_OWORD *)(v4 + 34);
    v20[3] = v15;
    long long v16 = *(_OWORD *)(v4 + 46);
    v20[4] = *(_OWORD *)(v4 + 42);
    v20[5] = v16;
    long long v17 = *(_OWORD *)(v4 + 30);
    v20[0] = *(_OWORD *)(v4 + 26);
    v20[1] = v17;
    LODWORD(v21[0]) = v6;
    v21[1] = v7;
    v21[2] = v8;
    char v22 = v9;
    long long v18 = *((_OWORD *)v4 + 3);
    long long v23 = *((_OWORD *)v4 + 2);
    long long v24 = v18;
    char v25 = v10;
    long long v26 = *(_OWORD *)(v4 + 18);
    char v27 = v11;
    uint64_t v28 = v12;
    long long v35 = *(_OWORD *)(v4 + 50);
    long long v36 = *(_OWORD *)(v4 + 54);
    long long v37 = *(_OWORD *)(v4 + 58);
    long long v38 = *(_OWORD *)(v4 + 62);
    long long v31 = *(_OWORD *)(v4 + 34);
    long long v32 = *(_OWORD *)(v4 + 38);
    long long v33 = *(_OWORD *)(v4 + 42);
    long long v34 = *(_OWORD *)(v4 + 46);
    long long v29 = *(_OWORD *)(v4 + 26);
    long long v30 = *(_OWORD *)(v4 + 30);
    uint64_t v5 = sub_22D3386C0(v6);
    sub_22D335860(v21);
  }
  return v5;
}

void *SymbolMetadata.availability(for:)@<X0>(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *a1;
  uint64_t v10 = a1[1];
  sub_22D334D70(v3, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t result = (void *)sub_22D334FC0((uint64_t)v8, type metadata accessor for SymbolMetadata.Backing);
    *a2 = 0u;
    a2[1] = 0u;
  }
  else
  {
    int v12 = *(_DWORD *)v8;
    uint64_t v13 = *((void *)v8 + 1);
    uint64_t v14 = *((void *)v8 + 2);
    char v15 = v8[24];
    char v16 = v8[64];
    char v17 = v8[88];
    uint64_t v18 = *((void *)v8 + 12);
    long long v19 = *(_OWORD *)(v8 + 216);
    long long v32 = *(_OWORD *)(v8 + 200);
    long long v33 = v19;
    long long v20 = *(_OWORD *)(v8 + 248);
    long long v34 = *(_OWORD *)(v8 + 232);
    long long v35 = v20;
    long long v21 = *(_OWORD *)(v8 + 152);
    long long v28 = *(_OWORD *)(v8 + 136);
    long long v29 = v21;
    long long v22 = *(_OWORD *)(v8 + 184);
    long long v30 = *(_OWORD *)(v8 + 168);
    long long v31 = v22;
    long long v23 = *(_OWORD *)(v8 + 120);
    long long v26 = *(_OWORD *)(v8 + 104);
    long long v27 = v23;
    LODWORD(v36[0]) = v12;
    v36[1] = v13;
    v36[2] = v14;
    char v37 = v15;
    long long v24 = *((_OWORD *)v8 + 3);
    long long v38 = *((_OWORD *)v8 + 2);
    long long v39 = v24;
    char v40 = v16;
    long long v41 = *(_OWORD *)(v8 + 72);
    char v42 = v17;
    uint64_t v43 = v18;
    long long v50 = *(_OWORD *)(v8 + 200);
    long long v51 = *(_OWORD *)(v8 + 216);
    long long v52 = *(_OWORD *)(v8 + 232);
    long long v53 = *(_OWORD *)(v8 + 248);
    long long v46 = *(_OWORD *)(v8 + 136);
    long long v47 = *(_OWORD *)(v8 + 152);
    long long v48 = *(_OWORD *)(v8 + 168);
    long long v49 = *(_OWORD *)(v8 + 184);
    long long v44 = *(_OWORD *)(v8 + 104);
    long long v45 = *(_OWORD *)(v8 + 120);
    v25[0] = v9;
    v25[1] = v10;
    sub_22D3487F8(v36);
    sub_22D339CD0(v25, v13, v14, (uint64_t)a2);
    sub_22D335860(v36);
    return sub_22D335860(v36);
  }
  return result;
}

uint64_t SymbolMetadata.defaultRenderingMode.getter@<X0>(char *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v18[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D334D70(v2, (uint64_t)v6);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t result = sub_22D334FC0((uint64_t)v6, type metadata accessor for SymbolMetadata.Backing);
    char v8 = 4;
  }
  else
  {
    int v9 = *(_DWORD *)v6;
    uint64_t v10 = *((void *)v6 + 1);
    uint64_t v11 = *((void *)v6 + 2);
    char v12 = v6[24];
    char v13 = v6[64];
    char v8 = v6[88];
    uint64_t v14 = *((void *)v6 + 12);
    long long v32 = *(_OWORD *)(v6 + 200);
    long long v33 = *(_OWORD *)(v6 + 216);
    long long v34 = *(_OWORD *)(v6 + 232);
    long long v35 = *(_OWORD *)(v6 + 248);
    long long v28 = *(_OWORD *)(v6 + 136);
    long long v29 = *(_OWORD *)(v6 + 152);
    long long v30 = *(_OWORD *)(v6 + 168);
    long long v31 = *(_OWORD *)(v6 + 184);
    long long v15 = *(_OWORD *)(v6 + 120);
    long long v26 = *(_OWORD *)(v6 + 104);
    long long v27 = v15;
    LODWORD(v18[0]) = v9;
    v18[1] = v10;
    v18[2] = v11;
    char v19 = v12;
    long long v16 = *((_OWORD *)v6 + 3);
    long long v20 = *((_OWORD *)v6 + 2);
    long long v21 = v16;
    char v22 = v13;
    long long v23 = *(_OWORD *)(v6 + 72);
    char v24 = v8;
    uint64_t v25 = v14;
    uint64_t result = (uint64_t)sub_22D335860(v18);
  }
  *a1 = v8;
  return result;
}

uint64_t SymbolMetadata.csvRow.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (unsigned int *)((char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_22D334D70(v2, (uint64_t)v6);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t result = sub_22D334FC0((uint64_t)v6, type metadata accessor for SymbolMetadata.Backing);
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
  }
  else
  {
    uint64_t v25 = *v6;
    uint64_t v11 = *((void *)v6 + 2);
    uint64_t v24 = *((void *)v6 + 1);
    uint64_t v12 = *((unsigned __int8 *)v6 + 24);
    uint64_t v14 = *((void *)v6 + 4);
    uint64_t v13 = *((void *)v6 + 5);
    uint64_t v23 = *((unsigned __int8 *)v6 + 64);
    uint64_t v15 = *((void *)v6 + 9);
    uint64_t v8 = *((void *)v6 + 10);
    uint64_t v9 = *((unsigned __int8 *)v6 + 88);
    uint64_t v10 = *((void *)v6 + 12);
    long long v16 = *(_OWORD *)(v6 + 54);
    v26[6] = *(_OWORD *)(v6 + 50);
    v26[7] = v16;
    long long v17 = *(_OWORD *)(v6 + 62);
    v26[8] = *(_OWORD *)(v6 + 58);
    v26[9] = v17;
    long long v18 = *(_OWORD *)(v6 + 38);
    v26[2] = *(_OWORD *)(v6 + 34);
    void v26[3] = v18;
    long long v19 = *(_OWORD *)(v6 + 46);
    v26[4] = *(_OWORD *)(v6 + 42);
    v26[5] = v19;
    long long v20 = *(_OWORD *)(v6 + 30);
    v26[0] = *(_OWORD *)(v6 + 26);
    v26[1] = v20;
    long long v22 = *((_OWORD *)v6 + 3);
    uint64_t result = (uint64_t)sub_22D335738(v26);
    uint64_t v21 = v24;
    *(void *)a1 = v25;
    *(void *)(a1 + 8) = v21;
    *(void *)(a1 + 16) = v11;
    *(void *)(a1 + 24) = v12;
    *(void *)(a1 + 32) = v14;
    *(void *)(a1 + 40) = v13;
    *(_OWORD *)(a1 + 48) = v22;
    *(void *)(a1 + 64) = v23;
    *(void *)(a1 + 72) = v15;
  }
  *(void *)(a1 + 80) = v8;
  *(void *)(a1 + 88) = v9;
  *(void *)(a1 + 96) = v10;
  return result;
}

Swift::String_optional __swiftcall SymbolMetadata.string(for:)(SFSymbols::SymbolProperty a1)
{
  uint64_t v2 = v1;
  uint64_t countAndFlagsBits = (uint64_t *)a1.rawValue._countAndFlagsBits;
  uint64_t v4 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *countAndFlagsBits;
  uint64_t v8 = countAndFlagsBits[1];
  sub_22D334D70(v2, (uint64_t)v6);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_22D334FC0((uint64_t)v6, type metadata accessor for SymbolMetadata.Backing);
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    int v11 = *(_DWORD *)v6;
    uint64_t v12 = *((void *)v6 + 1);
    uint64_t v13 = *((void *)v6 + 2);
    char v14 = v6[24];
    char v15 = v6[64];
    char v16 = v6[88];
    uint64_t v17 = *((void *)v6 + 12);
    long long v18 = *(_OWORD *)(v6 + 216);
    long long v35 = *(_OWORD *)(v6 + 200);
    long long v36 = v18;
    long long v19 = *(_OWORD *)(v6 + 248);
    long long v37 = *(_OWORD *)(v6 + 232);
    long long v38 = v19;
    long long v20 = *(_OWORD *)(v6 + 152);
    long long v31 = *(_OWORD *)(v6 + 136);
    long long v32 = v20;
    long long v21 = *(_OWORD *)(v6 + 184);
    long long v33 = *(_OWORD *)(v6 + 168);
    long long v34 = v21;
    long long v22 = *(_OWORD *)(v6 + 120);
    long long v29 = *(_OWORD *)(v6 + 104);
    long long v30 = v22;
    LODWORD(v39[0]) = v11;
    v39[1] = v12;
    v39[2] = v13;
    char v40 = v14;
    long long v23 = *((_OWORD *)v6 + 3);
    long long v41 = *((_OWORD *)v6 + 2);
    long long v42 = v23;
    char v43 = v15;
    long long v44 = *(_OWORD *)(v6 + 72);
    char v45 = v16;
    uint64_t v46 = v17;
    long long v53 = *(_OWORD *)(v6 + 200);
    long long v54 = *(_OWORD *)(v6 + 216);
    long long v55 = *(_OWORD *)(v6 + 232);
    long long v56 = *(_OWORD *)(v6 + 248);
    long long v49 = *(_OWORD *)(v6 + 136);
    long long v50 = *(_OWORD *)(v6 + 152);
    long long v51 = *(_OWORD *)(v6 + 168);
    long long v52 = *(_OWORD *)(v6 + 184);
    long long v47 = *(_OWORD *)(v6 + 104);
    long long v48 = *(_OWORD *)(v6 + 120);
    v28[0] = v7;
    v28[1] = v8;
    sub_22D3487F8(v39);
    uint64_t v9 = sub_22D339E24(v28, v12, v13);
    uint64_t v10 = v24;
    sub_22D335860(v39);
    sub_22D335860(v39);
  }
  uint64_t v25 = v9;
  long long v26 = v10;
  result.value._object = v26;
  result.value._uint64_t countAndFlagsBits = v25;
  return result;
}

uint64_t sub_22D347924(char **a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_22D33D2BC((uint64_t)v2);
  }
  uint64_t v3 = *((void *)v2 + 2);
  v5[0] = (uint64_t)(v2 + 32);
  v5[1] = v3;
  uint64_t result = sub_22D347A78(v5);
  *a1 = v2;
  return result;
}

void *sub_22D347990(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD77E78);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_22D348420((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_22D32E154();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_22D347A78(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_22D34B988();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_22D348120(0, v3, 1, a1);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_151;
  }
  uint64_t v101 = result;
  __int16 v98 = a1;
  if (v3 <= 1)
  {
    uint64_t v7 = MEMORY[0x263F8EE78];
    uint64_t v104 = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v11 = *(void *)(MEMORY[0x263F8EE78] + 16);
      uint64_t v10 = MEMORY[0x263F8EE78];
LABEL_117:
      uint64_t result = v10;
      uint64_t v100 = v7;
      if (v11 >= 2)
      {
        uint64_t v91 = *v98;
        do
        {
          unint64_t v92 = v11 - 2;
          if (v11 < 2) {
            goto LABEL_146;
          }
          if (!v91) {
            goto LABEL_159;
          }
          uint64_t v93 = result;
          uint64_t v94 = *(void *)(result + 32 + 16 * v92);
          uint64_t v95 = *(void *)(result + 32 + 16 * (v11 - 1) + 8);
          uint64_t result = sub_22D3481F0((char *)(v91 + 16 * v94), (char *)(v91 + 16 * *(void *)(result + 32 + 16 * (v11 - 1))), v91 + 16 * v95, v104);
          if (v1) {
            break;
          }
          if (v95 < v94) {
            goto LABEL_147;
          }
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)sub_22D33C998(v93);
            uint64_t v93 = result;
          }
          if (v92 >= *(void *)(v93 + 16)) {
            goto LABEL_148;
          }
          unint64_t v96 = (void *)(v93 + 32 + 16 * v92);
          *unint64_t v96 = v94;
          v96[1] = v95;
          unint64_t v97 = *(void *)(v93 + 16);
          if (v11 > v97) {
            goto LABEL_149;
          }
          memmove((void *)(v93 + 32 + 16 * (v11 - 1)), (const void *)(v93 + 32 + 16 * v11), 16 * (v97 - v11));
          uint64_t result = v93;
          *(void *)(v93 + 16) = v97 - 1;
          unint64_t v11 = v97 - 1;
        }
        while (v97 > 2);
      }
LABEL_114:
      swift_bridgeObjectRelease();
      *(void *)(v100 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v100 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t result = sub_22D34B808();
    *(void *)(result + 16) = v6;
    uint64_t v100 = result;
    uint64_t v104 = (char *)(result + 32);
  }
  uint64_t v8 = 0;
  uint64_t v9 = *a1;
  uint64_t v99 = v9 + 8;
  uint64_t v10 = MEMORY[0x263F8EE78];
  uint64_t v102 = v3;
  while (1)
  {
    uint64_t v12 = v8++;
    if (v8 >= v3) {
      goto LABEL_45;
    }
    uint64_t v13 = (uint64_t *)(v9 + 16 * v8);
    uint64_t result = *v13;
    uint64_t v14 = v13[1];
    char v15 = (void *)(v9 + 16 * v12);
    if (result == *v15 && v14 == v15[1])
    {
      uint64_t v18 = v12 + 2;
      if (v12 + 2 >= v3) {
        goto LABEL_44;
      }
      int v17 = 0;
    }
    else
    {
      uint64_t result = sub_22D34B9A8();
      int v17 = result;
      uint64_t v18 = v12 + 2;
      if (v12 + 2 >= v3) {
        goto LABEL_36;
      }
    }
    long long v19 = (void *)(v99 + 16 * v18);
    do
    {
      uint64_t result = *(v19 - 1);
      long long v21 = (void *)(v9 + 16 * v8);
      if (result == *v21 && *v19 == v21[1])
      {
        if (v17) {
          goto LABEL_37;
        }
      }
      else
      {
        uint64_t result = sub_22D34B9A8();
        if ((v17 ^ result)) {
          goto LABEL_36;
        }
      }
      v19 += 2;
      uint64_t v20 = v18 + 1;
      uint64_t v8 = v18;
      uint64_t v18 = v20;
    }
    while (v20 < v3);
    uint64_t v18 = v20;
LABEL_36:
    uint64_t v8 = v18;
    if (v17)
    {
LABEL_37:
      if (v18 < v12) {
        goto LABEL_155;
      }
      if (v12 < v18)
      {
        uint64_t v23 = 16 * v18;
        uint64_t v24 = 16 * v12;
        uint64_t v25 = v18;
        uint64_t v26 = v12;
        do
        {
          if (v26 != --v25)
          {
            if (!v9) {
              goto LABEL_158;
            }
            uint64_t v27 = v9 + v23;
            uint64_t v28 = *(void *)(v9 + v24);
            uint64_t v29 = *(void *)(v9 + v24 + 8);
            *(_OWORD *)(v9 + v24) = *(_OWORD *)(v9 + v23 - 16);
            *(void *)(v27 - 16) = v28;
            *(void *)(v27 - 8) = v29;
          }
          ++v26;
          v23 -= 16;
          v24 += 16;
        }
        while (v26 < v25);
      }
LABEL_44:
      uint64_t v8 = v18;
    }
LABEL_45:
    if (v8 < v3)
    {
      if (__OFSUB__(v8, v12)) {
        goto LABEL_150;
      }
      if (v8 - v12 < v101) {
        break;
      }
    }
LABEL_66:
    if (v8 < v12) {
      goto LABEL_145;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_22D33C7B8(0, *(void *)(v10 + 16) + 1, 1, (char *)v10);
      uint64_t v10 = result;
    }
    unint64_t v38 = *(void *)(v10 + 16);
    unint64_t v37 = *(void *)(v10 + 24);
    unint64_t v11 = v38 + 1;
    if (v38 >= v37 >> 1)
    {
      uint64_t result = (uint64_t)sub_22D33C7B8((char *)(v37 > 1), v38 + 1, 1, (char *)v10);
      uint64_t v10 = result;
    }
    *(void *)(v10 + 16) = v11;
    uint64_t v39 = v10 + 32;
    char v40 = (uint64_t *)(v10 + 32 + 16 * v38);
    *char v40 = v12;
    v40[1] = v8;
    if (v38)
    {
      uint64_t v103 = v8;
      while (1)
      {
        unint64_t v41 = v11 - 1;
        if (v11 >= 4)
        {
          unint64_t v46 = v39 + 16 * v11;
          uint64_t v47 = *(void *)(v46 - 64);
          uint64_t v48 = *(void *)(v46 - 56);
          BOOL v52 = __OFSUB__(v48, v47);
          uint64_t v49 = v48 - v47;
          if (v52) {
            goto LABEL_134;
          }
          uint64_t v51 = *(void *)(v46 - 48);
          uint64_t v50 = *(void *)(v46 - 40);
          BOOL v52 = __OFSUB__(v50, v51);
          uint64_t v44 = v50 - v51;
          char v45 = v52;
          if (v52) {
            goto LABEL_135;
          }
          unint64_t v53 = v11 - 2;
          long long v54 = (uint64_t *)(v39 + 16 * (v11 - 2));
          uint64_t v56 = *v54;
          uint64_t v55 = v54[1];
          BOOL v52 = __OFSUB__(v55, v56);
          uint64_t v57 = v55 - v56;
          if (v52) {
            goto LABEL_136;
          }
          BOOL v52 = __OFADD__(v44, v57);
          uint64_t v58 = v44 + v57;
          if (v52) {
            goto LABEL_138;
          }
          if (v58 >= v49)
          {
            uint64_t v76 = (uint64_t *)(v39 + 16 * v41);
            uint64_t v78 = *v76;
            uint64_t v77 = v76[1];
            BOOL v52 = __OFSUB__(v77, v78);
            uint64_t v79 = v77 - v78;
            if (v52) {
              goto LABEL_144;
            }
            BOOL v69 = v44 < v79;
            goto LABEL_104;
          }
        }
        else
        {
          if (v11 != 3)
          {
            uint64_t v70 = *(void *)(v10 + 32);
            uint64_t v71 = *(void *)(v10 + 40);
            BOOL v52 = __OFSUB__(v71, v70);
            uint64_t v63 = v71 - v70;
            char v64 = v52;
            goto LABEL_98;
          }
          uint64_t v43 = *(void *)(v10 + 32);
          uint64_t v42 = *(void *)(v10 + 40);
          BOOL v52 = __OFSUB__(v42, v43);
          uint64_t v44 = v42 - v43;
          char v45 = v52;
        }
        if (v45) {
          goto LABEL_137;
        }
        unint64_t v53 = v11 - 2;
        long long v59 = (uint64_t *)(v39 + 16 * (v11 - 2));
        uint64_t v61 = *v59;
        uint64_t v60 = v59[1];
        BOOL v62 = __OFSUB__(v60, v61);
        uint64_t v63 = v60 - v61;
        char v64 = v62;
        if (v62) {
          goto LABEL_139;
        }
        uint64_t v65 = (uint64_t *)(v39 + 16 * v41);
        uint64_t v67 = *v65;
        uint64_t v66 = v65[1];
        BOOL v52 = __OFSUB__(v66, v67);
        uint64_t v68 = v66 - v67;
        if (v52) {
          goto LABEL_141;
        }
        if (__OFADD__(v63, v68)) {
          goto LABEL_143;
        }
        if (v63 + v68 >= v44)
        {
          BOOL v69 = v44 < v68;
LABEL_104:
          if (v69) {
            unint64_t v41 = v53;
          }
          goto LABEL_106;
        }
LABEL_98:
        if (v64) {
          goto LABEL_140;
        }
        BOOL v72 = (uint64_t *)(v39 + 16 * v41);
        uint64_t v74 = *v72;
        uint64_t v73 = v72[1];
        BOOL v52 = __OFSUB__(v73, v74);
        uint64_t v75 = v73 - v74;
        if (v52) {
          goto LABEL_142;
        }
        if (v75 < v63) {
          goto LABEL_15;
        }
LABEL_106:
        unint64_t v80 = v41 - 1;
        if (v41 - 1 >= v11)
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
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        uint64_t v81 = v9;
        if (!v9) {
          goto LABEL_157;
        }
        uint64_t v82 = v10;
        unint64_t v83 = (uint64_t *)(v39 + 16 * v80);
        uint64_t v84 = *v83;
        uint64_t v85 = v39;
        unint64_t v86 = v41;
        unint64_t v87 = (void *)(v39 + 16 * v41);
        uint64_t v88 = v87[1];
        uint64_t v89 = v81;
        uint64_t result = sub_22D3481F0((char *)(v81 + 16 * *v83), (char *)(v81 + 16 * *v87), v81 + 16 * v88, v104);
        if (v1) {
          goto LABEL_114;
        }
        if (v88 < v84) {
          goto LABEL_131;
        }
        if (v86 > *(void *)(v82 + 16)) {
          goto LABEL_132;
        }
        *unint64_t v83 = v84;
        *(void *)(v85 + 16 * v80 + 8) = v88;
        unint64_t v90 = *(void *)(v82 + 16);
        if (v86 >= v90) {
          goto LABEL_133;
        }
        uint64_t v10 = v82;
        unint64_t v11 = v90 - 1;
        uint64_t result = (uint64_t)memmove(v87, v87 + 2, 16 * (v90 - 1 - v86));
        uint64_t v39 = v85;
        *(void *)(v82 + 16) = v90 - 1;
        uint64_t v9 = v89;
        uint64_t v8 = v103;
        if (v90 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v11 = 1;
LABEL_15:
    uint64_t v3 = v102;
    if (v8 >= v102)
    {
      uint64_t v7 = v100;
      goto LABEL_117;
    }
  }
  if (__OFADD__(v12, v101)) {
    goto LABEL_153;
  }
  if (v12 + v101 >= v3) {
    uint64_t v30 = v3;
  }
  else {
    uint64_t v30 = v12 + v101;
  }
  if (v30 >= v12)
  {
    if (v8 != v30)
    {
      long long v31 = (uint64_t *)(v9 + 16 * v8);
      do
      {
        long long v32 = (uint64_t *)(v9 + 16 * v8);
        uint64_t result = *v32;
        uint64_t v33 = v32[1];
        uint64_t v34 = v12;
        long long v35 = v31;
        do
        {
          if (result == *(v35 - 2) && v33 == *(v35 - 1)) {
            break;
          }
          uint64_t result = sub_22D34B9A8();
          if ((result & 1) == 0) {
            break;
          }
          if (!v9) {
            goto LABEL_156;
          }
          uint64_t result = *v35;
          uint64_t v33 = v35[1];
          *(_OWORD *)long long v35 = *((_OWORD *)v35 - 1);
          *(v35 - 1) = v33;
          *(v35 - 2) = result;
          v35 -= 2;
          ++v34;
        }
        while (v8 != v34);
        ++v8;
        v31 += 2;
      }
      while (v8 != v30);
      uint64_t v8 = v30;
    }
    goto LABEL_66;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
  return result;
}

uint64_t sub_22D348120(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
LABEL_5:
    uint64_t v9 = (uint64_t *)(v7 + 16 * v4);
    uint64_t result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    uint64_t v12 = (uint64_t *)v8;
    while (1)
    {
      BOOL v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (uint64_t result = sub_22D34B9A8(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      uint64_t result = *v12;
      uint64_t v10 = v12[1];
      *(_OWORD *)uint64_t v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_22D3481F0(char *__dst, char *__src, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = __src;
  uint64_t v7 = __dst;
  int64_t v8 = __src - __dst;
  int64_t v9 = __src - __dst + 15;
  if (__src - __dst >= 0) {
    int64_t v9 = __src - __dst;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)__src;
  uint64_t v12 = a3 - (void)__src + 15;
  if ((uint64_t)(a3 - (void)__src) >= 0) {
    uint64_t v12 = a3 - (void)__src;
  }
  uint64_t v13 = v12 >> 4;
  if (v10 >= v12 >> 4)
  {
    if (a4 != __src || &__src[16 * v13] <= a4) {
      memmove(a4, __src, 16 * v13);
    }
    uint64_t v14 = &v4[16 * v13];
    if (v7 >= v6 || v11 < 16) {
      goto LABEL_48;
    }
    int v17 = (char *)(a3 - 16);
    while (1)
    {
      uint64_t v18 = v17 + 16;
      long long v19 = v6 - 16;
      BOOL v20 = *((void *)v14 - 2) == *((void *)v6 - 2) && *((void *)v14 - 1) == *((void *)v6 - 1);
      if (v20 || (sub_22D34B9A8() & 1) == 0)
      {
        long long v19 = v14 - 16;
        if (v18 != v14)
        {
          v14 -= 16;
LABEL_45:
          *(_OWORD *)int v17 = *(_OWORD *)v19;
          goto LABEL_46;
        }
        BOOL v21 = v17 >= v14;
        v14 -= 16;
        if (v21) {
          goto LABEL_45;
        }
      }
      else
      {
        if (v18 != v6)
        {
          v6 -= 16;
          goto LABEL_45;
        }
        BOOL v21 = v17 >= v6;
        v6 -= 16;
        if (v21) {
          goto LABEL_45;
        }
      }
LABEL_46:
      if (v6 > v7)
      {
        v17 -= 16;
        if (v14 > v4) {
          continue;
        }
      }
      goto LABEL_48;
    }
  }
  if (a4 != __dst || &__dst[16 * v10] <= a4) {
    memmove(a4, __dst, 16 * v10);
  }
  uint64_t v14 = &v4[16 * v10];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    while (1)
    {
      BOOL v15 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
      if (v15 || (sub_22D34B9A8() & 1) == 0) {
        break;
      }
      char v16 = v6;
      BOOL v15 = v7 == v6;
      v6 += 16;
      if (!v15) {
        goto LABEL_20;
      }
LABEL_21:
      v7 += 16;
      if (v4 >= v14 || (unint64_t)v6 >= a3) {
        goto LABEL_23;
      }
    }
    char v16 = v4;
    BOOL v15 = v7 == v4;
    v4 += 16;
    if (v15) {
      goto LABEL_21;
    }
LABEL_20:
    *(_OWORD *)uint64_t v7 = *(_OWORD *)v16;
    goto LABEL_21;
  }
LABEL_23:
  uint64_t v6 = v7;
LABEL_48:
  if (v6 != v4 || v6 >= &v4[(v14 - v4 + (v14 - v4 < 0 ? 0xFuLL : 0)) & 0xFFFFFFFFFFFFFFF0]) {
    memmove(v6, v4, 16 * ((v14 - v4) / 16));
  }
  return 1;
}

uint64_t sub_22D348420(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    uint64_t v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    BOOL v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_22D348620(uint64_t a1, uint64_t a2)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v27 = MEMORY[0x263F8EE78];
    sub_22D33C9AC(0, v2, 0);
    uint64_t v3 = v27;
    uint64_t v24 = a2;
    uint64_t v6 = *(void *)(a2 + 96);
    uint64_t v7 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v8 = *(v7 - 1);
      uint64_t v9 = *v7;
      uint64_t v10 = *(void *)(v6 + 16);
      swift_bridgeObjectRetain();
      long long v26 = 0u;
      uint64_t v25 = v8;
      if (v10)
      {
        swift_bridgeObjectRetain();
        unint64_t v11 = sub_22D3195C4(v8, v9);
        if (v12)
        {
          uint64_t v13 = v6;
          uint64_t v14 = *(void *)(*(void *)(v6 + 56) + 8 * v11);
          if (*(void *)(v14 + 16))
          {
            swift_bridgeObjectRetain();
            unint64_t v15 = sub_22D322A58(1701667182, 0xE400000000000000);
            if (v16)
            {
              uint64_t v17 = *(void *)(v24 + 88);
              uint64_t v18 = *(void *)(v14 + 56) + 24 * v15;
              long long v26 = *(_OWORD *)v18;
              uint64_t v19 = *(void *)(v18 + 16);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
LABEL_13:
              uint64_t v6 = v13;
              goto LABEL_14;
            }
            swift_bridgeObjectRelease();
          }
          swift_bridgeObjectRelease();
          uint64_t v19 = 0;
          uint64_t v17 = 0;
          goto LABEL_13;
        }
        swift_bridgeObjectRelease();
      }
      uint64_t v19 = 0;
      uint64_t v17 = 0;
LABEL_14:
      unint64_t v21 = *(void *)(v27 + 16);
      unint64_t v20 = *(void *)(v27 + 24);
      if (v21 >= v20 >> 1) {
        sub_22D33C9AC((char *)(v20 > 1), v21 + 1, 1);
      }
      v7 += 2;
      *(void *)(v27 + 16) = v21 + 1;
      uint64_t v22 = v27 + 48 * v21;
      *(void *)(v22 + 32) = v25;
      *(void *)(v22 + 40) = v9;
      *(_OWORD *)(v22 + 48) = v26;
      *(void *)(v22 + 64) = v19;
      *(void *)(v22 + 72) = v17;
      --v2;
    }
    while (v2);
  }
  return v3;
}

void *sub_22D3487F8(void *a1)
{
  uint64_t v6 = a1[19];
  int64_t v2 = (void *)a1[32];
  uint64_t v7 = (void *)a1[29];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_22D335B04(v6);
  id v3 = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v4 = v7;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for SymbolMetadata(uint64_t a1, uint64_t *a2)
{
  int v4 = *(_DWORD *)(*(void *)(type metadata accessor for SymbolMetadata.Backing(0) - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *(void *)a1 = *a2;
    a1 = v10 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v5 = sub_22D34B6B8();
      (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
      uint64_t v6 = *(int *)(type metadata accessor for CustomSymbol() + 20);
      uint64_t v7 = (void *)(a1 + v6);
      uint64_t v8 = (uint64_t *)((char *)a2 + v6);
      uint64_t v9 = v8[1];
      void *v7 = *v8;
      v7[1] = v9;
      swift_bridgeObjectRetain();
    }
    else
    {
      *(_DWORD *)a1 = *(_DWORD *)a2;
      uint64_t v11 = a2[2];
      *(void *)(a1 + 8) = a2[1];
      *(void *)(a1 + 16) = v11;
      *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
      uint64_t v12 = a2[5];
      *(void *)(a1 + 32) = a2[4];
      *(void *)(a1 + 40) = v12;
      uint64_t v13 = a2[7];
      *(void *)(a1 + 48) = a2[6];
      *(void *)(a1 + 56) = v13;
      *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
      uint64_t v14 = a2[10];
      *(void *)(a1 + 72) = a2[9];
      *(void *)(a1 + 80) = v14;
      *(unsigned char *)(a1 + 88) = *((unsigned char *)a2 + 88);
      uint64_t v15 = a2[13];
      *(void *)(a1 + 96) = a2[12];
      *(void *)(a1 + 104) = v15;
      uint64_t v16 = a2[15];
      *(void *)(a1 + 112) = a2[14];
      *(void *)(a1 + 120) = v16;
      uint64_t v17 = a2[17];
      *(void *)(a1 + 128) = a2[16];
      *(void *)(a1 + 136) = v17;
      *(void *)(a1 + 144) = a2[18];
      uint64_t v30 = a2[19];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v30)
      {
        uint64_t v18 = a2[20];
        *(void *)(a1 + 152) = v30;
        *(void *)(a1 + 160) = v18;
        swift_retain();
      }
      else
      {
        *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 19);
      }
      uint64_t v19 = a2[22];
      *(void *)(a1 + 168) = a2[21];
      *(void *)(a1 + 176) = v19;
      uint64_t v20 = a2[24];
      *(void *)(a1 + 184) = a2[23];
      *(void *)(a1 + 192) = v20;
      uint64_t v21 = a2[26];
      *(void *)(a1 + 200) = a2[25];
      *(void *)(a1 + 208) = v21;
      uint64_t v22 = a2[28];
      *(void *)(a1 + 216) = a2[27];
      *(void *)(a1 + 224) = v22;
      uint64_t v24 = (void *)a2[29];
      uint64_t v23 = a2[30];
      *(void *)(a1 + 232) = v24;
      *(void *)(a1 + 240) = v23;
      uint64_t v25 = a2[31];
      long long v26 = (void *)a2[32];
      long long v31 = v24;
      *(void *)(a1 + 248) = v25;
      *(void *)(a1 + 256) = v26;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v27 = v31;
      swift_bridgeObjectRetain();
      id v28 = v26;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void destroy for SymbolMetadata(uint64_t a1)
{
  type metadata accessor for SymbolMetadata.Backing(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_22D34B6B8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
    type metadata accessor for CustomSymbol();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*(void *)(a1 + 152)) {
      swift_release();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    id v3 = *(void **)(a1 + 256);
  }
}

uint64_t initializeWithCopy for SymbolMetadata(uint64_t a1, uint64_t a2)
{
  type metadata accessor for SymbolMetadata.Backing(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_22D34B6B8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    uint64_t v5 = *(int *)(type metadata accessor for CustomSymbol() + 20);
    uint64_t v6 = (void *)(a1 + v5);
    uint64_t v7 = (void *)(a2 + v5);
    uint64_t v8 = v7[1];
    *uint64_t v6 = *v7;
    v6[1] = v8;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    uint64_t v9 = *(void *)(a2 + 16);
    *(void *)(a1 + 8) = *(void *)(a2 + 8);
    *(void *)(a1 + 16) = v9;
    *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
    uint64_t v10 = *(void *)(a2 + 40);
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = v10;
    uint64_t v11 = *(void *)(a2 + 56);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(void *)(a1 + 56) = v11;
    *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
    uint64_t v12 = *(void *)(a2 + 80);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    *(void *)(a1 + 80) = v12;
    *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
    uint64_t v13 = *(void *)(a2 + 104);
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    *(void *)(a1 + 104) = v13;
    uint64_t v14 = *(void *)(a2 + 120);
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
    *(void *)(a1 + 120) = v14;
    uint64_t v26 = *(void *)(a2 + 136);
    *(void *)(a1 + 128) = *(void *)(a2 + 128);
    *(void *)(a1 + 136) = v26;
    *(void *)(a1 + 144) = *(void *)(a2 + 144);
    uint64_t v27 = *(void *)(a2 + 152);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v27)
    {
      uint64_t v15 = *(void *)(a2 + 160);
      *(void *)(a1 + 152) = v27;
      *(void *)(a1 + 160) = v15;
      swift_retain();
    }
    else
    {
      *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
    }
    uint64_t v16 = *(void *)(a2 + 176);
    *(void *)(a1 + 168) = *(void *)(a2 + 168);
    *(void *)(a1 + 176) = v16;
    uint64_t v17 = *(void *)(a2 + 192);
    *(void *)(a1 + 184) = *(void *)(a2 + 184);
    *(void *)(a1 + 192) = v17;
    uint64_t v18 = *(void *)(a2 + 208);
    *(void *)(a1 + 200) = *(void *)(a2 + 200);
    *(void *)(a1 + 208) = v18;
    uint64_t v19 = *(void *)(a2 + 224);
    *(void *)(a1 + 216) = *(void *)(a2 + 216);
    *(void *)(a1 + 224) = v19;
    uint64_t v20 = *(void *)(a2 + 240);
    id v28 = *(void **)(a2 + 232);
    *(void *)(a1 + 232) = v28;
    *(void *)(a1 + 240) = v20;
    uint64_t v22 = *(void *)(a2 + 248);
    uint64_t v21 = *(void **)(a2 + 256);
    *(void *)(a1 + 248) = v22;
    *(void *)(a1 + 256) = v21;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v23 = v28;
    swift_bridgeObjectRetain();
    id v24 = v21;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for SymbolMetadata(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_22D334FC0(a1, type metadata accessor for SymbolMetadata.Backing);
    type metadata accessor for SymbolMetadata.Backing(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = sub_22D34B6B8();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
      uint64_t v5 = *(int *)(type metadata accessor for CustomSymbol() + 20);
      uint64_t v6 = (void *)(a1 + v5);
      uint64_t v7 = (void *)(a2 + v5);
      *uint64_t v6 = *v7;
      v6[1] = v7[1];
      swift_bridgeObjectRetain();
    }
    else
    {
      *(_DWORD *)a1 = *(_DWORD *)a2;
      *(void *)(a1 + 8) = *(void *)(a2 + 8);
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
      *(void *)(a1 + 72) = *(void *)(a2 + 72);
      *(void *)(a1 + 80) = *(void *)(a2 + 80);
      *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
      *(void *)(a1 + 96) = *(void *)(a2 + 96);
      *(void *)(a1 + 104) = *(void *)(a2 + 104);
      *(void *)(a1 + 112) = *(void *)(a2 + 112);
      *(void *)(a1 + 120) = *(void *)(a2 + 120);
      *(void *)(a1 + 128) = *(void *)(a2 + 128);
      *(void *)(a1 + 136) = *(void *)(a2 + 136);
      *(void *)(a1 + 144) = *(void *)(a2 + 144);
      uint64_t v13 = *(void *)(a2 + 152);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v13)
      {
        uint64_t v8 = *(void *)(a2 + 160);
        *(void *)(a1 + 152) = v13;
        *(void *)(a1 + 160) = v8;
        swift_retain();
      }
      else
      {
        *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
      }
      *(void *)(a1 + 168) = *(void *)(a2 + 168);
      *(void *)(a1 + 176) = *(void *)(a2 + 176);
      *(void *)(a1 + 184) = *(void *)(a2 + 184);
      *(void *)(a1 + 192) = *(void *)(a2 + 192);
      *(void *)(a1 + 200) = *(void *)(a2 + 200);
      *(void *)(a1 + 208) = *(void *)(a2 + 208);
      *(void *)(a1 + 216) = *(void *)(a2 + 216);
      *(void *)(a1 + 224) = *(void *)(a2 + 224);
      uint64_t v14 = *(void **)(a2 + 232);
      *(void *)(a1 + 232) = v14;
      *(void *)(a1 + 240) = *(void *)(a2 + 240);
      *(void *)(a1 + 248) = *(void *)(a2 + 248);
      uint64_t v9 = *(void **)(a2 + 256);
      *(void *)(a1 + 256) = v9;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v10 = v14;
      swift_bridgeObjectRetain();
      id v11 = v9;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *initializeWithTake for SymbolMetadata(char *a1, char *a2)
{
  uint64_t v4 = type metadata accessor for SymbolMetadata.Backing(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_22D34B6B8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
    uint64_t v6 = type metadata accessor for CustomSymbol();
    *(_OWORD *)&a1[*(int *)(v6 + 20)] = *(_OWORD *)&a2[*(int *)(v6 + 20)];
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v4 - 8) + 64));
  }
  return a1;
}

char *assignWithTake for SymbolMetadata(char *a1, char *a2)
{
  if (a1 != a2)
  {
    sub_22D334FC0((uint64_t)a1, type metadata accessor for SymbolMetadata.Backing);
    uint64_t v4 = type metadata accessor for SymbolMetadata.Backing(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v5 = sub_22D34B6B8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
      uint64_t v6 = type metadata accessor for CustomSymbol();
      *(_OWORD *)&a1[*(int *)(v6 + 20)] = *(_OWORD *)&a2[*(int *)(v6 + 20)];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v4 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for SymbolMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22D349500);
}

uint64_t sub_22D349500(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SymbolMetadata.Backing(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for SymbolMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22D349580);
}

uint64_t sub_22D349580(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SymbolMetadata.Backing(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for SymbolMetadata(uint64_t a1)
{
  return sub_22D34150C(a1, (uint64_t *)&unk_268568930);
}

uint64_t sub_22D349610()
{
  uint64_t result = type metadata accessor for SymbolMetadata.Backing(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_22D34969C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *(void *)a1 = *a2;
    a1 = v11 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_22D34B6B8();
      (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      uint64_t v7 = *(int *)(type metadata accessor for CustomSymbol() + 20);
      uint64_t v8 = (void *)(a1 + v7);
      uint64_t v9 = (uint64_t *)((char *)a2 + v7);
      uint64_t v10 = v9[1];
      void *v8 = *v9;
      v8[1] = v10;
      swift_bridgeObjectRetain();
    }
    else
    {
      *(_DWORD *)a1 = *(_DWORD *)a2;
      uint64_t v12 = a2[2];
      *(void *)(a1 + 8) = a2[1];
      *(void *)(a1 + 16) = v12;
      *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
      uint64_t v13 = a2[5];
      *(void *)(a1 + 32) = a2[4];
      *(void *)(a1 + 40) = v13;
      uint64_t v14 = a2[7];
      *(void *)(a1 + 48) = a2[6];
      *(void *)(a1 + 56) = v14;
      *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
      uint64_t v15 = a2[10];
      *(void *)(a1 + 72) = a2[9];
      *(void *)(a1 + 80) = v15;
      *(unsigned char *)(a1 + 88) = *((unsigned char *)a2 + 88);
      uint64_t v16 = a2[13];
      *(void *)(a1 + 96) = a2[12];
      *(void *)(a1 + 104) = v16;
      uint64_t v17 = a2[15];
      *(void *)(a1 + 112) = a2[14];
      *(void *)(a1 + 120) = v17;
      uint64_t v18 = a2[17];
      *(void *)(a1 + 128) = a2[16];
      *(void *)(a1 + 136) = v18;
      *(void *)(a1 + 144) = a2[18];
      uint64_t v31 = a2[19];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v31)
      {
        uint64_t v19 = a2[20];
        *(void *)(a1 + 152) = v31;
        *(void *)(a1 + 160) = v19;
        swift_retain();
      }
      else
      {
        *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 19);
      }
      uint64_t v20 = a2[22];
      *(void *)(a1 + 168) = a2[21];
      *(void *)(a1 + 176) = v20;
      uint64_t v21 = a2[24];
      *(void *)(a1 + 184) = a2[23];
      *(void *)(a1 + 192) = v21;
      uint64_t v22 = a2[26];
      *(void *)(a1 + 200) = a2[25];
      *(void *)(a1 + 208) = v22;
      uint64_t v23 = a2[28];
      *(void *)(a1 + 216) = a2[27];
      *(void *)(a1 + 224) = v23;
      uint64_t v25 = (void *)a2[29];
      uint64_t v24 = a2[30];
      *(void *)(a1 + 232) = v25;
      *(void *)(a1 + 240) = v24;
      uint64_t v26 = a2[31];
      uint64_t v27 = (void *)a2[32];
      long long v32 = v25;
      *(void *)(a1 + 248) = v26;
      *(void *)(a1 + 256) = v27;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v28 = v32;
      swift_bridgeObjectRetain();
      id v29 = v27;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void sub_22D349958(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_22D34B6B8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
    type metadata accessor for CustomSymbol();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*(void *)(a1 + 152)) {
      swift_release();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    id v3 = *(void **)(a1 + 256);
  }
}

uint64_t sub_22D349AC0(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_22D34B6B8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    uint64_t v5 = *(int *)(type metadata accessor for CustomSymbol() + 20);
    uint64_t v6 = (void *)(a1 + v5);
    uint64_t v7 = (void *)(a2 + v5);
    uint64_t v8 = v7[1];
    *uint64_t v6 = *v7;
    v6[1] = v8;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    uint64_t v9 = *(void *)(a2 + 16);
    *(void *)(a1 + 8) = *(void *)(a2 + 8);
    *(void *)(a1 + 16) = v9;
    *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
    uint64_t v10 = *(void *)(a2 + 40);
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = v10;
    uint64_t v11 = *(void *)(a2 + 56);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(void *)(a1 + 56) = v11;
    *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
    uint64_t v12 = *(void *)(a2 + 80);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    *(void *)(a1 + 80) = v12;
    *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
    uint64_t v13 = *(void *)(a2 + 104);
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    *(void *)(a1 + 104) = v13;
    uint64_t v14 = *(void *)(a2 + 120);
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
    *(void *)(a1 + 120) = v14;
    uint64_t v26 = *(void *)(a2 + 136);
    *(void *)(a1 + 128) = *(void *)(a2 + 128);
    *(void *)(a1 + 136) = v26;
    *(void *)(a1 + 144) = *(void *)(a2 + 144);
    uint64_t v27 = *(void *)(a2 + 152);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v27)
    {
      uint64_t v15 = *(void *)(a2 + 160);
      *(void *)(a1 + 152) = v27;
      *(void *)(a1 + 160) = v15;
      swift_retain();
    }
    else
    {
      *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
    }
    uint64_t v16 = *(void *)(a2 + 176);
    *(void *)(a1 + 168) = *(void *)(a2 + 168);
    *(void *)(a1 + 176) = v16;
    uint64_t v17 = *(void *)(a2 + 192);
    *(void *)(a1 + 184) = *(void *)(a2 + 184);
    *(void *)(a1 + 192) = v17;
    uint64_t v18 = *(void *)(a2 + 208);
    *(void *)(a1 + 200) = *(void *)(a2 + 200);
    *(void *)(a1 + 208) = v18;
    uint64_t v19 = *(void *)(a2 + 224);
    *(void *)(a1 + 216) = *(void *)(a2 + 216);
    *(void *)(a1 + 224) = v19;
    uint64_t v20 = *(void *)(a2 + 240);
    id v28 = *(void **)(a2 + 232);
    *(void *)(a1 + 232) = v28;
    *(void *)(a1 + 240) = v20;
    uint64_t v22 = *(void *)(a2 + 248);
    uint64_t v21 = *(void **)(a2 + 256);
    *(void *)(a1 + 248) = v22;
    *(void *)(a1 + 256) = v21;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v23 = v28;
    swift_bridgeObjectRetain();
    id v24 = v21;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_22D349D28(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_22D334FC0(a1, type metadata accessor for SymbolMetadata.Backing);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = sub_22D34B6B8();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
      uint64_t v5 = *(int *)(type metadata accessor for CustomSymbol() + 20);
      uint64_t v6 = (void *)(a1 + v5);
      uint64_t v7 = (void *)(a2 + v5);
      *uint64_t v6 = *v7;
      v6[1] = v7[1];
      swift_bridgeObjectRetain();
    }
    else
    {
      *(_DWORD *)a1 = *(_DWORD *)a2;
      *(void *)(a1 + 8) = *(void *)(a2 + 8);
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
      *(void *)(a1 + 72) = *(void *)(a2 + 72);
      *(void *)(a1 + 80) = *(void *)(a2 + 80);
      *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
      *(void *)(a1 + 96) = *(void *)(a2 + 96);
      *(void *)(a1 + 104) = *(void *)(a2 + 104);
      *(void *)(a1 + 112) = *(void *)(a2 + 112);
      *(void *)(a1 + 120) = *(void *)(a2 + 120);
      *(void *)(a1 + 128) = *(void *)(a2 + 128);
      *(void *)(a1 + 136) = *(void *)(a2 + 136);
      *(void *)(a1 + 144) = *(void *)(a2 + 144);
      uint64_t v13 = *(void *)(a2 + 152);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v13)
      {
        uint64_t v8 = *(void *)(a2 + 160);
        *(void *)(a1 + 152) = v13;
        *(void *)(a1 + 160) = v8;
        swift_retain();
      }
      else
      {
        *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
      }
      *(void *)(a1 + 168) = *(void *)(a2 + 168);
      *(void *)(a1 + 176) = *(void *)(a2 + 176);
      *(void *)(a1 + 184) = *(void *)(a2 + 184);
      *(void *)(a1 + 192) = *(void *)(a2 + 192);
      *(void *)(a1 + 200) = *(void *)(a2 + 200);
      *(void *)(a1 + 208) = *(void *)(a2 + 208);
      *(void *)(a1 + 216) = *(void *)(a2 + 216);
      *(void *)(a1 + 224) = *(void *)(a2 + 224);
      uint64_t v14 = *(void **)(a2 + 232);
      *(void *)(a1 + 232) = v14;
      *(void *)(a1 + 240) = *(void *)(a2 + 240);
      *(void *)(a1 + 248) = *(void *)(a2 + 248);
      uint64_t v9 = *(void **)(a2 + 256);
      *(void *)(a1 + 256) = v9;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v10 = v14;
      swift_bridgeObjectRetain();
      id v11 = v9;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *sub_22D34A028(char *a1, char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_22D34B6B8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    uint64_t v7 = type metadata accessor for CustomSymbol();
    *(_OWORD *)&a1[*(int *)(v7 + 20)] = *(_OWORD *)&a2[*(int *)(v7 + 20)];
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

char *sub_22D34A0F4(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_22D334FC0((uint64_t)a1, type metadata accessor for SymbolMetadata.Backing);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_22D34B6B8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      uint64_t v7 = type metadata accessor for CustomSymbol();
      *(_OWORD *)&a1[*(int *)(v7 + 20)] = *(_OWORD *)&a2[*(int *)(v7 + 20)];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_22D34A1E4()
{
  uint64_t result = type metadata accessor for CustomSymbol();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t CustomSymbol.uuid.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_22D34B6B8();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t CustomSymbol.name.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for CustomSymbol() + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t type metadata accessor for CustomSymbol()
{
  uint64_t result = qword_268568950;
  if (!qword_268568950) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t CustomSymbol.name.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for CustomSymbol() + 20));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*CustomSymbol.name.modify())()
{
  return nullsub_1;
}

uint64_t CustomSymbol.init(uuid:name:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_22D34B6B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(a4, a1, v8);
  uint64_t result = type metadata accessor for CustomSymbol();
  id v10 = (void *)(a4 + *(int *)(result + 20));
  void *v10 = a2;
  v10[1] = a3;
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for CustomSymbol(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_22D34B6B8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    id v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for CustomSymbol(uint64_t a1)
{
  uint64_t v2 = sub_22D34B6B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CustomSymbol(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22D34B6B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  void *v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CustomSymbol(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22D34B6B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  void *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for CustomSymbol(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22D34B6B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for CustomSymbol(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22D34B6B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  void *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CustomSymbol(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22D34A810);
}

uint64_t sub_22D34A810(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22D34B6B8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for CustomSymbol(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22D34A8E8);
}

uint64_t sub_22D34A8E8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_22D34B6B8();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_22D34A9A8()
{
  uint64_t result = sub_22D34B6B8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void __swiftcall SymbolMetadataQuery.init()(SFSymbols::SymbolMetadataQuery *__return_ptr retstr)
{
  retstr->limitingCategoryKey = 0u;
  retstr->searchString = 0u;
  *(_DWORD *)&retstr->matchPrivateScalarsInSearchString = 65792;
  unint64_t v1 = (void *)MEMORY[0x263F8EE78];
  retstr->keyFilters._rawValue = (void *)MEMORY[0x263F8EE78];
  retstr->metadataFilters._rawValue = v1;
  retstr->termMetadataFilters._rawValue = v1;
}

Swift::Void __swiftcall SymbolMetadataQuery.limitResults(to:)(SFSymbols::SymbolCategory::Key to)
{
  uint64_t v3 = *(void *)to.rawValue._countAndFlagsBits;
  uint64_t v2 = *(void *)(to.rawValue._countAndFlagsBits + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *unint64_t v1 = v3;
  v1[1] = v2;
}

uint64_t SymbolMetadataQuery.searchString.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SymbolMetadataQuery.searchString.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*SymbolMetadataQuery.searchString.modify())()
{
  return nullsub_1;
}

uint64_t SymbolMetadataQuery.matchPrivateScalarsInSearchString.getter()
{
  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t SymbolMetadataQuery.matchPrivateScalarsInSearchString.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 32) = result;
  return result;
}

uint64_t (*SymbolMetadataQuery.matchPrivateScalarsInSearchString.modify())()
{
  return nullsub_1;
}

uint64_t SymbolMetadataQuery.includeSystemSymbols.getter()
{
  return *(unsigned __int8 *)(v0 + 33);
}

uint64_t SymbolMetadataQuery.includeSystemSymbols.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 33) = result;
  return result;
}

uint64_t (*SymbolMetadataQuery.includeSystemSymbols.modify())()
{
  return nullsub_1;
}

uint64_t SymbolMetadataQuery.includeCustomSymbols.getter()
{
  return *(unsigned __int8 *)(v0 + 34);
}

uint64_t SymbolMetadataQuery.includeCustomSymbols.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 34) = result;
  return result;
}

uint64_t (*SymbolMetadataQuery.includeCustomSymbols.modify())()
{
  return nullsub_1;
}

uint64_t SymbolMetadataQuery.includeLocalizedVariants.getter()
{
  return *(unsigned __int8 *)(v0 + 35);
}

uint64_t SymbolMetadataQuery.includeLocalizedVariants.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 35) = result;
  return result;
}

uint64_t (*SymbolMetadataQuery.includeLocalizedVariants.modify())()
{
  return nullsub_1;
}

uint64_t SymbolMetadataQuery.addSymbolKeyFilter(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  uint64_t v6 = *(void **)(v2 + 40);
  swift_retain();
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_22D3449D4(0, v6[2] + 1, 1, v6);
    uint64_t v6 = (void *)result;
  }
  unint64_t v9 = v6[2];
  unint64_t v8 = v6[3];
  if (v9 >= v8 >> 1)
  {
    uint64_t result = (uint64_t)sub_22D3449D4((void *)(v8 > 1), v9 + 1, 1, v6);
    uint64_t v6 = (void *)result;
  }
  void v6[2] = v9 + 1;
  unint64_t v10 = &v6[2 * v9];
  v10[4] = sub_22D34B31C;
  v10[5] = v5;
  *(void *)(v2 + 40) = v6;
  return result;
}

uint64_t sub_22D34ACC4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t SymbolMetadataQuery.addSymbolMetadataFilter(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  uint64_t v6 = *(void **)(v2 + 48);
  swift_retain();
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_22D3449E0(0, v6[2] + 1, 1, v6);
    uint64_t v6 = (void *)result;
  }
  unint64_t v9 = v6[2];
  unint64_t v8 = v6[3];
  if (v9 >= v8 >> 1)
  {
    uint64_t result = (uint64_t)sub_22D3449E0((void *)(v8 > 1), v9 + 1, 1, v6);
    uint64_t v6 = (void *)result;
  }
  void v6[2] = v9 + 1;
  unint64_t v10 = &v6[2 * v9];
  v10[4] = sub_22D34AE9C;
  v10[5] = v5;
  *(void *)(v2 + 48) = v6;
  return result;
}

uint64_t SymbolMetadataQuery.addSearchTermFilter(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *(void *)(v4 + 56);
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_22D344B0C(0, *(void *)(v9 + 16) + 1, 1, (char *)v9);
    uint64_t v9 = result;
  }
  unint64_t v12 = *(void *)(v9 + 16);
  unint64_t v11 = *(void *)(v9 + 24);
  if (v12 >= v11 >> 1)
  {
    uint64_t result = (uint64_t)sub_22D344B0C((char *)(v11 > 1), v12 + 1, 1, (char *)v9);
    uint64_t v9 = result;
  }
  *(void *)(v9 + 16) = v12 + 1;
  uint64_t v13 = (void *)(v9 + 32 * v12);
  v13[4] = a1;
  v13[5] = a2;
  v13[6] = a3;
  v13[7] = a4;
  *(void *)(v4 + 56) = v9;
  return result;
}

uint64_t sub_22D34AE9C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result & 1;
  return result;
}

uint64_t destroy for SymbolMetadataQuery()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SymbolMetadataQuery(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SymbolMetadataQuery(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  *(unsigned char *)(a1 + 34) = *(unsigned char *)(a2 + 34);
  *(unsigned char *)(a1 + 35) = *(unsigned char *)(a2 + 35);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SymbolMetadataQuery(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  *(unsigned char *)(a1 + 34) = *(unsigned char *)(a2 + 34);
  *(unsigned char *)(a1 + 35) = *(unsigned char *)(a2 + 35);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SymbolMetadataQuery(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SymbolMetadataQuery(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SymbolMetadataQuery()
{
  return &type metadata for SymbolMetadataQuery;
}

uint64_t destroy for SymbolMetadataQuery.TermMetadataFilter()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for SymbolMetadataQuery.TermMetadataFilter(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for SymbolMetadataQuery.TermMetadataFilter(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for SymbolMetadataQuery.TermMetadataFilter(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v4;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for SymbolMetadataQuery.TermMetadataFilter()
{
  return &type metadata for SymbolMetadataQuery.TermMetadataFilter;
}

SFSymbols::SymbolFeature __swiftcall SymbolFeature.init(rawValue:)(SFSymbols::SymbolFeature rawValue)
{
  *uint64_t v1 = rawValue;
  return rawValue;
}

uint64_t SymbolFeature.rawValue.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void static SymbolFeature.name.getter(void *a1@<X8>)
{
  *a1 = 1701667182;
  a1[1] = 0xE400000000000000;
}

void static SymbolFeature.monochrome.getter(void *a1@<X8>)
{
  *a1 = 0x6F7268636F6E6F6DLL;
  a1[1] = 0xEA0000000000656DLL;
}

void static SymbolFeature.multicolor.getter(void *a1@<X8>)
{
  *a1 = 0x6C6F6369746C756DLL;
  a1[1] = 0xEA0000000000726FLL;
}

void static SymbolFeature.hierarchical.getter(uint64_t a1@<X8>)
{
  *(unsigned char *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

unint64_t sub_22D34B3D4()
{
  unint64_t result = qword_268568960;
  if (!qword_268568960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268568960);
  }
  return result;
}

ValueMetadata *type metadata accessor for SymbolFeature()
{
  return &type metadata for SymbolFeature;
}

uint64_t sub_22D34B4E8()
{
  return MEMORY[0x270EEE098]();
}

uint64_t sub_22D34B4F8()
{
  return MEMORY[0x270EEE0C0]();
}

uint64_t sub_22D34B508()
{
  return MEMORY[0x270EEE170]();
}

uint64_t sub_22D34B518()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_22D34B528()
{
  return MEMORY[0x270EEE1A8]();
}

uint64_t sub_22D34B538()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_22D34B548()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_22D34B558()
{
  return MEMORY[0x270EEE648]();
}

uint64_t sub_22D34B568()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_22D34B578()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_22D34B588()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_22D34B598()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_22D34B5A8()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_22D34B5B8()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_22D34B5C8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_22D34B5D8()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_22D34B5E8()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_22D34B5F8()
{
  return MEMORY[0x270EEFD70]();
}

uint64_t sub_22D34B608()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_22D34B618()
{
  return MEMORY[0x270EEFD90]();
}

uint64_t sub_22D34B628()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_22D34B638()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_22D34B648()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_22D34B658()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_22D34B668()
{
  return MEMORY[0x270EF00E8]();
}

uint64_t sub_22D34B678()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_22D34B688()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_22D34B698()
{
  return MEMORY[0x270EF02A8]();
}

uint64_t sub_22D34B6A8()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_22D34B6B8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_22D34B6C8()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_22D34B6D8()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_22D34B6E8()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_22D34B6F8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_22D34B708()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_22D34B718()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_22D34B728()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_22D34B738()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_22D34B748()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_22D34B758()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_22D34B768()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_22D34B778()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_22D34B788()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_22D34B798()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_22D34B7A8()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_22D34B7C8()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_22D34B7D8()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_22D34B7E8()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_22D34B7F8()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_22D34B808()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_22D34B818()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_22D34B828()
{
  return MEMORY[0x270EF2350]();
}

uint64_t sub_22D34B838()
{
  return MEMORY[0x270EF2380]();
}

uint64_t sub_22D34B848()
{
  return MEMORY[0x270EF2388]();
}

uint64_t sub_22D34B858()
{
  return MEMORY[0x270EF23D8]();
}

uint64_t sub_22D34B868()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_22D34B878()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_22D34B888()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_22D34B898()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_22D34B8A8()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_22D34B8B8()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_22D34B8C8()
{
  return MEMORY[0x270F9E9A0]();
}

uint64_t sub_22D34B8D8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_22D34B8E8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_22D34B8F8()
{
  return MEMORY[0x270F9EB30]();
}

uint64_t sub_22D34B908()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_22D34B918()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_22D34B928()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_22D34B938()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_22D34B948()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_22D34B958()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_22D34B968()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_22D34B978()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_22D34B988()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_22D34B998()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_22D34B9A8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_22D34B9B8()
{
  return MEMORY[0x270F9F7E8]();
}

uint64_t sub_22D34B9C8()
{
  return MEMORY[0x270F9F878]();
}

uint64_t sub_22D34B9D8()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_22D34B9E8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_22D34B9F8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_22D34BA08()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_22D34BA18()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_22D34BA28()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_22D34BA38()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_22D34BA48()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_22D34BA58()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_22D34BA68()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_22D34BA78()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_22D34BA88()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t sub_22D34BA98()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_22D34BAA8()
{
  return MEMORY[0x270F9FD88]();
}

CFDataRef CTFontCopyTable(CTFontRef font, CTFontTableTag table, CTFontTableOptions options)
{
  return (CFDataRef)MEMORY[0x270EE9A88](font, *(void *)&table, *(void *)&options);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
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

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
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

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}