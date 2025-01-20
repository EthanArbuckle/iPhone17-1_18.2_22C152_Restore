uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t _LockdownVersion.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_25C221C88();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_25C208CFC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 232) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 56);
  if (v0) {
    v4 = sub_25C2164C4;
  }
  else {
    v4 = sub_25C20CA04;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t GPUServiceExtension.configuration.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a1 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1);
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_25C221708();
}

uint64_t ContentServiceExtension._lockdown(version:)()
{
  sub_25C221BE8();
  swift_bridgeObjectRelease();
  sandbox_enable_local_state_flag();
  return sandbox_enable_local_state_flag();
}

uint64_t type metadata accessor for _SEServiceManager()
{
  return self;
}

void destroy for _Capability.Grant(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
}

uint64_t ContentServiceExtension.configuration.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a1 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1);
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_25C221708();
}

id sub_25C209250()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for _SEServiceManager()), sel_init);
  qword_26A597270 = (uint64_t)result;
  return result;
}

uint64_t objectdestroyTm(void (*a1)(void))
{
  uint64_t v3 = (int *)(type metadata accessor for BackgroundTransferManager.Download(0) - 8);
  uint64_t v4 = *(unsigned __int8 *)(*(void *)v3 + 80);
  uint64_t v5 = (v4 + 24) & ~v4;
  uint64_t v6 = v5 + *(void *)(*(void *)v3 + 64);
  uint64_t v7 = v4 | 7;
  a1(*(void *)(v1 + 16));
  uint64_t v8 = v1 + v5;
  uint64_t v9 = sub_25C2216F8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v1 + v5, v9);
  swift_bridgeObjectRelease();
  uint64_t v10 = v1 + v5 + v3[8];
  uint64_t v11 = sub_25C2218B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  swift_bridgeObjectRelease();
  uint64_t v12 = v8 + v3[10];
  uint64_t v13 = sub_25C2216C8();
  v14 = *(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8);
  v14(v12, v13);
  swift_bridgeObjectRelease();
  v14(v8 + v3[12], v13);

  return MEMORY[0x270FA0238](v1, v6, v7);
}

uint64_t objectdestroyTm_0()
{
  uint64_t v1 = sub_25C2217E8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t NetworkingServiceExtension.configuration.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a1 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1);
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_25C221708();
}

uint64_t sub_25C209620()
{
  type metadata accessor for _ServiceManager();
  uint64_t v0 = swift_allocObject();
  uint64_t result = swift_defaultActor_initialize();
  qword_26A596E88 = v0;
  return result;
}

uint64_t sub_25C20981C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_25C209860()
{
  sub_25C209868(v0);
}

void sub_25C209868(void *a1)
{
  uint64_t v2 = sub_25C2217E8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (os_unfair_lock_s *)(a1[4] + 16);
  os_unfair_lock_lock(v6);
  unint64_t v7 = (void (*)(uint64_t))a1[2];
  if (v7)
  {
    uint64_t v8 = swift_retain();
    v7(v8);
    sub_25C2217C8();
    sub_25C20D3F0((uint64_t)v7);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v9 = a1[2];
    a1[2] = 0;
    a1[3] = 0;
    sub_25C20D3F0(v9);
  }
  os_unfair_lock_unlock(v6);
}

void *initializeBufferWithCopyOfBuffer for _Capability.Grant(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  id v6 = v4;
  return a1;
}

uint64_t sub_25C209B28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result = a4(319);
  if (v5 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_25C209BBC()
{
  uint64_t result = sub_25C2217E8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25C209C54()
{
  swift_bridgeObjectRetain();
  sub_25C2217F8();
  uint64_t v3 = sub_25C221808();
  if (v3 == 0xD000000000000020 && v4 == 0x800000025C2236F0)
  {
    swift_bridgeObjectRelease();
LABEL_9:
    uint64_t v7 = v0[22];
    uint64_t v6 = v0[23];
    uint64_t v8 = v0[20];
    uint64_t v9 = v0[21];
    (*(void (**)(void, void, void))(v0[25] + 16))(v0[26], v0[27], v0[24]);
    swift_retain();
    sub_25C221748();
    sub_25C221768();
    sub_25C221798();
    sub_25C221758();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v7, v6, v8);
    uint64_t v10 = (void *)swift_task_alloc();
    v0[28] = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_25C20E940;
    uint64_t v11 = v0[22];
    uint64_t v12 = v0[18];
    return MEMORY[0x270EEB760](v12, v11);
  }
  char v5 = sub_25C221CC8();
  swift_bridgeObjectRelease();
  if (v5) {
    goto LABEL_9;
  }
  id v13 = objc_allocWithZone(MEMORY[0x263F087E8]);
  v14 = (void *)sub_25C2219D8();
  objc_msgSend(v13, sel_initWithDomain_code_userInfo_, v14, 1, 0);

  swift_willThrow();
  (*(void (**)(void, void))(v0[25] + 8))(v0[27], v0[24]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_25C209F40(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t objectdestroy_49Tm()
{
  swift_unknownObjectRelease();

  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_25C209FE8()
{
  uint64_t v24 = v0[27];
  uint64_t v22 = v0[25];
  uint64_t v23 = v0[24];
  uint64_t v21 = v0[23];
  uint64_t v19 = v0[21];
  uint64_t v20 = v0[20];
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[17];
  uint64_t v3 = v0[14];
  uint64_t v4 = v0[12];
  uint64_t v5 = v0[13];
  uint64_t v16 = v0[11];
  uint64_t v17 = v0[18];
  uint64_t v6 = v0[9];
  v14 = (void *)v0[10];
  uint64_t v15 = v0[8];
  uint64_t v18 = v0[2];
  uint64_t v7 = *(void (**)(uint64_t))(v3 + 16);
  v7(v2);
  ((void (*)(uint64_t, uint64_t, uint64_t))v7)(v4, v2, v5);
  ((void (*)(uint64_t, uint64_t, uint64_t))v7)(v1, v2, v5);
  unint64_t v8 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v9 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v9 + v8, v1, v5);
  void *v14 = 1;
  (*(void (**)(void *, void, uint64_t))(v6 + 104))(v14, *MEMORY[0x263F8F018], v15);
  type metadata accessor for LaunchAssertionInvalidator();
  swift_allocObject();
  uint64_t v10 = sub_25C20CCF4((uint64_t)sub_25C20E2B8, v9, (uint64_t)v14);
  swift_release();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v11(v2, v5);
  *(void *)(v4 + *(int *)(v16 + 20)) = v10;
  sub_25C20D104(v4, v18, type metadata accessor for _GPUProcess);
  v11(v17, v5);
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v21, v20);
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v24, v23);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t objectdestroy_36Tm()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t _ServiceManager.gpuProcess(serviceIdentifier:onInteruption:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  uint64_t v7 = sub_25C221928();
  v6[8] = v7;
  v6[9] = *(void *)(v7 - 8);
  v6[10] = swift_task_alloc();
  v6[11] = type metadata accessor for _GPUProcess(0);
  v6[12] = swift_task_alloc();
  uint64_t v8 = sub_25C2217E8();
  v6[13] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v6[14] = v9;
  v6[15] = *(void *)(v9 + 64);
  v6[16] = swift_task_alloc();
  v6[17] = swift_task_alloc();
  v6[18] = swift_task_alloc();
  sub_25C2217A8();
  v6[19] = swift_task_alloc();
  uint64_t v10 = sub_25C221778();
  v6[20] = v10;
  v6[21] = *(void *)(v10 - 8);
  v6[22] = swift_task_alloc();
  v6[23] = swift_task_alloc();
  uint64_t v11 = sub_25C221818();
  v6[24] = v11;
  v6[25] = *(void *)(v11 - 8);
  v6[26] = swift_task_alloc();
  v6[27] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C209C54, v5, 0);
}

uint64_t type metadata accessor for _SEServiceConfiguration()
{
  return self;
}

uint64_t sub_25C20AA20@<X0>(long long *a1@<X0>, void *a2@<X8>)
{
  char v2 = *((unsigned char *)a1 + 80);
  long long v3 = a1[1];
  long long v7 = *a1;
  long long v8 = v3;
  long long v4 = a1[3];
  long long v9 = a1[2];
  long long v10 = v4;
  long long v11 = a1[4];
  char v12 = v2;
  v6[3] = &type metadata for Process;
  v6[4] = &off_27098D860;
  sub_25C219BF4(v6, a2);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
}

uint64_t sub_25C20AAF8()
{
  swift_bridgeObjectRetain();
  sub_25C2217F8();
  uint64_t v3 = sub_25C221808();
  if (v3 == 0xD000000000000027 && v4 == 0x800000025C2236C0)
  {
    swift_bridgeObjectRelease();
LABEL_9:
    uint64_t v7 = v0[22];
    uint64_t v6 = v0[23];
    uint64_t v8 = v0[20];
    uint64_t v9 = v0[21];
    (*(void (**)(void, void, void))(v0[25] + 16))(v0[26], v0[27], v0[24]);
    swift_retain();
    sub_25C221748();
    sub_25C221768();
    sub_25C221798();
    sub_25C221758();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v7, v6, v8);
    long long v10 = (void *)swift_task_alloc();
    v0[28] = v10;
    *long long v10 = v0;
    v10[1] = sub_25C20E814;
    uint64_t v11 = v0[22];
    uint64_t v12 = v0[18];
    return MEMORY[0x270EEB760](v12, v11);
  }
  char v5 = sub_25C221CC8();
  swift_bridgeObjectRelease();
  if (v5) {
    goto LABEL_9;
  }
  id v13 = objc_allocWithZone(MEMORY[0x263F087E8]);
  v14 = (void *)sub_25C2219D8();
  objc_msgSend(v13, sel_initWithDomain_code_userInfo_, v14, 1, 0);

  swift_willThrow();
  (*(void (**)(void, void))(v0[25] + 8))(v0[27], v0[24]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

Swift::Void __swiftcall _ContentProcess.invalidate()()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for _ContentProcess(0) + 20));
  char v2 = (os_unfair_lock_s *)(v1[4] + 16);
  os_unfair_lock_lock(v2);
  uint64_t v3 = v1[2];
  if (v3)
  {
    v1[2] = 0;
    v1[3] = 0;
    sub_25C20D3F0(v3);
  }
  os_unfair_lock_unlock(v2);
  _s17ServiceExtensions11_GPUProcessV10invalidateyyF_0();
}

id _s17ServiceExtensions13_SECapabilityC9assertion7websiteACSS_tFZ_0(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend(self, sel_mainBundle);
  id v5 = objc_msgSend(v4, sel_bundleIdentifier);

  if (v5)
  {
    sub_25C2219E8();
  }
  getpid();
  if (qword_26A596D00 != -1) {
    swift_once();
  }
  uint64_t v6 = (os_unfair_lock_s *)(qword_26A596FC0 + 16);
  swift_retain();
  os_unfair_lock_lock(v6);
  id result = (id)swift_release();
  if (__OFADD__(qword_26A596FC8, 1))
  {
    __break(1u);
  }
  else
  {
    ++qword_26A596FC8;
    uint64_t v16 = sub_25C221C98();
    uint64_t v17 = v8;
    sub_25C221A08();
    uint64_t v15 = qword_26A596FC8;
    sub_25C221C98();
    sub_25C221A08();
    swift_bridgeObjectRelease();
    sub_25C221A08();
    sub_25C221A08();
    swift_bridgeObjectRelease();
    uint64_t v9 = v17;
    long long v10 = (os_unfair_lock_s *)qword_26A596FC0;
    swift_retain();
    os_unfair_lock_unlock(v10 + 4);
    swift_release();
    uint64_t v11 = (objc_class *)type metadata accessor for _SECapability();
    uint64_t v12 = (char *)objc_allocWithZone(v11);
    id v13 = &v12[OBJC_IVAR____SECapability_inner];
    *(void *)id v13 = v16;
    *((void *)v13 + 1) = v9;
    *((void *)v13 + 2) = a1;
    *((void *)v13 + 3) = a2;
    *((_OWORD *)v13 + 2) = 0u;
    *((_OWORD *)v13 + 3) = 0u;
    *((_OWORD *)v13 + 4) = 0u;
    v13[80] = 3;
    v14.receiver = v12;
    v14.super_class = v11;
    swift_bridgeObjectRetain();
    return objc_msgSendSuper2(&v14, sel_init);
  }
  return result;
}

uint64_t sub_25C20B20C()
{
  uint64_t v24 = v0[27];
  uint64_t v22 = v0[25];
  uint64_t v23 = v0[24];
  uint64_t v21 = v0[23];
  uint64_t v19 = v0[21];
  uint64_t v20 = v0[20];
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[17];
  uint64_t v3 = v0[14];
  uint64_t v4 = v0[12];
  uint64_t v5 = v0[13];
  uint64_t v16 = v0[11];
  uint64_t v17 = v0[18];
  uint64_t v6 = v0[9];
  objc_super v14 = (void *)v0[10];
  uint64_t v15 = v0[8];
  uint64_t v18 = v0[2];
  uint64_t v7 = *(void (**)(uint64_t))(v3 + 16);
  v7(v2);
  ((void (*)(uint64_t, uint64_t, uint64_t))v7)(v4, v2, v5);
  ((void (*)(uint64_t, uint64_t, uint64_t))v7)(v1, v2, v5);
  unint64_t v8 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v9 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v9 + v8, v1, v5);
  void *v14 = 1;
  (*(void (**)(void *, void, uint64_t))(v6 + 104))(v14, *MEMORY[0x263F8F018], v15);
  type metadata accessor for LaunchAssertionInvalidator();
  swift_allocObject();
  long long v10 = sub_25C20CCF4((uint64_t)sub_25C20E2B8, v9, (uint64_t)v14);
  swift_release();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v11(v2, v5);
  *(void *)(v4 + *(int *)(v16 + 20)) = v10;
  sub_25C20D104(v4, v18, type metadata accessor for _NetworkProcess);
  v11(v17, v5);
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v21, v20);
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v24, v23);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t _ServiceManager.networkProcess(serviceIdentifier:onInteruption:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  void v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  uint64_t v7 = sub_25C221928();
  v6[8] = v7;
  v6[9] = *(void *)(v7 - 8);
  v6[10] = swift_task_alloc();
  v6[11] = type metadata accessor for _NetworkProcess(0);
  v6[12] = swift_task_alloc();
  uint64_t v8 = sub_25C2217E8();
  v6[13] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v6[14] = v9;
  v6[15] = *(void *)(v9 + 64);
  v6[16] = swift_task_alloc();
  v6[17] = swift_task_alloc();
  v6[18] = swift_task_alloc();
  sub_25C2217A8();
  v6[19] = swift_task_alloc();
  uint64_t v10 = sub_25C221778();
  v6[20] = v10;
  v6[21] = *(void *)(v10 - 8);
  v6[22] = swift_task_alloc();
  v6[23] = swift_task_alloc();
  uint64_t v11 = sub_25C221818();
  v6[24] = v11;
  v6[25] = *(void *)(v11 - 8);
  v6[26] = swift_task_alloc();
  v6[27] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C20AAF8, v5, 0);
}

uint64_t sub_25C20B870()
{
  return sub_25C20B888();
}

uint64_t sub_25C20B888()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25C2217E8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  uint64_t v6 = sub_25C2217B8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v6;
}

uint64_t sub_25C20B988()
{
  swift_bridgeObjectRetain();
  sub_25C2217F8();
  uint64_t v3 = sub_25C221808();
  if (v3 == 0xD000000000000024 && v4 == 0x800000025C223720)
  {
    swift_bridgeObjectRelease();
LABEL_9:
    uint64_t v7 = v0[22];
    uint64_t v6 = v0[23];
    uint64_t v8 = v0[20];
    uint64_t v9 = v0[21];
    (*(void (**)(void, void, void))(v0[25] + 16))(v0[26], v0[27], v0[24]);
    swift_retain();
    sub_25C221738();
    sub_25C221768();
    sub_25C221798();
    sub_25C221758();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v7, v6, v8);
    uint64_t v10 = (void *)swift_task_alloc();
    v0[28] = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_25C208CFC;
    uint64_t v11 = v0[22];
    uint64_t v12 = v0[18];
    return MEMORY[0x270EEB760](v12, v11);
  }
  char v5 = sub_25C221CC8();
  swift_bridgeObjectRelease();
  if (v5) {
    goto LABEL_9;
  }
  id v13 = objc_allocWithZone(MEMORY[0x263F087E8]);
  objc_super v14 = (void *)sub_25C2219D8();
  objc_msgSend(v13, sel_initWithDomain_code_userInfo_, v14, 1, 0);

  swift_willThrow();
  (*(void (**)(void, void))(v0[25] + 8))(v0[27], v0[24]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_25C20BDEC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A596E58);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t _ServiceManager.contentProcess(serviceIdentifier:onInteruption:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  void v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  uint64_t v7 = sub_25C221928();
  v6[8] = v7;
  v6[9] = *(void *)(v7 - 8);
  v6[10] = swift_task_alloc();
  v6[11] = type metadata accessor for _ContentProcess(0);
  v6[12] = swift_task_alloc();
  uint64_t v8 = sub_25C2217E8();
  v6[13] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v6[14] = v9;
  v6[15] = *(void *)(v9 + 64);
  v6[16] = swift_task_alloc();
  v6[17] = swift_task_alloc();
  v6[18] = swift_task_alloc();
  sub_25C2217A8();
  v6[19] = swift_task_alloc();
  uint64_t v10 = sub_25C221778();
  v6[20] = v10;
  v6[21] = *(void *)(v10 - 8);
  v6[22] = swift_task_alloc();
  v6[23] = swift_task_alloc();
  uint64_t v11 = sub_25C221818();
  v6[24] = v11;
  v6[25] = *(void *)(v11 - 8);
  v6[26] = swift_task_alloc();
  v6[27] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C20B988, v5, 0);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> _Capability.Grant.invalidate()()
{
  v9[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = *(void **)v0;
  uint64_t v2 = *(void **)(v0 + 8);
  if (v2) {
    objc_msgSend(v1, sel_removeObserver_, v2);
  }
  v9[0] = 0;
  unsigned int v3 = objc_msgSend(v1, sel_invalidateSyncWithError_, v9);
  id v4 = v9[0];
  if (v3)
  {
    if (v2)
    {
      id v5 = v2;
      id v6 = v4;
      sub_25C20C248(&OBJC_IVAR____TtCO17ServiceExtensions11_CapabilityP33_3A110C98667FE5E79B17C7ACF7B087C017AssertionObserver__didInvalidate);
    }
    else
    {
      id v8 = v9[0];
    }
  }
  else
  {
    id v7 = v9[0];
    sub_25C221678();

    swift_willThrow();
  }
}

void sub_25C20C248(void *a1)
{
  unsigned int v3 = (os_unfair_lock_s *)(*(void *)(v1
                                      + OBJC_IVAR____TtCO17ServiceExtensions11_CapabilityP33_3A110C98667FE5E79B17C7ACF7B087C017AssertionObserver_invalidationLock)
                          + 16);
  os_unfair_lock_lock(v3);
  uint64_t v4 = v1 + *a1;
  id v5 = *(void (**)(uint64_t))v4;
  if (*(void *)v4)
  {
    *(void *)uint64_t v4 = 0;
    *(void *)(v4 + 8) = 0;
    swift_retain();
    uint64_t v6 = sub_25C20D3F0((uint64_t)v5);
    v5(v6);
    sub_25C20D3F0((uint64_t)v5);
  }
  os_unfair_lock_unlock(v3);
}

uint64_t sub_25C20C4A0()
{
  return sub_25C20C4B8();
}

uint64_t sub_25C20C4B8()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 16);
  if (v1) {
    return v1();
  }
  return result;
}

void sub_25C20C538(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  switch(a11)
  {
    case 0:
    case 1:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_7;
    case 2:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_25C20D3F0(a7);
      sub_25C20D3F0(a9);
      break;
    case 3:
      swift_bridgeObjectRelease();
LABEL_7:
      swift_bridgeObjectRelease();
      break;
    default:
      return;
  }
}

uint64_t sub_25C20C63C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25C20C6A0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t type metadata accessor for _SEExtensionProcess()
{
  return self;
}

uint64_t type metadata accessor for _SEContentProcess(uint64_t a1)
{
  return sub_25C20D630(a1, (uint64_t *)&unk_26A596F48);
}

uint64_t sub_25C20C790()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t type metadata accessor for _SECapability()
{
  return self;
}

uint64_t sub_25C20CA04()
{
  uint64_t v24 = v0[27];
  uint64_t v22 = v0[25];
  uint64_t v23 = v0[24];
  uint64_t v21 = v0[23];
  uint64_t v19 = v0[21];
  uint64_t v20 = v0[20];
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[17];
  uint64_t v3 = v0[14];
  uint64_t v4 = v0[12];
  uint64_t v5 = v0[13];
  uint64_t v16 = v0[11];
  uint64_t v17 = v0[18];
  uint64_t v6 = v0[9];
  objc_super v14 = (void *)v0[10];
  uint64_t v15 = v0[8];
  uint64_t v18 = v0[2];
  id v7 = *(void (**)(uint64_t))(v3 + 16);
  v7(v2);
  ((void (*)(uint64_t, uint64_t, uint64_t))v7)(v4, v2, v5);
  ((void (*)(uint64_t, uint64_t, uint64_t))v7)(v1, v2, v5);
  unint64_t v8 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v9 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v9 + v8, v1, v5);
  void *v14 = 1;
  (*(void (**)(void *, void, uint64_t))(v6 + 104))(v14, *MEMORY[0x263F8F018], v15);
  type metadata accessor for LaunchAssertionInvalidator();
  swift_allocObject();
  uint64_t v10 = sub_25C20CCF4((uint64_t)sub_25C20E2B8, v9, (uint64_t)v14);
  swift_release();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v11(v2, v5);
  *(void *)(v4 + *(int *)(v16 + 20)) = v10;
  sub_25C20D104(v4, v18, type metadata accessor for _ContentProcess);
  v11(v17, v5);
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v21, v20);
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v24, v23);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t type metadata accessor for LaunchAssertionInvalidator()
{
  return self;
}

void *sub_25C20CCF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v23 = a3;
  uint64_t v8 = sub_25C221938();
  MEMORY[0x270FA5388](v8);
  uint64_t v9 = sub_25C221958();
  uint64_t v22 = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v21 - v14;
  v4[2] = 0;
  v4[3] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A596F88);
  uint64_t v16 = swift_allocObject();
  *(_DWORD *)(v16 + 16) = 0;
  v4[3] = a2;
  v4[4] = v16;
  v4[2] = a1;
  swift_retain();
  sub_25C20D3F0(0);
  sub_25C20D014(0, &qword_26A596F90);
  uint64_t v17 = (void *)sub_25C221AB8();
  sub_25C221948();
  MEMORY[0x2611805E0](v13, a3);
  uint64_t v18 = *(void (**)(char *, uint64_t))(v10 + 8);
  v18(v13, v9);
  aBlock[4] = sub_25C209860;
  aBlock[5] = v4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25C20981C;
  aBlock[3] = &block_descriptor_0;
  _Block_copy(aBlock);
  uint64_t v24 = MEMORY[0x263F8EE78];
  sub_25C20D0AC();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A596FA0);
  sub_25C20D050();
  sub_25C221B18();
  sub_25C221978();
  swift_allocObject();
  sub_25C221968();
  swift_release();
  sub_25C221AA8();

  swift_release();
  uint64_t v19 = sub_25C221928();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8))(v23, v19);
  v18(v15, v22);
  return v4;
}

