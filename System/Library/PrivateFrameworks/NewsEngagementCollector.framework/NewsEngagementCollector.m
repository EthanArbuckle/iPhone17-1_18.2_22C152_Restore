uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
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

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void sub_1C1DC7C44()
{
  id v0 = objc_msgSend(self, sel_mainBundle);
  id v1 = objc_msgSend(v0, sel_bundleIdentifier);

  if (v1)
  {
    uint64_t v2 = sub_1C1DD01F0();
    unint64_t v4 = v3;
  }
  else
  {
    unint64_t v4 = 0x80000001C1DD0CA0;
    uint64_t v2 = 0xD00000000000001DLL;
  }
  qword_1EBB63B38 = v2;
  unk_1EBB63B40 = v4;
}

uint64_t sub_1C1DC7CE8()
{
  uint64_t v0 = sub_1C1DD0140();
  __swift_allocate_value_buffer(v0, qword_1EBB63D58);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EBB63D58);
  if (qword_1EBB63B48 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return sub_1C1DD0130();
}

uint64_t EngagementPropertyConfiguration.eventName.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

NewsEngagementCollector::EngagementPropertyConfiguration __swiftcall EngagementPropertyConfiguration.init(eventName:)(NewsEngagementCollector::EngagementPropertyConfiguration eventName)
{
  *uint64_t v1 = eventName;
  return eventName;
}

uint64_t EngagementPropertyConfiguration.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_1C1DD0200();

  return swift_bridgeObjectRelease();
}

uint64_t static EngagementPropertyConfiguration.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_1C1DD03B0();
  }
}

uint64_t EngagementPropertyConfiguration.hashValue.getter()
{
  return sub_1C1DD0430();
}

uint64_t sub_1C1DC7EB0()
{
  return sub_1C1DD0430();
}

uint64_t sub_1C1DC7EFC()
{
  return sub_1C1DD0200();
}

uint64_t sub_1C1DC7F04()
{
  return sub_1C1DD0430();
}

unint64_t sub_1C1DC7F50()
{
  unint64_t result = qword_1EA2C0F70;
  if (!qword_1EA2C0F70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA2C0F70);
  }
  return result;
}

uint64_t sub_1C1DC7FA4(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_1C1DD03B0();
  }
}

void *initializeBufferWithCopyOfBuffer for EngagementPropertyConfiguration(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for EngagementPropertyConfiguration()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for EngagementPropertyConfiguration(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for EngagementPropertyConfiguration(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EngagementPropertyConfiguration(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for EngagementPropertyConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for EngagementPropertyConfiguration()
{
  return &type metadata for EngagementPropertyConfiguration;
}

uint64_t EngagementCollector.donors.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t EngagementCollector.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  EngagementCollector.init()();
  return v0;
}

uint64_t EngagementCollector.init()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1C1DD0280();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790]();
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1DD0190();
  MEMORY[0x1F4188790]();
  sub_1C1DD0270();
  MEMORY[0x1F4188790]();
  sub_1C1DC8360();
  sub_1C1DD0260();
  sub_1C1DD0180();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E4FBCC58], v2);
  uint64_t v6 = sub_1C1DD02A0();
  uint64_t v7 = MEMORY[0x1E4FBC860];
  *(void *)(v1 + 16) = v6;
  *(void *)(v1 + 24) = v7;
  return v1;
}

unint64_t sub_1C1DC8360()
{
  unint64_t result = qword_1EBB63D40;
  if (!qword_1EBB63D40)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBB63D40);
  }
  return result;
}

uint64_t EngagementCollector.register(donor:)(void *a1)
{
  if (qword_1EBB63D30 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1C1DD0140();
  __swift_project_value_buffer(v4, (uint64_t)qword_1EBB63D58);
  sub_1C1DC8780((uint64_t)a1, (uint64_t)&v35);
  v5 = sub_1C1DD0120();
  os_log_type_t v6 = sub_1C1DD0220();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v38 = v2;
  if (v7)
  {
    v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    v34[0] = v33;
    *(_DWORD *)v8 = 136315138;
    uint64_t v10 = v36;
    uint64_t v9 = v37;
    __swift_project_boxed_opaque_existential_1(&v35, v36);
    uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v10, v9);
    sub_1C1DC9398(v11, v12, v34);
    sub_1C1DD02D0();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v35);
    _os_log_impl(&dword_1C1DC6000, v5, v6, "EngagementCollector registering new donor: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C874A160](v33, -1, -1);
    MEMORY[0x1C874A160](v8, -1, -1);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v35);
  }

  v13 = (void **)(v1 + 24);
  swift_beginAccess();
  uint64_t v14 = *(void *)(v1 + 24);
  uint64_t v15 = *(void *)(v14 + 16);
  if (v15)
  {
    v16 = (void *)(v14 + 32);
    swift_bridgeObjectRetain();
    while (1)
    {
      uint64_t v17 = v16[3];
      uint64_t v18 = v16[4];
      __swift_project_boxed_opaque_existential_1(v16, v17);
      uint64_t v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 8))(v17, v18);
      uint64_t v21 = v20;
      uint64_t v22 = a1[3];
      uint64_t v23 = a1[4];
      __swift_project_boxed_opaque_existential_1(a1, v22);
      if (v19 == (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 8))(v22, v23) && v21 == v24)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        goto LABEL_22;
      }
      char v26 = sub_1C1DD03B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v26) {
        break;
      }
      v16 += 5;
      if (!--v15)
      {
        swift_bridgeObjectRelease();
        v13 = (void **)(v1 + 24);
        goto LABEL_15;
      }
    }
    swift_bridgeObjectRelease();
LABEL_22:
    sub_1C1DC9344();
    swift_allocError();
    _OWORD *v32 = xmmword_1C1DD0A20;
    return swift_willThrow();
  }
  else
  {
LABEL_15:
    sub_1C1DC8780((uint64_t)a1, (uint64_t)&v35);
    swift_beginAccess();
    v27 = *v13;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v13 = v27;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v27 = sub_1C1DC91DC(0, v27[2] + 1, 1, v27);
      *v13 = v27;
    }
    unint64_t v30 = v27[2];
    unint64_t v29 = v27[3];
    if (v30 >= v29 >> 1)
    {
      v27 = sub_1C1DC91DC((void *)(v29 > 1), v30 + 1, 1, v27);
      *v13 = v27;
    }
    v27[2] = v30 + 1;
    sub_1C1DC932C(&v35, (uint64_t)&v27[5 * v30 + 4]);
    return swift_endAccess();
  }
}

