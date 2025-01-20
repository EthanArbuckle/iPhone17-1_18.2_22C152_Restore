uint64_t DefaultWidgetConfiguration<A, B, C>(kind:intent:provider:content:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void v13[2];

  v13[0] = a5;
  v13[1] = a8;
  __chkstk_darwin(a1, a2);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v10, v11);
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_100029E58();
}

id variable initialization expression of LockScreenDataModel.homeManager()
{
  sub_100002FCC();
  id v0 = [(id)swift_getObjCClassFromMetadata() defaultPrivateConfiguration];
  [v0 setDiscretionary:0];
  [v0 setAdaptive:1];
  id v1 = [objc_allocWithZone((Class)HMHomeManager) initWithConfiguration:v0];

  return v1;
}

unint64_t sub_100002FCC()
{
  unint64_t result = qword_100041B30;
  if (!qword_100041B30)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100041B30);
  }
  return result;
}

uint64_t variable initialization expression of LockScreenDataModel.currentHome()
{
  return 0;
}

uint64_t variable initialization expression of LockScreenDataModel.defaultsHomeSensingChangedNotifyToken()
{
  return 0;
}

uint64_t sub_10000301C()
{
  sub_100029E68();

  return swift_getWitnessTable();
}

_UNKNOWN **static CharacteristicKind.allCases.getter()
{
  return &off_100039E10;
}

unint64_t CharacteristicKind.rawValue.getter()
{
  return 0xD000000000000024;
}

uint64_t sub_100003B90@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

unint64_t sub_100003BC0@<X0>(void *a1@<X8>)
{
  unint64_t result = CharacteristicKind.rawValue.getter();
  *a1 = 0xD000000000000024;
  a1[1] = v3;
  return result;
}

uint64_t sub_100003BF4()
{
  CharacteristicKind.rawValue.getter();
  uint64_t v1 = v0;
  CharacteristicKind.rawValue.getter();
  if (v1 == v2) {
    char v3 = 1;
  }
  else {
    char v3 = sub_10002A4D8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_100003C80(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x737569736C6563;
  unint64_t v3 = 0xE700000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x737569736C6563;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 0x61746E6563726570;
      unint64_t v3 = 0xEA00000000006567;
      break;
    case 2:
      uint64_t v5 = 0x6572676564637261;
      unint64_t v3 = 0xEA00000000007365;
      break;
    case 3:
      unint64_t v3 = 0xE300000000000000;
      uint64_t v5 = 7894380;
      break;
    case 4:
      uint64_t v5 = 0x73646E6F636573;
      break;
    case 5:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v5 = 0x7373656C74696E75;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE700000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xEA00000000006567;
      if (v5 == 0x61746E6563726570) {
        goto LABEL_16;
      }
      goto LABEL_19;
    case 2:
      unint64_t v6 = 0xEA00000000007365;
      if (v5 != 0x6572676564637261) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 3:
      unint64_t v6 = 0xE300000000000000;
      if (v5 != 7894380) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 4:
      uint64_t v2 = 0x73646E6F636573;
      goto LABEL_15;
    case 5:
      unint64_t v6 = 0xE800000000000000;
      if (v5 != 0x7373656C74696E75) {
        goto LABEL_19;
      }
      goto LABEL_16;
    default:
LABEL_15:
      if (v5 != v2) {
        goto LABEL_19;
      }
LABEL_16:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_19:
      }
        char v7 = sub_10002A4D8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

void sub_100003E8C(void *a1@<X8>)
{
  *a1 = &off_100039E10;
}

uint64_t sub_100003E9C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO1loiySbAC_ACtFZ_0(*a1, *a2);
}

BOOL sub_100003EAC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return (_s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO1loiySbAC_ACtFZ_0(*a2, *a1) & 1) == 0;
}

BOOL sub_100003ED8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return (_s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO1loiySbAC_ACtFZ_0(*a1, *a2) & 1) == 0;
}

uint64_t sub_100003F00(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO1loiySbAC_ACtFZ_0(*a2, *a1);
}

Swift::Int sub_100003F10()
{
  return sub_10002A5A8();
}

Swift::Int sub_100003F74()
{
  return sub_10002A5A8();
}

uint64_t sub_100004088()
{
  CharacteristicKind.rawValue.getter();
  sub_100029F38();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000040DC()
{
  return sub_10002A5A8();
}

Swift::Int sub_10000413C()
{
  return sub_10002A5A8();
}

uint64_t sub_10000424C()
{
  return sub_100029FF8();
}

uint64_t sub_1000042AC()
{
  return sub_100029FD8();
}

uint64_t CharacteristicKind.description.getter(uint64_t a1)
{
  if (qword_100041610 != -1) {
    swift_once();
  }
  uint64_t v2 = 0x6E776F6E6B6E75;
  unint64_t v3 = off_100041678;
  if (*((void *)off_100041678 + 2))
  {
    unint64_t v4 = sub_10000A764(a1);
    if (v5)
    {
      uint64_t v2 = *(void *)(v3[7] + (v4 << 6) + 8);
      swift_bridgeObjectRetain();
    }
  }
  return v2;
}

uint64_t sub_1000043A4()
{
  uint64_t v1 = *v0;
  if (qword_100041610 != -1) {
    swift_once();
  }
  uint64_t v2 = 0x6E776F6E6B6E75;
  unint64_t v3 = off_100041678;
  if (*((void *)off_100041678 + 2))
  {
    unint64_t v4 = sub_10000A764(v1);
    if (v5)
    {
      uint64_t v2 = *(void *)(v3[7] + (v4 << 6) + 8);
      swift_bridgeObjectRetain();
    }
  }
  return v2;
}

unint64_t static CharacteristicKind.info(for:)@<X0>(unint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = result;
  if (qword_100041610 != -1) {
    unint64_t result = swift_once();
  }
  unint64_t v4 = off_100041678;
  long long v5 = 0uLL;
  if (*((void *)off_100041678 + 2))
  {
    unint64_t result = sub_10000A764(v2);
    if (v6)
    {
      char v7 = (unsigned __int8 *)(v4[7] + (result << 6));
      uint64_t v8 = *v7;
      uint64_t v10 = *((void *)v7 + 1);
      uint64_t v9 = *((void *)v7 + 2);
      uint64_t v11 = *((void *)v7 + 4);
      unint64_t v12 = *((unsigned int *)v7 + 10) | ((unint64_t)v7[44] << 32);
      long long v14 = *((_OWORD *)v7 + 3);
      uint64_t v13 = *((unsigned __int16 *)v7 + 12);
      swift_bridgeObjectRetain();
      unint64_t result = sub_10000D8D8(v11, v12);
      long long v5 = v14;
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v10 = 0;
      uint64_t v9 = 0;
      uint64_t v13 = 0;
      uint64_t v11 = 0;
      unint64_t v12 = 0;
      long long v5 = 0uLL;
    }
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
    uint64_t v9 = 0;
    uint64_t v13 = 0;
    uint64_t v11 = 0;
    unint64_t v12 = 0;
  }
  *(void *)a2 = v8;
  *(void *)(a2 + 8) = v10;
  *(void *)(a2 + 16) = v9;
  *(void *)(a2 + 24) = v13;
  *(void *)(a2 + 32) = v11;
  *(void *)(a2 + 40) = v12;
  *(_OWORD *)(a2 + 48) = v5;
  return result;
}

uint64_t sub_100004570()
{
  if (qword_100041630 != -1) {
    swift_once();
  }
  uint64_t v23 = 0x6574636172616843;
  unint64_t v24 = 0xEF73636974736972;
  id v0 = [qword_100041FC0 __swift_objectForKeyedSubscript:sub_10002A508()];
  swift_unknownObjectRelease();
  if (v0)
  {
    uint64_t v1 = 0;
    sub_10002A168();
    swift_unknownObjectRelease();
    sub_10000DA90(&v33, &v34);
    sub_10000D9EC(&qword_100041AD8);
    swift_dynamicCast();
    uint64_t v2 = v32;
    uint64_t v19 = *(void *)(v32 + 16);
    if (v19)
    {
      swift_bridgeObjectRetain();
      uint64_t v3 = 0;
      v22 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v18 = v32;
      do
      {
        uint64_t v31 = *(void *)(v2 + 8 * v3 + 32);
        swift_bridgeObjectRetain();
        sub_100004860(&v31, &v23);
        swift_bridgeObjectRelease();
        uint64_t v5 = v26;
        if (v26)
        {
          char v6 = v23;
          char v7 = v24;
          uint64_t v8 = v25;
          __int16 v10 = v27;
          uint64_t v9 = v28;
          uint64_t v11 = v29;
          long long v20 = v30;
          uint64_t v21 = v1;
          if (swift_isUniquelyReferenced_nonNull_native()) {
            unint64_t v12 = v22;
          }
          else {
            unint64_t v12 = sub_10000A638(0, *((void *)v22 + 2) + 1, 1, v22);
          }
          unint64_t v14 = *((void *)v12 + 2);
          unint64_t v13 = *((void *)v12 + 3);
          if (v14 >= v13 >> 1) {
            unint64_t v12 = sub_10000A638((char *)(v13 > 1), v14 + 1, 1, v12);
          }
          *((void *)v12 + 2) = v14 + 1;
          v22 = v12;
          unint64_t v4 = &v12[72 * v14];
          v4[32] = v6;
          v4[40] = v7;
          *((void *)v4 + 6) = v8;
          *((void *)v4 + 7) = v5;
          *((_WORD *)v4 + 32) = v10;
          *((void *)v4 + 9) = v9;
          v4[84] = BYTE4(v11);
          *((_DWORD *)v4 + 20) = v11;
          *(_OWORD *)(v4 + 88) = v20;
          uint64_t v1 = v21;
          uint64_t v2 = v18;
        }
        ++v3;
      }
      while (v19 != v3);
      swift_bridgeObjectRelease();
      v15 = v22;
    }
    else
    {
      v15 = (char *)&_swiftEmptyArrayStorage;
    }
    swift_bridgeObjectRelease();
    if (*((void *)v15 + 2))
    {
      sub_10000D9EC(&qword_100041AE0);
      v16 = (void *)sub_10002A2F8();
    }
    else
    {
      v16 = &_swiftEmptyDictionarySingleton;
    }
    uint64_t v23 = (uint64_t)v16;
    sub_10000D520((uint64_t)v15, 1, &v23);
    uint64_t result = swift_bridgeObjectRelease();
    off_100041678 = (_UNKNOWN *)v23;
  }
  else
  {
    __break(1u);
    swift_bridgeObjectRelease();
    uint64_t result = swift_release();
    __break(1u);
  }
  return result;
}

void sub_100004860(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  if (*(void *)(*a1 + 16))
  {
    unint64_t v4 = sub_10000A7EC(1145656661, 0xE400000000000000);
    if (v5)
    {
      uint64_t v41 = *(void *)(*(void *)(v3 + 56) + 8 * v4);
      swift_unknownObjectRetain();
      if (swift_dynamicCast())
      {
        unsigned __int8 v6 = _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO8rawValueACSgSS_tcfC_0();
        if (v6 != 174)
        {
          if (*(void *)(v3 + 16))
          {
            unsigned __int8 v14 = v6;
            unint64_t v15 = sub_10000A7EC(1701667150, 0xE400000000000000);
            if (v16)
            {
              uint64_t v46 = *(void *)(*(void *)(v3 + 56) + 8 * v15);
              swift_unknownObjectRetain();
              swift_dynamicCast();
              if (*(void *)(v3 + 16))
              {
                unint64_t v17 = sub_10000A7EC(0x74616D726F46, 0xE600000000000000);
                if (v18)
                {
                  v43 = *(void **)(*(void *)(v3 + 56) + 8 * v17);
                  swift_unknownObjectRetain();
                  swift_dynamicCast();
                  unsigned __int8 v19 = _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO6FormatO8rawValueAESgSS_tcfC_0(v41, v42);
                  if (v19 != 11)
                  {
                    unsigned __int8 v20 = v19;
                    if (*(void *)(v3 + 16)
                      && (unint64_t v21 = sub_10000A7EC(1953066581, 0xE400000000000000), (v22 & 1) != 0)
                      && (v43 = *(void **)(*(void *)(v3 + 56) + 8 * v21),
                          swift_unknownObjectRetain(),
                          swift_dynamicCast()))
                    {
                      uint64_t v23 = v41;
                      unint64_t v24 = v42;
                    }
                    else
                    {
                      uint64_t v23 = 0;
                      unint64_t v24 = (void *)0xE000000000000000;
                    }
                    unsigned __int8 v37 = _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO4UnitO8rawValueAESgSS_tcfC_0(v23, v24);
                    if (*(void *)(v3 + 16)
                      && (sub_10000A7EC(0x69617274736E6F43, 0xEB0000000073746ELL), (v25 & 1) != 0))
                    {
                      swift_unknownObjectRetain();
                      sub_10000D9EC(&qword_100041B08);
                      if (swift_dynamicCast()) {
                        uint64_t v26 = (uint64_t)v43;
                      }
                      else {
                        uint64_t v26 = 0;
                      }
                    }
                    else
                    {
                      uint64_t v26 = 0;
                    }
                    unint64_t v27 = sub_10000CE1C(v26);
                    uint64_t v38 = v28;
                    unint64_t v39 = v27;
                    unsigned __int8 v40 = v20;
                    if (*(void *)(v3 + 16)
                      && (sub_10000A7EC(0x697373696D726550, 0xEB00000000736E6FLL), (v29 & 1) != 0))
                    {
                      uint64_t v30 = v45;
                      swift_unknownObjectRetain();
                      sub_10000D9EC(&qword_100041B00);
                      if (swift_dynamicCast())
                      {
                        uint64_t v31 = v44;
                        uint64_t v32 = v43;
                        goto LABEL_36;
                      }
                    }
                    else
                    {
                      uint64_t v30 = v45;
                    }
                    uint64_t v31 = v44;
                    uint64_t v32 = &_swiftEmptyArrayStorage;
LABEL_36:
                    uint64_t v33 = sub_10000D148((uint64_t)v32);
                    swift_bridgeObjectRelease();
                    if (*(void *)(v3 + 16)
                      && (sub_10000A7EC(0x69747265706F7250, 0xEA00000000007365), (v34 & 1) != 0)
                      && (swift_unknownObjectRetain(), sub_10000D9EC(&qword_100041B00),
                                                       swift_dynamicCast()))
                    {
                      v35 = v43;
                    }
                    else
                    {
                      v35 = &_swiftEmptyArrayStorage;
                    }
                    uint64_t v36 = sub_10000D270((uint64_t)v35);
                    swift_bridgeObjectRelease();
                    *a2 = v14;
                    a2[1] = v14;
                    a2[2] = v31;
                    a2[3] = v30;
                    a2[4] = v40 | ((unint64_t)v37 << 8);
                    a2[5] = v39;
                    a2[6] = v38 & 0xFFFFFFFFFFLL;
                    a2[7] = v33;
                    a2[8] = v36;
                    return;
                  }
LABEL_46:
                  __break(1u);
                  return;
                }
LABEL_45:
                __break(1u);
                goto LABEL_46;
              }
LABEL_44:
              __break(1u);
              goto LABEL_45;
            }
          }
          else
          {
            __break(1u);
          }
          __break(1u);
          goto LABEL_44;
        }
      }
    }
  }
  if (qword_100041638 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_100029DD8();
  sub_1000138FC(v7, (uint64_t)qword_100041FC8);
  swift_bridgeObjectRetain_n();
  uint64_t v8 = sub_100029DB8();
  os_log_type_t v9 = sub_10002A118();
  if (os_log_type_enabled(v8, v9))
  {
    __int16 v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v44 = swift_slowAlloc();
    *(_DWORD *)__int16 v10 = 136315138;
    if (*(void *)(v3 + 16))
    {
      sub_10000A7EC(1145656661, 0xE400000000000000);
      if (v11) {
        swift_unknownObjectRetain();
      }
    }
    sub_10000D9EC(&qword_100041AF8);
    uint64_t v12 = sub_100029F18();
    sub_100014A04(v12, v13, &v44);
    sub_10002A148();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "missing characteristic %s", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  a2[8] = 0;
  *((_OWORD *)a2 + 2) = 0u;
  *((_OWORD *)a2 + 3) = 0u;
  *(_OWORD *)a2 = 0u;
  *((_OWORD *)a2 + 1) = 0u;
}

uint64_t CharacteristicKind.valueFormat.getter(uint64_t a1)
{
  if (qword_100041610 != -1) {
    swift_once();
  }
  uint64_t v2 = off_100041678;
  if (*((void *)off_100041678 + 2) && (unint64_t v3 = sub_10000A764(a1), (v4 & 1) != 0)) {
    return *(unsigned __int8 *)(v2[7] + (v3 << 6) + 24);
  }
  else {
    return 11;
  }
}

uint64_t CharacteristicKind.Value.id.getter(uint64_t a1, unint64_t a2, char a3)
{
  return a1;
}

uint64_t static CharacteristicKind.Value.typedValue(for:valueFormat:)(uint64_t a1, char a2)
{
  sub_10000D984(a1, (uint64_t)&v34);
  if (v35)
  {
    sub_10000DA90(&v34, v36);
    sub_10000DAA0((uint64_t)v36, (uint64_t)&v34);
    if (swift_dynamicCast())
    {
      sub_10000DAA0((uint64_t)v36, (uint64_t)v31);
      int v3 = swift_dynamicCast();
      uint64_t v4 = v29;
      if (!v3) {
        uint64_t v4 = 0;
      }
      char v5 = v3 ^ 1;
LABEL_6:
      uint64_t v6 = sub_100005A88(v4, v5, a2);
LABEL_54:
      uint64_t v7 = v6;
      sub_100013784((uint64_t)v36);
LABEL_55:
      sub_100013784((uint64_t)&v34);
      return v7;
    }
    if (swift_dynamicCast())
    {
      sub_10000DAA0((uint64_t)v36, (uint64_t)v31);
      int v8 = swift_dynamicCast();
      __int16 v9 = v29;
      if (!v8) {
        __int16 v9 = 0;
      }
      uint64_t v6 = sub_10000558C(v9 | (unsigned __int16)(((unsigned __int16)v8 ^ 1) << 8), a2);
      goto LABEL_54;
    }
    if (swift_dynamicCast())
    {
      sub_10000DAA0((uint64_t)v36, (uint64_t)v31);
      int v10 = swift_dynamicCast();
      int v11 = (unsigned __int16)v29;
      if (!v10) {
        int v11 = 0;
      }
      uint64_t v6 = sub_100005720(v11 | ((v10 ^ 1u) << 16), a2);
      goto LABEL_54;
    }
    if (swift_dynamicCast())
    {
      sub_10000DAA0((uint64_t)v36, (uint64_t)v31);
      int v12 = swift_dynamicCast();
      uint64_t v13 = v29;
      if (!v12) {
        uint64_t v13 = 0;
      }
      uint64_t v6 = sub_1000058DC(v13 | ((unint64_t)(v12 ^ 1u) << 32), a2);
      goto LABEL_54;
    }
    if (swift_dynamicCast())
    {
      sub_10000DAA0((uint64_t)v36, (uint64_t)v31);
      int v14 = swift_dynamicCast();
      uint64_t v4 = v29;
      if (!v14) {
        uint64_t v4 = 0;
      }
      char v5 = v14 ^ 1;
      goto LABEL_6;
    }
    if (swift_dynamicCast())
    {
      sub_10000DAA0((uint64_t)v36, (uint64_t)v31);
      int v15 = swift_dynamicCast();
      __int16 v16 = v29;
      if (!v15) {
        __int16 v16 = 0;
      }
      uint64_t v6 = sub_100005C3C(v16 | (unsigned __int16)(((unsigned __int16)v15 ^ 1) << 8), a2);
      goto LABEL_54;
    }
    if (swift_dynamicCast())
    {
      sub_10000DAA0((uint64_t)v36, (uint64_t)v31);
      int v17 = swift_dynamicCast();
      int v18 = (unsigned __int16)v29;
      if (!v17) {
        int v18 = 0;
      }
      uint64_t v6 = sub_100005D78(v18 | ((v17 ^ 1u) << 16), a2);
      goto LABEL_54;
    }
    if (swift_dynamicCast())
    {
      sub_10000DAA0((uint64_t)v36, (uint64_t)v31);
      int v19 = swift_dynamicCast();
      uint64_t v20 = v29;
      if (!v19) {
        uint64_t v20 = 0;
      }
      uint64_t v6 = sub_100005EC0(v20 | ((unint64_t)(v19 ^ 1u) << 32), a2);
      goto LABEL_54;
    }
    if (swift_dynamicCast())
    {
      sub_10000DAA0((uint64_t)v36, (uint64_t)v31);
      int v21 = swift_dynamicCast();
      unint64_t v22 = v29;
      if (!v21) {
        unint64_t v22 = 0;
      }
      uint64_t v6 = sub_10000601C(v22, v21 ^ 1u, a2);
      goto LABEL_54;
    }
    if (swift_dynamicCast())
    {
      sub_10000DAA0((uint64_t)v36, (uint64_t)v31);
      int v23 = swift_dynamicCast();
      uint64_t v24 = v29;
      if (!v23) {
        uint64_t v24 = 0;
      }
      uint64_t v6 = sub_100006174(v24 | ((unint64_t)(v23 ^ 1u) << 32), a2);
      goto LABEL_54;
    }
    if (swift_dynamicCast())
    {
      sub_10000DAA0((uint64_t)v36, (uint64_t)v31);
      int v25 = swift_dynamicCast();
      uint64_t v26 = v29;
      if (!v25) {
        uint64_t v26 = 0;
      }
      uint64_t v6 = sub_100006424(v26, v25 ^ 1u, a2);
      goto LABEL_54;
    }
    if (swift_dynamicCast())
    {
      sub_10000DAA0((uint64_t)v36, (uint64_t)v31);
      if (swift_dynamicCast()) {
        char v27 = v29;
      }
      else {
        char v27 = 2;
      }
      uint64_t v6 = sub_10000E09C(v27, a2);
      goto LABEL_54;
    }
    if (swift_dynamicCast())
    {
      swift_bridgeObjectRelease();
      sub_10000DA90(v36, v31);
      if (swift_dynamicCast())
      {
        uint64_t v7 = v29;
        goto LABEL_55;
      }
LABEL_67:
      uint64_t v7 = 0;
      goto LABEL_55;
    }
    if (swift_dynamicCast())
    {
      sub_10000DAFC(v32, v33);
      sub_10000DA90(v36, v31);
      if (swift_dynamicCast())
      {
        uint64_t v7 = v29;
        if (a2 == 10 || a2 == 9) {
          goto LABEL_55;
        }
        sub_10000DAFC(v29, v30);
      }
      goto LABEL_67;
    }
    sub_100013784((uint64_t)v36);
    sub_100013784((uint64_t)&v34);
  }
  else
  {
    sub_10000DA30((uint64_t)&v34);
  }
  return 0;
}

uint64_t sub_10000558C(__int16 a1, char a2)
{
  if ((a1 & 0x100) != 0)
  {
    *(double *)&uint64_t result = 0.0;
  }
  else
  {
    signed __int8 v2 = a1;
    *(double *)&uint64_t result = 0.0;
    switch(a2)
    {
      case 1:
        uint64_t result = v2 & ~(v2 >> 31);
        break;
      case 2:
        uint64_t result = v2 & ~(v2 >> 31);
        break;
      case 3:
        uint64_t result = v2 & ~(v2 >> 31);
        break;
      case 4:
        if (v2 < 0)
        {
          sub_10002A298();
          __break(1u);
          JUMPOUT(0x1000056F4);
        }
        uint64_t result = v2;
        break;
      case 5:
      case 6:
        uint64_t result = v2 & 0xFFFFFFFFLL;
        break;
      case 7:
        *(double *)&uint64_t result = (double)v2;
        break;
      case 8:
        *(double *)&uint64_t result = COERCE_DOUBLE(sub_10002A4C8());
        break;
      case 9:
      case 10:
        return result;
      default:
        uint64_t result = v2 == 1;
        break;
    }
  }
  return result;
}

uint64_t sub_100005720(int a1, char a2)
{
  if ((a1 & 0x10000) != 0)
  {
    *(double *)&uint64_t result = 0.0;
  }
  else
  {
    unsigned __int16 v2 = a1;
    *(double *)&uint64_t result = 0.0;
    switch(a2)
    {
      case 1:
        uint64_t v4 = v2;
        if (v2 > 0xFFu) {
          uint64_t v4 = 255;
        }
        if ((v2 & 0x8000) != 0) {
          *(double *)&uint64_t result = 0.0;
        }
        else {
          uint64_t result = v4;
        }
        break;
      case 2:
        uint64_t result = (__int16)v2 & ~((__int16)v2 >> 31);
        break;
      case 3:
        uint64_t v5 = (__int16)v2;
        if ((int)v5 >= 0) {
          uint64_t result = v5;
        }
        else {
          *(double *)&uint64_t result = 0.0;
        }
        break;
      case 4:
        if ((v2 & 0x8000) != 0)
        {
          sub_10002A298();
          __break(1u);
          JUMPOUT(0x1000058B0);
        }
        uint64_t result = v2;
        break;
      case 5:
      case 6:
        uint64_t result = (__int16)v2;
        break;
      case 7:
        *(double *)&uint64_t result = (double)(__int16)v2;
        break;
      case 8:
        *(double *)&uint64_t result = COERCE_DOUBLE(sub_10002A4C8());
        break;
      case 9:
      case 10:
        return result;
      default:
        uint64_t result = v2 == 1;
        break;
    }
  }
  return result;
}

uint64_t sub_1000058DC(uint64_t a1, char a2)
{
  if ((a1 & 0x100000000) != 0)
  {
    *(double *)&uint64_t result = 0.0;
  }
  else
  {
    int v2 = a1;
    *(double *)&uint64_t result = 0.0;
    switch(a2)
    {
      case 1:
        uint64_t v4 = v2;
        if (v2 > 0xFF) {
          uint64_t v4 = 255;
        }
        goto LABEL_13;
      case 2:
        uint64_t v4 = (unsigned __int16)v2;
        if (HIWORD(v2)) {
          uint64_t v4 = 0xFFFFLL;
        }
LABEL_13:
        if (v2 >= 0) {
          uint64_t result = v4;
        }
        else {
          *(double *)&uint64_t result = 0.0;
        }
        break;
      case 3:
        uint64_t result = v2 & ~(v2 >> 31);
        break;
      case 4:
        if (v2 < 0)
        {
          sub_10002A298();
          __break(1u);
          JUMPOUT(0x100005A5CLL);
        }
        uint64_t result = v2;
        break;
      case 5:
      case 6:
        uint64_t result = v2;
        break;
      case 7:
        *(double *)&uint64_t result = (double)v2;
        break;
      case 8:
        *(double *)&uint64_t result = COERCE_DOUBLE(sub_10002A4C8());
        break;
      case 9:
      case 10:
        return result;
      default:
        uint64_t result = v2 == 1;
        break;
    }
  }
  return result;
}

uint64_t sub_100005A88(uint64_t a1, char a2, char a3)
{
  if (a2)
  {
    *(double *)&uint64_t result = 0.0;
  }
  else
  {
    *(double *)&uint64_t result = 0.0;
    switch(a3)
    {
      case 1:
        if (a1 >= 255) {
          a1 = 255;
        }
        uint64_t result = a1 & ~(a1 >> 63);
        break;
      case 2:
        if (a1 >= 0xFFFF) {
          a1 = 0xFFFFLL;
        }
        uint64_t result = a1 & ~(a1 >> 63);
        break;
      case 3:
        if (a1 >= 0xFFFFFFFFLL) {
          a1 = 0xFFFFFFFFLL;
        }
        uint64_t result = a1 & ~(a1 >> 63);
        break;
      case 4:
        if (a1 < 0)
        {
          sub_10002A298();
          __break(1u);
          JUMPOUT(0x100005C10);
        }
        uint64_t result = a1;
        break;
      case 5:
      case 6:
        if (a1 >= 0x7FFFFFFF) {
          a1 = 0x7FFFFFFFLL;
        }
        if (a1 <= (uint64_t)0xFFFFFFFF80000000) {
          LODWORD(a1) = 0x80000000;
        }
        uint64_t result = a1;
        break;
      case 7:
        *(double *)&uint64_t result = (double)a1;
        break;
      case 8:
        *(double *)&uint64_t result = COERCE_DOUBLE(sub_10002A4C8());
        break;
      case 9:
      case 10:
        return result;
      default:
        uint64_t result = a1 == 1;
        break;
    }
  }
  return result;
}

uint64_t sub_100005C3C(__int16 a1, char a2)
{
  if ((a1 & 0x100) != 0)
  {
    *(double *)&uint64_t result = 0.0;
  }
  else
  {
    unsigned __int8 v2 = a1;
    *(double *)&uint64_t result = 0.0;
    switch(a2)
    {
      case 1:
        uint64_t result = v2;
        break;
      case 2:
        uint64_t result = v2;
        break;
      case 3:
        uint64_t result = v2;
        break;
      case 4:
        uint64_t result = v2;
        break;
      case 5:
      case 6:
        uint64_t result = v2;
        break;
      case 7:
        *(double *)&uint64_t result = (double)v2;
        break;
      case 8:
        *(double *)&uint64_t result = COERCE_DOUBLE(sub_10002A4C8());
        break;
      case 9:
      case 10:
        return result;
      default:
        uint64_t result = v2 == 1;
        break;
    }
  }
  return result;
}

uint64_t sub_100005D78(int a1, char a2)
{
  if ((a1 & 0x10000) != 0)
  {
    *(double *)&uint64_t result = 0.0;
  }
  else
  {
    unsigned __int16 v2 = a1;
    *(double *)&uint64_t result = 0.0;
    switch(a2)
    {
      case 1:
        if ((v2 & 0xFF00) != 0) {
          uint64_t result = 255;
        }
        else {
          uint64_t result = v2;
        }
        break;
      case 2:
        uint64_t result = v2;
        break;
      case 3:
        uint64_t result = v2;
        break;
      case 4:
        uint64_t result = v2;
        break;
      case 5:
      case 6:
        uint64_t result = v2;
        break;
      case 7:
        *(double *)&uint64_t result = (double)v2;
        break;
      case 8:
        *(double *)&uint64_t result = COERCE_DOUBLE(sub_10002A4C8());
        break;
      case 9:
      case 10:
        return result;
      default:
        uint64_t result = v2 == 1;
        break;
    }
  }
  return result;
}

uint64_t sub_100005EC0(uint64_t a1, char a2)
{
  if ((a1 & 0x100000000) != 0)
  {
    *(double *)&uint64_t result = 0.0;
  }
  else
  {
    unsigned int v2 = a1;
    *(double *)&uint64_t result = 0.0;
    switch(a2)
    {
      case 1:
        if (v2 <= 0xFF) {
          uint64_t result = v2;
        }
        else {
          uint64_t result = 255;
        }
        break;
      case 2:
        if (HIWORD(v2)) {
          uint64_t result = 0xFFFFLL;
        }
        else {
          uint64_t result = (unsigned __int16)v2;
        }
        break;
      case 3:
        uint64_t result = v2;
        break;
      case 4:
        uint64_t result = v2;
        break;
      case 5:
      case 6:
        if (v2 >= 0x7FFFFFFF) {
          uint64_t result = 0x7FFFFFFFLL;
        }
        else {
          uint64_t result = v2;
        }
        break;
      case 7:
        *(double *)&uint64_t result = (double)v2;
        break;
      case 8:
        *(double *)&uint64_t result = COERCE_DOUBLE(sub_10002A4C8());
        break;
      case 9:
      case 10:
        return result;
      default:
        uint64_t result = v2 == 1;
        break;
    }
  }
  return result;
}

uint64_t sub_10000601C(unint64_t a1, char a2, char a3)
{
  if (a2)
  {
    *(double *)&uint64_t result = 0.0;
  }
  else
  {
    *(double *)&uint64_t result = 0.0;
    switch(a3)
    {
      case 1:
        if (a1 >= 0xFF) {
          uint64_t result = 255;
        }
        else {
          uint64_t result = a1;
        }
        break;
      case 2:
        if (a1 >= 0xFFFF) {
          uint64_t result = 0xFFFFLL;
        }
        else {
          uint64_t result = a1;
        }
        break;
      case 3:
        if (a1 >= 0xFFFFFFFF) {
          uint64_t result = 0xFFFFFFFFLL;
        }
        else {
          uint64_t result = a1;
        }
        break;
      case 4:
        uint64_t result = a1;
        break;
      case 5:
      case 6:
        if (a1 >= 0x7FFFFFFF) {
          uint64_t result = 0x7FFFFFFFLL;
        }
        else {
          uint64_t result = a1;
        }
        break;
      case 7:
        *(double *)&uint64_t result = (double)a1;
        break;
      case 8:
        *(double *)&uint64_t result = COERCE_DOUBLE(sub_10002A4C8());
        break;
      case 9:
      case 10:
        return result;
      default:
        uint64_t result = a1 == 1;
        break;
    }
  }
  return result;
}

uint64_t sub_100006174(uint64_t a1, char a2)
{
  if ((a1 & 0x100000000) != 0)
  {
    *(double *)&uint64_t result = 0.0;
  }
  else
  {
    float v2 = *(float *)&a1;
    *(double *)&uint64_t result = 0.0;
    switch(a2)
    {
      case 1:
        sub_10000A488((uint64_t)&v8, v2);
        if (v9) {
          goto LABEL_28;
        }
        uint64_t v6 = v8;
        if (v8 >= 255) {
          uint64_t v6 = 255;
        }
        uint64_t result = v6 & ~(v6 >> 63);
        break;
      case 2:
        sub_10000A488((uint64_t)&v8, v2);
        if (v9) {
          goto LABEL_28;
        }
        uint64_t v5 = v8;
        if (v8 >= 0xFFFF) {
          uint64_t v5 = 0xFFFFLL;
        }
        uint64_t result = v5 & ~(v5 >> 63);
        break;
      case 3:
        sub_10000A488((uint64_t)&v8, v2);
        if (v9) {
          goto LABEL_28;
        }
        uint64_t v7 = v8;
        if (v8 >= 0xFFFFFFFFLL) {
          uint64_t v7 = 0xFFFFFFFFLL;
        }
        uint64_t result = v7 & ~(v7 >> 63);
        break;
      case 4:
        sub_10000A488((uint64_t)&v8, v2);
        if (v9) {
          goto LABEL_28;
        }
        uint64_t result = v8 & ~(v8 >> 63);
        break;
      case 5:
      case 6:
        sub_10000A488((uint64_t)&v8, v2);
        if (v9)
        {
LABEL_28:
          uint64_t v8 = 0;
          unint64_t v9 = 0xE000000000000000;
          sub_10002A1C8(80);
          v10._countAndFlagsBits = 0x74616F6C46;
          v10._object = (void *)0xE500000000000000;
          sub_100029F48(v10);
          v11._object = (void *)0x800000010002D950;
          v11._countAndFlagsBits = 0xD00000000000001ELL;
          sub_100029F48(v11);
          v12._countAndFlagsBits = 7630409;
          v12._object = (void *)0xE300000000000000;
          sub_100029F48(v12);
          v13._countAndFlagsBits = 0xD00000000000002ELL;
          v13._object = (void *)0x800000010002D970;
          sub_100029F48(v13);
          sub_10002A2A8();
          __break(1u);
          JUMPOUT(0x1000063F8);
        }
        int64_t v4 = v8;
        if (v8 >= 0x7FFFFFFF) {
          int64_t v4 = 0x7FFFFFFFLL;
        }
        if (v4 <= (uint64_t)0xFFFFFFFF80000000) {
          LODWORD(v4) = 0x80000000;
        }
        uint64_t result = v4;
        break;
      case 7:
        *(double *)&uint64_t result = v2;
        break;
      case 8:
        unint64_t v9 = 0xE000000000000000;
        sub_10002A288();
        *(double *)&uint64_t result = 0.0;
        break;
      case 9:
      case 10:
        return result;
      default:
        uint64_t result = v2 != 0.0;
        break;
    }
  }
  return result;
}

uint64_t sub_100006424(uint64_t a1, char a2, char a3)
{
  if (a2) {
    return 0;
  }
  uint64_t result = 0;
  switch(a3)
  {
    case 1:
      sub_10000A300((uint64_t)&v9, *(double *)&a1);
      if (v10) {
        goto LABEL_28;
      }
      uint64_t v7 = v9;
      if (v9 >= 255) {
        uint64_t v7 = 255;
      }
      uint64_t result = v7 & ~(v7 >> 63);
      break;
    case 2:
      sub_10000A300((uint64_t)&v9, *(double *)&a1);
      if (v10) {
        goto LABEL_28;
      }
      uint64_t v6 = v9;
      if (v9 >= 0xFFFF) {
        uint64_t v6 = 0xFFFFLL;
      }
      uint64_t result = v6 & ~(v6 >> 63);
      break;
    case 3:
      sub_10000A300((uint64_t)&v9, *(double *)&a1);
      if (v10) {
        goto LABEL_28;
      }
      uint64_t v8 = v9;
      if (v9 >= 0xFFFFFFFFLL) {
        uint64_t v8 = 0xFFFFFFFFLL;
      }
      uint64_t result = v8 & ~(v8 >> 63);
      break;
    case 4:
      sub_10000A300((uint64_t)&v9, *(double *)&a1);
      if (v10) {
        goto LABEL_28;
      }
      uint64_t result = v9 & ~(v9 >> 63);
      break;
    case 5:
    case 6:
      sub_10000A300((uint64_t)&v9, *(double *)&a1);
      if (v10)
      {
LABEL_28:
        uint64_t v9 = 0;
        unint64_t v10 = 0xE000000000000000;
        sub_10002A1C8(80);
        v11._countAndFlagsBits = 0x656C62756F44;
        v11._object = (void *)0xE600000000000000;
        sub_100029F48(v11);
        v12._object = (void *)0x800000010002D950;
        v12._countAndFlagsBits = 0xD00000000000001ELL;
        sub_100029F48(v12);
        v13._countAndFlagsBits = 7630409;
        v13._object = (void *)0xE300000000000000;
        sub_100029F48(v13);
        v14._countAndFlagsBits = 0xD00000000000002ELL;
        v14._object = (void *)0x800000010002D970;
        sub_100029F48(v14);
        sub_10002A2A8();
        __break(1u);
        JUMPOUT(0x1000066A8);
      }
      int64_t v5 = v9;
      if (v9 >= 0x7FFFFFFF) {
        int64_t v5 = 0x7FFFFFFFLL;
      }
      if (v5 <= (uint64_t)0xFFFFFFFF80000000) {
        LODWORD(v5) = 0x80000000;
      }
      uint64_t result = v5;
      break;
    case 7:
      uint64_t result = a1;
      break;
    case 8:
      unint64_t v10 = 0xE000000000000000;
      sub_10002A288();
      uint64_t result = 0;
      break;
    case 9:
    case 10:
      return result;
    default:
      uint64_t result = *(double *)&a1 != 0.0;
      break;
  }
  return result;
}

uint64_t CharacteristicKind.Value.description.getter(Swift::String a1, char a2)
{
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  uint64_t result = 0x6C6C756E2ELL;
  switch(a2)
  {
    case 1:
      uint64_t v11 = 0x2838746E69752ELL;
      goto LABEL_16;
    case 2:
      uint64_t v11 = 0x283631746E69752ELL;
      goto LABEL_16;
    case 3:
      uint64_t v11 = 0x283233746E69752ELL;
      goto LABEL_16;
    case 4:
      uint64_t v11 = 0x283436746E69752ELL;
      goto LABEL_16;
    case 5:
      uint64_t v7 = 0x28746E692ELL;
      goto LABEL_15;
    case 6:
      uint64_t v7 = 0x283233746E692ELL;
LABEL_15:
      uint64_t v11 = v7;
LABEL_16:
      v5._uint64_t countAndFlagsBits = sub_10002A4C8();
      goto LABEL_17;
    case 7:
      uint64_t v11 = 0;
      v13._uint64_t countAndFlagsBits = 0x2874616F6C662ELL;
      v13._object = (void *)0xE700000000000000;
      sub_100029F48(v13);
      sub_10002A0D8();
      goto LABEL_18;
    case 8:
      uint64_t v11 = 0x28676E697274732ELL;
      a1._uint64_t countAndFlagsBits = countAndFlagsBits;
      sub_100029F48(a1);
      goto LABEL_18;
    case 9:
      uint64_t v11 = 0x2838766C742ELL;
      sub_10000D900(countAndFlagsBits, (unint64_t)a1._object, 9);
      v14._uint64_t countAndFlagsBits = sub_100029CF8();
      sub_100029F48(v14);
      swift_bridgeObjectRelease();
      v15._uint64_t countAndFlagsBits = 41;
      v15._object = (void *)0xE100000000000000;
      sub_100029F48(v15);
      uint64_t v8 = countAndFlagsBits;
      unint64_t v9 = (unint64_t)object;
      char v10 = 9;
      goto LABEL_24;
    case 10:
      uint64_t v11 = 0x28617461642ELL;
      sub_10000D900(countAndFlagsBits, (unint64_t)a1._object, 10);
      v16._uint64_t countAndFlagsBits = sub_100029CF8();
      sub_100029F48(v16);
      swift_bridgeObjectRelease();
      v17._uint64_t countAndFlagsBits = 41;
      v17._object = (void *)0xE100000000000000;
      sub_100029F48(v17);
      uint64_t v8 = countAndFlagsBits;
      unint64_t v9 = (unint64_t)object;
      char v10 = 10;
LABEL_24:
      sub_10000E204(v8, v9, v10);
      return v11;
    case 11:
      return result;
    default:
      uint64_t v11 = 0x286C6F6F622ELL;
      if (countAndFlagsBits) {
        v5._uint64_t countAndFlagsBits = 1702195828;
      }
      else {
        v5._uint64_t countAndFlagsBits = 0x65736C6166;
      }
      if (countAndFlagsBits) {
        uint64_t v6 = (void *)0xE400000000000000;
      }
      else {
        uint64_t v6 = (void *)0xE500000000000000;
      }
      v5._object = v6;
LABEL_17:
      sub_100029F48(v5);
      swift_bridgeObjectRelease();
LABEL_18:
      v12._uint64_t countAndFlagsBits = 41;
      v12._object = (void *)0xE100000000000000;
      sub_100029F48(v12);
      return v11;
  }
}

void CharacteristicKind.Value.hash(into:)(uint64_t a1, Swift::UInt64 a2, unint64_t a3, char a4)
{
  switch(a4)
  {
    case 1:
      sub_10002A558(2uLL);
      Swift::UInt8 v6 = a2;
      goto LABEL_4;
    case 2:
      sub_10002A558(3uLL);
      sub_10002A578(a2);
      return;
    case 3:
      Swift::UInt v7 = 4;
      goto LABEL_10;
    case 4:
      sub_10002A558(5uLL);
      sub_10002A598(a2);
      return;
    case 5:
      Swift::UInt v7 = 6;
      goto LABEL_10;
    case 6:
      Swift::UInt v7 = 7;
LABEL_10:
      sub_10002A558(v7);
      sub_10002A588(a2);
      return;
    case 7:
      sub_10002A558(8uLL);
      if ((a2 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        Swift::UInt64 v8 = a2;
      }
      else {
        Swift::UInt64 v8 = 0;
      }
      sub_10002A598(v8);
      return;
    case 8:
      sub_10002A558(9uLL);
      sub_100029F38();
      return;
    case 9:
      sub_10002A558(0xAuLL);
      sub_10000D92C(a2, a3);
      sub_100029D08();
      uint64_t v9 = a2;
      unint64_t v10 = a3;
      char v11 = 9;
      goto LABEL_20;
    case 10:
      sub_10002A558(0xBuLL);
      sub_10000D92C(a2, a3);
      sub_100029D08();
      uint64_t v9 = a2;
      unint64_t v10 = a3;
      char v11 = 10;
LABEL_20:
      sub_10000E204(v9, v10, v11);
      break;
    case 11:
      sub_10002A558(0);
      break;
    default:
      sub_10002A558(1uLL);
      Swift::UInt8 v6 = a2 & 1;
LABEL_4:
      sub_10002A568(v6);
      break;
  }
}

uint64_t static CharacteristicKind.Permissions.securedRead.getter()
{
  return 1;
}

uint64_t sub_100006C0C()
{
  return 12383;
}

uint64_t sub_100006C1C()
{
  return 0;
}

void sub_100006C28(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100006C34(uint64_t a1)
{
  unint64_t v2 = sub_10000E664();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100006C70(uint64_t a1)
{
  unint64_t v2 = sub_10000E664();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100006CAC(char a1)
{
  uint64_t result = 1819047278;
  switch(a1)
  {
    case 1:
      uint64_t result = 1819242338;
      break;
    case 2:
      uint64_t result = 0x38746E6975;
      break;
    case 3:
      uint64_t result = 0x3631746E6975;
      break;
    case 4:
      uint64_t result = 0x3233746E6975;
      break;
    case 5:
      uint64_t result = 0x3436746E6975;
      break;
    case 6:
      uint64_t result = 7630441;
      break;
    case 7:
      uint64_t result = 0x3233746E69;
      break;
    case 8:
      uint64_t result = 0x74616F6C66;
      break;
    case 9:
      uint64_t result = 0x676E69727473;
      break;
    case 10:
      uint64_t result = 947285108;
      break;
    case 11:
      uint64_t result = 1635017060;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100006DD8()
{
  return sub_100006CAC(*v0);
}

uint64_t sub_100006DE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10000E70C(a1, a2);
  *a3 = result;
  return result;
}

void sub_100006E08(unsigned char *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_100006E14(uint64_t a1)
{
  unint64_t v2 = sub_10000E274();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100006E50(uint64_t a1)
{
  unint64_t v2 = sub_10000E274();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100006E8C(uint64_t a1)
{
  unint64_t v2 = sub_10000E2C8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100006EC8(uint64_t a1)
{
  unint64_t v2 = sub_10000E2C8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100006F04(uint64_t a1)
{
  unint64_t v2 = sub_10000E418();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100006F40(uint64_t a1)
{
  unint64_t v2 = sub_10000E418();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100006F7C(uint64_t a1)
{
  unint64_t v2 = sub_10000E46C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100006FB8(uint64_t a1)
{
  unint64_t v2 = sub_10000E46C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100006FF4(uint64_t a1)
{
  unint64_t v2 = sub_10000E4C0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100007030(uint64_t a1)
{
  unint64_t v2 = sub_10000E4C0();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000706C()
{
  return 0;
}

uint64_t sub_100007078@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_1000070A8(uint64_t a1)
{
  unint64_t v2 = sub_10000E6B8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000070E4(uint64_t a1)
{
  unint64_t v2 = sub_10000E6B8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100007120(uint64_t a1)
{
  unint64_t v2 = sub_10000E3C4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000715C(uint64_t a1)
{
  unint64_t v2 = sub_10000E3C4();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100007198(uint64_t a1)
{
  unint64_t v2 = sub_10000E370();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000071D4(uint64_t a1)
{
  unint64_t v2 = sub_10000E370();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100007210(uint64_t a1)
{
  unint64_t v2 = sub_10000E5BC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000724C(uint64_t a1)
{
  unint64_t v2 = sub_10000E5BC();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100007288(uint64_t a1)
{
  unint64_t v2 = sub_10000E568();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000072C4(uint64_t a1)
{
  unint64_t v2 = sub_10000E568();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100007300(uint64_t a1)
{
  unint64_t v2 = sub_10000E514();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000733C(uint64_t a1)
{
  unint64_t v2 = sub_10000E514();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100007378(uint64_t a1)
{
  unint64_t v2 = sub_10000E610();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000073B4(uint64_t a1)
{
  unint64_t v2 = sub_10000E610();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t CharacteristicKind.Value.encode(to:)(void *a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v102 = a4;
  unint64_t v97 = a3;
  uint64_t v98 = a2;
  uint64_t v5 = sub_10000D9EC(&qword_100041688);
  uint64_t v95 = *(void *)(v5 - 8);
  uint64_t v96 = v5;
  __chkstk_darwin(v5, v6);
  v94 = (char *)v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000D9EC(&qword_100041690);
  uint64_t v92 = *(void *)(v8 - 8);
  uint64_t v93 = v8;
  __chkstk_darwin(v8, v9);
  v91 = (char *)v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = sub_10000D9EC(&qword_100041698);
  v66[1] = *(void *)(v90 - 8);
  __chkstk_darwin(v90, v11);
  v89 = (char *)v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10000D9EC(&qword_1000416A0);
  uint64_t v87 = *(void *)(v13 - 8);
  uint64_t v88 = v13;
  __chkstk_darwin(v13, v14);
  v86 = (char *)v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = sub_10000D9EC(&qword_1000416A8);
  uint64_t v84 = *(void *)(v85 - 8);
  __chkstk_darwin(v85, v16);
  v83 = (char *)v66 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = sub_10000D9EC(&qword_1000416B0);
  uint64_t v81 = *(void *)(v82 - 8);
  __chkstk_darwin(v82, v18);
  v80 = (char *)v66 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = sub_10000D9EC(&qword_1000416B8);
  uint64_t v78 = *(void *)(v79 - 8);
  __chkstk_darwin(v79, v20);
  v77 = (char *)v66 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_10000D9EC(&qword_1000416C0);
  uint64_t v75 = *(void *)(v76 - 8);
  __chkstk_darwin(v76, v22);
  v74 = (char *)v66 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_10000D9EC(&qword_1000416C8);
  uint64_t v72 = *(void *)(v73 - 8);
  __chkstk_darwin(v73, v24);
  v71 = (char *)v66 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = sub_10000D9EC(&qword_1000416D0);
  uint64_t v69 = *(void *)(v70 - 8);
  __chkstk_darwin(v70, v26);
  uint64_t v28 = (char *)v66 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_10000D9EC(&qword_1000416D8);
  uint64_t v68 = *(void *)(v29 - 8);
  __chkstk_darwin(v29, v30);
  uint64_t v32 = (char *)v66 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_10000D9EC(&qword_1000416E0);
  uint64_t v67 = *(void *)(v33 - 8);
  __chkstk_darwin(v33, v34);
  uint64_t v36 = (char *)v66 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = sub_10000D9EC(&qword_1000416E8);
  uint64_t v99 = *(void *)(v101 - 8);
  __chkstk_darwin(v101, v37);
  unint64_t v39 = (char *)v66 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000E230(a1, a1[3]);
  sub_10000E274();
  v100 = v39;
  sub_10002A5C8();
  switch((char)v102)
  {
    case 1:
      LOBYTE(v103) = 2;
      sub_10000E610();
      uint64_t v44 = v100;
      uint64_t v43 = v101;
      sub_10002A3F8();
      uint64_t v45 = v70;
      sub_10002A468();
      (*(void (**)(char *, uint64_t))(v69 + 8))(v28, v45);
      return (*(uint64_t (**)(char *, uint64_t))(v99 + 8))(v44, v43);
    case 2:
      LOBYTE(v103) = 3;
      sub_10000E5BC();
      uint64_t v46 = v71;
      v48 = v100;
      uint64_t v47 = v101;
      sub_10002A3F8();
      uint64_t v49 = v73;
      sub_10002A478();
      v50 = &v103;
      goto LABEL_11;
    case 3:
      LOBYTE(v103) = 4;
      sub_10000E568();
      uint64_t v46 = v74;
      v48 = v100;
      uint64_t v47 = v101;
      sub_10002A3F8();
      uint64_t v49 = v76;
      sub_10002A488();
      v50 = &v105;
      goto LABEL_11;
    case 4:
      LOBYTE(v103) = 5;
      sub_10000E514();
      uint64_t v46 = v77;
      v48 = v100;
      uint64_t v47 = v101;
      sub_10002A3F8();
      uint64_t v49 = v79;
      sub_10002A498();
      v50 = &v106;
      goto LABEL_11;
    case 5:
      LOBYTE(v103) = 6;
      sub_10000E4C0();
      uint64_t v46 = v80;
      v48 = v100;
      uint64_t v47 = v101;
      sub_10002A3F8();
      uint64_t v49 = v82;
      sub_10002A458();
      v50 = &v107;
      goto LABEL_11;
    case 6:
      LOBYTE(v103) = 7;
      sub_10000E46C();
      uint64_t v46 = v83;
      v48 = v100;
      uint64_t v47 = v101;
      sub_10002A3F8();
      uint64_t v49 = v85;
      sub_10002A458();
      v50 = &v108;
      goto LABEL_11;
    case 7:
      LOBYTE(v103) = 8;
      sub_10000E418();
      uint64_t v46 = v86;
      v48 = v100;
      uint64_t v47 = v101;
      sub_10002A3F8();
      uint64_t v49 = v88;
      sub_10002A428();
      uint64_t v51 = v87;
      goto LABEL_12;
    case 8:
      LOBYTE(v103) = 9;
      sub_10000E3C4();
      uint64_t v46 = v89;
      v48 = v100;
      uint64_t v47 = v101;
      sub_10002A3F8();
      uint64_t v49 = v90;
      sub_10002A408();
      v50 = &v98;
LABEL_11:
      uint64_t v51 = *(v50 - 32);
LABEL_12:
      (*(void (**)(char *, uint64_t))(v51 + 8))(v46, v49);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v99 + 8))(v48, v47);
      break;
    case 9:
      LOBYTE(v103) = 10;
      unint64_t v53 = v97;
      uint64_t v52 = v98;
      sub_10000D92C(v98, v97);
      sub_10000E370();
      v54 = v91;
      v56 = v100;
      uint64_t v55 = v101;
      sub_10002A3F8();
      uint64_t v103 = v52;
      unint64_t v104 = v53;
      sub_10000E31C();
      uint64_t v57 = v93;
      sub_10002A448();
      (*(void (**)(char *, uint64_t))(v92 + 8))(v54, v57);
      (*(void (**)(char *, uint64_t))(v99 + 8))(v56, v55);
      uint64_t result = sub_10000E204(v52, v53, 9);
      break;
    case 10:
      LOBYTE(v103) = 11;
      unint64_t v59 = v97;
      uint64_t v58 = v98;
      sub_10000D92C(v98, v97);
      sub_10000E2C8();
      v60 = v94;
      v62 = v100;
      uint64_t v61 = v101;
      sub_10002A3F8();
      uint64_t v103 = v58;
      unint64_t v104 = v59;
      sub_10000E31C();
      uint64_t v63 = v96;
      sub_10002A448();
      (*(void (**)(char *, uint64_t))(v95 + 8))(v60, v63);
      (*(void (**)(char *, uint64_t))(v99 + 8))(v62, v61);
      uint64_t result = sub_10000E204(v58, v59, 10);
      break;
    case 11:
      LOBYTE(v103) = 0;
      sub_10000E6B8();
      v65 = v100;
      uint64_t v64 = v101;
      sub_10002A3F8();
      (*(void (**)(char *, uint64_t))(v67 + 8))(v36, v33);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v99 + 8))(v65, v64);
      break;
    default:
      LOBYTE(v103) = 1;
      sub_10000E664();
      uint64_t v41 = v100;
      uint64_t v40 = v101;
      sub_10002A3F8();
      sub_10002A418();
      (*(void (**)(char *, uint64_t))(v68 + 8))(v32, v29);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v99 + 8))(v41, v40);
      break;
  }
  return result;
}

Swift::Int CharacteristicKind.Value.hashValue.getter(Swift::UInt64 a1, unint64_t a2, char a3)
{
  sub_10002A548();
  CharacteristicKind.Value.hash(into:)((uint64_t)v7, a1, a2, a3);
  return sub_10002A5A8();
}

uint64_t CharacteristicKind.Value.init(from:)(void *a1)
{
  uint64_t result = sub_10000EB60(a1);
  if (v1) {
    return v3;
  }
  return result;
}

uint64_t sub_1000081FC()
{
  return CharacteristicKind.Value.description.getter(*(Swift::String *)v0, *(unsigned char *)(v0 + 16));
}

uint64_t sub_100008208(uint64_t a1, uint64_t a2)
{
  return _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO5ValueO21__derived_enum_equalsySbAE_AEtFZ_0(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), *(void *)a2, *(void *)(a2 + 8), *(unsigned char *)(a2 + 16));
}

Swift::Int sub_100008224()
{
  Swift::UInt64 v1 = *(void *)v0;
  unint64_t v2 = *(void *)(v0 + 8);
  char v3 = *(unsigned char *)(v0 + 16);
  sub_10002A548();
  CharacteristicKind.Value.hash(into:)((uint64_t)v5, v1, v2, v3);
  return sub_10002A5A8();
}

void sub_100008280(uint64_t a1)
{
  CharacteristicKind.Value.hash(into:)(a1, *(void *)v1, *(void *)(v1 + 8), *(unsigned char *)(v1 + 16));
}

Swift::Int sub_10000828C()
{
  Swift::UInt64 v1 = *(void *)v0;
  unint64_t v2 = *(void *)(v0 + 8);
  char v3 = *(unsigned char *)(v0 + 16);
  sub_10002A548();
  CharacteristicKind.Value.hash(into:)((uint64_t)v5, v1, v2, v3);
  return sub_10002A5A8();
}

uint64_t sub_1000082E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)v1;
  unint64_t v3 = *(void *)(v1 + 8);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v3;
  char v4 = *(unsigned char *)(v1 + 16);
  *(unsigned char *)(a1 + 16) = v4;
  return sub_10000D900(v2, v3, v4);
}

uint64_t sub_1000082F8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_10000EB60(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(unsigned char *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_100008328(void *a1)
{
  return CharacteristicKind.Value.encode(to:)(a1, *(void *)v1, *(void *)(v1 + 8), *(unsigned __int8 *)(v1 + 16));
}

uint64_t sub_100008348()
{
  uint64_t v1 = 0x566D756D6978616DLL;
  if (*v0 != 1) {
    uint64_t v1 = 0x756C615670657473;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x566D756D696E696DLL;
  }
}

uint64_t sub_1000083AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10000FE1C(a1, a2);
  *a3 = result;
  return result;
}

void sub_1000083D4(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_1000083E0(uint64_t a1)
{
  unint64_t v2 = sub_10000FDC8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000841C(uint64_t a1)
{
  unint64_t v2 = sub_10000FDC8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t CharacteristicKind.Constraints.MinMaxStepValues.encode(to:)(void *a1)
{
  uint64_t v3 = sub_10000D9EC(&qword_100041760);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10000E230(a1, a1[3]);
  sub_10000FDC8();
  sub_10002A5C8();
  v9[15] = 0;
  sub_10002A438();
  if (!v1)
  {
    v9[14] = 1;
    sub_10002A438();
    v9[13] = 2;
    sub_10002A438();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v7, v3);
}

float CharacteristicKind.Constraints.MinMaxStepValues.init(from:)(void *a1)
{
  return sub_10000FFAC(a1);
}

void sub_100008620(void *a1@<X0>, uint64_t a2@<X8>)
{
  float v4 = sub_10000FFAC(a1);
  if (!v2)
  {
    *(float *)a2 = v4;
    *(_DWORD *)(a2 + 4) = v5;
    *(_DWORD *)(a2 + 8) = v6;
  }
}

uint64_t sub_100008650(void *a1)
{
  return CharacteristicKind.Constraints.MinMaxStepValues.encode(to:)(a1);
}

unint64_t sub_100008670(uint64_t a1, uint64_t a2, uint64_t a3)
{
  float v4 = v3;
  if (a2)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_10000BC98(a1, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v14;
  }
  else
  {
    unint64_t result = sub_10000A864(a3);
    if ((v10 & 1) == 0) {
      return result;
    }
    unint64_t v11 = result;
    int v12 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v3;
    uint64_t v15 = *v4;
    *float v4 = 0x8000000000000000;
    if (!v12)
    {
      sub_10000AD88();
      uint64_t v13 = v15;
    }
    sub_10000BB00(v11, v13);
    *float v4 = v13;
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

unint64_t sub_100008768(unint64_t result, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  uint64_t v5 = HIBYTE(v3) & 0xF;
  uint64_t v6 = *a2 & 0xFFFFFFFFFFFFLL;
  if ((v3 & 0x2000000000000000) != 0) {
    uint64_t v7 = HIBYTE(v3) & 0xF;
  }
  else {
    uint64_t v7 = v6;
  }
  if (!v7) {
    return result;
  }
  if ((v3 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = (uint64_t)sub_10000BA18(v4, v3, 10);
    char v30 = v29;
    unint64_t result = swift_bridgeObjectRelease();
    if (v30) {
      return result;
    }
    goto LABEL_36;
  }
  if ((v3 & 0x2000000000000000) != 0)
  {
    v31[0] = v4;
    v31[1] = v3 & 0xFFFFFFFFFFFFFFLL;
    if (v4 == 43)
    {
      if (!v5) {
        goto LABEL_65;
      }
      if (v5 == 1) {
        goto LABEL_63;
      }
      if ((BYTE1(v4) - 48) > 9u) {
        goto LABEL_32;
      }
      uint64_t v11 = (BYTE1(v4) - 48);
      if (v5 != 2)
      {
        if ((BYTE2(v4) - 48) > 9u) {
          goto LABEL_32;
        }
        uint64_t v11 = 10 * (BYTE1(v4) - 48) + (BYTE2(v4) - 48);
        uint64_t v12 = v5 - 3;
        if (v5 != 3)
        {
          uint64_t v13 = (unsigned __int8 *)v31 + 3;
          while (1)
          {
            unsigned int v14 = *v13 - 48;
            if (v14 > 9) {
              goto LABEL_32;
            }
            uint64_t v15 = 10 * v11;
            if ((unsigned __int128)(v11 * (__int128)10) >> 64 != (10 * v11) >> 63) {
              goto LABEL_32;
            }
            uint64_t v11 = v15 + v14;
            if (__OFADD__(v15, v14)) {
              goto LABEL_32;
            }
            LOBYTE(v5) = 0;
            ++v13;
            if (!--v12) {
              goto LABEL_35;
            }
          }
        }
      }
    }
    else
    {
      if (v4 == 45)
      {
        if (v5)
        {
          if (v5 != 1)
          {
            if ((BYTE1(v4) - 48) > 9u) {
              goto LABEL_32;
            }
            if (v5 == 2)
            {
              LOBYTE(v5) = 0;
              uint64_t v11 = -(uint64_t)(BYTE1(v4) - 48);
              goto LABEL_35;
            }
            if ((BYTE2(v4) - 48) > 9u) {
              goto LABEL_32;
            }
            uint64_t v11 = -10 * (BYTE1(v4) - 48) - (BYTE2(v4) - 48);
            uint64_t v25 = v5 - 3;
            if (v5 != 3)
            {
              uint64_t v26 = (unsigned __int8 *)v31 + 3;
              while (1)
              {
                unsigned int v27 = *v26 - 48;
                if (v27 > 9) {
                  goto LABEL_32;
                }
                uint64_t v28 = 10 * v11;
                if ((unsigned __int128)(v11 * (__int128)10) >> 64 != (10 * v11) >> 63) {
                  goto LABEL_32;
                }
                uint64_t v11 = v28 - v27;
                if (__OFSUB__(v28, v27)) {
                  goto LABEL_32;
                }
                LOBYTE(v5) = 0;
                ++v26;
                if (!--v25) {
                  goto LABEL_35;
                }
              }
            }
            goto LABEL_34;
          }
LABEL_63:
          uint64_t v11 = 0;
LABEL_35:
          if (v5) {
            return result;
          }
          goto LABEL_36;
        }
        __break(1u);
LABEL_65:
        __break(1u);
        return result;
      }
      if (!v5 || (v4 - 48) > 9u)
      {
LABEL_32:
        uint64_t v11 = 0;
        LOBYTE(v5) = 1;
        goto LABEL_35;
      }
      uint64_t v11 = (v4 - 48);
      if (v5 != 1)
      {
        if ((BYTE1(v4) - 48) > 9u) {
          goto LABEL_32;
        }
        uint64_t v11 = 10 * (v4 - 48) + (BYTE1(v4) - 48);
        uint64_t v21 = v5 - 2;
        if (v5 != 2)
        {
          uint64_t v22 = (unsigned __int8 *)v31 + 2;
          while (1)
          {
            unsigned int v23 = *v22 - 48;
            if (v23 > 9) {
              goto LABEL_32;
            }
            uint64_t v24 = 10 * v11;
            if ((unsigned __int128)(v11 * (__int128)10) >> 64 != (10 * v11) >> 63) {
              goto LABEL_32;
            }
            uint64_t v11 = v24 + v23;
            if (__OFADD__(v24, v23)) {
              goto LABEL_32;
            }
            LOBYTE(v5) = 0;
            ++v22;
            if (!--v21) {
              goto LABEL_35;
            }
          }
        }
      }
    }
LABEL_34:
    LOBYTE(v5) = 0;
    goto LABEL_35;
  }
  if ((v4 & 0x1000000000000000) != 0) {
    uint64_t v9 = (unsigned __int8 *)((v3 & 0xFFFFFFFFFFFFFFFLL) + 32);
  }
  else {
    uint64_t v9 = (unsigned __int8 *)sub_10002A228();
  }
  unint64_t result = (unint64_t)sub_10000BDD8(v9, v6, 10);
  if (v10) {
    return result;
  }
  uint64_t v11 = result;
LABEL_36:
  if (*(void *)(a3 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v16 = sub_10000A7EC(v4, v3);
    if (v17)
    {
      uint64_t v18 = (uint64_t *)(*(void *)(a3 + 56) + 16 * v16);
      uint64_t v19 = *v18;
      uint64_t v20 = v18[1];
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v19 = 0;
      uint64_t v20 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v19 = 0;
    uint64_t v20 = 0;
  }
  return sub_100008670(v19, v20, v11);
}

BOOL sub_100008AC8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100008ADC()
{
  Swift::UInt v1 = *v0;
  sub_10002A548();
  sub_10002A558(v1);
  return sub_10002A5A8();
}

void sub_100008B24()
{
  sub_10002A558(*v0);
}

Swift::Int sub_100008B50()
{
  Swift::UInt v1 = *v0;
  sub_10002A548();
  sub_10002A558(v1);
  return sub_10002A5A8();
}

uint64_t sub_100008B94()
{
  unint64_t v1 = 0x74694264696C6176;
  if (*v0 != 1) {
    unint64_t v1 = 0xD000000000000010;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6C615664696C6176;
  }
}

uint64_t sub_100008C00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100010370(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100008C28(uint64_t a1)
{
  unint64_t v2 = sub_100010184();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100008C64(uint64_t a1)
{
  unint64_t v2 = sub_100010184();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100008CA0(uint64_t a1)
{
  unint64_t v2 = sub_1000101D8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100008CDC(uint64_t a1)
{
  unint64_t v2 = sub_1000101D8();

  return CodingKey.debugDescription.getter(a1, v2);
}

void sub_100008D18()
{
}

uint64_t sub_100008D40(uint64_t a1)
{
  unint64_t v2 = sub_100010280();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100008D7C(uint64_t a1)
{
  unint64_t v2 = sub_100010280();

  return CodingKey.debugDescription.getter(a1, v2);
}

Swift::Int sub_100008DB8()
{
  return sub_10002A5A8();
}

Swift::Int sub_100008DFC()
{
  return sub_10002A5A8();
}

uint64_t sub_100008E3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_10002A4D8();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_100008EBC(uint64_t a1)
{
  unint64_t v2 = sub_10001031C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100008EF8(uint64_t a1)
{
  unint64_t v2 = sub_10001031C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t CharacteristicKind.Constraints.encode(to:)(void *a1, unint64_t a2, uint64_t a3)
{
  uint64_t v33 = a3;
  unint64_t v34 = a2;
  uint64_t v4 = sub_10000D9EC(&qword_100041770);
  uint64_t v31 = *(void *)(v4 - 8);
  uint64_t v32 = v4;
  __chkstk_darwin(v4, v5);
  char v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000D9EC(&qword_100041778);
  uint64_t v29 = *(void *)(v8 - 8);
  uint64_t v30 = v8;
  __chkstk_darwin(v8, v9);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000D9EC(&qword_100041780);
  uint64_t v28 = *(void *)(v12 - 8);
  __chkstk_darwin(v12, v13);
  uint64_t v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10000D9EC(&qword_100041788);
  uint64_t v35 = *(void *)(v16 - 8);
  __chkstk_darwin(v16, v17);
  uint64_t v19 = (char *)&v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000E230(a1, a1[3]);
  sub_100010184();
  uint64_t v20 = v33;
  sub_10002A5C8();
  if (BYTE4(v20))
  {
    if (BYTE4(v20) != 1)
    {
      unsigned int v24 = v34;
      unint64_t v25 = HIDWORD(v34);
      LOBYTE(v36) = 2;
      sub_1000101D8();
      sub_10002A3F8();
      unint64_t v36 = __PAIR64__(v25, v24);
      int v37 = v20;
      sub_10001022C();
      uint64_t v26 = v32;
      sub_10002A448();
      uint64_t v21 = *(void (**)(char *, uint64_t))(v31 + 8);
      uint64_t v22 = v7;
      uint64_t v23 = v26;
      goto LABEL_7;
    }
    LOBYTE(v36) = 1;
    sub_100010280();
    sub_10002A3F8();
    unint64_t v36 = v34;
    sub_10000D9EC(&qword_1000417B0);
    sub_100013828(&qword_1000417B8);
    uint64_t v12 = v30;
    sub_10002A448();
    uint64_t v21 = *(void (**)(char *, uint64_t))(v29 + 8);
    uint64_t v22 = v11;
  }
  else
  {
    LOBYTE(v36) = 0;
    sub_10001031C();
    sub_10002A3F8();
    unint64_t v36 = v34;
    sub_10000D9EC(&qword_1000417B0);
    sub_100013828(&qword_1000417B8);
    sub_10002A448();
    uint64_t v21 = *(void (**)(char *, uint64_t))(v28 + 8);
    uint64_t v22 = v15;
  }
  uint64_t v23 = v12;
LABEL_7:
  v21(v22, v23);
  return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v19, v16);
}

uint64_t CharacteristicKind.Constraints.init(from:)(void *a1)
{
  uint64_t result = sub_1000104E8(a1);
  if (v1) {
    return v3 & 0xFFFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_1000093D8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1000104E8(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(_DWORD *)(a2 + 8) = v5;
    *(unsigned char *)(a2 + 12) = BYTE4(v5);
  }
  return result;
}

uint64_t sub_100009410(void *a1)
{
  return CharacteristicKind.Constraints.encode(to:)(a1, *(void *)v1, *(unsigned int *)(v1 + 8) | ((unint64_t)*(unsigned __int8 *)(v1 + 12) << 32));
}

void *CharacteristicKind.Permissions.securedRead.unsafeMutableAddressor()
{
  return &static CharacteristicKind.Permissions.securedRead;
}

void *CharacteristicKind.Permissions.securedWrite.unsafeMutableAddressor()
{
  return &static CharacteristicKind.Permissions.securedWrite;
}

uint64_t static CharacteristicKind.Permissions.securedWrite.getter()
{
  return 2;
}

void sub_10000945C()
{
  static CharacteristicKind.Permissions.allPermissions = (uint64_t)&off_10003A5A0;
}

uint64_t *CharacteristicKind.Permissions.allPermissions.unsafeMutableAddressor()
{
  if (qword_100041618 != -1) {
    swift_once();
  }
  return &static CharacteristicKind.Permissions.allPermissions;
}

uint64_t static CharacteristicKind.Permissions.allPermissions.getter()
{
  return sub_1000096C8(&qword_100041618);
}

void sub_1000094E8(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1000094F4()
{
  return sub_10002A008();
}

uint64_t sub_100009554()
{
  return sub_100029FE8();
}

void sub_1000095A4(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_1000095AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

uint64_t sub_1000095C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_100024774();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void *CharacteristicKind.Properties.read.unsafeMutableAddressor()
{
  return &static CharacteristicKind.Properties.read;
}

void *CharacteristicKind.Properties.write.unsafeMutableAddressor()
{
  return &static CharacteristicKind.Properties.write;
}

void *CharacteristicKind.Properties.cnotify.unsafeMutableAddressor()
{
  return &static CharacteristicKind.Properties.cnotify;
}

uint64_t static CharacteristicKind.Properties.cnotify.getter()
{
  return 4;
}

void *CharacteristicKind.Properties.uncnotify.unsafeMutableAddressor()
{
  return &static CharacteristicKind.Properties.uncnotify;
}

uint64_t static CharacteristicKind.Properties.uncnotify.getter()
{
  return 8;
}

void sub_100009644()
{
  static CharacteristicKind.Properties.allProperties = (uint64_t)&off_10003A5D0;
}

uint64_t *CharacteristicKind.Properties.allProperties.unsafeMutableAddressor()
{
  if (qword_100041620 != -1) {
    swift_once();
  }
  return &static CharacteristicKind.Properties.allProperties;
}

uint64_t static CharacteristicKind.Properties.allProperties.getter()
{
  return sub_1000096C8(&qword_100041620);
}

uint64_t sub_1000096C8(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

void *sub_100009714@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

BOOL sub_100009720(void *a1, void *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100009734()
{
  Swift::UInt v1 = *v0;
  sub_10002A548();
  sub_10002A558(v1);
  return sub_10002A5A8();
}

void sub_10000977C()
{
  sub_10002A558(*v0);
}

Swift::Int sub_1000097A8()
{
  Swift::UInt v1 = *v0;
  sub_10002A548();
  sub_10002A558(v1);
  return sub_10002A5A8();
}

uint64_t sub_1000097EC()
{
  return sub_10002A008();
}

uint64_t sub_10000984C()
{
  return sub_100029FE8();
}

void *sub_10000989C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_1000098B0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_1000098C4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_1000098D8(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_100009908@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_100009934@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_100009958(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_10000996C(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_100009980(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_100009994@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_1000099A8(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_1000099BC(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_1000099D0(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_1000099E4()
{
  return *v0 == 0;
}

void *sub_1000099F4(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_100009A08@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t CharacteristicKind.Format.rawValue.getter(char a1)
{
  uint64_t result = 1819242338;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x38746E6975;
      break;
    case 2:
      uint64_t result = 0x3631746E6975;
      break;
    case 3:
      uint64_t result = 0x3233746E6975;
      break;
    case 4:
      uint64_t result = 0x3436746E6975;
      break;
    case 5:
      uint64_t result = 7630441;
      break;
    case 6:
      uint64_t result = 0x3233746E69;
      break;
    case 7:
      uint64_t result = 0x74616F6C66;
      break;
    case 8:
      uint64_t result = 0x676E69727473;
      break;
    case 9:
      uint64_t result = 947285108;
      break;
    case 10:
      uint64_t result = 1635017060;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO6FormatO2idSSvg_0(char a1)
{
  uint64_t result = 1819242338;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x38746E6975;
      break;
    case 2:
      uint64_t result = 0x3631746E6975;
      break;
    case 3:
      uint64_t result = 0x3233746E6975;
      break;
    case 4:
      uint64_t result = 0x3436746E6975;
      break;
    case 5:
      uint64_t result = 7630441;
      break;
    case 6:
      uint64_t result = 0x3233746E69;
      break;
    case 7:
      uint64_t result = 0x74616F6C66;
      break;
    case 8:
      uint64_t result = 0x676E69727473;
      break;
    case 9:
      uint64_t result = 947285108;
      break;
    case 10:
      uint64_t result = 1635017060;
      break;
    default:
      return result;
  }
  return result;
}

_UNKNOWN **static CharacteristicKind.Format.allCases.getter()
{
  return &off_10003A610;
}

uint64_t sub_100009C50@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO6FormatO8rawValueAESgSS_tcfC_0(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_100009C80@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CharacteristicKind.Format.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100009CAC()
{
  return CharacteristicKind.Format.id.getter(*v0);
}

void sub_100009CB4(void *a1@<X8>)
{
  *a1 = &off_10003A610;
}

uint64_t sub_100009CC4(char *a1, char *a2)
{
  char v2 = *a2;
  uint64_t v3 = CharacteristicKind.Format.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == CharacteristicKind.Format.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_10002A4D8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int sub_100009D50()
{
  char v1 = *v0;
  sub_10002A548();
  CharacteristicKind.Format.rawValue.getter(v1);
  sub_100029F38();
  swift_bridgeObjectRelease();
  return sub_10002A5A8();
}

uint64_t sub_100009DB4()
{
  CharacteristicKind.Format.rawValue.getter(*v0);
  sub_100029F38();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100009E08()
{
  char v1 = *v0;
  sub_10002A548();
  CharacteristicKind.Format.rawValue.getter(v1);
  sub_100029F38();
  swift_bridgeObjectRelease();
  return sub_10002A5A8();
}

uint64_t sub_100009E68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CharacteristicKind.Format.id.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100009E94()
{
  return sub_100029FF8();
}

uint64_t sub_100009EF4()
{
  return sub_100029FD8();
}

_UNKNOWN **static CharacteristicKind.Unit.allCases.getter()
{
  return &off_10003A640;
}

uint64_t CharacteristicKind.Unit.rawValue.getter(char a1)
{
  uint64_t result = 0x737569736C6563;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x61746E6563726570;
      break;
    case 2:
      uint64_t result = 0x6572676564637261;
      break;
    case 3:
      uint64_t result = 7894380;
      break;
    case 4:
      uint64_t result = 0x73646E6F636573;
      break;
    case 5:
      uint64_t result = 0x7373656C74696E75;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000A01C(unsigned __int8 *a1, char *a2)
{
  return sub_100003C80(*a1, *a2);
}

Swift::Int sub_10000A028()
{
  return sub_100003F74();
}

uint64_t sub_10000A030()
{
  sub_100029F38();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000A12C()
{
  return sub_10000413C();
}

uint64_t sub_10000A134@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO4UnitO8rawValueAESgSS_tcfC_0(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

void sub_10000A164(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE700000000000000;
  uint64_t v3 = 0x737569736C6563;
  switch(*v1)
  {
    case 1:
      uint64_t v3 = 0x61746E6563726570;
      unint64_t v2 = 0xEA00000000006567;
      goto LABEL_3;
    case 2:
      *a1 = 0x6572676564637261;
      a1[1] = 0xEA00000000007365;
      break;
    case 3:
      *a1 = 7894380;
      a1[1] = 0xE300000000000000;
      break;
    case 4:
      *a1 = 0x73646E6F636573;
      a1[1] = 0xE700000000000000;
      break;
    case 5:
      *a1 = 0x7373656C74696E75;
      a1[1] = 0xE800000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

void sub_10000A240(void *a1@<X8>)
{
  *a1 = &off_10003A640;
}

uint64_t sub_10000A250()
{
  return sub_100029FF8();
}

uint64_t sub_10000A2B0()
{
  return sub_100029FD8();
}

BOOL sub_10000A300(uint64_t a1, double a2)
{
  uint64_t v4 = (*(void *)&a2 >> 52) & 0x7FFLL;
  unint64_t v5 = *(void *)&a2 & 0xFFFFFFFFFFFFFLL;
  uint64_t v6 = v4 | *(void *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (!v6)
  {
    uint64_t v12 = 0;
    BOOL result = 1;
    goto LABEL_25;
  }
  if (v4 == 2047) {
    goto LABEL_28;
  }
  uint64_t v7 = sub_10002A0E8();
  if (v7 > 63) {
    goto LABEL_28;
  }
  uint64_t v8 = v7;
  uint64_t v9 = sub_10002A0C8();
  BOOL result = v8 >= v9;
  uint64_t v11 = v9 + __clz(__rbit64(v5));
  uint64_t v12 = v8 - v11;
  if (__OFSUB__(v8, v11))
  {
    __break(1u);
LABEL_27:
    if (a2 < 0.0)
    {
LABEL_36:
      LOBYTE(v6) = 0;
      uint64_t v12 = 0x8000000000000000;
      goto LABEL_25;
    }
LABEL_28:
    uint64_t v12 = 0;
    BOOL result = 0;
    LOBYTE(v6) = 1;
    goto LABEL_25;
  }
  if (v11 > 63)
  {
    if (v12 < -64 || v12 > 64) {
      goto LABEL_11;
    }
  }
  else if (v12 < -64 || v12 > 64)
  {
    goto LABEL_11;
  }
  if (v12 < 0) {
    goto LABEL_32;
  }
  if ((unint64_t)v12 < 0x40)
  {
    unint64_t v14 = v5 << v12;
    if (v8 != 63) {
      goto LABEL_17;
    }
LABEL_34:
    if (a2 < 0.0 && !v14) {
      goto LABEL_36;
    }
    goto LABEL_28;
  }
LABEL_11:
  if (v8 == 63) {
    goto LABEL_27;
  }
  uint64_t v13 = 0;
  unint64_t v14 = 0;
  if (v8 < 0) {
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v13 = 1 << v8;
LABEL_20:
  while (1)
  {
    uint64_t v12 = v14 | v13;
    if (a2 >= 0.0) {
      break;
    }
    if ((v12 & 0x8000000000000000) == 0)
    {
      LOBYTE(v6) = 0;
      uint64_t v12 = -v12;
      goto LABEL_25;
    }
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    if ((unint64_t)v12 <= 0xFFFFFFFFFFFFFFC0) {
      goto LABEL_11;
    }
    unint64_t v14 = v5 >> -(char)v12;
    if (v8 == 63) {
      goto LABEL_34;
    }
LABEL_17:
    if ((v8 & 0x8000000000000000) == 0) {
      goto LABEL_19;
    }
    uint64_t v13 = 0;
  }
  if (v12 < 0) {
    goto LABEL_31;
  }
  LOBYTE(v6) = 0;
LABEL_25:
  *(void *)a1 = v12;
  *(unsigned char *)(a1 + 8) = v6;
  return result;
}

BOOL sub_10000A488(uint64_t a1, float a2)
{
  int v4 = (LODWORD(a2) >> 23);
  unint64_t v5 = LODWORD(a2) & 0x7FFFFF;
  char v6 = v4 | LOBYTE(a2);
  if (!(v4 | v5))
  {
    unint64_t v14 = 0;
    BOOL result = 1;
    goto LABEL_26;
  }
  if (v4 == 255 || (uint64_t v7 = sub_10002A108(), v7 > 63))
  {
LABEL_38:
    unint64_t v14 = 0;
    BOOL result = 0;
    char v6 = 1;
    goto LABEL_26;
  }
  uint64_t v8 = v7;
  uint64_t v9 = sub_10002A0F8();
  BOOL result = v8 >= v9;
  uint64_t v11 = v9 + __clz(__rbit32(v5));
  uint64_t v12 = v8 - v11;
  if (__OFSUB__(v8, v11))
  {
    __break(1u);
    goto LABEL_31;
  }
  if (v11 > 63)
  {
    if ((unint64_t)(v12 - 33) < 0xFFFFFFFFFFFFFFBFLL) {
      goto LABEL_12;
    }
    if (v12 < 0)
    {
      if ((unint64_t)v12 <= 0xFFFFFFFFFFFFFFE0) {
        LODWORD(v12) = 0;
      }
      else {
        LODWORD(v12) = v5 >> (v11 - v8);
      }
      goto LABEL_16;
    }
    if ((unint64_t)v12 >= 0x20) {
LABEL_12:
    }
      LODWORD(v12) = 0;
    else {
      LODWORD(v12) = v5 << v12;
    }
LABEL_16:
    uint64_t v12 = v12;
LABEL_17:
    if (v8 != 63)
    {
      if (v8 < 0)
      {
        uint64_t v13 = 0;
        goto LABEL_21;
      }
      goto LABEL_20;
    }
LABEL_31:
    if (a2 >= 0.0 || v12) {
      goto LABEL_38;
    }
    goto LABEL_33;
  }
  if (v12 >= -64 && v12 <= 64)
  {
    if (v12 < 0)
    {
      if ((unint64_t)v12 <= 0xFFFFFFFFFFFFFFC0) {
        goto LABEL_8;
      }
      uint64_t v12 = v5 >> (v11 - v8);
    }
    else
    {
      if ((unint64_t)v12 >= 0x40) {
        goto LABEL_8;
      }
      uint64_t v12 = v5 << v12;
    }
    goto LABEL_17;
  }
LABEL_8:
  if (v8 == 63) {
    goto LABEL_37;
  }
  uint64_t v13 = 0;
  uint64_t v12 = 0;
  if ((v8 & 0x8000000000000000) == 0) {
LABEL_20:
  }
    uint64_t v13 = 1 << v8;
LABEL_21:
  unint64_t v14 = v12 | v13;
  if (a2 >= 0.0)
  {
    if ((v14 & 0x8000000000000000) == 0)
    {
      char v6 = 0;
      goto LABEL_26;
    }
    goto LABEL_36;
  }
  if ((v14 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    if (a2 >= 0.0) {
      goto LABEL_38;
    }
LABEL_33:
    char v6 = 0;
    unint64_t v14 = 0x8000000000000000;
    goto LABEL_26;
  }
  char v6 = 0;
  unint64_t v14 = -(uint64_t)v14;
LABEL_26:
  *(void *)a1 = v14;
  *(unsigned char *)(a1 + 8) = v6;
  return result;
}

char *sub_10000A638(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
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
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_10000D9EC(&qword_100041AE8);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 72);
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[72 * v8 + 32]) {
          memmove(v12, a4 + 32, 72 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_10000D410(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_10000A764(uint64_t a1)
{
  sub_10002A548();
  CharacteristicKind.rawValue.getter();
  sub_100029F38();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_10002A5A8();

  return sub_10000A8A8(a1, v2);
}

unint64_t sub_10000A7EC(uint64_t a1, uint64_t a2)
{
  sub_10002A548();
  sub_100029F38();
  Swift::Int v4 = sub_10002A5A8();

  return sub_10000AA14(a1, a2, v4);
}

unint64_t sub_10000A864(uint64_t a1)
{
  uint64_t v2 = sub_10002A538();

  return sub_10000AAF8(a1, v2);
}

unint64_t sub_10000A8A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    CharacteristicKind.rawValue.getter();
    uint64_t v7 = v6;
    CharacteristicKind.rawValue.getter();
    if (v7 == v8)
    {
LABEL_10:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    uint64_t v9 = v8;
    char v10 = sub_10002A4D8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0)
    {
      uint64_t v11 = ~v4;
      unint64_t v5 = (v5 + 1) & v11;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          CharacteristicKind.rawValue.getter();
          if (v12 == v9) {
            break;
          }
          char v13 = sub_10002A4D8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v13 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v11;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_10;
      }
    }
  }
  return v5;
}

unint64_t sub_10000AA14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10002A4D8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        char v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_10002A4D8() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_10000AAF8(uint64_t a1, uint64_t a2)
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

void *sub_10000AB94()
{
  char v1 = v0;
  sub_10000D9EC(&qword_100041AE0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10002A2D8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *char v1 = v4;
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
    int64_t v27 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v27 >= v13) {
      goto LABEL_26;
    }
    unint64_t v28 = *(void *)(v6 + 8 * v27);
    ++v9;
    if (!v28)
    {
      int64_t v9 = v27 + 1;
      if (v27 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v28 = *(void *)(v6 + 8 * v9);
      if (!v28) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v28 - 1) & v28;
    unint64_t v15 = __clz(__rbit64(v28)) + (v9 << 6);
LABEL_12:
    unint64_t v16 = *(void *)(v2 + 56) + (v15 << 6);
    char v17 = *(unsigned char *)v16;
    uint64_t v19 = *(void *)(v16 + 8);
    uint64_t v18 = *(void *)(v16 + 16);
    __int16 v20 = *(_WORD *)(v16 + 24);
    uint64_t v21 = *(void *)(v16 + 32);
    uint64_t v22 = *(unsigned __int8 *)(v16 + 44);
    uint64_t v23 = *(unsigned int *)(v16 + 40);
    uint64_t v24 = v23 | (v22 << 32);
    long long v25 = *(_OWORD *)(v16 + 48);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    unint64_t v26 = *(void *)(v4 + 56) + (v15 << 6);
    *(unsigned char *)unint64_t v26 = v17;
    *(void *)(v26 + 8) = v19;
    *(void *)(v26 + 16) = v18;
    *(_WORD *)(v26 + 24) = v20;
    *(void *)(v26 + 32) = v21;
    *(unsigned char *)(v26 + 44) = v22;
    *(_DWORD *)(v26 + 40) = v23;
    *(_OWORD *)(v26 + 48) = v25;
    swift_bridgeObjectRetain();
    unint64_t result = (void *)sub_10000D8D8(v21, v24);
  }
  int64_t v29 = v27 + 2;
  if (v29 >= v13) {
    goto LABEL_26;
  }
  unint64_t v28 = *(void *)(v6 + 8 * v29);
  if (v28)
  {
    int64_t v9 = v29;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v28 = *(void *)(v6 + 8 * v9);
    ++v29;
    if (v28) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10000AD88()
{
  char v1 = v0;
  sub_10000D9EC(&qword_100041B18);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10002A2D8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *char v1 = v4;
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
    void *v22 = v21;
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

uint64_t sub_10000AF38(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10000D9EC(&qword_100041AE0);
  char v38 = a2;
  uint64_t v6 = sub_10002A2E8();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    unint64_t v36 = (void *)(v5 + 64);
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
    for (i = v5; ; uint64_t v5 = i)
    {
      if (v10)
      {
        unint64_t v19 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v20 = v19 | (v13 << 6);
      }
      else
      {
        int64_t v21 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v21 >= v35) {
          goto LABEL_33;
        }
        unint64_t v22 = v36[v21];
        ++v13;
        if (!v22)
        {
          int64_t v13 = v21 + 1;
          if (v21 + 1 >= v35) {
            goto LABEL_33;
          }
          unint64_t v22 = v36[v13];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v35)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v2;
              if (v38)
              {
                uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
                if (v34 >= 64) {
                  bzero(v36, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v36 = -1 << v34;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v36[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v13 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_40;
                }
                if (v13 >= v35) {
                  goto LABEL_33;
                }
                unint64_t v22 = v36[v13];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v13 = v23;
          }
        }
LABEL_30:
        unint64_t v10 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v13 << 6);
      }
      char v28 = *(unsigned char *)(*(void *)(v5 + 48) + v20);
      unint64_t v29 = *(void *)(v5 + 56) + (v20 << 6);
      char v30 = *(unsigned char *)v29;
      uint64_t v31 = *(void *)(v29 + 16);
      uint64_t v42 = *(void *)(v29 + 8);
      char v40 = *(unsigned char *)(v29 + 25);
      char v41 = *(unsigned char *)(v29 + 24);
      uint64_t v32 = *(void *)(v29 + 32);
      unint64_t v33 = *(unsigned int *)(v29 + 40) | ((unint64_t)*(unsigned __int8 *)(v29 + 44) << 32);
      long long v39 = *(_OWORD *)(v29 + 48);
      if ((v38 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        sub_10000D8D8(v32, v33);
      }
      sub_10002A548();
      CharacteristicKind.rawValue.getter();
      sub_100029F38();
      swift_bridgeObjectRelease();
      uint64_t result = sub_10002A5A8();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v11 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(unsigned char *)(*(void *)(v7 + 48) + v17) = v28;
      unint64_t v18 = *(void *)(v7 + 56) + (v17 << 6);
      *(unsigned char *)unint64_t v18 = v30;
      *(void *)(v18 + 8) = v42;
      *(void *)(v18 + 16) = v31;
      *(unsigned char *)(v18 + 24) = v41;
      *(unsigned char *)(v18 + 25) = v40;
      *(void *)(v18 + 32) = v32;
      *(unsigned char *)(v18 + 44) = BYTE4(v33);
      *(_DWORD *)(v18 + 40) = v33;
      *(_OWORD *)(v18 + 48) = v39;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10000B2BC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10000D9EC(&qword_100041B18);
  uint64_t result = sub_10002A2E8();
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
                  *uint64_t v34 = v31;
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
      char v28 = (uint64_t *)(*(void *)(v5 + 56) + 16 * v19);
      uint64_t v29 = *v28;
      uint64_t v30 = v28[1];
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      uint64_t result = sub_10002A538();
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

uint64_t sub_10000B574@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_10000D92C(a2, a3);
      uint64_t v10 = (char *)sub_100029C88();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_100029CA8();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_100029C98();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
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
        JUMPOUT(0x10000B7D8);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_10000DAFC(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      unint64_t v17 = (char *)sub_100029C88();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_100029CA8();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_100029C98();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t sub_10000B7E8(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      sub_10000D92C(a1, a2);
      char v5 = sub_10000DB54((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
      sub_10000DAFC(a1, a2);
      goto LABEL_6;
    case 2uLL:
      uint64_t v10 = a2 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v12 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      char v5 = sub_10000DB54(v11, v12, v10, a3, a4);
      swift_release();
      swift_release();
LABEL_6:
      sub_10000DAFC(a3, a4);
      return v5 & 1;
    case 3uLL:
      memset(__s1, 0, 14);
      goto LABEL_8;
    default:
      __s1[0] = a1;
      LOWORD(__s1[1]) = a2;
      BYTE2(__s1[1]) = BYTE2(a2);
      BYTE3(__s1[1]) = BYTE3(a2);
      BYTE4(__s1[1]) = BYTE4(a2);
      BYTE5(__s1[1]) = BYTE5(a2);
LABEL_8:
      sub_10000B574((uint64_t)__s1, a3, a4, &v14);
      sub_10000DAFC(a3, a4);
      if (!v4) {
        char v5 = v14;
      }
      return v5 & 1;
  }
}

unsigned __int8 *sub_10000BA18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_100029FB8();
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
    uint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_10000C054();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v7 = (unsigned __int8 *)sub_10002A228();
  }
LABEL_7:
  uint64_t v11 = sub_10000BDD8(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unint64_t sub_10000BB00(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_10002A188();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = *(void *)(a2 + 48);
        unint64_t v10 = (void *)(v9 + 8 * v6);
        uint64_t result = sub_10002A538();
        unint64_t v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            uint64_t v14 = (void *)(v9 + 8 * v3);
            if (v3 != v6 || v14 >= v10 + 1) {
              *uint64_t v14 = *v10;
            }
            uint64_t v15 = *(void *)(a2 + 56);
            uint64_t v16 = (_OWORD *)(v15 + 16 * v3);
            unint64_t v17 = (_OWORD *)(v15 + 16 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 1))
            {
              _OWORD *v16 = *v17;
              int64_t v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *uint64_t v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_10000BC98(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_10000A864(a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_10000AD88();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = (void *)(v18[7] + 16 * v12);
      uint64_t result = swift_bridgeObjectRelease();
      *uint64_t v19 = a1;
      v19[1] = a2;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    *(void *)(v18[6] + 8 * v12) = a3;
    uint64_t v21 = (void *)(v18[7] + 16 * v12);
    *uint64_t v21 = a1;
    v21[1] = a2;
    uint64_t v22 = v18[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (!v23)
    {
      v18[2] = v24;
      return result;
    }
    goto LABEL_14;
  }
  sub_10000B2BC(result, a4 & 1);
  uint64_t result = sub_10000A864(a3);
  if ((v16 & 1) == (v20 & 1))
  {
    unint64_t v12 = result;
    uint64_t v18 = (void *)*v5;
    if (v16) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_10002A528();
  __break(1u);
  return result;
}

unsigned __int8 *sub_10000BDD8(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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
            for (uint64_t i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
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
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
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
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_10000C054()
{
  unint64_t v0 = sub_100029FC8();
  uint64_t v4 = sub_10000C0D4(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_10000C0D4(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_10000C22C(a1, a2, a3, a4);
    if (!v9
      || (uint64_t v10 = v9,
          unsigned int v11 = sub_100014EA4(v9, 0),
          unint64_t v12 = sub_10000C32C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4),
          swift_bridgeObjectRetain(),
          swift_bridgeObjectRelease(),
          v12 == v10))
    {
      uint64_t v13 = sub_100029F28();
      swift_release();
      return v13;
    }
    __break(1u);
  }
  else
  {
    if ((a4 & 0x2000000000000000) != 0)
    {
      v14[0] = a3;
      v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
      return sub_100029F28();
    }
    if ((a3 & 0x1000000000000000) != 0) {
      goto LABEL_4;
    }
  }
  sub_10002A228();
LABEL_4:

  return sub_100029F28();
}

uint64_t sub_10000C22C(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
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
    a1 = sub_100014F0C(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_100014F0C(v6, v5, v4);
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
    return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
  }
  __break(1u);
  return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
}

unint64_t sub_10000C32C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
    v9[2] = a6;
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
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_100014F0C(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_100029F98();
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
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_10002A228();
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
    uint64_t result = sub_100014F0C(v12, a6, a7);
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
    unint64_t v12 = sub_100029F68();
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

uint64_t _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO8rawValueACSgSS_tcfC_0()
{
  uint64_t v0 = sub_10002A4F8();
  swift_bridgeObjectRelease();
  uint64_t v1 = 0;
  uint64_t result = 66;
  switch(v0)
  {
    case 0:
      goto LABEL_70;
    case 1:
      uint64_t v1 = 1;
      goto LABEL_70;
    case 2:
      uint64_t v1 = 2;
      goto LABEL_70;
    case 3:
      uint64_t v1 = 3;
      goto LABEL_70;
    case 4:
      uint64_t v1 = 4;
      goto LABEL_70;
    case 5:
      uint64_t v1 = 5;
      goto LABEL_70;
    case 6:
      uint64_t v1 = 6;
      goto LABEL_70;
    case 7:
      uint64_t v1 = 7;
      goto LABEL_70;
    case 8:
      uint64_t v1 = 8;
      goto LABEL_70;
    case 9:
      uint64_t v1 = 9;
      goto LABEL_70;
    case 10:
      uint64_t v1 = 10;
      goto LABEL_70;
    case 11:
      uint64_t v1 = 11;
      goto LABEL_70;
    case 12:
      uint64_t v1 = 12;
      goto LABEL_70;
    case 13:
      uint64_t v1 = 13;
      goto LABEL_70;
    case 14:
      uint64_t v1 = 14;
      goto LABEL_70;
    case 15:
      uint64_t v1 = 15;
      goto LABEL_70;
    case 16:
      uint64_t v1 = 16;
      goto LABEL_70;
    case 17:
      uint64_t v1 = 17;
      goto LABEL_70;
    case 18:
      uint64_t v1 = 18;
      goto LABEL_70;
    case 19:
      uint64_t v1 = 19;
      goto LABEL_70;
    case 20:
      uint64_t v1 = 20;
      goto LABEL_70;
    case 21:
      uint64_t v1 = 21;
      goto LABEL_70;
    case 22:
      uint64_t v1 = 22;
      goto LABEL_70;
    case 23:
      uint64_t v1 = 23;
      goto LABEL_70;
    case 24:
      uint64_t v1 = 24;
      goto LABEL_70;
    case 25:
      uint64_t v1 = 25;
      goto LABEL_70;
    case 26:
      uint64_t v1 = 26;
      goto LABEL_70;
    case 27:
      uint64_t v1 = 27;
      goto LABEL_70;
    case 28:
      uint64_t v1 = 28;
      goto LABEL_70;
    case 29:
      uint64_t v1 = 29;
      goto LABEL_70;
    case 30:
      uint64_t v1 = 30;
      goto LABEL_70;
    case 31:
      uint64_t v1 = 31;
      goto LABEL_70;
    case 32:
      uint64_t v1 = 32;
      goto LABEL_70;
    case 33:
      uint64_t v1 = 33;
      goto LABEL_70;
    case 34:
      uint64_t v1 = 34;
      goto LABEL_70;
    case 35:
      uint64_t v1 = 35;
      goto LABEL_70;
    case 36:
      uint64_t v1 = 36;
      goto LABEL_70;
    case 37:
      uint64_t v1 = 37;
      goto LABEL_70;
    case 38:
      uint64_t v1 = 38;
      goto LABEL_70;
    case 39:
      uint64_t v1 = 39;
      goto LABEL_70;
    case 40:
      uint64_t v1 = 40;
      goto LABEL_70;
    case 41:
      uint64_t v1 = 41;
      goto LABEL_70;
    case 42:
      uint64_t v1 = 42;
      goto LABEL_70;
    case 43:
      uint64_t v1 = 43;
      goto LABEL_70;
    case 44:
      uint64_t v1 = 44;
      goto LABEL_70;
    case 45:
      uint64_t v1 = 45;
      goto LABEL_70;
    case 46:
      uint64_t v1 = 46;
      goto LABEL_70;
    case 47:
      uint64_t v1 = 47;
      goto LABEL_70;
    case 48:
      uint64_t v1 = 48;
      goto LABEL_70;
    case 49:
      uint64_t v1 = 49;
      goto LABEL_70;
    case 50:
      uint64_t v1 = 50;
      goto LABEL_70;
    case 51:
      uint64_t v1 = 51;
      goto LABEL_70;
    case 52:
      uint64_t v1 = 52;
      goto LABEL_70;
    case 53:
      uint64_t v1 = 53;
      goto LABEL_70;
    case 54:
      uint64_t v1 = 54;
      goto LABEL_70;
    case 55:
      uint64_t v1 = 55;
      goto LABEL_70;
    case 56:
      uint64_t v1 = 56;
      goto LABEL_70;
    case 57:
      uint64_t v1 = 57;
      goto LABEL_70;
    case 58:
      uint64_t v1 = 58;
      goto LABEL_70;
    case 59:
      uint64_t v1 = 59;
      goto LABEL_70;
    case 60:
      uint64_t v1 = 60;
      goto LABEL_70;
    case 61:
      uint64_t v1 = 61;
      goto LABEL_70;
    case 62:
      uint64_t v1 = 62;
      goto LABEL_70;
    case 63:
      uint64_t v1 = 63;
      goto LABEL_70;
    case 64:
      uint64_t v1 = 64;
      goto LABEL_70;
    case 65:
      uint64_t v1 = 65;
LABEL_70:
      uint64_t result = v1;
      break;
    case 66:
      return result;
    case 67:
      uint64_t result = 67;
      break;
    case 68:
      uint64_t result = 68;
      break;
    case 69:
      uint64_t result = 69;
      break;
    case 70:
      uint64_t result = 70;
      break;
    case 71:
      uint64_t result = 71;
      break;
    case 72:
      uint64_t result = 72;
      break;
    case 73:
      uint64_t result = 73;
      break;
    case 74:
      uint64_t result = 74;
      break;
    case 75:
      uint64_t result = 75;
      break;
    case 76:
      uint64_t result = 76;
      break;
    case 77:
      uint64_t result = 77;
      break;
    case 78:
      uint64_t result = 78;
      break;
    case 79:
      uint64_t result = 79;
      break;
    case 80:
      uint64_t result = 80;
      break;
    case 81:
      uint64_t result = 81;
      break;
    case 82:
      uint64_t result = 82;
      break;
    case 83:
      uint64_t result = 83;
      break;
    case 84:
      uint64_t result = 84;
      break;
    case 85:
      uint64_t result = 85;
      break;
    case 86:
      uint64_t result = 86;
      break;
    case 87:
      uint64_t result = 87;
      break;
    case 88:
      uint64_t result = 88;
      break;
    case 89:
      uint64_t result = 89;
      break;
    case 90:
      uint64_t result = 90;
      break;
    case 91:
      uint64_t result = 91;
      break;
    case 92:
      uint64_t result = 92;
      break;
    case 93:
      uint64_t result = 93;
      break;
    case 94:
      uint64_t result = 94;
      break;
    case 95:
      uint64_t result = 95;
      break;
    case 96:
      uint64_t result = 96;
      break;
    case 97:
      uint64_t result = 97;
      break;
    case 98:
      uint64_t result = 98;
      break;
    case 99:
      uint64_t result = 99;
      break;
    case 100:
      uint64_t result = 100;
      break;
    case 101:
      uint64_t result = 101;
      break;
    case 102:
      uint64_t result = 102;
      break;
    case 103:
      uint64_t result = 103;
      break;
    case 104:
      uint64_t result = 104;
      break;
    case 105:
      uint64_t result = 105;
      break;
    case 106:
      uint64_t result = 106;
      break;
    case 107:
      uint64_t result = 107;
      break;
    case 108:
      uint64_t result = 108;
      break;
    case 109:
      uint64_t result = 109;
      break;
    case 110:
      uint64_t result = 110;
      break;
    case 111:
      uint64_t result = 111;
      break;
    case 112:
      uint64_t result = 112;
      break;
    case 113:
      uint64_t result = 113;
      break;
    case 114:
      uint64_t result = 114;
      break;
    case 115:
      uint64_t result = 115;
      break;
    case 116:
      uint64_t result = 116;
      break;
    case 117:
      uint64_t result = 117;
      break;
    case 118:
      uint64_t result = 118;
      break;
    case 119:
      uint64_t result = 119;
      break;
    case 120:
      uint64_t result = 120;
      break;
    case 121:
      uint64_t result = 121;
      break;
    case 122:
      uint64_t result = 122;
      break;
    case 123:
      uint64_t result = 123;
      break;
    case 124:
      uint64_t result = 124;
      break;
    case 125:
      uint64_t result = 125;
      break;
    case 126:
      uint64_t result = 126;
      break;
    case 127:
      uint64_t result = 127;
      break;
    default:
      if ((unint64_t)(v0 - 128) >= 0x2E) {
        uint64_t result = 174;
      }
      else {
        uint64_t result = v0 | 0xFFFFFF80;
      }
      break;
  }
  return result;
}

uint64_t _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO6FormatO8rawValueAESgSS_tcfC_0(uint64_t a1, void *a2)
{
  v6._uint64_t countAndFlagsBits = a1;
  v3._rawValue = &off_100039EE0;
  v6._object = a2;
  unint64_t v4 = sub_10002A318(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 0xB) {
    return 11;
  }
  else {
    return v4;
  }
}

uint64_t _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO4UnitO8rawValueAESgSS_tcfC_0(uint64_t a1, void *a2)
{
  v6._uint64_t countAndFlagsBits = a1;
  v3._rawValue = &off_10003A008;
  v6._object = a2;
  unint64_t v4 = sub_10002A318(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 6) {
    return 6;
  }
  else {
    return v4;
  }
}

uint64_t sub_10000CC5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = a1;
  uint64_t v6 = a2 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(a2 + 64);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v12 = 0;
  if (!v9) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v13 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  for (unint64_t i = v13 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v12 << 6))
  {
    unint64_t v18 = (uint64_t *)(*(void *)(a2 + 48) + 16 * i);
    uint64_t v19 = v18[1];
    v20[0] = *v18;
    v20[1] = v19;
    swift_bridgeObjectRetain();
    sub_100008768((unint64_t)&v21, v20, a3);
    if (v3)
    {
      swift_release();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    uint64_t result = swift_bridgeObjectRelease();
    if (v9) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v12++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v12 >= v10) {
      goto LABEL_26;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v12);
    if (!v16) {
      break;
    }
LABEL_17:
    unint64_t v9 = (v16 - 1) & v16;
  }
  int64_t v17 = v12 + 1;
  if (v12 + 1 >= v10) {
    goto LABEL_26;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16) {
    goto LABEL_16;
  }
  int64_t v17 = v12 + 2;
  if (v12 + 2 >= v10) {
    goto LABEL_26;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16) {
    goto LABEL_16;
  }
  int64_t v17 = v12 + 3;
  if (v12 + 3 >= v10) {
    goto LABEL_26;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16) {
    goto LABEL_16;
  }
  int64_t v17 = v12 + 4;
  if (v12 + 4 >= v10)
  {
LABEL_26:
    swift_release();
    return v21;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
LABEL_16:
    int64_t v12 = v17;
    goto LABEL_17;
  }
  while (1)
  {
    int64_t v12 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v12 >= v10) {
      goto LABEL_26;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v12);
    ++v17;
    if (v16) {
      goto LABEL_17;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_10000CE1C(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  float v2 = 0.0;
  float v3 = 1.0;
  if (!*(void *)(a1 + 16)) {
    goto LABEL_28;
  }
  sub_10000A7EC(0x74694264696C6156, 0xE900000000000073);
  if (v4)
  {
    swift_unknownObjectRetain();
    sub_10000D9EC(&qword_100041B10);
    if (swift_dynamicCast()) {
      goto LABEL_8;
    }
  }
  if (!*(void *)(a1 + 16)) {
    goto LABEL_28;
  }
  sub_10000A7EC(0x6C615664696C6156, 0xEB00000000736575);
  if ((v5 & 1) == 0 || (swift_unknownObjectRetain(), sub_10000D9EC(&qword_100041B10), (swift_dynamicCast() & 1) == 0))
  {
    if (*(void *)(a1 + 16))
    {
      sub_10000A7EC(0x566D756D696E694DLL, 0xEC00000065756C61);
      if (v7)
      {
        swift_unknownObjectRetain();
        if (swift_dynamicCast()) {
          float v2 = *(float *)&v13;
        }
      }
      if (*(void *)(a1 + 16))
      {
        sub_10000A7EC(0x566D756D6978614DLL, 0xEC00000065756C61);
        if (v8)
        {
          swift_unknownObjectRetain();
          if (swift_dynamicCast()) {
            float v3 = *(float *)&v13;
          }
        }
        if (*(void *)(a1 + 16))
        {
          sub_10000A7EC(0x756C615670657473, 0xE900000000000065);
          if (v9)
          {
            swift_unknownObjectRetain();
            swift_bridgeObjectRelease();
            if (swift_dynamicCast())
            {
              if (v3 >= v2) {
                float v10 = v2;
              }
              else {
                float v10 = v3;
              }
              if (v2 > v3) {
                float v11 = v2;
              }
              else {
                float v11 = v3;
              }
              return LODWORD(v10) | ((unint64_t)LODWORD(v11) << 32);
            }
LABEL_29:
            if (v2 > v3) {
              float v11 = v2;
            }
            else {
              float v11 = v3;
            }
            if (v3 >= v2) {
              float v10 = v2;
            }
            else {
              float v10 = v3;
            }
            return LODWORD(v10) | ((unint64_t)LODWORD(v11) << 32);
          }
        }
      }
    }
LABEL_28:
    swift_bridgeObjectRelease();
    goto LABEL_29;
  }
LABEL_8:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_10000CC5C((uint64_t)&_swiftEmptyDictionarySingleton, v13, v13);
  swift_bridgeObjectRelease_n();
  return v6;
}

uint64_t sub_10000D148(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = 0;
  float v3 = (uint64_t *)(a1 + 40);
  do
  {
    uint64_t v4 = *(v3 - 1);
    uint64_t v5 = *v3;
    BOOL v6 = v4 == 0x5264657275636573 && v5 == 0xEB00000000646165;
    if (v6 || (sub_10002A4D8() & 1) != 0)
    {
      v2 |= 1uLL;
    }
    else
    {
      BOOL v7 = v4 == 0x5764657275636573 && v5 == 0xEC00000065746972;
      if (v7 || (sub_10002A4D8()) && (v2 & 2) == 0) {
        v2 |= 2uLL;
      }
    }
    v3 += 2;
    --v1;
  }
  while (v1);
  return v2;
}

uint64_t sub_10000D270(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = 0;
  float v3 = (uint64_t *)(a1 + 40);
  do
  {
    uint64_t v4 = *(v3 - 1);
    uint64_t v5 = *v3;
    BOOL v6 = v4 == 1684104562 && v5 == 0xE400000000000000;
    if (v6 || (sub_10002A4D8() & 1) != 0)
    {
      v2 |= 1uLL;
    }
    else
    {
      BOOL v7 = v4 == 0x6574697277 && v5 == 0xE500000000000000;
      if (v7 || (sub_10002A4D8() & 1) != 0)
      {
        v2 |= 2uLL;
      }
      else if (v4 == 0x796669746F6E63 && v5 == 0xE700000000000000 || (sub_10002A4D8() & 1) != 0)
      {
        v2 |= 4uLL;
      }
      else if (v4 == 0x6669746F6E636E75 && v5 == 0xE900000000000079 || (sub_10002A4D8()) {
             && (v2 & 8) == 0)
      }
      {
        v2 |= 8uLL;
      }
    }
    v3 += 2;
    --v1;
  }
  while (v1);
  return v2;
}

uint64_t sub_10000D410(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 72 * a1 + 32;
    unint64_t v6 = a3 + 72 * v4;
    if (v5 >= v6 || v5 + 72 * v4 <= a3)
    {
      sub_10000D9EC(&qword_100041AF0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_10002A308();
  __break(1u);
  return result;
}

uint64_t sub_10000D520(uint64_t a1, char a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v4)
  {
    unint64_t v5 = (uint64_t *)(a1 + 48);
    do
    {
      unint64_t v9 = *((unsigned int *)v5 + 8) | ((unint64_t)*((unsigned __int8 *)v5 + 36) << 32);
      char v36 = *((unsigned char *)v5 + 16);
      char v37 = *((unsigned char *)v5 + 17);
      char v35 = *((unsigned char *)v5 - 8);
      uint64_t v10 = *((unsigned __int8 *)v5 - 16);
      uint64_t v12 = v5[5];
      uint64_t v11 = v5[6];
      uint64_t v13 = v5[3];
      uint64_t v14 = v5[1];
      uint64_t v34 = *v5;
      swift_bridgeObjectRetain();
      sub_10000D8D8(v13, v9);
      if (!v14) {
        break;
      }
      uint64_t v32 = v12;
      uint64_t v33 = v11;
      uint64_t v31 = v4;
      uint64_t v15 = (void *)*a3;
      unint64_t v17 = sub_10000A764(v10);
      uint64_t v18 = v15[2];
      BOOL v19 = (v16 & 1) == 0;
      uint64_t v20 = v18 + v19;
      if (__OFADD__(v18, v19))
      {
        __break(1u);
LABEL_17:
        __break(1u);
LABEL_18:
        uint64_t result = sub_10002A528();
        __break(1u);
        return result;
      }
      char v21 = v16;
      if (v15[3] >= v20)
      {
        if ((a2 & 1) == 0) {
          sub_10000AB94();
        }
      }
      else
      {
        sub_10000AF38(v20, a2 & 1);
        unint64_t v22 = sub_10000A764(v10);
        if ((v21 & 1) != (v23 & 1)) {
          goto LABEL_18;
        }
        unint64_t v17 = v22;
      }
      unsigned __int8 v24 = (void *)*a3;
      if (v21)
      {
        unint64_t v6 = v24[7] + (v17 << 6);
        uint64_t v7 = *(void *)(v6 + 32);
        unint64_t v8 = *(unsigned int *)(v6 + 40) | ((unint64_t)*(unsigned __int8 *)(v6 + 44) << 32);
        swift_bridgeObjectRelease();
        sub_1000138E8(v7, v8);
        *(unsigned char *)unint64_t v6 = v35;
        *(void *)(v6 + 8) = v34;
        *(void *)(v6 + 16) = v14;
        *(unsigned char *)(v6 + 24) = v36;
        *(unsigned char *)(v6 + 25) = v37;
        *(void *)(v6 + 32) = v13;
        *(unsigned char *)(v6 + 44) = BYTE4(v9);
        *(_DWORD *)(v6 + 40) = v9;
        *(void *)(v6 + 48) = v32;
        *(void *)(v6 + 56) = v33;
      }
      else
      {
        v24[(v17 >> 6) + 8] |= 1 << v17;
        *(unsigned char *)(v24[6] + v17) = v10;
        unint64_t v25 = v24[7] + (v17 << 6);
        *(unsigned char *)unint64_t v25 = v35;
        *(void *)(v25 + 8) = v34;
        *(void *)(v25 + 16) = v14;
        *(unsigned char *)(v25 + 24) = v36;
        *(unsigned char *)(v25 + 25) = v37;
        *(void *)(v25 + 32) = v13;
        *(unsigned char *)(v25 + 44) = BYTE4(v9);
        *(_DWORD *)(v25 + 40) = v9;
        *(void *)(v25 + 48) = v32;
        *(void *)(v25 + 56) = v33;
        uint64_t v26 = v24[2];
        BOOL v27 = __OFADD__(v26, 1);
        uint64_t v28 = v26 + 1;
        if (v27) {
          goto LABEL_17;
        }
        v24[2] = v28;
      }
      v5 += 9;
      a2 = 1;
      uint64_t v4 = v31 - 1;
    }
    while (v31 != 1);
  }
  return swift_bridgeObjectRelease();
}

uint64_t _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO1loiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  if (qword_100041610 != -1) {
    swift_once();
  }
  uint64_t v4 = off_100041678;
  if (!*((void *)off_100041678 + 2))
  {
    unint64_t v8 = 0xE700000000000000;
    uint64_t v9 = 0x6E776F6E6B6E75;
    goto LABEL_12;
  }
  unint64_t v5 = sub_10000A764(a1);
  if (v6)
  {
    unint64_t v7 = v4[7] + (v5 << 6);
    uint64_t v9 = *(void *)(v7 + 8);
    unint64_t v8 = *(void *)(v7 + 16);
    swift_bridgeObjectRetain();
    if (!v4[2]) {
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t v8 = 0xE700000000000000;
    uint64_t v9 = 0x6E776F6E6B6E75;
    if (!v4[2]) {
      goto LABEL_12;
    }
  }
  unint64_t v10 = sub_10000A764(a2);
  if (v11)
  {
    unint64_t v12 = v4[7] + (v10 << 6);
    uint64_t v13 = *(void *)(v12 + 8);
    unint64_t v14 = *(void *)(v12 + 16);
    swift_bridgeObjectRetain();
    if (v9 != v13) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
LABEL_12:
  unint64_t v14 = 0xE700000000000000;
  if (v9 != 0x6E776F6E6B6E75)
  {
LABEL_15:
    char v15 = sub_10002A4D8();
    goto LABEL_16;
  }
LABEL_13:
  if (v8 != v14) {
    goto LABEL_15;
  }
  char v15 = 0;
LABEL_16:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v15 & 1;
}

uint64_t sub_10000D8D8(uint64_t result, uint64_t a2)
{
  if (BYTE4(a2) != 255) {
    return sub_10000D8EC(result, a2, BYTE4(a2));
  }
  return result;
}

uint64_t sub_10000D8EC(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_10000D900(uint64_t result, unint64_t a2, char a3)
{
  if (a3 == 10 || a3 == 9) {
    return sub_10000D92C(result, a2);
  }
  if (a3 == 8) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_10000D92C(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000D984(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000D9EC(&qword_100041680);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000D9EC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000DA30(uint64_t a1)
{
  uint64_t v2 = sub_10000D9EC(&qword_100041680);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_10000DA90(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000DAA0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000DAFC(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000DB54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_100029C88();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_100029CA8();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_100029C98();
  sub_10000B574(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO5ValueO21__derived_enum_equalsySbAE_AEtFZ_0(uint64_t a1, unint64_t a2, char a3, uint64_t a4, unint64_t a5, char a6)
{
  switch(a3)
  {
    case 1:
      if (a6 != 1) {
        goto LABEL_64;
      }
      char v10 = a1 == a4;
      return v10 & 1;
    case 2:
      if (a6 != 2) {
        goto LABEL_64;
      }
      char v10 = (unsigned __int16)a1 == (unsigned __int16)a4;
      return v10 & 1;
    case 3:
      if (a6 != 3) {
        goto LABEL_64;
      }
      goto LABEL_15;
    case 4:
      if (a6 != 4) {
        goto LABEL_64;
      }
      char v10 = a1 == a4;
      return v10 & 1;
    case 5:
      if (a6 != 5) {
        goto LABEL_64;
      }
      goto LABEL_15;
    case 6:
      if (a6 != 6) {
        goto LABEL_64;
      }
LABEL_15:
      char v10 = a1 == a4;
      return v10 & 1;
    case 7:
      if (a6 != 7) {
        goto LABEL_64;
      }
      char v10 = *(double *)&a1 == *(double *)&a4;
      return v10 & 1;
    case 8:
      if (a6 != 8) {
        goto LABEL_64;
      }
      if (a1 == a4 && a2 == a5)
      {
LABEL_32:
        char v10 = 1;
        return v10 & 1;
      }
      else
      {
        return sub_10002A4D8();
      }
    case 9:
      if (a6 == 9)
      {
        uint64_t v12 = 0;
        switch(a2 >> 62)
        {
          case 1uLL:
            if (__OFSUB__(HIDWORD(a1), a1))
            {
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
              JUMPOUT(0x10000E02CLL);
            }
            uint64_t v12 = HIDWORD(a1) - (int)a1;
LABEL_36:
            sub_10000D92C(a1, a2);
LABEL_37:
            switch(a5 >> 62)
            {
              case 1uLL:
                LODWORD(v16) = HIDWORD(a4) - a4;
                if (__OFSUB__(HIDWORD(a4), a4)) {
                  goto LABEL_73;
                }
                uint64_t v16 = (int)v16;
LABEL_48:
                if (v12 != v16)
                {
LABEL_53:
                  uint64_t v24 = a1;
                  unint64_t v25 = a2;
                  char v26 = 9;
                  goto LABEL_63;
                }
                if (v12 < 1)
                {
LABEL_66:
                  uint64_t v30 = a1;
                  unint64_t v31 = a2;
                  char v32 = 9;
                  goto LABEL_68;
                }
                sub_10000D92C(a4, a5);
                char v23 = sub_10000B7E8(a1, a2, a4, a5);
                sub_10000E204(a1, a2, 9);
                if (v23) {
                  goto LABEL_32;
                }
                break;
              case 2uLL:
                uint64_t v21 = *(void *)(a4 + 16);
                uint64_t v20 = *(void *)(a4 + 24);
                BOOL v22 = __OFSUB__(v20, v21);
                uint64_t v16 = v20 - v21;
                if (!v22) {
                  goto LABEL_48;
                }
                goto LABEL_74;
              case 3uLL:
                if (v12) {
                  goto LABEL_53;
                }
                goto LABEL_66;
              default:
                uint64_t v16 = BYTE6(a5);
                goto LABEL_48;
            }
            break;
          case 2uLL:
            uint64_t v15 = *(void *)(a1 + 16);
            uint64_t v14 = *(void *)(a1 + 24);
            uint64_t v12 = v14 - v15;
            if (!__OFSUB__(v14, v15)) {
              goto LABEL_36;
            }
            goto LABEL_70;
          case 3uLL:
            goto LABEL_37;
          default:
            uint64_t v12 = BYTE6(a2);
            goto LABEL_37;
        }
      }
      goto LABEL_64;
    case 10:
      if (a6 == 10)
      {
        uint64_t v13 = 0;
        switch(a2 >> 62)
        {
          case 1uLL:
            if (__OFSUB__(HIDWORD(a1), a1)) {
              goto LABEL_71;
            }
            uint64_t v13 = HIDWORD(a1) - (int)a1;
LABEL_42:
            sub_10000D92C(a1, a2);
LABEL_43:
            switch(a5 >> 62)
            {
              case 1uLL:
                LODWORD(v19) = HIDWORD(a4) - a4;
                if (__OFSUB__(HIDWORD(a4), a4)) {
                  goto LABEL_75;
                }
                uint64_t v19 = (int)v19;
LABEL_57:
                if (v13 != v19)
                {
LABEL_62:
                  uint64_t v24 = a1;
                  unint64_t v25 = a2;
                  char v26 = 10;
LABEL_63:
                  sub_10000E204(v24, v25, v26);
                  goto LABEL_64;
                }
                if (v13 < 1)
                {
LABEL_67:
                  uint64_t v30 = a1;
                  unint64_t v31 = a2;
                  char v32 = 10;
LABEL_68:
                  sub_10000E204(v30, v31, v32);
                  char v10 = 1;
                  return v10 & 1;
                }
                sub_10000D92C(a4, a5);
                char v29 = sub_10000B7E8(a1, a2, a4, a5);
                sub_10000E204(a1, a2, 10);
                if (v29) {
                  goto LABEL_32;
                }
                break;
              case 2uLL:
                uint64_t v28 = *(void *)(a4 + 16);
                uint64_t v27 = *(void *)(a4 + 24);
                BOOL v22 = __OFSUB__(v27, v28);
                uint64_t v19 = v27 - v28;
                if (!v22) {
                  goto LABEL_57;
                }
                goto LABEL_76;
              case 3uLL:
                if (v13) {
                  goto LABEL_62;
                }
                goto LABEL_67;
              default:
                uint64_t v19 = BYTE6(a5);
                goto LABEL_57;
            }
            break;
          case 2uLL:
            uint64_t v18 = *(void *)(a1 + 16);
            uint64_t v17 = *(void *)(a1 + 24);
            uint64_t v13 = v17 - v18;
            if (!__OFSUB__(v17, v18)) {
              goto LABEL_42;
            }
            goto LABEL_72;
          case 3uLL:
            goto LABEL_43;
          default:
            uint64_t v13 = BYTE6(a2);
            goto LABEL_43;
        }
      }
      goto LABEL_64;
    case 11:
      if (a6 == 11 && !(a5 | a4)) {
        goto LABEL_32;
      }
      goto LABEL_64;
    default:
      if (a6) {
LABEL_64:
      }
        char v10 = 0;
      else {
        char v10 = ((a1 & 1) == 0) ^ a4;
      }
      return v10 & 1;
  }
}

uint64_t sub_10000E09C(char a1, char a2)
{
  if (a1 == 2) {
    return 0;
  }
  uint64_t v3 = a1 & 1;
  uint64_t result = 0;
  switch(a2)
  {
    case 1:
      uint64_t result = v3;
      break;
    case 2:
      uint64_t result = v3;
      break;
    case 3:
      uint64_t result = v3;
      break;
    case 4:
      uint64_t result = v3;
      break;
    case 5:
    case 6:
      uint64_t result = v3;
      break;
    case 7:
      if (v3) {
        uint64_t result = 0x3FF0000000000000;
      }
      else {
        uint64_t result = 0;
      }
      break;
    case 8:
      if (v3) {
        v4._uint64_t countAndFlagsBits = 1702195828;
      }
      else {
        v4._uint64_t countAndFlagsBits = 0x65736C6166;
      }
      if (v3) {
        uint64_t v5 = (void *)0xE400000000000000;
      }
      else {
        uint64_t v5 = (void *)0xE500000000000000;
      }
      v4._object = v5;
      sub_100029F48(v4);
      swift_bridgeObjectRelease();
      uint64_t result = 0;
      break;
    case 9:
    case 10:
      return result;
    default:
      uint64_t result = v3;
      break;
  }
  return result;
}

uint64_t sub_10000E204(uint64_t result, unint64_t a2, char a3)
{
  if (a3 == 10 || a3 == 9) {
    return sub_10000DAFC(result, a2);
  }
  if (a3 == 8) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *sub_10000E230(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_10000E274()
{
  unint64_t result = qword_1000416F0;
  if (!qword_1000416F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000416F0);
  }
  return result;
}

unint64_t sub_10000E2C8()
{
  unint64_t result = qword_1000416F8;
  if (!qword_1000416F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000416F8);
  }
  return result;
}

unint64_t sub_10000E31C()
{
  unint64_t result = qword_100041700;
  if (!qword_100041700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041700);
  }
  return result;
}

unint64_t sub_10000E370()
{
  unint64_t result = qword_100041708;
  if (!qword_100041708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041708);
  }
  return result;
}

unint64_t sub_10000E3C4()
{
  unint64_t result = qword_100041710;
  if (!qword_100041710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041710);
  }
  return result;
}

unint64_t sub_10000E418()
{
  unint64_t result = qword_100041718;
  if (!qword_100041718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041718);
  }
  return result;
}

unint64_t sub_10000E46C()
{
  unint64_t result = qword_100041720;
  if (!qword_100041720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041720);
  }
  return result;
}

unint64_t sub_10000E4C0()
{
  unint64_t result = qword_100041728;
  if (!qword_100041728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041728);
  }
  return result;
}

unint64_t sub_10000E514()
{
  unint64_t result = qword_100041730;
  if (!qword_100041730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041730);
  }
  return result;
}

unint64_t sub_10000E568()
{
  unint64_t result = qword_100041738;
  if (!qword_100041738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041738);
  }
  return result;
}

unint64_t sub_10000E5BC()
{
  unint64_t result = qword_100041740;
  if (!qword_100041740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041740);
  }
  return result;
}

unint64_t sub_10000E610()
{
  unint64_t result = qword_100041748;
  if (!qword_100041748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041748);
  }
  return result;
}

unint64_t sub_10000E664()
{
  unint64_t result = qword_100041750;
  if (!qword_100041750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041750);
  }
  return result;
}

unint64_t sub_10000E6B8()
{
  unint64_t result = qword_100041758;
  if (!qword_100041758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041758);
  }
  return result;
}

uint64_t sub_10000E70C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1819047278 && a2 == 0xE400000000000000;
  if (v2 || (sub_10002A4D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1819242338 && a2 == 0xE400000000000000 || (sub_10002A4D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x38746E6975 && a2 == 0xE500000000000000 || (sub_10002A4D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x3631746E6975 && a2 == 0xE600000000000000 || (sub_10002A4D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x3233746E6975 && a2 == 0xE600000000000000 || (sub_10002A4D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x3436746E6975 && a2 == 0xE600000000000000 || (sub_10002A4D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 7630441 && a2 == 0xE300000000000000 || (sub_10002A4D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x3233746E69 && a2 == 0xE500000000000000 || (sub_10002A4D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x74616F6C66 && a2 == 0xE500000000000000 || (sub_10002A4D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x676E69727473 && a2 == 0xE600000000000000 || (sub_10002A4D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 947285108 && a2 == 0xE400000000000000 || (sub_10002A4D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 1635017060 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else
  {
    char v6 = sub_10002A4D8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 11;
    }
    else {
      return 12;
    }
  }
}

uint64_t sub_10000EB60(void *a1)
{
  uint64_t v122 = sub_10000D9EC(&qword_100041A68);
  uint64_t v125 = *(void *)(v122 - 8);
  __chkstk_darwin(v122, v2);
  v130 = (char *)&v99 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000D9EC(&qword_100041A70);
  uint64_t v123 = *(void *)(v4 - 8);
  uint64_t v124 = v4;
  __chkstk_darwin(v4, v5);
  v129 = (char *)&v99 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000D9EC(&qword_100041A78);
  uint64_t v120 = *(void *)(v7 - 8);
  uint64_t v121 = v7;
  __chkstk_darwin(v7, v8);
  v135 = (char *)&v99 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = sub_10000D9EC(&qword_100041A80);
  uint64_t v118 = *(void *)(v119 - 8);
  __chkstk_darwin(v119, v10);
  v134 = (char *)&v99 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v117 = sub_10000D9EC(&qword_100041A88);
  uint64_t v116 = *(void *)(v117 - 8);
  __chkstk_darwin(v117, v12);
  v128 = (char *)&v99 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = sub_10000D9EC(&qword_100041A90);
  uint64_t v115 = *(void *)(v114 - 8);
  __chkstk_darwin(v114, v14);
  v133 = (char *)&v99 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v112 = sub_10000D9EC(&qword_100041A98);
  uint64_t v113 = *(void *)(v112 - 8);
  __chkstk_darwin(v112, v16);
  v132 = (char *)&v99 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v111 = sub_10000D9EC(&qword_100041AA0);
  uint64_t v110 = *(void *)(v111 - 8);
  __chkstk_darwin(v111, v18);
  v131 = (char *)&v99 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = sub_10000D9EC(&qword_100041AA8);
  uint64_t v108 = *(void *)(v109 - 8);
  __chkstk_darwin(v109, v20);
  v127 = (char *)&v99 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = sub_10000D9EC(&qword_100041AB0);
  uint64_t v106 = *(void *)(v107 - 8);
  __chkstk_darwin(v107, v22);
  v126 = (char *)&v99 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = sub_10000D9EC(&qword_100041AB8);
  uint64_t v104 = *(void *)(v105 - 8);
  __chkstk_darwin(v105, v24);
  char v26 = (char *)&v99 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_10000D9EC(&qword_100041AC0);
  uint64_t v103 = *(void *)(v27 - 8);
  __chkstk_darwin(v27, v28);
  uint64_t v30 = (char *)&v99 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_10000D9EC(&qword_100041AC8);
  uint64_t v32 = *(void *)(v31 - 8);
  __chkstk_darwin(v31, v33);
  char v35 = (char *)&v99 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = a1[3];
  v136 = a1;
  uint64_t v37 = (uint64_t)sub_10000E230(a1, v36);
  sub_10000E274();
  uint64_t v38 = v137;
  sub_10002A5B8();
  if (!v38)
  {
    v100 = v30;
    uint64_t v99 = v27;
    uint64_t v101 = v26;
    char v40 = v131;
    long long v39 = v132;
    char v41 = v133;
    uint64_t v42 = v134;
    uint64_t v43 = v135;
    uint64_t v102 = 0;
    uint64_t v137 = v32;
    uint64_t v44 = sub_10002A3E8();
    if (*(void *)(v44 + 16) == 1)
    {
      switch(*(unsigned char *)(v44 + 32))
      {
        case 1:
          LOBYTE(v138) = 1;
          sub_10000E664();
          v50 = v101;
          uint64_t v37 = (uint64_t)v35;
          uint64_t v51 = v102;
          sub_10002A328();
          if (v51) {
            goto LABEL_28;
          }
          uint64_t v52 = v105;
          char v53 = sub_10002A358();
          (*(void (**)(char *, uint64_t))(v104 + 8))(v50, v52);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v137 + 8))(v35, v31);
          uint64_t v37 = v53 & 1;
          sub_100013784((uint64_t)v136);
          return v37;
        case 2:
          LOBYTE(v138) = 2;
          sub_10000E610();
          v54 = v126;
          uint64_t v37 = (uint64_t)v35;
          uint64_t v55 = v102;
          sub_10002A328();
          if (v55) {
            goto LABEL_28;
          }
          uint64_t v56 = v107;
          char v57 = sub_10002A3A8();
          uint64_t v58 = v137;
          LOBYTE(v37) = v57;
          (*(void (**)(char *, uint64_t))(v106 + 8))(v54, v56);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v58 + 8))(v35, v31);
          uint64_t v37 = v37;
          break;
        case 3:
          LOBYTE(v138) = 3;
          sub_10000E5BC();
          unint64_t v59 = v127;
          uint64_t v37 = (uint64_t)v35;
          uint64_t v60 = v102;
          sub_10002A328();
          if (v60) {
            goto LABEL_28;
          }
          uint64_t v61 = v109;
          __int16 v62 = sub_10002A3B8();
          uint64_t v63 = v137;
          LOWORD(v37) = v62;
          (*(void (**)(char *, uint64_t))(v108 + 8))(v59, v61);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v63 + 8))(v35, v31);
          uint64_t v37 = (unsigned __int16)v37;
          break;
        case 4:
          LOBYTE(v138) = 4;
          sub_10000E568();
          uint64_t v37 = (uint64_t)v35;
          uint64_t v64 = v102;
          sub_10002A328();
          if (v64) {
            goto LABEL_28;
          }
          uint64_t v65 = v111;
          int v66 = sub_10002A3C8();
          uint64_t v67 = v137;
          LODWORD(v37) = v66;
          (*(void (**)(char *, uint64_t))(v110 + 8))(v40, v65);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v67 + 8))(v35, v31);
          uint64_t v37 = v37;
          break;
        case 5:
          LOBYTE(v138) = 5;
          sub_10000E514();
          uint64_t v37 = (uint64_t)v35;
          uint64_t v68 = v102;
          sub_10002A328();
          if (v68) {
            goto LABEL_28;
          }
          uint64_t v69 = v112;
          uint64_t v70 = sub_10002A3D8();
          uint64_t v71 = v137;
          uint64_t v37 = v70;
          (*(void (**)(char *, uint64_t))(v113 + 8))(v39, v69);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v71 + 8))(v35, v31);
          break;
        case 6:
          LOBYTE(v138) = 6;
          sub_10000E4C0();
          uint64_t v72 = v41;
          uint64_t v37 = (uint64_t)v35;
          uint64_t v73 = v102;
          sub_10002A328();
          if (v73) {
            goto LABEL_28;
          }
          uint64_t v74 = v114;
          int v75 = sub_10002A398();
          uint64_t v76 = v137;
          LODWORD(v37) = v75;
          (*(void (**)(char *, uint64_t))(v115 + 8))(v72, v74);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v76 + 8))(v35, v31);
          uint64_t v37 = v37;
          break;
        case 7:
          LOBYTE(v138) = 7;
          sub_10000E46C();
          v77 = v128;
          uint64_t v37 = (uint64_t)v35;
          uint64_t v78 = v102;
          sub_10002A328();
          if (v78) {
            goto LABEL_28;
          }
          uint64_t v79 = v117;
          int v80 = sub_10002A398();
          uint64_t v81 = v137;
          LODWORD(v37) = v80;
          (*(void (**)(char *, uint64_t))(v116 + 8))(v77, v79);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v81 + 8))(v35, v31);
          uint64_t v37 = v37;
          break;
        case 8:
          LOBYTE(v138) = 8;
          sub_10000E418();
          uint64_t v82 = v42;
          uint64_t v37 = (uint64_t)v35;
          uint64_t v83 = v102;
          sub_10002A328();
          if (v83) {
            goto LABEL_28;
          }
          uint64_t v84 = v119;
          sub_10002A368();
          uint64_t v85 = v137;
          uint64_t v98 = v97;
          (*(void (**)(char *, uint64_t))(v118 + 8))(v82, v84);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v85 + 8))(v35, v31);
          uint64_t v37 = v98;
          break;
        case 9:
          LOBYTE(v138) = 9;
          sub_10000E3C4();
          uint64_t v37 = (uint64_t)v35;
          uint64_t v86 = v102;
          sub_10002A328();
          if (v86) {
            goto LABEL_28;
          }
          uint64_t v87 = v121;
          uint64_t v37 = sub_10002A348();
          (*(void (**)(char *, uint64_t))(v120 + 8))(v43, v87);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v137 + 8))(v35, v31);
          break;
        case 0xA:
          LOBYTE(v138) = 10;
          sub_10000E370();
          uint64_t v88 = v129;
          uint64_t v37 = (uint64_t)v35;
          uint64_t v89 = v102;
          sub_10002A328();
          if (v89) {
            goto LABEL_28;
          }
          sub_100013890();
          uint64_t v90 = v124;
          sub_10002A388();
          uint64_t v91 = v137;
          (*(void (**)(char *, uint64_t))(v123 + 8))(v88, v90);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v91 + 8))(v35, v31);
          uint64_t v37 = v138;
          break;
        case 0xB:
          LOBYTE(v138) = 11;
          sub_10000E2C8();
          uint64_t v92 = v130;
          uint64_t v37 = (uint64_t)v35;
          uint64_t v93 = v102;
          sub_10002A328();
          if (v93) {
            goto LABEL_28;
          }
          sub_100013890();
          uint64_t v94 = v122;
          sub_10002A388();
          uint64_t v95 = v137;
          (*(void (**)(char *, uint64_t))(v125 + 8))(v92, v94);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v95 + 8))(v35, v31);
          uint64_t v37 = v138;
          break;
        default:
          LOBYTE(v138) = 0;
          sub_10000E6B8();
          uint64_t v45 = v100;
          uint64_t v37 = (uint64_t)v35;
          uint64_t v46 = v102;
          sub_10002A328();
          if (v46)
          {
LABEL_28:
            swift_bridgeObjectRelease();
            (*(void (**)(char *, uint64_t))(v137 + 8))(v35, v31);
          }
          else
          {
            (*(void (**)(char *, uint64_t))(v103 + 8))(v45, v99);
            swift_bridgeObjectRelease();
            (*(void (**)(char *, uint64_t))(v137 + 8))(v35, v31);
            uint64_t v37 = 0;
          }
          break;
      }
    }
    else
    {
      uint64_t v47 = sub_10002A218();
      swift_allocError();
      uint64_t v49 = v48;
      sub_10000D9EC(&qword_100041A48);
      uint64_t v37 = (uint64_t)v35;
      *uint64_t v49 = &type metadata for CharacteristicKind.Value;
      sub_10002A338();
      sub_10002A208();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v47 - 8) + 104))(v49, enum case for DecodingError.typeMismatch(_:), v47);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v137 + 8))(v35, v31);
    }
  }
  sub_100013784((uint64_t)v136);
  return v37;
}

unint64_t sub_10000FDC8()
{
  unint64_t result = qword_100041768;
  if (!qword_100041768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041768);
  }
  return result;
}

uint64_t sub_10000FE1C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x566D756D696E696DLL && a2 == 0xEC00000065756C61;
  if (v2 || (sub_10002A4D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x566D756D6978616DLL && a2 == 0xEC00000065756C61 || (sub_10002A4D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x756C615670657473 && a2 == 0xE900000000000065)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_10002A4D8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

float sub_10000FFAC(void *a1)
{
  uint64_t v2 = sub_10000D9EC(&qword_100041A60);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  char v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000E230(a1, a1[3]);
  sub_10000FDC8();
  sub_10002A5B8();
  char v13 = 0;
  sub_10002A378();
  float v8 = v7;
  char v12 = 1;
  sub_10002A378();
  char v11 = 2;
  sub_10002A378();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  sub_100013784((uint64_t)a1);
  return v8;
}

unint64_t sub_100010184()
{
  unint64_t result = qword_100041790;
  if (!qword_100041790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041790);
  }
  return result;
}

unint64_t sub_1000101D8()
{
  unint64_t result = qword_100041798;
  if (!qword_100041798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041798);
  }
  return result;
}

unint64_t sub_10001022C()
{
  unint64_t result = qword_1000417A0;
  if (!qword_1000417A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000417A0);
  }
  return result;
}

unint64_t sub_100010280()
{
  unint64_t result = qword_1000417A8;
  if (!qword_1000417A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000417A8);
  }
  return result;
}

uint64_t sub_1000102D4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10001031C()
{
  unint64_t result = qword_1000417C0;
  if (!qword_1000417C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000417C0);
  }
  return result;
}

uint64_t sub_100010370(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6C615664696C6176 && a2 == 0xEB00000000736575;
  if (v2 || (sub_10002A4D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74694264696C6176 && a2 == 0xE900000000000073 || (sub_10002A4D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000010002D8B0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_10002A4D8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_1000104E8(void *a1)
{
  uint64_t v34 = sub_10000D9EC(&qword_100041A28);
  uint64_t v32 = *(void *)(v34 - 8);
  __chkstk_darwin(v34, v2);
  uint64_t v37 = (char *)v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_10000D9EC(&qword_100041A30);
  uint64_t v33 = *(void *)(v36 - 8);
  __chkstk_darwin(v36, v4);
  char v6 = (char *)v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000D9EC(&qword_100041A38);
  uint64_t v35 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v8);
  uint64_t v10 = (char *)v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000D9EC(&qword_100041A40);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11, v13);
  uint64_t v15 = (char *)v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = a1[3];
  uint64_t v38 = a1;
  sub_10000E230(a1, v16);
  sub_100010184();
  uint64_t v17 = v40;
  sub_10002A5B8();
  if (!v17)
  {
    uint64_t v31 = v7;
    uint64_t v18 = v37;
    uint64_t v40 = v12;
    uint64_t v19 = sub_10002A3E8();
    if (*(void *)(v19 + 16) == 1)
    {
      v30[1] = v19;
      if (*(unsigned char *)(v19 + 32))
      {
        if (*(unsigned char *)(v19 + 32) == 1)
        {
          LOBYTE(v39) = 1;
          sub_100010280();
          uint64_t v20 = v6;
          sub_10002A328();
          sub_10000D9EC(&qword_1000417B0);
          sub_100013828(&qword_100041A58);
          uint64_t v21 = v36;
          sub_10002A388();
          (*(void (**)(char *, uint64_t))(v33 + 8))(v20, v21);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v40 + 8))(v15, v11);
        }
        else
        {
          LOBYTE(v39) = 2;
          sub_1000101D8();
          char v26 = v18;
          sub_10002A328();
          sub_1000137D4();
          uint64_t v28 = v34;
          sub_10002A388();
          uint64_t v29 = v40;
          (*(void (**)(char *, uint64_t))(v32 + 8))(v26, v28);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v29 + 8))(v15, v11);
        }
        uint64_t v7 = v39;
      }
      else
      {
        LOBYTE(v39) = 0;
        sub_10001031C();
        uint64_t v24 = v10;
        sub_10002A328();
        sub_10000D9EC(&qword_1000417B0);
        sub_100013828(&qword_100041A58);
        uint64_t v25 = v31;
        sub_10002A388();
        (*(void (**)(char *, uint64_t))(v35 + 8))(v24, v25);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v40 + 8))(v15, v11);
        uint64_t v7 = v39;
      }
    }
    else
    {
      uint64_t v7 = sub_10002A218();
      swift_allocError();
      uint64_t v23 = v22;
      sub_10000D9EC(&qword_100041A48);
      *uint64_t v23 = &type metadata for CharacteristicKind.Constraints;
      sub_10002A338();
      sub_10002A208();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v7 - 8) + 104))(v23, enum case for DecodingError.typeMismatch(_:), v7);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v40 + 8))(v15, v11);
    }
  }
  sub_100013784((uint64_t)v38);
  return v7;
}

uint64_t sub_100010BDC()
{
  return sub_10001113C(&qword_1000417C8, &qword_1000417D0);
}

unint64_t sub_100010C08()
{
  unint64_t result = qword_1000417D8;
  if (!qword_1000417D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000417D8);
  }
  return result;
}

unint64_t sub_100010C60()
{
  unint64_t result = qword_1000417E0;
  if (!qword_1000417E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000417E0);
  }
  return result;
}

unint64_t sub_100010CB8()
{
  unint64_t result = qword_1000417E8;
  if (!qword_1000417E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000417E8);
  }
  return result;
}

unint64_t sub_100010D10()
{
  unint64_t result = qword_1000417F0;
  if (!qword_1000417F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000417F0);
  }
  return result;
}

unint64_t sub_100010D68()
{
  unint64_t result = qword_1000417F8;
  if (!qword_1000417F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000417F8);
  }
  return result;
}

unint64_t sub_100010DC0()
{
  unint64_t result = qword_100041800;
  if (!qword_100041800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041800);
  }
  return result;
}

unint64_t sub_100010E18()
{
  unint64_t result = qword_100041808;
  if (!qword_100041808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041808);
  }
  return result;
}

unint64_t sub_100010E70()
{
  unint64_t result = qword_100041810;
  if (!qword_100041810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041810);
  }
  return result;
}

unint64_t sub_100010EC8()
{
  unint64_t result = qword_100041818;
  if (!qword_100041818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041818);
  }
  return result;
}

unint64_t sub_100010F20()
{
  unint64_t result = qword_100041820;
  if (!qword_100041820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041820);
  }
  return result;
}

unint64_t sub_100010F78()
{
  unint64_t result = qword_100041828;
  if (!qword_100041828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041828);
  }
  return result;
}

void *sub_100010FCC()
{
  return &protocol witness table for Int;
}

unint64_t sub_100010FDC()
{
  unint64_t result = qword_100041830;
  if (!qword_100041830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041830);
  }
  return result;
}

uint64_t sub_100011030()
{
  return sub_10001113C(&qword_100041838, &qword_100041840);
}

unint64_t sub_10001105C()
{
  unint64_t result = qword_100041848;
  if (!qword_100041848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041848);
  }
  return result;
}

void *sub_1000110B0()
{
  return &protocol witness table for String;
}

unint64_t sub_1000110C0()
{
  unint64_t result = qword_100041850;
  if (!qword_100041850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041850);
  }
  return result;
}

uint64_t sub_100011114()
{
  return sub_10001113C(&qword_100041858, &qword_100041860);
}

uint64_t sub_10001113C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000102D4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for CharacteristicKind(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CharacteristicKind(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0x53) {
    goto LABEL_17;
  }
  if (a2 + 173 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 173) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 173;
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
      return (*a1 | (v4 << 8)) - 173;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 173;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xAE;
  int v8 = v6 - 174;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CharacteristicKind(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 173 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 173) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0x53) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0x52)
  {
    unsigned int v6 = ((a2 - 83) >> 8) + 1;
    *uint64_t result = a2 - 83;
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
        JUMPOUT(0x1000112F8);
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
          *uint64_t result = a2 - 83;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CharacteristicKind()
{
  return &type metadata for CharacteristicKind;
}

uint64_t initializeBufferWithCopyOfBuffer for CharacteristicKind.Info(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for CharacteristicKind.Info(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  if (*(unsigned __int8 *)(a1 + 44) != 255)
  {
    unint64_t v3 = *(unsigned int *)(a1 + 40) | ((unint64_t)*(unsigned __int8 *)(a1 + 44) << 32);
    uint64_t v4 = *(void *)(a1 + 32);
    return sub_1000113C8(v4, v3, BYTE4(v3));
  }
  return result;
}

uint64_t sub_1000113C8(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for CharacteristicKind.Info(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  uint64_t v5 = (uint64_t *)(a2 + 32);
  unsigned __int8 v6 = *(unsigned char *)(a2 + 44);
  uint64_t v7 = *(unsigned int *)(a2 + 40);
  swift_bridgeObjectRetain();
  if (v6 == 255)
  {
    *(void *)(a1 + 32) = *v5;
    *(void *)(a1 + 37) = *(uint64_t *)((char *)v5 + 5);
  }
  else
  {
    unint64_t v8 = v7 & 0xFFFFFF00FFFFFFFFLL | ((unint64_t)v6 << 32);
    uint64_t v9 = *v5;
    sub_10000D8EC(v9, v8, BYTE4(v8));
    *(void *)(a1 + 32) = v9;
    *(_DWORD *)(a1 + 40) = v8;
    *(unsigned char *)(a1 + 44) = BYTE4(v8);
  }
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  return a1;
}

uint64_t assignWithCopy for CharacteristicKind.Info(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  uint64_t v4 = (uint64_t *)(a1 + 32);
  uint64_t v5 = (uint64_t *)(a2 + 32);
  unint64_t v6 = *(unsigned int *)(a2 + 40) | ((unint64_t)*(unsigned __int8 *)(a2 + 44) << 32);
  char v7 = *(unsigned char *)(a2 + 44);
  if (*(unsigned __int8 *)(a1 + 44) == 255)
  {
    if (BYTE4(v6) == 255)
    {
      uint64_t v8 = *v5;
      *(void *)(a1 + 37) = *(void *)(a2 + 37);
      *uint64_t v4 = v8;
    }
    else
    {
      uint64_t v10 = *v5;
      sub_10000D8EC(*v5, *(unsigned int *)(a2 + 40) | ((unint64_t)*(unsigned __int8 *)(a2 + 44) << 32), BYTE4(v6));
      *(void *)(a1 + 32) = v10;
      *(_DWORD *)(a1 + 40) = v6;
      *(unsigned char *)(a1 + 44) = v7;
    }
  }
  else if (BYTE4(v6) == 255)
  {
    sub_1000115C8(a1 + 32);
    uint64_t v9 = *(void *)(a2 + 37);
    *uint64_t v4 = *v5;
    *(void *)(a1 + 37) = v9;
  }
  else
  {
    uint64_t v11 = *v5;
    sub_10000D8EC(*v5, *(unsigned int *)(a2 + 40) | ((unint64_t)*(unsigned __int8 *)(a2 + 44) << 32), BYTE4(v6));
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(unsigned int *)(a1 + 40);
    *(void *)(a1 + 32) = v11;
    *(_DWORD *)(a1 + 40) = v6;
    unsigned __int8 v14 = *(unsigned char *)(a1 + 44);
    *(unsigned char *)(a1 + 44) = v7;
    sub_1000113C8(v12, v13, v14);
  }
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  return a1;
}

uint64_t sub_1000115C8(uint64_t a1)
{
  return a1;
}

__n128 initializeWithTake for CharacteristicKind.Info(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for CharacteristicKind.Info(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  uint64_t v5 = (void *)(a2 + 32);
  unsigned __int8 v6 = *(unsigned char *)(a1 + 44);
  if (v6 != 255)
  {
    unint64_t v7 = *(unsigned int *)(a2 + 40) | ((unint64_t)*(unsigned __int8 *)(a2 + 44) << 32);
    if (HIDWORD(v7) <= 0xFE)
    {
      uint64_t v8 = *(unsigned int *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 32);
      *(void *)(a1 + 32) = *v5;
      *(_DWORD *)(a1 + 40) = v7;
      *(unsigned char *)(a1 + 44) = BYTE4(v7);
      sub_1000113C8(v9, v8, v6);
      goto LABEL_6;
    }
    sub_1000115C8(a1 + 32);
  }
  *(void *)(a1 + 32) = *v5;
  *(void *)(a1 + 37) = *(void *)(a2 + 37);
LABEL_6:
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for CharacteristicKind.Info(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CharacteristicKind.Info(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Info()
{
  return &type metadata for CharacteristicKind.Info;
}

uint64_t destroy for CharacteristicKind.Value(uint64_t a1)
{
  return sub_10000E204(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO5ValueOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_10000D900(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for CharacteristicKind.Value(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_10000D900(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_10000E204(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for CharacteristicKind.Value(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for CharacteristicKind.Value(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_10000E204(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for CharacteristicKind.Value(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xF5 && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 245);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 0xB) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CharacteristicKind.Value(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF4)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 245;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xF5) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xF5) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_100011918(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 0xAu) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 11);
  }
}

uint64_t sub_100011930(uint64_t result, unsigned int a2)
{
  if (a2 >= 0xB)
  {
    *(void *)__n128 result = a2 - 11;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 11;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Value()
{
  return &type metadata for CharacteristicKind.Value;
}

uint64_t destroy for CharacteristicKind.Constraints(uint64_t a1)
{
  return sub_1000113C8(*(void *)a1, *(unsigned int *)(a1 + 8), *(unsigned char *)(a1 + 12));
}

uint64_t _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO11ConstraintsOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unsigned int v4 = *(_DWORD *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 12);
  sub_10000D8EC(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(_DWORD *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 12) = v5;
  return a1;
}

uint64_t assignWithCopy for CharacteristicKind.Constraints(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unsigned int v4 = *(_DWORD *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 12);
  sub_10000D8EC(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(unsigned int *)(a1 + 8);
  *(void *)a1 = v3;
  *(_DWORD *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 12);
  *(unsigned char *)(a1 + 12) = v5;
  sub_1000113C8(v6, v7, v8);
  return a1;
}

void *initializeWithTake for CharacteristicKind.Constraints(void *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(void *)((char *)result + 5) = *(uint64_t *)((char *)a2 + 5);
  *__n128 result = v2;
  return result;
}

uint64_t assignWithTake for CharacteristicKind.Constraints(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  int v4 = *((_DWORD *)a2 + 2);
  char v5 = *((unsigned char *)a2 + 12);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(unsigned int *)(a1 + 8);
  *(void *)a1 = v3;
  *(_DWORD *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 12);
  *(unsigned char *)(a1 + 12) = v5;
  sub_1000113C8(v6, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for CharacteristicKind.Constraints(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 13)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 12);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CharacteristicKind.Constraints(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 12) = 0;
    *(_DWORD *)(result + 8) = 0;
    *(void *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 13) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 13) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 12) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_100011B18(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 12);
}

uint64_t sub_100011B20(uint64_t result, char a2)
{
  *(unsigned char *)(result + 12) = a2;
  return result;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Constraints()
{
  return &type metadata for CharacteristicKind.Constraints;
}

uint64_t initializeBufferWithCopyOfBuffer for CharacteristicKind.Constraints.MinMaxStepValues(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(void *)__n128 result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for CharacteristicKind.Constraints.MinMaxStepValues(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 12)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CharacteristicKind.Constraints.MinMaxStepValues(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_DWORD *)(result + 8) = 0;
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
  *(unsigned char *)(result + 12) = v3;
  return result;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Constraints.MinMaxStepValues()
{
  return &type metadata for CharacteristicKind.Constraints.MinMaxStepValues;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Permissions()
{
  return &type metadata for CharacteristicKind.Permissions;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Properties()
{
  return &type metadata for CharacteristicKind.Properties;
}

uint64_t getEnumTagSinglePayload for CharacteristicKind.Format(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF6) {
    goto LABEL_17;
  }
  if (a2 + 10 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 10) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 10;
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
      return (*a1 | (v4 << 8)) - 10;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 10;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xB;
  int v8 = v6 - 11;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CharacteristicKind.Format(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 10 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 10) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF6) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF5)
  {
    unsigned int v6 = ((a2 - 246) >> 8) + 1;
    *__n128 result = a2 + 10;
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
        JUMPOUT(0x100011D24);
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
          *__n128 result = a2 + 10;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Format()
{
  return &type metadata for CharacteristicKind.Format;
}

uint64_t getEnumTagSinglePayload for CharacteristicKind.Unit(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CharacteristicKind.Unit(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *__n128 result = a2 + 5;
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
        JUMPOUT(0x100011EB8);
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
          *__n128 result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Unit()
{
  return &type metadata for CharacteristicKind.Unit;
}

uint64_t sub_100011EF8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100011F00(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Constraints.CodingKeys()
{
  return &type metadata for CharacteristicKind.Constraints.CodingKeys;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Constraints.ValidValuesCodingKeys()
{
  return &type metadata for CharacteristicKind.Constraints.ValidValuesCodingKeys;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Constraints.ValidBitsCodingKeys()
{
  return &type metadata for CharacteristicKind.Constraints.ValidBitsCodingKeys;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Constraints.MinMaxStepValuesCodingKeys()
{
  return &type metadata for CharacteristicKind.Constraints.MinMaxStepValuesCodingKeys;
}

uint64_t _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO11ConstraintsO10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO11ConstraintsO10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x1000120B0);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Constraints.MinMaxStepValues.CodingKeys()
{
  return &type metadata for CharacteristicKind.Constraints.MinMaxStepValues.CodingKeys;
}

uint64_t getEnumTagSinglePayload for CharacteristicKind.Value.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF5) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 11;
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
      return (*a1 | (v4 << 8)) - 11;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 11;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xC;
  int v8 = v6 - 12;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CharacteristicKind.Value.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 11;
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
        JUMPOUT(0x100012244);
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
          *__n128 result = a2 + 11;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Value.CodingKeys()
{
  return &type metadata for CharacteristicKind.Value.CodingKeys;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Value.NullCodingKeys()
{
  return &type metadata for CharacteristicKind.Value.NullCodingKeys;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Value.BoolCodingKeys()
{
  return &type metadata for CharacteristicKind.Value.BoolCodingKeys;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Value.Uint8CodingKeys()
{
  return &type metadata for CharacteristicKind.Value.Uint8CodingKeys;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Value.Uint16CodingKeys()
{
  return &type metadata for CharacteristicKind.Value.Uint16CodingKeys;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Value.Uint32CodingKeys()
{
  return &type metadata for CharacteristicKind.Value.Uint32CodingKeys;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Value.Uint64CodingKeys()
{
  return &type metadata for CharacteristicKind.Value.Uint64CodingKeys;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Value.IntCodingKeys()
{
  return &type metadata for CharacteristicKind.Value.IntCodingKeys;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Value.Int32CodingKeys()
{
  return &type metadata for CharacteristicKind.Value.Int32CodingKeys;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Value.FloatCodingKeys()
{
  return &type metadata for CharacteristicKind.Value.FloatCodingKeys;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Value.StringCodingKeys()
{
  return &type metadata for CharacteristicKind.Value.StringCodingKeys;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Value.Tlv8CodingKeys()
{
  return &type metadata for CharacteristicKind.Value.Tlv8CodingKeys;
}

uint64_t _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO11ConstraintsO21ValidValuesCodingKeysOwet_0(unsigned int *a1, int a2)
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

unsigned char *_s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO11ConstraintsO21ValidValuesCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100012418);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Value.DataCodingKeys()
{
  return &type metadata for CharacteristicKind.Value.DataCodingKeys;
}

unint64_t sub_100012454()
{
  unint64_t result = qword_100041868;
  if (!qword_100041868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041868);
  }
  return result;
}

unint64_t sub_1000124AC()
{
  unint64_t result = qword_100041870;
  if (!qword_100041870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041870);
  }
  return result;
}

unint64_t sub_100012504()
{
  unint64_t result = qword_100041878;
  if (!qword_100041878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041878);
  }
  return result;
}

unint64_t sub_10001255C()
{
  unint64_t result = qword_100041880;
  if (!qword_100041880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041880);
  }
  return result;
}

unint64_t sub_1000125B4()
{
  unint64_t result = qword_100041888;
  if (!qword_100041888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041888);
  }
  return result;
}

unint64_t sub_10001260C()
{
  unint64_t result = qword_100041890;
  if (!qword_100041890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041890);
  }
  return result;
}

unint64_t sub_100012664()
{
  unint64_t result = qword_100041898;
  if (!qword_100041898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041898);
  }
  return result;
}

unint64_t sub_1000126BC()
{
  unint64_t result = qword_1000418A0;
  if (!qword_1000418A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000418A0);
  }
  return result;
}

unint64_t sub_100012714()
{
  unint64_t result = qword_1000418A8;
  if (!qword_1000418A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000418A8);
  }
  return result;
}

unint64_t sub_10001276C()
{
  unint64_t result = qword_1000418B0;
  if (!qword_1000418B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000418B0);
  }
  return result;
}

unint64_t sub_1000127C4()
{
  unint64_t result = qword_1000418B8;
  if (!qword_1000418B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000418B8);
  }
  return result;
}

unint64_t sub_10001281C()
{
  unint64_t result = qword_1000418C0;
  if (!qword_1000418C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000418C0);
  }
  return result;
}

unint64_t sub_100012874()
{
  unint64_t result = qword_1000418C8;
  if (!qword_1000418C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000418C8);
  }
  return result;
}

unint64_t sub_1000128CC()
{
  unint64_t result = qword_1000418D0;
  if (!qword_1000418D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000418D0);
  }
  return result;
}

unint64_t sub_100012924()
{
  unint64_t result = qword_1000418D8;
  if (!qword_1000418D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000418D8);
  }
  return result;
}

unint64_t sub_10001297C()
{
  unint64_t result = qword_1000418E0;
  if (!qword_1000418E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000418E0);
  }
  return result;
}

unint64_t sub_1000129D4()
{
  unint64_t result = qword_1000418E8;
  if (!qword_1000418E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000418E8);
  }
  return result;
}

unint64_t sub_100012A2C()
{
  unint64_t result = qword_1000418F0;
  if (!qword_1000418F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000418F0);
  }
  return result;
}

unint64_t sub_100012A84()
{
  unint64_t result = qword_1000418F8;
  if (!qword_1000418F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000418F8);
  }
  return result;
}

unint64_t sub_100012ADC()
{
  unint64_t result = qword_100041900;
  if (!qword_100041900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041900);
  }
  return result;
}

unint64_t sub_100012B34()
{
  unint64_t result = qword_100041908;
  if (!qword_100041908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041908);
  }
  return result;
}

unint64_t sub_100012B8C()
{
  unint64_t result = qword_100041910;
  if (!qword_100041910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041910);
  }
  return result;
}

unint64_t sub_100012BE4()
{
  unint64_t result = qword_100041918;
  if (!qword_100041918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041918);
  }
  return result;
}

unint64_t sub_100012C3C()
{
  unint64_t result = qword_100041920;
  if (!qword_100041920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041920);
  }
  return result;
}

unint64_t sub_100012C94()
{
  unint64_t result = qword_100041928;
  if (!qword_100041928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041928);
  }
  return result;
}

unint64_t sub_100012CEC()
{
  unint64_t result = qword_100041930;
  if (!qword_100041930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041930);
  }
  return result;
}

unint64_t sub_100012D44()
{
  unint64_t result = qword_100041938;
  if (!qword_100041938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041938);
  }
  return result;
}

unint64_t sub_100012D9C()
{
  unint64_t result = qword_100041940;
  if (!qword_100041940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041940);
  }
  return result;
}

unint64_t sub_100012DF4()
{
  unint64_t result = qword_100041948;
  if (!qword_100041948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041948);
  }
  return result;
}

unint64_t sub_100012E4C()
{
  unint64_t result = qword_100041950;
  if (!qword_100041950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041950);
  }
  return result;
}

unint64_t sub_100012EA4()
{
  unint64_t result = qword_100041958;
  if (!qword_100041958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041958);
  }
  return result;
}

unint64_t sub_100012EFC()
{
  unint64_t result = qword_100041960;
  if (!qword_100041960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041960);
  }
  return result;
}

unint64_t sub_100012F54()
{
  unint64_t result = qword_100041968;
  if (!qword_100041968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041968);
  }
  return result;
}

unint64_t sub_100012FAC()
{
  unint64_t result = qword_100041970;
  if (!qword_100041970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041970);
  }
  return result;
}

unint64_t sub_100013004()
{
  unint64_t result = qword_100041978;
  if (!qword_100041978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041978);
  }
  return result;
}

unint64_t sub_10001305C()
{
  unint64_t result = qword_100041980;
  if (!qword_100041980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041980);
  }
  return result;
}

unint64_t sub_1000130B4()
{
  unint64_t result = qword_100041988;
  if (!qword_100041988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041988);
  }
  return result;
}

unint64_t sub_10001310C()
{
  unint64_t result = qword_100041990;
  if (!qword_100041990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041990);
  }
  return result;
}

unint64_t sub_100013164()
{
  unint64_t result = qword_100041998;
  if (!qword_100041998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041998);
  }
  return result;
}

unint64_t sub_1000131BC()
{
  unint64_t result = qword_1000419A0;
  if (!qword_1000419A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000419A0);
  }
  return result;
}

unint64_t sub_100013214()
{
  unint64_t result = qword_1000419A8;
  if (!qword_1000419A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000419A8);
  }
  return result;
}

unint64_t sub_10001326C()
{
  unint64_t result = qword_1000419B0;
  if (!qword_1000419B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000419B0);
  }
  return result;
}

unint64_t sub_1000132C4()
{
  unint64_t result = qword_1000419B8;
  if (!qword_1000419B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000419B8);
  }
  return result;
}

unint64_t sub_10001331C()
{
  unint64_t result = qword_1000419C0;
  if (!qword_1000419C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000419C0);
  }
  return result;
}

unint64_t sub_100013374()
{
  unint64_t result = qword_1000419C8;
  if (!qword_1000419C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000419C8);
  }
  return result;
}

unint64_t sub_1000133CC()
{
  unint64_t result = qword_1000419D0;
  if (!qword_1000419D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000419D0);
  }
  return result;
}

unint64_t sub_100013424()
{
  unint64_t result = qword_1000419D8;
  if (!qword_1000419D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000419D8);
  }
  return result;
}

unint64_t sub_10001347C()
{
  unint64_t result = qword_1000419E0;
  if (!qword_1000419E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000419E0);
  }
  return result;
}

unint64_t sub_1000134D4()
{
  unint64_t result = qword_1000419E8;
  if (!qword_1000419E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000419E8);
  }
  return result;
}

unint64_t sub_10001352C()
{
  unint64_t result = qword_1000419F0;
  if (!qword_1000419F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000419F0);
  }
  return result;
}

unint64_t sub_100013584()
{
  unint64_t result = qword_1000419F8;
  if (!qword_1000419F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000419F8);
  }
  return result;
}

unint64_t sub_1000135DC()
{
  unint64_t result = qword_100041A00;
  if (!qword_100041A00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041A00);
  }
  return result;
}

unint64_t sub_100013634()
{
  unint64_t result = qword_100041A08;
  if (!qword_100041A08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041A08);
  }
  return result;
}

unint64_t sub_100013688()
{
  unint64_t result = qword_100041A10;
  if (!qword_100041A10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041A10);
  }
  return result;
}

unint64_t sub_1000136DC()
{
  unint64_t result = qword_100041A18;
  if (!qword_100041A18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041A18);
  }
  return result;
}

unint64_t sub_100013730()
{
  unint64_t result = qword_100041A20;
  if (!qword_100041A20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041A20);
  }
  return result;
}

uint64_t sub_100013784(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_1000137D4()
{
  unint64_t result = qword_100041A50;
  if (!qword_100041A50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041A50);
  }
  return result;
}

uint64_t sub_100013828(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000102D4(&qword_1000417B0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100013890()
{
  unint64_t result = qword_100041AD0;
  if (!qword_100041AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041AD0);
  }
  return result;
}

uint64_t sub_1000138E8(uint64_t result, uint64_t a2)
{
  if (BYTE4(a2) != 255) {
    return sub_1000113C8(result, a2, BYTE4(a2));
  }
  return result;
}

uint64_t sub_1000138FC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

id LockScreenDataModel.homeManager.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent19LockScreenDataModel_homeManager);
}

void *LockScreenDataModel.currentHome.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent19LockScreenDataModel_currentHome);
  swift_beginAccess();
  int v2 = *v1;
  id v3 = v2;
  return v2;
}

void LockScreenDataModel.currentHome.setter(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent19LockScreenDataModel_currentHome);
  swift_beginAccess();
  unsigned int v4 = *v3;
  *id v3 = a1;
}

uint64_t (*LockScreenDataModel.currentHome.modify())()
{
  return j__swift_endAccess;
}

char *sub_100013AB0()
{
  unint64_t result = sub_100013AD0();
  qword_100041FB8 = (uint64_t)result;
  return result;
}

char *sub_100013AD0()
{
  uint64_t v0 = sub_100029D38();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  unsigned int v4 = (char *)&v54 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (char *)[objc_allocWithZone((Class)type metadata accessor for LockScreenDataModel()) init];
  uint64_t v54 = OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent19LockScreenDataModel_homeManager;
  uint64_t v55 = v5;
  [*(id *)&v5[OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent19LockScreenDataModel_homeManager] setDelegate:];
  sub_100029D28();
  sub_100029D18();
  double v7 = v6;
  uint64_t v10 = *(void (**)(void, void))(v1 + 8);
  uint64_t v9 = v1 + 8;
  int v8 = v10;
  v10(v4, v0);
  p_imp = &stru_100040FF0.imp;
  uint64_t v13 = &stru_100040FF0.imp;
  if ((byte_100041FB0 & 1) == 0)
  {
    uint64_t v38 = &LockScreenDataModel;
    *(void *)&long long v11 = 138412546;
    long long v56 = v11;
    char v57 = v8;
    do
    {
      uint64_t v42 = self;
      [v42 count:0.2];
      if (((_BYTE)p_imp[502] & 1) == 0)
      {
        if (v13[199] != (IMP)-1) {
          swift_once();
        }
        uint64_t v43 = sub_100029DD8();
        sub_1000138FC(v43, (uint64_t)qword_100041FC8);
        uint64_t v44 = sub_100029DB8();
        os_log_type_t v45 = sub_10002A128();
        if (os_log_type_enabled(v44, v45))
        {
          uint64_t v46 = swift_slowAlloc();
          uint64_t v47 = v9;
          uint64_t v48 = v0;
          uint64_t v49 = v13;
          v50 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v46 = v56;
          id v51 = [v42 mainThread];
          *(void *)(v46 + 4) = v51;
          void *v50 = v51;
          *(_WORD *)(v46 + 12) = 2112;
          id v52 = [v42 currentThread];
          *(void *)(v46 + 14) = v52;
          v50[1] = v52;
          _os_log_impl((void *)&_mh_execute_header, v44, v45, "DataModel.shared is STILL spinning waiting for HomeKit — main thread is %@ current thread is %@", (uint8_t *)v46, 0x16u);
          sub_10000D9EC(&qword_100041BD0);
          swift_arrayDestroy();
          uint64_t v13 = v49;
          uint64_t v0 = v48;
          uint64_t v9 = v47;
          int v8 = v57;
          swift_slowDealloc();
          p_imp = (IMP *)(&stru_100040FF0 + 16);
          swift_slowDealloc();
        }

        sub_100029D28();
        sub_100029D18();
        double v40 = v39;
        v8(v4, v0);
        uint64_t v38 = &LockScreenDataModel;
        if (v40 - v7 > 60.0) {
          exit(-1);
        }
      }
    }
    while (((_BYTE)p_imp[502] & 1) == 0);
  }
  sub_100016EA4(0, &qword_100041BD8);
  unsigned __int8 v14 = sub_10002A138();
  uint64_t v15 = swift_allocObject();
  uint64_t v16 = v55;
  *(void *)(v15 + 16) = v55;
  uint64_t v64 = sub_100016E44;
  uint64_t v65 = v15;
  aBlock = _NSConcreteStackBlock;
  uint64_t v61 = 1107296256;
  __int16 v62 = sub_100014204;
  uint64_t v63 = &unk_10003C8E0;
  uint64_t v17 = _Block_copy(&aBlock);
  uint64_t v18 = v16;
  swift_release();
  uint64_t v19 = (int *)&v18[OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent19LockScreenDataModel_defaultsHomeSensingChangedNotifyToken];
  swift_beginAccess();
  notify_register_dispatch("com.apple.Home.homeSensingChanged", v19, v14, v17);
  swift_endAccess();
  _Block_release(v17);

  uint64_t v20 = sub_10002A138();
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v18;
  uint64_t v64 = sub_100016E80;
  uint64_t v65 = v21;
  aBlock = _NSConcreteStackBlock;
  uint64_t v61 = 1107296256;
  __int16 v62 = sub_100014204;
  uint64_t v63 = &unk_10003C930;
  uint64_t v22 = _Block_copy(&aBlock);
  uint64_t v23 = v18;
  swift_release();
  uint64_t v24 = (int *)&v23[OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent19LockScreenDataModel_defaultsSelectedHomeChangedNotifyToken];
  swift_beginAccess();
  notify_register_dispatch("com.apple.Home.selectedHomeChanged", v24, v20, v22);
  swift_endAccess();
  _Block_release(v22);

  id v25 = *(id *)&v16[v54];
  uint64_t v26 = sub_1000247BC(v25);

  uint64_t v27 = (id *)&v23[OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent19LockScreenDataModel_currentHome];
  swift_beginAccess();
  id v28 = *v27;
  *uint64_t v27 = (id)v26;

  if (v13[199] != (IMP)-1) {
    swift_once();
  }
  uint64_t v29 = sub_100029DD8();
  sub_1000138FC(v29, (uint64_t)qword_100041FC8);
  uint64_t v30 = v23;
  uint64_t v31 = sub_100029DB8();
  os_log_type_t v32 = sub_10002A128();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    uint64_t v59 = swift_slowAlloc();
    *(_DWORD *)uint64_t v33 = 136315138;
    if (*v27)
    {
      id v34 = [*v27 name];
      uint64_t v35 = sub_100029EF8();
      unint64_t v37 = v36;
    }
    else
    {
      unint64_t v37 = 0xE400000000000000;
      uint64_t v35 = 1701736302;
    }
    uint64_t v58 = sub_100014A04(v35, v37, &v59);
    sub_10002A148();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "User's home is now %s", v33, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return v30;
}

id LockScreenDataModel.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

uint64_t sub_100014204(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

void sub_100014258(uint64_t a1, char *a2, const char *a3)
{
  uint64_t v5 = sub_1000247BC(*(void **)&a2[OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent19LockScreenDataModel_homeManager]);
  double v6 = (id *)&a2[OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent19LockScreenDataModel_currentHome];
  swift_beginAccess();
  id v7 = *v6;
  *double v6 = (id)v5;

  if (qword_100041638 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_100029DD8();
  sub_1000138FC(v8, (uint64_t)qword_100041FC8);
  uint64_t v9 = a2;
  uint64_t v10 = sub_100029DB8();
  os_log_type_t v11 = sub_10002A128();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315138;
    if (*v6)
    {
      id v13 = [*v6 name];
      uint64_t v14 = sub_100029EF8();
      unint64_t v16 = v15;
    }
    else
    {
      unint64_t v16 = 0xE400000000000000;
      uint64_t v14 = 1701736302;
    }
    sub_100014A04(v14, v16, &v17);
    sub_10002A148();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, a3, v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

uint64_t sub_100014478()
{
  id v1 = [*(id *)(v0 + OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent19LockScreenDataModel_homeManager) homes];
  sub_100016EA4(0, (unint64_t *)&qword_100041BF8);
  uint64_t v2 = sub_10002A038();

  if (v2 < 0 || (v2 & 0x4000000000000000) != 0)
  {
    unint64_t v5 = swift_bridgeObjectRetain();
    uint64_t v3 = (uint64_t)sub_100025968(v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  uint64_t v6 = v3;
  sub_1000150D8(&v6);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100014550()
{
  uint64_t v0 = sub_100029CE8();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  unsigned int v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10000D9EC(&qword_100041C08);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = [self mainBundle];
  NSString v10 = sub_100029EE8();
  NSString v11 = sub_100029EE8();
  id v12 = [v9 URLForResource:v10 withExtension:v11];

  if (!v12)
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v8, 1, 1, v0);
    goto LABEL_6;
  }
  sub_100029CD8();

  (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v8, v4, v0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v1 + 56))(v8, 0, 1, v0);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 48))(v8, 1, v0);
  if (result == 1)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  id v14 = objc_allocWithZone((Class)NSDictionary);
  sub_100029CC8(v15);
  uint64_t v17 = v16;
  id v18 = [v14 initWithContentsOfURL:v16];

  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v8, v0);
  if (v18)
  {
    qword_100041FC0 = (uint64_t)v18;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

id LockScreenDataModel.init()()
{
  uint64_t v1 = OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent19LockScreenDataModel_homeManager;
  sub_100016EA4(0, (unint64_t *)&qword_100041B30);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  uint64_t v3 = v0;
  id v4 = [ObjCClassFromMetadata defaultPrivateConfiguration];
  [v4 setDiscretionary:0];
  [v4 setAdaptive:1];
  id v5 = [objc_allocWithZone((Class)HMHomeManager) initWithConfiguration:v4];

  *(void *)&v0[v1] = v5;
  *(void *)&v3[OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent19LockScreenDataModel_currentHome] = 0;
  *(_DWORD *)&v3[OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent19LockScreenDataModel_defaultsHomeSensingChangedNotifyToken] = 0;
  *(_DWORD *)&v3[OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent19LockScreenDataModel_defaultsSelectedHomeChangedNotifyToken] = 0;

  v7.receiver = v3;
  v7.super_class = (Class)type metadata accessor for LockScreenDataModel();
  return [super init];
}

uint64_t type metadata accessor for LockScreenDataModel()
{
  return self;
}

id LockScreenDataModel.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LockScreenDataModel();
  return [super dealloc];
}

uint64_t sub_100014A04(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100014AD8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000DAA0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10000DAA0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100013784((uint64_t)v12);
  return v7;
}

uint64_t sub_100014AD8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10002A158();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100014C94(a5, a6);
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
  uint64_t v8 = sub_10002A228();
  if (!v8)
  {
    sub_10002A298();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10002A308();
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

uint64_t sub_100014C94(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100014D2C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100014F88(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100014F88(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100014D2C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100014EA4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10002A1D8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10002A298();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100029F58();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10002A308();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10002A298();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100014EA4(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_10000D9EC(&qword_100041BE0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100014F0C(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_100029FA8();
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
    uint64_t v5 = sub_100029F78();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_100014F88(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000D9EC(&qword_100041BE0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
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
  uint64_t result = sub_10002A308();
  __break(1u);
  return result;
}

uint64_t sub_1000150D8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = sub_100026FB8(v2);
    *a1 = v2;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_100015154(v6);
  return sub_10002A248();
}

void sub_100015154(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int v4 = sub_10002A4B8(v3);
  if (v4 >= v3)
  {
    if (v3 < 0) {
      goto LABEL_157;
    }
    if (v3) {
      sub_100015B70(0, v3, 1, a1);
    }
    return;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_165;
  }
  Swift::Int v138 = v4;
  Swift::Int v143 = v3;
  v136 = a1;
  if (v3 < 2)
  {
    int64_t v8 = (char *)_swiftEmptyArrayStorage;
    uint64_t v152 = (uint64_t)_swiftEmptyArrayStorage;
    v146 = (void **)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v3 != 1)
    {
      unint64_t v13 = _swiftEmptyArrayStorage[2];
LABEL_123:
      if (v13 >= 2)
      {
        uint64_t v126 = *v136;
        do
        {
          unint64_t v127 = v13 - 2;
          if (v13 < 2) {
            goto LABEL_152;
          }
          if (!v126) {
            goto LABEL_164;
          }
          v128 = v8;
          v129 = v8 + 32;
          uint64_t v130 = *(void *)&v8[16 * v127 + 32];
          uint64_t v131 = *(void *)&v8[16 * v13 + 24];
          sub_100015D48((void **)(v126 + 8 * v130), (id *)(v126 + 8 * *(void *)&v129[16 * v13 - 16]), v126 + 8 * v131, v146);
          if (v1) {
            break;
          }
          if (v131 < v130) {
            goto LABEL_153;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v128 = sub_100026BB0((uint64_t)v128);
          }
          if (v127 >= *((void *)v128 + 2)) {
            goto LABEL_154;
          }
          v132 = v128;
          v133 = v128 + 32;
          v134 = &v128[16 * v127 + 32];
          *(void *)v134 = v130;
          *((void *)v134 + 1) = v131;
          unint64_t v135 = *((void *)v128 + 2);
          if (v13 > v135) {
            goto LABEL_155;
          }
          int64_t v8 = v132;
          memmove(&v133[16 * v13 - 16], &v133[16 * v13], 16 * (v135 - v13));
          *((void *)v8 + 2) = v135 - 1;
          unint64_t v13 = v135 - 1;
        }
        while (v135 > 2);
      }
LABEL_134:
      swift_bridgeObjectRelease();
      *(void *)((v152 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_10002A058();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    sub_100016EA4(0, (unint64_t *)&qword_100041BF8);
    uint64_t v7 = sub_10002A078();
    *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) = v6;
    v146 = (void **)((v7 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v152 = v7;
  }
  Swift::Int v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v137 = *a1 - 8;
  int64_t v8 = (char *)_swiftEmptyArrayStorage;
  size_t v11 = &LockScreenDataModel;
  Swift::Int v12 = v143;
  uint64_t v147 = *a1;
  while (1)
  {
    Swift::Int v14 = v9++;
    if (v9 >= v12) {
      goto LABEL_50;
    }
    v139 = v8;
    unint64_t v15 = *(void **)(v10 + 8 * v14);
    id v16 = *(id *)(v10 + 8 * v9);
    id v17 = v15;
    unsigned int v18 = [v16 (SEL)v11[354].count];
    if (v18 == [v17 (SEL)v11[354].count])
    {
      Swift::Int v148 = v9;
      id v21 = [v16 name];
      uint64_t v22 = sub_100029EF8();
      uint64_t v24 = v23;

      id v25 = [v17 name];
      uint64_t v26 = sub_100029EF8();
      uint64_t v28 = v27;

      if (v22 == v26 && v24 == v28) {
        unsigned int v19 = 0;
      }
      else {
        unsigned int v19 = sub_10002A4D8();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      Swift::Int v20 = v14 + 2;
      size_t v11 = &LockScreenDataModel;
      Swift::Int v9 = v148;
      if (v14 + 2 < v143)
      {
LABEL_27:
        Swift::Int v30 = v20;
        uint64_t v10 = v147;
        unsigned int v144 = v19;
        do
        {
          Swift::Int v20 = v30;
          os_log_type_t v32 = *(void **)(v10 + 8 * v9);
          id v33 = *(id *)(v10 + 8 * v30);
          id v34 = v32;
          unsigned int v35 = [v33 (SEL)v11[354].count];
          if (v35 == [v34 (SEL)v11[354].count])
          {
            Swift::Int v149 = v20;
            id v36 = [v33 name];
            uint64_t v37 = sub_100029EF8();
            uint64_t v39 = v38;

            id v40 = [v34 name];
            uint64_t v41 = sub_100029EF8();
            uint64_t v43 = v42;

            if (v37 == v41 && v39 == v43)
            {

              swift_bridgeObjectRelease_n();
              size_t v11 = &LockScreenDataModel;
              Swift::Int v20 = v149;
              unsigned int v19 = v144;
              if (v144)
              {
                int64_t v8 = v139;
                uint64_t v10 = v147;
                goto LABEL_41;
              }
            }
            else
            {
              char v45 = sub_10002A4D8();

              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              char v46 = v144 ^ v45;
              unsigned int v19 = v144;
              size_t v11 = &LockScreenDataModel;
              Swift::Int v20 = v149;
              if (v46) {
                goto LABEL_19;
              }
            }
          }
          else
          {
            unsigned int v31 = [v33 (SEL)v11[354].count];

            if ((v19 ^ v31)) {
              goto LABEL_19;
            }
          }
          Swift::Int v30 = v20 + 1;
          Swift::Int v9 = v20;
          uint64_t v10 = v147;
        }
        while (v20 + 1 < v143);
        ++v20;
        goto LABEL_40;
      }
    }
    else
    {
      unsigned int v19 = [v16 (SEL)v11[354].count];

      Swift::Int v20 = v14 + 2;
      if (v14 + 2 < v143) {
        goto LABEL_27;
      }
    }
    LOBYTE(v144) = v19;
LABEL_19:
    uint64_t v10 = v147;
LABEL_40:
    Swift::Int v9 = v20;
    int64_t v8 = v139;
    if (v144)
    {
LABEL_41:
      if (v20 < v14) {
        goto LABEL_158;
      }
      if (v14 < v20)
      {
        uint64_t v47 = (uint64_t *)(v137 + 8 * v20);
        Swift::Int v48 = v20;
        Swift::Int v49 = v14;
        v50 = (uint64_t *)(v10 + 8 * v14);
        do
        {
          if (v49 != --v48)
          {
            if (!v10) {
              goto LABEL_163;
            }
            uint64_t v51 = *v50;
            uint64_t *v50 = *v47;
            *uint64_t v47 = v51;
          }
          ++v49;
          --v47;
          ++v50;
        }
        while (v49 < v48);
      }
      Swift::Int v9 = v20;
    }
LABEL_50:
    if (v9 >= v143) {
      goto LABEL_74;
    }
    if (__OFSUB__(v9, v14)) {
      goto LABEL_156;
    }
    if (v9 - v14 >= v138) {
      goto LABEL_74;
    }
    if (__OFADD__(v14, v138)) {
      goto LABEL_159;
    }
    Swift::Int v52 = v143;
    if (v14 + v138 < v143) {
      Swift::Int v52 = v14 + v138;
    }
    if (v52 < v14) {
      break;
    }
    if (v9 == v52) {
      goto LABEL_74;
    }
    v140 = v8;
    Swift::Int v141 = v52;
    uint64_t v53 = v137 + 8 * v9;
    Swift::Int v142 = v14;
    while (2)
    {
      uint64_t v54 = *(void **)(v10 + 8 * v9);
      Swift::Int v55 = v14;
      uint64_t v145 = v53;
      uint64_t v56 = v53;
      Swift::Int v150 = v9;
      while (1)
      {
        char v57 = *(void **)v56;
        id v58 = v54;
        id v59 = v57;
        LODWORD(v57) = [v58 (SEL)v11[354].count];
        if (v57 == [v59 (SEL)v11[354].count]) {
          break;
        }
        unsigned __int8 v60 = [v58 (SEL)v11[354].count];

        if ((v60 & 1) == 0) {
          goto LABEL_60;
        }
LABEL_70:
        if (!v10) {
          goto LABEL_161;
        }
        uint64_t v71 = *(void **)v56;
        uint64_t v54 = *(void **)(v56 + 8);
        *(void *)uint64_t v56 = v54;
        *(void *)(v56 + 8) = v71;
        v56 -= 8;
        if (v9 == ++v55) {
          goto LABEL_60;
        }
      }
      id v61 = [v58 name];
      uint64_t v62 = sub_100029EF8();
      uint64_t v64 = v63;

      id v65 = [v59 name];
      uint64_t v66 = sub_100029EF8();
      uint64_t v68 = v67;

      if (v62 != v66 || v64 != v68)
      {
        char v70 = sub_10002A4D8();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v10 = v147;
        Swift::Int v9 = v150;
        size_t v11 = &LockScreenDataModel;
        if ((v70 & 1) == 0) {
          goto LABEL_60;
        }
        goto LABEL_70;
      }

      swift_bridgeObjectRelease_n();
      uint64_t v10 = v147;
      Swift::Int v9 = v150;
      size_t v11 = &LockScreenDataModel;
LABEL_60:
      ++v9;
      uint64_t v53 = v145 + 8;
      Swift::Int v14 = v142;
      if (v9 != v141) {
        continue;
      }
      break;
    }
    Swift::Int v9 = v141;
    int64_t v8 = v140;
LABEL_74:
    if (v9 < v14) {
      goto LABEL_151;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int64_t v8 = sub_1000269F4(0, *((void *)v8 + 2) + 1, 1, v8);
    }
    unint64_t v73 = *((void *)v8 + 2);
    unint64_t v72 = *((void *)v8 + 3);
    unint64_t v13 = v73 + 1;
    if (v73 >= v72 >> 1) {
      int64_t v8 = sub_1000269F4((char *)(v72 > 1), v73 + 1, 1, v8);
    }
    *((void *)v8 + 2) = v13;
    uint64_t v74 = v8 + 32;
    int v75 = &v8[16 * v73 + 32];
    *(void *)int v75 = v14;
    *((void *)v75 + 1) = v9;
    if (v73)
    {
      Swift::Int v151 = v9;
      while (1)
      {
        unint64_t v76 = v13 - 1;
        if (v13 >= 4)
        {
          uint64_t v81 = &v74[16 * v13];
          uint64_t v82 = *((void *)v81 - 8);
          uint64_t v83 = *((void *)v81 - 7);
          BOOL v87 = __OFSUB__(v83, v82);
          uint64_t v84 = v83 - v82;
          if (v87) {
            goto LABEL_140;
          }
          uint64_t v86 = *((void *)v81 - 6);
          uint64_t v85 = *((void *)v81 - 5);
          BOOL v87 = __OFSUB__(v85, v86);
          uint64_t v79 = v85 - v86;
          char v80 = v87;
          if (v87) {
            goto LABEL_141;
          }
          unint64_t v88 = v13 - 2;
          uint64_t v89 = &v74[16 * v13 - 32];
          uint64_t v91 = *(void *)v89;
          uint64_t v90 = *((void *)v89 + 1);
          BOOL v87 = __OFSUB__(v90, v91);
          uint64_t v92 = v90 - v91;
          if (v87) {
            goto LABEL_143;
          }
          BOOL v87 = __OFADD__(v79, v92);
          uint64_t v93 = v79 + v92;
          if (v87) {
            goto LABEL_146;
          }
          if (v93 >= v84)
          {
            uint64_t v111 = &v74[16 * v76];
            uint64_t v113 = *(void *)v111;
            uint64_t v112 = *((void *)v111 + 1);
            BOOL v87 = __OFSUB__(v112, v113);
            uint64_t v114 = v112 - v113;
            if (v87) {
              goto LABEL_150;
            }
            BOOL v104 = v79 < v114;
            goto LABEL_112;
          }
        }
        else
        {
          if (v13 != 3)
          {
            uint64_t v105 = *((void *)v8 + 4);
            uint64_t v106 = *((void *)v8 + 5);
            BOOL v87 = __OFSUB__(v106, v105);
            uint64_t v98 = v106 - v105;
            char v99 = v87;
            goto LABEL_106;
          }
          uint64_t v78 = *((void *)v8 + 4);
          uint64_t v77 = *((void *)v8 + 5);
          BOOL v87 = __OFSUB__(v77, v78);
          uint64_t v79 = v77 - v78;
          char v80 = v87;
        }
        if (v80) {
          goto LABEL_142;
        }
        unint64_t v88 = v13 - 2;
        uint64_t v94 = &v74[16 * v13 - 32];
        uint64_t v96 = *(void *)v94;
        uint64_t v95 = *((void *)v94 + 1);
        BOOL v97 = __OFSUB__(v95, v96);
        uint64_t v98 = v95 - v96;
        char v99 = v97;
        if (v97) {
          goto LABEL_145;
        }
        v100 = &v74[16 * v76];
        uint64_t v102 = *(void *)v100;
        uint64_t v101 = *((void *)v100 + 1);
        BOOL v87 = __OFSUB__(v101, v102);
        uint64_t v103 = v101 - v102;
        if (v87) {
          goto LABEL_148;
        }
        if (__OFADD__(v98, v103)) {
          goto LABEL_149;
        }
        if (v98 + v103 >= v79)
        {
          BOOL v104 = v79 < v103;
LABEL_112:
          if (v104) {
            unint64_t v76 = v88;
          }
          goto LABEL_114;
        }
LABEL_106:
        if (v99) {
          goto LABEL_144;
        }
        uint64_t v107 = &v74[16 * v76];
        uint64_t v109 = *(void *)v107;
        uint64_t v108 = *((void *)v107 + 1);
        BOOL v87 = __OFSUB__(v108, v109);
        uint64_t v110 = v108 - v109;
        if (v87) {
          goto LABEL_147;
        }
        if (v110 < v98) {
          goto LABEL_14;
        }
LABEL_114:
        unint64_t v115 = v76 - 1;
        if (v76 - 1 >= v13)
        {
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
          goto LABEL_160;
        }
        if (!v10) {
          goto LABEL_162;
        }
        uint64_t v116 = v8;
        uint64_t v117 = v10;
        uint64_t v118 = &v74[16 * v115];
        uint64_t v119 = *(void *)v118;
        uint64_t v120 = v74;
        unint64_t v121 = v76;
        uint64_t v122 = &v74[16 * v76];
        uint64_t v123 = *((void *)v122 + 1);
        uint64_t v124 = v117;
        sub_100015D48((void **)(v117 + 8 * *(void *)v118), (id *)(v117 + 8 * *(void *)v122), v117 + 8 * v123, v146);
        if (v1) {
          goto LABEL_134;
        }
        if (v123 < v119) {
          goto LABEL_137;
        }
        if (v121 > *((void *)v116 + 2)) {
          goto LABEL_138;
        }
        *(void *)uint64_t v118 = v119;
        *(void *)&v120[16 * v115 + 8] = v123;
        unint64_t v125 = *((void *)v116 + 2);
        if (v121 >= v125) {
          goto LABEL_139;
        }
        int64_t v8 = v116;
        unint64_t v13 = v125 - 1;
        memmove(v122, v122 + 16, 16 * (v125 - 1 - v121));
        uint64_t v74 = v120;
        *((void *)v116 + 2) = v125 - 1;
        size_t v11 = &LockScreenDataModel;
        Swift::Int v9 = v151;
        uint64_t v10 = v124;
        if (v125 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v13 = 1;
LABEL_14:
    Swift::Int v12 = v143;
    if (v9 >= v143) {
      goto LABEL_123;
    }
  }
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
  sub_10002A298();
  __break(1u);
}

void sub_100015B70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v5 = *a4;
    uint64_t v6 = *a4 + 8 * a3 - 8;
    uint64_t v7 = &LockScreenDataModel;
    uint64_t v28 = *a4;
LABEL_6:
    int64_t v8 = *(void **)(v5 + 8 * v4);
    uint64_t v9 = a1;
    uint64_t v27 = v6;
    uint64_t v29 = v4;
    while (1)
    {
      uint64_t v10 = *(void **)v6;
      id v11 = v8;
      id v12 = v10;
      LODWORD(v10) = [v11 (SEL)v7[354].count];
      if (v10 == [v12 (SEL)v7[354].count])
      {
        id v14 = [v11 name];
        uint64_t v15 = sub_100029EF8();
        uint64_t v17 = v16;

        id v18 = [v12 name];
        uint64_t v19 = sub_100029EF8();
        uint64_t v21 = v20;

        if (v15 == v19 && v17 == v21)
        {

          swift_bridgeObjectRelease_n();
          uint64_t v4 = v29;
          uint64_t v5 = v28;
          uint64_t v7 = &LockScreenDataModel;
LABEL_5:
          ++v4;
          uint64_t v6 = v27 + 8;
          if (v4 == a2) {
            return;
          }
          goto LABEL_6;
        }
        char v23 = sub_10002A4D8();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v4 = v29;
        uint64_t v5 = v28;
        uint64_t v7 = &LockScreenDataModel;
        if ((v23 & 1) == 0) {
          goto LABEL_5;
        }
      }
      else
      {
        unsigned __int8 v13 = [v11 (SEL)v7[354].count];

        if ((v13 & 1) == 0) {
          goto LABEL_5;
        }
      }
      if (!v5) {
        break;
      }
      uint64_t v24 = *(void **)v6;
      int64_t v8 = *(void **)(v6 + 8);
      *(void *)uint64_t v6 = v8;
      *(void *)(v6 + 8) = v24;
      v6 -= 8;
      if (v4 == ++v9) {
        goto LABEL_5;
      }
    }
    __break(1u);
  }
}

uint64_t sub_100015D48(void **__src, id *a2, unint64_t a3, void **__dst)
{
  uint64_t v4 = __dst;
  uint64_t v5 = a2;
  uint64_t v6 = __src;
  int64_t v7 = (char *)a2 - (char *)__src;
  int64_t v8 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0) {
    int64_t v8 = (char *)a2 - (char *)__src;
  }
  uint64_t v9 = v8 >> 3;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v11 = a3 - (void)a2;
  }
  uint64_t v12 = v11 >> 3;
  uint64_t v64 = __src;
  uint64_t v63 = __dst;
  if (v9 >= v11 >> 3)
  {
    if (v10 < -7) {
      goto LABEL_61;
    }
    if (__dst != a2 || &a2[v12] <= __dst) {
      memmove(__dst, a2, 8 * v12);
    }
    os_log_type_t v32 = &v4[v12];
    uint64_t v62 = v32;
    uint64_t v64 = v5;
    if (v6 >= v5 || v10 < 8)
    {
LABEL_60:
      sub_100026AF0(&v64, &v63, &v62);
      return 1;
    }
    id v33 = (void **)(a3 - 8);
    id v34 = &LockScreenDataModel;
    unsigned int v35 = v5;
    uint64_t v53 = v6;
    uint64_t v54 = v4;
    while (1)
    {
      id v59 = v32;
      id v61 = v5;
      char v57 = v33 + 1;
      uint64_t v37 = *--v32;
      id v36 = v37;
      uint64_t v38 = *--v35;
      id v39 = v36;
      id v40 = v38;
      unsigned int v41 = [v39 (SEL)v34[354].count];
      if (v41 == [v40 (SEL)v34[354].count])
      {
        id v43 = [v39 name];
        uint64_t v44 = sub_100029EF8();
        uint64_t v55 = v45;

        id v46 = [v40 name];
        uint64_t v47 = sub_100029EF8();
        uint64_t v49 = v48;

        if (v44 == v47 && v55 == v49)
        {

          swift_bridgeObjectRelease_n();
          uint64_t v6 = v53;
          uint64_t v4 = v54;
          id v34 = &LockScreenDataModel;
        }
        else
        {
          char v51 = sub_10002A4D8();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v6 = v53;
          uint64_t v4 = v54;
          id v34 = &LockScreenDataModel;
          if (v51)
          {
LABEL_47:
            os_log_type_t v32 = v59;
            if (v57 != v61 || v33 >= v61) {
              *id v33 = *v35;
            }
            uint64_t v64 = v35;
            goto LABEL_56;
          }
        }
      }
      else
      {
        unsigned __int8 v42 = [v39 (SEL)v34[354].count];

        if (v42) {
          goto LABEL_47;
        }
      }
      uint64_t v62 = v32;
      unsigned int v35 = v61;
      if (v57 < v59 || v33 >= v59 || v57 != v59) {
        *id v33 = *v32;
      }
LABEL_56:
      if (v35 > v6)
      {
        --v33;
        uint64_t v5 = v35;
        if (v32 > v4) {
          continue;
        }
      }
      goto LABEL_60;
    }
  }
  if (v7 >= -7)
  {
    if (__dst != __src || &__src[v9] <= __dst) {
      memmove(__dst, __src, 8 * v9);
    }
    unsigned __int8 v13 = &v4[v9];
    uint64_t v62 = v13;
    if ((unint64_t)v5 < a3 && v7 >= 8)
    {
      id v14 = &LockScreenDataModel;
      uint64_t v56 = v13;
      while (1)
      {
        uint64_t v15 = *v4;
        id v16 = *v5;
        id v17 = v15;
        LODWORD(v15) = [v16 (SEL)v14[354].count];
        if (v15 == [v17 (SEL)v14[354].count])
        {
          unsigned __int8 v60 = v5;
          uint64_t v20 = v6;
          uint64_t v21 = v4;
          id v22 = [v16 name];
          uint64_t v23 = sub_100029EF8();
          uint64_t v25 = v24;

          id v26 = [v17 name];
          uint64_t v27 = sub_100029EF8();
          uint64_t v29 = v28;

          if (v23 == v27 && v25 == v29)
          {

            swift_bridgeObjectRelease_n();
            uint64_t v4 = v21;
            uint64_t v6 = v20;
            uint64_t v5 = v60;
            unsigned __int8 v13 = v56;
            id v14 = &LockScreenDataModel;
            if (v6 == v4) {
              goto LABEL_17;
            }
LABEL_16:
            *uint64_t v6 = *v4;
            goto LABEL_17;
          }
          char v31 = sub_10002A4D8();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v4 = v21;
          uint64_t v6 = v20;
          uint64_t v5 = v60;
          unsigned __int8 v13 = v56;
          id v14 = &LockScreenDataModel;
          if (v31)
          {
LABEL_23:
            uint64_t v19 = v5 + 1;
            if (v6 < v5 || v6 >= v19 || v6 != v5) {
              *uint64_t v6 = *v5;
            }
            goto LABEL_27;
          }
        }
        else
        {
          unsigned __int8 v18 = [v16 (SEL)v14[354].count];

          if (v18) {
            goto LABEL_23;
          }
        }
        if (v6 != v4) {
          goto LABEL_16;
        }
LABEL_17:
        uint64_t v63 = ++v4;
        uint64_t v19 = v5;
LABEL_27:
        ++v6;
        if (v4 < v13)
        {
          uint64_t v5 = v19;
          if ((unint64_t)v19 < a3) {
            continue;
          }
        }
        uint64_t v64 = v6;
        goto LABEL_60;
      }
    }
    goto LABEL_60;
  }
LABEL_61:
  uint64_t result = sub_10002A308();
  __break(1u);
  return result;
}

uint64_t sub_100016228(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100016248(a1, a2, a3, *v3);
  *Swift::Int v3 = (char *)result;
  return result;
}

uint64_t sub_100016248(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    sub_10000D9EC(&qword_100041C00);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unsigned __int8 v13 = v10 + 32;
  id v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_10002A308();
  __break(1u);
  return result;
}

void sub_1000163B4()
{
  if (qword_100041638 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100029DD8();
  sub_1000138FC(v0, (uint64_t)qword_100041FC8);
  oslog = sub_100029DB8();
  os_log_type_t v1 = sub_10002A128();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = swift_slowAlloc();
    *(_DWORD *)uint64_t v2 = 67109376;
    sub_10002A148();
    *(_WORD *)(v2 + 8) = 1024;
    sub_10002A148();
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "homeHasUpdatedOnce was %{BOOL}d is now %{BOOL}d", (uint8_t *)v2, 0xEu);
    swift_slowDealloc();
  }
  else
  {
  }
}

void *sub_100016518(int a1, id a2)
{
  id v2 = [a2 accessories];
  sub_100016EA4(0, &qword_100041BE8);
  unint64_t v3 = sub_10002A038();

  if (v3 >> 62) {
    goto LABEL_45;
  }
  uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v4)
  {
    unint64_t v5 = 0;
    unint64_t v29 = v3;
    unint64_t v30 = v3 & 0xC000000000000001;
    unint64_t v26 = v3 + 32;
    uint64_t v27 = v3 & 0xFFFFFFFFFFFFFF8;
    uint64_t v28 = v4;
    while (1)
    {
      if (v30)
      {
        id v6 = (id)sub_10002A1E8();
        BOOL v7 = __OFADD__(v5, 1);
        unint64_t v8 = v5 + 1;
        if (v7) {
          goto LABEL_41;
        }
      }
      else
      {
        if (v5 >= *(void *)(v27 + 16)) {
          goto LABEL_44;
        }
        id v6 = *(id *)(v26 + 8 * v5);
        BOOL v7 = __OFADD__(v5, 1);
        unint64_t v8 = v5 + 1;
        if (v7)
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          goto LABEL_43;
        }
      }
      unint64_t v31 = v8;
      id v32 = v6;
      id v9 = [v6 services];
      sub_100016EA4(0, (unint64_t *)&qword_100041BF0);
      unint64_t v10 = sub_10002A038();

      if (v10 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v11 = sub_10002A2C8();
        swift_bridgeObjectRelease();
        if (!v11)
        {
LABEL_31:
          swift_bridgeObjectRelease();
          id v22 = v32;
          if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
            break;
          }
          goto LABEL_32;
        }
      }
      else
      {
        uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (!v11) {
          goto LABEL_31;
        }
      }
      if (v11 < 1) {
        goto LABEL_42;
      }
      for (uint64_t i = 0; i != v11; ++i)
      {
        if ((v10 & 0xC000000000000001) != 0) {
          id v13 = (id)sub_10002A1E8();
        }
        else {
          id v13 = *(id *)(v10 + 8 * i + 32);
        }
        id v14 = v13;
        id v15 = [v13 serviceType];
        sub_100029EF8();

        _s31HomeWidgetSingleAccessoryIntent11ServiceKindO8rawValueACSgSS_tcfC_0();
        unint64_t v16 = ServiceKind.rawValue.getter();
        uint64_t v18 = v17;
        if (v16 == ServiceKind.rawValue.getter() && v18 == v19)
        {
          swift_bridgeObjectRelease_n();
LABEL_17:
          sub_10002A238();
          sub_10002A268();
          sub_10002A278();
          sub_10002A248();
          continue;
        }
        char v21 = sub_10002A4D8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v21) {
          goto LABEL_17;
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v4 = v28;
      unint64_t v3 = v29;
      id v22 = v32;
      if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
        break;
      }
LABEL_32:
      if (((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000) != 0) {
        break;
      }
      if (_swiftEmptyArrayStorage[2]) {
        goto LABEL_34;
      }
LABEL_4:

      swift_release();
LABEL_5:
      unint64_t v5 = v31;
      if (v31 == v4) {
        goto LABEL_46;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_10002A2C8();
    swift_release();
    if (!v24) {
      goto LABEL_4;
    }
LABEL_34:
    if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000001) != 0)
    {
      sub_10002A1E8();
      swift_unknownObjectRelease();
      swift_release();
LABEL_36:
      sub_10002A238();
      sub_10002A268();
      sub_10002A278();
      sub_10002A248();
      goto LABEL_5;
    }
    uint64_t v23 = _swiftEmptyArrayStorage[2];
    swift_release();
    if (v23) {
      goto LABEL_36;
    }
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
LABEL_45:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_10002A2C8();
    swift_bridgeObjectRelease();
  }
LABEL_46:
  swift_bridgeObjectRelease();
  return _swiftEmptyArrayStorage;
}

void _s31HomeWidgetSingleAccessoryIntent19LockScreenDataModelC25homeManagerDidUpdateHomesyySo06HMHomeK0CF_0(void *a1)
{
  if (qword_100041638 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100029DD8();
  sub_1000138FC(v2, (uint64_t)qword_100041FC8);
  id v3 = a1;
  uint64_t v4 = sub_100029DB8();
  os_log_type_t v5 = sub_10002A128();
  if (!os_log_type_enabled(v4, v5))
  {

LABEL_22:
    sub_1000163B4();
    byte_100041FB0 = 1;
    return;
  }
  os_log_type_t v35 = v5;
  uint64_t v6 = swift_slowAlloc();
  id v34 = (void *)swift_slowAlloc();
  uint64_t v37 = swift_slowAlloc();
  *(_DWORD *)uint64_t v6 = 136315906;
  id v7 = [v3 currentHome];
  if (v7)
  {
    unint64_t v8 = v7;
    id v9 = [v7 name];

    uint64_t v10 = sub_100029EF8();
    unint64_t v12 = v11;
  }
  else
  {
    unint64_t v12 = 0xE400000000000000;
    uint64_t v10 = 1701736302;
  }
  sub_100014A04(v10, v12, &v37);
  sub_10002A148();

  swift_bridgeObjectRelease();
  *(_WORD *)(v6 + 12) = 2080;
  id v33 = v3;
  id v13 = [v3 homes];
  sub_100016EA4(0, (unint64_t *)&qword_100041BF8);
  unint64_t v14 = sub_10002A038();

  if (!(v14 >> 62))
  {
    uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v15) {
      goto LABEL_10;
    }
LABEL_20:
    swift_bridgeObjectRelease();
LABEL_21:
    uint64_t v26 = sub_10002A048();
    unint64_t v28 = v27;
    swift_bridgeObjectRelease();
    sub_100014A04(v26, v28, &v37);
    sub_10002A148();

    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 22) = 2112;
    unint64_t v29 = self;
    id v30 = [v29 mainThread];
    sub_10002A148();
    *id v34 = v30;
    *(_WORD *)(v6 + 32) = 2112;
    id v36 = [v29 currentThread];
    sub_10002A148();
    v34[1] = v36;
    sub_10000D9EC(&qword_100041BD0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_10002A2C8();
  swift_bridgeObjectRelease();
  if (!v15) {
    goto LABEL_20;
  }
LABEL_10:
  sub_100016228(0, v15 & ~(v15 >> 63), 0);
  if ((v15 & 0x8000000000000000) == 0)
  {
    uint64_t v31 = v6;
    id v32 = v4;
    uint64_t v16 = 0;
    do
    {
      if ((v14 & 0xC000000000000001) != 0) {
        id v17 = (id)sub_10002A1E8();
      }
      else {
        id v17 = *(id *)(v14 + 8 * v16 + 32);
      }
      uint64_t v18 = v17;
      id v19 = [v17 name:v31, v32];
      uint64_t v20 = sub_100029EF8();
      uint64_t v22 = v21;

      unint64_t v24 = _swiftEmptyArrayStorage[2];
      unint64_t v23 = _swiftEmptyArrayStorage[3];
      if (v24 >= v23 >> 1) {
        sub_100016228(v23 > 1, v24 + 1, 1);
      }
      ++v16;
      _swiftEmptyArrayStorage[2] = v24 + 1;
      uint64_t v25 = (char *)&_swiftEmptyArrayStorage[2 * v24];
      *((void *)v25 + 4) = v20;
      *((void *)v25 + 5) = v22;
    }
    while (v15 != v16);
    swift_bridgeObjectRelease();
    uint64_t v6 = v31;
    uint64_t v4 = v32;
    goto LABEL_21;
  }
  __break(1u);
}

uint64_t sub_100016E0C()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100016E44(uint64_t a1)
{
  sub_100014258(a1, *(char **)(v1 + 16), "User Home Sensing preference has been updated, current home is now '%s'");
}

uint64_t sub_100016E68(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100016E78()
{
  return swift_release();
}

void sub_100016E80(uint64_t a1)
{
  sub_100014258(a1, *(char **)(v1 + 16), "User Selected Home preference has been updated, current home is now '%s'");
}

uint64_t sub_100016EA4(uint64_t a1, unint64_t *a2)
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

uint64_t HMAccessory.subscript.getter()
{
  id v1 = [v0 services];
  sub_100017464();
  unint64_t v2 = sub_10002A038();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_10002A2C8();
    swift_bridgeObjectRelease();
    if (v3) {
      goto LABEL_3;
    }
LABEL_20:
    uint64_t result = swift_bridgeObjectRelease();
    if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
      goto LABEL_27;
    }
    goto LABEL_21;
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v3) {
    goto LABEL_20;
  }
LABEL_3:
  if (v3 < 1)
  {
    __break(1u);
    goto LABEL_31;
  }
  for (uint64_t i = 0; i != v3; ++i)
  {
    if ((v2 & 0xC000000000000001) != 0) {
      id v5 = (id)sub_10002A1E8();
    }
    else {
      id v5 = *(id *)(v2 + 8 * i + 32);
    }
    uint64_t v6 = v5;
    id v7 = [v5 serviceType];
    sub_100029EF8();

    _s31HomeWidgetSingleAccessoryIntent11ServiceKindO8rawValueACSgSS_tcfC_0();
    unint64_t v8 = ServiceKind.rawValue.getter();
    uint64_t v10 = v9;
    if (v8 == ServiceKind.rawValue.getter() && v10 == v11)
    {
      swift_bridgeObjectRelease_n();
LABEL_6:
      sub_10002A238();
      sub_10002A268();
      sub_10002A278();
      sub_10002A248();
      continue;
    }
    char v13 = sub_10002A4D8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v13) {
      goto LABEL_6;
    }
  }
  uint64_t result = swift_bridgeObjectRelease();
  if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) == 0)
  {
LABEL_21:
    if (((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000) != 0) {
      goto LABEL_27;
    }
    if (_swiftEmptyArrayStorage[2]) {
      goto LABEL_23;
    }
LABEL_28:
    swift_release();
    return 0;
  }
LABEL_27:
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_10002A2C8();
  uint64_t result = swift_release();
  if (!v17) {
    goto LABEL_28;
  }
LABEL_23:
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000001) != 0)
  {
LABEL_31:
    id v15 = (id)sub_10002A1E8();
LABEL_26:
    id v16 = v15;
    swift_release();
    return (uint64_t)v16;
  }
  if (_swiftEmptyArrayStorage[2])
  {
    id v15 = (id)_swiftEmptyArrayStorage[4];
    goto LABEL_26;
  }
  __break(1u);
  return result;
}

uint64_t HMAccessory.categoryType.getter()
{
  id v1 = [v0 category];
  id v2 = [v1 categoryType];

  uint64_t v3 = sub_100029EF8();
  return v3;
}

uint64_t HMAccessory.primaryServiceKind.getter()
{
  uint64_t v0 = (void *)HMAccessory.primaryHomeService.getter();
  id v1 = v0;
  if (v0)
  {
    id v2 = [v0 serviceType];

    sub_100029EF8();
  }
  LODWORD(result) = _s31HomeWidgetSingleAccessoryIntent11ServiceKindO8rawValueACSgSS_tcfC_0();
  if (result == 51) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t HMAccessory.primaryHomeService.getter()
{
  id v1 = [v0 services];
  sub_100017464();
  unint64_t v2 = sub_10002A038();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_10002A2C8();
    swift_bridgeObjectRelease();
    if (v3)
    {
LABEL_3:
      if (v3 < 1)
      {
        __break(1u);
        goto LABEL_26;
      }
      for (uint64_t i = 0; i != v3; ++i)
      {
        if ((v2 & 0xC000000000000001) != 0) {
          id v5 = (id)sub_10002A1E8();
        }
        else {
          id v5 = *(id *)(v2 + 8 * i + 32);
        }
        uint64_t v6 = v5;
        if ([v5 isPrimaryService])
        {
          sub_10002A238();
          sub_10002A268();
          sub_10002A278();
          sub_10002A248();
        }
        else
        {
        }
      }
      uint64_t result = swift_bridgeObjectRelease();
      if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
        goto LABEL_22;
      }
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
  }
  uint64_t result = swift_bridgeObjectRelease();
  if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
    goto LABEL_22;
  }
LABEL_16:
  if (((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000) != 0)
  {
LABEL_22:
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_10002A2C8();
    uint64_t result = swift_release();
    if (!v10) {
      goto LABEL_23;
    }
    goto LABEL_18;
  }
  if (!_swiftEmptyArrayStorage[2])
  {
LABEL_23:
    swift_release();
    return 0;
  }
LABEL_18:
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000001) != 0)
  {
LABEL_26:
    id v8 = (id)sub_10002A1E8();
    goto LABEL_21;
  }
  if (_swiftEmptyArrayStorage[2])
  {
    id v8 = (id)_swiftEmptyArrayStorage[4];
LABEL_21:
    id v9 = v8;
    swift_release();
    return (uint64_t)v9;
  }
  __break(1u);
  return result;
}

unint64_t sub_100017464()
{
  unint64_t result = qword_100041BF0;
  if (!qword_100041BF0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100041BF0);
  }
  return result;
}

uint64_t sub_1000174A4()
{
  uint64_t v0 = sub_100029DD8();
  sub_100017530(v0, qword_100041FC8);
  sub_1000138FC(v0, (uint64_t)qword_100041FC8);
  return sub_100029DC8();
}

uint64_t *sub_100017530(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t HMCharacteristic.characteristicKind.getter()
{
  id v1 = [v0 characteristicType];
  sub_100029EF8();

  LODWORD(result) = _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO8rawValueACSgSS_tcfC_0();
  if (result == 174) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t HMCharacteristic.description.getter()
{
  id v1 = v0;
  uint64_t v2 = sub_100029D88();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = (void *)0xE000000000000000;
  *(void *)&v38[0] = 0;
  *((void *)&v38[0] + 1) = 0xE000000000000000;
  sub_10002A1C8(17);
  long long v39 = v38[0];
  id v8 = [v0 service];
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 accessory];

    if (v10)
    {
      id v11 = [v10 home];

      if (v11)
      {
        id v12 = [v11 name];

        id v9 = (void *)sub_100029EF8();
        id v7 = v13;
      }
      else
      {
        id v9 = 0;
        id v7 = (void *)0xE000000000000000;
      }
    }
    else
    {
      id v9 = 0;
    }
  }
  v40._uint64_t countAndFlagsBits = (uint64_t)v9;
  v40._object = v7;
  sub_100029F48(v40);
  swift_bridgeObjectRelease();
  v41._uint64_t countAndFlagsBits = 58;
  v41._object = (void *)0xE100000000000000;
  sub_100029F48(v41);
  id v14 = [v1 service];
  if (v14
    && (id v15 = v14, v16 = [v14 accessory], v15, v16))
  {
    id v17 = [v16 name];

    uint64_t v18 = sub_100029EF8();
    uint64_t v20 = v19;
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v20 = (void *)0xE000000000000000;
  }
  v42._uint64_t countAndFlagsBits = v18;
  v42._object = v20;
  sub_100029F48(v42);
  swift_bridgeObjectRelease();
  v43._uint64_t countAndFlagsBits = 58;
  v43._object = (void *)0xE100000000000000;
  sub_100029F48(v43);
  v21._uint64_t countAndFlagsBits = (uint64_t)[v1 service];
  if (v21._countAndFlagsBits)
  {
    uint64_t countAndFlagsBits = (void *)v21._countAndFlagsBits;
    id v23 = [(id)v21._countAndFlagsBits serviceType];
    sub_100029EF8();

    char v24 = _s31HomeWidgetSingleAccessoryIntent11ServiceKindO8rawValueACSgSS_tcfC_0();
    if (v24 == 51) {
      char v25 = 0;
    }
    else {
      char v25 = v24;
    }
    v21._uint64_t countAndFlagsBits = ServiceKind.localizedDescription.getter(v25);
    object = v21._object;
  }
  else
  {
    object = (void *)0xE000000000000000;
  }
  v21._object = object;
  sub_100029F48(v21);
  swift_bridgeObjectRelease();
  v44._uint64_t countAndFlagsBits = 58;
  v44._object = (void *)0xE100000000000000;
  sub_100029F48(v44);
  id v27 = [v1 characteristicType];
  sub_100029EF8();

  unsigned int v28 = _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO8rawValueACSgSS_tcfC_0();
  if (v28 == 174) {
    uint64_t v29 = 0;
  }
  else {
    uint64_t v29 = v28;
  }
  if (qword_100041610 != -1) {
    swift_once();
  }
  uint64_t v30 = 0x6E776F6E6B6E75;
  uint64_t v31 = off_100041678;
  if (*((void *)off_100041678 + 2) && (unint64_t v32 = sub_10000A764(v29), (v33 & 1) != 0))
  {
    unint64_t v34 = v31[7] + (v32 << 6);
    uint64_t v30 = *(void *)(v34 + 8);
    os_log_type_t v35 = *(void **)(v34 + 16);
    swift_bridgeObjectRetain();
  }
  else
  {
    os_log_type_t v35 = (void *)0xE700000000000000;
  }
  v45._uint64_t countAndFlagsBits = v30;
  v45._object = v35;
  sub_100029F48(v45);
  swift_bridgeObjectRelease();
  v46._uint64_t countAndFlagsBits = 58;
  v46._object = (void *)0xE100000000000000;
  sub_100029F48(v46);
  if ([v1 value])
  {
    sub_10002A168();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v38, 0, sizeof(v38));
  }
  sub_10000D9EC(&qword_100041680);
  v47._uint64_t countAndFlagsBits = sub_100029F18();
  sub_100029F48(v47);
  swift_bridgeObjectRelease();
  v48._uint64_t countAndFlagsBits = 58;
  v48._object = (void *)0xE100000000000000;
  sub_100029F48(v48);
  id v36 = [v1 uniqueIdentifier];
  sub_100029D78();

  sub_100018D60();
  v49._uint64_t countAndFlagsBits = sub_10002A4C8();
  sub_100029F48(v49);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  return v39;
}

uint64_t HMCharacteristic.fetchedValue()(uint64_t a1)
{
  *(void *)(v2 + 120) = a1;
  *(void *)(v2 + 128) = v1;
  return _swift_task_switch(sub_100017B24, 0, 0);
}

uint64_t sub_100017B24()
{
  uint64_t v1 = (void *)v0[16];
  v0[2] = v0;
  v0[3] = sub_100017C18;
  uint64_t v2 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_100017E6C;
  v0[13] = &unk_10003C958;
  v0[14] = v2;
  [v1 readValueWithCompletionHandler:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100017C18()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 136) = v1;
  if (v1) {
    uint64_t v2 = sub_100017DBC;
  }
  else {
    uint64_t v2 = sub_100017D28;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100017D28()
{
  id v1 = [*(id *)(v0 + 128) value];
  uint64_t v2 = *(_OWORD **)(v0 + 120);
  if (v1)
  {
    sub_10002A168();
    swift_unknownObjectRelease();
  }
  else
  {
    *uint64_t v2 = 0u;
    v2[1] = 0u;
  }
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_100017DBC()
{
  swift_willThrow();
  swift_errorRelease();
  id v1 = [*(id *)(v0 + 128) value];
  uint64_t v2 = *(_OWORD **)(v0 + 120);
  if (v1)
  {
    sub_10002A168();
    swift_unknownObjectRelease();
  }
  else
  {
    *uint64_t v2 = 0u;
    v2[1] = 0u;
  }
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_100017E6C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    sub_10000D9EC(&qword_100041CA8);
    uint64_t v4 = swift_allocError();
    *uint64_t v5 = a2;
    id v6 = a2;
    return _swift_continuation_throwingResumeWithError(v2, v4);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return _swift_continuation_throwingResume(v7);
  }
}

double HMCharacteristic.cachedValue.getter@<D0>(_OWORD *a1@<X8>)
{
  if ([v1 value])
  {
    sub_10002A168();
    swift_unknownObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a1 = 0u;
    a1[1] = 0u;
  }
  return result;
}

uint64_t HMCharacteristic.BOOL.getter()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 48) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100018020;
  v2[15] = v1 + 16;
  v2[16] = v0;
  return _swift_task_switch(sub_100017B24, 0, 0);
}

uint64_t sub_100018020()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10001811C, 0, 0);
}

uint64_t sub_10001811C()
{
  if (*(void *)(v0 + 40))
  {
    if (swift_dynamicCast()) {
      uint64_t v1 = *(unsigned __int8 *)(v0 + 56);
    }
    else {
      uint64_t v1 = 2;
    }
  }
  else
  {
    sub_10000DA30(v0 + 16);
    uint64_t v1 = 2;
  }
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t HMCharacteristic.cachedBool.getter()
{
  if ([v0 value])
  {
    sub_10002A168();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v2, 0, sizeof(v2));
  }
  sub_100018DB8((uint64_t)v2, (uint64_t)v3);
  if (v4)
  {
    if (swift_dynamicCast()) {
      return LOBYTE(v2[0]);
    }
    else {
      return 2;
    }
  }
  else
  {
    sub_10000DA30((uint64_t)v3);
    return 2;
  }
}

uint64_t HMCharacteristic.int.getter()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 56) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100018324;
  v2[15] = v1 + 16;
  v2[16] = v0;
  return _swift_task_switch(sub_100017B24, 0, 0);
}

uint64_t sub_100018324()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100018420, 0, 0);
}

uint64_t sub_100018420()
{
  if (v0[5])
  {
    int v1 = swift_dynamicCast();
    if (v1) {
      uint64_t v2 = v0[6];
    }
    else {
      uint64_t v2 = 0;
    }
    uint64_t v3 = v1 ^ 1u;
  }
  else
  {
    sub_10000DA30((uint64_t)(v0 + 2));
    uint64_t v2 = 0;
    uint64_t v3 = 1;
  }
  uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v4(v2, v3);
}

uint64_t HMCharacteristic.cachedInt.getter()
{
  if ([v0 value])
  {
    sub_10002A168();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v2, 0, sizeof(v2));
  }
  sub_100018DB8((uint64_t)v2, (uint64_t)v3);
  if (v4)
  {
    if (swift_dynamicCast()) {
      return *(void *)&v2[0];
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_10000DA30((uint64_t)v3);
    return 0;
  }
}

uint64_t HMCharacteristic.float.getter()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 56) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100018638;
  v2[15] = v1 + 16;
  v2[16] = v0;
  return _swift_task_switch(sub_100017B24, 0, 0);
}

uint64_t sub_100018638()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100018734, 0, 0);
}

uint64_t sub_100018734()
{
  if (v0[5])
  {
    int v1 = swift_dynamicCast();
    if (v1) {
      uint64_t v2 = v0[6];
    }
    else {
      uint64_t v2 = 0;
    }
    uint64_t v3 = v1 ^ 1u;
  }
  else
  {
    sub_10000DA30((uint64_t)(v0 + 2));
    uint64_t v2 = 0;
    uint64_t v3 = 1;
  }
  uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v4(v2, v3);
}

uint64_t HMCharacteristic.cachedFloat.getter()
{
  if ([v0 value])
  {
    sub_10002A168();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v2, 0, sizeof(v2));
  }
  sub_100018DB8((uint64_t)v2, (uint64_t)v3);
  if (v4)
  {
    if (swift_dynamicCast()) {
      return *(void *)&v2[0];
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_10000DA30((uint64_t)v3);
    return 0;
  }
}

uint64_t HMCharacteristic.data.getter()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 64) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_10001894C;
  v2[15] = v1 + 16;
  v2[16] = v0;
  return _swift_task_switch(sub_100017B24, 0, 0);
}

uint64_t sub_10001894C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100018A48, 0, 0);
}

uint64_t sub_100018A48()
{
  if (v0[5])
  {
    int v1 = swift_dynamicCast();
    BOOL v2 = v1 == 0;
    if (v1) {
      uint64_t v3 = v0[6];
    }
    else {
      uint64_t v3 = 0;
    }
    if (v2) {
      unint64_t v4 = 0xF000000000000000;
    }
    else {
      unint64_t v4 = v0[7];
    }
  }
  else
  {
    sub_10000DA30((uint64_t)(v0 + 2));
    uint64_t v3 = 0;
    unint64_t v4 = 0xF000000000000000;
  }
  uint64_t v5 = (uint64_t (*)(uint64_t, unint64_t))v0[1];
  return v5(v3, v4);
}

uint64_t HMCharacteristic.tlv8.getter()
{
  BOOL v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 64) = v2;
  *BOOL v2 = v1;
  v2[1] = sub_100018BA4;
  v2[15] = v1 + 16;
  v2[16] = v0;
  return _swift_task_switch(sub_100017B24, 0, 0);
}

uint64_t sub_100018BA4()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100018E20, 0, 0);
}

uint64_t _sSo16HMCharacteristicC31HomeWidgetSingleAccessoryIntentE10cachedTLV810Foundation4DataVSgvg_0()
{
  if ([v0 value])
  {
    sub_10002A168();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v2, 0, sizeof(v2));
  }
  sub_100018DB8((uint64_t)v2, (uint64_t)v3);
  if (v4)
  {
    if (swift_dynamicCast()) {
      return *(void *)&v2[0];
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_10000DA30((uint64_t)v3);
    return 0;
  }
}

unint64_t sub_100018D60()
{
  unint64_t result = qword_100041C70;
  if (!qword_100041C70)
  {
    sub_100029D88();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041C70);
  }
  return result;
}

uint64_t sub_100018DB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000D9EC(&qword_100041680);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t HMService.serviceKind.getter()
{
  id v1 = [v0 serviceType];
  sub_100029EF8();

  LODWORD(result) = _s31HomeWidgetSingleAccessoryIntent11ServiceKindO8rawValueACSgSS_tcfC_0();
  if (result == 51) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t HMService.associatedServiceKind.getter()
{
  id v1 = [v0 associatedServiceType];
  if (!v1) {
    return 51;
  }
  BOOL v2 = v1;
  sub_100029EF8();

  LODWORD(result) = _s31HomeWidgetSingleAccessoryIntent11ServiceKindO8rawValueACSgSS_tcfC_0();
  if (result == 51) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t HMService.allRelevantCharacteristicKinds.getter()
{
  id v1 = [v0 serviceType];
  sub_100029EF8();

  char v2 = _s31HomeWidgetSingleAccessoryIntent11ServiceKindO8rawValueACSgSS_tcfC_0();
  if (v2 == 51) {
    char v2 = 0;
  }
  uint64_t v3 = ServiceKind.requiredCharacteristicKinds.getter(v2);
  id v4 = [v0 serviceType];
  sub_100029EF8();

  char v5 = _s31HomeWidgetSingleAccessoryIntent11ServiceKindO8rawValueACSgSS_tcfC_0();
  if (v5 == 51) {
    char v5 = 0;
  }
  uint64_t v6 = ServiceKind.optionalCharacteristicKinds.getter(v5);

  return sub_100018FD0((uint64_t)v6, (uint64_t)v3);
}

uint64_t sub_100018FD0(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  int64_t v3 = 0;
  uint64_t v15 = a2;
  uint64_t v4 = result + 56;
  uint64_t v5 = 1 << *(unsigned char *)(result + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(result + 56);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    int64_t v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v11 >= v8) {
      goto LABEL_23;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v11);
    ++v3;
    if (!v12)
    {
      int64_t v3 = v11 + 1;
      if (v11 + 1 >= v8) {
        goto LABEL_23;
      }
      unint64_t v12 = *(void *)(v4 + 8 * v3);
      if (!v12)
      {
        int64_t v3 = v11 + 2;
        if (v11 + 2 >= v8) {
          goto LABEL_23;
        }
        unint64_t v12 = *(void *)(v4 + 8 * v3);
        if (!v12)
        {
          int64_t v3 = v11 + 3;
          if (v11 + 3 >= v8) {
            goto LABEL_23;
          }
          unint64_t v12 = *(void *)(v4 + 8 * v3);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v3 << 6);
LABEL_5:
    uint64_t result = sub_10001A4B0(&v14, *(unsigned __int8 *)(*(void *)(v2 + 48) + v10));
  }
  int64_t v13 = v11 + 4;
  if (v13 >= v8)
  {
LABEL_23:
    swift_release();
    return v15;
  }
  unint64_t v12 = *(void *)(v4 + 8 * v13);
  if (v12)
  {
    int64_t v3 = v13;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v3 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v3 >= v8) {
      goto LABEL_23;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v3);
    ++v13;
    if (v12) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *HMService.subscript.getter()
{
  id v1 = [v0 characteristics];
  sub_10001B004();
  unint64_t v2 = sub_10002A038();

  if (v2 >> 62) {
    goto LABEL_19;
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_10002A2C8())
  {
    uint64_t v4 = 4;
    while (1)
    {
      id v5 = (v2 & 0xC000000000000001) != 0 ? (id)sub_10002A1E8() : *(id *)(v2 + 8 * v4);
      uint64_t v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      id v8 = [v5 characteristicType];
      sub_100029EF8();

      _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO8rawValueACSgSS_tcfC_0();
      unint64_t v9 = CharacteristicKind.rawValue.getter();
      uint64_t v11 = v10;
      if (v9 == CharacteristicKind.rawValue.getter() && v11 == v12)
      {
        swift_bridgeObjectRelease_n();
LABEL_16:
        swift_bridgeObjectRelease_n();
        return v6;
      }
      char v14 = sub_10002A4D8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v14) {
        goto LABEL_16;
      }

      ++v4;
      if (v7 == v3) {
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_19:
    swift_bridgeObjectRetain();
  }
LABEL_14:
  swift_bridgeObjectRelease_n();
  return 0;
}

uint64_t HMService.fetchedValue(for:)(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 48) = a2;
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = v2;
  return _swift_task_switch(sub_100019328, 0, 0);
}

uint64_t sub_100019328()
{
  id v1 = HMService.subscript.getter();
  v0[4] = v1;
  if (v1)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    v0[5] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_100019414;
    uint64_t v3 = v0[2];
    return HMCharacteristic.fetchedValue()(v3);
  }
  else
  {
    id v5 = (_OWORD *)v0[2];
    *id v5 = 0u;
    v5[1] = 0u;
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
}

uint64_t sub_100019414()
{
  id v1 = *(void **)(*v0 + 32);
  uint64_t v4 = *v0;
  swift_task_dealloc();

  uint64_t v2 = *(uint64_t (**)(void))(v4 + 8);
  return v2();
}

void HMService.cachedValue(for:)(_OWORD *a1@<X8>)
{
  uint64_t v2 = HMService.subscript.getter();
  if (v2)
  {
    uint64_t v3 = v2;
    if ([v2 value])
    {
      sub_10002A168();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v4, 0, sizeof(v4));
    }
    sub_100018DB8((uint64_t)v4, (uint64_t)a1);
  }
  else
  {
    *a1 = 0u;
    a1[1] = 0u;
  }
}

uint64_t HMService.BOOL(for:)(char a1)
{
  *(void *)(v2 + 48) = v1;
  *(unsigned char *)(v2 + 73) = a1;
  return _swift_task_switch(sub_1000195D4, 0, 0);
}

uint64_t sub_1000195D4()
{
  uint64_t v1 = HMService.subscript.getter();
  *(void *)(v0 + 56) = v1;
  if (v1)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 64) = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_1000196CC;
    return HMCharacteristic.fetchedValue()(v0 + 16);
  }
  else
  {
    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    sub_10000DA30(v0 + 16);
    uint64_t v4 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v4(2);
  }
}

uint64_t sub_1000196CC()
{
  uint64_t v1 = *(void **)(*(void *)v0 + 56);
  swift_task_dealloc();

  return _swift_task_switch(sub_1000197E0, 0, 0);
}

uint64_t sub_1000197E0()
{
  if (*(void *)(v0 + 40))
  {
    if (swift_dynamicCast()) {
      uint64_t v1 = *(unsigned __int8 *)(v0 + 72);
    }
    else {
      uint64_t v1 = 2;
    }
  }
  else
  {
    sub_10000DA30(v0 + 16);
    uint64_t v1 = 2;
  }
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

Swift::Bool_optional __swiftcall HMService.cachedBool(for:)(HomeWidgetSingleAccessoryIntent::CharacteristicKind a1)
{
  uint64_t v1 = HMService.subscript.getter();
  if (!v1)
  {
    long long v5 = 0u;
    long long v6 = 0u;
LABEL_10:
    sub_10000DA30((uint64_t)&v5);
    return (Swift::Bool_optional)2;
  }
  uint64_t v2 = v1;
  if ([v1 value])
  {
    sub_10002A168();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_100018DB8((uint64_t)v4, (uint64_t)&v5);

  if (!*((void *)&v6 + 1)) {
    goto LABEL_10;
  }
  if (swift_dynamicCast()) {
    return (Swift::Bool_optional)v4[0];
  }
  else {
    return (Swift::Bool_optional)2;
  }
}

uint64_t HMService.int(for:)(char a1)
{
  *(void *)(v2 + 56) = v1;
  *(unsigned char *)(v2 + 80) = a1;
  return _swift_task_switch(sub_100019978, 0, 0);
}

uint64_t sub_100019978()
{
  uint64_t v1 = HMService.subscript.getter();
  *(void *)(v0 + 64) = v1;
  if (v1)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_100019A74;
    return HMCharacteristic.fetchedValue()(v0 + 16);
  }
  else
  {
    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    sub_10000DA30(v0 + 16);
    uint64_t v4 = *(uint64_t (**)(void, uint64_t))(v0 + 8);
    return v4(0, 1);
  }
}

uint64_t sub_100019A74()
{
  uint64_t v1 = *(void **)(*(void *)v0 + 64);
  swift_task_dealloc();

  return _swift_task_switch(sub_100018420, 0, 0);
}

Swift::Int_optional __swiftcall HMService.cachedInt(for:)(HomeWidgetSingleAccessoryIntent::CharacteristicKind a1)
{
  uint64_t v1 = HMService.subscript.getter();
  if (!v1)
  {
    long long v7 = 0u;
    long long v8 = 0u;
LABEL_11:
    sub_10000DA30((uint64_t)&v7);
    Swift::Int v4 = 0;
    char v5 = 1;
    goto LABEL_12;
  }
  uint64_t v2 = v1;
  if ([v1 value])
  {
    sub_10002A168();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_100018DB8((uint64_t)v6, (uint64_t)&v7);

  if (!*((void *)&v8 + 1)) {
    goto LABEL_11;
  }
  int v3 = swift_dynamicCast();
  if (v3) {
    Swift::Int v4 = *(void *)&v6[0];
  }
  else {
    Swift::Int v4 = 0;
  }
  char v5 = v3 ^ 1;
LABEL_12:
  result.value = v4;
  result.is_nil = v5;
  return result;
}

uint64_t HMService.float(for:)(char a1)
{
  *(void *)(v2 + 56) = v1;
  *(unsigned char *)(v2 + 80) = a1;
  return _swift_task_switch(sub_100019C84, 0, 0);
}

uint64_t sub_100019C84()
{
  uint64_t v1 = HMService.subscript.getter();
  *(void *)(v0 + 64) = v1;
  if (v1)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_100019D80;
    return HMCharacteristic.fetchedValue()(v0 + 16);
  }
  else
  {
    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    sub_10000DA30(v0 + 16);
    Swift::Int v4 = *(uint64_t (**)(void, uint64_t))(v0 + 8);
    return v4(0, 1);
  }
}

uint64_t sub_100019D80()
{
  uint64_t v1 = *(void **)(*(void *)v0 + 64);
  swift_task_dealloc();

  return _swift_task_switch(sub_100018734, 0, 0);
}

Swift::Double_optional __swiftcall HMService.cachedFloat(for:)(HomeWidgetSingleAccessoryIntent::CharacteristicKind a1)
{
  uint64_t v1 = HMService.subscript.getter();
  if (!v1)
  {
    long long v6 = 0u;
    long long v7 = 0u;
LABEL_11:
    sub_10000DA30((uint64_t)&v6);
    char v4 = 0;
    goto LABEL_12;
  }
  uint64_t v2 = v1;
  if ([v1 value])
  {
    sub_10002A168();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_100018DB8((uint64_t)v5, (uint64_t)&v6);

  if (!*((void *)&v7 + 1)) {
    goto LABEL_11;
  }
  if (swift_dynamicCast()) {
    char v4 = v5[0];
  }
  else {
    char v4 = 0;
  }
LABEL_12:
  result.value = v3;
  result.is_nil = v4;
  return result;
}

uint64_t HMService.data(for:)(char a1)
{
  *(void *)(v2 + 64) = v1;
  *(unsigned char *)(v2 + 88) = a1;
  return _swift_task_switch(sub_100019F90, 0, 0);
}

uint64_t sub_100019F90()
{
  uint64_t v1 = HMService.subscript.getter();
  *(void *)(v0 + 72) = v1;
  if (v1)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 80) = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_10001A08C;
    return HMCharacteristic.fetchedValue()(v0 + 16);
  }
  else
  {
    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    sub_10000DA30(v0 + 16);
    char v4 = *(uint64_t (**)(void, unint64_t))(v0 + 8);
    return v4(0, 0xF000000000000000);
  }
}

uint64_t sub_10001A08C()
{
  uint64_t v1 = *(void **)(*(void *)v0 + 72);
  swift_task_dealloc();

  return _swift_task_switch(sub_100018A48, 0, 0);
}

uint64_t HMService.tlv8(for:)(char a1)
{
  *(void *)(v2 + 64) = v1;
  *(unsigned char *)(v2 + 88) = a1;
  return _swift_task_switch(sub_10001A1C8, 0, 0);
}

uint64_t sub_10001A1C8()
{
  uint64_t v1 = HMService.subscript.getter();
  *(void *)(v0 + 72) = v1;
  if (v1)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 80) = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_10001A2C4;
    return HMCharacteristic.fetchedValue()(v0 + 16);
  }
  else
  {
    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    sub_10000DA30(v0 + 16);
    char v4 = *(uint64_t (**)(void, unint64_t))(v0 + 8);
    return v4(0, 0xF000000000000000);
  }
}

uint64_t sub_10001A2C4()
{
  uint64_t v1 = *(void **)(*(void *)v0 + 72);
  swift_task_dealloc();

  return _swift_task_switch(sub_100018E20, 0, 0);
}

uint64_t _sSo9HMServiceC31HomeWidgetSingleAccessoryIntentE10cachedTLV83for10Foundation4DataVSgAC18CharacteristicKindO_tF_0()
{
  uint64_t v0 = HMService.subscript.getter();
  if (!v0)
  {
    long long v4 = 0u;
    long long v5 = 0u;
LABEL_11:
    sub_10000DA30((uint64_t)&v4);
    return 0;
  }
  uint64_t v1 = v0;
  if ([v0 value])
  {
    sub_10002A168();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  sub_100018DB8((uint64_t)v3, (uint64_t)&v4);

  if (!*((void *)&v5 + 1)) {
    goto LABEL_11;
  }
  if (swift_dynamicCast()) {
    return *(void *)&v3[0];
  }
  else {
    return 0;
  }
}

uint64_t sub_10001A4B0(unsigned char *a1, Swift::Int a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  sub_10002A548();
  CharacteristicKind.rawValue.getter();
  swift_bridgeObjectRetain();
  sub_100029F38();
  swift_bridgeObjectRelease();
  Swift::Int v7 = sub_10002A5A8();
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  if ((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    unint64_t v10 = CharacteristicKind.rawValue.getter();
    uint64_t v12 = v11;
    if (v10 == CharacteristicKind.rawValue.getter() && v12 == v13)
    {
LABEL_17:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      goto LABEL_18;
    }
    char v15 = sub_10002A4D8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v15)
    {
LABEL_7:
      swift_bridgeObjectRelease();
LABEL_18:
      uint64_t result = 0;
      LOBYTE(a2) = *(unsigned char *)(*(void *)(*v3 + 48) + v9);
      goto LABEL_19;
    }
    uint64_t v16 = ~v8;
    while (1)
    {
      unint64_t v9 = (v9 + 1) & v16;
      if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
        break;
      }
      unint64_t v17 = CharacteristicKind.rawValue.getter();
      uint64_t v19 = v18;
      if (v17 == CharacteristicKind.rawValue.getter() && v19 == v20) {
        goto LABEL_17;
      }
      char v22 = sub_10002A4D8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v22) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v25 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_10001A9A4(a2, v9, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v25;
  swift_bridgeObjectRelease();
  uint64_t result = 1;
LABEL_19:
  *a1 = a2;
  return result;
}

uint64_t sub_10001A6CC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_10000D9EC(&qword_100041CE8);
  uint64_t v3 = sub_10002A1A8();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
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
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      char v19 = *(unsigned char *)(*(void *)(v2 + 48) + v15);
      sub_10002A548();
      CharacteristicKind.rawValue.getter();
      sub_100029F38();
      swift_bridgeObjectRelease();
      uint64_t result = sub_10002A5A8();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(unsigned char *)(*(void *)(v4 + 48) + v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

Swift::Int sub_10001A9A4(Swift::Int result, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  char v6 = result;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0) {
    goto LABEL_22;
  }
  if (a3)
  {
    sub_10001A6CC();
  }
  else
  {
    if (v8 > v7)
    {
      uint64_t result = (Swift::Int)sub_10001ABCC();
LABEL_22:
      uint64_t v24 = *v4;
      *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
      *(unsigned char *)(*(void *)(v24 + 48) + a2) = v6;
      uint64_t v25 = *(void *)(v24 + 16);
      BOOL v26 = __OFADD__(v25, 1);
      uint64_t v27 = v25 + 1;
      if (!v26)
      {
        *(void *)(v24 + 16) = v27;
        return result;
      }
      __break(1u);
      goto LABEL_25;
    }
    sub_10001AD60();
  }
  uint64_t v9 = *v3;
  sub_10002A548();
  CharacteristicKind.rawValue.getter();
  sub_100029F38();
  swift_bridgeObjectRelease();
  uint64_t result = sub_10002A5A8();
  uint64_t v10 = -1 << *(unsigned char *)(v9 + 32);
  a2 = result & ~v10;
  if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
    goto LABEL_22;
  }
  unint64_t v11 = CharacteristicKind.rawValue.getter();
  uint64_t v13 = v12;
  if (v11 == CharacteristicKind.rawValue.getter() && v13 == v14)
  {
LABEL_25:
    swift_bridgeObjectRelease_n();
    goto LABEL_26;
  }
  char v16 = sub_10002A4D8();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v16 & 1) == 0)
  {
    uint64_t v17 = ~v10;
    do
    {
      a2 = (a2 + 1) & v17;
      if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
        goto LABEL_22;
      }
      unint64_t v18 = CharacteristicKind.rawValue.getter();
      uint64_t v20 = v19;
      if (v18 == CharacteristicKind.rawValue.getter() && v20 == v21) {
        goto LABEL_25;
      }
      char v23 = sub_10002A4D8();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
    }
    while ((v23 & 1) == 0);
  }
LABEL_26:
  uint64_t result = sub_10002A518();
  __break(1u);
  return result;
}

void *sub_10001ABCC()
{
  uint64_t v1 = v0;
  sub_10000D9EC(&qword_100041CE8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10002A198();
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
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
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

uint64_t sub_10001AD60()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_10000D9EC(&qword_100041CE8);
  uint64_t v3 = sub_10002A1A8();
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
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    char v19 = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    sub_10002A548();
    CharacteristicKind.rawValue.getter();
    sub_100029F38();
    swift_bridgeObjectRelease();
    uint64_t result = sub_10002A5A8();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(unsigned char *)(*(void *)(v4 + 48) + v13) = v19;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_10001B004()
{
  unint64_t result = qword_100041CB0;
  if (!qword_100041CB0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100041CB0);
  }
  return result;
}

id sub_10001B088()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler();
  return [super dealloc];
}

uint64_t sub_10001B0BC(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return _swift_task_switch(sub_10001B0DC, 0, 0);
}

uint64_t sub_10001B0DC()
{
  if (qword_100041638 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 24);
  uint64_t v2 = sub_100029DD8();
  sub_1000138FC(v2, (uint64_t)qword_100041FC8);
  id v3 = v1;
  uint64_t v4 = sub_100029DB8();
  os_log_type_t v5 = sub_10002A128();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = *(void **)(v0 + 24);
  if (v6)
  {
    unint64_t v8 = (uint8_t *)swift_slowAlloc();
    unint64_t v15 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v8 = 138412290;
    *(void *)(v0 + 16) = v7;
    id v9 = v7;
    sub_10002A148();
    void *v15 = v7;

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "HomeWidgets: SecurityAccessoryConfigurationIntentHandling -provideAccessoryOptionsCollection(for : %@)", v8, 0xCu);
    sub_10000D9EC(&qword_100041BD0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v10 = *(id *)(v0 + 32);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_10001B2F4;
  uint64_t v13 = *(void *)(v0 + 24);
  int64_t v12 = *(void **)(v0 + 32);
  return sub_10001F08C(v13, v12);
}

uint64_t sub_10001B2F4(uint64_t a1)
{
  id v3 = *(void **)(*v2 + 32);
  uint64_t v4 = *v2;
  *(void *)(v4 + 48) = a1;
  swift_task_dealloc();

  if (v1)
  {
    os_log_type_t v5 = *(uint64_t (**)(void))(v4 + 8);
    return v5();
  }
  else
  {
    return _swift_task_switch(sub_10001B444, 0, 0);
  }
}

uint64_t sub_10001B444()
{
  id v1 = [*(id *)(v0 + 48) sections];
  sub_10000D9EC(&qword_100041D88);
  unint64_t v2 = sub_10002A038();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_10002A2C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v3)
  {
    id v4 = *(id *)(v0 + 48);
  }
  else
  {
    sub_10000D9EC(&qword_100041D90);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_100033460;
    if (qword_100041640 != -1) {
      swift_once();
    }
    BOOL v6 = *(void **)(v0 + 48);
    uint64_t v7 = (void *)qword_100041CF0;
    *(void *)(v5 + 32) = qword_100041CF0;
    sub_10002A058();
    id v8 = objc_allocWithZone((Class)INObjectCollection);
    type metadata accessor for SecurityIntentAccessory();
    id v9 = v7;
    Class isa = sub_10002A028().super.isa;
    swift_bridgeObjectRelease();
    id v4 = [v8 initWithItems:isa, v5];
  }
  uint64_t v11 = *(uint64_t (**)(id))(v0 + 8);
  return v11(v4);
}

uint64_t sub_10001B78C(void *a1, void *aBlock, void *a3)
{
  _OWORD v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  id v7 = a3;
  id v8 = (void *)swift_task_alloc();
  v3[5] = v8;
  *id v8 = v3;
  v8[1] = sub_10001B868;
  v8[3] = v6;
  v8[4] = v7;
  return _swift_task_switch(sub_10001B0DC, 0, 0);
}

uint64_t sub_10001B868(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v2;
  id v6 = *(void **)(*v2 + 24);
  id v7 = *(void **)(*v2 + 16);
  uint64_t v8 = *v2;
  swift_task_dealloc();

  id v9 = *(void (***)(void, void, void))(v5 + 32);
  if (v3)
  {
    uint64_t v10 = (void *)sub_100029CB8();
    swift_errorRelease();
    ((void (**)(void, void, void *))v9)[2](v9, 0, v10);

    _Block_release(v9);
  }
  else
  {
    ((void (**)(void, void *, void))v9)[2](v9, a1, 0);
    _Block_release(v9);
  }
  uint64_t v11 = *(uint64_t (**)(void))(v8 + 8);
  return v11();
}

void sub_10001BA7C(uint64_t a1)
{
}

uint64_t sub_10001BA9C(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return _swift_task_switch(sub_10001BABC, 0, 0);
}

uint64_t sub_10001BABC()
{
  if (qword_100041638 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 24);
  uint64_t v2 = sub_100029DD8();
  sub_1000138FC(v2, (uint64_t)qword_100041FC8);
  id v3 = v1;
  id v4 = sub_100029DB8();
  os_log_type_t v5 = sub_10002A128();
  BOOL v6 = os_log_type_enabled(v4, v5);
  id v7 = *(void **)(v0 + 24);
  if (v6)
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    unint64_t v15 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    *(void *)(v0 + 16) = v7;
    id v9 = v7;
    sub_10002A148();
    void *v15 = v7;

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "HomeWidgets: ClimateSensorTypeConfigurationIntentHandling -provideClimateTypeOptionsCollection(for : %@)", v8, 0xCu);
    sub_10000D9EC(&qword_100041BD0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v10 = *(id *)(v0 + 32);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_10001BCD4;
  uint64_t v13 = *(void *)(v0 + 24);
  int64_t v12 = *(void **)(v0 + 32);
  return sub_10001F72C(v13, v12);
}

uint64_t sub_10001BCD4(uint64_t a1)
{
  id v3 = *(void **)(*v2 + 32);
  uint64_t v4 = *v2;
  *(void *)(v4 + 48) = a1;
  swift_task_dealloc();

  if (v1)
  {
    os_log_type_t v5 = *(uint64_t (**)(void))(v4 + 8);
    return v5();
  }
  else
  {
    return _swift_task_switch(sub_10001BE24, 0, 0);
  }
}

uint64_t sub_10001BE24()
{
  id v1 = [*(id *)(v0 + 48) sections];
  sub_10000D9EC(&qword_100041D88);
  unint64_t v2 = sub_10002A038();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_10002A2C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v3)
  {
    id v4 = *(id *)(v0 + 48);
  }
  else
  {
    sub_10000D9EC(&qword_100041D90);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_100033460;
    if (qword_100041648 != -1) {
      swift_once();
    }
    BOOL v6 = *(void **)(v0 + 48);
    uint64_t v7 = (void *)qword_100041CF8;
    *(void *)(v5 + 32) = qword_100041CF8;
    sub_10002A058();
    id v8 = objc_allocWithZone((Class)INObjectCollection);
    type metadata accessor for ClimateSensorIntentType();
    id v9 = v7;
    Class isa = sub_10002A028().super.isa;
    swift_bridgeObjectRelease();
    id v4 = [v8 initWithItems:isa, v5];
  }
  uint64_t v11 = *(uint64_t (**)(id))(v0 + 8);
  return v11(v4);
}

uint64_t sub_10001C16C(void *a1, void *aBlock, void *a3)
{
  _OWORD v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  id v7 = a3;
  id v8 = (void *)swift_task_alloc();
  v3[5] = v8;
  *id v8 = v3;
  v8[1] = sub_1000215BC;
  v8[3] = v6;
  v8[4] = v7;
  return _swift_task_switch(sub_10001BABC, 0, 0);
}

void sub_10001C2A4(uint64_t a1)
{
}

void sub_10001C2C4(uint64_t a1, void (*a2)(void), void *a3)
{
  a2(0);
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v5 = sub_100029EE8();
  NSString v6 = sub_100029EE8();
  id v7 = [v4 initWithIdentifier:v5 displayString:v6];

  *a3 = v7;
}

uint64_t sub_10001C35C@<X0>(void **a1@<X1>, unsigned __int8 *a2@<X0>, void *a3@<X8>)
{
  uint64_t v4 = v3;
  int v7 = *a2;
  if (qword_100041628 != -1) {
    goto LABEL_14;
  }
  while (1)
  {
    unint64_t v8 = (unint64_t)sub_100016518(v7, a1);
    unint64_t v9 = v8;
    if (v8 >> 62) {
      break;
    }
    uint64_t v10 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v10) {
      goto LABEL_16;
    }
LABEL_4:
    int64_t v18 = _swiftEmptyArrayStorage;
    a1 = &v18;
    sub_10002A258();
    if (v10 < 0)
    {
      __break(1u);
LABEL_19:

      uint64_t result = swift_release();
      __break(1u);
      return result;
    }
    unint64_t v15 = a3;
    uint64_t v11 = 0;
    a3 = (void *)(v9 & 0xC000000000000001);
    while (v10 != v11)
    {
      if (a3) {
        int64_t v12 = (void **)sub_10002A1E8();
      }
      else {
        int64_t v12 = (void **)*(id *)(v9 + 8 * v11 + 32);
      }
      a1 = v12;
      uint64_t v16 = v12;
      sub_10001C530(&v16, v7, &v17);
      if (v4) {
        goto LABEL_19;
      }
      uint64_t v4 = 0;
      ++v11;

      sub_10002A238();
      sub_10002A268();
      sub_10002A278();
      a1 = &v18;
      sub_10002A248();
      if (v10 == v11)
      {
        uint64_t v13 = v18;
        uint64_t result = swift_bridgeObjectRelease();
        a3 = v15;
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_14:
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_10002A2C8();
  swift_bridgeObjectRelease();
  if (v10) {
    goto LABEL_4;
  }
LABEL_16:
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v13 = _swiftEmptyArrayStorage;
LABEL_17:
  *a3 = v13;
  return result;
}

void sub_10001C530(void **a1@<X0>, char a2@<W1>, void *a3@<X8>)
{
  uint64_t v26 = a3;
  uint64_t v5 = sub_100029D88();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  unint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *a1;
  type metadata accessor for SecurityIntentAccessory();
  id v11 = [v10 uniqueIdentifier];
  sub_100029D78();

  sub_100029D58();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  id v12 = [v10 name];
  sub_100029EF8();

  id v13 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v14 = sub_100029EE8();
  swift_bridgeObjectRelease();
  NSString v15 = sub_100029EE8();
  swift_bridgeObjectRelease();
  id v16 = [v13 initWithIdentifier:v14 displayString:v15];

  ServiceKind.rawValue.getter();
  NSString v17 = sub_100029EE8();
  swift_bridgeObjectRelease();
  [v16 setServiceType:v17];

  id v18 = v16;
  id v19 = [v10 room];
  if (v19)
  {
    uint64_t v20 = v19;
    id v21 = [v19 name];

    sub_100029EF8();
  }
  else
  {
    sub_10001E170(a2);
    if (!v22)
    {
      NSString v23 = 0;
      goto LABEL_5;
    }
  }
  NSString v23 = sub_100029EE8();
  swift_bridgeObjectRelease();
LABEL_5:
  [v18 setSubtitleString:v23];

  id v24 = sub_10001EA14(a2);
  [v18 setDisplayImage:v24];

  *uint64_t v26 = v18;
}

uint64_t static SecurityIntentAccessory.== infix(_:_:)(void *a1, void *a2)
{
  id v3 = [a1 identifier];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_100029EF8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = [a2 identifier];
  if (v8)
  {
    unint64_t v9 = v8;
    uint64_t v10 = sub_100029EF8();
    uint64_t v12 = v11;

    if (v7)
    {
      if (v12)
      {
        if (v5 == v10 && v7 == v12)
        {
          swift_bridgeObjectRelease();
          char v14 = 1;
        }
        else
        {
          char v14 = sub_10002A4D8();
          swift_bridgeObjectRelease();
        }
        goto LABEL_18;
      }
      goto LABEL_13;
    }
    if (v12)
    {
      char v14 = 0;
      goto LABEL_18;
    }
  }
  else if (v7)
  {
LABEL_13:
    char v14 = 0;
LABEL_18:
    swift_bridgeObjectRelease();
    return v14 & 1;
  }
  char v14 = 1;
  return v14 & 1;
}

uint64_t sub_10001C908(void **a1, void **a2)
{
  return _s31HomeWidgetSingleAccessoryIntent08SecurityeD0C1loiySbAC_ACtFZ_0(*a1, *a2);
}

uint64_t sub_10001C920(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_1000215B8;
  return v6();
}

uint64_t sub_10001C9EC(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_1000215B8;
  return v7();
}

uint64_t sub_10001CAB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10002A0B8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_10002A0A8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100021228(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10002A098();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10001CC5C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10001CD38;
  return v6(a1);
}

uint64_t sub_10001CD38()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10001CE30(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = sub_100026E64(v2);
    *a1 = v2;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_10001CEAC(v6);
  return sub_10002A248();
}

void sub_10001CEAC(uint64_t *a1)
{
  uint64_t v3 = sub_100029DA8();
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v145 = (char *)&v122 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100029ED8();
  __chkstk_darwin(v6 - 8, v7);
  unsigned int v144 = (char *)&v122 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  Swift::Int v9 = a1[1];
  Swift::Int v10 = sub_10002A4B8(v9);
  if (v10 >= v9)
  {
    if (v9 < 0) {
      goto LABEL_154;
    }
    if (v9) {
      sub_10001D9E8(0, v9, 1, a1);
    }
    return;
  }
  if (v9 >= 0) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v9 + 1;
  }
  if (v9 < -1) {
    goto LABEL_162;
  }
  Swift::Int v12 = v10;
  uint64_t v140 = v1;
  uint64_t v124 = a1;
  if (v9 < 2)
  {
    NSString v15 = (char *)_swiftEmptyArrayStorage;
    uint64_t v146 = (uint64_t)_swiftEmptyArrayStorage;
    v132 = (char *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v9 != 1)
    {
      unint64_t v18 = _swiftEmptyArrayStorage[2];
LABEL_120:
      if (v18 >= 2)
      {
        uint64_t v115 = *v124;
        do
        {
          unint64_t v116 = v18 - 2;
          if (v18 < 2) {
            goto LABEL_149;
          }
          if (!v115) {
            goto LABEL_161;
          }
          uint64_t v117 = *(void *)&v15[16 * v116 + 32];
          uint64_t v118 = *(void *)&v15[16 * v18 + 24];
          uint64_t v119 = v140;
          sub_10001DABC((id *)(v115 + 8 * v117), (id *)(v115 + 8 * *(void *)&v15[16 * v18 + 16]), v115 + 8 * v118, v132);
          uint64_t v140 = v119;
          if (v119) {
            break;
          }
          if (v118 < v117) {
            goto LABEL_150;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            NSString v15 = sub_100026BB0((uint64_t)v15);
          }
          if (v116 >= *((void *)v15 + 2)) {
            goto LABEL_151;
          }
          uint64_t v120 = &v15[16 * v116 + 32];
          *(void *)uint64_t v120 = v117;
          *((void *)v120 + 1) = v118;
          unint64_t v121 = *((void *)v15 + 2);
          if (v18 > v121) {
            goto LABEL_152;
          }
          memmove(&v15[16 * v18 + 16], &v15[16 * v18 + 32], 16 * (v121 - v18));
          *((void *)v15 + 2) = v121 - 1;
          unint64_t v18 = v121 - 1;
        }
        while (v121 > 2);
      }
LABEL_131:
      swift_bridgeObjectRelease();
      *(void *)((v146 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_10002A058();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    uint64_t v13 = v11 >> 1;
    type metadata accessor for SecurityIntentAccessory();
    uint64_t v14 = sub_10002A078();
    *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10) = v13;
    v132 = (char *)((v14 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v146 = v14;
  }
  Swift::Int v16 = 0;
  uint64_t v17 = *a1;
  uint64_t v126 = *a1 + 16;
  Swift::Int v127 = v12;
  uint64_t v125 = v17 - 8;
  NSString v15 = (char *)_swiftEmptyArrayStorage;
  v139 = "door.garage.closed";
  uint64_t v142 = v17;
  Swift::Int v143 = "ategoryCapitalized";
  unint64_t v137 = 0x800000010002E060;
  unint64_t v138 = 0x800000010002E030;
  v136 = "HFUserFriendlyNameLocalizable";
  v134 = "DoorLock_CategoryCapitalized";
  unint64_t v135 = 0x800000010002E080;
  unint64_t v133 = 0x800000010002E0A0;
  Swift::Int v130 = v9;
LABEL_15:
  Swift::Int v19 = v16 + 1;
  Swift::Int v129 = v16;
  if (v16 + 1 < v9)
  {
    uint64_t v20 = *(void **)(v17 + 8 * v16);
    id v21 = *(id *)(v17 + 8 * v19);
    id v22 = v20;
    int v23 = _s31HomeWidgetSingleAccessoryIntent08SecurityeD0C1loiySbAC_ACtFZ_0(v21, v22);

    Swift::Int v19 = v16 + 2;
    if (v16 + 2 < v9)
    {
      id v24 = (id *)(v126 + 8 * v16);
      while (1)
      {
        uint64_t v25 = *(v24 - 1);
        id v26 = *v24;
        id v27 = v25;
        int v28 = _s31HomeWidgetSingleAccessoryIntent08SecurityeD0C1loiySbAC_ACtFZ_0(v26, v27);

        if ((v23 ^ v28)) {
          break;
        }
        ++v19;
        ++v24;
        if (v9 == v19)
        {
          Swift::Int v19 = v9;
          break;
        }
      }
      Swift::Int v16 = v129;
    }
    uint64_t v17 = v142;
    if (v23)
    {
      if (v19 < v16) {
        goto LABEL_155;
      }
      if (v16 < v19)
      {
        uint64_t v29 = (uint64_t *)(v125 + 8 * v19);
        Swift::Int v30 = v19;
        Swift::Int v31 = v16;
        unint64_t v32 = (uint64_t *)(v142 + 8 * v16);
        do
        {
          if (v31 != --v30)
          {
            if (!v17) {
              goto LABEL_160;
            }
            uint64_t v33 = *v32;
            *unint64_t v32 = *v29;
            *uint64_t v29 = v33;
          }
          ++v31;
          --v29;
          ++v32;
        }
        while (v31 < v30);
      }
    }
  }
  if (v19 >= v9) {
    goto LABEL_72;
  }
  if (__OFSUB__(v19, v16)) {
    goto LABEL_153;
  }
  if (v19 - v16 >= v127) {
    goto LABEL_72;
  }
  if (__OFADD__(v16, v127)) {
    goto LABEL_156;
  }
  if (v16 + v127 >= v9) {
    Swift::Int v34 = v9;
  }
  else {
    Swift::Int v34 = v16 + v127;
  }
  if (v34 >= v16)
  {
    if (v19 == v34) {
      goto LABEL_72;
    }
    uint64_t v123 = v15;
    uint64_t v35 = v125 + 8 * v19;
    Swift::Int v128 = v34;
LABEL_43:
    uint64_t v37 = *(void **)(v17 + 8 * v19);
    uint64_t v131 = v35;
    Swift::Int v141 = v19;
    while (1)
    {
      uint64_t v38 = *(void **)v35;
      id v39 = v37;
      id v40 = v38;
      id v41 = [v39 serviceType];
      if (v41)
      {
        Swift::String v42 = v41;
        sub_100029EF8();
      }
      int v43 = _s31HomeWidgetSingleAccessoryIntent11ServiceKindO8rawValueACSgSS_tcfC_0();
      if (v43 == 35 || v43 == 30 || v43 == 19)
      {
        sub_100029EC8();
        sub_100029D98();
        uint64_t v44 = sub_100029F08();
        unint64_t v46 = v45;
      }
      else
      {
        uint64_t v44 = 0;
        unint64_t v46 = 0xE000000000000000;
      }
      id v47 = [v40 serviceType];
      if (v47)
      {
        Swift::String v48 = v47;
        sub_100029EF8();
      }
      int v49 = _s31HomeWidgetSingleAccessoryIntent11ServiceKindO8rawValueACSgSS_tcfC_0();
      if (v49 == 35 || v49 == 30 || v49 == 19)
      {
        sub_100029EC8();
        sub_100029D98();
        uint64_t v50 = sub_100029F08();
        unint64_t v52 = v51;
        if (v44 != v50) {
          goto LABEL_61;
        }
      }
      else
      {
        unint64_t v52 = 0xE000000000000000;
        if (v44) {
          goto LABEL_61;
        }
      }
      if (v46 == v52)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_64;
      }
LABEL_61:
      if (sub_10002A4D8())
      {

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_67;
      }
      char v53 = sub_10002A4D8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v53 & 1) == 0)
      {

LABEL_41:
        Swift::Int v36 = v141;
        uint64_t v17 = v142;
LABEL_42:
        Swift::Int v19 = v36 + 1;
        uint64_t v35 = v131 + 8;
        Swift::Int v16 = v129;
        if (v19 != v128) {
          goto LABEL_43;
        }
        Swift::Int v19 = v128;
        NSString v15 = v123;
        Swift::Int v9 = v130;
LABEL_72:
        if (v19 < v16) {
          goto LABEL_148;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          NSString v15 = sub_1000269F4(0, *((void *)v15 + 2) + 1, 1, v15);
        }
        unint64_t v65 = *((void *)v15 + 2);
        unint64_t v64 = *((void *)v15 + 3);
        unint64_t v18 = v65 + 1;
        uint64_t v17 = v142;
        if (v65 >= v64 >> 1)
        {
          uint64_t v114 = sub_1000269F4((char *)(v64 > 1), v65 + 1, 1, v15);
          uint64_t v17 = v142;
          NSString v15 = v114;
        }
        *((void *)v15 + 2) = v18;
        uint64_t v66 = v15 + 32;
        uint64_t v67 = &v15[16 * v65 + 32];
        *(void *)uint64_t v67 = v16;
        *((void *)v67 + 1) = v19;
        if (v65)
        {
LABEL_78:
          unint64_t v68 = v18 - 1;
          if (v18 >= 4)
          {
            unint64_t v73 = &v66[16 * v18];
            uint64_t v74 = *((void *)v73 - 8);
            uint64_t v75 = *((void *)v73 - 7);
            BOOL v79 = __OFSUB__(v75, v74);
            uint64_t v76 = v75 - v74;
            if (v79) {
              goto LABEL_137;
            }
            uint64_t v78 = *((void *)v73 - 6);
            uint64_t v77 = *((void *)v73 - 5);
            BOOL v79 = __OFSUB__(v77, v78);
            uint64_t v71 = v77 - v78;
            char v72 = v79;
            if (v79) {
              goto LABEL_138;
            }
            unint64_t v80 = v18 - 2;
            uint64_t v81 = &v66[16 * v18 - 32];
            uint64_t v83 = *(void *)v81;
            uint64_t v82 = *((void *)v81 + 1);
            BOOL v79 = __OFSUB__(v82, v83);
            uint64_t v84 = v82 - v83;
            if (v79) {
              goto LABEL_140;
            }
            BOOL v79 = __OFADD__(v71, v84);
            uint64_t v85 = v71 + v84;
            if (v79) {
              goto LABEL_143;
            }
            if (v85 >= v76)
            {
              uint64_t v103 = &v66[16 * v68];
              uint64_t v105 = *(void *)v103;
              uint64_t v104 = *((void *)v103 + 1);
              BOOL v79 = __OFSUB__(v104, v105);
              uint64_t v106 = v104 - v105;
              if (v79) {
                goto LABEL_147;
              }
              BOOL v96 = v71 < v106;
            }
            else
            {
LABEL_91:
              if (v72) {
                goto LABEL_139;
              }
              unint64_t v80 = v18 - 2;
              uint64_t v86 = &v66[16 * v18 - 32];
              uint64_t v88 = *(void *)v86;
              uint64_t v87 = *((void *)v86 + 1);
              BOOL v89 = __OFSUB__(v87, v88);
              uint64_t v90 = v87 - v88;
              char v91 = v89;
              if (v89) {
                goto LABEL_142;
              }
              uint64_t v92 = &v66[16 * v68];
              uint64_t v94 = *(void *)v92;
              uint64_t v93 = *((void *)v92 + 1);
              BOOL v79 = __OFSUB__(v93, v94);
              uint64_t v95 = v93 - v94;
              if (v79) {
                goto LABEL_145;
              }
              if (__OFADD__(v90, v95)) {
                goto LABEL_146;
              }
              if (v90 + v95 < v71) {
                goto LABEL_103;
              }
              BOOL v96 = v71 < v95;
            }
            if (v96) {
              unint64_t v68 = v80;
            }
          }
          else
          {
            if (v18 == 3)
            {
              uint64_t v70 = *((void *)v15 + 4);
              uint64_t v69 = *((void *)v15 + 5);
              BOOL v79 = __OFSUB__(v69, v70);
              uint64_t v71 = v69 - v70;
              char v72 = v79;
              goto LABEL_91;
            }
            uint64_t v97 = *((void *)v15 + 4);
            uint64_t v98 = *((void *)v15 + 5);
            BOOL v79 = __OFSUB__(v98, v97);
            uint64_t v90 = v98 - v97;
            char v91 = v79;
LABEL_103:
            if (v91) {
              goto LABEL_141;
            }
            char v99 = &v66[16 * v68];
            uint64_t v101 = *(void *)v99;
            uint64_t v100 = *((void *)v99 + 1);
            BOOL v79 = __OFSUB__(v100, v101);
            uint64_t v102 = v100 - v101;
            if (v79) {
              goto LABEL_144;
            }
            if (v102 < v90) {
              goto LABEL_14;
            }
          }
          unint64_t v107 = v68 - 1;
          if (v68 - 1 >= v18)
          {
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
LABEL_154:
            __break(1u);
LABEL_155:
            __break(1u);
LABEL_156:
            __break(1u);
            break;
          }
          if (!v17) {
            goto LABEL_159;
          }
          uint64_t v108 = &v66[16 * v107];
          uint64_t v109 = *(void *)v108;
          uint64_t v110 = &v66[16 * v68];
          uint64_t v111 = *((void *)v110 + 1);
          uint64_t v112 = v140;
          sub_10001DABC((id *)(v17 + 8 * *(void *)v108), (id *)(v17 + 8 * *(void *)v110), v17 + 8 * v111, v132);
          uint64_t v140 = v112;
          if (v112) {
            goto LABEL_131;
          }
          if (v111 < v109) {
            goto LABEL_134;
          }
          if (v68 > *((void *)v15 + 2)) {
            goto LABEL_135;
          }
          *(void *)uint64_t v108 = v109;
          *(void *)&v66[16 * v107 + 8] = v111;
          unint64_t v113 = *((void *)v15 + 2);
          if (v68 >= v113) {
            goto LABEL_136;
          }
          unint64_t v18 = v113 - 1;
          memmove(&v66[16 * v68], v110 + 16, 16 * (v113 - 1 - v68));
          *((void *)v15 + 2) = v113 - 1;
          Swift::Int v9 = v130;
          uint64_t v17 = v142;
          if (v113 <= 2) {
            goto LABEL_14;
          }
          goto LABEL_78;
        }
        unint64_t v18 = 1;
LABEL_14:
        Swift::Int v16 = v19;
        if (v19 >= v9) {
          goto LABEL_120;
        }
        goto LABEL_15;
      }
LABEL_64:
      id v54 = [v39 displayString];
      uint64_t v55 = sub_100029EF8();
      uint64_t v57 = v56;

      id v58 = [v40 displayString];
      uint64_t v59 = sub_100029EF8();
      uint64_t v61 = v60;

      if (v55 == v59 && v57 == v61)
      {

        swift_bridgeObjectRelease_n();
        goto LABEL_41;
      }
      char v62 = sub_10002A4D8();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v62 & 1) == 0) {
        goto LABEL_41;
      }
LABEL_67:
      Swift::Int v36 = v141;
      uint64_t v17 = v142;
      if (!v142) {
        goto LABEL_158;
      }
      uint64_t v63 = *(void **)v35;
      uint64_t v37 = *(void **)(v35 + 8);
      *(void *)uint64_t v35 = v37;
      *(void *)(v35 + 8) = v63;
      v35 -= 8;
      if (v36 == ++v16) {
        goto LABEL_42;
      }
    }
  }
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  __break(1u);
LABEL_161:
  __break(1u);
LABEL_162:
  sub_10002A298();
  __break(1u);
}

void sub_10001D9E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = *a4;
    uint64_t v7 = *a4 + 8 * a3 - 8;
LABEL_5:
    uint64_t v8 = *(void **)(v6 + 8 * v4);
    uint64_t v9 = a1;
    uint64_t v10 = v7;
    while (1)
    {
      uint64_t v11 = *(void **)v10;
      id v12 = v8;
      id v13 = v11;
      char v14 = _s31HomeWidgetSingleAccessoryIntent08SecurityeD0C1loiySbAC_ACtFZ_0(v12, v13);

      if ((v14 & 1) == 0)
      {
LABEL_4:
        ++v4;
        v7 += 8;
        if (v4 == a2) {
          return;
        }
        goto LABEL_5;
      }
      if (!v6) {
        break;
      }
      NSString v15 = *(void **)v10;
      uint64_t v8 = *(void **)(v10 + 8);
      *(void *)uint64_t v10 = v8;
      *(void *)(v10 + 8) = v15;
      v10 -= 8;
      if (v4 == ++v9) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
}

uint64_t sub_10001DABC(id *a1, id *__src, unint64_t a3, char *a4)
{
  uint64_t v33 = a1;
  uint64_t v5 = __src;
  uint64_t v6 = (char *)__src - (char *)a1;
  uint64_t v7 = (char *)__src - (char *)a1 + 7;
  if ((char *)__src - (char *)a1 >= 0) {
    uint64_t v7 = (char *)__src - (char *)a1;
  }
  uint64_t v8 = v7 >> 3;
  uint64_t v9 = a3 - (void)__src;
  uint64_t v10 = a3 - (void)__src + 7;
  if ((uint64_t)(a3 - (void)__src) >= 0) {
    uint64_t v10 = a3 - (void)__src;
  }
  uint64_t v11 = v10 >> 3;
  unint64_t v32 = (void **)a4;
  if (v8 >= v10 >> 3)
  {
    if (v9 >= -7)
    {
      if (a4 != (char *)__src || &__src[v11] <= (id *)a4) {
        memmove(a4, __src, 8 * v11);
      }
      uint64_t v20 = &a4[8 * v11];
      Swift::Int v31 = v20;
      uint64_t v33 = v5;
      if (a1 < v5 && v9 >= 8)
      {
        id v21 = (id *)(a3 - 8);
        id v22 = v5;
        do
        {
          int v23 = v21 + 1;
          id v24 = *--v22;
          id v25 = *((id *)v20 - 1);
          id v26 = v24;
          char v27 = _s31HomeWidgetSingleAccessoryIntent08SecurityeD0C1loiySbAC_ACtFZ_0(v25, v26);

          if (v27)
          {
            if (v23 != v5 || v21 >= v5) {
              *id v21 = *v22;
            }
            uint64_t v33 = v22;
          }
          else
          {
            Swift::Int v31 = v20 - 8;
            if (v23 < (id *)v20 || v21 >= (id *)v20 || v23 != (id *)v20) {
              *id v21 = (id)*((void *)v20 - 1);
            }
            id v22 = v5;
            v20 -= 8;
          }
          if (v22 <= a1) {
            break;
          }
          --v21;
          uint64_t v5 = v22;
        }
        while (v20 > a4);
      }
      goto LABEL_43;
    }
  }
  else if (v6 >= -7)
  {
    if (a4 != (char *)a1 || &a1[v8] <= (id *)a4) {
      memmove(a4, a1, 8 * v8);
    }
    id v12 = (void **)&a4[8 * v8];
    Swift::Int v31 = (char *)v12;
    if ((unint64_t)v5 < a3 && v6 >= 8)
    {
      id v13 = (void **)a4;
      char v14 = a1;
      do
      {
        NSString v15 = *v13;
        id v16 = *v5;
        id v17 = v15;
        char v18 = _s31HomeWidgetSingleAccessoryIntent08SecurityeD0C1loiySbAC_ACtFZ_0(v16, v17);

        if (v18)
        {
          Swift::Int v19 = v5 + 1;
          if (v14 < v5 || v14 >= v19 || v14 != v5) {
            *char v14 = *v5;
          }
        }
        else
        {
          if (v14 != v13) {
            *char v14 = *v13;
          }
          unint64_t v32 = ++v13;
          Swift::Int v19 = v5;
        }
        ++v14;
        if (v13 >= v12) {
          break;
        }
        uint64_t v5 = v19;
      }
      while ((unint64_t)v19 < a3);
      uint64_t v33 = v14;
    }
LABEL_43:
    sub_100026AF0(&v33, &v32, &v31);
    return 1;
  }
  uint64_t result = sub_10002A308();
  __break(1u);
  return result;
}

uint64_t sub_10001DD80(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_10002A2C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_10002A2C8();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_10002A1F8();
    swift_bridgeObjectRelease();
    *uint64_t v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_100026BC4(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_10002A2C8();
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

  return sub_10002A058();
}

uint64_t (*sub_10001DF4C(uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_10001E068(v6, a2, a3);
  return sub_10001DFB4;
}

uint64_t (*sub_10001DFB8(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_10001E0E8(v6, a2, a3);
  return sub_10001DFB4;
}

void sub_10001E020(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t (*sub_10001E068(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_10002A1E8();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_1000215B4;
  }
  __break(1u);
  return result;
}

void (*sub_10001E0E8(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_10002A1E8();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_10001E168;
  }
  __break(1u);
  return result;
}

void sub_10001E168(id *a1)
{
}

uint64_t sub_10001E170(char a1)
{
  uint64_t v2 = sub_100029DA8();
  __chkstk_darwin(v2 - 8, v3);
  uint64_t v4 = sub_100029ED8();
  __chkstk_darwin(v4 - 8, v5);
  if (a1 == 35 || a1 == 30 || (uint64_t result = 0, a1 == 19))
  {
    sub_100029EC8();
    sub_100029D98();
    return sub_100029F08();
  }
  return result;
}

uint64_t _s31HomeWidgetSingleAccessoryIntent08SecurityeD0C1loiySbAC_ACtFZ_0(void *a1, void *a2)
{
  id v4 = [a1 serviceType];
  if (v4)
  {
    uint64_t v5 = v4;
    sub_100029EF8();
  }
  char v6 = _s31HomeWidgetSingleAccessoryIntent11ServiceKindO8rawValueACSgSS_tcfC_0();
  if (v6 == 51) {
    char v6 = 0;
  }
  uint64_t v7 = sub_10001E170(v6);
  if (v8) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = 0;
  }
  if (v8) {
    unint64_t v10 = v8;
  }
  else {
    unint64_t v10 = 0xE000000000000000;
  }
  id v11 = [a2 serviceType];
  if (v11)
  {
    uint64_t v12 = v11;
    sub_100029EF8();
  }
  char v13 = _s31HomeWidgetSingleAccessoryIntent11ServiceKindO8rawValueACSgSS_tcfC_0();
  if (v13 == 51) {
    char v13 = 0;
  }
  uint64_t v14 = sub_10001E170(v13);
  if (v15) {
    uint64_t v16 = v14;
  }
  else {
    uint64_t v16 = 0;
  }
  if (v15) {
    unint64_t v17 = v15;
  }
  else {
    unint64_t v17 = 0xE000000000000000;
  }
  if (v9 == v16 && v10 == v17)
  {
    swift_bridgeObjectRelease_n();
LABEL_29:
    id v21 = [a1 displayString];
    uint64_t v22 = sub_100029EF8();
    uint64_t v24 = v23;

    id v25 = [a2 displayString];
    uint64_t v26 = sub_100029EF8();
    uint64_t v28 = v27;

    if (v22 == v26 && v24 == v28) {
      char v19 = 0;
    }
    else {
      char v19 = sub_10002A4D8();
    }
    goto LABEL_33;
  }
  char v19 = 1;
  if ((sub_10002A4D8() & 1) == 0)
  {
    char v20 = sub_10002A4D8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v19 = 0;
    if ((v20 & 1) == 0) {
      return v19 & 1;
    }
    goto LABEL_29;
  }
LABEL_33:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v19 & 1;
}

unint64_t sub_10001E4F0()
{
  unint64_t result = qword_100041D00;
  if (!qword_100041D00)
  {
    type metadata accessor for SecurityIntentAccessory();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041D00);
  }
  return result;
}

uint64_t type metadata accessor for IntentHandler()
{
  return self;
}

void *sub_10001E56C(unint64_t a1, void *a2)
{
  uint64_t v33 = sub_100029D88();
  unint64_t v5 = *(void *)(v33 - 8);
  __chkstk_darwin(v33, v6);
  unint64_t v32 = (char *)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t result = _swiftEmptyArrayStorage;
  unint64_t v36 = (unint64_t)_swiftEmptyArrayStorage;
  uint64_t v35 = *(void *)(a1 + 16);
  if (v35)
  {
    void v30[2] = v2;
    uint64_t v9 = qword_100041628;
    swift_bridgeObjectRetain();
    if (v9 != -1) {
LABEL_33:
    }
      swift_once();
    uint64_t v10 = 0;
    v30[1] = a1;
    unint64_t v34 = a1 + 32;
    Swift::Int v31 = (void (**)(char *, uint64_t))(v5 + 8);
    while (1)
    {
      uint64_t v11 = v10 + 1;
      if (__OFADD__(v10, 1))
      {
LABEL_30:
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      char v12 = *(unsigned char *)(v34 + v10);
      id v13 = [a2 accessories];
      sub_100016EA4(0, &qword_100041BE8);
      unint64_t v5 = sub_10002A038();

      if (v5 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v14 = sub_10002A2C8();
        swift_bridgeObjectRelease();
        if (v14)
        {
LABEL_9:
          a1 = 0;
          unint64_t v15 = v5 & 0xC000000000000001;
          while (1)
          {
            if (v15)
            {
              swift_bridgeObjectRetain();
              id v16 = (id)sub_10002A1E8();
              swift_bridgeObjectRelease();
            }
            else
            {
              id v16 = *(id *)(v5 + 8 * a1 + 32);
            }
            unint64_t v17 = (void *)HMAccessory.subscript.getter();

            if (v17) {
              break;
            }
            unint64_t v18 = a1 + 1;
            if (__OFADD__(a1, 1))
            {
              __break(1u);
              goto LABEL_30;
            }
            ++a1;
            if (v18 == v14) {
              goto LABEL_4;
            }
          }
          if (v14 == a1) {
            goto LABEL_4;
          }
          if (v15)
          {
            sub_10002A1E8();
            swift_unknownObjectRelease();
            swift_bridgeObjectRelease();
          }
          else
          {
            if ((a1 & 0x8000000000000000) != 0) {
              goto LABEL_31;
            }
            unint64_t v19 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRelease();
            if (a1 >= v19) {
              goto LABEL_32;
            }
          }
          type metadata accessor for ClimateSensorIntentType();
          ServiceKind.rawValue.getter();
          ServiceKind.localizedDescription.getter(v12);
          id v20 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
          NSString v21 = sub_100029EE8();
          swift_bridgeObjectRelease();
          NSString v22 = sub_100029EE8();
          swift_bridgeObjectRelease();
          id v23 = [v20 initWithIdentifier:v21 displayString:v22];

          uint64_t v24 = self;
          ServiceKind.iconSymbolActivated.getter(v12);
          unint64_t v5 = (unint64_t)v23;
          NSString v25 = sub_100029EE8();
          swift_bridgeObjectRelease();
          id v26 = [v24 systemImageNamed:v25];

          [(id)v5 setDisplayImage:v26];
          id v27 = [a2 uniqueIdentifier];
          uint64_t v28 = v32;
          sub_100029D78();

          sub_100029D58();
          (*v31)(v28, v33);
          NSString v29 = sub_100029EE8();
          swift_bridgeObjectRelease();
          [(id)v5 setHomeIdentifier:v29];

          sub_10002A018();
          a1 = *(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (a1 >= *(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_10002A068();
          }
          sub_10002A088();
          sub_10002A058();
          goto LABEL_5;
        }
      }
      else
      {
        uint64_t v14 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v14) {
          goto LABEL_9;
        }
      }
LABEL_4:
      swift_bridgeObjectRelease();
LABEL_5:
      uint64_t v10 = v11;
      if (v11 == v35)
      {
        swift_bridgeObjectRelease();
        return (void *)v36;
      }
    }
  }
  return result;
}

id sub_10001EA14(char a1)
{
  if (a1 != 35 && a1 != 30 && a1 != 19) {
    return 0;
  }
  uint64_t v1 = self;
  NSString v2 = sub_100029EE8();
  id v3 = [v1 systemImageNamed:v2];

  return v3;
}

uint64_t sub_10001EB04(void **a1)
{
  uint64_t v7 = (uint64_t)_swiftEmptyArrayStorage;
  unsigned __int8 v6 = 19;
  sub_10001C35C(a1, &v6, &v5);
  sub_10001DD80(v5);
  unsigned __int8 v6 = 30;
  sub_10001C35C(a1, &v6, &v5);
  sub_10001DD80(v5);
  unsigned __int8 v6 = 35;
  sub_10001C35C(a1, &v6, &v5);
  sub_10001DD80(v5);
  if (v7 < 0 || (v7 & 0x4000000000000000) != 0)
  {
    unint64_t v4 = swift_bridgeObjectRetain();
    uint64_t v2 = (uint64_t)sub_1000259A4(v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = v7 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  uint64_t v7 = v2;
  sub_10001CE30(&v7);
  swift_bridgeObjectRelease();
  return v7;
}

void *sub_10001EC30(unint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = a1;
  if (a1 >> 62) {
    goto LABEL_12;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  id v5 = a2;
  if (v4)
  {
    while (1)
    {
      unint64_t result = (void *)sub_10002A258();
      if (v4 < 0) {
        break;
      }
      unint64_t v17 = v2;
      uint64_t v7 = 0;
      unint64_t v18 = v3 & 0xC000000000000001;
      unint64_t v8 = v3;
      while (v4 != v7)
      {
        if (v18) {
          id v9 = (id)sub_10002A1E8();
        }
        else {
          id v9 = *(id *)(v3 + 8 * v7 + 32);
        }
        uint64_t v10 = v9;
        ++v7;
        id v11 = v17;
        id v12 = [v10 name];
        sub_100029EF8();

        sub_10001EB04((void **)v10);
        id v13 = objc_allocWithZone((Class)INObjectSection);
        NSString v14 = sub_100029EE8();
        swift_bridgeObjectRelease();
        type metadata accessor for SecurityIntentAccessory();
        Class isa = sub_10002A028().super.isa;
        swift_bridgeObjectRelease();
        id v2 = [v13 initWithTitle:v14 items:isa];

        sub_10002A238();
        sub_10002A268();
        sub_10002A278();
        sub_10002A248();
        unint64_t v3 = v8;
        if (v4 == v7)
        {

          return _swiftEmptyArrayStorage;
        }
      }
      __break(1u);
LABEL_12:
      id v16 = v2;
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_10002A2C8();
      swift_bridgeObjectRelease();
      if (!v4) {
        goto LABEL_13;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_13:

    return _swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10001EE54(unint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = a1;
  if (a1 >> 62) {
    goto LABEL_12;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  id v5 = a2;
  if (v4)
  {
    while (1)
    {
      unint64_t result = (void *)sub_10002A258();
      if (v4 < 0) {
        break;
      }
      uint64_t v7 = 0;
      unint64_t v17 = v2;
      unint64_t v18 = v3 & 0xC000000000000001;
      unint64_t v19 = v3;
      while (v4 != v7)
      {
        if (v18) {
          id v8 = (id)sub_10002A1E8();
        }
        else {
          id v8 = *(id *)(v3 + 8 * v7 + 32);
        }
        id v9 = v8;
        ++v7;
        id v10 = v17;
        id v11 = [v9 name];
        sub_100029EF8();

        id v12 = v9;
        sub_10001E56C((unint64_t)&off_10003A690, v12);

        id v13 = objc_allocWithZone((Class)INObjectSection);
        NSString v14 = sub_100029EE8();
        swift_bridgeObjectRelease();
        type metadata accessor for ClimateSensorIntentType();
        Class isa = sub_10002A028().super.isa;
        swift_bridgeObjectRelease();
        [v13 initWithTitle:v14 items:isa];

        sub_10002A238();
        id v2 = (void *)_swiftEmptyArrayStorage[2];
        sub_10002A268();
        sub_10002A278();
        sub_10002A248();
        unint64_t v3 = v19;
        if (v4 == v7)
        {

          return _swiftEmptyArrayStorage;
        }
      }
      __break(1u);
LABEL_12:
      id v16 = v2;
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_10002A2C8();
      swift_bridgeObjectRelease();
      if (!v4) {
        goto LABEL_13;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_13:

    return _swiftEmptyArrayStorage;
  }
  return result;
}

uint64_t sub_10001F08C(uint64_t a1, void *a2)
{
  v2[4] = a1;
  v2[5] = a2;
  uint64_t v4 = swift_task_alloc();
  v2[6] = v4;
  *(void *)(v4 + 16) = a2;
  id v5 = a2;
  return _swift_task_switch(sub_10001F10C, 0, 0);
}

void sub_10001F10C()
{
  if (qword_100041638 != -1) {
    swift_once();
  }
  uint64_t v1 = (_UNKNOWN **)(v0 + 16);
  id v2 = *(void **)(v0 + 32);
  uint64_t v3 = sub_100029DD8();
  sub_1000138FC(v3, (uint64_t)qword_100041FC8);
  id v4 = v2;
  id v5 = sub_100029DB8();
  os_log_type_t v6 = sub_10002A128();
  BOOL v7 = os_log_type_enabled(v5, v6);
  id v8 = *(void **)(v0 + 32);
  uint64_t v40 = v0;
  if (v7)
  {
    id v39 = (_UNKNOWN **)(v0 + 16);
    id v9 = (void *)(v0 + 24);
    id v10 = (uint8_t *)swift_slowAlloc();
    id v11 = (void *)swift_slowAlloc();
    *(_DWORD *)id v10 = 138412290;
    *id v9 = v8;
    id v12 = v8;
    uint64_t v1 = v39;
    sub_10002A148();
    *id v11 = v8;

    _os_log_impl((void *)&_mh_execute_header, v5, v6, "HomeWidgets: ConfigurationIntentHandling -provideGenericOptionsCollection(for : %@)", v10, 0xCu);
    sub_10000D9EC(&qword_100041BD0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  if (qword_100041628 != -1) {
    swift_once();
  }
  id v13 = *(void **)(v40 + 40);
  id v14 = (id)sub_100014478();
  id v15 = v13;
  uint64_t v16 = (uint64_t)sub_10001EC30((unint64_t)v14, v15);

  swift_bridgeObjectRelease();
  if ((unint64_t)v16 >> 62)
  {
    if (v16 < 0) {
      id v14 = (id)v16;
    }
    else {
      id v14 = (id)(v16 & 0xFFFFFFFFFFFFFF8);
    }
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_10002A2C8();
    swift_bridgeObjectRelease();
    if (!v17) {
      goto LABEL_27;
    }
  }
  else
  {
    uint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v17) {
      goto LABEL_27;
    }
  }
  if (v17 < 1)
  {
    __break(1u);
    goto LABEL_45;
  }
  for (uint64_t i = 0; i != v17; ++i)
  {
    if ((v16 & 0xC000000000000001) != 0) {
      id v19 = (id)sub_10002A1E8();
    }
    else {
      id v19 = *(id *)(v16 + 8 * i + 32);
    }
    id v20 = v19;
    id v21 = [v19 items];
    type metadata accessor for SecurityIntentAccessory();
    unint64_t v22 = sub_10002A038();

    if (v22 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v23 = sub_10002A2C8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v23 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v23 < 1)
    {
    }
    else
    {
      sub_10002A238();
      sub_10002A268();
      sub_10002A278();
      sub_10002A248();
    }
  }
LABEL_27:
  swift_bridgeObjectRelease();
  uint64_t v1 = &_s10Foundation13__DataStorageC6_bytesSvSgvg_ptr;
  id v24 = objc_allocWithZone((Class)INObjectCollection);
  sub_10000D9EC(&qword_100041D88);
  Class isa = sub_10002A028().super.isa;
  swift_release();
  id v14 = [v24 initWithSections:isa];

  id v26 = [v14 sections];
  unint64_t v27 = sub_10002A038();

  if (v27 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v28 = sub_10002A2C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v28 = *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (!v28)
  {
    id v33 = objc_allocWithZone((Class)INObjectCollection);
    type metadata accessor for SecurityIntentAccessory();
    v34.super.Class isa = sub_10002A028().super.isa;
    goto LABEL_38;
  }
  if (v28 != 1)
  {
    v34.super.Class isa = *(Class *)(v40 + 40);
    goto LABEL_40;
  }
  id v29 = [v14 sections];
  uint64_t v16 = sub_10002A038();

  if (!((unint64_t)v16 >> 62))
  {
    if (*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_33;
    }
LABEL_46:

    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_47;
  }
LABEL_45:
  swift_bridgeObjectRetain();
  uint64_t v38 = sub_10002A2C8();
  swift_bridgeObjectRelease();
  if (!v38) {
    goto LABEL_46;
  }
LABEL_33:
  if ((v16 & 0xC000000000000001) == 0)
  {
    if (!*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v30 = *(id *)(v16 + 32);
    goto LABEL_36;
  }
LABEL_47:
  id v30 = (id)sub_10002A1E8();
LABEL_36:
  Swift::Int v31 = v30;
  swift_bridgeObjectRelease();
  id v32 = [v31 items];

  type metadata accessor for SecurityIntentAccessory();
  sub_10002A038();

  id v33 = objc_allocWithZone((Class)v1[293]);
  v34.super.Class isa = sub_10002A028().super.isa;
  swift_bridgeObjectRelease();
LABEL_38:
  uint64_t v35 = *(void **)(v40 + 40);
  id v36 = [v33 initWithItems:v34.super.isa];

  id v14 = v36;
LABEL_40:

  swift_task_dealloc();
  uint64_t v37 = *(void (**)(id))(v40 + 8);
  v37(v14);
}

uint64_t sub_10001F72C(uint64_t a1, void *a2)
{
  v2[4] = a1;
  v2[5] = a2;
  uint64_t v4 = swift_task_alloc();
  v2[6] = v4;
  *(void *)(v4 + 16) = a2;
  id v5 = a2;
  return _swift_task_switch(sub_10001F7AC, 0, 0);
}

void sub_10001F7AC()
{
  if (qword_100041638 != -1) {
    swift_once();
  }
  uint64_t v1 = (_UNKNOWN **)(v0 + 16);
  id v2 = *(void **)(v0 + 32);
  uint64_t v3 = sub_100029DD8();
  sub_1000138FC(v3, (uint64_t)qword_100041FC8);
  id v4 = v2;
  id v5 = sub_100029DB8();
  os_log_type_t v6 = sub_10002A128();
  BOOL v7 = os_log_type_enabled(v5, v6);
  id v8 = *(void **)(v0 + 32);
  uint64_t v40 = v0;
  if (v7)
  {
    id v39 = (_UNKNOWN **)(v0 + 16);
    id v9 = (void *)(v0 + 24);
    id v10 = (uint8_t *)swift_slowAlloc();
    id v11 = (void *)swift_slowAlloc();
    *(_DWORD *)id v10 = 138412290;
    *id v9 = v8;
    id v12 = v8;
    uint64_t v1 = v39;
    sub_10002A148();
    *id v11 = v8;

    _os_log_impl((void *)&_mh_execute_header, v5, v6, "HomeWidgets: ConfigurationIntentHandling -provideGenericOptionsCollection(for : %@)", v10, 0xCu);
    sub_10000D9EC(&qword_100041BD0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  if (qword_100041628 != -1) {
    swift_once();
  }
  id v13 = *(void **)(v40 + 40);
  id v14 = (id)sub_100014478();
  id v15 = v13;
  uint64_t v16 = (uint64_t)sub_10001EE54((unint64_t)v14, v15);

  swift_bridgeObjectRelease();
  if ((unint64_t)v16 >> 62)
  {
    if (v16 < 0) {
      id v14 = (id)v16;
    }
    else {
      id v14 = (id)(v16 & 0xFFFFFFFFFFFFFF8);
    }
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_10002A2C8();
    swift_bridgeObjectRelease();
    if (!v17) {
      goto LABEL_27;
    }
  }
  else
  {
    uint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v17) {
      goto LABEL_27;
    }
  }
  if (v17 < 1)
  {
    __break(1u);
    goto LABEL_45;
  }
  for (uint64_t i = 0; i != v17; ++i)
  {
    if ((v16 & 0xC000000000000001) != 0) {
      id v19 = (id)sub_10002A1E8();
    }
    else {
      id v19 = *(id *)(v16 + 8 * i + 32);
    }
    id v20 = v19;
    id v21 = [v19 items];
    type metadata accessor for ClimateSensorIntentType();
    unint64_t v22 = sub_10002A038();

    if (v22 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v23 = sub_10002A2C8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v23 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v23 < 1)
    {
    }
    else
    {
      sub_10002A238();
      sub_10002A268();
      sub_10002A278();
      sub_10002A248();
    }
  }
LABEL_27:
  swift_bridgeObjectRelease();
  uint64_t v1 = &_s10Foundation13__DataStorageC6_bytesSvSgvg_ptr;
  id v24 = objc_allocWithZone((Class)INObjectCollection);
  sub_10000D9EC(&qword_100041D88);
  Class isa = sub_10002A028().super.isa;
  swift_release();
  id v14 = [v24 initWithSections:isa];

  id v26 = [v14 sections];
  unint64_t v27 = sub_10002A038();

  if (v27 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v28 = sub_10002A2C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v28 = *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (!v28)
  {
    id v33 = objc_allocWithZone((Class)INObjectCollection);
    type metadata accessor for ClimateSensorIntentType();
    v34.super.Class isa = sub_10002A028().super.isa;
    goto LABEL_38;
  }
  if (v28 != 1)
  {
    v34.super.Class isa = *(Class *)(v40 + 40);
    goto LABEL_40;
  }
  id v29 = [v14 sections];
  uint64_t v16 = sub_10002A038();

  if (!((unint64_t)v16 >> 62))
  {
    if (*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_33;
    }
LABEL_46:

    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_47;
  }
LABEL_45:
  swift_bridgeObjectRetain();
  uint64_t v38 = sub_10002A2C8();
  swift_bridgeObjectRelease();
  if (!v38) {
    goto LABEL_46;
  }
LABEL_33:
  if ((v16 & 0xC000000000000001) == 0)
  {
    if (!*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v30 = *(id *)(v16 + 32);
    goto LABEL_36;
  }
LABEL_47:
  id v30 = (id)sub_10002A1E8();
LABEL_36:
  Swift::Int v31 = v30;
  swift_bridgeObjectRelease();
  id v32 = [v31 items];

  type metadata accessor for ClimateSensorIntentType();
  sub_10002A038();

  id v33 = objc_allocWithZone((Class)v1[293]);
  v34.super.Class isa = sub_10002A028().super.isa;
  swift_bridgeObjectRelease();
LABEL_38:
  uint64_t v35 = *(void **)(v40 + 40);
  id v36 = [v33 initWithItems:v34.super.isa];

  id v14 = v36;
LABEL_40:

  swift_task_dealloc();
  uint64_t v37 = *(void (**)(id))(v40 + 8);
  v37(v14);
}

uint64_t sub_10001FDCC()
{
  uint64_t v60 = sub_100029D88();
  uint64_t v0 = *(void **)(v60 - 8);
  __chkstk_darwin(v60, v1);
  uint64_t v59 = (char *)&v46 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100041628 != -1) {
    goto LABEL_57;
  }
LABEL_2:
  unint64_t v3 = sub_100014478();
  unint64_t v4 = v3;
  if (v3 >> 62)
  {
    id v44 = v50;
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_10002A2C8();
    swift_bridgeObjectRelease();
    if (!v5) {
      goto LABEL_59;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id v6 = v50;
    if (!v5) {
      goto LABEL_59;
    }
  }
  unint64_t v7 = 0;
  uint64_t v53 = 0;
  unint64_t v51 = v4 & 0xC000000000000001;
  unint64_t v47 = v4 + 32;
  uint64_t v48 = v5;
  unint64_t v57 = 0x800000010002DFF0;
  id v58 = (void (**)(char *, uint64_t))(v0 + 1);
  unint64_t v56 = 0x800000010002E010;
  unint64_t v49 = v4;
  do
  {
    unint64_t v52 = v7;
    if (v51) {
      id v8 = (id)sub_10002A1E8();
    }
    else {
      id v8 = *(id *)(v47 + 8 * v7);
    }
    id v54 = v8;
    uint64_t v9 = 0;
    uint64_t v65 = (uint64_t)_swiftEmptyArrayStorage;
    do
    {
      unint64_t v10 = *((unsigned __int8 *)&off_10003B318 + v9 + 32);
      unint64_t v11 = (unint64_t)sub_100016518(*((unsigned __int8 *)&off_10003B318 + v9 + 32), v54);
      unint64_t v12 = v11;
      if (v11 >> 62)
      {
        uint64_t v13 = sub_10002A2C8();
        if (!v13) {
          goto LABEL_33;
        }
LABEL_13:
        unint64_t v64 = _swiftEmptyArrayStorage;
        sub_10002A258();
        if ((v13 & 0x8000000000000000) == 0)
        {
          uint64_t v55 = v9;
          unint64_t v62 = v12 & 0xC000000000000001;
          type metadata accessor for SecurityIntentAccessory();
          Class ObjCClassFromMetadata = (Class)swift_getObjCClassFromMetadata();
          uint64_t v14 = 0;
          unint64_t v63 = v12;
          while (1)
          {
            if (v13 == v14)
            {
              __break(1u);
              goto LABEL_48;
            }
            id v18 = v62 ? (id)sub_10002A1E8() : *(id *)(v12 + 8 * v14 + 32);
            id v19 = v18;
            id v20 = [v18 uniqueIdentifier];
            id v21 = v59;
            sub_100029D78();

            sub_100029D58();
            (*v58)(v21, v60);
            id v22 = [v19 name];
            sub_100029EF8();

            id v23 = objc_allocWithZone(ObjCClassFromMetadata);
            NSString v24 = sub_100029EE8();
            swift_bridgeObjectRelease();
            NSString v25 = sub_100029EE8();
            swift_bridgeObjectRelease();
            id v26 = [v23 initWithIdentifier:v24 displayString:v25];

            ServiceKind.rawValue.getter();
            NSString v27 = sub_100029EE8();
            swift_bridgeObjectRelease();
            [v26 setServiceType:v27];

            id v28 = v26;
            id v29 = [v19 room];
            if (v29) {
              break;
            }
            sub_10001E170(v10);
            if (v32) {
              goto LABEL_24;
            }
            NSString v33 = 0;
            unint64_t v12 = v63;
LABEL_25:
            [v28 setSubtitleString:v33];

            if (v10 == 35 || v10 == 30 || v10 == 19)
            {
              id v15 = self;
              NSString v16 = sub_100029EE8();
              id v17 = [v15 systemImageNamed:v16];
            }
            else
            {
              id v17 = 0;
            }
            ++v14;
            [v28 setDisplayImage:v17];

            sub_10002A238();
            sub_10002A268();
            sub_10002A278();
            sub_10002A248();
            if (v13 == v14)
            {
              uint64_t v0 = v64;
              swift_bridgeObjectRelease();
              uint64_t v9 = v55;
              goto LABEL_10;
            }
          }
          id v30 = v29;
          id v31 = [v29 name];

          sub_100029EF8();
LABEL_24:
          unint64_t v12 = v63;
          NSString v33 = sub_100029EE8();
          swift_bridgeObjectRelease();
          goto LABEL_25;
        }
        __break(1u);
LABEL_56:
        __break(1u);
LABEL_57:
        swift_once();
        goto LABEL_2;
      }
      uint64_t v13 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v13) {
        goto LABEL_13;
      }
LABEL_33:
      swift_bridgeObjectRelease();
      uint64_t v0 = _swiftEmptyArrayStorage;
LABEL_10:
      ++v9;
      sub_10001DD80((unint64_t)v0);
    }
    while (v9 != 3);
    if (v65 < 0 || (v65 & 0x4000000000000000) != 0)
    {
      unint64_t v37 = swift_bridgeObjectRetain();
      uint64_t v34 = (uint64_t)sub_1000259A4(v37);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v34 = v65 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain();
    }
    unint64_t v10 = v49;
    uint64_t v65 = v34;
    uint64_t v35 = v53;
    sub_10001CE30(&v65);
    if (v35) {
      goto LABEL_65;
    }
    uint64_t v53 = 0;

    swift_bridgeObjectRelease();
    uint64_t v0 = (void *)v65;
    if (v65 < 0 || (v65 & 0x4000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v36 = sub_10002A2C8();
      swift_release();
    }
    else
    {
      uint64_t v36 = *(void *)(v65 + 16);
    }
    swift_release();
    if (v36)
    {
LABEL_48:
      if (v51)
      {
        uint64_t v38 = (void **)sub_10002A1E8();
LABEL_51:
        id v39 = v38;
        uint64_t v40 = sub_10001EB04(v38);

        if ((v40 & 0xC000000000000001) != 0) {
          goto LABEL_63;
        }
        if (!*(void *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_65:
          uint64_t result = swift_release();
          __break(1u);
          return result;
        }
        id v41 = *(id *)(v40 + 32);
      }
      else
      {
        if (v52 < *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          uint64_t v38 = (void **)*(id *)(v47 + 8 * v52);
          goto LABEL_51;
        }
        __break(1u);
LABEL_63:
        id v41 = (id)sub_10002A1E8();
      }
      id v42 = v41;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v43 = v50;

      goto LABEL_60;
    }
    unint64_t v7 = v52 + 1;
    if (__OFADD__(v52, 1)) {
      goto LABEL_56;
    }
  }
  while (v7 != v48);
LABEL_59:
  id v43 = v50;

  swift_bridgeObjectRelease();
  id v42 = 0;
LABEL_60:

  return (uint64_t)v42;
}

void sub_1000204F8()
{
  uint64_t v0 = sub_100029DA8();
  __chkstk_darwin(v0 - 8, v1);
  v65[2] = (char *)v65 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100029ED8();
  __chkstk_darwin(v3 - 8, v4);
  v65[1] = (char *)v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_100029D88();
  unint64_t v6 = *(void *)(v74 - 8);
  __chkstk_darwin(v74, v7);
  unint64_t v73 = (char *)v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100041628 != -1) {
    goto LABEL_82;
  }
LABEL_2:
  unint64_t v9 = sub_100014478();
  unint64_t v69 = v9;
  if (v9 >> 62)
  {
    id v64 = v71;
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_10002A2C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id v11 = v71;
  }
  id v12 = v71;
  if (v10)
  {
    unint64_t v13 = 0;
    unint64_t v68 = v69 & 0xC000000000000001;
    unint64_t v66 = v69 + 32;
    char v72 = (void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v67 = v10;
    while (1)
    {
      unint64_t v70 = v13;
      id v14 = v68 ? (id)sub_10002A1E8() : *(id *)(v66 + 8 * v13);
      id v75 = v14;
      uint64_t v15 = 0;
      unint64_t v83 = (unint64_t)_swiftEmptyArrayStorage;
      do
      {
        char v16 = *((unsigned char *)&off_10003B340 + v15 + 32);
        id v17 = [v75 accessories];
        sub_100016EA4(0, &qword_100041BE8);
        unint64_t v18 = sub_10002A038();

        if (v18 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v19 = sub_10002A2C8();
          swift_bridgeObjectRelease();
          if (!v19)
          {
LABEL_10:
            swift_bridgeObjectRelease();
            goto LABEL_11;
          }
        }
        else
        {
          uint64_t v19 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (!v19) {
            goto LABEL_10;
          }
        }
        unint64_t v20 = 0;
        unint64_t v79 = v18;
        unint64_t v80 = v18 & 0xC000000000000001;
        uint64_t v76 = v15;
        unint64_t v77 = v18 + 32;
        uint64_t v78 = v19;
        while (2)
        {
          if (v80)
          {
            swift_bridgeObjectRetain();
            id v21 = (id)sub_10002A1E8();
            swift_bridgeObjectRelease();
          }
          else
          {
            id v21 = *(id *)(v77 + 8 * v20);
          }
          id v22 = [v21 services];
          sub_100016EA4(0, (unint64_t *)&qword_100041BF0);
          unint64_t v23 = sub_10002A038();

          unint64_t v82 = (unint64_t)_swiftEmptyArrayStorage;
          if (!(v23 >> 62))
          {
            uint64_t v24 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
            if (!v24) {
              goto LABEL_38;
            }
LABEL_20:
            if (v24 < 1) {
              goto LABEL_70;
            }
            id v81 = v21;
            uint64_t v25 = 0;
LABEL_24:
            if ((v23 & 0xC000000000000001) != 0) {
              id v26 = (id)sub_10002A1E8();
            }
            else {
              id v26 = *(id *)(v23 + 8 * v25 + 32);
            }
            NSString v27 = v26;
            id v28 = [v26 serviceType];
            sub_100029EF8();

            _s31HomeWidgetSingleAccessoryIntent11ServiceKindO8rawValueACSgSS_tcfC_0();
            unint64_t v29 = ServiceKind.rawValue.getter();
            uint64_t v31 = v30;
            if (v29 != ServiceKind.rawValue.getter() || v31 != v32)
            {
              char v34 = sub_10002A4D8();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if (v34)
              {
LABEL_34:
                sub_10002A238();
                sub_10002A268();
                sub_10002A278();
                sub_10002A248();
              }
              else
              {
              }
              if (v24 == ++v25)
              {
                swift_bridgeObjectRelease();
                unint64_t v6 = v82;
                uint64_t v19 = v78;
                unint64_t v18 = v79;
                id v21 = v81;
                if ((v82 & 0x8000000000000000) == 0) {
                  goto LABEL_39;
                }
LABEL_44:
                swift_bridgeObjectRetain();
                uint64_t v36 = sub_10002A2C8();
                swift_release();
                if (v36) {
                  goto LABEL_45;
                }
LABEL_41:

                swift_release();
                if (__OFADD__(v20++, 1))
                {
                  __break(1u);
LABEL_70:
                  __break(1u);
                  goto LABEL_71;
                }
                if (v20 == v19)
                {
LABEL_48:
                  swift_bridgeObjectRelease();
                  goto LABEL_59;
                }
                continue;
              }
              goto LABEL_24;
            }
            swift_bridgeObjectRelease_n();
            goto LABEL_34;
          }
          break;
        }
        swift_bridgeObjectRetain();
        uint64_t v24 = sub_10002A2C8();
        swift_bridgeObjectRelease();
        if (v24) {
          goto LABEL_20;
        }
LABEL_38:
        swift_bridgeObjectRelease();
        unint64_t v6 = (unint64_t)_swiftEmptyArrayStorage;
        if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
          goto LABEL_44;
        }
LABEL_39:
        if ((v6 & 0x4000000000000000) != 0) {
          goto LABEL_44;
        }
        if (!*(void *)(v6 + 16)) {
          goto LABEL_41;
        }
LABEL_45:
        if ((v6 & 0xC000000000000001) == 0)
        {
          uint64_t v37 = *(void *)(v6 + 16);

          swift_release();
          if (v37)
          {
            if (v20 == v19) {
              goto LABEL_48;
            }
            goto LABEL_52;
          }
          __break(1u);
LABEL_79:
          __break(1u);
          goto LABEL_80;
        }
        sub_10002A1E8();

        swift_unknownObjectRelease();
        swift_release();
        if (v20 == v19) {
          goto LABEL_48;
        }
LABEL_52:
        if (v80)
        {
          sub_10002A1E8();
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_56;
        }
        if ((v20 & 0x8000000000000000) != 0) {
          goto LABEL_79;
        }
        unint64_t v6 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRelease();
        if (v20 >= v6)
        {
LABEL_80:
          __break(1u);
LABEL_81:
          __break(1u);
LABEL_82:
          swift_once();
          goto LABEL_2;
        }
LABEL_56:
        type metadata accessor for ClimateSensorIntentType();
        ServiceKind.rawValue.getter();
        ServiceKind.localizedDescription.getter(v16);
        id v38 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
        NSString v39 = sub_100029EE8();
        swift_bridgeObjectRelease();
        NSString v40 = sub_100029EE8();
        swift_bridgeObjectRelease();
        id v41 = [v38 initWithIdentifier:v39 displayString:v40];

        id v42 = self;
        ServiceKind.iconSymbolActivated.getter(v16);
        id v43 = v41;
        NSString v44 = sub_100029EE8();
        swift_bridgeObjectRelease();
        id v45 = [v42 systemImageNamed:v44];

        [v43 setDisplayImage:v45];
        id v46 = [v75 uniqueIdentifier];
        unint64_t v47 = v73;
        sub_100029D78();

        sub_100029D58();
        (*v72)(v47, v74);
        NSString v48 = sub_100029EE8();
        swift_bridgeObjectRelease();
        [v43 setHomeIdentifier:v48];

        sub_10002A018();
        if (*(void *)((v83 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v83 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_10002A068();
        }
        sub_10002A088();
        sub_10002A058();
LABEL_59:
        uint64_t v15 = v76;
LABEL_11:
        ++v15;
      }
      while (v15 != 3);
      unint64_t v6 = v83;

      if (v6 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v49 = sub_10002A2C8();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v49 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      if (v49) {
        break;
      }
      id v12 = v71;
      unint64_t v13 = v70 + 1;
      if (__OFADD__(v70, 1)) {
        goto LABEL_81;
      }
      if (v13 == v67) {
        goto LABEL_67;
      }
    }
LABEL_71:
    if (!v68)
    {
      if (v70 < *(void *)((v69 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        id v60 = *(id *)(v66 + 8 * v70);
        goto LABEL_74;
      }
      __break(1u);
LABEL_86:
      sub_10002A1E8();
LABEL_77:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      NSString v58 = v71;
      NSString v59 = v71;
      goto LABEL_68;
    }
    id v60 = (id)sub_10002A1E8();
LABEL_74:
    id v61 = v60;
    unint64_t v62 = (unint64_t)sub_10001E56C((unint64_t)&off_10003B368, v61);

    if ((v62 & 0xC000000000000001) != 0) {
      goto LABEL_86;
    }
    if (*(void *)((v62 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v63 = *(id *)(v62 + 32);
      goto LABEL_77;
    }
    __break(1u);
  }
  else
  {
LABEL_67:
    id v50 = v12;

    swift_bridgeObjectRelease();
    type metadata accessor for ClimateSensorIntentType();
    sub_100016EA4(0, (unint64_t *)&qword_100041BF0);
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    unint64_t v52 = self;
    id v53 = [v52 bundleForClass:ObjCClassFromMetadata];
    NSString v54 = sub_100029EE8();
    id v55 = [v52 bundleWithIdentifier:v54];

    sub_100029EC8();
    id v56 = v53;
    sub_100029D98();
    sub_100029F08();

    id v57 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    NSString v58 = sub_100029EE8();
    NSString v59 = sub_100029EE8();
    swift_bridgeObjectRelease();
    [v57 initWithIdentifier:v58 displayString:v59];
LABEL_68:
  }
}

uint64_t sub_100020FE0()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1000215B8;
  unint64_t v6 = (uint64_t (*)(void *, void *, void *))((char *)&dword_100041D38 + dword_100041D38);
  return v6(v2, v3, v4);
}

uint64_t sub_100021098()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1000215B8;
  unint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100041D48 + dword_100041D48);
  return v6(v2, v3, v4);
}

uint64_t sub_10002115C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  unint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1000215B8;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100041D58 + dword_100041D58);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_100021228(uint64_t a1)
{
  uint64_t v2 = sub_10000D9EC(&qword_100041D30);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100021288()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000212C0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100021378;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100041D68 + dword_100041D68);
  return v6(a1, v4);
}

uint64_t sub_100021378()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100021470()
{
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000214B8()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_100021378;
  unint64_t v6 = (uint64_t (*)(void *, void *, void *))((char *)&dword_100041D98 + dword_100041D98);
  return v6(v2, v3, v4);
}

uint64_t sub_100021574()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t String.serviceKind.getter()
{
  swift_bridgeObjectRetain();
  LODWORD(result) = _s31HomeWidgetSingleAccessoryIntent11ServiceKindO8rawValueACSgSS_tcfC_0();
  if (result == 51) {
    return 0;
  }
  else {
    return result;
  }
}

void *ServiceKind.requiredCharacteristicKinds.getter(char a1)
{
  uint64_t v2 = &off_10003A6B8;
  switch(a1)
  {
    case 1:
      goto LABEL_4;
    case 2:
      uint64_t v2 = &off_10003A6E0;
LABEL_4:
      uint64_t result = (void *)sub_100023814((uint64_t)v2);
      break;
    case 3:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003A708);
      break;
    case 4:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003A730);
      break;
    case 5:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003A758);
      break;
    case 7:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003A780);
      break;
    case 9:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003A7A8);
      break;
    case 10:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003A7D0);
      break;
    case 11:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003A7F8);
      break;
    case 14:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003A820);
      break;
    case 15:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003A848);
      break;
    case 16:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003A870);
      break;
    case 17:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003A898);
      break;
    case 18:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003A8C0);
      break;
    case 19:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003A8E8);
      break;
    case 20:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003A910);
      break;
    case 21:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003A938);
      break;
    case 22:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003A960);
      break;
    case 24:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003A988);
      break;
    case 26:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003A9B0);
      break;
    case 27:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003A9D8);
      break;
    case 28:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003AA00);
      break;
    case 29:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003AA28);
      break;
    case 30:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003AA50);
      break;
    case 31:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003AA78);
      break;
    case 32:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003AAA0);
      break;
    case 33:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003AAC8);
      break;
    case 34:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003AAF0);
      break;
    case 35:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003AB18);
      break;
    case 36:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003AB40);
      break;
    case 37:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003AB68);
      break;
    case 38:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003AB90);
      break;
    case 40:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003ABB8);
      break;
    case 41:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003ABE0);
      break;
    case 42:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003AC08);
      break;
    case 43:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003AC30);
      break;
    case 44:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003AC58);
      break;
    case 45:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003AC80);
      break;
    case 46:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003ACA8);
      break;
    case 47:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003ACD0);
      break;
    case 49:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003ACF8);
      break;
    case 50:
      uint64_t result = (void *)sub_100023814((uint64_t)&off_10003AD20);
      break;
    default:
      uint64_t result = &_swiftEmptySetSingleton;
      break;
  }
  return result;
}

void *ServiceKind.optionalCharacteristicKinds.getter(char a1)
{
  char v1 = a1 - 1;
  if (a1 - 1) <= 0x31u && ((0x373BFFEBFE719uLL >> v1)) {
    return (void *)sub_100023814((uint64_t)off_10003CB18[v1]);
  }
  else {
    return &_swiftEmptySetSingleton;
  }
}

unint64_t ServiceKind.rawValue.getter()
{
  return 0xD000000000000024;
}

uint64_t ServiceKind.localizedDescription.getter(char a1)
{
  uint64_t v2 = sub_100029DA8();
  __chkstk_darwin(v2 - 8, v3);
  uint64_t v4 = sub_100029ED8();
  __chkstk_darwin(v4 - 8, v5);
  sub_100017464();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v7 = self;
  id v8 = [v7 bundleForClass:ObjCClassFromMetadata];
  NSString v9 = sub_100029EE8();
  id v10 = [v7 bundleWithIdentifier:v9];

  switch(a1)
  {
    case 1:
    case 2:
    case 7:
    case 13:
    case 20:
    case 21:
    case 23:
    case 28:
    case 44:
      sub_100029EC8();
      sub_100029D98();
      uint64_t v11 = sub_100029F08();

      break;
    case 3:
    case 4:
    case 5:
    case 6:
    case 8:
    case 9:
    case 10:
    case 11:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 22:
    case 24:
    case 25:
    case 26:
    case 27:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
      sub_100029EC8();
      id v12 = v8;
      sub_100029D98();
      uint64_t v11 = sub_100029F08();

      break;
    case 12:

      uint64_t v11 = 0x6C616E7265746E49;
      break;
    default:

      uint64_t v11 = 0;
      break;
  }
  return v11;
}

unint64_t ServiceKind.iconSymbolActivated.getter(char a1)
{
  unint64_t result = 0xD000000000000019;
  switch(a1)
  {
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0x6964656D2E697161;
      break;
    case 5:
      unint64_t result = 0xD000000000000016;
      break;
    case 6:
    case 7:
    case 8:
      unint64_t result = 0x69662E6F65646976;
      break;
    case 10:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 11:
      unint64_t result = 0xD000000000000013;
      break;
    case 14:
      unint64_t result = 0xD000000000000013;
      break;
    case 15:
      unint64_t result = 0xD000000000000013;
      break;
    case 16:
    case 48:
      unint64_t result = 0x6564616C626E6166;
      break;
    case 17:
    case 26:
      unint64_t result = 0x6C69662E706F7264;
      break;
    case 18:
      unint64_t result = 1684957559;
      break;
    case 19:
      unint64_t result = 0xD000000000000010;
      break;
    case 20:
    case 46:
      unint64_t result = 0x656D6F6D72656874;
      break;
    case 21:
      unint64_t result = 0xD000000000000011;
      break;
    case 22:
      unint64_t result = 0x79746964696D7568;
      break;
    case 24:
    case 47:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 27:
    case 37:
      unint64_t result = 0xD000000000000022;
      break;
    case 28:
      unint64_t result = 0x6C7562746867696CLL;
      break;
    case 29:
    case 30:
      unint64_t result = 7955819;
      break;
    case 31:
      unint64_t result = 0x6C6C69662E63696DLL;
      break;
    case 32:
    case 33:
      unint64_t result = 0xD000000000000014;
      break;
    case 34:
      unint64_t result = 0x756C707265776F70;
      break;
    case 35:
      unint64_t result = 0xD000000000000015;
      break;
    case 38:
      unint64_t result = 0x2E72656B61657073;
      break;
    case 41:
      unint64_t result = 0xD000000000000014;
      break;
    case 44:
      unint64_t result = 30324;
      break;
    case 45:
      unint64_t result = 0xD000000000000012;
      break;
    case 49:
      unint64_t result = 0xD000000000000014;
      break;
    case 50:
      unint64_t result = 0xD000000000000011;
      break;
    default:
      return result;
  }
  return result;
}

_UNKNOWN **static ServiceKind.allCases.getter()
{
  return &off_10003B390;
}

uint64_t sub_100022894()
{
  ServiceKind.rawValue.getter();
  uint64_t v1 = v0;
  ServiceKind.rawValue.getter();
  if (v1 == v2) {
    char v3 = 1;
  }
  else {
    char v3 = sub_10002A4D8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

Swift::Int sub_100022920()
{
  return sub_10002A5A8();
}

uint64_t sub_100022984()
{
  ServiceKind.rawValue.getter();
  sub_100029F38();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000229D8()
{
  return sub_10002A5A8();
}

uint64_t sub_100022A38@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s31HomeWidgetSingleAccessoryIntent11ServiceKindO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

unint64_t sub_100022A68@<X0>(void *a1@<X8>)
{
  unint64_t result = ServiceKind.rawValue.getter();
  *a1 = 0xD000000000000024;
  a1[1] = v3;
  return result;
}

void sub_100022A9C(void *a1@<X8>)
{
  *a1 = &off_10003B390;
}

uint64_t sub_100022AAC()
{
  return sub_100029FF8();
}

uint64_t sub_100022B0C()
{
  return sub_100029FD8();
}

uint64_t ServiceKind.allRelevantCharacteristicKinds.getter(char a1)
{
  uint64_t v2 = ServiceKind.requiredCharacteristicKinds.getter(a1);
  uint64_t v3 = ServiceKind.optionalCharacteristicKinds.getter(a1);

  return sub_100018FD0((uint64_t)v3, (uint64_t)v2);
}

uint64_t sub_100022BA0()
{
  return ServiceKind.localizedDescription.getter(*v0);
}

uint64_t ServiceKind.pluralLocalizedDescription.getter(char a1)
{
  uint64_t v2 = sub_100029DA8();
  __chkstk_darwin(v2 - 8, v3);
  uint64_t v4 = sub_100029ED8();
  __chkstk_darwin(v4 - 8, v5);
  uint64_t result = 0x6C616E7265746E49;
  switch(a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
      sub_100029EC8();
      sub_100029D98();
      uint64_t result = sub_100029F08();
      break;
    case 12:
      return result;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

unint64_t ServiceKind.iconSymbol.getter(char a1)
{
  unint64_t result = 0xD000000000000019;
  switch(a1)
  {
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0x6964656D2E697161;
      break;
    case 5:
      unint64_t result = 0xD000000000000016;
      break;
    case 6:
    case 7:
    case 8:
      unint64_t result = 0x69662E6F65646976;
      break;
    case 10:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 11:
      unint64_t result = 0xD000000000000013;
      break;
    case 14:
      unint64_t result = 0xD000000000000015;
      break;
    case 15:
      unint64_t result = 0xD000000000000013;
      break;
    case 16:
      unint64_t result = 0x6564616C626E6166;
      break;
    case 17:
    case 26:
      unint64_t result = 0x6C69662E706F7264;
      break;
    case 18:
      unint64_t result = 1684957559;
      break;
    case 19:
      unint64_t result = 0xD000000000000012;
      break;
    case 20:
    case 46:
      unint64_t result = 0x656D6F6D72656874;
      break;
    case 21:
      unint64_t result = 0xD000000000000011;
      break;
    case 22:
      unint64_t result = 0x79746964696D7568;
      break;
    case 24:
    case 47:
      unint64_t result = 0x656C6B6E69727073;
      break;
    case 27:
    case 37:
      unint64_t result = 0xD000000000000022;
      break;
    case 28:
      unint64_t result = 0x6C7562746867696CLL;
      break;
    case 29:
    case 30:
      unint64_t result = 7955819;
      break;
    case 31:
      unint64_t result = 0x6C6C69662E63696DLL;
      break;
    case 32:
    case 33:
      unint64_t result = 0xD000000000000014;
      break;
    case 34:
      unint64_t result = 0x756C707265776F70;
      break;
    case 35:
      unint64_t result = 0xD000000000000015;
      break;
    case 38:
      unint64_t result = 0xD000000000000013;
      break;
    case 41:
      unint64_t result = 0xD000000000000014;
      break;
    case 44:
      unint64_t result = 30324;
      break;
    case 45:
      unint64_t result = 0xD000000000000012;
      break;
    case 48:
      unint64_t result = 0x6564616C626E6166;
      break;
    case 49:
      unint64_t result = 0xD000000000000016;
      break;
    case 50:
      unint64_t result = 0xD000000000000013;
      break;
    default:
      return result;
  }
  return result;
}

_UNKNOWN **ServiceKind.umbrellaCategories.getter(char a1)
{
  if ((a1 - 3) > 0x2Fu) {
    return (_UNKNOWN **)&_swiftEmptyArrayStorage;
  }
  else {
    return off_10003CCA8[(char)(a1 - 3)];
  }
}

uint64_t ServiceKind.togglingCharacteristicKind.getter(unsigned __int8 a1)
{
  int v1 = a1 - 3;
  uint64_t result = 3;
  switch(v1)
  {
    case 0:
    case 13:
    case 14:
    case 17:
    case 18:
    case 21:
    case 39:
    case 41:
    case 44:
    case 45:
      return result;
    case 25:
    case 31:
    case 38:
      uint64_t result = 105;
      break;
    case 28:
    case 35:
      uint64_t result = 84;
      break;
    default:
      uint64_t result = 174;
      break;
  }
  return result;
}

uint64_t _s31HomeWidgetSingleAccessoryIntent11ServiceKindO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_10002A4F8();
  swift_bridgeObjectRelease();
  if (v0 >= 0x33) {
    return 51;
  }
  else {
    return v0;
  }
}

Swift::Int sub_100023814(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_10000D9EC(&qword_100041CE8);
    uint64_t v3 = sub_10002A1B8();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v29 = v1;
    uint64_t v30 = a1 + 32;
    while (1)
    {
      char v6 = *(unsigned char *)(v30 + v4);
      sub_10002A548();
      CharacteristicKind.rawValue.getter();
      sub_100029F38();
      swift_bridgeObjectRelease();
      Swift::Int result = sub_10002A5A8();
      uint64_t v8 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v9 = result & ~v8;
      unint64_t v10 = v9 >> 6;
      uint64_t v11 = *(void *)(v5 + 8 * (v9 >> 6));
      uint64_t v12 = 1 << v9;
      if (((1 << v9) & v11) != 0)
      {
        unint64_t v13 = CharacteristicKind.rawValue.getter();
        uint64_t v15 = v14;
        if (v13 == CharacteristicKind.rawValue.getter() && v15 == v16)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
          goto LABEL_4;
        }
        char v18 = sub_10002A4D8();
        swift_bridgeObjectRelease();
        Swift::Int result = swift_bridgeObjectRelease();
        if (v18) {
          goto LABEL_4;
        }
        uint64_t v19 = ~v8;
        while (1)
        {
          unint64_t v9 = (v9 + 1) & v19;
          unint64_t v10 = v9 >> 6;
          uint64_t v11 = *(void *)(v5 + 8 * (v9 >> 6));
          uint64_t v12 = 1 << v9;
          if ((v11 & (1 << v9)) == 0) {
            break;
          }
          unint64_t v20 = CharacteristicKind.rawValue.getter();
          uint64_t v22 = v21;
          if (v20 == CharacteristicKind.rawValue.getter() && v22 == v23) {
            goto LABEL_3;
          }
          char v25 = sub_10002A4D8();
          swift_bridgeObjectRelease();
          Swift::Int result = swift_bridgeObjectRelease();
          if (v25) {
            goto LABEL_4;
          }
        }
      }
      *(void *)(v5 + 8 * v10) = v12 | v11;
      *(unsigned char *)(*(void *)(v3 + 48) + v9) = v6;
      uint64_t v26 = *(void *)(v3 + 16);
      BOOL v27 = __OFADD__(v26, 1);
      uint64_t v28 = v26 + 1;
      if (v27)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v28;
LABEL_4:
      if (++v4 == v29) {
        return v3;
      }
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

unint64_t sub_100023A30()
{
  unint64_t result = qword_100041DC8;
  if (!qword_100041DC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041DC8);
  }
  return result;
}

unint64_t sub_100023A88()
{
  unint64_t result = qword_100041DD0;
  if (!qword_100041DD0)
  {
    sub_1000102D4(&qword_100041DD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041DD0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ServiceKind(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xCE) {
    goto LABEL_17;
  }
  if (a2 + 50 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 50) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 50;
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
      return (*a1 | (v4 << 8)) - 50;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 50;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x33;
  int v8 = v6 - 51;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ServiceKind(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 50 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 50) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xCE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xCD)
  {
    unsigned int v6 = ((a2 - 206) >> 8) + 1;
    *unint64_t result = a2 + 50;
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
        JUMPOUT(0x100023C40);
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
          *unint64_t result = a2 + 50;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ServiceKind()
{
  return &type metadata for ServiceKind;
}

unint64_t sub_100023C78()
{
  unint64_t result = qword_100041DE0;
  if (!qword_100041DE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041DE0);
  }
  return result;
}

void *UmbrellaCategory.climate.unsafeMutableAddressor()
{
  return &static UmbrellaCategory.climate;
}

void *UmbrellaCategory.securityAndAccess.unsafeMutableAddressor()
{
  return &static UmbrellaCategory.securityAndAccess;
}

void *UmbrellaCategory.water.unsafeMutableAddressor()
{
  return &static UmbrellaCategory.water;
}

void *UmbrellaCategory.lightsAndSwitches.unsafeMutableAddressor()
{
  return &static UmbrellaCategory.lightsAndSwitches;
}

void *UmbrellaCategory.blinds.unsafeMutableAddressor()
{
  return &static UmbrellaCategory.blinds;
}

void *UmbrellaCategory.speakersAndTelevisions.unsafeMutableAddressor()
{
  return &static UmbrellaCategory.speakersAndTelevisions;
}

uint64_t static UmbrellaCategory.speakersAndTelevisions.getter()
{
  return 16;
}

uint64_t static UmbrellaCategory.water.getter()
{
  return 32;
}

void sub_100023D24()
{
  static UmbrellaCategory.allCategories = (uint64_t)&off_10003BA78;
}

uint64_t *UmbrellaCategory.allCategories.unsafeMutableAddressor()
{
  if (qword_100041650 != -1) {
    swift_once();
  }
  return &static UmbrellaCategory.allCategories;
}

uint64_t static UmbrellaCategory.allCategories.getter()
{
  if (qword_100041650 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_100023DE0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_100024778(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t UmbrellaCategory.iconColorBase.getter(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      uint64_t result = static Color.gray.getter();
      break;
    case 2:
      uint64_t result = static Color.purple.getter();
      break;
    case 4:
      uint64_t result = static Color.yellow.getter();
      break;
    case 8:
      uint64_t result = static Color.teal.getter();
      break;
    case 16:
      uint64_t result = static Color.green.getter();
      break;
    case 32:
      uint64_t result = static Color.cyan.getter();
      break;
    default:
      uint64_t result = static Color.black.getter();
      break;
  }
  return result;
}

uint64_t UmbrellaCategory.localizedDescription.getter(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  uint64_t result = 0x73646E696C42;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 0x6574616D696C43;
      break;
    case 3:
      uint64_t result = 0x746867694CLL;
      break;
    case 7:
      uint64_t result = 0x7974697275636553;
      break;
    case 15:
      uint64_t result = 0x7372656B61657053;
      break;
    case 31:
      uint64_t result = 0x7265746157;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t UmbrellaCategory.pluralLocalizedDescription.getter(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  uint64_t result = 0x73646E696C42;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 0x6574616D696C43;
      break;
    case 3:
      uint64_t result = 0x73746867694CLL;
      break;
    case 7:
      uint64_t result = 0x7974697275636553;
      break;
    case 15:
      uint64_t result = 0x7372656B61657053;
      break;
    case 31:
      uint64_t result = 0x7265746157;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t UmbrellaCategory.accessoryLocalizedDescription.getter(uint64_t a1)
{
  uint64_t v2 = sub_100029DA8();
  __chkstk_darwin(v2 - 8, v3);
  uint64_t v4 = sub_100029ED8();
  __chkstk_darwin(v4 - 8, v5);
  uint64_t result = 0x73646E696C42;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      uint64_t result = 0xD000000000000011;
      break;
    case 4:
      sub_100029EC8();
      sub_100029D98();
      uint64_t result = sub_100029F08();
      break;
    case 8:
      uint64_t result = 0xD000000000000012;
      break;
    case 16:
      uint64_t result = 0x2072656B61657053;
      break;
    case 32:
      uint64_t result = 0x65766C6156;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t UmbrellaCategory.accessoryPluralLocalizedDescription.getter(uint64_t a1)
{
  uint64_t v2 = sub_100029DA8();
  __chkstk_darwin(v2 - 8, v3);
  uint64_t v4 = sub_100029ED8();
  __chkstk_darwin(v4 - 8, v5);
  uint64_t result = 0x73646E696C42;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      uint64_t result = 0xD000000000000013;
      break;
    case 4:
      sub_100029EC8();
      sub_100029D98();
      uint64_t result = sub_100029F08();
      break;
    case 8:
      uint64_t result = 0xD000000000000014;
      break;
    case 16:
      uint64_t result = 0x7372656B61657053;
      break;
    case 32:
      uint64_t result = 0x7365766C6156;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

unint64_t sub_100024608()
{
  unint64_t result = qword_100041DE8;
  if (!qword_100041DE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041DE8);
  }
  return result;
}

unint64_t sub_100024660()
{
  unint64_t result = qword_100041DF0;
  if (!qword_100041DF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041DF0);
  }
  return result;
}

unint64_t sub_1000246B8()
{
  unint64_t result = qword_100041DF8;
  if (!qword_100041DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041DF8);
  }
  return result;
}

unint64_t sub_100024710()
{
  unint64_t result = qword_100041E00;
  if (!qword_100041E00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041E00);
  }
  return result;
}

ValueMetadata *type metadata accessor for UmbrellaCategory()
{
  return &type metadata for UmbrellaCategory;
}

uint64_t sub_100024778(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

void *AppPreferences.homeSensingDefaultsChangedNotification.unsafeMutableAddressor()
{
  return &static AppPreferences.homeSensingDefaultsChangedNotification;
}

uint64_t sub_1000247BC(void *a1)
{
  uint64_t v2 = sub_100029D88();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v5 = __chkstk_darwin(v2, v4);
  BOOL v7 = (char *)&v83 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5, v8);
  unint64_t v10 = (char *)&v83 - v9;
  uint64_t v11 = sub_10000D9EC(&qword_100041E08);
  uint64_t v13 = __chkstk_darwin(v11 - 8, v12);
  uint64_t v15 = (char *)&v83 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13, v16);
  char v18 = (char *)&v83 - v17;
  id v19 = [a1 homes];
  sub_100026E24();
  uint64_t v20 = sub_10002A038();

  uint64_t v87 = v10;
  if (v20 < 0 || (v20 & 0x4000000000000000) != 0)
  {
    unint64_t v76 = swift_bridgeObjectRetain();
    uint64_t v21 = (uint64_t)sub_1000259E0(v76, (void (*)(void))sub_100026E24, &qword_100041E18, &qword_100041E10, (uint64_t (*)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))sub_10001DF4C);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v21 = v20 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  uint64_t v22 = (void *)v3;
  BOOL v89 = v21;
  uint64_t v23 = 0;
  sub_1000258EC((uint64_t *)&v89);
  uint64_t v85 = v7;
  swift_bridgeObjectRelease();
  uint64_t v24 = (uint64_t)v89;
  if (sub_100026E78()) {
    goto LABEL_7;
  }
  sub_1000255B4((uint64_t)v18);
  char v25 = (_DWORD *)(v3 + 48);
  uint64_t v26 = (uint64_t (*)(char *, uint64_t, uint64_t))v22[6];
  int v27 = v26(v18, 1, v2);
  uint64_t v86 = v2;
  int v28 = v27;
  sub_100026F38((uint64_t)v18);
  BOOL v29 = v28 == 1;
  uint64_t v2 = v86;
  if (v29)
  {
LABEL_7:
    uint64_t v30 = [a1 currentHome];
    if (v30)
    {
      uint64_t v23 = v30;
      swift_release();
      if (qword_100041638 != -1) {
        swift_once();
      }
      uint64_t v31 = sub_100029DD8();
      sub_1000138FC(v31, (uint64_t)qword_100041FC8);
      char v25 = v23;
      uint64_t v24 = sub_100029DB8();
      os_log_type_t v32 = sub_10002A128();
      if (os_log_type_enabled((os_log_t)v24, v32))
      {
        NSString v33 = (uint8_t *)swift_slowAlloc();
        char v34 = (void *)swift_slowAlloc();
        *(_DWORD *)NSString v33 = 138412290;
        BOOL v89 = v25;
        uint64_t v35 = v25;
        sub_10002A148();
        *char v34 = v23;

        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v24, v32, "Using Home Sensing, home is %@", v33, 0xCu);
        sub_10000D9EC(&qword_100041BD0);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        return (uint64_t)v23;
      }
      goto LABEL_29;
    }
    if (qword_100041638 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_100029DD8();
    sub_1000138FC(v36, (uint64_t)qword_100041FC8);
    swift_retain_n();
    uint64_t v37 = sub_100029DB8();
    char v25 = (_DWORD *)sub_10002A128();
    if (!os_log_type_enabled(v37, (os_log_type_t)v25))
    {

      swift_release_n();
      uint64_t v39 = v24 & 0x4000000000000000;
      goto LABEL_52;
    }
    uint64_t v23 = (_DWORD *)swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    BOOL v89 = v38;
    *uint64_t v23 = 136315138;
    uint64_t v39 = v24 & 0x4000000000000000;
    if (v24 < 0 || v39)
    {
      swift_retain();
      if (sub_10002A2C8()) {
        goto LABEL_18;
      }
    }
    else
    {
      Class v40 = *(Class *)(v24 + 16);
      swift_retain();
      if (v40)
      {
LABEL_18:
        if ((v24 & 0xC000000000000001) != 0)
        {
          id v41 = (objc_class *)sub_10002A1E8();
        }
        else
        {
          if (!*(void *)(v24 + 16))
          {
            __break(1u);
            goto LABEL_67;
          }
          id v41 = (objc_class *)*(id *)(v24 + 32);
        }
        id v42 = v41;
        swift_release();
        id v43 = [(objc_class *)v42 name];

        uint64_t v44 = sub_100029EF8();
        unint64_t v46 = v45;

        goto LABEL_51;
      }
    }
    uint64_t v44 = 1701736302;
    swift_release();
    unint64_t v46 = 0xE400000000000000;
LABEL_51:
    uint64_t v88 = sub_100014A04(v44, v46, (uint64_t *)&v89);
    sub_10002A148();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v37, (os_log_type_t)v25, "Using Home Sensing, no 'currentHome' was found from HomeKit, falling back to %s)", (uint8_t *)v23, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

LABEL_52:
    if (v24 < 0 || v39)
    {
      swift_bridgeObjectRetain();
      uint64_t v78 = sub_10002A2C8();
      swift_release();
      if (!v78) {
        goto LABEL_64;
      }
    }
    else if (!*(void *)(v24 + 16))
    {
      goto LABEL_64;
    }
    if ((v24 & 0xC000000000000001) != 0) {
      goto LABEL_61;
    }
    if (*(void *)(v24 + 16))
    {
LABEL_57:
      unint64_t v77 = (objc_class *)*(id *)(v24 + 32);
LABEL_58:
      uint64_t v23 = v77;
      swift_release();
      return (uint64_t)v23;
    }
    __break(1u);
    goto LABEL_63;
  }
  sub_1000255B4((uint64_t)v15);
  if (v26(v15, 1, v2) == 1)
  {
    sub_100026F38((uint64_t)v15);
    if ((v24 & 0x8000000000000000) == 0 && (v24 & 0x4000000000000000) == 0)
    {
      if (*(void *)(v24 + 16)) {
        goto LABEL_26;
      }
      goto LABEL_64;
    }
LABEL_63:
    swift_bridgeObjectRetain();
    uint64_t v79 = sub_10002A2C8();
    swift_release();
    if (v79)
    {
LABEL_26:
      if ((v24 & 0xC000000000000001) == 0)
      {
        if (!*(void *)(v24 + 16))
        {
          __break(1u);
LABEL_29:

          return (uint64_t)v23;
        }
        goto LABEL_57;
      }
LABEL_61:
      unint64_t v77 = (objc_class *)sub_10002A1E8();
      goto LABEL_58;
    }
LABEL_64:
    swift_release();
    return 0;
  }
  char v25 = v22;
  unint64_t v47 = (void (*)(char *, char *, uint64_t))v22[4];
  uint64_t v38 = (uint64_t)v87;
  v47(v87, v15, v2);
  id v48 = [a1 homes];
  unint64_t v49 = sub_10002A038();

  __chkstk_darwin(v50, v51);
  *(&v83 - 2) = v38;
  uint64_t v23 = sub_100025474(sub_100026F98, (uint64_t)(&v83 - 4), v49);
  swift_bridgeObjectRelease();
  if (v23)
  {
    swift_release();
    if (qword_100041638 == -1)
    {
LABEL_33:
      uint64_t v52 = sub_100029DD8();
      sub_1000138FC(v52, (uint64_t)qword_100041FC8);
      id v53 = v23;
      NSString v54 = sub_100029DB8();
      os_log_type_t v55 = sub_10002A128();
      if (os_log_type_enabled(v54, v55))
      {
        id v56 = (uint8_t *)swift_slowAlloc();
        BOOL v89 = swift_slowAlloc();
        uint64_t v85 = v25;
        *(_DWORD *)id v56 = 136315138;
        uint64_t v84 = (uint64_t)(v56 + 4);
        id v57 = [v53 name];
        uint64_t v58 = sub_100029EF8();
        unint64_t v60 = v59;

        uint64_t v2 = v86;
        uint64_t v88 = sub_100014A04(v58, v60, (uint64_t *)&v89);
        sub_10002A148();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v54, v55, "Home.app has locked home to '%s', using that one.", v56, 0xCu);
        swift_arrayDestroy();
        char v25 = v85;
        swift_slowDealloc();
        uint64_t v38 = (uint64_t)v87;
        swift_slowDealloc();
      }
      else
      {
      }
      (*((void (**)(uint64_t, uint64_t))v25 + 1))(v38, v2);
      return (uint64_t)v23;
    }
LABEL_67:
    swift_once();
    goto LABEL_33;
  }
  if (qword_100041638 != -1) {
    swift_once();
  }
  uint64_t v61 = sub_100029DD8();
  sub_1000138FC(v61, (uint64_t)qword_100041FC8);
  unint64_t v62 = (void (*)(void, void))v85;
  (*((void (**)(_DWORD *, uint64_t, uint64_t))v25 + 2))(v85, v38, v2);
  swift_retain_n();
  id v63 = sub_100029DB8();
  os_log_type_t v64 = sub_10002A128();
  if (!os_log_type_enabled(v63, v64))
  {
    uint64_t v65 = *((void *)v25 + 1);
    ((void (*)(void, uint64_t))v65)(v62, v2);

    swift_release_n();
    uint64_t v68 = v24 & 0x4000000000000000;
    goto LABEL_71;
  }
  uint64_t v65 = swift_slowAlloc();
  uint64_t v84 = swift_slowAlloc();
  BOOL v89 = v84;
  *(_DWORD *)uint64_t v65 = 136315394;
  uint64_t v66 = sub_100029D58();
  uint64_t v88 = sub_100014A04(v66, v67, (uint64_t *)&v89);
  sub_10002A148();
  swift_bridgeObjectRelease();
  uint64_t v85 = (_DWORD *)*((void *)v25 + 1);
  ((void (*)(void, uint64_t))v85)(v62, v86);
  *(_WORD *)(v65 + 12) = 2080;
  uint64_t v68 = v24 & 0x4000000000000000;
  if (v24 < 0 || v68)
  {
    swift_retain();
    if (sub_10002A2C8()) {
      goto LABEL_41;
    }
LABEL_69:
    uint64_t v73 = 1701736302;
    swift_release();
    unint64_t v75 = 0xE400000000000000;
    goto LABEL_70;
  }
  Class v69 = *(Class *)(v24 + 16);
  swift_retain();
  if (!v69) {
    goto LABEL_69;
  }
LABEL_41:
  if ((v24 & 0xC000000000000001) != 0) {
    goto LABEL_84;
  }
  if (!*(void *)(v24 + 16))
  {
    __break(1u);
    uint64_t result = swift_release();
    __break(1u);
    return result;
  }
  for (uint64_t i = (objc_class *)*(id *)(v24 + 32); ; uint64_t i = (objc_class *)sub_10002A1E8())
  {
    id v71 = i;
    swift_release();
    id v72 = [(objc_class *)v71 name];

    uint64_t v73 = sub_100029EF8();
    unint64_t v75 = v74;

LABEL_70:
    uint64_t v88 = sub_100014A04(v73, v75, (uint64_t *)&v89);
    sub_10002A148();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v63, v64, "Home.app has locked home to uuid '%s' but it wasn't found, falling back to %s)", (uint8_t *)v65, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v65 = (uint64_t)v85;
    uint64_t v2 = v86;
LABEL_71:
    if (v24 < 0 || v68) {
      break;
    }
    if (!*(void *)(v24 + 16)) {
      goto LABEL_79;
    }
LABEL_74:
    if ((v24 & 0xC000000000000001) != 0)
    {
      unint64_t v80 = (objc_class *)sub_10002A1E8();
      goto LABEL_77;
    }
    if (*(void *)(v24 + 16))
    {
      unint64_t v80 = (objc_class *)*(id *)(v24 + 32);
LABEL_77:
      uint64_t v23 = v80;
      swift_release();
      goto LABEL_80;
    }
    __break(1u);
LABEL_84:
    ;
  }
  swift_bridgeObjectRetain();
  uint64_t v81 = sub_10002A2C8();
  swift_release();
  if (v81) {
    goto LABEL_74;
  }
LABEL_79:
  swift_release();
  uint64_t v23 = 0;
LABEL_80:
  ((void (*)(uint64_t, uint64_t))v65)(v38, v2);
  return (uint64_t)v23;
}

void *AppPreferences.selectedHomeChangedNotification.unsafeMutableAddressor()
{
  return &static AppPreferences.selectedHomeChangedNotification;
}

void *sub_100025474(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62) {
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = sub_10002A2C8())
  {
    uint64_t v7 = 4;
    while (1)
    {
      id v8 = (a3 & 0xC000000000000001) != 0 ? (id)sub_10002A1E8() : *(id *)(a3 + 8 * v7);
      uint64_t v9 = v8;
      uint64_t v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1)) {
        break;
      }
      id v13 = v8;
      char v11 = a1(&v13);
      if (v3)
      {
        swift_bridgeObjectRelease();

        return v9;
      }
      if (v11)
      {
        swift_bridgeObjectRelease();
        return v9;
      }

      ++v7;
      if (v10 == v6) {
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

void *AppPreferences.homeSharedDefaultsSuite.unsafeMutableAddressor()
{
  return &static AppPreferences.homeSharedDefaultsSuite;
}

void *AppPreferences.isHomeSensingEnabledKey.unsafeMutableAddressor()
{
  return &static AppPreferences.isHomeSensingEnabledKey;
}

uint64_t sub_1000255B4@<X0>(uint64_t a1@<X8>)
{
  id v2 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v3 = sub_100029EE8();
  id v4 = [v2 initWithSuiteName:v3];

  if (v4
    && (NSString v5 = sub_100029EE8(),
        id v6 = [v4 stringForKey:v5],
        v4,
        v5,
        v6))
  {
    sub_100029EF8();

    sub_100029D48();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = sub_100029D88();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
    return v9(a1, 1, 1, v8);
  }
}

void *AppPreferences.nanoHomeSyncDomain.unsafeMutableAddressor()
{
  return &static AppPreferences.nanoHomeSyncDomain;
}

void *AppPreferences.selectedHomeKey.unsafeMutableAddressor()
{
  return &static AppPreferences.selectedHomeKey;
}

uint64_t sub_100025728(id *a1)
{
  uint64_t v2 = sub_100029D88();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  id v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = [*a1 uniqueIdentifier];
  sub_100029D78();

  char v8 = sub_100029D68();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  return v8 & 1;
}

unint64_t static AppPreferences.homeSharedDefaultsSuite.getter()
{
  return 0xD000000000000014;
}

unint64_t static AppPreferences.isHomeSensingEnabledKey.getter()
{
  return 0xD000000000000014;
}

unint64_t static AppPreferences.homeSensingDefaultsChangedNotification.getter()
{
  return 0xD000000000000021;
}

unint64_t static AppPreferences.selectedHomeChangedNotification.getter()
{
  return 0xD000000000000022;
}

unint64_t static AppPreferences.nanoHomeSyncDomain.getter()
{
  return 0xD000000000000017;
}

unint64_t static AppPreferences.selectedHomeKey.getter()
{
  return 0xD000000000000011;
}

ValueMetadata *type metadata accessor for AppPreferences()
{
  return &type metadata for AppPreferences;
}

uint64_t sub_1000258EC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = sub_100026E64(v2);
    *a1 = v2;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_100025B08(v6);
  return sub_10002A248();
}

void *sub_100025968(unint64_t a1)
{
  return sub_1000259E0(a1, (void (*)(void))sub_100026E24, &qword_100041E18, &qword_100041E10, (uint64_t (*)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))sub_10001DF4C);
}

void *sub_1000259A4(unint64_t a1)
{
  return sub_1000259E0(a1, (void (*)(void))type metadata accessor for SecurityIntentAccessory, &qword_100041E30, &qword_100041E28, (uint64_t (*)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))sub_10001DFB8);
}

void *sub_1000259E0(unint64_t a1, void (*a2)(void), unint64_t *a3, uint64_t *a4, uint64_t (*a5)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))
{
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v10 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v10) {
    return _swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v10 <= 0)
    {
      char v11 = _swiftEmptyArrayStorage;
    }
    else
    {
      sub_10000D9EC(&qword_100041D90);
      char v11 = (void *)swift_allocObject();
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 25;
      }
      v11[2] = v10;
      v11[3] = (2 * (v13 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_100026C00((unint64_t)(v11 + 4), v10, a1, a2, a3, a4, a5);
    a5 = v14;
    swift_bridgeObjectRelease();
    if (a5 == (uint64_t (*)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))v10) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_10002A2C8();
    swift_bridgeObjectRelease();
    if (!v10) {
      return _swiftEmptyArrayStorage;
    }
  }
  return v11;
}

void sub_100025B08(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int v4 = sub_10002A4B8(v3);
  if (v4 >= v3)
  {
    if (v3 < 0) {
      goto LABEL_157;
    }
    if (v3) {
      sub_100015B70(0, v3, 1, a1);
    }
    return;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_165;
  }
  Swift::Int v138 = v4;
  Swift::Int v143 = v3;
  v136 = a1;
  if (v3 < 2)
  {
    char v8 = (char *)_swiftEmptyArrayStorage;
    uint64_t v152 = (uint64_t)_swiftEmptyArrayStorage;
    uint64_t v146 = (void **)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v3 != 1)
    {
      unint64_t v13 = _swiftEmptyArrayStorage[2];
LABEL_123:
      if (v13 >= 2)
      {
        uint64_t v126 = *v136;
        do
        {
          unint64_t v127 = v13 - 2;
          if (v13 < 2) {
            goto LABEL_152;
          }
          if (!v126) {
            goto LABEL_164;
          }
          Swift::Int v128 = v8;
          Swift::Int v129 = v8 + 32;
          uint64_t v130 = *(void *)&v8[16 * v127 + 32];
          uint64_t v131 = *(void *)&v8[16 * v13 + 24];
          sub_100026514((void **)(v126 + 8 * v130), (id *)(v126 + 8 * *(void *)&v129[16 * v13 - 16]), v126 + 8 * v131, v146);
          if (v1) {
            break;
          }
          if (v131 < v130) {
            goto LABEL_153;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            Swift::Int v128 = sub_100026BB0((uint64_t)v128);
          }
          if (v127 >= *((void *)v128 + 2)) {
            goto LABEL_154;
          }
          v132 = v128;
          unint64_t v133 = v128 + 32;
          v134 = &v128[16 * v127 + 32];
          *(void *)v134 = v130;
          *((void *)v134 + 1) = v131;
          unint64_t v135 = *((void *)v128 + 2);
          if (v13 > v135) {
            goto LABEL_155;
          }
          char v8 = v132;
          memmove(&v133[16 * v13 - 16], &v133[16 * v13], 16 * (v135 - v13));
          *((void *)v8 + 2) = v135 - 1;
          unint64_t v13 = v135 - 1;
        }
        while (v135 > 2);
      }
LABEL_134:
      swift_bridgeObjectRelease();
      *(void *)((v152 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_10002A058();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    sub_100026E24();
    uint64_t v7 = sub_10002A078();
    *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) = v6;
    uint64_t v146 = (void **)((v7 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v152 = v7;
  }
  Swift::Int v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v137 = *a1 - 8;
  char v8 = (char *)_swiftEmptyArrayStorage;
  char v11 = &LockScreenDataModel;
  Swift::Int v12 = v143;
  uint64_t v147 = *a1;
  while (1)
  {
    Swift::Int v14 = v9++;
    if (v9 >= v12) {
      goto LABEL_50;
    }
    v139 = v8;
    uint64_t v15 = *(void **)(v10 + 8 * v14);
    id v16 = *(id *)(v10 + 8 * v9);
    id v17 = v15;
    unsigned int v18 = [v16 (SEL)v11[354].count];
    if (v18 == [v17 (SEL)v11[354].count])
    {
      Swift::Int v148 = v9;
      id v21 = [v16 name];
      uint64_t v22 = sub_100029EF8();
      uint64_t v24 = v23;

      id v25 = [v17 name];
      uint64_t v26 = sub_100029EF8();
      uint64_t v28 = v27;

      if (v22 == v26 && v24 == v28) {
        unsigned int v19 = 0;
      }
      else {
        unsigned int v19 = sub_10002A4D8();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      Swift::Int v20 = v14 + 2;
      char v11 = &LockScreenDataModel;
      Swift::Int v9 = v148;
      if (v14 + 2 < v143)
      {
LABEL_27:
        Swift::Int v30 = v20;
        uint64_t v10 = v147;
        unsigned int v144 = v19;
        do
        {
          Swift::Int v20 = v30;
          os_log_type_t v32 = *(void **)(v10 + 8 * v9);
          id v33 = *(id *)(v10 + 8 * v30);
          id v34 = v32;
          unsigned int v35 = [v33 (SEL)v11[354].count];
          if (v35 == [v34 (SEL)v11[354].count])
          {
            Swift::Int v149 = v20;
            id v36 = [v33 name];
            uint64_t v37 = sub_100029EF8();
            uint64_t v39 = v38;

            id v40 = [v34 name];
            uint64_t v41 = sub_100029EF8();
            uint64_t v43 = v42;

            if (v37 == v41 && v39 == v43)
            {

              swift_bridgeObjectRelease_n();
              char v11 = &LockScreenDataModel;
              Swift::Int v20 = v149;
              unsigned int v19 = v144;
              if (v144)
              {
                char v8 = v139;
                uint64_t v10 = v147;
                goto LABEL_41;
              }
            }
            else
            {
              char v45 = sub_10002A4D8();

              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              char v46 = v144 ^ v45;
              unsigned int v19 = v144;
              char v11 = &LockScreenDataModel;
              Swift::Int v20 = v149;
              if (v46) {
                goto LABEL_19;
              }
            }
          }
          else
          {
            unsigned int v31 = [v33 (SEL)v11[354].count];

            if ((v19 ^ v31)) {
              goto LABEL_19;
            }
          }
          Swift::Int v30 = v20 + 1;
          Swift::Int v9 = v20;
          uint64_t v10 = v147;
        }
        while (v20 + 1 < v143);
        ++v20;
        goto LABEL_40;
      }
    }
    else
    {
      unsigned int v19 = [v16 (SEL)v11[354].count];

      Swift::Int v20 = v14 + 2;
      if (v14 + 2 < v143) {
        goto LABEL_27;
      }
    }
    LOBYTE(v144) = v19;
LABEL_19:
    uint64_t v10 = v147;
LABEL_40:
    Swift::Int v9 = v20;
    char v8 = v139;
    if (v144)
    {
LABEL_41:
      if (v20 < v14) {
        goto LABEL_158;
      }
      if (v14 < v20)
      {
        unint64_t v47 = (uint64_t *)(v137 + 8 * v20);
        Swift::Int v48 = v20;
        Swift::Int v49 = v14;
        uint64_t v50 = (uint64_t *)(v10 + 8 * v14);
        do
        {
          if (v49 != --v48)
          {
            if (!v10) {
              goto LABEL_163;
            }
            uint64_t v51 = *v50;
            uint64_t *v50 = *v47;
            *unint64_t v47 = v51;
          }
          ++v49;
          --v47;
          ++v50;
        }
        while (v49 < v48);
      }
      Swift::Int v9 = v20;
    }
LABEL_50:
    if (v9 >= v143) {
      goto LABEL_74;
    }
    if (__OFSUB__(v9, v14)) {
      goto LABEL_156;
    }
    if (v9 - v14 >= v138) {
      goto LABEL_74;
    }
    if (__OFADD__(v14, v138)) {
      goto LABEL_159;
    }
    Swift::Int v52 = v143;
    if (v14 + v138 < v143) {
      Swift::Int v52 = v14 + v138;
    }
    if (v52 < v14) {
      break;
    }
    if (v9 == v52) {
      goto LABEL_74;
    }
    uint64_t v140 = v8;
    Swift::Int v141 = v52;
    uint64_t v53 = v137 + 8 * v9;
    Swift::Int v142 = v14;
    while (2)
    {
      NSString v54 = *(void **)(v10 + 8 * v9);
      Swift::Int v55 = v14;
      uint64_t v145 = v53;
      uint64_t v56 = v53;
      Swift::Int v150 = v9;
      while (1)
      {
        id v57 = *(void **)v56;
        id v58 = v54;
        id v59 = v57;
        LODWORD(v57) = [v58 (SEL)v11[354].count];
        if (v57 == [v59 (SEL)v11[354].count]) {
          break;
        }
        unsigned __int8 v60 = [v58 (SEL)v11[354].count];

        if ((v60 & 1) == 0) {
          goto LABEL_60;
        }
LABEL_70:
        if (!v10) {
          goto LABEL_161;
        }
        id v71 = *(void **)v56;
        NSString v54 = *(void **)(v56 + 8);
        *(void *)uint64_t v56 = v54;
        *(void *)(v56 + 8) = v71;
        v56 -= 8;
        if (v9 == ++v55) {
          goto LABEL_60;
        }
      }
      id v61 = [v58 name];
      uint64_t v62 = sub_100029EF8();
      uint64_t v64 = v63;

      id v65 = [v59 name];
      uint64_t v66 = sub_100029EF8();
      uint64_t v68 = v67;

      if (v62 != v66 || v64 != v68)
      {
        char v70 = sub_10002A4D8();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v10 = v147;
        Swift::Int v9 = v150;
        char v11 = &LockScreenDataModel;
        if ((v70 & 1) == 0) {
          goto LABEL_60;
        }
        goto LABEL_70;
      }

      swift_bridgeObjectRelease_n();
      uint64_t v10 = v147;
      Swift::Int v9 = v150;
      char v11 = &LockScreenDataModel;
LABEL_60:
      ++v9;
      uint64_t v53 = v145 + 8;
      Swift::Int v14 = v142;
      if (v9 != v141) {
        continue;
      }
      break;
    }
    Swift::Int v9 = v141;
    char v8 = v140;
LABEL_74:
    if (v9 < v14) {
      goto LABEL_151;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      char v8 = sub_1000269F4(0, *((void *)v8 + 2) + 1, 1, v8);
    }
    unint64_t v73 = *((void *)v8 + 2);
    unint64_t v72 = *((void *)v8 + 3);
    unint64_t v13 = v73 + 1;
    if (v73 >= v72 >> 1) {
      char v8 = sub_1000269F4((char *)(v72 > 1), v73 + 1, 1, v8);
    }
    *((void *)v8 + 2) = v13;
    unint64_t v74 = v8 + 32;
    unint64_t v75 = &v8[16 * v73 + 32];
    *(void *)unint64_t v75 = v14;
    *((void *)v75 + 1) = v9;
    if (v73)
    {
      Swift::Int v151 = v9;
      while (1)
      {
        unint64_t v76 = v13 - 1;
        if (v13 >= 4)
        {
          uint64_t v81 = &v74[16 * v13];
          uint64_t v82 = *((void *)v81 - 8);
          uint64_t v83 = *((void *)v81 - 7);
          BOOL v87 = __OFSUB__(v83, v82);
          uint64_t v84 = v83 - v82;
          if (v87) {
            goto LABEL_140;
          }
          uint64_t v86 = *((void *)v81 - 6);
          uint64_t v85 = *((void *)v81 - 5);
          BOOL v87 = __OFSUB__(v85, v86);
          uint64_t v79 = v85 - v86;
          char v80 = v87;
          if (v87) {
            goto LABEL_141;
          }
          unint64_t v88 = v13 - 2;
          BOOL v89 = &v74[16 * v13 - 32];
          uint64_t v91 = *(void *)v89;
          uint64_t v90 = *((void *)v89 + 1);
          BOOL v87 = __OFSUB__(v90, v91);
          uint64_t v92 = v90 - v91;
          if (v87) {
            goto LABEL_143;
          }
          BOOL v87 = __OFADD__(v79, v92);
          uint64_t v93 = v79 + v92;
          if (v87) {
            goto LABEL_146;
          }
          if (v93 >= v84)
          {
            uint64_t v111 = &v74[16 * v76];
            uint64_t v113 = *(void *)v111;
            uint64_t v112 = *((void *)v111 + 1);
            BOOL v87 = __OFSUB__(v112, v113);
            uint64_t v114 = v112 - v113;
            if (v87) {
              goto LABEL_150;
            }
            BOOL v104 = v79 < v114;
            goto LABEL_112;
          }
        }
        else
        {
          if (v13 != 3)
          {
            uint64_t v105 = *((void *)v8 + 4);
            uint64_t v106 = *((void *)v8 + 5);
            BOOL v87 = __OFSUB__(v106, v105);
            uint64_t v98 = v106 - v105;
            char v99 = v87;
            goto LABEL_106;
          }
          uint64_t v78 = *((void *)v8 + 4);
          uint64_t v77 = *((void *)v8 + 5);
          BOOL v87 = __OFSUB__(v77, v78);
          uint64_t v79 = v77 - v78;
          char v80 = v87;
        }
        if (v80) {
          goto LABEL_142;
        }
        unint64_t v88 = v13 - 2;
        uint64_t v94 = &v74[16 * v13 - 32];
        uint64_t v96 = *(void *)v94;
        uint64_t v95 = *((void *)v94 + 1);
        BOOL v97 = __OFSUB__(v95, v96);
        uint64_t v98 = v95 - v96;
        char v99 = v97;
        if (v97) {
          goto LABEL_145;
        }
        uint64_t v100 = &v74[16 * v76];
        uint64_t v102 = *(void *)v100;
        uint64_t v101 = *((void *)v100 + 1);
        BOOL v87 = __OFSUB__(v101, v102);
        uint64_t v103 = v101 - v102;
        if (v87) {
          goto LABEL_148;
        }
        if (__OFADD__(v98, v103)) {
          goto LABEL_149;
        }
        if (v98 + v103 >= v79)
        {
          BOOL v104 = v79 < v103;
LABEL_112:
          if (v104) {
            unint64_t v76 = v88;
          }
          goto LABEL_114;
        }
LABEL_106:
        if (v99) {
          goto LABEL_144;
        }
        unint64_t v107 = &v74[16 * v76];
        uint64_t v109 = *(void *)v107;
        uint64_t v108 = *((void *)v107 + 1);
        BOOL v87 = __OFSUB__(v108, v109);
        uint64_t v110 = v108 - v109;
        if (v87) {
          goto LABEL_147;
        }
        if (v110 < v98) {
          goto LABEL_14;
        }
LABEL_114:
        unint64_t v115 = v76 - 1;
        if (v76 - 1 >= v13)
        {
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
          goto LABEL_160;
        }
        if (!v10) {
          goto LABEL_162;
        }
        unint64_t v116 = v8;
        uint64_t v117 = v10;
        uint64_t v118 = &v74[16 * v115];
        uint64_t v119 = *(void *)v118;
        uint64_t v120 = v74;
        unint64_t v121 = v76;
        uint64_t v122 = &v74[16 * v76];
        uint64_t v123 = *((void *)v122 + 1);
        uint64_t v124 = v117;
        sub_100026514((void **)(v117 + 8 * *(void *)v118), (id *)(v117 + 8 * *(void *)v122), v117 + 8 * v123, v146);
        if (v1) {
          goto LABEL_134;
        }
        if (v123 < v119) {
          goto LABEL_137;
        }
        if (v121 > *((void *)v116 + 2)) {
          goto LABEL_138;
        }
        *(void *)uint64_t v118 = v119;
        *(void *)&v120[16 * v115 + 8] = v123;
        unint64_t v125 = *((void *)v116 + 2);
        if (v121 >= v125) {
          goto LABEL_139;
        }
        char v8 = v116;
        unint64_t v13 = v125 - 1;
        memmove(v122, v122 + 16, 16 * (v125 - 1 - v121));
        unint64_t v74 = v120;
        *((void *)v116 + 2) = v125 - 1;
        char v11 = &LockScreenDataModel;
        Swift::Int v9 = v151;
        uint64_t v10 = v124;
        if (v125 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v13 = 1;
LABEL_14:
    Swift::Int v12 = v143;
    if (v9 >= v143) {
      goto LABEL_123;
    }
  }
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
  sub_10002A298();
  __break(1u);
}

uint64_t sub_100026514(void **__src, id *a2, unint64_t a3, void **__dst)
{
  Swift::Int v4 = __dst;
  uint64_t v5 = a2;
  uint64_t v6 = __src;
  int64_t v7 = (char *)a2 - (char *)__src;
  int64_t v8 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0) {
    int64_t v8 = (char *)a2 - (char *)__src;
  }
  uint64_t v9 = v8 >> 3;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v11 = a3 - (void)a2;
  }
  uint64_t v12 = v11 >> 3;
  uint64_t v64 = __src;
  uint64_t v63 = __dst;
  if (v9 >= v11 >> 3)
  {
    if (v10 < -7) {
      goto LABEL_61;
    }
    if (__dst != a2 || &a2[v12] <= __dst) {
      memmove(__dst, a2, 8 * v12);
    }
    os_log_type_t v32 = &v4[v12];
    uint64_t v62 = v32;
    uint64_t v64 = v5;
    if (v6 >= v5 || v10 < 8)
    {
LABEL_60:
      sub_100026AF4((void **)&v64, (const void **)&v63, &v62);
      return 1;
    }
    id v33 = (void **)(a3 - 8);
    id v34 = &LockScreenDataModel;
    unsigned int v35 = v5;
    uint64_t v53 = v6;
    NSString v54 = v4;
    while (1)
    {
      id v59 = v32;
      id v61 = v5;
      id v57 = v33 + 1;
      uint64_t v37 = *--v32;
      id v36 = v37;
      uint64_t v38 = *--v35;
      id v39 = v36;
      id v40 = v38;
      unsigned int v41 = [v39 (SEL)v34[354].count];
      if (v41 == [v40 (SEL)v34[354].count])
      {
        id v43 = [v39 name];
        uint64_t v44 = sub_100029EF8();
        uint64_t v55 = v45;

        id v46 = [v40 name];
        uint64_t v47 = sub_100029EF8();
        uint64_t v49 = v48;

        if (v44 == v47 && v55 == v49)
        {

          swift_bridgeObjectRelease_n();
          uint64_t v6 = v53;
          Swift::Int v4 = v54;
          id v34 = &LockScreenDataModel;
        }
        else
        {
          char v51 = sub_10002A4D8();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v6 = v53;
          Swift::Int v4 = v54;
          id v34 = &LockScreenDataModel;
          if (v51)
          {
LABEL_47:
            os_log_type_t v32 = v59;
            if (v57 != v61 || v33 >= v61) {
              *id v33 = *v35;
            }
            uint64_t v64 = v35;
            goto LABEL_56;
          }
        }
      }
      else
      {
        unsigned __int8 v42 = [v39 (SEL)v34[354].count];

        if (v42) {
          goto LABEL_47;
        }
      }
      uint64_t v62 = v32;
      unsigned int v35 = v61;
      if (v57 < v59 || v33 >= v59 || v57 != v59) {
        *id v33 = *v32;
      }
LABEL_56:
      if (v35 > v6)
      {
        --v33;
        uint64_t v5 = v35;
        if (v32 > v4) {
          continue;
        }
      }
      goto LABEL_60;
    }
  }
  if (v7 >= -7)
  {
    if (__dst != __src || &__src[v9] <= __dst) {
      memmove(__dst, __src, 8 * v9);
    }
    unint64_t v13 = &v4[v9];
    uint64_t v62 = v13;
    if ((unint64_t)v5 < a3 && v7 >= 8)
    {
      Swift::Int v14 = &LockScreenDataModel;
      uint64_t v56 = v13;
      while (1)
      {
        uint64_t v15 = *v4;
        id v16 = *v5;
        id v17 = v15;
        LODWORD(v15) = [v16 (SEL)v14[354].count];
        if (v15 == [v17 (SEL)v14[354].count])
        {
          unsigned __int8 v60 = v5;
          Swift::Int v20 = v6;
          id v21 = v4;
          id v22 = [v16 name];
          uint64_t v23 = sub_100029EF8();
          uint64_t v25 = v24;

          id v26 = [v17 name];
          uint64_t v27 = sub_100029EF8();
          uint64_t v29 = v28;

          if (v23 == v27 && v25 == v29)
          {

            swift_bridgeObjectRelease_n();
            Swift::Int v4 = v21;
            uint64_t v6 = v20;
            uint64_t v5 = v60;
            unint64_t v13 = v56;
            Swift::Int v14 = &LockScreenDataModel;
            if (v6 == v4) {
              goto LABEL_17;
            }
LABEL_16:
            *uint64_t v6 = *v4;
            goto LABEL_17;
          }
          char v31 = sub_10002A4D8();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          Swift::Int v4 = v21;
          uint64_t v6 = v20;
          uint64_t v5 = v60;
          unint64_t v13 = v56;
          Swift::Int v14 = &LockScreenDataModel;
          if (v31)
          {
LABEL_23:
            unsigned int v19 = v5 + 1;
            if (v6 < v5 || v6 >= v19 || v6 != v5) {
              *uint64_t v6 = *v5;
            }
            goto LABEL_27;
          }
        }
        else
        {
          unsigned __int8 v18 = [v16 (SEL)v14[354].count];

          if (v18) {
            goto LABEL_23;
          }
        }
        if (v6 != v4) {
          goto LABEL_16;
        }
LABEL_17:
        uint64_t v63 = ++v4;
        unsigned int v19 = v5;
LABEL_27:
        ++v6;
        if (v4 < v13)
        {
          uint64_t v5 = v19;
          if ((unint64_t)v19 < a3) {
            continue;
          }
        }
        uint64_t v64 = v6;
        goto LABEL_60;
      }
    }
    goto LABEL_60;
  }
LABEL_61:
  uint64_t result = sub_10002A308();
  __break(1u);
  return result;
}

char *sub_1000269F4(char *result, int64_t a2, char a3, char *a4)
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
    sub_10000D9EC(&qword_100041E20);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v10 + 32;
  Swift::Int v14 = a4 + 32;
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

char *sub_100026AF4(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_10002A308();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_100026BB0(uint64_t a1)
{
  return sub_1000269F4(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_100026BC4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_100026C00(a1, a2, a3, (void (*)(void))type metadata accessor for SecurityIntentAccessory, &qword_100041E30, &qword_100041E28, (uint64_t (*)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))sub_10001DFB8);
}

uint64_t sub_100026C00(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void), unint64_t *a5, uint64_t *a6, uint64_t (*a7)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))
{
  unint64_t v14 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_10002A2C8();
    swift_bridgeObjectRelease();
    if (!v15) {
      return a3;
    }
  }
  else
  {
    uint64_t v15 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v15) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v16 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v14)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_10002A2C8();
    swift_bridgeObjectRelease();
    if (v18 <= a2)
    {
      if (v15 >= 1)
      {
        uint64_t v19 = sub_10001113C(a5, a6);
        swift_bridgeObjectRetain();
        for (uint64_t i = 0; i != v15; ++i)
        {
          uint64_t v21 = sub_10000D9EC(a6);
          id v22 = (void (*)(unsigned char *, void))a7(v26, i, a3, v21, v19);
          id v24 = *v23;
          v22(v26, 0);
          *(void *)(a1 + 8 * i) = v24;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v17 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v17 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v16 + 32 >= a1 + 8 * v17 || v16 + 32 + 8 * v17 <= a1)
  {
    a4(0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_10002A308();
  __break(1u);
  return result;
}

unint64_t sub_100026E24()
{
  unint64_t result = qword_100041BF8;
  if (!qword_100041BF8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100041BF8);
  }
  return result;
}

uint64_t sub_100026E64(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_100026E78()
{
  id v0 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v1 = sub_100029EE8();
  id v2 = [v0 initWithSuiteName:v1];

  if (!v2) {
    return 1;
  }
  NSString v3 = sub_100029EE8();
  id v4 = [v2 BOOLForKey:v3];

  return (uint64_t)v4;
}

uint64_t sub_100026F38(uint64_t a1)
{
  uint64_t v2 = sub_10000D9EC(&qword_100041E08);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100026F98(id *a1)
{
  return sub_100025728(a1) & 1;
}

id SecurityAccessoryConfigurationIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SecurityAccessoryConfigurationIntent();
  return [super init];
}

uint64_t type metadata accessor for SecurityAccessoryConfigurationIntent()
{
  return self;
}

id SecurityIntentAccessory.__allocating_init(coder:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id SecurityAccessoryConfigurationIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SecurityAccessoryConfigurationIntent();
  [super initWithCoder:a1];

  return v3;
}

id SecurityAccessoryConfigurationIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  if (a2)
  {
    NSString v6 = sub_100029EE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithIdentifier:v6 backingStore:a3];

  return v7;
}

id SecurityAccessoryConfigurationIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    NSString v5 = sub_100029EE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for SecurityAccessoryConfigurationIntent();
  id v6 = [super initWithIdentifier:v5 backingStore:a3];

  return v6;
}

id SecurityAccessoryConfigurationIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSString v7 = sub_100029EE8();
  swift_bridgeObjectRelease();
  NSString v8 = sub_100029EE8();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.Class isa = sub_100029E78().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.Class isa = 0;
  }
  id v10 = [objc_allocWithZone(v5) initWithDomain:v7 verb:v8 parametersByName:v9.super.isa];

  return v10;
}

id SecurityAccessoryConfigurationIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSString v7 = sub_100029EE8();
  swift_bridgeObjectRelease();
  NSString v8 = sub_100029EE8();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.Class isa = sub_100029E78().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.Class isa = 0;
  }
  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for SecurityAccessoryConfigurationIntent();
  id v10 = [super initWithDomain:v7 verb:v8 parametersByName:v9.super.isa];

  return v10;
}

id SecurityAccessoryConfigurationIntent.__deallocating_deinit()
{
  return sub_100027C4C(type metadata accessor for SecurityAccessoryConfigurationIntent);
}

unint64_t SecurityAccessoryConfigurationIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_100027C84(a1);
}

unint64_t sub_1000275E0@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_100027C84(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t SecurityAccessoryConfigurationIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___SecurityAccessoryConfigurationIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *SecurityAccessoryConfigurationIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  NSString v5 = (char *)[objc_allocWithZone(v2) init];
  id v6 = &v5[OBJC_IVAR___SecurityAccessoryConfigurationIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  NSString v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

char *SecurityAccessoryConfigurationIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  NSString v5 = (char *)[v2 init];
  id v6 = &v5[OBJC_IVAR___SecurityAccessoryConfigurationIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  NSString v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

id SecurityAccessoryConfigurationIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___SecurityAccessoryConfigurationIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SecurityAccessoryConfigurationIntentResponse();
  return [super init];
}

id SecurityAccessoryConfigurationIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___SecurityAccessoryConfigurationIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SecurityAccessoryConfigurationIntentResponse();
  id v3 = [super initWithCoder:a1];

  return v3;
}

id SecurityAccessoryConfigurationIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithBackingStore:a1];

  return v3;
}

id SecurityAccessoryConfigurationIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___SecurityAccessoryConfigurationIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SecurityAccessoryConfigurationIntentResponse();
  id v3 = [super initWithBackingStore:a1];

  return v3;
}

id sub_100027A54(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  *(void *)&a1[OBJC_IVAR___SecurityAccessoryConfigurationIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for SecurityAccessoryConfigurationIntentResponse();
  return [super a3];
}

id SecurityAccessoryConfigurationIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    v2.super.Class isa = sub_100029E78().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.Class isa = 0;
  }
  id v3 = [objc_allocWithZone(v1) initWithPropertiesByName:v2.super.isa];

  return v3;
}

id SecurityAccessoryConfigurationIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___SecurityAccessoryConfigurationIntentResponse_code] = 0;
  if (a1)
  {
    v2.super.Class isa = sub_100029E78().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.Class isa = 0;
  }
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SecurityAccessoryConfigurationIntentResponse();
  [super initWithPropertiesByName:v2.super.isa];

  if (v3) {
  return v3;
  }
}

id SecurityAccessoryConfigurationIntentResponse.__deallocating_deinit()
{
  return sub_100027C4C(type metadata accessor for SecurityAccessoryConfigurationIntentResponse);
}

id sub_100027C4C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  [super dealloc];
}

unint64_t sub_100027C84(unint64_t result)
{
  if (result > 6) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for SecurityAccessoryConfigurationIntentResponse()
{
  return self;
}

unint64_t sub_100027CBC()
{
  unint64_t result = qword_100041E40;
  if (!qword_100041E40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041E40);
  }
  return result;
}

uint64_t sub_100027D10@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___SecurityAccessoryConfigurationIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_100027D64(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___SecurityAccessoryConfigurationIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for SecurityAccessoryConfigurationIntentResponseCode()
{
  return &type metadata for SecurityAccessoryConfigurationIntentResponseCode;
}

id ClimateSensorTypeConfigurationIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ClimateSensorTypeConfigurationIntent();
  return [super init];
}

uint64_t type metadata accessor for ClimateSensorTypeConfigurationIntent()
{
  return self;
}

id ClimateSensorTypeConfigurationIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ClimateSensorTypeConfigurationIntent();
  id v3 = [super initWithCoder:a1];

  return v3;
}

id ClimateSensorTypeConfigurationIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    NSString v5 = sub_100029EE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for ClimateSensorTypeConfigurationIntent();
  id v6 = [super initWithIdentifier:v5 backingStore:a3];

  return v6;
}

id ClimateSensorTypeConfigurationIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSString v7 = sub_100029EE8();
  swift_bridgeObjectRelease();
  NSString v8 = sub_100029EE8();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.Class isa = sub_100029E78().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.Class isa = 0;
  }
  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for ClimateSensorTypeConfigurationIntent();
  id v10 = [super initWithDomain:v7 verb:v8 parametersByName:v9.super.isa];

  return v10;
}

id ClimateSensorTypeConfigurationIntent.__deallocating_deinit()
{
  return sub_1000287B4(type metadata accessor for ClimateSensorTypeConfigurationIntent);
}

uint64_t ClimateSensorTypeConfigurationIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___ClimateSensorTypeConfigurationIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *ClimateSensorTypeConfigurationIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  NSString v5 = (char *)[objc_allocWithZone(v2) init];
  id v6 = &v5[OBJC_IVAR___ClimateSensorTypeConfigurationIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  NSString v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

char *ClimateSensorTypeConfigurationIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  NSString v5 = (char *)[v2 init];
  id v6 = &v5[OBJC_IVAR___ClimateSensorTypeConfigurationIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  NSString v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

id ClimateSensorTypeConfigurationIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___ClimateSensorTypeConfigurationIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ClimateSensorTypeConfigurationIntentResponse();
  return [super init];
}

id ClimateSensorTypeConfigurationIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___ClimateSensorTypeConfigurationIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ClimateSensorTypeConfigurationIntentResponse();
  [super initWithCoder:a1];

  return v3;
}

id ClimateSensorTypeConfigurationIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___ClimateSensorTypeConfigurationIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ClimateSensorTypeConfigurationIntentResponse();
  [super initWithBackingStore:a1];

  return v3;
}

id sub_100028640(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  *(void *)&a1[OBJC_IVAR___ClimateSensorTypeConfigurationIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for ClimateSensorTypeConfigurationIntentResponse();
  return [super a3];
}

id ClimateSensorTypeConfigurationIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___ClimateSensorTypeConfigurationIntentResponse_code] = 0;
  if (a1)
  {
    v2.super.Class isa = sub_100029E78().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.Class isa = 0;
  }
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ClimateSensorTypeConfigurationIntentResponse();
  [v5 initWithPropertiesByName:v2.super.isa];

  if (v3) {
  return v3;
  }
}

id ClimateSensorTypeConfigurationIntentResponse.__deallocating_deinit()
{
  return sub_1000287B4(type metadata accessor for ClimateSensorTypeConfigurationIntentResponse);
}

id sub_1000287B4(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t type metadata accessor for ClimateSensorTypeConfigurationIntentResponse()
{
  return self;
}

unint64_t sub_100028814()
{
  unint64_t result = qword_100041EA0;
  if (!qword_100041EA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041EA0);
  }
  return result;
}

uint64_t sub_100028868@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___ClimateSensorTypeConfigurationIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_1000288BC(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___ClimateSensorTypeConfigurationIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for ClimateSensorTypeConfigurationIntentResponseCode()
{
  return &type metadata for ClimateSensorTypeConfigurationIntentResponseCode;
}

id SecurityIntentAccessory.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    NSString v8 = sub_100029EE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }
  NSString v9 = sub_100029EE8();
  swift_bridgeObjectRelease();
  if (a6)
  {
    NSString v10 = sub_100029EE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }
  id v11 = [objc_allocWithZone(v6) initWithIdentifier:v8 displayString:v9 pronunciationHint:v10];

  return v11;
}

id SecurityIntentAccessory.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    NSString v8 = sub_100029EE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }
  NSString v9 = sub_100029EE8();
  swift_bridgeObjectRelease();
  if (a6)
  {
    NSString v10 = sub_100029EE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }
  v13.receiver = v6;
  v13.super_class = (Class)type metadata accessor for SecurityIntentAccessory();
  id v11 = [super initWithIdentifier:v8 displayString:v9 pronunciationHint:v10];

  return v11;
}

uint64_t type metadata accessor for SecurityIntentAccessory()
{
  return self;
}

id SecurityIntentAccessory.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SecurityIntentAccessory();
  [super initWithCoder:a1];

  return v3;
}

id SecurityIntentAccessory.__deallocating_deinit()
{
  return sub_10002936C(type metadata accessor for SecurityIntentAccessory);
}

id static SecurityIntentAccessoryResolutionResult.success(with:)(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___SecurityIntentAccessoryResolutionResult;
  [super successWithResolvedObject:a1];

  return v2;
}

id static SecurityIntentAccessoryResolutionResult.disambiguation(with:)(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_100028DF4();
    swift_bridgeObjectRetain();
    sub_10002A2B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_10002A4E8();
    sub_100028DF4();
  }
  uint64_t ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_100028DF4();
  Class isa = sub_10002A028().super.isa;
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___SecurityIntentAccessoryResolutionResult;
  [super disambiguationWithObjectsToDisambiguate:isa];

  return v3;
}

unint64_t sub_100028DF4()
{
  unint64_t result = qword_100041F20;
  if (!qword_100041F20)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100041F20);
  }
  return result;
}

id static SecurityIntentAccessoryResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___SecurityIntentAccessoryResolutionResult;
  [super confirmationRequiredWithObjectToConfirm:a1];

  return v2;
}

void static SecurityIntentAccessoryResolutionResult.success(with:)()
{
}

void static SecurityIntentAccessoryResolutionResult.disambiguation(with:)()
{
}

void static SecurityIntentAccessoryResolutionResult.confirmationRequired(with:)()
{
}

id SecurityIntentAccessoryResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  Class isa = sub_100029E78().super.isa;
  swift_bridgeObjectRelease();
  id v6 = [v4 initWithJSONDictionary:isa forIntent:a2];

  return v6;
}

id SecurityIntentAccessoryResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  Class isa = sub_100029E78().super.isa;
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for SecurityIntentAccessoryResolutionResult();
  id v5 = [super initWithJSONDictionary:isa, a2];

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for SecurityIntentAccessoryResolutionResult()
{
  return self;
}

id SecurityIntentAccessoryResolutionResult.__deallocating_deinit()
{
  return sub_10002936C(type metadata accessor for SecurityIntentAccessoryResolutionResult);
}

id sub_10002936C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

id ClimateSensorIntentType.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    NSString v8 = sub_100029EE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }
  NSString v9 = sub_100029EE8();
  swift_bridgeObjectRelease();
  if (a6)
  {
    NSString v10 = sub_100029EE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }
  v13.receiver = v6;
  v13.super_class = (Class)type metadata accessor for ClimateSensorIntentType();
  id v11 = [super initWithIdentifier:v8 displayString:v9 pronunciationHint:v10];

  return v11;
}

uint64_t type metadata accessor for ClimateSensorIntentType()
{
  return self;
}

id ClimateSensorIntentType.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ClimateSensorIntentType();
  id v3 = [super initWithCoder:a1];

  return v3;
}

id ClimateSensorIntentType.__deallocating_deinit()
{
  return sub_100029C50(type metadata accessor for ClimateSensorIntentType);
}

id static ClimateSensorIntentTypeResolutionResult.success(with:)(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___ClimateSensorIntentTypeResolutionResult;
  [super successWithResolvedObject:a1];

  return v2;
}

id static ClimateSensorIntentTypeResolutionResult.disambiguation(with:)(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_100028DF4();
    swift_bridgeObjectRetain();
    sub_10002A2B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_10002A4E8();
    sub_100028DF4();
  }
  uint64_t ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_100028DF4();
  Class isa = sub_10002A028().super.isa;
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___ClimateSensorIntentTypeResolutionResult;
  [super disambiguationWithObjectsToDisambiguate:isa];

  return v3;
}

id static ClimateSensorIntentTypeResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___ClimateSensorIntentTypeResolutionResult;
  [super confirmationRequiredWithObjectToConfirm:a1];

  return v2;
}

void static ClimateSensorIntentTypeResolutionResult.success(with:)()
{
}

void static ClimateSensorIntentTypeResolutionResult.disambiguation(with:)()
{
}

void static ClimateSensorIntentTypeResolutionResult.confirmationRequired(with:)()
{
}

id ClimateSensorIntentTypeResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  Class isa = sub_100029E78().super.isa;
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for ClimateSensorIntentTypeResolutionResult();
  id v5 = [super initWithJSONDictionary:isa, a2];

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for ClimateSensorIntentTypeResolutionResult()
{
  return self;
}

id ClimateSensorIntentTypeResolutionResult.__deallocating_deinit()
{
  return sub_100029C50(type metadata accessor for ClimateSensorIntentTypeResolutionResult);
}

id sub_100029C50(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t sub_100029C88()
{
  return __DataStorage._bytes.getter();
}

uint64_t sub_100029C98()
{
  return __DataStorage._length.getter();
}

uint64_t sub_100029CA8()
{
  return __DataStorage._offset.getter();
}

uint64_t sub_100029CB8()
{
  return _convertErrorToNSError(_:)();
}

void sub_100029CC8(NSURL *retstr@<X8>)
{
}

uint64_t sub_100029CD8()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100029CE8()
{
  return type metadata accessor for URL();
}

uint64_t sub_100029CF8()
{
  return Data.description.getter();
}

uint64_t sub_100029D08()
{
  return Data.hash(into:)();
}

uint64_t sub_100029D18()
{
  return Date.timeIntervalSinceReferenceDate.getter();
}

uint64_t sub_100029D28()
{
  return Date.init()();
}

uint64_t sub_100029D38()
{
  return type metadata accessor for Date();
}

uint64_t sub_100029D48()
{
  return UUID.init(uuidString:)();
}

uint64_t sub_100029D58()
{
  return UUID.uuidString.getter();
}

uint64_t sub_100029D68()
{
  return static UUID.== infix(_:_:)();
}

uint64_t sub_100029D78()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100029D88()
{
  return type metadata accessor for UUID();
}

uint64_t sub_100029D98()
{
  return static Locale.current.getter();
}

uint64_t sub_100029DA8()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100029DB8()
{
  return Logger.logObject.getter();
}

uint64_t sub_100029DC8()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100029DD8()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100029E58()
{
  return IntentConfiguration.init<A>(kind:intent:provider:content:)();
}

uint64_t sub_100029E68()
{
  return type metadata accessor for IntentConfiguration();
}

NSDictionary sub_100029E78()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100029E88()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100029E98()
{
  return static Comparable.> infix(_:_:)();
}

uint64_t sub_100029EA8()
{
  return static Comparable.>= infix(_:_:)();
}

uint64_t sub_100029EB8()
{
  return static Comparable.<= infix(_:_:)();
}

uint64_t sub_100029EC8()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_100029ED8()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_100029EE8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100029EF8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100029F08()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_100029F18()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100029F28()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t sub_100029F38()
{
  return String.hash(into:)();
}

void sub_100029F48(Swift::String a1)
{
}

Swift::Int sub_100029F58()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100029F68()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t sub_100029F78()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t sub_100029F98()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t sub_100029FA8()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t sub_100029FB8()
{
  return String.init<A>(_:)();
}

uint64_t sub_100029FC8()
{
  return String.subscript.getter();
}

uint64_t sub_100029FD8()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_100029FE8()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_100029FF8()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_10002A008()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_10002A018()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_10002A028()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10002A038()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10002A048()
{
  return Array.description.getter();
}

uint64_t sub_10002A058()
{
  return specialized Array._endMutation()();
}

uint64_t sub_10002A068()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_10002A078()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_10002A088()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10002A098()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10002A0A8()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_10002A0B8()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_10002A0C8()
{
  return Double.significandWidth.getter();
}

uint64_t sub_10002A0D8()
{
  return Double.write<A>(to:)();
}

uint64_t sub_10002A0E8()
{
  return Double.exponent.getter();
}

uint64_t sub_10002A0F8()
{
  return Float.significandWidth.getter();
}

uint64_t sub_10002A108()
{
  return Float.exponent.getter();
}

uint64_t sub_10002A118()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10002A128()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10002A138()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_10002A148()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10002A158()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10002A168()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_10002A188()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_10002A198()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_10002A1A8()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_10002A1B8()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_10002A1C8(Swift::Int a1)
{
}

uint64_t sub_10002A1D8()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10002A1E8()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10002A1F8()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_10002A208()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t sub_10002A218()
{
  return type metadata accessor for DecodingError();
}

uint64_t sub_10002A228()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10002A238()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_10002A248()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_10002A258()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_10002A268()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_10002A278()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10002A288()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_10002A298()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10002A2A8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10002A2B8()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_10002A2C8()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10002A2D8()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_10002A2E8()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_10002A2F8()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10002A308()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_10002A318(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_10002A328()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_10002A338()
{
  return KeyedDecodingContainer.codingPath.getter();
}

uint64_t sub_10002A348()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10002A358()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10002A368()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10002A378()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10002A388()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_10002A398()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10002A3A8()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10002A3B8()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10002A3C8()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10002A3D8()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10002A3E8()
{
  return KeyedDecodingContainer.allKeys.getter();
}

uint64_t sub_10002A3F8()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_10002A408()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10002A418()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10002A428()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10002A438()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10002A448()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_10002A458()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10002A468()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10002A478()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10002A488()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10002A498()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

Swift::Int sub_10002A4B8(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_10002A4C8()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_10002A4D8()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10002A4E8()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t sub_10002A4F8()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t sub_10002A508()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t sub_10002A518()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10002A528()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10002A538()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t sub_10002A548()
{
  return Hasher.init(_seed:)();
}

void sub_10002A558(Swift::UInt a1)
{
}

void sub_10002A568(Swift::UInt8 a1)
{
}

void sub_10002A578(Swift::UInt16 a1)
{
}

void sub_10002A588(Swift::UInt32 a1)
{
}

void sub_10002A598(Swift::UInt64 a1)
{
}

Swift::Int sub_10002A5A8()
{
  return Hasher._finalize()();
}

uint64_t sub_10002A5B8()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_10002A5C8()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

{
}

{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void exit(int a1)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}