uint64_t sub_25C20D014(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_25C20D050()
{
  unint64_t result = qword_26A596FA8;
  if (!qword_26A596FA8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A596FA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A596FA8);
  }
  return result;
}

unint64_t sub_25C20D0AC()
{
  unint64_t result = qword_26A596F98;
  if (!qword_26A596F98)
  {
    sub_25C221938();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A596F98);
  }
  return result;
}

uint64_t sub_25C20D104(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

id sub_25C20D16C(void *a1, uint64_t a2, void *a3, uint64_t a4, void (*a5)(void *__return_ptr, id))
{
  id v7 = a3;
  id v8 = a1;
  a5(v11, v7);

  __swift_project_boxed_opaque_existential_1(v11, v11[3]);
  uint64_t v9 = (void *)sub_25C221CA8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  return v9;
}

void sub_25C20D250(uint64_t a1@<X0>, void *a2@<X8>)
{
}

void sub_25C20D268(uint64_t a1@<X0>, void *a2@<X8>)
{
  (*(void (**)(void *__return_ptr))((*MEMORY[0x263F8EED0] & *v2) + 0x50))(v23);
  uint64_t v6 = v24;
  uint64_t v7 = v25;
  __swift_project_boxed_opaque_existential_1(v23, v24);
  char v8 = *(unsigned char *)(a1 + OBJC_IVAR____SECapability_inner + 80);
  long long v9 = *(_OWORD *)(a1 + OBJC_IVAR____SECapability_inner + 16);
  v20[0] = *(_OWORD *)(a1 + OBJC_IVAR____SECapability_inner);
  v20[1] = v9;
  long long v10 = *(_OWORD *)(a1 + OBJC_IVAR____SECapability_inner + 48);
  v20[2] = *(_OWORD *)(a1 + OBJC_IVAR____SECapability_inner + 32);
  v20[3] = v10;
  v20[4] = *(_OWORD *)(a1 + OBJC_IVAR____SECapability_inner + 64);
  char v21 = v8;
  (*(void (**)(void *__return_ptr, _OWORD *, uint64_t, uint64_t))(v7 + 32))(v22, v20, v6, v7);
  if (v3)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  }
  else
  {
    uint64_t v11 = (void *)v22[0];
    uint64_t v12 = (void *)v22[1];
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    uint64_t v13 = (objc_class *)type metadata accessor for _SEInternalGrant();
    uint64_t v14 = (char *)objc_allocWithZone(v13);
    uint64_t v15 = &v14[OBJC_IVAR____TtC17ServiceExtensionsP33_620D12DBAD85E5FA4594BA268933638A16_SEInternalGrant_inner];
    *(void *)uint64_t v15 = v11;
    *((void *)v15 + 1) = v12;
    v19.receiver = v14;
    v19.super_class = v13;
    id v16 = v11;
    id v17 = v12;
    id v18 = objc_msgSendSuper2(&v19, sel_init);
    a2[3] = v13;

    *a2 = v18;
  }
}

uint64_t type metadata accessor for _SEInternalGrant()
{
  return self;
}

uint64_t sub_25C20D3F0(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t _s17ServiceExtensions15_NetworkProcessVwxx_0(uint64_t a1)
{
  uint64_t v2 = sub_25C2217E8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_release();
}

uint64_t sub_25C20D474(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v2;
  long long v3 = *(_OWORD *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 48);
  long long v5 = *(_OWORD *)(a1 + 64);
  *(unsigned char *)(a2 + 80) = *(unsigned char *)(a1 + 80);
  *(_OWORD *)(a2 + 48) = v4;
  *(_OWORD *)(a2 + 64) = v5;
  *(_OWORD *)(a2 + 32) = v3;
  return a2;
}

uint64_t sub_25C20D49C@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, uint64_t (*a4)(void)@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v9 = v5 + *a1;
  a5[3] = a2(0);
  a5[4] = a3;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a5);
  return sub_25C20D560(v9, (uint64_t)boxed_opaque_existential_1, a4);
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_25C20D560(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25C20D5C8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25C20D630(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t _s17ServiceExtensions15_NetworkProcessVwcp_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C2217E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  return a1;
}

uint64_t type metadata accessor for _ContentProcess(uint64_t a1)
{
  return sub_25C20D630(a1, (uint64_t *)&unk_26A596F30);
}

uint64_t type metadata accessor for _NetworkProcess(uint64_t a1)
{
  return sub_25C20D630(a1, (uint64_t *)&unk_26A596F10);
}

uint64_t type metadata accessor for _GPUProcess(uint64_t a1)
{
  return sub_25C20D630(a1, (uint64_t *)&unk_26A596F20);
}

void sub_25C20D74C(void *a1@<X0>, void *a2@<X8>)
{
  long long v3 = v2;
  uint64_t v5 = v2[4];
  uint64_t v6 = v2[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A597090);
  unint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_25C223310;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v8 = (void *)sub_25C2219D8();
  swift_bridgeObjectRelease();
  uint64_t v9 = (void *)sub_25C2219D8();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(self, sel_attributeWithDomain_name_, v8, v9);

  *(void *)(v7 + 32) = v10;
  sub_25C221A38();
  if (v7 >> 62)
  {
    sub_25C20D014(0, &qword_26A597098);
    swift_bridgeObjectRetain();
    sub_25C221C38();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_25C221CD8();
    sub_25C20D014(0, &qword_26A597098);
  }
  swift_bridgeObjectRelease();
  id v11 = sub_25C20DADC(a1, v5, v6);
  swift_bridgeObjectRelease();
  if (!v17)
  {
    uint64_t v12 = v3[8];
    uint64_t v13 = v3[9];
    uint64_t v15 = v3[6];
    uint64_t v14 = v3[7];
    sub_25C20D94C(v12);
    sub_25C20D94C(v15);
    sub_25C20D95C(v11, v12, v13, v15, v14, a2);
  }
}

uint64_t sub_25C20D94C(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

void sub_25C20D95C(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  if (a2 | a4)
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = a2;
    *(void *)(v13 + 24) = a3;
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = a4;
    *(void *)(v14 + 24) = a5;
    id v15 = objc_allocWithZone((Class)type metadata accessor for _Capability.AssertionObserver());
    id v16 = a1;
    sub_25C20D94C(a4);
    sub_25C20D94C(a2);
    id v8 = sub_25C20DE7C((uint64_t)sub_25C20C4A0, v13, (uint64_t)sub_25C20C4A0, v14);
    swift_release();
    swift_release();
    id v17 = v8;
    objc_msgSend(v16, sel_addObserver_, v17);
    sub_25C20D3F0(a4);
    sub_25C20D3F0(a2);
  }
  else
  {
    id v7 = a1;
    id v8 = 0;
  }
  *a6 = a1;
  a6[1] = v8;
}

id sub_25C20DADC(void *a1, uint64_t a2, uint64_t a3)
{
  void v22[2] = *(id *)MEMORY[0x263EF8340];
  sub_25C221BE8();
  swift_bridgeObjectRelease();
  v22[0] = (id)0xD00000000000002ELL;
  v22[1] = (id)0x800000025C224050;
  uint64_t v6 = a1[3];
  uint64_t v5 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v6);
  id v7 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v7(v6, v5);
  sub_25C221C98();
  sub_25C221A08();
  swift_bridgeObjectRelease();
  if (a3)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = ((uint64_t (*)(uint64_t, uint64_t))v7)(v6, v5);
    uint64_t v9 = (void *)sub_25C2219D8();
    swift_bridgeObjectRelease();
    id v10 = objc_msgSend(self, sel_targetWithPid_environmentIdentifier_, v8, v9);

    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    __break(1u);
  }
  uint64_t v21 = ((uint64_t (*)(uint64_t, uint64_t))v7)(v6, v5);
  id v10 = objc_msgSend(self, sel_targetWithPid_, v21);
  if (!v10) {
    goto LABEL_8;
  }
LABEL_3:
  id v11 = objc_allocWithZone(MEMORY[0x263F64408]);
  id v12 = v10;
  swift_bridgeObjectRetain();
  uint64_t v13 = (void *)sub_25C2219D8();
  swift_bridgeObjectRelease();
  sub_25C20D014(0, &qword_26A597098);
  uint64_t v14 = (void *)sub_25C221A28();
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(v11, sel_initWithExplanation_target_attributes_, v13, v12, v14);

  v22[0] = 0;
  if (objc_msgSend(v15, sel_acquireWithError_, v22))
  {
    id v16 = v22[0];
  }
  else
  {
    id v17 = v22[0];
    id v18 = (void *)sub_25C221678();

    swift_willThrow();
    objc_msgSend(v15, sel_invalidate);
    objc_super v19 = (void *)sub_25C221668();
    sub_25C21BE10(v19);

    swift_willThrow();
  }
  return v15;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t _s17ServiceExtensions15_NetworkProcessV17processIdentifiers5Int32Vvg_0()
{
  *(void *)v7.val = MEMORY[0x261180380]();
  v7.val[2] = v0;
  v7.val[3] = v1;
  v7.val[4] = v2;
  v7.val[5] = v3;
  v7.val[6] = v4;
  v7.val[7] = v5;
  return audit_token_to_pid(&v7);
}

id sub_25C20DE7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (uint64_t *)&v4[OBJC_IVAR____TtCO17ServiceExtensions11_CapabilityP33_3A110C98667FE5E79B17C7ACF7B087C017AssertionObserver__willInvalidate];
  *uint64_t v9 = 0;
  v9[1] = 0;
  id v10 = (uint64_t *)&v4[OBJC_IVAR____TtCO17ServiceExtensions11_CapabilityP33_3A110C98667FE5E79B17C7ACF7B087C017AssertionObserver__didInvalidate];
  *id v10 = 0;
  v10[1] = 0;
  uint64_t v11 = OBJC_IVAR____TtCO17ServiceExtensions11_CapabilityP33_3A110C98667FE5E79B17C7ACF7B087C017AssertionObserver_invalidationLock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A596F88);
  uint64_t v12 = swift_allocObject();
  *(_DWORD *)(v12 + 16) = 0;
  *(void *)&v4[v11] = v12;
  uint64_t v13 = *v9;
  *uint64_t v9 = a1;
  v9[1] = a2;
  uint64_t v14 = v4;
  swift_retain();
  sub_25C20D3F0(v13);
  uint64_t v15 = *v10;
  *id v10 = a3;
  v10[1] = a4;
  swift_retain();
  sub_25C20D3F0(v15);

  v17.receiver = v14;
  v17.super_class = (Class)type metadata accessor for _Capability.AssertionObserver();
  return objc_msgSendSuper2(&v17, sel_init);
}

uint64_t type metadata accessor for _Capability.AssertionObserver()
{
  return self;
}

uint64_t sub_25C20DF9C@<X0>(uint64_t *a1@<X8>)
{
  return sub_25C20D49C(&OBJC_IVAR____SEContentProcess_inner, type metadata accessor for _ContentProcess, (uint64_t)&protocol witness table for _ContentProcess, type metadata accessor for _ContentProcess, a1);
}

uint64_t sub_25C20DFD8()
{
  uint64_t v0 = sub_25C221868();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  unsigned int v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C221858();
  uint64_t v4 = _s17ServiceExtensions15_BrowserProcessV17processIdentifiers5Int32Vvg_0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

uint64_t sub_25C20E0A4@<X0>(uint64_t *a1@<X8>)
{
  return sub_25C20D49C(&OBJC_IVAR____SENetworkProcess_inner, type metadata accessor for _NetworkProcess, (uint64_t)&protocol witness table for _NetworkProcess, type metadata accessor for _NetworkProcess, a1);
}

uint64_t sub_25C20E0E0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  sub_25C20D474(a1, (uint64_t)v4);
  return sub_25C2195B0((uint64_t)v4, type metadata accessor for _NetworkProcess, (uint64_t)&protocol witness table for _NetworkProcess, type metadata accessor for _NetworkProcess, a2);
}

uint64_t sub_25C20E154@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_25C2217E8();
  unsigned int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a2, a1, v4);
}

uint64_t sub_25C20E1C0(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(sub_25C2217E8() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return a1(v3);
}

uint64_t sub_25C20E244@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  sub_25C20D474(a1, (uint64_t)v4);
  return sub_25C2195B0((uint64_t)v4, type metadata accessor for _ContentProcess, (uint64_t)&protocol witness table for _ContentProcess, type metadata accessor for _ContentProcess, a2);
}

uint64_t sub_25C20E2B8()
{
  return sub_25C20E1C0((uint64_t (*)(uint64_t))sub_25C20E2D0);
}

uint64_t sub_25C20E2D4@<X0>(uint64_t *a1@<X8>)
{
  return sub_25C20D49C(&OBJC_IVAR____SEGPUProcess_inner, type metadata accessor for _GPUProcess, (uint64_t)&protocol witness table for _GPUProcess, type metadata accessor for _GPUProcess, a1);
}

uint64_t sub_25C20E310@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  sub_25C20D474(a1, (uint64_t)v4);
  return sub_25C2195B0((uint64_t)v4, type metadata accessor for _GPUProcess, (uint64_t)&protocol witness table for _GPUProcess, type metadata accessor for _GPUProcess, a2);
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

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

void sub_25C20E474(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

uint64_t sub_25C20E4D0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A596F88);
  uint64_t result = swift_allocObject();
  *(_DWORD *)(result + 16) = 0;
  qword_26A596FC0 = result;
  return result;
}

uint64_t sub_25C20E508()
{
  sub_25C20D3F0(*(void *)(v0 + 16));
  swift_release();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t sub_25C20E548()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 24) + 16))();
}

uint64_t sub_25C20E5F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25C209B28(a1, a2, a3, type metadata accessor for _NetworkProcess);
}

uint64_t type metadata accessor for _SENetworkProcess(uint64_t a1)
{
  return sub_25C20D630(a1, (uint64_t *)&unk_26A596F68);
}

uint64_t sub_25C20E664(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25C209B28(a1, a2, a3, type metadata accessor for _ContentProcess);
}

uint64_t getEnumTagSinglePayload for _ServiceManager.ServiceExtensionsErrorCodes(unsigned int *a1, int a2)
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

ValueMetadata *type metadata accessor for _LockdownVersion()
{
  return &type metadata for _LockdownVersion;
}

uint64_t sub_25C20E6E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25C209B28(a1, a2, a3, type metadata accessor for _GPUProcess);
}

uint64_t type metadata accessor for _SEGPUProcess(uint64_t a1)
{
  return sub_25C20D630(a1, (uint64_t *)&unk_26A596F58);
}

void destroy for _Capability(uint64_t a1)
{
}

uint64_t sub_25C20E75C(uint64_t result, char a2)
{
  *(unsigned char *)(result + 80) = a2;
  return result;
}

ValueMetadata *type metadata accessor for _Capability()
{
  return &type metadata for _Capability;
}

ValueMetadata *type metadata accessor for _Capability.Grant()
{
  return &type metadata for _Capability.Grant;
}

uint64_t sub_25C20E784()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 24) + 16))();
}

uint64_t type metadata accessor for _ServiceManager()
{
  return self;
}

uint64_t sub_25C20E814()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 232) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 56);
  if (v0) {
    uint64_t v4 = sub_25C2164C4;
  }
  else {
    uint64_t v4 = sub_25C20B20C;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_25C20E940()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 232) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 56);
  if (v0) {
    uint64_t v4 = sub_25C214A94;
  }
  else {
    uint64_t v4 = sub_25C209FE8;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t NetworkingServiceExtension._request(capabilities:)@<X0>(long long *a1@<X0>, void *a2@<X8>)
{
  return sub_25C20AA20(a1, a2);
}

uint64_t sub_25C20EA84()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 24) + 16))();
}

uint64_t sub_25C20EAF0()
{
  sub_25C221BE8();
  swift_bridgeObjectRelease();
  return sandbox_enable_local_state_flag();
}

uint64_t GPUServiceExtension._lockdown(version:)()
{
  sub_25C221BE8();
  swift_bridgeObjectRelease();
  return sandbox_enable_local_state_flag();
}

uint64_t sub_25C20EBA0()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t dispatch thunk of GPUServiceExtension.handle(xpcConnection:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of GPUServiceExtension._lockdown(version:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t initializeBufferWithCopyOfBuffer for _Capability(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_4(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_25C20EC90(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25C20ECB0(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for audit_token_t(uint64_t a1)
{
}

BOOL sub_25C20ECF0(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void type metadata accessor for CFBoolean(uint64_t a1)
{
}

uint64_t NetworkingServiceExtension._backgroundTransferManager.getter()
{
  if (qword_26A596CE0 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t BackgroundTransferManager.Download.init(sourceURL:destinationURL:title:type:description:sourceDescription:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v63 = a8;
  uint64_t v64 = a5;
  uint64_t v60 = a6;
  uint64_t v61 = a7;
  uint64_t v56 = a3;
  uint64_t v65 = a2;
  uint64_t v62 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A596DE0);
  uint64_t v12 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v55 = (char *)v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v53 - v14;
  uint64_t v58 = sub_25C2218B8();
  uint64_t v16 = *(void *)(v58 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v58);
  v53[1] = (char *)v53 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  v54 = (char *)v53 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)v53 - v21;
  uint64_t v23 = sub_25C2216C8();
  uint64_t v24 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  v26 = (char *)v53 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C2216E8();
  v27 = (int *)type metadata accessor for BackgroundTransferManager.Download(0);
  uint64_t v28 = v27[11];
  *(void *)(a9 + v28) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08AB8]), sel_init);
  uint64_t v59 = v23;
  uint64_t v57 = v24;
  if (a4)
  {
    uint64_t v29 = v58;
    uint64_t v30 = v56;
  }
  else
  {
    sub_25C2216B8();
    uint64_t v30 = sub_25C2216A8();
    a4 = v31;
    (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
    uint64_t v29 = v58;
  }
  uint64_t v58 = a10;
  v32 = (uint64_t *)(a9 + v27[5]);
  uint64_t *v32 = v30;
  v32[1] = a4;
  uint64_t v33 = v64;
  sub_25C20F754(v64, (uint64_t)v15);
  v34 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  if (v34(v15, 1, v29) == 1)
  {
    sub_25C2140D4((uint64_t)v15, (uint64_t *)&unk_26A596DE0);
    sub_25C221698();
    sub_25C2218A8();
    v35 = v55;
    sub_25C221898();
    int v36 = v34(v35, 1, v29);
    uint64_t v37 = (uint64_t)v35;
    v38 = v54;
    uint64_t v39 = v57;
    if (v36 == 1)
    {
      sub_25C2218A8();
      sub_25C2140D4(v64, (uint64_t *)&unk_26A596DE0);
      sub_25C2140D4(v37, (uint64_t *)&unk_26A596DE0);
      (*(void (**)(uint64_t, char *, uint64_t))(v16 + 32))(a9 + v27[6], v38, v29);
    }
    else
    {
      sub_25C2140D4(v64, (uint64_t *)&unk_26A596DE0);
      v48 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 32);
      v48(v38, v37, v29);
      v48((char *)(a9 + v27[6]), (uint64_t)v38, v29);
    }
    uint64_t v42 = v62;
    uint64_t v43 = v63;
    uint64_t v45 = v60;
    uint64_t v44 = v61;
    uint64_t v47 = v58;
    uint64_t v46 = v59;
    uint64_t v41 = v65;
  }
  else
  {
    sub_25C2140D4(v33, (uint64_t *)&unk_26A596DE0);
    v40 = *(void (**)(char *, char *, uint64_t))(v16 + 32);
    v40(v22, v15, v29);
    v40((char *)(a9 + v27[6]), v22, v29);
    uint64_t v41 = v65;
    uint64_t v42 = v62;
    uint64_t v43 = v63;
    uint64_t v45 = v60;
    uint64_t v44 = v61;
    uint64_t v47 = v58;
    uint64_t v46 = v59;
    uint64_t v39 = v57;
  }
  v49 = (void *)(a9 + v27[7]);
  void *v49 = v45;
  v49[1] = v44;
  v50 = *(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 32);
  v50(a9 + v27[8], v42, v46);
  v51 = (void *)(a9 + v27[9]);
  void *v51 = v43;
  v51[1] = v47;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v50)(a9 + v27[10], v41, v46);
}

uint64_t BackgroundTransferManager.Download.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_25C2216F8();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t BackgroundTransferManager.Download.title.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for BackgroundTransferManager.Download(0) + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t BackgroundTransferManager.Download.type.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for BackgroundTransferManager.Download(0) + 24);
  uint64_t v4 = sub_25C2218B8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t BackgroundTransferManager.Download.description.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for BackgroundTransferManager.Download(0) + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t BackgroundTransferManager.Download.sourceURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for BackgroundTransferManager.Download(0) + 32);
  uint64_t v4 = sub_25C2216C8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t BackgroundTransferManager.Download.sourceDescription.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for BackgroundTransferManager.Download(0) + 36));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t BackgroundTransferManager.Download.destinationURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for BackgroundTransferManager.Download(0) + 40);
  uint64_t v4 = sub_25C2216C8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t BackgroundTransferManager.Download.destinationURL.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for BackgroundTransferManager.Download(0) + 40);
  uint64_t v4 = sub_25C2216C8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);
  return v5(v3, a1, v4);
}

uint64_t (*BackgroundTransferManager.Download.destinationURL.modify())()
{
  return nullsub_1;
}

id BackgroundTransferManager.Download.progress.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for BackgroundTransferManager.Download(0) + 44));
  return v1;
}

uint64_t sub_25C20F594@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 32);
  uint64_t v5 = sub_25C2216C8();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_25C20F604@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 40);
  uint64_t v5 = sub_25C2216C8();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

id sub_25C20F674(uint64_t a1)
{
  return *(id *)(v1 + *(int *)(a1 + 44));
}

uint64_t sub_25C20F680@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_25C2216F8();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t sub_25C20F6EC()
{
  type metadata accessor for BackgroundTransferManager();
  uint64_t v0 = swift_allocObject();
  uint64_t result = swift_defaultActor_initialize();
  *(void *)(v0 + 112) = MEMORY[0x263F8EE80];
  qword_26A597268 = v0;
  return result;
}

uint64_t type metadata accessor for BackgroundTransferManager.Download(uint64_t a1)
{
  return sub_25C20D630(a1, (uint64_t *)&unk_26A596E10);
}

uint64_t sub_25C20F754(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A596DE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C20F7BC(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_25C20F7DC, v1, 0);
}