uint64_t sub_1C1DC8780(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t EngagementCollector.collect(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1C1DC9AF4(a3, a4);
}

void sub_1C1DC87F0(uint64_t a1, void *a2, void (*a3)(void), uint64_t a4)
{
  v63 = a2;
  uint64_t v7 = sub_1C1DD01B0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  v56 = (char *)v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  unint64_t v12 = (char *)v50 - v11;
  if (qword_1EBB63D30 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_1C1DD0140();
  uint64_t v64 = __swift_project_value_buffer(v13, (uint64_t)qword_1EBB63D58);
  uint64_t v14 = sub_1C1DD0120();
  os_log_type_t v15 = sub_1C1DD0220();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_1C1DC6000, v14, v15, "Start collecting data", v16, 2u);
    MEMORY[0x1C874A160](v16, -1, -1);
  }

  dispatch_group_t v68 = dispatch_group_create();
  uint64_t v17 = swift_allocObject();
  uint64_t v65 = v17;
  *(void *)(v17 + 16) = MEMORY[0x1E4FBC868];
  uint64_t v58 = *(void *)(a1 + 16);
  if (v58)
  {
    v50[1] = v17 + 16;
    v51 = v12;
    uint64_t v52 = v8;
    uint64_t v53 = v7;
    uint64_t v54 = a4;
    v55 = a3;
    uint64_t v57 = a1 + 32;
    v50[2] = a1;
    swift_bridgeObjectRetain();
    uint64_t v18 = 0;
    *(void *)&long long v19 = 136315138;
    long long v62 = v19;
    uint64_t v61 = MEMORY[0x1E4FBC840] + 8;
    do
    {
      uint64_t v59 = v18;
      sub_1C1DC8780(v57 + 40 * v18, (uint64_t)v75);
      uint64_t v20 = v77;
      uint64_t v21 = v78;
      __swift_project_boxed_opaque_existential_1(v75, v77);
      uint64_t v60 = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 16))(v20, v21);
      uint64_t v22 = *(void *)(v60 + 16);
      if (v22)
      {
        uint64_t v23 = (uint64_t *)(v60 + 40);
        do
        {
          uint64_t v35 = *(v23 - 1);
          uint64_t v34 = *v23;
          swift_bridgeObjectRetain();
          dispatch_group_enter(v68);
          sub_1C1DC8780((uint64_t)v75, (uint64_t)&v70);
          uint64_t v36 = sub_1C1DD0120();
          os_log_type_t v37 = sub_1C1DD0220();
          BOOL v38 = os_log_type_enabled(v36, v37);
          uint64_t v67 = v22;
          if (v38)
          {
            uint64_t v39 = swift_slowAlloc();
            uint64_t v40 = swift_slowAlloc();
            uint64_t v69 = v40;
            *(_DWORD *)uint64_t v39 = v62;
            uint64_t v41 = v73;
            uint64_t v42 = v74;
            __swift_project_boxed_opaque_existential_1(&v70, v73);
            uint64_t v43 = (*(uint64_t (**)(uint64_t, uint64_t))(v42 + 8))(v41, v42);
            *(void *)(v39 + 4) = sub_1C1DC9398(v43, v44, &v69);
            swift_bridgeObjectRelease();
            __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v70);
            _os_log_impl(&dword_1C1DC6000, v36, v37, "Getting data from donor: %s", (uint8_t *)v39, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x1C874A160](v40, -1, -1);
            MEMORY[0x1C874A160](v39, -1, -1);
          }
          else
          {
            __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v70);
          }

          v66 = v23 + 2;
          uint64_t v24 = v77;
          uint64_t v25 = v78;
          __swift_project_boxed_opaque_existential_1(v75, v77);
          uint64_t v70 = v35;
          uint64_t v71 = v34;
          char v26 = (void *)swift_allocObject();
          uint64_t v27 = v34;
          v28 = v63;
          uint64_t v29 = v65;
          v26[2] = v63;
          v26[3] = v29;
          v26[4] = v35;
          v26[5] = v27;
          dispatch_group_t v30 = v68;
          v26[6] = v68;
          v31 = *(void (**)(uint64_t *, uint64_t (*)(uint64_t *), void *, uint64_t, uint64_t))(v25 + 24);
          swift_bridgeObjectRetain();
          id v32 = v28;
          swift_retain();
          uint64_t v33 = v30;
          v31(&v70, sub_1C1DCA314, v26, v24, v25);
          uint64_t v23 = v66;
          swift_bridgeObjectRelease();
          swift_release();
          uint64_t v22 = v67 - 1;
        }
        while (v67 != 1);
      }
      uint64_t v18 = v59 + 1;
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v75);
    }
    while (v18 != v58);
    swift_bridgeObjectRelease();
    a3 = v55;
    uint64_t v7 = v53;
    uint64_t v8 = v52;
    unint64_t v12 = v51;
  }
  v45 = v56;
  sub_1C1DD01A0();
  MEMORY[0x1C8749B10](v45, 5.0);
  v46 = *(void (**)(char *, uint64_t))(v8 + 8);
  v46(v45, v7);
  sub_1C1DD0250();
  v46(v12, v7);
  if (sub_1C1DD0150())
  {
    swift_beginAccess();
    uint64_t v70 = *(void *)(v65 + 16);
    uint64_t v71 = 0;
    char v72 = 0;
    swift_bridgeObjectRetain();
    a3(&v70);
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    v47 = sub_1C1DD0120();
    os_log_type_t v48 = sub_1C1DD0230();
    if (os_log_type_enabled(v47, v48))
    {
      v49 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v49 = 0;
      _os_log_impl(&dword_1C1DC6000, v47, v48, "A Donor failed to call completion block in time. Donation might be partial.", v49, 2u);
      MEMORY[0x1C874A160](v49, -1, -1);
    }

    v75[0] = 0;
    v75[1] = 0;
    char v76 = 1;
    a3(v75);
    swift_release();
  }
}

uint64_t sub_1C1DC8E60(uint64_t *a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v10 = *a1;
  uint64_t v11 = a3 + 16;
  unint64_t v12 = (void *)swift_allocObject();
  v12[2] = v10;
  v12[3] = v11;
  v12[4] = a4;
  v12[5] = a5;
  v12[6] = a6;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_1C1DCA36C;
  *(void *)(v13 + 24) = v12;
  v17[4] = sub_1C1DCA38C;
  v17[5] = v13;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 1107296256;
  v17[2] = sub_1C1DC9074;
  v17[3] = &block_descriptor_17;
  uint64_t v14 = _Block_copy(v17);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v15 = a6;
  swift_retain();
  swift_release();
  dispatch_sync(a2, v14);
  _Block_release(v14);
  LOBYTE(a2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (a2) {
    __break(1u);
  }
  return result;
}

void sub_1C1DC8FE0(uint64_t a1, int a2, uint64_t a3, uint64_t a4, dispatch_group_t group)
{
  if (a1)
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1C1DCB5F0(a1, a3, a4);
    swift_endAccess();
  }
  dispatch_group_leave(group);
}

uint64_t sub_1C1DC9074(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_1C1DC909C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t EngagementCollector.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t EngagementCollector.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186488](v0, 32, 7);
}

uint64_t sub_1C1DC9148(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1C1DC9AF4(a3, a4);
}

uint64_t sub_1C1DC9174(void *a1)
{
  return EngagementCollector.register(donor:)(a1);
}

uint64_t sub_1C1DC9198()
{
  return swift_bridgeObjectRetain();
}

