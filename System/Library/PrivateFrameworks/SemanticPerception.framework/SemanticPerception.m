Swift::Void __swiftcall SPPeriodicTaskScheduler.registerForPeriodicContextLogging()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  void *v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  char *v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  id v39;
  void *v40;
  char *v41;
  id v42;
  id v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id aBlock[7];

  aBlock[6] = *(id *)MEMORY[0x263EF8340];
  v0 = sub_25BF12500();
  v53 = *(void *)(v0 - 8);
  v54 = v0;
  v1 = MEMORY[0x270FA5388](v0);
  v52 = (char *)&v50 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = MEMORY[0x270FA5388](v1);
  v5 = (char *)&v50 - v4;
  v6 = MEMORY[0x270FA5388](v3);
  v51 = (char *)&v50 - v7;
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v50 - v8;
  v10 = self;
  v11 = objc_msgSend(v10, sel_sharedScheduler);
  v12 = (void *)sub_25BF12510();
  aBlock[4] = sub_25BF1161C;
  aBlock[5] = 0;
  aBlock[0] = (id)MEMORY[0x263EF8330];
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_25BF11B94;
  aBlock[3] = &block_descriptor;
  v13 = _Block_copy(aBlock);
  v14 = objc_msgSend(v11, sel_registerForTaskWithIdentifier_usingQueue_launchHandler_, v12, 0, v13);
  _Block_release(v13);

  if (v14)
  {
    v15 = objc_msgSend(v10, sel_sharedScheduler);
    v16 = (void *)sub_25BF12510();
    v17 = objc_msgSend(v15, sel_taskRequestForIdentifier_, v16);

    if (v17)
    {
      sub_25BF124F0();
      v18 = v17;
      v19 = sub_25BF124E0();
      v20 = sub_25BF12550();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = (uint8_t *)swift_slowAlloc();
        v22 = (void *)swift_slowAlloc();
        aBlock[0] = v22;
        *(_DWORD *)v21 = 136315138;
        v52 = (char *)(v21 + 4);
        v23 = objc_msgSend(v18, sel_identifier);
        v24 = sub_25BF12520();
        v26 = v25;

        v55 = sub_25BF11D48(v24, v26, (uint64_t *)aBlock);
        sub_25BF12560();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25BF0F000, v19, v20, "On-screen context refresh (%s) was already scheduled with dasd", v21, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x261178980](v22, -1, -1);
        MEMORY[0x261178980](v21, -1, -1);
      }
      else
      {
      }
      (*(void (**)(char *, uint64_t))(v53 + 8))(v9, v54);
    }
    else
    {
      v30 = objc_msgSend(v10, sel_sharedScheduler);
      v31 = objc_allocWithZone(MEMORY[0x263F298E8]);
      v32 = (void *)sub_25BF12510();
      v33 = objc_msgSend(v31, sel_initWithIdentifier_, v32);

      objc_msgSend(v33, sel_setPriority_, 2);
      objc_msgSend(v33, sel_setInterval_, 300.0);
      objc_msgSend(v33, sel_setMinDurationBetweenInstances_, 15.0);
      objc_msgSend(v33, sel_setRequiresProtectionClass_, 3);
      aBlock[0] = 0;
      LODWORD(v31) = objc_msgSend(v30, sel_submitTaskRequest_error_, v33, aBlock);

      if (v31)
      {
        v34 = aBlock[0];
        v35 = v51;
        sub_25BF124F0();
        v36 = sub_25BF124E0();
        v37 = sub_25BF12550();
        if (os_log_type_enabled(v36, v37))
        {
          v38 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v38 = 0;
          _os_log_impl(&dword_25BF0F000, v36, v37, "Scheduled on-screen context refresh with dasd", v38, 2u);
          MEMORY[0x261178980](v38, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v53 + 8))(v35, v54);
      }
      else
      {
        v39 = aBlock[0];
        v40 = (void *)sub_25BF124D0();

        swift_willThrow();
        v41 = v52;
        sub_25BF124F0();
        v42 = v40;
        v43 = v40;
        v44 = sub_25BF124E0();
        v45 = sub_25BF12540();
        if (os_log_type_enabled(v44, v45))
        {
          v46 = (uint8_t *)swift_slowAlloc();
          v47 = (void *)swift_slowAlloc();
          *(_DWORD *)v46 = 138412290;
          v48 = v40;
          v49 = (void *)_swift_stdlib_bridgeErrorToNSError();
          aBlock[0] = v49;
          sub_25BF12560();
          *v47 = v49;

          _os_log_impl(&dword_25BF0F000, v44, v45, "Failed to register on-screen context refresh with dasd due to error: %@", v46, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A583930);
          swift_arrayDestroy();
          MEMORY[0x261178980](v47, -1, -1);
          MEMORY[0x261178980](v46, -1, -1);
        }
        else
        {
        }
        (*(void (**)(char *, uint64_t))(v53 + 8))(v41, v54);
      }
    }
  }
  else
  {
    sub_25BF124F0();
    v27 = sub_25BF124E0();
    v28 = sub_25BF12540();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_25BF0F000, v27, v28, "Could not register on-screen context refresh with dasd", v29, 2u);
      MEMORY[0x261178980](v29, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v53 + 8))(v5, v54);
  }
}

