uint64_t GameControllerGesture.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t type metadata accessor for GameControllerGesture()
{
  return self;
}

uint64_t GameControllerGesture.deinit()
{
  return v0;
}

uint64_t GameControllerGesture.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

_UNKNOWN **sub_26084B030()
{
  return &protocol witness table for GameControllerReport;
}

_UNKNOWN **sub_26084B03C()
{
  return &protocol witness table for GameControllerReport;
}

uint64_t sub_26084B048(uint64_t *a1)
{
  return GameControllerGesture.dispatch(report:)(*a1, a1[1]);
}

uint64_t method lookup function for GameControllerGesture(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for GameControllerGesture);
}

uint64_t dispatch thunk of GameControllerGesture.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

double OUTLINED_FUNCTION_0_31(unsigned __int16 a1)
{
  return (double)a1 / v1;
}

void OUTLINED_FUNCTION_1_31(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,__int16 a29,char a30,char a31,char a32,char a33,char a34,char a35,char a36,char a37,char a38,char a39,char a40,char a41,char a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57)
{
  _s12UniversalHID9HIDReportV_2ass5Int16VSi_AFmtcig_0(a1, v58, v57, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32,
    a33,
    a34,
    a35,
    a36,
    a37,
    a38,
    a39,
    a40,
    a41,
    a42,
    a43,
    a44,
    a45,
    a46,
    a47,
    a48,
    a49,
    a50,
    a51,
    a52,
    a53,
    a54,
    a55,
    a56,
    a57);
}

uint64_t ScaleEvent.z.getter()
{
  return OUTLINED_FUNCTION_2_33();
}

uint64_t ScaleEvent.init(time:point:flags:)()
{
  return IOHIDEventCreateScaleEvent();
}

uint64_t static ScaleEvent.eventType.getter()
{
  return 7;
}

uint64_t ScaleEvent.x.getter()
{
  return IOHIDEventGetFloatValue();
}

uint64_t (*ScaleEvent.x.modify(uint64_t a1, uint64_t a2))()
{
  OUTLINED_FUNCTION_2_2(a1, a2);
  IOHIDEventGetFloatValue();
  void *v2 = v3;
  return sub_26084B138;
}

uint64_t sub_26084B138()
{
  return OUTLINED_FUNCTION_1_32();
}

uint64_t ScaleEvent.y.getter()
{
  return OUTLINED_FUNCTION_2_33();
}

uint64_t ScaleEvent.y.setter()
{
  return OUTLINED_FUNCTION_0_32();
}

uint64_t (*ScaleEvent.y.modify(uint64_t a1, uint64_t a2))()
{
  OUTLINED_FUNCTION_2_2(a1, a2);
  IOHIDEventGetFloatValue();
  void *v2 = v3;
  return sub_26084B1A4;
}

uint64_t sub_26084B1A4()
{
  return OUTLINED_FUNCTION_0_32();
}

uint64_t ScaleEvent.z.setter()
{
  return OUTLINED_FUNCTION_0_32();
}

uint64_t (*ScaleEvent.z.modify(uint64_t a1, uint64_t a2))()
{
  OUTLINED_FUNCTION_2_2(a1, a2);
  IOHIDEventGetFloatValue();
  void *v2 = v3;
  return sub_26084B20C;
}

uint64_t sub_26084B20C()
{
  return OUTLINED_FUNCTION_0_32();
}

uint64_t sub_26084B220@<X0>(void *a1@<X8>)
{
  uint64_t result = ScaleEvent.x.getter();
  *a1 = v3;
  return result;
}

uint64_t sub_26084B24C(double *a1, void *a2)
{
  return ScaleEvent.x.setter(*a2, *a1);
}

uint64_t sub_26084B258@<X0>(void *a1@<X8>)
{
  uint64_t result = ScaleEvent.y.getter();
  *a1 = v3;
  return result;
}

uint64_t sub_26084B284()
{
  return ScaleEvent.y.setter();
}

uint64_t sub_26084B290@<X0>(void *a1@<X8>)
{
  uint64_t result = ScaleEvent.z.getter();
  *a1 = v3;
  return result;
}

uint64_t sub_26084B2BC()
{
  return ScaleEvent.z.setter();
}

ValueMetadata *type metadata accessor for ScaleEvent()
{
  return &type metadata for ScaleEvent;
}

uint64_t OUTLINED_FUNCTION_0_32()
{
  return IOHIDEventSetFloatValue();
}

uint64_t OUTLINED_FUNCTION_1_32()
{
  return IOHIDEventSetFloatValue();
}

uint64_t OUTLINED_FUNCTION_2_33()
{
  return IOHIDEventGetFloatValue();
}

uint64_t sub_26084B2F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_2607F7344((_OWORD *)a1, v6);
    sub_2607F4FEC(v6, a2, a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_26084FD20(a1, &qword_26A8B4998);
    sub_2607F4CD8(v6);
    swift_bridgeObjectRelease();
    return sub_26084FD20((uint64_t)v6, &qword_26A8B4998);
  }
}

uint64_t sub_26084B384(uint64_t a1, unsigned __int8 a2)
{
  if (*(void *)(a1 + 24))
  {
    sub_2607E2B70((long long *)a1, (uint64_t)v9);
    return sub_2607F5064();
  }
  else
  {
    sub_26084FD20(a1, &qword_26A8B48B0);
    unint64_t v5 = sub_2607F3D3C(a2);
    if (v6)
    {
      unint64_t v7 = v5;
      swift_isUniquelyReferenced_nonNull_native();
      uint64_t v8 = *v2;
      uint64_t *v2 = 0x8000000000000000;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A8B52F0);
      sub_26087B950();
      sub_2607E2B70((long long *)(*(void *)(v8 + 56) + 40 * v7), (uint64_t)v9);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A8B5170);
      sub_260809538();
      sub_26087B970();
      uint64_t *v2 = v8;
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v10 = 0;
      memset(v9, 0, sizeof(v9));
    }
    return sub_26084FD20((uint64_t)v9, &qword_26A8B48B0);
  }
}

void sub_26084B4B8(uint64_t a1, void (*a2)(void **__return_ptr, unsigned char *))
{
  uint64_t v5 = OBJC_IVAR____TtC12UniversalHID17HIDVirtualService_state;
  uint64_t v6 = *(void *)(v2 + OBJC_IVAR____TtC12UniversalHID17HIDVirtualService_state);
  if (!v6)
  {
    unint64_t v9 = *(void *)(a1 + 16);
    swift_bridgeObjectRetain();
    swift_retain();
    unint64_t v10 = 0;
    while (1)
    {
      if (v10 == v9)
      {
        uint64_t v17 = 0;
        unint64_t v10 = v9;
        memset(v16, 0, sizeof(v16));
      }
      else
      {
        if (v10 >= v9)
        {
          __break(1u);
          return;
        }
        sub_26084FBB4(a1 + 32 + 40 * v10++, (uint64_t)v16);
      }
      sub_260812168((uint64_t)v16, (uint64_t)&v14, &qword_26A8B4600);
      if (!v15)
      {
        swift_release();
        swift_bridgeObjectRelease();
        return;
      }
      sub_2607E2B70(&v14, (uint64_t)v13);
      a2(&v12, v13);
      v11 = v12;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
      sub_26084EF84(v11, v2);
    }
  }
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  unint64_t v7 = sub_260838834(a1, (uint64_t)a2);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_26082E110(v7);
  swift_release();
  sub_26084C044(v8);
  *(void *)(v2 + v5) = v6;
  swift_bridgeObjectRelease();
}

void HIDVirtualService.dispatch<A>(_:)()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v33 = v0;
  uint64_t v31 = v1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  unint64_t v7 = (char *)&v29 - v6;
  uint64_t v8 = sub_26087B620();
  uint64_t v9 = OUTLINED_FUNCTION_9_8(v8);
  MEMORY[0x270FA5388](v9);
  v11 = (char *)&v29 - v10;
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v12);
  long long v14 = (char *)&v29 - v13;
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_9_0();
  uint64_t v19 = OBJC_IVAR____TtC12UniversalHID17HIDVirtualService_state;
  uint64_t v20 = *(void *)(v17 + OBJC_IVAR____TtC12UniversalHID17HIDVirtualService_state);
  if (v20)
  {
    uint64_t v21 = v17;
    OUTLINED_FUNCTION_14_11();
    v22();
    swift_bridgeObjectRetain();
    sub_26087B440();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A8B50C0);
    uint64_t v23 = sub_26087B8F0();
    swift_bridgeObjectRelease();
    uint64_t v34 = v20;
    sub_26084C044(v23);
    *(void *)(v21 + v19) = v34;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v30 = v18;
    uint64_t v24 = v4;
    uint64_t v25 = v16;
    uint64_t v32 = v17;
    OUTLINED_FUNCTION_14_11();
    v26();
    sub_26087B380();
    swift_getAssociatedConformanceWitness();
    OUTLINED_FUNCTION_13_11();
    if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, AssociatedTypeWitness) != 1)
    {
      uint64_t v28 = v24 + 32;
      v27 = *(void (**)(char *, char *, uint64_t))(v24 + 32);
      do
      {
        v27(v7, v11, AssociatedTypeWitness);
        sub_26084F334((uint64_t)v7, v32, AssociatedTypeWitness, v33);
        (*(void (**)(char *, uint64_t))(v28 - 24))(v7, AssociatedTypeWitness);
        OUTLINED_FUNCTION_13_11();
      }
      while (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, AssociatedTypeWitness) != 1);
    }
    (*(void (**)(char *, uint64_t))(v30 + 8))(v14, v25);
  }
  OUTLINED_FUNCTION_14_0();
}

uint64_t sub_26084B990(uint64_t a1)
{
  return sub_26084B9AC(a1, 5u, (void (*)(void))type metadata accessor for PointerGesture);
}

uint64_t sub_26084B9AC(uint64_t a1, unsigned __int8 a2, void (*a3)(void))
{
  if (*(void *)(a1 + 16) && (unint64_t v5 = sub_2607F3D3C(a2), (v6 & 1) != 0))
  {
    sub_26084FBB4(*(void *)(a1 + 56) + 40 * v5, (uint64_t)v8);
  }
  else
  {
    uint64_t v9 = 0;
    memset(v8, 0, sizeof(v8));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B48B0);
  a3(0);
  if (swift_dynamicCast()) {
    return v10;
  }
  else {
    return 0;
  }
}

Swift::Void __swiftcall HIDVirtualService.activate()()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v2 + 64))(ObjectType, v2);
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 40))(ObjectType, v2);
  swift_beginAccess();
  *(void *)(v1 + 48) = v4;
}

Swift::Void __swiftcall HIDVirtualService.cancel()()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v18 = v1 + 64;
  uint64_t v2 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  unint64_t v4 = v3 & *(void *)(v1 + 64);
  int64_t v5 = (unint64_t)(v2 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v6 = 0;
  if (!v4) {
    goto LABEL_6;
  }
LABEL_4:
  unint64_t v7 = __clz(__rbit64(v4));
  v4 &= v4 - 1;
  unint64_t v8 = v7 | (v6 << 6);
  while (2)
  {
    uint64_t v9 = *(void *)(v1 + 56);
    LOBYTE(v19) = *(unsigned char *)(*(void *)(v1 + 48) + v8);
    sub_26084FBB4(v9 + 40 * v8, (uint64_t)&v19 + 8);
    while (1)
    {
      sub_260812168((uint64_t)&v19, (uint64_t)v22, &qword_26A8B48A8);
      if (!v24)
      {
        swift_release();
        uint64_t v16 = *(void *)(v0 + 40);
        uint64_t ObjectType = swift_getObjectType();
        (*(void (**)(uint64_t, uint64_t))(v16 + 72))(ObjectType, v16);
        return;
      }
      sub_2607E2B70(&v23, (uint64_t)&v19);
      uint64_t v13 = *((void *)&v20 + 1);
      uint64_t v14 = v21;
      uint64_t v15 = __swift_project_boxed_opaque_existential_1(&v19, *((uint64_t *)&v20 + 1));
      sub_26084D394((uint64_t)v15, v13, v14);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v19);
      if (v4) {
        goto LABEL_4;
      }
LABEL_6:
      int64_t v10 = v6 + 1;
      if (__OFADD__(v6, 1))
      {
        __break(1u);
        goto LABEL_29;
      }
      if (v10 < v5)
      {
        unint64_t v11 = *(void *)(v18 + 8 * v10);
        if (v11) {
          goto LABEL_9;
        }
        int64_t v12 = v6 + 2;
        ++v6;
        if (v10 + 1 < v5)
        {
          unint64_t v11 = *(void *)(v18 + 8 * v12);
          if (v11) {
            goto LABEL_12;
          }
          int64_t v6 = v10 + 1;
          if (v10 + 2 < v5)
          {
            unint64_t v11 = *(void *)(v18 + 8 * (v10 + 2));
            if (v11)
            {
              v10 += 2;
              goto LABEL_9;
            }
            int64_t v12 = v10 + 3;
            int64_t v6 = v10 + 2;
            if (v10 + 3 < v5) {
              break;
            }
          }
        }
      }
LABEL_23:
      unint64_t v4 = 0;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v19 = 0u;
    }
    unint64_t v11 = *(void *)(v18 + 8 * v12);
    if (v11)
    {
LABEL_12:
      int64_t v10 = v12;
LABEL_9:
      unint64_t v4 = (v11 - 1) & v11;
      unint64_t v8 = __clz(__rbit64(v11)) + (v10 << 6);
      int64_t v6 = v10;
      continue;
    }
    break;
  }
  while (1)
  {
    int64_t v10 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v10 >= v5)
    {
      int64_t v6 = v5 - 1;
      goto LABEL_23;
    }
    unint64_t v11 = *(void *)(v18 + 8 * v10);
    ++v12;
    if (v11) {
      goto LABEL_9;
    }
  }
LABEL_29:
  __break(1u);
}

void sub_26084BD20(unsigned __int8 a1, uint64_t a2)
{
  if (*(void *)(a2 + 16))
  {
    int v3 = a1;
    sub_26087BCA0();
    sub_26087BCB0();
    unint64_t v4 = sub_26087BD00() & ~(-1 << *(unsigned char *)(a2 + 32));
    if (((*(void *)(a2 + 56 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0
      && *(unsigned __int8 *)(*(void *)(a2 + 48) + v4) != v3)
    {
      OUTLINED_FUNCTION_7_19();
      if (v7)
      {
        do
        {
          if (*(unsigned __int8 *)(v5 + v6) == v3) {
            break;
          }
          OUTLINED_FUNCTION_7_19();
        }
        while ((v8 & 1) != 0);
      }
    }
  }
}

uint64_t sub_26084BDE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_26087BCA0();
    sub_26087B300();
    uint64_t v6 = sub_26087BD00();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      unint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_26087BBE0() & 1) != 0) {
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
          if (v17 || (sub_26087BBE0() & 1) != 0) {
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

uint64_t sub_26084BF20(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 16);
  uint64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v6 = result;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = result;
  *uint64_t v1 = v3;
  if (!result || (uint64_t v8 = *(void *)(v3 + 24) >> 1, v8 < v5))
  {
    if (v4 <= v5) {
      v4 += v2;
    }
    swift_bridgeObjectRetain();
    *uint64_t v1 = MEMORY[0x26121CC60](v7, v4, 1, v3);
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v3 = *v1;
    uint64_t v8 = *(void *)(*v1 + 24) >> 1;
  }
  if (!*(void *)(v6 + 16))
  {
    if (!v2) {
      goto LABEL_13;
    }
    goto LABEL_17;
  }
  uint64_t v9 = *(void *)(v3 + 16);
  if (v8 - v9 < v2)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t result = sub_2607E91C4(v6 + 32, v2, v3 + 8 * v9 + 32);
  if (v2)
  {
    uint64_t v10 = *(void *)(*v1 + 16);
    BOOL v11 = __OFADD__(v10, v2);
    uint64_t v12 = v10 + v2;
    if (!v11)
    {
      *(void *)(*v1 + 16) = v12;
      goto LABEL_13;
    }
LABEL_19:
    __break(1u);
    return result;
  }
LABEL_13:
  swift_bridgeObjectRelease();
  return sub_26087B400();
}

void sub_26084C044(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 16);
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (!swift_isUniquelyReferenced_nonNull_native() || v4 + v2 > *(void *)(v3 + 24) >> 1)
  {
    sub_260822518();
    uint64_t v3 = v6;
  }
  if (!*(void *)(a1 + 16))
  {
    if (!v2) {
      goto LABEL_11;
    }
    goto LABEL_13;
  }
  uint64_t v7 = *(void *)(v3 + 16);
  if ((*(void *)(v3 + 24) >> 1) - v7 < v2)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  sub_2607E90F0(a1 + 32, v2, v3 + 40 * v7 + 32);
  if (!v2)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return;
  }
  uint64_t v8 = *(void *)(v3 + 16);
  BOOL v9 = __OFADD__(v8, v2);
  uint64_t v10 = v8 + v2;
  if (!v9)
  {
    *(void *)(v3 + 16) = v10;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
}

void HIDVirtualService.property(forKey:)(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v7 = (uint64_t *)(v3 + OBJC_IVAR____TtC12UniversalHID17HIDVirtualService_modifiedProperties);
  swift_beginAccess();
  uint64_t v8 = *v7;
  swift_bridgeObjectRetain();
  sub_2608073E8(v8, &v14);
  swift_bridgeObjectRelease();
  if (*((void *)&v15 + 1))
  {
    sub_2607F7344(&v14, a3);
    swift_endAccess();
  }
  else
  {
    sub_26084FD20((uint64_t)&v14, &qword_26A8B4998);
    swift_endAccess();
    OUTLINED_FUNCTION_6_18();
    BOOL v9 = *(void **)(v3 + 64);
    swift_bridgeObjectRetain();
    id v10 = v9;
    BOOL v11 = (void *)static HIDServicePropertyKey.allCases.getter();
    char v12 = sub_26085369C(a1, a2, v11);
    swift_bridgeObjectRelease();
    if (v12)
    {
      *(void *)&long long v14 = a1;
      *((void *)&v14 + 1) = a2;
      swift_bridgeObjectRetain();
      id v13 = objc_msgSend(v10, sel___swift_objectForKeyedSubscript_, sub_26087BC00());
      swift_unknownObjectRelease();
      if (v13)
      {
        sub_26087B730();
        swift_unknownObjectRelease();
      }
      else
      {
        long long v14 = 0u;
        long long v15 = 0u;
      }
      sub_260812168((uint64_t)&v14, (uint64_t)a3, &qword_26A8B4998);

      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      *a3 = 0u;
      a3[1] = 0u;
    }
  }
}

uint64_t HIDVirtualService.serviceID.getter()
{
  OUTLINED_FUNCTION_6_18();
  return *(void *)(v0 + 48);
}

uint64_t HIDVirtualService.properties.getter()
{
  OUTLINED_FUNCTION_6_18();
  uint64_t v1 = *(void *)(v0 + 56);
  id v2 = *(id *)(v0 + 64);
  return v1;
}

uint64_t sub_26084C33C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B52E0);
  uint64_t result = swift_initStackObject();
  *(_OWORD *)(result + 16) = xmmword_260880810;
  *(void *)(result + 32) = 0xD000000000000010;
  *(void *)(result + 40) = 0x8000000260884CE0;
  if (*MEMORY[0x263F0EC80])
  {
    uint64_t v1 = (void *)result;
    id v2 = (id)*MEMORY[0x263F0EC80];
    v1[6] = sub_26087B2C0();
    v1[7] = v3;
    v1[8] = 0xD00000000000001DLL;
    v1[9] = 0x8000000260885290;
    uint64_t result = sub_26084EDB4((uint64_t)v1);
    qword_26A8B50B0 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t HIDVirtualService.shouldDispatchScrollEvents.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC12UniversalHID17HIDVirtualService_shouldDispatchScrollEvents);
}

id HIDVirtualService.queue.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC12UniversalHID17HIDVirtualService_queue);
}

#error "26084C61C: call analysis failed (funcsize=145)"

void HIDVirtualService.__allocating_init(logger:properties:queue:absolutePointerGesture:appleVendorKeyboardGesture:appleVendorTopCaseGesture:consumerGesture:genericGestureGesture:keyboardGesture:digitizerGesture:pointerGesture:scrollGesture:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v51 = v33;
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A8B50E0);
  uint64_t v36 = OUTLINED_FUNCTION_9_8(v35);
  MEMORY[0x270FA5388](v36);
  OUTLINED_FUNCTION_9_0();
  sub_26084F7C0(v34, v38 - v37, (uint64_t *)&unk_26A8B50E0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B4968);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_26087D900;
  *(unsigned char *)(inited + 32) = 19;
  *(void *)(inited + 64) = type metadata accessor for AbsolutePointerGesture();
  *(void *)(inited + 72) = &protocol witness table for AbsolutePointerGesture;
  *(void *)(inited + 40) = v32;
  *(unsigned char *)(inited + 80) = 4;
  *(void *)(inited + 112) = type metadata accessor for AppleVendorTopCaseGesture(0);
  *(void *)(inited + 120) = sub_260811C3C();
  *(void *)(inited + 88) = v28;
  *(unsigned char *)(inited + 128) = 3;
  *(void *)(inited + 160) = type metadata accessor for AppleVendorKeyboardGesture(0);
  *(void *)(inited + 168) = sub_260811D74();
  *(void *)(inited + 136) = v30;
  *(unsigned char *)(inited + 176) = 2;
  *(void *)(inited + 208) = type metadata accessor for ConsumerGesture(0);
  *(void *)(inited + 216) = sub_260811EAC();
  *(void *)(inited + 184) = v26;
  *(unsigned char *)(inited + 224) = 9;
  *(void *)(inited + 256) = type metadata accessor for DigitizerGesture();
  *(void *)(inited + 264) = &protocol witness table for DigitizerGesture;
  *(void *)(inited + 232) = a23;
  *(unsigned char *)(inited + 272) = 1;
  *(void *)(inited + 304) = type metadata accessor for KeyboardGesture(0);
  *(void *)(inited + 312) = sub_260812030();
  *(void *)(inited + 280) = a22;
  *(unsigned char *)(inited + 320) = 20;
  *(void *)(inited + 352) = type metadata accessor for GenericGestureGesture();
  *(void *)(inited + 360) = &protocol witness table for GenericGestureGesture;
  *(void *)(inited + 328) = a21;
  *(unsigned char *)(inited + 368) = 5;
  *(void *)(inited + 400) = type metadata accessor for PointerGesture();
  *(void *)(inited + 408) = &protocol witness table for PointerGesture;
  *(void *)(inited + 376) = a24;
  *(unsigned char *)(inited + 416) = 7;
  *(void *)(inited + 448) = type metadata accessor for ScrollGesture();
  *(void *)(inited + 456) = &protocol witness table for ScrollGesture;
  *(void *)(inited + 424) = a25;
  *(unsigned char *)(inited + 464) = 11;
  uint64_t v40 = type metadata accessor for DockSwipeGesture();
  uint64_t v41 = swift_allocObject();
  *(unsigned char *)(v41 + 16) = 0;
  *(void *)(inited + 496) = v40;
  *(void *)(inited + 504) = &protocol witness table for DockSwipeGesture;
  *(void *)(inited + 472) = v41;
  *(unsigned char *)(inited + 512) = 13;
  type metadata accessor for NavigationSwipeGesture();
  uint64_t v42 = OUTLINED_FUNCTION_1_33();
  *(unsigned char *)(v42 + 16) = 0;
  *(void *)(inited + 544) = v40;
  *(void *)(inited + 552) = &protocol witness table for NavigationSwipeGesture;
  *(void *)(inited + 520) = v42;
  *(unsigned char *)(inited + 560) = 17;
  type metadata accessor for TranslationGesture();
  uint64_t v43 = OUTLINED_FUNCTION_1_33();
  *(unsigned char *)(v43 + 16) = 0;
  *(void *)(inited + 592) = v40;
  *(void *)(inited + 600) = &protocol witness table for TranslationGesture;
  *(void *)(inited + 568) = v43;
  *(unsigned char *)(inited + 608) = 12;
  type metadata accessor for FluidTouchGesture();
  uint64_t v44 = OUTLINED_FUNCTION_1_33();
  *(unsigned char *)(v44 + 16) = 0;
  *(void *)(inited + 640) = v40;
  *(void *)(inited + 648) = &protocol witness table for FluidTouchGesture;
  *(void *)(inited + 616) = v44;
  *(unsigned char *)(inited + 656) = 15;
  type metadata accessor for ScaleGesture();
  uint64_t v45 = OUTLINED_FUNCTION_1_33();
  *(unsigned char *)(v45 + 16) = 0;
  *(void *)(inited + 688) = v40;
  *(void *)(inited + 696) = &protocol witness table for ScaleGesture;
  *(void *)(inited + 664) = v45;
  *(unsigned char *)(inited + 704) = 16;
  type metadata accessor for RotationGesture();
  uint64_t v46 = OUTLINED_FUNCTION_1_33();
  *(unsigned char *)(v46 + 16) = 0;
  *(void *)(inited + 736) = v40;
  *(void *)(inited + 744) = &protocol witness table for RotationGesture;
  *(void *)(inited + 712) = v46;
  *(unsigned char *)(inited + 752) = 14;
  uint64_t v47 = type metadata accessor for ZoomToggleGesture();
  uint64_t v48 = swift_allocObject();
  *(void *)(inited + 784) = v47;
  *(void *)(inited + 792) = &protocol witness table for ZoomToggleGesture;
  *(void *)(inited + 760) = v48;
  *(unsigned char *)(inited + 800) = 18;
  uint64_t v49 = type metadata accessor for GameControllerGesture();
  uint64_t v50 = swift_allocObject();
  *(void *)(inited + 832) = v49;
  *(void *)(inited + 840) = &protocol witness table for GameControllerGesture;
  *(void *)(inited + 808) = v50;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A8B5170);
  sub_260809538();
  sub_26087B200();
  OUTLINED_FUNCTION_15_12();
  sub_26084CC44();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_26084FD20(v51, (uint64_t *)&unk_26A8B50E0);
  OUTLINED_FUNCTION_14_0();
}

#error "26084CC10: call analysis failed (funcsize=82)"

void sub_26084CC44()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v45 = v4;
  uint64_t v46 = v5;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A8B50E0);
  uint64_t v11 = OUTLINED_FUNCTION_9_8(v10);
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_9_0();
  uint64_t v14 = v13 - v12;
  v1[6] = 0;
  uint64_t v15 = OBJC_IVAR____TtC12UniversalHID17HIDVirtualService_modifiedProperties;
  uint64_t v16 = MEMORY[0x263F8EE78];
  *(void *)((char *)v1 + v15) = sub_26087B200();
  uint64_t v17 = OBJC_IVAR____TtC12UniversalHID17HIDVirtualService_notificationCenterModeProcesses;
  sub_26087B140();
  *(void *)((char *)v1 + v17) = sub_26087B200();
  *(void *)((char *)v1 + OBJC_IVAR____TtC12UniversalHID17HIDVirtualService_state) = v16;
  uint64_t v18 = (void *)((char *)v1 + OBJC_IVAR____TtC12UniversalHID17HIDVirtualService_terminationWasRequestedHandler);
  *uint64_t v18 = nullsub_1;
  v18[1] = 0;
  v53[0] = 0x746375646F7250;
  v53[1] = 0xE700000000000000;
  id v19 = v7;
  id v20 = objc_msgSend(v19, sel___swift_objectForKeyedSubscript_, sub_26087BC00());
  swift_unknownObjectRelease();
  if (v20)
  {
    sub_26087B730();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v53, 0, sizeof(v53));
  }
  sub_260812168((uint64_t)v53, (uint64_t)&v47, &qword_26A8B4998);
  if (v50)
  {
    if (swift_dynamicCast())
    {
      unint64_t v47 = 11606;
      unint64_t v48 = 0xE200000000000000;
      sub_26087B330();
      swift_bridgeObjectRelease();
      long long v21 = (void *)sub_26087B2A0();
      swift_bridgeObjectRelease();
      goto LABEL_9;
    }
  }
  else
  {
    sub_26084FD20((uint64_t)&v47, &qword_26A8B4998);
  }
  long long v21 = 0;
LABEL_9:
  unint64_t v47 = 0x746375646F7250;
  unint64_t v48 = 0xE700000000000000;
  objc_msgSend(v19, sel___swift_setObject_forKeyedSubscript_, v21, sub_26087BC00());

  swift_unknownObjectRelease();
  v22 = (void *)sub_26087B450();
  unint64_t v47 = 0xD00000000000001ELL;
  unint64_t v48 = 0x8000000260883E40;
  objc_msgSend(v19, sel___swift_setObject_forKeyedSubscript_, v22, sub_26087BC00());

  swift_unknownObjectRelease();
  id v23 = v19;
  if (HIDDeviceType.init(properties:)(v9, v23) == 3)
  {
    uint64_t v24 = (void *)sub_26087B2A0();
    OUTLINED_FUNCTION_10_17(0xD000000000000012);
    uint64_t v25 = sub_26087BC00();
    OUTLINED_FUNCTION_2_34(v25);

    swift_unknownObjectRelease();
  }
  id v26 = v23;
  if (HIDDeviceType.init(properties:)(v9, v26) == 5)
  {
    uint64_t v27 = sub_26084B9AC(v3, 7u, (void (*)(void))type metadata accessor for ScrollGesture);
    if (v27)
    {
      char v28 = *(unsigned char *)(v27 + 18);
      swift_release();
    }
    else
    {
      char v28 = 0;
    }
  }
  else
  {
    char v28 = 1;
  }
  *((unsigned char *)v1 + OBJC_IVAR____TtC12UniversalHID17HIDVirtualService_shouldDispatchScrollEvents) = v28;
  uint64_t v29 = sub_26084B9AC(v3, 5u, (void (*)(void))type metadata accessor for PointerGesture);
  if (v29)
  {
    int v30 = *(unsigned __int8 *)(v29 + OBJC_IVAR____TtC12UniversalHID14PointerGesture_useRemoteAcceleration);
    swift_release();
    if (v30 == 1)
    {
      uint64_t v31 = (void *)sub_26087B450();
      unint64_t v47 = 0xD00000000000001ELL;
      unint64_t v48 = 0x8000000260884FD0;
      uint64_t v32 = sub_26087BC00();
      OUTLINED_FUNCTION_2_34(v32);

      swift_unknownObjectRelease();
    }
  }
  uint64_t v33 = sub_26084B9AC(v3, 7u, (void (*)(void))type metadata accessor for ScrollGesture);
  if (v33)
  {
    int v34 = *(unsigned __int8 *)(v33 + 17);
    swift_release();
    if (v34 == 1)
    {
      uint64_t v35 = (void *)sub_26087B450();
      OUTLINED_FUNCTION_10_17(0xD00000000000001DLL);
      uint64_t v36 = sub_26087BC00();
      OUTLINED_FUNCTION_2_34(v36);

      swift_unknownObjectRelease();
    }
  }
  sub_26087B200();
  uint64_t v37 = (void *)sub_26087B1D0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10_17(0xD000000000000019);
  objc_msgSend(v26, sel___swift_setObject_forKeyedSubscript_, v37, sub_26087BC00());

  swift_unknownObjectRelease();
  v1[7] = v9;
  v1[8] = v26;
  sub_26084F7C0(v45, v14, (uint64_t *)&unk_26A8B50E0);
  id v38 = objc_allocWithZone((Class)type metadata accessor for HIDVirtualServiceDelegate(0));
  id v39 = v26;
  id v40 = sub_26084E670(v14);
  id v41 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F41DE8]), sel_init);
  objc_msgSend(v41, sel_setDispatchQueue_, v46);
  uint64_t v42 = swift_allocObject();
  *(void *)(v42 + 16) = v41;
  uint64_t v51 = nullsub_1;
  uint64_t v52 = v42;
  unint64_t v47 = MEMORY[0x263EF8330];
  unint64_t v48 = 1107296256;
  uint64_t v49 = sub_2608045D0;
  uint64_t v50 = &block_descriptor_18;
  uint64_t v43 = _Block_copy(&v47);
  id v44 = v41;
  swift_release();
  objc_msgSend(v44, sel_setCancelHandler_, v43);
  _Block_release(v43);
  objc_msgSend(v44, sel_setDelegate_, v40);

  sub_260812168(v45, (uint64_t)v1 + OBJC_IVAR____TtC12UniversalHID17HIDVirtualService_logger, (uint64_t *)&unk_26A8B50E0);
  v1[2] = v3;
  v1[3] = v40;
  v1[4] = v44;
  v1[5] = &protocol witness table for HIDVirtualEventService;
  *(void *)((char *)v1 + OBJC_IVAR____TtC12UniversalHID17HIDVirtualService_queue) = v46;
  swift_weakAssign();
  OUTLINED_FUNCTION_14_0();
}

void sub_26084D2F8()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC12UniversalHID17HIDVirtualService_state);
  if (v1)
  {
    *(void *)(v0 + OBJC_IVAR____TtC12UniversalHID17HIDVirtualService_state) = 0;
    uint64_t v2 = *(void *)(v1 + 16);
    if (v2)
    {
      uint64_t v3 = v1 + 32;
      do
      {
        sub_26084FBB4(v3, (uint64_t)v7);
        uint64_t v4 = v8;
        uint64_t v5 = v9;
        uint64_t v6 = __swift_project_boxed_opaque_existential_1(v7, v8);
        sub_26084F334((uint64_t)v6, v0, v4, v5);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
        v3 += 40;
        --v2;
      }
      while (v2);
    }
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_26084D394(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v8 = (char *)&v12 - v7;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 32))(AssociatedTypeWitness, AssociatedConformanceWitness);
  uint64_t v10 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(a3 + 32))(v8, a2, a3);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, AssociatedTypeWitness);
  if (*(void *)(v10 + 16)) {
    sub_26084B4B8(v10, (void (*)(void **__return_ptr, unsigned char *))sub_26084D520);
  }
  return swift_bridgeObjectRelease();
}

uint64_t HIDVirtualService.deinit()
{
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  sub_26084FD20(v0 + OBJC_IVAR____TtC12UniversalHID17HIDVirtualService_logger, (uint64_t *)&unk_26A8B50E0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t HIDVirtualService.__deallocating_deinit()
{
  HIDVirtualService.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_26084D620()
{
  return HIDVirtualService.properties.getter();
}

uint64_t sub_26084D644()
{
  return HIDVirtualService.serviceID.getter();
}

void sub_26084D668()
{
}

void sub_26084D68C()
{
}

uint64_t HIDVirtualService.description.getter()
{
  uint64_t v1 = v0;
  OUTLINED_FUNCTION_6_18();
  sub_26080707C();
  sub_26087B360();
  sub_26087B330();
  swift_bridgeObjectRelease();
  sub_26087B330();
  OUTLINED_FUNCTION_6_18();
  uint64_t v2 = *(void *)(v0 + 56);
  id v3 = *(id *)(v1 + 64);
  HIDServiceProperties.description.getter(v2, v3);
  sub_26087B330();

  swift_bridgeObjectRelease();
  return 91;
}

uint64_t sub_26084D784()
{
  return HIDVirtualService.description.getter();
}

void HIDVirtualService.setProperty(_:forKey:)()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v1 = v0;
  unint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A8B50E0);
  uint64_t v9 = OUTLINED_FUNCTION_9_8(v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_11_13();
  uint64_t v12 = v10 - v11;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v38 - v14;
  if (qword_26A8B4550 != -1) {
    swift_once();
  }
  if ((sub_26084BDE8(v5, v3, qword_26A8B50B0) & 1) == 0) {
    goto LABEL_31;
  }
  uint64_t v44 = v1 + OBJC_IVAR____TtC12UniversalHID17HIDVirtualService_logger;
  sub_26084F7C0(v1 + OBJC_IVAR____TtC12UniversalHID17HIDVirtualService_logger, (uint64_t)v15, (uint64_t *)&unk_26A8B50E0);
  uint64_t v16 = sub_26087B120();
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16) == 1)
  {
    sub_26084FD20((uint64_t)v15, (uint64_t *)&unk_26A8B50E0);
  }
  else
  {
    sub_26084F7C0(v7, (uint64_t)v47, &qword_26A8B4998);
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v17 = sub_26087B100();
    os_log_type_t v18 = sub_26087B530();
    int v43 = v18;
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = swift_slowAlloc();
      uint64_t v41 = v7;
      uint64_t v20 = v19;
      uint64_t v40 = swift_slowAlloc();
      v46[0] = v40;
      *(_DWORD *)uint64_t v20 = 134218499;
      os_log_t v39 = v17;
      OUTLINED_FUNCTION_6_18();
      uint64_t v42 = v16;
      uint64_t v21 = *(void *)(v1 + 48);
      swift_release();
      uint64_t v45 = v21;
      OUTLINED_FUNCTION_9_20();
      swift_release();
      *(_WORD *)(v20 + 12) = 2082;
      swift_bridgeObjectRetain();
      uint64_t v45 = sub_26080F618(v5, v3, v46);
      OUTLINED_FUNCTION_9_20();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v20 + 22) = 2081;
      uint64_t v22 = sub_26084DD64((uint64_t)v47);
      uint64_t v45 = sub_26080F618(v22, v23, v46);
      OUTLINED_FUNCTION_9_20();
      uint64_t v16 = v42;
      swift_bridgeObjectRelease();
      sub_26084FD20((uint64_t)v47, &qword_26A8B4998);
      os_log_t v24 = v39;
      _os_log_impl(&dword_2607D9000, v39, (os_log_type_t)v43, "%llx: SetProperty %{public}s: %{private}s", (uint8_t *)v20, 0x20u);
      uint64_t v25 = v40;
      swift_arrayDestroy();
      MEMORY[0x26121DB90](v25, -1, -1);
      uint64_t v26 = v20;
      uint64_t v7 = v41;
      MEMORY[0x26121DB90](v26, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      swift_release_n();
      sub_26084FD20((uint64_t)v47, &qword_26A8B4998);
    }
    OUTLINED_FUNCTION_5_0();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v15, v16);
  }
  sub_26084F7C0(v7, (uint64_t)v47, &qword_26A8B4998);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_26084B2F0((uint64_t)v47, v5, v3);
  swift_endAccess();
  if (*MEMORY[0x263F0EC80])
  {
    id v28 = (id)*MEMORY[0x263F0EC80];
    if (sub_26087B2C0() == v5 && v29 == v3)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v31 = sub_26087BBE0();
      swift_bridgeObjectRelease();
      if ((v31 & 1) == 0)
      {
        if (v5 == 0xD00000000000001DLL && v3 == 0x8000000260885290 || (sub_26087BBE0() & 1) != 0) {
          sub_26084DE04(v7);
        }
        goto LABEL_31;
      }
    }
    sub_26084F7C0(v7, (uint64_t)v47, &qword_26A8B4998);
    if (v47[3])
    {
      if swift_dynamicCast() && (v46[0])
      {
        uint64_t v32 = *(void (**)(uint64_t))(v1
                                             + OBJC_IVAR____TtC12UniversalHID17HIDVirtualService_terminationWasRequestedHandler);
        uint64_t v33 = swift_retain();
        v32(v33);
        swift_release();
LABEL_31:
        OUTLINED_FUNCTION_14_0();
        return;
      }
    }
    else
    {
      sub_26084FD20((uint64_t)v47, &qword_26A8B4998);
    }
    sub_26084F7C0(v44, v12, (uint64_t *)&unk_26A8B50E0);
    if (__swift_getEnumTagSinglePayload(v12, 1, v16) == 1)
    {
      sub_26084FD20(v12, (uint64_t *)&unk_26A8B50E0);
    }
    else
    {
      int v34 = sub_26087B100();
      os_log_type_t v35 = sub_26087B520();
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v36 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v36 = 0;
        _os_log_impl(&dword_2607D9000, v34, v35, "RequestTerminate set to an unexpected value", v36, 2u);
        MEMORY[0x26121DB90](v36, -1, -1);
      }

      OUTLINED_FUNCTION_5_0();
      (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v12, v16);
    }
    goto LABEL_31;
  }
  __break(1u);
}

uint64_t sub_26084DD64(uint64_t a1)
{
  sub_26084F7C0(a1, (uint64_t)&v3, &qword_26A8B4998);
  if (v4)
  {
    sub_2607F7344(&v3, v5);
    sub_26080964C((uint64_t)v5, (uint64_t)&v3);
    uint64_t v1 = sub_26087B2D0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  }
  else
  {
    sub_26084FD20((uint64_t)&v3, &qword_26A8B4998);
    return 7104878;
  }
  return v1;
}

uint64_t sub_26084DE04(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_beginAccess();
  uint64_t result = HIDDeviceType.init(properties:)(*(void *)(v2 + 56), *(id *)(v2 + 64));
  if (result == 5)
  {
    sub_26084F7C0(a1, (uint64_t)&v12, &qword_26A8B4998);
    if (!v13) {
      return sub_26084FD20((uint64_t)&v12, &qword_26A8B4998);
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B5240);
    uint64_t result = swift_dynamicCast();
    if ((result & 1) == 0) {
      return result;
    }
    sub_2608073E8(v11, &v12);
    if (v13)
    {
      if (swift_dynamicCast())
      {
        int v5 = v11;
        goto LABEL_10;
      }
    }
    else
    {
      sub_26084FD20((uint64_t)&v12, &qword_26A8B4998);
    }
    int v5 = 0;
LABEL_10:
    sub_2608073E8(v11, &v12);
    swift_bridgeObjectRelease();
    if (v13)
    {
      if (swift_dynamicCast())
      {
        unsigned int v6 = v11;
        if ((v5 & 1) == 0)
        {
LABEL_13:
          uint64_t v7 = (uint64_t *)(v2 + OBJC_IVAR____TtC12UniversalHID17HIDVirtualService_notificationCenterModeProcesses);
          swift_beginAccess();
          if (sub_26080744C(v6, *v7))
          {
            swift_endAccess();
            sub_26087B130();
            swift_release();
          }
          else
          {
            swift_endAccess();
          }
          swift_beginAccess();
          sub_2607F4EBC(v6);
          swift_endAccess();
          swift_release();
          goto LABEL_20;
        }
LABEL_17:
        uint64_t v8 = swift_allocObject();
        *(void *)(v8 + 16) = v2;
        *(_DWORD *)(v8 + 24) = v6;
        swift_retain();
        sub_26084E168(v6, (uint64_t)sub_26084FC4C, v8);
        swift_release();
        swift_beginAccess();
        sub_2607F5118();
        swift_endAccess();
LABEL_20:
        uint64_t result = sub_26084B9AC(*(void *)(v2 + 16), 9u, (void (*)(void))type metadata accessor for DigitizerGesture);
        if (result)
        {
          uint64_t v9 = result;
          uint64_t v10 = v2 + OBJC_IVAR____TtC12UniversalHID17HIDVirtualService_notificationCenterModeProcesses;
          swift_beginAccess();
          LOBYTE(v10) = *(void *)(*(void *)v10 + 16) != 0;
          swift_beginAccess();
          *(unsigned char *)(v9 + 19) = v10;
          sub_26084B4B8(MEMORY[0x263F8EE78], (void (*)(void **__return_ptr, unsigned char *))sub_26084D520);
          return swift_release();
        }
        return result;
      }
    }
    else
    {
      sub_26084FD20((uint64_t)&v12, &qword_26A8B4998);
    }
    unsigned int v6 = -1;
    if (!v5) {
      goto LABEL_13;
    }
    goto LABEL_17;
  }
  return result;
}

uint64_t sub_26084E168(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = a2;
  uint64_t v23 = a3;
  uint64_t v4 = sub_26087B160();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_26087B190();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_26087B5A0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >= 1)
  {
    sub_26081221C(0, &qword_26A8B5248);
    uint64_t v21 = v4;
    sub_26087B590();
    uint64_t v16 = sub_26087B5B0();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    swift_getObjectType();
    uint64_t v17 = swift_allocObject();
    uint64_t v18 = v23;
    *(void *)(v17 + 16) = v22;
    *(void *)(v17 + 24) = v18;
    aBlock[4] = sub_2608071CC;
    aBlock[5] = v17;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2608045D0;
    aBlock[3] = &block_descriptor_3;
    uint64_t v19 = _Block_copy(aBlock);
    swift_retain();
    sub_26087B170();
    sub_26084E510();
    sub_26087B5C0();
    _Block_release(v19);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v21);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    swift_release();
    sub_26087B5E0();
    *(void *)(swift_allocObject() + 16) = v16;
  }
  sub_26087B140();
  swift_allocObject();
  return sub_26087B150();
}

uint64_t sub_26084E510()
{
  return sub_26087B7A0();
}

uint64_t sub_26084E590()
{
  return sub_26087B5D0();
}

uint64_t sub_26084E5B8(uint64_t a1, unsigned int a2)
{
  long long v3 = (uint64_t *)(a1 + OBJC_IVAR____TtC12UniversalHID17HIDVirtualService_notificationCenterModeProcesses);
  swift_beginAccess();
  if (sub_26080744C(a2, *v3))
  {
    swift_endAccess();
    sub_26087B130();
    swift_release();
  }
  else
  {
    swift_endAccess();
  }
  swift_beginAccess();
  sub_2607F4EBC(a2);
  swift_endAccess();
  return swift_release();
}

id sub_26084E670(uint64_t a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  swift_weakInit();
  sub_26084F7C0(a1, (uint64_t)v1 + OBJC_IVAR____TtC12UniversalHIDP33_77F0A1D2252CCF67CE1080DE620C755225HIDVirtualServiceDelegate_logger, (uint64_t *)&unk_26A8B50E0);
  v6.receiver = v1;
  v6.super_class = ObjectType;
  id v4 = objc_msgSendSuper2(&v6, sel_init);
  sub_26084FD20(a1, (uint64_t *)&unk_26A8B50E0);
  return v4;
}

uint64_t sub_26084E708(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    if (a2 == 0xD000000000000019 && a3 == 0x8000000260885440 || (sub_26087BBE0() & 1) != 0) {
      sub_26084D2F8();
    }
    HIDVirtualService.setProperty(_:forKey:)();
    char v7 = v6;
    swift_release();
    return v7 & 1;
  }
  return result;
}

double sub_26084E8B4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (swift_weakLoadStrong())
  {
    HIDVirtualService.property(forKey:)(a1, a2, a3);
    swift_release();
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

void sub_26084ECD4()
{
}

id sub_26084ED28()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_26084EDB4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = MEMORY[0x263F8EE88];
    goto LABEL_25;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B52E8);
  uint64_t result = sub_26087B7E0();
  uint64_t v3 = result;
  uint64_t v24 = *(void *)(a1 + 16);
  if (!v24)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    return v3;
  }
  unint64_t v4 = 0;
  uint64_t v5 = result + 56;
  while (v4 < *(void *)(a1 + 16))
  {
    char v6 = (uint64_t *)(a1 + 32 + 16 * v4);
    uint64_t v8 = *v6;
    uint64_t v7 = v6[1];
    sub_26087BCA0();
    swift_bridgeObjectRetain();
    sub_26087B300();
    uint64_t result = sub_26087BD00();
    uint64_t v9 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v10 = result & ~v9;
    unint64_t v11 = v10 >> 6;
    uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
    uint64_t v13 = 1 << v10;
    if (((1 << v10) & v12) != 0)
    {
      uint64_t v14 = *(void *)(v3 + 48);
      uint64_t v15 = (void *)(v14 + 16 * v10);
      BOOL v16 = *v15 == v8 && v15[1] == v7;
      if (v16 || (uint64_t result = sub_26087BBE0(), (result & 1) != 0))
      {
LABEL_11:
        uint64_t result = swift_bridgeObjectRelease();
        goto LABEL_22;
      }
      uint64_t v17 = ~v9;
      while (1)
      {
        unint64_t v10 = (v10 + 1) & v17;
        unint64_t v11 = v10 >> 6;
        uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
        uint64_t v13 = 1 << v10;
        if ((v12 & (1 << v10)) == 0) {
          break;
        }
        uint64_t v18 = (void *)(v14 + 16 * v10);
        if (*v18 != v8 || v18[1] != v7)
        {
          uint64_t result = sub_26087BBE0();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_11;
      }
    }
    *(void *)(v5 + 8 * v11) = v13 | v12;
    uint64_t v20 = (void *)(*(void *)(v3 + 48) + 16 * v10);
    *uint64_t v20 = v8;
    v20[1] = v7;
    uint64_t v21 = *(void *)(v3 + 16);
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_27;
    }
    *(void *)(v3 + 16) = v23;
LABEL_22:
    if (++v4 == v24) {
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

void sub_26084EF84(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (IOHIDEventGetType() == 17
    && sub_26084B9AC(*(void *)(a2 + 16), 5u, (void (*)(void))type metadata accessor for PointerGesture))
  {
    swift_beginAccess();
    IOHIDEventSetIntegerValue();
    id v4 = v3;
    id v5 = objc_msgSend(v4, sel_children);
    if (v5)
    {
      char v6 = v5;
      sub_26081221C(0, (unint64_t *)&qword_26A8B52D0);
      unint64_t v7 = sub_26087B3F0();

      uint64_t v8 = sub_26082DFC8(v7);
      swift_bridgeObjectRelease();
    }
    else
    {

      uint64_t v8 = MEMORY[0x263F8EE78];
    }
    uint64_t v11 = *(void *)(v8 + 16);
    if (v11)
    {
      uint64_t v12 = v8 + 32;
      swift_bridgeObjectRetain();
      while (1)
      {
        sub_26084FBB4(v12, (uint64_t)&v30);
        uint64_t v13 = v31;
        uint64_t v14 = v32;
        __swift_project_boxed_opaque_existential_1(&v30, v31);
        if ((*(unsigned int (**)(uint64_t, uint64_t))(v14 + 24))(v13, v14) == 17) {
          break;
        }
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v30);
        v12 += 40;
        if (!--v11)
        {
          swift_bridgeObjectRelease();
          goto LABEL_14;
        }
      }
      swift_bridgeObjectRelease();
      sub_2607E2B70(&v30, (uint64_t)&v27);
    }
    else
    {
LABEL_14:
      uint64_t v29 = 0;
      long long v27 = 0u;
      long long v28 = 0u;
    }
    swift_bridgeObjectRelease();
    if (*((void *)&v28 + 1))
    {
      sub_2607E2B70(&v27, (uint64_t)&v30);
      sub_26084FBB4((uint64_t)&v30, (uint64_t)&v27);
      uint64_t v15 = *((void *)&v28 + 1);
      uint64_t v16 = v29;
      uint64_t v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v27, *((uint64_t *)&v28 + 1));
      MEMORY[0x270FA5388](v17);
      uint64_t v19 = (char *)&v25 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v20 + 16))(v19);
      uint64_t v21 = (void *)sub_260830EA0((uint64_t)v19, v15, v16);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v27);
      if (v21)
      {
        IOHIDEventSetIntegerValue();
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v30);
    }
    else
    {
      sub_26084FD20((uint64_t)&v27, &qword_26A8B4600);
    }
    uint64_t v22 = *(void *)(a2 + 40);
    swift_getObjectType();
    uint64_t v23 = *(void (**)(void))(v22 + 80);
    id v24 = v4;
    v23();
    swift_release();
  }
  else
  {

    uint64_t v9 = *(void *)(a2 + 40);
    swift_getObjectType();
    unint64_t v10 = *(void (**)(void))(v9 + 80);
    id v26 = v3;
    v10();
  }
}

uint64_t sub_26084F334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a3 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](a1);
  unint64_t v10 = (char *)v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v41 - v11;
  uint64_t v13 = *(void (**)(char *))(v7 + 16);
  v13((char *)v41 - v11);
  ((void (*)(char *, char *, uint64_t))v13)(v10, v12, a3);
  uint64_t v14 = sub_260830EA0((uint64_t)v10, a3, a4);
  if (!v14) {
    goto LABEL_6;
  }
  uint64_t v15 = (void *)v14;
  uint64_t v16 = sub_26084B9AC(*(void *)(a2 + 16), 5u, (void (*)(void))type metadata accessor for PointerGesture);
  if (!v16)
  {

LABEL_6:
    uint64_t v24 = *(void *)(a2 + 40);
    uint64_t ObjectType = swift_getObjectType();
    id v26 = (id)(*(uint64_t (**)(uint64_t, uint64_t))(a4 + 352))(a3, a4);
    (*(void (**)(id, uint64_t, uint64_t))(v24 + 80))(v26, ObjectType, v24);
    goto LABEL_21;
  }
  uint64_t v17 = (uint64_t *)(v16 + OBJC_IVAR____TtC12UniversalHID14PointerGesture_buttonMask);
  swift_beginAccess();
  uint64_t v18 = *v17;
  IOHIDEventSetIntegerValue();
  id v19 = v15;
  id v20 = objc_msgSend(v19, sel_children);
  id v43 = v19;
  if (v20)
  {
    uint64_t v21 = v20;
    sub_26081221C(0, (unint64_t *)&qword_26A8B52D0);
    unint64_t v22 = sub_26087B3F0();

    uint64_t v23 = sub_26082DFC8(v22);
    swift_bridgeObjectRelease();
  }
  else
  {

    uint64_t v23 = MEMORY[0x263F8EE78];
  }
  uint64_t v27 = *(void *)(v23 + 16);
  if (v27)
  {
    v41[1] = v18;
    uint64_t v42 = v7;
    uint64_t v28 = v23 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_26084FBB4(v28, (uint64_t)&v47);
      uint64_t v30 = v48;
      uint64_t v29 = v49;
      __swift_project_boxed_opaque_existential_1(&v47, v48);
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v29 + 24))(v30, v29) == 17) {
        break;
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v47);
      v28 += 40;
      if (!--v27)
      {
        swift_bridgeObjectRelease();
        uint64_t v7 = v42;
        goto LABEL_13;
      }
    }
    swift_bridgeObjectRelease();
    sub_2607E2B70(&v47, (uint64_t)&v44);
    swift_bridgeObjectRelease();
    uint64_t v7 = v42;
  }
  else
  {
LABEL_13:
    uint64_t v46 = 0;
    long long v44 = 0u;
    long long v45 = 0u;
    swift_bridgeObjectRelease();
  }
  if (*((void *)&v45 + 1))
  {
    sub_2607E2B70(&v44, (uint64_t)&v47);
    sub_26084FBB4((uint64_t)&v47, (uint64_t)&v44);
    uint64_t v31 = *((void *)&v45 + 1);
    uint64_t v32 = v46;
    uint64_t v33 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v44, *((uint64_t *)&v45 + 1));
    MEMORY[0x270FA5388](v33);
    os_log_type_t v35 = (char *)v41 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v36 + 16))(v35);
    uint64_t v37 = (void *)sub_260830EA0((uint64_t)v35, v31, v32);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v44);
    if (v37)
    {
      IOHIDEventSetIntegerValue();
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v47);
  }
  else
  {
    sub_26084FD20((uint64_t)&v44, &qword_26A8B4600);
  }
  uint64_t v38 = *(void *)(a2 + 40);
  swift_getObjectType();
  os_log_t v39 = *(void (**)(void))(v38 + 80);
  id v26 = v43;
  v39();
  swift_release();

LABEL_21:
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, a3);
}

uint64_t sub_26084F7C0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_5_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_26084F820()
{
  return type metadata accessor for HIDVirtualService(0);
}

uint64_t type metadata accessor for HIDVirtualService(uint64_t a1)
{
  return sub_2608116E0(a1, (uint64_t *)&unk_26A8B51A0);
}

void sub_26084F848()
{
  sub_260811808();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for HIDVirtualService(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HIDVirtualService);
}

uint64_t sub_26084F954()
{
  return type metadata accessor for HIDVirtualServiceDelegate(0);
}

uint64_t type metadata accessor for HIDVirtualServiceDelegate(uint64_t a1)
{
  return sub_2608116E0(a1, (uint64_t *)&unk_26A8B5230);
}

void sub_26084F97C()
{
  sub_260811808();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void *initializeBufferWithCopyOfBuffer for HIDVirtualService.State(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for HIDVirtualService.State()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for HIDVirtualService.State(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void *assignWithTake for HIDVirtualService.State(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HIDVirtualService.State(uint64_t *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for HIDVirtualService.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = 0;
    *(_DWORD *)uint64_t result = a2 - 0x7FFFFFFF;
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
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

uint64_t sub_26084FB6C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_26084FB84(void *result, int a2)
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
  *uint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for HIDVirtualService.State()
{
  return &type metadata for HIDVirtualService.State;
}

uint64_t sub_26084FBB4(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_5_0();
  (*v3)(a2);
  return a2;
}

uint64_t sub_26084FC14()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 28, 7);
}

uint64_t sub_26084FC4C()
{
  return sub_26084E5B8(*(void *)(v0 + 16), *(_DWORD *)(v0 + 24));
}

uint64_t sub_26084FC58()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_26084FCA8()
{
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_26084FCE0()
{
  return sub_26084E590();
}

uint64_t sub_26084FCE8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_26084FD20(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_5_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t OUTLINED_FUNCTION_1_33()
{
  return swift_allocObject();
}

id OUTLINED_FUNCTION_2_34(uint64_t a1)
{
  return objc_msgSend(v1, (SEL)(v2 + 1221), v3, a1);
}

uint64_t OUTLINED_FUNCTION_9_20()
{
  return sub_26087B650();
}

void OUTLINED_FUNCTION_10_17(uint64_t a1@<X8>)
{
  *(void *)(v2 - 160) = a1;
  *(void *)(v2 - 152) = (v1 - 32) | 0x8000000000000000;
}

uint64_t OUTLINED_FUNCTION_13_11()
{
  return sub_26087B630();
}

uint64_t OUTLINED_FUNCTION_15_12()
{
  return swift_allocObject();
}

uint64_t AbsolutePointerGesture.__allocating_init(logger:pointerGesture:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  AbsolutePointerGesture.init(logger:pointerGesture:)(a1, a2);
  return v4;
}

uint64_t AbsolutePointerGesture.buttonMask.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC12UniversalHID22AbsolutePointerGesture_buttonMask;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t AbsolutePointerGesture.init(logger:pointerGesture:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + OBJC_IVAR____TtC12UniversalHID22AbsolutePointerGesture_buttonMask) = 0;
  *(unsigned char *)(v2 + OBJC_IVAR____TtC12UniversalHID22AbsolutePointerGesture_keyboardModifiers) = 0;
  *(void *)(v2 + OBJC_IVAR____TtC12UniversalHID22AbsolutePointerGesture_x) = 0;
  *(void *)(v2 + OBJC_IVAR____TtC12UniversalHID22AbsolutePointerGesture_y) = 0;
  sub_26081AFDC(a1, v2 + OBJC_IVAR____TtC12UniversalHID22AbsolutePointerGesture_logger);
  *(void *)(v2 + OBJC_IVAR____TtC12UniversalHID22AbsolutePointerGesture_pointerGesture) = a2;
  return v2;
}

#error "26084FFB8: call analysis failed (funcsize=167)"

uint64_t AbsolutePointerGesture.deinit()
{
  sub_26081B044(v0 + OBJC_IVAR____TtC12UniversalHID22AbsolutePointerGesture_logger);
  swift_release();
  return v0;
}

uint64_t AbsolutePointerGesture.__deallocating_deinit()
{
  sub_26081B044(v0 + OBJC_IVAR____TtC12UniversalHID22AbsolutePointerGesture_logger);
  swift_release();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

_UNKNOWN **sub_2608502BC()
{
  return &protocol witness table for AbsolutePointerReport;
}

_UNKNOWN **sub_2608502C8()
{
  return &protocol witness table for AbsolutePointerReport;
}

uint64_t sub_2608502D4(void *a1)
{
  return AbsolutePointerGesture.dispatch(report:)(*a1, a1[1]);
}

uint64_t sub_260850300()
{
  return type metadata accessor for AbsolutePointerGesture();
}

uint64_t type metadata accessor for AbsolutePointerGesture()
{
  uint64_t result = qword_26A8B53E8;
  if (!qword_26A8B53E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_260850350()
{
  sub_260811808();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for AbsolutePointerGesture(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AbsolutePointerGesture);
}

uint64_t dispatch thunk of AbsolutePointerGesture.__allocating_init(logger:pointerGesture:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

void OUTLINED_FUNCTION_0_33(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,__int16 a29,char a30,char a31,char a32,char a33,char a34,char a35,char a36,char a37,char a38,char a39,char a40,char a41,char a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57)
{
  _s12UniversalHID9HIDReportV_2ass5Int32VSi_AFmtcig_0(a1, v58, v57, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32,
    a33,
    a34,
    a35,
    a36,
    a37,
    a38,
    a39,
    a40,
    a41,
    a42,
    a43,
    a44,
    a45,
    a46,
    a47,
    a48,
    a49,
    a50,
    a51,
    a52,
    a53,
    a54,
    a55,
    a56,
    a57);
}

unint64_t OUTLINED_FUNCTION_2_35()
{
  return _s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcig_0();
}

double OUTLINED_FUNCTION_3_28(double a1, double a2)
{
  return vabdd_f64(a1, a2);
}

id sub_26085047C(int a1, uint64_t a2, uint64_t a3)
{
  return sub_260850664(a1, a2, a3);
}

id sub_260850488(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v10 = MEMORY[0x263F8D310];
  uint64_t v25 = sub_26087B200();
  if (a5)
  {
    uint64_t v11 = sub_26087B2B0();
    uint64_t v24 = v10;
    v23[0] = a4;
    v23[1] = a5;
    sub_26084B2F0((uint64_t)v23, v11, v12);
  }
  if (a6)
  {
    uint64_t v13 = sub_26087B2B0();
    uint64_t v15 = v14;
    swift_getErrorValue();
    uint64_t v24 = v22;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v23);
    (*(void (**)(uint64_t *))(*(void *)(v22 - 8) + 16))(boxed_opaque_existential_1);
    sub_26084B2F0((uint64_t)v23, v13, v15);
  }
  id v17 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v18 = (void *)sub_26087B2A0();
  swift_bridgeObjectRelease();
  id v19 = (void *)sub_26087B1D0();
  swift_bridgeObjectRelease();
  id v20 = objc_msgSend(v17, sel_initWithDomain_code_userInfo_, v18, a3, v19);

  return v20;
}

id sub_260850658(int a1, uint64_t a2, uint64_t a3)
{
  return sub_260850664(a1, a2, a3);
}

id sub_260850664(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_26087B2B0();
  return sub_260850488(v6, v7, a1, a2, a3, 0);
}

Swift::Double __swiftcall HIDReport.resolution(logicalMinimum:logicalMaximum:physicalMinimum:physicalMaximum:exponent:)(Swift::Double logicalMinimum, Swift::Double logicalMaximum, Swift::Double_optional physicalMinimum, Swift::Double_optional physicalMaximum, Swift::Double_optional exponent)
{
  double v10 = logicalMaximum;
  double v11 = logicalMinimum;
  if (((*(_DWORD *)&physicalMaximum.is_nil | v5) & 1) == 0)
  {
    double v11 = *(double *)&physicalMinimum.is_nil;
    if (*(double *)&physicalMinimum.is_nil == 0.0)
    {
      if ((*(void *)&exponent.is_nil & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        double v10 = *(double *)&exponent.is_nil;
      }
      else {
        double v10 = logicalMaximum;
      }
      if ((*(void *)&exponent.is_nil & 0x7FFFFFFFFFFFFFFFLL) == 0) {
        double v11 = logicalMinimum;
      }
    }
    else
    {
      double v10 = *(double *)&exponent.is_nil;
    }
  }
  double v12 = 1.0;
  if ((v7 & 1) == 0 && v6 != 0.0) {
    double v12 = __exp10(v6);
  }
  return (logicalMaximum - logicalMinimum) / ((v10 - v11) * v12);
}

uint64_t HIDReport.loadValue<A>(from:at:)@<X0>(uint64_t a1@<X1>, unint64_t a2@<X2>, unint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v68 = a1;
  uint64_t v70 = a6;
  uint64_t v80 = *MEMORY[0x263EF8340];
  uint64_t v9 = *(void *)(a5 + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  OUTLINED_FUNCTION_0_0();
  uint64_t v72 = v11;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  v69 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v67 = (char *)&v45 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v66 = (char *)&v45 - v18;
  MEMORY[0x270FA5388](v17);
  id v20 = (char *)&v45 - v19;
  swift_getAssociatedConformanceWitness();
  sub_26087BBF0();
  sub_26087BBC0();
  uint64_t v21 = sub_26087B910();
  if (v21 < -7) {
    goto LABEL_32;
  }
  uint64_t v71 = v9;
  if ((unint64_t)(v21 + 7) >= 0xF)
  {
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = (int)a2;
    uint64_t v27 = a3 & 0x3FFFFFFFFFFFFFFFLL;
    uint64_t v58 = (uint64_t)a2 >> 32;
    uint64_t v57 = BYTE6(a3);
    v65 = (void (**)(char *, uint64_t))(v72 + 8);
    unint64_t v56 = a2 >> 8;
    unint64_t v55 = a2 >> 16;
    unint64_t v54 = a2 >> 24;
    unint64_t v53 = HIDWORD(a2);
    unint64_t v52 = a2 >> 40;
    unint64_t v51 = HIWORD(a2);
    unint64_t v50 = HIBYTE(a2);
    unint64_t v49 = a3 >> 8;
    unint64_t v48 = a3 >> 16;
    unint64_t v47 = a3 >> 24;
    unint64_t v46 = HIDWORD(a3);
    unint64_t v45 = a3 >> 40;
    unint64_t v28 = a3 >> 62;
    uint64_t v29 = v21 / 8;
    while (2)
    {
      uint64_t v30 = 0;
      uint64_t v31 = v26;
      switch(v28)
      {
        case 1uLL:
          goto LABEL_12;
        case 2uLL:
          uint64_t v31 = *(void *)(a2 + 16);
LABEL_12:
          if ((unint64_t)(v31 - 0x1000000000000000) >> 61 == 7)
          {
            uint64_t v30 = 8 * v31;
LABEL_6:
            uint64_t v32 = v68 + v25;
            if (!__OFADD__(v68, v25))
            {
              uint64_t v33 = v30 + v32;
              if (!__OFADD__(v30, v32))
              {
                v63 = v20;
                uint64_t v64 = v26;
                unint64_t v61 = v28;
                uint64_t v62 = v27;
                uint64_t v59 = v25 + 1;
                uint64_t v60 = v29;
                switch(v28)
                {
                  case 1uLL:
                    if (v33 < v26 || v33 >= v58) {
                      goto LABEL_38;
                    }
                    uint64_t v40 = sub_26087AED0();
                    if (!v40)
                    {
LABEL_43:
                      __break(1u);
LABEL_44:
                      __break(1u);
                      JUMPOUT(0x260850D88);
                    }
                    uint64_t v36 = v40;
                    uint64_t v41 = sub_26087AEF0();
                    uint64_t v38 = v33 - v41;
                    if (!__OFSUB__(v33, v41)) {
                      goto LABEL_27;
                    }
                    goto LABEL_40;
                  case 2uLL:
                    if (v33 < *(void *)(a2 + 16)) {
                      goto LABEL_37;
                    }
                    if (v33 >= *(void *)(a2 + 24)) {
                      goto LABEL_39;
                    }
                    uint64_t v35 = sub_26087AED0();
                    if (!v35) {
                      goto LABEL_44;
                    }
                    uint64_t v36 = v35;
                    uint64_t v37 = sub_26087AEF0();
                    uint64_t v38 = v33 - v37;
                    if (__OFSUB__(v33, v37)) {
                      goto LABEL_41;
                    }
LABEL_27:
                    char v34 = *(unsigned char *)(v36 + v38);
LABEL_28:
                    uint64_t v42 = v67;
                    LOBYTE(v73) = v34;
                    sub_26081D8D8();
                    sub_26087B720();
                    if (v25 == 0x1000000000000000) {
                      goto LABEL_35;
                    }
                    uint64_t v73 = v24;
                    sub_2607DDC34();
                    id v43 = v66;
                    sub_26087B6B0();
                    long long v44 = *v65;
                    (*v65)(v42, a4);
                    id v20 = v63;
                    sub_26087B6C0();
                    v44(v43, a4);
                    v24 += 8;
                    uint64_t v29 = v60;
                    uint64_t v25 = v59;
                    uint64_t v26 = v64;
                    unint64_t v28 = v61;
                    uint64_t v27 = v62;
                    if (v60 == v59) {
                      goto LABEL_3;
                    }
                    continue;
                  case 3uLL:
                    __break(1u);
                    goto LABEL_43;
                  default:
                    if (v33 >= v57) {
                      goto LABEL_36;
                    }
                    LOBYTE(v73) = v26;
                    BYTE1(v73) = v56;
                    BYTE2(v73) = v55;
                    BYTE3(v73) = v54;
                    BYTE4(v73) = v53;
                    BYTE5(v73) = v52;
                    BYTE6(v73) = v51;
                    HIBYTE(v73) = v50;
                    char v74 = a3;
                    char v75 = v49;
                    char v76 = v48;
                    char v77 = v47;
                    char v78 = v46;
                    char v79 = v45;
                    char v34 = *((unsigned char *)&v73 + v33);
                    goto LABEL_28;
                }
              }
LABEL_34:
              __break(1u);
LABEL_35:
              __break(1u);
LABEL_36:
              __break(1u);
LABEL_37:
              __break(1u);
LABEL_38:
              __break(1u);
LABEL_39:
              __break(1u);
LABEL_40:
              __break(1u);
LABEL_41:
              __break(1u);
            }
LABEL_33:
            __break(1u);
            goto LABEL_34;
          }
          __break(1u);
          break;
        default:
          goto LABEL_6;
      }
      break;
    }
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
LABEL_3:
  uint64_t v22 = v72;
  (*(void (**)(char *, char *, uint64_t))(v72 + 16))(v69, v20, a4);
  sub_26087B720();
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v20, a4);
}

uint64_t HIDReport.loadValue<A>(from:at:logicalMinimum:logicalMaximum:physicalMinimum:physicalMaximum:exponent:)(double a1, double a2, double a3, double a4, double a5)
{
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_9_0();
  HIDReport.loadValue<A>(from:at:)(v13, v14, v15, v16, v17, v12 - v11);
  OUTLINED_FUNCTION_3_29();
  if (sub_26087B6F0() < 65)
  {
    OUTLINED_FUNCTION_3_29();
    char v21 = sub_26087B700();
    OUTLINED_FUNCTION_3_29();
    uint64_t v22 = sub_26087B6E0();
    uint64_t v23 = OUTLINED_FUNCTION_1_34();
    v24(v23);
    if (v21) {
      double v20 = (double)v22;
    }
    else {
      double v20 = (double)(unint64_t)v22;
    }
  }
  else
  {
    sub_2607E4518();
    sub_2607E4564();
    sub_26087B1C0();
    uint64_t v18 = OUTLINED_FUNCTION_1_34();
    v19(v18);
    double v20 = v28;
  }
  if (a3 == 0.0 && a4 == 0.0)
  {
    a4 = a2;
    a3 = a1;
  }
  double v25 = 1.0;
  if (a5 != 0.0) {
    double v25 = __exp10(a5);
  }
  if (v20 > a2 || v20 < a1) {
    *(double *)&uint64_t result = 0.0;
  }
  else {
    *(double *)&uint64_t result = v20 / ((a2 - a1) / ((a4 - a3) * v25));
  }
  return result;
}

uint64_t HIDReport.loadValue<A>(from:at:logicalMinimum:logicalMaximum:)(double a1, double a2)
{
  return sub_260850F60(a1, a2, -1.0);
}

{
  return sub_260850F60(a1, a2, 0.0);
}

uint64_t sub_260850F60(double a1, double a2, double a3)
{
  return HIDReport.loadValue<A>(from:at:logicalMinimum:logicalMaximum:physicalMinimum:physicalMaximum:exponent:)(a1, a2, a3, 1.0, 0.0);
}

uint64_t HIDReport.storeValue<A>(_:to:at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  OUTLINED_FUNCTION_0_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_9_0();
  uint64_t v12 = v11 - v10;
  uint64_t result = sub_26087B910();
  if (result < -7)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    JUMPOUT(0x260851188);
  }
  if ((unint64_t)(result + 7) >= 0xF)
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = result / 8;
    while (1)
    {
      uint64_t v17 = v15 + 1;
      uint64_t v18 = *v4;
      uint64_t v19 = 0;
      switch((unint64_t)v4[1] >> 62)
      {
        case 1uLL:
          uint64_t v20 = (int)v18;
          goto LABEL_12;
        case 2uLL:
          uint64_t v20 = *(void *)(v18 + 16);
LABEL_12:
          if ((unint64_t)(v20 - 0x1000000000000000) >> 61 != 7)
          {
            __break(1u);
            goto LABEL_15;
          }
          uint64_t v19 = 8 * v20;
LABEL_5:
          if (__OFADD__(a3, v15)) {
            goto LABEL_16;
          }
          if (__OFADD__(v19, a3 + v15)) {
            goto LABEL_17;
          }
          if (v15 == 0x1000000000000000) {
            goto LABEL_18;
          }
          uint64_t v21 = v16;
          sub_2607DDC34();
          sub_26087B6A0();
          sub_26087B6E0();
          (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v12, a4);
          uint64_t result = sub_26087AFD0();
          uint64_t v16 = v21;
          v14 += 8;
          uint64_t v15 = v17;
          if (v21 == v17) {
            return result;
          }
          break;
        default:
          goto LABEL_5;
      }
    }
  }
  return result;
}

uint64_t HIDReport.storeValue<A>(_:to:at:logicalMinimum:logicalMaximum:physicalMinimum:physicalMaximum:exponent:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  OUTLINED_FUNCTION_0_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_9_0();
  uint64_t v14 = v13 - v12;
  if ((v15 & 1) == 0 && (~v10 & 0x7FF0000000000000) != 0)
  {
    if (v11 != 0.0) {
      __exp10(v11);
    }
    sub_2607E4518();
    sub_26087B710();
  }
  else
  {
    uint64_t v16 = OUTLINED_FUNCTION_3_29();
    sub_260851318(v16, v17, v18);
  }
  HIDReport.storeValue<A>(_:to:at:)(v14, v19, a4, a5);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v14, a5);
}

uint64_t sub_260851318@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D1>)
{
  v16[1] = a2;
  uint64_t v5 = *(void *)(a1 - 8);
  uint64_t v6 = ((uint64_t (*)(uint64_t))MEMORY[0x270FA5388])(a1);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v9 = MEMORY[0x270FA5388](v6);
  double v11 = (char *)v16 - v10;
  double v17 = v9;
  sub_2607E4518();
  sub_26087B710();
  sub_26087B940();
  char v12 = sub_26087B240();
  uint64_t v13 = *(void (**)(char *, uint64_t))(v5 + 8);
  v13(v8, a1);
  v13(v11, a1);
  if (v12) {
    return sub_26087B940();
  }
  double v17 = a3;
  sub_26087B710();
  sub_26087B930();
  char v15 = sub_26087B250();
  v13(v8, a1);
  v13(v11, a1);
  if (v15) {
    return sub_26087B930();
  }
  double v17 = 0.0;
  unint64_t v18 = 0xE000000000000000;
  sub_26087B7F0();
  sub_26087B330();
  sub_26087B480();
  sub_26087B330();
  sub_26087B480();
  uint64_t result = sub_26087B990();
  __break(1u);
  return result;
}

uint64_t HIDReport.storeValue<A>(_:to:at:logicalMinimum:logicalMaximum:)(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_260851600(a1, a2, a3, a4, a5);
}

{
  return sub_260851600(a1, a2, a3, a4, a5);
}

uint64_t sub_260851600(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return HIDReport.storeValue<A>(_:to:at:logicalMinimum:logicalMaximum:physicalMinimum:physicalMaximum:exponent:)(a1, a2 & 1, a3, a4, a5);
}

uint64_t OUTLINED_FUNCTION_1_34()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_29()
{
  return v0;
}

uint64_t PointerFilter.debugState.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B4C70);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_26087C870;
  *(void *)(inited + 32) = 0x7265746E696F50;
  *(void *)(inited + 40) = 0xE700000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B53F8);
  uint64_t v1 = swift_initStackObject();
  *(_OWORD *)(v1 + 16) = xmmword_260880810;
  *(void *)(v1 + 32) = 0x614D6E6F74747542;
  *(void *)(v1 + 40) = 0xEA00000000006B73;
  *(void *)(v1 + 48) = sub_26087B640();
  strcpy((char *)(v1 + 56), "DeadButtonMask");
  *(unsigned char *)(v1 + 71) = -18;
  *(void *)(v1 + 72) = sub_26087B640();
  *(void *)(v1 + 80) = 0xD000000000000010;
  *(void *)(v1 + 88) = 0x80000002608855B0;
  *(void *)(v1 + 96) = sub_26087B640();
  sub_26081221C(0, &qword_26A8B5400);
  uint64_t v2 = sub_26087B200();
  *(void *)(inited + 72) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B5408);
  *(void *)(inited + 48) = v2;
  return sub_26087B200();
}

uint64_t PointerFilter.eventMask.getter()
{
  if (dword_270C9E570 >= 0x41) {
    return 0;
  }
  int v1 = dword_270C9E570 & 0x3F;
  if (dword_270C9E570 != 64 && v1 == 63) {
    goto LABEL_9;
  }
  if (dword_270C9E570 == 64) {
    return 0;
  }
  if (v1 != 63) {
    return 1 << v1;
  }
LABEL_9:
  OUTLINED_FUNCTION_27();
  uint64_t result = sub_26087B980();
  __break(1u);
  return result;
}

uint64_t PointerFilter.__allocating_init(logger:service:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  PointerFilter.init(logger:service:)(a1, a2, a3);
  return v6;
}

void *PointerFilter.init(logger:service:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[2] = 0;
  v3[3] = 0;
  v3[4] = 0;
  uint64_t v6 = OBJC_IVAR____TtC12UniversalHID13PointerFilter_copyMask;
  uint64_t v7 = MEMORY[0x263F8EE78];
  *(void *)((char *)v3 + v6) = sub_2607E2554(MEMORY[0x263F8EE78]);
  uint64_t v8 = OBJC_IVAR____TtC12UniversalHID13PointerFilter_filterMask;
  *(void *)((char *)v3 + v8) = sub_2607E2554(v7);
  double v9 = (char *)v3 + OBJC_IVAR____TtC12UniversalHID13PointerFilter_logger;
  uint64_t v10 = sub_26087B120();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v9, a1, v10);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(ObjectType, a3);
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
  *(void *)((char *)v3 + OBJC_IVAR____TtC12UniversalHID13PointerFilter_serviceID) = v13;
  return v3;
}

BOOL sub_2608519D8()
{
  IOHIDEventGetFloatValue();
  if (v1 != 0.0) {
    return 1;
  }
  IOHIDEventGetFloatValue();
  if (v2 != 0.0 || IOHIDEventIsAbsolute()) {
    return 1;
  }
  uint64_t v4 = *(void *)(v0 + 16);
  return (IOHIDEventGetIntegerValue() & ~v4) != 0;
}

#error "26085203C: call analysis failed (funcsize=450)"

uint64_t sub_260852254(uint64_t a1, uint64_t a2)
{
  uint64_t result = IOHIDEventGetIntegerValue();
  if (result && (result & a2) == 0)
  {
    IOHIDEventSetIntegerValue();
    return IOHIDEventSetFloatValue();
  }
  return result;
}

uint64_t sub_2608522CC(uint64_t a1, unint64_t a2)
{
  uint64_t result = IOHIDEventGetIntegerValue();
  if ((result & a2) != result)
  {
    if ((result & a2) - 0xFFFFFFFF < 0xFFFFFFFF00000002)
    {
      __break(1u);
    }
    else
    {
      return IOHIDEventSetIntegerValue();
    }
  }
  return result;
}

BOOL PointerFilter.filterEvent(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  sub_2607E2A1C(a2, (uint64_t)v45);
  uint64_t v6 = v46;
  uint64_t v7 = v47;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v45, v46);
  OUTLINED_FUNCTION_0_34();
  double v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v12 + 16))(v11, v9);
  uint64_t v13 = (void *)sub_260830EA0((uint64_t)v11, v6, v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
  if (v13)
  {
    uint64_t v14 = *(void *)(v3 + 16);
    uint64_t IntegerValue = IOHIDEventGetIntegerValue();
    if (v14 != IntegerValue) {
      *(void *)(v3 + 16) = IntegerValue;
    }
    if ((*(unsigned char *)(v3 + OBJC_IVAR____TtC12UniversalHID13PointerFilter_filterMask + 2) & 2) != 0)
    {
      *(void *)(a1 + 32) = 0;
      *(_OWORD *)a1 = 0u;
      *(_OWORD *)(a1 + 16) = 0u;
    }
    else
    {
      uint64_t v16 = *(void *)(v3 + 24);
      if (v16)
      {
        uint64_t v41 = a1;
        uint64_t v17 = *(void *)(v3 + 16) & v16;
        if (v16 != v17) {
          *(void *)(v3 + 24) = v17;
        }
        unint64_t v18 = ~v16;
        sub_260852254((uint64_t)v13, ~v16);
        id v19 = v13;
        id v20 = objc_msgSend(v19, sel_children);
        if (v20)
        {
          uint64_t v21 = v20;
          sub_26081221C(0, (unint64_t *)&qword_26A8B52D0);
          unint64_t v22 = sub_26087B3F0();

          uint64_t v23 = sub_26082DFC8(v22);
          swift_bridgeObjectRelease();
        }
        else
        {

          uint64_t v23 = MEMORY[0x263F8EE78];
        }
        uint64_t v25 = *(void *)(v23 + 16);
        if (v25)
        {
          uint64_t v40 = v23;
          uint64_t v26 = v23 + 32;
          do
          {
            sub_2607E2A1C(v26, (uint64_t)v45);
            sub_2607E2A1C((uint64_t)v45, (uint64_t)v42);
            uint64_t v27 = v43;
            uint64_t v28 = v44;
            __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v42, v43);
            OUTLINED_FUNCTION_0_34();
            double v30 = MEMORY[0x270FA5388](v29);
            uint64_t v32 = (char *)&v40 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
            (*(void (**)(char *, double))(v33 + 16))(v32, v30);
            char v34 = (void *)sub_260830EA0((uint64_t)v32, v27, v28);
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
            if (v34)
            {
              sub_260852254((uint64_t)v34, v18);
            }
            else
            {
              sub_2607E2A1C((uint64_t)v45, (uint64_t)v42);
              __swift_project_boxed_opaque_existential_1(v42, v43);
              uint64_t v35 = OUTLINED_FUNCTION_8_22();
              if (v36(v35) != 2)
              {
                __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
                goto LABEL_20;
              }
              __swift_project_boxed_opaque_existential_1(v42, v43);
              uint64_t v37 = OUTLINED_FUNCTION_8_22();
              char v34 = (void *)v38(v37);
              __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
              sub_2608522CC((uint64_t)v34, v18);
            }

LABEL_20:
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
            v26 += 40;
            --v25;
          }
          while (v25);
        }
        swift_bridgeObjectRelease();
        a1 = v41;
      }
      sub_2607E2A1C(a2, a1);
    }
    BOOL v24 = sub_2608519D8();
    if ((*(unsigned char *)(v3 + OBJC_IVAR____TtC12UniversalHID13PointerFilter_copyMask + 2) & 2) != 0) {
      sub_260851A5C(v13, *(void *)(v3 + 16));
    }
  }
  else
  {
    sub_2607E2A1C(a2, a1);
    return 0;
  }
  return v24;
}

double PointerFilter.updateCopyMask(oldValue:newValue:)(int a1, uint64_t a2)
{
  *(void *)(v2 + OBJC_IVAR____TtC12UniversalHID13PointerFilter_copyMask) = a2;
  if ((a1 & 0x20000) == 0 && (a2 & 0x20000) != 0 && *(void *)(v2 + 16))
  {
    if (qword_26A8B4580 != -1) {
LABEL_11:
    }
      swift_once();
    uint64_t v3 = HIDReportDescriptor.reportBitCount(for:)(5u);
    *(void *)&long long v10 = HIDReport.init(bitCount:id:)(v3, 5);
    *((void *)&v10 + 1) = v4;
    uint64_t v5 = 0;
    switch(v4 >> 62)
    {
      case 1uLL:
      case 2uLL:
        OUTLINED_FUNCTION_2_1();
        if (v9) {
          goto LABEL_13;
        }
        __break(1u);
        goto LABEL_11;
      default:
        while (1)
        {
          uint64_t v6 = v5 + 88;
          if (!__OFADD__(v5, 88)) {
            break;
          }
          __break(1u);
LABEL_13:
          uint64_t v5 = 8 * v6;
        }
        sub_26087AFD0();
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B4720);
        uint64_t v7 = swift_allocObject();
        *(void *)&double result = 1;
        *(_OWORD *)(v7 + 16) = xmmword_26087C870;
        *(_OWORD *)(v7 + 32) = v10;
        break;
    }
  }
  return result;
}

uint64_t PointerFilter.updateFilterMask(oldValue:newValue:)(int a1, uint64_t a2)
{
  *(void *)((char *)v2 + OBJC_IVAR____TtC12UniversalHID13PointerFilter_filterMask) = a2;
  if ((a1 & 0x20000) == 0)
  {
    if ((a2 & 0x20000) != 0) {
      v2[4] = v2[2];
    }
    return MEMORY[0x263F8EE78];
  }
  if ((a2 & 0x20000) != 0) {
    return MEMORY[0x263F8EE78];
  }
  unint64_t v3 = v2[4];
  uint64_t v4 = v2[2];
  v2[3] = v4 & ~v3;
  v2[4] = 0;
  if ((v3 & ~v4) == 0) {
    return MEMORY[0x263F8EE78];
  }
  unint64_t v5 = v4 & v3;
  uint64_t v6 = mach_absolute_time();
  uint64_t v7 = PointerEvent.init(time:point:buttonMask:oldButtonMask:flags:)(v6, v5, v3);
  if (!HIDWORD(v5))
  {
    uint64_t v8 = v7;
    ButtonEventWithPressure = (void *)IOHIDEventCreateButtonEventWithPressure();
    IOHIDEventAppendEvent();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B4DB8);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_260881C10;
    *(void *)(v10 + 32) = v8;
    uint64_t v13 = v10;
    sub_26087B400();
    uint64_t v11 = v13;

    return v11;
  }
  OUTLINED_FUNCTION_27();
  uint64_t result = sub_26087B980();
  __break(1u);
  return result;
}

uint64_t PointerFilter.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC12UniversalHID13PointerFilter_logger;
  sub_26087B120();
  OUTLINED_FUNCTION_3_8();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  return v0;
}

uint64_t PointerFilter.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC12UniversalHID13PointerFilter_logger;
  sub_26087B120();
  OUTLINED_FUNCTION_3_8();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_260852AA0()
{
  return PointerFilter.eventMask.getter();
}

BOOL sub_260852AB8(uint64_t a1, uint64_t a2)
{
  return PointerFilter.filterEvent(_:)(a1, a2);
}

uint64_t sub_260852AE0()
{
  return PointerFilter.debugState.getter();
}

double sub_260852B04(int a1, uint64_t a2)
{
  return PointerFilter.updateCopyMask(oldValue:newValue:)(a1, a2);
}

uint64_t sub_260852B28(int a1, uint64_t a2)
{
  return PointerFilter.updateFilterMask(oldValue:newValue:)(a1, a2);
}

uint64_t sub_260852B4C()
{
  return type metadata accessor for PointerFilter();
}

uint64_t type metadata accessor for PointerFilter()
{
  uint64_t result = qword_26A8B5430;
  if (!qword_26A8B5430) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_260852B9C()
{
  uint64_t result = sub_26087B120();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for PointerFilter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PointerFilter);
}

uint64_t dispatch thunk of PointerFilter.__allocating_init(logger:service:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t OUTLINED_FUNCTION_5_18()
{
  return sub_26087AFD0();
}

uint64_t OUTLINED_FUNCTION_8_22()
{
  return v0;
}

uint64_t NavigationSwipeGesture.__allocating_init(platform:)(unsigned char *a1)
{
  uint64_t result = swift_allocObject();
  *(unsigned char *)(result + 16) = *a1;
  return result;
}

uint64_t static NavigationSwipeEvent.dispatch(report:platform:)(uint64_t a1, uint64_t a2, char *a3)
{
  char v5 = *a3;
  type metadata accessor for NavigationSwipeGesture();
  *(unsigned char *)(swift_initStackObject() + 16) = v5;
  return NavigationSwipeGesture.dispatch(report:)(a1, a2);
}

#error "260852E84: call analysis failed (funcsize=176)"

void NavigationSwipeGesture.platform.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

uint64_t NavigationSwipeGesture.init(platform:)(unsigned char *a1)
{
  *(unsigned char *)(v1 + 16) = *a1;
  return v1;
}

uint64_t type metadata accessor for NavigationSwipeGesture()
{
  return self;
}

uint64_t NavigationSwipeGesture.deinit()
{
  return v0;
}

uint64_t NavigationSwipeGesture.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 17, 7);
}

uint64_t sub_260853080(void *a1)
{
  return NavigationSwipeGesture.dispatch(report:)(*a1, a1[1]);
}

_UNKNOWN **sub_2608530AC()
{
  return &protocol witness table for NavigationSwipeReport;
}

_UNKNOWN **sub_2608530B8()
{
  return &protocol witness table for NavigationSwipeReport;
}

uint64_t method lookup function for NavigationSwipeGesture(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for NavigationSwipeGesture);
}

uint64_t dispatch thunk of NavigationSwipeGesture.__allocating_init(platform:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

void OUTLINED_FUNCTION_2_36(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,__int16 a29,char a30,char a31,char a32,char a33,char a34,char a35,char a36,char a37,char a38,char a39,char a40,char a41,char a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57)
{
  _s12UniversalHID9HIDReportV_2ass5Int32VSi_AFmtcig_0(a1, v58, v57, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32,
    a33,
    a34,
    a35,
    a36,
    a37,
    a38,
    a39,
    a40,
    a41,
    a42,
    a43,
    a44,
    a45,
    a46,
    a47,
    a48,
    a49,
    a50,
    a51,
    a52,
    a53,
    a54,
    a55,
    a56,
    a57);
}

uint64_t sub_26085310C()
{
  return sub_26087BD00();
}

uint64_t sub_26085315C()
{
  return sub_26087BD00();
}

uint64_t sub_260853198()
{
  return sub_26087BD00();
}

uint64_t sub_2608531D8()
{
  return sub_26087BD00();
}

uint64_t sub_260853210()
{
  return sub_26087BD00();
}

uint64_t sub_260853254()
{
  return sub_26087BD00();
}

uint64_t sub_2608532AC()
{
  return sub_26087BD00();
}

uint64_t sub_2608532EC()
{
  return OUTLINED_FUNCTION_99_0();
}

uint64_t sub_26085330C()
{
  return sub_26087BCC0();
}

uint64_t sub_260853338()
{
  swift_bridgeObjectRetain();
  sub_26087B300();
  return swift_bridgeObjectRelease();
}

uint64_t sub_260853394()
{
  return sub_26087BCC0();
}

uint64_t sub_2608533C8()
{
  return sub_26087BCE0();
}

uint64_t sub_2608533F0()
{
  return sub_26087BCD0();
}

uint64_t sub_260853420()
{
  return sub_26087BD00();
}

uint64_t sub_260853464()
{
  return sub_26087BD00();
}

uint64_t sub_2608534A8()
{
  return sub_26087BD00();
}

uint64_t sub_2608534EC()
{
  return sub_26087BD00();
}

uint64_t sub_260853540()
{
  return sub_26087BD00();
}

uint64_t sub_2608535A0()
{
  return sub_26087BD00();
}

uint64_t sub_2608535DC()
{
  return sub_26087BD00();
}

uint64_t sub_260853618(char a1, uint64_t a2, uint64_t a3)
{
  return sub_260853774(a1, a2, a3, (uint64_t)sub_26082424C, (uint64_t (*)(uint64_t, void *, uint64_t, uint64_t))sub_260823248);
}

uint64_t sub_260853644(char a1, uint64_t a2, uint64_t a3)
{
  return sub_260853774(a1, a2, a3, (uint64_t)sub_26082424C, (uint64_t (*)(uint64_t, void *, uint64_t, uint64_t))sub_26082332C);
}

uint64_t sub_260853670(char a1, uint64_t a2, uint64_t a3)
{
  return sub_260853774(a1, a2, a3, (uint64_t)sub_26082424C, (uint64_t (*)(uint64_t, void *, uint64_t, uint64_t))sub_260823648);
}

uint64_t sub_2608536A0(unsigned int a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  int v3 = (unsigned __int16)a1;
  unsigned int v4 = HIWORD(a1);
  uint64_t v5 = v2 - 1;
  uint64_t v6 = (unsigned __int16 *)(a2 + 34);
  do
  {
    uint64_t v7 = v5;
    BOOL v8 = *(v6 - 1) == v3 && *v6 == v4;
    uint64_t result = v8;
    if (v8) {
      break;
    }
    --v5;
    v6 += 2;
  }
  while (v7);
  return result;
}

uint64_t sub_2608536EC(__int16 a1, uint64_t a2, uint64_t a3)
{
  __int16 v5 = a1;
  v4[2] = &v5;
  return sub_260823A68(sub_2608633D8, v4, a2, a3) & 1;
}

uint64_t sub_260853748(char a1, uint64_t a2, uint64_t a3)
{
  return sub_260853774(a1, a2, a3, (uint64_t)sub_260823E94, (uint64_t (*)(uint64_t, void *, uint64_t, uint64_t))sub_260823B44);
}

uint64_t sub_260853774(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, void *, uint64_t, uint64_t))
{
  char v7 = a1;
  _OWORD v6[2] = &v7;
  return a5(a4, v6, a2, a3) & 1;
}

BOOL sub_2608537C8(BOOL result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  int v3 = result;
  if (*(unsigned char *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 33; ; ++i)
  {
    uint64_t v5 = i - 31;
    if (__OFADD__(i - 32, 1)) {
      break;
    }
    int v6 = *(unsigned __int8 *)(a2 + i);
    uint64_t result = v6 == v3;
    if (v6 == v3 || v5 == v2) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_260853828(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_26087BBE0();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  char v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_26087BBE0() & 1) != 0) {
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

uint64_t HIDServiceProperties.useRemoteAcceleration.getter()
{
  OUTLINED_FUNCTION_133();
  OUTLINED_FUNCTION_1_35();
  uint64_t v1 = sub_26087BC00();
  id v2 = OUTLINED_FUNCTION_16_13(v1, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (v0)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v3 = swift_unknownObjectRelease();
  }
  else
  {
    double v7 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v3, v4, &qword_26A8B4998, v5, v6, v7);
  if (v13)
  {
    OUTLINED_FUNCTION_7_20();
    OUTLINED_FUNCTION_21_10();
    if (v10) {
      return v9;
    }
    else {
      return v8;
    }
  }
  else
  {
    sub_2608634B4((uint64_t)v12, &qword_26A8B4998);
    return 2;
  }
}

uint64_t HIDServiceProperties.primaryUsagePair.getter()
{
  OUTLINED_FUNCTION_1_28();
  *(void *)&long long v8 = 0xD000000000000010;
  *((void *)&v8 + 1) = v1;
  sub_26087BC00();
  id v2 = OUTLINED_FUNCTION_91_0();
  OUTLINED_FUNCTION_74_0();
  if (v0)
  {
    sub_26087B730();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
  }
  sub_260860824((uint64_t)&v8, (uint64_t)v10, &qword_26A8B4998);
  if (!v11) {
    goto LABEL_12;
  }
  if ((OUTLINED_FUNCTION_147() & 1) == 0) {
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_89_0();
  *(void *)&long long v8 = v3;
  *((void *)&v8 + 1) = v4;
  sub_26087BC00();
  id v5 = OUTLINED_FUNCTION_91_0();
  swift_unknownObjectRelease();
  if (v5)
  {
    sub_26087B730();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
  }
  sub_260860824((uint64_t)&v8, (uint64_t)v10, &qword_26A8B4998);
  if (!v11)
  {
LABEL_12:
    sub_2608634B4((uint64_t)v10, &qword_26A8B4998);
    goto LABEL_13;
  }
  if (OUTLINED_FUNCTION_147()) {
    return v7 | (v7 << 16);
  }
LABEL_13:
  uint64_t result = sub_26087B990();
  __break(1u);
  return result;
}

uint64_t HIDServiceProperties.dispatchScrollEvents.getter()
{
  OUTLINED_FUNCTION_52_1();
  OUTLINED_FUNCTION_1_35();
  uint64_t v1 = sub_26087BC00();
  id v2 = OUTLINED_FUNCTION_16_13(v1, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (v0)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v3 = swift_unknownObjectRelease();
  }
  else
  {
    double v7 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v3, v4, &qword_26A8B4998, v5, v6, v7);
  if (v13)
  {
    OUTLINED_FUNCTION_7_20();
    OUTLINED_FUNCTION_21_10();
    if (v10) {
      return v9;
    }
    else {
      return v8;
    }
  }
  else
  {
    sub_2608634B4((uint64_t)v12, &qword_26A8B4998);
    return 2;
  }
}

uint64_t HIDServiceProperties.dictionaryRepresentation.getter(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = sub_26085457C(v2);

  return sub_2608544B4(v3, &qword_26A8B55D8, (void (*)(uint64_t, uint64_t, uint64_t *))sub_260862CC8);
}

id HIDServiceProperties.init(serviceID:properties:)(uint64_t a1, uint64_t a2)
{
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9A0]), sel_init);
  uint64_t v4 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a2 + 64);
  int64_t v26 = (unint64_t)(v4 + 63) >> 6;
  id result = v3;
  uint64_t v32 = result;
  int64_t v8 = 0;
  uint64_t v25 = a2 + 64;
  while (1)
  {
    if (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (v8 << 6);
LABEL_6:
      uint64_t v11 = *(void *)(a2 + 56);
      BOOL v12 = (void *)(*(void *)(a2 + 48) + 16 * v10);
      uint64_t v13 = v12[1];
      *(void *)&long long v27 = *v12;
      *((void *)&v27 + 1) = v13;
      sub_26080964C(v11 + 32 * v10, (uint64_t)v28);
      swift_bridgeObjectRetain();
      goto LABEL_13;
    }
    int64_t v14 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      return result;
    }
    if (v14 >= v26)
    {
      int64_t v16 = v8;
    }
    else
    {
      unint64_t v15 = *(void *)(v25 + 8 * v14);
      if (v15) {
        goto LABEL_10;
      }
      int64_t v16 = v8 + 1;
      if (v8 + 2 < v26)
      {
        unint64_t v15 = *(void *)(v25 + 8 * (v8 + 2));
        if (v15)
        {
          int64_t v14 = v8 + 2;
LABEL_10:
          unint64_t v6 = (v15 - 1) & v15;
          unint64_t v10 = __clz(__rbit64(v15)) + (v14 << 6);
          int64_t v8 = v14;
          goto LABEL_6;
        }
        int64_t v16 = v8 + 2;
        if (v8 + 3 < v26)
        {
          unint64_t v15 = *(void *)(v25 + 8 * (v8 + 3));
          if (v15)
          {
            int64_t v14 = v8 + 3;
            goto LABEL_10;
          }
          int64_t v14 = v8 + 4;
          int64_t v16 = v8 + 3;
          if (v8 + 4 < v26)
          {
            unint64_t v15 = *(void *)(v25 + 8 * v14);
            if (v15) {
              goto LABEL_10;
            }
            while (v8 + 5 < v26)
            {
              unint64_t v15 = *(void *)(a2 + 104 + 8 * v8++);
              if (v15)
              {
                int64_t v14 = v8 + 4;
                goto LABEL_10;
              }
            }
            int64_t v16 = v26 - 1;
          }
        }
      }
    }
    unint64_t v6 = 0;
    memset(v28, 0, sizeof(v28));
    int64_t v8 = v16;
    long long v27 = 0u;
LABEL_13:
    sub_260860824((uint64_t)&v27, (uint64_t)&v29, &qword_26A8B5440);
    uint64_t v17 = v30;
    if (!v30) {
      break;
    }
    uint64_t v18 = v29;
    sub_2607F7344(&v31, &v27);
    id v19 = (void *)static HIDServicePropertyKey.allCases.getter();
    char v20 = sub_260853828(v18, v17, v19);
    swift_bridgeObjectRelease();
    if (v20)
    {
      __swift_project_boxed_opaque_existential_1(&v27, *((uint64_t *)&v28[0] + 1));
      uint64_t v21 = sub_26087BBD0();
      swift_bridgeObjectRetain();
      objc_msgSend(v32, sel___swift_setObject_forKeyedSubscript_, v21, sub_26087BC00());
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v27);
      id result = (id)swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      id result = (id)__swift_destroy_boxed_opaque_existential_1((uint64_t)&v27);
    }
  }
  swift_release();
  unint64_t v22 = v32;
  sub_260860444(a1, v32);

  if (v23) {
  return (id)a1;
  }
}

uint64_t HIDServiceProperties.deviceUsagePairs.getter()
{
  OUTLINED_FUNCTION_131();
  OUTLINED_FUNCTION_126();
  uint64_t v1 = sub_26087BC00();
  id v2 = OUTLINED_FUNCTION_16_13(v1, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (v0)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v3 = swift_unknownObjectRelease();
  }
  else
  {
    double v7 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v3, v4, &qword_26A8B4998, v5, v6, v7);
  if (!v22)
  {
    sub_2608634B4((uint64_t)v21, &qword_26A8B4998);
    return MEMORY[0x263F8EE78];
  }
  sub_26081221C(0, &qword_26A8B49A0);
  if ((OUTLINED_FUNCTION_3_30() & 1) == 0) {
    return MEMORY[0x263F8EE78];
  }
  unint64_t v15 = v20;
  sub_2608547C8((uint64_t)v20, v8, v9, v10, v11, v12, v13, v14, v19, v20);
  uint64_t v17 = v16;

  return v17;
}

uint64_t HIDServiceProperties.pointerButtonMode.getter()
{
  OUTLINED_FUNCTION_52_1();
  OUTLINED_FUNCTION_1_35();
  uint64_t v1 = sub_26087BC00();
  id v2 = OUTLINED_FUNCTION_16_13(v1, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (v0)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v3 = swift_unknownObjectRelease();
  }
  else
  {
    double v7 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v3, v4, &qword_26A8B4998, v5, v6, v7);
  if (v20)
  {
    int v8 = OUTLINED_FUNCTION_3_30();
    return OUTLINED_FUNCTION_6_25(v8, v9, v10, v11, v12, v13, v14, v15, v17, v18);
  }
  else
  {
    sub_2608634B4((uint64_t)v19, &qword_26A8B4998);
    return OUTLINED_FUNCTION_41();
  }
}

uint64_t HIDServiceProperties.mouseAcceleration.getter()
{
  OUTLINED_FUNCTION_52_1();
  OUTLINED_FUNCTION_1_35();
  uint64_t v1 = sub_26087BC00();
  id v2 = OUTLINED_FUNCTION_16_13(v1, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (v0)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v3 = swift_unknownObjectRelease();
  }
  else
  {
    double v7 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v3, v4, &qword_26A8B4998, v5, v6, v7);
  if (v20)
  {
    int v8 = OUTLINED_FUNCTION_3_30();
    return OUTLINED_FUNCTION_6_25(v8, v9, v10, v11, v12, v13, v14, v15, v17, v18);
  }
  else
  {
    sub_2608634B4((uint64_t)v19, &qword_26A8B4998);
    return OUTLINED_FUNCTION_41();
  }
}

uint64_t HIDServiceProperties.mouseScrollAcceleration.getter()
{
  OUTLINED_FUNCTION_132();
  OUTLINED_FUNCTION_1_35();
  uint64_t v1 = sub_26087BC00();
  id v2 = OUTLINED_FUNCTION_16_13(v1, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (v0)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v3 = swift_unknownObjectRelease();
  }
  else
  {
    double v7 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v3, v4, &qword_26A8B4998, v5, v6, v7);
  if (v20)
  {
    int v8 = OUTLINED_FUNCTION_3_30();
    return OUTLINED_FUNCTION_6_25(v8, v9, v10, v11, v12, v13, v14, v15, v17, v18);
  }
  else
  {
    sub_2608634B4((uint64_t)v19, &qword_26A8B4998);
    return OUTLINED_FUNCTION_41();
  }
}

uint64_t HIDServiceProperties.trackpadAcceleration.getter(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1_35();
  uint64_t v3 = sub_26087BC00();
  id v4 = OUTLINED_FUNCTION_16_13(v3, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (a2)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v5 = swift_unknownObjectRelease();
  }
  else
  {
    double v9 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v5, v6, &qword_26A8B4998, v7, v8, v9);
  if (v22)
  {
    int v10 = OUTLINED_FUNCTION_3_30();
    return OUTLINED_FUNCTION_6_25(v10, v11, v12, v13, v14, v15, v16, v17, v19, v20);
  }
  else
  {
    sub_2608634B4((uint64_t)v21, &qword_26A8B4998);
    return OUTLINED_FUNCTION_41();
  }
}

uint64_t HIDServiceProperties.trackpadScrollAcceleration.getter(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1_35();
  uint64_t v3 = sub_26087BC00();
  id v4 = OUTLINED_FUNCTION_16_13(v3, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (a2)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v5 = swift_unknownObjectRelease();
  }
  else
  {
    double v9 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v5, v6, &qword_26A8B4998, v7, v8, v9);
  if (v22)
  {
    int v10 = OUTLINED_FUNCTION_3_30();
    return OUTLINED_FUNCTION_6_25(v10, v11, v12, v13, v14, v15, v16, v17, v19, v20);
  }
  else
  {
    sub_2608634B4((uint64_t)v21, &qword_26A8B4998);
    return OUTLINED_FUNCTION_41();
  }
}

uint64_t sub_260854474(uint64_t a1)
{
  return sub_2608544B4(a1, &qword_26A8B55D8, (void (*)(uint64_t, uint64_t, uint64_t *))sub_260862CC8);
}

uint64_t sub_260854494(uint64_t a1)
{
  return sub_2608544B4(a1, &qword_26A8B4940, (void (*)(uint64_t, uint64_t, uint64_t *))sub_260862FBC);
}

uint64_t sub_2608544B4(uint64_t a1, uint64_t *a2, void (*a3)(uint64_t, uint64_t, uint64_t *))
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(a2);
    uint64_t v4 = sub_26087BA00();
  }
  else
  {
    uint64_t v4 = MEMORY[0x263F8EE80];
  }
  uint64_t v7 = v4;
  uint64_t v5 = swift_bridgeObjectRetain();
  a3(v5, 1, &v7);
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t HIDServiceProperties.useRemoteAcceleration.setter(char a1)
{
  return OUTLINED_FUNCTION_13_12(a1);
}

uint64_t sub_26085457C(void *a1)
{
  id v1 = a1;
  uint64_t v2 = sub_26087B4E0();

  uint64_t v23 = v2;
  sub_26087B500();
  sub_260863470((uint64_t)&unk_26A8B55E0);
  OUTLINED_FUNCTION_139();
  if (*((void *)&v20 + 1))
  {
    uint64_t v3 = MEMORY[0x263F8EE78];
    BOOL v24 = &v16;
    do
    {
      v18[0] = *(_OWORD *)&v19[5];
      v18[1] = v20;
      *(_OWORD *)uint64_t v19 = v21;
      *(_OWORD *)&v19[2] = v22;
      sub_26080964C((uint64_t)v18, (uint64_t)&v12);
      sub_26080964C((uint64_t)v19, (uint64_t)v14);
      if (swift_dynamicCast())
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
        long long v15 = v11;
        sub_26080964C((uint64_t)v18, (uint64_t)&v12);
        sub_26080964C((uint64_t)v19, (uint64_t)v14);
        sub_2607F7344(v14, v24);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v12);
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
      }
      sub_2608634B4((uint64_t)v18, &qword_26A8B55E8);
      if (*((void *)&v15 + 1))
      {
        long long v12 = v15;
        long long v13 = v16;
        v14[0] = v17;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_111();
          sub_260822788();
          uint64_t v3 = v8;
        }
        unint64_t v4 = *(void *)(v3 + 16);
        if (v4 >= *(void *)(v3 + 24) >> 1)
        {
          sub_260822788();
          uint64_t v3 = v9;
        }
        *(void *)(v3 + 16) = v4 + 1;
        uint64_t v5 = (_OWORD *)(v3 + 48 * v4);
        long long v6 = v12;
        long long v7 = v14[0];
        v5[3] = v13;
        v5[4] = v7;
        _OWORD v5[2] = v6;
      }
      else
      {
        sub_2608634B4((uint64_t)&v15, &qword_26A8B55F0);
      }
      OUTLINED_FUNCTION_139();
    }
    while (*((void *)&v20 + 1));
  }
  else
  {
    uint64_t v3 = MEMORY[0x263F8EE78];
  }
  swift_release();
  return v3;
}

void sub_2608547C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  OUTLINED_FUNCTION_76_0();
  long long v11 = v10;
  sub_26087AF30();
  OUTLINED_FUNCTION_10_2();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_4_7();
  id v13 = v11;
  sub_26087B5F0();

  sub_260863470((uint64_t)&unk_26A8B55C0);
  OUTLINED_FUNCTION_160();
  if (v29)
  {
    uint64_t v14 = MEMORY[0x263F8EE78];
    do
    {
      sub_2607F7344(&v28, v27);
      sub_26080964C((uint64_t)v27, (uint64_t)&v26);
      sub_26081221C(0, &qword_26A8B5448);
      if (!swift_dynamicCast() || (__int16 v15 = sub_260857AD0(a10), (v17 & 1) != 0))
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
      }
      else
      {
        __int16 v18 = v15;
        __int16 v19 = v16;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_26082282C();
          uint64_t v14 = v22;
        }
        unint64_t v20 = *(void *)(v14 + 16);
        if (v20 >= *(void *)(v14 + 24) >> 1)
        {
          sub_26082282C();
          uint64_t v14 = v23;
        }
        *(void *)(v14 + 16) = v20 + 1;
        uint64_t v21 = v14 + 4 * v20;
        *(_WORD *)(v21 + 32) = v19;
        *(_WORD *)(v21 + 34) = v18;
      }
      OUTLINED_FUNCTION_160();
    }
    while (v29);
  }
  uint64_t v24 = OUTLINED_FUNCTION_154();
  v25(v24);
  OUTLINED_FUNCTION_72_0();
}

void sub_2608549D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, NSDictionary a10)
{
  OUTLINED_FUNCTION_76_0();
  long long v11 = v10;
  sub_26087AF30();
  OUTLINED_FUNCTION_10_2();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_75_0();
  id v13 = v11;
  sub_26087B5F0();

  sub_260863470((uint64_t)&unk_26A8B55C0);
  OUTLINED_FUNCTION_152();
  if (v25)
  {
    uint64_t v14 = MEMORY[0x263F8EE78];
    do
    {
      sub_2607F7344(&v24, v23);
      sub_26080964C((uint64_t)v23, (uint64_t)&v22);
      sub_26081221C(0, &qword_26A8B5448);
      if (swift_dynamicCast())
      {
        HIDServiceProperties.HIDAccelCurve.init(dictionaryRepresentation:)(&v26, a10);
        sub_260860824((uint64_t)&v26, (uint64_t)v21, &qword_26A8B5458);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
        sub_260860824((uint64_t)&v26, (uint64_t)v27, &qword_26A8B5458);
        if (sub_2608633F8((uint64_t)v27) != 1)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            OUTLINED_FUNCTION_111();
            sub_2608228E8();
            uint64_t v14 = v16;
          }
          unint64_t v15 = *(void *)(v14 + 16);
          if (v15 >= *(void *)(v14 + 24) >> 1)
          {
            sub_2608228E8();
            uint64_t v14 = v17;
          }
          sub_260860824((uint64_t)v21, (uint64_t)v20, &qword_26A8B5458);
          *(void *)(v14 + 16) = v15 + 1;
          memcpy((void *)(v14 + 144 * v15 + 32), v20, 0x89uLL);
        }
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
      }
      OUTLINED_FUNCTION_152();
    }
    while (v25);
  }
  uint64_t v18 = OUTLINED_FUNCTION_73_0();
  v19(v18);
  OUTLINED_FUNCTION_72_0();
}

uint64_t HIDServiceProperties.deviceTypeHint.getter()
{
  OUTLINED_FUNCTION_71_0();
  return sub_260854C40(v0, v1, v2, v3);
}

uint64_t HIDServiceProperties.product.getter(uint64_t a1, uint64_t a2)
{
  return sub_260854C40(a1, a2, 0x746375646F7250, 0xE700000000000000);
}

uint64_t sub_260854C40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v22[0] = a3;
  v22[1] = a4;
  uint64_t v5 = sub_26087BC00();
  id v6 = OUTLINED_FUNCTION_16_13(v5, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (a2)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v7 = swift_unknownObjectRelease();
  }
  else
  {
    double v11 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v7, v8, &qword_26A8B4998, v9, v10, v11);
  if (v22[3])
  {
    int v12 = OUTLINED_FUNCTION_7_20();
    return OUTLINED_FUNCTION_24_5(v12, v13, v14, v15, v16, v17, v18, v19, v21);
  }
  else
  {
    sub_2608634B4((uint64_t)v22, &qword_26A8B4998);
    return OUTLINED_FUNCTION_110();
  }
}

uint64_t HIDServiceProperties.product.setter(uint64_t a1, uint64_t a2)
{
  return HIDServiceProperties.subscript.setter(a1, a2);
}

uint64_t HIDServiceProperties.universalControlVirtualService.setter(char a1)
{
  return OUTLINED_FUNCTION_13_12(a1);
}

uint64_t HIDServiceProperties.fnKeyboardUsageMap.setter(uint64_t a1, uint64_t a2)
{
  return OUTLINED_FUNCTION_34_1(a1, a2);
}

uint64_t HIDServiceProperties.pointerAccelerationSupport.setter(char a1)
{
  return OUTLINED_FUNCTION_13_12(a1);
}

uint64_t HIDServiceProperties.scrollAccelerationSupport.setter(char a1)
{
  return OUTLINED_FUNCTION_13_12(a1);
}

uint64_t HIDServiceProperties.eventServiceProperties.setter(uint64_t a1)
{
  return HIDServiceProperties.subscript.setter(a1);
}

uint64_t HIDServiceProperties.property(forKey:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X3>, _OWORD *a4@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t v8 = (void *)static HIDServicePropertyKey.allCases.getter();
  char v9 = sub_260853828(a1, a2, v8);
  swift_bridgeObjectRelease();
  if (v9)
  {
    OUTLINED_FUNCTION_124();
    id v10 = objc_msgSend(a3, sel___swift_objectForKeyedSubscript_, sub_26087BC00());
    OUTLINED_FUNCTION_62_1();
    if (a3)
    {
      sub_26087B730();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v12, 0, sizeof(v12));
    }
    sub_260860824((uint64_t)v12, (uint64_t)a4, &qword_26A8B4998);
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

unint64_t HIDDisableAccessibilityEventTranslation.getter()
{
  return OUTLINED_FUNCTION_0_29(36);
}

unint64_t HIDDispatchScrollEvents.getter()
{
  return OUTLINED_FUNCTION_0_29(20);
}

unint64_t HIDFaceTimeRemoteControlSessionIDKey.getter()
{
  return OUTLINED_FUNCTION_45_1();
}

unint64_t HIDPlatformInputModeConfiguration.getter()
{
  return OUTLINED_FUNCTION_45_1();
}

unint64_t HIDUniversalControlBuiltInKey.getter()
{
  return OUTLINED_FUNCTION_0_29(23);
}

unint64_t HIDUniversalControlMatchedServiceKey.getter()
{
  return OUTLINED_FUNCTION_45_1();
}

unint64_t HIDUniversalControlVirtualServiceKey.getter()
{
  return OUTLINED_FUNCTION_45_1();
}

unint64_t HIDUseRemoteAcceleration.getter()
{
  return OUTLINED_FUNCTION_0_29(21);
}

uint64_t HIDServiceProperties.serviceID.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*HIDServiceProperties.serviceID.modify())()
{
  return nullsub_1;
}

uint64_t HIDServiceProperties.subscript.getter()
{
  OUTLINED_FUNCTION_36_1();
  uint64_t v1 = sub_26087BC00();
  id v2 = OUTLINED_FUNCTION_108_0(v1, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_74_0();
  if (v0)
  {
    OUTLINED_FUNCTION_61_1();
    uint64_t v3 = swift_unknownObjectRelease();
  }
  else
  {
    double v7 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v3, v4, &qword_26A8B4998, v5, v6, v7);
  if (!v12)
  {
    swift_bridgeObjectRelease();
    sub_2608634B4((uint64_t)v11, &qword_26A8B4998);
    return 2;
  }
  if (!OUTLINED_FUNCTION_7_20())
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  uint64_t v8 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v9;
  uint64_t v11;
  unsigned char v12[24];
  uint64_t v13;

  OUTLINED_FUNCTION_36_1();
  uint64_t v1 = sub_26087BC00();
  id v2 = OUTLINED_FUNCTION_108_0(v1, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_74_0();
  if (v0)
  {
    OUTLINED_FUNCTION_61_1();
    uint64_t v3 = swift_unknownObjectRelease();
  }
  else
  {
    double v7 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v3, v4, &qword_26A8B4998, v5, v6, v7);
  if (v13)
  {
    if (OUTLINED_FUNCTION_7_20()) {
      char v9 = v11;
    }
    else {
      char v9 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2608634B4((uint64_t)v12, &qword_26A8B4998);
    return 0;
  }
  return v9;
}

{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v10;
  unsigned char v11[24];
  uint64_t v12;

  OUTLINED_FUNCTION_36_1();
  uint64_t v1 = sub_26087BC00();
  id v2 = OUTLINED_FUNCTION_108_0(v1, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_74_0();
  if (v0)
  {
    OUTLINED_FUNCTION_61_1();
    uint64_t v3 = swift_unknownObjectRelease();
  }
  else
  {
    double v7 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v3, v4, &qword_26A8B4998, v5, v6, v7);
  if (v12)
  {
    if (OUTLINED_FUNCTION_3_30()) {
      uint64_t v8 = v10;
    }
    else {
      uint64_t v8 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2608634B4((uint64_t)v11, &qword_26A8B4998);
    return 0;
  }
  return v8;
}

{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v10;
  unsigned char v11[24];
  uint64_t v12;

  OUTLINED_FUNCTION_36_1();
  uint64_t v1 = sub_26087BC00();
  id v2 = OUTLINED_FUNCTION_108_0(v1, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_74_0();
  if (v0)
  {
    OUTLINED_FUNCTION_61_1();
    uint64_t v3 = swift_unknownObjectRelease();
  }
  else
  {
    double v7 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v3, v4, &qword_26A8B4998, v5, v6, v7);
  if (!v12)
  {
    swift_bridgeObjectRelease();
    sub_2608634B4((uint64_t)v11, &qword_26A8B4998);
    return 0;
  }
  if (!OUTLINED_FUNCTION_7_20())
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v8 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v10;
  unsigned char v11[24];
  uint64_t v12;

  OUTLINED_FUNCTION_36_1();
  uint64_t v1 = sub_26087BC00();
  id v2 = OUTLINED_FUNCTION_108_0(v1, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_74_0();
  if (v0)
  {
    OUTLINED_FUNCTION_61_1();
    uint64_t v3 = swift_unknownObjectRelease();
  }
  else
  {
    double v7 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v3, v4, &qword_26A8B4998, v5, v6, v7);
  if (!v12)
  {
    swift_bridgeObjectRelease();
    sub_2608634B4((uint64_t)v11, &qword_26A8B4998);
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B5450);
  if (!OUTLINED_FUNCTION_3_30())
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v8 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_260855038@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = HIDServiceProperties.subscript.getter();
  *a1 = result;
  return result;
}

uint64_t sub_260855068(char *a1)
{
  char v1 = *a1;
  swift_bridgeObjectRetain();
  return HIDServiceProperties.subscript.setter(v1);
}

uint64_t HIDServiceProperties.subscript.setter(char a1)
{
  if (a1 == 2) {
    char v1 = 0;
  }
  else {
    char v1 = (void *)sub_26087B450();
  }
  OUTLINED_FUNCTION_124();
  uint64_t v2 = sub_26087BC00();
  OUTLINED_FUNCTION_94_0(v2, sel___swift_setObject_forKeyedSubscript_);
  swift_bridgeObjectRelease();

  return swift_unknownObjectRelease();
}

void HIDServiceProperties.subscript.modify()
{
  OUTLINED_FUNCTION_68_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  double v7 = malloc(0x60uLL);
  *uint64_t v6 = v7;
  *((void *)v7 + 4) = v4;
  *((void *)v7 + 9) = v2;
  *((void *)v7 + 10) = v0;
  *((void *)v7 + 8) = v4;
  OUTLINED_FUNCTION_31_1((uint64_t)v7);
  uint64_t v8 = sub_26087BC00();
  id v9 = OUTLINED_FUNCTION_95_0(v8, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_100_0();
  if (v4)
  {
    OUTLINED_FUNCTION_102_0();
    uint64_t v10 = swift_unknownObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_93_0();
  }
  OUTLINED_FUNCTION_97_0(v10, v11, &qword_26A8B4998);
  if (!*((void *)v7 + 3))
  {
    swift_bridgeObjectRelease();
    sub_2608634B4((uint64_t)v7, &qword_26A8B4998);
LABEL_9:
    char v12 = 2;
    goto LABEL_10;
  }
  if ((OUTLINED_FUNCTION_60_1() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  char v12 = *((unsigned char *)v7 + 89);
  swift_bridgeObjectRelease();
LABEL_10:
  *((unsigned char *)v7 + 88) = v12;
  OUTLINED_FUNCTION_52_0();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;

  OUTLINED_FUNCTION_68_0();
  uint64_t v4 = OUTLINED_FUNCTION_144();
  *uint64_t v0 = v4;
  v4[4] = v3;
  v4[13] = v2;
  v4[14] = v1;
  v4[12] = v3;
  OUTLINED_FUNCTION_31_1((uint64_t)v4);
  uint64_t v5 = sub_26087BC00();
  uint64_t v6 = OUTLINED_FUNCTION_95_0(v5, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_100_0();
  if (v3)
  {
    OUTLINED_FUNCTION_102_0();
    double v7 = swift_unknownObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_93_0();
  }
  OUTLINED_FUNCTION_97_0(v7, v8, &qword_26A8B4998);
  if (v4[3])
  {
    id v9 = OUTLINED_FUNCTION_123();
    uint64_t v10 = v4[10];
    uint64_t v11 = v4[11];
    swift_bridgeObjectRelease();
    if (v9) {
      char v12 = v10;
    }
    else {
      char v12 = 0;
    }
    uint64_t v13 = 0xF000000000000000;
    if (v9) {
      uint64_t v13 = v11;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2608634B4((uint64_t)v4, &qword_26A8B4998);
    char v12 = 0;
    uint64_t v13 = 0xF000000000000000;
  }
  v4[8] = v12;
  v4[9] = v13;
  OUTLINED_FUNCTION_52_0();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  OUTLINED_FUNCTION_68_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  double v7 = malloc(0x70uLL);
  *uint64_t v6 = v7;
  v7[4] = v4;
  v7[12] = v2;
  v7[13] = v0;
  v7[11] = v4;
  OUTLINED_FUNCTION_31_1((uint64_t)v7);
  uint64_t v8 = sub_26087BC00();
  id v9 = OUTLINED_FUNCTION_95_0(v8, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_100_0();
  if (v4)
  {
    OUTLINED_FUNCTION_102_0();
    uint64_t v10 = swift_unknownObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_93_0();
  }
  OUTLINED_FUNCTION_97_0(v10, v11, &qword_26A8B4998);
  if (v7[3])
  {
    char v12 = OUTLINED_FUNCTION_123();
    uint64_t v13 = v7[10];
    swift_bridgeObjectRelease();
    if (v12) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    uint64_t v15 = v12 ^ 1;
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2608634B4((uint64_t)v7, &qword_26A8B4998);
    uint64_t v14 = 0;
    uint64_t v15 = 1;
  }
  v7[8] = v14;
  *((unsigned char *)v7 + 72) = v15;
  OUTLINED_FUNCTION_52_0();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_68_0();
  uint64_t v4 = OUTLINED_FUNCTION_144();
  *uint64_t v0 = v4;
  v4[4] = v3;
  v4[13] = v2;
  v4[14] = v1;
  v4[12] = v3;
  OUTLINED_FUNCTION_31_1((uint64_t)v4);
  uint64_t v5 = sub_26087BC00();
  uint64_t v6 = OUTLINED_FUNCTION_95_0(v5, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_100_0();
  if (v3)
  {
    OUTLINED_FUNCTION_102_0();
    double v7 = swift_unknownObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_93_0();
  }
  OUTLINED_FUNCTION_97_0(v7, v8, &qword_26A8B4998);
  if (!v4[3])
  {
    swift_bridgeObjectRelease();
    sub_2608634B4((uint64_t)v4, &qword_26A8B4998);
LABEL_9:
    id v9 = 0;
    uint64_t v10 = 0;
    goto LABEL_10;
  }
  if ((OUTLINED_FUNCTION_123() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  id v9 = v4[10];
  uint64_t v10 = v4[11];
  swift_bridgeObjectRelease();
LABEL_10:
  v4[8] = v9;
  v4[9] = v10;
  OUTLINED_FUNCTION_52_0();
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_68_0();
  uint64_t v2 = OUTLINED_FUNCTION_84_0();
  OUTLINED_FUNCTION_30_1(v2);
  uint64_t v3 = sub_26087BC00();
  uint64_t v4 = OUTLINED_FUNCTION_95_0(v3, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_100_0();
  if (v0)
  {
    OUTLINED_FUNCTION_102_0();
    uint64_t v5 = swift_unknownObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_93_0();
  }
  OUTLINED_FUNCTION_97_0(v5, v6, &qword_26A8B4998);
  if (!v1[3])
  {
    swift_bridgeObjectRelease();
    sub_2608634B4((uint64_t)v1, &qword_26A8B4998);
LABEL_9:
    double v7 = 0;
    goto LABEL_10;
  }
  sub_26081221C(0, &qword_26A8B49A0);
  if ((OUTLINED_FUNCTION_60_1() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  double v7 = v1[9];
  swift_bridgeObjectRelease();
LABEL_10:
  v1[8] = v7;
  OUTLINED_FUNCTION_52_0();
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_68_0();
  uint64_t v2 = OUTLINED_FUNCTION_84_0();
  OUTLINED_FUNCTION_30_1(v2);
  uint64_t v3 = sub_26087BC00();
  uint64_t v4 = OUTLINED_FUNCTION_95_0(v3, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_100_0();
  if (v0)
  {
    OUTLINED_FUNCTION_102_0();
    uint64_t v5 = swift_unknownObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_93_0();
  }
  OUTLINED_FUNCTION_97_0(v5, v6, &qword_26A8B4998);
  if (!v1[3])
  {
    swift_bridgeObjectRelease();
    sub_2608634B4((uint64_t)v1, &qword_26A8B4998);
LABEL_9:
    double v7 = 0;
    goto LABEL_10;
  }
  sub_26081221C(0, &qword_26A8B5448);
  if ((OUTLINED_FUNCTION_60_1() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  double v7 = v1[9];
  swift_bridgeObjectRelease();
LABEL_10:
  v1[8] = v7;
  OUTLINED_FUNCTION_52_0();
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_68_0();
  uint64_t v2 = OUTLINED_FUNCTION_84_0();
  OUTLINED_FUNCTION_30_1(v2);
  uint64_t v3 = sub_26087BC00();
  uint64_t v4 = OUTLINED_FUNCTION_95_0(v3, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_100_0();
  if (v0)
  {
    OUTLINED_FUNCTION_102_0();
    uint64_t v5 = swift_unknownObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_93_0();
  }
  OUTLINED_FUNCTION_97_0(v5, v6, &qword_26A8B4998);
  if (!v1[3])
  {
    swift_bridgeObjectRelease();
    sub_2608634B4((uint64_t)v1, &qword_26A8B4998);
LABEL_9:
    double v7 = 0;
    goto LABEL_10;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B5450);
  if ((OUTLINED_FUNCTION_60_1() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  double v7 = v1[9];
  swift_bridgeObjectRelease();
LABEL_10:
  v1[8] = v7;
  OUTLINED_FUNCTION_52_0();
}

void sub_26085526C(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  char v2 = *(unsigned char *)(*(void *)a1 + 88);
  swift_bridgeObjectRetain();
  HIDServiceProperties.subscript.setter(v2);
  free(v1);
}

uint64_t sub_2608553C0(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  uint64_t v4 = a3[1];
  uint64_t v5 = *a1;
  unint64_t v6 = a1[1];
  swift_bridgeObjectRetain();
  sub_2608347E8(v5, v6);
  return HIDServiceProperties.subscript.setter(v5, v6, v3, v4);
}

uint64_t HIDServiceProperties.subscript.setter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  id v9 = *(void **)(v4 + 8);
  if (a2 >> 60 == 15) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = (void *)sub_26087AFF0();
  }
  swift_bridgeObjectRetain();
  objc_msgSend(v9, sel___swift_setObject_forKeyedSubscript_, v10, sub_26087BC00(), a3, a4);
  sub_2608347D4(a1, a2);
  swift_bridgeObjectRelease();

  return swift_unknownObjectRelease();
}

void sub_260855610()
{
  OUTLINED_FUNCTION_68_0();
  char v1 = v0;
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 64);
  unint64_t v5 = *(void *)(*v2 + 72);
  swift_bridgeObjectRetain();
  if (v1)
  {
    sub_2608347E8(v4, v5);
    OUTLINED_FUNCTION_156();
    sub_2608347D4(*(void *)(v3 + 64), *(void *)(v3 + 72));
  }
  else
  {
    OUTLINED_FUNCTION_156();
  }
  OUTLINED_FUNCTION_52_0();
  free(v6);
}

uint64_t sub_26085577C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = HIDServiceProperties.subscript.getter();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_2608557B4(uint64_t a1)
{
  uint64_t v1 = *(void *)a1;
  char v2 = *(unsigned char *)(a1 + 8);
  swift_bridgeObjectRetain();
  return HIDServiceProperties.subscript.setter(v1, v2);
}

uint64_t HIDServiceProperties.subscript.setter(uint64_t a1, char a2)
{
  char v3 = *(void **)(v2 + 8);
  if (a2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = (void *)sub_26087B4B0();
  }
  OUTLINED_FUNCTION_124();
  objc_msgSend(v3, sel___swift_setObject_forKeyedSubscript_, v4, sub_26087BC00());
  swift_bridgeObjectRelease();

  return swift_unknownObjectRelease();
}

void sub_2608559D0(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void *)(*(void *)a1 + 64);
  char v3 = *(unsigned char *)(*(void *)a1 + 72);
  swift_bridgeObjectRetain();
  HIDServiceProperties.subscript.setter(v2, v3);
  free(v1);
}

uint64_t sub_260855B2C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t (*a4)(void, void, uint64_t, void)@<X3>, uint64_t *a5@<X8>)
{
  uint64_t result = a4(*a2, a2[1], a3, *(void *)(a1 + 8));
  *a5 = result;
  a5[1] = v7;
  return result;
}

uint64_t sub_260855B64(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return HIDServiceProperties.subscript.setter(v1, v2);
}

uint64_t HIDServiceProperties.subscript.setter(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = (void *)sub_26087B2A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = 0;
  }
  OUTLINED_FUNCTION_124();
  uint64_t v3 = sub_26087BC00();
  OUTLINED_FUNCTION_94_0(v3, sel___swift_setObject_forKeyedSubscript_);
  swift_bridgeObjectRelease();

  return swift_unknownObjectRelease();
}

void sub_260855D78(void **a1, char a2)
{
  uint64_t v2 = *a1;
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_157();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_157();
  }
  free(v2);
}

uint64_t HIDServiceProperties.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return sub_260855F88(a1, a2, a3, a4, &qword_26A8B49A0);
}

{
  return sub_260855F88(a1, a2, a3, a4, &qword_26A8B5448);
}

uint64_t sub_260855E14@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t result = HIDServiceProperties.subscript.getter(*a2, a2[1], a3, *(void **)(a1 + 8));
  *a4 = result;
  return result;
}

void sub_260855F5C()
{
}

uint64_t sub_260855F88(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, unint64_t *a5)
{
  v16[0] = a1;
  v16[1] = a2;
  swift_bridgeObjectRetain_n();
  id v7 = objc_msgSend(a4, sel___swift_objectForKeyedSubscript_, sub_26087BC00());
  swift_unknownObjectRelease();
  if (v7)
  {
    sub_26087B730();
    uint64_t v8 = swift_unknownObjectRelease();
  }
  else
  {
    double v12 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v8, v9, &qword_26A8B4998, v10, v11, v12);
  if (!v16[3])
  {
    swift_bridgeObjectRelease();
    sub_2608634B4((uint64_t)v16, &qword_26A8B4998);
    return 0;
  }
  sub_26081221C(0, a5);
  if (!OUTLINED_FUNCTION_3_30())
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v13 = v15;
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_2608560AC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t result = HIDServiceProperties.subscript.getter(*a2, a2[1], a3, *(void **)(a1 + 8));
  *a4 = result;
  return result;
}

uint64_t sub_2608560DC(id *a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t (*a5)(id, uint64_t, uint64_t))
{
  uint64_t v6 = *a3;
  uint64_t v7 = a3[1];
  id v8 = *a1;
  id v9 = *a1;
  swift_bridgeObjectRetain();
  return a5(v8, v6, v7);
}

uint64_t _s12UniversalHID20HIDServicePropertiesVySo7NSArrayCSgAA0C11PropertyKeyVcis_0(void *a1)
{
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_26087BC00();
  OUTLINED_FUNCTION_94_0(v2, sel___swift_setObject_forKeyedSubscript_);
  swift_bridgeObjectRelease();

  return swift_unknownObjectRelease();
}

void sub_2608562C8()
{
}

void sub_2608562E0()
{
  OUTLINED_FUNCTION_68_0();
  uint64_t v2 = v1;
  uint64_t v3 = (id *)(*(void *)v0 + 64);
  if (v4)
  {
    id v5 = *(id *)(*(void *)v0 + 64);
    swift_bridgeObjectRetain();
    uint64_t v6 = OUTLINED_FUNCTION_145();
    v2(v6);
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = OUTLINED_FUNCTION_145();
    v2(v7);
  }
  OUTLINED_FUNCTION_52_0();
  free(v8);
}

uint64_t sub_260856450@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = HIDServiceProperties.subscript.getter();
  *a1 = result;
  return result;
}

uint64_t sub_260856480(uint64_t *a1)
{
  uint64_t v1 = *a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return HIDServiceProperties.subscript.setter(v1);
}

uint64_t HIDServiceProperties.subscript.setter(uint64_t a1)
{
  if (a1)
  {
    sub_26087B1D0();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_124();
  uint64_t v1 = sub_26087BC00();
  OUTLINED_FUNCTION_94_0(v1, sel___swift_setObject_forKeyedSubscript_);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  return swift_unknownObjectRelease();
}

void sub_26085668C(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(*(void *)a1 + 64);
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    HIDServiceProperties.subscript.setter(v3);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    HIDServiceProperties.subscript.setter(v3);
  }
  free(v2);
}

uint64_t HIDServiceProperties.accelParametricCurves.getter(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_79_0();
  uint64_t v3 = sub_26087BC00();
  id v4 = OUTLINED_FUNCTION_16_13(v3, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (a2)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v5 = swift_unknownObjectRelease();
  }
  else
  {
    double v9 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v5, v6, &qword_26A8B4998, v7, v8, v9);
  if (!v24)
  {
    sub_2608634B4((uint64_t)v23, &qword_26A8B4998);
    return 0;
  }
  sub_26081221C(0, &qword_26A8B49A0);
  if ((OUTLINED_FUNCTION_3_30() & 1) == 0) {
    return 0;
  }
  uint64_t v17 = (void *)v22;
  sub_2608549D8(v22, v10, v11, v12, v13, v14, v15, v16, v21, (NSDictionary)v22);
  uint64_t v19 = v18;

  return v19;
}

uint64_t sub_260856818@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = HIDServiceProperties.accelParametricCurves.getter(a1, *(void *)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_260856844()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return HIDServiceProperties.accelParametricCurves.setter(v0);
}

uint64_t HIDServiceProperties.accelParametricCurves.setter(uint64_t a1)
{
  return sub_26085A334(a1, 0x6C65636341444948, 0xEE00736576727543);
}

void __swiftcall HIDServiceProperties.HIDAccelCurve.init(dictionaryRepresentation:)(UniversalHID::HIDServiceProperties::HIDAccelCurve_optional *__return_ptr retstr, NSDictionary dictionaryRepresentation)
{
  OUTLINED_FUNCTION_1_28();
  unint64_t v296 = 0xD000000000000011;
  uint64_t v297 = v4;
  id v5 = [(objc_class *)dictionaryRepresentation.super.isa __swift_objectForKeyedSubscript:sub_26087BC00()];
  OUTLINED_FUNCTION_62_1();
  if (v2)
  {
    OUTLINED_FUNCTION_78_0();
    uint64_t v6 = swift_unknownObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_80_0();
  }
  OUTLINED_FUNCTION_77_0(v6, v7, &qword_26A8B4998, v8, v9, v10, v11, v12, v107, v115, v124, v133, v142, v151, v160, v169, v178, v187, v196,
    v205,
    (uint64_t)retstr,
    v223,
    v232,
    v240,
    v248,
    v256,
    v264,
    v272,
    v280,
    v288,
    v296);
  if (v299)
  {
    OUTLINED_FUNCTION_27_3();
    OUTLINED_FUNCTION_50_1();
    uint64_t v206 = v13;
    int v15 = v14 ^ 1;
  }
  else
  {
    sub_2608634B4((uint64_t)&v296, &qword_26A8B4998);
    uint64_t v206 = 0;
    int v15 = 1;
  }
  HIDWORD(v197) = v15;
  OUTLINED_FUNCTION_51_1();
  uint64_t v16 = sub_26087BC00();
  id v17 = OUTLINED_FUNCTION_26_5(v16);
  OUTLINED_FUNCTION_62_1();
  if (v2)
  {
    OUTLINED_FUNCTION_78_0();
    uint64_t v18 = swift_unknownObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_80_0();
  }
  OUTLINED_FUNCTION_77_0(v18, v19, &qword_26A8B4998, v20, v21, v22, v23, v24, v108, v116, v125, v134, v143, v152, v161, v170, v179, v188, v197,
    v206,
    v215,
    v224,
    v233,
    v241,
    v249,
    v257,
    v265,
    v273,
    v281,
    v289,
    v296);
  if (v299)
  {
    OUTLINED_FUNCTION_27_3();
    OUTLINED_FUNCTION_50_1();
    uint64_t v189 = v25;
    int v27 = v26 ^ 1;
  }
  else
  {
    sub_2608634B4((uint64_t)&v296, &qword_26A8B4998);
    uint64_t v189 = 0;
    int v27 = 1;
  }
  HIDWORD(v180) = v27;
  OUTLINED_FUNCTION_51_1();
  uint64_t v28 = sub_26087BC00();
  id v29 = OUTLINED_FUNCTION_26_5(v28);
  OUTLINED_FUNCTION_62_1();
  if (v2)
  {
    OUTLINED_FUNCTION_78_0();
    uint64_t v30 = swift_unknownObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_80_0();
  }
  OUTLINED_FUNCTION_77_0(v30, v31, &qword_26A8B4998, v32, v33, v34, v35, v36, v109, v117, v126, v135, v144, v153, v162, v171, v180, v189, v198,
    v207,
    v216,
    v225,
    v234,
    v242,
    v250,
    v258,
    v266,
    v274,
    v282,
    v290,
    v296);
  if (v299)
  {
    OUTLINED_FUNCTION_27_3();
    OUTLINED_FUNCTION_50_1();
    uint64_t v172 = v37;
    int v39 = v38 ^ 1;
  }
  else
  {
    sub_2608634B4((uint64_t)&v296, &qword_26A8B4998);
    uint64_t v172 = 0;
    int v39 = 1;
  }
  HIDWORD(v163) = v39;
  OUTLINED_FUNCTION_51_1();
  uint64_t v40 = sub_26087BC00();
  id v41 = OUTLINED_FUNCTION_26_5(v40);
  OUTLINED_FUNCTION_62_1();
  if (v2)
  {
    OUTLINED_FUNCTION_78_0();
    uint64_t v42 = swift_unknownObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_80_0();
  }
  OUTLINED_FUNCTION_77_0(v42, v43, &qword_26A8B4998, v44, v45, v46, v47, v48, v110, v118, v127, v136, v145, v154, v163, v172, v181, v190, v199,
    v208,
    v217,
    v226,
    v235,
    v243,
    v251,
    v259,
    v267,
    v275,
    v283,
    v291,
    v296);
  if (v299)
  {
    OUTLINED_FUNCTION_27_3();
    OUTLINED_FUNCTION_50_1();
    uint64_t v155 = v49;
    int v51 = v50 ^ 1;
  }
  else
  {
    sub_2608634B4((uint64_t)&v296, &qword_26A8B4998);
    uint64_t v155 = 0;
    int v51 = 1;
  }
  HIDWORD(v146) = v51;
  OUTLINED_FUNCTION_28_2();
  unint64_t v296 = v52;
  uint64_t v297 = v53;
  uint64_t v54 = sub_26087BC00();
  id v55 = OUTLINED_FUNCTION_26_5(v54);
  OUTLINED_FUNCTION_62_1();
  if (v2)
  {
    OUTLINED_FUNCTION_78_0();
    uint64_t v56 = swift_unknownObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_80_0();
  }
  OUTLINED_FUNCTION_77_0(v56, v57, &qword_26A8B4998, v58, v59, v60, v61, v62, v111, v119, v128, v137, v146, v155, v164, v173, v182, v191, v200,
    v209,
    v218,
    v227,
    v236,
    v244,
    v252,
    v260,
    v268,
    v276,
    v284,
    v292,
    v296);
  if (v299)
  {
    OUTLINED_FUNCTION_27_3();
    OUTLINED_FUNCTION_50_1();
    uint64_t v138 = v63;
    char v65 = v64 ^ 1;
  }
  else
  {
    sub_2608634B4((uint64_t)&v296, &qword_26A8B4998);
    uint64_t v138 = 0;
    char v65 = 1;
  }
  OUTLINED_FUNCTION_51_1();
  uint64_t v66 = sub_26087BC00();
  id v67 = OUTLINED_FUNCTION_26_5(v66);
  OUTLINED_FUNCTION_62_1();
  if (v2)
  {
    OUTLINED_FUNCTION_78_0();
    uint64_t v68 = swift_unknownObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_80_0();
  }
  OUTLINED_FUNCTION_77_0(v68, v69, &qword_26A8B4998, v70, v71, v72, v73, v74, v112, v120, v129, v138, v147, v156, v165, v174, v183, v192, v201,
    v210,
    v219,
    v228,
    v237,
    v245,
    v253,
    v261,
    v269,
    v277,
    v285,
    v293,
    v296);
  if (v299)
  {
    OUTLINED_FUNCTION_27_3();
    OUTLINED_FUNCTION_50_1();
    uint64_t v130 = v75;
    int v77 = v76 ^ 1;
  }
  else
  {
    sub_2608634B4((uint64_t)&v296, &qword_26A8B4998);
    uint64_t v130 = 0;
    int v77 = 1;
  }
  HIDWORD(v121) = v77;
  OUTLINED_FUNCTION_51_1();
  uint64_t v78 = sub_26087BC00();
  id v79 = OUTLINED_FUNCTION_26_5(v78);
  OUTLINED_FUNCTION_62_1();
  if (v2)
  {
    OUTLINED_FUNCTION_78_0();
    uint64_t v80 = swift_unknownObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_80_0();
  }
  OUTLINED_FUNCTION_77_0(v80, v81, &qword_26A8B4998, v82, v83, v84, v85, v86, v113, v121, v130, v139, v148, v157, v166, v175, v184, v193, v202,
    v211,
    v220,
    v229,
    v238,
    v246,
    v254,
    v262,
    v270,
    v278,
    v286,
    v294,
    v296);
  if (v299)
  {
    int v87 = OUTLINED_FUNCTION_27_3();
    if (v87) {
      uint64_t v88 = v230;
    }
    else {
      uint64_t v88 = 0;
    }
    char v89 = v87 ^ 1;
  }
  else
  {
    sub_2608634B4((uint64_t)&v296, &qword_26A8B4998);
    uint64_t v88 = 0;
    char v89 = 1;
  }
  OUTLINED_FUNCTION_51_1();
  uint64_t v90 = sub_26087BC00();
  id v91 = OUTLINED_FUNCTION_26_5(v90);
  OUTLINED_FUNCTION_62_1();
  if (v2)
  {
    OUTLINED_FUNCTION_78_0();
    uint64_t v92 = swift_unknownObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_80_0();
  }
  OUTLINED_FUNCTION_77_0(v92, v93, &qword_26A8B4998, v94, v95, v96, v97, v98, v114, v122, v131, v140, v149, v158, v167, v176, v185, v194, v203,
    v212,
    v221,
    v230,
    v239,
    v247,
    v255,
    v263,
    v271,
    v279,
    v287,
    v295,
    v296);
  if (v299)
  {
    int v99 = OUTLINED_FUNCTION_27_3();
    if (v99) {
      uint64_t v100 = v231;
    }
    else {
      uint64_t v100 = 0;
    }
    char v101 = v99 ^ 1;
  }
  else
  {
    sub_2608634B4((uint64_t)&v296, &qword_26A8B4998);
    uint64_t v100 = 0;
    char v101 = 1;
  }
  OUTLINED_FUNCTION_51_1();
  uint64_t v102 = sub_26087BC00();
  id v103 = OUTLINED_FUNCTION_26_5(v102);
  OUTLINED_FUNCTION_62_1();
  sub_26087B730();
  swift_unknownObjectRelease();

  sub_260860824((uint64_t)&v296, (uint64_t)v314, &qword_26A8B4998);
  if (v315)
  {
    swift_dynamicCast();
    OUTLINED_FUNCTION_50_1();
    char v106 = v105 ^ 1;
  }
  else
  {
    sub_2608634B4((uint64_t)v314, &qword_26A8B4998);
    uint64_t v104 = 0;
    char v106 = 1;
  }
  unint64_t v296 = v213;
  LOBYTE(v297) = v204;
  uint64_t v298 = v195;
  LOBYTE(v299) = v186;
  uint64_t v300 = v177;
  char v301 = v168;
  uint64_t v302 = v159;
  char v303 = v150;
  uint64_t v304 = v141;
  char v305 = v65;
  uint64_t v306 = v132;
  char v307 = v123;
  uint64_t v308 = v88;
  char v309 = v89;
  uint64_t v310 = v100;
  char v311 = v101;
  uint64_t v312 = v104;
  char v313 = v106;
  sub_26086081C((uint64_t)&v296);
  sub_260860824((uint64_t)&v296, v222, &qword_26A8B5458);
}

uint64_t HIDServiceProperties.HIDAccelCurve.dictionaryRepresentation.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B5460);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_26087FDC0;
  OUTLINED_FUNCTION_1_28();
  *(void *)(v2 + 32) = 0xD000000000000011;
  *(void *)(v2 + 40) = v3;
  sub_260860824(v0, (uint64_t)v31, &qword_26A8B5468);
  OUTLINED_FUNCTION_64_0((uint64_t)v31);
  OUTLINED_FUNCTION_1_28();
  *(void *)(inited + 64) = v5;
  *(void *)(inited + 72) = v4;
  sub_260860824(v0 + 16, (uint64_t)v30, &qword_26A8B5468);
  OUTLINED_FUNCTION_64_0((uint64_t)v30);
  OUTLINED_FUNCTION_1_28();
  *(void *)(inited + 96) = v7;
  *(void *)(inited + 104) = v6;
  sub_260860824(v0 + 32, (uint64_t)v29, &qword_26A8B5468);
  OUTLINED_FUNCTION_64_0((uint64_t)v29);
  OUTLINED_FUNCTION_1_28();
  *(void *)(inited + 128) = v9;
  *(void *)(inited + 136) = v8;
  sub_260860824(v0 + 48, (uint64_t)v28, &qword_26A8B5468);
  OUTLINED_FUNCTION_64_0((uint64_t)v28);
  OUTLINED_FUNCTION_28_2();
  *(void *)(inited + 160) = v10;
  *(void *)(inited + 168) = v11;
  sub_260860824(v0 + 64, (uint64_t)v27, &qword_26A8B5468);
  OUTLINED_FUNCTION_64_0((uint64_t)v27);
  OUTLINED_FUNCTION_1_28();
  *(void *)(inited + 192) = v13;
  *(void *)(inited + 200) = v12;
  sub_260860824(v0 + 80, (uint64_t)v26, &qword_26A8B5468);
  OUTLINED_FUNCTION_64_0((uint64_t)v26);
  OUTLINED_FUNCTION_1_28();
  *(void *)(inited + 224) = v15;
  *(void *)(inited + 232) = v14;
  sub_260860824(v0 + 96, (uint64_t)v25, &qword_26A8B5468);
  OUTLINED_FUNCTION_64_0((uint64_t)v25);
  OUTLINED_FUNCTION_1_28();
  *(void *)(inited + 256) = v17;
  *(void *)(inited + 264) = v16;
  sub_260860824(v0 + 112, (uint64_t)v24, &qword_26A8B5468);
  OUTLINED_FUNCTION_64_0((uint64_t)v24);
  OUTLINED_FUNCTION_1_28();
  *(void *)(inited + 288) = v19;
  *(void *)(inited + 296) = v18;
  sub_260860824(v0 + 128, (uint64_t)v23, &qword_26A8B5468);
  OUTLINED_FUNCTION_64_0((uint64_t)v23);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B5468);
  uint64_t v20 = sub_26087B200();
  sub_26085BFC8(v20);
  swift_bridgeObjectRelease();
  uint64_t v21 = sub_26087B1D0();
  swift_bridgeObjectRelease();
  return v21;
}

uint64_t (*HIDServiceProperties.accelParametricCurves.modify(uint64_t a1))(uint64_t *a1, char a2)
{
  uint64_t v2 = OUTLINED_FUNCTION_96_0(a1);
  *uint64_t v1 = HIDServiceProperties.accelParametricCurves.getter(v2, v3);
  return sub_2608571E0;
}

uint64_t sub_2608571E0(uint64_t *a1, char a2)
{
  return sub_26085A4D4(a1, a2, HIDServiceProperties.accelParametricCurves.setter);
}

uint64_t HIDServiceProperties.appleVendorSupported.getter()
{
  OUTLINED_FUNCTION_52_1();
  OUTLINED_FUNCTION_1_35();
  uint64_t v1 = sub_26087BC00();
  id v2 = OUTLINED_FUNCTION_16_13(v1, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (v0)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v3 = swift_unknownObjectRelease();
  }
  else
  {
    double v7 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v3, v4, &qword_26A8B4998, v5, v6, v7);
  if (v13)
  {
    OUTLINED_FUNCTION_7_20();
    OUTLINED_FUNCTION_21_10();
    if (v10) {
      return v9;
    }
    else {
      return v8;
    }
  }
  else
  {
    sub_2608634B4((uint64_t)v12, &qword_26A8B4998);
    return 2;
  }
}

uint64_t sub_2608572C0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = HIDServiceProperties.appleVendorSupported.getter();
  *a1 = result;
  return result;
}

uint64_t HIDServiceProperties.appleVendorSupported.setter(char a1)
{
  return OUTLINED_FUNCTION_13_12(a1);
}

uint64_t (*HIDServiceProperties.appleVendorSupported.modify(void *a1))(uint64_t a1)
{
  OUTLINED_FUNCTION_20_10(a1);
  uint64_t v1 = HIDServiceProperties.appleVendorSupported.getter();
  OUTLINED_FUNCTION_21_8(v1);
  return sub_260857344;
}

uint64_t sub_260857344(uint64_t a1)
{
  char v1 = OUTLINED_FUNCTION_8_15(a1);
  return OUTLINED_FUNCTION_149(v1);
}

uint64_t HIDServiceProperties.authenticatedDevice.getter(uint64_t a1, uint64_t a2)
{
  return sub_260857450(a1, a2, 0x69746E6568747541, 0xED00006465746163);
}

uint64_t sub_260857394@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = HIDServiceProperties.authenticatedDevice.getter(a1, *(void *)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t HIDServiceProperties.authenticatedDevice.setter()
{
  OUTLINED_FUNCTION_109();
  return HIDServiceProperties.subscript.setter(v0);
}

uint64_t (*HIDServiceProperties.authenticatedDevice.modify(void *a1))(uint64_t a1)
{
  char v1 = OUTLINED_FUNCTION_20_10(a1);
  uint64_t v3 = HIDServiceProperties.authenticatedDevice.getter((uint64_t)v1, v2);
  OUTLINED_FUNCTION_21_8(v3);
  return sub_260857410;
}

uint64_t sub_260857410(uint64_t a1)
{
  OUTLINED_FUNCTION_8_15(a1);
  OUTLINED_FUNCTION_109();
  return HIDServiceProperties.subscript.setter(v1);
}

uint64_t HIDServiceProperties.builtIn.getter(uint64_t a1, uint64_t a2)
{
  return sub_260857450(a1, a2, 0x6E492D746C697542, 0xE800000000000000);
}

uint64_t sub_260857450(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v16[0] = a3;
  v16[1] = a4;
  uint64_t v5 = sub_26087BC00();
  id v6 = OUTLINED_FUNCTION_16_13(v5, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (a2)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v7 = swift_unknownObjectRelease();
  }
  else
  {
    double v11 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v7, v8, &qword_26A8B4998, v9, v10, v11);
  if (v16[3])
  {
    OUTLINED_FUNCTION_7_20();
    OUTLINED_FUNCTION_21_10();
    if (v14) {
      return v13;
    }
    else {
      return v12;
    }
  }
  else
  {
    sub_2608634B4((uint64_t)v16, &qword_26A8B4998);
    return 2;
  }
}

uint64_t sub_260857510@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = HIDServiceProperties.builtIn.getter(a1, *(void *)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t HIDServiceProperties.builtIn.setter(char a1)
{
  return HIDServiceProperties.subscript.setter(a1);
}

uint64_t (*HIDServiceProperties.builtIn.modify(void *a1))(uint64_t a1)
{
  char v1 = OUTLINED_FUNCTION_20_10(a1);
  uint64_t v3 = HIDServiceProperties.builtIn.getter((uint64_t)v1, v2);
  OUTLINED_FUNCTION_21_8(v3);
  return sub_260857594;
}

uint64_t sub_260857594(uint64_t a1)
{
  char v1 = OUTLINED_FUNCTION_8_15(a1);
  return HIDServiceProperties.subscript.setter(v1);
}

uint64_t HIDServiceProperties.capsLockDelay.getter()
{
  OUTLINED_FUNCTION_70_1();
  return sub_260858974(v0, v1, v2, v3);
}

uint64_t sub_2608575DC()
{
  return HIDServiceProperties.capsLockDelay.setter();
}

uint64_t HIDServiceProperties.capsLockDelay.setter()
{
  OUTLINED_FUNCTION_70_1();
  return HIDServiceProperties.subscript.setter(v0, v1);
}

uint64_t (*HIDServiceProperties.capsLockDelay.modify(uint64_t a1))()
{
  OUTLINED_FUNCTION_2_37(a1);
  uint64_t v1 = HIDServiceProperties.capsLockDelay.getter();
  OUTLINED_FUNCTION_17_10(v1, v2);
  return sub_260857664;
}

uint64_t sub_260857664()
{
  OUTLINED_FUNCTION_70_1();
  return sub_26085B598(v0);
}

uint64_t HIDServiceProperties.capsLockLanguageSwitch.getter(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1_35();
  uint64_t v3 = sub_26087BC00();
  id v4 = OUTLINED_FUNCTION_16_13(v3, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (a2)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v5 = swift_unknownObjectRelease();
  }
  else
  {
    double v9 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v5, v6, &qword_26A8B4998, v7, v8, v9);
  if (v15)
  {
    OUTLINED_FUNCTION_7_20();
    OUTLINED_FUNCTION_21_10();
    if (v12) {
      return v11;
    }
    else {
      return v10;
    }
  }
  else
  {
    sub_2608634B4((uint64_t)v14, &qword_26A8B4998);
    return 2;
  }
}

uint64_t sub_260857744@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = HIDServiceProperties.capsLockLanguageSwitch.getter(a1, *(void *)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t HIDServiceProperties.capsLockLanguageSwitch.setter(char a1)
{
  return OUTLINED_FUNCTION_13_12(a1);
}

uint64_t (*HIDServiceProperties.capsLockLanguageSwitch.modify(void *a1))(uint64_t a1)
{
  uint64_t v1 = OUTLINED_FUNCTION_20_10(a1);
  uint64_t v3 = HIDServiceProperties.capsLockLanguageSwitch.getter((uint64_t)v1, v2);
  OUTLINED_FUNCTION_21_8(v3);
  return sub_2608577C8;
}

uint64_t sub_2608577C8(uint64_t a1)
{
  char v1 = OUTLINED_FUNCTION_8_15(a1);
  return HIDServiceProperties.subscript.setter(v1);
}

uint64_t sub_260857804@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = HIDServiceProperties.deviceTypeHint.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t HIDServiceProperties.deviceTypeHint.setter()
{
  OUTLINED_FUNCTION_71_0();
  return HIDServiceProperties.subscript.setter(v0, v1);
}

uint64_t (*HIDServiceProperties.deviceTypeHint.modify(uint64_t a1))()
{
  OUTLINED_FUNCTION_2_37(a1);
  *uint64_t v1 = HIDServiceProperties.deviceTypeHint.getter();
  v1[1] = v2;
  return sub_260857884;
}

uint64_t sub_260857884()
{
  OUTLINED_FUNCTION_71_0();
  return sub_26085ABE4(v0, v1);
}

uint64_t sub_260857894@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = HIDServiceProperties.deviceUsagePairs.getter();
  *a1 = result;
  return result;
}

uint64_t sub_2608578C0()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return HIDServiceProperties.deviceUsagePairs.setter(v0);
}

uint64_t HIDServiceProperties.deviceUsagePairs.setter(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_26087B890();
    sub_26081221C(0, &qword_26A8B5448);
    uint64_t v3 = (unsigned __int16 *)(a1 + 34);
    uint64_t v4 = MEMORY[0x263F8D310];
    uint64_t v5 = MEMORY[0x263F8D6C8];
    do
    {
      uint64_t v6 = *(v3 - 1);
      unsigned int v7 = *v3;
      v3 += 2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B5470);
      uint64_t v8 = swift_allocObject();
      *(_OWORD *)(v8 + 16) = xmmword_26087EEC0;
      *(void *)(v8 + 32) = 0x7355656369766544;
      *(void *)(v8 + 40) = 0xEB00000000656761;
      *(void *)(v8 + 56) = v4;
      *(void *)(v8 + 64) = v7;
      *(void *)(v8 + 88) = v5;
      *(void *)(v8 + 96) = 0x7355656369766544;
      *(void *)(v8 + 104) = 0xEF65676150656761;
      *(void *)(v8 + 152) = v5;
      *(void *)(v8 + 120) = v4;
      *(void *)(v8 + 128) = v6;
      sub_26087B4F0();
      sub_26087B860();
      sub_26087B8A0();
      sub_26087B8B0();
      sub_26087B870();
      --v2;
    }
    while (v2);
  }
  swift_bridgeObjectRelease();
  sub_26081221C(0, &qword_26A8B5448);
  uint64_t v9 = sub_26087B3E0();
  swift_bridgeObjectRelease();
  return HIDServiceProperties.subscript.setter(v9, 0xD000000000000010, 0x8000000260884640);
}

uint64_t sub_260857AD0(void *a1)
{
  *(void *)&long long v7 = 0x7355656369766544;
  *((void *)&v7 + 1) = 0xEB00000000656761;
  id v2 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_26087BC00());
  swift_unknownObjectRelease();
  if (v2)
  {
    sub_26087B730();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v7 = 0u;
    long long v8 = 0u;
  }
  sub_260860824((uint64_t)&v7, (uint64_t)v9, &qword_26A8B4998);
  if (!v10)
  {

LABEL_14:
    sub_2608634B4((uint64_t)v9, &qword_26A8B4998);
    return 0;
  }
  if (swift_dynamicCast())
  {
    uint64_t v3 = v6;
    *(void *)&long long v7 = 0x7355656369766544;
    *((void *)&v7 + 1) = 0xEF65676150656761;
    id v4 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_26087BC00());
    swift_unknownObjectRelease();
    if (v4)
    {
      sub_26087B730();
      swift_unknownObjectRelease();
    }
    else
    {

      long long v7 = 0u;
      long long v8 = 0u;
    }
    sub_260860824((uint64_t)&v7, (uint64_t)v9, &qword_26A8B4998);
    if (v10)
    {
      if (swift_dynamicCast()) {
        return v3;
      }
      return 0;
    }
    goto LABEL_14;
  }

  return 0;
}

uint64_t (*HIDServiceProperties.deviceUsagePairs.modify(uint64_t a1))(uint64_t *a1, char a2)
{
  OUTLINED_FUNCTION_96_0(a1);
  *char v1 = HIDServiceProperties.deviceUsagePairs.getter();
  return sub_260857D04;
}

uint64_t sub_260857D04(uint64_t *a1, char a2)
{
  if ((a2 & 1) == 0) {
    return HIDServiceProperties.deviceUsagePairs.setter(*a1);
  }
  uint64_t v2 = swift_bridgeObjectRetain();
  HIDServiceProperties.deviceUsagePairs.setter(v2);
  return swift_bridgeObjectRelease();
}

uint64_t HIDServiceProperties.disableAccessibilityEventTranslation.getter(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1_35();
  uint64_t v3 = sub_26087BC00();
  id v4 = OUTLINED_FUNCTION_16_13(v3, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (a2)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v5 = swift_unknownObjectRelease();
  }
  else
  {
    double v9 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v5, v6, &qword_26A8B4998, v7, v8, v9);
  if (v15)
  {
    OUTLINED_FUNCTION_7_20();
    OUTLINED_FUNCTION_21_10();
    if (v12) {
      return v11;
    }
    else {
      return v10;
    }
  }
  else
  {
    sub_2608634B4((uint64_t)v14, &qword_26A8B4998);
    return 2;
  }
}

uint64_t sub_260857E2C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = HIDServiceProperties.disableAccessibilityEventTranslation.getter(a1, *(void *)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t HIDServiceProperties.disableAccessibilityEventTranslation.setter(char a1)
{
  return OUTLINED_FUNCTION_13_12(a1);
}

uint64_t (*HIDServiceProperties.disableAccessibilityEventTranslation.modify(void *a1))(uint64_t a1)
{
  char v1 = OUTLINED_FUNCTION_20_10(a1);
  uint64_t v3 = HIDServiceProperties.disableAccessibilityEventTranslation.getter((uint64_t)v1, v2);
  OUTLINED_FUNCTION_21_8(v3);
  return sub_260857EB0;
}

uint64_t sub_260857EB0(uint64_t a1)
{
  char v1 = OUTLINED_FUNCTION_8_15(a1);
  return HIDServiceProperties.subscript.setter(v1);
}

uint64_t sub_260857EEC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = HIDServiceProperties.dispatchScrollEvents.getter();
  *a1 = result;
  return result;
}

uint64_t HIDServiceProperties.dispatchScrollEvents.setter(char a1)
{
  return OUTLINED_FUNCTION_13_12(a1);
}

uint64_t (*HIDServiceProperties.dispatchScrollEvents.modify(void *a1))(uint64_t a1)
{
  OUTLINED_FUNCTION_20_10(a1);
  uint64_t v1 = HIDServiceProperties.dispatchScrollEvents.getter();
  OUTLINED_FUNCTION_21_8(v1);
  return sub_260857F70;
}

uint64_t sub_260857F70(uint64_t a1)
{
  char v1 = OUTLINED_FUNCTION_8_15(a1);
  return OUTLINED_FUNCTION_149(v1);
}

uint64_t HIDServiceProperties.displayIdentifier.getter()
{
  OUTLINED_FUNCTION_90_0();
  return sub_260854C40(v0, v1, v2, v3);
}

uint64_t sub_260857FAC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = HIDServiceProperties.displayIdentifier.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t HIDServiceProperties.displayIdentifier.setter()
{
  OUTLINED_FUNCTION_90_0();
  return HIDServiceProperties.subscript.setter(v0, v1);
}

uint64_t (*HIDServiceProperties.displayIdentifier.modify(uint64_t a1))()
{
  OUTLINED_FUNCTION_2_37(a1);
  *uint64_t v1 = HIDServiceProperties.displayIdentifier.getter();
  v1[1] = v2;
  return sub_26085802C;
}

uint64_t sub_26085802C()
{
  OUTLINED_FUNCTION_90_0();
  return sub_26085ABE4(v0, v1);
}

uint64_t HIDServiceProperties.displayIntegrated.getter()
{
  OUTLINED_FUNCTION_130();
  OUTLINED_FUNCTION_1_35();
  uint64_t v1 = sub_26087BC00();
  id v2 = OUTLINED_FUNCTION_16_13(v1, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (v0)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v3 = swift_unknownObjectRelease();
  }
  else
  {
    double v7 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v3, v4, &qword_26A8B4998, v5, v6, v7);
  if (v13)
  {
    OUTLINED_FUNCTION_7_20();
    OUTLINED_FUNCTION_21_10();
    if (v10) {
      return v9;
    }
    else {
      return v8;
    }
  }
  else
  {
    sub_2608634B4((uint64_t)v12, &qword_26A8B4998);
    return 2;
  }
}

uint64_t sub_260858104@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = HIDServiceProperties.displayIntegrated.getter();
  *a1 = result;
  return result;
}

uint64_t HIDServiceProperties.displayIntegrated.setter(char a1)
{
  return OUTLINED_FUNCTION_13_12(a1);
}

uint64_t (*HIDServiceProperties.displayIntegrated.modify(void *a1))(uint64_t a1)
{
  OUTLINED_FUNCTION_20_10(a1);
  uint64_t v1 = HIDServiceProperties.displayIntegrated.getter();
  OUTLINED_FUNCTION_21_8(v1);
  return sub_260858188;
}

uint64_t sub_260858188(uint64_t a1)
{
  OUTLINED_FUNCTION_8_15(a1);
  OUTLINED_FUNCTION_122();
  return HIDServiceProperties.subscript.setter(v1);
}

uint64_t HIDServiceProperties.eventServiceProperties.getter(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1_35();
  uint64_t v3 = sub_26087BC00();
  id v4 = OUTLINED_FUNCTION_16_13(v3, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (a2)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v5 = swift_unknownObjectRelease();
  }
  else
  {
    double v9 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v5, v6, &qword_26A8B4998, v7, v8, v9);
  if (v13)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B5450);
    if (OUTLINED_FUNCTION_3_30()) {
      return v11;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_2608634B4((uint64_t)v12, &qword_26A8B4998);
    return 0;
  }
}

uint64_t sub_26085828C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = HIDServiceProperties.eventServiceProperties.getter(a1, *(void *)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_2608582B8()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return HIDServiceProperties.eventServiceProperties.setter(v0);
}

uint64_t (*HIDServiceProperties.eventServiceProperties.modify(uint64_t a1))(uint64_t *a1, char a2)
{
  uint64_t v2 = OUTLINED_FUNCTION_96_0(a1);
  *char v1 = HIDServiceProperties.eventServiceProperties.getter(v2, v3);
  return sub_260858328;
}

uint64_t sub_260858328(uint64_t *a1, char a2)
{
  if ((a2 & 1) == 0) {
    return HIDServiceProperties.subscript.setter(*a1);
  }
  uint64_t v2 = swift_bridgeObjectRetain();
  HIDServiceProperties.subscript.setter(v2);
  return swift_bridgeObjectRelease();
}

uint64_t HIDServiceProperties.exclusivityIdentifier.getter()
{
  OUTLINED_FUNCTION_133();
  OUTLINED_FUNCTION_1_35();
  uint64_t v1 = sub_26087BC00();
  id v2 = OUTLINED_FUNCTION_16_13(v1, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (v0)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v3 = swift_unknownObjectRelease();
  }
  else
  {
    double v7 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v3, v4, &qword_26A8B4998, v5, v6, v7);
  if (v19)
  {
    int v8 = OUTLINED_FUNCTION_7_20();
    return OUTLINED_FUNCTION_24_5(v8, v9, v10, v11, v12, v13, v14, v15, v17);
  }
  else
  {
    sub_2608634B4((uint64_t)v18, &qword_26A8B4998);
    return OUTLINED_FUNCTION_110();
  }
}

uint64_t sub_260858478@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = HIDServiceProperties.exclusivityIdentifier.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t HIDServiceProperties.exclusivityIdentifier.setter(uint64_t a1, uint64_t a2)
{
  return OUTLINED_FUNCTION_34_1(a1, a2);
}

uint64_t (*HIDServiceProperties.exclusivityIdentifier.modify(uint64_t a1))(uint64_t a1, char a2)
{
  OUTLINED_FUNCTION_2_37(a1);
  *uint64_t v1 = HIDServiceProperties.exclusivityIdentifier.getter();
  v1[1] = v2;
  return sub_260858500;
}

uint64_t sub_260858500(uint64_t a1, char a2)
{
  return OUTLINED_FUNCTION_33_1(a1, a2);
}

uint64_t HIDServiceProperties.faceTimeRemoteControlSessionID.getter()
{
  OUTLINED_FUNCTION_101_0();
  OUTLINED_FUNCTION_1_35();
  uint64_t v1 = sub_26087BC00();
  id v2 = OUTLINED_FUNCTION_16_13(v1, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (v0)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v3 = swift_unknownObjectRelease();
  }
  else
  {
    double v7 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v3, v4, &qword_26A8B4998, v5, v6, v7);
  if (v20)
  {
    int v8 = OUTLINED_FUNCTION_3_30();
    return OUTLINED_FUNCTION_6_25(v8, v9, v10, v11, v12, v13, v14, v15, v17, v18);
  }
  else
  {
    sub_2608634B4((uint64_t)v19, &qword_26A8B4998);
    return OUTLINED_FUNCTION_41();
  }
}

uint64_t sub_2608585D4(uint64_t a1)
{
  return HIDServiceProperties.faceTimeRemoteControlSessionID.setter(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t HIDServiceProperties.faceTimeRemoteControlSessionID.setter(uint64_t a1, char a2)
{
  return OUTLINED_FUNCTION_11_14(a1, a2 & 1);
}

uint64_t (*HIDServiceProperties.faceTimeRemoteControlSessionID.modify(uint64_t a1))(uint64_t a1)
{
  OUTLINED_FUNCTION_2_37(a1);
  uint64_t v1 = HIDServiceProperties.faceTimeRemoteControlSessionID.getter();
  OUTLINED_FUNCTION_17_10(v1, v2);
  return sub_260858664;
}

uint64_t sub_260858664(uint64_t a1)
{
  return OUTLINED_FUNCTION_12_15(a1);
}

uint64_t HIDServiceProperties.fnKeyboardUsageMap.getter(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1_35();
  uint64_t v3 = sub_26087BC00();
  id v4 = OUTLINED_FUNCTION_16_13(v3, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (a2)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v5 = swift_unknownObjectRelease();
  }
  else
  {
    double v9 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v5, v6, &qword_26A8B4998, v7, v8, v9);
  if (v21)
  {
    int v10 = OUTLINED_FUNCTION_7_20();
    return OUTLINED_FUNCTION_24_5(v10, v11, v12, v13, v14, v15, v16, v17, v19);
  }
  else
  {
    sub_2608634B4((uint64_t)v20, &qword_26A8B4998);
    return OUTLINED_FUNCTION_110();
  }
}

uint64_t sub_26085874C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = HIDServiceProperties.fnKeyboardUsageMap.getter(a1, *(void *)(a1 + 8));
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t (*HIDServiceProperties.fnKeyboardUsageMap.modify(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v2 = OUTLINED_FUNCTION_2_37(a1);
  *uint64_t v1 = HIDServiceProperties.fnKeyboardUsageMap.getter(v2, v3);
  v1[1] = v4;
  return sub_2608587BC;
}

uint64_t sub_2608587BC(uint64_t a1, char a2)
{
  return OUTLINED_FUNCTION_33_1(a1, a2);
}

uint64_t HIDServiceProperties.ignoresNaturalScrollingPreference.getter(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1_35();
  uint64_t v3 = sub_26087BC00();
  id v4 = OUTLINED_FUNCTION_16_13(v3, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (a2)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v5 = swift_unknownObjectRelease();
  }
  else
  {
    double v9 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v5, v6, &qword_26A8B4998, v7, v8, v9);
  if (v15)
  {
    OUTLINED_FUNCTION_7_20();
    OUTLINED_FUNCTION_21_10();
    if (v12) {
      return v11;
    }
    else {
      return v10;
    }
  }
  else
  {
    sub_2608634B4((uint64_t)v14, &qword_26A8B4998);
    return 2;
  }
}

uint64_t sub_2608588A4@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = HIDServiceProperties.ignoresNaturalScrollingPreference.getter(a1, *(void *)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t HIDServiceProperties.ignoresNaturalScrollingPreference.setter(char a1)
{
  return OUTLINED_FUNCTION_13_12(a1);
}

uint64_t (*HIDServiceProperties.ignoresNaturalScrollingPreference.modify(void *a1))(uint64_t a1)
{
  uint64_t v1 = OUTLINED_FUNCTION_20_10(a1);
  uint64_t v3 = HIDServiceProperties.ignoresNaturalScrollingPreference.getter((uint64_t)v1, v2);
  OUTLINED_FUNCTION_21_8(v3);
  return sub_260858928;
}

uint64_t sub_260858928(uint64_t a1)
{
  char v1 = OUTLINED_FUNCTION_8_15(a1);
  return HIDServiceProperties.subscript.setter(v1);
}

uint64_t HIDServiceProperties.keyboardCountryCode.getter()
{
  OUTLINED_FUNCTION_87_0();
  return sub_260858974(v0, v1, v2, v3);
}

uint64_t sub_260858974(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v23[0] = a3;
  v23[1] = a4;
  uint64_t v5 = sub_26087BC00();
  id v6 = OUTLINED_FUNCTION_16_13(v5, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (a2)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v7 = swift_unknownObjectRelease();
  }
  else
  {
    double v11 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v7, v8, &qword_26A8B4998, v9, v10, v11);
  if (v23[3])
  {
    int v12 = OUTLINED_FUNCTION_3_30();
    return OUTLINED_FUNCTION_6_25(v12, v13, v14, v15, v16, v17, v18, v19, v21, v22);
  }
  else
  {
    sub_2608634B4((uint64_t)v23, &qword_26A8B4998);
    return OUTLINED_FUNCTION_41();
  }
}

uint64_t sub_260858A28()
{
  return HIDServiceProperties.keyboardCountryCode.setter();
}

uint64_t HIDServiceProperties.keyboardCountryCode.setter()
{
  OUTLINED_FUNCTION_87_0();
  return HIDServiceProperties.subscript.setter(v0, v1);
}

uint64_t (*HIDServiceProperties.keyboardCountryCode.modify(uint64_t a1))()
{
  OUTLINED_FUNCTION_2_37(a1);
  uint64_t v1 = HIDServiceProperties.keyboardCountryCode.getter();
  OUTLINED_FUNCTION_17_10(v1, v2);
  return sub_260858AB0;
}

uint64_t sub_260858AB0()
{
  OUTLINED_FUNCTION_87_0();
  return sub_26085B598(v0);
}

uint64_t HIDServiceProperties.keyboardLanguage.getter()
{
  OUTLINED_FUNCTION_131();
  OUTLINED_FUNCTION_1_35();
  uint64_t v1 = sub_26087BC00();
  id v2 = OUTLINED_FUNCTION_16_13(v1, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (v0)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v3 = swift_unknownObjectRelease();
  }
  else
  {
    double v7 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v3, v4, &qword_26A8B4998, v5, v6, v7);
  if (v19)
  {
    int v8 = OUTLINED_FUNCTION_7_20();
    return OUTLINED_FUNCTION_24_5(v8, v9, v10, v11, v12, v13, v14, v15, v17);
  }
  else
  {
    sub_2608634B4((uint64_t)v18, &qword_26A8B4998);
    return OUTLINED_FUNCTION_110();
  }
}

uint64_t sub_260858B88@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = HIDServiceProperties.keyboardLanguage.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t HIDServiceProperties.keyboardLanguage.setter(uint64_t a1, uint64_t a2)
{
  return OUTLINED_FUNCTION_34_1(a1, a2);
}

uint64_t (*HIDServiceProperties.keyboardLanguage.modify(uint64_t a1))(uint64_t a1, char a2)
{
  OUTLINED_FUNCTION_2_37(a1);
  *uint64_t v1 = HIDServiceProperties.keyboardLanguage.getter();
  v1[1] = v2;
  return sub_260858C10;
}

uint64_t sub_260858C10(uint64_t a1, char a2)
{
  return OUTLINED_FUNCTION_33_1(a1, a2);
}

uint64_t HIDServiceProperties.keyboardStandardType.getter()
{
  OUTLINED_FUNCTION_86_0();
  return sub_260858974(v0, v1, v2, v3);
}

uint64_t sub_260858C38()
{
  return HIDServiceProperties.keyboardStandardType.setter();
}

uint64_t HIDServiceProperties.keyboardStandardType.setter()
{
  OUTLINED_FUNCTION_86_0();
  return HIDServiceProperties.subscript.setter(v0, v1);
}

uint64_t (*HIDServiceProperties.keyboardStandardType.modify(uint64_t a1))()
{
  OUTLINED_FUNCTION_2_37(a1);
  uint64_t v1 = HIDServiceProperties.keyboardStandardType.getter();
  OUTLINED_FUNCTION_17_10(v1, v2);
  return sub_260858CC0;
}

uint64_t sub_260858CC0()
{
  OUTLINED_FUNCTION_86_0();
  return sub_26085B598(v0);
}

uint64_t HIDServiceProperties.manufacturer.getter()
{
  OUTLINED_FUNCTION_85_0();
  return sub_260854C40(v0, v1, v2, v3);
}

uint64_t sub_260858CE0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = HIDServiceProperties.manufacturer.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t HIDServiceProperties.manufacturer.setter()
{
  OUTLINED_FUNCTION_85_0();
  return HIDServiceProperties.subscript.setter(v0, v1);
}

uint64_t (*HIDServiceProperties.manufacturer.modify(uint64_t a1))()
{
  OUTLINED_FUNCTION_2_37(a1);
  *uint64_t v1 = HIDServiceProperties.manufacturer.getter();
  v1[1] = v2;
  return sub_260858D60;
}

uint64_t sub_260858D60()
{
  OUTLINED_FUNCTION_85_0();
  return sub_26085ABE4(v0, v1);
}

uint64_t sub_260858D70(uint64_t a1)
{
  return HIDServiceProperties.mouseAcceleration.setter(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t HIDServiceProperties.mouseAcceleration.setter(uint64_t a1, char a2)
{
  return OUTLINED_FUNCTION_11_14(a1, a2 & 1);
}

uint64_t (*HIDServiceProperties.mouseAcceleration.modify(uint64_t a1))(uint64_t a1)
{
  OUTLINED_FUNCTION_2_37(a1);
  uint64_t v1 = HIDServiceProperties.mouseAcceleration.getter();
  OUTLINED_FUNCTION_17_10(v1, v2);
  return sub_260858E00;
}

uint64_t sub_260858E00(uint64_t a1)
{
  return OUTLINED_FUNCTION_12_15(a1);
}

uint64_t sub_260858E18(uint64_t a1)
{
  return HIDServiceProperties.mouseScrollAcceleration.setter(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t HIDServiceProperties.mouseScrollAcceleration.setter(uint64_t a1, char a2)
{
  return OUTLINED_FUNCTION_11_14(a1, a2 & 1);
}

uint64_t (*HIDServiceProperties.mouseScrollAcceleration.modify(uint64_t a1))(uint64_t a1)
{
  OUTLINED_FUNCTION_2_37(a1);
  uint64_t v1 = HIDServiceProperties.mouseScrollAcceleration.getter();
  OUTLINED_FUNCTION_17_10(v1, v2);
  return sub_260858EA8;
}

uint64_t sub_260858EA8(uint64_t a1)
{
  return OUTLINED_FUNCTION_12_15(a1);
}

uint64_t HIDServiceProperties.platformInputModeConfiguration.getter()
{
  OUTLINED_FUNCTION_101_0();
  OUTLINED_FUNCTION_1_35();
  uint64_t v1 = sub_26087BC00();
  id v2 = OUTLINED_FUNCTION_16_13(v1, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (v0)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v3 = swift_unknownObjectRelease();
  }
  else
  {
    double v7 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v3, v4, &qword_26A8B4998, v5, v6, v7);
  if (v19)
  {
    int v8 = OUTLINED_FUNCTION_7_20();
    return OUTLINED_FUNCTION_24_5(v8, v9, v10, v11, v12, v13, v14, v15, v17);
  }
  else
  {
    sub_2608634B4((uint64_t)v18, &qword_26A8B4998);
    return OUTLINED_FUNCTION_163();
  }
}

uint64_t sub_260858F8C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = HIDServiceProperties.platformInputModeConfiguration.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_260858FB8(uint64_t *a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = a1[1];
  sub_2608347E8(*a1, v2);
  return HIDServiceProperties.platformInputModeConfiguration.setter(v1, v2);
}

uint64_t HIDServiceProperties.platformInputModeConfiguration.setter(uint64_t a1, unint64_t a2)
{
  return OUTLINED_FUNCTION_47_1(a1, a2, 30, 0x8000000260884F80);
}

uint64_t (*HIDServiceProperties.platformInputModeConfiguration.modify(uint64_t a1))(uint64_t *a1, char a2)
{
  OUTLINED_FUNCTION_2_37(a1);
  *uint64_t v1 = HIDServiceProperties.platformInputModeConfiguration.getter();
  v1[1] = v2;
  return sub_260859058;
}

uint64_t sub_260859058(uint64_t *a1, char a2)
{
  return OUTLINED_FUNCTION_46_1(a1, a2);
}

uint64_t HIDServiceProperties.pointerAccelerationMultiplier.getter(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1_35();
  uint64_t v3 = sub_26087BC00();
  id v4 = OUTLINED_FUNCTION_16_13(v3, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (a2)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v5 = swift_unknownObjectRelease();
  }
  else
  {
    double v9 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v5, v6, &qword_26A8B4998, v7, v8, v9);
  if (v22)
  {
    int v10 = OUTLINED_FUNCTION_3_30();
    return OUTLINED_FUNCTION_6_25(v10, v11, v12, v13, v14, v15, v16, v17, v19, v20);
  }
  else
  {
    sub_2608634B4((uint64_t)v21, &qword_26A8B4998);
    return OUTLINED_FUNCTION_41();
  }
}

uint64_t sub_260859134(uint64_t a1)
{
  return HIDServiceProperties.pointerAccelerationMultiplier.setter(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t HIDServiceProperties.pointerAccelerationMultiplier.setter(uint64_t a1, char a2)
{
  return OUTLINED_FUNCTION_11_14(a1, a2 & 1);
}

uint64_t (*HIDServiceProperties.pointerAccelerationMultiplier.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1 = OUTLINED_FUNCTION_2_37(a1);
  uint64_t v3 = HIDServiceProperties.pointerAccelerationMultiplier.getter(v1, v2);
  OUTLINED_FUNCTION_17_10(v3, v4);
  return sub_2608591C4;
}

uint64_t sub_2608591C4(uint64_t a1)
{
  return OUTLINED_FUNCTION_12_15(a1);
}

uint64_t HIDServiceProperties.pointerAccelerationTable.getter(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1_35();
  uint64_t v3 = sub_26087BC00();
  id v4 = OUTLINED_FUNCTION_16_13(v3, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (a2)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v5 = swift_unknownObjectRelease();
  }
  else
  {
    double v9 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v5, v6, &qword_26A8B4998, v7, v8, v9);
  if (v21)
  {
    int v10 = OUTLINED_FUNCTION_7_20();
    return OUTLINED_FUNCTION_24_5(v10, v11, v12, v13, v14, v15, v16, v17, v19);
  }
  else
  {
    sub_2608634B4((uint64_t)v20, &qword_26A8B4998);
    return OUTLINED_FUNCTION_163();
  }
}

uint64_t sub_2608592B0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = HIDServiceProperties.pointerAccelerationTable.getter(a1, *(void *)(a1 + 8));
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_2608592DC(uint64_t *a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = a1[1];
  sub_2608347E8(*a1, v2);
  return HIDServiceProperties.pointerAccelerationTable.setter(v1, v2);
}

uint64_t HIDServiceProperties.pointerAccelerationTable.setter(uint64_t a1, unint64_t a2)
{
  return OUTLINED_FUNCTION_47_1(a1, a2, 27, 0x8000000260884FF0);
}

uint64_t (*HIDServiceProperties.pointerAccelerationTable.modify(uint64_t a1))(uint64_t *a1, char a2)
{
  uint64_t v2 = OUTLINED_FUNCTION_2_37(a1);
  *uint64_t v1 = HIDServiceProperties.pointerAccelerationTable.getter(v2, v3);
  v1[1] = v4;
  return sub_26085937C;
}

uint64_t sub_26085937C(uint64_t *a1, char a2)
{
  return OUTLINED_FUNCTION_46_1(a1, a2);
}

uint64_t HIDServiceProperties.pointerAccelerationType.getter()
{
  OUTLINED_FUNCTION_132();
  OUTLINED_FUNCTION_1_35();
  uint64_t v1 = sub_26087BC00();
  id v2 = OUTLINED_FUNCTION_16_13(v1, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (v0)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v3 = swift_unknownObjectRelease();
  }
  else
  {
    double v7 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v3, v4, &qword_26A8B4998, v5, v6, v7);
  if (v19)
  {
    int v8 = OUTLINED_FUNCTION_7_20();
    return OUTLINED_FUNCTION_24_5(v8, v9, v10, v11, v12, v13, v14, v15, v17);
  }
  else
  {
    sub_2608634B4((uint64_t)v18, &qword_26A8B4998);
    return OUTLINED_FUNCTION_110();
  }
}

uint64_t sub_26085945C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = HIDServiceProperties.pointerAccelerationType.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t HIDServiceProperties.pointerAccelerationType.setter(uint64_t a1, uint64_t a2)
{
  return OUTLINED_FUNCTION_34_1(a1, a2);
}

uint64_t (*HIDServiceProperties.pointerAccelerationType.modify(uint64_t a1))(uint64_t a1, char a2)
{
  OUTLINED_FUNCTION_2_37(a1);
  *uint64_t v1 = HIDServiceProperties.pointerAccelerationType.getter();
  v1[1] = v2;
  return sub_2608594E4;
}

uint64_t sub_2608594E4(uint64_t a1, char a2)
{
  return OUTLINED_FUNCTION_33_1(a1, a2);
}

uint64_t HIDServiceProperties.pointerButtonCount.getter()
{
  OUTLINED_FUNCTION_133();
  OUTLINED_FUNCTION_1_35();
  uint64_t v1 = sub_26087BC00();
  id v2 = OUTLINED_FUNCTION_16_13(v1, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (v0)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v3 = swift_unknownObjectRelease();
  }
  else
  {
    double v7 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v3, v4, &qword_26A8B4998, v5, v6, v7);
  if (v20)
  {
    int v8 = OUTLINED_FUNCTION_3_30();
    return OUTLINED_FUNCTION_6_25(v8, v9, v10, v11, v12, v13, v14, v15, v17, v18);
  }
  else
  {
    sub_2608634B4((uint64_t)v19, &qword_26A8B4998);
    return OUTLINED_FUNCTION_41();
  }
}

uint64_t sub_2608595B8(uint64_t a1)
{
  return HIDServiceProperties.pointerButtonCount.setter(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t HIDServiceProperties.pointerButtonCount.setter(uint64_t a1, char a2)
{
  return OUTLINED_FUNCTION_11_14(a1, a2 & 1);
}

uint64_t (*HIDServiceProperties.pointerButtonCount.modify(uint64_t a1))(uint64_t a1)
{
  OUTLINED_FUNCTION_2_37(a1);
  uint64_t v1 = HIDServiceProperties.pointerButtonCount.getter();
  OUTLINED_FUNCTION_17_10(v1, v2);
  return sub_260859648;
}

uint64_t sub_260859648(uint64_t a1)
{
  return OUTLINED_FUNCTION_12_15(a1);
}

uint64_t sub_260859660(uint64_t a1)
{
  return HIDServiceProperties.pointerButtonMode.setter(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t HIDServiceProperties.pointerButtonMode.setter(uint64_t a1, char a2)
{
  return OUTLINED_FUNCTION_11_14(a1, a2 & 1);
}

uint64_t (*HIDServiceProperties.pointerButtonMode.modify(uint64_t a1))(uint64_t a1)
{
  OUTLINED_FUNCTION_2_37(a1);
  uint64_t v1 = HIDServiceProperties.pointerButtonMode.getter();
  OUTLINED_FUNCTION_17_10(v1, v2);
  return sub_2608596F0;
}

uint64_t sub_2608596F0(uint64_t a1)
{
  return OUTLINED_FUNCTION_12_15(a1);
}

uint64_t HIDServiceProperties.pointerResolution.getter()
{
  OUTLINED_FUNCTION_52_1();
  OUTLINED_FUNCTION_1_35();
  uint64_t v1 = sub_26087BC00();
  id v2 = OUTLINED_FUNCTION_16_13(v1, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (v0)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v3 = swift_unknownObjectRelease();
  }
  else
  {
    double v7 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v3, v4, &qword_26A8B4998, v5, v6, v7);
  if (v20)
  {
    int v8 = OUTLINED_FUNCTION_3_30();
    return OUTLINED_FUNCTION_6_25(v8, v9, v10, v11, v12, v13, v14, v15, v17, v18);
  }
  else
  {
    sub_2608634B4((uint64_t)v19, &qword_26A8B4998);
    return OUTLINED_FUNCTION_41();
  }
}

uint64_t sub_2608597C4(uint64_t a1)
{
  return HIDServiceProperties.pointerResolution.setter(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t HIDServiceProperties.pointerResolution.setter(uint64_t a1, char a2)
{
  return OUTLINED_FUNCTION_11_14(a1, a2 & 1);
}

uint64_t (*HIDServiceProperties.pointerResolution.modify(uint64_t a1))(uint64_t a1)
{
  OUTLINED_FUNCTION_2_37(a1);
  uint64_t v1 = HIDServiceProperties.pointerResolution.getter();
  OUTLINED_FUNCTION_17_10(v1, v2);
  return sub_260859854;
}

uint64_t sub_260859854(uint64_t a1)
{
  return OUTLINED_FUNCTION_12_15(a1);
}

uint64_t HIDServiceProperties.pointerReportRate.getter()
{
  OUTLINED_FUNCTION_52_1();
  OUTLINED_FUNCTION_1_35();
  uint64_t v1 = sub_26087BC00();
  id v2 = OUTLINED_FUNCTION_16_13(v1, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (v0)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v3 = swift_unknownObjectRelease();
  }
  else
  {
    double v7 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v3, v4, &qword_26A8B4998, v5, v6, v7);
  if (v20)
  {
    int v8 = OUTLINED_FUNCTION_3_30();
    return OUTLINED_FUNCTION_6_25(v8, v9, v10, v11, v12, v13, v14, v15, v17, v18);
  }
  else
  {
    sub_2608634B4((uint64_t)v19, &qword_26A8B4998);
    return OUTLINED_FUNCTION_41();
  }
}

uint64_t sub_260859928(uint64_t a1)
{
  return HIDServiceProperties.pointerReportRate.setter(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t HIDServiceProperties.pointerReportRate.setter(uint64_t a1, char a2)
{
  return OUTLINED_FUNCTION_11_14(a1, a2 & 1);
}

uint64_t (*HIDServiceProperties.pointerReportRate.modify(uint64_t a1))(uint64_t a1)
{
  OUTLINED_FUNCTION_2_37(a1);
  uint64_t v1 = HIDServiceProperties.pointerReportRate.getter();
  OUTLINED_FUNCTION_17_10(v1, v2);
  return sub_2608599B8;
}

uint64_t sub_2608599B8(uint64_t a1)
{
  return OUTLINED_FUNCTION_12_15(a1);
}

uint64_t sub_2608599D0@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = HIDServiceProperties.primaryUsagePair.getter();
  *a1 = result;
  return result;
}

uint64_t HIDServiceProperties.primaryUsagePair.setter()
{
  uint64_t v1 = *(void **)(v0 + 8);
  char v2 = (void *)sub_26087B4B0();
  objc_msgSend(v1, sel___swift_setObject_forKeyedSubscript_, v2, sub_26087BC00(), 0xD000000000000010, 0x8000000260885090);

  swift_unknownObjectRelease();
  uint64_t v3 = (void *)sub_26087B4B0();
  OUTLINED_FUNCTION_89_0();
  objc_msgSend(v1, sel___swift_setObject_forKeyedSubscript_, v3, sub_26087BC00(), v4, v5);

  return swift_unknownObjectRelease();
}

uint64_t (*HIDServiceProperties.primaryUsagePair.modify(void *a1))()
{
  OUTLINED_FUNCTION_20_10(a1);
  *(_DWORD *)(v1 + 8) = HIDServiceProperties.primaryUsagePair.getter();
  return sub_260859B24;
}

uint64_t sub_260859B24()
{
  return HIDServiceProperties.primaryUsagePair.setter();
}

uint64_t sub_260859B4C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = HIDServiceProperties.product.getter(a1, *(void *)(a1 + 8));
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t (*HIDServiceProperties.product.modify(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v2 = OUTLINED_FUNCTION_2_37(a1);
  *uint64_t v1 = HIDServiceProperties.product.getter(v2, v3);
  v1[1] = v4;
  return sub_260859BBC;
}

uint64_t sub_260859BBC(uint64_t a1, char a2)
{
  return sub_26085ABE4(a1, a2);
}

uint64_t HIDServiceProperties.productID.getter()
{
  OUTLINED_FUNCTION_127();
  return sub_260858974(v0, v1, v2, v3);
}

uint64_t sub_260859BE4()
{
  return HIDServiceProperties.productID.setter();
}

uint64_t HIDServiceProperties.productID.setter()
{
  OUTLINED_FUNCTION_127();
  return HIDServiceProperties.subscript.setter(v0, v1);
}

uint64_t (*HIDServiceProperties.productID.modify(uint64_t a1))()
{
  OUTLINED_FUNCTION_2_37(a1);
  uint64_t v1 = HIDServiceProperties.productID.getter();
  OUTLINED_FUNCTION_17_10(v1, v2);
  return sub_260859C6C;
}

uint64_t sub_260859C6C()
{
  OUTLINED_FUNCTION_127();
  return sub_26085B598(v0);
}

uint64_t HIDServiceProperties.reportDescriptor.getter()
{
  OUTLINED_FUNCTION_131();
  OUTLINED_FUNCTION_1_35();
  uint64_t v1 = sub_26087BC00();
  id v2 = OUTLINED_FUNCTION_16_13(v1, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (v0)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v3 = swift_unknownObjectRelease();
  }
  else
  {
    double v7 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v3, v4, &qword_26A8B4998, v5, v6, v7);
  if (v19)
  {
    int v8 = OUTLINED_FUNCTION_7_20();
    return OUTLINED_FUNCTION_24_5(v8, v9, v10, v11, v12, v13, v14, v15, v17);
  }
  else
  {
    sub_2608634B4((uint64_t)v18, &qword_26A8B4998);
    return OUTLINED_FUNCTION_163();
  }
}

uint64_t sub_260859D48@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = HIDServiceProperties.reportDescriptor.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_260859D74(uint64_t *a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = a1[1];
  sub_2608347E8(*a1, v2);
  return HIDServiceProperties.reportDescriptor.setter(v1, v2);
}

uint64_t HIDServiceProperties.reportDescriptor.setter(uint64_t a1, unint64_t a2)
{
  return OUTLINED_FUNCTION_47_1(a1, a2, 16, 0x80000002608850B0);
}

uint64_t (*HIDServiceProperties.reportDescriptor.modify(uint64_t a1))(uint64_t *a1, char a2)
{
  OUTLINED_FUNCTION_2_37(a1);
  *uint64_t v1 = HIDServiceProperties.reportDescriptor.getter();
  v1[1] = v2;
  return sub_260859E14;
}

uint64_t sub_260859E14(uint64_t *a1, char a2)
{
  return OUTLINED_FUNCTION_46_1(a1, a2);
}

uint64_t HIDServiceProperties.scrollAccelerationTable.getter()
{
  OUTLINED_FUNCTION_132();
  OUTLINED_FUNCTION_1_35();
  uint64_t v1 = sub_26087BC00();
  id v2 = OUTLINED_FUNCTION_16_13(v1, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (v0)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v3 = swift_unknownObjectRelease();
  }
  else
  {
    double v7 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v3, v4, &qword_26A8B4998, v5, v6, v7);
  if (v19)
  {
    int v8 = OUTLINED_FUNCTION_7_20();
    return OUTLINED_FUNCTION_24_5(v8, v9, v10, v11, v12, v13, v14, v15, v17);
  }
  else
  {
    sub_2608634B4((uint64_t)v18, &qword_26A8B4998);
    return OUTLINED_FUNCTION_163();
  }
}

uint64_t sub_260859EF8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = HIDServiceProperties.scrollAccelerationTable.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_260859F24(uint64_t *a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = a1[1];
  sub_2608347E8(*a1, v2);
  return HIDServiceProperties.scrollAccelerationTable.setter(v1, v2);
}

uint64_t HIDServiceProperties.scrollAccelerationTable.setter(uint64_t a1, unint64_t a2)
{
  return OUTLINED_FUNCTION_47_1(a1, a2, 26, 0x80000002608850D0);
}

uint64_t (*HIDServiceProperties.scrollAccelerationTable.modify(uint64_t a1))(uint64_t *a1, char a2)
{
  OUTLINED_FUNCTION_2_37(a1);
  *uint64_t v1 = HIDServiceProperties.scrollAccelerationTable.getter();
  v1[1] = v2;
  return sub_260859FC4;
}

uint64_t sub_260859FC4(uint64_t *a1, char a2)
{
  return OUTLINED_FUNCTION_46_1(a1, a2);
}

uint64_t sub_260859FDC(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if ((a2 & 1) == 0) {
    return OUTLINED_FUNCTION_155();
  }
  sub_2608347E8(*a1, v3);
  OUTLINED_FUNCTION_155();
  return sub_2608347D4(v2, v3);
}

uint64_t HIDServiceProperties.scrollAccelerationType.getter(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1_35();
  uint64_t v3 = sub_26087BC00();
  id v4 = OUTLINED_FUNCTION_16_13(v3, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (a2)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v5 = swift_unknownObjectRelease();
  }
  else
  {
    double v9 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v5, v6, &qword_26A8B4998, v7, v8, v9);
  if (v21)
  {
    int v10 = OUTLINED_FUNCTION_7_20();
    return OUTLINED_FUNCTION_24_5(v10, v11, v12, v13, v14, v15, v16, v17, v19);
  }
  else
  {
    sub_2608634B4((uint64_t)v20, &qword_26A8B4998);
    return OUTLINED_FUNCTION_110();
  }
}

uint64_t sub_26085A12C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = HIDServiceProperties.scrollAccelerationType.getter(a1, *(void *)(a1 + 8));
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t HIDServiceProperties.scrollAccelerationType.setter(uint64_t a1, uint64_t a2)
{
  return OUTLINED_FUNCTION_34_1(a1, a2);
}

uint64_t (*HIDServiceProperties.scrollAccelerationType.modify(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v2 = OUTLINED_FUNCTION_2_37(a1);
  *uint64_t v1 = HIDServiceProperties.scrollAccelerationType.getter(v2, v3);
  v1[1] = v4;
  return sub_26085A1B4;
}

uint64_t sub_26085A1B4(uint64_t a1, char a2)
{
  return OUTLINED_FUNCTION_33_1(a1, a2);
}

uint64_t HIDServiceProperties.scrollAccelParametricCurves.getter()
{
  OUTLINED_FUNCTION_52_1();
  OUTLINED_FUNCTION_126();
  uint64_t v1 = sub_26087BC00();
  id v2 = OUTLINED_FUNCTION_16_13(v1, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (v0)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v3 = swift_unknownObjectRelease();
  }
  else
  {
    double v7 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v3, v4, &qword_26A8B4998, v5, v6, v7);
  if (!v22)
  {
    sub_2608634B4((uint64_t)v21, &qword_26A8B4998);
    return 0;
  }
  sub_26081221C(0, &qword_26A8B49A0);
  if ((OUTLINED_FUNCTION_3_30() & 1) == 0) {
    return 0;
  }
  uint64_t v15 = (void *)v20;
  sub_2608549D8(v20, v8, v9, v10, v11, v12, v13, v14, v19, (NSDictionary)v20);
  uint64_t v17 = v16;

  return v17;
}

uint64_t sub_26085A2C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = HIDServiceProperties.scrollAccelParametricCurves.getter();
  *a1 = result;
  return result;
}

uint64_t sub_26085A2EC()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return HIDServiceProperties.scrollAccelParametricCurves.setter(v0);
}

uint64_t HIDServiceProperties.scrollAccelParametricCurves.setter(uint64_t a1)
{
  return sub_26085A334(a1, 0xD000000000000014, 0x8000000260885130);
}

uint64_t sub_26085A334(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1;
  if (a1)
  {
    uint64_t v6 = *(void *)(a1 + 16);
    if (v6)
    {
      sub_26087B890();
      uint64_t v7 = 32;
      do
      {
        memcpy(__dst, (const void *)(v5 + v7), sizeof(__dst));
        HIDServiceProperties.HIDAccelCurve.dictionaryRepresentation.getter();
        sub_26087B860();
        sub_26087B8A0();
        sub_26087B8B0();
        sub_26087B870();
        v7 += 144;
        --v6;
      }
      while (v6);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    sub_26081221C(0, &qword_26A8B5448);
    uint64_t v5 = sub_26087B3E0();
    swift_bridgeObjectRelease();
  }
  return HIDServiceProperties.subscript.setter(v5, a2, a3);
}

uint64_t (*HIDServiceProperties.scrollAccelParametricCurves.modify(uint64_t a1))(uint64_t *a1, char a2)
{
  OUTLINED_FUNCTION_96_0(a1);
  *uint64_t v1 = HIDServiceProperties.scrollAccelParametricCurves.getter();
  return sub_26085A4BC;
}

uint64_t sub_26085A4BC(uint64_t *a1, char a2)
{
  return sub_26085A4D4(a1, a2, HIDServiceProperties.scrollAccelParametricCurves.setter);
}

uint64_t sub_26085A4D4(uint64_t *a1, char a2, uint64_t (*a3)(uint64_t))
{
  if ((a2 & 1) == 0) {
    return a3(*a1);
  }
  uint64_t v4 = swift_bridgeObjectRetain();
  a3(v4);
  return swift_bridgeObjectRelease();
}

uint64_t HIDServiceProperties.scrollReportRate.getter(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1_35();
  uint64_t v3 = sub_26087BC00();
  id v4 = OUTLINED_FUNCTION_16_13(v3, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (a2)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v5 = swift_unknownObjectRelease();
  }
  else
  {
    double v9 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v5, v6, &qword_26A8B4998, v7, v8, v9);
  if (v22)
  {
    int v10 = OUTLINED_FUNCTION_3_30();
    return OUTLINED_FUNCTION_6_25(v10, v11, v12, v13, v14, v15, v16, v17, v19, v20);
  }
  else
  {
    sub_2608634B4((uint64_t)v21, &qword_26A8B4998);
    return OUTLINED_FUNCTION_41();
  }
}

uint64_t sub_26085A608(uint64_t a1)
{
  return HIDServiceProperties.scrollReportRate.setter(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t HIDServiceProperties.scrollReportRate.setter(uint64_t a1, char a2)
{
  return OUTLINED_FUNCTION_11_14(a1, a2 & 1);
}

uint64_t (*HIDServiceProperties.scrollReportRate.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1 = OUTLINED_FUNCTION_2_37(a1);
  uint64_t v3 = HIDServiceProperties.scrollReportRate.getter(v1, v2);
  OUTLINED_FUNCTION_17_10(v3, v4);
  return sub_26085A698;
}

uint64_t sub_26085A698(uint64_t a1)
{
  return OUTLINED_FUNCTION_12_15(a1);
}

uint64_t HIDServiceProperties.scrollResolution.getter(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1_35();
  uint64_t v3 = sub_26087BC00();
  id v4 = OUTLINED_FUNCTION_16_13(v3, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (a2)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v5 = swift_unknownObjectRelease();
  }
  else
  {
    double v9 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v5, v6, &qword_26A8B4998, v7, v8, v9);
  if (v22)
  {
    int v10 = OUTLINED_FUNCTION_3_30();
    return OUTLINED_FUNCTION_6_25(v10, v11, v12, v13, v14, v15, v16, v17, v19, v20);
  }
  else
  {
    sub_2608634B4((uint64_t)v21, &qword_26A8B4998);
    return OUTLINED_FUNCTION_41();
  }
}

uint64_t sub_26085A774(uint64_t a1)
{
  return HIDServiceProperties.scrollResolution.setter(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t HIDServiceProperties.scrollResolution.setter(uint64_t a1, char a2)
{
  return OUTLINED_FUNCTION_11_14(a1, a2 & 1);
}

uint64_t (*HIDServiceProperties.scrollResolution.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1 = OUTLINED_FUNCTION_2_37(a1);
  uint64_t v3 = HIDServiceProperties.scrollResolution.getter(v1, v2);
  OUTLINED_FUNCTION_17_10(v3, v4);
  return sub_26085A804;
}

uint64_t sub_26085A804(uint64_t a1)
{
  return OUTLINED_FUNCTION_12_15(a1);
}

uint64_t HIDServiceProperties.supportsGestureScrolling.getter(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1_35();
  uint64_t v3 = sub_26087BC00();
  id v4 = OUTLINED_FUNCTION_16_13(v3, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (a2)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v5 = swift_unknownObjectRelease();
  }
  else
  {
    double v9 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v5, v6, &qword_26A8B4998, v7, v8, v9);
  if (v15)
  {
    OUTLINED_FUNCTION_7_20();
    OUTLINED_FUNCTION_21_10();
    if (v12) {
      return v11;
    }
    else {
      return v10;
    }
  }
  else
  {
    sub_2608634B4((uint64_t)v14, &qword_26A8B4998);
    return 2;
  }
}

uint64_t sub_26085A8EC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = HIDServiceProperties.supportsGestureScrolling.getter(a1, *(void *)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t HIDServiceProperties.supportsGestureScrolling.setter(char a1)
{
  return OUTLINED_FUNCTION_13_12(a1);
}

uint64_t (*HIDServiceProperties.supportsGestureScrolling.modify(void *a1))(uint64_t a1)
{
  uint64_t v1 = OUTLINED_FUNCTION_20_10(a1);
  uint64_t v3 = HIDServiceProperties.supportsGestureScrolling.getter((uint64_t)v1, v2);
  OUTLINED_FUNCTION_21_8(v3);
  return sub_26085A970;
}

uint64_t sub_26085A970(uint64_t a1)
{
  char v1 = OUTLINED_FUNCTION_8_15(a1);
  return HIDServiceProperties.subscript.setter(v1);
}

uint64_t sub_26085A9AC(uint64_t a1)
{
  return HIDServiceProperties.trackpadAcceleration.setter(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t HIDServiceProperties.trackpadAcceleration.setter(uint64_t a1, char a2)
{
  return OUTLINED_FUNCTION_11_14(a1, a2 & 1);
}

uint64_t (*HIDServiceProperties.trackpadAcceleration.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1 = OUTLINED_FUNCTION_2_37(a1);
  uint64_t v3 = HIDServiceProperties.trackpadAcceleration.getter(v1, v2);
  OUTLINED_FUNCTION_17_10(v3, v4);
  return sub_26085AA3C;
}

uint64_t sub_26085AA3C(uint64_t a1)
{
  return OUTLINED_FUNCTION_12_15(a1);
}

uint64_t sub_26085AA54(uint64_t a1)
{
  return HIDServiceProperties.trackpadScrollAcceleration.setter(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t HIDServiceProperties.trackpadScrollAcceleration.setter(uint64_t a1, char a2)
{
  return OUTLINED_FUNCTION_11_14(a1, a2 & 1);
}

uint64_t (*HIDServiceProperties.trackpadScrollAcceleration.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1 = OUTLINED_FUNCTION_2_37(a1);
  uint64_t v3 = HIDServiceProperties.trackpadScrollAcceleration.getter(v1, v2);
  OUTLINED_FUNCTION_17_10(v3, v4);
  return sub_26085AAE4;
}

uint64_t sub_26085AAE4(uint64_t a1)
{
  return OUTLINED_FUNCTION_12_15(a1);
}

uint64_t HIDServiceProperties.transport.getter()
{
  OUTLINED_FUNCTION_113();
  return sub_260854C40(v0, v1, v2, v3);
}

uint64_t sub_26085AB0C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = HIDServiceProperties.transport.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_26085AB38(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  swift_bridgeObjectRetain();
  return a5(v6, v7);
}

uint64_t HIDServiceProperties.transport.setter()
{
  OUTLINED_FUNCTION_113();
  return HIDServiceProperties.subscript.setter(v0, v1);
}

uint64_t (*HIDServiceProperties.transport.modify(uint64_t a1))()
{
  OUTLINED_FUNCTION_2_37(a1);
  *uint64_t v1 = HIDServiceProperties.transport.getter();
  v1[1] = v2;
  return sub_26085ABD4;
}

uint64_t sub_26085ABD4()
{
  OUTLINED_FUNCTION_113();
  return sub_26085ABE4(v0, v1);
}

uint64_t sub_26085ABE4(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return OUTLINED_FUNCTION_153();
  }
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_153();
  return swift_bridgeObjectRelease();
}

uint64_t HIDServiceProperties.universalControlBuiltIn.getter(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1_35();
  uint64_t v3 = sub_26087BC00();
  id v4 = OUTLINED_FUNCTION_16_13(v3, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (a2)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v5 = swift_unknownObjectRelease();
  }
  else
  {
    double v9 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v5, v6, &qword_26A8B4998, v7, v8, v9);
  if (v15)
  {
    OUTLINED_FUNCTION_7_20();
    OUTLINED_FUNCTION_21_10();
    if (v12) {
      return v11;
    }
    else {
      return v10;
    }
  }
  else
  {
    sub_2608634B4((uint64_t)v14, &qword_26A8B4998);
    return 2;
  }
}

uint64_t sub_26085AD2C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = HIDServiceProperties.universalControlBuiltIn.getter(a1, *(void *)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t HIDServiceProperties.universalControlBuiltIn.setter(char a1)
{
  return OUTLINED_FUNCTION_13_12(a1);
}

uint64_t (*HIDServiceProperties.universalControlBuiltIn.modify(void *a1))(uint64_t a1)
{
  char v1 = OUTLINED_FUNCTION_20_10(a1);
  uint64_t v3 = HIDServiceProperties.universalControlBuiltIn.getter((uint64_t)v1, v2);
  OUTLINED_FUNCTION_21_8(v3);
  return sub_26085ADB0;
}

uint64_t sub_26085ADB0(uint64_t a1)
{
  char v1 = OUTLINED_FUNCTION_8_15(a1);
  return HIDServiceProperties.subscript.setter(v1);
}

uint64_t HIDServiceProperties.universalControlVirtualService.getter()
{
  OUTLINED_FUNCTION_101_0();
  OUTLINED_FUNCTION_1_35();
  uint64_t v1 = sub_26087BC00();
  id v2 = OUTLINED_FUNCTION_16_13(v1, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (v0)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v3 = swift_unknownObjectRelease();
  }
  else
  {
    double v7 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v3, v4, &qword_26A8B4998, v5, v6, v7);
  if (v13)
  {
    OUTLINED_FUNCTION_7_20();
    OUTLINED_FUNCTION_21_10();
    if (v10) {
      return v9;
    }
    else {
      return v8;
    }
  }
  else
  {
    sub_2608634B4((uint64_t)v12, &qword_26A8B4998);
    return 2;
  }
}

uint64_t sub_26085AEB4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = HIDServiceProperties.universalControlVirtualService.getter();
  *a1 = result;
  return result;
}

uint64_t (*HIDServiceProperties.universalControlVirtualService.modify(void *a1))(uint64_t a1)
{
  OUTLINED_FUNCTION_20_10(a1);
  uint64_t v1 = HIDServiceProperties.universalControlVirtualService.getter();
  OUTLINED_FUNCTION_21_8(v1);
  return sub_26085AF20;
}

uint64_t sub_26085AF20(uint64_t a1)
{
  char v1 = OUTLINED_FUNCTION_8_15(a1);
  return OUTLINED_FUNCTION_148(v1);
}

uint64_t HIDServiceProperties.userDeviceCreateInactive.getter(uint64_t a1, uint64_t a2)
{
  if (qword_26A8B4548 != -1) {
    swift_once();
  }
  v13[0] = qword_26A8B5008;
  v13[1] = unk_26A8B5010;
  swift_bridgeObjectRetain_n();
  uint64_t v3 = sub_26087BC00();
  id v4 = OUTLINED_FUNCTION_108_0(v3, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_74_0();
  if (a2)
  {
    OUTLINED_FUNCTION_61_1();
    uint64_t v5 = swift_unknownObjectRelease();
  }
  else
  {
    double v9 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v5, v6, &qword_26A8B4998, v7, v8, v9);
  if (!v13[3])
  {
    swift_bridgeObjectRelease();
    sub_2608634B4((uint64_t)v13, &qword_26A8B4998);
    return 2;
  }
  if ((OUTLINED_FUNCTION_7_20() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  uint64_t v10 = v12;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_26085B07C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = HIDServiceProperties.userDeviceCreateInactive.getter(a1, *(void *)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t HIDServiceProperties.userDeviceCreateInactive.setter(char a1)
{
  if (qword_26A8B4548 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return HIDServiceProperties.subscript.setter(a1);
}

uint64_t (*HIDServiceProperties.userDeviceCreateInactive.modify(void *a1))(uint64_t a1)
{
  char v1 = OUTLINED_FUNCTION_20_10(a1);
  uint64_t v3 = HIDServiceProperties.userDeviceCreateInactive.getter((uint64_t)v1, v2);
  OUTLINED_FUNCTION_21_8(v3);
  return sub_26085B170;
}

uint64_t sub_26085B170(uint64_t a1)
{
  char v1 = *(unsigned char *)(a1 + 8);
  if (qword_26A8B4548 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return HIDServiceProperties.subscript.setter(v1);
}

uint64_t sub_26085B1F4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = HIDServiceProperties.useRemoteAcceleration.getter();
  *a1 = result;
  return result;
}

uint64_t (*HIDServiceProperties.useRemoteAcceleration.modify(void *a1))(uint64_t a1)
{
  OUTLINED_FUNCTION_20_10(a1);
  uint64_t v1 = HIDServiceProperties.useRemoteAcceleration.getter();
  OUTLINED_FUNCTION_21_8(v1);
  return sub_26085B260;
}

uint64_t sub_26085B260(uint64_t a1)
{
  char v1 = OUTLINED_FUNCTION_8_15(a1);
  return HIDServiceProperties.subscript.setter(v1);
}

uint64_t HIDServiceProperties.vendorID.getter(uint64_t a1, uint64_t a2)
{
  return sub_260858974(a1, a2, 0x4449726F646E6556, 0xE800000000000000);
}

uint64_t sub_26085B2B4(uint64_t a1)
{
  return HIDServiceProperties.vendorID.setter(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t HIDServiceProperties.vendorID.setter(uint64_t a1, char a2)
{
  return HIDServiceProperties.subscript.setter(a1, a2 & 1);
}

uint64_t (*HIDServiceProperties.vendorID.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1 = OUTLINED_FUNCTION_2_37(a1);
  uint64_t v3 = HIDServiceProperties.vendorID.getter(v1, v2);
  OUTLINED_FUNCTION_17_10(v3, v4);
  return sub_26085B344;
}

uint64_t sub_26085B344(uint64_t a1)
{
  return sub_26085B598(a1);
}

uint64_t HIDServiceProperties.reportInterval.getter()
{
  OUTLINED_FUNCTION_65_0();
  return sub_260858974(v0, v1, v2, v3);
}

uint64_t sub_26085B36C()
{
  return HIDServiceProperties.reportInterval.setter();
}

uint64_t HIDServiceProperties.reportInterval.setter()
{
  OUTLINED_FUNCTION_65_0();
  return HIDServiceProperties.subscript.setter(v0, v1);
}

uint64_t (*HIDServiceProperties.reportInterval.modify(uint64_t a1))()
{
  OUTLINED_FUNCTION_2_37(a1);
  uint64_t v1 = HIDServiceProperties.reportInterval.getter();
  OUTLINED_FUNCTION_17_10(v1, v2);
  return sub_26085B3F4;
}

uint64_t sub_26085B3F4()
{
  OUTLINED_FUNCTION_65_0();
  return sub_26085B598(v0);
}

uint64_t HIDServiceProperties.subinterfaceID.getter()
{
  OUTLINED_FUNCTION_130();
  OUTLINED_FUNCTION_1_35();
  uint64_t v1 = sub_26087BC00();
  id v2 = OUTLINED_FUNCTION_16_13(v1, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (v0)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v3 = swift_unknownObjectRelease();
  }
  else
  {
    double v7 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v3, v4, &qword_26A8B4998, v5, v6, v7);
  if (v20)
  {
    int v8 = OUTLINED_FUNCTION_3_30();
    return OUTLINED_FUNCTION_6_25(v8, v9, v10, v11, v12, v13, v14, v15, v17, v18);
  }
  else
  {
    sub_2608634B4((uint64_t)v19, &qword_26A8B4998);
    return OUTLINED_FUNCTION_41();
  }
}

uint64_t sub_26085B4C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, void))
{
  uint64_t v4 = a4(a1, *(void *)(a1 + 8));
  return OUTLINED_FUNCTION_17_10(v4, v5);
}

uint64_t sub_26085B4F0(uint64_t a1)
{
  return HIDServiceProperties.subinterfaceID.setter(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t HIDServiceProperties.subinterfaceID.setter(uint64_t a1, char a2)
{
  return OUTLINED_FUNCTION_11_14(a1, a2 & 1);
}

uint64_t (*HIDServiceProperties.subinterfaceID.modify(uint64_t a1))(uint64_t a1)
{
  OUTLINED_FUNCTION_2_37(a1);
  uint64_t v1 = HIDServiceProperties.subinterfaceID.getter();
  OUTLINED_FUNCTION_17_10(v1, v2);
  return sub_26085B580;
}

uint64_t sub_26085B580(uint64_t a1)
{
  return OUTLINED_FUNCTION_12_15(a1);
}

uint64_t sub_26085B598(uint64_t a1)
{
  return HIDServiceProperties.subscript.setter(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t HIDServiceProperties.surfaceDimensions.getter()
{
  OUTLINED_FUNCTION_130();
  OUTLINED_FUNCTION_126();
  uint64_t v1 = sub_26087BC00();
  id v2 = OUTLINED_FUNCTION_16_13(v1, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (v0)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v3 = swift_unknownObjectRelease();
  }
  else
  {
    double v7 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v3, v4, &qword_26A8B4998, v5, v6, v7);
  if (!v11)
  {
    sub_2608634B4((uint64_t)v10, &qword_26A8B4998);
    goto LABEL_8;
  }
  sub_26081221C(0, &qword_26A8B5448);
  if ((OUTLINED_FUNCTION_3_30() & 1) == 0)
  {
LABEL_8:
    *(void *)&v12.is_nil = 0;
    goto LABEL_9;
  }
  UniversalHID::HIDServiceProperties::HIDSurfaceDimensions_optional v12 = HIDServiceProperties.HIDSurfaceDimensions.init(dictionaryRepresentation:)(dictionaryRepresentation);
LABEL_9:
  LOBYTE(result) = v12.is_nil;
  return result;
}

uint64_t sub_26085B6AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = HIDServiceProperties.surfaceDimensions.getter();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  return result;
}

uint64_t sub_26085B6E0(uint64_t a1)
{
  return HIDServiceProperties.surfaceDimensions.setter(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t HIDServiceProperties.surfaceDimensions.setter(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    HIDServiceProperties.HIDSurfaceDimensions.dictionaryRepresentation.getter(*(double *)&a1, *(double *)&a2);
  }
  OUTLINED_FUNCTION_122();
  return HIDServiceProperties.subscript.setter(v3, v4, v5);
}

UniversalHID::HIDServiceProperties::HIDSurfaceDimensions_optional __swiftcall HIDServiceProperties.HIDSurfaceDimensions.init(dictionaryRepresentation:)(NSDictionary dictionaryRepresentation)
{
  sub_26087BC00();
  id v3 = OUTLINED_FUNCTION_91_0();
  OUTLINED_FUNCTION_74_0();
  if (v1)
  {
    OUTLINED_FUNCTION_61_1();
    uint64_t v4 = swift_unknownObjectRelease();
  }
  else
  {
    double v8 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v4, v5, &qword_26A8B4998, v6, v7, v8);
  if (!v20)
  {

    sub_2608634B4((uint64_t)v19, &qword_26A8B4998);
    goto LABEL_15;
  }
  if ((OUTLINED_FUNCTION_7_20() & 1) == 0)
  {

LABEL_15:
    LOBYTE(v17) = 0;
    goto LABEL_16;
  }
  sub_26087BC00();
  id v9 = OUTLINED_FUNCTION_91_0();
  OUTLINED_FUNCTION_74_0();
  if (v1)
  {
    OUTLINED_FUNCTION_61_1();
    swift_unknownObjectRelease();
  }
  else
  {

    double v14 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v10, v11, &qword_26A8B4998, v12, v13, v14);
  if ((OUTLINED_FUNCTION_7_20() & 1) == 0) {
    goto LABEL_15;
  }
  double v15 = (double)v18 * 0.0000152587891;
  double v16 = v15;
  *(double *)&BOOL v17 = v15;
LABEL_16:
  result.value.height = v16;
  result.value.width = v15;
  result.is_nil = v17;
  return result;
}

id HIDServiceProperties.HIDSurfaceDimensions.dictionaryRepresentation.getter(double a1, double a2)
{
  unint64_t v3 = HIDFixed.init(doubleValue:)(a2);
  if ((v3 & 0x100000000) != 0 || (v4 = v3, unint64_t v5 = HIDFixed.init(doubleValue:)(a1), (v5 & 0x100000000) != 0))
  {
    id v11 = objc_allocWithZone(NSDictionary);
    return objc_msgSend(v11, sel_init);
  }
  else
  {
    int v6 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B5470);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_26087EEC0;
    uint64_t v8 = MEMORY[0x263F8D310];
    *(void *)(v7 + 56) = MEMORY[0x263F8D310];
    *(void *)(v7 + 32) = 0x746867696548;
    *(void *)(v7 + 40) = 0xE600000000000000;
    uint64_t v9 = MEMORY[0x263F8E548];
    *(_DWORD *)(v7 + 64) = v4;
    *(void *)(v7 + 120) = v8;
    *(void *)(v7 + 88) = v9;
    *(void *)(v7 + 96) = 0x6874646957;
    *(void *)(v7 + 104) = 0xE500000000000000;
    *(void *)(v7 + 152) = v9;
    *(_DWORD *)(v7 + 128) = v6;
    sub_26081221C(0, &qword_26A8B5448);
    return (id)sub_26087B4F0();
  }
}

uint64_t (*HIDServiceProperties.surfaceDimensions.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)(a1 + 24) = v1;
  *(void *)a1 = HIDServiceProperties.surfaceDimensions.getter();
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  return sub_26085BA70;
}

uint64_t sub_26085BA70(uint64_t a1)
{
  return HIDServiceProperties.surfaceDimensions.setter(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t HIDServiceProperties.scrollAccelerationSupport.getter(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1_35();
  uint64_t v3 = sub_26087BC00();
  id v4 = OUTLINED_FUNCTION_16_13(v3, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (a2)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v5 = swift_unknownObjectRelease();
  }
  else
  {
    double v9 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v5, v6, &qword_26A8B4998, v7, v8, v9);
  if (v15)
  {
    OUTLINED_FUNCTION_7_20();
    OUTLINED_FUNCTION_21_10();
    if (v12) {
      return v11;
    }
    else {
      return v10;
    }
  }
  else
  {
    sub_2608634B4((uint64_t)v14, &qword_26A8B4998);
    return 2;
  }
}

uint64_t sub_26085BB70@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = HIDServiceProperties.scrollAccelerationSupport.getter(a1, *(void *)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t (*HIDServiceProperties.scrollAccelerationSupport.modify(void *a1))(uint64_t a1)
{
  uint64_t v1 = OUTLINED_FUNCTION_20_10(a1);
  uint64_t v3 = HIDServiceProperties.scrollAccelerationSupport.getter((uint64_t)v1, v2);
  OUTLINED_FUNCTION_21_8(v3);
  return sub_26085BBDC;
}

uint64_t sub_26085BBDC(uint64_t a1)
{
  char v1 = OUTLINED_FUNCTION_8_15(a1);
  return HIDServiceProperties.subscript.setter(v1);
}

uint64_t HIDServiceProperties.pointerAccelerationSupport.getter()
{
  OUTLINED_FUNCTION_101_0();
  OUTLINED_FUNCTION_1_35();
  uint64_t v1 = sub_26087BC00();
  id v2 = OUTLINED_FUNCTION_16_13(v1, sel___swift_objectForKeyedSubscript_);
  OUTLINED_FUNCTION_15_13();
  if (v0)
  {
    OUTLINED_FUNCTION_14_12();
    uint64_t v3 = swift_unknownObjectRelease();
  }
  else
  {
    double v7 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v3, v4, &qword_26A8B4998, v5, v6, v7);
  if (v13)
  {
    OUTLINED_FUNCTION_7_20();
    OUTLINED_FUNCTION_21_10();
    if (v10) {
      return v9;
    }
    else {
      return v8;
    }
  }
  else
  {
    sub_2608634B4((uint64_t)v12, &qword_26A8B4998);
    return 2;
  }
}

uint64_t sub_26085BCE0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = HIDServiceProperties.pointerAccelerationSupport.getter();
  *a1 = result;
  return result;
}

uint64_t (*HIDServiceProperties.pointerAccelerationSupport.modify(void *a1))(uint64_t a1)
{
  OUTLINED_FUNCTION_20_10(a1);
  uint64_t v1 = HIDServiceProperties.pointerAccelerationSupport.getter();
  OUTLINED_FUNCTION_21_8(v1);
  return sub_26085BD4C;
}

uint64_t sub_26085BD4C(uint64_t a1)
{
  char v1 = OUTLINED_FUNCTION_8_15(a1);
  return OUTLINED_FUNCTION_148(v1);
}

uint64_t HIDServiceProperties.HIDAccelCurve.gainCubic.getter()
{
  return *(void *)v0;
}

uint64_t HIDServiceProperties.HIDAccelCurve.gainCubic.setter(uint64_t result, char a2)
{
  *(void *)uint64_t v2 = result;
  *(unsigned char *)(v2 + 8) = a2 & 1;
  return result;
}

uint64_t (*HIDServiceProperties.HIDAccelCurve.gainCubic.modify())()
{
  return nullsub_1;
}

uint64_t HIDServiceProperties.HIDAccelCurve.gainLinear.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t HIDServiceProperties.HIDAccelCurve.gainLinear.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 16) = result;
  *(unsigned char *)(v2 + 24) = a2 & 1;
  return result;
}

uint64_t (*HIDServiceProperties.HIDAccelCurve.gainLinear.modify())()
{
  return nullsub_1;
}

uint64_t HIDServiceProperties.HIDAccelCurve.gainParabolic.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t HIDServiceProperties.HIDAccelCurve.gainParabolic.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 32) = result;
  *(unsigned char *)(v2 + 40) = a2 & 1;
  return result;
}

uint64_t (*HIDServiceProperties.HIDAccelCurve.gainParabolic.modify())()
{
  return nullsub_1;
}

uint64_t HIDServiceProperties.HIDAccelCurve.gainQuartic.getter()
{
  return *(void *)(v0 + 48);
}

uint64_t HIDServiceProperties.HIDAccelCurve.gainQuartic.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 48) = result;
  *(unsigned char *)(v2 + 56) = a2 & 1;
  return result;
}

uint64_t (*HIDServiceProperties.HIDAccelCurve.gainQuartic.modify())()
{
  return nullsub_1;
}

uint64_t HIDServiceProperties.HIDAccelCurve.index.getter()
{
  return *(void *)(v0 + 64);
}

uint64_t HIDServiceProperties.HIDAccelCurve.index.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 64) = result;
  *(unsigned char *)(v2 + 72) = a2 & 1;
  return result;
}

uint64_t (*HIDServiceProperties.HIDAccelCurve.index.modify())()
{
  return nullsub_1;
}

uint64_t HIDServiceProperties.HIDAccelCurve.tangentSpeedCubicRoot.getter()
{
  return *(void *)(v0 + 80);
}

uint64_t HIDServiceProperties.HIDAccelCurve.tangentSpeedCubicRoot.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 80) = result;
  *(unsigned char *)(v2 + 88) = a2 & 1;
  return result;
}

uint64_t (*HIDServiceProperties.HIDAccelCurve.tangentSpeedCubicRoot.modify())()
{
  return nullsub_1;
}

uint64_t HIDServiceProperties.HIDAccelCurve.tangentSpeedLinear.getter()
{
  return *(void *)(v0 + 96);
}

uint64_t HIDServiceProperties.HIDAccelCurve.tangentSpeedLinear.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 96) = result;
  *(unsigned char *)(v2 + 104) = a2 & 1;
  return result;
}

uint64_t (*HIDServiceProperties.HIDAccelCurve.tangentSpeedLinear.modify())()
{
  return nullsub_1;
}

uint64_t HIDServiceProperties.HIDAccelCurve.tangentSpeedParabolicRoot.getter()
{
  return *(void *)(v0 + 112);
}

uint64_t HIDServiceProperties.HIDAccelCurve.tangentSpeedParabolicRoot.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 112) = result;
  *(unsigned char *)(v2 + 120) = a2 & 1;
  return result;
}

uint64_t (*HIDServiceProperties.HIDAccelCurve.tangentSpeedParabolicRoot.modify())()
{
  return nullsub_1;
}

uint64_t HIDServiceProperties.HIDAccelCurve.tangentSpeedQuarticRoot.getter()
{
  return *(void *)(v0 + 128);
}

uint64_t HIDServiceProperties.HIDAccelCurve.tangentSpeedQuarticRoot.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 128) = result;
  *(unsigned char *)(v2 + 136) = a2 & 1;
  return result;
}

uint64_t (*HIDServiceProperties.HIDAccelCurve.tangentSpeedQuarticRoot.modify())()
{
  return nullsub_1;
}

uint64_t sub_26085BF94(uint64_t a1)
{
  return a1;
}

uint64_t sub_26085BFC8(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x263F8EE80];
  uint64_t v32 = MEMORY[0x263F8EE80];
  sub_2607F5FF8(v31, a1);
  uint64_t v2 = v31[0];
  uint64_t v3 = v31[1];
  int64_t v4 = v31[3];
  unint64_t v5 = v31[4];
  int64_t v6 = (unint64_t)(v31[2] + 64) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  while (1)
  {
    do
    {
      if (v5)
      {
        unint64_t v8 = __clz(__rbit64(v5));
        v5 &= v5 - 1;
        unint64_t v9 = v8 | (v4 << 6);
      }
      else
      {
        int64_t v10 = v4 + 1;
        if (__OFADD__(v4, 1))
        {
          __break(1u);
          goto LABEL_36;
        }
        if (v10 >= v6) {
          goto LABEL_34;
        }
        unint64_t v11 = *(void *)(v3 + 8 * v10);
        int64_t v12 = v4 + 1;
        if (!v11)
        {
          int64_t v12 = v4 + 2;
          if (v4 + 2 >= v6) {
            goto LABEL_34;
          }
          unint64_t v11 = *(void *)(v3 + 8 * v12);
          if (!v11)
          {
            int64_t v12 = v4 + 3;
            if (v4 + 3 >= v6) {
              goto LABEL_34;
            }
            unint64_t v11 = *(void *)(v3 + 8 * v12);
            if (!v11)
            {
              int64_t v12 = v4 + 4;
              if (v4 + 4 >= v6) {
                goto LABEL_34;
              }
              unint64_t v11 = *(void *)(v3 + 8 * v12);
              if (!v11)
              {
                int64_t v12 = v4 + 5;
                if (v4 + 5 >= v6) {
                  goto LABEL_34;
                }
                unint64_t v11 = *(void *)(v3 + 8 * v12);
                if (!v11)
                {
                  int64_t v13 = v4 + 6;
                  while (v13 < v6)
                  {
                    unint64_t v11 = *(void *)(v3 + 8 * v13++);
                    if (v11)
                    {
                      int64_t v12 = v13 - 1;
                      goto LABEL_19;
                    }
                  }
LABEL_34:
                  sub_260842BA4();
                  return v1;
                }
              }
            }
          }
        }
LABEL_19:
        unint64_t v5 = (v11 - 1) & v11;
        unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
        int64_t v4 = v12;
      }
      uint64_t v14 = *(void *)(v2 + 56) + 16 * v9;
    }
    while ((*(unsigned char *)(v14 + 8) & 1) != 0);
    uint64_t v15 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v9);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    uint64_t v30 = *(void *)v14;
    unint64_t v18 = *(void *)(v1 + 16);
    if (*(void *)(v1 + 24) <= v18)
    {
      uint64_t v19 = v18 + 1;
      swift_bridgeObjectRetain();
      sub_2608629BC(v19, 1);
      uint64_t v1 = v32;
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    sub_26087BCA0();
    sub_26087B300();
    uint64_t result = sub_26087BD00();
    uint64_t v20 = v1 + 64;
    uint64_t v21 = -1 << *(unsigned char *)(v1 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v1 + 64 + 8 * (v22 >> 6))) == 0) {
      break;
    }
    unint64_t v24 = __clz(__rbit64((-1 << v22) & ~*(void *)(v1 + 64 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
LABEL_33:
    *(void *)(v20 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    id v29 = (void *)(*(void *)(v1 + 48) + 16 * v24);
    *id v29 = v16;
    v29[1] = v17;
    *(void *)(*(void *)(v1 + 56) + 8 * v24) = v30;
    ++*(void *)(v1 + 16);
  }
  char v25 = 0;
  unint64_t v26 = (unint64_t)(63 - v21) >> 6;
  while (++v23 != v26 || (v25 & 1) == 0)
  {
    BOOL v27 = v23 == v26;
    if (v23 == v26) {
      unint64_t v23 = 0;
    }
    v25 |= v27;
    uint64_t v28 = *(void *)(v20 + 8 * v23);
    if (v28 != -1)
    {
      unint64_t v24 = __clz(__rbit64(~v28)) + (v23 << 6);
      goto LABEL_33;
    }
  }
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_26085C278(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1;
  char v3 = sub_260853828(a1, a2, qword_270C9E578);
  swift_bridgeObjectRelease();
  if ((v3 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v2;
}

void *sub_26085C2DC()
{
  return &unk_270C9E578;
}

uint64_t OUTLINED_FUNCTION_110()
{
  return 0;
}

uint64_t sub_26085C2F4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_26085D800(a1, (uint64_t (*)(void, void))nullsub_1, a2);
}

void *sub_26085C30C@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_26085C2DC();
  *a1 = result;
  return result;
}

uint64_t sub_26085C334()
{
  return sub_26085BF94(*v0);
}

uint64_t sub_26085C33C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = sub_26085C278(a1, a2);
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_26085C364()
{
  return OUTLINED_FUNCTION_41();
}

uint64_t sub_26085C384@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = OUTLINED_FUNCTION_110();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_26085C3AC()
{
  return sub_260853254();
}

uint64_t sub_26085C3C8()
{
  return sub_260853338();
}

uint64_t sub_26085C3E4()
{
  return sub_260853540();
}

uint64_t sub_26085C400(uint64_t a1)
{
  unint64_t v2 = sub_260860880();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_26085C43C(uint64_t a1)
{
  unint64_t v2 = sub_260860880();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_26085C478(uint64_t *a1, uint64_t *a2)
{
  return sub_260865160(*a1, a1[1], *a2, a2[1]);
}

void HIDServiceProperties.HIDAccelCurve.init(from:)()
{
  OUTLINED_FUNCTION_76_0();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B5478);
  OUTLINED_FUNCTION_10_2();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_260860880();
  OUTLINED_FUNCTION_143();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  }
  else
  {
    OUTLINED_FUNCTION_1_28();
    uint64_t v6 = OUTLINED_FUNCTION_23_6();
    char v8 = v7;
    uint64_t v41 = v6;
    uint64_t v9 = OUTLINED_FUNCTION_19_10(0xD000000000000012);
    char v42 = v10;
    uint64_t v40 = v9;
    uint64_t v11 = OUTLINED_FUNCTION_19_10(0xD000000000000015);
    char v38 = v12;
    uint64_t v39 = v11;
    uint64_t v13 = OUTLINED_FUNCTION_19_10(0xD000000000000013);
    char v36 = v14;
    uint64_t v37 = v13;
    OUTLINED_FUNCTION_28_2();
    uint64_t v15 = OUTLINED_FUNCTION_23_6();
    char v34 = v16;
    uint64_t v35 = v15;
    uint64_t v17 = OUTLINED_FUNCTION_19_10(0xD00000000000001DLL);
    char v32 = v18;
    uint64_t v33 = v17;
    uint64_t v19 = OUTLINED_FUNCTION_19_10(0xD00000000000001ALL);
    char v30 = v20;
    uint64_t v31 = v19;
    uint64_t v21 = OUTLINED_FUNCTION_19_10(0xD000000000000021);
    char v28 = v22;
    uint64_t v29 = v21;
    uint64_t v23 = OUTLINED_FUNCTION_19_10(0xD00000000000001FLL);
    char v25 = v24;
    uint64_t v26 = OUTLINED_FUNCTION_159();
    v27(v26);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
    *(void *)uint64_t v4 = v41;
    *(unsigned char *)(v4 + 8) = v8 & 1;
    *(void *)(v4 + 16) = v40;
    *(unsigned char *)(v4 + 24) = v42 & 1;
    *(void *)(v4 + 32) = v39;
    *(unsigned char *)(v4 + 40) = v38 & 1;
    *(void *)(v4 + 48) = v37;
    *(unsigned char *)(v4 + 56) = v36 & 1;
    *(void *)(v4 + 64) = v35;
    *(unsigned char *)(v4 + 72) = v34 & 1;
    *(void *)(v4 + 80) = v33;
    *(unsigned char *)(v4 + 88) = v32 & 1;
    *(void *)(v4 + 96) = v31;
    *(unsigned char *)(v4 + 104) = v30 & 1;
    *(void *)(v4 + 112) = v29;
    *(unsigned char *)(v4 + 120) = v28 & 1;
    *(void *)(v4 + 128) = v23;
    *(unsigned char *)(v4 + 136) = v25 & 1;
  }
  OUTLINED_FUNCTION_72_0();
}

void HIDServiceProperties.HIDAccelCurve.encode(to:)()
{
  OUTLINED_FUNCTION_76_0();
  uint64_t v3 = v0;
  uint64_t v5 = v4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B5488);
  OUTLINED_FUNCTION_10_2();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_134();
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  sub_260860880();
  sub_26087BD20();
  OUTLINED_FUNCTION_1_28();
  OUTLINED_FUNCTION_22_8(v10, v11);
  if (!v1)
  {
    OUTLINED_FUNCTION_18_10(*(void *)(v3 + 16), *(unsigned __int8 *)(v3 + 24), 0xD000000000000012);
    OUTLINED_FUNCTION_18_10(*(void *)(v3 + 32), *(unsigned __int8 *)(v3 + 40), 0xD000000000000015);
    OUTLINED_FUNCTION_18_10(*(void *)(v3 + 48), *(unsigned __int8 *)(v3 + 56), 0xD000000000000013);
    OUTLINED_FUNCTION_28_2();
    OUTLINED_FUNCTION_22_8(v12, v13);
    OUTLINED_FUNCTION_18_10(*(void *)(v3 + 80), *(unsigned __int8 *)(v3 + 88), 0xD00000000000001DLL);
    OUTLINED_FUNCTION_18_10(*(void *)(v3 + 96), *(unsigned __int8 *)(v3 + 104), 0xD00000000000001ALL);
    OUTLINED_FUNCTION_18_10(*(void *)(v3 + 112), *(unsigned __int8 *)(v3 + 120), 0xD000000000000021);
    OUTLINED_FUNCTION_18_10(*(void *)(v3 + 128), *(unsigned __int8 *)(v3 + 136), 0xD00000000000001FLL);
  }
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v2, v6);
  OUTLINED_FUNCTION_72_0();
}

uint64_t HIDServiceProperties.HIDAccelCurve.hash(into:)()
{
  if (v0[8] == 1)
  {
    sub_26087BCC0();
  }
  else
  {
    sub_26087BCC0();
    sub_26087BCB0();
  }
  if (v0[24] == 1)
  {
    sub_26087BCC0();
  }
  else
  {
    sub_26087BCC0();
    sub_26087BCB0();
  }
  if (v0[40] == 1)
  {
    sub_26087BCC0();
  }
  else
  {
    sub_26087BCC0();
    sub_26087BCB0();
  }
  if (v0[56] == 1)
  {
    sub_26087BCC0();
  }
  else
  {
    sub_26087BCC0();
    sub_26087BCB0();
  }
  if (v0[72] == 1)
  {
    sub_26087BCC0();
  }
  else
  {
    sub_26087BCC0();
    sub_26087BCB0();
  }
  if (v0[88] == 1)
  {
    sub_26087BCC0();
  }
  else
  {
    sub_26087BCC0();
    sub_26087BCB0();
  }
  if (v0[104] == 1)
  {
    sub_26087BCC0();
  }
  else
  {
    sub_26087BCC0();
    sub_26087BCB0();
  }
  if (v0[120] == 1)
  {
    sub_26087BCC0();
  }
  else
  {
    sub_26087BCC0();
    sub_26087BCB0();
  }
  if (v0[136] == 1) {
    return sub_26087BCC0();
  }
  sub_26087BCC0();
  return sub_26087BCB0();
}

uint64_t static HIDServiceProperties.HIDAccelCurve.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a2 + 8);
  if (*(unsigned char *)(a1 + 8))
  {
    if (!*(unsigned char *)(a2 + 8)) {
      return 0;
    }
  }
  else
  {
    if (*(void *)a1 != *(void *)a2) {
      char v2 = 1;
    }
    if (v2) {
      return 0;
    }
  }
  char v3 = *(unsigned char *)(a2 + 24);
  if (*(unsigned char *)(a1 + 24))
  {
    if (!*(unsigned char *)(a2 + 24)) {
      return 0;
    }
  }
  else
  {
    if (*(void *)(a1 + 16) != *(void *)(a2 + 16)) {
      char v3 = 1;
    }
    if (v3) {
      return 0;
    }
  }
  char v4 = *(unsigned char *)(a2 + 40);
  if (*(unsigned char *)(a1 + 40))
  {
    if (!*(unsigned char *)(a2 + 40)) {
      return 0;
    }
  }
  else
  {
    if (*(void *)(a1 + 32) != *(void *)(a2 + 32)) {
      char v4 = 1;
    }
    if (v4) {
      return 0;
    }
  }
  char v5 = *(unsigned char *)(a2 + 56);
  if (*(unsigned char *)(a1 + 56))
  {
    if (!*(unsigned char *)(a2 + 56)) {
      return 0;
    }
  }
  else
  {
    if (*(void *)(a1 + 48) != *(void *)(a2 + 48)) {
      char v5 = 1;
    }
    if (v5) {
      return 0;
    }
  }
  char v6 = *(unsigned char *)(a2 + 72);
  if (*(unsigned char *)(a1 + 72))
  {
    if (!*(unsigned char *)(a2 + 72)) {
      return 0;
    }
  }
  else
  {
    if (*(void *)(a1 + 64) != *(void *)(a2 + 64)) {
      char v6 = 1;
    }
    if (v6) {
      return 0;
    }
  }
  char v7 = *(unsigned char *)(a2 + 88);
  if (*(unsigned char *)(a1 + 88))
  {
    if (!*(unsigned char *)(a2 + 88)) {
      return 0;
    }
  }
  else
  {
    if (*(void *)(a1 + 80) != *(void *)(a2 + 80)) {
      char v7 = 1;
    }
    if (v7) {
      return 0;
    }
  }
  char v8 = *(unsigned char *)(a2 + 104);
  if (*(unsigned char *)(a1 + 104))
  {
    if (!*(unsigned char *)(a2 + 104)) {
      return 0;
    }
  }
  else
  {
    if (*(void *)(a1 + 96) != *(void *)(a2 + 96)) {
      char v8 = 1;
    }
    if (v8) {
      return 0;
    }
  }
  char v9 = *(unsigned char *)(a2 + 120);
  if (*(unsigned char *)(a1 + 120))
  {
    if (!*(unsigned char *)(a2 + 120)) {
      return 0;
    }
  }
  else
  {
    if (*(void *)(a1 + 112) != *(void *)(a2 + 112)) {
      char v9 = 1;
    }
    if (v9) {
      return 0;
    }
  }
  char v10 = *(unsigned char *)(a2 + 136);
  if (*(unsigned char *)(a1 + 136))
  {
    if ((*(unsigned char *)(a2 + 136) & 1) == 0) {
      return 0;
    }
  }
  else
  {
    if (*(void *)(a1 + 128) != *(void *)(a2 + 128)) {
      char v10 = 1;
    }
    if (v10) {
      return 0;
    }
  }
  return 1;
}

uint64_t HIDServiceProperties.HIDAccelCurve.hashValue.getter()
{
  return sub_26087BD00();
}

void sub_26085CD14(void *a1@<X8>)
{
  HIDServiceProperties.HIDAccelCurve.init(from:)();
  if (!v1) {
    memcpy(a1, v3, 0x89uLL);
  }
}

void sub_26085CD60()
{
}

uint64_t sub_26085CD80()
{
  return sub_26087BD00();
}

uint64_t sub_26085CDC0(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B55A8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_260862284();
  sub_26087BD10();
  if (!v1)
  {
    uint64_t v9 = 0x7355656369766544;
    unint64_t v10 = 0xEB00000000656761;
    uint64_t v7 = sub_26087BAA0();
    uint64_t v9 = 0x7355656369766544;
    unint64_t v10 = 0xEF65676150656761;
    sub_26087BAA0();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v7;
}

uint64_t sub_26085CF8C(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B55B8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_260862284();
  sub_26087BD20();
  uint64_t v8 = 0x7355656369766544;
  unint64_t v9 = 0xEB00000000656761;
  sub_26087BB50();
  if (!v1)
  {
    uint64_t v8 = 0x7355656369766544;
    unint64_t v9 = 0xEF65676150656761;
    sub_26087BB50();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_26085D120(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = qword_270C9E638;
  if (!qword_270C9E638) {
    goto LABEL_16;
  }
  uint64_t v4 = a1;
  if (aDeviceusage_0[0] == a1 && aDeviceusage_0[1] == a2) {
    return v4;
  }
  uint64_t result = sub_26087BBE0();
  if (result) {
    return v4;
  }
  if (v3 == 1)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v7 = &unk_270C9E660;
  uint64_t v8 = 1;
  while (1)
  {
    uint64_t v9 = v8 + 1;
    if (__OFADD__(v8, 1)) {
      break;
    }
    if (*(v7 - 1) == v4 && *v7 == a2) {
      return v4;
    }
    uint64_t result = sub_26087BBE0();
    if (result) {
      return v4;
    }
    v7 += 2;
    ++v8;
    if (v9 == v3) {
      goto LABEL_16;
    }
  }
  __break(1u);
  return result;
}

void *sub_26085D1F8()
{
  return &unk_270C9E628;
}

uint64_t sub_26085D204()
{
  return sub_26087BCB0();
}

BOOL sub_26085D238(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1 == a3 && a2 == a4;
}

uint64_t sub_26085D248()
{
  return sub_26087BD00();
}

uint64_t sub_26085D2A8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_26085D800(a1, (uint64_t (*)(void, void))j_nullsub_1, a2);
}

void *sub_26085D2C0@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_26085D1F8();
  *a1 = result;
  return result;
}

uint64_t sub_26085D2E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = sub_26085D120(a1, a2);
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_26085D310(uint64_t a1)
{
  unint64_t v2 = sub_260862284();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_26085D34C(uint64_t a1)
{
  unint64_t v2 = sub_260862284();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_26085D388@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_26085CDC0(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_26085D3B4(void *a1)
{
  return sub_26085CF8C(a1);
}

uint64_t sub_26085D3D0()
{
  return sub_26085D248();
}

uint64_t sub_26085D3D8()
{
  return sub_26085D204();
}

uint64_t sub_26085D3E0()
{
  return sub_26087BD00();
}

BOOL sub_26085D438(uint64_t *a1, uint64_t *a2)
{
  return sub_26085D238(*a1, a1[1], *a2, a2[1]);
}

void HIDServiceProperties.HIDSurfaceDimensions.width.setter(double a1)
{
  *uint64_t v1 = a1;
}

uint64_t (*HIDServiceProperties.HIDSurfaceDimensions.width.modify())()
{
  return nullsub_1;
}

double HIDServiceProperties.HIDSurfaceDimensions.height.getter(double a1, double a2)
{
  return a2;
}

void HIDServiceProperties.HIDSurfaceDimensions.height.setter(double a1)
{
  *(double *)(v1 + 8) = a1;
}

uint64_t (*HIDServiceProperties.HIDSurfaceDimensions.height.modify())()
{
  return nullsub_1;
}

double HIDServiceProperties.HIDSurfaceDimensions.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B5490);
  OUTLINED_FUNCTION_10_2();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_75_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2608608CC();
  sub_26087BD10();
  OUTLINED_FUNCTION_104_0();
  sub_26087BA90();
  OUTLINED_FUNCTION_103_0();
  sub_26087BA90();
  double v4 = v3;
  uint64_t v5 = OUTLINED_FUNCTION_12_0();
  v6(v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v4;
}

uint64_t HIDServiceProperties.HIDSurfaceDimensions.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B54A0);
  OUTLINED_FUNCTION_10_2();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_134();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2608608CC();
  sub_26087BD20();
  OUTLINED_FUNCTION_104_0();
  sub_26087BB40();
  if (!v1)
  {
    OUTLINED_FUNCTION_103_0();
    sub_26087BB40();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

uint64_t sub_26085D71C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = qword_270C9E678;
  if (!qword_270C9E678) {
    goto LABEL_16;
  }
  uint64_t v4 = a1;
  if (*(void *)aHeight_0 == a1 && unk_270C9E690 == a2) {
    return v4;
  }
  uint64_t result = sub_26087BBE0();
  if (result) {
    return v4;
  }
  if (v3 == 1)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v7 = &unk_270C9E6A0;
  uint64_t v8 = 1;
  while (1)
  {
    uint64_t v9 = v8 + 1;
    if (__OFADD__(v8, 1)) {
      break;
    }
    if (*(v7 - 1) == v4 && *v7 == a2) {
      return v4;
    }
    uint64_t result = sub_26087BBE0();
    if (result) {
      return v4;
    }
    v7 += 2;
    ++v8;
    if (v9 == v3) {
      goto LABEL_16;
    }
  }
  __break(1u);
  return result;
}

void *sub_26085D7F4()
{
  return &unk_270C9E668;
}

uint64_t sub_26085D800@<X0>(void *a1@<X0>, uint64_t (*a2)(void, void)@<X3>, uint64_t *a3@<X8>)
{
  uint64_t result = a2(*a1, a1[1]);
  *a3 = result;
  a3[1] = v5;
  return result;
}

void *sub_26085D834@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_26085D7F4();
  *a1 = result;
  return result;
}

uint64_t sub_26085D85C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = sub_26085D71C(a1, a2);
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_26085D884(uint64_t a1)
{
  unint64_t v2 = sub_2608608CC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_26085D8C0(uint64_t a1)
{
  unint64_t v2 = sub_2608608CC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t HIDServiceProperties.HIDSurfaceDimensions.hash(into:)()
{
  return sub_26087BCF0();
}

BOOL static HIDServiceProperties.HIDSurfaceDimensions.== infix(_:_:)(double a1, double a2, double a3, double a4)
{
  return a2 == a4 && a1 == a3;
}

uint64_t HIDServiceProperties.HIDSurfaceDimensions.hashValue.getter()
{
  return sub_26087BD00();
}

void sub_26085D9AC(void *a1@<X0>, uint64_t a2@<X8>)
{
  double v4 = HIDServiceProperties.HIDSurfaceDimensions.init(from:)(a1);
  if (!v2)
  {
    *(double *)a2 = v4;
    *(void *)(a2 + 8) = v5;
  }
}

uint64_t sub_26085D9D8(void *a1)
{
  return HIDServiceProperties.HIDSurfaceDimensions.encode(to:)(a1);
}

uint64_t sub_26085D9F4()
{
  return HIDServiceProperties.HIDSurfaceDimensions.hashValue.getter();
}

uint64_t sub_26085D9FC()
{
  return HIDServiceProperties.HIDSurfaceDimensions.hash(into:)();
}

uint64_t sub_26085DA04()
{
  return sub_26087BD00();
}

BOOL sub_26085DA54(double *a1, double *a2)
{
  return static HIDServiceProperties.HIDSurfaceDimensions.== infix(_:_:)(*a1, a1[1], *a2, a2[1]);
}

void HIDServiceProperties.init(from:)()
{
  OUTLINED_FUNCTION_76_0();
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B54A8);
  OUTLINED_FUNCTION_10_2();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_75_0();
  id v142 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9A0]), sel_init);
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_260848D34();
  OUTLINED_FUNCTION_143();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  }
  else
  {
    OUTLINED_FUNCTION_106_0();
    *(void *)&long long v137 = v4;
    *((void *)&v137 + 1) = v5;
    uint64_t v6 = sub_26087BA80();
    if (v7) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = v6;
    }
    uint64_t v141 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B54B0);
    OUTLINED_FUNCTION_79_0();
    unint64_t v9 = sub_260861288((uint64_t)&unk_26A8B54B8);
    OUTLINED_FUNCTION_161();
    OUTLINED_FUNCTION_81_0();
    OUTLINED_FUNCTION_118();
    HIDServiceProperties.accelParametricCurves.setter(v139);
    *(void *)&long long v137 = v9;
    *((void *)&v137 + 1) = 0x8000000260884E20;
    OUTLINED_FUNCTION_37_1();
    OUTLINED_FUNCTION_4_15();
    if (v10) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = (void *)sub_26087B450();
    }
    OUTLINED_FUNCTION_117(0x8000000260884E20);
    uint64_t v12 = sub_26087BC00();
    OUTLINED_FUNCTION_10_18(v12, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    strcpy((char *)&v137, "Authenticated");
    HIWORD(v137) = -4864;
    OUTLINED_FUNCTION_37_1();
    OUTLINED_FUNCTION_4_15();
    if (v10) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = (void *)sub_26087B450();
    }
    strcpy((char *)&v137, "Authenticated");
    uint64_t v14 = sub_26087BC00();
    OUTLINED_FUNCTION_10_18(v14, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    strcpy((char *)&v137, "CapsLockDelay");
    HIWORD(v137) = -4864;
    OUTLINED_FUNCTION_4_22();
    if (v15) {
      char v16 = 0;
    }
    else {
      char v16 = (void *)sub_26087B4B0();
    }
    strcpy((char *)&v137, "CapsLockDelay");
    uint64_t v17 = sub_26087BC00();
    OUTLINED_FUNCTION_10_18(v17, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    *(void *)&long long v137 = 0xD000000000000016;
    *((void *)&v137 + 1) = 0x8000000260884E40;
    OUTLINED_FUNCTION_37_1();
    OUTLINED_FUNCTION_4_15();
    if (v10) {
      char v18 = 0;
    }
    else {
      char v18 = (void *)sub_26087B450();
    }
    uint64_t v19 = 0xEE00746E69486570;
    *(void *)&long long v137 = 0xD000000000000016;
    *((void *)&v137 + 1) = 0x8000000260884E40;
    uint64_t v20 = sub_26087BC00();
    OUTLINED_FUNCTION_10_18(v20, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_114();
    OUTLINED_FUNCTION_29_2();
    if (v21)
    {
      sub_26087B2A0();
      OUTLINED_FUNCTION_83_0();
    }
    else
    {
      char v18 = 0;
    }
    OUTLINED_FUNCTION_114();
    uint64_t v22 = sub_26087BC00();
    OUTLINED_FUNCTION_10_18(v22, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B54C8);
    OUTLINED_FUNCTION_118();
    OUTLINED_FUNCTION_1_28();
    *(void *)&long long v137 = 0xEE00746E6948656CLL;
    *((void *)&v137 + 1) = v23;
    sub_260861288((uint64_t)&unk_26A8B54D0);
    OUTLINED_FUNCTION_161();
    OUTLINED_FUNCTION_81_0();
    if (v139)
    {
      int64_t v24 = *(void *)(v139 + 16);
      if (v24)
      {
        *(void *)&long long v137 = MEMORY[0x263F8EE78];
        sub_2607E9D18(0, v24, 0);
        uint64_t v25 = v137;
        unint64_t v26 = *(void *)(v137 + 16);
        uint64_t v27 = 4 * v26;
        char v28 = (__int16 *)(v139 + 40);
        do
        {
          __int16 v29 = *v28;
          __int16 v30 = *(v28 - 4);
          *(void *)&long long v137 = v25;
          unint64_t v31 = *(void *)(v25 + 24);
          uint64_t v32 = v26 + 1;
          if (v26 >= v31 >> 1)
          {
            uint64_t v136 = v26 + 1;
            __int16 v134 = v30;
            __int16 v135 = v29;
            sub_2607E9D18(v31 > 1, v26 + 1, 1);
            __int16 v30 = v134;
            __int16 v29 = v135;
            uint64_t v32 = v136;
            uint64_t v25 = v137;
          }
          v28 += 8;
          *(void *)(v25 + 16) = v32;
          uint64_t v33 = v25 + v27;
          *(_WORD *)(v33 + 32) = v29;
          *(_WORD *)(v33 + 34) = v30;
          v27 += 4;
          unint64_t v26 = v32;
          --v24;
        }
        while (v24);
        uint64_t v19 = v25;
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v19 = MEMORY[0x263F8EE78];
      }
      HIDServiceProperties.deviceUsagePairs.setter(v19);
      OUTLINED_FUNCTION_118();
    }
    char v34 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_26A8B5450);
    OUTLINED_FUNCTION_57_0(v19 + 5);
    sub_26086133C((uint64_t)&unk_26A8B54E0);
    OUTLINED_FUNCTION_161();
    OUTLINED_FUNCTION_81_0();
    if (v139)
    {
      sub_26087B1D0();
      OUTLINED_FUNCTION_83_0();
    }
    else
    {
      char v34 = 0;
    }
    OUTLINED_FUNCTION_57_0(0xD000000000000019);
    uint64_t v35 = sub_26087BC00();
    OUTLINED_FUNCTION_10_18(v35, sel___swift_setObject_forKeyedSubscript_);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    *(void *)&long long v137 = 0xD000000000000012;
    *((void *)&v137 + 1) = 0x8000000260884F10;
    OUTLINED_FUNCTION_29_2();
    if (v36)
    {
      sub_26087B2A0();
      OUTLINED_FUNCTION_83_0();
    }
    else
    {
      char v34 = 0;
    }
    uint64_t v37 = sub_26087BC00();
    OUTLINED_FUNCTION_10_18(v37, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    *(void *)&long long v137 = 0xD000000000000021;
    *((void *)&v137 + 1) = 0x8000000260884F30;
    OUTLINED_FUNCTION_37_1();
    OUTLINED_FUNCTION_4_15();
    if (v10) {
      char v38 = 0;
    }
    else {
      char v38 = (void *)sub_26087B450();
    }
    uint64_t v39 = sub_26087BC00();
    OUTLINED_FUNCTION_10_18(v39, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    *(void *)&long long v137 = 0x437972746E756F43;
    *((void *)&v137 + 1) = 0xEB0000000065646FLL;
    OUTLINED_FUNCTION_4_22();
    if (v40) {
      uint64_t v41 = 0;
    }
    else {
      uint64_t v41 = (void *)sub_26087B4B0();
    }
    uint64_t v42 = sub_26087BC00();
    OUTLINED_FUNCTION_10_18(v42, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    *(void *)&long long v137 = 0xEE00746E6948656CLL;
    *((void *)&v137 + 1) = 0x8000000260884F60;
    OUTLINED_FUNCTION_29_2();
    if (v43)
    {
      sub_26087B2A0();
      OUTLINED_FUNCTION_83_0();
    }
    else
    {
      uint64_t v41 = 0;
    }
    uint64_t v44 = sub_26087BC00();
    OUTLINED_FUNCTION_10_18(v44, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    strcpy((char *)&v137, "StandardType");
    BYTE13(v137) = 0;
    HIWORD(v137) = -5120;
    OUTLINED_FUNCTION_4_22();
    if (v45) {
      uint64_t v46 = 0;
    }
    else {
      uint64_t v46 = (void *)sub_26087B4B0();
    }
    strcpy((char *)&v137, "StandardType");
    uint64_t v47 = sub_26087BC00();
    OUTLINED_FUNCTION_10_18(v47, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    strcpy((char *)&v137, "Manufacturer");
    BYTE13(v137) = 0;
    HIWORD(v137) = -5120;
    OUTLINED_FUNCTION_29_2();
    if (v48)
    {
      sub_26087B2A0();
      OUTLINED_FUNCTION_83_0();
    }
    else
    {
      uint64_t v46 = 0;
    }
    OUTLINED_FUNCTION_142();
    *(void *)&long long v137 = v49;
    *((void *)&v137 + 1) = 0xEC00000072657275;
    uint64_t v50 = sub_26087BC00();
    OUTLINED_FUNCTION_10_18(v50, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_117(0x8000000260884660);
    OUTLINED_FUNCTION_4_22();
    if (v51) {
      unint64_t v52 = 0;
    }
    else {
      unint64_t v52 = (void *)sub_26087B4B0();
    }
    OUTLINED_FUNCTION_140();
    uint64_t v53 = sub_26087BC00();
    OUTLINED_FUNCTION_10_18(v53, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    *(void *)&long long v137 = "UsagePairs";
    *((void *)&v137 + 1) = 0x8000000260884680;
    OUTLINED_FUNCTION_4_22();
    if (v54) {
      id v55 = 0;
    }
    else {
      id v55 = (void *)sub_26087B4B0();
    }
    OUTLINED_FUNCTION_57_0(0xD00000000000001ALL);
    uint64_t v56 = sub_26087BC00();
    OUTLINED_FUNCTION_10_18(v56, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_105_0(0xD00000000000001ELL);
    sub_2608609B0();
    OUTLINED_FUNCTION_138();
    OUTLINED_FUNCTION_81_0();
    OUTLINED_FUNCTION_137();
    if (!v10 & v57) {
      uint64_t v58 = 0;
    }
    else {
      uint64_t v58 = (void *)sub_26087AFF0();
    }
    OUTLINED_FUNCTION_58_1();
    OUTLINED_FUNCTION_105_0(v59 + 10);
    uint64_t v60 = sub_26087BC00();
    OUTLINED_FUNCTION_115(v60, sel___swift_setObject_forKeyedSubscript_);
    sub_2608347D4(v136, v56);

    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_58_1();
    *(void *)&long long v137 = v61 + 12;
    *((void *)&v137 + 1) = 0x8000000260884FA0;
    OUTLINED_FUNCTION_4_22();
    if (v62) {
      uint64_t v63 = 0;
    }
    else {
      uint64_t v63 = (void *)sub_26087B4B0();
    }
    OUTLINED_FUNCTION_57_0(0xD000000000000020);
    uint64_t v64 = sub_26087BC00();
    OUTLINED_FUNCTION_10_18(v64, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_105_0(0xD00000000000001BLL);
    OUTLINED_FUNCTION_81_0();
    OUTLINED_FUNCTION_137();
    if (!v10 & v57) {
      char v65 = 0;
    }
    else {
      char v65 = (void *)sub_26087AFF0();
    }
    OUTLINED_FUNCTION_58_1();
    OUTLINED_FUNCTION_105_0(v66 + 7);
    id v67 = (void *)sub_26087BC00();
    OUTLINED_FUNCTION_115((uint64_t)v67, sel___swift_setObject_forKeyedSubscript_);
    sub_2608347D4(v136, v64);

    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_119();
    *(void *)&long long v137 = v68;
    *((void *)&v137 + 1) = 0x8000000260885010;
    OUTLINED_FUNCTION_29_2();
    if (v69)
    {
      sub_26087B2A0();
      OUTLINED_FUNCTION_83_0();
    }
    else
    {
      id v67 = 0;
    }
    OUTLINED_FUNCTION_57_0(0xD00000000000001ALL);
    uint64_t v70 = sub_26087BC00();
    OUTLINED_FUNCTION_10_18(v70, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    *(void *)&long long v137 = 0xD000000000000015;
    *((void *)&v137 + 1) = 0x8000000260885030;
    OUTLINED_FUNCTION_4_22();
    if (v71) {
      uint64_t v72 = 0;
    }
    else {
      uint64_t v72 = (void *)sub_26087B4B0();
    }
    OUTLINED_FUNCTION_57_0(0xD000000000000015);
    uint64_t v73 = sub_26087BC00();
    OUTLINED_FUNCTION_10_18(v73, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    *(void *)&long long v137 = 0xD000000000000014;
    *((void *)&v137 + 1) = 0x80000002608846E0;
    OUTLINED_FUNCTION_4_22();
    if (v74) {
      uint64_t v75 = 0;
    }
    else {
      uint64_t v75 = (void *)sub_26087B4B0();
    }
    OUTLINED_FUNCTION_141();
    uint64_t v76 = sub_26087BC00();
    OUTLINED_FUNCTION_10_18(v76, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    *(void *)&long long v137 = 0xD000000000000014;
    *((void *)&v137 + 1) = 0x8000000260885050;
    OUTLINED_FUNCTION_4_22();
    if (v77) {
      uint64_t v78 = 0;
    }
    else {
      uint64_t v78 = (void *)sub_26087B4B0();
    }
    OUTLINED_FUNCTION_140();
    uint64_t v79 = sub_26087BC00();
    OUTLINED_FUNCTION_10_18(v79, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    *(void *)&long long v137 = "HIDPointerButtonCount";
    *((void *)&v137 + 1) = 0x8000000260885070;
    OUTLINED_FUNCTION_4_22();
    if (v80) {
      uint64_t v81 = 0;
    }
    else {
      uint64_t v81 = (void *)sub_26087B4B0();
    }
    OUTLINED_FUNCTION_117(0x8000000260885070);
    uint64_t v82 = sub_26087BC00();
    OUTLINED_FUNCTION_10_18(v82, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    strcpy((char *)&v137, "PrimaryUsage");
    BYTE13(v137) = 0;
    HIWORD(v137) = -5120;
    OUTLINED_FUNCTION_4_22();
    if (v83) {
      uint64_t v84 = 0;
    }
    else {
      uint64_t v84 = (void *)sub_26087B4B0();
    }
    strcpy((char *)&v137, "PrimaryUsage");
    uint64_t v85 = sub_26087BC00();
    OUTLINED_FUNCTION_10_18(v85, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    *(void *)&long long v137 = 0xEE00746E6948656CLL;
    *((void *)&v137 + 1) = 0x8000000260885090;
    OUTLINED_FUNCTION_4_22();
    if (v86) {
      int v87 = 0;
    }
    else {
      int v87 = (void *)sub_26087B4B0();
    }
    uint64_t v88 = sub_26087BC00();
    OUTLINED_FUNCTION_10_18(v88, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    *(void *)&long long v137 = 0x746375646F7250;
    *((void *)&v137 + 1) = 0xE700000000000000;
    OUTLINED_FUNCTION_29_2();
    if (v89)
    {
      sub_26087B2A0();
      OUTLINED_FUNCTION_83_0();
    }
    else
    {
      int v87 = 0;
    }
    uint64_t v90 = sub_26087BC00();
    OUTLINED_FUNCTION_10_18(v90, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    *(void *)&long long v137 = 0x49746375646F7250;
    *((void *)&v137 + 1) = 0xE900000000000044;
    OUTLINED_FUNCTION_4_22();
    if (v91) {
      uint64_t v92 = 0;
    }
    else {
      uint64_t v92 = (void *)sub_26087B4B0();
    }
    uint64_t v93 = sub_26087BC00();
    OUTLINED_FUNCTION_10_18(v93, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    strcpy((char *)&v137, "ReportInterval");
    HIBYTE(v137) = -18;
    OUTLINED_FUNCTION_4_22();
    if (v94) {
      uint64_t v95 = 0;
    }
    else {
      uint64_t v95 = (void *)sub_26087B4B0();
    }
    strcpy((char *)&v137, "ReportInterval");
    HIBYTE(v137) = -18;
    uint64_t v96 = sub_26087BC00();
    OUTLINED_FUNCTION_10_18(v96, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_119();
    OUTLINED_FUNCTION_105_0(v97);
    OUTLINED_FUNCTION_81_0();
    if (*((void *)&v137 + 1) >> 60 == 15) {
      uint64_t v98 = 0;
    }
    else {
      uint64_t v98 = (void *)sub_26087AFF0();
    }
    OUTLINED_FUNCTION_119();
    OUTLINED_FUNCTION_105_0(v99);
    uint64_t v100 = (void *)sub_26087BC00();
    OUTLINED_FUNCTION_115((uint64_t)v100, sel___swift_setObject_forKeyedSubscript_);
    sub_2608347D4(v137, *((unint64_t *)&v137 + 1));

    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_58_1();
    *(void *)&long long v137 = v101 + 5;
    *((void *)&v137 + 1) = 0x80000002608850F0;
    OUTLINED_FUNCTION_29_2();
    if (v102)
    {
      sub_26087B2A0();
      OUTLINED_FUNCTION_83_0();
    }
    else
    {
      uint64_t v100 = 0;
    }
    OUTLINED_FUNCTION_57_0(0xD000000000000019);
    uint64_t v103 = sub_26087BC00();
    OUTLINED_FUNCTION_10_18(v103, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_1_28();
    *(void *)&long long v137 = 0xD000000000000014;
    *((void *)&v137 + 1) = v104;
    OUTLINED_FUNCTION_161();
    OUTLINED_FUNCTION_81_0();
    HIDServiceProperties.scrollAccelParametricCurves.setter(v139);
    *(void *)&long long v137 = 0xD000000000000013;
    *((void *)&v137 + 1) = 0x8000000260885150;
    OUTLINED_FUNCTION_4_22();
    if (v105) {
      char v106 = 0;
    }
    else {
      char v106 = (void *)sub_26087B4B0();
    }
    OUTLINED_FUNCTION_141();
    uint64_t v107 = sub_26087BC00();
    OUTLINED_FUNCTION_35_1(v107, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    *(void *)&long long v137 = 0xD000000000000013;
    *((void *)&v137 + 1) = 0x8000000260885170;
    OUTLINED_FUNCTION_4_22();
    if (v108) {
      uint64_t v109 = 0;
    }
    else {
      uint64_t v109 = (void *)sub_26087B4B0();
    }
    OUTLINED_FUNCTION_141();
    uint64_t v110 = sub_26087BC00();
    OUTLINED_FUNCTION_35_1(v110, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    *(void *)&long long v137 = 0xD000000000000011;
    *((void *)&v137 + 1) = 0x8000000260885190;
    OUTLINED_FUNCTION_4_22();
    if (v111) {
      uint64_t v112 = 0;
    }
    else {
      uint64_t v112 = (void *)sub_26087B4B0();
    }
    OUTLINED_FUNCTION_141();
    uint64_t v113 = sub_26087BC00();
    OUTLINED_FUNCTION_35_1(v113, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    *(void *)&long long v137 = 0xD000000000000018;
    *((void *)&v137 + 1) = 0x80000002608851B0;
    OUTLINED_FUNCTION_37_1();
    OUTLINED_FUNCTION_4_15();
    if (v10) {
      uint64_t v114 = 0;
    }
    else {
      uint64_t v114 = (void *)sub_26087B450();
    }
    OUTLINED_FUNCTION_57_0(0xD000000000000018);
    uint64_t v115 = sub_26087BC00();
    OUTLINED_FUNCTION_35_1(v115, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_1_28();
    uint64_t v139 = 0xD000000000000011;
    uint64_t v140 = v116;
    sub_2608609FC();
    OUTLINED_FUNCTION_138();
    OUTLINED_FUNCTION_81_0();
    HIDServiceProperties.surfaceDimensions.setter(v137, *((uint64_t *)&v137 + 1), v138);
    OUTLINED_FUNCTION_136();
    OUTLINED_FUNCTION_29_2();
    if (v117)
    {
      uint64_t v118 = (void *)sub_26087B2A0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v118 = 0;
    }
    OUTLINED_FUNCTION_136();
    uint64_t v119 = sub_26087BC00();
    OUTLINED_FUNCTION_35_1(v119, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    *(void *)&long long v137 = 0xD000000000000017;
    *((void *)&v137 + 1) = 0x80000002608846A0;
    OUTLINED_FUNCTION_4_22();
    if (v120) {
      uint64_t v121 = 0;
    }
    else {
      uint64_t v121 = (void *)sub_26087B4B0();
    }
    OUTLINED_FUNCTION_57_0(0xD000000000000017);
    uint64_t v122 = sub_26087BC00();
    OUTLINED_FUNCTION_35_1(v122, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    *(void *)&long long v137 = 0xD00000000000001DLL;
    *((void *)&v137 + 1) = 0x80000002608846C0;
    OUTLINED_FUNCTION_4_22();
    if (v123) {
      uint64_t v124 = 0;
    }
    else {
      uint64_t v124 = (void *)sub_26087B4B0();
    }
    OUTLINED_FUNCTION_57_0(0xD00000000000001DLL);
    uint64_t v125 = sub_26087BC00();
    OUTLINED_FUNCTION_35_1(v125, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    *(void *)&long long v137 = 0xD000000000000017;
    *((void *)&v137 + 1) = 0x80000002608851F0;
    OUTLINED_FUNCTION_37_1();
    OUTLINED_FUNCTION_4_15();
    if (v10) {
      uint64_t v126 = 0;
    }
    else {
      uint64_t v126 = (void *)sub_26087B450();
    }
    OUTLINED_FUNCTION_57_0(0xD000000000000017);
    uint64_t v127 = sub_26087BC00();
    OUTLINED_FUNCTION_35_1(v127, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    *(void *)&long long v137 = 0x4449726F646E6556;
    *((void *)&v137 + 1) = 0xE800000000000000;
    OUTLINED_FUNCTION_4_22();
    if (v128) {
      uint64_t v129 = 0;
    }
    else {
      uint64_t v129 = (void *)sub_26087B4B0();
    }
    *(void *)&long long v137 = 0x4449726F646E6556;
    *((void *)&v137 + 1) = 0xE800000000000000;
    uint64_t v130 = sub_26087BC00();
    OUTLINED_FUNCTION_35_1(v130, sel___swift_setObject_forKeyedSubscript_);

    swift_unknownObjectRelease();
    uint64_t v131 = OUTLINED_FUNCTION_73_0();
    v132(v131);
    id v133 = v142;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  }
  OUTLINED_FUNCTION_72_0();
}

void HIDServiceProperties.encode(to:)()
{
  OUTLINED_FUNCTION_76_0();
  uint64_t v193 = v2;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B54F8);
  OUTLINED_FUNCTION_10_2();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_4_7();
  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  sub_260848D34();
  sub_26087BD20();
  if (!v4 || (OUTLINED_FUNCTION_106_0(), *(void *)&long long v190 = v11, *((void *)&v190 + 1) = v12, sub_26087BB80(), !v0))
  {
    id v13 = objc_msgSend(v193, sel___swift_objectForKeyedSubscript_, sub_26087BC00());
    swift_unknownObjectRelease();
    if (v13)
    {
      OUTLINED_FUNCTION_54_0();
      uint64_t v14 = swift_unknownObjectRelease();
    }
    else
    {
      OUTLINED_FUNCTION_53_1();
    }
    OUTLINED_FUNCTION_55_1(v14, v15, &qword_26A8B4998);
    if (v192)
    {
      sub_26081221C(0, &qword_26A8B49A0);
      if (OUTLINED_FUNCTION_25_5())
      {
        sub_2608549D8((uint64_t)v189, v16, v17, v18, v19, v20, v21, v22, v187, (NSDictionary)v188);
      }
    }
    else
    {
      sub_2608634B4((uint64_t)&v190, &qword_26A8B4998);
    }
    strcpy((char *)&v190, "HIDAccelCurves");
    HIBYTE(v190) = -18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B54B0);
    sub_260861288((uint64_t)&unk_26A8B5500);
    OUTLINED_FUNCTION_98_0();
    OUTLINED_FUNCTION_82_0();
    if (v0)
    {
      swift_bridgeObjectRelease();
LABEL_30:
      uint64_t v38 = OUTLINED_FUNCTION_154();
      v39(v38);
      goto LABEL_31;
    }
    OUTLINED_FUNCTION_118();
    swift_bridgeObjectRelease();
    *(void *)&long long v190 = 0xEE00736576727543;
    *((void *)&v190 + 1) = 0x8000000260884E20;
    uint64_t v23 = sub_26087BC00();
    id v24 = OUTLINED_FUNCTION_56_1(v23, sel___swift_objectForKeyedSubscript_);
    OUTLINED_FUNCTION_59_1();
    if (&qword_26A8B54B0)
    {
      OUTLINED_FUNCTION_54_0();
      uint64_t v25 = swift_unknownObjectRelease();
    }
    else
    {
      OUTLINED_FUNCTION_53_1();
    }
    OUTLINED_FUNCTION_55_1(v25, v26, &qword_26A8B4998);
    if (v192)
    {
      OUTLINED_FUNCTION_25_5();
      OUTLINED_FUNCTION_32_1();
      if (v29) {
        uint64_t v30 = v28;
      }
      else {
        uint64_t v30 = v27;
      }
    }
    else
    {
      sub_2608634B4((uint64_t)&v190, &qword_26A8B4998);
      uint64_t v30 = 2;
    }
    *(void *)&long long v190 = 0xEE00736576727543;
    *((void *)&v190 + 1) = 0x8000000260884E20;
    OUTLINED_FUNCTION_40_1(v30);
    strcpy((char *)&v190, "Authenticated");
    HIWORD(v190) = -4864;
    uint64_t v31 = sub_26087BC00();
    id v32 = OUTLINED_FUNCTION_56_1(v31, sel___swift_objectForKeyedSubscript_);
    OUTLINED_FUNCTION_59_1();
    if (&qword_26A8B54B0)
    {
      OUTLINED_FUNCTION_54_0();
      uint64_t v33 = swift_unknownObjectRelease();
    }
    else
    {
      OUTLINED_FUNCTION_53_1();
    }
    OUTLINED_FUNCTION_55_1(v33, v34, &qword_26A8B4998);
    if (v192)
    {
      OUTLINED_FUNCTION_25_5();
      OUTLINED_FUNCTION_32_1();
      if (v29) {
        uint64_t v37 = v36;
      }
      else {
        uint64_t v37 = v35;
      }
    }
    else
    {
      sub_2608634B4((uint64_t)&v190, &qword_26A8B4998);
      uint64_t v37 = 2;
    }
    strcpy((char *)&v190, "Authenticated");
    HIWORD(v190) = -4864;
    OUTLINED_FUNCTION_40_1(v37);
    *(void *)&long long v190 = 0x6E492D746C697542;
    *((void *)&v190 + 1) = 0xE800000000000000;
    uint64_t v40 = sub_26087BC00();
    id v41 = OUTLINED_FUNCTION_56_1(v40, sel___swift_objectForKeyedSubscript_);
    OUTLINED_FUNCTION_59_1();
    if (&qword_26A8B54B0)
    {
      OUTLINED_FUNCTION_54_0();
      uint64_t v42 = swift_unknownObjectRelease();
    }
    else
    {
      OUTLINED_FUNCTION_53_1();
    }
    OUTLINED_FUNCTION_55_1(v42, v43, &qword_26A8B4998);
    if (v192)
    {
      OUTLINED_FUNCTION_25_5();
      OUTLINED_FUNCTION_32_1();
      if (v29) {
        uint64_t v46 = v45;
      }
      else {
        uint64_t v46 = v44;
      }
    }
    else
    {
      sub_2608634B4((uint64_t)&v190, &qword_26A8B4998);
      uint64_t v46 = 2;
    }
    *(void *)&long long v190 = 0xEE00736576727546;
    *((void *)&v190 + 1) = 0x80000002608851F0;
    OUTLINED_FUNCTION_40_1(v46);
    strcpy((char *)&v190, "CapsLockDelay");
    HIWORD(v190) = -4864;
    uint64_t v47 = sub_26087BC00();
    id v48 = OUTLINED_FUNCTION_56_1(v47, sel___swift_objectForKeyedSubscript_);
    OUTLINED_FUNCTION_59_1();
    if (&qword_26A8B54B0)
    {
      OUTLINED_FUNCTION_54_0();
      uint64_t v49 = swift_unknownObjectRelease();
    }
    else
    {
      OUTLINED_FUNCTION_53_1();
    }
    OUTLINED_FUNCTION_55_1(v49, v50, &qword_26A8B4998);
    if (v192)
    {
      int v51 = OUTLINED_FUNCTION_25_5();
      uint64_t v52 = OUTLINED_FUNCTION_112(v51);
    }
    else
    {
      sub_2608634B4((uint64_t)&v190, &qword_26A8B4998);
      uint64_t v52 = OUTLINED_FUNCTION_41();
    }
    strcpy((char *)&v190, "CapsLockDelay");
    HIWORD(v190) = -4864;
    OUTLINED_FUNCTION_5_19(v52, v53);
    OUTLINED_FUNCTION_128(0xEE00736576727545);
    uint64_t v54 = sub_26087BC00();
    id v55 = OUTLINED_FUNCTION_56_1(v54, sel___swift_objectForKeyedSubscript_);
    OUTLINED_FUNCTION_59_1();
    if (&qword_26A8B54B0)
    {
      OUTLINED_FUNCTION_54_0();
      uint64_t v56 = swift_unknownObjectRelease();
    }
    else
    {
      OUTLINED_FUNCTION_53_1();
    }
    uint64_t v58 = MEMORY[0x263F8EE58];
    OUTLINED_FUNCTION_55_1(v56, v57, &qword_26A8B4998);
    if (v192)
    {
      OUTLINED_FUNCTION_25_5();
      OUTLINED_FUNCTION_32_1();
      if (v29) {
        uint64_t v61 = v60;
      }
      else {
        uint64_t v61 = v59;
      }
    }
    else
    {
      sub_2608634B4((uint64_t)&v190, &qword_26A8B4998);
      uint64_t v61 = 2;
    }
    *(void *)&long long v190 = 0xEE00736576727545;
    *((void *)&v190 + 1) = 0xED000079616C6544;
    OUTLINED_FUNCTION_40_1(v61);
    strcpy((char *)&v190, "DeviceTypeHint");
    HIBYTE(v190) = -18;
    uint64_t v62 = sub_26087BC00();
    id v63 = OUTLINED_FUNCTION_56_1(v62, sel___swift_objectForKeyedSubscript_);
    OUTLINED_FUNCTION_59_1();
    if (v58)
    {
      OUTLINED_FUNCTION_54_0();
      uint64_t v64 = swift_unknownObjectRelease();
    }
    else
    {
      OUTLINED_FUNCTION_53_1();
    }
    OUTLINED_FUNCTION_55_1(v64, v65, &qword_26A8B4998);
    if (v192)
    {
      if (OUTLINED_FUNCTION_25_5()) {
        uint64_t v66 = (uint64_t)v189;
      }
      else {
        uint64_t v66 = 0;
      }
    }
    else
    {
      sub_2608634B4((uint64_t)&v190, &qword_26A8B4998);
      uint64_t v66 = 0;
    }
    strcpy((char *)&v190, "DeviceTypeHint");
    HIBYTE(v190) = -18;
    OUTLINED_FUNCTION_129(v66);
    swift_bridgeObjectRelease();
    uint64_t v67 = sub_26087BC00();
    id v68 = OUTLINED_FUNCTION_56_1(v67, sel___swift_objectForKeyedSubscript_);
    OUTLINED_FUNCTION_59_1();
    if (v58)
    {
      OUTLINED_FUNCTION_54_0();
      uint64_t v69 = swift_unknownObjectRelease();
    }
    else
    {
      OUTLINED_FUNCTION_53_1();
    }
    OUTLINED_FUNCTION_55_1(v69, v70, &qword_26A8B4998);
    if (v192)
    {
      sub_26081221C(0, &qword_26A8B49A0);
      if (OUTLINED_FUNCTION_25_5())
      {
        sub_2608547C8((uint64_t)v189, v71, v72, v73, v74, v75, v76, v77, v187, v188);
        uint64_t v79 = v78;

LABEL_70:
        int64_t v80 = *(void *)(v79 + 16);
        if (v80)
        {
          *(void *)&long long v190 = MEMORY[0x263F8EE78];
          sub_2607E9D38(0, v80, 0);
          uint64_t v81 = v190;
          unint64_t v82 = *(void *)(v190 + 16);
          uint64_t v83 = 16 * v82;
          uint64_t v84 = (unsigned __int16 *)(v79 + 34);
          do
          {
            uint64_t v85 = (void *)*(v84 - 1);
            uint64_t v86 = *v84;
            *(void *)&long long v190 = v81;
            unint64_t v87 = *(void *)(v81 + 24);
            unint64_t v88 = v82 + 1;
            if (v82 >= v87 >> 1)
            {
              uint64_t v187 = v86;
              uint64_t v188 = v85;
              sub_2607E9D38((char *)(v87 > 1), v82 + 1, 1);
              uint64_t v86 = v187;
              uint64_t v85 = v188;
              uint64_t v81 = v190;
            }
            v84 += 2;
            *(void *)(v81 + 16) = v88;
            uint64_t v89 = v81 + v83;
            *(void *)(v89 + 32) = v86;
            *(void *)(v89 + 40) = v85;
            v83 += 16;
            unint64_t v82 = v88;
            --v80;
          }
          while (v80);
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v81 = MEMORY[0x263F8EE78];
        }
        *(void *)&long long v190 = 0xEE0073657672753FLL;
        *((void *)&v190 + 1) = 0x8000000260884640;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B54C8);
        sub_260861288((uint64_t)&unk_26A8B5510);
        OUTLINED_FUNCTION_98_0();
        OUTLINED_FUNCTION_82_0();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_128(0xD000000000000019);
        uint64_t v90 = sub_26087BC00();
        id v91 = OUTLINED_FUNCTION_56_1(v90, sel___swift_objectForKeyedSubscript_);
        OUTLINED_FUNCTION_59_1();
        if (&qword_26A8B54C8)
        {
          OUTLINED_FUNCTION_54_0();
          uint64_t v92 = swift_unknownObjectRelease();
        }
        else
        {
          OUTLINED_FUNCTION_53_1();
        }
        OUTLINED_FUNCTION_55_1(v92, v93, &qword_26A8B4998);
        if (v192)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B5450);
          OUTLINED_FUNCTION_25_5();
        }
        else
        {
          sub_2608634B4((uint64_t)&v190, &qword_26A8B4998);
        }
        *(void *)&long long v190 = 0xD000000000000019;
        *((void *)&v190 + 1) = v81 | 0x8000000000000000;
        uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B5450);
        sub_26086133C((uint64_t)&unk_26A8B5520);
        OUTLINED_FUNCTION_98_0();
        OUTLINED_FUNCTION_82_0();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_118();
        *(void *)&long long v190 = 0xD000000000000012;
        *((void *)&v190 + 1) = 0x8000000260884F10;
        uint64_t v95 = sub_26087BC00();
        id v96 = OUTLINED_FUNCTION_56_1(v95, sel___swift_objectForKeyedSubscript_);
        OUTLINED_FUNCTION_59_1();
        if (v94)
        {
          OUTLINED_FUNCTION_54_0();
          uint64_t v97 = swift_unknownObjectRelease();
        }
        else
        {
          OUTLINED_FUNCTION_53_1();
        }
        OUTLINED_FUNCTION_55_1(v97, v98, &qword_26A8B4998);
        if (v192)
        {
          if (OUTLINED_FUNCTION_25_5()) {
            uint64_t v99 = (uint64_t)v189;
          }
          else {
            uint64_t v99 = 0;
          }
        }
        else
        {
          sub_2608634B4((uint64_t)&v190, &qword_26A8B4998);
          uint64_t v99 = 0;
        }
        *(void *)&long long v190 = 0xD000000000000012;
        *((void *)&v190 + 1) = 0x8000000260884F10;
        OUTLINED_FUNCTION_129(v99);
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_128(0xEE0073657672754CLL);
        uint64_t v100 = sub_26087BC00();
        id v101 = OUTLINED_FUNCTION_56_1(v100, sel___swift_objectForKeyedSubscript_);
        OUTLINED_FUNCTION_59_1();
        if (v94)
        {
          OUTLINED_FUNCTION_54_0();
          uint64_t v102 = swift_unknownObjectRelease();
        }
        else
        {
          OUTLINED_FUNCTION_53_1();
        }
        OUTLINED_FUNCTION_55_1(v102, v103, &qword_26A8B4998);
        if (v192)
        {
          OUTLINED_FUNCTION_25_5();
          OUTLINED_FUNCTION_32_1();
          if (v29) {
            uint64_t v106 = v105;
          }
          else {
            uint64_t v106 = v104;
          }
        }
        else
        {
          sub_2608634B4((uint64_t)&v190, &qword_26A8B4998);
          uint64_t v106 = 2;
        }
        *(void *)&long long v190 = 0xEE0073657672754CLL;
        *((void *)&v190 + 1) = 0xD000000000000012;
        OUTLINED_FUNCTION_40_1(v106);
        *(void *)&long long v190 = 0x437972746E756F43;
        *((void *)&v190 + 1) = 0xEB0000000065646FLL;
        uint64_t v107 = sub_26087BC00();
        id v108 = OUTLINED_FUNCTION_56_1(v107, sel___swift_objectForKeyedSubscript_);
        OUTLINED_FUNCTION_59_1();
        if (v94)
        {
          OUTLINED_FUNCTION_54_0();
          uint64_t v109 = swift_unknownObjectRelease();
        }
        else
        {
          OUTLINED_FUNCTION_53_1();
        }
        OUTLINED_FUNCTION_55_1(v109, v110, &qword_26A8B4998);
        if (v192)
        {
          int v111 = OUTLINED_FUNCTION_25_5();
          uint64_t v112 = OUTLINED_FUNCTION_112(v111);
        }
        else
        {
          sub_2608634B4((uint64_t)&v190, &qword_26A8B4998);
          uint64_t v112 = OUTLINED_FUNCTION_41();
        }
        *(void *)&long long v190 = 0x437972746E756F43;
        *((void *)&v190 + 1) = 0xEB0000000065646FLL;
        OUTLINED_FUNCTION_5_19(v112, v113);
        uint64_t v114 = HIDServiceProperties.subscript.getter();
        *(void *)&long long v190 = 0xEE0073657672753FLL;
        *((void *)&v190 + 1) = 0x8000000260884F60;
        OUTLINED_FUNCTION_39_1(v114, v115);
        swift_bridgeObjectRelease();
        uint64_t v116 = HIDServiceProperties.subscript.getter();
        strcpy((char *)&v190, "StandardType");
        BYTE13(v190) = 0;
        HIWORD(v190) = -5120;
        OUTLINED_FUNCTION_5_19(v116, v117 & 1);
        uint64_t v118 = HIDServiceProperties.subscript.getter();
        uint64_t v120 = v119;
        strcpy((char *)&v190, "Manufacturer");
        BYTE13(v190) = 0;
        HIWORD(v190) = -5120;
        OUTLINED_FUNCTION_39_1(v118, v119);
        swift_bridgeObjectRelease();
        uint64_t v121 = OUTLINED_FUNCTION_38_1();
        *(void *)&long long v190 = 0xEE0073657672753FLL;
        *((void *)&v190 + 1) = 0x74636166756E614DLL;
        OUTLINED_FUNCTION_5_19(v121, v122 & 1);
        uint64_t v123 = OUTLINED_FUNCTION_66_1();
        *(void *)&long long v190 = 0xEE00736576727545;
        *((void *)&v190 + 1) = v120;
        OUTLINED_FUNCTION_5_19(v123, v124 & 1);
        uint64_t v125 = OUTLINED_FUNCTION_67_1();
        *(void *)&long long v190 = v125;
        *((void *)&v190 + 1) = v126;
        sub_2608613A0();
        OUTLINED_FUNCTION_82_0();
        OUTLINED_FUNCTION_146();
        uint64_t v127 = OUTLINED_FUNCTION_66_1();
        *(void *)&long long v190 = 0xEE0073657672754BLL;
        *((void *)&v190 + 1) = v120;
        OUTLINED_FUNCTION_5_19(v127, v128 & 1);
        uint64_t v129 = OUTLINED_FUNCTION_67_1();
        OUTLINED_FUNCTION_158(v129, v130);
        OUTLINED_FUNCTION_82_0();
        OUTLINED_FUNCTION_146();
        uint64_t v131 = OUTLINED_FUNCTION_120();
        uint64_t v133 = v132;
        *(void *)&long long v190 = 0xEE00736576727545;
        *((void *)&v190 + 1) = v125;
        OUTLINED_FUNCTION_39_1(v131, v132);
        swift_bridgeObjectRelease();
        uint64_t v134 = OUTLINED_FUNCTION_66_1();
        *(void *)&long long v190 = 0xEE00736576727540;
        *((void *)&v190 + 1) = v133;
        OUTLINED_FUNCTION_5_19(v134, v135 & 1);
        uint64_t v136 = OUTLINED_FUNCTION_38_1();
        *(void *)&long long v190 = 0xEE0073657672753FLL;
        *((void *)&v190 + 1) = 0xEE00736576727540;
        OUTLINED_FUNCTION_5_19(v136, v137 & 1);
        uint64_t v138 = OUTLINED_FUNCTION_38_1();
        *(void *)&long long v190 = 0xEE0073657672753FLL;
        *((void *)&v190 + 1) = 0xEE00736576727540;
        OUTLINED_FUNCTION_5_19(v138, v139 & 1);
        uint64_t v140 = OUTLINED_FUNCTION_38_1();
        *(void *)&long long v190 = 0xEE0073657672753FLL;
        *((void *)&v190 + 1) = 0xEE00736576727540;
        OUTLINED_FUNCTION_5_19(v140, v141 & 1);
        uint64_t v142 = HIDServiceProperties.subscript.getter();
        strcpy((char *)&v190, "PrimaryUsage");
        BYTE13(v190) = 0;
        HIWORD(v190) = -5120;
        OUTLINED_FUNCTION_5_19(v142, v143 & 1);
        uint64_t v144 = HIDServiceProperties.subscript.getter();
        *(void *)&long long v190 = 0xEE0073657672753FLL;
        *((void *)&v190 + 1) = 0x8000000260885090;
        OUTLINED_FUNCTION_5_19(v144, v145 & 1);
        uint64_t v146 = HIDServiceProperties.subscript.getter();
        *(void *)&long long v190 = 0x746375646F7250;
        *((void *)&v190 + 1) = 0xE700000000000000;
        OUTLINED_FUNCTION_39_1(v146, v147);
        swift_bridgeObjectRelease();
        uint64_t v148 = HIDServiceProperties.subscript.getter();
        *(void *)&long long v190 = 0x49746375646F7250;
        *((void *)&v190 + 1) = 0xE900000000000044;
        OUTLINED_FUNCTION_5_19(v148, v149 & 1);
        uint64_t v150 = HIDServiceProperties.subscript.getter();
        strcpy((char *)&v190, "ReportInterval");
        HIBYTE(v190) = -18;
        OUTLINED_FUNCTION_5_19(v150, v151 & 1);
        uint64_t v152 = OUTLINED_FUNCTION_67_1();
        OUTLINED_FUNCTION_158(v152, v153);
        OUTLINED_FUNCTION_82_0();
        OUTLINED_FUNCTION_146();
        uint64_t v154 = OUTLINED_FUNCTION_120();
        *(void *)&long long v190 = 0xEE00736576727544;
        *((void *)&v190 + 1) = 0xEE006C6176726574;
        OUTLINED_FUNCTION_39_1(v154, v155);
        swift_bridgeObjectRelease();
        uint64_t v157 = HIDServiceProperties.subscript.getter(0xD000000000000014, 0x8000000260885130, v156, v193);
        if (v157)
        {
          uint64_t v165 = (void *)v157;
          sub_2608549D8(v157, v158, v159, v160, v161, v162, v163, v164, v187, (NSDictionary)v188);
        }
        *(void *)&long long v190 = 0xEE0073657672753FLL;
        *((void *)&v190 + 1) = 0x8000000260885130;
        OUTLINED_FUNCTION_98_0();
        OUTLINED_FUNCTION_82_0();
        swift_bridgeObjectRelease();
        uint64_t v166 = OUTLINED_FUNCTION_68_1();
        *(void *)&long long v190 = 0xEE0073657672753ELL;
        *((void *)&v190 + 1) = 0x8000000260885130;
        OUTLINED_FUNCTION_5_19(v166, v167 & 1);
        uint64_t v168 = OUTLINED_FUNCTION_68_1();
        *(void *)&long long v190 = 0xEE0073657672753ELL;
        *((void *)&v190 + 1) = 0x8000000260885130;
        OUTLINED_FUNCTION_5_19(v168, v169 & 1);
        uint64_t v170 = OUTLINED_FUNCTION_68_1();
        *(void *)&long long v190 = 0xEE0073657672753CLL;
        *((void *)&v190 + 1) = 0x8000000260885130;
        OUTLINED_FUNCTION_5_19(v170, v171 & 1);
        uint64_t v172 = HIDServiceProperties.subscript.getter();
        *(void *)&long long v190 = 0xEE00736576727543;
        *((void *)&v190 + 1) = 0x80000002608851B0;
        OUTLINED_FUNCTION_40_1(v172);
        uint64_t v174 = HIDServiceProperties.subscript.getter(0xEE0073657672753CLL, 0x80000002608851D0, v173, v193);
        if (v174)
        {
          *(UniversalHID::HIDServiceProperties::HIDSurfaceDimensions_optional *)(&v174 - 2) = HIDServiceProperties.HIDSurfaceDimensions.init(dictionaryRepresentation:)((NSDictionary)v174);
          char v177 = v176 & 1;
        }
        else
        {
          uint64_t v175 = 0;
          char v177 = 1;
        }
        *(void *)&long long v190 = v174;
        *((void *)&v190 + 1) = v175;
        char v191 = v177;
        sub_2608613EC();
        OUTLINED_FUNCTION_82_0();
        uint64_t v178 = HIDServiceProperties.subscript.getter();
        uint64_t v180 = v179;
        *(void *)&long long v190 = 0x726F70736E617254;
        *((void *)&v190 + 1) = 0xE900000000000074;
        OUTLINED_FUNCTION_39_1(v178, v179);
        swift_bridgeObjectRelease();
        uint64_t v181 = OUTLINED_FUNCTION_121();
        *(void *)&long long v190 = 0xEE00736576727542;
        *((void *)&v190 + 1) = v180;
        OUTLINED_FUNCTION_5_19(v181, v182 & 1);
        uint64_t v183 = OUTLINED_FUNCTION_121();
        *(void *)&long long v190 = 0xEE00736576727548;
        *((void *)&v190 + 1) = v180;
        OUTLINED_FUNCTION_5_19(v183, v184 & 1);
        uint64_t v185 = HIDServiceProperties.subscript.getter();
        *(void *)&long long v190 = 0x4449726F646E6556;
        *((void *)&v190 + 1) = 0xE800000000000000;
        OUTLINED_FUNCTION_5_19(v185, v186 & 1);
        goto LABEL_30;
      }
    }
    else
    {
      sub_2608634B4((uint64_t)&v190, &qword_26A8B4998);
    }
    uint64_t v79 = MEMORY[0x263F8EE78];
    goto LABEL_70;
  }
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v1, v7);
LABEL_31:
  OUTLINED_FUNCTION_72_0();
}

uint64_t sub_260860444(uint64_t a1, void *a2)
{
  *(void *)&long long v20 = 0xD000000000000010;
  *((void *)&v20 + 1) = 0x8000000260885090;
  id v3 = objc_msgSend(a2, sel___swift_objectForKeyedSubscript_, sub_26087BC00(), v20);
  swift_unknownObjectRelease();
  if (v3)
  {
    sub_26087B730();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
  }
  sub_260860824((uint64_t)&v20, (uint64_t)v22, &qword_26A8B4998);
  if (!v23)
  {
    sub_2608634B4((uint64_t)v22, &qword_26A8B4998);
    goto LABEL_9;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_9:
    sub_26081221C(0, (unint64_t *)&qword_26A8B4E38);
    uint64_t v5 = 0xD000000000000022;
    uint64_t v6 = 0x80000002608857C0;
LABEL_17:
    sub_260850658(22, v5, v6);
    return swift_willThrow();
  }
  strcpy((char *)&v20, "PrimaryUsage");
  BYTE13(v20) = 0;
  HIWORD(v20) = -5120;
  id v4 = objc_msgSend(a2, sel___swift_objectForKeyedSubscript_, sub_26087BC00());
  swift_unknownObjectRelease();
  if (v4)
  {
    sub_26087B730();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
  }
  sub_260860824((uint64_t)&v20, (uint64_t)v22, &qword_26A8B4998);
  if (!v23)
  {
    sub_2608634B4((uint64_t)v22, &qword_26A8B4998);
    goto LABEL_16;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_16:
    sub_26081221C(0, (unint64_t *)&qword_26A8B4E38);
    uint64_t v5 = 0xD00000000000001DLL;
    uint64_t v6 = 0x80000002608857F0;
    goto LABEL_17;
  }
  *(void *)&long long v20 = 0xD000000000000010;
  *((void *)&v20 + 1) = 0x8000000260884640;
  id v7 = objc_msgSend(a2, sel___swift_objectForKeyedSubscript_, sub_26087BC00());
  swift_unknownObjectRelease();
  if (v7)
  {
    sub_26087B730();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
  }
  sub_260860824((uint64_t)&v20, (uint64_t)v22, &qword_26A8B4998);
  if (v23)
  {
    sub_26081221C(0, &qword_26A8B49A0);
    if (swift_dynamicCast())
    {
      uint64_t v16 = v24;
      sub_2608547C8((uint64_t)v24, v9, v10, v11, v12, v13, v14, v15, v20, *((void **)&v20 + 1));
      uint64_t v18 = v17;

      goto LABEL_25;
    }
  }
  else
  {
    sub_2608634B4((uint64_t)v22, &qword_26A8B4998);
  }
  uint64_t v18 = MEMORY[0x263F8EE78];
LABEL_25:
  uint64_t v19 = *(void *)(v18 + 16);
  uint64_t result = swift_bridgeObjectRelease();
  if (!v19)
  {
    sub_26081221C(0, (unint64_t *)&qword_26A8B4E38);
    uint64_t v5 = 0xD000000000000022;
    uint64_t v6 = 0x8000000260885810;
    goto LABEL_17;
  }
  return result;
}

uint64_t sub_26086081C(uint64_t result)
{
  *(unsigned char *)(result + 137) = 0;
  return result;
}

uint64_t sub_260860824(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_2_15();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

unint64_t sub_260860880()
{
  unint64_t result = qword_26A8B5480;
  if (!qword_26A8B5480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5480);
  }
  return result;
}

unint64_t sub_2608608CC()
{
  unint64_t result = qword_26A8B5498;
  if (!qword_26A8B5498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5498);
  }
  return result;
}

unint64_t sub_260860918()
{
  unint64_t result = qword_26A8B54C0;
  if (!qword_26A8B54C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B54C0);
  }
  return result;
}

unint64_t sub_260860964()
{
  unint64_t result = qword_26A8B54D8;
  if (!qword_26A8B54D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B54D8);
  }
  return result;
}

unint64_t sub_2608609B0()
{
  unint64_t result = qword_26A8B54E8;
  if (!qword_26A8B54E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B54E8);
  }
  return result;
}

unint64_t sub_2608609FC()
{
  unint64_t result = qword_26A8B54F0;
  if (!qword_26A8B54F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B54F0);
  }
  return result;
}

uint64_t HIDServiceProperties.init(service:)(uint64_t a1, uint64_t a2)
{
  void (*v12)(long long *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  id v20;
  long long v21;
  uint64_t v22;
  long long v23;
  uint64_t v24;
  uint64_t v25;

  uint64_t v3 = v2;
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9A0]), sel_init);
  uint64_t ObjectType = swift_getObjectType();
  id v7 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 16);
  id v8 = v5;
  uint64_t v25 = ObjectType;
  uint64_t v9 = v7(ObjectType, a2);
  uint64_t v10 = static HIDServicePropertyKey.allCases.getter();
  uint64_t v11 = *(void *)(v10 + 16);
  if (v11)
  {
    uint64_t v19 = v9;
    long long v20 = v8;
    uint64_t v12 = *(void (**)(long long *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t))(a2 + 48);
    uint64_t v13 = (uint64_t *)(v10 + 40);
    do
    {
      uint64_t v15 = *(v13 - 1);
      uint64_t v14 = *v13;
      swift_bridgeObjectRetain();
      v12(&v21, v15, v14, v25, a2);
      if (v22)
      {
        sub_2607F7344(&v21, &v23);
        uint64_t v16 = a2;
        __swift_project_boxed_opaque_existential_1(&v23, v24);
        uint64_t v17 = sub_26087BBD0();
        *(void *)&long long v21 = v15;
        *((void *)&v21 + 1) = v14;
        swift_bridgeObjectRetain();
        objc_msgSend(v20, sel___swift_setObject_forKeyedSubscript_, v17, sub_26087BC00());
        a2 = v16;
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v23);
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        sub_2608634B4((uint64_t)&v21, &qword_26A8B4998);
      }
      v13 += 2;
      --v11;
    }
    while (v11);
    swift_bridgeObjectRelease();
    uint64_t v3 = v2;
    id v8 = v20;
    uint64_t v9 = v19;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_260860444(v9, v8);

  if (v3) {
  swift_unknownObjectRelease();
  }
  return v9;
}

void HIDServiceProperties.init(usages:)(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9A0]), sel_init);
  if (*(void *)(a1 + 16))
  {
    HIDServiceProperties.primaryUsagePair.setter();
    HIDServiceProperties.deviceUsagePairs.setter(a1);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_26081221C(0, (unint64_t *)&qword_26A8B4E38);
    sub_260850658(22, 0xD000000000000022, 0x80000002608856A0);
    swift_willThrow();
  }
}

void sub_260860D38(void *a1@<X8>)
{
  HIDServiceProperties.init(from:)();
  if (!v1)
  {
    *a1 = v3;
    a1[1] = v4;
  }
}

void sub_260860D64()
{
}

uint64_t static HIDServiceProperties.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 != a3) {
    return 0;
  }
  sub_26081221C(0, &qword_26A8B49A8);
  return sub_26087B600() & 1;
}

uint64_t sub_260860DE4(uint64_t *a1, uint64_t *a2)
{
  return static HIDServiceProperties.== infix(_:_:)(*a1, a1[1], *a2);
}

void HIDServiceProperties.hash(into:)(uint64_t a1, uint64_t a2, void *a3)
{
  sub_26087BCF0();
  id v4 = a3;
  sub_26087B610();
}

uint64_t HIDServiceProperties.hashValue.getter(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_63_1();
  sub_26087BCF0();
  id v3 = a2;
  sub_26087B610();

  return sub_26087BD00();
}

uint64_t sub_260860EB8()
{
  return HIDServiceProperties.hashValue.getter(*(void *)v0, *(void **)(v0 + 8));
}

void sub_260860EC0(uint64_t a1)
{
  HIDServiceProperties.hash(into:)(a1, *(void *)v1, *(void **)(v1 + 8));
}

uint64_t sub_260860EC8()
{
  uint64_t v1 = *(void **)(v0 + 8);
  sub_26087BCA0();
  sub_26087BCF0();
  id v2 = v1;
  sub_26087B610();

  return sub_26087BD00();
}

void sub_260860F28(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_260860F34(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  sub_26087B330();
  sub_26087B330();
  return 2625692192;
}

uint64_t HIDServiceProperties.description.getter(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = HIDDeviceType.init(properties:)(a1, v3);
  uint64_t v47 = HIDDeviceType.description.getter(v4);
  uint64_t v48 = v5;
  sub_26087B330();
  sub_26080707C();
  sub_26087B360();
  sub_26087B330();
  swift_bridgeObjectRelease();
  sub_26087B330();
  uint64_t v44 = 0x746375646F7250;
  unint64_t v45 = 0xE700000000000000;
  id v6 = objc_msgSend(v3, sel___swift_objectForKeyedSubscript_, sub_26087BC00());
  swift_unknownObjectRelease();
  if (v6)
  {
    OUTLINED_FUNCTION_61_1();
    uint64_t v7 = swift_unknownObjectRelease();
  }
  else
  {
    double v11 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v7, v8, &qword_26A8B4998, v9, v10, v11);
  if (v46)
  {
    int v12 = OUTLINED_FUNCTION_7_20();
    uint64_t v20 = OUTLINED_FUNCTION_24_5(v12, v13, v14, v15, v16, v17, v18, v19, v43);
    if (v22) {
      uint64_t v23 = 0;
    }
    else {
      uint64_t v23 = v21;
    }
  }
  else
  {
    sub_2608634B4((uint64_t)&v44, &qword_26A8B4998);
    uint64_t v20 = 0;
    uint64_t v23 = 0;
  }
  sub_260860F34(v20, v23);
  swift_bridgeObjectRelease();
  sub_26087B330();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_142();
  uint64_t v44 = v24;
  unint64_t v45 = 0xEC00000072657275;
  id v25 = objc_msgSend(v3, sel___swift_objectForKeyedSubscript_, sub_26087BC00());
  swift_unknownObjectRelease();
  if (v25)
  {
    OUTLINED_FUNCTION_61_1();
    uint64_t v26 = swift_unknownObjectRelease();
  }
  else
  {
    double v30 = OUTLINED_FUNCTION_9_21();
  }
  OUTLINED_FUNCTION_8_23(v26, v27, &qword_26A8B4998, v28, v29, v30);
  if (v46)
  {
    int v31 = OUTLINED_FUNCTION_7_20();
    uint64_t v39 = OUTLINED_FUNCTION_24_5(v31, v32, v33, v34, v35, v36, v37, v38, v43);
    if (v22) {
      uint64_t v41 = 0;
    }
    else {
      uint64_t v41 = v40;
    }
  }
  else
  {
    sub_2608634B4((uint64_t)&v44, &qword_26A8B4998);
    uint64_t v39 = 0;
    uint64_t v41 = 0;
  }
  sub_260860F34(v39, v41);
  swift_bridgeObjectRelease();
  sub_26087B330();
  swift_bridgeObjectRelease();
  return v47;
}

uint64_t sub_260861234()
{
  return HIDServiceProperties.description.getter(*(void *)v0, *(void **)(v0 + 8));
}

unint64_t sub_26086123C()
{
  unint64_t result = qword_26A8B5508;
  if (!qword_26A8B5508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5508);
  }
  return result;
}

unint64_t sub_260861288(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_150(a1);
  if (!result)
  {
    uint64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    v5();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_2608612F0()
{
  unint64_t result = qword_26A8B5518;
  if (!qword_26A8B5518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5518);
  }
  return result;
}

unint64_t sub_26086133C(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_150(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A8B5450);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_2608613A0()
{
  unint64_t result = qword_26A8B5528;
  if (!qword_26A8B5528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5528);
  }
  return result;
}

unint64_t sub_2608613EC()
{
  unint64_t result = qword_26A8B5530;
  if (!qword_26A8B5530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5530);
  }
  return result;
}

unint64_t sub_26086143C()
{
  unint64_t result = qword_26A8B5538;
  if (!qword_26A8B5538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5538);
  }
  return result;
}

unint64_t sub_26086148C()
{
  unint64_t result = qword_26A8B5540;
  if (!qword_26A8B5540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5540);
  }
  return result;
}

unint64_t sub_2608614DC()
{
  unint64_t result = qword_26A8B5548;
  if (!qword_26A8B5548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5548);
  }
  return result;
}

uint64_t sub_260861528()
{
  return MEMORY[0x263F8E980];
}

uint64_t sub_260861544@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_260855B2C(a1, a2, a3, (uint64_t (*)(void, void, uint64_t, void))HIDServiceProperties.subscript.getter, a4);
}

uint64_t sub_26086158C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_260855B2C(a1, a2, a3, (uint64_t (*)(void, void, uint64_t, void))HIDServiceProperties.subscript.getter, a4);
}

uint64_t sub_2608615C8(id *a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  return sub_2608560DC(a1, a2, a3, a4, (uint64_t (*)(id, uint64_t, uint64_t))HIDServiceProperties.subscript.setter);
}

uint64_t sub_260861600(id *a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  return sub_2608560DC(a1, a2, a3, a4, (uint64_t (*)(id, uint64_t, uint64_t))HIDServiceProperties.subscript.setter);
}

uint64_t sub_260861650(unsigned __int8 *a1)
{
  char v1 = OUTLINED_FUNCTION_5_13(a1);
  return HIDServiceProperties.appleVendorSupported.setter(v1);
}

uint64_t sub_260861678(unsigned __int8 *a1)
{
  return HIDServiceProperties.authenticatedDevice.setter();
}

uint64_t sub_2608616A0(unsigned __int8 *a1)
{
  char v1 = OUTLINED_FUNCTION_5_13(a1);
  return HIDServiceProperties.builtIn.setter(v1);
}

uint64_t sub_2608616C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_26085B4C0(a1, a2, a3, (uint64_t (*)(uint64_t, void))HIDServiceProperties.capsLockDelay.getter);
}

uint64_t sub_2608616F8(unsigned __int8 *a1)
{
  char v1 = OUTLINED_FUNCTION_5_13(a1);
  return HIDServiceProperties.capsLockLanguageSwitch.setter(v1);
}

uint64_t sub_260861720(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_26085AB38(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))HIDServiceProperties.deviceTypeHint.setter);
}

uint64_t sub_260861758(unsigned __int8 *a1)
{
  char v1 = OUTLINED_FUNCTION_5_13(a1);
  return HIDServiceProperties.disableAccessibilityEventTranslation.setter(v1);
}

uint64_t sub_260861780(unsigned __int8 *a1)
{
  char v1 = OUTLINED_FUNCTION_5_13(a1);
  return HIDServiceProperties.dispatchScrollEvents.setter(v1);
}

uint64_t sub_2608617A8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_26085AB38(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))HIDServiceProperties.displayIdentifier.setter);
}

uint64_t sub_2608617D8(unsigned __int8 *a1)
{
  char v1 = OUTLINED_FUNCTION_5_13(a1);
  return HIDServiceProperties.displayIntegrated.setter(v1);
}

uint64_t sub_260861808(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_26085AB38(a1, a2, a3, a4, HIDServiceProperties.exclusivityIdentifier.setter);
}

uint64_t sub_260861834(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_26085B4C0(a1, a2, a3, (uint64_t (*)(uint64_t, void))HIDServiceProperties.faceTimeRemoteControlSessionID.getter);
}

uint64_t sub_260861868(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_26085AB38(a1, a2, a3, a4, HIDServiceProperties.fnKeyboardUsageMap.setter);
}

uint64_t sub_260861898(unsigned __int8 *a1)
{
  char v1 = OUTLINED_FUNCTION_5_13(a1);
  return HIDServiceProperties.ignoresNaturalScrollingPreference.setter(v1);
}

uint64_t sub_2608618BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_26085B4C0(a1, a2, a3, (uint64_t (*)(uint64_t, void))HIDServiceProperties.keyboardCountryCode.getter);
}

uint64_t sub_2608618F0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_26085AB38(a1, a2, a3, a4, HIDServiceProperties.keyboardLanguage.setter);
}

uint64_t sub_26086191C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_26085B4C0(a1, a2, a3, (uint64_t (*)(uint64_t, void))HIDServiceProperties.keyboardStandardType.getter);
}

uint64_t sub_260861950(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_26085AB38(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))HIDServiceProperties.manufacturer.setter);
}

uint64_t sub_26086197C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_26085B4C0(a1, a2, a3, (uint64_t (*)(uint64_t, void))HIDServiceProperties.mouseAcceleration.getter);
}

uint64_t sub_2608619AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_26085B4C0(a1, a2, a3, (uint64_t (*)(uint64_t, void))HIDServiceProperties.mouseScrollAcceleration.getter);
}

uint64_t sub_2608619E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_26085B4C0(a1, a2, a3, HIDServiceProperties.pointerAccelerationMultiplier.getter);
}

uint64_t sub_260861A20(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_26085AB38(a1, a2, a3, a4, HIDServiceProperties.pointerAccelerationType.setter);
}

uint64_t sub_260861A4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_26085B4C0(a1, a2, a3, (uint64_t (*)(uint64_t, void))HIDServiceProperties.pointerButtonCount.getter);
}

uint64_t sub_260861A7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_26085B4C0(a1, a2, a3, (uint64_t (*)(uint64_t, void))HIDServiceProperties.pointerButtonMode.getter);
}

uint64_t sub_260861AAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_26085B4C0(a1, a2, a3, (uint64_t (*)(uint64_t, void))HIDServiceProperties.pointerResolution.getter);
}

uint64_t sub_260861ADC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_26085B4C0(a1, a2, a3, (uint64_t (*)(uint64_t, void))HIDServiceProperties.pointerReportRate.getter);
}

uint64_t sub_260861B10()
{
  return HIDServiceProperties.primaryUsagePair.setter();
}

uint64_t sub_260861B3C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_26085AB38(a1, a2, a3, a4, HIDServiceProperties.product.setter);
}

uint64_t sub_260861B68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_26085B4C0(a1, a2, a3, (uint64_t (*)(uint64_t, void))HIDServiceProperties.productID.getter);
}

uint64_t sub_260861BAC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_26085AB38(a1, a2, a3, a4, HIDServiceProperties.scrollAccelerationType.setter);
}

uint64_t sub_260861BE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_26085B4C0(a1, a2, a3, HIDServiceProperties.scrollReportRate.getter);
}

uint64_t sub_260861C10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_26085B4C0(a1, a2, a3, HIDServiceProperties.scrollResolution.getter);
}

uint64_t sub_260861C44(unsigned __int8 *a1)
{
  char v1 = OUTLINED_FUNCTION_5_13(a1);
  return HIDServiceProperties.supportsGestureScrolling.setter(v1);
}

uint64_t sub_260861C68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_26085B4C0(a1, a2, a3, HIDServiceProperties.trackpadAcceleration.getter);
}

uint64_t sub_260861C98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_26085B4C0(a1, a2, a3, HIDServiceProperties.trackpadScrollAcceleration.getter);
}

uint64_t sub_260861CCC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_26085AB38(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))HIDServiceProperties.transport.setter);
}

uint64_t sub_260861CFC(unsigned __int8 *a1)
{
  char v1 = OUTLINED_FUNCTION_5_13(a1);
  return HIDServiceProperties.universalControlBuiltIn.setter(v1);
}

uint64_t sub_260861D24(unsigned __int8 *a1)
{
  char v1 = OUTLINED_FUNCTION_5_13(a1);
  return HIDServiceProperties.universalControlVirtualService.setter(v1);
}

uint64_t sub_260861D4C(unsigned __int8 *a1)
{
  char v1 = OUTLINED_FUNCTION_5_13(a1);
  return HIDServiceProperties.userDeviceCreateInactive.setter(v1);
}

uint64_t sub_260861D74(unsigned __int8 *a1)
{
  char v1 = OUTLINED_FUNCTION_5_13(a1);
  return HIDServiceProperties.useRemoteAcceleration.setter(v1);
}

uint64_t sub_260861D98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_26085B4C0(a1, a2, a3, HIDServiceProperties.vendorID.getter);
}

uint64_t sub_260861DC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_26085B4C0(a1, a2, a3, (uint64_t (*)(uint64_t, void))HIDServiceProperties.reportInterval.getter);
}

uint64_t sub_260861DF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_26085B4C0(a1, a2, a3, (uint64_t (*)(uint64_t, void))HIDServiceProperties.subinterfaceID.getter);
}

uint64_t sub_260861E34(unsigned __int8 *a1)
{
  char v1 = OUTLINED_FUNCTION_5_13(a1);
  return HIDServiceProperties.scrollAccelerationSupport.setter(v1);
}

uint64_t sub_260861E5C(unsigned __int8 *a1)
{
  char v1 = OUTLINED_FUNCTION_5_13(a1);
  return HIDServiceProperties.pointerAccelerationSupport.setter(v1);
}

void *initializeBufferWithCopyOfBuffer for HIDServiceProperties(void *a1, void *a2)
{
  id v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  id v4 = v3;
  return a1;
}

void destroy for HIDServiceProperties(uint64_t a1)
{
}

void *assignWithCopy for HIDServiceProperties(void *a1, void *a2)
{
  *a1 = *a2;
  id v3 = (void *)a2[1];
  id v4 = (void *)a1[1];
  a1[1] = v3;
  id v5 = v3;

  return a1;
}

void *assignWithTake for HIDServiceProperties(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  id v4 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v3;

  return a1;
}

void type metadata accessor for HIDServiceProperties()
{
}

void *__swift_memcpy137_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x89uLL);
}

uint64_t getEnumTagSinglePayload for HIDServiceProperties.HIDAccelCurve(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 137)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for HIDServiceProperties.HIDAccelCurve(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 136) = 0;
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
  *(unsigned char *)(result + 137) = v3;
  return result;
}

void type metadata accessor for HIDServiceProperties.HIDAccelCurve()
{
}

void type metadata accessor for HIDServiceProperties.HIDSurfaceDimensions()
{
}

ValueMetadata *type metadata accessor for HIDServiceProperties.HIDDeviceUsagePair()
{
  return &type metadata for HIDServiceProperties.HIDDeviceUsagePair;
}

ValueMetadata *type metadata accessor for HIDServiceProperties.HIDSurfaceDimensions.HIDSurfaceDimensionsKey()
{
  return &type metadata for HIDServiceProperties.HIDSurfaceDimensions.HIDSurfaceDimensionsKey;
}

ValueMetadata *type metadata accessor for HIDServiceProperties.HIDAccelCurve.HIDAccelCurveKey()
{
  return &type metadata for HIDServiceProperties.HIDAccelCurve.HIDAccelCurveKey;
}

unint64_t sub_260862008()
{
  unint64_t result = qword_26A8B5550;
  if (!qword_26A8B5550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5550);
  }
  return result;
}

unint64_t sub_260862054()
{
  return sub_260863590((uint64_t)&unk_26A8B5558);
}

unint64_t sub_260862080()
{
  unint64_t result = qword_26A8B5568;
  if (!qword_26A8B5568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5568);
  }
  return result;
}

unint64_t sub_2608620CC()
{
  return sub_260863590((uint64_t)&unk_26A8B5570);
}

unint64_t sub_2608620F8()
{
  unint64_t result = qword_26A8B5580;
  if (!qword_26A8B5580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5580);
  }
  return result;
}

unint64_t sub_260862148()
{
  unint64_t result = qword_26A8B5588;
  if (!qword_26A8B5588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5588);
  }
  return result;
}

unint64_t sub_260862198()
{
  unint64_t result = qword_26A8B5590;
  if (!qword_26A8B5590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5590);
  }
  return result;
}

unint64_t sub_2608621E8()
{
  unint64_t result = qword_26A8B5598;
  if (!qword_26A8B5598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5598);
  }
  return result;
}

unint64_t sub_260862238()
{
  unint64_t result = qword_26A8B55A0;
  if (!qword_26A8B55A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B55A0);
  }
  return result;
}

unint64_t sub_260862284()
{
  unint64_t result = qword_26A8B55B0;
  if (!qword_26A8B55B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B55B0);
  }
  return result;
}

uint64_t sub_2608622D0(uint64_t a1, char a2)
{
  char v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B55D8);
  uint64_t v6 = sub_26087B9F0();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    if (!v10) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v14 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v13 << 6))
    {
      uint64_t v19 = (uint64_t *)(*(void *)(v5 + 48) + 16 * i);
      uint64_t v21 = *v19;
      uint64_t v20 = v19[1];
      char v22 = (_OWORD *)(*(void *)(v5 + 56) + 32 * i);
      if (a2)
      {
        sub_2607F7344(v22, v35);
      }
      else
      {
        sub_26080964C((uint64_t)v22, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_26087BCA0();
      sub_26087B300();
      uint64_t result = sub_26087BD00();
      uint64_t v23 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v24 = result & ~v23;
      unint64_t v25 = v24 >> 6;
      if (((-1 << v24) & ~*(void *)(v11 + 8 * (v24 >> 6))) == 0)
      {
        char v27 = 0;
        unint64_t v28 = (unint64_t)(63 - v23) >> 6;
        while (++v25 != v28 || (v27 & 1) == 0)
        {
          BOOL v29 = v25 == v28;
          if (v25 == v28) {
            unint64_t v25 = 0;
          }
          v27 |= v29;
          uint64_t v30 = *(void *)(v11 + 8 * v25);
          if (v30 != -1)
          {
            unint64_t v26 = __clz(__rbit64(~v30)) + (v25 << 6);
            goto LABEL_31;
          }
        }
        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        return result;
      }
      unint64_t v26 = __clz(__rbit64((-1 << v24) & ~*(void *)(v11 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
LABEL_31:
      *(void *)(v11 + ((v26 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v26;
      int v31 = (void *)(*(void *)(v7 + 48) + 16 * v26);
      *int v31 = v21;
      v31[1] = v20;
      uint64_t result = (uint64_t)sub_2607F7344(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v26));
      ++*(void *)(v7 + 16);
      if (v10) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v16 = v13 + 1;
      if (__OFADD__(v13, 1)) {
        goto LABEL_40;
      }
      if (v16 >= v33) {
        goto LABEL_33;
      }
      unint64_t v17 = v34[v16];
      ++v13;
      if (!v17)
      {
        int64_t v13 = v16 + 1;
        if (v16 + 1 >= v33) {
          goto LABEL_33;
        }
        unint64_t v17 = v34[v13];
        if (!v17)
        {
          int64_t v18 = v16 + 2;
          if (v18 >= v33)
          {
LABEL_33:
            swift_release();
            char v3 = v2;
            if (a2)
            {
              uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
              if (v32 >= 64) {
                sub_260869EE8(0, (unint64_t)(v32 + 63) >> 6, v34);
              }
              else {
                *uint64_t v34 = -1 << v32;
              }
              *(void *)(v5 + 16) = 0;
            }
            break;
          }
          unint64_t v17 = v34[v18];
          if (!v17)
          {
            while (1)
            {
              int64_t v13 = v18 + 1;
              if (__OFADD__(v18, 1)) {
                goto LABEL_41;
              }
              if (v13 >= v33) {
                goto LABEL_33;
              }
              unint64_t v17 = v34[v13];
              ++v18;
              if (v17) {
                goto LABEL_18;
              }
            }
          }
          int64_t v13 = v18;
        }
      }
LABEL_18:
      unint64_t v10 = (v17 - 1) & v17;
    }
  }
  uint64_t result = swift_release();
  *char v3 = v7;
  return result;
}

uint64_t sub_2608625CC(uint64_t a1, int a2)
{
  char v3 = v2;
  uint64_t v5 = type metadata accessor for EventReportSenderID();
  uint64_t v40 = *(void *)(v5 - 8);
  uint64_t v41 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B4940);
  int v42 = a2;
  uint64_t v9 = sub_26087B9F0();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_40;
  }
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  uint64_t v39 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1 << v11);
  }
  else {
    uint64_t v13 = -1;
  }
  unint64_t v14 = v13 & v12;
  uint64_t v37 = v2;
  int64_t v38 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v15 = v9 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  if (!v14) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v18 = __clz(__rbit64(v14));
  v14 &= v14 - 1;
  for (unint64_t i = v18 | (v17 << 6); ; unint64_t i = __clz(__rbit64(v22)) + (v17 << 6))
  {
    uint64_t v24 = *(void *)(v40 + 72);
    uint64_t v25 = *(void *)(v8 + 48) + v24 * i;
    if (v42)
    {
      sub_2607F6BDC(v25, (uint64_t)v7);
      uint64_t v26 = *(void *)(*(void *)(v8 + 56) + 8 * i);
    }
    else
    {
      sub_2607F6B78(v25, (uint64_t)v7);
      uint64_t v26 = *(void *)(*(void *)(v8 + 56) + 8 * i);
      swift_retain();
    }
    sub_26087BCA0();
    sub_26087B0F0();
    sub_260863470((uint64_t)&qword_26A8B4750);
    sub_26087B220();
    sub_26087BCF0();
    uint64_t result = sub_26087BD00();
    uint64_t v27 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v28 = result & ~v27;
    unint64_t v29 = v28 >> 6;
    if (((-1 << v28) & ~*(void *)(v15 + 8 * (v28 >> 6))) == 0)
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v27) >> 6;
      while (++v29 != v32 || (v31 & 1) == 0)
      {
        BOOL v33 = v29 == v32;
        if (v29 == v32) {
          unint64_t v29 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v15 + 8 * v29);
        if (v34 != -1)
        {
          unint64_t v30 = __clz(__rbit64(~v34)) + (v29 << 6);
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
    unint64_t v30 = __clz(__rbit64((-1 << v28) & ~*(void *)(v15 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
LABEL_31:
    *(void *)(v15 + ((v30 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v30;
    uint64_t result = sub_2607F6BDC((uint64_t)v7, *(void *)(v10 + 48) + v24 * v30);
    *(void *)(*(void *)(v10 + 56) + 8 * v30) = v26;
    ++*(void *)(v10 + 16);
    if (v14) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v20 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      goto LABEL_42;
    }
    if (v20 >= v38)
    {
      swift_release();
      char v3 = v37;
      uint64_t v21 = v39;
      goto LABEL_35;
    }
    uint64_t v21 = v39;
    unint64_t v22 = v39[v20];
    ++v17;
    if (!v22)
    {
      int64_t v17 = v20 + 1;
      if (v20 + 1 >= v38) {
        goto LABEL_33;
      }
      unint64_t v22 = v39[v17];
      if (!v22) {
        break;
      }
    }
LABEL_18:
    unint64_t v14 = (v22 - 1) & v22;
  }
  int64_t v23 = v20 + 2;
  if (v23 < v38)
  {
    unint64_t v22 = v39[v23];
    if (!v22)
    {
      while (1)
      {
        int64_t v17 = v23 + 1;
        if (__OFADD__(v23, 1)) {
          goto LABEL_43;
        }
        if (v17 >= v38) {
          goto LABEL_33;
        }
        unint64_t v22 = v39[v17];
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
  char v3 = v37;
LABEL_35:
  if (v42)
  {
    uint64_t v35 = 1 << *(unsigned char *)(v8 + 32);
    if (v35 >= 64) {
      sub_260869EE8(0, (unint64_t)(v35 + 63) >> 6, v21);
    }
    else {
      *uint64_t v21 = -1 << v35;
    }
    *(void *)(v8 + 16) = 0;
  }
LABEL_40:
  uint64_t result = swift_release();
  *char v3 = v10;
  return result;
}

uint64_t sub_2608629BC(uint64_t a1, char a2)
{
  char v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B55C8);
  char v37 = a2;
  uint64_t v6 = sub_26087B9F0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_39;
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
  if (!v10) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v14 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v13 << 6))
  {
    int64_t v20 = (uint64_t *)(*(void *)(v5 + 48) + 16 * i);
    uint64_t v22 = *v20;
    uint64_t v21 = v20[1];
    uint64_t v23 = *(void *)(*(void *)(v5 + 56) + 8 * i);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_26087BCA0();
    sub_26087B300();
    uint64_t result = sub_26087BD00();
    uint64_t v24 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v25 = result & ~v24;
    unint64_t v26 = v25 >> 6;
    if (((-1 << v25) & ~*(void *)(v11 + 8 * (v25 >> 6))) == 0)
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
        uint64_t v31 = *(void *)(v11 + 8 * v26);
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
    unint64_t v27 = __clz(__rbit64((-1 << v25) & ~*(void *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v11 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
    unint64_t v32 = (void *)(*(void *)(v7 + 48) + 16 * v27);
    *unint64_t v32 = v22;
    v32[1] = v21;
    *(void *)(*(void *)(v7 + 56) + 8 * v27) = v23;
    ++*(void *)(v7 + 16);
    if (v10) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v16 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      goto LABEL_41;
    }
    if (v16 >= v35)
    {
      swift_release();
      char v3 = v34;
      int64_t v17 = (void *)(v5 + 64);
      goto LABEL_34;
    }
    int64_t v17 = (void *)(v5 + 64);
    unint64_t v18 = *(void *)(v36 + 8 * v16);
    ++v13;
    if (!v18)
    {
      int64_t v13 = v16 + 1;
      if (v16 + 1 >= v35) {
        goto LABEL_32;
      }
      unint64_t v18 = *(void *)(v36 + 8 * v13);
      if (!v18) {
        break;
      }
    }
LABEL_18:
    unint64_t v10 = (v18 - 1) & v18;
  }
  int64_t v19 = v16 + 2;
  if (v19 < v35)
  {
    unint64_t v18 = *(void *)(v36 + 8 * v19);
    if (!v18)
    {
      while (1)
      {
        int64_t v13 = v19 + 1;
        if (__OFADD__(v19, 1)) {
          goto LABEL_42;
        }
        if (v13 >= v35) {
          goto LABEL_32;
        }
        unint64_t v18 = *(void *)(v36 + 8 * v13);
        ++v19;
        if (v18) {
          goto LABEL_18;
        }
      }
    }
    int64_t v13 = v19;
    goto LABEL_18;
  }
LABEL_32:
  swift_release();
  char v3 = v34;
LABEL_34:
  if (v37)
  {
    uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
    if (v33 >= 64) {
      sub_260869EE8(0, (unint64_t)(v33 + 63) >> 6, v17);
    }
    else {
      *int64_t v17 = -1 << v33;
    }
    *(void *)(v5 + 16) = 0;
  }
LABEL_39:
  uint64_t result = swift_release();
  *char v3 = v7;
  return result;
}

BOOL sub_260862CB8(__int16 a1, __int16 a2)
{
  return a1 == a2;
}

void sub_260862CC8(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v6 = a1 + 32;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_260863414(v6, (uint64_t)&v28, &qword_26A8B4C78);
    uint64_t v8 = v28;
    uint64_t v7 = v29;
    uint64_t v26 = v28;
    uint64_t v27 = v29;
    sub_2607F7344(&v30, v25);
    uint64_t v9 = (void *)*a3;
    unint64_t v11 = sub_2607F3E64();
    uint64_t v12 = v9[2];
    BOOL v13 = (v10 & 1) == 0;
    uint64_t v14 = v12 + v13;
    if (__OFADD__(v12, v13))
    {
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      sub_26087BC30();
      __break(1u);
      goto LABEL_20;
    }
    char v15 = v10;
    if (v9[3] < v14) {
      break;
    }
    if (a2)
    {
      if (v10) {
        goto LABEL_14;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B4768);
      sub_26087B960();
      if (v15) {
        goto LABEL_14;
      }
    }
LABEL_10:
    unint64_t v18 = (void *)*a3;
    *(void *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    int64_t v19 = (void *)(v18[6] + 16 * v11);
    *int64_t v19 = v8;
    v19[1] = v7;
    sub_2607F7344(v25, (_OWORD *)(v18[7] + 32 * v11));
    uint64_t v20 = v18[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_18;
    }
    _OWORD v18[2] = v22;
    v6 += 48;
    a2 = 1;
    if (!--v3)
    {
      swift_bridgeObjectRelease_n();
      return;
    }
  }
  sub_2608622D0(v14, a2 & 1);
  unint64_t v16 = sub_2607F3E64();
  if ((v15 & 1) != (v17 & 1)) {
    goto LABEL_19;
  }
  unint64_t v11 = v16;
  if ((v15 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_14:
  uint64_t v23 = (void *)swift_allocError();
  swift_willThrow();
  id v31 = v23;
  id v24 = v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B55D0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return;
  }
LABEL_20:
  sub_26087B7F0();
  sub_26087B330();
  sub_26087B900();
  sub_26087B330();
  sub_26087B990();
  __break(1u);
}

void sub_260862FBC(uint64_t a1, char a2, void *a3)
{
  uint64_t v7 = type metadata accessor for EventReportSenderID();
  uint64_t v37 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v38 = (uint64_t)v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B4708);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  BOOL v13 = (char *)v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(a1 + 16);
  if (!v14)
  {
    swift_bridgeObjectRelease();
    return;
  }
  v34[1] = v7;
  v34[2] = v3;
  uint64_t v15 = *(int *)(v10 + 48);
  uint64_t v16 = a1 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
  uint64_t v35 = *(void *)(v11 + 72);
  uint64_t v36 = v15;
  v34[3] = a1;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_260863414(v16, (uint64_t)v13, &qword_26A8B4708);
    uint64_t v17 = v38;
    sub_2607F6BDC((uint64_t)v13, v38);
    uint64_t v18 = *(void *)&v13[v36];
    int64_t v19 = (void *)*a3;
    unint64_t v21 = sub_2607F3DA0(v17);
    uint64_t v22 = v19[2];
    BOOL v23 = (v20 & 1) == 0;
    uint64_t v24 = v22 + v23;
    if (__OFADD__(v22, v23))
    {
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      sub_26087BC30();
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B4780);
      sub_26087B960();
      if (v25) {
        goto LABEL_14;
      }
    }
LABEL_10:
    uint64_t v28 = (void *)*a3;
    *(void *)(*a3 + 8 * (v21 >> 6) + 64) |= 1 << v21;
    sub_2607F6BDC(v38, v28[6] + *(void *)(v37 + 72) * v21);
    *(void *)(v28[7] + 8 * v21) = v18;
    uint64_t v29 = v28[2];
    BOOL v30 = __OFADD__(v29, 1);
    uint64_t v31 = v29 + 1;
    if (v30) {
      goto LABEL_18;
    }
    _OWORD v28[2] = v31;
    v16 += v35;
    a2 = 1;
    if (!--v14)
    {
      swift_bridgeObjectRelease_n();
      return;
    }
  }
  sub_2608625CC(v24, a2 & 1);
  unint64_t v26 = sub_2607F3DA0(v38);
  if ((v25 & 1) != (v27 & 1)) {
    goto LABEL_19;
  }
  unint64_t v21 = v26;
  if ((v25 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_14:
  unint64_t v32 = (void *)swift_allocError();
  swift_willThrow();
  id v41 = v32;
  id v33 = v32;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B55D0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_release();
    swift_bridgeObjectRelease();
    sub_2607F6C40(v38);
    swift_bridgeObjectRelease();

    return;
  }
LABEL_20:
  uint64_t v39 = 0;
  unint64_t v40 = 0xE000000000000000;
  sub_26087B7F0();
  sub_26087B330();
  sub_26087B900();
  sub_26087B330();
  sub_26087B990();
  __break(1u);
}

BOOL sub_2608633B4(__int16 *a1, __int16 *a2)
{
  return sub_260862CB8(*a1, *a2);
}

BOOL sub_2608633D8(__int16 *a1)
{
  return sub_2608633B4(a1, *(__int16 **)(v1 + 16));
}

uint64_t sub_2608633F8(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 137)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_260863414(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_2_15();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

unint64_t sub_260863470(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_150(a1);
  if (!result)
  {
    v3(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t sub_2608634B4(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_2_15();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

ValueMetadata *type metadata accessor for HIDServiceProperties.HIDDeviceUsagePair.HIDDeviceUsagePairKey()
{
  return &type metadata for HIDServiceProperties.HIDDeviceUsagePair.HIDDeviceUsagePairKey;
}

unint64_t sub_26086351C()
{
  unint64_t result = qword_26A8B55F8;
  if (!qword_26A8B55F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B55F8);
  }
  return result;
}

unint64_t sub_260863568()
{
  return sub_260863590((uint64_t)&unk_26A8B5600);
}

unint64_t sub_260863590(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_150(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_2608635E0()
{
  unint64_t result = qword_26A8B5610;
  if (!qword_26A8B5610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5610);
  }
  return result;
}

unint64_t sub_260863630()
{
  unint64_t result = qword_26A8B5618;
  if (!qword_26A8B5618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5618);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_37(uint64_t result)
{
  *(void *)(result + 16) = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_3_30()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_4_22()
{
  return MEMORY[0x270F9F290](v1 - 136, v0);
}

uint64_t OUTLINED_FUNCTION_5_19(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F9F3D0](a1, a2, v3 - 112, v2);
}

uint64_t OUTLINED_FUNCTION_6_25(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  if (a1) {
    return a10;
  }
  else {
    return 0;
  }
}

uint64_t OUTLINED_FUNCTION_7_20()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_8_23(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va1, a5);
  va_start(va, a5);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  return sub_260860824((uint64_t)va, (uint64_t)va1, a3);
}

double OUTLINED_FUNCTION_9_21()
{
  return 0.0;
}

id OUTLINED_FUNCTION_10_18(uint64_t a1, const char *a2)
{
  return objc_msgSend(v3, a2, v2, v4);
}

uint64_t OUTLINED_FUNCTION_11_14(uint64_t a1, char a2)
{
  return HIDServiceProperties.subscript.setter(a1, a2);
}

uint64_t OUTLINED_FUNCTION_12_15(uint64_t a1)
{
  return sub_26085B598(a1);
}

uint64_t OUTLINED_FUNCTION_13_12(char a1)
{
  return HIDServiceProperties.subscript.setter(a1);
}

uint64_t OUTLINED_FUNCTION_14_12()
{
  return sub_26087B730();
}

uint64_t OUTLINED_FUNCTION_15_13()
{
  return swift_unknownObjectRelease();
}

id OUTLINED_FUNCTION_16_13(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_17_10(uint64_t result, char a2)
{
  *(void *)uint64_t v2 = result;
  *(unsigned char *)(v2 + 8) = a2 & 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_18_10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(v5 - 96) = a3;
  *(void *)(v5 - 88) = (v3 - 32) | 0x8000000000000000;
  return MEMORY[0x270F9F3D0](a1, a2, v5 - 96, v4);
}

uint64_t OUTLINED_FUNCTION_19_10@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v3 - 104) = a1;
  *(void *)(v3 - 96) = (v1 - 32) | 0x8000000000000000;
  return MEMORY[0x270F9F290](v3 - 104, v2);
}

void *OUTLINED_FUNCTION_20_10(void *result)
{
  *unint64_t result = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_22_8(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F9F3D0](a1, a2, v3 - 96, v2);
}

uint64_t OUTLINED_FUNCTION_23_6()
{
  return MEMORY[0x270F9F290](v1 - 104, v0);
}

uint64_t OUTLINED_FUNCTION_24_5(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a1) {
    return a9;
  }
  else {
    return 0;
  }
}

uint64_t OUTLINED_FUNCTION_25_5()
{
  return swift_dynamicCast();
}

id OUTLINED_FUNCTION_26_5(uint64_t a1)
{
  return objc_msgSend(v1, (SEL)(v2 + 111), a1);
}

uint64_t OUTLINED_FUNCTION_27_3()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_29_2()
{
  return MEMORY[0x270F9F270](v1 - 136, v0);
}

uint64_t OUTLINED_FUNCTION_30_1(void *a1)
{
  *uint64_t v1 = a1;
  a1[4] = v4;
  a1[11] = v3;
  a1[12] = v2;
  a1[10] = v4;
  a1[5] = v3;
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_31_1(uint64_t a1)
{
  *(void *)(a1 + 40) = v1;
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_33_1(uint64_t a1, char a2)
{
  return sub_26085ABE4(a1, a2);
}

uint64_t OUTLINED_FUNCTION_34_1(uint64_t a1, uint64_t a2)
{
  return HIDServiceProperties.subscript.setter(a1, a2);
}

id OUTLINED_FUNCTION_35_1(uint64_t a1, const char *a2)
{
  return objc_msgSend(v3, a2, v2, v4);
}

uint64_t OUTLINED_FUNCTION_36_1()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_37_1()
{
  return MEMORY[0x270F9F278](v1 - 136, v0);
}

uint64_t OUTLINED_FUNCTION_38_1()
{
  return HIDServiceProperties.subscript.getter();
}

uint64_t OUTLINED_FUNCTION_39_1(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F9F3B0](a1, a2, v3 - 112, v2);
}

uint64_t OUTLINED_FUNCTION_40_1(uint64_t a1)
{
  return MEMORY[0x270F9F3B8](a1, v2 - 112, v1);
}

unint64_t OUTLINED_FUNCTION_45_1()
{
  return 0xD00000000000001ELL;
}

uint64_t OUTLINED_FUNCTION_46_1(uint64_t *a1, char a2)
{
  return sub_260859FDC(a1, a2);
}

uint64_t OUTLINED_FUNCTION_47_1(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  return HIDServiceProperties.subscript.setter(a1, a2, a3 & 0xFFFFFFFFFFFFLL | 0xD000000000000000, a4);
}

double OUTLINED_FUNCTION_53_1()
{
  double result = 0.0;
  *(_OWORD *)(v0 - 144) = 0u;
  *(_OWORD *)(v0 - 128) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_54_0()
{
  return sub_26087B730();
}

uint64_t OUTLINED_FUNCTION_55_1(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_260860824(v3 - 144, v3 - 112, a3);
}

id OUTLINED_FUNCTION_56_1(uint64_t a1, const char *a2)
{
  uint64_t v5 = *(void **)(v3 - 72);
  return objc_msgSend(v5, a2, v2);
}

void OUTLINED_FUNCTION_57_0(uint64_t a1@<X8>)
{
  *(void *)(v2 - 136) = a1;
  *(void *)(v2 - 128) = v1 | 0x8000000000000000;
}

uint64_t OUTLINED_FUNCTION_59_1()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_60_1()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_61_1()
{
  return sub_26087B730();
}

uint64_t OUTLINED_FUNCTION_62_1()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_63_1()
{
  return sub_26087BCA0();
}

uint64_t OUTLINED_FUNCTION_64_0(uint64_t a1)
{
  return sub_260860824(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_66_1()
{
  return HIDServiceProperties.subscript.getter();
}

uint64_t OUTLINED_FUNCTION_67_1()
{
  return HIDServiceProperties.subscript.getter();
}

uint64_t OUTLINED_FUNCTION_68_1()
{
  return HIDServiceProperties.subscript.getter();
}

uint64_t OUTLINED_FUNCTION_73_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_74_0()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_77_0(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  return sub_260860824(v31 - 128, (uint64_t)&a31, a3);
}

uint64_t OUTLINED_FUNCTION_78_0()
{
  return sub_26087B730();
}

double OUTLINED_FUNCTION_80_0()
{
  double result = 0.0;
  *uint64_t v0 = 0u;
  v0[1] = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_81_0()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t OUTLINED_FUNCTION_82_0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t OUTLINED_FUNCTION_83_0()
{
  return swift_bridgeObjectRelease();
}

void *OUTLINED_FUNCTION_84_0()
{
  return malloc(0x68uLL);
}

id OUTLINED_FUNCTION_91_0()
{
  return objc_msgSend(v0, (SEL)(v2 + 111), v1);
}

double OUTLINED_FUNCTION_93_0()
{
  double result = 0.0;
  *uint64_t v0 = 0u;
  v0[1] = 0u;
  return result;
}

id OUTLINED_FUNCTION_94_0(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3, v4);
}

id OUTLINED_FUNCTION_95_0(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_96_0(uint64_t result)
{
  *(void *)(result + 8) = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_97_0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_260860824(v3, v4, a3);
}

uint64_t OUTLINED_FUNCTION_98_0()
{
  return v0 - 144;
}

uint64_t OUTLINED_FUNCTION_99_0()
{
  return sub_26087BCC0();
}

uint64_t OUTLINED_FUNCTION_100_0()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_102_0()
{
  return sub_26087B730();
}

uint64_t OUTLINED_FUNCTION_103_0()
{
  *(void *)(v0 - 96) = 0x6874646957;
  *(void *)(v0 - 88) = 0xE500000000000000;
  return v0 - 96;
}

uint64_t OUTLINED_FUNCTION_104_0()
{
  *(void *)(v0 - 96) = 0x746867696548;
  *(void *)(v0 - 88) = 0xE600000000000000;
  return v0 - 96;
}

void OUTLINED_FUNCTION_105_0(uint64_t a1@<X8>)
{
  *(void *)(v2 - 112) = a1;
  *(void *)(v2 - 104) = v1 | 0x8000000000000000;
}

id OUTLINED_FUNCTION_108_0(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_111()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_112(int a1)
{
  if (a1) {
    return *(void *)(v1 - 160);
  }
  else {
    return 0;
  }
}

void OUTLINED_FUNCTION_114()
{
  *(void *)(v1 - 136) = 0x7954656369766544;
  *(void *)(v1 - 128) = v0;
}

id OUTLINED_FUNCTION_115(uint64_t a1, const char *a2)
{
  return objc_msgSend(v3, a2, v4, v2);
}

void OUTLINED_FUNCTION_117(uint64_t a1@<X8>)
{
  *(void *)(v1 - 136) = 0xD000000000000014;
  *(void *)(v1 - 128) = a1;
}

uint64_t OUTLINED_FUNCTION_120()
{
  return HIDServiceProperties.subscript.getter();
}

uint64_t OUTLINED_FUNCTION_121()
{
  return HIDServiceProperties.subscript.getter();
}

uint64_t OUTLINED_FUNCTION_123()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_124()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_128(uint64_t a1@<X8>)
{
  *(void *)(v2 - 112) = a1;
  *(void *)(v2 - 104) = (v1 - 32) | 0x8000000000000000;
}

uint64_t OUTLINED_FUNCTION_129(uint64_t a1)
{
  return MEMORY[0x270F9F3B0](a1, v2, v3 - 112, v1);
}

void OUTLINED_FUNCTION_136()
{
  *(void *)(v1 - 136) = v0;
  *(void *)(v1 - 128) = 0xE900000000000074;
}

void OUTLINED_FUNCTION_137()
{
  *(void *)(v0 - 176) = *(void *)(v0 - 136);
}

uint64_t OUTLINED_FUNCTION_139()
{
  return sub_26087B630();
}

void OUTLINED_FUNCTION_140()
{
  *(void *)(v1 - 136) = 0xD000000000000014;
  *(void *)(v1 - 128) = v0 | 0x8000000000000000;
}

void OUTLINED_FUNCTION_141()
{
  *(void *)(v2 - 136) = v1;
  *(void *)(v2 - 128) = v0 | 0x8000000000000000;
}

uint64_t OUTLINED_FUNCTION_143()
{
  return sub_26087BD10();
}

void *OUTLINED_FUNCTION_144()
{
  return malloc(0x78uLL);
}

uint64_t OUTLINED_FUNCTION_145()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_146()
{
  return sub_2608347D4(v1, v0);
}

uint64_t OUTLINED_FUNCTION_147()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_148(char a1)
{
  return HIDServiceProperties.subscript.setter(a1);
}

uint64_t OUTLINED_FUNCTION_149(char a1)
{
  return HIDServiceProperties.subscript.setter(a1);
}

uint64_t OUTLINED_FUNCTION_150(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t OUTLINED_FUNCTION_152()
{
  return sub_26087B630();
}

uint64_t OUTLINED_FUNCTION_153()
{
  return HIDServiceProperties.subscript.setter(v1, v0);
}

uint64_t OUTLINED_FUNCTION_154()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_155()
{
  return HIDServiceProperties.subscript.setter(v1, v2, v3, v0);
}

uint64_t OUTLINED_FUNCTION_156()
{
  return HIDServiceProperties.subscript.setter(v0, v1, v3, v2);
}

uint64_t OUTLINED_FUNCTION_157()
{
  return HIDServiceProperties.subscript.setter(v0, v1);
}

uint64_t OUTLINED_FUNCTION_158(uint64_t result, uint64_t a2)
{
  *(void *)(v4 - 112) = result;
  *(void *)(v4 - 104) = a2;
  *(void *)(v4 - 144) = v2;
  *(void *)(v4 - 136) = v3;
  return result;
}

uint64_t OUTLINED_FUNCTION_159()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_160()
{
  return sub_26087B630();
}

uint64_t OUTLINED_FUNCTION_162()
{
  return sub_26087BCC0();
}

uint64_t OUTLINED_FUNCTION_163()
{
  return 0;
}

uint64_t dispatch thunk of RemoteTimestampAccessible.remoteTimestamp.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of RemoteTimestampAccessible.remoteTimestamp.setter(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, void))(a4 + 24))(a1, a2 & 1);
}

uint64_t dispatch thunk of RemoteTimestampAccessible.remoteTimestamp.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

void sub_260864538(uint64_t (*a1)(void), uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = (void *)sub_26087AF10();
  id v7 = objc_msgSend(v6, sel_localizedDescription);
  uint64_t v8 = sub_26087B2B0();
  unint64_t v10 = v9;

  uint64_t v11 = a1();
  if (v12)
  {
    uint64_t v13 = v11;
    unint64_t v14 = v12;
    id v15 = v6;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_26087B100();
    os_log_type_t v17 = sub_26087B520();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 136446979;
      swift_bridgeObjectRetain();
      sub_26080F618(v13, v14, &v31);
      sub_26087B650();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v18 + 12) = 2082;
      id v19 = objc_msgSend(v15, sel_domain);
      id v30 = a4;
      uint64_t v20 = sub_26087B2B0();
      unint64_t v22 = v21;

      sub_26080F618(v20, v22, &v31);
      sub_26087B650();

      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 22) = 2048;
      objc_msgSend(v15, sel_code);

      sub_26087B650();
      *(_WORD *)(v18 + 32) = 2081;
      swift_bridgeObjectRetain();
      sub_26080F618(v8, v10, &v31);
      sub_26087B650();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2607D9000, v16, v17, "%{public}s: %{public}s (%ld) %{private}s", (uint8_t *)v18, 0x2Au);
      swift_arrayDestroy();
LABEL_6:
      OUTLINED_FUNCTION_22_4();
      OUTLINED_FUNCTION_22_4();

      return;
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    id v15 = v6;
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_26087B100();
    os_log_type_t v23 = sub_26087B520();
    if (os_log_type_enabled(v16, v23))
    {
      uint64_t v24 = swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      *(_DWORD *)uint64_t v24 = 136446723;
      id v30 = a4;
      uint64_t v29 = v8;
      id v25 = objc_msgSend(v15, sel_domain);
      uint64_t v26 = sub_26087B2B0();
      unint64_t v28 = v27;

      sub_26080F618(v26, v28, &v31);
      OUTLINED_FUNCTION_1_36();

      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 2048;
      objc_msgSend(v15, sel_code);

      OUTLINED_FUNCTION_1_36();
      *(_WORD *)(v24 + 22) = 2081;
      swift_bridgeObjectRetain();
      sub_26080F618(v29, v10, &v31);
      OUTLINED_FUNCTION_1_36();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2607D9000, v16, v23, "%{public}s (%ld) %{private}s", (uint8_t *)v24, 0x20u);
      swift_arrayDestroy();
      goto LABEL_6;
    }
  }
  swift_bridgeObjectRelease_n();
}

void sub_2608649F0(uint64_t (*a1)(void), uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4 = (void *)a3();
  uint64_t v5 = (void *)sub_26087AF10();

  id v6 = objc_msgSend(v5, sel_localizedDescription);
  uint64_t v7 = sub_26087B2B0();
  unint64_t v9 = v8;

  uint64_t v10 = a1();
  if (v11)
  {
    uint64_t v12 = v10;
    unint64_t v13 = v11;
    id v28 = v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v14 = sub_26087B100();
    os_log_type_t v15 = sub_26087B520();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 136446979;
      swift_bridgeObjectRetain();
      sub_26080F618(v12, v13, &v29);
      sub_26087B650();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v16 + 12) = 2082;
      id v17 = objc_msgSend(v28, sel_domain);
      uint64_t v18 = v7;
      uint64_t v19 = sub_26087B2B0();
      unint64_t v21 = v20;

      sub_26080F618(v19, v21, &v29);
      sub_26087B650();

      swift_bridgeObjectRelease();
      *(_WORD *)(v16 + 22) = 2048;
      objc_msgSend(v28, sel_code);

      sub_26087B650();
      *(_WORD *)(v16 + 32) = 2081;
      swift_bridgeObjectRetain();
      sub_26080F618(v18, v9, &v29);
      sub_26087B650();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2607D9000, v14, v15, "%{public}s: %{public}s (%ld) %{private}s", (uint8_t *)v16, 0x2Au);
      swift_arrayDestroy();
LABEL_6:
      OUTLINED_FUNCTION_22_4();
      OUTLINED_FUNCTION_22_4();

      return;
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    id v28 = v5;
    swift_bridgeObjectRetain();
    unint64_t v14 = sub_26087B100();
    os_log_type_t v22 = sub_26087B520();
    if (os_log_type_enabled(v14, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 136446723;
      id v24 = objc_msgSend(v28, sel_domain);
      uint64_t v25 = sub_26087B2B0();
      unint64_t v27 = v26;

      sub_26080F618(v25, v27, &v29);
      OUTLINED_FUNCTION_0_35();

      swift_bridgeObjectRelease();
      *(_WORD *)(v23 + 12) = 2048;
      objc_msgSend(v28, sel_code);

      OUTLINED_FUNCTION_0_35();
      *(_WORD *)(v23 + 22) = 2081;
      swift_bridgeObjectRetain();
      sub_26080F618(v7, v9, &v29);
      OUTLINED_FUNCTION_0_35();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2607D9000, v14, v22, "%{public}s (%ld) %{private}s", (uint8_t *)v23, 0x20u);
      swift_arrayDestroy();
      goto LABEL_6;
    }
  }
  swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_0_35()
{
  return sub_26087B650();
}

uint64_t OUTLINED_FUNCTION_1_36()
{
  return sub_26087B650();
}

uint64_t sub_260864F14()
{
  return sub_26087B200();
}

uint64_t EventFilterProtocol.debugState.getter()
{
  return sub_26087B200();
}

uint64_t dispatch thunk of EventFilterProtocol.eventMask.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of EventFilterProtocol.filterEvent(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of EventFilterProtocol.debugState.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_260864FA0()
{
  return sub_260864F14();
}

uint64_t sub_260864FC4()
{
  return EventFilterProtocol.debugState.getter();
}

uint64_t dispatch thunk of EventFilterProtocol.updateCopyMask(oldValue:newValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of EventFilterProtocol.updateFilterMask(oldValue:newValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t DigitizerEvent.init(time:digitizerType:digitizerEventMask:generationCount:index:identity:point:range:touch:flags:)(uint64_t a1, int a2, uint64_t a3, uint64_t a4, unint64_t a5, unint64_t a6)
{
  if (a2 != 2)
  {
    if ((a5 & 0x8000000000000000) == 0)
    {
      if (HIDWORD(a5)) {
        goto LABEL_16;
      }
      if ((a6 & 0x8000000000000000) == 0)
      {
        if (!HIDWORD(a6))
        {
          uint64_t DigitizerEvent = IOHIDEventCreateDigitizerEvent();
          goto LABEL_12;
        }
        goto LABEL_16;
      }
    }
    goto LABEL_15;
  }
  if ((a5 & 0x8000000000000000) != 0) {
    goto LABEL_15;
  }
  if (HIDWORD(a5))
  {
LABEL_16:
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_14_13();
    goto LABEL_17;
  }
  if ((a6 & 0x8000000000000000) != 0)
  {
LABEL_15:
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_13_13();
LABEL_17:
    uint64_t result = sub_26087B980();
    __break(1u);
    return result;
  }
  if (HIDWORD(a6)) {
    goto LABEL_16;
  }
  uint64_t DigitizerEvent = IOHIDEventCreateDigitizerFingerEvent();
LABEL_12:
  uint64_t v8 = DigitizerEvent;
  if (a4) {
    IOHIDEventSetIntegerValue();
  }
  return v8;
}

BOOL sub_260865154(int a1, int a2)
{
  return a1 == a2;
}

uint64_t sub_260865160(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 == a3 && a2 == a4) {
    return OUTLINED_FUNCTION_20_0();
  }
  else {
    return sub_26087BBE0();
  }
}

BOOL sub_260865178(char a1, char a2)
{
  return byte_260882954[a1] == byte_260882954[a2];
}

BOOL sub_26086519C(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t DigitizerType.rawValue.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*DigitizerType.rawValue.modify())()
{
  return nullsub_1;
}

uint64_t static DigitizerType.stylus.getter()
{
  return 0;
}

uint64_t static DigitizerType.finger.getter()
{
  return 2;
}

uint64_t static DigitizerType.hand.getter()
{
  return 3;
}

uint64_t sub_2608651F8()
{
  return sub_2608532AC();
}

uint64_t sub_260865200()
{
  return sub_2608533C8();
}

uint64_t sub_260865208()
{
  return sub_260853464();
}

void *static DigitizerType.allCases.getter()
{
  return &unk_270C9E6A8;
}

void sub_26086521C(void *a1@<X8>)
{
  *a1 = &unk_270C9E6A8;
}

uint64_t DigitizerType.description.getter(int a1)
{
  uint64_t result = 0x73756C797473;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 1801680240;
      break;
    case 2:
      uint64_t result = 0x7265676E6966;
      break;
    case 3:
      uint64_t result = 1684955496;
      break;
    default:
      uint64_t result = sub_26087BBA0();
      break;
  }
  return result;
}

uint64_t sub_2608652F0()
{
  return DigitizerType.description.getter(*v0);
}

uint64_t DigitizerEventMask.rawValue.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*DigitizerEventMask.rawValue.modify())()
{
  return nullsub_1;
}

unint64_t _s12UniversalHID13DigitizerTypeV8rawValueACSi_tcfC_0(unint64_t result)
{
  if ((result & 0x8000000000000000) != 0)
  {
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_13_13();
LABEL_6:
    uint64_t result = sub_26087B980();
    __break(1u);
    return result;
  }
  if (HIDWORD(result))
  {
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_14_13();
    goto LABEL_6;
  }
  return result;
}

uint64_t static DigitizerEventMask.touch.getter()
{
  return 2;
}

uint64_t static DigitizerEventMask.position.getter()
{
  return 4;
}

uint64_t static DigitizerEventMask.identity.getter()
{
  return 32;
}

uint64_t static DigitizerEventMask.attribute.getter()
{
  return 64;
}

uint64_t static DigitizerEventMask.cancel.getter()
{
  return 128;
}

uint64_t static DigitizerEventMask.start.getter()
{
  return 256;
}

uint64_t static DigitizerEventMask.resting.getter()
{
  return 512;
}

uint64_t static DigitizerEventMask.fromEdgeFlat.getter()
{
  return 1024;
}

uint64_t static DigitizerEventMask.fromEdgeTip.getter()
{
  return 2048;
}

uint64_t static DigitizerEventMask.fromCorner.getter()
{
  return 4096;
}

uint64_t static DigitizerEventMask.swipePending.getter()
{
  return 0x2000;
}

uint64_t static DigitizerEventMask.fromEdgeForcePending.getter()
{
  return 0x4000;
}

uint64_t static DigitizerEventMask.fromEdgeForceActive.getter()
{
  return 0x8000;
}

uint64_t static DigitizerEventMask.tap.getter()
{
  return 0x20000;
}

uint64_t static DigitizerEventMask.swipeLocked.getter()
{
  return 0x40000;
}

uint64_t static DigitizerEventMask.swipeUp.getter()
{
  return 0x1000000;
}

uint64_t static DigitizerEventMask.swipeDown.getter()
{
  return 0x2000000;
}

uint64_t static DigitizerEventMask.swipeLeft.getter()
{
  return 0x4000000;
}

uint64_t static DigitizerEventMask.swipeRight.getter()
{
  return 0x8000000;
}

uint64_t static DigitizerEventMask.estimatedAltitude.getter()
{
  return 0x10000000;
}

uint64_t static DigitizerEventMask.estimatedAzimuth.getter()
{
  return 0x20000000;
}

uint64_t static DigitizerEventMask.estimatedPressure.getter()
{
  return 0x40000000;
}

_DWORD *sub_260865460@<X0>(_DWORD *result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

BOOL sub_26086546C(_DWORD *a1, int *a2)
{
  return sub_260831054(a1, *a2);
}

uint64_t sub_260865474(unsigned int *a1)
{
  return sub_2608310F8(*a1);
}

uint64_t sub_26086547C(unsigned int *a1)
{
  return sub_260831060(*a1);
}

uint64_t sub_260865484(unsigned int *a1)
{
  return sub_260831074(*a1);
}

uint64_t sub_26086548C@<X0>(unsigned int *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = sub_26087A9E0(*a1, *v2);
  *a2 = result;
  return result;
}

BOOL sub_2608654BC(int *a1)
{
  return sub_2608310B8(*a1, *v1);
}

uint64_t sub_2608654C8(unsigned int *a1)
{
  return sub_26087A9E8(*a1, *v1);
}

uint64_t sub_2608654D4(unsigned int *a1)
{
  return sub_260831068(*a1);
}

void *static DigitizerEventMask.allCases.getter()
{
  return &unk_270C9E6D8;
}

void sub_2608654E8(void *a1@<X8>)
{
  *a1 = &unk_270C9E6D8;
}

uint64_t DigitizerEventMask.description.getter(int a1)
{
  uint64_t v2 = MEMORY[0x263F8EE78];
  if ((dword_270C9E470 & a1) != 0)
  {
    uint64_t v19 = MEMORY[0x263F8EE78];
    sub_2607E9B50();
    uint64_t v3 = v19;
    OUTLINED_FUNCTION_16_14();
    if (v4)
    {
      OUTLINED_FUNCTION_8_24();
      uint64_t v3 = v19;
    }
    OUTLINED_FUNCTION_15_14();
  }
  else
  {
    uint64_t v3 = MEMORY[0x263F8EE78];
  }
  if ((dword_270C9E474 & a1) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      OUTLINED_FUNCTION_7_21();
    }
    OUTLINED_FUNCTION_16_14();
    if (v4) {
      OUTLINED_FUNCTION_8_24();
    }
    OUTLINED_FUNCTION_15_14();
  }
  if ((dword_270C9E478 & a1) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      OUTLINED_FUNCTION_7_21();
    }
    OUTLINED_FUNCTION_16_14();
    if (v4) {
      OUTLINED_FUNCTION_8_24();
    }
    OUTLINED_FUNCTION_15_14();
  }
  int v5 = dword_270C9E47C;
  if ((dword_270C9E47C & a1) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      OUTLINED_FUNCTION_7_21();
    }
    unint64_t v6 = *(void *)(v3 + 16);
    uint64_t v7 = v6 + 1;
    if (v6 >= *(void *)(v3 + 24) >> 1) {
      sub_2607E9B50();
    }
    *(void *)(v3 + 16) = v7;
    *(_DWORD *)(v3 + 4 * v6 + 32) = v5;
  }
  else
  {
    uint64_t v7 = *(void *)(v3 + 16);
    if (!v7) {
      goto LABEL_38;
    }
  }
  sub_2607E9890(0, v7, 0);
  uint64_t v8 = 0;
  uint64_t v9 = v2;
  do
  {
    int v10 = *(_DWORD *)(v3 + 4 * v8 + 32);
    if ((v10 & 0x20) != 0)
    {
      unint64_t v13 = 0xE800000000000000;
      uint64_t v11 = 0x797469746E656469;
    }
    else if ((v10 & 4) != 0)
    {
      unint64_t v13 = 0xE800000000000000;
      uint64_t v11 = 0x6E6F697469736F70;
    }
    else if (v10)
    {
      unint64_t v13 = 0xE500000000000000;
      uint64_t v11 = 0x65676E6172;
    }
    else if ((v10 & 2) != 0)
    {
      unint64_t v13 = 0xE500000000000000;
      uint64_t v11 = 0x6863756F74;
    }
    else
    {
      uint64_t v11 = sub_26087BBA0();
      unint64_t v13 = v12;
    }
    unint64_t v15 = *(void *)(v9 + 16);
    unint64_t v14 = *(void *)(v9 + 24);
    if (v15 >= v14 >> 1) {
      sub_2607E9890(v14 > 1, v15 + 1, 1);
    }
    ++v8;
    *(void *)(v9 + 16) = v15 + 1;
    uint64_t v16 = v9 + 16 * v15;
    *(void *)(v16 + 32) = v11;
    *(void *)(v16 + 40) = v13;
  }
  while (v7 != v8);
LABEL_38:
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B4668);
  sub_2607E9A5C((unint64_t *)&qword_26A8B4670, &qword_26A8B4668);
  uint64_t v17 = sub_26087B230();
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_260865814()
{
  return DigitizerEventMask.description.getter(*v0);
}

uint64_t static DigitizerEvent.eventType.getter()
{
  return 11;
}

uint64_t DigitizerEvent.generationCount.setter()
{
  return OUTLINED_FUNCTION_0_36();
}

uint64_t DigitizerEvent.x.getter()
{
  return IOHIDEventGetFloatValue();
}

uint64_t (*DigitizerEvent.x.modify(uint64_t a1, uint64_t a2))()
{
  OUTLINED_FUNCTION_2_2(a1, a2);
  IOHIDEventGetFloatValue();
  void *v2 = v3;
  return sub_260865890;
}

uint64_t sub_260865890()
{
  return OUTLINED_FUNCTION_12_16();
}

uint64_t DigitizerEvent.y.getter()
{
  return OUTLINED_FUNCTION_11_15();
}

uint64_t DigitizerEvent.y.setter()
{
  return OUTLINED_FUNCTION_2_38();
}

uint64_t (*DigitizerEvent.y.modify(uint64_t a1, uint64_t a2))()
{
  OUTLINED_FUNCTION_2_2(a1, a2);
  IOHIDEventGetFloatValue();
  void *v2 = v3;
  return sub_2608658FC;
}

uint64_t sub_2608658FC()
{
  return OUTLINED_FUNCTION_2_38();
}

uint64_t DigitizerEvent.z.getter()
{
  return OUTLINED_FUNCTION_11_15();
}

uint64_t DigitizerEvent.z.setter()
{
  return OUTLINED_FUNCTION_2_38();
}

uint64_t (*DigitizerEvent.z.modify(uint64_t a1, uint64_t a2))()
{
  OUTLINED_FUNCTION_2_2(a1, a2);
  IOHIDEventGetFloatValue();
  void *v2 = v3;
  return sub_26086596C;
}

uint64_t sub_26086596C()
{
  return OUTLINED_FUNCTION_2_38();
}

unint64_t DigitizerEvent.digitizerEventMask.getter()
{
  return OUTLINED_FUNCTION_10_19();
}

uint64_t DigitizerEvent.digitizerEventMask.setter()
{
  return OUTLINED_FUNCTION_0_36();
}

uint64_t (*DigitizerEvent.digitizerEventMask.modify(void *a1, uint64_t a2))()
{
  OUTLINED_FUNCTION_8_17(a1, a2);
  *(_DWORD *)(v2 + 8) = DigitizerEvent.digitizerEventMask.getter();
  return sub_2608659DC;
}

uint64_t sub_2608659DC()
{
  return OUTLINED_FUNCTION_0_36();
}

uint64_t DigitizerEvent.identity.getter()
{
  return OUTLINED_FUNCTION_5_20();
}

uint64_t DigitizerEvent.identity.setter()
{
  return OUTLINED_FUNCTION_0_36();
}

uint64_t (*DigitizerEvent.identity.modify(uint64_t a1, uint64_t a2))()
{
  OUTLINED_FUNCTION_2_2(a1, a2);
  uint64_t *v2 = IOHIDEventGetIntegerValue();
  return sub_260865A54;
}

uint64_t sub_260865A54()
{
  return OUTLINED_FUNCTION_0_36();
}

uint64_t DigitizerEvent.index.getter()
{
  return OUTLINED_FUNCTION_5_20();
}

uint64_t DigitizerEvent.index.setter()
{
  return OUTLINED_FUNCTION_0_36();
}

uint64_t (*DigitizerEvent.index.modify(uint64_t a1, uint64_t a2))()
{
  OUTLINED_FUNCTION_2_2(a1, a2);
  uint64_t *v2 = IOHIDEventGetIntegerValue();
  return sub_260865AC8;
}

uint64_t sub_260865AC8()
{
  return OUTLINED_FUNCTION_0_36();
}

BOOL DigitizerEvent.collection.getter()
{
  return IOHIDEventGetIntegerValue() != 0;
}

uint64_t DigitizerEvent.collection.setter()
{
  return OUTLINED_FUNCTION_0_36();
}

uint64_t (*DigitizerEvent.collection.modify(void *a1, uint64_t a2))()
{
  OUTLINED_FUNCTION_8_17(a1, a2);
  uint64_t IntegerValue = IOHIDEventGetIntegerValue();
  OUTLINED_FUNCTION_2_19(IntegerValue);
  return sub_260865B58;
}

uint64_t sub_260865B58()
{
  return OUTLINED_FUNCTION_0_36();
}

unint64_t DigitizerEvent.digitizerType.getter()
{
  return OUTLINED_FUNCTION_10_19();
}

unint64_t sub_260865B74()
{
  unint64_t result = IOHIDEventGetIntegerValue();
  if ((result & 0x8000000000000000) != 0)
  {
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_13_13();
LABEL_6:
    unint64_t result = sub_26087B980();
    __break(1u);
    return result;
  }
  if (HIDWORD(result))
  {
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_14_13();
    goto LABEL_6;
  }
  return result;
}

uint64_t DigitizerEvent.digitizerType.setter()
{
  return OUTLINED_FUNCTION_0_36();
}

uint64_t (*DigitizerEvent.digitizerType.modify(void *a1, uint64_t a2))()
{
  OUTLINED_FUNCTION_8_17(a1, a2);
  *(_DWORD *)(v2 + 8) = DigitizerEvent.digitizerType.getter();
  return sub_260865C50;
}

uint64_t sub_260865C50()
{
  return OUTLINED_FUNCTION_0_36();
}

uint64_t DigitizerEvent.generationCount.getter()
{
  return OUTLINED_FUNCTION_5_20();
}

uint64_t (*DigitizerEvent.generationCount.modify(uint64_t a1, uint64_t a2))()
{
  OUTLINED_FUNCTION_2_2(a1, a2);
  uint64_t *v2 = IOHIDEventGetIntegerValue();
  return sub_260865CB8;
}

uint64_t sub_260865CB8()
{
  return OUTLINED_FUNCTION_0_36();
}

BOOL DigitizerEvent.range.getter()
{
  return IOHIDEventGetIntegerValue() != 0;
}

uint64_t DigitizerEvent.range.setter()
{
  return OUTLINED_FUNCTION_0_36();
}

uint64_t (*DigitizerEvent.range.modify(void *a1, uint64_t a2))()
{
  OUTLINED_FUNCTION_8_17(a1, a2);
  uint64_t IntegerValue = IOHIDEventGetIntegerValue();
  OUTLINED_FUNCTION_2_19(IntegerValue);
  return sub_260865D48;
}

uint64_t sub_260865D48()
{
  return OUTLINED_FUNCTION_0_36();
}

BOOL DigitizerEvent.touch.getter()
{
  return IOHIDEventGetIntegerValue() != 0;
}

uint64_t DigitizerEvent.touch.setter()
{
  return OUTLINED_FUNCTION_0_36();
}

uint64_t (*DigitizerEvent.touch.modify(void *a1, uint64_t a2))()
{
  OUTLINED_FUNCTION_8_17(a1, a2);
  uint64_t IntegerValue = IOHIDEventGetIntegerValue();
  OUTLINED_FUNCTION_2_19(IntegerValue);
  return sub_260865DDC;
}

uint64_t sub_260865DDC()
{
  return OUTLINED_FUNCTION_0_36();
}

BOOL sub_260865DF0()
{
  return DigitizerEvent.collection.getter();
}

uint64_t sub_260865DF8()
{
  return DigitizerEvent.collection.setter();
}

uint64_t (*sub_260865E00(uint64_t a1))()
{
  *(void *)a1 = *v1;
  *(unsigned char *)(a1 + 8) = DigitizerEvent.collection.getter();
  return sub_260865E50;
}

uint64_t sub_260865E50()
{
  return DigitizerEvent.collection.setter();
}

double DigitizerEvent.point.getter()
{
  IOHIDEventGetFloatValue();
  OUTLINED_FUNCTION_17_11();
  return v0;
}

void sub_260865E9C(uint64_t a1@<X8>)
{
  *(double *)a1 = DigitizerEvent.point.getter();
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = 0;
}

uint64_t sub_260865ECC()
{
  return DigitizerEvent.point.setter();
}

uint64_t DigitizerEvent.point.setter()
{
  IOHIDEventSetFloatValue();
  OUTLINED_FUNCTION_18_11();
  return IOHIDEventSetFloatValue();
}

uint64_t (*DigitizerEvent.point.modify(void *a1, uint64_t a2))()
{
  a1[3] = a2;
  IOHIDEventGetFloatValue();
  OUTLINED_FUNCTION_17_11();
  *a1 = v2;
  a1[1] = v4;
  a1[2] = 0;
  return sub_260865F84;
}

uint64_t sub_260865F84()
{
  IOHIDEventSetFloatValue();
  OUTLINED_FUNCTION_18_11();
  return IOHIDEventSetFloatValue();
}

unint64_t sub_260865FD4()
{
  unint64_t result = qword_26A8B5620;
  if (!qword_26A8B5620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5620);
  }
  return result;
}

uint64_t sub_260866020()
{
  return sub_2607E9A5C(&qword_26A8B5628, &qword_26A8B5630);
}

unint64_t sub_260866060()
{
  unint64_t result = qword_26A8B5638;
  if (!qword_26A8B5638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5638);
  }
  return result;
}

unint64_t sub_2608660B0()
{
  unint64_t result = qword_26A8B5640;
  if (!qword_26A8B5640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5640);
  }
  return result;
}

unint64_t sub_260866100()
{
  unint64_t result = qword_26A8B5648;
  if (!qword_26A8B5648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5648);
  }
  return result;
}

unint64_t sub_260866150()
{
  unint64_t result = qword_26A8B5650;
  if (!qword_26A8B5650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5650);
  }
  return result;
}

uint64_t sub_26086619C()
{
  return sub_2607E9A5C(&qword_26A8B5658, &qword_26A8B5660);
}

uint64_t sub_2608661D8(uint64_t a1)
{
  OUTLINED_FUNCTION_3_3(a1);
  uint64_t result = DigitizerEvent.x.getter();
  *uint64_t v1 = v3;
  return result;
}

uint64_t sub_260866200(double *a1, void *a2)
{
  return DigitizerEvent.x.setter(*a2, *a1);
}

uint64_t sub_26086620C(uint64_t a1)
{
  OUTLINED_FUNCTION_3_3(a1);
  uint64_t result = DigitizerEvent.y.getter();
  *uint64_t v1 = v3;
  return result;
}

uint64_t sub_260866234()
{
  return DigitizerEvent.y.setter();
}

uint64_t sub_260866240(uint64_t a1)
{
  OUTLINED_FUNCTION_3_3(a1);
  uint64_t result = DigitizerEvent.z.getter();
  *uint64_t v1 = v3;
  return result;
}

uint64_t sub_260866268()
{
  return DigitizerEvent.z.setter();
}

unint64_t sub_260866274(uint64_t a1)
{
  OUTLINED_FUNCTION_3_3(a1);
  unint64_t result = DigitizerEvent.digitizerEventMask.getter();
  *uint64_t v1 = result;
  return result;
}

uint64_t sub_26086629C()
{
  return DigitizerEvent.digitizerEventMask.setter();
}

uint64_t sub_2608662A8(uint64_t a1)
{
  OUTLINED_FUNCTION_3_3(a1);
  uint64_t result = DigitizerEvent.identity.getter();
  *uint64_t v1 = result;
  return result;
}

uint64_t sub_2608662D0()
{
  return DigitizerEvent.identity.setter();
}

uint64_t sub_2608662DC(uint64_t a1)
{
  OUTLINED_FUNCTION_3_3(a1);
  uint64_t result = DigitizerEvent.index.getter();
  *uint64_t v1 = result;
  return result;
}

uint64_t sub_260866304()
{
  return DigitizerEvent.index.setter();
}

BOOL sub_260866310(uint64_t a1)
{
  OUTLINED_FUNCTION_3_3(a1);
  BOOL result = DigitizerEvent.collection.getter();
  *uint64_t v1 = result;
  return result;
}

uint64_t sub_26086633C()
{
  return DigitizerEvent.collection.setter();
}

unint64_t sub_260866348(uint64_t a1)
{
  OUTLINED_FUNCTION_3_3(a1);
  unint64_t result = DigitizerEvent.digitizerType.getter();
  *uint64_t v1 = result;
  return result;
}

uint64_t sub_260866370()
{
  return DigitizerEvent.digitizerType.setter();
}

uint64_t sub_26086637C(uint64_t a1)
{
  OUTLINED_FUNCTION_3_3(a1);
  uint64_t result = DigitizerEvent.generationCount.getter();
  *uint64_t v1 = result;
  return result;
}

uint64_t sub_2608663A4()
{
  return DigitizerEvent.generationCount.setter();
}

BOOL sub_2608663B0(uint64_t a1)
{
  OUTLINED_FUNCTION_3_3(a1);
  BOOL result = DigitizerEvent.range.getter();
  *uint64_t v1 = result;
  return result;
}

uint64_t sub_2608663DC()
{
  return DigitizerEvent.range.setter();
}

BOOL sub_2608663E8(uint64_t a1)
{
  OUTLINED_FUNCTION_3_3(a1);
  BOOL result = DigitizerEvent.touch.getter();
  *uint64_t v1 = result;
  return result;
}

uint64_t sub_260866414()
{
  return DigitizerEvent.touch.setter();
}

void type metadata accessor for DigitizerType()
{
}

void type metadata accessor for DigitizerEventMask()
{
}

void type metadata accessor for DigitizerEvent()
{
}

uint64_t OUTLINED_FUNCTION_0_36()
{
  return IOHIDEventSetIntegerValue();
}

uint64_t OUTLINED_FUNCTION_2_38()
{
  return IOHIDEventSetFloatValue();
}

uint64_t OUTLINED_FUNCTION_5_20()
{
  return IOHIDEventGetIntegerValue();
}

void OUTLINED_FUNCTION_7_21()
{
  sub_2607E9B50();
}

void OUTLINED_FUNCTION_8_24()
{
  sub_2607E9B50();
}

unint64_t OUTLINED_FUNCTION_10_19()
{
  return sub_260865B74();
}

uint64_t OUTLINED_FUNCTION_11_15()
{
  return IOHIDEventGetFloatValue();
}

uint64_t OUTLINED_FUNCTION_12_16()
{
  return IOHIDEventSetFloatValue();
}

void OUTLINED_FUNCTION_15_14()
{
  *(void *)(v0 + 16) = v1;
  *(_DWORD *)(v0 + 4 * v3 + 32) = v2;
}

uint64_t OUTLINED_FUNCTION_17_11()
{
  return IOHIDEventGetFloatValue();
}

double OUTLINED_FUNCTION_18_11()
{
  return v0;
}

unint64_t GenericGestureType.init(rawValue:)(unint64_t result)
{
  if ((result & 0x8000000000000000) != 0 || HIDWORD(result))
  {
    OUTLINED_FUNCTION_27();
    BOOL result = sub_26087B980();
    __break(1u);
  }
  return result;
}

uint64_t GenericGestureType.rawValue.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*GenericGestureType.rawValue.modify())()
{
  return nullsub_1;
}

uint64_t static GenericGestureType.tap.getter()
{
  return 0;
}

uint64_t static GenericGestureType.swipe.getter()
{
  return 1;
}

uint64_t static GenericGestureType.handTap.getter()
{
  return 2;
}

uint64_t static GenericGestureType.handTapHold.getter()
{
  return 4;
}

uint64_t static GenericGestureType.squeeze.getter()
{
  return 5;
}

uint64_t static GenericGestureType.longSqueeze.getter()
{
  return 6;
}

uint64_t static GenericGestureType.doubleSqueeze.getter()
{
  return 7;
}

BOOL static GenericGestureType.== infix(_:_:)(int a1, int a2)
{
  return a1 == a2;
}

uint64_t GenericGestureType.hash(into:)()
{
  return sub_26087BCE0();
}

uint64_t GenericGestureType.hashValue.getter()
{
  return sub_26087BD00();
}

BOOL sub_2608666C8(int *a1, int *a2)
{
  return static GenericGestureType.== infix(_:_:)(*a1, *a2);
}

uint64_t sub_2608666D4()
{
  return GenericGestureType.hashValue.getter();
}

uint64_t sub_2608666DC()
{
  return GenericGestureType.hash(into:)();
}

void *static GenericGestureType.allCases.getter()
{
  return &unk_270C9E708;
}

void sub_2608666F0(void *a1@<X8>)
{
  *a1 = &unk_270C9E708;
}

uint64_t GenericGestureType.description.getter(int a1)
{
  uint64_t result = 7364980;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 0x6570697773;
      break;
    case 2:
      uint64_t result = 0x706154646E6168;
      break;
    case 4:
      uint64_t result = 0x48706154646E6168;
      break;
    case 5:
      uint64_t result = 0x657A6565757173;
      break;
    case 6:
      uint64_t result = 0x65757153676E6F6CLL;
      break;
    case 7:
      uint64_t result = 0x7153656C62756F64;
      break;
    default:
      uint64_t result = sub_26087BBA0();
      break;
  }
  return result;
}

uint64_t sub_260866848()
{
  return GenericGestureType.description.getter(*v0);
}

uint64_t static GenericGestureEvent.eventType.getter()
{
  return 39;
}

uint64_t GenericGestureEvent.init(time:gestureType:flags:)()
{
  return IOHIDEventCreateGenericGestureEvent();
}

unint64_t GenericGestureEvent.gestureType.getter()
{
  unint64_t result = IOHIDEventGetIntegerValue();
  if ((result & 0x8000000000000000) != 0 || HIDWORD(result))
  {
    OUTLINED_FUNCTION_27();
    unint64_t result = sub_26087B980();
    __break(1u);
  }
  return result;
}

uint64_t GenericGestureEvent.gestureType.setter()
{
  return OUTLINED_FUNCTION_3_31();
}

uint64_t (*GenericGestureEvent.gestureType.modify(uint64_t a1, uint64_t a2))()
{
  *(void *)a1 = a2;
  *(_DWORD *)(a1 + 8) = GenericGestureEvent.gestureType.getter();
  return sub_260866968;
}

uint64_t sub_260866968()
{
  return OUTLINED_FUNCTION_3_31();
}

uint64_t GenericGestureEvent.tapCount.getter()
{
  return IOHIDEventGetIntegerValue();
}

uint64_t GenericGestureEvent.tapCount.setter()
{
  return OUTLINED_FUNCTION_2_39();
}

uint64_t (*GenericGestureEvent.tapCount.modify(uint64_t *a1, uint64_t a2))()
{
  a1[1] = a2;
  *a1 = IOHIDEventGetIntegerValue();
  return sub_2608669E4;
}

uint64_t sub_2608669E4()
{
  return OUTLINED_FUNCTION_2_39();
}

uint64_t GenericGestureEvent.swipeProgress.getter()
{
  return IOHIDEventGetFloatValue();
}

uint64_t (*GenericGestureEvent.swipeProgress.modify(void *a1, uint64_t a2))()
{
  a1[1] = a2;
  IOHIDEventGetFloatValue();
  *a1 = v3;
  return sub_260866A54;
}

uint64_t sub_260866A54()
{
  return OUTLINED_FUNCTION_1_37();
}

unint64_t sub_260866A68()
{
  unint64_t result = qword_26A8B5668;
  if (!qword_26A8B5668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5668);
  }
  return result;
}

unint64_t sub_260866AB8()
{
  unint64_t result = qword_26A8B5670;
  if (!qword_26A8B5670)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A8B5678);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5670);
  }
  return result;
}

unint64_t sub_260866B0C@<X0>(_DWORD *a1@<X8>)
{
  unint64_t result = GenericGestureEvent.gestureType.getter();
  *a1 = result;
  return result;
}

uint64_t sub_260866B38()
{
  return GenericGestureEvent.gestureType.setter();
}

uint64_t sub_260866B44@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = GenericGestureEvent.tapCount.getter();
  *a1 = result;
  return result;
}

uint64_t sub_260866B70()
{
  return GenericGestureEvent.tapCount.setter();
}

uint64_t sub_260866B7C@<X0>(void *a1@<X8>)
{
  uint64_t result = GenericGestureEvent.swipeProgress.getter();
  *a1 = v3;
  return result;
}

uint64_t sub_260866BA8(double *a1, void *a2)
{
  return GenericGestureEvent.swipeProgress.setter(*a2, *a1);
}

ValueMetadata *type metadata accessor for GenericGestureType()
{
  return &type metadata for GenericGestureType;
}

ValueMetadata *type metadata accessor for GenericGestureEvent()
{
  return &type metadata for GenericGestureEvent;
}

uint64_t OUTLINED_FUNCTION_1_37()
{
  return IOHIDEventSetFloatValue();
}

uint64_t OUTLINED_FUNCTION_2_39()
{
  return IOHIDEventSetIntegerValue();
}

uint64_t OUTLINED_FUNCTION_3_31()
{
  return IOHIDEventSetIntegerValue();
}

void RotationReport.remoteTimestamp.setter()
{
  uint64_t v1 = *v0;
  switch((unint64_t)v0[1] >> 62)
  {
    case 1uLL:
      if (!__OFSUB__(HIDWORD(v1), v1)) {
        goto LABEL_5;
      }
      goto LABEL_11;
    case 2uLL:
      if (!__OFSUB__(*(void *)(v1 + 24), *(void *)(v1 + 16))) {
        goto LABEL_5;
      }
      goto LABEL_12;
    case 3uLL:
      return;
    default:
LABEL_5:
      OUTLINED_FUNCTION_2_1();
      if (!v5)
      {
        __break(1u);
LABEL_11:
        __break(1u);
LABEL_12:
        __break(1u);
        JUMPOUT(0x260866C7CLL);
      }
      if (v4 >= 12)
      {
        if (v3) {
          uint64_t v2 = 0;
        }
        _s12UniversalHID9HIDReportV_2ass5Int64VSi_AFmtcis_0(v2, 32);
      }
      return;
  }
}

uint64_t RotationReport.phase.setter()
{
  unsigned int v0 = OUTLINED_FUNCTION_1_9();
  uint64_t v1 = OUTLINED_FUNCTION_1_4(v0);
  return _s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcis_0(v1, v2);
}

uint64_t RotationReport.z.setter(double a1)
{
  return sub_2607E260C(16, a1);
}

double RotationReport.z.getter(uint64_t a1, uint64_t a2)
{
  return sub_2607DCFD0(16, a1, a2);
}

unint64_t RotationReport.phase.getter(uint64_t a1, unint64_t a2)
{
  return sub_2607DB19C(8, a1, a2) & 0xFFFFFF8F;
}

uint64_t static RotationReport.initialReportBitCount.getter()
{
  return 32;
}

uint64_t static RotationReport.reportID.getter()
{
  return 16;
}

uint64_t sub_260866D14()
{
  uint64_t result = sub_260866D38();
  *(void *)&xmmword_26A8B5680 = result;
  *((void *)&xmmword_26A8B5680 + 1) = v1;
  return result;
}

uint64_t sub_260866D38()
{
  LOBYTE(v53[0]) = 12;
  uint64_t v42 = sub_2608155C0((char *)v53, 8uLL);
  unint64_t v1 = v0;
  LOBYTE(v53[0]) = 14;
  uint64_t v2 = sub_260815298((char *)v53, 1);
  unint64_t v4 = v3;
  LOBYTE(v48) = 0;
  LOBYTE(v46[0]) = 1;
  __int16 v52 = 0;
  __int16 v51 = 0;
  HIBYTE(v50) = 0;
  Input.init(_:_:_:_:_:_:_:_:)((unsigned __int8 *)&v48, v46, (unsigned char *)&v52 + 1, &v52, (unsigned char *)&v51 + 1, &v51, (unsigned char *)&v50 + 1, v53);
  LOBYTE(v48) = 12;
  uint64_t v5 = sub_2608155C0((char *)&v48, 0x10uLL);
  unint64_t v43 = v6;
  uint64_t v44 = v5;
  LOBYTE(v48) = 14;
  uint64_t v45 = sub_260815298((char *)&v48, 1);
  unint64_t v8 = v7;
  LOBYTE(v46[0]) = 0;
  __int16 v52 = 257;
  __int16 v51 = 0;
  __int16 v50 = 0;
  Input.init(_:_:_:_:_:_:_:_:)((unsigned __int8 *)v46, (unsigned char *)&v52 + 1, &v52, (unsigned char *)&v51 + 1, &v51, (unsigned char *)&v50 + 1, &v50, &v48);
  LOBYTE(v46[0]) = 5;
  uint64_t v37 = sub_2608155C0((char *)v46, 0xFF00uLL);
  unint64_t v10 = v9;
  unint64_t v28 = v9;
  LOBYTE(v46[0]) = 17;
  uint64_t v11 = sub_2608155C0((char *)v46, 0x102uLL);
  unint64_t v35 = v12;
  uint64_t v36 = v11;
  LOBYTE(v46[0]) = 6;
  uint64_t v24 = sub_260815298((char *)v46, 0);
  unint64_t v34 = v13;
  LOBYTE(v46[0]) = 7;
  uint64_t v32 = sub_260815298((char *)v46, 255);
  unint64_t v33 = v14;
  LOBYTE(v46[0]) = 12;
  uint64_t v15 = sub_2608155C0((char *)v46, 8uLL);
  unint64_t v40 = v16;
  uint64_t v41 = v15;
  LOBYTE(v46[0]) = 14;
  uint64_t v17 = sub_260815298((char *)v46, 8);
  unint64_t v38 = v18;
  uint64_t v39 = v17;
  __int16 v52 = 1;
  __int16 v51 = 0;
  __int16 v50 = 0;
  char v47 = 0;
  Input.init(_:_:_:_:_:_:_:_:)((unsigned __int8 *)&v52 + 1, &v52, (unsigned char *)&v51 + 1, &v51, (unsigned char *)&v50 + 1, &v50, &v47, v46);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B4660);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_26087D790;
  *(void *)(inited + 56) = &type metadata for ReportID;
  *(void *)(inited + 64) = &protocol witness table for ReportID;
  *(unsigned char *)(inited + 32) = 16;
  *(void *)(inited + 96) = &type metadata for ReportSize;
  *(void *)(inited + 104) = &protocol witness table for ReportSize;
  *(void *)(inited + 72) = v42;
  *(void *)(inited + 80) = v1;
  *(void *)(inited + 136) = &type metadata for ReportCount;
  *(void *)(inited + 144) = &protocol witness table for ReportCount;
  *(void *)(inited + 112) = v2;
  *(void *)(inited + 120) = v4;
  *(void *)(inited + 336) = &type metadata for UsagePage;
  *(void *)(inited + 344) = &protocol witness table for UsagePage;
  *(void *)(inited + 376) = &type metadata for Usage;
  *(void *)(inited + 384) = &protocol witness table for Usage;
  *(void *)(inited + 416) = &type metadata for LogicalMinimum;
  *(void *)(inited + 424) = &protocol witness table for LogicalMinimum;
  *(void *)(inited + 456) = &type metadata for LogicalMaximum;
  *(void *)(inited + 464) = &protocol witness table for LogicalMaximum;
  unint64_t v21 = v53[1];
  uint64_t v31 = v53[0];
  uint64_t v20 = v53[0];
  *(void *)(inited + 496) = &type metadata for ReportSize;
  *(void *)(inited + 216) = &type metadata for ReportSize;
  *(void *)(inited + 224) = &protocol witness table for ReportSize;
  *(void *)(inited + 504) = &protocol witness table for ReportSize;
  *(void *)(inited + 176) = &type metadata for Input;
  *(void *)(inited + 184) = &protocol witness table for Input;
  *(void *)(inited + 152) = v20;
  *(void *)(inited + 160) = v21;
  *(void *)(inited + 192) = v44;
  *(void *)(inited + 200) = v43;
  *(void *)(inited + 256) = &type metadata for ReportCount;
  *(void *)(inited + 264) = &protocol witness table for ReportCount;
  *(void *)(inited + 232) = v45;
  *(void *)(inited + 240) = v8;
  *(void *)(inited + 536) = &type metadata for ReportCount;
  *(void *)(inited + 544) = &protocol witness table for ReportCount;
  unint64_t v29 = v49;
  unint64_t v22 = v49;
  uint64_t v30 = v48;
  *(void *)(inited + 296) = &type metadata for Input;
  *(void *)(inited + 304) = &protocol witness table for Input;
  *(void *)(inited + 272) = v30;
  *(void *)(inited + 280) = v22;
  *(void *)(inited + 312) = v37;
  *(void *)(inited + 320) = v10;
  *(void *)(inited + 352) = v36;
  *(void *)(inited + 360) = v35;
  *(void *)(inited + 392) = v24;
  *(void *)(inited + 400) = v34;
  *(void *)(inited + 432) = v32;
  *(void *)(inited + 440) = v33;
  *(void *)(inited + 472) = v41;
  *(void *)(inited + 480) = v40;
  *(void *)(inited + 512) = v39;
  *(void *)(inited + 520) = v38;
  *(void *)(inited + 576) = &type metadata for Input;
  *(void *)(inited + 584) = &protocol witness table for Input;
  uint64_t v25 = v46[0];
  unint64_t v26 = v46[1];
  *(void *)(inited + 552) = v46[0];
  *(void *)(inited + 560) = v26;
  sub_2607DCED0(v42, v1);
  sub_2607DCED0(v2, v4);
  sub_2607DCED0(v31, v21);
  sub_2607DCED0(v44, v43);
  sub_2607DCED0(v45, v8);
  sub_2607DCED0(v30, v29);
  sub_2607DCED0(v37, v28);
  sub_2607DCED0(v36, v35);
  sub_2607DCED0(v24, v34);
  sub_2607DCED0(v32, v33);
  sub_2607DCED0(v41, v40);
  sub_2607DCED0(v39, v38);
  sub_2607DCED0(v25, v26);
  uint64_t v27 = static HIDReportDescriptor.Builder.buildBlock(_:)(inited);
  swift_setDeallocating();
  sub_2608374F8();
  sub_2607DCF28(v25, v26);
  sub_2607DCF28(v39, v38);
  sub_2607DCF28(v41, v40);
  sub_2607DCF28(v32, v33);
  sub_2607DCF28(v24, v34);
  sub_2607DCF28(v36, v35);
  sub_2607DCF28(v37, v28);
  sub_2607DCF28(v30, v29);
  sub_2607DCF28(v45, v8);
  sub_2607DCF28(v44, v43);
  sub_2607DCF28(v31, v21);
  sub_2607DCF28(v2, v4);
  sub_2607DCF28(v42, v1);
  return v27;
}

uint64_t static RotationReport.descriptor.getter@<X0>(_OWORD *a1@<X8>)
{
  if (qword_26A8B4558 != -1) {
    swift_once();
  }
  long long v2 = xmmword_26A8B5680;
  *a1 = xmmword_26A8B5680;
  return sub_2607DCED0(v2, *((unint64_t *)&v2 + 1));
}

uint64_t RotationReport.report.getter(uint64_t a1, unint64_t a2)
{
  return a1;
}

uint64_t RotationReport.report.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_2607DCF28(*(void *)v2, *(void *)(v2 + 8));
  *(void *)uint64_t v2 = a1;
  *(void *)(v2 + 8) = a2;
  return result;
}

uint64_t (*RotationReport.report.modify())()
{
  return nullsub_1;
}

uint64_t sub_26086730C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = RotationReport.init(_report:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_260867334()
{
  return sub_26087591C(*(void *)v0, *(void *)(v0 + 8));
}

unint64_t RotationReport.flags.getter(uint64_t a1, unint64_t a2)
{
  return sub_2607DB19C(8, a1, a2);
}

unint64_t sub_26086734C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = RotationReport.flags.getter(*(void *)a1, *(void *)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t RotationReport.flags.setter(uint64_t a1)
{
  return _s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcis_0(a1, 8);
}

uint64_t (*RotationReport.flags.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(unsigned char *)(a1 + 8) = OUTLINED_FUNCTION_1_9();
  return sub_2607E79F0;
}

unint64_t sub_2608673CC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = RotationReport.phase.getter(*(void *)a1, *(void *)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t (*RotationReport.phase.modify(uint64_t a1))()
{
  *(void *)a1 = v1;
  *(unsigned char *)(a1 + 8) = OUTLINED_FUNCTION_1_9() & 0x8F;
  return sub_2607FA600;
}

void sub_260867448(uint64_t *a1@<X0>, double *a2@<X8>)
{
  *a2 = RotationReport.z.getter(*a1, a1[1]);
}

uint64_t (*RotationReport.z.modify(uint64_t a1))(double *a1)
{
  *(void *)(a1 + 8) = v1;
  *(double *)a1 = sub_2607DCFD0(16, *v1, v1[1]);
  return sub_2607FA6B0;
}

uint64_t RotationReport.remoteTimestamp.getter(uint64_t a1, unint64_t a2)
{
  uint64_t result = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v4) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_12;
      }
      uint64_t v4 = (int)v4;
LABEL_6:
      if ((unint64_t)(v4 - 0x1000000000000000) >> 61 != 7)
      {
        __break(1u);
LABEL_12:
        __break(1u);
LABEL_13:
        __break(1u);
        JUMPOUT(0x260867578);
      }
      if (v4 >= 12) {
        return _s12UniversalHID9HIDReportV_2ass5Int64VSi_AFmtcig_0(32, a1, a2);
      }
      else {
        return 0;
      }
    case 2uLL:
      uint64_t v6 = *(void *)(a1 + 16);
      uint64_t v5 = *(void *)(a1 + 24);
      BOOL v7 = __OFSUB__(v5, v6);
      uint64_t v4 = v5 - v6;
      if (!v7) {
        goto LABEL_6;
      }
      goto LABEL_13;
    case 3uLL:
      return result;
    default:
      uint64_t v4 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_260867588@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = RotationReport.remoteTimestamp.getter(*(void *)a1, *(void *)(a1 + 8));
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_2608675C0()
{
}

void (*RotationReport.remoteTimestamp.modify(uint64_t a1))(uint64_t *a1, char a2)
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *v1;
  char v4 = 1;
  uint64_t v5 = 0;
  switch((unint64_t)v1[1] >> 62)
  {
    case 1uLL:
      if (!__OFSUB__(HIDWORD(v3), v3)) {
        goto LABEL_5;
      }
      goto LABEL_11;
    case 2uLL:
      if (!__OFSUB__(*(void *)(v3 + 24), *(void *)(v3 + 16))) {
        goto LABEL_5;
      }
      goto LABEL_12;
    case 3uLL:
      goto LABEL_10;
    default:
LABEL_5:
      OUTLINED_FUNCTION_2_1();
      if (!v9)
      {
        __break(1u);
LABEL_11:
        __break(1u);
LABEL_12:
        __break(1u);
        JUMPOUT(0x2608676C4);
      }
      if (v8 >= 12)
      {
        uint64_t v5 = _s12UniversalHID9HIDReportV_2ass5Int64VSi_AFmtcig_0(32, v6, v7);
        char v4 = 0;
      }
      else
      {
        uint64_t v5 = 0;
        char v4 = 1;
      }
LABEL_10:
      *(void *)a1 = v5;
      *(unsigned char *)(a1 + 8) = v4;
      return sub_2608676D4;
  }
}

void sub_2608676D4(uint64_t *a1, char a2)
{
  uint64_t v4 = *a1;
  int v5 = *((unsigned __int8 *)a1 + 8);
  uint64_t v6 = (uint64_t *)a1[2];
  if (a2)
  {
    RotationReport.remoteTimestamp.setter();
  }
  else
  {
    uint64_t v7 = *v6;
    switch((unint64_t)v6[1] >> 62)
    {
      case 1uLL:
        BOOL v8 = __OFSUB__(HIDWORD(v7), v7);
        uint64_t v9 = (HIDWORD(v7) - v7);
        if (v8) {
          goto LABEL_10;
        }
        goto LABEL_8;
      case 2uLL:
        uint64_t v12 = v7 + 16;
        uint64_t v10 = *(void *)(v7 + 16);
        uint64_t v11 = *(void *)(v12 + 8);
        BOOL v8 = __OFSUB__(v11, v10);
        uint64_t v9 = v11 - v10;
        if (!v8) {
          goto LABEL_8;
        }
        goto LABEL_11;
      case 3uLL:
        return;
      default:
LABEL_8:
        OUTLINED_FUNCTION_2_1();
        if (!v13)
        {
          __break(1u);
LABEL_10:
          __break(1u);
LABEL_11:
          __break(1u);
        }
        if (v9 >= 12)
        {
          if (v5) {
            uint64_t v4 = 0;
          }
          _s12UniversalHID9HIDReportV_2ass5Int64VSi_AFmtcis_0(v4, 32);
        }
        break;
    }
  }
}

uint64_t sub_26086779C()
{
  return RotationReport.remoteTimestamp.getter(*(void *)v0, *(void *)(v0 + 8));
}

void sub_2608677BC()
{
}

void (*sub_2608677C4(uint64_t a1))()
{
  *(void *)(a1 + 16) = v1;
  *(void *)a1 = RotationReport.remoteTimestamp.getter(*(void *)v1, *(void *)(v1 + 8));
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return sub_260867818;
}

void sub_260867818()
{
}

uint64_t sub_26086784C(unsigned __int8 *a1)
{
  return RotationReport.flags.setter(*a1);
}

uint64_t sub_260867878()
{
  return RotationReport.phase.setter();
}

uint64_t sub_2608678A4(double *a1)
{
  return RotationReport.z.setter(*a1);
}

ValueMetadata *type metadata accessor for RotationReport()
{
  return &type metadata for RotationReport;
}

#error "260867998: call analysis failed (funcsize=68)"

uint64_t GenericGestureGesture.deinit()
{
  return v0;
}

uint64_t GenericGestureGesture.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

_UNKNOWN **sub_260867A20()
{
  return &protocol witness table for GenericGestureReport;
}

_UNKNOWN **sub_260867A2C()
{
  return &protocol witness table for GenericGestureReport;
}

uint64_t sub_260867A38(void *a1)
{
  return GenericGestureGesture.dispatch(report:)(*a1, a1[1]);
}

uint64_t type metadata accessor for GenericGestureGesture()
{
  return self;
}

uint64_t method lookup function for GenericGestureGesture(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for GenericGestureGesture);
}

void HIDServiceClient.mouseAcceleration.setter(uint64_t a1, char a2)
{
}

void HIDServiceClient.mouseScrollAcceleration.setter(uint64_t a1, char a2)
{
}

void HIDServiceClient.trackpadAcceleration.setter(uint64_t a1, char a2)
{
}

void HIDServiceClient.trackpadScrollAcceleration.setter(uint64_t a1, char a2)
{
}

id HIDEventService.bridgedValue.getter()
{
  return v0;
}

id sub_260867B14(uint64_t a1)
{
  return sub_260868164(a1);
}

id sub_260867B30(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(v2, sel_conformsToUsagePage_usage_, a1, a2);
}

unint64_t sub_260867B5C(uint64_t a1)
{
  return (unint64_t)sub_2608681D8(a1) & 1;
}

double sub_260867B78@<D0>(_OWORD *a1@<X8>)
{
  return sub_260835160(a1);
}

CFStringRef _sSo15HIDEventServiceC12UniversalHIDE14logDescriptionSSvg_0()
{
  CFStringRef result = CFCopyDescription(v0);
  if (result)
  {
    uint64_t v2 = (__CFString *)result;
    uint64_t v3 = sub_26087B2B0();

    return (CFStringRef)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_260867BE4()
{
  swift_bridgeObjectRetain();
  uint64_t v1 = (void *)sub_26087B2A0();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_propertyForKey_, v1);

  if (v2)
  {
    sub_26087B730();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_260845CA4((uint64_t)v5, (uint64_t)v6);
  if (v7)
  {
    if (swift_dynamicCast()) {
      return v4;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_26083D264((uint64_t)v6);
    return 0;
  }
}

void sub_260867CE0(uint64_t a1, char a2)
{
  if (a2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = sub_26087B4B0();
  }
  id v4 = (id)sub_26087B2A0();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setProperty_forKey_, v3, v4);
  swift_unknownObjectRelease();
}

uint64_t HIDServiceClient.mouseAcceleration.getter()
{
  return OUTLINED_FUNCTION_5_21();
}

uint64_t sub_260867D98@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = HIDServiceClient.mouseAcceleration.getter();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

void sub_260867DCC(uint64_t a1)
{
}

void (*HIDServiceClient.mouseAcceleration.modify(uint64_t a1))(uint64_t a1)
{
  OUTLINED_FUNCTION_3_32(a1);
  uint64_t v1 = OUTLINED_FUNCTION_5_21();
  OUTLINED_FUNCTION_17_10(v1, v2);
  return sub_260867E4C;
}

void sub_260867E4C(uint64_t a1)
{
}

uint64_t HIDServiceClient.mouseScrollAcceleration.getter()
{
  return OUTLINED_FUNCTION_4_23();
}

uint64_t sub_260867E88@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = HIDServiceClient.mouseScrollAcceleration.getter();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

void sub_260867EBC(uint64_t a1)
{
}

void (*HIDServiceClient.mouseScrollAcceleration.modify(uint64_t a1))(uint64_t a1)
{
  OUTLINED_FUNCTION_3_32(a1);
  uint64_t v1 = OUTLINED_FUNCTION_4_23();
  OUTLINED_FUNCTION_17_10(v1, v2);
  return sub_260867F3C;
}

void sub_260867F3C(uint64_t a1)
{
}

uint64_t HIDServiceClient.trackpadAcceleration.getter()
{
  return OUTLINED_FUNCTION_6_26();
}

uint64_t sub_260867F78@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = HIDServiceClient.trackpadAcceleration.getter();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

void sub_260867FAC(uint64_t a1)
{
}

void (*HIDServiceClient.trackpadAcceleration.modify(uint64_t a1))(uint64_t a1)
{
  OUTLINED_FUNCTION_3_32(a1);
  uint64_t v1 = OUTLINED_FUNCTION_6_26();
  OUTLINED_FUNCTION_17_10(v1, v2);
  return sub_26086802C;
}

void sub_26086802C(uint64_t a1)
{
}

uint64_t HIDServiceClient.trackpadScrollAcceleration.getter()
{
  return OUTLINED_FUNCTION_7_22();
}

uint64_t sub_260868068@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = HIDServiceClient.trackpadScrollAcceleration.getter();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

void sub_26086809C(uint64_t a1)
{
}

void (*HIDServiceClient.trackpadScrollAcceleration.modify(uint64_t a1))(uint64_t a1)
{
  OUTLINED_FUNCTION_3_32(a1);
  uint64_t v1 = OUTLINED_FUNCTION_7_22();
  OUTLINED_FUNCTION_17_10(v1, v2);
  return sub_26086811C;
}

void sub_26086811C(uint64_t a1)
{
}

void sub_260868134(uint64_t a1)
{
}

id sub_260868164(uint64_t a1)
{
  if (a1) {
    char v2 = (void *)sub_26087B1D0();
  }
  else {
    char v2 = 0;
  }
  id v3 = objc_msgSend(v1, sel_eventMatching_, v2);

  return v3;
}

id sub_2608681D8(uint64_t a1)
{
  sub_260835910(a1, (uint64_t)v12);
  uint64_t v2 = v13;
  if (v13)
  {
    id v3 = __swift_project_boxed_opaque_existential_1(v12, v13);
    uint64_t v4 = *(void *)(v2 - 8);
    double v5 = MEMORY[0x270FA5388](v3);
    uint64_t v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, double))(v4 + 16))(v7, v5);
    uint64_t v8 = sub_26087BBD0();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v2);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v9 = (void *)sub_26087B2A0();
  id v10 = objc_msgSend(v1, sel_setProperty_forKey_, v8, v9);
  swift_unknownObjectRelease();

  return v10;
}

uint64_t dispatch thunk of HIDEventServiceProtocol.logDescription.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of HIDEventServiceProtocol.serviceID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of HIDEventServiceProtocol.event(matching:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of HIDEventServiceProtocol.conforms(toUsagePage:usage:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of HIDEventServiceProtocol.setProperty(_:forKey:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
}

uint64_t dispatch thunk of HIDEventServiceProtocol.property(forKey:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

void OUTLINED_FUNCTION_0_37(uint64_t a1, char a2)
{
}

void OUTLINED_FUNCTION_1_38(uint64_t a1)
{
}

uint64_t OUTLINED_FUNCTION_3_32(uint64_t result)
{
  *(void *)(result + 16) = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_4_23()
{
  return sub_260867BE4();
}

uint64_t OUTLINED_FUNCTION_5_21()
{
  return sub_260867BE4();
}

uint64_t OUTLINED_FUNCTION_6_26()
{
  return sub_260867BE4();
}

uint64_t OUTLINED_FUNCTION_7_22()
{
  return sub_260867BE4();
}

uint64_t DockSwipeGesture.__allocating_init(platform:)(unsigned char *a1)
{
  uint64_t result = swift_allocObject();
  *(unsigned char *)(result + 16) = *a1;
  return result;
}

uint64_t static DockSwipeEvent.dispatch(report:platform:)(uint64_t a1, uint64_t a2, char *a3)
{
  char v5 = *a3;
  type metadata accessor for DockSwipeGesture();
  *(unsigned char *)(swift_initStackObject() + 16) = v5;
  return DockSwipeGesture.dispatch(report:)(a1, a2);
}

#error "260868638: call analysis failed (funcsize=176)"

void DockSwipeGesture.platform.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

uint64_t DockSwipeGesture.init(platform:)(unsigned char *a1)
{
  *(unsigned char *)(v1 + 16) = *a1;
  return v1;
}

uint64_t type metadata accessor for DockSwipeGesture()
{
  return self;
}

uint64_t DockSwipeGesture.deinit()
{
  return v0;
}

uint64_t DockSwipeGesture.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 17, 7);
}

_UNKNOWN **sub_260868834()
{
  return &protocol witness table for DockSwipeReport;
}

_UNKNOWN **sub_260868840()
{
  return &protocol witness table for DockSwipeReport;
}

uint64_t sub_26086884C(void *a1)
{
  return DockSwipeGesture.dispatch(report:)(*a1, a1[1]);
}

uint64_t method lookup function for DockSwipeGesture(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DockSwipeGesture);
}

uint64_t dispatch thunk of DockSwipeGesture.__allocating_init(platform:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_2608688A4(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_2608688CC(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_2608688F4()
{
  uint64_t v0 = sub_26087B120();
  __swift_allocate_value_buffer(v0, qword_26A8C03F8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A8C03F8);
  return sub_26087B110();
}

uint64_t sub_260868978@<X0>(uint64_t *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v5 = *(void *)(v3 + 48);
  uint64_t v4 = *(void *)(v3 + 56);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  *(void *)(v6 + 24) = v4;
  *a2 = sub_260869EC0;
  a2[1] = (uint64_t (*)())v6;
  return swift_retain();
}

uint64_t sub_2608689F8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  uint64_t v6 = *a2;
  swift_beginAccess();
  *(void *)(v6 + 48) = sub_260869E60;
  *(void *)(v6 + 56) = v5;
  swift_retain();
  return swift_release();
}

uint64_t HIDReportDispatcher.terminationWasRequestedHandler.getter()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 48);
  swift_retain();
  return v1;
}

uint64_t HIDReportDispatcher.terminationWasRequestedHandler.setter(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return swift_release();
}

uint64_t (*HIDReportDispatcher.terminationWasRequestedHandler.modify())()
{
  return j__swift_endAccess;
}

void HIDReportDispatcher.__allocating_init()()
{
}

void HIDReportDispatcher.init()()
{
  uint64_t v2 = v0;
  uint64_t v3 = sub_26087B550();
  OUTLINED_FUNCTION_10_2();
  uint64_t v35 = v4;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_9_0();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = sub_26087B540();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_9_0();
  uint64_t v10 = sub_26087B190();
  MEMORY[0x270FA5388](v10 - 8);
  OUTLINED_FUNCTION_9_0();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A8B50E0);
  MEMORY[0x270FA5388](v11 - 8);
  OUTLINED_FUNCTION_13_14();
  sub_26087B0F0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B5690);
  sub_260869324(&qword_26A8B4750, MEMORY[0x263F07508]);
  v0[5] = sub_26087B200();
  v0[6] = nullsub_1;
  v0[7] = 0;
  id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F41DD8]), sel_initWithType_, 0);
  if (!v12)
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_deallocPartialClassInstance();
    return;
  }
  uint64_t v13 = v12;
  v0[2] = v12;
  sub_26081221C(0, &qword_26A8B4948);
  id v14 = v13;
  v0[3] = sub_26087B560();
  if (qword_26A8B4560 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_26087B120();
  uint64_t v16 = __swift_project_value_buffer(v15, (uint64_t)qword_26A8C03F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v1, v16, v15);
  __swift_storeEnumTagSinglePayload(v1, 0, 1, v15);
  sub_26087B180();
  uint64_t aBlock = MEMORY[0x263F8EE78];
  sub_260869324(&qword_26A8B4950, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B4958);
  sub_26086936C();
  sub_26087B7A0();
  (*(void (**)(uint64_t, void, uint64_t))(v35 + 104))(v8, *MEMORY[0x263F8F138], v3);
  sub_260870AC4(0xD00000000000002BLL, 0x80000002608858A0);
  uint64_t v17 = sub_26087B580();
  uint64_t v18 = sub_260870AC4(0xD000000000000034, 0x80000002608858D0);
  type metadata accessor for HIDVirtualServicePool(0);
  swift_allocObject();
  uint64_t v19 = HIDVirtualServicePool.init(logger:queue:workloop:)(v1, v17, v18);
  v2[4] = v19;
  uint64_t v20 = swift_retain();
  OUTLINED_FUNCTION_17_12(v20, sel_setDispatchQueue_);
  unint64_t v40 = sub_2608693E4;
  uint64_t v41 = v2;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v37 = 1107296256;
  unint64_t v38 = sub_2608045D0;
  uint64_t v39 = &block_descriptor_4;
  unint64_t v21 = _Block_copy(&aBlock);
  swift_retain();
  uint64_t v22 = swift_release();
  OUTLINED_FUNCTION_17_12(v22, sel_setCancelHandler_);
  _Block_release(v21);
  unint64_t v40 = (void (*)())sub_260869404;
  uint64_t v41 = v2;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v37 = 1107296256;
  unint64_t v38 = sub_260869520;
  uint64_t v39 = &block_descriptor_3_0;
  uint64_t v23 = _Block_copy(&aBlock);
  swift_retain();
  uint64_t v24 = swift_release();
  OUTLINED_FUNCTION_17_12(v24, sel_setServiceNotificationHandler_);
  _Block_release(v23);
  sub_26087B200();
  uint64_t v25 = (void *)sub_26087B1D0();
  uint64_t v26 = swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_17_12(v26, sel_setMatching_);

  objc_msgSend(v14, sel_activate);
  uint64_t v27 = swift_allocObject();
  swift_weakInit();
  unint64_t v28 = (uint64_t (**)(uint64_t))(v19
                                         + OBJC_IVAR____TtC12UniversalHID21HIDVirtualServicePool_terminationWasRequestedHandler);
  swift_beginAccess();
  *unint64_t v28 = sub_260869658;
  v28[1] = (uint64_t (*)(uint64_t))v27;
  swift_release();
  id v29 = objc_msgSend(v14, sel_services);
  sub_26081221C(0, &qword_26A8B5698);
  unint64_t v30 = sub_26087B3F0();

  if (v30 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v31 = sub_26087B9C0();
    swift_bridgeObjectRelease();
    if (v31) {
      goto LABEL_6;
    }
LABEL_12:

    swift_bridgeObjectRelease();
    swift_release();
    return;
  }
  uint64_t v31 = *(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v31) {
    goto LABEL_12;
  }
LABEL_6:
  if (v31 >= 1)
  {
    for (uint64_t i = 0; i != v31; ++i)
    {
      if ((v30 & 0xC000000000000001) != 0) {
        id v33 = (id)MEMORY[0x26121CC50](i, v30);
      }
      else {
        id v33 = *(id *)(v30 + 8 * i + 32);
      }
      unint64_t v34 = v33;
      sub_260869408();
    }
    goto LABEL_12;
  }
  __break(1u);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_260869324(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_26086936C()
{
  unint64_t result = qword_26A8B4960;
  if (!qword_26A8B4960)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A8B4958);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B4960);
  }
  return result;
}

void sub_2608693C0()
{
}

void sub_2608693E4()
{
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

void sub_260869408()
{
  uint64_t v1 = sub_26087B1A0();
  uint64_t v2 = *(void *)(v1 - 8);
  double v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (uint64_t *)((char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = *(void **)(v0 + 24);
  *uint64_t v5 = v6;
  (*(void (**)(void *, void, uint64_t, double))(v2 + 104))(v5, *MEMORY[0x263F8F0E0], v1, v3);
  id v7 = v6;
  LOBYTE(v6) = sub_26087B1B0();
  (*(void (**)(void *, uint64_t))(v2 + 8))(v5, v1);
  if (v6) {
    HIDVirtualServicePool.addServiceClient(_:)();
  }
  else {
    __break(1u);
  }
}

void sub_260869520(uint64_t a1, void *a2)
{
  double v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_260869588()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2608695C0(uint64_t a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v3 = result;
    swift_beginAccess();
    id v4 = *(void (**)(uint64_t))(v3 + 48);
    swift_retain();
    swift_release();
    v4(a1);
    return swift_release();
  }
  return result;
}

uint64_t sub_260869658(uint64_t a1)
{
  return sub_2608695C0(a1);
}

void HIDReportDispatcher.setInputDevices(_:for:)()
{
}

void sub_2608696E0()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v14 = MEMORY[0x263F8EE88];
  sub_2607F5FF8(v15, v1);
  uint64_t v2 = v15[0];
  uint64_t v3 = v15[1];
  int64_t v4 = v15[3];
  unint64_t v5 = v15[4];
  int64_t v6 = (unint64_t)(v15[2] + 64) >> 6;
  swift_bridgeObjectRetain_n();
  if (!v5) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v7 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v8 = v7 | (v4 << 6);
  while (1)
  {
    uint64_t v13 = *(void *)(*(void *)(v2 + 56) + 8 * v8);
    swift_bridgeObjectRetain();
    sub_260869930((uint64_t)&v14, &v13);
    swift_bridgeObjectRelease();
    if (v5) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v9 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      break;
    }
    if (v9 >= v6) {
      goto LABEL_24;
    }
    unint64_t v10 = *(void *)(v3 + 8 * v9);
    if (!v10)
    {
      int64_t v11 = v4 + 2;
      if (v4 + 2 >= v6) {
        goto LABEL_24;
      }
      unint64_t v10 = *(void *)(v3 + 8 * v11);
      if (v10) {
        goto LABEL_14;
      }
      int64_t v11 = v4 + 3;
      if (v4 + 3 >= v6) {
        goto LABEL_24;
      }
      unint64_t v10 = *(void *)(v3 + 8 * v11);
      if (v10) {
        goto LABEL_14;
      }
      int64_t v11 = v4 + 4;
      if (v4 + 4 >= v6) {
        goto LABEL_24;
      }
      unint64_t v10 = *(void *)(v3 + 8 * v11);
      if (v10) {
        goto LABEL_14;
      }
      int64_t v11 = v4 + 5;
      if (v4 + 5 >= v6) {
        goto LABEL_24;
      }
      unint64_t v10 = *(void *)(v3 + 8 * v11);
      if (v10)
      {
LABEL_14:
        int64_t v9 = v11;
      }
      else
      {
        int64_t v9 = v4 + 6;
        if (v4 + 6 >= v6) {
          goto LABEL_24;
        }
        unint64_t v10 = *(void *)(v3 + 8 * v9);
        if (!v10)
        {
          int64_t v12 = v4 + 7;
          while (v12 < v6)
          {
            unint64_t v10 = *(void *)(v3 + 8 * v12++);
            if (v10)
            {
              int64_t v9 = v12 - 1;
              goto LABEL_15;
            }
          }
LABEL_24:
          swift_bridgeObjectRelease();
          swift_release();
          HIDVirtualServicePool.enabledDeviceTypes.setter();
          return;
        }
      }
    }
LABEL_15:
    unint64_t v5 = (v10 - 1) & v10;
    unint64_t v8 = __clz(__rbit64(v10)) + (v9 << 6);
    int64_t v4 = v9;
  }
  __break(1u);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __break(1u);
}

void HIDReportDispatcher.dispatchReport(_:from:)()
{
}

Swift::Void __swiftcall HIDReportDispatcher.resetGestureState()()
{
}

void HIDReportDispatcher.resetGestureState(for:)()
{
}

void sub_260869930(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = *(void *)(*a2 + 16);
  if (!v3) {
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = 40;
  unint64_t v21 = 0x8000000260885090;
  while (1)
  {
    unint64_t v5 = *(void **)(v2 + v4);
    strcpy((char *)&v17, "DeviceTypeHint");
    HIBYTE(v17) = -18;
    id v6 = v5;
    id v7 = objc_msgSend(v6, sel___swift_objectForKeyedSubscript_, sub_26087BC00());
    swift_unknownObjectRelease();
    if (v7)
    {
      sub_26087B730();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
    }
    sub_260845CA4((uint64_t)&v17, (uint64_t)v19);
    if (v20)
    {
      if (swift_dynamicCast())
      {
        BOOL v8 = v15 == 0x6573756F4DLL && v16 == 0xE500000000000000;
        if (v8 || (sub_26087BBE0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
LABEL_38:
          uint64_t v11 = 4;
          goto LABEL_39;
        }
        if (v15 == 0x6461706B63617254 && v16 == 0xE800000000000000)
        {
          swift_bridgeObjectRelease();
LABEL_49:
          uint64_t v11 = 5;
          goto LABEL_39;
        }
        char v14 = sub_26087BBE0();
        swift_bridgeObjectRelease();
        if (v14) {
          goto LABEL_49;
        }
      }
    }
    else
    {
      sub_26083D264((uint64_t)v19);
    }
    *(void *)&long long v17 = 0xD000000000000010;
    *((void *)&v17 + 1) = v21;
    id v9 = objc_msgSend(v6, sel___swift_objectForKeyedSubscript_, sub_26087BC00());
    swift_unknownObjectRelease();
    if (v9)
    {
      sub_26087B730();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
    }
    sub_260845CA4((uint64_t)&v17, (uint64_t)v19);
    if (!v20) {
      break;
    }
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_52;
    }
    strcpy((char *)&v17, "PrimaryUsage");
    BYTE13(v17) = 0;
    HIWORD(v17) = -5120;
    id v10 = objc_msgSend(v6, sel___swift_objectForKeyedSubscript_, sub_26087BC00());
    swift_unknownObjectRelease();
    if (v10)
    {
      sub_26087B730();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
    }
    sub_260845CA4((uint64_t)&v17, (uint64_t)v19);
    if (!v20) {
      break;
    }
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_52;
    }
    if ((unsigned __int16)v15 == 1)
    {
      if ((unsigned __int16)v15 == 5) {
        unsigned int v12 = 2;
      }
      else {
        unsigned int v12 = 4;
      }
      if ((unsigned __int16)v15 == 6) {
        uint64_t v11 = 3;
      }
      else {
        uint64_t v11 = v12;
      }
      goto LABEL_39;
    }
    if ((unsigned __int16)v15 != 13) {
      goto LABEL_38;
    }
    if ((unsigned __int16)v15 == 4)
    {
      uint64_t v11 = 1;
      goto LABEL_39;
    }
    if ((unsigned __int16)v15 == 12) {
      goto LABEL_49;
    }
    if ((unsigned __int16)v15 != 5) {
      goto LABEL_38;
    }
    uint64_t v11 = 0;
LABEL_39:
    sub_26086A028(v19, v11);

    v4 += 16;
    if (!--v3)
    {
      swift_bridgeObjectRelease();
      return;
    }
  }
  sub_26083D264((uint64_t)v19);
LABEL_52:
  sub_26087B990();
  __break(1u);
}

uint64_t HIDReportDispatcher.deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t HIDReportDispatcher.__deallocating_deinit()
{
  HIDReportDispatcher.deinit();
  return MEMORY[0x270FA0228](v0, 64, 7);
}

uint64_t type metadata accessor for HIDReportDispatcher()
{
  return self;
}

uint64_t method lookup function for HIDReportDispatcher(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HIDReportDispatcher);
}

uint64_t dispatch thunk of HIDReportDispatcher.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t sub_260869E60()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_260869E88()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_260869EC0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_260869EE8(uint64_t result, uint64_t a2, void *a3)
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

uint64_t sub_260869F08(unsigned __int8 *a1, unsigned __int8 a2)
{
  uint64_t v5 = *v2;
  sub_26087BCA0();
  sub_26087BCC0();
  uint64_t v6 = sub_26087BD00();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v2;
    uint64_t *v2 = 0x8000000000000000;
    sub_26086A938(a2, v8, isUniquelyReferenced_nonNull_native);
    uint64_t *v2 = v13;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  if (*(unsigned __int8 *)(v9 + v8) != a2)
  {
    uint64_t v10 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v10;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(unsigned __int8 *)(v9 + v8) != a2);
  }
  uint64_t result = 0;
  a2 = *(unsigned char *)(*(void *)(*v2 + 48) + v8);
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_26086A028(unsigned char *a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_26087BCA0();
  sub_26087BCB0();
  uint64_t v6 = sub_26087BD00();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v2;
    uint64_t *v2 = 0x8000000000000000;
    sub_26086AA88(a2, v8, isUniquelyReferenced_nonNull_native);
    uint64_t *v2 = v13;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  if (*(unsigned __int8 *)(v9 + v8) != a2)
  {
    uint64_t v10 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v10;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(unsigned __int8 *)(v9 + v8) != a2);
  }
  uint64_t result = 0;
  LOBYTE(a2) = *(unsigned char *)(*(void *)(*v2 + 48) + v8);
LABEL_8:
  *a1 = a2;
  return result;
}

void sub_26086A148()
{
  type metadata accessor for EventReportSenderID();
  OUTLINED_FUNCTION_10_2();
  uint64_t v31 = v1;
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_9_0();
  uint64_t v5 = v4 - v3;
  uint64_t v6 = (void *)*v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B56B0);
  uint64_t v7 = OUTLINED_FUNCTION_9_22();
  if (v6[2])
  {
    OUTLINED_FUNCTION_14_14();
    unint64_t v30 = v6 + 7;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v6[7];
    OUTLINED_FUNCTION_12_17();
    uint64_t v29 = v11;
    uint64_t v12 = v7 + 56;
    swift_retain();
    uint64_t v13 = 0;
    if (!v10) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v14 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v13 << 6))
    {
      uint64_t v19 = *(void *)(v31 + 72);
      sub_2607F6BDC(v6[6] + v19 * i, v5);
      sub_26087BCA0();
      sub_26087B0F0();
      sub_260869324(&qword_26A8B4750, MEMORY[0x263F07508]);
      sub_26087B220();
      sub_26087BCF0();
      unint64_t v20 = sub_26087BD00() & ~(-1 << *(unsigned char *)(v7 + 32));
      if (((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6))) == 0)
      {
        OUTLINED_FUNCTION_2_40();
        while (1)
        {
          OUTLINED_FUNCTION_15_15();
          if (v25)
          {
            if (v22) {
              break;
            }
          }
          if (v23 == v24) {
            uint64_t v23 = 0;
          }
          if (*(void *)(v12 + 8 * v23) != -1)
          {
            OUTLINED_FUNCTION_1_39();
            goto LABEL_31;
          }
        }
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_3_33();
LABEL_31:
      *(void *)(v12 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
      sub_2607F6BDC(v5, *(void *)(v7 + 48) + v21 * v19);
      ++*(void *)(v7 + 16);
      if (v10) {
        goto LABEL_6;
      }
LABEL_7:
      uint64_t v16 = v13 + 1;
      if (__OFADD__(v13, 1)) {
        goto LABEL_39;
      }
      if (v16 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = v30[v16];
      ++v13;
      if (!v17)
      {
        uint64_t v13 = v16 + 1;
        if (v16 + 1 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v13];
        if (!v17)
        {
          uint64_t v13 = v16 + 2;
          if (v16 + 2 >= v29) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v13];
          if (!v17)
          {
            uint64_t v18 = v16 + 3;
            if (v18 >= v29)
            {
LABEL_33:
              swift_release();
              OUTLINED_FUNCTION_16_15();
              if (v27 ^ v28 | v25) {
                *unint64_t v30 = -1 << v26;
              }
              else {
                sub_260869EE8(0, (unint64_t)(v26 + 63) >> 6, v30);
              }
              _OWORD v6[2] = 0;
              break;
            }
            unint64_t v17 = v30[v18];
            if (!v17)
            {
              while (1)
              {
                uint64_t v13 = v18 + 1;
                if (__OFADD__(v18, 1)) {
                  goto LABEL_40;
                }
                if (v13 >= v29) {
                  goto LABEL_33;
                }
                unint64_t v17 = v30[v13];
                ++v18;
                if (v17) {
                  goto LABEL_20;
                }
              }
            }
            uint64_t v13 = v18;
          }
        }
      }
LABEL_20:
      unint64_t v10 = (v17 - 1) & v17;
    }
  }
  swift_release();
  *uint64_t v0 = v7;
}

void sub_26086A49C()
{
  uint64_t v3 = v0;
  uint64_t v4 = (void *)*v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B56A8);
  uint64_t v5 = OUTLINED_FUNCTION_9_22();
  if (v4[2])
  {
    uint64_t v6 = 0;
    uint64_t v7 = v4 + 7;
    OUTLINED_FUNCTION_5_22();
    if (!v1) {
      goto LABEL_4;
    }
LABEL_3:
    OUTLINED_FUNCTION_11_16();
    while (1)
    {
      char v11 = *(unsigned char *)(v4[6] + v8);
      sub_26087BCA0();
      sub_26087BCC0();
      sub_26087BD00();
      OUTLINED_FUNCTION_7_23();
      if (v12)
      {
        OUTLINED_FUNCTION_2_40();
        while (1)
        {
          OUTLINED_FUNCTION_15_15();
          if (v12)
          {
            if (v14) {
              break;
            }
          }
          if (v15 == v16) {
            uint64_t v15 = 0;
          }
          if (*(void *)(v5 + 56 + 8 * v15) != -1)
          {
            OUTLINED_FUNCTION_1_39();
            goto LABEL_28;
          }
        }
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_3_33();
LABEL_28:
      OUTLINED_FUNCTION_6_27(v13);
      *(unsigned char *)(*(void *)(v5 + 48) + v17) = v11;
      ++*(void *)(v5 + 16);
      if (v1) {
        goto LABEL_3;
      }
LABEL_4:
      uint64_t v9 = v6 + 1;
      if (__OFADD__(v6, 1)) {
        goto LABEL_36;
      }
      if (v9 >= v2) {
        goto LABEL_30;
      }
      ++v6;
      if (!v7[v9])
      {
        uint64_t v6 = v9 + 1;
        if (v9 + 1 >= v2) {
          goto LABEL_30;
        }
        if (!v7[v6])
        {
          uint64_t v6 = v9 + 2;
          if (v9 + 2 >= v2) {
            goto LABEL_30;
          }
          if (!v7[v6])
          {
            uint64_t v10 = v9 + 3;
            if (v10 >= v2)
            {
LABEL_30:
              OUTLINED_FUNCTION_16_15();
              if (v19 ^ v20 | v12) {
                *uint64_t v7 = -1 << v18;
              }
              else {
                sub_260869EE8(0, (unint64_t)(v18 + 63) >> 6, v4 + 7);
              }
              uint64_t v3 = v0;
              v4[2] = 0;
              break;
            }
            if (!v7[v10])
            {
              while (1)
              {
                uint64_t v6 = v10 + 1;
                if (__OFADD__(v10, 1)) {
                  goto LABEL_37;
                }
                if (v6 >= v2) {
                  goto LABEL_30;
                }
                ++v10;
                if (v7[v6]) {
                  goto LABEL_17;
                }
              }
            }
            uint64_t v6 = v10;
          }
        }
      }
LABEL_17:
      OUTLINED_FUNCTION_8_25();
    }
  }
  swift_release();
  *uint64_t v3 = v5;
}

uint64_t sub_26086A690()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B56A0);
  uint64_t result = sub_26087B7D0();
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
    if (!v9) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v12 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    for (unint64_t i = v12 | (v5 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v5 << 6))
    {
      char v17 = *(unsigned char *)(*(void *)(v2 + 48) + i);
      sub_26087BCA0();
      sub_26087BCB0();
      uint64_t result = sub_26087BD00();
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
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      unint64_t v21 = __clz(__rbit64((-1 << v19) & ~*(void *)(v11 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v11 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
      *(unsigned char *)(*(void *)(v4 + 48) + v21) = v17;
      ++*(void *)(v4 + 16);
      if (v9) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v14 = v5 + 1;
      if (__OFADD__(v5, 1)) {
        goto LABEL_38;
      }
      if (v14 >= v10) {
        goto LABEL_32;
      }
      unint64_t v15 = v6[v14];
      ++v5;
      if (!v15)
      {
        int64_t v5 = v14 + 1;
        if (v14 + 1 >= v10) {
          goto LABEL_32;
        }
        unint64_t v15 = v6[v5];
        if (!v15)
        {
          int64_t v5 = v14 + 2;
          if (v14 + 2 >= v10) {
            goto LABEL_32;
          }
          unint64_t v15 = v6[v5];
          if (!v15)
          {
            int64_t v16 = v14 + 3;
            if (v16 >= v10)
            {
LABEL_32:
              uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
              if (v26 > 63) {
                sub_260869EE8(0, (unint64_t)(v26 + 63) >> 6, (void *)(v2 + 56));
              }
              else {
                *uint64_t v6 = -1 << v26;
              }
              uint64_t v1 = v0;
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v15 = v6[v16];
            if (!v15)
            {
              while (1)
              {
                int64_t v5 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_39;
                }
                if (v5 >= v10) {
                  goto LABEL_32;
                }
                unint64_t v15 = v6[v5];
                ++v16;
                if (v15) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v5 = v16;
          }
        }
      }
LABEL_20:
      unint64_t v9 = (v15 - 1) & v15;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

void sub_26086A938(unsigned __int8 a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_26086A49C();
  }
  else
  {
    if (v7 > v6)
    {
      sub_26086AE00();
      goto LABEL_14;
    }
    sub_26086B440();
  }
  uint64_t v8 = *v3;
  sub_26087BCA0();
  sub_26087BCC0();
  uint64_t v9 = sub_26087BD00();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v11 = *(void *)(v8 + 48);
    if (*(unsigned __int8 *)(v11 + a2) == a1)
    {
LABEL_13:
      sub_26087BC20();
      __break(1u);
    }
    else
    {
      uint64_t v12 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v12;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        if (*(unsigned __int8 *)(v11 + a2) == a1) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v13 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(unsigned char *)(*(void *)(v13 + 48) + a2) = a1;
  uint64_t v14 = *(void *)(v13 + 16);
  BOOL v15 = __OFADD__(v14, 1);
  uint64_t v16 = v14 + 1;
  if (v15) {
    __break(1u);
  }
  else {
    *(void *)(v13 + 16) = v16;
  }
}

uint64_t sub_26086AA88(uint64_t result, unint64_t a2, char a3)
{
  int v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_26086A690();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_26086AF8C();
      goto LABEL_14;
    }
    sub_26086B610();
  }
  uint64_t v8 = *v3;
  sub_26087BCA0();
  sub_26087BCB0();
  uint64_t result = sub_26087BD00();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(unsigned __int8 *)(v10 + a2) == v5)
    {
LABEL_13:
      uint64_t result = sub_26087BC20();
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
        if (*(unsigned __int8 *)(v10 + a2) == v5) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(unsigned char *)(*(void *)(v12 + 48) + a2) = v5;
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

void sub_26086ABD8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for EventReportSenderID();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  OUTLINED_FUNCTION_9_0();
  uint64_t v6 = v5 - v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B56B0);
  unint64_t v7 = (void *)*v0;
  uint64_t v8 = sub_26087B7C0();
  if (!v7[2])
  {
LABEL_28:
    swift_release();
    *uint64_t v1 = v8;
    return;
  }
  OUTLINED_FUNCTION_14_14();
  uint64_t v9 = v7 + 7;
  OUTLINED_FUNCTION_12_17();
  if ((void *)v8 != v7 || v10 >= &v7[v11 + 7]) {
    memmove(v10, v7 + 7, 8 * v11);
  }
  int64_t v13 = 0;
  *(void *)(v8 + 16) = v7[2];
  OUTLINED_FUNCTION_14_14();
  uint64_t v15 = v7[7];
  uint64_t v16 = -1;
  if (v14 < 64) {
    uint64_t v16 = ~(-1 << v14);
  }
  unint64_t v17 = v16 & v15;
  int64_t v18 = (unint64_t)(v14 + 63) >> 6;
  if ((v16 & v15) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v19 = __clz(__rbit64(v17));
  v17 &= v17 - 1;
  for (unint64_t i = v19 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v22)) + (v13 << 6))
  {
    unint64_t v24 = *(void *)(v3 + 72) * i;
    sub_2607F6B78(v7[6] + v24, v6);
    sub_2607F6BDC(v6, *(void *)(v8 + 48) + v24);
    if (v17) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v21 >= v18) {
      goto LABEL_28;
    }
    unint64_t v22 = v9[v21];
    ++v13;
    if (!v22)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v18) {
        goto LABEL_28;
      }
      unint64_t v22 = v9[v13];
      if (!v22)
      {
        int64_t v13 = v21 + 2;
        if (v21 + 2 >= v18) {
          goto LABEL_28;
        }
        unint64_t v22 = v9[v13];
        if (!v22) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v17 = (v22 - 1) & v22;
  }
  int64_t v23 = v21 + 3;
  if (v23 >= v18) {
    goto LABEL_28;
  }
  unint64_t v22 = v9[v23];
  if (v22)
  {
    int64_t v13 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v13 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v13 >= v18) {
      goto LABEL_28;
    }
    unint64_t v22 = v9[v13];
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
}

void sub_26086AE00()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B56A8);
  uint64_t v2 = (void *)*v0;
  uint64_t v3 = sub_26087B7C0();
  if (!v2[2])
  {
LABEL_26:
    swift_release();
    *uint64_t v1 = v3;
    return;
  }
  OUTLINED_FUNCTION_14_14();
  uint64_t v4 = v2 + 7;
  OUTLINED_FUNCTION_12_17();
  if ((void *)v3 != v2 || v5 >= &v2[v6 + 7]) {
    memmove(v5, v2 + 7, 8 * v6);
  }
  *(void *)(v3 + 16) = v2[2];
  OUTLINED_FUNCTION_12_17();
  if (!v10) {
    goto LABEL_10;
  }
LABEL_9:
  unint64_t v11 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v11 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v9 << 6))
  {
    *(unsigned char *)(*(void *)(v3 + 48) + i) = *(unsigned char *)(v2[6] + i);
    if (v10) {
      goto LABEL_9;
    }
LABEL_10:
    uint64_t v13 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v13 >= v8) {
      goto LABEL_26;
    }
    unint64_t v14 = v4[v13];
    ++v9;
    if (!v14)
    {
      uint64_t v9 = v13 + 1;
      if (v13 + 1 >= v8) {
        goto LABEL_26;
      }
      unint64_t v14 = v4[v9];
      if (!v14)
      {
        uint64_t v9 = v13 + 2;
        if (v13 + 2 >= v8) {
          goto LABEL_26;
        }
        unint64_t v14 = v4[v9];
        if (!v14) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v14 - 1) & v14;
  }
  uint64_t v15 = v13 + 3;
  if (v15 >= v8) {
    goto LABEL_26;
  }
  unint64_t v14 = v4[v15];
  if (v14)
  {
    uint64_t v9 = v15;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v9 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v9 >= v8) {
      goto LABEL_26;
    }
    unint64_t v14 = v4[v9];
    ++v15;
    if (v14) {
      goto LABEL_23;
    }
  }
LABEL_28:
  __break(1u);
}

void *sub_26086AF8C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B56A0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_26087B7C0();
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
  if (!v12) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v14 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (unint64_t i = v14 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v9 << 6))
  {
    *(unsigned char *)(*(void *)(v4 + 48) + i) = *(unsigned char *)(*(void *)(v2 + 48) + i);
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

void sub_26086B124()
{
  uint64_t v2 = v0;
  type metadata accessor for EventReportSenderID();
  OUTLINED_FUNCTION_10_2();
  uint64_t v27 = v3;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_13_14();
  uint64_t v5 = (void *)*v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B56B0);
  uint64_t v6 = OUTLINED_FUNCTION_10_20();
  if (!v5[2])
  {
    swift_release();
LABEL_35:
    uint64_t *v2 = v6;
    return;
  }
  OUTLINED_FUNCTION_14_14();
  uint64_t v25 = v5 + 7;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & v5[7];
  OUTLINED_FUNCTION_12_17();
  uint64_t v26 = v10;
  uint64_t v11 = v6 + 56;
  swift_retain();
  uint64_t v12 = 0;
  if (!v9) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v13 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  for (unint64_t i = v13 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v12 << 6))
  {
    uint64_t v18 = *(void *)(v27 + 72);
    sub_2607F6B78(v5[6] + v18 * i, v1);
    sub_26087BCA0();
    sub_26087B0F0();
    sub_260869324(&qword_26A8B4750, MEMORY[0x263F07508]);
    sub_26087B220();
    sub_26087BCF0();
    unint64_t v19 = sub_26087BD00() & ~(-1 << *(unsigned char *)(v6 + 32));
    if (((-1 << v19) & ~*(void *)(v11 + 8 * (v19 >> 6))) == 0)
    {
      OUTLINED_FUNCTION_2_40();
      while (1)
      {
        OUTLINED_FUNCTION_15_15();
        if (v24)
        {
          if (v21) {
            break;
          }
        }
        if (v22 == v23) {
          uint64_t v22 = 0;
        }
        if (*(void *)(v11 + 8 * v22) != -1)
        {
          OUTLINED_FUNCTION_1_39();
          goto LABEL_31;
        }
      }
      __break(1u);
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }
    OUTLINED_FUNCTION_3_33();
LABEL_31:
    *(void *)(v11 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    sub_2607F6BDC(v1, *(void *)(v6 + 48) + v20 * v18);
    ++*(void *)(v6 + 16);
    if (v9) {
      goto LABEL_6;
    }
LABEL_7:
    uint64_t v15 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      goto LABEL_37;
    }
    if (v15 >= v26) {
      goto LABEL_33;
    }
    unint64_t v16 = v25[v15];
    ++v12;
    if (!v16)
    {
      uint64_t v12 = v15 + 1;
      if (v15 + 1 >= v26) {
        goto LABEL_33;
      }
      unint64_t v16 = v25[v12];
      if (!v16)
      {
        uint64_t v12 = v15 + 2;
        if (v15 + 2 >= v26) {
          goto LABEL_33;
        }
        unint64_t v16 = v25[v12];
        if (!v16) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v9 = (v16 - 1) & v16;
  }
  uint64_t v17 = v15 + 3;
  if (v17 >= v26)
  {
LABEL_33:
    swift_release_n();
    uint64_t v2 = v0;
    goto LABEL_35;
  }
  unint64_t v16 = v25[v17];
  if (v16)
  {
    uint64_t v12 = v17;
    goto LABEL_20;
  }
  while (1)
  {
    uint64_t v12 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v12 >= v26) {
      goto LABEL_33;
    }
    unint64_t v16 = v25[v12];
    ++v17;
    if (v16) {
      goto LABEL_20;
    }
  }
LABEL_38:
  __break(1u);
}

void sub_26086B440()
{
  uint64_t v3 = v0;
  uint64_t v4 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B56A8);
  uint64_t v5 = OUTLINED_FUNCTION_10_20();
  if (!*(void *)(v4 + 16))
  {
    swift_release();
LABEL_32:
    *uint64_t v3 = v5;
    return;
  }
  uint64_t v6 = 0;
  uint64_t v7 = v4 + 56;
  OUTLINED_FUNCTION_5_22();
  if (!v1) {
    goto LABEL_4;
  }
LABEL_3:
  OUTLINED_FUNCTION_11_16();
  while (1)
  {
    char v11 = *(unsigned char *)(*(void *)(v4 + 48) + v8);
    sub_26087BCA0();
    sub_26087BCC0();
    sub_26087BD00();
    OUTLINED_FUNCTION_7_23();
    if (v12)
    {
      OUTLINED_FUNCTION_2_40();
      while (1)
      {
        OUTLINED_FUNCTION_15_15();
        if (v12)
        {
          if (v14) {
            break;
          }
        }
        if (v15 == v16) {
          uint64_t v15 = 0;
        }
        if (*(void *)(v5 + 56 + 8 * v15) != -1)
        {
          OUTLINED_FUNCTION_1_39();
          goto LABEL_28;
        }
      }
      __break(1u);
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
    OUTLINED_FUNCTION_3_33();
LABEL_28:
    OUTLINED_FUNCTION_6_27(v13);
    *(unsigned char *)(*(void *)(v5 + 48) + v17) = v11;
    ++*(void *)(v5 + 16);
    if (v1) {
      goto LABEL_3;
    }
LABEL_4:
    uint64_t v9 = v6 + 1;
    if (__OFADD__(v6, 1)) {
      goto LABEL_34;
    }
    if (v9 >= v2) {
      goto LABEL_30;
    }
    ++v6;
    if (!*(void *)(v7 + 8 * v9))
    {
      uint64_t v6 = v9 + 1;
      if (v9 + 1 >= v2) {
        goto LABEL_30;
      }
      if (!*(void *)(v7 + 8 * v6))
      {
        uint64_t v6 = v9 + 2;
        if (v9 + 2 >= v2) {
          goto LABEL_30;
        }
        if (!*(void *)(v7 + 8 * v6)) {
          break;
        }
      }
    }
LABEL_17:
    OUTLINED_FUNCTION_8_25();
  }
  uint64_t v10 = v9 + 3;
  if (v10 >= v2)
  {
LABEL_30:
    swift_release();
    uint64_t v3 = v0;
    goto LABEL_32;
  }
  if (*(void *)(v7 + 8 * v10))
  {
    uint64_t v6 = v10;
    goto LABEL_17;
  }
  while (1)
  {
    uint64_t v6 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      break;
    }
    if (v6 >= v2) {
      goto LABEL_30;
    }
    ++v10;
    if (*(void *)(v7 + 8 * v6)) {
      goto LABEL_17;
    }
  }
LABEL_35:
  __break(1u);
}

uint64_t sub_26086B610()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B56A0);
  uint64_t result = sub_26087B7D0();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
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
  if (!v9) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v12 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  for (unint64_t i = v12 | (v5 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v5 << 6))
  {
    char v17 = *(unsigned char *)(*(void *)(v2 + 48) + i);
    sub_26087BCA0();
    sub_26087BCB0();
    uint64_t result = sub_26087BD00();
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
    *(unsigned char *)(*(void *)(v4 + 48) + v21) = v17;
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
    uint64_t v1 = v0;
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

void OUTLINED_FUNCTION_6_27(unint64_t a1@<X8>)
{
  *(void *)(v1 + ((a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << a1;
}

uint64_t OUTLINED_FUNCTION_9_22()
{
  return sub_26087B7D0();
}

uint64_t OUTLINED_FUNCTION_10_20()
{
  return sub_26087B7D0();
}

id OUTLINED_FUNCTION_17_12(uint64_t a1, const char *a2)
{
  return objc_msgSend(v3, a2, v2);
}

uint64_t static ZoomToggleEvent.eventType.getter()
{
  return 22;
}

uint64_t ZoomToggleEvent.init(time:flags:)()
{
  return IOHIDEventCreateZoomToggleEvent();
}

ValueMetadata *type metadata accessor for ZoomToggleEvent()
{
  return &type metadata for ZoomToggleEvent;
}

uint64_t dispatch thunk of GestureProtocol.dispatch(report:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t HIDEventPhase.description.getter(unsigned __int8 a1)
{
  uint64_t v1 = qword_270C9E3E8;
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (qword_270C9E3E8)
  {
    int v3 = a1;
    uint64_t v4 = MEMORY[0x263F8EE78];
    int64_t v5 = &byte_270C9E3F8;
    do
    {
      int v7 = *v5++;
      char v6 = v7;
      if ((v7 & v3) != 0)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_2607E9930();
        }
        unint64_t v8 = *(void *)(v4 + 16);
        if (v8 >= *(void *)(v4 + 24) >> 1) {
          sub_2607E9930();
        }
        *(void *)(v4 + 16) = v8 + 1;
        *(unsigned char *)(v4 + v8 + 32) = v6;
      }
      --v1;
    }
    while (v1);
  }
  else
  {
    uint64_t v4 = MEMORY[0x263F8EE78];
  }
  uint64_t v9 = *(void *)(v4 + 16);
  if (v9)
  {
    sub_2607E9890(0, v9, 0);
    uint64_t v10 = 0;
    uint64_t v11 = v2;
    do
    {
      if (*(unsigned char *)(v4 + v10 + 32))
      {
        unint64_t v14 = 0xE500000000000000;
        uint64_t v12 = 0x6E61676562;
      }
      else if ((*(unsigned char *)(v4 + v10 + 32) & 2) != 0)
      {
        unint64_t v14 = 0xE700000000000000;
        uint64_t v12 = 0x6465676E616863;
      }
      else if ((*(unsigned char *)(v4 + v10 + 32) & 4) != 0)
      {
        unint64_t v14 = 0xE500000000000000;
        uint64_t v12 = 0x6465646E65;
      }
      else if ((*(unsigned char *)(v4 + v10 + 32) & 8) != 0)
      {
        unint64_t v14 = 0xE800000000000000;
        uint64_t v12 = 0x64656C65636E6163;
      }
      else if ((*(unsigned char *)(v4 + v10 + 32) & 0x80) != 0)
      {
        unint64_t v14 = 0xE800000000000000;
        uint64_t v12 = 0x6E6967654279616DLL;
      }
      else
      {
        uint64_t v12 = sub_26087BBA0();
        unint64_t v14 = v13;
      }
      unint64_t v16 = *(void *)(v11 + 16);
      unint64_t v15 = *(void *)(v11 + 24);
      if (v16 >= v15 >> 1) {
        sub_2607E9890(v15 > 1, v16 + 1, 1);
      }
      ++v10;
      *(void *)(v11 + 16) = v16 + 1;
      uint64_t v17 = v11 + 16 * v16;
      *(void *)(v17 + 32) = v12;
      *(void *)(v17 + 40) = v14;
    }
    while (v9 != v10);
  }
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B4668);
  sub_2607E9A5C((unint64_t *)&qword_26A8B4670, &qword_26A8B4668);
  uint64_t v18 = sub_26087B230();
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t HIDEventPhase.init(_:)(uint64_t result)
{
  if ((unsigned __int16)result >= 0x100u)
  {
    OUTLINED_FUNCTION_27();
    uint64_t result = sub_26087B980();
    __break(1u);
  }
  return result;
}

uint64_t HIDEventPhase.rawValue.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*HIDEventPhase.rawValue.modify())()
{
  return nullsub_1;
}

void *static HIDEventPhase.allCases.getter()
{
  return &unk_270C9E3D8;
}

unint64_t HIDEventPhase.init(rawValue:)(unint64_t result)
{
  if ((result & 0x8000000000000000) != 0 || result >= 0x100)
  {
    OUTLINED_FUNCTION_27();
    uint64_t result = sub_26087B980();
    __break(1u);
  }
  return result;
}

uint64_t static HIDEventPhase.began.getter()
{
  return 1;
}

uint64_t static HIDEventPhase.changed.getter()
{
  return 2;
}

uint64_t static HIDEventPhase.ended.getter()
{
  return 4;
}

uint64_t static HIDEventPhase.canceled.getter()
{
  return 8;
}

uint64_t static HIDEventPhase.mayBegin.getter()
{
  return 128;
}

void sub_26086BEB8(void *a1@<X8>)
{
  *a1 = &unk_270C9E3D8;
}

BOOL sub_26086BEC8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_26082C554(a1, *a2);
}

void sub_26086BED0(char *a1)
{
}

void sub_26086BED8(char *a1)
{
}

void sub_26086BEE0(char *a1)
{
}

uint64_t sub_26086BEE8@<X0>(unsigned __int8 *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_260875E18(*a1, *v2);
  *a2 = result;
  return result;
}

BOOL sub_26086BF18(char *a1)
{
  return sub_26082C6A4(*a1, *v1);
}

BOOL sub_26086BF24(unsigned __int8 *a1)
{
  return sub_26087629C(*a1, *v1);
}

BOOL sub_26086BF30(unsigned __int8 *a1)
{
  return sub_26082C858(*a1, *v1);
}

void sub_26086BF3C(char *a1)
{
}

uint64_t sub_26086BF44()
{
  return HIDEventPhase.description.getter(*v0);
}

unint64_t sub_26086BF50()
{
  unint64_t result = qword_26A8B56B8;
  if (!qword_26A8B56B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B56B8);
  }
  return result;
}

unint64_t sub_26086BFA0()
{
  unint64_t result = qword_26A8B56C0;
  if (!qword_26A8B56C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B56C0);
  }
  return result;
}

uint64_t sub_26086BFEC()
{
  return sub_2607E9A5C(&qword_26A8B56C8, &qword_26A8B56D0);
}

unint64_t sub_26086C02C()
{
  unint64_t result = qword_26A8B56D8;
  if (!qword_26A8B56D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B56D8);
  }
  return result;
}

unint64_t sub_26086C07C()
{
  unint64_t result = qword_26A8B56E0;
  if (!qword_26A8B56E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B56E0);
  }
  return result;
}

ValueMetadata *type metadata accessor for HIDEventPhase()
{
  return &type metadata for HIDEventPhase;
}

BOOL sub_26086C0D8(unint64_t a1, unint64_t a2)
{
  return a2 >= a1;
}

BOOL sub_26086C0E4(unsigned int a1, unsigned int a2)
{
  return (unsigned __int16)a1 < (unsigned __int16)a2 || HIWORD(a2) >= HIWORD(a1);
}

BOOL sub_26086C100(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  switch(a4 >> 62)
  {
    case 1uLL:
      if (a3 >> 32 < (int)a3)
      {
        __break(1u);
        JUMPOUT(0x26086C238);
      }
      OUTLINED_FUNCTION_3_34();
      sub_2607DCED0(a3, a4);
      char v10 = OUTLINED_FUNCTION_4_24((int)a3, a3 >> 32, a4 & 0x3FFFFFFFFFFFFFFFLL);
      sub_2607DCF28(a3, a4);
      break;
    case 2uLL:
      uint64_t v11 = a4 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v12 = *(void *)(a3 + 16);
      uint64_t v13 = *(void *)(a3 + 24);
      OUTLINED_FUNCTION_3_34();
      swift_retain();
      swift_retain();
      char v10 = OUTLINED_FUNCTION_4_24(v12, v13, v11);
      swift_release();
      swift_release();
      break;
    case 3uLL:
      OUTLINED_FUNCTION_3_34();
      uint64_t v9 = 0;
      uint64_t v8 = 0;
      goto LABEL_7;
    default:
      OUTLINED_FUNCTION_3_34();
      uint64_t v8 = a4 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v9 = a3;
LABEL_7:
      char v10 = sub_260840900(v9, v8, a1, a2);
      break;
  }
  return (v10 & 1) == 0;
}

BOOL sub_26086C248(unint64_t a1, unint64_t a2)
{
  return a1 >= a2;
}

BOOL sub_26086C254(unsigned int a1, unsigned int a2)
{
  return (unsigned __int16)a2 < (unsigned __int16)a1 || HIWORD(a1) >= HIWORD(a2);
}

BOOL sub_26086C270(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1)
      {
        __break(1u);
        JUMPOUT(0x26086C3C0);
      }
      OUTLINED_FUNCTION_2_24();
      sub_2607DCED0(a1, a2);
      char v10 = sub_26084077C((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
      sub_2607DCF28(a1, a2);
      break;
    case 2uLL:
      uint64_t v11 = a2 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v12 = *(void *)(a1 + 16);
      uint64_t v13 = *(void *)(a1 + 24);
      OUTLINED_FUNCTION_2_24();
      swift_retain();
      swift_retain();
      char v10 = sub_26084077C(v12, v13, v11, a3, a4);
      swift_release();
      swift_release();
      break;
    case 3uLL:
      OUTLINED_FUNCTION_2_24();
      uint64_t v9 = 0;
      uint64_t v8 = 0;
      goto LABEL_7;
    default:
      OUTLINED_FUNCTION_2_24();
      uint64_t v8 = a2 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v9 = a1;
LABEL_7:
      char v10 = sub_260840900(v9, v8, a3, a4);
      break;
  }
  return (v10 & 1) == 0;
}

uint64_t sub_26086C3D0(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  switch(a4 >> 62)
  {
    case 1uLL:
      if (a3 >> 32 < (int)a3)
      {
        __break(1u);
        JUMPOUT(0x26086C504);
      }
      OUTLINED_FUNCTION_3_34();
      sub_2607DCED0(a3, a4);
      char v10 = OUTLINED_FUNCTION_4_24((int)a3, a3 >> 32, a4 & 0x3FFFFFFFFFFFFFFFLL);
      sub_2607DCF28(a3, a4);
      break;
    case 2uLL:
      uint64_t v11 = a4 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v12 = *(void *)(a3 + 16);
      uint64_t v13 = *(void *)(a3 + 24);
      OUTLINED_FUNCTION_3_34();
      swift_retain();
      swift_retain();
      char v10 = OUTLINED_FUNCTION_4_24(v12, v13, v11);
      swift_release();
      swift_release();
      break;
    case 3uLL:
      OUTLINED_FUNCTION_3_34();
      uint64_t v9 = 0;
      uint64_t v8 = 0;
      goto LABEL_7;
    default:
      OUTLINED_FUNCTION_3_34();
      uint64_t v8 = a4 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v9 = a3;
LABEL_7:
      char v10 = sub_260840900(v9, v8, a1, a2);
      break;
  }
  return v10 & 1;
}

BOOL sub_26086C514(unsigned int a1, unsigned int a2)
{
  return (unsigned __int16)a1 >= (unsigned __int16)a2 && HIWORD(a2) < HIWORD(a1);
}

BOOL sub_26086C530(unint64_t a1, unint64_t a2)
{
  return a2 < a1;
}

uint64_t static HIDTime.never()()
{
  return -1;
}

float sub_26086C550()
{
  v2[1] = *(mach_timebase_info *)MEMORY[0x263EF8340];
  v2[0] = 0;
  mach_timebase_info(v2);
  *(void *)&long long v0 = v2[0].numer;
  *((void *)&v0 + 1) = v2[0].denom;
  float result = *(float *)&v2[0].numer;
  xmmword_26A8B56E8 = v0;
  return result;
}

uint64_t static HIDTime.timebase.getter()
{
  if (qword_26A8B4568 != -1) {
    swift_once();
  }
  return xmmword_26A8B56E8;
}

void HIDTime.init(nanoseconds:)(double a1)
{
  if (qword_26A8B4568 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_38((double)*((unint64_t *)&xmmword_26A8B56E8 + 1) * a1, (double)(unint64_t)xmmword_26A8B56E8);
  if (v2)
  {
    OUTLINED_FUNCTION_2_41();
    if (v3)
    {
      __break(1u);
    }
    else
    {
      OUTLINED_FUNCTION_5_23();
      if (!(v2 ^ v4 | v3)) {
        return;
      }
    }
    __break(1u);
  }
}

void HIDTime.init(nanoseconds:)(unint64_t a1)
{
  double v1 = (double)a1;
  if (qword_26A8B4568 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_38(v1 * (double)*((unint64_t *)&xmmword_26A8B56E8 + 1), (double)(unint64_t)xmmword_26A8B56E8);
  if (v2)
  {
    OUTLINED_FUNCTION_2_41();
    if (v3)
    {
      __break(1u);
    }
    else
    {
      OUTLINED_FUNCTION_5_23();
      if (!(v2 ^ v4 | v3)) {
        return;
      }
    }
    __break(1u);
  }
}

void HIDTime.nanoseconds.getter(unint64_t a1)
{
  if (qword_26A8B4568 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_38((double)a1 * (double)(unint64_t)xmmword_26A8B56E8, (double)*((unint64_t *)&xmmword_26A8B56E8 + 1));
  if (v2)
  {
    OUTLINED_FUNCTION_2_41();
    if (v3)
    {
      __break(1u);
    }
    else
    {
      OUTLINED_FUNCTION_5_23();
      if (!(v2 ^ v4 | v3)) {
        return;
      }
    }
    __break(1u);
  }
}

void HIDTime.init(seconds:)(double a1)
{
  double v1 = a1 * 1000000000.0;
  if (qword_26A8B4568 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_38(v1 * (double)*((unint64_t *)&xmmword_26A8B56E8 + 1), (double)(unint64_t)xmmword_26A8B56E8);
  if (v2)
  {
    OUTLINED_FUNCTION_2_41();
    if (v3)
    {
      __break(1u);
    }
    else
    {
      OUTLINED_FUNCTION_5_23();
      if (!(v2 ^ v4 | v3)) {
        return;
      }
    }
    __break(1u);
  }
}

void HIDTime.seconds.getter(unint64_t a1)
{
  if (qword_26A8B4568 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_38((double)a1 * (double)(unint64_t)xmmword_26A8B56E8, (double)*((unint64_t *)&xmmword_26A8B56E8 + 1));
  if (v2)
  {
    OUTLINED_FUNCTION_2_41();
    if (v3)
    {
      __break(1u);
    }
    else
    {
      OUTLINED_FUNCTION_5_23();
      if (!(v2 ^ v4 | v3)) {
        return;
      }
    }
    __break(1u);
  }
}

uint64_t sub_26086C910()
{
  return sub_26087BCB0();
}

uint64_t sub_26086C938(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x65756C6156776172 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_26087BBE0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_26086C9C0()
{
  return sub_26087BD00();
}

uint64_t sub_26086CA04()
{
  return 0x65756C6156776172;
}

uint64_t sub_26086CA24()
{
  return sub_26087BD00();
}

uint64_t sub_26086CA68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_26086C938(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_26086CA94(uint64_t a1)
{
  unint64_t v2 = sub_26086CED4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_26086CAD0(uint64_t a1)
{
  unint64_t v2 = sub_26086CED4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t static HIDTime.+ infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (__CFADD__(a1, a2)) {
    return -1;
  }
  else {
    return a1 + a2;
  }
}

void static HIDTime.+ infix(_:_:)(unint64_t a1, double a2)
{
  HIDTime.nanoseconds.getter(a1);
  HIDTime.init(nanoseconds:)(((double)v3 * 0.000000001 + a2) * 1000000000.0);
}

unint64_t static HIDTime.- infix(_:_:)(unint64_t a1, unint64_t a2)
{
  if (a1 >= a2) {
    return a1 - a2;
  }
  else {
    return 0;
  }
}

void static HIDTime.- infix(_:_:)(unint64_t a1, double a2)
{
  if (qword_26A8B4568 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_38((double)a1 * (double)(unint64_t)xmmword_26A8B56E8, (double)*((unint64_t *)&xmmword_26A8B56E8 + 1));
  if (!v4)
  {
    double v8 = 1.84467441e10;
    goto LABEL_8;
  }
  OUTLINED_FUNCTION_2_41();
  if (v5)
  {
    __break(1u);
    goto LABEL_14;
  }
  OUTLINED_FUNCTION_5_23();
  if (v4 ^ v7 | v5)
  {
LABEL_14:
    __break(1u);
    return;
  }
  double v8 = (double)(unint64_t)v6 * 0.000000001;
LABEL_8:
  if (v8 > a2)
  {
    double v9 = (v8 - a2) * 1000000000.0;
    HIDTime.init(nanoseconds:)(v9);
  }
}

BOOL static HIDTime.< infix(_:_:)(unint64_t a1, unint64_t a2)
{
  return a1 < a2;
}

BOOL static HIDTime.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

BOOL sub_26086CC84(unint64_t *a1, unint64_t *a2)
{
  return static HIDTime.< infix(_:_:)(*a1, *a2);
}

BOOL sub_26086CC90(unint64_t *a1, unint64_t *a2)
{
  return sub_26086C0D8(*a1, *a2);
}

BOOL sub_26086CC9C(unint64_t *a1, unint64_t *a2)
{
  return sub_26086C248(*a1, *a2);
}

BOOL sub_26086CCA8(unint64_t *a1, unint64_t *a2)
{
  return sub_26086C530(*a1, *a2);
}

BOOL sub_26086CCB4(uint64_t *a1, uint64_t *a2)
{
  return static HIDTime.== infix(_:_:)(*a1, *a2);
}

uint64_t HIDTime.description.getter(unint64_t a1)
{
  return sub_26087BBA0();
}

uint64_t sub_26086CD04()
{
  return HIDTime.description.getter(*v0);
}

uint64_t HIDTime.hash(into:)()
{
  return sub_26087BCF0();
}

uint64_t HIDTime.hashValue.getter()
{
  return sub_26087BD00();
}

uint64_t sub_26086CD7C()
{
  return HIDTime.hashValue.getter();
}

uint64_t sub_26086CD84()
{
  return HIDTime.hash(into:)();
}

uint64_t sub_26086CD8C()
{
  return sub_26087BD00();
}

uint64_t HIDTime.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B56F8);
  OUTLINED_FUNCTION_10_2();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  char v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_26086CED4();
  sub_26087BD20();
  sub_26087BB80();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v2);
}

unint64_t sub_26086CED4()
{
  unint64_t result = qword_26A8B5700;
  if (!qword_26A8B5700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5700);
  }
  return result;
}

uint64_t HIDTime.init(from:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B5708);
  OUTLINED_FUNCTION_10_2();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  double v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (uint64_t)__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_26086CED4();
  sub_26087BD10();
  if (!v1)
  {
    uint64_t v9 = sub_26087BAD0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v3);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v9;
}

unint64_t sub_26086D04C()
{
  unint64_t result = qword_26A8B5710;
  if (!qword_26A8B5710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5710);
  }
  return result;
}

uint64_t sub_26086D098@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = HIDTime.init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_26086D0C4(void *a1)
{
  return HIDTime.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for HIDTime()
{
  return &type metadata for HIDTime;
}

uint64_t getEnumTagSinglePayload for HIDTime.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for HIDTime.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x26086D1E0);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for HIDTime.CodingKeys()
{
  return &type metadata for HIDTime.CodingKeys;
}

unint64_t sub_26086D21C()
{
  unint64_t result = qword_26A8B5718;
  if (!qword_26A8B5718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5718);
  }
  return result;
}

unint64_t sub_26086D26C()
{
  unint64_t result = qword_26A8B5720;
  if (!qword_26A8B5720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5720);
  }
  return result;
}

unint64_t sub_26086D2BC()
{
  unint64_t result = qword_26A8B5728;
  if (!qword_26A8B5728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5728);
  }
  return result;
}

double OUTLINED_FUNCTION_0_38(double a1, double a2)
{
  return round(a1 / a2);
}

uint64_t OUTLINED_FUNCTION_3_34()
{
  return sub_2607DCED0(v1, v0);
}

uint64_t OUTLINED_FUNCTION_4_24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_26084077C(a1, a2, a3, v4, v3);
}

uint64_t FluidTouchGestureEvent.init(time:swipeMask:gestureMotion:flavor:delta:progress:flags:)()
{
  uint64_t FluidTouchGestureEvent = IOHIDEventCreateFluidTouchGestureEvent();
  IOHIDEventSetIntegerValue();
  return FluidTouchGestureEvent;
}

double FluidTouchGestureEvent.delta.getter()
{
  OUTLINED_FUNCTION_10_21();
  IOHIDEventGetFloatValue();
  double v1 = v0;
  IOHIDEventGetFloatValue();
  return v1;
}

unint64_t FluidTouchGestureEvent.swipeMask.getter()
{
  unint64_t result = IOHIDEventGetIntegerValue();
  if ((result & 0x8000000000000000) != 0 || HIDWORD(result))
  {
    OUTLINED_FUNCTION_27();
    unint64_t result = sub_26087B980();
    __break(1u);
  }
  return result;
}

unint64_t FluidTouchGestureEvent.flavor.getter()
{
  return OUTLINED_FUNCTION_6_28();
}

uint64_t FluidTouchGestureEvent.progress.getter()
{
  return OUTLINED_FUNCTION_3_35();
}

unint64_t FluidTouchGestureEvent.gestureMotion.getter()
{
  return OUTLINED_FUNCTION_6_28();
}

uint64_t static FluidTouchGestureEvent.eventType.getter()
{
  return 27;
}

uint64_t FluidTouchGestureEvent.init(event:)(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v2 = OUTLINED_FUNCTION_8_2();
  if (v3(v2) == 27)
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    uint64_t v4 = OUTLINED_FUNCTION_8_2();
    uint64_t v6 = v5(v4);
  }
  else
  {
    uint64_t v6 = 0;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v6;
}

uint64_t FluidTouchGestureEvent.x.getter()
{
  return OUTLINED_FUNCTION_3_35();
}

uint64_t FluidTouchGestureEvent.x.setter()
{
  return OUTLINED_FUNCTION_0_39();
}

uint64_t (*FluidTouchGestureEvent.x.modify(uint64_t a1, uint64_t a2))()
{
  OUTLINED_FUNCTION_2_2(a1, a2);
  IOHIDEventGetFloatValue();
  void *v2 = v3;
  return sub_26086D5BC;
}

uint64_t sub_26086D5BC()
{
  return OUTLINED_FUNCTION_0_39();
}

uint64_t FluidTouchGestureEvent.y.getter()
{
  return OUTLINED_FUNCTION_3_35();
}

uint64_t FluidTouchGestureEvent.y.setter()
{
  return OUTLINED_FUNCTION_0_39();
}

uint64_t (*FluidTouchGestureEvent.y.modify(uint64_t a1, uint64_t a2))()
{
  OUTLINED_FUNCTION_2_2(a1, a2);
  IOHIDEventGetFloatValue();
  void *v2 = v3;
  return sub_26086D62C;
}

uint64_t sub_26086D62C()
{
  return OUTLINED_FUNCTION_0_39();
}

uint64_t FluidTouchGestureEvent.progress.setter()
{
  return OUTLINED_FUNCTION_0_39();
}

uint64_t (*FluidTouchGestureEvent.progress.modify(uint64_t a1, uint64_t a2))()
{
  OUTLINED_FUNCTION_2_2(a1, a2);
  IOHIDEventGetFloatValue();
  void *v2 = v3;
  return sub_26086D694;
}

uint64_t sub_26086D694()
{
  return OUTLINED_FUNCTION_0_39();
}

uint64_t FluidTouchGestureEvent.swipeMask.setter()
{
  return OUTLINED_FUNCTION_5_24();
}

uint64_t (*FluidTouchGestureEvent.swipeMask.modify(void *a1, uint64_t a2))()
{
  OUTLINED_FUNCTION_8_17(a1, a2);
  *(_DWORD *)(v2 + 8) = FluidTouchGestureEvent.swipeMask.getter();
  return sub_26086D6F8;
}

uint64_t sub_26086D6F8()
{
  return OUTLINED_FUNCTION_5_24();
}

uint64_t FluidTouchGestureEvent.gestureMotion.setter()
{
  return OUTLINED_FUNCTION_1_40();
}

uint64_t (*FluidTouchGestureEvent.gestureMotion.modify(void *a1, uint64_t a2))()
{
  OUTLINED_FUNCTION_8_17(a1, a2);
  *(_WORD *)(v2 + 8) = FluidTouchGestureEvent.gestureMotion.getter();
  return sub_26086D75C;
}

uint64_t sub_26086D75C()
{
  return OUTLINED_FUNCTION_1_40();
}

uint64_t FluidTouchGestureEvent.flavor.setter()
{
  return OUTLINED_FUNCTION_1_40();
}

uint64_t (*FluidTouchGestureEvent.flavor.modify(void *a1, uint64_t a2))()
{
  OUTLINED_FUNCTION_8_17(a1, a2);
  *(_WORD *)(v2 + 8) = FluidTouchGestureEvent.flavor.getter();
  return sub_26086D7C4;
}

uint64_t sub_26086D7C4()
{
  return OUTLINED_FUNCTION_1_40();
}

uint64_t sub_26086D7D8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = FluidTouchGestureEvent.init(event:)(a1);
  *a2 = result;
  return result;
}

void sub_26086D800(uint64_t a1@<X8>)
{
  *(double *)a1 = FluidTouchGestureEvent.delta.getter();
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = 0;
}

uint64_t sub_26086D830()
{
  return FluidTouchGestureEvent.delta.setter();
}

uint64_t FluidTouchGestureEvent.delta.setter()
{
  OUTLINED_FUNCTION_10_21();
  IOHIDEventSetFloatValue();
  return IOHIDEventSetFloatValue();
}

uint64_t (*FluidTouchGestureEvent.delta.modify(void *a1, uint64_t a2))()
{
  a1[3] = a2;
  IOHIDEventGetFloatValue();
  uint64_t v4 = v3;
  IOHIDEventGetFloatValue();
  *a1 = v4;
  a1[1] = v5;
  a1[2] = 0;
  return sub_26086D910;
}

uint64_t sub_26086D910()
{
  IOHIDEventSetFloatValue();
  return IOHIDEventSetFloatValue();
}

uint64_t sub_26086D970(uint64_t a1)
{
  OUTLINED_FUNCTION_3_3(a1);
  uint64_t result = FluidTouchGestureEvent.x.getter();
  *double v1 = v3;
  return result;
}

uint64_t sub_26086D998()
{
  return FluidTouchGestureEvent.x.setter();
}

uint64_t sub_26086D9A4(uint64_t a1)
{
  OUTLINED_FUNCTION_3_3(a1);
  uint64_t result = FluidTouchGestureEvent.y.getter();
  *double v1 = v3;
  return result;
}

uint64_t sub_26086D9CC()
{
  return FluidTouchGestureEvent.y.setter();
}

uint64_t sub_26086D9D8(uint64_t a1)
{
  OUTLINED_FUNCTION_3_3(a1);
  uint64_t result = FluidTouchGestureEvent.progress.getter();
  *double v1 = v3;
  return result;
}

uint64_t sub_26086DA00()
{
  return FluidTouchGestureEvent.progress.setter();
}

unint64_t sub_26086DA0C(uint64_t a1)
{
  OUTLINED_FUNCTION_3_3(a1);
  unint64_t result = FluidTouchGestureEvent.swipeMask.getter();
  *double v1 = result;
  return result;
}

uint64_t sub_26086DA34()
{
  return FluidTouchGestureEvent.swipeMask.setter();
}

unint64_t sub_26086DA40(uint64_t a1)
{
  OUTLINED_FUNCTION_3_3(a1);
  unint64_t result = FluidTouchGestureEvent.gestureMotion.getter();
  *double v1 = result;
  return result;
}

uint64_t sub_26086DA68()
{
  return FluidTouchGestureEvent.gestureMotion.setter();
}

unint64_t sub_26086DA74(uint64_t a1)
{
  OUTLINED_FUNCTION_3_3(a1);
  unint64_t result = FluidTouchGestureEvent.flavor.getter();
  *double v1 = result;
  return result;
}

uint64_t sub_26086DA9C()
{
  return FluidTouchGestureEvent.flavor.setter();
}

ValueMetadata *type metadata accessor for FluidTouchGestureEvent()
{
  return &type metadata for FluidTouchGestureEvent;
}

uint64_t OUTLINED_FUNCTION_0_39()
{
  return IOHIDEventSetFloatValue();
}

uint64_t OUTLINED_FUNCTION_1_40()
{
  return IOHIDEventSetIntegerValue();
}

uint64_t OUTLINED_FUNCTION_3_35()
{
  return IOHIDEventGetFloatValue();
}

uint64_t OUTLINED_FUNCTION_5_24()
{
  return IOHIDEventSetIntegerValue();
}

unint64_t OUTLINED_FUNCTION_6_28()
{
  return sub_260839474();
}

Swift::Void __swiftcall HIDEventSystemClient.canceled()()
{
  double v8 = nullsub_1;
  uint64_t v9 = 0;
  uint64_t v4 = MEMORY[0x263EF8330];
  uint64_t v5 = 1107296256;
  uint64_t v6 = sub_2608045D0;
  uint64_t v7 = &block_descriptor_5;
  double v0 = _Block_copy(&v4);
  OUTLINED_FUNCTION_0_40((uint64_t)v0, sel_setCancelHandler_);
  _Block_release(v0);
  double v8 = nullsub_1;
  uint64_t v9 = 0;
  uint64_t v4 = MEMORY[0x263EF8330];
  uint64_t v5 = 1107296256;
  uint64_t v6 = sub_260869520;
  uint64_t v7 = &block_descriptor_3_1;
  double v1 = _Block_copy(&v4);
  OUTLINED_FUNCTION_0_40((uint64_t)v1, sel_setServiceNotificationHandler_);
  _Block_release(v1);
  double v8 = nullsub_1;
  uint64_t v9 = 0;
  uint64_t v4 = MEMORY[0x263EF8330];
  uint64_t v5 = 1107296256;
  uint64_t v6 = sub_26086DD04;
  uint64_t v7 = &block_descriptor_6_2;
  uint64_t v2 = _Block_copy(&v4);
  OUTLINED_FUNCTION_0_40((uint64_t)v2, sel_setEventHandler_);
  _Block_release(v2);
  double v8 = nullsub_1;
  uint64_t v9 = 0;
  uint64_t v4 = MEMORY[0x263EF8330];
  uint64_t v5 = 1107296256;
  uint64_t v6 = sub_260869520;
  uint64_t v7 = &block_descriptor_9_0;
  uint64_t v3 = _Block_copy(&v4);
  OUTLINED_FUNCTION_0_40((uint64_t)v3, sel_setServiceNotificationHandler_);
  _Block_release(v3);
}

id HIDEventSystemClient.bridgedValue.getter()
{
  return v0;
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

void sub_26086DD04(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, id))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, v6);
  swift_release();
}

uint64_t IOHIDEventSystemConnectionType.stringValue.getter()
{
  uint64_t TypeString = IOHIDEventSystemConnectionGetTypeString();
  return MEMORY[0x270F9D7C0](TypeString);
}

id OUTLINED_FUNCTION_0_40(uint64_t a1, const char *a2)
{
  return objc_msgSend(v3, a2, v2);
}

uint64_t DigitizerFilter.eventMask.getter()
{
  return *(void *)(v0 + 24);
}

void *DigitizerFilter.localTouchUpEvent.getter()
{
  swift_beginAccess();
  double v1 = *(void **)(v0 + 32);
  id v2 = v1;
  return v1;
}

void DigitizerFilter.localTouchUpEvent.setter(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = a1;
}

uint64_t (*DigitizerFilter.localTouchUpEvent.modify())()
{
  return j__swift_endAccess;
}

uint64_t sub_26086DEC8()
{
  sub_26080707C();
  uint64_t v1 = sub_26087B360();
  sub_26087B330();
  sub_26087BBA0();
  sub_26087B330();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_26086DF5C()
{
  return sub_26087BCB0();
}

uint64_t sub_26086DF90()
{
  return sub_26087BD00();
}

uint64_t sub_26086DFF0()
{
  return sub_26086DF90();
}

uint64_t sub_26086DFF8()
{
  return sub_26086DF5C();
}

uint64_t sub_26086E000()
{
  return sub_26087BD00();
}

uint64_t sub_26086E058()
{
  return sub_26086DEC8();
}

uint64_t DigitizerFilter.__allocating_init(service:)(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v6 = 0;
  uint64_t v4 = swift_allocObject();
  DigitizerFilter.init(platform:service:)(&v6, a1, a2);
  return v4;
}

uint64_t DigitizerFilter.__allocating_init(platform:service:)(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  DigitizerFilter.init(platform:service:)(a1, a2, a3);
  return v6;
}

uint64_t DigitizerFilter.init(platform:service:)(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  int v5 = *a1;
  *(void *)(v3 + 32) = 0;
  sub_26086E1F4();
  uint64_t v6 = MEMORY[0x263F8EE78];
  *(void *)(v3 + 48) = sub_26087B200();
  *(void *)(v3 + 56) = sub_2607E2554(v6);
  *(void *)(v3 + 64) = sub_2607E2554(v6);
  *(unsigned char *)(v3 + 16) = v5;
  if (v5 == 1) {
    id v7 = &unk_270C9E780;
  }
  else {
    id v7 = &unk_270C9E7A8;
  }
  *(void *)(v3 + 24) = sub_2607E2554((uint64_t)v7);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(ObjectType, a3);
  swift_unknownObjectRelease();
  *(void *)(v3 + 40) = v9;
  return v3;
}

unint64_t sub_26086E1F4()
{
  unint64_t result = qword_26A8B5730;
  if (!qword_26A8B5730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5730);
  }
  return result;
}

uint64_t DigitizerFilter.filterEvent(_:)(uint64_t a1, void *a2)
{
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  uint64_t v4 = OUTLINED_FUNCTION_12_18();
  uint64_t v6 = v5(v4);
  uint64_t v7 = a2[3];
  uint64_t v8 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v7);
  HIDEventProtocol.first<A>(_:)(v7, (uint64_t)&type metadata for DigitizerEvent, v8, (uint64_t)&protocol witness table for DigitizerEvent, (uint64_t)v172);
  uint64_t v9 = *(void **)&v172[0];
  if (!*(void *)&v172[0]) {
    goto LABEL_22;
  }
  if (!IOHIDEventGetIntegerValue())
  {

LABEL_22:
    sub_2607E2A1C((uint64_t)a2, a1);
    return 0;
  }
  id v10 = v9;
  uint64_t v11 = (SEL *)&unk_265565000;
  id v12 = objc_msgSend(v10, sel_children);
  uint64_t v165 = v6;
  if (v12)
  {
    uint64_t v13 = v12;
    sub_2607E2AD0();
    unint64_t v14 = sub_26087B3F0();

    uint64_t v15 = sub_26082DFC8(v14);
    unint64_t v16 = v10;

    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v16 = v10;

    uint64_t v15 = MEMORY[0x263F8EE78];
  }
  uint64_t v17 = (void *)MEMORY[0x263F8EE78];
  *(void *)&unsigned long long v170 = MEMORY[0x263F8EE78];
  uint64_t v18 = *(void *)(v15 + 16);
  if (v18)
  {
    uint64_t v19 = MEMORY[0x263F8EE78];
    uint64_t v20 = v15 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_2607E2A1C(v20, (uint64_t)v172);
      sub_2607E2A1C((uint64_t)v172, (uint64_t)&v171);
      uint64_t v21 = OUTLINED_FUNCTION_0_41(&v171);
      if (v22(v21) == 11)
      {
        uint64_t v23 = OUTLINED_FUNCTION_1_41(&v171);
        v24(v23);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v171);
        uint64_t v25 = __swift_destroy_boxed_opaque_existential_1((uint64_t)v172);
        MEMORY[0x26121C810](v25);
        OUTLINED_FUNCTION_7_24();
        if (v26) {
          OUTLINED_FUNCTION_3_36();
        }
        OUTLINED_FUNCTION_8_26();
        sub_26087B400();
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v171);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v172);
      }
      v20 += 40;
      --v18;
    }
    while (v18);
    swift_bridgeObjectRelease();
    uint64_t v17 = (void *)v170;
    uint64_t v11 = (SEL *)&unk_265565000;
  }
  else
  {
    uint64_t v19 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  unint64_t v27 = (unint64_t)v16;
  if (!v17[2])
  {

    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  unint64_t v28 = v17[2];
  uint64_t v166 = v17;
  int v157 = *(unsigned __int8 *)(v167 + 16);
  if (v157 == 1)
  {
    id v29 = (id)v27;
    id v30 = [v29 v11[166]];
    if (v30)
    {
      uint64_t v31 = v30;
      sub_2607E2AD0();
      unint64_t v32 = sub_26087B3F0();

      uint64_t v33 = sub_26082DFC8(v32);
      swift_bridgeObjectRelease();
    }
    else
    {

      uint64_t v33 = MEMORY[0x263F8EE78];
    }
    uint64_t v38 = v19;
    *(void *)&unsigned long long v170 = v19;
    uint64_t v46 = *(void *)(v33 + 16);
    if (!v46) {
      goto LABEL_43;
    }
    uint64_t v47 = v33 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_2607E2A1C(v47, (uint64_t)v172);
      sub_2607E2A1C((uint64_t)v172, (uint64_t)&v171);
      uint64_t v48 = OUTLINED_FUNCTION_0_41(&v171);
      if (v49(v48) == 6)
      {
        uint64_t v50 = OUTLINED_FUNCTION_1_41(&v171);
        v51(v50);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v171);
        uint64_t v52 = __swift_destroy_boxed_opaque_existential_1((uint64_t)v172);
        MEMORY[0x26121C810](v52);
        OUTLINED_FUNCTION_7_24();
        if (v26) {
          OUTLINED_FUNCTION_3_36();
        }
        OUTLINED_FUNCTION_8_26();
        sub_26087B400();
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v171);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v172);
      }
      v47 += 40;
      --v46;
    }
    while (v46);
    swift_bridgeObjectRelease();
    goto LABEL_42;
  }
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  uint64_t v35 = OUTLINED_FUNCTION_12_18();
  uint64_t v37 = v36(v35);
  uint64_t v38 = v19;
  *(void *)&unsigned long long v170 = v19;
  uint64_t v39 = *(void *)(v37 + 16);
  if (v39)
  {
    uint64_t v40 = v37 + 32;
    do
    {
      sub_2607E2A1C(v40, (uint64_t)v172);
      sub_2607E2A1C((uint64_t)v172, (uint64_t)&v171);
      uint64_t v41 = OUTLINED_FUNCTION_0_41(&v171);
      if (v42(v41) == 6)
      {
        uint64_t v43 = OUTLINED_FUNCTION_1_41(&v171);
        v44(v43);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v171);
        uint64_t v45 = __swift_destroy_boxed_opaque_existential_1((uint64_t)v172);
        MEMORY[0x26121C810](v45);
        OUTLINED_FUNCTION_7_24();
        if (v26) {
          OUTLINED_FUNCTION_3_36();
        }
        OUTLINED_FUNCTION_8_26();
        sub_26087B400();
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v171);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v172);
      }
      v40 += 40;
      --v39;
    }
    while (v39);
LABEL_42:
    uint64_t v38 = v170;
  }
LABEL_43:
  uint64_t v159 = v38;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_4_25();
  uint64_t v158 = a1;
  if (qword_26A8B4520 != -1) {
    goto LABEL_170;
  }
LABEL_44:
  v172[0] = xmmword_26A8B4D28;
  uint64_t v53 = HIDReportDescriptor.reportBitCount(for:)(9u);
  uint64_t v54 = HIDReport.init(bitCount:id:)(v53, 9);
  DigitizerReport.init(_report:)(v54, v55);
  uint64_t v56 = v54;
  unint64_t v58 = v57;
  *(void *)&unsigned long long v170 = v54;
  *((void *)&v170 + 1) = v57;
  uint64_t v59 = a2[3];
  uint64_t v60 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v59);
  unint64_t TimeStamp = v58 >> 62;
  id v62 = (id)(*(uint64_t (**)(uint64_t, uint64_t))(v60 + 328))(v59, v60);
  switch(v58 >> 62)
  {
    case 1uLL:
      if (!__OFSUB__(HIDWORD(v56), v56)) {
        goto LABEL_48;
      }
      goto LABEL_177;
    case 2uLL:
      if (!__OFSUB__(*(void *)(v56 + 24), *(void *)(v56 + 16))) {
        goto LABEL_48;
      }
      goto LABEL_178;
    case 3uLL:
      goto LABEL_51;
    default:
LABEL_48:
      OUTLINED_FUNCTION_2_1();
      if (!v26)
      {
        __break(1u);
LABEL_171:
        __break(1u);
LABEL_172:
        __break(1u);
LABEL_173:
        __break(1u);
LABEL_174:
        __break(1u);
        goto LABEL_175;
      }
      if (v63 < 53) {
        goto LABEL_51;
      }
      uint64_t v59 = 416;
      break;
  }
  while (2)
  {
    uint64_t v111 = 0;
    switch(*((void *)&v170 + 1) >> 62)
    {
      case 1:
        uint64_t v113 = (int)v170;
        goto LABEL_115;
      case 2:
        uint64_t v113 = *(void *)(v170 + 16);
LABEL_115:
        if ((unint64_t)(v113 - 0x1000000000000000) >> 61 == 7)
        {
          uint64_t v111 = 8 * v113;
LABEL_110:
          if (__OFADD__(v111, v59)) {
            goto LABEL_173;
          }
          unint64_t TimeStamp = (unint64_t)&v170;
          sub_26087AFD0();
          unint64_t v112 = v59 - 352;
          v59 -= 8;
          if (v112 <= 8)
          {
            unint64_t v58 = *((void *)&v170 + 1);
            unint64_t TimeStamp = *((void *)&v170 + 1) >> 62;
LABEL_51:
            id v62 = (id)_s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcig_0();
            uint64_t v64 = 0;
            switch(TimeStamp)
            {
              case 1uLL:
              case 2uLL:
                goto LABEL_119;
              default:
                goto LABEL_52;
            }
          }
          continue;
        }
        __break(1u);
LABEL_118:
        __break(1u);
LABEL_119:
        OUTLINED_FUNCTION_2_1();
        if (v26) {
          goto LABEL_185;
        }
        __break(1u);
LABEL_121:

LABEL_122:
        swift_bridgeObjectRelease();
        if (!*(void *)(v159 + 16))
        {
          swift_bridgeObjectRelease();
          goto LABEL_128;
        }
        sub_2607E281C(0, 1, v159);
        id v115 = *(id *)(v159 + 32);
        swift_bridgeObjectRelease();
        unint64_t TimeStamp = (unint64_t)v115;
        unint64_t v58 = ScrollCollection.init(scrollEvent:)((void *)TimeStamp);
        unint64_t v28 = v116;
        unint64_t v27 = *((void *)&v170 + 1);
        id v62 = (id)v170;
        unsigned long long v171 = v170;
        sub_2607DCED0(v170, *((unint64_t *)&v170 + 1));
        uint64_t v59 = DigitizerReport.contactRange(forIndex:)(5, (uint64_t)v62, v27);
        if (qword_26A8B4510 != -1) {
          goto LABEL_180;
        }
        while (2)
        {
          if (__OFADD__(v59, qword_26A8B4CD0 >> 3))
          {
            __break(1u);
            goto LABEL_182;
          }
          if (v59 + (qword_26A8B4CD0 >> 3) < v59)
          {
LABEL_182:
            __break(1u);
LABEL_183:
            OUTLINED_FUNCTION_27();
            sub_26087B980();
            __break(1u);
LABEL_184:
            sub_26087BC30();
            __break(1u);
LABEL_185:
            uint64_t v64 = 8 * v114;
LABEL_52:
            uint64_t v153 = (void *)v27;
            if (__OFADD__(v64, 8))
            {
LABEL_175:
              __break(1u);
LABEL_176:
              __break(1u);
LABEL_177:
              __break(1u);
LABEL_178:
              __break(1u);
LABEL_179:
              __break(1u);
LABEL_180:
              swift_once();
              continue;
            }
            sub_26087AFD0();
            uint64_t v65 = v167;
            uint64_t v152 = (void **)(v167 + 32);
            swift_beginAccess();
            uint64_t v66 = *(void **)(v167 + 32);
            *(void *)(v167 + 32) = 0;

            uint64_t v161 = (uint64_t *)(v167 + 48);
            unint64_t TimeStamp = (unint64_t)v166;
            unint64_t v154 = (unint64_t)(v166 + 4);
            uint64_t v155 = v62;
            swift_bridgeObjectRetain();
            uint64_t v162 = 0;
            unint64_t v27 = 0;
            uint64_t v164 = (void *)MEMORY[0x263F8EE78];
            unint64_t v160 = v28;
            while (1)
            {
              if (v27 >= *(void *)(TimeStamp + 16))
              {
                __break(1u);
LABEL_170:
                swift_once();
                goto LABEL_44;
              }
              uint64_t v59 = *(void *)(v65 + 64);
              id v62 = *(id *)(TimeStamp + 8 * v27 + 32);
              if ((v59 & 0x800) != 0)
              {
                unint64_t v73 = OUTLINED_FUNCTION_5_25();
                if ((v73 & 0x8000000000000000) != 0 || HIDWORD(v73)) {
                  goto LABEL_183;
                }
                if ((v73 & 2) != 0)
                {
                  if (!IOHIDEventGetIntegerValue()) {
                    goto LABEL_70;
                  }
                  unint64_t v74 = OUTLINED_FUNCTION_5_25();
                  if ((v74 & 0x8000000000000000) != 0 || HIDWORD(v74)) {
                    goto LABEL_183;
                  }
                  if ((v74 & 0x80) != 0)
                  {
LABEL_70:
                    OUTLINED_FUNCTION_2_42();
                    OUTLINED_FUNCTION_9_23();
                    if (!*(void *)(*(void *)TimeStamp + 16)) {
                      goto LABEL_82;
                    }
                    sub_2607F4068();
                    char v76 = v75;
                    swift_endAccess();
                    if ((v76 & 1) == 0) {
                      goto LABEL_83;
                    }
                    uint64_t v77 = OUTLINED_FUNCTION_2_42();
                    uint64_t v78 = v65;
                    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                    {
                      sub_26082298C();
                      uint64_t v164 = v109;
                    }
                    unint64_t v79 = v164[2];
                    if (v79 >= v164[3] >> 1)
                    {
                      sub_26082298C();
                      uint64_t v164 = v110;
                    }
                    v164[2] = v79 + 1;
                    v164[v79 + 4] = v77;
                    unint64_t TimeStamp = (unint64_t)v166;
                    uint64_t v65 = v78;
                  }
                }
              }
              else
              {
                unint64_t v58 = OUTLINED_FUNCTION_2_42();
                if (IOHIDEventGetIntegerValue())
                {
                  IOHIDEventGetFloatValue();
                  IOHIDEventGetFloatValue();
                  OUTLINED_FUNCTION_10_22();
                  swift_isUniquelyReferenced_nonNull_native();
                  unint64_t TimeStamp = *(void *)v59;
                  uint64_t v168 = *(void *)v59;
                  *(void *)uint64_t v59 = 0x8000000000000000;
                  unint64_t v67 = sub_2607F4068();
                  if (__OFADD__(*(void *)(TimeStamp + 16), (v68 & 1) == 0)) {
                    goto LABEL_174;
                  }
                  unint64_t v28 = v67;
                  uint64_t v59 = v68;
                  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B5738);
                  OUTLINED_FUNCTION_14_15();
                  sub_26087B950();
                  OUTLINED_FUNCTION_4_25();
                  if (v69)
                  {
                    unint64_t TimeStamp = v168;
                    unint64_t v70 = sub_2607F4068();
                    if ((v59 & 1) != (v71 & 1)) {
                      goto LABEL_184;
                    }
                    unint64_t v28 = v70;
                  }
                  if (v59)
                  {
                    OUTLINED_FUNCTION_11_17(v168);
                    unint64_t TimeStamp = (unint64_t)v166;
                  }
                  else
                  {
                    *(void *)(v168 + 8 * (v28 >> 6) + 64) |= 1 << v28;
                    unint64_t v82 = (uint64_t *)(*(void *)(v168 + 48) + 16 * v28);
                    unint64_t TimeStamp = (unint64_t)v166;
                    *unint64_t v82 = v165;
                    v82[1] = v58;
                    OUTLINED_FUNCTION_11_17(v168);
                    uint64_t v83 = *(void *)(v72 + 16);
                    BOOL v84 = __OFADD__(v83, 1);
                    uint64_t v85 = v83 + 1;
                    if (v84) {
                      goto LABEL_179;
                    }
                    *(void *)(v72 + 16) = v85;
                  }
                  unint64_t v28 = v160;
                  *uint64_t v161 = v72;
                  swift_bridgeObjectRelease();
                  swift_endAccess();
                }
                else
                {
                  unint64_t v80 = OUTLINED_FUNCTION_5_25();
                  if ((v80 & 0x8000000000000000) != 0 || HIDWORD(v80)) {
                    goto LABEL_183;
                  }
                  if ((v80 & 0x82) != 0)
                  {
                    OUTLINED_FUNCTION_10_22();
                    sub_2607F4068();
                    if (v81)
                    {
                      unint64_t v58 = v167 + 48;
                      swift_isUniquelyReferenced_nonNull_native();
                      uint64_t v169 = *v161;
                      *uint64_t v161 = 0x8000000000000000;
                      __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B5738);
                      OUTLINED_FUNCTION_14_15();
                      OUTLINED_FUNCTION_4_25();
                      sub_26087B950();
                      sub_26086E1F4();
                      OUTLINED_FUNCTION_75();
                      sub_26087B970();
                      *uint64_t v161 = v169;
                      swift_bridgeObjectRelease();
                    }
LABEL_82:
                    swift_endAccess();
LABEL_83:
                    unint64_t TimeStamp = (unint64_t)v166;
                  }
                }
              }
              if ((*(unsigned char *)(v65 + 57) & 8) != 0)
              {
                if (v162 >= v155) {
                  goto LABEL_121;
                }
                if (qword_26A8B4528 != -1) {
                  swift_once();
                }
                uint64_t v59 = HIDReport.init(bitCount:id:)(qword_26A8B4D38, 0);
                unint64_t TimeStamp = (unint64_t)v86;
                *(void *)&unsigned long long v171 = v59;
                *((void *)&v171 + 1) = v86;
                unint64_t v87 = OUTLINED_FUNCTION_2_42();
                _s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcig_0();
                if ((v87 & 0x8000000000000000) != 0 || v87 >= 0x100) {
                  goto LABEL_183;
                }
                switch(TimeStamp >> 62)
                {
                  case 1uLL:
                    uint64_t v108 = (int)v59;
                    goto LABEL_106;
                  case 2uLL:
                    uint64_t v108 = *(void *)(v59 + 16);
LABEL_106:
                    if ((unint64_t)(v108 - 0x1000000000000000) >> 61 == 7) {
                      goto LABEL_95;
                    }
                    goto LABEL_118;
                  default:
LABEL_95:
                    sub_26087AFD0();
                    IOHIDEventGetFloatValue();
                    double v89 = v88;
                    IOHIDEventGetFloatValue();
                    DigitizerContact.point.setter(v89, v90);
                    BOOL v91 = IOHIDEventGetIntegerValue() != 0;
                    HIDReport.subscript.setter(v91, 7);
                    BOOL v92 = IOHIDEventGetIntegerValue() != 0;
                    HIDReport.subscript.setter(v92, 6);
                    uint64_t v93 = OUTLINED_FUNCTION_5_25();
                    unsigned int v94 = DigitizerEventMask.init(rawValue:)(v93);
                    HIDReport.subscript.setter((v94 >> 9) & 1, 5);
                    unint64_t v28 = *((void *)&v171 + 1);
                    unint64_t v58 = v171;
                    unint64_t v96 = *((void *)&v170 + 1);
                    uint64_t v95 = v170;
                    sub_2607DCED0(v171, *((unint64_t *)&v171 + 1));
                    DigitizerReport.contactRange(forIndex:)(v162, v95, v96);
                    sub_2607DCED0(v58, v28);
                    uint64_t v97 = OUTLINED_FUNCTION_75();
                    sub_2607DCED0(v97, v98);
                    OUTLINED_FUNCTION_4_25();
                    sub_2608345EC(v99, v100);
                    OUTLINED_FUNCTION_6_29();
                    uint64_t v101 = OUTLINED_FUNCTION_75();
                    sub_2607DCF28(v101, v102);
                    OUTLINED_FUNCTION_6_29();
                    unint64_t v103 = v96;
                    unint64_t TimeStamp = v95;
                    unsigned long long v170 = __PAIR128__(v103, v95);
                    uint64_t IntegerValue = IOHIDEventGetIntegerValue();
                    if (IntegerValue >= 255) {
                      uint64_t v105 = 255;
                    }
                    else {
                      uint64_t v105 = IntegerValue;
                    }
                    uint64_t v59 = 8 * v162 + 320;
                    if (__OFADD__(8 * v162, 320)) {
                      goto LABEL_176;
                    }
                    uint64_t v106 = OUTLINED_FUNCTION_75();
                    if (sub_260831898(v106, v107, v103)) {
                      _s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcis_0(v105 & ~(v105 >> 63), v59);
                    }

                    OUTLINED_FUNCTION_6_29();
                    ++v162;
                    unint64_t TimeStamp = (unint64_t)v166;
                    uint64_t v65 = v167;
                    unint64_t v28 = v160;
                    break;
                }
              }
              else
              {
              }
              if (v28 == ++v27) {
                goto LABEL_122;
              }
            }
          }
          break;
        }
        sub_2607DCED0(v58, v28);
        sub_2608345EC(v58, v28);
        OUTLINED_FUNCTION_6_29();
        OUTLINED_FUNCTION_6_29();
        sub_2607DCF28((uint64_t)v62, v27);

        unsigned long long v170 = v171;
LABEL_128:
        id v62 = v164;
        char v117 = v153;
        if (!v164[2])
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v144 = v158;
          uint64_t v145 = v167;
          goto LABEL_162;
        }
        IOHIDEventGetTimeStamp();
        unint64_t v118 = IOHIDEventGetIntegerValue();
        DigitizerType.init(rawValue:)(v118);
        uint64_t v119 = IOHIDEventGetIntegerValue();
        unint64_t v27 = DigitizerEventMask.init(rawValue:)(v119);
        IOHIDEventGetIntegerValue();
        uint64_t v59 = IOHIDEventGetIntegerValue();
        IOHIDEventGetIntegerValue();
        IOHIDEventGetFloatValue();
        IOHIDEventGetFloatValue();
        IOHIDEventGetIntegerValue();
        IOHIDEventGetIntegerValue();
        IOHIDEventGetEventFlags();
        unint64_t TimeStamp = (unint64_t)v166;
        OUTLINED_FUNCTION_4_25();
        unint64_t v58 = v160;
        uint64_t v156 = (void *)DigitizerEvent.init(time:digitizerType:digitizerEventMask:generationCount:index:identity:point:range:touch:flags:)(v120, v121, v122, v123, v124, v125);
        int v163 = 0;
        unint64_t v126 = 0;
        uint64_t v127 = v164[2];
        unint64_t v28 = v154;
        do
        {
          if (v126 >= *(void *)(TimeStamp + 16)) {
            goto LABEL_171;
          }
          id v62 = *(id *)(v28 + 8 * v126);
          uint64_t v59 = IOHIDEventGetIntegerValue();
          unint64_t v27 = (unint64_t)v164;
          swift_bridgeObjectRetain();
          uint64_t v128 = OUTLINED_FUNCTION_2_42();
          if (!v127) {
            goto LABEL_144;
          }
          if (v164[4] != v128)
          {
            if (v127 == 1) {
              goto LABEL_144;
            }
            if (v164[5] != v128)
            {
              if (v127 != 2)
              {
                uint64_t v139 = 6;
                do
                {
                  uint64_t v140 = v139 - 3;
                  if (__OFADD__(v139 - 4, 1)) {
                    goto LABEL_172;
                  }
                  if (v164[v139] == v128) {
                    goto LABEL_133;
                  }
                  ++v139;
                }
                while (v140 != v127);
              }
LABEL_144:

              swift_bridgeObjectRelease();
              goto LABEL_146;
            }
          }
LABEL_133:
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_9_23();
          unint64_t TimeStamp = *(void *)TimeStamp;
          if (*(void *)(TimeStamp + 16) && (sub_2607F4068(), (v129 & 1) != 0))
          {
            swift_endAccess();
            unint64_t v130 = OUTLINED_FUNCTION_5_25();
            if ((v130 & 0x8000000000000000) != 0) {
              goto LABEL_183;
            }
            uint64_t v59 = v130;
            if (HIDWORD(v130)) {
              goto LABEL_183;
            }
            unint64_t TimeStamp = IOHIDEventGetTimeStamp();
            unint64_t v131 = IOHIDEventGetIntegerValue();
            if ((v131 & 0x8000000000000000) != 0) {
              goto LABEL_183;
            }
            unint64_t v58 = v131;
            if (HIDWORD(v131)) {
              goto LABEL_183;
            }
            unint64_t v132 = OUTLINED_FUNCTION_5_25();
            if ((v132 & 0x8000000000000000) != 0) {
              goto LABEL_183;
            }
            unint64_t v28 = v132;
            if (HIDWORD(v132)) {
              goto LABEL_183;
            }
            v163 |= v59;
            uint64_t v159 = IOHIDEventGetIntegerValue();
            OUTLINED_FUNCTION_2_42();
            IOHIDEventGetIntegerValue();
            unint64_t v27 = IOHIDEventGetIntegerValue() != 0;
            IOHIDEventGetIntegerValue();
            IOHIDEventGetEventFlags();
            OUTLINED_FUNCTION_4_25();
            uint64_t v59 = DigitizerEvent.init(time:digitizerType:digitizerEventMask:generationCount:index:identity:point:range:touch:flags:)(v133, v134, v135, v136, v137, v138);
            IOHIDEventAppendEvent();

            unint64_t TimeStamp = (unint64_t)v166;
            unint64_t v58 = v160;
            unint64_t v28 = v154;
          }
          else
          {
            swift_endAccess();

            unint64_t TimeStamp = (unint64_t)v166;
          }
LABEL_146:
          ++v126;
        }
        while (v126 != v58);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        IOHIDEventSetIntegerValue();
        if (v157 == 1)
        {
          char v141 = v152;
          uint64_t v142 = *v152;
          *uint64_t v152 = v156;
          id v143 = v156;
        }
        else
        {
          uint64_t v146 = mach_absolute_time();
          uint64_t v147 = PointerEvent.init(time:point:buttonMask:oldButtonMask:flags:)(v146, 0, 0);
          IOHIDEventAppendEvent();
          char v141 = v152;
          uint64_t v142 = *v152;
          *uint64_t v152 = (void *)v147;
        }
        uint64_t v144 = v158;
        uint64_t v145 = v167;
        char v117 = v153;

        if (*v141)
        {
          id v148 = *v141;
          IOHIDEventSetSenderID();
        }
LABEL_162:
        if ((*(unsigned char *)(v145 + 65) & 8) != 0)
        {
          *(void *)(v144 + 32) = 0;
          *(_OWORD *)uint64_t v144 = 0u;
          *(_OWORD *)(v144 + 16) = 0u;
        }
        else
        {
          sub_2607E2A1C((uint64_t)a2, v144);
        }
        if ((*(unsigned char *)(v145 + 57) & 8) != 0)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B4720);
          uint64_t v151 = swift_allocObject();
          *(_OWORD *)(v151 + 16) = xmmword_26087C870;
          unint64_t v150 = *((void *)&v170 + 1);
          uint64_t v149 = v170;
          *(void *)(v151 + 32) = v170;
          *(void *)(v151 + 40) = v150;
          sub_2607DCED0(v149, v150);
        }
        else
        {

          unint64_t v150 = *((void *)&v170 + 1);
          uint64_t v149 = v170;
        }
        sub_2607DCF28(v149, v150);
        return 1;
      default:
        goto LABEL_110;
    }
  }
}

uint64_t DigitizerFilter.updateCopyMask(oldValue:newValue:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 56) = a2;
  return MEMORY[0x263F8EE78];
}

uint64_t DigitizerFilter.updateFilterMask(oldValue:newValue:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 64) = a2;
  return MEMORY[0x263F8EE78];
}

uint64_t DigitizerFilter.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t DigitizerFilter.__deallocating_deinit()
{
  DigitizerFilter.deinit();
  return MEMORY[0x270FA0228](v0, 72, 7);
}

uint64_t sub_26086F62C()
{
  return DigitizerFilter.eventMask.getter();
}

uint64_t sub_26086F650(uint64_t a1, void *a2)
{
  return DigitizerFilter.filterEvent(_:)(a1, a2) & 1;
}

uint64_t sub_26086F678(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x263F8EE78];
}

uint64_t sub_26086F6A4(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x263F8EE78];
}

uint64_t type metadata accessor for DigitizerFilter()
{
  return self;
}

uint64_t method lookup function for DigitizerFilter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DigitizerFilter);
}

uint64_t dispatch thunk of DigitizerFilter.__allocating_init(platform:service:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

ValueMetadata *type metadata accessor for DigitizerFilter.LocalSenderContact()
{
  return &type metadata for DigitizerFilter.LocalSenderContact;
}

unint64_t sub_26086F734()
{
  unint64_t result = qword_26A8B5740;
  if (!qword_26A8B5740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5740);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_41(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, v1);
  return v1;
}

uint64_t OUTLINED_FUNCTION_1_41(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, v1);
  return v1;
}

uint64_t OUTLINED_FUNCTION_2_42()
{
  return IOHIDEventGetIntegerValue();
}

uint64_t OUTLINED_FUNCTION_3_36()
{
  return sub_26087B410();
}

uint64_t OUTLINED_FUNCTION_5_25()
{
  return IOHIDEventGetIntegerValue();
}

uint64_t OUTLINED_FUNCTION_6_29()
{
  return sub_2607DCF28(v0, v1);
}

uint64_t OUTLINED_FUNCTION_8_26()
{
  return sub_26087B430();
}

uint64_t OUTLINED_FUNCTION_9_23()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_10_22()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_11_17(uint64_t a1@<X8>)
{
  uint64_t v4 = (void *)(*(void *)(a1 + 56) + 24 * v1);
  *uint64_t v4 = v2;
  v4[1] = v3;
  v4[2] = 0;
}

uint64_t OUTLINED_FUNCTION_12_18()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_14_15()
{
  return v0;
}

uint64_t HIDEventMask.contains(_:)(unsigned int a1, uint64_t a2)
{
  if (a1 > 0x3F)
  {
    uint64_t v2 = 0;
    return (v2 & a2) != 0;
  }
  if (a1 != 63)
  {
    uint64_t v2 = 1 << a1;
    return (v2 & a2) != 0;
  }
  OUTLINED_FUNCTION_0_42();
  uint64_t result = OUTLINED_FUNCTION_1_42();
  __break(1u);
  return result;
}

uint64_t HIDEventMask.rawValue.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*HIDEventMask.rawValue.modify())()
{
  return nullsub_1;
}

uint64_t HIDEventType.maskValue.getter(unsigned int a1)
{
  if (a1 >= 0x40) {
    return 0;
  }
  if (a1 != 63) {
    return 1 << a1;
  }
  OUTLINED_FUNCTION_0_42();
  uint64_t result = OUTLINED_FUNCTION_1_42();
  __break(1u);
  return result;
}

uint64_t HIDEventMask.insert(_:)(unsigned int a1)
{
  uint64_t v2 = *v1;
  uint64_t v3 = a1;
  if (a1 > 0x40)
  {
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  if (a1 == 64) {
    goto LABEL_8;
  }
  if ((a1 & 0x3F) != 0x3FLL)
  {
    uint64_t v4 = 1 << a1;
LABEL_6:
    if ((v4 & v2) != 0)
    {
      uint64_t v5 = 0;
      return v5 | (v3 << 32);
    }
LABEL_8:
    *uint64_t v1 = HIDEventType.maskValue.getter(a1) | v2;
    uint64_t v5 = 1;
    return v5 | (v3 << 32);
  }
  OUTLINED_FUNCTION_0_42();
  uint64_t result = OUTLINED_FUNCTION_1_42();
  __break(1u);
  return result;
}

uint64_t HIDEventMask.remove(_:)(unsigned int a1)
{
  uint64_t v3 = *v1;
  if (a1 > 0x40)
  {
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  if (a1 == 64) {
    goto LABEL_8;
  }
  if (a1 != 63)
  {
    uint64_t v4 = 1 << a1;
LABEL_6:
    if ((v4 & v3) != 0)
    {
      uint64_t v5 = HIDEventType.maskValue.getter(a1);
      unsigned __int8 v6 = 0;
      *uint64_t v1 = v3 & ~v5;
      uint64_t v7 = a1;
      return v7 | ((unint64_t)v6 << 32);
    }
LABEL_8:
    uint64_t v7 = 0;
    unsigned __int8 v6 = 1;
    return v7 | ((unint64_t)v6 << 32);
  }
  OUTLINED_FUNCTION_0_42();
  uint64_t result = OUTLINED_FUNCTION_1_42();
  __break(1u);
  return result;
}

uint64_t HIDEventMask.update(with:)(unsigned int a1)
{
  uint64_t v3 = *v1;
  if (a1 > 0x40)
  {
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  if (a1 == 64) {
    goto LABEL_8;
  }
  if (a1 != 63)
  {
    uint64_t v4 = 1 << a1;
LABEL_6:
    if ((v4 & v3) != 0)
    {
      uint64_t v5 = 0;
      unsigned __int8 v6 = 1;
      return v5 | ((unint64_t)v6 << 32);
    }
LABEL_8:
    uint64_t v7 = HIDEventType.maskValue.getter(a1);
    unsigned __int8 v6 = 0;
    *uint64_t v1 = v7 | v3;
    uint64_t v5 = a1;
    return v5 | ((unint64_t)v6 << 32);
  }
  OUTLINED_FUNCTION_0_42();
  uint64_t result = OUTLINED_FUNCTION_1_42();
  __break(1u);
  return result;
}

void *sub_26086FC10@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_26086FC1C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = OUTLINED_FUNCTION_3();
  *a1 = result;
  return result;
}

uint64_t sub_26086FC44(unsigned int *a1)
{
  return HIDEventMask.contains(_:)(*a1, *v1);
}

uint64_t sub_26086FC50@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_260875A3C(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_26086FC80@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_26082C534(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_26086FCB0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_26082C54C(*a1, *v2);
  *a2 = result;
  return result;
}

unint64_t sub_26086FCE0(_DWORD *a1, unsigned int *a2)
{
  unint64_t v3 = HIDEventMask.insert(_:)(*a2);
  unint64_t v4 = HIDWORD(v3);
  unint64_t result = v3 & 1;
  *a1 = v4;
  return result;
}

uint64_t sub_26086FD14@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = HIDEventMask.remove(_:)(*a1);
  *(_DWORD *)a2 = result;
  *(unsigned char *)(a2 + 4) = BYTE4(result) & 1;
  return result;
}

uint64_t sub_26086FD48@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = HIDEventMask.update(with:)(*a1);
  *(_DWORD *)a2 = result;
  *(unsigned char *)(a2 + 4) = BYTE4(result) & 1;
  return result;
}

void sub_26086FD7C(uint64_t *a1)
{
}

void sub_26086FD84(uint64_t *a1)
{
}

void sub_26086FD8C(uint64_t *a1)
{
}

uint64_t sub_26086FD94@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_260875E10(*a1, *v2);
  *a2 = result;
  return result;
}

BOOL sub_26086FDC4(uint64_t *a1)
{
  return sub_26082C68C(*a1, *v1);
}

BOOL sub_26086FDD0(uint64_t *a1)
{
  return sub_2608762AC(*a1, *v1);
}

BOOL sub_26086FDDC(uint64_t *a1)
{
  return sub_26082C840(*a1, *v1);
}

BOOL sub_26086FDE8()
{
  return sub_2607E83F8(*v0);
}

void sub_26086FDF0(uint64_t *a1)
{
}

void *sub_26086FDF8@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

BOOL sub_26086FE08(uint64_t *a1, uint64_t *a2)
{
  return sub_26086519C(*a1, *a2);
}

uint64_t sub_26086FE14@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_2608756D4(a1);
  *a2 = result;
  return result;
}

uint64_t HIDEventMask.description.getter(unint64_t a1)
{
  uint64_t v2 = (char *)static HIDEventType.allCases.getter();
  uint64_t v3 = *((void *)v2 + 2);
  uint64_t v4 = MEMORY[0x263F8EE78];
  if (v3)
  {
    uint64_t v5 = (unsigned int *)(v2 + 32);
    uint64_t v6 = MEMORY[0x263F8EE78];
    while (1)
    {
      unsigned int v8 = *v5++;
      unsigned int v7 = v8;
      if (v8 < 0x40)
      {
        if (v7 == 63)
        {
          OUTLINED_FUNCTION_0_42();
          uint64_t result = OUTLINED_FUNCTION_1_42();
          __break(1u);
          return result;
        }
        if ((a1 >> v7))
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            sub_2607E98E0();
          }
          unint64_t v9 = *(void *)(v6 + 16);
          if (v9 >= *(void *)(v6 + 24) >> 1) {
            sub_2607E98E0();
          }
          *(void *)(v6 + 16) = v9 + 1;
          *(_DWORD *)(v6 + 4 * v9 + 32) = v7;
        }
      }
      if (!--v3) {
        goto LABEL_14;
      }
    }
  }
  uint64_t v6 = MEMORY[0x263F8EE78];
LABEL_14:
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(v6 + 16);
  if (v10)
  {
    sub_2607E9890(0, v10, 0);
    uint64_t v11 = 0;
    uint64_t v12 = v4;
    do
    {
      uint64_t v13 = HIDEventType.description.getter(*(_DWORD *)(v6 + 4 * v11 + 32));
      uint64_t v15 = v14;
      unint64_t v17 = *(void *)(v12 + 16);
      unint64_t v16 = *(void *)(v12 + 24);
      if (v17 >= v16 >> 1) {
        sub_2607E9890(v16 > 1, v17 + 1, 1);
      }
      ++v11;
      *(void *)(v12 + 16) = v17 + 1;
      uint64_t v18 = v12 + 16 * v17;
      *(void *)(v18 + 32) = v13;
      *(void *)(v18 + 40) = v15;
    }
    while (v10 != v11);
  }
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B4668);
  sub_260870060();
  uint64_t v19 = sub_26087B230();
  swift_bridgeObjectRelease();
  return v19;
}

uint64_t sub_260870058()
{
  return HIDEventMask.description.getter(*v0);
}

unint64_t sub_260870060()
{
  unint64_t result = qword_26A8B4670;
  if (!qword_26A8B4670)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A8B4668);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B4670);
  }
  return result;
}

unint64_t sub_2608700B8()
{
  unint64_t result = qword_26A8B5748;
  if (!qword_26A8B5748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5748);
  }
  return result;
}

unint64_t sub_260870108()
{
  unint64_t result = qword_26A8B5750;
  if (!qword_26A8B5750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5750);
  }
  return result;
}

unint64_t sub_260870158()
{
  unint64_t result = qword_26A8B5758;
  if (!qword_26A8B5758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5758);
  }
  return result;
}

unint64_t sub_2608701A8()
{
  unint64_t result = qword_26A8B5760;
  if (!qword_26A8B5760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5760);
  }
  return result;
}

ValueMetadata *type metadata accessor for HIDEventMask()
{
  return &type metadata for HIDEventMask;
}

uint64_t OUTLINED_FUNCTION_1_42()
{
  return sub_26087B980();
}

double NavigationSwipeEvent.delta.getter()
{
  OUTLINED_FUNCTION_9_24();
  IOHIDEventGetFloatValue();
  double v1 = v0;
  IOHIDEventGetFloatValue();
  IOHIDEventGetFloatValue();
  return v1;
}

unint64_t NavigationSwipeEvent.swipeMask.getter()
{
  unint64_t result = IOHIDEventGetIntegerValue();
  if ((result & 0x8000000000000000) != 0 || HIDWORD(result))
  {
    OUTLINED_FUNCTION_27();
    unint64_t result = sub_26087B980();
    __break(1u);
  }
  return result;
}

unint64_t NavigationSwipeEvent.flavor.getter()
{
  return OUTLINED_FUNCTION_7_25();
}

uint64_t NavigationSwipeEvent.progress.getter()
{
  return OUTLINED_FUNCTION_1_43();
}

unint64_t NavigationSwipeEvent.gestureMotion.getter()
{
  return OUTLINED_FUNCTION_7_25();
}

uint64_t NavigationSwipeEvent.init(time:swipeMask:gestureMotion:flavor:delta:progress:flags:)()
{
  uint64_t NavigationSwipeEvent = IOHIDEventCreateNavigationSwipeEvent();
  IOHIDEventSetIntegerValue();
  return NavigationSwipeEvent;
}

uint64_t static NavigationSwipeEvent.eventType.getter()
{
  return 16;
}

uint64_t NavigationSwipeEvent.init(event:)(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v2 = OUTLINED_FUNCTION_8_2();
  if (v3(v2) == 16)
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    uint64_t v4 = OUTLINED_FUNCTION_8_2();
    uint64_t v6 = v5(v4);
  }
  else
  {
    uint64_t v6 = 0;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v6;
}

uint64_t NavigationSwipeEvent.x.getter()
{
  return OUTLINED_FUNCTION_1_43();
}

uint64_t NavigationSwipeEvent.x.setter()
{
  return OUTLINED_FUNCTION_0_43();
}

uint64_t (*NavigationSwipeEvent.x.modify(uint64_t a1, uint64_t a2))()
{
  OUTLINED_FUNCTION_2_2(a1, a2);
  IOHIDEventGetFloatValue();
  void *v2 = v3;
  return sub_2608704A4;
}

uint64_t sub_2608704A4()
{
  return OUTLINED_FUNCTION_0_43();
}

uint64_t NavigationSwipeEvent.y.getter()
{
  return OUTLINED_FUNCTION_1_43();
}

uint64_t NavigationSwipeEvent.y.setter()
{
  return OUTLINED_FUNCTION_0_43();
}

uint64_t (*NavigationSwipeEvent.y.modify(uint64_t a1, uint64_t a2))()
{
  OUTLINED_FUNCTION_2_2(a1, a2);
  IOHIDEventGetFloatValue();
  void *v2 = v3;
  return sub_260870514;
}

uint64_t sub_260870514()
{
  return OUTLINED_FUNCTION_0_43();
}

uint64_t NavigationSwipeEvent.z.getter()
{
  return OUTLINED_FUNCTION_1_43();
}

uint64_t NavigationSwipeEvent.z.setter()
{
  return OUTLINED_FUNCTION_0_43();
}

uint64_t (*NavigationSwipeEvent.z.modify(uint64_t a1, uint64_t a2))()
{
  OUTLINED_FUNCTION_2_2(a1, a2);
  IOHIDEventGetFloatValue();
  void *v2 = v3;
  return sub_260870584;
}

uint64_t sub_260870584()
{
  return OUTLINED_FUNCTION_0_43();
}

uint64_t NavigationSwipeEvent.progress.setter()
{
  return OUTLINED_FUNCTION_0_43();
}

uint64_t (*NavigationSwipeEvent.progress.modify(uint64_t a1, uint64_t a2))()
{
  OUTLINED_FUNCTION_2_2(a1, a2);
  IOHIDEventGetFloatValue();
  void *v2 = v3;
  return sub_2608705EC;
}

uint64_t sub_2608705EC()
{
  return OUTLINED_FUNCTION_0_43();
}

uint64_t NavigationSwipeEvent.swipeMask.setter()
{
  return OUTLINED_FUNCTION_6_30();
}

uint64_t (*NavigationSwipeEvent.swipeMask.modify(void *a1, uint64_t a2))()
{
  OUTLINED_FUNCTION_8_17(a1, a2);
  *(_DWORD *)(v2 + 8) = NavigationSwipeEvent.swipeMask.getter();
  return sub_260870650;
}

uint64_t sub_260870650()
{
  return OUTLINED_FUNCTION_6_30();
}

uint64_t NavigationSwipeEvent.gestureMotion.setter()
{
  return OUTLINED_FUNCTION_2_43();
}

uint64_t (*NavigationSwipeEvent.gestureMotion.modify(void *a1, uint64_t a2))()
{
  OUTLINED_FUNCTION_8_17(a1, a2);
  *(_WORD *)(v2 + 8) = NavigationSwipeEvent.gestureMotion.getter();
  return sub_2608706B4;
}

uint64_t sub_2608706B4()
{
  return OUTLINED_FUNCTION_2_43();
}

uint64_t NavigationSwipeEvent.flavor.setter()
{
  return OUTLINED_FUNCTION_2_43();
}

uint64_t (*NavigationSwipeEvent.flavor.modify(void *a1, uint64_t a2))()
{
  OUTLINED_FUNCTION_8_17(a1, a2);
  *(_WORD *)(v2 + 8) = NavigationSwipeEvent.flavor.getter();
  return sub_26087071C;
}

uint64_t sub_26087071C()
{
  return OUTLINED_FUNCTION_2_43();
}

uint64_t sub_260870730@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = NavigationSwipeEvent.init(event:)(a1);
  *a2 = result;
  return result;
}

void sub_260870758(uint64_t a1@<X8>)
{
  *(double *)a1 = NavigationSwipeEvent.delta.getter();
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
}

uint64_t sub_260870788()
{
  return NavigationSwipeEvent.delta.setter();
}

uint64_t NavigationSwipeEvent.delta.setter()
{
  OUTLINED_FUNCTION_9_24();
  IOHIDEventSetFloatValue();
  IOHIDEventSetFloatValue();
  return IOHIDEventSetFloatValue();
}

uint64_t (*NavigationSwipeEvent.delta.modify(void *a1, uint64_t a2))()
{
  a1[3] = a2;
  IOHIDEventGetFloatValue();
  uint64_t v4 = v3;
  IOHIDEventGetFloatValue();
  uint64_t v6 = v5;
  IOHIDEventGetFloatValue();
  *a1 = v4;
  a1[1] = v6;
  a1[2] = v7;
  return sub_260870890;
}

uint64_t sub_260870890()
{
  IOHIDEventSetFloatValue();
  IOHIDEventSetFloatValue();
  return IOHIDEventSetFloatValue();
}

uint64_t sub_260870904(uint64_t a1)
{
  OUTLINED_FUNCTION_3_3(a1);
  uint64_t result = NavigationSwipeEvent.x.getter();
  *double v1 = v3;
  return result;
}

uint64_t sub_26087092C()
{
  return NavigationSwipeEvent.x.setter();
}

uint64_t sub_260870938(uint64_t a1)
{
  OUTLINED_FUNCTION_3_3(a1);
  uint64_t result = NavigationSwipeEvent.y.getter();
  *double v1 = v3;
  return result;
}

uint64_t sub_260870960()
{
  return NavigationSwipeEvent.y.setter();
}

uint64_t sub_26087096C(uint64_t a1)
{
  OUTLINED_FUNCTION_3_3(a1);
  uint64_t result = NavigationSwipeEvent.z.getter();
  *double v1 = v3;
  return result;
}

uint64_t sub_260870994()
{
  return NavigationSwipeEvent.z.setter();
}

uint64_t sub_2608709A0(uint64_t a1)
{
  OUTLINED_FUNCTION_3_3(a1);
  uint64_t result = NavigationSwipeEvent.progress.getter();
  *double v1 = v3;
  return result;
}

uint64_t sub_2608709C8()
{
  return NavigationSwipeEvent.progress.setter();
}

unint64_t sub_2608709D4(uint64_t a1)
{
  OUTLINED_FUNCTION_3_3(a1);
  unint64_t result = NavigationSwipeEvent.swipeMask.getter();
  *double v1 = result;
  return result;
}

uint64_t sub_2608709FC()
{
  return NavigationSwipeEvent.swipeMask.setter();
}

unint64_t sub_260870A08(uint64_t a1)
{
  OUTLINED_FUNCTION_3_3(a1);
  unint64_t result = NavigationSwipeEvent.gestureMotion.getter();
  *double v1 = result;
  return result;
}

uint64_t sub_260870A30()
{
  return NavigationSwipeEvent.gestureMotion.setter();
}

unint64_t sub_260870A3C(uint64_t a1)
{
  OUTLINED_FUNCTION_3_3(a1);
  unint64_t result = NavigationSwipeEvent.flavor.getter();
  *double v1 = result;
  return result;
}

uint64_t sub_260870A64()
{
  return NavigationSwipeEvent.flavor.setter();
}

ValueMetadata *type metadata accessor for NavigationSwipeEvent()
{
  return &type metadata for NavigationSwipeEvent;
}

uint64_t OUTLINED_FUNCTION_0_43()
{
  return IOHIDEventSetFloatValue();
}

uint64_t OUTLINED_FUNCTION_1_43()
{
  return IOHIDEventGetFloatValue();
}

uint64_t OUTLINED_FUNCTION_2_43()
{
  return IOHIDEventSetIntegerValue();
}

uint64_t OUTLINED_FUNCTION_6_30()
{
  return IOHIDEventSetIntegerValue();
}

unint64_t OUTLINED_FUNCTION_7_25()
{
  return sub_260839474();
}

uint64_t sub_260870AC4(uint64_t a1, uint64_t a2)
{
  return sub_260870AE4(a1, a2, 47, 0);
}

uint64_t sub_260870AE4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v6 = sub_26087B2E0();
  inactive = dispatch_workloop_create_inactive((const char *)(v6 + 32));
  uint64_t result = swift_release();
  if (a4) {
    goto LABEL_5;
  }
  if (a3 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (a3 <= 0x7FFFFFFF)
  {
    dispatch_workloop_set_scheduler_priority();
LABEL_5:
    dispatch_activate(inactive);
    return (uint64_t)inactive;
  }
  __break(1u);
  return result;
}

unsigned char *ScrollGesture.__allocating_init(useRemoteAcceleration:dispatchScrollEvents:)(char a1, char a2)
{
  uint64_t result = (unsigned char *)swift_allocObject();
  result[19] = 0;
  result[16] = 0;
  result[17] = a1;
  result[18] = a2;
  return result;
}

void ScrollGesture.platform.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

uint64_t ScrollGesture.useRemoteAcceleration.getter()
{
  return *(unsigned __int8 *)(v0 + 17);
}

uint64_t ScrollGesture.dispatchScrollEvents.getter()
{
  return *(unsigned __int8 *)(v0 + 18);
}

unsigned char *ScrollGesture.__allocating_init(platform:useRemoteAcceleration:dispatchScrollEvents:)(char *a1, char a2, char a3)
{
  uint64_t result = (unsigned char *)swift_allocObject();
  char v7 = *a1;
  result[19] = 0;
  result[16] = v7;
  result[17] = a2;
  result[18] = a3;
  return result;
}

unsigned char *ScrollGesture.init(platform:useRemoteAcceleration:dispatchScrollEvents:)(char *a1, char a2, char a3)
{
  char v4 = *a1;
  v3[19] = 0;
  v3[16] = v4;
  v3[17] = a2;
  v3[18] = a3;
  return v3;
}

uint64_t ScrollGesture.dispatch(report:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = *(unsigned __int8 *)(v2 + 16);
  uint64_t result = sub_2607DCED0(a1, a2);
  if (v4 == 1)
  {
    if (qword_26A8B4510 != -1) {
      swift_once();
    }
    if ((qword_26A8B4CD0 & 0x8000000000000000) == 0)
    {
      OUTLINED_FUNCTION_0_44();
      OUTLINED_FUNCTION_2_44();
      sub_2607E6884(v4, v3);
      OUTLINED_FUNCTION_3_37();
      uint64_t v6 = OUTLINED_FUNCTION_1_44();
      char v10 = sub_260870D60(v6, v7, v8, v9);
LABEL_9:
      char v16 = v10;
      uint64_t v17 = v11;
      sub_2607DCF28(v4, v3);
      *(unsigned char *)(v2 + 19) = v16;
      return v17;
    }
    __break(1u);
  }
  else if (qword_26A8B4510 == -1)
  {
    goto LABEL_7;
  }
  uint64_t result = swift_once();
LABEL_7:
  if ((qword_26A8B4CD0 & 0x8000000000000000) == 0)
  {
    OUTLINED_FUNCTION_0_44();
    OUTLINED_FUNCTION_2_44();
    sub_2607E6884(v4, v3);
    OUTLINED_FUNCTION_3_37();
    uint64_t v12 = OUTLINED_FUNCTION_1_44();
    char v10 = sub_260870FA0(v12, v13, v14, v15);
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

uint64_t sub_260870D60(uint64_t a1, unint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8 = a4 & 1;
  if ((sub_2607DB19C(0, a1, a2) & 0x8F) != 0 || sub_2607DB19C(8, a1, a2))
  {
    char v9 = sub_2607DB19C(0, a1, a2);
    int v10 = v9;
    char v11 = v9 & 0x8F;
    char v12 = sub_2607DB19C(8, a1, a2);
    switch(*(unsigned char *)(v4 + 19))
    {
      case 1:
        if ((v10 & 8) != 0) {
          goto LABEL_12;
        }
        if ((v10 & 4) != 0) {
          goto LABEL_21;
        }
        goto LABEL_6;
      case 2:
        if ((v10 & 8) != 0) {
          goto LABEL_12;
        }
        if ((v10 & 4) != 0)
        {
LABEL_21:
          uint64_t v15 = 4;
          goto LABEL_22;
        }
        if ((v10 & 2) == 0)
        {
LABEL_12:
          uint64_t v15 = 8;
          goto LABEL_22;
        }
        uint64_t v17 = 0x2000000;
        goto LABEL_30;
      case 3:
        if ((v12 & 0x10) != 0 || (v12 & 4) != 0 || (v12 & 1) == 0)
        {
          uint64_t v18 = sub_26087121C();
          goto LABEL_24;
        }
        char v20 = 1;
        goto LABEL_32;
      default:
LABEL_6:
        if (v10 < 0 && !v12)
        {
          uint64_t v13 = sub_2608712C4(0x80000000, a1, a2, a3, v8);
          uint64_t v14 = 1;
          break;
        }
        if ((v10 & 1) == 0 || v12)
        {
          if (v11) {
            return 0;
          }
          if ((v12 & 2) != 0 && *(unsigned char *)(v4 + 16) == 1)
          {
            char v20 = 2;
LABEL_32:
            uint64_t v13 = sub_2608712A8(v20, a1, a2);
            uint64_t v14 = 3;
            break;
          }
          if ((v12 & 0x10) == 0 || *(unsigned char *)(v4 + 16) == 1) {
            return 0;
          }
          uint64_t v15 = 0;
LABEL_22:
          uint64_t v18 = sub_2608710EC(v15, a3, v8);
LABEL_24:
          uint64_t v13 = v18;
          uint64_t v14 = 0;
        }
        else
        {
          uint64_t v17 = 0x1000000;
LABEL_30:
          uint64_t v13 = sub_2608712C4(v17, a1, a2, a3, v8);
          uint64_t v14 = 2;
        }
        break;
    }
  }
  else
  {
    uint64_t v14 = *(unsigned __int8 *)(v4 + 19);
    int v16 = HIDEventPhase.init(rawValue:)(0);
    uint64_t v13 = sub_2608712C4((v16 & 0xFFFFFF8F) << 24, a1, a2, a3, v8);
  }
  sub_26082E008(v13);
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_260870FA0(uint64_t a1, unint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = sub_260870D60(a1, a2, a3, a4 & 1);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 + 16);
  if (v7)
  {
    uint64_t v8 = mach_absolute_time();
    char v9 = (void *)PointerEvent.init(time:point:buttonMask:oldButtonMask:flags:)(v8, 0, 0);
    uint64_t v10 = v6 + 32;
    do
    {
      sub_2607E2A1C(v10, (uint64_t)v17);
      uint64_t v11 = v18;
      uint64_t v12 = v19;
      __swift_project_boxed_opaque_existential_1(v17, v18);
      id v13 = v9;
      uint64_t v14 = (void *)HIDEventProtocol.bridgedValue.getter(v11, v12);
      IOHIDEventAppendEvent();

      __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
      v10 += 40;
      --v7;
    }
    while (v7);
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B4588);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_26087C870;
    *(void *)(v15 + 56) = &type metadata for PointerEvent;
    *(void *)(v15 + 64) = &protocol witness table for PointerEvent;
    *(void *)(v15 + 32) = v13;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t sub_2608710EC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  mach_absolute_time();
  uint64_t ScrollEvent = IOHIDEventCreateScrollEvent();
  if ((a3 & 1) == 0 && a2)
  {
    uint64_t v13 = a2;
    uint64_t v6 = sub_2607E67C8((uint64_t)&v13, (uint64_t)&v14);
    unint64_t v8 = v7;
    sub_2607DCED0(v6, v7);
    uint64_t v9 = mach_absolute_time();
    uint64_t v10 = sub_2607E64B4(v9, 16973568, 0, v6, v8, 0);
    IOHIDEventAppendEvent();

    sub_2607DCF28(v6, v8);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B5770);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_26087C870;
  *(void *)(v11 + 32) = ScrollEvent;
  uint64_t v13 = v11;
  sub_26087B400();
  return v13;
}

uint64_t sub_26087121C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B5770);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_26087C870;
  mach_absolute_time();
  *(void *)(v0 + 32) = IOHIDEventCreateScrollEvent();
  sub_26087B400();
  return v0;
}

uint64_t sub_2608712A8(char a1, uint64_t a2, uint64_t a3)
{
  return sub_2608712C4(((a1 & 0x18) << 6) | ((a1 & 7) << 28), a2, a3, 0, 1);
}

#error "260871450: call analysis failed (funcsize=165)"

uint64_t ScrollGesture.deinit()
{
  return v0;
}

uint64_t ScrollGesture.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 20, 7);
}

uint64_t sub_260871578(uint64_t a1)
{
  return ScrollGesture.dispatch(report:)(*(void *)a1, *(void *)(a1 + 8));
}

_UNKNOWN **sub_2608715A4()
{
  return &protocol witness table for ScrollReport;
}

_UNKNOWN **sub_2608715B0()
{
  return &protocol witness table for ScrollReport;
}

uint64_t type metadata accessor for ScrollGesture()
{
  return self;
}

uint64_t method lookup function for ScrollGesture(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ScrollGesture);
}

uint64_t dispatch thunk of ScrollGesture.__allocating_init(platform:useRemoteAcceleration:dispatchScrollEvents:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

unsigned char *storeEnumTagSinglePayload for ScrollGesture.State(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2608716D8);
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

ValueMetadata *type metadata accessor for ScrollGesture.State()
{
  return &type metadata for ScrollGesture.State;
}

unint64_t sub_260871714()
{
  unint64_t result = qword_26A8B5768;
  if (!qword_26A8B5768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5768);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_44()
{
  return sub_26087AFC0();
}

uint64_t OUTLINED_FUNCTION_1_44()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_2_44()
{
  return sub_2607DCF28(v1, v0);
}

uint64_t OUTLINED_FUNCTION_3_37()
{
  return ScrollReport.remoteTimestamp.getter(v1, v0);
}

uint64_t ZoomToggleGesture.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t static ZoomToggleEvent.dispatch(report:)()
{
  return ZoomToggleGesture.dispatch(report:)();
}

uint64_t ZoomToggleGesture.dispatch(report:)()
{
  mach_absolute_time();
  ZoomToggleEvent = (void *)IOHIDEventCreateZoomToggleEvent();
  uint64_t v1 = mach_absolute_time();
  uint64_t v2 = DigitizerEvent.init(time:digitizerType:digitizerEventMask:generationCount:index:identity:point:range:touch:flags:)(v1, 3, 0, 0, 0, 0);
  IOHIDEventAppendEvent();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B4588);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_26087C870;
  *(void *)(v3 + 56) = &type metadata for DigitizerEvent;
  *(void *)(v3 + 64) = &protocol witness table for DigitizerEvent;
  *(void *)(v3 + 32) = v2;

  return v3;
}

uint64_t ZoomToggleGesture.init()()
{
  return v0;
}

uint64_t type metadata accessor for ZoomToggleGesture()
{
  return self;
}

uint64_t ZoomToggleGesture.deinit()
{
  return v0;
}

uint64_t ZoomToggleGesture.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

_UNKNOWN **sub_26087192C()
{
  return &protocol witness table for ZoomToggleReport;
}

_UNKNOWN **sub_260871938()
{
  return &protocol witness table for ZoomToggleReport;
}

uint64_t sub_260871944()
{
  return ZoomToggleGesture.dispatch(report:)();
}

uint64_t method lookup function for ZoomToggleGesture(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ZoomToggleGesture);
}

uint64_t dispatch thunk of ZoomToggleGesture.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of HIDServiceFilterProtocol.init(service:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of HIDServiceFilterProtocol.activate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of HIDServiceFilterProtocol.cancel()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of HIDServiceFilterProtocol._clientNotification(_:added:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of static HIDServiceFilterProtocol._match(_:options:score:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 40))();
}

uint64_t dispatch thunk of HIDServiceFilterProtocol._property(forKey:client:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 48))();
}

uint64_t dispatch thunk of HIDServiceFilterProtocol._setProperty(_:forKey:client:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 56))();
}

uint64_t dispatch thunk of HIDServiceFilterProtocol.filterEvent(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of HIDServiceFilterProtocol._filterEvent(matching:event:forClient:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 72))();
}

uint64_t dispatch thunk of HIDServiceFilterProtocol.setCancelHandler(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 80))();
}

uint64_t dispatch thunk of HIDServiceFilterProtocol.setDispatchQueue(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

uint64_t dispatch thunk of HIDServiceFilterProtocol.setEventDispatcher(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 96))();
}

uint64_t GameControllerReport.init(gameControllerEvent:)(void *a1)
{
  if (qword_26A8B4570 != -1) {
LABEL_24:
  }
    swift_once();
  long long v191 = xmmword_26A8B5778;
  uint64_t v2 = HIDReportDescriptor.reportBitCount(for:)(0x12u);
  uint64_t v3 = (long long *)HIDReport.init(bitCount:id:)(v2, 18);
  unint64_t v5 = v4;
  *(void *)&long long v191 = v3;
  *((void *)&v191 + 1) = v4;
  GameControllerEvent.controllerType.getter();
  uint64_t v6 = 0;
  switch(v5 >> 62)
  {
    case 1uLL:
      goto LABEL_12;
    case 2uLL:
      uint64_t v20 = *((void *)v3 + 2);
      goto LABEL_14;
    default:
      break;
  }
LABEL_3:
  if (__OFADD__(v6, 8)) {
    goto LABEL_32;
  }
  uint64_t v3 = &v191;
  sub_26087AFD0();
  uint64_t DoubleValue = IOHIDEventGetDoubleValue();
  OUTLINED_FUNCTION_3_18(DoubleValue, v8, v9, v10, v11, v12, v13, v14, v191, *((uint64_t *)&v191 + 1), v192, v193, v194, v195, v196, v197, v198, v199, v200,
    vars0,
    vars8);
  unint64_t v15 = 24;
  OUTLINED_FUNCTION_9_25();
  while (2)
  {
    OUTLINED_FUNCTION_8_27();
    uint64_t v16 = 0;
    switch(v17)
    {
      case 1:
      case 2:
        OUTLINED_FUNCTION_7_26();
        if (v19)
        {
          uint64_t v16 = 8 * v18;
LABEL_6:
          if (__OFADD__(v16, v15)) {
            goto LABEL_33;
          }
          OUTLINED_FUNCTION_3_38();
          v15 -= 8;
          if (v15 <= 8) {
            goto LABEL_16;
          }
          continue;
        }
        __break(1u);
LABEL_12:
        uint64_t v20 = (int)v3;
LABEL_14:
        if ((unint64_t)(v20 - 0x1000000000000000) >> 61 == 7)
        {
LABEL_69:
          uint64_t v6 = 8 * v20;
          goto LABEL_3;
        }
        __break(1u);
LABEL_16:
        uint64_t v21 = IOHIDEventGetDoubleValue();
        OUTLINED_FUNCTION_3_18(v21, v22, v23, v24, v25, v26, v27, v28, v191, *((uint64_t *)&v191 + 1), v192, v193, v194, v195, v196, v197, v198, v199, v200,
          vars0,
          vars8);
        unint64_t v29 = 24;
        OUTLINED_FUNCTION_9_25();
        while (2)
        {
          OUTLINED_FUNCTION_8_27();
          uint64_t v30 = 0;
          switch(v31)
          {
            case 1:
            case 2:
              OUTLINED_FUNCTION_7_26();
              if (!v19)
              {
                __break(1u);
                goto LABEL_24;
              }
              uint64_t v30 = 8 * v32;
LABEL_18:
              if (__OFADD__(v30, v29 + 16)) {
                goto LABEL_42;
              }
              OUTLINED_FUNCTION_3_38();
              v29 -= 8;
              if (v29 > 8) {
                continue;
              }
              uint64_t v33 = IOHIDEventGetDoubleValue();
              OUTLINED_FUNCTION_3_18(v33, v34, v35, v36, v37, v38, v39, v40, v191, *((uint64_t *)&v191 + 1), v192, v193, v194, v195, v196, v197, v198, v199, v200,
                vars0,
                vars8);
              OUTLINED_FUNCTION_9_25();
              break;
            default:
              goto LABEL_18;
          }
          break;
        }
        while (2)
        {
          OUTLINED_FUNCTION_8_27();
          uint64_t v41 = 0;
          switch(v42)
          {
            case 1:
            case 2:
              OUTLINED_FUNCTION_7_26();
              if (v19)
              {
                uint64_t v41 = 8 * v44;
LABEL_26:
                if (__OFADD__(v41, 56)) {
                  goto LABEL_51;
                }
                OUTLINED_FUNCTION_3_38();
                OUTLINED_FUNCTION_4_21();
                if (!(!v43 & v19)) {
                  goto LABEL_34;
                }
                continue;
              }
              __break(1u);
LABEL_32:
              __break(1u);
LABEL_33:
              __break(1u);
LABEL_34:
              uint64_t v45 = IOHIDEventGetDoubleValue();
              OUTLINED_FUNCTION_3_18(v45, v46, v47, v48, v49, v50, v51, v52, v191, *((uint64_t *)&v191 + 1), v192, v193, v194, v195, v196, v197, v198, v199, v200,
                vars0,
                vars8);
              OUTLINED_FUNCTION_9_25();
              while (2)
              {
                OUTLINED_FUNCTION_8_27();
                uint64_t v53 = 0;
                switch(v54)
                {
                  case 1:
                  case 2:
                    OUTLINED_FUNCTION_7_26();
                    if (v19)
                    {
                      uint64_t v53 = 8 * v55;
LABEL_36:
                      if (__OFADD__(v53, 72)) {
                        goto LABEL_60;
                      }
                      OUTLINED_FUNCTION_3_38();
                      OUTLINED_FUNCTION_4_21();
                      if (!(!v43 & v19)) {
                        goto LABEL_43;
                      }
                      continue;
                    }
                    __break(1u);
LABEL_42:
                    __break(1u);
LABEL_43:
                    IOHIDEventGetDoubleValue();
                    uint64_t v56 = IOHIDEventGetDoubleValue();
                    OUTLINED_FUNCTION_3_18(v56, v57, v58, v59, v60, v61, v62, v63, v191, *((uint64_t *)&v191 + 1), v192, v193, v194, v195, v196, v197, v198, v199, v200,
                      vars0,
                      vars8);
                    OUTLINED_FUNCTION_9_25();
                    while (2)
                    {
                      OUTLINED_FUNCTION_8_27();
                      uint64_t v64 = 0;
                      switch(v65)
                      {
                        case 1:
                        case 2:
                          OUTLINED_FUNCTION_7_26();
                          if (!v19)
                          {
                            __break(1u);
LABEL_51:
                            __break(1u);
LABEL_52:
                            IOHIDEventGetDoubleValue();
                            uint64_t v67 = IOHIDEventGetDoubleValue();
                            OUTLINED_FUNCTION_3_18(v67, v68, v69, v70, v71, v72, v73, v74, v191, *((uint64_t *)&v191 + 1), v192, v193, v194, v195, v196, v197, v198, v199, v200,
                              vars0,
                              vars8);
                            OUTLINED_FUNCTION_9_25();
                            while (1)
                            {
                              OUTLINED_FUNCTION_8_27();
                              uint64_t v75 = 0;
                              switch(v76)
                              {
                                case 1:
                                case 2:
                                  OUTLINED_FUNCTION_7_26();
                                  if (!v19)
                                  {
                                    __break(1u);
LABEL_60:
                                    __break(1u);
LABEL_61:
                                    IOHIDEventGetDoubleValue();
                                    uint64_t v78 = IOHIDEventGetDoubleValue();
                                    OUTLINED_FUNCTION_3_18(v78, v79, v80, v81, v82, v83, v84, v85, v191, *((uint64_t *)&v191 + 1), v192, v193, v194, v195, v196, v197, v198, v199, v200,
                                      vars0,
                                      vars8);
                                    OUTLINED_FUNCTION_9_25();
                                    while (1)
                                    {
                                      OUTLINED_FUNCTION_8_27();
                                      uint64_t v86 = 0;
                                      switch(v87)
                                      {
                                        case 1:
                                        case 2:
                                          OUTLINED_FUNCTION_7_26();
                                          if (!v19)
                                          {
                                            __break(1u);
                                            goto LABEL_69;
                                          }
                                          uint64_t v86 = 8 * v88;
LABEL_63:
                                          if (__OFADD__(v86, 120))
                                          {
                                            __break(1u);
LABEL_82:
                                            __break(1u);
                                            JUMPOUT(0x26087212CLL);
                                          }
                                          OUTLINED_FUNCTION_3_38();
                                          OUTLINED_FUNCTION_4_21();
                                          if (!(!v43 & v19)) {
                                            goto LABEL_71;
                                          }
                                          break;
                                        default:
                                          goto LABEL_63;
                                      }
                                    }
                                  }
                                  uint64_t v75 = 8 * v77;
LABEL_54:
                                  if (__OFADD__(v75, 104)) {
                                    goto LABEL_79;
                                  }
                                  OUTLINED_FUNCTION_3_38();
                                  OUTLINED_FUNCTION_4_21();
                                  if (!(!v43 & v19)) {
                                    goto LABEL_61;
                                  }
                                  break;
                                default:
                                  goto LABEL_54;
                              }
                            }
                          }
                          uint64_t v64 = 8 * v66;
LABEL_45:
                          if (!__OFADD__(v64, 88))
                          {
                            OUTLINED_FUNCTION_3_38();
                            OUTLINED_FUNCTION_4_21();
                            if (!(!v43 & v19)) {
                              goto LABEL_52;
                            }
                            continue;
                          }
                          __break(1u);
LABEL_71:
                          IOHIDEventGetDoubleValue();
                          uint64_t v89 = IOHIDEventGetDoubleValue();
                          OUTLINED_FUNCTION_3_18(v89, v90, v91, v92, v93, v94, v95, v96, v191, *((uint64_t *)&v191 + 1), v192, v193, v194, v195, v196, v197, v198, v199, v200,
                            vars0,
                            vars8);
                          OUTLINED_FUNCTION_9_25();
                          while (2)
                          {
                            OUTLINED_FUNCTION_8_27();
                            uint64_t v97 = 0;
                            switch(v98)
                            {
                              case 1:
                              case 2:
                                OUTLINED_FUNCTION_7_26();
                                if (v19)
                                {
                                  uint64_t v97 = 8 * v99;
LABEL_73:
                                  if (__OFADD__(v97, 136)) {
                                    goto LABEL_82;
                                  }
                                  OUTLINED_FUNCTION_3_38();
                                  OUTLINED_FUNCTION_4_21();
                                  if (!(!v43 & v19)) {
                                    goto LABEL_80;
                                  }
                                  continue;
                                }
                                __break(1u);
LABEL_79:
                                __break(1u);
LABEL_80:
                                uint64_t v100 = IOHIDEventGetDoubleValue();
                                OUTLINED_FUNCTION_3_18(v100, v101, v102, v103, v104, v105, v106, v107, v191, *((uint64_t *)&v191 + 1), v192, v193, v194, v195, v196, v197, v198, v199, v200,
                                  vars0,
                                  vars8);
                                _s12UniversalHID9HIDReportV_2ass5Int16VSi_AFmtcis_0(v108, 176);
                                uint64_t v109 = IOHIDEventGetDoubleValue();
                                OUTLINED_FUNCTION_3_18(v109, v110, v111, v112, v113, v114, v115, v116, v191, *((uint64_t *)&v191 + 1), v192, v193, v194, v195, v196, v197, v198, v199, v200,
                                  vars0,
                                  vars8);
                                _s12UniversalHID9HIDReportV_2ass5Int16VSi_AFmtcis_0(v117, 192);
                                uint64_t v118 = IOHIDEventGetDoubleValue();
                                OUTLINED_FUNCTION_3_18(v118, v119, v120, v121, v122, v123, v124, v125, v191, *((uint64_t *)&v191 + 1), v192, v193, v194, v195, v196, v197, v198, v199, v200,
                                  vars0,
                                  vars8);
                                _s12UniversalHID9HIDReportV_2ass5Int16VSi_AFmtcis_0(v126, 144);
                                uint64_t v127 = IOHIDEventGetDoubleValue();
                                OUTLINED_FUNCTION_3_18(v127, v128, v129, v130, v131, v132, v133, v134, v191, *((uint64_t *)&v191 + 1), v192, v193, v194, v195, v196, v197, v198, v199, v200,
                                  vars0,
                                  vars8);
                                _s12UniversalHID9HIDReportV_2ass5Int16VSi_AFmtcis_0(v135, 160);
                                uint64_t v136 = IOHIDEventGetDoubleValue();
                                OUTLINED_FUNCTION_3_18(v136, v137, v138, v139, v140, v141, v142, v143, v191, *((uint64_t *)&v191 + 1), v192, v193, v194, v195, v196, v197, v198, v199, v200,
                                  vars0,
                                  vars8);
                                _s12UniversalHID9HIDReportV_2ass5Int16VSi_AFmtcis_0(v144, 208);
                                uint64_t v145 = IOHIDEventGetDoubleValue();
                                OUTLINED_FUNCTION_3_18(v145, v146, v147, v148, v149, v150, v151, v152, v191, *((uint64_t *)&v191 + 1), v192, v193, v194, v195, v196, v197, v198, v199, v200,
                                  vars0,
                                  vars8);
                                _s12UniversalHID9HIDReportV_2ass5Int16VSi_AFmtcis_0(v153, 224);
                                uint64_t v154 = IOHIDEventGetDoubleValue();
                                OUTLINED_FUNCTION_3_18(v154, v155, v156, v157, v158, v159, v160, v161, v191, *((uint64_t *)&v191 + 1), v192, v193, v194, v195, v196, v197, v198, v199, v200,
                                  vars0,
                                  vars8);
                                _s12UniversalHID9HIDReportV_2ass5Int16VSi_AFmtcis_0(v162, 240);
                                uint64_t v163 = IOHIDEventGetDoubleValue();
                                OUTLINED_FUNCTION_3_18(v163, v164, v165, v166, v167, v168, v169, v170, v191, *((uint64_t *)&v191 + 1), v192, v193, v194, v195, v196, v197, v198, v199, v200,
                                  vars0,
                                  vars8);
                                _s12UniversalHID9HIDReportV_2ass5Int16VSi_AFmtcis_0(v171, 240);
                                uint64_t v172 = IOHIDEventGetDoubleValue();
                                OUTLINED_FUNCTION_3_18(v172, v173, v174, v175, v176, v177, v178, v179, v191, *((uint64_t *)&v191 + 1), v192, v193, v194, v195, v196, v197, v198, v199, v200,
                                  vars0,
                                  vars8);
                                _s12UniversalHID9HIDReportV_2ass5Int16VSi_AFmtcis_0(v180, 272);
                                uint64_t v181 = IOHIDEventGetDoubleValue();
                                OUTLINED_FUNCTION_3_18(v181, v182, v183, v184, v185, v186, v187, v188, v191, *((uint64_t *)&v191 + 1), v192, v193, v194, v195, v196, v197, v198, v199, v200,
                                  vars0,
                                  vars8);
                                _s12UniversalHID9HIDReportV_2ass5Int16VSi_AFmtcis_0(v189, 288);

                                return v191;
                              default:
                                goto LABEL_73;
                            }
                          }
                        default:
                          goto LABEL_45;
                      }
                    }
                  default:
                    goto LABEL_36;
                }
              }
            default:
              goto LABEL_26;
          }
        }
      default:
        goto LABEL_6;
    }
  }
}

unint64_t GameControllerReport.controllerType.getter()
{
  OUTLINED_FUNCTION_4_26();
  unint64_t v0 = (char)_s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcig_0();
  return HIDGameControllerType.init(rawValue:)(v0);
}

#error "260872204: call analysis failed (funcsize=12)"

#error "260872234: call analysis failed (funcsize=12)"

#error "260872264: call analysis failed (funcsize=12)"

#error "260872294: call analysis failed (funcsize=12)"

#error "2608722C4: call analysis failed (funcsize=12)"

#error "2608722F4: call analysis failed (funcsize=12)"

#error "260872324: call analysis failed (funcsize=12)"

#error "260872354: call analysis failed (funcsize=12)"

#error "260872390: call analysis failed (funcsize=20)"

#error "2608723D4: call analysis failed (funcsize=12)"

#error "260872410: call analysis failed (funcsize=20)"

#error "260872454: call analysis failed (funcsize=12)"

#error "260872484: call analysis failed (funcsize=12)"

#error "2608724B4: call analysis failed (funcsize=12)"

#error "2608724E4: call analysis failed (funcsize=12)"

#error "260872514: call analysis failed (funcsize=12)"

uint64_t static GameControllerReport.initialReportBitCount.getter()
{
  return 304;
}

uint64_t static GameControllerReport.reportID.getter()
{
  return 18;
}

uint64_t GameControllerReport.Flags.rawValue.getter()
{
  return *v0;
}

uint64_t GameControllerReport.Flags.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_260872550@<X0>(unsigned int *a1@<X0>, _DWORD *a2@<X8>)
{
  return GameControllerReport.Flags.init(rawValue:)(*a1, a2);
}

uint64_t sub_26087255C(unsigned int *a1)
{
  return sub_26087A9EC(*a1, *v1);
}

uint64_t sub_260872568@<X0>(unsigned int *a1@<X0>, _DWORD *a2@<X8>)
{
  return sub_260831100(*a1, *v2, a2);
}

uint64_t sub_260872574@<X0>(unsigned int *a1@<X0>, _DWORD *a2@<X8>)
{
  return sub_2608310F4(*a1, *v2, a2);
}

uint64_t sub_260872580(unsigned int *a1)
{
  return sub_260875A50(*a1);
}

uint64_t sub_260872588(unsigned int *a1)
{
  return sub_260875AE4(*a1);
}

uint64_t sub_260872590(unsigned int *a1)
{
  return sub_26087A9F0(*a1, *v1);
}

uint64_t sub_26087259C@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = GameControllerReport.Flags.init(rawValue:)(*a1, (_DWORD *)a2);
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

uint64_t sub_2608725C8@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = GameControllerReport.Flags.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_2608725F4()
{
  uint64_t result = sub_260872618();
  *(void *)&xmmword_26A8B5778 = result;
  *((void *)&xmmword_26A8B5778 + 1) = v1;
  return result;
}

uint64_t sub_260872618()
{
  LOBYTE(v12) = 3;
  uint64_t v12 = sub_260815298((char *)&v12, 1);
  unint64_t v13 = v0;
  uint64_t v1 = sub_260872724();
  unint64_t v3 = v2;
  sub_26087B050();
  sub_2607DCF28(v1, v3);
  uint64_t v4 = sub_2607E6724((uint64_t)&unk_270C9E090);
  unint64_t v6 = v5;
  sub_26087B050();
  sub_2607DCF28(v4, v6);
  uint64_t v7 = v12;
  unint64_t v8 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B4660);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_26087C870;
  *(void *)(inited + 56) = &type metadata for ApplicationCollection;
  *(void *)(inited + 64) = &protocol witness table for ApplicationCollection;
  *(void *)(inited + 32) = v7;
  *(void *)(inited + 40) = v8;
  sub_2607DCED0(v7, v8);
  uint64_t v10 = static HIDReportDescriptor.Builder.buildBlock(_:)(inited);
  swift_setDeallocating();
  sub_2608374F8();
  sub_2607DCF28(v7, v8);
  return v10;
}

uint64_t sub_260872724()
{
  LOBYTE(v146[0]) = 5;
  uint64_t v0 = sub_2608155C0((char *)v146, 0xFF1AuLL);
  unint64_t v84 = v1;
  uint64_t v85 = v0;
  LOBYTE(v146[0]) = 17;
  uint64_t v2 = sub_2608155C0((char *)v146, 0xE0F3uLL);
  unint64_t v115 = v3;
  uint64_t v116 = v2;
  LOBYTE(v146[0]) = 12;
  uint64_t v73 = sub_2608155C0((char *)v146, 8uLL);
  unint64_t v112 = v4;
  LOBYTE(v146[0]) = 14;
  uint64_t v71 = sub_260815298((char *)v146, 1);
  unint64_t v6 = v5;
  LOBYTE(v144[0]) = 1;
  LOBYTE(v142[0]) = 0;
  LOBYTE(v140[0]) = 0;
  *(_WORD *)&v145[3] = 0;
  *(_WORD *)&v145[1] = 0;
  Input.init(_:_:_:_:_:_:_:_:)((unsigned __int8 *)v144, v142, v140, &v145[4], &v145[3], &v145[2], &v145[1], v146);
  LOBYTE(v144[0]) = 5;
  uint64_t v7 = sub_2608155C0((char *)v144, 1uLL);
  unint64_t v93 = v8;
  uint64_t v94 = v7;
  LOBYTE(v144[0]) = 17;
  uint64_t v9 = sub_2608155C0((char *)v144, 0x90uLL);
  unint64_t v91 = v10;
  uint64_t v92 = v9;
  LOBYTE(v144[0]) = 17;
  uint64_t v11 = sub_2608155C0((char *)v144, 0x91uLL);
  unint64_t v89 = v12;
  uint64_t v90 = v11;
  LOBYTE(v144[0]) = 17;
  uint64_t v13 = sub_2608155C0((char *)v144, 0x93uLL);
  unint64_t v87 = v14;
  uint64_t v88 = v13;
  LOBYTE(v144[0]) = 17;
  uint64_t v86 = sub_2608155C0((char *)v144, 0x92uLL);
  unint64_t v139 = v15;
  LOBYTE(v144[0]) = 6;
  uint64_t v16 = sub_260815298((char *)v144, 0);
  unint64_t v137 = v17;
  uint64_t v138 = v16;
  LOBYTE(v144[0]) = 7;
  uint64_t v18 = sub_260815298((char *)v144, 1);
  unint64_t v135 = v19;
  uint64_t v136 = v18;
  LOBYTE(v144[0]) = 12;
  uint64_t v20 = sub_2608155C0((char *)v144, 0x10uLL);
  unint64_t v133 = v21;
  uint64_t v134 = v20;
  LOBYTE(v144[0]) = 14;
  uint64_t v22 = sub_260815298((char *)v144, 4);
  unint64_t v131 = v23;
  uint64_t v132 = v22;
  LOBYTE(v142[0]) = 0;
  LOBYTE(v140[0]) = 1;
  memset(v145, 0, sizeof(v145));
  Input.init(_:_:_:_:_:_:_:_:)((unsigned __int8 *)v142, v140, &v145[4], &v145[3], &v145[2], &v145[1], v145, v144);
  LOBYTE(v142[0]) = 17;
  uint64_t v130 = sub_2608155C0((char *)v142, 4uLL);
  unint64_t v129 = v24;
  LOBYTE(v142[0]) = 6;
  uint64_t v128 = sub_260815298((char *)v142, 0);
  unint64_t v127 = v25;
  LOBYTE(v142[0]) = 7;
  uint64_t v26 = sub_260815298((char *)v142, 1);
  unint64_t v125 = v27;
  uint64_t v126 = v26;
  LOBYTE(v142[0]) = 12;
  uint64_t v28 = sub_2608155C0((char *)v142, 0x10uLL);
  unint64_t v123 = v29;
  uint64_t v124 = v28;
  LOBYTE(v142[0]) = 14;
  uint64_t v30 = sub_260815298((char *)v142, 4);
  unint64_t v121 = v31;
  uint64_t v122 = v30;
  LOBYTE(v140[0]) = 0;
  v145[4] = 1;
  *(_WORD *)&v145[2] = 0;
  *(_WORD *)uint64_t v145 = 0;
  char v143 = 0;
  Input.init(_:_:_:_:_:_:_:_:)((unsigned __int8 *)v140, &v145[4], &v145[3], &v145[2], &v145[1], v145, &v143, v142);
  LOBYTE(v140[0]) = 5;
  uint64_t v32 = sub_2608155C0((char *)v140, 9uLL);
  unint64_t v119 = v33;
  uint64_t v120 = v32;
  LOBYTE(v140[0]) = 17;
  uint64_t v34 = sub_2608155C0((char *)v140, 1uLL);
  unint64_t v117 = v35;
  uint64_t v118 = v34;
  LOBYTE(v140[0]) = 17;
  uint64_t v36 = sub_2608155C0((char *)v140, 2uLL);
  unint64_t v113 = v37;
  uint64_t v114 = v36;
  LOBYTE(v140[0]) = 17;
  uint64_t v38 = sub_2608155C0((char *)v140, 3uLL);
  unint64_t v110 = v39;
  uint64_t v111 = v38;
  LOBYTE(v140[0]) = 17;
  uint64_t v40 = sub_2608155C0((char *)v140, 4uLL);
  unint64_t v108 = v41;
  uint64_t v109 = v40;
  LOBYTE(v140[0]) = 17;
  uint64_t v42 = sub_2608155C0((char *)v140, 5uLL);
  unint64_t v106 = v43;
  uint64_t v107 = v42;
  LOBYTE(v140[0]) = 17;
  uint64_t v44 = sub_2608155C0((char *)v140, 6uLL);
  unint64_t v104 = v45;
  uint64_t v105 = v44;
  LOBYTE(v140[0]) = 17;
  uint64_t v46 = sub_2608155C0((char *)v140, 7uLL);
  unint64_t v102 = v47;
  uint64_t v103 = v46;
  LOBYTE(v140[0]) = 17;
  uint64_t v48 = sub_2608155C0((char *)v140, 8uLL);
  unint64_t v100 = v49;
  uint64_t v101 = v48;
  LOBYTE(v140[0]) = 17;
  uint64_t v50 = sub_2608155C0((char *)v140, 9uLL);
  unint64_t v98 = v51;
  uint64_t v99 = v50;
  LOBYTE(v140[0]) = 17;
  uint64_t v52 = sub_2608155C0((char *)v140, 0xAuLL);
  unint64_t v96 = v53;
  uint64_t v97 = v52;
  LOBYTE(v140[0]) = 6;
  uint64_t v95 = sub_260815298((char *)v140, 0);
  unint64_t v83 = v54;
  LOBYTE(v140[0]) = 7;
  uint64_t v55 = sub_260815298((char *)v140, 1);
  unint64_t v81 = v56;
  uint64_t v82 = v55;
  LOBYTE(v140[0]) = 12;
  uint64_t v57 = sub_2608155C0((char *)v140, 0x10uLL);
  unint64_t v79 = v58;
  uint64_t v80 = v57;
  LOBYTE(v140[0]) = 14;
  uint64_t v59 = sub_260815298((char *)v140, 10);
  unint64_t v77 = v60;
  uint64_t v78 = v59;
  *(_WORD *)&v145[3] = 1;
  *(_WORD *)&v145[1] = 0;
  v145[0] = 0;
  char v143 = 0;
  char v141 = 0;
  Input.init(_:_:_:_:_:_:_:_:)(&v145[4], &v145[3], &v145[2], &v145[1], v145, &v143, &v141, v140);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B4660);
  uint64_t v61 = swift_allocObject();
  *(_OWORD *)(v61 + 16) = xmmword_260883600;
  *(void *)(v61 + 56) = &type metadata for ReportID;
  *(void *)(v61 + 64) = &protocol witness table for ReportID;
  *(unsigned char *)(v61 + 32) = 18;
  *(void *)(v61 + 96) = &type metadata for UsagePage;
  *(void *)(v61 + 104) = &protocol witness table for UsagePage;
  *(void *)(v61 + 72) = v85;
  *(void *)(v61 + 80) = v84;
  *(void *)(v61 + 136) = &type metadata for Usage;
  *(void *)(v61 + 144) = &protocol witness table for Usage;
  *(void *)(v61 + 112) = v116;
  *(void *)(v61 + 120) = v115;
  *(void *)(v61 + 176) = &type metadata for ReportSize;
  *(void *)(v61 + 184) = &protocol witness table for ReportSize;
  *(void *)(v61 + 152) = v73;
  *(void *)(v61 + 160) = v112;
  *(void *)(v61 + 216) = &type metadata for ReportCount;
  *(void *)(v61 + 224) = &protocol witness table for ReportCount;
  *(void *)(v61 + 192) = v71;
  *(void *)(v61 + 200) = v6;
  *(void *)(v61 + 936) = &type metadata for UsagePage;
  *(void *)(v61 + 296) = &type metadata for UsagePage;
  *(void *)(v61 + 304) = &protocol witness table for UsagePage;
  *(void *)(v61 + 336) = &type metadata for Usage;
  *(void *)(v61 + 344) = &protocol witness table for Usage;
  *(void *)(v61 + 376) = &type metadata for Usage;
  *(void *)(v61 + 384) = &protocol witness table for Usage;
  *(void *)(v61 + 416) = &type metadata for Usage;
  *(void *)(v61 + 424) = &protocol witness table for Usage;
  *(void *)(v61 + 456) = &type metadata for Usage;
  *(void *)(v61 + 464) = &protocol witness table for Usage;
  *(void *)(v61 + 944) = &protocol witness table for UsagePage;
  *(void *)(v61 + 696) = &type metadata for Usage;
  *(void *)(v61 + 976) = &type metadata for Usage;
  *(void *)(v61 + 1016) = &type metadata for Usage;
  *(void *)(v61 + 1056) = &type metadata for Usage;
  *(void *)(v61 + 1096) = &type metadata for Usage;
  *(void *)(v61 + 1136) = &type metadata for Usage;
  *(void *)(v61 + 1176) = &type metadata for Usage;
  *(void *)(v61 + 1216) = &type metadata for Usage;
  *(void *)(v61 + 1256) = &type metadata for Usage;
  *(void *)(v61 + 1296) = &type metadata for Usage;
  *(void *)(v61 + 1336) = &type metadata for Usage;
  *(void *)(v61 + 496) = &type metadata for LogicalMinimum;
  *(void *)(v61 + 504) = &protocol witness table for LogicalMinimum;
  *(void *)(v61 + 704) = &protocol witness table for Usage;
  *(void *)(v61 + 736) = &type metadata for LogicalMinimum;
  *(void *)(v61 + 984) = &protocol witness table for Usage;
  *(void *)(v61 + 1024) = &protocol witness table for Usage;
  *(void *)(v61 + 1064) = &protocol witness table for Usage;
  *(void *)(v61 + 1104) = &protocol witness table for Usage;
  *(void *)(v61 + 1144) = &protocol witness table for Usage;
  *(void *)(v61 + 1184) = &protocol witness table for Usage;
  *(void *)(v61 + 1224) = &protocol witness table for Usage;
  *(void *)(v61 + 1264) = &protocol witness table for Usage;
  *(void *)(v61 + 1304) = &protocol witness table for Usage;
  *(void *)(v61 + 1344) = &protocol witness table for Usage;
  *(void *)(v61 + 1376) = &type metadata for LogicalMinimum;
  uint64_t v75 = v146[0];
  uint64_t v62 = v146[0];
  unint64_t v76 = v146[1];
  *(void *)(v61 + 744) = &protocol witness table for LogicalMinimum;
  *(void *)(v61 + 1384) = &protocol witness table for LogicalMinimum;
  *(void *)(v61 + 536) = &type metadata for LogicalMaximum;
  *(void *)(v61 + 776) = &type metadata for LogicalMaximum;
  *(void *)(v61 + 1416) = &type metadata for LogicalMaximum;
  *(void *)(v61 + 544) = &protocol witness table for LogicalMaximum;
  *(void *)(v61 + 784) = &protocol witness table for LogicalMaximum;
  *(void *)(v61 + 1424) = &protocol witness table for LogicalMaximum;
  *(void *)(v61 + 256) = &type metadata for Input;
  *(void *)(v61 + 264) = &protocol witness table for Input;
  *(void *)(v61 + 232) = v62;
  *(void *)(v61 + 240) = v76;
  *(void *)(v61 + 272) = v94;
  *(void *)(v61 + 280) = v93;
  *(void *)(v61 + 312) = v92;
  *(void *)(v61 + 320) = v91;
  *(void *)(v61 + 352) = v90;
  *(void *)(v61 + 360) = v89;
  *(void *)(v61 + 392) = v88;
  *(void *)(v61 + 400) = v87;
  *(void *)(v61 + 432) = v86;
  *(void *)(v61 + 440) = v139;
  *(void *)(v61 + 472) = v138;
  *(void *)(v61 + 480) = v137;
  *(void *)(v61 + 512) = v136;
  *(void *)(v61 + 520) = v135;
  *(void *)(v61 + 576) = &type metadata for ReportSize;
  *(void *)(v61 + 584) = &protocol witness table for ReportSize;
  *(void *)(v61 + 552) = v134;
  *(void *)(v61 + 560) = v133;
  *(void *)(v61 + 616) = &type metadata for ReportCount;
  *(void *)(v61 + 624) = &protocol witness table for ReportCount;
  *(void *)(v61 + 592) = v132;
  *(void *)(v61 + 600) = v131;
  *(void *)(v61 + 816) = &type metadata for ReportSize;
  *(void *)(v61 + 824) = &protocol witness table for ReportSize;
  *(void *)(v61 + 1456) = &type metadata for ReportSize;
  *(void *)(v61 + 1464) = &protocol witness table for ReportSize;
  uint64_t v72 = v144[0];
  uint64_t v63 = v144[0];
  unint64_t v74 = v144[1];
  *(void *)(v61 + 656) = &type metadata for Input;
  *(void *)(v61 + 664) = &protocol witness table for Input;
  *(void *)(v61 + 632) = v63;
  *(void *)(v61 + 640) = v74;
  *(void *)(v61 + 672) = v130;
  *(void *)(v61 + 680) = v129;
  *(void *)(v61 + 712) = v128;
  *(void *)(v61 + 720) = v127;
  *(void *)(v61 + 752) = v126;
  *(void *)(v61 + 760) = v125;
  *(void *)(v61 + 792) = v124;
  *(void *)(v61 + 800) = v123;
  *(void *)(v61 + 856) = &type metadata for ReportCount;
  *(void *)(v61 + 864) = &protocol witness table for ReportCount;
  *(void *)(v61 + 832) = v122;
  *(void *)(v61 + 840) = v121;
  *(void *)(v61 + 1496) = &type metadata for ReportCount;
  *(void *)(v61 + 1504) = &protocol witness table for ReportCount;
  uint64_t v69 = v142[0];
  uint64_t v64 = v142[0];
  unint64_t v70 = v142[1];
  *(void *)(v61 + 896) = &type metadata for Input;
  *(void *)(v61 + 904) = &protocol witness table for Input;
  *(void *)(v61 + 872) = v64;
  *(void *)(v61 + 880) = v70;
  *(void *)(v61 + 912) = v120;
  *(void *)(v61 + 920) = v119;
  *(void *)(v61 + 952) = v118;
  *(void *)(v61 + 960) = v117;
  *(void *)(v61 + 992) = v114;
  *(void *)(v61 + 1000) = v113;
  *(void *)(v61 + 1032) = v111;
  *(void *)(v61 + 1040) = v110;
  *(void *)(v61 + 1072) = v109;
  *(void *)(v61 + 1080) = v108;
  *(void *)(v61 + 1112) = v107;
  *(void *)(v61 + 1120) = v106;
  *(void *)(v61 + 1152) = v105;
  *(void *)(v61 + 1160) = v104;
  *(void *)(v61 + 1192) = v103;
  *(void *)(v61 + 1200) = v102;
  *(void *)(v61 + 1232) = v101;
  *(void *)(v61 + 1240) = v100;
  *(void *)(v61 + 1272) = v99;
  *(void *)(v61 + 1280) = v98;
  *(void *)(v61 + 1312) = v97;
  *(void *)(v61 + 1320) = v96;
  *(void *)(v61 + 1352) = v95;
  *(void *)(v61 + 1360) = v83;
  *(void *)(v61 + 1392) = v82;
  *(void *)(v61 + 1400) = v81;
  *(void *)(v61 + 1432) = v80;
  *(void *)(v61 + 1440) = v79;
  *(void *)(v61 + 1472) = v78;
  *(void *)(v61 + 1480) = v77;
  *(void *)(v61 + 1536) = &type metadata for Input;
  *(void *)(v61 + 1544) = &protocol witness table for Input;
  uint64_t v66 = v140[0];
  unint64_t v67 = v140[1];
  *(void *)(v61 + 1512) = v140[0];
  *(void *)(v61 + 1520) = v67;
  sub_2607DCED0(v85, v84);
  sub_2607DCED0(v116, v115);
  sub_2607DCED0(v73, v112);
  sub_2607DCED0(v71, v6);
  sub_2607DCED0(v75, v76);
  sub_2607DCED0(v94, v93);
  sub_2607DCED0(v92, v91);
  sub_2607DCED0(v90, v89);
  sub_2607DCED0(v88, v87);
  sub_2607DCED0(v86, v139);
  sub_2607DCED0(v138, v137);
  sub_2607DCED0(v136, v135);
  sub_2607DCED0(v134, v133);
  sub_2607DCED0(v132, v131);
  sub_2607DCED0(v72, v74);
  sub_2607DCED0(v130, v129);
  sub_2607DCED0(v128, v127);
  sub_2607DCED0(v126, v125);
  sub_2607DCED0(v124, v123);
  sub_2607DCED0(v122, v121);
  sub_2607DCED0(v69, v70);
  sub_2607DCED0(v120, v119);
  sub_2607DCED0(v118, v117);
  sub_2607DCED0(v114, v113);
  sub_2607DCED0(v111, v110);
  sub_2607DCED0(v109, v108);
  sub_2607DCED0(v107, v106);
  sub_2607DCED0(v105, v104);
  sub_2607DCED0(v103, v102);
  sub_2607DCED0(v101, v100);
  sub_2607DCED0(v99, v98);
  sub_2607DCED0(v97, v96);
  sub_2607DCED0(v95, v83);
  sub_2607DCED0(v82, v81);
  sub_2607DCED0(v80, v79);
  sub_2607DCED0(v78, v77);
  sub_2607DCED0(v66, v67);
  uint64_t v68 = static HIDReportDescriptor.Builder.buildBlock(_:)(v61);
  swift_setDeallocating();
  sub_2608374F8();
  sub_2607DCF28(v66, v67);
  sub_2607DCF28(v78, v77);
  sub_2607DCF28(v80, v79);
  sub_2607DCF28(v82, v81);
  sub_2607DCF28(v95, v83);
  sub_2607DCF28(v97, v96);
  sub_2607DCF28(v99, v98);
  sub_2607DCF28(v101, v100);
  sub_2607DCF28(v103, v102);
  sub_2607DCF28(v105, v104);
  sub_2607DCF28(v107, v106);
  sub_2607DCF28(v109, v108);
  sub_2607DCF28(v111, v110);
  sub_2607DCF28(v114, v113);
  sub_2607DCF28(v118, v117);
  sub_2607DCF28(v120, v119);
  sub_2607DCF28(v69, v70);
  sub_2607DCF28(v122, v121);
  sub_2607DCF28(v124, v123);
  sub_2607DCF28(v126, v125);
  sub_2607DCF28(v128, v127);
  sub_2607DCF28(v130, v129);
  sub_2607DCF28(v72, v74);
  sub_2607DCF28(v132, v131);
  sub_2607DCF28(v134, v133);
  sub_2607DCF28(v136, v135);
  sub_2607DCF28(v138, v137);
  sub_2607DCF28(v86, v139);
  sub_2607DCF28(v88, v87);
  sub_2607DCF28(v90, v89);
  sub_2607DCF28(v92, v91);
  sub_2607DCF28(v94, v93);
  sub_2607DCF28(v75, v76);
  sub_2607DCF28(v71, v6);
  sub_2607DCF28(v73, v112);
  sub_2607DCF28(v116, v115);
  sub_2607DCF28(v85, v84);
  return v68;
}

uint64_t static GameControllerReport.descriptor.getter@<X0>(_OWORD *a1@<X8>)
{
  if (qword_26A8B4570 != -1) {
    swift_once();
  }
  long long v2 = xmmword_26A8B5778;
  *a1 = xmmword_26A8B5778;
  return sub_2607DCED0(v2, *((unint64_t *)&v2 + 1));
}

uint64_t sub_260873244()
{
  return 304;
}

uint64_t sub_260873250()
{
  return 18;
}

uint64_t GameControllerReport.report.getter(uint64_t a1, unint64_t a2)
{
  return a1;
}

uint64_t GameControllerReport.report.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_2607DCF28(*(void *)v2, *(void *)(v2 + 8));
  *(void *)uint64_t v2 = a1;
  *(void *)(v2 + 8) = a2;
  return result;
}

uint64_t (*GameControllerReport.report.modify())()
{
  return nullsub_1;
}

uint64_t sub_2608732E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = GameControllerReport.init(_report:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t GameControllerReport.controllerType.setter(uint64_t a1)
{
  if (a1 >= 0x7F) {
    a1 = 127;
  }
  else {
    a1 = a1;
  }
  return _s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcis_0(a1, 8);
}

#error "26087332C: call analysis failed (funcsize=11)"

#error "260873358: call analysis failed (funcsize=11)"

#error "260873384: call analysis failed (funcsize=11)"

#error "2608733B0: call analysis failed (funcsize=11)"

#error "2608733DC: call analysis failed (funcsize=11)"

#error "260873408: call analysis failed (funcsize=11)"

#error "260873434: call analysis failed (funcsize=11)"

#error "260873460: call analysis failed (funcsize=11)"

#error "26087348C: call analysis failed (funcsize=11)"

#error "2608734B8: call analysis failed (funcsize=11)"

#error "2608734E4: call analysis failed (funcsize=11)"

#error "260873510: call analysis failed (funcsize=11)"

#error "26087353C: call analysis failed (funcsize=11)"

#error "260873568: call analysis failed (funcsize=11)"

#error "260873594: call analysis failed (funcsize=11)"

#error "2608735C0: call analysis failed (funcsize=11)"

#error "2608735EC: call analysis failed (funcsize=11)"

uint64_t sub_26087360C()
{
  return sub_260875940(*(void *)v0, *(void *)(v0 + 8));
}

unint64_t sub_260873614@<X0>(_DWORD *a1@<X8>)
{
  unint64_t result = GameControllerReport.controllerType.getter();
  *a1 = result;
  return result;
}

uint64_t (*GameControllerReport.controllerType.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  char v3 = _s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcig_0();
  *(_DWORD *)(a1 + 8) = HIDGameControllerType.init(rawValue:)(v3);
  return sub_26087369C;
}

uint64_t sub_26087369C(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(a1 + 8);
  if (v1 >= 0x7F) {
    uint64_t v2 = 127;
  }
  else {
    uint64_t v2 = v1;
  }
  return _s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcis_0(v2, 8);
}

void sub_2608736D4(void *a1@<X0>, double *a2@<X8>)
{
  *a2 = GameControllerReport.dpadUp.getter(*a1, a1[1]);
}

#error "26087371C: call analysis failed (funcsize=20)"

#error "260873770: call analysis failed (funcsize=12)"

void sub_260873788(void *a1@<X0>, double *a2@<X8>)
{
  *a2 = GameControllerReport.dpadDown.getter(*a1, a1[1]);
}

#error "2608737D0: call analysis failed (funcsize=20)"

#error "260873824: call analysis failed (funcsize=12)"

void sub_26087383C(void *a1@<X0>, double *a2@<X8>)
{
  *a2 = GameControllerReport.dpadLeft.getter(*a1, a1[1]);
}

#error "260873884: call analysis failed (funcsize=20)"

#error "2608738D8: call analysis failed (funcsize=12)"

void sub_2608738F0(void *a1@<X0>, double *a2@<X8>)
{
  *a2 = GameControllerReport.dpadRight.getter(*a1, a1[1]);
}

#error "260873938: call analysis failed (funcsize=20)"

#error "26087398C: call analysis failed (funcsize=12)"

#error "2608739B8: call analysis failed (funcsize=12)"

void sub_2608739D4(void *a1@<X0>, double *a2@<X8>)
{
  *a2 = GameControllerReport.joystickX.getter(*a1, a1[1]);
}

#error "260873A1C: call analysis failed (funcsize=20)"

#error "260873A70: call analysis failed (funcsize=12)"

#error "260873A9C: call analysis failed (funcsize=12)"

void sub_260873AB8(void *a1@<X0>, double *a2@<X8>)
{
  *a2 = GameControllerReport.joystickY.getter(*a1, a1[1]);
}

#error "260873B00: call analysis failed (funcsize=20)"

#error "260873B54: call analysis failed (funcsize=12)"

#error "260873B80: call analysis failed (funcsize=12)"

void sub_260873B9C(void *a1@<X0>, double *a2@<X8>)
{
  *a2 = GameControllerReport.joystickZ.getter(*a1, a1[1]);
}

#error "260873BE4: call analysis failed (funcsize=20)"

#error "260873C38: call analysis failed (funcsize=12)"

#error "260873C64: call analysis failed (funcsize=12)"

void sub_260873C80(void *a1@<X0>, double *a2@<X8>)
{
  *a2 = GameControllerReport.joystickRZ.getter(*a1, a1[1]);
}

#error "260873CC8: call analysis failed (funcsize=20)"

#error "260873D1C: call analysis failed (funcsize=12)"

void sub_260873D34(void *a1@<X0>, double *a2@<X8>)
{
  *a2 = GameControllerReport.buttonX.getter(*a1, a1[1]);
}

#error "260873D7C: call analysis failed (funcsize=20)"

#error "260873DD0: call analysis failed (funcsize=12)"

void sub_260873DE8(void *a1@<X0>, double *a2@<X8>)
{
  *a2 = GameControllerReport.buttonY.getter(*a1, a1[1]);
}

#error "260873E30: call analysis failed (funcsize=20)"

#error "260873E84: call analysis failed (funcsize=12)"

void sub_260873E9C(void *a1@<X0>, double *a2@<X8>)
{
  *a2 = GameControllerReport.buttonA.getter(*a1, a1[1]);
}

#error "260873EE4: call analysis failed (funcsize=20)"

#error "260873F38: call analysis failed (funcsize=12)"

void sub_260873F50(void *a1@<X0>, double *a2@<X8>)
{
  *a2 = GameControllerReport.buttonB.getter(*a1, a1[1]);
}

#error "260873F98: call analysis failed (funcsize=20)"

#error "260873FEC: call analysis failed (funcsize=12)"

void sub_260874004(void *a1@<X0>, double *a2@<X8>)
{
  *a2 = GameControllerReport.buttonLeftShoulder1.getter(*a1, a1[1]);
}

#error "26087404C: call analysis failed (funcsize=20)"

#error "2608740A0: call analysis failed (funcsize=12)"

void sub_2608740B8(void *a1@<X0>, double *a2@<X8>)
{
  *a2 = GameControllerReport.buttonLeftShoulder2.getter(*a1, a1[1]);
}

#error "260874100: call analysis failed (funcsize=20)"

#error "260874154: call analysis failed (funcsize=12)"

void sub_26087416C(void *a1@<X0>, double *a2@<X8>)
{
  *a2 = GameControllerReport.buttonRightShoulder1.getter(*a1, a1[1]);
}

#error "2608741B4: call analysis failed (funcsize=20)"

#error "260874208: call analysis failed (funcsize=12)"

void sub_260874220(void *a1@<X0>, double *a2@<X8>)
{
  *a2 = GameControllerReport.buttonRightShoulder2.getter(*a1, a1[1]);
}

#error "26087425C: call analysis failed (funcsize=11)"

#error "260874294: call analysis failed (funcsize=20)"

#error "2608742E8: call analysis failed (funcsize=12)"

void sub_260874300(void *a1@<X0>, double *a2@<X8>)
{
  *a2 = GameControllerReport.buttonThumbstickLeft.getter(*a1, a1[1]);
}

#error "260874348: call analysis failed (funcsize=20)"

#error "26087439C: call analysis failed (funcsize=12)"

void sub_2608743B4(void *a1@<X0>, double *a2@<X8>)
{
  *a2 = GameControllerReport.buttonThumbstickRight.getter(*a1, a1[1]);
}

#error "2608743FC: call analysis failed (funcsize=20)"

#error "260874450: call analysis failed (funcsize=12)"

void sub_26087446C(void *a1, void *a2)
{
  static GameControllerReport.== infix(_:_:)(*a1, a1[1], *a2, a2[1]);
}

unint64_t sub_260874484()
{
  unint64_t result = qword_26A8B5788;
  if (!qword_26A8B5788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5788);
  }
  return result;
}

unint64_t sub_2608744D4()
{
  unint64_t result = qword_26A8B5790;
  if (!qword_26A8B5790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5790);
  }
  return result;
}

unint64_t sub_260874524()
{
  unint64_t result = qword_26A8B5798;
  if (!qword_26A8B5798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5798);
  }
  return result;
}

unint64_t sub_260874574()
{
  unint64_t result = qword_26A8B57A0;
  if (!qword_26A8B57A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B57A0);
  }
  return result;
}

uint64_t sub_2608745C4(unsigned int *a1)
{
  return GameControllerReport.controllerType.setter(*a1);
}

uint64_t sub_2608745F0(uint64_t a1)
{
  double v1 = OUTLINED_FUNCTION_6_31(a1);
  return GameControllerReport.dpadUp.setter(v1);
}

uint64_t sub_260874618(uint64_t a1)
{
  double v1 = OUTLINED_FUNCTION_6_31(a1);
  return GameControllerReport.dpadDown.setter(v1);
}

uint64_t sub_260874640(uint64_t a1)
{
  double v1 = OUTLINED_FUNCTION_6_31(a1);
  return GameControllerReport.dpadLeft.setter(v1);
}

uint64_t sub_260874668(uint64_t a1)
{
  double v1 = OUTLINED_FUNCTION_6_31(a1);
  return GameControllerReport.dpadRight.setter(v1);
}

uint64_t sub_260874690(uint64_t a1)
{
  double v1 = OUTLINED_FUNCTION_6_31(a1);
  return GameControllerReport.joystickX.setter(v1);
}

uint64_t sub_2608746B8(uint64_t a1)
{
  double v1 = OUTLINED_FUNCTION_6_31(a1);
  return GameControllerReport.joystickY.setter(v1);
}

uint64_t sub_2608746E0(uint64_t a1)
{
  double v1 = OUTLINED_FUNCTION_6_31(a1);
  return GameControllerReport.joystickZ.setter(v1);
}

uint64_t sub_260874708(uint64_t a1)
{
  double v1 = OUTLINED_FUNCTION_6_31(a1);
  return GameControllerReport.joystickRZ.setter(v1);
}

uint64_t sub_260874730(uint64_t a1)
{
  double v1 = OUTLINED_FUNCTION_6_31(a1);
  return GameControllerReport.buttonX.setter(v1);
}

uint64_t sub_260874758(uint64_t a1)
{
  double v1 = OUTLINED_FUNCTION_6_31(a1);
  return GameControllerReport.buttonY.setter(v1);
}

uint64_t sub_260874780(uint64_t a1)
{
  double v1 = OUTLINED_FUNCTION_6_31(a1);
  return GameControllerReport.buttonA.setter(v1);
}

uint64_t sub_2608747A8(uint64_t a1)
{
  double v1 = OUTLINED_FUNCTION_6_31(a1);
  return GameControllerReport.buttonB.setter(v1);
}

uint64_t sub_2608747D0(uint64_t a1)
{
  double v1 = OUTLINED_FUNCTION_6_31(a1);
  return GameControllerReport.buttonLeftShoulder1.setter(v1);
}

uint64_t sub_2608747F8(uint64_t a1)
{
  double v1 = OUTLINED_FUNCTION_6_31(a1);
  return GameControllerReport.buttonLeftShoulder2.setter(v1);
}

uint64_t sub_260874820(uint64_t a1)
{
  double v1 = OUTLINED_FUNCTION_6_31(a1);
  return GameControllerReport.buttonRightShoulder1.setter(v1);
}

uint64_t sub_260874848(uint64_t a1)
{
  double v1 = OUTLINED_FUNCTION_6_31(a1);
  return GameControllerReport.buttonRightShoulder2.setter(v1);
}

uint64_t sub_260874870(uint64_t a1)
{
  double v1 = OUTLINED_FUNCTION_6_31(a1);
  return GameControllerReport.buttonThumbstickLeft.setter(v1);
}

uint64_t sub_260874898(uint64_t a1)
{
  double v1 = OUTLINED_FUNCTION_6_31(a1);
  return GameControllerReport.buttonThumbstickRight.setter(v1);
}

ValueMetadata *type metadata accessor for GameControllerReport.Flags()
{
  return &type metadata for GameControllerReport.Flags;
}

ValueMetadata *type metadata accessor for GameControllerReport()
{
  return &type metadata for GameControllerReport;
}

uint64_t OUTLINED_FUNCTION_3_38()
{
  return sub_26087AFD0();
}

double OUTLINED_FUNCTION_5_26(double a1, double a2)
{
  double result = a1 / a2;
  double *v2 = result;
  return result;
}

double OUTLINED_FUNCTION_6_31(uint64_t a1)
{
  return *(double *)a1;
}

double OUTLINED_FUNCTION_11_18()
{
  return v0;
}

void OUTLINED_FUNCTION_12_19(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,__int16 a29,char a30,char a31,char a32,char a33,char a34,char a35,char a36,char a37,char a38,char a39,char a40,char a41,char a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57)
{
  _s12UniversalHID9HIDReportV_2ass5Int16VSi_AFmtcig_0(a1, v58, v57, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32,
    a33,
    a34,
    a35,
    a36,
    a37,
    a38,
    a39,
    a40,
    a41,
    a42,
    a43,
    a44,
    a45,
    a46,
    a47,
    a48,
    a49,
    a50,
    a51,
    a52,
    a53,
    a54,
    a55,
    a56,
    a57);
}

void ScaleReport.remoteTimestamp.setter()
{
  uint64_t v1 = *v0;
  switch((unint64_t)v0[1] >> 62)
  {
    case 1uLL:
      if (!__OFSUB__(HIDWORD(v1), v1)) {
        goto LABEL_5;
      }
      goto LABEL_11;
    case 2uLL:
      if (!__OFSUB__(*(void *)(v1 + 24), *(void *)(v1 + 16))) {
        goto LABEL_5;
      }
      goto LABEL_12;
    case 3uLL:
      return;
    default:
LABEL_5:
      OUTLINED_FUNCTION_2_1();
      if (!v5)
      {
        __break(1u);
LABEL_11:
        __break(1u);
LABEL_12:
        __break(1u);
        JUMPOUT(0x260874A00);
      }
      if (v4 >= 12)
      {
        if (v3) {
          uint64_t v2 = 0;
        }
        _s12UniversalHID9HIDReportV_2ass5Int64VSi_AFmtcis_0(v2, 32);
      }
      return;
  }
}

uint64_t ScaleReport.phase.setter()
{
  unsigned int v0 = OUTLINED_FUNCTION_1_9();
  uint64_t v1 = OUTLINED_FUNCTION_1_4(v0);
  return _s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcis_0(v1, v2);
}

uint64_t ScaleReport.z.setter(double a1)
{
  return sub_2607E260C(16, a1);
}

double ScaleReport.z.getter(uint64_t a1, uint64_t a2)
{
  return sub_2607DCFD0(16, a1, a2);
}

unint64_t ScaleReport.phase.getter(uint64_t a1, unint64_t a2)
{
  return sub_2607DB19C(8, a1, a2) & 0xFFFFFF8F;
}

uint64_t static ScaleReport.initialReportBitCount.getter()
{
  return 32;
}

uint64_t static ScaleReport.reportID.getter()
{
  return 15;
}

uint64_t sub_260874A98()
{
  uint64_t result = sub_260874ABC();
  *(void *)&xmmword_26A8B57A8 = result;
  *((void *)&xmmword_26A8B57A8 + 1) = v1;
  return result;
}

uint64_t sub_260874ABC()
{
  LOBYTE(v52[0]) = 12;
  uint64_t v40 = sub_2608155C0((char *)v52, 8uLL);
  unint64_t v41 = v0;
  LOBYTE(v52[0]) = 14;
  uint64_t v1 = sub_260815298((char *)v52, 1);
  unint64_t v3 = v2;
  LOBYTE(v47) = 0;
  LOBYTE(v45[0]) = 1;
  __int16 v51 = 0;
  __int16 v50 = 0;
  HIBYTE(v49) = 0;
  Input.init(_:_:_:_:_:_:_:_:)((unsigned __int8 *)&v47, v45, (unsigned char *)&v51 + 1, &v51, (unsigned char *)&v50 + 1, &v50, (unsigned char *)&v49 + 1, v52);
  LOBYTE(v47) = 12;
  uint64_t v4 = sub_2608155C0((char *)&v47, 0x10uLL);
  unint64_t v43 = v5;
  uint64_t v44 = v4;
  LOBYTE(v47) = 14;
  uint64_t v42 = sub_260815298((char *)&v47, 1);
  unint64_t v39 = v6;
  LOBYTE(v45[0]) = 0;
  __int16 v51 = 257;
  __int16 v50 = 0;
  __int16 v49 = 0;
  Input.init(_:_:_:_:_:_:_:_:)((unsigned __int8 *)v45, (unsigned char *)&v51 + 1, &v51, (unsigned char *)&v50 + 1, &v50, (unsigned char *)&v49 + 1, &v49, &v47);
  LOBYTE(v45[0]) = 5;
  uint64_t v7 = sub_2608155C0((char *)v45, 0xFF00uLL);
  unint64_t v9 = v8;
  unint64_t v27 = v8;
  LOBYTE(v45[0]) = 17;
  uint64_t v10 = sub_2608155C0((char *)v45, 0x102uLL);
  unint64_t v34 = v11;
  LOBYTE(v45[0]) = 6;
  uint64_t v23 = sub_260815298((char *)v45, 0);
  unint64_t v33 = v12;
  LOBYTE(v45[0]) = 7;
  uint64_t v31 = sub_260815298((char *)v45, 255);
  unint64_t v32 = v13;
  LOBYTE(v45[0]) = 12;
  uint64_t v14 = sub_2608155C0((char *)v45, 8uLL);
  unint64_t v37 = v15;
  uint64_t v38 = v14;
  LOBYTE(v45[0]) = 14;
  uint64_t v16 = sub_260815298((char *)v45, 8);
  unint64_t v35 = v17;
  uint64_t v36 = v16;
  __int16 v51 = 1;
  __int16 v50 = 0;
  __int16 v49 = 0;
  char v46 = 0;
  Input.init(_:_:_:_:_:_:_:_:)((unsigned __int8 *)&v51 + 1, &v51, (unsigned char *)&v50 + 1, &v50, (unsigned char *)&v49 + 1, &v49, &v46, v45);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B4660);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_26087D790;
  *(void *)(inited + 56) = &type metadata for ReportID;
  *(void *)(inited + 64) = &protocol witness table for ReportID;
  *(unsigned char *)(inited + 32) = 15;
  *(void *)(inited + 96) = &type metadata for ReportSize;
  *(void *)(inited + 104) = &protocol witness table for ReportSize;
  *(void *)(inited + 72) = v40;
  *(void *)(inited + 80) = v41;
  *(void *)(inited + 136) = &type metadata for ReportCount;
  *(void *)(inited + 144) = &protocol witness table for ReportCount;
  *(void *)(inited + 112) = v1;
  *(void *)(inited + 120) = v3;
  *(void *)(inited + 336) = &type metadata for UsagePage;
  *(void *)(inited + 344) = &protocol witness table for UsagePage;
  *(void *)(inited + 376) = &type metadata for Usage;
  *(void *)(inited + 384) = &protocol witness table for Usage;
  *(void *)(inited + 416) = &type metadata for LogicalMinimum;
  *(void *)(inited + 424) = &protocol witness table for LogicalMinimum;
  *(void *)(inited + 456) = &type metadata for LogicalMaximum;
  *(void *)(inited + 464) = &protocol witness table for LogicalMaximum;
  unint64_t v20 = v52[1];
  uint64_t v30 = v52[0];
  uint64_t v19 = v52[0];
  *(void *)(inited + 496) = &type metadata for ReportSize;
  *(void *)(inited + 216) = &type metadata for ReportSize;
  *(void *)(inited + 224) = &protocol witness table for ReportSize;
  *(void *)(inited + 504) = &protocol witness table for ReportSize;
  *(void *)(inited + 176) = &type metadata for Input;
  *(void *)(inited + 184) = &protocol witness table for Input;
  *(void *)(inited + 152) = v19;
  *(void *)(inited + 160) = v20;
  *(void *)(inited + 192) = v44;
  *(void *)(inited + 200) = v43;
  *(void *)(inited + 256) = &type metadata for ReportCount;
  *(void *)(inited + 264) = &protocol witness table for ReportCount;
  *(void *)(inited + 232) = v42;
  *(void *)(inited + 240) = v39;
  *(void *)(inited + 536) = &type metadata for ReportCount;
  *(void *)(inited + 544) = &protocol witness table for ReportCount;
  unint64_t v28 = v48;
  unint64_t v21 = v48;
  uint64_t v29 = v47;
  *(void *)(inited + 296) = &type metadata for Input;
  *(void *)(inited + 304) = &protocol witness table for Input;
  *(void *)(inited + 272) = v29;
  *(void *)(inited + 280) = v21;
  *(void *)(inited + 312) = v7;
  *(void *)(inited + 320) = v9;
  *(void *)(inited + 352) = v10;
  *(void *)(inited + 360) = v34;
  *(void *)(inited + 392) = v23;
  *(void *)(inited + 400) = v33;
  *(void *)(inited + 432) = v31;
  *(void *)(inited + 440) = v32;
  *(void *)(inited + 472) = v38;
  *(void *)(inited + 480) = v37;
  *(void *)(inited + 512) = v36;
  *(void *)(inited + 520) = v35;
  *(void *)(inited + 576) = &type metadata for Input;
  *(void *)(inited + 584) = &protocol witness table for Input;
  uint64_t v24 = v45[0];
  unint64_t v25 = v45[1];
  *(void *)(inited + 552) = v45[0];
  *(void *)(inited + 560) = v25;
  sub_2607DCED0(v40, v41);
  sub_2607DCED0(v1, v3);
  sub_2607DCED0(v30, v20);
  sub_2607DCED0(v44, v43);
  sub_2607DCED0(v42, v39);
  sub_2607DCED0(v29, v28);
  sub_2607DCED0(v7, v27);
  sub_2607DCED0(v10, v34);
  sub_2607DCED0(v23, v33);
  sub_2607DCED0(v31, v32);
  sub_2607DCED0(v38, v37);
  sub_2607DCED0(v36, v35);
  sub_2607DCED0(v24, v25);
  uint64_t v26 = static HIDReportDescriptor.Builder.buildBlock(_:)(inited);
  swift_setDeallocating();
  sub_2608374F8();
  sub_2607DCF28(v24, v25);
  sub_2607DCF28(v36, v35);
  sub_2607DCF28(v38, v37);
  sub_2607DCF28(v31, v32);
  sub_2607DCF28(v23, v33);
  sub_2607DCF28(v10, v34);
  sub_2607DCF28(v7, v27);
  sub_2607DCF28(v29, v28);
  sub_2607DCF28(v42, v39);
  sub_2607DCF28(v44, v43);
  sub_2607DCF28(v30, v20);
  sub_2607DCF28(v1, v3);
  sub_2607DCF28(v40, v41);
  return v26;
}

uint64_t static ScaleReport.descriptor.getter@<X0>(_OWORD *a1@<X8>)
{
  if (qword_26A8B4578 != -1) {
    swift_once();
  }
  long long v2 = xmmword_26A8B57A8;
  *a1 = xmmword_26A8B57A8;
  return sub_2607DCED0(v2, *((unint64_t *)&v2 + 1));
}

uint64_t sub_260875004()
{
  return 15;
}

uint64_t ScaleReport.report.getter(uint64_t a1, unint64_t a2)
{
  return a1;
}

uint64_t ScaleReport.report.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_2607DCF28(*(void *)v2, *(void *)(v2 + 8));
  *(void *)uint64_t v2 = a1;
  *(void *)(v2 + 8) = a2;
  return result;
}

uint64_t (*ScaleReport.report.modify())()
{
  return nullsub_1;
}

uint64_t sub_260875098@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ScaleReport.init(_report:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2608750C0()
{
  return sub_260875958(*(void *)v0, *(void *)(v0 + 8));
}

unint64_t ScaleReport.flags.getter(uint64_t a1, unint64_t a2)
{
  return sub_2607DB19C(8, a1, a2);
}

unint64_t sub_2608750D8@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = ScaleReport.flags.getter(*(void *)a1, *(void *)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t ScaleReport.flags.setter(uint64_t a1)
{
  return _s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcis_0(a1, 8);
}

uint64_t (*ScaleReport.flags.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(unsigned char *)(a1 + 8) = OUTLINED_FUNCTION_1_9();
  return sub_2607E79F0;
}

unint64_t sub_260875158@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = ScaleReport.phase.getter(*(void *)a1, *(void *)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t (*ScaleReport.phase.modify(uint64_t a1))()
{
  *(void *)a1 = v1;
  *(unsigned char *)(a1 + 8) = OUTLINED_FUNCTION_1_9() & 0x8F;
  return sub_2607FA600;
}

void sub_2608751D4(uint64_t *a1@<X0>, double *a2@<X8>)
{
  *a2 = ScaleReport.z.getter(*a1, a1[1]);
}

uint64_t (*ScaleReport.z.modify(uint64_t a1))(double *a1)
{
  *(void *)(a1 + 8) = v1;
  *(double *)a1 = sub_2607DCFD0(16, *v1, v1[1]);
  return sub_2607FA6B0;
}

uint64_t ScaleReport.remoteTimestamp.getter(uint64_t a1, unint64_t a2)
{
  uint64_t result = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v4) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_12;
      }
      uint64_t v4 = (int)v4;
LABEL_6:
      if ((unint64_t)(v4 - 0x1000000000000000) >> 61 != 7)
      {
        __break(1u);
LABEL_12:
        __break(1u);
LABEL_13:
        __break(1u);
        JUMPOUT(0x260875304);
      }
      if (v4 >= 12) {
        return _s12UniversalHID9HIDReportV_2ass5Int64VSi_AFmtcig_0(32, a1, a2);
      }
      else {
        return 0;
      }
    case 2uLL:
      uint64_t v6 = *(void *)(a1 + 16);
      uint64_t v5 = *(void *)(a1 + 24);
      BOOL v7 = __OFSUB__(v5, v6);
      uint64_t v4 = v5 - v6;
      if (!v7) {
        goto LABEL_6;
      }
      goto LABEL_13;
    case 3uLL:
      return result;
    default:
      uint64_t v4 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_260875314@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = ScaleReport.remoteTimestamp.getter(*(void *)a1, *(void *)(a1 + 8));
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_26087534C()
{
}

void (*ScaleReport.remoteTimestamp.modify(uint64_t a1))(uint64_t *a1, char a2)
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *v1;
  char v4 = 1;
  uint64_t v5 = 0;
  switch((unint64_t)v1[1] >> 62)
  {
    case 1uLL:
      if (!__OFSUB__(HIDWORD(v3), v3)) {
        goto LABEL_5;
      }
      goto LABEL_11;
    case 2uLL:
      if (!__OFSUB__(*(void *)(v3 + 24), *(void *)(v3 + 16))) {
        goto LABEL_5;
      }
      goto LABEL_12;
    case 3uLL:
      goto LABEL_10;
    default:
LABEL_5:
      OUTLINED_FUNCTION_2_1();
      if (!v9)
      {
        __break(1u);
LABEL_11:
        __break(1u);
LABEL_12:
        __break(1u);
        JUMPOUT(0x260875450);
      }
      if (v8 >= 12)
      {
        uint64_t v5 = _s12UniversalHID9HIDReportV_2ass5Int64VSi_AFmtcig_0(32, v6, v7);
        char v4 = 0;
      }
      else
      {
        uint64_t v5 = 0;
        char v4 = 1;
      }
LABEL_10:
      *(void *)a1 = v5;
      *(unsigned char *)(a1 + 8) = v4;
      return sub_260875460;
  }
}

void sub_260875460(uint64_t *a1, char a2)
{
  uint64_t v4 = *a1;
  int v5 = *((unsigned __int8 *)a1 + 8);
  uint64_t v6 = (uint64_t *)a1[2];
  if (a2)
  {
    ScaleReport.remoteTimestamp.setter();
  }
  else
  {
    uint64_t v7 = *v6;
    switch((unint64_t)v6[1] >> 62)
    {
      case 1uLL:
        BOOL v8 = __OFSUB__(HIDWORD(v7), v7);
        uint64_t v9 = (HIDWORD(v7) - v7);
        if (v8) {
          goto LABEL_10;
        }
        goto LABEL_8;
      case 2uLL:
        uint64_t v12 = v7 + 16;
        uint64_t v10 = *(void *)(v7 + 16);
        uint64_t v11 = *(void *)(v12 + 8);
        BOOL v8 = __OFSUB__(v11, v10);
        uint64_t v9 = v11 - v10;
        if (!v8) {
          goto LABEL_8;
        }
        goto LABEL_11;
      case 3uLL:
        return;
      default:
LABEL_8:
        OUTLINED_FUNCTION_2_1();
        if (!v13)
        {
          __break(1u);
LABEL_10:
          __break(1u);
LABEL_11:
          __break(1u);
        }
        if (v9 >= 12)
        {
          if (v5) {
            uint64_t v4 = 0;
          }
          _s12UniversalHID9HIDReportV_2ass5Int64VSi_AFmtcis_0(v4, 32);
        }
        break;
    }
  }
}

uint64_t sub_260875528()
{
  return ScaleReport.remoteTimestamp.getter(*(void *)v0, *(void *)(v0 + 8));
}

void sub_260875548()
{
}

void (*sub_260875550(uint64_t a1))()
{
  *(void *)(a1 + 16) = v1;
  *(void *)a1 = ScaleReport.remoteTimestamp.getter(*(void *)v1, *(void *)(v1 + 8));
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return sub_2608755A4;
}

void sub_2608755A4()
{
}

uint64_t sub_2608755D8(unsigned __int8 *a1)
{
  return ScaleReport.flags.setter(*a1);
}

uint64_t sub_260875604()
{
  return ScaleReport.phase.setter();
}

uint64_t sub_260875630(double *a1)
{
  return ScaleReport.z.setter(*a1);
}

ValueMetadata *type metadata accessor for ScaleReport()
{
  return &type metadata for ScaleReport;
}

uint64_t sub_26087568C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    do
      OUTLINED_FUNCTION_62_2();
    while (!v1);
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_2608756D4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = 0;
    char v3 = (unsigned int *)(a1 + 32);
    while (1)
    {
      unsigned int v5 = *v3++;
      unsigned int v4 = v5;
      if (v5 >= 0x40) {
        break;
      }
      if (v4 == 63)
      {
        uint64_t result = sub_26087B980();
        __break(1u);
        return result;
      }
      uint64_t v6 = 1 << v4;
      if ((v6 & v2) == 0) {
        goto LABEL_7;
      }
LABEL_8:
      if (!--v1) {
        goto LABEL_11;
      }
    }
    uint64_t v6 = 0;
LABEL_7:
    v2 |= v6;
    goto LABEL_8;
  }
  uint64_t v2 = 0;
LABEL_11:
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_26087579C@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    int v4 = 0;
    unsigned int v5 = (int *)(a1 + 32);
    do
    {
      int v7 = *v5++;
      int v6 = v7;
      if ((v7 & ~v4) == 0) {
        int v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    int v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t sub_2608757F4(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    do
      OUTLINED_FUNCTION_62_2();
    while (!v1);
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_26087583C(uint64_t a1, unint64_t a2)
{
  return OUTLINED_FUNCTION_2_45(a1, a2);
}

uint64_t sub_260875854(uint64_t a1, unint64_t a2)
{
  return OUTLINED_FUNCTION_2_45(a1, a2);
}

uint64_t sub_26087586C(uint64_t a1, unint64_t a2)
{
  return OUTLINED_FUNCTION_2_45(a1, a2);
}

uint64_t sub_260875884(uint64_t a1, unint64_t a2)
{
  return OUTLINED_FUNCTION_2_45(a1, a2);
}

uint64_t sub_26087589C(uint64_t a1, unint64_t a2)
{
  return OUTLINED_FUNCTION_2_45(a1, a2);
}

uint64_t sub_2608758B4(uint64_t a1, unint64_t a2)
{
  return OUTLINED_FUNCTION_23_7(a1, a2);
}

uint64_t sub_2608758CC(uint64_t a1, unint64_t a2)
{
  return OUTLINED_FUNCTION_2_45(a1, a2);
}

uint64_t sub_2608758E4(uint64_t a1, unint64_t a2)
{
  return OUTLINED_FUNCTION_16_16(a1, a2);
}

uint64_t sub_2608758F4(uint64_t a1, unint64_t a2)
{
  return OUTLINED_FUNCTION_23_7(a1, a2);
}

uint64_t sub_26087590C(uint64_t a1, unint64_t a2)
{
  return OUTLINED_FUNCTION_16_16(a1, a2);
}

uint64_t sub_26087591C(uint64_t a1, unint64_t a2)
{
  return sub_260875978(a1, a2);
}

uint64_t sub_260875940(uint64_t a1, unint64_t a2)
{
  return OUTLINED_FUNCTION_2_45(a1, a2);
}

uint64_t sub_260875958(uint64_t a1, unint64_t a2)
{
  return sub_260875978(a1, a2);
}

uint64_t sub_260875978(uint64_t a1, unint64_t a2)
{
  return 60;
}

uint64_t sub_260875A3C(uint64_t a1, uint64_t a2)
{
  return a2 | a1;
}

uint64_t sub_260875A44@<X0>(uint64_t result@<X0>, int a2@<W1>, _DWORD *a3@<X8>)
{
  *a3 = a2 | result;
  return result;
}

void sub_260875A5C(uint64_t a1@<X8>, int a2@<W0>)
{
  if ((*v2 & a2) != 0) {
    *v2 &= ~a2;
  }
  OUTLINED_FUNCTION_60_2(a1);
}

uint64_t sub_260875A7C(unsigned __int8 a1)
{
  char v2 = *v1;
  if ((*v1 & a1) != 0) {
    *char v1 = v2 & ~a1;
  }
  return OUTLINED_FUNCTION_59_2((v2 & a1));
}

unint64_t sub_260875AA4(unsigned int a1)
{
  int v2 = *v1;
  int v3 = *v1 & a1;
  if (v3)
  {
    *char v1 = v2 & ~a1;
    uint64_t v4 = v2 & a1;
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4 | ((unint64_t)(v3 == 0) << 32);
}

void sub_260875AF0(uint64_t a1@<X8>, int a2@<W0>)
{
  *v2 |= a2;
  OUTLINED_FUNCTION_60_2(a1);
}

uint64_t sub_260875B08(char a1)
{
  char v2 = *v1;
  *v1 |= a1;
  return OUTLINED_FUNCTION_59_2((v2 & a1));
}

unint64_t sub_260875B28(unsigned int a1)
{
  int v2 = *v1;
  *v1 |= a1;
  return v2 & a1 | ((unint64_t)((v2 & a1) == 0) << 32);
}

uint64_t sub_260875B54@<X0>(uint64_t result@<X0>, int a2@<W1>, int *a3@<X8>)
{
  *a3 = a2 & ~result;
  return result;
}

uint64_t sub_260875B60()
{
  OUTLINED_FUNCTION_55_2();
  unsigned int v5 = v4;
  OUTLINED_FUNCTION_42_0(v6, v7, v8, v9);
  sub_2607DCED0(v1, v0);
  uint64_t result = sub_2607DCED0(v3, v2);
  uint64_t v11 = 0;
  for (unint64_t i = 0; ; ++i)
  {
    if ((i - 0x1000000000000000) >> 61 != 7)
    {
      __break(1u);
LABEL_15:
      __break(1u);
      return result;
    }
    uint64_t result = v11 + 8;
    if (__OFADD__(v11, 8)) {
      goto LABEL_15;
    }
    uint64_t result = sub_2607DB19C(result, v3, v2);
    if ((result - 3) < 3u) {
      break;
    }
    if (i > 2) {
      goto LABEL_11;
    }
LABEL_10:
    v11 += 8;
  }
  unsigned __int8 v13 = result;
  uint64_t result = AppleVendorTopCaseReport.update(with:)(result);
  if ((result & 0x100) == 0) {
    uint64_t result = AppleVendorTopCaseReport.remove(_:)(v13);
  }
  if (i < 3) {
    goto LABEL_10;
  }
LABEL_11:
  sub_2607DCF28(v3, v2);
  *unsigned int v5 = v1;
  v5[1] = v0;
  OUTLINED_FUNCTION_52_2();
  sub_26082D1B0();
  uint64_t v14 = OUTLINED_FUNCTION_52_2();
  return sub_2607DCF28(v14, v15);
}

uint64_t sub_260875C84()
{
  OUTLINED_FUNCTION_66_0();
  unsigned int v5 = v4;
  uint64_t v13 = v6;
  unint64_t v14 = v7;
  OUTLINED_FUNCTION_42_0(v8, v9, v6, v7);
  sub_2607DCED0(v1, v0);
  sub_2607DCED0(v3, v2);
  sub_2607FDF9C(&v13, v3, v2);
  uint64_t v10 = v13;
  unint64_t v11 = v14;
  *unsigned int v5 = v1;
  v5[1] = v0;
  return sub_2607FE024(v5, v10, v11);
}

uint64_t sub_260875D04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  return sub_260875D5C(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_26082D9A8, (void (*)(uint64_t, unint64_t))sub_26082D27C, a5);
}

uint64_t sub_260875D30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  return sub_260875D5C(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_26082DA80, (void (*)(uint64_t, unint64_t))sub_26082D364, a5);
}

uint64_t sub_260875D5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, void (*a5)(uint64_t, uint64_t)@<X4>, void (*a6)(uint64_t, unint64_t)@<X5>, uint64_t *a7@<X8>)
{
  OUTLINED_FUNCTION_42_0(a1, a2, a3, a4);
  sub_2607DCED0(a3, a4);
  a5(a1, a2);
  *a7 = a3;
  a7[1] = a4;
  a6(a3, a4);
  return sub_2607DCF28(a3, a4);
}

uint64_t sub_260875E10(uint64_t a1, uint64_t a2)
{
  return a2 & ~a1;
}

uint64_t sub_260875E18(int a1, int a2)
{
  return a2 & ~a1;
}

#error "260875E98: call analysis failed (funcsize=71)"

uint64_t sub_260875F3C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  OUTLINED_FUNCTION_6_32(a1, a2, a3, a4);
  OUTLINED_FUNCTION_27_4();
  sub_26082D1B0();
  if (qword_26A8B44B0 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_18_3();
  uint64_t v5 = HIDReportDescriptor.reportBitCount(for:)(4u);
  HIDReport.init(bitCount:id:)(v5, 4);
  OUTLINED_FUNCTION_3_39();
  OUTLINED_FUNCTION_14_16();
  OUTLINED_FUNCTION_93();
  return v4 & 1;
}

uint64_t sub_260875FE0()
{
  OUTLINED_FUNCTION_66_0();
  v11[0] = v5;
  v11[1] = v6;
  sub_2607DCED0(v7, v8);
  sub_2607DCED0(v1, v0);
  sub_2607FE024(v11, v3, v2);
  if (qword_26A8B44C0 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_18_3();
  uint64_t v9 = HIDReportDescriptor.reportBitCount(for:)(1u);
  HIDReport.init(bitCount:id:)(v9, 1);
  OUTLINED_FUNCTION_3_39();
  OUTLINED_FUNCTION_14_16();
  OUTLINED_FUNCTION_93();
  return v4 & 1;
}

uint64_t sub_2608760A4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  OUTLINED_FUNCTION_6_32(a1, a2, a3, a4);
  OUTLINED_FUNCTION_27_4();
  sub_26082D27C();
  if (qword_26A8B44C8 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_18_3();
  uint64_t v5 = HIDReportDescriptor.reportBitCount(for:)(3u);
  HIDReport.init(bitCount:id:)(v5, 3);
  OUTLINED_FUNCTION_3_39();
  OUTLINED_FUNCTION_14_16();
  OUTLINED_FUNCTION_93();
  return v4 & 1;
}

uint64_t sub_260876148(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  OUTLINED_FUNCTION_6_32(a1, a2, a3, a4);
  uint64_t v5 = OUTLINED_FUNCTION_27_4();
  sub_26082D814(v5, v6);
  if (qword_26A8B44D8 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_18_3();
  uint64_t v7 = HIDReportDescriptor.reportBitCount(for:)(2u);
  HIDReport.init(bitCount:id:)(v7, 2);
  OUTLINED_FUNCTION_3_39();
  OUTLINED_FUNCTION_14_16();
  OUTLINED_FUNCTION_93();
  return v4 & 1;
}

BOOL sub_2608761EC(int a1, int a2)
{
  return (a2 & a1) == 0;
}

uint64_t sub_2608761F8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  OUTLINED_FUNCTION_6_32(a1, a2, a3, a4);
  uint64_t v5 = OUTLINED_FUNCTION_27_4();
  sub_26082D364(v5, v6);
  if (qword_26A8B4540 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_18_3();
  uint64_t v7 = HIDReportDescriptor.reportBitCount(for:)(6u);
  HIDReport.init(bitCount:id:)(v7, 6);
  OUTLINED_FUNCTION_3_39();
  OUTLINED_FUNCTION_14_16();
  OUTLINED_FUNCTION_93();
  return v4 & 1;
}

BOOL sub_26087629C(unsigned __int8 a1, unsigned __int8 a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_2608762AC(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

#error "2608763C0: call analysis failed (funcsize=129)"

uint64_t sub_260876508(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for EventReportSenderID();
  OUTLINED_FUNCTION_0_0();
  uint64_t v45 = v4;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  unint64_t v11 = (char *)&v42 - v10;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_58_2();
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  unint64_t v15 = (char *)&v42 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v44 = (uint64_t)&v42 - v16;
  sub_26087A998(&qword_26A8B4738, (void (*)(uint64_t))type metadata accessor for EventReportSenderID);
  uint64_t v51 = v3;
  unint64_t v17 = (void *)sub_26087B4A0();
  sub_2607F5FF8(v53, a1);
  uint64_t v46 = v53[0];
  uint64_t v42 = v53[1];
  int64_t v49 = v53[3];
  unint64_t v18 = v54;
  int64_t v43 = (unint64_t)(v53[2] + 64) >> 6;
  if (!v54) {
    goto LABEL_3;
  }
LABEL_2:
  uint64_t v50 = (v18 - 1) & v18;
  for (unint64_t i = __clz(__rbit64(v18)) | (v49 << 6); ; unint64_t i = __clz(__rbit64(v21)) + (v22 << 6))
  {
    uint64_t v27 = *(void *)(v45 + 72);
    uint64_t v28 = v44;
    sub_2607F6B78(*(void *)(v46 + 48) + v27 * i, v44);
    sub_2607F6BDC(v28, (uint64_t)v15);
    sub_26087BCA0();
    uint64_t v29 = sub_26087B0F0();
    unint64_t v30 = sub_26087A998(&qword_26A8B4750, MEMORY[0x263F07508]);
    swift_bridgeObjectRetain();
    unint64_t v47 = v30;
    uint64_t v48 = v29;
    sub_26087B220();
    uint64_t v31 = *(int *)(v51 + 20);
    sub_26087BCF0();
    sub_26087BD00();
    OUTLINED_FUNCTION_20_11();
    if (v32)
    {
      while (1)
      {
        sub_2607F6B78(v17[6] + v30 * v27, (uint64_t)v8);
        if ((sub_26087B0B0() & 1) != 0 && *(void *)&v8[*(int *)(v51 + 20)] == *(void *)&v15[v31]) {
          break;
        }
        sub_2607F6C40((uint64_t)v8);
        OUTLINED_FUNCTION_35_2();
        if ((v33 & 1) == 0) {
          goto LABEL_26;
        }
      }
      sub_2607F6C40((uint64_t)v8);
      goto LABEL_39;
    }
LABEL_26:
    swift_bridgeObjectRelease();
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_2607F6B78((uint64_t)v15, v1);
    uint64_t v52 = v17;
    if (v17[3] <= v17[2]) {
      break;
    }
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      sub_26086ABD8();
    }
LABEL_37:
    unint64_t v17 = v52;
    *(void *)((char *)v52 + ((v30 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) |= 1 << v30;
    sub_2607F6BDC(v1, v17[6] + v30 * v27);
    uint64_t v39 = v17[2];
    BOOL v24 = __OFADD__(v39, 1);
    uint64_t v40 = v39 + 1;
    if (v24)
    {
      __break(1u);
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
    v17[2] = v40;
LABEL_39:
    swift_bridgeObjectRelease();
    sub_2607F6C40((uint64_t)v15);
    unint64_t v18 = v50;
    if (v50) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v20 = v49 + 1;
    if (__OFADD__(v49, 1)) {
      goto LABEL_43;
    }
    if (v20 >= v43) {
      goto LABEL_41;
    }
    unint64_t v21 = *(void *)(v42 + 8 * v20);
    int64_t v22 = v49 + 1;
    if (!v21)
    {
      OUTLINED_FUNCTION_42_1();
      if (v23 == v24) {
        goto LABEL_41;
      }
      OUTLINED_FUNCTION_41_2();
      if (!v21)
      {
        OUTLINED_FUNCTION_42_1();
        if (v23 == v24) {
          goto LABEL_41;
        }
        OUTLINED_FUNCTION_41_2();
        if (!v21)
        {
          OUTLINED_FUNCTION_42_1();
          if (v23 == v24) {
            goto LABEL_41;
          }
          OUTLINED_FUNCTION_41_2();
          if (!v21)
          {
            int64_t v22 = v25 + 4;
            if (v25 + 4 >= v43) {
              goto LABEL_41;
            }
            unint64_t v21 = *(void *)(v42 + 8 * v22);
            if (!v21)
            {
              int64_t v26 = v49 + 6;
              while (v26 < v43)
              {
                unint64_t v21 = *(void *)(v42 + 8 * v26++);
                if (v21)
                {
                  int64_t v22 = v26 - 1;
                  goto LABEL_21;
                }
              }
LABEL_41:
              swift_release();
              return (uint64_t)v17;
            }
          }
        }
      }
    }
LABEL_21:
    int64_t v49 = v22;
    uint64_t v50 = (v21 - 1) & v21;
  }
  if (isUniquelyReferenced_nonNull_native) {
    sub_26086A148();
  }
  else {
    sub_26086B124();
  }
  unint64_t v30 = v47;
  unint64_t v35 = v52;
  sub_26087BCA0();
  sub_26087B220();
  uint64_t v36 = *(int *)(v51 + 20);
  sub_26087BCF0();
  sub_26087BD00();
  OUTLINED_FUNCTION_20_11();
  if ((v37 & 1) == 0) {
    goto LABEL_37;
  }
  while (1)
  {
    sub_2607F6B78(v35[6] + v30 * v27, (uint64_t)v11);
    OUTLINED_FUNCTION_52_2();
    if ((sub_26087B0B0() & 1) != 0 && *(void *)&v11[*(int *)(v51 + 20)] == *(void *)(v1 + v36)) {
      break;
    }
    sub_2607F6C40((uint64_t)v11);
    OUTLINED_FUNCTION_35_2();
    if ((v38 & 1) == 0) {
      goto LABEL_37;
    }
  }
LABEL_44:
  sub_2607F6C40((uint64_t)v11);
  uint64_t result = sub_26087BC20();
  __break(1u);
  return result;
}

uint64_t sub_260876A40(uint64_t a1)
{
  sub_260834C6C();
  uint64_t v2 = sub_26087B4A0();
  uint64_t v9 = v2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      uint64_t v5 = a1 + i;
      sub_260869F04(&v8, *(unsigned __int8 *)(v5 + 32));
    }
    swift_bridgeObjectRelease();
    return v9;
  }
  else
  {
    uint64_t v6 = v2;
    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t sub_260876ADC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = OUTLINED_FUNCTION_15_16(a1, a2);
  unsigned int v3 = AppleVendorKeyboardReport.update(with:)(v2);
  return OUTLINED_FUNCTION_53_2(v3);
}

uint64_t sub_260876B0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = OUTLINED_FUNCTION_15_16(a1, a2);
  unsigned int v3 = AppleVendorTopCaseReport.update(with:)(v2);
  return OUTLINED_FUNCTION_53_2(v3);
}

uint64_t sub_260876B3C(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v2 = OUTLINED_FUNCTION_15_16(a1, a2);
  unsigned int v3 = KeyboardReport.update(with:)(v2);
  return OUTLINED_FUNCTION_53_2(v3);
}

uint64_t sub_260876B6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = OUTLINED_FUNCTION_15_16(a1, a2);
  uint64_t result = (ConsumerReport.update(with:)(v4) >> 16) & 1;
  *unsigned int v3 = v2;
  return result;
}

uint64_t sub_260876BA0(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v2 = OUTLINED_FUNCTION_15_16(a1, a2);
  unsigned int v3 = ButtonReport.update(with:)(v2);
  return OUTLINED_FUNCTION_53_2(v3);
}

#error "260876D5C: call analysis failed (funcsize=112)"

#error "260876F28: call analysis failed (funcsize=112)"

#error "260877140: call analysis failed (funcsize=131)"

double sub_260877180@<D0>(unint64_t a1@<X0>, long long *a2@<X8>)
{
  void (*v6)(void *__return_ptr, void);
  uint64_t (*v7)(void);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  int64_t v20;
  int v21;
  char v22;
  char v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  double result;
  uint64_t (*v35)(void);
  void (*v36)(void *__return_ptr, void);
  void (*v37)(__int16 *__return_ptr, char *);
  int64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int16 v41;
  long long v42;
  uint64_t v43;

  if (qword_26A8B44C0 != -1) {
LABEL_41:
  }
    swift_once();
  uint64_t v42 = xmmword_26A8B4820;
  uint64_t v3 = HIDReportDescriptor.reportBitCount(for:)(1u);
  *(void *)&uint64_t v42 = HIDReport.init(bitCount:id:)(v3, 1);
  *((void *)&v42 + 1) = v4;
  uint64_t v5 = *(void *)a1;
  uint64_t v6 = *(void (**)(void *__return_ptr, void))(a1 + 8);
  char v8 = *(void *)(a1 + 16);
  uint64_t v7 = *(uint64_t (**)(void))(a1 + 24);
  uint64_t v9 = *(void *)(*(void *)a1 + 64);
  uint64_t v39 = *(void *)a1 + 64;
  int64_t v43 = v5;
  uint64_t v10 = -1 << *(unsigned char *)(v5 + 32);
  if (-v10 < 64) {
    unint64_t v11 = ~(-1 << -(char)v10);
  }
  else {
    unint64_t v11 = -1;
  }
  uint64_t v12 = v11 & v9;
  uint64_t v13 = *(void *)(a1 + 32);
  char v37 = *(void (**)(__int16 *__return_ptr, char *))(a1 + 40);
  a1 = *(void *)(a1 + 48);
  sub_26087A940((uint64_t)&v43);
  char v38 = (unint64_t)(63 - v10) >> 6;
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v14 = 0;
  unint64_t v35 = v7;
  uint64_t v36 = v6;
  while (v12)
  {
    unint64_t v15 = __clz(__rbit64(v12));
    v12 &= v12 - 1;
    uint64_t v16 = v15 | (v14 << 6);
LABEL_18:
    unint64_t v21 = *(_DWORD *)(*(void *)(v5 + 48) + 4 * v16);
    int64_t v22 = *(unsigned char *)(*(void *)(v5 + 56) + v16);
    *(_DWORD *)((char *)&v40 + 2) = v21;
    BYTE6(v40) = v22;
    v6(&v40, (char *)&v40 + 2);
    a1 = v40;
    char v23 = BYTE1(v40);
    unint64_t v41 = v40;
    if (v7(&v41))
    {
      BYTE2(v40) = a1;
      BYTE3(v40) = v23;
      v37(&v41, (char *)&v40 + 2);
      BOOL v24 = v41 + 8;
      uint64_t v25 = v42;
      a1 = *((void *)&v42 + 1) >> 62;
      int64_t v26 = 0;
      uint64_t v27 = (int)v42;
      switch(*((void *)&v42 + 1) >> 62)
      {
        case 1:
          int64_t v26 = (int)v42;
          break;
        case 2:
          int64_t v26 = *(void *)(v42 + 16);
          break;
        default:
          break;
      }
      if (__OFADD__(v26, v24 >> 3))
      {
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        goto LABEL_41;
      }
      uint64_t v28 = v5;
      uint64_t v29 = v13;
      unint64_t v30 = v8;
      uint64_t v31 = v24 >> 3;
      char v32 = v41 & 7;
      sub_26087B080();
      switch((int)a1)
      {
        case 1:
          goto LABEL_25;
        case 2:
          uint64_t v27 = *(void *)(v25 + 16);
LABEL_25:
          if (!__OFADD__(v27, v31)) {
            goto LABEL_26;
          }
          goto LABEL_40;
        default:
LABEL_26:
          a1 = (1 << v32);
          sub_26087B080();
          sub_26087AFD0();
          char v8 = v30;
          uint64_t v13 = v29;
          uint64_t v5 = v28;
          uint64_t v7 = v35;
          uint64_t v6 = v36;
          break;
      }
    }
  }
  unint64_t v17 = v14 + 1;
  if (__OFADD__(v14, 1)) {
    goto LABEL_39;
  }
  if (v17 >= v38) {
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v39 + 8 * v17);
  if (v18)
  {
LABEL_17:
    uint64_t v12 = (v18 - 1) & v18;
    uint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    uint64_t v14 = v17;
    goto LABEL_18;
  }
  uint64_t v19 = v14 + 2;
  if (v14 + 2 >= v38) {
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v39 + 8 * v19);
  if (v18)
  {
LABEL_13:
    unint64_t v17 = v19;
    goto LABEL_17;
  }
  int64_t v20 = v14 + 3;
  if (v14 + 3 >= v38) {
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v39 + 8 * v20);
  if (v18) {
    goto LABEL_16;
  }
  uint64_t v19 = v14 + 4;
  if (v14 + 4 >= v38) {
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v39 + 8 * v19);
  if (v18) {
    goto LABEL_13;
  }
  int64_t v20 = v14 + 5;
  if (v14 + 5 >= v38) {
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v39 + 8 * v20);
  if (v18)
  {
LABEL_16:
    unint64_t v17 = v20;
    goto LABEL_17;
  }
  uint64_t v19 = v14 + 6;
  if (v14 + 6 >= v38) {
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v39 + 8 * v19);
  if (v18) {
    goto LABEL_13;
  }
  while (1)
  {
    unint64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
      __break(1u);
      JUMPOUT(0x260877598);
    }
    if (v17 >= v38) {
      break;
    }
    unint64_t v18 = *(void *)(v39 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_17;
    }
  }
LABEL_37:
  sub_26087A96C((uint64_t)&v43);
  swift_release();
  swift_release();
  swift_release();
  sub_260842BA4();
  swift_release();
  swift_release();
  swift_release();
  uint64_t result = *(double *)&v42;
  *a2 = v42;
  return result;
}

uint64_t sub_2608775B8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  if (qword_26A8B44B0 != -1) {
    goto LABEL_9;
  }
  while (1)
  {
    uint64_t v4 = HIDReportDescriptor.reportBitCount(for:)(4u);
    uint64_t v5 = HIDReport.init(bitCount:id:)(v4, 4);
    uint64_t v7 = v6;
    uint64_t v12 = v6;
    unint64_t v8 = *(void *)(a1 + 16);
    swift_bridgeObjectRetain();
    if (!v8) {
      break;
    }
    unint64_t v9 = 0;
    while (v9 < v8)
    {
      unint64_t v10 = v9 + 1;
      AppleVendorTopCaseReport.update(with:)(*(unsigned __int8 *)(a1 + 32 + v9));
      unint64_t v8 = *(void *)(a1 + 16);
      unint64_t v9 = v10;
      if (v10 == v8)
      {
        uint64_t v7 = v12;
        goto LABEL_7;
      }
    }
    __break(1u);
LABEL_9:
    swift_once();
  }
LABEL_7:
  uint64_t result = swift_bridgeObjectRelease_n();
  *a2 = v5;
  a2[1] = v7;
  return result;
}

uint64_t sub_2608776AC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  if (qword_26A8B44C0 != -1) {
    goto LABEL_48;
  }
  while (1)
  {
    uint64_t v4 = HIDReportDescriptor.reportBitCount(for:)(1u);
    uint64_t v5 = HIDReport.init(bitCount:id:)(v4, 1);
    unint64_t v7 = v6;
    unint64_t v25 = v6;
    unint64_t v8 = *(void *)(a1 + 16);
    swift_bridgeObjectRetain();
    if (!v8) {
      break;
    }
    BOOL v24 = a2;
    unint64_t v9 = 0;
    while (2)
    {
      if (v9 < v8)
      {
        uint64_t v10 = v9++;
        unint64_t v11 = *(unsigned __int8 *)(a1 + 32 + v10) + 8;
        a2 = (void *)v5;
        uint64_t v12 = 0;
        switch(v25 >> 62)
        {
          case 1uLL:
            uint64_t v12 = (int)v5;
            break;
          case 2uLL:
            uint64_t v12 = *(void *)(v5 + 16);
            break;
          default:
            break;
        }
        BOOL v13 = __OFADD__(v12, v11 >> 3);
        uint64_t v14 = v12 + (v11 >> 3);
        if (v13) {
          goto LABEL_36;
        }
        unint64_t v15 = v11 >> 3;
        switch(v25 >> 62)
        {
          case 1uLL:
            uint64_t v16 = v5 >> 32;
            if (v14 < (int)v5 || v14 >= v16) {
              goto LABEL_38;
            }
            if (!sub_26087AED0())
            {
LABEL_50:
              __break(1u);
LABEL_51:
              __break(1u);
LABEL_52:
              __break(1u);
LABEL_53:
              __break(1u);
            }
            sub_26087AEF0();
            uint64_t v18 = (int)v5 + v15;
            if (v18 >= v16) {
              goto LABEL_41;
            }
            uint64_t v19 = sub_26087AED0();
            if (!v19) {
              goto LABEL_51;
            }
            a2 = (void *)v19;
            if (__OFSUB__(v18, sub_26087AEF0())) {
              goto LABEL_43;
            }
LABEL_32:
            sub_26087AFD0();
            unint64_t v8 = *(void *)(a1 + 16);
            if (v9 != v8) {
              continue;
            }
            unint64_t v7 = v25;
            a2 = v24;
            break;
          case 2uLL:
            if (v14 < *(void *)(v5 + 16)) {
              goto LABEL_39;
            }
            if (v14 >= *(void *)(v5 + 24)) {
              goto LABEL_42;
            }
            if (!sub_26087AED0()) {
              goto LABEL_52;
            }
            sub_26087AEF0();
            uint64_t v20 = *(void *)(v5 + 16);
            BOOL v13 = __OFADD__(v20, v15);
            uint64_t v21 = v20 + v15;
            if (v13) {
              goto LABEL_44;
            }
            if (v21 < v20) {
              goto LABEL_45;
            }
            if (v21 >= *(void *)(v5 + 24)) {
              goto LABEL_46;
            }
            uint64_t v22 = sub_26087AED0();
            if (!v22) {
              goto LABEL_53;
            }
            a2 = (void *)v22;
            if (!__OFSUB__(v21, sub_26087AEF0())) {
              goto LABEL_32;
            }
            goto LABEL_47;
          case 3uLL:
            __break(1u);
            goto LABEL_50;
          default:
            if (v14 >= BYTE6(v25)) {
              goto LABEL_37;
            }
            if (v15 < BYTE6(v25)) {
              goto LABEL_32;
            }
            goto LABEL_40;
        }
        goto LABEL_34;
      }
      break;
    }
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
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
LABEL_47:
    __break(1u);
LABEL_48:
    swift_once();
  }
LABEL_34:
  uint64_t result = swift_bridgeObjectRelease_n();
  *a2 = v5;
  a2[1] = v7;
  return result;
}

uint64_t sub_260877A08@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  if (qword_26A8B44C8 != -1) {
    goto LABEL_9;
  }
  while (1)
  {
    uint64_t v4 = HIDReportDescriptor.reportBitCount(for:)(3u);
    uint64_t v5 = HIDReport.init(bitCount:id:)(v4, 3);
    uint64_t v7 = v6;
    uint64_t v12 = v6;
    unint64_t v8 = *(void *)(a1 + 16);
    swift_bridgeObjectRetain();
    if (!v8) {
      break;
    }
    unint64_t v9 = 0;
    while (v9 < v8)
    {
      unint64_t v10 = v9 + 1;
      AppleVendorKeyboardReport.update(with:)(*(unsigned __int8 *)(a1 + 32 + v9));
      unint64_t v8 = *(void *)(a1 + 16);
      unint64_t v9 = v10;
      if (v10 == v8)
      {
        uint64_t v7 = v12;
        goto LABEL_7;
      }
    }
    __break(1u);
LABEL_9:
    swift_once();
  }
LABEL_7:
  uint64_t result = swift_bridgeObjectRelease_n();
  *a2 = v5;
  a2[1] = v7;
  return result;
}

uint64_t sub_260877AFC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  if (qword_26A8B44D8 != -1) {
    goto LABEL_9;
  }
  while (1)
  {
    uint64_t v4 = HIDReportDescriptor.reportBitCount(for:)(2u);
    uint64_t v5 = HIDReport.init(bitCount:id:)(v4, 2);
    uint64_t v7 = v6;
    uint64_t v12 = v6;
    unint64_t v8 = *(void *)(a1 + 16);
    swift_bridgeObjectRetain();
    if (!v8) {
      break;
    }
    unint64_t v9 = 0;
    while (v9 < v8)
    {
      unint64_t v10 = v9 + 1;
      ConsumerReport.update(with:)(*(unsigned __int16 *)(a1 + 32 + 2 * v9));
      unint64_t v8 = *(void *)(a1 + 16);
      unint64_t v9 = v10;
      if (v10 == v8)
      {
        uint64_t v7 = v12;
        goto LABEL_7;
      }
    }
    __break(1u);
LABEL_9:
    swift_once();
  }
LABEL_7:
  uint64_t result = swift_bridgeObjectRelease_n();
  *a2 = v5;
  a2[1] = v7;
  return result;
}

uint64_t sub_260877BF0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  if (qword_26A8B4540 != -1) {
    goto LABEL_48;
  }
  while (1)
  {
    uint64_t v4 = HIDReportDescriptor.reportBitCount(for:)(6u);
    uint64_t v5 = HIDReport.init(bitCount:id:)(v4, 6);
    unint64_t v7 = v6;
    unint64_t v25 = v6;
    unint64_t v8 = *(void *)(a1 + 16);
    swift_bridgeObjectRetain();
    if (!v8) {
      break;
    }
    BOOL v24 = a2;
    unint64_t v9 = 0;
    while (2)
    {
      if (v9 < v8)
      {
        uint64_t v10 = v9++;
        unint64_t v11 = *(unsigned __int8 *)(a1 + 32 + v10) + 8;
        a2 = (void *)v5;
        uint64_t v12 = 0;
        switch(v25 >> 62)
        {
          case 1uLL:
            uint64_t v12 = (int)v5;
            break;
          case 2uLL:
            uint64_t v12 = *(void *)(v5 + 16);
            break;
          default:
            break;
        }
        BOOL v13 = __OFADD__(v12, v11 >> 3);
        uint64_t v14 = v12 + (v11 >> 3);
        if (v13) {
          goto LABEL_36;
        }
        unint64_t v15 = v11 >> 3;
        switch(v25 >> 62)
        {
          case 1uLL:
            uint64_t v16 = v5 >> 32;
            if (v14 < (int)v5 || v14 >= v16) {
              goto LABEL_38;
            }
            if (!sub_26087AED0())
            {
LABEL_50:
              __break(1u);
LABEL_51:
              __break(1u);
LABEL_52:
              __break(1u);
LABEL_53:
              __break(1u);
            }
            sub_26087AEF0();
            uint64_t v18 = (int)v5 + v15;
            if (v18 >= v16) {
              goto LABEL_41;
            }
            uint64_t v19 = sub_26087AED0();
            if (!v19) {
              goto LABEL_51;
            }
            a2 = (void *)v19;
            if (__OFSUB__(v18, sub_26087AEF0())) {
              goto LABEL_43;
            }
LABEL_32:
            sub_26087AFD0();
            unint64_t v8 = *(void *)(a1 + 16);
            if (v9 != v8) {
              continue;
            }
            unint64_t v7 = v25;
            a2 = v24;
            break;
          case 2uLL:
            if (v14 < *(void *)(v5 + 16)) {
              goto LABEL_39;
            }
            if (v14 >= *(void *)(v5 + 24)) {
              goto LABEL_42;
            }
            if (!sub_26087AED0()) {
              goto LABEL_52;
            }
            sub_26087AEF0();
            uint64_t v20 = *(void *)(v5 + 16);
            BOOL v13 = __OFADD__(v20, v15);
            uint64_t v21 = v20 + v15;
            if (v13) {
              goto LABEL_44;
            }
            if (v21 < v20) {
              goto LABEL_45;
            }
            if (v21 >= *(void *)(v5 + 24)) {
              goto LABEL_46;
            }
            uint64_t v22 = sub_26087AED0();
            if (!v22) {
              goto LABEL_53;
            }
            a2 = (void *)v22;
            if (!__OFSUB__(v21, sub_26087AEF0())) {
              goto LABEL_32;
            }
            goto LABEL_47;
          case 3uLL:
            __break(1u);
            goto LABEL_50;
          default:
            if (v14 >= BYTE6(v25)) {
              goto LABEL_37;
            }
            if (v15 < BYTE6(v25)) {
              goto LABEL_32;
            }
            goto LABEL_40;
        }
        goto LABEL_34;
      }
      break;
    }
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
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
LABEL_47:
    __break(1u);
LABEL_48:
    swift_once();
  }
LABEL_34:
  uint64_t result = swift_bridgeObjectRelease_n();
  *a2 = v5;
  a2[1] = v7;
  return result;
}

uint64_t KeyboardModifierMask.keyboardUsages()(unsigned __int8 a1)
{
  uint64_t v1 = qword_270C9E2A0;
  if (qword_270C9E2A0)
  {
    int v2 = a1;
    uint64_t v3 = MEMORY[0x263F8EE78];
    uint64_t v4 = &byte_270C9E2B0;
    do
    {
      int v6 = *v4++;
      int v5 = v6;
      if ((v6 & ~v2) == 0)
      {
        char v7 = v5 | 0xE0;
        if ((v5 | 0xE0u) <= 0xE7)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_2608225BC();
            uint64_t v3 = v9;
          }
          unint64_t v8 = *(void *)(v3 + 16);
          if (v8 >= *(void *)(v3 + 24) >> 1)
          {
            sub_2608225BC();
            uint64_t v3 = v10;
          }
          *(void *)(v3 + 16) = v8 + 1;
          *(unsigned char *)(v3 + v8 + 32) = v7;
        }
      }
      --v1;
    }
    while (v1);
  }
  else
  {
    uint64_t v3 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  return sub_260876A40(v3);
}

uint64_t KeyboardModifierMask.init(usages:)(uint64_t result)
{
  int64_t v1 = 0;
  uint64_t v2 = 0;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  if (!v6) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v8 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  for (unint64_t i = v8 | (v1 << 6); ; unint64_t i = __clz(__rbit64(v11)) + (v1 << 6))
  {
    char v13 = *(unsigned char *)(*(void *)(result + 48) + i);
    unsigned int v14 = (v13 + 24);
    int v15 = 1 << (v13 & 7);
    if (v14 < 0xF8) {
      int v15 = 0;
    }
    uint64_t v2 = v15 | v2;
    if (v6) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v10 = v1 + 1;
    if (__OFADD__(v1, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v10 >= v7) {
      goto LABEL_27;
    }
    unint64_t v11 = *(void *)(v3 + 8 * v10);
    ++v1;
    if (!v11)
    {
      int64_t v1 = v10 + 1;
      if (v10 + 1 >= v7) {
        goto LABEL_27;
      }
      unint64_t v11 = *(void *)(v3 + 8 * v1);
      if (!v11)
      {
        int64_t v1 = v10 + 2;
        if (v10 + 2 >= v7) {
          goto LABEL_27;
        }
        unint64_t v11 = *(void *)(v3 + 8 * v1);
        if (!v11)
        {
          int64_t v1 = v10 + 3;
          if (v10 + 3 >= v7) {
            goto LABEL_27;
          }
          unint64_t v11 = *(void *)(v3 + 8 * v1);
          if (!v11)
          {
            int64_t v1 = v10 + 4;
            if (v10 + 4 >= v7) {
              goto LABEL_27;
            }
            unint64_t v11 = *(void *)(v3 + 8 * v1);
            if (!v11) {
              break;
            }
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v11 - 1) & v11;
  }
  int64_t v12 = v10 + 5;
  if (v12 >= v7)
  {
LABEL_27:
    swift_release();
    return v2;
  }
  unint64_t v11 = *(void *)(v3 + 8 * v12);
  if (v11)
  {
    int64_t v1 = v12;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v1 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v1 >= v7) {
      goto LABEL_27;
    }
    unint64_t v11 = *(void *)(v3 + 8 * v1);
    ++v12;
    if (v11) {
      goto LABEL_22;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

double PointerReport.delta.getter()
{
  double v0 = (double)(char)_s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcig_0();
  _s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcig_0();
  return v0;
}

unint64_t PointerReport.buttonMask.getter()
{
  return _s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcig_0();
}

unint64_t PointerReport.modifierMask.getter()
{
  return _s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcig_0();
}

uint64_t PointerReport.x.getter()
{
  return (char)_s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcig_0();
}

uint64_t PointerReport.y.getter()
{
  return (char)_s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcig_0();
}

#error "2608782A0: call analysis failed (funcsize=9)"

#error "2608782C4: call analysis failed (funcsize=9)"

#error "2608782F0: call analysis failed (funcsize=12)"

#error "26087832C: call analysis failed (funcsize=27)"

void PointerReport.remoteTimestamp.setter()
{
  uint64_t v1 = *v0;
  switch((unint64_t)v0[1] >> 62)
  {
    case 1uLL:
      if (!__OFSUB__(HIDWORD(v1), v1)) {
        goto LABEL_5;
      }
      goto LABEL_11;
    case 2uLL:
      if (!__OFSUB__(*(void *)(v1 + 24), *(void *)(v1 + 16))) {
        goto LABEL_5;
      }
      goto LABEL_12;
    case 3uLL:
      return;
    default:
LABEL_5:
      OUTLINED_FUNCTION_2_1();
      if (!v5)
      {
        __break(1u);
LABEL_11:
        __break(1u);
LABEL_12:
        __break(1u);
        JUMPOUT(0x2608783F8);
      }
      if (v4 >= 25)
      {
        if (v3) {
          uint64_t v2 = 0;
        }
        _s12UniversalHID9HIDReportV_2ass5Int64VSi_AFmtcis_0(v2, 136);
      }
      return;
  }
}

uint64_t PointerReport.x.setter(uint64_t a1)
{
  uint64_t v1 = 127;
  if (a1 < 127) {
    uint64_t v1 = a1;
  }
  if (v1 <= -128) {
    uint64_t v2 = -128;
  }
  else {
    uint64_t v2 = v1;
  }
  return _s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcis_0(v2, 8);
}

uint64_t PointerReport.y.setter(uint64_t a1)
{
  uint64_t v1 = 127;
  if (a1 < 127) {
    uint64_t v1 = a1;
  }
  if (v1 <= -128) {
    uint64_t v2 = -128;
  }
  else {
    uint64_t v2 = v1;
  }
  return _s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcis_0(v2, 16);
}

uint64_t PointerReport.buttonMask.setter(uint64_t a1)
{
  return _s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcis_0(a1, 88);
}

void PointerReport.accelX.setter(double a1)
{
  unint64_t v1 = HIDFixed.init(doubleValue:)(a1);
  if ((v1 & 0x100000000) != 0) {
    unint64_t v1 = 0;
  }
  else {
    unint64_t v1 = v1;
  }
  _s12UniversalHID9HIDReportV_2ass5Int32VSi_AFmtcis_0(v1, 24);
}

void PointerReport.accelY.setter(double a1)
{
  unint64_t v1 = HIDFixed.init(doubleValue:)(a1);
  if ((v1 & 0x100000000) != 0) {
    unint64_t v1 = 0;
  }
  else {
    unint64_t v1 = v1;
  }
  _s12UniversalHID9HIDReportV_2ass5Int32VSi_AFmtcis_0(v1, 56);
}

void PointerReport.flags.setter(unsigned int *a1)
{
}

uint64_t static PointerReport.initialReportBitCount.getter()
{
  return 136;
}

uint64_t static PointerReport.reportID.getter()
{
  return 5;
}

uint64_t PointerReport.Flags.rawValue.getter()
{
  return *v0;
}

uint64_t PointerReport.Flags.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static PointerReport.Flags.accelerated.getter(_DWORD *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2608784F0@<X0>(unsigned int *a1@<X0>, _DWORD *a2@<X8>)
{
  return PointerReport.Flags.init(rawValue:)(*a1, a2);
}

uint64_t sub_2608784F8@<X0>(unsigned int *a1@<X0>, _DWORD *a2@<X8>)
{
  return sub_260875A44(*a1, *v2, a2);
}

uint64_t sub_260878504@<X0>(unsigned int *a1@<X0>, _DWORD *a2@<X8>)
{
  return sub_26082C528(*a1, *v2, a2);
}

uint64_t sub_260878510@<X0>(unsigned int *a1@<X0>, _DWORD *a2@<X8>)
{
  return sub_26082C540(*a1, *v2, a2);
}

void sub_26087851C(int *a1@<X0>, uint64_t a2@<X8>)
{
}

void sub_260878538(int *a1@<X0>, uint64_t a2@<X8>)
{
}

uint64_t sub_260878554@<X0>(unsigned int *a1@<X0>, int *a2@<X8>)
{
  return sub_260875B54(*a1, *v2, a2);
}

uint64_t sub_260878560@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = PointerReport.Flags.init(rawValue:)(*a1, (_DWORD *)a2);
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

uint64_t sub_26087858C@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = PointerReport.Flags.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_2608785B4@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  return sub_26087579C(a1, a2);
}

uint64_t sub_2608785CC()
{
  uint64_t result = sub_2608785F0();
  *(void *)&xmmword_26A8B57B8 = result;
  *((void *)&xmmword_26A8B57B8 + 1) = v1;
  return result;
}

uint64_t sub_2608785F0()
{
  LOBYTE(v15) = 17;
  uint64_t v0 = sub_2608155C0((char *)&v15, 1uLL);
  unint64_t v2 = v1;
  LOBYTE(v15) = 3;
  uint64_t v15 = sub_260815298((char *)&v15, 0);
  unint64_t v16 = v3;
  uint64_t v4 = sub_260878750();
  unint64_t v6 = v5;
  sub_26087B050();
  sub_2607DCF28(v4, v6);
  uint64_t v7 = sub_2607E6724((uint64_t)&unk_270C9E018);
  unint64_t v9 = v8;
  sub_26087B050();
  sub_2607DCF28(v7, v9);
  uint64_t v10 = v15;
  unint64_t v11 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B4660);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_26087EEC0;
  *(void *)(inited + 56) = &type metadata for Usage;
  *(void *)(inited + 64) = &protocol witness table for Usage;
  *(void *)(inited + 32) = v0;
  *(void *)(inited + 40) = v2;
  *(void *)(inited + 96) = &type metadata for PhysicalCollection;
  *(void *)(inited + 104) = &protocol witness table for PhysicalCollection;
  *(void *)(inited + 72) = v10;
  *(void *)(inited + 80) = v11;
  sub_2607DCED0(v0, v2);
  sub_2607DCED0(v10, v11);
  uint64_t v13 = static HIDReportDescriptor.Builder.buildBlock(_:)(inited);
  swift_setDeallocating();
  sub_2608374F8();
  sub_2607DCF28(v10, v11);
  sub_2607DCF28(v0, v2);
  return v13;
}

uint64_t sub_260878750()
{
  LOBYTE(v108[0]) = 5;
  uint64_t v0 = sub_2608155C0((char *)v108, 1uLL);
  unint64_t v78 = v1;
  uint64_t v79 = v0;
  LOBYTE(v108[0]) = 17;
  uint64_t v94 = sub_2608155C0((char *)v108, 0x30uLL);
  unint64_t v97 = v2;
  LOBYTE(v108[0]) = 17;
  uint64_t v93 = sub_2608155C0((char *)v108, 0x31uLL);
  unint64_t v96 = v3;
  LOBYTE(v108[0]) = 6;
  uint64_t v92 = sub_260815298((char *)v108, -127);
  unint64_t v5 = v4;
  unint64_t v55 = v4;
  LOBYTE(v108[0]) = 7;
  uint64_t v91 = sub_260815298((char *)v108, 127);
  unint64_t v7 = v6;
  unint64_t v54 = v6;
  LOBYTE(v108[0]) = 12;
  uint64_t v90 = sub_2608155C0((char *)v108, 8uLL);
  unint64_t v9 = v8;
  unint64_t v53 = v8;
  LOBYTE(v108[0]) = 14;
  uint64_t v87 = sub_260815298((char *)v108, 2);
  unint64_t v11 = v10;
  unint64_t v50 = v10;
  LOBYTE(v106[0]) = 0;
  LOBYTE(v104[0]) = 1;
  LOBYTE(v102[0]) = 1;
  LOBYTE(v100[0]) = 0;
  LOBYTE(v98[0]) = 0;
  *(_WORD *)&v107[1] = 0;
  Input.init(_:_:_:_:_:_:_:_:)((unsigned __int8 *)v106, v104, v102, v100, v98, &v107[2], &v107[1], v108);
  LOBYTE(v106[0]) = 12;
  uint64_t v12 = sub_2608155C0((char *)v106, 0x20uLL);
  unint64_t v76 = v13;
  uint64_t v77 = v12;
  LOBYTE(v106[0]) = 14;
  uint64_t v14 = sub_260815298((char *)v106, 2);
  unint64_t v74 = v15;
  uint64_t v75 = v14;
  LOBYTE(v104[0]) = 0;
  LOBYTE(v102[0]) = 1;
  LOBYTE(v100[0]) = 1;
  LOBYTE(v98[0]) = 0;
  memset(v107, 0, sizeof(v107));
  Input.init(_:_:_:_:_:_:_:_:)((unsigned __int8 *)v104, v102, v100, v98, &v107[2], &v107[1], v107, v106);
  LOBYTE(v104[0]) = 12;
  uint64_t v16 = sub_2608155C0((char *)v104, 8uLL);
  unint64_t v72 = v17;
  uint64_t v73 = v16;
  LOBYTE(v104[0]) = 14;
  uint64_t v47 = sub_260815298((char *)v104, 1);
  unint64_t v71 = v18;
  LOBYTE(v102[0]) = 0;
  LOBYTE(v100[0]) = 1;
  LOBYTE(v98[0]) = 1;
  memset(v107, 0, sizeof(v107));
  char v105 = 0;
  Input.init(_:_:_:_:_:_:_:_:)((unsigned __int8 *)v102, v100, v98, &v107[2], &v107[1], v107, &v105, v104);
  LOBYTE(v102[0]) = 12;
  uint64_t v46 = sub_2608155C0((char *)v102, 8uLL);
  unint64_t v70 = v19;
  LOBYTE(v102[0]) = 14;
  uint64_t v95 = sub_260815298((char *)v102, 1);
  unint64_t v66 = v20;
  LOBYTE(v100[0]) = 0;
  LOBYTE(v98[0]) = 1;
  v107[2] = 1;
  *(_WORD *)uint64_t v107 = 0;
  char v105 = 0;
  char v103 = 0;
  Input.init(_:_:_:_:_:_:_:_:)((unsigned __int8 *)v100, v98, &v107[2], &v107[1], v107, &v105, &v103, v102);
  LOBYTE(v100[0]) = 12;
  uint64_t v21 = sub_2608155C0((char *)v100, 0x20uLL);
  unint64_t v88 = v22;
  uint64_t v89 = v21;
  LOBYTE(v100[0]) = 14;
  uint64_t v23 = sub_260815298((char *)v100, 1);
  unint64_t v85 = v24;
  uint64_t v86 = v23;
  LOBYTE(v98[0]) = 0;
  v107[2] = 1;
  *(_WORD *)uint64_t v107 = 256;
  char v105 = 0;
  char v103 = 0;
  char v101 = 0;
  Input.init(_:_:_:_:_:_:_:_:)((unsigned __int8 *)v98, &v107[2], &v107[1], v107, &v105, &v103, &v101, v100);
  LOBYTE(v98[0]) = 5;
  uint64_t v25 = sub_2608155C0((char *)v98, 0xFF00uLL);
  unint64_t v83 = v26;
  uint64_t v84 = v25;
  LOBYTE(v98[0]) = 17;
  uint64_t v27 = sub_2608155C0((char *)v98, 0x102uLL);
  unint64_t v81 = v28;
  uint64_t v82 = v27;
  LOBYTE(v98[0]) = 6;
  uint64_t v80 = sub_260815298((char *)v98, 0);
  unint64_t v69 = v29;
  LOBYTE(v98[0]) = 7;
  uint64_t v30 = sub_260815298((char *)v98, 255);
  unint64_t v67 = v31;
  uint64_t v68 = v30;
  LOBYTE(v98[0]) = 12;
  uint64_t v32 = sub_2608155C0((char *)v98, 8uLL);
  unint64_t v64 = v33;
  uint64_t v65 = v32;
  LOBYTE(v98[0]) = 14;
  uint64_t v34 = sub_260815298((char *)v98, 8);
  unint64_t v62 = v35;
  uint64_t v63 = v34;
  v107[2] = 0;
  *(_WORD *)uint64_t v107 = 256;
  char v105 = 0;
  char v103 = 0;
  char v101 = 0;
  char v99 = 0;
  Input.init(_:_:_:_:_:_:_:_:)(&v107[2], &v107[1], v107, &v105, &v103, &v101, &v99, v98);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8B4660);
  uint64_t v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_2608838C0;
  *(void *)(v36 + 56) = &type metadata for ReportID;
  *(void *)(v36 + 64) = &protocol witness table for ReportID;
  *(unsigned char *)(v36 + 32) = 5;
  *(void *)(v36 + 96) = &type metadata for UsagePage;
  *(void *)(v36 + 104) = &protocol witness table for UsagePage;
  *(void *)(v36 + 72) = v79;
  *(void *)(v36 + 80) = v78;
  *(void *)(v36 + 136) = &type metadata for Usage;
  *(void *)(v36 + 144) = &protocol witness table for Usage;
  *(void *)(v36 + 112) = v94;
  *(void *)(v36 + 120) = v97;
  *(void *)(v36 + 176) = &type metadata for Usage;
  *(void *)(v36 + 184) = &protocol witness table for Usage;
  *(void *)(v36 + 152) = v93;
  *(void *)(v36 + 160) = v96;
  *(void *)(v36 + 216) = &type metadata for LogicalMinimum;
  *(void *)(v36 + 224) = &protocol witness table for LogicalMinimum;
  *(void *)(v36 + 192) = v92;
  *(void *)(v36 + 200) = v5;
  *(void *)(v36 + 256) = &type metadata for LogicalMaximum;
  *(void *)(v36 + 264) = &protocol witness table for LogicalMaximum;
  *(void *)(v36 + 232) = v91;
  *(void *)(v36 + 240) = v7;
  *(void *)(v36 + 296) = &type metadata for ReportSize;
  *(void *)(v36 + 304) = &protocol witness table for ReportSize;
  *(void *)(v36 + 272) = v90;
  *(void *)(v36 + 280) = v9;
  *(void *)(v36 + 336) = &type metadata for ReportCount;
  *(void *)(v36 + 344) = &protocol witness table for ReportCount;
  *(void *)(v36 + 312) = v87;
  *(void *)(v36 + 320) = v11;
  *(void *)(v36 + 896) = &type metadata for UsagePage;
  *(void *)(v36 + 904) = &protocol witness table for UsagePage;
  *(void *)(v36 + 936) = &type metadata for Usage;
  uint64_t v60 = v108[0];
  uint64_t v37 = v108[0];
  unint64_t v61 = v108[1];
  *(void *)(v36 + 944) = &protocol witness table for Usage;
  *(void *)(v36 + 376) = &type metadata for Input;
  *(void *)(v36 + 384) = &protocol witness table for Input;
  *(void *)(v36 + 352) = v37;
  *(void *)(v36 + 360) = v61;
  *(void *)(v36 + 416) = &type metadata for ReportSize;
  *(void *)(v36 + 424) = &protocol witness table for ReportSize;
  *(void *)(v36 + 392) = v77;
  *(void *)(v36 + 400) = v76;
  *(void *)(v36 + 456) = &type metadata for ReportCount;
  *(void *)(v36 + 464) = &protocol witness table for ReportCount;
  *(void *)(v36 + 432) = v75;
  *(void *)(v36 + 440) = v74;
  *(void *)(v36 + 976) = &type metadata for LogicalMinimum;
  *(void *)(v36 + 984) = &protocol witness table for LogicalMinimum;
  uint64_t v58 = v106[0];
  uint64_t v38 = v106[0];
  unint64_t v59 = v106[1];
  *(void *)(v36 + 496) = &type metadata for Input;
  *(void *)(v36 + 504) = &protocol witness table for Input;
  *(void *)(v36 + 472) = v38;
  *(void *)(v36 + 480) = v59;
  *(void *)(v36 + 536) = &type metadata for ReportSize;
  *(void *)(v36 + 544) = &protocol witness table for ReportSize;
  *(void *)(v36 + 512) = v73;
  *(void *)(v36 + 520) = v72;
  *(void *)(v36 + 576) = &type metadata for ReportCount;
  *(void *)(v36 + 584) = &protocol witness table for ReportCount;
  *(void *)(v36 + 552) = v47;
  *(void *)(v36 + 560) = v71;
  *(void *)(v36 + 1016) = &type metadata for LogicalMaximum;
  *(void *)(v36 + 1024) = &protocol witness table for LogicalMaximum;
  uint64_t v56 = v104[0];
  uint64_t v39 = v104[0];
  unint64_t v57 = v104[1];
  *(void *)(v36 + 616) = &type metadata for Input;
  *(void *)(v36 + 624) = &protocol witness table for Input;
  *(void *)(v36 + 592) = v39;
  *(void *)(v36 + 600) = v57;
  *(void *)(v36 + 656) = &type metadata for ReportSize;
  *(void *)(v36 + 664) = &protocol witness table for ReportSize;
  *(void *)(v36 + 632) = v46;
  *(void *)(v36 + 640) = v70;
  *(void *)(v36 + 696) = &type metadata for ReportCount;
  *(void *)(v36 + 704) = &protocol witness table for ReportCount;
  *(void *)(v36 + 672) = v95;
  *(void *)(v36 + 680) = v66;
  *(void *)(v36 + 776) = &type metadata for ReportSize;
  *(void *)(v36 + 784) = &protocol witness table for ReportSize;
  *(void *)(v36 + 1056) = &type metadata for ReportSize;
  *(void *)(v36 + 1064) = &protocol witness table for ReportSize;
  uint64_t v51 = v102[0];
  uint64_t v40 = v102[0];
  unint64_t v52 = v102[1];
  *(void *)(v36 + 736) = &type metadata for Input;
  *(void *)(v36 + 744) = &protocol witness table for Input;
  *(void *)(v36 + 712) = v40;
  *(void *)(v36 + 720) = v52;
  *(void *)(v36 + 752) = v89;
  *(void *)(v36 + 760) = v88;
  *(void *)(v36 + 816) = &type metadata for ReportCount;
  *(void *)(v36 + 824) = &protocol witness table for ReportCount;
  *(void *)(v36 + 792) = v86;
  *(void *)(v36 + 800) = v85;
  *(void *)(v36 + 1096) = &type metadata for ReportCount;
  *(void *)(v36 + 1104) = &protocol witness table for ReportCount;
  uint64_t v48 = v100[0];
  uint64_t v41 = v100[0];
  unint64_t v49 = v100[1];
  *(void *)(v36 + 856) = &type metadata for Input;
  *(void *)(v36 + 864) = &protocol witness table for Input;
  *(void *)(v36 + 832) = v41;
  *(void *)(v36 + 840) = v49;
  *(void *)(v36 + 872) = v84;
  *(void *)(v36 + 880) = v83;
  *(void *)(v36 + 912) = v82;
  *(void *)(v36 + 920) = v81;
  *(void *)(v36 + 952) = v80;
  *(void *)(v36 + 960) = v69;
  *(void *)(v36 + 992) = v68;
  *(void *)(v36 + 1000) = v67;
  *(void *)(v36 + 1032) = v65;
  *(void *)(v36 + 1040) = v64;
  *(void *)(v36 + 1072) = v63;
  *(void *)(v36 + 1080) = v62;
  *(void *)(v36 + 1136) = &type metadata for Input;
  *(void *)(v36 + 1144) = &protocol witness table for Input;
  uint64_t v43 = v98[0];
  unint64_t v44 = v98[1];
  *(void *)(v36 + 1112) = v98[0];
  *(void *)(v36 + 1120) = v44;
  sub_2607DCED0(v79, v78);
  sub_2607DCED0(v94, v97);
  sub_2607DCED0(v93, v96);
  sub_2607DCED0(v92, v55);
  sub_2607DCED0(v91, v54);
  sub_2607DCED0(v90, v53);
  sub_2607DCED0(v87, v50);
  sub_2607DCED0(v60, v61);
  sub_2607DCED0(v77, v76);
  sub_2607DCED0(v75, v74);
  sub_2607DCED0(v58, v59);
  sub_2607DCED0(v73, v72);
  sub_2607DCED0(v47, v71);
  sub_2607DCED0(v56, v57);
  sub_2607DCED0(v46, v70);
  sub_2607DCED0(v95, v66);
  sub_2607DCED0(v51, v52);
  sub_2607DCED0(v89, v88);
  sub_2607DCED0(v86, v85);
  sub_2607DCED0(v48, v49);
  sub_2607DCED0(v84, v83);
  sub_2607DCED0(v82, v81);
  sub_2607DCED0(v80, v69);
  sub_2607DCED0(v68, v67);
  sub_2607DCED0(v65, v64);
  sub_2607DCED0(v63, v62);
  sub_2607DCED0(v43, v44);
  uint64_t v45 = static HIDReportDescriptor.Builder.buildBlock(_:)(v36);
  swift_setDeallocating();
  sub_2608374F8();
  sub_2607DCF28(v43, v44);
  sub_2607DCF28(v63, v62);
  sub_2607DCF28(v65, v64);
  sub_2607DCF28(v68, v67);
  sub_2607DCF28(v80, v69);
  sub_2607DCF28(v82, v81);
  sub_2607DCF28(v84, v83);
  sub_2607DCF28(v48, v49);
  sub_2607DCF28(v86, v85);
  sub_2607DCF28(v89, v88);
  sub_2607DCF28(v51, v52);
  sub_2607DCF28(v95, v66);
  sub_2607DCF28(v46, v70);
  sub_2607DCF28(v56, v57);
  sub_2607DCF28(v47, v71);
  sub_2607DCF28(v73, v72);
  sub_2607DCF28(v58, v59);
  sub_2607DCF28(v75, v74);
  sub_2607DCF28(v77, v76);
  sub_2607DCF28(v60, v61);
  sub_2607DCF28(v87, v50);
  sub_2607DCF28(v90, v53);
  sub_2607DCF28(v91, v54);
  sub_2607DCF28(v92, v55);
  sub_2607DCF28(v93, v96);
  sub_2607DCF28(v94, v97);
  sub_2607DCF28(v79, v78);
  return v45;
}

uint64_t static PointerReport.descriptor.getter@<X0>(_OWORD *a1@<X8>)
{
  if (qword_26A8B4580 != -1) {
    swift_once();
  }
  long long v2 = xmmword_26A8B57B8;
  *a1 = xmmword_26A8B57B8;
  return sub_2607DCED0(v2, *((unint64_t *)&v2 + 1));
}

uint64_t sub_2608790B0()
{
  return 136;
}

uint64_t PointerReport.report.getter(uint64_t a1, unint64_t a2)
{
  return a1;
}

uint64_t PointerReport.report.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_2607DCF28(*(void *)v2, *(void *)(v2 + 8));
  *(void *)uint64_t v2 = a1;
  *(void *)(v2 + 8) = a2;
  return result;
}

uint64_t (*PointerReport.report.modify())()
{
  return nullsub_1;
}

uint64_t PointerReport.modifierMask.setter(uint64_t a1)
{
  return _s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcis_0(a1, 96);
}

uint64_t sub_260879150@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PointerReport.init(_report:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_260879178()
{
  return sub_260875978(*(void *)v0, *(void *)(v0 + 8));
}

uint64_t sub_2608791B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PointerReport.x.getter();
  *a1 = result;
  return result;
}

uint64_t (*PointerReport.x.modify(uint64_t a1))(uint64_t *a1)
{
  OUTLINED_FUNCTION_0_11(a1);
  *unint64_t v1 = (char)_s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcig_0();
  return sub_260879230;
}

uint64_t sub_260879230(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if (*a1 >= 127) {
    uint64_t v1 = 127;
  }
  if (v1 <= -128) {
    uint64_t v2 = -128;
  }
  else {
    uint64_t v2 = v1;
  }
  return _s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcis_0(v2, 8);
}

uint64_t sub_260879270@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PointerReport.y.getter();
  *a1 = result;
  return result;
}

uint64_t (*PointerReport.y.modify(uint64_t a1))(uint64_t *a1)
{
  OUTLINED_FUNCTION_0_11(a1);
  *uint64_t v1 = (char)_s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcig_0();
  return sub_2608792EC;
}

uint64_t sub_2608792EC(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if (*a1 >= 127) {
    uint64_t v1 = 127;
  }
  if (v1 <= -128) {
    uint64_t v2 = -128;
  }
  else {
    uint64_t v2 = v1;
  }
  return _s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcis_0(v2, 16);
}

void sub_26087932C(void *a1@<X0>, double *a2@<X8>)
{
  *a2 = PointerReport.accelX.getter(*a1, a1[1]);
}

#error "260879374: call analysis failed (funcsize=17)"

void sub_2608793A4(double *a1)
{
  unint64_t v1 = HIDFixed.init(doubleValue:)(*a1);
  if ((v1 & 0x100000000) != 0) {
    unint64_t v1 = 0;
  }
  else {
    unint64_t v1 = v1;
  }
  _s12UniversalHID9HIDReportV_2ass5Int32VSi_AFmtcis_0(v1, 24);
}

void sub_2608793DC(void *a1@<X0>, double *a2@<X8>)
{
  *a2 = PointerReport.accelY.getter(*a1, a1[1]);
}

#error "260879424: call analysis failed (funcsize=17)"

void sub_260879454(double *a1)
{
  unint64_t v1 = HIDFixed.init(doubleValue:)(*a1);
  if ((v1 & 0x100000000) != 0) {
    unint64_t v1 = 0;
  }
  else {
    unint64_t v1 = v1;
  }
  _s12UniversalHID9HIDReportV_2ass5Int32VSi_AFmtcis_0(v1, 56);
}

unint64_t sub_26087948C@<X0>(unsigned char *a1@<X8>)
{
  unint64_t result = PointerReport.buttonMask.getter();
  *a1 = result;
  return result;
}

uint64_t (*PointerReport.buttonMask.modify(void *a1))(uint64_t a1)
{
  OUTLINED_FUNCTION_1_20(a1);
  *(unsigned char *)(v1 + 8) = _s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcig_0();
  return sub_260879504;
}

uint64_t sub_260879504(uint64_t a1)
{
  return _s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcis_0(*(unsigned __int8 *)(a1 + 8), 88);
}

unint64_t sub_260879530@<X0>(unsigned char *a1@<X8>)
{
  unint64_t result = PointerReport.modifierMask.getter();
  *a1 = result;
  return result;
}

uint64_t (*PointerReport.modifierMask.modify(void *a1))(uint64_t a1)
{
  OUTLINED_FUNCTION_1_20(a1);
  *(unsigned char *)(v1 + 8) = _s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcig_0();
  return sub_2608795A8;
}

uint64_t sub_2608795A8(uint64_t a1)
{
  return _s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcis_0(*(unsigned __int8 *)(a1 + 8), 96);
}

void *sub_2608795D4@<X0>(void *a1@<X0>, _DWORD *a2@<X8>)
{
  unint64_t result = PointerReport.flags.getter(&v4, *a1, a1[1]);
  *a2 = v4;
  return result;
}

void sub_260879614(unsigned int *a1)
{
  unsigned int v1 = *a1;
  PointerReport.flags.setter(&v1);
}

#error "260879664: call analysis failed (funcsize=17)"

void sub_260879694(uint64_t a1)
{
}

uint64_t PointerReport.modifiers.getter()
{
  unsigned __int8 v0 = _s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcig_0();
  return KeyboardModifierMask.keyboardUsages()(v0);
}

uint64_t sub_2608796F4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PointerReport.modifiers.getter();
  *a1 = result;
  return result;
}

uint64_t sub_260879724()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return PointerReport.modifiers.setter(v0);
}

uint64_t PointerReport.modifiers.setter(uint64_t a1)
{
  uint64_t v1 = KeyboardModifierMask.init(usages:)(a1);
  return _s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcis_0(v1, 96);
}

uint64_t (*PointerReport.modifiers.modify(uint64_t a1))(uint64_t *a1, char a2)
{
  OUTLINED_FUNCTION_0_11(a1);
  unsigned __int8 v2 = _s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcig_0();
  *uint64_t v1 = KeyboardModifierMask.keyboardUsages()(v2);
  return sub_2608797C8;
}

uint64_t sub_2608797C8(uint64_t *a1, char a2)
{
  if (a2)
  {
    uint64_t v2 = swift_bridgeObjectRetain();
    uint64_t v3 = KeyboardModifierMask.init(usages:)(v2);
    _s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcis_0(v3, 96);
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = KeyboardModifierMask.init(usages:)(*a1);
    return _s12UniversalHID9HIDReportV_2ass4Int8VSi_AFmtcis_0(v5, 96);
  }
}

void sub_260879830(void *a1, void *a2)
{
  static PointerReport.== infix(_:_:)(*a1, a1[1], *a2, a2[1]);
}

uint64_t KeyboardModifierMask.rawValue.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*KeyboardModifierMask.rawValue.modify())()
{
  return nullsub_1;
}

uint64_t static KeyboardModifierMask._usageMask<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  unint64_t v8 = (char *)v69 - v7;
  OUTLINED_FUNCTION_0_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  unint64_t v70 = (char *)v69 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_19_0();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_21_6();
  v69[1] = v14;
  OUTLINED_FUNCTION_19_0();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_58_2();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_21_6();
  uint64_t v76 = v17;
  OUTLINED_FUNCTION_19_0();
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_21_6();
  uint64_t v75 = v19;
  OUTLINED_FUNCTION_19_0();
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_21_6();
  unint64_t v81 = v21;
  OUTLINED_FUNCTION_19_0();
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_21_6();
  uint64_t v80 = v23;
  OUTLINED_FUNCTION_19_0();
  MEMORY[0x270FA5388](v24);
  MEMORY[0x270FA5388](v25);
  uint64_t v27 = (char *)v69 - v26;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v72 = AssociatedTypeWitness;
  sub_26087BBF0();
  uint64_t v73 = v8;
  uint64_t v74 = v5;
  sub_26087BBC0();
  sub_26087B680();
  uint64_t v78 = v10;
  unint64_t v28 = *(void (**)(void))(v10 + 8);
  OUTLINED_FUNCTION_1_13();
  v28();
  if (sub_26087B700())
  {
    if (OUTLINED_FUNCTION_19_11() >= 64)
    {
      unint64_t v83 = -8;
      sub_2607DDC34();
      OUTLINED_FUNCTION_5_27();
      char v35 = OUTLINED_FUNCTION_43_0();
      OUTLINED_FUNCTION_1_13();
      v28();
      uint64_t v30 = v81;
      if (v35) {
        goto LABEL_27;
      }
    }
    else
    {
      uint64_t v29 = OUTLINED_FUNCTION_24_6();
      uint64_t v30 = v81;
      if (v29 < -8) {
        goto LABEL_27;
      }
    }
  }
  else
  {
    uint64_t v77 = v3;
    unint64_t v31 = v28;
    char v32 = OUTLINED_FUNCTION_7_27();
    uint64_t v33 = OUTLINED_FUNCTION_19_11();
    if (v32)
    {
      uint64_t v30 = v81;
      if (v33 <= 64)
      {
        OUTLINED_FUNCTION_40_2();
        sub_26087BBC0();
        OUTLINED_FUNCTION_30_2();
        char v36 = sub_26087B250();
        unint64_t v28 = v31;
        OUTLINED_FUNCTION_4_27();
        v31();
        OUTLINED_FUNCTION_61_2();
        v37();
        if (v36)
        {
          OUTLINED_FUNCTION_1_13();
          v31();
          goto LABEL_27;
        }
        uint64_t v38 = OUTLINED_FUNCTION_24_6();
        OUTLINED_FUNCTION_1_13();
        v31();
        uint64_t v3 = v77;
        if (v38 < -8) {
          goto LABEL_27;
        }
      }
      else
      {
        unint64_t v83 = -8;
        sub_2607DDC34();
        OUTLINED_FUNCTION_5_27();
        char v34 = OUTLINED_FUNCTION_43_0();
        unint64_t v28 = v31;
        OUTLINED_FUNCTION_4_27();
        v31();
        uint64_t v3 = v77;
        if (v34) {
          goto LABEL_27;
        }
      }
    }
    else
    {
      unint64_t v28 = v31;
      uint64_t v3 = v77;
      uint64_t v30 = v81;
      if (v33 < 64 && OUTLINED_FUNCTION_24_6() < -8) {
        goto LABEL_27;
      }
    }
  }
  uint64_t v79 = v28;
  char v39 = OUTLINED_FUNCTION_7_27();
  uint64_t v40 = OUTLINED_FUNCTION_19_11();
  if (v39)
  {
    if (v40 > 64) {
      goto LABEL_19;
    }
    goto LABEL_26;
  }
  if (v40 < 64)
  {
LABEL_26:
    uint64_t v48 = OUTLINED_FUNCTION_24_6();
    unint64_t v28 = v79;
    if (v48 <= 8) {
      goto LABEL_20;
    }
LABEL_27:
    ((void (*)(char *, uint64_t))v28)(v27, a2);
    return 0;
  }
LABEL_19:
  unint64_t v83 = 8;
  sub_2607DDC34();
  OUTLINED_FUNCTION_5_27();
  OUTLINED_FUNCTION_30_2();
  OUTLINED_FUNCTION_61_2();
  char v41 = sub_26087B250();
  unint64_t v28 = v79;
  OUTLINED_FUNCTION_4_27();
  v28();
  if (v41) {
    goto LABEL_27;
  }
LABEL_20:
  uint64_t v77 = v3;
  uint64_t v42 = *(void (**)(void))(v78 + 16);
  uint64_t v43 = v80;
  OUTLINED_FUNCTION_61_2();
  v42();
  char v44 = OUTLINED_FUNCTION_7_27();
  unint64_t v81 = v42;
  ((void (*)(void (*)(void), uint64_t, uint64_t))v42)(v30, v43, a2);
  if ((v44 & 1) == 0)
  {
    unint64_t v50 = v30;
    uint64_t v51 = a2;
    uint64_t v46 = v79;
    goto LABEL_30;
  }
  uint64_t v45 = OUTLINED_FUNCTION_19_11();
  uint64_t v46 = v79;
  OUTLINED_FUNCTION_4_27();
  v46();
  if (v45 <= 64) {
    goto LABEL_31;
  }
  uint64_t v47 = v77;
  ((void (*)(void (*)(void), uint64_t, uint64_t))v81)(v77, v80, a2);
  unint64_t v83 = 0x8000000000000000;
  if (OUTLINED_FUNCTION_7_27())
  {
    if (OUTLINED_FUNCTION_19_11() < 64) {
      goto LABEL_51;
    }
  }
  else
  {
    char v62 = OUTLINED_FUNCTION_7_27();
    uint64_t v63 = OUTLINED_FUNCTION_19_11();
    BOOL v65 = __OFSUB__(v63, 64);
    BOOL v64 = v63 - 64 < 0;
    if ((v62 & 1) == 0) {
      goto LABEL_49;
    }
    if (v63 <= 64)
    {
      unint64_t v70 = v27;
      OUTLINED_FUNCTION_40_2();
      sub_26087BBC0();
      OUTLINED_FUNCTION_30_2();
      char v67 = sub_26087B250();
      OUTLINED_FUNCTION_1_13();
      v46();
      OUTLINED_FUNCTION_61_2();
      v68();
      if (v67) {
        goto LABEL_56;
      }
      OUTLINED_FUNCTION_24_6();
      OUTLINED_FUNCTION_1_13();
      v46();
      goto LABEL_31;
    }
  }
  sub_2607DDC34();
  OUTLINED_FUNCTION_5_27();
  OUTLINED_FUNCTION_30_2();
  char v66 = sub_26087B250();
  OUTLINED_FUNCTION_1_13();
  v46();
  OUTLINED_FUNCTION_1_13();
  v46();
  if ((v66 & 1) == 0) {
    goto LABEL_31;
  }
  while (1)
  {
    __break(1u);
LABEL_49:
    uint64_t v47 = v77;
    if (v64 != v65) {
LABEL_51:
    }
      OUTLINED_FUNCTION_24_6();
    unint64_t v50 = v47;
    uint64_t v51 = a2;
LABEL_30:
    ((void (*)(void (*)(void), uint64_t))v46)(v50, v51);
LABEL_31:
    uint64_t v52 = OUTLINED_FUNCTION_19_11();
    uint64_t v53 = OUTLINED_FUNCTION_32_2();
    v54(v53);
    if (v52 < 65)
    {
      uint64_t v59 = OUTLINED_FUNCTION_19_11();
      OUTLINED_FUNCTION_1_13();
      v46();
      if (v59 != 64 || (OUTLINED_FUNCTION_7_27() & 1) != 0) {
        goto LABEL_43;
      }
    }
    else
    {
      OUTLINED_FUNCTION_1_13();
      v46();
    }
    uint64_t v55 = OUTLINED_FUNCTION_32_2();
    v56(v55);
    unint64_t v83 = 0x7FFFFFFFFFFFFFFFLL;
    char v57 = OUTLINED_FUNCTION_7_27();
    uint64_t v58 = OUTLINED_FUNCTION_19_11();
    if ((v57 & 1) == 0) {
      break;
    }
    if (v58 <= 64) {
      goto LABEL_41;
    }
    sub_2607DDC34();
LABEL_42:
    sub_26087B670();
    OUTLINED_FUNCTION_30_2();
    char v60 = sub_26087B250();
    uint64_t v46 = v79;
    OUTLINED_FUNCTION_4_27();
    v46();
    OUTLINED_FUNCTION_1_13();
    v46();
    if ((v60 & 1) == 0) {
      goto LABEL_43;
    }
    __break(1u);
LABEL_56:
    OUTLINED_FUNCTION_1_13();
    v46();
  }
  if (v58 >= 64)
  {
    uint64_t v82 = 0x7FFFFFFFFFFFFFFFLL;
    sub_2607DDC34();
    goto LABEL_42;
  }
LABEL_41:
  OUTLINED_FUNCTION_24_6();
  uint64_t v46 = v79;
  OUTLINED_FUNCTION_4_27();
  v46();
LABEL_43:
  unint64_t v61 = OUTLINED_FUNCTION_24_6();
  OUTLINED_FUNCTION_1_13();
  v46();
  OUTLINED_FUNCTION_1_13();
  v46();
  if (v61 >= 8) {
    return 0;
  }
  return (1 << v61);
}

void *static KeyboardModifierMask.allCases.getter()
{
  return &unk_270C9E290;
}

uint64_t sub_26087A0C4@<X0>(unsigned __int8 *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_260875A7C(*a1);
  *a2 = result;
  a2[1] = BYTE1(result) & 1;
  return result;
}

uint64_t sub_26087A0F8@<X0>(char *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_260875B08(*a1);
  *a2 = result;
  a2[1] = BYTE1(result) & 1;
  return result;
}

uint64_t sub_26087A12C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_2608757F4(a1);
  *a2 = result;
  return result;
}

uint64_t static KeyboardModifierMask.leftControl.getter()
{
  return 1;
}

uint64_t static KeyboardModifierMask.leftShift.getter()
{
  return 2;
}

uint64_t static KeyboardModifierMask.leftOption.getter()
{
  return 4;
}

uint64_t static KeyboardModifierMask.leftCommand.getter()
{
  return 8;
}

uint64_t static KeyboardModifierMask.rightControl.getter()
{
  return 16;
}

uint64_t static KeyboardModifierMask.rightShift.getter()
{
  return 32;
}

uint64_t static KeyboardModifierMask.rightOption.getter()
{
  return 64;
}

uint64_t static KeyboardModifierMask.rightCommand.getter()
{
  return 128;
}

void sub_26087A194(void *a1@<X8>)
{
  *a1 = &unk_270C9E290;
}

uint64_t PointerReport.remoteTimestamp.getter(uint64_t a1, unint64_t a2)
{
  uint64_t result = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v4) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_12;
      }
      uint64_t v4 = (int)v4;
LABEL_6:
      if ((unint64_t)(v4 - 0x1000000000000000) >> 61 != 7)
      {
        __break(1u);
LABEL_12:
        __break(1u);
LABEL_13:
        __break(1u);
        JUMPOUT(0x26087A254);
      }
      if (v4 >= 25) {
        return _s12UniversalHID9HIDReportV_2ass5Int64VSi_AFmtcig_0(136, a1, a2);
      }
      else {
        return 0;
      }
    case 2uLL:
      uint64_t v6 = *(void *)(a1 + 16);
      uint64_t v5 = *(void *)(a1 + 24);
      BOOL v7 = __OFSUB__(v5, v6);
      uint64_t v4 = v5 - v6;
      if (!v7) {
        goto LABEL_6;
      }
      goto LABEL_13;
    case 3uLL:
      return result;
    default:
      uint64_t v4 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_26087A264@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = PointerReport.remoteTimestamp.getter(*(void *)a1, *(void *)(a1 + 8));
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_26087A29C()
{
}

void (*PointerReport.remoteTimestamp.modify(uint64_t a1))(uint64_t *a1, char a2)
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *v1;
  char v4 = 1;
  uint64_t v5 = 0;
  switch((unint64_t)v1[1] >> 62)
  {
    case 1uLL:
      if (!__OFSUB__(HIDWORD(v3), v3)) {
        goto LABEL_5;
      }
      goto LABEL_11;
    case 2uLL:
      if (!__OFSUB__(*(void *)(v3 + 24), *(void *)(v3 + 16))) {
        goto LABEL_5;
      }
      goto LABEL_12;
    case 3uLL:
      goto LABEL_10;
    default:
LABEL_5:
      OUTLINED_FUNCTION_2_1();
      if (!v9)
      {
        __break(1u);
LABEL_11:
        __break(1u);
LABEL_12:
        __break(1u);
        JUMPOUT(0x26087A3A0);
      }
      if (v8 >= 25)
      {
        uint64_t v5 = _s12UniversalHID9HIDReportV_2ass5Int64VSi_AFmtcig_0(136, v6, v7);
        char v4 = 0;
      }
      else
      {
        uint64_t v5 = 0;
        char v4 = 1;
      }
LABEL_10:
      *(void *)a1 = v5;
      *(unsigned char *)(a1 + 8) = v4;
      return sub_26087A3B0;
  }
}

void sub_26087A3B0(uint64_t *a1, char a2)
{
  uint64_t v4 = *a1;
  int v5 = *((unsigned __int8 *)a1 + 8);
  uint64_t v6 = (uint64_t *)a1[2];
  if (a2)
  {
    PointerReport.remoteTimestamp.setter();
  }
  else
  {
    uint64_t v7 = *v6;
    switch((unint64_t)v6[1] >> 62)
    {
      case 1uLL:
        BOOL v8 = __OFSUB__(HIDWORD(v7), v7);
        uint64_t v9 = (HIDWORD(v7) - v7);
        if (v8) {
          goto LABEL_10;
        }
        goto LABEL_8;
      case 2uLL:
        uint64_t v12 = v7 + 16;
        uint64_t v10 = *(void *)(v7 + 16);
        uint64_t v11 = *(void *)(v12 + 8);
        BOOL v8 = __OFSUB__(v11, v10);
        uint64_t v9 = v11 - v10;
        if (!v8) {
          goto LABEL_8;
        }
        goto LABEL_11;
      case 3uLL:
        return;
      default:
LABEL_8:
        OUTLINED_FUNCTION_2_1();
        if (!v13)
        {
          __break(1u);
LABEL_10:
          __break(1u);
LABEL_11:
          __break(1u);
        }
        if (v9 >= 25)
        {
          if (v5) {
            uint64_t v4 = 0;
          }
          _s12UniversalHID9HIDReportV_2ass5Int64VSi_AFmtcis_0(v4, 136);
        }
        break;
    }
  }
}

uint64_t sub_26087A478()
{
  return PointerReport.remoteTimestamp.getter(*(void *)v0, *(void *)(v0 + 8));
}

void sub_26087A498()
{
}

void (*sub_26087A4A0(uint64_t a1))()
{
  *(void *)(a1 + 16) = v1;
  *(void *)a1 = PointerReport.remoteTimestamp.getter(*(void *)v1, *(void *)(v1 + 8));
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return sub_26087A4F4;
}

void sub_26087A4F4()
{
}

unint64_t sub_26087A528()
{
  unint64_t result = qword_26A8B57C8;
  if (!qword_26A8B57C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B57C8);
  }
  return result;
}

unint64_t sub_26087A578()
{
  unint64_t result = qword_26A8B57D0;
  if (!qword_26A8B57D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B57D0);
  }
  return result;
}

unint64_t sub_26087A5C8()
{
  unint64_t result = qword_26A8B57D8;
  if (!qword_26A8B57D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B57D8);
  }
  return result;
}

unint64_t sub_26087A618()
{
  unint64_t result = qword_26A8B57E0;
  if (!qword_26A8B57E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B57E0);
  }
  return result;
}

unint64_t sub_26087A668()
{
  unint64_t result = qword_26A8B57E8;
  if (!qword_26A8B57E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B57E8);
  }
  return result;
}

unint64_t sub_26087A6B8()
{
  unint64_t result = qword_26A8B57F0;
  if (!qword_26A8B57F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B57F0);
  }
  return result;
}

unint64_t sub_26087A708()
{
  unint64_t result = qword_26A8B57F8;
  if (!qword_26A8B57F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B57F8);
  }
  return result;
}

unint64_t sub_26087A758()
{
  unint64_t result = qword_26A8B5800;
  if (!qword_26A8B5800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5800);
  }
  return result;
}

unint64_t sub_26087A7A8()
{
  unint64_t result = qword_26A8B5808;
  if (!qword_26A8B5808)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_26A8B5810);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8B5808);
  }
  return result;
}

uint64_t sub_26087A800(uint64_t *a1)
{
  return PointerReport.x.setter(*a1);
}

uint64_t sub_26087A82C(uint64_t *a1)
{
  return PointerReport.y.setter(*a1);
}

void sub_26087A858(double *a1)
{
}

void sub_26087A884(double *a1)
{
}

uint64_t sub_26087A8B0(unsigned __int8 *a1)
{
  return PointerReport.buttonMask.setter(*a1);
}

uint64_t sub_26087A8DC(unsigned __int8 *a1)
{
  return PointerReport.modifierMask.setter(*a1);
}

void type metadata accessor for PointerReport.Flags()
{
}

void type metadata accessor for PointerReport()
{
}

void type metadata accessor for KeyboardModifierMask()
{
}

uint64_t sub_26087A940(uint64_t a1)
{
  return a1;
}

uint64_t sub_26087A96C(uint64_t a1)
{
  return a1;
}

uint64_t sub_26087A998(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_0_45()
{
  *(void *)(v1 - 88) = *v0;
  return sub_26087A940(v1 - 88);
}

uint64_t OUTLINED_FUNCTION_2_45(uint64_t a1, unint64_t a2)
{
  return sub_260875978(a1, a2);
}

void OUTLINED_FUNCTION_3_39()
{
  JUMPOUT(0x26121C450);
}

uint64_t OUTLINED_FUNCTION_5_27()
{
  return sub_26087B670();
}

uint64_t OUTLINED_FUNCTION_6_32(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_2607DCED0(a3, a4);
}

uint64_t OUTLINED_FUNCTION_7_27()
{
  return sub_26087B700();
}

uint64_t OUTLINED_FUNCTION_8_28()
{
  sub_260842BA4();
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_9_26()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_14_16()
{
  return sub_2607DCF28(v0, v1);
}

uint64_t OUTLINED_FUNCTION_15_16(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_16_16(uint64_t a1, unint64_t a2)
{
  return sub_260875978(a1, a2);
}

uint64_t OUTLINED_FUNCTION_19_11()
{
  return sub_26087B6F0();
}

uint64_t OUTLINED_FUNCTION_23_7(uint64_t a1, unint64_t a2)
{
  return sub_260875978(a1, a2);
}

uint64_t OUTLINED_FUNCTION_24_6()
{
  return sub_26087B6E0();
}

uint64_t OUTLINED_FUNCTION_27_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_32_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_39_2(unsigned int a1, int a2)
{
  return a2 | a1;
}

uint64_t OUTLINED_FUNCTION_40_2()
{
  return sub_26087BBF0();
}

uint64_t OUTLINED_FUNCTION_43_0()
{
  return sub_26087B250();
}

__n128 OUTLINED_FUNCTION_45_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, __n128 *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, __n128 a19)
{
  __n128 result = a19;
  *a12 = a19;
  return result;
}

uint64_t OUTLINED_FUNCTION_52_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_53_2(unsigned int a1)
{
  uint64_t result = (a1 >> 8) & 1;
  unsigned char *v2 = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_59_2@<X0>(int a1@<W8>)
{
  return a1 | (v1 << 8);
}

void OUTLINED_FUNCTION_60_2(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = v1;
  *(unsigned char *)(a1 + 4) = v2;
}

uint64_t sub_26087AEA0()
{
  return MEMORY[0x270EEE298]();
}

uint64_t sub_26087AEB0()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_26087AEC0()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_26087AED0()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_26087AEE0()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_26087AEF0()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_26087AF00()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_26087AF10()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_26087AF20()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_26087AF30()
{
  return MEMORY[0x270EEFA18]();
}

uint64_t sub_26087AF40()
{
  return MEMORY[0x270EEFF98]();
}

uint64_t sub_26087AF50()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_26087AF60()
{
  return MEMORY[0x270EEFFB8]();
}

uint64_t sub_26087AF70()
{
  return MEMORY[0x270EF0000]();
}

uint64_t sub_26087AF80()
{
  return MEMORY[0x270EF0008]();
}

uint64_t sub_26087AF90()
{
  return MEMORY[0x270EF0038]();
}

uint64_t sub_26087AFA0()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_26087AFB0()
{
  return MEMORY[0x270EF0090]();
}

uint64_t sub_26087AFC0()
{
  return MEMORY[0x270EF00D0]();
}

uint64_t sub_26087AFD0()
{
  return MEMORY[0x270EF00E8]();
}

uint64_t sub_26087AFE0()
{
  return MEMORY[0x270EF00F8]();
}

uint64_t sub_26087AFF0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_26087B000()
{
  return MEMORY[0x270EF0148]();
}

uint64_t sub_26087B010()
{
  return MEMORY[0x270EF0158]();
}

uint64_t sub_26087B020()
{
  return MEMORY[0x270EF0190]();
}

uint64_t sub_26087B030()
{
  return MEMORY[0x270EF01A8]();
}

uint64_t sub_26087B040()
{
  return MEMORY[0x270EF01B0]();
}

uint64_t sub_26087B050()
{
  return MEMORY[0x270EF01E0]();
}

uint64_t sub_26087B060()
{
  return MEMORY[0x270EF0238]();
}

uint64_t sub_26087B070()
{
  return MEMORY[0x270EF0290]();
}

uint64_t sub_26087B080()
{
  return MEMORY[0x270EF02A8]();
}

uint64_t sub_26087B090()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_26087B0A0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_26087B0B0()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_26087B0C0()
{
  return MEMORY[0x270EF0CE0]();
}

uint64_t sub_26087B0D0()
{
  return MEMORY[0x270EF0CF0]();
}

uint64_t sub_26087B0E0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_26087B0F0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_26087B100()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_26087B110()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_26087B120()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_26087B130()
{
  return MEMORY[0x270EE3BA8]();
}

uint64_t sub_26087B140()
{
  return MEMORY[0x270EE3BB0]();
}

uint64_t sub_26087B150()
{
  return MEMORY[0x270EE3BC8]();
}

uint64_t sub_26087B160()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_26087B170()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_26087B180()
{
  return MEMORY[0x270FA0A10]();
}

uint64_t sub_26087B190()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_26087B1A0()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_26087B1B0()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_26087B1C0()
{
  return MEMORY[0x270F9D030]();
}

uint64_t sub_26087B1D0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_26087B1E0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_26087B1F0()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_26087B200()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_26087B210()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_26087B220()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_26087B230()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_26087B240()
{
  return MEMORY[0x270F9D480]();
}

uint64_t sub_26087B250()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_26087B260()
{
  return MEMORY[0x270F9D490]();
}

uint64_t sub_26087B270()
{
  return MEMORY[0x270F9D4C8]();
}

uint64_t sub_26087B280()
{
  return MEMORY[0x270F9D4D0]();
}

uint64_t sub_26087B290()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_26087B2A0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_26087B2B0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_26087B2C0()
{
  return MEMORY[0x270EF1B18]();
}

uint64_t sub_26087B2D0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_26087B2E0()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_26087B2F0()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_26087B300()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_26087B310()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_26087B320()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_26087B330()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_26087B350()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_26087B360()
{
  return MEMORY[0x270F9D8A8]();
}

uint64_t sub_26087B370()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_26087B380()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_26087B390()
{
  return MEMORY[0x270F9D908]();
}

uint64_t sub_26087B3A0()
{
  return MEMORY[0x270F9D968]();
}

uint64_t sub_26087B3B0()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_26087B3C0()
{
  return MEMORY[0x270F9DA78]();
}

uint64_t sub_26087B3D0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_26087B3E0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_26087B3F0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_26087B400()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_26087B410()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_26087B420()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_26087B430()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_26087B440()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t sub_26087B450()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_26087B470()
{
  return MEMORY[0x270F9DD78]();
}

uint64_t sub_26087B480()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_26087B490()
{
  return MEMORY[0x270F9DDB0]();
}

uint64_t sub_26087B4A0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_26087B4B0()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_26087B4C0()
{
  return MEMORY[0x270F9E028]();
}

uint64_t sub_26087B4D0()
{
  return MEMORY[0x270F9E030]();
}

uint64_t sub_26087B4E0()
{
  return MEMORY[0x270EF1DD8]();
}

uint64_t sub_26087B4F0()
{
  return MEMORY[0x270EF1DE8]();
}

uint64_t sub_26087B500()
{
  return MEMORY[0x270EF1DF8]();
}

uint64_t sub_26087B510()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_26087B520()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_26087B530()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_26087B540()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_26087B550()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_26087B560()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_26087B570()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_26087B580()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_26087B590()
{
  return MEMORY[0x270FA0DF8]();
}

uint64_t sub_26087B5A0()
{
  return MEMORY[0x270FA0E00]();
}

uint64_t sub_26087B5B0()
{
  return MEMORY[0x270FA0E40]();
}

uint64_t sub_26087B5C0()
{
  return MEMORY[0x270FA0EA0]();
}

uint64_t sub_26087B5D0()
{
  return MEMORY[0x270FA0EC0]();
}

uint64_t sub_26087B5E0()
{
  return MEMORY[0x270FA0EC8]();
}

uint64_t sub_26087B5F0()
{
  return MEMORY[0x270EF20D8]();
}

uint64_t sub_26087B600()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_26087B610()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_26087B620()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_26087B630()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_26087B640()
{
  return MEMORY[0x270EF23C8]();
}

uint64_t sub_26087B650()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_26087B660()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_26087B670()
{
  return MEMORY[0x270F9E5B8]();
}

uint64_t sub_26087B680()
{
  return MEMORY[0x270F9E5C0]();
}

uint64_t sub_26087B690()
{
  return MEMORY[0x270F9E5E0]();
}

uint64_t sub_26087B6A0()
{
  return MEMORY[0x270F9E600]();
}

uint64_t sub_26087B6B0()
{
  return MEMORY[0x270F9E608]();
}

uint64_t sub_26087B6C0()
{
  return MEMORY[0x270F9E610]();
}

uint64_t sub_26087B6D0()
{
  return MEMORY[0x270F9E638]();
}

uint64_t sub_26087B6E0()
{
  return MEMORY[0x270F9E640]();
}

uint64_t sub_26087B6F0()
{
  return MEMORY[0x270F9E648]();
}

uint64_t sub_26087B700()
{
  return MEMORY[0x270F9E650]();
}

uint64_t sub_26087B710()
{
  return MEMORY[0x270F9E660]();
}

uint64_t sub_26087B720()
{
  return MEMORY[0x270F9E668]();
}

uint64_t sub_26087B730()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_26087B740()
{
  return MEMORY[0x270F9E738]();
}

uint64_t sub_26087B750()
{
  return MEMORY[0x270F9E748]();
}

uint64_t sub_26087B760()
{
  return MEMORY[0x270F9E760]();
}

uint64_t sub_26087B770()
{
  return MEMORY[0x270F9E768]();
}

uint64_t sub_26087B780()
{
  return MEMORY[0x270F9E770]();
}

uint64_t sub_26087B7A0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_26087B7B0()
{
  return MEMORY[0x270F9E7F8]();
}

uint64_t sub_26087B7C0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_26087B7D0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_26087B7E0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_26087B7F0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_26087B800()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_26087B810()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_26087B820()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_26087B830()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_26087B840()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_26087B850()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_26087B860()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_26087B870()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_26087B880()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_26087B890()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_26087B8A0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_26087B8B0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_26087B8C0()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_26087B8D0()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_26087B8E0()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_26087B8F0()
{
  return MEMORY[0x270F9ED68]();
}

uint64_t sub_26087B900()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_26087B910()
{
  return MEMORY[0x270F9EE10]();
}

uint64_t sub_26087B920()
{
  return MEMORY[0x270F9EE40]();
}

uint64_t sub_26087B930()
{
  return MEMORY[0x270F9EE68]();
}

uint64_t sub_26087B940()
{
  return MEMORY[0x270F9EE70]();
}

uint64_t sub_26087B950()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_26087B960()
{
  return MEMORY[0x270F9EF18]();
}

uint64_t sub_26087B970()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_26087B980()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_26087B990()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_26087B9A0()
{
  return MEMORY[0x270F9EFF8]();
}

uint64_t sub_26087B9B0()
{
  return MEMORY[0x270F9F018]();
}

uint64_t sub_26087B9C0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_26087B9D0()
{
  return MEMORY[0x270F9F090]();
}

uint64_t sub_26087B9E0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_26087B9F0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_26087BA00()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_26087BA10()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_26087BA20()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_26087BA30()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_26087BA80()
{
  return MEMORY[0x270F9F2E0]();
}

uint64_t sub_26087BA90()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_26087BAA0()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_26087BAB0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_26087BAC0()
{
  return MEMORY[0x270F9F348]();
}

uint64_t sub_26087BAD0()
{
  return MEMORY[0x270F9F358]();
}

uint64_t sub_26087BAE0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_26087BAF0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_26087BB40()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_26087BB50()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_26087BB60()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_26087BB70()
{
  return MEMORY[0x270F9F488]();
}

uint64_t sub_26087BB80()
{
  return MEMORY[0x270F9F498]();
}

uint64_t sub_26087BB90()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_26087BBA0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_26087BBB0()
{
  return MEMORY[0x270F9F790]();
}

uint64_t sub_26087BBC0()
{
  return MEMORY[0x270F9F7B0]();
}

uint64_t sub_26087BBD0()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_26087BBE0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_26087BBF0()
{
  return MEMORY[0x270F9FA80]();
}

uint64_t sub_26087BC00()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_26087BC10()
{
  return MEMORY[0x270F9FAD0]();
}

uint64_t sub_26087BC20()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_26087BC30()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_26087BC40()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_26087BC50()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_26087BC60()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_26087BC70()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_26087BC80()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t sub_26087BC90()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_26087BCA0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_26087BCB0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_26087BCC0()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_26087BCD0()
{
  return MEMORY[0x270F9FC70]();
}

uint64_t sub_26087BCE0()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_26087BCF0()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_26087BD00()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_26087BD10()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_26087BD20()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_26087BD50()
{
  return MEMORY[0x270FA0128]();
}

uint64_t BKSHIDServicesIsCapsLockLightOn()
{
  return MEMORY[0x270F10520]();
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x270EE4788](cf);
}

uint64_t IOHIDEventAppendEvent()
{
  return MEMORY[0x270EF41E8]();
}

uint64_t IOHIDEventCreate()
{
  return MEMORY[0x270EF41F8]();
}

uint64_t IOHIDEventCreateButtonEventWithPressure()
{
  return MEMORY[0x270EF4220]();
}

uint64_t IOHIDEventCreateDigitizerEvent()
{
  return MEMORY[0x270EF4238]();
}

uint64_t IOHIDEventCreateDigitizerFingerEvent()
{
  return MEMORY[0x270EF4240]();
}

uint64_t IOHIDEventCreateDockSwipeEvent()
{
  return MEMORY[0x270EF4258]();
}

uint64_t IOHIDEventCreateFluidTouchGestureEvent()
{
  return MEMORY[0x270EF4260]();
}

uint64_t IOHIDEventCreateGenericGestureEvent()
{
  return MEMORY[0x270EF4278]();
}

uint64_t IOHIDEventCreateKeyboardEvent()
{
  return MEMORY[0x270EF4280]();
}

uint64_t IOHIDEventCreateNavigationSwipeEvent()
{
  return MEMORY[0x270EF4290]();
}

uint64_t IOHIDEventCreateRotationEvent()
{
  return MEMORY[0x270EF42B0]();
}

uint64_t IOHIDEventCreateScaleEvent()
{
  return MEMORY[0x270EF42B8]();
}

uint64_t IOHIDEventCreateScrollEvent()
{
  return MEMORY[0x270EF42C0]();
}

uint64_t IOHIDEventCreateTranslationEvent()
{
  return MEMORY[0x270EF42E0]();
}

uint64_t IOHIDEventCreateVelocityEvent()
{
  return MEMORY[0x270EF42E8]();
}

uint64_t IOHIDEventCreateVendorDefinedEvent()
{
  return MEMORY[0x270EF42F0]();
}

uint64_t IOHIDEventCreateZoomToggleEvent()
{
  return MEMORY[0x270EF4308]();
}

uint64_t IOHIDEventGetDataValue()
{
  return MEMORY[0x270EF4318]();
}

uint64_t IOHIDEventGetDoubleValue()
{
  return MEMORY[0x270EF4320]();
}

uint64_t IOHIDEventGetEventFlags()
{
  return MEMORY[0x270EF4330]();
}

uint64_t IOHIDEventGetEventWithOptions()
{
  return MEMORY[0x270EF4338]();
}

uint64_t IOHIDEventGetFloatValue()
{
  return MEMORY[0x270EF4340]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x270EF4348]();
}

uint64_t IOHIDEventGetParent()
{
  return MEMORY[0x270EF4350]();
}

uint64_t IOHIDEventGetPhase()
{
  return MEMORY[0x270EF4358]();
}

uint64_t IOHIDEventGetScrollMomentum()
{
  return MEMORY[0x270EF4360]();
}

uint64_t IOHIDEventGetSenderID()
{
  return MEMORY[0x270EF4368]();
}

uint64_t IOHIDEventGetTimeStamp()
{
  return MEMORY[0x270EF4370]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x270EF4380]();
}

uint64_t IOHIDEventIsAbsolute()
{
  return MEMORY[0x270EF43A0]();
}

uint64_t IOHIDEventIsRepeat()
{
  return MEMORY[0x270EF43A8]();
}

uint64_t IOHIDEventSetDoubleValue()
{
  return MEMORY[0x270EF43B8]();
}

uint64_t IOHIDEventSetEventFlags()
{
  return MEMORY[0x270EF43C0]();
}

uint64_t IOHIDEventSetFloatValue()
{
  return MEMORY[0x270EF43C8]();
}

uint64_t IOHIDEventSetIntegerValue()
{
  return MEMORY[0x270EF43D0]();
}

uint64_t IOHIDEventSetPhase()
{
  return MEMORY[0x270EF43D8]();
}

uint64_t IOHIDEventSetRepeat()
{
  return MEMORY[0x270EF43E0]();
}

uint64_t IOHIDEventSetScrollMomentum()
{
  return MEMORY[0x270EF43E8]();
}

uint64_t IOHIDEventSetSenderID()
{
  return MEMORY[0x270EF43F0]();
}

uint64_t IOHIDEventSystemConnectionDispatchEvent()
{
  return MEMORY[0x270EF44D8]();
}

uint64_t IOHIDEventSystemConnectionGetAttribute()
{
  return MEMORY[0x270EF44E0]();
}

uint64_t IOHIDEventSystemConnectionGetEntitlements()
{
  return MEMORY[0x270EF44F0]();
}

uint64_t IOHIDEventSystemConnectionGetTypeString()
{
  return MEMORY[0x270EF4508]();
}

uint64_t IOHIDEventSystemConnectionGetUUID()
{
  return MEMORY[0x270EF4510]();
}

uint64_t IOHIDEventTypeGetName()
{
  return MEMORY[0x270EF4520]();
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x270EF4A38](*(void *)&entry, entryID);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _IOHIDEventSystemConnectionIsResponsive()
{
  return MEMORY[0x270EF4BB0]();
}

uint64_t _IOHIDEventSystemConnectionIsValid()
{
  return MEMORY[0x270EF4BB8]();
}

double __exp10(double a1)
{
  MEMORY[0x270ED7DC8](a1);
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x270ED95D0](label);
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return MEMORY[0x270ED9600]();
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}