void *sub_1C1DC91DC(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_1C1DCA468(0, &qword_1EBB639C8, (uint64_t (*)(uint64_t))sub_1C1DCA4CC, MEMORY[0x1E4FBBE00]);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      unint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4]) {
          memmove(v12, a4 + 4, 40 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
      unint64_t v12 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_1C1DC99E8(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1C1DC932C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

unint64_t sub_1C1DC9344()
{
  unint64_t result = qword_1EA2C0F78;
  if (!qword_1EA2C0F78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA2C0F78);
  }
  return result;
}

uint64_t sub_1C1DC9398(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1C1DC946C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1C1DCA3B4((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1C1DCA3B4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_1C1DC946C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1C1DD02E0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1C1DC9628(a5, a6);
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
  uint64_t v8 = sub_1C1DD0330();
  if (!v8)
  {
    sub_1C1DD0340();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1C1DD0390();
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

uint64_t sub_1C1DC9628(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1C1DC96C0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1C1DC989C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1C1DC989C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1C1DC96C0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1C1DC9838(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1C1DD0320();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1C1DD0340();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1C1DD0210();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1C1DD0390();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1C1DD0340();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1C1DC9838(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  sub_1C1DCA410();
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1C1DC989C(char a1, int64_t a2, char a3, char *a4)
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
    sub_1C1DCA410();
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
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
  uint64_t result = sub_1C1DD0390();
  __break(1u);
  return result;
}

uint64_t sub_1C1DC99E8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      sub_1C1DCA4CC();
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1C1DD0390();
  __break(1u);
  return result;
}

uint64_t sub_1C1DC9AF4(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = a1;
  uint64_t v23 = a2;
  uint64_t v3 = sub_1C1DD0160();
  uint64_t v26 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  unint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1C1DD0190();
  uint64_t v24 = *(void *)(v6 - 8);
  uint64_t v25 = v6;
  MEMORY[0x1F4188790](v6);
  int64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1C1DD0170();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v13 = *(void **)(v2 + 16);
  uint64_t v14 = *(void *)(v2 + 24);
  sub_1C1DC8360();
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x1E4FBCB10], v9);
  swift_bridgeObjectRetain();
  id v15 = (void *)sub_1C1DD02B0();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v16 = (void *)swift_allocObject();
  v16[2] = v14;
  v16[3] = v13;
  uint64_t v17 = v23;
  v16[4] = v22;
  v16[5] = v17;
  aBlock[4] = sub_1C1DCA188;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C1DC909C;
  aBlock[3] = &block_descriptor;
  uint64_t v18 = _Block_copy(aBlock);
  id v19 = v13;
  swift_retain();
  sub_1C1DD0180();
  uint64_t v27 = MEMORY[0x1E4FBC860];
  sub_1C1DCA1AC();
  sub_1C1DCA468(0, &qword_1EBB63A10, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
  sub_1C1DCA204();
  sub_1C1DD0300();
  MEMORY[0x1C8749BE0](0, v8, v5, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v26 + 8))(v5, v3);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v25);
  return swift_release();
}

unint64_t destroy for CollectorError(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s23NewsEngagementCollector14CollectorErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

void *assignWithCopy for CollectorError(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for CollectorError(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CollectorError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CollectorError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_1C1DCA0A4(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_1C1DCA0C0(void *result, int a2)
{
  if (a2 < 0)
  {
    *unint64_t result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for CollectorError()
{
  return &type metadata for CollectorError;
}

uint64_t type metadata accessor for EngagementCollector()
{
  return self;
}

uint64_t method lookup function for EngagementCollector(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for EngagementCollector);
}

uint64_t dispatch thunk of EngagementCollector.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_1C1DCA140()
{
  swift_bridgeObjectRelease();

  swift_release();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

void sub_1C1DCA188()
{
  sub_1C1DC87F0(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void (**)(void))(v0 + 32), *(void *)(v0 + 40));
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

unint64_t sub_1C1DCA1AC()
{
  unint64_t result = qword_1EBB63A00;
  if (!qword_1EBB63A00)
  {
    sub_1C1DD0160();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB63A00);
  }
  return result;
}

unint64_t sub_1C1DCA204()
{
  unint64_t result = qword_1EBB63A18;
  if (!qword_1EBB63A18)
  {
    sub_1C1DCA468(255, &qword_1EBB63A10, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB63A18);
  }
  return result;
}

uint64_t sub_1C1DCA28C()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1C1DCA2C4()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1C1DCA314(uint64_t *a1)
{
  return sub_1C1DC8E60(a1, *(NSObject **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void **)(v1 + 48));
}

uint64_t sub_1C1DCA324()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 56, 7);
}

void sub_1C1DCA36C()
{
  sub_1C1DC8FE0(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(dispatch_group_t *)(v0 + 48));
}

uint64_t sub_1C1DCA37C()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C1DCA38C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1C1DCA3B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_1C1DCA410()
{
  if (!qword_1EBB63A28[0])
  {
    unint64_t v0 = sub_1C1DD03A0();
    if (!v1) {
      atomic_store(v0, qword_1EBB63A28);
    }
  }
}

void sub_1C1DCA468(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

unint64_t sub_1C1DCA4CC()
{
  unint64_t result = qword_1EBB639D0;
  if (!qword_1EBB639D0)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBB639D0);
  }
  return result;
}

uint64_t sub_1C1DCA52C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C1DCA58C()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1C1DCA5D8(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1C1DCA62C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1C1DCA680(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 32) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C1DCA6E0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1C1DCA718(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 32) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1C1DCA760())()
{
  return j__swift_endAccess;
}

void *BaseDonor.__allocating_init(type:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C1DD00A0();
  MEMORY[0x1F4188790](v4 - 8);
  unsigned int v5 = (void *)swift_allocObject();
  v5[5] = MEMORY[0x1E4FBC868];
  sub_1C1DD0090();
  sub_1C1DD00C0();
  swift_allocObject();
  v5[6] = sub_1C1DD00B0();
  v5[2] = a1;
  v5[3] = a2;
  v5[4] = MEMORY[0x1E4FBC860];
  return v5;
}

void *BaseDonor.init(type:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_1C1DD00A0();
  MEMORY[0x1F4188790](v5 - 8);
  v2[5] = MEMORY[0x1E4FBC868];
  sub_1C1DD0090();
  sub_1C1DD00C0();
  swift_allocObject();
  v2[6] = sub_1C1DD00B0();
  v2[2] = a1;
  v2[3] = a2;
  v2[4] = MEMORY[0x1E4FBC860];
  return v2;
}

void sub_1C1DCA95C()
{
}

uint64_t sub_1C1DCA9B8(uint64_t *a1)
{
  uint64_t v2 = v1;
  unint64_t v3 = a1[1];
  uint64_t v31 = *a1;
  sub_1C1DD0070();
  swift_beginAccess();
  uint64_t v4 = *(void *)(v1 + 40);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v30 = v4 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & v5;
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v11 = 0;
  uint64_t v32 = result;
  uint64_t v29 = result + 104;
  if (v8) {
    goto LABEL_24;
  }
LABEL_6:
  int64_t v12 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
    __break(1u);
  }
  else
  {
    if (v12 >= v9)
    {
      int64_t v15 = v11;
    }
    else
    {
      unint64_t v13 = *(void *)(v30 + 8 * v12);
      if (v13)
      {
LABEL_9:
        unint64_t v8 = (v13 - 1) & v13;
        unint64_t v14 = __clz(__rbit64(v13)) + (v12 << 6);
        int64_t v11 = v12;
        goto LABEL_25;
      }
      int64_t v15 = v11 + 1;
      if (v11 + 2 < v9)
      {
        unint64_t v13 = *(void *)(v30 + 8 * (v11 + 2));
        if (v13)
        {
          int64_t v12 = v11 + 2;
          goto LABEL_9;
        }
        int64_t v15 = v11 + 2;
        if (v11 + 3 < v9)
        {
          unint64_t v13 = *(void *)(v30 + 8 * (v11 + 3));
          if (v13)
          {
            int64_t v12 = v11 + 3;
            goto LABEL_9;
          }
          int64_t v12 = v11 + 4;
          int64_t v15 = v11 + 3;
          if (v11 + 4 < v9)
          {
            unint64_t v13 = *(void *)(v30 + 8 * v12);
            if (v13) {
              goto LABEL_9;
            }
            while (v9 - 5 != v11)
            {
              unint64_t v13 = *(void *)(v29 + 8 * v11++);
              if (v13)
              {
                int64_t v12 = v11 + 4;
                goto LABEL_9;
              }
            }
            int64_t v15 = v9 - 1;
          }
        }
      }
    }
    unint64_t v8 = 0;
    uint64_t v34 = 0;
    v35[0] = 0;
    int64_t v11 = v15;
    v35[1] = 1;
    while (1)
    {
      sub_1C1DCAE8C((uint64_t)&v34, (uint64_t)v36);
      if (!v37[0] && v37[1] == 1) {
        break;
      }
      sub_1C1DCAFB4((uint64_t)v37, (uint64_t)&v34);
      if (MEMORY[0x1C874A1E0](&v34))
      {
        uint64_t v19 = qword_1EBB63D30;
        swift_retain_n();
        if (v19 != -1) {
          swift_once();
        }
        uint64_t v20 = sub_1C1DD0140();
        __swift_project_value_buffer(v20, (uint64_t)qword_1EBB63D58);
        swift_bridgeObjectRetain_n();
        uint64_t v21 = sub_1C1DD0120();
        os_log_type_t v22 = sub_1C1DD0240();
        if (os_log_type_enabled(v21, v22))
        {
          uint64_t v23 = swift_slowAlloc();
          uint64_t v24 = swift_slowAlloc();
          v33[0] = v24;
          *(_DWORD *)uint64_t v23 = 136315138;
          swift_bridgeObjectRetain();
          uint64_t v25 = v31;
          *(void *)(v23 + 4) = sub_1C1DC9398(v31, v3, v33);
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_1C1DC6000, v21, v22, "EngagementDataManager property did Change: %s", (uint8_t *)v23, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x1C874A160](v24, -1, -1);
          MEMORY[0x1C874A160](v23, -1, -1);
        }
        else
        {
          swift_bridgeObjectRelease_n();

          uint64_t v25 = v31;
        }
        v33[0] = v25;
        v33[1] = v3;
        uint64_t v26 = swift_allocObject();
        swift_weakInit();
        uint64_t v27 = (void *)swift_allocObject();
        v27[2] = v26;
        v27[3] = v25;
        v27[4] = v3;
        v28 = *(void (**)(uint64_t *, uint64_t *(*)(uint64_t *), void *))(*(void *)v2 + 192);
        swift_bridgeObjectRetain();
        swift_retain();
        v28(v33, sub_1C1DCB1F0, v27);
        swift_release();
        swift_release();
        swift_release();
        swift_unknownObjectRelease();
        sub_1C1DCAFF0((uint64_t)&v34);
        uint64_t result = swift_release();
        if (!v8) {
          goto LABEL_6;
        }
      }
      else
      {
        uint64_t result = sub_1C1DCAFF0((uint64_t)&v34);
        if (!v8) {
          goto LABEL_6;
        }
      }
LABEL_24:
      unint64_t v16 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v14 = v16 | (v11 << 6);
LABEL_25:
      uint64_t v17 = *(void *)(v32 + 56);
      uint64_t v34 = *(void *)(*(void *)(v32 + 48) + 8 * v14);
      sub_1C1DCAE50(v17 + 16 * v14, (uint64_t)v35);
    }
    swift_release();
    return sub_1C1DD0080();
  }
  return result;
}

uint64_t sub_1C1DCAE50(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 8) = *(void *)(a1 + 8);
  return a2;
}

uint64_t sub_1C1DCAE8C(uint64_t a1, uint64_t a2)
{
  sub_1C1DCAEF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1C1DCAEF0()
{
  if (!qword_1EBB63A08)
  {
    sub_1C1DCAF48();
    unint64_t v0 = sub_1C1DD02C0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB63A08);
    }
  }
}

void sub_1C1DCAF48()
{
  if (!qword_1EBB639C0)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EBB639C0);
    }
  }
}

