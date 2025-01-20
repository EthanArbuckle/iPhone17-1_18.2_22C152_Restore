uint64_t type metadata accessor for BooleanCapabilityPrimitive()
{
  return self;
}

uint64_t type metadata accessor for AlarmTimerIntentsHandlingCapability()
{
  return self;
}

id AlarmTimerIntentsHandlingCapability.init(status:)(uint64_t a1)
{
  uint64_t v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution35AlarmTimerIntentsHandlingCapability_primitivesMap;
  v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC80980);
  *(void *)&v1[v3] = sub_1C9E0D0D0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution35AlarmTimerIntentsHandlingCapability_key]);

  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for AlarmTimerIntentsHandlingCapability();
  id v5 = objc_msgSendSuper2(&v12, sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC808D8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C9E0F330;
  *(void *)(inited + 32) = 0xD000000000000032;
  *(void *)(inited + 40) = 0x80000001C9E11B80;
  objc_allocWithZone((Class)type metadata accessor for BooleanCapabilityPrimitive());
  id v7 = v5;
  *(void *)(inited + 48) = sub_1C9DE3B00(a1);
  uint64_t v8 = sub_1C9E0D0D0();
  sub_1C9DD60F4(v8);
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  sub_1C9DD68F4(6, v10);
  swift_bridgeObjectRelease();

  return v7;
}

uint64_t type metadata accessor for VoiceTriggerCapability()
{
  return self;
}

void sub_1C9DD583C(void *a1, uint64_t a2, uint64_t *a3)
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v6 = (void *)sub_1C9E0D110();
  swift_bridgeObjectRelease();
  id v7 = (void *)sub_1C9E0D110();
  objc_msgSend(a1, sel_encodeObject_forKey_, v6, v7);

  uint64_t v8 = *a3;
  uint64_t v9 = swift_bridgeObjectRetain();
  sub_1C9DD7DA8(v9);
  swift_bridgeObjectRelease();
  uint64_t v10 = (void *)sub_1C9E0D200();
  swift_release();
  v11 = (void *)sub_1C9E0D110();
  objc_msgSend(a1, sel_encodeObject_forKey_, v10, v11);

  uint64_t v12 = *(void *)(v3 + v8);
  uint64_t v13 = v12 + 64;
  uint64_t v14 = 1 << *(unsigned char *)(v12 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & *(void *)(v12 + 64);
  int64_t v17 = (unint64_t)(v14 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v18 = 0;
  if (!v16) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v19 = __clz(__rbit64(v16));
  v16 &= v16 - 1;
  for (unint64_t i = v19 | (v18 << 6); ; unint64_t i = __clz(__rbit64(v22)) + (v18 << 6))
  {
    uint64_t v24 = *(void *)(*(void *)(v12 + 56) + 16 * i);
    OUTLINED_FUNCTION_4();
    sub_1C9E0D180();
    swift_unknownObjectRetain_n();
    v25 = (void *)sub_1C9E0D110();
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_encodeObject_forKey_, v24, v25);
    swift_unknownObjectRelease_n();

    if (v16) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v21 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v21 >= v17) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v13 + 8 * v21);
    ++v18;
    if (!v22)
    {
      int64_t v18 = v21 + 1;
      if (v21 + 1 >= v17) {
        goto LABEL_23;
      }
      unint64_t v22 = *(void *)(v13 + 8 * v18);
      if (!v22)
      {
        int64_t v18 = v21 + 2;
        if (v21 + 2 >= v17) {
          goto LABEL_23;
        }
        unint64_t v22 = *(void *)(v13 + 8 * v18);
        if (!v22)
        {
          int64_t v18 = v21 + 3;
          if (v21 + 3 >= v17) {
            goto LABEL_23;
          }
          unint64_t v22 = *(void *)(v13 + 8 * v18);
          if (!v22) {
            break;
          }
        }
      }
    }
LABEL_20:
    unint64_t v16 = (v22 - 1) & v22;
  }
  int64_t v23 = v21 + 4;
  if (v23 >= v17)
  {
LABEL_23:
    swift_release();
    return;
  }
  unint64_t v22 = *(void *)(v13 + 8 * v23);
  if (v22)
  {
    int64_t v18 = v23;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v18 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v18 >= v17) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v13 + 8 * v18);
    ++v23;
    if (v22) {
      goto LABEL_20;
    }
  }
LABEL_25:
  __break(1u);
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

id VoiceTriggerCapability.init(status:)(uint64_t a1)
{
  uint64_t v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution22VoiceTriggerCapability_primitivesMap;
  v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC80980);
  *(void *)&v1[v3] = sub_1C9E0D0D0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution22VoiceTriggerCapability_key]);

  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for VoiceTriggerCapability();
  id v5 = objc_msgSendSuper2(&v12, sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC808D8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C9E0F330;
  *(void *)(inited + 32) = 0xD000000000000025;
  *(void *)(inited + 40) = 0x80000001C9E10E40;
  objc_allocWithZone((Class)type metadata accessor for BooleanCapabilityPrimitive());
  id v7 = v5;
  *(void *)(inited + 48) = sub_1C9DE3B00(a1);
  uint64_t v8 = sub_1C9E0D0D0();
  sub_1C9DD60F4(v8);
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  sub_1C9DD6A28(5, v10, (void (*)(unint64_t))sub_1C9DD5F94, sub_1C9DD5E68);
  swift_bridgeObjectRelease();

  return v7;
}

unint64_t sub_1C9DD5CF8(uint64_t a1, uint64_t a2)
{
  sub_1C9E0D890();
  sub_1C9E0D150();
  uint64_t v4 = sub_1C9E0D8D0();
  return sub_1C9DD9A58(a1, a2, v4);
}

uint64_t sub_1C9DD5E68(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution22VoiceTriggerCapability_primitivesMap) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9DD5ECC()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution22VoiceTriggerCapability_key);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1C9DD5F94(uint64_t a1, uint64_t a2)
{
  id v5 = (void *)(v2 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution22VoiceTriggerCapability_key);
  swift_beginAccess();
  *id v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9DD5FF4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1C9DD5ECC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1C9DD6020(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_1C9DD5F94(v1, v2);
}

uint64_t (*sub_1C9DD6060())()
{
  return j__swift_endAccess;
}

id VoiceTriggerCapability.__allocating_init(status:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return VoiceTriggerCapability.init(status:)(a1);
}

void sub_1C9DD60F4(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC808E0);
    uint64_t v2 = (void *)sub_1C9E0D730();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
  }
  uint64_t v32 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v31 = (unint64_t)(63 - v3) >> 6;
  swift_bridgeObjectRetain();
  int64_t v6 = 0;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        unint64_t v7 = __clz(__rbit64(v5));
        v5 &= v5 - 1;
        unint64_t v8 = v7 | (v6 << 6);
      }
      else
      {
        int64_t v9 = v6 + 1;
        if (__OFADD__(v6, 1)) {
          goto LABEL_38;
        }
        if (v9 >= v31)
        {
LABEL_35:
          sub_1C9DD808C();
          return;
        }
        unint64_t v10 = *(void *)(v32 + 8 * v9);
        int64_t v11 = v6 + 1;
        if (!v10)
        {
          OUTLINED_FUNCTION_3();
          if (v12 == v13) {
            goto LABEL_35;
          }
          OUTLINED_FUNCTION_2();
          if (!v10)
          {
            OUTLINED_FUNCTION_3();
            if (v12 == v13) {
              goto LABEL_35;
            }
            OUTLINED_FUNCTION_2();
            if (!v10)
            {
              OUTLINED_FUNCTION_3();
              if (v12 == v13) {
                goto LABEL_35;
              }
              OUTLINED_FUNCTION_2();
              if (!v10)
              {
                int64_t v15 = v14 + 4;
                if (v15 >= v31) {
                  goto LABEL_35;
                }
                unint64_t v10 = *(void *)(v32 + 8 * v15);
                if (!v10)
                {
                  while (!__OFADD__(v15, 1))
                  {
                    OUTLINED_FUNCTION_3();
                    if (v12 == v13) {
                      goto LABEL_35;
                    }
                    OUTLINED_FUNCTION_2();
                    int64_t v15 = v16 + 1;
                    if (v10) {
                      goto LABEL_29;
                    }
                  }
                  goto LABEL_39;
                }
                int64_t v11 = v15;
              }
            }
          }
        }
LABEL_29:
        unint64_t v5 = (v10 - 1) & v10;
        unint64_t v8 = __clz(__rbit64(v10)) + (v11 << 6);
        int64_t v6 = v11;
      }
      int64_t v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v8);
      uint64_t v19 = *v17;
      uint64_t v18 = v17[1];
      v20 = *(void **)(*(void *)(a1 + 56) + 8 * v8);
      swift_bridgeObjectRetain();
      id v21 = v20;
      unint64_t v22 = sub_1C9DD5CF8(v19, v18);
      unint64_t v23 = v22;
      if ((v24 & 1) == 0) {
        break;
      }
      v25 = (uint64_t *)(v2[6] + 16 * v22);
      swift_bridgeObjectRelease();
      uint64_t *v25 = v19;
      v25[1] = v18;
      v26 = (void *)(v2[7] + 16 * v23);
      swift_unknownObjectRelease();
      void *v26 = v21;
      v26[1] = &off_1F241C2E8;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v22;
    v27 = (uint64_t *)(v2[6] + 16 * v22);
    uint64_t *v27 = v19;
    v27[1] = v18;
    v28 = (void *)(v2[7] + 16 * v22);
    void *v28 = v21;
    v28[1] = &off_1F241C2E8;
    uint64_t v29 = v2[2];
    BOOL v13 = __OFADD__(v29, 1);
    uint64_t v30 = v29 + 1;
    if (v13) {
      goto LABEL_37;
    }
    v2[2] = v30;
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

uint64_t sub_1C9DD6384(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6B48);
    uint64_t v2 = sub_1C9E0D730();
  }
  else
  {
    uint64_t v2 = MEMORY[0x1E4FBC868];
  }
  uint64_t v29 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v28 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  swift_retain();
  int64_t v7 = 0;
  if (!v5) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v8 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v9 = v8 | (v7 << 6);
  while (1)
  {
    char v30 = *(unsigned char *)(*(void *)(a1 + 48) + v9);
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6B50);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6B58);
    swift_dynamicCast();
    sub_1C9E0D890();
    switch(v30)
    {
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 10:
        OUTLINED_FUNCTION_1();
        break;
      default:
        break;
    }
    sub_1C9E0D150();
    swift_bridgeObjectRelease();
    uint64_t v18 = sub_1C9E0D8D0();
    uint64_t v19 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v20 = v18 & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      goto LABEL_40;
    }
    char v23 = 0;
    unint64_t v24 = (unint64_t)(63 - v19) >> 6;
    do
    {
      if (++v21 == v24 && (v23 & 1) != 0)
      {
        __break(1u);
LABEL_44:
        __break(1u);
        goto LABEL_45;
      }
      BOOL v25 = v21 == v24;
      if (v21 == v24) {
        unint64_t v21 = 0;
      }
      v23 |= v25;
      uint64_t v26 = *(void *)(v6 + 8 * v21);
    }
    while (v26 == -1);
    unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
LABEL_40:
    *(void *)(v6 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(unsigned char *)(*(void *)(v2 + 48) + v22) = v30;
    *(void *)(*(void *)(v2 + 56) + 8 * v22) = v31;
    ++*(void *)(v2 + 16);
    if (v5) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v10 = v7 + 1;
    if (__OFADD__(v7, 1)) {
      goto LABEL_44;
    }
    if (v10 >= v28) {
      goto LABEL_42;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v10);
    int64_t v12 = v7 + 1;
    if (!v11)
    {
      OUTLINED_FUNCTION_6();
      if (v13 == v14) {
        goto LABEL_42;
      }
      OUTLINED_FUNCTION_5();
      if (!v11)
      {
        OUTLINED_FUNCTION_6();
        if (v13 == v14) {
          goto LABEL_42;
        }
        OUTLINED_FUNCTION_5();
        if (!v11)
        {
          OUTLINED_FUNCTION_6();
          if (v13 == v14) {
            goto LABEL_42;
          }
          OUTLINED_FUNCTION_5();
          if (!v11) {
            break;
          }
        }
      }
    }
LABEL_28:
    unint64_t v5 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
    int64_t v7 = v12;
  }
  int64_t v16 = v15 + 4;
  if (v16 < v28)
  {
    unint64_t v11 = *(void *)(v29 + 8 * v16);
    if (v11)
    {
      int64_t v12 = v16;
      goto LABEL_28;
    }
    while (!__OFADD__(v16, 1))
    {
      OUTLINED_FUNCTION_6();
      if (v13 == v14) {
        goto LABEL_42;
      }
      OUTLINED_FUNCTION_5();
      int64_t v16 = v17 + 1;
      if (v11) {
        goto LABEL_28;
      }
    }
LABEL_45:
    __break(1u);
    JUMPOUT(0x1C9DD6840);
  }
LABEL_42:
  swift_release();
  sub_1C9DD808C();
  return v2;
}

uint64_t sub_1C9DD6870(uint64_t a1, uint64_t a2)
{
  return sub_1C9DD6A28(a1, a2, (void (*)(unint64_t))sub_1C9DD8D80, sub_1C9DD8C54);
}

uint64_t sub_1C9DD689C(uint64_t a1, uint64_t a2)
{
  return sub_1C9DD6A28(a1, a2, (void (*)(unint64_t))sub_1C9DDA4B0, sub_1C9DDA384);
}

uint64_t sub_1C9DD68C8(uint64_t a1, uint64_t a2)
{
  return sub_1C9DD6A28(a1, a2, (void (*)(unint64_t))sub_1C9DDB278, sub_1C9DDB14C);
}

uint64_t sub_1C9DD68F4(uint64_t a1, uint64_t a2)
{
  return sub_1C9DD6A28(a1, a2, (void (*)(unint64_t))sub_1C9DE9EB4, sub_1C9DE9D88);
}

uint64_t sub_1C9DD6920(uint64_t a1, uint64_t a2)
{
  return sub_1C9DD6A28(a1, a2, (void (*)(unint64_t))sub_1C9E06B1C, sub_1C9E069F0);
}

uint64_t sub_1C9DD694C(uint64_t a1, uint64_t a2)
{
  return sub_1C9DD6A28(a1, a2, (void (*)(unint64_t))sub_1C9E04F8C, sub_1C9E04E60);
}

uint64_t sub_1C9DD6978(uint64_t a1, uint64_t a2)
{
  return sub_1C9DD6A28(a1, a2, (void (*)(unint64_t))sub_1C9E09C08, sub_1C9E09ADC);
}

uint64_t sub_1C9DD69A4(uint64_t a1, uint64_t a2)
{
  return sub_1C9DD6A28(a1, a2, (void (*)(unint64_t))sub_1C9E041C4, sub_1C9E04098);
}

uint64_t sub_1C9DD69D0(uint64_t a1, uint64_t a2)
{
  return sub_1C9DD6A28(a1, a2, (void (*)(unint64_t))sub_1C9E05D54, sub_1C9E05C28);
}

uint64_t sub_1C9DD69FC(uint64_t a1, uint64_t a2)
{
  return sub_1C9DD6A28(a1, a2, (void (*)(unint64_t))sub_1C9E033E8, sub_1C9E032BC);
}

uint64_t sub_1C9DD6A28(uint64_t a1, uint64_t a2, void (*a3)(unint64_t), uint64_t (*a4)(uint64_t))
{
  unint64_t v5 = CapabilityKey.rawValue.getter();
  a3(v5);
  uint64_t v6 = swift_bridgeObjectRetain();
  return a4(v6);
}

uint64_t sub_1C9DD6AD0()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution22VoiceTriggerCapability_primitivesMap);
  swift_bridgeObjectRetain();
  unint64_t v2 = OUTLINED_FUNCTION_7();
  uint64_t v4 = sub_1C9DD6B68(v2, v3, v1);
  swift_bridgeObjectRelease();
  if (!v4) {
    return 0;
  }
  type metadata accessor for BooleanCapabilityPrimitive();
  uint64_t v5 = swift_dynamicCastClass();
  if (v5) {
    uint64_t v6 = *(void *)(v5 + OBJC_IVAR___SVDBooleanCapabilityPrimitive_supportStatus);
  }
  else {
    uint64_t v6 = 0;
  }
  swift_unknownObjectRelease();
  return v6;
}

uint64_t sub_1C9DD6B68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_1C9DD5CF8(a1, a2), (v3 & 1) != 0)) {
    return swift_unknownObjectRetain();
  }
  else {
    return 0;
  }
}

uint64_t sub_1C9DD6BB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_1C9DD5CF8(a1, a2), (v7 & 1) != 0))
  {
    unint64_t v8 = v6;
    uint64_t v9 = *(void *)(a3 + 56);
    uint64_t v10 = type metadata accessor for RequestAnalyticsContext(0);
    sub_1C9DD7CA8(v9 + *(void *)(*(void *)(v10 - 8) + 72) * v8, a4);
    uint64_t v11 = a4;
    uint64_t v12 = 0;
    uint64_t v13 = v10;
  }
  else
  {
    uint64_t v13 = type metadata accessor for RequestAnalyticsContext(0);
    uint64_t v11 = a4;
    uint64_t v12 = 1;
  }
  return __swift_storeEnumTagSinglePayload(v11, v12, 1, v13);
}

id sub_1C9DD6C68(uint64_t a1)
{
  type metadata accessor for BooleanCapabilityPrimitive();
  unint64_t v2 = OUTLINED_FUNCTION_7();
  return sub_1C9DE3B5C(v2, v3, a1);
}

uint64_t sub_1C9DD6CD4(unint64_t a1)
{
  return sub_1C9DD6D1C(a1, (char *)v1) & 1;
}

uint64_t sub_1C9DD6D1C(unint64_t a1, char *a2)
{
  if (a1 >> 62) {
    goto LABEL_30;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_1C9E0D700())
  {
    uint64_t v17 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution22VoiceTriggerCapability_primitivesMap;
    uint64_t v4 = 4;
    while (1)
    {
      uint64_t v5 = (a1 & 0xC000000000000001) != 0
         ? (char *)MEMORY[0x1CB78F680](v4 - 4, a1)
         : (char *)*(id *)(a1 + 8 * v4);
      unint64_t v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      uint64_t v8 = *(void *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key];
      unint64_t v9 = *(void *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key + 8];
      swift_bridgeObjectRetain();
      if ((sub_1C9E0D1A0() & 1) == 0)
      {

        swift_bridgeObjectRelease();
LABEL_27:
        swift_bridgeObjectRelease();
        return 0;
      }
      swift_bridgeObjectRetain();
      if ((sub_1C9E0D1A0() & 1) == 0)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
LABEL_20:
        swift_bridgeObjectRelease();
        uint64_t v15 = a2;
        goto LABEL_24;
      }
      unint64_t v10 = sub_1C9E0D160();
      unint64_t v11 = sub_1C9E09684(v10, v8, v9);
      MEMORY[0x1CB78F240](v11);
      swift_bridgeObjectRelease();
      uint64_t v12 = sub_1C9E0D750();
      swift_bridgeObjectRelease();
      if (v12)
      {
        swift_bridgeObjectRelease();

        goto LABEL_20;
      }
      if (!*(void *)(*(void *)&a2[v17] + 16)) {
        goto LABEL_23;
      }
      swift_bridgeObjectRetain();
      sub_1C9DD5CF8(v8, v9);
      if ((v13 & 1) == 0)
      {
        swift_bridgeObjectRelease();
LABEL_23:
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        uint64_t v15 = v6;
LABEL_24:

        return 0;
      }
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      type metadata accessor for BooleanCapabilityPrimitive();
      if (!swift_dynamicCastClass())
      {

        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        return 0;
      }
      swift_unknownObjectRetain();
      char v14 = sub_1C9DE3C80((uint64_t)v6);

      swift_unknownObjectRelease_n();
      if ((v14 & 1) == 0)
      {

        goto LABEL_27;
      }
      ++v4;
      if (v7 == v3) {
        goto LABEL_31;
      }
    }
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
  }
LABEL_31:

  swift_bridgeObjectRelease();
  return 1;
}

uint64_t static VoiceTriggerCapability.supportsSecureCoding.getter()
{
  return 1;
}

char *VoiceTriggerCapability.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return VoiceTriggerCapability.init(coder:)(a1);
}

char *VoiceTriggerCapability.init(coder:)(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution22VoiceTriggerCapability_primitivesMap;
  uint64_t v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC80980);
  *(void *)&v1[v3] = sub_1C9E0D0D0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution22VoiceTriggerCapability_key]);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for VoiceTriggerCapability();
  uint64_t v5 = (char *)objc_msgSendSuper2(&v7, sel_init);
  sub_1C9DD7244((uint64_t)a1, (void (*)())sub_1C9DD5F94, (uint64_t (*)(void *))sub_1C9DD5E68);

  if (!*(void *)(*(void *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution22VoiceTriggerCapability_primitivesMap]
                  + 16))
  {

    return 0;
  }
  return v5;
}

uint64_t sub_1C9DD7218(uint64_t a1)
{
  return sub_1C9DD7244(a1, (void (*)())sub_1C9DD8D80, (uint64_t (*)(void *))sub_1C9DD8C54);
}

uint64_t sub_1C9DD7244(uint64_t a1, void (*a2)(), uint64_t (*a3)(void *))
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA5C6B10);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1C9E0F330;
  uint64_t v6 = sub_1C9DD7D6C(0, (unint64_t *)&qword_1EA5C6E90);
  *(void *)(v5 + 32) = v6;
  sub_1C9E0D3E0();
  swift_bridgeObjectRelease();
  if (!v32) {
    return sub_1C9DD7D0C((uint64_t)v31);
  }
  uint64_t result = OUTLINED_FUNCTION_8();
  if ((result & 1) == 0) {
    return result;
  }
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1C9E0F340;
  *(void *)(v8 + 32) = sub_1C9DD7D6C(0, &qword_1EA5C6B28);
  *(void *)(v8 + 40) = v6;
  sub_1C9E0D3E0();
  swift_bridgeObjectRelease();
  if (!v32)
  {
    swift_bridgeObjectRelease();
    return sub_1C9DD7D0C((uint64_t)v31);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6B30);
  if ((OUTLINED_FUNCTION_8() & 1) == 0) {
    return swift_bridgeObjectRelease();
  }
  v27 = a3;
  a2();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC80980);
  unint64_t v9 = (void *)sub_1C9E0D0D0();
  uint64_t v10 = *(void *)(v30 + 16);
  if (!v10)
  {
LABEL_21:
    swift_bridgeObjectRelease();
    return v27(v9);
  }
  uint64_t v29 = type metadata accessor for BooleanCapabilityPrimitive();
  uint64_t v28 = type metadata accessor for ContinuousNumericCapabilityPrimitive();
  unint64_t v11 = (uint64_t *)(v30 + 40);
  while (1)
  {
    uint64_t v13 = *(v11 - 1);
    uint64_t v12 = *v11;
    OUTLINED_FUNCTION_4();
    v31[0] = v14;
    v31[1] = 0xEE005F70614D7365;
    swift_bridgeObjectRetain();
    sub_1C9E0D180();
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_1C9E0F340;
    *(void *)(v15 + 32) = v29;
    *(void *)(v15 + 40) = v28;
    sub_1C9E0D3E0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!v32)
    {
      swift_bridgeObjectRelease();
      sub_1C9DD7D0C((uint64_t)v31);
      goto LABEL_20;
    }
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_20;
    }
    swift_unknownObjectRetain();
    swift_isUniquelyReferenced_nonNull_native();
    v31[0] = v9;
    unint64_t v16 = sub_1C9DD5CF8(v13, v12);
    if (__OFADD__(v9[2], (v17 & 1) == 0)) {
      break;
    }
    unint64_t v18 = v16;
    char v19 = v17;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA5C6B38);
    if (sub_1C9E0D610())
    {
      unint64_t v20 = sub_1C9DD5CF8(v13, v12);
      if ((v19 & 1) != (v21 & 1)) {
        goto LABEL_28;
      }
      unint64_t v18 = v20;
    }
    unint64_t v9 = (void *)v31[0];
    if (v19)
    {
      uint64_t v22 = *(void *)(v31[0] + 56);
      swift_unknownObjectRelease();
      *(_OWORD *)(v22 + 16 * v18) = v30;
    }
    else
    {
      *(void *)(v31[0] + 8 * (v18 >> 6) + 64) |= 1 << v18;
      char v23 = (uint64_t *)(v9[6] + 16 * v18);
      *char v23 = v13;
      v23[1] = v12;
      *(_OWORD *)(v9[7] + 16 * v18) = v30;
      uint64_t v24 = v9[2];
      BOOL v25 = __OFADD__(v24, 1);
      uint64_t v26 = v24 + 1;
      if (v25) {
        goto LABEL_27;
      }
      v9[2] = v26;
      swift_bridgeObjectRetain();
    }
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_20:
    v11 += 2;
    if (!--v10) {
      goto LABEL_21;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  uint64_t result = sub_1C9E0D830();
  __break(1u);
  return result;
}

uint64_t sub_1C9DD76A0(uint64_t a1)
{
  return sub_1C9DD7244(a1, (void (*)())sub_1C9DDA4B0, (uint64_t (*)(void *))sub_1C9DDA384);
}

uint64_t sub_1C9DD76CC(uint64_t a1)
{
  return sub_1C9DD7244(a1, (void (*)())sub_1C9DDB278, (uint64_t (*)(void *))sub_1C9DDB14C);
}

uint64_t sub_1C9DD76F8(uint64_t a1)
{
  return sub_1C9DD7244(a1, (void (*)())sub_1C9DE9EB4, (uint64_t (*)(void *))sub_1C9DE9D88);
}

uint64_t sub_1C9DD7724(uint64_t a1)
{
  return sub_1C9DD7244(a1, (void (*)())sub_1C9E033E8, (uint64_t (*)(void *))sub_1C9E032BC);
}

uint64_t sub_1C9DD7750(uint64_t a1)
{
  return sub_1C9DD7244(a1, (void (*)())sub_1C9E041C4, (uint64_t (*)(void *))sub_1C9E04098);
}

uint64_t sub_1C9DD777C(uint64_t a1)
{
  return sub_1C9DD7244(a1, (void (*)())sub_1C9E04F8C, (uint64_t (*)(void *))sub_1C9E04E60);
}

uint64_t sub_1C9DD77A8(uint64_t a1)
{
  return sub_1C9DD7244(a1, (void (*)())sub_1C9E05D54, (uint64_t (*)(void *))sub_1C9E05C28);
}

uint64_t sub_1C9DD77D4(uint64_t a1)
{
  return sub_1C9DD7244(a1, (void (*)())sub_1C9E06B1C, (uint64_t (*)(void *))sub_1C9E069F0);
}

uint64_t sub_1C9DD7800(uint64_t a1)
{
  return sub_1C9DD7244(a1, (void (*)())sub_1C9E09C08, (uint64_t (*)(void *))sub_1C9E09ADC);
}

void sub_1C9DD7854(void *a1)
{
}

void sub_1C9DD787C(void *a1)
{
}

void sub_1C9DD7890(void *a1)
{
}

void sub_1C9DD78A4(void *a1)
{
}

void sub_1C9DD78B8(void *a1)
{
}

void sub_1C9DD78CC(void *a1)
{
}

void sub_1C9DD78E0(void *a1)
{
}

void sub_1C9DD78F4(void *a1)
{
}

void sub_1C9DD7908(void *a1)
{
}

void sub_1C9DD791C(void *a1)
{
}

void sub_1C9DD7930(void *a1)
{
}

id VoiceTriggerCapability.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void VoiceTriggerCapability.init()()
{
}

id VoiceTriggerCapability.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VoiceTriggerCapability();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for VoiceTriggerCapability(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for VoiceTriggerCapability);
}

uint64_t dispatch thunk of VoiceTriggerCapability.key.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of VoiceTriggerCapability.key.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of VoiceTriggerCapability.key.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of VoiceTriggerCapability.__allocating_init(status:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of VoiceTriggerCapability.supportsVoiceTrigger.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of static VoiceTriggerCapability.capabilityDescriptionMatchingSupportStatus(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of VoiceTriggerCapability.matches(descriptions:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of VoiceTriggerCapability.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of VoiceTriggerCapability.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB8))();
}

void type metadata accessor for atomic_flag()
{
  if (!qword_1EA5C6AA8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EA5C6AA8);
    }
  }
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_1C9DD7CA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RequestAnalyticsContext(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C9DD7D0C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6B20);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C9DD7D6C(uint64_t a1, unint64_t *a2)
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

void *sub_1C9DD7DA8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC808F0);
  uint64_t v3 = (void *)swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 16);
  uint64_t v5 = sub_1C9DD7E8C((uint64_t)&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_1C9DD808C();
  if (v5 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x1E4FBC860];
  }
  return v3;
}

uint64_t sub_1C9DD7E8C(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
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
  unint64_t v11 = a2;
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
    unint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    void *v11 = *v20;
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

uint64_t sub_1C9DD808C()
{
  return swift_release();
}

void OUTLINED_FUNCTION_0(void *a1@<X8>)
{
  *a1 = 0x6669636570736E55;
  a1[1] = 0xEB00000000646569;
}

unint64_t OUTLINED_FUNCTION_7()
{
  return 0xD000000000000025;
}

uint64_t OUTLINED_FUNCTION_8()
{
  return swift_dynamicCast();
}

uint64_t sub_1C9DD8148()
{
  return sub_1C9E0D8D0();
}

uint64_t sub_1C9DD8190()
{
  return sub_1C9DD8294();
}

uint64_t sub_1C9DD819C()
{
  return sub_1C9E0D8D0();
}

uint64_t sub_1C9DD81E4()
{
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_1C9DD8204()
{
  CapabilityKey.rawValue.getter();
  sub_1C9E0D150();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9DD8264()
{
  return sub_1C9E0D8A0();
}

uint64_t sub_1C9DD8294()
{
  return sub_1C9E0D8D0();
}

uint64_t sub_1C9DD82F8()
{
  return sub_1C9E0D8D0();
}

uint64_t sub_1C9DD833C()
{
  return sub_1C9E0D8D0();
}

unint64_t sub_1C9DD8380(unint64_t result)
{
  if (result >= 3) {
    return 3;
  }
  return result;
}

uint64_t sub_1C9DD8390(uint64_t result)
{
  return result;
}

BOOL sub_1C9DD8398(char *a1, char *a2)
{
  return sub_1C9DE5B30(*a1, *a2);
}

uint64_t sub_1C9DD83A4()
{
  return sub_1C9DD8148();
}

uint64_t sub_1C9DD83C0()
{
  return sub_1C9DD8264();
}

uint64_t sub_1C9DD83C8()
{
  return sub_1C9DD82F8();
}

unint64_t sub_1C9DD83E4@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_1C9DD8380(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1C9DD8410@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1C9DD8390(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_1C9DD843C(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(v2 + 16) = 0;
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  sub_1C9DD8774(0);
  return v2;
}

BOOL sub_1C9DD8468(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_beginAccess();
  BOOL v4 = atomic_flag_test_and_set((atomic_flag *)(v2 + 16));
  swift_endAccess();
  if (!v4)
  {
    uint64_t v5 = *(void (**)(uint64_t))(v2 + 24);
    if (v5)
    {
      swift_retain();
      v5(a1);
      sub_1C9DD8774((uint64_t)v5);
      uint64_t v6 = *(void *)(v2 + 24);
      *(void *)(v2 + 24) = 0;
      *(void *)(v2 + 32) = 0;
      sub_1C9DD8774(v6);
    }
  }
  return !v4;
}

uint64_t sub_1C9DD8518()
{
  sub_1C9DD8774(*(void *)(v0 + 24));
  return MEMORY[0x1F4186488](v0, 40, 7);
}

uint64_t type metadata accessor for SafetyBlock()
{
  return self;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SafetyBlockSignal(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SafetyBlockSignal(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C9DD86D8);
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

uint64_t sub_1C9DD8700(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1C9DD870C(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SafetyBlockSignal()
{
  return &type metadata for SafetyBlockSignal;
}

unint64_t sub_1C9DD8728()
{
  unint64_t result = qword_1EA5C6C20;
  if (!qword_1EA5C6C20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C6C20);
  }
  return result;
}

uint64_t sub_1C9DD8774(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return sub_1C9E0D8A0();
}

uint64_t sub_1C9DD87A0(unint64_t a1, char *a2)
{
  unint64_t v2 = a1;
  if (a1 >> 62) {
    goto LABEL_37;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_1C9E0D700())
  {
    uint64_t v18 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution17SpeakerCapability_primitivesMap;
    uint64_t v4 = 4;
    unint64_t v19 = v2;
    unint64_t v20 = v2 & 0xC000000000000001;
    while (1)
    {
      uint64_t v5 = v20 ? (char *)MEMORY[0x1CB78F680](v4 - 4, v2) : (char *)*(id *)(v2 + 8 * v4);
      unsigned int v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      uint64_t v8 = *(void *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key];
      unint64_t v9 = *(void *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key + 8];
      swift_bridgeObjectRetain();
      if ((sub_1C9E0D1A0() & 1) == 0) {
        goto LABEL_30;
      }
      swift_bridgeObjectRetain();
      if ((sub_1C9E0D1A0() & 1) == 0)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
LABEL_28:
        swift_bridgeObjectRelease();

        return 0;
      }
      unint64_t v10 = sub_1C9E0D160();
      unint64_t v11 = sub_1C9E09684(v10, v8, v9);
      MEMORY[0x1CB78F240](v11);
      swift_bridgeObjectRelease();
      uint64_t v12 = sub_1C9E0D750();
      swift_bridgeObjectRelease();
      if (v12)
      {
        if (v12 != 1)
        {
          swift_bridgeObjectRelease();

          goto LABEL_28;
        }
        if (!*(void *)(*(void *)&a2[v18] + 16)) {
          goto LABEL_32;
        }
        swift_bridgeObjectRetain();
        sub_1C9DD5CF8(v8, v9);
        if ((v13 & 1) == 0)
        {
          swift_bridgeObjectRelease();
LABEL_32:
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          return 0;
        }
        swift_unknownObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        type metadata accessor for ContinuousNumericCapabilityPrimitive();
        if (!swift_dynamicCastClass()) {
          goto LABEL_25;
        }
        BOOL v14 = sub_1C9DE4014((uint64_t)v6);

        swift_unknownObjectRelease();
        if (!v14)
        {
LABEL_26:

          goto LABEL_34;
        }
      }
      else
      {
        if (!*(void *)(*(void *)&a2[v18] + 16))
        {
LABEL_30:

          swift_bridgeObjectRelease();
LABEL_34:
          swift_bridgeObjectRelease();
          return 0;
        }
        swift_bridgeObjectRetain();
        sub_1C9DD5CF8(v8, v9);
        if ((v15 & 1) == 0)
        {

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_34;
        }
        swift_unknownObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        type metadata accessor for BooleanCapabilityPrimitive();
        if (!swift_dynamicCastClass())
        {
LABEL_25:

          swift_bridgeObjectRelease();
          swift_unknownObjectRelease();
          return 0;
        }
        swift_unknownObjectRetain();
        char v16 = sub_1C9DE3C80((uint64_t)v6);

        swift_unknownObjectRelease_n();
        if ((v16 & 1) == 0) {
          goto LABEL_26;
        }
      }
      ++v4;
      unint64_t v2 = v19;
      if (v7 == v3) {
        goto LABEL_38;
      }
    }
    __break(1u);
LABEL_37:
    swift_bridgeObjectRetain();
  }
LABEL_38:

  swift_bridgeObjectRelease();
  return 1;
}

uint64_t SpeakerQualityReference.init(rawValue:)(uint64_t result)
{
  if (result == 3000) {
    uint64_t v1 = 3000;
  }
  else {
    uint64_t v1 = 0;
  }
  if (result == 2000) {
    uint64_t v1 = 2000;
  }
  if (result == 1000) {
    uint64_t v1 = 1000;
  }
  if (result) {
    return v1;
  }
  return result;
}

BOOL sub_1C9DD8BF0(uint64_t *a1, uint64_t *a2)
{
  return sub_1C9E07420(*a1, *a2);
}

uint64_t sub_1C9DD8BFC()
{
  return sub_1C9DD8140(*v0);
}

uint64_t sub_1C9DD8C04()
{
  return sub_1C9DD81E4();
}

uint64_t sub_1C9DD8C0C(uint64_t a1)
{
  return sub_1C9DD8290(a1, *v1);
}

uint64_t sub_1C9DD8C14@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = SpeakerQualityReference.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_1C9DD8C48(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1C9DD8C54(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution17SpeakerCapability_primitivesMap) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9DD8CB8()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution17SpeakerCapability_key);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1C9DD8D80(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution17SpeakerCapability_key);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9DD8DE0(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_1C9DD8D80(v1, v2);
}

uint64_t (*sub_1C9DD8E20())()
{
  return j__swift_endAccess;
}

id SpeakerCapability.__allocating_init(status:qualityScore:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return SpeakerCapability.init(status:qualityScore:)(a1, a2);
}

id SpeakerCapability.init(status:qualityScore:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution17SpeakerCapability_primitivesMap;
  unsigned int v6 = v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC80980);
  *(void *)&v2[v5] = sub_1C9E0D0D0();
  OUTLINED_FUNCTION_0(&v6[OBJC_IVAR____TtC27SiriVirtualDeviceResolution17SpeakerCapability_key]);

  v13.receiver = v6;
  v13.super_class = (Class)type metadata accessor for SpeakerCapability();
  id v7 = objc_msgSendSuper2(&v13, sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6CA8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C9E0F340;
  *(void *)(inited + 32) = 0xD000000000000020;
  *(void *)(inited + 40) = 0x80000001C9E11030;
  objc_allocWithZone((Class)type metadata accessor for BooleanCapabilityPrimitive());
  id v9 = v7;
  *(void *)(inited + 48) = sub_1C9DE3B00(a1);
  *(void *)(inited + 56) = &off_1F241C2E8;
  *(void *)(inited + 64) = 0xD00000000000001FLL;
  *(void *)(inited + 72) = 0x80000001C9E11060;
  id v10 = objc_allocWithZone((Class)type metadata accessor for ContinuousNumericCapabilityPrimitive());
  *(void *)(inited + 80) = sub_1C9DE3F40((double)a2);
  *(void *)(inited + 88) = &off_1F241C2D8;
  uint64_t v11 = sub_1C9E0D0D0();
  sub_1C9DD6870(4, v11);
  swift_bridgeObjectRelease();

  return v9;
}

uint64_t type metadata accessor for SpeakerCapability()
{
  return self;
}

uint64_t sub_1C9DD90FC()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution17SpeakerCapability_primitivesMap);
  swift_bridgeObjectRetain();
  unint64_t v2 = OUTLINED_FUNCTION_2_0();
  uint64_t v4 = sub_1C9DD6B68(v2, v3, v1);
  swift_bridgeObjectRelease();
  if (!v4) {
    return 0;
  }
  type metadata accessor for BooleanCapabilityPrimitive();
  uint64_t v5 = swift_dynamicCastClass();
  if (v5) {
    uint64_t v6 = *(void *)(v5 + OBJC_IVAR___SVDBooleanCapabilityPrimitive_supportStatus);
  }
  else {
    uint64_t v6 = 0;
  }
  swift_unknownObjectRelease();
  return v6;
}

uint64_t sub_1C9DD91C8()
{
  if (!*(void *)(*(void *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution17SpeakerCapability_primitivesMap)
                  + 16))
    return 0;
  swift_bridgeObjectRetain();
  unint64_t v1 = OUTLINED_FUNCTION_3_0();
  sub_1C9DD5CF8(v1, v2);
  if ((v3 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  type metadata accessor for ContinuousNumericCapabilityPrimitive();
  uint64_t v4 = swift_dynamicCastClass();
  if (!v4)
  {
    swift_unknownObjectRelease();
    return 0;
  }
  double v5 = *(double *)(v4 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution36ContinuousNumericCapabilityPrimitive_value);
  uint64_t result = swift_unknownObjectRelease();
  if ((~*(void *)&v5 & 0x7FF0000000000000) != 0)
  {
    if (v5 > -9.22337204e18)
    {
      if (v5 < 9.22337204e18) {
        return (uint64_t)v5;
      }
      goto LABEL_13;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_13:
  __break(1u);
  return result;
}

id sub_1C9DD92C4(uint64_t a1)
{
  type metadata accessor for BooleanCapabilityPrimitive();
  unint64_t v2 = OUTLINED_FUNCTION_2_0();
  return sub_1C9DE3B5C(v2, v3, a1);
}

id sub_1C9DD9330()
{
  type metadata accessor for ContinuousNumericCapabilityPrimitive();
  uint64_t v0 = (void *)OUTLINED_FUNCTION_3_0();
  return sub_1C9DE3F9C(v0, v1, v2, v3);
}

uint64_t sub_1C9DD93AC(unint64_t a1)
{
  return sub_1C9DD87A0(a1, (char *)v1) & 1;
}

uint64_t static SpeakerCapability.supportsSecureCoding.getter()
{
  return 1;
}

char *SpeakerCapability.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return SpeakerCapability.init(coder:)(a1);
}

char *SpeakerCapability.init(coder:)(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution17SpeakerCapability_primitivesMap;
  uint64_t v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC80980);
  *(void *)&v1[v3] = sub_1C9E0D0D0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution17SpeakerCapability_key]);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for SpeakerCapability();
  double v5 = (char *)objc_msgSendSuper2(&v7, sel_init);
  sub_1C9DD7218((uint64_t)a1);

  if (!*(void *)(*(void *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution17SpeakerCapability_primitivesMap] + 16))
  {

    return 0;
  }
  return v5;
}

id SpeakerCapability.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void SpeakerCapability.init()()
{
}

id SpeakerCapability.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SpeakerCapability();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1C9DD970C()
{
  unint64_t result = qword_1EA5C6CB0;
  if (!qword_1EA5C6CB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C6CB0);
  }
  return result;
}

uint64_t sub_1C9DD9758@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1C9DD8CB8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

ValueMetadata *type metadata accessor for SpeakerQualityReference()
{
  return &type metadata for SpeakerQualityReference;
}

uint64_t method lookup function for SpeakerCapability(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SpeakerCapability);
}

uint64_t dispatch thunk of SpeakerCapability.key.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of SpeakerCapability.key.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of SpeakerCapability.key.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of SpeakerCapability.__allocating_init(status:qualityScore:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of SpeakerCapability.supportStatus.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of SpeakerCapability.qualityScore.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of static SpeakerCapability.capabilityDescriptionMatchingSupportStatus(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of static SpeakerCapability.capabilityDescriptionMatchingQualityScoreRange(lowerBound:upperBound:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of SpeakerCapability.matches(descriptions:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of SpeakerCapability.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of SpeakerCapability.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t sub_1C9DD996C(uint64_t a1)
{
  uint64_t v2 = sub_1C9E0D3F0();
  return sub_1C9DD9F0C(a1, v2);
}

unint64_t sub_1C9DD99C0(unsigned __int8 a1)
{
  uint64_t v2 = sub_1C9DD8294();
  return sub_1C9DD9B7C(a1, v2);
}

uint64_t sub_1C9DD9A04(uint64_t a1)
{
  uint64_t v2 = sub_1C9E0D3F0();
  return sub_1C9DD9F0C(a1, v2);
}

unint64_t sub_1C9DD9A58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1C9E0D7F0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        objc_super v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1C9E0D7F0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1C9DD9B3C()
{
  unint64_t result = qword_1EA5C6CC0;
  if (!qword_1EA5C6CC0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA5C6CC0);
  }
  return result;
}

unint64_t sub_1C9DD9B7C(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0x80000001C9E10CF0;
      unint64_t v8 = 0xD000000000000017;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          uint64_t v9 = "AudioPlaybackCapability";
          goto LABEL_14;
        case 2:
          uint64_t v9 = "VideoPlaybackCapability";
          unint64_t v8 = 0xD000000000000013;
          goto LABEL_14;
        case 3:
          unint64_t v8 = 0xD000000000000018;
          uint64_t v9 = "AppLaunchCapability";
          goto LABEL_14;
        case 4:
          uint64_t v9 = "SpeakerQualityReference";
          unint64_t v8 = 0xD000000000000011;
          goto LABEL_14;
        case 5:
          uint64_t v9 = "@32@0:8q16q24";
          unint64_t v8 = 0xD000000000000016;
          goto LABEL_14;
        case 6:
          unint64_t v8 = 0xD000000000000023;
          uint64_t v9 = "SpeakerCapability";
          goto LABEL_14;
        case 7:
          unint64_t v8 = 0xD00000000000001ALL;
          uint64_t v9 = "sHandlingCapability";
          goto LABEL_14;
        case 8:
          unint64_t v8 = 0x626170614358554DLL;
          unint64_t v7 = 0xED00007974696C69;
          break;
        case 9:
          unint64_t v8 = 0xD00000000000001ALL;
          uint64_t v9 = "Capability";
          goto LABEL_14;
        case 0xA:
          unint64_t v8 = 0xD000000000000019;
          uint64_t v9 = "AssistantEnabledCapability";
LABEL_14:
          unint64_t v7 = (unint64_t)v9 | 0x8000000000000000;
          break;
        case 0xB:
          unint64_t v8 = 0x6669636570736E55;
          unint64_t v7 = 0xEB00000000646569;
          break;
        default:
          break;
      }
      unint64_t v10 = 0x80000001C9E10CF0;
      unint64_t v11 = 0xD000000000000017;
      switch(v6)
      {
        case 1:
          uint64_t v12 = "AudioPlaybackCapability";
          goto LABEL_27;
        case 2:
          uint64_t v12 = "VideoPlaybackCapability";
          unint64_t v11 = 0xD000000000000013;
          goto LABEL_27;
        case 3:
          unint64_t v11 = 0xD000000000000018;
          uint64_t v12 = "AppLaunchCapability";
          goto LABEL_27;
        case 4:
          uint64_t v12 = "SpeakerQualityReference";
          unint64_t v11 = 0xD000000000000011;
          goto LABEL_27;
        case 5:
          uint64_t v12 = "@32@0:8q16q24";
          unint64_t v11 = 0xD000000000000016;
          goto LABEL_27;
        case 6:
          unint64_t v11 = 0xD000000000000023;
          uint64_t v12 = "SpeakerCapability";
          goto LABEL_27;
        case 7:
          unint64_t v11 = 0xD00000000000001ALL;
          uint64_t v12 = "sHandlingCapability";
          goto LABEL_27;
        case 8:
          unint64_t v11 = 0x626170614358554DLL;
          unint64_t v10 = 0xED00007974696C69;
          break;
        case 9:
          unint64_t v11 = 0xD00000000000001ALL;
          uint64_t v12 = "Capability";
          goto LABEL_27;
        case 10:
          unint64_t v11 = 0xD000000000000019;
          uint64_t v12 = "AssistantEnabledCapability";
LABEL_27:
          unint64_t v10 = (unint64_t)v12 | 0x8000000000000000;
          break;
        case 11:
          unint64_t v11 = 0x6669636570736E55;
          unint64_t v10 = 0xEB00000000646569;
          break;
        default:
          break;
      }
      if (v8 == v11 && v7 == v10) {
        break;
      }
      char v14 = sub_1C9E0D7F0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v14 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v5;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
    swift_bridgeObjectRelease_n();
  }
  return v4;
}

uint64_t sub_1C9DD9F0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  uint64_t v4 = a2 & ~v3;
  OUTLINED_FUNCTION_1_0();
  if (v6)
  {
    v5(0);
    id v7 = *(id *)(*(void *)(v2 + 48) + 8 * v4);
    char v8 = sub_1C9E0D400();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v3;
      uint64_t v4 = (v4 + 1) & v9;
      OUTLINED_FUNCTION_1_0();
      if (v10)
      {
        do
        {
          id v11 = *(id *)(*(void *)(v2 + 48) + 8 * v4);
          char v12 = sub_1C9E0D400();

          if (v12) {
            break;
          }
          uint64_t v4 = (v4 + 1) & v9;
          OUTLINED_FUNCTION_1_0();
        }
        while ((v13 & 1) != 0);
      }
    }
  }
  return v4;
}

unint64_t OUTLINED_FUNCTION_2_0()
{
  return 0xD000000000000020;
}

unint64_t OUTLINED_FUNCTION_3_0()
{
  return 0xD00000000000001FLL;
}

uint64_t sub_1C9DDA034(unint64_t a1, char *a2)
{
  if (a1 >> 62) {
    goto LABEL_30;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_1C9E0D700())
  {
    uint64_t v17 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution26ProfileSwitchingCapability_primitivesMap;
    uint64_t v4 = 4;
    while (1)
    {
      uint64_t v5 = (a1 & 0xC000000000000001) != 0
         ? (char *)MEMORY[0x1CB78F680](v4 - 4, a1)
         : (char *)*(id *)(a1 + 8 * v4);
      char v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      uint64_t v8 = *(void *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key];
      unint64_t v9 = *(void *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key + 8];
      swift_bridgeObjectRetain();
      if ((sub_1C9E0D1A0() & 1) == 0)
      {

        swift_bridgeObjectRelease();
LABEL_27:
        swift_bridgeObjectRelease();
        return 0;
      }
      swift_bridgeObjectRetain();
      if ((sub_1C9E0D1A0() & 1) == 0)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
LABEL_20:
        swift_bridgeObjectRelease();
        char v15 = a2;
        goto LABEL_24;
      }
      unint64_t v10 = sub_1C9E0D160();
      unint64_t v11 = sub_1C9E09684(v10, v8, v9);
      MEMORY[0x1CB78F240](v11);
      swift_bridgeObjectRelease();
      uint64_t v12 = sub_1C9E0D750();
      swift_bridgeObjectRelease();
      if (v12)
      {
        swift_bridgeObjectRelease();

        goto LABEL_20;
      }
      if (!*(void *)(*(void *)&a2[v17] + 16)) {
        goto LABEL_23;
      }
      swift_bridgeObjectRetain();
      sub_1C9DD5CF8(v8, v9);
      if ((v13 & 1) == 0)
      {
        swift_bridgeObjectRelease();
LABEL_23:
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        char v15 = v6;
LABEL_24:

        return 0;
      }
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      type metadata accessor for BooleanCapabilityPrimitive();
      if (!swift_dynamicCastClass())
      {

        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        return 0;
      }
      swift_unknownObjectRetain();
      char v14 = sub_1C9DE3C80((uint64_t)v6);

      swift_unknownObjectRelease_n();
      if ((v14 & 1) == 0)
      {

        goto LABEL_27;
      }
      ++v4;
      if (v7 == v3) {
        goto LABEL_31;
      }
    }
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
  }
LABEL_31:

  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_1C9DDA384(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution26ProfileSwitchingCapability_primitivesMap) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9DDA3E8()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution26ProfileSwitchingCapability_key);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1C9DDA4B0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution26ProfileSwitchingCapability_key);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9DDA510(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_1C9DDA4B0(v1, v2);
}

uint64_t (*sub_1C9DDA550())()
{
  return j__swift_endAccess;
}

id ProfileSwitchingCapability.__allocating_init(status:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return ProfileSwitchingCapability.init(status:)(a1);
}

id ProfileSwitchingCapability.init(status:)(uint64_t a1)
{
  uint64_t v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution26ProfileSwitchingCapability_primitivesMap;
  uint64_t v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC80980);
  *(void *)&v1[v3] = sub_1C9E0D0D0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution26ProfileSwitchingCapability_key]);

  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for ProfileSwitchingCapability();
  id v5 = objc_msgSendSuper2(&v12, sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC808D8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C9E0F330;
  *(void *)(inited + 32) = 0xD000000000000029;
  *(void *)(inited + 40) = 0x80000001C9E11150;
  objc_allocWithZone((Class)type metadata accessor for BooleanCapabilityPrimitive());
  id v7 = v5;
  *(void *)(inited + 48) = sub_1C9DE3B00(a1);
  uint64_t v8 = sub_1C9E0D0D0();
  sub_1C9DD60F4(v8);
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  sub_1C9DD689C(7, v10);
  swift_bridgeObjectRelease();

  return v7;
}

uint64_t type metadata accessor for ProfileSwitchingCapability()
{
  return self;
}

uint64_t sub_1C9DDA7CC()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution26ProfileSwitchingCapability_primitivesMap);
  swift_bridgeObjectRetain();
  unint64_t v2 = OUTLINED_FUNCTION_1_1();
  uint64_t v4 = sub_1C9DD6B68(v2, v3, v1);
  swift_bridgeObjectRelease();
  if (!v4) {
    return 0;
  }
  type metadata accessor for BooleanCapabilityPrimitive();
  uint64_t v5 = swift_dynamicCastClass();
  if (v5) {
    uint64_t v6 = *(void *)(v5 + OBJC_IVAR___SVDBooleanCapabilityPrimitive_supportStatus);
  }
  else {
    uint64_t v6 = 0;
  }
  swift_unknownObjectRelease();
  return v6;
}

id sub_1C9DDA864(uint64_t a1)
{
  type metadata accessor for BooleanCapabilityPrimitive();
  unint64_t v2 = OUTLINED_FUNCTION_1_1();
  return sub_1C9DE3B5C(v2, v3, a1);
}

uint64_t sub_1C9DDA8D0(unint64_t a1)
{
  return sub_1C9DDA034(a1, (char *)v1) & 1;
}

uint64_t static ProfileSwitchingCapability.supportsSecureCoding.getter()
{
  return 1;
}

char *ProfileSwitchingCapability.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return ProfileSwitchingCapability.init(coder:)(a1);
}

char *ProfileSwitchingCapability.init(coder:)(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution26ProfileSwitchingCapability_primitivesMap;
  uint64_t v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC80980);
  *(void *)&v1[v3] = sub_1C9E0D0D0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution26ProfileSwitchingCapability_key]);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for ProfileSwitchingCapability();
  uint64_t v5 = (char *)objc_msgSendSuper2(&v7, sel_init);
  sub_1C9DD76A0((uint64_t)a1);

  if (!*(void *)(*(void *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution26ProfileSwitchingCapability_primitivesMap]
                  + 16))
  {

    return 0;
  }
  return v5;
}

id ProfileSwitchingCapability.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void ProfileSwitchingCapability.init()()
{
}

id ProfileSwitchingCapability.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ProfileSwitchingCapability();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C9DDAC2C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1C9DDA3E8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t method lookup function for ProfileSwitchingCapability(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ProfileSwitchingCapability);
}

uint64_t dispatch thunk of ProfileSwitchingCapability.key.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of ProfileSwitchingCapability.key.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of ProfileSwitchingCapability.key.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of ProfileSwitchingCapability.__allocating_init(status:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of ProfileSwitchingCapability.supportsProfileSwitching.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of static ProfileSwitchingCapability.capabilityDescriptionMatchingSupportStatus(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of ProfileSwitchingCapability.matches(descriptions:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of ProfileSwitchingCapability.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of ProfileSwitchingCapability.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

unint64_t OUTLINED_FUNCTION_1_1()
{
  return 0xD000000000000029;
}

uint64_t sub_1C9DDADFC(unint64_t a1, char *a2)
{
  if (a1 >> 62) {
    goto LABEL_30;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_1C9E0D700())
  {
    uint64_t v17 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution23AudioPlaybackCapability_primitivesMap;
    uint64_t v4 = 4;
    while (1)
    {
      uint64_t v5 = (a1 & 0xC000000000000001) != 0
         ? (char *)MEMORY[0x1CB78F680](v4 - 4, a1)
         : (char *)*(id *)(a1 + 8 * v4);
      uint64_t v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      uint64_t v8 = *(void *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key];
      unint64_t v9 = *(void *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key + 8];
      swift_bridgeObjectRetain();
      if ((sub_1C9E0D1A0() & 1) == 0)
      {

        swift_bridgeObjectRelease();
LABEL_27:
        swift_bridgeObjectRelease();
        return 0;
      }
      swift_bridgeObjectRetain();
      if ((sub_1C9E0D1A0() & 1) == 0)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
LABEL_20:
        swift_bridgeObjectRelease();
        char v15 = a2;
        goto LABEL_24;
      }
      unint64_t v10 = sub_1C9E0D160();
      unint64_t v11 = sub_1C9E09684(v10, v8, v9);
      MEMORY[0x1CB78F240](v11);
      swift_bridgeObjectRelease();
      uint64_t v12 = sub_1C9E0D750();
      swift_bridgeObjectRelease();
      if (v12)
      {
        swift_bridgeObjectRelease();

        goto LABEL_20;
      }
      if (!*(void *)(*(void *)&a2[v17] + 16)) {
        goto LABEL_23;
      }
      swift_bridgeObjectRetain();
      sub_1C9DD5CF8(v8, v9);
      if ((v13 & 1) == 0)
      {
        swift_bridgeObjectRelease();
LABEL_23:
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        char v15 = v6;
LABEL_24:

        return 0;
      }
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      type metadata accessor for BooleanCapabilityPrimitive();
      if (!swift_dynamicCastClass())
      {

        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        return 0;
      }
      swift_unknownObjectRetain();
      char v14 = sub_1C9DE3C80((uint64_t)v6);

      swift_unknownObjectRelease_n();
      if ((v14 & 1) == 0)
      {

        goto LABEL_27;
      }
      ++v4;
      if (v7 == v3) {
        goto LABEL_31;
      }
    }
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
  }
LABEL_31:

  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_1C9DDB14C(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23AudioPlaybackCapability_primitivesMap) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9DDB1B0()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23AudioPlaybackCapability_key);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1C9DDB278(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23AudioPlaybackCapability_key);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9DDB2D8(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_1C9DDB278(v1, v2);
}

uint64_t (*sub_1C9DDB318())()
{
  return j__swift_endAccess;
}

id AudioPlaybackCapability.__allocating_init(status:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return AudioPlaybackCapability.init(status:)(a1);
}

id AudioPlaybackCapability.init(status:)(uint64_t a1)
{
  uint64_t v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution23AudioPlaybackCapability_primitivesMap;
  uint64_t v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC80980);
  *(void *)&v1[v3] = sub_1C9E0D0D0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23AudioPlaybackCapability_key]);

  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for AudioPlaybackCapability();
  id v5 = objc_msgSendSuper2(&v12, sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC808D8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C9E0F330;
  *(void *)(inited + 32) = 0xD000000000000026;
  *(void *)(inited + 40) = 0x80000001C9E11240;
  objc_allocWithZone((Class)type metadata accessor for BooleanCapabilityPrimitive());
  id v7 = v5;
  *(void *)(inited + 48) = sub_1C9DE3B00(a1);
  uint64_t v8 = sub_1C9E0D0D0();
  sub_1C9DD60F4(v8);
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  sub_1C9DD68C8(0, v10);
  swift_bridgeObjectRelease();

  return v7;
}

uint64_t type metadata accessor for AudioPlaybackCapability()
{
  return self;
}

uint64_t sub_1C9DDB594()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23AudioPlaybackCapability_primitivesMap);
  swift_bridgeObjectRetain();
  unint64_t v2 = OUTLINED_FUNCTION_1_2();
  uint64_t v4 = sub_1C9DD6B68(v2, v3, v1);
  swift_bridgeObjectRelease();
  if (!v4) {
    return 0;
  }
  type metadata accessor for BooleanCapabilityPrimitive();
  uint64_t v5 = swift_dynamicCastClass();
  if (v5) {
    uint64_t v6 = *(void *)(v5 + OBJC_IVAR___SVDBooleanCapabilityPrimitive_supportStatus);
  }
  else {
    uint64_t v6 = 0;
  }
  swift_unknownObjectRelease();
  return v6;
}

id sub_1C9DDB62C(uint64_t a1)
{
  type metadata accessor for BooleanCapabilityPrimitive();
  unint64_t v2 = OUTLINED_FUNCTION_1_2();
  return sub_1C9DE3B5C(v2, v3, a1);
}

uint64_t sub_1C9DDB698(unint64_t a1)
{
  return sub_1C9DDADFC(a1, (char *)v1) & 1;
}

uint64_t static AudioPlaybackCapability.supportsSecureCoding.getter()
{
  return 1;
}

char *AudioPlaybackCapability.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return AudioPlaybackCapability.init(coder:)(a1);
}

char *AudioPlaybackCapability.init(coder:)(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution23AudioPlaybackCapability_primitivesMap;
  uint64_t v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC80980);
  *(void *)&v1[v3] = sub_1C9E0D0D0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23AudioPlaybackCapability_key]);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for AudioPlaybackCapability();
  uint64_t v5 = (char *)objc_msgSendSuper2(&v7, sel_init);
  sub_1C9DD76CC((uint64_t)a1);

  if (!*(void *)(*(void *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23AudioPlaybackCapability_primitivesMap]
                  + 16))
  {

    return 0;
  }
  return v5;
}

id AudioPlaybackCapability.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void AudioPlaybackCapability.init()()
{
}

id AudioPlaybackCapability.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AudioPlaybackCapability();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C9DDB9F4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1C9DDB1B0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t method lookup function for AudioPlaybackCapability(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AudioPlaybackCapability);
}

uint64_t dispatch thunk of AudioPlaybackCapability.key.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of AudioPlaybackCapability.key.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of AudioPlaybackCapability.key.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of AudioPlaybackCapability.__allocating_init(status:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of AudioPlaybackCapability.supportsAudioPlayback.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of static AudioPlaybackCapability.capabilityDescriptionMatchingSupportStatus(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of AudioPlaybackCapability.matches(descriptions:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of AudioPlaybackCapability.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of AudioPlaybackCapability.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB8))();
}

unint64_t OUTLINED_FUNCTION_1_2()
{
  return 0xD000000000000026;
}

uint64_t sub_1C9DDBBC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D80);
  MEMORY[0x1F4188790]();
  objc_super v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for RequestAnalyticsContext(0);
  MEMORY[0x1F4188790]();
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (__swift_getEnumTagSinglePayload(a1, 1, v10) == 1)
  {
    sub_1C9DE3784(a1, &qword_1EA5C6D80);
    sub_1C9DE2B4C(a2, a3, (uint64_t)v7);
    swift_bridgeObjectRelease();
    return sub_1C9DE3784((uint64_t)v7, &qword_1EA5C6D80);
  }
  else
  {
    sub_1C9DE2AEC(a1, (uint64_t)v9, (void (*)(void))type metadata accessor for RequestAnalyticsContext);
    sub_1C9DE2CC4((uint64_t)v9, a2, a3);
    return swift_bridgeObjectRelease();
  }
}

SiriVirtualDeviceResolution::ExecutionInfo::Action_optional __swiftcall ExecutionInfo.Action.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 0;
  char v3 = 4;
  switch(rawValue)
  {
    case 0:
      goto LABEL_6;
    case 1:
      char v2 = 1;
      goto LABEL_6;
    case 2:
      char v2 = 2;
      goto LABEL_6;
    case 3:
      char v2 = 3;
LABEL_6:
      char v3 = v2;
      break;
    case 4:
      break;
    case 5:
      char v3 = 5;
      break;
    case 6:
      char v3 = 6;
      break;
    case 7:
      char v3 = 7;
      break;
    case 8:
      char v3 = 8;
      break;
    case 9:
      char v3 = 9;
      break;
    case 10:
      char v3 = 10;
      break;
    case 11:
      char v3 = 11;
      break;
    case 12:
      char v3 = 12;
      break;
    case 13:
      char v3 = 13;
      break;
    case 14:
      char v3 = 14;
      break;
    case 15:
      char v3 = 15;
      break;
    case 16:
      char v3 = 16;
      break;
    case 17:
      char v3 = 17;
      break;
    case 18:
      char v3 = 18;
      break;
    case 19:
      char v3 = 19;
      break;
    case 20:
      char v3 = 20;
      break;
    case 21:
      char v3 = 21;
      break;
    default:
      char v3 = 22;
      break;
  }
  char *v1 = v3;
  return (SiriVirtualDeviceResolution::ExecutionInfo::Action_optional)rawValue;
}

uint64_t sub_1C9DDBE58()
{
  return sub_1C9DD8144(*v0);
}

uint64_t sub_1C9DDBE60(uint64_t a1)
{
  return sub_1C9DD8784(a1, *v1);
}

uint64_t sub_1C9DDBE68(uint64_t a1)
{
  return sub_1C9DD828C(a1, *v1);
}

SiriVirtualDeviceResolution::ExecutionInfo::Action_optional sub_1C9DDBE70(Swift::Int *a1)
{
  return ExecutionInfo.Action.init(rawValue:)(*a1);
}

uint64_t ExecutionInfo.executionId.getter@<X0>(uint64_t a1@<X8>)
{
  sub_1C9E0CFF0();
  OUTLINED_FUNCTION_2_1();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  return v5(a1, v1, v3);
}

uint64_t ExecutionInfo.executionId.setter(uint64_t a1)
{
  sub_1C9E0CFF0();
  OUTLINED_FUNCTION_2_1();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 40);
  return v5(v1, a1, v3);
}

uint64_t (*ExecutionInfo.executionId.modify())()
{
  return nullsub_1;
}

uint64_t ExecutionInfo.action.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for ExecutionInfo(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 20));
  return result;
}

uint64_t type metadata accessor for ExecutionInfo(uint64_t a1)
{
  return sub_1C9DE28E0(a1, (uint64_t *)&unk_1EA5C6D40);
}

uint64_t ExecutionInfo.action.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for ExecutionInfo(0);
  *(unsigned char *)(v1 + *(int *)(result + 20)) = v2;
  return result;
}

uint64_t (*ExecutionInfo.action.modify())()
{
  return nullsub_1;
}

uint64_t ExecutionInfo.quickStopActionResult.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for ExecutionInfo(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 24));
  return result;
}

uint64_t ExecutionInfo.quickStopActionResult.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for ExecutionInfo(0);
  *(unsigned char *)(v1 + *(int *)(result + 24)) = v2;
  return result;
}

uint64_t (*ExecutionInfo.quickStopActionResult.modify())()
{
  return nullsub_1;
}

uint64_t ExecutionInfo.init(executionId:action:quickStopActionResult:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  char v6 = *a2;
  char v7 = *a3;
  uint64_t v8 = type metadata accessor for ExecutionInfo(0);
  uint64_t v9 = *(int *)(v8 + 24);
  sub_1C9E0CFF0();
  OUTLINED_FUNCTION_2_1();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 32))(a4, a1);
  *(unsigned char *)(a4 + *(int *)(v8 + 20)) = v6;
  *(unsigned char *)(a4 + v9) = v7;
  return result;
}

BOOL static CrossDeviceCommandExecution.Result.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t CrossDeviceCommandExecution.Result.hash(into:)()
{
  return sub_1C9E0D8A0();
}

uint64_t CrossDeviceCommandExecution.Result.hashValue.getter()
{
  return sub_1C9E0D8D0();
}

uint64_t sub_1C9DDC1F0()
{
  return sub_1C9E0D8D0();
}

uint64_t CrossDeviceCommandExecution.FailureReason.asNSNumber.getter()
{
  return sub_1C9E0D300();
}

uint64_t CrossDeviceCommandExecution.FailureReason.rawValue.getter()
{
  return *v0;
}

SiriVirtualDeviceResolution::CrossDeviceCommandExecution::FailureReason_optional __swiftcall CrossDeviceCommandExecution.FailureReason.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 4;
  if ((unint64_t)rawValue < 4) {
    char v2 = rawValue;
  }
  char *v1 = v2;
  return (SiriVirtualDeviceResolution::CrossDeviceCommandExecution::FailureReason_optional)rawValue;
}

SiriVirtualDeviceResolution::CrossDeviceCommandExecution::FailureReason_optional sub_1C9DDC258(Swift::Int *a1)
{
  return CrossDeviceCommandExecution.FailureReason.init(rawValue:)(*a1);
}

uint64_t sub_1C9DDC260@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CrossDeviceCommandExecution.FailureReason.rawValue.getter();
  *a1 = result;
  return result;
}

SiriVirtualDeviceResolution::HomeKitTarget_optional __swiftcall HomeKitTarget.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 8;
  if ((unint64_t)rawValue < 8) {
    char v2 = rawValue;
  }
  char *v1 = v2;
  return (SiriVirtualDeviceResolution::HomeKitTarget_optional)rawValue;
}

SiriVirtualDeviceResolution::HomeKitTarget_optional sub_1C9DDC29C(Swift::Int *a1)
{
  return HomeKitTarget.init(rawValue:)(*a1);
}

uint64_t sub_1C9DDC2A4()
{
  return DeviceResolutionAnalytics.logCommandExecution(_:)();
}

uint64_t DeviceResolutionAnalytics.logCommandExecution(_:)()
{
  uint64_t v0 = sub_1C9E0D010();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_4_0();
  if (qword_1EA5C6A78 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v0, (uint64_t)qword_1EA5C98B8);
  uint64_t v1 = OUTLINED_FUNCTION_10();
  v2(v1);
  uint64_t v3 = sub_1C9E0D000();
  os_log_type_t v4 = sub_1C9E0D320();
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)swift_slowAlloc() = 0;
    OUTLINED_FUNCTION_21(&dword_1C9DD3000, v5, v6, "DeviceResolutionAnalytics#logCommandExecution() default implementation should not be used");
    OUTLINED_FUNCTION_15();
  }

  uint64_t v7 = OUTLINED_FUNCTION_14();
  return v8(v7);
}

void sub_1C9DDC3D0(SiriVirtualDeviceResolution::HomeKitTarget a1, uint64_t a2, uint64_t a3)
{
}

Swift::Void __swiftcall DeviceResolutionAnalytics.selectHomeKitTarget(_:for:)(SiriVirtualDeviceResolution::HomeKitTarget _, Swift::String a2)
{
  uint64_t v2 = sub_1C9E0D010();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_4_0();
  if (qword_1EA5C6A78 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v2, (uint64_t)qword_1EA5C98B8);
  uint64_t v3 = OUTLINED_FUNCTION_10();
  v4(v3);
  uint64_t v5 = sub_1C9E0D000();
  os_log_type_t v6 = sub_1C9E0D320();
  if (os_log_type_enabled(v5, v6))
  {
    *(_WORD *)swift_slowAlloc() = 0;
    OUTLINED_FUNCTION_21(&dword_1C9DD3000, v7, v8, "DeviceResolutionAnalytics#selectHomeKitTarget() default implementation should not be used");
    OUTLINED_FUNCTION_15();
  }

  uint64_t v9 = OUTLINED_FUNCTION_14();
  v10(v9);
}

uint64_t sub_1C9DDC4FC()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for RequestAnalyticsContext(0) + 20));
  if (v1 && (uint64_t v2 = *(void *)(v1 + 16)) != 0)
  {
    uint64_t v3 = swift_bridgeObjectRetain() + 40;
    uint64_t v4 = MEMORY[0x1E4FBC868];
    while (1)
    {
      id v5 = *(id *)(v3 - 8);
      uint64_t v6 = sub_1C9E0D300();
      if ((v4 & 0xC000000000000001) != 0)
      {
        if (v4 >= 0) {
          v4 &= 0xFFFFFFFFFFFFFF8uLL;
        }
        uint64_t v7 = sub_1C9E0D4D0();
        if (__OFADD__(v7, 1)) {
          goto LABEL_22;
        }
        sub_1C9DFF9C4(v4, v7 + 1);
        uint64_t v4 = v8;
      }
      swift_isUniquelyReferenced_nonNull_native();
      uint64_t v9 = sub_1C9DD996C((uint64_t)v5);
      if (__OFADD__(*(void *)(v4 + 16), (v10 & 1) == 0)) {
        break;
      }
      unint64_t v11 = v9;
      char v12 = v10;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA5C6DF0);
      if (sub_1C9E0D610())
      {
        uint64_t v13 = sub_1C9DD996C((uint64_t)v5);
        if ((v12 & 1) != (v14 & 1)) {
          goto LABEL_24;
        }
        unint64_t v11 = v13;
      }
      if (v12)
      {
        uint64_t v15 = *(void *)(v4 + 56);

        *(void *)(v15 + 8 * v11) = v6;
      }
      else
      {
        *(void *)(v4 + 8 * (v11 >> 6) + 64) |= 1 << v11;
        *(void *)(*(void *)(v4 + 48) + 8 * v11) = v5;
        *(void *)(*(void *)(v4 + 56) + 8 * v11) = v6;
        uint64_t v16 = *(void *)(v4 + 16);
        BOOL v17 = __OFADD__(v16, 1);
        uint64_t v18 = v16 + 1;
        if (v17) {
          goto LABEL_23;
        }
        *(void *)(v4 + 16) = v18;
        id v19 = v5;
      }
      v3 += 16;

      swift_bridgeObjectRelease();
      if (!--v2)
      {
        swift_bridgeObjectRelease();
        return v4;
      }
    }
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    sub_1C9DD7D6C(0, (unint64_t *)&qword_1EA5C6CC0);
    uint64_t result = sub_1C9E0D830();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC868];
  }
  return result;
}

uint64_t sub_1C9DDC6EC(uint64_t a1)
{
  *(void *)(v1 + 40) = a1;
  return MEMORY[0x1F41817F8]();
}

id sub_1C9DDC6F8()
{
  uint64_t v1 = *(void **)(v0 + 40);
  id v2 = v1;
  if (!v1)
  {
    id v3 = objc_msgSend(self, sel_currentContext);
    uint64_t v4 = self;
    id v5 = objc_msgSend(v4, sel_serviceName);
    if (!v5)
    {
      sub_1C9E0D120();
      id v5 = (id)sub_1C9E0D110();
      swift_bridgeObjectRelease();
    }
    id v2 = objc_msgSend(v3, sel_createXPCConnectionWithMachServiceName_options_, v5, 0);

    if (v2)
    {
      id v6 = v2;
      id v7 = objc_msgSend(v4, sel_xpcInterface);
      objc_msgSend(v6, sel_setRemoteObjectInterface_, v7);

      uint64_t v18 = sub_1C9DE353C;
      uint64_t v19 = v0;
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 1107296256;
      uint64_t v16 = sub_1C9DDC968;
      BOOL v17 = &block_descriptor_70;
      uint64_t v8 = _Block_copy(&v14);
      id v9 = v6;
      swift_retain();
      swift_release();
      objc_msgSend(v9, sel_setInvalidationHandler_, v8);
      _Block_release(v8);

      uint64_t v18 = sub_1C9DE357C;
      uint64_t v19 = v0;
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 1107296256;
      uint64_t v16 = sub_1C9DDC968;
      BOOL v17 = &block_descriptor_73;
      char v10 = _Block_copy(&v14);
      id v11 = v9;
      swift_retain();
      swift_release();
      objc_msgSend(v11, sel_setInterruptionHandler_, v10);
      _Block_release(v10);

      objc_msgSend(v11, sel_resume);
    }
  }
  id v12 = v1;
  return v2;
}

uint64_t sub_1C9DDC968(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_1C9DDC9AC()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v4 = v3;
  uint64_t v19 = v5;
  uint64_t v20 = v6;
  uint64_t v8 = v7;
  sub_1C9E0D040();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_13();
  uint64_t v9 = sub_1C9E0D010();
  OUTLINED_FUNCTION_0_1();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_4_0();
  if (qword_1EA5C6A78 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v9, (uint64_t)qword_1EA5C98B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v0, v12, v9);
  uint64_t v13 = sub_1C9E0D000();
  os_log_type_t v14 = sub_1C9E0D320();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_1C9DD3000, v13, v14, v19, v15, 2u);
    OUTLINED_FUNCTION_15();
  }

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v0, v9);
  v21[4] = v20;
  v21[5] = v8;
  v21[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_20(COERCE_DOUBLE(1107296256));
  v21[2] = sub_1C9DDC968;
  v21[3] = v4;
  uint64_t v16 = _Block_copy(v21);
  swift_retain();
  sub_1C9E0D050();
  sub_1C9DE35D8(&qword_1EA5C6CF8, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D00);
  sub_1C9DE3620(&qword_1EA5C6D08, &qword_1EA5C6D00);
  sub_1C9E0D490();
  MEMORY[0x1CB78F460](0, v2, v1, v16);
  _Block_release(v16);
  OUTLINED_FUNCTION_8_0();
  v17();
  OUTLINED_FUNCTION_8_0();
  v18();
  swift_release();
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_1C9DDCCD8(uint64_t a1)
{
  return sub_1C9DDC6EC(0);
}

void sub_1C9DDCD10()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v4 = sub_1C9E0D040();
  OUTLINED_FUNCTION_0_1();
  uint64_t v48 = v5;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_23();
  uint64_t v46 = v7;
  uint64_t v47 = sub_1C9E0D060();
  OUTLINED_FUNCTION_0_1();
  uint64_t v45 = v8;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_23();
  uint64_t v44 = v10;
  type metadata accessor for CrossDeviceCommandExecution(0);
  OUTLINED_FUNCTION_0_1();
  uint64_t v41 = v11;
  uint64_t v42 = v12;
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  uint64_t v15 = (char *)v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = v14;
  MEMORY[0x1F4188790](v13);
  BOOL v17 = (char *)v37 - v16;
  uint64_t v18 = sub_1C9E0D010();
  OUTLINED_FUNCTION_0_1();
  uint64_t v20 = v19;
  MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_4_0();
  if (qword_1EA5C6A78 != -1) {
    swift_once();
  }
  uint64_t v22 = __swift_project_value_buffer(v18, (uint64_t)qword_1EA5C98B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v0, v22, v18);
  sub_1C9DE2A38(v3, (uint64_t)v17, (void (*)(void))type metadata accessor for CrossDeviceCommandExecution);
  char v23 = sub_1C9E0D000();
  os_log_type_t v24 = sub_1C9E0D310();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = swift_slowAlloc();
    uint64_t v40 = v4;
    uint64_t v26 = (uint8_t *)v25;
    uint64_t v27 = swift_slowAlloc();
    uint64_t v39 = v0;
    v37[2] = v27;
    v50[0] = v27;
    uint64_t v38 = v3;
    *(_DWORD *)uint64_t v26 = 136315138;
    v37[1] = v26 + 4;
    sub_1C9DE2A38((uint64_t)v17, (uint64_t)v15, (void (*)(void))type metadata accessor for CrossDeviceCommandExecution);
    uint64_t v28 = sub_1C9E0D130();
    uint64_t v49 = sub_1C9DE032C(v28, v29, v50);
    uint64_t v3 = v38;
    sub_1C9E0D430();
    swift_bridgeObjectRelease();
    sub_1C9DE2A98((uint64_t)v17, (void (*)(void))type metadata accessor for CrossDeviceCommandExecution);
    _os_log_impl(&dword_1C9DD3000, v23, v24, "#hal logCommandExecution with execution: %s", v26, 0xCu);
    swift_arrayDestroy();
    uint64_t v1 = v39;
    OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_15();
  }
  else
  {
    sub_1C9DE2A98((uint64_t)v17, (void (*)(void))type metadata accessor for CrossDeviceCommandExecution);
  }

  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v0, v18);
  sub_1C9DE2A38(v3, (uint64_t)v15, (void (*)(void))type metadata accessor for CrossDeviceCommandExecution);
  unint64_t v30 = (*(unsigned __int8 *)(v42 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80);
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = v1;
  sub_1C9DE2AEC((uint64_t)v15, v31 + v30, (void (*)(void))type metadata accessor for CrossDeviceCommandExecution);
  v50[4] = (uint64_t)sub_1C9DE0268;
  v50[5] = v31;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 1107296256;
  v50[2] = (uint64_t)sub_1C9DDC968;
  v50[3] = (uint64_t)&block_descriptor;
  uint64_t v32 = _Block_copy(v50);
  swift_retain();
  uint64_t v33 = v44;
  sub_1C9E0D050();
  uint64_t v49 = MEMORY[0x1E4FBC860];
  sub_1C9DE35D8(&qword_1EA5C6CF8, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D00);
  sub_1C9DE3620(&qword_1EA5C6D08, &qword_1EA5C6D00);
  uint64_t v34 = v46;
  sub_1C9E0D490();
  MEMORY[0x1CB78F460](0, v33, v34, v32);
  _Block_release(v32);
  OUTLINED_FUNCTION_8_0();
  v35();
  OUTLINED_FUNCTION_8_0();
  v36();
  swift_release();
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_1C9DDD25C(uint64_t a1, void *a2)
{
  id v113 = a2;
  uint64_t v3 = sub_1C9E0CFF0();
  uint64_t v107 = *(void *)(v3 - 8);
  uint64_t v108 = v3;
  MEMORY[0x1F4188790](v3);
  v106 = (char *)&v101 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D80);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v101 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v104 = (void *)type metadata accessor for RequestAnalyticsContext(0);
  MEMORY[0x1F4188790](v104);
  uint64_t v105 = (uint64_t)&v101 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v112 = type metadata accessor for ExecutionInfo(0);
  uint64_t v9 = MEMORY[0x1F4188790](v112);
  uint64_t v111 = (uint64_t)&v101 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  uint64_t v110 = (uint64_t)&v101 - v12;
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v101 - v13;
  uint64_t v15 = type metadata accessor for CrossDeviceCommandExecution(0);
  MEMORY[0x1F4188790](v15);
  BOOL v17 = (uint64_t *)((char *)&v101 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v18 = sub_1C9E0D010();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = MEMORY[0x1F4188790](v18);
  v109 = ((char *)&v101 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v22 = MEMORY[0x1F4188790](v20);
  v103 = (char *)&v101 - v23;
  uint64_t v24 = MEMORY[0x1F4188790](v22);
  v102 = (uint64_t *)((char *)&v101 - v25);
  MEMORY[0x1F4188790](v24);
  uint64_t v27 = (char *)&v101 - v26;
  uint64_t v114 = a1;
  id v28 = sub_1C9DDC6F8();
  if (v28)
  {
    unint64_t v29 = v28;
    v117 = sub_1C9DDE334;
    uint64_t v118 = 0;
    *(void *)&long long aBlock = MEMORY[0x1E4F143A8];
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v116 = sub_1C9DEE998;
    *((void *)&v116 + 1) = &block_descriptor_85;
    uint64_t v30 = v19;
    uint64_t v31 = _Block_copy(&aBlock);
    id v32 = objc_msgSend(v29, sel_remoteObjectProxyWithErrorHandler_, v31);
    uint64_t v33 = v31;
    uint64_t v19 = v30;
    _Block_release(v33);

    sub_1C9E0D470();
    swift_unknownObjectRelease();
  }
  else
  {
    long long aBlock = 0u;
    long long v116 = 0u;
  }
  sub_1C9DE371C((uint64_t)&aBlock, (uint64_t)v121);
  if (v121[3])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6DE0);
    if (swift_dynamicCast())
    {
      uint64_t v34 = v120;
      sub_1C9DE2A38((uint64_t)v113, (uint64_t)v17, (void (*)(void))type metadata accessor for CrossDeviceCommandExecution);
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload)
      {
        if (EnumCaseMultiPayload != 1)
        {
          uint64_t v63 = v19;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D58);
          sub_1C9DE2AEC((uint64_t)v17, v111, (void (*)(void))type metadata accessor for ExecutionInfo);
          v64 = (void *)sub_1C9E0CFC0();
          unint64_t v66 = v65;
          v67 = (void *)sub_1C9E0D300();
          v68 = (void *)sub_1C9E0D110();
          v69 = (void *)sub_1C9E0D300();
          objc_msgSend(v34, sel_logCrossDeviceCommandFailed_action_reason_, v68, v67, v69);

          if (qword_1EA5C6A78 != -1) {
            swift_once();
          }
          uint64_t v70 = __swift_project_value_buffer(v18, (uint64_t)qword_1EA5C98B8);
          uint64_t v71 = v63;
          uint64_t v72 = v18;
          v73 = v109;
          (*(void (**)(NSObject *, uint64_t, uint64_t))(v71 + 16))(v109, v70, v18);
          swift_bridgeObjectRetain_n();
          id v74 = v67;
          v75 = sub_1C9E0D000();
          os_log_type_t v76 = sub_1C9E0D310();
          if (os_log_type_enabled(v75, v76))
          {
            uint64_t v77 = swift_slowAlloc();
            uint64_t v107 = swift_slowAlloc();
            uint64_t v108 = swift_slowAlloc();
            v121[0] = v108;
            *(_DWORD *)uint64_t v77 = 136315394;
            uint64_t v110 = v71;
            swift_bridgeObjectRetain();
            id v120 = (id)sub_1C9DE032C((uint64_t)v64, v66, v121);
            id v113 = v64;
            sub_1C9E0D430();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v77 + 12) = 2112;
            uint64_t v112 = v72;
            id v120 = v74;
            id v78 = v74;
            sub_1C9E0D430();
            uint64_t v79 = v107;
            *(void *)uint64_t v107 = v74;

            _os_log_impl(&dword_1C9DD3000, v75, v76, "#hal logCrossDeviceCommandFailed for request: %s action:%@", (uint8_t *)v77, 0x16u);
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6DE8);
            swift_arrayDestroy();
            MEMORY[0x1CB7900C0](v79, -1, -1);
            uint64_t v80 = v108;
            swift_arrayDestroy();
            MEMORY[0x1CB7900C0](v80, -1, -1);
            MEMORY[0x1CB7900C0](v77, -1, -1);

            (*(void (**)(NSObject *, uint64_t))(v110 + 8))(v109, v112);
          }
          else
          {

            swift_bridgeObjectRelease_n();
            (*(void (**)(NSObject *, uint64_t))(v71 + 8))(v73, v18);
          }
          sub_1C9DDF654();
          swift_bridgeObjectRelease();

          swift_unknownObjectRelease();
          uint64_t v49 = v111;
          goto LABEL_34;
        }
        id v113 = v34;
        uint64_t v36 = v110;
        sub_1C9DE2AEC((uint64_t)v17, v110, (void (*)(void))type metadata accessor for ExecutionInfo);
        uint64_t v37 = sub_1C9E0CFC0();
        unint64_t v39 = v38;
        uint64_t v40 = v114;
        swift_beginAccess();
        uint64_t v41 = *(void *)(v40 + 24);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_1C9DD6BB8(v37, v39, v41, (uint64_t)v7);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, (uint64_t)v104) == 1)
        {
          sub_1C9DE3784((uint64_t)v7, &qword_1EA5C6D80);
          if (qword_1EA5C6A78 != -1) {
            swift_once();
          }
          uint64_t v42 = __swift_project_value_buffer(v18, (uint64_t)qword_1EA5C98B8);
          uint64_t v43 = v102;
          (*(void (**)(void *, uint64_t, uint64_t))(v19 + 16))(v102, v42, v18);
          swift_bridgeObjectRetain();
          uint64_t v44 = sub_1C9E0D000();
          uint64_t v45 = v19;
          os_log_type_t v46 = sub_1C9E0D320();
          if (os_log_type_enabled(v44, v46))
          {
            uint64_t v112 = v18;
            uint64_t v47 = (uint8_t *)swift_slowAlloc();
            uint64_t v48 = swift_slowAlloc();
            id v120 = (id)v48;
            *(_DWORD *)uint64_t v47 = 136315138;
            swift_bridgeObjectRetain();
            uint64_t v119 = sub_1C9DE032C(v37, v39, (uint64_t *)&v120);
            sub_1C9E0D430();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_1C9DD3000, v44, v46, "#hal logCrossDeviceCommandEnded Failed to find analytics context in cache - logCrossDeviceCommandStarted was not called for requestId: %s. Returning.", v47, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x1CB7900C0](v48, -1, -1);
            MEMORY[0x1CB7900C0](v47, -1, -1);
            swift_unknownObjectRelease();

            (*(void (**)(void *, uint64_t))(v45 + 8))(v43, v112);
            uint64_t v49 = v110;
LABEL_34:
            sub_1C9DE2A98(v49, (void (*)(void))type metadata accessor for ExecutionInfo);
            return sub_1C9DE3784((uint64_t)&aBlock, &qword_1EA5C6B20);
          }
          swift_bridgeObjectRelease_n();
          swift_unknownObjectRelease();

          (*(void (**)(void *, uint64_t))(v45 + 8))(v43, v18);
        }
        else
        {
          uint64_t v111 = v37;
          uint64_t v81 = v18;
          uint64_t v82 = v19;
          uint64_t v83 = v105;
          sub_1C9DE2AEC((uint64_t)v7, v105, (void (*)(void))type metadata accessor for RequestAnalyticsContext);
          v84 = (void *)sub_1C9E0D300();
          (*(void (**)(char *, uint64_t, uint64_t))(v107 + 16))(v106, v83, v108);
          sub_1C9DDC4FC();
          sub_1C9E0CFC0();
          v85 = (void *)sub_1C9E0D110();
          swift_bridgeObjectRelease();
          v86 = (void *)sub_1C9E0D300();
          v87 = (void *)sub_1C9E0D300();
          sub_1C9DD7D6C(0, (unint64_t *)&qword_1EA5C6CC0);
          sub_1C9DD7D6C(0, &qword_1EA5C70A0);
          sub_1C9DE3020();
          v88 = (void *)sub_1C9E0D0A0();
          swift_bridgeObjectRelease();
          objc_msgSend(v113, sel_logCrossDeviceCommandEnded_action_actionResult_homeKitTarget_contextProximityPairs_, v85, v84, v86, v87, v88);

          if (qword_1EA5C6A78 != -1) {
            swift_once();
          }
          uint64_t v89 = __swift_project_value_buffer(v81, (uint64_t)qword_1EA5C98B8);
          v90 = v103;
          (*(void (**)(char *, uint64_t, uint64_t))(v82 + 16))(v103, v89, v81);
          swift_bridgeObjectRetain_n();
          id v91 = v84;
          v92 = sub_1C9E0D000();
          os_log_type_t v93 = sub_1C9E0D310();
          v109 = v92;
          if (os_log_type_enabled(v92, v93))
          {
            uint64_t v94 = swift_slowAlloc();
            v102 = (void *)swift_slowAlloc();
            v104 = (void *)swift_slowAlloc();
            id v120 = v104;
            *(_DWORD *)uint64_t v94 = 136315394;
            swift_bridgeObjectRetain();
            uint64_t v119 = sub_1C9DE032C(v111, v39, (uint64_t *)&v120);
            sub_1C9E0D430();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v94 + 12) = 2112;
            uint64_t v119 = (uint64_t)v91;
            id v95 = v91;
            uint64_t v112 = v81;
            id v96 = v95;
            sub_1C9E0D430();
            v97 = v102;
            void *v102 = v91;

            v98 = v109;
            _os_log_impl(&dword_1C9DD3000, v109, v93, "#hal logCrossDeviceCommandEnded for request: %s action:%@", (uint8_t *)v94, 0x16u);
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6DE8);
            swift_arrayDestroy();
            MEMORY[0x1CB7900C0](v97, -1, -1);
            uint64_t v99 = (uint64_t)v104;
            swift_arrayDestroy();
            MEMORY[0x1CB7900C0](v99, -1, -1);
            MEMORY[0x1CB7900C0](v94, -1, -1);

            (*(void (**)(char *, uint64_t))(v82 + 8))(v103, v112);
          }
          else
          {

            swift_bridgeObjectRelease_n();
            (*(void (**)(char *, uint64_t))(v82 + 8))(v90, v81);
          }
          uint64_t v36 = v110;
          sub_1C9DDF654();
          swift_bridgeObjectRelease();

          swift_unknownObjectRelease();
          (*(void (**)(char *, uint64_t))(v107 + 8))(v106, v108);
          sub_1C9DE2A98(v105, (void (*)(void))type metadata accessor for RequestAnalyticsContext);
        }
        uint64_t v49 = v36;
        goto LABEL_34;
      }
      uint64_t v54 = *v17;
      uint64_t v55 = v17[1];
      uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6CF0);
      sub_1C9DE2AEC((uint64_t)v17 + *(int *)(v56 + 64), (uint64_t)v14, (void (*)(void))type metadata accessor for ExecutionInfo);
      uint64_t v57 = sub_1C9E0CFC0();
      uint64_t v59 = v58;
      v60 = (void *)sub_1C9E0D300();
      LOBYTE(v121[0]) = 8;
      v61 = (void *)swift_allocObject();
      v61[2] = v114;
      v61[3] = v57;
      v61[4] = v59;
      v61[5] = v34;
      v61[6] = v60;
      v61[7] = v54;
      v61[8] = v55;
      swift_retain();
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      id v62 = v60;
      sub_1C9DDF928();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();

      swift_release();
      uint64_t v49 = (uint64_t)v14;
      goto LABEL_34;
    }
  }
  else
  {
    sub_1C9DE3784((uint64_t)v121, &qword_1EA5C6B20);
  }
  if (qword_1EA5C6A78 != -1) {
    swift_once();
  }
  uint64_t v50 = __swift_project_value_buffer(v18, (uint64_t)qword_1EA5C98B8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v27, v50, v18);
  v51 = sub_1C9E0D000();
  os_log_type_t v52 = sub_1C9E0D320();
  if (os_log_type_enabled(v51, v52))
  {
    v53 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v53 = 0;
    _os_log_impl(&dword_1C9DD3000, v51, v52, "#hal logCommandExecution Failed to get remote object", v53, 2u);
    MEMORY[0x1CB7900C0](v53, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v19 + 8))(v27, v18);
  return sub_1C9DE3784((uint64_t)&aBlock, &qword_1EA5C6B20);
}

uint64_t sub_1C9DDE334(void *a1)
{
  uint64_t v2 = sub_1C9E0D010();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EA5C6A78 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_project_value_buffer(v2, (uint64_t)qword_1EA5C98B8);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  id v7 = a1;
  id v8 = a1;
  uint64_t v9 = sub_1C9E0D000();
  os_log_type_t v10 = sub_1C9E0D320();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v17 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    v16[1] = v11 + 4;
    swift_getErrorValue();
    uint64_t v13 = sub_1C9E0D840();
    v16[2] = sub_1C9DE032C(v13, v14, &v17);
    sub_1C9E0D430();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1C9DD3000, v9, v10, "#hal logCommandExecution Error reaching remote: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1CB7900C0](v12, -1, -1);
    MEMORY[0x1CB7900C0](v11, -1, -1);
  }
  else
  {
  }
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_1C9DDE5B0(uint64_t a1, uint64_t a2, unint64_t a3, void *a4, void *a5, unint64_t a6, uint64_t a7)
{
  v51 = a5;
  uint64_t v52 = a7;
  uint64_t v12 = sub_1C9E0D010();
  uint64_t v55 = *(void *)(v12 - 8);
  uint64_t v13 = MEMORY[0x1F4188790](v12);
  uint64_t v54 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v16 = (char *)&v45 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D80);
  MEMORY[0x1F4188790](v17 - 8);
  uint64_t v19 = (char *)&v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for RequestAnalyticsContext(0);
  MEMORY[0x1F4188790](v20);
  uint64_t v22 = (char *)&v45 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v53 = a1;
  uint64_t v23 = *(void *)(a1 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C9DD6BB8(a2, a3, v23, (uint64_t)v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v20) == 1)
  {
    sub_1C9DE3784((uint64_t)v19, &qword_1EA5C6D80);
    if (qword_1EA5C6A78 != -1) {
      swift_once();
    }
    uint64_t v24 = __swift_project_value_buffer(v12, (uint64_t)qword_1EA5C98B8);
    (*(void (**)(char *, uint64_t, uint64_t))(v55 + 16))(v16, v24, v12);
    uint64_t v25 = sub_1C9E0D000();
    os_log_type_t v26 = sub_1C9E0D320();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_1C9DD3000, v25, v26, "#hal logCommandExecution Failed to create analyticsContext for request.", v27, 2u);
      MEMORY[0x1CB7900C0](v27, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v55 + 8))(v16, v12);
  }
  else
  {
    unint64_t v49 = a6;
    sub_1C9DE2AEC((uint64_t)v19, (uint64_t)v22, (void (*)(void))type metadata accessor for RequestAnalyticsContext);
    uint64_t v29 = a2;
    uint64_t v30 = (void *)sub_1C9E0D110();
    sub_1C9E0CFC0();
    uint64_t v31 = (void *)sub_1C9E0D110();
    swift_bridgeObjectRelease();
    objc_msgSend(a4, sel_logCrossDeviceRequestLink_halRequestId_, v30, v31);

    sub_1C9E0CFC0();
    id v32 = (void *)sub_1C9E0D110();
    swift_bridgeObjectRelease();
    uint64_t v33 = v51;
    objc_msgSend(a4, sel_logCrossDeviceCommandStarted_action_, v32, v51);

    if (qword_1EA5C6A78 != -1) {
      swift_once();
    }
    uint64_t v48 = v22;
    uint64_t v50 = a4;
    uint64_t v34 = __swift_project_value_buffer(v12, (uint64_t)qword_1EA5C98B8);
    v35 = v54;
    (*(void (**)(char *, uint64_t, uint64_t))(v55 + 16))(v54, v34, v12);
    swift_bridgeObjectRetain_n();
    id v36 = v33;
    uint64_t v37 = sub_1C9E0D000();
    os_log_type_t v38 = sub_1C9E0D310();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = swift_slowAlloc();
      os_log_type_t v46 = (void *)swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      uint64_t v57 = v47;
      *(_DWORD *)uint64_t v39 = 136315394;
      v51 = (void *)v12;
      swift_bridgeObjectRetain();
      uint64_t v56 = sub_1C9DE032C(v29, a3, &v57);
      sub_1C9E0D430();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v39 + 12) = 2112;
      uint64_t v56 = (uint64_t)v36;
      id v40 = v36;
      sub_1C9E0D430();
      uint64_t v41 = v46;
      *os_log_type_t v46 = v36;

      _os_log_impl(&dword_1C9DD3000, v37, v38, "#hal logCrossDeviceCommandStarted for request: %s action:%@", (uint8_t *)v39, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6DE8);
      swift_arrayDestroy();
      MEMORY[0x1CB7900C0](v41, -1, -1);
      uint64_t v42 = v47;
      swift_arrayDestroy();
      MEMORY[0x1CB7900C0](v42, -1, -1);
      MEMORY[0x1CB7900C0](v39, -1, -1);

      (*(void (**)(char *, void *))(v55 + 8))(v54, v51);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v55 + 8))(v35, v12);
    }
    if (v49) {
      unint64_t v43 = v49;
    }
    else {
      unint64_t v43 = MEMORY[0x1E4FBC860];
    }
    if (v52) {
      uint64_t v44 = v52;
    }
    else {
      uint64_t v44 = MEMORY[0x1E4FBC860];
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1C9DDEE58(v29, a3, v43, v44, v50);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return sub_1C9DE2A98((uint64_t)v48, (void (*)(void))type metadata accessor for RequestAnalyticsContext);
  }
}

void sub_1C9DDEC0C()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v2 = v0;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  id v8 = v7;
  sub_1C9E0D040();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v9);
  uint64_t v19 = OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_1();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_6_0();
  char v13 = *v8;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v2;
  *(void *)(v14 + 24) = v6;
  *(void *)(v14 + 32) = v4;
  *(unsigned char *)(v14 + 40) = v13;
  v20[4] = sub_1C9DE0AEC;
  v20[5] = v14;
  v20[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_20(COERCE_DOUBLE(1107296256));
  v20[2] = sub_1C9DDC968;
  v20[3] = &block_descriptor_6;
  uint64_t v15 = _Block_copy(v20);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1C9E0D050();
  sub_1C9DE35D8(&qword_1EA5C6CF8, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D00);
  sub_1C9DE3620(&qword_1EA5C6D08, &qword_1EA5C6D00);
  OUTLINED_FUNCTION_9();
  uint64_t v16 = OUTLINED_FUNCTION_19();
  MEMORY[0x1CB78F460](v16);
  _Block_release(v15);
  uint64_t v17 = OUTLINED_FUNCTION_17();
  v18(v17);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v1, v19);
  swift_release();
  OUTLINED_FUNCTION_7_0();
}

void sub_1C9DDEE10()
{
}

void sub_1C9DDEE58(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = v5;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1C9E0D700();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v10)
  {
    aBlock[0] = MEMORY[0x1E4FBC860];
    sub_1C9E0D5D0();
    if (v10 < 0)
    {
      __break(1u);
      return;
    }
    uint64_t v11 = 0;
    do
    {
      if ((a3 & 0xC000000000000001) != 0) {
        id v12 = (id)MEMORY[0x1CB78F680](v11, a3);
      }
      else {
        id v12 = *(id *)(a3 + 8 * v11 + 32);
      }
      char v13 = v12;
      ++v11;
      objc_msgSend(objc_allocWithZone((Class)SVDDeviceUnit), sel_initWithDeviceUnit_, v12);

      sub_1C9E0D5B0();
      sub_1C9E0D5E0();
      sub_1C9E0D5F0();
      sub_1C9E0D5C0();
    }
    while (v10 != v11);
  }
  if (a5)
  {
    sub_1C9DD7D6C(0, &qword_1EA5C6D90);
    uint64_t v14 = (void *)sub_1C9E0D200();
    swift_bridgeObjectRelease();
    sub_1C9DD7D6C(0, &qword_1EA5C6D98);
    uint64_t v15 = (void *)sub_1C9E0D200();
    uint64_t v16 = (void *)swift_allocObject();
    v16[2] = v6;
    void v16[3] = a1;
    v16[4] = a2;
    aBlock[4] = sub_1C9DE3014;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1C9DDF59C;
    aBlock[3] = &block_descriptor_67;
    uint64_t v17 = _Block_copy(aBlock);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_release();
    objc_msgSend(a5, sel_getContextAndProximitySnapshotForCurrentRequestForDeviceUnits_serviceContexts_completion_, v14, v15, v17);
    _Block_release(v17);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1C9DDF11C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v41 = a2;
  unint64_t v42 = a4;
  uint64_t v46 = a3;
  uint64_t v5 = sub_1C9E0D010();
  uint64_t v44 = *(void *)(v5 - 8);
  uint64_t v45 = v5;
  MEMORY[0x1F4188790](v5);
  unint64_t v43 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1C9DE32DC(a1);
  if (!v7)
  {
LABEL_18:
    LOBYTE(v49[0]) = 8;
    unint64_t v31 = v42;
    sub_1C9DDF928();
    swift_bridgeObjectRelease();
    uint64_t v33 = v44;
    uint64_t v32 = v45;
    if (qword_1EA5C6A78 != -1) {
      swift_once();
    }
    uint64_t v34 = __swift_project_value_buffer(v32, (uint64_t)qword_1EA5C98B8);
    v35 = v43;
    (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v43, v34, v32);
    swift_bridgeObjectRetain_n();
    id v36 = sub_1C9E0D000();
    os_log_type_t v37 = sub_1C9E0D310();
    if (os_log_type_enabled(v36, v37))
    {
      unint64_t v38 = v31;
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      id v40 = (void *)swift_slowAlloc();
      v49[0] = v40;
      *(_DWORD *)uint64_t v39 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v50 = sub_1C9DE032C(v46, v38, (uint64_t *)v49);
      sub_1C9E0D430();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C9DD3000, v36, v37, "#hal fetched and cached context snapshot and proximity for request: %s", v39, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1CB7900C0](v40, -1, -1);
      MEMORY[0x1CB7900C0](v39, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v35, v32);
  }
  uint64_t v8 = v7;
  uint64_t v53 = MEMORY[0x1E4FBC860];
  sub_1C9E009F0(0, v7 & ~(v7 >> 63), 0);
  uint64_t result = sub_1C9DE3220(a1);
  uint64_t v50 = result;
  uint64_t v51 = v10;
  char v52 = v11 & 1;
  if ((v8 & 0x8000000000000000) == 0)
  {
    uint64_t v12 = a1 & 0xFFFFFFFFFFFFFF8;
    if (a1 < 0) {
      uint64_t v12 = a1;
    }
    uint64_t v47 = v12;
    unint64_t v48 = a1 & 0xC000000000000001;
    do
    {
      uint64_t v14 = v50;
      uint64_t v13 = v51;
      char v15 = v52;
      sub_1C9DE32FC(v49, v50, v51, v52, a1);
      uint64_t v17 = v16;
      id v18 = v49[0];
      id v19 = objc_msgSend(v49[0], sel_integerValue, v41);

      uint64_t v20 = v53;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_1C9E009F0(0, *(void *)(v20 + 16) + 1, 1);
        uint64_t v20 = v53;
      }
      unint64_t v22 = *(void *)(v20 + 16);
      unint64_t v21 = *(void *)(v20 + 24);
      if (v22 >= v21 >> 1)
      {
        uint64_t result = (uint64_t)sub_1C9E009F0((char *)(v21 > 1), v22 + 1, 1);
        uint64_t v20 = v53;
      }
      *(void *)(v20 + 16) = v22 + 1;
      uint64_t v23 = v20 + 16 * v22;
      *(void *)(v23 + 32) = v17;
      *(void *)(v23 + 40) = v19;
      if (v48)
      {
        if ((v15 & 1) == 0) {
          goto LABEL_25;
        }
        if (sub_1C9E0D660()) {
          swift_isUniquelyReferenced_nonNull_native();
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6DA8);
        uint64_t v30 = (void (*)(id *, void))sub_1C9E0D0E0();
        sub_1C9E0D6D0();
        v30(v49, 0);
      }
      else
      {
        sub_1C9DE3080(v14, v13, v15, a1);
        uint64_t v25 = v24;
        uint64_t v27 = v26;
        char v29 = v28;
        sub_1C9DE3524(v14, v13, v15);
        uint64_t v50 = v25;
        uint64_t v51 = v27;
        char v52 = v29 & 1;
      }
      --v8;
    }
    while (v8);
    sub_1C9DE3524(v50, v51, v52);
    goto LABEL_18;
  }
  __break(1u);
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1C9DDF59C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  sub_1C9DD7D6C(0, (unint64_t *)&qword_1EA5C6CC0);
  sub_1C9DD7D6C(0, &qword_1EA5C70A0);
  sub_1C9DE3020();
  uint64_t v2 = sub_1C9E0D0B0();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_1C9DDF654()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v2 = v0;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  sub_1C9E0D040();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790]();
  uint64_t v7 = OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_1();
  uint64_t v9 = v8;
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_6_0();
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = v2;
  v10[3] = v6;
  v10[4] = v4;
  v15[4] = sub_1C9DE2FB8;
  v15[5] = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_20(COERCE_DOUBLE(1107296256));
  v15[2] = sub_1C9DDC968;
  v15[3] = &block_descriptor_61;
  char v11 = _Block_copy(v15);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1C9E0D050();
  sub_1C9DE35D8(&qword_1EA5C6CF8, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D00);
  sub_1C9DE3620(&qword_1EA5C6D08, &qword_1EA5C6D00);
  OUTLINED_FUNCTION_9();
  uint64_t v12 = OUTLINED_FUNCTION_19();
  MEMORY[0x1CB78F460](v12);
  _Block_release(v11);
  uint64_t v13 = OUTLINED_FUNCTION_17();
  v14(v13);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v1, v7);
  swift_release();
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_1C9DDF850(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D80);
  MEMORY[0x1F4188790]();
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for RequestAnalyticsContext(0);
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v7);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1C9DDBBC4((uint64_t)v6, a2, a3);
  return swift_endAccess();
}

void sub_1C9DDF928()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v3 = v0;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  sub_1C9E0D040();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_6_0();
  LOBYTE(v9) = *v9;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v3;
  *(void *)(v18 + 24) = v15;
  *(void *)(v18 + 32) = v13;
  *(void *)(v18 + 40) = v11;
  *(unsigned char *)(v18 + 48) = (_BYTE)v9;
  *(void *)(v18 + 56) = v7;
  *(void *)(v18 + 64) = v5;
  v22[4] = sub_1C9DE2A14;
  v22[5] = v18;
  v22[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_20(COERCE_DOUBLE(1107296256));
  v22[2] = sub_1C9DDC968;
  v22[3] = &block_descriptor_55;
  id v19 = _Block_copy(v22);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1C9DE2A28(v7);
  sub_1C9E0D050();
  sub_1C9DE35D8(&qword_1EA5C6CF8, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D00);
  sub_1C9DE3620(&qword_1EA5C6D08, &qword_1EA5C6D00);
  sub_1C9E0D490();
  MEMORY[0x1CB78F460](0, v2, v1, v19);
  _Block_release(v19);
  OUTLINED_FUNCTION_8_0();
  v20();
  OUTLINED_FUNCTION_8_0();
  v21();
  swift_release();
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_1C9DDFB84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, void (*a6)(uint64_t), uint64_t a7)
{
  uint64_t v25 = a7;
  uint64_t v26 = a6;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D80);
  uint64_t v13 = MEMORY[0x1F4188790](v12 - 8);
  uint64_t v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char *)&v25 - v16;
  uint64_t v18 = (int *)type metadata accessor for RequestAnalyticsContext(0);
  MEMORY[0x1F4188790](v18);
  uint64_t v20 = (char *)&v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v21 = *(void *)(a1 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C9DD6BB8(a2, a3, v21, (uint64_t)v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, (uint64_t)v18) != 1)
  {
    sub_1C9DE2AEC((uint64_t)v17, (uint64_t)v20, (void (*)(void))type metadata accessor for RequestAnalyticsContext);
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  sub_1C9E0CFE0();
  *(void *)&v20[v18[5]] = 0;
  v20[v18[6]] = 8;
  v20[v18[7]] = 22;
  sub_1C9DE3784((uint64_t)v17, &qword_1EA5C6D80);
  if (a4)
  {
LABEL_5:
    uint64_t v22 = v18[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)&v20[v22] = a4;
  }
LABEL_6:
  if (a5 != 8) {
    v20[v18[6]] = a5;
  }
  sub_1C9DE2A38((uint64_t)v20, (uint64_t)v15, (void (*)(void))type metadata accessor for RequestAnalyticsContext);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, (uint64_t)v18);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1C9DDBBC4((uint64_t)v15, a2, a3);
  uint64_t v23 = swift_endAccess();
  if (v26) {
    v26(v23);
  }
  return sub_1C9DE2A98((uint64_t)v20, (void (*)(void))type metadata accessor for RequestAnalyticsContext);
}

id *DeviceResolutionAnalyticsImpl.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t DeviceResolutionAnalyticsImpl.__deallocating_deinit()
{
  DeviceResolutionAnalyticsImpl.deinit();
  return MEMORY[0x1F4186488](v0, 48, 7);
}

void sub_1C9DDFE98()
{
  OUTLINED_FUNCTION_5_0();
  v9[0] = sub_1C9E0D350();
  OUTLINED_FUNCTION_0_1();
  uint64_t v2 = v1;
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C9E0D340();
  OUTLINED_FUNCTION_2_1();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_13();
  uint64_t v7 = sub_1C9E0D060();
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v8 = MEMORY[0x1E4FBC868];
  v0[2] = 0;
  v0[3] = v8;
  sub_1C9DD7D6C(0, (unint64_t *)&unk_1EA5C6DB0);
  sub_1C9E0D050();
  v9[1] = MEMORY[0x1E4FBC860];
  sub_1C9DE35D8((unint64_t *)&unk_1EA5C7370, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA5C6DC0);
  sub_1C9DE3620((unint64_t *)&unk_1EA5C7380, (uint64_t *)&unk_1EA5C6DC0);
  sub_1C9E0D490();
  (*(void (**)(char *, void, void))(v2 + 104))(v5, *MEMORY[0x1E4FBCC58], v9[0]);
  v0[4] = sub_1C9E0D370();
  v0[5] = 0;
  OUTLINED_FUNCTION_7_0();
}

void sub_1C9DE00A4()
{
}

void sub_1C9DE00C8()
{
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t type metadata accessor for CrossDeviceCommandExecution(uint64_t a1)
{
  return sub_1C9DE28E0(a1, (uint64_t *)&unk_1EA5C6D60);
}

uint64_t sub_1C9DE0144()
{
  uint64_t v1 = *(void *)(type metadata accessor for CrossDeviceCommandExecution(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_release();
  uint64_t v5 = v0 + v3;
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload != 2 && EnumCaseMultiPayload != 1)
  {
    if (EnumCaseMultiPayload) {
      goto LABEL_6;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v5 += *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6CF0) + 64);
  }
  sub_1C9E0CFF0();
  OUTLINED_FUNCTION_2_1();
  (*(void (**)(uint64_t))(v7 + 8))(v5);
LABEL_6:
  return MEMORY[0x1F4186498](v0, v3 + v4, v2 | 7);
}

uint64_t sub_1C9DE0268()
{
  uint64_t v1 = *(void *)(type metadata accessor for CrossDeviceCommandExecution(0) - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = (void *)(v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
  return sub_1C9DDD25C(v2, v3);
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

uint64_t sub_1C9DE032C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1C9DE0400(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1C9DE36C0((uint64_t)v12, *a3);
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
      sub_1C9DE36C0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1C9DE0400(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_1C9DE0558((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_1C9E0D440();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_1C9DE0630(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_1C9E0D5A0();
    if (!v8)
    {
      uint64_t result = sub_1C9E0D6E0();
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

void *sub_1C9DE0558(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1C9E0D740();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_1C9DE0630(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1C9DE06C8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_1C9DE08A4(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_1C9DE08A4((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1C9DE06C8(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_1C9E0D190();
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
  unint64_t v3 = sub_1C9DE083C(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_1C9E0D570();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_1C9E0D740();
  __break(1u);
LABEL_14:
  uint64_t result = sub_1C9E0D6E0();
  __break(1u);
  return result;
}

void *sub_1C9DE083C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA5C6DD0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_1C9DE08A4(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA5C6DD0);
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
    sub_1C9DE0A54(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C9DE097C(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_1C9DE097C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1C9E0D740();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_1C9DE0A54(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_1C9E0D740();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_1C9DE0AE4()
{
  return objectdestroy_2Tm(41);
}

void sub_1C9DE0AEC()
{
}

unint64_t sub_1C9DE0B00()
{
  unint64_t result = qword_1EA5C6D10;
  if (!qword_1EA5C6D10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C6D10);
  }
  return result;
}

unint64_t sub_1C9DE0B50()
{
  unint64_t result = qword_1EA5C6D18;
  if (!qword_1EA5C6D18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C6D18);
  }
  return result;
}

unint64_t sub_1C9DE0BA0()
{
  unint64_t result = qword_1EA5C6D20;
  if (!qword_1EA5C6D20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C6D20);
  }
  return result;
}

unint64_t sub_1C9DE0BF0()
{
  unint64_t result = qword_1EA5C6D28;
  if (!qword_1EA5C6D28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C6D28);
  }
  return result;
}

unint64_t sub_1C9DE0C40()
{
  unint64_t result = qword_1EA5C6D30;
  if (!qword_1EA5C6D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C6D30);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for ExecutionInfo(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (void *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1C9E0CFF0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 24);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
    *((unsigned char *)a1 + v8) = *((unsigned char *)a2 + v8);
  }
  return a1;
}

uint64_t destroy for ExecutionInfo(uint64_t a1)
{
  uint64_t v2 = sub_1C9E0CFF0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for ExecutionInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C9E0CFF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  return a1;
}

uint64_t assignWithCopy for ExecutionInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C9E0CFF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(unsigned char *)(a1 + *(int *)(a3 + 24)) = *(unsigned char *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t initializeWithTake for ExecutionInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C9E0CFF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for ExecutionInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C9E0CFF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for ExecutionInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C9DE0FEC);
}

uint64_t sub_1C9DE0FEC()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_1_3();
  if (*(_DWORD *)(v4 + 84) == v1)
  {
    return __swift_getEnumTagSinglePayload(v0, v1, v3);
  }
  else
  {
    if (*(unsigned __int8 *)(v0 + *(int *)(v2 + 24)) <= 4u) {
      int v6 = 4;
    }
    else {
      int v6 = *(unsigned __int8 *)(v0 + *(int *)(v2 + 24));
    }
    unsigned int v7 = v6 - 4;
    if (*(unsigned __int8 *)(v0 + *(int *)(v2 + 24)) >= 4u) {
      return v7;
    }
    else {
      return 0;
    }
  }
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for ExecutionInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C9DE10AC);
}

void sub_1C9DE10AC()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_1_3();
  if (*(_DWORD *)(v4 + 84) == v3)
  {
    uint64_t v5 = OUTLINED_FUNCTION_18();
    __swift_storeEnumTagSinglePayload(v5, v6, v7, v8);
  }
  else
  {
    *(unsigned char *)(v1 + *(int *)(v2 + 24)) = v0 + 4;
  }
}

uint64_t sub_1C9DE1114()
{
  uint64_t result = sub_1C9E0CFF0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ExecutionInfo.Action(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xEB)
  {
    if (a2 + 21 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 21) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 22;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x16;
  int v5 = v6 - 22;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for ExecutionInfo.Action(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 21 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 21) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEA)
  {
    unsigned int v6 = ((a2 - 235) >> 8) + 1;
    *uint64_t result = a2 + 21;
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
        JUMPOUT(0x1C9DE1308);
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
          *uint64_t result = a2 + 21;
        break;
    }
  }
  return result;
}

void type metadata accessor for ExecutionInfo.Action()
{
}

void type metadata accessor for ExecutionInfo.QuickStopActionResult()
{
}

void *initializeBufferWithCopyOfBuffer for CrossDeviceCommandExecution(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (void *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v11 = sub_1C9E0CFF0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
      uint64_t v12 = type metadata accessor for ExecutionInfo(0);
      *((unsigned char *)a1 + *(int *)(v12 + 20)) = *((unsigned char *)a2 + *(int *)(v12 + 20));
      *((unsigned char *)a1 + *(int *)(v12 + 24)) = *((unsigned char *)a2 + *(int *)(v12 + 24));
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D58);
      *((unsigned char *)a1 + *(int *)(v13 + 48)) = *((unsigned char *)a2 + *(int *)(v13 + 48));
    }
    else if (EnumCaseMultiPayload == 1)
    {
      uint64_t v7 = sub_1C9E0CFF0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      uint64_t v8 = type metadata accessor for ExecutionInfo(0);
      *((unsigned char *)a1 + *(int *)(v8 + 20)) = *((unsigned char *)a2 + *(int *)(v8 + 20));
      *((unsigned char *)a1 + *(int *)(v8 + 24)) = *((unsigned char *)a2 + *(int *)(v8 + 24));
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D50);
      *((unsigned char *)a1 + *(int *)(v9 + 48)) = *((unsigned char *)a2 + *(int *)(v9 + 48));
    }
    else
    {
      uint64_t v14 = a2[1];
      *a1 = *a2;
      a1[1] = v14;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v15 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6CF0) + 64);
      uint64_t v16 = (char *)a1 + v15;
      uint64_t v17 = (char *)a2 + v15;
      uint64_t v18 = sub_1C9E0CFF0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
      uint64_t v19 = type metadata accessor for ExecutionInfo(0);
      v16[*(int *)(v19 + 20)] = v17[*(int *)(v19 + 20)];
      v16[*(int *)(v19 + 24)] = v17[*(int *)(v19 + 24)];
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for CrossDeviceCommandExecution(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result != 2 && result != 1)
  {
    if (result) {
      return result;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    a1 += *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6CF0) + 64);
  }
  uint64_t v3 = sub_1C9E0CFF0();
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
  return v4(a1, v3);
}

void *initializeWithCopy for CrossDeviceCommandExecution(void *a1, void *a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v8 = sub_1C9E0CFF0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    uint64_t v9 = type metadata accessor for ExecutionInfo(0);
    *((unsigned char *)a1 + *(int *)(v9 + 20)) = *((unsigned char *)a2 + *(int *)(v9 + 20));
    *((unsigned char *)a1 + *(int *)(v9 + 24)) = *((unsigned char *)a2 + *(int *)(v9 + 24));
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D58);
    *((unsigned char *)a1 + *(int *)(v10 + 48)) = *((unsigned char *)a2 + *(int *)(v10 + 48));
  }
  else if (EnumCaseMultiPayload == 1)
  {
    uint64_t v5 = sub_1C9E0CFF0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
    uint64_t v6 = type metadata accessor for ExecutionInfo(0);
    *((unsigned char *)a1 + *(int *)(v6 + 20)) = *((unsigned char *)a2 + *(int *)(v6 + 20));
    *((unsigned char *)a1 + *(int *)(v6 + 24)) = *((unsigned char *)a2 + *(int *)(v6 + 24));
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D50);
    *((unsigned char *)a1 + *(int *)(v7 + 48)) = *((unsigned char *)a2 + *(int *)(v7 + 48));
  }
  else
  {
    uint64_t v11 = a2[1];
    *a1 = *a2;
    a1[1] = v11;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v12 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6CF0) + 64);
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = sub_1C9E0CFF0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    uint64_t v16 = type metadata accessor for ExecutionInfo(0);
    v13[*(int *)(v16 + 20)] = v14[*(int *)(v16 + 20)];
    v13[*(int *)(v16 + 24)] = v14[*(int *)(v16 + 24)];
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for CrossDeviceCommandExecution(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_1C9DE2A98((uint64_t)a1, (void (*)(void))type metadata accessor for CrossDeviceCommandExecution);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v8 = sub_1C9E0CFF0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      uint64_t v9 = type metadata accessor for ExecutionInfo(0);
      *((unsigned char *)a1 + *(int *)(v9 + 20)) = *((unsigned char *)a2 + *(int *)(v9 + 20));
      *((unsigned char *)a1 + *(int *)(v9 + 24)) = *((unsigned char *)a2 + *(int *)(v9 + 24));
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D58);
      *((unsigned char *)a1 + *(int *)(v10 + 48)) = *((unsigned char *)a2 + *(int *)(v10 + 48));
    }
    else if (EnumCaseMultiPayload == 1)
    {
      uint64_t v5 = sub_1C9E0CFF0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
      uint64_t v6 = type metadata accessor for ExecutionInfo(0);
      *((unsigned char *)a1 + *(int *)(v6 + 20)) = *((unsigned char *)a2 + *(int *)(v6 + 20));
      *((unsigned char *)a1 + *(int *)(v6 + 24)) = *((unsigned char *)a2 + *(int *)(v6 + 24));
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D50);
      *((unsigned char *)a1 + *(int *)(v7 + 48)) = *((unsigned char *)a2 + *(int *)(v7 + 48));
    }
    else
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v11 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6CF0) + 64);
      uint64_t v12 = (char *)a1 + v11;
      uint64_t v13 = (char *)a2 + v11;
      uint64_t v14 = sub_1C9E0CFF0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
      uint64_t v15 = type metadata accessor for ExecutionInfo(0);
      v12[*(int *)(v15 + 20)] = v13[*(int *)(v15 + 20)];
      v12[*(int *)(v15 + 24)] = v13[*(int *)(v15 + 24)];
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *initializeWithTake for CrossDeviceCommandExecution(_OWORD *a1, _OWORD *a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v8 = sub_1C9E0CFF0();
    (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    uint64_t v9 = type metadata accessor for ExecutionInfo(0);
    *((unsigned char *)a1 + *(int *)(v9 + 20)) = *((unsigned char *)a2 + *(int *)(v9 + 20));
    *((unsigned char *)a1 + *(int *)(v9 + 24)) = *((unsigned char *)a2 + *(int *)(v9 + 24));
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D58);
    *((unsigned char *)a1 + *(int *)(v10 + 48)) = *((unsigned char *)a2 + *(int *)(v10 + 48));
  }
  else if (EnumCaseMultiPayload == 1)
  {
    uint64_t v5 = sub_1C9E0CFF0();
    (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
    uint64_t v6 = type metadata accessor for ExecutionInfo(0);
    *((unsigned char *)a1 + *(int *)(v6 + 20)) = *((unsigned char *)a2 + *(int *)(v6 + 20));
    *((unsigned char *)a1 + *(int *)(v6 + 24)) = *((unsigned char *)a2 + *(int *)(v6 + 24));
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D50);
    *((unsigned char *)a1 + *(int *)(v7 + 48)) = *((unsigned char *)a2 + *(int *)(v7 + 48));
  }
  else
  {
    *a1 = *a2;
    uint64_t v11 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6CF0) + 64);
    uint64_t v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = sub_1C9E0CFF0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
    uint64_t v15 = type metadata accessor for ExecutionInfo(0);
    v12[*(int *)(v15 + 20)] = v13[*(int *)(v15 + 20)];
    v12[*(int *)(v15 + 24)] = v13[*(int *)(v15 + 24)];
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_OWORD *assignWithTake for CrossDeviceCommandExecution(_OWORD *a1, _OWORD *a2)
{
  if (a1 != a2)
  {
    sub_1C9DE2A98((uint64_t)a1, (void (*)(void))type metadata accessor for CrossDeviceCommandExecution);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v8 = sub_1C9E0CFF0();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
      uint64_t v9 = type metadata accessor for ExecutionInfo(0);
      *((unsigned char *)a1 + *(int *)(v9 + 20)) = *((unsigned char *)a2 + *(int *)(v9 + 20));
      *((unsigned char *)a1 + *(int *)(v9 + 24)) = *((unsigned char *)a2 + *(int *)(v9 + 24));
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D58);
      *((unsigned char *)a1 + *(int *)(v10 + 48)) = *((unsigned char *)a2 + *(int *)(v10 + 48));
    }
    else if (EnumCaseMultiPayload == 1)
    {
      uint64_t v5 = sub_1C9E0CFF0();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
      uint64_t v6 = type metadata accessor for ExecutionInfo(0);
      *((unsigned char *)a1 + *(int *)(v6 + 20)) = *((unsigned char *)a2 + *(int *)(v6 + 20));
      *((unsigned char *)a1 + *(int *)(v6 + 24)) = *((unsigned char *)a2 + *(int *)(v6 + 24));
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D50);
      *((unsigned char *)a1 + *(int *)(v7 + 48)) = *((unsigned char *)a2 + *(int *)(v7 + 48));
    }
    else
    {
      *a1 = *a2;
      uint64_t v11 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6CF0) + 64);
      uint64_t v12 = (char *)a1 + v11;
      uint64_t v13 = (char *)a2 + v11;
      uint64_t v14 = sub_1C9E0CFF0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
      uint64_t v15 = type metadata accessor for ExecutionInfo(0);
      v12[*(int *)(v15 + 20)] = v13[*(int *)(v15 + 20)];
      v12[*(int *)(v15 + 24)] = v13[*(int *)(v15 + 24)];
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1C9DE1E40()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1C9DE1E50()
{
  uint64_t result = type metadata accessor for ExecutionInfo(319);
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout3();
    uint64_t v5 = &v4;
    swift_getTupleTypeLayout2();
    uint64_t v6 = &v3;
    swift_getTupleTypeLayout2();
    uint64_t v7 = &v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for CrossDeviceCommandExecution.Result(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C9DE2000);
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

void type metadata accessor for CrossDeviceCommandExecution.Result()
{
}

uint64_t _s27SiriVirtualDeviceResolution13ExecutionInfoV21QuickStopActionResultOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *_s27SiriVirtualDeviceResolution13ExecutionInfoV21QuickStopActionResultOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x1C9DE2188);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

void type metadata accessor for CrossDeviceCommandExecution.FailureReason()
{
}

uint64_t getEnumTagSinglePayload for HomeKitTarget(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF9)
  {
    if (a2 + 7 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 7) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 8;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v5 = v6 - 8;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for HomeKitTarget(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0x1C9DE2310);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

void type metadata accessor for HomeKitTarget()
{
}

uint64_t dispatch thunk of DeviceResolutionAnalytics.logCommandExecution(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of DeviceResolutionAnalytics.selectHomeKitTarget(_:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t type metadata accessor for DeviceResolutionAnalyticsImpl()
{
  return self;
}

uint64_t method lookup function for DeviceResolutionAnalyticsImpl(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for DeviceResolutionAnalyticsImpl);
}

uint64_t dispatch thunk of DeviceResolutionAnalyticsImpl.logCommandExecution(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of DeviceResolutionAnalyticsImpl.selectHomeKitTarget(_:for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

void *sub_1C9DE23F0(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (void *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1C9E0CFF0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
    *((unsigned char *)a1 + v8) = *((unsigned char *)a2 + v8);
    *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1C9DE24D4(uint64_t a1)
{
  uint64_t v2 = sub_1C9E0CFF0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9DE2548(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1C9E0CFF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1C9DE25DC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1C9E0CFF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_1C9DE2680(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1C9E0CFF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_1C9DE2710(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1C9E0CFF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[7];
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  return a1;
}

uint64_t sub_1C9DE27A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C9DE27BC);
}

uint64_t sub_1C9DE27BC()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_1_3();
  if (*(_DWORD *)(v4 + 84) == v1)
  {
    return __swift_getEnumTagSinglePayload(v0, v1, v3);
  }
  else
  {
    unint64_t v6 = *(void *)(v0 + *(int *)(v2 + 20));
    if (v6 >= 0xFFFFFFFF) {
      LODWORD(v6) = -1;
    }
    int v7 = v6 - 1;
    if (v7 < 0) {
      int v7 = -1;
    }
    return (v7 + 1);
  }
}

uint64_t sub_1C9DE2844(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C9DE2858);
}

void sub_1C9DE2858()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_1_3();
  if (*(_DWORD *)(v4 + 84) == v3)
  {
    uint64_t v5 = OUTLINED_FUNCTION_18();
    __swift_storeEnumTagSinglePayload(v5, v6, v7, v8);
  }
  else
  {
    *(void *)(v1 + *(int *)(v2 + 20)) = v0;
  }
}

uint64_t type metadata accessor for RequestAnalyticsContext(uint64_t a1)
{
  return sub_1C9DE28E0(a1, (uint64_t *)&unk_1EA5C6D70);
}

uint64_t sub_1C9DE28E0(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1C9DE2914()
{
  uint64_t result = sub_1C9E0CFF0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1C9DE29BC()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 56)) {
    swift_release();
  }
  return MEMORY[0x1F4186498](v0, 72, 7);
}

uint64_t sub_1C9DE2A14()
{
  return sub_1C9DDFB84(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(unsigned char *)(v0 + 48), *(void (**)(uint64_t))(v0 + 56), *(void *)(v0 + 64));
}

uint64_t sub_1C9DE2A28(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1C9DE2A38(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_2_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_1C9DE2A98(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8_0();
  v3();
  return a1;
}

uint64_t sub_1C9DE2AEC(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_2_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_1C9DE2B4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1C9DD5CF8(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v16 = *v4;
    uint64_t *v4 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D88);
    sub_1C9E0D610();
    swift_bridgeObjectRelease();
    uint64_t v10 = *(void *)(v16 + 56);
    uint64_t v11 = type metadata accessor for RequestAnalyticsContext(0);
    sub_1C9DE2AEC(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v8, a3, (void (*)(void))type metadata accessor for RequestAnalyticsContext);
    sub_1C9E0D620();
    uint64_t *v4 = v16;
    swift_bridgeObjectRelease();
    uint64_t v12 = a3;
    uint64_t v13 = 0;
    uint64_t v14 = v11;
  }
  else
  {
    uint64_t v14 = type metadata accessor for RequestAnalyticsContext(0);
    uint64_t v12 = a3;
    uint64_t v13 = 1;
  }
  return __swift_storeEnumTagSinglePayload(v12, v13, 1, v14);
}

uint64_t sub_1C9DE2CC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *v3;
  *int v3 = 0x8000000000000000;
  sub_1C9DE2D54(a1, a2, a3);
  *int v3 = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9DE2D54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_1C9DD5CF8(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D88);
  if ((sub_1C9E0D610() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_1C9DD5CF8(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_13:
    uint64_t result = sub_1C9E0D830();
    __break(1u);
    return result;
  }
  unint64_t v11 = v13;
LABEL_5:
  uint64_t v15 = *v4;
  if (v12)
  {
    uint64_t v16 = v15[7];
    uint64_t v17 = v16 + *(void *)(*(void *)(type metadata accessor for RequestAnalyticsContext(0) - 8) + 72) * v11;
    return sub_1C9DE2F50(a1, v17);
  }
  else
  {
    sub_1C9DE2EA4(v11, a2, a3, a1, v15);
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_1C9DE2EA4(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = (void *)(a5[6] + 16 * a1);
  *uint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = type metadata accessor for RequestAnalyticsContext(0);
  uint64_t result = sub_1C9DE2AEC(a4, v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1, (void (*)(void))type metadata accessor for RequestAnalyticsContext);
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

uint64_t sub_1C9DE2F50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RequestAnalyticsContext(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C9DE2FB8()
{
  return sub_1C9DDF850(v0[2], v0[3], v0[4]);
}

uint64_t objectdestroy_2Tm(uint64_t a1)
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v1, a1, 7);
}

uint64_t sub_1C9DE3014(uint64_t a1)
{
  return sub_1C9DDF11C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

unint64_t sub_1C9DE3020()
{
  unint64_t result = qword_1EA5C6DA0;
  if (!qword_1EA5C6DA0)
  {
    sub_1C9DD7D6C(255, (unint64_t *)&qword_1EA5C6CC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C6DA0);
  }
  return result;
}

void sub_1C9DE3080(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  if ((a3 & 1) == 0)
  {
    if (a1 < 0 || -(-1 << *(unsigned char *)(a4 + 32)) <= a1)
    {
      __break(1u);
    }
    else if ((*(void *)(a4 + 64 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> a1))
    {
      if (*(_DWORD *)(a4 + 36) == a2)
      {
        sub_1C9E0D4A0();
        return;
      }
      goto LABEL_12;
    }
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (sub_1C9E0D670() != *(_DWORD *)(a4 + 36))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  sub_1C9E0D680();
  sub_1C9DE3530(a1, a2, 1);
  sub_1C9DD7D6C(0, (unint64_t *)&qword_1EA5C6CC0);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
  sub_1C9DD996C((uint64_t)v8);
  char v7 = v6;

  if (v7)
  {
    sub_1C9E0D650();
    sub_1C9E0D6A0();
    sub_1C9DE3524(a1, a2, 1);
    swift_unknownObjectRelease();
    return;
  }
LABEL_14:
  __break(1u);
}

uint64_t sub_1C9DE3220(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0) {
    return sub_1C9E0D630();
  }
  unint64_t v2 = *(void *)(a1 + 64);
  if (v2)
  {
    uint64_t v3 = 0;
    return __clz(__rbit64(v2)) + v3;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v1 = 1 << v5;
  if (v6 < 7) {
    return v1;
  }
  unint64_t v2 = *(void *)(a1 + 72);
  if (v2)
  {
    uint64_t v3 = 64;
    return __clz(__rbit64(v2)) + v3;
  }
  uint64_t v3 = 64;
  for (uint64_t i = 10; i - 8 < (unint64_t)(v1 + 63) >> 6; ++i)
  {
    unint64_t v2 = *(void *)(a1 + 8 * i);
    v3 += 64;
    if (v2) {
      return __clz(__rbit64(v2)) + v3;
    }
  }
  return v1;
}

uint64_t sub_1C9DE32DC(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0) {
    return sub_1C9E0D4D0();
  }
  else {
    return *(void *)(a1 + 16);
  }
}

void sub_1C9DE32FC(void *a1, uint64_t a2, int a3, char a4, uint64_t a5)
{
  uint64_t v6 = a2;
  if ((a5 & 0xC000000000000001) != 0)
  {
    if (a4)
    {
      sub_1C9E0D6B0();
      sub_1C9DD7D6C(0, (unint64_t *)&qword_1EA5C6CC0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      sub_1C9DD7D6C(0, &qword_1EA5C70A0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v13;
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_18;
  }
  if (a4)
  {
LABEL_10:
    if (sub_1C9E0D670() == *(_DWORD *)(a5 + 36))
    {
      sub_1C9E0D680();
      sub_1C9DD7D6C(0, (unint64_t *)&qword_1EA5C6CC0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      uint64_t v6 = sub_1C9DD996C((uint64_t)v13);
      char v9 = v8;

      if (v9) {
        goto LABEL_12;
      }
LABEL_17:
      __break(1u);
LABEL_18:
      __break(1u);
      return;
    }
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (a2 < 0 || 1 << *(unsigned char *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (((*(void *)(a5 + 8 * ((unint64_t)a2 >> 6) + 64) >> a2) & 1) == 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (*(_DWORD *)(a5 + 36) != a3)
  {
    __break(1u);
    goto LABEL_10;
  }
LABEL_12:
  uint64_t v10 = *(void **)(*(void *)(a5 + 48) + 8 * v6);
  unint64_t v11 = *(void **)(*(void *)(a5 + 56) + 8 * v6);
  *a1 = v11;
  v10;
  id v12 = v11;
}

uint64_t sub_1C9DE3524(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1C9DE3530(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

void sub_1C9DE353C()
{
}

void sub_1C9DE357C()
{
}

uint64_t sub_1C9DE35BC()
{
  return sub_1C9DDCCD8(v0);
}

uint64_t sub_1C9DE35D8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C9DE3620(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_1C9DE36C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1C9DE371C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6B20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C9DE3784(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8_0();
  v3();
  return a1;
}

uint64_t sub_1C9DE37D4()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 72, 7);
}

uint64_t sub_1C9DE3834()
{
  return sub_1C9DDE5B0(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void **)(v0 + 40), *(void **)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64));
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return sub_1C9E0D060();
}

uint64_t OUTLINED_FUNCTION_9()
{
  return sub_1C9E0D490();
}

uint64_t OUTLINED_FUNCTION_10()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_12()
{
  return objectdestroy_2Tm(40);
}

uint64_t OUTLINED_FUNCTION_13()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_14()
{
  return v0;
}

void OUTLINED_FUNCTION_15()
{
  JUMPOUT(0x1CB7900C0);
}

uint64_t OUTLINED_FUNCTION_16()
{
  return sub_1C9E0CFF0();
}

uint64_t OUTLINED_FUNCTION_17()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_18()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_19()
{
  return 0;
}

void OUTLINED_FUNCTION_20(double a1)
{
  *(double *)(v1 - 120) = a1;
}

void OUTLINED_FUNCTION_21(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_22()
{
  return sub_1C9E0CFF0();
}

char *sub_1C9DE3B00(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___SVDBooleanCapabilityPrimitive_supportStatus] = 0;
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for BooleanCapabilityPrimitive();
  uint64_t result = (char *)objc_msgSendSuper2(&v4, sel_init);
  *(void *)&result[OBJC_IVAR___SVDBooleanCapabilityPrimitive_supportStatus] = a1;
  return result;
}

id sub_1C9DE3B5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6E20);
  unint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C9E0FC40;
  id v5 = objc_allocWithZone(NSNumber);
  swift_bridgeObjectRetain();
  *(void *)(inited + 32) = objc_msgSend(v5, sel_initWithInteger_, a3);
  sub_1C9E0D230();
  unint64_t v6 = inited;
  if (inited >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1C9E0D700();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = *(void *)((inited & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v7) {
    sub_1C9DE42BC(v6);
  }
  else {
    swift_bridgeObjectRelease();
  }
  id v8 = objc_allocWithZone((Class)type metadata accessor for CapabilityDescription());
  return CapabilityDescription.init(key:valueSet:)();
}

uint64_t sub_1C9DE3C80(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueSet);
  if (!v2) {
    return 0;
  }
  id v3 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, 0);
  char v4 = sub_1C9DEEA00(v3, v2);

  if (v4) {
    return 1;
  }
  id v6 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, *(void *)(v1 + OBJC_IVAR___SVDBooleanCapabilityPrimitive_supportStatus));
  char v7 = sub_1C9DEEA00(v6, v2);

  return v7 & 1;
}

uint64_t sub_1C9DE3D3C()
{
  return 1;
}

void sub_1C9DE3D44(void *a1)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR___SVDBooleanCapabilityPrimitive_supportStatus);
  id v4 = (id)OUTLINED_FUNCTION_0_2();
  objc_msgSend(a1, sel_encodeInteger_forKey_, v3, v4);
}

id sub_1C9DE3E14(void *a1)
{
  uint64_t v3 = OBJC_IVAR___SVDBooleanCapabilityPrimitive_supportStatus;
  *(void *)&v1[OBJC_IVAR___SVDBooleanCapabilityPrimitive_supportStatus] = 0;
  id v4 = v1;
  id v5 = (void *)OUTLINED_FUNCTION_0_2();
  id v6 = objc_msgSend(a1, sel_decodeIntegerForKey_, v5);

  unint64_t v7 = CapabilitySupportStatus.init(rawValue:)((unint64_t)v6);
  if (v8) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = v7;
  }
  *(void *)&v1[v3] = v9;

  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for BooleanCapabilityPrimitive();
  id v10 = objc_msgSendSuper2(&v12, sel_init);

  return v10;
}

void sub_1C9DE3EE8()
{
}

id sub_1C9DE3F28()
{
  return sub_1C9DE4260(type metadata accessor for BooleanCapabilityPrimitive);
}

char *sub_1C9DE3F40(double a1)
{
  *(void *)&v1[OBJC_IVAR____TtC27SiriVirtualDeviceResolution36ContinuousNumericCapabilityPrimitive_value] = 0;
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for ContinuousNumericCapabilityPrimitive();
  uint64_t result = (char *)objc_msgSendSuper2(&v4, sel_init);
  *(double *)&result[OBJC_IVAR____TtC27SiriVirtualDeviceResolution36ContinuousNumericCapabilityPrimitive_value] = a1;
  return result;
}

id sub_1C9DE3F9C(id result, uint64_t a2, double a3, double a4)
{
  if (a3 > a4)
  {
    __break(1u);
  }
  else
  {
    uint64_t v7 = (uint64_t)result;
    objc_allocWithZone((Class)type metadata accessor for CapabilityDescription());
    swift_bridgeObjectRetain();
    return CapabilityDescription.init(key:valueRange:)(v7, a2, a3, a4);
  }
  return result;
}

BOOL sub_1C9DE4014(uint64_t a1)
{
  uint64_t v2 = (double *)(a1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueRange);
  if (*(unsigned char *)(a1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueRange + 16)) {
    return 0;
  }
  double v3 = *(double *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution36ContinuousNumericCapabilityPrimitive_value);
  return *v2 <= v3 && v3 <= v2[1];
}

void sub_1C9DE4064(void *a1)
{
  double v3 = *(double *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution36ContinuousNumericCapabilityPrimitive_value);
  id v4 = (id)OUTLINED_FUNCTION_1_4();
  objc_msgSend(a1, sel_encodeDouble_forKey_, v4, v3);
}

id sub_1C9DE413C(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution36ContinuousNumericCapabilityPrimitive_value;
  *(void *)&v1[OBJC_IVAR____TtC27SiriVirtualDeviceResolution36ContinuousNumericCapabilityPrimitive_value] = 0;
  id v4 = v1;
  id v5 = (void *)OUTLINED_FUNCTION_1_4();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v5);
  uint64_t v7 = v6;

  *(void *)&v1[v3] = v7;
  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for ContinuousNumericCapabilityPrimitive();
  id v8 = objc_msgSendSuper2(&v10, sel_init);

  return v8;
}

void sub_1C9DE4208()
{
}

id sub_1C9DE4248()
{
  return sub_1C9DE4260(type metadata accessor for ContinuousNumericCapabilityPrimitive);
}

id sub_1C9DE4260(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for ContinuousNumericCapabilityPrimitive()
{
  return self;
}

void sub_1C9DE42BC(unint64_t a1)
{
  unint64_t v1 = a1;
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1C9E0D700();
    swift_bridgeObjectRelease();
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = MEMORY[0x1E4FBC870];
    goto LABEL_6;
  }
  if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_5;
  }
LABEL_3:
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6E28);
  uint64_t v3 = sub_1C9E0D550();
LABEL_6:
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1C9E0D700();
    swift_bridgeObjectRelease();
    if (!v5)
    {
LABEL_26:
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v5) {
      goto LABEL_26;
    }
  }
  unint64_t v6 = 0;
  uint64_t v7 = v3 + 56;
  unint64_t v27 = v1;
  unint64_t v28 = v1 & 0xC000000000000001;
  unint64_t v24 = v1 + 32;
  uint64_t v25 = v1 & 0xFFFFFFFFFFFFFF8;
  uint64_t v26 = v5;
  while (1)
  {
    if (v28)
    {
      id v8 = (id)MEMORY[0x1CB78F680](v6, v1);
    }
    else
    {
      if (v6 >= *(void *)(v25 + 16)) {
        goto LABEL_29;
      }
      id v8 = *(id *)(v24 + 8 * v6);
    }
    unint64_t v9 = v8;
    BOOL v10 = __OFADD__(v6++, 1);
    if (v10) {
      break;
    }
    uint64_t v11 = sub_1C9E0D3F0();
    uint64_t v12 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v13 = v11 & ~v12;
    unint64_t v14 = v13 >> 6;
    uint64_t v15 = *(void *)(v7 + 8 * (v13 >> 6));
    uint64_t v16 = 1 << v13;
    if (((1 << v13) & v15) != 0)
    {
      sub_1C9DE4500();
      id v17 = *(id *)(*(void *)(v3 + 48) + 8 * v13);
      char v18 = sub_1C9E0D400();

      if (v18)
      {
LABEL_21:

        uint64_t v5 = v26;
        unint64_t v1 = v27;
        goto LABEL_25;
      }
      uint64_t v19 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v19;
        unint64_t v14 = v13 >> 6;
        uint64_t v15 = *(void *)(v7 + 8 * (v13 >> 6));
        uint64_t v16 = 1 << v13;
        if ((v15 & (1 << v13)) == 0) {
          break;
        }
        id v20 = *(id *)(*(void *)(v3 + 48) + 8 * v13);
        char v21 = sub_1C9E0D400();

        if (v21) {
          goto LABEL_21;
        }
      }
      uint64_t v5 = v26;
      unint64_t v1 = v27;
    }
    *(void *)(v7 + 8 * v14) = v16 | v15;
    *(void *)(*(void *)(v3 + 48) + 8 * v13) = v9;
    uint64_t v22 = *(void *)(v3 + 16);
    BOOL v10 = __OFADD__(v22, 1);
    uint64_t v23 = v22 + 1;
    if (v10) {
      goto LABEL_28;
    }
    *(void *)(v3 + 16) = v23;
LABEL_25:
    if (v6 == v5) {
      goto LABEL_26;
    }
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
}

unint64_t sub_1C9DE4500()
{
  unint64_t result = qword_1EA5C6E30;
  if (!qword_1EA5C6E30)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA5C6E30);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return sub_1C9E0D110();
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return sub_1C9E0D110();
}

uint64_t static DeviceUnit.supportsSecureCoding.getter()
{
  return byte_1EA5C6E40;
}

uint64_t static DeviceUnit.supportsSecureCoding.setter(char a1)
{
  uint64_t result = OUTLINED_FUNCTION_45();
  byte_1EA5C6E40 = a1;
  return result;
}

uint64_t (*static DeviceUnit.supportsSecureCoding.modify())()
{
  return j__swift_endAccess;
}

uint64_t DeviceUnit.identifier.getter()
{
  return OUTLINED_FUNCTION_26();
}

id sub_1C9DE46D8(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  uint64_t v3 = (void *)sub_1C9E0D110();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t DeviceUnit.assistantId.getter()
{
  return OUTLINED_FUNCTION_26();
}

uint64_t DeviceUnit.name.getter()
{
  return sub_1C9DE6D10();
}

id sub_1C9DE4790(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  if (v3)
  {
    uint64_t v4 = (void *)sub_1C9E0D110();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

uint64_t DeviceUnit.roomName.getter()
{
  return sub_1C9DE6D10();
}

uint64_t DeviceUnit.proximity.getter()
{
  return *(void *)(v0 + OBJC_IVAR___SVDDeviceUnitSwift_proximity);
}

uint64_t DeviceUnit.mediaRouteIdentifier.getter()
{
  return sub_1C9DE6D10();
}

uint64_t DeviceUnit.isCommunalDevice.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___SVDDeviceUnitSwift_isCommunalDevice);
}

uint64_t DeviceUnit.homeKitAccessoryIdentifier.getter()
{
  return sub_1C9DE6D10();
}

id DeviceUnit.__allocating_init(identifier:assistantId:builder:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t))
{
  id v11 = objc_allocWithZone(v5);
  return DeviceUnit.init(identifier:assistantId:builder:)(a1, a2, a3, a4, a5);
}

id DeviceUnit.init(identifier:assistantId:builder:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t))
{
  uint64_t v7 = &v5[OBJC_IVAR___SVDDeviceUnitSwift_identifier];
  *(void *)uint64_t v7 = a1;
  *((void *)v7 + 1) = a2;
  id v8 = &v5[OBJC_IVAR___SVDDeviceUnitSwift_assistantId];
  *(void *)id v8 = a3;
  *((void *)v8 + 1) = a4;
  if (a5)
  {
    type metadata accessor for MutableDeviceUnit();
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = 0u;
    *(_OWORD *)(v9 + 32) = 0u;
    *(_OWORD *)(v9 + 48) = 0u;
    *(_OWORD *)(v9 + 57) = 0u;
    *(void *)(v9 + 80) = 0;
    *(void *)(v9 + 88) = 0;
    BOOL v10 = v5;
    a5(v9);
    uint64_t v11 = *(void *)(v9 + 24);
    uint64_t v12 = &v10[OBJC_IVAR___SVDDeviceUnitSwift_name];
    *(void *)uint64_t v12 = *(void *)(v9 + 16);
    *((void *)v12 + 1) = v11;
    uint64_t v13 = *(void *)(v9 + 40);
    unint64_t v14 = &v10[OBJC_IVAR___SVDDeviceUnitSwift_roomName];
    *(void *)unint64_t v14 = *(void *)(v9 + 32);
    *((void *)v14 + 1) = v13;
    *(void *)&v10[OBJC_IVAR___SVDDeviceUnitSwift_proximity] = *(void *)(v9 + 48);
    uint64_t v15 = *(void *)(v9 + 64);
    uint64_t v16 = &v10[OBJC_IVAR___SVDDeviceUnitSwift_mediaRouteIdentifier];
    *(void *)uint64_t v16 = *(void *)(v9 + 56);
    *((void *)v16 + 1) = v15;
    v10[OBJC_IVAR___SVDDeviceUnitSwift_isCommunalDevice] = *(unsigned char *)(v9 + 72);
    uint64_t v18 = *(void *)(v9 + 80);
    uint64_t v17 = *(void *)(v9 + 88);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_release();
    uint64_t v19 = &v10[OBJC_IVAR___SVDDeviceUnitSwift_homeKitAccessoryIdentifier];
    *(void *)uint64_t v19 = v18;
    *((void *)v19 + 1) = v17;
  }
  else
  {
    OUTLINED_FUNCTION_36(OBJC_IVAR___SVDDeviceUnitSwift_name);
    OUTLINED_FUNCTION_36(OBJC_IVAR___SVDDeviceUnitSwift_roomName);
    *(void *)&v5[OBJC_IVAR___SVDDeviceUnitSwift_proximity] = 0;
    OUTLINED_FUNCTION_36(OBJC_IVAR___SVDDeviceUnitSwift_mediaRouteIdentifier);
    v5[OBJC_IVAR___SVDDeviceUnitSwift_isCommunalDevice] = 0;
    OUTLINED_FUNCTION_36(OBJC_IVAR___SVDDeviceUnitSwift_homeKitAccessoryIdentifier);
  }
  v23.receiver = v5;
  v23.super_class = (Class)type metadata accessor for DeviceUnit();
  id v20 = objc_msgSendSuper2(&v23, sel_init);
  uint64_t v21 = OUTLINED_FUNCTION_26();
  sub_1C9DD8774(v21);
  return v20;
}

uint64_t type metadata accessor for DeviceUnit()
{
  return self;
}

uint64_t type metadata accessor for MutableDeviceUnit()
{
  return self;
}

id DeviceUnit.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return DeviceUnit.init(coder:)(a1);
}

id DeviceUnit.init(coder:)(void *a1)
{
  unint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA5C6B10);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1C9E0F330;
  unint64_t v5 = sub_1C9DE6ACC();
  *(void *)(v4 + 32) = v5;
  unint64_t v6 = v2;
  OUTLINED_FUNCTION_24();
  swift_bridgeObjectRelease();
  if (v103)
  {
    if (OUTLINED_FUNCTION_6_1())
    {
      uint64_t v7 = (__n128 *)OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_12_0(v7, v8, v9, v10, v11, v12, v13, v14, v65, v69, v74, v79, v83, v87, v91, v95, v15);
      OUTLINED_FUNCTION_20_0();
      swift_bridgeObjectRelease();
      if (OUTLINED_FUNCTION_6_1())
      {
        uint64_t v16 = v101;
        uint64_t v17 = (__n128 *)OUTLINED_FUNCTION_7_1();
        OUTLINED_FUNCTION_12_0(v17, v18, v19, v20, v21, v22, v23, v24, v66, v70, v75, v80, v84, v88, v92, v96, v25);
        sub_1C9E0D3E0();
        swift_bridgeObjectRelease();
        if (OUTLINED_FUNCTION_6_1())
        {
          uint64_t v26 = (__n128 *)OUTLINED_FUNCTION_7_1();
          OUTLINED_FUNCTION_12_0(v26, v27, v28, v29, v30, v31, v32, v33, v67, v71, v76, v81, v85, v100, v100, v97, v34);
          OUTLINED_FUNCTION_31();
          swift_bridgeObjectRelease();
          if (OUTLINED_FUNCTION_6_1())
          {
            uint64_t v35 = v101;
            uint64_t v36 = v101;
            uint64_t v39 = (void *)OUTLINED_FUNCTION_5_1();
            id v40 = objc_msgSend(a1, sel_decodeIntegerForKey_, v39);

            uint64_t v41 = Proximity.init(rawValue:)(v40);
            if (v42)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();

              swift_bridgeObjectRelease();
              goto LABEL_13;
            }
            uint64_t v43 = v41;
            uint64_t v44 = (__n128 *)OUTLINED_FUNCTION_7_1();
            OUTLINED_FUNCTION_12_0(v44, v45, v46, v47, v48, v49, v50, v51, v68, v72, v77, v100, v100, v89, v93, v101, v52);
            sub_1C9E0D3E0();
            swift_bridgeObjectRelease();
            if (OUTLINED_FUNCTION_6_1())
            {
              uint64_t v73 = v100;
              uint64_t v78 = v43;
              uint64_t v53 = v101;
              uint64_t v54 = OUTLINED_FUNCTION_7_1();
              *(_OWORD *)(v54 + 16) = xmmword_1C9E0F330;
              *(void *)(v54 + 32) = v5;
              sub_1C9E0D3E0();
              swift_bridgeObjectRelease();
              if (!v103)
              {
                sub_1C9DD7D0C((uint64_t)v102);
                uint64_t v55 = 0;
                uint64_t v56 = 0;
                goto LABEL_26;
              }
              if (OUTLINED_FUNCTION_6_1())
              {
                uint64_t v55 = v100;
                uint64_t v56 = v101;
LABEL_26:
                uint64_t v57 = &v6[OBJC_IVAR___SVDDeviceUnitSwift_identifier];
                *(void *)uint64_t v57 = v86;
                *((void *)v57 + 1) = v35;
                uint64_t v58 = &v6[OBJC_IVAR___SVDDeviceUnitSwift_assistantId];
                *(void *)uint64_t v58 = v94;
                *((void *)v58 + 1) = v16;
                uint64_t v59 = &v6[OBJC_IVAR___SVDDeviceUnitSwift_name];
                *(void *)uint64_t v59 = v90;
                *((void *)v59 + 1) = v98;
                v60 = &v6[OBJC_IVAR___SVDDeviceUnitSwift_roomName];
                *(void *)v60 = v82;
                *((void *)v60 + 1) = v36;
                *(void *)&v6[OBJC_IVAR___SVDDeviceUnitSwift_proximity] = v78;
                v61 = (uint64_t *)&v6[OBJC_IVAR___SVDDeviceUnitSwift_mediaRouteIdentifier];
                uint64_t *v61 = v73;
                v61[1] = v53;
                id v62 = (void *)OUTLINED_FUNCTION_43();
                unsigned __int8 v63 = objc_msgSend(a1, sel_decodeBoolForKey_, v62);

                v6[OBJC_IVAR___SVDDeviceUnitSwift_isCommunalDevice] = v63;
                v64 = (uint64_t *)&v6[OBJC_IVAR___SVDDeviceUnitSwift_homeKitAccessoryIdentifier];
                uint64_t *v64 = v55;
                v64[1] = v56;

                v99.receiver = v6;
                v99.super_class = (Class)type metadata accessor for DeviceUnit();
                id v37 = objc_msgSendSuper2(&v99, sel_init);

                return v37;
              }

              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
            }
            else
            {

              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
            }
          }
          else
          {

            swift_bridgeObjectRelease();
          }
        }
        else
        {
        }
        swift_bridgeObjectRelease();
      }
      else
      {
      }
LABEL_13:
      swift_bridgeObjectRelease();
      goto LABEL_14;
    }
  }
  else
  {

    sub_1C9DD7D0C((uint64_t)v102);
  }
LABEL_14:
  type metadata accessor for DeviceUnit();
  OUTLINED_FUNCTION_34();
  swift_deallocPartialClassInstance();
  return 0;
}

id DeviceUnit.__allocating_init(deviceUnitObjC:)(void *a1)
{
  id v1 = a1;
  if (objc_msgSend(v1, sel_respondsToSelector_, sel_assistantId))
  {
    id v2 = objc_msgSend(v1, sel_identifier);
    uint64_t v3 = sub_1C9E0D120();
    uint64_t v5 = v4;

    id v6 = objc_msgSend(v1, sel_assistantId);
    uint64_t v7 = sub_1C9E0D120();
    uint64_t v9 = v8;

    *(void *)(swift_allocObject() + 16) = v1;
    id v10 = objc_allocWithZone((Class)type metadata accessor for DeviceUnit());
    id v11 = DeviceUnit.init(identifier:assistantId:builder:)(v3, v5, v7, v9, (void (*)(uint64_t))sub_1C9DE6B44);
  }
  else
  {

    return 0;
  }
  return v11;
}

id sub_1C9DE5208(void *a1, void *a2)
{
  sub_1C9DE8A28(a2, (SEL *)&selRef_name);
  if (v4)
  {
    uint64_t v5 = (void *)sub_1C9E0D110();
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_setName_, v5);
  }
  sub_1C9DE8A28(a2, (SEL *)&selRef_roomName);
  if (v6)
  {
    uint64_t v7 = (void *)sub_1C9E0D110();
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_setRoomName_, v7);
  }
  uint64_t v8 = Proximity.init(rawValue:)(objc_msgSend(a2, sel_proximity));
  if ((v9 & 1) == 0) {
    objc_msgSend(a1, sel_setProximity_, v8);
  }
  sub_1C9DE8A28(a2, (SEL *)&selRef_mediaRouteIdentifier);
  if (v10)
  {
    id v11 = (void *)sub_1C9E0D110();
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_setMediaRouteIdentifier_, v11);
  }
  sub_1C9E00FF0(a2);
  if (v12)
  {
    uint64_t v13 = (void *)sub_1C9E0D110();
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_setHomeKitAccessoryIdentifier_, v13);
  }
  id v14 = objc_msgSend(a2, sel_isCommunalDevice);
  return objc_msgSend(a1, sel_setIsCommunalDevice_, v14);
}

void sub_1C9DE5388(void *a1)
{
  OUTLINED_FUNCTION_42();
  uint64_t v4 = (void *)OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_2_2();

  uint64_t v5 = (void *)OUTLINED_FUNCTION_42();
  uint64_t v6 = OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_1_5(v6);

  OUTLINED_FUNCTION_28();
  if (v7) {
    sub_1C9E0D110();
  }
  uint64_t v8 = sub_1C9E0D110();
  OUTLINED_FUNCTION_1_5(v8);
  swift_unknownObjectRelease();

  OUTLINED_FUNCTION_28();
  if (v9) {
    sub_1C9E0D110();
  }
  uint64_t v10 = OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_1_5(v10);
  swift_unknownObjectRelease();

  uint64_t v11 = *(void *)(v1 + OBJC_IVAR___SVDDeviceUnitSwift_proximity);
  uint64_t v12 = (void *)OUTLINED_FUNCTION_5_1();
  objc_msgSend(a1, sel_encodeInteger_forKey_, v11, v12);

  OUTLINED_FUNCTION_28();
  if (v13) {
    sub_1C9E0D110();
  }
  uint64_t v14 = sub_1C9E0D110();
  OUTLINED_FUNCTION_1_5(v14);
  swift_unknownObjectRelease();

  uint64_t v15 = *(unsigned __int8 *)(v1 + OBJC_IVAR___SVDDeviceUnitSwift_isCommunalDevice);
  uint64_t v16 = (void *)OUTLINED_FUNCTION_43();
  objc_msgSend(a1, sel_encodeBool_forKey_, v15, v16);

  OUTLINED_FUNCTION_28();
  if (v17) {
    uint64_t v18 = sub_1C9E0D110();
  }
  else {
    uint64_t v18 = 0;
  }
  id v19 = (id)sub_1C9E0D110();
  objc_msgSend(a1, sel_encodeObject_forKey_, v18, v19);
  swift_unknownObjectRelease();
}

uint64_t sub_1C9DE5684()
{
  uint64_t v1 = v0;
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for DeviceUnit();
  id v2 = objc_msgSendSuper2(&v5, sel_description);
  uint64_t v3 = sub_1C9E0D120();

  sub_1C9E0D560();
  sub_1C9E0D180();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_14_0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_22_0(OBJC_IVAR___SVDDeviceUnitSwift_name);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_14_0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_22_0(OBJC_IVAR___SVDDeviceUnitSwift_roomName);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_14_0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_15_0();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_14_0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_16_0();
  Proximity.description.getter(*(void *)&v1[OBJC_IVAR___SVDDeviceUnitSwift_proximity]);
  sub_1C9E0D180();
  swift_bridgeObjectRelease();
  sub_1C9E0D180();
  OUTLINED_FUNCTION_22_0(OBJC_IVAR___SVDDeviceUnitSwift_mediaRouteIdentifier);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_14_0();
  swift_bridgeObjectRelease();
  sub_1C9E0D180();
  sub_1C9E0D180();
  swift_bridgeObjectRelease();
  sub_1C9E0D180();
  swift_bridgeObjectRetain();
  sub_1C9E0D180();
  swift_bridgeObjectRelease();
  sub_1C9E0D180();
  swift_bridgeObjectRetain();
  sub_1C9E0D180();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_1C9DE5944(uint64_t a1)
{
  sub_1C9DE371C(a1, (uint64_t)v10);
  if (!v11)
  {
    sub_1C9DD7D0C((uint64_t)v10);
    goto LABEL_14;
  }
  type metadata accessor for DeviceUnit();
  if ((OUTLINED_FUNCTION_35() & 1) == 0)
  {
LABEL_14:
    char v7 = 0;
    return v7 & 1;
  }
  OUTLINED_FUNCTION_13_0(OBJC_IVAR___SVDDeviceUnitSwift_assistantId);
  BOOL v3 = v3 && v1 == v2;
  if (!v3 && (sub_1C9E0D7F0() & 1) == 0)
  {

    goto LABEL_14;
  }
  OUTLINED_FUNCTION_13_0(OBJC_IVAR___SVDDeviceUnitSwift_identifier);
  if (v3 && v4 == v5)
  {

    char v7 = 1;
  }
  else
  {
    char v7 = sub_1C9E0D7F0();
  }
  return v7 & 1;
}

uint64_t sub_1C9DE5A54()
{
  sub_1C9E0D8E0();
  OUTLINED_FUNCTION_10_0();
  sub_1C9E0D150();
  swift_bridgeObjectRelease();
  memcpy(__dst, v1, sizeof(__dst));
  return sub_1C9E0D8C0();
}

id DeviceUnit.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void DeviceUnit.init()()
{
}

BOOL sub_1C9DE5B30(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_1C9DE5B40(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v2 || (sub_1C9E0D7F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6E61747369737361 && a2 == 0xEB00000000644974;
    if (v6 || (sub_1C9E0D7F0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 1701667182 && a2 == 0xE400000000000000;
      if (v7 || (sub_1C9E0D7F0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x656D614E6D6F6F72 && a2 == 0xE800000000000000;
        if (v8 || (sub_1C9E0D7F0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x74696D69786F7270 && a2 == 0xE900000000000079;
          if (v9 || (sub_1C9E0D7F0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0xD000000000000014 && a2 == 0x80000001C9E11980 || (sub_1C9E0D7F0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else if (a1 == 0xD000000000000010 && a2 == 0x80000001C9E11830 || (sub_1C9E0D7F0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 6;
          }
          else if (a1 == 0xD00000000000001ALL && a2 == 0x80000001C9E119A0)
          {
            swift_bridgeObjectRelease();
            return 7;
          }
          else
          {
            char v10 = sub_1C9E0D7F0();
            swift_bridgeObjectRelease();
            if (v10) {
              return 7;
            }
            else {
              return 8;
            }
          }
        }
      }
    }
  }
}

uint64_t sub_1C9DE5E80()
{
  return 8;
}

uint64_t sub_1C9DE5E88()
{
  return 0;
}

unint64_t sub_1C9DE5E94(char a1)
{
  unint64_t result = 0x696669746E656469;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6E61747369737361;
      break;
    case 2:
      unint64_t result = 1701667182;
      break;
    case 3:
      unint64_t result = 0x656D614E6D6F6F72;
      break;
    case 4:
      unint64_t result = 0x74696D69786F7270;
      break;
    case 5:
      unint64_t result = 0xD000000000000014;
      break;
    case 6:
      unint64_t result = 0xD000000000000010;
      break;
    case 7:
      unint64_t result = 0xD00000000000001ALL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_1C9DE5FB4()
{
  return sub_1C9DE5E94(*v0);
}

uint64_t sub_1C9DE5FBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C9DE5B40(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C9DE5FE4()
{
  return sub_1C9DE5E88();
}

uint64_t sub_1C9DE6004@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1C9DE5E80();
  *a1 = result;
  return result;
}

uint64_t sub_1C9DE602C(uint64_t a1)
{
  unint64_t v2 = sub_1C9DE817C();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C9DE6068(uint64_t a1)
{
  unint64_t v2 = sub_1C9DE817C();
  return MEMORY[0x1F41862B0](a1, v2);
}

id DeviceUnit.__deallocating_deinit()
{
  return sub_1C9DE7B18(type metadata accessor for DeviceUnit);
}

uint64_t sub_1C9DE6140(void *a1)
{
  uint64_t v3 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6EA0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  unint64_t v6 = sub_1C9DE817C();
  OUTLINED_FUNCTION_38((uint64_t)&type metadata for DeviceUnit.CodingKeys, v7, v6);
  uint64_t v8 = OUTLINED_FUNCTION_37(OBJC_IVAR___SVDDeviceUnitSwift_identifier);
  LOBYTE(v15) = 0;
  OUTLINED_FUNCTION_21_0(v8, v9, (uint64_t)&v15);
  if (!v2)
  {
    uint64_t v10 = *(void *)(v3 + OBJC_IVAR___SVDDeviceUnitSwift_assistantId);
    uint64_t v11 = *(void *)(v3 + OBJC_IVAR___SVDDeviceUnitSwift_assistantId + 8);
    LOBYTE(v15) = 1;
    OUTLINED_FUNCTION_21_0(v10, v11, (uint64_t)&v15);
    OUTLINED_FUNCTION_8_1(2);
    OUTLINED_FUNCTION_8_1(3);
    uint64_t v15 = *(void *)(v3 + OBJC_IVAR___SVDDeviceUnitSwift_proximity);
    sub_1C9DE81C8();
    sub_1C9E0D7D0();
    OUTLINED_FUNCTION_37(OBJC_IVAR___SVDDeviceUnitSwift_mediaRouteIdentifier);
    OUTLINED_FUNCTION_8_1(5);
    LOBYTE(v15) = 6;
    sub_1C9E0D7C0();
    OUTLINED_FUNCTION_37(OBJC_IVAR___SVDDeviceUnitSwift_homeKitAccessoryIdentifier);
    OUTLINED_FUNCTION_8_1(7);
  }
  uint64_t v12 = OUTLINED_FUNCTION_32();
  return v13(v12);
}

id DeviceUnit.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return DeviceUnit.init(from:)(a1);
}

id DeviceUnit.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6EB8);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v4);
  uint64_t v25 = (uint64_t)a1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C9DE817C();
  uint64_t v5 = v1;
  sub_1C9E0D8F0();
  if (v2)
  {
    id v22 = v5;
    __swift_destroy_boxed_opaque_existential_0(v25);

    type metadata accessor for DeviceUnit();
    OUTLINED_FUNCTION_34();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v6 = sub_1C9E0D770();
    uint64_t v8 = (uint64_t *)&v5[OBJC_IVAR___SVDDeviceUnitSwift_identifier];
    *uint64_t v8 = v6;
    v8[1] = v9;
    LOBYTE(v28) = 1;
    uint64_t v10 = sub_1C9E0D770();
    uint64_t v11 = (uint64_t *)&v5[OBJC_IVAR___SVDDeviceUnitSwift_assistantId];
    uint64_t *v11 = v10;
    v11[1] = v12;
    uint64_t v13 = OUTLINED_FUNCTION_9_0(2);
    OUTLINED_FUNCTION_40(v13, v14, OBJC_IVAR___SVDDeviceUnitSwift_name);
    uint64_t v15 = OUTLINED_FUNCTION_9_0(3);
    OUTLINED_FUNCTION_40(v15, v16, OBJC_IVAR___SVDDeviceUnitSwift_roomName);
    char v27 = 4;
    sub_1C9DE8214();
    sub_1C9E0D790();
    *(void *)&v5[OBJC_IVAR___SVDDeviceUnitSwift_proximity] = v28;
    uint64_t v17 = OUTLINED_FUNCTION_9_0(5);
    OUTLINED_FUNCTION_40(v17, v18, OBJC_IVAR___SVDDeviceUnitSwift_mediaRouteIdentifier);
    LOBYTE(v28) = 6;
    v5[OBJC_IVAR___SVDDeviceUnitSwift_isCommunalDevice] = sub_1C9E0D780() & 1;
    uint64_t v19 = OUTLINED_FUNCTION_9_0(7);
    OUTLINED_FUNCTION_40(v19, v20, OBJC_IVAR___SVDDeviceUnitSwift_homeKitAccessoryIdentifier);

    uint64_t v21 = (objc_class *)type metadata accessor for DeviceUnit();
    v26.receiver = v5;
    v26.super_class = v21;
    id v22 = objc_msgSendSuper2(&v26, sel_init);
    uint64_t v23 = OUTLINED_FUNCTION_3_2();
    v24(v23);
    __swift_destroy_boxed_opaque_existential_0(v25);
  }
  return v22;
}

id sub_1C9DE674C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id result = DeviceUnit.__allocating_init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_1C9DE6778(void *a1)
{
  return sub_1C9DE6140(a1);
}

unint64_t sub_1C9DE6ACC()
{
  unint64_t result = qword_1EA5C6E90;
  if (!qword_1EA5C6E90)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA5C6E90);
  }
  return result;
}

uint64_t sub_1C9DE6B0C()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

id sub_1C9DE6B44(void *a1)
{
  return sub_1C9DE5208(a1, *(void **)(v1 + 16));
}

uint64_t sub_1C9DE6B4C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1C9DE6B84()
{
  uint64_t v0 = sub_1C9DE6B4C();
  return MEMORY[0x1F4186488](v0, 96, 7);
}

uint64_t static SVDDeviceUnit.supportsSecureCoding.getter()
{
  return byte_1EA5C6E41;
}

uint64_t static SVDDeviceUnit.supportsSecureCoding.setter(char a1)
{
  uint64_t result = OUTLINED_FUNCTION_45();
  byte_1EA5C6E41 = a1;
  return result;
}

uint64_t (*static SVDDeviceUnit.supportsSecureCoding.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t SVDDeviceUnit.identifier.getter()
{
  return OUTLINED_FUNCTION_26();
}

uint64_t SVDDeviceUnit.assistantId.getter()
{
  return sub_1C9DE6D10();
}

uint64_t SVDDeviceUnit.name.getter()
{
  return OUTLINED_FUNCTION_26();
}

uint64_t SVDDeviceUnit.roomName.getter()
{
  return sub_1C9DE6D10();
}

uint64_t sub_1C9DE6D10()
{
  return OUTLINED_FUNCTION_26();
}

uint64_t SVDDeviceUnit.proximity.getter()
{
  return *(void *)(v0 + OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_proximity);
}

id SVDDeviceUnit.__allocating_init(identifier:assistantId:name:roomName:proximity:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v18 = objc_allocWithZone(v9);
  return SVDDeviceUnit.init(identifier:assistantId:name:roomName:proximity:)(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

id SVDDeviceUnit.init(identifier:assistantId:name:roomName:proximity:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = &v9[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_identifier];
  *(void *)uint64_t v10 = a1;
  *((void *)v10 + 1) = a2;
  uint64_t v11 = &v9[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_assistantId];
  *(void *)uint64_t v11 = a3;
  *((void *)v11 + 1) = a4;
  uint64_t v12 = &v9[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_name];
  *(void *)uint64_t v12 = a5;
  *((void *)v12 + 1) = a6;
  uint64_t v13 = &v9[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_roomName];
  *(void *)uint64_t v13 = a7;
  *((void *)v13 + 1) = a8;
  *(void *)&v9[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_proximity] = a9;
  v15.receiver = v9;
  v15.super_class = (Class)type metadata accessor for SVDDeviceUnit();
  return objc_msgSendSuper2(&v15, sel_init);
}

id SVDDeviceUnit.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return SVDDeviceUnit.init(coder:)(a1);
}

id SVDDeviceUnit.init(coder:)(void *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA5C6B10);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1C9E0F330;
  *(void *)(v4 + 32) = sub_1C9DE6ACC();
  uint64_t v5 = v2;
  OUTLINED_FUNCTION_24();
  swift_bridgeObjectRelease();
  if (!v59)
  {

LABEL_6:
    sub_1C9DD7D0C((uint64_t)v58);
LABEL_23:
    type metadata accessor for SVDDeviceUnit();
    swift_deallocPartialClassInstance();
    return 0;
  }
  if ((OUTLINED_FUNCTION_11_0() & 1) == 0)
  {

    goto LABEL_23;
  }
  uint64_t v6 = v57;
  uint64_t v7 = (__n128 *)OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_18_0(v7, v8, v9, v10, v11, v12, v13, v14, v48, v51, v15);
  OUTLINED_FUNCTION_20_0();
  swift_bridgeObjectRelease();
  if (!OUTLINED_FUNCTION_11_0())
  {

LABEL_22:
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  uint64_t v17 = v56;
  uint64_t v16 = v57;
  id v18 = (__n128 *)OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_18_0(v18, v19, v20, v21, v22, v23, v24, v25, v49, v52, v26);
  sub_1C9E0D3E0();
  swift_bridgeObjectRelease();
  if (!v59)
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  if ((OUTLINED_FUNCTION_11_0() & 1) == 0)
  {

    goto LABEL_21;
  }
  uint64_t v27 = v57;
  uint64_t v28 = (__n128 *)OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_18_0(v28, v29, v30, v31, v32, v33, v34, v35, v50, v56, v36);
  OUTLINED_FUNCTION_31();
  swift_bridgeObjectRelease();
  if (v59)
  {
    if (OUTLINED_FUNCTION_11_0())
    {
      uint64_t v37 = v57;
      uint64_t v54 = v56;
      goto LABEL_17;
    }

    swift_bridgeObjectRelease();
LABEL_21:
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  sub_1C9DD7D0C((uint64_t)v58);
  uint64_t v54 = 0;
  uint64_t v37 = 0;
LABEL_17:
  unint64_t v38 = (void *)OUTLINED_FUNCTION_5_1();
  id v39 = objc_msgSend(a1, sel_decodeIntegerForKey_, v38);

  uint64_t v40 = SVDProximity.init(rawValue:)((uint64_t)v39);
  if (v41)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    goto LABEL_21;
  }
  char v42 = &v5[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_identifier];
  *(void *)char v42 = v56;
  *((void *)v42 + 1) = v6;
  uint64_t v43 = (uint64_t *)&v5[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_assistantId];
  *uint64_t v43 = v17;
  v43[1] = v16;
  uint64_t v44 = &v5[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_name];
  *(void *)uint64_t v44 = v53;
  *((void *)v44 + 1) = v27;
  uint64_t v45 = (uint64_t *)&v5[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_roomName];
  *uint64_t v45 = v54;
  v45[1] = v37;
  *(void *)&v5[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_proximity] = v40;

  v55.receiver = v5;
  v55.super_class = (Class)type metadata accessor for SVDDeviceUnit();
  id v46 = objc_msgSendSuper2(&v55, sel_init);

  return v46;
}

void sub_1C9DE71C8(void *a1)
{
  OUTLINED_FUNCTION_42();
  uint64_t v4 = (void *)OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_2_2();

  OUTLINED_FUNCTION_28();
  if (v5) {
    sub_1C9E0D110();
  }
  uint64_t v6 = OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_1_5(v6);
  swift_unknownObjectRelease();

  uint64_t v7 = (void *)OUTLINED_FUNCTION_42();
  uint64_t v8 = sub_1C9E0D110();
  OUTLINED_FUNCTION_1_5(v8);

  OUTLINED_FUNCTION_28();
  if (v9) {
    sub_1C9E0D110();
  }
  uint64_t v10 = OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_1_5(v10);
  swift_unknownObjectRelease();

  uint64_t v11 = *(void *)(v1 + OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_proximity);
  id v12 = (id)OUTLINED_FUNCTION_5_1();
  objc_msgSend(a1, sel_encodeInteger_forKey_, v11, v12);
}

uint64_t sub_1C9DE7368()
{
  sub_1C9E0D560();
  sub_1C9E0D180();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_23_0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_29();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_23_0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_41(OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_roomName);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_23_0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_41(OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_assistantId);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_23_0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_16_0();
  SVDProximity.description.getter(*(void *)(v0 + OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_proximity));
  sub_1C9E0D180();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1C9DE74A4(uint64_t a1)
{
  sub_1C9DE371C(a1, (uint64_t)v11);
  if (!v12)
  {
    sub_1C9DD7D0C((uint64_t)v11);
    goto LABEL_18;
  }
  type metadata accessor for SVDDeviceUnit();
  if ((OUTLINED_FUNCTION_35() & 1) == 0)
  {
LABEL_18:
    char v8 = 0;
    return v8 & 1;
  }
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_assistantId + 8);
  uint64_t v3 = *(void *)&v10[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_assistantId + 8];
  if (v2)
  {
    if (v3)
    {
      BOOL v4 = *(void *)(v1 + OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_assistantId) == *(void *)&v10[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_assistantId]
        && v2 == v3;
      if (v4 || (sub_1C9E0D7F0() & 1) != 0) {
        goto LABEL_10;
      }
    }
    goto LABEL_17;
  }
  if (v3)
  {
LABEL_17:

    goto LABEL_18;
  }
LABEL_10:
  OUTLINED_FUNCTION_13_0(OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_identifier);
  if (v4 && v5 == v6)
  {

    char v8 = 1;
  }
  else
  {
    char v8 = sub_1C9E0D7F0();
  }
  return v8 & 1;
}

uint64_t sub_1C9DE75A4(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_OWORD *))
{
  if (a3)
  {
    id v6 = a1;
    swift_unknownObjectRetain();
    sub_1C9E0D470();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v7 = a1;
  }
  char v8 = a4(v10);

  sub_1C9DD7D0C((uint64_t)v10);
  return v8 & 1;
}

uint64_t sub_1C9DE7660()
{
  sub_1C9E0D8E0();
  if (*(void *)(v0 + OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_assistantId + 8))
  {
    sub_1C9E0D8B0();
    swift_bridgeObjectRetain();
    sub_1C9E0D150();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1C9E0D8B0();
  }
  memcpy(__dst, v2, sizeof(__dst));
  return sub_1C9E0D8C0();
}

void SVDDeviceUnit.init()()
{
}

uint64_t sub_1C9DE7740(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v2 || (sub_1C9E0D7F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6E61747369737361 && a2 == 0xEB00000000644974;
    if (v6 || (sub_1C9E0D7F0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 1701667182 && a2 == 0xE400000000000000;
      if (v7 || (sub_1C9E0D7F0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x656D614E6D6F6F72 && a2 == 0xE800000000000000;
        if (v8 || (sub_1C9E0D7F0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 0x74696D69786F7270 && a2 == 0xE900000000000079)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          char v10 = sub_1C9E0D7F0();
          swift_bridgeObjectRelease();
          if (v10) {
            return 4;
          }
          else {
            return 5;
          }
        }
      }
    }
  }
}

uint64_t sub_1C9DE7970()
{
  return 5;
}

uint64_t sub_1C9DE7978(char a1)
{
  uint64_t result = 0x696669746E656469;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6E61747369737361;
      break;
    case 2:
      uint64_t result = 1701667182;
      break;
    case 3:
      uint64_t result = 0x656D614E6D6F6F72;
      break;
    case 4:
      uint64_t result = 0x74696D69786F7270;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1C9DE7A30()
{
  return sub_1C9DE7978(*v0);
}

uint64_t sub_1C9DE7A38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C9DE7740(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C9DE7A60@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1C9DE7970();
  *a1 = result;
  return result;
}

uint64_t sub_1C9DE7A88(uint64_t a1)
{
  unint64_t v2 = sub_1C9DE8284();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C9DE7AC4(uint64_t a1)
{
  unint64_t v2 = sub_1C9DE8284();
  return MEMORY[0x1F41862B0](a1, v2);
}

id SVDDeviceUnit.__deallocating_deinit()
{
  return sub_1C9DE7B18(type metadata accessor for SVDDeviceUnit);
}

id sub_1C9DE7B18(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_1C9DE7BBC(void *a1)
{
  uint64_t v3 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6EF0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  unint64_t v6 = sub_1C9DE8284();
  OUTLINED_FUNCTION_38((uint64_t)&type metadata for SVDDeviceUnit.CodingKeys, v7, v6);
  uint64_t v8 = OUTLINED_FUNCTION_37(OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_identifier);
  char v16 = 0;
  OUTLINED_FUNCTION_21_0(v8, v9, (uint64_t)&v16);
  if (!v2)
  {
    v15[1] = 1;
    sub_1C9E0D7A0();
    uint64_t v10 = *(void *)(v3 + OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_name);
    uint64_t v11 = *(void *)(v3 + OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_name + 8);
    v15[0] = 2;
    OUTLINED_FUNCTION_21_0(v10, v11, (uint64_t)v15);
    sub_1C9E0D7A0();
    sub_1C9DE82D0();
    sub_1C9E0D7D0();
  }
  uint64_t v12 = OUTLINED_FUNCTION_32();
  return v13(v12);
}

unint64_t SVDDeviceUnit.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return SVDDeviceUnit.init(from:)(a1);
}

unint64_t SVDDeviceUnit.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6F08);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v4);
  uint64_t v23 = (uint64_t)a1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  unint64_t v5 = sub_1C9DE8284();
  unint64_t v6 = v1;
  sub_1C9E0D8F0();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_0(v23);

    type metadata accessor for SVDDeviceUnit();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v7 = sub_1C9E0D770();
    uint64_t v9 = (uint64_t *)&v6[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_identifier];
    *uint64_t v9 = v7;
    v9[1] = v10;
    uint64_t v11 = OUTLINED_FUNCTION_33(1);
    uint64_t v12 = (uint64_t *)&v6[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_assistantId];
    *uint64_t v12 = v11;
    v12[1] = v13;
    LOBYTE(v26) = 2;
    uint64_t v14 = sub_1C9E0D770();
    __n128 v15 = (uint64_t *)&v6[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_name];
    *__n128 v15 = v14;
    v15[1] = v16;
    uint64_t v17 = OUTLINED_FUNCTION_33(3);
    id v18 = (uint64_t *)&v6[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_roomName];
    *id v18 = v17;
    v18[1] = v19;
    char v25 = 4;
    sub_1C9DE831C();
    sub_1C9E0D790();
    *(void *)&v6[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_proximity] = v26;

    uint64_t v20 = (objc_class *)type metadata accessor for SVDDeviceUnit();
    v24.receiver = v6;
    v24.super_class = v20;
    unint64_t v5 = (unint64_t)objc_msgSendSuper2(&v24, sel_init);
    uint64_t v21 = OUTLINED_FUNCTION_4_1();
    v22(v21);
    __swift_destroy_boxed_opaque_existential_0(v23);
  }
  return v5;
}

unint64_t sub_1C9DE80E8@<X0>(void *a1@<X0>, unint64_t *a2@<X8>)
{
  unint64_t result = SVDDeviceUnit.__allocating_init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_1C9DE8114(void *a1)
{
  return sub_1C9DE7BBC(a1);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1C9DE817C()
{
  unint64_t result = qword_1EA5C6EA8;
  if (!qword_1EA5C6EA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C6EA8);
  }
  return result;
}

unint64_t sub_1C9DE81C8()
{
  unint64_t result = qword_1EA5C6EB0;
  if (!qword_1EA5C6EB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C6EB0);
  }
  return result;
}

unint64_t sub_1C9DE8214()
{
  unint64_t result = qword_1EA5C6EC0;
  if (!qword_1EA5C6EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C6EC0);
  }
  return result;
}

uint64_t type metadata accessor for SVDDeviceUnit()
{
  return self;
}

unint64_t sub_1C9DE8284()
{
  unint64_t result = qword_1EA5C6EF8;
  if (!qword_1EA5C6EF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C6EF8);
  }
  return result;
}

unint64_t sub_1C9DE82D0()
{
  unint64_t result = qword_1EA5C6F00;
  if (!qword_1EA5C6F00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C6F00);
  }
  return result;
}

unint64_t sub_1C9DE831C()
{
  unint64_t result = qword_1EA5C6F10;
  if (!qword_1EA5C6F10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C6F10);
  }
  return result;
}

uint64_t method lookup function for DeviceUnit(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for DeviceUnit);
}

uint64_t dispatch thunk of DeviceUnit.__allocating_init(identifier:assistantId:builder:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of DeviceUnit.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of DeviceUnit.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of DeviceUnit.encode(to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of DeviceUnit.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t method lookup function for SVDDeviceUnit(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SVDDeviceUnit);
}

uint64_t dispatch thunk of SVDDeviceUnit.__allocating_init(identifier:assistantId:name:roomName:proximity:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of SVDDeviceUnit.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of SVDDeviceUnit.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of SVDDeviceUnit.description()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of SVDDeviceUnit.encode(to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of SVDDeviceUnit.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t getEnumTagSinglePayload for SVDDeviceUnit.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SVDDeviceUnit.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C9DE86C0);
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

ValueMetadata *type metadata accessor for SVDDeviceUnit.CodingKeys()
{
  return &type metadata for SVDDeviceUnit.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for DeviceUnit.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *unint64_t result = a2 + 7;
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
        JUMPOUT(0x1C9DE87C4);
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
          *unint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceUnit.CodingKeys()
{
  return &type metadata for DeviceUnit.CodingKeys;
}

unint64_t sub_1C9DE8800()
{
  unint64_t result = qword_1EA5C6F20;
  if (!qword_1EA5C6F20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C6F20);
  }
  return result;
}

unint64_t sub_1C9DE8850()
{
  unint64_t result = qword_1EA5C6F28;
  if (!qword_1EA5C6F28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C6F28);
  }
  return result;
}

unint64_t sub_1C9DE88A0()
{
  unint64_t result = qword_1EA5C6F30;
  if (!qword_1EA5C6F30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C6F30);
  }
  return result;
}

unint64_t sub_1C9DE88F0()
{
  unint64_t result = qword_1EA5C6F38;
  if (!qword_1EA5C6F38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C6F38);
  }
  return result;
}

unint64_t sub_1C9DE8940()
{
  unint64_t result = qword_1EA5C6F40;
  if (!qword_1EA5C6F40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C6F40);
  }
  return result;
}

unint64_t sub_1C9DE8990()
{
  unint64_t result = qword_1EA5C6F48;
  if (!qword_1EA5C6F48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C6F48);
  }
  return result;
}

uint64_t sub_1C9DE89DC()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1C9DE8A14()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_1C9DE8A28(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (v2)
  {
    int v3 = v2;
    sub_1C9E0D120();
  }
  return OUTLINED_FUNCTION_26();
}

id OUTLINED_FUNCTION_1_5(uint64_t a1)
{
  return objc_msgSend(v1, (SEL)(v3 + 2501), v2, a1);
}

id OUTLINED_FUNCTION_2_2()
{
  return objc_msgSend(v0, (SEL)(v3 + 2501), v1, v2);
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return sub_1C9E0D110();
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_8_1@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 72) = a1;
  return sub_1C9E0D7A0();
}

uint64_t OUTLINED_FUNCTION_9_0@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 72) = a1;
  uint64_t v3 = *(void *)(v1 - 120);
  return MEMORY[0x1F41854F8](v1 - 72, v3);
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return swift_dynamicCast();
}

__n128 OUTLINED_FUNCTION_12_0(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __n128 a17)
{
  __n128 result = a17;
  a1[1] = a17;
  a1[2].n128_u64[0] = v17;
  return result;
}

uint64_t OUTLINED_FUNCTION_13_0@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return sub_1C9E0D180();
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return sub_1C9E0D180();
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return sub_1C9E0D180();
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return sub_1C9E0D180();
}

__n128 OUTLINED_FUNCTION_18_0(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __n128 a11)
{
  __n128 result = a11;
  a1[1] = a11;
  a1[2].n128_u64[0] = v11;
  return result;
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return sub_1C9E0D110();
}

uint64_t OUTLINED_FUNCTION_20_0()
{
  return sub_1C9E0D3E0();
}

uint64_t OUTLINED_FUNCTION_21_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4185690](a1, a2, a3, v3);
}

uint64_t OUTLINED_FUNCTION_22_0@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(v1 + a1 + 8);
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  return sub_1C9E0D180();
}

uint64_t OUTLINED_FUNCTION_24()
{
  return sub_1C9E0D3E0();
}

uint64_t OUTLINED_FUNCTION_25()
{
  return sub_1C9E0D110();
}

uint64_t OUTLINED_FUNCTION_26()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_27()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_29()
{
  return sub_1C9E0D180();
}

uint64_t OUTLINED_FUNCTION_30()
{
  return sub_1C9E0D110();
}

uint64_t OUTLINED_FUNCTION_31()
{
  return sub_1C9E0D3E0();
}

uint64_t OUTLINED_FUNCTION_32()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_33@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v2 - 72) = a1;
  return MEMORY[0x1F41854F8](v2 - 72, v1);
}

uint64_t OUTLINED_FUNCTION_34()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_35()
{
  return swift_dynamicCast();
}

void OUTLINED_FUNCTION_36(uint64_t a1@<X8>)
{
  uint64_t v2 = (void *)(v1 + a1);
  *uint64_t v2 = 0;
  v2[1] = 0;
}

uint64_t OUTLINED_FUNCTION_37@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4185FF0](a1, a1, a3, v3, v4);
}

uint64_t OUTLINED_FUNCTION_40@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = (void *)(v3 + a3);
  void *v4 = result;
  v4[1] = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_41@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(v1 + a1 + 8);
}

uint64_t OUTLINED_FUNCTION_42()
{
  return sub_1C9E0D110();
}

uint64_t OUTLINED_FUNCTION_43()
{
  return sub_1C9E0D110();
}

uint64_t OUTLINED_FUNCTION_44()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_45()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_46()
{
  return swift_beginAccess();
}

uint64_t static ObjCCompatibility.capabilities(from:)(unint64_t a1)
{
  uint64_t v2 = sub_1C9E0D010();
  uint64_t v3 = *(NSObject **)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62)
  {
LABEL_33:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_1C9E0D700();
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v6)
    {
LABEL_3:
      uint64_t v43 = sel__swiftBacking;
      unint64_t v44 = a1 & 0xC000000000000001;
      char v41 = (void (**)(char *, uint64_t, uint64_t))&v3[2];
      uint64_t v8 = MEMORY[0x1E4FBC868];
      uint64_t v40 = (void (**)(char *, uint64_t))&v3[1];
      uint64_t v9 = 4;
      uint64_t v39 = MEMORY[0x1E4FBC840] + 8;
      *(void *)&long long v7 = 138412290;
      long long v36 = v7;
      uint64_t v37 = v6;
      unint64_t v38 = v5;
      uint64_t v34 = v2;
      unint64_t v35 = a1;
      while (1)
      {
        if (v44) {
          id v10 = (id)MEMORY[0x1CB78F680](v9 - 4, a1);
        }
        else {
          id v10 = *(id *)(a1 + 8 * v9);
        }
        uint64_t v11 = v9 - 3;
        if (__OFADD__(v9 - 4, 1))
        {
          __break(1u);
LABEL_31:
          __break(1u);
LABEL_32:
          __break(1u);
          goto LABEL_33;
        }
        id v12 = v10;
        if (objc_msgSend(v12, sel_respondsToSelector_, v43))
        {
          id v13 = objc_msgSend(v12, sel__swiftBacking);
          sub_1C9E0D470();
          swift_unknownObjectRelease();
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6B50);
          if (swift_dynamicCast())
          {
            long long v42 = v45;
            uint64_t v2 = v45;
            uint64_t ObjectType = swift_getObjectType();
            uint64_t v3 = v2;
            v15._countAndFlagsBits = (*(uint64_t (**)(uint64_t))(*((void *)&v42 + 1) + 32))(ObjectType);
            CapabilityKey.init(rawValue:)(v15);
            a1 = v46;
            if (v46 == 12)
            {
              swift_unknownObjectRelease();

              uint64_t v2 = v34;
              a1 = v35;
            }
            else
            {
              swift_unknownObjectRetain();
              swift_isUniquelyReferenced_nonNull_native();
              id v46 = v8;
              uint64_t v3 = v8;
              unint64_t v23 = sub_1C9DD99C0(a1);
              if (__OFADD__(v8[2].isa, (v24 & 1) == 0)) {
                goto LABEL_31;
              }
              unint64_t v25 = v23;
              uint64_t v5 = v24;
              __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6F50);
              uint64_t v3 = &v46;
              if (sub_1C9E0D610())
              {
                uint64_t v3 = v46;
                unint64_t v26 = sub_1C9DD99C0(a1);
                if ((v5 & 1) != (v27 & 1))
                {
                  uint64_t result = sub_1C9E0D830();
                  __break(1u);
                  return result;
                }
                unint64_t v25 = v26;
              }
              uint64_t v8 = v46;
              if (v5)
              {
                Class isa = v46[7].isa;
                swift_unknownObjectRelease();
                *((_OWORD *)isa + v25) = v42;
              }
              else
              {
                v46[(v25 >> 6) + 8].Class isa = (Class)((uint64_t)v46[(v25 >> 6) + 8].isa | (1 << v25));
                *((unsigned char *)v8[6].isa + v25) = a1;
                *((_OWORD *)v8[7].isa + v25) = v42;
                Class v29 = v8[2].isa;
                BOOL v30 = __OFADD__(v29, 1);
                uint64_t v31 = (Class)((char *)v29 + 1);
                if (v30) {
                  goto LABEL_32;
                }
                v8[2].Class isa = v31;
              }
              swift_unknownObjectRelease();

              swift_bridgeObjectRelease();
              uint64_t v2 = v34;
              a1 = v35;
              uint64_t v6 = v37;
              uint64_t v5 = v38;
            }
          }
          else
          {
          }
        }
        else
        {

          if (qword_1EA5C6A70 != -1) {
            swift_once();
          }
          uint64_t v16 = __swift_project_value_buffer(v2, (uint64_t)qword_1EA5C98A0);
          (*v41)(v5, v16, v2);
          unint64_t v17 = v12;
          uint64_t v3 = sub_1C9E0D000();
          os_log_type_t v18 = sub_1C9E0D320();
          if (os_log_type_enabled(v3, v18))
          {
            uint64_t v19 = swift_slowAlloc();
            uint64_t v20 = (void *)swift_slowAlloc();
            *(_DWORD *)uint64_t v19 = v36;
            *(void *)(v19 + 4) = v17;
            void *v20 = v17;
            _os_log_impl(&dword_1C9DD3000, v3, v18, "#hal Unable to convert svdCapability into capability: %@", (uint8_t *)v19, 0xCu);
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6DE8);
            swift_arrayDestroy();
            uint64_t v21 = v20;
            uint64_t v6 = v37;
            MEMORY[0x1CB7900C0](v21, -1, -1);
            uint64_t v22 = v19;
            uint64_t v5 = v38;
            MEMORY[0x1CB7900C0](v22, -1, -1);
          }
          else
          {

            uint64_t v3 = v17;
          }

          (*v40)(v5, v2);
        }
        ++v9;
        if (v11 == v6)
        {
          swift_bridgeObjectRelease();
          goto LABEL_35;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v8 = MEMORY[0x1E4FBC868];
LABEL_35:
  uint64_t v32 = sub_1C9DD6384((uint64_t)v8);
  swift_bridgeObjectRelease();
  type metadata accessor for Capabilities();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v32;
  return result;
}

ValueMetadata *type metadata accessor for ObjCCompatibility()
{
  return &type metadata for ObjCCompatibility;
}

uint64_t SVDProximity.init(rawValue:)(uint64_t result)
{
  if (result == 4000) {
    uint64_t v1 = 4000;
  }
  else {
    uint64_t v1 = 0;
  }
  if (result == 3000) {
    uint64_t v1 = 3000;
  }
  if (result == 2000) {
    uint64_t v1 = 2000;
  }
  if (result == 1000) {
    uint64_t v1 = 1000;
  }
  if (result) {
    return v1;
  }
  return result;
}

uint64_t Proximity.description.getter(uint64_t a1)
{
  return sub_1C9DE965C(a1);
}

void *static Proximity.allCases.getter()
{
  return &unk_1F241BA90;
}

void sub_1C9DE9588(void *a1@<X8>)
{
  *a1 = &unk_1F241BA90;
}

uint64_t sub_1C9DE9598()
{
  return sub_1C9E0D1E0();
}

uint64_t sub_1C9DE95F8()
{
  return sub_1C9E0D1D0();
}

uint64_t sub_1C9DE9648()
{
  return Proximity.description.getter(*v0);
}

uint64_t SVDProximity.description.getter(uint64_t a1)
{
  return sub_1C9DE965C(a1);
}

uint64_t sub_1C9DE965C(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      return 0x6E776F6E6B6E75;
    case 4000:
      return 0x7972616D697270;
    case 2000:
      return 1918985582;
    case 3000:
      return 0x74616964656D6D69;
    case 1000:
      return 7496038;
  }
  uint64_t result = sub_1C9E0D810();
  __break(1u);
  return result;
}

BOOL SVDProximity.isCloserOrSameAs(_:)(uint64_t a1, uint64_t a2)
{
  return a2 >= a1;
}

void *static SVDProximity.allCases.getter()
{
  return &unk_1F241BAD8;
}

unint64_t sub_1C9DE9738()
{
  unint64_t result = qword_1EA5C6F58;
  if (!qword_1EA5C6F58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C6F58);
  }
  return result;
}

uint64_t sub_1C9DE9784()
{
  return sub_1C9DE9858(&qword_1EA5C6F60, &qword_1EA5C6F68);
}

unint64_t sub_1C9DE97B0()
{
  unint64_t result = qword_1EA5C6F70;
  if (!qword_1EA5C6F70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C6F70);
  }
  return result;
}

uint64_t sub_1C9DE97FC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = SVDProximity.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_1C9DE9830()
{
  return sub_1C9DE9858(&qword_1EA5C6F78, &qword_1EA5C6F80);
}

uint64_t sub_1C9DE9858(unint64_t *a1, uint64_t *a2)
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

void sub_1C9DE98A8(void *a1@<X8>)
{
  *a1 = &unk_1F241BAD8;
}

uint64_t sub_1C9DE98B8()
{
  return sub_1C9E0D1E0();
}

uint64_t sub_1C9DE9918()
{
  return sub_1C9E0D1D0();
}

uint64_t sub_1C9DE9968()
{
  return SVDProximity.description.getter(*v0);
}

ValueMetadata *type metadata accessor for Proximity()
{
  return &type metadata for Proximity;
}

ValueMetadata *type metadata accessor for SVDProximity()
{
  return &type metadata for SVDProximity;
}

unint64_t sub_1C9DE9990()
{
  unint64_t result = qword_1EA5C6F88;
  if (!qword_1EA5C6F88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C6F88);
  }
  return result;
}

unint64_t sub_1C9DE99DC()
{
  unint64_t result = qword_1EA5C6F90;
  if (!qword_1EA5C6F90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C6F90);
  }
  return result;
}

uint64_t sub_1C9DE9A38(unint64_t a1, char *a2)
{
  if (a1 >> 62) {
    goto LABEL_30;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_1C9E0D700())
  {
    uint64_t v17 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution35AlarmTimerIntentsHandlingCapability_primitivesMap;
    uint64_t v4 = 4;
    while (1)
    {
      uint64_t v5 = (a1 & 0xC000000000000001) != 0
         ? (char *)MEMORY[0x1CB78F680](v4 - 4, a1)
         : (char *)*(id *)(a1 + 8 * v4);
      uint64_t v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      uint64_t v8 = *(void *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key];
      unint64_t v9 = *(void *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key + 8];
      swift_bridgeObjectRetain();
      if ((sub_1C9E0D1A0() & 1) == 0)
      {

        swift_bridgeObjectRelease();
LABEL_27:
        swift_bridgeObjectRelease();
        return 0;
      }
      swift_bridgeObjectRetain();
      if ((sub_1C9E0D1A0() & 1) == 0)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
LABEL_20:
        swift_bridgeObjectRelease();
        Swift::String v15 = a2;
        goto LABEL_24;
      }
      unint64_t v10 = sub_1C9E0D160();
      unint64_t v11 = sub_1C9E09684(v10, v8, v9);
      MEMORY[0x1CB78F240](v11);
      swift_bridgeObjectRelease();
      uint64_t v12 = sub_1C9E0D750();
      swift_bridgeObjectRelease();
      if (v12)
      {
        swift_bridgeObjectRelease();

        goto LABEL_20;
      }
      if (!*(void *)(*(void *)&a2[v17] + 16)) {
        goto LABEL_23;
      }
      swift_bridgeObjectRetain();
      sub_1C9DD5CF8(v8, v9);
      if ((v13 & 1) == 0)
      {
        swift_bridgeObjectRelease();
LABEL_23:
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        Swift::String v15 = v6;
LABEL_24:

        return 0;
      }
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      type metadata accessor for BooleanCapabilityPrimitive();
      if (!swift_dynamicCastClass())
      {

        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        return 0;
      }
      swift_unknownObjectRetain();
      char v14 = sub_1C9DE3C80((uint64_t)v6);

      swift_unknownObjectRelease_n();
      if ((v14 & 1) == 0)
      {

        goto LABEL_27;
      }
      ++v4;
      if (v7 == v3) {
        goto LABEL_31;
      }
    }
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
  }
LABEL_31:

  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_1C9DE9D88(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution35AlarmTimerIntentsHandlingCapability_primitivesMap) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9DE9DEC()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution35AlarmTimerIntentsHandlingCapability_key);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1C9DE9EB4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution35AlarmTimerIntentsHandlingCapability_key);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9DE9F14(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_1C9DE9EB4(v1, v2);
}

uint64_t (*sub_1C9DE9F54())()
{
  return j__swift_endAccess;
}

id AlarmTimerIntentsHandlingCapability.__allocating_init(status:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return AlarmTimerIntentsHandlingCapability.init(status:)(a1);
}

uint64_t sub_1C9DEA018()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution35AlarmTimerIntentsHandlingCapability_primitivesMap);
  swift_bridgeObjectRetain();
  unint64_t v2 = OUTLINED_FUNCTION_1_6();
  uint64_t v4 = sub_1C9DD6B68(v2, v3, v1);
  swift_bridgeObjectRelease();
  if (!v4) {
    return 0;
  }
  type metadata accessor for BooleanCapabilityPrimitive();
  uint64_t v5 = swift_dynamicCastClass();
  if (v5) {
    uint64_t v6 = *(void *)(v5 + OBJC_IVAR___SVDBooleanCapabilityPrimitive_supportStatus);
  }
  else {
    uint64_t v6 = 0;
  }
  swift_unknownObjectRelease();
  return v6;
}

id sub_1C9DEA0B0(uint64_t a1)
{
  type metadata accessor for BooleanCapabilityPrimitive();
  unint64_t v2 = OUTLINED_FUNCTION_1_6();
  return sub_1C9DE3B5C(v2, v3, a1);
}

uint64_t sub_1C9DEA11C(unint64_t a1)
{
  return sub_1C9DE9A38(a1, (char *)v1) & 1;
}

uint64_t static AlarmTimerIntentsHandlingCapability.supportsSecureCoding.getter()
{
  return 1;
}

char *AlarmTimerIntentsHandlingCapability.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return AlarmTimerIntentsHandlingCapability.init(coder:)(a1);
}

char *AlarmTimerIntentsHandlingCapability.init(coder:)(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution35AlarmTimerIntentsHandlingCapability_primitivesMap;
  uint64_t v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC80980);
  *(void *)&v1[v3] = sub_1C9E0D0D0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution35AlarmTimerIntentsHandlingCapability_key]);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for AlarmTimerIntentsHandlingCapability();
  uint64_t v5 = (char *)objc_msgSendSuper2(&v7, sel_init);
  sub_1C9DD76F8((uint64_t)a1);

  if (!*(void *)(*(void *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution35AlarmTimerIntentsHandlingCapability_primitivesMap]
                  + 16))
  {

    return 0;
  }
  return v5;
}

id AlarmTimerIntentsHandlingCapability.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void AlarmTimerIntentsHandlingCapability.init()()
{
}

id AlarmTimerIntentsHandlingCapability.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AlarmTimerIntentsHandlingCapability();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C9DEA420@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1C9DE9DEC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t method lookup function for AlarmTimerIntentsHandlingCapability(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AlarmTimerIntentsHandlingCapability);
}

uint64_t dispatch thunk of AlarmTimerIntentsHandlingCapability.key.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of AlarmTimerIntentsHandlingCapability.key.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of AlarmTimerIntentsHandlingCapability.key.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of AlarmTimerIntentsHandlingCapability.__allocating_init(status:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of AlarmTimerIntentsHandlingCapability.supportsAlarmTimerIntentsHandling.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of static AlarmTimerIntentsHandlingCapability.capabilityDescriptionMatchingSupportStatus(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of AlarmTimerIntentsHandlingCapability.matches(descriptions:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of AlarmTimerIntentsHandlingCapability.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of AlarmTimerIntentsHandlingCapability.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

unint64_t OUTLINED_FUNCTION_1_6()
{
  return 0xD000000000000032;
}

void sub_1C9DEA5F0(HMHomeManager a1)
{
}

Swift::Void __swiftcall DeviceResolutionProviding.setHomeKitDataSource(_:)(HMHomeManager a1)
{
  OUTLINED_FUNCTION_0_3((uint64_t)"Fatal error", v1, v2, v3, 0x80000001C9E11D10, (uint64_t)"SiriVirtualDeviceResolution/DeviceResolutionProviding.swift");
  __break(1u);
}

void sub_1C9DEA644(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void DeviceResolutionProviding.devices(matchingAny:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_1C9DEA698()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1C9DEA724;
  return DeviceResolutionProviding.pairedCompanionDevice()();
}

uint64_t sub_1C9DEA724()
{
  OUTLINED_FUNCTION_2_3();
  uint64_t v6 = *v2;
  uint64_t v3 = swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v6 + 8);
  if (!v1) {
    uint64_t v3 = v0;
  }
  return v4(v3);
}

uint64_t DeviceResolutionProviding.pairedCompanionDevice()()
{
  return OUTLINED_FUNCTION_1_7((uint64_t)sub_1C9DEA810);
}

uint64_t sub_1C9DEA810()
{
  OUTLINED_FUNCTION_4_2();
  return OUTLINED_FUNCTION_0_3((uint64_t)"Fatal error", v0, v1, v2, 0x80000001C9E11D10, (uint64_t)"SiriVirtualDeviceResolution/DeviceResolutionProviding.swift");
}

uint64_t sub_1C9DEA874()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1C9DEB79C;
  return DeviceResolutionProviding.meDevice()();
}

uint64_t DeviceResolutionProviding.meDevice()()
{
  return OUTLINED_FUNCTION_1_7((uint64_t)sub_1C9DEA914);
}

uint64_t sub_1C9DEA914()
{
  OUTLINED_FUNCTION_4_2();
  return OUTLINED_FUNCTION_0_3((uint64_t)"Fatal error", v0, v1, v2, 0x80000001C9E11D10, (uint64_t)"SiriVirtualDeviceResolution/DeviceResolutionProviding.swift");
}

uint64_t sub_1C9DEA978()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1C9DEB79C;
  return DeviceResolutionProviding.devicesMatching(capabilityDescriptions:)();
}

uint64_t DeviceResolutionProviding.devicesMatching(capabilityDescriptions:)()
{
  return OUTLINED_FUNCTION_1_7((uint64_t)sub_1C9DEAA18);
}

uint64_t sub_1C9DEAA18()
{
  OUTLINED_FUNCTION_4_2();
  return OUTLINED_FUNCTION_0_3((uint64_t)"Fatal error", v0, v1, v2, 0x80000001C9E11D10, (uint64_t)"SiriVirtualDeviceResolution/DeviceResolutionProviding.swift");
}

uint64_t sub_1C9DEAA7C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1C9DEB79C;
  return DeviceResolutionProviding.devices(matchingAny:)();
}

uint64_t DeviceResolutionProviding.devices(matchingAny:)()
{
  return OUTLINED_FUNCTION_1_7((uint64_t)sub_1C9DEAB1C);
}

uint64_t sub_1C9DEAB1C()
{
  OUTLINED_FUNCTION_4_2();
  return OUTLINED_FUNCTION_0_3((uint64_t)"Fatal error", v0, v1, v2, 0x80000001C9E11D10, (uint64_t)"SiriVirtualDeviceResolution/DeviceResolutionProviding.swift");
}

uint64_t sub_1C9DEAB80()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1C9DEB79C;
  return MEMORY[0x1F4188298](sub_1C9DEAC38, 0, 0);
}

uint64_t DeviceResolutionProviding.devicesWithProximity(closerBound:fartherBound:)()
{
  return OUTLINED_FUNCTION_1_7((uint64_t)sub_1C9DEAC38);
}

uint64_t sub_1C9DEAC38()
{
  OUTLINED_FUNCTION_4_2();
  return OUTLINED_FUNCTION_0_3((uint64_t)"Fatal error", v0, v1, v2, 0x80000001C9E11D10, (uint64_t)"SiriVirtualDeviceResolution/DeviceResolutionProviding.swift");
}

uint64_t sub_1C9DEAC9C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1C9DEB79C;
  return DeviceResolutionProviding.sourceDevices(for:)();
}

uint64_t DeviceResolutionProviding.sourceDevices(for:)()
{
  return OUTLINED_FUNCTION_1_7((uint64_t)sub_1C9DEAD3C);
}

uint64_t sub_1C9DEAD3C()
{
  OUTLINED_FUNCTION_4_2();
  return OUTLINED_FUNCTION_0_3((uint64_t)"Fatal error", v0, v1, v2, 0x80000001C9E11D10, (uint64_t)"SiriVirtualDeviceResolution/DeviceResolutionProviding.swift");
}

void sub_1C9DEADA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void DeviceResolutionProviding.devicesWithProximity(closerBound:fartherBound:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_1C9DEADF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void DeviceResolutionProviding.sourceDevices(for:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_1C9DEAE48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void DeviceResolutionProviding.devicesMatching(capabilityDescriptions:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_1C9DEAE9C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1C9DEB79C;
  return MEMORY[0x1F4188298](sub_1C9DEAF54, 0, 0);
}

uint64_t DeviceResolutionProviding.homeAutomationAccessories(matchingAny:checkForReachability:)()
{
  return OUTLINED_FUNCTION_1_7((uint64_t)sub_1C9DEAF54);
}

uint64_t sub_1C9DEAF54()
{
  OUTLINED_FUNCTION_4_2();
  return OUTLINED_FUNCTION_0_3((uint64_t)"Fatal error", v0, v1, v2, 0x80000001C9E11D10, (uint64_t)"SiriVirtualDeviceResolution/DeviceResolutionProviding.swift");
}

void DeviceResolutionProviding.setEndpointUUID(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t dispatch thunk of DeviceResolutionProviding.setHomeKitDataSource(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of DeviceResolutionProviding.devices(matchingAny:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of DeviceResolutionProviding.pairedCompanionDevice()()
{
  OUTLINED_FUNCTION_7_2();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_6_2(v0);
  void *v1 = v2;
  v1[1] = sub_1C9DEB100;
  uint64_t v3 = OUTLINED_FUNCTION_8_2();
  return v4(v3);
}

uint64_t sub_1C9DEB100()
{
  OUTLINED_FUNCTION_2_3();
  uint64_t v4 = *v1;
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v4 + 8);
  return v2(v0);
}

uint64_t dispatch thunk of DeviceResolutionProviding.meDevice()()
{
  OUTLINED_FUNCTION_7_2();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_6_2(v0);
  void *v1 = v2;
  v1[1] = sub_1C9DEB7A0;
  uint64_t v3 = OUTLINED_FUNCTION_8_2();
  return v4(v3);
}

uint64_t dispatch thunk of DeviceResolutionProviding.devicesMatching(capabilityDescriptions:)()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5_2();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_6_2(v0);
  void *v1 = v2;
  v1[1] = sub_1C9DEB7A0;
  uint64_t v3 = OUTLINED_FUNCTION_3_3();
  return v4(v3);
}

uint64_t dispatch thunk of DeviceResolutionProviding.devices(matchingAny:)()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5_2();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_6_2(v0);
  void *v1 = v2;
  v1[1] = sub_1C9DEB7A0;
  uint64_t v3 = OUTLINED_FUNCTION_3_3();
  return v4(v3);
}

uint64_t dispatch thunk of DeviceResolutionProviding.devicesWithProximity(closerBound:fartherBound:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 56) + **(int **)(a4 + 56));
  uint64_t v8 = swift_task_alloc();
  unint64_t v9 = (void *)OUTLINED_FUNCTION_6_2(v8);
  *unint64_t v9 = v10;
  v9[1] = sub_1C9DEB7A0;
  return v12(a1, a2, a3, a4);
}

uint64_t dispatch thunk of DeviceResolutionProviding.sourceDevices(for:)()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5_2();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_6_2(v0);
  void *v1 = v2;
  v1[1] = sub_1C9DEB7A0;
  uint64_t v3 = OUTLINED_FUNCTION_3_3();
  return v4(v3);
}

uint64_t dispatch thunk of DeviceResolutionProviding.devicesWithProximity(closerBound:fartherBound:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 72))();
}

uint64_t dispatch thunk of DeviceResolutionProviding.sourceDevices(for:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 80))();
}

uint64_t dispatch thunk of DeviceResolutionProviding.devicesMatching(capabilityDescriptions:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 88))();
}

uint64_t dispatch thunk of DeviceResolutionProviding.homeAutomationAccessories(matchingAny:checkForReachability:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 96) + **(int **)(a4 + 96));
  uint64_t v8 = swift_task_alloc();
  unint64_t v9 = (void *)OUTLINED_FUNCTION_6_2(v8);
  *unint64_t v9 = v10;
  v9[1] = sub_1C9DEB7A0;
  return v12(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_0_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MEMORY[0x1F41852A0](a1, 11, 2, 0xD00000000000002DLL, a5, a6, 59, 2);
}

uint64_t OUTLINED_FUNCTION_1_7(uint64_t a1)
{
  return MEMORY[0x1F4188298](a1, 0, 0);
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_2(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  return v0;
}

id CapabilityDescription.__allocating_init(key:valueSet:)()
{
  id v0 = objc_allocWithZone((Class)OUTLINED_FUNCTION_7_3());
  return CapabilityDescription.init(key:valueSet:)();
}

id CapabilityDescription.__allocating_init(key:valueRange:)()
{
  OUTLINED_FUNCTION_4_3();
  double v0 = OUTLINED_FUNCTION_1_8();
  return CapabilityDescription.init(key:valueRange:)(v1, v2, v0, v3);
}

uint64_t CapabilityDescription.key.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CapabilityDescription.valueSet.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t CapabilityDescription.valueRange.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueRange);
}

uint64_t CapabilityDescription.capabilityKey.getter()
{
  sub_1C9DEBDE0();
  uint64_t v0 = sub_1C9E0D450();
  if (*(void *)(v0 + 16))
  {
    uint64_t v1 = *(void *)(v0 + 32);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v1 = 0;
  }
  swift_bridgeObjectRelease();
  return v1;
}

id CapabilityDescription.valueRangeLowerBound.getter()
{
  OUTLINED_FUNCTION_2_4();
  if (v1) {
    return 0;
  }
  else {
    return objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, *v0);
  }
}

id CapabilityDescription.valueRangeUpperBound.getter()
{
  OUTLINED_FUNCTION_2_4();
  if (v1) {
    return 0;
  }
  else {
    return objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, *(double *)(v0 + 8));
  }
}

id CapabilityDescription.init(key:valueSet:)()
{
  OUTLINED_FUNCTION_7_3();
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = &v1[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key];
  *(void *)uint64_t v5 = v3;
  *((void *)v5 + 1) = v2;
  *(void *)&v1[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueSet] = v0;
  uint64_t v6 = &v1[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueRange];
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  v6[16] = 1;
  v8.receiver = v1;
  v8.super_class = ObjectType;
  return objc_msgSendSuper2(&v8, sel_init);
}

id CapabilityDescription.init(key:valueRange:)(uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v10 = &v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key];
  *(void *)uint64_t v10 = a1;
  *((void *)v10 + 1) = a2;
  unint64_t v11 = (double *)&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueRange];
  double *v11 = a3;
  v11[1] = a4;
  *((unsigned char *)v11 + 16) = 0;
  *(void *)&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueSet] = 0;
  v13.receiver = v4;
  v13.super_class = ObjectType;
  return objc_msgSendSuper2(&v13, sel_init);
}

unint64_t sub_1C9DEBDE0()
{
  unint64_t result = qword_1EA5C7080;
  if (!qword_1EA5C7080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C7080);
  }
  return result;
}

id CapabilityDescription.__allocating_init(key:lowerbound:upperbound:)()
{
  OUTLINED_FUNCTION_4_3();
  double v0 = OUTLINED_FUNCTION_1_8();
  return CapabilityDescription.init(key:lowerbound:upperbound:)(v1, v2, v0, v3);
}

id CapabilityDescription.init(key:lowerbound:upperbound:)(id result, uint64_t a2, double a3, double a4)
{
  if (a3 > a4)
  {
    __break(1u);
  }
  else
  {
    uint64_t v7 = (uint64_t)result;
    id v8 = objc_allocWithZone((Class)swift_getObjectType());
    id v9 = CapabilityDescription.init(key:valueRange:)(v7, a2, a3, a4);
    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return v9;
  }
  return result;
}

uint64_t static CapabilityDescription.supportsSecureCoding.getter()
{
  return byte_1EA5C7060;
}

uint64_t static CapabilityDescription.supportsSecureCoding.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  byte_1EA5C7060 = a1;
  return result;
}

uint64_t (*static CapabilityDescription.supportsSecureCoding.modify())()
{
  return j__swift_endAccess;
}

Swift::Void __swiftcall CapabilityDescription.encode(with:)(NSCoder with)
{
  double v3 = (void *)sub_1C9E0D110();
  uint64_t v4 = (void *)sub_1C9E0D110();
  OUTLINED_FUNCTION_2_2();

  uint64_t v5 = *(void **)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueSet);
  if (v5)
  {
    sub_1C9DD7D6C(0, (unint64_t *)&qword_1EA5C6E30);
    sub_1C9DEC214();
    uint64_t v5 = (void *)sub_1C9E0D2B0();
  }
  uint64_t v6 = (void *)sub_1C9E0D110();
  OUTLINED_FUNCTION_2_2();

  OUTLINED_FUNCTION_2_4();
  if ((v8 & 1) == 0)
  {
    double v9 = v7[1];
    id v10 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, *v7);
    unint64_t v11 = (void *)OUTLINED_FUNCTION_6_3();
    [(objc_class *)with.super.isa encodeObject:v10 forKey:v11];

    id v12 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v9);
    id v13 = (id)OUTLINED_FUNCTION_6_3();
    [(objc_class *)with.super.isa encodeObject:v12 forKey:v13];
  }
}

unint64_t sub_1C9DEC214()
{
  unint64_t result = qword_1EA5C7090;
  if (!qword_1EA5C7090)
  {
    sub_1C9DD7D6C(255, (unint64_t *)&qword_1EA5C6E30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C7090);
  }
  return result;
}

void CapabilityDescription.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  CapabilityDescription.init(coder:)(a1);
}

void CapabilityDescription.init(coder:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA5C6B10);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1C9E0F330;
  uint64_t v6 = sub_1C9DD7D6C(0, (unint64_t *)&qword_1EA5C6E90);
  *(void *)(v5 + 32) = v6;
  uint64_t v7 = v2;
  sub_1C9E0D3E0();
  swift_bridgeObjectRelease();
  if (!v29)
  {

    sub_1C9DD7D0C((uint64_t)v28);
LABEL_8:
    swift_deallocPartialClassInstance();
    return;
  }
  if ((OUTLINED_FUNCTION_8_3() & 1) == 0)
  {

    goto LABEL_8;
  }
  uint64_t v8 = v27;
  double v9 = &v7[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key];
  *(void *)double v9 = v26;
  *((void *)v9 + 1) = v8;
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1C9E103C0;
  *(void *)(v10 + 32) = v6;
  uint64_t v11 = sub_1C9DD7D6C(0, &qword_1EA5C70A0);
  *(void *)(v10 + 40) = v11;
  *(void *)(v10 + 48) = sub_1C9DD7D6C(0, &qword_1EA5C70A8);
  sub_1C9E0D3E0();
  swift_bridgeObjectRelease();
  if (v29)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA5C70B0);
    if (OUTLINED_FUNCTION_8_3())
    {
      id v12 = v26;
      goto LABEL_11;
    }
  }
  else
  {
    sub_1C9DD7D0C((uint64_t)v28);
  }
  id v12 = 0;
LABEL_11:
  *(void *)&v7[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueSet] = v12;
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_1C9E0F330;
  *(void *)(v13 + 32) = v11;
  OUTLINED_FUNCTION_0_4();
  swift_bridgeObjectRelease();
  if (v29)
  {
    if (!OUTLINED_FUNCTION_3_4())
    {
LABEL_25:
      objc_super v24 = &v7[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueRange];
      *(void *)objc_super v24 = 0;
      *((void *)v24 + 1) = 0;
      v24[16] = 1;
      goto LABEL_26;
    }
    id v14 = v26;
  }
  else
  {
    sub_1C9DD7D0C((uint64_t)v28);
    id v14 = 0;
  }
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_1C9E0F330;
  *(void *)(v15 + 32) = v11;
  OUTLINED_FUNCTION_0_4();
  swift_bridgeObjectRelease();
  if (!v29)
  {
    sub_1C9DD7D0C((uint64_t)v28);
    if (v14) {
      goto LABEL_22;
    }
    id v16 = 0;
    goto LABEL_24;
  }
  if ((OUTLINED_FUNCTION_3_4() & 1) == 0)
  {
LABEL_22:

    goto LABEL_25;
  }
  id v16 = v26;
  if (!v14)
  {
LABEL_24:

    goto LABEL_25;
  }
  if (!v26) {
    goto LABEL_22;
  }
  id v17 = v14;
  id v18 = v26;
  objc_msgSend(v17, sel_doubleValue);
  double v20 = v19;
  objc_msgSend(v18, sel_doubleValue);
  double v22 = v21;

  if (v20 <= v22)
  {
    unint64_t v23 = (double *)&v7[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueRange];
    *unint64_t v23 = v20;
    v23[1] = v22;
    *((unsigned char *)v23 + 16) = 0;
LABEL_26:

    v25.receiver = v7;
    v25.super_class = ObjectType;
    objc_msgSendSuper2(&v25, sel_init);

    return;
  }
  __break(1u);
}

id CapabilityDescription.copy(with:)@<X0>(void *a1@<X8>)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = ObjectType;
  if (*(void *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueSet))
  {
    objc_allocWithZone(ObjectType);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    OUTLINED_FUNCTION_2_4();
    if ((v6 & 1) == 0)
    {
      double v10 = *v5;
      double v9 = v5[1];
      uint64_t v11 = v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key;
      uint64_t v12 = *(void *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key);
      uint64_t v13 = *(void *)(v11 + 8);
      objc_allocWithZone(v4);
      swift_bridgeObjectRetain();
      id result = CapabilityDescription.init(key:valueRange:)(v12, v13, v10, v9);
      goto LABEL_7;
    }
    swift_bridgeObjectRetain();
    sub_1C9DEC7DC(MEMORY[0x1E4FBC860]);
    id v7 = objc_allocWithZone(v4);
  }
  id result = CapabilityDescription.init(key:valueSet:)();
LABEL_7:
  a1[3] = v4;
  *a1 = result;
  return result;
}

uint64_t sub_1C9DEC7DC(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_1C9E0D700();
    swift_bridgeObjectRelease();
  }
  sub_1C9DD7D6C(0, (unint64_t *)&qword_1EA5C6E30);
  sub_1C9DEC214();
  uint64_t result = sub_1C9E0D2E0();
  uint64_t v4 = result;
  uint64_t v9 = result;
  if (!v2)
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v5) {
      goto LABEL_5;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return v4;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_1C9E0D700();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v5) {
    goto LABEL_13;
  }
LABEL_5:
  if (v5 >= 1)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v7 = (id)MEMORY[0x1CB78F680](i, a1);
      }
      else {
        id v7 = *(id *)(a1 + 8 * i + 32);
      }
      sub_1C9E08020(&v8, v7);
    }
    swift_bridgeObjectRelease();
    return v9;
  }
  __break(1u);
  return result;
}

uint64_t CapabilityDescription.description.getter()
{
  if (*(void *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueSet))
  {
    sub_1C9DD7D6C(0, (unint64_t *)&qword_1EA5C6E30);
    sub_1C9DEC214();
    swift_bridgeObjectRetain();
    sub_1C9E0D2D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_2_4();
    if ((v1 & 1) == 0) {
      sub_1C9DECBF4();
    }
  }
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key);
  swift_bridgeObjectRetain();
  sub_1C9E0D180();
  sub_1C9E0D180();
  swift_bridgeObjectRelease();
  return v3;
}

id CapabilityDescription.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void CapabilityDescription.init()()
{
}

id CapabilityDescription.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C9DECBF4()
{
  return 0;
}

uint64_t type metadata accessor for CapabilityDescription()
{
  return self;
}

uint64_t method lookup function for CapabilityDescription(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CapabilityDescription);
}

uint64_t dispatch thunk of CapabilityDescription.__allocating_init(key:valueSet:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of CapabilityDescription.__allocating_init(key:valueRange:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of CapabilityDescription.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return sub_1C9E0D3E0();
}

double OUTLINED_FUNCTION_1_8()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_4()
{
  return swift_dynamicCast();
}

id OUTLINED_FUNCTION_4_3()
{
  return objc_allocWithZone(v0);
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  return sub_1C9E0D110();
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8_3()
{
  return swift_dynamicCast();
}

unint64_t CapabilityKey.rawValue.getter()
{
  unint64_t result = 0xD000000000000017;
  switch(*v0)
  {
    case 2:
      unint64_t result = 0xD000000000000013;
      break;
    case 3:
      unint64_t result = 0xD000000000000018;
      break;
    case 4:
      unint64_t result = 0xD000000000000011;
      break;
    case 5:
      unint64_t result = 0xD000000000000016;
      break;
    case 6:
      unint64_t result = 0xD000000000000023;
      break;
    case 7:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 8:
      unint64_t result = 0x626170614358554DLL;
      break;
    case 9:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 0xA:
      unint64_t result = 0xD000000000000019;
      break;
    case 0xB:
      unint64_t result = 0x6669636570736E55;
      break;
    default:
      return result;
  }
  return result;
}

SiriVirtualDeviceResolution::CapabilityKey_optional __swiftcall CapabilityKey.init(rawValue:)(Swift::String rawValue)
{
  objc_super v2 = v1;
  unint64_t v3 = sub_1C9E0D750();
  result.value = swift_bridgeObjectRelease();
  char v5 = 12;
  if (v3 < 0xC) {
    char v5 = v3;
  }
  *objc_super v2 = v5;
  return result;
}

uint64_t sub_1C9DECF88()
{
  return sub_1C9E0742C();
}

uint64_t sub_1C9DECF94()
{
  return sub_1C9DD8190();
}

uint64_t sub_1C9DECF9C()
{
  return sub_1C9DD8204();
}

uint64_t sub_1C9DECFA4()
{
  return sub_1C9DD8294();
}

SiriVirtualDeviceResolution::CapabilityKey_optional sub_1C9DECFAC(Swift::String *a1)
{
  return CapabilityKey.init(rawValue:)(*a1);
}

unint64_t sub_1C9DECFB8@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = CapabilityKey.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1C9DECFE0()
{
  return sub_1C9DED244(0, (void (*)(void))type metadata accessor for AudioPlaybackCapability, sub_1C9DDB594);
}

uint64_t sub_1C9DED010()
{
  return sub_1C9DED244(1u, (void (*)(void))type metadata accessor for VideoPlaybackCapability, sub_1C9E06E04);
}

uint64_t sub_1C9DED040()
{
  return sub_1C9DED244(2u, (void (*)(void))type metadata accessor for AppLaunchCapability, sub_1C9E05274);
}

uint64_t sub_1C9DED070()
{
  return sub_1C9DED244(3u, (void (*)(void))type metadata accessor for SeymourRoutingCapability, sub_1C9E09EF0);
}

uint64_t sub_1C9DED0A0()
{
  if (*(void *)(*(void *)(v0 + 16) + 16))
  {
    swift_bridgeObjectRetain();
    sub_1C9DD99C0(4u);
    if (v1)
    {
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      type metadata accessor for SpeakerCapability();
      uint64_t result = swift_dynamicCastClass();
      if (result) {
        return result;
      }
      swift_unknownObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  return 0;
}

uint64_t sub_1C9DED124()
{
  return sub_1C9DED244(5u, (void (*)(void))type metadata accessor for VoiceTriggerCapability, sub_1C9DD6AD0);
}

uint64_t sub_1C9DED154()
{
  return sub_1C9DED244(6u, (void (*)(void))type metadata accessor for AlarmTimerIntentsHandlingCapability, sub_1C9DEA018);
}

uint64_t sub_1C9DED184()
{
  return sub_1C9DED244(7u, (void (*)(void))type metadata accessor for ProfileSwitchingCapability, sub_1C9DDA7CC);
}

uint64_t sub_1C9DED1B4()
{
  return sub_1C9DED244(8u, (void (*)(void))type metadata accessor for MUXCapability, sub_1C9E044AC);
}

uint64_t sub_1C9DED1E4()
{
  return sub_1C9DED244(0xAu, (void (*)(void))type metadata accessor for CustomTimerIntentHandlingCapability, sub_1C9E0603C);
}

uint64_t sub_1C9DED214()
{
  return sub_1C9DED244(9u, (void (*)(void))type metadata accessor for AssistantEnabledCapability, sub_1C9E036D0);
}

uint64_t sub_1C9DED244(unsigned __int8 a1, void (*a2)(void), uint64_t (*a3)(void))
{
  if (*(void *)(*(void *)(v3 + 16) + 16))
  {
    swift_bridgeObjectRetain();
    sub_1C9DD99C0(a1);
    if (v7)
    {
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      a2(0);
      if (swift_dynamicCastClass())
      {
        uint64_t v8 = a3();
        swift_unknownObjectRelease();
        return v8;
      }
      swift_unknownObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  return 0;
}

uint64_t Capabilities.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t Capabilities.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t CapabilitiesBuilder.audioPlaybackSupportStatus.getter()
{
  return *(void *)v0;
}

uint64_t CapabilitiesBuilder.audioPlaybackSupportStatus.setter(uint64_t result, char a2)
{
  *(void *)uint64_t v2 = result;
  *(unsigned char *)(v2 + 8) = a2 & 1;
  return result;
}

uint64_t (*CapabilitiesBuilder.audioPlaybackSupportStatus.modify())()
{
  return nullsub_1;
}

uint64_t CapabilitiesBuilder.videoPlaybackSupportStatus.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t CapabilitiesBuilder.videoPlaybackSupportStatus.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 16) = result;
  *(unsigned char *)(v2 + 24) = a2 & 1;
  return result;
}

uint64_t (*CapabilitiesBuilder.videoPlaybackSupportStatus.modify())()
{
  return nullsub_1;
}

uint64_t CapabilitiesBuilder.appLaunchSupportStatus.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t CapabilitiesBuilder.appLaunchSupportStatus.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 32) = result;
  *(unsigned char *)(v2 + 40) = a2 & 1;
  return result;
}

uint64_t (*CapabilitiesBuilder.appLaunchSupportStatus.modify())()
{
  return nullsub_1;
}

uint64_t CapabilitiesBuilder.seymourRoutingSupportStatus.getter()
{
  return *(void *)(v0 + 48);
}

uint64_t CapabilitiesBuilder.seymourRoutingSupportStatus.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 48) = result;
  *(unsigned char *)(v2 + 56) = a2 & 1;
  return result;
}

uint64_t (*CapabilitiesBuilder.seymourRoutingSupportStatus.modify())()
{
  return nullsub_1;
}

uint64_t CapabilitiesBuilder.speakerSupportStatusAndQuality.getter()
{
  return *(void *)(v0 + 64);
}

uint64_t CapabilitiesBuilder.speakerSupportStatusAndQuality.setter(uint64_t result, uint64_t a2, char a3)
{
  *(void *)(v3 + 64) = result;
  *(void *)(v3 + 72) = a2;
  *(unsigned char *)(v3 + 80) = a3 & 1;
  return result;
}

uint64_t (*CapabilitiesBuilder.speakerSupportStatusAndQuality.modify())()
{
  return nullsub_1;
}

uint64_t CapabilitiesBuilder.voiceTriggerSupportStatus.getter()
{
  return *(void *)(v0 + 88);
}

uint64_t CapabilitiesBuilder.voiceTriggerSupportStatus.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 88) = result;
  *(unsigned char *)(v2 + 96) = a2 & 1;
  return result;
}

uint64_t (*CapabilitiesBuilder.voiceTriggerSupportStatus.modify())()
{
  return nullsub_1;
}

uint64_t CapabilitiesBuilder.profileSwitchingSupportStatus.getter()
{
  return *(void *)(v0 + 104);
}

uint64_t CapabilitiesBuilder.profileSwitchingSupportStatus.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 104) = result;
  *(unsigned char *)(v2 + 112) = a2 & 1;
  return result;
}

uint64_t (*CapabilitiesBuilder.profileSwitchingSupportStatus.modify())()
{
  return nullsub_1;
}

uint64_t CapabilitiesBuilder.muxSupportStatus.getter()
{
  return *(void *)(v0 + 120);
}

uint64_t CapabilitiesBuilder.muxSupportStatus.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 120) = result;
  *(unsigned char *)(v2 + 128) = a2 & 1;
  return result;
}

uint64_t (*CapabilitiesBuilder.muxSupportStatus.modify())()
{
  return nullsub_1;
}

uint64_t CapabilitiesBuilder.customTimerIntentHandlingStatus.getter()
{
  return *(void *)(v0 + 136);
}

uint64_t CapabilitiesBuilder.customTimerIntentHandlingStatus.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 136) = result;
  *(unsigned char *)(v2 + 144) = a2 & 1;
  return result;
}

uint64_t (*CapabilitiesBuilder.customTimerIntentHandlingStatus.modify())()
{
  return nullsub_1;
}

uint64_t CapabilitiesBuilder.assistantEnabledSupportStatus.getter()
{
  return *(void *)(v0 + 152);
}

uint64_t CapabilitiesBuilder.assistantEnabledSupportStatus.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 152) = result;
  *(unsigned char *)(v2 + 160) = a2 & 1;
  return result;
}

uint64_t (*CapabilitiesBuilder.assistantEnabledSupportStatus.modify())()
{
  return nullsub_1;
}

void CapabilitiesBuilder.init()(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
  *(void *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 24) = 1;
  *(void *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 40) = 1;
  *(void *)(a1 + 48) = 0;
  *(unsigned char *)(a1 + 56) = 1;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(unsigned char *)(a1 + 80) = 1;
  *(void *)(a1 + 88) = 0;
  *(unsigned char *)(a1 + 96) = 1;
  *(void *)(a1 + 104) = 0;
  *(unsigned char *)(a1 + 112) = 1;
  *(void *)(a1 + 120) = 0;
  *(unsigned char *)(a1 + 128) = 1;
  *(void *)(a1 + 136) = 0;
  *(unsigned char *)(a1 + 144) = 1;
  *(void *)(a1 + 152) = 0;
  *(unsigned char *)(a1 + 160) = 1;
}

uint64_t CapabilitiesBuilder.build()()
{
  uint64_t v1 = *(void *)(v0 + 16);
  char v2 = *(unsigned char *)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 32);
  char v4 = *(unsigned char *)(v0 + 40);
  uint64_t v5 = *(void *)(v0 + 48);
  char v6 = *(unsigned char *)(v0 + 56);
  uint64_t v52 = *(void *)(v0 + 72);
  uint64_t v53 = *(void *)(v0 + 64);
  char v7 = *(unsigned char *)(v0 + 80);
  char v8 = *(unsigned char *)(v0 + 96);
  uint64_t v54 = *(void *)(v0 + 88);
  uint64_t v55 = *(void *)(v0 + 104);
  char v59 = *(unsigned char *)(v0 + 112);
  char v60 = *(unsigned char *)(v0 + 128);
  uint64_t v56 = *(void *)(v0 + 120);
  uint64_t v57 = *(void *)(v0 + 136);
  uint64_t v58 = *(void *)(v0 + 152);
  char v61 = *(unsigned char *)(v0 + 144);
  char v62 = *(unsigned char *)(v0 + 160);
  uint64_t v9 = MEMORY[0x1E4FBC868];
  if (*(unsigned char *)(v0 + 8))
  {
    if (*(unsigned char *)(v0 + 24)) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v31 = *(void *)v0;
    id v32 = objc_allocWithZone((Class)type metadata accessor for AudioPlaybackCapability());
    AudioPlaybackCapability.init(status:)(v31);
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v33 = OUTLINED_FUNCTION_3_5();
    sub_1C9DED95C(v33, 0, v34, v35);
    OUTLINED_FUNCTION_1_9();
    if (v2)
    {
LABEL_3:
      if (v4) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  id v36 = objc_allocWithZone((Class)type metadata accessor for VideoPlaybackCapability());
  VideoPlaybackCapability.init(status:)(v1);
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v37 = OUTLINED_FUNCTION_3_5();
  sub_1C9DED95C(v37, 1, v38, v39);
  OUTLINED_FUNCTION_1_9();
  if (v4)
  {
LABEL_4:
    if (v6) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  id v40 = objc_allocWithZone((Class)type metadata accessor for AppLaunchCapability());
  AppLaunchCapability.init(status:)(v3);
  OUTLINED_FUNCTION_2_5();
  uint64_t v41 = OUTLINED_FUNCTION_0_5();
  sub_1C9DED95C(v41, 2, v42, v43);
  OUTLINED_FUNCTION_1_9();
  if (v6)
  {
LABEL_5:
    if (v7) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  id v44 = objc_allocWithZone((Class)type metadata accessor for SeymourRoutingCapability());
  SeymourRoutingCapability.init(status:)(v5);
  OUTLINED_FUNCTION_2_5();
  uint64_t v45 = OUTLINED_FUNCTION_0_5();
  sub_1C9DED95C(v45, 3, v46, v47);
  OUTLINED_FUNCTION_1_9();
  if (v7)
  {
LABEL_6:
    if (v8) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_21:
  id v48 = objc_allocWithZone((Class)type metadata accessor for SpeakerCapability());
  SpeakerCapability.init(status:qualityScore:)(v53, v52);
  OUTLINED_FUNCTION_2_5();
  uint64_t v49 = OUTLINED_FUNCTION_0_5();
  sub_1C9DED95C(v49, 4, v50, v51);
  OUTLINED_FUNCTION_1_9();
  if ((v8 & 1) == 0)
  {
LABEL_7:
    id v10 = objc_allocWithZone((Class)type metadata accessor for VoiceTriggerCapability());
    VoiceTriggerCapability.init(status:)(v54);
    OUTLINED_FUNCTION_2_5();
    uint64_t v11 = OUTLINED_FUNCTION_0_5();
    sub_1C9DED95C(v11, 5, v12, v13);
    OUTLINED_FUNCTION_1_9();
  }
LABEL_8:
  if ((v59 & 1) == 0)
  {
    id v14 = objc_allocWithZone((Class)type metadata accessor for ProfileSwitchingCapability());
    ProfileSwitchingCapability.init(status:)(v55);
    OUTLINED_FUNCTION_2_5();
    uint64_t v15 = OUTLINED_FUNCTION_0_5();
    sub_1C9DED95C(v15, 7, v16, v17);
    OUTLINED_FUNCTION_1_9();
  }
  if ((v60 & 1) == 0)
  {
    id v18 = objc_allocWithZone((Class)type metadata accessor for MUXCapability());
    MUXCapability.init(status:)(v56);
    OUTLINED_FUNCTION_2_5();
    uint64_t v19 = OUTLINED_FUNCTION_0_5();
    sub_1C9DED95C(v19, 8, v20, v21);
    OUTLINED_FUNCTION_1_9();
  }
  if ((v61 & 1) == 0)
  {
    id v22 = objc_allocWithZone((Class)type metadata accessor for CustomTimerIntentHandlingCapability());
    CustomTimerIntentHandlingCapability.init(status:)(v57);
    OUTLINED_FUNCTION_2_5();
    uint64_t v23 = OUTLINED_FUNCTION_0_5();
    sub_1C9DED95C(v23, 10, v24, v25);
    OUTLINED_FUNCTION_1_9();
  }
  if ((v62 & 1) == 0)
  {
    id v26 = objc_allocWithZone((Class)type metadata accessor for AssistantEnabledCapability());
    AssistantEnabledCapability.init(status:)(v58);
    OUTLINED_FUNCTION_2_5();
    uint64_t v27 = OUTLINED_FUNCTION_0_5();
    sub_1C9DED95C(v27, 9, v28, v29);
    OUTLINED_FUNCTION_1_9();
  }
  type metadata accessor for Capabilities();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v9;
  return result;
}

uint64_t type metadata accessor for Capabilities()
{
  return self;
}

unint64_t sub_1C9DED95C(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  char v7 = (void *)*a4;
  unint64_t v8 = sub_1C9DD99C0(a2);
  if (__OFADD__(v7[2], (v9 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  unint64_t v10 = v8;
  char v11 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C7128);
  if ((sub_1C9E0D610() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v12 = sub_1C9DD99C0(a2);
  if ((v11 & 1) != (v13 & 1))
  {
LABEL_9:
    unint64_t result = sub_1C9E0D830();
    __break(1u);
    return result;
  }
  unint64_t v10 = v12;
LABEL_5:
  id v14 = (void *)*a4;
  if ((v11 & 1) == 0) {
    return sub_1C9DEDE90(v10, a2, a1, v14);
  }
  uint64_t v15 = v14[7];
  unint64_t result = swift_unknownObjectRelease();
  *(void *)(v15 + 8 * v10) = a1;
  return result;
}

unint64_t sub_1C9DEDA50()
{
  unint64_t result = qword_1EA5C7120;
  if (!qword_1EA5C7120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C7120);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for CapabilityKey(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF5)
  {
    if (a2 + 11 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 11) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 12;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xC;
  int v5 = v6 - 12;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for CapabilityKey(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF4)
  {
    unsigned int v6 = ((a2 - 245) >> 8) + 1;
    *unint64_t result = a2 + 11;
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
        JUMPOUT(0x1C9DEDBF0);
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
          *unint64_t result = a2 + 11;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CapabilityKey()
{
  return &type metadata for CapabilityKey;
}

uint64_t method lookup function for Capabilities(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Capabilities);
}

uint64_t dispatch thunk of Capabilities.audioPlayback.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of Capabilities.videoPlayback.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of Capabilities.appLaunch.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of Capabilities.seymourRouting.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of Capabilities.speaker.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of Capabilities.voiceTrigger.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of Capabilities.alarmTimerIntentsHandling.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of Capabilities.profileSwitching.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of Capabilities.mux.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of Capabilities.customTimerIntentHandling.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of Capabilities.assistantEnabled.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t initializeBufferWithCopyOfBuffer for CapabilitiesBuilder(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void *__swift_memcpy161_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xA1uLL);
}

uint64_t getEnumTagSinglePayload for CapabilitiesBuilder(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 161)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CapabilitiesBuilder(uint64_t result, int a2, int a3)
{
  if (a2)
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
    *(unsigned char *)(result + 160) = 0;
    *(void *)unint64_t result = (a2 - 1);
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
  *(unsigned char *)(result + 161) = v3;
  return result;
}

ValueMetadata *type metadata accessor for CapabilitiesBuilder()
{
  return &type metadata for CapabilitiesBuilder;
}

unint64_t sub_1C9DEDE90(unint64_t result, char a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  *(unsigned char *)(a4[6] + result) = a2;
  *(void *)(a4[7] + 8 * result) = a3;
  uint64_t v4 = a4[2];
  BOOL v5 = __OFADD__(v4, 1);
  uint64_t v6 = v4 + 1;
  if (v5) {
    __break(1u);
  }
  else {
    a4[2] = v6;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_1_9()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_3_5()
{
  return v0;
}

void DeviceUnitDescription.deviceTypes.getter(void *a1@<X8>)
{
  *a1 = *v1;
}

void *DeviceUnitDescription.deviceTypes.setter(void *result)
{
  void *v1 = *result;
  return result;
}

uint64_t (*DeviceUnitDescription.deviceTypes.modify())()
{
  return nullsub_1;
}

uint64_t DeviceUnitDescription.room.getter@<X0>(uint64_t *a1@<X8>)
{
  return OUTLINED_FUNCTION_0_6(v1[1], v1[2], v1[3], a1);
}

uint64_t sub_1C9DEDF70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 != 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

__n128 DeviceUnitDescription.room.setter(uint64_t a1)
{
  OUTLINED_FUNCTION_1_10(a1);
  sub_1C9DEDFC4(v2[1], v2[2], v2[3]);
  __n128 result = v4;
  *(__n128 *)(v2 + 1) = v4;
  v2[3] = v1;
  return result;
}

uint64_t sub_1C9DEDFC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t (*DeviceUnitDescription.room.modify())()
{
  return nullsub_1;
}

uint64_t DeviceUnitDescription.zone.getter@<X0>(uint64_t *a1@<X8>)
{
  return OUTLINED_FUNCTION_0_6(v1[4], v1[5], v1[6], a1);
}

__n128 DeviceUnitDescription.zone.setter(uint64_t a1)
{
  OUTLINED_FUNCTION_1_10(a1);
  sub_1C9DEDFC4(v2[4], v2[5], v2[6]);
  __n128 result = v4;
  *((__n128 *)v2 + 2) = v4;
  v2[6] = v1;
  return result;
}

uint64_t (*DeviceUnitDescription.zone.modify())()
{
  return nullsub_1;
}

uint64_t DeviceUnitDescription.home.getter@<X0>(uint64_t *a1@<X8>)
{
  return OUTLINED_FUNCTION_0_6(v1[7], v1[8], v1[9], a1);
}

__n128 DeviceUnitDescription.home.setter(uint64_t a1)
{
  OUTLINED_FUNCTION_1_10(a1);
  sub_1C9DEDFC4(v2[7], v2[8], v2[9]);
  __n128 result = v4;
  *(__n128 *)(v2 + 7) = v4;
  v2[9] = v1;
  return result;
}

uint64_t (*DeviceUnitDescription.home.modify())()
{
  return nullsub_1;
}

void __swiftcall DeviceUnitDescription.init()(SiriVirtualDeviceResolution::DeviceUnitDescription *__return_ptr retstr)
{
  retstr->deviceTypes.rawValue = 0;
  *(void *)&retstr->room.value.current = 0;
  retstr->room.value.name.value._countAndFlagsBits = 0;
  retstr->room.value.name.value._object = (void *)1;
  *(void *)&retstr->zone.value.current = 0;
  retstr->zone.value.name.value._countAndFlagsBits = 0;
  retstr->zone.value.name.value._object = (void *)1;
  *(void *)&retstr->home.value.current = 0;
  retstr->home.value.name.value._countAndFlagsBits = 0;
  retstr->home.value.name.value._object = (void *)1;
}

uint64_t LocationDescription.current.getter()
{
  return *v0;
}

uint64_t LocationDescription.current.setter(uint64_t result)
{
  unsigned char *v1 = result;
  return result;
}

uint64_t (*LocationDescription.current.modify())()
{
  return nullsub_1;
}

uint64_t LocationDescription.name.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LocationDescription.name.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*LocationDescription.name.modify())()
{
  return nullsub_1;
}

SiriVirtualDeviceResolution::LocationDescription __swiftcall LocationDescription.init()()
{
  *(unsigned char *)uint64_t v0 = 0;
  *(void *)(v0 + 8) = 0;
  *(void *)(v0 + 16) = 0;
  return result;
}

uint64_t destroy for DeviceUnitDescription(void *a1)
{
  if (a1[3] != 1) {
    swift_bridgeObjectRelease();
  }
  if (a1[6] != 1) {
    swift_bridgeObjectRelease();
  }
  uint64_t result = a1[9];
  if (result != 1)
  {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for DeviceUnitDescription(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = a1 + 8;
  uint64_t v5 = *(void *)(a2 + 24);
  if (v5 == 1)
  {
    *(_OWORD *)uint64_t v4 = *(_OWORD *)(a2 + 8);
    *(void *)(v4 + 16) = *(void *)(a2 + 24);
  }
  else
  {
    *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(void *)(a1 + 24) = v5;
    swift_bridgeObjectRetain();
  }
  uint64_t v6 = *(void *)(a2 + 48);
  if (v6 == 1)
  {
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
  }
  else
  {
    *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(void *)(a1 + 48) = v6;
    swift_bridgeObjectRetain();
  }
  uint64_t v7 = *(void *)(a2 + 72);
  if (v7 == 1)
  {
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
  }
  else
  {
    *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    *(void *)(a1 + 72) = v7;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t assignWithCopy for DeviceUnitDescription(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = a1 + 8;
  uint64_t v5 = (long long *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 24);
  if (*(void *)(a1 + 24) == 1)
  {
    if (v6 == 1)
    {
      long long v7 = *v5;
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      *(_OWORD *)uint64_t v4 = v7;
    }
    else
    {
      *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      swift_bridgeObjectRetain();
    }
  }
  else if (v6 == 1)
  {
    sub_1C9DEE510(a1 + 8);
    uint64_t v8 = *((void *)v5 + 2);
    *(_OWORD *)uint64_t v4 = *v5;
    *(void *)(v4 + 16) = v8;
  }
  else
  {
    *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  char v9 = (long long *)(a1 + 32);
  unint64_t v10 = (long long *)(a2 + 32);
  uint64_t v11 = *(void *)(a2 + 48);
  if (*(void *)(a1 + 48) == 1)
  {
    if (v11 == 1)
    {
      long long v12 = *v10;
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      *char v9 = v12;
    }
    else
    {
      *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      swift_bridgeObjectRetain();
    }
  }
  else if (v11 == 1)
  {
    sub_1C9DEE510(a1 + 32);
    uint64_t v13 = *(void *)(a2 + 48);
    *char v9 = *v10;
    *(void *)(a1 + 48) = v13;
  }
  else
  {
    *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  id v14 = (long long *)(a1 + 56);
  uint64_t v15 = (long long *)(a2 + 56);
  uint64_t v16 = *(void *)(a2 + 72);
  if (*(void *)(a1 + 72) == 1)
  {
    if (v16 == 1)
    {
      long long v17 = *v15;
      *(void *)(a1 + 72) = *(void *)(a2 + 72);
      *id v14 = v17;
    }
    else
    {
      *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      *(void *)(a1 + 72) = *(void *)(a2 + 72);
      swift_bridgeObjectRetain();
    }
  }
  else if (v16 == 1)
  {
    sub_1C9DEE510(a1 + 56);
    uint64_t v18 = *(void *)(a2 + 72);
    *id v14 = *v15;
    *(void *)(a1 + 72) = v18;
  }
  else
  {
    *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  return a1;
}

uint64_t sub_1C9DEE510(uint64_t a1)
{
  return a1;
}

void *__swift_memcpy80_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x50uLL);
}

uint64_t assignWithTake for DeviceUnitDescription(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = a1 + 8;
  uint64_t v5 = a2 + 8;
  if (*(void *)(a1 + 24) == 1) {
    goto LABEL_4;
  }
  uint64_t v6 = *(void *)(a2 + 24);
  if (v6 == 1)
  {
    sub_1C9DEE510(v4);
LABEL_4:
    *(_OWORD *)uint64_t v4 = *(_OWORD *)v5;
    *(void *)(v4 + 16) = *(void *)(v5 + 16);
    goto LABEL_6;
  }
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRelease();
LABEL_6:
  if (*(void *)(a1 + 48) == 1)
  {
LABEL_9:
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    goto LABEL_11;
  }
  uint64_t v7 = *(void *)(a2 + 48);
  if (v7 == 1)
  {
    sub_1C9DEE510(a1 + 32);
    goto LABEL_9;
  }
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  swift_bridgeObjectRelease();
LABEL_11:
  if (*(void *)(a1 + 72) != 1)
  {
    uint64_t v8 = *(void *)(a2 + 72);
    if (v8 != 1)
    {
      *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      *(void *)(a1 + 72) = v8;
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_1C9DEE510(a1 + 56);
  }
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  return a1;
}

uint64_t getEnumTagSinglePayload for DeviceUnitDescription(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 > 0x7FFFFFFD && *(unsigned char *)(a1 + 80))
    {
      int v2 = *(_DWORD *)a1 + 2147483645;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 24);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v4 = v3 - 1;
      if (v4 < 0) {
        int v4 = -1;
      }
      BOOL v5 = __OFSUB__(v4, 1);
      int v2 = v4 - 1;
      if (v2 < 0 != v5) {
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

uint64_t storeEnumTagSinglePayload for DeviceUnitDescription(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 - 2147483646;
    if (a3 > 0x7FFFFFFD) {
      *(unsigned char *)(result + 80) = 1;
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFD) {
      *(unsigned char *)(result + 80) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceUnitDescription()
{
  return &type metadata for DeviceUnitDescription;
}

uint64_t destroy for LocationDescription()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s27SiriVirtualDeviceResolution19LocationDescriptionVwCP_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for LocationDescription(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
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

uint64_t assignWithTake for LocationDescription(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LocationDescription(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 24))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 16);
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

uint64_t storeEnumTagSinglePayload for LocationDescription(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LocationDescription()
{
  return &type metadata for LocationDescription;
}

uint64_t OUTLINED_FUNCTION_0_6@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  *a4 = a1;
  a4[1] = a2;
  a4[2] = a3;
  return sub_1C9DEDF70(a1, a2, a3);
}

__n128 OUTLINED_FUNCTION_1_10(uint64_t a1)
{
  return *(__n128 *)a1;
}

unint64_t CapabilitySupportStatus.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

unint64_t sub_1C9DEE908()
{
  unint64_t result = qword_1EA5C7130;
  if (!qword_1EA5C7130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C7130);
  }
  return result;
}

unint64_t sub_1C9DEE954@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = CapabilitySupportStatus.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CapabilitySupportStatus()
{
  return &type metadata for CapabilitySupportStatus;
}

void sub_1C9DEE998(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_1C9DEEA00(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) != 0)
  {
    id v3 = a1;
    char v4 = sub_1C9E0D500();

    return v4 & 1;
  }
  if (!*(void *)(a2 + 16)
    || (v6 = sub_1C9E0D3F0(), uint64_t v7 = -1 << *(unsigned char *)(a2 + 32), v8 = v6 & ~v7, OUTLINED_FUNCTION_32_0(), (v9 & 1) == 0))
  {
LABEL_11:
    char v12 = 0;
    return v12 & 1;
  }
  sub_1C9DD7D6C(0, (unint64_t *)&qword_1EA5C6E30);
  id v10 = *(id *)(*(void *)(a2 + 48) + 8 * v8);
  char v11 = sub_1C9E0D400();

  if ((v11 & 1) == 0)
  {
    uint64_t v13 = ~v7;
    uint64_t v14 = (v8 + 1) & v13;
    OUTLINED_FUNCTION_32_0();
    if (v15)
    {
      do
      {
        id v16 = *(id *)(*(void *)(a2 + 48) + 8 * v14);
        char v12 = sub_1C9E0D400();

        if (v12) {
          break;
        }
        uint64_t v14 = (v14 + 1) & v13;
        OUTLINED_FUNCTION_32_0();
      }
      while ((v17 & 1) != 0);
      return v12 & 1;
    }
    goto LABEL_11;
  }
  char v12 = 1;
  return v12 & 1;
}

uint64_t sub_1C9DEEB3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_1C9E0D890();
    sub_1C9E0D150();
    uint64_t v6 = sub_1C9E0D8D0();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      char v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_1C9E0D7F0() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          id v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_1C9E0D7F0() & 1) != 0) {
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

id sub_1C9DEEC74()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DeviceResolutionService()), sel_init);
  qword_1EA5C7140 = (uint64_t)result;
  return result;
}

id static DeviceResolutionService.sharedService.getter()
{
  if (qword_1EA5C6A50 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_1EA5C7140;
  return v0;
}

void sub_1C9DEED04()
{
  type metadata accessor for DeviceResolutionAnalyticsImpl();
  swift_allocObject();
  sub_1C9DDFE98();
  qword_1EA5C7148 = v0;
}

uint64_t static DeviceResolutionService.sharedAnalytics.getter()
{
  if (qword_1EA5C6A58 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t sub_1C9DEEDA0(uint64_t a1)
{
  return OUTLINED_FUNCTION_31_0(a1, OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_homeManager);
}

uint64_t sub_1C9DEEDAC(uint64_t a1)
{
  return OUTLINED_FUNCTION_31_0(a1, OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService__xpcConnection);
}

id sub_1C9DEEDB8()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService__xpcConnection];
  id v2 = v1;
  if (!v1)
  {
    id v3 = objc_msgSend(self, sel_currentContext);
    char v4 = self;
    id v5 = objc_msgSend(v4, sel_serviceName);
    if (!v5)
    {
      sub_1C9E0D120();
      id v5 = (id)sub_1C9E0D110();
      swift_bridgeObjectRelease();
    }
    id v2 = objc_msgSend(v3, sel_createXPCConnectionWithMachServiceName_options_, v5, 0);

    if (v2)
    {
      id v6 = v2;
      id v7 = objc_msgSend(v4, sel_xpcInterface);
      objc_msgSend(v6, sel_setRemoteObjectInterface_, v7);

      uint64_t v8 = swift_allocObject();
      *(void *)(v8 + 16) = v0;
      id v22 = sub_1C9E016E4;
      uint64_t v23 = v8;
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 1107296256;
      uint64_t v20 = sub_1C9DDC968;
      double v21 = &block_descriptor_82;
      uint64_t v9 = _Block_copy(&v18);
      id v10 = v6;
      char v11 = v0;
      swift_release();
      objc_msgSend(v10, sel_setInvalidationHandler_, v9);
      _Block_release(v9);

      uint64_t v12 = swift_allocObject();
      *(void *)(v12 + 16) = v11;
      id v22 = sub_1C9E0172C;
      uint64_t v23 = v12;
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 1107296256;
      uint64_t v20 = sub_1C9DDC968;
      double v21 = &block_descriptor_88;
      uint64_t v13 = _Block_copy(&v18);
      id v14 = v10;
      unint64_t v15 = v11;
      swift_release();
      objc_msgSend(v14, sel_setInterruptionHandler_, v13);
      _Block_release(v13);

      objc_msgSend(v14, sel_resume);
    }
  }
  id v16 = v1;
  return v2;
}

void sub_1C9DEF064()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v24 = v1;
  uint64_t v25 = v2;
  uint64_t v23 = v3;
  id v5 = v4;
  sub_1C9E0D040();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_13();
  uint64_t v8 = sub_1C9E0D010();
  OUTLINED_FUNCTION_0_1();
  uint64_t v10 = v9;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_4_0();
  if (qword_1EA5C6A70 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v8, (uint64_t)qword_1EA5C98A0);
  OUTLINED_FUNCTION_23_1();
  v12();
  uint64_t v13 = sub_1C9E0D000();
  os_log_type_t v14 = sub_1C9E0D320();
  if (os_log_type_enabled(v13, v14))
  {
    unint64_t v15 = (uint8_t *)OUTLINED_FUNCTION_41_0();
    *(_WORD *)unint64_t v15 = 0;
    _os_log_impl(&dword_1C9DD3000, v13, v14, v23, v15, 2u);
    OUTLINED_FUNCTION_15();
  }

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v0, v8);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v5;
  v26[4] = v24;
  v26[5] = v16;
  v26[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_20(COERCE_DOUBLE(1107296256));
  v26[2] = sub_1C9DDC968;
  v26[3] = v25;
  BOOL v17 = _Block_copy(v26);
  id v18 = v5;
  sub_1C9E0D050();
  sub_1C9E01590(&qword_1EA5C6CF8, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D00);
  sub_1C9E0218C(&qword_1EA5C6D08, &qword_1EA5C6D00);
  OUTLINED_FUNCTION_36_0();
  sub_1C9E0D490();
  uint64_t v19 = OUTLINED_FUNCTION_52();
  MEMORY[0x1CB78F460](v19);
  _Block_release(v17);
  uint64_t v20 = OUTLINED_FUNCTION_60();
  v21(v20);
  OUTLINED_FUNCTION_8_0();
  v22();
  swift_release();
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_1C9DEF390(uint64_t a1)
{
  return sub_1C9DEEDAC(0);
}

uint64_t DeviceResolutionService.XPCError.hash(into:)()
{
  return sub_1C9E0D8A0();
}

uint64_t static DeviceResolutionService.XPCError.== infix(_:_:)()
{
  return 1;
}

uint64_t DeviceResolutionService.XPCError.hashValue.getter()
{
  return sub_1C9E0D8D0();
}

uint64_t sub_1C9DEF444()
{
  return DeviceResolutionService.XPCError.hashValue.getter();
}

uint64_t sub_1C9DEF45C()
{
  return DeviceResolutionService.XPCError.hash(into:)();
}

uint64_t sub_1C9DEF474()
{
  return sub_1C9E0D8D0();
}

id sub_1C9DEF4C4()
{
  uint64_t v14 = sub_1C9E0D350();
  uint64_t v1 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  id v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1C9E0D340();
  MEMORY[0x1F4188790](v4);
  uint64_t v5 = sub_1C9E0D060();
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v6 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_homeManagerReadyGroup;
  uint64_t v7 = v0;
  *(void *)&v0[v6] = dispatch_group_create();
  uint64_t v13 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_queue;
  sub_1C9DD7D6C(0, (unint64_t *)&unk_1EA5C6DB0);
  sub_1C9E0D050();
  uint64_t v16 = MEMORY[0x1E4FBC860];
  sub_1C9E01590((unint64_t *)&unk_1EA5C7370, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA5C6DC0);
  sub_1C9E0218C((unint64_t *)&unk_1EA5C7380, (uint64_t *)&unk_1EA5C6DC0);
  sub_1C9E0D490();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FBCC58], v14);
  *(void *)&v7[v13] = sub_1C9E0D370();
  *(void *)&v7[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_homeManager] = 0;
  v7[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_initialLoadDone] = 0;
  uint64_t v8 = (uint64_t)&v7[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_endpointUUID];
  uint64_t v9 = sub_1C9E0CFF0();
  __swift_storeEnumTagSinglePayload(v8, 1, 1, v9);
  v7[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_waitingOnHomeManagerDataSync] = 0;
  *(void *)&v7[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService__xpcConnection] = 0;

  uint64_t v10 = (objc_class *)type metadata accessor for DeviceResolutionService();
  v15.receiver = v7;
  v15.super_class = v10;
  return objc_msgSendSuper2(&v15, sel_init);
}

void sub_1C9DEF7EC()
{
  OUTLINED_FUNCTION_5_0();
  id v3 = v2;
  sub_1C9E0D040();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v4);
  uint64_t v5 = OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_6_0();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v0;
  *(void *)(v9 + 24) = v3;
  v16[4] = sub_1C9DEFA64;
  v16[5] = v9;
  v16[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_20(COERCE_DOUBLE(1107296256));
  v16[2] = sub_1C9DDC968;
  void v16[3] = &block_descriptor_0;
  uint64_t v10 = _Block_copy(v16);
  id v11 = v0;
  id v12 = v3;
  sub_1C9E0D050();
  sub_1C9E01590(&qword_1EA5C6CF8, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D00);
  sub_1C9E0218C(&qword_1EA5C6D08, &qword_1EA5C6D00);
  OUTLINED_FUNCTION_9();
  uint64_t v13 = OUTLINED_FUNCTION_19();
  MEMORY[0x1CB78F460](v13);
  _Block_release(v10);
  uint64_t v14 = OUTLINED_FUNCTION_60();
  v15(v14);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1, v5);
  swift_release();
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_1C9DEF9FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  return sub_1C9DEEDA0((uint64_t)a2);
}

uint64_t sub_1C9DEFA2C()
{
  uint64_t v1 = OUTLINED_FUNCTION_47();
  return MEMORY[0x1F4186498](v1, v2, v3);
}

uint64_t sub_1C9DEFA64()
{
  return sub_1C9DEF9FC(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

void sub_1C9DEFA84()
{
  OUTLINED_FUNCTION_5_0();
  sub_1C9E0D040();
  OUTLINED_FUNCTION_0_1();
  v20[4] = v1;
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_1();
  v20[2] = v4;
  v20[3] = v3;
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_13();
  uint64_t v5 = sub_1C9E0CFF0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x1F4188790](v10);
  v20[1] = *(void *)&v0[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_queue];
  OUTLINED_FUNCTION_23_1();
  v11();
  unint64_t v12 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v0;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v13 + v12, (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  v21[4] = sub_1C9DEFEB0;
  v21[5] = v13;
  v21[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_20(COERCE_DOUBLE(1107296256));
  v21[2] = sub_1C9DDC968;
  v21[3] = &block_descriptor_6_0;
  uint64_t v14 = _Block_copy(v21);
  objc_super v15 = v0;
  sub_1C9E0D050();
  v20[5] = MEMORY[0x1E4FBC860];
  sub_1C9E01590(&qword_1EA5C6CF8, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D00);
  sub_1C9E0218C(&qword_1EA5C6D08, &qword_1EA5C6D00);
  sub_1C9E0D490();
  uint64_t v16 = OUTLINED_FUNCTION_52();
  MEMORY[0x1CB78F460](v16);
  _Block_release(v14);
  uint64_t v17 = OUTLINED_FUNCTION_22_1();
  v18(v17);
  OUTLINED_FUNCTION_8_0();
  v19();
  swift_release();
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_1C9DEFD2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C7328);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1C9E0CFF0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(v6, a2, v7);
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v7);
  uint64_t v8 = a1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_endpointUUID;
  swift_beginAccess();
  sub_1C9E027A0((uint64_t)v6, v8);
  return swift_endAccess();
}

uint64_t sub_1C9DEFE30()
{
  sub_1C9E0CFF0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_28_0();
  uint64_t v0 = OUTLINED_FUNCTION_3_6();
  v1(v0);
  uint64_t v2 = OUTLINED_FUNCTION_20_1();
  return MEMORY[0x1F4186498](v2, v3, v4);
}

uint64_t sub_1C9DEFEB0()
{
  uint64_t v0 = sub_1C9E0CFF0();
  OUTLINED_FUNCTION_2_6(v0);
  uint64_t v1 = OUTLINED_FUNCTION_51();
  return sub_1C9DEFD2C(v1, v2);
}

uint64_t sub_1C9DEFEE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C7160);
  MEMORY[0x1F4188790](v8 - 8);
  OUTLINED_FUNCTION_13();
  uint64_t v9 = sub_1C9E0D2A0();
  __swift_storeEnumTagSinglePayload(v4, 1, 1, v9);
  uint64_t v10 = (void *)swift_allocObject();
  _OWORD v10[2] = 0;
  v10[3] = 0;
  v10[4] = v3;
  v10[5] = a1;
  v10[6] = a2;
  v10[7] = a3;
  id v11 = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1C9DF04A4(v4, (uint64_t)&unk_1EA5C7170, (uint64_t)v10);
  return swift_release();
}

uint64_t sub_1C9DEFFD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[2] = a6;
  v7[3] = a7;
  uint64_t v8 = (void *)swift_task_alloc();
  v7[4] = v8;
  *uint64_t v8 = v7;
  v8[1] = sub_1C9DF0070;
  return sub_1C9DF146C();
}

uint64_t sub_1C9DF0070()
{
  OUTLINED_FUNCTION_4_2();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_1_11();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_8_4();
  void *v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_5_3();
  *uint64_t v8 = v7;
  *(void *)(v5 + 40) = v0;
  swift_task_dealloc();
  if (!v0) {
    *(void *)(v5 + 48) = v3;
  }
  OUTLINED_FUNCTION_11_1();
  return MEMORY[0x1F4188298](v9, v10, v11);
}

uint64_t sub_1C9DF0160()
{
  OUTLINED_FUNCTION_7_4();
  (*(void (**)(void))(v0 + 16))(*(void *)(v0 + 48));
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_21_1();
  return v1();
}

uint64_t sub_1C9DF01CC()
{
  OUTLINED_FUNCTION_7_2();
  uint64_t v1 = *(void **)(v0 + 40);
  uint64_t v2 = *(void (**)(void))(v0 + 16);
  type metadata accessor for DeviceUnit();
  sub_1C9DD7D6C(0, &qword_1EA5C7358);
  sub_1C9E01590(&qword_1EA5C73C8, (void (*)(uint64_t))type metadata accessor for DeviceUnit);
  sub_1C9E0D0D0();
  v2();
  swift_bridgeObjectRelease();

  OUTLINED_FUNCTION_21_1();
  return v3();
}

uint64_t sub_1C9DF02C4()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1C9DF0314(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v7 = v1[7];
  uint64_t v9 = swift_task_alloc();
  uint64_t v10 = (void *)OUTLINED_FUNCTION_6_2(v9);
  *uint64_t v10 = v11;
  v10[1] = sub_1C9DF03E4;
  return sub_1C9DEFFD0(a1, v3, v4, v5, v6, v8, v7);
}

uint64_t sub_1C9DF03E4()
{
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_1_11();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_5_3();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21_1();
  return v3();
}

uint64_t sub_1C9DF04A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C9E0D2A0();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_1C9E026A4(a1, &qword_1EA5C7160);
  }
  else
  {
    sub_1C9E0D290();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1C9E0D260();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1C9DF0614()
{
  *(void *)(v1 + 24) = v0;
  return OUTLINED_FUNCTION_1_7((uint64_t)sub_1C9DF062C);
}

uint64_t sub_1C9DF062C()
{
  OUTLINED_FUNCTION_4_2();
  uint64_t v1 = OUTLINED_FUNCTION_40_0();
  OUTLINED_FUNCTION_43_0(v1);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C7180);
  OUTLINED_FUNCTION_16_1();
  *uint64_t v2 = v3;
  v2[1] = sub_1C9DF06FC;
  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_29_0();
  return MEMORY[0x1F4188160]();
}

uint64_t sub_1C9DF06FC()
{
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_1_11();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_8_4();
  void *v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_5_3();
  void *v6 = v5;
  *(void *)(v3 + 48) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_task_dealloc();
  }
  OUTLINED_FUNCTION_11_1();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

uint64_t sub_1C9DF07E4()
{
  OUTLINED_FUNCTION_7_4();
  swift_task_dealloc();
  OUTLINED_FUNCTION_21_1();
  return v0();
}

void sub_1C9DF0840()
{
}

uint64_t sub_1C9DF0888(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_1C9E0D010();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C74D8);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = sub_1C9DEEDB8();
  if (v11)
  {
    unint64_t v12 = v11;
    BOOL v30 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
    uint64_t v31 = v4;
    v30((char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v7);
    uint64_t v13 = *(unsigned __int8 *)(v8 + 80);
    uint64_t v14 = (v13 + 16) & ~v13;
    v28[0] = v13 | 7;
    v28[1] = v14 + v9;
    uint64_t v15 = swift_allocObject();
    uint64_t v32 = a2;
    uint64_t v16 = v15;
    uint64_t v29 = v14;
    uint64_t v17 = *(void (**)(uint64_t, char *, uint64_t))(v8 + 32);
    v17(v15 + v14, v10, v7);
    uint64_t v37 = sub_1C9E024C8;
    uint64_t v38 = v16;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v34 = 1107296256;
    unint64_t v35 = sub_1C9DEE998;
    id v36 = &block_descriptor_283;
    id v18 = _Block_copy(&aBlock);
    swift_release();
    id v19 = objc_msgSend(v12, sel_remoteObjectProxyWithErrorHandler_, v18);
    _Block_release(v18);

    sub_1C9E0D470();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6DE0);
    if (swift_dynamicCast())
    {
      uint64_t v20 = (void *)aBlock;
      v30(v10, v32, v7);
      uint64_t v21 = swift_allocObject();
      v17(v21 + v29, v10, v7);
      uint64_t v37 = (void (*)(uint64_t))sub_1C9E024E0;
      uint64_t v38 = v21;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v34 = 1107296256;
      unint64_t v35 = sub_1C9DF0D2C;
      id v36 = &block_descriptor_289;
      id v22 = _Block_copy(&aBlock);
      swift_unknownObjectRetain();
      swift_release();
      objc_msgSend(v20, sel_pairedCompanionDeviceWithCompletion_, v22);
      _Block_release(v22);
      return swift_unknownObjectRelease_n();
    }
    uint64_t v4 = v31;
  }
  if (qword_1EA5C6A70 != -1) {
    swift_once();
  }
  uint64_t v24 = __swift_project_value_buffer(v3, (uint64_t)qword_1EA5C98A0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v24, v3);
  uint64_t v25 = sub_1C9E0D000();
  os_log_type_t v26 = sub_1C9E0D320();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v27 = 0;
    _os_log_impl(&dword_1C9DD3000, v25, v26, "Failed to get remote object", v27, 2u);
    MEMORY[0x1CB7900C0](v27, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_1C9E01660();
  uint64_t aBlock = swift_allocError();
  return sub_1C9E0D270();
}

void sub_1C9DF0D2C(uint64_t a1, void *a2)
{
}

uint64_t sub_1C9DF0D34()
{
  *(void *)(v1 + 24) = v0;
  return OUTLINED_FUNCTION_1_7((uint64_t)sub_1C9DF0D4C);
}

uint64_t sub_1C9DF0D4C()
{
  OUTLINED_FUNCTION_4_2();
  uint64_t v1 = OUTLINED_FUNCTION_40_0();
  OUTLINED_FUNCTION_43_0(v1);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C7180);
  OUTLINED_FUNCTION_16_1();
  *uint64_t v2 = v3;
  v2[1] = sub_1C9DF0E24;
  uint64_t v4 = OUTLINED_FUNCTION_9_1();
  return MEMORY[0x1F4188160](v4);
}

uint64_t sub_1C9DF0E24()
{
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_1_11();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_8_4();
  void *v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_5_3();
  void *v6 = v5;
  *(void *)(v3 + 48) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_task_dealloc();
  }
  OUTLINED_FUNCTION_11_1();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

void sub_1C9DF0F08()
{
}

uint64_t sub_1C9DF0F50(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_1C9E0D010();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C74D8);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = sub_1C9DEEDB8();
  if (v11)
  {
    unint64_t v12 = v11;
    BOOL v30 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
    uint64_t v31 = v4;
    v30((char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v7);
    uint64_t v13 = *(unsigned __int8 *)(v8 + 80);
    uint64_t v14 = (v13 + 16) & ~v13;
    v28[0] = v13 | 7;
    v28[1] = v14 + v9;
    uint64_t v15 = swift_allocObject();
    uint64_t v32 = a2;
    uint64_t v16 = v15;
    uint64_t v29 = v14;
    uint64_t v17 = *(void (**)(uint64_t, char *, uint64_t))(v8 + 32);
    v17(v15 + v14, v10, v7);
    uint64_t v37 = sub_1C9E024C8;
    uint64_t v38 = v16;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v34 = 1107296256;
    unint64_t v35 = sub_1C9DEE998;
    id v36 = &block_descriptor_265;
    id v18 = _Block_copy(&aBlock);
    swift_release();
    id v19 = objc_msgSend(v12, sel_remoteObjectProxyWithErrorHandler_, v18);
    _Block_release(v18);

    sub_1C9E0D470();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6DE0);
    if (swift_dynamicCast())
    {
      uint64_t v20 = (void *)aBlock;
      v30(v10, v32, v7);
      uint64_t v21 = swift_allocObject();
      v17(v21 + v29, v10, v7);
      uint64_t v37 = (void (*)(uint64_t))sub_1C9E024E0;
      uint64_t v38 = v21;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v34 = 1107296256;
      unint64_t v35 = sub_1C9DF0D2C;
      id v36 = &block_descriptor_271;
      id v22 = _Block_copy(&aBlock);
      swift_unknownObjectRetain();
      swift_release();
      objc_msgSend(v20, sel_meDeviceWithCompletion_, v22);
      _Block_release(v22);
      return swift_unknownObjectRelease_n();
    }
    uint64_t v4 = v31;
  }
  if (qword_1EA5C6A70 != -1) {
    swift_once();
  }
  uint64_t v24 = __swift_project_value_buffer(v3, (uint64_t)qword_1EA5C98A0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v24, v3);
  uint64_t v25 = sub_1C9E0D000();
  os_log_type_t v26 = sub_1C9E0D320();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v27 = 0;
    _os_log_impl(&dword_1C9DD3000, v25, v26, "Failed to get remote object", v27, 2u);
    MEMORY[0x1CB7900C0](v27, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_1C9E01660();
  uint64_t aBlock = swift_allocError();
  return sub_1C9E0D270();
}

uint64_t sub_1C9DF13F4(void *a1)
{
  if (a1)
  {
    type metadata accessor for DeviceUnit();
    DeviceUnit.__allocating_init(deviceUnitObjC:)(a1);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C74D8);
  return sub_1C9E0D280();
}

uint64_t sub_1C9DF146C()
{
  OUTLINED_FUNCTION_7_4();
  v1[3] = v2;
  v1[4] = v0;
  uint64_t v3 = (void *)swift_task_alloc();
  v1[5] = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1C9DF14F8;
  return sub_1C9DFA680();
}

uint64_t sub_1C9DF14F8()
{
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_1_11();
  OUTLINED_FUNCTION_8_4();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 48) = v4;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_21_1();
    return v5();
  }
  else
  {
    OUTLINED_FUNCTION_11_1();
    return MEMORY[0x1F4188298](v7, v8, v9);
  }
}

uint64_t sub_1C9DF15F8()
{
  OUTLINED_FUNCTION_4_2();
  uint64_t v1 = (int8x16_t *)swift_task_alloc();
  OUTLINED_FUNCTION_35_0(v1);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C71A0);
  OUTLINED_FUNCTION_16_1();
  *uint64_t v2 = v3;
  v2[1] = sub_1C9DF16D4;
  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_29_0();
  return MEMORY[0x1F4188160]();
}

uint64_t sub_1C9DF16D4()
{
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_1_11();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_8_4();
  void *v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_5_3();
  void *v6 = v5;
  *(void *)(v3 + 72) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_task_dealloc();
  }
  OUTLINED_FUNCTION_11_1();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

uint64_t sub_1C9DF17B8()
{
  OUTLINED_FUNCTION_7_4();

  uint64_t v1 = OUTLINED_FUNCTION_50();
  return v2(v1);
}

uint64_t sub_1C9DF1810()
{
  OUTLINED_FUNCTION_7_4();

  swift_task_dealloc();
  OUTLINED_FUNCTION_21_1();
  return v1();
}

uint64_t sub_1C9DF1874(uint64_t a1, char *a2, uint64_t a3, void *a4)
{
  uint64_t v25 = a4;
  uint64_t v27 = sub_1C9E0D040();
  uint64_t v30 = *(void *)(v27 - 8);
  MEMORY[0x1F4188790](v27);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1C9E0D060();
  uint64_t v28 = *(void *)(v9 - 8);
  uint64_t v29 = v9;
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C7420);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = *(void *)&a2[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_queue];
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a1, v12);
  unint64_t v16 = (*(unsigned __int8 *)(v13 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v17 = (char *)swift_allocObject();
  *((void *)v17 + 2) = a3;
  *((void *)v17 + 3) = a2;
  id v18 = v25;
  *((void *)v17 + 4) = v25;
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(&v17[v16], v15, v12);
  aBlock[4] = sub_1C9E01F78;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C9DDC968;
  aBlock[3] = &block_descriptor_212;
  id v19 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  uint64_t v20 = a2;
  id v21 = v18;
  sub_1C9E0D050();
  uint64_t v31 = MEMORY[0x1E4FBC860];
  sub_1C9E01590(&qword_1EA5C6CF8, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D00);
  sub_1C9E0218C(&qword_1EA5C6D08, &qword_1EA5C6D00);
  uint64_t v22 = v27;
  sub_1C9E0D490();
  MEMORY[0x1CB78F460](0, v11, v8, v19);
  _Block_release(v19);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v8, v22);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v11, v29);
  return swift_release();
}

uint64_t sub_1C9DF1C24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v56 = a2;
  uint64_t v51 = sub_1C9E0D010();
  uint64_t v7 = *(void *)(v51 - 8);
  MEMORY[0x1F4188790](v51);
  uint64_t v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C7420);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(char **)(a1 + 16);
  uint64_t v54 = v7;
  uint64_t v53 = v9;
  uint64_t v52 = v12;
  if (v14)
  {
    uint64_t v47 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v48 = v11;
    uint64_t v49 = v10;
    uint64_t v50 = a4;
    uint64_t v15 = v14;
    swift_bridgeObjectRetain();
    uint64_t v46 = a1;
    unint64_t v16 = (uint64_t *)(a1 + 56);
    uint64_t v55 = a3;
    uint64_t v17 = MEMORY[0x1E4FBC860];
    do
    {
      char v59 = v15;
      uint64_t v60 = v17;
      uint64_t v18 = *(v16 - 2);
      uint64_t v19 = *(v16 - 1);
      uint64_t v20 = *v16;
      uint64_t v22 = v16[1];
      uint64_t v21 = v16[2];
      uint64_t v24 = v16[3];
      uint64_t v23 = (void (*)(void, void, void))v16[4];
      uint64_t v26 = v16[5];
      uint64_t v25 = v16[6];
      uint64_t aBlock = *(v16 - 3);
      uint64_t v62 = v18;
      uint64_t v63 = v19;
      v64 = (void *)v20;
      uint64_t v65 = v22;
      uint64_t v66 = v21;
      uint64_t v67 = v24;
      uint64_t v68 = v23;
      uint64_t v57 = v26;
      uint64_t v58 = (void (*)(uint64_t, char *, uint64_t))v23;
      uint64_t v69 = v26;
      uint64_t v70 = v25;
      sub_1C9DEDF70(v18, v19, v20);
      sub_1C9DEDF70(v22, v21, v24);
      sub_1C9DEDF70((uint64_t)v23, v26, v25);
      sub_1C9DFC5F8();
      unint64_t v28 = v27;
      uint64_t aBlock = v60;
      swift_bridgeObjectRetain();
      sub_1C9DFCCE0(v28);
      sub_1C9DEDFC4(v18, v19, v20);
      uint64_t v29 = v21;
      uint64_t v30 = v59;
      sub_1C9DEDFC4(v22, v29, v24);
      sub_1C9DEDFC4((uint64_t)v58, v57, v25);
      swift_bridgeObjectRelease();
      uint64_t v17 = aBlock;
      v16 += 10;
      uint64_t v15 = v30 - 1;
    }
    while (v15);
    swift_bridgeObjectRelease();
    a4 = v50;
    uint64_t v10 = v49;
    uint64_t v7 = v54;
    uint64_t v9 = v53;
    uint64_t v11 = v48;
    uint64_t v13 = v47;
  }
  else
  {
    uint64_t v17 = MEMORY[0x1E4FBC860];
  }
  id v31 = sub_1C9DEEDB8();
  if (v31)
  {
    uint64_t v32 = v31;
    char v59 = *(char **)(v11 + 16);
    uint64_t v60 = v17;
    ((void (*)(char *, uint64_t, uint64_t))v59)(v13, a4, v10);
    uint64_t v33 = *(unsigned __int8 *)(v11 + 80);
    uint64_t v34 = swift_allocObject();
    uint64_t v58 = *(void (**)(uint64_t, char *, uint64_t))(v11 + 32);
    v58(v34 + ((v33 + 16) & ~v33), v13, v10);
    uint64_t v65 = (uint64_t)sub_1C9E01FFC;
    uint64_t v66 = v34;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v62 = 1107296256;
    uint64_t v63 = (uint64_t)sub_1C9DEE998;
    v64 = &block_descriptor_218;
    unint64_t v35 = _Block_copy(&aBlock);
    swift_release();
    id v36 = objc_msgSend(v32, sel_remoteObjectProxyWithErrorHandler_, v35);
    _Block_release(v35);

    sub_1C9E0D470();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6DE0);
    if (swift_dynamicCast())
    {
      uint64_t v37 = (void *)aBlock;
      ((void (*)(char *, uint64_t, uint64_t))v59)(v13, a4, v10);
      uint64_t v38 = swift_allocObject();
      *(void *)(v38 + 16) = v60;
      v58(v38 + ((v33 + 24) & ~v33), v13, v10);
      uint64_t v65 = (uint64_t)sub_1C9E02090;
      uint64_t v66 = v38;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v62 = 1107296256;
      uint64_t v63 = (uint64_t)sub_1C9DF2C60;
      v64 = &block_descriptor_224;
      uint64_t v39 = _Block_copy(&aBlock);
      swift_unknownObjectRetain();
      swift_release();
      objc_msgSend(v37, sel_getAllReachableDevicesWithCompletion_, v39);
      _Block_release(v39);
      return swift_unknownObjectRelease_n();
    }
    swift_bridgeObjectRelease();
    uint64_t v7 = v54;
    uint64_t v9 = v53;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v41 = v51;
  if (qword_1EA5C6A70 != -1) {
    swift_once();
  }
  uint64_t v42 = __swift_project_value_buffer(v41, (uint64_t)qword_1EA5C98A0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v42, v41);
  uint64_t v43 = sub_1C9E0D000();
  os_log_type_t v44 = sub_1C9E0D320();
  if (os_log_type_enabled(v43, v44))
  {
    uint64_t v45 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v45 = 0;
    _os_log_impl(&dword_1C9DD3000, v43, v44, "Failed to get remote object", v45, 2u);
    MEMORY[0x1CB7900C0](v45, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v41);
  sub_1C9E01660();
  uint64_t aBlock = swift_allocError();
  return sub_1C9E0D270();
}

uint64_t sub_1C9DF22B8(unint64_t a1, unint64_t a2)
{
  unint64_t v33 = MEMORY[0x1E4FBC860];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1C9E0D700();
    if (v3) {
      goto LABEL_3;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    unint64_t isUniquelyReferenced_nonNull_native = MEMORY[0x1E4FBC860];
    goto LABEL_16;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v3) {
    goto LABEL_15;
  }
LABEL_3:
  type metadata accessor for DeviceUnit();
  if (v3 < 1)
  {
    __break(1u);
LABEL_42:
    uint64_t result = sub_1C9E0D830();
    __break(1u);
    return result;
  }
  for (uint64_t i = 0; i != v3; ++i)
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v5 = (id)MEMORY[0x1CB78F680](i, a1);
    }
    else {
      id v5 = *(id *)(a1 + 8 * i + 32);
    }
    if (DeviceUnit.__allocating_init(deviceUnitObjC:)(v5))
    {
      MEMORY[0x1CB78F2F0]();
      if (*(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_1C9E0D240();
      }
      sub_1C9E0D250();
      sub_1C9E0D230();
    }
  }
  swift_bridgeObjectRelease();
  unint64_t isUniquelyReferenced_nonNull_native = v33;
LABEL_16:
  type metadata accessor for DeviceUnit();
  uint64_t v7 = (void *)sub_1C9E0D0D0();
  if (isUniquelyReferenced_nonNull_native >> 62) {
    goto LABEL_39;
  }
  uint64_t v8 = *(void *)((isUniquelyReferenced_nonNull_native & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (v8)
  {
    unint64_t v31 = isUniquelyReferenced_nonNull_native;
    unint64_t v32 = isUniquelyReferenced_nonNull_native & 0xC000000000000001;
    uint64_t v9 = 4;
    uint64_t v30 = v8;
    while (1)
    {
      uint64_t v10 = v32
          ? (char *)MEMORY[0x1CB78F680](v9 - 4, isUniquelyReferenced_nonNull_native)
          : (char *)*(id *)(isUniquelyReferenced_nonNull_native + 8 * v9);
      uint64_t v11 = v10;
      uint64_t v12 = v9 - 3;
      if (__OFADD__(v9 - 4, 1)) {
        break;
      }
      uint64_t v13 = *(void *)&v10[OBJC_IVAR___SVDDeviceUnitSwift_homeKitAccessoryIdentifier + 8];
      if (v13)
      {
        uint64_t v14 = *(void *)&v10[OBJC_IVAR___SVDDeviceUnitSwift_homeKitAccessoryIdentifier];
        swift_bridgeObjectRetain();
        id v15 = v11;
        unint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v16 = sub_1C9DD5CF8(v14, v13);
        if (__OFADD__(v7[2], (v17 & 1) == 0)) {
          goto LABEL_37;
        }
        unint64_t v18 = v16;
        char v19 = v17;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C7428);
        if (sub_1C9E0D610())
        {
          unint64_t v20 = sub_1C9DD5CF8(v14, v13);
          if ((v19 & 1) != (v21 & 1)) {
            goto LABEL_42;
          }
          unint64_t v18 = v20;
        }
        if (v19)
        {
          uint64_t v22 = v7[7];

          *(void *)(v22 + 8 * v18) = v15;
        }
        else
        {
          v7[(v18 >> 6) + 8] |= 1 << v18;
          uint64_t v23 = (uint64_t *)(v7[6] + 16 * v18);
          *uint64_t v23 = v14;
          v23[1] = v13;
          *(void *)(v7[7] + 8 * v18) = v15;
          uint64_t v24 = v7[2];
          BOOL v25 = __OFADD__(v24, 1);
          uint64_t v26 = v24 + 1;
          if (v25) {
            goto LABEL_38;
          }
          v7[2] = v26;
          swift_bridgeObjectRetain();
        }

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v8 = v30;
        unint64_t isUniquelyReferenced_nonNull_native = v31;
      }
      else
      {
      }
      ++v9;
      if (v12 == v8) {
        goto LABEL_35;
      }
    }
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    swift_bridgeObjectRetain_n();
    uint64_t v8 = sub_1C9E0D700();
    swift_bridgeObjectRelease();
  }
LABEL_35:
  swift_bridgeObjectRelease_n();
  sub_1C9DD7D6C(0, &qword_1EA5C7358);
  sub_1C9E01590(&qword_1EA5C73C8, (void (*)(uint64_t))type metadata accessor for DeviceUnit);
  uint64_t v27 = sub_1C9E0D0D0();
  swift_bridgeObjectRetain();
  sub_1C9DF28E4(v27, a2, (uint64_t)v7);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C7420);
  return sub_1C9E0D280();
}

uint64_t sub_1C9DF26F8(unint64_t a1, uint64_t a2)
{
  uint64_t v16 = MEMORY[0x1E4FBC860];
  if (a1 >> 62) {
    goto LABEL_17;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_1C9E0D700())
  {
    uint64_t v5 = 4;
    while (1)
    {
      id v6 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1CB78F680](v5 - 4, a1) : *(id *)(a1 + 8 * v5);
      uint64_t v7 = v6;
      uint64_t v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1)) {
        break;
      }
      if (!*(void *)(a2 + 16)) {
        goto LABEL_10;
      }
      id v9 = objc_msgSend(v6, sel_category);
      id v10 = objc_msgSend(v9, sel_categoryType);

      uint64_t v11 = sub_1C9E0D120();
      uint64_t v13 = v12;

      LOBYTE(v11) = sub_1C9DEEB3C(v11, v13, a2);
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
      }
      else
      {
LABEL_10:
        MEMORY[0x1CB78F2F0]();
        if (*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1C9E0D240();
        }
        sub_1C9E0D250();
        sub_1C9E0D230();
      }
      ++v5;
      if (v8 == v4)
      {
        swift_bridgeObjectRelease();
        uint64_t v14 = v16;
        goto LABEL_19;
      }
    }
    __break(1u);
LABEL_17:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  uint64_t v14 = MEMORY[0x1E4FBC860];
LABEL_19:
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_1C9DF28E4(uint64_t a1, unint64_t a2, uint64_t isUniquelyReferenced_nonNull_native)
{
  uint64_t v4 = v3;
  uint64_t v47 = sub_1C9E0CFF0();
  uint64_t v8 = *(void (***)(char *, uint64_t))(v47 - 8);
  MEMORY[0x1F4188790](v47);
  uint64_t v46 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2 >> 62)
  {
LABEL_33:
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1C9E0D700();
    if (v10) {
      goto LABEL_3;
    }
LABEL_34:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return a1;
  }
  uint64_t v10 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v10) {
    goto LABEL_34;
  }
LABEL_3:
  id v40 = v4;
  unint64_t v41 = a2;
  os_log_type_t v44 = v8 + 1;
  unint64_t v45 = a2 & 0xC000000000000001;
  uint64_t v11 = 4;
  uint64_t v42 = isUniquelyReferenced_nonNull_native;
  uint64_t v43 = v10;
  while (1)
  {
    uint64_t v4 = (void *)(v11 - 4);
    if (v45) {
      uint64_t v12 = (char *)MEMORY[0x1CB78F680](v11 - 4, a2);
    }
    else {
      uint64_t v12 = (char *)*(id *)(a2 + 8 * v11);
    }
    uint64_t v8 = (void (**)(char *, uint64_t))v12;
    uint64_t v13 = v11 - 3;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
LABEL_30:
      __break(1u);
LABEL_31:
      __break(1u);
LABEL_32:
      __break(1u);
      goto LABEL_33;
    }
    id v14 = objc_msgSend(v12, sel_uniqueIdentifier);
    id v15 = v46;
    sub_1C9E0CFD0();

    uint64_t v16 = sub_1C9E0CFC0();
    uint64_t v18 = v17;
    (*v44)(v15, v47);
    if (!*(void *)(isUniquelyReferenced_nonNull_native + 16) || (unint64_t v19 = sub_1C9DD5CF8(v16, v18), (v20 & 1) == 0))
    {

      swift_bridgeObjectRelease();
      goto LABEL_27;
    }
    a2 = (unint64_t)*(id *)(*(void *)(isUniquelyReferenced_nonNull_native + 56) + 8 * v19);
    swift_bridgeObjectRelease();
    if ((a1 & 0xC000000000000001) != 0)
    {
      if (a1 < 0) {
        uint64_t v4 = (void *)a1;
      }
      else {
        uint64_t v4 = (void *)(a1 & 0xFFFFFFFFFFFFFF8);
      }
      id v21 = (id)a2;
      uint64_t v22 = v8;
      uint64_t v23 = sub_1C9E0D4D0();
      if (__OFADD__(v23, 1)) {
        goto LABEL_31;
      }
      a1 = sub_1C9DFFC00((uint64_t)v4, v23 + 1);
    }
    else
    {
      id v24 = (id)a2;
      BOOL v25 = v8;
    }
    unint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v48 = (void *)a1;
    uint64_t v4 = (void *)a1;
    uint64_t v26 = sub_1C9DD9A04(a2);
    uint64_t v28 = *(void *)(a1 + 16);
    BOOL v29 = (v27 & 1) == 0;
    a1 = v28 + v29;
    if (__OFADD__(v28, v29)) {
      goto LABEL_30;
    }
    unint64_t v30 = v26;
    char v31 = v27;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C7430);
    uint64_t v4 = &v48;
    if (sub_1C9E0D610()) {
      break;
    }
LABEL_22:
    a1 = (uint64_t)v48;
    if (v31)
    {
      uint64_t v34 = v48[7];

      *(void *)(v34 + 8 * v30) = v8;
    }
    else
    {
      v48[(v30 >> 6) + 8] |= 1 << v30;
      *(void *)(*(void *)(a1 + 48) + 8 * v30) = a2;
      *(void *)(*(void *)(a1 + 56) + 8 * v30) = v8;
      uint64_t v35 = *(void *)(a1 + 16);
      BOOL v36 = __OFADD__(v35, 1);
      uint64_t v37 = v35 + 1;
      if (v36) {
        goto LABEL_32;
      }
      *(void *)(a1 + 16) = v37;
      id v38 = (id)a2;
    }

    swift_bridgeObjectRelease();
    a2 = v41;
    unint64_t isUniquelyReferenced_nonNull_native = v42;
LABEL_27:
    ++v11;
    if (v13 == v43) {
      goto LABEL_34;
    }
  }
  uint64_t v4 = v48;
  uint64_t v32 = sub_1C9DD9A04(a2);
  if ((v31 & 1) == (v33 & 1))
  {
    unint64_t v30 = v32;
    goto LABEL_22;
  }
  type metadata accessor for DeviceUnit();
  uint64_t result = sub_1C9E0D830();
  __break(1u);
  return result;
}

uint64_t sub_1C9DF2C60(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  sub_1C9DD7D6C(0, &qword_1EA5C6D90);
  uint64_t v2 = sub_1C9E0D210();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9DF2CE4()
{
  OUTLINED_FUNCTION_7_4();
  *(unsigned char *)(v1 + 80) = v2;
  *(void *)(v1 + 24) = v3;
  *(void *)(v1 + 32) = v0;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 40) = v4;
  void *v4 = v1;
  v4[1] = sub_1C9DF2D74;
  return sub_1C9DFA680();
}

uint64_t sub_1C9DF2D74()
{
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_1_11();
  OUTLINED_FUNCTION_8_4();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 48) = v4;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_21_1();
    return v5();
  }
  else
  {
    OUTLINED_FUNCTION_11_1();
    return MEMORY[0x1F4188298](v7, v8, v9);
  }
}

uint64_t sub_1C9DF2E74()
{
  OUTLINED_FUNCTION_4_2();
  char v1 = *(unsigned char *)(v0 + 80);
  uint64_t v2 = (int8x16_t *)swift_task_alloc();
  OUTLINED_FUNCTION_35_0(v2);
  *(unsigned char *)(v3 + 40) = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C71B0);
  OUTLINED_FUNCTION_16_1();
  void *v4 = v5;
  v4[1] = sub_1C9DF16D4;
  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_29_0();
  return MEMORY[0x1F4188160](v6);
}

uint64_t sub_1C9DF2F58(uint64_t a1, char *a2, uint64_t a3, void *a4, int a5)
{
  int v26 = a5;
  BOOL v25 = a4;
  uint64_t v28 = sub_1C9E0D040();
  uint64_t v31 = *(void *)(v28 - 8);
  MEMORY[0x1F4188790](v28);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1C9E0D060();
  uint64_t v29 = *(void *)(v10 - 8);
  uint64_t v30 = v10;
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA5C7410);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  MEMORY[0x1F4188790](v13);
  uint64_t v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = *(void *)&a2[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_queue];
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a1, v13);
  unint64_t v17 = (*(unsigned __int8 *)(v14 + 80) + 41) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a3;
  *(void *)(v18 + 24) = a2;
  unint64_t v19 = v25;
  *(void *)(v18 + 32) = v25;
  *(unsigned char *)(v18 + 40) = v26;
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v18 + v17, v16, v13);
  aBlock[4] = sub_1C9E01DFC;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C9DDC968;
  aBlock[3] = &block_descriptor_194;
  char v20 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  id v21 = a2;
  id v22 = v19;
  sub_1C9E0D050();
  uint64_t v32 = MEMORY[0x1E4FBC860];
  sub_1C9E01590(&qword_1EA5C6CF8, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D00);
  sub_1C9E0218C(&qword_1EA5C6D08, &qword_1EA5C6D00);
  uint64_t v23 = v28;
  sub_1C9E0D490();
  MEMORY[0x1CB78F460](0, v12, v9, v20);
  _Block_release(v20);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v23);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v12, v30);
  return swift_release();
}

uint64_t sub_1C9DF3314(uint64_t a1, void (*a2)(char *, uint64_t, uint64_t), void (*a3)(uint64_t, char *, uint64_t), int a4, uint64_t a5)
{
  uint64_t v73 = a3;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA5C7410);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1C9E0D010();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  uint64_t v66 = (char *)&v62 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  uint64_t v72 = (char *)&v62 - v18;
  uint64_t v19 = *(void *)(a1 + 16);
  uint64_t v71 = a5;
  uint64_t v70 = v17;
  uint64_t v65 = v11;
  uint64_t v74 = a2;
  if (!v19)
  {
    unint64_t v22 = MEMORY[0x1E4FBC860];
    if (a4) {
      goto LABEL_5;
    }
LABEL_12:
    uint64_t aBlock = v22;
    return sub_1C9E0D280();
  }
  int v63 = a4;
  uint64_t v68 = (char *)&v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = v10;
  uint64_t v67 = v14;
  uint64_t v64 = v9;
  uint64_t v20 = v19;
  swift_bridgeObjectRetain();
  uint64_t v62 = a1;
  id v21 = (uint64_t *)(a1 + 56);
  unint64_t v22 = MEMORY[0x1E4FBC860];
  do
  {
    uint64_t v77 = v20;
    uint64_t v78 = v22;
    uint64_t v23 = *(v21 - 2);
    uint64_t v25 = *(v21 - 1);
    uint64_t v24 = *v21;
    uint64_t v27 = v21[1];
    uint64_t v26 = v21[2];
    uint64_t v29 = v21[3];
    uint64_t v28 = (void (*)(void))v21[4];
    uint64_t v30 = v21[5];
    uint64_t v31 = v21[6];
    uint64_t aBlock = *(v21 - 3);
    uint64_t v80 = v23;
    uint64_t v81 = v25;
    uint64_t v82 = (void *)v24;
    uint64_t v83 = v27;
    uint64_t v84 = v26;
    uint64_t v85 = v29;
    uint64_t v86 = v28;
    uint64_t v75 = v30;
    uint64_t v76 = (void (*)(char *))v28;
    uint64_t v87 = v30;
    uint64_t v88 = v31;
    sub_1C9DEDF70(v23, v25, v24);
    sub_1C9DEDF70(v27, v26, v29);
    sub_1C9DEDF70((uint64_t)v28, v30, v31);
    sub_1C9DFC5F8();
    unint64_t v33 = v32;
    uint64_t aBlock = v78;
    swift_bridgeObjectRetain();
    unint64_t v34 = v33;
    uint64_t v35 = v77;
    sub_1C9DFCCE0(v34);
    sub_1C9DEDFC4(v23, v25, v24);
    sub_1C9DEDFC4(v27, v26, v29);
    sub_1C9DEDFC4((uint64_t)v76, v75, v31);
    swift_bridgeObjectRelease();
    unint64_t v22 = aBlock;
    v21 += 10;
    uint64_t v20 = v35 - 1;
  }
  while (v20);
  swift_bridgeObjectRelease();
  uint64_t v9 = v64;
  a5 = v71;
  uint64_t v13 = v70;
  uint64_t v14 = v67;
  uint64_t v10 = v69;
  uint64_t v12 = v68;
  if ((v63 & 1) == 0) {
    goto LABEL_12;
  }
LABEL_5:
  if (qword_1EA5C6A70 != -1) {
    swift_once();
  }
  uint64_t v36 = __swift_project_value_buffer(v13, (uint64_t)qword_1EA5C98A0);
  uint64_t v76 = *(void (**)(char *))(v14 + 16);
  uint64_t v77 = v36;
  v76(v72);
  swift_bridgeObjectRetain_n();
  uint64_t v37 = sub_1C9E0D000();
  os_log_type_t v38 = sub_1C9E0D310();
  BOOL v39 = os_log_type_enabled(v37, v38);
  uint64_t v78 = v22;
  if (v39)
  {
    uint64_t v68 = v12;
    uint64_t v69 = v10;
    id v40 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v40 = 134217984;
    if (v22 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v41 = sub_1C9E0D700();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v41 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    uint64_t aBlock = v41;
    sub_1C9E0D430();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C9DD3000, v37, v38, "accessories matching description: %ld", v40, 0xCu);
    MEMORY[0x1CB7900C0](v40, -1, -1);
    uint64_t v10 = v69;
    uint64_t v12 = v68;
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  unint64_t v45 = *(void (**)(char *, uint64_t))(v14 + 8);
  uint64_t v43 = v14 + 8;
  os_log_type_t v44 = v45;
  v45(v72, v13);
  id v46 = sub_1C9DEEDB8();
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v67 = v43;
    uint64_t v74 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
    v74(v12, a5, v9);
    uint64_t v48 = v9;
    uint64_t v49 = *(unsigned __int8 *)(v10 + 80);
    uint64_t v50 = v48;
    uint64_t v75 = v49 | 7;
    uint64_t v51 = v10;
    uint64_t v52 = swift_allocObject();
    uint64_t v73 = *(void (**)(uint64_t, char *, uint64_t))(v51 + 32);
    v73(v52 + ((v49 + 16) & ~v49), v12, v50);
    uint64_t v83 = (uint64_t)sub_1C9E01E58;
    uint64_t v84 = v52;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v80 = 1107296256;
    uint64_t v81 = (uint64_t)sub_1C9DEE998;
    uint64_t v82 = &block_descriptor_200;
    uint64_t v53 = _Block_copy(&aBlock);
    swift_release();
    id v54 = objc_msgSend(v47, sel_remoteObjectProxyWithErrorHandler_, v53);
    _Block_release(v53);

    sub_1C9E0D470();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6DE0);
    if (swift_dynamicCast())
    {
      uint64_t v55 = v12;
      uint64_t v56 = (void *)aBlock;
      v74(v55, v71, v50);
      uint64_t v57 = swift_allocObject();
      *(void *)(v57 + 16) = v78;
      v73(v57 + ((v49 + 24) & ~v49), v55, v50);
      uint64_t v83 = (uint64_t)sub_1C9E01EC4;
      uint64_t v84 = v57;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v80 = 1107296256;
      uint64_t v81 = (uint64_t)sub_1C9DF2C60;
      uint64_t v82 = &block_descriptor_206;
      uint64_t v58 = _Block_copy(&aBlock);
      swift_unknownObjectRetain();
      swift_release();
      objc_msgSend(v56, sel_getAllReachableDevicesWithCompletion_, v58);
      _Block_release(v58);
      return swift_unknownObjectRelease_n();
    }
    swift_bridgeObjectRelease();
    uint64_t v13 = v70;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  ((void (*)(char *, uint64_t, uint64_t))v76)(v66, v77, v13);
  char v59 = sub_1C9E0D000();
  os_log_type_t v60 = sub_1C9E0D320();
  if (os_log_type_enabled(v59, v60))
  {
    char v61 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v61 = 0;
    _os_log_impl(&dword_1C9DD3000, v59, v60, "Failed to get remote object", v61, 2u);
    MEMORY[0x1CB7900C0](v61, -1, -1);
  }

  v44(v66, v13);
  sub_1C9E01660();
  uint64_t aBlock = swift_allocError();
  return sub_1C9E0D270();
}

void sub_1C9DF3B84()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = sub_1C9E0D010();
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_6_0();
  if (qword_1EA5C6A70 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v5, (uint64_t)qword_1EA5C98A0);
  OUTLINED_FUNCTION_23_1();
  v9();
  id v10 = v4;
  id v11 = v4;
  uint64_t v12 = sub_1C9E0D000();
  os_log_type_t v13 = sub_1C9E0D320();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 136315138;
    swift_getErrorValue();
    uint64_t v15 = sub_1C9E0D840();
    uint64_t v17 = sub_1C9DE032C(v15, v16, &v18);
    OUTLINED_FUNCTION_54(v17);
    sub_1C9E0D430();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1C9DD3000, v12, v13, "Error reaching remote: %s", v14, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_15();
  }
  else
  {
  }
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0, v5);
  sub_1C9E01660();
  uint64_t v18 = swift_allocError();
  __swift_instantiateConcreteTypeFromMangledName(v2);
  sub_1C9E0D270();
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_1C9DF3DE4(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_1C9E0D700();
    uint64_t v2 = result;
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
  }
  if (!v2)
  {
    uint64_t v5 = (char *)MEMORY[0x1E4FBC860];
LABEL_18:
    swift_bridgeObjectRelease();
    unint64_t v14 = swift_bridgeObjectRetain();
    sub_1C9DF46D0(v14, v5);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA5C7410);
    return sub_1C9E0D280();
  }
  if (v2 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (char *)MEMORY[0x1E4FBC860];
    do
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v6 = (id)MEMORY[0x1CB78F680](v4, a1);
      }
      else {
        id v6 = *(id *)(a1 + 8 * v4 + 32);
      }
      uint64_t v7 = v6;
      uint64_t v8 = sub_1C9E00FF0(v6);
      uint64_t v10 = v9;

      if (v10)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v5 = sub_1C9DFF2F8(0, *((void *)v5 + 2) + 1, 1, (uint64_t)v5);
        }
        unint64_t v12 = *((void *)v5 + 2);
        unint64_t v11 = *((void *)v5 + 3);
        if (v12 >= v11 >> 1) {
          uint64_t v5 = sub_1C9DFF2F8((char *)(v11 > 1), v12 + 1, 1, (uint64_t)v5);
        }
        *((void *)v5 + 2) = v12 + 1;
        os_log_type_t v13 = &v5[16 * v12];
        *((void *)v13 + 4) = v8;
        *((void *)v13 + 5) = v10;
      }
      ++v4;
    }
    while (v2 != v4);
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

uint64_t sub_1C9DF3F88(id *a1, void *a2)
{
  uint64_t v4 = sub_1C9E0D010();
  uint64_t v46 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  unint64_t v45 = (char *)v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_1C9E0CFF0();
  uint64_t v6 = *(void *)(v44 - 8);
  MEMORY[0x1F4188790](v44);
  uint64_t v8 = (char *)v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = *a1;
  id v10 = objc_msgSend(*a1, sel_category);
  id v11 = objc_msgSend(v10, sel_categoryType);

  uint64_t v12 = sub_1C9E0D120();
  uint64_t v14 = v13;

  if (v12 == sub_1C9E0D120() && v14 == v15) {
    int v43 = 1;
  }
  else {
    int v43 = sub_1C9E0D7F0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v17 = objc_msgSend(v9, sel_uniqueIdentifier);
  sub_1C9E0CFD0();

  uint64_t v18 = sub_1C9E0CFC0();
  uint64_t v20 = v19;
  id v21 = *(void (**)(char *, uint64_t))(v6 + 8);
  v21(v8, v44);
  int v42 = sub_1C9DF4444(v18, v20, a2);
  swift_bridgeObjectRelease();
  if (qword_1EA5C6A70 != -1) {
    swift_once();
  }
  uint64_t v22 = __swift_project_value_buffer(v4, (uint64_t)qword_1EA5C98A0);
  uint64_t v24 = v45;
  uint64_t v23 = v46;
  (*(void (**)(char *, uint64_t, uint64_t))(v46 + 16))(v45, v22, v4);
  id v25 = v9;
  uint64_t v26 = sub_1C9E0D000();
  uint64_t v27 = v4;
  os_log_type_t v28 = sub_1C9E0D310();
  if (os_log_type_enabled(v26, v28))
  {
    uint64_t v29 = swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    uint64_t v48 = v40;
    *(_DWORD *)uint64_t v29 = 136315650;
    v39[1] = v29 + 4;
    id v30 = objc_msgSend(v25, sel_uniqueIdentifier);
    uint64_t v41 = v27;
    id v31 = v30;
    sub_1C9E0CFD0();

    uint64_t v32 = sub_1C9E0CFC0();
    unint64_t v34 = v33;
    v21(v8, v44);
    uint64_t v47 = sub_1C9DE032C(v32, v34, &v48);
    sub_1C9E0D430();

    swift_bridgeObjectRelease();
    *(_WORD *)(v29 + 12) = 1024;
    int v35 = v43;
    LODWORD(v47) = v43 & 1;
    sub_1C9E0D430();
    *(_WORD *)(v29 + 18) = 1024;
    int v36 = v42;
    LODWORD(v47) = v42 & 1;
    sub_1C9E0D430();
    _os_log_impl(&dword_1C9DD3000, v26, v28, "accessory %s: isTelevisionDevice=%{BOOL}d, isReachable=%{BOOL}d", (uint8_t *)v29, 0x18u);
    uint64_t v37 = v40;
    swift_arrayDestroy();
    MEMORY[0x1CB7900C0](v37, -1, -1);
    MEMORY[0x1CB7900C0](v29, -1, -1);

    (*(void (**)(char *, uint64_t))(v46 + 8))(v45, v41);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v27);
    int v36 = v42;
    int v35 = v43;
  }
  return (v35 | v36) & 1;
}

uint64_t sub_1C9DF4444(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_1C9E0D7F0();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  id v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_1C9E0D7F0() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1C9DF450C(unint64_t a1)
{
  uint64_t v11 = MEMORY[0x1E4FBC860];
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v4 = (id)MEMORY[0x1CB78F680](v3, a1);
LABEL_7:
        uint64_t v5 = v4;
        unint64_t v6 = v3 + 1;
        if (__OFADD__(v3, 1)) {
          goto LABEL_15;
        }
        id v7 = objc_msgSend(v4, sel_name);
        sub_1C9E0D120();

        sub_1C9DEBDE0();
        uint64_t v8 = sub_1C9E0D460();
        swift_bridgeObjectRelease();
        if (v8)
        {
        }
        else
        {
          sub_1C9E0D5B0();
          sub_1C9E0D5E0();
          sub_1C9E0D5F0();
          sub_1C9E0D5C0();
        }
        ++v3;
        if (v6 == v2)
        {
          uint64_t v9 = v11;
          goto LABEL_18;
        }
      }
      if (v3 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      uint64_t v2 = sub_1C9E0D700();
      if (!v2) {
        goto LABEL_17;
      }
    }
    id v4 = *(id *)(a1 + 8 * v3 + 32);
    goto LABEL_7;
  }
LABEL_17:
  uint64_t v9 = MEMORY[0x1E4FBC860];
LABEL_18:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_1C9DF46D0(unint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v16 = MEMORY[0x1E4FBC860];
  if (a1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v6)
  {
    while (1)
    {
      unint64_t v7 = 0;
      unint64_t v8 = a1 & 0xC000000000000001;
      while (v8)
      {
        id v9 = (id)MEMORY[0x1CB78F680](v7, a1);
LABEL_7:
        id v10 = v9;
        unint64_t v11 = v7 + 1;
        if (__OFADD__(v7, 1)) {
          goto LABEL_17;
        }
        id v15 = v9;
        char v12 = sub_1C9DF3F88(&v15, a2);
        if (v3)
        {
          swift_bridgeObjectRelease();

          uint64_t v13 = v16;
          swift_bridgeObjectRelease();
          swift_release();
          return v13;
        }
        if (v12)
        {
          sub_1C9E0D5B0();
          sub_1C9E0D5E0();
          uint64_t v3 = 0;
          sub_1C9E0D5F0();
          sub_1C9E0D5C0();
          unint64_t v8 = a1 & 0xC000000000000001;
        }
        else
        {
        }
        ++v7;
        if (v11 == v6)
        {
          uint64_t v13 = v16;
          goto LABEL_20;
        }
      }
      if (v7 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      uint64_t v6 = sub_1C9E0D700();
      if (!v6) {
        goto LABEL_19;
      }
    }
    id v9 = *(id *)(a1 + 8 * v7 + 32);
    goto LABEL_7;
  }
LABEL_19:
  uint64_t v13 = MEMORY[0x1E4FBC860];
LABEL_20:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_1C9DF488C(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return OUTLINED_FUNCTION_1_7((uint64_t)sub_1C9DF48A4);
}

uint64_t sub_1C9DF48A4()
{
  OUTLINED_FUNCTION_4_2();
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 40) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 24);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C71C0);
  OUTLINED_FUNCTION_16_1();
  *uint64_t v2 = v3;
  v2[1] = sub_1C9DF4988;
  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_29_0();
  return MEMORY[0x1F4188160](v4);
}

uint64_t sub_1C9DF4988()
{
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_1_11();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_8_4();
  void *v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_5_3();
  void *v6 = v5;
  *(void *)(v3 + 56) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_task_dealloc();
  }
  OUTLINED_FUNCTION_11_1();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

uint64_t sub_1C9DF4A6C(uint64_t a1, unint64_t a2, char *a3)
{
  uint64_t v33 = a1;
  unint64_t v34 = a3;
  uint64_t v4 = sub_1C9E0D040();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1C9E0D060();
  uint64_t v36 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  int v35 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA5C7400);
  uint64_t v10 = *(void *)(v32 - 8);
  MEMORY[0x1F4188790](v32);
  uint64_t v30 = v11;
  id v31 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = MEMORY[0x1E4FBC860];
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_1C9E0D700();
    uint64_t v12 = result;
  }
  else
  {
    uint64_t v12 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
  }
  uint64_t v37 = v7;
  if (!v12)
  {
    swift_bridgeObjectRelease();
    uint64_t v17 = MEMORY[0x1E4FBC860];
LABEL_18:
    uint64_t v18 = v34;
    uint64_t v29 = *(void *)&v34[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_queue];
    uint64_t v19 = v31;
    uint64_t v20 = v32;
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v31, v33, v32);
    unint64_t v21 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = v18;
    *(void *)(v22 + 24) = v17;
    (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v22 + v21, v19, v20);
    aBlock[4] = sub_1C9E01BD8;
    aBlock[5] = v22;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1C9DDC968;
    aBlock[3] = &block_descriptor_180;
    uint64_t v23 = _Block_copy(aBlock);
    id v24 = v18;
    id v25 = v35;
    sub_1C9E0D050();
    uint64_t v40 = MEMORY[0x1E4FBC860];
    sub_1C9E01590(&qword_1EA5C6CF8, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D00);
    sub_1C9E0218C(&qword_1EA5C6D08, &qword_1EA5C6D00);
    uint64_t v26 = v37;
    sub_1C9E0D490();
    MEMORY[0x1CB78F460](0, v25, v26, v23);
    _Block_release(v23);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v26, v4);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v25, v8);
    return swift_release();
  }
  if (v12 >= 1)
  {
    uint64_t v27 = v8;
    uint64_t v28 = v5;
    uint64_t v29 = v4;
    for (uint64_t i = 0; i != v12; ++i)
    {
      if ((a2 & 0xC000000000000001) != 0) {
        id v15 = (id)MEMORY[0x1CB78F680](i, a2);
      }
      else {
        id v15 = *(id *)(a2 + 8 * i + 32);
      }
      uint64_t v16 = v15;
      objc_msgSend(v15, sel_copy, v27, v28);
      sub_1C9E0D470();
      swift_unknownObjectRelease();
      type metadata accessor for CapabilityDescription();
      if ((swift_dynamicCast() & 1) == 0) {
        uint64_t v39 = 0;
      }

      if (v39)
      {
        MEMORY[0x1CB78F2F0]();
        if (*(void *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1C9E0D240();
        }
        sub_1C9E0D250();
        sub_1C9E0D230();
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v17 = v40;
    uint64_t v5 = v28;
    uint64_t v4 = v29;
    uint64_t v8 = v27;
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

uint64_t sub_1C9DF4F84(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA5C7400);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = sub_1C9E0D010();
  uint64_t v67 = *(void *)(v8 - 8);
  uint64_t v68 = v8;
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v58 - v10;
  uint64_t v66 = swift_allocObject();
  *(void *)(v66 + 16) = MEMORY[0x1E4FBC868];
  uint64_t v12 = (void *)sub_1C9DF804C();
  uint64_t v58 = v11;
  os_log_type_t v60 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v61 = v12;
  uint64_t v62 = v6;
  aBlock[0] = MEMORY[0x1E4FBC860];
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_1C9E0D700();
    uint64_t v13 = result;
  }
  else
  {
    uint64_t v13 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
  }
  uint64_t v15 = a3;
  uint64_t v59 = v7;
  uint64_t v64 = v5;
  if (v13)
  {
    if (v13 >= 1)
    {
      uint64_t v63 = a3;
      uint64_t v16 = 0;
      unint64_t v17 = a2 & 0xC000000000000001;
      uint64_t v18 = &OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key;
      uint64_t v19 = &OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueSet;
      uint64_t v65 = (uint8_t *)v13;
      while (1)
      {
        uint64_t v20 = v17 ? (char *)MEMORY[0x1CB78F680](v16, a2) : (char *)*(id *)(a2 + 8 * v16 + 32);
        unint64_t v21 = v20;
        uint64_t v22 = *(void *)&v20[*v19];
        if (v22) {
          break;
        }
        id v25 = (double *)&v20[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueRange];
        if ((v20[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueRange + 16] & 1) == 0)
        {
          double v27 = *v25;
          double v26 = v25[1];
          id v28 = objc_allocWithZone((Class)SVDCapabilityDescription);
          swift_bridgeObjectRetain();
          unint64_t v29 = v17;
          unint64_t v30 = a2;
          id v31 = v19;
          uint64_t v32 = v18;
          uint64_t v33 = (void *)sub_1C9E0D110();
          swift_bridgeObjectRelease();
          id v24 = objc_msgSend(v28, sel_initWithKey_valueRangeWithLowerBound_upperBound_, v33, v27, v26);

          uint64_t v18 = v32;
          uint64_t v19 = v31;
          a2 = v30;
          unint64_t v17 = v29;
          uint64_t v13 = (uint64_t)v65;
LABEL_14:

          if (v24)
          {
            MEMORY[0x1CB78F2F0]();
            if (*(void *)((aBlock[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((aBlock[0] & 0xFFFFFFFFFFFFFF8)
                                                                                    + 0x18) >> 1)
              sub_1C9E0D240();
            sub_1C9E0D250();
            sub_1C9E0D230();
          }
          goto LABEL_18;
        }

LABEL_18:
        if (v13 == ++v16)
        {
          swift_bridgeObjectRelease();
          uint64_t v15 = v63;
          goto LABEL_21;
        }
      }
      swift_bridgeObjectRetain();
      sub_1C9DF58C8(v22);
      id v23 = objc_allocWithZone((Class)SVDCapabilityDescription);
      id v24 = sub_1C9DFE238();
      goto LABEL_14;
    }
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
LABEL_21:
    unint64_t v34 = v58;
    if (qword_1EA5C6A70 != -1) {
      swift_once();
    }
    uint64_t v35 = v68;
    uint64_t v36 = __swift_project_value_buffer(v68, (uint64_t)qword_1EA5C98A0);
    uint64_t v37 = v67;
    (*(void (**)(char *, uint64_t, uint64_t))(v67 + 16))(v34, v36, v35);
    swift_bridgeObjectRetain_n();
    os_log_type_t v38 = sub_1C9E0D000();
    os_log_type_t v39 = sub_1C9E0D310();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      aBlock[0] = v41;
      *(_DWORD *)uint64_t v40 = 136315138;
      uint64_t v65 = v40 + 4;
      uint64_t v42 = sub_1C9DD7D6C(0, &qword_1EA5C73A0);
      uint64_t v43 = swift_bridgeObjectRetain();
      uint64_t v44 = MEMORY[0x1CB78F320](v43, v42);
      unint64_t v46 = v45;
      swift_bridgeObjectRelease();
      uint64_t v69 = sub_1C9DE032C(v44, v46, aBlock);
      sub_1C9E0D430();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C9DD3000, v38, v39, "#hal Calling devicesMatching(:) with descriptions: %s", v40, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1CB7900C0](v41, -1, -1);
      MEMORY[0x1CB7900C0](v40, -1, -1);

      (*(void (**)(char *, uint64_t))(v67 + 8))(v34, v68);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      (*(void (**)(char *, uint64_t))(v37 + 8))(v34, v35);
    }
    uint64_t v47 = v62;
    uint64_t v48 = v60;
    uint64_t v49 = MEMORY[0x1E4FBC868];
    uint64_t v50 = swift_allocObject();
    *(void *)(v50 + 16) = v49;
    sub_1C9DD7D6C(0, &qword_1EA5C73A0);
    uint64_t v51 = (void *)sub_1C9E0D200();
    swift_bridgeObjectRelease();
    uint64_t v52 = v47;
    uint64_t v53 = v64;
    (*(void (**)(char *, uint64_t, uint64_t))(v47 + 16))(v48, v15, v64);
    unint64_t v54 = (*(unsigned __int8 *)(v47 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v47 + 80);
    unint64_t v55 = (v59 + v54 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v56 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v52 + 32))(v56 + v54, v48, v53);
    *(void *)(v56 + v55) = v66;
    *(void *)(v56 + ((v55 + 15) & 0xFFFFFFFFFFFFFFF8)) = v50;
    aBlock[4] = (uint64_t)sub_1C9E01CE8;
    aBlock[5] = v56;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1C9DF6748;
    aBlock[3] = (uint64_t)&block_descriptor_188;
    uint64_t v57 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v61, sel_getDevicesMatchingCapabilityDescriptions_completion_, v51, v57);
    _Block_release(v57);

    swift_release();
    swift_unknownObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_1C9DF58C8(uint64_t a1)
{
  uint64_t v1 = a1;
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (sub_1C9E0D4D0()) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = MEMORY[0x1E4FBC870];
    if (v2) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  if (!*(void *)(a1 + 16)) {
    goto LABEL_6;
  }
LABEL_3:
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C73A8);
  uint64_t v3 = sub_1C9E0D550();
  if (v2)
  {
LABEL_4:
    swift_bridgeObjectRetain();
    swift_retain();
    sub_1C9E0D4C0();
    sub_1C9DD7D6C(0, (unint64_t *)&qword_1EA5C6E30);
    sub_1C9E01814((unint64_t *)&qword_1EA5C7090, (unint64_t *)&qword_1EA5C6E30);
    uint64_t result = sub_1C9E0D2F0();
    uint64_t v1 = v35;
    uint64_t v30 = v36;
    uint64_t v5 = v37;
    int64_t v6 = v38;
    unint64_t v7 = v39;
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v8 = -1 << *(unsigned char *)(v1 + 32);
  uint64_t v30 = v1 + 56;
  uint64_t v5 = ~v8;
  uint64_t v9 = -v8;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v7 = v10 & *(void *)(v1 + 56);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v6 = 0;
LABEL_11:
  int64_t v29 = (unint64_t)(v5 + 64) >> 6;
  uint64_t v11 = v3 + 56;
  if (v1 < 0) {
    goto LABEL_14;
  }
LABEL_12:
  if (v7)
  {
    uint64_t v12 = (v7 - 1) & v7;
    unint64_t v13 = __clz(__rbit64(v7)) | (v6 << 6);
    int64_t v14 = v6;
    goto LABEL_31;
  }
  int64_t v16 = v6 + 1;
  if (!__OFADD__(v6, 1))
  {
    if (v16 >= v29) {
      goto LABEL_44;
    }
    unint64_t v17 = *(void *)(v30 + 8 * v16);
    int64_t v14 = v6 + 1;
    if (!v17)
    {
      int64_t v14 = v6 + 2;
      if (v6 + 2 >= v29) {
        goto LABEL_44;
      }
      unint64_t v17 = *(void *)(v30 + 8 * v14);
      if (!v17)
      {
        int64_t v14 = v6 + 3;
        if (v6 + 3 >= v29) {
          goto LABEL_44;
        }
        unint64_t v17 = *(void *)(v30 + 8 * v14);
        if (!v17)
        {
          int64_t v14 = v6 + 4;
          if (v6 + 4 >= v29) {
            goto LABEL_44;
          }
          unint64_t v17 = *(void *)(v30 + 8 * v14);
          if (!v17)
          {
            int64_t v18 = v6 + 5;
            while (v18 < v29)
            {
              unint64_t v17 = *(void *)(v30 + 8 * v18++);
              if (v17)
              {
                int64_t v14 = v18 - 1;
                goto LABEL_30;
              }
            }
            goto LABEL_44;
          }
        }
      }
    }
LABEL_30:
    uint64_t v12 = (v17 - 1) & v17;
    unint64_t v13 = __clz(__rbit64(v17)) + (v14 << 6);
LABEL_31:
    unint64_t v34 = *(void **)(*(void *)(v1 + 48) + 8 * v13);
    id v19 = v34;
    if (v34)
    {
      int64_t v6 = v14;
      unint64_t v7 = v12;
      while (1)
      {
        sub_1C9DD7D6C(0, (unint64_t *)&qword_1EA5C6E30);
        swift_dynamicCast();
        uint64_t result = sub_1C9E0D510();
        uint64_t v20 = -1 << *(unsigned char *)(v3 + 32);
        unint64_t v21 = result & ~v20;
        unint64_t v22 = v21 >> 6;
        if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) == 0) {
          break;
        }
        unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_42:
        *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
        uint64_t v28 = *(void *)(v3 + 48) + 40 * v23;
        *(_OWORD *)uint64_t v28 = v31;
        *(_OWORD *)(v28 + 16) = v32;
        *(void *)(v28 + 32) = v33;
        ++*(void *)(v3 + 16);
        if ((v1 & 0x8000000000000000) == 0) {
          goto LABEL_12;
        }
LABEL_14:
        uint64_t v15 = sub_1C9E0D4F0();
        if (v15)
        {
          *(void *)&long long v31 = v15;
          sub_1C9DD7D6C(0, (unint64_t *)&qword_1EA5C6E30);
          swift_dynamicCast();
          if (v34) {
            continue;
          }
        }
        goto LABEL_44;
      }
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_42;
        }
      }
      __break(1u);
      goto LABEL_46;
    }
LABEL_44:
    swift_release();
    sub_1C9DD808C();
    return v3;
  }
LABEL_46:
  __break(1u);
  return result;
}

id sub_1C9DF5CF4(double a1, double a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v5 = (void *)sub_1C9E0D110();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithKey_valueRangeWithLowerBound_upperBound_, v5, a1, a2);

  return v6;
}

uint64_t sub_1C9DF5D80(uint64_t a1, uint64_t a2, uint64_t isUniquelyReferenced_nonNull_native, uint64_t a4)
{
  uint64_t v76 = a2;
  unint64_t v7 = sub_1C9E0D010();
  unint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v71 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v13 = (uint64_t)&v71 - v12;
  uint64_t v85 = a4 + 16;
  swift_beginAccess();
  *(void *)(a4 + 16) = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (qword_1EA5C6A70 == -1) {
    goto LABEL_2;
  }
LABEL_53:
  swift_once();
LABEL_2:
  uint64_t v14 = __swift_project_value_buffer(v7, (uint64_t)qword_1EA5C98A0);
  uint64_t v15 = *(void (**)(char *, uint64_t, unint64_t))(v8 + 16);
  uint64_t v74 = v14;
  unint64_t v75 = v8 + 16;
  uint64_t v73 = v15;
  ((void (*)(uint64_t))v15)(v13);
  swift_retain_n();
  int64_t v16 = sub_1C9E0D000();
  os_log_type_t v17 = sub_1C9E0D310();
  BOOL v18 = os_log_type_enabled(v16, v17);
  unint64_t v80 = v7;
  uint64_t v81 = v11;
  uint64_t v79 = isUniquelyReferenced_nonNull_native;
  unint64_t v77 = v8;
  if (v18)
  {
    id v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v84 = swift_slowAlloc();
    v89[0] = v84;
    *(_DWORD *)id v19 = 136315138;
    uint64_t v82 = (uint64_t)(v19 + 4);
    uint64_t v83 = v19;
    uint64_t v20 = v85;
    swift_beginAccess();
    sub_1C9DD7D6C(0, &qword_1EA5C6D90);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C73B0);
    sub_1C9E01814(&qword_1EA5C73B8, &qword_1EA5C6D90);
    uint64_t v21 = sub_1C9E0D0C0();
    unint64_t v23 = v22;
    swift_bridgeObjectRelease();
    v88[0] = sub_1C9DE032C(v21, v23, v89);
    unint64_t isUniquelyReferenced_nonNull_native = v79;
    sub_1C9E0D430();
    swift_release_n();
    uint64_t v11 = v81;
    swift_bridgeObjectRelease();
    char v24 = v83;
    _os_log_impl(&dword_1C9DD3000, v16, v17, "#hal Retrieved matching devices: %s", v83, 0xCu);
    uint64_t v25 = v84;
    swift_arrayDestroy();
    MEMORY[0x1CB7900C0](v25, -1, -1);
    MEMORY[0x1CB7900C0](v24, -1, -1);

    uint64_t v72 = *(void (**)(uint64_t, unint64_t))(v77 + 8);
    v72(v13, v80);
  }
  else
  {

    swift_release_n();
    uint64_t v72 = *(void (**)(uint64_t, unint64_t))(v8 + 8);
    v72(v13, v7);
    uint64_t v20 = v85;
  }
  unint64_t v7 = isUniquelyReferenced_nonNull_native + 16;
  swift_beginAccess();
  uint64_t v26 = *(void *)v20;
  uint64_t v27 = *(void *)(*(void *)v20 + 64);
  uint64_t v82 = *(void *)v20 + 64;
  uint64_t v28 = 1 << *(unsigned char *)(v26 + 32);
  uint64_t v29 = -1;
  if (v28 < 64) {
    uint64_t v29 = ~(-1 << v28);
  }
  unint64_t v8 = v29 & v27;
  uint64_t v83 = (uint8_t *)((unint64_t)(v28 + 63) >> 6);
  swift_bridgeObjectRetain();
  uint64_t v13 = 0;
  uint64_t v78 = v26;
  if (v8)
  {
LABEL_8:
    unint64_t v30 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    uint64_t v85 = v13;
    unint64_t v31 = v30 | (v13 << 6);
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v32 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      goto LABEL_49;
    }
    unint64_t v8 = v80;
    if (v32 >= (uint64_t)v83) {
      break;
    }
    unint64_t v33 = *(void *)(v82 + 8 * v32);
    uint64_t v34 = v13 + 1;
    if (v33) {
      goto LABEL_22;
    }
    uint64_t v34 = v13 + 2;
    if (v13 + 2 >= (uint64_t)v83) {
      break;
    }
    unint64_t v33 = *(void *)(v82 + 8 * v34);
    if (v33) {
      goto LABEL_22;
    }
    uint64_t v34 = v13 + 3;
    if (v13 + 3 >= (uint64_t)v83) {
      break;
    }
    unint64_t v33 = *(void *)(v82 + 8 * v34);
    if (v33) {
      goto LABEL_22;
    }
    uint64_t v35 = v13 + 4;
    if (v13 + 4 >= (uint64_t)v83) {
      break;
    }
    unint64_t v33 = *(void *)(v82 + 8 * v35);
    if (!v33)
    {
      while (1)
      {
        uint64_t v34 = v35 + 1;
        if (__OFADD__(v35, 1)) {
          goto LABEL_52;
        }
        if (v34 >= (uint64_t)v83) {
          goto LABEL_44;
        }
        unint64_t v33 = *(void *)(v82 + 8 * v34);
        ++v35;
        if (v33) {
          goto LABEL_22;
        }
      }
    }
    uint64_t v34 = v13 + 4;
LABEL_22:
    unint64_t v8 = (v33 - 1) & v33;
    uint64_t v85 = v34;
    unint64_t v31 = __clz(__rbit64(v33)) + (v34 << 6);
LABEL_23:
    uint64_t v36 = *(void **)(*(void *)(v26 + 48) + 8 * v31);
    unint64_t v37 = *(void *)(*(void *)(v26 + 56) + 8 * v31);
    type metadata accessor for DeviceUnit();
    id v38 = v36;
    swift_bridgeObjectRetain();
    id v39 = DeviceUnit.__allocating_init(deviceUnitObjC:)(v38);
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = static ObjCCompatibility.capabilities(from:)(v37);
      swift_bridgeObjectRelease();
      if (v41)
      {
        swift_beginAccess();
        uint64_t v13 = *(void *)v7;
        BOOL v42 = (*(void *)v7 & 0xC000000000000001) == 0;
        uint64_t v84 = v41;
        if (v42)
        {
          swift_retain();
          id v45 = v40;
        }
        else
        {
          if (v13 >= 0) {
            v13 &= 0xFFFFFFFFFFFFFF8uLL;
          }
          swift_retain();
          id v43 = v40;
          uint64_t v44 = sub_1C9E0D4D0();
          if (__OFADD__(v44, 1)) {
            goto LABEL_50;
          }
          *(void *)unint64_t v7 = sub_1C9DFFE38(v13, v44 + 1);
        }
        unint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v86 = *(void **)v7;
        uint64_t v13 = (uint64_t)v86;
        unint64_t v46 = (void *)v7;
        *(void *)unint64_t v7 = 0x8000000000000000;
        uint64_t v47 = sub_1C9DD9A04((uint64_t)v40);
        uint64_t v49 = *(void *)(v13 + 16);
        BOOL v50 = (v48 & 1) == 0;
        uint64_t v11 = (char *)(v49 + v50);
        if (__OFADD__(v49, v50))
        {
          __break(1u);
LABEL_49:
          __break(1u);
LABEL_50:
          __break(1u);
LABEL_51:
          __break(1u);
LABEL_52:
          __break(1u);
          goto LABEL_53;
        }
        unint64_t v7 = v47;
        char v51 = v48;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C73C0);
        uint64_t v13 = (uint64_t)&v86;
        char v52 = sub_1C9E0D610();
        uint64_t v11 = v81;
        unint64_t isUniquelyReferenced_nonNull_native = v79;
        if (v52)
        {
          uint64_t v13 = (uint64_t)v86;
          uint64_t v53 = sub_1C9DD9A04((uint64_t)v40);
          if ((v51 & 1) != (v54 & 1))
          {
            uint64_t result = sub_1C9E0D830();
            __break(1u);
            return result;
          }
          unint64_t v7 = v53;
        }
        unint64_t v55 = v86;
        if (v51)
        {
          uint64_t v56 = v86[7];
          swift_release();
          *(void *)(v56 + 8 * v7) = v84;
        }
        else
        {
          v86[(v7 >> 6) + 8] |= 1 << v7;
          *(void *)(v55[6] + 8 * v7) = v40;
          *(void *)(v55[7] + 8 * v7) = v84;
          uint64_t v57 = v55[2];
          BOOL v58 = __OFADD__(v57, 1);
          uint64_t v59 = v57 + 1;
          if (v58) {
            goto LABEL_51;
          }
          v55[2] = v59;
          id v60 = v40;
        }
        unint64_t v7 = (unint64_t)v46;
        *unint64_t v46 = v55;

        swift_bridgeObjectRelease();
        swift_endAccess();
        swift_release();

        uint64_t v26 = v78;
      }
      else
      {
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v13 = v85;

    if (v8) {
      goto LABEL_8;
    }
  }
LABEL_44:
  swift_release();
  v73(v11, v74, v8);
  swift_retain_n();
  id v61 = sub_1C9E0D000();
  os_log_type_t v62 = sub_1C9E0D310();
  if (os_log_type_enabled(v61, v62))
  {
    uint64_t v63 = (uint8_t *)swift_slowAlloc();
    uint64_t v85 = swift_slowAlloc();
    v88[0] = v85;
    *(_DWORD *)uint64_t v63 = 136315138;
    uint64_t v84 = (uint64_t)(v63 + 4);
    swift_beginAccess();
    type metadata accessor for DeviceUnit();
    type metadata accessor for Capabilities();
    sub_1C9E01590(&qword_1EA5C73C8, (void (*)(uint64_t))type metadata accessor for DeviceUnit);
    swift_bridgeObjectRetain();
    uint64_t v64 = sub_1C9E0D0C0();
    unint64_t v66 = v65;
    swift_bridgeObjectRelease();
    uint64_t v87 = sub_1C9DE032C(v64, v66, v88);
    sub_1C9E0D430();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C9DD3000, v61, v62, "#hal Returning transformed results: %s", v63, 0xCu);
    uint64_t v67 = v85;
    swift_arrayDestroy();
    MEMORY[0x1CB7900C0](v67, -1, -1);
    MEMORY[0x1CB7900C0](v63, -1, -1);

    uint64_t v68 = v81;
    unint64_t v69 = v80;
  }
  else
  {

    swift_release_n();
    uint64_t v68 = v11;
    unint64_t v69 = v8;
  }
  v72((uint64_t)v68, v69);
  swift_beginAccess();
  uint64_t v87 = *(void *)v7;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA5C7400);
  return sub_1C9E0D280();
}

uint64_t sub_1C9DF6748(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  sub_1C9DD7D6C(0, &qword_1EA5C6D90);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C73B0);
  sub_1C9E01814(&qword_1EA5C73B8, &qword_1EA5C6D90);
  uint64_t v2 = sub_1C9E0D0B0();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9DF6814(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  return OUTLINED_FUNCTION_1_7((uint64_t)sub_1C9DF6830);
}

uint64_t sub_1C9DF6830()
{
  OUTLINED_FUNCTION_7_2();
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v3 = v0[3];
  id v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  v4[2] = v1;
  v4[3] = v2;
  v4[4] = v3;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[7] = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C71D0);
  OUTLINED_FUNCTION_16_1();
  *uint64_t v5 = v6;
  v5[1] = sub_1C9DF6924;
  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_29_0();
  return MEMORY[0x1F4188160](v7);
}

uint64_t sub_1C9DF6924()
{
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_1_11();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_8_4();
  void *v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_5_3();
  void *v6 = v5;
  *(void *)(v3 + 64) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_task_dealloc();
  }
  OUTLINED_FUNCTION_11_1();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

uint64_t sub_1C9DF6A08()
{
  OUTLINED_FUNCTION_7_4();
  swift_task_dealloc();
  OUTLINED_FUNCTION_21_1();
  return v0();
}

uint64_t sub_1C9DF6A64(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v22 = a3;
  uint64_t v23 = a4;
  uint64_t v6 = sub_1C9E0D040();
  uint64_t v26 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_1C9E0D060();
  uint64_t v9 = *(void *)(v25 - 8);
  MEMORY[0x1F4188790](v25);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C73F8);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = *(void *)&a2[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_queue];
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a1, v12);
  unint64_t v16 = (*(unsigned __int8 *)(v13 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  os_log_type_t v17 = (char *)swift_allocObject();
  uint64_t v18 = v22;
  *((void *)v17 + 2) = a2;
  *((void *)v17 + 3) = v18;
  *((void *)v17 + 4) = v23;
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(&v17[v16], v15, v12);
  aBlock[4] = sub_1C9E01A4C;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C9DDC968;
  aBlock[3] = &block_descriptor_168;
  id v19 = _Block_copy(aBlock);
  uint64_t v20 = a2;
  sub_1C9E0D050();
  uint64_t v27 = MEMORY[0x1E4FBC860];
  sub_1C9E01590(&qword_1EA5C6CF8, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D00);
  sub_1C9E0218C(&qword_1EA5C6D08, &qword_1EA5C6D00);
  sub_1C9E0D490();
  MEMORY[0x1CB78F460](0, v11, v8, v19);
  _Block_release(v19);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v8, v6);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v25);
  return swift_release();
}

uint64_t sub_1C9DF6E08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C73F8);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (void *)sub_1C9DF804C();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&aBlock[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a4, v7);
  unint64_t v11 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a2;
  *(void *)(v12 + 24) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v12 + v11, (char *)&aBlock[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  aBlock[4] = sub_1C9E01AF0;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C9DF2C60;
  aBlock[3] = &block_descriptor_174;
  uint64_t v13 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v10, sel_getAllReachableDevicesWithCompletion_, v13);
  _Block_release(v13);
  return swift_unknownObjectRelease();
}

uint64_t sub_1C9DF6FF4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v15 = MEMORY[0x1E4FBC860];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_1C9E0D700();
    if (v6) {
      goto LABEL_3;
    }
LABEL_15:
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t v10 = MEMORY[0x1E4FBC860];
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v6) {
    goto LABEL_15;
  }
LABEL_3:
  uint64_t result = type metadata accessor for DeviceUnit();
  if (v6 < 1)
  {
    __break(1u);
    goto LABEL_32;
  }
  for (uint64_t i = 0; i != v6; ++i)
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v9 = (id)MEMORY[0x1CB78F680](i, a1);
    }
    else {
      id v9 = *(id *)(a1 + 8 * i + 32);
    }
    if (DeviceUnit.__allocating_init(deviceUnitObjC:)(v9))
    {
      MEMORY[0x1CB78F2F0]();
      if (*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_1C9E0D240();
      }
      sub_1C9E0D250();
      sub_1C9E0D230();
    }
  }
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v10 = v15;
LABEL_16:
  if (!(v10 >> 62))
  {
    uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v11) {
      goto LABEL_18;
    }
LABEL_30:
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C73F8);
    return sub_1C9E0D280();
  }
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_1C9E0D700();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v11) {
    goto LABEL_30;
  }
LABEL_18:
  if (v11 >= 1)
  {
    for (uint64_t j = 0; j != v11; ++j)
    {
      if ((v10 & 0xC000000000000001) != 0) {
        uint64_t v13 = (char *)MEMORY[0x1CB78F680](j, v10);
      }
      else {
        uint64_t v13 = (char *)*(id *)(v10 + 8 * j + 32);
      }
      uint64_t v14 = *(void *)&v13[OBJC_IVAR___SVDDeviceUnitSwift_proximity];
      if (v14 >= a2 && v14 <= a3)
      {
        sub_1C9E0D5B0();
        sub_1C9E0D5E0();
        sub_1C9E0D5F0();
        sub_1C9E0D5C0();
      }
      else
      {
      }
    }
    goto LABEL_30;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_1C9DF7290(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return OUTLINED_FUNCTION_1_7((uint64_t)sub_1C9DF72A8);
}

uint64_t sub_1C9DF72A8()
{
  OUTLINED_FUNCTION_4_2();
  uint64_t v1 = (int8x16_t *)swift_task_alloc();
  *(void *)(v0 + 40) = v1;
  v1[1] = vextq_s8(*(int8x16_t *)(v0 + 24), *(int8x16_t *)(v0 + 24), 8uLL);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C71E0);
  OUTLINED_FUNCTION_16_1();
  *uint64_t v2 = v3;
  v2[1] = sub_1C9DF7390;
  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_29_0();
  return MEMORY[0x1F4188160](v4);
}

uint64_t sub_1C9DF7390()
{
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_1_11();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_8_4();
  void *v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_5_3();
  void *v6 = v5;
  *(void *)(v3 + 56) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_task_dealloc();
  }
  OUTLINED_FUNCTION_11_1();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

uint64_t sub_1C9DF7474()
{
  OUTLINED_FUNCTION_7_4();
  swift_task_dealloc();
  OUTLINED_FUNCTION_21_1();
  return v0();
}

uint64_t sub_1C9DF74D0(uint64_t a1, char *a2, uint64_t a3)
{
  v21[0] = a3;
  uint64_t v5 = sub_1C9E0D040();
  uint64_t v24 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1C9E0D060();
  uint64_t v22 = *(void *)(v8 - 8);
  uint64_t v23 = v8;
  MEMORY[0x1F4188790](v8);
  unint64_t v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C73F0);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21[1] = *(void *)&a2[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_queue];
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  unint64_t v15 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v16 = swift_allocObject();
  uint64_t v17 = v21[0];
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = v17;
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v16 + v15, v14, v11);
  aBlock[4] = sub_1C9E01954;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C9DDC968;
  aBlock[3] = &block_descriptor_156;
  uint64_t v18 = _Block_copy(aBlock);
  id v19 = a2;
  swift_bridgeObjectRetain();
  sub_1C9E0D050();
  uint64_t v25 = MEMORY[0x1E4FBC860];
  sub_1C9E01590(&qword_1EA5C6CF8, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D00);
  sub_1C9E0218C(&qword_1EA5C6D08, &qword_1EA5C6D00);
  sub_1C9E0D490();
  MEMORY[0x1CB78F460](0, v10, v7, v18);
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v5);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v10, v23);
  return swift_release();
}

uint64_t sub_1C9DF7870(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C73F0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (void *)sub_1C9DF804C();
  sub_1C9E0CFF0();
  sub_1C9E01590(&qword_1EA5C73D8, MEMORY[0x1E4F27990]);
  uint64_t v8 = (void *)sub_1C9E0D2B0();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v4);
  unint64_t v9 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v10 + v9, (char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_1C9E01980;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C9DF7F74;
  aBlock[3] = &block_descriptor_162;
  uint64_t v11 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v7, sel_getSourceDeviceForContextWithIdentifiers_completion_, v8, v11);
  _Block_release(v11);

  return swift_unknownObjectRelease();
}

uint64_t sub_1C9DF7AB0(uint64_t a1)
{
  return sub_1C9E0D280();
}

void sub_1C9DF7B04(uint64_t a1)
{
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C73E0);
  MEMORY[0x1F4188790](v48);
  OUTLINED_FUNCTION_55();
  uint64_t v51 = v2;
  uint64_t v4 = MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v43 - v5;
  MEMORY[0x1F4188790](v4);
  uint64_t v47 = (char *)&v43 - v7;
  uint64_t v57 = MEMORY[0x1E4FBC868];
  sub_1C9E00FB8(a1, v53);
  uint64_t v49 = v53[0];
  int64_t v52 = v55;
  unint64_t v8 = v56;
  uint64_t v43 = v54;
  uint64_t v45 = v53[1];
  int64_t v46 = (unint64_t)(v54 + 64) >> 6;
  swift_bridgeObjectRetain();
  for (uint64_t i = v6; ; v6 = i)
  {
    while (1)
    {
      if (v8)
      {
        unint64_t v9 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v10 = v9 | (v52 << 6);
      }
      else
      {
        int64_t v11 = v52 + 1;
        if (__OFADD__(v52, 1)) {
          goto LABEL_36;
        }
        if (v11 >= v46) {
          goto LABEL_34;
        }
        unint64_t v12 = *(void *)(v45 + 8 * v11);
        int64_t v13 = v52 + 1;
        if (!v12)
        {
          int64_t v13 = v52 + 2;
          if (v52 + 2 >= v46) {
            goto LABEL_34;
          }
          unint64_t v12 = *(void *)(v45 + 8 * v13);
          if (!v12)
          {
            int64_t v13 = v52 + 3;
            if (v52 + 3 >= v46) {
              goto LABEL_34;
            }
            unint64_t v12 = *(void *)(v45 + 8 * v13);
            if (!v12)
            {
              int64_t v13 = v52 + 4;
              if (v52 + 4 >= v46) {
                goto LABEL_34;
              }
              unint64_t v12 = *(void *)(v45 + 8 * v13);
              if (!v12)
              {
                int64_t v13 = v52 + 5;
                if (v52 + 5 >= v46) {
                  goto LABEL_34;
                }
                unint64_t v12 = *(void *)(v45 + 8 * v13);
                if (!v12)
                {
                  int64_t v14 = v52 + 6;
                  while (v14 < v46)
                  {
                    unint64_t v12 = *(void *)(v45 + 8 * v14++);
                    if (v12)
                    {
                      int64_t v13 = v14 - 1;
                      goto LABEL_19;
                    }
                  }
LABEL_34:
                  sub_1C9DD808C();
                  return;
                }
              }
            }
          }
        }
LABEL_19:
        unint64_t v8 = (v12 - 1) & v12;
        unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
        int64_t v52 = v13;
      }
      uint64_t v15 = v49;
      uint64_t v16 = *(void *)(v49 + 48);
      uint64_t v17 = sub_1C9E0CFF0();
      OUTLINED_FUNCTION_0_1();
      uint64_t v19 = v18;
      uint64_t v21 = *(void *)(v20 + 72);
      uint64_t v22 = (uint64_t)v47;
      (*(void (**)(char *, unint64_t, uint64_t))(v20 + 16))(v47, v16 + v21 * v10, v17);
      uint64_t v23 = *(void **)(*(void *)(v15 + 56) + 8 * v10);
      uint64_t v24 = v48;
      *(void *)(v22 + *(int *)(v48 + 48)) = v23;
      sub_1C9E0189C(v22, (uint64_t)v6);
      uint64_t v25 = *(void **)&v6[*(int *)(v24 + 48)];
      type metadata accessor for DeviceUnit();
      id v26 = v23;
      id v27 = v25;
      id v28 = DeviceUnit.__allocating_init(deviceUnitObjC:)(v27);
      if (v28) {
        break;
      }
      sub_1C9E026A4((uint64_t)v6, &qword_1EA5C73E0);
    }
    id v29 = v28;
    BOOL v50 = *(void (**)(uint64_t, char *, uint64_t))(v19 + 32);
    v50(v51, v6, v17);
    uint64_t v30 = v57;
    unint64_t v31 = *(void *)(v57 + 16);
    if (*(void *)(v57 + 24) <= v31)
    {
      sub_1C9E005D8(v31 + 1, 1);
      uint64_t v30 = v57;
    }
    sub_1C9E01590(&qword_1EA5C73D8, MEMORY[0x1E4F27990]);
    uint64_t v32 = sub_1C9E0D0F0();
    uint64_t v33 = v30 + 64;
    unint64_t v34 = v32 & ~(-1 << *(unsigned char *)(v30 + 32));
    if (((-1 << v34) & ~*(void *)(v30 + 64 + 8 * (v34 >> 6))) == 0) {
      break;
    }
    unint64_t v35 = __clz(__rbit64((-1 << v34) & ~*(void *)(v30 + 64 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
LABEL_33:
    BOOL v42 = (void (*)(unint64_t, uint64_t, uint64_t))v50;
    uint64_t v41 = v51;
    *(void *)(v33 + ((v35 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v35;
    v42(*(void *)(v30 + 48) + v35 * v21, v41, v17);
    *(void *)(*(void *)(v30 + 56) + 8 * v35) = v29;
    ++*(void *)(v30 + 16);
  }
  OUTLINED_FUNCTION_58();
  while (++v37 != v38 || (v36 & 1) == 0)
  {
    BOOL v39 = v37 == v38;
    if (v37 == v38) {
      uint64_t v37 = 0;
    }
    v36 |= v39;
    uint64_t v40 = *(void *)(v33 + 8 * v37);
    if (v40 != -1)
    {
      unint64_t v35 = __clz(__rbit64(~v40)) + (v37 << 6);
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_36:
  __break(1u);
}

uint64_t sub_1C9DF7F74(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  sub_1C9E0CFF0();
  sub_1C9DD7D6C(0, &qword_1EA5C6D90);
  sub_1C9E01590(&qword_1EA5C73D8, MEMORY[0x1E4F27990]);
  uint64_t v2 = sub_1C9E0D0B0();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9DF804C()
{
  uint64_t v0 = sub_1C9E0D010();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v1);
  id v2 = sub_1C9DEEDB8();
  if (v2)
  {
    uint64_t v3 = v2;
    aBlock[4] = sub_1C9DF82D0;
    aBlock[5] = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1C9DEE998;
    aBlock[3] = &block_descriptor_76_0;
    uint64_t v4 = _Block_copy(aBlock);
    id v5 = objc_msgSend(v3, sel_remoteObjectProxyWithErrorHandler_, v4);
    _Block_release(v4);

    sub_1C9E0D470();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6DE0);
    if (swift_dynamicCast()) {
      return aBlock[0];
    }
  }
  if (qword_1EA5C6A70 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v0, (uint64_t)qword_1EA5C98A0);
  OUTLINED_FUNCTION_23_1();
  v7();
  unint64_t v8 = sub_1C9E0D000();
  os_log_type_t v9 = sub_1C9E0D320();
  if (os_log_type_enabled(v8, v9))
  {
    unint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v10 = 0;
    _os_log_impl(&dword_1C9DD3000, v8, v9, "Failed to get remote object", v10, 2u);
    MEMORY[0x1CB7900C0](v10, -1, -1);
  }

  uint64_t v11 = OUTLINED_FUNCTION_60();
  v12(v11);
  sub_1C9E01660();
  swift_allocError();
  return swift_willThrow();
}

void sub_1C9DF82D4()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  sub_1C9E0D040();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v10);
  uint64_t v20 = OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_1();
  uint64_t v12 = v11;
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_6_0();
  int64_t v14 = (void *)swift_allocObject();
  v14[2] = v0;
  v14[3] = v5;
  v14[4] = v3;
  v14[5] = v7;
  v14[6] = v9;
  v21[4] = sub_1C9DFA7EC;
  v21[5] = v14;
  v21[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_20(COERCE_DOUBLE(1107296256));
  void v21[2] = sub_1C9DDC968;
  v21[3] = &block_descriptor_32;
  uint64_t v15 = _Block_copy(v21);
  id v16 = v0;
  swift_retain();
  sub_1C9E0D050();
  sub_1C9E01590(&qword_1EA5C6CF8, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D00);
  sub_1C9E0218C(&qword_1EA5C6D08, &qword_1EA5C6D00);
  OUTLINED_FUNCTION_9();
  uint64_t v17 = OUTLINED_FUNCTION_19();
  MEMORY[0x1CB78F460](v17);
  _Block_release(v15);
  uint64_t v18 = OUTLINED_FUNCTION_60();
  v19(v18);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v1, v20);
  swift_release();
  OUTLINED_FUNCTION_7_0();
}

void sub_1C9DF84FC(uint64_t a1, void (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = sub_1C9E0D010();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&aBlock - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = sub_1C9DEEDB8();
  if (!v13) {
    goto LABEL_4;
  }
  int64_t v14 = v13;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a2;
  *(void *)(v15 + 24) = a3;
  id v29 = sub_1C9E01904;
  uint64_t v30 = (void *)v15;
  uint64_t aBlock = (void *)MEMORY[0x1E4F143A8];
  uint64_t v26 = 1107296256;
  id v27 = sub_1C9DEE998;
  id v28 = &block_descriptor_144;
  id v16 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  id v17 = objc_msgSend(v14, sel_remoteObjectProxyWithErrorHandler_, v16);
  _Block_release(v16);

  sub_1C9E0D470();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6DE0);
  if (swift_dynamicCast())
  {
    uint64_t v18 = aBlock;
    uint64_t v19 = (void *)swift_allocObject();
    v19[2] = a2;
    v19[3] = a3;
    v19[4] = a4;
    v19[5] = a5;
    id v29 = sub_1C9E0193C;
    uint64_t v30 = v19;
    uint64_t aBlock = (void *)MEMORY[0x1E4F143A8];
    uint64_t v26 = 1107296256;
    id v27 = sub_1C9DF2C60;
    id v28 = &block_descriptor_150;
    uint64_t v20 = _Block_copy(&aBlock);
    swift_retain();
    swift_unknownObjectRetain();
    swift_release();
    objc_msgSend(v18, sel_getAllReachableDevicesWithCompletion_, v20);
    swift_unknownObjectRelease_n();
    _Block_release(v20);
  }
  else
  {
LABEL_4:
    if (qword_1EA5C6A70 != -1) {
      swift_once();
    }
    uint64_t v21 = __swift_project_value_buffer(v9, (uint64_t)qword_1EA5C98A0);
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v21, v9);
    uint64_t v22 = sub_1C9E0D000();
    os_log_type_t v23 = sub_1C9E0D320();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_1C9DD3000, v22, v23, "Failed to get remote object", v24, 2u);
      MEMORY[0x1CB7900C0](v24, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    a2(MEMORY[0x1E4FBC860]);
  }
}

uint64_t sub_1C9DF88A0(void *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t v6 = sub_1C9E0D010();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EA5C6A70 != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v6, (uint64_t)qword_1EA5C98A0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  id v11 = a1;
  id v12 = a1;
  id v13 = sub_1C9E0D000();
  os_log_type_t v14 = sub_1C9E0D320();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    os_log_type_t v23 = a2;
    id v16 = (uint8_t *)v15;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v25 = v17;
    v22[2] = a3;
    *(_DWORD *)id v16 = 136315138;
    v22[1] = v16 + 4;
    swift_getErrorValue();
    uint64_t v18 = sub_1C9E0D840();
    uint64_t v24 = sub_1C9DE032C(v18, v19, &v25);
    sub_1C9E0D430();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1C9DD3000, v13, v14, "Error reaching remote: %s", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1CB7900C0](v17, -1, -1);
    uint64_t v20 = v16;
    a2 = v23;
    MEMORY[0x1CB7900C0](v20, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return a2(MEMORY[0x1E4FBC860]);
}

uint64_t sub_1C9DF8B44(unint64_t a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = MEMORY[0x1E4FBC860];
  unint64_t v20 = MEMORY[0x1E4FBC860];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1C9E0D700();
    if (v9) {
      goto LABEL_3;
    }
LABEL_15:
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t v13 = MEMORY[0x1E4FBC860];
    goto LABEL_16;
  }
  uint64_t v9 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v9) {
    goto LABEL_15;
  }
LABEL_3:
  uint64_t result = type metadata accessor for DeviceUnit();
  if (v9 < 1)
  {
    __break(1u);
    goto LABEL_35;
  }
  for (uint64_t i = 0; i != v9; ++i)
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v12 = (id)MEMORY[0x1CB78F680](i, a1);
    }
    else {
      id v12 = *(id *)(a1 + 8 * i + 32);
    }
    if (DeviceUnit.__allocating_init(deviceUnitObjC:)(v12))
    {
      MEMORY[0x1CB78F2F0]();
      if (*(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_1C9E0D240();
      }
      sub_1C9E0D250();
      sub_1C9E0D230();
    }
  }
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v13 = v20;
  uint64_t v8 = MEMORY[0x1E4FBC860];
LABEL_16:
  if (v13 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_1C9E0D700();
    uint64_t result = swift_bridgeObjectRelease();
    if (v14)
    {
LABEL_18:
      if (v14 >= 1)
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if ((v13 & 0xC000000000000001) != 0) {
            id v16 = (char *)MEMORY[0x1CB78F680](j, v13);
          }
          else {
            id v16 = (char *)*(id *)(v13 + 8 * j + 32);
          }
          uint64_t v17 = *(void *)&v16[OBJC_IVAR___SVDDeviceUnitSwift_proximity];
          if (v17 >= a4 && v17 <= a5)
          {
            sub_1C9E0D5B0();
            sub_1C9E0D5E0();
            sub_1C9E0D5F0();
            sub_1C9E0D5C0();
          }
          else
          {
          }
        }
        swift_bridgeObjectRelease();
        uint64_t v18 = v8;
        goto LABEL_31;
      }
LABEL_35:
      __break(1u);
      return result;
    }
  }
  else
  {
    uint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v14) {
      goto LABEL_18;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v18 = MEMORY[0x1E4FBC860];
LABEL_31:
  a2(v18);
  return swift_release();
}

void sub_1C9DF8DE4()
{
}

uint64_t sub_1C9DF8E0C(uint64_t a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v5 = sub_1C9E0D010();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = sub_1C9DEEDB8();
  if (!v9) {
    goto LABEL_4;
  }
  uint64_t v10 = v9;
  uint64_t v26 = sub_1C9DF82D0;
  uint64_t v27 = 0;
  uint64_t aBlock = (void *)MEMORY[0x1E4F143A8];
  uint64_t v23 = 1107296256;
  uint64_t v24 = sub_1C9DEE998;
  uint64_t v25 = &block_descriptor_132;
  id v11 = _Block_copy(&aBlock);
  id v12 = objc_msgSend(v10, sel_remoteObjectProxyWithErrorHandler_, v11);
  _Block_release(v11);

  sub_1C9E0D470();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6DE0);
  if (swift_dynamicCast())
  {
    unint64_t v13 = aBlock;
    sub_1C9E0CFF0();
    sub_1C9E01590(&qword_1EA5C73D8, MEMORY[0x1E4F27990]);
    swift_unknownObjectRetain();
    uint64_t v14 = (void *)sub_1C9E0D2B0();
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = a2;
    *(void *)(v15 + 24) = a3;
    uint64_t v26 = sub_1C9E01894;
    uint64_t v27 = v15;
    uint64_t aBlock = (void *)MEMORY[0x1E4F143A8];
    uint64_t v23 = 1107296256;
    uint64_t v24 = sub_1C9DF7F74;
    uint64_t v25 = &block_descriptor_138;
    id v16 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v13, sel_getSourceDeviceForContextWithIdentifiers_completion_, v14, v16);
    _Block_release(v16);

    return swift_unknownObjectRelease_n();
  }
  else
  {
LABEL_4:
    if (qword_1EA5C6A70 != -1) {
      swift_once();
    }
    uint64_t v18 = __swift_project_value_buffer(v5, (uint64_t)qword_1EA5C98A0);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v18, v5);
    unint64_t v19 = sub_1C9E0D000();
    os_log_type_t v20 = sub_1C9E0D320();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_1C9DD3000, v19, v20, "Failed to get remote object", v21, 2u);
      MEMORY[0x1CB7900C0](v21, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_1C9E0CFF0();
    type metadata accessor for DeviceUnit();
    sub_1C9E01590(&qword_1EA5C73D8, MEMORY[0x1E4F27990]);
    sub_1C9E0D0D0();
    a2();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1C9DF9244(uint64_t a1, void (*a2)(void))
{
  sub_1C9DF7B04(a1);
  a2();
  return swift_bridgeObjectRelease();
}

void sub_1C9DF92A0()
{
}

void sub_1C9DF92C8()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v21 = v3;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  sub_1C9E0D040();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v12);
  uint64_t v22 = OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_1();
  uint64_t v14 = v13;
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_6_0();
  id v16 = (void *)swift_allocObject();
  v16[2] = v0;
  void v16[3] = v9;
  v16[4] = v7;
  v16[5] = v11;
  v23[4] = v5;
  v23[5] = v16;
  v23[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_20(COERCE_DOUBLE(1107296256));
  v23[2] = sub_1C9DDC968;
  v23[3] = v21;
  uint64_t v17 = _Block_copy(v23);
  id v18 = v0;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1C9E0D050();
  sub_1C9E01590(&qword_1EA5C6CF8, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D00);
  sub_1C9E0218C(&qword_1EA5C6D08, &qword_1EA5C6D00);
  sub_1C9E0D490();
  MEMORY[0x1CB78F460](0, v2, v1, v17);
  _Block_release(v17);
  uint64_t v19 = OUTLINED_FUNCTION_22_1();
  v20(v19);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v2, v22);
  swift_release();
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_1C9DF9500(uint64_t a1, void (*a2)(uint64_t), uint64_t a3, unint64_t a4)
{
  uint64_t v7 = sub_1C9E0D010();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = MEMORY[0x1E4FBC868];
  id v12 = sub_1C9DEEDB8();
  if (!v12) {
    goto LABEL_21;
  }
  uint64_t v13 = v12;
  int64_t v46 = sub_1C9DF82D0;
  uint64_t v47 = 0;
  unint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v43 = 1107296256;
  uint64_t v44 = sub_1C9DEE998;
  uint64_t v45 = &block_descriptor_120;
  uint64_t v14 = _Block_copy(&aBlock);
  id v15 = objc_msgSend(v13, sel_remoteObjectProxyWithErrorHandler_, v14);
  _Block_release(v14);

  sub_1C9E0D470();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6DE0);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_21:
    if (qword_1EA5C6A70 != -1) {
      swift_once();
    }
    uint64_t v29 = __swift_project_value_buffer(v7, (uint64_t)qword_1EA5C98A0);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v29, v7);
    uint64_t v30 = sub_1C9E0D000();
    os_log_type_t v31 = sub_1C9E0D320();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v32 = 0;
      _os_log_impl(&dword_1C9DD3000, v30, v31, "Failed to get remote object", v32, 2u);
      MEMORY[0x1CB7900C0](v32, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    uint64_t v33 = swift_bridgeObjectRetain();
    a2(v33);
    swift_bridgeObjectRelease();
    return swift_release();
  }
  id v16 = (void *)aBlock;
  unint64_t aBlock = MEMORY[0x1E4FBC860];
  if (a4 >> 62)
  {
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = sub_1C9E0D700();
    uint64_t v17 = result;
    if (result) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
  uint64_t v17 = *(void *)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_unknownObjectRetain();
  uint64_t result = swift_bridgeObjectRetain();
  if (!v17)
  {
LABEL_27:
    swift_bridgeObjectRelease();
LABEL_28:
    uint64_t v34 = swift_allocObject();
    *(void *)(v34 + 16) = MEMORY[0x1E4FBC868];
    sub_1C9DD7D6C(0, &qword_1EA5C73A0);
    unint64_t v35 = (void *)sub_1C9E0D200();
    swift_bridgeObjectRelease();
    char v36 = (void *)swift_allocObject();
    v36[2] = a2;
    v36[3] = a3;
    v36[4] = v11;
    v36[5] = v34;
    int64_t v46 = sub_1C9E01808;
    uint64_t v47 = v36;
    unint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v43 = 1107296256;
    uint64_t v44 = sub_1C9DF6748;
    uint64_t v45 = &block_descriptor_129;
    uint64_t v37 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v16, sel_getDevicesMatchingCapabilityDescriptions_completion_, v35, v37);
    _Block_release(v37);

    swift_release();
    swift_unknownObjectRelease_n();
    return swift_release();
  }
LABEL_5:
  uint64_t v38 = v16;
  BOOL v39 = a2;
  uint64_t v40 = a3;
  uint64_t v41 = v11;
  if (v17 >= 1)
  {
    uint64_t v19 = 0;
    while (1)
    {
      os_log_type_t v20 = (a4 & 0xC000000000000001) != 0
          ? (char *)MEMORY[0x1CB78F680](v19, a4)
          : (char *)*(id *)(a4 + 8 * v19 + 32);
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)&v20[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueSet];
      if (v22) {
        break;
      }
      uint64_t v25 = (double *)&v20[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueRange];
      if ((v20[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueRange + 16] & 1) == 0)
      {
        double v27 = *v25;
        double v26 = v25[1];
        sub_1C9DD7D6C(0, &qword_1EA5C73A0);
        swift_bridgeObjectRetain();
        id v24 = sub_1C9DF5CF4(v27, v26);
LABEL_15:
        id v28 = v24;

        if (v28)
        {
          MEMORY[0x1CB78F2F0]();
          if (*(void *)((aBlock & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((aBlock & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_1C9E0D240();
          }
          sub_1C9E0D250();
          sub_1C9E0D230();
        }
        goto LABEL_19;
      }

LABEL_19:
      if (v17 == ++v19)
      {
        swift_bridgeObjectRelease();
        uint64_t v11 = v41;
        a2 = v39;
        a3 = v40;
        id v16 = v38;
        goto LABEL_28;
      }
    }
    swift_bridgeObjectRetain();
    sub_1C9DF58C8(v22);
    id v23 = objc_allocWithZone((Class)SVDCapabilityDescription);
    id v24 = sub_1C9DFE238();
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

void sub_1C9DF9B08()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v1 = v0;
  uint64_t v2 = sub_1C9E0D010();
  OUTLINED_FUNCTION_0_1();
  uint64_t v4 = v3;
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EA5C6A70 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v2, (uint64_t)qword_1EA5C98A0);
  OUTLINED_FUNCTION_23_1();
  v8();
  id v9 = v1;
  id v10 = v1;
  uint64_t v11 = sub_1C9E0D000();
  os_log_type_t v12 = sub_1C9E0D320();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315138;
    v17[1] = v13 + 4;
    swift_getErrorValue();
    uint64_t v14 = sub_1C9E0D840();
    uint64_t v16 = sub_1C9DE032C(v14, v15, &v18);
    OUTLINED_FUNCTION_54(v16);
    sub_1C9E0D430();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1C9DD3000, v11, v12, "Error reaching remote: %s", v13, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_15();
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v2);
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_1C9DF9D2C(uint64_t a1, uint64_t isUniquelyReferenced_nonNull_native, uint64_t a3, unint64_t a4, id a5)
{
  uint64_t v71 = a3;
  uint64_t v8 = sub_1C9E0D010();
  unint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  os_log_type_t v12 = (char *)&v66 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  uint64_t v14 = (uint64_t *)((char *)&v66 - v13);
  if (qword_1EA5C6A70 == -1) {
    goto LABEL_2;
  }
LABEL_54:
  swift_once();
LABEL_2:
  uint64_t v81 = (uint64_t)a5 + 16;
  uint64_t v15 = __swift_project_value_buffer(v8, (uint64_t)qword_1EA5C98A0);
  uint64_t v16 = *(void (**)(unint64_t, uint64_t, uint64_t))(v9 + 16);
  uint64_t v69 = v15;
  uint64_t v70 = (uint64_t *)(v9 + 16);
  uint64_t v68 = v16;
  ((void (*)(void *))v16)(v14);
  swift_retain_n();
  uint64_t v17 = sub_1C9E0D000();
  os_log_type_t v18 = sub_1C9E0D310();
  BOOL v19 = os_log_type_enabled(v17, v18);
  unint64_t v77 = v12;
  uint64_t v72 = (void (*)(uint64_t))isUniquelyReferenced_nonNull_native;
  uint64_t v73 = v8;
  unint64_t v74 = a4;
  unint64_t v75 = v9;
  if (v19)
  {
    os_log_type_t v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v80 = swift_slowAlloc();
    v85[0] = v80;
    *(_DWORD *)os_log_type_t v20 = 136315138;
    uint64_t v78 = (uint64_t)(v20 + 4);
    uint64_t v79 = v20;
    swift_beginAccess();
    os_log_type_t v12 = (char *)sub_1C9DD7D6C(0, &qword_1EA5C6D90);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C73B0);
    sub_1C9E01814(&qword_1EA5C73B8, &qword_1EA5C6D90);
    uint64_t v21 = sub_1C9E0D0C0();
    unint64_t v23 = v22;
    swift_bridgeObjectRelease();
    v84[0] = sub_1C9DE032C(v21, v23, v85);
    a4 = v74;
    sub_1C9E0D430();
    swift_release_n();
    swift_bridgeObjectRelease();
    id v24 = v79;
    _os_log_impl(&dword_1C9DD3000, v17, v18, "#hal Retrieved matching devices: %s", v79, 0xCu);
    a5 = (id)v80;
    swift_arrayDestroy();
    MEMORY[0x1CB7900C0](a5, -1, -1);
    MEMORY[0x1CB7900C0](v24, -1, -1);

    uint64_t v67 = *(void (**)(void *, uint64_t))(v75 + 8);
  }
  else
  {

    swift_release_n();
    uint64_t v67 = *(void (**)(void *, uint64_t))(v9 + 8);
  }
  v67(v14, v8);
  unint64_t v9 = a4 + 16;
  unint64_t isUniquelyReferenced_nonNull_native = v81;
  swift_beginAccess();
  uint64_t v8 = *(void *)isUniquelyReferenced_nonNull_native;
  uint64_t v25 = *(void *)(*(void *)isUniquelyReferenced_nonNull_native + 64);
  uint64_t v78 = *(void *)isUniquelyReferenced_nonNull_native + 64;
  uint64_t v26 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v27 = -1;
  if (v26 < 64) {
    uint64_t v27 = ~(-1 << v26);
  }
  a4 = v27 & v25;
  uint64_t v79 = (uint8_t *)((unint64_t)(v26 + 63) >> 6);
  swift_bridgeObjectRetain();
  uint64_t v28 = 0;
  uint64_t v76 = v8;
  if (a4)
  {
LABEL_8:
    unint64_t v29 = __clz(__rbit64(a4));
    a4 &= a4 - 1;
    unint64_t v30 = v29 | (v28 << 6);
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v31 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      goto LABEL_50;
    }
    a4 = (unint64_t)v77;
    if (v31 >= (uint64_t)v79) {
      break;
    }
    unint64_t v32 = *(void *)(v78 + 8 * v31);
    ++v28;
    if (v32) {
      goto LABEL_22;
    }
    uint64_t v28 = v31 + 1;
    if (v31 + 1 >= (uint64_t)v79) {
      break;
    }
    unint64_t v32 = *(void *)(v78 + 8 * v28);
    if (v32) {
      goto LABEL_22;
    }
    uint64_t v28 = v31 + 2;
    if (v31 + 2 >= (uint64_t)v79) {
      break;
    }
    unint64_t v32 = *(void *)(v78 + 8 * v28);
    if (v32) {
      goto LABEL_22;
    }
    uint64_t v33 = v31 + 3;
    if (v33 >= (uint64_t)v79) {
      break;
    }
    unint64_t v32 = *(void *)(v78 + 8 * v33);
    if (!v32)
    {
      while (1)
      {
        uint64_t v28 = v33 + 1;
        if (__OFADD__(v33, 1)) {
          goto LABEL_53;
        }
        if (v28 >= (uint64_t)v79) {
          goto LABEL_45;
        }
        unint64_t v32 = *(void *)(v78 + 8 * v28);
        ++v33;
        if (v32) {
          goto LABEL_22;
        }
      }
    }
    uint64_t v28 = v33;
LABEL_22:
    a4 = (v32 - 1) & v32;
    unint64_t v30 = __clz(__rbit64(v32)) + (v28 << 6);
LABEL_23:
    unint64_t isUniquelyReferenced_nonNull_native = *(void *)(*(void *)(v8 + 48) + 8 * v30);
    unint64_t v34 = *(void *)(*(void *)(v8 + 56) + 8 * v30);
    uint64_t v14 = (void *)type metadata accessor for DeviceUnit();
    a5 = (id)isUniquelyReferenced_nonNull_native;
    swift_bridgeObjectRetain();
    uint64_t v80 = (uint64_t)v14;
    id v35 = DeviceUnit.__allocating_init(deviceUnitObjC:)(a5);
    if (v35)
    {
      char v36 = v35;
      uint64_t v81 = v28;
      uint64_t v37 = static ObjCCompatibility.capabilities(from:)(v34);
      swift_bridgeObjectRelease();
      if (v37)
      {
        swift_beginAccess();
        unint64_t isUniquelyReferenced_nonNull_native = *(void *)v9;
        if ((*(void *)v9 & 0xC000000000000001) != 0)
        {
          if (isUniquelyReferenced_nonNull_native >= 0) {
            isUniquelyReferenced_nonNull_native &= 0xFFFFFFFFFFFFFF8uLL;
          }
          swift_retain();
          id v38 = v36;
          uint64_t v39 = sub_1C9E0D4D0();
          if (__OFADD__(v39, 1)) {
            goto LABEL_51;
          }
          *(void *)unint64_t v9 = sub_1C9DFFE38(isUniquelyReferenced_nonNull_native, v39 + 1);
        }
        else
        {
          swift_retain();
          id v40 = v36;
        }
        unint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v83 = *(void **)v9;
        uint64_t v14 = v83;
        uint64_t v8 = v9;
        *(void *)unint64_t v9 = 0x8000000000000000;
        uint64_t v41 = sub_1C9DD9A04((uint64_t)v36);
        uint64_t v43 = v14[2];
        BOOL v44 = (v42 & 1) == 0;
        os_log_type_t v12 = (char *)(v43 + v44);
        if (__OFADD__(v43, v44))
        {
          __break(1u);
LABEL_50:
          __break(1u);
LABEL_51:
          __break(1u);
LABEL_52:
          __break(1u);
LABEL_53:
          __break(1u);
          goto LABEL_54;
        }
        unint64_t v9 = v41;
        char v45 = v42;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C73C0);
        if (sub_1C9E0D610())
        {
          uint64_t v46 = sub_1C9DD9A04((uint64_t)v36);
          if ((v45 & 1) != (v47 & 1))
          {
            uint64_t result = sub_1C9E0D830();
            __break(1u);
            return result;
          }
          unint64_t v9 = v46;
        }
        uint64_t v14 = v83;
        if (v45)
        {
          uint64_t v48 = v83[7];
          swift_release();
          *(void *)(v48 + 8 * v9) = v37;
        }
        else
        {
          v83[(v9 >> 6) + 8] |= 1 << v9;
          *(void *)(v14[6] + 8 * v9) = v36;
          *(void *)(v14[7] + 8 * v9) = v37;
          uint64_t v49 = v14[2];
          BOOL v50 = __OFADD__(v49, 1);
          uint64_t v51 = v49 + 1;
          if (v50) {
            goto LABEL_52;
          }
          v14[2] = v51;
          id v52 = v36;
        }
        unint64_t v9 = v8;
        unint64_t isUniquelyReferenced_nonNull_native = *(void *)v8;
        *(void *)uint64_t v8 = v14;

        swift_bridgeObjectRelease();
        swift_endAccess();
        swift_release();

        uint64_t v8 = v76;
      }
      else
      {
      }
      uint64_t v28 = v81;
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    if (a4) {
      goto LABEL_8;
    }
  }
LABEL_45:
  swift_release();
  uint64_t v53 = v73;
  v68(a4, v69, v73);
  swift_retain_n();
  uint64_t v54 = sub_1C9E0D000();
  os_log_type_t v55 = sub_1C9E0D310();
  if (os_log_type_enabled(v54, v55))
  {
    unint64_t v56 = (uint8_t *)swift_slowAlloc();
    uint64_t v81 = swift_slowAlloc();
    v84[0] = v81;
    *(_DWORD *)unint64_t v56 = 136315138;
    uint64_t v80 = (uint64_t)(v56 + 4);
    swift_beginAccess();
    type metadata accessor for DeviceUnit();
    type metadata accessor for Capabilities();
    sub_1C9E01590(&qword_1EA5C73C8, (void (*)(uint64_t))type metadata accessor for DeviceUnit);
    swift_bridgeObjectRetain();
    uint64_t v57 = sub_1C9E0D0C0();
    unint64_t v59 = v58;
    swift_bridgeObjectRelease();
    uint64_t v82 = sub_1C9DE032C(v57, v59, v84);
    sub_1C9E0D430();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C9DD3000, v54, v55, "#hal Returning transformed results: %s", v56, 0xCu);
    uint64_t v60 = v81;
    swift_arrayDestroy();
    MEMORY[0x1CB7900C0](v60, -1, -1);
    MEMORY[0x1CB7900C0](v56, -1, -1);

    unint64_t v61 = (unint64_t)v77;
    uint64_t v62 = v73;
  }
  else
  {

    swift_release_n();
    unint64_t v61 = a4;
    uint64_t v62 = v53;
  }
  v67((void *)v61, v62);
  uint64_t v63 = v72;
  swift_beginAccess();
  uint64_t v64 = swift_bridgeObjectRetain();
  v63(v64);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9DFA680()
{
  *(void *)(v1 + 24) = v0;
  return OUTLINED_FUNCTION_1_7((uint64_t)sub_1C9DFA698);
}

uint64_t sub_1C9DFA698()
{
  OUTLINED_FUNCTION_4_2();
  uint64_t v1 = OUTLINED_FUNCTION_40_0();
  OUTLINED_FUNCTION_43_0(v1);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v2;
  sub_1C9DD7D6C(0, &qword_1EA5C7440);
  OUTLINED_FUNCTION_16_1();
  *uint64_t v2 = v3;
  v2[1] = sub_1C9DF0E24;
  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_29_0();
  return MEMORY[0x1F4188160]();
}

uint64_t sub_1C9DFA774(uint64_t a1)
{
  return sub_1C9DF1874(a1, *(char **)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_1C9DFA780(uint64_t a1)
{
  return sub_1C9DF2F58(a1, *(char **)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32), *(unsigned __int8 *)(v1 + 40));
}

uint64_t sub_1C9DFA790(uint64_t a1)
{
  return sub_1C9DF4A6C(a1, *(void *)(v1 + 16), *(char **)(v1 + 24));
}

uint64_t sub_1C9DFA798(uint64_t a1)
{
  return sub_1C9DF6A64(a1, *(char **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_1C9DFA7A4(uint64_t a1)
{
  return sub_1C9DF74D0(a1, *(char **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_1C9DFA7AC()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

void sub_1C9DFA7EC()
{
  sub_1C9DF84FC(*(void *)(v0 + 16), *(void (**)(void))(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48));
}

uint64_t sub_1C9DFA800()
{
  return sub_1C9DF8E0C(*(void *)(v0 + 16), *(void (**)(void))(v0 + 24), *(void *)(v0 + 32));
}

uint64_t objectdestroy_34Tm()
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = OUTLINED_FUNCTION_46_0();
  return MEMORY[0x1F4186498](v1, v2, v3);
}

uint64_t sub_1C9DFA850()
{
  return sub_1C9DF9500(*(void *)(v0 + 16), *(void (**)(uint64_t))(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

void sub_1C9DFA85C()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v31 = v2;
  v28[1] = v3;
  uint64_t v29 = v4;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  sub_1C9E0D040();
  OUTLINED_FUNCTION_0_1();
  uint64_t v33 = v9;
  MEMORY[0x1F4188790](v10);
  uint64_t v32 = OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_1();
  uint64_t v12 = v11;
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_6_0();
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(v6);
  OUTLINED_FUNCTION_0_1();
  uint64_t v16 = v15;
  uint64_t v18 = *(void *)(v17 + 64);
  MEMORY[0x1F4188790](v19);
  os_log_type_t v20 = (char *)v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = *(void *)&v8[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_queue];
  OUTLINED_FUNCTION_23_1();
  v21();
  unint64_t v22 = (*(unsigned __int8 *)(v16 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v8;
  (*(void (**)(unint64_t, char *, uint64_t))(v16 + 32))(v23 + v22, v20, v14);
  v35[4] = v29;
  v35[5] = v23;
  v35[0] = MEMORY[0x1E4F143A8];
  OUTLINED_FUNCTION_20(COERCE_DOUBLE(1107296256));
  v35[2] = sub_1C9DDC968;
  v35[3] = v31;
  id v24 = _Block_copy(v35);
  uint64_t v25 = v8;
  sub_1C9E0D050();
  uint64_t v34 = MEMORY[0x1E4FBC860];
  sub_1C9E01590(&qword_1EA5C6CF8, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D00);
  sub_1C9E0218C(&qword_1EA5C6D08, &qword_1EA5C6D00);
  OUTLINED_FUNCTION_36_0();
  sub_1C9E0D490();
  MEMORY[0x1CB78F460](0, v1, v0, v24);
  _Block_release(v24);
  uint64_t v26 = OUTLINED_FUNCTION_22_1();
  v27(v26);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v1, v32);
  swift_release();
  OUTLINED_FUNCTION_7_0();
}

void *sub_1C9DFAB04(unsigned char *a1, void *a2)
{
  id v87 = a2;
  uint64_t v3 = sub_1C9E0D030();
  uint64_t v94 = *(void *)(v3 - 8);
  uint64_t v95 = v3;
  uint64_t v4 = MEMORY[0x1F4188790](v3);
  uint64_t v93 = (void *)((char *)v80 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v4);
  uint64_t v92 = (void *)((char *)v80 - v6);
  uint64_t v91 = sub_1C9E0D080();
  uint64_t v90 = *(void *)(v91 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v91);
  uint64_t v88 = (char *)v80 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v89 = (char *)v80 - v9;
  uint64_t v100 = sub_1C9E0D040();
  uint64_t v102 = *(void *)(v100 - 8);
  MEMORY[0x1F4188790](v100);
  objc_super v99 = (char *)v80 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = sub_1C9E0D060();
  uint64_t v101 = *(void *)(v98 - 8);
  MEMORY[0x1F4188790](v98);
  uint64_t v97 = (char *)v80 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = (uint64_t (**)(uint64_t))__swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C7448);
  uint64_t v12 = (uint64_t)*(v86 - 1);
  MEMORY[0x1F4188790](v86);
  uint64_t v84 = v13;
  uint64_t v85 = (char *)v80 - (((unint64_t)v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = (void *)sub_1C9E0D380();
  uint64_t v82 = *(v83 - 1);
  MEMORY[0x1F4188790](v83);
  uint64_t v81 = (char *)v80 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1C9E0D010();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  uint64_t v19 = (char *)v80 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x1F4188790](v17);
  unint64_t v22 = (char *)v80 - v21;
  MEMORY[0x1F4188790](v20);
  id v24 = (char *)v80 - v23;
  uint64_t v25 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_homeManager;
  uint64_t v26 = *(void **)&a1[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_homeManager];
  if (v26) {
    goto LABEL_8;
  }
  uint64_t v96 = v22;
  if (qword_1EA5C6A70 != -1) {
    swift_once();
  }
  uint64_t v27 = __swift_project_value_buffer(v15, (uint64_t)qword_1EA5C98A0);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v24, v27, v15);
  uint64_t v28 = sub_1C9E0D000();
  os_log_type_t v29 = sub_1C9E0D310();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v30 = 0;
    _os_log_impl(&dword_1C9DD3000, v28, v29, "Initializing home manager", v30, 2u);
    MEMORY[0x1CB7900C0](v30, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v16 + 8))(v24, v15);
  dispatch_group_enter(*(dispatch_group_t *)&a1[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_homeManagerReadyGroup]);
  id v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F2E828]), sel_initWithOptions_cachePolicy_, 1348, 2);
  sub_1C9DEEDA0((uint64_t)objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F2E820]), sel_initWithHomeMangerConfiguration_, v31));
  uint64_t result = *(void **)&a1[v25];
  if (result)
  {
    objc_msgSend(result, sel_setDelegate_, a1);

    uint64_t v26 = *(void **)&a1[v25];
    unint64_t v22 = v96;
    if (!v26)
    {
      uint64_t v34 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_waitingOnHomeManagerDataSync;
      goto LABEL_16;
    }
LABEL_8:
    unsigned int v33 = objc_msgSend(v26, sel_isDataSyncInProgress);
    uint64_t v34 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_waitingOnHomeManagerDataSync;
    if (v33
      && (a1[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_waitingOnHomeManagerDataSync] & 1) == 0)
    {
      if (qword_1EA5C6A70 != -1) {
        swift_once();
      }
      uint64_t v35 = __swift_project_value_buffer(v15, (uint64_t)qword_1EA5C98A0);
      (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v22, v35, v15);
      char v36 = sub_1C9E0D000();
      os_log_type_t v37 = sub_1C9E0D310();
      if (os_log_type_enabled(v36, v37))
      {
        id v38 = v22;
        uint64_t v39 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v39 = 0;
        _os_log_impl(&dword_1C9DD3000, v36, v37, "Waiting on home manager to finish data sync", v39, 2u);
        id v40 = v39;
        unint64_t v22 = v38;
        MEMORY[0x1CB7900C0](v40, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v16 + 8))(v22, v15);
      dispatch_group_enter(*(dispatch_group_t *)&a1[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_homeManagerReadyGroup]);
      a1[v34] = 1;
LABEL_22:
      sub_1C9DD7D6C(0, &qword_1EA5C7450);
      uint64_t v45 = MEMORY[0x1E4FBC860];
      uint64_t aBlock = MEMORY[0x1E4FBC860];
      sub_1C9E01590(&qword_1EA5C7458, MEMORY[0x1E4FBCC70]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C7460);
      v80[1] = MEMORY[0x1E4FBB350];
      sub_1C9E0218C(&qword_1EA5C7468, &qword_1EA5C7460);
      uint64_t v46 = v81;
      char v47 = v83;
      sub_1C9E0D490();
      uint64_t v48 = sub_1C9E0D390();
      (*(void (**)(char *, void *))(v82 + 8))(v46, v47);
      uint64_t v49 = v85;
      BOOL v50 = v86;
      (*(void (**)(char *, id, uint64_t (**)(uint64_t)))(v12 + 16))(v85, v87, v86);
      unint64_t v51 = (*(unsigned __int8 *)(v12 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
      unint64_t v52 = ((unint64_t)v84 + v51 + 7) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v53 = swift_allocObject();
      *(void *)(v53 + 16) = v48;
      (*(void (**)(unint64_t, char *, uint64_t (**)(uint64_t)))(v12 + 32))(v53 + v51, v49, v50);
      *(void *)(v53 + v52) = a1;
      type metadata accessor for SafetyBlock();
      swift_allocObject();
      uint64_t v96 = (char *)v48;
      swift_unknownObjectRetain();
      uint64_t v54 = a1;
      uint64_t v55 = sub_1C9DD843C((uint64_t)sub_1C9E02284, v53);
      id v87 = v54;
      uint64_t v108 = sub_1C9E022FC;
      uint64_t v109 = v55;
      uint64_t v85 = (char *)v55;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v105 = 1107296256;
      uint64_t v86 = &v106;
      v106 = sub_1C9DDC968;
      uint64_t v107 = &block_descriptor_238;
      unint64_t v56 = _Block_copy(&aBlock);
      swift_retain();
      uint64_t v57 = v97;
      sub_1C9E0D050();
      uint64_t v103 = v45;
      sub_1C9E01590(&qword_1EA5C6CF8, MEMORY[0x1E4FBCB00]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D00);
      sub_1C9E0218C(&qword_1EA5C6D08, &qword_1EA5C6D00);
      unint64_t v59 = v99;
      uint64_t v58 = v100;
      sub_1C9E0D490();
      sub_1C9E0D330();
      _Block_release(v56);
      uint64_t v60 = *(void (**)(char *, uint64_t))(v102 + 8);
      v102 += 8;
      uint64_t v84 = v60;
      v60(v59, v58);
      unint64_t v61 = *(void **)(v101 + 8);
      v101 += 8;
      uint64_t v83 = v61;
      ((void (*)(char *, uint64_t))v61)(v57, v98);
      swift_release();
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v63 = v88;
      sub_1C9E0D070();
      uint64_t v64 = (uint64_t)v92;
      void *v92 = 2;
      uint64_t v65 = v94;
      uint64_t v66 = v95;
      (*(void (**)(uint64_t, void, uint64_t))(v94 + 104))(v64, *MEMORY[0x1E4FBCAE8], v95);
      uint64_t v67 = v89;
      MEMORY[0x1CB78F190](v63, v64);
      uint64_t v68 = *(void (**)(uint64_t, uint64_t))(v65 + 8);
      v68(v64, v66);
      uint64_t v69 = *(void (**)(char *, uint64_t))(v90 + 8);
      uint64_t v70 = v91;
      v69(v63, v91);
      uint64_t v71 = ObjectType;
      uint64_t v82 = ObjectType;
      sub_1C9DFC158(v64);
      uint64_t v72 = v93;
      sub_1C9DFC1CC(v93);
      MEMORY[0x1CB78F4D0](v67, v64, v72, v71);
      v68((uint64_t)v72, v66);
      v68(v64, v66);
      v69(v67, v70);
      uint64_t v73 = swift_allocObject();
      unint64_t v74 = v87;
      unint64_t v75 = v85;
      *(void *)(v73 + 16) = v87;
      *(void *)(v73 + 24) = v75;
      uint64_t v108 = sub_1C9E0233C;
      uint64_t v109 = v73;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v105 = 1107296256;
      v106 = sub_1C9DDC968;
      uint64_t v107 = &block_descriptor_244;
      uint64_t v76 = _Block_copy(&aBlock);
      id v77 = v74;
      swift_retain();
      uint64_t v78 = v97;
      sub_1C9E0D050();
      uint64_t v79 = v99;
      sub_1C9DFC51C();
      sub_1C9E0D3A0();
      _Block_release(v76);
      v84(v79, v100);
      ((void (*)(char *, uint64_t))v83)(v78, v98);
      swift_release();
      sub_1C9E0D3C0();
      swift_release();
      return (void *)swift_unknownObjectRelease();
    }
LABEL_16:
    if (a1[v34] == 1)
    {
      if (qword_1EA5C6A70 != -1) {
        swift_once();
      }
      uint64_t v41 = __swift_project_value_buffer(v15, (uint64_t)qword_1EA5C98A0);
      (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v19, v41, v15);
      char v42 = sub_1C9E0D000();
      os_log_type_t v43 = sub_1C9E0D310();
      if (os_log_type_enabled(v42, v43))
      {
        BOOL v44 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)BOOL v44 = 0;
        _os_log_impl(&dword_1C9DD3000, v42, v43, "Still waiting on home manager data sync", v44, 2u);
        MEMORY[0x1CB7900C0](v44, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v15);
    }
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

uint64_t sub_1C9DFB8FC(unsigned __int8 a1, uint64_t a2, uint64_t a3, char *a4)
{
  id v40 = a4;
  uint64_t v42 = a3;
  int v4 = a1;
  uint64_t v5 = sub_1C9E0D010();
  uint64_t v38 = *(void *)(v5 - 8);
  uint64_t v39 = v5;
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C7448);
  uint64_t v8 = *(void *)(v41 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x1F4188790](v41);
  uint64_t v10 = sub_1C9E0CFB0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  uint64_t v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v16 = (char *)&v37 - v15;
  swift_getObjectType();
  uint64_t result = sub_1C9E0D3B0();
  if (v4 == 2)
  {
    if (qword_1EA5C6A70 != -1) {
      swift_once();
    }
    uint64_t v18 = v39;
    uint64_t v19 = __swift_project_value_buffer(v39, (uint64_t)qword_1EA5C98A0);
    uint64_t v20 = v38;
    (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v7, v19, v18);
    uint64_t v21 = sub_1C9E0D000();
    os_log_type_t v22 = sub_1C9E0D320();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_1C9DD3000, v21, v22, "Timed out waiting for HMHomeManager to be ready", v23, 2u);
      MEMORY[0x1CB7900C0](v23, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v20 + 8))(v7, v18);
    sub_1C9E02444();
    uint64_t v24 = swift_allocError();
    void *v25 = 0;
    aBlock[0] = v24;
    return sub_1C9E0D270();
  }
  else
  {
    uint64_t v26 = *(void **)&v40[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_homeManager];
    if (v26)
    {
      id v27 = v26;
      sub_1C9E0CFA0();
      sub_1C9E0CF90();
      uint64_t v28 = *(void (**)(char *, uint64_t))(v11 + 8);
      v28(v14, v10);
      os_log_type_t v29 = (void *)sub_1C9E0CF80();
      v28(v16, v10);
      uint64_t v30 = v41;
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v42, v41);
      unint64_t v31 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      uint64_t v32 = swift_allocObject();
      (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v32 + v31, (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v30);
      unsigned int v33 = v40;
      *(void *)(v32 + ((v9 + v31 + 7) & 0xFFFFFFFFFFFFFFF8)) = v40;
      aBlock[4] = sub_1C9E023D0;
      aBlock[5] = v32;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1C9DFC0B8;
      aBlock[3] = &block_descriptor_253;
      uint64_t v34 = _Block_copy(aBlock);
      id v35 = v33;
      swift_release();
      id v36 = objc_msgSend(v27, sel__refreshBeforeDate_completionHandler_, v29, v34);
      _Block_release(v34);

      return swift_unknownObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_1C9DFBDA4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C9E0D010();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t result = MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    id v11 = a1;
    if (qword_1EA5C6A70 != -1) {
      swift_once();
    }
    uint64_t v12 = __swift_project_value_buffer(v6, (uint64_t)qword_1EA5C98A0);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v12, v6);
    id v13 = a1;
    id v14 = a1;
    uint64_t v15 = sub_1C9E0D000();
    os_log_type_t v16 = sub_1C9E0D320();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      v26[1] = a2;
      uint64_t v18 = (uint8_t *)v17;
      uint64_t v19 = swift_slowAlloc();
      uint64_t v27 = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      v26[0] = v18 + 4;
      swift_getErrorValue();
      uint64_t v20 = sub_1C9E0D840();
      v26[2] = sub_1C9DE032C(v20, v21, &v27);
      sub_1C9E0D430();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1C9DD3000, v15, v16, "Failed to refresh HMHomeManager: %s", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1CB7900C0](v19, -1, -1);
      MEMORY[0x1CB7900C0](v18, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    sub_1C9E02444();
    uint64_t v24 = swift_allocError();
    void *v25 = a1;
    uint64_t v27 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C7448);
    return sub_1C9E0D270();
  }
  else
  {
    os_log_type_t v22 = *(void **)(a3 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_homeManager);
    if (v22)
    {
      uint64_t v27 = *(void *)(a3 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_homeManager);
      id v23 = v22;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C7448);
      return sub_1C9E0D280();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

void sub_1C9DFC0B8(uint64_t a1, void *a2)
{
}

void sub_1C9DFC0C0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

BOOL sub_1C9DFC130()
{
  return sub_1C9DD8468(0);
}

uint64_t sub_1C9DFC158@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x1E4FBCAD0];
  uint64_t v3 = sub_1C9E0D030();
  id v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t sub_1C9DFC1CC@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  uint64_t v2 = *MEMORY[0x1E4FBCAA8];
  uint64_t v3 = sub_1C9E0D030();
  id v4 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t sub_1C9DFC244(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_1C9E0D040();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_1C9E0D060();
  uint64_t v7 = *(void *)(v12[0] - 8);
  MEMORY[0x1F4188790](v12[0]);
  uint64_t v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock[4] = sub_1C9E02344;
  aBlock[5] = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C9DDC968;
  aBlock[3] = &block_descriptor_247;
  uint64_t v10 = _Block_copy(aBlock);
  swift_retain();
  sub_1C9E0D050();
  v12[1] = MEMORY[0x1E4FBC860];
  sub_1C9E01590(&qword_1EA5C6CF8, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6D00);
  sub_1C9E0218C(&qword_1EA5C6D08, &qword_1EA5C6D00);
  sub_1C9E0D490();
  MEMORY[0x1CB78F460](0, v9, v6, v10);
  _Block_release(v10);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, void))(v7 + 8))(v9, v12[0]);
  return swift_release();
}

BOOL sub_1C9DFC4F4()
{
  return sub_1C9DD8468(2);
}

uint64_t sub_1C9DFC51C()
{
  return sub_1C9E0D490();
}

void sub_1C9DFC5F8()
{
  OUTLINED_FUNCTION_5_0();
  id v51 = v0;
  uint64_t v2 = v1;
  sub_1C9E0D010();
  OUTLINED_FUNCTION_0_1();
  uint64_t v52 = v4;
  uint64_t v53 = v3;
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_55();
  uint64_t v50 = v5;
  MEMORY[0x1F4188790](v6);
  uint64_t v46 = (char *)&v46 - v7;
  uint64_t v8 = *(uint8_t **)v2;
  uint64_t v9 = *(void *)(v2 + 8);
  uint64_t v11 = *(void *)(v2 + 16);
  uint64_t v10 = *(void *)(v2 + 24);
  uint64_t v13 = *(void *)(v2 + 32);
  uint64_t v12 = *(void *)(v2 + 40);
  uint64_t v14 = *(void *)(v2 + 48);
  uint64_t v15 = *(void *)(v2 + 56);
  uint64_t v48 = *(void *)(v2 + 64);
  uint64_t v49 = v12;
  uint64_t v47 = *(void *)(v2 + 72);
  uint64_t v16 = MEMORY[0x1E4FBC860];
  uint64_t v65 = MEMORY[0x1E4FBC860];
  uint64_t v54 = (uint64_t)v8;
  uint64_t v17 = sub_1C9E0751C();
  uint64_t v64 = v16;
  if (v10 == 1 && v14 == 1)
  {
    id v21 = objc_msgSend(v51, sel_currentHome);
    if (!v21)
    {
      swift_bridgeObjectRelease();
      uint64_t v40 = v52;
      uint64_t v39 = v53;
      if (qword_1EA5C6A70 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v39, (uint64_t)qword_1EA5C98A0);
      uint64_t v41 = v46;
      OUTLINED_FUNCTION_23_1();
      v42();
      os_log_type_t v43 = sub_1C9E0D000();
      os_log_type_t v44 = sub_1C9E0D320();
      if (os_log_type_enabled(v43, v44))
      {
        uint64_t v45 = (uint8_t *)OUTLINED_FUNCTION_41_0();
        *(_WORD *)uint64_t v45 = 0;
        _os_log_impl(&dword_1C9DD3000, v43, v44, "No current home available", v45, 2u);
        OUTLINED_FUNCTION_15();
      }

      (*(void (**)(char *, uint64_t))(v40 + 8))(v41, v39);
      goto LABEL_24;
    }
    os_log_type_t v22 = v21;
    id v23 = objc_msgSend(v21, sel_rooms);
    sub_1C9DD7D6C(0, (unint64_t *)&unk_1EA5C7318);
    uint64_t v20 = sub_1C9E0D210();
  }
  else
  {
    uint64_t v54 = (uint64_t)v8;
    uint64_t v55 = v9;
    uint64_t v56 = v11;
    uint64_t v57 = v10;
    uint64_t v58 = v13;
    uint64_t v59 = v49;
    uint64_t v60 = v14;
    uint64_t v61 = v15;
    uint64_t v62 = v48;
    uint64_t v63 = v47;
    sub_1C9DFCEA8();
    uint64_t v20 = v19;
  }
  uint64_t v25 = v52;
  uint64_t v24 = v53;
  uint64_t v64 = v20;
  uint64_t v26 = v50;
  if (qword_1EA5C6A70 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v24, (uint64_t)qword_1EA5C98A0);
  OUTLINED_FUNCTION_23_1();
  v27();
  unint64_t v28 = v64;
  swift_bridgeObjectRetain_n();
  os_log_type_t v29 = sub_1C9E0D000();
  os_log_type_t v30 = sub_1C9E0D310();
  if (!os_log_type_enabled(v29, v30))
  {

    swift_bridgeObjectRelease_n();
    goto LABEL_15;
  }
  uint64_t v8 = (uint8_t *)swift_slowAlloc();
  *(_DWORD *)uint64_t v8 = 134217984;
  if (v28 >> 62) {
    goto LABEL_36;
  }
  uint64_t v31 = *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    swift_bridgeObjectRelease();
    uint64_t v54 = v31;
    sub_1C9E0D430();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C9DD3000, v29, v30, "No. of rooms matching description: %ld", v8, 0xCu);
    OUTLINED_FUNCTION_15();

LABEL_15:
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v26, v24);
    swift_beginAccess();
    uint64_t v25 = v64;
    if ((unint64_t)v64 >> 62)
    {
      if (v64 < 0) {
        os_log_type_t v29 = v64;
      }
      else {
        os_log_type_t v29 = (v64 & 0xFFFFFFFFFFFFFF8);
      }
      swift_bridgeObjectRetain();
      uint64_t v32 = sub_1C9E0D700();
      if (!v32) {
        goto LABEL_23;
      }
    }
    else
    {
      uint64_t v32 = *(void *)((v64 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v32) {
        goto LABEL_23;
      }
    }
    if (v32 >= 1) {
      break;
    }
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v31 = sub_1C9E0D700();
    swift_bridgeObjectRelease();
  }
  uint64_t v33 = 0;
  do
  {
    if ((v25 & 0xC000000000000001) != 0) {
      id v34 = (id)MEMORY[0x1CB78F680](v33, v25);
    }
    else {
      id v34 = *(id *)(v25 + 8 * v33 + 32);
    }
    id v35 = v34;
    ++v33;
    id v36 = objc_msgSend(v34, sel_accessories);
    sub_1C9DD7D6C(0, &qword_1EA5C7358);
    unint64_t v37 = sub_1C9E0D210();

    swift_bridgeObjectRetain();
    unint64_t v38 = sub_1C9DF26F8(v37, v17);
    swift_bridgeObjectRelease();
    sub_1C9DFCCE0(v38);
  }
  while (v32 != v33);
LABEL_23:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
LABEL_24:
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_1C9DFCB18(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1C9E0D700();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1C9E0D700();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
    goto LABEL_26;
  }
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_16;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x1CB78F690](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    unint64_t *v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
    uint64_t result = sub_1C9E01054(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1C9E0D700();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();
  return sub_1C9E0D230();
}

uint64_t sub_1C9DFCCE0(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1C9E0D700();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1C9E0D700();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
    goto LABEL_26;
  }
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_16;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x1CB78F690](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    unint64_t *v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
    uint64_t result = sub_1C9E01214(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1C9E0D700();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();
  return sub_1C9E0D230();
}

void sub_1C9DFCEA8()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v2 = v1;
  unint64_t v4 = v3;
  uint64_t v5 = sub_1C9E0D010();
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_4_0();
  uint64_t v41 = v4[1];
  uint64_t v10 = v4[3];
  uint64_t v9 = v4[4];
  uint64_t v11 = v4[6];
  id v12 = objc_msgSend(v2, sel_currentHome);
  if (!v12)
  {
    if (qword_1EA5C6A70 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v5, (uint64_t)qword_1EA5C98A0);
    OUTLINED_FUNCTION_23_1();
    v18();
    uint64_t v19 = sub_1C9E0D000();
    os_log_type_t v20 = sub_1C9E0D320();
    if (os_log_type_enabled(v19, v20))
    {
      id v21 = (uint8_t *)OUTLINED_FUNCTION_41_0();
      *(_WORD *)id v21 = 0;
      _os_log_impl(&dword_1C9DD3000, v19, v20, "No current home available", v21, 2u);
      OUTLINED_FUNCTION_15();
    }

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0, v5);
    goto LABEL_37;
  }
  BOOL v13 = v12;
  uint64_t v40 = v10;
  id v14 = objc_msgSend(v2, sel_currentAccessory);
  id v15 = objc_msgSend(v14, sel_room);

  id v16 = objc_msgSend(v13, sel_zones);
  sub_1C9DD7D6C(0, &qword_1EA5C7310);
  unint64_t v17 = sub_1C9E0D210();

  if (v11 == 1) {
    goto LABEL_3;
  }
  if ((v9 & 1) != 0 && v15)
  {
    id v22 = v15;
    id v23 = v15;
    unint64_t v24 = swift_bridgeObjectRetain();
    uint64_t v25 = sub_1C9DFD710(v24, v23);
    uint64_t v38 = 0;
    swift_bridgeObjectRelease();
    if (v25)
    {
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6E20);
      uint64_t v26 = swift_allocObject();
      *(_OWORD *)(v26 + 16) = xmmword_1C9E0FC40;
      *(void *)(v26 + 32) = v25;
      unint64_t v42 = v26;
      sub_1C9E0D230();
      unint64_t v17 = v42;
    }

    id v15 = v22;
  }
  else
  {
    if (!v11)
    {
LABEL_3:
      uint64_t v38 = 0;
      goto LABEL_16;
    }
    swift_bridgeObjectRetain();
    unint64_t v17 = sub_1C9DF450C(v17);
    uint64_t v38 = 0;
  }
LABEL_16:
  unint64_t v43 = MEMORY[0x1E4FBC860];
  if (v17 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_1C9E0D700();
  }
  else
  {
    uint64_t v27 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  uint64_t v39 = v15;
  if (!v27)
  {
    swift_bridgeObjectRelease_n();
    unint64_t v33 = MEMORY[0x1E4FBC860];
    goto LABEL_27;
  }
  if (v27 >= 1)
  {
    uint64_t v28 = 0;
    do
    {
      if ((v17 & 0xC000000000000001) != 0) {
        id v29 = (id)MEMORY[0x1CB78F680](v28, v17);
      }
      else {
        id v29 = *(id *)(v17 + 8 * v28 + 32);
      }
      os_log_type_t v30 = v29;
      ++v28;
      id v31 = objc_msgSend(v29, sel_rooms, v38);
      sub_1C9DD7D6C(0, (unint64_t *)&unk_1EA5C7318);
      unint64_t v32 = sub_1C9E0D210();

      sub_1C9DFCB18(v32);
    }
    while (v27 != v28);
    swift_bridgeObjectRelease_n();
    unint64_t v33 = v43;
LABEL_27:
    if (v33 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v37 = sub_1C9E0D700();
      swift_bridgeObjectRelease();
      if (v37)
      {
LABEL_30:
        if (v40 != 1)
        {
          if ((v41 & 1) != 0 && v39)
          {
            id v35 = v39;
            swift_bridgeObjectRelease();
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6E20);
            uint64_t v36 = swift_allocObject();
            *(_OWORD *)(v36 + 16) = xmmword_1C9E0FC40;
            *(void *)(v36 + 32) = v35;
            sub_1C9E0D230();

LABEL_37:
            OUTLINED_FUNCTION_7_0();
            return;
          }
          if (v40)
          {
            swift_bridgeObjectRetain();
            sub_1C9DF450C(v33);
          }
        }

        goto LABEL_37;
      }
    }
    else if (*(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_30;
    }
    swift_bridgeObjectRelease();
    id v34 = objc_msgSend(v13, sel_rooms);
    sub_1C9DD7D6C(0, (unint64_t *)&unk_1EA5C7318);
    unint64_t v33 = sub_1C9E0D210();

    goto LABEL_30;
  }
  __break(1u);
}

size_t sub_1C9DFD3C8(id *a1, void *a2)
{
  uint64_t v31 = sub_1C9E0CFF0();
  uint64_t v5 = *(void *)(v31 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v31);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)&v26 - v9;
  id v11 = objc_msgSend(*a1, sel_rooms);
  sub_1C9DD7D6C(0, (unint64_t *)&unk_1EA5C7318);
  unint64_t v12 = sub_1C9E0D210();

  if (!(v12 >> 62))
  {
    uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v13) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    uint64_t v16 = MEMORY[0x1E4FBC860];
LABEL_14:
    id v24 = objc_msgSend(a2, sel_uniqueIdentifier);
    sub_1C9E0CFD0();

    MEMORY[0x1F4188790](v25);
    *(&v26 - 2) = (uint64_t)v10;
    LOBYTE(v24) = sub_1C9E00D40((uint64_t (*)(char *))sub_1C9E01570, (uint64_t)(&v26 - 4), v16);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v31);
    swift_bridgeObjectRelease();
    return v24 & 1;
  }
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_1C9E0D700();
  swift_bridgeObjectRelease();
  if (!v13) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v32 = MEMORY[0x1E4FBC860];
  size_t result = sub_1C9E00A10(0, v13 & ~(v13 >> 63), 0);
  if ((v13 & 0x8000000000000000) == 0)
  {
    uint64_t v29 = v2;
    uint64_t v30 = v13;
    uint64_t v27 = a2;
    uint64_t v28 = v10;
    uint64_t v15 = 0;
    uint64_t v16 = v32;
    unint64_t v17 = v12 & 0xC000000000000001;
    unint64_t v18 = v12;
    do
    {
      if (v17) {
        id v19 = (id)MEMORY[0x1CB78F680](v15, v12);
      }
      else {
        id v19 = *(id *)(v12 + 8 * v15 + 32);
      }
      os_log_type_t v20 = v19;
      id v21 = objc_msgSend(v19, sel_uniqueIdentifier);
      sub_1C9E0CFD0();

      uint64_t v32 = v16;
      unint64_t v23 = *(void *)(v16 + 16);
      unint64_t v22 = *(void *)(v16 + 24);
      if (v23 >= v22 >> 1)
      {
        sub_1C9E00A10(v22 > 1, v23 + 1, 1);
        uint64_t v16 = v32;
      }
      ++v15;
      *(void *)(v16 + 16) = v23 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v16+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v23, v8, v31);
      unint64_t v12 = v18;
    }
    while (v30 != v15);
    swift_bridgeObjectRelease();
    uint64_t v10 = v28;
    a2 = v27;
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

void *sub_1C9DFD710(unint64_t a1, void *a2)
{
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = sub_1C9E0D700())
  {
    uint64_t v6 = 4;
    while (1)
    {
      id v7 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1CB78F680](v6 - 4, a1) : *(id *)(a1 + 8 * v6);
      uint64_t v8 = v7;
      uint64_t v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1)) {
        break;
      }
      id v12 = v7;
      char v10 = sub_1C9DFD3C8(&v12, a2);
      if (v2)
      {

        swift_bridgeObjectRelease();
        return v8;
      }
      if (v10)
      {

        swift_bridgeObjectRelease();
        return v8;
      }

      ++v6;
      if (v9 == v5) {
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
LABEL_11:

  swift_bridgeObjectRelease();
  return 0;
}

void sub_1C9DFD840()
{
  uint64_t v1 = sub_1C9E0D010();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_4_0();
  uint64_t v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_initialLoadDone;
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_initialLoadDone) & 1) == 0)
  {
    if (qword_1EA5C6A70 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v1, (uint64_t)qword_1EA5C98A0);
    OUTLINED_FUNCTION_23_1();
    v4();
    uint64_t v5 = sub_1C9E0D000();
    os_log_type_t v6 = sub_1C9E0D310();
    if (os_log_type_enabled(v5, v6))
    {
      *(_WORD *)OUTLINED_FUNCTION_41_0() = 0;
      OUTLINED_FUNCTION_48(&dword_1C9DD3000, v7, v8, "Home manager updated homes");
      OUTLINED_FUNCTION_15();
    }

    uint64_t v9 = OUTLINED_FUNCTION_39();
    v10(v9);
    *(unsigned char *)(v0 + v3) = 1;
    dispatch_group_leave(*(dispatch_group_t *)(v0
                                             + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_homeManagerReadyGroup));
  }
}

void sub_1C9DFD9F4()
{
  uint64_t v1 = sub_1C9E0D010();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_4_0();
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_homeManager);
  if (v3)
  {
    if ((objc_msgSend(v3, sel_isDataSyncInProgress) & 1) == 0)
    {
      if (qword_1EA5C6A70 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v1, (uint64_t)qword_1EA5C98A0);
      OUTLINED_FUNCTION_23_1();
      v4();
      uint64_t v5 = sub_1C9E0D000();
      os_log_type_t v6 = sub_1C9E0D310();
      if (os_log_type_enabled(v5, v6))
      {
        *(_WORD *)OUTLINED_FUNCTION_41_0() = 0;
        OUTLINED_FUNCTION_48(&dword_1C9DD3000, v7, v8, "Home manager data sync finished");
        OUTLINED_FUNCTION_15();
      }

      uint64_t v9 = OUTLINED_FUNCTION_39();
      v10(v9);
      dispatch_group_leave(*(dispatch_group_t *)(v0
                                               + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_homeManagerReadyGroup));
      *(unsigned char *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_waitingOnHomeManagerDataSync) = 0;
    }
  }
  else
  {
    __break(1u);
  }
}

id DeviceResolutionService.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DeviceResolutionService();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1C9DFDC7C()
{
}

uint64_t sub_1C9DFDCA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1C9DEFEE8(a1, a2, a3);
}

uint64_t sub_1C9DFDCC4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1C9DFDD54;
  return sub_1C9DF0614();
}

uint64_t sub_1C9DFDD54()
{
  OUTLINED_FUNCTION_7_4();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_1_11();
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_5_3();
  *uint64_t v5 = v4;
  uint64_t v6 = swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(uint64_t))(v4 + 8);
  if (!v0) {
    uint64_t v6 = v3;
  }
  return v7(v6);
}

uint64_t sub_1C9DFDE24()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1C9E02810;
  return sub_1C9DF0D34();
}

uint64_t sub_1C9DFDEB4(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1C9E02810;
  return sub_1C9DF488C(a1);
}

uint64_t sub_1C9DFDF4C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1C9E02810;
  return sub_1C9DF146C();
}

uint64_t sub_1C9DFDFE4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1C9E02810;
  return sub_1C9DF6814(a1, a2);
}

uint64_t sub_1C9DFE08C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1C9E02810;
  return sub_1C9DF7290(a1);
}

void sub_1C9DFE124()
{
}

void sub_1C9DFE148()
{
}

void sub_1C9DFE16C()
{
}

uint64_t sub_1C9DFE190()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1C9E02810;
  return sub_1C9DF2CE4();
}

id sub_1C9DFE238()
{
  uint64_t v1 = (void *)sub_1C9E0D110();
  swift_bridgeObjectRelease();
  uint64_t v2 = (void *)sub_1C9E0D2B0();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(v0, sel_initWithKey_valueSet_, v1, v2);

  return v3;
}

uint64_t type metadata accessor for DeviceResolutionService()
{
  uint64_t result = qword_1EA5C72C0;
  if (!qword_1EA5C72C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_1C9DFE30C()
{
  unint64_t result = qword_1EA5C7208;
  if (!qword_1EA5C7208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C7208);
  }
  return result;
}

uint64_t sub_1C9DFE358()
{
  return type metadata accessor for DeviceResolutionService();
}

void sub_1C9DFE360()
{
  sub_1C9DFEE2C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for DeviceResolutionService(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for DeviceResolutionService);
}

uint64_t dispatch thunk of DeviceResolutionService.setHomeKitDataSource(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of DeviceResolutionService.setEndpointUUID(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x118))();
}

uint64_t dispatch thunk of DeviceResolutionService.devices(matchingAny:with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x120))();
}

uint64_t dispatch thunk of DeviceResolutionService.pairedCompanionDevice()()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_34_0();
  uint64_t v5 = (uint64_t (*)(void))(*(void *)(v0 + 296) + **(int **)(v0 + 296));
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)OUTLINED_FUNCTION_6_2(v1);
  *uint64_t v2 = v3;
  v2[1] = sub_1C9DFE5EC;
  return v5();
}

uint64_t sub_1C9DFE5EC()
{
  OUTLINED_FUNCTION_7_4();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_1_11();
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_5_3();
  void *v4 = v3;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

uint64_t dispatch thunk of DeviceResolutionService.meDevice()()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_34_0();
  uint64_t v5 = (uint64_t (*)(void))(*(void *)(v0 + 304) + **(int **)(v0 + 304));
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)OUTLINED_FUNCTION_6_2(v1);
  *uint64_t v2 = v3;
  v2[1] = sub_1C9E0296C;
  return v5();
}

uint64_t dispatch thunk of DeviceResolutionService.devices(matchingAny:)()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_34_0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_6_2(v0);
  void *v1 = v2;
  v1[1] = sub_1C9E0296C;
  uint64_t v3 = OUTLINED_FUNCTION_42_0();
  return v4(v3);
}

uint64_t dispatch thunk of DeviceResolutionService.homeAutomationAccessories(matchingAny:checkForReachability:)()
{
  OUTLINED_FUNCTION_7_2();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_34_0();
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v4 + 320) + **(int **)(v4 + 320));
  uint64_t v5 = swift_task_alloc();
  uint64_t v6 = (void *)OUTLINED_FUNCTION_6_2(v5);
  void *v6 = v7;
  v6[1] = sub_1C9E0296C;
  return v9(v3, v1);
}

uint64_t dispatch thunk of DeviceResolutionService.devicesMatching(capabilityDescriptions:)()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_34_0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_6_2(v0);
  void *v1 = v2;
  v1[1] = sub_1C9E0296C;
  uint64_t v3 = OUTLINED_FUNCTION_42_0();
  return v4(v3);
}

uint64_t dispatch thunk of DeviceResolutionService.devicesWithProximity(closerBound:fartherBound:)()
{
  OUTLINED_FUNCTION_7_2();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_34_0();
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v4 + 336) + **(int **)(v4 + 336));
  uint64_t v5 = swift_task_alloc();
  uint64_t v6 = (void *)OUTLINED_FUNCTION_6_2(v5);
  void *v6 = v7;
  v6[1] = sub_1C9E0296C;
  return v9(v3, v1);
}

uint64_t dispatch thunk of DeviceResolutionService.sourceDevices(for:)()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_34_0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_6_2(v0);
  void *v1 = v2;
  v1[1] = sub_1C9E0296C;
  uint64_t v3 = OUTLINED_FUNCTION_42_0();
  return v4(v3);
}

uint64_t dispatch thunk of DeviceResolutionService.devicesWithProximity(closerBound:fartherBound:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x168))();
}

uint64_t dispatch thunk of DeviceResolutionService.sourceDevices(for:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x170))();
}

uint64_t dispatch thunk of DeviceResolutionService.devicesMatching(capabilityDescriptions:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x178))();
}

uint64_t dispatch thunk of DeviceResolutionService.homeManagerDidUpdateHomes(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of DeviceResolutionService.homeManagerDidUpdateDataSync(inProgress:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1B0))();
}

void sub_1C9DFEE2C()
{
  if (!qword_1EA5C7308)
  {
    sub_1C9E0CFF0();
    unint64_t v0 = sub_1C9E0D420();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA5C7308);
    }
  }
}

uint64_t getEnumTagSinglePayload for DeviceResolutionService.XPCError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for DeviceResolutionService.XPCError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1C9DFEF74);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1C9DFEF9C()
{
  return 0;
}

ValueMetadata *type metadata accessor for DeviceResolutionService.XPCError()
{
  return &type metadata for DeviceResolutionService.XPCError;
}

void *initializeBufferWithCopyOfBuffer for DeviceResolutionService.HomeManagerError(void *a1, id *a2)
{
  id v3 = *a2;
  id v4 = *a2;
  *a1 = v3;
  return a1;
}

void destroy for DeviceResolutionService.HomeManagerError(id *a1)
{
}

void **assignWithCopy for DeviceResolutionService.HomeManagerError(void **a1, id *a2)
{
  id v3 = *a2;
  id v4 = *a2;
  uint64_t v5 = *a1;
  *a1 = v3;

  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

void **assignWithTake for DeviceResolutionService.HomeManagerError(void **a1, void **a2)
{
  id v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for DeviceResolutionService.HomeManagerError(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for DeviceResolutionService.HomeManagerError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = 0;
    *(_DWORD *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

uint64_t sub_1C9DFF110(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_1C9DFF128(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *unint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for DeviceResolutionService.HomeManagerError()
{
  return &type metadata for DeviceResolutionService.HomeManagerError;
}

uint64_t sub_1C9DFF158(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_1C9DFF234;
  return v6(a1);
}

uint64_t sub_1C9DFF234()
{
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_1_11();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_5_3();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21_1();
  return v3();
}

char *sub_1C9DFF2F8(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC808F0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  id v12 = v10 + 32;
  if (v5)
  {
    sub_1C9DFF4E0((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1C9DFF3E8(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_1C9DFF3E8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_1C9E0D740();
  __break(1u);
  return result;
}

char *sub_1C9DFF4E0(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1C9E0D740();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_1C9DFF574(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    uint64_t v8 = sub_1C9E0D740();
    __break(1u);
    return MEMORY[0x1F4186420](v8, v9, v10, v7);
  }
  if (a3 < a1 || (uint64_t result = sub_1C9E0CFF0(), a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    uint64_t v11 = sub_1C9E0CFF0();
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

uint64_t sub_1C9DFF6A4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 16 * a2 > a1 ? (BOOL v3 = a1 + 16 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_1C9E0D740();
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C7398);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_1C9DFF7A4(unint64_t a1, uint64_t a2, unint64_t a3, unint64_t *a4)
{
  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (BOOL v4 = a1 + 8 * a2 > a3) : (BOOL v4 = 0), v4))
  {
    OUTLINED_FUNCTION_57();
    uint64_t result = sub_1C9E0D740();
    __break(1u);
  }
  else
  {
    sub_1C9DD7D6C(0, a4);
    OUTLINED_FUNCTION_45_0();
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_1C9DFF888(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0
    || ((uint64_t v5 = *(void *)(*(void *)(sub_1C9E0CFF0() - 8) + 72) * a2, v6 = a3 + v5, v7 = a1 + v5, v6 > a1)
      ? (BOOL v8 = v7 > a3)
      : (BOOL v8 = 0),
        v8))
  {
    uint64_t result = sub_1C9E0D740();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

unint64_t sub_1C9DFF9A0(unint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

void sub_1C9DFF9C4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA5C74F0);
    uint64_t v16 = sub_1C9E0D720();
    sub_1C9E0D640();
    uint64_t v2 = sub_1C9E0D6C0();
    if (v2)
    {
      uint64_t v3 = v2;
      sub_1C9DD7D6C(0, (unint64_t *)&qword_1EA5C6CC0);
      while (1)
      {
        swift_dynamicCast();
        sub_1C9DD7D6C(0, &qword_1EA5C70A0);
        swift_dynamicCast();
        uint64_t v4 = v16;
        unint64_t v5 = *(void *)(v16 + 16);
        if (*(void *)(v16 + 24) <= v5)
        {
          sub_1C9E00050(v5 + 1, 1, (uint64_t *)&unk_1EA5C74F0);
          uint64_t v4 = v16;
        }
        uint64_t v6 = sub_1C9E0D3F0();
        uint64_t v7 = v4 + 64;
        unint64_t v8 = v6 & ~(-1 << *(unsigned char *)(v4 + 32));
        if (((-1 << v8) & ~*(void *)(v4 + 64 + 8 * (v8 >> 6))) == 0) {
          break;
        }
        unint64_t v9 = __clz(__rbit64((-1 << v8) & ~*(void *)(v4 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
LABEL_15:
        *(void *)(v7 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
        *(void *)(*(void *)(v4 + 48) + 8 * v9) = v15;
        *(void *)(*(void *)(v4 + 56) + 8 * v9) = v3;
        ++*(void *)(v4 + 16);
        uint64_t v3 = sub_1C9E0D6C0();
        if (!v3) {
          goto LABEL_16;
        }
      }
      OUTLINED_FUNCTION_58();
      while (++v11 != v12 || (v10 & 1) == 0)
      {
        BOOL v13 = v11 == v12;
        if (v11 == v12) {
          uint64_t v11 = 0;
        }
        v10 |= v13;
        uint64_t v14 = *(void *)(v7 + 8 * v11);
        if (v14 != -1)
        {
          unint64_t v9 = __clz(__rbit64(~v14)) + (v11 << 6);
          goto LABEL_15;
        }
      }
      __break(1u);
    }
    else
    {
LABEL_16:
      swift_release();
    }
  }
  else
  {
    swift_unknownObjectRelease();
  }
}

uint64_t sub_1C9DFFC00(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E4FBC868];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C7438);
  uint64_t v2 = sub_1C9E0D720();
  uint64_t v17 = v2;
  sub_1C9E0D640();
  uint64_t v3 = sub_1C9E0D6C0();
  if (!v3)
  {
LABEL_16:
    swift_release();
    return v2;
  }
  uint64_t v4 = v3;
  type metadata accessor for DeviceUnit();
  while (1)
  {
    swift_dynamicCast();
    sub_1C9DD7D6C(0, &qword_1EA5C7358);
    swift_dynamicCast();
    uint64_t v2 = v17;
    unint64_t v5 = *(void *)(v17 + 16);
    if (*(void *)(v17 + 24) <= v5)
    {
      sub_1C9E00050(v5 + 1, 1, &qword_1EA5C7438);
      uint64_t v2 = v17;
    }
    uint64_t result = sub_1C9E0D3F0();
    uint64_t v7 = v2 + 64;
    uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v9 = result & ~v8;
    unint64_t v10 = v9 >> 6;
    if (((-1 << v9) & ~*(void *)(v2 + 64 + 8 * (v9 >> 6))) == 0) {
      break;
    }
    unint64_t v11 = __clz(__rbit64((-1 << v9) & ~*(void *)(v2 + 64 + 8 * (v9 >> 6)))) | v9 & 0x7FFFFFFFFFFFFFC0;
LABEL_15:
    *(void *)(v7 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    *(void *)(*(void *)(v2 + 48) + 8 * v11) = v16;
    *(void *)(*(void *)(v2 + 56) + 8 * v11) = v4;
    ++*(void *)(v2 + 16);
    uint64_t v4 = sub_1C9E0D6C0();
    if (!v4) {
      goto LABEL_16;
    }
  }
  char v12 = 0;
  unint64_t v13 = (unint64_t)(63 - v8) >> 6;
  while (++v10 != v13 || (v12 & 1) == 0)
  {
    BOOL v14 = v10 == v13;
    if (v10 == v13) {
      unint64_t v10 = 0;
    }
    v12 |= v14;
    uint64_t v15 = *(void *)(v7 + 8 * v10);
    if (v15 != -1)
    {
      unint64_t v11 = __clz(__rbit64(~v15)) + (v10 << 6);
      goto LABEL_15;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1C9DFFE38(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E4FBC868];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C73D0);
  uint64_t v2 = sub_1C9E0D720();
  uint64_t v17 = v2;
  sub_1C9E0D640();
  uint64_t v3 = sub_1C9E0D6C0();
  if (!v3)
  {
LABEL_16:
    swift_release();
    return v2;
  }
  uint64_t v4 = v3;
  type metadata accessor for DeviceUnit();
  while (1)
  {
    swift_dynamicCast();
    type metadata accessor for Capabilities();
    swift_dynamicCast();
    uint64_t v2 = v17;
    unint64_t v5 = *(void *)(v17 + 16);
    if (*(void *)(v17 + 24) <= v5)
    {
      sub_1C9E00310(v5 + 1, 1);
      uint64_t v2 = v17;
    }
    uint64_t result = sub_1C9E0D3F0();
    uint64_t v7 = v2 + 64;
    uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v9 = result & ~v8;
    unint64_t v10 = v9 >> 6;
    if (((-1 << v9) & ~*(void *)(v2 + 64 + 8 * (v9 >> 6))) == 0) {
      break;
    }
    unint64_t v11 = __clz(__rbit64((-1 << v9) & ~*(void *)(v2 + 64 + 8 * (v9 >> 6)))) | v9 & 0x7FFFFFFFFFFFFFC0;
LABEL_15:
    *(void *)(v7 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    *(void *)(*(void *)(v2 + 48) + 8 * v11) = v16;
    *(void *)(*(void *)(v2 + 56) + 8 * v11) = v4;
    ++*(void *)(v2 + 16);
    uint64_t v4 = sub_1C9E0D6C0();
    if (!v4) {
      goto LABEL_16;
    }
  }
  char v12 = 0;
  unint64_t v13 = (unint64_t)(63 - v8) >> 6;
  while (++v10 != v13 || (v12 & 1) == 0)
  {
    BOOL v14 = v10 == v13;
    if (v10 == v13) {
      unint64_t v10 = 0;
    }
    v12 |= v14;
    uint64_t v15 = *(void *)(v7 + 8 * v10);
    if (v15 != -1)
    {
      unint64_t v11 = __clz(__rbit64(~v15)) + (v10 << 6);
      goto LABEL_15;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1C9E00050(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v7 = sub_1C9E0D710();
  uint64_t v8 = v7;
  if (*(void *)(v6 + 16))
  {
    uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
    id v35 = v3;
    uint64_t v36 = v6 + 64;
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v6 + 64);
    int64_t v12 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v13 = v7 + 64;
    uint64_t result = swift_retain();
    int64_t v15 = 0;
    if (!v11) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v16 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    for (unint64_t i = v16 | (v15 << 6); ; unint64_t i = __clz(__rbit64(v20)) + (v15 << 6))
    {
      unint64_t v22 = *(void **)(*(void *)(v6 + 48) + 8 * i);
      unint64_t v23 = *(void **)(*(void *)(v6 + 56) + 8 * i);
      if ((a2 & 1) == 0)
      {
        id v24 = v22;
        id v25 = v23;
      }
      uint64_t result = sub_1C9E0D3F0();
      uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
      unint64_t v27 = result & ~v26;
      unint64_t v28 = v27 >> 6;
      if (((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) == 0)
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
          uint64_t v33 = *(void *)(v13 + 8 * v28);
          if (v33 != -1)
          {
            unint64_t v29 = __clz(__rbit64(~v33)) + (v28 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
        return result;
      }
      unint64_t v29 = __clz(__rbit64((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v13 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v29;
      *(void *)(*(void *)(v8 + 48) + 8 * v29) = v22;
      *(void *)(*(void *)(v8 + 56) + 8 * v29) = v23;
      ++*(void *)(v8 + 16);
      if (v11) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v18 = v15 + 1;
      if (__OFADD__(v15, 1)) {
        goto LABEL_41;
      }
      if (v18 >= v12) {
        break;
      }
      id v19 = (void *)(v6 + 64);
      unint64_t v20 = *(void *)(v36 + 8 * v18);
      ++v15;
      if (!v20)
      {
        int64_t v15 = v18 + 1;
        if (v18 + 1 >= v12) {
          goto LABEL_32;
        }
        unint64_t v20 = *(void *)(v36 + 8 * v15);
        if (!v20)
        {
          int64_t v21 = v18 + 2;
          if (v21 >= v12)
          {
LABEL_32:
            swift_release();
            uint64_t v4 = v35;
            if ((a2 & 1) == 0) {
              goto LABEL_39;
            }
            goto LABEL_35;
          }
          unint64_t v20 = *(void *)(v36 + 8 * v21);
          if (!v20)
          {
            while (1)
            {
              int64_t v15 = v21 + 1;
              if (__OFADD__(v21, 1)) {
                goto LABEL_42;
              }
              if (v15 >= v12) {
                goto LABEL_32;
              }
              unint64_t v20 = *(void *)(v36 + 8 * v15);
              ++v21;
              if (v20) {
                goto LABEL_18;
              }
            }
          }
          int64_t v15 = v21;
        }
      }
LABEL_18:
      unint64_t v11 = (v20 - 1) & v20;
    }
    swift_release();
    uint64_t v4 = v35;
    id v19 = (void *)(v6 + 64);
    if ((a2 & 1) == 0) {
      goto LABEL_39;
    }
LABEL_35:
    uint64_t v34 = 1 << *(unsigned char *)(v6 + 32);
    if (v34 >= 64) {
      sub_1C9E07CB0(0, (unint64_t)(v34 + 63) >> 6, v19);
    }
    else {
      *id v19 = -1 << v34;
    }
    *(void *)(v6 + 16) = 0;
  }
LABEL_39:
  uint64_t result = swift_release();
  uint64_t *v4 = v8;
  return result;
}

uint64_t sub_1C9E00310(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C73D0);
  uint64_t v6 = sub_1C9E0D710();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v33 = v2;
    uint64_t v34 = v5 + 64;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v11 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v12 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    if (!v10) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v15 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    for (unint64_t i = v15 | (v14 << 6); ; unint64_t i = __clz(__rbit64(v19)) + (v14 << 6))
    {
      int64_t v21 = *(void **)(*(void *)(v5 + 48) + 8 * i);
      uint64_t v22 = *(void *)(*(void *)(v5 + 56) + 8 * i);
      if ((a2 & 1) == 0)
      {
        id v23 = v21;
        swift_retain();
      }
      uint64_t result = sub_1C9E0D3F0();
      uint64_t v24 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v25 = result & ~v24;
      unint64_t v26 = v25 >> 6;
      if (((-1 << v25) & ~*(void *)(v12 + 8 * (v25 >> 6))) == 0)
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v24) >> 6;
        while (++v26 != v29 || (v28 & 1) == 0)
        {
          BOOL v30 = v26 == v29;
          if (v26 == v29) {
            unint64_t v26 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v12 + 8 * v26);
          if (v31 != -1)
          {
            unint64_t v27 = __clz(__rbit64(~v31)) + (v26 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
        return result;
      }
      unint64_t v27 = __clz(__rbit64((-1 << v25) & ~*(void *)(v12 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v12 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
      *(void *)(*(void *)(v7 + 48) + 8 * v27) = v21;
      *(void *)(*(void *)(v7 + 56) + 8 * v27) = v22;
      ++*(void *)(v7 + 16);
      if (v10) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v17 = v14 + 1;
      if (__OFADD__(v14, 1)) {
        goto LABEL_41;
      }
      if (v17 >= v11) {
        break;
      }
      int64_t v18 = (void *)(v5 + 64);
      unint64_t v19 = *(void *)(v34 + 8 * v17);
      ++v14;
      if (!v19)
      {
        int64_t v14 = v17 + 1;
        if (v17 + 1 >= v11) {
          goto LABEL_32;
        }
        unint64_t v19 = *(void *)(v34 + 8 * v14);
        if (!v19)
        {
          int64_t v20 = v17 + 2;
          if (v20 >= v11)
          {
LABEL_32:
            swift_release();
            uint64_t v3 = v33;
            if ((a2 & 1) == 0) {
              goto LABEL_39;
            }
            goto LABEL_35;
          }
          unint64_t v19 = *(void *)(v34 + 8 * v20);
          if (!v19)
          {
            while (1)
            {
              int64_t v14 = v20 + 1;
              if (__OFADD__(v20, 1)) {
                goto LABEL_42;
              }
              if (v14 >= v11) {
                goto LABEL_32;
              }
              unint64_t v19 = *(void *)(v34 + 8 * v14);
              ++v20;
              if (v19) {
                goto LABEL_18;
              }
            }
          }
          int64_t v14 = v20;
        }
      }
LABEL_18:
      unint64_t v10 = (v19 - 1) & v19;
    }
    swift_release();
    uint64_t v3 = v33;
    int64_t v18 = (void *)(v5 + 64);
    if ((a2 & 1) == 0) {
      goto LABEL_39;
    }
LABEL_35:
    uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
    if (v32 >= 64) {
      sub_1C9E07CB0(0, (unint64_t)(v32 + 63) >> 6, v18);
    }
    else {
      *int64_t v18 = -1 << v32;
    }
    *(void *)(v5 + 16) = 0;
  }
LABEL_39:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1C9E005D8(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_1C9E0CFF0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C73E8);
  int v46 = a2;
  uint64_t v10 = sub_1C9E0D710();
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_40;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = *(void *)(v11 + 64);
  unint64_t v42 = (void *)(v11 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  uint64_t v40 = v3;
  int64_t v41 = (unint64_t)(v13 + 63) >> 6;
  unint64_t v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v45 = v6;
  int64_t v17 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v18 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  uint64_t v44 = v11;
  if (!v16) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v21 = __clz(__rbit64(v16));
  v16 &= v16 - 1;
  for (unint64_t i = v21 | (v20 << 6); ; unint64_t i = __clz(__rbit64(v25)) + (v20 << 6))
  {
    uint64_t v27 = *(void *)(v45 + 72);
    unint64_t v28 = *(void *)(v11 + 48) + v27 * i;
    if (v46)
    {
      (*v17)(v8, v28, v5);
      id v29 = *(id *)(*(void *)(v11 + 56) + 8 * i);
    }
    else
    {
      (*v43)(v8, v28, v5);
      id v29 = *(id *)(*(void *)(v11 + 56) + 8 * i);
    }
    sub_1C9E01590(&qword_1EA5C73D8, MEMORY[0x1E4F27990]);
    uint64_t result = sub_1C9E0D0F0();
    uint64_t v30 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v31 = result & ~v30;
    unint64_t v32 = v31 >> 6;
    if (((-1 << v31) & ~*(void *)(v18 + 8 * (v31 >> 6))) == 0)
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v30) >> 6;
      while (++v32 != v35 || (v34 & 1) == 0)
      {
        BOOL v36 = v32 == v35;
        if (v32 == v35) {
          unint64_t v32 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v18 + 8 * v32);
        if (v37 != -1)
        {
          unint64_t v33 = __clz(__rbit64(~v37)) + (v32 << 6);
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
    unint64_t v33 = __clz(__rbit64((-1 << v31) & ~*(void *)(v18 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
LABEL_31:
    *(void *)(v18 + ((v33 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v33;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 48) + v27 * v33, v8, v5);
    *(void *)(*(void *)(v12 + 56) + 8 * v33) = v29;
    ++*(void *)(v12 + 16);
    uint64_t v11 = v44;
    if (v16) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v23 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      goto LABEL_42;
    }
    if (v23 >= v41)
    {
      swift_release();
      uint64_t v3 = v40;
      uint64_t v24 = v42;
      goto LABEL_35;
    }
    uint64_t v24 = v42;
    unint64_t v25 = v42[v23];
    ++v20;
    if (!v25)
    {
      int64_t v20 = v23 + 1;
      if (v23 + 1 >= v41) {
        goto LABEL_33;
      }
      unint64_t v25 = v42[v20];
      if (!v25) {
        break;
      }
    }
LABEL_18:
    unint64_t v16 = (v25 - 1) & v25;
  }
  int64_t v26 = v23 + 2;
  if (v26 < v41)
  {
    unint64_t v25 = v42[v26];
    if (!v25)
    {
      while (1)
      {
        int64_t v20 = v26 + 1;
        if (__OFADD__(v26, 1)) {
          goto LABEL_43;
        }
        if (v20 >= v41) {
          goto LABEL_33;
        }
        unint64_t v25 = v42[v20];
        ++v26;
        if (v25) {
          goto LABEL_18;
        }
      }
    }
    int64_t v20 = v26;
    goto LABEL_18;
  }
LABEL_33:
  swift_release();
  uint64_t v3 = v40;
LABEL_35:
  if (v46)
  {
    uint64_t v38 = 1 << *(unsigned char *)(v11 + 32);
    if (v38 >= 64) {
      sub_1C9E07CB0(0, (unint64_t)(v38 + 63) >> 6, v24);
    }
    else {
      *uint64_t v24 = -1 << v38;
    }
    *(void *)(v11 + 16) = 0;
  }
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v12;
  return result;
}

char *sub_1C9E009F0(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1C9E00A30(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

size_t sub_1C9E00A10(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_1C9E00B14(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_1C9E00A30(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C7390);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_1C9DFF4E0(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C9DFF6A4((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

size_t sub_1C9E00B14(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
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
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA5C7338);
  uint64_t v10 = *(void *)(sub_1C9E0CFF0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_24;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_1C9E0CFF0() - 8);
  unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v17 = (unint64_t)v13 + v16;
  unint64_t v18 = a4 + v16;
  if (v5)
  {
    sub_1C9DFF574(v18, v8, v17);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C9DFF888(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

uint64_t sub_1C9E00CB0()
{
  return sub_1C9E0D100() & 1;
}

BOOL sub_1C9E00D40(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  id v29 = a1;
  uint64_t v4 = sub_1C9E0CFF0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C7328);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(a3 + 16);
  v23[1] = a3;
  if (v11)
  {
    uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    uint64_t v27 = v7;
    unint64_t v28 = v13;
    uint64_t v14 = a3 + ((*(unsigned __int8 *)(v12 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 64));
    uint64_t v15 = *(void *)(v12 + 56);
    int64_t v26 = (void (**)(char *, char *, uint64_t))(v12 + 16);
    uint64_t v24 = v15;
    unint64_t v25 = (void (**)(char *, uint64_t))(v12 - 8);
    swift_bridgeObjectRetain();
    unint64_t v16 = v27;
    while (1)
    {
      v28(v10, v14, v4);
      __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v4);
      int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v4);
      BOOL v18 = EnumTagSinglePayload != 1;
      if (EnumTagSinglePayload == 1) {
        break;
      }
      (*v26)(v16, v10, v4);
      uint64_t v19 = v30;
      char v20 = v29(v16);
      if (v19)
      {
        (*v25)(v16, v4);
        swift_bridgeObjectRelease();
        return v18;
      }
      char v21 = v20;
      uint64_t v30 = 0;
      (*v25)(v16, v4);
      if (v21) {
        break;
      }
      v14 += v24;
      if (!--v11) {
        goto LABEL_9;
      }
    }
  }
  else
  {
    swift_bridgeObjectRetain();
LABEL_9:
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 1, 1, v4);
    BOOL v18 = 0;
  }
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t sub_1C9E00FB8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = -1;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  *a2 = a1;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v5 = v6;
  if (-v3 < 64) {
    uint64_t v2 = ~(-1 << -(char)v3);
  }
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

uint64_t sub_1C9E00FF0(void *a1)
{
  id v1 = objc_msgSend(a1, sel_homeKitAccessoryIdentifier);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_1C9E0D120();

  return v3;
}

uint64_t sub_1C9E01054(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1C9E0D700();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_1C9E0D700();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_1C9E0218C(&qword_1EA5C7350, &qword_1EA5C7348);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C7348);
            uint64_t v10 = sub_1C9E013D4(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void *, void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_1C9DFF7A4((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5, (unint64_t *)&unk_1EA5C7318);
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1C9E01214(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1C9E0D700();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_1C9E0D700();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_1C9E0218C(&qword_1EA5C7360, &qword_1EA5C71B0);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C71B0);
            uint64_t v10 = sub_1C9E01440(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void *, void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_1C9DFF7A4((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5, &qword_1EA5C7358);
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t (*sub_1C9E013D4(void *a1, unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_1C9E014F0(v6, a2, a3);
  return sub_1C9E0143C;
}

uint64_t (*sub_1C9E01440(void *a1, unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_1C9E015D8(v6, a2, a3);
  return sub_1C9E0143C;
}

void sub_1C9E014A8(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_1C9E014F0(void *a1, unint64_t a2, uint64_t a3))(id *)
{
  unint64_t v6 = a3 & 0xC000000000000001;
  sub_1C9DFF9A0(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6) {
    id v7 = (id)MEMORY[0x1CB78F680](a2, a3);
  }
  else {
    id v7 = *(id *)(a3 + 8 * a2 + 32);
  }
  *a1 = v7;
  return sub_1C9E02964;
}

uint64_t sub_1C9E01570()
{
  return sub_1C9E00CB0() & 1;
}

uint64_t sub_1C9E01590(unint64_t *a1, void (*a2)(uint64_t))
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

void (*sub_1C9E015D8(void *a1, unint64_t a2, uint64_t a3))(id *a1)
{
  unint64_t v6 = a3 & 0xC000000000000001;
  sub_1C9DFF9A0(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6) {
    id v7 = (id)MEMORY[0x1CB78F680](a2, a3);
  }
  else {
    id v7 = *(id *)(a3 + 8 * a2 + 32);
  }
  *a1 = v7;
  return sub_1C9E01658;
}

void sub_1C9E01658(id *a1)
{
}

unint64_t sub_1C9E01660()
{
  unint64_t result = qword_1EA5C7368;
  if (!qword_1EA5C7368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C7368);
  }
  return result;
}

uint64_t sub_1C9E016AC()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1C9E016E4()
{
}

void sub_1C9E0172C()
{
}

uint64_t sub_1C9E01774()
{
  return sub_1C9DEF390(*(void *)(v0 + 16));
}

uint64_t sub_1C9E01790()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1C9E017C8()
{
  swift_release();
  swift_release();
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_46_0();
  return MEMORY[0x1F4186498](v0, v1, v2);
}

uint64_t sub_1C9E01808(uint64_t a1)
{
  return sub_1C9DF9D2C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(id *)(v1 + 40));
}

uint64_t sub_1C9E01814(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1C9DD7D6C(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1C9E01864()
{
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_47();
  return MEMORY[0x1F4186498](v0, v1, v2);
}

uint64_t sub_1C9E01894(uint64_t a1)
{
  return sub_1C9DF9244(a1, *(void (**)(void))(v1 + 16));
}

uint64_t sub_1C9E0189C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C73E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C9E01904(void *a1)
{
  return sub_1C9DF88A0(a1, *(uint64_t (**)(void))(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_1C9E0190C()
{
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_46_0();
  return MEMORY[0x1F4186498](v0, v1, v2);
}

uint64_t sub_1C9E0193C(unint64_t a1)
{
  return sub_1C9DF8B44(a1, *(void (**)(uint64_t))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_1C9E01948()
{
  return objectdestroy_152Tm(&qword_1EA5C73F0);
}

uint64_t sub_1C9E01954()
{
  return sub_1C9E01BF8(&qword_1EA5C73F0, sub_1C9DF7870);
}

uint64_t sub_1C9E01974()
{
  return objectdestroy_158Tm(&qword_1EA5C73F0);
}

uint64_t sub_1C9E01980()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C73F0);
  OUTLINED_FUNCTION_2_6(v0);
  uint64_t v1 = OUTLINED_FUNCTION_49();
  return sub_1C9DF7AB0(v1);
}

uint64_t sub_1C9E019C8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C73F8);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_28_0();
  uint64_t v0 = OUTLINED_FUNCTION_3_6();
  v1(v0);
  uint64_t v2 = OUTLINED_FUNCTION_20_1();
  return MEMORY[0x1F4186498](v2, v3, v4);
}

uint64_t sub_1C9E01A4C()
{
  return sub_1C9E01F98(&qword_1EA5C73F8, (uint64_t (*)(uint64_t, uint64_t, uint64_t, char *))sub_1C9DF6E08);
}

uint64_t sub_1C9E01A6C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C73F8);
  OUTLINED_FUNCTION_18_1();
  v1 += 8;
  uint64_t v2 = *(unsigned __int8 *)(v1 + 72);
  uint64_t v3 = ((v2 + 32) & ~v2) + *(void *)(v1 + 56);
  uint64_t v4 = v2 | 7;
  OUTLINED_FUNCTION_8_0();
  v5();
  return MEMORY[0x1F4186498](v0, v3, v4);
}

uint64_t sub_1C9E01AF0(unint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C73F8);
  OUTLINED_FUNCTION_2_6(v3);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  return sub_1C9DF6FF4(a1, v4, v5);
}

uint64_t sub_1C9E01B48()
{
  return objectdestroy_152Tm((uint64_t *)&unk_1EA5C7400);
}

uint64_t objectdestroy_152Tm(uint64_t *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(a1);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_28_0();
  swift_bridgeObjectRelease();
  uint64_t v1 = OUTLINED_FUNCTION_3_6();
  v2(v1);
  uint64_t v3 = OUTLINED_FUNCTION_20_1();
  return MEMORY[0x1F4186498](v3, v4, v5);
}

uint64_t sub_1C9E01BD8()
{
  return sub_1C9E01BF8((uint64_t *)&unk_1EA5C7400, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1C9DF4F84);
}

uint64_t sub_1C9E01BF8(uint64_t *a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a1);
  OUTLINED_FUNCTION_2_6(v3);
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a2(v5, v6, v7);
}

uint64_t sub_1C9E01C4C()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA5C7400);
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_59();
  OUTLINED_FUNCTION_8_0();
  v0();
  swift_release();
  swift_release();
  uint64_t v1 = OUTLINED_FUNCTION_45_0();
  return MEMORY[0x1F4186498](v1, v2, v3);
}

uint64_t sub_1C9E01CE8(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA5C7400);
  OUTLINED_FUNCTION_12_1(v3);
  OUTLINED_FUNCTION_44_0();
  uint64_t v6 = *(void *)(v1 + v5);
  uint64_t v7 = *(void *)(v1 + ((v5 + 15) & 0xFFFFFFFFFFFFFFF8));
  return sub_1C9DF5D80(a1, v1 + v4, v6, v7);
}

uint64_t sub_1C9E01D68()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA5C7410);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_38_0();

  uint64_t v1 = OUTLINED_FUNCTION_3_6();
  v2(v1);
  uint64_t v3 = OUTLINED_FUNCTION_20_1();
  return MEMORY[0x1F4186498](v3, v4, v5);
}

uint64_t sub_1C9E01DFC()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA5C7410);
  OUTLINED_FUNCTION_2_6(v1);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = *(void (**)(char *, uint64_t, uint64_t))(v0 + 24);
  uint64_t v5 = *(void (**)(uint64_t, char *, uint64_t))(v0 + 32);
  int v6 = *(unsigned __int8 *)(v0 + 40);
  uint64_t v7 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 41) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return sub_1C9DF3314(v3, v4, v5, v6, v7);
}

uint64_t sub_1C9E01E4C()
{
  return objectdestroy_158Tm((uint64_t *)&unk_1EA5C7410);
}

void sub_1C9E01E58(uint64_t a1)
{
}

void sub_1C9E01E64(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_2_6(v2);
  sub_1C9DF3B84();
}

uint64_t sub_1C9E01EB8()
{
  return objectdestroy_202Tm((uint64_t *)&unk_1EA5C7410);
}

uint64_t sub_1C9E01EC4(uint64_t a1)
{
  return sub_1C9E020B0(a1, (uint64_t *)&unk_1EA5C7410, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1C9DF3DE4);
}

uint64_t sub_1C9E01EE4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C7420);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_38_0();

  uint64_t v1 = OUTLINED_FUNCTION_3_6();
  v2(v1);
  uint64_t v3 = OUTLINED_FUNCTION_20_1();
  return MEMORY[0x1F4186498](v3, v4, v5);
}

uint64_t sub_1C9E01F78()
{
  return sub_1C9E01F98(&qword_1EA5C7420, (uint64_t (*)(uint64_t, uint64_t, uint64_t, char *))sub_1C9DF1C24);
}

uint64_t sub_1C9E01F98(uint64_t *a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, char *))
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a1);
  OUTLINED_FUNCTION_2_6(v3);
  uint64_t v5 = v2[2];
  uint64_t v6 = v2[3];
  uint64_t v7 = v2[4];
  uint64_t v8 = (char *)v2 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a2(v5, v6, v7, v8);
}

uint64_t sub_1C9E01FF0()
{
  return objectdestroy_158Tm(&qword_1EA5C7420);
}

void sub_1C9E01FFC(uint64_t a1)
{
}

uint64_t sub_1C9E02008()
{
  return objectdestroy_202Tm(&qword_1EA5C7420);
}

uint64_t objectdestroy_202Tm(uint64_t *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(a1);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_38_0();
  uint64_t v1 = OUTLINED_FUNCTION_3_6();
  v2(v1);
  uint64_t v3 = OUTLINED_FUNCTION_20_1();
  return MEMORY[0x1F4186498](v3, v4, v5);
}

uint64_t sub_1C9E02090(uint64_t a1)
{
  return sub_1C9E020B0(a1, &qword_1EA5C7420, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1C9DF22B8);
}

uint64_t sub_1C9E020B0(uint64_t a1, uint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_2_6(v5);
  uint64_t v7 = *(void *)(v3 + 16);
  uint64_t v8 = v3 + ((*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a3(a1, v7, v8);
}

void sub_1C9E02118()
{
}

uint64_t sub_1C9E02160()
{
  return objectdestroy_228Tm(&qword_1EA5C7448);
}

uint64_t sub_1C9E0216C()
{
  return sub_1C9E025C8(&qword_1EA5C7448, (uint64_t (*)(uint64_t))sub_1C9DFAB04);
}

uint64_t sub_1C9E0218C(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_1C9E021D0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C7448);
  OUTLINED_FUNCTION_0_1();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = v5 | 7;
  unint64_t v7 = (*(void *)(v4 + 64) + ((v5 + 24) & ~v5) + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  uint64_t v8 = OUTLINED_FUNCTION_3_6();
  v9(v8);

  return MEMORY[0x1F4186498](v0, v7 + 8, v6);
}

uint64_t sub_1C9E02284(unsigned __int8 a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C7448);
  OUTLINED_FUNCTION_12_1(v3);
  OUTLINED_FUNCTION_44_0();
  uint64_t v5 = *(void *)(v1 + 16);
  unint64_t v7 = *(char **)(v1 + v6);
  return sub_1C9DFB8FC(a1, v5, v1 + v4, v7);
}

BOOL sub_1C9E022FC()
{
  return sub_1C9DFC130();
}

uint64_t sub_1C9E02304()
{
  swift_release();
  uint64_t v1 = OUTLINED_FUNCTION_47();
  return MEMORY[0x1F4186498](v1, v2, v3);
}

uint64_t sub_1C9E0233C()
{
  return sub_1C9DFC244(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

BOOL sub_1C9E02344()
{
  return sub_1C9DFC4F4();
}

uint64_t sub_1C9E0234C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C7448);
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_59();
  OUTLINED_FUNCTION_8_0();
  v2();

  uint64_t v3 = OUTLINED_FUNCTION_45_0();
  return MEMORY[0x1F4186498](v3, v4, v5);
}

uint64_t sub_1C9E023D0(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C7448);
  OUTLINED_FUNCTION_12_1(v3);
  OUTLINED_FUNCTION_44_0();
  uint64_t v6 = *(void *)(v1 + v5);
  return sub_1C9DFBDA4(a1, v1 + v4, v6);
}

unint64_t sub_1C9E02444()
{
  unint64_t result = qword_1EA5C74D0;
  if (!qword_1EA5C74D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C74D0);
  }
  return result;
}

uint64_t sub_1C9E02490()
{
  return objectdestroy_228Tm(&qword_1EA5C74D8);
}

uint64_t sub_1C9E0249C()
{
  return sub_1C9E025C8(&qword_1EA5C74D8, (uint64_t (*)(uint64_t))sub_1C9DF0F50);
}

uint64_t sub_1C9E024BC()
{
  return objectdestroy_158Tm(&qword_1EA5C74D8);
}

void sub_1C9E024C8(uint64_t a1)
{
}

uint64_t sub_1C9E024D4()
{
  return objectdestroy_158Tm(&qword_1EA5C74D8);
}

uint64_t sub_1C9E024E4()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C74D8);
  OUTLINED_FUNCTION_2_6(v0);
  uint64_t v1 = (void *)OUTLINED_FUNCTION_49();
  return sub_1C9DF13F4(v1);
}

uint64_t sub_1C9E02520()
{
  return objectdestroy_228Tm(&qword_1EA5C74D8);
}

uint64_t objectdestroy_228Tm(uint64_t *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(a1);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_28_0();
  uint64_t v1 = OUTLINED_FUNCTION_3_6();
  v2(v1);
  uint64_t v3 = OUTLINED_FUNCTION_20_1();
  return MEMORY[0x1F4186498](v3, v4, v5);
}

uint64_t sub_1C9E025A8()
{
  return sub_1C9E025C8(&qword_1EA5C74D8, (uint64_t (*)(uint64_t))sub_1C9DF0888);
}

uint64_t sub_1C9E025C8(uint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  OUTLINED_FUNCTION_2_6(v2);
  uint64_t v3 = OUTLINED_FUNCTION_51();
  return a2(v3);
}

uint64_t sub_1C9E02610()
{
  return objectdestroy_158Tm(&qword_1EA5C74D8);
}

uint64_t sub_1C9E0261C()
{
  return objectdestroy_158Tm(&qword_1EA5C74D8);
}

uint64_t objectdestroy_158Tm(uint64_t *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(a1);
  OUTLINED_FUNCTION_18_1();
  v2 += 8;
  uint64_t v3 = *(unsigned __int8 *)(v2 + 72);
  uint64_t v4 = ((v3 + 16) & ~v3) + *(void *)(v2 + 56);
  uint64_t v5 = v3 | 7;
  OUTLINED_FUNCTION_8_0();
  v6();
  return MEMORY[0x1F4186498](v1, v4, v5);
}

uint64_t sub_1C9E026A4(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_8_0();
  v3();
  return a1;
}

uint64_t sub_1C9E026F0()
{
  OUTLINED_FUNCTION_4_2();
  uint64_t v2 = v1;
  uint64_t v3 = *(int **)(v0 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_6_2(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_1C9DF03E4;
  unint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1EA5C74E0 + dword_1EA5C74E0);
  return v7(v2, v3);
}

uint64_t sub_1C9E027A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C7328);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_2_6(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_3_6()
{
  return v0 + v1;
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

uint64_t OUTLINED_FUNCTION_12_1(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_20_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_21_1()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_22_1()
{
  return v0;
}

void OUTLINED_FUNCTION_28_0()
{
  uint64_t v2 = *(void **)(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_31_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 + a2) = a1;
  return MEMORY[0x1F41817F8]();
}

int8x16_t OUTLINED_FUNCTION_35_0(int8x16_t *a1)
{
  *(void *)(v2 + 56) = a1;
  int8x16_t result = vextq_s8(*(int8x16_t *)(v2 + 24), *(int8x16_t *)(v2 + 24), 8uLL);
  a1[1] = result;
  a1[2].i64[0] = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_36_0()
{
  return v0 - 136;
}

uint64_t OUTLINED_FUNCTION_38_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_39()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_40_0()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_41_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_42_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_43_0(uint64_t result)
{
  *(void *)(v2 + 32) = result;
  *(void *)(result + 16) = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_45_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_46_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_47()
{
  return v0;
}

void OUTLINED_FUNCTION_48(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_49()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_50()
{
  return *(void *)(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_51()
{
  return *(void *)(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_52()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_54(uint64_t a1)
{
  *(void *)(v1 - 128) = a1;
  return v1 - 128;
}

uint64_t OUTLINED_FUNCTION_60()
{
  return v0;
}

uint64_t sub_1C9E02CD8()
{
  sub_1C9E02E40();
  uint64_t result = sub_1C9E0D410();
  qword_1EA5C9890 = result;
  return result;
}

uint64_t sub_1C9E02D44()
{
  sub_1C9E02E40();
  uint64_t result = sub_1C9E0D410();
  qword_1EA5C9898 = result;
  return result;
}

uint64_t sub_1C9E02DB0(uint64_t a1)
{
  return sub_1C9E02EAC(a1, qword_1EA5C98A0, &qword_1EA5C6A60, (id *)&qword_1EA5C9890);
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

unint64_t sub_1C9E02E40()
{
  unint64_t result = qword_1EA5C75C0;
  if (!qword_1EA5C75C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA5C75C0);
  }
  return result;
}

uint64_t sub_1C9E02E80(uint64_t a1)
{
  return sub_1C9E02EAC(a1, qword_1EA5C98B8, &qword_1EA5C6A68, (id *)&qword_1EA5C9898);
}

uint64_t sub_1C9E02EAC(uint64_t a1, uint64_t *a2, void *a3, id *a4)
{
  uint64_t v7 = sub_1C9E0D010();
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  if (*a3 != -1) {
    swift_once();
  }
  id v8 = *a4;
  return sub_1C9E0D020();
}

uint64_t sub_1C9E02F38(unint64_t a1, char *a2)
{
  if (a1 >> 62) {
    goto LABEL_30;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_1C9E0D700())
  {
    uint64_t v17 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution26AssistantEnabledCapability_primitivesMap;
    uint64_t v4 = 4;
    while (1)
    {
      os_log_type_t v5 = (a1 & 0xC000000000000001) != 0
         ? (char *)MEMORY[0x1CB78F680](v4 - 4, a1)
         : (char *)*(id *)(a1 + 8 * v4);
      uint64_t v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      uint64_t v8 = *(void *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key];
      unint64_t v9 = *(void *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key + 8];
      swift_bridgeObjectRetain();
      if ((sub_1C9E0D1A0() & 1) == 0)
      {

        swift_bridgeObjectRelease();
LABEL_27:
        swift_bridgeObjectRelease();
        return 0;
      }
      swift_bridgeObjectRetain();
      if ((sub_1C9E0D1A0() & 1) == 0)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
LABEL_20:
        swift_bridgeObjectRelease();
        uint64_t v15 = a2;
        goto LABEL_24;
      }
      unint64_t v10 = sub_1C9E0D160();
      unint64_t v11 = sub_1C9E09684(v10, v8, v9);
      MEMORY[0x1CB78F240](v11);
      swift_bridgeObjectRelease();
      uint64_t v12 = sub_1C9E0D750();
      swift_bridgeObjectRelease();
      if (v12)
      {
        swift_bridgeObjectRelease();

        goto LABEL_20;
      }
      if (!*(void *)(*(void *)&a2[v17] + 16)) {
        goto LABEL_23;
      }
      swift_bridgeObjectRetain();
      sub_1C9DD5CF8(v8, v9);
      if ((v13 & 1) == 0)
      {
        swift_bridgeObjectRelease();
LABEL_23:
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        uint64_t v15 = v6;
LABEL_24:

        return 0;
      }
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      type metadata accessor for BooleanCapabilityPrimitive();
      if (!swift_dynamicCastClass())
      {

        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        return 0;
      }
      swift_unknownObjectRetain();
      char v14 = sub_1C9DE3C80((uint64_t)v6);

      swift_unknownObjectRelease_n();
      if ((v14 & 1) == 0)
      {

        goto LABEL_27;
      }
      ++v4;
      if (v7 == v3) {
        goto LABEL_31;
      }
    }
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
  }
LABEL_31:

  swift_bridgeObjectRelease();
  return 1;
}

id AssistantEnabledCapability.__allocating_init(status:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return AssistantEnabledCapability.init(status:)(a1);
}

uint64_t sub_1C9E032BC(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution26AssistantEnabledCapability_primitivesMap) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9E03320()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution26AssistantEnabledCapability_key);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1C9E033E8(uint64_t a1, uint64_t a2)
{
  os_log_type_t v5 = (void *)(v2 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution26AssistantEnabledCapability_key);
  swift_beginAccess();
  *os_log_type_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9E03448(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_1C9E033E8(v1, v2);
}

uint64_t (*sub_1C9E03488())()
{
  return j__swift_endAccess;
}

id AssistantEnabledCapability.init(status:)(uint64_t a1)
{
  uint64_t v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution26AssistantEnabledCapability_primitivesMap;
  uint64_t v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC80980);
  *(void *)&v1[v3] = sub_1C9E0D0D0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution26AssistantEnabledCapability_key]);

  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for AssistantEnabledCapability();
  id v5 = objc_msgSendSuper2(&v12, sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC808D8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C9E0F330;
  *(void *)(inited + 32) = 0xD000000000000029;
  *(void *)(inited + 40) = 0x80000001C9E12150;
  objc_allocWithZone((Class)type metadata accessor for BooleanCapabilityPrimitive());
  id v7 = v5;
  *(void *)(inited + 48) = sub_1C9DE3B00(a1);
  uint64_t v8 = sub_1C9E0D0D0();
  sub_1C9DD60F4(v8);
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  sub_1C9DD69FC(9, v10);
  swift_bridgeObjectRelease();

  return v7;
}

uint64_t type metadata accessor for AssistantEnabledCapability()
{
  return self;
}

uint64_t sub_1C9E036D0()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution26AssistantEnabledCapability_primitivesMap);
  swift_bridgeObjectRetain();
  unint64_t v2 = OUTLINED_FUNCTION_1_1();
  uint64_t v4 = sub_1C9DD6B68(v2, v3, v1);
  swift_bridgeObjectRelease();
  if (!v4) {
    return 0;
  }
  type metadata accessor for BooleanCapabilityPrimitive();
  uint64_t v5 = swift_dynamicCastClass();
  if (v5) {
    uint64_t v6 = *(void *)(v5 + OBJC_IVAR___SVDBooleanCapabilityPrimitive_supportStatus);
  }
  else {
    uint64_t v6 = 0;
  }
  swift_unknownObjectRelease();
  return v6;
}

id sub_1C9E03768(uint64_t a1)
{
  type metadata accessor for BooleanCapabilityPrimitive();
  unint64_t v2 = OUTLINED_FUNCTION_1_1();
  return sub_1C9DE3B5C(v2, v3, a1);
}

uint64_t sub_1C9E037D4(unint64_t a1)
{
  return sub_1C9E02F38(a1, (char *)v1) & 1;
}

uint64_t static AssistantEnabledCapability.supportsSecureCoding.getter()
{
  return 1;
}

char *AssistantEnabledCapability.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return AssistantEnabledCapability.init(coder:)(a1);
}

char *AssistantEnabledCapability.init(coder:)(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution26AssistantEnabledCapability_primitivesMap;
  uint64_t v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC80980);
  *(void *)&v1[v3] = sub_1C9E0D0D0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution26AssistantEnabledCapability_key]);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for AssistantEnabledCapability();
  uint64_t v5 = (char *)objc_msgSendSuper2(&v7, sel_init);
  sub_1C9DD7724((uint64_t)a1);

  if (!*(void *)(*(void *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution26AssistantEnabledCapability_primitivesMap]
                  + 16))
  {

    return 0;
  }
  return v5;
}

id AssistantEnabledCapability.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void AssistantEnabledCapability.init()()
{
}

id AssistantEnabledCapability.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AssistantEnabledCapability();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C9E03B30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1C9E03320();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t method lookup function for AssistantEnabledCapability(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AssistantEnabledCapability);
}

uint64_t dispatch thunk of AssistantEnabledCapability.key.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of AssistantEnabledCapability.key.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of AssistantEnabledCapability.key.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of AssistantEnabledCapability.__allocating_init(status:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of AssistantEnabledCapability.supportsAssistantEnabled.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of static AssistantEnabledCapability.capabilityDescriptionMatchingSupportStatus(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of AssistantEnabledCapability.matches(descriptions:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of AssistantEnabledCapability.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of AssistantEnabledCapability.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB8))();
}

uint64_t static DeviceSelectionIntent.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t sub_1C9E03CFC(unint64_t a1, char *a2)
{
  if (a1 >> 62) {
    goto LABEL_30;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_1C9E0D700())
  {
    uint64_t v17 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution13MUXCapability_primitivesMap;
    uint64_t v4 = 4;
    while (1)
    {
      uint64_t v5 = (a1 & 0xC000000000000001) != 0
         ? (char *)MEMORY[0x1CB78F680](v4 - 4, a1)
         : (char *)*(id *)(a1 + 8 * v4);
      uint64_t v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      uint64_t v9 = *(void *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key];
      unint64_t v8 = *(void *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key + 8];
      swift_bridgeObjectRetain();
      if ((sub_1C9E0D1A0() & 1) == 0)
      {

        swift_bridgeObjectRelease();
LABEL_27:
        swift_bridgeObjectRelease();
        return 0;
      }
      swift_bridgeObjectRetain();
      if ((sub_1C9E0D1A0() & 1) == 0)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
LABEL_20:
        swift_bridgeObjectRelease();
        uint64_t v15 = a2;
        goto LABEL_24;
      }
      uint64_t v19 = v6;
      unint64_t v10 = sub_1C9E0D160();
      unint64_t v11 = sub_1C9E09684(v10, v9, v8);
      MEMORY[0x1CB78F240](v11);
      swift_bridgeObjectRelease();
      uint64_t v12 = sub_1C9E0D750();
      swift_bridgeObjectRelease();
      if (v12)
      {
        swift_bridgeObjectRelease();

        goto LABEL_20;
      }
      if (!*(void *)(*(void *)&a2[v17] + 16)) {
        goto LABEL_23;
      }
      swift_bridgeObjectRetain();
      sub_1C9DD5CF8(v9, v8);
      if ((v13 & 1) == 0)
      {
        swift_bridgeObjectRelease();
LABEL_23:
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        uint64_t v15 = v19;
LABEL_24:

        return 0;
      }
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      type metadata accessor for BooleanCapabilityPrimitive();
      if (!swift_dynamicCastClass())
      {

        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        return 0;
      }
      swift_unknownObjectRetain();
      char v14 = sub_1C9DE3C80((uint64_t)v19);

      swift_unknownObjectRelease_n();
      if ((v14 & 1) == 0)
      {

        goto LABEL_27;
      }
      ++v4;
      if (v7 == v3) {
        goto LABEL_31;
      }
    }
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
  }
LABEL_31:

  swift_bridgeObjectRelease();
  return 1;
}

id MUXCapability.__allocating_init(status:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return MUXCapability.init(status:)(a1);
}

uint64_t sub_1C9E04098(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution13MUXCapability_primitivesMap) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9E040FC()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution13MUXCapability_key);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1C9E041C4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution13MUXCapability_key);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9E04224(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_1C9E041C4(v1, v2);
}

uint64_t (*sub_1C9E04264())()
{
  return j__swift_endAccess;
}

id MUXCapability.init(status:)(uint64_t a1)
{
  uint64_t v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution13MUXCapability_primitivesMap;
  uint64_t v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC80980);
  *(void *)&v1[v3] = sub_1C9E0D0D0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution13MUXCapability_key]);

  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for MUXCapability();
  id v5 = objc_msgSendSuper2(&v12, sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC808D8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C9E0F330;
  *(void *)(inited + 32) = 0xD00000000000001CLL;
  *(void *)(inited + 40) = 0x80000001C9E12270;
  objc_allocWithZone((Class)type metadata accessor for BooleanCapabilityPrimitive());
  id v7 = v5;
  *(void *)(inited + 48) = sub_1C9DE3B00(a1);
  uint64_t v8 = sub_1C9E0D0D0();
  sub_1C9DD60F4(v8);
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  sub_1C9DD69A4(8, v10);
  swift_bridgeObjectRelease();

  return v7;
}

uint64_t type metadata accessor for MUXCapability()
{
  return self;
}

uint64_t sub_1C9E044AC()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution13MUXCapability_primitivesMap);
  swift_bridgeObjectRetain();
  unint64_t v2 = OUTLINED_FUNCTION_1_12();
  uint64_t v4 = sub_1C9DD6B68(v2, v3, v1);
  swift_bridgeObjectRelease();
  if (!v4) {
    return 0;
  }
  type metadata accessor for BooleanCapabilityPrimitive();
  uint64_t v5 = swift_dynamicCastClass();
  if (v5) {
    uint64_t v6 = *(void *)(v5 + OBJC_IVAR___SVDBooleanCapabilityPrimitive_supportStatus);
  }
  else {
    uint64_t v6 = 0;
  }
  swift_unknownObjectRelease();
  return v6;
}

id sub_1C9E04544(uint64_t a1)
{
  type metadata accessor for BooleanCapabilityPrimitive();
  unint64_t v2 = OUTLINED_FUNCTION_1_12();
  return sub_1C9DE3B5C(v2, v3, a1);
}

uint64_t sub_1C9E045B0(unint64_t a1)
{
  return sub_1C9E03CFC(a1, (char *)v1) & 1;
}

uint64_t static MUXCapability.supportsSecureCoding.getter()
{
  return 1;
}

char *MUXCapability.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return MUXCapability.init(coder:)(a1);
}

char *MUXCapability.init(coder:)(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution13MUXCapability_primitivesMap;
  uint64_t v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC80980);
  *(void *)&v1[v3] = sub_1C9E0D0D0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution13MUXCapability_key]);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for MUXCapability();
  uint64_t v5 = (char *)objc_msgSendSuper2(&v7, sel_init);
  sub_1C9DD7750((uint64_t)a1);

  if (!*(void *)(*(void *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution13MUXCapability_primitivesMap] + 16))
  {

    return 0;
  }
  return v5;
}

id MUXCapability.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void MUXCapability.init()()
{
}

id MUXCapability.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MUXCapability();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C9E0490C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1C9E040FC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t method lookup function for MUXCapability(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for MUXCapability);
}

uint64_t dispatch thunk of MUXCapability.key.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of MUXCapability.key.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of MUXCapability.key.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of MUXCapability.__allocating_init(status:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of MUXCapability.supportsMUX.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of static MUXCapability.capabilityDescriptionMatchingSupportStatus(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of MUXCapability.matches(descriptions:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of MUXCapability.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of MUXCapability.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

unint64_t OUTLINED_FUNCTION_1_12()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_1C9E04ADC(unint64_t a1, char *a2)
{
  if (a1 >> 62) {
    goto LABEL_30;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_1C9E0D700())
  {
    uint64_t v17 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution19AppLaunchCapability_primitivesMap;
    uint64_t v4 = 4;
    while (1)
    {
      uint64_t v5 = (a1 & 0xC000000000000001) != 0
         ? (char *)MEMORY[0x1CB78F680](v4 - 4, a1)
         : (char *)*(id *)(a1 + 8 * v4);
      uint64_t v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      uint64_t v8 = *(void *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key];
      unint64_t v9 = *(void *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key + 8];
      swift_bridgeObjectRetain();
      if ((sub_1C9E0D1A0() & 1) == 0)
      {

        swift_bridgeObjectRelease();
LABEL_27:
        swift_bridgeObjectRelease();
        return 0;
      }
      swift_bridgeObjectRetain();
      if ((sub_1C9E0D1A0() & 1) == 0)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
LABEL_20:
        swift_bridgeObjectRelease();
        uint64_t v15 = a2;
        goto LABEL_24;
      }
      unint64_t v10 = sub_1C9E0D160();
      unint64_t v11 = sub_1C9E09684(v10, v8, v9);
      MEMORY[0x1CB78F240](v11);
      swift_bridgeObjectRelease();
      uint64_t v12 = sub_1C9E0D750();
      swift_bridgeObjectRelease();
      if (v12)
      {
        swift_bridgeObjectRelease();

        goto LABEL_20;
      }
      if (!*(void *)(*(void *)&a2[v17] + 16)) {
        goto LABEL_23;
      }
      swift_bridgeObjectRetain();
      sub_1C9DD5CF8(v8, v9);
      if ((v13 & 1) == 0)
      {
        swift_bridgeObjectRelease();
LABEL_23:
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        uint64_t v15 = v6;
LABEL_24:

        return 0;
      }
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      type metadata accessor for BooleanCapabilityPrimitive();
      if (!swift_dynamicCastClass())
      {

        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        return 0;
      }
      swift_unknownObjectRetain();
      char v14 = sub_1C9DE3C80((uint64_t)v6);

      swift_unknownObjectRelease_n();
      if ((v14 & 1) == 0)
      {

        goto LABEL_27;
      }
      ++v4;
      if (v7 == v3) {
        goto LABEL_31;
      }
    }
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
  }
LABEL_31:

  swift_bridgeObjectRelease();
  return 1;
}

id AppLaunchCapability.__allocating_init(status:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return AppLaunchCapability.init(status:)(a1);
}

uint64_t sub_1C9E04E60(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution19AppLaunchCapability_primitivesMap) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9E04EC4()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution19AppLaunchCapability_key);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1C9E04F8C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution19AppLaunchCapability_key);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9E04FEC(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_1C9E04F8C(v1, v2);
}

uint64_t (*sub_1C9E0502C())()
{
  return j__swift_endAccess;
}

id AppLaunchCapability.init(status:)(uint64_t a1)
{
  uint64_t v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution19AppLaunchCapability_primitivesMap;
  uint64_t v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC80980);
  *(void *)&v1[v3] = sub_1C9E0D0D0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution19AppLaunchCapability_key]);

  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for AppLaunchCapability();
  id v5 = objc_msgSendSuper2(&v12, sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC808D8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C9E0F330;
  *(void *)(inited + 32) = 0xD000000000000022;
  *(void *)(inited + 40) = 0x80000001C9E12300;
  objc_allocWithZone((Class)type metadata accessor for BooleanCapabilityPrimitive());
  id v7 = v5;
  *(void *)(inited + 48) = sub_1C9DE3B00(a1);
  uint64_t v8 = sub_1C9E0D0D0();
  sub_1C9DD60F4(v8);
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  sub_1C9DD694C(2, v10);
  swift_bridgeObjectRelease();

  return v7;
}

uint64_t type metadata accessor for AppLaunchCapability()
{
  return self;
}

uint64_t sub_1C9E05274()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution19AppLaunchCapability_primitivesMap);
  swift_bridgeObjectRetain();
  unint64_t v2 = OUTLINED_FUNCTION_1_13();
  uint64_t v4 = sub_1C9DD6B68(v2, v3, v1);
  swift_bridgeObjectRelease();
  if (!v4) {
    return 0;
  }
  type metadata accessor for BooleanCapabilityPrimitive();
  uint64_t v5 = swift_dynamicCastClass();
  if (v5) {
    uint64_t v6 = *(void *)(v5 + OBJC_IVAR___SVDBooleanCapabilityPrimitive_supportStatus);
  }
  else {
    uint64_t v6 = 0;
  }
  swift_unknownObjectRelease();
  return v6;
}

id sub_1C9E0530C(uint64_t a1)
{
  type metadata accessor for BooleanCapabilityPrimitive();
  unint64_t v2 = OUTLINED_FUNCTION_1_13();
  return sub_1C9DE3B5C(v2, v3, a1);
}

uint64_t sub_1C9E05378(unint64_t a1)
{
  return sub_1C9E04ADC(a1, (char *)v1) & 1;
}

uint64_t static AppLaunchCapability.supportsSecureCoding.getter()
{
  return 1;
}

char *AppLaunchCapability.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return AppLaunchCapability.init(coder:)(a1);
}

char *AppLaunchCapability.init(coder:)(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution19AppLaunchCapability_primitivesMap;
  uint64_t v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC80980);
  *(void *)&v1[v3] = sub_1C9E0D0D0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution19AppLaunchCapability_key]);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for AppLaunchCapability();
  uint64_t v5 = (char *)objc_msgSendSuper2(&v7, sel_init);
  sub_1C9DD777C((uint64_t)a1);

  if (!*(void *)(*(void *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution19AppLaunchCapability_primitivesMap]
                  + 16))
  {

    return 0;
  }
  return v5;
}

id AppLaunchCapability.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void AppLaunchCapability.init()()
{
}

id AppLaunchCapability.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppLaunchCapability();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C9E056D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1C9E04EC4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t method lookup function for AppLaunchCapability(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AppLaunchCapability);
}

uint64_t dispatch thunk of AppLaunchCapability.key.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of AppLaunchCapability.key.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of AppLaunchCapability.key.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of AppLaunchCapability.__allocating_init(status:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of AppLaunchCapability.supportsAppLaunch.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of static AppLaunchCapability.capabilityDescriptionMatchingSupportStatus(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of AppLaunchCapability.matches(descriptions:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of AppLaunchCapability.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of AppLaunchCapability.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

unint64_t OUTLINED_FUNCTION_1_13()
{
  return 0xD000000000000022;
}

uint64_t sub_1C9E058A4(unint64_t a1, char *a2)
{
  if (a1 >> 62) {
    goto LABEL_30;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_1C9E0D700())
  {
    uint64_t v17 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution35CustomTimerIntentHandlingCapability_primitivesMap;
    uint64_t v4 = 4;
    while (1)
    {
      uint64_t v5 = (a1 & 0xC000000000000001) != 0
         ? (char *)MEMORY[0x1CB78F680](v4 - 4, a1)
         : (char *)*(id *)(a1 + 8 * v4);
      uint64_t v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      uint64_t v8 = *(void *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key];
      unint64_t v9 = *(void *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key + 8];
      swift_bridgeObjectRetain();
      if ((sub_1C9E0D1A0() & 1) == 0)
      {

        swift_bridgeObjectRelease();
LABEL_27:
        swift_bridgeObjectRelease();
        return 0;
      }
      swift_bridgeObjectRetain();
      if ((sub_1C9E0D1A0() & 1) == 0)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
LABEL_20:
        swift_bridgeObjectRelease();
        uint64_t v15 = a2;
        goto LABEL_24;
      }
      unint64_t v10 = sub_1C9E0D160();
      unint64_t v11 = sub_1C9E09684(v10, v8, v9);
      MEMORY[0x1CB78F240](v11);
      swift_bridgeObjectRelease();
      uint64_t v12 = sub_1C9E0D750();
      swift_bridgeObjectRelease();
      if (v12)
      {
        swift_bridgeObjectRelease();

        goto LABEL_20;
      }
      if (!*(void *)(*(void *)&a2[v17] + 16)) {
        goto LABEL_23;
      }
      swift_bridgeObjectRetain();
      sub_1C9DD5CF8(v8, v9);
      if ((v13 & 1) == 0)
      {
        swift_bridgeObjectRelease();
LABEL_23:
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        uint64_t v15 = v6;
LABEL_24:

        return 0;
      }
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      type metadata accessor for BooleanCapabilityPrimitive();
      if (!swift_dynamicCastClass())
      {

        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        return 0;
      }
      swift_unknownObjectRetain();
      char v14 = sub_1C9DE3C80((uint64_t)v6);

      swift_unknownObjectRelease_n();
      if ((v14 & 1) == 0)
      {

        goto LABEL_27;
      }
      ++v4;
      if (v7 == v3) {
        goto LABEL_31;
      }
    }
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
  }
LABEL_31:

  swift_bridgeObjectRelease();
  return 1;
}

id CustomTimerIntentHandlingCapability.__allocating_init(status:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return CustomTimerIntentHandlingCapability.init(status:)(a1);
}

uint64_t sub_1C9E05C28(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution35CustomTimerIntentHandlingCapability_primitivesMap) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9E05C8C()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution35CustomTimerIntentHandlingCapability_key);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1C9E05D54(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution35CustomTimerIntentHandlingCapability_key);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9E05DB4(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_1C9E05D54(v1, v2);
}

uint64_t (*sub_1C9E05DF4())()
{
  return j__swift_endAccess;
}

id CustomTimerIntentHandlingCapability.init(status:)(uint64_t a1)
{
  uint64_t v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution35CustomTimerIntentHandlingCapability_primitivesMap;
  uint64_t v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC80980);
  *(void *)&v1[v3] = sub_1C9E0D0D0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution35CustomTimerIntentHandlingCapability_key]);

  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for CustomTimerIntentHandlingCapability();
  id v5 = objc_msgSendSuper2(&v12, sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC808D8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C9E0F330;
  *(void *)(inited + 32) = 0xD000000000000028;
  *(void *)(inited + 40) = 0x80000001C9E123E0;
  objc_allocWithZone((Class)type metadata accessor for BooleanCapabilityPrimitive());
  id v7 = v5;
  *(void *)(inited + 48) = sub_1C9DE3B00(a1);
  uint64_t v8 = sub_1C9E0D0D0();
  sub_1C9DD60F4(v8);
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  sub_1C9DD69D0(10, v10);
  swift_bridgeObjectRelease();

  return v7;
}

uint64_t type metadata accessor for CustomTimerIntentHandlingCapability()
{
  return self;
}

uint64_t sub_1C9E0603C()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution35CustomTimerIntentHandlingCapability_primitivesMap);
  swift_bridgeObjectRetain();
  unint64_t v2 = OUTLINED_FUNCTION_1_14();
  uint64_t v4 = sub_1C9DD6B68(v2, v3, v1);
  swift_bridgeObjectRelease();
  if (!v4) {
    return 0;
  }
  type metadata accessor for BooleanCapabilityPrimitive();
  uint64_t v5 = swift_dynamicCastClass();
  if (v5) {
    uint64_t v6 = *(void *)(v5 + OBJC_IVAR___SVDBooleanCapabilityPrimitive_supportStatus);
  }
  else {
    uint64_t v6 = 0;
  }
  swift_unknownObjectRelease();
  return v6;
}

id sub_1C9E060D4(uint64_t a1)
{
  type metadata accessor for BooleanCapabilityPrimitive();
  unint64_t v2 = OUTLINED_FUNCTION_1_14();
  return sub_1C9DE3B5C(v2, v3, a1);
}

uint64_t sub_1C9E06140(unint64_t a1)
{
  return sub_1C9E058A4(a1, (char *)v1) & 1;
}

uint64_t static CustomTimerIntentHandlingCapability.supportsSecureCoding.getter()
{
  return 1;
}

char *CustomTimerIntentHandlingCapability.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return CustomTimerIntentHandlingCapability.init(coder:)(a1);
}

char *CustomTimerIntentHandlingCapability.init(coder:)(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution35CustomTimerIntentHandlingCapability_primitivesMap;
  uint64_t v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC80980);
  *(void *)&v1[v3] = sub_1C9E0D0D0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution35CustomTimerIntentHandlingCapability_key]);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for CustomTimerIntentHandlingCapability();
  uint64_t v5 = (char *)objc_msgSendSuper2(&v7, sel_init);
  sub_1C9DD77A8((uint64_t)a1);

  if (!*(void *)(*(void *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution35CustomTimerIntentHandlingCapability_primitivesMap]
                  + 16))
  {

    return 0;
  }
  return v5;
}

id CustomTimerIntentHandlingCapability.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void CustomTimerIntentHandlingCapability.init()()
{
}

id CustomTimerIntentHandlingCapability.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CustomTimerIntentHandlingCapability();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C9E0649C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1C9E05C8C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t method lookup function for CustomTimerIntentHandlingCapability(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CustomTimerIntentHandlingCapability);
}

uint64_t dispatch thunk of CustomTimerIntentHandlingCapability.key.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of CustomTimerIntentHandlingCapability.key.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of CustomTimerIntentHandlingCapability.key.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of CustomTimerIntentHandlingCapability.__allocating_init(status:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of CustomTimerIntentHandlingCapability.supportsCustomTimerIntentHandling.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of static CustomTimerIntentHandlingCapability.capabilityDescriptionMatchingSupportStatus(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of CustomTimerIntentHandlingCapability.matches(descriptions:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of CustomTimerIntentHandlingCapability.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of CustomTimerIntentHandlingCapability.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

unint64_t OUTLINED_FUNCTION_1_14()
{
  return 0xD000000000000028;
}

uint64_t sub_1C9E0666C(unint64_t a1, char *a2)
{
  if (a1 >> 62) {
    goto LABEL_30;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_1C9E0D700())
  {
    uint64_t v17 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution23VideoPlaybackCapability_primitivesMap;
    uint64_t v4 = 4;
    while (1)
    {
      uint64_t v5 = (a1 & 0xC000000000000001) != 0
         ? (char *)MEMORY[0x1CB78F680](v4 - 4, a1)
         : (char *)*(id *)(a1 + 8 * v4);
      uint64_t v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      uint64_t v8 = *(void *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key];
      unint64_t v9 = *(void *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key + 8];
      swift_bridgeObjectRetain();
      if ((sub_1C9E0D1A0() & 1) == 0)
      {

        swift_bridgeObjectRelease();
LABEL_27:
        swift_bridgeObjectRelease();
        return 0;
      }
      swift_bridgeObjectRetain();
      if ((sub_1C9E0D1A0() & 1) == 0)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
LABEL_20:
        swift_bridgeObjectRelease();
        uint64_t v15 = a2;
        goto LABEL_24;
      }
      unint64_t v10 = sub_1C9E0D160();
      unint64_t v11 = sub_1C9E09684(v10, v8, v9);
      MEMORY[0x1CB78F240](v11);
      swift_bridgeObjectRelease();
      uint64_t v12 = sub_1C9E0D750();
      swift_bridgeObjectRelease();
      if (v12)
      {
        swift_bridgeObjectRelease();

        goto LABEL_20;
      }
      if (!*(void *)(*(void *)&a2[v17] + 16)) {
        goto LABEL_23;
      }
      swift_bridgeObjectRetain();
      sub_1C9DD5CF8(v8, v9);
      if ((v13 & 1) == 0)
      {
        swift_bridgeObjectRelease();
LABEL_23:
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        uint64_t v15 = v6;
LABEL_24:

        return 0;
      }
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      type metadata accessor for BooleanCapabilityPrimitive();
      if (!swift_dynamicCastClass())
      {

        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        return 0;
      }
      swift_unknownObjectRetain();
      char v14 = sub_1C9DE3C80((uint64_t)v6);

      swift_unknownObjectRelease_n();
      if ((v14 & 1) == 0)
      {

        goto LABEL_27;
      }
      ++v4;
      if (v7 == v3) {
        goto LABEL_31;
      }
    }
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
  }
LABEL_31:

  swift_bridgeObjectRelease();
  return 1;
}

id VideoPlaybackCapability.__allocating_init(status:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return VideoPlaybackCapability.init(status:)(a1);
}

uint64_t sub_1C9E069F0(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23VideoPlaybackCapability_primitivesMap) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9E06A54()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23VideoPlaybackCapability_key);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1C9E06B1C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23VideoPlaybackCapability_key);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9E06B7C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_1C9E06B1C(v1, v2);
}

uint64_t (*sub_1C9E06BBC())()
{
  return j__swift_endAccess;
}

id VideoPlaybackCapability.init(status:)(uint64_t a1)
{
  uint64_t v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution23VideoPlaybackCapability_primitivesMap;
  uint64_t v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC80980);
  *(void *)&v1[v3] = sub_1C9E0D0D0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23VideoPlaybackCapability_key]);

  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for VideoPlaybackCapability();
  id v5 = objc_msgSendSuper2(&v12, sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC808D8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C9E0F330;
  *(void *)(inited + 32) = 0xD000000000000026;
  *(void *)(inited + 40) = 0x80000001C9E124F0;
  objc_allocWithZone((Class)type metadata accessor for BooleanCapabilityPrimitive());
  id v7 = v5;
  *(void *)(inited + 48) = sub_1C9DE3B00(a1);
  uint64_t v8 = sub_1C9E0D0D0();
  sub_1C9DD60F4(v8);
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  sub_1C9DD6920(1, v10);
  swift_bridgeObjectRelease();

  return v7;
}

uint64_t type metadata accessor for VideoPlaybackCapability()
{
  return self;
}

uint64_t sub_1C9E06E04()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23VideoPlaybackCapability_primitivesMap);
  swift_bridgeObjectRetain();
  unint64_t v2 = OUTLINED_FUNCTION_1_2();
  uint64_t v4 = sub_1C9DD6B68(v2, v3, v1);
  swift_bridgeObjectRelease();
  if (!v4) {
    return 0;
  }
  type metadata accessor for BooleanCapabilityPrimitive();
  uint64_t v5 = swift_dynamicCastClass();
  if (v5) {
    uint64_t v6 = *(void *)(v5 + OBJC_IVAR___SVDBooleanCapabilityPrimitive_supportStatus);
  }
  else {
    uint64_t v6 = 0;
  }
  swift_unknownObjectRelease();
  return v6;
}

id sub_1C9E06E9C(uint64_t a1)
{
  type metadata accessor for BooleanCapabilityPrimitive();
  unint64_t v2 = OUTLINED_FUNCTION_1_2();
  return sub_1C9DE3B5C(v2, v3, a1);
}

uint64_t sub_1C9E06F08(unint64_t a1)
{
  return sub_1C9E0666C(a1, (char *)v1) & 1;
}

uint64_t static VideoPlaybackCapability.supportsSecureCoding.getter()
{
  return 1;
}

char *VideoPlaybackCapability.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return VideoPlaybackCapability.init(coder:)(a1);
}

char *VideoPlaybackCapability.init(coder:)(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution23VideoPlaybackCapability_primitivesMap;
  uint64_t v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC80980);
  *(void *)&v1[v3] = sub_1C9E0D0D0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23VideoPlaybackCapability_key]);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for VideoPlaybackCapability();
  uint64_t v5 = (char *)objc_msgSendSuper2(&v7, sel_init);
  sub_1C9DD77D4((uint64_t)a1);

  if (!*(void *)(*(void *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23VideoPlaybackCapability_primitivesMap]
                  + 16))
  {

    return 0;
  }
  return v5;
}

id VideoPlaybackCapability.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void VideoPlaybackCapability.init()()
{
}

id VideoPlaybackCapability.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VideoPlaybackCapability();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C9E07264@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1C9E06A54();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t method lookup function for VideoPlaybackCapability(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for VideoPlaybackCapability);
}

uint64_t dispatch thunk of VideoPlaybackCapability.key.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of VideoPlaybackCapability.key.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of VideoPlaybackCapability.key.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of VideoPlaybackCapability.__allocating_init(status:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of VideoPlaybackCapability.supportsVideoPlayback.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of static VideoPlaybackCapability.capabilityDescriptionMatchingSupportStatus(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of VideoPlaybackCapability.matches(descriptions:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of VideoPlaybackCapability.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of VideoPlaybackCapability.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB8))();
}

BOOL sub_1C9E07420(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_1C9E0742C()
{
  unint64_t v0 = CapabilityKey.rawValue.getter();
  uint64_t v2 = v1;
  if (v0 == CapabilityKey.rawValue.getter() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1C9E0D7F0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1C9E074C4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    char v5 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      if ((v7 & ~v4) == 0) {
        uint64_t v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t sub_1C9E0751C()
{
  uint64_t v1 = *v0;
  uint64_t v15 = MEMORY[0x1E4FBC870];
  if (*v0)
  {
    uint64_t v6 = sub_1C9E0D120();
    OUTLINED_FUNCTION_0_7(v6, v7, v8);
    swift_bridgeObjectRelease();
    if ((v1 & 2) == 0)
    {
LABEL_3:
      if ((v1 & 4) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      uint64_t v12 = sub_1C9E0D120();
      OUTLINED_FUNCTION_0_7(v12, v13, v14);
      swift_bridgeObjectRelease();
      if ((v1 & 8) == 0) {
        return v15;
      }
      goto LABEL_5;
    }
  }
  else if ((v1 & 2) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v9 = sub_1C9E0D120();
  OUTLINED_FUNCTION_0_7(v9, v10, v11);
  swift_bridgeObjectRelease();
  if ((v1 & 4) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((v1 & 8) != 0)
  {
LABEL_5:
    uint64_t v2 = sub_1C9E0D120();
    OUTLINED_FUNCTION_0_7(v2, v3, v4);
    swift_bridgeObjectRelease();
  }
  return v15;
}

uint64_t DeviceUnitCategory.rawValue.getter()
{
  return *(void *)v0;
}

SiriVirtualDeviceResolution::DeviceUnitCategory __swiftcall DeviceUnitCategory.init(rawValue:)(SiriVirtualDeviceResolution::DeviceUnitCategory rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void *sub_1C9E075F4()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA5C7670);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C9E10A00;
  *(void *)(inited + 32) = sub_1C9E0D120();
  *(void *)(inited + 40) = v1;
  *(void *)(inited + 48) = 4;
  *(void *)(inited + 56) = sub_1C9E0D120();
  *(void *)(inited + 64) = v2;
  *(void *)(inited + 72) = 1;
  *(void *)(inited + 80) = sub_1C9E0D120();
  *(void *)(inited + 88) = v3;
  *(void *)(inited + 96) = 2;
  *(void *)(inited + 104) = sub_1C9E0D120();
  *(void *)(inited + 112) = v4;
  *(void *)(inited + 120) = 8;
  uint64_t result = (void *)sub_1C9E0D0D0();
  off_1EA5C7620 = result;
  return result;
}

SiriVirtualDeviceResolution::DeviceUnitCategory_optional __swiftcall DeviceUnitCategory.init(homeAccessoryType:)(Swift::String homeAccessoryType)
{
  object = homeAccessoryType._object;
  uint64_t countAndFlagsBits = homeAccessoryType._countAndFlagsBits;
  uint64_t v4 = v1;
  if (qword_1EA5C6A80 != -1) {
    swift_once();
  }
  char v5 = off_1EA5C7620;
  if (*((void *)off_1EA5C7620 + 2) && (unint64_t v6 = sub_1C9DD5CF8(countAndFlagsBits, (uint64_t)object), (v7 & 1) != 0))
  {
    char v8 = 0;
    uint64_t v9 = *(void *)(v5[7] + 8 * v6);
  }
  else
  {
    uint64_t v9 = 0;
    char v8 = 1;
  }
  Swift::Int v10 = swift_bridgeObjectRelease();
  *(void *)uint64_t v4 = v9;
  *(unsigned char *)(v4 + 8) = v8;
  result.value.rawValue = v10;
  result.is_nil = v11;
  return result;
}

void static DeviceUnitCategory.unspecified.getter(void *a1@<X8>)
{
  *a1 = 0;
}

void static DeviceUnitCategory.homepod.getter(void *a1@<X8>)
{
}

void static DeviceUnitCategory.otherSpeaker.getter(void *a1@<X8>)
{
}

void static DeviceUnitCategory.appleTV.getter(void *a1@<X8>)
{
}

void static DeviceUnitCategory.otherTV.getter(void *a1@<X8>)
{
}

void *sub_1C9E077A4()
{
  sub_1C9E09378();
  SiriVirtualDeviceResolution::DeviceUnitCategory_optional result = (void *)sub_1C9E0D0D0();
  off_1EA5C7628 = result;
  return result;
}

uint64_t DeviceUnitCategory.description.getter()
{
  uint64_t v1 = *v0;
  uint64_t v20 = MEMORY[0x1E4FBC870];
  if (qword_1EA5C6A88 != -1) {
LABEL_28:
  }
    swift_once();
  uint64_t v2 = off_1EA5C7628;
  uint64_t v3 = (char *)off_1EA5C7628 + 64;
  uint64_t v4 = 1 << *((unsigned char *)off_1EA5C7628 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *((void *)off_1EA5C7628 + 8);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (v6)
  {
    unint64_t v9 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    unint64_t v10 = v9 | (v8 << 6);
LABEL_21:
    if ((*(void *)(v2[6] + 8 * v10) & ~v1) == 0)
    {
      uint64_t v14 = (uint64_t *)(v2[7] + 16 * v10);
      uint64_t v16 = *v14;
      uint64_t v15 = v14[1];
      swift_bridgeObjectRetain();
      sub_1C9E07CCC(&v18, v16, v15);
      swift_bridgeObjectRelease();
    }
  }
  int64_t v11 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (v11 >= v7) {
    goto LABEL_23;
  }
  unint64_t v12 = *(void *)&v3[8 * v11];
  ++v8;
  if (v12) {
    goto LABEL_20;
  }
  int64_t v8 = v11 + 1;
  if (v11 + 1 >= v7) {
    goto LABEL_23;
  }
  unint64_t v12 = *(void *)&v3[8 * v8];
  if (v12) {
    goto LABEL_20;
  }
  int64_t v8 = v11 + 2;
  if (v11 + 2 >= v7) {
    goto LABEL_23;
  }
  unint64_t v12 = *(void *)&v3[8 * v8];
  if (v12)
  {
LABEL_20:
    unint64_t v6 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v8 << 6);
    goto LABEL_21;
  }
  int64_t v13 = v11 + 3;
  if (v13 < v7)
  {
    unint64_t v12 = *(void *)&v3[8 * v13];
    if (!v12)
    {
      while (1)
      {
        int64_t v8 = v13 + 1;
        if (__OFADD__(v13, 1)) {
          goto LABEL_27;
        }
        if (v8 >= v7) {
          goto LABEL_23;
        }
        unint64_t v12 = *(void *)&v3[8 * v8];
        ++v13;
        if (v12) {
          goto LABEL_20;
        }
      }
    }
    int64_t v8 = v13;
    goto LABEL_20;
  }
LABEL_23:
  swift_release();
  uint64_t v18 = 0;
  unint64_t v19 = 0xE000000000000000;
  sub_1C9E0D560();
  swift_bridgeObjectRelease();
  uint64_t v18 = 0xD000000000000015;
  unint64_t v19 = 0x80000001C9E125E0;
  if (*(void *)(v20 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C7630);
    sub_1C9E07E7C();
    sub_1C9DEBDE0();
    sub_1C9E0D1C0();
  }
  swift_bridgeObjectRelease();
  sub_1C9E0D180();
  swift_bridgeObjectRelease();
  sub_1C9E0D180();
  return v18;
}

SiriVirtualDeviceResolution::DeviceUnitCategory sub_1C9E07A80(Swift::Int *a1)
{
  return DeviceUnitCategory.init(rawValue:)(*a1);
}

void sub_1C9E07A90(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_1C9E07A98@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1C9E07AA4(*a1, *v2, a2);
}

uint64_t sub_1C9E07AA4@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 | result;
  return result;
}

uint64_t sub_1C9E07AB0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1C9E07ABC(*a1, *v2, a2);
}

uint64_t sub_1C9E07ABC@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 & result;
  return result;
}

uint64_t sub_1C9E07AC8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1C9E07AD4(*a1, *v2, a2);
}

uint64_t sub_1C9E07AD4@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 ^ result;
  return result;
}

BOOL sub_1C9E07AE0(void *a1, uint64_t *a2)
{
  return sub_1C9E07AE8(a1, *a2);
}

BOOL sub_1C9E07AE8(void *a1, uint64_t a2)
{
  uint64_t v3 = *v2 & a2;
  if (v3 != a2) {
    *v2 |= a2;
  }
  *a1 = a2;
  return v3 != a2;
}

uint64_t sub_1C9E07B14@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1C9E07B1C(*a1, a2);
}

uint64_t sub_1C9E07B1C@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & result;
  if (v3) {
    *v2 &= ~result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t sub_1C9E07B44@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1C9E07B4C(*a1, a2);
}

uint64_t sub_1C9E07B4C@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2;
  *v2 |= result;
  uint64_t v4 = v3 & result;
  *(void *)a2 = v4;
  *(unsigned char *)(a2 + 8) = v4 == 0;
  return result;
}

uint64_t sub_1C9E07B6C(uint64_t *a1)
{
  return sub_1C9E07B74(*a1);
}

uint64_t sub_1C9E07B74(uint64_t result)
{
  *v1 |= result;
  return result;
}

uint64_t sub_1C9E07B84(uint64_t *a1)
{
  return sub_1C9E07B8C(*a1);
}

uint64_t sub_1C9E07B8C(uint64_t result)
{
  *v1 &= result;
  return result;
}

uint64_t sub_1C9E07B9C(uint64_t *a1)
{
  return sub_1C9E07BA4(*a1);
}

uint64_t sub_1C9E07BA4(uint64_t result)
{
  *v1 ^= result;
  return result;
}

uint64_t sub_1C9E07BB4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1C9E07BC0(*a1, *v2, a2);
}

uint64_t sub_1C9E07BC0@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 & ~result;
  return result;
}

BOOL sub_1C9E07BCC(uint64_t *a1)
{
  return sub_1C9E07BD8(*a1, *v1);
}

BOOL sub_1C9E07BD8(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_1C9E07BE4(uint64_t *a1)
{
  return sub_1C9E07BF0(*a1, *v1);
}

BOOL sub_1C9E07BF0(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_1C9E07BFC(uint64_t *a1)
{
  return sub_1C9E07C08(*a1, *v1);
}

BOOL sub_1C9E07C08(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

BOOL sub_1C9E07C14()
{
  return sub_1C9E07C1C(*v0);
}

BOOL sub_1C9E07C1C(uint64_t a1)
{
  return a1 == 0;
}

uint64_t sub_1C9E07C28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x1F4184B08](a1, a4, a2, a5, a3);
}

uint64_t sub_1C9E07C40(uint64_t *a1)
{
  return sub_1C9E07C48(*a1);
}

uint64_t sub_1C9E07C48(uint64_t result)
{
  *v1 &= ~result;
  return result;
}

SiriVirtualDeviceResolution::DeviceUnitCategory sub_1C9E07C58@<X0>(Swift::Int *a1@<X0>, uint64_t a2@<X8>)
{
  result.rawValue = DeviceUnitCategory.init(rawValue:)(*a1).rawValue;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_1C9E07C84@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = DeviceUnitCategory.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1C9E07CB0(uint64_t result, uint64_t a2, void *a3)
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

uint64_t sub_1C9E07CCC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_1C9E0D890();
  swift_bridgeObjectRetain();
  sub_1C9E0D150();
  uint64_t v8 = sub_1C9E0D8D0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    unint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1C9E0D7F0() & 1) != 0)
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
      if (v19 || (sub_1C9E0D7F0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1C9E08A58(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

unint64_t sub_1C9E07E7C()
{
  unint64_t result = qword_1EA5C7638;
  if (!qword_1EA5C7638)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA5C7630);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C7638);
  }
  return result;
}

unint64_t sub_1C9E07ED4()
{
  unint64_t result = qword_1EA5C7640;
  if (!qword_1EA5C7640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C7640);
  }
  return result;
}

unint64_t sub_1C9E07F24()
{
  unint64_t result = qword_1EA5C7648;
  if (!qword_1EA5C7648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C7648);
  }
  return result;
}

unint64_t sub_1C9E07F74()
{
  unint64_t result = qword_1EA5C7650;
  if (!qword_1EA5C7650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C7650);
  }
  return result;
}

unint64_t sub_1C9E07FC4()
{
  unint64_t result = qword_1EA5C7658;
  if (!qword_1EA5C7658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C7658);
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceUnitCategory()
{
  return &type metadata for DeviceUnitCategory;
}

uint64_t sub_1C9E08020(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_1C9E0D4E0();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_1C9DE4500();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v28;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_1C9E0D4D0();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v23 = sub_1C9E08284(v7, result + 1);
    uint64_t v29 = v23;
    if (*(void *)(v23 + 24) <= *(void *)(v23 + 16))
    {
      id v27 = v8;
      sub_1C9E08738();
      uint64_t v24 = v29;
    }
    else
    {
      uint64_t v24 = v23;
      id v25 = v8;
    }
    sub_1C9E089D4((uint64_t)v8, v24);
    *uint64_t v3 = v24;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1C9E0D3F0();
    uint64_t v11 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v12 = v10 & ~v11;
    OUTLINED_FUNCTION_2_7();
    if (v13)
    {
      sub_1C9DE4500();
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v12);
      char v15 = sub_1C9E0D400();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v20 = *(void **)(*(void *)(*v2 + 48) + 8 * v12);
        *a1 = v20;
        id v21 = v20;
        return 0;
      }
      uint64_t v16 = ~v11;
      while (1)
      {
        unint64_t v12 = (v12 + 1) & v16;
        OUTLINED_FUNCTION_2_7();
        if ((v17 & 1) == 0) {
          break;
        }
        id v18 = *(id *)(*(void *)(v6 + 48) + 8 * v12);
        char v19 = sub_1C9E0D400();

        if (v19) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v30 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    id v8 = a2;
    sub_1C9E08BF4((uint64_t)v8, v12, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v30;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_1C9E08284(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E4FBC870];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6E28);
  uint64_t v2 = sub_1C9E0D540();
  uint64_t v14 = v2;
  sub_1C9E0D4C0();
  if (!sub_1C9E0D4F0())
  {
LABEL_16:
    swift_release();
    return v2;
  }
  sub_1C9DE4500();
  while (1)
  {
    swift_dynamicCast();
    uint64_t v2 = v14;
    if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
    {
      sub_1C9E08738();
      uint64_t v2 = v14;
    }
    uint64_t result = sub_1C9E0D3F0();
    uint64_t v4 = v2 + 56;
    uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v6 = result & ~v5;
    unint64_t v7 = v6 >> 6;
    if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) == 0) {
      break;
    }
    unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
LABEL_15:
    *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
    *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
    ++*(void *)(v2 + 16);
    if (!sub_1C9E0D4F0()) {
      goto LABEL_16;
    }
  }
  char v9 = 0;
  unint64_t v10 = (unint64_t)(63 - v5) >> 6;
  while (++v7 != v10 || (v9 & 1) == 0)
  {
    BOOL v11 = v7 == v10;
    if (v7 == v10) {
      unint64_t v7 = 0;
    }
    v9 |= v11;
    uint64_t v12 = *(void *)(v4 + 8 * v7);
    if (v12 != -1)
    {
      unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
      goto LABEL_15;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1C9E0845C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C7660);
  uint64_t v3 = sub_1C9E0D530();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
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
    if (!v7) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      char v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
      uint64_t v18 = *v17;
      uint64_t v19 = v17[1];
      sub_1C9E0D890();
      sub_1C9E0D150();
      uint64_t result = sub_1C9E0D8D0();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          BOOL v26 = v22 == v25;
          if (v22 == v25) {
            unint64_t v22 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v9 + 8 * v22);
          if (v27 != -1)
          {
            unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
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
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      uint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
      void *v28 = v18;
      v28[1] = v19;
      ++*(void *)(v4 + 16);
      if (v7) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v14 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_38;
      }
      if (v14 >= v8) {
        goto LABEL_32;
      }
      unint64_t v15 = v30[v14];
      ++v11;
      if (!v15)
      {
        int64_t v11 = v14 + 1;
        if (v14 + 1 >= v8) {
          goto LABEL_32;
        }
        unint64_t v15 = v30[v11];
        if (!v15)
        {
          int64_t v11 = v14 + 2;
          if (v14 + 2 >= v8) {
            goto LABEL_32;
          }
          unint64_t v15 = v30[v11];
          if (!v15)
          {
            int64_t v16 = v14 + 3;
            if (v16 >= v8)
            {
LABEL_32:
              swift_release();
              uint64_t v1 = v0;
              uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
              if (v29 > 63) {
                sub_1C9E07CB0(0, (unint64_t)(v29 + 63) >> 6, v30);
              }
              else {
                *uint64_t v30 = -1 << v29;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v15 = v30[v16];
            if (!v15)
            {
              while (1)
              {
                int64_t v11 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_39;
                }
                if (v11 >= v8) {
                  goto LABEL_32;
                }
                unint64_t v15 = v30[v11];
                ++v16;
                if (v15) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v11 = v16;
          }
        }
      }
LABEL_20:
      unint64_t v7 = (v15 - 1) & v15;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_1C9E08738()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6E28);
  uint64_t v3 = sub_1C9E0D530();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    if (!v8) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v13 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    for (unint64_t i = v13 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v12 << 6))
    {
      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * i);
      uint64_t result = sub_1C9E0D3F0();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6))) == 0)
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
          uint64_t v26 = *(void *)(v10 + 8 * v21);
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
      unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v10 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
      *(void *)(*(void *)(v4 + 48) + 8 * v22) = v18;
      ++*(void *)(v4 + 16);
      if (v8) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v15 = v12 + 1;
      if (__OFADD__(v12, 1)) {
        goto LABEL_38;
      }
      if (v15 >= v9) {
        goto LABEL_32;
      }
      unint64_t v16 = v6[v15];
      ++v12;
      if (!v16)
      {
        int64_t v12 = v15 + 1;
        if (v15 + 1 >= v9) {
          goto LABEL_32;
        }
        unint64_t v16 = v6[v12];
        if (!v16)
        {
          int64_t v12 = v15 + 2;
          if (v15 + 2 >= v9) {
            goto LABEL_32;
          }
          unint64_t v16 = v6[v12];
          if (!v16)
          {
            int64_t v17 = v15 + 3;
            if (v17 >= v9)
            {
LABEL_32:
              swift_release();
              uint64_t v1 = v28;
              uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
              if (v27 > 63) {
                sub_1C9E07CB0(0, (unint64_t)(v27 + 63) >> 6, (void *)(v2 + 56));
              }
              else {
                void *v6 = -1 << v27;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v16 = v6[v17];
            if (!v16)
            {
              while (1)
              {
                int64_t v12 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  goto LABEL_39;
                }
                if (v12 >= v9) {
                  goto LABEL_32;
                }
                unint64_t v16 = v6[v12];
                ++v17;
                if (v16) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v12 = v17;
          }
        }
      }
LABEL_20:
      unint64_t v8 = (v16 - 1) & v16;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

unint64_t sub_1C9E089D4(uint64_t a1, uint64_t a2)
{
  sub_1C9E0D3F0();
  unint64_t result = sub_1C9E0D4B0();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

uint64_t sub_1C9E08A58(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_1C9E0845C();
  }
  else
  {
    if (v10 > v9)
    {
      unint64_t result = (uint64_t)sub_1C9E08D6C();
      goto LABEL_22;
    }
    sub_1C9E090CC();
  }
  uint64_t v11 = *v4;
  sub_1C9E0D890();
  sub_1C9E0D150();
  unint64_t result = sub_1C9E0D8D0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    int64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (unint64_t result = sub_1C9E0D7F0(), (result & 1) != 0))
    {
LABEL_21:
      unint64_t result = sub_1C9E0D820();
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
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          unint64_t result = sub_1C9E0D7F0();
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

void sub_1C9E08BF4(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_1C9E08738();
  }
  else
  {
    if (v7 > v6)
    {
      sub_1C9E08F20();
      goto LABEL_14;
    }
    sub_1C9E093C4();
  }
  uint64_t v8 = *v3;
  uint64_t v9 = sub_1C9E0D3F0();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_1C9DE4500();
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_1C9E0D400();

    if (v12)
    {
LABEL_13:
      sub_1C9E0D820();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_1C9E0D400();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

void *sub_1C9E08D6C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C7660);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1C9E0D520();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    unint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1;
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    uint64_t v20 = (void *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v21 = v20[1];
    uint64_t v22 = (void *)(*(void *)(v4 + 48) + 16 * i);
    *uint64_t v22 = *v20;
    v22[1] = v21;
    unint64_t result = (void *)swift_bridgeObjectRetain();
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v13 = (v18 - 1) & v18;
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_1C9E08F20()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6E28);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1C9E0D520();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1;
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    uint64_t v20 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    *(void *)(*(void *)(v4 + 48) + 8 * i) = v20;
    id result = v20;
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v13 = (v18 - 1) & v18;
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1C9E090CC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C7660);
  uint64_t v3 = sub_1C9E0D530();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    uint64_t *v1 = v4;
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
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    int64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_1C9E0D890();
    swift_bridgeObjectRetain();
    sub_1C9E0D150();
    uint64_t result = sub_1C9E0D8D0();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v9 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
    void *v28 = v18;
    v28[1] = v19;
    ++*(void *)(v4 + 16);
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v14 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_36;
    }
    if (v14 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      int64_t v11 = v14 + 1;
      if (v14 + 1 >= v29) {
        goto LABEL_32;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v11);
      if (!v15)
      {
        int64_t v11 = v14 + 2;
        if (v14 + 2 >= v29) {
          goto LABEL_32;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v11);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v15 - 1) & v15;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_34;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
    int64_t v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v11 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v11);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_1C9E09378()
{
  unint64_t result = qword_1EA5C7668;
  if (!qword_1EA5C7668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA5C7668);
  }
  return result;
}

uint64_t sub_1C9E093C4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5C6E28);
  uint64_t v3 = sub_1C9E0D530();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v27 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v13 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v13 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v12 << 6))
  {
    id v18 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    uint64_t result = sub_1C9E0D3F0();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6))) == 0)
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
        uint64_t v26 = *(void *)(v10 + 8 * v21);
        if (v26 != -1)
        {
          unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v10 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(void *)(*(void *)(v4 + 48) + 8 * v22) = v18;
    ++*(void *)(v4 + 16);
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v15 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      goto LABEL_36;
    }
    if (v15 >= v9) {
      goto LABEL_32;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v12;
    if (!v16)
    {
      int64_t v12 = v15 + 1;
      if (v15 + 1 >= v9) {
        goto LABEL_32;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v12);
      if (!v16)
      {
        int64_t v12 = v15 + 2;
        if (v15 + 2 >= v9) {
          goto LABEL_32;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v12);
        if (!v16) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v16 - 1) & v16;
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v9)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    uint64_t v1 = v27;
    goto LABEL_34;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v12 = v17;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v12 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_32;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v12);
    ++v17;
    if (v16) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t OUTLINED_FUNCTION_0_7(uint64_t a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  return sub_1C9E07CCC((uint64_t *)va, a1, a2);
}

void OUTLINED_FUNCTION_1_15(void *a1@<X8>)
{
  *a1 = v1;
}

unint64_t sub_1C9E09684(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a3 & 0x2000000000000000) != 0) {
      uint64_t v3 = HIBYTE(a3) & 0xF;
    }
    else {
      uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v4 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
      uint64_t v4 = 11;
    }
    unint64_t v5 = v4 | (v3 << 16);
    uint64_t result = sub_1C9E0D170();
    if (v6) {
      uint64_t result = v5;
    }
    if (4 * v3 >= result >> 14)
    {
      uint64_t v7 = sub_1C9E0D1B0();
      swift_bridgeObjectRelease();
      return v7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1C9E09758(unint64_t a1, char *a2)
{
  if (a1 >> 62) {
    goto LABEL_30;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_1C9E0D700())
  {
    uint64_t v17 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution24SeymourRoutingCapability_primitivesMap;
    uint64_t v4 = 4;
    while (1)
    {
      unint64_t v5 = (a1 & 0xC000000000000001) != 0
         ? (char *)MEMORY[0x1CB78F680](v4 - 4, a1)
         : (char *)*(id *)(a1 + 8 * v4);
      char v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      uint64_t v8 = *(void *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key];
      unint64_t v9 = *(void *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key + 8];
      swift_bridgeObjectRetain();
      if ((sub_1C9E0D1A0() & 1) == 0)
      {

        swift_bridgeObjectRelease();
LABEL_27:
        swift_bridgeObjectRelease();
        return 0;
      }
      swift_bridgeObjectRetain();
      if ((sub_1C9E0D1A0() & 1) == 0)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
LABEL_20:
        swift_bridgeObjectRelease();
        int64_t v15 = a2;
        goto LABEL_24;
      }
      unint64_t v10 = sub_1C9E0D160();
      unint64_t v11 = sub_1C9E09684(v10, v8, v9);
      MEMORY[0x1CB78F240](v11);
      swift_bridgeObjectRelease();
      uint64_t v12 = sub_1C9E0D750();
      swift_bridgeObjectRelease();
      if (v12)
      {
        swift_bridgeObjectRelease();

        goto LABEL_20;
      }
      if (!*(void *)(*(void *)&a2[v17] + 16)) {
        goto LABEL_23;
      }
      swift_bridgeObjectRetain();
      sub_1C9DD5CF8(v8, v9);
      if ((v13 & 1) == 0)
      {
        swift_bridgeObjectRelease();
LABEL_23:
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        int64_t v15 = v6;
LABEL_24:

        return 0;
      }
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      type metadata accessor for BooleanCapabilityPrimitive();
      if (!swift_dynamicCastClass())
      {

        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        return 0;
      }
      swift_unknownObjectRetain();
      char v14 = sub_1C9DE3C80((uint64_t)v6);

      swift_unknownObjectRelease_n();
      if ((v14 & 1) == 0)
      {

        goto LABEL_27;
      }
      ++v4;
      if (v7 == v3) {
        goto LABEL_31;
      }
    }
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
  }
LABEL_31:

  swift_bridgeObjectRelease();
  return 1;
}

id SeymourRoutingCapability.__allocating_init(status:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return SeymourRoutingCapability.init(status:)(a1);
}

uint64_t sub_1C9E09ADC(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution24SeymourRoutingCapability_primitivesMap) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9E09B40()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution24SeymourRoutingCapability_key);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1C9E09C08(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution24SeymourRoutingCapability_key);
  swift_beginAccess();
  *unint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C9E09C68(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_1C9E09C08(v1, v2);
}

uint64_t (*sub_1C9E09CA8())()
{
  return j__swift_endAccess;
}

id SeymourRoutingCapability.init(status:)(uint64_t a1)
{
  uint64_t v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution24SeymourRoutingCapability_primitivesMap;
  uint64_t v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC80980);
  *(void *)&v1[v3] = sub_1C9E0D0D0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution24SeymourRoutingCapability_key]);

  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for SeymourRoutingCapability();
  id v5 = objc_msgSendSuper2(&v12, sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC808D8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C9E0F330;
  *(void *)(inited + 32) = 0xD000000000000027;
  *(void *)(inited + 40) = 0x80000001C9E12600;
  objc_allocWithZone((Class)type metadata accessor for BooleanCapabilityPrimitive());
  id v7 = v5;
  *(void *)(inited + 48) = sub_1C9DE3B00(a1);
  uint64_t v8 = sub_1C9E0D0D0();
  sub_1C9DD60F4(v8);
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  sub_1C9DD6978(3, v10);
  swift_bridgeObjectRelease();

  return v7;
}

uint64_t type metadata accessor for SeymourRoutingCapability()
{
  return self;
}

uint64_t sub_1C9E09EF0()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution24SeymourRoutingCapability_primitivesMap);
  swift_bridgeObjectRetain();
  unint64_t v2 = OUTLINED_FUNCTION_1_16();
  uint64_t v4 = sub_1C9DD6B68(v2, v3, v1);
  swift_bridgeObjectRelease();
  if (!v4) {
    return 0;
  }
  type metadata accessor for BooleanCapabilityPrimitive();
  uint64_t v5 = swift_dynamicCastClass();
  if (v5) {
    uint64_t v6 = *(void *)(v5 + OBJC_IVAR___SVDBooleanCapabilityPrimitive_supportStatus);
  }
  else {
    uint64_t v6 = 0;
  }
  swift_unknownObjectRelease();
  return v6;
}

id sub_1C9E09F88(uint64_t a1)
{
  type metadata accessor for BooleanCapabilityPrimitive();
  unint64_t v2 = OUTLINED_FUNCTION_1_16();
  return sub_1C9DE3B5C(v2, v3, a1);
}

uint64_t sub_1C9E09FF4(unint64_t a1)
{
  return sub_1C9E09758(a1, (char *)v1) & 1;
}

uint64_t static SeymourRoutingCapability.supportsSecureCoding.getter()
{
  return 1;
}

char *SeymourRoutingCapability.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return SeymourRoutingCapability.init(coder:)(a1);
}

char *SeymourRoutingCapability.init(coder:)(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution24SeymourRoutingCapability_primitivesMap;
  uint64_t v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC80980);
  *(void *)&v1[v3] = sub_1C9E0D0D0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution24SeymourRoutingCapability_key]);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for SeymourRoutingCapability();
  uint64_t v5 = (char *)objc_msgSendSuper2(&v7, sel_init);
  sub_1C9DD7800((uint64_t)a1);

  if (!*(void *)(*(void *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution24SeymourRoutingCapability_primitivesMap]
                  + 16))
  {

    return 0;
  }
  return v5;
}

id SeymourRoutingCapability.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void SeymourRoutingCapability.init()()
{
}

id SeymourRoutingCapability.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SeymourRoutingCapability();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C9E0A350@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1C9E09B40();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t method lookup function for SeymourRoutingCapability(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SeymourRoutingCapability);
}

uint64_t dispatch thunk of SeymourRoutingCapability.key.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of SeymourRoutingCapability.key.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of SeymourRoutingCapability.key.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of SeymourRoutingCapability.__allocating_init(status:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of SeymourRoutingCapability.supportsSeymourRouting.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of static SeymourRoutingCapability.capabilityDescriptionMatchingSupportStatus(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of SeymourRoutingCapability.matches(descriptions:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of SeymourRoutingCapability.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of SeymourRoutingCapability.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

unint64_t OUTLINED_FUNCTION_1_16()
{
  return 0xD000000000000027;
}

id SVDCapabilityDescriptionsGroupedByCapabilityKey(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "capabilityKey", (void)v12);
        if ([v9 length])
        {
          id v10 = [v2 objectForKey:v9];
          if (!v10)
          {
            id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [v2 setObject:v10 forKey:v9];
          }
          [v10 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v2;
}

uint64_t sub_1C9E0CF80()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1C9E0CF90()
{
  return MEMORY[0x1F40E5328]();
}

uint64_t sub_1C9E0CFA0()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1C9E0CFB0()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1C9E0CFC0()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1C9E0CFD0()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_1C9E0CFE0()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1C9E0CFF0()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1C9E0D000()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1C9E0D010()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1C9E0D020()
{
  return MEMORY[0x1F41886B0]();
}

uint64_t sub_1C9E0D030()
{
  return MEMORY[0x1F4186C60]();
}

uint64_t sub_1C9E0D040()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1C9E0D050()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1C9E0D060()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1C9E0D070()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1C9E0D080()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1C9E0D090()
{
  return MEMORY[0x1F4186F08]();
}

uint64_t sub_1C9E0D0A0()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1C9E0D0B0()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1C9E0D0C0()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1C9E0D0D0()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1C9E0D0E0()
{
  return MEMORY[0x1F41833C0]();
}

uint64_t sub_1C9E0D0F0()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1C9E0D100()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1C9E0D110()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1C9E0D120()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1C9E0D130()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1C9E0D140()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1C9E0D150()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1C9E0D160()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1C9E0D170()
{
  return MEMORY[0x1F4183A08]();
}

uint64_t sub_1C9E0D180()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1C9E0D190()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1C9E0D1A0()
{
  return MEMORY[0x1F4183B30]();
}

uint64_t sub_1C9E0D1B0()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1C9E0D1C0()
{
  return MEMORY[0x1F4183CF0]();
}

uint64_t sub_1C9E0D1D0()
{
  return MEMORY[0x1F4183D98]();
}

uint64_t sub_1C9E0D1E0()
{
  return MEMORY[0x1F4183E10]();
}

uint64_t sub_1C9E0D1F0()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1C9E0D200()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1C9E0D210()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1C9E0D220()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1C9E0D230()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1C9E0D240()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1C9E0D250()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1C9E0D260()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1C9E0D270()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_1C9E0D280()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1C9E0D290()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1C9E0D2A0()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1C9E0D2B0()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1C9E0D2C0()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1C9E0D2D0()
{
  return MEMORY[0x1F4184100]();
}

uint64_t sub_1C9E0D2E0()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1C9E0D2F0()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1C9E0D300()
{
  return MEMORY[0x1F40E6478]();
}

uint64_t sub_1C9E0D310()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1C9E0D320()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1C9E0D330()
{
  return MEMORY[0x1F4186FB0]();
}

uint64_t sub_1C9E0D340()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1C9E0D350()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1C9E0D360()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1C9E0D370()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1C9E0D380()
{
  return MEMORY[0x1F4187130]();
}

uint64_t sub_1C9E0D390()
{
  return MEMORY[0x1F4187168]();
}

uint64_t sub_1C9E0D3A0()
{
  return MEMORY[0x1F41871D0]();
}

uint64_t sub_1C9E0D3B0()
{
  return MEMORY[0x1F4187218]();
}

uint64_t sub_1C9E0D3C0()
{
  return MEMORY[0x1F4187248]();
}

uint64_t sub_1C9E0D3D0()
{
  return MEMORY[0x1F41872D0]();
}

uint64_t sub_1C9E0D3E0()
{
  return MEMORY[0x1F40E6860]();
}

uint64_t sub_1C9E0D3F0()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1C9E0D400()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1C9E0D410()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1C9E0D420()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1C9E0D430()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1C9E0D440()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1C9E0D450()
{
  return MEMORY[0x1F40E6BB0]();
}

uint64_t sub_1C9E0D460()
{
  return MEMORY[0x1F40E6CA0]();
}

uint64_t sub_1C9E0D470()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1C9E0D490()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1C9E0D4A0()
{
  return MEMORY[0x1F4184B28]();
}

uint64_t sub_1C9E0D4B0()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1C9E0D4C0()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1C9E0D4D0()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1C9E0D4E0()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1C9E0D4F0()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1C9E0D500()
{
  return MEMORY[0x1F4184BC8]();
}

uint64_t sub_1C9E0D510()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1C9E0D520()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1C9E0D530()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1C9E0D540()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1C9E0D550()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1C9E0D560()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1C9E0D570()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1C9E0D580()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1C9E0D590()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1C9E0D5A0()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1C9E0D5B0()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1C9E0D5C0()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1C9E0D5D0()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1C9E0D5E0()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1C9E0D5F0()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1C9E0D600()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1C9E0D610()
{
  return MEMORY[0x1F41851A0]();
}

uint64_t sub_1C9E0D620()
{
  return MEMORY[0x1F41851C0]();
}

uint64_t sub_1C9E0D630()
{
  return MEMORY[0x1F41851F0]();
}

uint64_t sub_1C9E0D640()
{
  return MEMORY[0x1F41851F8]();
}

uint64_t sub_1C9E0D650()
{
  return MEMORY[0x1F4185208]();
}

uint64_t sub_1C9E0D660()
{
  return MEMORY[0x1F4185210]();
}

uint64_t sub_1C9E0D670()
{
  return MEMORY[0x1F4185228]();
}

uint64_t sub_1C9E0D680()
{
  return MEMORY[0x1F4185230]();
}

uint64_t sub_1C9E0D690()
{
  return MEMORY[0x1F4185238]();
}

uint64_t sub_1C9E0D6A0()
{
  return MEMORY[0x1F4185240]();
}

uint64_t sub_1C9E0D6B0()
{
  return MEMORY[0x1F4185258]();
}

uint64_t sub_1C9E0D6C0()
{
  return MEMORY[0x1F4185270]();
}

uint64_t sub_1C9E0D6D0()
{
  return MEMORY[0x1F4185290]();
}

uint64_t sub_1C9E0D6E0()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1C9E0D700()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1C9E0D710()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1C9E0D720()
{
  return MEMORY[0x1F4185378]();
}

uint64_t sub_1C9E0D730()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1C9E0D740()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1C9E0D750()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1C9E0D770()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1C9E0D780()
{
  return MEMORY[0x1F4185570]();
}

uint64_t sub_1C9E0D790()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1C9E0D7A0()
{
  return MEMORY[0x1F4185628]();
}

uint64_t sub_1C9E0D7C0()
{
  return MEMORY[0x1F4185698]();
}

uint64_t sub_1C9E0D7D0()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1C9E0D7E0()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1C9E0D7F0()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1C9E0D810()
{
  return MEMORY[0x1F4185D40]();
}

uint64_t sub_1C9E0D820()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1C9E0D830()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1C9E0D840()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1C9E0D850()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1C9E0D860()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1C9E0D870()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1C9E0D880()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1C9E0D890()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1C9E0D8A0()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1C9E0D8B0()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1C9E0D8C0()
{
  return MEMORY[0x1F4185EF0]();
}

uint64_t sub_1C9E0D8D0()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1C9E0D8E0()
{
  return MEMORY[0x1F4185F00]();
}

uint64_t sub_1C9E0D8F0()
{
  return MEMORY[0x1F4185FC8]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

BOOL atomic_flag_test_and_set(atomic_flag *a1)
{
  return MEMORY[0x1F40CA4D0](a1);
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

void free(void *a1)
{
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_enumerationMutation(id obj)
{
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
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

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1F4186640]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}