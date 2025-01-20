void sub_226D98A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

id shcore_log_object()
{
  if (shcore_log_object_onceToken != -1) {
    dispatch_once(&shcore_log_object_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)shcore_log_object_sLogObject;
  return v0;
}

uint64_t __shcore_log_object_block_invoke()
{
  shcore_log_object_sLogObject = (uint64_t)os_log_create("com.apple.shazam.ShazamCore", (const char *)[@"core" cStringUsingEncoding:4]);
  return MEMORY[0x270F9A758]();
}

void sub_226D9B5E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_226D9B710(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_226D9B9C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_226D9BB18(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_226D9CB28(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_226D9CE54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t Dictionary.mapKeys<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16 = a3;
  v14[2] = a4;
  v14[3] = a5;
  v14[4] = a6;
  v14[5] = a7;
  v14[6] = a8;
  v14[7] = a1;
  v14[8] = a2;
  uint64_t v9 = sub_226DA15D0();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26815D968);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t result = sub_226D9FE5C((void (*)(char *, char *))sub_226D9FE24, (uint64_t)v14, v9, TupleTypeMetadata2, v11, WitnessTable, MEMORY[0x263F8E4E0], (uint64_t)&v15);
  if (!v8)
  {
    uint64_t v16 = result;
    sub_226DA1610();
    swift_getWitnessTable();
    return sub_226DA15C0();
  }
  return result;
}

uint64_t sub_226D9FC40@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t)@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>, void *a7)
{
  v23[1] = a5;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  MEMORY[0x270FA5388]();
  uint64_t v15 = (char *)v23 - v14;
  uint64_t result = a2(a1);
  if (v7)
  {
    *a7 = v7;
  }
  else
  {
    uint64_t v17 = a6 + *(int *)(swift_getTupleTypeMetadata2() + 48);
    uint64_t v18 = *(int *)(TupleTypeMetadata2 + 48);
    v19 = &v15[v18];
    uint64_t v20 = a1 + v18;
    uint64_t v21 = *(void *)(a3 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v15, a1, a3);
    uint64_t v22 = *(void *)(a4 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v19, v20, a4);
    (*(void (**)(uint64_t, char *, uint64_t))(v22 + 32))(v17, v19, a4);
    return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v15, a3);
  }
  return result;
}

uint64_t sub_226D9FE24@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_226D9FC40(a1, *(uint64_t (**)(uint64_t))(v3 + 56), *(void *)(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32), a3, a2);
}

uint64_t sub_226D9FE5C(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v28 = a5;
  uint64_t v29 = a8;
  v38 = a1;
  uint64_t v39 = a2;
  uint64_t v27 = *(void *)(a5 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v40 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v33 = *(void (***)(char *, uint64_t))(AssociatedTypeWitness - 8);
  uint64_t v10 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v12 = (char *)&v26 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = swift_getAssociatedTypeWitness();
  uint64_t v30 = *(void *)(v15 - 8);
  uint64_t v31 = v15;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v26 - v16;
  uint64_t v18 = sub_226DA1660();
  if (!v18) {
    return sub_226DA1600();
  }
  uint64_t v19 = v18;
  uint64_t v43 = sub_226DA16B0();
  uint64_t v32 = sub_226DA16C0();
  sub_226DA1690();
  uint64_t v36 = v8;
  uint64_t result = sub_226DA1650();
  if (v19 < 0)
  {
    __break(1u);
  }
  else
  {
    v34 = (void (**)(char *))(v33 + 2);
    v35 = v14;
    ++v33;
    while (1)
    {
      uint64_t v21 = (void (*)(char *, void))sub_226DA1680();
      uint64_t v22 = v12;
      v23 = v12;
      uint64_t v24 = AssociatedTypeWitness;
      (*v34)(v22);
      v21(v42, 0);
      uint64_t v25 = v41;
      v38(v23, v40);
      if (v25) {
        break;
      }
      uint64_t v41 = 0;
      (*v33)(v23, v24);
      sub_226DA16A0();
      sub_226DA1670();
      --v19;
      v12 = v23;
      if (!v19)
      {
        (*(void (**)(char *, uint64_t))(v30 + 8))(v17, v31);
        return v43;
      }
    }
    (*v33)(v23, v24);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v17, v31);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v27 + 32))(v29, v40, v28);
  }
  return result;
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

uint64_t sub_226DA0408(const void *a1)
{
  *(void *)(v1 + 16) = _Block_copy(a1);
  v4 = (uint64_t (__cdecl *)())((char *)&dword_26815D9C0 + dword_26815D9C0);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_226DA04B0;
  return v4();
}

uint64_t sub_226DA04B0()
{
  uint64_t v1 = *(void (***)(void, void))(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  uint64_t v2 = (void *)sub_226DA15E0();
  swift_bridgeObjectRelease();
  ((void (**)(void, void *))v1)[2](v1, v2);

  _Block_release(v1);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

SHStorefront __swiftcall SHStorefront.init()()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (SHStorefront)objc_msgSend(v0, sel_init);
}

id SHStorefront.init()()
{
  v1.super_class = (Class)SHStorefront;
  return objc_msgSendSuper2(&v1, sel_init);
}

unint64_t type metadata accessor for SHStorefront()
{
  unint64_t result = qword_26815D970;
  if (!qword_26815D970)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26815D970);
  }
  return result;
}