uint64_t sub_1C1DCAFB4(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 8) = *(void *)(a1 + 8);
  return a2;
}

uint64_t sub_1C1DCAFF0(uint64_t a1)
{
  return a1;
}

uint64_t sub_1C1DCB018()
{
  swift_weakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t BaseDonor.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t BaseDonor.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x1F4186488](v0, 56, 7);
}

uint64_t sub_1C1DCB0D8()
{
  uint64_t v1 = *v0;
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1C1DCB128()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1C1DCB16C()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 192))();
}

uint64_t sub_1C1DCB1B0()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t *sub_1C1DCB1F0(uint64_t *a1)
{
  return sub_1C1DCDB48(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1C1DCB1FC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 24);
  *a2 = *(void *)(v3 + 16);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1C1DCB24C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  *a2 = *(void *)(v3 + 32);
  return swift_bridgeObjectRetain();
}

uint64_t dispatch thunk of Donor.type.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of Donor.eventConfigurations.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of Donor.donate(configuration:donationCompleteBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t type metadata accessor for BaseDonor()
{
  return self;
}

uint64_t method lookup function for BaseDonor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for BaseDonor);
}

uint64_t dispatch thunk of BaseDonor.type.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of BaseDonor.type.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of BaseDonor.type.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of BaseDonor.eventConfigurations.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of BaseDonor.eventConfigurations.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of BaseDonor.eventConfigurations.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of BaseDonor.__allocating_init(type:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of BaseDonor.donate(configuration:donationCompleteBlock:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of BaseDonor.propertyDidChange(propertyConfiguration:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t initializeBufferWithCopyOfBuffer for BaseDonor.Observation(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t initializeWithCopy for BaseDonor.Observation(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_unknownObjectWeakCopyInit();
  *(void *)(result + 8) = *(void *)(a2 + 8);
  return result;
}

uint64_t assignWithCopy for BaseDonor.Observation(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_unknownObjectWeakCopyAssign();
  *(void *)(result + 8) = *(void *)(a2 + 8);
  return result;
}

uint64_t initializeWithTake for BaseDonor.Observation(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_unknownObjectWeakTakeInit();
  *(void *)(result + 8) = *(void *)(a2 + 8);
  return result;
}

uint64_t assignWithTake for BaseDonor.Observation(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_unknownObjectWeakTakeAssign();
  *(void *)(result + 8) = *(void *)(a2 + 8);
  return result;
}

uint64_t getEnumTagSinglePayload for BaseDonor.Observation(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  if ((*(void *)(a1 + 8) & 0xF000000000000007) != 0) {
    int v2 = *(_DWORD *)a1 & 0x7FFFFFFF;
  }
  else {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BaseDonor.Observation(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = 1;
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BaseDonor.Observation()
{
  return &type metadata for BaseDonor.Observation;
}

uint64_t StatePropertyValue.value.getter()
{
  return swift_bridgeObjectRetain();
}

NewsEngagementCollector::StatePropertyValue __swiftcall StatePropertyValue.init(_:)(NewsEngagementCollector::StatePropertyValue result)
{
  v1->value._rawValue = result.value._rawValue;
  return result;
}

ValueMetadata *type metadata accessor for StatePropertyValue()
{
  return &type metadata for StatePropertyValue;
}

uint64_t sub_1C1DCB5F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_1C1DCEC58(a1, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1C1DCDE40(a2, a3, &v9);
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C1DCB6A8(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (*a1) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = a1[1] == 1;
  }
  if (v5)
  {
    sub_1C1DCF834((uint64_t)a1, (uint64_t (*)(void))sub_1C1DCF894);
    unint64_t v8 = sub_1C1DCDF94(a2);
    if (v9)
    {
      unint64_t v10 = v8;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v12 = *v2;
      uint64_t v14 = *v3;
      *uint64_t v3 = 0x8000000000000000;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_1C1DCF458();
        uint64_t v12 = v14;
      }
      sub_1C1DCAFB4(*(void *)(v12 + 56) + 16 * v10, (uint64_t)&v15);
      sub_1C1DCEA98(v10, v12);
      *uint64_t v3 = v12;
      swift_bridgeObjectRelease();
    }
    else
    {
      long long v15 = xmmword_1C1DD0A20;
    }
    return sub_1C1DCF834((uint64_t)&v15, (uint64_t (*)(void))sub_1C1DCF894);
  }
  else
  {
    sub_1C1DCAFB4((uint64_t)a1, (uint64_t)&v15);
    char v6 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v2;
    *int v2 = 0x8000000000000000;
    sub_1C1DCEDC8((uint64_t)&v15, a2, v6);
    *int v2 = v13;
    return swift_bridgeObjectRelease();
  }
}

uint64_t EngagementDataManager.collector.getter@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  return sub_1C1DC8780(v1 + 16, a1);
}

uint64_t EngagementDataManager.collector.setter(long long *a1)
{
  uint64_t v3 = v1 + 16;
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_1Tm(v3);
  sub_1C1DC932C(a1, v3);
  return swift_endAccess();
}

uint64_t (*EngagementDataManager.collector.modify())()
{
  return j__swift_endAccess;
}

uint64_t EngagementDataManager.register(donor:)(uint64_t a1)
{
  uint64_t v4 = type metadata accessor for EngagementDataManagerConfig();
  MEMORY[0x1F4188790](v4 - 8);
  char v6 = (char *)&v19[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  sub_1C1DC8780(v1 + 16, (uint64_t)v20);
  uint64_t v7 = v21;
  uint64_t v8 = v22;
  __swift_project_boxed_opaque_existential_1(v20, v21);
  v19[3] = type metadata accessor for BaseDonor();
  v19[4] = &protocol witness table for BaseDonor;
  v19[0] = a1;
  char v9 = *(void (**)(void *, uint64_t, uint64_t))(v8 + 16);
  swift_retain();
  v9(v19, v7, v8);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v20);
  if (!v2)
  {
    sub_1C1DD0070();
    v19[1] = &off_1F1D62AC0;
    swift_unknownObjectWeakInit();
    swift_beginAccess();
    sub_1C1DCB6A8(v19, v1);
    swift_endAccess();
    sub_1C1DD0080();
    uint64_t result = swift_beginAccess();
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(v11 + 16);
    if (v12)
    {
      uint64_t v13 = v1 + OBJC_IVAR____TtC23NewsEngagementCollector21EngagementDataManager_managerConfig;
      swift_bridgeObjectRetain();
      uint64_t v14 = (unint64_t *)(v11 + 40);
      do
      {
        uint64_t v15 = *(v14 - 1);
        unint64_t v16 = *v14;
        sub_1C1DCC0DC(v13, (uint64_t)v6);
        swift_bridgeObjectRetain();
        sub_1C1DCBB18(v15, v16, (uint64_t)v6);
        uint64_t v17 = sub_1C1DD0040();
        (*(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8))(v6, v17);
        swift_bridgeObjectRelease();
        v14 += 2;
        --v12;
      }
      while (v12);
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

void sub_1C1DCBB18(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v34 = a3;
  sub_1C1DCF250(0, &qword_1EBB63D50, MEMORY[0x1E4FBD360]);
  MEMORY[0x1F4188790](v7 - 8);
  char v9 = (char *)&v30 - v8;
  uint64_t v10 = sub_1C1DD0040();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = *(void *)(v4 + 56);
  uint64_t v36 = v4;
  uint64_t v37 = a1;
  uint64_t v35 = a1;
  unint64_t v38 = a2;
  sub_1C1DD00C0();
  sub_1C1DCF250(0, &qword_1EBB63B30, (void (*)(uint64_t))sub_1C1DCD2E0);
  swift_retain();
  sub_1C1DD0110();
  swift_release();
  uint64_t v14 = v39[0];
  swift_release();
  if (v14)
  {
    if (qword_1EBB63D30 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_1C1DD0140();
    __swift_project_value_buffer(v15, (uint64_t)qword_1EBB63D58);
    swift_bridgeObjectRetain_n();
    unint64_t v16 = sub_1C1DD0120();
    os_log_type_t v17 = sub_1C1DD0240();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v39[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v40 = sub_1C1DC9398(v35, a2, v39);
      sub_1C1DD02D0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C1DC6000, v16, v17, "Already registered store for event: %s. Skipping.", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C874A160](v19, -1, -1);
      MEMORY[0x1C874A160](v18, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    uint64_t v32 = v13;
    uint64_t v33 = v11;
    if (qword_1EBB63D30 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_1C1DD0140();
    __swift_project_value_buffer(v20, (uint64_t)qword_1EBB63D58);
    swift_bridgeObjectRetain_n();
    uint64_t v21 = sub_1C1DD0120();
    os_log_type_t v22 = sub_1C1DD0240();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v31 = v9;
      uint64_t v24 = (uint8_t *)v23;
      uint64_t v25 = swift_slowAlloc();
      v39[0] = v25;
      *(_DWORD *)uint64_t v24 = 136315138;
      uint64_t v30 = v24 + 4;
      swift_bridgeObjectRetain();
      uint64_t v40 = sub_1C1DC9398(v35, a2, v39);
      sub_1C1DD02D0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C1DC6000, v21, v22, "Registering store for event: %s", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C874A160](v25, -1, -1);
      uint64_t v26 = v24;
      char v9 = v31;
      MEMORY[0x1C874A160](v26, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v32, v34, v10);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v9, 1, 1, v20);
    sub_1C1DCD2E0();
    swift_allocObject();
    swift_bridgeObjectRetain();
    uint64_t v27 = v35;
    uint64_t v28 = sub_1C1DD00E0();
    sub_1C1DD0070();
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v40 = *(void *)(v4 + 64);
    *(void *)(v4 + 64) = 0x8000000000000000;
    sub_1C1DCEEF8(v28, v27, a2, isUniquelyReferenced_nonNull_native);
    *(void *)(v4 + 64) = v40;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    sub_1C1DD0080();
    swift_release();
  }
}

uint64_t sub_1C1DCC0DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for EngagementDataManagerConfig();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

NewsEngagementCollector::StatePropertyValue_optional __swiftcall EngagementDataManager.getProperties(config:)(NewsEngagementCollector::EngagementPropertyConfiguration config)
{
  uint64_t v2 = v1;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)config.eventName._countAndFlagsBits;
  unint64_t v3 = *(void *)(config.eventName._countAndFlagsBits + 8);
  uint64_t v5 = qword_1EBB63D30;
  swift_bridgeObjectRetain();
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1C1DD0140();
  __swift_project_value_buffer(v6, (uint64_t)qword_1EBB63D58);
  swift_bridgeObjectRetain_n();
  uint64_t v7 = sub_1C1DD0120();
  os_log_type_t v8 = sub_1C1DD0240();
  if (os_log_type_enabled(v7, v8))
  {
    char v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    id v41 = v10;
    *(_DWORD *)char v9 = 136315138;
    swift_bridgeObjectRetain();
    sub_1C1DC9398(v4, v3, (uint64_t *)&v41);
    sub_1C1DD02D0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C1DC6000, v7, v8, "EngagementDataManager fetching properties for: %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C874A160](v10, -1, -1);
    MEMORY[0x1C874A160](v9, -1, -1);
  }
  else
  {

    uint64_t v11 = swift_bridgeObjectRelease_n();
  }
  uint64_t v40 = *(void *)(v38 + 56);
  MEMORY[0x1F4188790](v11);
  sub_1C1DD00C0();
  sub_1C1DCF250(0, &qword_1EBB63B30, (void (*)(uint64_t))sub_1C1DCD2E0);
  swift_retain();
  sub_1C1DD0110();
  swift_release();
  if (!v41)
  {
    swift_bridgeObjectRetain();
    os_log_type_t v17 = sub_1C1DD0120();
    uint64_t v18 = sub_1C1DD0240();
    if (os_log_type_enabled(v17, (os_log_type_t)v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = (void *)swift_slowAlloc();
      id v41 = v20;
      *(_DWORD *)uint64_t v19 = 136315138;
      swift_bridgeObjectRetain();
      sub_1C1DC9398(v4, v3, (uint64_t *)&v41);
      sub_1C1DD02D0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C1DC6000, v17, (os_log_type_t)v18, "EngagementDataManager no store found for: %s", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C874A160](v20, -1, -1);
      MEMORY[0x1C874A160](v19, -1, -1);
    }
    else
    {

      uint64_t v21 = (void *)swift_bridgeObjectRelease_n();
    }
    goto LABEL_24;
  }
  sub_1C1DD00D0();
  unint64_t v12 = v42;
  if (v42 >> 60 == 15)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_1C1DD0120();
    os_log_type_t v14 = sub_1C1DD0240();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      unint64_t v16 = (void *)swift_slowAlloc();
      id v41 = v16;
      *(_DWORD *)uint64_t v15 = 136315138;
      swift_bridgeObjectRetain();
      sub_1C1DC9398(v4, v3, (uint64_t *)&v41);
      sub_1C1DD02D0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C1DC6000, v13, v14, "EngagementDataManager no stored value found for: %s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C874A160](v16, -1, -1);
      MEMORY[0x1C874A160](v15, -1, -1);
LABEL_20:

LABEL_23:
      uint64_t v21 = (void *)swift_release();
LABEL_24:
      uint64_t v28 = 0;
      goto LABEL_25;
    }
    goto LABEL_22;
  }
  uint64_t v23 = (uint64_t)v41;
  uint64_t v24 = self;
  uint64_t v25 = (void *)sub_1C1DD0050();
  id v41 = 0;
  id v26 = objc_msgSend(v24, sel_JSONObjectWithData_options_error_, v25, 0, &v41);

  if (!v26)
  {
    id v33 = v41;
    uint64_t v34 = sub_1C1DD0030();

    swift_willThrow();
    MEMORY[0x1C874A050](v34);
    goto LABEL_18;
  }
  id v27 = v41;
  sub_1C1DD02F0();
  swift_unknownObjectRelease();
  sub_1C1DCDC38();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_1C1DD0120();
    os_log_type_t v35 = sub_1C1DD0230();
    if (os_log_type_enabled(v13, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      uint64_t v37 = (void *)swift_slowAlloc();
      id v41 = v37;
      *(_DWORD *)uint64_t v36 = 136315138;
      swift_bridgeObjectRetain();
      sub_1C1DC9398(v4, v3, (uint64_t *)&v41);
      sub_1C1DD02D0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C1DC6000, v13, v35, "EngagementDataManager failed deserializing data for: %s", v36, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C874A160](v37, -1, -1);
      MEMORY[0x1C874A160](v36, -1, -1);
      sub_1C1DCDBCC(v23, v12);
      goto LABEL_20;
    }
    sub_1C1DCDBCC(v23, v12);
LABEL_22:

    swift_bridgeObjectRelease_n();
    goto LABEL_23;
  }
  uint64_t v39 = v23;
  uint64_t v28 = v40;
  swift_bridgeObjectRetain();
  uint64_t v29 = sub_1C1DD0120();
  os_log_type_t v30 = sub_1C1DD0240();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = (void *)swift_slowAlloc();
    id v41 = v32;
    *(_DWORD *)uint64_t v31 = 136315138;
    swift_bridgeObjectRetain();
    sub_1C1DC9398(v4, v3, (uint64_t *)&v41);
    sub_1C1DD02D0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C1DC6000, v29, v30, "EngagementDataManager fetched properties for: %s", v31, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C874A160](v32, -1, -1);
    MEMORY[0x1C874A160](v31, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  sub_1C1DCDBCC(v39, v12);

  uint64_t v21 = (void *)swift_release();
LABEL_25:
  *uint64_t v2 = v28;
  result.value.value._rawValue = v21;
  result.is_nil = v22;
  return result;
}

uint64_t EngagementDataManager.getProperties(propertyName:completion:)(uint64_t a1, unint64_t a2, void (*a3)(id *), uint64_t a4)
{
  uint64_t v5 = v4;
  v32[1] = a4;
  id v33 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = type metadata accessor for EngagementDataManagerConfig();
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EBB63D30 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_1C1DD0140();
  uint64_t v12 = __swift_project_value_buffer(v11, (uint64_t)qword_1EBB63D58);
  swift_bridgeObjectRetain_n();
  v32[0] = v12;
  uint64_t v13 = sub_1C1DD0120();
  os_log_type_t v14 = sub_1C1DD0240();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    unint64_t v16 = (void *)swift_slowAlloc();
    id v35 = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v34 = (void *)sub_1C1DC9398(a1, a2, (uint64_t *)&v35);
    sub_1C1DD02D0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C1DC6000, v13, v14, "EngagementDataManager fetching properties for: %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C874A160](v16, -1, -1);
    MEMORY[0x1C874A160](v15, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_1C1DCC0DC(v5 + OBJC_IVAR____TtC23NewsEngagementCollector21EngagementDataManager_managerConfig, (uint64_t)v10);
  sub_1C1DCBB18(a1, a2, (uint64_t)v10);
  uint64_t v17 = sub_1C1DD0040();
  uint64_t v18 = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8))(v10, v17);
  uint64_t v34 = *(void **)(v5 + 56);
  MEMORY[0x1F4188790](v18);
  v32[-4] = v5;
  v32[-3] = a1;
  v32[-2] = a2;
  sub_1C1DD00C0();
  sub_1C1DCF250(0, &qword_1EBB63B30, (void (*)(uint64_t))sub_1C1DCD2E0);
  swift_retain();
  sub_1C1DD0110();
  swift_release();
  if (v35)
  {
    sub_1C1DD00D0();
    unint64_t v19 = v36;
    if (v36 >> 60 == 15)
    {
      swift_release();
    }
    else
    {
      uint64_t v20 = (uint64_t)v35;
      uint64_t v21 = self;
      Swift::Bool v22 = (void *)sub_1C1DD0050();
      id v35 = 0;
      id v23 = objc_msgSend(v21, sel_JSONObjectWithData_options_error_, v22, 0, &v35);

      if (v23)
      {
        id v24 = v35;
        sub_1C1DD02F0();
        swift_unknownObjectRelease();
        sub_1C1DCDC38();
        if (swift_dynamicCast())
        {
          id v35 = v34;
          v33(&v35);
          swift_release();
          sub_1C1DCDBCC(v20, v19);
          return swift_bridgeObjectRelease();
        }
        swift_release();
        sub_1C1DCDBCC(v20, v19);
      }
      else
      {
        id v26 = v35;
        uint64_t v27 = sub_1C1DD0030();

        swift_willThrow();
        swift_release();
        sub_1C1DCDBCC(v20, v19);
        MEMORY[0x1C874A050](v27);
      }
    }
  }
  swift_bridgeObjectRetain_n();
  uint64_t v28 = sub_1C1DD0120();
  os_log_type_t v29 = sub_1C1DD0240();
  if (os_log_type_enabled(v28, v29))
  {
    os_log_type_t v30 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = (void *)swift_slowAlloc();
    id v35 = v31;
    *(_DWORD *)os_log_type_t v30 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v34 = (void *)sub_1C1DC9398(a1, a2, (uint64_t *)&v35);
    sub_1C1DD02D0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C1DC6000, v28, v29, "EngagementDataManager no properties found for: %s", v30, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C874A160](v31, -1, -1);
    MEMORY[0x1C874A160](v30, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v35 = 0;
  return ((uint64_t (*)(id *))v33)(&v35);
}

uint64_t EngagementDataManager.__allocating_init(config:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  EngagementDataManager.init(config:)(a1);
  return v2;
}

void *EngagementDataManager.init(config:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v18 = a1;
  uint64_t v3 = sub_1C1DD00A0();
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v4 = sub_1C1DD0280();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1C1DD0190();
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v9 = sub_1C1DD0270();
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v10 = type metadata accessor for EngagementCollector();
  uint64_t v11 = swift_allocObject();
  sub_1C1DC8360();
  sub_1C1DD0260();
  sub_1C1DD0180();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FBCC58], v4);
  uint64_t v12 = sub_1C1DD02A0();
  uint64_t v13 = MEMORY[0x1E4FBC860];
  *(void *)(v11 + 16) = v12;
  *(void *)(v11 + 24) = v13;
  v2[5] = v10;
  v2[6] = &protocol witness table for EngagementCollector;
  v2[2] = v11;
  sub_1C1DD0090();
  sub_1C1DD00C0();
  swift_allocObject();
  uint64_t v14 = sub_1C1DD00B0();
  uint64_t v15 = MEMORY[0x1E4FBC868];
  v2[7] = v14;
  v2[8] = v15;
  sub_1C1DCDCA4(v18, (uint64_t)v2 + OBJC_IVAR____TtC23NewsEngagementCollector21EngagementDataManager_managerConfig);
  return v2;
}

uint64_t sub_1C1DCD22C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  swift_beginAccess();
  uint64_t v8 = *(void *)(a1 + 64);
  if (*(void *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v9 = sub_1C1DCDF1C(a2, a3);
    if (v10)
    {
      uint64_t v11 = *(void *)(*(void *)(v8 + 56) + 8 * v9);
      swift_retain();
    }
    else
    {
      uint64_t v11 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v11 = 0;
  }
  *a4 = v11;
  return swift_endAccess();
}

uint64_t sub_1C1DCD2D4@<X0>(void *a1@<X8>)
{
  return sub_1C1DCD22C(v1[2], v1[3], v1[4], a1);
}

void sub_1C1DCD2E0()
{
  if (!qword_1EBB63B28)
  {
    sub_1C1DCD348();
    sub_1C1DCD39C();
    unint64_t v0 = sub_1C1DD0100();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB63B28);
    }
  }
}

unint64_t sub_1C1DCD348()
{
  unint64_t result = qword_1EBB63B20;
  if (!qword_1EBB63B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB63B20);
  }
  return result;
}

unint64_t sub_1C1DCD39C()
{
  unint64_t result = qword_1EBB63B18;
  if (!qword_1EBB63B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBB63B18);
  }
  return result;
}