id sub_25BF1161C(void *a1)
{
  v42[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = sub_25BF12500();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  v9 = (char *)&v39 - v8;
  MEMORY[0x270FA5388](v7);
  v11 = (char *)&v39 - v10;
  sub_25BF124F0();
  v12 = sub_25BF124E0();
  os_log_type_t v13 = sub_25BF12550();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_25BF0F000, v12, v13, "Performing on-screen context refresh", v14, 2u);
    MEMORY[0x261178980](v14, -1, -1);
  }

  v15 = *(void (**)(char *, uint64_t))(v3 + 8);
  v15(v11, v2);
  id v16 = objc_msgSend(self, sel_clientWithDefaultRequestType_, 10);
  id v17 = objc_msgSend(v16, sel_newRequest);
  objc_msgSend(v17, sel_setIncludeStructuredExtractionResults_, 1);
  objc_msgSend(v17, sel_setIncludeRequestInResponse_, 1);
  objc_msgSend(v17, sel_setDebug_, 1);

  id v18 = objc_msgSend(self, sel_sharedScheduler);
  id v19 = objc_allocWithZone(MEMORY[0x263F298E8]);
  v20 = (void *)sub_25BF12510();
  id v21 = objc_msgSend(v19, sel_initWithIdentifier_, v20);

  objc_msgSend(v21, sel_setPriority_, 2);
  objc_msgSend(v21, sel_setInterval_, 300.0);
  objc_msgSend(v21, sel_setMinDurationBetweenInstances_, 15.0);
  objc_msgSend(v21, sel_setRequiresProtectionClass_, 3);
  v42[0] = 0;
  LODWORD(v20) = objc_msgSend(v18, sel_submitTaskRequest_error_, v21, v42);

  if (v20)
  {
    id v22 = v42[0];
    sub_25BF124F0();
    v23 = sub_25BF124E0();
    os_log_type_t v24 = sub_25BF12550();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_25BF0F000, v23, v24, "Scheduled on-screen context refresh with dasd", v25, 2u);
      MEMORY[0x261178980](v25, -1, -1);
    }
  }
  else
  {
    id v26 = v42[0];
    v27 = (void *)sub_25BF124D0();

    swift_willThrow();
    sub_25BF124F0();
    id v28 = v27;
    id v29 = v27;
    v30 = sub_25BF124E0();
    int v31 = sub_25BF12540();
    if (os_log_type_enabled(v30, (os_log_type_t)v31))
    {
      v32 = (uint8_t *)swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      v40 = v15;
      v34 = (void *)v33;
      v41 = a1;
      *(_DWORD *)v32 = 138412290;
      v39 = v6;
      id v35 = v27;
      v36 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v42[0] = v36;
      a1 = v41;
      sub_25BF12560();
      void *v34 = v36;

      _os_log_impl(&dword_25BF0F000, v30, (os_log_type_t)v31, "Failed to register on-screen context refresh with dasd due to error: %@", v32, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A583930);
      swift_arrayDestroy();
      v37 = v34;
      v15 = v40;
      MEMORY[0x261178980](v37, -1, -1);
      MEMORY[0x261178980](v32, -1, -1);

      v9 = v39;
    }
    else
    {

      v9 = v6;
    }
  }
  v15(v9, v2);
  return objc_msgSend(a1, sel_setTaskCompleted);
}

void sub_25BF11B94(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
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

Swift::Void __swiftcall SPPeriodicTaskScheduler.ping()()
{
  uint64_t v0 = sub_25BF12500();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25BF124F0();
  id v4 = sub_25BF124E0();
  os_log_type_t v5 = sub_25BF12550();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_25BF0F000, v4, v5, "pong", v6, 2u);
    MEMORY[0x261178980](v6, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_25BF11D48(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25BF11E1C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25BF12444((uint64_t)v12, *a3);
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
      sub_25BF12444((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_25BF11E1C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_25BF12570();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25BF11FD8(a5, a6);
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
  uint64_t v8 = sub_25BF12590();
  if (!v8)
  {
    sub_25BF125A0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25BF125B0();
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

uint64_t sub_25BF11FD8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25BF12070(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25BF12250(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25BF12250(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25BF12070(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_25BF121E8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25BF12580();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25BF125A0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25BF12530();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25BF125B0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25BF125A0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25BF121E8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A583938);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25BF12250(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A583938);
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
  os_log_type_t v13 = a4 + 32;
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
  uint64_t result = sub_25BF125B0();
  __break(1u);
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

ValueMetadata *type metadata accessor for SPPeriodicTaskScheduler()
{
  return &type metadata for SPPeriodicTaskScheduler;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_25BF12444(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

Swift::Void __swiftcall SPContextManager.registerForPeriodicLogging()()
{
}

ValueMetadata *type metadata accessor for SPContextManager()
{
  return &type metadata for SPContextManager;
}

uint64_t sub_25BF124D0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25BF124E0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25BF124F0()
{
  return MEMORY[0x270FA2E18]();
}

uint64_t sub_25BF12500()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25BF12510()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25BF12520()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25BF12530()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25BF12540()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25BF12550()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25BF12560()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25BF12570()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25BF12580()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25BF12590()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25BF125A0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25BF125B0()
{
  return MEMORY[0x270F9F0C0]();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}