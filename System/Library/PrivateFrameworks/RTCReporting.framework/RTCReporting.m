void sub_193647BE0(uint64_t a1, uint64_t a2, os_unfair_lock_s *a3)
{
  os_unfair_lock_s *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a3 + 4;
  os_unfair_lock_lock(a3 + 4);
  sub_193654CC4(v4, &v5);
  os_unfair_lock_unlock(v3);
}

uint64_t sub_193647D00()
{
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_4_0();
  void *v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_3_0();
  void *v6 = v5;
  *(void *)(v3 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v7 = *(void *)(v3 + 56);
    v8 = sub_19365B200;
  }
  else
  {
    uint64_t v9 = *(void *)(v3 + 56);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    v8 = sub_193654FD8;
    uint64_t v7 = v9;
  }
  return MEMORY[0x1F4188298](v8, v7, 0);
}

uint64_t sub_193647E44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[3] = a4;
  v5[4] = a5;
  uint64_t v7 = sub_193668418();
  v5[5] = v7;
  v5[6] = *(void *)(v7 - 8);
  v5[7] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_193647F70, a4, 0);
}

uint64_t sub_193647F08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 != 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_193647F70()
{
  OUTLINED_FUNCTION_10_0();
  v1 = (void *)v0[4];
  swift_unknownObjectRetain();
  v0[8] = XPCMessage.init(ty:payload:)(2u, v1);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[9] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_19364802C;
  uint64_t v3 = OUTLINED_FUNCTION_13_0();
  return XPCConnection.sendWithReply(_:)(v3, v4);
}

uint64_t sub_19364802C()
{
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_4_0();
  void *v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_3_0();
  void *v6 = v5;
  *(void *)(v3 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v7 = *(void *)(v3 + 24);
    v8 = sub_19365AF98;
  }
  else
  {
    uint64_t v9 = *(void *)(v3 + 24);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    v8 = sub_193648280;
    uint64_t v7 = v9;
  }
  return MEMORY[0x1F4188298](v8, v7, 0);
}

void sub_193648138(uint64_t a1)
{
  if (qword_1EB4B2E28 != -1) {
    a1 = swift_once();
  }
  uint64_t v1 = MEMORY[0x1F4188790](a1);
  MEMORY[0x1F4188790](v1);
  uint64_t v3 = v2 + 4;
  os_unfair_lock_lock(v2 + 4);
  sub_193654444();
  os_unfair_lock_unlock(v3);
}

uint64_t sub_193648210(uint64_t a1, uint64_t a2, os_unfair_lock_s *a3)
{
  char v4 = a3 + 4;
  os_unfair_lock_lock(a3 + 4);
  sub_193654C38(v5, &v8);
  os_unfair_lock_unlock(v4);
  if (!v3) {
    char v6 = v8;
  }
  return v6 & 1;
}

uint64_t sub_193648280()
{
  OUTLINED_FUNCTION_29_0();
  sub_193655024(0);
  swift_task_dealloc();
  OUTLINED_FUNCTION_15_0();
  return v0();
}

uint64_t sub_1936482E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_193648350()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 32);
  swift_retain();
  sub_193648900((uint64_t)sub_1936554A4, v0, v1);
  uint64_t v3 = v2;
  swift_release();
  return v3;
}

uint64_t sub_1936483BC(uint64_t a1, int *a2)
{
  char v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_19364AD9C;
  return v6(a1);
}

uint64_t sub_193648498(uint64_t a1)
{
  return a1;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> _RTCReportingS.sendMessage(dictionary:)(Swift::OpaquePointer_optional dictionary)
{
  rawValue = dictionary.value._rawValue;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v4 = &v1[OBJC_IVAR____RTCReportingS_messageSentDelegate];
  swift_beginAccess();
  uint64_t v5 = (void *)MEMORY[0x1997003D0](v4);
  if (v5)
  {
    char v6 = v5;
    if (objc_msgSend(v5, sel_respondsToSelector_, sel_didSendMessageForReportingClient_event_))
    {
      uint64_t v7 = v1;
      if (rawValue)
      {
        sub_193660220((uint64_t)rawValue);
        char v8 = (void *)sub_193668468();
      }
      else
      {
        char v8 = 0;
      }
      objc_msgSend(v6, sel_didSendMessageForReportingClient_event_, v1, v8);

      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();

      if (!rawValue) {
        goto LABEL_12;
      }
      goto LABEL_7;
    }
    uint64_t v5 = (void *)swift_unknownObjectRelease();
  }
  if (!rawValue)
  {
LABEL_12:
    sub_193662EE8();
    swift_allocError();
    unsigned char *v17 = 1;
    swift_willThrow();
    return;
  }
LABEL_7:
  if (qword_1EB4B2DE8 != -1) {
    uint64_t v5 = (void *)swift_once();
  }
  MEMORY[0x1F4188790](v5);
  v18[2] = ObjectType;
  sub_193648900((uint64_t)sub_193655DDC, (uint64_t)v18, v9);
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_41();
  *(void *)(v12 - 16) = v11;
  *(void *)(v12 - 8) = ObjectType;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_30_1();
  *(void *)(v13 - 16) = sub_193655DC0;
  *(void *)(v13 - 8) = v14;
  v16 = v15 + 4;
  os_unfair_lock_lock(v15 + 4);
  sub_193654444();
  os_unfair_lock_unlock(v16);
}

void sub_193648900(uint64_t a1, uint64_t a2, os_unfair_lock_s *a3)
{
  uint64_t v3 = a3 + 4;
  os_unfair_lock_lock(a3 + 4);
  sub_19364896C(v4, &v5);
  os_unfair_lock_unlock(v3);
}

void *sub_19364896C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_193648988(a1, *(void *(**)(uint64_t *__return_ptr))(v2 + 16), a2);
}

void *sub_193648988@<X0>(uint64_t a1@<X0>, void *(*a2)(uint64_t *__return_ptr)@<X1>, void *a3@<X8>)
{
  uint64_t result = sub_1936489B4(a1, a2);
  if (!v3) {
    *a3 = result;
  }
  return result;
}

void *sub_1936489B4(uint64_t a1, void *(*a2)(uint64_t *__return_ptr))
{
  uint64_t result = a2(&v4);
  if (!v2) {
    return (void *)v4;
  }
  return result;
}

void sub_1936489EC()
{
  if (__OFSUB__(qword_1EB4B2DD8, 1))
  {
    __break(1u);
  }
  else
  {
    --qword_1EB4B2DD8;
    if (qword_1EB4B2F10 == -1) {
      goto LABEL_3;
    }
  }
  swift_once();
LABEL_3:
  uint64_t v0 = sub_193668418();
  __swift_project_value_buffer(v0, (uint64_t)qword_1EB4B2ED8);
  uint64_t v1 = sub_1936683F8();
  os_log_type_t v2 = sub_193668658();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 134349312;
    sub_1936686E8();
    *(_WORD *)(v3 + 12) = 2050;
    sub_1936686E8();
    _os_log_impl(&dword_193646000, v1, v2, "active session count now %{public}ld/%{public}ld", (uint8_t *)v3, 0x16u);
    MEMORY[0x1997002F0](v3, -1, -1);
  }
}

void _RTCReportingS.startConfiguration(completionHandler:)(void (*a1)(void), os_unfair_lock_s *a2)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = (uint64_t)v2 + OBJC_IVAR____RTCReportingS_userInfo;
  uint64_t v7 = swift_beginAccess();
  if (*(void *)(*(void *)v6 + 16))
  {
    if (qword_1EB4B2E28 != -1) {
      uint64_t v7 = swift_once();
    }
    MEMORY[0x1F4188790](v7);
    v19 = v2;
    uint64_t v20 = ObjectType;
    uint64_t v9 = sub_193648210((uint64_t)sub_193655B14, (uint64_t)v18, v8);
    if ((v9 & 1) == 0)
    {
      uint64_t v10 = MEMORY[0x1F4188790](v9);
      v18[0] = v2;
      v18[1] = a1;
      v19 = a2;
      uint64_t v20 = ObjectType;
      MEMORY[0x1F4188790](v10);
      OUTLINED_FUNCTION_30_1();
      *(void *)(v11 - 16) = sub_193655AF8;
      *(void *)(v11 - 8) = v12;
      OUTLINED_FUNCTION_28_1(v13);
      sub_19365445C();
      os_unfair_lock_unlock(a2);
      return;
    }
  }
  else
  {
    if (qword_1EB4B2DF8 != -1) {
      swift_once();
    }
    if (byte_1EB4B30C8 == 1)
    {
      if (qword_1EB4B2F10 != -1) {
        swift_once();
      }
      uint64_t v14 = sub_193668418();
      __swift_project_value_buffer(v14, (uint64_t)qword_1EB4B2ED8);
      v15 = sub_1936683F8();
      os_log_type_t v16 = sub_193668668();
      if (os_log_type_enabled(v15, v16))
      {
        v17 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_193646000, v15, v16, "RTCReporting incorrectly configured with empty userInfo", v17, 2u);
        OUTLINED_FUNCTION_14();
      }
    }
  }
  if (a1)
  {
    swift_retain();
    a1(0);
    sub_19364ACA4((uint64_t)a1);
  }
}

uint64_t static _RTCReportingS.newHierarchyTokenFromParentToken(_:)(void *a1)
{
  uint64_t v2 = sub_1936683E8();
  OUTLINED_FUNCTION_1_2();
  uint64_t v4 = v3;
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_23();
  uint64_t v7 = v6 - v5;
  if (!a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_1EB4B2A28);
    uint64_t v14 = swift_allocObject();
    uint64_t v15 = MEMORY[0x1E4FBB1A0];
    *(_OWORD *)(v14 + 16) = xmmword_19366B060;
    *(void *)(v14 + 56) = v15;
    *(void *)(v14 + 32) = 0x6E656B6F74;
    *(void *)(v14 + 40) = 0xE500000000000000;
    sub_1936683D8();
    uint64_t v16 = sub_1936683A8();
    uint64_t v18 = v17;
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v7, v2);
    *(void *)(v14 + 64) = v16;
    *(void *)(v14 + 72) = v18;
    *(void *)(v14 + 88) = v15;
    *(void *)(v14 + 96) = 0x6C6576656CLL;
    *(void *)(v14 + 104) = 0xE500000000000000;
    *(void *)(v14 + 152) = MEMORY[0x1E4FBB550];
    *(void *)(v14 + 120) = v15;
    *(void *)(v14 + 128) = 1;
    sub_193654BB0(0, (unint64_t *)&unk_1EB4B2D80);
    return sub_193668638();
  }
  self;
  uint64_t v8 = swift_dynamicCastObjCClass();
  if (!v8) {
    return 0;
  }
  uint64_t v9 = (void *)v8;
  *(void *)&long long v25 = 0x6E656B6F74;
  *((void *)&v25 + 1) = 0xE500000000000000;
  id v10 = a1;
  id v11 = objc_msgSend(v9, sel___swift_objectForKeyedSubscript_, sub_1936688A8());
  swift_unknownObjectRelease();
  if (!v11)
  {

    return 0;
  }
  sub_193668748();
  swift_unknownObjectRelease();
  sub_193650D74(&v25, v27);
  *(void *)&v24[0] = 0x6C6576656CLL;
  *((void *)&v24[0] + 1) = 0xE500000000000000;
  uint64_t v12 = MEMORY[0x1E4FBB1A0];
  id v13 = objc_msgSend(v9, sel___swift_objectForKeyedSubscript_, sub_1936688A8());
  swift_unknownObjectRelease();
  if (v13)
  {
    sub_193668748();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v24, 0, sizeof(v24));
  }
  sub_193651544((uint64_t)v24, (uint64_t)&v25, &qword_1EB4B2E90);
  if (!v26)
  {

    sub_1936530CC((uint64_t)&v25, &qword_1EB4B2E90);
LABEL_15:
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v27);
    return 0;
  }
  uint64_t v20 = MEMORY[0x1E4FBB550];
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_15;
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_1EB4B2A28);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_19366B060;
  *(void *)(v21 + 56) = v12;
  *(void *)(v21 + 32) = 0x6E656B6F74;
  *(void *)(v21 + 40) = 0xE500000000000000;
  uint64_t result = sub_193650D18((uint64_t)v27, v21 + 64);
  *(void *)(v21 + 120) = v12;
  *(void *)(v21 + 96) = 0x6C6576656CLL;
  *(void *)(v21 + 104) = 0xE500000000000000;
  if (!__OFADD__(v23, 1))
  {
    *(void *)(v21 + 152) = v20;
    *(void *)(v21 + 128) = v23 + 1;
    sub_193654BB0(0, (unint64_t *)&unk_1EB4B2D80);
    uint64_t v19 = sub_193668638();

    __swift_destroy_boxed_opaque_existential_0((uint64_t)v27);
    return v19;
  }
  __break(1u);
  return result;
}

uint64_t sub_1936491C0()
{
  char v1 = *(unsigned char *)(v0 + 376);
  uint64_t v3 = *(void *)(v0 + 304);
  uint64_t v2 = *(void *)(v0 + 312);
  long long v19 = *(_OWORD *)(v0 + 272);
  long long v20 = *(_OWORD *)(v0 + 288);
  long long v17 = *(_OWORD *)(v0 + 240);
  long long v18 = *(_OWORD *)(v0 + 256);
  uint64_t v4 = *(unsigned __int16 *)(v0 + 114);
  uint64_t v21 = *(void *)(v0 + 200);
  char v5 = *(unsigned char *)(v0 + 377) & 1;
  uint64_t v6 = *(unsigned char *)(v0 + 113) & 1;
  uint64_t v7 = *(unsigned int *)(v0 + 116);
  *(void *)(v0 + 320) = sub_193655070(*(void *)(v0 + 160));
  *(void *)(v0 + 328) = v8;
  *(void *)(v0 + 16) = v4 | (v7 << 32);
  *(_OWORD *)(v0 + 24) = v17;
  *(_OWORD *)(v0 + 40) = v18;
  *(_OWORD *)(v0 + 56) = v19;
  *(_OWORD *)(v0 + 72) = v20;
  *(void *)(v0 + 88) = v3;
  *(void *)(v0 + 96) = v6 & 0xFFFFFFFFFFFFFEFFLL | ((unint64_t)(v1 & 1) << 8);
  *(void *)(v0 + 104) = v2;
  *(unsigned char *)(v0 + 112) = v5;
  type metadata accessor for Session();
  swift_allocObject();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_193648498(v21);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 336) = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_193655884;
  uint64_t v10 = OUTLINED_FUNCTION_16_1();
  return sub_19364C8A8(v10, v11, v12, v13, v14, v15, v0 + 16, 1);
}

void sub_193649358(char *a1@<X8>)
{
  uint64_t v4 = qword_1EB4B2DD8 + 1;
  if (__OFADD__(qword_1EB4B2DD8, 1))
  {
    __break(1u);
LABEL_15:
    swift_once();
    goto LABEL_4;
  }
  uint64_t v2 = v1;
  ++qword_1EB4B2DD8;
  if (qword_1E9328030 >= v4)
  {
    if (qword_1EB4B2F10 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_193668418();
    __swift_project_value_buffer(v14, (uint64_t)qword_1EB4B2ED8);
    uint64_t v15 = sub_1936683F8();
    os_log_type_t v16 = sub_193668658();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 134349312;
      sub_1936686E8();
      *(_WORD *)(v17 + 12) = 2050;
      sub_1936686E8();
      _os_log_impl(&dword_193646000, v15, v16, "active session count now %{public}ld/%{public}ld", (uint8_t *)v17, 0x16u);
      MEMORY[0x1997002F0](v17, -1, -1);
    }

    char v13 = 0;
    goto LABEL_13;
  }
  if (qword_1EB4B2F10 != -1) {
    goto LABEL_15;
  }
LABEL_4:
  uint64_t v5 = sub_193668418();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EB4B2ED8);
  uint64_t v6 = sub_1936683F8();
  os_log_type_t v7 = sub_193668668();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 134349056;
    sub_1936686E8();
    _os_log_impl(&dword_193646000, v6, v7, "RTCReporting session limit (%{public}ld) exceeded", v8, 0xCu);
    MEMORY[0x1997002F0](v8, -1, -1);
  }

  uint64_t v10 = MEMORY[0x1F4188790](v9);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = v11 + 4;
  os_unfair_lock_lock(v11 + 4);
  sub_193654444();
  if (!v2)
  {
    os_unfair_lock_unlock(v12);
    char v13 = 1;
LABEL_13:
    *a1 = v13;
    return;
  }
  os_unfair_lock_unlock(v12);
  __break(1u);
}

uint64_t sub_193649654(uint64_t a1)
{
  uint64_t v2 = v1;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(*(void *)(v2 + OBJC_IVAR____RTCReportingS_lock) + 16));
  uint64_t v4 = sub_193651128(a1);
  uint64_t v5 = sub_193654610(v4);
  swift_bridgeObjectRelease();
  if (!*(void *)(v5 + 16))
  {
    swift_release();
    uint64_t v5 = 0;
  }
  *(void *)(v2 + OBJC_IVAR____RTCReportingS_extraFields) = v5;
  return swift_bridgeObjectRelease();
}

void sub_193649960(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_12();
  a19 = v22;
  a20 = v23;
  long long v25 = v24;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2E20);
  uint64_t v27 = OUTLINED_FUNCTION_7(v26);
  MEMORY[0x1F4188790](v27);
  uint64_t v28 = OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v30 = v29;
  MEMORY[0x1F4188790](v31);
  OUTLINED_FUNCTION_6();
  v34 = (void *)(v32 - v33);
  MEMORY[0x1F4188790](v35);
  v37 = (char *)&a9 - v36;
  uint64_t v38 = *v21;
  if (*v25 != -1) {
    swift_once();
  }
  if (!*(void *)(v38 + 16))
  {
    OUTLINED_FUNCTION_30(v20, 1);
LABEL_9:
    sub_1936530CC(v20, &qword_1EB4B2E20);
LABEL_15:
    OUTLINED_FUNCTION_11();
    return;
  }
  swift_bridgeObjectRetain();
  unint64_t v39 = sub_193650F38();
  if (v40)
  {
    sub_193652B74(*(void *)(v38 + 56) + *(void *)(v30 + 72) * v39, v20);
    uint64_t v41 = 0;
  }
  else
  {
    uint64_t v41 = 1;
  }
  OUTLINED_FUNCTION_30(v20, v41);
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload(v20, 1, v28) == 1) {
    goto LABEL_9;
  }
  sub_193652D08(v20, (uint64_t)v37);
  sub_193652B74((uint64_t)v37, (uint64_t)v34);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload != 2)
  {
    if (EnumCaseMultiPayload != 1)
    {
      sub_1936524D8((uint64_t)v37, (void (*)(void))type metadata accessor for EventValue);
      uint64_t v43 = OUTLINED_FUNCTION_29();
      sub_1936524D8(v43, v44);
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if ((*v34 & 0x8000000000000000) == 0)
  {
LABEL_14:
    sub_1936524D8((uint64_t)v37, (void (*)(void))type metadata accessor for EventValue);
    goto LABEL_15;
  }
  __break(1u);
}

void *RTCReportingStartConfiguration(void *result, uint64_t a2)
{
  if (result)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __RTCReportingStartConfiguration_block_invoke;
    v2[3] = &unk_1E576F530;
    v2[4] = a2;
    return (void *)[result startConfigurationWithCompletionHandler:v2];
  }
  return result;
}

void *RTCReportingSetMessageBlock(void *result, uint64_t a2)
{
  if (result)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __RTCReportingSetMessageBlock_block_invoke;
    v2[3] = &unk_1E576F558;
    v2[4] = a2;
    return (void *)[result setMessageLoggingBlock:v2];
  }
  return result;
}

uint64_t sub_193649C74()
{
  char v1 = *(unsigned char *)(v0 + 64);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v5 = *(void *)(v2 + 40);
  uint64_t v6 = swift_task_alloc();
  *(void *)(v0 + 40) = v6;
  *(void *)(v6 + 16) = v4;
  *(void *)(v6 + 24) = v3;
  *(unsigned char *)(v6 + 32) = v1;
  *(void *)(v6 + 40) = v5;
  os_log_type_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v7;
  *os_log_type_t v7 = v0;
  v7[1] = sub_19364A010;
  return MEMORY[0x1F4188160](v0 + 16, 0, 0, 0xD000000000000011, 0x800000019366A980, sub_1936544A8, v6, &type metadata for RTCXPCDictionary);
}

void sub_193649D8C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2EB8);
  uint64_t v3 = MEMORY[0x1F4188790](v2 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned char *)(a1 + OBJC_IVAR____RTCReportingS_terminated) & 1) == 0)
  {
    sub_193648138(v3);
    uint64_t v6 = *(void *)(a1 + OBJC_IVAR____RTCReportingS_session);
    if (v6)
    {
      swift_retain();
      sub_1936685D8();
      uint64_t v7 = sub_1936685F8();
      __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v7);
      uint64_t v8 = (void *)swift_allocObject();
      v8[2] = 0;
      v8[3] = 0;
      v8[4] = v6;
      swift_retain();
      sub_19364B374((uint64_t)v5, (uint64_t)&unk_1E9328378, (uint64_t)v8);
      swift_release();
      swift_release();
      sub_1936530CC((uint64_t)v5, &qword_1EB4B2EB8);
    }
  }
}

uint64_t sub_193649EC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1936685F8();
  if (__swift_getEnumTagSinglePayload(a1, 1, v5) == 1)
  {
    sub_1936530CC(a1, &qword_1EB4B2EB8);
  }
  else
  {
    sub_1936685E8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1936685A8();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_19364A010()
{
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_193666FC0;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_1936544B8;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

id _RTCReportingS.__deallocating_deinit()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = *(os_unfair_lock_s **)&v0[OBJC_IVAR____RTCReportingS_lock];
  swift_retain();
  os_unfair_lock_lock(v2 + 4);
  OUTLINED_FUNCTION_45();
  sub_193654444();
  os_unfair_lock_unlock(v2 + 4);
  swift_release();
  v4.receiver = v0;
  v4.super_class = ObjectType;
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t sub_19364A1D8()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = *(void *)(v1 + 184);
  if (v2 && *(unsigned char *)(v1 + 320))
  {
    uint64_t v3 = *(void *)(v1 + 176);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB4B2E38);
    objc_super v4 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2E80) - 8);
    unint64_t v5 = (*(unsigned __int8 *)(*(void *)v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v4 + 80);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_19366AD30;
    uint64_t v7 = (void *)(v6 + v5);
    uint64_t v8 = (void *)(v6 + v5 + v4[14]);
    swift_bridgeObjectRetain();
    uint64_t v9 = MessageKeys.sessionID.unsafeMutableAddressor();
    uint64_t v10 = v9[1];
    *uint64_t v7 = *v9;
    v7[1] = v10;
    void *v8 = v3;
    v8[1] = v2;
    type metadata accessor for XPCObject();
    swift_storeEnumTagMultiPayload();
    swift_bridgeObjectRetain();
    xpc_object_t v11 = RTCXPCDictionary.init(dictionaryLiteral:)(v6);
    v0[8] = XPCMessage.init(ty:payload:)(1u, v11);
    uint64_t v12 = (void *)swift_task_alloc();
    v0[9] = v12;
    *uint64_t v12 = v0;
    v12[1] = sub_193647D00;
    uint64_t v13 = OUTLINED_FUNCTION_13_0();
    return XPCConnection.sendWithReply(_:)(v13, v14);
  }
  else
  {
    *(unsigned char *)(v1 + 320) = 2;
    OUTLINED_FUNCTION_8_0();
    return v16();
  }
}

uint64_t sub_19364A3CC(unsigned char *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v34 = a8;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2EB8);
  MEMORY[0x1F4188790](v15 - 8);
  uint64_t v17 = (char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v18 = &a1[OBJC_IVAR____RTCReportingS_generatedSessionID];
  *long long v18 = a2;
  v18[1] = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[OBJC_IVAR____RTCReportingS_session] = a4;
  swift_release();
  a1[OBJC_IVAR____RTCReportingS_completelyDisabled] = a5;
  BOOL v19 = a6 == 17238 && a7 == 0xE200000000000000;
  if (v19
    || ((char v20 = sub_193668878(), a6 == 21580) ? (v21 = a7 == 0xE200000000000000) : (v21 = 0),
        !v21 ? (char v22 = 0) : (char v22 = 1),
        (v20 & 1) != 0
     || (v22 & 1) != 0
     || (sub_193668878() & 1) != 0
     || (a6 == 0x4D41434B48 ? (BOOL v23 = a7 == 0xE500000000000000) : (BOOL v23 = 0), v23 || (sub_193668878() & 1) != 0)))
  {
    id v24 = objc_allocWithZone((Class)RTCReportingAVCLegacySupport);
    swift_retain();
    id v25 = objc_msgSend(v24, sel_init);
    uint64_t v26 = *(void **)&a1[OBJC_IVAR____RTCReportingS_legacyAVCSupport];
    *(void *)&a1[OBJC_IVAR____RTCReportingS_legacyAVCSupport] = v25;
  }
  else
  {
    swift_retain();
  }
  uint64_t v27 = (uint64_t *)&a1[OBJC_IVAR____RTCReportingS_earlyCachedEvents];
  uint64_t result = swift_beginAccess();
  uint64_t v29 = *v27;
  if (*v27)
  {
    *uint64_t v27 = 0;
    sub_1936685D8();
    uint64_t v30 = sub_1936685F8();
    __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v30);
    uint64_t v31 = (void *)swift_allocObject();
    v31[2] = 0;
    v31[3] = 0;
    v31[4] = v29;
    v31[5] = a1;
    v31[6] = v34;
    uint64_t v32 = a1;
    sub_19364B374((uint64_t)v17, (uint64_t)&unk_1E9328430, (uint64_t)v31);
    swift_release();
    return sub_1936530CC((uint64_t)v17, &qword_1EB4B2EB8);
  }
  return result;
}

id _RTCReportingS.init(sessionInfo:userInfo:frameworksToCheck:aggregationBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  swift_bridgeObjectRelease();
  unint64_t v5 = (uint64_t *)&v4[OBJC_IVAR____RTCReportingS_messageLoggingBlock];
  *unint64_t v5 = 0;
  v5[1] = 0;
  uint64_t v17 = (uint64_t)&v4[OBJC_IVAR____RTCReportingS_messageSentDelegate];
  swift_unknownObjectWeakInit();
  uint64_t v6 = OBJC_IVAR____RTCReportingS_lock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2EF8);
  uint64_t v7 = swift_allocObject();
  *(_DWORD *)(v7 + 16) = 0;
  *(void *)&v4[v6] = v7;
  *(void *)&v4[OBJC_IVAR____RTCReportingS_session] = 0;
  v4[OBJC_IVAR____RTCReportingS_configured] = 0;
  uint64_t v8 = OBJC_IVAR____RTCReportingS_connectionManager;
  uint64_t v9 = qword_1EB4B2EC8;
  uint64_t v10 = v4;
  if (v9 != -1) {
    swift_once();
  }
  *(void *)&v4[v8] = qword_1EB4B30D8;
  xpc_object_t v11 = &v10[OBJC_IVAR____RTCReportingS_generatedSessionID];
  *xpc_object_t v11 = 0;
  v11[1] = 0;
  uint64_t v12 = OBJC_IVAR____RTCReportingS_deprecatedPeriodic;
  *(void *)&v10[OBJC_IVAR____RTCReportingS_deprecatedPeriodic] = 0;
  uint64_t v13 = OBJC_IVAR____RTCReportingS_legacyAVCSupport;
  *(void *)&v10[OBJC_IVAR____RTCReportingS_legacyAVCSupport] = 0;
  *(void *)&v10[OBJC_IVAR____RTCReportingS_earlyCachedEvents] = 0;
  v10[OBJC_IVAR____RTCReportingS_completelyDisabled] = 0;
  *(void *)&v10[OBJC_IVAR____RTCReportingS_extraFields] = 0;
  v10[OBJC_IVAR____RTCReportingS_terminated] = 0;
  *(void *)&v10[OBJC_IVAR____RTCReportingS_sentEventCount] = 0;
  swift_retain();
  if (sub_193655438())
  {
    *(void *)&v10[OBJC_IVAR____RTCReportingS_sessionInfo] = a1;
    uint64_t v14 = MEMORY[0x1E4FBC868];
    if (a2) {
      uint64_t v14 = a2;
    }
    *(void *)&v10[OBJC_IVAR____RTCReportingS_userInfo] = v14;

    v22.receiver = v10;
    v22.super_class = ObjectType;
    id v15 = objc_msgSendSuper2(&v22, sel_init);
    sub_19364ACA4(a4);
  }
  else
  {
    sub_19364ACA4(a4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_19364ACA4(*v5);
    sub_193654B88(v17);
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v15;
}

uint64_t sub_19364A8E0()
{
  OUTLINED_FUNCTION_10_0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_2(v0);
  void *v1 = v2;
  v1[1] = sub_193654440;
  uint64_t v3 = OUTLINED_FUNCTION_20_1();
  return v4(v3);
}

void sub_19364AA6C()
{
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = *(void *)(v1 + 344);
  BOOL v3 = __OFSUB__(v2, 1);
  uint64_t v4 = v2 - 1;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v1 + 344) = v4;
    unint64_t v5 = *(void (**)(uint64_t))(v1 + 328);
    if (v5)
    {
      if (v4)
      {
        swift_retain();
      }
      else
      {
        uint64_t v6 = swift_retain();
        v5(v6);
        sub_19365A83C(0, 0);
      }
      swift_unknownObjectRelease();
      swift_release();
      sub_19364ACA4((uint64_t)v5);
    }
    else
    {
      swift_unknownObjectRelease();
      swift_release();
    }
    OUTLINED_FUNCTION_24_0();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_15_0();
    v7();
  }
}

uint64_t sub_19364AB9C()
{
  swift_unknownObjectRelease();
  uint64_t v1 = v0[74];
  uint64_t v2 = v0[72];
  swift_unknownObjectRelease();
  sub_19364ACA4(v2);
  sub_19364ACA4(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  BOOL v3 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v4 = v0[56];
  return v3(v4);
}

uint64_t sub_19364ACA4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_19364ACB4(uint64_t a1)
{
  sub_193650ED4(a1, &v5);
  if (v6)
  {
    if ((OUTLINED_FUNCTION_28_0() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
    uint64_t v2 = v4;
    sub_193650ED4(a1, &v5);
    swift_bridgeObjectRelease();
    if (v6)
    {
      if (OUTLINED_FUNCTION_28_0()) {
        return v2;
      }
      return 0;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_1936530CC((uint64_t)&v5, &qword_1EB4B2E90);
  return 0;
}

uint64_t sub_19364AD9C()
{
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_8_0();
  return v3();
}

id _RTCReportingS.init(sessionInfo:userInfo:frameworksToCheck:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)sub_193668468();
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)sub_193668468();
  swift_bridgeObjectRelease();
  if (a3)
  {
    uint64_t v7 = (void *)sub_193668588();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = objc_msgSend(v3, sel_initWithSessionInfo_userInfo_frameworksToCheck_aggregationBlock_, v5, v6, v7, 0);

  return v8;
}

uint64_t sub_19364AF50()
{
  OUTLINED_FUNCTION_27_1();
  char v1 = *(unsigned char *)(v0 + 378);
  uint64_t v3 = *(void *)(v0 + 344);
  uint64_t v2 = *(void *)(v0 + 352);
  long long v13 = *(_OWORD *)(v0 + 320);
  long long v14 = *(_OWORD *)(v0 + 360);
  uint64_t v4 = *(void *)(v0 + 232);
  uint64_t v5 = *(void *)(v0 + 208);
  uint64_t v6 = *(os_unfair_lock_s **)(v5 + OBJC_IVAR____RTCReportingS_lock);
  uint64_t v7 = swift_task_alloc();
  *(void *)(v7 + 16) = v5;
  *(_OWORD *)(v7 + 24) = v14;
  *(void *)(v7 + 40) = v3;
  *(unsigned char *)(v7 + 48) = v1;
  *(_OWORD *)(v7 + 56) = v13;
  *(void *)(v7 + 72) = v4;
  uint64_t v8 = swift_task_alloc();
  *(void *)(v8 + 16) = sub_1936557E0;
  *(void *)(v8 + 24) = v7;
  os_unfair_lock_lock(v6 + 4);
  sub_193654444();
  os_unfair_lock_unlock(v6 + 4);
  if (v2)
  {
    return swift_task_dealloc();
  }
  else
  {
    uint64_t v10 = *(void *)(v0 + 216);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    if (v10)
    {
      xpc_object_t v11 = *(void (**)(void))(v0 + 216);
      swift_retain();
      v11(MEMORY[0x1E4FBC860]);
      swift_release();
      sub_19364ACA4((uint64_t)v11);
    }
    else
    {
      swift_release();
    }
    OUTLINED_FUNCTION_8_0();
    return v12();
  }
}

uint64_t *Session.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1936482E8(v0[26], v0[27], v0[28], v0[29]);
  swift_release();
  sub_19364ACA4(v0[41]);
  sub_193668398();
  OUTLINED_FUNCTION_1_0();
  uint64_t v2 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 8);
  OUTLINED_FUNCTION_23_0();
  v2(v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_23_0();
  v2(v8, v9, v10, v11, v12);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_19364B1E8()
{
  OUTLINED_FUNCTION_10_0();
  uint64_t v3 = v2;
  *(void *)(v1 + 64) = v0;
  *(void *)(v1 + 72) = *v0;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2EB8);
  OUTLINED_FUNCTION_7(v4);
  *(void *)(v1 + 80) = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2E20);
  OUTLINED_FUNCTION_7(v5);
  *(void *)(v1 + 88) = OUTLINED_FUNCTION_16_0();
  *(void *)(v1 + 96) = swift_task_alloc();
  uint64_t v6 = type metadata accessor for EventValue();
  *(void *)(v1 + 104) = v6;
  OUTLINED_FUNCTION_7(v6);
  *(void *)(v1 + 112) = OUTLINED_FUNCTION_16_0();
  *(void *)(v1 + 120) = swift_task_alloc();
  uint64_t v7 = sub_193668398();
  *(void *)(v1 + 128) = v7;
  *(void *)(v1 + 136) = *(void *)(v7 - 8);
  *(void *)(v1 + 144) = OUTLINED_FUNCTION_16_0();
  uint64_t v8 = swift_task_alloc();
  uint64_t v9 = *v3;
  *(void *)(v1 + 152) = v8;
  *(void *)(v1 + 160) = v9;
  *(unsigned char *)(v1 + 25) = *((unsigned char *)v3 + 8);
  return MEMORY[0x1F4188298](sub_19364BDF8, v0, 0);
}

uint64_t sub_19364B374(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_19364B484(a1, 0, 0, 0, 1, 0, 0);
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1936685A8();
    swift_unknownObjectRelease();
  }
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a2;
  *(void *)(v5 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_19364B484(uint64_t a1, char a2, char a3, char a4, char a5, char a6, char a7)
{
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2EB8);
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v16 = (char *)&v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_193653120(a1, (uint64_t)v16, &qword_1EB4B2EB8);
  uint64_t v17 = sub_1936685F8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17) == 1)
  {
    sub_1936530CC((uint64_t)v16, &qword_1EB4B2EB8);
    uint64_t result = 0;
    if ((a2 & 1) == 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unsigned __int8 v19 = sub_1936685E8();
    (*(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
    uint64_t result = v19;
    if ((a2 & 1) == 0)
    {
LABEL_3:
      if (a3) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  result |= 0x100uLL;
  if (a3)
  {
LABEL_4:
    result |= 0x400uLL;
    if ((a4 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  if ((a4 & 1) == 0)
  {
LABEL_5:
    if ((a5 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_15:
  result |= 0x800uLL;
  if (a5) {
LABEL_6:
  }
    result |= 0x1000uLL;
LABEL_7:
  if (a6) {
    result |= 0x2000uLL;
  }
  if (a7) {
    return result | 0x4000;
  }
  return result;
}

uint64_t sub_19364B5F4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_19364B654(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2E08);
  return sub_19364B6C8(a1);
}

uint64_t sub_19364B6C8(uint64_t a1)
{
  if (MEMORY[0x1997005E0]() == MEMORY[0x1E4F145A8])
  {
    sub_193667140();
    swift_allocError();
    *uint64_t v3 = a1;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2E08);
    return sub_1936685B8();
  }
  else
  {
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2E08);
    return sub_1936685C8();
  }
}

uint64_t sub_19364B774(uint64_t a1, _xpc_connection_s *a2, void *a3, uint64_t a4, NSObject *a5)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2E08);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x1F4188790](v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)aBlock - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v13 + v12, (char *)aBlock - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  aBlock[4] = sub_19364B654;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_19364B5F4;
  aBlock[3] = &block_descriptor_10;
  uint64_t v14 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  swift_release();
  xpc_connection_send_message_with_reply(a2, a3, a5, v14);
  _Block_release(v14);
  return swift_unknownObjectRelease();
}

uint64_t sub_19364B940(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v25 = a2;
  uint64_t v26 = a1;
  uint64_t v5 = type metadata accessor for EventValue();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t result = MEMORY[0x1F4188790](v5 - 8);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = 0;
  int64_t v10 = 0;
  uint64_t v11 = a3 + 64;
  uint64_t v12 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(a3 + 64);
  int64_t v29 = (unint64_t)(v12 + 63) >> 6;
  while (v14)
  {
    unint64_t v15 = __clz(__rbit64(v14));
    v14 &= v14 - 1;
    unint64_t v16 = v15 | (v10 << 6);
LABEL_17:
    uint64_t v20 = *(void *)(a3 + 56);
    BOOL v21 = (uint64_t *)(*(void *)(a3 + 48) + 16 * v16);
    uint64_t v22 = v21[1];
    v28[0] = *v21;
    v28[1] = v22;
    sub_193652B74(v20 + *(void *)(v6 + 72) * v16, (uint64_t)v9);
    swift_bridgeObjectRetain();
    char v23 = sub_19364BC04(v28, (uint64_t)v9);
    sub_19364BBA8((uint64_t)v9);
    uint64_t result = swift_bridgeObjectRelease();
    if (v3) {
      return result;
    }
    if (v23)
    {
      *(unint64_t *)((char *)v26 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      BOOL v17 = __OFADD__(v27++, 1);
      if (v17) {
        goto LABEL_30;
      }
    }
  }
  BOOL v17 = __OFADD__(v10++, 1);
  if (v17)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v10 >= v29) {
    return sub_193654774(v26, v25, v27, (void *)a3);
  }
  unint64_t v18 = *(void *)(v11 + 8 * v10);
  if (v18)
  {
LABEL_16:
    unint64_t v14 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v10 << 6);
    goto LABEL_17;
  }
  int64_t v19 = v10 + 1;
  if (v10 + 1 >= v29) {
    return sub_193654774(v26, v25, v27, (void *)a3);
  }
  unint64_t v18 = *(void *)(v11 + 8 * v19);
  if (v18) {
    goto LABEL_15;
  }
  int64_t v19 = v10 + 2;
  if (v10 + 2 >= v29) {
    return sub_193654774(v26, v25, v27, (void *)a3);
  }
  unint64_t v18 = *(void *)(v11 + 8 * v19);
  if (v18) {
    goto LABEL_15;
  }
  int64_t v19 = v10 + 3;
  if (v10 + 3 >= v29) {
    return sub_193654774(v26, v25, v27, (void *)a3);
  }
  unint64_t v18 = *(void *)(v11 + 8 * v19);
  if (v18)
  {
LABEL_15:
    int64_t v10 = v19;
    goto LABEL_16;
  }
  while (1)
  {
    int64_t v10 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v10 >= v29) {
      return sub_193654774(v26, v25, v27, (void *)a3);
    }
    unint64_t v18 = *(void *)(v11 + 8 * v10);
    ++v19;
    if (v18) {
      goto LABEL_16;
    }
  }
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_19364BBA8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for EventValue();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_19364BC04(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2EB0);
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  uint64_t v7 = (void *)((char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = MEMORY[0x1F4188790](v5);
  int64_t v10 = (void *)((char *)v21 - v9);
  uint64_t v12 = *a1;
  uint64_t v11 = a1[1];
  uint64_t v13 = (char *)v21 + *(int *)(v8 + 48) - v9;
  *int64_t v10 = v12;
  v10[1] = v11;
  sub_193652B74(a2, (uint64_t)v13);
  if (v12 == 0x4E746E65696C635FLL && v11 == 0xEB00000000656D61)
  {
    uint64_t v19 = (uint64_t)v7 + *(int *)(v4 + 48);
    *uint64_t v7 = 0x4E746E65696C635FLL;
    v7[1] = v11;
    sub_193652B74((uint64_t)v13, v19);
    goto LABEL_12;
  }
  char v15 = sub_193668878();
  uint64_t v16 = (uint64_t)v7 + *(int *)(v4 + 48);
  *uint64_t v7 = v12;
  v7[1] = v11;
  sub_193652B74((uint64_t)v13, v16);
  char v17 = 0;
  if ((v15 & 1) == 0)
  {
    if (v12 != 0x656369767265735FLL || v11 != 0xEC000000656D614ELL)
    {
      char v17 = sub_193668878() ^ 1;
      goto LABEL_13;
    }
LABEL_12:
    char v17 = 0;
  }
LABEL_13:
  swift_bridgeObjectRetain_n();
  sub_1936530CC((uint64_t)v7, &qword_1EB4B2EB0);
  sub_1936530CC((uint64_t)v10, &qword_1EB4B2EB0);
  return v17 & 1;
}

uint64_t sub_19364BDF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = (uint64_t *)(v8 + 64);
  if (*(unsigned char *)(*(void *)(v8 + 64) + 320) != 1) {
    goto LABEL_18;
  }
  char v10 = *(unsigned char *)(v8 + 25);
  LOBYTE(v88) = v10;
  Event.category.getter(a1, a2, a3, a4, a5, a6, a7, a8, v81, v82, v83, v84, v85, v86, *(void *)(v8 + 160), v88, v89, v90, v91,
    v92);
  uint64_t v12 = *(void *)(v8 + 64);
  if ((v13 & 1) == 0)
  {
    uint64_t v14 = v11;
    uint64_t v15 = *(void *)(v12 + 160);
    if (*(void *)(v15 + 16))
    {
      if (!sub_19365AECC(v11, v15))
      {
        if (qword_1EB4B2BB0 != -1) {
          swift_once();
        }
        uint64_t v22 = sub_193668418();
        __swift_project_value_buffer(v22, (uint64_t)qword_1EB4B30B0);
        unint64_t v18 = sub_1936683F8();
        os_log_type_t v19 = sub_193668658();
        if (!os_log_type_enabled(v18, v19)) {
          goto LABEL_17;
        }
        uint64_t v20 = (uint8_t *)OUTLINED_FUNCTION_25_0();
        *(_DWORD *)uint64_t v20 = 134349056;
        *(void *)(v8 + 48) = v14;
        sub_1936686E8();
        BOOL v21 = "dropping event with category %{public}ld due to allowlist";
        goto LABEL_16;
      }
      uint64_t v12 = *v9;
    }
    uint64_t v16 = *(void *)(v12 + 168);
    if (*(void *)(v16 + 16))
    {
      if (sub_19365AECC(v14, v16))
      {
        if (qword_1EB4B2BB0 != -1) {
          swift_once();
        }
        uint64_t v17 = sub_193668418();
        __swift_project_value_buffer(v17, (uint64_t)qword_1EB4B30B0);
        unint64_t v18 = sub_1936683F8();
        os_log_type_t v19 = sub_193668658();
        if (!os_log_type_enabled(v18, v19)) {
          goto LABEL_17;
        }
        uint64_t v20 = (uint8_t *)OUTLINED_FUNCTION_25_0();
        *(_DWORD *)uint64_t v20 = 134349056;
        *(void *)(v8 + 56) = v14;
        sub_1936686E8();
        BOOL v21 = "dropping event with category %{public}ld due to denylist";
LABEL_16:
        _os_log_impl(&dword_193646000, v18, v19, v21, v20, 0xCu);
        OUTLINED_FUNCTION_14();
LABEL_17:

LABEL_18:
        OUTLINED_FUNCTION_24_0();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        OUTLINED_FUNCTION_15_0();
        OUTLINED_FUNCTION_7_0();
        __asm { BRAA            X1, X16 }
      }
      uint64_t v12 = *v9;
    }
  }
  *(void *)(v8 + 16) = *(void *)(v8 + 160);
  *(unsigned char *)(v8 + 24) = v10;
  if (*(unsigned char *)(v12 + 200) != 1)
  {
    swift_bridgeObjectRetain();
    goto LABEL_28;
  }
  uint64_t v25 = qword_1EB4B2DF8;
  swift_bridgeObjectRetain();
  if (v25 != -1) {
    goto LABEL_38;
  }
  while (1)
  {
    if (byte_1EB4B30C8)
    {
      uint64_t v26 = *(void *)(v8 + 136);
      uint64_t v27 = *(void *)(v8 + 144);
      uint64_t v28 = *(void *)(v8 + 128);
      int64_t v29 = *(double **)(v8 + 112);
      uint64_t v30 = *(double **)(v8 + 96);
      sub_193668378();
      sub_19364C6B4(v29);
      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v27, v28);
      sub_19364C6B4(v30);
      OUTLINED_FUNCTION_5_0();
      OUTLINED_FUNCTION_22_0();
      sub_19364F190();
      sub_1936530CC((uint64_t)v30, &qword_1EB4B2E20);
      sub_193652B74((uint64_t)v29, (uint64_t)v30);
      OUTLINED_FUNCTION_5_0();
      OUTLINED_FUNCTION_11_0();
      sub_19364F190();
      sub_1936530CC((uint64_t)v30, &qword_1EB4B2E20);
      sub_193652B74((uint64_t)v29, (uint64_t)v30);
      OUTLINED_FUNCTION_5_0();
      OUTLINED_FUNCTION_27_0();
      sub_1936530CC((uint64_t)v30, &qword_1EB4B2E20);
      sub_1936524D8((uint64_t)v29, (void (*)(void))type metadata accessor for EventValue);
    }
    else
    {
      uint64_t v31 = *(void *)(v8 + 144);
      uint64_t v32 = *(void *)(v8 + 152);
      uint64_t v33 = *(void *)(v8 + 128);
      uint64_t v34 = *(void *)(v8 + 136);
      uint64_t v35 = *(double **)(v8 + 120);
      uint64_t v36 = *(double **)(v8 + 96);
      sub_193668378();
      sub_193668348();
      v37 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
      v37(v31, v33);
      sub_193668388();
      sub_19364C6B4(v35);
      sub_19364C6B4(v36);
      OUTLINED_FUNCTION_17_0((uint64_t)v36, 0, 1);
      OUTLINED_FUNCTION_22_0();
      sub_19364F190();
      sub_1936530CC((uint64_t)v36, &qword_1EB4B2E20);
      sub_193652B74((uint64_t)v35, (uint64_t)v36);
      OUTLINED_FUNCTION_17_0((uint64_t)v36, 0, 1);
      OUTLINED_FUNCTION_11_0();
      sub_19364F190();
      sub_1936530CC((uint64_t)v36, &qword_1EB4B2E20);
      sub_193652B74((uint64_t)v35, (uint64_t)v36);
      OUTLINED_FUNCTION_17_0((uint64_t)v36, 0, 1);
      OUTLINED_FUNCTION_27_0();
      sub_1936530CC((uint64_t)v36, &qword_1EB4B2E20);
      sub_1936524D8((uint64_t)v35, (void (*)(void))type metadata accessor for EventValue);
      v37(v32, v33);
    }
LABEL_28:
    uint64_t v38 = *(void *)(v8 + 64);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB4B2E38);
    uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2E80);
    uint64_t v40 = *(void *)(*(void *)(v39 - 8) + 72);
    unint64_t v41 = (*(unsigned __int8 *)(*(void *)(v39 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v39 - 8) + 80);
    uint64_t v42 = swift_allocObject();
    *(_OWORD *)(v42 + 16) = xmmword_19366AD20;
    uint64_t v43 = (void *)(v42 + v41);
    v44 = (void *)((char *)v43 + *(int *)(v39 + 48));
    v45 = (uint64_t *)MessageKeys.payload.unsafeMutableAddressor();
    uint64_t v47 = *v45;
    uint64_t v46 = v45[1];
    *uint64_t v43 = v47;
    v43[1] = v46;
    char v87 = *(unsigned char *)(v8 + 24);
    swift_bridgeObjectRetain();
    sub_193651FC8();
    void *v44 = v48;
    type metadata accessor for XPCObject();
    swift_storeEnumTagMultiPayload();
    v49 = (void *)((char *)v43 + v40);
    unint64_t v50 = (unint64_t)MessageKeys.sessionID.unsafeMutableAddressor();
    uint64_t v55 = *(void *)(v50 + 8);
    void *v49 = *(void *)v50;
    v49[1] = v55;
    uint64_t v56 = *(void *)(v38 + 184);
    if (!v56)
    {
      __break(1u);
      return MEMORY[0x1F4187D90](v50, v51, v52, v53, v54);
    }
    uint64_t v57 = *(void *)(v8 + 64);
    v58 = (void *)((char *)v49 + *(int *)(v39 + 48));
    void *v58 = *(void *)(v57 + 176);
    v58[1] = v56;
    swift_storeEnumTagMultiPayload();
    v59 = (void *)((char *)v43 + 2 * v40);
    v60 = (char *)v59 + *(int *)(v39 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v61 = (uint64_t *)MessageKeys.realtime.unsafeMutableAddressor();
    uint64_t v63 = *v61;
    uint64_t v62 = v61[1];
    void *v59 = v63;
    v59[1] = v62;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    unsigned char *v60 = v87;
    swift_storeEnumTagMultiPayload();
    *(void *)(v8 + 168) = RTCXPCDictionary.init(dictionaryLiteral:)(v42);
    uint64_t v64 = *(void *)(v57 + 344);
    BOOL v65 = __OFADD__(v64, 1);
    uint64_t v66 = v64 + 1;
    if (!v65) {
      break;
    }
    __break(1u);
LABEL_38:
    swift_once();
  }
  uint64_t v67 = *(void *)(v8 + 64);
  *(void *)(v57 + 344) = v66;
  uint64_t v68 = *(void *)(v67 + 312);
  if (!v68)
  {
    uint64_t v76 = OUTLINED_FUNCTION_31_0();
    __swift_storeEnumTagSinglePayload(v42, 1, 1, v76);
    sub_193654D9C();
    v77 = (void *)swift_allocObject();
    OUTLINED_FUNCTION_12_0(v77);
    swift_unknownObjectRetain();
    *(void *)(v8 + 192) = sub_193649EC8(v42, (uint64_t)&unk_1E9328208, (uint64_t)v49);
    uint64_t v78 = swift_retain();
    sub_193655024(v78);
    v79 = (void *)swift_task_alloc();
    *(void *)(v8 + 200) = v79;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB4B2E50);
    void *v79 = v8;
    v79[1] = sub_193654EB4;
    OUTLINED_FUNCTION_7_0();
    return MEMORY[0x1F4187D90](v50, v51, v52, v53, v54);
  }
  *(void *)(v8 + 176) = v68;
  swift_retain();
  v69 = (void *)swift_task_alloc();
  *(void *)(v8 + 184) = v69;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB4B2E50);
  void *v69 = v8;
  v69[1] = sub_19365AAD4;
  OUTLINED_FUNCTION_7_0();
  return MEMORY[0x1F4187DA0](v70, v71, v72, v73, v74);
}

uint64_t sub_19364C6B4@<X0>(double *a1@<X8>)
{
  uint64_t v2 = getTimeIntervalSince1970(Date:)();
  double v3 = (double)v2;
  if (!v2) {
    double v3 = -1.0;
  }
  *a1 = v3;
  type metadata accessor for EventValue();
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_19364C710(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2E20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t getTimeIntervalSince1970(Date:)()
{
  uint64_t result = sub_193668368();
  if (v1 < 0.0 || (*(void *)&v1 & 0x7FF0000000000000) == 0x7FF0000000000000) {
    return 0;
  }
  if (v1 <= -9.22337204e18)
  {
    __break(1u);
  }
  else if (v1 < 9.22337204e18)
  {
    return (uint64_t)v1;
  }
  __break(1u);
  return result;
}

uint64_t sub_19364C7E8()
{
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_8_0();
  return v3();
}

uint64_t sub_19364C8A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  char v10 = (void *)v8;
  *(void *)(v9 + 448) = v8;
  sub_19364D1A4(a7, v9 + 224);
  uint64_t v71 = *(void *)(v9 + 248);
  uint64_t v61 = *(void *)(v9 + 288);
  uint64_t v62 = *(void *)(v9 + 296);
  uint64_t v63 = *(void *)(v9 + 304);
  uint64_t v15 = *(void *)(v9 + 312);
  char v64 = *(unsigned char *)(v9 + 320);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB4B2E60);
  OUTLINED_FUNCTION_7(v16);
  *(void *)(v9 + 456) = swift_task_alloc();
  *(void *)(v9 + 464) = swift_task_alloc();
  *(void *)(v9 + 472) = swift_task_alloc();
  *(void *)(v9 + 480) = swift_task_alloc();
  *(void *)(v9 + 488) = swift_task_alloc();
  uint64_t v70 = (void *)swift_task_alloc();
  *(void *)(v9 + 496) = v70;
  uint64_t v17 = sub_193668398();
  *(void *)(v9 + 504) = v17;
  uint64_t v18 = *(void *)(v17 - 8);
  *(void *)(v9 + 512) = v18;
  *(void *)(v9 + 520) = swift_task_alloc();
  swift_defaultActor_initialize();
  *(void *)(v8 + 176) = 0;
  *(void *)(v8 + 184) = 0;
  if (qword_1EB4B2EC8 != -1) {
    swift_once();
  }
  *(void *)(v8 + 192) = sub_193648350();
  *(void *)(v8 + 208) = 0;
  *(void *)(v8 + 216) = 0;
  *(void *)(v8 + 224) = 0;
  *(void *)(v8 + 232) = 1;
  *(void *)(v8 + 312) = 0;
  *(_OWORD *)(v8 + 240) = 0u;
  *(_OWORD *)(v8 + 256) = 0u;
  *(_OWORD *)(v8 + 272) = 0u;
  *(_OWORD *)(v8 + 288) = 0u;
  *(unsigned char *)(v8 + 304) = 0;
  *(void *)(v8 + 336) = 0;
  *(void *)(v8 + 344) = 0;
  *(void *)(v8 + 328) = 0;
  char v19 = sub_193655438();
  *(unsigned char *)(v9 + 113) = v19 & 1;
  if (v19)
  {
    *(void *)(v8 + 112) = a3;
    *(void *)(v8 + 120) = a4;
    *(void *)(v8 + 128) = a5;
    *(void *)(v8 + 136) = a6;
    *(void *)(v8 + 144) = a1;
    *(void *)(v8 + 152) = a2;
    *(unsigned char *)(v8 + 200) = a8 & 1;
    sub_193668378();
    uint64_t v20 = *(void (**)(void))(v18 + 32);
    OUTLINED_FUNCTION_30_0();
    v20();
    getTimeIntervalSince1970(Date:)();
    sub_193668358();
    OUTLINED_FUNCTION_30_0();
    v20();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB4B2E38);
    BOOL v21 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2E80) - 8);
    uint64_t v22 = *(void *)(*(void *)v21 + 72);
    uint64_t v69 = a7;
    unint64_t v23 = (*(unsigned __int8 *)(*(void *)v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v21 + 80);
    uint64_t v67 = swift_allocObject();
    *(_OWORD *)(v67 + 16) = xmmword_19366AD10;
    uint64_t v24 = (void *)(v67 + v23);
    uint64_t v25 = (void *)((char *)v24 + v21[14]);
    uint64_t v26 = MessageKeys.clientName.unsafeMutableAddressor();
    uint64_t v27 = *((void *)v26 + 1);
    void *v24 = *(void *)v26;
    v24[1] = v27;
    *uint64_t v25 = a3;
    v25[1] = a4;
    uint64_t v28 = type metadata accessor for XPCObject();
    *(void *)(v9 + 528) = v28;
    OUTLINED_FUNCTION_18_0();
    int64_t v29 = (void *)((char *)v24 + v22);
    uint64_t v30 = (void *)((char *)v24 + v22 + v21[14]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v31 = MessageKeys.serviceName.unsafeMutableAddressor();
    uint64_t v32 = v31[1];
    *int64_t v29 = *v31;
    v29[1] = v32;
    uint64_t v33 = v10[17];
    *uint64_t v30 = v10[16];
    v30[1] = v33;
    OUTLINED_FUNCTION_18_0();
    uint64_t v34 = (void *)((char *)v24 + 2 * v22);
    uint64_t v35 = (void *)((char *)v34 + v21[14]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v36 = MessageKeys.clientType.unsafeMutableAddressor();
    uint64_t v37 = v36[1];
    void *v34 = *v36;
    v34[1] = v37;
    uint64_t v38 = v10[19];
    *uint64_t v35 = v10[18];
    v35[1] = v38;
    OUTLINED_FUNCTION_18_0();
    uint64_t v39 = (void *)((char *)v24 + 3 * v22);
    uint64_t v40 = (BOOL *)v39 + v21[14];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v41 = MessageKeys.legacyClient.unsafeMutableAddressor();
    uint64_t v42 = v41[1];
    *uint64_t v39 = *v41;
    v39[1] = v42;
    *uint64_t v40 = v71 != 1;
    swift_storeEnumTagMultiPayload();
    uint64_t v43 = (void *)((char *)v24 + 4 * v22);
    uint64_t v44 = v69;
    swift_bridgeObjectRetain();
    v45 = MessageKeys.realtime.unsafeMutableAddressor();
    uint64_t v46 = v45[1];
    *uint64_t v43 = *v45;
    v43[1] = v46;
    sub_19364D1A4(v69, v9 + 16);
    *((unsigned char *)v43 + v21[14]) = (*(void *)(v9 + 40) != 1) & *(unsigned char *)(v9 + 96);
    swift_storeEnumTagMultiPayload();
    swift_bridgeObjectRetain();
    xpc_object_t v47 = RTCXPCDictionary.init(dictionaryLiteral:)(v67);
    *(void *)(v9 + 536) = v47;
    *(void *)(v9 + 424) = v47;
    sub_19364D1A4(v69, v9 + 120);
    uint64_t v48 = *(void *)(v9 + 144);
    if (v48)
    {
      if (v48 == 1)
      {
LABEL_13:
        *(void *)(v9 + 544) = v10[24];
        swift_retain();
        swift_unknownObjectRetain();
        *(void *)(v9 + 552) = XPCMessage.init(ty:payload:)(0, v47);
        unint64_t v50 = (void *)swift_task_alloc();
        *(void *)(v9 + 560) = v50;
        *unint64_t v50 = v9;
        v50[1] = sub_19364D410;
        uint64_t v51 = OUTLINED_FUNCTION_13_0();
        return XPCConnection.sendWithReply(_:)(v51, v52);
      }
      uint64_t v49 = *(void *)(v9 + 136);
      uint64_t v73 = *(void *)(v9 + 128);
      swift_bridgeObjectRetain();
      MessageKeys.hierarchyToken.unsafeMutableAddressor();
      *uint64_t v70 = v49;
      v70[1] = v48;
      uint64_t v44 = v69;
      OUTLINED_FUNCTION_18_0();
      OUTLINED_FUNCTION_2_1();
      swift_bridgeObjectRetain();
      RTCXPCDictionary.subscript.setter((uint64_t)v70);
      MessageKeys.hierarchyLevel.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *uint64_t v70 = v73;
      swift_storeEnumTagMultiPayload();
      __swift_storeEnumTagSinglePayload((uint64_t)v70, 0, 1, v28);
      RTCXPCDictionary.subscript.setter((uint64_t)v70);
    }
    swift_bridgeObjectRetain();
    sub_19364D140(v44, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, char))sub_193647F08);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v62)
    {
      MessageKeys.samplingUUID.unsafeMutableAddressor();
      *uint64_t v70 = v61;
      v70[1] = v62;
      OUTLINED_FUNCTION_18_0();
      OUTLINED_FUNCTION_2_1();
      OUTLINED_FUNCTION_9_0();
    }
    if ((v63 & 0x100) != 0)
    {
      MessageKeys.eager.unsafeMutableAddressor();
      *(unsigned char *)uint64_t v70 = 1;
      swift_storeEnumTagMultiPayload();
      OUTLINED_FUNCTION_2_1();
      OUTLINED_FUNCTION_9_0();
    }
    sub_19364D140(v44, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, char))sub_1936482E8);
    if ((v64 & 1) == 0)
    {
      MessageKeys.overrideSampling.unsafeMutableAddressor();
      *uint64_t v70 = v15;
      swift_storeEnumTagMultiPayload();
      OUTLINED_FUNCTION_2_1();
      OUTLINED_FUNCTION_9_0();
    }
    goto LABEL_13;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_19364D140(a7, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, char))sub_1936482E8);
  sub_19365C4D4();
  swift_allocError();
  *uint64_t v54 = xmmword_19366AD00;
  swift_willThrow();
  int v55 = *(unsigned __int8 *)(v9 + 113);
  uint64_t v56 = *(void *)(v9 + 448);
  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_6_0();
  swift_release();
  sub_19364ACA4(*(void *)(v56 + 328));
  if (v55 == 1)
  {
    uint64_t v57 = *(void *)(v9 + 504);
    uint64_t v58 = *(void *)(v9 + 448);
    v59 = *(void (**)(uint64_t, uint64_t))(*(void *)(v9 + 512) + 8);
    v59(v58 + OBJC_IVAR____TtC12RTCReporting7Session_baseTime, v57);
    v59(v58 + OBJC_IVAR____TtC12RTCReporting7Session_obfuscatedBaseTime, v57);
  }
  type metadata accessor for Session();
  swift_defaultActor_destroy();
  swift_deallocPartialClassInstance();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_8_0();
  return v60();
}

uint64_t sub_19364D140(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 96);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), v4);
  return a1;
}

uint64_t sub_19364D1A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2E48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *XPCMessage.init(ty:payload:)(unsigned __int8 a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB4B2E60);
  uint64_t v5 = MEMORY[0x1F4188790](v4 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v14 - v8;
  swift_unknownObjectRetain();
  xpc_object_t v10 = xpc_int64_create(a1);
  XPCObject.init(_:)(v10, (uint64_t)v9);
  sub_19364D3A8((uint64_t)v9, (uint64_t)v7);
  uint64_t v11 = type metadata accessor for XPCObject();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v11) == 1)
  {
    sub_19364D348((uint64_t)v7);
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = XPCObject.obj.getter();
    sub_19365317C((uint64_t)v7);
  }
  xpc_dictionary_set_value(a2, "type", v12);
  swift_unknownObjectRelease();
  sub_19364D348((uint64_t)v9);
  swift_unknownObjectRelease();
  return a2;
}

uint64_t sub_19364D348(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB4B2E60);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_19364D3A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB4B2E60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_19364D410(void *a1)
{
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_4_0();
  void *v6 = v5;
  uint64_t v7 = *v2;
  OUTLINED_FUNCTION_3_0();
  void *v8 = v7;
  *(void *)(v5 + 568) = a1;
  swift_task_dealloc();
  if (v1)
  {
    swift_release();
    swift_unknownObjectRelease();
    goto LABEL_16;
  }
  uint64_t v9 = *(void *)(v5 + 528);
  uint64_t v10 = *(void *)(v5 + 488);
  swift_unknownObjectRelease();
  swift_release();
  RTCXPCDictionary.subscript.getter(a1, v10);
  if (__swift_getEnumTagSinglePayload(v10, 1, v9) == 1)
  {
    sub_1936530CC(*(void *)(v5 + 488), (uint64_t *)&unk_1EB4B2E60);
  }
  else
  {
    uint64_t v11 = *(uint64_t **)(v5 + 488);
    if (swift_getEnumCaseMultiPayload() == 8)
    {
      uint64_t v12 = *v11;
      uint64_t v13 = v11[1];
      sub_19365C4D4();
      swift_allocError();
      *uint64_t v14 = v12;
      v14[1] = v13;
LABEL_15:
      swift_willThrow();
      swift_unknownObjectRelease();
LABEL_16:
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int v25 = *(unsigned __int8 *)(v5 + 113);
      uint64_t v26 = *(void *)(v5 + 448);
      swift_bridgeObjectRelease();
      swift_release();
      OUTLINED_FUNCTION_6_0();
      swift_release();
      sub_19364ACA4(*(void *)(v26 + 328));
      if (v25 == 1)
      {
        uint64_t v27 = *(void *)(v5 + 504);
        uint64_t v28 = *(void *)(v5 + 448);
        int64_t v29 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 + 512) + 8);
        v29(v28 + OBJC_IVAR____TtC12RTCReporting7Session_baseTime, v27);
        v29(v28 + OBJC_IVAR____TtC12RTCReporting7Session_obfuscatedBaseTime, v27);
      }
      type metadata accessor for Session();
      swift_defaultActor_destroy();
      swift_deallocPartialClassInstance();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      OUTLINED_FUNCTION_8_0();
      OUTLINED_FUNCTION_19_0();
      __asm { BRAA            X1, X16 }
    }
    sub_1936524D8((uint64_t)v11, (void (*)(void))type metadata accessor for XPCObject);
  }
  uint64_t v15 = *(void *)(v5 + 528);
  uint64_t v16 = *(void *)(v5 + 480);
  RTCXPCDictionary.subscript.getter(a1, v16);
  if (__swift_getEnumTagSinglePayload(v16, 1, v15) == 1)
  {
    sub_1936530CC(*(void *)(v5 + 480), (uint64_t *)&unk_1EB4B2E60);
LABEL_14:
    sub_19365C4D4();
    swift_allocError();
    void *v24 = 0;
    v24[1] = 0;
    goto LABEL_15;
  }
  uint64_t v17 = *(void *)(v5 + 528);
  uint64_t v18 = *(void **)(v5 + 480);
  if (swift_getEnumCaseMultiPayload() != 8)
  {
    sub_1936524D8((uint64_t)v18, (void (*)(void))type metadata accessor for XPCObject);
    goto LABEL_14;
  }
  uint64_t v19 = *(void *)(v5 + 472);
  uint64_t v20 = *(void *)(v5 + 448);
  uint64_t v21 = v18[1];
  *(void *)(v20 + 176) = *v18;
  *(void *)(v20 + 184) = v21;
  swift_bridgeObjectRelease();
  MessageKeys.allowed.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  RTCXPCDictionary.subscript.getter(a1, v19);
  swift_bridgeObjectRelease();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v19, 1, v17);
  uint64_t v23 = MEMORY[0x1E4FBC870];
  if (EnumTagSinglePayload == 1)
  {
    sub_1936530CC(*(void *)(v5 + 472), (uint64_t *)&unk_1EB4B2E60);
LABEL_25:
    uint64_t v40 = 0;
    uint64_t v34 = 0;
    *(void *)(*(void *)(v5 + 448) + 160) = v23;
    goto LABEL_26;
  }
  uint64_t v32 = *(xpc_object_t **)(v5 + 472);
  if (swift_getEnumCaseMultiPayload() != 11)
  {
    sub_1936524D8((uint64_t)v32, (void (*)(void))type metadata accessor for XPCObject);
    goto LABEL_25;
  }
  xpc_object_t v33 = *v32;
  xpc_array_get_count(*v32);
  *(void *)(v5 + 432) = sub_193668628();
  uint64_t v34 = swift_allocObject();
  *(void *)(v34 + 16) = v5 + 432;
  uint64_t v35 = swift_allocObject();
  *(void *)(v35 + 16) = sub_19365D214;
  *(void *)(v35 + 24) = v34;
  *(void *)(v5 + 360) = sub_19365D220;
  *(void *)(v5 + 368) = v35;
  *(void *)(v5 + 328) = MEMORY[0x1E4F143A8];
  *(void *)(v5 + 336) = 1107296256;
  *(void *)(v5 + 344) = sub_19365AA3C;
  *(void *)(v5 + 352) = &block_descriptor_50;
  uint64_t v36 = _Block_copy((const void *)(v5 + 328));
  swift_retain();
  swift_release();
  xpc_array_apply(v33, v36);
  swift_unknownObjectRelease();
  _Block_release(v36);
  LOBYTE(v33) = swift_isEscapingClosureAtFileLocation();
  uint64_t v37 = swift_release();
  if (v33)
  {
    __break(1u);
    goto LABEL_40;
  }
  *(void *)(*(void *)(v5 + 448) + 160) = *(void *)(v5 + 432);
  uint64_t v40 = sub_19365D214;
LABEL_26:
  *(void *)(v5 + 584) = v34;
  *(void *)(v5 + 576) = v40;
  uint64_t v41 = *(void *)(v5 + 528);
  uint64_t v42 = *(void *)(v5 + 464);
  MessageKeys.denied.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  RTCXPCDictionary.subscript.getter(a1, v42);
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload(v42, 1, v41) != 1)
  {
    uint64_t v43 = *(xpc_object_t **)(v5 + 464);
    if (swift_getEnumCaseMultiPayload() != 11)
    {
      sub_1936524D8((uint64_t)v43, (void (*)(void))type metadata accessor for XPCObject);
      goto LABEL_32;
    }
    xpc_object_t v44 = *v43;
    xpc_array_get_count(*v43);
    *(void *)(v5 + 440) = sub_193668628();
    uint64_t v45 = swift_allocObject();
    *(void *)(v45 + 16) = v5 + 440;
    uint64_t v46 = swift_allocObject();
    *(void *)(v46 + 16) = sub_19365C52C;
    *(void *)(v46 + 24) = v45;
    *(void *)(v5 + 408) = sub_19365C558;
    *(void *)(v5 + 416) = v46;
    *(void *)(v5 + 376) = MEMORY[0x1E4F143A8];
    *(void *)(v5 + 384) = 1107296256;
    *(void *)(v5 + 392) = sub_19365AA3C;
    *(void *)(v5 + 400) = &block_descriptor;
    xpc_object_t v47 = _Block_copy((const void *)(v5 + 376));
    swift_retain();
    swift_release();
    xpc_array_apply(v44, v47);
    swift_unknownObjectRelease();
    _Block_release(v47);
    LOBYTE(v44) = swift_isEscapingClosureAtFileLocation();
    uint64_t v37 = swift_release();
    if ((v44 & 1) == 0)
    {
      *(void *)(*(void *)(v5 + 448) + 168) = *(void *)(v5 + 440);
      uint64_t v48 = sub_19365C52C;
      goto LABEL_33;
    }
LABEL_40:
    __break(1u);
    return MEMORY[0x1F4188298](v37, v38, v39);
  }
  sub_1936530CC(*(void *)(v5 + 464), (uint64_t *)&unk_1EB4B2E60);
LABEL_32:
  uint64_t v48 = 0;
  uint64_t v45 = 0;
  *(void *)(*(void *)(v5 + 448) + 168) = v23;
LABEL_33:
  *(void *)(v5 + 600) = v45;
  *(void *)(v5 + 592) = v48;
  uint64_t v49 = *(void *)(v5 + 528);
  uint64_t v50 = *(void *)(v5 + 448);
  uint64_t v51 = *(void *)(v5 + 456);
  RTCXPCDictionary.subscript.getter(a1, v51);
  int v52 = __swift_getEnumTagSinglePayload(v51, 1, v49);
  sub_1936530CC(v51, (uint64_t *)&unk_1EB4B2E60);
  *(unsigned char *)(v50 + 320) = v52 == 1;
  OUTLINED_FUNCTION_19_0();
  return MEMORY[0x1F4188298](v37, v38, v39);
}

void *XPCObject.init(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for XPCObject();
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_6();
  uint64_t v8 = (uint64_t *)(v6 - v7);
  uint64_t v10 = MEMORY[0x1F4188790](v9);
  uint64_t v12 = (uint64_t *)((char *)&v34 - v11);
  MEMORY[0x1F4188790](v10);
  uint64_t v14 = (uint64_t *)((char *)&v34 - v13);
  if (a1)
  {
    uint64_t v15 = swift_unknownObjectRetain();
    uint64_t v16 = MEMORY[0x1997005E0](v15);
    if (v16 == MEMORY[0x1E4F145D8])
    {
      OUTLINED_FUNCTION_2_3();
      OUTLINED_FUNCTION_35();
    }
    else
    {
      uint64_t v17 = v16;
      if (v16 == MEMORY[0x1E4F14578] || v16 == MEMORY[0x1E4F145A0])
      {
LABEL_37:
        swift_unknownObjectRelease();
        *uint64_t v14 = a1;
        OUTLINED_FUNCTION_35();
        goto LABEL_28;
      }
      if (v16 == MEMORY[0x1E4F14570])
      {
        BOOL value = xpc_BOOL_get_value(a1);
        OUTLINED_FUNCTION_2_3();
        *(unsigned char *)uint64_t v14 = value;
        OUTLINED_FUNCTION_35();
      }
      else if (v16 == MEMORY[0x1E4F145C0])
      {
        int64_t v21 = xpc_int64_get_value(a1);
        OUTLINED_FUNCTION_2_3();
        *uint64_t v14 = v21;
        OUTLINED_FUNCTION_35();
      }
      else if (v16 == MEMORY[0x1E4F145F8])
      {
        uint64_t v22 = xpc_uint64_get_value(a1);
        OUTLINED_FUNCTION_2_3();
        *uint64_t v14 = v22;
        OUTLINED_FUNCTION_35();
      }
      else if (v16 == MEMORY[0x1E4F14598])
      {
        double v23 = xpc_double_get_value(a1);
        OUTLINED_FUNCTION_2_3();
        *(double *)uint64_t v14 = v23;
        OUTLINED_FUNCTION_35();
      }
      else
      {
        if (v16 != MEMORY[0x1E4F14588])
        {
          if (v16 == MEMORY[0x1E4F14580])
          {
            uint64_t result = (void *)xpc_data_get_bytes_ptr(a1);
            if (result)
            {
              int v25 = result;
              size_t length = xpc_data_get_length(a1);
              uint64_t v27 = MEMORY[0x1996FF3B0](v25, length);
              uint64_t v29 = v28;
              OUTLINED_FUNCTION_2_3();
              *uint64_t v12 = v27;
              v12[1] = v29;
              swift_storeEnumTagMultiPayload();
              uint64_t v30 = (uint64_t)v12;
LABEL_34:
              sub_1936532D8(v30, (uint64_t)v14);
              goto LABEL_29;
            }
            __break(1u);
          }
          else
          {
            if (v16 != MEMORY[0x1E4F145F0])
            {
              if (v16 != MEMORY[0x1E4F14600])
              {
                if (v16 != MEMORY[0x1E4F145E8])
                {
                  uint64_t v18 = MEMORY[0x1E4F14568];
                  swift_unknownObjectRelease();
                  if (v17 != v18 && v17 != MEMORY[0x1E4F14590])
                  {
                    swift_unknownObjectRelease();
                    goto LABEL_17;
                  }
                  *uint64_t v14 = a1;
                  OUTLINED_FUNCTION_35();
                  goto LABEL_28;
                }
                goto LABEL_37;
              }
              uint64_t result = (void *)xpc_uuid_get_bytes(a1);
              if (result)
              {
                sub_1936683B8();
                OUTLINED_FUNCTION_2_3();
                OUTLINED_FUNCTION_35();
                goto LABEL_28;
              }
LABEL_42:
              __break(1u);
              return result;
            }
            uint64_t result = (void *)xpc_string_get_string_ptr(a1);
            if (result)
            {
              uint64_t v31 = sub_193668568();
              uint64_t v33 = v32;
              OUTLINED_FUNCTION_2_3();
              uint64_t *v8 = v31;
              v8[1] = v33;
              swift_storeEnumTagMultiPayload();
              uint64_t v30 = (uint64_t)v8;
              goto LABEL_34;
            }
          }
          __break(1u);
          goto LABEL_42;
        }
        int64_t v24 = xpc_date_get_value(a1);
        OUTLINED_FUNCTION_2_3();
        *uint64_t v14 = v24;
        OUTLINED_FUNCTION_35();
      }
    }
LABEL_28:
    swift_storeEnumTagMultiPayload();
LABEL_29:
    sub_1936532D8((uint64_t)v14, a2);
    return (void *)OUTLINED_FUNCTION_7_2();
  }
LABEL_17:
  return (void *)__swift_storeEnumTagSinglePayload(a2, 1, 1, v4);
}

void *RTCXPCDictionary.subscript.getter@<X0>(void *a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_193668538();
  xpc_object_t v5 = xpc_dictionary_get_value(a1, (const char *)(v4 + 32));
  swift_release();
  return XPCObject.init(_:)(v5, a2);
}

uint64_t sub_19364E118(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v123 = a3;
  uint64_t v128 = sub_193668418();
  uint64_t v127 = *(void *)(v128 - 8);
  MEMORY[0x1F4188790](v128);
  uint64_t v126 = (uint64_t)&v123 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2EB8);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v123 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2E20);
  uint64_t v12 = MEMORY[0x1F4188790](v11 - 8);
  uint64_t v14 = (char *)&v123 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v16 = (uint64_t *)((char *)&v123 - v15);
  sub_193650ED4(a1, v140);
  sub_193653120((uint64_t)v140, (uint64_t)&v138, &qword_1EB4B2E90);
  uint64_t v125 = a4;
  v124 = v10;
  if (v139)
  {
    sub_193650D74(&v138, v135);
    sub_193650D18((uint64_t)v135, (uint64_t)&v132);
    char v17 = swift_dynamicCast();
    if ((v17 & 1) == 0) {
      LOWORD(v136) = 0;
    }
    BYTE2(v136) = v17 ^ 1;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
    LODWORD(v130) = (unsigned __int16)v136;
    int v18 = BYTE2(v136);
  }
  else
  {
    LODWORD(v130) = 0;
    int v18 = 1;
  }
  sub_1936530CC((uint64_t)v140, &qword_1EB4B2E90);
  sub_193650ED4(a1, v140);
  sub_193653120((uint64_t)v140, (uint64_t)&v138, &qword_1EB4B2E90);
  v131 = (unsigned char *)a2;
  if (v139)
  {
    sub_193650D74(&v138, v135);
    sub_193650D18((uint64_t)v135, (uint64_t)&v132);
    char v19 = swift_dynamicCast();
    if ((v19 & 1) == 0) {
      LOWORD(v136) = 0;
    }
    BYTE2(v136) = v19 ^ 1;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
    LODWORD(v129) = (unsigned __int16)v136;
    int v20 = BYTE2(v136);
  }
  else
  {
    LODWORD(v129) = 0;
    int v20 = 1;
  }
  sub_1936530CC((uint64_t)v140, &qword_1EB4B2E90);
  sub_193650ED4(a1, v140);
  sub_193653120((uint64_t)v140, (uint64_t)&v138, &qword_1EB4B2E90);
  if (v139)
  {
    sub_193650D74(&v138, v135);
    sub_193650D18((uint64_t)v135, (uint64_t)&v132);
    char v21 = swift_dynamicCast();
    if ((v21 & 1) == 0) {
      uint64_t v136 = 0;
    }
    char v137 = v21 ^ 1;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
    uint64_t v22 = v136;
    char v23 = v137;
  }
  else
  {
    uint64_t v22 = 0;
    char v23 = 1;
  }
  sub_1936530CC((uint64_t)v140, &qword_1EB4B2E90);
  sub_193650ED4(a1, v140);
  sub_193653120((uint64_t)v140, (uint64_t)&v138, &qword_1EB4B2E90);
  if (v139)
  {
    sub_193650D74(&v138, v135);
    sub_193650D18((uint64_t)v135, (uint64_t)&v132);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2E18);
    if ((swift_dynamicCast() & 1) == 0) {
      uint64_t v136 = 0;
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
    uint64_t v24 = v136;
  }
  else
  {
    uint64_t v24 = 0;
  }
  sub_1936530CC((uint64_t)v140, &qword_1EB4B2E90);
  if (!v24) {
    uint64_t v24 = sub_1936684C8();
  }
  if ((v18 | v20))
  {
    swift_bridgeObjectRelease();
    sub_193662EE8();
    swift_allocError();
    *int v25 = 1;
    return swift_willThrow();
  }
  uint64_t v27 = v141;
  uint64_t v28 = sub_193651128(v24);
  if (v27) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v29 = v28;
  uint64_t v30 = *(void *)&v131[OBJC_IVAR____RTCReportingS_extraFields];
  if (v30)
  {
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)&v140[0] = v29;
    sub_193663F64(v30, (uint64_t)sub_193664900, 0, isUniquelyReferenced_nonNull_native, (uint64_t)v140);
    uint64_t v29 = *(void *)&v140[0];
    swift_bridgeObjectRelease();
  }
  unsigned int v32 = v130;
  uint64_t v141 = 0;
  *(void *)&v135[0] = v29;
  BYTE8(v135[0]) = (v22 == 1) & ~v23;
  uint64_t v33 = qword_1EB4B2DB8;
  swift_bridgeObjectRetain();
  if (v33 != -1) {
    swift_once();
  }
  void *v16 = v32;
  uint64_t v34 = type metadata accessor for EventValue();
  swift_storeEnumTagMultiPayload();
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v34);
  sub_193653120((uint64_t)v16, (uint64_t)v14, &qword_1EB4B2E20);
  swift_bridgeObjectRetain();
  sub_19364F190();
  sub_1936530CC((uint64_t)v16, &qword_1EB4B2E20);
  if (qword_1EB4B2DC0 != -1) {
    swift_once();
  }
  void *v16 = v129;
  swift_storeEnumTagMultiPayload();
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v34);
  sub_193653120((uint64_t)v16, (uint64_t)v14, &qword_1EB4B2E20);
  swift_bridgeObjectRetain();
  sub_19364F190();
  sub_1936530CC((uint64_t)v16, &qword_1EB4B2E20);
  unint64_t v35 = (unint64_t)v131;
  if (v131[OBJC_IVAR____RTCReportingS_completelyDisabled])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_1EB4B2F10 != -1) {
      swift_once();
    }
    uint64_t v36 = v128;
    uint64_t v37 = __swift_project_value_buffer(v128, (uint64_t)qword_1EB4B2ED8);
    uint64_t v38 = v127;
    uint64_t v39 = v126;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v127 + 16))(v126, v37, v36);
    uint64_t v40 = (char *)(id)v35;
    uint64_t v41 = sub_1936683F8();
    os_log_type_t v42 = sub_193668648();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = (uint8_t *)swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      *(void *)&v140[0] = v44;
      *(_DWORD *)uint64_t v43 = 136315138;
      if (*(void *)&v40[OBJC_IVAR____RTCReportingS_generatedSessionID + 8])
      {
        uint64_t v45 = *(void *)&v40[OBJC_IVAR____RTCReportingS_generatedSessionID];
        unint64_t v46 = *(void *)&v40[OBJC_IVAR____RTCReportingS_generatedSessionID + 8];
      }
      else
      {
        unint64_t v46 = 0xE100000000000000;
        uint64_t v45 = 63;
      }
      swift_bridgeObjectRetain();
      *(void *)&long long v138 = sub_19365B4D8(v45, v46, (uint64_t *)v140);
      sub_1936686E8();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_193646000, v41, v42, "dropping message to inactive session(%s)", v43, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1997002F0](v44, -1, -1);
      MEMORY[0x1997002F0](v43, -1, -1);

      return (*(uint64_t (**)(uint64_t, uint64_t))(v127 + 8))(v126, v36);
    }
    else
    {

      return (*(uint64_t (**)(uint64_t, uint64_t))(v38 + 8))(v39, v36);
    }
  }
  xpc_object_t v47 = (uint64_t (**)())OBJC_IVAR____RTCReportingS_sentEventCount;
  void *v16 = *(void *)&v131[OBJC_IVAR____RTCReportingS_sentEventCount];
  swift_storeEnumTagMultiPayload();
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v34);
  sub_193653120((uint64_t)v16, (uint64_t)v14, &qword_1EB4B2E20);
  sub_19364F190();
  sub_1936530CC((uint64_t)v16, &qword_1EB4B2E20);
  uint64_t v48 = *(uint64_t *)((char *)v47 + v35);
  BOOL v49 = __CFADD__(v48, 1);
  uint64_t v50 = (uint64_t (*)())(v48 + 1);
  if (v49)
  {
    __break(1u);
    goto LABEL_95;
  }
  *(uint64_t (**)())((char *)v47 + v35) = v50;
  uint64_t v16 = *(void **)(v35 + OBJC_IVAR____RTCReportingS_session);
  if (v16)
  {
    swift_retain();
    swift_bridgeObjectRelease();
    uint64_t v51 = *(void **)(v35 + OBJC_IVAR____RTCReportingS_legacyAVCSupport);
    if (!v51)
    {
      swift_bridgeObjectRelease();
      uint64_t v29 = *(void *)&v135[0];
      LOBYTE(v35) = BYTE8(v135[0]);
      goto LABEL_92;
    }
    uint64_t v14 = v51;
    sub_193660220(v24);
    int v52 = (void *)sub_193668468();
    uint64_t v53 = swift_bridgeObjectRelease();
    uint64_t v29 = *(void *)&v135[0];
    unint64_t v35 = BYTE8(v135[0]);
    *(void *)&v140[0] = *(void *)&v135[0];
    BYTE8(v140[0]) = BYTE8(v135[0]);
    Event.category.getter(v53, v54, v55, v56, v57, v58, v59, v60, v123, (uint64_t)v124, v125, v126, v127, v128, (uint64_t)v129, (uint64_t)v130, (uint64_t)v131, v132, v133,
      v134);
    if (v62) {
      unint64_t v69 = 0;
    }
    else {
      unint64_t v69 = v61;
    }
    if ((v69 & 0x8000000000000000) != 0 || v69 >= 0x10000) {
      goto LABEL_100;
    }
    *(void *)&v140[0] = v29;
    BYTE8(v140[0]) = v35;
    Event.type.getter(v61, v62, v63, v64, v65, v66, v67, v68, v123, (uint64_t)v124, v125, v126, v127, v128, (uint64_t)v129, (uint64_t)v130, (uint64_t)v131, v132, v133,
      v134);
    if (v71)
    {
      LOWORD(v70) = 0;
    }
    else if ((v70 & 0x8000000000000000) != 0 || v70 >= 0x10000)
    {
      goto LABEL_100;
    }
    objc_msgSend(v14, sel_invokeAWDAdaptorForPayload_category_type_, v52, (unsigned __int16)v69, (unsigned __int16)v70);

    if (qword_1EB4B2DF8 == -1)
    {
LABEL_76:
      if (byte_1EB4B30C8 == 1)
      {
        id v130 = v14;
        swift_bridgeObjectRetain();
        v129 = (void *)sub_193668508();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        v93 = (void *)sub_193668508();
        swift_bridgeObjectRelease();
        uint64_t v72 = sub_193660220(v24);
        swift_bridgeObjectRelease();
        v94 = (void *)sub_193668468();
        uint64_t v95 = swift_bridgeObjectRelease();
        *(void *)&v140[0] = v29;
        BYTE8(v140[0]) = v35;
        Event.category.getter(v95, v96, v97, v98, v99, v100, v101, v102, v123, (uint64_t)v124, v125, v126, v127, v128, (uint64_t)v129, (uint64_t)v130, (uint64_t)v131, v132, v133,
          v134);
        if (v104)
        {
          unsigned __int16 v111 = 0;
        }
        else
        {
          unsigned __int16 v111 = v103;
          if ((v103 & 0x8000000000000000) != 0 || v103 >= 0x10000) {
            goto LABEL_100;
          }
        }
        *(void *)&v140[0] = v29;
        BYTE8(v140[0]) = v35;
        Event.type.getter(v103, v104, v105, v106, v107, v108, v109, v110, v123, (uint64_t)v124, v125, v126, v127, v128, (uint64_t)v129, (uint64_t)v130, (uint64_t)v131, v132, v133,
          v134);
        if (v113)
        {
          LOWORD(v112) = 0;
        }
        else if ((v112 & 0x8000000000000000) != 0 || v112 >= 0x10000)
        {
          goto LABEL_100;
        }
        uint64_t v114 = *(uint64_t *)((char *)v47 + (void)v131);
        if (v114)
        {
          v116 = v129;
          id v115 = v130;
          objc_msgSend(v130, sel_sendPowerLogEventForClient_serviceName_payload_category_type_eventNumber_, v129, v93, v94, v111, (unsigned __int16)v112, v114 - 1);

          goto LABEL_92;
        }
        __break(1u);
        goto LABEL_97;
      }

      swift_bridgeObjectRelease();
LABEL_92:
      uint64_t v117 = v125;
      uint64_t v118 = (uint64_t)v124;
      sub_1936685D8();
      uint64_t v119 = sub_1936685F8();
      __swift_storeEnumTagSinglePayload(v118, 0, 1, v119);
      uint64_t v120 = swift_allocObject();
      *(void *)(v120 + 16) = 0;
      *(void *)(v120 + 24) = 0;
      *(void *)(v120 + 32) = v16;
      *(void *)(v120 + 40) = v29;
      *(unsigned char *)(v120 + 48) = v35;
      v121 = v131;
      *(void *)(v120 + 56) = v131;
      *(void *)(v120 + 64) = v117;
      swift_retain();
      id v122 = v121;
      sub_19364B374(v118, (uint64_t)&unk_1E93283E0, v120);
      swift_release();
      swift_release();
      return sub_1936530CC(v118, &qword_1EB4B2EB8);
    }
LABEL_95:
    swift_once();
    goto LABEL_76;
  }
  swift_bridgeObjectRelease();
  if (qword_1EB4B2DF8 != -1) {
    swift_once();
  }
  xpc_object_t v47 = &off_1EB4B3000;
  unint64_t v35 = 0x1EB4B2000uLL;
  uint64_t v72 = v128;
  if (byte_1EB4B30C8)
  {
    if (qword_1EB4B2F10 == -1)
    {
LABEL_56:
      __swift_project_value_buffer(v72, (uint64_t)qword_1EB4B2ED8);
      uint64_t v73 = sub_1936683F8();
      os_log_type_t v74 = sub_193668668();
      if (os_log_type_enabled(v73, v74))
      {
        uint64_t v75 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v75 = 0;
        _os_log_impl(&dword_193646000, v73, v74, "event sent to session with incomplete configuration - caching as a workaround", v75, 2u);
        MEMORY[0x1997002F0](v75, -1, -1);
      }

      goto LABEL_59;
    }
LABEL_97:
    swift_once();
    goto LABEL_56;
  }
LABEL_59:
  uint64_t v76 = &v131[OBJC_IVAR____RTCReportingS_earlyCachedEvents];
  swift_beginAccess();
  uint64_t v77 = MEMORY[0x1E4FBC860];
  if (!*(void *)v76)
  {
    *(void *)uint64_t v76 = MEMORY[0x1E4FBC860];
    swift_bridgeObjectRelease();
  }
  uint64_t v78 = *(void *)&v135[0];
  char v79 = BYTE8(v135[0]);
  swift_beginAccess();
  if (!*(void *)v76)
  {
    __break(1u);
    goto LABEL_99;
  }
  swift_bridgeObjectRetain();
  sub_193663424();
  v80 = *(char **)(*(void *)v76 + 16);
  sub_193663470(v80);
  uint64_t v81 = *(void *)v76;
  *(void *)(v81 + 16) = v80 + 1;
  uint64_t v82 = v81 + 16 * (void)v80;
  *(void *)(v82 + 32) = v78;
  *(unsigned char *)(v82 + 40) = v79;
  swift_endAccess();
  uint64_t v83 = *(void *)v76;
  if (!*(void *)v76)
  {
LABEL_99:
    __break(1u);
    swift_bridgeObjectRelease();
    __break(1u);
LABEL_100:
    uint64_t result = sub_193668808();
    __break(1u);
    return result;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v84 = *(void *)(v83 + 16);
  uint64_t result = swift_bridgeObjectRelease();
  BOOL v85 = v84 <= v123;
  uint64_t v86 = v128;
  if (!v85)
  {
    if (*(void *)(v35 + 3856) != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v86, (uint64_t)qword_1EB4B2ED8);
    char v87 = sub_1936683F8();
    os_log_type_t v88 = sub_193668678();
    if (os_log_type_enabled(v87, v88))
    {
      uint64_t v89 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v89 = 0;
      _os_log_impl(&dword_193646000, v87, v88, "too many events sent to unconfigured session", v89, 2u);
      MEMORY[0x1997002F0](v89, -1, -1);
    }

    if (*((unsigned char *)v47 + 200) == 1)
    {
      uint64_t v90 = sub_1936683F8();
      os_log_type_t v91 = sub_193668668();
      if (os_log_type_enabled(v90, v91))
      {
        uint64_t v92 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v92 = 0;
        _os_log_impl(&dword_193646000, v90, v91, "dumping early event cache buffer - too large", v92, 2u);
        MEMORY[0x1997002F0](v92, -1, -1);
      }
    }
    *(void *)uint64_t v76 = v77;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_19364F190()
{
  OUTLINED_FUNCTION_22();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2E20);
  uint64_t v3 = OUTLINED_FUNCTION_7(v2);
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_23();
  uint64_t v6 = v5 - v4;
  type metadata accessor for EventValue();
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v7);
  uint64_t v8 = OUTLINED_FUNCTION_15();
  if (__swift_getEnumTagSinglePayload(v8, 1, v9) == 1)
  {
    sub_1936530CC(v0, &qword_1EB4B2E20);
    OUTLINED_FUNCTION_35();
    sub_19365A314(v10);
    swift_bridgeObjectRelease();
    return sub_1936530CC(v6, &qword_1EB4B2E20);
  }
  else
  {
    sub_193652D08(v0, v1);
    sub_19364F2A0();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_19364F2A0()
{
  OUTLINED_FUNCTION_32_0();
  uint64_t v1 = OUTLINED_FUNCTION_13_1();
  sub_193650D84(v1, v2, v3);
  *uint64_t v0 = v5;
  return swift_bridgeObjectRelease();
}

void sub_19364F2FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v134 = a4;
  uint64_t v135 = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2EB8);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v118 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_193668418();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v118 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v138 = (unsigned char *)a1;
  uint64_t v14 = (uint64_t *)(a1 + OBJC_IVAR____RTCReportingS_userInfo);
  swift_beginAccess();
  sub_193650ED4(*v14, &v147);
  swift_endAccess();
  sub_193653120((uint64_t)&v147, (uint64_t)&v143, &qword_1EB4B2E90);
  if (v144)
  {
    sub_193650D74(&v143, v141);
    sub_193650D18((uint64_t)v141, (uint64_t)v140);
    if ((swift_dynamicCast() & 1) == 0)
    {
      uint64_t v145 = 0;
      v146 = 0;
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v141);
    uint64_t v133 = v145;
    uint64_t v139 = v146;
  }
  else
  {
    uint64_t v139 = 0;
    uint64_t v133 = 0;
  }
  sub_1936530CC((uint64_t)&v147, &qword_1EB4B2E90);
  swift_beginAccess();
  sub_193650ED4(*v14, &v147);
  swift_endAccess();
  sub_193653120((uint64_t)&v147, (uint64_t)&v143, &qword_1EB4B2E90);
  uint64_t v136 = a2;
  uint64_t v137 = v10;
  if (v144)
  {
    sub_193650D74(&v143, v141);
    sub_193650D18((uint64_t)v141, (uint64_t)v140);
    if ((swift_dynamicCast() & 1) == 0)
    {
      uint64_t v145 = 0;
      v146 = 0;
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v141);
    unint64_t v16 = v145;
    unint64_t v15 = (unint64_t)v146;
  }
  else
  {
    unint64_t v15 = 0;
    unint64_t v16 = 0;
  }
  sub_1936530CC((uint64_t)&v147, &qword_1EB4B2E90);
  if (!v15)
  {
    unint64_t v16 = 0;
    unint64_t v15 = 0xE000000000000000;
  }
  uint64_t v17 = *(void *)&v138[OBJC_IVAR____RTCReportingS_sessionInfo];
  sub_193650ED4(v17, &v147);
  sub_193653120((uint64_t)&v147, (uint64_t)&v143, &qword_1EB4B2E90);
  if (v144)
  {
    sub_193650D74(&v143, v141);
    sub_193650D18((uint64_t)v141, (uint64_t)v140);
    char v18 = swift_dynamicCast();
    if ((v18 & 1) == 0) {
      uint64_t v145 = 0;
    }
    LOBYTE(v146) = v18 ^ 1;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v141);
    uint64_t v132 = (char *)v145;
    char v19 = (char)v146;
  }
  else
  {
    uint64_t v132 = 0;
    char v19 = 1;
  }
  sub_1936530CC((uint64_t)&v147, &qword_1EB4B2E90);
  if (v139)
  {
    if (v19)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_1EB4B2F10 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v137, (uint64_t)qword_1EB4B2ED8);
      int v20 = sub_1936683F8();
      os_log_type_t v21 = sub_193668678();
      if (os_log_type_enabled(v20, v21))
      {
        uint64_t v22 = (uint8_t *)sub_19365B420();
        *(_WORD *)uint64_t v22 = 0;
        _os_log_impl(&dword_193646000, v20, v21, "invalid or missing clientType", v22, 2u);
        MEMORY[0x1997002F0](v22, -1, -1);
      }

      uint64_t v23 = v136;
      if (v136)
      {
        uint64_t v24 = sub_1936685F8();
        __swift_storeEnumTagSinglePayload((uint64_t)v9, 1, 1, v24);
        int v25 = (void *)swift_allocObject();
        v25[2] = 0;
        v25[3] = 0;
        v25[4] = v23;
        v25[5] = v135;
        swift_retain();
        uint64_t v26 = &unk_1E9328400;
LABEL_32:
        unsigned int v32 = v26;
        uint64_t v33 = (uint64_t)v9;
LABEL_33:
        sub_19365EB58(v33, (uint64_t)v32, (uint64_t)v25);
        swift_release();
        return;
      }
      return;
    }
    BOOL v91 = v138[OBJC_IVAR____RTCReportingS_configured] == 1;
    uint64_t v131 = v4;
    id v130 = v9;
    if (v91)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_beginAccess();
      sub_193650ED4(*v14, &v147);
      swift_endAccess();
      sub_193653120((uint64_t)&v147, (uint64_t)&v143, &qword_1EB4B2E90);
      if (v144)
      {
        sub_193650D74(&v143, v141);
        sub_193650D18((uint64_t)v141, (uint64_t)v140);
        char v34 = swift_dynamicCast();
        uint64_t v35 = v137;
        if ((v34 & 1) == 0)
        {
          uint64_t v145 = 0;
          v146 = 0;
        }
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v141);
        uint64_t v36 = v145;
        unint64_t v37 = (unint64_t)v146;
      }
      else
      {
        unint64_t v37 = 0;
        uint64_t v36 = 0;
        uint64_t v35 = v137;
      }
      sub_1936530CC((uint64_t)&v147, &qword_1EB4B2E90);
      uint64_t v41 = 63;
      if (v37) {
        uint64_t v41 = v36;
      }
      long long v138 = (unsigned char *)v41;
      if (!v37) {
        unint64_t v37 = 0xE100000000000000;
      }
      swift_beginAccess();
      sub_193650ED4(*v14, &v147);
      swift_endAccess();
      sub_193653120((uint64_t)&v147, (uint64_t)&v143, &qword_1EB4B2E90);
      if (v144)
      {
        unint64_t v42 = v37;
        sub_193650D74(&v143, v141);
        sub_193650D18((uint64_t)v141, (uint64_t)v140);
        if ((swift_dynamicCast() & 1) == 0)
        {
          uint64_t v145 = 0;
          v146 = 0;
        }
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v141);
        uint64_t v44 = v145;
        unint64_t v43 = (unint64_t)v146;
      }
      else
      {
        unint64_t v42 = v37;
        unint64_t v43 = 0;
        uint64_t v44 = 0;
      }
      sub_1936530CC((uint64_t)&v147, &qword_1EB4B2E90);
      if (!v43)
      {
        uint64_t v44 = 63;
        unint64_t v43 = 0xE100000000000000;
      }
      if (qword_1EB4B2F10 != -1) {
        swift_once();
      }
      uint64_t v48 = __swift_project_value_buffer(v35, (uint64_t)qword_1EB4B2ED8);
      uint64_t v128 = v11;
      (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v48, v35);
      uint64_t v49 = swift_allocObject();
      *(void *)(v49 + 16) = v138;
      *(void *)(v49 + 24) = v42;
      uint64_t v50 = swift_allocObject();
      *(void *)(v50 + 16) = v44;
      *(void *)(v50 + 24) = v43;
      unint64_t v126 = v42;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v139 = sub_1936683F8();
      LODWORD(v134) = sub_193668668();
      uint64_t v51 = swift_allocObject();
      uint64_t v132 = v13;
      uint64_t v133 = v51;
      *(unsigned char *)(v51 + 16) = 34;
      uint64_t v52 = swift_allocObject();
      *(unsigned char *)(v52 + 16) = 8;
      uint64_t v53 = swift_allocObject();
      uint64_t v121 = v44;
      uint64_t v54 = v53;
      *(void *)(v53 + 16) = sub_193664FA8;
      *(void *)(v53 + 24) = v49;
      uint64_t v55 = swift_allocObject();
      *(void *)(v55 + 16) = sub_193664FF8;
      *(void *)(v55 + 24) = v54;
      uint64_t v56 = swift_allocObject();
      *(unsigned char *)(v56 + 16) = 34;
      uint64_t v57 = swift_allocObject();
      unint64_t v125 = v43;
      uint64_t v58 = v57;
      *(unsigned char *)(v57 + 16) = 8;
      uint64_t v59 = swift_allocObject();
      *(void *)(v59 + 16) = sub_193665438;
      *(void *)(v59 + 24) = v50;
      uint64_t v60 = swift_allocObject();
      *(void *)(v60 + 16) = sub_1936653BC;
      *(void *)(v60 + 24) = v59;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2D98);
      uint64_t v61 = swift_allocObject();
      *(_OWORD *)(v61 + 16) = xmmword_19366B050;
      uint64_t v62 = v133;
      *(void *)(v61 + 32) = sub_193664FB4;
      *(void *)(v61 + 40) = v62;
      *(void *)(v61 + 48) = sub_1936653E0;
      *(void *)(v61 + 56) = v52;
      *(void *)(v61 + 64) = sub_193665000;
      *(void *)(v61 + 72) = v55;
      *(void *)(v61 + 80) = sub_1936653E0;
      *(void *)(v61 + 88) = v56;
      *(void *)(v61 + 96) = sub_1936653E0;
      *(void *)(v61 + 104) = v58;
      *(void *)(v61 + 112) = sub_1936653C0;
      *(void *)(v61 + 120) = v60;
      uint64_t v127 = v49;
      swift_retain();
      uint64_t v122 = v54;
      swift_retain();
      uint64_t v129 = v50;
      swift_retain();
      uint64_t v123 = v59;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      uint64_t v124 = v56;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRelease();
      os_log_type_t v63 = v134;
      if (os_log_type_enabled(v139, (os_log_type_t)v134))
      {
        uint64_t v64 = (uint8_t *)sub_19365B420();
        uint64_t v65 = swift_slowAlloc();
        *(void *)&long long v147 = v65;
        *(_WORD *)uint64_t v64 = 514;
        v64[2] = 34;
        swift_release();
        v64[3] = 8;
        swift_release();
        unint64_t v66 = v126;
        swift_bridgeObjectRetain();
        *(void *)&long long v143 = sub_19365B4D8((uint64_t)v138, v66, (uint64_t *)&v147);
        sub_1936686E8();
        swift_bridgeObjectRelease_n();
        swift_release();
        swift_release();
        swift_release();
        v64[12] = 34;
        swift_release();
        v64[13] = 8;
        swift_release();
        unint64_t v67 = v125;
        swift_bridgeObjectRetain();
        *(void *)&long long v143 = sub_19365B4D8(v121, v67, (uint64_t *)&v147);
        sub_1936686E8();
        swift_bridgeObjectRelease_n();
        swift_release();
        swift_release();
        swift_release();
        uint64_t v68 = v139;
        _os_log_impl(&dword_193646000, v139, v63, "attempting to re-configure session (%{public}s:%{public}s) after initial configuration", v64, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1997002F0](v65, -1, -1);
        MEMORY[0x1997002F0](v64, -1, -1);
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
      }
      (*(void (**)(char *, uint64_t))(v128 + 8))(v132, v137);
      uint64_t v69 = (uint64_t)v130;
      uint64_t v70 = v136;
      if (v136)
      {
        uint64_t v71 = sub_1936685F8();
        __swift_storeEnumTagSinglePayload(v69, 1, 1, v71);
        int v25 = (void *)swift_allocObject();
        v25[2] = 0;
        v25[3] = 0;
        v25[4] = v70;
        v25[5] = v135;
        swift_retain();
        unsigned int v32 = &unk_1E9328420;
        uint64_t v33 = v69;
        goto LABEL_33;
      }
      return;
    }
    unint64_t v126 = v16;
    int v38 = 1;
    v138[OBJC_IVAR____RTCReportingS_configured] = 1;
    sub_193650ED4(v17, &v147);
    sub_193653120((uint64_t)&v147, (uint64_t)&v143, &qword_1EB4B2E90);
    if (v144)
    {
      sub_193650D74(&v143, v141);
      sub_193650D18((uint64_t)v141, (uint64_t)v140);
      char v39 = swift_dynamicCast();
      if ((v39 & 1) == 0) {
        LOWORD(v145) = 0;
      }
      BYTE2(v145) = v39 ^ 1;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v141);
      int v40 = (unsigned __int16)v145;
      int v38 = BYTE2(v145);
    }
    else
    {
      int v40 = 0;
    }
    sub_1936530CC((uint64_t)&v147, &qword_1EB4B2E90);
    if (v38) {
      int v40 = 0;
    }
    sub_193650ED4(v17, &v147);
    sub_193653120((uint64_t)&v147, (uint64_t)&v143, &qword_1EB4B2E90);
    LODWORD(v125) = v40;
    if (v144)
    {
      sub_193650D74(&v143, v141);
      sub_193650D18((uint64_t)v141, (uint64_t)v140);
      char v45 = swift_dynamicCast();
      if ((v45 & 1) == 0) {
        LODWORD(v145) = 0;
      }
      BYTE4(v145) = v45 ^ 1;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v141);
      int v46 = v145;
      int v47 = BYTE4(v145);
    }
    else
    {
      int v46 = 0;
      int v47 = 1;
    }
    sub_1936530CC((uint64_t)&v147, &qword_1EB4B2E90);
    char v148 = 0;
    if (v47) {
      int v46 = 0;
    }
    char v149 = 0;
    char v142 = 1;
    sub_193650ED4(v17, &v147);
    sub_193653120((uint64_t)&v147, (uint64_t)&v143, &qword_1EB4B2E90);
    if (v144)
    {
      sub_193650D74(&v143, v141);
      sub_193650D18((uint64_t)v141, (uint64_t)v140);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2E18);
      if (swift_dynamicCast()) {
        uint64_t v72 = v145;
      }
      else {
        uint64_t v72 = sub_1936684C8();
      }
      uint64_t v73 = sub_19364ACB4(v72);
      uint64_t v74 = v75;
      uint64_t v77 = v76;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v141);
      sub_1936530CC((uint64_t)&v147, &qword_1EB4B2E90);
      uint64_t v127 = v77;
      if (v77)
      {
        swift_bridgeObjectRelease();
        goto LABEL_82;
      }
      uint64_t v73 = 0;
      uint64_t v74 = 0;
    }
    else
    {
      sub_1936530CC((uint64_t)&v147, &qword_1EB4B2E90);
      uint64_t v73 = 0;
      uint64_t v74 = 0;
    }
    uint64_t v127 = 0;
LABEL_82:
    sub_193650ED4(v17, &v147);
    sub_193653120((uint64_t)&v147, (uint64_t)&v143, &qword_1EB4B2E90);
    if (v144)
    {
      sub_193650D74(&v143, v141);
      sub_193650D18((uint64_t)v141, (uint64_t)v140);
      if ((swift_dynamicCast() & 1) == 0)
      {
        uint64_t v145 = 0;
        v146 = 0;
      }
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v141);
      uint64_t v79 = v145;
      uint64_t v78 = v146;
    }
    else
    {
      uint64_t v78 = 0;
      uint64_t v79 = 0;
    }
    sub_1936530CC((uint64_t)&v147, &qword_1EB4B2E90);
    if (v78) {
      swift_bridgeObjectRelease();
    }
    else {
      uint64_t v79 = 0;
    }
    sub_193650ED4(v17, &v147);
    sub_193653120((uint64_t)&v147, (uint64_t)&v143, &qword_1EB4B2E90);
    if (v144)
    {
      sub_193650D74(&v143, v141);
      sub_193650D18((uint64_t)v141, (uint64_t)v140);
      if ((swift_dynamicCast() & 1) == 0)
      {
        uint64_t v145 = 0;
        v146 = 0;
      }
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v141);
      v80 = v146;
      uint64_t v128 = v145;
    }
    else
    {
      v80 = 0;
      uint64_t v128 = 0;
    }
    sub_1936530CC((uint64_t)&v147, &qword_1EB4B2E90);
    uint64_t v120 = v80;
    if (v80) {
      swift_bridgeObjectRelease();
    }
    else {
      uint64_t v128 = 0;
    }
    sub_193650ED4(v17, &v147);
    sub_193653120((uint64_t)&v147, (uint64_t)&v143, &qword_1EB4B2E90);
    LODWORD(v124) = v46;
    if (v144)
    {
      sub_193650D74(&v143, v141);
      sub_193650D18((uint64_t)v141, (uint64_t)v140);
      if ((swift_dynamicCast() & 1) == 0)
      {
        uint64_t v145 = 0;
        v146 = 0;
      }
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v141);
      uint64_t v81 = v145;
      uint64_t v82 = v146;
    }
    else
    {
      uint64_t v82 = 0;
      uint64_t v81 = 0;
    }
    sub_1936530CC((uint64_t)&v147, &qword_1EB4B2E90);
    if (v82) {
      swift_bridgeObjectRelease();
    }
    else {
      uint64_t v81 = 0;
    }
    sub_193650ED4(v17, &v147);
    sub_193653120((uint64_t)&v147, (uint64_t)&v143, &qword_1EB4B2E90);
    uint64_t v123 = v73;
    if (v144)
    {
      sub_193650D74(&v143, v141);
      sub_193650D18((uint64_t)v141, (uint64_t)v140);
      if ((swift_dynamicCast() & 1) == 0) {
        LOBYTE(v145) = 2;
      }
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v141);
      int v83 = v145;
    }
    else
    {
      int v83 = 2;
    }
    sub_1936530CC((uint64_t)&v147, &qword_1EB4B2E90);
    if (v83 != 2) {
      char v148 = v83 & 1;
    }
    sub_193650ED4(v17, &v147);
    sub_193653120((uint64_t)&v147, (uint64_t)&v143, &qword_1EB4B2E90);
    if (v144)
    {
      sub_193650D74(&v143, v141);
      sub_193650D18((uint64_t)v141, (uint64_t)v140);
      char v84 = swift_dynamicCast();
      if ((v84 & 1) == 0) {
        uint64_t v145 = 0;
      }
      LOBYTE(v146) = v84 ^ 1;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v141);
      uint64_t v129 = v145;
      char v85 = (char)v146;
    }
    else
    {
      uint64_t v129 = 0;
      char v85 = 1;
    }
    uint64_t v121 = v79;
    sub_1936530CC((uint64_t)&v147, &qword_1EB4B2E90);
    uint64_t v86 = v78;
    if (v85) {
      uint64_t v129 = 0;
    }
    else {
      char v142 = 0;
    }
    uint64_t v118 = v81;
    uint64_t v122 = v74;
    char v87 = getprogname();
    unint64_t v119 = v15;
    if (v87)
    {
      uint64_t v89 = sub_193668568();
      uint64_t v90 = v88;
      BOOL v91 = v89 == 0x64786F62646E6173 && v88 == 0xE800000000000000;
      int v92 = v91;
      if (v91
        || (sub_193668878() & 1) != 0
        || (v89 == 0x6C6F6F74637472 ? (BOOL v93 = v90 == 0xE700000000000000) : (BOOL v93 = 0),
            v93 || (sub_193668878() & 1) != 0))
      {
        sub_193650ED4(v17, &v147);
        sub_193653120((uint64_t)&v147, (uint64_t)&v143, &qword_1EB4B2E90);
        if (v144)
        {
          sub_193650D74(&v143, v141);
          sub_193650D18((uint64_t)v141, (uint64_t)v140);
          if ((swift_dynamicCast() & 1) == 0) {
            LOBYTE(v145) = 2;
          }
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v141);
          int v94 = v145;
        }
        else
        {
          int v94 = 2;
        }
        sub_1936530CC((uint64_t)&v147, &qword_1EB4B2E90);
        if (v94 != 2) {
          char v149 = v94 & 1;
        }
        if (v92)
        {
          swift_bridgeObjectRelease();
          uint64_t v96 = (uint64_t)v130;
LABEL_146:
          if (qword_1EB4B2F10 != -1) {
            swift_once();
          }
          __swift_project_value_buffer(v137, (uint64_t)qword_1EB4B2ED8);
          uint64_t v98 = sub_1936683F8();
          os_log_type_t v99 = sub_193668688();
          if (os_log_type_enabled(v98, v99))
          {
            uint64_t v100 = (uint8_t *)sub_19365B420();
            *(_WORD *)uint64_t v100 = 0;
            _os_log_impl(&dword_193646000, v98, v99, "overriding eager=YES for sandboxd", v100, 2u);
            MEMORY[0x1997002F0](v100, -1, -1);
          }

          char v95 = 1;
          char v149 = 1;
          goto LABEL_152;
        }
      }
      char v97 = sub_193668878();
      swift_bridgeObjectRelease();
      uint64_t v96 = (uint64_t)v130;
      if (v97) {
        goto LABEL_146;
      }
      char v95 = v149;
    }
    else
    {
      char v95 = 0;
      uint64_t v96 = (uint64_t)v130;
    }
LABEL_152:
    uint64_t v101 = swift_bridgeObjectRetain();
    uint64_t v102 = v138;
    sub_193649654(v101);
    swift_bridgeObjectRelease();
    char v103 = v148;
    LOBYTE(v143) = v142;
    swift_bridgeObjectRetain();
    uint64_t v104 = v127;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v105 = v82;
    uint64_t v106 = v120;
    swift_bridgeObjectRetain();
    sub_1936685D8();
    uint64_t v107 = sub_1936685F8();
    __swift_storeEnumTagSinglePayload(v96, 0, 1, v107);
    uint64_t v108 = swift_allocObject();
    *(void *)(v108 + 16) = 0;
    *(void *)(v108 + 24) = 0;
    uint64_t v109 = v133;
    *(void *)(v108 + 32) = v132;
    *(void *)(v108 + 40) = v109;
    unint64_t v110 = v126;
    *(void *)(v108 + 48) = v139;
    *(void *)(v108 + 56) = v110;
    *(void *)(v108 + 64) = v119;
    *(_WORD *)(v108 + 72) = v125;
    *(_DWORD *)(v108 + 76) = v124;
    uint64_t v111 = v122;
    *(void *)(v108 + 80) = v123;
    *(void *)(v108 + 88) = v111;
    uint64_t v112 = v121;
    *(void *)(v108 + 96) = v104;
    *(void *)(v108 + 104) = v112;
    uint64_t v113 = v128;
    *(void *)(v108 + 112) = v86;
    *(void *)(v108 + 120) = v113;
    uint64_t v114 = v118;
    *(void *)(v108 + 128) = v106;
    *(void *)(v108 + 136) = v114;
    *(void *)(v108 + 144) = v105;
    *(unsigned char *)(v108 + 152) = v103;
    *(unsigned char *)(v108 + 153) = v95;
    *(_DWORD *)(v108 + 154) = v147;
    *(_WORD *)(v108 + 158) = WORD2(v147);
    *(void *)(v108 + 160) = v129;
    *(unsigned char *)(v108 + 168) = v143;
    *(void *)(v108 + 176) = v102;
    uint64_t v115 = v136;
    uint64_t v116 = v135;
    *(void *)(v108 + 184) = v136;
    *(void *)(v108 + 192) = v116;
    *(void *)(v108 + 200) = v134;
    sub_193654BEC(v115);
    id v117 = v102;
    sub_19364B374(v96, (uint64_t)&unk_1E9328410, v108);
    swift_release();
    sub_1936530CC(v96, &qword_1EB4B2EB8);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRelease();
  if (qword_1EB4B2F10 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v137, (uint64_t)qword_1EB4B2ED8);
  uint64_t v27 = sub_1936683F8();
  os_log_type_t v28 = sub_193668678();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = (uint8_t *)sub_19365B420();
    *(_WORD *)uint64_t v29 = 0;
    _os_log_impl(&dword_193646000, v27, v28, "invalid or missing clientName", v29, 2u);
    MEMORY[0x1997002F0](v29, -1, -1);
  }

  uint64_t v30 = v136;
  if (v136)
  {
    uint64_t v31 = sub_1936685F8();
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 1, 1, v31);
    int v25 = (void *)swift_allocObject();
    v25[2] = 0;
    v25[3] = 0;
    v25[4] = v30;
    v25[5] = v135;
    swift_retain();
    uint64_t v26 = &unk_1E93283F0;
    goto LABEL_32;
  }
}

uint64_t sub_193650D18(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_193650D74(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_193650D84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_193650F38();
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2EC0);
  if ((sub_1936687D8() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_193650F38();
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_13:
    uint64_t result = sub_1936688C8();
    __break(1u);
    return result;
  }
  unint64_t v11 = v13;
LABEL_5:
  unint64_t v15 = *v4;
  if (v12)
  {
    uint64_t v16 = v15[7];
    uint64_t v17 = v16 + *(void *)(*(void *)(type metadata accessor for EventValue() - 8) + 72) * v11;
    return sub_193664CF0(a1, v17);
  }
  else
  {
    sub_193651090(v11, a2, a3, a1, v15);
    return swift_bridgeObjectRetain();
  }
}

double sub_193650ED4@<D0>(uint64_t a1@<X2>, _OWORD *a2@<X8>)
{
  if (*(void *)(a1 + 16) && (unint64_t v4 = sub_193650F38(), (v5 & 1) != 0))
  {
    uint64_t v6 = *(void *)(a1 + 56) + 32 * v4;
    sub_193650D18(v6, (uint64_t)a2);
  }
  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

unint64_t sub_193650F38()
{
  sub_193668958();
  sub_193668548();
  sub_193668988();
  uint64_t v0 = OUTLINED_FUNCTION_28();
  return sub_193650FAC(v0, v1, v2);
}

unint64_t sub_193650FAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_193668878() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_193668878() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_193651090(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = (void *)(a5[6] + 16 * a1);
  void *v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = type metadata accessor for EventValue();
  uint64_t result = sub_193652D08(a4, v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

uint64_t sub_193651128(uint64_t a1)
{
  uint64_t v2 = v1;
  type metadata accessor for EventValue();
  OUTLINED_FUNCTION_1_2();
  uint64_t v49 = v4;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_6();
  unint64_t v8 = v6 - v7;
  MEMORY[0x1F4188790](v9);
  BOOL v11 = (int64_t *)((char *)&v44 - v10);
  uint64_t v12 = sub_1936684A8();
  uint64_t v45 = a1 + 64;
  OUTLINED_FUNCTION_38_0();
  unint64_t v15 = v14 & v13;
  int64_t v46 = (unint64_t)(v16 + 63) >> 6;
  int v47 = v55;
  uint64_t v50 = &v58;
  int64_t v44 = v46 - 1;
  uint64_t v48 = a1;
  swift_bridgeObjectRetain();
  int64_t v17 = 0;
  if (!v15) {
    goto LABEL_4;
  }
LABEL_2:
  unint64_t v18 = __clz(__rbit64(v15));
  uint64_t v19 = (v15 - 1) & v15;
  unint64_t v20 = v18 | (v17 << 6);
LABEL_3:
  uint64_t v21 = *(void *)(v48 + 56);
  uint64_t v22 = (void *)(*(void *)(v48 + 48) + 16 * v20);
  uint64_t v23 = v22[1];
  *(void *)&long long v54 = *v22;
  *((void *)&v54 + 1) = v23;
  sub_193650D18(v21 + 32 * v20, (uint64_t)v47);
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_193651544((uint64_t)&v54, (uint64_t)&v56, &qword_1EB4B2E88);
    uint64_t v26 = v57;
    if (!v57) {
      goto LABEL_38;
    }
    uint64_t v27 = v56;
    sub_193650D74(v50, &v54);
    sub_1936515A0((uint64_t)&v54, v11);
    if (v2)
    {
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v54);
      swift_bridgeObjectRelease();
LABEL_38:
      swift_release();
      return v12;
    }
    unint64_t v51 = v19;
    int64_t v52 = v17;
    uint64_t v53 = 0;
    sub_193652D08((uint64_t)v11, v8);
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v59 = v12;
    unint64_t v28 = sub_193650F38();
    if (__OFADD__(*(void *)(v12 + 16), (v29 & 1) == 0))
    {
      __break(1u);
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    unint64_t v8 = v28;
    char v30 = v29;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2EC0);
    if (sub_1936687D8())
    {
      unint64_t v31 = sub_193650F38();
      if ((v30 & 1) != (v32 & 1)) {
        goto LABEL_43;
      }
      unint64_t v8 = v31;
    }
    uint64_t v12 = v59;
    if (v30)
    {
      uint64_t v33 = OUTLINED_FUNCTION_24_1();
      sub_193664CF0(v33, v34);
    }
    else
    {
      OUTLINED_FUNCTION_40(v59 + 8 * (v8 >> 6));
      uint64_t v36 = (void *)(v35 + 16 * v8);
      *uint64_t v36 = v27;
      v36[1] = v26;
      uint64_t v37 = OUTLINED_FUNCTION_24_1();
      sub_193652D08(v37, v38);
      uint64_t v39 = *(void *)(v12 + 16);
      BOOL v40 = __OFADD__(v39, 1);
      uint64_t v41 = v39 + 1;
      if (v40) {
        goto LABEL_40;
      }
      *(void *)(v12 + 16) = v41;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v54);
    int64_t v17 = v52;
    uint64_t v2 = v53;
    unint64_t v15 = v51;
    if (v51) {
      goto LABEL_2;
    }
LABEL_4:
    int64_t v24 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      goto LABEL_41;
    }
    if (v24 < v46)
    {
      unint64_t v25 = *(void *)(v45 + 8 * v24);
      if (v25) {
        goto LABEL_7;
      }
      v17 += 2;
      if (v24 + 1 >= v46)
      {
        int64_t v17 = v24;
        goto LABEL_12;
      }
      unint64_t v25 = *(void *)(v45 + 8 * v17);
      if (v25)
      {
        ++v24;
LABEL_7:
        uint64_t v19 = (v25 - 1) & v25;
        unint64_t v20 = __clz(__rbit64(v25)) + (v24 << 6);
        int64_t v17 = v24;
        goto LABEL_3;
      }
      if (v24 + 2 < v46) {
        break;
      }
    }
LABEL_12:
    uint64_t v19 = 0;
    memset(v55, 0, sizeof(v55));
    long long v54 = 0u;
  }
  unint64_t v25 = *(void *)(v45 + 8 * (v24 + 2));
  if (v25)
  {
    v24 += 2;
    goto LABEL_7;
  }
  int64_t v42 = v24 + 3;
  if (v24 + 3 >= v46)
  {
    int64_t v17 = v24 + 2;
    goto LABEL_12;
  }
  unint64_t v25 = *(void *)(v45 + 8 * v42);
  if (v25)
  {
    v24 += 3;
    goto LABEL_7;
  }
  while (1)
  {
    int64_t v24 = v42 + 1;
    if (__OFADD__(v42, 1)) {
      break;
    }
    if (v24 >= v46)
    {
      int64_t v17 = v44;
      goto LABEL_12;
    }
    unint64_t v25 = *(void *)(v45 + 8 * v24);
    ++v42;
    if (v25) {
      goto LABEL_7;
    }
  }
LABEL_42:
  __break(1u);
LABEL_43:
  uint64_t result = sub_1936688C8();
  __break(1u);
  return result;
}

uint64_t sub_193651544(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_1936515A0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = type metadata accessor for EventValue();
  OUTLINED_FUNCTION_1_2();
  uint64_t v95 = v6;
  ((void (*)(void))MEMORY[0x1F4188790])();
  OUTLINED_FUNCTION_6();
  uint64_t v96 = v7 - v8;
  uint64_t v9 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  int v94 = (char *)&v84 - v10;
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v84 - v11;
  uint64_t v90 = (uint64_t *)sub_1936682D8();
  OUTLINED_FUNCTION_1_2();
  uint64_t v89 = v13;
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_23();
  uint64_t v15 = sub_1936683E8();
  OUTLINED_FUNCTION_1_2();
  uint64_t v91 = v16;
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_23();
  uint64_t v20 = v19 - v18;
  sub_193650D18(a1, (uint64_t)v104);
  if (OUTLINED_FUNCTION_6_1())
  {
    uint64_t v21 = *((void *)&v100 + 1);
    *a2 = v100;
    a2[1] = v21;
LABEL_12:
    swift_storeEnumTagMultiPayload();
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v104);
  }
  int v92 = a2;
  uint64_t v93 = v5;
  sub_193654BB0(0, &qword_1EB4B2DE0);
  if (OUTLINED_FUNCTION_6_1())
  {
    uint64_t v22 = v100;
    if (*MEMORY[0x1E4F1CFD0] && (void)v100 == *MEMORY[0x1E4F1CFD0])
    {

      *(unsigned char *)int v92 = 1;
      goto LABEL_12;
    }
    uint64_t v23 = *MEMORY[0x1E4F1CFC8];

    if (v23 && v22 == v23)
    {
      *(unsigned char *)OUTLINED_FUNCTION_50() = 0;
      goto LABEL_12;
    }
  }
  if (OUTLINED_FUNCTION_6_1() || OUTLINED_FUNCTION_6_1())
  {
    OUTLINED_FUNCTION_23_1();
    goto LABEL_12;
  }
  if (OUTLINED_FUNCTION_6_1())
  {
    unint64_t v25 = (void *)OUTLINED_FUNCTION_50();
    *unint64_t v25 = v26;
    goto LABEL_12;
  }
  if (swift_dynamicCast())
  {
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v91 + 32))(v92, v20, v15);
    goto LABEL_12;
  }
  sub_193654BB0(0, &qword_1EB4B2BB8);
  if (OUTLINED_FUNCTION_43())
  {
    id v27 = v105;
    uint64_t v28 = (uint64_t)objc_msgSend(v105, sel_count);
    uint64_t v29 = sub_1936634B0(0, v28 & ~(v28 >> 63), 0, MEMORY[0x1E4FBC860]);
    sub_1936686D8();
    sub_1936682C8();
    uint64_t v30 = v95;
    if (v102)
    {
      while (1)
      {
        sub_193650D74(&v100, &v98);
        sub_1936515A0(&v98);
        if (v2) {
          break;
        }
        unint64_t v32 = *(void *)(v29 + 16);
        unint64_t v31 = *(void *)(v29 + 24);
        if (v32 >= v31 >> 1) {
          uint64_t v29 = sub_1936634B0(v31 > 1, v32 + 1, 1, v29);
        }
        *(void *)(v29 + 16) = v32 + 1;
        sub_193652D08((uint64_t)v12, v29+ ((*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80))+ *(void *)(v30 + 72) * v32);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v98);
        sub_1936682C8();
        if (!v102) {
          goto LABEL_64;
        }
      }

      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v98);
      uint64_t v76 = OUTLINED_FUNCTION_15_1();
      v77(v76);
      swift_bridgeObjectRelease();
      return __swift_destroy_boxed_opaque_existential_0((uint64_t)v104);
    }
LABEL_64:
    uint64_t v68 = OUTLINED_FUNCTION_15_1();
    v69(v68);

    *(void *)OUTLINED_FUNCTION_50() = v29;
    goto LABEL_12;
  }
  sub_193654BB0(0, (unint64_t *)&unk_1EB4B2D80);
  if (!OUTLINED_FUNCTION_43())
  {
    sub_193654BB0(0, &qword_1EB4B2A18);
    if (swift_dynamicCast())
    {
      uint64_t v70 = (void *)v100;
      if (objc_msgSend((id)v100, sel_respondsToSelector_, sel_description))
      {
        id v71 = objc_msgSend(v70, sel_description);
        uint64_t v72 = sub_193668518();
        uint64_t v74 = v73;

        uint64_t v75 = (void *)OUTLINED_FUNCTION_50();
        *uint64_t v75 = v72;
        v75[1] = v74;
        goto LABEL_12;
      }
    }
    uint64_t v78 = (void *)OUTLINED_FUNCTION_16_1();
    __swift_project_boxed_opaque_existential_0(v78, v79);
    *(void *)&long long v100 = swift_getDynamicType();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9328048);
    uint64_t v80 = sub_193668528();
    uint64_t v82 = v81;
    sub_193664D6C();
    swift_allocError();
    *int v83 = v80;
    v83[1] = v82;
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v104);
  }
  *(void *)&long long v100 = 0;
  id v85 = v105;
  sub_193668478();
  uint64_t v33 = v92;
  if (!(void)v100) {
    goto LABEL_77;
  }
  uint64_t v34 = v100;
  uint64_t v103 = sub_1936684A8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B29F8);
  sub_1936684B8();
  int64_t v35 = 0;
  uint64_t v89 = v34;
  uint64_t v86 = v34 + 64;
  OUTLINED_FUNCTION_38_0();
  uint64_t v38 = v37 & v36;
  uint64_t v39 = v103;
  uint64_t v88 = v99;
  uint64_t v90 = &v101;
  int64_t v87 = (unint64_t)(v40 + 63) >> 6;
  int64_t v84 = v87 - 1;
  if ((v37 & v36) == 0) {
    goto LABEL_31;
  }
LABEL_29:
  OUTLINED_FUNCTION_46();
  unint64_t v42 = v41 | (v35 << 6);
LABEL_30:
  uint64_t v43 = *(void *)(v89 + 56);
  int64_t v44 = (void *)(*(void *)(v89 + 48) + 16 * v42);
  uint64_t v45 = v44[1];
  *(void *)&long long v98 = *v44;
  *((void *)&v98 + 1) = v45;
  sub_193650D18(v43 + 32 * v42, (uint64_t)v88);
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_193651544((uint64_t)&v98, (uint64_t)&v100, &qword_1EB4B2E88);
    uint64_t v48 = *((void *)&v100 + 1);
    if (!*((void *)&v100 + 1))
    {
      uint64_t v103 = v39;

      swift_release();
      *uint64_t v33 = v39;
      goto LABEL_12;
    }
    uint64_t v49 = v100;
    sub_193650D74(v90, &v98);
    uint64_t v50 = (uint64_t)v94;
    sub_1936515A0(&v98);
    if (v2)
    {
      uint64_t v103 = v39;
      swift_bridgeObjectRelease();

      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v98);
      swift_bridgeObjectRelease();
      swift_release();
      return __swift_destroy_boxed_opaque_existential_0((uint64_t)v104);
    }
    uint64_t v91 = v38;
    sub_193652D08(v50, v96);
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v97 = v39;
    uint64_t v51 = v49;
    unint64_t v52 = sub_193650F38();
    if (__OFADD__(*(void *)(v39 + 16), (v53 & 1) == 0))
    {
      __break(1u);
LABEL_74:
      __break(1u);
LABEL_75:
      __break(1u);
      goto LABEL_76;
    }
    unint64_t v54 = v52;
    char v55 = v53;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2EC0);
    if (sub_1936687D8())
    {
      unint64_t v56 = sub_193650F38();
      if ((v55 & 1) != (v57 & 1)) {
        goto LABEL_78;
      }
      unint64_t v54 = v56;
    }
    uint64_t v39 = v97;
    if (v55)
    {
      uint64_t v58 = OUTLINED_FUNCTION_49();
      sub_193664CF0(v58, v59);
    }
    else
    {
      OUTLINED_FUNCTION_40(v97 + 8 * (v54 >> 6));
      uint64_t v61 = (void *)(v60 + 16 * v54);
      void *v61 = v51;
      v61[1] = v48;
      uint64_t v62 = OUTLINED_FUNCTION_49();
      sub_193652D08(v62, v63);
      uint64_t v64 = *(void *)(v39 + 16);
      BOOL v65 = __OFADD__(v64, 1);
      uint64_t v66 = v64 + 1;
      if (v65) {
        goto LABEL_74;
      }
      *(void *)(v39 + 16) = v66;
      swift_bridgeObjectRetain();
    }
    uint64_t v33 = v92;
    uint64_t v38 = v91;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v98);
    if (v38) {
      goto LABEL_29;
    }
LABEL_31:
    int64_t v46 = v35 + 1;
    if (__OFADD__(v35, 1)) {
      goto LABEL_75;
    }
    if (v46 < v87)
    {
      unint64_t v47 = *(void *)(v86 + 8 * v46);
      if (v47) {
        goto LABEL_34;
      }
      v35 += 2;
      if (v46 + 1 >= v87)
      {
        int64_t v35 = v46;
        goto LABEL_39;
      }
      unint64_t v47 = *(void *)(v86 + 8 * v35);
      if (v47)
      {
        ++v46;
LABEL_34:
        uint64_t v38 = (v47 - 1) & v47;
        unint64_t v42 = __clz(__rbit64(v47)) + (v46 << 6);
        int64_t v35 = v46;
        goto LABEL_30;
      }
      if (v46 + 2 < v87) {
        break;
      }
    }
LABEL_39:
    uint64_t v38 = 0;
    memset(v99, 0, sizeof(v99));
    long long v98 = 0u;
  }
  unint64_t v47 = *(void *)(v86 + 8 * (v46 + 2));
  if (v47)
  {
    v46 += 2;
    goto LABEL_34;
  }
  int64_t v67 = v46 + 3;
  if (v46 + 3 >= v87)
  {
    int64_t v35 = v46 + 2;
    goto LABEL_39;
  }
  unint64_t v47 = *(void *)(v86 + 8 * v67);
  if (v47)
  {
    v46 += 3;
    goto LABEL_34;
  }
  while (1)
  {
    int64_t v46 = v67 + 1;
    if (__OFADD__(v67, 1)) {
      break;
    }
    if (v46 >= v87)
    {
      int64_t v35 = v84;
      goto LABEL_39;
    }
    unint64_t v47 = *(void *)(v86 + 8 * v46);
    ++v67;
    if (v47) {
      goto LABEL_34;
    }
  }
LABEL_76:
  __break(1u);
LABEL_77:
  __break(1u);
LABEL_78:
  uint64_t result = sub_1936688C8();
  __break(1u);
  return result;
}

void sub_193651FC8()
{
  OUTLINED_FUNCTION_12();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB4B2E60);
  uint64_t v6 = OUTLINED_FUNCTION_7(v5);
  MEMORY[0x1F4188790](v6);
  uint64_t v7 = OUTLINED_FUNCTION_14_0();
  uint64_t v38 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7 - 8);
  OUTLINED_FUNCTION_24();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2E10);
  uint64_t v9 = OUTLINED_FUNCTION_7(v8);
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_13();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_20();
  uint64_t v11 = *v1;
  uint64_t v36 = *v1 + 64;
  RTCXPCDictionary.init()();
  OUTLINED_FUNCTION_16();
  unint64_t v14 = v13 & v12;
  int64_t v37 = (unint64_t)(v15 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v16 = 0;
  if (!v14) {
    goto LABEL_4;
  }
LABEL_2:
  unint64_t v17 = __clz(__rbit64(v14));
  v14 &= v14 - 1;
  unint64_t v18 = v17 | (v16 << 6);
  while (2)
  {
    uint64_t v19 = *(void *)(v11 + 56);
    uint64_t v20 = (void *)(*(void *)(v11 + 48) + 16 * v18);
    uint64_t v21 = v20[1];
    *uint64_t v3 = *v20;
    v3[1] = v21;
    uint64_t v22 = v19 + *(void *)(v38 + 72) * v18;
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2EB0);
    sub_193652B74(v22, (uint64_t)v3 + *(int *)(v23 + 48));
    OUTLINED_FUNCTION_31();
    __swift_storeEnumTagSinglePayload(v24, v25, v26, v23);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_193652470((uint64_t)v3, v4);
      uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2EB0);
      if (__swift_getEnumTagSinglePayload(v4, 1, v31) == 1)
      {
        swift_release();
        OUTLINED_FUNCTION_11();
        return;
      }
      sub_193652D08(v4 + *(int *)(v31 + 48), v2);
      sub_1936525F8();
      type metadata accessor for XPCObject();
      OUTLINED_FUNCTION_31();
      __swift_storeEnumTagSinglePayload(v32, v33, v34, v35);
      RTCXPCDictionary.subscript.setter(v0);
      sub_1936524D8(v2, (void (*)(void))type metadata accessor for EventValue);
      if (v14) {
        goto LABEL_2;
      }
LABEL_4:
      int64_t v27 = v16 + 1;
      if (__OFADD__(v16, 1))
      {
        __break(1u);
        goto LABEL_27;
      }
      if (v27 < v37)
      {
        unint64_t v28 = *(void *)(v36 + 8 * v27);
        if (v28) {
          goto LABEL_7;
        }
        int64_t v29 = v16 + 2;
        ++v16;
        if (v27 + 1 < v37)
        {
          unint64_t v28 = *(void *)(v36 + 8 * v29);
          if (v28) {
            goto LABEL_10;
          }
          int64_t v16 = v27 + 1;
          if (v27 + 2 < v37)
          {
            unint64_t v28 = *(void *)(v36 + 8 * (v27 + 2));
            if (v28)
            {
              v27 += 2;
              goto LABEL_7;
            }
            int64_t v29 = v27 + 3;
            int64_t v16 = v27 + 2;
            if (v27 + 3 < v37) {
              break;
            }
          }
        }
      }
LABEL_21:
      uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2EB0);
      __swift_storeEnumTagSinglePayload((uint64_t)v3, 1, 1, v30);
      unint64_t v14 = 0;
    }
    unint64_t v28 = *(void *)(v36 + 8 * v29);
    if (v28)
    {
LABEL_10:
      int64_t v27 = v29;
LABEL_7:
      unint64_t v14 = (v28 - 1) & v28;
      unint64_t v18 = __clz(__rbit64(v28)) + (v27 << 6);
      int64_t v16 = v27;
      continue;
    }
    break;
  }
  while (1)
  {
    int64_t v27 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v27 >= v37)
    {
      int64_t v16 = v37 - 1;
      goto LABEL_21;
    }
    unint64_t v28 = *(void *)(v36 + 8 * v27);
    ++v29;
    if (v28) {
      goto LABEL_7;
    }
  }
LABEL_27:
  __break(1u);
}

uint64_t RTCXPCDictionary.subscript.setter(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB4B2E60);
  uint64_t v4 = OUTLINED_FUNCTION_7(v3);
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_23();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = *v1;
  sub_193653120(a1, v6 - v5, (uint64_t *)&unk_1EB4B2E60);
  uint64_t v9 = type metadata accessor for XPCObject();
  if (__swift_getEnumTagSinglePayload(v7, 1, v9) == 1)
  {
    sub_1936530CC(v7, (uint64_t *)&unk_1EB4B2E60);
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = XPCObject.obj.getter();
    sub_19365317C(v7);
  }
  uint64_t v11 = sub_193668538();
  swift_bridgeObjectRelease();
  xpc_dictionary_set_value(v8, (const char *)(v11 + 32), v10);
  swift_unknownObjectRelease();
  sub_1936530CC(a1, (uint64_t *)&unk_1EB4B2E60);
  return swift_release();
}

uint64_t sub_193652470(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2E10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1936524D8(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t destroy for EventValue(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 6:
    case 7:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 5:
      uint64_t v3 = sub_1936683E8();
      uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
      uint64_t result = v4(a1, v3);
      break;
    default:
      return result;
  }
  return result;
}

void sub_1936525F8()
{
  OUTLINED_FUNCTION_12();
  uint64_t v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB4B2E60);
  uint64_t v5 = OUTLINED_FUNCTION_7(v4);
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_24();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2E10);
  uint64_t v7 = OUTLINED_FUNCTION_7(v6);
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_6();
  uint64_t v10 = (void *)(v8 - v9);
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (char *)&v59 - v12;
  uint64_t v65 = type metadata accessor for XPCObject();
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_23();
  uint64_t v17 = v16 - v15;
  type metadata accessor for EventValue();
  OUTLINED_FUNCTION_0_0();
  uint64_t v64 = v18;
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_13();
  MEMORY[0x1F4188790](v20);
  uint64_t v22 = (uint64_t *)((char *)&v59 - v21);
  sub_193652B74(v0, (uint64_t)&v59 - v21);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
    case 2u:
    case 3u:
      *uint64_t v3 = *v22;
      OUTLINED_FUNCTION_17();
      goto LABEL_35;
    case 4u:
      *(unsigned char *)uint64_t v3 = *(unsigned char *)v22;
      OUTLINED_FUNCTION_17();
      goto LABEL_35;
    case 5u:
      sub_1936683E8();
      OUTLINED_FUNCTION_1_0();
      (*(void (**)(void *, void *))(v24 + 32))(v3, v22);
      OUTLINED_FUNCTION_17();
      goto LABEL_35;
    case 6u:
      uint64_t v61 = v3;
      uint64_t v25 = *v22;
      xpc_object_t empty = xpc_array_create_empty();
      uint64_t v27 = *(void *)(v25 + 16);
      if (v27)
      {
        uint64_t v28 = v25 + ((*(unsigned __int8 *)(v64 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80));
        uint64_t v29 = *(void *)(v64 + 72);
        do
        {
          uint64_t v30 = sub_193652B74(v28, v1);
          sub_1936525F8(v30);
          XPCObject.obj.getter();
          sub_1936524D8(v17, (void (*)(void))type metadata accessor for XPCObject);
          uint64_t v31 = (void *)OUTLINED_FUNCTION_29();
          xpc_array_append_value(v31, v32);
          swift_unknownObjectRelease();
          sub_1936524D8(v1, (void (*)(void))type metadata accessor for EventValue);
          v28 += v29;
          --v27;
        }
        while (v27);
      }
      swift_bridgeObjectRelease();
      void *v61 = empty;
      goto LABEL_35;
    case 7u:
      uint64_t v61 = v3;
      uint64_t v33 = *v22;
      int64_t v34 = 0;
      xpc_object_t v66 = RTCXPCDictionary.init()();
      uint64_t v62 = v33 + 64;
      OUTLINED_FUNCTION_16();
      unint64_t v37 = v36 & v35;
      int64_t v63 = (unint64_t)(v38 + 63) >> 6;
      int64_t v60 = v63 - 1;
      if ((v36 & v35) != 0) {
        goto LABEL_11;
      }
      break;
    default:
      uint64_t v23 = v22[1];
      *uint64_t v3 = *v22;
      v3[1] = v23;
      OUTLINED_FUNCTION_17();
      goto LABEL_35;
  }
LABEL_13:
  int64_t v49 = v34 + 1;
  if (__OFADD__(v34, 1))
  {
    __break(1u);
LABEL_37:
    __break(1u);
    return;
  }
  if (v49 < v63)
  {
    unint64_t v50 = *(void *)(v62 + 8 * v49);
    if (v50)
    {
LABEL_16:
      unint64_t v37 = (v50 - 1) & v50;
      unint64_t v40 = __clz(__rbit64(v50)) + (v49 << 6);
      int64_t v34 = v49;
      goto LABEL_12;
    }
    int64_t v51 = v34 + 2;
    ++v34;
    if (v49 + 1 < v63)
    {
      unint64_t v50 = *(void *)(v62 + 8 * v51);
      if (v50)
      {
LABEL_19:
        int64_t v49 = v51;
        goto LABEL_16;
      }
      int64_t v34 = v49 + 1;
      if (v49 + 2 < v63)
      {
        unint64_t v50 = *(void *)(v62 + 8 * (v49 + 2));
        if (v50)
        {
          v49 += 2;
          goto LABEL_16;
        }
        int64_t v51 = v49 + 3;
        int64_t v34 = v49 + 2;
        if (v49 + 3 < v63)
        {
          unint64_t v50 = *(void *)(v62 + 8 * v51);
          if (v50) {
            goto LABEL_19;
          }
          while (1)
          {
            int64_t v49 = v51 + 1;
            if (__OFADD__(v51, 1)) {
              goto LABEL_37;
            }
            if (v49 >= v63)
            {
              int64_t v34 = v60;
              break;
            }
            unint64_t v50 = *(void *)(v62 + 8 * v49);
            ++v51;
            if (v50) {
              goto LABEL_16;
            }
          }
        }
      }
    }
  }
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2EB0);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 1, 1, v52);
  unint64_t v37 = 0;
  while (1)
  {
    sub_193652470((uint64_t)v10, (uint64_t)v13);
    uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2EB0);
    if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v53) == 1) {
      break;
    }
    uint64_t v54 = sub_193652D08((uint64_t)&v13[*(int *)(v53 + 48)], v1);
    sub_1936525F8(v54);
    OUTLINED_FUNCTION_31();
    __swift_storeEnumTagSinglePayload(v55, v56, v57, v65);
    uint64_t v58 = OUTLINED_FUNCTION_29();
    RTCXPCDictionary.subscript.setter(v58);
    sub_1936524D8(v1, (void (*)(void))type metadata accessor for EventValue);
    if (!v37) {
      goto LABEL_13;
    }
LABEL_11:
    unint64_t v39 = __clz(__rbit64(v37));
    v37 &= v37 - 1;
    unint64_t v40 = v39 | (v34 << 6);
LABEL_12:
    uint64_t v41 = *(void *)(v33 + 56);
    unint64_t v42 = (void *)(*(void *)(v33 + 48) + 16 * v40);
    uint64_t v43 = v42[1];
    *uint64_t v10 = *v42;
    v10[1] = v43;
    uint64_t v44 = v41 + *(void *)(v64 + 72) * v40;
    uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2EB0);
    sub_193652B74(v44, (uint64_t)v10 + *(int *)(v45 + 48));
    OUTLINED_FUNCTION_31();
    __swift_storeEnumTagSinglePayload(v46, v47, v48, v45);
    swift_bridgeObjectRetain();
  }
  swift_release();
  void *v61 = v66;
LABEL_35:
  swift_storeEnumTagMultiPayload();
  OUTLINED_FUNCTION_11();
}

uint64_t sub_193652B74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for EventValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void *initializeWithCopy for EventValue(void *a1, void *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      swift_bridgeObjectRetain();
      goto LABEL_6;
    case 5u:
      uint64_t v7 = sub_1936683E8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      goto LABEL_6;
    case 6u:
    case 7u:
      *a1 = *a2;
      swift_bridgeObjectRetain();
LABEL_6:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

uint64_t sub_193652D08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for EventValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for EventValue()
{
  uint64_t result = qword_1EB4B2EA0;
  if (!qword_1EB4B2EA0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

xpc_object_t RTCXPCDictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB4B2E60);
  uint64_t v3 = OUTLINED_FUNCTION_7(v2);
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_6();
  uint64_t v6 = v4 - v5;
  MEMORY[0x1F4188790](v7);
  uint64_t v50 = (uint64_t)&v42 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2E80);
  OUTLINED_FUNCTION_1_2();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_6();
  int64_t v49 = (void *)(v13 - v14);
  uint64_t v16 = MEMORY[0x1F4188790](v15);
  uint64_t v48 = (uint64_t *)((char *)&v42 - v17);
  uint64_t v18 = MEMORY[0x1F4188790](v16);
  uint64_t v20 = (uint64_t *)((char *)&v42 - v19);
  MEMORY[0x1F4188790](v18);
  uint64_t v22 = (uint64_t *)((char *)&v42 - v21);
  xpc_object_t empty = xpc_dictionary_create_empty();
  uint64_t v23 = *(void *)(a1 + 16);
  if (v23)
  {
    uint64_t v42 = a1;
    uint64_t v43 = v6;
    uint64_t v46 = v22;
    uint64_t v47 = v9;
    uint64_t v45 = (uint64_t)v22 + *(int *)(v9 + 48);
    uint64_t v24 = a1 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
    uint64_t v44 = *(void *)(v11 + 72);
    uint64_t v25 = v50;
    do
    {
      sub_193653120(v24, (uint64_t)v22, &qword_1EB4B2E80);
      uint64_t v26 = v47;
      uint64_t v27 = (uint64_t)v20 + *(int *)(v47 + 48);
      uint64_t v29 = *v22;
      uint64_t v28 = v22[1];
      *uint64_t v20 = v29;
      v20[1] = v28;
      sub_1936532D8(v45, v27);
      uint64_t v30 = *(int *)(v26 + 48);
      uint64_t v31 = v48;
      uint64_t v32 = (uint64_t)v48 + v30;
      *uint64_t v48 = v29;
      v31[1] = v28;
      sub_193653688(v27, (uint64_t)v31 + v30);
      uint64_t v33 = *(int *)(v26 + 48);
      int64_t v34 = v49;
      uint64_t v35 = (uint64_t)v49 + v33;
      void *v49 = v29;
      v34[1] = v28;
      sub_193653688(v27, (uint64_t)v34 + v33);
      sub_1936532D8(v35, v25);
      uint64_t v36 = type metadata accessor for XPCObject();
      OUTLINED_FUNCTION_7_2();
      uint64_t v37 = v25;
      uint64_t v38 = v43;
      sub_193653120(v37, v43, (uint64_t *)&unk_1EB4B2E60);
      LODWORD(v36) = __swift_getEnumTagSinglePayload(v38, 1, v36);
      swift_bridgeObjectRetain();
      if (v36 == 1)
      {
        sub_1936530CC(v38, (uint64_t *)&unk_1EB4B2E60);
        unint64_t v39 = 0;
      }
      else
      {
        unint64_t v39 = XPCObject.obj.getter();
        sub_19365317C(v38);
      }
      uint64_t v40 = sub_193668538();
      swift_bridgeObjectRelease();
      xpc_dictionary_set_value(empty, (const char *)(v40 + 32), v39);
      swift_unknownObjectRelease();
      uint64_t v25 = v50;
      sub_1936530CC(v50, (uint64_t *)&unk_1EB4B2E60);
      swift_release();
      sub_1936530CC((uint64_t)v20, &qword_1EB4B2E80);
      sub_19365317C(v32);
      v24 += v44;
      --v23;
      uint64_t v22 = v46;
    }
    while (v23);
  }
  swift_bridgeObjectRelease();
  return empty;
}

uint64_t sub_1936530CC(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_193653120(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_19365317C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for XPCObject();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t destroy for XPCObject(uint64_t *a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 1:
    case 10:
    case 11:
    case 12:
      uint64_t result = swift_unknownObjectRelease();
      break;
    case 7:
      uint64_t v3 = *a1;
      unint64_t v4 = a1[1];
      uint64_t result = sub_193665D08(v3, v4);
      break;
    case 8:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 9:
      uint64_t v5 = sub_1936683E8();
      uint64_t v6 = *(uint64_t (**)(uint64_t *, uint64_t))(*(void *)(v5 - 8) + 8);
      uint64_t result = v6(a1, v5);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1936532D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for XPCObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *XPCObject.obj.getter()
{
  uint64_t v1 = v0;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = sub_1936683E8();
  OUTLINED_FUNCTION_1_2();
  uint64_t v4 = v3;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_23();
  uint64_t v8 = v7 - v6;
  type metadata accessor for XPCObject();
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_23();
  uint64_t v12 = v11 - v10;
  sub_193653688(v1, v11 - v10);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 2u:
      xpc_object_t v14 = xpc_BOOL_create(*(unsigned char *)v12);
      goto LABEL_13;
    case 3u:
      xpc_object_t v14 = xpc_int64_create(*(void *)v12);
      goto LABEL_13;
    case 4u:
      xpc_object_t v14 = xpc_uint64_create(*(void *)v12);
      goto LABEL_13;
    case 5u:
      xpc_object_t v14 = xpc_double_create(*(double *)v12);
      goto LABEL_13;
    case 6u:
      xpc_object_t v14 = xpc_date_create(*(void *)v12);
      goto LABEL_13;
    case 7u:
      uint64_t v16 = *(void *)v12;
      unint64_t v15 = *(void *)(v12 + 8);
      switch(v15 >> 62)
      {
        case 1uLL:
          if (v16 >> 32 < (int)v16) {
            __break(1u);
          }
          swift_retain();
          uint64_t v13 = sub_193665C80((int)v16, v16 >> 32);
          sub_193665D08(v16, v15);
          break;
        case 2uLL:
          uint64_t v31 = *(void *)(v16 + 16);
          uint64_t v32 = *(void *)(v16 + 24);
          swift_retain();
          swift_retain();
          uint64_t v13 = sub_193665C80(v31, v32);
          swift_release();
          swift_release();
          break;
        case 3uLL:
          uint64_t v18 = 0;
          uint64_t v17 = 0;
          goto LABEL_19;
        default:
          uint64_t v17 = v15 & 0xFFFFFFFFFFFFFFLL;
          uint64_t v18 = *(void *)v12;
LABEL_19:
          uint64_t v13 = sub_193665BB4(v18, v17);
          break;
      }
      sub_193665D08(v16, v15);
      return v13;
    case 8u:
      uint64_t v19 = sub_193668538();
      swift_bridgeObjectRelease();
      uint64_t v13 = xpc_string_create((const char *)(v19 + 32));
      swift_release();
      return v13;
    case 9u:
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v8, v12, v2);
      uint64_t uuid = sub_1936683C8();
      char v34 = v20;
      char v35 = v21;
      char v36 = v22;
      char v37 = v23;
      char v38 = v24;
      char v39 = v25;
      char v40 = v26;
      char v41 = v27;
      uint64_t v13 = xpc_uuid_create((const unsigned __int8 *)&uuid);
      uint64_t v28 = OUTLINED_FUNCTION_35();
      v29(v28);
      return v13;
    case 0xDu:
      xpc_object_t v14 = xpc_null_create();
LABEL_13:
      uint64_t v13 = v14;
      break;
    default:
      uint64_t v13 = *(void **)v12;
      break;
  }
  return v13;
}

uint64_t sub_193653688(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for XPCObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for XPCObject()
{
  uint64_t result = qword_1EB4B2E70;
  if (!qword_1EB4B2E70) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t *initializeWithCopy for XPCObject(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
    case 0xAu:
    case 0xBu:
    case 0xCu:
      *a1 = *a2;
      swift_unknownObjectRetain();
      goto LABEL_7;
    case 7u:
      uint64_t v7 = *a2;
      unint64_t v6 = a2[1];
      sub_1936660CC(v7, v6);
      *a1 = v7;
      a1[1] = v6;
      goto LABEL_7;
    case 8u:
      uint64_t v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      swift_bridgeObjectRetain();
      goto LABEL_7;
    case 9u:
      uint64_t v9 = sub_1936683E8();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
LABEL_7:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

uint64_t RTCReportingSendMessageWithError(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, CFErrorRef *a5)
{
  if (!a1) {
    return 0;
  }
  uint64_t v10 = (void *)MEMORY[0x1996FFD40]();
  id v15 = 0;
  uint64_t v11 = [a1 sendMessageWithCategory:a2 type:a3 payload:a4 error:&v15];
  if (a5)
  {
    *a5 = 0;
    if (v15)
    {
      CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFIndex v13 = [v15 code];
      *a5 = CFErrorCreate(v12, @"RTCReportingErrorDomain", v13, (CFDictionaryRef)[v15 userInfo]);
    }
  }
  return v11;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_1_1(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186498](a1, a2, 7);
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

uint64_t OUTLINED_FUNCTION_6_0()
{
  uint64_t v2 = v0[26];
  uint64_t v3 = v0[27];
  uint64_t v4 = v0[28];
  uint64_t v5 = v0[29];
  return sub_1936482E8(v2, v3, v4, v5);
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return swift_dynamicCast();
}

void *OUTLINED_FUNCTION_23_1()
{
  uint64_t result = *(void **)(v0 - 272);
  *uint64_t result = *(void *)(v0 - 176);
  return result;
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

uint64_t OUTLINED_FUNCTION_28()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_28_0()
{
  return swift_dynamicCast();
}

void OUTLINED_FUNCTION_28_1(os_unfair_lock_s *a1@<X8>)
{
  os_unfair_lock_lock(a1 + 4);
}

uint64_t OUTLINED_FUNCTION_24_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_24_1()
{
  return v0;
}

void OUTLINED_FUNCTION_40(uint64_t a1@<X8>)
{
  *(void *)(a1 + 64) |= v1;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t OUTLINED_FUNCTION_7(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return __swift_storeEnumTagSinglePayload(v1, 0, 1, v0);
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  *uint64_t v0 = 0x8000000000000000;
  return v1;
}

uint64_t OUTLINED_FUNCTION_32_0()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_35()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return 0x64696C61766E693CLL;
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_22_1(float a1)
{
  float *v1 = a1;
  return swift_getErrorValue();
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_29()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  return sub_1936685F8();
}

uint64_t OUTLINED_FUNCTION_8()
{
  return MEMORY[0x1F4184938](v0, v1);
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return MEMORY[0x1F4184950](v0, v1);
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  __swift_storeEnumTagSinglePayload(v0, 0, 1, v1);
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_2_2(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return MEMORY[0x1F41867E8](v0, 2);
}

uint64_t OUTLINED_FUNCTION_10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41848C0](a1, a2, a3, v3, v4);
}

uint64_t OUTLINED_FUNCTION_17()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_17_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_storeEnumTagSinglePayload(a1, a2, a3, v3);
  return sub_19364C710(v4, v5);
}

uint64_t OUTLINED_FUNCTION_19()
{
  return v0;
}

uint64_t *OUTLINED_FUNCTION_19_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return &a9;
}

uint64_t OUTLINED_FUNCTION_12_0(void *a1)
{
  a1[2] = v2;
  a1[3] = v3;
  a1[4] = v2;
  a1[5] = v1;
  a1[6] = v4;
  return swift_retain_n();
}

void OUTLINED_FUNCTION_14()
{
  JUMPOUT(0x1997002F0);
}

uint64_t OUTLINED_FUNCTION_30(uint64_t a1, uint64_t a2)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t *OUTLINED_FUNCTION_44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return &a9;
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_37()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_37_0()
{
  return *(void *)(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_50()
{
  return *(void *)(v0 - 272);
}

uint64_t OUTLINED_FUNCTION_38()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t OUTLINED_FUNCTION_20_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return MEMORY[0x1F4186498](v0, 17, 7);
}

void OUTLINED_FUNCTION_27(void *a1@<X8>)
{
  *a1 = v1;
  a1[1] = 0xE700000000000000;
}

uint64_t OUTLINED_FUNCTION_27_0()
{
  return sub_19364F190();
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return type metadata accessor for EventValue();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t __RTCReportingStartConfiguration_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_26()
{
  return sub_1936684E8();
}

uint64_t OUTLINED_FUNCTION_26_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_36_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_25_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_25_1()
{
  return v0;
}

uint64_t sub_193654444()
{
  return sub_19365445C();
}

uint64_t sub_19365445C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_1936544A8(uint64_t a1)
{
  return sub_19364B774(a1, *(_xpc_connection_s **)(v1 + 16), *(void **)(v1 + 24), *(unsigned __int8 *)(v1 + 32), *(NSObject **)(v1 + 40));
}

uint64_t sub_1936544B8()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

uint64_t XPCConnection.sendWithReply(_:)(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 64) = a2;
  *(void *)(v3 + 24) = a1;
  *(void *)(v3 + 32) = v2;
  return MEMORY[0x1F4188298](sub_193649C74, 0, 0);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
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

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

RTCReporting *RTCReportingInitWithSessionInfoDict(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[RTCReporting initWithSessionInfo:userInfo:frameworksToCheck:aggregationBlock:]([RTCReporting alloc], "initWithSessionInfo:userInfo:frameworksToCheck:aggregationBlock:", a1, a2, a3);
}

uint64_t sub_193654610(uint64_t isStackAllocationSafe)
{
  uint64_t v2 = isStackAllocationSafe;
  v9[1] = *MEMORY[0x1E4F143B8];
  char v3 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v4 = (unint64_t)((1 << v3) + 63) >> 6;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1F4188790](isStackAllocationSafe);
    uint64_t v5 = (void *)((char *)v9 - ((8 * v4 + 15) & 0x3FFFFFFFFFFFFFF0));
    sub_193654AF0(0, v4, v5);
    uint64_t v6 = sub_19364B940(v5, v4, v2);
    if (v1) {
      swift_willThrow();
    }
    else {
      return v6;
    }
  }
  else
  {
    uint64_t v7 = (unint64_t *)swift_slowAlloc();
    sub_193654AF0(0, v4, v7);
    uint64_t v2 = sub_19364B940(v7, v4, v2);
    MEMORY[0x1997002F0](v7, -1, -1);
  }
  return v2;
}

uint64_t sub_193654774(unint64_t *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v42 = a1;
  uint64_t v7 = type metadata accessor for EventValue();
  uint64_t v45 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v7 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v44 = (char *)&v40 - v10;
  if (!a3) {
    return MEMORY[0x1E4FBC868];
  }
  if (a4[2] == a3)
  {
    swift_retain();
    return (uint64_t)a4;
  }
  uint64_t v43 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2A10);
  uint64_t result = sub_193668838();
  uint64_t v12 = result;
  uint64_t v41 = a2;
  if (a2 < 1) {
    unint64_t v13 = 0;
  }
  else {
    unint64_t v13 = *v42;
  }
  uint64_t v14 = 0;
  uint64_t v15 = result + 64;
  uint64_t v16 = v43;
  uint64_t v17 = (uint64_t)v44;
  while (1)
  {
    if (v13)
    {
      unint64_t v18 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      uint64_t v46 = v14;
      unint64_t v19 = v18 | (v14 << 6);
    }
    else
    {
      uint64_t v20 = v14 + 1;
      if (__OFADD__(v14, 1)) {
        goto LABEL_40;
      }
      if (v20 >= v41) {
        return v12;
      }
      unint64_t v21 = v42[v20];
      uint64_t v22 = v14 + 1;
      if (!v21)
      {
        uint64_t v22 = v14 + 2;
        if (v14 + 2 >= v41) {
          return v12;
        }
        unint64_t v21 = v42[v22];
        if (!v21)
        {
          uint64_t v22 = v14 + 3;
          if (v14 + 3 >= v41) {
            return v12;
          }
          unint64_t v21 = v42[v22];
          if (!v21)
          {
            uint64_t v23 = v14 + 4;
            if (v14 + 4 >= v41) {
              return v12;
            }
            unint64_t v21 = v42[v23];
            if (!v21)
            {
              while (1)
              {
                uint64_t v22 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_41;
                }
                if (v22 >= v41) {
                  return v12;
                }
                unint64_t v21 = v42[v22];
                ++v23;
                if (v21) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v22 = v14 + 4;
          }
        }
      }
LABEL_24:
      unint64_t v13 = (v21 - 1) & v21;
      uint64_t v46 = v22;
      unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
    }
    uint64_t v24 = a4[7];
    char v25 = a4;
    char v26 = (uint64_t *)(a4[6] + 16 * v19);
    uint64_t v27 = *v26;
    uint64_t v28 = v26[1];
    uint64_t v29 = *(void *)(v45 + 72);
    sub_193652B74(v24 + v29 * v19, v17);
    sub_193652D08(v17, v16);
    sub_193668958();
    swift_bridgeObjectRetain();
    sub_193668548();
    uint64_t result = sub_193668988();
    uint64_t v30 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v31 = result & ~v30;
    unint64_t v32 = v31 >> 6;
    if (((-1 << v31) & ~*(void *)(v15 + 8 * (v31 >> 6))) == 0) {
      break;
    }
    unint64_t v33 = __clz(__rbit64((-1 << v31) & ~*(void *)(v15 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
    uint64_t v16 = v43;
LABEL_34:
    *(void *)(v15 + ((v33 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v33;
    char v38 = (void *)(*(void *)(v12 + 48) + 16 * v33);
    *char v38 = v27;
    v38[1] = v28;
    uint64_t result = sub_193652D08(v16, *(void *)(v12 + 56) + v33 * v29);
    ++*(void *)(v12 + 16);
    if (__OFSUB__(a3--, 1)) {
      goto LABEL_39;
    }
    a4 = v25;
    uint64_t v14 = v46;
    if (!a3) {
      return v12;
    }
  }
  char v34 = 0;
  unint64_t v35 = (unint64_t)(63 - v30) >> 6;
  uint64_t v16 = v43;
  while (++v32 != v35 || (v34 & 1) == 0)
  {
    BOOL v36 = v32 == v35;
    if (v32 == v35) {
      unint64_t v32 = 0;
    }
    v34 |= v36;
    uint64_t v37 = *(void *)(v15 + 8 * v32);
    if (v37 != -1)
    {
      unint64_t v33 = __clz(__rbit64(~v37)) + (v32 << 6);
      goto LABEL_34;
    }
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_193654AF0(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

void sub_193654B10(uint64_t a1)
{
  sub_193654B18(a1, *(void *)(v1 + 16));
}

void sub_193654B18(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_193668588();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t sub_193654B88(uint64_t a1)
{
  return a1;
}

uint64_t sub_193654BB0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_193654BEC(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_193654BFC(uint64_t a1, void (*a2)(uint64_t *__return_ptr))
{
  a2(&var1);
  if (!v2) {
    char v3 = var1;
  }
  return v3 & 1;
}

uint64_t sub_193654C38@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_193654C54(a1, *(void (**)(uint64_t *__return_ptr))(v2 + 16), a2);
}

uint64_t sub_193654C54@<X0>(uint64_t a1@<X0>, void (*a2)(uint64_t *__return_ptr)@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_193654BFC(a1, a2);
  if (!v3) {
    *a3 = result & 1;
  }
  return result;
}

void *sub_193654C84(uint64_t a1, void *(*a2)(uint64_t *__return_ptr))
{
  uint64_t result = a2(&v4);
  if (!v2) {
    return (void *)v4;
  }
  return result;
}

void *sub_193654CC4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_193654CE0(a1, *(void *(**)(uint64_t *__return_ptr))(v2 + 16), a2);
}

void *sub_193654CE0@<X0>(uint64_t a1@<X0>, void *(*a2)(uint64_t *__return_ptr)@<X1>, void *a3@<X8>)
{
  uint64_t result = sub_193654C84(a1, a2);
  if (!v3)
  {
    *a3 = result;
    a3[1] = v6;
  }
  return result;
}

uint64_t Session.__deallocating_deinit()
{
  Session.deinit();
  return MEMORY[0x1F4188210](v0);
}

void sub_193654D38()
{
}

uint64_t type metadata accessor for Session()
{
  uint64_t result = qword_1EB4B2F00;
  if (!qword_1EB4B2F00) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_193654D9C()
{
  unint64_t result = qword_1EB4B2D90;
  if (!qword_1EB4B2D90)
  {
    type metadata accessor for Session();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB4B2D90);
  }
  return result;
}

uint64_t sub_193654DEC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_19364C7E8;
  return sub_193647E44(a1, v4, v5, v6, v7);
}

uint64_t sub_193654EB4()
{
  OUTLINED_FUNCTION_10_0();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_4_0();
  uint64_t *v4 = v3;
  uint64_t *v4 = *v1;
  *(void *)(v3 + 208) = v0;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v2 + 64);
  if (v0) {
    uint64_t v6 = sub_19365AE00;
  }
  else {
    uint64_t v6 = sub_19364AA6C;
  }
  return MEMORY[0x1F4188298](v6, v5, 0);
}

uint64_t sub_193654FD8()
{
  *(unsigned char *)(*(void *)(v0 + 56) + 320) = 2;
  OUTLINED_FUNCTION_8_0();
  return v1();
}

uint64_t sub_193654FFC()
{
  *(void *)(v1 + 56) = v0;
  return MEMORY[0x1F4188298](sub_19364A1D8, v0, 0);
}

void Session.unownedExecutor.getter()
{
}

uint64_t sub_193655024(uint64_t a1)
{
  *(void *)(v1 + 312) = a1;
  return swift_release();
}

BOOL sub_193655034()
{
  return *(unsigned char *)(v0 + 320) == 0;
}

void Event.category.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  sub_193649960((uint64_t)&qword_1EB4B2DB8, (uint64_t)&unk_1EB4B2DB0, (uint64_t)&qword_1EB4B2DA8, (uint64_t)sub_193658D64, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20);
}

uint64_t sub_193655070(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      uint64_t result = 19795;
      break;
    case 1:
      uint64_t result = 20035;
      break;
    case 2:
      uint64_t result = 5521742;
      break;
    case 3:
      uint64_t result = 20308;
      break;
    case 4:
      uint64_t result = 21330;
      break;
    case 5:
      uint64_t result = 19271;
      break;
    case 6:
      uint64_t result = 19779;
      break;
    case 7:
      uint64_t result = 17238;
      break;
    case 8:
      uint64_t result = 22100;
      break;
    case 9:
      uint64_t result = 21065;
      break;
    case 10:
      uint64_t result = 18259;
      break;
    case 11:
      uint64_t result = 21580;
      break;
    case 12:
      uint64_t result = 1096307535;
      break;
    case 13:
      uint64_t result = 0x4D41434B48;
      break;
    case 14:
      uint64_t result = 0x534C482D4D43;
      break;
    case 15:
      uint64_t result = 0x53424152432D4D43;
      break;
    case 16:
      uint64_t result = 0x53425550564544;
      break;
    case 17:
      uint64_t result = 0x534F45444956;
      break;
    case 18:
      uint64_t result = 0x54455353414C424DLL;
      break;
    case 19:
      uint64_t result = 16707;
      break;
    case 20:
      uint64_t result = 4282189;
      break;
    case 21:
      uint64_t result = 16979;
      break;
    case 22:
      uint64_t result = 20545;
      break;
    case 23:
      uint64_t result = 19282;
      break;
    case 24:
      uint64_t result = 1280332353;
      break;
    case 25:
      unsigned __int16 v2 = 17481;
      goto LABEL_43;
    case 26:
      uint64_t result = 1196577875;
      break;
    case 27:
      uint64_t result = 21844;
      break;
    case 28:
      uint64_t result = 22350;
      break;
    case 29:
      uint64_t result = 18755;
      break;
    case 30:
      uint64_t result = 1413566532;
      break;
    case 31:
      uint64_t result = 5524567;
      break;
    case 32:
      uint64_t result = 21074;
      break;
    case 33:
      uint64_t result = 5264215;
      break;
    case 34:
      uint64_t result = 1279611464;
      break;
    case 35:
      uint64_t result = 0x6C6F6F74637472;
      break;
    case 36:
      uint64_t result = 0x4C444F2D4D43;
      break;
    case 37:
      uint64_t result = 16708;
      break;
    case 38:
      uint64_t result = 4473923;
      break;
    case 39:
      unsigned __int16 v2 = 21582;
LABEL_43:
      uint64_t result = v2 | 0x530000u;
      break;
    case 40:
      uint64_t result = 5657156;
      break;
    case 41:
      uint64_t result = 4407892;
      break;
    case 42:
      uint64_t result = 5850443;
      break;
    case 43:
      uint64_t result = 5457744;
      break;
    case 44:
      uint64_t result = 5390926;
      break;
    case 45:
      uint64_t result = 5723214;
      break;
    case 46:
      uint64_t result = 0x4C4D2D4D43;
      break;
    case 47:
      uint64_t result = 1263685463;
      break;
    case 48:
      uint64_t result = 1161973583;
      break;
    case 49:
      uint64_t result = 5263171;
      break;
    case 50:
      uint64_t result = 21062;
      break;
    case 51:
      uint64_t result = 4932429;
      break;
    case 52:
      uint64_t result = 5394497;
      break;
    case 53:
      uint64_t result = 0x46502D4D43;
      break;
    case 54:
      uint64_t result = 0x5041432D4D43;
      break;
    case 55:
      uint64_t result = 0x322D544C57;
      break;
    case 56:
      uint64_t result = 1280329811;
      break;
    case 57:
      uint64_t result = 5522771;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t sub_193655438()
{
  int v1 = *(unsigned __int8 *)(v0 + 40);
  if (v1 == 2)
  {
    char v2 = sub_19365D580();
    *(unsigned char *)(v0 + 40) = v2 & 1;
  }
  else
  {
    char v2 = v1 & 1;
  }
  return v2 & 1;
}

uint64_t sub_1936554A4@<X0>(uint64_t *a1@<X8>)
{
  return sub_1936554C0(v1, a1);
}

uint64_t sub_1936554C0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    goto LABEL_4;
  }
  uint64_t v5 = *(void **)(a1 + 16);
  type metadata accessor for XPCConnection();
  swift_allocObject();
  *(void *)(a1 + 24) = XPCConnection.init(machService:targetQ:listen:delegate:)(0xD000000000000017, 0x800000019366A410, v5, 0, 0, 0);
  uint64_t result = swift_release();
  uint64_t v6 = *(void *)(a1 + 24);
  if (!v6) {
    goto LABEL_5;
  }
  swift_beginAccess();
  *(void *)(v6 + 32) = &off_1EE452FA8;
  swift_unknownObjectWeakAssign();
  uint64_t result = *(void *)(a1 + 24);
  if (result)
  {
LABEL_4:
    *a2 = result;
    return swift_retain();
  }
  else
  {
LABEL_5:
    __break(1u);
  }
  return result;
}

uint64_t sub_1936555B0()
{
  OUTLINED_FUNCTION_10_0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_2(v0);
  void *v1 = v2;
  v1[1] = sub_193654440;
  return sub_193655658();
}

uint64_t sub_193655658()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_193654440;
  return sub_193654FFC();
}

void sub_1936556E8()
{
  sub_193649D8C(*(void *)(v0 + 16));
}

uint64_t sub_19365572C@<X0>(void *a1@<X8>)
{
  return sub_193655748(*(void *)(v1 + 16), a1);
}

uint64_t sub_193655748@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = (uint64_t *)(a1 + OBJC_IVAR____RTCReportingS_generatedSessionID);
  unint64_t v3 = *(void *)(a1 + OBJC_IVAR____RTCReportingS_generatedSessionID + 8);
  if (v3)
  {
    uint64_t v4 = *v2;
    unint64_t v5 = v3;
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0xE000000000000000;
  }
  *a2 = v4;
  a2[1] = v5;
  return swift_bridgeObjectRetain();
}

Swift::String __swiftcall _RTCReportingS.getReportingSessionID()()
{
  sub_193647BE0((uint64_t)sub_19365572C, (uint64_t)&v4, *(os_unfair_lock_s **)(v0 + OBJC_IVAR____RTCReportingS_lock));
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t sub_1936557E0()
{
  uint64_t v1 = (unsigned char *)OUTLINED_FUNCTION_37_0();
  return sub_19364A3CC(v1, v2, v3, v4, *(unsigned char *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72));
}

uint64_t sub_193655808()
{
  OUTLINED_FUNCTION_29_0();
  uint64_t v1 = *(void *)(v0 + 344);
  *(void *)(v0 + 360) = *(void *)(v1 + 176);
  *(void *)(v0 + 368) = *(void *)(v1 + 184);
  swift_bridgeObjectRetain();
  *(unsigned char *)(v0 + 378) = sub_193655034();
  OUTLINED_FUNCTION_42();
  return MEMORY[0x1F4188298](v2, v3, v4);
}

uint64_t sub_193655884()
{
  OUTLINED_FUNCTION_29_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_1();
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3_0();
  *unint64_t v5 = v4;
  *(void *)(v6 + 344) = v3;
  *(void *)(v6 + 352) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v7 = sub_19365ED1C;
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v7 = sub_193655808;
    uint64_t v8 = v3;
  }
  return MEMORY[0x1F4188298](v7, v8, 0);
}

uint64_t sub_193655974()
{
  OUTLINED_FUNCTION_27_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_2(v0);
  void *v1 = v2;
  v1[1] = sub_193654440;
  OUTLINED_FUNCTION_10_1();
  return sub_193655A6C(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_193655A6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 224) = v16;
  *(void *)(v8 + 232) = v17;
  *(_OWORD *)(v8 + 208) = v15;
  *(void *)(v8 + 192) = a8;
  *(void *)(v8 + 200) = v14;
  *(void *)(v8 + 176) = a6;
  *(void *)(v8 + 184) = a7;
  *(void *)(v8 + 160) = a4;
  *(void *)(v8 + 168) = a5;
  *(_WORD *)(v8 + 114) = *(_WORD *)v14;
  *(_DWORD *)(v8 + 116) = *(_DWORD *)(v14 + 4);
  long long v9 = *(_OWORD *)(v14 + 24);
  *(_OWORD *)(v8 + 240) = *(_OWORD *)(v14 + 8);
  *(_OWORD *)(v8 + 256) = v9;
  long long v10 = *(_OWORD *)(v14 + 56);
  *(_OWORD *)(v8 + 272) = *(_OWORD *)(v14 + 40);
  *(_OWORD *)(v8 + 288) = v10;
  uint64_t v11 = *(void *)(v14 + 72);
  *(unsigned char *)(v8 + 113) = *(unsigned char *)(v14 + 80);
  *(unsigned char *)(v8 + 376) = *(unsigned char *)(v14 + 81);
  uint64_t v12 = *(void *)(v14 + 88);
  *(void *)(v8 + 304) = v11;
  *(void *)(v8 + 312) = v12;
  *(unsigned char *)(v8 + 377) = *(unsigned char *)(v14 + 96);
  return MEMORY[0x1F4188298](sub_1936491C0, 0, 0);
}

void sub_193655AF8()
{
  uint64_t v0 = OUTLINED_FUNCTION_37_0();
  sub_19364F2FC(v0, v1, v2, v3);
}

void sub_193655B14(char *a1@<X8>)
{
}

void sub_193655B30()
{
}

uint64_t sub_193655B4C()
{
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v3 = v2;
  *(void *)(v4 + 88) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_42();
    return MEMORY[0x1F4188298](v5, v6, v7);
  }
  else
  {
    OUTLINED_FUNCTION_8_0();
    return v8();
  }
}

uint64_t sub_193655C48(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v5 = *(void *)(v1 + 32);
  uint64_t v6 = *(void *)(v1 + 40);
  char v7 = *(unsigned char *)(v1 + 48);
  uint64_t v8 = *(void *)(v1 + 56);
  uint64_t v9 = swift_task_alloc();
  uint64_t v10 = (void *)OUTLINED_FUNCTION_2_2(v9);
  *uint64_t v10 = v11;
  v10[1] = sub_19364C7E8;
  return sub_193655D1C(a1, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_193655D1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  *(void *)(v7 + 72) = a7;
  *(void *)(v7 + 40) = a5;
  *(unsigned char *)(v7 + 48) = a6;
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v7 + 80) = v8;
  void *v8 = v7;
  v8[1] = sub_193655B4C;
  return sub_19364B1E8();
}

uint64_t sub_193655DC0()
{
  uint64_t v0 = OUTLINED_FUNCTION_37_0();
  return sub_19364E118(v0, v1, v2, v3);
}

void sub_193655DDC(void *a1@<X8>)
{
  *a1 = qword_1E93282E0;
}

void *MessageKeys.sessionID.unsafeMutableAddressor()
{
  return &static MessageKeys.sessionID;
}

void *MessageKeys.realtime.unsafeMutableAddressor()
{
  return &static MessageKeys.realtime;
}

void *MessageKeys.payload.unsafeMutableAddressor()
{
  return &static MessageKeys.payload;
}

const char *MessageKeys.allowed.unsafeMutableAddressor()
{
  return "allowed";
}

const char *MessageKeys.denied.unsafeMutableAddressor()
{
  return "denied";
}

const char *MessageKeys.hierarchyToken.unsafeMutableAddressor()
{
  return "hktn";
}

const char *MessageKeys.hierarchyLevel.unsafeMutableAddressor()
{
  return "hlvl";
}

void *MessageKeys.legacyClient.unsafeMutableAddressor()
{
  return &static MessageKeys.legacyClient;
}

void *MessageKeys.serviceName.unsafeMutableAddressor()
{
  return &static MessageKeys.serviceName;
}

void *MessageKeys.clientType.unsafeMutableAddressor()
{
  return &static MessageKeys.clientType;
}

const char *MessageKeys.clientName.unsafeMutableAddressor()
{
  return "cn";
}

void sub_1936568C8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 216), 8);
  _Unwind_Resume(a1);
}

void __createAWDAdaptorInstance_block_invoke(uint64_t a1)
{
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F28B50]) initWithPath:@"/System/Library/PrivateFrameworks/AVConference.framework/Frameworks/GKSPerformance.framework"];
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_193646000, v4, OS_LOG_TYPE_DEFAULT, "loading AWDAdaptor bundle", v6, 2u);
    }
    if (([v3 isLoaded] & 1) == 0) {
      [v3 load];
    }
    createAWDAdaptorInstance_awdAdaptorClass = [v3 classNamed:@"AWDAdaptor"];
  }
  else
  {
    createAWDAdaptorInstance_awdAdaptorClass = 0;
    uint64_t v5 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __createAWDAdaptorInstance_block_invoke_cold_1(v5);
    }
  }
}

uint64_t __RTCReportingInitWithSessionInfoDict_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t RTCReportingInitWithSessionInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = [RTCReporting alloc];
  return (uint64_t)[(RTCReporting *)v6 initWithSessionInfo:a1 userInfo:a2 frameworksToCheck:a3 aggregationBlock:0];
}

void *RTCReportingFetchStatesWithUserInfo(void *result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __RTCReportingFetchStatesWithUserInfo_block_invoke;
    v3[3] = &unk_1E576F530;
    v3[4] = a3;
    return (void *)[result fetchReportingStatesWithUserInfo:a2 fetchComplete:v3];
  }
  return result;
}

uint64_t __RTCReportingFetchStatesWithUserInfo_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __RTCReportingSetMessageBlock_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id RTCReportingCreateHierarchyTokenFromParentToken(uint64_t a1)
{
  return +[RTCReporting newSecureHierarchyTokenFromParentToken:a1];
}

void *RTCReportingUpdateSharedDataWithDictionary(void *a1, const char *a2)
{
  if (a1) {
    return (void *)[a1 updateSharedDataWithDictionary:a2];
  }
  return a1;
}

void *RTCReportingUpdateSharedDataForKey(void *a1, const char *a2, uint64_t a3)
{
  if (a1) {
    return (void *)[a1 updateSharedDataForKey:a2 value:a3];
  }
  return a1;
}

uint64_t RTCReportingSendMessageWithDictionary(void *a1, uint64_t a2, CFErrorRef *a3)
{
  if (!a1) {
    return 0;
  }
  uint64_t v6 = (void *)MEMORY[0x1996FFD40]();
  id v11 = 0;
  uint64_t v7 = [a1 sendMessageWithDictionary:a2 error:&v11];
  if (a3)
  {
    *a3 = 0;
    if (v11)
    {
      CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFIndex v9 = [v11 code];
      *a3 = CFErrorCreate(v8, @"RTCReportingErrorDomain", v9, (CFDictionaryRef)[v11 userInfo]);
    }
  }
  return v7;
}

uint64_t RTCReportingSendOneMessageWithDictionary(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, CFErrorRef *a6)
{
  uint64_t v12 = (void *)MEMORY[0x1996FFD40]();
  id v17 = 0;
  uint64_t v13 = +[RTCReporting sendOneMessageWithSessionInfo:a1 userInfo:a2 category:a3 type:a4 payload:a5 error:&v17];
  if (a6)
  {
    *a6 = 0;
    if (v17)
    {
      CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFIndex v15 = [v17 code];
      *a6 = CFErrorCreate(v14, @"RTCReportingErrorDomain", v15, (CFDictionaryRef)[v17 userInfo]);
    }
  }
  return v13;
}

uint64_t RTCReportingCreateEphemeralSessionWithSessionInfo(uint64_t a1, uint64_t a2, CFErrorRef *a3)
{
  uint64_t v6 = (void *)MEMORY[0x1996FFD40]();
  id v11 = 0;
  uint64_t v7 = objc_msgSend((id)+[RTCReporting createEphemeralSessionWithSessionInfo:userInfo:error:](RTCReporting, "createEphemeralSessionWithSessionInfo:userInfo:error:", a1, a2, &v11), "copy");
  if (a3)
  {
    *a3 = 0;
    if (v11)
    {
      CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFIndex v9 = [v11 code];
      *a3 = CFErrorCreate(v8, @"RTCReportingErrorDomain", v9, (CFDictionaryRef)[v11 userInfo]);
    }
  }
  return v7;
}

uint64_t RTCReportingCloseEphemeralSessionWithSessionId(uint64_t a1)
{
  return +[RTCReporting closeEphemeralSessiontWithSessionId:a1];
}

void *RTCReportingFlushMessages(void *a1, const char *a2)
{
  if (a1) {
    return (void *)[a1 flushMessages];
  }
  return a1;
}

void *RTCReportingFlushMessagesWithCompletion(void *result, uint64_t a2)
{
  if (result)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __RTCReportingFlushMessagesWithCompletion_block_invoke;
    v2[3] = &unk_1E576F580;
    v2[4] = a2;
    return (void *)[result flushMessagesWithCompletion:v2];
  }
  return result;
}

uint64_t __RTCReportingFlushMessagesWithCompletion_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void *RTCReportingUploadLogWithArray(void *a1, const char *a2)
{
  if (a1) {
    return (void *)[a1 uploadDataArray:a2 completionHandler:0];
  }
  return a1;
}

uint64_t EventValue.init(integerLiteral:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_193657E58(a1, a2);
}

uint64_t EventValue.init(floatLiteral:)@<X0>(double *a1@<X8>, double a2@<D0>)
{
  *a1 = a2;
  type metadata accessor for EventValue();
  OUTLINED_FUNCTION_38();
  return swift_storeEnumTagMultiPayload();
}

uint64_t EventValue.init(arrayLiteral:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_193657E58(a1, a2);
}

uint64_t sub_193657E58@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = a1;
  type metadata accessor for EventValue();
  OUTLINED_FUNCTION_37();
  return swift_storeEnumTagMultiPayload();
}

uint64_t EventValue.init(dictionaryLiteral:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  *a2 = sub_193657EE8(a1);
  type metadata accessor for EventValue();
  OUTLINED_FUNCTION_38();
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_193657EE8(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2A10);
    uint64_t v1 = sub_193668838();
  }
  else
  {
    uint64_t v1 = MEMORY[0x1E4FBC868];
  }
  uint64_t v4 = v1;
  uint64_t v2 = swift_bridgeObjectRetain();
  sub_193659650(v2, 1, &v4);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t _s12RTCReporting10EventValueO13stringLiteralACSS_tcfC_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = a1;
  a3[1] = a2;
  type metadata accessor for EventValue();
  OUTLINED_FUNCTION_38();
  return swift_storeEnumTagMultiPayload();
}

void EventValue.init<A>(_:)()
{
  OUTLINED_FUNCTION_12();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v64 = v5;
  int64_t v59 = *(void *)(*(void *)(*(void *)(v6 + 8) + 24) + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v7);
  uint64_t v58 = (char *)&v54 - v8;
  OUTLINED_FUNCTION_0_0();
  uint64_t v10 = v9;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_6();
  uint64_t v57 = v12 - v13;
  OUTLINED_FUNCTION_21();
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_32();
  uint64_t v60 = v15;
  OUTLINED_FUNCTION_21();
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_32();
  uint64_t v62 = v17;
  OUTLINED_FUNCTION_21();
  uint64_t v19 = MEMORY[0x1F4188790](v18);
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_32();
  uint64_t v61 = v20;
  OUTLINED_FUNCTION_21();
  uint64_t v22 = MEMORY[0x1F4188790](v21);
  uint64_t v24 = (char *)&v54 - v23;
  uint64_t v25 = MEMORY[0x1F4188790](v22);
  uint64_t v27 = (char *)&v54 - v26;
  MEMORY[0x1F4188790](v25);
  OUTLINED_FUNCTION_20();
  uint64_t v28 = *(void (**)(void))(v10 + 16);
  uint64_t v63 = v4;
  ((void (*)(uint64_t, uint64_t, uint64_t))v28)(v0, v4, v2);
  LOBYTE(v4) = OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4();
  v28();
  uint64_t v65 = v10;
  if ((v4 & 1) == 0)
  {
    unint64_t v31 = *(void (**)(void))(v10 + 8);
    char v34 = v27;
    uint64_t v35 = v2;
    goto LABEL_7;
  }
  uint64_t v29 = OUTLINED_FUNCTION_9();
  uint64_t v30 = v10 + 8;
  unint64_t v31 = *(void (**)(void))(v10 + 8);
  uint64_t v32 = v30;
  OUTLINED_FUNCTION_5();
  v31();
  if (v29 <= 64) {
    goto LABEL_8;
  }
  OUTLINED_FUNCTION_4();
  v28();
  int64_t v67 = 0x8000000000000000;
  if (OUTLINED_FUNCTION_2_0())
  {
    if (OUTLINED_FUNCTION_9() < 64)
    {
      uint64_t v33 = OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_3();
      v31();
      goto LABEL_29;
    }
    unint64_t v48 = sub_1936585F4();
    uint64_t v49 = MEMORY[0x1E4FBC1C8];
    uint64_t v55 = v32;
LABEL_24:
    OUTLINED_FUNCTION_10((uint64_t)&v67, v49, v48);
    char v50 = OUTLINED_FUNCTION_26();
    uint64_t v51 = OUTLINED_FUNCTION_19();
    ((void (*)(uint64_t))v31)(v51);
    OUTLINED_FUNCTION_3();
    v31();
    if (v50) {
      goto LABEL_36;
    }
LABEL_8:
    uint64_t v36 = OUTLINED_FUNCTION_9();
    OUTLINED_FUNCTION_4();
    v28();
    if (v36 < 65)
    {
      uint64_t v37 = OUTLINED_FUNCTION_9();
      OUTLINED_FUNCTION_5();
      v31();
      if (v37 != 64 || (OUTLINED_FUNCTION_2_0() & 1) != 0) {
        goto LABEL_19;
      }
    }
    else
    {
      OUTLINED_FUNCTION_5();
      v31();
    }
    uint64_t v38 = v62;
    OUTLINED_FUNCTION_4();
    v28();
    int64_t v67 = 0x7FFFFFFFFFFFFFFFLL;
    char v39 = OUTLINED_FUNCTION_2_0();
    uint64_t v40 = v38;
    uint64_t v41 = OUTLINED_FUNCTION_9();
    if (v39)
    {
      if (v41 > 64)
      {
        unint64_t v42 = sub_1936585F4();
        OUTLINED_FUNCTION_10((uint64_t)&v67, MEMORY[0x1E4FBC1C8], v42);
        OUTLINED_FUNCTION_25();
        char v43 = sub_1936684E8();
        OUTLINED_FUNCTION_3();
        v31();
LABEL_18:
        OUTLINED_FUNCTION_3();
        v31();
        if ((v43 & 1) == 0) {
          goto LABEL_19;
        }
        __break(1u);
        goto LABEL_35;
      }
    }
    else if (v41 > 63)
    {
      uint64_t v66 = 0x7FFFFFFFFFFFFFFFLL;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v65 + 32))(v61, v38, v2);
      unint64_t v44 = sub_1936585F4();
      OUTLINED_FUNCTION_10((uint64_t)&v66, MEMORY[0x1E4FBC1C8], v44);
      OUTLINED_FUNCTION_25();
      char v43 = sub_1936684E8();
      OUTLINED_FUNCTION_3();
      v31();
      goto LABEL_18;
    }
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_5();
    v31();
LABEL_19:
    uint64_t v45 = OUTLINED_FUNCTION_8();
    ((void (*)(uint64_t, uint64_t))v31)(v0, v2);
    ((void (*)(uint64_t, uint64_t))v31)(v63, v2);
    *uint64_t v64 = v45;
    type metadata accessor for EventValue();
    OUTLINED_FUNCTION_37();
    swift_storeEnumTagMultiPayload();
    OUTLINED_FUNCTION_11();
    return;
  }
  uint64_t v55 = v32;
  char v46 = OUTLINED_FUNCTION_2_0();
  uint64_t v47 = OUTLINED_FUNCTION_9();
  if ((v46 & 1) == 0)
  {
    if (v47 < 64)
    {
      uint64_t v33 = OUTLINED_FUNCTION_8();
      ((void (*)(char *, uint64_t))v31)(v24, v2);
LABEL_29:
      if (v33 < v67) {
        goto LABEL_36;
      }
      goto LABEL_8;
    }
    char v34 = v24;
    uint64_t v35 = v2;
LABEL_7:
    ((void (*)(char *, uint64_t))v31)(v34, v35);
    goto LABEL_8;
  }
  if (v47 > 64)
  {
    unint64_t v48 = sub_1936585F4();
    uint64_t v49 = MEMORY[0x1E4FBC1C8];
    goto LABEL_24;
  }
  swift_getAssociatedConformanceWitness();
  sub_193668898();
  sub_193668858();
  LODWORD(v59) = OUTLINED_FUNCTION_26();
  uint64_t v52 = OUTLINED_FUNCTION_19();
  ((void (*)(uint64_t))v31)(v52);
  uint64_t v40 = v57;
  (*(void (**)(uint64_t, char *, uint64_t))(v65 + 32))(v57, v24, v2);
  if ((v59 & 1) == 0)
  {
    int64_t v59 = v67;
    uint64_t v53 = OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_3();
    v31();
    if (v53 < v59) {
      goto LABEL_36;
    }
    goto LABEL_8;
  }
LABEL_35:
  ((void (*)(uint64_t, uint64_t))v31)(v40, v2);
LABEL_36:
  __break(1u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  void (*v22)(uint64_t, uint64_t, uint64_t);
  char v23;
  char v24;
  void (*v25)(void);
  char v26;
  uint64_t v27;
  void (*v28)(void);
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t, uint64_t);
  uint64_t *v37;
  uint64_t v38;
  char *v39;
  uint64_t AssociatedTypeWitness;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  OUTLINED_FUNCTION_12();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v41 = *(void *)(*(void *)(*(void *)(v7 + 8) + 24) + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v8);
  char v39 = (char *)&v35 - v9;
  OUTLINED_FUNCTION_0_0();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_6();
  uint64_t v15 = v13 - v14;
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_32();
  char v43 = v17;
  OUTLINED_FUNCTION_21();
  uint64_t v19 = MEMORY[0x1F4188790](v18);
  uint64_t v21 = (char *)&v35 - v20;
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_20();
  uint64_t v22 = (void (*)(uint64_t, uint64_t, uint64_t))v11[2];
  unint64_t v42 = v4;
  v22(v0, v4, v2);
  uint64_t v23 = OUTLINED_FUNCTION_2_0();
  uint64_t v38 = v15;
  if (v23)
  {
    uint64_t v37 = v11;
    swift_getAssociatedConformanceWitness();
    sub_193668898();
    uint64_t v11 = v37;
    sub_193668858();
    OUTLINED_FUNCTION_25();
    uint64_t v24 = sub_1936684F8();
    OUTLINED_FUNCTION_5();
    v25();
    if ((v24 & 1) == 0) {
      goto LABEL_16;
    }
  }
  if (OUTLINED_FUNCTION_9() < 64)
  {
LABEL_14:
    uint64_t v33 = OUTLINED_FUNCTION_8();
    char v34 = (void (*)(uint64_t, uint64_t))v11[1];
    v34(v0, v2);
    v34(v42, v2);
    void *v6 = v33;
    type metadata accessor for EventValue();
    swift_storeEnumTagMultiPayload();
    OUTLINED_FUNCTION_11();
    return;
  }
  uint64_t v37 = v6;
  v22(v43, v0, v2);
  unint64_t v44 = -1;
  uint64_t v26 = OUTLINED_FUNCTION_2_0();
  uint64_t v27 = OUTLINED_FUNCTION_9();
  if ((v26 & 1) == 0)
  {
    if (v27 < 65)
    {
      OUTLINED_FUNCTION_8();
      uint64_t v28 = (void (*)(void))v11[1];
      goto LABEL_13;
    }
LABEL_10:
    unint64_t v31 = sub_193658AE8();
    OUTLINED_FUNCTION_10((uint64_t)&v44, MEMORY[0x1E4FBC538], v31);
    OUTLINED_FUNCTION_25();
    uint64_t v32 = sub_1936684E8();
    uint64_t v28 = (void (*)(void))v11[1];
    ((void (*)(char *, uint64_t))v28)(v21, v2);
    if (v32) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  if (v27 > 64) {
    goto LABEL_10;
  }
  OUTLINED_FUNCTION_28();
  swift_getAssociatedConformanceWitness();
  uint64_t v36 = v22;
  sub_193668898();
  sub_193668858();
  OUTLINED_FUNCTION_25();
  LODWORD(v41) = sub_1936684D8();
  uint64_t v28 = (void (*)(void))v11[1];
  OUTLINED_FUNCTION_18();
  v28();
  uint64_t v29 = v44;
  v36(v38, v43, v2);
  if ((v41 & 1) == 0)
  {
    OUTLINED_FUNCTION_18();
    v28();
    goto LABEL_13;
  }
  uint64_t v30 = OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_18();
  v28();
  if (v29 >= v30)
  {
LABEL_13:
    ((void (*)(uint64_t, uint64_t))v28)(v43, v2);
    uint64_t v6 = v37;
    goto LABEL_14;
  }
LABEL_16:
  OUTLINED_FUNCTION_36();
  sub_193668808();
  __break(1u);
}

unint64_t sub_1936585F4()
{
  unint64_t result = qword_1E9328130;
  if (!qword_1E9328130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9328130);
  }
  return result;
}

unint64_t sub_193658AE8()
{
  unint64_t result = qword_1E9328138;
  if (!qword_1E9328138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9328138);
  }
  return result;
}

uint64_t EventValue.init<A>(_:)()
{
  OUTLINED_FUNCTION_22();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_23();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v8 - v7, v1, v0);
  sub_193658C2C();
  sub_193668458();
  uint64_t v9 = OUTLINED_FUNCTION_28();
  v10(v9);
  *uint64_t v3 = v12;
  type metadata accessor for EventValue();
  return swift_storeEnumTagMultiPayload();
}

unint64_t sub_193658C2C()
{
  unint64_t result = qword_1E9328140;
  if (!qword_1E9328140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9328140);
  }
  return result;
}

uint64_t _s12RTCReporting10EventValueO14BOOLeanLiteralACSb_tcfC_0@<X0>(char a1@<W0>, unsigned char *a2@<X8>)
{
  *a2 = a1;
  type metadata accessor for EventValue();
  OUTLINED_FUNCTION_38();
  return swift_storeEnumTagMultiPayload();
}

uint64_t EventValue.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_1936683E8();
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(a2, a1);
  type metadata accessor for EventValue();
  OUTLINED_FUNCTION_37();
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_193658D38@<X0>(double *a1@<X0>, double *a2@<X8>)
{
  return EventValue.init(floatLiteral:)(a2, *a1);
}

uint64_t sub_193658D40(void *a1)
{
  return EventValue.init(stringLiteral:)(*a1, a1[1]);
}

uint64_t sub_193658D4C(unsigned __int8 *a1)
{
  return EventValue.init(BOOLeanLiteral:)(*a1);
}

uint64_t sub_193658D54@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return EventValue.init(integerLiteral:)(*a1, a2);
}

void sub_193658D64()
{
}

uint64_t static Event.Keys.category.getter()
{
  return sub_193658DEC(&qword_1EB4B2DB8, &qword_1EB4B2DA8);
}

void sub_193658DA8()
{
}

uint64_t static Event.Keys.type.getter()
{
  return sub_193658DEC(&qword_1EB4B2DC0, &qword_1EB4B2DC8);
}

uint64_t sub_193658DEC(void *a1, uint64_t *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t Event.dict.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Event.isRealtime.getter()
{
  return *(unsigned __int8 *)(v0 + 8);
}

uint64_t Event.isRealtime.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 8) = result;
  return result;
}

uint64_t (*Event.isRealtime.modify())()
{
  return nullsub_1;
}

void Event.type.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  sub_193649960((uint64_t)&qword_1EB4B2DC0, (uint64_t)&unk_1EB4B2DD0, (uint64_t)&qword_1EB4B2DC8, (uint64_t)sub_193658DA8, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20);
}

uint64_t Event.init(dictionaryLiteral:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_193657EE8(a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

RTCReporting::Event __swiftcall Event.init(_:)(Swift::OpaquePointer a1)
{
  *(Swift::OpaquePointer *)uint64_t v1 = a1;
  *(unsigned char *)(v1 + 8) = 0;
  result.dict = a1;
  return result;
}

RTCReporting::Event __swiftcall Event.init(category:type:)(Swift::UInt64 category, Swift::UInt64 type)
{
  uint64_t v5 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2E20);
  uint64_t v7 = OUTLINED_FUNCTION_7(v6);
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_6();
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (Swift::UInt64 *)((char *)&v17 - v9);
  *(unsigned char *)(v5 + 8) = 0;
  type metadata accessor for EventValue();
  *(void *)uint64_t v5 = sub_1936684C8();
  if (qword_1EB4B2DB8 != -1) {
    swift_once();
  }
  *uint64_t v10 = category;
  swift_storeEnumTagMultiPayload();
  OUTLINED_FUNCTION_30((uint64_t)v10, 0);
  uint64_t v11 = OUTLINED_FUNCTION_35();
  sub_193653120(v11, v12, &qword_1EB4B2E20);
  swift_bridgeObjectRetain();
  sub_19364F190();
  sub_1936530CC((uint64_t)v10, &qword_1EB4B2E20);
  if (qword_1EB4B2DC0 != -1) {
    swift_once();
  }
  *uint64_t v10 = type;
  swift_storeEnumTagMultiPayload();
  OUTLINED_FUNCTION_30((uint64_t)v10, 0);
  uint64_t v13 = OUTLINED_FUNCTION_35();
  sub_193653120(v13, v14, &qword_1EB4B2E20);
  swift_bridgeObjectRetain();
  sub_19364F190();
  uint64_t v15 = (void *)sub_1936530CC((uint64_t)v10, &qword_1EB4B2E20);
  result.dict._rawValue = v15;
  result.isRealtime = v16;
  return result;
}

uint64_t Event.subscript.setter()
{
  OUTLINED_FUNCTION_22();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2E20);
  uint64_t v3 = OUTLINED_FUNCTION_7(v2);
  MEMORY[0x1F4188790](v3);
  uint64_t v4 = OUTLINED_FUNCTION_15();
  sub_193653120(v4, v1, &qword_1EB4B2E20);
  sub_19364F190();
  return sub_1936530CC(v0, &qword_1EB4B2E20);
}

uint64_t Event.subscript.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  if (*(void *)(v3 + 16))
  {
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_29();
    unint64_t v4 = sub_193650F38();
    if (v5)
    {
      unint64_t v6 = v4;
      uint64_t v7 = *(void *)(v3 + 56);
      uint64_t v8 = type metadata accessor for EventValue();
      OUTLINED_FUNCTION_1_0();
      sub_193652B74(v7 + *(void *)(v9 + 72) * v6, a1);
      uint64_t v10 = a1;
      uint64_t v11 = 0;
      uint64_t v12 = 1;
      uint64_t v13 = v8;
    }
    else
    {
      type metadata accessor for EventValue();
      uint64_t v10 = OUTLINED_FUNCTION_34();
    }
    __swift_storeEnumTagSinglePayload(v10, v11, v12, v13);
    return swift_bridgeObjectRelease();
  }
  else
  {
    type metadata accessor for EventValue();
    uint64_t v14 = OUTLINED_FUNCTION_34();
    return __swift_storeEnumTagSinglePayload(v14, v15, v16, v17);
  }
}

uint64_t sub_19365925C@<X0>(uint64_t a1@<X8>)
{
  swift_bridgeObjectRetain();
  Event.subscript.getter(a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1936592D8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2E20);
  MEMORY[0x1F4188790](v2 - 8);
  sub_193653120(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1EB4B2E20);
  swift_bridgeObjectRetain();
  return Event.subscript.setter();
}

uint64_t sub_19365938C(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    sub_193650D74((_OWORD *)a1, v3);
    sub_1936646B8();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1936530CC(a1, &qword_1EB4B2E90);
    OUTLINED_FUNCTION_35();
    sub_19365A478(v2);
    swift_bridgeObjectRelease();
    return sub_1936530CC((uint64_t)v3, &qword_1EB4B2E90);
  }
}

void (*Event.subscript.modify(void *a1, uint64_t a2, uint64_t a3))(uint64_t a1, char a2)
{
  uint64_t v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[1] = a3;
  v7[2] = v3;
  *uint64_t v7 = a2;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2E20);
  OUTLINED_FUNCTION_7(v8);
  size_t v10 = *(void *)(v9 + 64);
  v7[3] = malloc(v10);
  v7[4] = malloc(v10);
  uint64_t v11 = malloc(v10);
  v7[5] = v11;
  uint64_t v12 = *v3;
  if (*(void *)(v12 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v13 = sub_193650F38();
    if (v14)
    {
      unint64_t v15 = v13;
      uint64_t v16 = *(void *)(v12 + 56);
      uint64_t v17 = type metadata accessor for EventValue();
      OUTLINED_FUNCTION_1_0();
      sub_193652B74(v16 + *(void *)(v18 + 72) * v15, (uint64_t)v11);
      uint64_t v19 = (uint64_t)v11;
      uint64_t v20 = 0;
      uint64_t v21 = 1;
      uint64_t v22 = v17;
    }
    else
    {
      type metadata accessor for EventValue();
      uint64_t v19 = OUTLINED_FUNCTION_33();
    }
    __swift_storeEnumTagSinglePayload(v19, v20, v21, v22);
    swift_bridgeObjectRelease();
  }
  else
  {
    type metadata accessor for EventValue();
    uint64_t v23 = OUTLINED_FUNCTION_33();
    __swift_storeEnumTagSinglePayload(v23, v24, v25, v26);
  }
  return sub_193659560;
}

void sub_193659560(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  sub_193653120(*(void *)(*(void *)a1 + 40), *(void *)(*(void *)a1 + 32), &qword_1EB4B2E20);
  unint64_t v4 = (void *)v3[4];
  uint64_t v5 = (void *)v3[5];
  unint64_t v6 = (void *)v3[3];
  if (a2)
  {
    uint64_t v7 = OUTLINED_FUNCTION_28();
    sub_193653120(v7, v8, &qword_1EB4B2E20);
    swift_bridgeObjectRetain();
    sub_19364F190();
    sub_1936530CC((uint64_t)v4, &qword_1EB4B2E20);
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_19364F190();
  }
  sub_1936530CC((uint64_t)v5, &qword_1EB4B2E20);
  free(v5);
  free(v4);
  free(v6);
  free(v3);
}

void sub_193659650(uint64_t a1, char a2, void *a3)
{
  uint64_t v40 = a3;
  uint64_t v6 = type metadata accessor for EventValue();
  uint64_t v39 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2A00);
  uint64_t v10 = MEMORY[0x1F4188790](v9);
  unint64_t v13 = (void *)((char *)v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = *(void *)(a1 + 16);
  if (!v14)
  {
    swift_bridgeObjectRelease();
    return;
  }
  v35[1] = v3;
  v35[2] = a1;
  uint64_t v38 = (uint64_t)v13 + *(int *)(v10 + 48);
  uint64_t v15 = a1 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
  uint64_t v36 = *(void *)(v11 + 72);
  swift_bridgeObjectRetain();
  uint64_t v37 = v8;
  while (1)
  {
    sub_193653120(v15, (uint64_t)v13, &qword_1EB4B2A00);
    uint64_t v16 = v13;
    uint64_t v17 = *v13;
    uint64_t v18 = v13[1];
    uint64_t v43 = v17;
    uint64_t v44 = v18;
    sub_193652D08(v38, (uint64_t)v8);
    uint64_t v19 = (void *)*v40;
    unint64_t v21 = sub_193650F38();
    uint64_t v22 = v19[2];
    BOOL v23 = (v20 & 1) == 0;
    uint64_t v24 = v22 + v23;
    if (__OFADD__(v22, v23))
    {
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      sub_1936688C8();
      __break(1u);
      goto LABEL_20;
    }
    char v25 = v20;
    if (v19[3] < v24) {
      break;
    }
    if (a2)
    {
      if (v20) {
        goto LABEL_14;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2EC0);
      sub_1936687E8();
      if (v25) {
        goto LABEL_14;
      }
    }
LABEL_10:
    uint64_t v28 = (void *)*v40;
    *(void *)(*v40 + 8 * (v21 >> 6) + 64) |= 1 << v21;
    uint64_t v29 = (void *)(v28[6] + 16 * v21);
    *uint64_t v29 = v17;
    v29[1] = v18;
    uint64_t v8 = v37;
    sub_193652D08((uint64_t)v37, v28[7] + *(void *)(v39 + 72) * v21);
    uint64_t v30 = v28[2];
    BOOL v31 = __OFADD__(v30, 1);
    uint64_t v32 = v30 + 1;
    if (v31) {
      goto LABEL_18;
    }
    uint64_t v28[2] = v32;
    v15 += v36;
    a2 = 1;
    --v14;
    unint64_t v13 = v16;
    if (!v14)
    {
      swift_bridgeObjectRelease_n();
      return;
    }
  }
  sub_1936642DC(v24, a2 & 1);
  unint64_t v26 = sub_193650F38();
  if ((v25 & 1) != (v27 & 1)) {
    goto LABEL_19;
  }
  unint64_t v21 = v26;
  if ((v25 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_14:
  uint64_t v33 = (void *)swift_allocError();
  swift_willThrow();
  id v45 = v33;
  id v34 = v33;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB4B2E50);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_1936524D8((uint64_t)v37, (void (*)(void))type metadata accessor for EventValue);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return;
  }
LABEL_20:
  uint64_t v41 = 0;
  unint64_t v42 = 0xE000000000000000;
  sub_193668798();
  sub_193668558();
  sub_1936687C8();
  sub_193668558();
  sub_193668818();
  __break(1u);
}

uint64_t sub_193659A84()
{
  return MEMORY[0x1E4FBB450];
}

uint64_t sub_193659A90()
{
  return sub_193659B1C(&qword_1E9328148);
}

uint64_t sub_193659AC4()
{
  return MEMORY[0x1E4FBB220];
}

uint64_t sub_193659AD0()
{
  return MEMORY[0x1E4FBB3C0];
}

uint64_t sub_193659ADC()
{
  return MEMORY[0x1E4FBC238];
}

uint64_t sub_193659AE8()
{
  return sub_193659B1C(&qword_1E9328150);
}

uint64_t sub_193659B1C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for EventValue();
    OUTLINED_FUNCTION_37();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_193659B5C()
{
  return MEMORY[0x1E4FBB230];
}

uint64_t sub_193659B68()
{
  return MEMORY[0x1E4FBB228];
}

uint64_t sub_193659B74()
{
  return 0;
}

uint64_t *initializeBufferWithCopyOfBuffer for EventValue(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v7 = a2[1];
        *a1 = *a2;
        a1[1] = v7;
        swift_bridgeObjectRetain();
        goto LABEL_8;
      case 5u:
        uint64_t v9 = sub_1936683E8();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
        goto LABEL_8;
      case 6u:
      case 7u:
        *a1 = *a2;
        swift_bridgeObjectRetain();
LABEL_8:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(v6 + 64));
        break;
    }
  }
  return a1;
}

void *assignWithCopy for EventValue(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1936524D8((uint64_t)a1, (void (*)(void))type metadata accessor for EventValue);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        goto LABEL_7;
      case 5u:
        uint64_t v6 = sub_1936683E8();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
        goto LABEL_7;
      case 6u:
      case 7u:
        *a1 = *a2;
        swift_bridgeObjectRetain();
LABEL_7:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

void *initializeWithTake for EventValue(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 5)
  {
    uint64_t v6 = sub_1936683E8();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for EventValue(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1936524D8((uint64_t)a1, (void (*)(void))type metadata accessor for EventValue);
    if (swift_getEnumCaseMultiPayload() == 5)
    {
      uint64_t v6 = sub_1936683E8();
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

uint64_t sub_19365A074()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_19365A084()
{
  uint64_t result = sub_1936683E8();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for Event(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for Event()
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for Event(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t assignWithTake for Event(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for Event(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 9))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Event(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 9) = 1;
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
    *(unsigned char *)(result + 9) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Event()
{
  return &type metadata for Event;
}

ValueMetadata *type metadata accessor for Event.Keys()
{
  return &type metadata for Event.Keys;
}

void type metadata accessor for os_unfair_lock_s()
{
  if (!qword_1EB4B2ED0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EB4B2ED0);
    }
  }
}

uint64_t sub_19365A314@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_193650F38();
  char v6 = v5;
  swift_bridgeObjectRelease();
  if (v6)
  {
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2EC0);
    sub_1936687D8();
    swift_bridgeObjectRelease();
    uint64_t v7 = *(void *)(v13 + 56);
    uint64_t v8 = type metadata accessor for EventValue();
    sub_193652D08(v7 + *(void *)(*(void *)(v8 - 8) + 72) * v4, a1);
    sub_1936687F8();
    *uint64_t v2 = v13;
    swift_bridgeObjectRelease();
    uint64_t v9 = a1;
    uint64_t v10 = 0;
    uint64_t v11 = v8;
  }
  else
  {
    uint64_t v11 = type metadata accessor for EventValue();
    uint64_t v9 = a1;
    uint64_t v10 = 1;
  }
  return __swift_storeEnumTagSinglePayload(v9, v10, 1, v11);
}

double sub_19365A478@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_193650F38();
  char v6 = v5;
  swift_bridgeObjectRelease();
  if (v6)
  {
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2DA0);
    sub_1936687D8();
    swift_bridgeObjectRelease();
    sub_193650D74((_OWORD *)(*(void *)(v8 + 56) + 32 * v4), a1);
    sub_1936687F8();
    *uint64_t v2 = v8;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a1 = 0u;
    a1[1] = 0u;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_9()
{
  return MEMORY[0x1F4184940](v0, v1);
}

uint64_t OUTLINED_FUNCTION_33()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_34()
{
  return v0;
}

uint64_t sub_19365A614()
{
  uint64_t v0 = sub_193668418();
  __swift_allocate_value_buffer(v0, qword_1EB4B30B0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EB4B30B0);
  return sub_193668408();
}

BOOL sub_19365A68C(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_19365A69C()
{
  return sub_193668968();
}

uint64_t sub_19365A6C4()
{
  return sub_193668988();
}

BOOL sub_19365A70C(char *a1, char *a2)
{
  return sub_19365A68C(*a1, *a2);
}

uint64_t sub_19365A718()
{
  return sub_19365A6C4();
}

uint64_t sub_19365A720()
{
  return sub_19365A69C();
}

uint64_t sub_19365A728()
{
  return sub_193668988();
}

unint64_t sub_19365A76C(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = 0xD000000000000015;
  if (!a2) {
    return 0xD000000000000016;
  }
  if (a2 != 1)
  {
    sub_193668798();
    swift_bridgeObjectRelease();
    sub_193668558();
    return 0xD000000000000020;
  }
  return v2;
}

unint64_t sub_19365A834()
{
  return sub_19365A76C(*v0, v0[1]);
}

uint64_t sub_19365A83C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 328);
  *(void *)(v2 + 328) = a1;
  *(void *)(v2 + 336) = a2;
  return sub_19364ACA4(v3);
}

uint64_t Session.__allocating_init(clientType:clientName:serviceName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 24) = 0;
  *(void *)(v6 + 32) = 0;
  *(void *)(v6 + 16) = 0;
  *(void *)(v6 + 40) = 1;
  type metadata accessor for Session();
  *(_OWORD *)(v6 + 48) = 0u;
  *(_OWORD *)(v6 + 64) = 0u;
  *(_OWORD *)(v6 + 80) = 0u;
  *(_OWORD *)(v6 + 96) = 0u;
  *(unsigned char *)(v6 + 112) = 0;
  swift_allocObject();
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 120) = v13;
  *uint64_t v13 = v6;
  v13[1] = sub_19365A96C;
  return sub_19364C8A8(a1, a2, a3, a4, a5, a6, v6 + 16, 1);
}

uint64_t sub_19365A96C()
{
  OUTLINED_FUNCTION_29_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_1();
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3_0();
  *char v5 = v4;
  uint64_t v6 = swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(uint64_t))(v4 + 8);
  if (!v0) {
    uint64_t v6 = v3;
  }
  return v7(v6);
}

uint64_t sub_19365AA3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  char v6 = v5(a2, a3);
  swift_unknownObjectRelease();
  return v6 & 1;
}

uint64_t sub_19365AA94(int a1, xpc_object_t xint)
{
  int64_t value = xpc_int64_get_value(xint);
  sub_19365C59C(&v4, value);
  return 1;
}

uint64_t sub_19365AAD4()
{
  OUTLINED_FUNCTION_10_0();
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v1 + 64);
  *uint64_t v3 = *v0;
  swift_task_dealloc();
  sub_19365BD80(*(id *)(v1 + 32), *(unsigned char *)(v2 + 40));
  return MEMORY[0x1F4188298](sub_19365ABFC, v4, 0);
}

uint64_t sub_19365ABFC()
{
  uint64_t v3 = v1[8];
  swift_release();
  uint64_t v4 = *(void *)(v3 + 312);
  if (v4)
  {
    v1[22] = v4;
    swift_retain();
    char v5 = (void *)swift_task_alloc();
    v1[23] = v5;
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB4B2E50);
    *char v5 = v1;
    v5[1] = sub_19365AAD4;
    uint64_t v7 = MEMORY[0x1E4FBC848] + 8;
    uint64_t v8 = MEMORY[0x1E4FBC0F0];
    return MEMORY[0x1F4187DA0](v1 + 4, v4, v7, v6, v8);
  }
  else
  {
    uint64_t v9 = OUTLINED_FUNCTION_31_0();
    __swift_storeEnumTagSinglePayload(v0, 1, 1, v9);
    sub_193654D9C();
    uint64_t v10 = (void *)swift_allocObject();
    OUTLINED_FUNCTION_12_0(v10);
    swift_unknownObjectRetain();
    uint64_t v11 = sub_193649EC8(v0, (uint64_t)&unk_1E9328208, v2);
    v1[24] = v11;
    uint64_t v12 = swift_retain();
    sub_193655024(v12);
    uint64_t v13 = (void *)swift_task_alloc();
    v1[25] = v13;
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB4B2E50);
    *uint64_t v13 = v1;
    v13[1] = sub_193654EB4;
    uint64_t v15 = MEMORY[0x1E4FBC848] + 8;
    uint64_t v16 = MEMORY[0x1E4FBC0F0];
    return MEMORY[0x1F4187D90](v14, v11, v15, v14, v16);
  }
}

uint64_t sub_19365AE00()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_8_0();
  return v0();
}

BOOL sub_19365AECC(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  uint64_t v4 = sub_193668948();
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = v4 & ~v5;
  uint64_t v7 = a2 + 56;
  if (((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
    return 0;
  }
  uint64_t v8 = *(void *)(a2 + 48);
  if (*(void *)(v8 + 8 * v6) == a1) {
    return 1;
  }
  uint64_t v10 = ~v5;
  unint64_t v11 = (v6 + 1) & v10;
  if (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
    return 0;
  }
  do
  {
    uint64_t v12 = *(void *)(v8 + 8 * v11);
    BOOL result = v12 == a1;
    if (v12 == a1) {
      break;
    }
    unint64_t v11 = (v11 + 1) & v10;
  }
  while (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return result;
}

void sub_19365AF98()
{
  swift_unknownObjectRelease();
  if (qword_1EB4B2BB0 != -1) {
    swift_once();
  }
  uint64_t v1 = v0 + 3;
  uint64_t v3 = v0[6];
  uint64_t v2 = v0[7];
  uint64_t v4 = v0[5];
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_1EB4B30B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  swift_retain_n();
  unint64_t v6 = sub_1936683F8();
  os_log_type_t v7 = sub_193668668();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = *v1;
    uint64_t v9 = (uint8_t *)OUTLINED_FUNCTION_25_0();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    if (*(void *)(v8 + 184))
    {
      uint64_t v10 = *(void *)(*v1 + 176);
      unint64_t v11 = *(void *)(v8 + 184);
    }
    else
    {
      unint64_t v11 = 0xE100000000000000;
      uint64_t v10 = 63;
    }
    uint64_t v13 = v0[6];
    uint64_t v16 = v0[5];
    uint64_t v17 = v0[7];
    swift_bridgeObjectRetain();
    v0[2] = sub_19365B4D8(v10, v11, &v18);
    sub_1936686E8();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_193646000, v6, v7, "session %s received error during send - marking as disabled", v9, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_14();
    OUTLINED_FUNCTION_14();

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v17, v16);
  }
  else
  {
    swift_release_n();

    OUTLINED_FUNCTION_23_0();
    v12();
  }
  *(unsigned char *)(v0[3] + 320) = 0;
  swift_willThrow();
  sub_193655024(0);
  swift_task_dealloc();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_19_0();
  __asm { BRAA            X1, X16 }
}

uint64_t sub_19365B200()
{
  uint64_t v15 = v0;
  swift_unknownObjectRelease();
  if (qword_1EB4B2BB0 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[10];
  uint64_t v2 = sub_193668418();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EB4B30B0);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_1936683F8();
  os_log_type_t v6 = sub_193668668();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[10];
  if (v7)
  {
    uint64_t v9 = (uint8_t *)OUTLINED_FUNCTION_25_0();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136446210;
    swift_getErrorValue();
    uint64_t v10 = sub_1936688F8();
    v0[6] = sub_19365B4D8(v10, v11, &v14);
    sub_1936686E8();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_193646000, v5, v6, "failed to send session end: %{public}s", v9, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_14();
    OUTLINED_FUNCTION_14();
  }
  else
  {
  }
  *(unsigned char *)(v0[7] + 320) = 2;
  OUTLINED_FUNCTION_8_0();
  return v12();
}

uint64_t sub_19365B420()
{
  return swift_slowAlloc();
}

unsigned char **sub_19365B428(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  id v4 = *result;
  unsigned char *v4 = a4;
  *BOOL result = v4 + 1;
  return result;
}

uint64_t sub_19365B438(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_19365B460(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_19365B4D8(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_1936686E8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_19365B4D8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_19365BD8C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_193650D18((uint64_t)v12, *a3);
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
      sub_193650D18((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_19365B5AC()
{
  return type metadata accessor for Session();
}

uint64_t sub_19365B5B4()
{
  uint64_t result = sub_193668398();
  if (v1 <= 0x3F) {
    return swift_updateClassMetadata2();
  }
  return result;
}

uint64_t method lookup function for Session(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Session);
}

uint64_t dispatch thunk of Session.end()()
{
  OUTLINED_FUNCTION_10_0();
  id v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 384) + **(int **)(*(void *)v0 + 384));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_19364C7E8;
  return v4();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_19365B7D8(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_19365B860(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x19365B92CLL);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_19365B954(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_19365B95C(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

void type metadata accessor for Session.State()
{
}

uint64_t sub_19365B970(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_19365B9A4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_19365B9F0(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v3;
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(_WORD *)(a1 + 80) = *(_WORD *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_19365BA88(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(unsigned char *)(a1 + 81) = *(unsigned char *)(a2 + 81);
  uint64_t v4 = *(void *)(a2 + 88);
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 88) = v4;
  return a1;
}

void *__swift_memcpy97_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x61uLL);
}

uint64_t sub_19365BB78(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(unsigned char *)(a1 + 81) = *(unsigned char *)(a2 + 81);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  return a1;
}

uint64_t sub_19365BC18(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 97))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 24);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_19365BC6C(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 96) = 0;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 97) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 97) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2;
    }
  }
  return result;
}

void type metadata accessor for LegacyConfig()
{
}

unint64_t sub_19365BCEC()
{
  unint64_t result = qword_1E93281F0;
  if (!qword_1E93281F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1E93281F0);
  }
  return result;
}

uint64_t sub_19365BD38()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

void sub_19365BD80(id a1, char a2)
{
  if (a2) {
}
  }

uint64_t sub_19365BD8C(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_19365BEE4((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_1936686F8();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_19365BFBC(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_1936687B8();
    if (!v8)
    {
      uint64_t result = sub_193668808();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *sub_19365BEE4(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_193668848();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_19365BFBC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_19365C054(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_19365C230(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_19365C230((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_19365C054(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_193668578();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x1E4FBC860];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x1E4FBC860];
  }
LABEL_6:
  unint64_t v3 = sub_19365C1C8(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_1936687A8();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_193668848();
  __break(1u);
LABEL_14:
  uint64_t result = sub_193668808();
  __break(1u);
  return result;
}

void *sub_19365C1C8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2A20);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_19365C230(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2A20);
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
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_19365C3E0(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_19365C308(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_19365C308(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_193668848();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_19365C3E0(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_193668848();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
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

unint64_t sub_19365C4D4()
{
  unint64_t result = qword_1E9328058;
  if (!qword_1E9328058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9328058);
  }
  return result;
}

uint64_t sub_19365C520()
{
  return OUTLINED_FUNCTION_1_1(v0, 24);
}

uint64_t sub_19365C52C(int a1, void *a2)
{
  return sub_19365AA94(a1, a2) & 1;
}

uint64_t sub_19365C54C()
{
  return OUTLINED_FUNCTION_1_1(v0, 32);
}

uint64_t sub_19365C558()
{
  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t sub_19365C584()
{
  return OUTLINED_FUNCTION_1_1(v0, 24);
}

uint64_t sub_19365C590()
{
  return OUTLINED_FUNCTION_1_1(v0, 32);
}

uint64_t sub_19365C59C(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  uint64_t v7 = sub_193668948();
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_19365C91C(a2, v9, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v14;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v10 = *(void *)(v6 + 48);
  if (*(void *)(v10 + 8 * v9) != a2)
  {
    uint64_t v11 = ~v8;
    do
    {
      unint64_t v9 = (v9 + 1) & v11;
      if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(void *)(v10 + 8 * v9) != a2);
  }
  uint64_t result = 0;
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_19365C698()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9328270);
  uint64_t result = sub_193668788();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v7 = (uint64_t *)(v2 + 56);
    uint64_t v6 = *(void *)(v2 + 56);
    uint64_t v8 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v27 = -1 << v8;
    uint64_t v28 = v1;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v6;
    uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
    int64_t v11 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v12 = result + 56;
    if ((v9 & v6) == 0) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v13 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    for (unint64_t i = v13 | (v5 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v5 << 6))
    {
      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * i);
      uint64_t result = sub_193668948();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6))) == 0)
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v19) >> 6;
        while (++v21 != v24 || (v23 & 1) == 0)
        {
          BOOL v25 = v21 == v24;
          if (v21 == v24) {
            unint64_t v21 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v12 + 8 * v21);
          if (v26 != -1)
          {
            unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
      *(void *)(*(void *)(v4 + 48) + 8 * v22) = v18;
      ++*(void *)(v4 + 16);
      if (v10) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v15 = v5 + 1;
      if (__OFADD__(v5, 1)) {
        goto LABEL_38;
      }
      if (v15 >= v11) {
        goto LABEL_32;
      }
      unint64_t v16 = v7[v15];
      ++v5;
      if (!v16)
      {
        int64_t v5 = v15 + 1;
        if (v15 + 1 >= v11) {
          goto LABEL_32;
        }
        unint64_t v16 = v7[v5];
        if (!v16)
        {
          int64_t v5 = v15 + 2;
          if (v15 + 2 >= v11) {
            goto LABEL_32;
          }
          unint64_t v16 = v7[v5];
          if (!v16)
          {
            int64_t v17 = v15 + 3;
            if (v17 >= v11)
            {
LABEL_32:
              if (v29 > 63) {
                sub_193654AF0(0, v11, (void *)(v2 + 56));
              }
              else {
                *uint64_t v7 = v27;
              }
              uint64_t v1 = v28;
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v16 = v7[v17];
            if (!v16)
            {
              while (1)
              {
                int64_t v5 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  goto LABEL_39;
                }
                if (v5 >= v11) {
                  goto LABEL_32;
                }
                unint64_t v16 = v7[v5];
                ++v17;
                if (v16) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v5 = v17;
          }
        }
      }
LABEL_20:
      unint64_t v10 = (v16 - 1) & v16;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_19365C91C(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_19365C698();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_19365CA40();
      goto LABEL_14;
    }
    sub_19365CBD8();
  }
  uint64_t v8 = *v3;
  uint64_t result = sub_193668948();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(void *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      uint64_t result = sub_1936688B8();
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
        if (*(void *)(v10 + 8 * a2) == v5) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v12 + 48) + 8 * a2) = v5;
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

void *sub_19365CA40()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9328270);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_193668778();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
  if (!v12) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v14 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (unint64_t i = v14 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v9 << 6))
  {
    *(void *)(*(void *)(v4 + 48) + 8 * i) = *(void *)(*(void *)(v2 + 48) + 8 * i);
    if (v12) {
      goto LABEL_11;
    }
LABEL_12:
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
LABEL_25:
    unint64_t v12 = (v17 - 1) & v17;
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_25;
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
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_19365CBD8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9328270);
  uint64_t result = sub_193668788();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v26 = v1;
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
  if (!v9) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v12 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  for (unint64_t i = v12 | (v5 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v5 << 6))
  {
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * i);
    uint64_t result = sub_193668948();
    uint64_t v18 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v19 = result & ~v18;
    unint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~*(void *)(v11 + 8 * (v19 >> 6))) == 0)
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v18) >> 6;
      while (++v20 != v23 || (v22 & 1) == 0)
      {
        BOOL v24 = v20 == v23;
        if (v20 == v23) {
          unint64_t v20 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v20);
        if (v25 != -1)
        {
          unint64_t v21 = __clz(__rbit64(~v25)) + (v20 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v21 = __clz(__rbit64((-1 << v19) & ~*(void *)(v11 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v11 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    *(void *)(*(void *)(v4 + 48) + 8 * v21) = v17;
    ++*(void *)(v4 + 16);
    if (v9) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v14 = v5 + 1;
    if (__OFADD__(v5, 1)) {
      goto LABEL_36;
    }
    if (v14 >= v10) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v5;
    if (!v15)
    {
      int64_t v5 = v14 + 1;
      if (v14 + 1 >= v10) {
        goto LABEL_32;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v5);
      if (!v15)
      {
        int64_t v5 = v14 + 2;
        if (v14 + 2 >= v10) {
          goto LABEL_32;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v5);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v9 = (v15 - 1) & v15;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v10)
  {
LABEL_32:
    uint64_t result = swift_release();
    uint64_t v1 = v26;
    goto LABEL_34;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
    int64_t v5 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v5 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v5);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t destroy for Session.SessionError(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s12RTCReporting7SessionC12SessionErrorOwCP_0(uint64_t a1, uint64_t a2)
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

void *assignWithCopy for Session.SessionError(void *a1, void *a2)
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

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for Session.SessionError(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for Session.SessionError(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for Session.SessionError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 2147483646;
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

uint64_t sub_19365D064(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_19365D07C(void *result, int a2)
{
  if (a2 < 0)
  {
    *__n128 result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for Session.SessionError()
{
  return &type metadata for Session.SessionError;
}

uint64_t sub_19365D0AC(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_19365D0E4()
{
  return swift_bridgeObjectRelease();
}

void *sub_19365D0EC(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_19365D14C(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_19365D188(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 16);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_19365D1C8(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for LegacyHierarchyToken()
{
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  __swift_storeEnumTagSinglePayload(v0, 0, 1, v2);
  return sub_19364C710(v0, v1);
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return RTCXPCDictionary.subscript.setter(v0);
}

uint64_t sub_19365D284()
{
  uint64_t v14 = sub_193668428();
  uint64_t v0 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1936686A8();
  uint64_t v3 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  unsigned int v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_193668698();
  MEMORY[0x1F4188790](v6);
  uint64_t v7 = sub_193668448();
  MEMORY[0x1F4188790](v7 - 8);
  sub_19365DAB4();
  sub_193668438();
  uint64_t v16 = MEMORY[0x1E4FBC860];
  sub_19365DAF4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2EF0);
  sub_19365DB44();
  sub_193668758();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E4FBCC68], v13);
  uint64_t v8 = v14;
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, *MEMORY[0x1E4FBCB10], v14);
  sub_1936686C8();
  (*(void (**)(char *, uint64_t))(v0 + 8))(v2, v8);
  uint64_t v9 = sub_1936686B8();
  uint64_t v10 = v15;
  *(void *)(v15 + 16) = v9;
  *(void *)(v10 + 24) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2EF8);
  uint64_t v11 = swift_allocObject();
  *(_DWORD *)(v11 + 16) = 0;
  *(void *)(v10 + 32) = v11;
  *(unsigned char *)(v10 + 40) = 2;
  return v10;
}

uint64_t sub_19365D580()
{
  SecTaskRef v0 = SecTaskCreateFromSelf(0);
  if (!v0)
  {
    if (qword_1E9328060 != -1) {
      swift_once();
    }
    if (byte_1E9328068 != 1) {
      return 0;
    }
    if (qword_1E9328038 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_193668418();
    __swift_project_value_buffer(v5, (uint64_t)qword_1E9329080);
    uint64_t v1 = sub_1936683F8();
    os_log_type_t v6 = sub_193668668();
    if (os_log_type_enabled(v1, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_193646000, v1, v6, "unable to validate task XPC authorization", v7, 2u);
      MEMORY[0x1997002F0](v7, -1, -1);
    }
    goto LABEL_27;
  }
  uint64_t v1 = v0;
  uint64_t v2 = (__CFString *)sub_193668508();
  CFTypeRef v3 = SecTaskCopyValueForEntitlement((SecTaskRef)v1, v2, 0);

  if (v3)
  {
    swift_unknownObjectRetain();
    if (swift_dynamicCast())
    {
      swift_unknownObjectRelease();

      return v15;
    }
    if (qword_1E9328060 != -1) {
      swift_once();
    }
    if (byte_1E9328068 == 1)
    {
      if (qword_1E9328038 != -1) {
        swift_once();
      }
      uint64_t v12 = sub_193668418();
      __swift_project_value_buffer(v12, (uint64_t)qword_1E9329080);
      uint64_t v9 = sub_1936683F8();
      os_log_type_t v13 = sub_193668668();
      if (os_log_type_enabled(v9, v13))
      {
        uint64_t v14 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl(&dword_193646000, v9, v13, "XPC authorization entitlement is invalid", v14, 2u);
        MEMORY[0x1997002F0](v14, -1, -1);
        swift_unknownObjectRelease();
        goto LABEL_26;
      }
    }
    swift_unknownObjectRelease();
    return 0;
  }
  if (qword_1E9328060 != -1) {
    swift_once();
  }
  if (byte_1E9328068 != 1) {
    goto LABEL_27;
  }
  if (qword_1E9328038 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_193668418();
  __swift_project_value_buffer(v8, (uint64_t)qword_1E9329080);
  uint64_t v9 = sub_1936683F8();
  os_log_type_t v10 = sub_193668668();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_193646000, v9, v10, "XPC authorization entitlement not available", v11, 2u);
    MEMORY[0x1997002F0](v11, -1, -1);
  }
LABEL_26:

LABEL_27:
  return 0;
}

uint64_t sub_19365D948()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  byte_1E9328068 = result;
  return result;
}

uint64_t sub_19365D970()
{
  uint64_t v0 = sub_193668418();
  __swift_allocate_value_buffer(v0, qword_1E9329080);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E9329080);
  return sub_193668408();
}

uint64_t sub_19365D9F0()
{
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_19365DA20()
{
  sub_19365D9F0();
  return MEMORY[0x1F4186488](v0, 41, 7);
}

uint64_t type metadata accessor for ConnectionManager()
{
  return self;
}

uint64_t sub_19365DA78()
{
  type metadata accessor for ConnectionManager();
  swift_allocObject();
  uint64_t result = sub_19365D284();
  qword_1EB4B30D8 = result;
  return result;
}

unint64_t sub_19365DAB4()
{
  unint64_t result = qword_1EB4B2F28;
  if (!qword_1EB4B2F28)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB4B2F28);
  }
  return result;
}

unint64_t sub_19365DAF4()
{
  unint64_t result = qword_1EB4B2F20;
  if (!qword_1EB4B2F20)
  {
    sub_193668698();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB4B2F20);
  }
  return result;
}

unint64_t sub_19365DB44()
{
  unint64_t result = qword_1EB4B2F18;
  if (!qword_1EB4B2F18)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB4B2EF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB4B2F18);
  }
  return result;
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

unint64_t sub_19365DBE0()
{
  return 0xD000000000000016;
}

unint64_t sub_19365DC60()
{
  return sub_19365DBE0();
}

Swift::Void __swiftcall changeSessionLimit(newLimit:)(Swift::Int newLimit)
{
}

uint64_t type metadata accessor for _RTCReportingS()
{
  return self;
}

void sub_19365DCC8(uint64_t a1)
{
  if (qword_1EB4B2E28 != -1) {
    a1 = swift_once();
  }
  uint64_t v1 = MEMORY[0x1F4188790](a1);
  MEMORY[0x1F4188790](v1);
  CFTypeRef v3 = v2 + 4;
  os_unfair_lock_lock(v2 + 4);
  sub_193654444();
  os_unfair_lock_unlock(v3);
}

uint64_t _RTCReportingS.messageLoggingBlock.getter()
{
  OUTLINED_FUNCTION_39();
  uint64_t v0 = OUTLINED_FUNCTION_16_1();
  sub_193654BEC(v0);
  return OUTLINED_FUNCTION_16_1();
}

uint64_t sub_19365DE8C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  uint64_t v2 = sub_193668518();
  uint64_t v4 = v3;
  swift_retain();
  v1(v2, v4);
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_19365DFA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = (id)sub_193668508();
  (*(void (**)(uint64_t, id))(a3 + 16))(a3, v4);
}

uint64_t _RTCReportingS.messageLoggingBlock.setter(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_36_0();
  uint64_t v5 = *v2;
  *uint64_t v2 = a1;
  v2[1] = a2;
  return sub_19364ACA4(v5);
}

uint64_t sub_19365E044@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (uint64_t *)(*a1 + OBJC_IVAR____RTCReportingS_messageLoggingBlock);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_1936633BC;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_193654BEC(v4);
}

uint64_t sub_19365E0E4(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_193663384;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = (uint64_t *)(*a2 + OBJC_IVAR____RTCReportingS_messageLoggingBlock);
  swift_beginAccess();
  uint64_t v8 = *v7;
  *uint64_t v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_193654BEC(v3);
  return sub_19364ACA4(v8);
}

uint64_t (*_RTCReportingS.messageLoggingBlock.modify())()
{
  return j__swift_endAccess;
}

uint64_t _RTCReportingS.messageSentDelegate.getter()
{
  OUTLINED_FUNCTION_39();
  return MEMORY[0x1997003D0](v0);
}

uint64_t _RTCReportingS.messageSentDelegate.setter()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_19365E318@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____RTCReportingS_messageSentDelegate;
  swift_beginAccess();
  uint64_t result = MEMORY[0x1997003D0](v3);
  *a2 = result;
  return result;
}

uint64_t sub_19365E370()
{
  return swift_unknownObjectWeakAssign();
}

void (*_RTCReportingS.messageSentDelegate.modify(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____RTCReportingS_messageSentDelegate;
  v3[4] = v1;
  void v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x1997003D0](v5);
  return sub_19365E44C;
}

void sub_19365E44C(void **a1, char a2)
{
  uint64_t v3 = *a1;
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t sub_19365E4CC()
{
  uint64_t v0 = sub_193668418();
  __swift_allocate_value_buffer(v0, qword_1EB4B2ED8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EB4B2ED8);
  return sub_193668408();
}

uint64_t sub_19365E54C()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  byte_1EB4B30C8 = result;
  return result;
}

uint64_t sub_19365E574()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2EF8);
  uint64_t result = swift_allocObject();
  *(_DWORD *)(result + 16) = 0;
  qword_1EB4B2E98 = result;
  return result;
}

uint64_t sub_19365E5AC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2EF8);
  uint64_t result = swift_allocObject();
  *(_DWORD *)(result + 16) = 0;
  qword_1EB4B2DF0 = result;
  return result;
}

unint64_t sub_19365E5E4()
{
  return 0xD000000000000016;
}

uint64_t sub_19365E600(char a1)
{
  if (a1) {
    unint64_t v1 = 0xD000000000000011;
  }
  else {
    unint64_t v1 = 0xD000000000000016;
  }
  if (a1) {
    unint64_t v2 = 0x800000019366A800;
  }
  else {
    unint64_t v2 = 0x800000019366A820;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B29E0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19366AD30;
  *(void *)(inited + 32) = sub_193668518();
  *(void *)(inited + 40) = v4;
  *(void *)(inited + 72) = MEMORY[0x1E4FBB1A0];
  *(void *)(inited + 48) = v1;
  *(void *)(inited + 56) = v2;
  return sub_1936684C8();
}

uint64_t sub_19365E6C8(uint64_t a1)
{
  if (a1 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (a1) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t sub_19365E6E0(char a1)
{
  return a1 & 1;
}

BOOL sub_19365E6E8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_19365E6F4(*a1, *a2);
}

BOOL sub_19365E6F4(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_19365E704()
{
  return sub_19365E70C();
}

uint64_t sub_19365E70C()
{
  return sub_193668988();
}

uint64_t sub_19365E754()
{
  return sub_19365E75C();
}

uint64_t sub_19365E75C()
{
  return sub_193668978();
}

uint64_t sub_19365E784()
{
  return sub_19365E78C();
}

uint64_t sub_19365E78C()
{
  return sub_193668988();
}

uint64_t sub_19365E7D0@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_19365E6C8(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_19365E7FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_19365E6E0(*v1);
  *a1 = result;
  return result;
}

unint64_t sub_19365E828()
{
  return 0xD000000000000016;
}

uint64_t sub_19365E848(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_193663264();
  unint64_t v5 = sub_1936632B0();
  return MEMORY[0x1F40E3628](a1, a2, v4, v5);
}

uint64_t sub_19365E8A0()
{
  return sub_19365E600(*v0);
}

uint64_t sub_19365E8A8(uint64_t a1)
{
  unint64_t v2 = sub_193663218();
  return MEMORY[0x1F40E6E20](a1, v2);
}

uint64_t sub_19365E8E4(uint64_t a1)
{
  unint64_t v2 = sub_193663218();
  unint64_t v3 = sub_193663264();
  unint64_t v4 = sub_1936632B0();
  return MEMORY[0x1F40E6DF8](a1, v2, v3, v4);
}

id _RTCReportingS.__allocating_init(sessionInfo:userInfo:frameworksToCheck:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  return _RTCReportingS.init(sessionInfo:userInfo:frameworksToCheck:)(a1, a2, a3);
}

id _RTCReportingS.__allocating_init(sessionInfo:userInfo:frameworksToCheck:aggregationBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v9 = objc_allocWithZone(v4);
  return _RTCReportingS.init(sessionInfo:userInfo:frameworksToCheck:aggregationBlock:)(a1, a2, a3, a4);
}

void sub_19365E9F0(uint64_t a1, unsigned __int16 a2, unsigned __int16 a3, uint64_t a4, uint64_t a5, double a6)
{
  if (a1)
  {
    uint64_t v11 = (void *)sub_193668468();
    if (a4)
    {
LABEL_3:
      uint64_t v12 = sub_193668468();
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v12 = 0;
LABEL_6:
  id v13 = (id)v12;
  (*(void (**)(uint64_t, void *, void, void, double))(a5 + 16))(a5, v11, a2, a3, a6);
}

uint64_t sub_19365EAD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  return MEMORY[0x1F4188298](sub_19365EAF8, 0, 0);
}

uint64_t sub_19365EAF8()
{
  OUTLINED_FUNCTION_29_0();
  (*(void (**)(void))(v0 + 16))(0);
  OUTLINED_FUNCTION_8_0();
  return v1();
}

uint64_t sub_19365EB58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1936685F8();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_1936530CC(a1, &qword_1EB4B2EB8);
  }
  else
  {
    sub_1936685E8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1936685A8();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_19365ECC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  return MEMORY[0x1F4188298](sub_1936653B4, 0, 0);
}

uint64_t sub_19365ECE8(uint64_t a1)
{
  return a1;
}

uint64_t sub_19365ED1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_35_0();
  a21 = v23;
  a22 = v24;
  OUTLINED_FUNCTION_27_1();
  a20 = v22;
  swift_bridgeObjectRelease();
  if (qword_1EB4B2F10 != -1) {
    swift_once();
  }
  uint64_t v25 = (void *)v22[44];
  uint64_t v26 = sub_193668418();
  __swift_project_value_buffer(v26, (uint64_t)qword_1EB4B2ED8);
  id v27 = v25;
  id v28 = v25;
  uint64_t v29 = sub_1936683F8();
  os_log_type_t v30 = sub_193668668();
  BOOL v31 = os_log_type_enabled(v29, v30);
  uint64_t v32 = (void *)v22[44];
  if (v31)
  {
    a10 = v22 + 19;
    OUTLINED_FUNCTION_33_0();
    a11 = swift_slowAlloc();
    OUTLINED_FUNCTION_22_1(4.8149e-34);
    uint64_t v33 = sub_1936688F8();
    v22[19] = sub_19365B4D8(v33, v34, &a11);
    sub_1936686E8();
    swift_bridgeObjectRelease();

    OUTLINED_FUNCTION_48(&dword_193646000, v35, v36, "failed to configure legacy session: %s");
    OUTLINED_FUNCTION_34_0();
    OUTLINED_FUNCTION_14();
    OUTLINED_FUNCTION_14();
  }
  else
  {
  }
  uint64_t v37 = (void (*)(void))v22[27];
  uint64_t v38 = (void *)v22[44];
  if (v37)
  {
    swift_retain();
    v37(0);

    sub_19364ACA4((uint64_t)v37);
  }
  else
  {
  }
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_10_1();
  return v40(v39, v40, v41, v42, v43, v44, v45, v46, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_19365EF0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 72) = a4;
  *(void *)(v5 + 80) = a5;
  return MEMORY[0x1F4188298](sub_19365EF2C, 0, 0);
}

uint64_t sub_19365EF2C()
{
  OUTLINED_FUNCTION_10_0();
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v2 = *(void *)(v1 + 16);
  *(void *)(v0 + 88) = v2;
  if (v2)
  {
    uint64_t v3 = *(void *)(v0 + 80);
    uint64_t v4 = OBJC_IVAR____RTCReportingS_session;
    *(void *)(v0 + 96) = OBJC_IVAR____RTCReportingS_session;
    *(void *)(v0 + 104) = 0;
    uint64_t v5 = *(void *)(v1 + 32);
    *(void *)(v0 + 112) = v5;
    uint64_t v6 = *(void *)(v3 + v4);
    *(void *)(v0 + 120) = v6;
    uint64_t result = swift_bridgeObjectRetain();
    if (v6)
    {
      char v8 = *(unsigned char *)(result + 40);
      *(void *)(v0 + 40) = v5;
      *(unsigned char *)(v0 + 48) = v8;
      swift_bridgeObjectRetain();
      swift_retain();
      id v9 = (void *)swift_task_alloc();
      *(void *)(v0 + 128) = v9;
      *id v9 = v0;
      v9[1] = sub_19365F050;
      return sub_19364B1E8();
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    OUTLINED_FUNCTION_8_0();
    return v10();
  }
  return result;
}

uint64_t sub_19365F050()
{
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v5 = v4;
  *(void *)(v3 + 136) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_42();
  return MEMORY[0x1F4188298](v6, v7, v8);
}

uint64_t sub_19365F154()
{
  OUTLINED_FUNCTION_10_0();
  uint64_t v1 = *(void *)(v0 + 104) + 1;
  if (v1 == *(void *)(v0 + 88))
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_8_0();
    return v2();
  }
  else
  {
    *(void *)(v0 + 104) = v1;
    uint64_t v4 = *(void *)(v0 + 96);
    uint64_t v5 = *(void *)(v0 + 80);
    uint64_t v6 = *(void *)(v0 + 72) + 16 * v1;
    uint64_t v8 = *(void *)(v6 + 32);
    uint64_t v7 = v6 + 32;
    uint64_t result = v8;
    *(void *)(v0 + 112) = v8;
    uint64_t v9 = *(void *)(v5 + v4);
    *(void *)(v0 + 120) = v9;
    if (v9)
    {
      char v10 = *(unsigned char *)(v7 + 8);
      *(void *)(v0 + 40) = result;
      *(unsigned char *)(v0 + 48) = v10;
      swift_bridgeObjectRetain();
      swift_retain();
      uint64_t v11 = (void *)swift_task_alloc();
      *(void *)(v0 + 128) = v11;
      *uint64_t v11 = v0;
      v11[1] = sub_19365F050;
      return sub_19364B1E8();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_19365F27C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_35_0();
  a21 = v23;
  a22 = v24;
  OUTLINED_FUNCTION_27_1();
  a20 = v22;
  swift_bridgeObjectRelease();
  if (qword_1EB4B2F10 != -1) {
    swift_once();
  }
  uint64_t v25 = *(void **)(v22 + 136);
  uint64_t v26 = sub_193668418();
  __swift_project_value_buffer(v26, (uint64_t)qword_1EB4B2ED8);
  id v27 = v25;
  id v28 = v25;
  uint64_t v29 = sub_1936683F8();
  os_log_type_t v30 = sub_193668668();
  BOOL v31 = os_log_type_enabled(v29, v30);
  uint64_t v32 = *(void **)(v22 + 136);
  if (v31)
  {
    a10 = v22 + 64;
    uint64_t v33 = (uint8_t *)OUTLINED_FUNCTION_33_0();
    a11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v33 = 136315138;
    swift_getErrorValue();
    uint64_t v34 = sub_1936688F8();
    *(void *)(v22 + 64) = sub_19365B4D8(v34, v35, &a11);
    sub_1936686E8();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_193646000, v29, v30, "error sending deferred-from-unconfigured events: %s", v33, 0xCu);
    OUTLINED_FUNCTION_34_0();
    OUTLINED_FUNCTION_14();
    OUTLINED_FUNCTION_14();
  }
  else
  {
  }
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_10_1();
  return v37(v36, v37, v38, v39, v40, v41, v42, v43, a9, a10, a11, a12, a13, a14);
}

uint64_t _RTCReportingS.fetchReportingStates(userInfo:fetchComplete:)(uint64_t a1, void (*a2)(uint64_t), uint64_t a3)
{
  swift_getObjectType();
  uint64_t v7 = *(os_unfair_lock_s **)&v3[OBJC_IVAR____RTCReportingS_lock];
  uint64_t v17 = v3;
  uint64_t v18 = a1;
  sub_193648900((uint64_t)sub_193662E60, (uint64_t)v16, v7);
  if (!*(void *)(v8 + 16))
  {
    swift_bridgeObjectRelease();
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = a2;
    *(void *)(v12 + 24) = a3;
    *(void *)(v12 + 32) = v3;
    sub_193654BEC((uint64_t)a2);
    id v13 = v3;
    _RTCReportingS.startConfiguration(completionHandler:)(sub_193662EDC, (os_unfair_lock_s *)v12);
    return swift_release();
  }
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  MEMORY[0x1F4188790](v9);
  os_unfair_lock_lock(v7 + 4);
  sub_193654444();
  os_unfair_lock_unlock(v7 + 4);
  uint64_t result = swift_bridgeObjectRelease();
  if (!a2) {
    return result;
  }
  if (*(void *)&v3[OBJC_IVAR____RTCReportingS_session])
  {
    if (v3[OBJC_IVAR____RTCReportingS_completelyDisabled] != 1)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B29C0);
      uint64_t v14 = swift_allocObject();
      uint64_t v15 = MEMORY[0x1E4FBB1A0];
      *(_OWORD *)(v14 + 16) = xmmword_19366AD30;
      *(void *)(v14 + 56) = v15;
      *(void *)(v14 + 32) = 120;
      *(void *)(v14 + 40) = 0xE100000000000000;
      sub_193654BEC((uint64_t)a2);
      a2(v14);
      swift_bridgeObjectRelease();
      return sub_19364ACA4((uint64_t)a2);
    }
    swift_retain();
    uint64_t v11 = 0;
  }
  else
  {
    swift_retain();
    uint64_t v11 = MEMORY[0x1E4FBC860];
  }
  a2(v11);
  return sub_19364ACA4((uint64_t)a2);
}

uint64_t sub_19365F6B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = (uint64_t *)(a1 + OBJC_IVAR____RTCReportingS_userInfo);
  swift_beginAccess();
  uint64_t v6 = *v5;
  *uint64_t v5 = a2;
  *a3 = v6;
  return swift_bridgeObjectRetain();
}

void sub_19365F724(uint64_t a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4)
{
  if (!a2) {
    return;
  }
  if (*(void *)(a4 + OBJC_IVAR____RTCReportingS_session))
  {
    if (*(unsigned char *)(a4 + OBJC_IVAR____RTCReportingS_completelyDisabled) != 1)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B29C0);
      uint64_t v6 = swift_allocObject();
      uint64_t v7 = MEMORY[0x1E4FBB1A0];
      *(_OWORD *)(v6 + 16) = xmmword_19366AD30;
      *(void *)(v6 + 56) = v7;
      *(void *)(v6 + 32) = 120;
      *(void *)(v6 + 40) = 0xE100000000000000;
      sub_193654BEC((uint64_t)a2);
      a2(v6);
      swift_bridgeObjectRelease();
      goto LABEL_9;
    }
    swift_retain();
    uint64_t v5 = 0;
  }
  else
  {
    swift_retain();
    uint64_t v5 = MEMORY[0x1E4FBC860];
  }
  a2(v5);
LABEL_9:
  sub_19364ACA4((uint64_t)a2);
}

uint64_t sub_19365F820(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_193668418();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_193650ED4(a1, &v42);
  if (!v43)
  {
    sub_1936530CC((uint64_t)&v42, &qword_1EB4B2E90);
    goto LABEL_12;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    int v18 = 0;
    goto LABEL_21;
  }
  uint64_t v44 = v7;
  uint64_t v11 = v40;
  uint64_t v10 = v41;
  uint64_t v12 = (uint64_t *)&a2[OBJC_IVAR____RTCReportingS_userInfo];
  swift_beginAccess();
  sub_193650ED4(*v12, &v42);
  swift_endAccess();
  if (v43)
  {
    uint64_t v13 = MEMORY[0x1E4FBB1A0];
    if (swift_dynamicCast())
    {
      uint64_t v38 = v6;
      uint64_t v39 = v2;
      uint64_t v15 = v40;
      uint64_t v14 = v41;
      if (v11 == v40 && v10 == v41)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v17 = sub_193668878();
        swift_bridgeObjectRelease();
        if ((v17 & 1) == 0)
        {
          uint64_t v43 = v13;
          *(void *)&long long v42 = v15;
          *((void *)&v42 + 1) = v14;
          swift_beginAccess();
          sub_19365938C((uint64_t)&v42);
          swift_endAccess();
          int v18 = 1;
          goto LABEL_19;
        }
        swift_bridgeObjectRelease();
      }
      int v18 = 0;
LABEL_19:
      uint64_t v6 = v38;
      uint64_t v3 = v39;
      goto LABEL_20;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_1936530CC((uint64_t)&v42, &qword_1EB4B2E90);
  }
  int v18 = 0;
LABEL_20:
  uint64_t v7 = v44;
LABEL_21:
  sub_193650ED4(a1, &v42);
  if (!v43)
  {
    sub_1936530CC((uint64_t)&v42, &qword_1EB4B2E90);
LABEL_32:
    if (!v18) {
      goto LABEL_50;
    }
    goto LABEL_39;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_32;
  }
  uint64_t v44 = v7;
  uint64_t v20 = v40;
  uint64_t v19 = v41;
  unint64_t v21 = (uint64_t *)&a2[OBJC_IVAR____RTCReportingS_userInfo];
  swift_beginAccess();
  sub_193650ED4(*v21, &v42);
  swift_endAccess();
  if (!v43)
  {
    swift_bridgeObjectRelease();
    sub_1936530CC((uint64_t)&v42, &qword_1EB4B2E90);
    goto LABEL_38;
  }
  uint64_t v22 = MEMORY[0x1E4FBB1A0];
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_38;
  }
  uint64_t v38 = v6;
  uint64_t v39 = v3;
  uint64_t v24 = v40;
  uint64_t v23 = v41;
  if (v20 == v40 && v19 == v41)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_37;
  }
  char v26 = sub_193668878();
  swift_bridgeObjectRelease();
  if (v26)
  {
    swift_bridgeObjectRelease();
LABEL_37:
    uint64_t v6 = v38;
    uint64_t v3 = v39;
LABEL_38:
    uint64_t v7 = v44;
    if (!v18) {
      goto LABEL_50;
    }
    goto LABEL_39;
  }
  uint64_t v43 = v22;
  *(void *)&long long v42 = v24;
  *((void *)&v42 + 1) = v23;
  swift_beginAccess();
  sub_19365938C((uint64_t)&v42);
  swift_endAccess();
  uint64_t v6 = v38;
  uint64_t v3 = v39;
  uint64_t v7 = v44;
LABEL_39:
  if (qword_1EB4B2DF8 != -1) {
    swift_once();
  }
  if (byte_1EB4B30C8 == 1)
  {
    if (qword_1EB4B2F10 != -1) {
      swift_once();
    }
    uint64_t v27 = __swift_project_value_buffer(v6, (uint64_t)qword_1EB4B2ED8);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v27, v6);
    id v28 = a2;
    uint64_t v29 = sub_1936683F8();
    os_log_type_t v30 = sub_193668668();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v44 = v7;
      uint64_t v38 = v6;
      uint64_t v39 = v3;
      BOOL v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      *(void *)&long long v42 = v32;
      *(_DWORD *)BOOL v31 = 136446210;
      if (*(void *)&v28[OBJC_IVAR____RTCReportingS_generatedSessionID + 8])
      {
        uint64_t v33 = *(void *)&v28[OBJC_IVAR____RTCReportingS_generatedSessionID];
        unint64_t v34 = *(void *)&v28[OBJC_IVAR____RTCReportingS_generatedSessionID + 8];
      }
      else
      {
        unint64_t v34 = 0xE100000000000000;
        uint64_t v33 = 63;
      }
      swift_bridgeObjectRetain();
      uint64_t v40 = sub_19365B4D8(v33, v34, (uint64_t *)&v42);
      sub_1936686E8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_193646000, v29, v30, "tried to change identifiers for existing session: %{public}s", v31, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1997002F0](v32, -1, -1);
      MEMORY[0x1997002F0](v31, -1, -1);

      (*(void (**)(char *, uint64_t))(v44 + 8))(v9, v38);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
  }
LABEL_50:
  swift_beginAccess();
  uint64_t v35 = swift_bridgeObjectRetain();
  sub_193649654(v35);
  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> _RTCReportingS.sendMessage(category:type:payload:)(Swift::UInt16 category, Swift::UInt16 type, Swift::OpaquePointer_optional payload)
{
  rawValue = payload.value._rawValue;
  dictionary = (void *)sub_1936684A8();
  LOWORD(v40) = category;
  uint64_t v12 = OUTLINED_FUNCTION_44((uint64_t)dictionary, 0xD000000000000012, v6, v7, v8, v9, v10, v11, v40);
  uint64_t v13 = sub_19365938C((uint64_t)v12);
  LOWORD(v41) = type;
  unint64_t v21 = OUTLINED_FUNCTION_19_1(v13, v14, v15, v16, v17, v18, v19, v20, v41);
  sub_19365938C((uint64_t)v21);
  if (rawValue)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2E18);
    uint64_t v42 = (uint64_t)rawValue;
  }
  else
  {
    uint64_t v42 = 0;
  }
  uint64_t v22 = swift_bridgeObjectRetain();
  os_log_type_t v30 = OUTLINED_FUNCTION_44(v22, v23, v24, v25, v26, v27, v28, v29, v42);
  uint64_t v31 = sub_19365938C((uint64_t)v30);
  uint64_t v39 = OUTLINED_FUNCTION_19_1(v31, v32, v33, v34, v35, v36, v37, v38, 0);
  sub_19365938C((uint64_t)v39);
  v44.value._rawValue = dictionary;
  _RTCReportingS.sendMessage(dictionary:)(v44);
  swift_bridgeObjectRelease();
}

uint64_t sub_193660220(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E93283D0);
    uint64_t v2 = sub_193668838();
  }
  else
  {
    uint64_t v2 = MEMORY[0x1E4FBC868];
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
  if (!v5) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v9 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v10 = v9 | (v8 << 6);
  while (1)
  {
    uint64_t v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    sub_193650D18(*(void *)(a1 + 56) + 32 * v10, (uint64_t)v40);
    *(void *)&long long v39 = v17;
    *((void *)&v39 + 1) = v16;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v17;
    *((void *)&v37[0] + 1) = v16;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_193650D74(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_193650D74(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_193650D74(v36, v37);
    sub_193650D74(v37, &v33);
    uint64_t result = sub_193668768();
    uint64_t v18 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v19 = result & ~v18;
    unint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~*(void *)(v6 + 8 * (v19 >> 6))) == 0)
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v18) >> 6;
      while (++v20 != v23 || (v22 & 1) == 0)
      {
        BOOL v24 = v20 == v23;
        if (v20 == v23) {
          unint64_t v20 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v6 + 8 * v20);
        if (v25 != -1)
        {
          unint64_t v21 = __clz(__rbit64(~v25)) + (v20 << 6);
          goto LABEL_34;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    unint64_t v21 = __clz(__rbit64((-1 << v19) & ~*(void *)(v6 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(void *)(v6 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t v26 = *(void *)(v2 + 48) + 40 * v21;
    *(_OWORD *)uint64_t v26 = v29;
    *(_OWORD *)(v26 + 16) = v30;
    *(void *)(v26 + 32) = v31;
    uint64_t result = (uint64_t)sub_193650D74(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v21));
    ++*(void *)(v2 + 16);
    if (v5) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1)) {
      goto LABEL_38;
    }
    if (v11 >= v27) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v11);
    int64_t v13 = v8 + 1;
    if (!v12)
    {
      int64_t v13 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_36;
      }
      unint64_t v12 = *(void *)(v28 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_36;
        }
        unint64_t v12 = *(void *)(v28 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_36;
          }
          unint64_t v12 = *(void *)(v28 + 8 * v13);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_24:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v8 = v13;
  }
  int64_t v14 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_36:
    swift_release();
    sub_193664660();
    return v2;
  }
  unint64_t v12 = *(void *)(v28 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v8 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v27) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_24;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_1936605E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_35_0();
  a21 = v23;
  a22 = v24;
  OUTLINED_FUNCTION_27_1();
  a20 = v22;
  if (qword_1EB4B2F10 != -1) {
    swift_once();
  }
  uint64_t v25 = *(void **)(v22 + 88);
  uint64_t v26 = sub_193668418();
  __swift_project_value_buffer(v26, (uint64_t)qword_1EB4B2ED8);
  id v27 = v25;
  id v28 = v25;
  long long v29 = sub_1936683F8();
  os_log_type_t v30 = sub_193668668();
  BOOL v31 = os_log_type_enabled(v29, v30);
  uint64_t v32 = *(void **)(v22 + 88);
  if (v31)
  {
    a9 = v22 + 64;
    OUTLINED_FUNCTION_33_0();
    a10 = swift_slowAlloc();
    OUTLINED_FUNCTION_22_1(4.8751e-34);
    uint64_t v33 = sub_1936688F8();
    *(void *)(v22 + 64) = sub_19365B4D8(v33, v34, &a10);
    sub_1936686E8();
    swift_bridgeObjectRelease();

    OUTLINED_FUNCTION_48(&dword_193646000, v35, v36, "failed to send legacy message: %{public}s");
    OUTLINED_FUNCTION_34_0();
    OUTLINED_FUNCTION_14();
    OUTLINED_FUNCTION_14();
  }
  else
  {
  }
  uint64_t v37 = *(void *)(v22 + 72);
  uint64_t v38 = *(os_unfair_lock_s **)(v37 + OBJC_IVAR____RTCReportingS_lock);
  uint64_t v39 = swift_task_alloc();
  *(void *)(v39 + 16) = v37;
  uint64_t v40 = swift_task_alloc();
  *(void *)(v40 + 16) = sub_193664D54;
  *(void *)(v40 + 24) = v39;
  os_unfair_lock_lock(v38 + 4);
  sub_193654444();
  os_unfair_lock_unlock(v38 + 4);

  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_10_1();
  return v42(v41, v42, v43, v44, v45, v46, v47, v48, a9, a10, a11, a12, a13, a14);
}

Swift::Void __swiftcall _RTCReportingS.flushMessages()()
{
  swift_getObjectType();
  OUTLINED_FUNCTION_28_1(*(os_unfair_lock_s **)(v1 + OBJC_IVAR____RTCReportingS_lock));
  OUTLINED_FUNCTION_45();
  sub_193654444();
  os_unfair_lock_unlock(v0);
}

void sub_193660898(uint64_t a1)
{
  if (!*(void *)(a1 + OBJC_IVAR____RTCReportingS_session))
  {
    if (qword_1EB4B2F10 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_193668418();
    __swift_project_value_buffer(v1, (uint64_t)qword_1EB4B2ED8);
    uint64_t v2 = sub_1936683F8();
    os_log_type_t v3 = sub_193668668();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_193646000, v2, v3, "attempted to flush unconfigured session", v4, 2u);
      MEMORY[0x1997002F0](v4, -1, -1);
    }
  }
}

void _RTCReportingS.flushMessages(completion:)(uint64_t a1, os_unfair_lock_s *a2)
{
  swift_getObjectType();
  OUTLINED_FUNCTION_28_1(*(os_unfair_lock_s **)(v2 + OBJC_IVAR____RTCReportingS_lock));
  OUTLINED_FUNCTION_45();
  sub_193654444();
  os_unfair_lock_unlock(a2);
}

void sub_193660A4C(uint64_t a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2EB8);
  MEMORY[0x1F4188790](v6 - 8);
  int64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(a1 + OBJC_IVAR____RTCReportingS_session);
  if (v9)
  {
    if (*(unsigned char *)(a1 + OBJC_IVAR____RTCReportingS_completelyDisabled))
    {
      if (!a2) {
        return;
      }
      swift_retain();
      sub_193654BEC((uint64_t)a2);
      ((void (*)(void))a2)(0);
      swift_release();
      goto LABEL_11;
    }
    if (a2)
    {
      swift_retain();
      sub_193654BEC((uint64_t)a2);
      sub_1936685D8();
      uint64_t v17 = sub_1936685F8();
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v17);
      uint64_t v18 = (void *)swift_allocObject();
      void v18[2] = 0;
      v18[3] = 0;
      v18[4] = v9;
      void v18[5] = a2;
      v18[6] = a3;
      swift_retain();
      sub_193654BEC((uint64_t)a2);
      sub_19364B374((uint64_t)v8, (uint64_t)&unk_1E93283C8, (uint64_t)v18);
      swift_release();
      sub_19364ACA4((uint64_t)a2);
      swift_release();
      sub_1936530CC((uint64_t)v8, &qword_1EB4B2EB8);
    }
  }
  else
  {
    if (qword_1EB4B2F10 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_193668418();
    __swift_project_value_buffer(v10, (uint64_t)qword_1EB4B2ED8);
    int64_t v11 = sub_1936683F8();
    os_log_type_t v12 = sub_193668668();
    if (os_log_type_enabled(v11, v12))
    {
      int64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int64_t v13 = 0;
      _os_log_impl(&dword_193646000, v11, v12, "attempted to flush unconfigured session", v13, 2u);
      MEMORY[0x1997002F0](v13, -1, -1);
    }

    if (a2)
    {
      sub_193662EE8();
      int64_t v14 = (void *)swift_allocError();
      unsigned char *v15 = 1;
      swift_retain();
      uint64_t v16 = (void *)sub_1936682A8();
      a2();

LABEL_11:
      sub_19364ACA4((uint64_t)a2);
    }
  }
}

uint64_t sub_193660D04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return MEMORY[0x1F4188298](sub_193660D28, 0, 0);
}

uint64_t sub_193660D28()
{
  OUTLINED_FUNCTION_29_0();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_retain();
  return MEMORY[0x1F4188298](sub_193660D94, v1, 0);
}

uint64_t sub_193660D94()
{
  OUTLINED_FUNCTION_10_0();
  uint64_t v2 = (void (*)(void))v0[3];
  uint64_t v1 = v0[4];
  uint64_t v3 = v0[2];
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = v1;
  if (*(void *)(v3 + 344))
  {
    swift_retain();
    swift_retain();
    sub_19365A83C((uint64_t)sub_193663F38, v4);
  }
  else
  {
    swift_retain();
    v2(0);
  }
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_8_0();
  return v5();
}

uint64_t static _RTCReportingS.getPersistentIdentifierForDNU(_:)()
{
  return 0;
}

void static _RTCReportingS.sendOneMessage(sessionInfo:userInfo:category:type:payload:)(uint64_t a1, uint64_t a2, __int16 a3, __int16 a4, uint64_t a5)
{
  id v11 = objc_allocWithZone(v5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v12 = _RTCReportingS.init(sessionInfo:userInfo:frameworksToCheck:)(a1, a2, 0);
  if (v12)
  {
    int64_t v13 = v12;
    uint64_t v14 = swift_allocObject();
    *(_WORD *)(v14 + 16) = a3;
    *(_WORD *)(v14 + 18) = a4;
    *(void *)(v14 + 24) = a5;
    *(void *)(v14 + 32) = v13;
    swift_bridgeObjectRetain();
    uint64_t v15 = v13;
    _RTCReportingS.startConfiguration(completionHandler:)(sub_193662FA4, (os_unfair_lock_s *)v14);
    swift_release();
  }
  else
  {
    if (qword_1EB4B2F10 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_193668418();
    __swift_project_value_buffer(v16, (uint64_t)qword_1EB4B2ED8);
    uint64_t v15 = sub_1936683F8();
    os_log_type_t v17 = sub_193668668();
    if (os_log_type_enabled(v15, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_193646000, v15, v17, "failed to create session for sendOneMessage", v18, 2u);
      MEMORY[0x1997002F0](v18, -1, -1);
    }
  }
}

void sub_19366111C(uint64_t a1, Swift::UInt16 category, Swift::UInt16 type, Swift::OpaquePointer_optional payload)
{
  if (a1)
  {
    uint64_t v7 = v6;
    _RTCReportingS.sendMessage(category:type:payload:)(category, type, *(Swift::OpaquePointer_optional *)(&v6 - 1));
    if (v8)
    {
      if (qword_1EB4B2F10 != -1) {
        swift_once();
      }
      uint64_t v9 = sub_193668418();
      __swift_project_value_buffer(v9, (uint64_t)qword_1EB4B2ED8);
      id v10 = v8;
      id v11 = v8;
      oslog = sub_1936683F8();
      os_log_type_t v12 = sub_193668668();
      if (os_log_type_enabled(oslog, v12))
      {
        int64_t v13 = (uint8_t *)swift_slowAlloc();
        uint64_t v14 = swift_slowAlloc();
        uint64_t v18 = v14;
        *(_DWORD *)int64_t v13 = 136446210;
        swift_getErrorValue();
        uint64_t v15 = sub_1936688F8();
        sub_19365B4D8(v15, v16, &v18);
        sub_1936686E8();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_193646000, oslog, v12, "sendOneMessage failed: %{public}s", v13, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1997002F0](v14, -1, -1);
        MEMORY[0x1997002F0](v13, -1, -1);
      }
      else
      {
      }
    }
  }
}

uint64_t static _RTCReportingS.createEphemeralSession(sessionInfo:userInfo:)()
{
  return 0;
}

uint64_t static _RTCReportingS.closeEphemeralSessiont(sessionId:)()
{
  return 0;
}

Swift::Void __swiftcall _RTCReportingS.updateSharedData(dictionary:)(Swift::OpaquePointer dictionary)
{
  if (qword_1EB4B2F10 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_193668418();
  __swift_project_value_buffer(v1, (uint64_t)qword_1EB4B2ED8);
  oslog = sub_1936683F8();
  os_log_type_t v2 = sub_193668678();
  if (os_log_type_enabled(oslog, v2))
  {
    *(_WORD *)swift_slowAlloc() = 0;
    OUTLINED_FUNCTION_47(&dword_193646000, v3, v4, "updateSharedData is deprecated", v5, v6, v7, v8, v9, oslog);
    OUTLINED_FUNCTION_14();
  }
}

Swift::Void __swiftcall _RTCReportingS.updateSharedData(key:value:)(Swift::String key, NSObject value)
{
  if (qword_1EB4B2F10 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_193668418();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EB4B2ED8);
  oslog = sub_1936683F8();
  os_log_type_t v3 = sub_193668678();
  if (os_log_type_enabled(oslog, v3))
  {
    *(_WORD *)swift_slowAlloc() = 0;
    OUTLINED_FUNCTION_47(&dword_193646000, v4, v5, "updateSharedData is deprecated", v6, v7, v8, v9, v10, oslog);
    OUTLINED_FUNCTION_14();
  }
}

void sub_1936617B4()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(v0 + OBJC_IVAR____RTCReportingS_lock) + 16);
  os_unfair_lock_lock(v1);
  sub_193654444();
  os_unfair_lock_unlock(v1);
}

void sub_193661828(char *a1)
{
  uint64_t v1 = OBJC_IVAR____RTCReportingS_deprecatedPeriodic;
  if (!*(void *)&a1[OBJC_IVAR____RTCReportingS_deprecatedPeriodic])
  {
    v7[3] = swift_getObjectType();
    v7[0] = a1;
    id v3 = objc_allocWithZone((Class)RTCReportingAVCDeprecatedPeriodic);
    int v4 = a1;
    id v5 = sub_193662DF4(v7);
    int v6 = *(void **)&a1[v1];
    *(void *)&a1[v1] = v5;
  }
}

Swift::Void __swiftcall _RTCReportingS.startLogTimer(interval:reportingMultiplier:category:type:)(Swift::Int32 interval, Swift::Int32 reportingMultiplier, Swift::UInt16 category, Swift::UInt16 type)
{
  uint64_t v7 = *(void *)&reportingMultiplier;
  uint64_t v8 = *(void *)&interval;
  sub_1936617B4();
  int v9 = *(void **)(v4 + OBJC_IVAR____RTCReportingS_deprecatedPeriodic);
  if (v9)
  {
    objc_msgSend(v9, sel_startLogTimerWithInterval_reportingMultiplier_category_type_, v8, v7, category, type);
  }
  else
  {
    __break(1u);
  }
}

Swift::Void __swiftcall _RTCReportingS.stopLogTimer()()
{
  sub_1936617B4();
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____RTCReportingS_deprecatedPeriodic);
  if (v1)
  {
    objc_msgSend(v1, sel_stopLogTimer);
  }
  else
  {
    __break(1u);
  }
}

void _RTCReportingS.registerPeriodicTask(module:needToUpdate:needToReport:serviceBlock:)(uint64_t a1, char a2, char a3, uint64_t a4, uint64_t a5)
{
  sub_1936617B4();
  id v11 = *(void **)(v5 + OBJC_IVAR____RTCReportingS_deprecatedPeriodic);
  if (v11)
  {
    v14[4] = a4;
    v14[5] = a5;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 1107296256;
    v14[2] = sub_193661B2C;
    v14[3] = &block_descriptor_0;
    os_log_type_t v12 = _Block_copy(v14);
    id v13 = v11;
    swift_retain();
    swift_release();
    objc_msgSend(v13, sel_registerPeriodicTaskForModule_needToUpdate_needToReport_serviceBlock_, a1, a2 & 1, a3 & 1, v12);
    _Block_release(v12);
  }
  else
  {
    __break(1u);
  }
}

void sub_193661B2C(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

Swift::Void __swiftcall _RTCReportingS.unregisterPeriodicTask(module:)(Swift::UInt32 module)
{
  uint64_t v2 = *(void *)&module;
  sub_1936617B4();
  id v3 = *(void **)(v1 + OBJC_IVAR____RTCReportingS_deprecatedPeriodic);
  if (v3)
  {
    objc_msgSend(v3, sel_unregisterPeriodTaskForModule_, v2);
  }
  else
  {
    __break(1u);
  }
}

Swift::Bool __swiftcall _RTCReportingS.serverSupportsFileUpload()()
{
  return 0;
}

uint64_t _s12RTCReporting01_A1SC10uploadFile3URL17completionHandlerSbSo5NSURLC_ySb_So7NSErrorCSgtcSgtF_0(uint64_t a1, void (*a2)(void, void))
{
  if (a2)
  {
    swift_retain();
    a2(0, 0);
    sub_19364ACA4((uint64_t)a2);
  }
  return 0;
}

uint64_t _RTCReportingS.setDigestKey(_:algorithm:)()
{
  return 0;
}

void _RTCReportingS.terminateSession(completion:)(uint64_t a1, os_unfair_lock_s *a2)
{
  swift_getObjectType();
  OUTLINED_FUNCTION_28_1(*(os_unfair_lock_s **)(v2 + OBJC_IVAR____RTCReportingS_lock));
  OUTLINED_FUNCTION_45();
  sub_193654444();
  os_unfair_lock_unlock(a2);
}

void sub_193661F44(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_193668418();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2EB8);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v41 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1[OBJC_IVAR____RTCReportingS_terminated])
  {
    uint64_t v40 = a2;
    if (qword_1EB4B2F10 != -1) {
      swift_once();
    }
    uint64_t v13 = __swift_project_value_buffer(v7, (uint64_t)qword_1EB4B2ED8);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v13, v7);
    uint64_t v14 = a1;
    uint64_t v15 = sub_1936683F8();
    os_log_type_t v16 = sub_193668668();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v38 = a3;
      uint64_t v39 = v3;
      os_log_type_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      uint64_t v43 = v37;
      *(_DWORD *)os_log_type_t v17 = 136315138;
      if (*(void *)&v14[OBJC_IVAR____RTCReportingS_generatedSessionID + 8])
      {
        uint64_t v18 = *(void *)&v14[OBJC_IVAR____RTCReportingS_generatedSessionID];
        unint64_t v19 = *(void *)&v14[OBJC_IVAR____RTCReportingS_generatedSessionID + 8];
      }
      else
      {
        unint64_t v19 = 0xE100000000000000;
        uint64_t v18 = 63;
      }
      swift_bridgeObjectRetain();
      uint64_t v42 = sub_19365B4D8(v18, v19, &v43);
      sub_1936686E8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_193646000, v15, v16, "attempted to terminate already-ended session %s", v17, 0xCu);
      uint64_t v33 = v37;
      swift_arrayDestroy();
      MEMORY[0x1997002F0](v33, -1, -1);
      MEMORY[0x1997002F0](v17, -1, -1);

      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      a3 = v38;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    }
    uint64_t v34 = v40;
    uint64_t v22 = (uint64_t)v41;
    if (v40)
    {
      swift_retain();
      sub_1936685D8();
      uint64_t v35 = sub_1936685F8();
      __swift_storeEnumTagSinglePayload(v22, 0, 1, v35);
      uint64_t v36 = (void *)swift_allocObject();
      _OWORD v36[2] = 0;
      v36[3] = 0;
      v36[4] = v34;
      v36[5] = a3;
      swift_retain();
      sub_19364B374(v22, (uint64_t)&unk_1E93283B8, (uint64_t)v36);
      swift_release();
      uint64_t v32 = v34;
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v20 = *(void *)&a1[OBJC_IVAR____RTCReportingS_session];
    if (v20)
    {
      a1[OBJC_IVAR____RTCReportingS_terminated] = 1;
      uint64_t v21 = swift_retain();
      sub_193648138(v21);
      uint64_t v22 = (uint64_t)v41;
      sub_1936685D8();
      uint64_t v23 = sub_1936685F8();
      __swift_storeEnumTagSinglePayload(v22, 0, 1, v23);
      uint64_t v24 = (void *)swift_allocObject();
      _OWORD v24[2] = 0;
      v24[3] = 0;
      v24[4] = v20;
      v24[5] = a2;
      v24[6] = a3;
      swift_retain();
      sub_193654BEC(a2);
      sub_19364B374(v22, (uint64_t)&unk_1E93283A8, (uint64_t)v24);
      swift_release();
      swift_release();
LABEL_21:
      sub_1936530CC(v22, &qword_1EB4B2EB8);
      return;
    }
    if (qword_1EB4B2F10 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v7, (uint64_t)qword_1EB4B2ED8);
    uint64_t v25 = sub_1936683F8();
    os_log_type_t v26 = sub_193668668();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = a3;
      id v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v28 = 0;
      _os_log_impl(&dword_193646000, v25, v26, "attempted to terminate session that never started", v28, 2u);
      long long v29 = v28;
      a3 = v27;
      MEMORY[0x1997002F0](v29, -1, -1);
    }

    uint64_t v22 = (uint64_t)v41;
    if (a2)
    {
      swift_retain();
      sub_1936685D8();
      uint64_t v30 = sub_1936685F8();
      __swift_storeEnumTagSinglePayload(v22, 0, 1, v30);
      BOOL v31 = (void *)swift_allocObject();
      v31[2] = 0;
      v31[3] = 0;
      v31[4] = a2;
      v31[5] = a3;
      swift_retain();
      sub_19364B374(v22, (uint64_t)&unk_1E9328398, (uint64_t)v31);
      swift_release();
      uint64_t v32 = a2;
LABEL_20:
      sub_19364ACA4(v32);
      goto LABEL_21;
    }
  }
}

uint64_t sub_1936624E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  return MEMORY[0x1F4188298](sub_1936653B8, 0, 0);
}

uint64_t sub_193662508(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  return MEMORY[0x1F4188298](sub_193662528, 0, 0);
}

uint64_t sub_193662528()
{
  OUTLINED_FUNCTION_29_0();
  (*(void (**)(void))(v0 + 16))();
  OUTLINED_FUNCTION_8_0();
  return v1();
}

uint64_t sub_193662584(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[2] = a5;
  v6[3] = a6;
  uint64_t v7 = (void *)swift_task_alloc();
  v6[4] = v7;
  *uint64_t v7 = v6;
  v7[1] = sub_193662618;
  return sub_193654FFC();
}

uint64_t sub_193662618()
{
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_42();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1936626E0()
{
  OUTLINED_FUNCTION_29_0();
  uint64_t v1 = *(void (**)(uint64_t))(v0 + 16);
  if (v1)
  {
    uint64_t v2 = swift_retain();
    v1(v2);
    sub_19364ACA4((uint64_t)v1);
  }
  OUTLINED_FUNCTION_8_0();
  return v3();
}

void static _RTCReportingS.updateEarlyCacheLimit(newLimit:)(uint64_t a1)
{
  uint64_t v2 = (os_unfair_lock_s *)a1;
  if (qword_1EB4B2DE8 != -1) {
    a1 = swift_once();
  }
  MEMORY[0x1F4188790](a1);
  OUTLINED_FUNCTION_41();
  *(void *)(v3 - 16) = v1;
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_30_1();
  *(void *)(v5 - 16) = sub_193662FD0;
  *(void *)(v5 - 8) = v6;
  OUTLINED_FUNCTION_28_1(v7);
  sub_193654444();
  os_unfair_lock_unlock(v2);
}

void sub_1936628D4(uint64_t a1)
{
  qword_1E93282E0 = a1;
  if (qword_1EB4B2F10 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_193668418();
  __swift_project_value_buffer(v1, (uint64_t)qword_1EB4B2ED8);
  uint64_t v2 = sub_1936683F8();
  os_log_type_t v3 = sub_193668658();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 134217984;
    sub_1936686E8();
    _os_log_impl(&dword_193646000, v2, v3, "updating eventCache limit to %ld based on client request", v4, 0xCu);
    MEMORY[0x1997002F0](v4, -1, -1);
  }
}

id static _RTCReportingS._privacyLogs()()
{
  v20[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v1 = sub_193668328();
  OUTLINED_FUNCTION_1_2();
  uint64_t v3 = v2;
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_6();
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)v20 - v6;
  uint64_t v8 = (NSString *)sub_193668508();
  uint64_t v9 = NSHomeDirectoryForUser(v8);

  if (v9)
  {
    sub_193668518();
  }
  sub_1936682E8();
  swift_bridgeObjectRelease();
  sub_193668308();
  uint64_t v10 = *(void (**)(uint64_t))(v3 + 8);
  uint64_t v11 = OUTLINED_FUNCTION_16_1();
  v10(v11);
  char v12 = sub_193668318();
  if (v0)
  {

LABEL_8:
    id v17 = (id)MEMORY[0x1E4FBC860];
    goto LABEL_9;
  }
  if ((v12 & 1) == 0) {
    goto LABEL_8;
  }
  id v13 = objc_msgSend(self, sel_defaultManager);
  uint64_t v14 = (void *)sub_1936682F8();
  v20[0] = 0;
  id v15 = objc_msgSend(v13, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v14, 0, 0, v20);

  id v16 = v20[0];
  if (!v15)
  {
    id v17 = v20[0];
    sub_1936682B8();

    swift_willThrow();
    ((void (*)(char *, uint64_t))v10)(v7, v1);
    return v17;
  }
  id v17 = (id)sub_193668598();
  id v18 = v16;

LABEL_9:
  ((void (*)(char *, uint64_t))v10)(v7, v1);
  return v17;
}

id _RTCReportingS.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void _RTCReportingS.init()()
{
}

id sub_193662DF4(void *a1)
{
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  id v3 = objc_msgSend(v1, sel_initWithSession_, sub_193668868());
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v3;
}

uint64_t sub_193662E60@<X0>(void *a1@<X8>)
{
  return sub_19365F6B4(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_193662E7C()
{
  return sub_19365F820(*(void *)(v0 + 16), *(char **)(v0 + 24));
}

uint64_t sub_193662E9C()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  uint64_t v1 = OUTLINED_FUNCTION_25_1();
  return MEMORY[0x1F4186498](v1, v2, v3);
}

void sub_193662EDC(uint64_t a1)
{
  sub_19365F724(a1, *(void (**)(uint64_t))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

unint64_t sub_193662EE8()
{
  unint64_t result = qword_1EB4B29F0;
  if (!qword_1EB4B29F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB4B29F0);
  }
  return result;
}

void sub_193662F34()
{
  sub_193660898(*(void *)(v0 + 16));
}

void sub_193662F50()
{
  uint64_t v0 = OUTLINED_FUNCTION_37_0();
  sub_193660A4C(v0, v1, v2);
}

uint64_t sub_193662F6C()
{
  swift_bridgeObjectRelease();

  uint64_t v1 = OUTLINED_FUNCTION_25_1();
  return MEMORY[0x1F4186498](v1, v2, v3);
}

void sub_193662FA4(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 24);
  uint64_t v3 = *(void *)(v1 + 32);
  sub_19366111C(a1, *(_WORD *)(v1 + 16), *(_WORD *)(v1 + 18), *(Swift::OpaquePointer_optional *)&v2);
}

void sub_193662FB4()
{
  uint64_t v0 = (char *)OUTLINED_FUNCTION_37_0();
  sub_193661F44(v0, v1, v2);
}

void sub_193662FD0()
{
  sub_1936628D4(*(void *)(v0 + 16));
}

uint64_t method lookup function for _RTCReportingS(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for _RTCReportingS);
}

uint64_t dispatch thunk of _RTCReportingS.__allocating_init(sessionInfo:userInfo:frameworksToCheck:aggregationBlock:)()
{
  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t getEnumTagSinglePayload for _RTCReportingS.Error(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for _RTCReportingS.Error(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x193663180);
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

unsigned char *sub_1936631A8(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for _RTCReportingS.Error()
{
  return &type metadata for _RTCReportingS.Error;
}

unint64_t sub_1936631CC()
{
  unint64_t result = qword_1E9328368;
  if (!qword_1E9328368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1E9328368);
  }
  return result;
}

unint64_t sub_193663218()
{
  unint64_t result = qword_1EB4B29D0;
  if (!qword_1EB4B29D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB4B29D0);
  }
  return result;
}

unint64_t sub_193663264()
{
  unint64_t result = qword_1EB4B29D8;
  if (!qword_1EB4B29D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB4B29D8);
  }
  return result;
}

unint64_t sub_1936632B0()
{
  unint64_t result = qword_1EB4B29E8;
  if (!qword_1EB4B29E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB4B29E8);
  }
  return result;
}

uint64_t sub_1936632FC()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_193663334()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_193663344(char a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(v2 + 16) + 16))(*(void *)(v2 + 16), a1 & 1, a2);
}

uint64_t sub_193663360()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

void sub_193663374(uint64_t a1, unsigned __int16 a2, unsigned __int16 a3, uint64_t a4, double a5)
{
  sub_19365E9F0(a1, a2, a3, a4, *(void *)(v5 + 16), a5);
}

void sub_19366337C(uint64_t a1, uint64_t a2)
{
  sub_19365DFA0(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_193663384(uint64_t a1, uint64_t a2)
{
  int v3 = *(uint64_t (**)(void *))(v2 + 16);
  v5[0] = a1;
  v5[1] = a2;
  return v3(v5);
}

uint64_t sub_1936633BC(void *a1)
{
  return (*(uint64_t (**)(void, void))(v1 + 16))(*a1, a1[1]);
}

uint64_t sub_1936633EC()
{
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_25_1();
  return MEMORY[0x1F4186498](v0, v1, v2);
}

char *sub_193663424()
{
  uint64_t v1 = *v0;
  unint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v0 = v1;
  if (!result)
  {
    unint64_t result = sub_1936636DC(result, *(void *)(v1 + 16) + 1, 1, v1);
    *uint64_t v0 = (uint64_t)result;
  }
  return result;
}

char *sub_193663470(char *result)
{
  unint64_t v2 = *(void *)(*v1 + 24);
  if ((uint64_t)(result + 1) > (uint64_t)(v2 >> 1))
  {
    unint64_t result = sub_1936636DC((char *)(v2 > 1), (int64_t)(result + 1), 1, *v1);
    uint64_t *v1 = (uint64_t)result;
  }
  return result;
}

uint64_t sub_1936634B0(char a1, int64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_24;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    id v13 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B29C8);
  uint64_t v10 = *(void *)(type metadata accessor for EventValue() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  id v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_24:
    uint64_t result = sub_193668808();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for EventValue() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    sub_193663A24(a4 + v17, v8, v18);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1936637CC(0, v8, v18, a4);
  }
  return (uint64_t)v13;
}

char *sub_1936636DC(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_1EB4B2BC0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  unint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_193663B54((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_19366392C(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_1936637CC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for EventValue() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v12;
    }
  }
  uint64_t result = sub_193668848();
  __break(1u);
  return result;
}

uint64_t sub_19366392C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_193668848();
  __break(1u);
  return result;
}

uint64_t sub_193663A24(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    uint64_t v8 = sub_193668848();
    __break(1u);
    return MEMORY[0x1F4186420](v8, v9, v10, v7);
  }
  if (a3 < a1
    || (uint64_t result = type metadata accessor for EventValue(), a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    uint64_t v11 = type metadata accessor for EventValue();
    return MEMORY[0x1F4186428](a3, a1, a2, v11);
  }
  else if (a3 != a1)
  {
    uint64_t v7 = result;
    uint64_t v8 = a3;
    unint64_t v9 = a1;
    uint64_t v10 = a2;
    return MEMORY[0x1F4186420](v8, v9, v10, v7);
  }
  return result;
}

char *sub_193663B54(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_193668848();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_193663BEC()
{
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_12_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_2(v0);
  void *v1 = v2;
  v1[1] = sub_193654440;
  uint64_t v3 = OUTLINED_FUNCTION_3_1();
  return sub_193662508(v3, v4, v5, v6, v7);
}

uint64_t sub_193663C84()
{
  swift_unknownObjectRelease();
  swift_release();
  if (*(void *)(v0 + 40)) {
    swift_release();
  }
  uint64_t v1 = OUTLINED_FUNCTION_26_0();
  return MEMORY[0x1F4186498](v1, v2, v3);
}

uint64_t sub_193663CCC()
{
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_17_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_2(v0);
  void *v1 = v2;
  v1[1] = sub_193654440;
  uint64_t v3 = OUTLINED_FUNCTION_7_1();
  return sub_193662584(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_193663D68()
{
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_12_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_2(v0);
  void *v1 = v2;
  v1[1] = sub_193654440;
  uint64_t v3 = OUTLINED_FUNCTION_3_1();
  return sub_1936624E8(v3, v4, v5, v6, v7);
}

void sub_193663E00()
{
  sub_193661828(*(char **)(v0 + 16));
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_193663E60()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_26_0();
  return MEMORY[0x1F4186498](v0, v1, v2);
}

uint64_t sub_193663EA0()
{
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_17_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_2(v0);
  void *v1 = v2;
  v1[1] = sub_193654440;
  uint64_t v3 = OUTLINED_FUNCTION_7_1();
  return sub_193660D04(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_193663F38()
{
  return (*(uint64_t (**)(void))(v0 + 16))(0);
}

uint64_t sub_193663F64(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v10 = type metadata accessor for EventValue();
  uint64_t v46 = *(void *)(v10 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v10 - 8);
  uint64_t v44 = (uint64_t)v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  uint64_t v43 = (uint64_t)v42 - v14;
  MEMORY[0x1F4188790](v13);
  uint64_t v16 = (char *)v42 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2A08);
  MEMORY[0x1F4188790](v17 - 8);
  unint64_t v19 = (void *)((char *)v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_193664964(a1, a2, a3, &v45);
  v42[1] = a1;
  swift_bridgeObjectRetain();
  v42[0] = a3;
  swift_retain();
  sub_1936649A0((uint64_t)v19);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2A00);
  while (1)
  {
    if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v20) == 1)
    {
      swift_release();
      swift_bridgeObjectRelease();
      sub_193664660();
      return swift_release();
    }
    uint64_t v22 = *v19;
    uint64_t v21 = v19[1];
    sub_193652D08((uint64_t)v19 + *(int *)(v20 + 48), (uint64_t)v16);
    uint64_t v23 = *(void **)a5;
    unint64_t v25 = sub_193650F38();
    uint64_t v26 = v23[2];
    BOOL v27 = (v24 & 1) == 0;
    uint64_t v28 = v26 + v27;
    if (__OFADD__(v26, v27)) {
      break;
    }
    char v29 = v24;
    if (v23[3] >= v28)
    {
      if ((a4 & 1) == 0)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2EC0);
        sub_1936687E8();
      }
    }
    else
    {
      sub_1936642DC(v28, a4 & 1);
      unint64_t v30 = sub_193650F38();
      if ((v29 & 1) != (v31 & 1)) {
        goto LABEL_17;
      }
      unint64_t v25 = v30;
    }
    uint64_t v32 = *(void **)a5;
    if (v29)
    {
      uint64_t v33 = v32[7];
      unint64_t v34 = *(void *)(v46 + 72) * v25;
      uint64_t v35 = v44;
      sub_193652B74(v33 + v34, v44);
      uint64_t v36 = v43;
      sub_193652B74(v35, v43);
      sub_19364BBA8(v35);
      sub_19364BBA8((uint64_t)v16);
      swift_bridgeObjectRelease();
      sub_193664CF0(v36, *(void *)(*(void *)a5 + 56) + v34);
    }
    else
    {
      v32[(v25 >> 6) + 8] |= 1 << v25;
      uint64_t v37 = (void *)(v32[6] + 16 * v25);
      void *v37 = v22;
      v37[1] = v21;
      sub_193652D08((uint64_t)v16, v32[7] + *(void *)(v46 + 72) * v25);
      uint64_t v38 = v32[2];
      BOOL v39 = __OFADD__(v38, 1);
      uint64_t v40 = v38 + 1;
      if (v39) {
        goto LABEL_16;
      }
      _OWORD v32[2] = v40;
    }
    sub_1936649A0((uint64_t)v19);
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2A00);
    a4 = 1;
  }
  __break(1u);
LABEL_16:
  __break(1u);
LABEL_17:
  uint64_t result = sub_1936688C8();
  __break(1u);
  return result;
}

uint64_t sub_1936642DC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for EventValue();
  uint64_t v42 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5 - 8);
  OUTLINED_FUNCTION_23();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2A10);
  char v43 = a2;
  uint64_t v10 = sub_193668828();
  uint64_t v11 = v10;
  if (!*(void *)(v9 + 16)) {
    goto LABEL_40;
  }
  uint64_t v12 = 1 << *(unsigned char *)(v9 + 32);
  uint64_t v41 = v9 + 64;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  else {
    uint64_t v13 = -1;
  }
  uint64_t v14 = v13 & *(void *)(v9 + 64);
  BOOL v39 = v2;
  int64_t v40 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v15 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  if (!v14) {
    goto LABEL_7;
  }
LABEL_6:
  OUTLINED_FUNCTION_46();
  for (unint64_t i = v18 | (v17 << 6); ; unint64_t i = __clz(__rbit64(v22)) + (v17 << 6))
  {
    char v24 = (uint64_t *)(*(void *)(v9 + 48) + 16 * i);
    uint64_t v26 = *v24;
    uint64_t v25 = v24[1];
    uint64_t v27 = *(void *)(v42 + 72);
    uint64_t v28 = *(void *)(v9 + 56) + v27 * i;
    if (v43)
    {
      sub_193652D08(v28, v8);
    }
    else
    {
      sub_193652B74(v28, v8);
      swift_bridgeObjectRetain();
    }
    sub_193668958();
    sub_193668548();
    uint64_t result = sub_193668988();
    uint64_t v29 = -1 << *(unsigned char *)(v11 + 32);
    unint64_t v30 = result & ~v29;
    unint64_t v31 = v30 >> 6;
    if (((-1 << v30) & ~*(void *)(v15 + 8 * (v30 >> 6))) == 0)
    {
      char v33 = 0;
      unint64_t v34 = (unint64_t)(63 - v29) >> 6;
      while (++v31 != v34 || (v33 & 1) == 0)
      {
        BOOL v35 = v31 == v34;
        if (v31 == v34) {
          unint64_t v31 = 0;
        }
        v33 |= v35;
        uint64_t v36 = *(void *)(v15 + 8 * v31);
        if (v36 != -1)
        {
          unint64_t v32 = __clz(__rbit64(~v36)) + (v31 << 6);
          goto LABEL_31;
        }
      }
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    unint64_t v32 = __clz(__rbit64((-1 << v30) & ~*(void *)(v15 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
LABEL_31:
    *(void *)(v15 + ((v32 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v32;
    uint64_t v37 = (void *)(*(void *)(v11 + 48) + 16 * v32);
    void *v37 = v26;
    v37[1] = v25;
    uint64_t result = sub_193652D08(v8, *(void *)(v11 + 56) + v27 * v32);
    ++*(void *)(v11 + 16);
    if (v14) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v20 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      goto LABEL_42;
    }
    if (v20 >= v40)
    {
      swift_release();
      uint64_t v3 = v39;
      uint64_t v21 = (void *)(v9 + 64);
      goto LABEL_35;
    }
    uint64_t v21 = (void *)(v9 + 64);
    unint64_t v22 = *(void *)(v41 + 8 * v20);
    ++v17;
    if (!v22)
    {
      int64_t v17 = v20 + 1;
      if (v20 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v22 = *(void *)(v41 + 8 * v17);
      if (!v22) {
        break;
      }
    }
LABEL_18:
    uint64_t v14 = (v22 - 1) & v22;
  }
  int64_t v23 = v20 + 2;
  if (v23 < v40)
  {
    unint64_t v22 = *(void *)(v41 + 8 * v23);
    if (!v22)
    {
      while (1)
      {
        int64_t v17 = v23 + 1;
        if (__OFADD__(v23, 1)) {
          goto LABEL_43;
        }
        if (v17 >= v40) {
          goto LABEL_33;
        }
        unint64_t v22 = *(void *)(v41 + 8 * v17);
        ++v23;
        if (v22) {
          goto LABEL_18;
        }
      }
    }
    int64_t v17 = v23;
    goto LABEL_18;
  }
LABEL_33:
  swift_release();
  uint64_t v3 = v39;
LABEL_35:
  if (v43)
  {
    uint64_t v38 = 1 << *(unsigned char *)(v9 + 32);
    if (v38 >= 64) {
      sub_193654AF0(0, (unint64_t)(v38 + 63) >> 6, v21);
    }
    else {
      *uint64_t v21 = -1 << v38;
    }
    *(void *)(v9 + 16) = 0;
  }
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v11;
  return result;
}

uint64_t sub_193664660()
{
  return swift_release();
}

uint64_t sub_193664668()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 72, 7);
}

uint64_t sub_1936646B8()
{
  OUTLINED_FUNCTION_32_0();
  uint64_t v1 = (_OWORD *)OUTLINED_FUNCTION_13_1();
  sub_193664714(v1, v2, v3);
  *uint64_t v0 = v5;
  return swift_bridgeObjectRelease();
}

_OWORD *sub_193664714(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_193650F38();
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2DA0);
  if ((sub_1936687D8() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_193650F38();
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_13:
    uint64_t result = (_OWORD *)sub_1936688C8();
    __break(1u);
    return result;
  }
  unint64_t v11 = v13;
LABEL_5:
  uint64_t v15 = *v4;
  if (v12)
  {
    uint64_t v16 = (_OWORD *)(v15[7] + 32 * v11);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
    return sub_193650D74(a1, v16);
  }
  else
  {
    sub_193664854(v11, a2, a3, a1, v15);
    return (_OWORD *)swift_bridgeObjectRetain();
  }
}

_OWORD *sub_193664854(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  void *v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_193650D74(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

uint64_t sub_1936648C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a2;
}

uint64_t sub_193664900@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = (uint64_t)a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2EB0) + 48);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2A00);
  uint64_t result = sub_1936648C0((uint64_t)a2 + *(int *)(v5 + 48), *a1, a1[1], v4);
  *a2 = result;
  a2[1] = v7;
  return result;
}

uint64_t sub_193664964@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  *a4 = a1;
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v6 = v7;
  a4[1] = result;
  a4[2] = ~v4;
  if (-v4 < 64) {
    uint64_t v8 = ~(-1 << -(char)v4);
  }
  else {
    uint64_t v8 = -1;
  }
  a4[3] = 0;
  a4[4] = v8 & v6;
  a4[5] = a2;
  a4[6] = a3;
  return result;
}

uint64_t sub_1936649A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2EB0);
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2E10);
  uint64_t v7 = MEMORY[0x1F4188790](v6 - 8);
  BOOL v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  unint64_t v11 = (uint64_t *)((char *)&v40 - v10);
  uint64_t v13 = *v1;
  uint64_t v12 = v1[1];
  uint64_t v15 = v1[2];
  int64_t v14 = v1[3];
  int64_t v16 = v14;
  unint64_t v17 = v1[4];
  uint64_t v41 = v5;
  if (v17)
  {
    uint64_t v44 = v9;
    int64_t v45 = v14;
    uint64_t v42 = v15;
    uint64_t v43 = v12;
    uint64_t v18 = v3;
    uint64_t v19 = a1;
    uint64_t v20 = (v17 - 1) & v17;
    unint64_t v21 = __clz(__rbit64(v17)) | (v14 << 6);
LABEL_3:
    uint64_t v22 = *(void *)(v13 + 56);
    int64_t v23 = (uint64_t *)(*(void *)(v13 + 48) + 16 * v21);
    uint64_t v24 = v13;
    uint64_t v25 = *v23;
    uint64_t v26 = v23[1];
    uint64_t v27 = v22 + *(void *)(*(void *)(type metadata accessor for EventValue() - 8) + 72) * v21;
    uint64_t v3 = v18;
    sub_193652B74(v27, (uint64_t)v11 + *(int *)(v18 + 48));
    *unint64_t v11 = v25;
    v11[1] = v26;
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v18);
    uint64_t v13 = v24;
    swift_bridgeObjectRetain();
    a1 = v19;
    uint64_t v12 = v43;
    BOOL v9 = v44;
    uint64_t v15 = v42;
    goto LABEL_25;
  }
  int64_t v28 = v14 + 1;
  if (__OFADD__(v14, 1))
  {
    __break(1u);
LABEL_23:
    int64_t v16 = v10;
    goto LABEL_24;
  }
  int64_t v29 = (unint64_t)(v15 + 64) >> 6;
  if (v28 < v29)
  {
    unint64_t v30 = *(void *)(v12 + 8 * v28);
    if (v30)
    {
LABEL_7:
      uint64_t v42 = v15;
      uint64_t v43 = v12;
      uint64_t v18 = v3;
      uint64_t v44 = v9;
      int64_t v45 = v28;
      uint64_t v19 = a1;
      uint64_t v20 = (v30 - 1) & v30;
      unint64_t v21 = __clz(__rbit64(v30)) + (v28 << 6);
      goto LABEL_3;
    }
    int64_t v31 = v14 + 2;
    int64_t v16 = v14 + 1;
    if (v14 + 2 < v29)
    {
      unint64_t v30 = *(void *)(v12 + 8 * v31);
      if (v30)
      {
LABEL_10:
        int64_t v28 = v31;
        goto LABEL_7;
      }
      int64_t v16 = v14 + 2;
      if (v14 + 3 < v29)
      {
        unint64_t v30 = *(void *)(v12 + 8 * (v14 + 3));
        if (v30)
        {
          int64_t v28 = v14 + 3;
          goto LABEL_7;
        }
        int64_t v31 = v14 + 4;
        int64_t v16 = v14 + 3;
        if (v14 + 4 < v29)
        {
          unint64_t v30 = *(void *)(v12 + 8 * v31);
          if (v30) {
            goto LABEL_10;
          }
          int64_t v28 = v14 + 5;
          int64_t v16 = v14 + 4;
          if (v14 + 5 < v29)
          {
            unint64_t v30 = *(void *)(v12 + 8 * v28);
            if (v30) {
              goto LABEL_7;
            }
            int64_t v10 = v29 - 1;
            int64_t v32 = v14 + 6;
            while (v32 < v29)
            {
              unint64_t v30 = *(void *)(v12 + 8 * v32++);
              if (v30)
              {
                int64_t v28 = v32 - 1;
                goto LABEL_7;
              }
            }
            goto LABEL_23;
          }
        }
      }
    }
  }
LABEL_24:
  int64_t v45 = v16;
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, v3);
  uint64_t v20 = 0;
LABEL_25:
  uint64_t *v1 = v13;
  v1[1] = v12;
  int64_t v33 = v45;
  v1[2] = v15;
  v1[3] = v33;
  v1[4] = v20;
  unint64_t v34 = (void (*)(uint64_t))v1[5];
  sub_193651544((uint64_t)v11, (uint64_t)v9, &qword_1EB4B2E10);
  uint64_t v35 = 1;
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v3) != 1)
  {
    uint64_t v36 = (uint64_t)v9;
    uint64_t v37 = (uint64_t)v41;
    sub_193651544(v36, (uint64_t)v41, &qword_1EB4B2EB0);
    v34(v37);
    sub_1936530CC(v37, &qword_1EB4B2EB0);
    uint64_t v35 = 0;
  }
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2A00);
  return __swift_storeEnumTagSinglePayload(a1, v35, 1, v38);
}

uint64_t sub_193664CF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for EventValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_193664D54()
{
  *(unsigned char *)(*(void *)(v0 + 16) + OBJC_IVAR____RTCReportingS_completelyDisabled) = 1;
}

unint64_t sub_193664D6C()
{
  unint64_t result = qword_1E9328040;
  if (!qword_1E9328040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9328040);
  }
  return result;
}

uint64_t sub_193664DBC()
{
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_12_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_2(v0);
  void *v1 = v2;
  v1[1] = sub_193654440;
  uint64_t v3 = OUTLINED_FUNCTION_3_1();
  return sub_19365EAD8(v3, v4, v5, v6, v7);
}

uint64_t sub_193664E58()
{
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_12_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_2(v0);
  void *v1 = v2;
  v1[1] = sub_193654440;
  uint64_t v3 = OUTLINED_FUNCTION_3_1();
  return sub_19365ECC8(v3, v4, v5, v6, v7);
}

uint64_t sub_193664EF0()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (*(void *)(v0 + 184)) {
    swift_release();
  }
  return MEMORY[0x1F4186498](v0, 208, 7);
}

uint64_t sub_193664F70()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_193664FA8()
{
  return sub_19365ECE8(*(void *)(v0 + 16));
}

unsigned char **sub_193664FB4(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_19365B428(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_193664FC0()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_193664FF8()
{
  return sub_19365B438(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_193665000(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  return sub_19365B460(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t objectdestroy_69Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_193665054()
{
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_12_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_2(v0);
  void *v1 = v2;
  v1[1] = sub_193654440;
  uint64_t v3 = OUTLINED_FUNCTION_3_1();
  return sub_19365ECC8(v3, v4, v5, v6, v7);
}

uint64_t sub_1936650EC()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v1 = OUTLINED_FUNCTION_26_0();
  return MEMORY[0x1F4186498](v1, v2, v3);
}

uint64_t sub_19366512C()
{
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_17_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_2(v0);
  void *v1 = v2;
  v1[1] = sub_193654440;
  uint64_t v3 = OUTLINED_FUNCTION_7_1();
  return sub_19365EF0C(v3, v4, v5, v6, v7);
}

uint64_t sub_1936651C4()
{
  OUTLINED_FUNCTION_10_0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_2(v0);
  void *v1 = v2;
  v1[1] = sub_19364C7E8;
  uint64_t v3 = OUTLINED_FUNCTION_20_1();
  return v4(v3);
}

void sub_19366525C()
{
  qword_1E9328030 = *(void *)(v0 + 16);
}

void *initializeBufferWithCopyOfBuffer for LegacyClientError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for LegacyClientError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for LegacyClientError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for LegacyClientError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LegacyClientError(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LegacyClientError(uint64_t result, int a2, int a3)
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

uint64_t sub_193665398()
{
  return 0;
}

ValueMetadata *type metadata accessor for LegacyClientError()
{
  return &type metadata for LegacyClientError;
}

void sub_1936653C8()
{
}

uint64_t OUTLINED_FUNCTION_33_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_34_0()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_39()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_43()
{
  return swift_dynamicCast();
}

void OUTLINED_FUNCTION_47(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, os_log_t log)
{
  _os_log_impl(a1, log, v10, a4, v11, 2u);
}

void OUTLINED_FUNCTION_48(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 0xCu);
}

uint64_t OUTLINED_FUNCTION_49()
{
  return *(void *)(v0 - 240);
}

BOOL static XPCObject.== infix(_:_:)()
{
  XPCObject.obj.getter();
  XPCObject.obj.getter();
  uint64_t v0 = (void *)OUTLINED_FUNCTION_35();
  BOOL v2 = xpc_equal(v0, v1);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v2;
}

uint64_t RTCXPCDictionary.keys.getter(void *a1)
{
  int64_t count = xpc_dictionary_get_count(a1);
  uint64_t v3 = (char *)MEMORY[0x1E4FBC860];
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || count > *((void *)v3 + 3) >> 1)
  {
    if (*((void *)v3 + 2) <= count) {
      int64_t v5 = count;
    }
    else {
      int64_t v5 = *((void *)v3 + 2);
    }
    uint64_t v3 = sub_193665D60(isUniquelyReferenced_nonNull_native, v5, 0, v3);
  }
  uint64_t v13 = v3;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = &v13;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_193665E6C;
  *(void *)(v7 + 24) = v6;
  aBlock[4] = sub_193665E80;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1936658A4;
  aBlock[3] = &block_descriptor_1;
  uint64_t v8 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  xpc_dictionary_apply(a1, v8);
  _Block_release(v8);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
  }
  else
  {
    unint64_t v11 = v13;
    swift_release();
    return (uint64_t)v11;
  }
  return result;
}

uint64_t sub_193665844(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4 = sub_193668568();
  uint64_t v6 = v5;
  sub_1936665DC();
  uint64_t v7 = *(char **)(*a3 + 16);
  sub_193666628(v7);
  uint64_t v8 = *a3;
  *(void *)(v8 + 16) = v7 + 1;
  uint64_t v9 = v8 + 16 * (void)v7;
  *(void *)(v9 + 32) = v4;
  *(void *)(v9 + 40) = v6;
  return 1;
}

uint64_t sub_1936658A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  char v6 = v5(a2, a3);
  swift_unknownObjectRelease();
  return v6 & 1;
}

void (*RTCXPCDictionary.subscript.modify(void *a1, uint64_t a2, uint64_t a3))(uint64_t a1, char a2)
{
  uint64_t v7 = malloc(0x28uLL);
  *a1 = v7;
  v7[1] = a3;
  v7[2] = v3;
  *uint64_t v7 = a2;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB4B2E60);
  OUTLINED_FUNCTION_7(v8);
  size_t v10 = *(void *)(v9 + 64);
  v7[3] = malloc(v10);
  unint64_t v11 = malloc(v10);
  void v7[4] = v11;
  uint64_t v12 = *v3;
  uint64_t v13 = sub_193668538();
  xpc_object_t v14 = xpc_dictionary_get_value(v12, (const char *)(v13 + 32));
  swift_release();
  XPCObject.init(_:)(v14, (uint64_t)v11);
  return sub_1936659E0;
}

void sub_1936659E0(uint64_t a1, char a2)
{
  BOOL v2 = *(void **)a1;
  uint64_t v3 = *(void **)(*(void *)a1 + 24);
  uint64_t v4 = *(void **)(*(void *)a1 + 32);
  if (a2)
  {
    sub_193653120(*(void *)(*(void *)a1 + 32), (uint64_t)v3, (uint64_t *)&unk_1EB4B2E60);
    swift_bridgeObjectRetain();
    RTCXPCDictionary.subscript.setter((uint64_t)v3);
    sub_1936530CC((uint64_t)v4, (uint64_t *)&unk_1EB4B2E60);
  }
  else
  {
    swift_bridgeObjectRetain();
    RTCXPCDictionary.subscript.setter((uint64_t)v4);
  }
  free(v4);
  free(v3);
  free(v2);
}

Swift::Bool __swiftcall RTCXPCDictionary.contains(key:)(Swift::String key)
{
  BOOL v2 = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB4B2E60);
  uint64_t v4 = OUTLINED_FUNCTION_7(v3);
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_23();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = sub_193668538();
  xpc_object_t v9 = xpc_dictionary_get_value(v2, (const char *)(v8 + 32));
  swift_release();
  XPCObject.init(_:)(v9, v7);
  uint64_t v10 = type metadata accessor for XPCObject();
  LOBYTE(v9) = __swift_getEnumTagSinglePayload(v7, 1, v10) != 1;
  sub_1936530CC(v7, (uint64_t *)&unk_1EB4B2E60);
  return (char)v9;
}

xpc_object_t sub_193665B8C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  xpc_object_t result = RTCXPCDictionary.init(dictionaryLiteral:)(a1);
  *a2 = result;
  return result;
}

xpc_object_t sub_193665BB4(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t bytes = a1;
  __int16 v4 = a2;
  char v5 = BYTE2(a2);
  char v6 = BYTE3(a2);
  char v7 = BYTE4(a2);
  char v8 = BYTE5(a2);
  return xpc_data_create(&bytes, BYTE6(a2));
}

char *sub_193665C80(uint64_t a1, uint64_t a2)
{
  xpc_object_t result = (char *)sub_193668248();
  char v5 = result;
  if (result)
  {
    xpc_object_t result = (char *)sub_193668268();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v5 += a1 - (void)result;
  }
  BOOL v6 = __OFSUB__(a2, a1);
  uint64_t v7 = a2 - a1;
  if (v6)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v8 = sub_193668258();
  if (v8 >= v7) {
    size_t v9 = v7;
  }
  else {
    size_t v9 = v8;
  }
  if (v5) {
    size_t v10 = v9;
  }
  else {
    size_t v10 = 0;
  }
  return (char *)xpc_data_create(v5, v10);
}

uint64_t sub_193665D08(uint64_t a1, unint64_t a2)
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

char *sub_193665D60(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9328448);
    size_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    size_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
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

uint64_t sub_193665E60()
{
  return OUTLINED_FUNCTION_1_1(v0, 24);
}

uint64_t sub_193665E6C(uint64_t a1, uint64_t a2)
{
  return sub_193665844(a1, a2, *(uint64_t **)(v2 + 16));
}

uint64_t sub_193665E74()
{
  return OUTLINED_FUNCTION_1_1(v0, 32);
}

uint64_t sub_193665E80()
{
  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t *initializeBufferWithCopyOfBuffer for XPCObject(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 0xAu:
      case 0xBu:
      case 0xCu:
        *a1 = *a2;
        swift_unknownObjectRetain();
        goto LABEL_9;
      case 7u:
        uint64_t v9 = *a2;
        unint64_t v8 = a2[1];
        sub_1936660CC(v9, v8);
        *a1 = v9;
        a1[1] = v8;
        goto LABEL_9;
      case 8u:
        uint64_t v10 = a2[1];
        *a1 = *a2;
        a1[1] = v10;
        swift_bridgeObjectRetain();
        goto LABEL_9;
      case 9u:
        uint64_t v11 = sub_1936683E8();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
LABEL_9:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(v6 + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_1936660CC(uint64_t a1, unint64_t a2)
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

uint64_t *assignWithCopy for XPCObject(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_19365317C((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 0xAu:
      case 0xBu:
      case 0xCu:
        *a1 = *a2;
        swift_unknownObjectRetain();
        goto LABEL_8;
      case 7u:
        uint64_t v7 = *a2;
        unint64_t v6 = a2[1];
        sub_1936660CC(v7, v6);
        *a1 = v7;
        a1[1] = v6;
        goto LABEL_8;
      case 8u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        goto LABEL_8;
      case 9u:
        uint64_t v8 = sub_1936683E8();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
LABEL_8:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

void *initializeWithTake for XPCObject(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 9)
  {
    uint64_t v6 = sub_1936683E8();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for XPCObject(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_19365317C((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 9)
    {
      uint64_t v6 = sub_1936683E8();
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

uint64_t sub_193666500()
{
  uint64_t result = sub_1936683E8();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for RTCXPCDictionary()
{
  return &type metadata for RTCXPCDictionary;
}

char *sub_1936665DC()
{
  unint64_t v1 = *v0;
  uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v0 = v1;
  if (!result)
  {
    uint64_t result = sub_193665D60(result, *((void *)v1 + 2) + 1, 1, v1);
    *uint64_t v0 = result;
  }
  return result;
}

char *sub_193666628(char *result)
{
  unint64_t v2 = *((void *)*v1 + 3);
  if ((uint64_t)(result + 1) > (uint64_t)(v2 >> 1))
  {
    uint64_t result = sub_193665D60((char *)(v2 > 1), (int64_t)(result + 1), 1, *v1);
    char *v1 = result;
  }
  return result;
}

void static MessageKeys.clientName.getter()
{
}

void static MessageKeys.serviceName.getter()
{
}

void static MessageKeys.clientType.getter()
{
}

void static MessageKeys.legacyClient.getter()
{
}

void static MessageKeys.payload.getter()
{
}

void static MessageKeys.sessionID.getter()
{
}

void static MessageKeys.realtime.getter()
{
}

void static MessageKeys.hierarchyLevel.getter()
{
}

void static MessageKeys.hierarchyToken.getter()
{
}

const char *MessageKeys.samplingUUID.unsafeMutableAddressor()
{
  return "suuid";
}

uint64_t static MessageKeys.samplingUUID.getter()
{
  return 0x6469757573;
}

const char *MessageKeys.eager.unsafeMutableAddressor()
{
  return "eager";
}

uint64_t static MessageKeys.eager.getter()
{
  return 0x7265676165;
}

uint64_t static MessageKeys.allowed.getter()
{
  return 0x6465776F6C6C61;
}

uint64_t static MessageKeys.denied.getter()
{
  return 0x6465696E6564;
}

const char *MessageKeys.overrideSampling.unsafeMutableAddressor()
{
  return "orsf";
}

void static MessageKeys.overrideSampling.getter()
{
}

ValueMetadata *type metadata accessor for MessageKeys()
{
  return &type metadata for MessageKeys;
}

uint64_t XPCError.description.getter(void *a1)
{
  if (xpc_dictionary_get_string(a1, "XPCErrorDescription")) {
    return sub_193668568();
  }
  else {
    return OUTLINED_FUNCTION_0_3();
  }
}

uint64_t XPCError.errorDescription.getter(void *a1)
{
  if (xpc_dictionary_get_string(a1, "XPCErrorDescription")) {
    return sub_193668568();
  }
  else {
    return OUTLINED_FUNCTION_0_3();
  }
}

uint64_t sub_1936667AC()
{
  return XPCError.errorDescription.getter(*v0);
}

uint64_t sub_1936667B4()
{
  return XPCError.description.getter(*v0);
}

uint64_t XPCIncomingConnection.auditToken.getter()
{
  return 0;
}

void *XPCIncomingConnection.entitlementValue(forKey:)@<X0>(uint64_t a1@<X8>)
{
  sub_193668538();
  unint64_t v2 = (void *)xpc_connection_copy_entitlement_value();
  swift_release();
  return XPCObject.init(_:)(v2, a1);
}

uint64_t XPCIncomingConnection.makeConnection(targetQ:delegate:)(void *a1, uint64_t a2, uint64_t a3, _xpc_connection_s *a4)
{
  type metadata accessor for XPCConnection();
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  XPCConnection.init(conn:targetQ:delegate:)(a4, a1, a2, a3);
  return v8;
}

uint64_t XPCConnection.__allocating_init(conn:targetQ:delegate:)(_xpc_connection_s *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  XPCConnection.init(conn:targetQ:delegate:)(a1, a2, a3, a4);
  return v8;
}

uint64_t type metadata accessor for XPCConnection()
{
  return self;
}

uint64_t XPCConnection.conn.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t XPCConnection.delegate.getter()
{
  swift_beginAccess();
  return MEMORY[0x1997003D0](v0 + 24);
}

uint64_t XPCConnection.delegate.setter(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 32) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*XPCConnection.delegate.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  void v3[5] = v1;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x1997003D0](v1 + 24);
  uint64_t v5 = *(void *)(v1 + 32);
  v3[3] = v4;
  v3[4] = v5;
  return sub_193666AC8;
}

void sub_193666AC8(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  *(void *)(*(void *)(*(void *)a1 + 40) + 32) = *(void *)(*(void *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t XPCConnection.__allocating_init(machService:targetQ:listen:delegate:)(uint64_t a1, uint64_t a2, void *a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = swift_allocObject();
  XPCConnection.init(machService:targetQ:listen:delegate:)(a1, a2, a3, a4, a5, a6);
  return v12;
}

void *XPCConnection.init(machService:targetQ:listen:delegate:)(uint64_t a1, uint64_t a2, void *a3, char a4, uint64_t a5, uint64_t a6)
{
  v6[4] = 0;
  swift_unknownObjectWeakInit();
  if (a4) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 2;
  }
  uint64_t v11 = sub_193668538();
  uint64_t v12 = a3;
  swift_bridgeObjectRelease();
  mach_service = xpc_connection_create_mach_service((const char *)(v11 + 32), v12, v10);

  swift_release();
  swift_beginAccess();
  v6[4] = a6;
  swift_unknownObjectWeakAssign();
  v6[2] = mach_service;
  v6[5] = v12;
  xpc_object_t v14 = v12;
  uint64_t v15 = (_xpc_connection_s *)swift_unknownObjectRetain();
  xpc_connection_set_target_queue(v15, v14);
  aBlock[4] = sub_193666F8C;
  aBlock[5] = v6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_19364B5F4;
  aBlock[3] = &block_descriptor_2;
  int64_t v16 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  xpc_connection_set_event_handler(mach_service, v16);
  _Block_release(v16);
  xpc_connection_activate(mach_service);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  return v6;
}

uint64_t sub_193666D70(uint64_t a1)
{
  swift_beginAccess();
  uint64_t result = MEMORY[0x1997003D0](v1 + 24);
  if (result)
  {
    uint64_t v4 = *(void *)(v1 + 32);
    uint64_t v5 = MEMORY[0x1997005E0](a1);
    uint64_t v6 = MEMORY[0x1E4F145A8];
    uint64_t ObjectType = swift_getObjectType();
    if (v5 == v6) {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 8))(a1, ObjectType, v4);
    }
    else {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(a1, ObjectType, v4);
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

void *XPCConnection.init(conn:targetQ:delegate:)(_xpc_connection_s *a1, void *a2, uint64_t a3, uint64_t a4)
{
  v4[4] = 0;
  swift_unknownObjectWeakInit();
  v4[2] = a1;
  swift_beginAccess();
  v4[4] = a4;
  swift_unknownObjectWeakAssign();
  v4[5] = a2;
  swift_unknownObjectRetain();
  uint64_t v8 = a2;
  xpc_connection_set_target_queue(a1, v8);
  aBlock[4] = sub_193667240;
  uint64_t v12 = v4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_19364B5F4;
  aBlock[3] = &block_descriptor_3;
  uint64_t v9 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  xpc_connection_set_event_handler(a1, v9);
  _Block_release(v9);
  xpc_connection_activate(a1);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  return v4;
}

void XPCConnection.send(_:)(xpc_object_t message)
{
  xpc_connection_send_message(*(xpc_connection_t *)(v1 + 16), message);
}

uint64_t sub_193666FC0()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

Swift::Bool __swiftcall OS_xpc_object.isError()()
{
  return MEMORY[0x1997005E0]() == MEMORY[0x1E4F145A8];
}

uint64_t XPCConnection.auditToken.getter()
{
  return 0;
}

uint64_t XPCConnection.remoteUID.getter()
{
  return xpc_connection_get_euid(*(xpc_connection_t *)(v0 + 16));
}

uint64_t XPCConnection.deinit()
{
  xpc_connection_cancel(*(xpc_connection_t *)(v0 + 16));
  swift_unknownObjectRelease();
  sub_193654B88(v0 + 24);

  return v0;
}

uint64_t XPCConnection.__deallocating_deinit()
{
  XPCConnection.deinit();
  return MEMORY[0x1F4186488](v0, 48, 7);
}

Swift::OpaquePointer __swiftcall OS_xpc_object.type()()
{
}

unint64_t sub_193667140()
{
  unint64_t result = qword_1EB4B2D78;
  if (!qword_1EB4B2D78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB4B2D78);
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCError()
{
  return &type metadata for XPCError;
}

ValueMetadata *type metadata accessor for XPCIncomingConnection()
{
  return &type metadata for XPCIncomingConnection;
}

uint64_t sub_1936671AC()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4B2E08);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

RTCUtility::XPCMessage::MessageType_optional __swiftcall XPCMessage.MessageType.init(rawValue:)(Swift::Int64 rawValue)
{
  if ((unint64_t)rawValue >= 5) {
    LOBYTE(rawValue) = 5;
  }
  return (RTCUtility::XPCMessage::MessageType_optional)rawValue;
}

uint64_t XPCMessage.MessageType.rawValue.getter(uint64_t result)
{
  return result;
}

uint64_t sub_193667264()
{
  return sub_19366726C();
}

uint64_t sub_19366726C()
{
  return sub_193668988();
}

uint64_t sub_1936672B4()
{
  return sub_1936672BC();
}

uint64_t sub_1936672BC()
{
  return sub_193668978();
}

uint64_t sub_1936672E4()
{
  return sub_1936672EC();
}

uint64_t sub_1936672EC()
{
  return sub_193668988();
}

RTCUtility::XPCMessage::MessageType_optional sub_193667330@<W0>(Swift::Int64 *a1@<X0>, RTCUtility::XPCMessage::MessageType_optional *a2@<X8>)
{
  result.int64_t value = XPCMessage.MessageType.init(rawValue:)(*a1).value;
  a2->int64_t value = result.value;
  return result;
}

uint64_t sub_19366735C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = XPCMessage.MessageType.rawValue.getter(*v1);
  *a1 = result;
  return result;
}

uint64_t XPCMessage.ty.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

void XPCMessage.init(fromXPC:)()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB4B2E60);
  MEMORY[0x1F4188790](v0 - 8);
  OUTLINED_FUNCTION_23();
  swift_getObjectType();
  OS_xpc_object.type()();
}

uint64_t sub_1936673F8(uint64_t a1)
{
  if (a1 == MEMORY[0x1E4F14590])
  {
    uint64_t v3 = (void *)swift_unknownObjectRetain();
    id v4 = xpc_dictionary_get_value(v3, "type");
    XPCObject.init(_:)(v4, (uint64_t)v1);
    swift_unknownObjectRelease();
    uint64_t v5 = type metadata accessor for XPCObject();
    if (__swift_getEnumTagSinglePayload((uint64_t)v1, 1, v5) == 1)
    {
      swift_unknownObjectRelease();
      sub_19364D348((uint64_t)v1);
      return 0;
    }
    if (swift_getEnumCaseMultiPayload() != 3)
    {
      swift_unknownObjectRelease();
      sub_19365317C((uint64_t)v1);
      return 0;
    }
    if (XPCMessage.MessageType.init(rawValue:)(*v1).value != RTCUtility_XPCMessage_MessageType_unknownDefault) {
      return v2;
    }
  }
  swift_unknownObjectRelease();
  return 0;
}

uint64_t XPCMessage.description.getter(void *a1)
{
  uint64_t v33 = type metadata accessor for XPCObject();
  MEMORY[0x1F4188790](v33);
  OUTLINED_FUNCTION_23();
  unint64_t v4 = v3 - v2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB4B2E60);
  MEMORY[0x1F4188790](v5 - 8);
  OUTLINED_FUNCTION_23();
  uint64_t v8 = v7 - v6;
  sub_1936687C8();
  sub_193668558();
  int64_t v32 = a1;
  uint64_t v9 = RTCXPCDictionary.keys.getter(a1);
  uint64_t v10 = *(void *)(v9 + 16);
  if (v10)
  {
    uint64_t v11 = (uint64_t *)(v9 + 40);
    uint64_t v12 = MEMORY[0x1E4FBC868];
    uint64_t v31 = v8;
    while (1)
    {
      uint64_t v14 = *(v11 - 1);
      uint64_t v13 = *v11;
      uint64_t v15 = (const char *)(sub_193668538() + 32);
      swift_bridgeObjectRetain();
      xpc_object_t v16 = xpc_dictionary_get_value(v32, v15);
      swift_release();
      XPCObject.init(_:)(v16, v8);
      if (__swift_getEnumTagSinglePayload(v8, 1, v33) == 1) {
        break;
      }
      sub_1936532D8(v8, v4);
      swift_isUniquelyReferenced_nonNull_native();
      unint64_t v17 = sub_193650F38();
      if (__OFADD__(*(void *)(v12 + 16), (v18 & 1) == 0))
      {
        __break(1u);
LABEL_15:
        __break(1u);
        break;
      }
      unint64_t v4 = v17;
      char v19 = v18;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9328458);
      if (sub_1936687D8())
      {
        unint64_t v20 = sub_193650F38();
        if ((v19 & 1) != (v21 & 1)) {
          goto LABEL_17;
        }
        unint64_t v4 = v20;
      }
      if (v19)
      {
        uint64_t v22 = OUTLINED_FUNCTION_0_4();
        sub_193667844(v22, v23);
      }
      else
      {
        *(void *)(v12 + 8 * (v4 >> 6) + 64) |= 1 << v4;
        uint64_t v24 = (void *)(*(void *)(v12 + 48) + 16 * v4);
        void *v24 = v14;
        v24[1] = v13;
        uint64_t v25 = OUTLINED_FUNCTION_0_4();
        sub_1936532D8(v25, v26);
        uint64_t v27 = *(void *)(v12 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28) {
          goto LABEL_15;
        }
        *(void *)(v12 + 16) = v29;
        swift_bridgeObjectRetain();
      }
      v11 += 2;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      --v10;
      uint64_t v8 = v31;
      if (!v10) {
        goto LABEL_13;
      }
    }
    __break(1u);
LABEL_17:
    uint64_t result = sub_1936688C8();
    __break(1u);
  }
  else
  {
LABEL_13:
    swift_bridgeObjectRelease();
    sub_193668498();
    swift_bridgeObjectRelease();
    sub_193668558();
    swift_bridgeObjectRelease();
    sub_193668558();
    return 0;
  }
  return result;
}

uint64_t sub_193667838()
{
  return XPCMessage.description.getter(*v0);
}

uint64_t sub_193667844(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for XPCObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_1936678AC()
{
  unint64_t result = qword_1E9328460;
  if (!qword_1E9328460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9328460);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for XPCMessage(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  swift_unknownObjectRetain();
  return a1;
}

uint64_t destroy for XPCMessage()
{
  return swift_unknownObjectRelease();
}

uint64_t assignWithCopy for XPCMessage(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for XPCMessage(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_unknownObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

ValueMetadata *type metadata accessor for XPCMessage()
{
  return &type metadata for XPCMessage;
}

uint64_t getEnumTagSinglePayload for XPCMessage.MessageType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
    if (a2 + 4 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 4) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v5 = v6 - 5;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for XPCMessage.MessageType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x193667B2CLL);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCMessage.MessageType()
{
  return &type metadata for XPCMessage.MessageType;
}

void __createAWDAdaptorInstance_block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  int v2 = @"/System/Library/PrivateFrameworks/AVConference.framework/Frameworks/GKSPerformance.framework";
  _os_log_error_impl(&dword_193646000, log, OS_LOG_TYPE_ERROR, "invokeAWDAdaptorForReporter unable to find AWDAdaptor at %@", (uint8_t *)&v1, 0xCu);
}

uint64_t sub_193668248()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_193668258()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_193668268()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_193668278()
{
  return MEMORY[0x1F40E3A90]();
}

uint64_t sub_193668288()
{
  return MEMORY[0x1F40E3A98]();
}

uint64_t sub_193668298()
{
  return MEMORY[0x1F40E3AC0]();
}

uint64_t sub_1936682A8()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1936682B8()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1936682C8()
{
  return MEMORY[0x1F40E46B8]();
}

uint64_t sub_1936682D8()
{
  return MEMORY[0x1F40E46D0]();
}

uint64_t sub_1936682E8()
{
  return MEMORY[0x1F40E4930]();
}

uint64_t sub_1936682F8()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_193668308()
{
  return MEMORY[0x1F40E49E0]();
}

uint64_t sub_193668318()
{
  return MEMORY[0x1F40E4A18]();
}

uint64_t sub_193668328()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_193668338()
{
  return MEMORY[0x1F40E4DD0]();
}

uint64_t sub_193668348()
{
  return MEMORY[0x1F40E50E0]();
}

uint64_t sub_193668358()
{
  return MEMORY[0x1F40E52A0]();
}

uint64_t sub_193668368()
{
  return MEMORY[0x1F40E52B0]();
}

uint64_t sub_193668378()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_193668388()
{
  return MEMORY[0x1F40E5328]();
}

uint64_t sub_193668398()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1936683A8()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1936683B8()
{
  return MEMORY[0x1F40E5418]();
}

uint64_t sub_1936683C8()
{
  return MEMORY[0x1F40E5428]();
}

uint64_t sub_1936683D8()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1936683E8()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1936683F8()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_193668408()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_193668418()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_193668428()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t sub_193668438()
{
  return MEMORY[0x1F4186CE8]();
}

uint64_t sub_193668448()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_193668458()
{
  return MEMORY[0x1F41832D0]();
}

uint64_t sub_193668468()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_193668478()
{
  return MEMORY[0x1F40E6008]();
}

uint64_t sub_193668488()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_193668498()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1936684A8()
{
  return MEMORY[0x1F4183338]();
}

uint64_t sub_1936684B8()
{
  return MEMORY[0x1F4183340]();
}

uint64_t sub_1936684C8()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1936684D8()
{
  return MEMORY[0x1F4183738]();
}

uint64_t sub_1936684E8()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1936684F8()
{
  return MEMORY[0x1F4183748]();
}

uint64_t sub_193668508()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_193668518()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_193668528()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_193668538()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_193668548()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_193668558()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_193668568()
{
  return MEMORY[0x1F4183A60]();
}

uint64_t sub_193668578()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_193668588()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_193668598()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1936685A8()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1936685B8()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_1936685C8()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1936685D8()
{
  return MEMORY[0x1F4187CA8]();
}

uint64_t sub_1936685E8()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1936685F8()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_193668628()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_193668638()
{
  return MEMORY[0x1F40E6538]();
}

uint64_t sub_193668648()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_193668658()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_193668668()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_193668678()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_193668688()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_193668698()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1936686A8()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1936686B8()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1936686C8()
{
  return MEMORY[0x1F4187110]();
}

uint64_t sub_1936686D8()
{
  return MEMORY[0x1F40E6840]();
}

uint64_t sub_1936686E8()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1936686F8()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_193668748()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_193668758()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_193668768()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_193668778()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_193668788()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_193668798()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1936687A8()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1936687B8()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1936687C8()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1936687D8()
{
  return MEMORY[0x1F41851A0]();
}

uint64_t sub_1936687E8()
{
  return MEMORY[0x1F41851B8]();
}

uint64_t sub_1936687F8()
{
  return MEMORY[0x1F41851C0]();
}

uint64_t sub_193668808()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_193668818()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_193668828()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_193668838()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_193668848()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_193668858()
{
  return MEMORY[0x1F4185A20]();
}

uint64_t sub_193668868()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_193668878()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_193668898()
{
  return MEMORY[0x1F4185D58]();
}

uint64_t sub_1936688A8()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_1936688B8()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1936688C8()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1936688F8()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_193668908()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_193668918()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_193668928()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_193668938()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_193668948()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_193668958()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_193668968()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_193668978()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_193668988()
{
  return MEMORY[0x1F4185EF8]();
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1F40D7A98](allocator, domain, code, userInfo);
}

void CFRelease(CFTypeRef cf)
{
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1F40D8988](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1F40D89B0](alloc, uuid);
}

NSString *__cdecl NSHomeDirectoryForUser(NSString *userName)
{
  return (NSString *)MEMORY[0x1F40E7118](userName);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x1F4145D88]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1F40CBD40](when, delta);
}

void free(void *a1)
{
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CC4C0]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1F4188218]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1F4188220]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1F4186568]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
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

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1F41867A8]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1F40CEA18](xarray, applier);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1F40CEA38]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x1F40CEB10](value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1F40CEB18](xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return MEMORY[0x1F40CEB90]();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1F40CEBE8]();
}

uid_t xpc_connection_get_euid(xpc_connection_t connection)
{
  return MEMORY[0x1F40CEC08](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1F40CED90](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1F40CEDB0](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1F40CEDC0](xdata);
}

xpc_object_t xpc_date_create(int64_t interval)
{
  return (xpc_object_t)MEMORY[0x1F40CEDD8](interval);
}

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  return MEMORY[0x1F40CEDF0](xdate);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1F40CEE08](xdict, applier);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1F40CEE30]();
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1F40CEE88](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_object_t xpc_double_create(double value)
{
  return (xpc_object_t)MEMORY[0x1F40CEFE8](value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  MEMORY[0x1F40CEFF8](xdouble);
  return result;
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1F40CF040](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1F40CF188](value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1F40CF190](xint);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1F40CF208]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40CF290](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1F40CF2C8](xstring);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x1F40CF320](value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1F40CF330](xuint);
}

xpc_object_t xpc_uuid_create(const unsigned __int8 *uuid)
{
  return (xpc_object_t)MEMORY[0x1F40CF360](uuid);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1F40CF368](xuuid);
}