void sub_1C1DCD3F0(uint64_t a1, uint64_t *a2)
{
  v28[2] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  unint64_t v2 = a2[1];
  uint64_t v4 = qword_1EBB63D30;
  swift_bridgeObjectRetain();
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1C1DD0140();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EBB63D58);
  swift_bridgeObjectRetain_n();
  uint64_t v6 = sub_1C1DD0120();
  os_log_type_t v7 = sub_1C1DD0240();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    unint64_t v9 = (void *)swift_slowAlloc();
    v28[0] = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    swift_bridgeObjectRetain();
    sub_1C1DC9398(v3, v2, (uint64_t *)v28);
    sub_1C1DD02D0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C1DC6000, v6, v7, "EngagementDataManager storing properties for: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C874A160](v9, -1, -1);
    MEMORY[0x1C874A160](v8, -1, -1);
  }
  else
  {

    uint64_t v10 = swift_bridgeObjectRelease_n();
  }
  MEMORY[0x1F4188790](v10);
  sub_1C1DD00C0();
  sub_1C1DCF250(0, &qword_1EBB63B30, (void (*)(uint64_t))sub_1C1DCD2E0);
  swift_retain();
  sub_1C1DD0110();
  swift_release();
  if (v28[0])
  {
    uint64_t v11 = self;
    uint64_t v12 = (void *)sub_1C1DD01D0();
    v28[0] = 0;
    id v13 = objc_msgSend(v11, sel_dataWithJSONObject_options_error_, v12, 0, v28);

    id v14 = v28[0];
    if (v13)
    {
      swift_bridgeObjectRelease();
      uint64_t v15 = (void *)sub_1C1DD0060();
      uint64_t v17 = v16;

      v28[0] = v15;
      v28[1] = v17;
      sub_1C1DD00F0();
      swift_release();
      sub_1C1DCDBE0((uint64_t)v15, (unint64_t)v17);
    }
    else
    {
      Swift::Bool v22 = v14;
      uint64_t v23 = sub_1C1DD0030();

      swift_willThrow();
      MEMORY[0x1C874A050](v23);
      swift_bridgeObjectRetain();
      id v24 = sub_1C1DD0120();
      os_log_type_t v25 = sub_1C1DD0230();
      if (os_log_type_enabled(v24, v25))
      {
        id v26 = (uint8_t *)swift_slowAlloc();
        uint64_t v27 = (void *)swift_slowAlloc();
        v28[0] = v27;
        *(_DWORD *)id v26 = 136315138;
        swift_bridgeObjectRetain();
        sub_1C1DC9398(v3, v2, (uint64_t *)v28);
        sub_1C1DD02D0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1C1DC6000, v24, v25, "EngagementDataManager failed serializing value for: %s", v26, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1C874A160](v27, -1, -1);
        MEMORY[0x1C874A160](v26, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      swift_release();
    }
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_1C1DD0120();
    os_log_type_t v19 = sub_1C1DD0230();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = (void *)swift_slowAlloc();
      v28[0] = v21;
      *(_DWORD *)uint64_t v20 = 136315138;
      swift_bridgeObjectRetain();
      sub_1C1DC9398(v3, v2, (uint64_t *)v28);
      sub_1C1DD02D0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C1DC6000, v18, v19, "EngagementDataManager no store found for: %s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C874A160](v21, -1, -1);
      MEMORY[0x1C874A160](v20, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

uint64_t EngagementDataManager.deinit()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_release();
  swift_bridgeObjectRelease();
  sub_1C1DCF834(v0 + OBJC_IVAR____TtC23NewsEngagementCollector21EngagementDataManager_managerConfig, (uint64_t (*)(void))type metadata accessor for EngagementDataManagerConfig);
  return v0;
}

uint64_t EngagementDataManager.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_release();
  swift_bridgeObjectRelease();
  sub_1C1DCF834(v0 + OBJC_IVAR____TtC23NewsEngagementCollector21EngagementDataManager_managerConfig, (uint64_t (*)(void))type metadata accessor for EngagementDataManagerConfig);
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1C1DCDA8C(uint64_t a1)
{
  return EngagementDataManager.register(donor:)(a1);
}

unint64_t sub_1C1DCDAB0(uint64_t a1, uint64_t a2)
{
  return (unint64_t)EngagementDataManager.getProperties(config:)(*(NewsEngagementCollector::EngagementPropertyConfiguration *)&a1);
}

uint64_t sub_1C1DCDAD4(uint64_t a1, unint64_t a2, void (*a3)(id *), uint64_t a4)
{
  return EngagementDataManager.getProperties(propertyName:completion:)(a1, a2, a3, a4);
}

uint64_t sub_1C1DCDAF8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + 16;
  swift_beginAccess();
  return sub_1C1DC8780(v3, a1);
}

uint64_t *sub_1C1DCDB48(uint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *result;
  if (*result)
  {
    swift_beginAccess();
    unint64_t result = (uint64_t *)swift_weakLoadStrong();
    if (result)
    {
      v7[1] = a4;
      uint64_t v8 = v4;
      v7[0] = a3;
      sub_1C1DCD3F0((uint64_t)&v8, v7);
      return (uint64_t *)swift_release();
    }
  }
  return result;
}

uint64_t sub_1C1DCDBCC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1C1DCDBE0(a1, a2);
  }
  return a1;
}