uint64_t sub_25C20F7DC()
{
  sub_25C20FE84(*(void *)(v0 + 16));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25C20F83C()
{
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A596DF0);
  uint64_t v1 = MEMORY[0x270FA5388](v61);
  uint64_t v60 = (char *)&v51 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v59 = (uint64_t)&v51 - v4;
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v58 = (char *)&v51 - v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v57 = (char *)&v51 - v7;
  uint64_t result = swift_beginAccess();
  uint64_t v9 = *(void *)(v0 + 112);
  int64_t v10 = *(void *)(v9 + 16);
  uint64_t v11 = MEMORY[0x263F8EE78];
  if (v10)
  {
    *(void *)&v66[0] = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_25C210CC4(0, v10, 0);
    uint64_t result = sub_25C212284(v9);
    uint64_t v13 = result;
    uint64_t v14 = 0;
    uint64_t v15 = v9 + 64;
    char v16 = *(unsigned char *)(v9 + 32);
    uint64_t v52 = v9 + 88;
    uint64_t v56 = v9;
    int64_t v53 = v10;
    uint64_t v54 = v12;
    uint64_t v55 = v9 + 64;
    while (1)
    {
      if (v13 < 0 || v13 >= 1 << v16) {
        goto LABEL_41;
      }
      if ((*(void *)(v15 + 8 * ((unint64_t)v13 >> 6)) & (1 << v13)) == 0) {
        goto LABEL_42;
      }
      if (*(_DWORD *)(v9 + 36) != v12) {
        goto LABEL_43;
      }
      uint64_t v63 = 1 << v13;
      unint64_t v64 = (unint64_t)v13 >> 6;
      uint64_t v62 = v14;
      uint64_t v19 = v61;
      uint64_t v20 = (uint64_t)v57;
      uint64_t v21 = (uint64_t)&v57[*(int *)(v61 + 48)];
      uint64_t v22 = *(void *)(v9 + 48);
      uint64_t v23 = sub_25C2216F8();
      uint64_t v65 = *(void *)(v23 - 8);
      uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v65 + 16);
      v24(v20, v22 + *(void *)(v65 + 72) * v13, v23);
      uint64_t v25 = *(void *)(v9 + 56);
      v26 = (int *)(type metadata accessor for BackgroundTransferManager._Transfer(0) - 8);
      sub_25C213F34(v25 + *(void *)(*(void *)v26 + 72) * v13, v21, type metadata accessor for BackgroundTransferManager._Transfer);
      uint64_t v27 = (uint64_t)v58;
      v24((uint64_t)v58, v20, v23);
      sub_25C213F34(v21, v27 + *(int *)(v19 + 48), type metadata accessor for BackgroundTransferManager._Transfer);
      uint64_t v28 = v59;
      sub_25C21232C(v27, v59);
      sub_25C2140D4(v20, &qword_26A596DF0);
      uint64_t v29 = *(int *)(v19 + 48);
      uint64_t v30 = v60;
      uint64_t v31 = (uint64_t)&v60[v29];
      uint64_t v32 = v28 + v29;
      v24((uint64_t)v60, v28, v23);
      sub_25C213F34(v32, v31, type metadata accessor for BackgroundTransferManager._Transfer);
      sub_25C212394(v31 + v26[7], (uint64_t)&v68);
      sub_25C2123F8(v31);
      (*(void (**)(char *, uint64_t))(v65 + 8))(v30, v23);
      sub_25C2140D4(v28, &qword_26A596DF0);
      uint64_t v33 = *(void *)&v66[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25C210CC4(0, *(void *)(v33 + 16) + 1, 1);
        uint64_t v33 = *(void *)&v66[0];
      }
      uint64_t v9 = v56;
      unint64_t v35 = *(void *)(v33 + 16);
      unint64_t v34 = *(void *)(v33 + 24);
      if (v35 >= v34 >> 1)
      {
        sub_25C210CC4(v34 > 1, v35 + 1, 1);
        uint64_t v33 = *(void *)&v66[0];
      }
      *(void *)(v33 + 16) = v35 + 1;
      uint64_t result = sub_25C212454(&v68, v33 + 40 * v35 + 32);
      char v16 = *(unsigned char *)(v9 + 32);
      unint64_t v17 = 1 << v16;
      if (v13 >= 1 << v16) {
        goto LABEL_44;
      }
      uint64_t v15 = v55;
      unint64_t v36 = v64;
      uint64_t v37 = *(void *)(v55 + 8 * v64);
      if ((v37 & v63) == 0) {
        goto LABEL_45;
      }
      LODWORD(v12) = v54;
      if (*(_DWORD *)(v9 + 36) != v54) {
        goto LABEL_46;
      }
      unint64_t v38 = v37 & (-2 << (v13 & 0x3F));
      if (v38) {
        break;
      }
      unint64_t v39 = v64 + 1;
      unint64_t v40 = (v17 + 63) >> 6;
      if (v64 + 1 >= v40) {
        goto LABEL_4;
      }
      unint64_t v41 = *(void *)(v55 + 8 * v39);
      int64_t v18 = v53;
      if (!v41)
      {
        unint64_t v39 = v64 + 2;
        if (v64 + 2 >= v40) {
          goto LABEL_5;
        }
        unint64_t v41 = *(void *)(v55 + 8 * v39);
        if (!v41)
        {
          while (v40 - 3 != v36)
          {
            unint64_t v41 = *(void *)(v52 + 8 * v36++);
            if (v41)
            {
              unint64_t v39 = v36 + 2;
              goto LABEL_20;
            }
          }
          goto LABEL_5;
        }
      }
LABEL_20:
      unint64_t v17 = __clz(__rbit64(v41)) + (v39 << 6);
LABEL_5:
      uint64_t v14 = v62 + 1;
      uint64_t v13 = v17;
      if (v62 + 1 == v18)
      {
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v11 = MEMORY[0x263F8EE78];
        goto LABEL_28;
      }
    }
    unint64_t v17 = __clz(__rbit64(v38)) | v13 & 0xFFFFFFFFFFFFFFC0;
LABEL_4:
    int64_t v18 = v53;
    goto LABEL_5;
  }
  uint64_t v33 = MEMORY[0x263F8EE78];
LABEL_28:
  uint64_t v67 = v11;
  uint64_t v42 = *(void *)(v33 + 16);
  if (v42)
  {
    unint64_t v43 = 0;
    uint64_t v44 = v33 + 32;
    while (v43 < *(void *)(v33 + 16))
    {
      sub_25C212394(v44, (uint64_t)&v68);
      uint64_t v45 = v69;
      uint64_t v46 = v70;
      __swift_project_boxed_opaque_existential_1(&v68, v69);
      uint64_t v47 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v46 + 40))(v45, v46);
      LOBYTE(v45) = objc_msgSend(v47, sel_isFinished);

      if (v45)
      {
        uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v68);
      }
      else
      {
        sub_25C212454(&v68, (uint64_t)v66);
        uint64_t v48 = v67;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_25C210CC4(0, *(void *)(v48 + 16) + 1, 1);
          uint64_t v48 = v67;
        }
        unint64_t v50 = *(void *)(v48 + 16);
        unint64_t v49 = *(void *)(v48 + 24);
        if (v50 >= v49 >> 1)
        {
          sub_25C210CC4(v49 > 1, v50 + 1, 1);
          uint64_t v48 = v67;
        }
        *(void *)(v48 + 16) = v50 + 1;
        uint64_t result = sub_25C212454(v66, v48 + 40 * v50 + 32);
      }
      ++v43;
      v44 += 40;
      if (v42 == v43) {
        goto LABEL_39;
      }
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
LABEL_46:
    __break(1u);
  }
  else
  {
LABEL_39:
    swift_bridgeObjectRelease();
    return v67;
  }
  return result;
}

uint64_t sub_25C20FE84(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A596E40);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v48 = (uint64_t)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_25C2216F8();
  uint64_t v45 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388](v47);
  uint64_t v44 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = type metadata accessor for BackgroundTransferManager._Transfer(0);
  uint64_t v46 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  unint64_t v41 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = type metadata accessor for BackgroundTransferManager.Download(0);
  uint64_t v6 = *(void *)(v39 - 8);
  uint64_t v7 = (char *)&v35 - ((*(void *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void **)(a1 + *(int *)(MEMORY[0x270FA5388](v39) + 44));
  uint64_t v37 = a1;
  uint64_t v50 = (uint64_t)v8;
  swift_getKeyPath();
  id v9 = v8;
  uint64_t v40 = sub_25C221688();
  swift_release();
  uint64_t v50 = (uint64_t)v9;
  id v42 = v9;
  swift_getKeyPath();
  unint64_t v36 = type metadata accessor for BackgroundTransferManager.Download;
  sub_25C213F34(a1, (uint64_t)v7, type metadata accessor for BackgroundTransferManager.Download);
  unint64_t v10 = (*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = v49;
  *(void *)(v11 + 16) = v49;
  sub_25C214130((uint64_t)v7, v11 + v10, type metadata accessor for BackgroundTransferManager.Download);
  swift_retain();
  uint64_t v38 = sub_25C221688();
  swift_release();
  swift_release();
  uint64_t v50 = (uint64_t)v9;
  swift_getKeyPath();
  swift_unownedRetainStrong();
  swift_unownedRetain();
  uint64_t v13 = v12;
  swift_release();
  uint64_t v15 = v36;
  uint64_t v14 = v37;
  sub_25C213F34(v37, (uint64_t)v7, v36);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v13;
  sub_25C214130((uint64_t)v7, v16 + v10, type metadata accessor for BackgroundTransferManager.Download);
  unint64_t v17 = (void *)sub_25C221688();
  id v35 = v17;
  swift_release();
  swift_release();
  uint64_t v18 = v43;
  uint64_t v19 = (uint64_t)v41;
  uint64_t v20 = (uint64_t *)&v41[*(int *)(v43 + 20)];
  v20[3] = v39;
  v20[4] = sub_25C21250C(&qword_26A596E48, (void (*)(uint64_t))type metadata accessor for BackgroundTransferManager.Download);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v20);
  sub_25C213F34(v14, (uint64_t)boxed_opaque_existential_1, v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A597090);
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_25C2229F0;
  uint64_t v23 = (void *)v40;
  uint64_t v24 = (void *)v38;
  *(void *)(v22 + 32) = v40;
  *(void *)(v22 + 40) = v24;
  *(void *)(v22 + 48) = v17;
  uint64_t v50 = v22;
  sub_25C221A38();
  uint64_t v25 = v50;
  v26 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v45 + 16);
  uint64_t v27 = boxed_opaque_existential_1;
  uint64_t v28 = v47;
  v26(v19, v27, v47);
  *(void *)(v19 + *(int *)(v18 + 24)) = v25;
  uint64_t v29 = (uint64_t)v44;
  v26((uint64_t)v44, (uint64_t *)v19, v28);
  uint64_t v30 = v48;
  sub_25C213F34(v19, v48, type metadata accessor for BackgroundTransferManager._Transfer);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v46 + 56))(v30, 0, 1, v18);
  swift_beginAccess();
  id v31 = v23;
  id v32 = v24;
  id v33 = v35;
  sub_25C210A2C(v30, v29);
  swift_endAccess();

  return sub_25C2123F8(v19);
}

uint64_t sub_25C210424(void **a1)
{
  uint64_t v1 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A596E70);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_25C222A00;
  sub_25C221A08();
  objc_msgSend(v1, sel_fractionCompleted);
  sub_25C221A78();
  *(void *)(v2 + 56) = MEMORY[0x263F8D310];
  *(void *)(v2 + 32) = 0;
  *(void *)(v2 + 40) = 0xE000000000000000;
  sub_25C221D48();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C210504(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[6] = a5;
  v6[7] = a6;
  void v6[5] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A596E40);
  v6[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C21059C, 0, 0);
}

uint64_t sub_25C21059C()
{
  uint64_t v2 = *(void **)(v0 + 40);
  uint64_t v1 = *(void *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A596E70);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_25C222A00;
  objc_msgSend(v2, sel_isFinished);
  sub_25C221A08();
  swift_bridgeObjectRelease();
  *(void *)(v3 + 56) = MEMORY[0x263F8D310];
  *(void *)(v3 + 32) = 0x64656873696E6946;
  *(void *)(v3 + 40) = 0xEB0000000020203ALL;
  sub_25C221D48();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_25C2106D8, v1, 0);
}

uint64_t sub_25C2106D8()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[8];
  swift_beginAccess();
  sub_25C210E88(v1, v2);
  sub_25C2140D4(v2, &qword_26A596E40);
  swift_endAccess();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_25C21078C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[6] = a5;
  v6[7] = a6;
  void v6[5] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A596E40);
  v6[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C210824, 0, 0);
}

uint64_t sub_25C210824()
{
  uint64_t v2 = *(void **)(v0 + 40);
  uint64_t v1 = *(void *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A596E70);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_25C222A00;
  objc_msgSend(v2, sel_isCancelled);
  sub_25C221A08();
  swift_bridgeObjectRelease();
  *(void *)(v3 + 56) = MEMORY[0x263F8D310];
  *(void *)(v3 + 32) = 0x64656C65636E6143;
  *(void *)(v3 + 40) = 0xEB0000000020203ALL;
  sub_25C221D48();
  swift_bridgeObjectRelease();
  swift_unownedRetainStrong();
  return MEMORY[0x270FA2498](sub_25C210968, v1, 0);
}

uint64_t sub_25C210968()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[8];
  swift_beginAccess();
  sub_25C210E88(v1, v2);
  sub_25C2140D4(v2, &qword_26A596E40);
  swift_endAccess();
  swift_release();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_25C210A2C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A596E40);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for BackgroundTransferManager._Transfer(0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v12 + 48))(a1, 1) == 1)
  {
    sub_25C2140D4(a1, &qword_26A596E40);
    sub_25C210E88(a2, (uint64_t)v8);
    uint64_t v13 = sub_25C2216F8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a2, v13);
    return sub_25C2140D4((uint64_t)v8, &qword_26A596E40);
  }
  else
  {
    sub_25C214130(a1, (uint64_t)v11, type metadata accessor for BackgroundTransferManager._Transfer);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_25C2118B4((uint64_t)v11, a2, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v18;
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_25C2216F8();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a2, v16);
  }
}

uint64_t BackgroundTransferManager.deinit()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t BackgroundTransferManager.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t BackgroundTransferManager.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_25C210CB8()
{
  return v0;
}

uint64_t sub_25C210CC4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25C210CE4(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_25C210CE4(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A596E30);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A596E38);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_25C221C78();
  __break(1u);
  return result;
}

uint64_t sub_25C210E88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_25C21F4C4(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v21 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_25C211B8C();
      uint64_t v9 = v21;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = sub_25C2216F8();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v6, v11);
    uint64_t v12 = *(void *)(v9 + 56);
    uint64_t v13 = type metadata accessor for BackgroundTransferManager._Transfer(0);
    uint64_t v20 = *(void *)(v13 - 8);
    sub_25C214130(v12 + *(void *)(v20 + 72) * v6, a2, type metadata accessor for BackgroundTransferManager._Transfer);
    sub_25C21156C(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a2;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = type metadata accessor for BackgroundTransferManager._Transfer(0);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a2;
    uint64_t v16 = 1;
  }
  return v14(v15, v16, 1, v17);
}