uint64_t sub_226DA06EC()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_226DA072C()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_226DA155C;
  v4 = (uint64_t (*)(const void *))((char *)&dword_26815D980 + dword_26815D980);
  return v4(v2);
}

uint64_t sub_226DA07D8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_226DA155C;
  return v6();
}

uint64_t sub_226DA08A8()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_226DA155C;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))&aHL[*(int *)aHL];
  return v6(v2, v3, v4);
}

uint64_t sub_226DA0968(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_226DA155C;
  return v7();
}

uint64_t objectdestroy_4Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_226DA0A78(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_226DA0B44;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_26815D9A0 + dword_26815D9A0);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_226DA0B44()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_226DA0C38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_226DA1640();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_226DA1630();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_226DA1500(a1, &qword_26815D978);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_226DA1620();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_226DA0DE4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_226DA0EC0;
  return v6(a1);
}

uint64_t sub_226DA0EC0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_226DA0FB8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_226DA0FF0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_226DA0B44;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))&a44l[*(int *)a44l];
  return v6(a1, v4);
}

uint64_t sub_226DA10A8()
{
  uint64_t v1 = sub_226DA15A0();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26815D9C8);
  v0[5] = swift_task_alloc();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[6] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_226DA11C4;
  return MEMORY[0x270EF6518]();
}

uint64_t sub_226DA11C4(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  swift_task_dealloc();
  if (v2)
  {

    uint64_t v7 = sub_226DA1390;
  }
  else
  {
    *(void *)(v6 + 56) = a2;
    *(void *)(v6 + 64) = a1;
    uint64_t v7 = sub_226DA12FC;
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

uint64_t sub_226DA12FC()
{
  uint64_t v1 = sub_226DA15F0();
  uint64_t v3 = v2;
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v4(v1, v3);
}

uint64_t sub_226DA1390()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  sub_226DA1560();
  sub_226DA1590();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
  uint64_t v5 = sub_226DA1580();
  uint64_t v6 = *(void *)(v5 - 8);
  int v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v2, 1, v5);
  uint64_t v8 = v0[5];
  if (v7 == 1)
  {
    sub_226DA1500(v0[5], &qword_26815D9C8);
    unint64_t v9 = 0xE100000000000000;
    uint64_t v10 = 45;
  }
  else
  {
    sub_226DA1570();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v10 = sub_226DA15F0();
    unint64_t v9 = v11;
    swift_bridgeObjectRelease();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  v12 = (uint64_t (*)(uint64_t, unint64_t))v0[1];
  return v12(v10, v9);
}

uint64_t sub_226DA1500(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_226DA1560()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_226DA1570()
{
  return MEMORY[0x270EF0F48]();
}

uint64_t sub_226DA1580()
{
  return MEMORY[0x270EF0F70]();
}

uint64_t sub_226DA1590()
{
  return MEMORY[0x270EF0F90]();
}

uint64_t sub_226DA15A0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_226DA15C0()
{
  return MEMORY[0x270F9D0B0]();
}

uint64_t sub_226DA15D0()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_226DA15E0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_226DA15F0()
{
  return MEMORY[0x270F9D610]();
}

uint64_t sub_226DA1600()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_226DA1610()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_226DA1620()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_226DA1630()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_226DA1640()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_226DA1650()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_226DA1660()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_226DA1670()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_226DA1680()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_226DA1690()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_226DA16A0()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_226DA16B0()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_226DA16C0()
{
  return MEMORY[0x270F9EC90]();
}

int AAArchiveStreamClose(AAArchiveStream s)
{
  return MEMORY[0x270F90C30](s);
}

ssize_t AAArchiveStreamProcess(AAArchiveStream istream, AAArchiveStream ostream, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return MEMORY[0x270F90C38](istream, ostream, msg_data, msg_proc, flags, *(void *)&n_threads);
}

int AAByteStreamClose(AAByteStream s)
{
  return MEMORY[0x270F90C78](s);
}

AAArchiveStream AADecodeArchiveInputStreamOpen(AAByteStream stream, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return (AAArchiveStream)MEMORY[0x270F90D70](stream, msg_data, msg_proc, flags, *(void *)&n_threads);
}

AAByteStream AADecompressionInputStreamOpen(AAByteStream compressed_stream, AAFlagSet flags, int n_threads)
{
  return (AAByteStream)MEMORY[0x270F90D78](compressed_stream, flags, *(void *)&n_threads);
}

AAArchiveStream AAExtractArchiveOutputStreamOpen(const char *dir, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return (AAArchiveStream)MEMORY[0x270F90E30](dir, msg_data, msg_proc, flags, *(void *)&n_threads);
}

AAByteStream AAFileStreamOpenWithPath(const char *path, int open_flags, mode_t open_mode)
{
  return (AAByteStream)MEMORY[0x270F90EB0](path, *(void *)&open_flags, open_mode);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x270EFDCD0](allocator);
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x270F98F68](stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x270F98F78](stream, *(void *)&operation, *(void *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x270F98F80](stream, *(void *)&flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t tcc_authorization_check_audit_token()
{
  return MEMORY[0x270F79678]();
}