uint64_t sub_1C1DCDBE0(uint64_t a1, unint64_t a2)
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

void sub_1C1DCDC38()
{
  if (!qword_1EBB63D38)
  {
    unint64_t v0 = sub_1C1DD01E0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB63D38);
    }
  }
}

uint64_t sub_1C1DCDCA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for EngagementDataManagerConfig();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C1DCDD08()
{
  return type metadata accessor for EngagementDataManager();
}

uint64_t type metadata accessor for EngagementDataManager()
{
  uint64_t result = qword_1EBB63B58;
  if (!qword_1EBB63B58) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1C1DCDD5C()
{
  uint64_t result = sub_1C1DD0040();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for EngagementDataManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for EngagementDataManager);
}

uint64_t dispatch thunk of EngagementDataManager.__allocating_init(config:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_1C1DCDE40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1C1DCDF1C(a1, a2);
  LOBYTE(a2) = v9;
  uint64_t result = swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v12 = *v4;
    uint64_t v13 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1C1DCF2A4();
      uint64_t v12 = v13;
    }
    swift_bridgeObjectRelease();
    *a3 = *(void *)(*(void *)(v12 + 56) + 8 * v8);
    sub_1C1DCE8C0(v8, v12);
    *uint64_t v4 = v12;
    return swift_bridgeObjectRelease();
  }
  else
  {
    *a3 = 0;
  }
  return result;
}