uint64_t sub_25C211054(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for BackgroundTransferManager._Transfer(0);
  uint64_t v49 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v54 = (uint64_t)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25C2216F8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v51 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A596E50);
  int v50 = a2;
  uint64_t v11 = v10;
  uint64_t v12 = sub_25C221C58();
  uint64_t v13 = v12;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v14 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v15 = *(void *)(v11 + 64);
  uint64_t v46 = (void *)(v11 + 64);
  if (v14 < 64) {
    uint64_t v16 = ~(-1 << v14);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & v15;
  uint64_t v44 = v2;
  int64_t v45 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v47 = (void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  uint64_t v52 = (void (**)(char *, unint64_t, uint64_t))(v8 + 32);
  uint64_t v53 = v7;
  uint64_t v18 = v12 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  uint64_t v48 = v11;
  uint64_t v21 = v51;
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
    v26 = v46;
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
    uint64_t v21 = v51;
LABEL_22:
    uint64_t v29 = v8;
    uint64_t v30 = *(void *)(v8 + 72);
    unint64_t v31 = *(void *)(v11 + 48) + v30 * v24;
    if (v50)
    {
      (*v52)(v21, v31, v53);
      uint64_t v32 = *(void *)(v11 + 56);
      uint64_t v33 = *(void *)(v49 + 72);
      sub_25C214130(v32 + v33 * v24, v54, type metadata accessor for BackgroundTransferManager._Transfer);
    }
    else
    {
      (*v47)(v21, v31, v53);
      uint64_t v34 = *(void *)(v11 + 56);
      uint64_t v33 = *(void *)(v49 + 72);
      sub_25C213F34(v34 + v33 * v24, v54, type metadata accessor for BackgroundTransferManager._Transfer);
    }
    sub_25C21250C(&qword_26A596E00, MEMORY[0x263F07508]);
    uint64_t result = sub_25C2219B8();
    uint64_t v35 = -1 << *(unsigned char *)(v13 + 32);
    unint64_t v36 = result & ~v35;
    unint64_t v37 = v36 >> 6;
    if (((-1 << v36) & ~*(void *)(v18 + 8 * (v36 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v36) & ~*(void *)(v18 + 8 * (v36 >> 6)))) | v36 & 0x7FFFFFFFFFFFFFC0;
      uint64_t v21 = v51;
    }
    else
    {
      char v38 = 0;
      unint64_t v39 = (unint64_t)(63 - v35) >> 6;
      uint64_t v21 = v51;
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
    (*v52)((char *)(*(void *)(v13 + 48) + v22 * v30), (unint64_t)v21, v53);
    uint64_t result = sub_25C214130(v54, *(void *)(v13 + 56) + v22 * v33, type metadata accessor for BackgroundTransferManager._Transfer);
    ++*(void *)(v13 + 16);
    uint64_t v11 = v48;
    uint64_t v8 = v29;
  }
  swift_release();
  uint64_t v3 = v44;
  v26 = v46;
  if ((v50 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v42 = 1 << *(unsigned char *)(v11 + 32);
  if (v42 >= 64) {
    bzero(v26, ((unint64_t)(v42 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v26 = -1 << v42;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v13;
  return result;
}

unint64_t sub_25C21156C(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C2216F8();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a2 + 64;
  uint64_t v10 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v11 = (a1 + 1) & ~v10;
  if (((1 << v11) & *(void *)(a2 + 64 + 8 * (v11 >> 6))) != 0)
  {
    uint64_t v12 = ~v10;
    unint64_t result = sub_25C221B28();
    if ((*(void *)(v9 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
    {
      unint64_t v39 = (result + 1) & v12;
      uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v13 = v5 + 16;
      uint64_t v15 = *(void *)(v13 + 56);
      uint64_t v40 = v13;
      unint64_t v37 = (uint64_t (**)(char *, uint64_t))(v13 - 8);
      char v38 = v14;
      uint64_t v36 = v12;
      do
      {
        uint64_t v16 = v9;
        uint64_t v17 = v15;
        int64_t v18 = v11 * v15;
        v38(v8, *(void *)(a2 + 48) + v11 * v15, v4);
        sub_25C21250C(&qword_26A596E00, MEMORY[0x263F07508]);
        uint64_t v19 = sub_25C2219B8();
        unint64_t result = (*v37)(v8, v4);
        unint64_t v20 = v19 & v12;
        if (a1 >= (uint64_t)v39)
        {
          if (v20 >= v39 && a1 >= (uint64_t)v20)
          {
LABEL_16:
            if (a1 * v17 < v18
              || *(void *)(a2 + 48) + a1 * v17 >= (unint64_t)(*(void *)(a2 + 48) + v18 + v17))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a1 * v17 != v18)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v23 = *(void *)(a2 + 56);
            uint64_t v24 = *(void *)(*(void *)(type metadata accessor for BackgroundTransferManager._Transfer(0) - 8) + 72);
            int64_t v25 = v24 * a1;
            unint64_t result = v23 + v24 * a1;
            int64_t v26 = v24 * v11;
            unint64_t v27 = v23 + v24 * v11 + v24;
            BOOL v28 = v25 < v26 || result >= v27;
            uint64_t v9 = v16;
            if (v28)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
              a1 = v11;
              uint64_t v12 = v36;
            }
            else
            {
              a1 = v11;
              uint64_t v12 = v36;
              if (v25 != v26)
              {
                unint64_t result = swift_arrayInitWithTakeBackToFront();
                a1 = v11;
              }
            }
            goto LABEL_5;
          }
        }
        else if (v20 >= v39 || a1 >= (uint64_t)v20)
        {
          goto LABEL_16;
        }
        uint64_t v9 = v16;
LABEL_5:
        unint64_t v11 = (v11 + 1) & v12;
        uint64_t v15 = v17;
      }
      while (((*(void *)(v9 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
    }
    uint64_t v29 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v30 = *v29;
    uint64_t v31 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v29 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v31 = *v29;
    uint64_t v30 = (-1 << a1) - 1;
  }
  *uint64_t v29 = v31 & v30;
  uint64_t v32 = *(void *)(a2 + 16);
  BOOL v33 = __OFSUB__(v32, 1);
  uint64_t v34 = v32 - 1;
  if (v33)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v34;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_25C2118B4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_25C2216F8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_25C21F4C4(a2);
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
  if (v19 < v17 || (a3 & 1) == 0)
  {
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_25C211B8C();
      goto LABEL_7;
    }
    sub_25C211054(v17, a3 & 1);
    unint64_t v24 = sub_25C21F4C4(a2);
    if ((v18 & 1) == (v25 & 1))
    {
      unint64_t v14 = v24;
      unint64_t v20 = *v4;
      if (v18) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_25C211A9C(v14, (uint64_t)v11, a1, v20);
    }
LABEL_15:
    uint64_t result = sub_25C221CF8();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v20 = *v4;
  if ((v18 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v21 = v20[7];
  uint64_t v22 = v21
      + *(void *)(*(void *)(type metadata accessor for BackgroundTransferManager._Transfer(0) - 8) + 72) * v14;
  return sub_25C214198(a1, v22);
}

uint64_t sub_25C211A9C(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_25C2216F8();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t v10 = a4[7];
  uint64_t v11 = type metadata accessor for BackgroundTransferManager._Transfer(0);
  uint64_t result = sub_25C214130(a3, v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1, type metadata accessor for BackgroundTransferManager._Transfer);
  uint64_t v13 = a4[2];
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    a4[2] = v15;
  }
  return result;
}

void *sub_25C211B8C()
{
  uint64_t v1 = type metadata accessor for BackgroundTransferManager._Transfer(0);
  uint64_t v30 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25C2216F8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A596E50);
  char v25 = v0;
  uint64_t v8 = *v0;
  uint64_t v9 = sub_25C221C48();
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)(v8 + 16);
  if (!v11)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    *char v25 = v10;
    return result;
  }
  uint64_t result = (void *)(v9 + 64);
  unint64_t v13 = (unint64_t)((1 << *(unsigned char *)(v10 + 32)) + 63) >> 6;
  if (v10 != v8 || (unint64_t)result >= v8 + 64 + 8 * v13)
  {
    uint64_t result = memmove(result, (const void *)(v8 + 64), 8 * v13);
    uint64_t v11 = *(void *)(v8 + 16);
  }
  int64_t v14 = 0;
  *(void *)(v10 + 16) = v11;
  uint64_t v15 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v16 = -1;
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  unint64_t v17 = v16 & *(void *)(v8 + 64);
  uint64_t v26 = v8 + 64;
  int64_t v27 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v28 = v5 + 32;
  uint64_t v29 = v5 + 16;
  while (1)
  {
    if (v17)
    {
      unint64_t v18 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v19 = v18 | (v14 << 6);
      goto LABEL_9;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v22 >= v27) {
      goto LABEL_23;
    }
    unint64_t v23 = *(void *)(v26 + 8 * v22);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v27) {
        goto LABEL_23;
      }
      unint64_t v23 = *(void *)(v26 + 8 * v14);
      if (!v23) {
        break;
      }
    }
LABEL_22:
    unint64_t v17 = (v23 - 1) & v23;
    unint64_t v19 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_9:
    unint64_t v20 = *(void *)(v5 + 72) * v19;
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v7, *(void *)(v8 + 48) + v20, v4);
    unint64_t v21 = *(void *)(v30 + 72) * v19;
    sub_25C213F34(*(void *)(v8 + 56) + v21, (uint64_t)v3, type metadata accessor for BackgroundTransferManager._Transfer);
    (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(void *)(v10 + 48) + v20, v7, v4);
    uint64_t result = (void *)sub_25C214130((uint64_t)v3, *(void *)(v10 + 56) + v21, type metadata accessor for BackgroundTransferManager._Transfer);
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v27) {
    goto LABEL_23;
  }
  unint64_t v23 = *(void *)(v26 + 8 * v24);
  if (v23)
  {
    int64_t v14 = v24;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v14 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v14 >= v27) {
      goto LABEL_23;
    }
    unint64_t v23 = *(void *)(v26 + 8 * v14);
    ++v24;
    if (v23) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_25C211ECC(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for BackgroundTransferManager.Download(0);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A596E58);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v13 = *a1;
  uint64_t v14 = sub_25C221A68();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v12, 1, 1, v14);
  sub_25C213F34(a4, (uint64_t)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for BackgroundTransferManager.Download);
  unint64_t v15 = (*(unsigned __int8 *)(v8 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = v13;
  v16[5] = a3;
  sub_25C214130((uint64_t)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v16 + v15, type metadata accessor for BackgroundTransferManager.Download);
  id v17 = v13;
  swift_retain();
  sub_25C21461C((uint64_t)v12, (uint64_t)&unk_26A596E80, (uint64_t)v16);
  return swift_release();
}

uint64_t sub_25C2120A8(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for BackgroundTransferManager.Download(0);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A596E58);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v13 = *a1;
  uint64_t v14 = sub_25C221A68();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v12, 1, 1, v14);
  sub_25C213F34(a4, (uint64_t)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for BackgroundTransferManager.Download);
  unint64_t v15 = (*(unsigned __int8 *)(v8 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = v13;
  v16[5] = a3;
  sub_25C214130((uint64_t)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v16 + v15, type metadata accessor for BackgroundTransferManager.Download);
  id v17 = v13;
  swift_unownedRetain();
  sub_25C21461C((uint64_t)v12, (uint64_t)&unk_26A596E68, (uint64_t)v16);
  return swift_release();
}

uint64_t sub_25C212284(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t type metadata accessor for BackgroundTransferManager._Transfer(uint64_t a1)
{
  return sub_25C20D630(a1, (uint64_t *)&unk_26A596E20);
}

uint64_t sub_25C21232C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A596DF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C212394(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25C2123F8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for BackgroundTransferManager._Transfer(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C212454(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_25C21246C(uint64_t a1)
{
  uint64_t result = sub_25C21250C(&qword_26A596DF8, (void (*)(uint64_t))type metadata accessor for BackgroundTransferManager.Download);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_25C2124C4()
{
  return sub_25C21250C(&qword_26A596E00, MEMORY[0x263F07508]);
}

uint64_t sub_25C21250C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t dispatch thunk of BackroundableTransfer.id.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of BackroundableTransfer.sourceURL.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of BackroundableTransfer.destinationURL.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of BackroundableTransfer.progress.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t type metadata accessor for BackgroundTransferManager()
{
  return self;
}

uint64_t method lookup function for BackgroundTransferManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BackgroundTransferManager);
}

uint64_t dispatch thunk of BackgroundTransferManager.register(download:)(uint64_t a1)
{
  unsigned int v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 120) + **(int **)(*(void *)v1 + 120));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25C2126E4;
  return v6(a1);
}

uint64_t sub_25C2126E4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t dispatch thunk of BackgroundTransferManager.transfers.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t *initializeBufferWithCopyOfBuffer for BackgroundTransferManager.Download(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v36 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v36 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25C2216F8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    unint64_t v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *unint64_t v10 = *v11;
    v10[1] = v12;
    unint64_t v13 = (char *)a1 + v9;
    uint64_t v14 = (char *)a2 + v9;
    uint64_t v15 = sub_25C2218B8();
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
    swift_bridgeObjectRetain();
    v16(v13, v14, v15);
    uint64_t v17 = a3[7];
    uint64_t v18 = a3[8];
    uint64_t v19 = (uint64_t *)((char *)a1 + v17);
    unint64_t v20 = (uint64_t *)((char *)a2 + v17);
    uint64_t v21 = v20[1];
    *uint64_t v19 = *v20;
    v19[1] = v21;
    int64_t v22 = (char *)a1 + v18;
    unint64_t v23 = (char *)a2 + v18;
    uint64_t v24 = sub_25C2216C8();
    char v25 = *(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16);
    swift_bridgeObjectRetain();
    v25(v22, v23, v24);
    uint64_t v26 = a3[9];
    uint64_t v27 = a3[10];
    uint64_t v28 = (uint64_t *)((char *)a1 + v26);
    uint64_t v29 = (uint64_t *)((char *)a2 + v26);
    uint64_t v30 = v29[1];
    *uint64_t v28 = *v29;
    v28[1] = v30;
    uint64_t v31 = (char *)a1 + v27;
    uint64_t v32 = (char *)a2 + v27;
    swift_bridgeObjectRetain();
    v25(v31, v32, v24);
    uint64_t v33 = a3[11];
    uint64_t v34 = *(void **)((char *)a2 + v33);
    *(uint64_t *)((char *)a1 + v33) = (uint64_t)v34;
    id v35 = v34;
  }
  return a1;
}

void destroy for BackgroundTransferManager.Download(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_25C2216F8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + a2[6];
  uint64_t v6 = sub_25C2218B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  uint64_t v7 = a1 + a2[8];
  uint64_t v8 = sub_25C2216C8();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  swift_bridgeObjectRelease();
  v9(a1 + a2[10], v8);
  unint64_t v10 = *(void **)(a1 + a2[11]);
}

uint64_t initializeWithCopy for BackgroundTransferManager.Download(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25C2216F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  unint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = a1 + v8;
  uint64_t v13 = a2 + v8;
  uint64_t v14 = sub_25C2218B8();
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
  swift_bridgeObjectRetain();
  v15(v12, v13, v14);
  uint64_t v16 = a3[7];
  uint64_t v17 = a3[8];
  uint64_t v18 = (void *)(a1 + v16);
  uint64_t v19 = (void *)(a2 + v16);
  uint64_t v20 = v19[1];
  *uint64_t v18 = *v19;
  v18[1] = v20;
  uint64_t v21 = a1 + v17;
  uint64_t v22 = a2 + v17;
  uint64_t v23 = sub_25C2216C8();
  uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16);
  swift_bridgeObjectRetain();
  v24(v21, v22, v23);
  uint64_t v25 = a3[9];
  uint64_t v26 = a3[10];
  uint64_t v27 = (void *)(a1 + v25);
  uint64_t v28 = (void *)(a2 + v25);
  uint64_t v29 = v28[1];
  void *v27 = *v28;
  v27[1] = v29;
  uint64_t v30 = a1 + v26;
  uint64_t v31 = a2 + v26;
  swift_bridgeObjectRetain();
  v24(v30, v31, v23);
  uint64_t v32 = a3[11];
  uint64_t v33 = *(void **)(a2 + v32);
  *(void *)(a1 + v32) = v33;
  id v34 = v33;
  return a1;
}

uint64_t assignWithCopy for BackgroundTransferManager.Download(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25C2216F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[6];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_25C2218B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  uint64_t v14 = a3[7];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[8];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = sub_25C2216C8();
  uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 24);
  v21(v18, v19, v20);
  uint64_t v22 = a3[9];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (void *)(a2 + v22);
  *uint64_t v23 = *v24;
  v23[1] = v24[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v21(a1 + a3[10], a2 + a3[10], v20);
  uint64_t v25 = a3[11];
  uint64_t v26 = *(void **)(a2 + v25);
  uint64_t v27 = *(void **)(a1 + v25);
  *(void *)(a1 + v25) = v26;
  id v28 = v26;

  return a1;
}

uint64_t initializeWithTake for BackgroundTransferManager.Download(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25C2216F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25C2218B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_25C2216C8();
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32);
  v15(v12, v13, v14);
  uint64_t v16 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  v15(a1 + v16, a2 + v16, v14);
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  return a1;
}

uint64_t assignWithTake for BackgroundTransferManager.Download(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25C2216F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_25C2218B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  uint64_t v16 = a3[7];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (uint64_t *)(a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  *uint64_t v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = a3[8];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  uint64_t v24 = sub_25C2216C8();
  uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 40);
  v25(v22, v23, v24);
  uint64_t v26 = a3[9];
  uint64_t v27 = (void *)(a1 + v26);
  id v28 = (uint64_t *)(a2 + v26);
  uint64_t v30 = *v28;
  uint64_t v29 = v28[1];
  void *v27 = v30;
  v27[1] = v29;
  swift_bridgeObjectRelease();
  v25(a1 + a3[10], a2 + a3[10], v24);
  uint64_t v31 = a3[11];
  uint64_t v32 = *(void **)(a1 + v31);
  *(void *)(a1 + v31) = *(void *)(a2 + v31);

  return a1;
}

uint64_t getEnumTagSinglePayload for BackgroundTransferManager.Download(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C213198);
}

uint64_t sub_25C213198(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25C2216F8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_9:
    return v9(v10, a2, v8);
  }
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v11 = *(void *)(a1 + a3[5] + 8);
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    return (v11 + 1);
  }
  else
  {
    uint64_t v13 = sub_25C2218B8();
    uint64_t v14 = *(void *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a2)
    {
      uint64_t v8 = v13;
      uint64_t v10 = a1 + a3[6];
      uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
      goto LABEL_9;
    }
    uint64_t v15 = sub_25C2216C8();
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a3[8];
    return v16(v18, a2, v17);
  }
}

uint64_t storeEnumTagSinglePayload for BackgroundTransferManager.Download(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C213330);
}

uint64_t sub_25C213330(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = sub_25C2216F8();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_7:
    return v11(v12, a2, a2, v10);
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[5] + 8) = (a2 - 1);
    return result;
  }
  uint64_t v13 = sub_25C2218B8();
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + a4[6];
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_7;
  }
  uint64_t v15 = sub_25C2216C8();
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v17 = v15;
  uint64_t v18 = a1 + a4[8];
  return v16(v18, a2, a2, v17);
}

uint64_t sub_25C2134B4()
{
  uint64_t result = sub_25C2216F8();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25C2218B8();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_25C2216C8();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

uint64_t *sub_25C2135D8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25C2216F8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    long long v9 = *(_OWORD *)((char *)a2 + v8 + 24);
    *(_OWORD *)((char *)a1 + v8 + 24) = v9;
    (**(void (***)(void))(v9 - 8))();
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_25C2136FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C2216F8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  __swift_destroy_boxed_opaque_existential_1(a1 + *(int *)(a2 + 20));
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C21377C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C2216F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  long long v8 = *(_OWORD *)(a2 + v7 + 24);
  *(_OWORD *)(a1 + v7 + 24) = v8;
  (**(void (***)(void))(v8 - 8))();
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_25C213850(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C2216F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + *(int *)(a3 + 20)), (uint64_t *)(a2 + *(int *)(a3 + 20)));
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    unint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *unint64_t v3 = v12;
      }
      else
      {
        unint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *unint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

uint64_t sub_25C213B1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C2216F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  long long v11 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v11;
  *(void *)(v9 + 32) = *(void *)(v10 + 32);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  return a1;
}

uint64_t sub_25C213BB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C2216F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  __swift_destroy_boxed_opaque_existential_1(a1 + v7);
  long long v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  *(void *)(v8 + 32) = *(void *)(v9 + 32);
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25C213C60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C213C74);
}

uint64_t sub_25C213C74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C2216F8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 24);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_25C213D38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C213D4C);
}

uint64_t sub_25C213D4C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_25C2216F8();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 24) = (a2 - 1);
  }
  return result;
}

uint64_t sub_25C213E0C()
{
  uint64_t result = sub_25C2216F8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

char *keypath_get_selector_fractionCompleted()
{
  return sel_fractionCompleted;
}

id sub_25C213EC0@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_fractionCompleted);
  *a2 = v4;
  return result;
}

char *keypath_get_selector_isFinished()
{
  return sel_isFinished;
}

id sub_25C213F00@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_isFinished);
  *a2 = (_BYTE)result;
  return result;
}

uint64_t sub_25C213F34(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25C213F9C()
{
  return objectdestroyTm(MEMORY[0x263F8EED8]);
}

uint64_t sub_25C213FB4(uint64_t a1, uint64_t a2)
{
  return sub_25C21403C(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25C211ECC);
}

char *keypath_get_selector_isCancelled()
{
  return sel_isCancelled;
}

id sub_25C213FD8@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_isCancelled);
  *a2 = (_BYTE)result;
  return result;
}

uint64_t sub_25C21400C()
{
  return objectdestroyTm(MEMORY[0x263F8EF20]);
}

uint64_t sub_25C214024(uint64_t a1, uint64_t a2)
{
  return sub_25C21403C(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25C2120A8);
}

