uint64_t dispatch thunk of RRLinkSystemEntityHandling.systemEntityProtocolIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_21DE1877C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for MessageConversationStructuredDataHandler()
{
  return &type metadata for MessageConversationStructuredDataHandler;
}

uint64_t sub_21DE187B8()
{
  return 0x475F6E6F6D6D6F63;
}

uint64_t sub_21DE187D8()
{
  return 11;
}

unint64_t sub_21DE187E0()
{
  return 0xD000000000000020;
}

uint64_t sub_21DE187FC()
{
  return 0;
}

uint64_t sub_21DE18808(void *a1)
{
  uint64_t v2 = sub_21DE3DBB0();
  unint64_t v4 = sub_21DE188A8(a1, v2, v3);
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_21DE23668(0, 0, 0, 0, v4, 0, 0, 0, 0xF000000000000000);
  swift_release();
  return v5;
}

unint64_t sub_21DE188A8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_21DE3D4D0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21DE3D5F0();
  swift_allocObject();
  uint64_t v10 = sub_21DE3D5E0();
  sub_21DE18B54(a1);
  if (v11)
  {
    sub_21DE3D5D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_21DE3D5D0();
  }
  id v12 = objc_msgSend(a1, sel_messageConversationIdentifier);
  sub_21DE3DD80();

  swift_bridgeObjectRetain();
  sub_21DE3D4A0();
  sub_21DE3D400();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  unint64_t result = sub_21DE18BB8(a1);
  if (!result) {
    goto LABEL_16;
  }
  unint64_t v14 = result;
  if (!(result >> 62))
  {
    uint64_t v15 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v15) {
      goto LABEL_7;
    }
LABEL_15:
    swift_bridgeObjectRelease();
LABEL_16:
    uint64_t v19 = MEMORY[0x223C18C90](v10);
    swift_release();
    return v19;
  }
  unint64_t result = sub_21DE3E100();
  uint64_t v15 = result;
  if (!result) {
    goto LABEL_15;
  }
LABEL_7:
  if (v15 >= 1)
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if ((v14 & 0xC000000000000001) != 0) {
        id v17 = (id)MEMORY[0x223C19800](i, v14);
      }
      else {
        id v17 = *(id *)(v14 + 8 * i + 32);
      }
      v18 = v17;
      if (sub_21DE3A740(a2, a3, v17))
      {
        swift_retain();
        sub_21DE3D5C0();
        swift_release_n();
      }
    }
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

unint64_t sub_21DE18B18()
{
  return 0xD000000000000020;
}

uint64_t sub_21DE18B38(void **a1)
{
  return sub_21DE18808(*a1);
}

uint64_t sub_21DE18B54(void *a1)
{
  id v1 = objc_msgSend(a1, sel_groupName);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_21DE3DD80();

  return v3;
}

uint64_t sub_21DE18BB8(void *a1)
{
  id v1 = objc_msgSend(a1, sel_recipients);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  sub_21DE18C18();
  uint64_t v3 = sub_21DE3DED0();

  return v3;
}

unint64_t sub_21DE18C18()
{
  unint64_t result = qword_267D22540;
  if (!qword_267D22540)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267D22540);
  }
  return result;
}

uint64_t sub_21DE18C58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t sub_21DE18C6C()
{
  type metadata accessor for BaseQueryMatcher();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_21DE1AC98();
  qword_26AD32C00 = v0;
  return result;
}

uint64_t sub_21DE18CAC()
{
  uint64_t result = sub_21DE18CE0(0x2E217D7B5D5B2928, 0xE800000000000000);
  qword_267D22640 = result;
  return result;
}

uint64_t sub_21DE18CE0(uint64_t a1, unint64_t a2)
{
  sub_21DE3DDE0();
  uint64_t v4 = sub_21DE3DF40();
  uint64_t v13 = v4;
  uint64_t v5 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
  }
  v12[2] = a1;
  v12[3] = a2;
  v12[4] = 0;
  v12[5] = v5;
  uint64_t v6 = sub_21DE3DE10();
  if (v7)
  {
    uint64_t v8 = v6;
    uint64_t v9 = v7;
    do
    {
      sub_21DE1BF60(v12, v8, v9);
      swift_bridgeObjectRelease();
      uint64_t v8 = sub_21DE3DE10();
      uint64_t v9 = v10;
    }
    while (v10);
    uint64_t v4 = v13;
  }
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_21DE18DA0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5 = sub_21DE3DB20();
  char v6 = sub_21DE19100(v5, a2, a3);
  swift_release();
  if (v6)
  {
    char v9 = 1;
  }
  else
  {
    uint64_t v7 = sub_21DE3DB30();
    if (v7)
    {
      unint64_t v8 = v7;
      swift_retain();
      sub_21DE18F5C(v8);
      OUTLINED_FUNCTION_28();
    }
    sub_21DE3DB20();
    uint64_t v10 = sub_21DE3D9E0();
    uint64_t v12 = v11;
    swift_release();
    if (v10 == 0x505F6E6F6D6D6F63 && v12 == 0xED00006E6F737265)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_21DE3E180();
      OUTLINED_FUNCTION_28();
      char v9 = 0;
      if ((v10 & 1) == 0) {
        return v9 & 1;
      }
    }
    if (sub_21DE3D9E0() == 0xD000000000000012 && v14 == 0x800000021DE3F890)
    {
      swift_bridgeObjectRelease();
      char v9 = a3;
    }
    else
    {
      OUTLINED_FUNCTION_6();
      OUTLINED_FUNCTION_28();
      char v9 = 0;
    }
  }
  return v9 & 1;
}

uint64_t sub_21DE18F5C(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = sub_21DE3E100())
  {
    uint64_t v3 = 4;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        MEMORY[0x223C19800](v3 - 4, a1);
      }
      else {
        swift_retain();
      }
      uint64_t v4 = v3 - 3;
      if (__OFADD__(v3 - 4, 1)) {
        break;
      }
      uint64_t v5 = sub_21DE3D9E0();
      uint64_t v7 = v6;
      if (v5 == sub_21DE3D9E0() && v7 == v8)
      {
        swift_release();
        swift_bridgeObjectRelease();
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t v11 = 1;
        goto LABEL_20;
      }
      char v10 = sub_21DE3E180();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v10)
      {
        swift_release();
        uint64_t v11 = 1;
        goto LABEL_20;
      }
      ++v3;
      if (v4 == v2) {
        goto LABEL_19;
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
  }
LABEL_19:
  swift_release();
  uint64_t v11 = 0;
LABEL_20:
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_21DE19100(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = sub_21DE3D9E0();
  uint64_t v6 = v5;
  uint64_t v7 = sub_21DE3D9E0();
  uint64_t v9 = v8;
  BOOL v10 = v4 == 0x535F6E6F6D6D6F63 && v6 == 0xEE00676E69747465;
  if (v10 || (OUTLINED_FUNCTION_32(), (OUTLINED_FUNCTION_2() & 1) != 0))
  {
    BOOL v11 = v7 == 0x535F6E6F6D6D6F63 && v9 == 0xEE00676E69747465;
    if (v11 || (OUTLINED_FUNCTION_2() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return 1;
    }
  }
  BOOL v13 = v4 == v7 && v6 == v9;
  if (v13
    || (OUTLINED_FUNCTION_32(), (sub_21DE3E180() & 1) != 0)
    || (v4 == 0x6E456F4E5F6F7375 ? (BOOL v18 = v6 == 0xEC00000079746974) : (BOOL v18 = 0),
        v18 || (OUTLINED_FUNCTION_32(), (sub_21DE3E180() & 1) != 0)))
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  uint64_t v19 = sub_21DE28204(v7, v9, *(void *)(v3 + OBJC_IVAR____TtC21SiriReferenceResolver16BaseQueryMatcher_equivalentTypesForEntityType));
  if (v19)
  {
    uint64_t v20 = (void *)v19;
    uint64_t v21 = OUTLINED_FUNCTION_32();
    char v23 = sub_21DE1E828(v21, v22, v20);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v23 & 1) == 0) {
      goto LABEL_29;
    }
LABEL_18:
    uint64_t v14 = sub_21DE3D9C0();
    uint64_t v15 = sub_21DE3D9C0();
    sub_21DE1932C(v14, v15, v7, v9, a3 & 1);
    char v17 = v16;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v17 & 1;
  }
  swift_bridgeObjectRelease();
LABEL_29:
  swift_bridgeObjectRelease();
  return 0;
}

void sub_21DE1932C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = a4;
  uint64_t v7 = a3;
  uint64_t v78 = a2 + 64;
  uint64_t v9 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & *(void *)(a2 + 64);
  uint64_t v71 = OBJC_IVAR____TtC21SiriReferenceResolver16BaseQueryMatcher_equivalentTypesForEntityType;
  int64_t v79 = (unint64_t)(v9 + 63) >> 6;
  BOOL v12 = a3 == 0xD000000000000015 && a4 == 0x800000021DE3F540;
  int v13 = v12;
  int v75 = v13;
  swift_bridgeObjectRetain();
  int64_t v14 = 0;
  OUTLINED_FUNCTION_4();
  uint64_t v72 = v15;
  uint64_t v73 = v16;
  uint64_t v74 = v7;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        while (1)
        {
          if (v11)
          {
            unint64_t v17 = __clz(__rbit64(v11));
            v11 &= v11 - 1;
            unint64_t v18 = v17 | (v14 << 6);
          }
          else
          {
            int64_t v19 = v14 + 1;
            if (__OFADD__(v14, 1))
            {
              __break(1u);
LABEL_113:
              __break(1u);
LABEL_114:
              __break(1u);
LABEL_115:
              __break(1u);
              return;
            }
            if (v19 >= v79) {
              goto LABEL_111;
            }
            unint64_t v20 = *(void *)(v78 + 8 * v19);
            ++v14;
            if (!v20)
            {
              int64_t v14 = v19 + 1;
              if (v19 + 1 >= v79) {
                goto LABEL_111;
              }
              unint64_t v20 = *(void *)(v78 + 8 * v14);
              if (!v20)
              {
                int64_t v14 = v19 + 2;
                if (v19 + 2 >= v79) {
                  goto LABEL_111;
                }
                unint64_t v20 = *(void *)(v78 + 8 * v14);
                if (!v20)
                {
                  int64_t v21 = v19 + 3;
                  if (v21 >= v79) {
                    goto LABEL_111;
                  }
                  unint64_t v20 = *(void *)(v78 + 8 * v21);
                  if (!v20)
                  {
                    while (1)
                    {
                      int64_t v14 = v21 + 1;
                      if (__OFADD__(v21, 1)) {
                        goto LABEL_113;
                      }
                      if (v14 >= v79) {
                        goto LABEL_111;
                      }
                      unint64_t v20 = *(void *)(v78 + 8 * v14);
                      ++v21;
                      if (v20) {
                        goto LABEL_25;
                      }
                    }
                  }
                  int64_t v14 = v21;
                }
              }
            }
LABEL_25:
            unint64_t v11 = (v20 - 1) & v20;
            unint64_t v18 = __clz(__rbit64(v20)) + (v14 << 6);
          }
          uint64_t v22 = (uint64_t *)(*(void *)(a2 + 48) + 16 * v18);
          uint64_t v23 = *v22;
          uint64_t v24 = v22[1];
          unint64_t v25 = *(void *)(*(void *)(a2 + 56) + 8 * v18);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if ((sub_21DE3DE80() & 1) == 0) {
            break;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        if (a5)
        {
          BOOL v26 = v23 == 0x6C6562616CLL && v24 == 0xE500000000000000;
          if (v26 || (OUTLINED_FUNCTION_27(), (OUTLINED_FUNCTION_17() & 1) != 0))
          {
            if (v75 || (OUTLINED_FUNCTION_31(), (OUTLINED_FUNCTION_6() & 1) != 0))
            {
              swift_bridgeObjectRelease();
LABEL_37:
              swift_bridgeObjectRelease();
              v27 = sub_21DE3DAA0();
              os_log_type_t v28 = sub_21DE3DF50();
              if (!os_log_type_enabled(v27, v28)) {
                goto LABEL_65;
              }
              v29 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v29 = 0;
              v30 = v27;
              os_log_type_t v31 = v28;
              v32 = "Disable label matching qualified";
              goto LABEL_64;
            }
            uint64_t v33 = *(void *)(v77 + v71);
            if (*(void *)(v33 + 16))
            {
              swift_bridgeObjectRetain();
              uint64_t v34 = OUTLINED_FUNCTION_31();
              unint64_t v36 = sub_21DE2A8C0(v34, v35);
              if (v37)
              {
                unsigned int v70 = a5;
                uint64_t v38 = *(void *)(*(void *)(v33 + 56) + 8 * v36);
                swift_bridgeObjectRetain();
                swift_bridgeObjectRelease();
                uint64_t v39 = *(void *)(v38 + 16);
                if (v39)
                {
                  OUTLINED_FUNCTION_13();
                  if (v12 && (OUTLINED_FUNCTION_16(), v12) || (OUTLINED_FUNCTION_3() & 1) != 0)
                  {
LABEL_46:
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    a5 = v70;
                    goto LABEL_37;
                  }
                  if (v39 != 1)
                  {
                    OUTLINED_FUNCTION_13();
                    if (v12)
                    {
                      OUTLINED_FUNCTION_16();
                      if (v12) {
                        goto LABEL_46;
                      }
                    }
                    if (OUTLINED_FUNCTION_3()) {
                      goto LABEL_46;
                    }
                    if (v39 != 2)
                    {
                      uint64_t v65 = v38 + 72;
                      uint64_t v66 = 2;
                      while (!__OFADD__(v66, 1))
                      {
                        uint64_t v67 = v66 + 1;
                        uint64_t v68 = v66;
                        uint64_t v69 = v65;
                        OUTLINED_FUNCTION_13();
                        if (v12)
                        {
                          OUTLINED_FUNCTION_16();
                          if (v12) {
                            goto LABEL_46;
                          }
                        }
                        if (OUTLINED_FUNCTION_3()) {
                          goto LABEL_46;
                        }
                        uint64_t v65 = v69 + 16;
                        uint64_t v66 = v68 + 1;
                        if (v67 == v39) {
                          goto LABEL_49;
                        }
                      }
                      goto LABEL_115;
                    }
                  }
                }
LABEL_49:
                swift_bridgeObjectRelease();
                a5 = v70;
              }
              else
              {
                swift_bridgeObjectRelease();
              }
            }
          }
        }
        if (v23 != 1701869940 || v24 != 0xE400000000000000)
        {
          OUTLINED_FUNCTION_27();
          if ((sub_21DE3E180() & 1) == 0) {
            break;
          }
        }
        if (qword_26AD32AB8 != -1) {
          swift_once();
        }
        if (qword_26AD32C38 != v7 || unk_26AD32C40 != v6)
        {
          OUTLINED_FUNCTION_31();
          if ((sub_21DE3E180() & 1) == 0) {
            break;
          }
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v27 = sub_21DE3DAA0();
        os_log_type_t v42 = sub_21DE3DF50();
        if (!os_log_type_enabled(v27, v42)) {
          goto LABEL_65;
        }
        v29 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v29 = 0;
        v30 = v27;
        os_log_type_t v31 = v42;
        v32 = "Skip matching common_Calendar.type.common_CalendarEventType";
LABEL_64:
        _os_log_impl(&dword_21DE16000, v30, v31, v32, v29, 2u);
        MEMORY[0x223C19EE0](v29, -1, -1);
LABEL_65:
      }
      if (!*(void *)(a1 + 16))
      {
        swift_bridgeObjectRelease();
LABEL_108:
        swift_release();
LABEL_110:
        swift_bridgeObjectRelease();
        return;
      }
      swift_bridgeObjectRetain();
      uint64_t v43 = OUTLINED_FUNCTION_27();
      unint64_t v45 = sub_21DE2A8C0(v43, v44);
      if ((v46 & 1) == 0)
      {
        swift_release();
        swift_bridgeObjectRelease_n();
        goto LABEL_110;
      }
      uint64_t v47 = a5;
      unint64_t v48 = *(void *)(*(void *)(a1 + 56) + 8 * v45);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v49 = v6;
      uint64_t v50 = v47;
      uint64_t v51 = v7;
      uint64_t v52 = v49;
      LOBYTE(v47) = sub_21DE19AF4(v48, v25, v51, v49, v23, v24, v47 & 1);
      swift_bridgeObjectRelease();
      if ((v47 & 1) == 0) {
        break;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      a5 = v50;
      uint64_t v6 = v52;
      uint64_t v7 = v74;
    }
    if (v23 == 1701667182 && v24 == 0xE400000000000000)
    {
      swift_bridgeObjectRelease();
      a5 = v50;
      goto LABEL_77;
    }
    OUTLINED_FUNCTION_27();
    char v54 = OUTLINED_FUNCTION_23();
    swift_bridgeObjectRelease();
    a5 = v50;
    if ((v54 & 1) == 0) {
      break;
    }
LABEL_77:
    if (!*(void *)(a1 + 16)) {
      goto LABEL_108;
    }
    unint64_t v55 = sub_21DE2A8C0(0xD000000000000018, v73);
    if ((v56 & 1) == 0) {
      goto LABEL_108;
    }
    unint64_t v57 = *(void *)(*(void *)(a1 + 56) + 8 * v55);
    if (v57 >> 62)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v58 = sub_21DE3E100();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v58 = *(void *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    uint64_t v6 = v52;
    uint64_t v7 = v74;
    if (!v58)
    {
LABEL_106:
      swift_release();
      swift_bridgeObjectRelease();
      goto LABEL_110;
    }
    if ((v57 & 0xC000000000000001) != 0)
    {
      OUTLINED_FUNCTION_19();
    }
    else
    {
      if (!*(void *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_114;
      }
      swift_retain();
    }
    swift_bridgeObjectRelease();
    uint64_t v59 = sub_21DE3D990();
    swift_release();
    if (!v59) {
      goto LABEL_108;
    }
    uint64_t v60 = sub_21DE3D9C0();
    swift_release();
    if (!*(void *)(v60 + 16)) {
      goto LABEL_106;
    }
    unint64_t v61 = sub_21DE2A8C0(0x6C6562616CLL, 0xE500000000000000);
    if ((v62 & 1) == 0) {
      goto LABEL_106;
    }
    unint64_t v63 = *(void *)(*(void *)(v60 + 56) + 8 * v61);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    char v64 = sub_21DE19AF4(v63, v25, 0xD000000000000012, v72, 0x6C6562616CLL, 0xE500000000000000, a5 & 1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v64 & 1) == 0) {
      goto LABEL_111;
    }
  }
  swift_bridgeObjectRelease();
LABEL_111:
  swift_release();
}

uint64_t sub_21DE19AF4(unint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_21DE3E100();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v15 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_21DE3E100();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v16 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v16 >= v15)
  {
    uint64_t v19 = MEMORY[0x263F8EE88];
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    char v17 = sub_21DE19C48(a2, v7, a1, &v19, a3, a4, a5, a6, a7 & 1);
    swift_bridgeObjectRelease();
  }
  else
  {
    char v17 = 0;
  }
  return v17 & 1;
}

uint64_t sub_21DE19C48(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1 >> 62) {
    goto LABEL_12;
  }
  uint64_t v10 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v10; uint64_t v10 = sub_21DE3E100())
  {
    uint64_t v11 = 4;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        uint64_t v12 = MEMORY[0x223C19800](v11 - 4, a1);
      }
      else
      {
        uint64_t v12 = *(void *)(a1 + 8 * v11);
        swift_retain();
      }
      uint64_t v13 = v11 - 3;
      if (__OFADD__(v11 - 4, 1)) {
        break;
      }
      char v14 = sub_21DE19D98(v12, a3, a4, a5, a6, a7, a8, a9 & 1);
      swift_release();
      if (v14)
      {
        ++v11;
        if (v13 != v10) {
          continue;
        }
      }
      goto LABEL_14;
    }
    __break(1u);
LABEL_12:
    swift_bridgeObjectRetain();
  }
  char v14 = 1;
LABEL_14:
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v14 & 1;
}

uint64_t sub_21DE19D98(uint64_t a1, unint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  if (a2 >> 62) {
    goto LABEL_22;
  }
  uint64_t v11 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v11; uint64_t v11 = sub_21DE3E100())
  {
    unint64_t v12 = 0;
    a3 = (uint64_t *)*a3;
    uint64_t v13 = a3 + 7;
    a8 &= 1u;
    while (1)
    {
      if ((a2 & 0xC000000000000001) != 0)
      {
        MEMORY[0x223C19800](v12, a2);
      }
      else
      {
        if (v12 >= *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_21;
        }
        swift_retain();
      }
      unint64_t v14 = v12 + 1;
      if (__OFADD__(v12, 1)) {
        break;
      }
      if (a3[2])
      {
        uint64_t v15 = sub_21DE3E200();
        uint64_t v16 = -1 << *((unsigned char *)a3 + 32);
        unint64_t v17 = v15 & ~v16;
        if ((*(unint64_t *)((char *)v13 + ((v17 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v17))
        {
          uint64_t v18 = a3[6];
          if (*(void *)(v18 + 8 * v17) == v12) {
            goto LABEL_17;
          }
          uint64_t v19 = ~v16;
          while (1)
          {
            unint64_t v17 = (v17 + 1) & v19;
            if (((*(unint64_t *)((char *)v13 + ((v17 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v17) & 1) == 0) {
              break;
            }
            if (*(void *)(v18 + 8 * v17) == v12) {
              goto LABEL_17;
            }
          }
        }
      }
      sub_21DE1A0B8();
      if (v20)
      {
        swift_bridgeObjectRelease();
        sub_21DE1C0F0(&v22, v12);
        swift_release();
        return 1;
      }
LABEL_17:
      swift_release();
      ++v12;
      if (v14 == v11) {
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_21DE19F80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_21DE3E210();
    sub_21DE3DD50();
    uint64_t v6 = sub_21DE3E230();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_21DE3E180() & 1) != 0) {
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
          if (v17 || (sub_21DE3E180() & 1) != 0) {
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

void sub_21DE1A0B8()
{
  OUTLINED_FUNCTION_9();
  uint64_t v1 = v0;
  sub_21DE3D960();
  if (v2)
  {
    type metadata accessor for BaseQueryMatcher();
    sub_21DE1A1C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = sub_21DE3D970();
    if (v4)
    {
      if (sub_21DE3D990())
      {
        sub_21DE1A6F8();
      }
      else
      {
        if (!sub_21DE3D9A0()) {
          goto LABEL_10;
        }
        sub_21DE1A760();
      }
      swift_release();
      goto LABEL_10;
    }
    sub_21DE1A6C4(v1, v3);
  }
LABEL_10:
  OUTLINED_FUNCTION_5();
}

void sub_21DE1A1C8()
{
  OUTLINED_FUNCTION_9();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = sub_21DE3D960();
  if (!v11) {
    goto LABEL_49;
  }
  uint64_t v12 = v10;
  uint64_t v13 = v11;
  if (v1)
  {
    BOOL v14 = v3 == 1701667182 && v1 == 0xE400000000000000;
    if (v14 || (OUTLINED_FUNCTION_23() & 1) != 0)
    {
      OUTLINED_FUNCTION_14();
      sub_21DE1A478();
LABEL_48:
      OUTLINED_FUNCTION_29();
      goto LABEL_49;
    }
    BOOL v15 = v3 == 0x6C6562616CLL && v1 == 0xE500000000000000;
    if (v15 || (OUTLINED_FUNCTION_17() & 1) != 0)
    {
      if (!v5) {
        goto LABEL_50;
      }
      if (v7 == 0xD000000000000012 && v5 == 0x800000021DE3F890
        || (OUTLINED_FUNCTION_6() & 1) != 0
        || v7 == 0xD000000000000013 && v5 == 0x800000021DE3F8B0
        || (OUTLINED_FUNCTION_12() & 1) != 0)
      {
        goto LABEL_47;
      }
LABEL_28:
      char v16 = OUTLINED_FUNCTION_6();
      if (!v1 || (v16 & 1) == 0) {
        goto LABEL_36;
      }
      goto LABEL_30;
    }
  }
  if (!v5) {
    goto LABEL_50;
  }
  if (v7 != 0xD000000000000012 || v5 != 0x800000021DE3F890) {
    goto LABEL_28;
  }
  if (v1)
  {
LABEL_30:
    OUTLINED_FUNCTION_24();
    BOOL v17 = v14 && v1 == 0xE500000000000000;
    if (v17 || (OUTLINED_FUNCTION_10() & 1) != 0)
    {
      sub_21DE1A500(v12, v13, v9);
      goto LABEL_48;
    }
LABEL_36:
    if (v7 == 0xD000000000000014)
    {
      OUTLINED_FUNCTION_4();
      if (v5 == v18)
      {
        if (!v1) {
          goto LABEL_50;
        }
LABEL_42:
        OUTLINED_FUNCTION_24();
        BOOL v20 = v14 && v1 == 0xE500000000000000;
        if (v20 || (OUTLINED_FUNCTION_10() & 1) != 0)
        {
LABEL_47:
          OUTLINED_FUNCTION_14();
          sub_21DE1A608();
          goto LABEL_48;
        }
        goto LABEL_50;
      }
    }
  }
  char v19 = OUTLINED_FUNCTION_12();
  if (v1 && (v19 & 1) != 0) {
    goto LABEL_42;
  }
LABEL_50:
  uint64_t v21 = sub_21DE3DDA0();
  uint64_t v23 = v22;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_15();
  if (v21 == sub_21DE3DDA0() && v23 == v24)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    sub_21DE3E180();
    OUTLINED_FUNCTION_28();
    swift_bridgeObjectRelease();
  }
LABEL_49:
  OUTLINED_FUNCTION_5();
}

uint64_t sub_21DE1A478()
{
  sub_21DE1A904();
  uint64_t v8 = sub_21DE1A904();
  unint64_t v0 = sub_21DE1BF14();
  char v6 = OUTLINED_FUNCTION_1(v0, MEMORY[0x263F8D310], v1, v0, v2, v3, v4, v5, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6 & 1;
}

uint64_t sub_21DE1A500(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v4 = sub_21DE1DDC4();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_31();
  id v5 = sub_21DE1AA88();
  sub_21DE1E3FC(v5);
  if (v6)
  {
    OUTLINED_FUNCTION_33();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_15();
    id v7 = sub_21DE1AA88();
    uint64_t v8 = sub_21DE1E3FC(v7);
    if (v9)
    {
      uint64_t v29 = v8;
      unint64_t v10 = sub_21DE1BF14();
      OUTLINED_FUNCTION_1(v10, MEMORY[0x263F8D310], v11, v10, v12, v13, v14, v15, v29);
      OUTLINED_FUNCTION_29();
    }
    else
    {
      unint64_t v22 = sub_21DE1BF14();
      char v4 = OUTLINED_FUNCTION_1(v22, MEMORY[0x263F8D310], v23, v22, v24, v25, v26, v27, a3);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v16 = sub_21DE1BF14();
    char v4 = OUTLINED_FUNCTION_1(v16, MEMORY[0x263F8D310], v17, v16, v18, v19, v20, v21, a3);
  }
  return v4 & 1;
}

uint64_t sub_21DE1A608()
{
  uint64_t v0 = sub_21DE1A904();
  OUTLINED_FUNCTION_33();
  uint64_t v1 = sub_21DE1A904();
  unint64_t v2 = sub_21DE1BF14();
  uint64_t v9 = OUTLINED_FUNCTION_20(v2, MEMORY[0x263F8D310], v3, v4, v5, v6, v7, v8, v1);
  if (v9)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v16 = 1;
  }
  else
  {
    char v16 = OUTLINED_FUNCTION_20(v9, MEMORY[0x263F8D310], v10, v11, v12, v13, v14, v15, v0);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v16 & 1;
}

BOOL sub_21DE1A6C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_21DE3D970();
  return (v4 & 1) == 0 && v3 == a2;
}

uint64_t sub_21DE1A6F8()
{
  uint64_t result = sub_21DE3D990();
  if (result)
  {
    uint64_t v1 = OUTLINED_FUNCTION_15();
    char v2 = sub_21DE19100(v1);
    swift_release();
    return v2 & 1;
  }
  return result;
}

uint64_t sub_21DE1A760()
{
  uint64_t result = sub_21DE3D9A0();
  if (result)
  {
    char v1 = sub_21DE1A7B8();
    swift_release();
    return v1 & 1;
  }
  return result;
}

uint64_t sub_21DE1A7B8()
{
  uint64_t v0 = sub_21DE3D440();
  uint64_t v2 = v1;
  uint64_t v3 = sub_21DE3D440();
  if (!v2) {
    goto LABEL_12;
  }
  if (!v4)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if (v0 == v3 && v2 == v4)
  {
    swift_bridgeObjectRelease();
LABEL_12:
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  char v6 = sub_21DE3E180();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = 0;
  if (v6)
  {
LABEL_13:
    uint64_t v8 = sub_21DE3D430();
    uint64_t v9 = sub_21DE3D430();
    uint64_t v10 = v9;
    if (!v8)
    {
      swift_release();
      return 1;
    }
    if (v9)
    {
      swift_retain();
      char v11 = sub_21DE1A0B8(v10, v8, 0, 0, 0, 0, 0);
      swift_release();
      swift_release_n();
      return v11 & 1;
    }
    swift_release();
    return 0;
  }
  return result;
}

uint64_t sub_21DE1A904()
{
  swift_bridgeObjectRetain();
  sub_21DE3DE10();
  if (v0)
  {
    do
    {
      if (qword_267D221E8 != -1) {
        swift_once();
      }
      uint64_t v1 = OUTLINED_FUNCTION_15();
      if ((sub_21DE19F80(v1, v2, v3) & 1) == 0)
      {
        uint64_t v4 = OUTLINED_FUNCTION_15();
        MEMORY[0x223C19580](v4);
      }
      swift_bridgeObjectRelease();
      sub_21DE3DE10();
    }
    while (v5);
  }
  swift_bridgeObjectRelease();
  sub_21DE1BF14();
  sub_21DE3DFE0();
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_21DE3DDA0();
  swift_bridgeObjectRelease();
  return v6;
}

id sub_21DE1AA88()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_21DE3DD70();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithStringValue_, v1);

  return v2;
}

uint64_t sub_21DE1AAFC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC21SiriReferenceResolver16BaseQueryMatcher_logger;
  uint64_t v2 = sub_21DE3DAC0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_21DE1ABAC()
{
  return type metadata accessor for BaseQueryMatcher();
}

uint64_t type metadata accessor for BaseQueryMatcher()
{
  uint64_t result = qword_26AD32A78;
  if (!qword_26AD32A78) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21DE1ABFC()
{
  uint64_t result = sub_21DE3DAC0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_21DE1AC98()
{
  type metadata accessor for BaseQueryMatcher();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD32A88);
  sub_21DE3DD90();
  sub_21DE3DAB0();
  uint64_t v1 = OBJC_IVAR____TtC21SiriReferenceResolver16BaseQueryMatcher_equivalentTypesForEntityType;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32BB0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21DE3E8C0;
  strcpy((char *)(inited + 32), "common_Group");
  *(unsigned char *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  *(void *)(inited + 48) = &unk_26CEBE7F0;
  *(void *)(inited + 56) = 0xD000000000000013;
  OUTLINED_FUNCTION_4();
  *(void *)(v3 + 64) = v4;
  *(void *)(v3 + 72) = &unk_26CEBE820;
  OUTLINED_FUNCTION_4();
  v5[10] = v7;
  v5[11] = v6;
  v5[12] = &unk_26CEBE850;
  v5[13] = 0xD000000000000010;
  OUTLINED_FUNCTION_4();
  *(void *)(v8 + 112) = v9;
  *(void *)(v8 + 120) = &unk_26CEBE880;
  strcpy((char *)(v8 + 128), "common_Message");
  *(unsigned char *)(v8 + 143) = -18;
  *(void *)(v8 + 144) = &unk_26CEBE8B0;
  strcpy((char *)(v8 + 152), "common_Email");
  *(unsigned char *)(v8 + 165) = 0;
  *(_WORD *)(v8 + 166) = -5120;
  *(void *)(v8 + 168) = &unk_26CEBE8E0;
  OUTLINED_FUNCTION_4();
  v10[22] = 0xD000000000000010;
  v10[23] = v11;
  v10[24] = &unk_26CEBE910;
  v10[25] = v12;
  v10[26] = 0x800000021DE3F870;
  v10[27] = &unk_26CEBE940;
  OUTLINED_FUNCTION_4();
  v13[28] = v15;
  v13[29] = v14;
  v13[30] = &unk_26CEBE970;
  v13[31] = v16;
  v13[32] = 0x800000021DE3F8B0;
  v13[33] = &unk_26CEBE9A0;
  v13[34] = 0xD000000000000016;
  v13[35] = 0x800000021DE3F980;
  v13[36] = &unk_26CEBE9D0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32B80);
  *(void *)(v0 + v1) = sub_21DE3DD30();
  return v0;
}

uint64_t sub_21DE1AEEC(uint64_t a1, uint64_t a2, char a3)
{
  return sub_21DE18DA0(a1, a2, a3) & 1;
}

void sub_21DE1AF14()
{
  type metadata accessor for AttachmentQueryMatcher();
  uint64_t v0 = swift_allocObject();
  sub_21DE1B3F0();
  qword_26AD32C90 = v0;
}

uint64_t sub_21DE1AF50()
{
  uint64_t v4 = v1;
  OUTLINED_FUNCTION_25();
  uint64_t v5 = sub_21DE1B1C0();
  swift_release();
  if (!v5) {
    goto LABEL_31;
  }
  uint64_t v6 = sub_21DE3D9E0();
  uint64_t v8 = v7;
  swift_release();
  uint64_t v9 = *(void *)(v4 + 16);
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_21DE2824C(v6, v8, v9);
  uint64_t v12 = v11;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_21DE3D9E0();
  if (v12)
  {
    if (v13 == v10 && v12 == v14) {
      goto LABEL_25;
    }
    char v16 = OUTLINED_FUNCTION_26();
    swift_bridgeObjectRelease();
    if (v16) {
      goto LABEL_26;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v17 = sub_21DE3D9C0();
  uint64_t v18 = sub_21DE28204(0xD000000000000018, 0x800000021DE3F850, v17);
  swift_bridgeObjectRelease();
  if (!v18) {
    goto LABEL_29;
  }
  OUTLINED_FUNCTION_22();
  if (!v20)
  {
    if (*(void *)(v19 + 16)) {
      goto LABEL_13;
    }
LABEL_28:
    swift_bridgeObjectRelease();
    goto LABEL_29;
  }
  swift_bridgeObjectRetain();
  uint64_t v27 = sub_21DE3E100();
  swift_bridgeObjectRelease();
  if (!v27) {
    goto LABEL_28;
  }
LABEL_13:
  OUTLINED_FUNCTION_7();
  if ((v18 & 0xC000000000000001) != 0) {
    OUTLINED_FUNCTION_19();
  }
  else {
    swift_retain();
  }
  swift_bridgeObjectRelease();
  uint64_t v21 = sub_21DE3D990();
  swift_release();
  if (!v21)
  {
LABEL_29:
    if (!v12) {
      return 1;
    }
    goto LABEL_30;
  }
  uint64_t v22 = sub_21DE3D9E0();
  uint64_t v24 = v23;
  swift_release();
  if (!v12)
  {
LABEL_30:
    swift_bridgeObjectRelease();
    goto LABEL_31;
  }
  if (v22 == v10 && v12 == v24)
  {
LABEL_25:
    swift_bridgeObjectRelease();
LABEL_26:
    swift_bridgeObjectRelease();
    return 1;
  }
  char v26 = OUTLINED_FUNCTION_26();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v26) {
    return 1;
  }
LABEL_31:
  if (qword_26AD32A70 != -1) {
    swift_once();
  }
  return sub_21DE18DA0(v3, v0, v2 & 1) & 1;
}

uint64_t sub_21DE1B1C0()
{
  uint64_t v0 = sub_21DE3D9C0();
  unint64_t v1 = sub_21DE28204(1701869940, 0xE400000000000000, v0);
  swift_bridgeObjectRelease();
  if (!v1) {
    return 0;
  }
  if (!(v1 >> 62))
  {
    if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_4;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_21DE3E100();
  swift_bridgeObjectRelease();
  if (!v9) {
    goto LABEL_15;
  }
LABEL_4:
  sub_21DE2E22C(0, (v1 & 0xC000000000000001) == 0, v1);
  if ((v1 & 0xC000000000000001) != 0) {
    MEMORY[0x223C19800](0, v1);
  }
  else {
    swift_retain();
  }
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_21DE3D990();
  swift_release();
  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_21DE3D9C0();
  uint64_t v4 = sub_21DE28204(0x5664656E69666564, 0xEC00000065756C61, v3);
  swift_bridgeObjectRelease();
  if (!v4)
  {
    swift_release();
    return 0;
  }
  OUTLINED_FUNCTION_22();
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_21DE3E100();
    swift_bridgeObjectRelease();
    if (v10) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
  if (!*(void *)(v5 + 16))
  {
LABEL_19:
    swift_release();
    goto LABEL_15;
  }
LABEL_10:
  OUTLINED_FUNCTION_7();
  if ((v4 & 0xC000000000000001) != 0) {
    OUTLINED_FUNCTION_19();
  }
  else {
    swift_retain();
  }
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_21DE3D990();
  swift_release();
  swift_release();
  return v7;
}

uint64_t sub_21DE1B394()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for AttachmentQueryMatcher()
{
  return self;
}

void sub_21DE1B3F0()
{
  OUTLINED_FUNCTION_9();
  uint64_t v23 = v0;
  sub_21DE3D760();
  OUTLINED_FUNCTION_0();
  uint64_t v2 = v1;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v22 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  MEMORY[0x270FA5388](v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32BA8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21DE3E8D0;
  uint64_t v8 = *(void (**)(void))(v2 + 104);
  OUTLINED_FUNCTION_18();
  v8();
  uint64_t v9 = sub_21DE3D750();
  uint64_t v11 = v10;
  uint64_t v12 = *(void (**)(void))(v2 + 8);
  OUTLINED_FUNCTION_21();
  v12();
  *(void *)(inited + 32) = v9;
  *(void *)(inited + 40) = v11;
  if (qword_26AD32AD8 != -1) {
    swift_once();
  }
  uint64_t v13 = unk_26AD32C60;
  *(void *)(inited + 48) = qword_26AD32C58;
  *(void *)(inited + 56) = v13;
  OUTLINED_FUNCTION_18();
  v8();
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_21DE3D750();
  uint64_t v16 = v15;
  OUTLINED_FUNCTION_21();
  v12();
  *(void *)(inited + 64) = v14;
  *(void *)(inited + 72) = v16;
  if (qword_26AD32AE0 != -1) {
    swift_once();
  }
  uint64_t v17 = unk_26AD32C70;
  *(void *)(inited + 80) = qword_26AD32C68;
  *(void *)(inited + 88) = v17;
  OUTLINED_FUNCTION_18();
  v8();
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_21DE3D750();
  uint64_t v20 = v19;
  OUTLINED_FUNCTION_21();
  v12();
  *(void *)(inited + 96) = v18;
  *(void *)(inited + 104) = v20;
  if (qword_26AD32AE8 != -1) {
    swift_once();
  }
  uint64_t v21 = unk_26AD32C80;
  *(void *)(inited + 112) = qword_26AD32C78;
  *(void *)(inited + 120) = v21;
  swift_bridgeObjectRetain();
  *(void *)(v23 + 16) = sub_21DE3DD30();
  OUTLINED_FUNCTION_5();
}

uint64_t sub_21DE1B68C()
{
  return sub_21DE1AF50() & 1;
}

void sub_21DE1B6B4()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_25();
  uint64_t v3 = sub_21DE3D9C0();
  swift_release();
  uint64_t v4 = sub_21DE28204(0xD000000000000018, 0x800000021DE3F850, v3);
  swift_bridgeObjectRelease();
  if (!v4)
  {
LABEL_10:
    char v10 = 0;
    LOBYTE(v7) = 0;
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_22();
  if (!v6)
  {
    uint64_t v7 = *(void *)(v5 + 16);
    if (v7) {
      goto LABEL_4;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    char v10 = 0;
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_21DE3E100();
  swift_bridgeObjectRelease();
  if (!v7) {
    goto LABEL_12;
  }
LABEL_4:
  OUTLINED_FUNCTION_7();
  if ((v4 & 0xC000000000000001) != 0) {
    OUTLINED_FUNCTION_19();
  }
  else {
    swift_retain();
  }
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_21DE3D990();
  swift_release();
  if (!v8) {
    goto LABEL_10;
  }
  if (qword_26AD32A70 != -1) {
    swift_once();
  }
  sub_21DE3DB40();
  swift_allocObject();
  swift_retain();
  uint64_t v9 = sub_21DE3DB10();
  LOBYTE(v7) = sub_21DE18DA0(v9, v0, v1 & 1);
  swift_release();
  type metadata accessor for PersonQueryMatcher();
  char v10 = sub_21DE1BA1C(v0);
  swift_release();
LABEL_13:
  uint64_t v11 = sub_21DE3D9C0();
  uint64_t v12 = sub_21DE28204(0xD000000000000018, 0x800000021DE3F850, v11);
  swift_bridgeObjectRelease();
  if (!v12) {
    goto LABEL_24;
  }
  OUTLINED_FUNCTION_22();
  if (!v14)
  {
    if (*(void *)(v13 + 16)) {
      goto LABEL_16;
    }
LABEL_23:
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_21DE3E100();
  swift_bridgeObjectRelease();
  if (!v17) {
    goto LABEL_23;
  }
LABEL_16:
  OUTLINED_FUNCTION_7();
  if ((v12 & 0xC000000000000001) != 0) {
    OUTLINED_FUNCTION_19();
  }
  else {
    swift_retain();
  }
  swift_bridgeObjectRelease();
  uint64_t v15 = sub_21DE3D990();
  swift_release();
  if (v15)
  {
    if (v10)
    {
      swift_release();
      char v10 = 1;
    }
    else
    {
      type metadata accessor for PersonQueryMatcher();
      uint64_t v16 = sub_21DE3DB20();
      char v10 = sub_21DE1BA1C(v16);
      swift_release();
      swift_release();
    }
  }
LABEL_24:
  type metadata accessor for PersonQueryMatcher();
  uint64_t v18 = sub_21DE3DB20();
  OUTLINED_FUNCTION_8(v18);
  uint64_t v20 = v19;
  swift_release();
  if (v20)
  {
    swift_bridgeObjectRelease();
    uint64_t v21 = sub_21DE3DB20();
    unsigned __int8 v22 = sub_21DE1BAB4(v21);
    swift_release();
    if (v7 & 1 | (((v22 | v10) & 1) == 0)) {
      goto LABEL_32;
    }
  }
  else if (v7)
  {
    goto LABEL_32;
  }
  if (qword_26AD32A70 != -1) {
    swift_once();
  }
  sub_21DE18DA0(v2, v0, v1 & 1);
LABEL_32:
  OUTLINED_FUNCTION_5();
}

uint64_t sub_21DE1BA1C(uint64_t a1)
{
  char v1 = OUTLINED_FUNCTION_8(a1);
  if (v2)
  {
    char v3 = v1;
    uint64_t v4 = OUTLINED_FUNCTION_33();
    sub_21DE1BB40(v4, 0x6C6562616CLL, 0xE500000000000000);
    if (v5)
    {
      type metadata accessor for BaseQueryMatcher();
      OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_29();
    }
    else
    {
      char v3 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v3 = 0;
  }
  return v3 & 1;
}

unint64_t sub_21DE1BAA4(uint64_t a1)
{
  return sub_21DE1BB40(a1, 1701667182, 0xE400000000000000);
}

uint64_t sub_21DE1BAB4(uint64_t a1)
{
  char v1 = OUTLINED_FUNCTION_8(a1);
  if (v2)
  {
    char v3 = v1;
    uint64_t v4 = OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_8(v4);
    if (v5)
    {
      type metadata accessor for BaseQueryMatcher();
      OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_29();
    }
    else
    {
      char v3 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v3 = 1;
  }
  return v3 & 1;
}

unint64_t sub_21DE1BB2C(uint64_t a1)
{
  return sub_21DE1BB40(a1, 0x6C6562616CLL, 0xE500000000000000);
}

unint64_t sub_21DE1BB40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_21DE3D9C0();
  unint64_t v6 = sub_21DE28204(a2, a3, v5);
  swift_bridgeObjectRelease();
  if (!v6) {
    return v6;
  }
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_21DE3E100();
    swift_bridgeObjectRelease();
    if (v7) {
      goto LABEL_4;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    return 0;
  }
  if (!*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_8;
  }
LABEL_4:
  sub_21DE2E22C(0, (v6 & 0xC000000000000001) == 0, v6);
  if ((v6 & 0xC000000000000001) != 0) {
    MEMORY[0x223C19800](0, v6);
  }
  else {
    swift_retain();
  }
  swift_bridgeObjectRelease();
  unint64_t v6 = sub_21DE3D960();
  swift_release();
  return v6;
}

uint64_t sub_21DE1BC44()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for PersonQueryMatcher()
{
  return self;
}

uint64_t sub_21DE1BC78()
{
  sub_21DE1B6B4();
  return v0 & 1;
}

uint64_t sub_21DE1BC94()
{
  uint64_t v3 = OUTLINED_FUNCTION_30();
  uint64_t v5 = v4;
  if (qword_267D22240 != -1) {
    swift_once();
  }
  if (v3 == qword_267D22690 && v5 == *(void *)algn_267D22698)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  char v7 = sub_21DE3E180();
  swift_bridgeObjectRelease();
  if (v7) {
    return 1;
  }
  if (qword_26AD32A70 != -1) {
    swift_once();
  }
  return sub_21DE18DA0(v1, v2, v0 & 1) & 1;
}

uint64_t type metadata accessor for CalendarEventQueryMatcher()
{
  return self;
}

uint64_t sub_21DE1BDB4()
{
  return sub_21DE1BC94() & 1;
}

uint64_t sub_21DE1BDD0()
{
  uint64_t v3 = OUTLINED_FUNCTION_30();
  uint64_t v5 = v4;
  if (qword_26AD32A98 != -1) {
    swift_once();
  }
  if (v3 == qword_26AD32C08 && v5 == unk_26AD32C10)
  {
    swift_bridgeObjectRelease();
    if (v0) {
      return 1;
    }
  }
  else
  {
    char v7 = sub_21DE3E180();
    swift_bridgeObjectRelease();
    if (v7 & 1) != 0 && (v0) {
      return 1;
    }
  }
  if (qword_26AD32A70 != -1) {
    swift_once();
  }
  return sub_21DE18DA0(v1, v2, v0 & 1) & 1;
}

uint64_t type metadata accessor for ApplicationQueryMatcher()
{
  return self;
}

uint64_t sub_21DE1BEF8()
{
  return sub_21DE1BDD0() & 1;
}

unint64_t sub_21DE1BF14()
{
  unint64_t result = qword_267D22440;
  if (!qword_267D22440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D22440);
  }
  return result;
}

uint64_t sub_21DE1BF60(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  sub_21DE3E210();
  sub_21DE3DD50();
  uint64_t v9 = sub_21DE3E230();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  unint64_t v11 = v9 & ~v10;
  uint64_t v12 = v8 + 56;
  if ((*(void *)(v8 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11))
  {
    uint64_t v13 = *(void *)(v8 + 48);
    uint64_t v14 = (void *)(v13 + 16 * v11);
    BOOL v15 = *v14 == a2 && v14[1] == a3;
    if (v15 || (sub_21DE3E180() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      uint64_t v16 = (uint64_t *)(*(void *)(*v4 + 48) + 16 * v11);
      uint64_t v17 = v16[1];
      *a1 = *v16;
      a1[1] = v17;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v19 = ~v10;
    while (1)
    {
      unint64_t v11 = (v11 + 1) & v19;
      if (((*(void *)(v12 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
        break;
      }
      uint64_t v20 = (void *)(v13 + 16 * v11);
      BOOL v21 = *v20 == a2 && v20[1] == a3;
      if (v21 || (sub_21DE3E180() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v23 = *v4;
  *uint64_t v4 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_21DE1CDE0(a2, a3, v11, isUniquelyReferenced_nonNull_native);
  *uint64_t v4 = v23;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_21DE1C0F0(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  uint64_t v7 = sub_21DE3E200();
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_21DE1CF7C(a2, v9, isUniquelyReferenced_nonNull_native);
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

void sub_21DE1C1EC()
{
  OUTLINED_FUNCTION_9();
  uint64_t v2 = v0;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  sub_21DE3DB00();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *v0;
  sub_21DE1E46C(&qword_26AD32B48);
  swift_bridgeObjectRetain();
  uint64_t v35 = v4;
  uint64_t v13 = sub_21DE3DD40();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  unint64_t v15 = v13 & ~v14;
  uint64_t v34 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
  {
    v30 = v0;
    uint64_t v31 = v6;
    uint64_t v32 = ~v14;
    uint64_t v29 = v8;
    uint64_t v18 = *(void (**)(void, void, void))(v8 + 16);
    uint64_t v17 = v8 + 16;
    uint64_t v16 = v18;
    uint64_t v33 = *(void *)(v17 + 56);
    uint64_t v19 = (void (**)(char *, uint64_t))(v17 - 8);
    v28[1] = v17 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v20 = v12;
      unint64_t v21 = v33 * v15;
      unint64_t v22 = *(void *)(v12 + 48) + v33 * v15;
      uint64_t v23 = v16;
      v16(v11, v22, v1);
      sub_21DE1E46C(&qword_267D22460);
      char v24 = sub_21DE3DD60();
      uint64_t v25 = *v19;
      (*v19)(v11, v1);
      if (v24) {
        break;
      }
      unint64_t v15 = (v15 + 1) & v32;
      uint64_t v16 = v23;
      uint64_t v12 = v20;
      if (((*(void *)(v34 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v2 = v30;
        uint64_t v6 = v31;
        uint64_t v8 = v29;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v25(v35, v1);
    v23(v31, *(void *)(*v30 + 48) + v21, v1);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v16 = *(void (**)(void, void, void))(v8 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v27 = v35;
    v16(v11, v35, v1);
    uint64_t v36 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    sub_21DE1D0A0((uint64_t)v11, v15, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v36;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v6, v27, v1);
  }
  OUTLINED_FUNCTION_5();
}

uint64_t sub_21DE1C4AC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D22448);
  uint64_t result = sub_21DE3E040();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v6 = *(void *)(v2 + 56);
    v30 = (void *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & v6;
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    if ((v8 & v6) == 0) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v12 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    for (unint64_t i = v12 | (v5 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v5 << 6))
    {
      uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
      uint64_t v18 = *v17;
      uint64_t v19 = v17[1];
      sub_21DE3E210();
      sub_21DE3DD50();
      uint64_t result = sub_21DE3E230();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) == 0)
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
          uint64_t v27 = *(void *)(v11 + 8 * v22);
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
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      os_log_type_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
      *os_log_type_t v28 = v18;
      v28[1] = v19;
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
      unint64_t v15 = v30[v14];
      ++v5;
      if (!v15)
      {
        int64_t v5 = v14 + 1;
        if (v14 + 1 >= v10) {
          goto LABEL_32;
        }
        unint64_t v15 = v30[v5];
        if (!v15)
        {
          int64_t v5 = v14 + 2;
          if (v14 + 2 >= v10) {
            goto LABEL_32;
          }
          unint64_t v15 = v30[v5];
          if (!v15)
          {
            int64_t v16 = v14 + 3;
            if (v16 >= v10)
            {
LABEL_32:
              uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
              if (v29 > 63) {
                sub_21DE1D318(0, (unint64_t)(v29 + 63) >> 6, v30);
              }
              else {
                void *v30 = -1 << v29;
              }
              uint64_t v1 = v0;
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v15 = v30[v16];
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
                unint64_t v15 = v30[v5];
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
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_21DE1C778()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D22458);
  uint64_t result = sub_21DE3E040();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v7 = (uint64_t *)(v2 + 56);
    uint64_t v6 = *(void *)(v2 + 56);
    uint64_t v8 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v27 = -1 << v8;
    os_log_type_t v28 = v1;
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
      uint64_t result = sub_21DE3E200();
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
                sub_21DE1D318(0, v11, (void *)(v2 + 56));
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

uint64_t sub_21DE1C9FC()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_21DE3DB00();
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D22468);
  uint64_t v5 = sub_21DE3E040();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    char v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    uint64_t v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    int64_t v14 = v41;
    uint64_t v15 = v42;
    if (!v10) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v16 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    int64_t v40 = v13;
    for (unint64_t i = v16 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v19)) + (v20 << 6))
    {
      uint64_t v22 = v4;
      uint64_t v23 = *(void *)(v4 + 48);
      uint64_t v24 = *(void *)(v39 + 72);
      BOOL v25 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v25(v14, v23 + v24 * i, v15);
      uint64_t v6 = v38;
      sub_21DE1E46C(&qword_26AD32B48);
      uint64_t result = sub_21DE3DD40();
      uint64_t v26 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v27 = result & ~v26;
      unint64_t v28 = v27 >> 6;
      if (((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6))) == 0)
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
          uint64_t v33 = *(void *)(v11 + 8 * v28);
          if (v33 != -1)
          {
            unint64_t v29 = __clz(__rbit64(~v33)) + (v28 << 6);
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
      unint64_t v29 = __clz(__rbit64((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v11 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v29;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v25)(*(void *)(v6 + 48) + v29 * v24, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v22;
      int64_t v13 = v40;
      if (v10) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v18 = v13 + 1;
      if (__OFADD__(v13, 1)) {
        goto LABEL_38;
      }
      if (v18 >= v36) {
        goto LABEL_32;
      }
      unint64_t v19 = v37[v18];
      int64_t v20 = v13 + 1;
      if (!v19)
      {
        int64_t v20 = v13 + 2;
        if (v13 + 2 >= v36) {
          goto LABEL_32;
        }
        unint64_t v19 = v37[v20];
        if (!v19)
        {
          int64_t v20 = v13 + 3;
          if (v13 + 3 >= v36) {
            goto LABEL_32;
          }
          unint64_t v19 = v37[v20];
          if (!v19)
          {
            uint64_t v21 = v13 + 4;
            if (v13 + 4 >= v36)
            {
LABEL_32:
              swift_release();
              uint64_t v1 = v35;
              uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
              if (v34 > 63) {
                sub_21DE1D318(0, (unint64_t)(v34 + 63) >> 6, v37);
              }
              else {
                *char v37 = -1 << v34;
              }
              *(void *)(v4 + 16) = 0;
              break;
            }
            unint64_t v19 = v37[v21];
            if (!v19)
            {
              while (1)
              {
                int64_t v20 = v21 + 1;
                if (__OFADD__(v21, 1)) {
                  goto LABEL_39;
                }
                if (v20 >= v36) {
                  goto LABEL_32;
                }
                unint64_t v19 = v37[v20];
                ++v21;
                if (v19) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v20 = v13 + 4;
          }
        }
      }
LABEL_20:
      unint64_t v10 = (v19 - 1) & v19;
      int64_t v40 = v20;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v6;
  return result;
}

uint64_t sub_21DE1CDE0(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_21DE1C4AC();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_21DE1D334();
      goto LABEL_22;
    }
    sub_21DE1DAE4();
  }
  uint64_t v11 = *v4;
  sub_21DE3E210();
  sub_21DE3DD50();
  uint64_t result = sub_21DE3E230();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    uint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_21DE3E180(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_21DE3E190();
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
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_21DE3E180();
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
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
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

uint64_t sub_21DE1CF7C(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_21DE1C778();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_21DE1D4E8();
      goto LABEL_14;
    }
    sub_21DE1DE04();
  }
  uint64_t v8 = *v3;
  uint64_t result = sub_21DE3E200();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(void *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      uint64_t result = sub_21DE3E190();
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

uint64_t sub_21DE1D0A0(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_21DE3DB00();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  unint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_21DE1C9FC();
  }
  else
  {
    if (v11 > v10)
    {
      sub_21DE1D680();
      goto LABEL_12;
    }
    sub_21DE1E064();
  }
  uint64_t v12 = *v3;
  sub_21DE1E46C(&qword_26AD32B48);
  uint64_t v13 = sub_21DE3DD40();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    unint64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    uint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_21DE1E46C(&qword_267D22460);
      char v21 = sub_21DE3DD60();
      (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_21DE3E190();
  __break(1u);
  return result;
}

uint64_t sub_21DE1D318(uint64_t result, uint64_t a2, void *a3)
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

void *sub_21DE1D334()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D22448);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21DE3E030();
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
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

void *sub_21DE1D4E8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D22458);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21DE3E030();
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

void *sub_21DE1D680()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21DE3DB00();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D22468);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_21DE3E030();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_30:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  uint64_t v24 = v1;
  uint64_t v25 = (const void *)(v6 + 56);
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    uint64_t result = memmove(result, v25, 8 * v10);
  }
  int64_t v12 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v14 = *(void *)(v6 + 56);
  uint64_t v15 = -1;
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  unint64_t v16 = v15 & v14;
  int64_t v26 = (unint64_t)(v13 + 63) >> 6;
  if ((v15 & v14) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v17 = __clz(__rbit64(v16));
  v16 &= v16 - 1;
  for (unint64_t i = v17 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v20)) + (v12 << 6))
  {
    unint64_t v22 = *(void *)(v3 + 72) * i;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v22, v2);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v22, v5, v2);
    if (v16) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v19 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v19 >= v26) {
      goto LABEL_28;
    }
    unint64_t v20 = *((void *)v25 + v19);
    ++v12;
    if (!v20)
    {
      int64_t v12 = v19 + 1;
      if (v19 + 1 >= v26) {
        goto LABEL_28;
      }
      unint64_t v20 = *((void *)v25 + v12);
      if (!v20)
      {
        int64_t v12 = v19 + 2;
        if (v19 + 2 >= v26) {
          goto LABEL_28;
        }
        unint64_t v20 = *((void *)v25 + v12);
        if (!v20) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v16 = (v20 - 1) & v20;
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v26)
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v24;
    goto LABEL_30;
  }
  unint64_t v20 = *((void *)v25 + v21);
  if (v20)
  {
    int64_t v12 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v12 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v12 >= v26) {
      goto LABEL_28;
    }
    unint64_t v20 = *((void *)v25 + v12);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

void *sub_21DE1D930()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32B88);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21DE3E030();
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
    unint64_t v20 = (void *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v21 = v20[1];
    unint64_t v22 = (void *)(*(void *)(v4 + 48) + 16 * i);
    *unint64_t v22 = *v20;
    v22[1] = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

uint64_t sub_21DE1DAE4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D22448);
  uint64_t result = sub_21DE3E040();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
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
    int64_t v28 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v10 = result + 56;
    if (!v9) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v11 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    for (unint64_t i = v11 | (v5 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v5 << 6))
    {
      unint64_t v16 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
      uint64_t v18 = *v16;
      uint64_t v17 = v16[1];
      sub_21DE3E210();
      sub_21DE3DD50();
      uint64_t result = sub_21DE3E230();
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
            goto LABEL_29;
          }
        }
        __break(1u);
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_29:
      *(void *)(v10 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
      uint64_t v27 = (void *)(*(void *)(v4 + 48) + 16 * v22);
      void *v27 = v18;
      v27[1] = v17;
      ++*(void *)(v4 + 16);
      uint64_t result = swift_bridgeObjectRetain();
      if (v9) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v13 = v5 + 1;
      if (__OFADD__(v5, 1)) {
        goto LABEL_35;
      }
      if (v13 >= v28) {
        goto LABEL_31;
      }
      unint64_t v14 = *(void *)(v6 + 8 * v13);
      ++v5;
      if (!v14)
      {
        int64_t v5 = v13 + 1;
        if (v13 + 1 >= v28) {
          goto LABEL_31;
        }
        unint64_t v14 = *(void *)(v6 + 8 * v5);
        if (!v14)
        {
          int64_t v5 = v13 + 2;
          if (v13 + 2 >= v28) {
            goto LABEL_31;
          }
          unint64_t v14 = *(void *)(v6 + 8 * v5);
          if (!v14)
          {
            int64_t v15 = v13 + 3;
            if (v15 >= v28)
            {
LABEL_31:
              uint64_t result = swift_release();
              uint64_t v1 = v0;
              goto LABEL_33;
            }
            unint64_t v14 = *(void *)(v6 + 8 * v15);
            int64_t v5 = v15;
            if (!v14) {
              break;
            }
          }
        }
      }
LABEL_19:
      unint64_t v9 = (v14 - 1) & v14;
    }
    while (1)
    {
      int64_t v5 = v15 + 1;
      if (__OFADD__(v15, 1)) {
        break;
      }
      if (v5 >= v28) {
        goto LABEL_31;
      }
      unint64_t v14 = *(void *)(v6 + 8 * v5);
      ++v15;
      if (v14) {
        goto LABEL_19;
      }
    }
LABEL_36:
    __break(1u);
  }
  else
  {
    uint64_t result = swift_release();
LABEL_33:
    uint64_t *v1 = v4;
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

unint64_t sub_21DE1DDC4()
{
  unint64_t result = qword_267D22450;
  if (!qword_267D22450)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267D22450);
  }
  return result;
}

uint64_t sub_21DE1DE04()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D22458);
  uint64_t result = sub_21DE3E040();
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
    uint64_t result = sub_21DE3E200();
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

uint64_t sub_21DE1E064()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21DE3DB00();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  int64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D22468);
  uint64_t v7 = sub_21DE3E040();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  uint64_t v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  int64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  if (!v12) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v17 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (unint64_t i = v17 | (v16 << 6); ; unint64_t i = __clz(__rbit64(v20)) + (v16 << 6))
  {
    uint64_t v22 = v6;
    uint64_t v23 = *(void *)(v6 + 48);
    uint64_t v24 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v23 + v24 * i, v2);
    sub_21DE1E46C(&qword_26AD32B48);
    uint64_t result = sub_21DE3DD40();
    uint64_t v25 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v26 = result & ~v25;
    unint64_t v27 = v26 >> 6;
    if (((-1 << v26) & ~*(void *)(v13 + 8 * (v26 >> 6))) == 0)
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v25) >> 6;
      while (++v27 != v30 || (v29 & 1) == 0)
      {
        BOOL v31 = v27 == v30;
        if (v27 == v30) {
          unint64_t v27 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v27);
        if (v32 != -1)
        {
          unint64_t v28 = __clz(__rbit64(~v32)) + (v27 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v28 = __clz(__rbit64((-1 << v26) & ~*(void *)(v13 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v13 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v28;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v28 * v24, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v22;
    if (v12) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v19 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      goto LABEL_36;
    }
    if (v19 >= v36) {
      goto LABEL_32;
    }
    unint64_t v20 = *(void *)(v35 + 8 * v19);
    ++v16;
    if (!v20)
    {
      int64_t v16 = v19 + 1;
      if (v19 + 1 >= v36) {
        goto LABEL_32;
      }
      unint64_t v20 = *(void *)(v35 + 8 * v16);
      if (!v20)
      {
        int64_t v16 = v19 + 2;
        if (v19 + 2 >= v36) {
          goto LABEL_32;
        }
        unint64_t v20 = *(void *)(v35 + 8 * v16);
        if (!v20) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v12 = (v20 - 1) & v20;
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v36)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_34;
  }
  unint64_t v20 = *(void *)(v35 + 8 * v21);
  if (v20)
  {
    int64_t v16 = v21;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v16 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_32;
    }
    unint64_t v20 = *(void *)(v35 + 8 * v16);
    ++v21;
    if (v20) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_21DE1E3FC(void *a1)
{
  id v2 = objc_msgSend(a1, sel_unformattedInternationalStringValue);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_21DE3DD80();

  return v3;
}

uint64_t sub_21DE1E46C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_21DE3DB00();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return MEMORY[0x270EF25B0](&a9, a2, a2, a4, a4);
}

uint64_t OUTLINED_FUNCTION_2()
{
  return sub_21DE3E180();
}

uint64_t OUTLINED_FUNCTION_3()
{
  return sub_21DE3E180();
}

uint64_t OUTLINED_FUNCTION_6()
{
  return sub_21DE3E180();
}

uint64_t OUTLINED_FUNCTION_7()
{
  if (v0) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 0;
  }
  return sub_21DE2E22C(0, v3, v1);
}

unint64_t OUTLINED_FUNCTION_8(uint64_t a1)
{
  return sub_21DE1BB40(a1, 1701667182, 0xE400000000000000);
}

uint64_t OUTLINED_FUNCTION_10()
{
  return sub_21DE3E180();
}

uint64_t OUTLINED_FUNCTION_11()
{
  return sub_21DE1A478();
}

uint64_t OUTLINED_FUNCTION_12()
{
  return sub_21DE3E180();
}

uint64_t OUTLINED_FUNCTION_14()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_17()
{
  return sub_21DE3E180();
}

void OUTLINED_FUNCTION_19()
{
  JUMPOUT(0x223C19800);
}

uint64_t OUTLINED_FUNCTION_20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return MEMORY[0x270EF25B0](&a9, a2, a2, v9, v9);
}

uint64_t OUTLINED_FUNCTION_23()
{
  return sub_21DE3E180();
}

uint64_t OUTLINED_FUNCTION_25()
{
  return sub_21DE3DB20();
}

uint64_t OUTLINED_FUNCTION_26()
{
  return sub_21DE3E180();
}

uint64_t OUTLINED_FUNCTION_27()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_28()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_29()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_30()
{
  return sub_21DE3D9E0();
}

uint64_t OUTLINED_FUNCTION_31()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_32()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_33()
{
  return v0;
}

uint64_t sub_21DE1E814(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t sub_21DE1E828(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_21DE3E180();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_21DE3E180() & 1) != 0) {
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

double sub_21DE1E8F0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (*(void *)(a1 + 16))
  {
    sub_21DE22DF4(a1 + 32, a2);
  }
  else
  {
    *(void *)(a2 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

void sub_21DE1E92C()
{
  qword_267D22470 = (uint64_t)&unk_26CEBEA00;
}

void *sub_21DE1E940()
{
  type metadata accessor for RRLinkMatcher();
  swift_allocObject();
  double result = sub_21DE1F320();
  qword_267D22648 = (uint64_t)result;
  return result;
}

void *sub_21DE1E980()
{
  type metadata accessor for RRLinkMatcher();
  double result = (void *)sub_21DE1E9B4();
  off_267D22478 = result;
  return result;
}

uint64_t sub_21DE1E9B4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D224A0);
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 56) = &type metadata for PersonStructuredDataHandler;
  *(void *)(v0 + 64) = &off_26B5485F0;
  *(void *)(v0 + 96) = &type metadata for TimerStructuredDataHandler;
  *(void *)(v0 + 104) = &off_26B548620;
  *(void *)(v0 + 136) = &type metadata for TaskStructuredDataHandler;
  *(void *)(v0 + 144) = &off_26B548650;
  *(void *)(v0 + 176) = &type metadata for TaskListStructuredDataHandler;
  *(void *)(v0 + 184) = &off_26B548680;
  *(_OWORD *)(v0 + 16) = xmmword_21DE3EA00;
  *(void *)(v0 + 216) = type metadata accessor for MediaItemStructuredDataHandler();
  *(void *)(v0 + 224) = &off_26B5484D8;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 192));
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D224F8);
  sub_21DE3DD90();
  sub_21DE3DAB0();
  *(void *)(v0 + 256) = &type metadata for MessageConversationStructuredDataHandler;
  *(void *)(v0 + 264) = &off_26B5480C0;
  *(void *)(v0 + 296) = &type metadata for ApplicationStructuredDataHandler;
  *(void *)(v0 + 304) = &off_26B5485C0;
  *(void *)(v0 + 272) = 0;
  *(void *)(v0 + 280) = 0;
  *(void *)(v0 + 336) = &type metadata for EnvironmentStructuredDataHandler;
  *(void *)(v0 + 344) = &off_26B5482E8;
  *(void *)(v0 + 312) = 0;
  *(void *)(v0 + 320) = 0;
  return v0;
}

uint64_t sub_21DE1EB0C()
{
  if (*(void *)(v0 + 24))
  {
    uint64_t v1 = *(void *)(v0 + 24);
  }
  else
  {
    uint64_t v1 = sub_21DE1EB90();
    *(void *)(v0 + 24) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_21DE1EB90()
{
  if (qword_267D22208 != -1) {
LABEL_18:
  }
    swift_once();
  uint64_t v0 = *((void *)off_267D22478 + 2);
  if (v0)
  {
    uint64_t v1 = (char *)off_267D22478 + 32;
    swift_bridgeObjectRetain();
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    while (1)
    {
      sub_21DE22DF4((uint64_t)v1, (uint64_t)v21);
      uint64_t v3 = v22;
      uint64_t v4 = v23;
      __swift_project_boxed_opaque_existential_1(v21, v22);
      uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(v3, v4);
      uint64_t v7 = v6;
      sub_21DE22DF4((uint64_t)v21, (uint64_t)v20);
      swift_isUniquelyReferenced_nonNull_native();
      unint64_t v8 = sub_21DE2A8C0(v5, v7);
      if (__OFADD__(v2[2], (v9 & 1) == 0))
      {
        __break(1u);
LABEL_17:
        __break(1u);
        goto LABEL_18;
      }
      unint64_t v10 = v8;
      char v11 = v9;
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D224F0);
      if (sub_21DE3E0E0())
      {
        unint64_t v12 = sub_21DE2A8C0(v5, v7);
        if ((v11 & 1) != (v13 & 1))
        {
          uint64_t result = sub_21DE3E1A0();
          __break(1u);
          return result;
        }
        unint64_t v10 = v12;
      }
      if (v11)
      {
        uint64_t v14 = v2[7] + 40 * v10;
        __swift_destroy_boxed_opaque_existential_1Tm(v14);
        sub_21DE22BD0(v20, v14);
      }
      else
      {
        v2[(v10 >> 6) + 8] |= 1 << v10;
        unint64_t v15 = (uint64_t *)(v2[6] + 16 * v10);
        *unint64_t v15 = v5;
        v15[1] = v7;
        sub_21DE22BD0(v20, v2[7] + 40 * v10);
        uint64_t v16 = v2[2];
        BOOL v17 = __OFADD__(v16, 1);
        uint64_t v18 = v16 + 1;
        if (v17) {
          goto LABEL_17;
        }
        v2[2] = v18;
        swift_bridgeObjectRetain();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v21);
      v1 += 40;
      if (!--v0) {
        goto LABEL_15;
      }
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = (void *)MEMORY[0x263F8EE80];
LABEL_15:
  swift_bridgeObjectRelease();
  return (uint64_t)v2;
}

uint64_t sub_21DE1EDD8()
{
  if (*(void *)(v0 + 32))
  {
    uint64_t v1 = *(void *)(v0 + 32);
  }
  else
  {
    uint64_t v1 = sub_21DE1EE5C();
    *(void *)(v0 + 32) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_21DE1EE5C()
{
  if (qword_267D22208 != -1) {
LABEL_20:
  }
    swift_once();
  uint64_t v0 = *((void *)off_267D22478 + 2);
  if (v0)
  {
    uint64_t v1 = (char *)off_267D22478 + 32;
    swift_bridgeObjectRetain();
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    while (1)
    {
      sub_21DE22DF4((uint64_t)v1, (uint64_t)v22);
      uint64_t v3 = v23;
      uint64_t v4 = v24;
      __swift_project_boxed_opaque_existential_1(v22, v23);
      uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 24))(v3, v4);
      if (v6)
      {
        uint64_t v7 = v5;
        uint64_t v8 = v6;
        sub_21DE22DF4((uint64_t)v22, (uint64_t)v21);
        swift_isUniquelyReferenced_nonNull_native();
        unint64_t v9 = sub_21DE2A8C0(v7, v8);
        if (__OFADD__(v2[2], (v10 & 1) == 0))
        {
          __break(1u);
LABEL_19:
          __break(1u);
          goto LABEL_20;
        }
        unint64_t v11 = v9;
        char v12 = v10;
        __swift_instantiateConcreteTypeFromMangledName(&qword_267D224F0);
        if (sub_21DE3E0E0())
        {
          unint64_t v13 = sub_21DE2A8C0(v7, v8);
          if ((v12 & 1) != (v14 & 1))
          {
            uint64_t result = sub_21DE3E1A0();
            __break(1u);
            return result;
          }
          unint64_t v11 = v13;
        }
        if (v12)
        {
          uint64_t v15 = v2[7] + 40 * v11;
          __swift_destroy_boxed_opaque_existential_1Tm(v15);
          sub_21DE22BD0(v21, v15);
        }
        else
        {
          v2[(v11 >> 6) + 8] |= 1 << v11;
          uint64_t v16 = (uint64_t *)(v2[6] + 16 * v11);
          *uint64_t v16 = v7;
          v16[1] = v8;
          sub_21DE22BD0(v21, v2[7] + 40 * v11);
          uint64_t v17 = v2[2];
          BOOL v18 = __OFADD__(v17, 1);
          uint64_t v19 = v17 + 1;
          if (v18) {
            goto LABEL_19;
          }
          v2[2] = v19;
          swift_bridgeObjectRetain();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v22);
      v1 += 40;
      if (!--v0) {
        goto LABEL_17;
      }
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = (void *)MEMORY[0x263F8EE80];
LABEL_17:
  swift_bridgeObjectRelease();
  return (uint64_t)v2;
}

uint64_t sub_21DE1F0A8()
{
  uint64_t result = sub_21DE1F0C8();
  qword_267D22650 = result;
  return result;
}

uint64_t sub_21DE1F0C8()
{
  sub_21DE3D5F0();
  swift_allocObject();
  sub_21DE3D5E0();
  uint64_t v0 = MEMORY[0x223C18C90]();
  if (!v0) {
    goto LABEL_8;
  }
  uint64_t v1 = v0;
  sub_21DE3D6B0();
  swift_allocObject();
  sub_21DE3D6A0();
  uint64_t v2 = MEMORY[0x223C18C90]();
  if (!v2)
  {
    swift_release();
    swift_release();
LABEL_8:
    swift_release();
    return 0;
  }
  uint64_t v3 = v2;
  sub_21DE3D3F0();
  swift_allocObject();
  sub_21DE3D3E0();
  uint64_t v4 = MEMORY[0x223C18C90]();
  if (v4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D22508);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_21DE3EA10;
    strcpy((char *)(inited + 32), "common_Person");
    *(_WORD *)(inited + 46) = -4864;
    *(void *)(inited + 48) = v1;
    strcpy((char *)(inited + 56), "common_Agent");
    *(unsigned char *)(inited + 69) = 0;
    *(_WORD *)(inited + 70) = -5120;
    *(void *)(inited + 72) = v3;
    *(void *)(inited + 80) = 0xD000000000000013;
    *(void *)(inited + 88) = 0x800000021DE3F900;
    *(void *)(inited + 96) = v3;
    *(void *)(inited + 104) = 0xD000000000000014;
    *(void *)(inited + 112) = 0x800000021DE3F920;
    *(void *)(inited + 120) = v3;
    strcpy((char *)(inited + 128), "common_Setting");
    *(unsigned char *)(inited + 143) = -18;
    *(void *)(inited + 144) = v4;
    sub_21DE3D9F0();
    swift_retain_n();
    swift_retain();
    uint64_t v4 = sub_21DE3DD30();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v4;
}

uint64_t sub_21DE1F2E8()
{
  type metadata accessor for SiriReferenceResolverDefaults();
  uint64_t result = sub_21DE311D0();
  byte_26AD32CC0 = result & 1;
  return result;
}

void *sub_21DE1F320()
{
  uint64_t v1 = MEMORY[0x263F8EE80];
  v0[3] = 0;
  v0[4] = 0;
  v0[2] = v1;
  type metadata accessor for RRLinkMatcher();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267D22510);
  sub_21DE3DD90();
  sub_21DE3DAB0();
  return v0;
}

void *sub_21DE1F3B0(void *a1, uint64_t a2, int a3)
{
  uint64_t v4 = v3;
  LODWORD(v176) = a3;
  uint64_t v177 = a2;
  uint64_t v6 = sub_21DE3DD00();
  OUTLINED_FUNCTION_0_0();
  uint64_t v8 = v7;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  v174 = (char *)v167 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  v175 = (char *)v167 - v12;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = 0;
  if (qword_26AD32A48 != -1) {
    swift_once();
  }
  char v14 = (uint8_t *)byte_26AD32CC0;
  uint64_t v15 = v3 + OBJC_IVAR____TtC21SiriReferenceResolver13RRLinkMatcher_logger;
  uint64_t v16 = sub_21DE3DAA0();
  os_log_type_t v17 = sub_21DE3DF50();
  BOOL v18 = os_log_type_enabled(v16, v17);
  if (v14 != 1)
  {
    if (v18)
    {
      uint64_t v22 = (_WORD *)OUTLINED_FUNCTION_4_0();
      OUTLINED_FUNCTION_5_0(v22);
      _os_log_impl(&dword_21DE16000, v16, v17, "Link matching is off.", v14, 2u);
      OUTLINED_FUNCTION_1_0();
    }
    swift_release();

    return 0;
  }
  uint64_t v173 = v4;
  if (v18)
  {
    uint64_t v19 = (uint8_t *)OUTLINED_FUNCTION_4_0();
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_21DE16000, v16, v17, "Link matching is on.", v19, 2u);
    OUTLINED_FUNCTION_19_0();
    OUTLINED_FUNCTION_1_0();
  }
  uint64_t v172 = v8;

  char v20 = v177;
  if (sub_21DE3D9E0() == 0xD000000000000011 && v21 == 0x800000021DE3FB50)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_21DE3E180();
    OUTLINED_FUNCTION_29();
    if ((v20 & 1) == 0) {
      goto LABEL_23;
    }
  }
  if ((v176 & 1) == 0)
  {
LABEL_23:
    sub_21DE2146C((uint64_t)&v183);
    if (!v184)
    {
      sub_21DE22CD8((uint64_t)&v183, &qword_267D22498);
      unint64_t v45 = (void *)sub_21DE3DAA0();
      os_log_type_t v46 = sub_21DE3DF50();
      if (OUTLINED_FUNCTION_2_0(v46))
      {
        uint64_t v47 = (_WORD *)OUTLINED_FUNCTION_4_0();
        OUTLINED_FUNCTION_5_0(v47);
        OUTLINED_FUNCTION_3_0(&dword_21DE16000, v48, v49, "No data handler available");
        OUTLINED_FUNCTION_1_0();
      }
      swift_release();

      return 0;
    }
    uint64_t v171 = v6;
    sub_21DE22BD0(&v183, (uint64_t)v186);
    sub_21DE22DF4((uint64_t)v186, (uint64_t)&v183);
    uint64_t v33 = sub_21DE3DAA0();
    os_log_type_t v34 = sub_21DE3DF60();
    BOOL v35 = os_log_type_enabled(v33, v34);
    uint64_t v169 = v13 + 16;
    if (v35)
    {
      int64_t v36 = (uint8_t *)OUTLINED_FUNCTION_11_0();
      *(void *)&long long v179 = OUTLINED_FUNCTION_10_0();
      *(_DWORD *)int64_t v36 = 136315138;
      uint64_t v170 = v13;
      id v168 = v36 + 4;
      uint64_t v37 = v15;
      uint64_t v38 = v184;
      uint64_t v39 = v185;
      __swift_project_boxed_opaque_existential_1(&v183, v184);
      int64_t v40 = *(uint64_t (**)(uint64_t, uint64_t))(v39 + 24);
      uint64_t v41 = v39;
      uint64_t v15 = v37;
      v182[0] = v40(v38, v41);
      v182[1] = v42;
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D224D8);
      uint64_t v43 = sub_21DE3DD90();
      v182[0] = sub_21DE2A150(v43, v44, (uint64_t *)&v179);
      uint64_t v13 = v170;
      sub_21DE3DFC0();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v183);
      _os_log_impl(&dword_21DE16000, v33, v34, "using handler for %s", v36, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_1_0();
    }
    else
    {

      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v183);
    }
    uint64_t v50 = v172;
    if (qword_267D221F8 != -1) {
      swift_once();
    }
    uint64_t v51 = (void *)qword_267D22470;
    swift_bridgeObjectRetain();
    char v52 = sub_21DE3DB80();
    uint64_t v53 = sub_21DE3D9E0();
    uint64_t v55 = v54;
    swift_release();
    sub_21DE1E828(v53, v55, v51);
    OUTLINED_FUNCTION_29();
    swift_bridgeObjectRelease();
    if (v52)
    {
      uint64_t v170 = v15;
      id v56 = a1;
      uint64_t v57 = sub_21DE3DC00();
      uint64_t v59 = v58;
      uint64_t v60 = (void *)sub_21DE3DBB0();
      uint64_t v62 = v61;

      sub_21DE22DF4((uint64_t)v186, (uint64_t)v182);
      uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D224A8);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D224B0);
      char v64 = OUTLINED_FUNCTION_7_0();
      uint64_t v65 = MEMORY[0x263F8EE80];
      id v168 = v60;
      if (v64)
      {
        v167[1] = v63;
        sub_21DE22BD0(&v179, (uint64_t)&v183);
        uint64_t v66 = *(void *)(v173 + 16);
        uint64_t v67 = *(void *)(v66 + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v67 && (unint64_t v68 = sub_21DE2A938(v57, v59, (uint64_t)v60, v62), (v69 & 1) != 0))
        {
          uint64_t v70 = v57;
          uint64_t v71 = *(void **)(*(void *)(v66 + 56) + 8 * v68);
          swift_retain();
          uint64_t v72 = v62;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
          type metadata accessor for CachedEntityInfo();
          uint64_t v71 = (void *)swift_allocObject();
          swift_bridgeObjectRelease();
          v71[5] = v62;
          v71[6] = v65;
          uint64_t v70 = v57;
          v71[2] = v57;
          v71[3] = v59;
          v71[4] = v60;
          uint64_t v72 = v62;
        }
        uint64_t v85 = v184;
        uint64_t v86 = v185;
        __swift_project_boxed_opaque_existential_1(&v183, v184);
        v87 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v86 + 16))(v85, v86);
        uint64_t v88 = sub_21DE3DD80();
        uint64_t v60 = v89;

        OUTLINED_FUNCTION_17_0();
        uint64_t v90 = v71[6];
        swift_bridgeObjectRetain();
        swift_release();
        a1 = sub_21DE2830C(v88, (uint64_t)v60, v90);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (a1)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v91 = (void *)sub_21DE3DAA0();
          os_log_type_t v92 = sub_21DE3DF60();
          if (OUTLINED_FUNCTION_2_0(v92))
          {
            v93 = (_WORD *)OUTLINED_FUNCTION_4_0();
            OUTLINED_FUNCTION_5_0(v93);
            v96 = "Using cached system entity handler result";
LABEL_59:
            OUTLINED_FUNCTION_3_0(&dword_21DE16000, v94, v95, v96);
            OUTLINED_FUNCTION_1_0();
            goto LABEL_60;
          }
          goto LABEL_60;
        }
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v183);
        OUTLINED_FUNCTION_19_0();
        uint64_t v62 = v72;
        uint64_t v57 = v70;
        uint64_t v50 = v172;
      }
      else
      {
        uint64_t v181 = 0;
        long long v179 = 0u;
        long long v180 = 0u;
        sub_21DE22CD8((uint64_t)&v179, &qword_267D224B8);
        OUTLINED_FUNCTION_19_0();
      }
      sub_21DE22DF4((uint64_t)v186, (uint64_t)v182);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D224C0);
      if (OUTLINED_FUNCTION_7_0())
      {
        sub_21DE22BD0(&v179, (uint64_t)&v183);
        uint64_t v97 = v57;
        uint64_t v57 = v62;
        uint64_t v98 = v184;
        uint64_t v99 = v185;
        __swift_project_boxed_opaque_existential_1(&v183, v184);
        v100 = *(void (**)(uint64_t, uint64_t))(v99 + 16);
        uint64_t v101 = v99;
        uint64_t v102 = v57;
        LOBYTE(v57) = v97;
        v100(v98, v101);
        id v103 = (id)LNIntentsValueTypeIdentifierAsString();
        uint64_t v104 = sub_21DE3DD80();
        v105 = v60;
        uint64_t v107 = v106;

        uint64_t v108 = v105[2];
        uint64_t v109 = *(void *)(v108 + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v109 && (unint64_t v110 = sub_21DE2A938(v97, v59, (uint64_t)v168, v102), (v111 & 1) != 0))
        {
          v112 = *(void **)(*(void *)(v108 + 56) + 8 * v110);
          swift_retain();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
        }
        else
        {
          type metadata accessor for CachedEntityInfo();
          v112 = (void *)swift_allocObject();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v113 = MEMORY[0x263F8EE80];
          v112[5] = v102;
          v112[6] = v113;
          v112[2] = v97;
          v112[3] = v59;
          v112[4] = v168;
        }
        OUTLINED_FUNCTION_15_0();
        OUTLINED_FUNCTION_17_0();
        uint64_t v114 = v112[6];
        swift_bridgeObjectRetain();
        swift_release();
        a1 = sub_21DE2830C(v104, v107, v114);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v50 = v172;
        if (a1)
        {
          v91 = (void *)sub_21DE3DAA0();
          os_log_type_t v115 = sub_21DE3DF60();
          if (OUTLINED_FUNCTION_2_0(v115))
          {
            v116 = (_WORD *)OUTLINED_FUNCTION_4_0();
            OUTLINED_FUNCTION_5_0(v116);
            v96 = "Using cached structured data handler result";
            goto LABEL_59;
          }
LABEL_60:

          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v186);
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v183);
LABEL_83:
          swift_release();
          return a1;
        }
        id v168 = v56;
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v183);
      }
      else
      {
        id v168 = v56;
        uint64_t v181 = 0;
        long long v179 = 0u;
        long long v180 = 0u;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_21DE22CD8((uint64_t)&v179, &qword_267D224C8);
        OUTLINED_FUNCTION_15_0();
      }
      type metadata accessor for SiriReferenceResolverDefaults();
      uint64_t v117 = sub_21DE31310();
      if (v118)
      {
        uint64_t v119 = v117;
        unint64_t v120 = v118;
        swift_bridgeObjectRetain();
        v121 = sub_21DE3DAA0();
        os_log_type_t v122 = sub_21DE3DF50();
        if (os_log_type_enabled(v121, v122))
        {
          v123 = (uint8_t *)OUTLINED_FUNCTION_11_0();
          *(void *)&long long v183 = OUTLINED_FUNCTION_10_0();
          *(_DWORD *)v123 = 136315138;
          LOBYTE(v57) = (_BYTE)v123 + 12;
          swift_bridgeObjectRetain();
          uint64_t v124 = sub_21DE2A150(v119, v120, (uint64_t *)&v183);
          OUTLINED_FUNCTION_18_0(v124);
          uint64_t v50 = v172;
          OUTLINED_FUNCTION_15_0();
          sub_21DE3DFC0();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_21DE16000, v121, v122, "About to execute fetchStructuredData with mockDataType: %s.", v123, 0xCu);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_1_0();
          OUTLINED_FUNCTION_1_0();
        }
        else
        {
          swift_bridgeObjectRelease_n();
        }
      }
      else
      {
        id v125 = v168;
        v126 = sub_21DE3DAA0();
        os_log_type_t v127 = sub_21DE3DF50();
        if (os_log_type_enabled(v126, v127))
        {
          v128 = (uint8_t *)OUTLINED_FUNCTION_11_0();
          *(void *)&long long v183 = OUTLINED_FUNCTION_10_0();
          *(_DWORD *)v128 = 136315138;
          LOBYTE(v57) = (_BYTE)v128 + 4;
          uint64_t v129 = sub_21DE3DC00();
          uint64_t v131 = sub_21DE2A150(v129, v130, (uint64_t *)&v183);
          OUTLINED_FUNCTION_18_0(v131);
          OUTLINED_FUNCTION_15_0();
          sub_21DE3DFC0();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_21DE16000, v126, v127, "About to execute Link SPI for entity with id %s.", v128, 0xCu);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_1_0();
          OUTLINED_FUNCTION_1_0();
        }
        else
        {
        }
      }
      uint64_t v132 = v171;
      id v133 = v168;
      sub_21DE3DB80();
      uint64_t v134 = v173;
      uint64_t v135 = sub_21DE20600();
      uint64_t v137 = v136;
      swift_release();
      if (v137)
      {
        v138 = dispatch_semaphore_create(0);
        swift_retain();
        sub_21DE20AB8(v133, v177, (uint64_t)v186, v135, v137, v176 & 1, v134, v13, v138);

        swift_bridgeObjectRelease();
        v139 = v174;
        sub_21DE3DCF0();
        if (qword_267D22220 != -1) {
          swift_once();
        }
        uint64_t v140 = sub_21DE3DCE0();
        uint64_t v141 = __swift_project_value_buffer(v140, (uint64_t)qword_267D22660);
        v142 = v175;
        MEMORY[0x223C194A0](v139, v141);
        v143 = *(void (**)(char *, uint64_t))(v50 + 8);
        v143(v139, v132);
        char v144 = sub_21DE3DF80();
        v143(v142, v132);
        if ((v144 & 1) == 0)
        {
          id v145 = v133;
          swift_retain_n();
          id v146 = v145;
          v147 = sub_21DE3DAA0();
          os_log_type_t v148 = sub_21DE3DF50();
          int v149 = v148;
          if (os_log_type_enabled(v147, v148))
          {
            uint64_t v150 = OUTLINED_FUNCTION_10_0();
            uint64_t v176 = swift_slowAlloc();
            *(void *)&long long v183 = v176;
            *(_DWORD *)uint64_t v150 = 136315650;
            LODWORD(v175) = v149;
            sub_21DE3DB80();
            uint64_t v151 = sub_21DE3D9E0();
            uint64_t v152 = v13;
            unint64_t v154 = v153;
            swift_retain();
            swift_release();
            v182[0] = sub_21DE2A150(v151, v154, (uint64_t *)&v183);
            sub_21DE3DFC0();

            uint64_t v13 = v152;
            swift_bridgeObjectRelease();
            *(_WORD *)(v150 + 12) = 2080;
            uint64_t v155 = sub_21DE3D9E0();
            v182[0] = sub_21DE2A150(v155, v156, (uint64_t *)&v183);
            sub_21DE3DFC0();
            swift_release_n();
            swift_bridgeObjectRelease();
            *(_WORD *)(v150 + 22) = 2080;
            OUTLINED_FUNCTION_17_0();
            id v178 = *(id *)(v152 + 16);
            id v157 = v178;
            __swift_instantiateConcreteTypeFromMangledName(&qword_267D224D0);
            uint64_t v158 = sub_21DE3DD90();
            id v178 = (id)sub_21DE2A150(v158, v159, (uint64_t *)&v183);
            sub_21DE3DFC0();
            swift_release();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_21DE16000, v147, (os_log_type_t)v175, "linkEntity(%s, matches: %s) -> %s", (uint8_t *)v150, 0x20u);
            swift_arrayDestroy();
            OUTLINED_FUNCTION_1_0();
            OUTLINED_FUNCTION_1_0();
          }
          else
          {

            swift_release_n();
          }
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v186);
          OUTLINED_FUNCTION_17_0();
          a1 = *(void **)(v13 + 16);
          id v165 = a1;
          goto LABEL_83;
        }
        uint64_t v73 = sub_21DE3DAA0();
        os_log_type_t v162 = sub_21DE3DF70();
        if (OUTLINED_FUNCTION_2_0(v162))
        {
          v163 = (uint8_t *)OUTLINED_FUNCTION_11_0();
          *(_DWORD *)v163 = 134217984;
          *(void *)&long long v183 = 1000;
          sub_21DE3DFC0();
          _os_log_impl(&dword_21DE16000, v73, (os_log_type_t)v57, "FetchStructuredData timed out after %ldms", v163, 0xCu);
          OUTLINED_FUNCTION_1_0();
          v164 = v138;
        }
        else
        {
          v164 = v73;
          uint64_t v73 = v138;
        }

        goto LABEL_87;
      }
      uint64_t v73 = sub_21DE3DAA0();
      os_log_type_t v160 = sub_21DE3DF50();
      if (OUTLINED_FUNCTION_2_0(v160))
      {
        v161 = (_WORD *)OUTLINED_FUNCTION_4_0();
        OUTLINED_FUNCTION_5_0(v161);
        uint64_t v78 = "Couldn't get app entity item type";
        goto LABEL_39;
      }
    }
    else
    {
      uint64_t v73 = sub_21DE3DAA0();
      os_log_type_t v74 = sub_21DE3DF50();
      if (OUTLINED_FUNCTION_2_0(v74))
      {
        int v75 = (_WORD *)OUTLINED_FUNCTION_4_0();
        OUTLINED_FUNCTION_5_0(v75);
        uint64_t v78 = "Pool entity is not in supported types";
LABEL_39:
        OUTLINED_FUNCTION_3_0(&dword_21DE16000, v76, v77, v78);
        OUTLINED_FUNCTION_1_0();
      }
    }
LABEL_87:

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v186);
    swift_release();
    return 0;
  }
  uint64_t v23 = v6;
  if (qword_267D221F8 != -1) {
    swift_once();
  }
  uint64_t v24 = (void *)qword_267D22470;
  swift_bridgeObjectRetain();
  char v25 = sub_21DE3DB80();
  uint64_t v26 = sub_21DE3D9E0();
  uint64_t v28 = v27;
  swift_release();
  sub_21DE1E828(v26, v28, v24);
  OUTLINED_FUNCTION_29();
  swift_bridgeObjectRelease();
  if ((v25 & 1) == 0)
  {
    sub_21DE3DB80();
    uint64_t v29 = sub_21DE3D9E0();
    uint64_t v31 = v30;
    swift_release();
    if (v29 == 0x415F6E6F6D6D6F63 && v31 == 0xEA00000000007070)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_21DE3E180();
      OUTLINED_FUNCTION_29();
      uint64_t v6 = v23;
      OUTLINED_FUNCTION_19_0();
      if ((v29 & 1) == 0) {
        goto LABEL_23;
      }
    }
  }
  int64_t v79 = (void *)sub_21DE3DAA0();
  os_log_type_t v80 = sub_21DE3DF50();
  if (OUTLINED_FUNCTION_2_0(v80))
  {
    v81 = (_WORD *)OUTLINED_FUNCTION_4_0();
    OUTLINED_FUNCTION_5_0(v81);
    OUTLINED_FUNCTION_3_0(&dword_21DE16000, v82, v83, "Link query is common_Attachment, proposed entity was found by Marrs identifier, and entity type is acceptable. Returning entity without Structured Data Conversion and caching");
    OUTLINED_FUNCTION_1_0();
  }
  swift_release();

  id v84 = a1;
  return a1;
}

uint64_t sub_21DE205A0(void *a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v4 = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = a1;
  id v5 = a1;

  return sub_21DE3DF90();
}

uint64_t sub_21DE20600()
{
  sub_21DE3D540();
  sub_21DE22BE8((uint64_t)v9, (uint64_t)v7);
  if (v8)
  {
    sub_21DE3D3D0();
    if (OUTLINED_FUNCTION_9_0()) {
      goto LABEL_7;
    }
  }
  else
  {
    sub_21DE22CD8((uint64_t)v7, (uint64_t *)&unk_26AD32BC8);
  }
  sub_21DE22BE8((uint64_t)v9, (uint64_t)v7);
  if (v8)
  {
    sub_21DE3D660();
    if (OUTLINED_FUNCTION_9_0())
    {
LABEL_7:
      swift_release();
      uint64_t v0 = sub_21DE20814();
      sub_21DE22CD8((uint64_t)v9, (uint64_t *)&unk_26AD32BC8);
      return v0;
    }
  }
  else
  {
    sub_21DE22CD8((uint64_t)v7, (uint64_t *)&unk_26AD32BC8);
  }
  swift_retain_n();
  uint64_t v1 = sub_21DE3DAA0();
  os_log_type_t v2 = sub_21DE3DF70();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)OUTLINED_FUNCTION_11_0();
    v7[0] = OUTLINED_FUNCTION_10_0();
    *(_DWORD *)uint64_t v3 = 136315138;
    uint64_t v4 = sub_21DE3D9E0();
    sub_21DE2A150(v4, v5, v7);
    sub_21DE3DFC0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21DE16000, v1, v2, "Pool entity %s wasn't convertible to supported entity types, returning nil", v3, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_1_0();
  }
  else
  {

    swift_release_n();
  }
  sub_21DE22CD8((uint64_t)v9, (uint64_t *)&unk_26AD32BC8);
  return 0;
}

uint64_t sub_21DE20814()
{
  uint64_t v1 = sub_21DE3D4D0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_12_0();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32A18);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_21DE3D9D0();
  uint64_t v9 = *(void *)(v8 + 16);
  if (!v9)
  {
    uint64_t v18 = 1;
    goto LABEL_14;
  }
  uint64_t v22 = v7;
  uint64_t v23 = v3;
  uint64_t v11 = v3 + 16;
  uint64_t v10 = *(void (**)(uint64_t, unint64_t, uint64_t))(v3 + 16);
  unint64_t v12 = v8 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
  uint64_t v13 = *(void *)(v11 + 56);
  uint64_t v24 = v8;
  swift_bridgeObjectRetain();
  while (1)
  {
    v10(v0, v12, v1);
    uint64_t v14 = sub_21DE3D4C0();
    if (!v15) {
      goto LABEL_9;
    }
    if (v14 == 0x69746E655F707061 && v15 == 0xEF657079745F7974) {
      break;
    }
    char v17 = sub_21DE3E180();
    swift_bridgeObjectRelease();
    if (v17) {
      goto LABEL_13;
    }
LABEL_9:
    (*(void (**)(uint64_t, uint64_t))(v11 - 8))(v0, v1);
    v12 += v13;
    if (!--v9)
    {
      swift_bridgeObjectRelease();
      uint64_t v18 = 1;
      uint64_t v7 = v22;
      uint64_t v3 = v23;
      goto LABEL_14;
    }
  }
  swift_bridgeObjectRelease();
LABEL_13:
  swift_bridgeObjectRelease();
  uint64_t v7 = v22;
  uint64_t v3 = v23;
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 32))(v22, v0, v1);
  uint64_t v18 = 0;
LABEL_14:
  __swift_storeEnumTagSinglePayload((uint64_t)v7, v18, 1, v1);
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v1) == 1)
  {
    sub_21DE22CD8((uint64_t)v7, &qword_26AD32A18);
    return 0;
  }
  else
  {
    uint64_t v19 = sub_21DE3D4B0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v7, v1);
  }
  return v19;
}

void sub_21DE20AB8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a8;
  *(void *)(v15 + 24) = a9;
  swift_retain();
  id v16 = a9;
  uint64_t v28 = sub_21DE3DC00();
  uint64_t v18 = v17;
  uint64_t v27 = sub_21DE3DBB0();
  uint64_t v20 = v19;
  sub_21DE22DF4(a3, (uint64_t)v31);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D224A8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D224C0);
  if (swift_dynamicCast())
  {
    sub_21DE22BD0(v29, (uint64_t)v32);
    id v26 = v16;
    __swift_project_boxed_opaque_existential_1(v32, v32[3]);
    sub_21DE22DF4((uint64_t)v32, (uint64_t)v31);
    uint64_t v21 = a4;
    uint64_t v22 = (void *)swift_allocObject();
    v22[2] = a7;
    void v22[3] = sub_21DE22DEC;
    v22[4] = v15;
    sub_21DE22BD0(v31, (uint64_t)(v22 + 5));
    v22[10] = a1;
    swift_retain();
    swift_retain();
    id v23 = a1;
    uint64_t v24 = v21;
    id v16 = v26;
    sub_21DE23DD4(v28, v18, v27, v20, v24, a5, (void (*)(void))sub_21DE22EA4);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v32);
  }
  else
  {
    uint64_t v30 = 0;
    memset(v29, 0, sizeof(v29));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_21DE22CD8((uint64_t)v29, &qword_267D224C8);
    swift_beginAccess();
    char v25 = *(void **)(a8 + 16);
    *(void *)(a8 + 16) = 0;

    sub_21DE3DF90();
  }
  swift_release();
  swift_release();
}

void sub_21DE20CF0(void *a1, char a2, uint64_t a3, void (*a4)(id), uint64_t a5, void *a6, void *a7)
{
  uint64_t v13 = sub_21DE3DAA0();
  os_log_type_t v14 = sub_21DE3DF50();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_21DE16000, v13, v14, "FetchStructuredData Link SPI completed", v15, 2u);
    MEMORY[0x223C19EE0](v15, -1, -1);
  }

  if (a2)
  {
    sub_21DE22EBC(a1);
    id v19 = a1;
    id v20 = a1;
    uint64_t v21 = sub_21DE3DAA0();
    os_log_type_t v22 = sub_21DE3DF70();
    if (os_log_type_enabled(v21, v22))
    {
      id v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      v48[0] = v24;
      *(_DWORD *)id v23 = 136315138;
      *(void *)&v52[0] = a1;
      id v25 = a1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D224E0);
      uint64_t v26 = sub_21DE3DD90();
      *(void *)&v52[0] = sub_21DE2A150(v26, v27, v48);
      sub_21DE3DFC0();
      swift_bridgeObjectRelease();
      sub_21DE22EC8(a1);
      sub_21DE22EC8(a1);
      _os_log_impl(&dword_21DE16000, v21, v22, "Error occured in fetchStructuredData: %s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C19EE0](v24, -1, -1);
      MEMORY[0x223C19EE0](v23, -1, -1);
    }
    else
    {

      sub_21DE22EC8(a1);
      sub_21DE22EC8(a1);
    }
    a4(0);
    sub_21DE22EC8(a1);
  }
  else if (a1)
  {
    id v16 = objc_msgSend(a1, sel_value);
    sub_21DE3E010();
    swift_unknownObjectRelease();
    sub_21DE22ED4(v48, v52);
    uint64_t v17 = a6[3];
    uint64_t v18 = a6[4];
    __swift_project_boxed_opaque_existential_1(a6, v17);
    id v31 = (id)(*(uint64_t (**)(_OWORD *, void *, uint64_t, uint64_t))(*(void *)(v18 + 8) + 40))(v52, a7, MEMORY[0x263F8EE58] + 8, v17);
    uint64_t v32 = sub_21DE3DAA0();
    os_log_type_t v33 = sub_21DE3DF60();
    BOOL v34 = os_log_type_enabled(v32, v33);
    uint64_t v47 = a4;
    if (v34)
    {
      BOOL v35 = (uint8_t *)swift_slowAlloc();
      uint64_t v46 = swift_slowAlloc();
      v48[0] = v46;
      unint64_t v45 = v35;
      *(_DWORD *)BOOL v35 = 136315138;
      sub_21DE3DB80();
      uint64_t v36 = sub_21DE3D9E0();
      unint64_t v38 = v37;
      swift_release();
      uint64_t v51 = sub_21DE2A150(v36, v38, v48);
      sub_21DE3DFC0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21DE16000, v32, v33, "Returning and caching annotated %s entity", v45, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C19EE0](v46, -1, -1);
      MEMORY[0x223C19EE0](v45, -1, -1);
    }
    else
    {
    }
    uint64_t v39 = a6[3];
    uint64_t v40 = a6[4];
    uint64_t v41 = __swift_project_boxed_opaque_existential_1(a6, v39);
    uint64_t v49 = v39;
    uint64_t v42 = *(void *)(v40 + 8);
    uint64_t v50 = v42;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v48);
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v39 - 8) + 16))(boxed_opaque_existential_1, v41, v39);
    sub_21DE23198(v31, a7, (uint64_t)boxed_opaque_existential_1, a3, v39, v42);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v48);
    id v44 = v31;
    v47(v31);

    sub_21DE22EC8(a1);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v52);
  }
  else
  {
    uint64_t v28 = sub_21DE3DAA0();
    os_log_type_t v29 = sub_21DE3DF70();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl(&dword_21DE16000, v28, v29, "Retrieved Link data is nil", v30, 2u);
      MEMORY[0x223C19EE0](v30, -1, -1);
    }

    a4(0);
    sub_21DE22EC8(0);
  }
}

double sub_21DE2146C@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_21DE3D9E0();
  uint64_t v4 = v3;
  uint64_t v5 = sub_21DE1EB0C();
  sub_21DE28308(v2, v4, v5, (uint64_t)&v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v11)
  {
    sub_21DE22CD8((uint64_t)&v10, &qword_267D22498);
    sub_21DE21614((uint64_t)&v10);
    if (!v11)
    {
      sub_21DE22CD8((uint64_t)&v10, &qword_267D22498);
      if (sub_21DE3D9E0() == 0x6E456F4E5F6F7375 && v6 == 0xEC00000079746974)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v8 = sub_21DE3E180();
        swift_bridgeObjectRelease();
        if ((v8 & 1) == 0) {
          goto LABEL_14;
        }
      }
      sub_21DE3DB80();
      sub_21DE21614((uint64_t)&v10);
      swift_release();
      if (!v11)
      {
        sub_21DE22CD8((uint64_t)&v10, &qword_267D22498);
LABEL_14:
        *(void *)(a1 + 32) = 0;
        double result = 0.0;
        *(_OWORD *)a1 = 0u;
        *(_OWORD *)(a1 + 16) = 0u;
        return result;
      }
    }
  }
  sub_21DE22BD0(&v10, (uint64_t)v12);
  sub_21DE22BD0(v12, a1);
  return result;
}

uint64_t sub_21DE21614@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_21DE3D4D0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_12_0();
  uint64_t v7 = sub_21DE3D9D0();
  uint64_t v8 = *(void *)(v7 + 16);
  if (!v8)
  {
    swift_bridgeObjectRelease();
    uint64_t v13 = (char *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  uint64_t v11 = *(void (**)(uint64_t, unint64_t, uint64_t))(v5 + 16);
  uint64_t v10 = v5 + 16;
  uint64_t v9 = v11;
  unint64_t v12 = v7 + ((*(unsigned __int8 *)(v10 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 64));
  uint64_t v31 = *(void *)(v10 + 56);
  swift_bridgeObjectRetain();
  uint64_t v13 = (char *)MEMORY[0x263F8EE78];
  uint64_t v30 = v11;
  do
  {
    v9(v1, v12, v3);
    uint64_t v14 = sub_21DE3D4C0();
    if (!v15)
    {
LABEL_9:
      uint64_t v18 = OUTLINED_FUNCTION_13_0();
      v19(v18);
      goto LABEL_16;
    }
    if (v14 == 0x6C6F636F746F7270 && v15 == 0xE800000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v17 = sub_21DE3E180();
      swift_bridgeObjectRelease();
      if ((v17 & 1) == 0) {
        goto LABEL_9;
      }
    }
    uint64_t v20 = sub_21DE3D4B0();
    uint64_t v22 = v21;
    uint64_t v23 = OUTLINED_FUNCTION_13_0();
    v24(v23);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v13 = sub_21DE22550(0, *((void *)v13 + 2) + 1, 1, (uint64_t)v13);
    }
    unint64_t v26 = *((void *)v13 + 2);
    unint64_t v25 = *((void *)v13 + 3);
    if (v26 >= v25 >> 1) {
      uint64_t v13 = sub_21DE22550((char *)(v25 > 1), v26 + 1, 1, (uint64_t)v13);
    }
    *((void *)v13 + 2) = v26 + 1;
    unint64_t v27 = &v13[16 * v26];
    *((void *)v27 + 4) = v20;
    *((void *)v27 + 5) = v22;
    uint64_t v9 = v30;
LABEL_16:
    v12 += v31;
    --v8;
  }
  while (v8);
  swift_bridgeObjectRelease_n();
LABEL_19:
  swift_retain();
  uint64_t v28 = sub_21DE21864((uint64_t)v13);
  swift_bridgeObjectRelease();
  sub_21DE1E8F0((uint64_t)v28, a1);
  return swift_bridgeObjectRelease();
}

char *sub_21DE21864(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    uint64_t v3 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
    uint64_t v4 = (char *)MEMORY[0x263F8EE78];
    while (1)
    {
      uint64_t v5 = *v3;
      v12[0] = *(v3 - 1);
      v12[1] = v5;
      swift_bridgeObjectRetain();
      sub_21DE21A08(v12, (uint64_t)&v9);
      if (v1) {
        break;
      }
      swift_bridgeObjectRelease();
      if (v10)
      {
        sub_21DE22BD0(&v9, (uint64_t)v11);
        sub_21DE22BD0(v11, (uint64_t)&v9);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v4 = sub_21DE22458(0, *((void *)v4 + 2) + 1, 1, (uint64_t)v4);
        }
        unint64_t v7 = *((void *)v4 + 2);
        unint64_t v6 = *((void *)v4 + 3);
        if (v7 >= v6 >> 1) {
          uint64_t v4 = sub_21DE22458((char *)(v6 > 1), v7 + 1, 1, (uint64_t)v4);
        }
        *((void *)v4 + 2) = v7 + 1;
        sub_21DE22BD0(&v9, (uint64_t)&v4[40 * v7 + 32]);
      }
      else
      {
        sub_21DE22CD8((uint64_t)&v9, &qword_267D22498);
      }
      v3 += 2;
      if (!--v2)
      {
        swift_release();
        swift_bridgeObjectRelease();
        return v4;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_release();
    return (char *)MEMORY[0x263F8EE78];
  }
  return v4;
}

void sub_21DE21A08(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *a1;
  unint64_t v3 = a1[1];
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_21DE1EDD8();
  sub_21DE28308(v4, v3, v5, (uint64_t)&v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v15)
  {
    sub_21DE22BD0(&v14, (uint64_t)v16);
    swift_bridgeObjectRetain_n();
    unint64_t v6 = sub_21DE3DAA0();
    os_log_type_t v7 = sub_21DE3DF60();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      *(void *)&long long v14 = v9;
      *(_DWORD *)uint64_t v8 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_21DE2A150(v4, v3, (uint64_t *)&v14);
      sub_21DE3DFC0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21DE16000, v6, v7, "Chosen protocol for handler: %s", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C19EE0](v9, -1, -1);
      MEMORY[0x223C19EE0](v8, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    sub_21DE22BD0(v16, a2);
  }
  else
  {
    sub_21DE22CD8((uint64_t)&v14, &qword_267D22498);
    swift_bridgeObjectRetain_n();
    uint64_t v10 = sub_21DE3DAA0();
    os_log_type_t v11 = sub_21DE3DF60();
    if (os_log_type_enabled(v10, v11))
    {
      unint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      *(void *)&v16[0] = v13;
      *(_DWORD *)unint64_t v12 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)&long long v14 = sub_21DE2A150(v4, v3, (uint64_t *)v16);
      sub_21DE3DFC0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21DE16000, v10, v11, "Ignored protocol: %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C19EE0](v13, -1, -1);
      MEMORY[0x223C19EE0](v12, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    *(void *)(a2 + 32) = 0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
}

uint64_t sub_21DE21D34()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC21SiriReferenceResolver13RRLinkMatcher_logger;
  sub_21DE3DAC0();
  OUTLINED_FUNCTION_20_0();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  return v0;
}

uint64_t sub_21DE21DAC()
{
  sub_21DE21D34();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_21DE21E04()
{
  return type metadata accessor for RRLinkMatcher();
}

uint64_t type metadata accessor for RRLinkMatcher()
{
  uint64_t result = qword_267D22480;
  if (!qword_267D22480) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21DE21E54()
{
  uint64_t result = sub_21DE3DAC0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_21DE21F00()
{
  swift_bridgeObjectRetain();
  sub_21DE3DD50();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_21DE3DD50();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21DE21F8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BOOL v12 = a1 == a5 && a2 == a6;
  if (v12 || (v13 = sub_21DE3E180(), uint64_t result = 0, (v13 & 1) != 0))
  {
    if (a3 == a7 && a4 == a8)
    {
      return 1;
    }
    else
    {
      return sub_21DE3E180();
    }
  }
  return result;
}

uint64_t sub_21DE2202C()
{
  return sub_21DE3E230();
}

uint64_t sub_21DE220BC()
{
  return sub_21DE2202C();
}

uint64_t sub_21DE220C8()
{
  return sub_21DE21F00();
}

uint64_t sub_21DE220D4()
{
  return sub_21DE3E230();
}

uint64_t sub_21DE22158(uint64_t *a1, uint64_t *a2)
{
  return sub_21DE21F8C(*a1, a1[1], a1[2], a1[3], *a2, a2[1], a2[2], a2[3]);
}

uint64_t sub_21DE22174()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_21DE221B0()
{
  uint64_t v0 = sub_21DE22174();

  return MEMORY[0x270FA0228](v0, 56, 7);
}

uint64_t type metadata accessor for CachedEntityInfo()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for CachedEntityKey(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for CachedEntityKey()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for CachedEntityKey(void *a1, void *a2)
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

void *assignWithCopy for CachedEntityKey(void *a1, void *a2)
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

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for CachedEntityKey(void *a1, void *a2)
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

uint64_t getEnumTagSinglePayload for CachedEntityKey(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 32))
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

uint64_t storeEnumTagSinglePayload for CachedEntityKey(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CachedEntityKey()
{
  return &type metadata for CachedEntityKey;
}

unint64_t sub_21DE2240C()
{
  unint64_t result = qword_267D22490;
  if (!qword_267D22490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D22490);
  }
  return result;
}

char *sub_21DE22458(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D224A0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  BOOL v12 = v10 + 32;
  if (v5)
  {
    sub_21DE2E2F0((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_21DE22854(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

char *sub_21DE22550(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32B98);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  BOOL v12 = v10 + 32;
  if (v5)
  {
    sub_21DE2E354((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_21DE22974(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_21DE22640(char a1, int64_t a2, char a3, uint64_t a4)
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
    char v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D22500);
  uint64_t v10 = *(void *)(sub_21DE3D4D0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  char v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_24:
    OUTLINED_FUNCTION_16_0();
    uint64_t result = sub_21DE3E0F0();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_21DE3D4D0() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    sub_21DE2E3B4(a4 + v17, v8, v18);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_21DE22A6C(0, v8, v18, a4);
  }
  return (uint64_t)v13;
}

uint64_t sub_21DE22854(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D224A8);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_21DE3E110();
  __break(1u);
  return result;
}

uint64_t sub_21DE22974(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_21DE3E110();
  __break(1u);
  return result;
}

uint64_t sub_21DE22A6C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_21DE3D4D0() - 8);
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
  uint64_t result = sub_21DE3E110();
  __break(1u);
  return result;
}

uint64_t sub_21DE22BD0(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_21DE22BE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD32BC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_21DE22CA0()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21DE22CD8(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_20_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
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

uint64_t sub_21DE22DAC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21DE22DEC(void *a1)
{
  return sub_21DE205A0(a1, *(void *)(v1 + 16));
}

uint64_t sub_21DE22DF4(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_20_0();
  (*v3)(a2);
  return a2;
}

uint64_t sub_21DE22E54()
{
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 40);

  return MEMORY[0x270FA0238](v0, 88, 7);
}

void sub_21DE22EA4(void *a1, char a2)
{
  sub_21DE20CF0(a1, a2 & 1, *(void *)(v2 + 16), *(void (**)(id))(v2 + 24), *(void *)(v2 + 32), (void *)(v2 + 40), *(void **)(v2 + 80));
}

id sub_21DE22EBC(id a1)
{
  return a1;
}

void sub_21DE22EC8(id a1)
{
}

_OWORD *sub_21DE22ED4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
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

uint64_t sub_21DE22F98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_21DE23028(a1, a2, a3);
  *uint64_t v3 = v8;

  return swift_bridgeObjectRelease();
}

void sub_21DE23028(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_21DE2A8C0(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D224E8);
  if ((sub_21DE3E0E0() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_21DE2A8C0(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_11:
    sub_21DE3E1A0();
    __break(1u);
    return;
  }
  unint64_t v11 = v13;
LABEL_5:
  BOOL v15 = *v4;
  if (v12)
  {
    uint64_t v16 = v15[7];

    *(void *)(v16 + 8 * v11) = a1;
  }
  else
  {
    sub_21DE23150(v11, a2, a3, a1, v15);
    swift_bridgeObjectRetain();
  }
}

unint64_t sub_21DE23150(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  unint64_t v5 = (void *)(a5[6] + 16 * result);
  *unint64_t v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

uint64_t sub_21DE23198(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v37[3] = a5;
  v37[4] = a6;
  __swift_allocate_boxed_opaque_existential_1(v37);
  OUTLINED_FUNCTION_20_0();
  (*(void (**)(void))(v9 + 16))();
  id v10 = a2;
  uint64_t v11 = sub_21DE3DC00();
  uint64_t v13 = v12;
  uint64_t v14 = sub_21DE3DBB0();
  uint64_t v16 = v15;

  sub_21DE22DF4((uint64_t)v37, (uint64_t)v34);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D224A8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D224B0);
  if (OUTLINED_FUNCTION_8_0())
  {
    sub_21DE22BD0(&v31, (uint64_t)v35);
    __swift_project_boxed_opaque_existential_1(v35, v36);
    uint64_t v17 = OUTLINED_FUNCTION_6_0();
    id v19 = (id)v18(v17);
  }
  else
  {
    uint64_t v33 = 0;
    long long v31 = 0u;
    long long v32 = 0u;
    sub_21DE22CD8((uint64_t)&v31, &qword_267D224B8);
    sub_21DE22DF4((uint64_t)v37, (uint64_t)v34);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D224C0);
    if ((OUTLINED_FUNCTION_8_0() & 1) == 0)
    {
      uint64_t v33 = 0;
      long long v31 = 0u;
      long long v32 = 0u;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_21DE22CD8((uint64_t)&v31, &qword_267D224C8);
      return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v37);
    }
    sub_21DE22BD0(&v31, (uint64_t)v35);
    __swift_project_boxed_opaque_existential_1(v35, v36);
    uint64_t v20 = OUTLINED_FUNCTION_6_0();
    v21(v20);
    id v19 = (id)LNIntentsValueTypeIdentifierAsString();
  }
  uint64_t v22 = v19;
  uint64_t v23 = sub_21DE3DD80();
  uint64_t v25 = v24;

  uint64_t v26 = *(void *)(*(void *)(a4 + 16) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v26 && (sub_21DE2A938(v11, v13, v14, v16), (v27 & 1) != 0))
  {
    swift_retain();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
  }
  else
  {
    type metadata accessor for CachedEntityInfo();
    uint64_t v28 = (void *)swift_allocObject();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v29 = MEMORY[0x263F8EE80];
    v28[5] = v16;
    v28[6] = v29;
    void v28[2] = v11;
    v28[3] = v13;
    v28[4] = v14;
  }
  swift_beginAccess();
  sub_21DE22F98((uint64_t)a1, v23, v25);
  swift_endAccess();
  swift_release();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v35);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v37);
}

void OUTLINED_FUNCTION_1_0()
{
  JUMPOUT(0x223C19EE0);
}

BOOL OUTLINED_FUNCTION_2_0(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return swift_slowAlloc();
}

_WORD *OUTLINED_FUNCTION_5_0(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_18_0(uint64_t a1)
{
  *(void *)(v1 - 208) = a1;
  return v1 - 208;
}

uint64_t dispatch thunk of RRLinkStructuredDataHandling.typeId.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of RRLinkStructuredDataHandling.intentTypeName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_21DE23668(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD329F8);
  MEMORY[0x270FA5388]();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32B60);
  MEMORY[0x270FA5388]();
  if (!a2) {
    sub_21DE3DC00();
  }
  swift_bridgeObjectRetain();
  if (!a4) {
    sub_21DE3DBB0();
  }
  swift_bridgeObjectRetain();
  if (!a5) {
    sub_21DE3DB80();
  }
  swift_retain();
  if (!a7) {
    sub_21DE3DC60();
  }
  swift_bridgeObjectRetain();
  if (a9 >> 60 == 15) {
    sub_21DE3DC10();
  }
  sub_21DE25680(a8, a9);
  sub_21DE3DC20();
  sub_21DE3DC70();
  sub_21DE3DC30();
  sub_21DE3DBC0();
  sub_21DE3DBA0();
  sub_21DE3DC50();
  id v14 = objc_allocWithZone((Class)sub_21DE3DC80());
  return sub_21DE3DBF0();
}

id sub_21DE238A8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return OUTLINED_FUNCTION_1_1(a1, a2, a4, (uint64_t)&off_26CEBEBB0, a3);
}

id sub_21DE238CC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v49 = a2;
  uint64_t v55 = a5;
  uint64_t v48 = *(void *)(a5 + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  sub_21DE3DFB0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v52 = v9;
  uint64_t v53 = v8;
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v11 = (char *)&v48 - v10;
  OUTLINED_FUNCTION_0_1();
  uint64_t v54 = v12;
  uint64_t v13 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v51 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v48 - v15;
  OUTLINED_FUNCTION_0_1();
  uint64_t v18 = v17;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_5_1();
  uint64_t v58 = a4;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v57);
  uint64_t v20 = *(void (**)(void))(v18 + 16);
  OUTLINED_FUNCTION_10_1();
  v20();
  OUTLINED_FUNCTION_10_1();
  v20();
  sub_21DE254EC(0, &qword_267D22550);
  uint64_t v21 = a3;
  if (swift_dynamicCast())
  {
    uint64_t v22 = *(void **)&v56[0];
    id v23 = objc_msgSend(*(id *)&v56[0], sel_value);
    sub_21DE3E010();

    swift_unknownObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v57);
    sub_21DE22ED4(v56, &v57);
  }
  uint64_t v24 = v16;
  id v25 = v59;
  sub_21DE25528((uint64_t)&v57, (uint64_t)v56);
  if (swift_dynamicCast())
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, AssociatedTypeWitness);
    uint64_t v26 = v54;
    (*(void (**)(char *, char *, uint64_t))(v54 + 32))(v24, v11, AssociatedTypeWitness);
    id v25 = v51;
    (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v51, v24, AssociatedTypeWitness);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D22560);
    if (swift_dynamicCast())
    {
      char v27 = *(void **)&v56[0];
      swift_getObjectType();
      id v25 = v27;
      uint64_t v28 = v50;
      uint64_t v29 = sub_21DE244D8();
      if (!v28)
      {
        uint64_t v38 = v29;
        unint64_t v39 = v30;
        uint64_t v40 = (*(uint64_t (**)(char *, id, uint64_t))(v48 + 32))(v24, v49, v21);
        uint64_t v41 = v24;
        uint64_t v42 = (void *)v40;
        uint64_t v53 = v41;
        uint64_t v43 = OUTLINED_FUNCTION_9_1();
        uint64_t v45 = v44(v43);
        uint64_t v47 = v46;
        sub_21DE25628(v38, v39);
        id v25 = (id)sub_21DE23668(0, 0, 0, 0, 0, v45, v47, v38, v39);
        sub_21DE255D0(v38, v39);
        swift_unknownObjectRelease();

        swift_bridgeObjectRelease();
        sub_21DE255D0(v38, v39);
        (*(void (**)(char *, uint64_t))(v26 + 8))(v53, AssociatedTypeWitness);
        goto LABEL_12;
      }
      swift_unknownObjectRelease();
    }
    else
    {
      sub_21DE25584();
      swift_allocError();
      *uint64_t v36 = 1;
      swift_willThrow();
    }
    (*(void (**)(char *, uint64_t))(v26 + 8))(v24, AssociatedTypeWitness);
  }
  else
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, AssociatedTypeWitness);
    (*(void (**)(char *, char *))(v52 + 8))(v11, v53);
    uint64_t v31 = OUTLINED_FUNCTION_9_1();
    v32(v31);
    uint64_t v34 = v33;
    swift_bridgeObjectRelease();
    if (v34)
    {
      sub_21DE25584();
      swift_allocError();
      *BOOL v35 = 0;
      swift_willThrow();
    }
    else
    {
      id v25 = v49;
    }
  }
LABEL_12:
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v57);
  return v25;
}

void sub_21DE23DD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(void))
{
  type metadata accessor for SiriReferenceResolverDefaults();
  uint64_t v10 = sub_21DE31310();
  if (v11)
  {
    uint64_t v12 = (void *)sub_21DE23EA0(v10, v11, a3, a4, v10, v11);
    char v14 = v13;
    swift_bridgeObjectRelease();
    ((void (*)(void *, void))a7)(v12, v14 & 1);
    sub_21DE22EC8(v12);
  }
  else
  {
    a7(0);
  }
}

uint64_t sub_21DE23EA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D22520);
  MEMORY[0x270FA5388](v9 - 8);
  OUTLINED_FUNCTION_5_1();
  uint64_t v10 = HIBYTE(a6) & 0xF;
  uint64_t v11 = a5 & 0xFFFFFFFFFFFFLL;
  if ((a6 & 0x2000000000000000) != 0) {
    uint64_t v12 = HIBYTE(a6) & 0xF;
  }
  else {
    uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL;
  }
  if (!v12) {
    goto LABEL_49;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = (uint64_t)sub_21DE24C40(a5, a6, 10);
    LOBYTE(a5) = v58;
    swift_bridgeObjectRelease();
    goto LABEL_46;
  }
  if ((a6 & 0x2000000000000000) != 0)
  {
    if (a5 == 43)
    {
      if (!v10) {
        goto LABEL_70;
      }
      if (v10 == 1) {
        goto LABEL_32;
      }
      OUTLINED_FUNCTION_2_1();
      if (!v19 & v18) {
        goto LABEL_32;
      }
      uint64_t v14 = v21;
      if (v20 != 2)
      {
        OUTLINED_FUNCTION_2_1();
        if (!v19 & v18) {
          goto LABEL_32;
        }
        uint64_t v14 = 10 * v14 + v23;
        if (v22 != 3)
        {
          while (1)
          {
            OUTLINED_FUNCTION_8_1();
            if (!v19 & v18) {
              goto LABEL_32;
            }
            OUTLINED_FUNCTION_3_1();
            if (!v19) {
              goto LABEL_32;
            }
            uint64_t v14 = v25 + v24;
            if (__OFADD__(v25, v24)) {
              goto LABEL_32;
            }
            OUTLINED_FUNCTION_4_1();
            if (v19) {
              goto LABEL_46;
            }
          }
        }
      }
    }
    else
    {
      if (a5 == 45)
      {
        if (v10)
        {
          if (v10 != 1)
          {
            OUTLINED_FUNCTION_2_1();
            if (!(!v19 & v18))
            {
              if (v16 == 2)
              {
                LOBYTE(a5) = 0;
                uint64_t v14 = -(uint64_t)v17;
                goto LABEL_46;
              }
              if ((BYTE2(a5) - 48) <= 9u)
              {
                uint64_t v14 = -10 * v17 - (BYTE2(a5) - 48);
                if (v16 == 3) {
                  goto LABEL_45;
                }
                while (1)
                {
                  OUTLINED_FUNCTION_8_1();
                  if (!v19 & v18) {
                    break;
                  }
                  OUTLINED_FUNCTION_3_1();
                  if (!v19) {
                    break;
                  }
                  uint64_t v14 = v57 - v56;
                  if (__OFSUB__(v57, v56)) {
                    break;
                  }
                  OUTLINED_FUNCTION_4_1();
                  if (v19) {
                    goto LABEL_46;
                  }
                }
              }
            }
          }
LABEL_32:
          uint64_t v14 = 0;
          LOBYTE(a5) = 1;
          goto LABEL_46;
        }
        __break(1u);
LABEL_70:
        __break(1u);
        JUMPOUT(0x21DE244A8);
      }
      if (!v10 || (a5 - 48) > 9u) {
        goto LABEL_32;
      }
      uint64_t v14 = (a5 - 48);
      if (v10 != 1)
      {
        OUTLINED_FUNCTION_2_1();
        if (!v19 & v18) {
          goto LABEL_32;
        }
        uint64_t v14 = 10 * (a5 - 48) + v27;
        if (v26 != 2)
        {
          while (1)
          {
            OUTLINED_FUNCTION_8_1();
            if (!v19 & v18) {
              goto LABEL_32;
            }
            OUTLINED_FUNCTION_3_1();
            if (!v19) {
              goto LABEL_32;
            }
            uint64_t v14 = v29 + v28;
            if (__OFADD__(v29, v28)) {
              goto LABEL_32;
            }
            OUTLINED_FUNCTION_4_1();
            if (v19) {
              goto LABEL_46;
            }
          }
        }
      }
    }
LABEL_45:
    LOBYTE(a5) = 0;
    goto LABEL_46;
  }
  if ((a5 & 0x1000000000000000) != 0) {
    char v13 = (unsigned __int8 *)((a6 & 0xFFFFFFFFFFFFFFFLL) + 32);
  }
  else {
    char v13 = (unsigned __int8 *)sub_21DE3E090();
  }
  uint64_t v14 = (uint64_t)sub_21DE24D74(v13, v11, 10);
  LOBYTE(a5) = v15 & 1;
LABEL_46:
  if (a5)
  {
LABEL_49:
    char v30 = 4;
    goto LABEL_53;
  }
  char v30 = 3;
  switch(v14)
  {
    case 0:
      uint64_t v31 = self;
      swift_bridgeObjectRetain();
      id v32 = objc_msgSend(v31, sel_applicationValueType);
      goto LABEL_51;
    case 2:
      id v32 = objc_msgSend(self, sel_environmentValueType);
LABEL_51:
      id v33 = v32;
      id v34 = objc_allocWithZone(MEMORY[0x263F51D50]);
      uint64_t v35 = (uint64_t)OUTLINED_FUNCTION_6_1();
      if (!v35) {
        goto LABEL_52;
      }
      return v35;
    case 3:
      id v37 = objc_allocWithZone(MEMORY[0x263F0FD20]);
      id v38 = sub_21DE2473C(0xD000000000000013, 0x800000021DE3FC00, 1);
      uint64_t v39 = sub_21DE3D390();
      __swift_storeEnumTagSinglePayload(v6, 1, 1, v39);
      objc_allocWithZone(MEMORY[0x263F0FD18]);
      id v40 = v38;
      id v41 = sub_21DE247A8(v40, v6, 6644289, 0xE300000000000000, 0, 0, 0, 0, 0);
      sub_21DE254EC(0, (unint64_t *)&qword_267D22540);
      uint64_t v42 = self;
      id v43 = v41;
      id v44 = objc_msgSend(v42, sel_personValueType);
      id v45 = objc_allocWithZone(MEMORY[0x263F51D50]);
      uint64_t v35 = (uint64_t)OUTLINED_FUNCTION_6_1();

      goto LABEL_58;
    case 9:
      id v46 = objc_allocWithZone(MEMORY[0x263F0FC40]);
      id v47 = sub_21DE249A4(0xD000000000000024, 0x800000021DE3FBD0, 0, 0xE000000000000000, 1, 0, 0, 0xE000000000000000);
      sub_21DE254EC(0, &qword_267D22538);
      uint64_t v48 = self;
      id v40 = v47;
      id v49 = objc_msgSend(v48, sel_mediaItemValueType);
      goto LABEL_57;
    case 11:
      id v50 = objc_allocWithZone(MEMORY[0x263F51C40]);
      id v51 = sub_21DE24AA0(875770417, 0xE400000000000000, 0x2079656B73696877, 0xEC00000062756C63, 0);
      sub_21DE254EC(0, &qword_267D22530);
      uint64_t v52 = self;
      id v40 = v51;
      id v49 = objc_msgSend(v52, sel_messageConversationValueType);
LABEL_57:
      id v53 = v49;
      id v54 = objc_allocWithZone(MEMORY[0x263F51D50]);
      uint64_t v35 = (uint64_t)OUTLINED_FUNCTION_6_1();
LABEL_58:

      if (v35) {
        return v35;
      }
LABEL_52:
      char v30 = 3;
      break;
    default:
      break;
  }
LABEL_53:
  sub_21DE24D28();
  uint64_t v35 = swift_allocError();
  *uint64_t v36 = v30;
  return v35;
}

uint64_t sub_21DE244D8()
{
  return sub_21DE3DCB0();
}

uint64_t sub_21DE244F8()
{
  unint64_t v0 = sub_21DE3E120();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_21DE24544(char a1)
{
  if (!a1) {
    return 0x707954676E6F7277;
  }
  if (a1 == 1) {
    return 0x6169726553746F6ELL;
  }
  return 0xD000000000000012;
}

uint64_t sub_21DE245B0(char *a1, char *a2)
{
  return sub_21DE39B64(*a1, *a2);
}

uint64_t sub_21DE245BC()
{
  return sub_21DE39C54(*v0);
}

uint64_t sub_21DE245C4(uint64_t a1)
{
  return sub_21DE39DB4(a1, *v1);
}

uint64_t sub_21DE245CC(uint64_t a1)
{
  return sub_21DE39E10(a1, *v1);
}

uint64_t sub_21DE245D4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_21DE244F8();
  *a1 = result;
  return result;
}

uint64_t sub_21DE24604@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_21DE24544(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

id sub_21DE24640(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return OUTLINED_FUNCTION_1_1(a1, a2, a4, (uint64_t)&off_26CEBEE38, a3);
}

id sub_21DE24664(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return OUTLINED_FUNCTION_1_1(a1, a2, a4, (uint64_t)&off_26CEBEEC0, a3);
}

id sub_21DE24688(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return OUTLINED_FUNCTION_1_1(a1, a2, a4, (uint64_t)&off_26CEBEF60, a3);
}

id sub_21DE246AC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return OUTLINED_FUNCTION_1_1(a1, a2, a4, (uint64_t)&off_26CEBF170, a3);
}

id sub_21DE246D0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return OUTLINED_FUNCTION_1_1(a1, a2, a4, (uint64_t)&off_26CEBF1B0, a3);
}

id sub_21DE246F4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return OUTLINED_FUNCTION_1_1(a1, a2, a4, (uint64_t)&off_26CEBF218, a3);
}

id sub_21DE24718(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return OUTLINED_FUNCTION_1_1(a1, a2, a4, (uint64_t)&off_26CEBF258, a3);
}

id sub_21DE2473C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    os_log_type_t v5 = (void *)sub_21DE3DD70();
    swift_bridgeObjectRelease();
  }
  else
  {
    os_log_type_t v5 = 0;
  }
  id v6 = objc_msgSend(v3, sel_initWithValue_type_, v5, a3);

  return v6;
}

id sub_21DE247A8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = v9;
  uint64_t v16 = sub_21DE3D390();
  unsigned __int8 v17 = 0;
  if (__swift_getEnumTagSinglePayload(a2, 1, v16) != 1)
  {
    unsigned __int8 v17 = (void *)sub_21DE3D380();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a2, v16);
  }
  if (a4)
  {
    char v18 = (void *)sub_21DE3DD70();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v18 = 0;
  }
  if (!a7)
  {
    char v19 = 0;
    if (a9) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v20 = 0;
    goto LABEL_11;
  }
  char v19 = (void *)sub_21DE3DD70();
  swift_bridgeObjectRelease();
  if (!a9) {
    goto LABEL_10;
  }
LABEL_8:
  uint64_t v20 = (void *)sub_21DE3DD70();
  swift_bridgeObjectRelease();
LABEL_11:
  id v21 = objc_msgSend(v10, sel_initWithPersonHandle_nameComponents_displayName_image_contactIdentifier_customIdentifier_, a1, v17, v18, a5, v19, v20);

  return v21;
}

id sub_21DE2492C(void *a1, void *a2)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  id v5 = objc_msgSend(v2, sel_initWithValue_valueType_, sub_21DE3E160(), a2);
  swift_unknownObjectRelease();

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  return v5;
}

id sub_21DE249A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = v8;
  if (a2)
  {
    uint64_t v14 = (void *)sub_21DE3DD70();
    swift_bridgeObjectRelease();
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    char v15 = 0;
    if (a8) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v16 = 0;
    goto LABEL_8;
  }
  uint64_t v14 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  char v15 = (void *)sub_21DE3DD70();
  swift_bridgeObjectRelease();
  if (!a8) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v16 = (void *)sub_21DE3DD70();
  swift_bridgeObjectRelease();
LABEL_8:
  id v17 = objc_msgSend(v9, sel_initWithIdentifier_title_type_artwork_artist_, v14, v15, a5, a6, v16);

  return v17;
}

id sub_21DE24AA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = (void *)sub_21DE3DD70();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    uint64_t v9 = 0;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v10 = 0;
    goto LABEL_6;
  }
  uint64_t v9 = (void *)sub_21DE3DD70();
  swift_bridgeObjectRelease();
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  sub_21DE254EC(0, (unint64_t *)&qword_267D22540);
  uint64_t v10 = (void *)sub_21DE3DEC0();
  swift_bridgeObjectRelease();
LABEL_6:
  id v11 = objc_msgSend(v5, sel_initWithMessageConversationIdentifier_groupName_recipients_, v8, v9, v10);

  return v11;
}

void *sub_21DE24B7C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32BB8);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21DE24BE4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v6 = sub_21DE3DE70();
    OUTLINED_FUNCTION_7_1(v6);
    return v7 | 4;
  }
  else
  {
    uint64_t v3 = MEMORY[0x223C195D0](15, a1 >> 16);
    OUTLINED_FUNCTION_7_1(v3);
    return v4 | 8;
  }
}

unsigned __int8 *sub_21DE24C40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_21DE3DE90();
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
  uint64_t v5 = sub_21DE24FF0();
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
    uint64_t v7 = (unsigned __int8 *)sub_21DE3E090();
  }
LABEL_7:
  id v11 = sub_21DE24D74(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unint64_t sub_21DE24D28()
{
  unint64_t result = qword_267D22528;
  if (!qword_267D22528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D22528);
  }
  return result;
}

unsigned __int8 *sub_21DE24D74(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v15 = a2 - 1;
      if (a2 != 1)
      {
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
        if (result)
        {
          uint64_t v9 = 0;
          char v19 = result + 1;
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
        return 0;
      }
      return 0;
    }
  }
  else
  {
    if (v4 != 45)
    {
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
  }
  __break(1u);
  return result;
}

uint64_t sub_21DE24FF0()
{
  unint64_t v0 = sub_21DE2505C();
  uint64_t v4 = sub_21DE25090(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_21DE2505C()
{
  return sub_21DE3DEA0();
}

uint64_t sub_21DE25090(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_21DE251E8(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_21DE24B7C(v9, 0);
      unint64_t v12 = sub_21DE252E8((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_21DE3E090();
LABEL_4:
        JUMPOUT(0x223C19550);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x223C19550](v11 + 4, v11[2]);
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
    return MEMORY[0x223C19550]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_21DE251E8(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
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
    a1 = sub_21DE24BE4(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_21DE24BE4(v6, v5, v4);
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

unint64_t sub_21DE252E8(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_35;
  }
  if (a3 < 0) {
    goto LABEL_38;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_35:
    void *v9 = a4;
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
    unint64_t result = v12;
    if ((v12 & 0xC) == v15) {
      unint64_t result = sub_21DE24BE4(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      unint64_t result = sub_21DE3DE60();
      char v19 = result;
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
      }
      else
      {
        unint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          unint64_t result = sub_21DE3E090();
        }
        char v19 = *(unsigned char *)(result + v18);
      }
    }
    if ((v12 & 0xC) == v15)
    {
      unint64_t result = sub_21DE24BE4(v12, a6, a7);
      unint64_t v12 = result;
      if ((a7 & 0x1000000000000000) == 0)
      {
LABEL_27:
        unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
        goto LABEL_31;
      }
    }
    else if ((a7 & 0x1000000000000000) == 0)
    {
      goto LABEL_27;
    }
    if (v23 <= v12 >> 16) {
      goto LABEL_37;
    }
    unint64_t v12 = sub_21DE3DE30();
LABEL_31:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_35;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_35;
    }
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_21DE254EC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_21DE25528(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_21DE25584()
{
  unint64_t result = qword_267D22558;
  if (!qword_267D22558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D22558);
  }
  return result;
}

uint64_t sub_21DE255D0(uint64_t a1, unint64_t a2)
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

uint64_t sub_21DE25628(uint64_t a1, unint64_t a2)
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

uint64_t sub_21DE25680(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_21DE25628(a1, a2);
  }
  return a1;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for StructuredDataHandlingError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for StructuredDataHandlingError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21DE257F8);
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

uint64_t sub_21DE25820(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_21DE2582C(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for StructuredDataHandlingError()
{
  return &type metadata for StructuredDataHandlingError;
}

unint64_t sub_21DE25848()
{
  unint64_t result = qword_267D22568;
  if (!qword_267D22568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D22568);
  }
  return result;
}

id OUTLINED_FUNCTION_1_1@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  return sub_21DE238CC(a1, a2, a3, a5, a4);
}

id OUTLINED_FUNCTION_6_1()
{
  return sub_21DE2492C((void *)(v1 - 88), v0);
}

unint64_t OUTLINED_FUNCTION_7_1(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFFFFCLL | v1 & 3;
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return v0;
}

void *initializeBufferWithCopyOfBuffer for EnvironmentStructuredDataHandler(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for EnvironmentStructuredDataHandler()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for EnvironmentStructuredDataHandler(void *a1, void *a2)
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

void *assignWithTake for EnvironmentStructuredDataHandler(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EnvironmentStructuredDataHandler(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for EnvironmentStructuredDataHandler(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EnvironmentStructuredDataHandler()
{
  return &type metadata for EnvironmentStructuredDataHandler;
}

unint64_t sub_21DE25AEC()
{
  return 0xD000000000000011;
}

uint64_t sub_21DE25B08()
{
  return 2;
}

unint64_t sub_21DE25B10()
{
  return 0xD000000000000018;
}

id sub_21DE25B2C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_21DE3D4D0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21DE3D530();
  swift_allocObject();
  swift_bridgeObjectRetain();
  uint64_t v10 = MEMORY[0x223C18CB0](a1, a2);
  swift_bridgeObjectRetain();
  sub_21DE3D4A0();
  sub_21DE3D400();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_21DE3D3F0();
  swift_allocObject();
  uint64_t v11 = sub_21DE3D3E0();
  v15[3] = v10;
  sub_21DE3D4E0();
  uint64_t v12 = MEMORY[0x223C18C90](v11);
  if (v12)
  {
    id v13 = (id)sub_21DE23668(0, 0, 0, 0, v12, 0, 0, 0, 0xF000000000000000);
    swift_release();
  }
  else
  {
    id v13 = a3;
  }
  swift_release();
  swift_release();
  return v13;
}

uint64_t sub_21DE25D60()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_21DE25D90()
{
  return 0xD000000000000011;
}

unint64_t sub_21DE25DB0()
{
  return 0xD000000000000018;
}

id sub_21DE25DD0(uint64_t *a1, void *a2)
{
  return sub_21DE25B2C(*a1, a1[1], a2);
}

Swift::String_optional __swiftcall CNContactStore.retriveContactName(identifier:)(Swift::String identifier)
{
  v19[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = HIBYTE(identifier._object) & 0xF;
  if (((uint64_t)identifier._object & 0x2000000000000000) == 0) {
    uint64_t v2 = identifier._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    goto LABEL_9;
  }
  unint64_t v3 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32BC0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_21DE3ED20;
  *(void *)(v4 + 32) = objc_msgSend(self, sel_descriptorForRequiredKeysForStyle_, 0);
  sub_21DE3DEF0();
  uint64_t v5 = (void *)sub_21DE3DD70();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D22578);
  uint64_t v6 = (void *)sub_21DE3DEC0();
  swift_bridgeObjectRelease();
  v19[0] = 0;
  id v7 = objc_msgSend(v3, sel_unifiedContactWithIdentifier_keysToFetch_error_, v5, v6, v19);

  if (!v7)
  {
    id v14 = v19[0];
    uint64_t v15 = (void *)sub_21DE3D3A0();

    swift_willThrow();
LABEL_9:
    uint64_t v11 = 0;
    id v13 = 0;
    goto LABEL_10;
  }
  id v8 = v19[0];
  id v9 = objc_msgSend(v7, sel_fullName);
  if (!v9)
  {

    goto LABEL_9;
  }
  uint64_t v10 = v9;
  uint64_t v11 = sub_21DE3DD80();
  id v13 = v12;

LABEL_10:
  uint64_t v16 = v11;
  unsigned __int8 v17 = v13;
  result.value._object = v17;
  result.value._countAndFlagsBits = v16;
  return result;
}

uint64_t sub_21DE25FBC(uint64_t a1, uint64_t a2)
{
  return CNContactStore.retriveContactName(identifier:)(*(Swift::String *)&a1).value._countAndFlagsBits;
}

uint64_t dispatch thunk of ContactStoring.retriveContactName(identifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

void sub_21DE25FF4(unint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD329F8);
  MEMORY[0x270FA5388](v2 - 8);
  OUTLINED_FUNCTION_0_2();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32B60);
  MEMORY[0x270FA5388](v3 - 8);
  OUTLINED_FUNCTION_0_2();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32A00);
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_0_2();
  uint64_t v56 = v5;
  unint64_t v6 = sub_21DE267BC(a1);
  swift_bridgeObjectRetain_n();
  id v7 = sub_21DE3DAA0();
  os_log_type_t v8 = sub_21DE3DF50();
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (_DWORD *)swift_slowAlloc();
    v57[0] = swift_slowAlloc();
    _DWORD *v9 = 136315138;
    uint64_t v10 = sub_21DE3DC80();
    uint64_t v11 = MEMORY[0x223C196A0](v6, v10);
    uint64_t v13 = sub_21DE2A150(v11, v12, v57);
    OUTLINED_FUNCTION_4_2(v13);
    sub_21DE3DFC0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_3_2(&dword_21DE16000, v14, v15, "[postResolveProcessing] pureMatchFilteredEntities: %s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_1_0();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  sub_21DE3DB20();
  unint64_t v16 = sub_21DE26D2C(v6);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain_n();
  unsigned __int8 v17 = sub_21DE3DAA0();
  os_log_type_t v18 = sub_21DE3DF50();
  if (os_log_type_enabled(v17, v18))
  {
    char v19 = (_DWORD *)swift_slowAlloc();
    v57[0] = swift_slowAlloc();
    *char v19 = 136315138;
    uint64_t v20 = sub_21DE3DC80();
    uint64_t v21 = MEMORY[0x223C196A0](v16, v20);
    uint64_t v23 = sub_21DE2A150(v21, v22, v57);
    OUTLINED_FUNCTION_4_2(v23);
    sub_21DE3DFC0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_3_2(&dword_21DE16000, v24, v25, "[postResolveProcessing] selectExactValueMatchedCandidatesFrom: %s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_1_0();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v58 = MEMORY[0x263F8EE78];
  if (!(v16 >> 62))
  {
    uint64_t v26 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v26) {
      goto LABEL_9;
    }
LABEL_25:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v26 = sub_21DE3E100();
  swift_bridgeObjectRelease();
  if (!v26) {
    goto LABEL_25;
  }
LABEL_9:
  if (v26 >= 1)
  {
    uint64_t v27 = 0;
    unint64_t v28 = v16 & 0xC000000000000001;
    OUTLINED_FUNCTION_2_2();
    unint64_t v54 = v16;
    uint64_t v53 = v26;
    unint64_t v52 = v16 & 0xC000000000000001;
    do
    {
      if (v28) {
        id v29 = (id)MEMORY[0x223C19800](v27, v16);
      }
      else {
        id v29 = *(id *)(v16 + 8 * v27 + 32);
      }
      char v30 = v29;
      v57[0] = sub_21DE3DC00();
      v57[1] = v31;
      uint64_t v32 = sub_21DE3D3C0();
      __swift_storeEnumTagSinglePayload(v56, 1, 1, v32);
      sub_21DE1BF14();
      sub_21DE3DFF0();
      char v34 = v33;
      sub_21DE27FC0(v56);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v35 = v30;
      uint64_t v36 = v35;
      if (v34)
      {
        MEMORY[0x223C19640]();
        if (*(void *)((v58 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v58 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_21DE3DF00();
        }
        sub_21DE3DF30();
        sub_21DE3DEF0();
      }
      else
      {
        id v55 = v35;
        id v37 = v35;
        id v38 = sub_21DE3DAA0();
        os_log_type_t v39 = sub_21DE3DF50();
        if (os_log_type_enabled(v38, v39))
        {
          id v40 = (uint8_t *)swift_slowAlloc();
          v57[0] = swift_slowAlloc();
          *(_DWORD *)id v40 = 136315138;
          uint64_t v41 = sub_21DE3DC00();
          sub_21DE2A150(v41, v42, v57);
          sub_21DE3DFC0();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_21DE16000, v38, v39, "[postResolveProcessing] Modifying entityId: %s", v40, 0xCu);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_1_0();
          OUTLINED_FUNCTION_1_0();
        }
        else
        {
        }
        sub_21DE3DC00();
        uint64_t v43 = sub_21DE3DEA0();
        uint64_t v45 = v44;
        uint64_t v47 = v46;
        uint64_t v49 = v48;
        swift_bridgeObjectRelease();
        MEMORY[0x223C19540](v43, v45, v47, v49);
        swift_bridgeObjectRelease();
        sub_21DE3DBB0();
        sub_21DE3DB80();
        sub_21DE3DC60();
        sub_21DE3DC10();
        sub_21DE3DC20();
        sub_21DE3DC70();
        sub_21DE3DC30();
        sub_21DE3DBC0();
        sub_21DE3DBD0();
        sub_21DE3DBA0();
        sub_21DE3DC50();
        id v50 = objc_allocWithZone((Class)sub_21DE3DC80());
        id v51 = (id)sub_21DE3DBF0();
        MEMORY[0x223C19640]();
        if (*(void *)((v58 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v58 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_21DE3DF00();
        }
        sub_21DE3DF30();
        sub_21DE3DEF0();

        unint64_t v16 = v54;
        uint64_t v26 = v53;
        unint64_t v28 = v52;
        OUTLINED_FUNCTION_2_2();
        uint64_t v36 = v55;
      }
      ++v27;
    }
    while (v26 != v27);
    goto LABEL_25;
  }
  __break(1u);
}

unint64_t sub_21DE267BC(unint64_t a1)
{
  uint64_t v3 = sub_21DE3D4D0();
  uint64_t v40 = *(void *)(v3 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  os_log_type_t v8 = (char *)v35 - v7;
  unint64_t v49 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_36;
  }
  uint64_t v9 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (v9)
  {
    unint64_t v10 = 0;
    unint64_t v41 = a1 & 0xC000000000000001;
    uint64_t v37 = a1 & 0xFFFFFFFFFFFFFF8;
    uint64_t v38 = v9;
    v35[1] = v1;
    unint64_t v36 = a1 + 32;
    uint64_t v11 = (void (**)(char *, uint64_t))(v40 + 8);
    uint64_t v45 = "common_ReminderList";
    unint64_t v46 = 0x800000021DE3FCC0;
    uint64_t v47 = v40 + 16;
    unint64_t v39 = a1;
    while (1)
    {
      if (v41)
      {
        id v12 = (id)MEMORY[0x223C19800](v10, a1);
      }
      else
      {
        if (v10 >= *(void *)(v37 + 16)) {
          goto LABEL_35;
        }
        id v12 = *(id *)(v36 + 8 * v10);
      }
      id v13 = v12;
      if (__OFADD__(v10++, 1)) {
        break;
      }
      sub_21DE3DB80();
      uint64_t v15 = sub_21DE3D9D0();
      swift_release();
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)(v15 + 16);
      if (!v17)
      {
        swift_bridgeObjectRelease();
LABEL_27:
        id v27 = v13;
        uint64_t v1 = (void (*)(char *, uint64_t))&v49;
        MEMORY[0x223C19640]();
        if (*(void *)((v49 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v49 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_21DE3DF00();
        }
        sub_21DE3DF30();
        sub_21DE3DEF0();

        goto LABEL_32;
      }
      id v43 = v13;
      unint64_t v44 = v10;
      unint64_t v18 = v16 + ((*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80));
      uint64_t v48 = *(void *)(v40 + 72);
      char v19 = *(void (**)(char *, unint64_t, uint64_t))(v40 + 16);
      uint64_t v42 = v16;
      swift_bridgeObjectRetain();
      while (1)
      {
        v19(v8, v18, v3);
        uint64_t v20 = sub_21DE3D4C0();
        if (!v21)
        {
          v19(v6, (unint64_t)v8, v3);
LABEL_23:
          uint64_t v26 = *v11;
          (*v11)(v6, v3);
          v26(v8, v3);
          goto LABEL_24;
        }
        if (v20 == 0xD000000000000013 && v21 == v46)
        {
          swift_bridgeObjectRelease();
          v19(v6, (unint64_t)v8, v3);
        }
        else
        {
          char v22 = sub_21DE3E180();
          swift_bridgeObjectRelease();
          v19(v6, (unint64_t)v8, v3);
          if ((v22 & 1) == 0) {
            goto LABEL_23;
          }
        }
        uint64_t v1 = (void (*)(char *, uint64_t))v6;
        if (sub_21DE3D4B0() == 0x65747265766E6F63 && v23 == 0xE900000000000064) {
          break;
        }
        char v25 = sub_21DE3E180();
        swift_bridgeObjectRelease();
        uint64_t v1 = *v11;
        (*v11)(v6, v3);
        v1(v8, v3);
        if (v25) {
          goto LABEL_31;
        }
LABEL_24:
        v18 += v48;
        if (!--v17)
        {
          swift_bridgeObjectRelease_n();
          uint64_t v9 = v38;
          a1 = v39;
          id v13 = v43;
          unint64_t v10 = v44;
          goto LABEL_27;
        }
      }
      swift_bridgeObjectRelease();
      unint64_t v28 = *v11;
      (*v11)(v6, v3);
      v28(v8, v3);
LABEL_31:

      swift_bridgeObjectRelease_n();
      uint64_t v9 = v38;
      a1 = v39;
      unint64_t v10 = v44;
LABEL_32:
      if (v10 == v9)
      {
        swift_bridgeObjectRelease();
        unint64_t v29 = v49;
        goto LABEL_38;
      }
    }
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_21DE3E100();
  }
  swift_bridgeObjectRelease();
  unint64_t v29 = MEMORY[0x263F8EE78];
LABEL_38:
  if (v29 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v33 = sub_21DE3E100();
    swift_bridgeObjectRelease();
    if (v33) {
      goto LABEL_40;
    }
LABEL_44:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    return a1;
  }
  if (!*(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_44;
  }
LABEL_40:
  char v30 = sub_21DE3DAA0();
  os_log_type_t v31 = sub_21DE3DF50();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v32 = 0;
    _os_log_impl(&dword_21DE16000, v30, v31, "Filtered out flexible matched entities and only returning pure matches", v32, 2u);
    MEMORY[0x223C19EE0](v32, -1, -1);
  }

  return v29;
}

unint64_t sub_21DE26D2C(uint64_t a1)
{
  uint64_t v2 = sub_21DE27018();
  if (!v3) {
    goto LABEL_31;
  }
  uint64_t v6 = v2;
  uint64_t v7 = v3;
  uint64_t v8 = v4;
  uint64_t v9 = v5;
  unint64_t v10 = sub_21DE3DAA0();
  os_log_type_t v11 = sub_21DE3DF50();
  if (os_log_type_enabled(v10, v11))
  {
    id v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v12 = 0;
    _os_log_impl(&dword_21DE16000, v10, v11, "Try to filter for exact match candidates only", v12, 2u);
    MEMORY[0x223C19EE0](v12, -1, -1);
  }

  BOOL v13 = v6 == 1701667182 && v7 == 0xE400000000000000;
  if (v13 || (sub_21DE3E180() & 1) != 0)
  {
    unint64_t v14 = swift_bridgeObjectRetain();
    uint64_t v15 = sub_21DE275D0;
LABEL_10:
    unint64_t v16 = (unint64_t)sub_21DE27904(v14, v6, v7, v8, v9, (uint64_t (*)(void, void, void, void, void))v15);
    goto LABEL_11;
  }
  BOOL v20 = v6 == 0x6C6562616CLL && v7 == 0xE500000000000000;
  if (v20 || (sub_21DE3E180() & 1) != 0)
  {
    unint64_t v14 = swift_bridgeObjectRetain();
    uint64_t v15 = sub_21DE27ADC;
    goto LABEL_10;
  }
  BOOL v21 = v6 == 0x65756C6176 && v7 == 0xE500000000000000;
  if (v21 || (sub_21DE3E180() & 1) != 0)
  {
    unint64_t v14 = swift_bridgeObjectRetain();
    uint64_t v15 = sub_21DE27D7C;
    goto LABEL_10;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v16 = MEMORY[0x263F8EE78];
LABEL_11:
  if (v16 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_21DE3E100();
    swift_bridgeObjectRelease();
    if (v22) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
  if (!*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_30:
    swift_bridgeObjectRelease();
LABEL_31:
    swift_bridgeObjectRetain();
    return a1;
  }
LABEL_13:
  uint64_t v17 = sub_21DE3DAA0();
  os_log_type_t v18 = sub_21DE3DF50();
  if (os_log_type_enabled(v17, v18))
  {
    char v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v19 = 0;
    _os_log_impl(&dword_21DE16000, v17, v18, "We did filter to exact match candidates only", v19, 2u);
    MEMORY[0x223C19EE0](v19, -1, -1);
  }

  return v16;
}

uint64_t sub_21DE27018()
{
  if (sub_21DE3D9E0() == 0x505F6E6F6D6D6F63 && v0 == 0xED00006E6F737265) {
    goto LABEL_13;
  }
  char v2 = sub_21DE3E180();
  swift_bridgeObjectRelease();
  if (v2) {
    goto LABEL_14;
  }
  if (sub_21DE3D9E0() == 0x525F6E6F6D6D6F63 && v3 == 0xEF7265646E696D65) {
    goto LABEL_13;
  }
  char v5 = sub_21DE3E180();
  swift_bridgeObjectRelease();
  if (v5) {
    goto LABEL_14;
  }
  if (sub_21DE3D9E0() == 0xD000000000000013 && v6 == 0x800000021DE3FCA0)
  {
LABEL_13:
    swift_bridgeObjectRelease();
  }
  else
  {
    char v12 = sub_21DE3E180();
    swift_bridgeObjectRelease();
    if ((v12 & 1) == 0) {
      goto LABEL_25;
    }
  }
LABEL_14:
  uint64_t v7 = 1701667182;
  uint64_t v8 = sub_21DE3D9C0();
  unint64_t v9 = sub_21DE28204(1701667182, 0xE400000000000000, v8);
  swift_bridgeObjectRelease();
  if (!v9) {
    goto LABEL_25;
  }
  if (!(v9 >> 62))
  {
    if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_17;
    }
LABEL_24:
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_21DE3E100();
  swift_bridgeObjectRelease();
  if (!v13) {
    goto LABEL_24;
  }
LABEL_17:
  sub_21DE2E22C(0, (v9 & 0xC000000000000001) == 0, v9);
  if ((v9 & 0xC000000000000001) != 0) {
    MEMORY[0x223C19800](0, v9);
  }
  else {
    swift_retain();
  }
  swift_bridgeObjectRelease();
  sub_21DE3D960();
  uint64_t v11 = v10;
  swift_release();
  if (!v11)
  {
LABEL_25:
    uint64_t v14 = sub_21DE3D9C0();
    unint64_t v15 = sub_21DE28204(0xD000000000000018, 0x800000021DE3F850, v14);
    swift_bridgeObjectRelease();
    if (!v15) {
      goto LABEL_46;
    }
    if (v15 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v21 = sub_21DE3E100();
      swift_bridgeObjectRelease();
      if (!v21) {
        goto LABEL_45;
      }
    }
    else if (!*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_45;
    }
    sub_21DE2E22C(0, (v15 & 0xC000000000000001) == 0, v15);
    if ((v15 & 0xC000000000000001) != 0) {
      MEMORY[0x223C19800](0, v15);
    }
    else {
      swift_retain();
    }
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_21DE3D990();
    swift_release();
    if (!v16) {
      goto LABEL_46;
    }
    uint64_t v7 = 0x6C6562616CLL;
    uint64_t v17 = sub_21DE3D9C0();
    unint64_t v18 = sub_21DE28204(0x6C6562616CLL, 0xE500000000000000, v17);
    swift_bridgeObjectRelease();
    if (!v18)
    {
      swift_release();
      goto LABEL_46;
    }
    if (v18 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_21DE3E100();
      swift_bridgeObjectRelease();
      if (v22)
      {
LABEL_34:
        sub_21DE2E22C(0, (v18 & 0xC000000000000001) == 0, v18);
        if ((v18 & 0xC000000000000001) != 0) {
          MEMORY[0x223C19800](0, v18);
        }
        else {
          swift_retain();
        }
        swift_bridgeObjectRelease();
        sub_21DE3D960();
        uint64_t v20 = v19;
        swift_release();
        swift_release();
        if (v20) {
          return v7;
        }
LABEL_46:
        if (sub_21DE3D9E0() == 0xD000000000000014 && v23 == 0x800000021DE3F870)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          char v24 = sub_21DE3E180();
          swift_bridgeObjectRelease();
          if ((v24 & 1) == 0) {
            return 0;
          }
        }
        uint64_t v7 = 0x65756C6176;
        uint64_t v25 = sub_21DE3D9C0();
        unint64_t v26 = sub_21DE28204(0x65756C6176, 0xE500000000000000, v25);
        swift_bridgeObjectRelease();
        if (v26)
        {
          if (v26 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v29 = sub_21DE3E100();
            swift_bridgeObjectRelease();
            if (v29) {
              goto LABEL_53;
            }
          }
          else if (*(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
LABEL_53:
            sub_21DE2E22C(0, (v26 & 0xC000000000000001) == 0, v26);
            if ((v26 & 0xC000000000000001) != 0) {
              MEMORY[0x223C19800](0, v26);
            }
            else {
              swift_retain();
            }
            swift_bridgeObjectRelease();
            sub_21DE3D960();
            uint64_t v28 = v27;
            swift_release();
            if (!v28) {
              return 0;
            }
            return v7;
          }
          swift_bridgeObjectRelease();
          return 0;
        }
        return 0;
      }
    }
    else if (*(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_34;
    }
    swift_release();
LABEL_45:
    swift_bridgeObjectRelease();
    goto LABEL_46;
  }
  return v7;
}

uint64_t sub_21DE275D0()
{
  sub_21DE3DB80();
  uint64_t v0 = sub_21DE3D9E0();
  uint64_t v2 = v1;
  swift_release();
  BOOL v3 = v0 == 0x505F6E6F6D6D6F63 && v2 == 0xED00006E6F737265;
  if (v3
    || (sub_21DE3E180() & 1) != 0
    || (v0 == 0x525F6E6F6D6D6F63 ? (BOOL v15 = v2 == 0xEF7265646E696D65) : (BOOL v15 = 0),
        v15 || (sub_21DE3E180() & 1) != 0 || v0 == 0xD000000000000013 && v2 == 0x800000021DE3FCA0))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v16 = sub_21DE3E180();
    swift_bridgeObjectRelease();
    uint64_t result = 0;
    if ((v16 & 1) == 0) {
      return result;
    }
  }
  sub_21DE3DB80();
  uint64_t v4 = sub_21DE3D9C0();
  swift_release();
  unint64_t v5 = sub_21DE28204(1701667182, 0xE400000000000000, v4);
  swift_bridgeObjectRelease();
  if (!v5) {
    return 0;
  }
  if (!(v5 >> 62))
  {
    if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_21DE3E100();
  swift_bridgeObjectRelease();
  if (!v17)
  {
LABEL_30:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_10:
  sub_21DE2E22C(0, (v5 & 0xC000000000000001) == 0, v5);
  if ((v5 & 0xC000000000000001) != 0) {
    MEMORY[0x223C19800](0, v5);
  }
  else {
    swift_retain();
  }
  swift_bridgeObjectRelease();
  sub_21DE3D960();
  uint64_t v7 = v6;
  swift_release();
  if (!v7) {
    return 0;
  }
  type metadata accessor for BaseQueryMatcher();
  uint64_t v8 = sub_21DE1A904();
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  if (v8 == sub_21DE1A904() && v10 == v11)
  {
    swift_bridgeObjectRelease_n();
    return 1;
  }
  else
  {
    char v13 = sub_21DE3E180();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v13 & 1;
  }
}

uint64_t (*sub_21DE27904(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(void, void, void, void, void)))(void, void, void, void, void)
{
  unint64_t v11 = a1;
  unint64_t v26 = (uint64_t (*)(void, void, void, void, void))MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v12 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v12)
  {
    while (1)
    {
      unint64_t v13 = 0;
      uint64_t v22 = v11 & 0xFFFFFFFFFFFFFF8;
      unint64_t v23 = v11 & 0xC000000000000001;
      unint64_t v20 = v11;
      uint64_t v21 = v12;
      uint64_t v19 = a6;
      while (v23)
      {
        id v14 = (id)MEMORY[0x223C19800](v13, v11);
LABEL_7:
        BOOL v15 = v14;
        unint64_t v16 = v13 + 1;
        if (__OFADD__(v13, 1)) {
          goto LABEL_17;
        }
        id v25 = v14;
        char v17 = a6(&v25, a2, a3, a4, a5);
        if (v6)
        {
          swift_bridgeObjectRelease();

          swift_release();
          goto LABEL_21;
        }
        if (v17)
        {
          sub_21DE3E0A0();
          sub_21DE3E0C0();
          sub_21DE3E0D0();
          sub_21DE3E0B0();
          a6 = v19;
          unint64_t v11 = v20;
        }
        else
        {
        }
        ++v13;
        if (v16 == v21)
        {
          a6 = v26;
          goto LABEL_20;
        }
      }
      if (v13 < *(void *)(v22 + 16)) {
        break;
      }
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      uint64_t v12 = sub_21DE3E100();
      if (!v12) {
        goto LABEL_19;
      }
    }
    id v14 = *(id *)(v11 + 8 * v13 + 32);
    goto LABEL_7;
  }
LABEL_19:
  a6 = (uint64_t (*)(void, void, void, void, void))MEMORY[0x263F8EE78];
LABEL_20:
  swift_bridgeObjectRelease();
LABEL_21:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a6;
}

unint64_t sub_21DE27ADC()
{
  sub_21DE3DB80();
  uint64_t v0 = sub_21DE3D9C0();
  swift_release();
  unint64_t v1 = sub_21DE28204(0xD000000000000018, 0x800000021DE3F850, v0);
  swift_bridgeObjectRelease();
  if (v1)
  {
    if (v1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_21DE3E100();
      swift_bridgeObjectRelease();
      if (!v11) {
        goto LABEL_27;
      }
    }
    else if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_27;
    }
    sub_21DE2E22C(0, (v1 & 0xC000000000000001) == 0, v1);
    if ((v1 & 0xC000000000000001) != 0) {
      MEMORY[0x223C19800](0, v1);
    }
    else {
      swift_retain();
    }
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_21DE3D990();
    swift_release();
    if (!v2) {
      goto LABEL_28;
    }
    uint64_t v3 = sub_21DE3D9C0();
    unint64_t v1 = sub_21DE28204(0x6C6562616CLL, 0xE500000000000000, v3);
    swift_bridgeObjectRelease();
    if (!v1)
    {
LABEL_21:
      swift_release();
      return v1 & 1;
    }
    if (v1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_21DE3E100();
      swift_bridgeObjectRelease();
      if (v12) {
        goto LABEL_10;
      }
    }
    else if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_10:
      sub_21DE2E22C(0, (v1 & 0xC000000000000001) == 0, v1);
      if ((v1 & 0xC000000000000001) != 0) {
        MEMORY[0x223C19800](0, v1);
      }
      else {
        swift_retain();
      }
      swift_bridgeObjectRelease();
      sub_21DE3D960();
      uint64_t v5 = v4;
      swift_release();
      if (v5)
      {
        type metadata accessor for BaseQueryMatcher();
        uint64_t v6 = sub_21DE1A904();
        uint64_t v8 = v7;
        swift_bridgeObjectRelease();
        if (v6 == sub_21DE1A904() && v8 == v9) {
          LOBYTE(v1) = 1;
        }
        else {
          LOBYTE(v1) = sub_21DE3E180();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_21;
      }
      swift_release();
LABEL_28:
      LOBYTE(v1) = 0;
      return v1 & 1;
    }
    swift_release();
LABEL_27:
    swift_bridgeObjectRelease();
    goto LABEL_28;
  }
  return v1 & 1;
}

uint64_t sub_21DE27D7C()
{
  sub_21DE3DB80();
  uint64_t v0 = sub_21DE3D9E0();
  uint64_t v2 = v1;
  swift_release();
  if (v0 == 0xD000000000000014 && v2 == 0x800000021DE3F870)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v3 = sub_21DE3E180();
    swift_bridgeObjectRelease();
    uint64_t result = 0;
    if ((v3 & 1) == 0) {
      return result;
    }
  }
  sub_21DE3DB80();
  uint64_t v5 = sub_21DE3D9C0();
  swift_release();
  unint64_t v6 = sub_21DE28204(0x65756C6176, 0xE500000000000000, v5);
  swift_bridgeObjectRelease();
  if (!v6) {
    return 0;
  }
  if (!(v6 >> 62))
  {
    if (*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_8;
    }
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_21DE3E100();
  swift_bridgeObjectRelease();
  if (!v15) {
    goto LABEL_18;
  }
LABEL_8:
  sub_21DE2E22C(0, (v6 & 0xC000000000000001) == 0, v6);
  if ((v6 & 0xC000000000000001) != 0) {
    MEMORY[0x223C19800](0, v6);
  }
  else {
    swift_retain();
  }
  swift_bridgeObjectRelease();
  sub_21DE3D960();
  uint64_t v8 = v7;
  swift_release();
  if (!v8) {
    return 0;
  }
  type metadata accessor for BaseQueryMatcher();
  uint64_t v9 = sub_21DE1A904();
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();
  if (v9 == sub_21DE1A904() && v11 == v12)
  {
    swift_bridgeObjectRelease_n();
    return 1;
  }
  else
  {
    char v14 = sub_21DE3E180();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v14 & 1;
  }
}

uint64_t sub_21DE27FC0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32A00);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void OUTLINED_FUNCTION_3_2(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_4_2(uint64_t a1)
{
  *(void *)(v1 - 144) = a1;
  return v1 - 144;
}

uint64_t sub_21DE28080()
{
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t sub_21DE280A8()
{
  sub_21DE28080();

  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t type metadata accessor for LinkAppConnectionPool()
{
  return self;
}

ValueMetadata *type metadata accessor for RRConstants()
{
  return &type metadata for RRConstants;
}

uint64_t sub_21DE28110()
{
  uint64_t v0 = sub_21DE3DCE0();
  __swift_allocate_value_buffer(v0, qword_267D22660);
  *(void *)__swift_project_value_buffer(v0, (uint64_t)qword_267D22660) = 1000;
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104);

  return v1();
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

uint64_t sub_21DE28208(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_21DE2A8C0(a1, a2), (v3 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

uint64_t sub_21DE2824C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  unint64_t v4 = sub_21DE2A8C0(a1, a2);
  if ((v5 & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(void *)(*(void *)(a3 + 56) + 16 * v4);
  swift_bridgeObjectRetain();
  return v6;
}

double sub_21DE282A4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_21DE2A8C0(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 32 * v6;
    sub_21DE25528(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

void *sub_21DE2830C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  unint64_t v4 = sub_21DE2A8C0(a1, a2);
  if ((v5 & 1) == 0) {
    return 0;
  }
  unint64_t v6 = *(void **)(*(void *)(a3 + 56) + 8 * v4);
  id v7 = v6;
  return v6;
}

uint64_t sub_21DE28354(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_21DE2A8C0(a1, a2), (v3 & 1) != 0)) {
    return swift_retain();
  }
  else {
    return 0;
  }
}

double sub_21DE28398@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_21DE2A8C0(a1, a2), (v7 & 1) != 0))
  {
    sub_21DE2AE08(*(void *)(a3 + 56) + 40 * v6, a4);
  }
  else
  {
    *(void *)(a4 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
  }
  return result;
}

uint64_t sub_21DE283F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_21DE2A9F8(a1), (v6 & 1) != 0))
  {
    unint64_t v7 = v5;
    uint64_t v8 = *(void *)(a2 + 56);
    uint64_t v9 = sub_21DE3D4D0();
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(a3, v8 + *(void *)(*(void *)(v9 - 8) + 72) * v7, v9);
    uint64_t v10 = a3;
    uint64_t v11 = 0;
    uint64_t v12 = v9;
  }
  else
  {
    uint64_t v12 = sub_21DE3D4D0();
    uint64_t v10 = a3;
    uint64_t v11 = 1;
  }

  return __swift_storeEnumTagSinglePayload(v10, v11, 1, v12);
}

uint64_t sub_21DE284B8()
{
  uint64_t v0 = sub_21DE3DAC0();
  __swift_allocate_value_buffer(v0, qword_26AD32CA8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26AD32CA8);
  type metadata accessor for RRResolver();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32A28);
  sub_21DE3DD90();
  return sub_21DE3DAB0();
}

uint64_t sub_21DE28554()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32BA0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21DE3EE20;
  if (qword_26AD32AA0 != -1) {
    swift_once();
  }
  uint64_t v1 = unk_26AD32C20;
  *(void *)(inited + 32) = qword_26AD32C18;
  *(void *)(inited + 40) = v1;
  uint64_t Matcher = type metadata accessor for PersonQueryMatcher();
  swift_bridgeObjectRetain();
  uint64_t v3 = swift_initStaticObject();
  *(void *)(inited + 72) = Matcher;
  *(void *)(inited + 80) = &off_26CEBEBF0;
  *(void *)(inited + 48) = v3;
  if (qword_26AD32AC8 != -1) {
    swift_once();
  }
  uint64_t v4 = unk_26AD32C50;
  *(void *)(inited + 88) = qword_26AD32C48;
  *(void *)(inited + 96) = v4;
  uint64_t v5 = qword_26AD32B10;
  swift_bridgeObjectRetain();
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_26AD32C90;
  *(void *)(inited + 128) = type metadata accessor for AttachmentQueryMatcher();
  *(void *)(inited + 136) = &off_26CEBEC00;
  *(void *)(inited + 104) = v6;
  uint64_t v7 = qword_26AD32AB8;
  swift_retain();
  if (v7 != -1) {
    swift_once();
  }
  uint64_t v8 = unk_26AD32C40;
  *(void *)(inited + 144) = qword_26AD32C38;
  *(void *)(inited + 152) = v8;
  uint64_t v9 = type metadata accessor for CalendarEventQueryMatcher();
  swift_bridgeObjectRetain();
  uint64_t v10 = swift_initStaticObject();
  *(void *)(inited + 184) = v9;
  *(void *)(inited + 192) = &off_26CEBEBE0;
  *(void *)(inited + 160) = v10;
  if (qword_26AD32AB0 != -1) {
    swift_once();
  }
  uint64_t v11 = unk_26AD32C30;
  *(void *)(inited + 200) = qword_26AD32C28;
  *(void *)(inited + 208) = v11;
  uint64_t v12 = type metadata accessor for ApplicationQueryMatcher();
  swift_bridgeObjectRetain();
  uint64_t v13 = swift_initStaticObject();
  *(void *)(inited + 240) = v12;
  *(void *)(inited + 248) = &off_26CEBEBD0;
  *(void *)(inited + 216) = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32A30);
  uint64_t result = sub_21DE3DD30();
  qword_26AD32A50 = result;
  return result;
}

void static RREntityMatcher.entity(_:matches:entityFoundByMarrsIdentifier:)()
{
  OUTLINED_FUNCTION_19_1();
  LODWORD(v106) = v0;
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD329F8);
  uint64_t v6 = OUTLINED_FUNCTION_12_1(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_0_2();
  uint64_t v101 = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32B60);
  uint64_t v9 = OUTLINED_FUNCTION_12_1(v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_0_2();
  uint64_t v100 = v10;
  sub_21DE3DA50();
  OUTLINED_FUNCTION_0_0();
  uint64_t v102 = v11;
  MEMORY[0x270FA5388](v12);
  uint64_t v13 = sub_21DE3DAC0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v107 = v14;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_11_1();
  uint64_t v103 = v16;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_17_1();
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_17_1();
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = &v99[-v20];
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32B70);
  uint64_t v23 = OUTLINED_FUNCTION_12_1(v22);
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_17_1();
  MEMORY[0x270FA5388](v24);
  unint64_t v26 = &v99[-v25];
  uint64_t v27 = sub_21DE3DCD0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v105 = v28;
  MEMORY[0x270FA5388](v29);
  os_log_type_t v31 = &v99[-((v30 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_26AD32A48 != -1) {
    swift_once();
  }
  if (byte_26AD32CC0 != 1 || !sub_21DE29338(v4, v2, v106 & 1))
  {
    sub_21DE3DB90();
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v26, 1, v27);
    uint64_t v104 = v13;
    if (EnumTagSinglePayload == 1)
    {
      sub_21DE2A01C((uint64_t)v26, &qword_26AD32B70);
    }
    else
    {
      uint64_t v33 = (*(uint64_t (**)(unsigned char *, unsigned char *, uint64_t))(v105 + 32))(v31, v26, v27);
      if (qword_26AD32BD8 != -1) {
        uint64_t v33 = swift_once();
      }
      OUTLINED_FUNCTION_5_2(v33, (uint64_t)qword_26AD32CA8);
      OUTLINED_FUNCTION_8_2();
      v34();
      id v35 = sub_21DE3DAA0();
      os_log_type_t v36 = sub_21DE3DF60();
      if (os_log_type_enabled(v35, v36))
      {
        uint64_t v37 = (uint8_t *)OUTLINED_FUNCTION_4_0();
        *(_WORD *)uint64_t v37 = 0;
        _os_log_impl(&dword_21DE16000, v35, v36, "rrEntity.typedValue conversion", v37, 2u);
        uint64_t v13 = v104;
        OUTLINED_FUNCTION_1_0();
      }

      (*(void (**)(unsigned char *, uint64_t))(v107 + 8))(v21, v13);
      sub_21DE3D9E0();
      uint64_t v38 = sub_21DE3D550();
      swift_bridgeObjectRelease();
      if (v38)
      {
        uint64_t v109 = v27;
        boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v108);
        (*(void (**)(uint64_t *, unsigned char *, uint64_t))(v105 + 16))(boxed_opaque_existential_1, v31, v27);
        sub_21DE3DA40();
        sub_21DE3DA20();
        sub_21DE3DA30();
        OUTLINED_FUNCTION_6_2();
        v40();
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v108);
        sub_21DE22BE8((uint64_t)v110, (uint64_t)&v108);
        if (v109)
        {
          sub_21DE3D420();
          if (swift_dynamicCast())
          {
            uint64_t v107 = sub_21DE3D410();
            swift_release();
            uint64_t v106 = sub_21DE3DC00();
            sub_21DE3DBB0();
            sub_21DE3DB90();
            uint64_t v41 = sub_21DE3DB70();
            __swift_storeEnumTagSinglePayload(v100, 1, 1, v41);
            sub_21DE3DC30();
            uint64_t v42 = sub_21DE3D3B0();
            __swift_storeEnumTagSinglePayload(v101, 1, 1, v42);
            sub_21DE3DC90();
            sub_21DE3DD30();
            id v43 = objc_allocWithZone((Class)sub_21DE3DC80());
            sub_21DE3DBE0();
            sub_21DE2A01C((uint64_t)v110, (uint64_t *)&unk_26AD32BC8);
            OUTLINED_FUNCTION_6_2();
            v44();
            goto LABEL_73;
          }
        }
        else
        {
          sub_21DE2A01C((uint64_t)&v108, (uint64_t *)&unk_26AD32BC8);
        }
        sub_21DE2A01C((uint64_t)v110, (uint64_t *)&unk_26AD32BC8);
      }
      OUTLINED_FUNCTION_6_2();
      v45();
    }
    if (qword_26AD32A60 != -1) {
      swift_once();
    }
    uint64_t v46 = qword_26AD32A50;
    uint64_t v47 = sub_21DE3D9E0();
    sub_21DE28398(v47, v48, v46, (uint64_t)&v108);
    swift_bridgeObjectRelease();
    if (v109)
    {
      sub_21DE22BD0(&v108, (uint64_t)v110);
    }
    else
    {
      if (qword_26AD32A70 != -1) {
        swift_once();
      }
      uint64_t v49 = qword_26AD32C00;
      uint64_t Matcher = type metadata accessor for BaseQueryMatcher();
      v112 = &off_26CEBEC10;
      v110[0] = v49;
      swift_retain();
      sub_21DE2A01C((uint64_t)&v108, (uint64_t *)&unk_26AD32A38);
    }
    uint64_t v50 = Matcher;
    id v51 = v112;
    __swift_project_boxed_opaque_existential_1(v110, Matcher);
    sub_21DE3DB40();
    swift_allocObject();
    swift_retain();
    uint64_t v52 = sub_21DE3DB10();
    uint64_t v53 = sub_21DE3DB80();
    LOBYTE(v50) = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _UNKNOWN **))v51[1])(v52, v53, v106 & 1, v50, v51);
    swift_release();
    uint64_t v54 = swift_release();
    if (v50)
    {
      char v55 = sub_21DE3D9E0();
      uint64_t v57 = v56;
      if (qword_26AD32AA0 != -1) {
        swift_once();
      }
      OUTLINED_FUNCTION_23_0();
      BOOL v59 = v59 && v57 == v58;
      if (v59)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        OUTLINED_FUNCTION_14_0();
        OUTLINED_FUNCTION_29();
        if ((v55 & 1) == 0) {
          goto LABEL_51;
        }
      }
      sub_21DE3DB80();
      char v67 = sub_21DE3D9E0();
      uint64_t v69 = v68;
      swift_release();
      OUTLINED_FUNCTION_23_0();
      if (v59 && v69 == v70)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        OUTLINED_FUNCTION_14_0();
        uint64_t v72 = OUTLINED_FUNCTION_29();
        if ((v67 & 1) == 0)
        {
          if (qword_26AD32BD8 != -1) {
            uint64_t v72 = swift_once();
          }
          OUTLINED_FUNCTION_5_2(v72, (uint64_t)qword_26AD32CA8);
          OUTLINED_FUNCTION_8_2();
          v73();
          os_log_type_t v74 = (void *)sub_21DE3DAA0();
          os_log_type_t v75 = sub_21DE3DF60();
          if (OUTLINED_FUNCTION_2_0(v75))
          {
            *(_WORD *)OUTLINED_FUNCTION_4_0() = 0;
            OUTLINED_FUNCTION_3_0(&dword_21DE16000, v76, v77, "convertRREntityToPersonAnnotatedEntity conversion");
            OUTLINED_FUNCTION_1_0();
          }

          uint64_t v78 = OUTLINED_FUNCTION_3_3();
          v79(v78);
          static RREntityMatcher.convertRREntityToPersonAnnotatedEntity(rrEntity:)();
          goto LABEL_70;
        }
      }
LABEL_51:
      char v80 = sub_21DE3D9E0();
      uint64_t v82 = v81;
      if (qword_26AD32AB8 != -1) {
        swift_once();
      }
      OUTLINED_FUNCTION_23_0();
      if (v59 && v82 == v83)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        OUTLINED_FUNCTION_14_0();
        OUTLINED_FUNCTION_29();
        if ((v80 & 1) == 0) {
          goto LABEL_72;
        }
      }
      sub_21DE3DB80();
      char v85 = sub_21DE3D9E0();
      uint64_t v87 = v86;
      swift_release();
      OUTLINED_FUNCTION_23_0();
      if (v59 && v87 == v88)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        OUTLINED_FUNCTION_14_0();
        uint64_t v90 = OUTLINED_FUNCTION_29();
        if ((v85 & 1) == 0)
        {
          if (qword_26AD32BD8 != -1) {
            uint64_t v90 = swift_once();
          }
          OUTLINED_FUNCTION_5_2(v90, (uint64_t)qword_26AD32CA8);
          OUTLINED_FUNCTION_8_2();
          v91();
          os_log_type_t v92 = (void *)sub_21DE3DAA0();
          os_log_type_t v93 = sub_21DE3DF60();
          if (OUTLINED_FUNCTION_2_0(v93))
          {
            *(_WORD *)OUTLINED_FUNCTION_4_0() = 0;
            OUTLINED_FUNCTION_3_0(&dword_21DE16000, v94, v95, "convertRREntityToCalendarEventAnnotatedEntity conversion");
            OUTLINED_FUNCTION_1_0();
          }

          uint64_t v96 = OUTLINED_FUNCTION_3_3();
          v97(v96);
          static RREntityMatcher.convertRREntityToCalendarEventAnnotatedEntity(rrEntity:)();
LABEL_70:
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v110);
          goto LABEL_73;
        }
      }
LABEL_72:
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v110);
      id v98 = v4;
      goto LABEL_73;
    }
    if (qword_26AD32BD8 != -1) {
      uint64_t v54 = swift_once();
    }
    OUTLINED_FUNCTION_5_2(v54, (uint64_t)qword_26AD32CA8);
    OUTLINED_FUNCTION_8_2();
    v60();
    uint64_t v61 = (void *)sub_21DE3DAA0();
    os_log_type_t v62 = sub_21DE3DF60();
    if (OUTLINED_FUNCTION_2_0(v62))
    {
      *(_WORD *)OUTLINED_FUNCTION_4_0() = 0;
      OUTLINED_FUNCTION_3_0(&dword_21DE16000, v63, v64, "queryMatcher.match returned nil");
      OUTLINED_FUNCTION_1_0();
    }

    uint64_t v65 = OUTLINED_FUNCTION_3_3();
    v66(v65);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v110);
  }
LABEL_73:
  OUTLINED_FUNCTION_2_3();
}

void *sub_21DE29338(void *a1, uint64_t a2, char a3)
{
  if (qword_267D22228 != -1) {
    swift_once();
  }
  swift_retain();
  uint64_t v6 = sub_21DE1F3B0(a1, a2, a3 & 1);
  swift_release();
  if (!v6)
  {
    if (qword_267D22210 != -1) {
      swift_once();
    }
    swift_beginAccess();
    uint64_t v7 = qword_267D22650;
    if (qword_267D22650)
    {
      uint64_t v8 = sub_21DE3D9E0();
      uint64_t v10 = sub_21DE28354(v8, v9, v7);
      swift_endAccess();
      swift_bridgeObjectRelease();
      if (v10)
      {
        swift_retain();
        uint64_t v6 = sub_21DE1F3B0(a1, v10, 0);
        swift_release();
        swift_release();
        return v6;
      }
    }
    else
    {
      swift_endAccess();
    }
    return 0;
  }
  return v6;
}

void static RREntityMatcher.convertRREntityToPersonAnnotatedEntity(rrEntity:)()
{
  OUTLINED_FUNCTION_19_1();
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD329F8);
  uint64_t v3 = OUTLINED_FUNCTION_12_1(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_0_2();
  uint64_t v45 = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32B60);
  uint64_t v6 = OUTLINED_FUNCTION_12_1(v5);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = OUTLINED_FUNCTION_10_2(v7, (uint64_t)v44);
  OUTLINED_FUNCTION_0_0();
  uint64_t v10 = v9;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v44 - v15;
  if (qword_26AD32BD8 != -1) {
    swift_once();
  }
  uint64_t v17 = __swift_project_value_buffer(v8, (uint64_t)qword_26AD32CA8);
  uint64_t v48 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v48(v16, v17, v8);
  uint64_t v18 = sub_21DE3DAA0();
  os_log_type_t v19 = sub_21DE3DF50();
  if (os_log_type_enabled(v18, v19))
  {
    *(_WORD *)OUTLINED_FUNCTION_4_0() = 0;
    OUTLINED_FUNCTION_20_1(&dword_21DE16000, v20, v21, "common_Person query matched with a basic contact address RREntity. Converting matched RREntity to common_Person");
    OUTLINED_FUNCTION_1_0();
  }
  uint64_t v47 = v14;

  uint64_t v22 = *(uint8_t **)(v10 + 8);
  uint64_t v46 = v10 + 8;
  ((void (*)(char *, uint64_t))v22)(v16, v8);
  if (qword_267D22230 != -1) {
    swift_once();
  }
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D22588);
  __swift_project_value_buffer(v23, (uint64_t)qword_267D22678);
  uint64_t v24 = (void (*)(uint64_t))sub_21DE3DA10();
  uint64_t v25 = sub_21DE3DB80();
  uint64_t v26 = OUTLINED_FUNCTION_9_2(v25);
  v24(v26);
  if (v18)
  {
    swift_release();
    swift_release();
    uint64_t v27 = v47;
    v48(v47, v17, v8);
    uint64_t v48 = v1;
    uint64_t v28 = sub_21DE3DAA0();
    os_log_type_t v29 = sub_21DE3DF70();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      v50[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v30 = 136315138;
      unint64_t v44 = v30 + 4;
      sub_21DE3DB80();
      uint64_t v31 = sub_21DE3D9B0();
      uint64_t v45 = v22;
      uint64_t v32 = v31;
      unint64_t v34 = v33;
      swift_release();
      uint64_t v49 = sub_21DE2A150(v32, v34, v50);
      sub_21DE3DFC0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21DE16000, v28, v29, "Failed to transform the matched entity %s into common_Person. Returning orignal matched entity", v30, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_1_0();

      ((void (*)(char *, uint64_t))v45)(v47, v8);
    }
    else
    {

      ((void (*)(char *, uint64_t))v22)(v27, v8);
    }
    OUTLINED_FUNCTION_2_3();
    id v43 = v41;
  }
  else
  {
    swift_release();
    swift_release();
    uint64_t v48 = (void (*)(char *, uint64_t, uint64_t))sub_21DE3DC00();
    sub_21DE3DBB0();
    swift_retain();
    sub_21DE3D410();
    swift_release();
    id v35 = v44;
    sub_21DE3DC20();
    uint64_t v36 = sub_21DE3DC70();
    sub_21DE3DC30();
    uint64_t v37 = sub_21DE3D3B0();
    uint64_t v38 = (char *)v45;
    __swift_storeEnumTagSinglePayload((uint64_t)v45, 1, 1, v37);
    sub_21DE3DBA0();
    id v39 = objc_allocWithZone((Class)sub_21DE3DC80());
    OUTLINED_FUNCTION_7_2();
    uint64_t v47 = v38;
    uint64_t v48 = 0;
    uint64_t v45 = v35;
    uint64_t v46 = v36;
    unint64_t v44 = (uint8_t *)v40;
    OUTLINED_FUNCTION_15_1();
    swift_release();
    OUTLINED_FUNCTION_2_3();
  }
}

void static RREntityMatcher.convertRREntityToCalendarEventAnnotatedEntity(rrEntity:)()
{
  OUTLINED_FUNCTION_19_1();
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD329F8);
  uint64_t v3 = OUTLINED_FUNCTION_12_1(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_0_2();
  id v52 = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32B60);
  uint64_t v6 = OUTLINED_FUNCTION_12_1(v5);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = OUTLINED_FUNCTION_10_2(v7, v48);
  OUTLINED_FUNCTION_0_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_11_1();
  uint64_t v51 = v12;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v48 - v14;
  if (qword_26AD32BD8 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v8, (uint64_t)qword_26AD32CA8);
  uint64_t v16 = *(void (**)(void))(v10 + 16);
  OUTLINED_FUNCTION_21_0();
  v16();
  uint64_t v17 = sub_21DE3DAA0();
  os_log_type_t v18 = sub_21DE3DF50();
  if (os_log_type_enabled(v17, v18))
  {
    *(_WORD *)OUTLINED_FUNCTION_4_0() = 0;
    OUTLINED_FUNCTION_20_1(&dword_21DE16000, v19, v20, "common_CalendarEvent query matched with DateTimeRange entity. Converting matched RREntity to common_CalendarEvent");
    OUTLINED_FUNCTION_1_0();
  }

  uint64_t v49 = *(void (**)(char *, uint64_t))(v10 + 8);
  uint64_t v50 = v10 + 8;
  v49(v15, v8);
  if (qword_267D22250 != -1) {
    swift_once();
  }
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D22590);
  __swift_project_value_buffer(v21, (uint64_t)qword_267D226A8);
  uint64_t v22 = (void (*)(uint64_t))sub_21DE3DA10();
  uint64_t v23 = sub_21DE3DB80();
  uint64_t v24 = OUTLINED_FUNCTION_9_2(v23);
  v22(v24);
  if (v17)
  {
    swift_release();
    swift_release();
    uint64_t v25 = v51;
    OUTLINED_FUNCTION_21_0();
    v16();
    id v26 = v1;
    uint64_t v27 = v17;
    id v52 = v26;
    uint64_t v28 = v17;
    os_log_type_t v29 = sub_21DE3DAA0();
    os_log_type_t v30 = sub_21DE3DF70();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = swift_slowAlloc();
      uint64_t v32 = (void *)swift_slowAlloc();
      uint64_t v48 = swift_slowAlloc();
      v54[0] = v48;
      *(_DWORD *)uint64_t v31 = 136315394;
      sub_21DE3DB80();
      uint64_t v33 = sub_21DE3D9B0();
      unint64_t v35 = v34;
      swift_release();
      uint64_t v53 = sub_21DE2A150(v33, v35, v54);
      sub_21DE3DFC0();

      swift_bridgeObjectRelease();
      *(_WORD *)(v31 + 12) = 2112;
      uint64_t v36 = v17;
      uint64_t v37 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v53 = v37;
      sub_21DE3DFC0();
      void *v32 = v37;

      _os_log_impl(&dword_21DE16000, v29, v30, "Failed to transform the matched entity %s into common_CalendarEvent, with error: %@ Returning original matched entity", (uint8_t *)v31, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D22598);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1_0();
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_1_0();

      uint64_t v38 = v51;
    }
    else
    {

      uint64_t v38 = v25;
    }
    v49((char *)v38, v8);
    OUTLINED_FUNCTION_2_3();
    id v47 = v45;
  }
  else
  {
    swift_release();
    swift_release();
    uint64_t v51 = sub_21DE3DC00();
    sub_21DE3DBB0();
    swift_retain();
    sub_21DE3D410();
    swift_release();
    uint64_t v39 = v48;
    sub_21DE3DC20();
    uint64_t v40 = sub_21DE3DC70();
    sub_21DE3DC30();
    uint64_t v41 = sub_21DE3D3B0();
    uint64_t v42 = (uint64_t)v52;
    __swift_storeEnumTagSinglePayload((uint64_t)v52, 1, 1, v41);
    sub_21DE3DBA0();
    id v43 = objc_allocWithZone((Class)sub_21DE3DC80());
    OUTLINED_FUNCTION_7_2();
    uint64_t v51 = v42;
    id v52 = 0;
    uint64_t v49 = (void (*)(char *, uint64_t))v39;
    uint64_t v50 = v40;
    uint64_t v48 = v44;
    OUTLINED_FUNCTION_15_1();
    swift_release();
    OUTLINED_FUNCTION_2_3();
  }
}

uint64_t static RREntityMatcher.entity(_:matches:lastProposedEntityType:)(uint64_t a1, uint64_t a2)
{
  if (qword_26AD32A70 != -1) {
    swift_once();
  }
  return sub_21DE19100(a2, a1, 0) & 1;
}

uint64_t sub_21DE29FA8()
{
  if (qword_267D22200 != -1) {
    swift_once();
  }
  qword_267D22580 = qword_267D22648;

  return swift_retain();
}

uint64_t sub_21DE2A00C(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_21DE2A01C(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_6_2();
  v3();
  return a1;
}

uint64_t sub_21DE2A074(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_21DE2A0B0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_21DE2A0D8(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_21DE2A150(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_21DE3DFC0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_21DE2A150(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_21DE2A224(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_21DE25528((uint64_t)v12, *a3);
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
      sub_21DE25528((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_21DE2A224(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_21DE2A37C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_21DE3DFD0();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_21DE2A454(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_21DE3E090();
    if (!v8)
    {
      uint64_t result = sub_21DE3E0F0();
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

void *sub_21DE2A37C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_21DE3E110();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_21DE2A454(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_21DE2A4EC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_21DE2A660(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_21DE2A660((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21DE2A4EC(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_21DE3DE20();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x263F8EE78];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
LABEL_6:
  unint64_t v3 = sub_21DE24B7C(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_21DE3E060();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_21DE3E110();
  __break(1u);
LABEL_14:
  uint64_t result = sub_21DE3E0F0();
  __break(1u);
  return result;
}

char *sub_21DE2A660(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32BB8);
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
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_21DE2A810(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_21DE2A738(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_21DE2A738(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_21DE3E110();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_21DE2A810(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_21DE3E110();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unsigned char **sub_21DE2A8A0(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

ValueMetadata *type metadata accessor for RREntityMatcher()
{
  return &type metadata for RREntityMatcher;
}

unint64_t sub_21DE2A8C0(uint64_t a1, uint64_t a2)
{
  sub_21DE3E210();
  sub_21DE3DD50();
  uint64_t v4 = sub_21DE3E230();

  return sub_21DE2AA7C(a1, a2, v4);
}

unint64_t sub_21DE2A938(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_21DE3E210();
  swift_bridgeObjectRetain();
  sub_21DE3DD50();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_21DE3DD50();
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_21DE3E230();

  return sub_21DE2AB60(a1, a2, a3, a4, v8);
}

unint64_t sub_21DE2A9F8(uint64_t a1)
{
  sub_21DE3DB00();
  sub_21DE1E46C(&qword_26AD32B48);
  uint64_t v2 = sub_21DE3DD40();

  return sub_21DE2AC5C(a1, v2);
}

unint64_t sub_21DE2AA7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_21DE3E180() & 1) == 0)
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
      while (!v14 && (sub_21DE3E180() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_21DE2AB60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = a5 & ~v7;
  if ((*(void *)(v5 + 64 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
  {
    uint64_t v13 = ~v7;
    uint64_t v14 = *(void *)(v5 + 48);
    do
    {
      uint64_t v15 = (void *)(v14 + 32 * v8);
      uint64_t v16 = v15[2];
      uint64_t v17 = v15[3];
      BOOL v18 = *v15 == a1 && v15[1] == a2;
      if (v18 || (sub_21DE3E180() & 1) != 0)
      {
        BOOL v19 = v16 == a3 && v17 == a4;
        if (v19 || (sub_21DE3E180() & 1) != 0) {
          break;
        }
      }
      unint64_t v8 = (v8 + 1) & v13;
    }
    while (((*(void *)(v6 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) != 0);
  }
  return v8;
}

unint64_t sub_21DE2AC5C(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_21DE3DB00();
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
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    BOOL v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_21DE1E46C(&qword_267D22460);
      char v15 = sub_21DE3DD60();
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

uint64_t sub_21DE2AE08(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_2(uint64_t a1, uint64_t a2)
{
  return __swift_project_value_buffer(v2, a2);
}

uint64_t OUTLINED_FUNCTION_9_2(uint64_t a1)
{
  *(void *)(v1 - 104) = a1;
  return v1 - 104;
}

uint64_t OUTLINED_FUNCTION_10_2@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 160) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return sub_21DE3DAC0();
}

uint64_t OUTLINED_FUNCTION_12_1(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return sub_21DE3E180();
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return sub_21DE3DBF0();
}

void OUTLINED_FUNCTION_17_1()
{
  *(void *)(v1 - 256) = v0;
}

void OUTLINED_FUNCTION_20_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t sub_21DE2B024()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D22588);
  __swift_allocate_value_buffer(v0, qword_267D22678);
  __swift_project_value_buffer(v0, (uint64_t)qword_267D22678);
  sub_21DE3D9F0();
  sub_21DE3D4F0();
  return sub_21DE3DA00();
}

uint64_t sub_21DE2B0AC@<X0>(void *a1@<X8>)
{
  uint64_t v42 = a1;
  uint64_t v2 = sub_21DE3D4D0();
  uint64_t v44 = *(void *)(v2 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  os_log_type_t v5 = (char *)v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v41 - v6;
  sub_21DE3D6B0();
  swift_allocObject();
  uint64_t v8 = sub_21DE3D6A0();
  uint64_t v9 = sub_21DE3D9E0();
  uint64_t v11 = v10;
  if (qword_26AD32AD8 != -1) {
    swift_once();
  }
  BOOL v12 = qword_26AD32C58 == v9 && unk_26AD32C60 == v11;
  id v43 = v5;
  if (!v12 && (sub_21DE3E180() & 1) == 0)
  {
    if (qword_26AD32AE0 != -1) {
      swift_once();
    }
    BOOL v27 = qword_26AD32C68 == v9 && unk_26AD32C70 == v11;
    if (v27 || (sub_21DE3E180() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      sub_21DE3D620();
      sub_21DE3D560();
      if (v45)
      {
        sub_21DE3D870();
        swift_allocObject();
        sub_21DE3D860();
        sub_21DE3D600();
        if (v28)
        {
          sub_21DE3D840();
          swift_bridgeObjectRelease();
        }
        sub_21DE3D610();
        if (v29)
        {
          sub_21DE3D850();
          swift_bridgeObjectRelease();
        }
        goto LABEL_13;
      }
      uint64_t v22 = sub_21DE3DA60();
      sub_21DE2B8E4();
      swift_allocError();
      uint64_t v24 = v23;
      unint64_t v25 = 0xD000000000000032;
      id v26 = "failed to convert to UsoEntity_common_EmailAddress";
    }
    else
    {
      if (qword_26AD32AE8 != -1) {
        swift_once();
      }
      if (qword_26AD32C78 == v9 && unk_26AD32C80 == v11)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v38 = sub_21DE3E180();
        swift_bridgeObjectRelease();
        if ((v38 & 1) == 0)
        {
          uint64_t v22 = sub_21DE3DA60();
          sub_21DE2B8E4();
          swift_allocError();
          uint64_t v24 = v23;
          unint64_t v25 = 0xD000000000000023;
          id v26 = "transformer called for invalid type";
          goto LABEL_55;
        }
      }
      sub_21DE3D720();
      sub_21DE3D560();
      if (v45)
      {
        sub_21DE3D950();
        swift_allocObject();
        sub_21DE3D940();
        sub_21DE3D700();
        if (v39)
        {
          sub_21DE3D920();
          swift_bridgeObjectRelease();
        }
        sub_21DE3D710();
        if (v40)
        {
          sub_21DE3D930();
          swift_bridgeObjectRelease();
        }
        goto LABEL_13;
      }
      uint64_t v22 = sub_21DE3DA60();
      sub_21DE2B8E4();
      swift_allocError();
      uint64_t v24 = v23;
      unint64_t v25 = 0xD000000000000033;
      id v26 = "failed to convert to UsoEntity_common_PostalAddress";
    }
LABEL_55:
    *uint64_t v23 = v25;
    v23[1] = (unint64_t)(v26 - 32) | 0x8000000000000000;
    (*(void (**)(unint64_t *, void, uint64_t))(*(void *)(v22 - 8) + 104))(v24, *MEMORY[0x263F75868], v22);
    swift_willThrow();
    return swift_release();
  }
  swift_bridgeObjectRelease();
  sub_21DE3D5B0();
  sub_21DE3D560();
  if (!v45)
  {
    uint64_t v22 = sub_21DE3DA60();
    sub_21DE2B8E4();
    swift_allocError();
    uint64_t v24 = v23;
    unint64_t v25 = 0xD000000000000031;
    id v26 = "failed to convert to UsoEntity_common_PhoneNumber";
    goto LABEL_55;
  }
  sub_21DE3D830();
  swift_allocObject();
  sub_21DE3D820();
  sub_21DE3D590();
  if (v13)
  {
    sub_21DE3D800();
    swift_bridgeObjectRelease();
  }
  sub_21DE3D5A0();
  if (v14)
  {
    sub_21DE3D810();
    swift_bridgeObjectRelease();
  }
LABEL_13:
  swift_retain();
  sub_21DE3D670();
  swift_release();
  swift_release_n();
  uint64_t v15 = sub_21DE3D9D0();
  uint64_t v16 = *(void *)(v15 + 16);
  if (v16)
  {
    v41[1] = v15;
    v41[2] = v1;
    uint64_t v17 = v8;
    uint64_t v18 = *(void (**)(char *, unint64_t, uint64_t))(v44 + 16);
    unint64_t v19 = v15 + ((*(unsigned __int8 *)(v44 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80));
    uint64_t v20 = *(void *)(v44 + 72);
    uint64_t v21 = (void (**)(char *, uint64_t))(v44 + 8);
    do
    {
      v18(v7, v19, v2);
      sub_21DE3D400();
      (*v21)(v7, v2);
      v19 += v20;
      --v16;
    }
    while (v16);
    swift_bridgeObjectRelease();
    uint64_t v8 = v17;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  os_log_type_t v30 = v43;
  sub_21DE3D4A0();
  sub_21DE3D400();
  if (MEMORY[0x223C18C90](v8))
  {
    sub_21DE3D4F0();
    sub_21DE3D560();
    uint64_t v31 = v45;
    if (v45)
    {
      (*(void (**)(char *, uint64_t))(v44 + 8))(v30, v2);
      swift_release();
      uint64_t result = swift_release();
      *uint64_t v42 = v31;
      return result;
    }
    uint64_t v35 = sub_21DE3DA60();
    sub_21DE2B8E4();
    swift_allocError();
    *uint64_t v36 = 0xD00000000000002ALL;
    v36[1] = 0x800000021DE40030;
    (*(void (**)(void *, void, uint64_t))(*(void *)(v35 - 8) + 104))(v36, *MEMORY[0x263F75868], v35);
    swift_willThrow();
    swift_release();
  }
  else
  {
    uint64_t v33 = sub_21DE3DA60();
    sub_21DE2B8E4();
    swift_allocError();
    *unint64_t v34 = 0xD00000000000002DLL;
    v34[1] = 0x800000021DE40000;
    (*(void (**)(void *, void, uint64_t))(*(void *)(v33 - 8) + 104))(v34, *MEMORY[0x263F75868], v33);
    swift_willThrow();
  }
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v30, v2);
}

unint64_t sub_21DE2B8E4()
{
  unint64_t result = qword_267D225A0;
  if (!qword_267D225A0)
  {
    sub_21DE3DA60();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D225A0);
  }
  return result;
}

uint64_t sub_21DE2B934()
{
  return 0x65747265766E6F63;
}

uint64_t sub_21DE2B950()
{
  sub_21DE3D830();
  OUTLINED_FUNCTION_2_4();
  uint64_t v1 = sub_21DE3D820();
  MEMORY[0x223C18C90]();
  uint64_t result = OUTLINED_FUNCTION_1_2();
  if (v0)
  {
    unint64_t v3 = v0;
    sub_21DE3D9E0();
    uint64_t result = OUTLINED_FUNCTION_0_3();
  }
  else
  {
    uint64_t v1 = 0x800000021DE3F890;
    unint64_t v3 = 0xD000000000000012;
  }
  qword_26AD32C58 = v3;
  unk_26AD32C60 = v1;
  return result;
}

uint64_t sub_21DE2B9CC()
{
  sub_21DE3D870();
  OUTLINED_FUNCTION_2_4();
  uint64_t v1 = sub_21DE3D860();
  MEMORY[0x223C18C90]();
  uint64_t result = OUTLINED_FUNCTION_1_2();
  if (v0)
  {
    unint64_t v3 = v0;
    sub_21DE3D9E0();
    uint64_t result = OUTLINED_FUNCTION_0_3();
  }
  else
  {
    uint64_t v1 = 0x800000021DE3F8B0;
    unint64_t v3 = 0xD000000000000013;
  }
  qword_26AD32C68 = v3;
  unk_26AD32C70 = v1;
  return result;
}

void sub_21DE2BA48()
{
  sub_21DE3D950();
  uint64_t v1 = OUTLINED_FUNCTION_2_4();
  uint64_t v2 = sub_21DE3D940();
  MEMORY[0x223C18C90]();
  OUTLINED_FUNCTION_1_2();
  if (v0)
  {
    uint64_t v1 = v0;
    sub_21DE3D9E0();
    OUTLINED_FUNCTION_0_3();
  }
  else
  {
    OUTLINED_FUNCTION_3_4();
  }
  qword_26AD32C78 = v1;
  unk_26AD32C80 = v2;
}

void sub_21DE2BAB8()
{
  sub_21DE3D6B0();
  uint64_t v1 = OUTLINED_FUNCTION_2_4();
  uint64_t v2 = sub_21DE3D6A0();
  MEMORY[0x223C18C90]();
  OUTLINED_FUNCTION_1_2();
  if (v0)
  {
    uint64_t v3 = v0;
    sub_21DE3D9E0();
    OUTLINED_FUNCTION_0_3();
  }
  else
  {
    uint64_t v2 = 0xED00006E6F737265;
    OUTLINED_FUNCTION_4_3();
    uint64_t v3 = v1 & 0xFFFFFFFFFFFFLL | 0x505F000000000000;
  }
  qword_26AD32C18 = v3;
  unk_26AD32C20 = v2;
}

uint64_t sub_21DE2BB34()
{
  sub_21DE3D7F0();
  OUTLINED_FUNCTION_2_4();
  uint64_t v1 = sub_21DE3D7E0();
  MEMORY[0x223C18C90]();
  uint64_t result = OUTLINED_FUNCTION_1_2();
  if (v0)
  {
    unint64_t v3 = v0;
    sub_21DE3D9E0();
    uint64_t result = OUTLINED_FUNCTION_0_3();
  }
  else
  {
    uint64_t v1 = 0x800000021DE3FB50;
    unint64_t v3 = 0xD000000000000011;
  }
  qword_26AD32C48 = v3;
  unk_26AD32C50 = v1;
  return result;
}

void sub_21DE2BBB0()
{
  sub_21DE3D8E0();
  uint64_t v1 = OUTLINED_FUNCTION_2_4();
  uint64_t v2 = sub_21DE3D8D0();
  MEMORY[0x223C18C90]();
  OUTLINED_FUNCTION_1_2();
  if (v0)
  {
    uint64_t v1 = v0;
    sub_21DE3D9E0();
    OUTLINED_FUNCTION_0_3();
  }
  else
  {
    OUTLINED_FUNCTION_3_4();
  }
  qword_267D22690 = v1;
  *(void *)algn_267D22698 = v2;
}

void sub_21DE2BC20()
{
  sub_21DE3D8A0();
  uint64_t v1 = OUTLINED_FUNCTION_2_4();
  uint64_t v2 = sub_21DE3D890();
  MEMORY[0x223C18C90]();
  OUTLINED_FUNCTION_1_2();
  if (v0)
  {
    uint64_t v1 = v0;
    sub_21DE3D9E0();
    OUTLINED_FUNCTION_0_3();
  }
  else
  {
    OUTLINED_FUNCTION_3_4();
  }
  qword_26AD32C38 = v1;
  unk_26AD32C40 = v2;
}

void sub_21DE2BC90()
{
  sub_21DE3D580();
  uint64_t v1 = OUTLINED_FUNCTION_2_4();
  uint64_t v2 = sub_21DE3D570();
  MEMORY[0x223C18C90]();
  OUTLINED_FUNCTION_1_2();
  if (v0)
  {
    uint64_t v3 = v0;
    sub_21DE3D9E0();
    OUTLINED_FUNCTION_0_3();
  }
  else
  {
    uint64_t v2 = 0xEA00000000007070;
    OUTLINED_FUNCTION_4_3();
    uint64_t v3 = v1 & 0xFFFFFFFFFFFFLL | 0x415F000000000000;
  }
  qword_26AD32C28 = v3;
  unk_26AD32C30 = v2;
}

void sub_21DE2BD04()
{
  sub_21DE3D6D0();
  uint64_t v1 = OUTLINED_FUNCTION_2_4();
  uint64_t v2 = sub_21DE3D6C0();
  MEMORY[0x223C18C90]();
  OUTLINED_FUNCTION_1_2();
  if (v0)
  {
    uint64_t v3 = v0;
    sub_21DE3D9E0();
    OUTLINED_FUNCTION_0_3();
  }
  else
  {
    uint64_t v2 = 0xED0000776F646E69;
    OUTLINED_FUNCTION_4_3();
    uint64_t v3 = v1 & 0xFFFFFFFFFFFFLL | 0x575F000000000000;
  }
  qword_26AD32C08 = v3;
  unk_26AD32C10 = v2;
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return swift_allocObject();
}

uint64_t sub_21DE2BDF0(unint64_t a1)
{
  uint64_t v11 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = sub_21DE3E100())
  {
    uint64_t v3 = 4;
    while (1)
    {
      id v4 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x223C19800](v3 - 4, a1) : *(id *)(a1 + 8 * v3);
      os_log_type_t v5 = v4;
      uint64_t v6 = v3 - 3;
      if (__OFADD__(v3 - 4, 1)) {
        break;
      }
      static RREntityMatcher.entity(_:matches:entityFoundByMarrsIdentifier:)();
      uint64_t v8 = v7;

      if (v8)
      {
        MEMORY[0x223C19640]();
        if (*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_21DE3DF00();
        }
        sub_21DE3DF30();
        sub_21DE3DEF0();
      }
      ++v3;
      if (v6 == v2)
      {
        swift_bridgeObjectRelease();
        uint64_t v9 = v11;
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_15:
    OUTLINED_FUNCTION_6_3();
  }
  swift_bridgeObjectRelease();
  uint64_t v9 = MEMORY[0x263F8EE78];
LABEL_17:
  swift_release();
  return v9;
}

uint64_t sub_21DE2BF68()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_21DE2BFE0(v0);
}

uint64_t sub_21DE2BF94()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_21DE2BFE0(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC21SiriReferenceResolver10RRResolver_entities);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_21DE2C034())()
{
  return j__swift_endAccess;
}

uint64_t RRResolver.__allocating_init(entities:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  RRResolver.init(entities:)(a1);
  return v2;
}

uint64_t RRResolver.init(entities:)(uint64_t a1)
{
  type metadata accessor for RRResolver();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32A28);
  sub_21DE3DD90();
  sub_21DE3DAB0();
  *(void *)(v1 + OBJC_IVAR____TtC21SiriReferenceResolver10RRResolver_entities) = a1;
  return v1;
}

uint64_t type metadata accessor for RRResolver()
{
  uint64_t result = qword_26AD32588;
  if (!qword_26AD32588) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_21DE2C1B4(uint64_t a1, unint64_t a2, os_log_type_t a3)
{
  os_log_type_t v5 = v4;
  uint64_t v6 = v3;
  uint64_t v10 = (uint64_t)v3 + OBJC_IVAR____TtC21SiriReferenceResolver10RRResolver_logger;
  swift_retain_n();
  uint64_t v11 = sub_21DE3DAA0();
  os_log_type_t v12 = sub_21DE3DF60();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v37 = (uint8_t *)v10;
    uint64_t v14 = swift_slowAlloc();
    v40[0] = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    sub_21DE3D9F0();
    swift_retain();
    uint64_t v15 = sub_21DE3DD90();
    sub_21DE2A150(v15, v16, v40);
    OUTLINED_FUNCTION_11_2();
    sub_21DE3DFC0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21DE16000, v11, v12, "Find annotated entities with EntityUSO. %s", v13, 0xCu);
    swift_arrayDestroy();
    uint64_t v17 = v14;
    uint64_t v10 = (uint64_t)v37;
    MEMORY[0x223C19EE0](v17, -1, -1);
    uint64_t v18 = v13;
    os_log_type_t v5 = v4;
    MEMORY[0x223C19EE0](v18, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  unint64_t v19 = v6;
  if (!sub_21DE38F44())
  {
    swift_retain();
    unint64_t v19 = sub_21DE3DAA0();
    a3 = sub_21DE3DF60();
    if (!os_log_type_enabled(v19, a3))
    {
      swift_release();
      goto LABEL_41;
    }
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 134217984;
    OUTLINED_FUNCTION_12_2();
    if (!((unint64_t)*v5 >> 62))
    {
LABEL_24:
      sub_21DE3DFC0();
      swift_release();
      _os_log_impl(&dword_21DE16000, v19, a3, "total entity count in pool: %ld", (uint8_t *)v10, 0xCu);
      MEMORY[0x223C19EE0](v10, -1, -1);
LABEL_41:

      return sub_21DE393F4((uint8_t *)a1);
    }
LABEL_53:
    swift_bridgeObjectRetain();
    sub_21DE3E100();
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
  if (a3)
  {
    OUTLINED_FUNCTION_12_2();
    uint64_t v10 = *v5;
    unint64_t v39 = MEMORY[0x263F8EE78];
    if ((unint64_t)*v5 >> 62)
    {
      OUTLINED_FUNCTION_6_3();
      uint64_t v26 = sub_21DE3E100();
      if (v26) {
        goto LABEL_27;
      }
    }
    else
    {
      uint64_t v26 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v26)
      {
LABEL_27:
        if (v26 < 1)
        {
LABEL_52:
          __break(1u);
          goto LABEL_53;
        }
        uint64_t v27 = 0;
        while (1)
        {
          if ((v10 & 0xC000000000000001) != 0) {
            id v28 = (id)MEMORY[0x223C19800](v27, v10);
          }
          else {
            id v28 = *(id *)(v10 + 8 * v27 + 32);
          }
          uint64_t v29 = v28;
          sub_21DE3DB80();
          uint64_t v30 = sub_21DE3D9E0();
          uint64_t v32 = v31;
          swift_release();
          if (v30 == 0xD000000000000010 && v32 == 0x800000021DE3F580)
          {
            swift_bridgeObjectRelease();
          }
          else
          {
            char v33 = sub_21DE3E180();
            swift_bridgeObjectRelease();
            if ((v33 & 1) == 0)
            {

              goto LABEL_38;
            }
          }
          sub_21DE3E0A0();
          sub_21DE3E0C0();
          sub_21DE3E0D0();
          sub_21DE3E0B0();
LABEL_38:
          if (v26 == ++v27)
          {
            swift_bridgeObjectRelease();
            unint64_t v34 = v39;
            goto LABEL_45;
          }
        }
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v34 = MEMORY[0x263F8EE78];
LABEL_45:
    swift_retain();
    uint64_t v35 = sub_21DE2BDF0(v34);
    goto LABEL_49;
  }
  if (a2 >> 62)
  {
    sub_21DE2F86C((id)a2, 0);
    unint64_t v19 = sub_21DE2E730(a2);
  }
  else
  {
    unint64_t v19 = (a2 & 0xFFFFFFFFFFFFFF8);
    sub_21DE2F86C((id)a2, 0);
    swift_bridgeObjectRetain();
  }
  v40[0] = (uint64_t)v19;
  sub_21DE2DF64(v40);
  if (!v5)
  {
    uint64_t v20 = v40[0];
    v40[0] = MEMORY[0x263F8EE78];
    if (v20 < 0 || (v20 & 0x4000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      a1 = sub_21DE3E100();
      swift_release();
      if (a1) {
        goto LABEL_12;
      }
    }
    else
    {
      a1 = *(void *)(v20 + 16);
      if (a1)
      {
LABEL_12:
        unint64_t v38 = a2;
        if (a1 >= 1)
        {
          uint64_t v21 = 0;
          do
          {
            if ((v20 & 0xC000000000000001) != 0) {
              id v22 = (id)MEMORY[0x223C19800](v21, v20);
            }
            else {
              id v22 = *(id *)(v20 + 8 * v21 + 32);
            }
            uint64_t v23 = v22;
            sub_21DE3DC30();
            if (v24 >= 0.0025)
            {
              sub_21DE3E0A0();
              sub_21DE3E0C0();
              sub_21DE3E0D0();
              sub_21DE3E0B0();
            }
            else
            {
            }
            ++v21;
          }
          while (a1 != v21);
          swift_release();
          unint64_t v25 = v40[0];
          a2 = v38;
          goto LABEL_48;
        }
        __break(1u);
        goto LABEL_52;
      }
    }
    swift_release();
    unint64_t v25 = MEMORY[0x263F8EE78];
LABEL_48:
    swift_retain();
    uint64_t v35 = sub_21DE2BDF0(v25);
    sub_21DE2FD94((void *)a2, a3);
LABEL_49:
    swift_release();
    swift_release();
    return v35;
  }
  unint64_t result = swift_release();
  __break(1u);
  return result;
}

void *sub_21DE2C7F0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32B68);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v36 = (uint64_t)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v35 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32A20);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = sub_21DE32AF4(a1);
  unint64_t v13 = v12;
  if (v12 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_21DE3E100();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v14 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!v14) {
    goto LABEL_6;
  }
  sub_21DE3D3D0();
  sub_21DE3D560();
  unint64_t v15 = v37;
  swift_release();
  if (!v15) {
    goto LABEL_6;
  }
  swift_bridgeObjectRetain();
  unint64_t v16 = sub_21DE2C1B4(a1, v13, OS_LOG_TYPE_DEFAULT);
  swift_bridgeObjectRelease();
  if (v16 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v34 = sub_21DE3E100();
    swift_bridgeObjectRelease();
    if (v34) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
  if (!*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_23:
    swift_bridgeObjectRelease();
LABEL_6:
    unint64_t v16 = v13;
    goto LABEL_10;
  }
LABEL_9:
  swift_bridgeObjectRelease();
LABEL_10:
  swift_retain();
  uint64_t v17 = swift_retain();
  unint64_t v18 = sub_21DE2C1B4(v17, 0, (os_log_type_t)0xFFu);
  swift_release();
  swift_release();
  if (sub_21DE2CFC4(a1))
  {
    sub_21DE3D630();
    uint64_t v19 = sub_21DE3B030((uint64_t)v11);
    char v21 = v20;
    sub_21DE2FE64((uint64_t)v11, &qword_26AD32A20);
    if (v21)
    {
      swift_release();
      char v23 = 0;
    }
    else
    {
      uint64_t v22 = sub_21DE3DCA0();
      char v23 = 1;
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 1, 1, v22);
      uint64_t v24 = v36;
      sub_21DE2FDFC((uint64_t)v8, v36);
      swift_retain();
      sub_21DE2F86C((id)v18, 0);
      sub_21DE2FE64((uint64_t)v8, &qword_26AD32B68);
      uint64_t v25 = sub_21DE3B5E4(v18, v24, v2, v19);
      sub_21DE2FE64(v24, &qword_26AD32B68);
      swift_release();
      swift_release();
      sub_21DE2F878((id)v18, 0);
      sub_21DE2F878((id)v18, 0);
      unint64_t v18 = v25;
    }
  }
  else
  {
    char v23 = 0;
  }
  uint64_t v26 = sub_21DE3DAA0();
  os_log_type_t v27 = sub_21DE3DF50();
  if (os_log_type_enabled(v26, v27))
  {
    id v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v28 = 0;
    _os_log_impl(&dword_21DE16000, v26, v27, "Sorting resolved candidates with saliency score", v28, 2u);
    OUTLINED_FUNCTION_1_0();
  }

  if (v18 >> 62)
  {
    unint64_t v33 = swift_bridgeObjectRetain();
    unint64_t v29 = (unint64_t)sub_21DE2E730(v33);
  }
  else
  {
    unint64_t v29 = v18 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain_n();
  }
  unint64_t v37 = v29;
  sub_21DE2DF64((uint64_t *)&v37);
  sub_21DE2F878((id)v18, 0);
  uint64_t v30 = (void *)v37;
  uint64_t v31 = sub_21DE2CDEC(v16, v37, 0, v23);
  sub_21DE2F878(v30, 0);
  swift_bridgeObjectRelease();
  sub_21DE2F878((id)v18, 0);
  return v31;
}

void *sub_21DE2CDEC(unint64_t a1, unint64_t a2, char a3, char a4)
{
  if (a1 >> 62)
  {
    OUTLINED_FUNCTION_6_3();
    uint64_t v10 = sub_21DE3E100();
    swift_bridgeObjectRelease();
    if (v10)
    {
LABEL_3:
      swift_bridgeObjectRetain();
      char v8 = 0;
      uint64_t v9 = (void *)a1;
      if ((a4 & 1) == 0) {
        return v9;
      }
      goto LABEL_7;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  char v8 = a3 & 1;
  sub_21DE2F86C((id)a2, a3 & 1);
  uint64_t v9 = (void *)a2;
  if ((a4 & 1) == 0) {
    return v9;
  }
LABEL_7:
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D224E0);
    swift_willThrowTypedImpl();
    return v9;
  }
  if (!(a2 >> 62))
  {
    uint64_t v11 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v11) {
      goto LABEL_11;
    }
LABEL_16:
    sub_21DE2F878((id)a2, 0);
    return v9;
  }
  swift_bridgeObjectRetain();
  if (!sub_21DE3E100()) {
    goto LABEL_16;
  }
LABEL_11:
  unsigned __int8 v12 = sub_21DE2DFE0(a2, a1);
  sub_21DE2F878((id)a2, 0);
  if (v12) {
    return v9;
  }
  unint64_t v13 = sub_21DE3DAA0();
  os_log_type_t v14 = sub_21DE3DF50();
  if (os_log_type_enabled(v13, v14))
  {
    unint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v15 = 0;
    _os_log_impl(&dword_21DE16000, v13, v14, "Resolver ordinal match results are diffrent from Marrs results. Returning ordinal match results", v15, 2u);
    OUTLINED_FUNCTION_1_0();
  }
  sub_21DE2F878(v9, v8);

  swift_bridgeObjectRetain();
  return (void *)a2;
}

uint64_t sub_21DE2CFC4(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32BC0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21DE3ED20;
  *(void *)(inited + 32) = a1;
  unint64_t v32 = inited;
  sub_21DE3DEF0();
  uint64_t v3 = v32;
  if (v32 >> 62) {
    goto LABEL_87;
  }
  uint64_t v4 = *(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_retain();
  if (!v4) {
    goto LABEL_91;
  }
  while (1)
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
LABEL_4:
    unint64_t v6 = (unint64_t)v3 >> 62;
    if ((unint64_t)v3 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_21DE3E100();
      uint64_t result = OUTLINED_FUNCTION_28();
      if (!v4)
      {
        __break(1u);
        return result;
      }
      swift_bridgeObjectRetain();
      uint64_t v10 = sub_21DE3E100();
      swift_bridgeObjectRelease();
      if (!v10) {
        goto LABEL_83;
      }
    }
    else if (!*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_82:
      __break(1u);
LABEL_83:
      __break(1u);
LABEL_84:
      __break(1u);
LABEL_85:
      __break(1u);
      goto LABEL_86;
    }
    if ((v3 & 0xC000000000000001) != 0)
    {
      int64_t v7 = MEMORY[0x223C19800](0, v3);
      if (!v6) {
        goto LABEL_9;
      }
    }
    else
    {
      if (!*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_84;
      }
      int64_t v7 = *(void *)(v3 + 32);
      swift_retain();
      if (!v6)
      {
LABEL_9:
        uint64_t v8 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
        goto LABEL_18;
      }
    }
    uint64_t v8 = v3 < 0 ? v3 : v3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    sub_21DE3E100();
    OUTLINED_FUNCTION_28();
LABEL_18:
    if (!v8) {
      goto LABEL_85;
    }
    sub_21DE2FAF4(0, 1);
    uint64_t v4 = sub_21DE3D9C0();
    uint64_t v3 = sub_21DE28204(0x507473694C6F7375, 0xEF6E6F697469736FLL, v4);
    swift_bridgeObjectRelease();
    if (!v3) {
      goto LABEL_33;
    }
    if ((unint64_t)v3 >> 62)
    {
      if (v3 >= 0) {
        uint64_t v4 = v3 & 0xFFFFFFFFFFFFFF8;
      }
      else {
        uint64_t v4 = v3;
      }
      swift_bridgeObjectRetain();
      sub_21DE3E100();
      OUTLINED_FUNCTION_28();
      if (!v4)
      {
LABEL_32:
        swift_bridgeObjectRelease();
        goto LABEL_33;
      }
    }
    else
    {
      uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v4) {
        goto LABEL_32;
      }
    }
    if ((v3 & 0xC000000000000001) != 0) {
      break;
    }
    if (*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      uint64_t v4 = *(void *)(v3 + 32);
      swift_retain();
      goto LABEL_25;
    }
LABEL_86:
    __break(1u);
LABEL_87:
    if (v3 < 0) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = v3 & 0xFFFFFFFFFFFFFF8;
    }
    swift_retain();
    swift_bridgeObjectRetain();
    sub_21DE3E100();
    OUTLINED_FUNCTION_28();
    if (!v4) {
      goto LABEL_91;
    }
  }
  uint64_t v4 = MEMORY[0x223C19800](0, v3);
LABEL_25:
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_21DE3D990();
  swift_release();
  if (v11)
  {
    uint64_t v4 = sub_21DE3D650();
    swift_retain();
    sub_21DE3D560();
    swift_release_n();
    uint64_t v3 = v31;
    if (v31)
    {
LABEL_80:
      swift_release();
      swift_bridgeObjectRelease();
      return v3;
    }
  }
LABEL_33:
  uint64_t v3 = v7;
  uint64_t v12 = sub_21DE3D9C0();
  int64_t v13 = 0;
  uint64_t v14 = *(void *)(v12 + 64);
  uint64_t v28 = v12 + 64;
  uint64_t v15 = 1 << *(unsigned char *)(v12 + 32);
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & v14;
  int64_t v29 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v30 = v12;
  if ((v16 & v14) != 0)
  {
LABEL_37:
    unint64_t v18 = __clz(__rbit64(v17));
    v17 &= v17 - 1;
    unint64_t v19 = v18 | (v13 << 6);
    goto LABEL_52;
  }
  while (2)
  {
    int64_t v20 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      goto LABEL_79;
    }
    if (v20 >= v29) {
      goto LABEL_72;
    }
    unint64_t v21 = *(void *)(v28 + 8 * v20);
    ++v13;
    if (v21) {
      goto LABEL_51;
    }
    int64_t v13 = v20 + 1;
    if (v20 + 1 >= v29) {
      goto LABEL_72;
    }
    unint64_t v21 = *(void *)(v28 + 8 * v13);
    if (v21) {
      goto LABEL_51;
    }
    int64_t v13 = v20 + 2;
    if (v20 + 2 >= v29) {
      goto LABEL_72;
    }
    unint64_t v21 = *(void *)(v28 + 8 * v13);
    if (v21)
    {
LABEL_51:
      unint64_t v17 = (v21 - 1) & v21;
      unint64_t v19 = __clz(__rbit64(v21)) + (v13 << 6);
LABEL_52:
      uint64_t v23 = *(void *)(*(void *)(v30 + 56) + 8 * v19);
      uint64_t v31 = v5;
      if ((unint64_t)v23 >> 62)
      {
        if (v23 < 0) {
          uint64_t v3 = *(void *)(*(void *)(v30 + 56) + 8 * v19);
        }
        else {
          uint64_t v3 = v23 & 0xFFFFFFFFFFFFFF8;
        }
        swift_bridgeObjectRetain_n();
        int64_t v7 = sub_21DE3E100();
        if (v7) {
          goto LABEL_54;
        }
      }
      else
      {
        OUTLINED_FUNCTION_13_1();
        swift_bridgeObjectRetain_n();
        if (v7)
        {
LABEL_54:
          if (v7 < 1)
          {
            __break(1u);
LABEL_79:
            __break(1u);
            goto LABEL_80;
          }
          uint64_t v4 = v5;
          for (uint64_t i = 0; i != v7; ++i)
          {
            if ((v23 & 0xC000000000000001) != 0) {
              MEMORY[0x223C19800](i, v23);
            }
            else {
              swift_retain();
            }
            uint64_t v25 = sub_21DE3D990();
            uint64_t v26 = swift_release();
            if (v25)
            {
              MEMORY[0x223C19640](v26);
              if (*(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                sub_21DE3DF00();
              }
              sub_21DE3DF30();
              sub_21DE3DEF0();
            }
          }
          swift_bridgeObjectRelease();
          int64_t v7 = v31;
          uint64_t v5 = v4;
          goto LABEL_70;
        }
      }
      swift_bridgeObjectRelease();
      int64_t v7 = v5;
LABEL_70:
      swift_bridgeObjectRelease();
      uint64_t v3 = (uint64_t)&v32;
      sub_21DE2D570(v7);
      if (v17) {
        goto LABEL_37;
      }
      continue;
    }
    break;
  }
  int64_t v22 = v20 + 3;
  if (v22 < v29)
  {
    unint64_t v21 = *(void *)(v28 + 8 * v22);
    if (!v21)
    {
      while (1)
      {
        int64_t v13 = v22 + 1;
        if (__OFADD__(v22, 1)) {
          break;
        }
        if (v13 >= v29) {
          goto LABEL_72;
        }
        unint64_t v21 = *(void *)(v28 + 8 * v13);
        ++v22;
        if (v21) {
          goto LABEL_51;
        }
      }
      __break(1u);
      goto LABEL_82;
    }
    int64_t v13 = v22;
    goto LABEL_51;
  }
LABEL_72:
  swift_release();
  swift_release();
  uint64_t v3 = v32;
  if (v32 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_21DE3E100();
    swift_bridgeObjectRelease();
    if (v27) {
      goto LABEL_4;
    }
  }
  else if (*(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_4;
  }
LABEL_91:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_21DE2D570(unint64_t a1)
{
  if (a1 >> 62)
  {
    OUTLINED_FUNCTION_18_1();
    uint64_t v4 = sub_21DE3E100();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v5 = *v1;
  if (*v1 >> 62)
  {
    OUTLINED_FUNCTION_5_3();
    uint64_t v2 = sub_21DE3E100();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_13_1();
  }
  uint64_t v6 = v2 + v4;
  if (__OFADD__(v2, v4))
  {
    __break(1u);
    goto LABEL_26;
  }
  unint64_t v5 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v1 = v5;
  uint64_t v2 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v5 & 0x8000000000000000) == 0 && (v5 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_16;
    }
    uint64_t v2 = 1;
  }
  if (v5 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v5 = MEMORY[0x223C19810](v2, v9, 1, v5);
    swift_bridgeObjectRelease();
    unint64_t *v1 = v5;
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
    uint64_t result = sub_21DE2F4E8(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v4) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_21DE3E100();
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

  return sub_21DE3DEF0();
}

void sub_21DE2D714()
{
  swift_retain_n();
  uint64_t v0 = sub_21DE3DAA0();
  os_log_type_t v1 = sub_21DE3DF50();
  if (os_log_type_enabled(v0, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = OUTLINED_FUNCTION_10_0();
    *(_DWORD *)uint64_t v2 = 136315138;
    sub_21DE3DB40();
    sub_21DE2F884();
    uint64_t v3 = sub_21DE3E150();
    sub_21DE2A150(v3, v4, &v33);
    sub_21DE3DFC0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21DE16000, v0, v1, "Resolver call with ResolveQuery: %s", v2, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_1_0();
  }
  else
  {
    swift_release_n();
  }

  uint64_t v5 = sub_21DE3DB20();
  uint64_t v6 = sub_21DE2C7F0(v5);
  char v8 = v7;
  swift_release();
  if (v8) {
    return;
  }
  sub_21DE2F86C(v6, 0);
  sub_21DE2F86C(v6, 0);
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_21DE3DAA0();
  os_log_type_t v10 = sub_21DE3DF60();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = OUTLINED_FUNCTION_10_0();
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v12 = sub_21DE3DC80();
    uint64_t v13 = swift_bridgeObjectRetain();
    uint64_t v14 = MEMORY[0x223C19670](v13, v12);
    unint64_t v16 = v15;
    OUTLINED_FUNCTION_7_3();
    sub_21DE2A150(v14, v16, &v33);
    OUTLINED_FUNCTION_11_2();
    sub_21DE3DFC0();
    swift_bridgeObjectRelease();
    sub_21DE2F878(v6, 0);
    OUTLINED_FUNCTION_7_3();
    _os_log_impl(&dword_21DE16000, v9, v10, "Resolved candicates BEFORE post-processing and thresholding: %s", v11, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_1_0();
  }
  else
  {

    sub_21DE2F878(v6, 0);
    OUTLINED_FUNCTION_7_3();
  }
  sub_21DE25FF4((unint64_t)v6);
  unint64_t v18 = v17;
  OUTLINED_FUNCTION_7_3();
  uint64_t v33 = MEMORY[0x263F8EE78];
  if (v18 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_21DE3E100();
    swift_bridgeObjectRelease();
    if (v19) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v19 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v19)
    {
LABEL_10:
      if (v19 < 1)
      {
        __break(1u);
        return;
      }
      for (uint64_t i = 0; i != v19; ++i)
      {
        if ((v18 & 0xC000000000000001) != 0) {
          id v21 = (id)MEMORY[0x223C19800](i, v18);
        }
        else {
          id v21 = *(id *)(v18 + 8 * i + 32);
        }
        int64_t v22 = v21;
        sub_21DE3DC30();
        if (v23 >= 0.0025)
        {
          sub_21DE3E0A0();
          sub_21DE3E0C0();
          sub_21DE3E0D0();
          sub_21DE3E0B0();
        }
        else
        {
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  swift_retain_n();
  uint64_t v24 = sub_21DE3DAA0();
  os_log_type_t v25 = sub_21DE3DF60();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = swift_slowAlloc();
    uint64_t v27 = OUTLINED_FUNCTION_10_0();
    *(_DWORD *)uint64_t v26 = 134218242;
    uint64_t v33 = v27;
    sub_21DE3DFC0();
    *(_WORD *)(v26 + 12) = 2080;
    uint64_t v28 = sub_21DE3DC80();
    uint64_t v29 = swift_retain();
    uint64_t v30 = MEMORY[0x223C19670](v29, v28);
    unint64_t v32 = v31;
    swift_release();
    sub_21DE2A150(v30, v32, &v33);
    sub_21DE3DFC0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21DE16000, v24, v25, "Resolved candicates AFTER post-processing and thresholding (>=%f): %s", (uint8_t *)v26, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_7_3();
  }
  else
  {
    OUTLINED_FUNCTION_7_3();
    swift_release_n();
  }
}

uint64_t sub_21DE2DCA4(uint64_t a1)
{
  uint64_t v2 = sub_21DE3DCC0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  if ((*(unsigned int (**)(char *, uint64_t))(v3 + 88))(v5, v2) == *MEMORY[0x263F74278])
  {
    (*(void (**)(char *, uint64_t))(v3 + 96))(v5, v2);
    sub_21DE3DB40();
    swift_allocObject();
    swift_retain();
    sub_21DE3DB10();
    sub_21DE2D714();
    uint64_t v7 = v6;
    swift_release();
    swift_release();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    sub_21DE2F8D4();
    uint64_t v7 = swift_allocError();
    *char v8 = 0;
  }
  return v7;
}

uint64_t RRResolver.deinit()
{
  sub_21DE3DAC0();
  OUTLINED_FUNCTION_4_4();
  uint64_t v1 = OUTLINED_FUNCTION_10_3();
  v2(v1);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t RRResolver.__deallocating_deinit()
{
  sub_21DE3DAC0();
  OUTLINED_FUNCTION_4_4();
  uint64_t v1 = OUTLINED_FUNCTION_10_3();
  v2(v1);
  swift_bridgeObjectRelease();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_21DE2DF64(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    sub_21DE2FAE0();
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_21DE2E820(v6);
  return sub_21DE3E0B0();
}

id sub_21DE2DFE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)((unint64_t)a1 >> 62);
  if ((unint64_t)a1 >> 62)
  {
LABEL_40:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_21DE3E100();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if ((unint64_t)a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_21DE3E100();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v5 != v6) {
    goto LABEL_25;
  }
  if (!v5) {
    goto LABEL_24;
  }
  uint64_t v7 = a1 & 0xFFFFFFFFFFFFFF8;
  if (a1 < 0) {
    uint64_t v7 = a1;
  }
  if (!v4) {
    uint64_t v7 = (a1 & 0xFFFFFFFFFFFFFF8) + 32;
  }
  uint64_t v8 = a2 & 0xFFFFFFFFFFFFFF8;
  uint64_t v9 = (a2 & 0xFFFFFFFFFFFFFF8) + 32;
  if (a2 < 0) {
    uint64_t v8 = a2;
  }
  if ((unint64_t)a2 >> 62) {
    uint64_t v9 = v8;
  }
  if (v7 == v9)
  {
LABEL_24:
    char v14 = 1;
    return (id)(v14 & 1);
  }
  if (v5 < 0) {
    goto LABEL_43;
  }
  unint64_t v20 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0) {
LABEL_44:
  }
    id result = (id)MEMORY[0x223C19800](0, a1);
  else {
    id result = *(id *)(a1 + 32);
  }
  uint64_t v4 = result;
  if ((a2 & 0xC000000000000001) != 0)
  {
    id v11 = (id)MEMORY[0x223C19800](0, a2);
LABEL_22:
    uint64_t v12 = v11;
    sub_21DE3DC80();
    char v13 = sub_21DE3DFA0();

    if (v13)
    {
      if (v5 != 1)
      {
        uint64_t v15 = 5;
        while (1)
        {
          if (v15 - 4 >= v5)
          {
            __break(1u);
            goto LABEL_40;
          }
          if (v20) {
            id v16 = (id)MEMORY[0x223C19800](v15 - 4, a1);
          }
          else {
            id v16 = *(id *)(a1 + 8 * v15);
          }
          uint64_t v4 = v16;
          if ((a2 & 0xC000000000000001) != 0)
          {
            id v17 = (id)MEMORY[0x223C19800](v15 - 4, a2);
          }
          else
          {
            if ((unint64_t)(v15 - 4) >= *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
LABEL_43:
              __break(1u);
              goto LABEL_44;
            }
            id v17 = *(id *)(a2 + 8 * v15);
          }
          unint64_t v18 = v17;
          char v14 = sub_21DE3DFA0();

          if (v14)
          {
            uint64_t v19 = 2 - v5 + v15++;
            if (v19 != 5) {
              continue;
            }
          }
          return (id)(v14 & 1);
        }
      }
      goto LABEL_24;
    }
LABEL_25:
    char v14 = 0;
    return (id)(v14 & 1);
  }
  if (*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v11 = *(id *)(a2 + 32);
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

unint64_t sub_21DE2E230(unint64_t result, char a2, uint64_t a3)
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

uint64_t sub_21DE2E254(uint64_t a1)
{
  if (a1 < 0)
  {
    OUTLINED_FUNCTION_16_0();
    uint64_t result = sub_21DE3E0F0();
    __break(1u);
  }
  else if (a1)
  {
    sub_21DE3DC80();
    uint64_t result = sub_21DE3DF20();
    *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10) = a1;
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

char *sub_21DE2E2F0(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_16_0();
    uint64_t result = (char *)OUTLINED_FUNCTION_2_5();
    __break(1u);
  }
  else if (a3 != result || &result[40 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_1_3(a3, result);
  }
  return result;
}

char *sub_21DE2E354(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_16_0();
    uint64_t result = (char *)OUTLINED_FUNCTION_2_5();
    __break(1u);
  }
  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_1_3(a3, result);
  }
  return result;
}

void sub_21DE2E3B4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_16_0();
    OUTLINED_FUNCTION_2_5();
    __break(1u);
_swift_arrayInitWithTakeBackToFront:
    MEMORY[0x270FA01D0]();
    return;
  }
  if (a3 < a1 || (sub_21DE3D4D0(), OUTLINED_FUNCTION_4_4(), a1 + *(void *)(v6 + 72) * a2 <= a3))
  {
    sub_21DE3D4D0();
    OUTLINED_FUNCTION_9_3();
    MEMORY[0x270FA01D8]();
  }
  else if (a3 != a1)
  {
    OUTLINED_FUNCTION_9_3();
    goto _swift_arrayInitWithTakeBackToFront;
  }
}

char *sub_21DE2E4B4(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_16_0();
    uint64_t result = (char *)OUTLINED_FUNCTION_2_5();
    __break(1u);
  }
  else if (a3 != result || &result[8 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_1_3(a3, result);
  }
  return result;
}

uint64_t sub_21DE2E510(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0
    || ((sub_21DE3D4D0(), OUTLINED_FUNCTION_4_4(), uint64_t v7 = *(void *)(v6 + 72) * a2, v8 = a3 + v7, v9 = a1 + v7, v8 > a1)
      ? (BOOL v10 = v9 > a3)
      : (BOOL v10 = 0),
        v10))
  {
    OUTLINED_FUNCTION_16_0();
    uint64_t result = sub_21DE3E110();
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_14_1();
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_21DE2E5FC(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void))
{
  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (BOOL v4 = a1 + 8 * a2 > a3) : (BOOL v4 = 0), v4))
  {
    OUTLINED_FUNCTION_16_0();
    uint64_t result = sub_21DE3E110();
    __break(1u);
  }
  else
  {
    a4(0);
    OUTLINED_FUNCTION_14_1();
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_21DE2E6D8()
{
  return sub_21DE3DFC0();
}

uint64_t sub_21DE2E700@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

void *sub_21DE2E730(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_8;
  }
  uint64_t v1 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  while (1)
  {
    if (v1 <= 0)
    {
      uint64_t v2 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32BC0);
      uint64_t v2 = (void *)swift_allocObject();
      size_t v3 = _swift_stdlib_malloc_size(v2);
      v2[2] = v1;
      v2[3] = (2 * ((uint64_t)(v3 - 32) / 8)) | 1;
    }
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_9_3();
    sub_21DE2F338(v4, v5, v6);
    uint64_t v8 = v7;
    swift_bridgeObjectRelease();
    if (v8 == v1) {
      break;
    }
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    uint64_t v1 = sub_21DE3E100();
    swift_bridgeObjectRelease();
    if (!v1) {
      return (void *)MEMORY[0x263F8EE78];
    }
  }
  return v2;
}

void sub_21DE2E820(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = a1[1];
  uint64_t v5 = sub_21DE3E140();
  if (v5 >= v4)
  {
    if ((v4 & 0x8000000000000000) == 0)
    {
      if (v4) {
        sub_21DE2EF0C(0, v4, 1, a1);
      }
      return;
    }
    goto LABEL_131;
  }
  uint64_t v6 = v5;
  uint64_t v7 = sub_21DE2E254(v4 / 2);
  v121 = v8;
  uint64_t v124 = v7;
  uint64_t v118 = v4;
  v116 = a1;
  if (v4 <= 0)
  {
LABEL_95:
    id v11 = (char *)MEMORY[0x263F8EE78];
    unint64_t v53 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_96:
    uint64_t v106 = v11;
    if (v53 < 2)
    {
LABEL_107:
      swift_bridgeObjectRelease();
      if (v4 >= -1) {
        goto LABEL_108;
      }
      goto LABEL_135;
    }
    uint64_t v107 = *v116;
    while (1)
    {
      unint64_t v108 = v53 - 2;
      if (v53 < 2) {
        break;
      }
      if (!v107) {
        goto LABEL_139;
      }
      uint64_t v4 = v53 - 1;
      uint64_t v109 = v106;
      uint64_t v110 = *(void *)&v106[16 * v108 + 32];
      uint64_t v111 = *(void *)&v106[16 * v53 + 24];
      sub_21DE2EFF0((char *)(v107 + 8 * v110), (char *)(v107 + 8 * *(void *)&v106[16 * v53 + 16]), v107 + 8 * v111, v121);
      if (v2) {
        goto LABEL_93;
      }
      if (v111 < v110) {
        goto LABEL_126;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v109 = sub_21DE2F304((uint64_t)v109);
      }
      if (v108 >= *((void *)v109 + 2)) {
        goto LABEL_127;
      }
      v112 = &v109[16 * v108 + 32];
      *(void *)v112 = v110;
      *((void *)v112 + 1) = v111;
      unint64_t v113 = *((void *)v109 + 2);
      if (v53 > v113) {
        goto LABEL_128;
      }
      memmove(&v109[16 * v4 + 32], &v109[16 * v53 + 32], 16 * (v113 - v53));
      uint64_t v106 = v109;
      *((void *)v109 + 2) = v113 - 1;
      unint64_t v53 = v113 - 1;
      uint64_t v4 = v118;
      if (v113 <= 2) {
        goto LABEL_107;
      }
    }
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
    return;
  }
  uint64_t v117 = v6;
  uint64_t v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v115 = *a1 - 8;
  id v11 = (char *)MEMORY[0x263F8EE78];
  while (1)
  {
    uint64_t v12 = v9++;
    uint64_t v119 = v12;
    if (v9 < v4)
    {
      char v13 = v11;
      uint64_t v14 = v2;
      uint64_t v15 = *(void **)(v10 + 8 * v12);
      id v16 = *(id *)(v10 + 8 * v9);
      id v17 = v15;
      sub_21DE3DC30();
      double v19 = v18;
      sub_21DE3DC30();
      double v21 = v20;

      uint64_t v12 = v119;
      uint64_t v9 = v119 + 2;
      if (v119 + 2 < v4)
      {
        uint64_t v22 = v119;
        while (1)
        {
          uint64_t v23 = v10 + 8 * v22;
          uint64_t v24 = *(void **)(v23 + 8);
          id v25 = *(id *)(v23 + 16);
          id v26 = v24;
          sub_21DE3DC30();
          double v28 = v27;
          sub_21DE3DC30();
          double v30 = v29;

          if (v21 < v19 == v30 >= v28) {
            break;
          }
          uint64_t v31 = v22 + 3;
          ++v22;
          if (v31 >= v4)
          {
            uint64_t v9 = v4;
            goto LABEL_11;
          }
        }
        uint64_t v9 = v22 + 2;
LABEL_11:
        uint64_t v12 = v119;
      }
      uint64_t v2 = v14;
      if (v21 >= v19)
      {
        id v11 = v13;
      }
      else
      {
        if (v9 < v12) {
          goto LABEL_132;
        }
        id v11 = v13;
        if (v12 < v9)
        {
          unint64_t v32 = (uint64_t *)(v115 + 8 * v9);
          uint64_t v33 = v9;
          uint64_t v34 = v12;
          uint64_t v35 = (uint64_t *)(v10 + 8 * v12);
          do
          {
            if (v34 != --v33)
            {
              if (!v10) {
                goto LABEL_138;
              }
              uint64_t v36 = *v35;
              *uint64_t v35 = *v32;
              uint64_t *v32 = v36;
            }
            ++v34;
            --v32;
            ++v35;
          }
          while (v34 < v33);
        }
      }
    }
    if (v9 < v4)
    {
      if (__OFSUB__(v9, v12)) {
        goto LABEL_130;
      }
      if (v9 - v12 < v117)
      {
        if (__OFADD__(v12, v117)) {
          goto LABEL_133;
        }
        if (v12 + v117 >= v4) {
          uint64_t v37 = v4;
        }
        else {
          uint64_t v37 = v12 + v117;
        }
        if (v37 < v12) {
          goto LABEL_134;
        }
        if (v9 != v37)
        {
          uint64_t v114 = v11;
          uint64_t v122 = v2;
          uint64_t v38 = v115 + 8 * v9;
          do
          {
            uint64_t v39 = v37;
            uint64_t v40 = *(void **)(v10 + 8 * v9);
            uint64_t v41 = v12;
            uint64_t v42 = v38;
            do
            {
              id v43 = *(void **)v42;
              id v44 = v40;
              id v45 = v43;
              sub_21DE3DC30();
              double v47 = v46;
              sub_21DE3DC30();
              double v49 = v48;

              if (v49 >= v47) {
                break;
              }
              if (!v10) {
                goto LABEL_136;
              }
              uint64_t v50 = *(void **)v42;
              uint64_t v40 = *(void **)(v42 + 8);
              *(void *)uint64_t v42 = v40;
              *(void *)(v42 + 8) = v50;
              v42 -= 8;
              ++v41;
            }
            while (v9 != v41);
            ++v9;
            v38 += 8;
            uint64_t v37 = v39;
            uint64_t v12 = v119;
          }
          while (v9 != v39);
          uint64_t v9 = v39;
          uint64_t v2 = v122;
          id v11 = v114;
        }
      }
    }
    if (v9 < v12) {
      goto LABEL_129;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      id v11 = sub_21DE2F20C(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v52 = *((void *)v11 + 2);
    unint64_t v51 = *((void *)v11 + 3);
    unint64_t v53 = v52 + 1;
    uint64_t v123 = v2;
    if (v52 >= v51 >> 1) {
      id v11 = sub_21DE2F20C((char *)(v51 > 1), v52 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v53;
    uint64_t v54 = v11 + 32;
    char v55 = &v11[16 * v52 + 32];
    *(void *)char v55 = v12;
    *((void *)v55 + 1) = v9;
    if (v52) {
      break;
    }
    unint64_t v53 = 1;
LABEL_87:
    uint64_t v4 = v118;
    uint64_t v2 = v123;
    if (v9 >= v118) {
      goto LABEL_96;
    }
  }
  uint64_t v120 = v9;
  while (1)
  {
    uint64_t v56 = v53 - 1;
    if (v53 >= 4)
    {
      uint64_t v61 = &v54[16 * v53];
      uint64_t v62 = *((void *)v61 - 8);
      uint64_t v63 = *((void *)v61 - 7);
      BOOL v67 = __OFSUB__(v63, v62);
      uint64_t v64 = v63 - v62;
      if (v67) {
        goto LABEL_114;
      }
      uint64_t v66 = *((void *)v61 - 6);
      uint64_t v65 = *((void *)v61 - 5);
      BOOL v67 = __OFSUB__(v65, v66);
      uint64_t v59 = v65 - v66;
      char v60 = v67;
      if (v67) {
        goto LABEL_115;
      }
      unint64_t v68 = v53 - 2;
      uint64_t v69 = &v54[16 * v53 - 32];
      uint64_t v71 = *(void *)v69;
      uint64_t v70 = *((void *)v69 + 1);
      BOOL v67 = __OFSUB__(v70, v71);
      uint64_t v72 = v70 - v71;
      if (v67) {
        goto LABEL_116;
      }
      BOOL v67 = __OFADD__(v59, v72);
      uint64_t v73 = v59 + v72;
      if (v67) {
        goto LABEL_118;
      }
      if (v73 >= v64)
      {
        v91 = &v54[16 * v56];
        uint64_t v93 = *(void *)v91;
        uint64_t v92 = *((void *)v91 + 1);
        BOOL v67 = __OFSUB__(v92, v93);
        uint64_t v94 = v92 - v93;
        if (v67) {
          goto LABEL_124;
        }
        BOOL v84 = v59 < v94;
        goto LABEL_76;
      }
    }
    else
    {
      if (v53 != 3)
      {
        uint64_t v85 = *((void *)v11 + 4);
        uint64_t v86 = *((void *)v11 + 5);
        BOOL v67 = __OFSUB__(v86, v85);
        uint64_t v78 = v86 - v85;
        char v79 = v67;
        goto LABEL_70;
      }
      uint64_t v58 = *((void *)v11 + 4);
      uint64_t v57 = *((void *)v11 + 5);
      BOOL v67 = __OFSUB__(v57, v58);
      uint64_t v59 = v57 - v58;
      char v60 = v67;
    }
    if (v60) {
      goto LABEL_117;
    }
    unint64_t v68 = v53 - 2;
    os_log_type_t v74 = &v54[16 * v53 - 32];
    uint64_t v76 = *(void *)v74;
    uint64_t v75 = *((void *)v74 + 1);
    BOOL v77 = __OFSUB__(v75, v76);
    uint64_t v78 = v75 - v76;
    char v79 = v77;
    if (v77) {
      goto LABEL_119;
    }
    char v80 = &v54[16 * v56];
    uint64_t v82 = *(void *)v80;
    uint64_t v81 = *((void *)v80 + 1);
    BOOL v67 = __OFSUB__(v81, v82);
    uint64_t v83 = v81 - v82;
    if (v67) {
      goto LABEL_121;
    }
    if (__OFADD__(v78, v83)) {
      goto LABEL_123;
    }
    if (v78 + v83 >= v59)
    {
      BOOL v84 = v59 < v83;
LABEL_76:
      if (v84) {
        uint64_t v56 = v68;
      }
      goto LABEL_78;
    }
LABEL_70:
    if (v79) {
      goto LABEL_120;
    }
    uint64_t v87 = &v54[16 * v56];
    uint64_t v89 = *(void *)v87;
    uint64_t v88 = *((void *)v87 + 1);
    BOOL v67 = __OFSUB__(v88, v89);
    uint64_t v90 = v88 - v89;
    if (v67) {
      goto LABEL_122;
    }
    if (v90 < v78) {
      goto LABEL_87;
    }
LABEL_78:
    uint64_t v95 = v56 - 1;
    if (v56 - 1 >= v53)
    {
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
      goto LABEL_125;
    }
    uint64_t v96 = v10;
    if (!v10) {
      goto LABEL_137;
    }
    uint64_t v97 = v11;
    id v98 = &v54[16 * v95];
    uint64_t v99 = v54;
    uint64_t v100 = *(void *)v98;
    uint64_t v101 = v99;
    uint64_t v4 = v56;
    uint64_t v102 = &v99[16 * v56];
    uint64_t v103 = *((void *)v102 + 1);
    uint64_t v104 = v96;
    sub_21DE2EFF0((char *)(v96 + 8 * *(void *)v98), (char *)(v96 + 8 * *(void *)v102), v96 + 8 * v103, v121);
    if (v123) {
      break;
    }
    if (v103 < v100) {
      goto LABEL_111;
    }
    if ((unint64_t)v4 > *((void *)v97 + 2)) {
      goto LABEL_112;
    }
    *(void *)id v98 = v100;
    *(void *)&v101[16 * v95 + 8] = v103;
    unint64_t v105 = *((void *)v97 + 2);
    if (v4 >= v105) {
      goto LABEL_113;
    }
    uint64_t v54 = v101;
    id v11 = v97;
    unint64_t v53 = v105 - 1;
    memmove(v102, v102 + 16, 16 * (v105 - 1 - v4));
    *((void *)v97 + 2) = v105 - 1;
    uint64_t v10 = v104;
    uint64_t v9 = v120;
    if (v105 <= 2) {
      goto LABEL_87;
    }
  }
  uint64_t v2 = v123;
LABEL_93:
  swift_bridgeObjectRelease();
  if (v118 < -1)
  {
    __break(1u);
    goto LABEL_95;
  }
LABEL_108:
  *(void *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
  sub_21DE3DEF0();
  swift_bridgeObjectRelease();
}

void sub_21DE2EF0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = *a4;
    uint64_t v7 = *a4 + 8 * a3 - 8;
    while (2)
    {
      uint64_t v8 = *(void **)(v6 + 8 * v4);
      uint64_t v9 = a1;
      uint64_t v10 = v7;
      do
      {
        id v11 = *(void **)v10;
        id v12 = v8;
        id v13 = v11;
        sub_21DE3DC30();
        double v15 = v14;
        sub_21DE3DC30();
        double v17 = v16;

        if (v17 >= v15) {
          break;
        }
        if (!v6)
        {
          __break(1u);
          return;
        }
        double v18 = *(void **)v10;
        uint64_t v8 = *(void **)(v10 + 8);
        *(void *)uint64_t v10 = v8;
        *(void *)(v10 + 8) = v18;
        v10 -= 8;
        ++v9;
      }
      while (v4 != v9);
      ++v4;
      v7 += 8;
      if (v4 != a2) {
        continue;
      }
      break;
    }
  }
}

uint64_t sub_21DE2EFF0(char *a1, char *a2, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = (id *)a2;
  uint64_t v7 = (id *)a1;
  uint64_t v8 = a2 - a1;
  uint64_t v9 = (a2 - a1) / 8;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 8;
  if (v9 >= v11)
  {
    sub_21DE2E4B4(a2, (uint64_t)(a3 - (void)a2) / 8, a4);
    if (v7 >= v6 || v10 < 8)
    {
      id v12 = &v4[8 * v11];
    }
    else
    {
      id v25 = (id *)(a3 - 8);
      id v12 = &v4[8 * v11];
      uint64_t v40 = v4;
      do
      {
        uint64_t v41 = v25 + 1;
        double v27 = (id *)(v12 - 8);
        id v26 = (void *)*((void *)v12 - 1);
        unint64_t v28 = (unint64_t)v12;
        double v30 = v6 - 1;
        double v29 = *(v6 - 1);
        id v31 = v26;
        id v32 = v29;
        sub_21DE3DC30();
        double v34 = v33;
        sub_21DE3DC30();
        double v36 = v35;

        if (v36 >= v34)
        {
          BOOL v37 = v41 != (id *)v28 || (unint64_t)v25 >= v28;
          double v30 = v27;
          unint64_t v28 = (unint64_t)v27;
        }
        else
        {
          BOOL v37 = v41 != v6 || v25 >= v6;
          --v6;
        }
        uint64_t v4 = v40;
        if (v37) {
          *id v25 = *v30;
        }
        --v25;
        id v12 = (char *)v28;
      }
      while (v6 > v7 && v28 > (unint64_t)v40);
    }
  }
  else
  {
    sub_21DE2E4B4(a1, (a2 - a1) / 8, a4);
    id v12 = &v4[8 * v9];
    if ((unint64_t)v6 < a3 && v8 >= 8)
    {
      while (1)
      {
        double v14 = *(void **)v4;
        id v15 = *v6;
        id v16 = v14;
        sub_21DE3DC30();
        double v18 = v17;
        sub_21DE3DC30();
        double v20 = v19;

        if (v20 < v18) {
          break;
        }
        double v21 = (id *)v4;
        BOOL v22 = v7 == (id *)v4;
        v4 += 8;
        if (!v22) {
          goto LABEL_11;
        }
LABEL_12:
        ++v7;
        if (v4 >= v12 || (unint64_t)v6 >= a3) {
          goto LABEL_17;
        }
      }
      double v21 = v6;
      BOOL v22 = v7 == v6++;
      if (v22) {
        goto LABEL_12;
      }
LABEL_11:
      *uint64_t v7 = *v21;
      goto LABEL_12;
    }
LABEL_17:
    uint64_t v6 = v7;
  }
  sub_21DE2E4B4(v4, (v12 - v4) / 8, (char *)v6);
  return 1;
}

char *sub_21DE2F20C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D225D0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v12 = v10 + 32;
  id v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_21DE2F304(uint64_t a1)
{
  return sub_21DE2F20C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_21DE2F318(char *result, uint64_t a2, char *a3)
{
  if (a3 != result || &result[16 * a2] <= a3) {
    return (char *)OUTLINED_FUNCTION_1_3(a3, result);
  }
  return result;
}

uint64_t sub_21DE2F338(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_21DE3E100();
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
      uint64_t v8 = sub_21DE3E100();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_21DE2FDAC(&qword_267D225C8, &qword_267D225C0);
          swift_bridgeObjectRetain();
          for (uint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_267D225C0);
            uint64_t v10 = sub_21DE2F6F0();
            id v12 = *v11;
            ((void (*)(uint64_t *, void))v10)(&v13, 0);
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
        sub_21DE2E5FC((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5, MEMORY[0x263F741B8]);
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

uint64_t sub_21DE2F4E8(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_21DE3E100();
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
      uint64_t v8 = sub_21DE3E100();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_21DE2FDAC(&qword_267D225B8, &qword_267D225B0);
          swift_bridgeObjectRetain();
          for (uint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_267D225B0);
            uint64_t v10 = sub_21DE2F698();
            uint64_t v12 = *v11;
            swift_retain();
            ((void (*)(uint64_t *, void))v10)(&v13, 0);
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
        sub_21DE2E5FC((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5, MEMORY[0x263F737A0]);
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

uint64_t (*sub_21DE2F698())()
{
  uint64_t v1 = OUTLINED_FUNCTION_16_1();
  *uint64_t v0 = v1;
  OUTLINED_FUNCTION_9_3();
  v1[4] = sub_21DE2F78C(v2, v3, v4);
  return sub_21DE2F6EC;
}

uint64_t (*sub_21DE2F6F0())()
{
  uint64_t v1 = OUTLINED_FUNCTION_16_1();
  *uint64_t v0 = v1;
  OUTLINED_FUNCTION_9_3();
  v1[4] = sub_21DE2F7FC(v2, v3, v4);
  return sub_21DE2F6EC;
}

void sub_21DE2F744(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t (*sub_21DE2F78C(uint64_t a1, unint64_t a2, uint64_t a3))()
{
  OUTLINED_FUNCTION_8_3(a1, a2, a3);
  if (v6) {
    uint64_t v7 = MEMORY[0x223C19800](v5, v4);
  }
  else {
    uint64_t v7 = swift_retain();
  }
  *unint64_t v3 = v7;
  return sub_21DE2F7F4;
}

uint64_t sub_21DE2F7F4()
{
  return swift_release();
}

void (*sub_21DE2F7FC(uint64_t a1, unint64_t a2, uint64_t a3))(id *a1)
{
  OUTLINED_FUNCTION_8_3(a1, a2, a3);
  if (v6) {
    id v7 = (id)MEMORY[0x223C19800](v5, v4);
  }
  else {
    id v7 = *(id *)(v4 + 8 * v5 + 32);
  }
  *unint64_t v3 = v7;
  return sub_21DE2F864;
}

void sub_21DE2F864(id *a1)
{
}

id sub_21DE2F86C(id a1, char a2)
{
  if (a2) {
    return a1;
  }
  else {
    return (id)swift_bridgeObjectRetain();
  }
}

void sub_21DE2F878(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_bridgeObjectRelease();
  }
}

unint64_t sub_21DE2F884()
{
  unint64_t result = qword_26AD32B50;
  if (!qword_26AD32B50)
  {
    sub_21DE3DB40();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD32B50);
  }
  return result;
}

unint64_t sub_21DE2F8D4()
{
  unint64_t result = qword_267D225A8;
  if (!qword_267D225A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D225A8);
  }
  return result;
}

uint64_t sub_21DE2F920@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_21DE2BF94();
  *a1 = result;
  return result;
}

uint64_t sub_21DE2F950(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_21DE2F984(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t sub_21DE2F9B8()
{
  return type metadata accessor for RRResolver();
}

uint64_t method lookup function for RRResolver(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for RRResolver);
}

uint64_t dispatch thunk of RRResolver.entities.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of RRResolver.entities.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of RRResolver.entities.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of RRResolver.__allocating_init(entities:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of RRResolver.resolve(query:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

void sub_21DE2FAE0()
{
}

uint64_t sub_21DE2FAF4(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = a2;
    uint64_t v4 = a1;
    if (!(*v3 >> 62))
    {
      OUTLINED_FUNCTION_13_1();
      goto LABEL_4;
    }
  }
  OUTLINED_FUNCTION_5_3();
  uint64_t v5 = sub_21DE3E100();
  swift_bridgeObjectRelease();
LABEL_4:
  if (v5 < v2)
  {
    __break(1u);
    goto LABEL_34;
  }
  if (__OFSUB__(v2, v4))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v6 = v4 - v2;
  if (__OFSUB__(0, v2 - v4))
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  if (!(*v3 >> 62))
  {
    uint64_t v7 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_9;
  }
LABEL_36:
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_21DE3E100();
  swift_bridgeObjectRelease();
LABEL_9:
  uint64_t v8 = v7 + v6;
  if (__OFADD__(v7, v6))
  {
    __break(1u);
LABEL_38:
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_21DE3E100();
    swift_bridgeObjectRelease();
    unint64_t v9 = *v3;
    goto LABEL_17;
  }
  unint64_t v9 = *v3;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *unint64_t v3 = v9;
  uint64_t v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    uint64_t v11 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_20;
    }
    uint64_t v7 = 1;
  }
  if (v9 >> 62) {
    goto LABEL_38;
  }
  uint64_t v12 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_17:
  if (v12 <= v8) {
    uint64_t v12 = v8;
  }
  swift_bridgeObjectRetain();
  *unint64_t v3 = MEMORY[0x223C19810](v7, v12, 1, v9);
  swift_bridgeObjectRelease();
  uint64_t v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_20:
  uint64_t v13 = v11 + 32;
  double v14 = (char *)(v11 + 32 + 8 * v4);
  sub_21DE3D9F0();
  swift_arrayDestroy();
  if (!v6) {
    goto LABEL_28;
  }
  if (*v3 >> 62)
  {
    OUTLINED_FUNCTION_5_3();
    unint64_t v9 = sub_21DE3E100();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_13_1();
  }
  if (__OFSUB__(v9, v2))
  {
    __break(1u);
    goto LABEL_41;
  }
  uint64_t result = (uint64_t)sub_21DE2E4B4((char *)(v13 + 8 * v2), v9 - v2, v14);
  if (*v3 >> 62)
  {
LABEL_41:
    OUTLINED_FUNCTION_18_1();
    uint64_t v16 = sub_21DE3E100();
    uint64_t result = swift_bridgeObjectRelease();
    goto LABEL_26;
  }
  uint64_t v16 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_26:
  if (__OFADD__(v16, v6))
  {
    __break(1u);
    return result;
  }
  *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) = v16 + v6;
LABEL_28:

  return sub_21DE3DEF0();
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

void sub_21DE2FD94(void *a1, unsigned __int8 a2)
{
  if (a2 != 255) {
    sub_21DE2F878(a1, a2 & 1);
  }
}

uint64_t sub_21DE2FDAC(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_21DE2FDFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32B68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21DE2FE64(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_4_4();
  uint64_t v3 = OUTLINED_FUNCTION_10_3();
  v4(v3);
  return a1;
}

void *OUTLINED_FUNCTION_1_3@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  return memmove(__dst, a2, v2);
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  return sub_21DE3E110();
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_7_3()
{
  sub_21DE2F878(v0, 0);
}

unint64_t OUTLINED_FUNCTION_8_3(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_21DE2E230(a2, (a3 & 0xC000000000000001) == 0, a3);
}

uint64_t OUTLINED_FUNCTION_10_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_12_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return v0;
}

void *OUTLINED_FUNCTION_16_1()
{
  return malloc(0x28uLL);
}

uint64_t OUTLINED_FUNCTION_18_1()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_21DE30038(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21DE3DAC0();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_21DE300A4(uint64_t a1)
{
  uint64_t v2 = sub_21DE3DAC0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_21DE30108(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21DE3DAC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_21DE3016C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21DE3DAC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_21DE301D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21DE3DAC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_21DE30234(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21DE3DAC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_21DE30298(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21DE302AC);
}

uint64_t sub_21DE302AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21DE3DAC0();

  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t sub_21DE302F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_21DE30308);
}

uint64_t sub_21DE30308(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21DE3DAC0();

  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

uint64_t type metadata accessor for MediaItemStructuredDataHandler()
{
  uint64_t result = qword_267D225D8;
  if (!qword_267D225D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21DE3039C()
{
  uint64_t result = sub_21DE3DAC0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_21DE30428()
{
  return 0xD000000000000010;
}

uint64_t sub_21DE30444()
{
  return 9;
}

unint64_t sub_21DE3044C()
{
  return 0xD000000000000016;
}

uint64_t sub_21DE30468()
{
  return 0x49616964654D4E49;
}

uint64_t sub_21DE30488(void *a1)
{
  uint64_t v3 = sub_21DE3DBB0();
  uint64_t v5 = sub_21DE3054C(v3, v4, a1);
  if (v1) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v7 = v5;
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_21DE23668(0, 0, 0, 0, v7, 0, 0, 0, 0xF000000000000000);
  swift_release();
  return v8;
}

uint64_t sub_21DE3054C(uint64_t a1, uint64_t a2, void *a3)
{
  sub_21DE3D6F0();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_6_4();
  uint64_t v8 = sub_21DE3D4D0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_6_4();
  uint64_t v14 = v13 - v12;
  sub_21DE3D7D0();
  swift_allocObject();
  uint64_t v25 = sub_21DE3D7C0();
  sub_21DE30F3C(a3, (SEL *)&selRef_title);
  if (v15)
  {
    swift_retain();
    sub_21DE3D7B0();
    swift_bridgeObjectRelease();
    swift_release();
  }
  sub_21DE30A60(a1, a2, &v25, a3);
  if (v3)
  {
    swift_release();
  }
  else
  {
    sub_21DE30F3C(a3, (SEL *)&selRef_identifier);
    if (v16)
    {
      swift_retain();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_2_6();
      sub_21DE3D4A0();
      sub_21DE3D400();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v14, v8);
    }
    sub_21DE30F3C(a3, (SEL *)&selRef_identifier);
    if (v17)
    {
      swift_bridgeObjectRetain();
      swift_retain();
      OUTLINED_FUNCTION_2_6();
      sub_21DE3D4A0();
      sub_21DE3D400();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v14, v8);
    }
    sub_21DE3D910();
    swift_allocObject();
    sub_21DE3D900();
    switch((unint64_t)objc_msgSend(a3, sel_type))
    {
      case 1uLL:
      case 2uLL:
      case 3uLL:
      case 4uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
      case 8uLL:
      case 9uLL:
      case 0xAuLL:
      case 0xBuLL:
      case 0xCuLL:
      case 0xDuLL:
      case 0xEuLL:
      case 0xFuLL:
      case 0x10uLL:
      case 0x11uLL:
      case 0x12uLL:
      case 0x13uLL:
      case 0x14uLL:
        uint64_t v18 = OUTLINED_FUNCTION_1_4();
        v19(v18);
        sub_21DE3D8F0();
        uint64_t v20 = OUTLINED_FUNCTION_4_5();
        v21(v20);
        swift_retain();
        swift_retain();
        sub_21DE3D7A0();
        swift_release();
        swift_release();
        break;
      default:
        break;
    }
    sub_21DE30F3C(a3, (SEL *)&selRef_artist);
    if (v22)
    {
      swift_allocObject();
      sub_21DE3D7C0();
      sub_21DE3D7B0();
      swift_bridgeObjectRelease();
      swift_retain();
      swift_retain();
      sub_21DE3D790();
      swift_release();
      swift_release_n();
    }
    uint64_t v23 = swift_retain();
    uint64_t v10 = MEMORY[0x223C18C90](v23);
    swift_release();
    swift_release_n();
  }
  return v10;
}

uint64_t sub_21DE30A60(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v39 = a3;
  sub_21DE3D4D0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v40 = v9;
  uint64_t v41 = v8;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_6_4();
  sub_21DE3DA70();
  OUTLINED_FUNCTION_0_0();
  uint64_t v42 = v11;
  uint64_t v43 = v10;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (uint64_t *)((char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v38 - v15;
  BOOL v17 = a1 == 0x6C7070612E6D6F63 && a2 == 0xEF636973754D2E65;
  if (v17
    || (sub_21DE3E180() & 1) != 0
    || OUTLINED_FUNCTION_7_4() == (id)1
    || OUTLINED_FUNCTION_7_4() == (id)2
    || OUTLINED_FUNCTION_7_4() == (id)5
    || (uint64_t result = (uint64_t)OUTLINED_FUNCTION_7_4(), result == 14))
  {
    uint64_t result = sub_21DE30F3C(a4, (SEL *)&selRef_identifier);
    if (v19)
    {
      sub_21DE3DA90();
      uint64_t result = swift_bridgeObjectRelease();
      if (!v4)
      {
        uint64_t v20 = v42;
        uint64_t v21 = v43;
        (*(void (**)(uint64_t *, char *, uint64_t))(v42 + 16))(v14, v16, v43);
        int v22 = (*(uint64_t (**)(uint64_t *, uint64_t))(v20 + 88))(v14, v21);
        if (v22 == *MEMORY[0x263F568E8])
        {
          uint64_t v23 = OUTLINED_FUNCTION_3_5();
          v24(v23);
          uint64_t v38 = (char *)v14[1];
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          sub_21DE3D4A0();
          sub_21DE3D400();
          uint64_t v25 = OUTLINED_FUNCTION_5_4();
          v26(v25);
          return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v16, v21);
        }
        else if (v22 == *MEMORY[0x263F568F0])
        {
          uint64_t v27 = OUTLINED_FUNCTION_3_5();
          v28(v27);
          uint64_t v29 = v20;
          uint64_t v30 = *v14;
          swift_bridgeObjectRelease();
          uint64_t v38 = (char *)v14 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267D225E8) + 64);
          uint64_t v39 = (void *)*v39;
          uint64_t v44 = v30;
          sub_21DE3E150();
          swift_bridgeObjectRetain();
          sub_21DE3D4A0();
          sub_21DE3D400();
          uint64_t v31 = OUTLINED_FUNCTION_5_4();
          v32(v31);
          (*(void (**)(char *, uint64_t))(v29 + 8))(v16, v21);
          uint64_t v33 = sub_21DE3DA80();
          return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v33 - 8) + 8))(v38, v33);
        }
        else
        {
          uint64_t v34 = v21;
          uint64_t v35 = sub_21DE3DA60();
          sub_21DE2B8E4();
          swift_allocError();
          *double v36 = 0xD000000000000026;
          v36[1] = 0x800000021DE401B0;
          (*(void (**)(void *, void, uint64_t))(*(void *)(v35 - 8) + 104))(v36, *MEMORY[0x263F75868], v35);
          swift_willThrow();
          BOOL v37 = *(void (**)(char *, uint64_t))(v20 + 8);
          v37(v16, v34);
          return ((uint64_t (*)(uint64_t *, uint64_t))v37)(v14, v34);
        }
      }
    }
  }
  return result;
}

unint64_t sub_21DE30EE0()
{
  return 0xD000000000000010;
}

unint64_t sub_21DE30F00()
{
  return 0xD000000000000016;
}

uint64_t sub_21DE30F20(void **a1)
{
  return sub_21DE30488(*a1);
}

uint64_t sub_21DE30F3C(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = sub_21DE3DD80();

  return v4;
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return *(void *)(v0 - 104);
}

uint64_t OUTLINED_FUNCTION_3_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_4()
{
  return v0;
}

id OUTLINED_FUNCTION_7_4()
{
  return [v1 (SEL)(v0 + 2200)];
}

uint64_t sub_21DE31050()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC21SiriReferenceResolver15RRReaderMatcher_logger;
  uint64_t v2 = sub_21DE3DAC0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_21DE310F0()
{
  return type metadata accessor for RRReaderMatcher();
}

uint64_t type metadata accessor for RRReaderMatcher()
{
  uint64_t result = qword_267D225F0;
  if (!qword_267D225F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21DE31140()
{
  uint64_t result = sub_21DE3DAC0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_21DE311D0()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFFA40]), sel_init);
  unint64_t v1 = (void *)sub_21DE3DD70();
  id v2 = objc_msgSend(v0, sel_persistentDomainForName_, v1);

  if (!v2 || (uint64_t v3 = sub_21DE3DD20(), v2, !v3))
  {
    long long v6 = 0u;
    long long v7 = 0u;
    goto LABEL_8;
  }
  sub_21DE282A4(0xD000000000000012, 0x800000021DE402B0, v3, &v6);
  swift_bridgeObjectRelease();
  if (!*((void *)&v7 + 1))
  {
LABEL_8:
    sub_21DE314BC((uint64_t)&v6);
    return 2;
  }
  if (swift_dynamicCast()) {
    return v5;
  }
  else {
    return 2;
  }
}

uint64_t sub_21DE31310()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFFA40]), sel_init);
  unint64_t v1 = (void *)sub_21DE3DD70();
  id v2 = objc_msgSend(v0, sel_persistentDomainForName_, v1);

  if (!v2 || (uint64_t v3 = sub_21DE3DD20(), v2, !v3))
  {
    long long v6 = 0u;
    long long v7 = 0u;
    goto LABEL_9;
  }
  sub_21DE282A4(0x617461446B636F6DLL, 0xEC00000065707954, v3, &v6);
  swift_bridgeObjectRelease();
  if (!*((void *)&v7 + 1))
  {
LABEL_9:
    sub_21DE314BC((uint64_t)&v6);
    return 0;
  }
  if (swift_dynamicCast()) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t sub_21DE31454(char a1)
{
  if (a1) {
    return 0x617461446B636F6DLL;
  }
  else {
    return 0xD000000000000012;
  }
}

uint64_t type metadata accessor for SiriReferenceResolverDefaults()
{
  return self;
}

uint64_t sub_21DE314BC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD32BC8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21DE3151C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D22590);
  __swift_allocate_value_buffer(v0, qword_267D226A8);
  __swift_project_value_buffer(v0, (uint64_t)qword_267D226A8);
  sub_21DE3D9F0();
  sub_21DE3D6E0();
  return sub_21DE3DA00();
}

uint64_t sub_21DE315A4@<X0>(uint64_t *a1@<X8>)
{
  double v49 = a1;
  uint64_t v2 = sub_21DE3D4D0();
  uint64_t v52 = *(void *)(v2 - 8);
  uint64_t v53 = v2;
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  unint64_t v51 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  long long v6 = (char *)&v41 - v5;
  uint64_t v7 = sub_21DE3DAC0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D22590);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D22600);
  sub_21DE3DD90();
  uint64_t v50 = "common_EmailAddress";
  sub_21DE3DAB0();
  sub_21DE3D8E0();
  swift_allocObject();
  uint64_t v54 = sub_21DE3D8D0();
  uint64_t v11 = sub_21DE3D9C0();
  unint64_t v12 = sub_21DE28204(0x7472617473, 0xE500000000000000, v11);
  swift_bridgeObjectRelease();
  if (!v12) {
    goto LABEL_24;
  }
  if (!(v12 >> 62))
  {
    if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_4;
    }
    goto LABEL_23;
  }
  swift_bridgeObjectRetain();
  uint64_t v38 = sub_21DE3E100();
  swift_bridgeObjectRelease();
  if (!v38)
  {
LABEL_23:
    swift_bridgeObjectRelease();
LABEL_24:
    uint64_t v39 = sub_21DE3DA60();
    sub_21DE2B8E4();
    swift_allocError();
    *uint64_t v40 = 0xD000000000000020;
    v40[1] = 0x800000021DE402D0;
    (*(void (**)(void *, void, uint64_t))(*(void *)(v39 - 8) + 104))(v40, *MEMORY[0x263F75868], v39);
    swift_willThrow();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
LABEL_4:
  sub_21DE2E22C(0, (v12 & 0xC000000000000001) == 0, v12);
  if ((v12 & 0xC000000000000001) != 0) {
    MEMORY[0x223C19800](0, v12);
  }
  else {
    swift_retain();
  }
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_21DE3D990();
  swift_release();
  if (!v13) {
    goto LABEL_24;
  }
  uint64_t v46 = v7;
  sub_21DE3D780();
  swift_allocObject();
  uint64_t v14 = sub_21DE3D770();
  uint64_t v45 = v13;
  sub_21DE3D510();
  swift_retain();
  sub_21DE3D8C0();
  uint64_t v44 = v14;
  swift_release();
  unint64_t v15 = sub_21DE31D64();
  double v47 = v10;
  if (v15)
  {
    uint64_t v16 = sub_21DE3DAA0();
    os_log_type_t v17 = sub_21DE3DF60();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_21DE16000, v16, v17, "Adding end node since it contains at least one valid int", v18, 2u);
      MEMORY[0x223C19EE0](v18, -1, -1);
    }

    swift_retain();
    sub_21DE3D8B0();
    swift_release_n();
    uint64_t v10 = v47;
  }
  sub_21DE3D8A0();
  swift_allocObject();
  uint64_t v19 = sub_21DE3D890();
  swift_retain();
  uint64_t v48 = v19;
  sub_21DE3D880();
  swift_release();
  uint64_t v20 = sub_21DE3D9D0();
  uint64_t v21 = *(void *)(v20 + 16);
  if (v21)
  {
    uint64_t v42 = v8;
    uint64_t v43 = v1;
    uint64_t v22 = v53;
    uint64_t v23 = *(void (**)(char *, unint64_t, uint64_t))(v52 + 16);
    unint64_t v24 = (*(unsigned __int8 *)(v52 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80);
    uint64_t v41 = v20;
    unint64_t v25 = v20 + v24;
    uint64_t v26 = *(void *)(v52 + 72);
    uint64_t v27 = (void (**)(char *, uint64_t))(v52 + 8);
    uint64_t v28 = v48;
    do
    {
      v23(v6, v25, v22);
      sub_21DE3D400();
      (*v27)(v6, v22);
      v25 += v26;
      --v21;
    }
    while (v21);
    swift_bridgeObjectRelease();
    uint64_t v8 = v42;
    uint64_t v10 = v47;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v28 = v48;
  }
  uint64_t v29 = v51;
  sub_21DE3D4A0();
  sub_21DE3D400();
  uint64_t v30 = MEMORY[0x223C18C90](v28);
  uint64_t v31 = v53;
  if (v30)
  {
    sub_21DE3D6E0();
    sub_21DE3D560();
    uint64_t v32 = v55;
    if (v55)
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v52 + 8))(v29, v31);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v46);
      *double v49 = v32;
      return result;
    }
    uint64_t v36 = sub_21DE3DA60();
    sub_21DE2B8E4();
    swift_allocError();
    *BOOL v37 = 0xD00000000000002ALL;
    v37[1] = 0x800000021DE40030;
    (*(void (**)(void *, void, uint64_t))(*(void *)(v36 - 8) + 104))(v37, *MEMORY[0x263F75868], v36);
    swift_willThrow();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    uint64_t v34 = sub_21DE3DA60();
    sub_21DE2B8E4();
    swift_allocError();
    *uint64_t v35 = 0xD00000000000002DLL;
    v35[1] = 0x800000021DE40000;
    (*(void (**)(void *, void, uint64_t))(*(void *)(v34 - 8) + 104))(v35, *MEMORY[0x263F75868], v34);
    swift_willThrow();
    swift_release();
    swift_release();
    swift_release();
  }
  swift_release();
  (*(void (**)(char *, uint64_t))(v52 + 8))(v29, v31);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v46);
}

unint64_t sub_21DE31D64()
{
  uint64_t v0 = sub_21DE3DAC0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v42 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D22590);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D22600);
  sub_21DE3DD90();
  sub_21DE3DAB0();
  uint64_t v4 = sub_21DE3D9C0();
  unint64_t v5 = sub_21DE28204(6581861, 0xE300000000000000, v4);
  swift_bridgeObjectRelease();
  if (!v5) {
    goto LABEL_86;
  }
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v37 = sub_21DE3E100();
    swift_bridgeObjectRelease();
    if (!v37) {
      goto LABEL_84;
    }
  }
  else if (!*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_84:
    swift_bridgeObjectRelease();
    goto LABEL_85;
  }
  OUTLINED_FUNCTION_7();
  if ((v5 & 0xC000000000000001) != 0) {
    OUTLINED_FUNCTION_19();
  }
  else {
    swift_retain();
  }
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_21DE3D990();
  swift_release();
  if (!v6) {
    goto LABEL_85;
  }
  uint64_t v7 = sub_21DE3D9C0();
  unint64_t v5 = sub_21DE28204(1702125924, 0xE400000000000000, v7);
  swift_bridgeObjectRelease();
  if (!v5)
  {
LABEL_70:
    swift_release();
    goto LABEL_86;
  }
  if (!(v5 >> 62))
  {
    if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_10;
    }
LABEL_83:
    swift_release();
    goto LABEL_84;
  }
LABEL_76:
  swift_bridgeObjectRetain();
  uint64_t v38 = sub_21DE3E100();
  swift_bridgeObjectRelease();
  if (!v38) {
    goto LABEL_83;
  }
LABEL_10:
  OUTLINED_FUNCTION_7();
  if ((v5 & 0xC000000000000001) != 0) {
    OUTLINED_FUNCTION_19();
  }
  else {
    swift_retain();
  }
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_21DE3D990();
  swift_release();
  if (!v8) {
    goto LABEL_68;
  }
  uint64_t v9 = sub_21DE3D9C0();
  unint64_t v5 = sub_21DE28204(1701669236, 0xE400000000000000, v9);
  swift_bridgeObjectRelease();
  if (!v5)
  {
LABEL_69:
    swift_release();
    goto LABEL_70;
  }
  if (!(v5 >> 62))
  {
    if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_16;
    }
LABEL_82:
    swift_release();
    goto LABEL_83;
  }
LABEL_81:
  swift_bridgeObjectRetain();
  uint64_t v39 = sub_21DE3E100();
  swift_bridgeObjectRelease();
  if (!v39) {
    goto LABEL_82;
  }
LABEL_16:
  uint64_t v44 = v8;
  OUTLINED_FUNCTION_7();
  if ((v5 & 0xC000000000000001) != 0)
  {
    OUTLINED_FUNCTION_19();
    uint64_t v10 = v41;
  }
  else
  {
    uint64_t v10 = *(void *)(v5 + 32);
    swift_retain();
  }
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_21DE3D990();
  swift_release();
  uint64_t v43 = v8;
  if (v8)
  {
    uint64_t v11 = sub_21DE3D9C0();
    OUTLINED_FUNCTION_0_4(v11);
    while (1)
    {
      while (1)
      {
        do
        {
          OUTLINED_FUNCTION_5_5();
          unint64_t v5 = *(void *)(*(void *)(v10 + 56) + 8 * v12);
          if (v5 >> 62)
          {
            OUTLINED_FUNCTION_1_5();
            if (!sub_21DE3E100()) {
              goto LABEL_38;
            }
          }
          else
          {
            uint64_t v13 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain();
            if (!v13) {
              goto LABEL_38;
            }
          }
          if ((v5 & 0xC000000000000001) != 0)
          {
            OUTLINED_FUNCTION_19();
          }
          else
          {
            OUTLINED_FUNCTION_6_5();
            if (!v14)
            {
              __break(1u);
LABEL_75:
              __break(1u);
              __break(1u);
              __break(1u);
              goto LABEL_76;
            }
            OUTLINED_FUNCTION_7_5();
          }
          swift_bridgeObjectRelease();
          uint64_t v15 = sub_21DE3D990();
          swift_release();
        }
        while (!v15);
        uint64_t v16 = sub_21DE3D9C0();
        swift_release();
        if (*(void *)(v16 + 16))
        {
          unint64_t v17 = OUTLINED_FUNCTION_2_7();
          if (v18) {
            break;
          }
        }
LABEL_38:
        swift_bridgeObjectRelease();
      }
      unint64_t v5 = *(void *)(*(void *)(v16 + 56) + 8 * v17);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (!(v5 >> 62))
      {
        if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_30;
        }
        goto LABEL_38;
      }
      OUTLINED_FUNCTION_1_5();
      uint64_t v23 = sub_21DE3E100();
      swift_bridgeObjectRelease();
      if (!v23) {
        goto LABEL_38;
      }
LABEL_30:
      if ((v5 & 0xC000000000000001) != 0)
      {
        OUTLINED_FUNCTION_19();
      }
      else
      {
        OUTLINED_FUNCTION_6_5();
        if (!v19)
        {
          __break(1u);
LABEL_80:
          __break(1u);
          goto LABEL_81;
        }
        OUTLINED_FUNCTION_7_5();
      }
      swift_bridgeObjectRelease();
      uint64_t v20 = sub_21DE3D970();
      char v22 = v21;
      swift_release();
      if ((v22 & 1) == 0 && v20)
      {
        v42[1] = 0;
        swift_release();
        uint64_t v24 = sub_21DE3D9C0();
        OUTLINED_FUNCTION_0_4(v24);
        while (1)
        {
          while (1)
          {
            do
            {
              OUTLINED_FUNCTION_5_5();
              unint64_t v5 = *(void *)(*(void *)(v10 + 56) + 8 * v25);
              if (v5 >> 62)
              {
                OUTLINED_FUNCTION_1_5();
                if (!sub_21DE3E100()) {
                  goto LABEL_62;
                }
              }
              else
              {
                uint64_t v26 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
                swift_bridgeObjectRetain();
                if (!v26) {
                  goto LABEL_62;
                }
              }
              if ((v5 & 0xC000000000000001) != 0)
              {
                OUTLINED_FUNCTION_19();
              }
              else
              {
                OUTLINED_FUNCTION_6_5();
                if (!v27) {
                  goto LABEL_75;
                }
                OUTLINED_FUNCTION_7_5();
              }
              swift_bridgeObjectRelease();
              uint64_t v28 = sub_21DE3D990();
              swift_release();
            }
            while (!v28);
            uint64_t v29 = sub_21DE3D9C0();
            swift_release();
            if (*(void *)(v29 + 16))
            {
              unint64_t v30 = OUTLINED_FUNCTION_2_7();
              if (v31) {
                break;
              }
            }
LABEL_62:
            swift_bridgeObjectRelease();
          }
          unint64_t v5 = *(void *)(*(void *)(v29 + 56) + 8 * v30);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          if (v5 >> 62)
          {
            OUTLINED_FUNCTION_1_5();
            uint64_t v36 = sub_21DE3E100();
            swift_bridgeObjectRelease();
            if (v36) {
              goto LABEL_54;
            }
            goto LABEL_62;
          }
          if (!*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_62;
          }
LABEL_54:
          if ((v5 & 0xC000000000000001) != 0)
          {
            OUTLINED_FUNCTION_19();
          }
          else
          {
            OUTLINED_FUNCTION_6_5();
            if (!v32) {
              goto LABEL_80;
            }
            OUTLINED_FUNCTION_7_5();
          }
          swift_bridgeObjectRelease();
          uint64_t v33 = sub_21DE3D970();
          char v35 = v34;
          swift_release();
          if ((v35 & 1) == 0 && v33)
          {
            swift_release();
            sub_21DE3D780();
            swift_allocObject();
            unint64_t v5 = sub_21DE3D770();
            sub_21DE3D510();
            swift_release();
            goto LABEL_69;
          }
        }
      }
    }
  }
  swift_release();
LABEL_68:
  swift_release();
LABEL_85:
  unint64_t v5 = 0;
LABEL_86:
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v5;
}

uint64_t OUTLINED_FUNCTION_0_4(uint64_t result)
{
  *(void *)(v1 - 104) = result + 64;
  *(void *)(v1 - 96) = (unint64_t)((1 << *(unsigned char *)(result + 32)) + 63) >> 6;
  return result;
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  return swift_bridgeObjectRetain();
}

unint64_t OUTLINED_FUNCTION_2_7()
{
  return sub_21DE2A8C0(0x5672656765746E69, 0xEC00000065756C61);
}

uint64_t OUTLINED_FUNCTION_7_5()
{
  return swift_retain();
}

ValueMetadata *type metadata accessor for ApplicationStructuredDataHandler()
{
  return &type metadata for ApplicationStructuredDataHandler;
}

uint64_t sub_21DE32724()
{
  return 0x415F6E6F6D6D6F63;
}

uint64_t sub_21DE32740()
{
  return 0;
}

unint64_t sub_21DE32748()
{
  return 0xD000000000000018;
}

id sub_21DE32764(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_21DE3D4D0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21DE3D580();
  swift_allocObject();
  uint64_t v10 = sub_21DE3D570();
  swift_bridgeObjectRetain();
  sub_21DE3D4A0();
  sub_21DE3D400();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v11 = MEMORY[0x223C18C90](v10);
  if (v11)
  {
    id v12 = (id)sub_21DE23668(a1, a2, a1, a2, v11, 0, 0, 0, 0xF000000000000000);
    swift_release();
  }
  else
  {
    id v12 = a3;
  }
  swift_release();
  return v12;
}

unint64_t sub_21DE32928()
{
  return 0xD000000000000018;
}

id sub_21DE32948(uint64_t *a1, void *a2)
{
  return sub_21DE32764(*a1, a1[1], a2);
}

uint64_t sub_21DE3296C(unint64_t a1)
{
  uint64_t v11 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = sub_21DE3E100())
  {
    uint64_t v3 = 4;
    while (1)
    {
      id v4 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x223C19800](v3 - 4, a1) : *(id *)(a1 + 8 * v3);
      unint64_t v5 = v4;
      uint64_t v6 = v3 - 3;
      if (__OFADD__(v3 - 4, 1)) {
        break;
      }
      static RREntityMatcher.entity(_:matches:entityFoundByMarrsIdentifier:)();
      uint64_t v8 = v7;

      if (v8)
      {
        MEMORY[0x223C19640]();
        if (*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_21DE3DF00();
        }
        sub_21DE3DF30();
        sub_21DE3DEF0();
      }
      ++v3;
      if (v6 == v2)
      {
        swift_bridgeObjectRelease();
        uint64_t v9 = v11;
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  uint64_t v9 = MEMORY[0x263F8EE78];
LABEL_17:
  swift_release();
  return v9;
}

uint64_t sub_21DE32AF4(uint64_t a1)
{
  uint64_t v61 = MEMORY[0x263F8EE78];
  uint64_t v1 = sub_21DE33228(a1);
  if (v1)
  {
    uint64_t v2 = v1;
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_21DE3DAA0();
    os_log_type_t v4 = sub_21DE3DF60();
    if (os_log_type_enabled(v3, v4))
    {
      unint64_t v5 = (uint8_t *)OUTLINED_FUNCTION_11_0();
      *(_DWORD *)unint64_t v5 = 134217984;
      v60[0] = *(void *)(v2 + 16);
      sub_21DE3DFC0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21DE16000, v3, v4, "extractUsoIdentifiersFromReferenceNodes count: %ld", v5, 0xCu);
      OUTLINED_FUNCTION_1_0();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    BOOL v18 = sub_21DE3D9E0() == 0x6E456F4E5F6F7375 && v17 == 0xEC00000079746974;
    uint64_t v59 = v2;
    if (v18)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v19 = sub_21DE3E180();
      swift_bridgeObjectRelease();
      if ((v19 & 1) == 0) {
        goto LABEL_17;
      }
    }
    if ((sub_21DE34CD0(v2) & 1) == 0)
    {
      uint64_t v30 = sub_21DE3514C(v2);
      swift_bridgeObjectRelease();
      uint64_t v61 = v30;
      uint64_t v7 = (void *)sub_21DE3DAA0();
      os_log_type_t v31 = sub_21DE3DF60();
      if (OUTLINED_FUNCTION_5_6(v31))
      {
        uint64_t v32 = (_DWORD *)OUTLINED_FUNCTION_11_0();
        v60[0] = OUTLINED_FUNCTION_10_0();
        _DWORD *v32 = 136315138;
        OUTLINED_FUNCTION_0_5();
        uint64_t v33 = OUTLINED_FUNCTION_8_4();
        uint64_t v34 = swift_bridgeObjectRetain();
        uint64_t v35 = MEMORY[0x223C19670](v34, v33);
        unint64_t v37 = v36;
        swift_bridgeObjectRelease();
        sub_21DE2A150(v35, v37, v60);
        OUTLINED_FUNCTION_4_6();
        sub_21DE3DFC0();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_2_8(&dword_21DE16000, v38, v39, "uso_NoEntity entities: %s");
        swift_arrayDestroy();
        goto LABEL_21;
      }
LABEL_22:

      goto LABEL_23;
    }
LABEL_17:
    uint64_t v20 = sub_21DE35674(v2);
    swift_bridgeObjectRelease();
    uint64_t v61 = v20;
    uint64_t v7 = (void *)sub_21DE3DAA0();
    os_log_type_t v21 = sub_21DE3DF60();
    if (OUTLINED_FUNCTION_5_6(v21))
    {
      char v22 = (_DWORD *)OUTLINED_FUNCTION_11_0();
      v60[0] = OUTLINED_FUNCTION_10_0();
      *char v22 = 136315138;
      OUTLINED_FUNCTION_0_5();
      uint64_t v23 = OUTLINED_FUNCTION_8_4();
      uint64_t v24 = swift_bridgeObjectRetain();
      uint64_t v25 = MEMORY[0x223C19670](v24, v23);
      unint64_t v27 = v26;
      swift_bridgeObjectRelease();
      sub_21DE2A150(v25, v27, v60);
      OUTLINED_FUNCTION_4_6();
      sub_21DE3DFC0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_2_8(&dword_21DE16000, v28, v29, "all other non-uso_NoEntity typed entities: %s");
      swift_arrayDestroy();
LABEL_21:
      OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_1_0();
      goto LABEL_22;
    }
    goto LABEL_22;
  }
  uint64_t v6 = sub_21DE35A54();
  if (v6)
  {
    uint64_t v59 = (uint64_t)v6;
    uint64_t v61 = sub_21DE35674((uint64_t)v6);
    uint64_t v7 = (void *)sub_21DE3DAA0();
    os_log_type_t v8 = sub_21DE3DF60();
    if (OUTLINED_FUNCTION_5_6(v8))
    {
      uint64_t v9 = (_DWORD *)OUTLINED_FUNCTION_11_0();
      v60[0] = OUTLINED_FUNCTION_10_0();
      _DWORD *v9 = 136315138;
      OUTLINED_FUNCTION_0_5();
      uint64_t v10 = OUTLINED_FUNCTION_8_4();
      uint64_t v11 = swift_bridgeObjectRetain();
      uint64_t v12 = MEMORY[0x223C19670](v11, v10);
      unint64_t v14 = v13;
      swift_bridgeObjectRelease();
      sub_21DE2A150(v12, v14, v60);
      sub_21DE3DFC0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_2_8(&dword_21DE16000, v15, v16, "extractContextualMatcherIdentifiers entities: %s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_1_0();
    }
    goto LABEL_22;
  }
  uint64_t v59 = MEMORY[0x263F8EE78];
LABEL_23:
  uint64_t v40 = sub_21DE3DAA0();
  os_log_type_t v41 = sub_21DE3DF60();
  if (os_log_type_enabled(v40, v41))
  {
    uint64_t v42 = (uint8_t *)OUTLINED_FUNCTION_11_0();
    v60[0] = OUTLINED_FUNCTION_10_0();
    *(_DWORD *)uint64_t v42 = 136315138;
    swift_beginAccess();
    uint64_t v43 = OUTLINED_FUNCTION_8_4();
    uint64_t v44 = swift_bridgeObjectRetain();
    uint64_t v45 = MEMORY[0x223C19670](v44, v43);
    unint64_t v47 = v46;
    swift_bridgeObjectRelease();
    sub_21DE2A150(v45, v47, v60);
    OUTLINED_FUNCTION_7_6();
    sub_21DE3DFC0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21DE16000, v40, v41, "entities before mapping: %s", v42, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_1_0();
  }

  swift_retain();
  unint64_t v48 = swift_bridgeObjectRetain();
  uint64_t v49 = sub_21DE3296C(v48);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  swift_bridgeObjectRelease();
  uint64_t v61 = v49;
  sub_21DE361E8((unint64_t *)&v61, v59);
  swift_endAccess();
  swift_bridgeObjectRelease();
  uint64_t v50 = sub_21DE3DAA0();
  os_log_type_t v51 = sub_21DE3DF60();
  if (os_log_type_enabled(v50, v51))
  {
    uint64_t v52 = (uint8_t *)OUTLINED_FUNCTION_11_0();
    v60[0] = OUTLINED_FUNCTION_10_0();
    *(_DWORD *)uint64_t v52 = 136315138;
    uint64_t v53 = sub_21DE3DC80();
    uint64_t v54 = swift_bridgeObjectRetain();
    uint64_t v55 = MEMORY[0x223C19670](v54, v53);
    unint64_t v57 = v56;
    swift_bridgeObjectRelease();
    sub_21DE2A150(v55, v57, v60);
    OUTLINED_FUNCTION_7_6();
    sub_21DE3DFC0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21DE16000, v50, v51, "filterByMarrsIdentifiersResults: %s", v52, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_1_0();
  }

  return v61;
}

uint64_t sub_21DE33228(uint64_t a1)
{
  uint64_t v181 = sub_21DE3DB00();
  v164[0] = *(void *)(v181 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v181);
  v166 = (char *)v164 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  long long v180 = (char *)v164 - v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v184 = (char *)v164 - v6;
  uint64_t v190 = sub_21DE3D470();
  uint64_t v186 = *(void *)(v190 - 8);
  MEMORY[0x270FA5388](v190);
  v174 = (char *)v164 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v189 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32A10);
  MEMORY[0x270FA5388](v189);
  v194 = (void (*)(char *, unint64_t, uint64_t))((char *)v164 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32A08);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v179 = (uint64_t)v164 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v197 = (void (**)(char *, char *, uint64_t))((char *)v164 - v13);
  MEMORY[0x270FA5388](v12);
  unint64_t v196 = (unint64_t)v164 - v14;
  uint64_t v15 = sub_21DE3D4D0();
  uint64_t v192 = *(void *)(v15 - 8);
  uint64_t v193 = v15;
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v170 = (char *)v164 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v172 = (char *)v164 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  long long v183 = (char *)v164 - v21;
  MEMORY[0x270FA5388](v20);
  v195 = (char *)v164 - v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32BC0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21DE3ED20;
  *(void *)(inited + 32) = a1;
  unint64_t v200 = inited;
  sub_21DE3DEF0();
  unint64_t v24 = v200;
  unint64_t v204 = v200;
  uint64_t v171 = a1;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32B78);
  unint64_t v25 = MEMORY[0x263F8EE78];
  uint64_t v26 = sub_21DE3DD30();
  uint64_t v203 = sub_21DE38870((uint64_t)&unk_26CEBEAA8);
  unint64_t v199 = v203;
  if (!*(void *)(v203 + 16)) {
    goto LABEL_114;
  }
  if (v24 >> 62) {
    goto LABEL_113;
  }
  if (!*(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_114;
  }
  while (1)
  {
LABEL_4:
    unint64_t v27 = v24 >> 62;
    if (v24 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v29 = sub_21DE3E100();
      swift_bridgeObjectRelease();
      if (!v29) {
        goto LABEL_222;
      }
      swift_bridgeObjectRetain();
      uint64_t v30 = sub_21DE3E100();
      swift_bridgeObjectRelease();
      if (!v30) {
        goto LABEL_110;
      }
    }
    else if (!*(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_109:
      __break(1u);
LABEL_110:
      __break(1u);
LABEL_111:
      __break(1u);
      goto LABEL_112;
    }
    sub_21DE2E22C(0, (v24 & 0xC000000000000001) == 0, v24);
    if ((v24 & 0xC000000000000001) != 0)
    {
      uint64_t v198 = MEMORY[0x223C19800](0, v24);
      if (!v27)
      {
LABEL_8:
        uint64_t v28 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v198 = *(void *)(v24 + 32);
      swift_retain();
      if (!v27) {
        goto LABEL_8;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v28 = sub_21DE3E100();
    swift_bridgeObjectRelease();
LABEL_14:
    if (v28) {
      break;
    }
LABEL_112:
    __break(1u);
LABEL_113:
    swift_bridgeObjectRetain();
    uint64_t v77 = sub_21DE3E100();
    swift_bridgeObjectRelease();
    if (!v77) {
      goto LABEL_114;
    }
  }
  unint64_t v24 = (unint64_t)&v204;
  sub_21DE2FAF4(0, 1);
  unint64_t v31 = v199 + 56;
  uint64_t v32 = 1 << *(unsigned char *)(v199 + 32);
  if (v32 < 64) {
    uint64_t v33 = ~(-1 << v32);
  }
  else {
    uint64_t v33 = -1;
  }
  unint64_t v34 = v33 & *(void *)(v199 + 56);
  int64_t v35 = (unint64_t)(v32 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v36 = 0;
  uint64_t v188 = v31;
  int64_t v191 = v35;
  while (1)
  {
    if (v34)
    {
      unint64_t v37 = __clz(__rbit64(v34));
      v34 &= v34 - 1;
      unint64_t v38 = v37 | (v36 << 6);
      goto LABEL_35;
    }
    int64_t v39 = v36 + 1;
    if (__OFADD__(v36, 1))
    {
LABEL_104:
      __break(1u);
LABEL_105:
      __break(1u);
LABEL_106:
      __break(1u);
LABEL_107:
      __break(1u);
LABEL_108:
      __break(1u);
      goto LABEL_109;
    }
    if (v39 >= v35) {
      goto LABEL_53;
    }
    unint64_t v40 = *(void *)(v31 + 8 * v39);
    ++v36;
    if (!v40)
    {
      int64_t v36 = v39 + 1;
      if (v39 + 1 >= v35) {
        goto LABEL_53;
      }
      unint64_t v40 = *(void *)(v31 + 8 * v36);
      if (!v40)
      {
        int64_t v36 = v39 + 2;
        if (v39 + 2 >= v35) {
          goto LABEL_53;
        }
        unint64_t v40 = *(void *)(v31 + 8 * v36);
        if (!v40) {
          break;
        }
      }
    }
LABEL_34:
    unint64_t v34 = (v40 - 1) & v40;
    unint64_t v38 = __clz(__rbit64(v40)) + (v36 << 6);
LABEL_35:
    uint64_t v42 = (uint64_t *)(*(void *)(v199 + 48) + 16 * v38);
    uint64_t v44 = *v42;
    uint64_t v43 = v42[1];
    swift_bridgeObjectRetain();
    uint64_t v45 = sub_21DE3D9C0();
    if (*(void *)(v45 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v46 = sub_21DE2A8C0(v44, v43);
      unint64_t v47 = v25;
      if (v48)
      {
        unint64_t v47 = *(void *)(*(void *)(v45 + 56) + 8 * v46);
        swift_bridgeObjectRetain();
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      unint64_t v47 = v25;
    }
    swift_bridgeObjectRelease();
    if (v47 >> 62)
    {
      swift_bridgeObjectRetain();
      unint64_t v24 = sub_21DE3E100();
      swift_bridgeObjectRelease();
      if (!v24)
      {
LABEL_42:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        continue;
      }
    }
    else
    {
      unint64_t v24 = *(void *)((v47 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v24) {
        goto LABEL_42;
      }
    }
    sub_21DE38A40(v44, v43);
    swift_bridgeObjectRelease();
    swift_isUniquelyReferenced_nonNull_native();
    unint64_t v200 = v26;
    unint64_t v24 = v26;
    unint64_t v49 = sub_21DE2A8C0(v44, v43);
    uint64_t v51 = *(void *)(v26 + 16);
    BOOL v52 = (v50 & 1) == 0;
    uint64_t v26 = v51 + v52;
    if (__OFADD__(v51, v52)) {
      goto LABEL_107;
    }
    unint64_t v25 = v49;
    char v53 = v50;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32B90);
    unint64_t v24 = (unint64_t)&v200;
    char v54 = sub_21DE3E0E0();
    int64_t v35 = v191;
    if (v54)
    {
      unint64_t v24 = v200;
      unint64_t v55 = sub_21DE2A8C0(v44, v43);
      if ((v53 & 1) != (v56 & 1)) {
        goto LABEL_224;
      }
      unint64_t v25 = v55;
    }
    uint64_t v26 = v200;
    if (v53)
    {
      unint64_t v24 = *(void *)(v200 + 56);
      swift_bridgeObjectRelease();
      *(void *)(v24 + 8 * v25) = v47;
    }
    else
    {
      *(void *)(v200 + 8 * (v25 >> 6) + 64) |= 1 << v25;
      unint64_t v57 = (uint64_t *)(*(void *)(v26 + 48) + 16 * v25);
      *unint64_t v57 = v44;
      v57[1] = v43;
      *(void *)(*(void *)(v26 + 56) + 8 * v25) = v47;
      uint64_t v58 = *(void *)(v26 + 16);
      BOOL v59 = __OFADD__(v58, 1);
      uint64_t v60 = v58 + 1;
      if (v59) {
        goto LABEL_111;
      }
      *(void *)(v26 + 16) = v60;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v25 = MEMORY[0x263F8EE78];
    unint64_t v31 = v188;
  }
  int64_t v41 = v39 + 3;
  if (v41 < v35)
  {
    unint64_t v40 = *(void *)(v31 + 8 * v41);
    if (!v40)
    {
      while (1)
      {
        int64_t v36 = v41 + 1;
        if (__OFADD__(v41, 1)) {
          goto LABEL_106;
        }
        if (v36 >= v35) {
          goto LABEL_53;
        }
        unint64_t v40 = *(void *)(v31 + 8 * v36);
        ++v41;
        if (v40) {
          goto LABEL_34;
        }
      }
    }
    int64_t v36 = v41;
    goto LABEL_34;
  }
LABEL_53:
  swift_release();
  unint64_t v199 = v203;
  if (*(void *)(v203 + 16))
  {
    uint64_t v175 = v26;
    unint64_t v24 = v198;
    uint64_t v61 = sub_21DE3D9C0();
    uint64_t v26 = 0;
    uint64_t v62 = *(void *)(v61 + 64);
    uint64_t v188 = v61 + 64;
    uint64_t v63 = 1 << *(unsigned char *)(v61 + 32);
    if (v63 < 64) {
      uint64_t v64 = ~(-1 << v63);
    }
    else {
      uint64_t v64 = -1;
    }
    unint64_t v65 = v64 & v62;
    int64_t v191 = (unint64_t)(v63 + 63) >> 6;
    if ((v64 & v62) != 0)
    {
LABEL_58:
      unint64_t v66 = __clz(__rbit64(v65));
      v65 &= v65 - 1;
      unint64_t v67 = v66 | (v26 << 6);
      goto LABEL_75;
    }
    while (2)
    {
      int64_t v68 = v26 + 1;
      if (__OFADD__(v26, 1)) {
        goto LABEL_105;
      }
      if (v68 >= v191) {
        goto LABEL_95;
      }
      unint64_t v69 = *(void *)(v188 + 8 * v68);
      ++v26;
      if (!v69)
      {
        uint64_t v26 = v68 + 1;
        if (v68 + 1 >= v191) {
          goto LABEL_95;
        }
        unint64_t v69 = *(void *)(v188 + 8 * v26);
        if (!v69)
        {
          uint64_t v26 = v68 + 2;
          if (v68 + 2 >= v191) {
            goto LABEL_95;
          }
          unint64_t v69 = *(void *)(v188 + 8 * v26);
          if (!v69)
          {
            uint64_t v26 = v68 + 3;
            if (v68 + 3 >= v191) {
              goto LABEL_95;
            }
            unint64_t v69 = *(void *)(v188 + 8 * v26);
            if (!v69)
            {
              int64_t v70 = v68 + 4;
              if (v70 >= v191)
              {
LABEL_95:
                swift_release();
                swift_release();
                uint64_t v26 = v175;
                goto LABEL_97;
              }
              unint64_t v69 = *(void *)(v188 + 8 * v70);
              if (!v69)
              {
                while (1)
                {
                  uint64_t v26 = v70 + 1;
                  if (__OFADD__(v70, 1)) {
                    goto LABEL_108;
                  }
                  if (v26 >= v191) {
                    goto LABEL_95;
                  }
                  unint64_t v69 = *(void *)(v188 + 8 * v26);
                  ++v70;
                  if (v69) {
                    goto LABEL_74;
                  }
                }
              }
              uint64_t v26 = v70;
            }
          }
        }
      }
LABEL_74:
      unint64_t v65 = (v69 - 1) & v69;
      unint64_t v67 = __clz(__rbit64(v69)) + (v26 << 6);
LABEL_75:
      uint64_t v71 = *(void *)(*(void *)(v61 + 56) + 8 * v67);
      unint64_t v200 = v25;
      if ((unint64_t)v71 >> 62)
      {
        if (v71 < 0) {
          unint64_t v24 = v71;
        }
        else {
          unint64_t v24 = v71 & 0xFFFFFFFFFFFFFF8;
        }
        swift_bridgeObjectRetain_n();
        uint64_t v72 = sub_21DE3E100();
        if (!v72) {
          goto LABEL_92;
        }
LABEL_77:
        if (v72 < 1)
        {
          __break(1u);
          goto LABEL_104;
        }
        for (uint64_t i = 0; i != v72; ++i)
        {
          if ((v71 & 0xC000000000000001) != 0) {
            MEMORY[0x223C19800](i, v71);
          }
          else {
            swift_retain();
          }
          uint64_t v74 = sub_21DE3D990();
          uint64_t v75 = swift_release();
          if (v74)
          {
            MEMORY[0x223C19640](v75);
            if (*(void *)((v200 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v200 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_21DE3DF00();
            }
            sub_21DE3DF30();
            sub_21DE3DEF0();
          }
        }
        swift_bridgeObjectRelease();
        unint64_t v25 = v200;
      }
      else
      {
        uint64_t v72 = *(void *)((v71 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain_n();
        if (v72) {
          goto LABEL_77;
        }
LABEL_92:
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      unint64_t v24 = (unint64_t)&v204;
      sub_21DE2D570(v25);
      unint64_t v25 = MEMORY[0x263F8EE78];
      if (v65) {
        goto LABEL_58;
      }
      continue;
    }
  }
  swift_release();
LABEL_97:
  if (*(void *)(v199 + 16))
  {
    unint64_t v24 = v204;
    if (v204 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v76 = sub_21DE3E100();
      swift_bridgeObjectRelease();
      if (v76) {
        goto LABEL_4;
      }
    }
    else if (*(void *)((v204 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_4;
    }
  }
LABEL_114:
  if (!*(void *)(v26 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v78 = *(void *)(v26 + 64);
  uint64_t v168 = v26 + 64;
  uint64_t v202 = MEMORY[0x263F8EE88];
  uint64_t v79 = 1 << *(unsigned char *)(v26 + 32);
  uint64_t v80 = -1;
  if (v79 < 64) {
    uint64_t v80 = ~(-1 << v79);
  }
  unint64_t v81 = v80 & v78;
  v167 = &v187[OBJC_IVAR____TtC21SiriReferenceResolver10RRResolver_logger];
  int64_t v169 = (unint64_t)(v79 + 63) >> 6;
  uint64_t v198 = v192 + 16;
  LODWORD(v188) = *MEMORY[0x263F726E0];
  v187 = (char *)(v186 + 104);
  uint64_t v173 = (void (**)(char *, uint64_t, uint64_t))(v186 + 32);
  id v178 = (void (**)(uint64_t, uint64_t))(v186 + 8);
  v182 = (void (**)(char *, uint64_t))(v192 + 8);
  uint64_t v185 = (void (**)(unint64_t, char *, uint64_t))(v192 + 32);
  uint64_t v175 = v26;
  swift_bridgeObjectRetain();
  int64_t v82 = 0;
  *(void *)&long long v83 = 134218242;
  long long v165 = v83;
  v164[1] = MEMORY[0x263F8EE58] + 8;
  uint64_t v84 = v25;
  while (2)
  {
    uint64_t v85 = v193;
    uint64_t v186 = v84;
    if (v81)
    {
      uint64_t v177 = (v81 - 1) & v81;
      unint64_t v86 = __clz(__rbit64(v81)) | (v82 << 6);
    }
    else
    {
      int64_t v87 = v82 + 1;
      if (__OFADD__(v82, 1)) {
        goto LABEL_220;
      }
      if (v87 >= v169) {
        goto LABEL_191;
      }
      unint64_t v88 = *(void *)(v168 + 8 * v87);
      ++v82;
      if (!v88)
      {
        int64_t v82 = v87 + 1;
        if (v87 + 1 >= v169) {
          goto LABEL_191;
        }
        unint64_t v88 = *(void *)(v168 + 8 * v82);
        if (!v88)
        {
          int64_t v82 = v87 + 2;
          if (v87 + 2 >= v169) {
            goto LABEL_191;
          }
          unint64_t v88 = *(void *)(v168 + 8 * v82);
          if (!v88)
          {
            int64_t v89 = v87 + 3;
            if (v89 >= v169) {
              goto LABEL_191;
            }
            unint64_t v88 = *(void *)(v168 + 8 * v89);
            if (!v88)
            {
              while (1)
              {
                int64_t v82 = v89 + 1;
                if (__OFADD__(v89, 1)) {
                  goto LABEL_221;
                }
                if (v82 >= v169) {
                  break;
                }
                unint64_t v88 = *(void *)(v168 + 8 * v82);
                ++v89;
                if (v88) {
                  goto LABEL_133;
                }
              }
LABEL_191:
              swift_release();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v201 = v25;
              int64_t v191 = *(void *)(v84 + 16);
              if (!v191)
              {
LABEL_208:
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                uint64_t v159 = v201;
                swift_bridgeObjectRetain();
                os_log_type_t v160 = sub_21DE3DAA0();
                os_log_type_t v161 = sub_21DE3DF60();
                if (os_log_type_enabled(v160, v161))
                {
                  os_log_type_t v162 = (uint8_t *)swift_slowAlloc();
                  *(_DWORD *)os_log_type_t v162 = 134217984;
                  unint64_t v200 = *(void *)(v159 + 16);
                  sub_21DE3DFC0();
                  swift_bridgeObjectRelease();
                  _os_log_impl(&dword_21DE16000, v160, v161, "Found %ld marrs identifier(s) total", v162, 0xCu);
                  MEMORY[0x223C19EE0](v162, -1, -1);
                }
                else
                {

                  swift_bridgeObjectRelease();
                }
                swift_bridgeObjectRelease();
                swift_beginAccess();
                return v201;
              }
              unint64_t v138 = 0;
              unint64_t v189 = (*(unsigned __int8 *)(v192 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v192 + 80);
              uint64_t v190 = v84 + v189;
              v197 = (void (**)(char *, char *, uint64_t))(v164[0] + 16);
              unint64_t v199 = v164[0] + 8;
              while (2)
              {
                if (v138 >= *(void *)(v84 + 16)) {
                  goto LABEL_218;
                }
                v139 = *(char **)(v192 + 72);
                uint64_t v140 = *(void (**)(char *, unint64_t, uint64_t))(v192 + 16);
                v140(v172, v190 + (void)v139 * v138, v85);
                sub_21DE3D450();
                sub_21DE3D4B0();
                sub_21DE3DAD0();
                uint64_t v141 = v202;
                if (*(void *)(v202 + 16))
                {
                  v194 = v140;
                  v195 = v139;
                  unint64_t v196 = v138;
                  sub_21DE38E50(&qword_26AD32B48, MEMORY[0x263F74150]);
                  swift_bridgeObjectRetain();
                  uint64_t v142 = sub_21DE3DD40();
                  uint64_t v143 = -1 << *(unsigned char *)(v141 + 32);
                  unint64_t v144 = v142 & ~v143;
                  if ((*(void *)(v141 + 56 + ((v144 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v144))
                  {
                    uint64_t v145 = ~v143;
                    uint64_t v146 = *(void *)(v164[0] + 72);
                    v147 = *(void (**)(char *, unint64_t, uint64_t))(v164[0] + 16);
                    while (1)
                    {
                      os_log_type_t v148 = v180;
                      uint64_t v149 = v181;
                      v147(v180, *(void *)(v141 + 48) + v146 * v144, v181);
                      sub_21DE38E50(&qword_267D22460, MEMORY[0x263F74150]);
                      char v150 = sub_21DE3DD60();
                      uint64_t v151 = *(void (**)(char *, uint64_t))v199;
                      (*(void (**)(char *, uint64_t))v199)(v148, v149);
                      if (v150) {
                        break;
                      }
                      unint64_t v144 = (v144 + 1) & v145;
                      if (((*(void *)(v141 + 56 + ((v144 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v144) & 1) == 0) {
                        goto LABEL_199;
                      }
                    }
                    swift_bridgeObjectRelease();
                    v151(v184, v181);
                    uint64_t v85 = v193;
                    uint64_t v84 = v186;
                    unint64_t v138 = v196;
LABEL_205:
                    ++v138;
                    (*v182)(v172, v85);
                    if (v138 == v191) {
                      goto LABEL_208;
                    }
                    continue;
                  }
LABEL_199:
                  swift_bridgeObjectRelease();
                  uint64_t v84 = v186;
                  v139 = v195;
                  unint64_t v138 = v196;
                  uint64_t v140 = v194;
                }
                break;
              }
              v140(v170, (unint64_t)v172, v193);
              uint64_t v152 = v201;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v152 = sub_21DE22640(0, *(void *)(v152 + 16) + 1, 1, v152);
              }
              unint64_t v154 = *(void *)(v152 + 16);
              unint64_t v153 = *(void *)(v152 + 24);
              if (v154 >= v153 >> 1) {
                uint64_t v152 = sub_21DE22640(v153 > 1, v154 + 1, 1, v152);
              }
              *(void *)(v152 + 16) = v154 + 1;
              uint64_t v85 = v193;
              (*v185)(v152 + v189 + v154 * (void)v139, v170, v193);
              uint64_t v201 = v152;
              uint64_t v155 = v184;
              uint64_t v156 = v181;
              (*v197)(v166, v184, v181);
              id v157 = v180;
              sub_21DE1C1EC();
              uint64_t v158 = *(void (**)(char *, uint64_t))v199;
              (*(void (**)(char *, uint64_t))v199)(v157, v156);
              v158(v155, v156);
              goto LABEL_205;
            }
            int64_t v82 = v89;
          }
        }
      }
LABEL_133:
      uint64_t v177 = (v88 - 1) & v88;
      unint64_t v86 = __clz(__rbit64(v88)) + (v82 << 6);
    }
    int64_t v176 = v82;
    uint64_t v90 = (uint64_t *)(*(void *)(v175 + 48) + 16 * v86);
    uint64_t v92 = *v90;
    unint64_t v91 = v90[1];
    unint64_t v93 = *(void *)(*(void *)(v175 + 56) + 8 * v86);
    if (v93 >> 62)
    {
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t v94 = sub_21DE3E100();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v94 = *(void *)((v93 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    if (v94 < 2)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t v95 = sub_21DE3DAA0();
      os_log_type_t v96 = sub_21DE3DF70();
      if (os_log_type_enabled(v95, v96))
      {
        uint64_t v97 = swift_slowAlloc();
        uint64_t v98 = swift_slowAlloc();
        unint64_t v200 = v98;
        *(_DWORD *)uint64_t v97 = v165;
        swift_bridgeObjectRelease();
        *(void *)(v97 + 4) = v94;
        swift_bridgeObjectRelease();
        *(_WORD *)(v97 + 12) = 2080;
        swift_bridgeObjectRetain();
        *(void *)(v97 + 14) = sub_21DE2A150(v92, v91, (uint64_t *)&v200);
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_21DE16000, v95, v96, "Input uso entity has %ld child nodes for edge %s, but SRR only expects exact 1 from MARRS", (uint8_t *)v97, 0x16u);
        swift_arrayDestroy();
        uint64_t v99 = v98;
        uint64_t v84 = v186;
        MEMORY[0x223C19EE0](v99, -1, -1);
        MEMORY[0x223C19EE0](v97, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();

        swift_bridgeObjectRelease_n();
      }
    }
    unint64_t v25 = MEMORY[0x263F8EE78];
    if ((v93 & 0xC000000000000001) != 0)
    {
      MEMORY[0x223C19800](0, v93);
    }
    else
    {
      if (!*(void *)((v93 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_214;
      }
      swift_retain();
    }
    swift_bridgeObjectRelease();
    uint64_t v100 = sub_21DE3D980();
    swift_release();
    if (sub_21DE3D9E0() == 0x6E456F4E5F6F7375 && v101 == 0xEC00000079746974)
    {
      swift_bridgeObjectRelease();
      goto LABEL_170;
    }
    char v103 = sub_21DE3E180();
    swift_bridgeObjectRelease();
    if (v103)
    {
LABEL_170:
      uint64_t v126 = *(void *)(v100 + 16);
      int64_t v127 = *(void *)(v84 + 16);
      int64_t v128 = v127 + v126;
      if (__OFADD__(v127, v126)) {
        goto LABEL_215;
      }
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || v128 > *(void *)(v84 + 24) >> 1)
      {
        if (v127 <= v128) {
          int64_t v130 = v127 + v126;
        }
        else {
          int64_t v130 = v127;
        }
        uint64_t v84 = sub_21DE22640(isUniquelyReferenced_nonNull_native, v130, 1, v84);
      }
      unint64_t v81 = v177;
      if (*(void *)(v100 + 16))
      {
        uint64_t v131 = *(void *)(v84 + 16);
        if ((*(void *)(v84 + 24) >> 1) - v131 < v126) {
          goto LABEL_217;
        }
        unint64_t v132 = (*(unsigned __int8 *)(v192 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v192 + 80);
        uint64_t v133 = *(void *)(v192 + 72);
        unint64_t v134 = v84 + v132 + v133 * v131;
        if (v100 + v132 < v134 + v133 * v126 && v134 < v100 + v132 + v133 * v126) {
          goto LABEL_223;
        }
        swift_arrayInitWithCopy();
        if (v126)
        {
          uint64_t v136 = *(void *)(v84 + 16);
          BOOL v59 = __OFADD__(v136, v126);
          uint64_t v137 = v136 + v126;
          if (v59) {
            goto LABEL_219;
          }
          *(void *)(v84 + 16) = v137;
        }
      }
      else if (v126)
      {
        goto LABEL_216;
      }
      swift_bridgeObjectRelease();
      int64_t v82 = v176;
      continue;
    }
    break;
  }
  unint64_t v200 = v25;
  int64_t v191 = *(void *)(v100 + 16);
  if (!v191)
  {
    uint64_t v125 = v25;
LABEL_169:
    swift_bridgeObjectRelease();
    uint64_t v100 = v125;
    goto LABEL_170;
  }
  unint64_t v104 = 0;
  uint64_t v105 = v193;
  while (v104 < *(void *)(v100 + 16))
  {
    uint64_t v106 = *(void *)(v192 + 72);
    uint64_t v107 = v100;
    unint64_t v199 = (*(unsigned __int8 *)(v192 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v192 + 80);
    (*(void (**)(char *, unint64_t, uint64_t))(v192 + 16))(v195, v100 + v199 + v106 * v104, v105);
    uint64_t v108 = v196;
    sub_21DE3D480();
    uint64_t v109 = v197;
    uint64_t v110 = v190;
    (*(void (**)(void, void, uint64_t))v187)(v197, v188, v190);
    __swift_storeEnumTagSinglePayload((uint64_t)v109, 0, 1, v110);
    uint64_t v111 = (uint64_t)v194;
    uint64_t v112 = (uint64_t)v194 + *(int *)(v189 + 48);
    sub_21DE38D8C(v108, (uint64_t)v194);
    sub_21DE38D8C((uint64_t)v109, v112);
    if (__swift_getEnumTagSinglePayload(v111, 1, v110) == 1)
    {
      int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v112, 1, v110);
      uint64_t v105 = v193;
      if (EnumTagSinglePayload == 1)
      {
        sub_21DE38DF4((uint64_t)v194, &qword_26AD32A08);
        sub_21DE38DF4((uint64_t)v197, &qword_26AD32A08);
        sub_21DE38DF4(v196, &qword_26AD32A08);
        uint64_t v100 = v107;
LABEL_160:
        uint64_t v120 = *v185;
        (*v185)((unint64_t)v183, v195, v105);
        uint64_t v121 = v200;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_21DE36ED0(0, *(void *)(v121 + 16) + 1, 1);
          uint64_t v105 = v193;
          uint64_t v121 = v200;
        }
        unint64_t v122 = v199;
        unint64_t v124 = *(void *)(v121 + 16);
        unint64_t v123 = *(void *)(v121 + 24);
        if (v124 >= v123 >> 1)
        {
          sub_21DE36ED0(v123 > 1, v124 + 1, 1);
          uint64_t v105 = v193;
          uint64_t v121 = v200;
        }
        *(void *)(v121 + 16) = v124 + 1;
        v120(v121 + v122 + v124 * v106, v183, v105);
        unint64_t v200 = v121;
        uint64_t v84 = v186;
        goto LABEL_165;
      }
      goto LABEL_157;
    }
    uint64_t v114 = v179;
    sub_21DE38D8C(v111, v179);
    if (__swift_getEnumTagSinglePayload(v112, 1, v110) == 1)
    {
      (*v178)(v114, v110);
      uint64_t v105 = v193;
LABEL_157:
      sub_21DE38DF4((uint64_t)v194, &qword_26AD32A10);
      sub_21DE38DF4((uint64_t)v197, &qword_26AD32A08);
      sub_21DE38DF4(v196, &qword_26AD32A08);
      uint64_t v100 = v107;
      goto LABEL_158;
    }
    uint64_t v115 = v174;
    (*v173)(v174, v112, v110);
    sub_21DE38E50(&qword_267D22608, MEMORY[0x263F726F0]);
    uint64_t v116 = v110;
    char v117 = sub_21DE3DD60();
    uint64_t v118 = *v178;
    (*v178)(v114, v116);
    uint64_t v119 = v115;
    uint64_t v84 = v186;
    v118((uint64_t)v119, v116);
    sub_21DE38DF4(v111, &qword_26AD32A08);
    sub_21DE38DF4((uint64_t)v197, &qword_26AD32A08);
    sub_21DE38DF4(v196, &qword_26AD32A08);
    uint64_t v105 = v193;
    uint64_t v100 = v107;
    if (v117) {
      goto LABEL_160;
    }
LABEL_158:
    (*v182)(v195, v105);
LABEL_165:
    if (v191 == ++v104)
    {
      uint64_t v125 = v200;
      unint64_t v25 = MEMORY[0x263F8EE78];
      goto LABEL_169;
    }
  }
  __break(1u);
LABEL_214:
  __break(1u);
LABEL_215:
  __break(1u);
LABEL_216:
  __break(1u);
LABEL_217:
  __break(1u);
LABEL_218:
  __break(1u);
LABEL_219:
  __break(1u);
LABEL_220:
  __break(1u);
LABEL_221:
  __break(1u);
LABEL_222:
  __break(1u);
LABEL_223:
  sub_21DE3E110();
  __break(1u);
LABEL_224:
  uint64_t result = sub_21DE3E1A0();
  __break(1u);
  return result;
}

uint64_t sub_21DE34CD0(uint64_t a1)
{
  uint64_t v2 = sub_21DE3D470();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v27 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32A10);
  MEMORY[0x270FA5388](v33);
  uint64_t v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32A08);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v30 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v25 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v25 - v13;
  uint64_t v15 = *(void *)(a1 + 16);
  if (!v15) {
    return 0;
  }
  uint64_t v16 = *(void *)(sub_21DE3D4D0() - 8);
  uint64_t v17 = a1 + ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80));
  unsigned int v32 = *MEMORY[0x263F726E0];
  uint64_t v18 = (void (**)(char *, void, uint64_t))(v3 + 104);
  uint64_t v26 = (void (**)(char *, uint64_t, uint64_t))(v3 + 32);
  uint64_t v29 = (void (**)(uint64_t, uint64_t))(v3 + 8);
  uint64_t v31 = *(void *)(v16 + 72);
  v25[1] = a1;
  swift_bridgeObjectRetain();
  uint64_t v19 = (uint64_t)v30;
  while (1)
  {
    sub_21DE3D480();
    (*v18)(v12, v32, v2);
    __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v2);
    uint64_t v20 = (uint64_t)&v6[*(int *)(v33 + 48)];
    sub_21DE38D8C((uint64_t)v14, (uint64_t)v6);
    sub_21DE38D8C((uint64_t)v12, v20);
    if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v2) == 1) {
      break;
    }
    sub_21DE38D8C((uint64_t)v6, v19);
    if (__swift_getEnumTagSinglePayload(v20, 1, v2) == 1)
    {
      sub_21DE38DF4((uint64_t)v12, &qword_26AD32A08);
      sub_21DE38DF4((uint64_t)v14, &qword_26AD32A08);
      (*v29)(v19, v2);
      goto LABEL_8;
    }
    uint64_t v21 = v27;
    (*v26)(v27, v20, v2);
    sub_21DE38E50(&qword_267D22608, MEMORY[0x263F726F0]);
    int v28 = sub_21DE3DD60();
    uint64_t v22 = *v29;
    (*v29)((uint64_t)v21, v2);
    sub_21DE38DF4((uint64_t)v12, &qword_26AD32A08);
    sub_21DE38DF4((uint64_t)v14, &qword_26AD32A08);
    v22((uint64_t)v30, v2);
    uint64_t v19 = (uint64_t)v30;
    sub_21DE38DF4((uint64_t)v6, &qword_26AD32A08);
    if (v28) {
      goto LABEL_13;
    }
LABEL_10:
    v17 += v31;
    if (!--v15)
    {
      uint64_t v23 = 0;
      goto LABEL_14;
    }
  }
  sub_21DE38DF4((uint64_t)v12, &qword_26AD32A08);
  sub_21DE38DF4((uint64_t)v14, &qword_26AD32A08);
  if (__swift_getEnumTagSinglePayload(v20, 1, v2) != 1)
  {
LABEL_8:
    sub_21DE38DF4((uint64_t)v6, &qword_26AD32A10);
    goto LABEL_10;
  }
  sub_21DE38DF4((uint64_t)v6, &qword_26AD32A08);
LABEL_13:
  uint64_t v23 = 1;
LABEL_14:
  swift_bridgeObjectRelease();
  return v23;
}

uint64_t sub_21DE3514C(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32A08);
  MEMORY[0x270FA5388](v3 - 8);
  unint64_t v47 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_21DE3D4D0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v38 - v10;
  uint64_t v39 = v1;
  uint64_t v12 = sub_21DE3DAA0();
  os_log_type_t v13 = sub_21DE3DF50();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = v11;
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_21DE16000, v12, v13, "Query with UsoNoEntity pathway", v15, 2u);
    uint64_t v16 = v15;
    uint64_t v11 = v14;
    MEMORY[0x223C19EE0](v16, -1, -1);
  }

  uint64_t v17 = *(void *)(a1 + 16);
  if (v17)
  {
    unint64_t v44 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    unint64_t v18 = a1 + v44;
    uint64_t v19 = *(void *)(v6 + 72);
    uint64_t v42 = (void (**)(char *, char *, uint64_t))(v6 + 16);
    uint64_t v43 = v19;
    unint64_t v40 = (void (**)(char *, uint64_t))(v6 + 8);
    int64_t v41 = (void (**)(unint64_t, char *, uint64_t))(v6 + 32);
    swift_bridgeObjectRetain();
    uint64_t v45 = v9;
    uint64_t v46 = v5;
    do
    {
      uint64_t v51 = v17;
      uint64_t v52 = sub_21DE3D4B0();
      uint64_t v53 = v20;
      swift_bridgeObjectRetain();
      sub_21DE3DE00();
      swift_bridgeObjectRelease();
      uint64_t v49 = v53;
      uint64_t v50 = v52;
      uint64_t v48 = sub_21DE3D450();
      sub_21DE3D4C0();
      sub_21DE3D460();
      sub_21DE3D480();
      uint64_t v22 = v45;
      uint64_t v21 = v46;
      sub_21DE3D490();
      (*v42)(v22, v11, v21);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        a1 = sub_21DE22640(0, *(void *)(a1 + 16) + 1, 1, a1);
      }
      unint64_t v24 = *(void *)(a1 + 16);
      unint64_t v23 = *(void *)(a1 + 24);
      if (v24 >= v23 >> 1) {
        a1 = sub_21DE22640(v23 > 1, v24 + 1, 1, a1);
      }
      *(void *)(a1 + 16) = v24 + 1;
      uint64_t v25 = v43;
      (*v41)(a1 + v44 + v24 * v43, v22, v21);
      (*v40)(v11, v21);
      v18 += v25;
      uint64_t v17 = v51 - 1;
    }
    while (v51 != 1);
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  uint64_t v26 = swift_bridgeObjectRetain();
  unint64_t v27 = sub_21DE35674(v26);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v52 = MEMORY[0x263F8EE78];
  if (!(v27 >> 62))
  {
    uint64_t v29 = *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v29) {
      goto LABEL_14;
    }
LABEL_28:
    swift_bridgeObjectRelease();
    uint64_t v37 = MEMORY[0x263F8EE78];
LABEL_29:
    swift_bridgeObjectRelease();
    return v37;
  }
  swift_bridgeObjectRetain();
  uint64_t v29 = sub_21DE3E100();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v29) {
    goto LABEL_28;
  }
LABEL_14:
  if (v29 >= 1)
  {
    uint64_t v51 = a1;
    for (uint64_t i = 0; i != v29; ++i)
    {
      if ((v27 & 0xC000000000000001) != 0) {
        id v31 = (id)MEMORY[0x223C19800](i, v27);
      }
      else {
        id v31 = *(id *)(v27 + 8 * i + 32);
      }
      unsigned int v32 = v31;
      sub_21DE3DB80();
      uint64_t v33 = sub_21DE3D9E0();
      uint64_t v35 = v34;
      swift_release();
      if (v33 == 0xD000000000000011 && v35 == 0x800000021DE3FB50)
      {

        swift_bridgeObjectRelease();
      }
      else
      {
        char v36 = sub_21DE3E180();
        swift_bridgeObjectRelease();
        if (v36)
        {
        }
        else
        {
          sub_21DE3E0A0();
          sub_21DE3E0C0();
          sub_21DE3E0D0();
          sub_21DE3E0B0();
        }
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v37 = v52;
    goto LABEL_29;
  }
  __break(1u);
  return result;
}

uint64_t sub_21DE35674(uint64_t a1)
{
  uint64_t v2 = sub_21DE3DB00();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = MEMORY[0x263F8EE78];
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    uint64_t v7 = *(void *)(sub_21DE3D4D0() - 8);
    uint64_t v8 = a1 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    uint64_t v9 = *(void *)(v7 + 72);
    v25[1] = a1;
    swift_bridgeObjectRetain();
    do
    {
      sub_21DE3D450();
      sub_21DE3D4B0();
      sub_21DE3DAD0();
      uint64_t v10 = sub_21DE36720((uint64_t)v5);
      if (v10)
      {
        uint64_t v11 = v10;
        MEMORY[0x223C19640]();
        if (*(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_21DE3DF00();
        }
        sub_21DE3DF30();
        sub_21DE3DEF0();
      }
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      v8 += v9;
      --v6;
    }
    while (v6);
    swift_bridgeObjectRelease();
    uint64_t v12 = sub_21DE3DAA0();
    os_log_type_t v13 = sub_21DE3DF60();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      v26[0] = v15;
      *(_DWORD *)uint64_t v14 = 136315138;
      swift_beginAccess();
      uint64_t v16 = sub_21DE3DC80();
      uint64_t v17 = swift_bridgeObjectRetain();
      uint64_t v18 = MEMORY[0x223C19670](v17, v16);
      unint64_t v20 = v19;
      swift_bridgeObjectRelease();
      void v25[2] = sub_21DE2A150(v18, v20, v26);
      sub_21DE3DFC0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21DE16000, v12, v13, "queryByMARRSSpans entities: %s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C19EE0](v15, -1, -1);
      MEMORY[0x223C19EE0](v14, -1, -1);
    }

    swift_beginAccess();
    return v27;
  }
  else
  {
    uint64_t v22 = sub_21DE3DAA0();
    os_log_type_t v23 = sub_21DE3DF60();
    if (os_log_type_enabled(v22, v23))
    {
      unint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v24 = 0;
      _os_log_impl(&dword_21DE16000, v22, v23, "usoIdentifiers are empty", v24, 2u);
      MEMORY[0x223C19EE0](v24, -1, -1);
    }

    return MEMORY[0x263F8EE78];
  }
}

uint64_t *sub_21DE35A54()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_21DE3D470();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v40 = (char *)v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32A10);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32A08);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)v38 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v38 - v15;
  uint64_t v56 = sub_21DE3D4D0();
  uint64_t v54 = *(void *)(v56 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v56);
  unint64_t v47 = (char *)v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  unint64_t v55 = (char *)v38 - v19;
  uint64_t v20 = sub_21DE3D9C0();
  unint64_t v21 = sub_21DE28204(1701667182, 0xE400000000000000, v20);
  swift_bridgeObjectRelease();
  if (!v21) {
    return 0;
  }
  if (v21 >> 62) {
    goto LABEL_29;
  }
  if (!*(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_30:
    swift_bridgeObjectRelease();
    return 0;
  }
  while (1)
  {
    v38[1] = v1;
    sub_21DE2E22C(0, (v21 & 0xC000000000000001) == 0, v21);
    uint64_t v45 = v16;
    if ((v21 & 0xC000000000000001) != 0)
    {
      uint64_t v22 = MEMORY[0x223C19800](0, v21);
    }
    else
    {
      uint64_t v22 = *(void *)(v21 + 32);
      swift_retain();
    }
    swift_bridgeObjectRelease();
    v38[0] = v22;
    unint64_t v21 = v22;
    uint64_t v23 = sub_21DE3D980();
    unint64_t v24 = (uint64_t *)MEMORY[0x263F8EE78];
    unint64_t v57 = (uint64_t *)MEMORY[0x263F8EE78];
    uint64_t v53 = *(void *)(v23 + 16);
    if (!v53) {
      break;
    }
    unint64_t v1 = 0;
    uint64_t v51 = v54 + 16;
    uint64_t v50 = (void (**)(char *, void, uint64_t))(v3 + 104);
    unsigned int v49 = *MEMORY[0x263F726C0];
    uint64_t v39 = (void (**)(char *, uint64_t, uint64_t))(v3 + 32);
    uint64_t v43 = (void (**)(char *, uint64_t))(v3 + 8);
    unint64_t v44 = (void (**)(char *, uint64_t))(v54 + 8);
    uint64_t v46 = (void (**)(char *, char *, uint64_t))(v54 + 32);
    uint64_t v48 = v11;
    uint64_t v16 = v45;
    uint64_t v41 = v5;
    uint64_t v52 = v23;
    while (v1 < *(void *)(v23 + 16))
    {
      unint64_t v25 = (*(unsigned __int8 *)(v54 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80);
      uint64_t v3 = *(void *)(v54 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v54 + 16))(v55, v23 + v25 + v3 * v1, v56);
      sub_21DE3D480();
      (*v50)(v14, v49, v2);
      __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v2);
      uint64_t v26 = (uint64_t)&v7[*(int *)(v5 + 48)];
      sub_21DE38D8C((uint64_t)v16, (uint64_t)v7);
      sub_21DE38D8C((uint64_t)v14, v26);
      if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v2) == 1)
      {
        if (__swift_getEnumTagSinglePayload(v26, 1, v2) == 1)
        {
          sub_21DE38DF4((uint64_t)v7, &qword_26AD32A08);
          sub_21DE38DF4((uint64_t)v14, &qword_26AD32A08);
          sub_21DE38DF4((uint64_t)v16, &qword_26AD32A08);
LABEL_16:
          uint64_t v30 = *v46;
          (*v46)(v47, v55, v56);
          unint64_t v21 = (unint64_t)v57;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_21DE36ED0(0, *(void *)(v21 + 16) + 1, 1);
            unint64_t v21 = (unint64_t)v57;
          }
          unint64_t v32 = *(void *)(v21 + 16);
          unint64_t v31 = *(void *)(v21 + 24);
          if (v32 >= v31 >> 1)
          {
            sub_21DE36ED0(v31 > 1, v32 + 1, 1);
            unint64_t v21 = (unint64_t)v57;
          }
          *(void *)(v21 + 16) = v32 + 1;
          v30((char *)(v21 + v25 + v32 * v3), v47, v56);
          unint64_t v57 = (uint64_t *)v21;
          uint64_t v5 = v41;
          uint64_t v11 = v48;
          uint64_t v16 = v45;
          goto LABEL_22;
        }
        goto LABEL_14;
      }
      sub_21DE38D8C((uint64_t)v7, (uint64_t)v11);
      if (__swift_getEnumTagSinglePayload(v26, 1, v2) == 1)
      {
        (*v43)(v11, v2);
LABEL_14:
        sub_21DE38DF4((uint64_t)v7, &qword_26AD32A10);
        unint64_t v21 = (unint64_t)&qword_26AD32A08;
        sub_21DE38DF4((uint64_t)v14, &qword_26AD32A08);
        sub_21DE38DF4((uint64_t)v16, &qword_26AD32A08);
        goto LABEL_21;
      }
      uint64_t v27 = v40;
      (*v39)(v40, v26, v2);
      sub_21DE38E50(&qword_267D22608, MEMORY[0x263F726F0]);
      int v42 = sub_21DE3DD60();
      int v28 = *v43;
      (*v43)(v48, v2);
      uint64_t v29 = v27;
      uint64_t v16 = v45;
      v28(v29, v2);
      uint64_t v11 = v48;
      unint64_t v21 = (unint64_t)&qword_26AD32A08;
      sub_21DE38DF4((uint64_t)v7, &qword_26AD32A08);
      sub_21DE38DF4((uint64_t)v14, &qword_26AD32A08);
      sub_21DE38DF4((uint64_t)v16, &qword_26AD32A08);
      if (v42) {
        goto LABEL_16;
      }
LABEL_21:
      (*v44)(v55, v56);
LABEL_22:
      ++v1;
      uint64_t v23 = v52;
      if (v53 == v1)
      {
        unint64_t v24 = v57;
        goto LABEL_24;
      }
    }
    __break(1u);
LABEL_29:
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_21DE3E100();
    swift_bridgeObjectRelease();
    if (!v36) {
      goto LABEL_30;
    }
  }
LABEL_24:
  swift_bridgeObjectRelease();
  swift_retain();
  uint64_t v33 = sub_21DE3DAA0();
  os_log_type_t v34 = sub_21DE3DF60();
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v35 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v35 = 134217984;
    unint64_t v57 = (uint64_t *)v24[2];
    sub_21DE3DFC0();
    swift_release();
    _os_log_impl(&dword_21DE16000, v33, v34, "Found %ld csm uso identifier(s).", v35, 0xCu);
    MEMORY[0x223C19EE0](v35, -1, -1);
  }
  else
  {
    swift_release();
  }

  swift_release();
  return v24;
}

uint64_t sub_21DE361E8(unint64_t *a1, uint64_t a2)
{
  uint64_t v61 = sub_21DE3DB00();
  uint64_t v50 = *(void *)(v61 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v61);
  uint64_t v57 = (uint64_t)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v46 - v6;
  uint64_t v8 = sub_21DE3D4D0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v60 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v56 = (char *)&v46 - v12;
  uint64_t v13 = sub_21DE3DAA0();
  os_log_type_t v14 = sub_21DE3DF50();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_21DE16000, v13, v14, "Sorting Marrs results with marrs and then saliency scores", v15, 2u);
    MEMORY[0x223C19EE0](v15, -1, -1);
  }

  sub_21DE38E50(&qword_26AD32B48, MEMORY[0x263F74150]);
  uint64_t v63 = sub_21DE3DD30();
  uint64_t v16 = *(void *)(a2 + 16);
  if (v16)
  {
    uint64_t v46 = a2;
    unint64_t v47 = a1;
    uint64_t v54 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
    uint64_t v55 = v9 + 16;
    uint64_t v17 = (char *)(a2 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)));
    uint64_t v58 = (void (**)(uint64_t, char *, uint64_t))(v50 + 16);
    uint64_t v18 = *(void *)(v9 + 72);
    uint64_t v48 = (void (**)(unint64_t, char *, uint64_t))(v9 + 40);
    unsigned int v49 = (void (**)(unint64_t, char *, uint64_t))(v9 + 32);
    uint64_t v51 = (void (**)(char *, uint64_t))(v9 + 8);
    uint64_t v52 = (void (**)(uint64_t, uint64_t))(v50 + 8);
    swift_bridgeObjectRetain();
    uint64_t v19 = v56;
    uint64_t v20 = v57;
    uint64_t v53 = v18;
    while (1)
    {
      uint64_t v59 = v16;
      unint64_t v21 = v17;
      uint64_t v22 = v17;
      uint64_t v23 = v20;
      unint64_t v24 = v54;
      v54(v19, v22, v8);
      sub_21DE3D450();
      sub_21DE3D4B0();
      sub_21DE3DAD0();
      uint64_t v25 = v8;
      uint64_t v26 = *v58;
      (*v58)(v23, v7, v61);
      uint64_t v27 = v25;
      v24(v60, v19, v25);
      uint64_t v28 = v63;
      swift_isUniquelyReferenced_nonNull_native();
      uint64_t v62 = v28;
      uint64_t v63 = 0x8000000000000000;
      unint64_t v29 = sub_21DE2A9F8(v23);
      if (__OFADD__(*(void *)(v28 + 16), (v30 & 1) == 0)) {
        break;
      }
      unint64_t v31 = v29;
      char v32 = v30;
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D22610);
      char v33 = sub_21DE3E0E0();
      uint64_t v20 = v57;
      if (v33)
      {
        unint64_t v34 = sub_21DE2A9F8(v57);
        if ((v32 & 1) != (v35 & 1)) {
          goto LABEL_18;
        }
        unint64_t v31 = v34;
      }
      uint64_t v36 = (void *)v62;
      if (v32)
      {
        unint64_t v37 = *(void *)(v62 + 56) + v31 * v53;
        uint64_t v38 = v53;
        uint64_t v8 = v27;
        (*v48)(v37, v60, v27);
      }
      else
      {
        *(void *)(v62 + 8 * (v31 >> 6) + 64) |= 1 << v31;
        v26(v36[6] + *(void *)(v50 + 72) * v31, (char *)v20, v61);
        unint64_t v39 = v36[7] + v31 * v53;
        uint64_t v38 = v53;
        uint64_t v8 = v27;
        (*v49)(v39, v60, v27);
        uint64_t v40 = v36[2];
        BOOL v41 = __OFADD__(v40, 1);
        uint64_t v42 = v40 + 1;
        if (v41) {
          goto LABEL_17;
        }
        v36[2] = v42;
      }
      uint64_t v63 = v62;
      swift_bridgeObjectRelease();
      uint64_t v43 = *v52;
      uint64_t v44 = v61;
      (*v52)(v20, v61);
      v43((uint64_t)v7, v44);
      uint64_t v19 = v56;
      (*v51)(v56, v8);
      uint64_t v17 = &v21[v38];
      uint64_t v16 = v59 - 1;
      if (v59 == 1)
      {
        swift_bridgeObjectRelease();
        a1 = v47;
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    uint64_t result = sub_21DE3E1A0();
    __break(1u);
  }
  else
  {
LABEL_15:
    sub_21DE36E40(a1, &v63);
    return swift_bridgeObjectRelease();
  }
  return result;
}

char *sub_21DE36720(uint64_t a1)
{
  uint64_t v31 = sub_21DE3DB00();
  uint64_t v3 = *(char **)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (uint64_t *)(v1 + OBJC_IVAR____TtC21SiriReferenceResolver10RRResolver_entities);
  swift_beginAccess();
  uint64_t v7 = *v6;
  if ((unint64_t)*v6 >> 62)
  {
LABEL_26:
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_21DE3E100();
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
    {
LABEL_3:
      uint64_t v28 = (void (**)(char *, uint64_t, uint64_t))(v3 + 16);
      unint64_t v29 = (void (**)(char *, uint64_t))(v3 + 8);
      unint64_t v30 = v7 & 0xC000000000000001;
      uint64_t v9 = 4;
      do
      {
        if (v30) {
          uint64_t v10 = (char *)MEMORY[0x223C19800](v9 - 4, v7);
        }
        else {
          uint64_t v10 = (char *)*(id *)(v7 + 8 * v9);
        }
        uint64_t v3 = v10;
        uint64_t v11 = v9 - 3;
        if (__OFADD__(v9 - 4, 1))
        {
          __break(1u);
          goto LABEL_26;
        }
        uint64_t v12 = sub_21DE3DAE0();
        uint64_t v13 = a1;
        uint64_t v15 = v14;
        if (v12 == sub_21DE3DBB0() && v15 == v16)
        {
          swift_bridgeObjectRelease_n();
          (*v28)(v5, v13, v31);
          a1 = v13;
        }
        else
        {
          char v18 = sub_21DE3E180();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          (*v28)(v5, v13, v31);
          a1 = v13;
          if ((v18 & 1) == 0)
          {
            (*v29)(v5, v31);
            goto LABEL_20;
          }
        }
        uint64_t v19 = a1;
        uint64_t v20 = sub_21DE3DAF0();
        uint64_t v22 = v21;
        if (v20 == sub_21DE3DC00() && v22 == v23)
        {
          swift_bridgeObjectRelease_n();
          (*v29)(v5, v31);
LABEL_23:
          swift_bridgeObjectRelease();
          return v3;
        }
        char v25 = sub_21DE3E180();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        (*v29)(v5, v31);
        a1 = v19;
        if (v25) {
          goto LABEL_23;
        }
LABEL_20:

        ++v9;
      }
      while (v11 != v8);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

BOOL sub_21DE36A38(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = sub_21DE3D4D0();
  uint64_t v41 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32A18);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v38 - v13;
  uint64_t v15 = sub_21DE3DB00();
  uint64_t v45 = *(void *)(v15 - 8);
  uint64_t v46 = v15;
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v43 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v38 - v18;
  uint64_t v20 = *a1;
  uint64_t v42 = *a2;
  sub_21DE3DBB0();
  uint64_t v40 = v20;
  sub_21DE3DC00();
  sub_21DE3DAD0();
  uint64_t v44 = a3;
  sub_21DE283F0((uint64_t)v19, *a3, (uint64_t)v14);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v14, 1, v6);
  unint64_t v39 = v8;
  if (EnumTagSinglePayload)
  {
    sub_21DE38DF4((uint64_t)v14, &qword_26AD32A18);
    double v22 = 0.0;
    uint64_t v23 = v41;
  }
  else
  {
    uint64_t v23 = v41;
    (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v8, v14, v6);
    sub_21DE38DF4((uint64_t)v14, &qword_26AD32A18);
    double v24 = COERCE_DOUBLE(sub_21DE3D460());
    char v26 = v25;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v6);
    if (v26) {
      double v22 = 0.0;
    }
    else {
      double v22 = v24;
    }
  }
  sub_21DE3DBB0();
  sub_21DE3DC00();
  uint64_t v27 = (uint64_t)v43;
  sub_21DE3DAD0();
  sub_21DE283F0(v27, *v44, (uint64_t)v12);
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v6))
  {
    sub_21DE38DF4((uint64_t)v12, &qword_26AD32A18);
  }
  else
  {
    uint64_t v28 = v39;
    (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v39, v12, v6);
    sub_21DE38DF4((uint64_t)v12, &qword_26AD32A18);
    double v29 = COERCE_DOUBLE(sub_21DE3D460());
    char v31 = v30;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v28, v6);
    if ((v31 & 1) == 0)
    {
      double v32 = v29;
      if (v22 != v29) {
        goto LABEL_14;
      }
      goto LABEL_12;
    }
  }
  if (v22 != 0.0)
  {
    double v32 = 0.0;
    goto LABEL_14;
  }
LABEL_12:
  sub_21DE3DC30();
  double v22 = v33;
  sub_21DE3DC30();
LABEL_14:
  BOOL v34 = v32 < v22;
  uint64_t v35 = v46;
  uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v45 + 8);
  v36(v27, v46);
  v36((uint64_t)v19, v35);
  return v34;
}

uint64_t sub_21DE36E40(unint64_t *a1, uint64_t *a2)
{
  unint64_t v4 = *a1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *a1 = v4;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v4 & 0x8000000000000000) != 0
    || (v4 & 0x4000000000000000) != 0)
  {
    sub_21DE3D024(v4);
    unint64_t v4 = v6;
    *a1 = v6;
  }
  uint64_t v7 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v9[0] = (v4 & 0xFFFFFFFFFFFFFF8) + 32;
  v9[1] = v7;
  sub_21DE3708C(v9, a2);
  return sub_21DE3DEF0();
}

size_t sub_21DE36ED0(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_21DE36EF0(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

size_t sub_21DE36EF0(size_t result, int64_t a2, char a3, uint64_t a4)
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
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D22500);
  uint64_t v10 = *(void *)(sub_21DE3D4D0() - 8);
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
  uint64_t v15 = *(void *)(sub_21DE3D4D0() - 8);
  unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v17 = (unint64_t)v13 + v16;
  unint64_t v18 = a4 + v16;
  if (v5)
  {
    sub_21DE2E3B4(v18, v8, v17);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_21DE2E510(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

void sub_21DE3708C(uint64_t *a1, uint64_t *a2)
{
  v210 = a2;
  uint64_t v209 = sub_21DE3D4D0();
  uint64_t v198 = *(void *)(v209 - 8);
  MEMORY[0x270FA5388](v209);
  unint64_t v200 = (char *)&v184 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32A18);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v202 = (char *)&v184 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v201 = (char *)&v184 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  int64_t v191 = (char *)&v184 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v190 = (char *)&v184 - v11;
  uint64_t v204 = sub_21DE3DB00();
  uint64_t v12 = *(void *)(v204 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v204);
  uint64_t v15 = (char *)&v184 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  unint64_t v18 = (char *)&v184 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  v194 = (char *)&v184 - v20;
  MEMORY[0x270FA5388](v19);
  double v22 = (char *)&v184 - v21;
  uint64_t v188 = a1;
  uint64_t v23 = a1[1];
  uint64_t v24 = sub_21DE3E140();
  if (v24 >= v23)
  {
    if (v23 < 0) {
      goto LABEL_179;
    }
    if (v23) {
      sub_21DE38048(0, v23, 1, v188, v210);
    }
    return;
  }
  uint64_t v25 = v24;
  uint64_t v26 = sub_21DE2E254(v23 / 2);
  unint64_t v196 = v27;
  uint64_t v213 = v26;
  uint64_t v192 = v23;
  if (v23 <= 0) {
    goto LABEL_141;
  }
  uint64_t v187 = v25;
  v208 = v18;
  uint64_t v28 = 0;
  uint64_t v29 = *v188;
  v207 = (void (**)(char *, uint64_t, uint64_t))(v198 + 16);
  unint64_t v199 = (void (**)(char *, uint64_t))(v198 + 8);
  uint64_t v203 = (void (**)(uint64_t, uint64_t))(v12 + 8);
  uint64_t v186 = v29 - 8;
  char v30 = (char *)MEMORY[0x263F8EE78];
  uint64_t v31 = v192;
  uint64_t v205 = v29;
  v206 = v15;
  uint64_t v32 = v209;
  while (1)
  {
    uint64_t v33 = (uint64_t)v28;
    uint64_t v34 = (uint64_t)v28 + 1;
    uint64_t v193 = v33;
    if (v34 >= v31) {
      goto LABEL_45;
    }
    uint64_t v35 = *(void **)(v29 + 8 * v34);
    v211 = *(void **)(v29 + 8 * v33);
    uint64_t v36 = v211;
    v212 = v35;
    uint64_t v37 = v33;
    id v38 = v35;
    id v39 = v36;
    uint64_t v40 = v197;
    LODWORD(v189) = sub_21DE36A38((uint64_t *)&v212, (uint64_t *)&v211, v210);
    uint64_t v197 = v40;
    if (v40)
    {
      swift_bridgeObjectRelease();

LABEL_139:
      if (v192 >= -1)
      {
LABEL_156:
        *(void *)((v213 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
        sub_21DE3DEF0();
        swift_bridgeObjectRelease();
        return;
      }
      __break(1u);
LABEL_141:
      char v30 = (char *)MEMORY[0x263F8EE78];
      unint64_t v124 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_142:
      if (v124 >= 2)
      {
        uint64_t v177 = *v188;
        uint64_t v178 = v197;
        do
        {
          unint64_t v179 = v124 - 2;
          if (v124 < 2) {
            goto LABEL_174;
          }
          if (!v177) {
            goto LABEL_188;
          }
          uint64_t v180 = *(void *)&v30[16 * v179 + 32];
          uint64_t v181 = *(void *)&v30[16 * v124 + 24];
          sub_21DE385C4((char *)(v177 + 8 * v180), (char *)(v177 + 8 * *(void *)&v30[16 * v124 + 16]), v177 + 8 * v181, v196, v210);
          if (v178) {
            goto LABEL_138;
          }
          if (v181 < v180) {
            goto LABEL_175;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            char v30 = sub_21DE2F304((uint64_t)v30);
          }
          if (v179 >= *((void *)v30 + 2)) {
            goto LABEL_176;
          }
          v182 = &v30[16 * v179 + 32];
          *(void *)v182 = v180;
          *((void *)v182 + 1) = v181;
          unint64_t v183 = *((void *)v30 + 2);
          if (v124 > v183) {
            goto LABEL_177;
          }
          memmove(&v30[16 * v124 + 16], &v30[16 * v124 + 32], 16 * (v183 - v124));
          *((void *)v30 + 2) = v183 - 1;
          unint64_t v124 = v183 - 1;
        }
        while (v183 > 2);
      }
      swift_bridgeObjectRelease();
      if (v192 < -1) {
        goto LABEL_184;
      }
      goto LABEL_156;
    }

    uint64_t v31 = v192;
    uint64_t v34 = v37 + 2;
    uint64_t v29 = v205;
    if (v37 + 2 >= v192) {
      goto LABEL_35;
    }
    while (1)
    {
      uint64_t v41 = v29 + 8 * v37;
      uint64_t v42 = *(void **)(v41 + 8);
      uint64_t v43 = (void **)*(id *)(v41 + 16);
      id v44 = v42;
      sub_21DE3DBB0();
      v195 = v43;
      sub_21DE3DC00();
      sub_21DE3DAD0();
      uint64_t v45 = *v210;
      if (*(void *)(*v210 + 16))
      {
        unint64_t v46 = sub_21DE2A9F8((uint64_t)v22);
        uint64_t v47 = (uint64_t)v190;
        if (v48)
        {
          (*(void (**)(char *, unint64_t, uint64_t))(v198 + 16))(v190, *(void *)(v45 + 56) + *(void *)(v198 + 72) * v46, v32);
          uint64_t v49 = 0;
        }
        else
        {
          uint64_t v49 = 1;
        }
      }
      else
      {
        uint64_t v49 = 1;
        uint64_t v47 = (uint64_t)v190;
      }
      __swift_storeEnumTagSinglePayload(v47, v49, 1, v32);
      if (__swift_getEnumTagSinglePayload(v47, 1, v32))
      {
        sub_21DE38DF4(v47, &qword_26AD32A18);
        double v50 = 0.0;
      }
      else
      {
        uint64_t v51 = v200;
        (*v207)(v200, v47, v32);
        sub_21DE38DF4(v47, &qword_26AD32A18);
        double v52 = COERCE_DOUBLE(sub_21DE3D460());
        char v54 = v53;
        (*v199)(v51, v32);
        double v50 = (v54 & 1) != 0 ? 0.0 : v52;
      }
      sub_21DE3DBB0();
      sub_21DE3DC00();
      uint64_t v55 = (uint64_t)v194;
      sub_21DE3DAD0();
      uint64_t v56 = *v210;
      if (*(void *)(*v210 + 16))
      {
        unint64_t v57 = sub_21DE2A9F8(v55);
        uint64_t v58 = (uint64_t)v191;
        if (v59)
        {
          (*(void (**)(char *, unint64_t, uint64_t))(v198 + 16))(v191, *(void *)(v56 + 56) + *(void *)(v198 + 72) * v57, v32);
          uint64_t v60 = 0;
        }
        else
        {
          uint64_t v60 = 1;
        }
      }
      else
      {
        uint64_t v60 = 1;
        uint64_t v58 = (uint64_t)v191;
      }
      __swift_storeEnumTagSinglePayload(v58, v60, 1, v32);
      if (__swift_getEnumTagSinglePayload(v58, 1, v32))
      {
        sub_21DE38DF4(v58, &qword_26AD32A18);
      }
      else
      {
        uint64_t v61 = v200;
        (*v207)(v200, v58, v32);
        sub_21DE38DF4(v58, &qword_26AD32A18);
        double v62 = COERCE_DOUBLE(sub_21DE3D460());
        char v64 = v63;
        unint64_t v65 = v61;
        uint64_t v55 = (uint64_t)v194;
        (*v199)(v65, v32);
        if ((v64 & 1) == 0)
        {
          double v66 = v62;
          unint64_t v67 = v195;
          if (v50 == v62) {
            goto LABEL_28;
          }
          goto LABEL_30;
        }
      }
      unint64_t v67 = v195;
      if (v50 == 0.0)
      {
LABEL_28:
        int64_t v68 = v67;
        sub_21DE3DC30();
        double v70 = v69;
        sub_21DE3DC30();
        BOOL v72 = v71 < v70;
        goto LABEL_31;
      }
      double v66 = 0.0;
LABEL_30:
      BOOL v72 = v66 < v50;
      int64_t v68 = v195;
LABEL_31:
      uint64_t v73 = *v203;
      uint64_t v74 = v55;
      uint64_t v75 = v204;
      (*v203)(v74, v204);
      v73((uint64_t)v22, v75);

      if ((v189 ^ v72)) {
        break;
      }
      uint64_t v76 = v37 + 3;
      ++v37;
      uint64_t v31 = v192;
      uint64_t v29 = v205;
      uint64_t v32 = v209;
      if (v76 >= v192)
      {
        uint64_t v34 = v192;
        goto LABEL_35;
      }
    }
    uint64_t v34 = v37 + 2;
    uint64_t v31 = v192;
    uint64_t v29 = v205;
    uint64_t v32 = v209;
LABEL_35:
    if ((v189 & 1) == 0)
    {
      uint64_t v33 = v193;
      goto LABEL_45;
    }
    uint64_t v33 = v193;
    if (v34 < v193) {
      goto LABEL_183;
    }
    if (v193 < v34)
    {
      uint64_t v77 = (uint64_t *)(v186 + 8 * v34);
      uint64_t v78 = v34;
      uint64_t v79 = v193;
      uint64_t v80 = (uint64_t *)(v29 + 8 * v193);
      do
      {
        if (v79 != --v78)
        {
          if (!v29) {
            goto LABEL_187;
          }
          uint64_t v81 = *v80;
          *uint64_t v80 = *v77;
          *uint64_t v77 = v81;
        }
        ++v79;
        --v77;
        ++v80;
      }
      while (v79 < v78);
    }
LABEL_45:
    if (v34 < v31)
    {
      if (__OFSUB__(v34, v33)) {
        goto LABEL_180;
      }
      if (v34 - v33 < v187) {
        break;
      }
    }
LABEL_85:
    if (v34 < v33) {
      goto LABEL_178;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      char v30 = sub_21DE2F20C(0, *((void *)v30 + 2) + 1, 1, v30);
    }
    unint64_t v123 = *((void *)v30 + 2);
    unint64_t v122 = *((void *)v30 + 3);
    unint64_t v124 = v123 + 1;
    uint64_t v29 = v205;
    if (v123 >= v122 >> 1)
    {
      int64_t v176 = sub_21DE2F20C((char *)(v122 > 1), v123 + 1, 1, v30);
      uint64_t v29 = v205;
      char v30 = v176;
    }
    *((void *)v30 + 2) = v124;
    uint64_t v125 = v30 + 32;
    uint64_t v126 = &v30[16 * v123 + 32];
    *(void *)uint64_t v126 = v193;
    *((void *)v126 + 1) = v34;
    v195 = (void **)v34;
    if (v123)
    {
      while (1)
      {
        unint64_t v127 = v124 - 1;
        if (v124 >= 4)
        {
          unint64_t v132 = &v125[16 * v124];
          uint64_t v133 = *((void *)v132 - 8);
          uint64_t v134 = *((void *)v132 - 7);
          BOOL v138 = __OFSUB__(v134, v133);
          uint64_t v135 = v134 - v133;
          if (v138) {
            goto LABEL_163;
          }
          uint64_t v137 = *((void *)v132 - 6);
          uint64_t v136 = *((void *)v132 - 5);
          BOOL v138 = __OFSUB__(v136, v137);
          uint64_t v130 = v136 - v137;
          char v131 = v138;
          if (v138) {
            goto LABEL_164;
          }
          unint64_t v139 = v124 - 2;
          uint64_t v140 = &v125[16 * v124 - 32];
          uint64_t v142 = *(void *)v140;
          uint64_t v141 = *((void *)v140 + 1);
          BOOL v138 = __OFSUB__(v141, v142);
          uint64_t v143 = v141 - v142;
          if (v138) {
            goto LABEL_165;
          }
          BOOL v138 = __OFADD__(v130, v143);
          uint64_t v144 = v130 + v143;
          if (v138) {
            goto LABEL_167;
          }
          if (v144 >= v135)
          {
            os_log_type_t v162 = &v125[16 * v127];
            uint64_t v164 = *(void *)v162;
            uint64_t v163 = *((void *)v162 + 1);
            BOOL v138 = __OFSUB__(v163, v164);
            uint64_t v165 = v163 - v164;
            if (v138) {
              goto LABEL_173;
            }
            BOOL v155 = v130 < v165;
            goto LABEL_122;
          }
        }
        else
        {
          if (v124 != 3)
          {
            uint64_t v156 = *((void *)v30 + 4);
            uint64_t v157 = *((void *)v30 + 5);
            BOOL v138 = __OFSUB__(v157, v156);
            uint64_t v149 = v157 - v156;
            char v150 = v138;
            goto LABEL_116;
          }
          uint64_t v129 = *((void *)v30 + 4);
          uint64_t v128 = *((void *)v30 + 5);
          BOOL v138 = __OFSUB__(v128, v129);
          uint64_t v130 = v128 - v129;
          char v131 = v138;
        }
        if (v131) {
          goto LABEL_166;
        }
        unint64_t v139 = v124 - 2;
        uint64_t v145 = &v125[16 * v124 - 32];
        uint64_t v147 = *(void *)v145;
        uint64_t v146 = *((void *)v145 + 1);
        BOOL v148 = __OFSUB__(v146, v147);
        uint64_t v149 = v146 - v147;
        char v150 = v148;
        if (v148) {
          goto LABEL_168;
        }
        uint64_t v151 = &v125[16 * v127];
        uint64_t v153 = *(void *)v151;
        uint64_t v152 = *((void *)v151 + 1);
        BOOL v138 = __OFSUB__(v152, v153);
        uint64_t v154 = v152 - v153;
        if (v138) {
          goto LABEL_170;
        }
        if (__OFADD__(v149, v154)) {
          goto LABEL_172;
        }
        if (v149 + v154 >= v130)
        {
          BOOL v155 = v130 < v154;
LABEL_122:
          if (v155) {
            unint64_t v127 = v139;
          }
          goto LABEL_124;
        }
LABEL_116:
        if (v150) {
          goto LABEL_169;
        }
        uint64_t v158 = &v125[16 * v127];
        uint64_t v160 = *(void *)v158;
        uint64_t v159 = *((void *)v158 + 1);
        BOOL v138 = __OFSUB__(v159, v160);
        uint64_t v161 = v159 - v160;
        if (v138) {
          goto LABEL_171;
        }
        if (v161 < v149) {
          goto LABEL_133;
        }
LABEL_124:
        v166 = v22;
        unint64_t v167 = v127 - 1;
        if (v127 - 1 >= v124)
        {
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
LABEL_178:
          __break(1u);
LABEL_179:
          __break(1u);
LABEL_180:
          __break(1u);
LABEL_181:
          __break(1u);
          goto LABEL_182;
        }
        if (!v29) {
          goto LABEL_186;
        }
        uint64_t v168 = v30;
        int64_t v169 = &v125[16 * v167];
        uint64_t v170 = *(void *)v169;
        uint64_t v171 = v125;
        uint64_t v172 = &v125[16 * v127];
        uint64_t v173 = *((void *)v172 + 1);
        uint64_t v174 = v197;
        sub_21DE385C4((char *)(v29 + 8 * *(void *)v169), (char *)(v29 + 8 * *(void *)v172), v29 + 8 * v173, v196, v210);
        uint64_t v197 = v174;
        if (v174)
        {
LABEL_138:
          swift_bridgeObjectRelease();
          goto LABEL_139;
        }
        if (v173 < v170) {
          goto LABEL_160;
        }
        if (v127 > *((void *)v168 + 2)) {
          goto LABEL_161;
        }
        *(void *)int64_t v169 = v170;
        *(void *)&v171[16 * v167 + 8] = v173;
        unint64_t v175 = *((void *)v168 + 2);
        if (v127 >= v175) {
          goto LABEL_162;
        }
        char v30 = v168;
        unint64_t v124 = v175 - 1;
        memmove(v172, v172 + 16, 16 * (v175 - 1 - v127));
        uint64_t v125 = v171;
        *((void *)v168 + 2) = v175 - 1;
        BOOL v155 = v175 > 2;
        double v22 = v166;
        uint64_t v29 = v205;
        uint64_t v32 = v209;
        if (!v155) {
          goto LABEL_133;
        }
      }
    }
    unint64_t v124 = 1;
LABEL_133:
    uint64_t v31 = v192;
    uint64_t v28 = v195;
    if ((uint64_t)v195 >= v192) {
      goto LABEL_142;
    }
  }
  if (__OFADD__(v33, v187)) {
    goto LABEL_181;
  }
  if (v33 + v187 >= v31) {
    uint64_t v82 = v31;
  }
  else {
    uint64_t v82 = v33 + v187;
  }
  if (v82 >= v33)
  {
    if (v34 == v82) {
      goto LABEL_85;
    }
    uint64_t v184 = v22;
    uint64_t v185 = v30;
    long long v83 = (void **)(v186 + 8 * v34);
    uint64_t v189 = v82;
    while (1)
    {
      uint64_t v84 = *(void **)(v29 + 8 * v34);
      uint64_t v85 = v33;
      v195 = v83;
      while (1)
      {
        unint64_t v86 = *v83;
        id v87 = v84;
        id v88 = v86;
        sub_21DE3DBB0();
        sub_21DE3DC00();
        uint64_t v89 = (uint64_t)v208;
        sub_21DE3DAD0();
        uint64_t v90 = *v210;
        if (!*(void *)(*v210 + 16)) {
          goto LABEL_59;
        }
        unint64_t v91 = sub_21DE2A9F8(v89);
        if (v92)
        {
          unint64_t v93 = *(void *)(v90 + 56) + *(void *)(v198 + 72) * v91;
          uint64_t v94 = (uint64_t)v201;
          uint64_t v95 = v209;
          (*(void (**)(char *, unint64_t, uint64_t))(v198 + 16))(v201, v93, v209);
          uint64_t v96 = 0;
        }
        else
        {
LABEL_59:
          uint64_t v96 = 1;
          uint64_t v94 = (uint64_t)v201;
          uint64_t v95 = v209;
        }
        __swift_storeEnumTagSinglePayload(v94, v96, 1, v95);
        if (__swift_getEnumTagSinglePayload(v94, 1, v95))
        {
          sub_21DE38DF4(v94, &qword_26AD32A18);
          double v97 = 0.0;
        }
        else
        {
          uint64_t v98 = v200;
          (*v207)(v200, v94, v95);
          sub_21DE38DF4(v94, &qword_26AD32A18);
          double v99 = COERCE_DOUBLE(sub_21DE3D460());
          char v101 = v100;
          (*v199)(v98, v95);
          double v97 = (v101 & 1) != 0 ? 0.0 : v99;
        }
        sub_21DE3DBB0();
        sub_21DE3DC00();
        uint64_t v102 = (uint64_t)v206;
        sub_21DE3DAD0();
        uint64_t v103 = *v210;
        if (*(void *)(*v210 + 16))
        {
          unint64_t v104 = sub_21DE2A9F8(v102);
          uint64_t v105 = v209;
          if (v106)
          {
            unint64_t v107 = *(void *)(v103 + 56) + *(void *)(v198 + 72) * v104;
            uint64_t v108 = (uint64_t)v202;
            (*(void (**)(char *, unint64_t, uint64_t))(v198 + 16))(v202, v107, v209);
            uint64_t v109 = 0;
          }
          else
          {
            uint64_t v109 = 1;
            uint64_t v108 = (uint64_t)v202;
          }
        }
        else
        {
          uint64_t v109 = 1;
          uint64_t v108 = (uint64_t)v202;
          uint64_t v105 = v209;
        }
        __swift_storeEnumTagSinglePayload(v108, v109, 1, v105);
        if (__swift_getEnumTagSinglePayload(v108, 1, v105))
        {
          sub_21DE38DF4(v108, &qword_26AD32A18);
        }
        else
        {
          uint64_t v110 = v200;
          (*v207)(v200, v108, v105);
          sub_21DE38DF4(v108, &qword_26AD32A18);
          double v111 = COERCE_DOUBLE(sub_21DE3D460());
          char v113 = v112;
          uint64_t v114 = v110;
          uint64_t v102 = (uint64_t)v206;
          (*v199)(v114, v105);
          if ((v113 & 1) == 0)
          {
            double v115 = v111;
            if (v97 == v111) {
              goto LABEL_76;
            }
            goto LABEL_78;
          }
        }
        if (v97 == 0.0)
        {
LABEL_76:
          sub_21DE3DC30();
          double v97 = v116;
          sub_21DE3DC30();
          goto LABEL_78;
        }
        double v115 = 0.0;
LABEL_78:
        BOOL v117 = v115 < v97;
        uint64_t v118 = *v203;
        uint64_t v119 = v102;
        uint64_t v120 = v204;
        (*v203)(v119, v204);
        v118((uint64_t)v208, v120);

        if (!v117) {
          break;
        }
        uint64_t v29 = v205;
        if (!v205) {
          goto LABEL_185;
        }
        uint64_t v121 = *v83;
        uint64_t v84 = v83[1];
        *long long v83 = v84;
        v83[1] = v121;
        --v83;
        if (v34 == ++v85) {
          goto LABEL_83;
        }
      }
      uint64_t v29 = v205;
LABEL_83:
      ++v34;
      long long v83 = v195 + 1;
      uint64_t v33 = v193;
      if (v34 == v189)
      {
        uint64_t v34 = v189;
        char v30 = v185;
        double v22 = v184;
        uint64_t v32 = v209;
        goto LABEL_85;
      }
    }
  }
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
}

void sub_21DE38048(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v74 = a5;
  uint64_t v60 = a1;
  uint64_t v8 = sub_21DE3D4D0();
  uint64_t v62 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  char v64 = (char *)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32A18);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  int64_t v68 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  double v66 = (char *)&v58 - v13;
  uint64_t v67 = sub_21DE3DB00();
  uint64_t v14 = MEMORY[0x270FA5388](v67);
  BOOL v72 = (char *)&v58 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v73 = (char *)&v58 - v17;
  uint64_t v59 = a2;
  if (a3 == a2) {
    return;
  }
  uint64_t v18 = *a4;
  double v71 = (void (**)(char *, uint64_t, uint64_t))(v62 + 16);
  char v63 = (void (**)(char *, uint64_t))(v62 + 8);
  unint64_t v65 = (void (**)(uint64_t, uint64_t))(v16 + 8);
  uint64_t v69 = v18;
  uint64_t v19 = v18 + 8 * a3 - 8;
  while (2)
  {
    uint64_t v20 = *(void **)(v69 + 8 * a3);
    uint64_t v21 = v60;
    uint64_t v61 = v19;
    uint64_t v70 = a3;
    do
    {
      uint64_t v22 = v8;
      uint64_t v23 = *(void **)v19;
      id v24 = v20;
      id v25 = v23;
      sub_21DE3DBB0();
      sub_21DE3DC00();
      uint64_t v26 = (uint64_t)v73;
      sub_21DE3DAD0();
      uint64_t v27 = *v74;
      if (*(void *)(*v74 + 16) && (unint64_t v28 = sub_21DE2A9F8(v26), (v29 & 1) != 0))
      {
        unint64_t v30 = *(void *)(v27 + 56) + *(void *)(v62 + 72) * v28;
        uint64_t v31 = (uint64_t)v66;
        uint64_t v8 = v22;
        (*(void (**)(char *, unint64_t, uint64_t))(v62 + 16))(v66, v30, v22);
        uint64_t v32 = 0;
      }
      else
      {
        uint64_t v32 = 1;
        uint64_t v8 = v22;
        uint64_t v31 = (uint64_t)v66;
      }
      __swift_storeEnumTagSinglePayload(v31, v32, 1, v8);
      if (__swift_getEnumTagSinglePayload(v31, 1, v8))
      {
        sub_21DE38DF4(v31, &qword_26AD32A18);
        double v33 = 0.0;
      }
      else
      {
        uint64_t v34 = v64;
        (*v71)(v64, v31, v8);
        sub_21DE38DF4(v31, &qword_26AD32A18);
        double v35 = COERCE_DOUBLE(sub_21DE3D460());
        char v37 = v36;
        (*v63)(v34, v8);
        if (v37) {
          double v33 = 0.0;
        }
        else {
          double v33 = v35;
        }
      }
      sub_21DE3DBB0();
      sub_21DE3DC00();
      uint64_t v38 = (uint64_t)v72;
      sub_21DE3DAD0();
      uint64_t v39 = *v74;
      if (*(void *)(*v74 + 16) && (unint64_t v40 = sub_21DE2A9F8(v38), (v41 & 1) != 0))
      {
        unint64_t v42 = *(void *)(v39 + 56) + *(void *)(v62 + 72) * v40;
        uint64_t v43 = (uint64_t)v68;
        (*(void (**)(char *, unint64_t, uint64_t))(v62 + 16))(v68, v42, v8);
        uint64_t v44 = 0;
      }
      else
      {
        uint64_t v44 = 1;
        uint64_t v43 = (uint64_t)v68;
      }
      __swift_storeEnumTagSinglePayload(v43, v44, 1, v8);
      if (__swift_getEnumTagSinglePayload(v43, 1, v8))
      {
        sub_21DE38DF4(v43, &qword_26AD32A18);
      }
      else
      {
        uint64_t v45 = v64;
        (*v71)(v64, v43, v8);
        sub_21DE38DF4(v43, &qword_26AD32A18);
        double v46 = COERCE_DOUBLE(sub_21DE3D460());
        char v48 = v47;
        uint64_t v49 = v45;
        uint64_t v38 = (uint64_t)v72;
        (*v63)(v49, v8);
        if ((v48 & 1) == 0)
        {
          double v50 = v46;
          if (v33 != v46) {
            goto LABEL_25;
          }
          goto LABEL_23;
        }
      }
      if (v33 != 0.0)
      {
        double v50 = 0.0;
        goto LABEL_25;
      }
LABEL_23:
      sub_21DE3DC30();
      double v33 = v51;
      sub_21DE3DC30();
LABEL_25:
      BOOL v52 = v50 < v33;
      char v53 = *v65;
      uint64_t v54 = v38;
      uint64_t v55 = v67;
      (*v65)(v54, v67);
      v53((uint64_t)v73, v55);

      uint64_t v56 = v70;
      if (!v52) {
        break;
      }
      if (!v69)
      {
        __break(1u);
        return;
      }
      unint64_t v57 = *(void **)v19;
      uint64_t v20 = *(void **)(v19 + 8);
      *(void *)uint64_t v19 = v20;
      *(void *)(v19 + 8) = v57;
      v19 -= 8;
      ++v21;
    }
    while (v56 != v21);
    a3 = v56 + 1;
    uint64_t v19 = v61 + 8;
    if (a3 != v59) {
      continue;
    }
    break;
  }
}

uint64_t sub_21DE385C4(char *a1, char *a2, unint64_t a3, char *a4, uint64_t *a5)
{
  uint64_t v6 = v5;
  uint64_t v7 = a4;
  uint64_t v9 = a1;
  uint64_t v10 = a2 - a1;
  uint64_t v11 = (a2 - a1) / 8;
  uint64_t v12 = a3 - (void)a2;
  uint64_t v13 = (uint64_t)(a3 - (void)a2) / 8;
  if (v11 >= v13)
  {
    sub_21DE2E3B0(a2, (uint64_t)(a3 - (void)a2) / 8, a4);
    uint64_t v17 = a2;
    uint64_t v15 = &v7[8 * v13];
    if (v9 >= a2 || v12 < 8)
    {
LABEL_41:
      sub_21DE2E3B0(v7, (v15 - v7) / 8, v17);
      return 1;
    }
    uint64_t v45 = v7;
    uint64_t v20 = (char *)(a3 - 8);
    uint64_t v44 = v9;
    while (1)
    {
      unint64_t v21 = (unint64_t)v15;
      uint64_t v22 = v15 - 8;
      id v48 = (id)*((void *)v15 - 1);
      uint64_t v23 = v17;
      id v25 = v17 - 8;
      char v47 = (void *)*((void *)v17 - 1);
      id v24 = v47;
      id v26 = v48;
      id v27 = v24;
      BOOL v28 = sub_21DE36A38((uint64_t *)&v48, (uint64_t *)&v47, a5);
      if (v5)
      {

        sub_21DE2E3B0(v45, (uint64_t)(v21 - (void)v45) / 8, v23);
        return 1;
      }
      BOOL v29 = v28;
      unint64_t v30 = v20 + 8;

      if (v29)
      {
        BOOL v31 = v30 != v23 || v20 >= v23;
        uint64_t v17 = v25;
        uint64_t v15 = (char *)v21;
        if (v31) {
          goto LABEL_25;
        }
      }
      else
      {
        BOOL v32 = v30 != (char *)v21 || (unint64_t)v20 >= v21;
        id v25 = v22;
        uint64_t v15 = v22;
        uint64_t v17 = v23;
        if (v32) {
LABEL_25:
        }
          *(void *)uint64_t v20 = *(void *)v25;
      }
      if (v17 <= v44)
      {
        uint64_t v7 = v45;
        goto LABEL_41;
      }
      v20 -= 8;
      uint64_t v7 = v45;
      if (v15 <= v45) {
        goto LABEL_41;
      }
    }
  }
  sub_21DE2E3B0(a1, (a2 - a1) / 8, a4);
  uint64_t v15 = &v7[8 * v11];
  if ((unint64_t)a2 >= a3 || v10 < 8)
  {
LABEL_7:
    uint64_t v17 = v9;
    goto LABEL_41;
  }
  double v33 = (id *)a2;
  while (1)
  {
    unint64_t v34 = (unint64_t)v15;
    double v35 = v33;
    id v48 = *v33;
    char v47 = *(void **)v7;
    char v36 = v47;
    id v37 = v48;
    id v38 = v36;
    BOOL v39 = sub_21DE36A38((uint64_t *)&v48, (uint64_t *)&v47, a5);
    if (v6) {
      break;
    }
    BOOL v40 = v39;

    if (v40)
    {
      char v41 = (char *)v35;
      double v33 = v35 + 1;
      BOOL v42 = v9 == (char *)v35;
    }
    else
    {
      char v41 = v7;
      BOOL v42 = v9 == v7;
      v7 += 8;
      double v33 = v35;
    }
    uint64_t v15 = (char *)v34;
    if (!v42) {
      *(void *)uint64_t v9 = *(void *)v41;
    }
    v9 += 8;
    uint64_t v6 = 0;
    if ((unint64_t)v7 >= v34 || (unint64_t)v33 >= a3) {
      goto LABEL_7;
    }
  }

  sub_21DE2E3B0(v7, (uint64_t)(v34 - (void)v7) / 8, v9);
  return 1;
}

uint64_t sub_21DE38870(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = MEMORY[0x263F8EE88];
    goto LABEL_25;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32B88);
  uint64_t result = sub_21DE3E050();
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
    uint64_t v6 = (uint64_t *)(a1 + 32 + 16 * v4);
    uint64_t v8 = *v6;
    uint64_t v7 = v6[1];
    sub_21DE3E210();
    swift_bridgeObjectRetain();
    sub_21DE3DD50();
    uint64_t result = sub_21DE3E230();
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
      if (v16 || (uint64_t result = sub_21DE3E180(), (result & 1) != 0))
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
          uint64_t result = sub_21DE3E180();
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

uint64_t sub_21DE38A40(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_21DE3E210();
  swift_bridgeObjectRetain();
  sub_21DE3DD50();
  uint64_t v6 = sub_21DE3E230();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  unint64_t v10 = (void *)(v9 + 16 * v8);
  BOOL v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_21DE3E180() & 1) == 0)
  {
    uint64_t v15 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v15;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_18;
      }
      BOOL v16 = (void *)(v9 + 16 * v8);
      BOOL v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (sub_21DE3E180() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v2;
  uint64_t v19 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_21DE1D930();
    uint64_t v13 = v19;
  }
  uint64_t v14 = *(void *)(*(void *)(v13 + 48) + 16 * v8);
  sub_21DE38BD0(v8);
  *uint64_t v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

unint64_t sub_21DE38BD0(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_21DE3E020();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_21DE3E210();
        swift_bridgeObjectRetain();
        sub_21DE3DD50();
        uint64_t v10 = sub_21DE3E230();
        swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 >= v9 && v2 >= (uint64_t)v11)
          {
LABEL_15:
            uint64_t v14 = *(void *)(v3 + 48);
            uint64_t v15 = (_OWORD *)(v14 + 16 * v2);
            BOOL v16 = (_OWORD *)(v14 + 16 * v6);
            BOOL v17 = v2 != v6 || v15 >= v16 + 1;
            int64_t v2 = v6;
            if (v17)
            {
              *uint64_t v15 = *v16;
              int64_t v2 = v6;
            }
          }
        }
        else if (v11 >= v9 || v2 >= (uint64_t)v11)
        {
          goto LABEL_15;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v18 = *(void *)(v3 + 16);
  BOOL v19 = __OFSUB__(v18, 1);
  uint64_t v20 = v18 - 1;
  if (v19)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v20;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_21DE38D8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32A08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21DE38DF4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21DE38E50(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_0_5()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_2_8(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

BOOL OUTLINED_FUNCTION_5_6(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_8_4()
{
  return sub_21DE3DC80();
}

uint64_t sub_21DE38F44()
{
  uint64_t v0 = sub_21DE3D4D0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32A18);
  MEMORY[0x270FA5388](v4 - 8);
  os_log_type_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21DE3D3D0();
  sub_21DE3D560();
  uint64_t v7 = v29;
  swift_release();
  if (!v7) {
    return 0;
  }
  uint64_t v8 = sub_21DE3D9D0();
  uint64_t v9 = *(void *)(v8 + 16);
  if (!v9)
  {
    uint64_t v19 = 1;
    goto LABEL_15;
  }
  id v27 = v6;
  uint64_t v28 = v1;
  uint64_t v12 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
  uint64_t v11 = v1 + 16;
  uint64_t v10 = v12;
  unint64_t v13 = v8 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
  uint64_t v14 = *(void *)(v11 + 56);
  uint64_t v26 = v8;
  swift_bridgeObjectRetain();
  while (1)
  {
    v10(v3, v13, v0);
    uint64_t v15 = sub_21DE3D4C0();
    if (!v16) {
      goto LABEL_10;
    }
    BOOL v17 = v15 == 0x6C6F636F746F7270 && v16 == 0xE800000000000000;
    if (v17) {
      break;
    }
    char v18 = sub_21DE3E180();
    swift_bridgeObjectRelease();
    if (v18) {
      goto LABEL_14;
    }
LABEL_10:
    (*(void (**)(char *, uint64_t))(v11 - 8))(v3, v0);
    v13 += v14;
    if (!--v9)
    {
      swift_bridgeObjectRelease();
      uint64_t v19 = 1;
      os_log_type_t v6 = v27;
      uint64_t v1 = v28;
      goto LABEL_15;
    }
  }
  swift_bridgeObjectRelease();
LABEL_14:
  swift_bridgeObjectRelease();
  os_log_type_t v6 = v27;
  uint64_t v1 = v28;
  (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v27, v3, v0);
  uint64_t v19 = 0;
LABEL_15:
  __swift_storeEnumTagSinglePayload((uint64_t)v6, v19, 1, v0);
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v0) == 1)
  {
    sub_21DE398B4((uint64_t)v6);
    return 0;
  }
  uint64_t v21 = sub_21DE3D4B0();
  uint64_t v23 = v22;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  if (v21 == 0xD000000000000016 && (OUTLINED_FUNCTION_3_6(), v17) || (OUTLINED_FUNCTION_0_6() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    sub_21DE3D7D0();
    OUTLINED_FUNCTION_2_4();
    sub_21DE3D7C0();
    goto LABEL_24;
  }
  if (v21 == 0xD000000000000013 && (OUTLINED_FUNCTION_3_6(), v17) || (OUTLINED_FUNCTION_0_6() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    sub_21DE3D6B0();
    OUTLINED_FUNCTION_2_4();
    sub_21DE3D6A0();
    goto LABEL_24;
  }
  if (v21 == 0xD000000000000020 && (OUTLINED_FUNCTION_3_6(), v17) || (OUTLINED_FUNCTION_0_6() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    sub_21DE3D5F0();
    OUTLINED_FUNCTION_2_4();
    sub_21DE3D5E0();
    goto LABEL_24;
  }
  if (v21 == 0xD000000000000018 && v23 == 0x800000021DE40300 || (OUTLINED_FUNCTION_0_6() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    sub_21DE3D580();
    OUTLINED_FUNCTION_2_4();
    sub_21DE3D570();
    goto LABEL_24;
  }
  if (v21 != 0xD000000000000018 || v23 != 0x800000021DE3FC60)
  {
    char v25 = OUTLINED_FUNCTION_0_6();
    swift_bridgeObjectRelease();
    if (v25) {
      goto LABEL_46;
    }
    return 0;
  }
  swift_bridgeObjectRelease();
LABEL_46:
  sub_21DE3D740();
  OUTLINED_FUNCTION_2_4();
  sub_21DE3D730();
LABEL_24:
  uint64_t v20 = MEMORY[0x223C18C90]();
  swift_release();
  return v20;
}

unint64_t sub_21DE393F4(uint8_t *a1)
{
  unint64_t v32 = MEMORY[0x263F8EE78];
  uint64_t v3 = (uint64_t *)((char *)v1 + OBJC_IVAR____TtC21SiriReferenceResolver10RRResolver_entities);
  swift_beginAccess();
  uint64_t v4 = *v3;
  if ((unint64_t)*v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_21DE3E100();
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  os_log_type_t v6 = &OBJC_IVAR____TtC21SiriReferenceResolver10RRResolver_logger;
  if (v5)
  {
    if (v5 >= 1)
    {
      uint64_t v7 = 0;
      unint64_t v8 = v4 & 0xC000000000000001;
      uint64_t v30 = v4;
      uint64_t v29 = v5;
      unint64_t v28 = v4 & 0xC000000000000001;
      while (1)
      {
        if (v8) {
          id v9 = (id)MEMORY[0x223C19800](v7, v4);
        }
        else {
          id v9 = *(id *)(v4 + 8 * v7 + 32);
        }
        uint64_t v10 = v9;
        static RREntityMatcher.entity(_:matches:entityFoundByMarrsIdentifier:)();
        if (!v11) {
          goto LABEL_25;
        }
        uint64_t v12 = v11;
        sub_21DE3DB80();
        uint64_t v13 = sub_21DE38F44();
        swift_release();
        if (v13)
        {
          static RREntityMatcher.entity(_:matches:entityFoundByMarrsIdentifier:)();
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = sub_21DE3DAA0();
            os_log_type_t v17 = sub_21DE3DF60();
            if (os_log_type_enabled(v16, v17))
            {
              uint64_t v18 = swift_slowAlloc();
              uint64_t v19 = swift_slowAlloc();
              v31[0] = v19;
              *(_DWORD *)uint64_t v18 = 136315138;
              sub_21DE3DB80();
              sub_21DE3D9F0();
              uint64_t v20 = sub_21DE3DD90();
              *(void *)(v18 + 4) = sub_21DE2A150(v20, v21, v31);

              swift_bridgeObjectRelease();
              _os_log_impl(&dword_21DE16000, v16, v17, "RREntityMatcher found a new match: %s. Replacing common_AppEntity", (uint8_t *)v18, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x223C19EE0](v19, -1, -1);
              MEMORY[0x223C19EE0](v18, -1, -1);
            }
            else
            {
            }
            uint64_t v4 = v30;
            id v24 = v15;
            MEMORY[0x223C19640]();
            uint64_t v5 = v29;
            if (*(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              OUTLINED_FUNCTION_2_9();
            }
            sub_21DE3DF30();
            sub_21DE3DEF0();

            swift_release();
            uint64_t v10 = v24;
            unint64_t v8 = v28;
            goto LABEL_25;
          }
          id v22 = v12;
          MEMORY[0x223C19640]();
          OUTLINED_FUNCTION_4_7();
          if (v23) {
            OUTLINED_FUNCTION_2_9();
          }
          sub_21DE3DF30();
          sub_21DE3DEF0();

          swift_release();
        }
        else
        {
          id v22 = v12;
          MEMORY[0x223C19640]();
          OUTLINED_FUNCTION_4_7();
          if (v23) {
            OUTLINED_FUNCTION_2_9();
          }
          sub_21DE3DF30();
          sub_21DE3DEF0();
        }
        uint64_t v10 = v22;
LABEL_25:
        ++v7;

        if (v5 == v7)
        {
          swift_bridgeObjectRelease();
          unint64_t v25 = v32;
          goto LABEL_28;
        }
      }
    }
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_21DE3E100();
    swift_bridgeObjectRelease();
    goto LABEL_31;
  }
  swift_bridgeObjectRelease();
  unint64_t v25 = MEMORY[0x263F8EE78];
LABEL_28:
  swift_bridgeObjectRetain_n();
  uint64_t v1 = sub_21DE3DAA0();
  LOBYTE(v6) = sub_21DE3DF60();
  if (!os_log_type_enabled(v1, (os_log_type_t)v6))
  {

    swift_bridgeObjectRelease_n();
    goto LABEL_33;
  }
  a1 = (uint8_t *)swift_slowAlloc();
  *(_DWORD *)a1 = 134217984;
  if (v25 >> 62) {
    goto LABEL_36;
  }
  uint64_t v26 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_31:
  swift_bridgeObjectRelease();
  v31[0] = v26;
  sub_21DE3DFC0();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_21DE16000, v1, (os_log_type_t)v6, "result entity count: %ld", a1, 0xCu);
  MEMORY[0x223C19EE0](a1, -1, -1);

LABEL_33:
  swift_beginAccess();
  return v32;
}

uint64_t sub_21DE398B4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32A18);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_0_6()
{
  return sub_21DE3E180();
}

uint64_t OUTLINED_FUNCTION_2_9()
{
  return sub_21DE3DF00();
}

uint64_t sub_21DE39970(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xEC000000726F7272;
  unint64_t v3 = 0x456E776F6E6B6E75;
  uint64_t v4 = a1;
  unint64_t v5 = 0x456E776F6E6B6E75;
  unint64_t v6 = 0xEC000000726F7272;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x74754F64656D6974;
      unint64_t v6 = 0xED0000726F727245;
      break;
    case 2:
      unint64_t v5 = 0x617461446B6E696CLL;
      unint64_t v6 = 0xEB000000006C694ELL;
      break;
    case 3:
      unint64_t v6 = 0x800000021DE3F650;
      unint64_t v5 = 0xD00000000000001DLL;
      break;
    case 4:
      unint64_t v5 = 0xD00000000000001ELL;
      unint64_t v6 = 0x800000021DE3F670;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v3 = 0x74754F64656D6974;
      unint64_t v2 = 0xED0000726F727245;
      break;
    case 2:
      unint64_t v3 = 0x617461446B6E696CLL;
      unint64_t v2 = 0xEB000000006C694ELL;
      break;
    case 3:
      unint64_t v2 = 0x800000021DE3F650;
      unint64_t v3 = 0xD00000000000001DLL;
      break;
    case 4:
      unint64_t v3 = 0xD00000000000001ELL;
      unint64_t v2 = 0x800000021DE3F670;
      break;
    default:
      break;
  }
  if (v5 == v3 && v6 == v2) {
    char v8 = 1;
  }
  else {
    char v8 = sub_21DE3E180();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_21DE39B64(char a1, char a2)
{
  unint64_t v2 = 0xE900000000000065;
  unint64_t v3 = 0x707954676E6F7277;
  if (a1)
  {
    OUTLINED_FUNCTION_1_6();
    if (v5 == 1) {
      unint64_t v8 = v6;
    }
    else {
      unint64_t v8 = 0xD000000000000012;
    }
    if (v5 == 1) {
      unint64_t v9 = v7;
    }
    else {
      unint64_t v9 = (v4 - 32) | 0x8000000000000000;
    }
  }
  else
  {
    unint64_t v8 = 0x707954676E6F7277;
    unint64_t v9 = 0xE900000000000065;
  }
  if (a2)
  {
    OUTLINED_FUNCTION_1_6();
    unint64_t v14 = (v13 - 32) | 0x8000000000000000;
    if (v10 == 1) {
      unint64_t v3 = v11;
    }
    else {
      unint64_t v3 = 0xD000000000000012;
    }
    if (v10 == 1) {
      unint64_t v2 = v12;
    }
    else {
      unint64_t v2 = v14;
    }
  }
  if (v8 == v3 && v9 == v2) {
    char v16 = 1;
  }
  else {
    char v16 = sub_21DE3E180();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v16 & 1;
}

uint64_t sub_21DE39C54(char a1)
{
  return sub_21DE39E10(0, a1);
}

uint64_t sub_21DE39C60()
{
  return sub_21DE3E230();
}

uint64_t sub_21DE39CA8()
{
  sub_21DE3DD50();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21DE39DB4(uint64_t a1, char a2)
{
  if (a2)
  {
    OUTLINED_FUNCTION_0_7();
    OUTLINED_FUNCTION_2_10();
  }
  else
  {
    OUTLINED_FUNCTION_3_7();
  }
  sub_21DE3DD50();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21DE39E10(uint64_t a1, char a2)
{
  if (a2)
  {
    OUTLINED_FUNCTION_0_7();
    OUTLINED_FUNCTION_2_10();
  }
  else
  {
    OUTLINED_FUNCTION_3_7();
  }
  sub_21DE3DD50();
  swift_bridgeObjectRelease();
  return sub_21DE3E230();
}

uint64_t sub_21DE39E80()
{
  return sub_21DE3E230();
}

BOOL static ResolutionError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ResolutionError.hash(into:)()
{
  return sub_21DE3E220();
}

unint64_t ResolutionError.errorDescription.getter()
{
  if (*v0) {
    return 0xD000000000000061;
  }
  else {
    return 0xD000000000000050;
  }
}

SiriReferenceResolver::LinkError_optional __swiftcall LinkError.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v2 = v1;
  unint64_t v3 = sub_21DE3E120();
  result.value = swift_bridgeObjectRelease();
  char v5 = 5;
  if (v3 < 5) {
    char v5 = v3;
  }
  *unint64_t v2 = v5;
  return result;
}

unint64_t LinkError.rawValue.getter()
{
  unint64_t result = 0x456E776F6E6B6E75;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x74754F64656D6974;
      break;
    case 2:
      unint64_t result = 0x617461446B6E696CLL;
      break;
    case 3:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 4:
      unint64_t result = 0xD00000000000001ELL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_21DE3A09C(unsigned __int8 *a1, char *a2)
{
  return sub_21DE39970(*a1, *a2);
}

uint64_t sub_21DE3A0A8()
{
  return sub_21DE39C60();
}

uint64_t sub_21DE3A0B0()
{
  return sub_21DE39CA8();
}

uint64_t sub_21DE3A0B8()
{
  return sub_21DE39E80();
}

SiriReferenceResolver::LinkError_optional sub_21DE3A0C0(Swift::String *a1)
{
  return LinkError.init(rawValue:)(*a1);
}

unint64_t sub_21DE3A0CC@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = LinkError.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t _s21SiriReferenceResolver15ResolutionErrorO9hashValueSivg_0()
{
  return sub_21DE3E230();
}

uint64_t sub_21DE3A140()
{
  return sub_21DE3E230();
}

unint64_t sub_21DE3A188()
{
  unint64_t result = qword_267D22618;
  if (!qword_267D22618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D22618);
  }
  return result;
}

unint64_t sub_21DE3A1DC()
{
  unint64_t result = qword_267D22620;
  if (!qword_267D22620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D22620);
  }
  return result;
}

unint64_t sub_21DE3A22C()
{
  unint64_t result = qword_267D22628;
  if (!qword_267D22628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D22628);
  }
  return result;
}

unsigned char *sub_21DE3A280(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

void type metadata accessor for ResolutionError()
{
}

uint64_t getEnumTagSinglePayload for LinkError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for LinkError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21DE3A3ECLL);
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

void type metadata accessor for LinkError()
{
}

uint64_t _s21SiriReferenceResolver15ResolutionErrorOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s21SiriReferenceResolver15ResolutionErrorOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21DE3A574);
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

void type metadata accessor for TransformerError()
{
}

uint64_t dispatch thunk of RRLinkHandling.queryType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of RRLinkHandling.linkDataProtocol.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of RRLinkHandling.createAnnotatedEntity(inObject:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of RRLinkHandling.checkDataAndBuildEntity<A>(linkData:poolEntity:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
}

uint64_t static RRResolverLog.logger<A>(_:)()
{
  return sub_21DE3DAB0();
}

ValueMetadata *type metadata accessor for RRResolverLog()
{
  return &type metadata for RRResolverLog;
}

ValueMetadata *type metadata accessor for PersonStructuredDataHandler()
{
  return &type metadata for PersonStructuredDataHandler;
}

uint64_t sub_21DE3A740(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = sub_21DE3D4D0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  BOOL v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21DE3D6B0();
  swift_allocObject();
  uint64_t v8 = sub_21DE3D6A0();
  id v9 = objc_msgSend(a3, sel_displayName);
  sub_21DE3DD80();

  sub_21DE3D690();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(a3, sel_personHandle);
  if (!v10) {
    goto LABEL_8;
  }
  unint64_t v11 = v10;
  id v12 = objc_msgSend(v10, sel_type);

  if (!v12) {
    goto LABEL_8;
  }
  if (v12 == (id)2)
  {
    sub_21DE3D830();
    swift_allocObject();
    sub_21DE3D820();
    id v16 = objc_msgSend(a3, sel_personHandle);
    if (!v16 || (sub_21DE3ACC0(v16), !v17)) {
      swift_bridgeObjectRelease();
    }
    sub_21DE3D810();
    swift_bridgeObjectRelease();
    swift_retain();
    goto LABEL_17;
  }
  if (v12 != (id)1)
  {
LABEL_8:
    swift_release();
    return 0;
  }
  sub_21DE3D870();
  swift_allocObject();
  sub_21DE3D860();
  id v13 = objc_msgSend(a3, sel_personHandle);
  if (!v13 || (sub_21DE3ACC0(v13), !v14)) {
    swift_bridgeObjectRelease();
  }
  sub_21DE3D850();
  swift_bridgeObjectRelease();
  swift_retain();
LABEL_17:
  sub_21DE3D670();
  swift_release_n();
  sub_21DE30F3C(a3, (SEL *)&selRef_contactIdentifier);
  if (v18)
  {
    if (sub_21DE3D680()) {
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  sub_21DE30F3C(a3, (SEL *)&selRef_customIdentifier);
  if (v19)
  {
    if (sub_21DE3D680())
    {
LABEL_22:
      swift_bridgeObjectRetain();
      sub_21DE3D4A0();
      sub_21DE3D400();
      swift_release();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      return v8;
    }
LABEL_23:
    swift_bridgeObjectRelease();
  }
  return v8;
}

uint64_t sub_21DE3AAB8()
{
  return 0x505F6E6F6D6D6F63;
}

uint64_t sub_21DE3AADC()
{
  return 3;
}

unint64_t sub_21DE3AAE4()
{
  return 0xD000000000000013;
}

uint64_t sub_21DE3AB00()
{
  return 0x6E6F737265504E49;
}

uint64_t sub_21DE3AB18(void *a1)
{
  uint64_t v2 = sub_21DE3DBB0();
  uint64_t v4 = sub_21DE3A740(v2, v3, a1);
  swift_bridgeObjectRelease();
  if (v4)
  {
    uint64_t v5 = MEMORY[0x223C18C90](v4);
    if (v5)
    {
      uint64_t v6 = sub_21DE23668(0, 0, 0, 0, v5, 0, 0, 0, 0xF000000000000000);
      swift_release();
      swift_release();
      return v6;
    }
    else
    {
      sub_21DE3AC74();
      swift_allocError();
      unsigned char *v9 = 1;
      swift_willThrow();
      return swift_release();
    }
  }
  else
  {
    sub_21DE3AC74();
    swift_allocError();
    *uint64_t v8 = 0;
    return swift_willThrow();
  }
}

unint64_t sub_21DE3AC38()
{
  return 0xD000000000000013;
}

uint64_t sub_21DE3AC58(void **a1)
{
  return sub_21DE3AB18(*a1);
}

unint64_t sub_21DE3AC74()
{
  unint64_t result = qword_267D22630;
  if (!qword_267D22630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D22630);
  }
  return result;
}

uint64_t sub_21DE3ACC0(void *a1)
{
  id v2 = objc_msgSend(a1, sel_value);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_21DE3DD80();

  return v3;
}

ValueMetadata *type metadata accessor for TimerStructuredDataHandler()
{
  return &type metadata for TimerStructuredDataHandler;
}

uint64_t sub_21DE3AD40()
{
  return 0x646E696B656D6F73;
}

uint64_t sub_21DE3AD64()
{
  return 6;
}

uint64_t sub_21DE3AD6C()
{
  return 0x72656D69544E49;
}

uint64_t sub_21DE3AD84()
{
  return sub_21DE23668(0, 0, 0, 0, 0, 0, 0, 0, 0xF000000000000000);
}

uint64_t sub_21DE3ADE0()
{
  return sub_21DE3AD84();
}

uint64_t sub_21DE3ADF8(void (*a1)(uint64_t *__return_ptr, uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v20 = MEMORY[0x263F8EE78];
  sub_21DE3D0A0(a3, v19);
  uint64_t v5 = v19[0];
  int64_t v6 = v19[3];
  unint64_t v7 = v19[4];
  uint64_t v15 = v19[1];
  int64_t v16 = (unint64_t)(v19[2] + 64) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v6 << 6);
      goto LABEL_15;
    }
    int64_t v11 = v6 + 1;
    if (__OFADD__(v6, 1)) {
      break;
    }
    if (v11 >= v16) {
      goto LABEL_27;
    }
    unint64_t v12 = *(void *)(v15 + 8 * v11);
    if (!v12)
    {
      int64_t v13 = v6 + 2;
      if (v6 + 2 >= v16) {
        goto LABEL_27;
      }
      unint64_t v12 = *(void *)(v15 + 8 * v13);
      if (v12) {
        goto LABEL_13;
      }
      int64_t v13 = v6 + 3;
      if (v6 + 3 >= v16) {
        goto LABEL_27;
      }
      unint64_t v12 = *(void *)(v15 + 8 * v13);
      if (v12) {
        goto LABEL_13;
      }
      int64_t v13 = v6 + 4;
      if (v6 + 4 >= v16) {
        goto LABEL_27;
      }
      unint64_t v12 = *(void *)(v15 + 8 * v13);
      if (v12)
      {
LABEL_13:
        int64_t v11 = v13;
      }
      else
      {
        int64_t v11 = v6 + 5;
        if (v6 + 5 >= v16) {
          goto LABEL_27;
        }
        unint64_t v12 = *(void *)(v15 + 8 * v11);
        if (!v12)
        {
          int64_t v14 = v6 + 6;
          while (v14 < v16)
          {
            unint64_t v12 = *(void *)(v15 + 8 * v14++);
            if (v12)
            {
              int64_t v11 = v14 - 1;
              goto LABEL_14;
            }
          }
LABEL_27:
          swift_release();
          return v20;
        }
      }
    }
LABEL_14:
    unint64_t v7 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v11 << 6);
    int64_t v6 = v11;
LABEL_15:
    uint64_t v18 = *(void *)(*(void *)(v5 + 56) + 8 * v10);
    swift_bridgeObjectRetain();
    a1(&v17, &v18);
    if (v3)
    {
      swift_release();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    uint64_t result = swift_bridgeObjectRelease();
    if (v17)
    {
      MEMORY[0x223C19640](result);
      if (*(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_21DE3DF00();
      }
      sub_21DE3DF30();
      uint64_t result = sub_21DE3DEF0();
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_21DE3B030(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32A20);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  unint64_t v7 = (char *)&v13 - v6;
  sub_21DE3D1E0(a1, (uint64_t)&v13 - v6, &qword_26AD32A20);
  uint64_t v8 = sub_21DE3D640();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8) == 1)
  {
    uint64_t v9 = 0;
  }
  else
  {
    sub_21DE3D1E0((uint64_t)v7, (uint64_t)v5, &qword_26AD32A20);
    uint64_t v10 = *(void *)(v8 - 8);
    int v11 = (*(uint64_t (**)(char *, uint64_t))(v10 + 88))(v5, v8);
    if (v11 == *MEMORY[0x263F72E88])
    {
      uint64_t v9 = 4;
    }
    else if (v11 == *MEMORY[0x263F72E98])
    {
      uint64_t v9 = 2;
    }
    else
    {
      if (v11 == *MEMORY[0x263F72DB8]) {
        goto LABEL_8;
      }
      if (v11 == *MEMORY[0x263F72E28])
      {
        uint64_t v9 = 24;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x263F72DF8])
      {
        uint64_t v9 = 17;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x263F72E80])
      {
        uint64_t v9 = 8;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x263F72E00])
      {
        uint64_t v9 = -3;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x263F72E68])
      {
        uint64_t v9 = 6;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x263F72DE8])
      {
        uint64_t v9 = 19;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x263F72E08])
      {
        uint64_t v9 = 25;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x263F72E60])
      {
        uint64_t v9 = 9;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x263F72EB8])
      {
        uint64_t v9 = 11;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x263F72E38]) {
        goto LABEL_28;
      }
      if (v11 == *MEMORY[0x263F72DE0])
      {
        uint64_t v9 = 14;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x263F72E20])
      {
        uint64_t v9 = -2;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x263F72E10])
      {
        uint64_t v9 = 21;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x263F72DF0])
      {
        uint64_t v9 = 13;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x263F72E40])
      {
LABEL_28:
        uint64_t v9 = -1;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x263F72E30])
      {
        uint64_t v9 = 22;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x263F72DC0])
      {
        uint64_t v9 = 15;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x263F72DD0])
      {
        uint64_t v9 = 20;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x263F72E50])
      {
        uint64_t v9 = 5;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x263F72DC8])
      {
        uint64_t v9 = 16;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x263F72E58])
      {
LABEL_8:
        uint64_t v9 = 1;
      }
      else if (v11 == *MEMORY[0x263F72EA8])
      {
        uint64_t v9 = 7;
      }
      else if (v11 == *MEMORY[0x263F72DD8])
      {
        uint64_t v9 = 18;
      }
      else if (v11 == *MEMORY[0x263F72E18])
      {
        uint64_t v9 = 23;
      }
      else if (v11 == *MEMORY[0x263F72EB0])
      {
        uint64_t v9 = 12;
      }
      else if (v11 == *MEMORY[0x263F72E78])
      {
        uint64_t v9 = 3;
      }
      else if (v11 == *MEMORY[0x263F72E70])
      {
        uint64_t v9 = 10;
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v10 + 8))(v5, v8);
        uint64_t v9 = 0;
      }
    }
  }
LABEL_62:
  sub_21DE3D23C((uint64_t)v7, &qword_26AD32A20);
  return v9;
}

uint64_t sub_21DE3B544(unint64_t *a1, uint64_t (*a2)(id, id))
{
  unint64_t v4 = *a1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *a1 = v4;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v4 & 0x8000000000000000) != 0
    || (v4 & 0x4000000000000000) != 0)
  {
    sub_21DE3D024(v4);
    unint64_t v4 = v6;
    *a1 = v6;
  }
  uint64_t v7 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v9[0] = (v4 & 0xFFFFFFFFFFFFFF8) + 32;
  v9[1] = v7;
  sub_21DE3C56C(v9, a2);
  return sub_21DE3DEF0();
}

uint64_t sub_21DE3B5E4(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v53 = a3;
  uint64_t v54 = a4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32B60);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  unint64_t v57 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (uint64_t *)((char *)&v52 - v9);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32B68);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_21DE3DCA0();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  unint64_t v17 = (unint64_t)&v52 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21DE3D1E0(a2, (uint64_t)v13, &qword_26AD32B68);
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14) == 1)
  {
    (*(void (**)(unint64_t, void, uint64_t))(v15 + 104))(v17, *MEMORY[0x263F74200], v14);
    sub_21DE3D23C((uint64_t)v13, &qword_26AD32B68);
  }
  else
  {
    (*(void (**)(unint64_t, char *, uint64_t))(v15 + 32))(v17, v13, v14);
  }
  uint64_t v62 = (void *)MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_46;
  }
  uint64_t v18 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (1)
  {
    uint64_t v60 = (char *)v17;
    uint64_t v56 = v15;
    if (v18)
    {
      if (v18 < 1)
      {
        __break(1u);
LABEL_51:
        uint64_t result = sub_21DE3E1A0();
        __break(1u);
        return result;
      }
      for (uint64_t i = 0; i != v18; ++i)
      {
        if ((a1 & 0xC000000000000001) != 0) {
          id v20 = (id)MEMORY[0x223C19800](i, a1);
        }
        else {
          id v20 = *(id *)(a1 + 8 * i + 32);
        }
        unint64_t v21 = v20;
        sub_21DE3DC20();
        uint64_t v22 = sub_21DE3DB70();
        int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v22);
        sub_21DE3D23C((uint64_t)v10, &qword_26AD32B60);
        if (EnumTagSinglePayload == 1)
        {
        }
        else
        {
          sub_21DE3E0A0();
          sub_21DE3E0C0();
          unint64_t v17 = (unint64_t)v60;
          sub_21DE3E0D0();
          sub_21DE3E0B0();
        }
      }
      swift_bridgeObjectRelease();
      unint64_t v24 = (unint64_t)v62;
      uint64_t v15 = v56;
    }
    else
    {
      swift_bridgeObjectRelease();
      unint64_t v24 = MEMORY[0x263F8EE78];
    }
    uint64_t v25 = (uint64_t)v57;
    if ((v24 & 0x8000000000000000) != 0 || (v24 & 0x4000000000000000) != 0) {
      break;
    }
    uint64_t v26 = *(void *)(v24 + 16);
    swift_retain();
    if (!v26) {
      goto LABEL_48;
    }
LABEL_21:
    unint64_t v59 = v24 & 0xC000000000000001;
    uint64_t v10 = (void *)MEMORY[0x263F8EE80];
    a1 = 4;
    uint64_t v55 = v14;
    uint64_t v58 = v26;
    while (1)
    {
      id v27 = v59 ? (id)MEMORY[0x223C19800](a1 - 4, v24) : *(id *)(v24 + 8 * a1);
      unint64_t v28 = v27;
      if (__OFADD__(a1 - 4, 1)) {
        break;
      }
      unint64_t v61 = a1 - 3;
      uint64_t v29 = (void *)v24;
      sub_21DE3DC20();
      uint64_t v30 = sub_21DE3DB70();
      if (__swift_getEnumTagSinglePayload(v25, 1, v30) == 1)
      {
        sub_21DE3D23C(v25, &qword_26AD32B60);

        unint64_t v24 = (unint64_t)v29;
        uint64_t v31 = v58;
      }
      else
      {
        uint64_t v15 = sub_21DE3DB50();
        uint64_t v32 = v25;
        uint64_t v34 = v33;
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v30 - 8) + 8))(v32, v30);
        id v35 = v28;
        swift_isUniquelyReferenced_nonNull_native();
        uint64_t v62 = v10;
        unint64_t v36 = sub_21DE2A8C0(v15, v34);
        uint64_t v38 = v10[2];
        BOOL v39 = (v37 & 1) == 0;
        uint64_t v10 = (void *)(v38 + v39);
        if (__OFADD__(v38, v39)) {
          goto LABEL_44;
        }
        unint64_t v17 = v36;
        uint64_t v14 = v37;
        __swift_instantiateConcreteTypeFromMangledName(&qword_267D22638);
        char v40 = sub_21DE3E0E0();
        unint64_t v24 = (unint64_t)v29;
        uint64_t v31 = v58;
        if (v40)
        {
          unint64_t v41 = sub_21DE2A8C0(v15, v34);
          if ((v14 & 1) != (v42 & 1)) {
            goto LABEL_51;
          }
          unint64_t v17 = v41;
        }
        uint64_t v10 = v62;
        swift_bridgeObjectRelease();
        if ((v14 & 1) == 0)
        {
          v10[(v17 >> 6) + 8] |= 1 << v17;
          uint64_t v43 = (uint64_t *)(v10[6] + 16 * v17);
          *uint64_t v43 = v15;
          v43[1] = v34;
          *(void *)(v10[7] + 8 * v17) = MEMORY[0x263F8EE78];
          uint64_t v44 = v10[2];
          uint64_t v45 = v44 + 1;
          uint64_t v15 = __OFADD__(v44, 1);
          swift_bridgeObjectRetain();
          if (v15) {
            goto LABEL_45;
          }
          v10[2] = v45;
        }
        swift_bridgeObjectRetain();
        uint64_t v46 = v10[7];
        uint64_t v47 = swift_bridgeObjectRelease();
        MEMORY[0x223C19640](v47);
        if (*(void *)((*(void *)(v46 + 8 * v17) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v46 + 8 * v17) & 0xFFFFFFFFFFFFFF8)
                                                                                                 + 0x18) >> 1)
          sub_21DE3DF00();
        sub_21DE3DF30();
        sub_21DE3DEF0();

        swift_bridgeObjectRelease();
        uint64_t v14 = v55;
        uint64_t v15 = v56;
        uint64_t v25 = (uint64_t)v57;
        unint64_t v17 = (unint64_t)v60;
      }
      ++a1;
      if (v61 == v31) {
        goto LABEL_49;
      }
    }
    __break(1u);
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
LABEL_46:
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_21DE3E100();
  }
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v26 = sub_21DE3E100();
  swift_release();
  if (v26) {
    goto LABEL_21;
  }
LABEL_48:
  uint64_t v10 = (void *)MEMORY[0x263F8EE80];
LABEL_49:
  uint64_t v48 = swift_release_n();
  MEMORY[0x270FA5388](v48);
  uint64_t v49 = v54;
  *(&v52 - 4) = v53;
  *(&v52 - 3) = v49;
  *(&v52 - 2) = v17;
  uint64_t v50 = sub_21DE3ADF8((void (*)(uint64_t *__return_ptr, uint64_t *))sub_21DE3D004, (uint64_t)(&v52 - 6), (uint64_t)v10);
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v15 + 8))(v17, v14);
  return v50;
}

void sub_21DE3BC6C(unint64_t *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v5 = a2;
  unint64_t v7 = sub_21DE3BF10(*a1, a2, a3);
  if (v4)
  {

    uint64_t v8 = 0;
LABEL_37:
    *a4 = v8;
    return;
  }
  unint64_t v9 = v7;
  unint64_t v10 = v7 >> 62;
  if (!(v7 >> 62))
  {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8) {
      goto LABEL_5;
    }
LABEL_36:
    swift_bridgeObjectRelease_n();
    goto LABEL_37;
  }
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_21DE3E100();
  if (!v8) {
    goto LABEL_36;
  }
LABEL_5:
  unint64_t v28 = a4;
  unint64_t v29 = v10;
  unint64_t v11 = v9 & 0xC000000000000001;
  sub_21DE2E22C(0, (v9 & 0xC000000000000001) == 0, v9);
  if ((v9 & 0xC000000000000001) != 0) {
    id v12 = (id)MEMORY[0x223C19800](0, v9);
  }
  else {
    id v12 = *(id *)(v9 + 32);
  }
  uint64_t v13 = v12;
  uint64_t v14 = v8 - 1;
  if (v8 != 1)
  {
    if (v8 < 2) {
      goto LABEL_40;
    }
    sub_21DE2E22C(1, v11 == 0, v9);
    sub_21DE2E22C(v14, v11 == 0, v9);
    uint64_t v15 = 0;
    do
    {
      if (v11) {
        id v16 = (id)MEMORY[0x223C19800](v15 + 1, v9);
      }
      else {
        id v16 = *(id *)(v9 + 8 * v15 + 40);
      }
      id v17 = v16;
      sub_21DE3DC30();
      double v19 = v18;
      sub_21DE3DC30();
      if (v19 >= v20) {
        unint64_t v21 = v17;
      }
      else {
        unint64_t v21 = v13;
      }
      if (v19 < v20) {
        uint64_t v13 = v17;
      }

      ++v15;
    }
    while (v14 != v15);
  }
  swift_bridgeObjectRelease();
  sub_21DE3DC30();

  if (v5 < 0)
  {
    BOOL v22 = __OFSUB__(0, v5);
    uint64_t v5 = -v5;
    if (v22) {
      goto LABEL_41;
    }
  }
  BOOL v22 = __OFSUB__(v5, 1);
  uint64_t v23 = v5 - 1;
  if (!v22)
  {
    if (v29)
    {
      swift_bridgeObjectRetain();
      uint64_t v24 = sub_21DE3E100();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v24 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    if (v23 >= v24)
    {
      swift_bridgeObjectRelease();
      uint64_t v8 = 0;
    }
    else
    {
      sub_21DE2E22C(v23, v11 == 0, v9);
      if (v11) {
        id v25 = (id)MEMORY[0x223C19800](v23, v9);
      }
      else {
        id v25 = *(id *)(v9 + 8 * v23 + 32);
      }
      uint64_t v26 = v25;
      sub_21DE3DC40();

      if (v11) {
        id v27 = (id)MEMORY[0x223C19800](v23, v9);
      }
      else {
        id v27 = *(id *)(v9 + 8 * v23 + 32);
      }
      uint64_t v8 = (uint64_t)v27;
      swift_bridgeObjectRelease();
    }
    a4 = v28;
    goto LABEL_37;
  }
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
}

uint64_t sub_21DE3BF10(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_21DE3DCA0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7);
  unint64_t v30 = a1;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v7);
  unint64_t v10 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v11 + v10, (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  swift_bridgeObjectRetain();
  sub_21DE3B544(&v30, (uint64_t (*)(id, id))sub_21DE3D160);
  if (v3)
  {
    swift_release();
    swift_bridgeObjectRelease();
    swift_willThrow();
    return a1;
  }
  uint64_t result = swift_release();
  a1 = v30;
  if ((a2 & 0x8000000000000000) == 0) {
    return a1;
  }
  if (v30 >> 62) {
    goto LABEL_31;
  }
  uint64_t v13 = *(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v13) {
    return a1;
  }
LABEL_7:
  if (!__OFSUB__(v13, 1))
  {
    if (v13 - 1 < 1) {
      return a1;
    }
    a1 = 0;
    uint64_t v14 = v13 + 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      unint64_t v15 = v13 - 1;
      unint64_t v16 = v30;
      if ((v30 & 0xC000000000000001) != 0)
      {
        uint64_t v19 = MEMORY[0x223C19800](a1, v30);
        id v20 = (id)MEMORY[0x223C19800](v13 - 1, v16);
      }
      else
      {
        unint64_t v17 = *(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (a1 >= v17)
        {
          __break(1u);
LABEL_28:
          __break(1u);
LABEL_29:
          __break(1u);
LABEL_30:
          __break(1u);
LABEL_31:
          swift_bridgeObjectRetain();
          uint64_t v28 = sub_21DE3E100();
          swift_bridgeObjectRelease();
          if (v28)
          {
            swift_bridgeObjectRetain();
            uint64_t v13 = sub_21DE3E100();
            uint64_t result = swift_bridgeObjectRelease();
            goto LABEL_7;
          }
          return a1;
        }
        id v18 = *(id *)(v30 + 8 * a1 + 32);
        if (v15 >= v17) {
          goto LABEL_28;
        }
        uint64_t v19 = (uint64_t)v18;
        id v20 = *(id *)(v16 + 8 * v13 + 24);
      }
      id v21 = v20;
      if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
        || (v16 & 0x8000000000000000) != 0
        || (v16 & 0x4000000000000000) != 0)
      {
        sub_21DE3D024(v16);
        unint64_t v16 = v22;
        unint64_t v30 = v22;
      }
      uint64_t v23 = *(void **)((v16 & 0xFFFFFFFFFFFFFF8) + 8 * a1 + 0x20);
      *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 8 * a1 + 0x20) = v21;

      sub_21DE3DEF0();
      unint64_t v24 = v30;
      if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
        || (v24 & 0x8000000000000000) != 0
        || (v24 & 0x4000000000000000) != 0)
      {
        sub_21DE3D024(v24);
        unint64_t v24 = v25;
        unint64_t v30 = v25;
      }
      if (v15 >= *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_29;
      }
      uint64_t v26 = *(void **)((v24 & 0xFFFFFFFFFFFFFF8) + 8 * v13 + 0x18);
      *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 8 * v13 + 0x18) = v19;

      sub_21DE3DEF0();
      if (v14 == a1) {
        goto LABEL_30;
      }
      ++a1;
      uint64_t v27 = v13 - 2;
      --v13;
      if ((uint64_t)a1 >= v27) {
        return v30;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_21DE3C25C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v27 = a2;
  uint64_t v4 = sub_21DE3DCA0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD32B60);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v23 - v12;
  sub_21DE3DC20();
  uint64_t v14 = sub_21DE3DB70();
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14) == 1) {
    goto LABEL_4;
  }
  uint64_t v25 = a3;
  uint64_t v26 = v4;
  uint64_t v24 = sub_21DE3DB60();
  unint64_t v15 = *(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8);
  v15(v13, v14);
  sub_21DE3DC20();
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v14) == 1)
  {
    uint64_t v13 = v11;
LABEL_4:
    sub_21DE3D23C((uint64_t)v13, &qword_26AD32B60);
    sub_21DE2F8D4();
    swift_allocError();
    *unint64_t v16 = 1;
    swift_willThrow();
    return v17 & 1;
  }
  uint64_t v18 = sub_21DE3DB60();
  v15(v11, v14);
  uint64_t v19 = v26;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v25, v26);
  int v20 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v19);
  if (v20 == *MEMORY[0x263F74200]) {
    goto LABEL_6;
  }
  if (v20 == *MEMORY[0x263F74210])
  {
LABEL_8:
    BOOL v21 = v18 < v24;
LABEL_9:
    char v17 = v21;
    return v17 & 1;
  }
  if (v20 == *MEMORY[0x263F741F0]) {
    goto LABEL_6;
  }
  if (v20 == *MEMORY[0x263F74218]) {
    goto LABEL_8;
  }
  if (v20 == *MEMORY[0x263F74208])
  {
LABEL_6:
    BOOL v21 = v24 < v18;
    goto LABEL_9;
  }
  if (v20 == *MEMORY[0x263F741F8]) {
    goto LABEL_8;
  }
  uint64_t result = sub_21DE3E170();
  __break(1u);
  return result;
}

void sub_21DE3C56C(uint64_t *a1, uint64_t (*a2)(id, id))
{
  uint64_t v5 = a1[1];
  uint64_t v6 = sub_21DE3E140();
  if (v6 >= v5)
  {
    if (v5 < 0) {
      goto LABEL_135;
    }
    if (v5) {
      sub_21DE3CC60(0, v5, 1, a1, a2);
    }
    return;
  }
  uint64_t v7 = v6;
  uint64_t v8 = sub_21DE2E254(v5 / 2);
  char v106 = v9;
  uint64_t v108 = v8;
  uint64_t v104 = v5;
  uint64_t v98 = a1;
  if (v5 <= 0)
  {
    uint64_t v12 = (char *)MEMORY[0x263F8EE78];
    unint64_t v31 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_94:
    if (v31 >= 2)
    {
      uint64_t v89 = *v98;
      do
      {
        unint64_t v90 = v31 - 2;
        if (v31 < 2) {
          goto LABEL_129;
        }
        if (!v89) {
          goto LABEL_143;
        }
        uint64_t v91 = *(void *)&v12[16 * v90 + 32];
        uint64_t v92 = *(void *)&v12[16 * v31 + 24];
        sub_21DE3CD58((char *)(v89 + 8 * v91), (char *)(v89 + 8 * *(void *)&v12[16 * v31 + 16]), v89 + 8 * v92, v106, a2);
        if (v2) {
          goto LABEL_106;
        }
        if (v92 < v91) {
          goto LABEL_130;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v12 = sub_21DE2F304((uint64_t)v12);
        }
        if (v90 >= *((void *)v12 + 2)) {
          goto LABEL_131;
        }
        unint64_t v93 = &v12[16 * v90 + 32];
        *(void *)unint64_t v93 = v91;
        *((void *)v93 + 1) = v92;
        unint64_t v94 = *((void *)v12 + 2);
        if (v31 > v94) {
          goto LABEL_132;
        }
        memmove(&v12[16 * v31 + 16], &v12[16 * v31 + 32], 16 * (v94 - v31));
        *((void *)v12 + 2) = v94 - 1;
        unint64_t v31 = v94 - 1;
      }
      while (v94 > 2);
    }
    swift_bridgeObjectRelease();
    if (v104 >= -1)
    {
LABEL_113:
      *(void *)((v108 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_21DE3DEF0();
      swift_bridgeObjectRelease();
      return;
    }
    __break(1u);
LABEL_109:
    swift_bridgeObjectRelease();

LABEL_111:
LABEL_112:
    if (v104 < -1) {
      goto LABEL_136;
    }
    goto LABEL_113;
  }
  uint64_t v99 = v7;
  uint64_t v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v97 = v11 - 8;
  uint64_t v12 = (char *)MEMORY[0x263F8EE78];
  uint64_t v105 = v11;
  while (1)
  {
    uint64_t v13 = v10 + 1;
    if (v10 + 1 >= v5) {
      goto LABEL_21;
    }
    uint64_t v14 = *(void **)(v11 + 8 * v10);
    id v15 = *(id *)(v11 + 8 * v13);
    uint64_t v3 = v14;
    int v16 = a2(v15, v3);
    if (v2)
    {
      swift_bridgeObjectRelease();

      goto LABEL_111;
    }
    int v17 = v16;

    uint64_t v100 = v10;
    uint64_t v5 = v104;
    uint64_t v13 = v10 + 2;
    if (v10 + 2 >= v104) {
      goto LABEL_10;
    }
    do
    {
      uint64_t v18 = v11 + 8 * v10;
      uint64_t v19 = *(void **)(v18 + 8);
      id v20 = *(id *)(v18 + 16);
      uint64_t v3 = v19;
      int v21 = a2(v20, v3);

      uint64_t v5 = v104;
      if ((v17 ^ v21))
      {
        uint64_t v13 = v10 + 2;
        if (v17) {
          goto LABEL_11;
        }
LABEL_20:
        uint64_t v10 = v100;
        goto LABEL_21;
      }
      uint64_t v22 = v10 + 3;
      ++v10;
    }
    while (v22 < v104);
    uint64_t v13 = v104;
LABEL_10:
    if ((v17 & 1) == 0) {
      goto LABEL_20;
    }
LABEL_11:
    uint64_t v10 = v100;
    if (v13 < v100) {
      goto LABEL_140;
    }
    if (v100 < v13)
    {
      uint64_t v23 = (uint64_t *)(v97 + 8 * v13);
      uint64_t v24 = v13;
      uint64_t v25 = v100;
      uint64_t v26 = (uint64_t *)(v11 + 8 * v100);
      do
      {
        if (v25 != --v24)
        {
          if (!v11) {
            goto LABEL_144;
          }
          uint64_t v27 = *v26;
          *uint64_t v26 = *v23;
          *uint64_t v23 = v27;
        }
        ++v25;
        --v23;
        ++v26;
      }
      while (v25 < v24);
    }
LABEL_21:
    if (v13 < v5)
    {
      if (__OFSUB__(v13, v10)) {
        goto LABEL_137;
      }
      if (v13 - v10 < v99) {
        break;
      }
    }
LABEL_30:
    if (v13 < v10) {
      goto LABEL_134;
    }
    uint64_t v102 = v13;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v12 = sub_21DE2F20C(0, *((void *)v12 + 2) + 1, 1, v12);
    }
    unint64_t v30 = *((void *)v12 + 2);
    unint64_t v29 = *((void *)v12 + 3);
    unint64_t v31 = v30 + 1;
    if (v30 >= v29 >> 1) {
      uint64_t v12 = sub_21DE2F20C((char *)(v29 > 1), v30 + 1, 1, v12);
    }
    *((void *)v12 + 2) = v31;
    uint64_t v32 = v12 + 32;
    uint64_t v33 = &v12[16 * v30 + 32];
    *(void *)uint64_t v33 = v10;
    *((void *)v33 + 1) = v13;
    if (v30)
    {
      while (1)
      {
        unint64_t v34 = v31 - 1;
        if (v31 >= 4)
        {
          BOOL v39 = &v32[16 * v31];
          uint64_t v40 = *((void *)v39 - 8);
          uint64_t v41 = *((void *)v39 - 7);
          BOOL v45 = __OFSUB__(v41, v40);
          uint64_t v42 = v41 - v40;
          if (v45) {
            goto LABEL_119;
          }
          uint64_t v44 = *((void *)v39 - 6);
          uint64_t v43 = *((void *)v39 - 5);
          BOOL v45 = __OFSUB__(v43, v44);
          uint64_t v37 = v43 - v44;
          char v38 = v45;
          if (v45) {
            goto LABEL_120;
          }
          unint64_t v46 = v31 - 2;
          uint64_t v47 = &v32[16 * v31 - 32];
          uint64_t v49 = *(void *)v47;
          uint64_t v48 = *((void *)v47 + 1);
          BOOL v45 = __OFSUB__(v48, v49);
          uint64_t v50 = v48 - v49;
          if (v45) {
            goto LABEL_121;
          }
          BOOL v45 = __OFADD__(v37, v50);
          uint64_t v51 = v37 + v50;
          if (v45) {
            goto LABEL_123;
          }
          if (v51 >= v42)
          {
            uint64_t v69 = &v32[16 * v34];
            uint64_t v71 = *(void *)v69;
            uint64_t v70 = *((void *)v69 + 1);
            BOOL v45 = __OFSUB__(v70, v71);
            uint64_t v72 = v70 - v71;
            if (v45) {
              goto LABEL_133;
            }
            BOOL v62 = v37 < v72;
            goto LABEL_67;
          }
        }
        else
        {
          if (v31 != 3)
          {
            uint64_t v63 = *((void *)v12 + 4);
            uint64_t v64 = *((void *)v12 + 5);
            BOOL v45 = __OFSUB__(v64, v63);
            uint64_t v56 = v64 - v63;
            char v57 = v45;
            goto LABEL_61;
          }
          uint64_t v36 = *((void *)v12 + 4);
          uint64_t v35 = *((void *)v12 + 5);
          BOOL v45 = __OFSUB__(v35, v36);
          uint64_t v37 = v35 - v36;
          char v38 = v45;
        }
        if (v38) {
          goto LABEL_122;
        }
        unint64_t v46 = v31 - 2;
        uint64_t v52 = &v32[16 * v31 - 32];
        uint64_t v54 = *(void *)v52;
        uint64_t v53 = *((void *)v52 + 1);
        BOOL v55 = __OFSUB__(v53, v54);
        uint64_t v56 = v53 - v54;
        char v57 = v55;
        if (v55) {
          goto LABEL_124;
        }
        uint64_t v58 = &v32[16 * v34];
        uint64_t v60 = *(void *)v58;
        uint64_t v59 = *((void *)v58 + 1);
        BOOL v45 = __OFSUB__(v59, v60);
        uint64_t v61 = v59 - v60;
        if (v45) {
          goto LABEL_126;
        }
        if (__OFADD__(v56, v61)) {
          goto LABEL_128;
        }
        if (v56 + v61 >= v37)
        {
          BOOL v62 = v37 < v61;
LABEL_67:
          if (v62) {
            unint64_t v34 = v46;
          }
          goto LABEL_69;
        }
LABEL_61:
        if (v57) {
          goto LABEL_125;
        }
        unint64_t v65 = &v32[16 * v34];
        uint64_t v67 = *(void *)v65;
        uint64_t v66 = *((void *)v65 + 1);
        BOOL v45 = __OFSUB__(v66, v67);
        uint64_t v68 = v66 - v67;
        if (v45) {
          goto LABEL_127;
        }
        if (v68 < v56) {
          goto LABEL_78;
        }
LABEL_69:
        unint64_t v73 = v34 - 1;
        if (v34 - 1 >= v31)
        {
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
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
          goto LABEL_139;
        }
        if (!v11) {
          goto LABEL_141;
        }
        uint64_t v74 = v11;
        uint64_t v75 = v32;
        uint64_t v76 = &v32[16 * v73];
        uint64_t v77 = *(void *)v76;
        uint64_t v78 = v75;
        unint64_t v79 = v34;
        uint64_t v3 = &v75[16 * v34];
        uint64_t v80 = *((void *)v3 + 1);
        sub_21DE3CD58((char *)(v74 + 8 * *(void *)v76), (char *)(v74 + 8 * *(void *)v3), v74 + 8 * v80, v106, a2);
        if (v2)
        {
LABEL_106:
          swift_bridgeObjectRelease();
          goto LABEL_112;
        }
        if (v80 < v77) {
          goto LABEL_116;
        }
        if (v79 > *((void *)v12 + 2)) {
          goto LABEL_117;
        }
        *(void *)uint64_t v76 = v77;
        *(void *)&v78[16 * v73 + 8] = v80;
        unint64_t v81 = *((void *)v12 + 2);
        if (v79 >= v81) {
          goto LABEL_118;
        }
        uint64_t v32 = v78;
        unint64_t v31 = v81 - 1;
        memmove(v3, v3 + 16, 16 * (v81 - 1 - v79));
        *((void *)v12 + 2) = v81 - 1;
        BOOL v62 = v81 > 2;
        uint64_t v11 = v105;
        if (!v62) {
          goto LABEL_78;
        }
      }
    }
    unint64_t v31 = 1;
LABEL_78:
    uint64_t v10 = v102;
    uint64_t v5 = v104;
    if (v102 >= v104) {
      goto LABEL_94;
    }
  }
  if (__OFADD__(v10, v99)) {
    goto LABEL_138;
  }
  if (v10 + v99 >= v5) {
    uint64_t v28 = v5;
  }
  else {
    uint64_t v28 = v10 + v99;
  }
  if (v28 >= v10)
  {
    if (v13 != v28)
    {
      uint64_t v95 = v12;
      uint64_t v96 = v28;
      uint64_t v82 = v97 + 8 * v13;
      uint64_t v101 = v10;
      do
      {
        long long v83 = *(void **)(v11 + 8 * v13);
        uint64_t v103 = v82;
        while (1)
        {
          uint64_t v84 = v13;
          uint64_t v85 = *(void **)v82;
          unint64_t v31 = v83;
          uint64_t v3 = v85;
          char v86 = a2((id)v31, v3);
          if (v2) {
            goto LABEL_109;
          }
          char v87 = v86;

          if ((v87 & 1) == 0) {
            break;
          }
          if (!v11) {
            goto LABEL_142;
          }
          uint64_t v13 = v84;
          id v88 = *(void **)v82;
          long long v83 = *(void **)(v82 + 8);
          *(void *)uint64_t v82 = v83;
          *(void *)(v82 + 8) = v88;
          v82 -= 8;
          if (v84 == ++v10) {
            goto LABEL_88;
          }
        }
        uint64_t v13 = v84;
LABEL_88:
        ++v13;
        uint64_t v10 = v101;
        uint64_t v82 = v103 + 8;
      }
      while (v13 != v96);
      uint64_t v13 = v96;
      uint64_t v12 = v95;
    }
    goto LABEL_30;
  }
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
}

void sub_21DE3CC60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t (*a5)(id, id))
{
  if (a3 != a2)
  {
    uint64_t v6 = a3;
    uint64_t v7 = a1;
    uint64_t v8 = *a4;
    uint64_t v9 = *a4 + 8 * a3 - 8;
LABEL_4:
    uint64_t v10 = *(void **)(v8 + 8 * v6);
    uint64_t v18 = v9;
    while (1)
    {
      uint64_t v11 = *(void **)v9;
      id v12 = v10;
      id v13 = v11;
      char v14 = a5(v12, v13);

      if (v5) {
        break;
      }
      if (v14)
      {
        if (!v8)
        {
          __break(1u);
          return;
        }
        id v15 = *(void **)v9;
        uint64_t v10 = *(void **)(v9 + 8);
        *(void *)uint64_t v9 = v10;
        *(void *)(v9 + 8) = v15;
        v9 -= 8;
        if (v6 != ++v7) {
          continue;
        }
      }
      ++v6;
      uint64_t v9 = v18 + 8;
      uint64_t v7 = a1;
      if (v6 != a2) {
        goto LABEL_4;
      }
      return;
    }
  }
}

uint64_t sub_21DE3CD58(char *a1, char *a2, unint64_t a3, char *a4, uint64_t (*a5)(id, id))
{
  uint64_t v5 = (void **)a4;
  unint64_t v6 = a3;
  uint64_t v7 = a2;
  uint64_t v8 = a2 - a1;
  uint64_t v9 = (a2 - a1) / 8;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 8;
  uint64_t v48 = a1;
  if (v9 >= v11)
  {
    sub_21DE2E3B0(a2, (uint64_t)(a3 - (void)a2) / 8, a4);
    id v13 = &v5[v11];
    if (v48 >= v7 || v10 < 8) {
      goto LABEL_13;
    }
    uint64_t v33 = (char *)(v6 - 8);
    uint64_t v44 = (char *)v5;
    while (1)
    {
      unint64_t v45 = (unint64_t)v13;
      unint64_t v34 = (char *)(v13 - 1);
      uint64_t v35 = v7;
      uint64_t v37 = v7 - 8;
      uint64_t v36 = (void *)*((void *)v7 - 1);
      id v38 = *(v13 - 1);
      id v39 = v36;
      char v40 = a5(v38, v39);
      if (v47) {
        break;
      }
      char v41 = v40;
      uint64_t v42 = v33 + 8;

      if (v41)
      {
        BOOL v43 = v42 != v35 || v33 >= v35;
        uint64_t v7 = v37;
        id v13 = (void **)v45;
      }
      else
      {
        BOOL v43 = v42 != (char *)v45 || (unint64_t)v33 >= v45;
        uint64_t v37 = v34;
        id v13 = (void **)v34;
        uint64_t v7 = v35;
      }
      if (v43) {
        *(void *)uint64_t v33 = *(void *)v37;
      }
      uint64_t v5 = (void **)v44;
      if (v7 > v48)
      {
        v33 -= 8;
        if (v13 > (void **)v44) {
          continue;
        }
      }
      goto LABEL_13;
    }

    sub_21DE2E3B0(v44, (uint64_t)(v45 - (void)v44) / 8, v7);
  }
  else
  {
    sub_21DE2E3B0(a1, (a2 - a1) / 8, a4);
    id v13 = &v5[v9];
    if ((unint64_t)v7 < v6 && v8 >= 8)
    {
      uint64_t v20 = v47;
      while (1)
      {
        unint64_t v21 = v6;
        uint64_t v22 = v7;
        uint64_t v23 = v20;
        uint64_t v24 = *v5;
        id v25 = *(id *)v7;
        id v26 = v24;
        char v27 = a5(v25, v26);
        uint64_t v20 = v23;
        if (v23)
        {

          uint64_t v16 = v13 - v5;
          int v17 = (char *)v5;
          uint64_t v18 = v48;
          goto LABEL_14;
        }
        char v28 = v27;

        if ((v28 & 1) == 0) {
          break;
        }
        unint64_t v29 = (void **)v22;
        uint64_t v7 = v22 + 8;
        unint64_t v30 = v48;
        if (v48 != v22) {
          goto LABEL_21;
        }
LABEL_22:
        uint64_t v32 = (char *)(v30 + 1);
        if (v5 >= v13)
        {
          uint64_t v7 = v32;
          goto LABEL_13;
        }
        uint64_t v48 = v32;
        unint64_t v6 = v21;
        if ((unint64_t)v7 >= v21)
        {
          uint64_t v7 = v32;
          goto LABEL_13;
        }
      }
      unint64_t v29 = v5;
      unint64_t v30 = v48;
      BOOL v31 = v48 == (char *)v5++;
      uint64_t v7 = v22;
      if (v31) {
        goto LABEL_22;
      }
LABEL_21:
      void *v30 = *v29;
      goto LABEL_22;
    }
    uint64_t v7 = a1;
LABEL_13:
    uint64_t v16 = v13 - v5;
    int v17 = (char *)v5;
    uint64_t v18 = v7;
LABEL_14:
    sub_21DE2E3B0(v17, v16, v18);
  }
  return 1;
}

void sub_21DE3D004(unint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_21DE3BC6C(a1, *(void *)(v2 + 24), *(void *)(v2 + 32), a2);
}

void sub_21DE3D024(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_21DE3E100();
    swift_bridgeObjectRelease();
  }

  JUMPOUT(0x223C19810);
}

uint64_t sub_21DE3D0A0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
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

uint64_t sub_21DE3D0D8()
{
  sub_21DE3DCA0();
  OUTLINED_FUNCTION_4_4();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_21DE3D160(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(sub_21DE3DCA0() - 8);
  return sub_21DE3C25C(a1, a2, v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))) & 1;
}

uint64_t sub_21DE3D1E0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_4_4();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_21DE3D23C(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_4_4();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

ValueMetadata *type metadata accessor for TaskStructuredDataHandler()
{
  return &type metadata for TaskStructuredDataHandler;
}

uint64_t sub_21DE3D2A0()
{
  return 0x646E696B656D6F73;
}

uint64_t sub_21DE3D2C4()
{
  return 7;
}

uint64_t sub_21DE3D2CC()
{
  return 0x6B7361544E49;
}

ValueMetadata *type metadata accessor for TaskListStructuredDataHandler()
{
  return &type metadata for TaskListStructuredDataHandler;
}

unint64_t sub_21DE3D2F0()
{
  return 0xD000000000000012;
}

uint64_t sub_21DE3D30C()
{
  return 8;
}

uint64_t sub_21DE3D314()
{
  return 0x694C6B7361544E49;
}

unint64_t sub_21DE3D330()
{
  return 0xD000000000000012;
}

uint64_t sub_21DE3D350()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_21DE3D360()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_21DE3D370()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_21DE3D380()
{
  return MEMORY[0x270EEF3F0]();
}

uint64_t sub_21DE3D390()
{
  return MEMORY[0x270EEF460]();
}

uint64_t sub_21DE3D3A0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_21DE3D3B0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_21DE3D3C0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_21DE3D3D0()
{
  return MEMORY[0x270F6BFC8]();
}

uint64_t sub_21DE3D3E0()
{
  return MEMORY[0x270F6C0A0]();
}

uint64_t sub_21DE3D3F0()
{
  return MEMORY[0x270F6C0A8]();
}

uint64_t sub_21DE3D400()
{
  return MEMORY[0x270F6C810]();
}

uint64_t sub_21DE3D410()
{
  return MEMORY[0x270F6C848]();
}

uint64_t sub_21DE3D420()
{
  return MEMORY[0x270F6C850]();
}

uint64_t sub_21DE3D430()
{
  return MEMORY[0x270F6C948]();
}

uint64_t sub_21DE3D440()
{
  return MEMORY[0x270F6C950]();
}

uint64_t sub_21DE3D450()
{
  return MEMORY[0x270F6C960]();
}

uint64_t sub_21DE3D460()
{
  return MEMORY[0x270F6C968]();
}

uint64_t sub_21DE3D470()
{
  return MEMORY[0x270F6C970]();
}

uint64_t sub_21DE3D480()
{
  return MEMORY[0x270F6C980]();
}

uint64_t sub_21DE3D490()
{
  return MEMORY[0x270F6C9B0]();
}

uint64_t sub_21DE3D4A0()
{
  return MEMORY[0x270F6C9C0]();
}

uint64_t sub_21DE3D4B0()
{
  return MEMORY[0x270F6C9C8]();
}

uint64_t sub_21DE3D4C0()
{
  return MEMORY[0x270F6C9D0]();
}

uint64_t sub_21DE3D4D0()
{
  return MEMORY[0x270F6C9D8]();
}

uint64_t sub_21DE3D4E0()
{
  return MEMORY[0x270F6CCD0]();
}

uint64_t sub_21DE3D4F0()
{
  return MEMORY[0x270F6D0B8]();
}

uint64_t sub_21DE3D500()
{
  return MEMORY[0x270F6D220]();
}

uint64_t sub_21DE3D510()
{
  return MEMORY[0x270F6D228]();
}

uint64_t sub_21DE3D520()
{
  return MEMORY[0x270F6D328]();
}

uint64_t sub_21DE3D530()
{
  return MEMORY[0x270F6D338]();
}

uint64_t sub_21DE3D540()
{
  return MEMORY[0x270F6D3E8]();
}

uint64_t sub_21DE3D550()
{
  return MEMORY[0x270F6D3F0]();
}

uint64_t sub_21DE3D560()
{
  return MEMORY[0x270F6D3F8]();
}

uint64_t sub_21DE3D570()
{
  return MEMORY[0x270F6D530]();
}

uint64_t sub_21DE3D580()
{
  return MEMORY[0x270F6D538]();
}

uint64_t sub_21DE3D590()
{
  return MEMORY[0x270F6D778]();
}

uint64_t sub_21DE3D5A0()
{
  return MEMORY[0x270F6D780]();
}

uint64_t sub_21DE3D5B0()
{
  return MEMORY[0x270F6D788]();
}

uint64_t sub_21DE3D5C0()
{
  return MEMORY[0x270F6D8B8]();
}

uint64_t sub_21DE3D5D0()
{
  return MEMORY[0x270F6D8C8]();
}

uint64_t sub_21DE3D5E0()
{
  return MEMORY[0x270F6D8D0]();
}

uint64_t sub_21DE3D5F0()
{
  return MEMORY[0x270F6D8D8]();
}

uint64_t sub_21DE3D600()
{
  return MEMORY[0x270F6D8F0]();
}

uint64_t sub_21DE3D610()
{
  return MEMORY[0x270F6D8F8]();
}

uint64_t sub_21DE3D620()
{
  return MEMORY[0x270F6D900]();
}

uint64_t sub_21DE3D630()
{
  return MEMORY[0x270F6D968]();
}

uint64_t sub_21DE3D640()
{
  return MEMORY[0x270F6D970]();
}

uint64_t sub_21DE3D650()
{
  return MEMORY[0x270F6D988]();
}

uint64_t sub_21DE3D660()
{
  return MEMORY[0x270F6D9D8]();
}

uint64_t sub_21DE3D670()
{
  return MEMORY[0x270F6DB50]();
}

uint64_t sub_21DE3D680()
{
  return MEMORY[0x270F6DB58]();
}

uint64_t sub_21DE3D690()
{
  return MEMORY[0x270F6DB60]();
}

uint64_t sub_21DE3D6A0()
{
  return MEMORY[0x270F6DB78]();
}

uint64_t sub_21DE3D6B0()
{
  return MEMORY[0x270F6DB80]();
}

uint64_t sub_21DE3D6C0()
{
  return MEMORY[0x270F6DB88]();
}

uint64_t sub_21DE3D6D0()
{
  return MEMORY[0x270F6DB90]();
}

uint64_t sub_21DE3D6E0()
{
  return MEMORY[0x270F6DBD0]();
}

uint64_t sub_21DE3D6F0()
{
  return MEMORY[0x270F6DC30]();
}

uint64_t sub_21DE3D700()
{
  return MEMORY[0x270F6DC88]();
}

uint64_t sub_21DE3D710()
{
  return MEMORY[0x270F6DC90]();
}

uint64_t sub_21DE3D720()
{
  return MEMORY[0x270F6DCA0]();
}

uint64_t sub_21DE3D730()
{
  return MEMORY[0x270F6DE28]();
}

uint64_t sub_21DE3D740()
{
  return MEMORY[0x270F6DE30]();
}

uint64_t sub_21DE3D750()
{
  return MEMORY[0x270F6DE70]();
}

uint64_t sub_21DE3D760()
{
  return MEMORY[0x270F6DE78]();
}

uint64_t sub_21DE3D770()
{
  return MEMORY[0x270F6DFB8]();
}

uint64_t sub_21DE3D780()
{
  return MEMORY[0x270F6DFC0]();
}

uint64_t sub_21DE3D790()
{
  return MEMORY[0x270F6E260]();
}

uint64_t sub_21DE3D7A0()
{
  return MEMORY[0x270F6E268]();
}

uint64_t sub_21DE3D7B0()
{
  return MEMORY[0x270F6E280]();
}

uint64_t sub_21DE3D7C0()
{
  return MEMORY[0x270F6E288]();
}

uint64_t sub_21DE3D7D0()
{
  return MEMORY[0x270F6E290]();
}

uint64_t sub_21DE3D7E0()
{
  return MEMORY[0x270F6E430]();
}

uint64_t sub_21DE3D7F0()
{
  return MEMORY[0x270F6E438]();
}

uint64_t sub_21DE3D800()
{
  return MEMORY[0x270F6E610]();
}

uint64_t sub_21DE3D810()
{
  return MEMORY[0x270F6E618]();
}

uint64_t sub_21DE3D820()
{
  return MEMORY[0x270F6E620]();
}

uint64_t sub_21DE3D830()
{
  return MEMORY[0x270F6E628]();
}

uint64_t sub_21DE3D840()
{
  return MEMORY[0x270F6E7A0]();
}

uint64_t sub_21DE3D850()
{
  return MEMORY[0x270F6E7A8]();
}

uint64_t sub_21DE3D860()
{
  return MEMORY[0x270F6E7B0]();
}

uint64_t sub_21DE3D870()
{
  return MEMORY[0x270F6E7B8]();
}

uint64_t sub_21DE3D880()
{
  return MEMORY[0x270F6E9E8]();
}

uint64_t sub_21DE3D890()
{
  return MEMORY[0x270F6EA20]();
}

uint64_t sub_21DE3D8A0()
{
  return MEMORY[0x270F6EA28]();
}

uint64_t sub_21DE3D8B0()
{
  return MEMORY[0x270F6EA38]();
}

uint64_t sub_21DE3D8C0()
{
  return MEMORY[0x270F6EA40]();
}

uint64_t sub_21DE3D8D0()
{
  return MEMORY[0x270F6EA48]();
}

uint64_t sub_21DE3D8E0()
{
  return MEMORY[0x270F6EA50]();
}

uint64_t sub_21DE3D8F0()
{
  return MEMORY[0x270F6EA58]();
}

uint64_t sub_21DE3D900()
{
  return MEMORY[0x270F6EA60]();
}

uint64_t sub_21DE3D910()
{
  return MEMORY[0x270F6EA68]();
}

uint64_t sub_21DE3D920()
{
  return MEMORY[0x270F6EAA8]();
}

uint64_t sub_21DE3D930()
{
  return MEMORY[0x270F6EAB0]();
}

uint64_t sub_21DE3D940()
{
  return MEMORY[0x270F6EAC0]();
}

uint64_t sub_21DE3D950()
{
  return MEMORY[0x270F6EAC8]();
}

uint64_t sub_21DE3D960()
{
  return MEMORY[0x270F6F410]();
}

uint64_t sub_21DE3D970()
{
  return MEMORY[0x270F6F418]();
}

uint64_t sub_21DE3D980()
{
  return MEMORY[0x270F6F420]();
}

uint64_t sub_21DE3D990()
{
  return MEMORY[0x270F6F428]();
}

uint64_t sub_21DE3D9A0()
{
  return MEMORY[0x270F6F438]();
}

uint64_t sub_21DE3D9B0()
{
  return MEMORY[0x270F70740]();
}

uint64_t sub_21DE3D9C0()
{
  return MEMORY[0x270F6F4B0]();
}

uint64_t sub_21DE3D9D0()
{
  return MEMORY[0x270F6F4C0]();
}

uint64_t sub_21DE3D9E0()
{
  return MEMORY[0x270F6F4C8]();
}

uint64_t sub_21DE3D9F0()
{
  return MEMORY[0x270F6F4D0]();
}

uint64_t sub_21DE3DA00()
{
  return MEMORY[0x270F72A20]();
}

uint64_t sub_21DE3DA10()
{
  return MEMORY[0x270F72A28]();
}

uint64_t sub_21DE3DA20()
{
  return MEMORY[0x270F72AF0]();
}

uint64_t sub_21DE3DA30()
{
  return MEMORY[0x270F72B00]();
}

uint64_t sub_21DE3DA40()
{
  return MEMORY[0x270F72B08]();
}

uint64_t sub_21DE3DA50()
{
  return MEMORY[0x270F72B18]();
}

uint64_t sub_21DE3DA60()
{
  return MEMORY[0x270F72C20]();
}

uint64_t sub_21DE3DA70()
{
  return MEMORY[0x270F4CA20]();
}

uint64_t sub_21DE3DA80()
{
  return MEMORY[0x270F4CA38]();
}

uint64_t sub_21DE3DA90()
{
  return MEMORY[0x270F4CA40]();
}

uint64_t sub_21DE3DAA0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_21DE3DAB0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_21DE3DAC0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_21DE3DAD0()
{
  return MEMORY[0x270F70770]();
}

uint64_t sub_21DE3DAE0()
{
  return MEMORY[0x270F70778]();
}

uint64_t sub_21DE3DAF0()
{
  return MEMORY[0x270F70788]();
}

uint64_t sub_21DE3DB00()
{
  return MEMORY[0x270F70790]();
}

uint64_t sub_21DE3DB10()
{
  return MEMORY[0x270F707C0]();
}

uint64_t sub_21DE3DB20()
{
  return MEMORY[0x270F707C8]();
}

uint64_t sub_21DE3DB30()
{
  return MEMORY[0x270F707D8]();
}

uint64_t sub_21DE3DB40()
{
  return MEMORY[0x270F707E0]();
}

uint64_t sub_21DE3DB50()
{
  return MEMORY[0x270F70810]();
}

uint64_t sub_21DE3DB60()
{
  return MEMORY[0x270F70818]();
}

uint64_t sub_21DE3DB70()
{
  return MEMORY[0x270F70820]();
}

uint64_t sub_21DE3DB80()
{
  return MEMORY[0x270F70858]();
}

uint64_t sub_21DE3DB90()
{
  return MEMORY[0x270F70870]();
}

uint64_t sub_21DE3DBA0()
{
  return MEMORY[0x270F70878]();
}

uint64_t sub_21DE3DBB0()
{
  return MEMORY[0x270F70880]();
}

uint64_t sub_21DE3DBC0()
{
  return MEMORY[0x270F708B8]();
}

uint64_t sub_21DE3DBD0()
{
  return MEMORY[0x270F708D8]();
}

uint64_t sub_21DE3DBE0()
{
  return MEMORY[0x270F708F0]();
}

uint64_t sub_21DE3DBF0()
{
  return MEMORY[0x270F708F8]();
}

uint64_t sub_21DE3DC00()
{
  return MEMORY[0x270F70900]();
}

uint64_t sub_21DE3DC10()
{
  return MEMORY[0x270F70910]();
}

uint64_t sub_21DE3DC20()
{
  return MEMORY[0x270F70918]();
}

uint64_t sub_21DE3DC30()
{
  return MEMORY[0x270F70920]();
}

uint64_t sub_21DE3DC40()
{
  return MEMORY[0x270F70928]();
}

uint64_t sub_21DE3DC50()
{
  return MEMORY[0x270F70930]();
}

uint64_t sub_21DE3DC60()
{
  return MEMORY[0x270F70938]();
}

uint64_t sub_21DE3DC70()
{
  return MEMORY[0x270F70948]();
}

uint64_t sub_21DE3DC80()
{
  return MEMORY[0x270F70958]();
}

uint64_t sub_21DE3DC90()
{
  return MEMORY[0x270F70968]();
}

uint64_t sub_21DE3DCA0()
{
  return MEMORY[0x270F70990]();
}

uint64_t sub_21DE3DCB0()
{
  return MEMORY[0x270F70A10]();
}

uint64_t sub_21DE3DCC0()
{
  return MEMORY[0x270F70A18]();
}

uint64_t sub_21DE3DCD0()
{
  return MEMORY[0x270F80000]();
}

uint64_t sub_21DE3DCE0()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_21DE3DCF0()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_21DE3DD00()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_21DE3DD10()
{
  return MEMORY[0x270FA0BB0]();
}

uint64_t sub_21DE3DD20()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_21DE3DD30()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_21DE3DD40()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_21DE3DD50()
{
  return MEMORY[0x270F9D3C0]();
}

uint64_t sub_21DE3DD60()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_21DE3DD70()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_21DE3DD80()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_21DE3DD90()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_21DE3DDA0()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_21DE3DDB0()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_21DE3DDC0()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_21DE3DDD0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_21DE3DDE0()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_21DE3DDF0()
{
  return MEMORY[0x270F9D790]();
}

uint64_t sub_21DE3DE00()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_21DE3DE10()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_21DE3DE20()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_21DE3DE30()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_21DE3DE40()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_21DE3DE60()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_21DE3DE70()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_21DE3DE80()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_21DE3DE90()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_21DE3DEA0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_21DE3DEB0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_21DE3DEC0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_21DE3DED0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_21DE3DEE0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_21DE3DEF0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_21DE3DF00()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_21DE3DF10()
{
  return MEMORY[0x270F9DBF8]();
}

uint64_t sub_21DE3DF20()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_21DE3DF30()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_21DE3DF40()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_21DE3DF50()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_21DE3DF60()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_21DE3DF70()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_21DE3DF80()
{
  return MEMORY[0x270FA0F00]();
}

uint64_t sub_21DE3DF90()
{
  return MEMORY[0x270FA0F28]();
}

uint64_t sub_21DE3DFA0()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_21DE3DFB0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_21DE3DFC0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_21DE3DFD0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_21DE3DFE0()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_21DE3DFF0()
{
  return MEMORY[0x270EF2560]();
}

uint64_t sub_21DE3E010()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_21DE3E020()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_21DE3E030()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_21DE3E040()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_21DE3E050()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_21DE3E060()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_21DE3E070()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_21DE3E080()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_21DE3E090()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_21DE3E0A0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_21DE3E0B0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_21DE3E0C0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_21DE3E0D0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_21DE3E0E0()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_21DE3E0F0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_21DE3E100()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_21DE3E110()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_21DE3E120()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_21DE3E130()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_21DE3E140()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_21DE3E150()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_21DE3E160()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_21DE3E170()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t sub_21DE3E180()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_21DE3E190()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_21DE3E1A0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_21DE3E1B0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_21DE3E1C0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_21DE3E1D0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_21DE3E1E0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_21DE3E1F0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_21DE3E200()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_21DE3E210()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_21DE3E220()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_21DE3E230()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t LNIntentsValueTypeIdentifierAsString()
{
  return MEMORY[0x270F475D8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
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

uint64_t swift_initStaticObject()
{
  return MEMORY[0x270FA0480]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}