unint64_t sub_1C1DCDF1C(uint64_t a1, uint64_t a2)
{
  sub_1C1DD0420();
  sub_1C1DD0200();
  uint64_t v4 = sub_1C1DD0430();

  return sub_1C1DCF0D0(a1, a2, v4);
}

unint64_t sub_1C1DCDF94(uint64_t a1)
{
  uint64_t v2 = sub_1C1DD0410();

  return sub_1C1DCF1B4(a1, v2);
}

uint64_t sub_1C1DCDFD8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1C1DCF9B0();
  char v36 = a2;
  uint64_t v6 = sub_1C1DD0370();
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
    Swift::Bool v22 = (void *)(v5 + 64);
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
    os_log_type_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_1C1DD0420();
    sub_1C1DD0200();
    uint64_t result = sub_1C1DD0430();
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
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  Swift::Bool v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *Swift::Bool v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1C1DCE2EC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1C1DCF948();
  uint64_t result = sub_1C1DD0370();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    uint64_t v31 = v3;
    int64_t v8 = 0;
    uint64_t v9 = (void *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v13 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v16 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v17 = v16 | (v8 << 6);
      }
      else
      {
        int64_t v18 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        if (v18 >= v13) {
          goto LABEL_34;
        }
        unint64_t v19 = v9[v18];
        ++v8;
        if (!v19)
        {
          int64_t v8 = v18 + 1;
          if (v18 + 1 >= v13) {
            goto LABEL_34;
          }
          unint64_t v19 = v9[v8];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v13)
            {
LABEL_34:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v31;
                goto LABEL_41;
              }
              uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
              if (v30 >= 64) {
                bzero((void *)(v5 + 64), ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v9 = -1 << v30;
              }
              uint64_t v3 = v31;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v19 = v9[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v8 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_43;
                }
                if (v8 >= v13) {
                  goto LABEL_34;
                }
                unint64_t v19 = v9[v8];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v20;
          }
        }