uint64_t sub_25C21403C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = *(void *)(type metadata accessor for BackgroundTransferManager.Download(0) - 8);
  uint64_t v7 = *(void *)(v3 + 16);
  uint64_t v8 = v3 + ((*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a3(a1, a2, v7, v8);
}

uint64_t sub_25C2140D4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25C214130(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25C214198(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BackgroundTransferManager._Transfer(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C2141FC()
{
  return objectdestroy_23Tm(MEMORY[0x263F8EF20]);
}

uint64_t sub_25C214214(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for BackgroundTransferManager.Download(0) - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v9 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  unint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *unint64_t v10 = v2;
  v10[1] = sub_25C214618;
  return sub_25C21078C(a1, v5, v6, v7, v8, v9);
}

uint64_t sub_25C214314()
{
  return objectdestroy_23Tm(MEMORY[0x263F8EED8]);
}

uint64_t objectdestroy_23Tm(void (*a1)(void))
{
  uint64_t v3 = (int *)(type metadata accessor for BackgroundTransferManager.Download(0) - 8);
  uint64_t v4 = *(unsigned __int8 *)(*(void *)v3 + 80);
  uint64_t v5 = (v4 + 48) & ~v4;
  uint64_t v6 = v5 + *(void *)(*(void *)v3 + 64);
  uint64_t v7 = v4 | 7;
  swift_unknownObjectRelease();

  a1(*(void *)(v1 + 40));
  uint64_t v8 = v1 + v5;
  uint64_t v9 = sub_25C2216F8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v1 + v5, v9);
  swift_bridgeObjectRelease();
  uint64_t v10 = v1 + v5 + v3[8];
  uint64_t v11 = sub_25C2218B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  swift_bridgeObjectRelease();
  uint64_t v12 = v8 + v3[10];
  uint64_t v13 = sub_25C2216C8();
  uint64_t v14 = *(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8);
  v14(v12, v13);
  swift_bridgeObjectRelease();
  v14(v8 + v3[12], v13);

  return MEMORY[0x270FA0238](v1, v6, v7);
}

uint64_t sub_25C214518(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for BackgroundTransferManager.Download(0) - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v9 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_25C214618;
  return sub_25C210504(a1, v5, v6, v7, v8, v9);
}

uint64_t sub_25C21461C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C221A68();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_25C221A58();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_25C20BDEC(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25C221A48();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

unint64_t ServiceExtensionsErrorDomain.getter()
{
  return 0xD00000000000001BLL;
}

uint64_t static _ServiceManager.shared.getter()
{
  if (qword_26A596CE8 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t _ServiceManager.deinit()
{
  swift_defaultActor_destroy();
  return v0;
}

uint64_t _ServiceManager.__deallocating_deinit()
{
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t _ServiceManager.unownedExecutor.getter()
{
  return v0;
}

uint64_t _ServiceManager.ServiceExtensionsErrorCodes.init(rawValue:)@<X0>(uint64_t result@<X0>, BOOL *a2@<X8>)
{
  *a2 = result != 1;
  return result;
}

uint64_t _ServiceManager.ServiceExtensionsErrorCodes.rawValue.getter()
{
  return 1;
}

uint64_t sub_25C2148AC()
{
  return 1;
}

uint64_t sub_25C2148B4()
{
  return sub_25C221D78();
}

uint64_t sub_25C2148F8()
{
  return sub_25C221D68();
}

uint64_t sub_25C214920()
{
  return sub_25C221D78();
}

void *sub_25C214960@<X0>(void *result@<X0>, BOOL *a2@<X8>)
{
  *a2 = *result != 1;
  return result;
}

void sub_25C214974(void *a1@<X8>)
{
  *a1 = 1;
}

ServiceExtensions::_ServiceManager::ServiceExtensionPointIdentifier_optional __swiftcall _ServiceManager.ServiceExtensionPointIdentifier.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_25C221C88();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

unint64_t _ServiceManager.ServiceExtensionPointIdentifier.rawValue.getter()
{
  unint64_t v1 = 0xD000000000000020;
  if (*v0 != 1) {
    unint64_t v1 = 0xD000000000000024;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0xD000000000000027;
  }
}

uint64_t sub_25C214A3C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25C221100(*a1, *a2);
}

uint64_t sub_25C214A48()
{
  return sub_25C221200();
}

uint64_t sub_25C214A50()
{
  return sub_25C2212A8();
}

uint64_t sub_25C214A58()
{
  return sub_25C221338();
}

ServiceExtensions::_ServiceManager::ServiceExtensionPointIdentifier_optional sub_25C214A60(Swift::String *a1)
{
  return _ServiceManager.ServiceExtensionPointIdentifier.init(rawValue:)(*a1);
}

unint64_t sub_25C214A6C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = _ServiceManager.ServiceExtensionPointIdentifier.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25C214A94()
{
  (*(void (**)(void, void))(v0[21] + 8))(v0[23], v0[20]);
  (*(void (**)(void, void))(v0[25] + 8))(v0[27], v0[24]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

id _SEServiceManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

uint64_t sub_25C214BE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void v6[5] = a5;
  v6[6] = a6;
  v6[4] = a4;
  type metadata accessor for _ContentProcess(0);
  v6[7] = swift_task_alloc();
  v6[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C214C84, 0, 0);
}

uint64_t sub_25C214C84()
{
  if (qword_26A596CE8 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[4];
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____SEServiceConfiguration_serviceIdentifier);
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____SEServiceConfiguration_serviceIdentifier + 8);
  v0[9] = v3;
  uint64_t v4 = (uint64_t *)(v1 + OBJC_IVAR____SEServiceConfiguration_interruptionHandler);
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  v0[10] = v6;
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v7 = (void *)swift_task_alloc();
  v0[11] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_25C214DB0;
  uint64_t v8 = v0[8];
  return _ServiceManager.contentProcess(serviceIdentifier:onInteruption:)(v8, v2, v3, v5, v6);
}

uint64_t sub_25C214DB0()
{
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_25C2164C8;
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_25C214ED4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25C214ED4()
{
  uint64_t super_class = (uint64_t)v0[3].super_class;
  uint64_t receiver = (uint64_t)v0[4].receiver;
  uint64_t v3 = (void (*)(void, void))v0[2].super_class;
  sub_25C20C6A0(receiver, super_class, type metadata accessor for _ContentProcess);
  uint64_t v4 = (objc_class *)type metadata accessor for _SEContentProcess(0);
  id v5 = objc_allocWithZone(v4);
  sub_25C20C6A0(super_class, (uint64_t)v5 + OBJC_IVAR____SEContentProcess_inner, type metadata accessor for _ContentProcess);
  v0[1].uint64_t receiver = v5;
  v0[1].uint64_t super_class = v4;
  id v6 = objc_msgSendSuper2(v0 + 1, sel_init);
  sub_25C20C63C(super_class, type metadata accessor for _ContentProcess);
  v3(v6, 0);

  sub_25C20C63C(receiver, type metadata accessor for _ContentProcess);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0->super_class;
  return v7();
}

uint64_t sub_25C214FF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void v6[5] = a5;
  v6[6] = a6;
  v6[4] = a4;
  type metadata accessor for _NetworkProcess(0);
  v6[7] = swift_task_alloc();
  v6[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C21509C, 0, 0);
}

uint64_t sub_25C21509C()
{
  if (qword_26A596CE8 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[4];
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____SEServiceConfiguration_serviceIdentifier);
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____SEServiceConfiguration_serviceIdentifier + 8);
  v0[9] = v3;
  uint64_t v4 = (uint64_t *)(v1 + OBJC_IVAR____SEServiceConfiguration_interruptionHandler);
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  v0[10] = v6;
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v7 = (void *)swift_task_alloc();
  v0[11] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_25C2151C8;
  uint64_t v8 = v0[8];
  return _ServiceManager.networkProcess(serviceIdentifier:onInteruption:)(v8, v2, v3, v5, v6);
}

uint64_t sub_25C2151C8()
{
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_25C2164C8;
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_25C2152EC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25C2152EC()
{
  uint64_t super_class = (uint64_t)v0[3].super_class;
  uint64_t receiver = (uint64_t)v0[4].receiver;
  uint64_t v3 = (void (*)(void, void))v0[2].super_class;
  sub_25C20C6A0(receiver, super_class, type metadata accessor for _NetworkProcess);
  uint64_t v4 = (objc_class *)type metadata accessor for _SENetworkProcess(0);
  id v5 = objc_allocWithZone(v4);
  sub_25C20C6A0(super_class, (uint64_t)v5 + OBJC_IVAR____SENetworkProcess_inner, type metadata accessor for _NetworkProcess);
  v0[1].uint64_t receiver = v5;
  v0[1].uint64_t super_class = v4;
  id v6 = objc_msgSendSuper2(v0 + 1, sel_init);
  sub_25C20C63C(super_class, type metadata accessor for _NetworkProcess);
  v3(v6, 0);

  sub_25C20C63C(receiver, type metadata accessor for _NetworkProcess);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0->super_class;
  return v7();
}

uint64_t sub_25C215410(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void v6[5] = a5;
  v6[6] = a6;
  v6[4] = a4;
  type metadata accessor for _GPUProcess(0);
  v6[7] = swift_task_alloc();
  v6[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C2154B4, 0, 0);
}

uint64_t sub_25C2154B4()
{
  if (qword_26A596CE8 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[4];
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____SEServiceConfiguration_serviceIdentifier);
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____SEServiceConfiguration_serviceIdentifier + 8);
  v0[9] = v3;
  uint64_t v4 = (uint64_t *)(v1 + OBJC_IVAR____SEServiceConfiguration_interruptionHandler);
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  v0[10] = v6;
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v7 = (void *)swift_task_alloc();
  v0[11] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_25C2155E0;
  uint64_t v8 = v0[8];
  return _ServiceManager.gpuProcess(serviceIdentifier:onInteruption:)(v8, v2, v3, v5, v6);
}

uint64_t sub_25C2155E0()
{
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_25C215828;
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_25C215704;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25C215704()
{
  uint64_t super_class = (uint64_t)v0[3].super_class;
  uint64_t receiver = (uint64_t)v0[4].receiver;
  uint64_t v3 = (void (*)(void, void))v0[2].super_class;
  sub_25C20C6A0(receiver, super_class, type metadata accessor for _GPUProcess);
  uint64_t v4 = (objc_class *)type metadata accessor for _SEGPUProcess(0);
  id v5 = objc_allocWithZone(v4);
  sub_25C20C6A0(super_class, (uint64_t)v5 + OBJC_IVAR____SEGPUProcess_inner, type metadata accessor for _GPUProcess);
  v0[1].uint64_t receiver = v5;
  v0[1].uint64_t super_class = v4;
  id v6 = objc_msgSendSuper2(v0 + 1, sel_init);
  sub_25C20C63C(super_class, type metadata accessor for _GPUProcess);
  v3(v6, 0);

  sub_25C20C63C(receiver, type metadata accessor for _GPUProcess);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0->super_class;
  return v7();
}

uint64_t sub_25C215828()
{
  uint64_t v1 = (void *)v0[12];
  uint64_t v2 = (void (*)(void, void *))v0[5];
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_25C221668();
  v2(0, v3);

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

id _SEServiceManager.init()()
{
  v2.uint64_t receiver = v0;
  v2.uint64_t super_class = (Class)type metadata accessor for _SEServiceManager();
  return objc_msgSendSuper2(&v2, sel_init);
}

id _SEServiceManager.__deallocating_deinit()
{
  return sub_25C215B84(type metadata accessor for _SEServiceManager);
}

void _SEServiceConfiguration.init()()
{
}

id _SEServiceConfiguration.__deallocating_deinit()
{
  return sub_25C215B84(type metadata accessor for _SEServiceConfiguration);
}

id sub_25C215B84(uint64_t (*a1)(void))
{
  v3.uint64_t receiver = v1;
  v3.uint64_t super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_25C215BC0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25C215C9C;
  return v6(a1);
}

uint64_t sub_25C215C9C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_25C215DA0()
{
  unint64_t result = qword_26A596EA8;
  if (!qword_26A596EA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A596EA8);
  }
  return result;
}

unint64_t sub_25C215DF8()
{
  unint64_t result = qword_26A596EB0;
  if (!qword_26A596EB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A596EB0);
  }
  return result;
}

uint64_t method lookup function for _ServiceManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for _ServiceManager);
}

unsigned char *storeEnumTagSinglePayload for _ServiceManager.ServiceExtensionsErrorCodes(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x25C215F00);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25C215F28()
{
  return 0;
}

ValueMetadata *type metadata accessor for _ServiceManager.ServiceExtensionsErrorCodes()
{
  return &type metadata for _ServiceManager.ServiceExtensionsErrorCodes;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for _ServiceManager.ServiceExtensionPointIdentifier(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for _ServiceManager.ServiceExtensionPointIdentifier(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25C2160A8);
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

uint64_t sub_25C2160D0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25C2160D8(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for _ServiceManager.ServiceExtensionPointIdentifier()
{
  return &type metadata for _ServiceManager.ServiceExtensionPointIdentifier;
}

uint64_t method lookup function for _SEServiceManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for _SEServiceManager);
}

uint64_t method lookup function for _SEServiceConfiguration(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for _SEServiceConfiguration);
}

uint64_t sub_25C216120()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25C216158()
{
  return sub_25C2195A4(*(void *)(v0 + 16));
}

uint64_t sub_25C216164(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_25C2126E4;
  return sub_25C215410(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_25C21622C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25C216264(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25C2126E4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A596ED8 + dword_26A596ED8);
  return v6(a1, v4);
}

uint64_t sub_25C216320(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_25C214618;
  return sub_25C214FF8(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_25C2163EC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_25C214618;
  return sub_25C214BE0(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_25C2164CC()
{
  sub_25C221BE8();
  swift_bridgeObjectRelease();
  sandbox_enable_local_state_flag();
  return sandbox_enable_local_state_flag();
}

uint64_t sub_25C216530()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t dispatch thunk of ContentServiceExtension.handle(xpcConnection:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of ContentServiceExtension._lockdown(version:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t _ProcessErrorCode.init(rawValue:)@<X0>(uint64_t result@<X0>, BOOL *a2@<X8>)
{
  *a2 = result != 0;
  return result;
}

uint64_t _ProcessErrorCode.rawValue.getter()
{
  return 0;
}

uint64_t sub_25C2165F8()
{
  return sub_25C221D78();
}

uint64_t sub_25C21663C()
{
  return sub_25C221D68();
}

uint64_t sub_25C216664()
{
  return sub_25C221D78();
}

void *sub_25C2166A4@<X0>(void *result@<X0>, BOOL *a2@<X8>)
{
  *a2 = *result != 0;
  return result;
}

void sub_25C2166B8(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_25C2166C4()
{
  v27[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v0 = sub_25C221868();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x261180380](v2);
  sub_25C221878();
  unint64_t v5 = sub_25C221848();
  int v6 = v5;
  int v8 = v7;
  int v10 = v9;
  int v12 = v11;
  unint64_t v13 = HIDWORD(v5);
  unint64_t v14 = HIDWORD(v7);
  unint64_t v15 = HIDWORD(v9);
  unint64_t v25 = HIDWORD(v11);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  uint64_t v16 = self;
  v27[0] = 0;
  v26[0] = v6;
  v26[1] = v13;
  v26[2] = v8;
  v26[3] = v14;
  v26[4] = v10;
  v26[5] = v15;
  v26[6] = v12;
  v26[7] = v25;
  id v17 = objc_msgSend(v16, sel_bundleRecordForAuditToken_error_, v26, v27);
  if (!v17)
  {
    id v22 = v27[0];
    uint64_t v23 = (void *)sub_25C221678();

    swift_willThrow();
    return 0;
  }
  uint64_t v18 = v17;
  id v19 = v27[0];
  id v20 = objc_msgSend(v18, sel_bundleIdentifier);

  if (!v20) {
    return 0;
  }
  uint64_t v21 = sub_25C2219E8();

  return v21;
}

uint64_t _Process.bundleIdentifier.getter(uint64_t a1, uint64_t a2)
{
  v28[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = sub_25C221868();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  unint64_t v8 = sub_25C221848();
  LODWORD(a2) = v8;
  int v10 = v9;
  LODWORD(a1) = v11;
  int v13 = v12;
  unint64_t v14 = HIDWORD(v8);
  unint64_t v15 = HIDWORD(v9);
  unint64_t v16 = HIDWORD(v11);
  unint64_t v26 = HIDWORD(v12);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  id v17 = self;
  v28[0] = 0;
  v27[0] = a2;
  v27[1] = v14;
  id v27[2] = v10;
  v27[3] = v15;
  v27[4] = a1;
  v27[5] = v16;
  v27[6] = v13;
  v27[7] = v26;
  id v18 = objc_msgSend(v17, sel_bundleRecordForAuditToken_error_, v27, v28);
  if (!v18)
  {
    id v23 = v28[0];
    uint64_t v24 = (void *)sub_25C221678();

    swift_willThrow();
    return 0;
  }
  id v19 = v18;
  id v20 = v28[0];
  id v21 = objc_msgSend(v19, sel_bundleIdentifier);

  if (!v21) {
    return 0;
  }
  uint64_t v22 = sub_25C2219E8();

  return v22;
}

id sub_25C216AD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v9[1] = *(id *)MEMORY[0x263EF8340];
  v9[0] = 0;
  v8[0] = a1;
  v8[1] = a2;
  v8[2] = a3;
  v8[3] = a4;
  id v4 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleRecordForAuditToken_error_, v8, v9);
  if (v4)
  {
    id v5 = v9[0];
  }
  else
  {
    id v6 = v9[0];
    sub_25C221678();

    swift_willThrow();
  }
  return v4;
}

uint64_t sub_25C216BD8@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  return _ExtensionProcess.grant(capability:)(a1, a2, a3, a4);
}

uint64_t _NetworkProcess.makeLibXPCConnection()()
{
  return sub_25C20B888();
}

Swift::Void __swiftcall _NetworkProcess.invalidateLaunchAssertion()()
{
}

uint64_t sub_25C216C38()
{
  return sub_25C2166C4();
}

uint64_t _GPUProcess.makeLibXPCConnection()()
{
  return sub_25C20B888();
}

id _GPUProcess.createVisibilityPropagationInteraction()()
{
  return sub_25C216E7C();
}

Swift::Void __swiftcall _GPUProcess.invalidateLaunchAssertion()()
{
}

void sub_25C216CB0(uint64_t (*a1)(void))
{
  uint64_t v3 = sub_25C2217E8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v7 = *(void **)(v1 + *(int *)(a1(0) + 20));
  unint64_t v8 = (os_unfair_lock_s *)(v7[4] + 16);
  os_unfair_lock_lock(v8);
  unint64_t v9 = (void (*)(uint64_t))v7[2];
  if (v9)
  {
    uint64_t v10 = swift_retain();
    v9(v10);
    sub_25C2217C8();
    sub_25C20D3F0((uint64_t)v9);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v11 = v7[2];
    v7[2] = 0;
    v7[3] = 0;
    sub_25C20D3F0(v11);
  }
  os_unfair_lock_unlock(v8);
}

uint64_t _ContentProcess.makeLibXPCConnection()()
{
  return sub_25C20B888();
}

uint64_t _s17ServiceExtensions15_NetworkProcessV11_auditToken0aB4Core05AuditF0Vvg_0()
{
  MEMORY[0x261180380]();
  return sub_25C221878();
}

id _ContentProcess.createVisibilityPropagationInteraction()()
{
  return sub_25C216E7C();
}

id sub_25C216E7C()
{
  *(void *)v10.val = MEMORY[0x261180380]();
  v10.val[2] = v0;
  v10.val[3] = v1;
  v10.val[4] = v2;
  v10.val[5] = v3;
  v10.val[6] = v4;
  v10.val[7] = v5;
  uint64_t v6 = audit_token_to_pid(&v10);
  unint64_t v7 = (void *)sub_25C2219D8();
  id v8 = objc_msgSend(self, sel_interactionWithPID_environmentIdentifier_, v6, v7);

  return v8;
}

Swift::Void __swiftcall _ContentProcess.invalidateLaunchAssertion()()
{
}

uint64_t _BrowserProcess._auditToken.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_25C221868();
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t _BrowserProcess.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v15 = a1;
  uint64_t v1 = sub_25C221888();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  unsigned int v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for _BrowserProcess(0);
  MEMORY[0x270FA5388](v5 - 8);
  unint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25C221868();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C221858();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F67DF0], v1);
  char v12 = sub_25C221828();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  if (v12)
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v7, v11, v8);
    return sub_25C217274((uint64_t)v7, v15);
  }
  else
  {
    sub_25C217220();
    swift_allocError();
    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

uint64_t type metadata accessor for _BrowserProcess(uint64_t a1)
{
  return sub_25C20D630(a1, (uint64_t *)&unk_26B34FC60);
}

unint64_t sub_25C217220()
{
  unint64_t result = qword_26B34FC50;
  if (!qword_26B34FC50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B34FC50);
  }
  return result;
}

uint64_t sub_25C217274(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for _BrowserProcess(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t _BrowserProcess.init(auditToken:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  void v22[2] = a1;
  v22[5] = a3;
  id v22[3] = a2;
  v22[0] = a4;
  uint64_t v4 = sub_25C221888();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for _BrowserProcess(0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_25C221868();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  id v17 = (char *)v22 - v16;
  sub_25C221878();
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F67DF0], v4);
  char v18 = sub_25C221828();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  id v19 = (void (**)(char *, uint64_t))(v12 + 8);
  if (v18)
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v10, v15, v11);
    sub_25C217274((uint64_t)v10, v22[0]);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v17, v11);
  }
  else
  {
    sub_25C217220();
    swift_allocError();
    swift_willThrow();
    id v21 = *v19;
    (*v19)(v15, v11);
    return ((uint64_t (*)(char *, uint64_t))v21)(v17, v11);
  }
}

uint64_t sub_25C2175B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_25C221868();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t sub_25C217618()
{
  sub_25C20D014(0, &qword_26A596F80);
  uint64_t v0 = sub_25C221848();
  id v5 = sub_25C216AD0(v0, v1, v2, v3);
  id v6 = objc_msgSend(v5, sel_bundleIdentifier);

  if (!v6) {
    return 0;
  }
  uint64_t v4 = sub_25C2219E8();

  return v4;
}

uint64_t sub_25C2176CC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B34FC58);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static _BrowserProcess.checkBrowserEngineEntitlement(forAuditToken:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B34FC58);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  _BrowserProcess.init(auditToken:)(a2, a3, a4, (uint64_t)v9);
  uint64_t v10 = type metadata accessor for _BrowserProcess(0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
  sub_25C2176CC((uint64_t)v9);
  return 1;
}

uint64_t _s17ServiceExtensions15_BrowserProcessV05checkc27EngineEntitlementForCurrentD0SbyFZ_0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B34FC58);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  _BrowserProcess.init()((uint64_t)v2);
  uint64_t v3 = type metadata accessor for _BrowserProcess(0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 0, 1, v3);
  sub_25C2176CC((uint64_t)v2);
  return 1;
}

void sub_25C217980()
{
}

id _SEExtensionProcess.init()()
{
  v2.uint64_t receiver = v0;
  v2.uint64_t super_class = (Class)type metadata accessor for _SEExtensionProcess();
  return objc_msgSendSuper2(&v2, sel_init);
}

id _SEExtensionProcess.__deallocating_deinit(uint64_t a1)
{
  return sub_25C217B90(a1, type metadata accessor for _SEExtensionProcess);
}

id sub_25C217B74()
{
  return sub_25C217B90(0, type metadata accessor for _SEInternalGrant);
}

id sub_25C217B90(uint64_t a1, uint64_t (*a2)(void))
{
  v4.uint64_t receiver = v2;
  v4.uint64_t super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

id sub_25C217BC8()
{
  uint64_t v1 = type metadata accessor for _ContentProcess(0);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&atoken - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25C20D560(v0 + OBJC_IVAR____SEContentProcess_inner, (uint64_t)v3, type metadata accessor for _ContentProcess);
  *(void *)atoken.val = MEMORY[0x261180380](v4);
  atoken.val[2] = v5;
  atoken.val[3] = v6;
  atoken.val[4] = v7;
  atoken.val[5] = v8;
  atoken.val[6] = v9;
  atoken.val[7] = v10;
  uint64_t v11 = audit_token_to_pid(&atoken);
  uint64_t v12 = (void *)sub_25C2219D8();
  id v13 = objc_msgSend(self, sel_interactionWithPID_environmentIdentifier_, v11, v12);

  sub_25C209F40((uint64_t)v3, type metadata accessor for _ContentProcess);
  return v13;
}

void _SEContentProcess.init()()
{
}

uint64_t sub_25C217D64()
{
  return sub_25C209F40(v0 + OBJC_IVAR____SEContentProcess_inner, type metadata accessor for _ContentProcess);
}

id _SEContentProcess.__deallocating_deinit()
{
  return sub_25C217B90(0, (uint64_t (*)(void))type metadata accessor for _SEContentProcess);
}

id sub_25C217DB8()
{
  uint64_t v1 = type metadata accessor for _GPUProcess(0);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&atoken - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25C20D560(v0 + OBJC_IVAR____SEGPUProcess_inner, (uint64_t)v3, type metadata accessor for _GPUProcess);
  *(void *)atoken.val = MEMORY[0x261180380](v4);
  atoken.val[2] = v5;
  atoken.val[3] = v6;
  atoken.val[4] = v7;
  atoken.val[5] = v8;
  atoken.val[6] = v9;
  atoken.val[7] = v10;
  uint64_t v11 = audit_token_to_pid(&atoken);
  uint64_t v12 = (void *)sub_25C2219D8();
  id v13 = objc_msgSend(self, sel_interactionWithPID_environmentIdentifier_, v11, v12);

  sub_25C209F40((uint64_t)v3, type metadata accessor for _GPUProcess);
  return v13;
}

id _SEGPUProcess.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void _SEGPUProcess.init()()
{
}

uint64_t sub_25C217F88()
{
  return sub_25C209F40(v0 + OBJC_IVAR____SEGPUProcess_inner, type metadata accessor for _GPUProcess);
}

id _SEGPUProcess.__deallocating_deinit()
{
  return sub_25C217B90(0, (uint64_t (*)(void))type metadata accessor for _SEGPUProcess);
}

void _SENetworkProcess.init()()
{
}

uint64_t sub_25C218074()
{
  return sub_25C209F40(v0 + OBJC_IVAR____SENetworkProcess_inner, type metadata accessor for _NetworkProcess);
}

id _SENetworkProcess.__deallocating_deinit()
{
  return sub_25C217B90(0, (uint64_t (*)(void))type metadata accessor for _SENetworkProcess);
}

void _SEBrowserProcess.init()()
{
}

id _SEBrowserProcess.__deallocating_deinit()
{
  return sub_25C217B90(0, (uint64_t (*)(void))type metadata accessor for _SEBrowserProcess);
}

uint64_t type metadata accessor for _SEBrowserProcess(uint64_t a1)
{
  return sub_25C20D630(a1, (uint64_t *)&unk_26B34FC70);
}

unint64_t sub_25C2182C0()
{
  unint64_t result = qword_26A596F08;
  if (!qword_26A596F08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A596F08);
  }
  return result;
}

ValueMetadata *type metadata accessor for _ProcessErrorCode()
{
  return &type metadata for _ProcessErrorCode;
}

uint64_t dispatch thunk of _Process.processIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of _Process._auditToken.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of _Process.bundleIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of _ExtensionProcess.makeLibXPCConnection()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of _ExtensionProcess.grant(capabilities:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of _ExtensionProcess.grant(capability:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of _ExtensionProcess.invalidate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of _ExtensionProcess.auditToken.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of _ExtensionProcess.invalidateLaunchAssertion()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t getEnumTagSinglePayload for _NetworkProcess(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm);
}

uint64_t storeEnumTagSinglePayload for _NetworkProcess(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm);
}

uint64_t getEnumTagSinglePayload for _GPUProcess(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_0);
}

uint64_t storeEnumTagSinglePayload for _GPUProcess(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_0);
}

uint64_t *_s17ServiceExtensions15_NetworkProcessVwCP_0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_25C2217E8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t _s17ServiceExtensions15_NetworkProcessVwca_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C2217E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t _s17ServiceExtensions15_NetworkProcessVwtk_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C2217E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t _s17ServiceExtensions15_NetworkProcessVwta_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C2217E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for _ContentProcess(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C2186F8);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C2217E8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for _ContentProcess(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C2187D0);
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_25C2217E8();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for _BrowserProcess(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C221868();
  int v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t destroy for _BrowserProcess(uint64_t a1)
{
  uint64_t v2 = sub_25C221868();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for _BrowserProcess(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C221868();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for _BrowserProcess(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C221868();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for _BrowserProcess(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C221868();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for _BrowserProcess(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C221868();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for _BrowserProcess(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C218B04);
}

uint64_t sub_25C218B04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C221868();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for _BrowserProcess(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C218B84);
}

uint64_t sub_25C218B84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C221868();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t sub_25C218BF4()
{
  uint64_t result = sub_25C221868();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t method lookup function for _SEExtensionProcess(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for _SEExtensionProcess);
}

uint64_t sub_25C218C98()
{
  return type metadata accessor for _SEContentProcess(0);
}

uint64_t method lookup function for _SEContentProcess(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for _SEContentProcess);
}

uint64_t dispatch thunk of _SEContentProcess.createVisibilityPropagationInteraction()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t sub_25C218CEC()
{
  return type metadata accessor for _SEGPUProcess(0);
}

uint64_t method lookup function for _SEGPUProcess(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for _SEGPUProcess);
}

uint64_t dispatch thunk of _SEGPUProcess.createVisibilityPropagationInteraction()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t sub_25C218D40()
{
  return type metadata accessor for _SENetworkProcess(0);
}

uint64_t method lookup function for _SENetworkProcess(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for _SENetworkProcess);
}

uint64_t sub_25C218D98()
{
  return type metadata accessor for _SEBrowserProcess(0);
}

uint64_t sub_25C218DA0()
{
  uint64_t result = sub_25C221868();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for _SEBrowserProcess(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for _SEBrowserProcess);
}

unsigned char *_s17ServiceExtensions17_ProcessErrorCodeOwst_0(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x25C21912CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for _BrowserProcess.Error()
{
  return &type metadata for _BrowserProcess.Error;
}

unint64_t sub_25C219168()
{
  unint64_t result = qword_26A596F78;
  if (!qword_26A596F78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A596F78);
  }
  return result;
}

uint64_t sub_25C2191C0()
{
  v26[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v0 = sub_25C221868();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  int v3 = (char *)v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C221858();
  unint64_t v4 = sub_25C221848();
  int v5 = v4;
  int v7 = v6;
  int v9 = v8;
  int v11 = v10;
  unint64_t v12 = HIDWORD(v4);
  unint64_t v13 = HIDWORD(v6);
  unint64_t v14 = HIDWORD(v8);
  unint64_t v24 = HIDWORD(v10);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  uint64_t v15 = self;
  v26[0] = 0;
  v25[0] = v5;
  v25[1] = v12;
  v25[2] = v7;
  v25[3] = v13;
  v25[4] = v9;
  v25[5] = v14;
  v25[6] = v11;
  v25[7] = v24;
  id v16 = objc_msgSend(v15, sel_bundleRecordForAuditToken_error_, v25, v26);
  if (!v16)
  {
    id v21 = v26[0];
    uint64_t v22 = (void *)sub_25C221678();

    swift_willThrow();
    return 0;
  }
  id v17 = v16;
  id v18 = v26[0];
  id v19 = objc_msgSend(v17, sel_bundleIdentifier);

  if (!v19) {
    return 0;
  }
  uint64_t v20 = sub_25C2219E8();

  return v20;
}

Swift::Bool __swiftcall _BrowserEngineEntitlement.check(auditToken:)(audit_token_t_optional *auditToken)
{
  sub_25C21953C((uint64_t)auditToken, (uint64_t)&v9);
  uint64_t v2 = sub_25C221868();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  int v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C21953C((uint64_t)auditToken, (uint64_t)v10);
  if (v10[32] == 1)
  {
    sub_25C221858();
    sub_25C221848();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  sub_25C221878();
  char v6 = sub_25C221828();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v6 & 1;
}

uint64_t sub_25C21953C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A596FB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C2195A4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t sub_25C2195B0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, uint64_t (*a4)(void)@<X3>, void *a5@<X8>)
{
  unint64_t v26 = a4;
  uint64_t v29 = a5;
  uint64_t v10 = sub_25C2217E8();
  uint64_t v23 = *(void *)(v10 - 8);
  uint64_t v24 = v10;
  MEMORY[0x270FA5388](v10);
  unint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a2(0);
  unint64_t v14 = *(void **)(v5 + *(int *)(v13 + 20));
  os_unfair_lock_t v25 = (os_unfair_lock_t)(v14[4] + 16);
  os_unfair_lock_lock(v25);
  uint64_t v15 = (void (*)(uint64_t))v14[2];
  if (v15)
  {
    uint64_t v22 = v6;
    uint64_t v16 = swift_retain();
    uint64_t v21 = v13;
    v15(v16);
    sub_25C2217C8();
    uint64_t v13 = v21;
    sub_25C20D3F0((uint64_t)v15);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v12, v24);
    uint64_t v17 = v14[2];
    v14[2] = 0;
    v14[3] = 0;
    sub_25C20D3F0(v17);
  }
  os_unfair_lock_unlock(v25);
  sub_25C20D474(a1, (uint64_t)v28);
  v27[3] = v13;
  v27[4] = a3;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v27);
  sub_25C20D5C8(v5, (uint64_t)boxed_opaque_existential_1, v26);
  sub_25C219BF4(v27, v29);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
}