LABEL_21:
        unint64_t v12 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v8 << 6);
      }
      uint64_t v21 = *(void *)(*(void *)(v5 + 48) + 8 * v17);
      uint64_t v22 = *(void *)(v5 + 56) + 16 * v17;
      if (a2) {
        sub_1C1DCAFB4(v22, (uint64_t)v32);
      }
      else {
        sub_1C1DCAE50(v22, (uint64_t)v32);
      }
      uint64_t result = sub_1C1DD0410();
      uint64_t v23 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v24 = result & ~v23;
      unint64_t v25 = v24 >> 6;
      if (((-1 << v24) & ~*(void *)(v14 + 8 * (v24 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v24) & ~*(void *)(v14 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v23) >> 6;
        do
        {
          if (++v25 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_42;
          }
          BOOL v28 = v25 == v27;
          if (v25 == v27) {
            unint64_t v25 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v14 + 8 * v25);
        }
        while (v29 == -1);
        unint64_t v15 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(void *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(void *)(*(void *)(v7 + 48) + 8 * v15) = v21;
      uint64_t result = sub_1C1DCAFB4((uint64_t)v32, *(void *)(v7 + 56) + 16 * v15);
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_41:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1C1DCE5AC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1C1DCF7CC();
  char v36 = a2;
  uint64_t v6 = sub_1C1DD0370();
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
    uint64_t v22 = (void *)(v5 + 64);
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
      swift_retain();
    }
    sub_1C1DD0420();
    sub_1C1DD0200();
    uint64_t result = sub_1C1DD0430();
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
    int64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *int64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_1C1DCE8C0(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_1C1DD0310();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1C1DD0420();
        swift_bridgeObjectRetain();
        sub_1C1DD0200();
        uint64_t v9 = sub_1C1DD0430();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          unint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *unint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (void *)(v14 + 8 * v3);
          unint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *unint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1C1DCEA98(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_1C1DD0310();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = *(void *)(a2 + 48);
        unint64_t v10 = (void *)(v9 + 8 * v6);
        uint64_t result = sub_1C1DD0410();
        unint64_t v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8 || v3 < (uint64_t)v11) {
            goto LABEL_6;
          }
        }
        else if (v11 < v8 && v3 < (uint64_t)v11)
        {
          goto LABEL_6;
        }
        uint64_t v14 = (void *)(v9 + 8 * v3);
        if (v3 != v6 || v14 >= v10 + 1) {
          *uint64_t v14 = *v10;
        }
        uint64_t v15 = *(void *)(a2 + 56);
        uint64_t result = v15 + 16 * v3;
        if (v3 < (uint64_t)v6 || result >= v15 + 16 * v6 + 16)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          BOOL v16 = v3 == v6;
          int64_t v3 = v6;
          if (v16) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_1C1DCEC58(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1C1DCDF1C(a2, a3);
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
    sub_1C1DCF2A4();
LABEL_7:
    uint64_t v18 = (void *)*v5;
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
  sub_1C1DCDFD8(v15, a4 & 1);
  unint64_t v21 = sub_1C1DCDF1C(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_1C1DD03C0();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*v5;
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

uint64_t sub_1C1DCEDC8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  unint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_1C1DCDF94(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_1C1DCF458();
      goto LABEL_7;
    }
    sub_1C1DCE2EC(v13, a3 & 1);
    unint64_t v19 = sub_1C1DCDF94(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      char v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_1C1DD03C0();
    __break(1u);
    return result;
  }
LABEL_7:
  char v16 = *v4;
  if (v14)
  {
LABEL_8:
    uint64_t v17 = v16[7] + 16 * v10;
    return sub_1C1DCF8EC(a1, v17);
  }
LABEL_13:

  return sub_1C1DCF068(v10, a2, a1, v16);
}

uint64_t sub_1C1DCEEF8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1C1DCDF1C(a2, a3);
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
    sub_1C1DCF618();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_release();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_1C1DCE5AC(v15, a4 & 1);
  unint64_t v21 = sub_1C1DCDF1C(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_1C1DD03C0();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*v5;
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

uint64_t sub_1C1DCF068(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t result = sub_1C1DCAFB4(a3, a4[7] + 16 * a1);
  uint64_t v6 = a4[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a4[2] = v8;
  }
  return result;
}

unint64_t sub_1C1DCF0D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1C1DD03B0() & 1) == 0)
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
      while (!v14 && (sub_1C1DD03B0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1C1DCF1B4(uint64_t a1, uint64_t a2)
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

void sub_1C1DCF250(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1C1DD02C0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void *sub_1C1DCF2A4()
{
  unint64_t v1 = v0;
  sub_1C1DCF9B0();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1C1DD0360();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *unint64_t v1 = v4;
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
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
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

void *sub_1C1DCF458()
{
  unint64_t v1 = v0;
  sub_1C1DCF948();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1C1DD0360();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *unint64_t v1 = v4;
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
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 16 * v15;
    sub_1C1DCAE50(*(void *)(v2 + 56) + 16 * v15, (uint64_t)v22);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    unint64_t result = (void *)sub_1C1DCAFB4((uint64_t)v22, *(void *)(v4 + 56) + v18);
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v13) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1C1DCF618()
{
  unint64_t v1 = v0;
  sub_1C1DCF7CC();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1C1DD0360();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *unint64_t v1 = v4;
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
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    unint64_t result = (void *)swift_retain();
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

void sub_1C1DCF7CC()
{
  if (!qword_1EBB63D48)
  {
    sub_1C1DCD2E0();
    unint64_t v0 = sub_1C1DD0380();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB63D48);
    }
  }
}

uint64_t sub_1C1DCF834(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_1C1DCF894()
{
  if (!qword_1EA2C0F80)
  {
    unint64_t v0 = sub_1C1DD02C0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA2C0F80);
    }
  }
}

uint64_t sub_1C1DCF8EC(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_1C1DCF948()
{
  if (!qword_1EBB63A20)
  {
    unint64_t v0 = sub_1C1DD0380();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBB63A20);
    }
  }
}

void sub_1C1DCF9B0()
{
  if (!qword_1EA2C0F88)
  {
    sub_1C1DCFA14();
    unint64_t v0 = sub_1C1DD0380();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA2C0F88);
    }
  }
}

unint64_t sub_1C1DCFA14()
{
  unint64_t result = qword_1EA2C0F90;
  if (!qword_1EA2C0F90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA2C0F90);
  }
  return result;
}

uint64_t EngagementDataManagerConfig.init(localStorageDirectory:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1C1DD0040();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);

  return v5(a2, a1, v4);
}

uint64_t EngagementDataManagerConfig.localStorageDirectory.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1C1DD0040();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t dispatch thunk of EngagementCollectorManagerType.register(donor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of EngagementCollectorManagerType.getProperties(config:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of EngagementCollectorManagerType.getProperties(propertyName:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 24))();
}

uint64_t dispatch thunk of EngagementCollectorManagerType.collector.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of EngagementCollectorType.collect(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t dispatch thunk of EngagementCollectorType.register(donor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of EngagementCollectorType.donors.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t initializeBufferWithCopyOfBuffer for EngagementDataManagerConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C1DD0040();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t destroy for EngagementDataManagerConfig(uint64_t a1)
{
  uint64_t v2 = sub_1C1DD0040();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for EngagementDataManagerConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C1DD0040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for EngagementDataManagerConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C1DD0040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for EngagementDataManagerConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C1DD0040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for EngagementDataManagerConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C1DD0040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for EngagementDataManagerConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C1DCFE68);
}

uint64_t sub_1C1DCFE68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C1DD0040();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for EngagementDataManagerConfig(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C1DCFEE8);
}

uint64_t sub_1C1DCFEE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C1DD0040();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for EngagementDataManagerConfig()
{
  uint64_t result = qword_1EBB63C20;
  if (!qword_1EBB63C20) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1C1DCFFA4()
{
  uint64_t result = sub_1C1DD0040();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1C1DD0030()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1C1DD0040()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1C1DD0050()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1C1DD0060()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1C1DD0070()
{
  return MEMORY[0x1F415DAC0]();
}

uint64_t sub_1C1DD0080()
{
  return MEMORY[0x1F415DAC8]();
}

uint64_t sub_1C1DD0090()
{
  return MEMORY[0x1F415DAD0]();
}

uint64_t sub_1C1DD00A0()
{
  return MEMORY[0x1F415DAD8]();
}

uint64_t sub_1C1DD00B0()
{
  return MEMORY[0x1F415DAE0]();
}

uint64_t sub_1C1DD00C0()
{
  return MEMORY[0x1F415DAE8]();
}

uint64_t sub_1C1DD00D0()
{
  return MEMORY[0x1F415E240]();
}

uint64_t sub_1C1DD00E0()
{
  return MEMORY[0x1F415E248]();
}

uint64_t sub_1C1DD00F0()
{
  return MEMORY[0x1F415E250]();
}

uint64_t sub_1C1DD0100()
{
  return MEMORY[0x1F415E268]();
}

uint64_t sub_1C1DD0110()
{
  return MEMORY[0x1F415EA00]();
}

uint64_t sub_1C1DD0120()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1C1DD0130()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1C1DD0140()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1C1DD0150()
{
  return MEMORY[0x1F4186C78]();
}

uint64_t sub_1C1DD0160()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1C1DD0170()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t sub_1C1DD0180()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1C1DD0190()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1C1DD01A0()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1C1DD01B0()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1C1DD01C0()
{
  return MEMORY[0x1F4186F18]();
}

uint64_t sub_1C1DD01D0()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1C1DD01E0()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t sub_1C1DD01F0()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1C1DD0200()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1C1DD0210()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1C1DD0220()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1C1DD0230()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1C1DD0240()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1C1DD0250()
{
  return MEMORY[0x1F4186F90]();
}

uint64_t sub_1C1DD0260()
{
  return MEMORY[0x1F4186FC0]();
}

uint64_t sub_1C1DD0270()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1C1DD0280()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1C1DD0290()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1C1DD02A0()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1C1DD02B0()
{
  return MEMORY[0x1F4187110]();
}

uint64_t sub_1C1DD02C0()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1C1DD02D0()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1C1DD02E0()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1C1DD02F0()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1C1DD0300()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1C1DD0310()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1C1DD0320()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1C1DD0330()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1C1DD0340()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1C1DD0350()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1C1DD0360()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1C1DD0370()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1C1DD0380()
{
  return MEMORY[0x1F4185388]();
}

uint64_t sub_1C1DD0390()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1C1DD03A0()
{
  return MEMORY[0x1F4185768]();
}

uint64_t sub_1C1DD03B0()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1C1DD03C0()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1C1DD03D0()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1C1DD03E0()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1C1DD03F0()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1C1DD0400()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1C1DD0410()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_1C1DD0420()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1C1DD0430()
{
  return MEMORY[0x1F4185EF8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1F4186590]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x1F4186848]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x1F4186850]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x1F4186870]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x1F4186878]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}