uint64_t _ExtensionProcess.grant(capability:)@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  return sub_25C2197BC(a1, a2, a3, a4);
}

uint64_t _ExtensionProcess.grant(capabilities:)@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  return sub_25C2197BC(a1, a2, a3, a4);
}

uint64_t sub_25C2197BC@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  long long v16 = a1[1];
  long long v17 = *a1;
  long long v14 = a1[3];
  long long v15 = a1[2];
  uint64_t v8 = *((void *)a1 + 8);
  uint64_t v9 = *((void *)a1 + 9);
  char v10 = *((unsigned char *)a1 + 80);
  (*(void (**)(uint64_t, uint64_t))(a3 + 56))(a2, a3);
  long long v19 = v17;
  long long v20 = v16;
  long long v21 = v15;
  long long v22 = v14;
  uint64_t v23 = v8;
  uint64_t v24 = v9;
  char v25 = v10;
  uint64_t v11 = *(void *)(a3 + 8);
  v18[3] = a2;
  v18[4] = v11;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v18);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(boxed_opaque_existential_1, v4, a2);
  sub_25C219BF4(v18, a4);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
}

id _Capability.Grant.valid.getter()
{
  return objc_msgSend(*v0, sel_isValid);
}

uint64_t sub_25C2198FC()
{
  uint64_t v0 = sub_25C2218E8();
  __swift_allocate_value_buffer(v0, qword_26A597290);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A597290);
  return sub_25C2218D8();
}

BOOL static ServiceExtensionError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ServiceExtensionError.hash(into:)()
{
  return sub_25C221D68();
}

uint64_t ServiceExtensionError.hashValue.getter()
{
  return sub_25C221D78();
}

BOOL sub_25C2199FC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25C219A10()
{
  return sub_25C221D78();
}

uint64_t sub_25C219A58()
{
  return sub_25C221D68();
}

uint64_t sub_25C219A84()
{
  return sub_25C221D78();
}

id sub_25C219BD8()
{
  return sub_25C21B77C(0, type metadata accessor for _Capability.AssertionObserver);
}

uint64_t sub_25C219BF4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v6 = *(void *)v2;
  uint64_t v5 = *(void *)(v2 + 8);
  int v7 = *(unsigned __int8 *)(v2 + 80);
  if (v7 == 3)
  {
    swift_bridgeObjectRetain();
    sub_25C219D9C(a1, v6, v5, a2);
    return swift_bridgeObjectRelease();
  }
  else if (v7 == 2)
  {
    uint64_t v10 = *(void *)(v2 + 64);
    uint64_t v11 = *(void *)(v2 + 48);
    sub_25C20D94C(v11);
    sub_25C20D94C(v10);
    sub_25C20D94C(v11);
    sub_25C20D94C(v10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25C20D74C(a1, a2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25C20D3F0(v10);
    sub_25C20D3F0(v11);
    sub_25C20D3F0(v10);
    return sub_25C20D3F0(v11);
  }
  else
  {
    sub_25C21CA34();
    swift_allocError();
    *uint64_t v9 = 3;
    return swift_willThrow();
  }
}

void sub_25C219D9C(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A597090);
  unint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_25C223310;
  *(void *)(v7 + 32) = objc_msgSend(self, sel_attributeWithCompletionPolicy_, 1);
  sub_25C221A38();
  unint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_25C223310;
  if (v7 >> 62)
  {
    sub_25C20D014(0, &qword_26A597098);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25C221C38();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25C221CD8();
    sub_25C20D014(0, &qword_26A597098);
  }
  swift_bridgeObjectRelease();
  uint64_t v9 = (void *)sub_25C2219D8();
  uint64_t v10 = (void *)sub_25C2219D8();
  swift_bridgeObjectRelease();
  sub_25C20D014(0, &qword_26A597098);
  uint64_t v11 = (void *)sub_25C221A28();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(self, sel_grantWithNamespace_sourceEnvironment_attributes_, v9, v10, v11);

  *(void *)(v8 + 32) = v12;
  sub_25C221A38();
  swift_bridgeObjectRetain();
  if (v8 >> 62)
  {
    sub_25C221C38();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25C221CD8();
  }
  swift_bridgeObjectRelease();
  id v13 = sub_25C20DADC(a1, a2, a3);
  swift_bridgeObjectRelease();
  if (!v15) {
    sub_25C20D95C(v13, (uint64_t)nullsub_1, 0, (uint64_t)nullsub_1, 0, a4);
  }
}

uint64_t sub_25C21A088(char a1)
{
  uint64_t v57 = sub_25C2218E8();
  uint64_t v3 = *(void *)(v57 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v57);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = *(void *)v1;
  uint64_t v8 = *(void *)(v1 + 8);
  uint64_t v9 = *(void *)(v1 + 16);
  uint64_t v10 = *(void *)(v1 + 24);
  uint64_t v12 = *(void *)(v1 + 32);
  uint64_t v11 = *(void *)(v1 + 40);
  uint64_t v13 = *(void *)(v1 + 48);
  uint64_t v14 = *(void *)(v1 + 56);
  uint64_t v16 = *(void *)(v1 + 64);
  uint64_t v15 = *(void *)(v1 + 72);
  int v17 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v52 = v3;
  uint64_t v56 = v14;
  uint64_t v58 = v13;
  uint64_t v51 = v9;
  uint64_t v55 = v8;
  uint64_t v50 = v7;
  uint64_t v59 = v15;
  LODWORD(v49) = v17;
  if (a1)
  {
    uint64_t v46 = (char *)&v40 - v5;
    v60[0] = v7;
    v60[1] = v8;
    v60[2] = v9;
    v60[3] = v10;
    v60[4] = v12;
    v60[5] = v11;
    v60[6] = v13;
    v60[7] = v14;
    v60[8] = v16;
    v60[9] = v15;
    char v61 = v17;
    sub_25C21AE2C();
    return 1;
  }
  uint64_t v53 = v16;
  uint64_t v48 = v12;
  uint64_t v54 = v11;
  if (v17 == 3)
  {
    sub_25C21C0B8();
    return 1;
  }
  if (v17 == 2)
  {
    long long v19 = v6;
    uint64_t v20 = v7;
    sub_25C21CA34();
    long long v21 = (void *)swift_allocError();
    *long long v22 = 2;
    swift_willThrow();
    id v45 = v21;
    if (qword_26A596CF8 != -1) {
      swift_once();
    }
    uint64_t v23 = __swift_project_value_buffer(v57, (uint64_t)qword_26A597290);
    uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v46 = v19;
    v24(v19, v23, v57);
    uint64_t v47 = v10;
    sub_25C21C3DC(v20, v55, v9, v10, v48, v54, v58, v56, v53, v59, 2);
    id v25 = v45;
    sub_25C21C3DC(v20, v55, v9, v10, v48, v54, v58, v56, v53, v59, 2);
    id v26 = v45;
    uint64_t v27 = sub_25C2218C8();
    int v43 = sub_25C221A98();
    uint64_t v44 = v27;
    if (!os_log_type_enabled(v27, (os_log_type_t)v43))
    {

      sub_25C20C538(v50, v55, v51, v47, v48, v54, v58, v56, v53, v59, (char)v49);
      sub_25C20C538(v50, v55, v51, v47, v48, v54, v58, v56, v53, v59, (char)v49);

      (*(void (**)(char *, uint64_t))(v52 + 8))(v46, v57);
      return 0;
    }
    uint64_t v28 = v50;
    uint64_t v29 = v55;
    uint64_t v30 = v51;
    uint64_t v31 = v47;
    uint64_t v32 = swift_slowAlloc();
    uint64_t v41 = (void *)swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    v60[0] = v42;
    *(_DWORD *)uint64_t v32 = 136315394;
    char v33 = (char)v49;
    if (v49 == 3)
    {
      uint64_t v40 = v32;
      swift_bridgeObjectRetain();
      uint64_t v62 = sub_25C21B7B8(v28, v29, v60);
      uint64_t v49 = &v63;
      sub_25C221AF8();
      swift_bridgeObjectRelease();
      sub_25C20C538(v28, v29, v30, v31, v48, v54, v58, v56, v53, v59, 3);
      sub_25C20C538(v28, v29, v30, v31, v48, v54, v58, v56, v53, v59, 3);
      id v34 = (uint8_t *)v32;
      *(_WORD *)(v32 + 12) = 2114;
      id v35 = v45;
      id v36 = v45;
      uint64_t v37 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v62 = v37;
      sub_25C221AF8();
      char v38 = v41;
      *uint64_t v41 = v37;

      _os_log_impl(&dword_25C206000, v44, (os_log_type_t)v43, "Error invalidating root endowment for:%s  %{public}@", v34, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A597060);
      swift_arrayDestroy();
      MEMORY[0x261180F80](v38, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x261180F80](v42, -1, -1);
      MEMORY[0x261180F80](v34, -1, -1);

      (*(void (**)(char *, uint64_t))(v52 + 8))(v46, v57);
      return 0;
    }
    if (v49 == 2)
    {

      sub_25C20C538(v28, v29, v30, v31, v48, v54, v58, v56, v53, v59, 2);
      sub_25C221C28();
      __break(1u);
    }
    char v39 = v33;

    sub_25C20C538(v28, v29, v30, v31, v48, v54, v58, v56, v53, v59, v39);
    sub_25C21C3DC(v28, v29, v30, v31, v48, v54, v58, v56, v53, v59, (char)v49);
  }
  uint64_t result = sub_25C221CB8();
  __break(1u);
  return result;
}

uint64_t sub_25C21AE2C()
{
  int v1 = *(unsigned __int8 *)(v0 + 80);
  if (v1 == 2)
  {
LABEL_6:
    sub_25C21CA34();
    swift_allocError();
    *uint64_t v10 = v1;
    return swift_willThrow();
  }
  if (v1 == 3)
  {
    uint64_t v3 = *(void *)(v0 + 16);
    uint64_t v2 = *(void *)(v0 + 24);
    uint64_t v4 = self;
    swift_bridgeObjectRetain();
    id v5 = objc_msgSend(v4, sel_mainBundle);
    id v6 = objc_msgSend(v5, sel_bundleIdentifier);

    if (v6)
    {

      __swift_instantiateConcreteTypeFromMangledName(&qword_26A597070);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_25C222A00;
      *(void *)(inited + 32) = 0xD000000000000010;
      *(void *)(inited + 40) = 0x800000025C223E50;
      *(void *)(inited + 72) = MEMORY[0x263F8D310];
      *(void *)(inited + 48) = v3;
      *(void *)(inited + 56) = v2;
      unint64_t v8 = sub_25C21CCB4(inited);
      sub_25C21AFB8(v8);
      swift_bridgeObjectRelease();
      sub_25C21BF70();
      return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    LOBYTE(v1) = 1;
    goto LABEL_6;
  }
  uint64_t result = sub_25C221CB8();
  __break(1u);
  return result;
}

uint64_t sub_25C21AFB8(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A597078);
    uint64_t v2 = sub_25C221C68();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    int v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_25C21CA88(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_25C21CAE4(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_25C21CAE4(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_25C21CAE4(v36, v37);
    sub_25C21CAE4(v37, &v33);
    uint64_t result = sub_25C221B88();
    uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_25C21CAE4(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_25C21CAF4();
    return v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

id static _SECapability.assertion(domain:name:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int64_t v8 = (objc_class *)type metadata accessor for _SECapability();
  unint64_t v9 = (char *)objc_allocWithZone(v8);
  uint64_t v10 = &v9[OBJC_IVAR____SECapability_inner];
  *(void *)uint64_t v10 = a1;
  *((void *)v10 + 1) = a2;
  *((void *)v10 + 2) = a3;
  *((void *)v10 + 3) = a4;
  *((void *)v10 + 4) = 0;
  *((void *)v10 + 5) = 0;
  *((void *)v10 + 6) = nullsub_1;
  *((void *)v10 + 7) = 0;
  *((void *)v10 + 8) = nullsub_1;
  *((void *)v10 + 9) = 0;
  v10[80] = 2;
  v12.uint64_t receiver = v9;
  v12.uint64_t super_class = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return objc_msgSendSuper2(&v12, sel_init);
}

id static _SECapability.assertion(domain:name:environmentIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_super v12 = (objc_class *)type metadata accessor for _SECapability();
  int64_t v13 = (char *)objc_allocWithZone(v12);
  unint64_t v14 = &v13[OBJC_IVAR____SECapability_inner];
  *(void *)unint64_t v14 = a1;
  *((void *)v14 + 1) = a2;
  *((void *)v14 + 2) = a3;
  *((void *)v14 + 3) = a4;
  *((void *)v14 + 4) = a5;
  *((void *)v14 + 5) = a6;
  *((void *)v14 + 6) = nullsub_1;
  *((void *)v14 + 7) = 0;
  *((void *)v14 + 8) = nullsub_1;
  *((void *)v14 + 9) = 0;
  v14[80] = 2;
  v16.uint64_t receiver = v13;
  v16.uint64_t super_class = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return objc_msgSendSuper2(&v16, sel_init);
}

id static _SECapability.assertion(domain:name:environmentIdentifier:willInvalidate:didInvalidate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  int v17 = (objc_class *)type metadata accessor for _SECapability();
  uint64_t v18 = (char *)objc_allocWithZone(v17);
  uint64_t v19 = &v18[OBJC_IVAR____SECapability_inner];
  *(void *)uint64_t v19 = a1;
  *((void *)v19 + 1) = a2;
  *((void *)v19 + 2) = a3;
  *((void *)v19 + 3) = a4;
  *((void *)v19 + 4) = a5;
  *((void *)v19 + 5) = a6;
  *((void *)v19 + 6) = a7;
  *((void *)v19 + 7) = a8;
  *((void *)v19 + 8) = a9;
  *((void *)v19 + 9) = a10;
  v19[80] = 2;
  v22.uint64_t receiver = v18;
  v22.uint64_t super_class = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return objc_msgSendSuper2(&v22, sel_init);
}

uint64_t sub_25C21B5FC(char a1)
{
  return sub_25C21A088(a1) & 1;
}

id _SECapability.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void _SECapability.init()()
{
}

id _SECapability.__deallocating_deinit(uint64_t a1)
{
  return sub_25C21B77C(a1, type metadata accessor for _SECapability);
}

id _SECapabilities.__deallocating_deinit(uint64_t a1)
{
  return sub_25C21B77C(a1, type metadata accessor for _SECapabilities);
}

id sub_25C21B77C(uint64_t a1, uint64_t (*a2)(void))
{
  v4.uint64_t receiver = v2;
  v4.uint64_t super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t sub_25C21B7B8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25C21B88C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25C21CA88((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_25C21CA88((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_25C21B88C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_25C221B08();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25C21BA48(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_25C221C08();
  if (!v8)
  {
    sub_25C221C18();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25C221C78();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_25C21BA48(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25C21BAE0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25C21BCC0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25C21BCC0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25C21BAE0(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_25C21BC58(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25C221BF8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25C221C18();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25C221A18();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25C221C78();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25C221C18();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25C21BC58(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A597080);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25C21BCC0(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A597080);
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
  int64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_25C221C78();
  __break(1u);
  return result;
}

id sub_25C21BE10(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A597070);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25C223320;
  uint64_t v3 = sub_25C2219E8();
  uint64_t v4 = MEMORY[0x263F8D310];
  *(void *)(inited + 32) = v3;
  *(void *)(inited + 40) = v5;
  *(void *)(inited + 72) = v4;
  *(void *)(inited + 48) = 0xD00000000000001BLL;
  *(void *)(inited + 56) = 0x800000025C2240B0;
  *(void *)(inited + 80) = sub_25C2219E8();
  *(void *)(inited + 88) = v6;
  *(void *)(inited + 120) = sub_25C20D014(0, (unint64_t *)&unk_26A5970A0);
  *(void *)(inited + 96) = a1;
  id v7 = a1;
  sub_25C21CCB4(inited);
  id v8 = objc_allocWithZone(MEMORY[0x263F087E8]);
  int64_t v9 = (void *)sub_25C2219D8();
  uint64_t v10 = (void *)sub_25C221998();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(v8, sel_initWithDomain_code_userInfo_, v9, 0, v10);

  return v11;
}

id sub_25C21BF70()
{
  id result = objc_msgSend(self, sel_sharedAVSystemController);
  if (result)
  {
    id v1 = result;
    uint64_t v2 = (void *)sub_25C2219D8();
    uint64_t v3 = (void *)sub_25C221998();
    signed int v4 = objc_msgSend(v1, sel_grantMediaEndowmentWithEnvironmentID_endowmentPayload_, v2, v3);

    id result = (id)sub_25C221918();
    if (v4 != result)
    {
      sub_25C2219E8();
      id v5 = objc_allocWithZone(MEMORY[0x263F087E8]);
      uint64_t v6 = (void *)sub_25C2219D8();
      swift_bridgeObjectRelease();
      objc_msgSend(v5, sel_initWithDomain_code_userInfo_, v6, v4, 0);

      return (id)swift_willThrow();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_25C21C0B8()
{
  id result = objc_msgSend(self, sel_sharedAVSystemController);
  if (result)
  {
    id v1 = result;
    uint64_t v2 = (void *)sub_25C2219D8();
    signed int v3 = objc_msgSend(v1, sel_revokeMediaEndowmentWithEnvironmentID_, v2);

    id result = (id)sub_25C221918();
    if (v3 != result)
    {
      sub_25C2219E8();
      id v4 = objc_allocWithZone(MEMORY[0x263F087E8]);
      id v5 = (void *)sub_25C2219D8();
      swift_bridgeObjectRelease();
      objc_msgSend(v4, sel_initWithDomain_code_userInfo_, v5, v3, 0);

      return (id)swift_willThrow();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for _SECapabilities()
{
  return self;
}

unint64_t sub_25C21C1F4()
{
  unint64_t result = qword_26A596FD8;
  if (!qword_26A596FD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A596FD8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ServiceExtensionError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ServiceExtensionError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25C21C3A4);
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

ValueMetadata *type metadata accessor for ServiceExtensionError()
{
  return &type metadata for ServiceExtensionError;
}

void sub_25C21C3DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  switch(a11)
  {
    case 0:
    case 1:
      swift_bridgeObjectRetain();
      goto LABEL_3;
    case 2:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_25C20D94C(a7);
      sub_25C20D94C(a9);
      break;
    case 3:
LABEL_3:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      break;
    default:
      return;
  }
}

uint64_t initializeWithCopy for _Capability(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v13 = *(void *)(a2 + 72);
  char v14 = *(unsigned char *)(a2 + 80);
  sub_25C21C3DC(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v13;
  *(unsigned char *)(a1 + 80) = v14;
  return a1;
}

uint64_t assignWithCopy for _Capability(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v24 = *(void *)(a2 + 72);
  char v25 = *(unsigned char *)(a2 + 80);
  sub_25C21C3DC(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v24, v25);
  uint64_t v12 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  uint64_t v20 = *(void *)(a1 + 64);
  uint64_t v21 = *(void *)(a1 + 72);
  char v22 = *(unsigned char *)(a1 + 80);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v24;
  *(unsigned char *)(a1 + 80) = v25;
  sub_25C20C538(v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
  return a1;
}

__n128 __swift_memcpy81_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for _Capability(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 80);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 72);
  char v14 = *(unsigned char *)(a1 + 80);
  long long v15 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v15;
  long long v16 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v16;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = v3;
  sub_25C20C538(v4, v6, v5, v7, v8, v9, v10, v11, v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for _Capability(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 81)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 80);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for _Capability(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 80) = 0;
    *(void *)__n128 result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 81) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 81) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 80) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25C21C7C4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 80);
}

uint64_t assignWithCopy for _Capability.Grant(uint64_t a1, uint64_t a2)
{
  int v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void **)(a1 + 8);
  uint64_t v8 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v8;
  id v9 = v8;

  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for _Capability.Grant(uint64_t a1, _OWORD *a2)
{
  int v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for _Capability.Grant(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for _Capability.Grant(uint64_t result, int a2, int a3)
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

uint64_t method lookup function for _SECapability(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for _SECapability);
}

uint64_t dispatch thunk of _SECapability.setActive(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

ValueMetadata *type metadata accessor for Process()
{
  return &type metadata for Process;
}

uint64_t sub_25C21C950()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25C21C988()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

unint64_t sub_25C21CA34()
{
  unint64_t result = qword_26A597068;
  if (!qword_26A597068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A597068);
  }
  return result;
}

uint64_t sub_25C21CA88(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_25C21CAE4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_25C21CAF4()
{
  return swift_release();
}

uint64_t sub_25C21CB04@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_25C20E0E0(a1, a2);
}

uint64_t sub_25C21CB1C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_25C20E310(a1, a2);
}

uint64_t sub_25C21CB34@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_25C20E244(a1, a2);
}

uint64_t sub_25C21CB54@<X0>(long long *a1@<X0>, void *a2@<X8>)
{
  return NetworkingServiceExtension._request(capability:)(a1, a2);
}

uint64_t NetworkingServiceExtension._lockdown(version:)()
{
  sub_25C221BE8();
  swift_bridgeObjectRelease();
  return sandbox_enable_local_state_flag();
}

uint64_t sub_25C21CBC4()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t NetworkingServiceExtension._request(capability:)@<X0>(long long *a1@<X0>, void *a2@<X8>)
{
  return sub_25C20AA20(a1, a2);
}

uint64_t dispatch thunk of NetworkingServiceExtension.handle(xpcConnection:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of NetworkingServiceExtension._request(capabilities:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of NetworkingServiceExtension._lockdown(version:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

unint64_t sub_25C21CCB4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5971C0);
  uint64_t v2 = sub_25C221C68();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_25C220FA4(v6, (uint64_t)&v15, &qword_26A5971C8);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_25C21F560(v15, v16, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_25C21F7EC);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_25C21CAE4(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
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

unint64_t sub_25C21CE00(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A597078);
  uint64_t v2 = sub_25C221C68();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_25C220FA4(v6, (uint64_t)v15, (uint64_t *)&unk_26A5971E0);
    unint64_t result = sub_25C21F5E4((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_25C21CAE4(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
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

id _SEHostingHandle.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return _SEHostingHandle.init(from:)(a1);
}

id _SEHostingHandle.init(from:)(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  if (!a1) {
    goto LABEL_18;
  }
  uint64_t v4 = v1;
  uint64_t v5 = MEMORY[0x261181090](a1);
  if (v5 != sub_25C221908()) {
    goto LABEL_16;
  }
  if (xpc_dictionary_get_count(a1) != 2) {
    goto LABEL_16;
  }
  xpc_object_t v6 = xpc_dictionary_get_value(a1, "pid");
  if (!v6) {
    goto LABEL_16;
  }
  uint64_t v7 = v6;
  uint64_t v8 = swift_unknownObjectRetain();
  uint64_t v9 = MEMORY[0x261181090](v8);
  if (v9 != sub_25C2218F8())
  {
LABEL_6:
    swift_unknownObjectRelease();
LABEL_7:
    swift_unknownObjectRelease_n();
LABEL_17:

    goto LABEL_18;
  }
  uint64_t value = xpc_uint64_get_value(v7);
  if (value)
  {
    int v11 = value;
    if (!(value >> 31))
    {
      xpc_object_t v12 = xpc_dictionary_get_value(a1, "cid");
      if (!v12) {
        goto LABEL_6;
      }
      BOOL v13 = v12;
      uint64_t v14 = swift_unknownObjectRetain();
      uint64_t v15 = MEMORY[0x261181090](v14);
      if (v15 != sub_25C2218F8())
      {
        swift_unknownObjectRelease();
        swift_unknownObjectRelease_n();
        goto LABEL_7;
      }
      uint64_t v16 = xpc_uint64_get_value(v13);
      swift_unknownObjectRelease_n();
      swift_unknownObjectRelease_n();
      if (v16 && !HIDWORD(v16))
      {
        *(_DWORD *)&v4[OBJC_IVAR____SEHostingHandle_pid] = v11;
        *(_DWORD *)&v4[OBJC_IVAR____SEHostingHandle_contextID] = v16;

        v19.uint64_t receiver = v4;
        v19.uint64_t super_class = ObjectType;
        id v17 = objc_msgSendSuper2(&v19, sel_init);
        swift_unknownObjectRelease();
        return v17;
      }
LABEL_16:
      swift_unknownObjectRelease();
      goto LABEL_17;
    }
  }
  swift_unknownObjectRelease();

  swift_unknownObjectRelease_n();
LABEL_18:
  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t _SEHostingHandle.xpcRepresentation()()
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  uint64_t v2 = *(unsigned int *)(v0 + OBJC_IVAR____SEHostingHandle_pid);
  if ((v2 & 0x80000000) != 0)
  {
    uint64_t result = sub_25C221C18();
    __break(1u);
  }
  else
  {
    id v3 = empty;
    xpc_dictionary_set_uint64(empty, "pid", v2);
    xpc_dictionary_set_uint64(v3, "cid", *(unsigned int *)(v0 + OBJC_IVAR____SEHostingHandle_contextID));
    return (uint64_t)v3;
  }
  return result;
}

uint64_t static _SEHostingHandle.supportsSecureCoding.getter()
{
  return 1;
}

id _SEHostingHandle.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return _SEHostingHandle.init(coder:)(a1);
}

id _SEHostingHandle.init(coder:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = v2;
  xpc_object_t v6 = (void *)sub_25C2219D8();
  int v7 = objc_msgSend(a1, sel_decodeInt32ForKey_, v6);

  if (v7 >= 1
    && (uint64_t v8 = (void *)sub_25C2219D8(),
        unsigned int v9 = objc_msgSend(a1, sel_decodeInt32ForKey_, v8),
        v8,
        v9))
  {
    *(_DWORD *)&v5[OBJC_IVAR____SEHostingHandle_pid] = v7;
    *(_DWORD *)&v5[OBJC_IVAR____SEHostingHandle_contextID] = v9;

    v12.uint64_t receiver = v5;
    v12.uint64_t super_class = ObjectType;
    id v10 = objc_msgSendSuper2(&v12, sel_init);
  }
  else
  {

    swift_deallocPartialClassInstance();
    return 0;
  }
  return v10;
}

Swift::Void __swiftcall _SEHostingHandle.encode(with:)(NSCoder with)
{
  uint64_t v3 = *(unsigned int *)(v1 + OBJC_IVAR____SEHostingHandle_pid);
  uint64_t v4 = (void *)sub_25C2219D8();
  [(objc_class *)with.super.isa encodeInt32:v3 forKey:v4];

  uint64_t v5 = *(unsigned int *)(v1 + OBJC_IVAR____SEHostingHandle_contextID);
  id v6 = (id)sub_25C2219D8();
  [(objc_class *)with.super.isa encodeInt32:v5 forKey:v6];
}

id _SEHostable.handle.getter()
{
  return *(id *)(v0 + OBJC_IVAR____SEHostable_handle);
}

id _SEHostable.layer.getter()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____SEHostable__context), sel_layer);
  return v1;
}

void _SEHostable.layer.setter(void *a1)
{
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____SEHostable__context), sel_setLayer_, a1);
}

void (*_SEHostable.layer.modify(void *a1))(id *a1)
{
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____SEHostable__context);
  a1[1] = v3;
  *a1 = objc_msgSend(v3, sel_layer);
  return sub_25C21D7BC;
}

void sub_25C21D7BC(id *a1)
{
  id v1 = *a1;
  objc_msgSend(a1[1], sel_setLayer_);
}

void sub_25C21D80C()
{
}

uint64_t static _SEHostable.create()()
{
  return sub_25C2209DC();
}

uint64_t static _SEHostable.create(options:)()
{
  return sub_25C220804();
}

id _s17ServiceExtensions16_SEHostingHandleCfD_0()
{
  v2.uint64_t receiver = v0;
  v2.uint64_t super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Void __swiftcall _SEHostable.invalidate()()
{
  if (objc_msgSend(*(id *)(v0 + OBJC_IVAR____SEHostable__invalidationSignal), sel_signal))
  {
    id v1 = *(void **)(v0 + OBJC_IVAR____SEHostable__context);
    objc_msgSend(v1, sel_invalidate);
  }
}

void *sub_25C21DBFC()
{
  id v1 = (void **)(v0 + OBJC_IVAR____SEHostingView_handle);
  swift_beginAccess();
  objc_super v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_25C21DCCC(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____SEHostingView_handle);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
  id v5 = a1;

  sub_25C21DDAC();
}

void sub_25C21DD38(void **a1, void *a2)
{
  objc_super v2 = *a1;
  id v3 = (void **)(*a2 + OBJC_IVAR____SEHostingView_handle);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = v2;
  id v5 = v2;

  sub_25C21DDAC();
}

uint64_t sub_25C21DDAC()
{
  uint64_t v1 = OBJC_IVAR____SEHostingView__visibility;
  uint64_t v2 = *(void *)&v0[OBJC_IVAR____SEHostingView__visibility];
  id v3 = (void **)&v0[OBJC_IVAR____SEHostingView_handle];
  swift_beginAccess();
  uint64_t v4 = *v3;
  swift_unknownObjectRetain();
  if (v4)
  {
    id v5 = v4;
    id v6 = objc_msgSend(v0, sel_layer);
    self;
    objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_setContextId_, *(unsigned int *)&v5[OBJC_IVAR____SEHostingHandle_contextID]);
    uint64_t v7 = *(unsigned int *)&v5[OBJC_IVAR____SEHostingHandle_pid];
    uint64_t v8 = (void *)sub_25C2219D8();
    id v9 = objc_msgSend(self, sel_interactionWithPID_environmentIdentifier_, v7, v8);
  }
  else
  {
    id v9 = 0;
  }
  *(void *)&v0[v1] = v9;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  if (v9) {
    objc_msgSend(v0, sel_addInteraction_, v9);
  }
  if (v2)
  {
    swift_unknownObjectRetain();
    objc_msgSend(v0, sel_removeInteraction_, v2);
    swift_unknownObjectRelease_n();
  }
  return swift_unknownObjectRelease();
}

uint64_t (*sub_25C21DF5C(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_25C21DFBC;
}

uint64_t sub_25C21DFBC(uint64_t a1, char a2)
{
  uint64_t result = swift_endAccess();
  if ((a2 & 1) == 0) {
    return sub_25C21DDAC();
  }
  return result;
}

uint64_t sub_25C21E02C()
{
  return sub_25C20D014(0, &qword_26A5970E0);
}

id _SEHostingView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

id _SEHostingView.init(frame:)(double a1, double a2, double a3, double a4)
{
  *(void *)&v4[OBJC_IVAR____SEHostingView__visibility] = 0;
  *(void *)&v4[OBJC_IVAR____SEHostingView_handle] = 0;
  v10.uint64_t receiver = v4;
  v10.uint64_t super_class = (Class)type metadata accessor for _SEHostingView();
  return objc_msgSendSuper2(&v10, sel_initWithFrame_, a1, a2, a3, a4);
}

id _SEHostingView.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id _SEHostingView.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR____SEHostingView__visibility] = 0;
  *(void *)&v1[OBJC_IVAR____SEHostingView_handle] = 0;
  v5.uint64_t receiver = v1;
  v5.uint64_t super_class = (Class)type metadata accessor for _SEHostingView();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id _SEHostingView.__deallocating_deinit()
{
  v2.uint64_t receiver = v0;
  v2.uint64_t super_class = (Class)type metadata accessor for _SEHostingView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id _SEHostingUpdateCoordinator.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id _SEHostingUpdateCoordinator.init()()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = OBJC_IVAR____SEHostingUpdateCoordinator__commitLock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A596F88);
  uint64_t v3 = swift_allocObject();
  *(_DWORD *)(v3 + 16) = 0;
  *(void *)&v0[v2] = v3;
  uint64_t v4 = MEMORY[0x263F8EE88];
  *(void *)&v0[OBJC_IVAR____SEHostingUpdateCoordinator__commitLock_hostables] = MEMORY[0x263F8EE88];
  *(void *)&v0[OBJC_IVAR____SEHostingUpdateCoordinator__commitLock_hostingViews] = v4;
  v0[OBJC_IVAR____SEHostingUpdateCoordinator__commitLock_committed] = 0;
  objc_super v5 = self;
  id v6 = v0;
  id v7 = objc_msgSend(v5, sel_newFenceFromDefaultServer);
  *(void *)&v6[OBJC_IVAR____SEHostingUpdateCoordinator__fence] = v7;

  v9.uint64_t receiver = v6;
  v9.uint64_t super_class = ObjectType;
  return objc_msgSendSuper2(&v9, sel_init);
}

id _SEHostingUpdateCoordinator.__allocating_init(from:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_25C220AF4(a1);
  swift_unknownObjectRelease();
  return v4;
}

id _SEHostingUpdateCoordinator.init(from:)(uint64_t a1)
{
  id v1 = sub_25C220AF4(a1);
  swift_unknownObjectRelease();
  return v1;
}

id _SEHostingUpdateCoordinator.xpcRepresentation()()
{
  id result = *(id *)(v0 + OBJC_IVAR____SEHostingUpdateCoordinator__fence);
  if (result) {
    return objc_msgSend(result, sel_createXPCRepresentation);
  }
  return result;
}

uint64_t static _SEHostingUpdateCoordinator.supportsSecureCoding.getter()
{
  return 1;
}

id _SEHostingUpdateCoordinator.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_25C220BF8();

  return v4;
}

id _SEHostingUpdateCoordinator.init(coder:)(void *a1)
{
  id v2 = sub_25C220BF8();

  return v2;
}

Swift::Void __swiftcall _SEHostingUpdateCoordinator.encode(with:)(NSCoder with)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____SEHostingUpdateCoordinator__fence);
  id v4 = (id)sub_25C2219D8();
  [(objc_class *)with.super.isa encodeObject:v3 forKey:v4];
}

id _SEHostingUpdateCoordinator.__deallocating_deinit()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v2 = *(os_unfair_lock_s **)&v0[OBJC_IVAR____SEHostingUpdateCoordinator__commitLock];
  swift_retain();
  os_unfair_lock_lock(v2 + 4);
  sub_25C220CF0();
  os_unfair_lock_unlock(v2 + 4);
  swift_release();
  v4.uint64_t receiver = v0;
  v4.uint64_t super_class = ObjectType;
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

void _SEHostingUpdateCoordinator.add(_:)(char *a1)
{
  uint64_t v3 = (os_unfair_lock_s *)(*(void *)(v1 + OBJC_IVAR____SEHostingUpdateCoordinator__commitLock) + 16);
  os_unfair_lock_lock(v3);
  if (*(void *)(v1 + OBJC_IVAR____SEHostingUpdateCoordinator__fence)) {
    objc_msgSend(*(id *)&a1[OBJC_IVAR____SEHostable__context], sel_addFence_);
  }
  swift_beginAccess();
  sub_25C21F998(&v4, a1, (void (*)(void))type metadata accessor for _SEHostable, &qword_26A5971A8, (void (*)(void))type metadata accessor for _SEHostable);
  swift_endAccess();

  os_unfair_lock_unlock(v3);
}

void _SEHostingUpdateCoordinator.add(_:)(void *a1)
{
  uint64_t v3 = (os_unfair_lock_s *)(*(void *)(v1 + OBJC_IVAR____SEHostingUpdateCoordinator__commitLock) + 16);
  os_unfair_lock_lock(v3);
  id v4 = *(void **)(v1 + OBJC_IVAR____SEHostingUpdateCoordinator__fence);
  if (v4)
  {
    id v5 = v4;
    id v6 = objc_msgSend(a1, sel_window);
    id v7 = objc_msgSend(v6, sel__boundContext);

    objc_msgSend(v7, sel_addFence_, v5);
  }
  swift_beginAccess();
  sub_25C21F998(&v8, a1, (void (*)(void))type metadata accessor for _SEHostingView, &qword_26A5971A0, (void (*)(void))type metadata accessor for _SEHostingView);
  swift_endAccess();

  os_unfair_lock_unlock(v3);
}

Swift::Void __swiftcall _SEHostingUpdateCoordinator.commit()()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(v0 + OBJC_IVAR____SEHostingUpdateCoordinator__commitLock) + 16);
  os_unfair_lock_lock(v1);
  *(unsigned char *)(v0 + OBJC_IVAR____SEHostingUpdateCoordinator__commitLock_committed) = 1;
  id v2 = *(void **)(v0 + OBJC_IVAR____SEHostingUpdateCoordinator__fence);
  uint64_t v3 = &OBJC_PROTOCOL___RBSAssertionObserving;
  if (!v2) {
    goto LABEL_64;
  }
  id v4 = (uint64_t *)(v0 + OBJC_IVAR____SEHostingUpdateCoordinator__commitLock_hostables);
  swift_beginAccess();
  uint64_t v5 = *v4;
  uint64_t v46 = v1;
  if ((*v4 & 0xC000000000000001) != 0)
  {
    id v6 = v2;
    swift_bridgeObjectRetain();
    sub_25C221B48();
    type metadata accessor for _SEHostable();
    sub_25C2210B8(&qword_26A597120, v7, (void (*)(uint64_t))type metadata accessor for _SEHostable);
    sub_25C221A88();
    uint64_t v5 = v51;
    uint64_t v48 = v52;
    uint64_t v8 = v53;
    uint64_t v9 = v54;
    unint64_t v10 = v55;
  }
  else
  {
    uint64_t v11 = -1 << *(unsigned char *)(v5 + 32);
    uint64_t v48 = v5 + 56;
    uint64_t v8 = ~v11;
    uint64_t v12 = -v11;
    if (v12 < 64) {
      uint64_t v13 = ~(-1 << v12);
    }
    else {
      uint64_t v13 = -1;
    }
    unint64_t v10 = v13 & *(void *)(v5 + 56);
    id v14 = v2;
    swift_bridgeObjectRetain();
    uint64_t v9 = 0;
  }
  int64_t v15 = (unint64_t)(v8 + 64) >> 6;
  if (v5 < 0) {
    goto LABEL_11;
  }
  while (1)
  {
    if (v10)
    {
      uint64_t v16 = (v10 - 1) & v10;
      unint64_t v17 = __clz(__rbit64(v10)) | (v9 << 6);
      uint64_t v18 = v9;
      goto LABEL_28;
    }
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
LABEL_66:
      __break(1u);
      return;
    }
    if (v21 >= v15) {
      goto LABEL_31;
    }
    unint64_t v22 = *(void *)(v48 + 8 * v21);
    uint64_t v18 = v9 + 1;
    if (!v22)
    {
      uint64_t v18 = v9 + 2;
      if (v9 + 2 >= v15) {
        goto LABEL_31;
      }
      unint64_t v22 = *(void *)(v48 + 8 * v18);
      if (!v22)
      {
        uint64_t v18 = v9 + 3;
        if (v9 + 3 >= v15) {
          goto LABEL_31;
        }
        unint64_t v22 = *(void *)(v48 + 8 * v18);
        if (!v22)
        {
          uint64_t v18 = v9 + 4;
          if (v9 + 4 >= v15) {
            goto LABEL_31;
          }
          unint64_t v22 = *(void *)(v48 + 8 * v18);
          if (!v22) {
            break;
          }
        }
      }
    }
LABEL_27:
    uint64_t v16 = (v22 - 1) & v22;
    unint64_t v17 = __clz(__rbit64(v22)) + (v18 << 6);
LABEL_28:
    uint64_t v20 = (char *)*(id *)(*(void *)(v5 + 48) + 8 * v17);
    if (!v20) {
      goto LABEL_31;
    }
    while (1)
    {
      objc_msgSend(*(id *)&v20[OBJC_IVAR____SEHostable__context], sel_addFence_, v2);

      uint64_t v9 = v18;
      unint64_t v10 = v16;
      if ((v5 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_11:
      uint64_t v19 = sub_25C221B78();
      if (v19)
      {
        uint64_t v50 = (void *)v19;
        type metadata accessor for _SEHostable();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        uint64_t v20 = v56;
        swift_unknownObjectRelease();
        uint64_t v18 = v9;
        uint64_t v16 = v10;
        if (v56) {
          continue;
        }
      }
      goto LABEL_31;
    }
  }
  uint64_t v23 = v9 + 5;
  while (v15 != v23)
  {
    unint64_t v22 = *(void *)(v48 + 8 * v23++);
    if (v22)
    {
      uint64_t v18 = v23 - 1;
      goto LABEL_27;
    }
  }
LABEL_31:
  sub_25C21CAF4();
  uint64_t v24 = (unint64_t *)(v0 + OBJC_IVAR____SEHostingUpdateCoordinator__commitLock_hostingViews);
  swift_beginAccess();
  unint64_t v25 = *v24;
  if ((*v24 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_25C221B48();
    type metadata accessor for _SEHostingView();
    sub_25C2210B8((unint64_t *)&unk_26A597128, v26, (void (*)(uint64_t))type metadata accessor for _SEHostingView);
    sub_25C221A88();
    unint64_t v25 = (unint64_t)v56;
    uint64_t v49 = v57;
    uint64_t v27 = v58;
    uint64_t v28 = v59;
    unint64_t v29 = v60;
  }
  else
  {
    uint64_t v30 = -1 << *(unsigned char *)(v25 + 32);
    uint64_t v49 = (char *)(v25 + 56);
    uint64_t v27 = ~v30;
    uint64_t v31 = -v30;
    if (v31 < 64) {
      uint64_t v32 = ~(-1 << v31);
    }
    else {
      uint64_t v32 = -1;
    }
    unint64_t v29 = v32 & *(void *)(v25 + 56);
    swift_bridgeObjectRetain();
    uint64_t v28 = 0;
  }
  int64_t v47 = (unint64_t)(v27 + 64) >> 6;
  while (2)
  {
    if ((v25 & 0x8000000000000000) != 0)
    {
      if (!sub_25C221B78()) {
        goto LABEL_63;
      }
      type metadata accessor for _SEHostingView();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      id v36 = v50;
      swift_unknownObjectRelease();
      uint64_t v35 = v28;
      uint64_t v33 = v29;
      if (!v50) {
        goto LABEL_63;
      }
      goto LABEL_60;
    }
    if (v29)
    {
      uint64_t v33 = (v29 - 1) & v29;
      unint64_t v34 = __clz(__rbit64(v29)) | (v28 << 6);
      uint64_t v35 = v28;
LABEL_59:
      id v36 = *(id *)(*(void *)(v25 + 48) + 8 * v34);
      if (!v36) {
        goto LABEL_63;
      }
LABEL_60:
      id v40 = objc_msgSend(v36, sel_window);
      if (v40)
      {
        uint64_t v41 = v40;
        id v42 = objc_msgSend(v40, sel__boundContext);

        if (v42)
        {
          objc_msgSend(v42, sel_addFence_, v2);
        }
      }

      uint64_t v28 = v35;
      unint64_t v29 = v33;
      continue;
    }
    break;
  }
  int64_t v37 = v28 + 1;
  if (__OFADD__(v28, 1)) {
    goto LABEL_66;
  }
  if (v37 >= v47) {
    goto LABEL_63;
  }
  unint64_t v38 = *(void *)&v49[8 * v37];
  uint64_t v35 = v28 + 1;
  if (v38) {
    goto LABEL_58;
  }
  uint64_t v35 = v28 + 2;
  if (v28 + 2 >= v47) {
    goto LABEL_63;
  }
  unint64_t v38 = *(void *)&v49[8 * v35];
  if (v38) {
    goto LABEL_58;
  }
  uint64_t v35 = v28 + 3;
  if (v28 + 3 >= v47) {
    goto LABEL_63;
  }
  unint64_t v38 = *(void *)&v49[8 * v35];
  if (v38) {
    goto LABEL_58;
  }
  uint64_t v35 = v28 + 4;
  if (v28 + 4 >= v47) {
    goto LABEL_63;
  }
  unint64_t v38 = *(void *)&v49[8 * v35];
  if (v38)
  {
LABEL_58:
    uint64_t v33 = (v38 - 1) & v38;
    unint64_t v34 = __clz(__rbit64(v38)) + (v35 << 6);
    goto LABEL_59;
  }
  uint64_t v39 = v28 + 5;
  while (v47 != v39)
  {
    unint64_t v38 = *(void *)&v49[8 * v39++];
    if (v38)
    {
      uint64_t v35 = v39 - 1;
      goto LABEL_58;
    }
  }
LABEL_63:
  sub_25C21CAF4();

  uint64_t v1 = v46;
  uint64_t v3 = &OBJC_PROTOCOL___RBSAssertionObserving;
LABEL_64:
  int v43 = (void *)(v0 + OBJC_IVAR____SEHostingUpdateCoordinator__commitLock_hostables);
  swift_beginAccess();
  uint64_t v44 = MEMORY[0x263F8EE88];
  *int v43 = MEMORY[0x263F8EE88];
  swift_bridgeObjectRelease();
  id v45 = (void *)((char *)v3[3].opt_class_meths + v0);
  swift_beginAccess();
  *id v45 = v44;
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_invalidate);
  os_unfair_lock_unlock(v1);
}

unint64_t sub_25C21F230(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5971C0);
  uint64_t v2 = sub_25C221C68();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_25C220FA4(v6, (uint64_t)&v15, &qword_26A5971C8);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_25C21F560(v15, v16, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_25C21F37C);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_25C21CAE4(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
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

unint64_t sub_25C21F37C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_25C221CC8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_25C221CC8() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_25C221CC8()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

unint64_t sub_25C21F4C4(uint64_t a1)
{
  sub_25C2216F8();
  sub_25C2210B8(&qword_26A596E00, 255, MEMORY[0x263F07508]);
  uint64_t v2 = sub_25C2219B8();
  return sub_25C21F628(a1, v2);
}

uint64_t sub_25C21F560(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  sub_25C221D58();
  sub_25C2219F8();
  uint64_t v5 = sub_25C221D78();
  return a3(a1, a2, v5);
}

unint64_t sub_25C21F5E4(uint64_t a1)
{
  uint64_t v2 = sub_25C221B88();
  return sub_25C21F8D0(a1, v2);
}

unint64_t sub_25C21F628(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_25C2216F8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    BOOL v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    uint64_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_25C2210B8((unint64_t *)&unk_26A5971F0, 255, MEMORY[0x263F07508]);
      char v15 = sub_25C2219C8();
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

unint64_t sub_25C21F7EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25C221CC8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_25C221CC8() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_25C21F8D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_25C221008(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x2611807F0](v9, a1);
      sub_25C221064((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_25C21F998(void *a1, void *a2, void (*a3)(void), uint64_t *a4, void (*a5)(void))
{
  uint64_t v9 = v5;
  uint64_t v12 = *v5;
  if ((*v5 & 0xC000000000000001) != 0)
  {
    if (v12 < 0) {
      uint64_t v13 = *v5;
    }
    else {
      uint64_t v13 = v12 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v14 = a2;
    uint64_t v15 = sub_25C221B68();

    if (v15)
    {
      swift_bridgeObjectRelease();

      a3();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v37;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_25C221B58();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v27 = sub_25C21FC4C(v13, result + 1, a4, a5);
    uint64_t v38 = v27;
    unint64_t v28 = *(void *)(v27 + 16);
    if (*(void *)(v27 + 24) <= v28)
    {
      uint64_t v33 = v28 + 1;
      id v34 = v14;
      sub_25C21FE44(v33, a4);
      uint64_t v29 = v38;
    }
    else
    {
      uint64_t v29 = v27;
      id v30 = v14;
    }
    sub_25C2200E0((uint64_t)v14, v29);
    *uint64_t v9 = v29;
    swift_bridgeObjectRelease();
    *a1 = v14;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_25C221AD8();
    uint64_t v18 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v19 = v17 & ~v18;
    if ((*(void *)(v12 + 56 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19))
    {
      ((void (*)(uint64_t))a3)(v17);
      id v20 = *(id *)(*(void *)(v12 + 48) + 8 * v19);
      char v21 = sub_25C221AE8();

      if (v21)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        unint64_t v25 = *(void **)(*(void *)(*v5 + 48) + 8 * v19);
        *a1 = v25;
        id v26 = v25;
        return 0;
      }
      uint64_t v22 = ~v18;
      while (1)
      {
        unint64_t v19 = (v19 + 1) & v22;
        if (((*(void *)(v12 + 56 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19) & 1) == 0) {
          break;
        }
        id v23 = *(id *)(*(void *)(v12 + 48) + 8 * v19);
        char v24 = sub_25C221AE8();

        if (v24) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v39 = *v5;
    *uint64_t v5 = 0x8000000000000000;
    id v32 = a2;
    sub_25C220164((uint64_t)v32, v19, isUniquelyReferenced_nonNull_native, a4, a5);
    *uint64_t v5 = v39;
    swift_bridgeObjectRelease();
    *a1 = v32;
  }
  return 1;
}

uint64_t sub_25C21FC4C(uint64_t a1, uint64_t a2, uint64_t *a3, void (*a4)(void))
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(a3);
    uint64_t v6 = sub_25C221BD8();
    uint64_t v19 = v6;
    sub_25C221B48();
    if (sub_25C221B78())
    {
      a4();
      do
      {
        swift_dynamicCast();
        uint64_t v6 = v19;
        unint64_t v13 = *(void *)(v19 + 16);
        if (*(void *)(v19 + 24) <= v13)
        {
          sub_25C21FE44(v13 + 1, a3);
          uint64_t v6 = v19;
        }
        uint64_t result = sub_25C221AD8();
        uint64_t v8 = v6 + 56;
        uint64_t v9 = -1 << *(unsigned char *)(v6 + 32);
        unint64_t v10 = result & ~v9;
        unint64_t v11 = v10 >> 6;
        if (((-1 << v10) & ~*(void *)(v6 + 56 + 8 * (v10 >> 6))) != 0)
        {
          unint64_t v12 = __clz(__rbit64((-1 << v10) & ~*(void *)(v6 + 56 + 8 * (v10 >> 6)))) | v10 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v14 = 0;
          unint64_t v15 = (unint64_t)(63 - v9) >> 6;
          do
          {
            if (++v11 == v15 && (v14 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v16 = v11 == v15;
            if (v11 == v15) {
              unint64_t v11 = 0;
            }
            v14 |= v16;
            uint64_t v17 = *(void *)(v8 + 8 * v11);
          }
          while (v17 == -1);
          unint64_t v12 = __clz(__rbit64(~v17)) + (v11 << 6);
        }
        *(void *)(v8 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
        *(void *)(*(void *)(v6 + 48) + 8 * v12) = v18;
        ++*(void *)(v6 + 16);
      }
      while (sub_25C221B78());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  return v6;
}

uint64_t sub_25C21FE44(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v5 = sub_25C221BC8();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    id v30 = v2;
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v4 + 56);
    int64_t v11 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v12 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v14 << 6);
      }
      else
      {
        int64_t v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v11) {
          goto LABEL_33;
        }
        unint64_t v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          int64_t v14 = v18 + 1;
          if (v18 + 1 >= v11) {
            goto LABEL_33;
          }
          unint64_t v19 = v8[v14];
          if (!v19)
          {
            int64_t v14 = v18 + 2;
            if (v18 + 2 >= v11) {
              goto LABEL_33;
            }
            unint64_t v19 = v8[v14];
            if (!v19)
            {
              int64_t v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_33:
                swift_release();
                uint64_t v3 = v30;
                uint64_t v29 = 1 << *(unsigned char *)(v4 + 32);
                if (v29 > 63) {
                  bzero((void *)(v4 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v8 = -1 << v29;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  int64_t v14 = v20 + 1;
                  if (__OFADD__(v20, 1)) {
                    goto LABEL_39;
                  }
                  if (v14 >= v11) {
                    goto LABEL_33;
                  }
                  unint64_t v19 = v8[v14];
                  ++v20;
                  if (v19) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v14 = v20;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      uint64_t v21 = *(void *)(*(void *)(v4 + 48) + 8 * v17);
      uint64_t result = sub_25C221AD8();
      uint64_t v22 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v28 = *(void *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(void *)(*(void *)(v6 + 48) + 8 * v15) = v21;
      ++*(void *)(v6 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v6;
  return result;
}

unint64_t sub_25C2200E0(uint64_t a1, uint64_t a2)
{
  sub_25C221AD8();
  unint64_t result = sub_25C221B38();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

void sub_25C220164(uint64_t a1, unint64_t a2, char a3, uint64_t *a4, void (*a5)(void))
{
  unint64_t v9 = *(void *)(*v5 + 16);
  unint64_t v10 = *(void *)(*v5 + 24);
  if (v10 > v9 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t v11 = v9 + 1;
  if (a3)
  {
    sub_25C21FE44(v11, a4);
  }
  else
  {
    if (v10 > v9)
    {
      sub_25C2202EC(a4);
      goto LABEL_14;
    }
    sub_25C220490(v11, a4);
  }
  uint64_t v12 = *v5;
  uint64_t v13 = sub_25C221AD8();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    a5();
    id v15 = *(id *)(*(void *)(v12 + 48) + 8 * a2);
    char v16 = sub_25C221AE8();

    if (v16)
    {
LABEL_13:
      sub_25C221CE8();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v14;
      while (1)
      {
        a2 = (a2 + 1) & v17;
        if (((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v18 = *(id *)(*(void *)(v12 + 48) + 8 * a2);
        char v19 = sub_25C221AE8();

        if (v19) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v20 + 48) + 8 * a2) = a1;
  uint64_t v21 = *(void *)(v20 + 16);
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v23;
  }
}

id sub_25C2202EC(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_25C221BB8();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  id result = (id)(v4 + 56);
  uint64_t v7 = v3 + 56;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 56 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 56), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 56);
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
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v19 >= v14) {
      goto LABEL_28;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v20 = *(void *)(v7 + 8 * v10);
      if (!v20)
      {
        int64_t v10 = v19 + 2;
        if (v19 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v20 = *(void *)(v7 + 8 * v10);
        if (!v20) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 8 * v16;
    id v18 = *(void **)(*(void *)(v3 + 48) + v17);
    *(void *)(*(void *)(v5 + 48) + v17) = v18;
    id result = v18;
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v14) {
    goto LABEL_28;
  }
  unint64_t v20 = *(void *)(v7 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_28;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_25C220490(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v5 = sub_25C221BC8();
  uint64_t v6 = v5;
  if (!*(void *)(v4 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v3 = v6;
    return result;
  }
  uint64_t v29 = v2;
  uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v8 = v4 + 56;
  if (v7 < 64) {
    uint64_t v9 = ~(-1 << v7);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v4 + 56);
  int64_t v11 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v12 = v5 + 56;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_24;
    }
    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v18 >= v11) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v19 = *(void *)(v8 + 8 * v14);
      if (!v19)
      {
        int64_t v14 = v18 + 2;
        if (v18 + 2 >= v11) {
          goto LABEL_33;
        }
        unint64_t v19 = *(void *)(v8 + 8 * v14);
        if (!v19) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
    id v21 = *(id *)(*(void *)(v4 + 48) + 8 * v17);
    uint64_t result = sub_25C221AD8();
    uint64_t v22 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v28 = *(void *)(v12 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(void *)(*(void *)(v6 + 48) + 8 * v15) = v21;
    ++*(void *)(v6 + 16);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v3 = v29;
    goto LABEL_35;
  }
  unint64_t v19 = *(void *)(v8 + 8 * v20);
  if (v19)
  {
    int64_t v14 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v14 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v14 >= v11) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v14);
    ++v20;
    if (v19) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

id sub_25C220708(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v1[OBJC_IVAR____SEHostable__context] = a1;
  id v4 = objc_allocWithZone(MEMORY[0x263F29BD8]);
  uint64_t v5 = v1;
  id v6 = a1;
  id v7 = objc_msgSend(v4, sel_init);
  *(void *)&v5[OBJC_IVAR____SEHostable__invalidationSignal] = v7;
  LODWORD(v4) = getpid();
  LODWORD(v6) = objc_msgSend(v6, sel_contextId);
  uint64_t v8 = (objc_class *)type metadata accessor for _SEHostingHandle();
  uint64_t v9 = (char *)objc_allocWithZone(v8);
  *(_DWORD *)&v9[OBJC_IVAR____SEHostingHandle_pid] = v4;
  *(_DWORD *)&v9[OBJC_IVAR____SEHostingHandle_contextID] = v6;
  v12.uint64_t receiver = v9;
  v12.uint64_t super_class = v8;
  *(void *)&v5[OBJC_IVAR____SEHostable_handle] = objc_msgSendSuper2(&v12, sel_init);

  v11.uint64_t receiver = v5;
  v11.uint64_t super_class = ObjectType;
  return objc_msgSendSuper2(&v11, sel_init);
}

uint64_t sub_25C220804()
{
  uint64_t v0 = sub_25C221648();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = self;
  uint64_t v5 = (void *)sub_25C221998();
  id v6 = objc_msgSend(v4, sel_remoteContextWithOptions_, v5);

  if (v6)
  {
    id v7 = objc_allocWithZone((Class)type metadata accessor for _SEHostable());
    id v8 = sub_25C220708(v6);

    return (uint64_t)v8;
  }
  else
  {
    v10[3] = 1;
    sub_25C21F230(MEMORY[0x263F8EE78]);
    sub_25C2210B8(&qword_26A5971B8, 255, MEMORY[0x263F06080]);
    sub_25C221658();
    sub_25C221638();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return swift_willThrow();
  }
}

uint64_t sub_25C2209DC()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5971D0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25C222A00;
  sub_25C2219E8();
  swift_bridgeObjectRetain();
  uint64_t result = sub_25C221BA8();
  if (*MEMORY[0x263EFFB40])
  {
    id v2 = (id)*MEMORY[0x263EFFB40];
    swift_bridgeObjectRelease();
    type metadata accessor for CFBoolean(0);
    *(void *)(inited + 96) = v3;
    *(void *)(inited + 72) = v2;
    sub_25C21CE00(inited);
    uint64_t v4 = sub_25C220804();
    swift_bridgeObjectRelease();
    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for _SEHostingView()
{
  return self;
}

id sub_25C220AF4(uint64_t a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____SEHostingUpdateCoordinator__commitLock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A596F88);
  uint64_t v5 = swift_allocObject();
  *(_DWORD *)(v5 + 16) = 0;
  *(void *)&v1[v4] = v5;
  uint64_t v6 = MEMORY[0x263F8EE88];
  *(void *)&v1[OBJC_IVAR____SEHostingUpdateCoordinator__commitLock_hostables] = MEMORY[0x263F8EE88];
  *(void *)&v1[OBJC_IVAR____SEHostingUpdateCoordinator__commitLock_hostingViews] = v6;
  v1[OBJC_IVAR____SEHostingUpdateCoordinator__commitLock_committed] = 0;
  if (a1)
  {
    id v7 = self;
    id v8 = v1;
    id v9 = objc_msgSend(v7, sel_handleFromXPCRepresentation_, a1);
    *(void *)&v8[OBJC_IVAR____SEHostingUpdateCoordinator__fence] = v9;
  }
  else
  {
    *(void *)&v1[OBJC_IVAR____SEHostingUpdateCoordinator__fence] = 0;
  }
  v11.uint64_t receiver = v1;
  v11.uint64_t super_class = ObjectType;
  return objc_msgSendSuper2(&v11, sel_init);
}

id sub_25C220BF8()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = OBJC_IVAR____SEHostingUpdateCoordinator__commitLock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A596F88);
  uint64_t v3 = swift_allocObject();
  *(_DWORD *)(v3 + 16) = 0;
  *(void *)&v0[v2] = v3;
  uint64_t v4 = MEMORY[0x263F8EE88];
  *(void *)&v0[OBJC_IVAR____SEHostingUpdateCoordinator__commitLock_hostables] = MEMORY[0x263F8EE88];
  *(void *)&v0[OBJC_IVAR____SEHostingUpdateCoordinator__commitLock_hostingViews] = v4;
  v0[OBJC_IVAR____SEHostingUpdateCoordinator__commitLock_committed] = 0;
  sub_25C20D014(0, &qword_26A5971B0);
  uint64_t v5 = v0;
  *(void *)&v5[OBJC_IVAR____SEHostingUpdateCoordinator__fence] = sub_25C221AC8();

  v7.uint64_t receiver = v5;
  v7.uint64_t super_class = ObjectType;
  return objc_msgSendSuper2(&v7, sel_init);
}

uint64_t sub_25C220CF0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t type metadata accessor for _SEHostable()
{
  return self;
}

id sub_25C220D3C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*(id *)(*a1 + OBJC_IVAR____SEHostable__context), sel_layer);
  *a2 = result;
  return result;
}

id sub_25C220D84(void *a1, void *a2)
{
  return objc_msgSend(*(id *)(*a2 + OBJC_IVAR____SEHostable__context), sel_setLayer_, *a1);
}

id sub_25C220DA8@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = (void **)(*a1 + OBJC_IVAR____SEHostingView_handle);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t type metadata accessor for _SEHostingHandle()
{
  return self;
}

uint64_t method lookup function for _SEHostingHandle(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for _SEHostingHandle);
}

uint64_t dispatch thunk of _SEHostingHandle.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of _SEHostingHandle.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t method lookup function for _SEHostable(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for _SEHostable);
}

uint64_t method lookup function for _SEHostingView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for _SEHostingView);
}

uint64_t dispatch thunk of _SEHostingView.handle.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of _SEHostingView.handle.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of _SEHostingView.handle.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t type metadata accessor for _SEHostingUpdateCoordinator()
{
  return self;
}

uint64_t method lookup function for _SEHostingUpdateCoordinator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for _SEHostingUpdateCoordinator);
}

uint64_t dispatch thunk of _SEHostingUpdateCoordinator.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of _SEHostingUpdateCoordinator.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t sub_25C220FA4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25C221008(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_25C221064(uint64_t a1)
{
  return a1;
}

uint64_t sub_25C2210B8(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25C221100(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0x800000025C2236C0;
  int v3 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v4 = 0xD000000000000020;
    }
    else {
      unint64_t v4 = 0xD000000000000024;
    }
    if (v3 == 1) {
      unint64_t v5 = 0x800000025C2236F0;
    }
    else {
      unint64_t v5 = 0x800000025C223720;
    }
    int v6 = a2;
    if (a2)
    {
LABEL_9:
      if (v6 == 1) {
        unint64_t v7 = 0xD000000000000020;
      }
      else {
        unint64_t v7 = 0xD000000000000024;
      }
      if (v6 == 1) {
        unint64_t v2 = 0x800000025C2236F0;
      }
      else {
        unint64_t v2 = 0x800000025C223720;
      }
      if (v4 != v7) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xD000000000000027;
    unint64_t v5 = 0x800000025C2236C0;
    int v6 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  if (v4 != 0xD000000000000027)
  {
LABEL_21:
    char v8 = sub_25C221CC8();
    goto LABEL_22;
  }
LABEL_19:
  if (v5 != v2) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25C221200()
{
  return sub_25C221D78();
}

uint64_t sub_25C2212A8()
{
  sub_25C2219F8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C221338()
{
  return sub_25C221D78();
}

uint64_t _LockdownVersion.rawValue.getter()
{
  return 3157553;
}

unint64_t sub_25C2213F4()
{
  unint64_t result = qword_26A597260;
  if (!qword_26A597260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A597260);
  }
  return result;
}

uint64_t sub_25C221454@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_25C221C88();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_25C2214A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = _LockdownVersion.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unsigned char *storeEnumTagSinglePayload for _LockdownVersion(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x25C22156CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25C221594()
{
  return sub_25C221D78();
}

uint64_t sub_25C2215DC()
{
  return sub_25C221D78();
}

uint64_t sub_25C221628()
{
  return sub_25C2219F8();
}

uint64_t sub_25C221638()
{
  return MEMORY[0x270EEDB78]();
}

uint64_t sub_25C221648()
{
  return MEMORY[0x270EEDB90]();
}

uint64_t sub_25C221658()
{
  return MEMORY[0x270EEF800]();
}

uint64_t sub_25C221668()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_25C221678()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25C221688()
{
  return MEMORY[0x270EEFA78]();
}

uint64_t sub_25C221698()
{
  return MEMORY[0x270EEFC48]();
}

uint64_t sub_25C2216A8()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_25C2216B8()
{
  return MEMORY[0x270EEFD58]();
}

uint64_t sub_25C2216C8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25C2216D8()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_25C2216E8()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25C2216F8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25C221708()
{
  return MEMORY[0x270EEB720]();
}

uint64_t _s17ServiceExtensions11_GPUProcessV10invalidateyyF_0()
{
  return MEMORY[0x270EEB728]();
}

uint64_t sub_25C221728()
{
  return MEMORY[0x270EEB730]();
}

uint64_t sub_25C221738()
{
  return MEMORY[0x270EEB738]();
}

uint64_t sub_25C221748()
{
  return MEMORY[0x270EEB740]();
}

uint64_t sub_25C221758()
{
  return MEMORY[0x270EEB748]();
}

uint64_t sub_25C221768()
{
  return MEMORY[0x270EEB750]();
}

uint64_t sub_25C221778()
{
  return MEMORY[0x270EEB758]();
}

uint64_t sub_25C221798()
{
  return MEMORY[0x270EEB768]();
}

uint64_t sub_25C2217A8()
{
  return MEMORY[0x270EEB770]();
}

uint64_t sub_25C2217B8()
{
  return MEMORY[0x270EEB778]();
}

uint64_t sub_25C2217C8()
{
  return MEMORY[0x270EEB780]();
}

uint64_t _s17ServiceExtensions11_GPUProcessV7isValidSbvg_0()
{
  return MEMORY[0x270EEB788]();
}

uint64_t sub_25C2217E8()
{
  return MEMORY[0x270EEB798]();
}

uint64_t sub_25C2217F8()
{
  return MEMORY[0x270EEB7A0]();
}

uint64_t sub_25C221808()
{
  return MEMORY[0x270EEB7A8]();
}

uint64_t sub_25C221818()
{
  return MEMORY[0x270EEB7C0]();
}

uint64_t sub_25C221828()
{
  return MEMORY[0x270F5CFC0]();
}

uint64_t _s17ServiceExtensions15_BrowserProcessV17processIdentifiers5Int32Vvg_0()
{
  return MEMORY[0x270F5CFC8]();
}

uint64_t sub_25C221848()
{
  return MEMORY[0x270F5CFD0]();
}

uint64_t sub_25C221858()
{
  return MEMORY[0x270F5CFD8]();
}

uint64_t sub_25C221868()
{
  return MEMORY[0x270F5CFE0]();
}

uint64_t sub_25C221878()
{
  return MEMORY[0x270F5CFE8]();
}

uint64_t sub_25C221888()
{
  return MEMORY[0x270F5CFF0]();
}

uint64_t sub_25C221898()
{
  return MEMORY[0x270FA1750]();
}

uint64_t sub_25C2218A8()
{
  return MEMORY[0x270FA1800]();
}

uint64_t sub_25C2218B8()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_25C2218C8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25C2218D8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25C2218E8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25C2218F8()
{
  return MEMORY[0x270FA1A08]();
}

uint64_t sub_25C221908()
{
  return MEMORY[0x270FA1A48]();
}

uint64_t sub_25C221918()
{
  return MEMORY[0x270FA08E0]();
}

uint64_t sub_25C221928()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_25C221938()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_25C221948()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_25C221958()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_25C221968()
{
  return MEMORY[0x270FA0B60]();
}

uint64_t sub_25C221978()
{
  return MEMORY[0x270FA0B98]();
}

uint64_t sub_25C221988()
{
  return MEMORY[0x270FA0BB0]();
}

uint64_t sub_25C221998()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25C2219A8()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25C2219B8()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_25C2219C8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25C2219D8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25C2219E8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25C2219F8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25C221A08()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25C221A18()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25C221A28()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25C221A38()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25C221A48()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25C221A58()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25C221A68()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25C221A78()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_25C221A88()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_25C221A98()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25C221AA8()
{
  return MEMORY[0x270FA0C90]();
}

uint64_t sub_25C221AB8()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_25C221AC8()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_25C221AD8()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_25C221AE8()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_25C221AF8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25C221B08()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25C221B18()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25C221B28()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_25C221B38()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_25C221B48()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_25C221B58()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_25C221B68()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_25C221B78()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_25C221B88()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_25C221B98()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_25C221BA8()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_25C221BB8()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25C221BC8()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25C221BD8()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_25C221BE8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25C221BF8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25C221C08()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25C221C18()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25C221C28()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25C221C38()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_25C221C48()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25C221C58()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25C221C68()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25C221C78()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25C221C88()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25C221C98()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25C221CA8()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_25C221CB8()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t sub_25C221CC8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25C221CD8()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_25C221CE8()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25C221CF8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25C221D08()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25C221D18()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25C221D28()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25C221D38()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25C221D48()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_25C221D58()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25C221D68()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25C221D78()
{
  return MEMORY[0x270F9FC90]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x270F98178](atoken);
}

void bzero(void *a1, size_t a2)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t sandbox_enable_local_state_flag()
{
  return MEMORY[0x270EDB2B0]();
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x270FA0290]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x270FA0618]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x270FA0620]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x270EDC058](xdict);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}