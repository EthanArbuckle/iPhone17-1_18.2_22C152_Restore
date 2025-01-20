uint64_t sub_25C89D77C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v4;

  v1[24] = v0;
  v2 = sub_25C8EC0F0();
  v1[25] = v2;
  v1[26] = *(void *)(v2 - 8);
  v1[27] = swift_task_alloc();
  v1[28] = swift_task_alloc();
  v1[29] = type metadata accessor for Signpost.OpenSignpost();
  v1[30] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C89D87C, 0, 0);
}

uint64_t sub_25C89D87C()
{
  if (qword_26A5D9538 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 232);
  uint64_t v1 = *(void *)(v0 + 240);
  uint64_t v3 = *(void *)(v0 + 192);
  id v4 = (id)qword_26A5D9BE0;
  sub_25C8EC0B0();
  sub_25C8EC310();
  uint64_t v11 = MEMORY[0x263F8EE78];
  LOBYTE(v10) = 2;
  sub_25C8EC090();
  uint64_t v5 = *(int *)(v2 + 20);
  *(_DWORD *)(v0 + 256) = v5;
  uint64_t v6 = v1 + v5;
  *(void *)uint64_t v6 = "MafHomeMemberNames";
  *(void *)(v6 + 8) = 18;
  *(_WORD *)(v6 + 16) = 258;
  v7 = *(void **)(v3 + 16);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 176;
  *(void *)(v0 + 24) = sub_25C89DA4C;
  uint64_t v8 = swift_continuation_init();
  *(void *)(v0 + 80) = MEMORY[0x263EF8330];
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_25C89E644;
  *(void *)(v0 + 104) = &block_descriptor;
  *(void *)(v0 + 112) = v8;
  objc_msgSend(v7, sel_homeUserIdToNames_, v0 + 80, 19, v10, v11);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_25C89DA4C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 248) = v1;
  if (v1) {
    uint64_t v2 = sub_25C89E548;
  }
  else {
    uint64_t v2 = sub_25C89DB5C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25C89DB5C()
{
  unint64_t v90 = v0;
  uint64_t v1 = *(void *)(v0 + 176);
  int64_t v2 = 0;
  *(void *)(v0 + 168) = sub_25C8EC130();
  uint64_t v3 = (uint64_t *)(v0 + 168);
  unint64_t v75 = v0;
  uint64_t v76 = v1 + 64;
  uint64_t v79 = v1;
  uint64_t v4 = -1;
  uint64_t v5 = -1 << *(unsigned char *)(v1 + 32);
  if (-v5 < 64) {
    uint64_t v4 = ~(-1 << -(char)v5);
  }
  unint64_t v6 = v4 & *(void *)(v1 + 64);
  int64_t v77 = (unint64_t)(63 - v5) >> 6;
  v78 = (uint64_t *)(v0 + 168);
  while (1)
  {
    while (1)
    {
      while (1)
      {
        if (v6)
        {
          unint64_t v7 = __clz(__rbit64(v6));
          v6 &= v6 - 1;
          unint64_t v8 = v7 | (v2 << 6);
        }
        else
        {
          int64_t v9 = v2 + 1;
          if (__OFADD__(v2, 1)) {
            goto LABEL_57;
          }
          unint64_t v6 = v75;
          if (v9 >= v77)
          {
LABEL_46:
            swift_release();
            if (qword_26A5D95A8 == -1)
            {
LABEL_47:
              __swift_project_value_buffer(*(void *)(v6 + 200), (uint64_t)qword_26A5DD5A0);
              uint64_t v58 = OUTLINED_FUNCTION_0();
              v59(v58);
              v60 = sub_25C8EC0D0();
              os_log_type_t v61 = sub_25C8EC2D0();
              BOOL v62 = os_log_type_enabled(v60, v61);
              uint64_t v63 = *(void *)(v6 + 216);
              uint64_t v64 = *(void *)(v6 + 200);
              if (v62)
              {
                uint64_t v87 = *(void *)(v6 + 200);
                v65 = (uint8_t *)swift_slowAlloc();
                v89[0] = swift_slowAlloc();
                *(_DWORD *)v65 = 136315138;
                swift_beginAccess();
                swift_bridgeObjectRetain();
                uint64_t v66 = sub_25C8EC120();
                unint64_t v68 = v67;
                swift_bridgeObjectRelease();
                *(void *)(v6 + 184) = sub_25C8BB4F0(v66, v68, v89);
                sub_25C8EC360();
                swift_bridgeObjectRelease();
                _os_log_impl(&dword_25C89B000, v60, v61, "Got these home member names from MAF: %s", v65, 0xCu);
                swift_arrayDestroy();
                OUTLINED_FUNCTION_3();
                OUTLINED_FUNCTION_3();

                OUTLINED_FUNCTION_4();
                uint64_t v70 = v63;
                uint64_t v71 = v87;
              }
              else
              {

                OUTLINED_FUNCTION_4();
                uint64_t v70 = v63;
                uint64_t v71 = v64;
              }
              v69(v70, v71);
              swift_beginAccess();
              uint64_t v73 = *(void *)(v6 + 168);
              sub_25C8EC300();
              sub_25C8EC0A0();
              sub_25C89E920(*(void *)(v6 + 240));
              swift_task_dealloc();
              swift_task_dealloc();
              swift_task_dealloc();
              v74 = *(uint64_t (**)(uint64_t))(v6 + 8);
              return v74(v73);
            }
LABEL_60:
            swift_once();
            goto LABEL_47;
          }
          unint64_t v10 = *(void *)(v76 + 8 * v9);
          ++v2;
          if (!v10)
          {
            int64_t v2 = v9 + 1;
            if (v9 + 1 >= v77) {
              goto LABEL_46;
            }
            unint64_t v10 = *(void *)(v76 + 8 * v2);
            if (!v10)
            {
              int64_t v2 = v9 + 2;
              if (v9 + 2 >= v77) {
                goto LABEL_46;
              }
              unint64_t v10 = *(void *)(v76 + 8 * v2);
              if (!v10)
              {
                int64_t v11 = v9 + 3;
                if (v11 >= v77) {
                  goto LABEL_46;
                }
                unint64_t v10 = *(void *)(v76 + 8 * v11);
                if (!v10)
                {
                  while (1)
                  {
                    int64_t v2 = v11 + 1;
                    if (__OFADD__(v11, 1)) {
                      goto LABEL_59;
                    }
                    if (v2 >= v77) {
                      goto LABEL_46;
                    }
                    unint64_t v10 = *(void *)(v76 + 8 * v2);
                    ++v11;
                    if (v10) {
                      goto LABEL_19;
                    }
                  }
                }
                int64_t v2 = v11;
              }
            }
          }
LABEL_19:
          unint64_t v6 = (v10 - 1) & v10;
          unint64_t v8 = __clz(__rbit64(v10)) + (v2 << 6);
        }
        uint64_t v12 = (uint64_t *)(*(void *)(v79 + 48) + 16 * v8);
        uint64_t v14 = *v12;
        unint64_t v13 = v12[1];
        v15 = *(void **)(*(void *)(v79 + 56) + 8 * v8);
        swift_bridgeObjectRetain();
        id v16 = v15;
        sub_25C89F40C(v16);
        uint64_t v18 = v17;
        swift_bridgeObjectRelease();
        if (v18) {
          break;
        }
        sub_25C89F418(v16);
        uint64_t v20 = v19;
        swift_bridgeObjectRelease();
        if (v20) {
          break;
        }
        uint64_t v86 = v14;
        if (qword_26A5D95A8 != -1) {
          swift_once();
        }
        __swift_project_value_buffer(*(void *)(v75 + 200), (uint64_t)qword_26A5DD5A0);
        uint64_t v44 = OUTLINED_FUNCTION_0();
        v45(v44);
        swift_bridgeObjectRetain();
        v46 = sub_25C8EC0D0();
        os_log_type_t v47 = sub_25C8EC2E0();
        BOOL v48 = os_log_type_enabled(v46, v47);
        uint64_t v49 = *(void *)(v75 + 224);
        uint64_t v50 = *(void *)(v75 + 200);
        if (v48)
        {
          uint64_t v83 = *(void *)(v75 + 224);
          uint64_t v51 = swift_slowAlloc();
          v89[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v51 = 136315138;
          swift_bridgeObjectRetain();
          *(void *)(v51 + 4) = sub_25C8BB4F0(v86, v13, v89);
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_25C89B000, v46, v47, "Did not get first or nick name for homeUserId=%s", (uint8_t *)v51, 0xCu);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_3();
          OUTLINED_FUNCTION_3();

          OUTLINED_FUNCTION_4();
          uint64_t v53 = v83;
        }
        else
        {

          swift_bridgeObjectRelease_n();
          OUTLINED_FUNCTION_4();
          uint64_t v53 = v49;
        }
        v52(v53, v50);
      }
      uint64_t v21 = sub_25C89F40C(v16);
      uint64_t v23 = v22;
      v85 = v16;
      uint64_t v25 = sub_25C89F418(v16);
      uint64_t v26 = v24;
      unint64_t v84 = v6;
      if (v23) {
        break;
      }
      if (v24)
      {
        uint64_t v81 = v21;
        uint64_t v82 = 0;
        int64_t v80 = v2;
        unint64_t v88 = MEMORY[0x263F8EE88];
LABEL_27:
        swift_bridgeObjectRetain();
        sub_25C8ACF08(v89, v25, v26);
        swift_bridgeObjectRelease();
        goto LABEL_28;
      }
      uint64_t v54 = *v3;
      swift_bridgeObjectRetain();
      sub_25C8E72CC(v14, v13);
      char v56 = v55;
      swift_bridgeObjectRelease();
      if (v56)
      {
        swift_isUniquelyReferenced_nonNull_native();
        v89[0] = v54;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D96C0);
        sub_25C8EC470();
        uint64_t v57 = v89[0];
        swift_bridgeObjectRelease();
        sub_25C8EC480();
        uint64_t *v78 = v57;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v3 = v78;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    int64_t v80 = v2;
    unint64_t v88 = MEMORY[0x263F8EE88];
    swift_bridgeObjectRetain();
    uint64_t v81 = v21;
    uint64_t v82 = v23;
    sub_25C8ACF08(v89, v21, v23);
    swift_bridgeObjectRelease();
    if (v26) {
      goto LABEL_27;
    }
LABEL_28:
    uint64_t v27 = v26;
    unint64_t v6 = v88;
    uint64_t v28 = *v3;
    swift_isUniquelyReferenced_nonNull_native();
    v89[0] = v28;
    *uint64_t v3 = 0x8000000000000000;
    uint64_t v29 = v14;
    unint64_t v30 = sub_25C8E72CC(v14, v13);
    if (__OFADD__(*(void *)(v28 + 16), (v31 & 1) == 0))
    {
      __break(1u);
LABEL_57:
      __break(1u);
LABEL_58:
      __break(1u);
LABEL_59:
      __break(1u);
      goto LABEL_60;
    }
    unint64_t v32 = v30;
    char v33 = v31;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D96C0);
    char v34 = sub_25C8EC470();
    v35 = (void *)v89[0];
    if (v34) {
      break;
    }
LABEL_32:
    if (v33)
    {
      uint64_t v38 = v35[7] + 104 * v32;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(void *)uint64_t v38 = v81;
      *(void *)(v38 + 8) = v82;
      *(_OWORD *)(v38 + 16) = 0u;
      *(_OWORD *)(v38 + 32) = 0u;
      *(_OWORD *)(v38 + 48) = 0u;
      *(void *)(v38 + 64) = v25;
      *(void *)(v38 + 72) = v27;
      *(void *)(v38 + 80) = 0;
      *(void *)(v38 + 88) = 0;
      *(void *)(v38 + 96) = v88;
    }
    else
    {
      v35[(v32 >> 6) + 8] |= 1 << v32;
      v39 = (uint64_t *)(v35[6] + 16 * v32);
      uint64_t *v39 = v29;
      v39[1] = v13;
      uint64_t v40 = v35[7] + 104 * v32;
      *(void *)uint64_t v40 = v81;
      *(void *)(v40 + 8) = v82;
      *(_OWORD *)(v40 + 16) = 0u;
      *(_OWORD *)(v40 + 32) = 0u;
      *(_OWORD *)(v40 + 48) = 0u;
      *(void *)(v40 + 64) = v25;
      *(void *)(v40 + 72) = v27;
      *(void *)(v40 + 80) = 0;
      *(void *)(v40 + 88) = 0;
      *(void *)(v40 + 96) = v88;
      uint64_t v41 = v35[2];
      BOOL v42 = __OFADD__(v41, 1);
      uint64_t v43 = v41 + 1;
      if (v42) {
        goto LABEL_58;
      }
      v35[2] = v43;
      swift_bridgeObjectRetain();
    }
    uint64_t v3 = v78;
    uint64_t *v78 = (uint64_t)v35;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    int64_t v2 = v80;
    unint64_t v6 = v84;
  }
  unint64_t v36 = sub_25C8E72CC(v29, v13);
  if ((v33 & 1) == (v37 & 1))
  {
    unint64_t v32 = v36;
    goto LABEL_32;
  }
  return sub_25C8EC5A0();
}

uint64_t sub_25C89E548()
{
  uint64_t v1 = (void *)v0[31];
  swift_willThrow();
  uint64_t v2 = sub_25C8EC130();

  sub_25C8EC300();
  sub_25C8EC0A0();
  sub_25C89E920(v0[30]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(uint64_t))v0[1];
  return v3(v2);
}

uint64_t sub_25C89E644(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    id v4 = a3;
    return sub_25C89E6D0(v3, (uint64_t)v4);
  }
  else
  {
    sub_25C89E9B4();
    uint64_t v6 = sub_25C8EC110();
    return sub_25C89E734(v3, v6);
  }
}

uint64_t sub_25C89E6D0(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D96D0);
  uint64_t v4 = swift_allocError();
  *uint64_t v5 = a2;
  return MEMORY[0x270FA2410](a1, v4);
}

uint64_t sub_25C89E734(uint64_t a1, uint64_t a2)
{
  **(void **)(*(void *)(a1 + 64) + 40) = a2;
  return MEMORY[0x270FA2408]();
}

uint64_t sub_25C89E754()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t variable initialization expression of IdentityNLv3Intent.verbNode()
{
  return OUTLINED_FUNCTION_2(&qword_26A5D95C8);
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

uint64_t variable initialization expression of IdentityNLv3Intent.nounNode()
{
  return OUTLINED_FUNCTION_2(&qword_26A5D95D0);
}

uint64_t variable initialization expression of IdentityNLv3Intent.referenceNode()
{
  return OUTLINED_FUNCTION_1(&qword_26A5D95D8);
}

uint64_t variable initialization expression of IdentityNLv3Intent.userIdentityNode()
{
  return sub_25C8C7E44();
}

uint64_t variable initialization expression of IdentityNLv3Intent.identityConfirmationNode()
{
  return OUTLINED_FUNCTION_1((uint64_t *)&unk_26A5D95E0);
}

uint64_t sub_25C89E890(uint64_t *a1)
{
  return sub_25C8EBB10();
}

uint64_t variable initialization expression of IdentityFlowProvider.disallowInSharing()
{
  return 0;
}

uint64_t variable initialization expression of SwitchProfileUseCases.useCase()
{
  return 3;
}

uint64_t variable initialization expression of UserIdentifyIntentResponse.code()
{
  return 0;
}

uint64_t variable initialization expression of SwitchProfileIntentResponse.code()
{
  return 0;
}

uint64_t type metadata accessor for AssistantServicesProvider()
{
  return self;
}

uint64_t sub_25C89E920(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Signpost.OpenSignpost();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_25C89E9B4()
{
  unint64_t result = qword_26A5D96C8;
  if (!qword_26A5D96C8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A5D96C8);
  }
  return result;
}

void type metadata accessor for FLOWSchemaFLOWProfileSwitchByNameType(uint64_t a1)
{
}

void type metadata accessor for FLOWSchemaFLOWProfileSwitchMethod(uint64_t a1)
{
}

void sub_25C89EA1C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t OUTLINED_FUNCTION_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_1(uint64_t *a1)
{
  return sub_25C89E890(a1);
}

uint64_t OUTLINED_FUNCTION_2(uint64_t *a1)
{
  return sub_25C89E890(a1);
}

void OUTLINED_FUNCTION_3()
{
  JUMPOUT(0x261198330);
}

void sub_25C89EAB8()
{
  id v0 = objc_msgSend(self, sel_defaultContext);
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F285E0]), sel_initWithInstanceContext_, v0);

  qword_26A5D9A50 = (uint64_t)v1;
}

void *sub_25C89EB24()
{
  uint64_t v0 = sub_25C8EC0F0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A5D9530 != -1) {
    swift_once();
  }
  uint64_t v4 = (void *)qword_26A5D9A50;
  if (!qword_26A5D9A50)
  {
    if (qword_26A5D95A8 != -1) {
      swift_once();
    }
    uint64_t v5 = __swift_project_value_buffer(v0, (uint64_t)qword_26A5DD5A0);
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
    uint64_t v6 = sub_25C8EC0D0();
    os_log_type_t v7 = sub_25C8EC2E0();
    if (os_log_type_enabled(v6, v7))
    {
      unint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v8 = 0;
      _os_log_impl(&dword_25C89B000, v6, v7, "Did not get AFSettingsConnection", v8, 2u);
      MEMORY[0x261198330](v8, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  id v9 = v4;
  return v4;
}

id sub_25C89ECFC()
{
  id v1 = objc_allocWithZone(v0);
  uint64_t v2 = (void *)sub_25C8EC160();
  id v3 = sub_25C89F424(0, 0xE000000000000000, (uint64_t)v2, v1);

  id v4 = v3;
  uint64_t v5 = (void *)sub_25C8EC260();
  objc_msgSend(v4, sel_setFullConfidence_, v5);

  uint64_t v6 = (void *)sub_25C8EC260();
  objc_msgSend(v4, sel_setSetupInProgress_, v6);

  os_log_type_t v7 = (void *)sub_25C8EC260();
  objc_msgSend(v4, sel_setIsMultiUserContext_, v7);

  return v4;
}

void sub_25C89EDE8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9A58);
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_4_0();
  os_log_type_t v7 = (void *)(v6 - v5);
  uint64_t v8 = sub_25C8EAF50();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_4_0();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9A60);
  MEMORY[0x270FA5388](v13 - 8);
  OUTLINED_FUNCTION_4_0();
  uint64_t v16 = v15 - v14;
  uint64_t v54 = 0;
  id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFEAF0]), sel_init);
  sub_25C89F37C(a1, v16);
  uint64_t v18 = sub_25C8EB5D0();
  if (__swift_getEnumTagSinglePayload(v16, 1, v18) == 1)
  {
    sub_25C89F4B0(v16, &qword_26A5D9A60);
    goto LABEL_16;
  }
  uint64_t v19 = (void *)sub_25C8EB5C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8))(v16, v18);
  if (v19)
  {
    sub_25C89F50C(v19, (SEL *)&selRef_firstName);
    if (v20)
    {
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_0_0();
      if (v22)
      {
        __break(1u);
        goto LABEL_37;
      }
      uint64_t v54 = v21;
      swift_bridgeObjectRetain();
      id v23 = v17;
      uint64_t v24 = (void *)OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_11((uint64_t)v24, sel_setGivenName_);

      OUTLINED_FUNCTION_7();
    }
    sub_25C89F50C(v19, (SEL *)&selRef_middleName);
    if (!v25)
    {
LABEL_10:
      sub_25C89F50C(v19, (SEL *)&selRef_lastName);
      if (!v29)
      {
LABEL_13:
        sub_25C89F50C(v19, (SEL *)&selRef_nickName);
        if (!v33)
        {

          goto LABEL_33;
        }
        OUTLINED_FUNCTION_3_0();
        OUTLINED_FUNCTION_1_0();
        OUTLINED_FUNCTION_0_0();
        if (!v22)
        {
          uint64_t v54 = v34;
          id v35 = v17;
          swift_bridgeObjectRetain();
          unint64_t v36 = (void *)OUTLINED_FUNCTION_5();
          OUTLINED_FUNCTION_11((uint64_t)v36, sel_setNickname_);

          OUTLINED_FUNCTION_7();
          goto LABEL_33;
        }
        goto LABEL_39;
      }
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_0_0();
      if (!v22)
      {
        uint64_t v54 = v30;
        id v31 = v17;
        swift_bridgeObjectRetain();
        unint64_t v32 = (void *)OUTLINED_FUNCTION_5();
        OUTLINED_FUNCTION_11((uint64_t)v32, sel_setFamilyName_);

        OUTLINED_FUNCTION_7();
        goto LABEL_13;
      }
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_0_0();
    if (!v22)
    {
      uint64_t v54 = v26;
      id v27 = v17;
      swift_bridgeObjectRetain();
      uint64_t v28 = (void *)OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_11((uint64_t)v28, sel_setMiddleName_);

      OUTLINED_FUNCTION_7();
      goto LABEL_10;
    }
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
LABEL_16:
  sub_25C89F50C(v2, (SEL *)&selRef_name);
  if (!v37) {
    goto LABEL_33;
  }
  sub_25C8EAF60();
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8) == 1)
  {
    sub_25C89F4B0((uint64_t)v7, &qword_26A5D9A58);
    goto LABEL_33;
  }
  (*(void (**)(uint64_t, void *, uint64_t))(v9 + 32))(v12, v7, v8);
  sub_25C8EAF10();
  if (v38)
  {
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_0_0();
    if (!v22)
    {
      uint64_t v54 = v39;
      id v40 = v17;
      OUTLINED_FUNCTION_9();
      uint64_t v41 = (void *)OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_6((uint64_t)v41, sel_setGivenName_);

      OUTLINED_FUNCTION_10();
      goto LABEL_23;
    }
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
LABEL_23:
  sub_25C8EAF30();
  if (!v42) {
    goto LABEL_26;
  }
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
  if (v22)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  uint64_t v54 = v43;
  id v44 = v17;
  OUTLINED_FUNCTION_9();
  v45 = (void *)OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((uint64_t)v45, sel_setMiddleName_);

  OUTLINED_FUNCTION_10();
LABEL_26:
  sub_25C8EAF20();
  if (!v46) {
    goto LABEL_29;
  }
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
  if (v22)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  uint64_t v54 = v47;
  id v48 = v17;
  OUTLINED_FUNCTION_9();
  uint64_t v49 = (void *)OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((uint64_t)v49, sel_setFamilyName_);

  OUTLINED_FUNCTION_10();
LABEL_29:
  sub_25C8EAF40();
  if (v50)
  {
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_0_0();
    if (!v22)
    {
      uint64_t v54 = v51;
      id v52 = v17;
      OUTLINED_FUNCTION_9();
      uint64_t v53 = (void *)OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_6((uint64_t)v53, sel_setNickname_);

      OUTLINED_FUNCTION_10();
      goto LABEL_32;
    }
LABEL_43:
    __break(1u);
    return;
  }
LABEL_32:
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v12, v8);
LABEL_33:
  swift_beginAccess();
  if (!v54) {
}
  }

uint64_t sub_25C89F37C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9A60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_25C89F40C(void *a1)
{
  return sub_25C89F50C(a1, (SEL *)&selRef_firstName);
}

uint64_t sub_25C89F418(void *a1)
{
  return sub_25C89F50C(a1, (SEL *)&selRef_nickName);
}

id sub_25C89F424(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = (void *)sub_25C8EC160();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(a4, sel_initWithIdentifier_displayString_, v6, a3);

  return v7;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_25C89F4B0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25C89F50C(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = sub_25C8EC170();

  return v4;
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return v0 - 88;
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return v0 - 88;
}

uint64_t OUTLINED_FUNCTION_5()
{
  return sub_25C8EC160();
}

id OUTLINED_FUNCTION_6(uint64_t a1, const char *a2)
{
  return objc_msgSend(v3, a2, v2);
}

uint64_t OUTLINED_FUNCTION_7()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_8()
{
  return sub_25C8EC160();
}

uint64_t OUTLINED_FUNCTION_9()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_10()
{
  return swift_bridgeObjectRelease_n();
}

id OUTLINED_FUNCTION_11(uint64_t a1, const char *a2)
{
  return objc_msgSend(v3, a2, v2);
}

uint64_t initializeBufferWithCopyOfBuffer for RemoteDeviceFilter(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for RemoteDeviceFilter()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for RemoteDeviceFilter(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v3 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v3;
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for RemoteDeviceFilter(uint64_t a1, long long *a2)
{
  long long v4 = *a2;
  *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
  *(_OWORD *)a1 = v4;
  *(void *)(a1 + 24) = *((void *)a2 + 3);
  *(void *)(a1 + 32) = *((void *)a2 + 4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *((void *)a2 + 5);
  *(void *)(a1 + 48) = *((void *)a2 + 6);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for RemoteDeviceFilter(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RemoteDeviceFilter(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 56))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 32);
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

uint64_t storeEnumTagSinglePayload for RemoteDeviceFilter(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 0;
    }
    if (a2) {
      *(void *)(result + 32) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteDeviceFilter()
{
  return &type metadata for RemoteDeviceFilter;
}

uint64_t sub_25C89F8E0()
{
  uint64_t v1 = sub_25C89F940(v0);
  sub_25C89FA20(v0);
  sub_25C8EC1C0();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_25C89F940(uint64_t a1)
{
  sub_25C89FB04(a1 + 24, (uint64_t)v4);
  sub_25C89FB04((uint64_t)v4, (uint64_t)&v5);
  if (!v6) {
    return 0;
  }
  uint64_t v1 = HIBYTE(v6) & 0xF;
  if ((v6 & 0x2000000000000000) == 0) {
    uint64_t v1 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (!v1) {
    return 0;
  }
  sub_25C8EC3D0();
  swift_bridgeObjectRelease();
  strcpy((char *)v3, "deviceName: \"");
  HIWORD(v3[1]) = -4864;
  sub_25C8EC1C0();
  sub_25C8EC1C0();
  return v3[0];
}

uint64_t sub_25C89FA20(uint64_t a1)
{
  sub_25C89FB04(a1 + 40, (uint64_t)v3);
  sub_25C89FB04((uint64_t)v3, (uint64_t)&v4);
  if (!v5) {
    return 0;
  }
  uint64_t v1 = HIBYTE(v5) & 0xF;
  if ((v5 & 0x2000000000000000) == 0) {
    uint64_t v1 = v4 & 0xFFFFFFFFFFFFLL;
  }
  if (!v1) {
    return 0;
  }
  sub_25C8EC1C0();
  sub_25C8EC1C0();
  return 0x22203A6D6F6F72;
}

uint64_t sub_25C89FAC0()
{
  return sub_25C89F8E0();
}

uint64_t sub_25C89FB04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9A68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C89FB6C(uint64_t a1, uint64_t a2)
{
  v2[28] = a1;
  v2[29] = a2;
  uint64_t v3 = sub_25C8EC0F0();
  v2[30] = v3;
  v2[31] = *(void *)(v3 - 8);
  v2[32] = swift_task_alloc();
  v2[33] = swift_task_alloc();
  v2[34] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C89FC48, 0, 0);
}

uint64_t sub_25C89FC48()
{
  unint64_t v75 = v0;
  uint64_t v1 = (uint64_t)(v0 + 14);
  uint64_t v2 = (uint64_t)(v0 + 16);
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  uint64_t v3 = v0 + 27;
  v72 = v0;
  uint64_t v5 = v0 + 28;
  uint64_t v4 = v0[28];
  uint64_t v6 = v0[34];
  uint64_t v7 = v0[30];
  uint64_t v8 = v0[31];
  uint64_t v9 = __swift_project_value_buffer(v7, (uint64_t)qword_26A5DD5A0);
  uint64_t v71 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  v71(v6, v9, v7);
  sub_25C89FB04(v4 + 24, (uint64_t)(v0 + 16));
  sub_25C89FB04(v4 + 40, (uint64_t)(v0 + 14));
  sub_25C8A07AC((uint64_t)(v0 + 16));
  sub_25C8A07AC((uint64_t)(v0 + 14));
  sub_25C8A07AC((uint64_t)(v0 + 16));
  sub_25C8A07AC((uint64_t)(v0 + 14));
  uint64_t v10 = sub_25C8EC0D0();
  os_log_type_t type = sub_25C8EC2D0();
  BOOL v11 = os_log_type_enabled(v10, type);
  uint64_t v12 = v5[6];
  uint64_t v14 = v5[2];
  uint64_t v13 = v5[3];
  uint64_t v65 = v1;
  if (v11)
  {
    uint64_t v61 = v5[3];
    uint64_t v63 = v5[6];
    uint64_t v15 = *v5;
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v73 = swift_slowAlloc();
    uint64_t v58 = v16;
    *(_DWORD *)uint64_t v16 = 136315138;
    sub_25C8A07AC(v2);
    sub_25C8A07AC(v1);
    uint64_t v17 = sub_25C89F940(v15);
    unint64_t v19 = v18;
    sub_25C89FA20(v15);
    v74[0] = v17;
    v74[1] = v19;
    sub_25C8EC1C0();
    swift_bridgeObjectRelease();
    sub_25C8A07D8(v2);
    sub_25C8A07D8(v1);
    *uint64_t v3 = sub_25C8BB4F0(v17, v19, &v73);
    sub_25C8EC360();
    swift_bridgeObjectRelease();
    sub_25C8A07D8(v2);
    sub_25C8A07D8(v1);
    sub_25C8A07D8(v2);
    sub_25C8A07D8(v1);
    _os_log_impl(&dword_25C89B000, v10, type, "#hal Invoking device resolution service with filter: %s", v58, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();

    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v61 + 8);
    v20(v63, v14);
  }
  else
  {
    sub_25C8A07D8(v2);
    sub_25C8A07D8(v1);
    sub_25C8A07D8(v2);
    sub_25C8A07D8(v1);

    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v20(v12, v14);
  }
  uint64_t v21 = v72;
  uint64_t v22 = swift_bridgeObjectRetain();
  unint64_t v23 = sub_25C8D9150(v22);
  swift_bridgeObjectRelease();
  swift_retain();
  swift_bridgeObjectRetain();
  if ((v23 & 0x8000000000000000) != 0 || (uint64_t v24 = (void *)v23, (v23 & 0x4000000000000000) != 0))
  {
    uint64_t v24 = sub_25C8D907C(v23);
    swift_release();
  }
  v74[0] = (uint64_t)v24;
  sub_25C8A0804(v74);
  typea = v20;
  uint64_t v64 = v72 + 20;
  uint64_t v25 = v72 + 24;
  uint64_t v26 = v72[33];
  uint64_t v27 = v72[30];
  swift_release_n();
  v72[24] = v74[0];
  v71(v26, v9, v27);
  uint64_t v28 = sub_25C8EC0D0();
  os_log_type_t v29 = sub_25C8EC2D0();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v67 = v9;
    uint64_t v62 = v2;
    uint64_t v30 = swift_slowAlloc();
    v74[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v30 = 134218242;
    swift_beginAccess();
    if ((unint64_t)*v25 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v31 = sub_25C8EC4F0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v31 = *(void *)((*v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v21 = v72;
    uint64_t v59 = v72[30];
    uint64_t v60 = v72[33];
    v72[25] = v31;
    sub_25C8EC360();
    *(_WORD *)(v30 + 12) = 2080;
    unint64_t v32 = swift_bridgeObjectRetain();
    uint64_t v33 = sub_25C8D81C4(v32);
    unint64_t v35 = v34;
    swift_bridgeObjectRelease();
    v72[26] = sub_25C8BB4F0(v33, v35, v74);
    sub_25C8EC360();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C89B000, v28, v29, "#hal %ld device(s): %s", (uint8_t *)v30, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();

    typea(v60, v59);
    uint64_t v2 = v62;
    uint64_t v9 = v67;
  }
  else
  {
    uint64_t v36 = v72[33];
    uint64_t v37 = v72[30];

    typea(v36, v37);
  }
  sub_25C89FB04(v65, (uint64_t)v64);
  uint64_t v38 = v21[21];
  if (v38)
  {
    uint64_t v39 = *v64;
    swift_beginAccess();
    sub_25C8A07AC(v65);
    unint64_t v40 = swift_bridgeObjectRetain();
    *uint64_t v25 = sub_25C8A0554(v40, v39, v38, MEMORY[0x263F75968]);
    swift_bridgeObjectRelease();
  }
  sub_25C89FB04(v2, (uint64_t)(v21 + 18));
  uint64_t v41 = v21[19];
  if (v41)
  {
    uint64_t v42 = v21[18];
    swift_beginAccess();
    sub_25C8A07AC(v2);
    unint64_t v43 = swift_bridgeObjectRetain();
    *uint64_t v25 = sub_25C8A0554(v43, v42, v41, MEMORY[0x263F75960]);
    swift_bridgeObjectRelease();
  }
  v71(v21[32], v9, v21[30]);
  unint64_t v44 = v21[24];
  swift_bridgeObjectRetain_n();
  v45 = sub_25C8EC0D0();
  os_log_type_t v46 = sub_25C8EC2D0();
  if (os_log_type_enabled(v45, v46))
  {
    uint64_t v47 = swift_slowAlloc();
    v74[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v47 = 134218242;
    if (v44 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_25C8EC4F0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v48 = *(void *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v21 = v72;
    uint64_t v66 = v72[30];
    uint64_t v68 = v72[32];
    swift_bridgeObjectRelease();
    v72[23] = v48;
    sub_25C8EC360();
    swift_bridgeObjectRelease();
    *(_WORD *)(v47 + 12) = 2080;
    uint64_t v49 = sub_25C8D81C4(v44);
    v72[22] = sub_25C8BB4F0(v49, v50, v74);
    sub_25C8EC360();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25C89B000, v45, v46, "#hal %ld device(s) match provided filter: %s", (uint8_t *)v47, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();

    uint64_t v51 = v66;
    uint64_t v52 = v68;
  }
  else
  {
    uint64_t v53 = v21[32];
    uint64_t v54 = v21[30];
    swift_bridgeObjectRelease_n();

    uint64_t v52 = v53;
    uint64_t v51 = v54;
  }
  typea(v52, v51);
  swift_beginAccess();
  uint64_t v55 = v21[24];
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  char v56 = (uint64_t (*)(uint64_t))v21[1];
  return v56(v55);
}

uint64_t sub_25C8A0554(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v20 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_24;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v5)
  {
    while (1)
    {
      unint64_t v6 = 0;
      uint64_t v7 = a3;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v8 = (id)MEMORY[0x261197B40](v6, a1);
LABEL_7:
        uint64_t v9 = v8;
        unint64_t v10 = v6 + 1;
        if (__OFADD__(v6, 1)) {
          goto LABEL_23;
        }
        uint64_t v11 = a4();
        if (v12)
        {
          if (v11 == a2 && v12 == v7)
          {
            swift_bridgeObjectRelease();
          }
          else
          {
            char v14 = sub_25C8EC550();
            swift_bridgeObjectRelease();
            if ((v14 & 1) == 0)
            {

LABEL_18:
              uint64_t v7 = a3;
              goto LABEL_19;
            }
          }
          sub_25C8EC410();
          sub_25C8EC440();
          sub_25C8EC450();
          sub_25C8EC420();
          goto LABEL_18;
        }

LABEL_19:
        ++v6;
        if (v10 == v5)
        {
          uint64_t v15 = v20;
          goto LABEL_26;
        }
      }
      if (v6 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      uint64_t v5 = sub_25C8EC4F0();
      if (!v5) {
        goto LABEL_25;
      }
    }
    id v8 = *(id *)(a1 + 8 * v6 + 32);
    goto LABEL_7;
  }
LABEL_25:
  uint64_t v15 = MEMORY[0x263F8EE78];
LABEL_26:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_25C8A0704(uint64_t a1)
{
  if (a1 < 0)
  {
    uint64_t result = sub_25C8EC4C0();
    __break(1u);
  }
  else if (a1)
  {
    sub_25C8EC000();
    uint64_t result = sub_25C8EC240();
    *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10) = a1;
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_25C8A07AC(uint64_t a1)
{
  return a1;
}

uint64_t sub_25C8A07D8(uint64_t a1)
{
  return a1;
}

uint64_t sub_25C8A0804(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    sub_25C8A1400();
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_25C8A0880(v6);
  return sub_25C8EC420();
}

void sub_25C8A0880(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = sub_25C8EC530();
  if (v4 >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3) {
        sub_25C8A0FA0(0, v3, 1, a1);
      }
      return;
    }
    goto LABEL_135;
  }
  uint64_t v5 = v4;
  uint64_t v6 = sub_25C8A0704(v3 / 2);
  __dst = v7;
  uint64_t v112 = v6;
  uint64_t v108 = v3;
  v104 = a1;
  if (v3 <= 0)
  {
LABEL_97:
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
    unint64_t v45 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_98:
    if (v45 < 2)
    {
      uint64_t v95 = v108;
LABEL_111:
      swift_bridgeObjectRelease();
      if (v95 >= -1) {
        goto LABEL_112;
      }
      goto LABEL_139;
    }
    uint64_t v96 = *v104;
    uint64_t v95 = v108;
    while (1)
    {
      unint64_t v97 = v45 - 2;
      if (v45 < 2) {
        break;
      }
      if (!v96) {
        goto LABEL_143;
      }
      v98 = v10;
      uint64_t v99 = *(void *)&v10[16 * v97 + 32];
      uint64_t v100 = *(void *)&v10[16 * v45 + 24];
      sub_25C8A1094((id *)(v96 + 8 * v99), (id *)(v96 + 8 * *(void *)&v10[16 * v45 + 16]), v96 + 8 * v100, __dst);
      if (v1) {
        goto LABEL_95;
      }
      if (v100 < v99) {
        goto LABEL_130;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        v98 = sub_25C8A13EC((uint64_t)v98);
      }
      if (v97 >= *((void *)v98 + 2)) {
        goto LABEL_131;
      }
      v101 = &v98[16 * v97 + 32];
      *(void *)v101 = v99;
      *((void *)v101 + 1) = v100;
      unint64_t v102 = *((void *)v98 + 2);
      if (v45 > v102) {
        goto LABEL_132;
      }
      memmove(&v98[16 * v45 + 16], &v98[16 * v45 + 32], 16 * (v102 - v45));
      unint64_t v10 = v98;
      *((void *)v98 + 2) = v102 - 1;
      unint64_t v45 = v102 - 1;
      if (v102 <= 2) {
        goto LABEL_111;
      }
    }
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
LABEL_143:
    __break(1u);
    return;
  }
  uint64_t v105 = v5;
  uint64_t v8 = 0;
  uint64_t v9 = *a1;
  uint64_t v103 = *a1 - 8;
  unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  uint64_t v11 = v3;
  uint64_t v111 = *a1;
  while (1)
  {
    uint64_t v12 = v8++;
    uint64_t v109 = v12;
    if (v8 < v11)
    {
      v106 = v10;
      uint64_t v13 = *(void **)(v9 + 8 * v12);
      id v14 = *(id *)(v9 + 8 * v8);
      id v15 = v13;
      sub_25C8EBFF0();
      sub_25C8EBFF0();
      uint64_t v16 = sub_25C8EC080();
      uint64_t v17 = sub_25C8EC080();

      uint64_t v12 = v109;
      uint64_t v8 = v109 + 2;
      if (v109 + 2 < v11)
      {
        uint64_t v18 = v109;
        uint64_t v8 = v108;
        while (1)
        {
          uint64_t v19 = v111 + 8 * v18;
          uint64_t v20 = *(void **)(v19 + 8);
          id v21 = *(id *)(v19 + 16);
          id v22 = v20;
          sub_25C8EBFF0();
          sub_25C8EBFF0();
          uint64_t v23 = sub_25C8EC080();
          uint64_t v24 = sub_25C8EC080();

          if (v17 < v16 == v24 >= v23) {
            break;
          }
          uint64_t v25 = v18 + 3;
          ++v18;
          if (v25 >= v108) {
            goto LABEL_11;
          }
        }
        uint64_t v8 = v18 + 2;
LABEL_11:
        uint64_t v12 = v109;
      }
      unint64_t v10 = v106;
      if (v17 >= v16)
      {
        uint64_t v9 = v111;
      }
      else
      {
        uint64_t v9 = v111;
        if (v8 < v12) {
          goto LABEL_136;
        }
        if (v12 < v8)
        {
          uint64_t v26 = (uint64_t *)(v103 + 8 * v8);
          uint64_t v27 = v8;
          uint64_t v28 = v12;
          os_log_type_t v29 = (uint64_t *)(v111 + 8 * v12);
          do
          {
            if (v28 != --v27)
            {
              if (!v111) {
                goto LABEL_142;
              }
              uint64_t v30 = *v29;
              *os_log_type_t v29 = *v26;
              *uint64_t v26 = v30;
            }
            ++v28;
            --v26;
            ++v29;
          }
          while (v28 < v27);
        }
      }
    }
    if (v8 < v108)
    {
      if (__OFSUB__(v8, v12)) {
        goto LABEL_134;
      }
      if (v8 - v12 < v105)
      {
        if (__OFADD__(v12, v105)) {
          goto LABEL_137;
        }
        if (v12 + v105 >= v108) {
          uint64_t v31 = v108;
        }
        else {
          uint64_t v31 = v12 + v105;
        }
        if (v31 < v12) {
          goto LABEL_138;
        }
        if (v8 != v31)
        {
          v107 = v10;
          uint64_t v32 = v103 + 8 * v8;
          do
          {
            uint64_t v33 = *(void **)(v9 + 8 * v8);
            uint64_t v34 = v12;
            uint64_t v35 = v32;
            while (1)
            {
              uint64_t v36 = *(void **)v35;
              id v37 = v33;
              id v38 = v36;
              sub_25C8EBFF0();
              sub_25C8EBFF0();
              uint64_t v39 = sub_25C8EC080();
              uint64_t v40 = sub_25C8EC080();

              if (v40 >= v39) {
                break;
              }
              uint64_t v9 = v111;
              if (!v111) {
                goto LABEL_140;
              }
              uint64_t v41 = *(void **)v35;
              uint64_t v33 = *(void **)(v35 + 8);
              *(void *)uint64_t v35 = v33;
              *(void *)(v35 + 8) = v41;
              v35 -= 8;
              if (v8 == ++v34) {
                goto LABEL_38;
              }
            }
            uint64_t v9 = v111;
LABEL_38:
            ++v8;
            v32 += 8;
            uint64_t v12 = v109;
          }
          while (v8 != v31);
          uint64_t v8 = v31;
          unint64_t v10 = v107;
        }
      }
    }
    if (v8 < v12) {
      goto LABEL_133;
    }
    uint64_t v42 = v10;
    if (swift_isUniquelyReferenced_nonNull_native()) {
      unint64_t v10 = v42;
    }
    else {
      unint64_t v10 = sub_25C8A12F4(0, *((void *)v42 + 2) + 1, 1, v42);
    }
    unint64_t v44 = *((void *)v10 + 2);
    unint64_t v43 = *((void *)v10 + 3);
    unint64_t v45 = v44 + 1;
    uint64_t v9 = v111;
    if (v44 >= v43 >> 1)
    {
      v94 = sub_25C8A12F4((char *)(v43 > 1), v44 + 1, 1, v10);
      uint64_t v9 = v111;
      unint64_t v10 = v94;
    }
    *((void *)v10 + 2) = v45;
    os_log_type_t v46 = v10 + 32;
    uint64_t v47 = &v10[16 * v44 + 32];
    *(void *)uint64_t v47 = v12;
    *((void *)v47 + 1) = v8;
    if (v44) {
      break;
    }
    unint64_t v45 = 1;
LABEL_88:
    uint64_t v11 = v108;
    if (v8 >= v108) {
      goto LABEL_98;
    }
  }
  while (1)
  {
    unint64_t v48 = v45 - 1;
    if (v45 >= 4)
    {
      uint64_t v53 = &v46[16 * v45];
      uint64_t v54 = *((void *)v53 - 8);
      uint64_t v55 = *((void *)v53 - 7);
      BOOL v59 = __OFSUB__(v55, v54);
      uint64_t v56 = v55 - v54;
      if (v59) {
        goto LABEL_118;
      }
      uint64_t v58 = *((void *)v53 - 6);
      uint64_t v57 = *((void *)v53 - 5);
      BOOL v59 = __OFSUB__(v57, v58);
      uint64_t v51 = v57 - v58;
      char v52 = v59;
      if (v59) {
        goto LABEL_119;
      }
      unint64_t v60 = v45 - 2;
      uint64_t v61 = &v46[16 * v45 - 32];
      uint64_t v63 = *(void *)v61;
      uint64_t v62 = *((void *)v61 + 1);
      BOOL v59 = __OFSUB__(v62, v63);
      uint64_t v64 = v62 - v63;
      if (v59) {
        goto LABEL_120;
      }
      BOOL v59 = __OFADD__(v51, v64);
      uint64_t v65 = v51 + v64;
      if (v59) {
        goto LABEL_122;
      }
      if (v65 >= v56)
      {
        uint64_t v83 = &v46[16 * v48];
        uint64_t v85 = *(void *)v83;
        uint64_t v84 = *((void *)v83 + 1);
        BOOL v59 = __OFSUB__(v84, v85);
        uint64_t v86 = v84 - v85;
        if (v59) {
          goto LABEL_128;
        }
        BOOL v76 = v51 < v86;
        goto LABEL_77;
      }
    }
    else
    {
      if (v45 != 3)
      {
        uint64_t v77 = *((void *)v10 + 4);
        uint64_t v78 = *((void *)v10 + 5);
        BOOL v59 = __OFSUB__(v78, v77);
        uint64_t v70 = v78 - v77;
        char v71 = v59;
        goto LABEL_71;
      }
      uint64_t v50 = *((void *)v10 + 4);
      uint64_t v49 = *((void *)v10 + 5);
      BOOL v59 = __OFSUB__(v49, v50);
      uint64_t v51 = v49 - v50;
      char v52 = v59;
    }
    if (v52) {
      goto LABEL_121;
    }
    unint64_t v60 = v45 - 2;
    uint64_t v66 = &v46[16 * v45 - 32];
    uint64_t v68 = *(void *)v66;
    uint64_t v67 = *((void *)v66 + 1);
    BOOL v69 = __OFSUB__(v67, v68);
    uint64_t v70 = v67 - v68;
    char v71 = v69;
    if (v69) {
      goto LABEL_123;
    }
    v72 = &v46[16 * v48];
    uint64_t v74 = *(void *)v72;
    uint64_t v73 = *((void *)v72 + 1);
    BOOL v59 = __OFSUB__(v73, v74);
    uint64_t v75 = v73 - v74;
    if (v59) {
      goto LABEL_125;
    }
    if (__OFADD__(v70, v75)) {
      goto LABEL_127;
    }
    if (v70 + v75 >= v51)
    {
      BOOL v76 = v51 < v75;
LABEL_77:
      if (v76) {
        unint64_t v48 = v60;
      }
      goto LABEL_79;
    }
LABEL_71:
    if (v71) {
      goto LABEL_124;
    }
    uint64_t v79 = &v46[16 * v48];
    uint64_t v81 = *(void *)v79;
    uint64_t v80 = *((void *)v79 + 1);
    BOOL v59 = __OFSUB__(v80, v81);
    uint64_t v82 = v80 - v81;
    if (v59) {
      goto LABEL_126;
    }
    if (v82 < v70) {
      goto LABEL_88;
    }
LABEL_79:
    unint64_t v87 = v48 - 1;
    if (v48 - 1 >= v45)
    {
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
LABEL_125:
      __break(1u);
LABEL_126:
      __break(1u);
LABEL_127:
      __break(1u);
LABEL_128:
      __break(1u);
      goto LABEL_129;
    }
    if (!v9) {
      goto LABEL_141;
    }
    unint64_t v88 = v10;
    v89 = &v46[16 * v87];
    uint64_t v90 = *(void *)v89;
    uint64_t v91 = &v46[16 * v48];
    uint64_t v92 = *((void *)v91 + 1);
    sub_25C8A1094((id *)(v9 + 8 * *(void *)v89), (id *)(v9 + 8 * *(void *)v91), v9 + 8 * v92, __dst);
    if (v1) {
      break;
    }
    if (v92 < v90) {
      goto LABEL_115;
    }
    if (v48 > *((void *)v88 + 2)) {
      goto LABEL_116;
    }
    *(void *)v89 = v90;
    *(void *)&v46[16 * v87 + 8] = v92;
    unint64_t v93 = *((void *)v88 + 2);
    if (v48 >= v93) {
      goto LABEL_117;
    }
    unint64_t v45 = v93 - 1;
    memmove(&v46[16 * v48], v91 + 16, 16 * (v93 - 1 - v48));
    unint64_t v10 = v88;
    *((void *)v88 + 2) = v93 - 1;
    uint64_t v9 = v111;
    if (v93 <= 2) {
      goto LABEL_88;
    }
  }
  uint64_t v95 = v108;
LABEL_95:
  swift_bridgeObjectRelease();
  if (v95 < -1)
  {
    __break(1u);
    goto LABEL_97;
  }
LABEL_112:
  *(void *)((v112 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
  sub_25C8EC220();
  swift_bridgeObjectRelease();
}

void sub_25C8A0FA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v5 = *a4;
    uint64_t v6 = *a4 + 8 * a3 - 8;
    while (2)
    {
      uint64_t v7 = *(void **)(v5 + 8 * v4);
      uint64_t v8 = a1;
      uint64_t v9 = v6;
      do
      {
        unint64_t v10 = *(void **)v9;
        id v11 = v7;
        id v12 = v10;
        sub_25C8EBFF0();
        sub_25C8EBFF0();
        uint64_t v13 = sub_25C8EC080();
        uint64_t v14 = sub_25C8EC080();

        if (v14 >= v13) {
          break;
        }
        if (!v5)
        {
          __break(1u);
          return;
        }
        id v15 = *(void **)v9;
        uint64_t v7 = *(void **)(v9 + 8);
        *(void *)uint64_t v9 = v7;
        *(void *)(v9 + 8) = v15;
        v9 -= 8;
        ++v8;
      }
      while (v4 != v8);
      ++v4;
      v6 += 8;
      if (v4 != a2) {
        continue;
      }
      break;
    }
  }
}

uint64_t sub_25C8A1094(id *__src, id *a2, unint64_t a3, char *__dst)
{
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = (char *)a2 - (char *)__src;
  int64_t v9 = a2 - __src;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 8;
  if (v9 >= v11)
  {
    sub_25C8D8AF0((char *)a2, (uint64_t)(a3 - (void)a2) / 8, __dst);
    uint64_t v39 = __dst;
    id v12 = &__dst[8 * v11];
    if (v7 >= v6 || v10 < 8)
    {
LABEL_39:
      uint64_t v14 = v39;
      goto LABEL_40;
    }
    uint64_t v25 = (id *)(a3 - 8);
    while (1)
    {
      uint64_t v42 = v6;
      uint64_t v40 = v25 + 1;
      uint64_t v26 = v12 - 8;
      uint64_t v27 = v6 - 1;
      uint64_t v28 = *(v6 - 1);
      os_log_type_t v29 = v12;
      id v30 = *((id *)v12 - 1);
      id v31 = v28;
      sub_25C8EBFF0();
      sub_25C8EBFF0();
      uint64_t v32 = sub_25C8EC080();
      uint64_t v33 = sub_25C8EC080();

      if (v33 >= v32)
      {
        uint64_t v35 = v39;
        BOOL v36 = v40 != (id *)v29 || v25 >= (id *)v29;
        uint64_t v27 = (id *)v26;
        id v12 = v26;
        uint64_t v6 = v42;
        if (!v36) {
          goto LABEL_35;
        }
      }
      else
      {
        BOOL v34 = v40 != v42 || v25 >= v42;
        uint64_t v35 = v39;
        id v12 = v29;
        uint64_t v6 = v27;
        if (!v34) {
          goto LABEL_35;
        }
      }
      *uint64_t v25 = *v27;
LABEL_35:
      --v25;
      if (v6 <= v7 || v12 <= v35) {
        goto LABEL_39;
      }
    }
  }
  sub_25C8D8AF0((char *)__src, a2 - __src, __dst);
  id v12 = &__dst[8 * v9];
  BOOL v13 = (unint64_t)v6 >= a3 || v8 < 8;
  uint64_t v14 = __dst;
  if (!v13)
  {
    unint64_t v41 = a3;
    do
    {
      id v15 = v12;
      uint64_t v16 = *(void **)v14;
      id v17 = *v6;
      id v18 = v16;
      sub_25C8EBFF0();
      sub_25C8EBFF0();
      uint64_t v19 = sub_25C8EC080();
      uint64_t v20 = sub_25C8EC080();

      if (v20 >= v19)
      {
        id v21 = (id *)v14;
        BOOL v22 = v7 == (id *)v14;
        v14 += 8;
      }
      else
      {
        id v21 = v6;
        BOOL v22 = v7 == v6++;
      }
      id v12 = v15;
      if (!v22) {
        id *v7 = *v21;
      }
      ++v7;
    }
    while (v14 < v15 && (unint64_t)v6 < v41);
  }
  uint64_t v6 = v7;
LABEL_40:
  sub_25C8D8AF0(v14, (v12 - v14) / 8, (char *)v6);
  return 1;
}

char *sub_25C8A12F4(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9A78);
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
  BOOL v13 = a4 + 32;
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

char *sub_25C8A13EC(uint64_t a1)
{
  return sub_25C8A12F4(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void sub_25C8A1400()
{
}

uint64_t IdentityNLv3Intent.domainOntologyNode.getter()
{
  return swift_retain();
}

uint64_t IdentityNLv3Intent.domainOntologyNode.setter(uint64_t a1)
{
  uint64_t result = swift_release();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*IdentityNLv3Intent.domainOntologyNode.modify())()
{
  return nullsub_1;
}

uint64_t IdentityNLv3Intent.intent.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for IdentityNLv3Intent() + 20);
  uint64_t v4 = sub_25C8EBDD0();
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for IdentityNLv3Intent()
{
  uint64_t result = qword_26A5D9A88;
  if (!qword_26A5D9A88) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C8A1530()
{
  return sub_25C8A2C48(&qword_26A5D9FD0);
}

uint64_t sub_25C8A1564()
{
  return sub_25C8A2C48(&qword_26A5D9A80);
}

uint64_t sub_25C8A1598@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = (int *)type metadata accessor for IdentityNLv3Intent();
  uint64_t v4 = v3[6];
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D95C8);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = sub_25C8EBB10();
  *(uint64_t *)((char *)a2 + v4) = v5;
  uint64_t v28 = v5;
  uint64_t v6 = v3[7];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D95D0);
  OUTLINED_FUNCTION_1_1();
  swift_retain();
  OUTLINED_FUNCTION_0_1();
  uint64_t v8 = sub_25C8EBB10();
  *(uint64_t *)((char *)a2 + v6) = v8;
  uint64_t v27 = v8;
  uint64_t v9 = v3[8];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D95D8);
  OUTLINED_FUNCTION_1_1();
  swift_retain();
  uint64_t v11 = sub_25C8EBB10();
  *(uint64_t *)((char *)a2 + v9) = v11;
  uint64_t v26 = v11;
  uint64_t v12 = v3[9];
  uint64_t v13 = _s24UserIdentityOntologyNodeCMa();
  OUTLINED_FUNCTION_1_1();
  swift_retain();
  uint64_t v14 = sub_25C8C7E44();
  *(uint64_t *)((char *)a2 + v12) = v14;
  uint64_t v15 = v3[10];
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5D95E0);
  OUTLINED_FUNCTION_1_1();
  swift_retain();
  uint64_t v17 = sub_25C8EBB10();
  *(uint64_t *)((char *)a2 + v15) = v17;
  id v18 = (char *)a2 + v3[5];
  uint64_t v19 = sub_25C8EBDD0();
  uint64_t v20 = *(void *)(v19 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v18, a1, v19);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9A98);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_25C8ED290;
  *(void *)(v21 + 56) = v29;
  *(void *)(v21 + 64) = sub_25C8A2BF8(&qword_26A5D9AA0, &qword_26A5D95C8);
  *(void *)(v21 + 32) = v28;
  *(void *)(v21 + 96) = v7;
  *(void *)(v21 + 104) = sub_25C8A2BF8(&qword_26A5D9AA8, &qword_26A5D95D0);
  *(void *)(v21 + 72) = v27;
  *(void *)(v21 + 136) = v10;
  uint64_t v22 = sub_25C8A2BF8((unint64_t *)&qword_26A5D9AB0, &qword_26A5D95D8);
  uint64_t v23 = MEMORY[0x263F722A0];
  *(void *)(v21 + 112) = v26;
  *(void *)(v21 + 176) = v13;
  *(void *)(v21 + 184) = v23;
  *(void *)(v21 + 144) = v22;
  *(void *)(v21 + 152) = v14;
  *(void *)(v21 + 216) = v16;
  *(void *)(v21 + 224) = sub_25C8A2BF8(&qword_26A5D9AB8, (uint64_t *)&unk_26A5D95E0);
  *(void *)(v21 + 192) = v17;
  sub_25C8EBB00();
  OUTLINED_FUNCTION_1_1();
  swift_retain();
  OUTLINED_FUNCTION_0_1();
  uint64_t v24 = sub_25C8EBAF0();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 8))(a1, v19);
  *a2 = v24;
  return result;
}

uint64_t sub_25C8A18B8()
{
  return sub_25C8A18D0();
}

uint64_t sub_25C8A18C4()
{
  return sub_25C8A18D0();
}

uint64_t sub_25C8A18D0()
{
  type metadata accessor for IdentityNLv3Intent();
  sub_25C8A2C48(&qword_26A5D9FD0);
  swift_retain();
  sub_25C8EBC20();
  swift_release();
  return v1;
}

uint64_t sub_25C8A1964()
{
  return sub_25C8A18D0();
}

uint64_t sub_25C8A1970()
{
  type metadata accessor for IdentityNLv3Intent();
  sub_25C8A2C48(&qword_26A5D9FD0);
  sub_25C8EBC20();
  return v1;
}

uint64_t sub_25C8A19E8()
{
  if (sub_25C8A1A1C()) {
    return 2;
  }
  if (sub_25C8A1D0C()) {
    return 1;
  }
  return 3;
}

uint64_t sub_25C8A1A1C()
{
  uint64_t v1 = v0;
  type metadata accessor for IdentityNLv3Intent();
  uint64_t v2 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v4 = &v19[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = &v19[-v5];
  sub_25C8A2C48(&qword_26A5D9FD0);
  sub_25C8EBC20();
  if (v19[15] == 6)
  {
    sub_25C8A2C8C(v0, (uint64_t)v6);
    goto LABEL_3;
  }
  IdentityVerb.rawValue.getter();
  if (v9 == 0x796669646F6DLL && v8 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    sub_25C8A2C8C(v0, (uint64_t)v6);
  }
  else
  {
    char v11 = sub_25C8EC550();
    swift_bridgeObjectRelease();
    sub_25C8A2C8C(v0, (uint64_t)v6);
    if ((v11 & 1) == 0)
    {
LABEL_3:
      sub_25C8EBC20();
      int v7 = v19[14];
      sub_25C8A2CF0((uint64_t)v6);
      sub_25C8A2C8C(v1, (uint64_t)v4);
      if (v7 != 6) {
        goto LABEL_20;
      }
      goto LABEL_13;
    }
  }
  sub_25C8A2CF0((uint64_t)v6);
  sub_25C8A2C8C(v0, (uint64_t)v4);
LABEL_13:
  uint64_t v12 = sub_25C8EBC30();
  uint64_t v13 = *(void *)(v12 + 16);
  if (!v13)
  {
    swift_bridgeObjectRelease();
LABEL_20:
    uint64_t v17 = 0;
    goto LABEL_24;
  }
  swift_bridgeObjectRetain();
  uint64_t v14 = 0;
  while (2)
  {
    uint64_t v15 = v12 + v14++;
    switch(*(unsigned char *)(v15 + 32))
    {
      case 3:
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        goto LABEL_23;
      default:
        char v16 = sub_25C8EC550();
        swift_bridgeObjectRelease();
        if ((v16 & 1) == 0)
        {
          if (v13 == v14)
          {
            swift_bridgeObjectRelease_n();
            goto LABEL_20;
          }
          continue;
        }
        swift_bridgeObjectRelease_n();
LABEL_23:
        uint64_t v17 = 1;
LABEL_24:
        sub_25C8A2CF0((uint64_t)v4);
        return v17;
    }
  }
}

uint64_t sub_25C8A1D0C()
{
  uint64_t v1 = type metadata accessor for IdentityNLv3Intent();
  uint64_t v2 = MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v22[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = &v22[-v5];
  sub_25C8A2C48(&qword_26A5D9FD0);
  sub_25C8EBC20();
  if (v22[15] == 6)
  {
    sub_25C8A2C8C(v0, (uint64_t)v6);
  }
  else
  {
    IdentityVerb.rawValue.getter();
    if (v8 == 0x796669746E656469 && v7 == 0xE800000000000000)
    {
      swift_bridgeObjectRelease();
      sub_25C8A2C8C(v0, (uint64_t)v6);
LABEL_19:
      sub_25C8A2CF0((uint64_t)v6);
      sub_25C8A2C8C(v0, (uint64_t)v4);
      goto LABEL_20;
    }
    char v10 = sub_25C8EC550();
    swift_bridgeObjectRelease();
    sub_25C8A2C8C(v0, (uint64_t)v6);
    if (v10) {
      goto LABEL_19;
    }
  }
  sub_25C8EBC20();
  if (v22[14] == 6)
  {
    sub_25C8A2CF0((uint64_t)v6);
    sub_25C8A2C8C(v0, (uint64_t)v4);
LABEL_27:
    uint64_t v15 = 0;
    goto LABEL_31;
  }
  IdentityVerb.rawValue.getter();
  if (v12 == 0x74736575516B7361 && v11 == 0xEB000000006E6F69)
  {
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  char v14 = sub_25C8EC550();
  swift_bridgeObjectRelease();
  sub_25C8A2CF0((uint64_t)v6);
  sub_25C8A2C8C(v0, (uint64_t)v4);
  uint64_t v15 = 0;
  if ((v14 & 1) == 0) {
    goto LABEL_31;
  }
LABEL_20:
  uint64_t v16 = sub_25C8EBC30();
  uint64_t v17 = *(void *)(v16 + 16);
  if (!v17)
  {
    swift_bridgeObjectRelease();
    goto LABEL_27;
  }
  swift_bridgeObjectRetain();
  uint64_t v18 = 0;
  while (2)
  {
    uint64_t v19 = v16 + v18++;
    switch(*(unsigned char *)(v19 + 32))
    {
      case 1:
      case 2:
      case 3:
        char v20 = sub_25C8EC550();
        swift_bridgeObjectRelease();
        if (v20)
        {
          swift_bridgeObjectRelease_n();
          goto LABEL_30;
        }
        if (v17 != v18) {
          continue;
        }
        swift_bridgeObjectRelease_n();
        goto LABEL_27;
      default:
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
LABEL_30:
        uint64_t v15 = 1;
        break;
    }
    break;
  }
LABEL_31:
  sub_25C8A2CF0((uint64_t)v4);
  return v15;
}

uint64_t sub_25C8A2094()
{
  type metadata accessor for IdentityNLv3Intent();
  sub_25C8A2C48(&qword_26A5D9FD0);
  uint64_t v0 = sub_25C8EBC30();
  uint64_t v1 = *(void *)(v0 + 16);
  if (v1)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = 0;
    while (2)
    {
      uint64_t v3 = v0 + v2++;
      switch(*(unsigned char *)(v3 + 32))
      {
        case 1:
        case 2:
        case 3:
          char v4 = sub_25C8EC550();
          swift_bridgeObjectRelease();
          if (v4)
          {
            swift_bridgeObjectRelease_n();
            goto LABEL_11;
          }
          if (v1 != v2) {
            continue;
          }
          swift_bridgeObjectRelease_n();
          return 0;
        default:
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
LABEL_11:
          uint64_t result = 1;
          break;
      }
      break;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return result;
}

uint64_t sub_25C8A2200@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 20);
  uint64_t v5 = sub_25C8EBDD0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_25C8A2270()
{
  return swift_retain();
}

uint64_t sub_25C8A2278()
{
  return sub_25C8A18D0();
}

uint64_t sub_25C8A22A0()
{
  return sub_25C8A18D0();
}

uint64_t sub_25C8A22C0()
{
  return sub_25C8A18D0();
}

uint64_t sub_25C8A22E4(uint64_t a1)
{
  uint64_t v2 = sub_25C8A2C48(&qword_26A5D9AC0);
  return MEMORY[0x270F6CA70](a1, v2);
}

uint64_t sub_25C8A234C(uint64_t a1)
{
  uint64_t v2 = sub_25C8A2C48(&qword_26A5D9AC0);
  return MEMORY[0x270F6CA60](a1, v2);
}

uint64_t sub_25C8A23A4(uint64_t a1)
{
  uint64_t v2 = sub_25C8A2C48(&qword_26A5D9AC0);
  return MEMORY[0x270F6CA68](a1, v2);
}

uint64_t *initializeBufferWithCopyOfBuffer for IdentityNLv3Intent(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    char v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25C8EBDD0();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_retain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[7];
    *(uint64_t *)((char *)v7 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    *(uint64_t *)((char *)v7 + v13) = *(uint64_t *)((char *)a2 + v13);
    uint64_t v14 = a3[9];
    *(uint64_t *)((char *)v7 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
    *(uint64_t *)((char *)v7 + v14) = *(uint64_t *)((char *)a2 + v14);
    *(uint64_t *)((char *)v7 + a3[10]) = *(uint64_t *)((char *)a2 + a3[10]);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v7;
}

uint64_t destroy for IdentityNLv3Intent(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_25C8EBDD0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

void *initializeWithCopy for IdentityNLv3Intent(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25C8EBDD0();
  char v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_retain();
  v10(v7, v8, v9);
  uint64_t v11 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v11) = *(void *)((char *)a2 + v11);
  uint64_t v12 = a3[9];
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  *(void *)((char *)a1 + v12) = *(void *)((char *)a2 + v12);
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for IdentityNLv3Intent(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25C8EBDD0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  swift_retain();
  swift_release();
  return a1;
}

void *initializeWithTake for IdentityNLv3Intent(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25C8EBDD0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  uint64_t v11 = a3[9];
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  *(void *)((char *)a1 + v11) = *(void *)((char *)a2 + v11);
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  return a1;
}

void *assignWithTake for IdentityNLv3Intent(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_release();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25C8EBDD0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  swift_release();
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_release();
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  swift_release();
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  swift_release();
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for IdentityNLv3Intent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C8A29F0);
}

uint64_t sub_25C8A29F0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_25C8EBDD0();
    uint64_t v9 = (uint64_t)a1 + *(int *)(a3 + 20);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for IdentityNLv3Intent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C8A2A8C);
}

void *sub_25C8A2A8C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_25C8EBDD0();
    uint64_t v8 = (uint64_t)v5 + *(int *)(a4 + 20);
    return (void *)__swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t sub_25C8A2B0C()
{
  uint64_t result = sub_25C8EBDD0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
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

uint64_t sub_25C8A2BF8(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_25C8A2C48(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for IdentityNLv3Intent();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25C8A2C8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IdentityNLv3Intent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C8A2CF0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for IdentityNLv3Intent();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return 0x797469746E656469;
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return swift_allocObject();
}

uint64_t sub_25C8A2D78()
{
  uint64_t v1 = sub_25C8EC0F0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_4_1();
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v1, (uint64_t)qword_26A5DD5A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v0, v5, v1);
  uint64_t v6 = sub_25C8EC0D0();
  os_log_type_t v7 = sub_25C8EC2D0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)OUTLINED_FUNCTION_5_0();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_25C89B000, v6, v7, "EstablishUserFlowStrategy.actionForInput() called", v8, 2u);
    OUTLINED_FUNCTION_3();
  }

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  return sub_25C8EB500();
}

uint64_t sub_25C8A2ED0(uint64_t a1)
{
  v1[13] = a1;
  uint64_t v2 = sub_25C8EB950();
  v1[14] = v2;
  OUTLINED_FUNCTION_1_2(v2);
  v1[15] = v3;
  v1[16] = swift_task_alloc();
  v1[17] = swift_task_alloc();
  uint64_t v4 = sub_25C8EC0F0();
  v1[18] = v4;
  OUTLINED_FUNCTION_1_2(v4);
  v1[19] = v5;
  v1[20] = swift_task_alloc();
  v1[21] = swift_task_alloc();
  v1[22] = swift_task_alloc();
  v1[23] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C8A2FDC, 0, 0);
}

uint64_t sub_25C8A2FDC()
{
  uint64_t v55 = v0;
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 152);
  __swift_project_value_buffer(*(void *)(v0 + 144), (uint64_t)qword_26A5DD5A0);
  char v52 = *(void (**)(void))(v1 + 16);
  OUTLINED_FUNCTION_6_0();
  v2();
  uint64_t v3 = sub_25C8EC0D0();
  os_log_type_t v4 = sub_25C8EC2D0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)OUTLINED_FUNCTION_5_0();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_25C89B000, v3, v4, "EstablishUserFlowStrategy.makeIntentFromParse() called", v5, 2u);
    OUTLINED_FUNCTION_3();
  }
  uint64_t v6 = *(void *)(v0 + 184);
  uint64_t v7 = *(void *)(v0 + 144);
  uint64_t v8 = *(void *)(v0 + 152);

  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v9(v6, v7);
  sub_25C8C93E8(v0 + 56);
  if (!*(void *)(v0 + 80))
  {
    uint64_t v51 = v9;
    uint64_t v24 = *(void *)(v0 + 136);
    uint64_t v26 = *(void *)(v0 + 112);
    uint64_t v25 = *(void *)(v0 + 120);
    uint64_t v27 = *(void *)(v0 + 104);
    sub_25C8A41E8(v0 + 56);
    OUTLINED_FUNCTION_6_0();
    v28();
    uint64_t v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16);
    v29(v24, v27, v26);
    id v30 = sub_25C8EC0D0();
    os_log_type_t v31 = sub_25C8EC2E0();
    BOOL v32 = os_log_type_enabled(v30, v31);
    uint64_t v33 = *(void *)(v0 + 160);
    uint64_t v35 = *(void *)(v0 + 136);
    uint64_t v34 = *(void *)(v0 + 144);
    if (v32)
    {
      uint64_t v53 = *(void *)(v0 + 160);
      log = v30;
      uint64_t v37 = *(void *)(v0 + 120);
      uint64_t v36 = *(void *)(v0 + 128);
      os_log_type_t type = v31;
      uint64_t v38 = *(void *)(v0 + 112);
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      *(_DWORD *)uint64_t v39 = 136315138;
      v29(v36, v35, v38);
      uint64_t v40 = sub_25C8EC180();
      *(void *)(v0 + 96) = sub_25C8BB4F0(v40, v41, &v54);
      sub_25C8EC360();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v35, v38);
      _os_log_impl(&dword_25C89B000, log, type, "Unable to make intent from parse %s", v39, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();

      uint64_t v43 = v34;
      uint64_t v42 = v53;
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 120) + 8))(*(void *)(v0 + 136), *(void *)(v0 + 112));

      uint64_t v42 = v33;
      uint64_t v43 = v34;
    }
    v51(v42, v43);
    type metadata accessor for IdentityFlowError();
    swift_allocObject();
    uint64_t v46 = sub_25C8D786C(0);
    sub_25C8A4248((unint64_t *)&qword_26A5D9FA0, 255, (void (*)(uint64_t))type metadata accessor for IdentityFlowError);
    swift_allocError();
    *uint64_t v47 = v46;
    swift_willThrow();
LABEL_19:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v48 = *(uint64_t (**)(void))(v0 + 8);
    return v48();
  }
  sub_25C8A4290((long long *)(v0 + 56), v0 + 16);
  type metadata accessor for UserIdentifyIntent();
  id v10 = sub_25C8B4A6C((void *)(v0 + 16));
  OUTLINED_FUNCTION_6_0();
  v52();
  uint64_t v11 = sub_25C8EC0D0();
  os_log_type_t v12 = sub_25C8EC2D0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)OUTLINED_FUNCTION_5_0();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_25C89B000, v11, v12, "Finished creating intent from parse", v13, 2u);
    OUTLINED_FUNCTION_3();
  }
  uint64_t v14 = *(void *)(v0 + 176);
  uint64_t v15 = *(void *)(v0 + 144);

  v9(v14, v15);
  if (objc_msgSend(v10, sel_caseType) == (id)4)
  {
    uint64_t v16 = v9;
    OUTLINED_FUNCTION_6_0();
    v52();
    uint64_t v17 = sub_25C8EC0D0();
    os_log_type_t v18 = sub_25C8EC2E0();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)OUTLINED_FUNCTION_5_0();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_25C89B000, v17, v18, "Unsupported Intent Case Type", v19, 2u);
      OUTLINED_FUNCTION_3();
    }
    uint64_t v20 = *(void *)(v0 + 168);
    uint64_t v21 = *(void *)(v0 + 144);

    v16(v20, v21);
    type metadata accessor for IdentityFlowError();
    swift_allocObject();
    uint64_t v22 = sub_25C8D786C(0);
    sub_25C8A4248((unint64_t *)&qword_26A5D9FA0, 255, (void (*)(uint64_t))type metadata accessor for IdentityFlowError);
    swift_allocError();
    *uint64_t v23 = v22;
    swift_willThrow();

    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    goto LABEL_19;
  }
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v44 = *(uint64_t (**)(id))(v0 + 8);
  return v44(v10);
}

uint64_t sub_25C8A3668()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for EstablishUserFlowStrategy()
{
  return self;
}

uint64_t sub_25C8A369C()
{
  return sub_25C8A2D78();
}

uint64_t sub_25C8A36B4(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25C8A3748;
  return sub_25C8A2ED0(a1);
}

uint64_t sub_25C8A3748(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1();
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_25C8A3824(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for EstablishUserFlowStrategy();
  return MEMORY[0x270F67C20](a1, v5, a3);
}

uint64_t sub_25C8A3870(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_25C8A42F8;
  return MEMORY[0x270F67C18](a1, a2, a3, a4);
}

uint64_t sub_25C8A3938(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_25C8EB350();
  OUTLINED_FUNCTION_0_2();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25C8EC0F0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_4_1();
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  uint64_t v14 = __swift_project_value_buffer(v10, (uint64_t)qword_26A5DD5A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v2, v14, v10);
  uint64_t v15 = sub_25C8EC0D0();
  os_log_type_t v16 = sub_25C8EC2D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)OUTLINED_FUNCTION_5_0();
    uint64_t v23 = v6;
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_25C89B000, v15, v16, "EstablishUserIntentExecutionBehaviorStrategy.makeIntentExecutionBehavior", v17, 2u);
    uint64_t v6 = v23;
    OUTLINED_FUNCTION_3();
  }

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v2, v10);
  sub_25C8EB3D0();
  id v18 = objc_allocWithZone((Class)type metadata accessor for EstablishUserIntentHandler());
  swift_retain();
  objc_msgSend(v18, sel_init);
  type metadata accessor for UserIdentifyIntent();
  id v19 = a2;
  sub_25C8EB340();
  uint64_t v20 = sub_25C8EB3C0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v4);
  return v20;
}

uint64_t sub_25C8A3B90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  uint64_t v11 = type metadata accessor for EstablishUserFlowStrategy();
  *uint64_t v10 = v5;
  v10[1] = sub_25C8A42F8;
  return MEMORY[0x270F66498](a1, a2, a3, v11, a5);
}

uint64_t sub_25C8A3C5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  uint64_t v11 = type metadata accessor for EstablishUserFlowStrategy();
  *uint64_t v10 = v5;
  v10[1] = sub_25C8A42F8;
  return MEMORY[0x270F66490](a1, a2, a3, v11, a5);
}

uint64_t sub_25C8A3D28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  uint64_t v11 = type metadata accessor for EstablishUserFlowStrategy();
  *uint64_t v10 = v5;
  v10[1] = sub_25C8A42F8;
  return MEMORY[0x270F66488](a1, a2, a3, v11, a5);
}

uint64_t sub_25C8A3DF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v12;
  uint64_t v13 = type metadata accessor for EstablishUserFlowStrategy();
  *uint64_t v12 = v6;
  v12[1] = sub_25C8A3ED0;
  return MEMORY[0x270F66480](a1, a2, a3, a4, v13, a6);
}

uint64_t sub_25C8A3ED0()
{
  OUTLINED_FUNCTION_2_1();
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25C8A3FA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v12;
  uint64_t v13 = type metadata accessor for EstablishUserFlowStrategy();
  *uint64_t v12 = v6;
  v12[1] = sub_25C8A42F8;
  return MEMORY[0x270F66790](a1, a2, a3, a4, v13, a6);
}

uint64_t sub_25C8A407C(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_25C8A3938(a1, a2);
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v2 + 8);
  return sub_25C8A41D8(v4, v2, v3);
}

uint64_t sub_25C8A4100(uint64_t a1, uint64_t a2)
{
  return sub_25C8A4248(&qword_26A5D9AE0, a2, (void (*)(uint64_t))type metadata accessor for EstablishUserFlowStrategy);
}

uint64_t sub_25C8A4148(uint64_t a1, uint64_t a2)
{
  return sub_25C8A4248(qword_26A5D9AE8, a2, (void (*)(uint64_t))type metadata accessor for EstablishUserFlowStrategy);
}

uint64_t sub_25C8A4190(uint64_t a1, uint64_t a2)
{
  return sub_25C8A4248(qword_26A5D9B10, a2, (void (*)(uint64_t))type metadata accessor for EstablishUserFlowStrategy);
}

uint64_t sub_25C8A41D8(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_25C8A41E8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5D9FE0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C8A4248(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_25C8A4290(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
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

uint64_t OUTLINED_FUNCTION_1_2(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return swift_slowAlloc();
}

uint64_t sub_25C8A4384(uint64_t a1)
{
  uint64_t v2 = sub_25C8EC0F0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v33 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v33 - v10;
  id v12 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SwitchProfileIntent()), sel_init);
  if (!a1)
  {
    if (qword_26A5D95B0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v2, (uint64_t)qword_26A5DD5B8);
    OUTLINED_FUNCTION_0_3();
    v23(v6);
    uint64_t v24 = sub_25C8EC0D0();
    os_log_type_t v25 = sub_25C8EC2E0();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_25C89B000, v24, v25, "Either the homeUserId or name must be provided", v26, 2u);
      OUTLINED_FUNCTION_3();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    goto LABEL_27;
  }
  uint64_t v13 = v12;
  sub_25C8E4D64(0x696669746E656469, 0xEA00000000007265, a1, v37);
  if (!v38)
  {
    sub_25C8A4958((uint64_t)v37);
    goto LABEL_6;
  }
  if ((OUTLINED_FUNCTION_1_3() & 1) == 0)
  {
LABEL_6:
    sub_25C8E4D64(1701667182, 0xE400000000000000, a1, v37);
    if (v38)
    {
      if (OUTLINED_FUNCTION_1_3())
      {
        sub_25C8B5194(v35, v36, v13);
        uint64_t v14 = 2;
        goto LABEL_9;
      }
      uint64_t v27 = v2;
    }
    else
    {
      uint64_t v27 = v2;
      sub_25C8A4958((uint64_t)v37);
    }
    if (qword_26A5D95B0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v27, (uint64_t)qword_26A5DD5B8);
    OUTLINED_FUNCTION_0_3();
    uint64_t v28 = v27;
    v29(v11);
    id v30 = sub_25C8EC0D0();
    os_log_type_t v31 = sub_25C8EC2E0();
    if (os_log_type_enabled(v30, v31))
    {
      BOOL v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)BOOL v32 = 0;
      _os_log_impl(&dword_25C89B000, v30, v31, "Either the homeUserId or name must be provided", v32, 2u);
      OUTLINED_FUNCTION_3();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v28);
LABEL_27:
    uint64_t result = sub_25C8EC4D0();
    __break(1u);
    return result;
  }
  sub_25C8AC1BC(v35, v36, v13);
  uint64_t v14 = 1;
LABEL_9:
  swift_bridgeObjectRelease();
  if (qword_26A5D95B0 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v2, (uint64_t)qword_26A5DD5B8);
  OUTLINED_FUNCTION_0_3();
  v15(v9);
  os_log_type_t v16 = sub_25C8EC0D0();
  os_log_type_t v17 = sub_25C8EC2D0();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v33 = v2;
    id v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v34 = v13;
    v37[0] = v19;
    *(_DWORD *)id v18 = 136315138;
    uint64_t v20 = SwitchType.description.getter();
    uint64_t v35 = sub_25C8BB4F0(v20, v21, v37);
    sub_25C8EC360();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C89B000, v16, v17, "Setting switchType with %s", v18, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v33);
    uint64_t v13 = v34;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v2);
  }
  objc_msgSend(v13, sel_setSwitchType_, v14);
  return (uint64_t)v13;
}

uint64_t sub_25C8A4958(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9B28);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return swift_dynamicCast();
}

BOOL sub_25C8A49E8(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_25C8A49F8()
{
  return sub_25C8EC600();
}

uint64_t sub_25C8A4A20()
{
  return sub_25C8EC610();
}

BOOL sub_25C8A4A68(char *a1, char *a2)
{
  return sub_25C8A49E8(*a1, *a2);
}

uint64_t sub_25C8A4A74()
{
  return sub_25C8A4A20();
}

uint64_t sub_25C8A4A7C()
{
  return sub_25C8A49F8();
}

uint64_t sub_25C8A4A84()
{
  return sub_25C8EC610();
}

uint64_t sub_25C8A4AC8()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9BC8);
  uint64_t v1 = OUTLINED_FUNCTION_19(v0);
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_4_0();
  uint64_t v4 = v3 - v2;
  uint64_t v5 = sub_25C8EB910();
  __swift_storeEnumTagSinglePayload(v4, 1, 1, v5);
  sub_25C8EB960();
  sub_25C8EB840();
  type metadata accessor for BaseDialogProvider();
  uint64_t v6 = swift_allocObject();
  sub_25C8EC020();
  uint64_t v7 = sub_25C8EC010();
  return sub_25C8A7334(v4, (uint64_t)v10, (uint64_t)v9, v6, v7, 0);
}

uint64_t sub_25C8A4BA0(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9BC8);
  uint64_t v4 = OUTLINED_FUNCTION_19(v3);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v14 - v8;
  uint64_t v10 = sub_25C8EB910();
  OUTLINED_FUNCTION_16();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v9, a1, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v10);
  sub_25C8A7FAC((uint64_t)v9, (uint64_t)v7);
  uint64_t v12 = v1 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_input;
  swift_beginAccess();
  sub_25C8A7EFC((uint64_t)v7, v12);
  swift_endAccess();
  *(unsigned char *)(v1 + 16) = 1;
  return 1;
}

uint64_t sub_25C8A4CD4()
{
  return sub_25C8EB2C0();
}

uint64_t sub_25C8A4D64()
{
  OUTLINED_FUNCTION_6_1();
  v1[5] = v2;
  v1[6] = v0;
  uint64_t v3 = sub_25C8EC0F0();
  v1[7] = v3;
  OUTLINED_FUNCTION_1_2(v3);
  v1[8] = v4;
  v1[9] = swift_task_alloc();
  v1[10] = swift_task_alloc();
  v1[11] = swift_task_alloc();
  v1[12] = swift_task_alloc();
  uint64_t v5 = sub_25C8EB950();
  v1[13] = v5;
  OUTLINED_FUNCTION_1_2(v5);
  v1[14] = v6;
  v1[15] = OUTLINED_FUNCTION_13();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9BC8);
  OUTLINED_FUNCTION_19(v7);
  v1[16] = OUTLINED_FUNCTION_13();
  uint64_t v8 = sub_25C8EB910();
  v1[17] = v8;
  OUTLINED_FUNCTION_1_2(v8);
  v1[18] = v9;
  v1[19] = OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v10, v11, v12);
}

void sub_25C8A4EA4()
{
  uint64_t v2 = v0[16];
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[6] + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_input;
  swift_beginAccess();
  sub_25C8A80D0(v4, v2, &qword_26A5D9BC8);
  if (__swift_getEnumTagSinglePayload(v2, 1, v3) != 1)
  {
    uint64_t v16 = v0[6];
    (*(void (**)(void, void, void))(v0[18] + 32))(v0[19], v0[16], v0[17]);
    switch(*(unsigned char *)(v16 + 16))
    {
      case 1:
        uint64_t v26 = v0[14];
        uint64_t v25 = v0[15];
        uint64_t v27 = v0[13];
        sub_25C8EB900();
        int v28 = (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 88))(v25, v27);
        if (v28 == *MEMORY[0x263F6FF50] || v28 == *MEMORY[0x263F6FF70]) {
          goto LABEL_28;
        }
        if (v28 == *MEMORY[0x263F6FF58])
        {
          (*(void (**)(void, void))(v0[14] + 96))(v0[15], v0[13]);
          swift_unknownObjectRelease();
        }
        else
        {
          if (v28 != *MEMORY[0x263F6FF80])
          {
            if (qword_26A5D95A8 != -1) {
              swift_once();
            }
            OUTLINED_FUNCTION_18();
            uint64_t v5 = v1 + 12;
            uint64_t v6 = *(v5 - 4);
            uint64_t v45 = OUTLINED_FUNCTION_4_2(v44, (uint64_t)qword_26A5DD5A0);
            v46(v45);
            uint64_t v10 = sub_25C8EC0D0();
            os_log_type_t v47 = sub_25C8EC2E0();
            OUTLINED_FUNCTION_10_0(v47);
            OUTLINED_FUNCTION_22();
            if (v48)
            {
              uint64_t v13 = "Unexpected parse type in input";
              goto LABEL_6;
            }
            uint64_t v14 = *v5;
            goto LABEL_13;
          }
LABEL_28:
          (*(void (**)(void, void))(v0[14] + 8))(v0[15], v0[13]);
        }
        if (sub_25C8A56CC())
        {
          sub_25C8A5764(v0[19]);
LABEL_31:
          uint64_t v38 = OUTLINED_FUNCTION_5_1();
          v39(v38);
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          OUTLINED_FUNCTION_9_0();
          OUTLINED_FUNCTION_17();
          __asm { BRAA            X1, X16 }
        }
        swift_task_alloc();
        OUTLINED_FUNCTION_20();
        v0[20] = v35;
        void *v35 = v42;
        uint64_t v37 = sub_25C8A5490;
LABEL_35:
        v35[1] = v37;
        OUTLINED_FUNCTION_17();
        sub_25C8A5B64();
        return;
      case 2:
        if (qword_26A5D95A8 != -1) {
          swift_once();
        }
        uint64_t v5 = v0 + 10;
        uint64_t v29 = v0[10];
        uint64_t v30 = v0[7];
        uint64_t v6 = v0[8];
        uint64_t v31 = __swift_project_value_buffer(v30, (uint64_t)qword_26A5DD5A0);
        BOOL v32 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
        LOBYTE(v6) = v6 + 16;
        v32(v29, v31, v30);
        uint64_t v10 = sub_25C8EC0D0();
        os_log_type_t v33 = sub_25C8EC2E0();
        OUTLINED_FUNCTION_10_0(v33);
        OUTLINED_FUNCTION_22();
        if (v34)
        {
          uint64_t v13 = "Unexpected state in execute()";
          goto LABEL_6;
        }
        uint64_t v14 = *v5;
        goto LABEL_13;
      case 3:
        sub_25C8A6370();
        goto LABEL_31;
      case 4:
        swift_task_alloc();
        OUTLINED_FUNCTION_20();
        v0[21] = v35;
        void *v35 = v36;
        uint64_t v37 = sub_25C8A5604;
        goto LABEL_35;
      case 5:
        sub_25C8EB670();
        goto LABEL_31;
      default:
        if (qword_26A5D95A8 != -1) {
          swift_once();
        }
        OUTLINED_FUNCTION_18();
        uint64_t v5 = v1 + 11;
        uint64_t v6 = *(v5 - 3);
        uint64_t v18 = OUTLINED_FUNCTION_4_2(v17, (uint64_t)qword_26A5DD5A0);
        v19(v18);
        uint64_t v10 = sub_25C8EC0D0();
        os_log_type_t v20 = sub_25C8EC2E0();
        OUTLINED_FUNCTION_10_0(v20);
        OUTLINED_FUNCTION_22();
        if (v21)
        {
          uint64_t v13 = "Flow is in .initialized state in execute(). Ensure the right constructor is being used.";
          goto LABEL_6;
        }
        uint64_t v14 = *v5;
        goto LABEL_13;
    }
  }
  sub_25C8A812C(v0[16], &qword_26A5D9BC8);
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_18();
  uint64_t v5 = v1 + 9;
  uint64_t v6 = *(v5 - 1);
  uint64_t v8 = OUTLINED_FUNCTION_4_2(v7, (uint64_t)qword_26A5DD5A0);
  v9(v8);
  uint64_t v10 = sub_25C8EC0D0();
  os_log_type_t v11 = sub_25C8EC2E0();
  OUTLINED_FUNCTION_10_0(v11);
  OUTLINED_FUNCTION_22();
  if (v12)
  {
    uint64_t v13 = "SwitchProfileWrapperFlow.execute Input is nil. Error executing request";
LABEL_6:
    uint64_t v14 = *v5;
    uint64_t v15 = (uint8_t *)OUTLINED_FUNCTION_5_0();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_25C89B000, v10, (os_log_type_t)v6, v13, v15, 2u);
    OUTLINED_FUNCTION_3();
  }
  else
  {
    uint64_t v14 = *v5;
  }
LABEL_13:
  uint64_t v24 = v0 + 7;
  uint64_t v22 = v0[7];
  uint64_t v23 = v24[1];

  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v14, v22);
  sub_25C8EC4D0();
  OUTLINED_FUNCTION_17();
}

uint64_t sub_25C8A5490()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25C8A5558()
{
  uint64_t v0 = OUTLINED_FUNCTION_5_1();
  v1(v0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  return v2();
}

uint64_t sub_25C8A5604()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25C8A56CC()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_featureFlags + 24);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_featureFlags + 32);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_featureFlags), v1);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2) & 1) == 0) {
    return 0;
  }
  __swift_project_boxed_opaque_existential_1((void *)(v0 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_deviceState), *(void *)(v0 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_deviceState + 24));
  return sub_25C8EB450() & 1;
}

uint64_t sub_25C8A5764(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25C8EB910();
  OUTLINED_FUNCTION_1_4();
  uint64_t v30 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_4_0();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = sub_25C8EC0F0();
  OUTLINED_FUNCTION_1_4();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_4_1();
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  uint64_t v14 = __swift_project_value_buffer(v10, (uint64_t)qword_26A5DD5A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v1, v14, v10);
  uint64_t v15 = sub_25C8EC0D0();
  os_log_type_t v16 = sub_25C8EC2F0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)OUTLINED_FUNCTION_5_0();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_25C89B000, v15, v16, "Target device resolution is required, pushing device resolution flow", v17, 2u);
    OUTLINED_FUNCTION_3();
  }

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v1, v10);
  *(unsigned char *)(v1 + 16) = 2;
  uint64_t v18 = v1 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_deviceState;
  sub_25C8A7E98(v1 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_deviceState, (uint64_t)v35);
  type metadata accessor for SwitchProfileDeviceResolutionStrategy();
  uint64_t v19 = swift_allocObject();
  sub_25C8A4290(v35, v19 + 16);
  *(void *)(v19 + 56) = 0;
  *(void *)(v19 + 64) = 0;
  *(unsigned char *)(v19 + 72) = 1;
  *(_OWORD *)(v19 + 80) = 0u;
  *(_OWORD *)(v19 + 96) = 0u;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 16))(v9, a1, v4);
  sub_25C8A7E98(v2 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_deviceResolutionProvider, (uint64_t)v35);
  sub_25C8A7E98(v2 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_outputPublisher, (uint64_t)v34);
  sub_25C8A7E98(v18, (uint64_t)v33);
  sub_25C8A7E98(v2 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_dialogProvider, (uint64_t)v31);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v31, v32);
  OUTLINED_FUNCTION_1_4();
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_4_0();
  uint64_t v23 = (uint64_t *)(v22 - v21);
  (*(void (**)(uint64_t))(v24 + 16))(v22 - v21);
  uint64_t v25 = *v23;
  uint64_t v26 = swift_retain();
  uint64_t v27 = sub_25C8A7B04(v26, v9, (uint64_t)v35, (uint64_t)v34, (uint64_t)v33, v25);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  *(void *)&v35[0] = v27;
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = sub_25C8A7E30;
  *(void *)(v28 + 24) = v2;
  type metadata accessor for ExecutionDeviceResolutionFlow();
  sub_25C8A7F64(&qword_26A5D9BC0, (void (*)(uint64_t))type metadata accessor for ExecutionDeviceResolutionFlow);
  swift_retain();
  sub_25C8EB640();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_25C8A5B64()
{
  OUTLINED_FUNCTION_6_1();
  v1[9] = v2;
  v1[10] = v0;
  v1[8] = v3;
  uint64_t v4 = sub_25C8EB950();
  v1[11] = v4;
  OUTLINED_FUNCTION_1_2(v4);
  v1[12] = v5;
  v1[13] = OUTLINED_FUNCTION_13();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9A60);
  OUTLINED_FUNCTION_19(v6);
  v1[14] = OUTLINED_FUNCTION_13();
  uint64_t v7 = sub_25C8EC0F0();
  v1[15] = v7;
  OUTLINED_FUNCTION_1_2(v7);
  v1[16] = v8;
  v1[17] = swift_task_alloc();
  v1[18] = swift_task_alloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_25C8A5C60()
{
  uint64_t v31 = v0;
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[18];
  uint64_t v2 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v4 = __swift_project_value_buffer(v2, (uint64_t)qword_26A5DD5A0);
  v0[19] = v4;
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[20] = v5;
  v0[21] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v1, v4, v2);
  swift_retain_n();
  uint64_t v6 = sub_25C8EC0D0();
  os_log_type_t v7 = sub_25C8EC2C0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = v0[10];
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(void *)&v29[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    uint64_t v10 = *(void **)(v8 + 24);
    if (v10)
    {
      id v11 = objc_msgSend(v10, sel_description);
      uint64_t v12 = sub_25C8EC170();
      unint64_t v14 = v13;
    }
    else
    {
      unint64_t v14 = 0xE500000000000000;
      uint64_t v12 = 0x3E6C696E3CLL;
    }
    uint64_t v19 = v0[16];
    uint64_t v27 = v0[15];
    uint64_t v28 = v0[18];
    v0[7] = sub_25C8BB4F0(v12, v14, (uint64_t *)v29);
    sub_25C8EC360();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_25C89B000, v6, v7, "Executing RCHFlow with remoteDevice: %s", v9, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();

    uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    v18(v28, v27);
  }
  else
  {
    uint64_t v15 = v0[18];
    uint64_t v16 = v0[15];
    uint64_t v17 = v0[16];
    swift_release_n();

    uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
    v18(v15, v16);
  }
  v0[22] = v18;
  uint64_t v20 = v0[14];
  uint64_t v21 = v0[10];
  sub_25C8A7E98(v21 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_deviceState, (uint64_t)(v0 + 2));
  uint64_t v22 = *(void **)(v21 + 24);
  uint64_t v23 = sub_25C8EB5D0();
  memset(v29, 0, sizeof(v29));
  uint64_t v30 = 0;
  __swift_storeEnumTagSinglePayload(v20, 1, 1, v23);
  type metadata accessor for SwitchProfileFlowStrategy();
  swift_allocObject();
  id v24 = v22;
  v0[23] = sub_25C8A8A4C((uint64_t)(v0 + 2), v22, (uint64_t)v29, 0, 0, v20);
  sub_25C8EB900();
  uint64_t v25 = (void *)swift_task_alloc();
  v0[24] = v25;
  *uint64_t v25 = v0;
  v25[1] = sub_25C8A5FC8;
  return sub_25C8A8CBC();
}

uint64_t sub_25C8A5FC8(uint64_t a1)
{
  uint64_t v4 = *v2;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v5 = v4;
  *uint64_t v5 = *v2;
  *(void *)(v4 + 200) = v1;
  swift_task_dealloc();
  if (!v1) {
    *(void *)(v4 + 208) = a1;
  }
  OUTLINED_FUNCTION_11_0();
  v6();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C8A613C()
{
  uint64_t v1 = (void *)v0[26];
  uint64_t v2 = v0[23];
  uint64_t v3 = v0[9];
  uint64_t v4 = v0[10];
  __swift_project_boxed_opaque_existential_1((void *)(v4 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_flowFactory), *(void *)(v4 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_flowFactory + 24));
  uint64_t v5 = *(void **)(v4 + 24);
  id v6 = v5;
  sub_25C8DD6D8(v2, v3, (uint64_t)v1, v5);

  sub_25C8EB660();
  swift_release();

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  return v7();
}

uint64_t sub_25C8A6230()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t, uint64_t))v0[20];
  uint64_t v2 = v0[19];
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[15];
  swift_release();
  v1(v3, v2, v4);
  uint64_t v5 = sub_25C8EC0D0();
  os_log_type_t v6 = sub_25C8EC2E0();
  if (os_log_type_enabled(v5, v6))
  {
    *(_WORD *)OUTLINED_FUNCTION_5_0() = 0;
    OUTLINED_FUNCTION_21(&dword_25C89B000, v7, v8, "Error thrown while creating RCH flow");
    OUTLINED_FUNCTION_3();
  }
  uint64_t v9 = (void *)v0[25];
  uint64_t v10 = (void (*)(void))v0[22];

  OUTLINED_FUNCTION_11_0();
  v10();
  sub_25C8EB670();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  return v11();
}

uint64_t sub_25C8A6370()
{
  uint64_t v1 = sub_25C8EC0F0();
  OUTLINED_FUNCTION_1_4();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_4_1();
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v1, (uint64_t)qword_26A5DD5A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v0, v5, v1);
  os_log_type_t v6 = sub_25C8EC0D0();
  os_log_type_t v7 = sub_25C8EC2D0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)OUTLINED_FUNCTION_5_0();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_25C89B000, v6, v7, "Device resolution was required but none were found. Dialoging failure and completing the flow.", v8, 2u);
    OUTLINED_FUNCTION_3();
  }

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  sub_25C8A7E98(v0 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_outputPublisher, (uint64_t)v10);
  sub_25C8EB0C0();
  swift_allocObject();
  swift_retain();
  v10[0] = sub_25C8EB0B0();
  sub_25C8EB650();
  return swift_release();
}

uint64_t sub_25C8A654C(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  uint64_t v3 = sub_25C8EC0F0();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C8A660C, 0, 0);
}

uint64_t sub_25C8A660C()
{
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[5];
  uint64_t v1 = v0[6];
  uint64_t v3 = v0[4];
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_26A5DD5A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_25C8EC0D0();
  os_log_type_t v6 = sub_25C8EC2D0();
  if (os_log_type_enabled(v5, v6))
  {
    *(_WORD *)OUTLINED_FUNCTION_5_0() = 0;
    OUTLINED_FUNCTION_21(&dword_25C89B000, v7, v8, "Returning remoteDeviceNotFound");
    OUTLINED_FUNCTION_3();
  }
  uint64_t v10 = v0[5];
  uint64_t v9 = v0[6];
  uint64_t v11 = v0[4];

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  swift_task_alloc();
  OUTLINED_FUNCTION_20();
  v0[7] = v12;
  *uint64_t v12 = v13;
  v12[1] = sub_25C8A6788;
  return sub_25C8B1DE8();
}

uint64_t sub_25C8A6788()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  return v3();
}

void sub_25C8A6864(void *a1)
{
  sub_25C8EC0F0();
  OUTLINED_FUNCTION_1_4();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_4_0();
  uint64_t v8 = v7 - v6;
  if (!a1)
  {
    char v9 = 3;
    goto LABEL_7;
  }
  if (a1 == (void *)1)
  {
    char v9 = 5;
LABEL_7:
    *(unsigned char *)(v1 + 16) = v9;
    return;
  }
  if (a1 != (void *)2)
  {
    uint64_t v10 = *(void **)(v1 + 24);
    *(void *)(v1 + 24) = a1;
    id v11 = a1;

    char v9 = 4;
    goto LABEL_7;
  }
  uint64_t v17 = v5;
  uint64_t v18 = v8;
  uint64_t v19 = v4;
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v19, (uint64_t)qword_26A5DD5A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v18, v12, v19);
  uint64_t v13 = sub_25C8EC0D0();
  os_log_type_t v14 = sub_25C8EC2E0();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)OUTLINED_FUNCTION_5_0();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_25C89B000, v13, v14, "Unexpected device resolution result", v15, 2u);
    OUTLINED_FUNCTION_3();
  }

  OUTLINED_FUNCTION_11_0();
  v16();
  sub_25C8EC4D0();
  __break(1u);
}

uint64_t sub_25C8A6A44()
{
  sub_25C8A812C(v0 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_input, &qword_26A5D9BC8);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_deviceState);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_deviceResolutionProvider);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_flowFactory);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_featureFlags);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_outputPublisher);
  sub_25C8A8014(v0 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_identityDialogs);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_dialogProvider);
  return v0;
}

uint64_t sub_25C8A6AEC()
{
  sub_25C8A6A44();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_25C8A6B44()
{
  return type metadata accessor for SwitchProfileWrapperFlow();
}

uint64_t type metadata accessor for SwitchProfileWrapperFlow()
{
  uint64_t result = qword_26A5D9B70;
  if (!qword_26A5D9B70) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25C8A6B94()
{
  sub_25C8A6C54();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_25C8A6C54()
{
  if (!qword_26A5D9B90)
  {
    sub_25C8EB910();
    unint64_t v0 = sub_25C8EC350();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A5D9B90);
    }
  }
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SwitchProfileWrapperFlow.State(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFB)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v5 = v6 - 6;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for SwitchProfileWrapperFlow.State(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x25C8A6E10);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

uint64_t sub_25C8A6E38(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25C8A6E40(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SwitchProfileWrapperFlow.State()
{
  return &type metadata for SwitchProfileWrapperFlow.State;
}

unint64_t sub_25C8A6E5C()
{
  unint64_t result = qword_26A5D9B98[0];
  if (!qword_26A5D9B98[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A5D9B98);
  }
  return result;
}

uint64_t sub_25C8A6EA8(uint64_t a1)
{
  return 1;
}

uint64_t sub_25C8A6ED0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_25C8A6F80;
  return MEMORY[0x270F66CE0](a1, a2, a3);
}

uint64_t sub_25C8A6F80()
{
  OUTLINED_FUNCTION_6_1();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_2_1();
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_3_1();
  *unsigned int v4 = v3;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

uint64_t sub_25C8A704C()
{
  return sub_25C8A4CD4();
}

uint64_t sub_25C8A7070()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C8A710C;
  return sub_25C8A4D64();
}

uint64_t sub_25C8A710C()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  return v3();
}

uint64_t sub_25C8A71CC()
{
  type metadata accessor for SwitchProfileWrapperFlow();
  return sub_25C8EB310();
}

uint64_t sub_25C8A720C()
{
  OUTLINED_FUNCTION_6_1();
  uint64_t v3 = v2;
  swift_task_alloc();
  OUTLINED_FUNCTION_20();
  *(void *)(v1 + 16) = v4;
  *unsigned int v4 = v5;
  v4[1] = sub_25C8A710C;
  return sub_25C8A654C(v3, v0);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
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

uint64_t sub_25C8A7334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v25 = type metadata accessor for BaseDialogProvider();
  uint64_t v26 = &off_2709F0150;
  v24[0] = a4;
  uint64_t v22 = &type metadata for IdentityFlowFactoryImpl;
  uint64_t v23 = &off_2709F0410;
  type metadata accessor for SwitchProfileWrapperFlow();
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v24, v25);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (uint64_t *)&v21[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(uint64_t *))(v16 + 16))(v15);
  uint64_t v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v21, (uint64_t)v22);
  MEMORY[0x270FA5388](v17);
  (*(void (**)(void))(v18 + 16))();
  uint64_t v19 = sub_25C8A7530(a1, a2, a3, *v15, a5, a6, v12);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  return v19;
}

uint64_t sub_25C8A7530(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  uint64_t v34 = sub_25C8EC020();
  uint64_t v35 = MEMORY[0x263F75980];
  *(void *)&long long v33 = a5;
  uint64_t v31 = &type metadata for IdentityFeatureFlagsProvider;
  uint64_t v32 = &protocol witness table for IdentityFeatureFlagsProvider;
  uint64_t v28 = type metadata accessor for BaseDialogProvider();
  uint64_t v29 = &off_2709F0150;
  *(void *)&long long v27 = a4;
  uint64_t v25 = &type metadata for IdentityFlowFactoryImpl;
  uint64_t v26 = &off_2709F0410;
  *(void *)(a7 + 24) = 0;
  uint64_t v14 = a7 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_input;
  uint64_t v15 = sub_25C8EB910();
  __swift_storeEnumTagSinglePayload(v14, 1, 1, v15);
  swift_beginAccess();
  sub_25C8A8068(a1, v14);
  swift_endAccess();
  sub_25C8A7E98(a2, a7 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_deviceState);
  sub_25C8A7E98(a3, a7 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_outputPublisher);
  sub_25C8A7E98((uint64_t)&v27, (uint64_t)v22);
  sub_25C8A7E98(a2, (uint64_t)v21);
  sub_25C8A7E98((uint64_t)v22, (uint64_t)__src);
  sub_25C8A80D0((uint64_t)v21, (uint64_t)&v18, &qword_26A5D9BD8);
  if (v19)
  {
    sub_25C8A812C((uint64_t)v21, &qword_26A5D9BD8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
    sub_25C8A4290(&v18, (uint64_t)v20);
  }
  else
  {
    sub_25C8EB960();
    sub_25C8A812C((uint64_t)v21, &qword_26A5D9BD8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
    sub_25C8A812C((uint64_t)&v18, &qword_26A5D9BD8);
  }
  sub_25C8A4290(v20, (uint64_t)&__src[5]);
  sub_25C8A7E98((uint64_t)&__src[5], (uint64_t)v20);
  type metadata accessor for LocUtil();
  uint64_t v16 = swift_allocObject();
  sub_25C8A4290(v20, v16 + 16);
  __src[10] = v16;
  __swift_destroy_boxed_opaque_existential_1(a3);
  __swift_destroy_boxed_opaque_existential_1(a2);
  sub_25C8A812C(a1, &qword_26A5D9BC8);
  memcpy((void *)(a7 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_identityDialogs), __src, 0x58uLL);
  sub_25C8A4290(&v33, a7 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_deviceResolutionProvider);
  *(unsigned char *)(a7 + 16) = a6;
  sub_25C8A4290(&v24, a7 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_flowFactory);
  sub_25C8A4290(&v30, a7 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_featureFlags);
  sub_25C8A4290(&v27, a7 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_dialogProvider);
  return a7;
}

void *sub_25C8A77CC(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4, long long *a5, long long *a6, uint64_t a7, void *a8)
{
  a8[10] = type metadata accessor for SwitchProfileDeviceResolutionStrategy();
  a8[11] = &off_2709F03C0;
  a8[7] = a1;
  uint64_t v20 = type metadata accessor for BaseDialogProvider();
  uint64_t v21 = &off_2709F0150;
  *(void *)&long long v19 = a7;
  uint64_t v16 = (uint64_t)a8 + OBJC_IVAR____TtC20SiriIdentityInternal29ExecutionDeviceResolutionFlow_input;
  uint64_t v17 = sub_25C8EB910();
  __swift_storeEnumTagSinglePayload(v16, 1, 1, v17);
  swift_beginAccess();
  sub_25C8A7EFC(a2, v16);
  swift_endAccess();
  sub_25C8A4290(a3, (uint64_t)(a8 + 2));
  *(void *)((char *)a8 + OBJC_IVAR____TtC20SiriIdentityInternal29ExecutionDeviceResolutionFlow_state) = a4;
  sub_25C8A4290(a5, (uint64_t)(a8 + 12));
  sub_25C8A4290(a6, (uint64_t)(a8 + 17));
  sub_25C8A4290(&v19, (uint64_t)(a8 + 22));
  return a8;
}

void *sub_25C8A78F0(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4, long long *a5, long long *a6, uint64_t a7)
{
  uint64_t v29 = type metadata accessor for SwitchProfileDeviceResolutionStrategy();
  long long v30 = &off_2709F03C0;
  v28[0] = a1;
  uint64_t v26 = type metadata accessor for BaseDialogProvider();
  long long v27 = &off_2709F0150;
  v25[0] = a7;
  type metadata accessor for ExecutionDeviceResolutionFlow();
  uint64_t v14 = (void *)swift_allocObject();
  uint64_t v15 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v28, v29);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (void *)((char *)v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v18 + 16))(v17);
  uint64_t v19 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v25, v26);
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (void *)((char *)v25 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v22 + 16))(v21);
  uint64_t v23 = sub_25C8A77CC(*v17, a2, a3, a4, a5, a6, *v21, v14);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  return v23;
}

void *sub_25C8A7B04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v28 = a2;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9BC8);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v35[3] = type metadata accessor for SwitchProfileDeviceResolutionStrategy();
  v35[4] = &off_2709F03C0;
  v35[0] = a1;
  v34[3] = type metadata accessor for BaseDialogProvider();
  v34[4] = &off_2709F0150;
  v34[0] = a6;
  sub_25C8A7E98((uint64_t)v35, (uint64_t)v33);
  uint64_t v15 = sub_25C8EB910();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v14, a2, v15);
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v15);
  sub_25C8A7E98(a3, (uint64_t)v32);
  sub_25C8A7E98(a4, (uint64_t)v31);
  sub_25C8A7E98(a5, (uint64_t)v30);
  sub_25C8A7E98((uint64_t)v34, (uint64_t)v29);
  uint64_t v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v33, v33[3]);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (uint64_t *)((char *)&v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v20 + 16))(v19);
  uint64_t v21 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v29, v29[3]);
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = (uint64_t *)((char *)&v27 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v24 + 16))(v23);
  uint64_t v25 = sub_25C8A78F0(*v19, (uint64_t)v14, v32, 0x8000000000000000, v31, v30, *v23);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
  __swift_destroy_boxed_opaque_existential_1(a5);
  __swift_destroy_boxed_opaque_existential_1(a4);
  __swift_destroy_boxed_opaque_existential_1(a3);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v28, v15);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
  return v25;
}

uint64_t sub_25C8A7E34()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25C8A7E6C(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_25C8A7E98(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25C8A7EFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9BC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C8A7F64(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25C8A7FAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9BC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C8A8014(uint64_t a1)
{
  return a1;
}

uint64_t sub_25C8A8068(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9BC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C8A80D0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_16();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_25C8A812C(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_16();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t OUTLINED_FUNCTION_4_2(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(v2, a2);
  return v3;
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return *(void *)(v0 + 152);
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return v0 + 8;
}

BOOL OUTLINED_FUNCTION_10_0(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_13()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_19(uint64_t a1)
{
  return a1 - 8;
}

void OUTLINED_FUNCTION_21(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

uint64_t *sub_25C8A82E8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25C8EC0C0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
    *((_WORD *)v9 + 8) = *((_WORD *)v10 + 8);
  }
  return a1;
}

uint64_t sub_25C8A83C4(uint64_t a1)
{
  uint64_t v2 = sub_25C8EC0C0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_25C8A8428(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C8EC0C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_WORD *)(v8 + 16) = *(_WORD *)(v9 + 16);
  return a1;
}

uint64_t sub_25C8A84B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C8EC0C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)uint64_t v8 = *(void *)v9;
  *(void *)(v8 + 8) = *(void *)(v9 + 8);
  *(unsigned char *)(v8 + 16) = *(unsigned char *)(v9 + 16);
  *(unsigned char *)(v8 + 17) = *(unsigned char *)(v9 + 17);
  return a1;
}

uint64_t sub_25C8A8550(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C8EC0C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_WORD *)(v8 + 16) = *(_WORD *)(v9 + 16);
  return a1;
}

uint64_t sub_25C8A85DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C8EC0C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(unsigned char *)(v8 + 16) = *(unsigned char *)(v9 + 16);
  *(unsigned char *)(v8 + 17) = *(unsigned char *)(v9 + 17);
  return a1;
}

uint64_t sub_25C8A8670(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C8A8684);
}

uint64_t sub_25C8A8684(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25C8EC0C0();
  OUTLINED_FUNCTION_0_4();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unsigned int v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20) + 17);
    if (v9 >= 2) {
      return ((v9 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_25C8A8724(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C8A8738);
}

void sub_25C8A8738(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_25C8EC0C0();
  OUTLINED_FUNCTION_0_4();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20) + 17) = a2 + 1;
  }
}

uint64_t type metadata accessor for Signpost.OpenSignpost()
{
  uint64_t result = qword_26A5D9BE8;
  if (!qword_26A5D9BE8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C8A880C()
{
  uint64_t result = sub_25C8EC0C0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25C8A88A0()
{
  sub_25C8A8940();
  if (qword_26A5D95C0 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_25C8EC340();
  qword_26A5D9BE0 = result;
  return result;
}

unint64_t sub_25C8A8940()
{
  unint64_t result = qword_26A5D9BF8;
  if (!qword_26A5D9BF8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A5D9BF8);
  }
  return result;
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for IdentitySignpost(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 18))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 17);
      BOOL v4 = v3 >= 2;
      int v2 = (v3 + 2147483646) & 0x7FFFFFFF;
      if (!v4) {
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

uint64_t storeEnumTagSinglePayload for IdentitySignpost(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_WORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 18) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 18) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 17) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IdentitySignpost()
{
  return &type metadata for IdentitySignpost;
}

uint64_t sub_25C8A8A4C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _UNKNOWN **a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v14 = OBJC_IVAR____TtC20SiriIdentityInternal25SwitchProfileFlowStrategy_remoteDevice;
  *(void *)(v7 + OBJC_IVAR____TtC20SiriIdentityInternal25SwitchProfileFlowStrategy_remoteDevice) = 0;
  sub_25C8A7E98(a1, v7 + OBJC_IVAR____TtC20SiriIdentityInternal25SwitchProfileFlowStrategy_deviceState);
  uint64_t v15 = *(void **)(v7 + v14);
  *(void *)(v7 + v14) = a2;
  id v16 = a2;

  sub_25C8AC2B4(a3, (uint64_t)v18, &qword_26A5D9CA0);
  type metadata accessor for Globals();
  swift_allocObject();
  *(void *)(v7 + OBJC_IVAR____TtC20SiriIdentityInternal25SwitchProfileFlowStrategy_globals) = sub_25C8B52A0((uint64_t)v18);
  if (a4)
  {
  }
  else
  {
    type metadata accessor for UserDefaultsProvider();
    swift_allocObject();
    a4 = sub_25C8CB200();

    a5 = &off_2709EFFF0;
  }
  sub_25C89F4B0(a3, &qword_26A5D9CA0);
  __swift_destroy_boxed_opaque_existential_1(a1);
  *(void *)(v7 + 16) = a4;
  *(void *)(v7 + 24) = a5;
  sub_25C8AC318(a6, v7 + OBJC_IVAR____TtC20SiriIdentityInternal25SwitchProfileFlowStrategy_identifiedUserOverride);
  return v7;
}

uint64_t sub_25C8A8B88()
{
  uint64_t v0 = sub_25C8EC0F0();
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_4_1();
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v0, (uint64_t)qword_26A5DD5A0);
  OUTLINED_FUNCTION_5_2();
  v2();
  unsigned int v3 = sub_25C8EC0D0();
  os_log_type_t v4 = sub_25C8EC2D0();
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)OUTLINED_FUNCTION_5_0() = 0;
    OUTLINED_FUNCTION_31(&dword_25C89B000, v5, v6, "SwitchProfileFlowStrategy.actionForInput() called");
    OUTLINED_FUNCTION_3();
  }

  uint64_t v7 = OUTLINED_FUNCTION_19_0();
  v8(v7);
  return sub_25C8EB500();
}

uint64_t sub_25C8A8CBC()
{
  OUTLINED_FUNCTION_6_1();
  v1[14] = v2;
  v1[15] = v0;
  v1[13] = v3;
  uint64_t v4 = sub_25C8EB940();
  v1[16] = v4;
  OUTLINED_FUNCTION_1_2(v4);
  v1[17] = v5;
  v1[18] = OUTLINED_FUNCTION_11_1();
  v1[19] = swift_task_alloc();
  uint64_t v6 = sub_25C8EB950();
  v1[20] = v6;
  OUTLINED_FUNCTION_1_2(v6);
  v1[21] = v7;
  v1[22] = OUTLINED_FUNCTION_11_1();
  v1[23] = swift_task_alloc();
  v1[24] = swift_task_alloc();
  v1[25] = swift_task_alloc();
  uint64_t v8 = sub_25C8EC0F0();
  v1[26] = v8;
  OUTLINED_FUNCTION_1_2(v8);
  v1[27] = v9;
  v1[28] = OUTLINED_FUNCTION_11_1();
  v1[29] = swift_task_alloc();
  v1[30] = swift_task_alloc();
  v1[31] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C8A8E04, 0, 0);
}

uint64_t sub_25C8A8E04()
{
  uint64_t v77 = v0;
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v2 = *(void *)(v0 + 216);
  __swift_project_value_buffer(v1, (uint64_t)qword_26A5DD5A0);
  uint64_t v73 = *(void (**)(void))(v2 + 16);
  OUTLINED_FUNCTION_38();
  v3();
  uint64_t v4 = sub_25C8EC0D0();
  os_log_type_t v5 = sub_25C8EC2D0();
  if (OUTLINED_FUNCTION_13_0(v5))
  {
    uint64_t v6 = (uint8_t *)OUTLINED_FUNCTION_5_0();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_25C89B000, v4, (os_log_type_t)v1, "SwitchProfileFlowStrategy.makeIntentFromParse() called", v6, 2u);
    OUTLINED_FUNCTION_3();
  }

  OUTLINED_FUNCTION_9_1();
  v7();
  sub_25C8C93E8(v0 + 56);
  if (!*(void *)(v0 + 80))
  {
    uint64_t v18 = *(void *)(v0 + 200);
    uint64_t v19 = *(void *)(v0 + 160);
    uint64_t v20 = *(void *)(v0 + 168);
    sub_25C89F4B0(v0 + 56, (uint64_t *)&unk_26A5D9FE0);
    uint64_t v21 = *(void (**)(void))(v20 + 16);
    OUTLINED_FUNCTION_6_0();
    v21();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v20 + 88))(v18, v19) != *MEMORY[0x263F6FF70]) {
      goto LABEL_21;
    }
    uint64_t v22 = *(void *)(v0 + 192);
    uint64_t v23 = *(void *)(v0 + 160);
    uint64_t v24 = *(void *)(v0 + 168);
    uint64_t v25 = *(void *)(v0 + 152);
    uint64_t v26 = *(void *)(v0 + 136);
    uint64_t v72 = *(void *)(v0 + 128);
    OUTLINED_FUNCTION_6_0();
    v21();
    (*(void (**)(uint64_t, uint64_t))(v24 + 96))(v22, v23);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 32))(v25, v22, v72);
    uint64_t v27 = sub_25C8EB920();
    uint64_t v29 = v28;
    if (qword_26A5D9540 != -1) {
      swift_once();
    }
    if (v27 == *(void *)(qword_26A5DD528 + 96) && v29 == *(void *)(qword_26A5DD528 + 104))
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v31 = sub_25C8EC550();
      swift_bridgeObjectRelease();
      if ((v31 & 1) == 0)
      {
        OUTLINED_FUNCTION_11_0();
        v32();
LABEL_21:
        OUTLINED_FUNCTION_38();
        v33();
        OUTLINED_FUNCTION_6_0();
        v21();
        uint64_t v34 = sub_25C8EC0D0();
        os_log_type_t v35 = sub_25C8EC2E0();
        BOOL v36 = os_log_type_enabled(v34, v35);
        uint64_t v37 = *(void *)(v0 + 184);
        if (v36)
        {
          log = v34;
          uint64_t v38 = *(void *)(v0 + 168);
          uint64_t v39 = *(void *)(v0 + 160);
          uint64_t v40 = v21;
          uint64_t v41 = (uint8_t *)OUTLINED_FUNCTION_8_0();
          uint64_t v76 = OUTLINED_FUNCTION_10_1();
          *(_DWORD *)uint64_t v41 = 136315138;
          OUTLINED_FUNCTION_6_0();
          v40();
          uint64_t v42 = sub_25C8EC180();
          *(void *)(v0 + 96) = sub_25C8BB4F0(v42, v43, &v76);
          sub_25C8EC360();
          swift_bridgeObjectRelease();
          uint64_t v74 = *(void (**)(uint64_t, uint64_t))(v38 + 8);
          v74(v37, v39);
          _os_log_impl(&dword_25C89B000, log, v35, "Unable to make intent from parse %s", v41, 0xCu);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_3();
          OUTLINED_FUNCTION_3();
        }
        else
        {
          uint64_t v74 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 168) + 8);
          OUTLINED_FUNCTION_11_0();
          v44();
        }
        OUTLINED_FUNCTION_11_0();
        v45();
        uint64_t v46 = *(void *)(v0 + 200);
        uint64_t v47 = *(void *)(v0 + 160);
        type metadata accessor for IdentityFlowError();
        swift_allocObject();
        uint64_t v48 = sub_25C8D786C(0);
        sub_25C8AC26C((unint64_t *)&qword_26A5D9FA0, (void (*)(uint64_t))type metadata accessor for IdentityFlowError);
        swift_allocError();
        *uint64_t v49 = v48;
        swift_willThrow();
        v74(v46, v47);
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
        OUTLINED_FUNCTION_20_0();
        __asm { BRAA            X1, X16 }
      }
    }
    uint64_t v52 = *(void *)(v0 + 112);
    OUTLINED_FUNCTION_5_2();
    v53();
    uint64_t v54 = *(void **)(v0 + 112);
    if (!v52)
    {
      type metadata accessor for SwitchProfileIntent();
      uint64_t v55 = sub_25C8EB930();
      sub_25C8A4384(v55);
      swift_bridgeObjectRelease();
    }
    uint64_t v56 = v73;
    uint64_t v57 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 136) + 8);
    id v58 = v54;
    uint64_t v59 = OUTLINED_FUNCTION_30();
    uint64_t v75 = v57;
    ((void (*)(uint64_t))v57)(v59);
    OUTLINED_FUNCTION_38();
    v56();
    unint64_t v60 = (void *)sub_25C8EC0D0();
    os_log_type_t v61 = sub_25C8EC2D0();
    if (OUTLINED_FUNCTION_23(v61))
    {
      *(_WORD *)OUTLINED_FUNCTION_5_0() = 0;
      OUTLINED_FUNCTION_36(&dword_25C89B000, v62, v63, "Finished creating direct invocation intent from parse");
      OUTLINED_FUNCTION_3();
    }
    uint64_t v64 = *(void *)(v0 + 152);
    uint64_t v65 = *(void *)(v0 + 128);

    OUTLINED_FUNCTION_11_0();
    v66();
    v75(v64, v65);
    uint64_t v67 = OUTLINED_FUNCTION_30();
    v68(v67);
LABEL_34:
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
    OUTLINED_FUNCTION_20_0();
    __asm { BRAA            X2, X16 }
  }
  sub_25C8A4290((long long *)(v0 + 56), v0 + 16);
  type metadata accessor for SwitchProfileIntent();
  id v8 = sub_25C8B4E38((void *)(v0 + 16));
  *(void *)(v0 + 256) = v8;
  OUTLINED_FUNCTION_38();
  v9();
  uint64_t v10 = (void *)sub_25C8EC0D0();
  os_log_type_t v11 = sub_25C8EC2D0();
  if (OUTLINED_FUNCTION_23(v11))
  {
    *(_WORD *)OUTLINED_FUNCTION_5_0() = 0;
    OUTLINED_FUNCTION_36(&dword_25C89B000, v12, v13, "Finished creating intent from parse");
    OUTLINED_FUNCTION_3();
  }

  OUTLINED_FUNCTION_9_1();
  v14();
  if (objc_msgSend(v8, sel_switchType) != (id)1)
  {
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    goto LABEL_34;
  }
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v0 + 264) = v15;
  void *v15 = v0;
  v15[1] = sub_25C8A96B8;
  OUTLINED_FUNCTION_20_0();
  return sub_25C8A99DC();
}

uint64_t sub_25C8A96B8()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25C8A9784, 0, 0);
}

uint64_t sub_25C8A9784()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 256);
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
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v1(v3);
}

uint64_t sub_25C8A9874@<X0>(uint64_t a1@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9A60);
  uint64_t v6 = OUTLINED_FUNCTION_19(v5);
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_26();
  sub_25C8AC2B4(v1 + OBJC_IVAR____TtC20SiriIdentityInternal25SwitchProfileFlowStrategy_identifiedUserOverride, v3, &qword_26A5D9A60);
  if (__swift_getEnumTagSinglePayload(v3, 1, v7) == 1)
  {
    sub_25C89F4B0(v3, &qword_26A5D9A60);
    sub_25C8EBE50();
    if (!static SiriEnvironment.getUserIdentity()())
    {
      uint64_t v12 = 1;
      return __swift_storeEnumTagSinglePayload(a1, v12, 1, v7);
    }
    sub_25C8EB7E0();
    swift_release();
  }
  else
  {
    os_log_type_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32);
    v11(v2, v3, v7);
    v11(a1, v2, v7);
  }
  uint64_t v12 = 0;
  return __swift_storeEnumTagSinglePayload(a1, v12, 1, v7);
}

uint64_t sub_25C8A99DC()
{
  OUTLINED_FUNCTION_6_1();
  v1[4] = v2;
  v1[5] = v0;
  uint64_t v3 = sub_25C8EC0F0();
  v1[6] = v3;
  OUTLINED_FUNCTION_1_2(v3);
  v1[7] = v4;
  v1[8] = OUTLINED_FUNCTION_11_1();
  v1[9] = swift_task_alloc();
  v1[10] = swift_task_alloc();
  v1[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C8A9A90, 0, 0);
}

uint64_t sub_25C8A9A90()
{
  uint64_t v48 = v0;
  sub_25C8A9FB4();
  if (v2)
  {
    uint64_t v3 = v1;
    unint64_t v4 = v2;
    uint64_t v5 = *(void **)(v0 + 32);
    swift_bridgeObjectRetain();
    sub_25C8AC214(v3, v4, v5);
    if (qword_26A5D95A8 != -1) {
      swift_once();
    }
    uint64_t v6 = *(void *)(v0 + 88);
    uint64_t v8 = *(void *)(v0 + 48);
    uint64_t v7 = *(void *)(v0 + 56);
    uint64_t v9 = __swift_project_value_buffer(v8, (uint64_t)qword_26A5DD5A0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v9, v8);
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_25C8EC0D0();
    os_log_type_t v11 = sub_25C8EC2D0();
    BOOL v12 = os_log_type_enabled(v10, v11);
    uint64_t v13 = *(void *)(v0 + 88);
    uint64_t v14 = *(void *)(v0 + 48);
    uint64_t v15 = *(void *)(v0 + 56);
    if (v12)
    {
      uint64_t v46 = *(void *)(v0 + 88);
      uint64_t v16 = (uint8_t *)OUTLINED_FUNCTION_8_0();
      uint64_t v47 = OUTLINED_FUNCTION_10_1();
      OUTLINED_FUNCTION_37(4.8149e-34);
      swift_bridgeObjectRetain();
      *(void *)(v0 + 24) = sub_25C8BB4F0(v3, v4, &v47);
      sub_25C8EC360();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25C89B000, v10, v11, "Setting iCloudAltDSID =%s", v16, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();

      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v46, v14);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
    }
  }
  else
  {
    if (qword_26A5D95A8 != -1) {
      swift_once();
    }
    uint64_t v17 = *(void *)(v0 + 80);
    uint64_t v18 = *(void *)(v0 + 48);
    uint64_t v19 = *(void *)(v0 + 56);
    uint64_t v20 = __swift_project_value_buffer(v18, (uint64_t)qword_26A5DD5A0);
    uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16);
    v21(v17, v20, v18);
    uint64_t v22 = sub_25C8EC0D0();
    os_log_type_t v23 = sub_25C8EC2C0();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)OUTLINED_FUNCTION_5_0();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_25C89B000, v22, v23, "Did not find iCloudAltDSID", v24, 2u);
      OUTLINED_FUNCTION_3();
    }
    uint64_t v25 = *(void *)(v0 + 56);

    uint64_t v26 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
    OUTLINED_FUNCTION_9_1();
    v27();
    sub_25C8AA288();
    if (v29)
    {
      uint64_t v30 = v28;
      unint64_t v31 = v29;
      sub_25C8AC1BC(v28, v29, *(void **)(v0 + 32));
      uint64_t v32 = OUTLINED_FUNCTION_28();
      ((void (*)(uint64_t))v21)(v32);
      swift_bridgeObjectRetain();
      long long v33 = sub_25C8EC0D0();
      os_log_type_t v34 = sub_25C8EC2D0();
      BOOL v35 = os_log_type_enabled(v33, v34);
      uint64_t v36 = *(void *)(v0 + 72);
      uint64_t v37 = *(void *)(v0 + 48);
      if (v35)
      {
        uint64_t v38 = (uint8_t *)OUTLINED_FUNCTION_8_0();
        uint64_t v47 = OUTLINED_FUNCTION_10_1();
        *(_DWORD *)uint64_t v38 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 16) = sub_25C8BB4F0(v30, v31, &v47);
        sub_25C8EC360();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25C89B000, v33, v34, "Setting homeUserID =%s", v38, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_3();
        OUTLINED_FUNCTION_3();

        OUTLINED_FUNCTION_9_1();
        v39();
        goto LABEL_19;
      }
      swift_bridgeObjectRelease_n();
    }
    else
    {
      uint64_t v40 = *(void *)(v0 + 64);
      uint64_t v41 = OUTLINED_FUNCTION_28();
      ((void (*)(uint64_t))v21)(v41);
      long long v33 = sub_25C8EC0D0();
      os_log_type_t v42 = sub_25C8EC2E0();
      if (OUTLINED_FUNCTION_23(v42))
      {
        unint64_t v43 = (uint8_t *)OUTLINED_FUNCTION_5_0();
        *(_WORD *)unint64_t v43 = 0;
        _os_log_impl(&dword_25C89B000, v33, (os_log_type_t)v40, "No IDs available; not setting ID in intent", v43, 2u);
        OUTLINED_FUNCTION_3();
      }
      uint64_t v36 = *(void *)(v0 + 64);
      uint64_t v37 = *(void *)(v0 + 48);
    }

    v26(v36, v37);
  }
LABEL_19:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v44 = *(uint64_t (**)(void))(v0 + 8);
  return v44();
}

void sub_25C8A9FB4()
{
  OUTLINED_FUNCTION_29();
  uint64_t v0 = sub_25C8EC0F0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v2 = v1;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v22 - v5;
  uint64_t v7 = sub_25C8B5268();
  if ((v7 & 1) != 0 && (uint64_t v7 = sub_25C8CB034(), v8))
  {
    uint64_t v9 = v7;
    unint64_t v10 = v8;
    if (qword_26A5D95A8 != -1) {
      uint64_t v7 = swift_once();
    }
    OUTLINED_FUNCTION_7_0(v7, (uint64_t)qword_26A5DD5A0);
    OUTLINED_FUNCTION_4_3();
    v11();
    swift_bridgeObjectRetain_n();
    BOOL v12 = sub_25C8EC0D0();
    os_log_type_t v13 = sub_25C8EC2D0();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)OUTLINED_FUNCTION_8_0();
      uint64_t v23 = OUTLINED_FUNCTION_10_1();
      *(_DWORD *)uint64_t v14 = 136315138;
      v22[1] = v14 + 4;
      swift_bridgeObjectRetain();
      uint64_t v15 = sub_25C8BB4F0(v9, v10, &v23);
      OUTLINED_FUNCTION_33(v15);
      sub_25C8EC360();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25C89B000, v12, v13, "default found with iCloudAltDSID = %s", v14, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v2 + 8))(v6, v0);
  }
  else
  {
    if (qword_26A5D95A8 != -1) {
      uint64_t v7 = swift_once();
    }
    OUTLINED_FUNCTION_7_0(v7, (uint64_t)qword_26A5DD5A0);
    OUTLINED_FUNCTION_4_3();
    v16();
    uint64_t v17 = (void *)sub_25C8EC0D0();
    os_log_type_t v18 = sub_25C8EC2D0();
    if (OUTLINED_FUNCTION_13_0(v18))
    {
      *(_WORD *)OUTLINED_FUNCTION_5_0() = 0;
      OUTLINED_FUNCTION_12(&dword_25C89B000, v19, v20, "Looking up MAF for recognized iCloudAltDSID");
      OUTLINED_FUNCTION_3();
    }

    OUTLINED_FUNCTION_9_1();
    v21();
    sub_25C8AA974();
  }
  OUTLINED_FUNCTION_21_0();
}

void sub_25C8AA288()
{
  uint64_t v0 = sub_25C8EC0F0();
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_4_1();
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v0, (uint64_t)qword_26A5DD5A0);
  OUTLINED_FUNCTION_5_2();
  v2();
  uint64_t v3 = sub_25C8EC0D0();
  os_log_type_t v4 = sub_25C8EC2D0();
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)OUTLINED_FUNCTION_5_0() = 0;
    OUTLINED_FUNCTION_31(&dword_25C89B000, v5, v6, "Looking up MAF for recognized homeUserID");
    OUTLINED_FUNCTION_3();
  }

  uint64_t v7 = OUTLINED_FUNCTION_19_0();
  v8(v7);
  sub_25C8AA3BC();
}

void sub_25C8AA3BC()
{
  OUTLINED_FUNCTION_29();
  uint64_t v2 = sub_25C8EC0F0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v4 = v3;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v57 = ((char *)&v54 - v10);
  MEMORY[0x270FA5388](v9);
  BOOL v12 = (char *)&v54 - v11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9C98);
  uint64_t v14 = OUTLINED_FUNCTION_19(v13);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9A60);
  uint64_t v18 = OUTLINED_FUNCTION_19(v17);
  MEMORY[0x270FA5388](v18);
  uint64_t v19 = OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v21 = v20;
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_26();
  sub_25C8A9874(v1);
  if (__swift_getEnumTagSinglePayload(v1, 1, v19) == 1)
  {
    uint64_t v23 = sub_25C89F4B0(v1, &qword_26A5D9A60);
LABEL_10:
    if (qword_26A5D95A8 != -1) {
      uint64_t v23 = swift_once();
    }
    OUTLINED_FUNCTION_18_0(v23, (uint64_t)qword_26A5DD5A0);
    OUTLINED_FUNCTION_4_3();
    v38();
    uint64_t v39 = (void *)sub_25C8EC0D0();
    os_log_type_t v40 = sub_25C8EC2E0();
    if (OUTLINED_FUNCTION_13_0(v40))
    {
      *(_WORD *)OUTLINED_FUNCTION_5_0() = 0;
      OUTLINED_FUNCTION_12(&dword_25C89B000, v41, v42, "No homeUserID found.");
      OUTLINED_FUNCTION_3();
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v8, v2);
    goto LABEL_15;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 32))(v0, v1, v19);
  uint64_t v24 = sub_25C8EB520();
  uint64_t v26 = v21;
  if (!v25)
  {
    uint64_t v23 = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 8))(v0, v19);
    goto LABEL_10;
  }
  uint64_t v27 = v24;
  unint64_t v28 = v25;
  uint64_t v56 = v26;
  sub_25C8EAFD0();
  uint64_t v29 = sub_25C8EB000();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v16, 1, v29);
  uint64_t v31 = sub_25C89F4B0((uint64_t)v16, &qword_26A5D9C98);
  if (EnumTagSinglePayload == 1)
  {
    if (qword_26A5D95A8 != -1) {
      uint64_t v31 = swift_once();
    }
    OUTLINED_FUNCTION_18_0(v31, (uint64_t)qword_26A5DD5A0);
    uint64_t v32 = v57;
    OUTLINED_FUNCTION_4_3();
    v33();
    swift_bridgeObjectRetain();
    os_log_type_t v34 = sub_25C8EC0D0();
    os_log_type_t v35 = sub_25C8EC2E0();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)OUTLINED_FUNCTION_8_0();
      uint64_t v55 = OUTLINED_FUNCTION_10_1();
      uint64_t v58 = v55;
      *(_DWORD *)uint64_t v36 = 136315138;
      uint64_t v54 = v36 + 4;
      swift_bridgeObjectRetain();
      uint64_t v37 = sub_25C8BB4F0(v27, v28, &v58);
      OUTLINED_FUNCTION_24(v37);
      sub_25C8EC360();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25C89B000, v34, v35, "Invalid homeUserID='%s' found.", v36, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();

      (*(void (**)(NSObject *, uint64_t))(v4 + 8))(v57, v2);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      (*(void (**)(NSObject *, uint64_t))(v4 + 8))(v32, v2);
    }
    uint64_t v50 = OUTLINED_FUNCTION_14();
    v51(v50);
  }
  else
  {
    if (qword_26A5D95A8 != -1) {
      uint64_t v31 = swift_once();
    }
    OUTLINED_FUNCTION_18_0(v31, (uint64_t)qword_26A5DD5A0);
    OUTLINED_FUNCTION_4_3();
    v43();
    swift_bridgeObjectRetain_n();
    uint64_t v44 = sub_25C8EC0D0();
    os_log_type_t v45 = sub_25C8EC2C0();
    uint64_t v57 = v44;
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = (uint8_t *)OUTLINED_FUNCTION_8_0();
      uint64_t v55 = OUTLINED_FUNCTION_10_1();
      uint64_t v58 = v55;
      OUTLINED_FUNCTION_37(4.8149e-34);
      uint64_t v54 = v47;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_25C8BB4F0(v27, v28, &v58);
      OUTLINED_FUNCTION_24(v48);
      sub_25C8EC360();
      swift_bridgeObjectRelease_n();
      uint64_t v49 = v57;
      _os_log_impl(&dword_25C89B000, v57, v45, "Found new recognized user with homeUserID=%s", v46, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v4 + 8))(v12, v2);
    uint64_t v52 = OUTLINED_FUNCTION_14();
    v53(v52);
  }
LABEL_15:
  OUTLINED_FUNCTION_21_0();
}

void sub_25C8AA974()
{
  OUTLINED_FUNCTION_29();
  sub_25C8EC0F0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v2 = MEMORY[0x270FA5388](v1);
  MEMORY[0x270FA5388](v2);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9A60);
  uint64_t v4 = OUTLINED_FUNCTION_19(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_16_0();
  uint64_t v5 = sub_25C8EB5D0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C8A9874(v0);
  if (__swift_getEnumTagSinglePayload(v0, 1, v5) == 1)
  {
    uint64_t v11 = sub_25C89F4B0(v0, &qword_26A5D9A60);
LABEL_9:
    if (qword_26A5D95A8 != -1) {
      uint64_t v11 = swift_once();
    }
    OUTLINED_FUNCTION_7_0(v11, (uint64_t)qword_26A5DD5A0);
    OUTLINED_FUNCTION_4_3();
    v26();
    uint64_t v27 = (void *)sub_25C8EC0D0();
    os_log_type_t v28 = sub_25C8EC2E0();
    if (OUTLINED_FUNCTION_13_0(v28))
    {
      *(_WORD *)OUTLINED_FUNCTION_5_0() = 0;
      OUTLINED_FUNCTION_12(&dword_25C89B000, v29, v30, "No iCloudAltDSID found.");
      OUTLINED_FUNCTION_3();
    }

    OUTLINED_FUNCTION_9_1();
    v31();
    goto LABEL_16;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 32))(v10, v0, v5);
  uint64_t v12 = sub_25C8EB540();
  if (!v13)
  {
    uint64_t v24 = OUTLINED_FUNCTION_39();
    uint64_t v11 = v25(v24);
    goto LABEL_9;
  }
  if (qword_26A5D95A8 != -1) {
    uint64_t v12 = swift_once();
  }
  OUTLINED_FUNCTION_7_0(v12, (uint64_t)qword_26A5DD5A0);
  OUTLINED_FUNCTION_4_3();
  v14();
  swift_bridgeObjectRetain_n();
  uint64_t v15 = sub_25C8EC0D0();
  os_log_type_t v16 = sub_25C8EC2C0();
  int v17 = v16;
  uint64_t v38 = v15;
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v18 = (uint8_t *)OUTLINED_FUNCTION_8_0();
    uint64_t v37 = OUTLINED_FUNCTION_10_1();
    uint64_t v39 = v37;
    int v36 = v17;
    *(_DWORD *)uint64_t v18 = 136315138;
    v35[1] = v18 + 4;
    v35[2] = v18;
    swift_bridgeObjectRetain();
    uint64_t v19 = OUTLINED_FUNCTION_30();
    uint64_t v22 = sub_25C8BB4F0(v19, v20, v21);
    OUTLINED_FUNCTION_33(v22);
    sub_25C8EC360();
    swift_bridgeObjectRelease_n();
    uint64_t v23 = v38;
    _os_log_impl(&dword_25C89B000, v38, (os_log_type_t)v36, "Found new recognized user with iCloudAltDSID=%s", v18, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  OUTLINED_FUNCTION_9_1();
  v32();
  uint64_t v33 = OUTLINED_FUNCTION_39();
  v34(v33);
LABEL_16:
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_21_0();
}

uint64_t sub_25C8AAD2C()
{
  swift_unknownObjectRelease();
  sub_25C89F4B0(v0 + OBJC_IVAR____TtC20SiriIdentityInternal25SwitchProfileFlowStrategy_identifiedUserOverride, &qword_26A5D9A60);

  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC20SiriIdentityInternal25SwitchProfileFlowStrategy_deviceState);
  swift_release();
  return v0;
}

uint64_t sub_25C8AAD94()
{
  sub_25C8AAD2C();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_25C8AADEC()
{
  return type metadata accessor for SwitchProfileFlowStrategy();
}

uint64_t type metadata accessor for SwitchProfileFlowStrategy()
{
  uint64_t result = qword_26A5D9C18;
  if (!qword_26A5D9C18) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25C8AAE3C()
{
  sub_25C8AAEF8();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_25C8AAEF8()
{
  if (!qword_26A5D9C38[0])
  {
    sub_25C8EB5D0();
    unint64_t v0 = sub_25C8EC350();
    if (!v1) {
      atomic_store(v0, qword_26A5D9C38);
    }
  }
}

uint64_t sub_25C8AAF50()
{
  return sub_25C8A8B88();
}

uint64_t sub_25C8AAF68()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C8AB010;
  return sub_25C8A8CBC();
}

uint64_t sub_25C8AB010()
{
  OUTLINED_FUNCTION_6_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_2_1();
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v5 = v4;
  uint64_t v6 = swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(uint64_t))(v4 + 8);
  if (!v0) {
    uint64_t v6 = v3;
  }
  return v7(v6);
}

uint64_t sub_25C8AB0E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for SwitchProfileFlowStrategy();
  return MEMORY[0x270F67C20](a1, v5, a3);
}

uint64_t sub_25C8AB130(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_25C8AC380;
  return MEMORY[0x270F67C18](a1, a2, a3, a4);
}

uint64_t sub_25C8AB1F4(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_25C8EB350();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25C8EC0F0();
  uint64_t v37 = *(void *)(v8 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v35 - v12;
  uint64_t v14 = *(void **)(v2 + OBJC_IVAR____TtC20SiriIdentityInternal25SwitchProfileFlowStrategy_remoteDevice);
  if (v14)
  {
    uint64_t v36 = v8;
    uint64_t v15 = qword_26A5D95A8;
    id v16 = v14;
    if (v15 != -1) {
      swift_once();
    }
    uint64_t v17 = v36;
    uint64_t v18 = __swift_project_value_buffer(v36, (uint64_t)qword_26A5DD5A0);
    (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v13, v18, v17);
    uint64_t v19 = v16;
    unint64_t v20 = sub_25C8EC0D0();
    os_log_type_t v21 = sub_25C8EC2D0();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      os_log_type_t v35 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 138412290;
      uint64_t v38 = v19;
      uint64_t v23 = v19;
      sub_25C8EC360();
      uint64_t v24 = v35;
      void *v35 = v14;

      uint64_t v17 = v36;
      _os_log_impl(&dword_25C89B000, v20, v21, "makeIntentExecutionBehavior: handle on targetDevice: %@", v22, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9F40);
      swift_arrayDestroy();
      MEMORY[0x261198330](v24, -1, -1);
      MEMORY[0x261198330](v22, -1, -1);
    }
    else
    {

      unint64_t v20 = v19;
    }

    (*(void (**)(char *, uint64_t))(v37 + 8))(v13, v17);
    sub_25C8EB3D0();
    uint64_t v33 = sub_25C8EB3B0();
  }
  else
  {
    if (qword_26A5D95A8 != -1) {
      swift_once();
    }
    uint64_t v25 = __swift_project_value_buffer(v8, (uint64_t)qword_26A5DD5A0);
    (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v11, v25, v8);
    uint64_t v26 = sub_25C8EC0D0();
    os_log_type_t v27 = sub_25C8EC2D0();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = v8;
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v29 = 0;
      _os_log_impl(&dword_25C89B000, v26, v27, "IntentExecutionBehaviorStrategy.makeIntentExecutionBehavior", v29, 2u);
      uint64_t v30 = v29;
      uint64_t v8 = v28;
      MEMORY[0x261198330](v30, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v37 + 8))(v11, v8);
    sub_25C8EB3D0();
    id v31 = objc_allocWithZone((Class)type metadata accessor for SwitchProfileIntentHandler());
    swift_retain();
    objc_msgSend(v31, sel_init);
    type metadata accessor for SwitchProfileIntent();
    id v32 = a2;
    sub_25C8EB340();
    uint64_t v33 = sub_25C8EB3C0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return v33;
}

void sub_25C8AB6A4()
{
  OUTLINED_FUNCTION_29();
  uint64_t v3 = v2;
  sub_25C8EB350();
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_16_0();
  uint64_t v5 = sub_25C8EC0F0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v29 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v27 - v9;
  uint64_t v11 = *(void **)(v0 + 104);
  if (v11)
  {
    uint64_t v12 = qword_26A5D95A8;
    id v13 = v11;
    if (v12 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v5, (uint64_t)qword_26A5DD5A0);
    OUTLINED_FUNCTION_5_2();
    v14();
    uint64_t v15 = v13;
    id v16 = sub_25C8EC0D0();
    os_log_type_t v17 = sub_25C8EC2D0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)OUTLINED_FUNCTION_8_0();
      os_log_type_t v27 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 138412290;
      uint64_t v28 = v5;
      uint64_t v30 = v15;
      uint64_t v19 = v15;
      uint64_t v5 = v28;
      sub_25C8EC360();
      *os_log_type_t v27 = v11;

      _os_log_impl(&dword_25C89B000, v16, v17, "makeIntentExecutionBehavior: handle on targetDevice: %@", v18, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9F40);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();
    }
    else
    {

      id v16 = v15;
    }

    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v5);
    sub_25C8EB3D0();
    sub_25C8EB3B0();
  }
  else
  {
    if (qword_26A5D95A8 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v5, (uint64_t)qword_26A5DD5A0);
    OUTLINED_FUNCTION_5_2();
    v20();
    os_log_type_t v21 = sub_25C8EC0D0();
    os_log_type_t v22 = sub_25C8EC2D0();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)OUTLINED_FUNCTION_5_0();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_25C89B000, v21, v22, "IntentExecutionBehaviorStrategy.makeIntentExecutionBehavior", v23, 2u);
      OUTLINED_FUNCTION_3();
    }

    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v1, v5);
    sub_25C8EB3D0();
    id v24 = objc_allocWithZone((Class)type metadata accessor for SwitchProfileIntentHandler());
    swift_retain();
    objc_msgSend(v24, sel_init);
    type metadata accessor for SwitchProfileIntent();
    id v25 = v3;
    sub_25C8EB340();
    sub_25C8EB3C0();
    OUTLINED_FUNCTION_9_1();
    v26();
  }
  OUTLINED_FUNCTION_21_0();
}

uint64_t sub_25C8ABA8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  uint64_t v11 = type metadata accessor for SwitchProfileFlowStrategy();
  *uint64_t v10 = v5;
  v10[1] = sub_25C8AC380;
  return MEMORY[0x270F66498](a1, a2, a3, v11, a5);
}

uint64_t sub_25C8ABB5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  uint64_t v11 = type metadata accessor for SwitchProfileFlowStrategy();
  *uint64_t v10 = v5;
  v10[1] = sub_25C8AC380;
  return MEMORY[0x270F66490](a1, a2, a3, v11, a5);
}

uint64_t sub_25C8ABC2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  uint64_t v11 = type metadata accessor for SwitchProfileFlowStrategy();
  *uint64_t v10 = v5;
  v10[1] = sub_25C8AC380;
  return MEMORY[0x270F66488](a1, a2, a3, v11, a5);
}

uint64_t sub_25C8ABCFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v12;
  uint64_t v13 = type metadata accessor for SwitchProfileFlowStrategy();
  *uint64_t v12 = v6;
  v12[1] = sub_25C8ABDDC;
  return MEMORY[0x270F66480](a1, a2, a3, a4, v13, a6);
}

uint64_t sub_25C8ABDDC()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_25C8ABEA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v12;
  uint64_t v13 = type metadata accessor for SwitchProfileFlowStrategy();
  *uint64_t v12 = v6;
  v12[1] = sub_25C8AC380;
  return MEMORY[0x270F66790](a1, a2, a3, a4, v13, a6);
}

uint64_t sub_25C8ABF80(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_25C8AB1F4(a1, a2);
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v2 + 8);
  return sub_25C8A41D8(v4, v2, v3);
}

uint64_t sub_25C8AC004()
{
  return sub_25C8AC26C(&qword_26A5D9C50, (void (*)(uint64_t))type metadata accessor for SwitchProfileFlowStrategy);
}

uint64_t sub_25C8AC04C()
{
  return sub_25C8AC26C(qword_26A5D9C58, (void (*)(uint64_t))type metadata accessor for SwitchProfileFlowStrategy);
}

uint64_t sub_25C8AC094()
{
  return sub_25C8AC26C(qword_26A5D9C80, (void (*)(uint64_t))type metadata accessor for SwitchProfileFlowStrategy);
}

uint64_t sub_25C8AC0DC(uint64_t (*a1)(void))
{
  return a1();
}

void sub_25C8AC104(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_25C8EC360();
  *a1 = v7;
  uint64_t v8 = *a2;
  if (*a2)
  {
    *uint64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

void sub_25C8AC1BC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_25C8EC160();
  objc_msgSend(a3, sel_setHomeUserId_, v4);
}

void sub_25C8AC214(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_25C8EC160();
  objc_msgSend(a3, sel_setICloudAltDSID_, v4);
}

uint64_t sub_25C8AC26C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25C8AC2B4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25C8AC318(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9A60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_7_0(uint64_t a1, uint64_t a2)
{
  return __swift_project_value_buffer(v2, a2);
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  return swift_task_alloc();
}

void OUTLINED_FUNCTION_12(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

BOOL OUTLINED_FUNCTION_13_0(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_14()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return sub_25C8EB5D0();
}

uint64_t OUTLINED_FUNCTION_18_0(uint64_t a1, uint64_t a2)
{
  return __swift_project_value_buffer(v2, a2);
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return v0;
}

BOOL OUTLINED_FUNCTION_23(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_24(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_28()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_30()
{
  return v0;
}

void OUTLINED_FUNCTION_31(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_33(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

void OUTLINED_FUNCTION_36(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

void OUTLINED_FUNCTION_37(float a1)
{
  *uint64_t v1 = a1;
}

uint64_t OUTLINED_FUNCTION_39()
{
  return v0;
}

void sub_25C8AC654(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X7>, uint64_t *a8@<X8>, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v18 = a12;
  uint64_t v19 = a10;
  if (a2)
  {
    OUTLINED_FUNCTION_1_5();
    uint64_t v36 = MEMORY[0x263F8EE88];
    uint64_t v22 = v21;
    swift_bridgeObjectRetain();
    sub_25C8ACF08(&v35, a1, v22);
    swift_bridgeObjectRelease();
    uint64_t v23 = a4;
    if (a4)
    {
LABEL_3:
      swift_bridgeObjectRetain();
      sub_25C8ACF08(&v35, a3, v23);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v23 = a4;
    if (!a4 && !a6 && !a12 && !a7 && !a10)
    {
      uint64_t v28 = 0;
      uint64_t v32 = 0;
      uint64_t v33 = 0;
      uint64_t v23 = 0;
      uint64_t v12 = 0;
      uint64_t v27 = 0;
      uint64_t v13 = 0;
      uint64_t v24 = 0;
      uint64_t v18 = 0;
      uint64_t v26 = 0;
      uint64_t v25 = 0;
      goto LABEL_19;
    }
    OUTLINED_FUNCTION_1_5();
    uint64_t v36 = MEMORY[0x263F8EE88];
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v32 = a3;
  uint64_t v24 = a11;
  if (v12)
  {
    swift_bridgeObjectRetain();
    sub_25C8ACF08(&v35, a5, v12);
    swift_bridgeObjectRelease();
  }
  uint64_t v33 = a5;
  uint64_t v25 = v29;
  if (a12)
  {
    swift_bridgeObjectRetain();
    sub_25C8ACF08(&v35, a11, a12);
    swift_bridgeObjectRelease();
  }
  uint64_t v26 = a9;
  if (v13)
  {
    swift_bridgeObjectRetain();
    sub_25C8ACF08(&v35, v34, v13);
    swift_bridgeObjectRelease();
  }
  if (v29)
  {
    swift_bridgeObjectRetain();
    sub_25C8ACF08(&v35, a9, v29);
    swift_bridgeObjectRelease();
  }
  uint64_t v19 = v36;
  uint64_t v27 = v34;
  uint64_t v28 = a1;
LABEL_19:
  *a8 = v28;
  a8[1] = a2;
  a8[2] = v32;
  a8[3] = v23;
  a8[4] = v33;
  a8[5] = v12;
  a8[6] = v27;
  a8[7] = v13;
  a8[8] = v24;
  a8[9] = v18;
  a8[10] = v26;
  a8[11] = v25;
  a8[12] = v19;
}

uint64_t sub_25C8AC864()
{
  v8[0] = 0;
  v8[1] = 0xE000000000000000;
  sub_25C8EC3D0();
  uint64_t v3 = 0;
  unint64_t v4 = 0xE000000000000000;
  sub_25C8EC1C0();
  sub_25C89FB04(v0, (uint64_t)v8);
  sub_25C89FB04((uint64_t)v8, (uint64_t)v7);
  sub_25C8A07AC((uint64_t)v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9A68);
  sub_25C8EC180();
  sub_25C8EC1C0();
  swift_bridgeObjectRelease();
  sub_25C8EC1C0();
  sub_25C89FB04(v0 + 64, (uint64_t)v7);
  sub_25C89FB04((uint64_t)v7, (uint64_t)v6);
  sub_25C8A07AC((uint64_t)v7);
  sub_25C8EC180();
  sub_25C8EC1C0();
  swift_bridgeObjectRelease();
  sub_25C8EC1C0();
  sub_25C89FB04(v0 + 48, (uint64_t)v6);
  sub_25C89FB04((uint64_t)v6, (uint64_t)v5);
  sub_25C8A07AC((uint64_t)v6);
  sub_25C8EC180();
  sub_25C8EC1C0();
  swift_bridgeObjectRelease();
  sub_25C8EC1C0();
  sub_25C89FB04(v0 + 80, (uint64_t)v5);
  sub_25C89FB04((uint64_t)v5, (uint64_t)&v2);
  sub_25C8A07AC((uint64_t)v5);
  sub_25C8EC180();
  sub_25C8EC1C0();
  swift_bridgeObjectRelease();
  sub_25C8EC1C0();
  return v3;
}

uint64_t sub_25C8ACA6C(void *a1, void *a2)
{
  uint64_t v4 = a1[1];
  uint64_t v5 = a2[1];
  if (v4)
  {
    if (!v5) {
      return 0;
    }
    BOOL v6 = *a1 == *a2 && v4 == v5;
    if (!v6 && (sub_25C8EC550() & 1) == 0) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  uint64_t v7 = a1[3];
  uint64_t v8 = a2[3];
  if (v7)
  {
    if (!v8) {
      return 0;
    }
    BOOL v9 = a1[2] == a2[2] && v7 == v8;
    if (!v9 && (sub_25C8EC550() & 1) == 0) {
      return 0;
    }
  }
  else if (v8)
  {
    return 0;
  }
  uint64_t v10 = a1[5];
  uint64_t v11 = a2[5];
  if (v10)
  {
    if (!v11) {
      return 0;
    }
    BOOL v12 = a1[4] == a2[4] && v10 == v11;
    if (!v12 && (sub_25C8EC550() & 1) == 0) {
      return 0;
    }
  }
  else if (v11)
  {
    return 0;
  }
  uint64_t v13 = a1[7];
  uint64_t v14 = a2[7];
  if (v13)
  {
    if (!v14) {
      return 0;
    }
    BOOL v15 = a1[6] == a2[6] && v13 == v14;
    if (!v15 && (sub_25C8EC550() & 1) == 0) {
      return 0;
    }
  }
  else if (v14)
  {
    return 0;
  }
  uint64_t v16 = a1[9];
  uint64_t v17 = a2[9];
  if (v16)
  {
    if (!v17) {
      return 0;
    }
    BOOL v18 = a1[8] == a2[8] && v16 == v17;
    if (!v18 && (sub_25C8EC550() & 1) == 0) {
      return 0;
    }
  }
  else if (v17)
  {
    return 0;
  }
  uint64_t v19 = a1[11];
  uint64_t v20 = a2[11];
  if (v19)
  {
    if (v20)
    {
      BOOL v21 = a1[10] == a2[10] && v19 == v20;
      if (v21 || (sub_25C8EC550() & 1) != 0) {
        goto LABEL_53;
      }
    }
    return 0;
  }
  if (v20) {
    return 0;
  }
LABEL_53:
  uint64_t v22 = a1[12];
  uint64_t v23 = a2[12];
  return sub_25C8ACC44(v22, v23);
}

uint64_t sub_25C8ACC08()
{
  memcpy(__dst, v0, sizeof(__dst));
  return sub_25C8AC864();
}

uint64_t sub_25C8ACC44(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v3 = 0;
  uint64_t v4 = *(void *)(result + 56);
  uint64_t v30 = result + 56;
  uint64_t v5 = 1 << *(unsigned char *)(result + 32);
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & v4;
  int64_t v31 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v8 = a2 + 56;
  if ((v6 & v4) == 0) {
    goto LABEL_8;
  }
LABEL_7:
  unint64_t v9 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  int64_t v32 = v3;
  for (unint64_t i = v9 | (v3 << 6); ; unint64_t i = __clz(__rbit64(v12)) + (v13 << 6))
  {
    uint64_t v15 = result;
    uint64_t v16 = (uint64_t *)(*(void *)(result + 48) + 16 * i);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    sub_25C8EC5F0();
    swift_bridgeObjectRetain();
    sub_25C8EC1B0();
    uint64_t v19 = sub_25C8EC610();
    uint64_t v20 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v21 = v19 & ~v20;
    if (((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0) {
      goto LABEL_41;
    }
    uint64_t v22 = *(void *)(a2 + 48);
    uint64_t v23 = (void *)(v22 + 16 * v21);
    BOOL v24 = *v23 == v18 && v23[1] == v17;
    if (!v24 && (sub_25C8EC550() & 1) == 0)
    {
      uint64_t v25 = ~v20;
      for (unint64_t j = v21 + 1; ; unint64_t j = v27 + 1)
      {
        uint64_t v27 = j & v25;
        if (((*(void *)(v8 + (((j & v25) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (j & v25)) & 1) == 0) {
          break;
        }
        uint64_t v28 = (void *)(v22 + 16 * v27);
        BOOL v29 = *v28 == v18 && v28[1] == v17;
        if (v29 || (sub_25C8EC550() & 1) != 0) {
          goto LABEL_30;
        }
      }
LABEL_41:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_30:
    swift_bridgeObjectRelease();
    uint64_t result = v15;
    int64_t v3 = v32;
    if (v7) {
      goto LABEL_7;
    }
LABEL_8:
    int64_t v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_44;
    }
    if (v11 >= v31) {
      return 1;
    }
    unint64_t v12 = *(void *)(v30 + 8 * v11);
    int64_t v13 = v3 + 1;
    if (!v12)
    {
      int64_t v13 = v3 + 2;
      if (v3 + 2 >= v31) {
        return 1;
      }
      unint64_t v12 = *(void *)(v30 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v3 + 3;
        if (v3 + 3 >= v31) {
          return 1;
        }
        unint64_t v12 = *(void *)(v30 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v3 + 4;
          if (v3 + 4 >= v31) {
            return 1;
          }
          unint64_t v12 = *(void *)(v30 + 8 * v13);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v7 = (v12 - 1) & v12;
    int64_t v32 = v13;
  }
  uint64_t v14 = v3 + 5;
  if (v3 + 5 >= v31) {
    return 1;
  }
  unint64_t v12 = *(void *)(v30 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v3 + 5;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v31) {
      return 1;
    }
    unint64_t v12 = *(void *)(v30 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_23;
    }
  }
LABEL_44:
  __break(1u);
  return result;
}

uint64_t sub_25C8ACEEC(uint64_t result, uint64_t a2, void *a3)
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

uint64_t sub_25C8ACF08(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_25C8EC5F0();
  swift_bridgeObjectRetain();
  sub_25C8EC1B0();
  uint64_t v8 = sub_25C8EC610();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  OUTLINED_FUNCTION_0_5();
  if (v11)
  {
    uint64_t v12 = *(void *)(v7 + 48);
    int64_t v13 = (void *)(v12 + 16 * v10);
    BOOL v14 = *v13 == a2 && v13[1] == a3;
    if (v14 || (sub_25C8EC550() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v15 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v16 = v15[1];
      *a1 = *v15;
      a1[1] = v16;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v18 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v18;
      OUTLINED_FUNCTION_0_5();
      if ((v19 & 1) == 0) {
        break;
      }
      uint64_t v20 = (void *)(v12 + 16 * v10);
      BOOL v21 = *v20 == a2 && v20[1] == a3;
      if (v21 || (sub_25C8EC550() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v23 = *v3;
  *int64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_25C8AD37C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *int64_t v3 = v23;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_25C8AD0A0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9CA8);
  uint64_t v3 = sub_25C8EC3C0();
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
      uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
      uint64_t v18 = *v17;
      uint64_t v19 = v17[1];
      sub_25C8EC5F0();
      sub_25C8EC1B0();
      uint64_t result = sub_25C8EC610();
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
      *uint64_t v28 = v18;
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
                sub_25C8ACEEC(0, (unint64_t)(v29 + 63) >> 6, v30);
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
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_25C8AD37C(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_25C8AD0A0();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_25C8AD518();
      goto LABEL_22;
    }
    sub_25C8AD6CC();
  }
  uint64_t v11 = *v4;
  sub_25C8EC5F0();
  sub_25C8EC1B0();
  uint64_t result = sub_25C8EC610();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_25C8EC550(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_25C8EC590();
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
          uint64_t result = sub_25C8EC550();
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

void *sub_25C8AD518()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9CA8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25C8EC3B0();
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

uint64_t sub_25C8AD6CC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9CA8);
  uint64_t v3 = sub_25C8EC3C0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
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
    sub_25C8EC5F0();
    swift_bridgeObjectRetain();
    sub_25C8EC1B0();
    uint64_t result = sub_25C8EC610();
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
    *uint64_t v28 = v18;
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

uint64_t destroy for UserNames()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for UserNames(void *a1, void *a2)
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
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  uint64_t v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  uint64_t v8 = a2[11];
  a1[10] = a2[10];
  a1[11] = v8;
  a1[12] = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for UserNames(void *a1, void *a2)
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
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[12] = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy104_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x68uLL);
}

uint64_t assignWithTake for UserNames(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UserNames(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 104))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 96);
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

uint64_t storeEnumTagSinglePayload for UserNames(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 96) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 104) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UserNames()
{
  return &type metadata for UserNames;
}

uint64_t destroy for UserAccountManager(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UserAccountManager(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  uint64_t v7 = *(void *)(a2 + 56);
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = v7;
  *(void *)(a1 + 64) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for UserAccountManager(uint64_t *a1, uint64_t *a2)
{
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
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
        *uint64_t v3 = v12;
      }
      else
      {
        int64_t v11 = *(uint64_t (**)(void))(v10 + 24);
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
          *uint64_t v3 = *a2;
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

void *__swift_memcpy72_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x48uLL);
}

uint64_t assignWithTake for UserAccountManager(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UserAccountManager(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 72))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
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

uint64_t storeEnumTagSinglePayload for UserAccountManager(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
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
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UserAccountManager()
{
  return &type metadata for UserAccountManager;
}

uint64_t sub_25C8AE1BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = type metadata accessor for UserAccount();
  uint64_t v7 = OUTLINED_FUNCTION_19(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_4_0();
  sub_25C8B19F4(a1, v9 - v8, (void (*)(void))type metadata accessor for UserAccount);
  sub_25C8A7E98(a2, (uint64_t)v17);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v17, v18);
  OUTLINED_FUNCTION_1_4();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_4_0();
  (*(void (**)(uint64_t))(v13 + 16))(v12 - v11);
  sub_25C8B061C();
  uint64_t v15 = v14;
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  *a3 = v15;
  return result;
}

unint64_t sub_25C8AE2F4()
{
  sub_25C8EC3D0();
  swift_bridgeObjectRelease();
  uint64_t v0 = type metadata accessor for UserAccount();
  uint64_t v1 = swift_bridgeObjectRetain();
  MEMORY[0x261197960](v1, v0);
  sub_25C8EC1C0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25C8EC1C0();
  return 0xD000000000000014;
}

void sub_25C8AE3AC()
{
  OUTLINED_FUNCTION_29();
  uint64_t v170 = v0;
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  v195 = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9C98);
  uint64_t v7 = OUTLINED_FUNCTION_19(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_4_0();
  uint64_t v203 = v9 - v8;
  uint64_t v10 = type metadata accessor for UserAccount();
  OUTLINED_FUNCTION_1_4();
  MEMORY[0x270FA5388](v11);
  uint64_t v202 = (uint64_t)v169 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_5_3();
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  int64_t v16 = (char *)v169 - v15;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_6_2();
  uint64_t v194 = v17;
  OUTLINED_FUNCTION_5_3();
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_6_2();
  uint64_t v196 = v19;
  OUTLINED_FUNCTION_5_3();
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  unint64_t v23 = (char *)v169 - v22;
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_6_2();
  uint64_t v204 = v24;
  OUTLINED_FUNCTION_5_3();
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_6_2();
  uint64_t v182 = v26;
  OUTLINED_FUNCTION_5_3();
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_6_2();
  uint64_t v181 = v28;
  OUTLINED_FUNCTION_5_3();
  uint64_t v30 = MEMORY[0x270FA5388](v29);
  MEMORY[0x270FA5388](v30);
  OUTLINED_FUNCTION_6_2();
  uint64_t v173 = v31;
  OUTLINED_FUNCTION_5_3();
  uint64_t v33 = MEMORY[0x270FA5388](v32);
  uint64_t v36 = (char *)v169 - v35;
  uint64_t v37 = *(void *)(v4 + 16);
  uint64_t v205 = v33;
  v200 = v16;
  v169[2] = v38;
  v197 = v23;
  if (v37)
  {
    uint64_t v172 = v34;
    uint64_t v193 = v2;
    OUTLINED_FUNCTION_16_1();
    v169[1] = v4;
    uint64_t v199 = v39;
    uint64_t v40 = v4 + v39;
    uint64_t v41 = MEMORY[0x263F8EE78];
    uint64_t v198 = *(void *)(v42 + 72);
    uint64_t v43 = v203;
    v171 = v36;
    while (1)
    {
      sub_25C8B19F4(v40, (uint64_t)v36, (void (*)(void))type metadata accessor for UserAccount);
      sub_25C8B08F4((uint64_t)v36, v43);
      uint64_t v44 = sub_25C8EB000();
      if (__swift_getEnumTagSinglePayload(v43, 1, v44) == 1)
      {
        sub_25C8B1A54(v43, &qword_26A5D9C98);
      }
      else
      {
        uint64_t v45 = sub_25C8EAFE0();
        uint64_t v47 = v46;
        OUTLINED_FUNCTION_14_0();
        v48();
        uint64_t v49 = v193;
        if (*(void *)(v193 + 16))
        {
          unint64_t v50 = sub_25C8E72CC(v45, v47);
          if (v51)
          {
            uint64_t v52 = (uint64_t *)(*(void *)(v49 + 56) + 104 * v50);
            uint64_t v53 = v52[1];
            uint64_t v191 = *v52;
            uint64_t v192 = v53;
            uint64_t v54 = v52[3];
            uint64_t v55 = v52[5];
            uint64_t v56 = v52[7];
            uint64_t v190 = v52[8];
            uint64_t v57 = v52[9];
            uint64_t v58 = v52[12];
            uint64_t v176 = v52[11];
            swift_bridgeObjectRetain();
            uint64_t v175 = v58;
            swift_bridgeObjectRetain();
            uint64_t v59 = v192;
            swift_bridgeObjectRetain();
            uint64_t v180 = v54;
            swift_bridgeObjectRetain();
            uint64_t v179 = v55;
            swift_bridgeObjectRetain();
            uint64_t v178 = v56;
            swift_bridgeObjectRetain();
            uint64_t v177 = v57;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            uint64_t v36 = v171;
            uint64_t v60 = v173;
            sub_25C8B19F4((uint64_t)v171, v173, (void (*)(void))type metadata accessor for UserAccount);
            uint64_t v201 = v41;
            if (v59)
            {
              uint64_t v186 = v59;
              uint64_t v61 = v205;
            }
            else
            {
              uint64_t v61 = v205;
              uint64_t v66 = (uint64_t *)(v60 + *(int *)(v205 + 28));
              uint64_t v67 = v66[1];
              uint64_t v191 = *v66;
              uint64_t v186 = v67;
              swift_bridgeObjectRetain();
            }
            swift_bridgeObjectRetain();
            v174 = type metadata accessor for UserAccount;
            sub_25C8B1448(v60, (void (*)(void))type metadata accessor for UserAccount);
            uint64_t v68 = &v36[*(int *)(v61 + 28)];
            uint64_t v69 = *((void *)v68 + 2);
            uint64_t v70 = *((void *)v68 + 3);
            uint64_t v71 = *((void *)v68 + 5);
            uint64_t v188 = *((void *)v68 + 4);
            uint64_t v189 = v69;
            uint64_t v72 = *((void *)v68 + 7);
            uint64_t v187 = *((void *)v68 + 6);
            uint64_t v74 = *((void *)v68 + 10);
            uint64_t v73 = *((void *)v68 + 11);
            swift_bridgeObjectRetain();
            uint64_t v75 = v177;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            sub_25C8AC654(v191, v186, v189, v70, v188, v71, v72, v208, v74, v73, v190, v75);
            uint64_t v76 = v208[0];
            uint64_t v186 = v208[3];
            uint64_t v187 = v208[1];
            uint64_t v184 = v208[4];
            uint64_t v185 = v208[2];
            uint64_t v190 = v208[6];
            uint64_t v191 = v208[5];
            uint64_t v188 = v208[8];
            uint64_t v189 = v208[7];
            uint64_t v77 = v208[10];
            uint64_t v183 = v208[9];
            uint64_t v79 = v208[11];
            uint64_t v78 = v208[12];
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v80 = v172;
            sub_25C8B19F4((uint64_t)v36, v172, (void (*)(void))v174);
            sub_25C8B0A6C((uint64_t)v208, (uint64_t)v209, &qword_26A5D9CD0);
            if (v209[12])
            {
              sub_25C8B1448(v80, (void (*)(void))type metadata accessor for UserAccount);
              uint64_t v81 = (int *)v205;
              uint64_t v192 = v76;
              uint64_t v82 = v183;
              uint64_t v179 = v79;
              uint64_t v180 = v77;
              uint64_t v178 = v78;
            }
            else
            {
              uint64_t v83 = (uint64_t *)(v80 + *(int *)(v205 + 28));
              uint64_t v84 = v83[1];
              uint64_t v192 = *v83;
              uint64_t v85 = v83[2];
              uint64_t v86 = v83[3];
              uint64_t v87 = v83[5];
              uint64_t v184 = v83[4];
              uint64_t v185 = v85;
              uint64_t v88 = v83[7];
              uint64_t v190 = v83[6];
              uint64_t v188 = v83[8];
              uint64_t v183 = v83[9];
              uint64_t v89 = v83[10];
              uint64_t v179 = v83[11];
              uint64_t v180 = v89;
              uint64_t v90 = v83[12];
              swift_bridgeObjectRetain();
              uint64_t v178 = v90;
              swift_bridgeObjectRetain();
              uint64_t v187 = v84;
              swift_bridgeObjectRetain();
              uint64_t v186 = v86;
              swift_bridgeObjectRetain();
              uint64_t v191 = v87;
              swift_bridgeObjectRetain();
              uint64_t v189 = v88;
              swift_bridgeObjectRetain();
              uint64_t v82 = v183;
              swift_bridgeObjectRetain();
              sub_25C8B1448(v80, (void (*)(void))type metadata accessor for UserAccount);
              uint64_t v81 = (int *)v205;
            }
            uint64_t v91 = &v36[v81[6]];
            uint64_t v93 = *(void *)v91;
            uint64_t v92 = *((void *)v91 + 1);
            v94 = v81;
            uint64_t v95 = v181;
            sub_25C8B08F4((uint64_t)v36, v181);
            uint64_t v96 = &v36[v94[5]];
            uint64_t v97 = *(void *)v96;
            uint64_t v98 = *((void *)v96 + 1);
            LOBYTE(v96) = v36[v94[8]];
            uint64_t v99 = (void *)(v95 + v94[6]);
            *uint64_t v99 = v93;
            v99[1] = v92;
            uint64_t v100 = (void *)(v95 + v94[5]);
            *uint64_t v100 = v97;
            v100[1] = v98;
            *(unsigned char *)(v95 + v94[8]) = (_BYTE)v96;
            v101 = (uint64_t *)(v95 + v94[7]);
            uint64_t v102 = v187;
            uint64_t *v101 = v192;
            v101[1] = v102;
            uint64_t v103 = v186;
            v101[2] = v185;
            v101[3] = v103;
            uint64_t v104 = v191;
            v101[4] = v184;
            v101[5] = v104;
            uint64_t v105 = v189;
            v101[6] = v190;
            v101[7] = v105;
            v101[8] = v188;
            v101[9] = v82;
            uint64_t v106 = v179;
            v101[10] = v180;
            v101[11] = v106;
            v101[12] = v178;
            sub_25C8B19F4(v95, v182, (void (*)(void))type metadata accessor for UserAccount);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            uint64_t v41 = v201;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v41 = OUTLINED_FUNCTION_13_1();
            }
            int64_t v16 = v200;
            unint64_t v108 = *(void *)(v41 + 16);
            unint64_t v107 = *(void *)(v41 + 24);
            unint64_t v64 = v108 + 1;
            uint64_t v10 = v205;
            if (v108 >= v107 >> 1) {
              uint64_t v41 = OUTLINED_FUNCTION_12_0(v107);
            }
            OUTLINED_FUNCTION_15_1();
            sub_25C8B095C(v182, v109);
            sub_25C8B1448(v181, (void (*)(void))type metadata accessor for UserAccount);
            goto LABEL_15;
          }
        }
        swift_bridgeObjectRelease();
        int64_t v16 = v200;
      }
      sub_25C8B19F4((uint64_t)v36, v204, (void (*)(void))type metadata accessor for UserAccount);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v41 = OUTLINED_FUNCTION_13_1();
      }
      unint64_t v63 = *(void *)(v41 + 16);
      unint64_t v62 = *(void *)(v41 + 24);
      unint64_t v64 = v63 + 1;
      if (v63 >= v62 >> 1) {
        uint64_t v41 = OUTLINED_FUNCTION_12_0(v62);
      }
      OUTLINED_FUNCTION_15_1();
      sub_25C8B095C(v204, v65);
LABEL_15:
      sub_25C8B1448((uint64_t)v36, (void (*)(void))type metadata accessor for UserAccount);
      v40 += v64;
      --v37;
      uint64_t v43 = v203;
      if (!v37)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        unint64_t v23 = v197;
        goto LABEL_27;
      }
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v41 = MEMORY[0x263F8EE78];
LABEL_27:
  v110 = v195;
  v195[5] = v41;
  sub_25C8A7E98(v170, (uint64_t)v110);
  swift_bridgeObjectRetain_n();
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9CB8);
  uint64_t v112 = sub_25C8EC130();
  unint64_t v207 = v112;
  uint64_t v113 = *(void *)(v41 + 16);
  uint64_t v201 = v41;
  uint64_t v114 = v194;
  if (v113)
  {
    uint64_t v193 = v111;
    OUTLINED_FUNCTION_16_1();
    uint64_t v198 = v115;
    uint64_t v116 = v41 + v115;
    uint64_t v118 = *(void *)(v117 + 72);
    swift_bridgeObjectRetain();
    uint64_t v119 = v116;
    uint64_t v204 = v113;
    uint64_t v199 = v118;
    while (1)
    {
      sub_25C8B19F4(v119, (uint64_t)v23, (void (*)(void))type metadata accessor for UserAccount);
      if (*(void *)&v23[*(int *)(v10 + 28) + 88]) {
        break;
      }
LABEL_50:
      sub_25C8B1448((uint64_t)v23, (void (*)(void))type metadata accessor for UserAccount);
      v119 += v118;
      if (!--v113)
      {
        swift_bridgeObjectRelease();
        unint64_t v148 = v207;
        swift_bridgeObjectRelease();
        v195[6] = v148;
        swift_bridgeObjectRetain();
        v206[0] = sub_25C8EC130();
        swift_bridgeObjectRetain();
        uint64_t v149 = v204;
        uint64_t v150 = v204;
        int64_t v16 = v200;
        do
        {
          sub_25C8B19F4(v116, v114, (void (*)(void))type metadata accessor for UserAccount);
          sub_25C8AF364(v206, v114);
          sub_25C8B1448(v114, (void (*)(void))type metadata accessor for UserAccount);
          v116 += v118;
          --v150;
        }
        while (v150);
        swift_bridgeObjectRelease_n();
        v110 = v195;
        goto LABEL_55;
      }
    }
    uint64_t v120 = sub_25C8EC190();
    uint64_t v122 = v120;
    unint64_t v123 = v121;
    unint64_t v124 = v207;
    if (*(void *)(v207 + 16))
    {
      sub_25C8E72CC(v120, v121);
      if (v125)
      {
LABEL_42:
        v140 = sub_25C8AF29C(v206, v122, v123);
        if (*v139)
        {
          v141 = v139;
          sub_25C8B19F4((uint64_t)v23, v196, (void (*)(void))type metadata accessor for UserAccount);
          uint64_t v142 = *v141;
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t *v141 = v142;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            uint64_t v142 = sub_25C8E2954(0, *(void *)(v142 + 16) + 1, 1, v142);
            uint64_t *v141 = v142;
          }
          unint64_t v145 = *(void *)(v142 + 16);
          unint64_t v144 = *(void *)(v142 + 24);
          if (v145 >= v144 >> 1)
          {
            uint64_t v142 = sub_25C8E2954(v144 > 1, v145 + 1, 1, v142);
            uint64_t *v141 = v142;
          }
          *(void *)(v142 + 16) = v145 + 1;
          uint64_t v118 = v199;
          sub_25C8B095C(v196, v142 + v198 + v145 * v199);
          uint64_t v146 = OUTLINED_FUNCTION_9_2();
          v140((void **)v146);
          uint64_t v41 = v201;
          uint64_t v114 = v194;
          unint64_t v23 = v197;
        }
        else
        {
          uint64_t v147 = OUTLINED_FUNCTION_9_2();
          v140((void **)v147);
          uint64_t v114 = v194;
          uint64_t v118 = v199;
        }
        swift_bridgeObjectRelease();
        uint64_t v10 = v205;
        goto LABEL_50;
      }
      unint64_t v124 = v207;
    }
    swift_bridgeObjectRetain();
    swift_isUniquelyReferenced_nonNull_native();
    v206[0] = v124;
    unint64_t v207 = 0x8000000000000000;
    uint64_t v203 = v122;
    uint64_t v126 = v122;
    uint64_t v127 = v123;
    unint64_t v128 = sub_25C8E72CC(v126, v123);
    if (__OFADD__(*(void *)(v124 + 16), (v129 & 1) == 0))
    {
LABEL_71:
      __break(1u);
LABEL_72:
      __break(1u);
LABEL_73:
      __break(1u);
      swift_bridgeObjectRelease();
      sub_25C8B1448(v123, (void (*)(void))type metadata accessor for UserAccount);
      swift_bridgeObjectRelease();
      __break(1u);
LABEL_74:
      sub_25C8EC5A0();
      __break(1u);
      return;
    }
    unint64_t v123 = v128;
    char v130 = v129;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9CC8);
    if (sub_25C8EC470())
    {
      unint64_t v131 = sub_25C8E72CC(v203, v127);
      if ((v130 & 1) != (v132 & 1)) {
        goto LABEL_74;
      }
      unint64_t v123 = v131;
    }
    v133 = (void *)v206[0];
    if (v130)
    {
      uint64_t v134 = *(void *)(v206[0] + 56);
      swift_bridgeObjectRelease();
      *(void *)(v134 + 8 * v123) = MEMORY[0x263F8EE78];
    }
    else
    {
      *(void *)(v206[0] + 8 * (v123 >> 6) + 64) |= 1 << v123;
      v135 = (void *)(v133[6] + 16 * v123);
      void *v135 = v203;
      v135[1] = v127;
      *(void *)(v133[7] + 8 * v123) = MEMORY[0x263F8EE78];
      uint64_t v136 = v133[2];
      BOOL v137 = __OFADD__(v136, 1);
      uint64_t v138 = v136 + 1;
      if (v137) {
        goto LABEL_73;
      }
      v133[2] = v138;
      swift_bridgeObjectRetain();
    }
    unint64_t v123 = v127;
    unint64_t v207 = (unint64_t)v133;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v41 = v201;
    unint64_t v23 = v197;
    uint64_t v122 = v203;
    goto LABEL_42;
  }
  uint64_t v151 = v112;
  swift_bridgeObjectRelease();
  v110[6] = v151;
  swift_bridgeObjectRetain();
  v206[0] = sub_25C8EC130();
  swift_bridgeObjectRelease();
  uint64_t v149 = 0;
LABEL_55:
  v110[7] = v206[0];
  v152 = (void *)sub_25C8EC130();
  if (v149)
  {
    OUTLINED_FUNCTION_16_1();
    uint64_t v154 = v41 + v153;
    uint64_t v156 = *(void *)(v155 + 72);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_25C8B19F4(v154, (uint64_t)v16, (void (*)(void))type metadata accessor for UserAccount);
      if (*(void *)&v16[*(int *)(v10 + 20) + 8])
      {
        uint64_t v204 = v149;
        uint64_t v157 = sub_25C8EC190();
        unint64_t v123 = v158;
        sub_25C8B19F4((uint64_t)v16, v202, (void (*)(void))type metadata accessor for UserAccount);
        swift_isUniquelyReferenced_nonNull_native();
        v206[0] = v152;
        unint64_t v159 = sub_25C8E72CC(v157, v123);
        if (__OFADD__(v152[2], (v160 & 1) == 0))
        {
          __break(1u);
          goto LABEL_71;
        }
        unint64_t v161 = v159;
        char v162 = v160;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9CC0);
        char v163 = sub_25C8EC470();
        v110 = v195;
        uint64_t v10 = v205;
        if (v163)
        {
          unint64_t v164 = sub_25C8E72CC(v157, v123);
          if ((v162 & 1) != (v165 & 1)) {
            goto LABEL_74;
          }
          unint64_t v161 = v164;
        }
        v152 = (void *)v206[0];
        if (v162)
        {
          sub_25C8B0A08(v202, *(void *)(v206[0] + 56) + v161 * v156);
        }
        else
        {
          *(void *)(v206[0] + 8 * (v161 >> 6) + 64) |= 1 << v161;
          v166 = (uint64_t *)(v152[6] + 16 * v161);
          uint64_t *v166 = v157;
          v166[1] = v123;
          sub_25C8B095C(v202, v152[7] + v161 * v156);
          uint64_t v167 = v152[2];
          BOOL v137 = __OFADD__(v167, 1);
          uint64_t v168 = v167 + 1;
          if (v137) {
            goto LABEL_72;
          }
          v152[2] = v168;
          swift_bridgeObjectRetain();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        int64_t v16 = v200;
        uint64_t v149 = v204;
      }
      sub_25C8B1448((uint64_t)v16, (void (*)(void))type metadata accessor for UserAccount);
      v154 += v156;
      if (!--v149)
      {
        swift_bridgeObjectRelease();
        break;
      }
    }
  }
  __swift_destroy_boxed_opaque_existential_1(v170);
  swift_bridgeObjectRelease_n();
  v110[8] = v152;
  OUTLINED_FUNCTION_21_0();
}

void (*sub_25C8AF29C(void *a1, uint64_t a2, uint64_t a3))(void **a1)
{
  uint64_t v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_25C8B021C(v6, a2, a3);
  return sub_25C8AF31C;
}

void sub_25C8AF31C(void **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = OUTLINED_FUNCTION_17_1();
  v3(v2);
  swift_bridgeObjectRelease();
  free(v1);
}

uint64_t sub_25C8AF364(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UserAccount();
  uint64_t v59 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v57 = (uint64_t)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(int *)(v5 + 36);
  uint64_t v60 = a2;
  uint64_t v8 = *(void *)(a2 + v7 + 96);
  int64_t v9 = *(void *)(v8 + 16);
  uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  uint64_t v58 = a1;
  if (v9)
  {
    v62[0] = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_25C8D9238(0, v9, 0);
    uint64_t v10 = (void *)v62[0];
    int64_t v11 = sub_25C8B0BAC(v8);
    int v13 = v12;
    int v15 = v14 & 1;
    *(void *)&long long v61 = v8 + 56;
    while ((v11 & 0x8000000000000000) == 0 && v11 < 1 << *(unsigned char *)(v8 + 32))
    {
      if (((*(void *)(v61 + (((unint64_t)v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
        goto LABEL_35;
      }
      if (*(_DWORD *)(v8 + 36) != v13) {
        goto LABEL_36;
      }
      LODWORD(v63) = v15;
      uint64_t v16 = sub_25C8EC190();
      uint64_t v18 = v17;
      v62[0] = v10;
      unint64_t v20 = v10[2];
      unint64_t v19 = v10[3];
      if (v20 >= v19 >> 1)
      {
        sub_25C8D9238((char *)(v19 > 1), v20 + 1, 1);
        uint64_t v10 = (void *)v62[0];
      }
      v10[2] = v20 + 1;
      uint64_t v21 = &v10[2 * v20];
      v21[4] = v16;
      v21[5] = v18;
      int64_t v22 = sub_25C8B0AC8(v11, v13, v63 & 1, v8);
      int64_t v11 = v22;
      int v13 = v23;
      int v15 = v24 & 1;
      if (!--v9)
      {
        sub_25C8B0C2C(v22, v23, v15);
        swift_bridgeObjectRelease();
        a1 = v58;
        goto LABEL_11;
      }
    }
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
    uint64_t result = sub_25C8EC5A0();
    __break(1u);
  }
  else
  {
LABEL_11:
    uint64_t v25 = v10[2];
    if (v25)
    {
      uint64_t v56 = v10;
      uint64_t v26 = v10 + 5;
      long long v61 = xmmword_25C8ED970;
      do
      {
        uint64_t v27 = *(v26 - 1);
        uint64_t v28 = *v26;
        uint64_t v29 = *(void *)(*a1 + 16);
        swift_bridgeObjectRetain();
        if (v29 && (sub_25C8E72CC(v27, v28), (v30 & 1) != 0))
        {
          uint64_t v32 = sub_25C8AF29C(v62, v27, v28);
          if (*v31)
          {
            uint64_t v33 = v31;
            sub_25C8B19F4(v60, v57, (void (*)(void))type metadata accessor for UserAccount);
            uint64_t v34 = *v33;
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            *uint64_t v33 = v34;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              uint64_t v34 = sub_25C8E2954(0, *(void *)(v34 + 16) + 1, 1, v34);
              *uint64_t v33 = v34;
            }
            unint64_t v37 = *(void *)(v34 + 16);
            unint64_t v36 = *(void *)(v34 + 24);
            if (v37 >= v36 >> 1)
            {
              uint64_t v34 = sub_25C8E2954(v36 > 1, v37 + 1, 1, v34);
              *uint64_t v33 = v34;
            }
            *(void *)(v34 + 16) = v37 + 1;
            sub_25C8B095C(v57, v34+ ((*(unsigned __int8 *)(v59 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80))+ *(void *)(v59 + 72) * v37);
            ((void (*)(void *, void))v32)(v62, 0);
          }
          else
          {
            ((void (*)(void *, void))v32)(v62, 0);
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v63 = v25;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9CD8);
          unint64_t v38 = (*(unsigned __int8 *)(v59 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80);
          uint64_t v39 = swift_allocObject();
          *(_OWORD *)(v39 + 16) = v61;
          sub_25C8B19F4(v60, v39 + v38, (void (*)(void))type metadata accessor for UserAccount);
          swift_isUniquelyReferenced_nonNull_native();
          v62[0] = *a1;
          uint64_t v40 = v62[0];
          *a1 = 0x8000000000000000;
          uint64_t v41 = v27;
          uint64_t v42 = v28;
          unint64_t v43 = sub_25C8E72CC(v27, v28);
          if (__OFADD__(*(void *)(v40 + 16), (v44 & 1) == 0)) {
            goto LABEL_37;
          }
          unint64_t v45 = v43;
          char v46 = v44;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9CC8);
          if (sub_25C8EC470())
          {
            unint64_t v47 = sub_25C8E72CC(v41, v28);
            if ((v46 & 1) != (v48 & 1)) {
              goto LABEL_39;
            }
            unint64_t v45 = v47;
          }
          uint64_t v49 = (void *)v62[0];
          if (v46)
          {
            uint64_t v50 = *(void *)(v62[0] + 56);
            swift_bridgeObjectRelease();
            *(void *)(v50 + 8 * v45) = v39;
          }
          else
          {
            *(void *)(v62[0] + 8 * (v45 >> 6) + 64) |= 1 << v45;
            char v51 = (uint64_t *)(v49[6] + 16 * v45);
            *char v51 = v41;
            v51[1] = v42;
            *(void *)(v49[7] + 8 * v45) = v39;
            uint64_t v52 = v49[2];
            BOOL v53 = __OFADD__(v52, 1);
            uint64_t v54 = v52 + 1;
            if (v53) {
              goto LABEL_38;
            }
            v49[2] = v54;
            swift_bridgeObjectRetain();
          }
          a1 = v58;
          *uint64_t v58 = v49;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v25 = v63;
        }
        v26 += 2;
        --v25;
      }
      while (v25);
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25C8AF88C()
{
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = sub_25C8EC190();
  uint64_t v4 = sub_25C8E4DC8(v2, v3, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v4) {
    return 1;
  }
  uint64_t v6 = *(void *)(v0 + 56);
  uint64_t v7 = sub_25C8EC190();
  BOOL v9 = sub_25C8E4DC8(v7, v8, v6) != 0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (2 * v9);
}

void sub_25C8AF930()
{
  OUTLINED_FUNCTION_29();
  uint64_t v4 = v3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9CB0);
  uint64_t v6 = OUTLINED_FUNCTION_19(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_10_2();
  uint64_t v7 = type metadata accessor for UserAccount();
  OUTLINED_FUNCTION_16();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_26();
  uint64_t v17 = MEMORY[0x263F8EE78];
  uint64_t v9 = *(void *)(v0 + 48);
  uint64_t v10 = sub_25C8EC190();
  uint64_t v12 = sub_25C8E4DC8(v10, v11, v9);
  swift_bridgeObjectRelease();
  if (v12
    || (uint64_t v13 = *(void *)(v0 + 56),
        uint64_t v14 = sub_25C8EC190(),
        uint64_t v12 = sub_25C8E4DC8(v14, v15, v13),
        swift_bridgeObjectRelease(),
        v12))
  {
    sub_25C8E2D64(v12);
  }
  if (*(void *)(v17 + 16) < 2uLL)
  {
    sub_25C8AFB1C(v17, v1);
    swift_bridgeObjectRelease();
    if (__swift_getEnumTagSinglePayload(v1, 1, v7) == 1)
    {
      sub_25C8B1A54(v1, &qword_26A5D9CB0);
    }
    else
    {
      sub_25C8B095C(v1, v2);
      sub_25C8B095C(v2, (uint64_t)v4);
    }
    type metadata accessor for UserAccountManager.LookupResult();
    swift_storeEnumTagMultiPayload();
    OUTLINED_FUNCTION_21_0();
  }
  else
  {
    *uint64_t v4 = v17;
    type metadata accessor for UserAccountManager.LookupResult();
    OUTLINED_FUNCTION_21_0();
    swift_storeEnumTagMultiPayload();
  }
}

uint64_t sub_25C8AFB1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = type metadata accessor for UserAccount();
  uint64_t v6 = v5;
  if (v4)
  {
    sub_25C8B19F4(a1+ ((*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80)), a2, (void (*)(void))type metadata accessor for UserAccount);
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }
  return __swift_storeEnumTagSinglePayload(a2, v7, 1, v6);
}

uint64_t sub_25C8AFBD8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v5 = type metadata accessor for UserAccount();
  OUTLINED_FUNCTION_1_4();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_26();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9CB0);
  uint64_t v10 = OUTLINED_FUNCTION_19(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_10_2();
  uint64_t result = __swift_storeEnumTagSinglePayload(a1, 1, 1, v5);
  uint64_t v12 = *(void *)(v1 + 40);
  if (*(void *)(v12 + 16) == 2)
  {
    OUTLINED_FUNCTION_16_1();
    uint64_t v14 = v12 + v13;
    uint64_t v15 = *(void *)(v7 + 72);
    swift_bridgeObjectRetain();
    LOBYTE(v16) = 0;
    uint64_t v17 = 0;
    while (1)
    {
      char v18 = v16;
      sub_25C8B19F4(v14 + v15 * v17, v3, (void (*)(void))type metadata accessor for UserAccount);
      if ((*(unsigned char *)(v3 + *(int *)(v5 + 32)) & 1) == 0) {
        break;
      }
      sub_25C8B1448(v3, (void (*)(void))type metadata accessor for UserAccount);
      uint64_t v16 = 1;
      uint64_t v17 = 1;
      if (v18) {
        goto LABEL_7;
      }
    }
    sub_25C8B095C(v3, v2);
    uint64_t v16 = 0;
LABEL_7:
    __swift_storeEnumTagSinglePayload(v2, v16, 1, v5);
    swift_bridgeObjectRelease();
    sub_25C8B1A54(a1, &qword_26A5D9CB0);
    return sub_25C8B0A6C(v2, a1, &qword_26A5D9CB0);
  }
  return result;
}

void sub_25C8AFD78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_29();
  a19 = v21;
  a20 = v22;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v27 = type metadata accessor for UserAccount();
  uint64_t v28 = OUTLINED_FUNCTION_19(v27);
  MEMORY[0x270FA5388](v28);
  OUTLINED_FUNCTION_7_1();
  type metadata accessor for UserAccountManager.LookupResult();
  OUTLINED_FUNCTION_16();
  uint64_t v30 = MEMORY[0x270FA5388](v29);
  uint64_t v32 = (uint64_t *)((char *)&a9 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v30);
  uint64_t v34 = (char *)&a9 - v33;
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9CF8);
  uint64_t v36 = OUTLINED_FUNCTION_19(v35);
  MEMORY[0x270FA5388](v36);
  OUTLINED_FUNCTION_4_0();
  uint64_t v39 = v38 - v37;
  uint64_t v41 = (uint64_t *)(v38 - v37 + *(int *)(v40 + 56));
  sub_25C8B19F4(v26, v38 - v37, (void (*)(void))type metadata accessor for UserAccountManager.LookupResult);
  sub_25C8B19F4(v24, (uint64_t)v41, (void (*)(void))type metadata accessor for UserAccountManager.LookupResult);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_25C8B19F4(v39, (uint64_t)v32, (void (*)(void))type metadata accessor for UserAccountManager.LookupResult);
      uint64_t v43 = *v32;
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        sub_25C8B0048(v43, *v41);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_12:
        sub_25C8B1448(v39, (void (*)(void))type metadata accessor for UserAccountManager.LookupResult);
        goto LABEL_13;
      }
      swift_bridgeObjectRelease();
    }
    else if (swift_getEnumCaseMultiPayload() == 2)
    {
      goto LABEL_12;
    }
  }
  else
  {
    sub_25C8B19F4(v39, (uint64_t)v34, (void (*)(void))type metadata accessor for UserAccountManager.LookupResult);
    if (!swift_getEnumCaseMultiPayload())
    {
      sub_25C8B095C((uint64_t)v41, v20);
      sub_25C8CC0FC((uint64_t)v34, v20);
      sub_25C8B1448(v20, (void (*)(void))type metadata accessor for UserAccount);
      sub_25C8B1448((uint64_t)v34, (void (*)(void))type metadata accessor for UserAccount);
      goto LABEL_12;
    }
    sub_25C8B1448((uint64_t)v34, (void (*)(void))type metadata accessor for UserAccount);
  }
  sub_25C8B1A54(v39, &qword_26A5D9CF8);
LABEL_13:
  OUTLINED_FUNCTION_21_0();
}

uint64_t sub_25C8B0048(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UserAccount() - 8;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v19 - v9;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 == *(void *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      char v15 = 1;
    }
    else
    {
      unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      uint64_t v13 = *(void *)(v8 + 72);
      uint64_t v14 = v11 - 1;
      do
      {
        sub_25C8B19F4(a1 + v12, (uint64_t)v10, (void (*)(void))type metadata accessor for UserAccount);
        sub_25C8B19F4(a2 + v12, (uint64_t)v7, (void (*)(void))type metadata accessor for UserAccount);
        char v15 = sub_25C8CC0FC((uint64_t)v10, (uint64_t)v7);
        sub_25C8B1448((uint64_t)v7, (void (*)(void))type metadata accessor for UserAccount);
        sub_25C8B1448((uint64_t)v10, (void (*)(void))type metadata accessor for UserAccount);
        BOOL v17 = v14-- != 0;
        if ((v15 & 1) == 0) {
          break;
        }
        v12 += v13;
      }
      while (v17);
    }
  }
  else
  {
    char v15 = 0;
  }
  return v15 & 1;
}

unint64_t sub_25C8B01D4(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  *uint64_t v5 = a2;
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

void (*sub_25C8B021C(void *a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  uint64_t v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_25C8B04B4(v6);
  v6[10] = sub_25C8B0330(v6 + 4, a2, a3);
  return sub_25C8B02C8;
}

void sub_25C8B02C8(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(uint64_t))(*(void *)a1 + 72);
  (*(void (**)(void))(*(void *)a1 + 80))();
  swift_bridgeObjectRelease();
  uint64_t v3 = OUTLINED_FUNCTION_17_1();
  v2(v3);
  free(v1);
}

void (*sub_25C8B0330(void *a1, uint64_t a2, uint64_t a3))(uint64_t **a1)
{
  uint64_t v4 = v3;
  uint64_t v8 = malloc(0x30uLL);
  *a1 = v8;
  void v8[2] = a3;
  v8[3] = v3;
  v8[1] = a2;
  uint64_t v9 = *v3;
  unint64_t v10 = sub_25C8E72CC(a2, a3);
  *((unsigned char *)v8 + 40) = v11 & 1;
  if (__OFADD__(*(void *)(v9 + 16), (v11 & 1) == 0))
  {
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v12 = v10;
  char v13 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9CC8);
  if (sub_25C8EC470())
  {
    unint64_t v14 = sub_25C8E72CC(a2, a3);
    if ((v13 & 1) == (v15 & 1))
    {
      unint64_t v12 = v14;
      goto LABEL_5;
    }
LABEL_10:
    uint64_t result = (void (*)(uint64_t **))sub_25C8EC5A0();
    __break(1u);
    return result;
  }
LABEL_5:
  v8[4] = v12;
  if (v13) {
    uint64_t v16 = *(void *)(*(void *)(*v4 + 56) + 8 * v12);
  }
  else {
    uint64_t v16 = 0;
  }
  *uint64_t v8 = v16;
  return sub_25C8B0464;
}

void sub_25C8B0464(uint64_t **a1)
{
  uint64_t v1 = *a1;
  sub_25C8B04F0(*a1, *((unsigned char *)*a1 + 40), (void **)(*a1)[3], (*a1)[4], (*a1)[1], (*a1)[2]);
  swift_bridgeObjectRelease();
  free(v1);
}

uint64_t (*sub_25C8B04B4(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  *uint64_t v1 = 0x8000000000000000;
  return sub_25C8B04E4;
}

uint64_t sub_25C8B04E4(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

uint64_t sub_25C8B04F0(uint64_t *a1, char a2, void **a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *a1;
  if (*a1)
  {
    if (a2)
    {
      *(void *)((*a3)[7] + 8 * a4) = v6;
    }
    else
    {
      sub_25C8B01D4(a4, a5, a6, v6, *a3);
      swift_bridgeObjectRetain();
    }
  }
  else if (a2)
  {
    swift_arrayDestroy();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9CB8);
    sub_25C8EC480();
  }
  return swift_bridgeObjectRetain();
}

void sub_25C8B05C4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_25C8EC160();
  objc_msgSend(a3, sel_setProfileId_, v4);
}

void sub_25C8B061C()
{
  OUTLINED_FUNCTION_29();
  uint64_t v22 = v1;
  char v23 = v2;
  uint64_t v4 = v3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9C98);
  uint64_t v6 = OUTLINED_FUNCTION_19(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_7_1();
  uint64_t v7 = type metadata accessor for UserAccount();
  uint64_t v8 = *(void *)(v4 + *(int *)(v7 + 20) + 8);
  if (v8)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = (void *)sub_25C8EC160();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = objc_allocWithZone((Class)type metadata accessor for Account());
  swift_bridgeObjectRetain();
  char v11 = (void *)sub_25C8EC160();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v10, sel_initWithIdentifier_displayString_, v9, v11);

  char v13 = (uint64_t *)(v4 + *(int *)(v7 + 24));
  uint64_t v14 = *v13;
  uint64_t v15 = v13[1];
  id v16 = v12;
  swift_bridgeObjectRetain();
  sub_25C8B05C4(v14, v15, v16);
  swift_bridgeObjectRelease();
  BOOL v17 = (void *)sub_25C8EC260();
  objc_msgSend(v16, sel_setIsActive_, v17);

  objc_msgSend(v16, sel_setMatchedMultiple_, v23 & 1);
  if (v8)
  {
    swift_bridgeObjectRetain();
    char v18 = (void *)sub_25C8EC160();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v18 = 0;
  }
  objc_msgSend(v16, sel_setICloudAltDSID_, v18, v22);

  sub_25C8B08F4(v4, v0);
  uint64_t v19 = sub_25C8EB000();
  if (__swift_getEnumTagSinglePayload(v0, 1, v19) == 1)
  {
    sub_25C8B1A54(v0, &qword_26A5D9C98);
    uint64_t v20 = 0;
  }
  else
  {
    sub_25C8EAFE0();
    OUTLINED_FUNCTION_14_0();
    v21();
    uint64_t v20 = (void *)sub_25C8EC160();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v16, sel_setHomeUserID_, v20);

  objc_msgSend(v16, sel_setProfileImage_, 0);
  sub_25C8B1448(v4, (void (*)(void))type metadata accessor for UserAccount);
  swift_release();
  OUTLINED_FUNCTION_21_0();
}

uint64_t sub_25C8B08F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9C98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C8B095C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UserAccount();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for UserAccountManager.LookupResult()
{
  uint64_t result = qword_26A5D9CE0;
  if (!qword_26A5D9CE0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C8B0A08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UserAccount();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C8B0A6C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_16();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

int64_t sub_25C8B0AC8(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  if (v5 + 1 < (unint64_t)(result + 63) >> 6)
  {
    unint64_t v10 = *(void *)(v6 + 8 * v9);
    if (v10) {
      return __clz(__rbit64(v10)) + (v9 << 6);
    }
    unint64_t v11 = (unint64_t)(result + 63) >> 6;
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v11)
    {
      unint64_t v10 = *(void *)(v6 + 8 * v9);
      if (v10) {
        return __clz(__rbit64(v10)) + (v9 << 6);
      }
      while (v5 + 3 < v11)
      {
        unint64_t v10 = *(void *)(a4 + 80 + 8 * v5++);
        if (v10)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v10)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_25C8B0BAC(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
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
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  uint64_t v2 = 64;
  for (uint64_t i = 9; i - 7 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    unint64_t v1 = *(void *)(a1 + 8 * i);
    v2 += 64;
    if (v1) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_25C8B0C2C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t *sub_25C8B0C38(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v6 = *(void *)(a3 - 8);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      swift_bridgeObjectRetain();
LABEL_11:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (!EnumCaseMultiPayload)
    {
      uint64_t v8 = sub_25C8EB000();
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v8))
      {
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9C98);
        memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v8);
      }
      unint64_t v11 = (int *)type metadata accessor for UserAccount();
      uint64_t v12 = v11[5];
      char v13 = (uint64_t *)((char *)a1 + v12);
      uint64_t v14 = (uint64_t *)((char *)a2 + v12);
      uint64_t v16 = *v14;
      uint64_t v15 = v14[1];
      *char v13 = v16;
      v13[1] = v15;
      uint64_t v17 = v11[6];
      char v18 = (uint64_t *)((char *)a1 + v17);
      uint64_t v19 = (uint64_t *)((char *)a2 + v17);
      uint64_t v30 = v19[1];
      *char v18 = *v19;
      v18[1] = v30;
      uint64_t v20 = v11[7];
      uint64_t v21 = (uint64_t *)((char *)a1 + v20);
      uint64_t v22 = (uint64_t *)((char *)a2 + v20);
      uint64_t v23 = v22[1];
      *uint64_t v21 = *v22;
      v21[1] = v23;
      uint64_t v24 = v22[3];
      v21[2] = v22[2];
      v21[3] = v24;
      uint64_t v25 = v22[5];
      v21[4] = v22[4];
      v21[5] = v25;
      uint64_t v26 = v22[7];
      v21[6] = v22[6];
      v21[7] = v26;
      uint64_t v27 = v22[9];
      v21[8] = v22[8];
      v21[9] = v27;
      uint64_t v28 = v22[11];
      v21[10] = v22[10];
      v21[11] = v28;
      v21[12] = v22[12];
      *((unsigned char *)a1 + v11[8]) = *((unsigned char *)a2 + v11[8]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_11;
    }
    memcpy(a1, a2, *(void *)(v6 + 64));
  }
  return a1;
}

uint64_t sub_25C8B0E9C(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result != 1)
  {
    if (result) {
      return result;
    }
    uint64_t v3 = sub_25C8EB000();
    if (!__swift_getEnumTagSinglePayload(a1, 1, v3)) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
    }
    type metadata accessor for UserAccount();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

void *sub_25C8B0FA4(void *a1, void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    *a1 = *a2;
    swift_bridgeObjectRetain();
LABEL_9:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  if (!EnumCaseMultiPayload)
  {
    uint64_t v7 = sub_25C8EB000();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v7))
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9C98);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v7);
    }
    uint64_t v9 = (int *)type metadata accessor for UserAccount();
    uint64_t v10 = v9[5];
    unint64_t v11 = (void *)((char *)a1 + v10);
    uint64_t v12 = (void *)((char *)a2 + v10);
    uint64_t v14 = *v12;
    uint64_t v13 = v12[1];
    *unint64_t v11 = v14;
    v11[1] = v13;
    uint64_t v15 = v9[6];
    uint64_t v16 = (void *)((char *)a1 + v15);
    uint64_t v17 = (void *)((char *)a2 + v15);
    uint64_t v28 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v28;
    uint64_t v18 = v9[7];
    uint64_t v19 = (void *)((char *)a1 + v18);
    uint64_t v20 = (void *)((char *)a2 + v18);
    uint64_t v21 = v20[1];
    *uint64_t v19 = *v20;
    v19[1] = v21;
    uint64_t v22 = v20[3];
    v19[2] = v20[2];
    v19[3] = v22;
    uint64_t v23 = v20[5];
    v19[4] = v20[4];
    v19[5] = v23;
    uint64_t v24 = v20[7];
    v19[6] = v20[6];
    v19[7] = v24;
    uint64_t v25 = v20[9];
    v19[8] = v20[8];
    v19[9] = v25;
    uint64_t v26 = v20[11];
    v19[10] = v20[10];
    v19[11] = v26;
    v19[12] = v20[12];
    *((unsigned char *)a1 + v9[8]) = *((unsigned char *)a2 + v9[8]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_9;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

void *sub_25C8B11C4(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_25C8B1448((uint64_t)a1, (void (*)(void))type metadata accessor for UserAccountManager.LookupResult);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      swift_bridgeObjectRetain();
LABEL_10:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (!EnumCaseMultiPayload)
    {
      uint64_t v7 = sub_25C8EB000();
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v7))
      {
        uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9C98);
        memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v7);
      }
      uint64_t v9 = (int *)type metadata accessor for UserAccount();
      uint64_t v10 = v9[5];
      unint64_t v11 = (void *)((char *)a1 + v10);
      uint64_t v12 = (void *)((char *)a2 + v10);
      *unint64_t v11 = *v12;
      v11[1] = v12[1];
      uint64_t v13 = v9[6];
      uint64_t v14 = (void *)((char *)a1 + v13);
      uint64_t v15 = (void *)((char *)a2 + v13);
      *uint64_t v14 = *v15;
      v14[1] = v15[1];
      uint64_t v16 = v9[7];
      uint64_t v17 = (void *)((char *)a1 + v16);
      uint64_t v18 = (void *)((char *)a2 + v16);
      *uint64_t v17 = *v18;
      v17[1] = v18[1];
      v17[2] = v18[2];
      v17[3] = v18[3];
      v17[4] = v18[4];
      v17[5] = v18[5];
      v17[6] = v18[6];
      v17[7] = v18[7];
      v17[8] = v18[8];
      v17[9] = v18[9];
      v17[10] = v18[10];
      v17[11] = v18[11];
      v17[12] = v18[12];
      *((unsigned char *)a1 + v9[8]) = *((unsigned char *)a2 + v9[8]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_10;
    }
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t sub_25C8B1448(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_14_0();
  v3();
  return a1;
}

char *sub_25C8B149C(char *a1, char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = sub_25C8EB000();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
    {
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9C98);
      memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
    }
    uint64_t v8 = (int *)type metadata accessor for UserAccount();
    *(_OWORD *)&a1[v8[5]] = *(_OWORD *)&a2[v8[5]];
    *(_OWORD *)&a1[v8[6]] = *(_OWORD *)&a2[v8[6]];
    memcpy(&a1[v8[7]], &a2[v8[7]], 0x68uLL);
    a1[v8[8]] = a2[v8[8]];
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *sub_25C8B15F0(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_25C8B1448((uint64_t)a1, (void (*)(void))type metadata accessor for UserAccountManager.LookupResult);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = sub_25C8EB000();
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
      {
        uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9C98);
        memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
      }
      uint64_t v8 = (int *)type metadata accessor for UserAccount();
      *(_OWORD *)&a1[v8[5]] = *(_OWORD *)&a2[v8[5]];
      *(_OWORD *)&a1[v8[6]] = *(_OWORD *)&a2[v8[6]];
      memcpy(&a1[v8[7]], &a2[v8[7]], 0x68uLL);
      a1[v8[8]] = a2[v8[8]];
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_25C8B1774()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_25C8B1784()
{
  uint64_t result = type metadata accessor for UserAccount();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SwitchByNameType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SwitchByNameType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25C8B196CLL);
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

ValueMetadata *type metadata accessor for SwitchByNameType()
{
  return &type metadata for SwitchByNameType;
}

unint64_t sub_25C8B19A8()
{
  unint64_t result = qword_26A5D9CF0;
  if (!qword_26A5D9CF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5D9CF0);
  }
  return result;
}

uint64_t sub_25C8B19F4(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_16();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_25C8B1A54(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_14_0();
  v3();
  return a1;
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_9_2()
{
  return v0 + 312;
}

uint64_t OUTLINED_FUNCTION_12_0@<X0>(unint64_t a1@<X8>)
{
  return sub_25C8E2954(a1 > 1, v1, 1, v2);
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  int64_t v2 = *(void *)(v0 + 16) + 1;
  return sub_25C8E2954(0, v2, 1, v0);
}

void OUTLINED_FUNCTION_15_1()
{
  *(void *)(v1 + 16) = v0;
}

uint64_t OUTLINED_FUNCTION_17_1()
{
  return v0;
}

uint64_t destroy for IdentityDialogProvider(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  return swift_release();
}

uint64_t initializeWithCopy for IdentityDialogProvider(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_retain();
  return a1;
}

uint64_t *assignWithCopy for IdentityDialogProvider(uint64_t *a1, uint64_t *a2)
{
  a1[10] = a2[10];
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy88_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x58uLL);
}

uint64_t assignWithTake for IdentityDialogProvider(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v5 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v5;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for IdentityDialogProvider(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 88))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
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

uint64_t storeEnumTagSinglePayload for IdentityDialogProvider(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
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
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IdentityDialogProvider()
{
  return &type metadata for IdentityDialogProvider;
}

uint64_t sub_25C8B1DE8()
{
  OUTLINED_FUNCTION_6_1();
  uint64_t v2 = OUTLINED_FUNCTION_22_0(v1);
  v0[4] = v2;
  OUTLINED_FUNCTION_1_2(v2);
  v0[5] = v3;
  v0[6] = OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C8B1E6C()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_11_2();
  uint64_t v0 = OUTLINED_FUNCTION_10_3();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_13_2(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_25C8B1F08;
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_16_2();
  return v3();
}

uint64_t sub_25C8B1F08()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_4();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v5 = v4;
  *(void *)(v6 + 64) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C8B1FE8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9F70);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((void *)(v1 + 40), *(void *)(v1 + 64));
  sub_25C8EB430();
  uint64_t v6 = sub_25C8EB720();
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 1, 1, v6);
  uint64_t v7 = sub_25C8EB9A0();
  memset(v10, 0, sizeof(v10));
  uint64_t v11 = 0;
  uint64_t v8 = MEMORY[0x263F6FFF0];
  a1[3] = v7;
  a1[4] = v8;
  __swift_allocate_boxed_opaque_existential_1Tm(a1);
  sub_25C8EB610();
  sub_25C89F4B0((uint64_t)v10, &qword_26A5D9F80);
  return sub_25C89F4B0((uint64_t)v5, &qword_26A5D9F70);
}

uint64_t sub_25C8B2144()
{
  OUTLINED_FUNCTION_6_1();
  uint64_t v2 = OUTLINED_FUNCTION_22_0(v1);
  v0[4] = v2;
  OUTLINED_FUNCTION_1_2(v2);
  v0[5] = v3;
  v0[6] = OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C8B21C8()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_11_2();
  uint64_t v0 = OUTLINED_FUNCTION_10_3();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_13_2(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_25C8B2264;
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_16_2();
  return v3();
}

uint64_t sub_25C8B2264()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_4();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v5 = v4;
  *(void *)(v6 + 64) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C8B2344()
{
  OUTLINED_FUNCTION_12_1();
  sub_25C8B1FE8(*(uint64_t **)(v0 + 16));
  uint64_t v1 = OUTLINED_FUNCTION_23_0();
  v2(v1);
  swift_task_dealloc();
  OUTLINED_FUNCTION_15_2();
  return v3();
}

uint64_t sub_25C8B23C8()
{
  OUTLINED_FUNCTION_6_1();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  return v0();
}

uint64_t sub_25C8B2424()
{
  OUTLINED_FUNCTION_6_1();
  uint64_t v2 = OUTLINED_FUNCTION_22_0(v1);
  v0[4] = v2;
  OUTLINED_FUNCTION_1_2(v2);
  v0[5] = v3;
  v0[6] = OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C8B24A8()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_11_2();
  uint64_t v0 = OUTLINED_FUNCTION_10_3();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_13_2(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_25C8B2544;
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_16_2();
  return v3();
}

uint64_t sub_25C8B2544()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_4();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v5 = v4;
  *(void *)(v6 + 64) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C8B2624()
{
  uint64_t v1 = sub_25C8EB020();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25C8EC0F0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25C8C737C(0x53474E4954544553, 0xE800000000000000);
  if (v10)
  {
    uint64_t v11 = v9;
    uint64_t v12 = v10;
    sub_25C8B47C4();
    uint64_t v13 = sub_25C8E3060(v11, v12);
    swift_bridgeObjectRelease();
    return v13;
  }
  else
  {
    if (qword_26A5D95A8 != -1) {
      swift_once();
    }
    uint64_t v15 = __swift_project_value_buffer(v5, (uint64_t)qword_26A5DD5A0);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v15, v5);
    sub_25C8B473C(v0, (uint64_t)v34);
    uint64_t v16 = sub_25C8EC0D0();
    os_log_type_t v17 = sub_25C8EC2E0();
    int v18 = v17;
    if (os_log_type_enabled(v16, v17))
    {
      os_log_t v31 = v16;
      uint64_t v19 = swift_slowAlloc();
      int v30 = v18;
      uint64_t v20 = (uint8_t *)v19;
      uint64_t v21 = swift_slowAlloc();
      uint64_t v29 = v21;
      *(_DWORD *)uint64_t v20 = 136315138;
      uint64_t v33 = v21;
      uint64_t v27 = v20 + 4;
      uint64_t v28 = v20;
      __swift_project_boxed_opaque_existential_1(v35, v35[3]);
      sub_25C8EB420();
      sub_25C8B4774();
      uint64_t v22 = sub_25C8EC540();
      unint64_t v24 = v23;
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      uint64_t v32 = sub_25C8BB4F0(v22, v24, &v33);
      sub_25C8EC360();
      swift_bridgeObjectRelease();
      sub_25C8A8014((uint64_t)v34);
      uint64_t v16 = v31;
      uint64_t v25 = v28;
      _os_log_impl(&dword_25C89B000, v31, (os_log_type_t)v30, "Missing Settings label for locale:%s", v28, 0xCu);
      uint64_t v26 = v29;
      swift_arrayDestroy();
      MEMORY[0x261198330](v26, -1, -1);
      MEMORY[0x261198330](v25, -1, -1);
    }
    else
    {
      sub_25C8A8014((uint64_t)v34);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return MEMORY[0x263F8EE78];
  }
}

uint64_t sub_25C8B29C4(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 136) = a2;
  *(void *)(v3 + 96) = a1;
  *(void *)(v3 + 104) = v2;
  return OUTLINED_FUNCTION_2_2((uint64_t)sub_25C8B29E0);
}

uint64_t sub_25C8B29E0()
{
  OUTLINED_FUNCTION_12_1();
  char v1 = *(unsigned char *)(v0 + 136);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9D08);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25C8ED970;
  strcpy((char *)(inited + 32), "forNoNameMatch");
  *(unsigned char *)(inited + 47) = -18;
  *(void *)(inited + 72) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 48) = v1;
  *(void *)(v0 + 112) = sub_25C8EC130();
  OUTLINED_FUNCTION_5_4();
  uint64_t v3 = swift_task_alloc();
  uint64_t v4 = (void *)OUTLINED_FUNCTION_18_1(v3);
  *uint64_t v4 = v5;
  v4[1] = sub_25C8B2B0C;
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_24_0();
  return sub_25C8CFE1C(v6, v7, v8, v9);
}

uint64_t sub_25C8B2B0C()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v6 = v5;
  *(void *)(v3 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_15();
    return MEMORY[0x270FA2498](v7, v8, v9);
  }
  else
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_9_0();
    return v10();
  }
}

uint64_t sub_25C8B2C10()
{
  OUTLINED_FUNCTION_6_1();
  swift_bridgeObjectRelease();
  char v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25C8B2C70()
{
  OUTLINED_FUNCTION_6_1();
  v1[14] = v2;
  v1[15] = v0;
  v1[12] = v3;
  v1[13] = v4;
  uint64_t v5 = sub_25C8EB740();
  v1[16] = v5;
  OUTLINED_FUNCTION_1_2(v5);
  v1[17] = v6;
  v1[18] = OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C8B2D00()
{
  OUTLINED_FUNCTION_26_0();
  unint64_t v1 = v0[14];
  uint64_t v2 = v0[13];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9D08);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25C8ED970;
  *(void *)(inited + 32) = 0x4E79616C70736964;
  *(void *)(inited + 40) = 0xEB00000000656D61;
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  if (v1) {
    uint64_t v4 = v2;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = 0xE000000000000000;
  if (v1) {
    unint64_t v5 = v1;
  }
  *(void *)(inited + 48) = v4;
  *(void *)(inited + 56) = v5;
  swift_bridgeObjectRetain();
  v0[19] = sub_25C8EC130();
  OUTLINED_FUNCTION_5_4();
  swift_task_alloc();
  OUTLINED_FUNCTION_20();
  v0[20] = v6;
  *uint64_t v6 = v7;
  v6[1] = sub_25C8B2E50;
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_24_0();
  return sub_25C8CFE1C(v8, v9, v10, v11);
}

uint64_t sub_25C8B2E50()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_4();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_4_4();
  *unint64_t v5 = v4;
  *(void *)(v6 + 168) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C8B2F4C()
{
  OUTLINED_FUNCTION_12_1();
  sub_25C8B1FE8(*(uint64_t **)(v0 + 96));
  uint64_t v1 = OUTLINED_FUNCTION_23_0();
  v2(v1);
  swift_task_dealloc();
  OUTLINED_FUNCTION_15_2();
  return v3();
}

uint64_t sub_25C8B2FD0()
{
  OUTLINED_FUNCTION_6_1();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  return v0();
}

uint64_t sub_25C8B302C()
{
  OUTLINED_FUNCTION_6_1();
  uint64_t v2 = OUTLINED_FUNCTION_22_0(v1);
  v0[4] = v2;
  OUTLINED_FUNCTION_1_2(v2);
  v0[5] = v3;
  v0[6] = OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C8B30B0()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_11_2();
  uint64_t v0 = OUTLINED_FUNCTION_10_3();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_13_2(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_25C8B1F08;
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_16_2();
  return v3();
}

uint64_t sub_25C8B314C()
{
  OUTLINED_FUNCTION_6_1();
  uint64_t v2 = OUTLINED_FUNCTION_22_0(v1);
  v0[4] = v2;
  OUTLINED_FUNCTION_1_2(v2);
  v0[5] = v3;
  v0[6] = OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C8B31D0()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_11_2();
  uint64_t v0 = OUTLINED_FUNCTION_10_3();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_13_2(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_25C8B326C;
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_16_2();
  return v3();
}

uint64_t sub_25C8B326C()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_4();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v5 = v4;
  *(void *)(v6 + 64) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C8B334C()
{
  OUTLINED_FUNCTION_26_0();
  uint64_t v2 = v0[5];
  uint64_t v1 = v0[6];
  uint64_t v3 = v0[4];
  uint64_t v4 = (uint64_t *)v0[2];
  sub_25C8B2624();
  sub_25C8B1FE8(v4);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  OUTLINED_FUNCTION_15_2();
  return v5();
}

uint64_t sub_25C8B33F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[14] = a3;
  v4[15] = v3;
  v4[12] = a1;
  v4[13] = a2;
  return OUTLINED_FUNCTION_2_2((uint64_t)sub_25C8B3414);
}

uint64_t sub_25C8B3414()
{
  OUTLINED_FUNCTION_26_0();
  unint64_t v1 = v0[14];
  uint64_t v2 = v0[13];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9D08);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25C8ED970;
  *(void *)(inited + 32) = 0x614E656369766564;
  *(void *)(inited + 40) = 0xEA0000000000656DLL;
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  if (v1) {
    uint64_t v4 = v2;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = 0xE000000000000000;
  if (v1) {
    unint64_t v5 = v1;
  }
  *(void *)(inited + 48) = v4;
  *(void *)(inited + 56) = v5;
  swift_bridgeObjectRetain();
  v0[16] = sub_25C8EC130();
  OUTLINED_FUNCTION_5_4();
  swift_task_alloc();
  OUTLINED_FUNCTION_20();
  v0[17] = v6;
  *uint64_t v6 = v7;
  v6[1] = sub_25C8B3560;
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_24_0();
  return sub_25C8CFE1C(v8, v9, v10, v11);
}

uint64_t sub_25C8B3560()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v6 = v5;
  *(void *)(v3 + 144) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_15();
    return MEMORY[0x270FA2498](v7, v8, v9);
  }
  else
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_9_0();
    return v10();
  }
}

uint64_t sub_25C8B3664()
{
  OUTLINED_FUNCTION_6_1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9_0();
  return v0();
}

uint64_t sub_25C8B36C0(uint64_t a1, uint64_t a2)
{
  v3[13] = a2;
  v3[14] = v2;
  v3[12] = a1;
  return OUTLINED_FUNCTION_2_2((uint64_t)sub_25C8B36DC);
}

uint64_t sub_25C8B36DC()
{
  OUTLINED_FUNCTION_12_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9D08);
  uint64_t inited = (__n128 *)swift_initStackObject();
  uint64_t v2 = OUTLINED_FUNCTION_19_1(inited, (__n128)xmmword_25C8ED970);
  uint64_t v3 = OUTLINED_FUNCTION_21_1((uint64_t)v2, (uint64_t)"isCommunalDevice");
  OUTLINED_FUNCTION_20_1(v3, MEMORY[0x263F8D4F8]);
  *(void *)(v0 + 120) = sub_25C8EC130();
  OUTLINED_FUNCTION_5_4();
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_17_2(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_25C8B37F0;
  OUTLINED_FUNCTION_8_1();
  return sub_25C8CFE1C(v7, v8, v9, v10);
}

uint64_t sub_25C8B37F0()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v6 = v5;
  *(void *)(v3 + 136) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_15();
    return MEMORY[0x270FA2498](v7, v8, v9);
  }
  else
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_9_0();
    return v10();
  }
}

uint64_t sub_25C8B38F4()
{
  OUTLINED_FUNCTION_6_1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9_0();
  return v0();
}

uint64_t sub_25C8B3950(uint64_t a1, uint64_t a2)
{
  v3[13] = a2;
  v3[14] = v2;
  v3[12] = a1;
  return OUTLINED_FUNCTION_2_2((uint64_t)sub_25C8B396C);
}

uint64_t sub_25C8B396C()
{
  OUTLINED_FUNCTION_12_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9D08);
  uint64_t inited = (__n128 *)swift_initStackObject();
  uint64_t v2 = OUTLINED_FUNCTION_19_1(inited, (__n128)xmmword_25C8ED970);
  uint64_t v3 = OUTLINED_FUNCTION_21_1((uint64_t)v2, (uint64_t)"isCommunalDevice");
  OUTLINED_FUNCTION_20_1(v3, MEMORY[0x263F8D4F8]);
  *(void *)(v0 + 120) = sub_25C8EC130();
  OUTLINED_FUNCTION_5_4();
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_17_2(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_25C8B3A80;
  OUTLINED_FUNCTION_8_1();
  return sub_25C8CFE1C(v7, v8, v9, v10);
}

uint64_t sub_25C8B3A80()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v6 = v5;
  *(void *)(v3 + 136) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_15();
    return MEMORY[0x270FA2498](v7, v8, v9);
  }
  else
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_9_0();
    return v10();
  }
}

uint64_t sub_25C8B3B84(uint64_t a1, uint64_t a2)
{
  v3[13] = a2;
  v3[14] = v2;
  v3[12] = a1;
  return OUTLINED_FUNCTION_2_2((uint64_t)sub_25C8B3BA0);
}

uint64_t sub_25C8B3BA0()
{
  OUTLINED_FUNCTION_12_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9D08);
  uint64_t inited = (__n128 *)swift_initStackObject();
  uint64_t v2 = OUTLINED_FUNCTION_19_1(inited, (__n128)xmmword_25C8ED970);
  uint64_t v3 = OUTLINED_FUNCTION_21_1((uint64_t)v2, (uint64_t)"isCommunalDevice");
  OUTLINED_FUNCTION_20_1(v3, MEMORY[0x263F8D4F8]);
  *(void *)(v0 + 120) = sub_25C8EC130();
  OUTLINED_FUNCTION_5_4();
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_17_2(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_25C8B3A80;
  OUTLINED_FUNCTION_8_1();
  return sub_25C8CFE1C(v7, v8, v9, v10);
}

uint64_t sub_25C8B3CB4(uint64_t a1)
{
  *(void *)(v2 + 96) = a1;
  *(void *)(v2 + 104) = v1;
  return OUTLINED_FUNCTION_2_2((uint64_t)sub_25C8B3CCC);
}

uint64_t sub_25C8B3CCC()
{
  OUTLINED_FUNCTION_12_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9D08);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25C8ED970;
  *(void *)(inited + 32) = 0xD000000000000013;
  *(void *)(inited + 40) = 0x800000025C8F0630;
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = 0xD000000000000043;
  *(void *)(inited + 56) = 0x800000025C8F05E0;
  *(void *)(v0 + 112) = sub_25C8EC130();
  OUTLINED_FUNCTION_5_4();
  uint64_t v2 = swift_task_alloc();
  uint64_t v3 = (void *)OUTLINED_FUNCTION_18_1(v2);
  *uint64_t v3 = v4;
  v3[1] = sub_25C8B2B0C;
  OUTLINED_FUNCTION_8_1();
  return sub_25C8CFE1C(v5, v6, v7, v8);
}

uint64_t sub_25C8B3DF4(uint64_t a1)
{
  *(void *)(v2 + 96) = a1;
  *(void *)(v2 + 104) = v1;
  return OUTLINED_FUNCTION_2_2((uint64_t)sub_25C8B3E0C);
}

uint64_t sub_25C8B3E0C()
{
  OUTLINED_FUNCTION_12_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9D08);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25C8ED970;
  *(void *)(inited + 32) = 0xD000000000000013;
  *(void *)(inited + 40) = 0x800000025C8F0630;
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = 0xD000000000000043;
  *(void *)(inited + 56) = 0x800000025C8F05E0;
  *(void *)(v0 + 112) = sub_25C8EC130();
  OUTLINED_FUNCTION_5_4();
  uint64_t v2 = swift_task_alloc();
  uint64_t v3 = (void *)OUTLINED_FUNCTION_18_1(v2);
  *uint64_t v3 = v4;
  v3[1] = sub_25C8B3F34;
  OUTLINED_FUNCTION_8_1();
  return sub_25C8CFE1C(v5, v6, v7, v8);
}

uint64_t sub_25C8B3F34()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v6 = v5;
  *(void *)(v3 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_15();
    return MEMORY[0x270FA2498](v7, v8, v9);
  }
  else
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_9_0();
    return v10();
  }
}

uint64_t sub_25C8B4038(uint64_t a1, char a2, char a3)
{
  *(unsigned char *)(v4 + 185) = a3;
  *(unsigned char *)(v4 + 184) = a2;
  *(void *)(v4 + 144) = a1;
  *(void *)(v4 + 152) = v3;
  return OUTLINED_FUNCTION_2_2((uint64_t)sub_25C8B4058);
}

uint64_t sub_25C8B4058()
{
  OUTLINED_FUNCTION_12_1();
  char v1 = *(unsigned char *)(v0 + 185);
  char v2 = *(unsigned char *)(v0 + 184);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9D08);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25C8EDAA0;
  strcpy((char *)(inited + 32), "highConfidence");
  *(unsigned char *)(inited + 47) = -18;
  uint64_t v4 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 48) = v2;
  *(void *)(inited + 72) = v4;
  *(void *)(inited + 80) = 0x506E497075746573;
  *(void *)(inited + 88) = 0xEF73736572676F72;
  *(void *)(inited + 120) = v4;
  *(unsigned char *)(inited + 96) = v1;
  *(void *)(v0 + 160) = sub_25C8EC130();
  OUTLINED_FUNCTION_5_4();
  swift_task_alloc();
  OUTLINED_FUNCTION_20();
  *(void *)(v0 + 168) = v5;
  *uint64_t v5 = v6;
  v5[1] = sub_25C8B41B8;
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_24_0();
  return sub_25C8CFE1C(v7, v8, v9, v10);
}

uint64_t sub_25C8B41B8()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v6 = v5;
  *(void *)(v3 + 176) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_15();
    return MEMORY[0x270FA2498](v7, v8, v9);
  }
  else
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_9_0();
    return v10();
  }
}

uint64_t sub_25C8B42BC()
{
  OUTLINED_FUNCTION_6_1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9_0();
  return v0();
}

uint64_t sub_25C8B4318()
{
  OUTLINED_FUNCTION_6_1();
  *(void *)(v1 + 184) = v2;
  *(void *)(v1 + 192) = v0;
  *(unsigned char *)(v1 + 232) = v3;
  *(void *)(v1 + 176) = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9D78);
  *(void *)(v1 + 200) = OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_25C8B43A4()
{
  OUTLINED_FUNCTION_26_0();
  uint64_t v1 = *(void *)(v0 + 200);
  char v2 = *(unsigned char *)(v0 + 232);
  uint64_t v3 = *(void *)(v0 + 184);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9D08);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25C8EDAA0;
  *(void *)(inited + 32) = 0xD000000000000012;
  *(void *)(inited + 40) = 0x800000025C8F06A0;
  uint64_t v5 = sub_25C8EBEE0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v3, 1, v5);
  uint64_t v7 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 48) = (EnumTagSinglePayload != 1) & v2;
  *(void *)(inited + 72) = v7;
  *(void *)(inited + 80) = 0x73696C6261747365;
  *(void *)(inited + 88) = 0xEF656D614E646568;
  sub_25C8B4804(v3, v1);
  int v8 = __swift_getEnumTagSinglePayload(v1, 1, v5);
  uint64_t v9 = *(void *)(v0 + 200);
  if (v8 == 1)
  {
    uint64_t v10 = MEMORY[0x263F8D310];
    sub_25C89F4B0(*(void *)(v0 + 200), &qword_26A5D9D78);
    *(void *)(inited + 120) = v10;
    *(void *)(inited + 96) = 0;
    *(void *)(inited + 104) = 0xE000000000000000;
  }
  else
  {
    *(void *)(v0 + 168) = v5;
    boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm((uint64_t *)(v0 + 144));
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(boxed_opaque_existential_1Tm, v9, v5);
    sub_25C8B48D0((_OWORD *)(v0 + 144), (_OWORD *)(inited + 96));
  }
  *(void *)(v0 + 208) = sub_25C8EC130();
  OUTLINED_FUNCTION_5_4();
  swift_task_alloc();
  OUTLINED_FUNCTION_20();
  *(void *)(v0 + 216) = v12;
  *uint64_t v12 = v13;
  v12[1] = sub_25C8B45CC;
  OUTLINED_FUNCTION_8_1();
  return sub_25C8CFE1C(v14, v15, v16, v17);
}

uint64_t sub_25C8B45CC()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v6 = v5;
  *(void *)(v3 + 224) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_15();
    return MEMORY[0x270FA2498](v7, v8, v9);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    OUTLINED_FUNCTION_15_2();
    return v10();
  }
}

uint64_t sub_25C8B46D8()
{
  OUTLINED_FUNCTION_6_1();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  return v0();
}

uint64_t sub_25C8B473C(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_25C8B4774()
{
  unint64_t result = qword_26A5D9D18;
  if (!qword_26A5D9D18)
  {
    sub_25C8EB020();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A5D9D18);
  }
  return result;
}

unint64_t sub_25C8B47C4()
{
  unint64_t result = qword_26A5DA600;
  if (!qword_26A5DA600)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A5DA600);
  }
  return result;
}

uint64_t sub_25C8B4804(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9D78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1Tm(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

_OWORD *sub_25C8B48D0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t OUTLINED_FUNCTION_2_2(uint64_t a1)
{
  return MEMORY[0x270FA2498](a1, 0, 0);
}

void *OUTLINED_FUNCTION_5_4()
{
  return __swift_project_boxed_opaque_existential_1(v0, v0[3]);
}

uint64_t OUTLINED_FUNCTION_10_3()
{
  return swift_task_alloc();
}

void *OUTLINED_FUNCTION_11_2()
{
  return __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 24), *(void *)(*(void *)(v0 + 24) + 24));
}

uint64_t OUTLINED_FUNCTION_13_2(uint64_t result)
{
  *(void *)(v1 + 56) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_15_2()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_17_2(uint64_t result)
{
  *(void *)(v1 + 128) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_18_1(uint64_t result)
{
  *(void *)(v1 + 120) = result;
  return result;
}

__n128 *OUTLINED_FUNCTION_19_1(__n128 *result, __n128 a2)
{
  result[1] = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_20_1@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 + 72) = a2;
  *(unsigned char *)(v2 + 48) = result & 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_21_1@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a1 + 32) = v2;
  *(void *)(a1 + 40) = (a2 - 32) | 0x8000000000000000;
  return sub_25C8BD9A8();
}

uint64_t OUTLINED_FUNCTION_22_0(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return sub_25C8EB740();
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  return v0;
}

id sub_25C8B4A6C(void *a1)
{
  void (*v11)(uint64_t *__return_ptr, char *);
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  uint64_t v22;
  void *v23;
  uint64_t v25;
  char v26;

  sub_25C8EC0F0();
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_4_0();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9D90);
  OUTLINED_FUNCTION_0_2();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_4_0();
  uint64_t v9 = v8 - v7;
  id v10 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for UserIdentifyIntent()), sel_init);
  sub_25C8EBE60();
  uint64_t v11 = (void (*)(uint64_t *__return_ptr, char *))sub_25C8EBE70();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
  uint64_t v12 = a1[3];
  uint64_t v13 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v12);
  uint64_t v26 = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 48))(v12, v13);
  v11(&v25, &v26);
  swift_release();
  objc_msgSend(v10, sel_setCaseType_, v25);
  type metadata accessor for Identity();
  uint64_t v14 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v15 = sub_25C8B5100(0, 0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v16 = OUTLINED_FUNCTION_2_3();
  v17(v16);
  if (v18)
  {
    uint64_t v19 = (void *)sub_25C8EC160();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v19 = 0;
  }
  objc_msgSend(v15, sel_setName_, v19);

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v20 = OUTLINED_FUNCTION_2_3();
  v21(v20);
  if (v22)
  {
    unint64_t v23 = (void *)sub_25C8EC160();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v23 = 0;
  }
  objc_msgSend(v15, sel_setNegativeName_, v23);

  objc_msgSend(v10, sel_setIdentity_, v15);
  return v10;
}

id sub_25C8B4E38(void *a1)
{
  uint64_t v2 = sub_25C8EC0F0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_4_0();
  uint64_t v8 = v7 - v6;
  id v9 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SwitchProfileIntent()), sel_init);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v10 = OUTLINED_FUNCTION_3_2();
  uint64_t v12 = v11(v10);
  if (v13)
  {
    sub_25C8B5194(v12, v13, v9);
    swift_bridgeObjectRelease();
    uint64_t v14 = 2;
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    uint64_t v15 = OUTLINED_FUNCTION_3_2();
    uint64_t v14 = v16(v15) & 1;
  }
  if (qword_26A5D95B0 != -1) {
    swift_once();
  }
  uint64_t v17 = __swift_project_value_buffer(v2, (uint64_t)qword_26A5DD5B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v8, v17, v2);
  int v18 = sub_25C8EC0D0();
  os_log_type_t v19 = sub_25C8EC2D0();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    id v26 = v9;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v27 = v21;
    *(_DWORD *)uint64_t v20 = 136315138;
    uint64_t v22 = SwitchType.description.getter();
    sub_25C8BB4F0(v22, v23, &v27);
    sub_25C8EC360();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C89B000, v18, v19, "Setting switchType with %s", v20, 0xCu);
    swift_arrayDestroy();
    uint64_t v24 = v21;
    id v9 = v26;
    MEMORY[0x261198330](v24, -1, -1);
    MEMORY[0x261198330](v20, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v2);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v2);
  }
  objc_msgSend(v9, sel_setSwitchType_, v14);
  return v9;
}

id sub_25C8B5100(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = (void *)sub_25C8EC160();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t v4 = (void *)sub_25C8EC160();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v2, sel_initWithIdentifier_displayString_, v3, v4);

  return v5;
}

void sub_25C8B5194(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_25C8EC160();
  objc_msgSend(a3, sel_setName_, v4);
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return v0;
}

uint64_t sub_25C8B5214()
{
  type metadata accessor for Globals();
  memset(v2, 0, sizeof(v2));
  uint64_t v3 = 0;
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_25C8B52A0((uint64_t)v2);
  qword_26A5DD528 = v0;
  return result;
}

uint64_t sub_25C8B5268()
{
  int v1 = *(unsigned __int8 *)(v0 + 56);
  if (v1 != 2) {
    return v1 & 1;
  }
  uint64_t result = os_variant_has_internal_ui();
  *(unsigned char *)(v0 + 56) = result;
  return result;
}

uint64_t sub_25C8B52A0(uint64_t a1)
{
  *(unsigned char *)(v1 + 56) = 2;
  *(void *)(v1 + 64) = 0xD000000000000023;
  *(void *)(v1 + 72) = 0x800000025C8F0830;
  *(void *)(v1 + 80) = 0xD00000000000003BLL;
  *(void *)(v1 + 88) = 0x800000025C8F0860;
  *(void *)(v1 + 96) = 0xD000000000000030;
  *(void *)(v1 + 104) = 0x800000025C8F08A0;
  *(void *)(v1 + 112) = 0xD00000000000003DLL;
  *(void *)(v1 + 120) = 0x800000025C8F08E0;
  sub_25C8B5428(a1, (uint64_t)&v4);
  if (v5)
  {
    sub_25C8B5490(a1);
    sub_25C8A4290(&v4, (uint64_t)&v6);
  }
  else
  {
    uint64_t v7 = &type metadata for DarwinProvider;
    uint64_t v8 = &off_2709EFB28;
    sub_25C8B5490(a1);
    sub_25C8B5490((uint64_t)&v4);
  }
  sub_25C8A4290(&v6, v1 + 16);
  return v1;
}

uint64_t sub_25C8B5390()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25C8B53D0()
{
  sub_25C8B5390();
  return MEMORY[0x270FA0228](v0, 128, 7);
}

uint64_t type metadata accessor for Globals()
{
  return self;
}

uint64_t sub_25C8B5428(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9CA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C8B5490(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9CA0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for DarwinProvider()
{
  return &type metadata for DarwinProvider;
}

uint64_t sub_25C8B5500()
{
  type metadata accessor for FLOWSchemaFLOWProfileSwitchMethod(0);
  sub_25C8B5AD4();
  uint64_t result = sub_25C8EC130();
  qword_26A5DD530 = result;
  return result;
}

uint64_t sub_25C8B5550()
{
  type metadata accessor for FLOWSchemaFLOWProfileSwitchByNameType(0);
  sub_25C8B5B20();
  uint64_t result = sub_25C8EC130();
  qword_26A5DD538 = result;
  return result;
}

NSObject *sub_25C8B55A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v46 = a4;
  uint64_t v7 = sub_25C8EC0F0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v45 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v45 - v15;
  uint64_t v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DC00]), sel_init);
  if (!v17)
  {
    if (qword_26A5D95A0 != -1) {
      uint64_t v17 = swift_once();
    }
    OUTLINED_FUNCTION_0_6((uint64_t)v17, (uint64_t)qword_26A5DD588);
    OUTLINED_FUNCTION_1_6();
    v27();
    uint64_t v28 = sub_25C8EC0D0();
    os_log_type_t v29 = sub_25C8EC2D0();
    if (os_log_type_enabled(v28, v29))
    {
      int v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v30 = 0;
      _os_log_impl(&dword_25C89B000, v28, v29, "#FlowLogIdentityContextUtils returning with nil domainContext", v30, 2u);
      MEMORY[0x261198330](v30, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    return 0;
  }
  int v18 = v17;
  os_log_type_t v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DC58]), sel_init);
  if (!v19)
  {
    if (qword_26A5D95A0 != -1) {
      os_log_type_t v19 = swift_once();
    }
    OUTLINED_FUNCTION_0_6((uint64_t)v19, (uint64_t)qword_26A5DD588);
    OUTLINED_FUNCTION_1_6();
    v31();
    uint64_t v32 = sub_25C8EC0D0();
    os_log_type_t v33 = sub_25C8EC2D0();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v34 = 0;
      _os_log_impl(&dword_25C89B000, v32, v33, "#FlowLogIdentityContextUtils returning with nil identityDomainContext", v34, 2u);
      MEMORY[0x261198330](v34, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v14, v7);
    return 0;
  }
  uint64_t v20 = v19;
  id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DCA8]), sel_init);
  if (!v21)
  {
    if (qword_26A5D95A0 != -1) {
      id v21 = (id)swift_once();
    }
    OUTLINED_FUNCTION_0_6((uint64_t)v21, (uint64_t)qword_26A5DD588);
    OUTLINED_FUNCTION_1_6();
    v35();
    uint64_t v36 = sub_25C8EC0D0();
    os_log_type_t v37 = sub_25C8EC2D0();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v38 = 0;
      _os_log_impl(&dword_25C89B000, v36, v37, "#FlowLogIdentityContextUtils returning with nil profileSwitchContext", v38, 2u);
      MEMORY[0x261198330](v38, -1, -1);
      uint64_t v39 = v20;
    }
    else
    {
      uint64_t v39 = v36;
      uint64_t v36 = v18;
      int v18 = v20;
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v16, v7);
    return 0;
  }
  uint64_t v22 = v21;
  if (a1 != 4)
  {
    if (qword_26A5D9548 != -1) {
      swift_once();
    }
    uint64_t v23 = qword_26A5DD530;
    if (*(void *)(qword_26A5DD530 + 16) && (uint64_t v24 = sub_25C8E7344(a1), (v25 & 1) != 0)) {
      uint64_t v26 = *(unsigned int *)(*(void *)(v23 + 56) + 4 * v24);
    }
    else {
      uint64_t v26 = 0;
    }
    objc_msgSend(v22, sel_setProfileSwitchMethod_, v26);
  }
  if ((a3 & 0x100000000) == 0) {
    objc_msgSend(v22, sel_setProfileSwitchOutcome_, a3);
  }
  if ((v46 & 0x100000000) == 0) {
    objc_msgSend(v22, sel_setProfileSwitchFailureReason_);
  }
  if (a2 != 3)
  {
    if (qword_26A5D9550 != -1) {
      swift_once();
    }
    uint64_t v40 = qword_26A5DD538;
    if (*(void *)(qword_26A5DD538 + 16) && (uint64_t v41 = sub_25C8E7344(a2), (v42 & 1) != 0)) {
      uint64_t v43 = *(unsigned int *)(*(void *)(v40 + 56) + 4 * v41);
    }
    else {
      uint64_t v43 = 0;
    }
    objc_msgSend(v22, sel_setProfileSwitchByNameType_, v43);
  }
  [v20 setProfileSwitchContext:v22];
  [v18 setIdentityContext:v20];

  return v18;
}

unint64_t sub_25C8B5AD4()
{
  unint64_t result = qword_26A5D9D98;
  if (!qword_26A5D9D98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5D9D98);
  }
  return result;
}

unint64_t sub_25C8B5B20()
{
  unint64_t result = qword_26A5D9DA0;
  if (!qword_26A5D9DA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5D9DA0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_6(uint64_t a1, uint64_t a2)
{
  return __swift_project_value_buffer(v2, a2);
}

const char *sub_25C8B5BA4()
{
  return "SiriIdentity";
}

const char *sub_25C8B5BB8(char a1)
{
  if (a1) {
    return "cross_device_switch_profile";
  }
  else {
    return "switch_profile";
  }
}

BOOL sub_25C8B5BE4(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_25C8B5BF4()
{
  return sub_25C8EC600();
}

uint64_t sub_25C8B5C1C()
{
  return sub_25C8EC610();
}

BOOL sub_25C8B5C64(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25C8B5BE4(*a1, *a2);
}

uint64_t sub_25C8B5C70()
{
  return sub_25C8B5C1C();
}

uint64_t sub_25C8B5C78()
{
  return sub_25C8B5BF4();
}

const char *sub_25C8B5C80()
{
  return sub_25C8B5BA4();
}

const char *sub_25C8B5C88()
{
  return sub_25C8B5BB8(*v0);
}

Swift::Bool __swiftcall IdentityFeatureFlagsProvider.isSwitchProfileEnabled()()
{
  return sub_25C8B5CF0(0);
}

unint64_t sub_25C8B5C9C()
{
  unint64_t result = qword_26A5D9DA8;
  if (!qword_26A5D9DA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5D9DA8);
  }
  return result;
}

Swift::Bool __swiftcall IdentityFeatureFlagsProvider.isCrossDeviceSwitchProfileEnabled()()
{
  return sub_25C8B5CF0(1);
}

uint64_t sub_25C8B5CF0(char a1)
{
  uint64_t v5 = &type metadata for IdentityFeatures;
  unint64_t v6 = sub_25C8B5C9C();
  v4[0] = a1;
  char v2 = sub_25C8EB9B0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  return v2 & 1;
}

ValueMetadata *type metadata accessor for IdentityFeatureFlagsProvider()
{
  return &type metadata for IdentityFeatureFlagsProvider;
}

uint64_t getEnumTagSinglePayload for IdentityFeatures(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for IdentityFeatures(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25C8B5EB4);
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

unsigned char *sub_25C8B5EDC(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for IdentityFeatures()
{
  return &type metadata for IdentityFeatures;
}

unint64_t sub_25C8B5EFC()
{
  unint64_t result = qword_26A5D9DB0;
  if (!qword_26A5D9DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5D9DB0);
  }
  return result;
}

id SwitchProfileIntentHandler.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

uint64_t sub_25C8B5F7C(uint64_t a1, void *a2)
{
  uint64_t v5 = type metadata accessor for UserAccount();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = &v19[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9)
  {
    uint64_t v18 = v2;
    uint64_t v21 = MEMORY[0x263F8EE78];
    sub_25C8EC430();
    uint64_t v10 = a1 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    uint64_t v11 = (uint64_t)a2 + OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_pbAccess;
    uint64_t v12 = *(void *)(v6 + 72);
    do
    {
      sub_25C8BC154(v10, (uint64_t)v8, (void (*)(void))type metadata accessor for UserAccount);
      sub_25C8A7E98(v11, (uint64_t)v19);
      uint64_t v13 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v19, v20);
      MEMORY[0x270FA5388](v13);
      (*(void (**)(unsigned char *))(v15 + 16))(&v19[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0) - 8]);
      sub_25C8B061C();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
      sub_25C8EC410();
      sub_25C8EC440();
      sub_25C8EC450();
      sub_25C8EC420();
      v10 += v12;
      --v9;
    }
    while (v9);
    uint64_t v16 = v21;
  }
  else
  {

    return MEMORY[0x263F8EE78];
  }
  return v16;
}

uint64_t sub_25C8B61C0(void (*a1)(uint64_t *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v6)
  {
    uint64_t v13 = MEMORY[0x263F8EE78];
    sub_25C8EC430();
    uint64_t v9 = *(void *)(type metadata accessor for UserAccount() - 8);
    uint64_t v10 = a3 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    while (1)
    {
      a1(&v12, v10);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      sub_25C8EC410();
      sub_25C8EC440();
      sub_25C8EC450();
      sub_25C8EC420();
      v10 += v11;
      if (!--v6) {
        return v13;
      }
    }
    return swift_release();
  }
  return result;
}

id SwitchProfileIntentHandler.init()()
{
  if (qword_26A5D9560 != -1) {
    swift_once();
  }
  sub_25C8A7E98((uint64_t)qword_26A5DD560, (uint64_t)v9);
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F28560]), sel_init);
  type metadata accessor for AssistantServicesProvider();
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = v0;
  sub_25C8EB320();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v9, v10);
  OUTLINED_FUNCTION_1_4();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (uint64_t *)&v8[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(uint64_t *))(v5 + 16))(v4);
  id v6 = sub_25C8BBDFC(*v4, v1, (uint64_t)v8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v6;
}

id static SwitchProfileIntentHandler.handlerForIntentExtension()()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for SwitchProfileIntentHandler());
  return objc_msgSend(v0, sel_init);
}

uint64_t SwitchProfileIntentHandler.resolveAccount(for:)()
{
  OUTLINED_FUNCTION_6_1();
  v1[17] = v2;
  v1[18] = v0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9DC0);
  OUTLINED_FUNCTION_19(v3);
  v1[19] = OUTLINED_FUNCTION_13();
  uint64_t v4 = sub_25C8EB490();
  v1[20] = v4;
  OUTLINED_FUNCTION_1_2(v4);
  v1[21] = v5;
  v1[22] = OUTLINED_FUNCTION_13();
  uint64_t v6 = sub_25C8EC0F0();
  v1[23] = v6;
  OUTLINED_FUNCTION_1_2(v6);
  v1[24] = v7;
  v1[25] = OUTLINED_FUNCTION_11_1();
  v1[26] = swift_task_alloc();
  v1[27] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for Signpost.OpenSignpost();
  v1[28] = v8;
  OUTLINED_FUNCTION_19(v8);
  v1[29] = OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_25C8B65E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_21_2();
  OUTLINED_FUNCTION_44();
  if (qword_26A5D9538 != -1) {
    swift_once();
  }
  uint64_t v14 = *(void *)(v12 + 224);
  uint64_t v13 = *(void *)(v12 + 232);
  id v15 = (id)qword_26A5D9BE0;
  sub_25C8EC0B0();
  sub_25C8EC310();
  OUTLINED_FUNCTION_37_0();
  uint64_t v16 = *(int *)(v14 + 20);
  *(_DWORD *)(v12 + 344) = v16;
  uint64_t v17 = v13 + v16;
  *(void *)uint64_t v17 = "SwitchProfileIntentResolve";
  *(void *)(v17 + 8) = 26;
  uint64_t v54 = v17;
  *(_WORD *)(v17 + 16) = 2;
  if (qword_26A5D95B8 != -1) {
    swift_once();
  }
  uint64_t v18 = *(void *)(v12 + 216);
  uint64_t v19 = *(void *)(v12 + 184);
  uint64_t v20 = *(void *)(v12 + 192);
  uint64_t v21 = __swift_project_value_buffer(v19, (uint64_t)qword_26A5DD5D0);
  *(void *)(v12 + 240) = v21;
  uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16);
  *(void *)(v12 + 248) = v22;
  *(void *)(v12 + 256) = (v20 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v22(v18, v21, v19);
  uint64_t v23 = (void *)sub_25C8EC0D0();
  os_log_type_t v24 = sub_25C8EC2D0();
  if (OUTLINED_FUNCTION_13_0(v24))
  {
    char v25 = (_WORD *)OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_38_0(v25);
    OUTLINED_FUNCTION_49(&dword_25C89B000, v26, v27, "SwitchProfileIntentHandler.resolveAccount");
    OUTLINED_FUNCTION_3();
  }
  uint64_t v28 = *(void *)(v12 + 192);
  os_log_type_t v29 = *(void **)(v12 + 136);

  int v30 = *(void (**)(uint64_t))(v28 + 8);
  *(void *)(v12 + 264) = v30;
  *(void *)(v12 + 272) = (v28 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  uint64_t v31 = OUTLINED_FUNCTION_51();
  v30(v31);
  id v32 = objc_msgSend(v29, sel_account);
  if (v32)
  {
    os_log_type_t v33 = v32;
    sub_25C8BBCC0(v32, (SEL *)&selRef_profileId);
    uint64_t v35 = v34;
    swift_bridgeObjectRelease();
    if (v35)
    {
      v22(*(void *)(v12 + 208), v21, *(void *)(v12 + 184));
      uint64_t v36 = sub_25C8EC0D0();
      os_log_type_t v37 = sub_25C8EC2C0();
      if (OUTLINED_FUNCTION_23(v37))
      {
        uint64_t v38 = (_WORD *)OUTLINED_FUNCTION_5_0();
        OUTLINED_FUNCTION_38_0(v38);
        OUTLINED_FUNCTION_35(&dword_25C89B000, v36, v39, "Intent has account with profileId, returning success");
        OUTLINED_FUNCTION_3();
      }
      uint64_t v40 = *(void *)(v12 + 232);
      uint64_t v41 = *(void *)(v12 + 208);
      uint64_t v42 = *(void *)(v12 + 184);

      ((void (*)(uint64_t, uint64_t))v30)(v41, v42);
      type metadata accessor for SwitchProfileAccountResolutionResult();
      static AccountResolutionResult.success(with:)((uint64_t)v33);

      sub_25C8EC300();
      sub_25C8EC0A0();
      OUTLINED_FUNCTION_8_2();
      sub_25C8BC1B0(v40, (void (*)(void))type metadata accessor for Signpost.OpenSignpost);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      OUTLINED_FUNCTION_4_5();
      OUTLINED_FUNCTION_6_3();
      return v45(v43, v44, v45, v46, v47, v48, v49, v50, v54, a10, a11, a12);
    }
  }
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v12 + 144)+ OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_assistantServices), *(void *)(*(void *)(v12 + 144)+ OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_assistantServices+ 24));
  uint64_t v52 = (void *)swift_task_alloc();
  *(void *)(v12 + 280) = v52;
  *uint64_t v52 = v12;
  v52[1] = sub_25C8B6978;
  OUTLINED_FUNCTION_6_3();
  return sub_25C89D77C();
}

uint64_t sub_25C8B6978()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_4();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 288) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C8B6A48()
{
  uint64_t v1 = *(uint8_t **)(v0 + 288);
  sub_25C8A7E98(*(void *)(v0 + 144) + OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_pbAccess, v0 + 88);
  sub_25C8AE3AC();
  if (!*(void *)(*(void *)(v0 + 56) + 16))
  {
    (*(void (**)(void, void, void))(v0 + 248))(*(void *)(v0 + 200), *(void *)(v0 + 240), *(void *)(v0 + 184));
    uint64_t v6 = sub_25C8EC0D0();
    os_log_type_t v7 = sub_25C8EC2E0();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (_WORD *)OUTLINED_FUNCTION_5_0();
      OUTLINED_FUNCTION_27(v8);
      _os_log_impl(&dword_25C89B000, v6, v7, "No accounts found.", v1, 2u);
      OUTLINED_FUNCTION_3();
    }
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v0 + 264);
    uint64_t v10 = *(void *)(v0 + 200);
    uint64_t v11 = *(void *)(v0 + 184);
    uint64_t v12 = *(void *)(v0 + 168);
    uint64_t v23 = *(void *)(v0 + 176);
    uint64_t v24 = *(void *)(v0 + 160);
    uint64_t v13 = *(void *)(v0 + 144);
    id v25 = *(id *)(v0 + 136);
    uint64_t v26 = *(void *)(v0 + 152);

    v9(v10, v11);
    __swift_project_boxed_opaque_existential_1((void *)(v13 + OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_siriKitEventSender), *(void *)(v13 + OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_siriKitEventSender + 24));
    sub_25C8EB400();
    (*(void (**)(uint64_t, void, uint64_t))(v12 + 104))(v23, *MEMORY[0x263F6F948], v24);
    id v14 = objc_msgSend(v25, sel_typeName);
    sub_25C8EC170();

    uint64_t v15 = sub_25C8EB3A0();
    __swift_storeEnumTagSinglePayload(v26, 1, 1, v15);
    sub_25C8EB3F0();
    sub_25C8EB330();
    swift_release();
    type metadata accessor for SwitchProfileAccountResolutionResult();
    static SwitchProfileAccountResolutionResult.unsupported(forReason:)(2);
    sub_25C8BBFF8(v0 + 16);
    sub_25C8EC300();
    sub_25C8EC0A0();
    OUTLINED_FUNCTION_8_2();
    sub_25C8BC1B0(v26, (void (*)(void))type metadata accessor for Signpost.OpenSignpost);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_4_5();
    OUTLINED_FUNCTION_10_4();
    __asm { BRAA            X2, X16 }
  }
  id v2 = objc_msgSend(*(id *)(v0 + 136), sel_switchType);
  if (v2 == (id)2)
  {
    uint64_t v18 = (void *)swift_task_alloc();
    *(void *)(v0 + 312) = v18;
    *uint64_t v18 = v0;
    v18[1] = sub_25C8B7080;
    OUTLINED_FUNCTION_45();
    OUTLINED_FUNCTION_10_4();
    return sub_25C8B9D38();
  }
  else if (v2 == (id)1)
  {
    uint64_t v20 = (void *)swift_task_alloc();
    *(void *)(v0 + 328) = v20;
    *uint64_t v20 = v0;
    v20[1] = sub_25C8B7234;
    OUTLINED_FUNCTION_45();
    OUTLINED_FUNCTION_10_4();
    return sub_25C8B8254();
  }
  else if (v2)
  {
    *(void *)(v0 + 128) = v2;
    OUTLINED_FUNCTION_10_4();
    return MEMORY[0x270F9FA68]();
  }
  else
  {
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 296) = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_25C8B6ECC;
    OUTLINED_FUNCTION_10_4();
    return sub_25C8BAD08();
  }
}

uint64_t sub_25C8B6ECC()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_4();
  *id v2 = v1;
  *id v2 = *v0;
  *(void *)(v1 + 304) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C8B6F9C()
{
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_22_1();
  sub_25C8EC300();
  sub_25C8EC0A0();
  OUTLINED_FUNCTION_8_2();
  sub_25C8BC1B0(v0, (void (*)(void))type metadata accessor for Signpost.OpenSignpost);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = OUTLINED_FUNCTION_4_5();
  return v2(v1);
}

uint64_t sub_25C8B7080()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_4();
  *id v2 = v1;
  *id v2 = *v0;
  *(void *)(v1 + 320) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C8B7150()
{
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_22_1();
  sub_25C8EC300();
  sub_25C8EC0A0();
  OUTLINED_FUNCTION_8_2();
  sub_25C8BC1B0(v0, (void (*)(void))type metadata accessor for Signpost.OpenSignpost);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = OUTLINED_FUNCTION_4_5();
  return v2(v1);
}

uint64_t sub_25C8B7234()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_4();
  *id v2 = v1;
  *id v2 = *v0;
  *(void *)(v1 + 336) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C8B7304()
{
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_22_1();
  sub_25C8EC300();
  sub_25C8EC0A0();
  OUTLINED_FUNCTION_8_2();
  sub_25C8BC1B0(v0, (void (*)(void))type metadata accessor for Signpost.OpenSignpost);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = OUTLINED_FUNCTION_4_5();
  return v2(v1);
}

uint64_t sub_25C8B73E8()
{
  return sub_25C8EB3E0();
}

uint64_t sub_25C8B745C(void *a1, void *aBlock, void *a3)
{
  void v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  a3;
  os_log_type_t v7 = (void *)swift_task_alloc();
  v3[5] = v7;
  void *v7 = v3;
  v7[1] = sub_25C8B7520;
  return SwitchProfileIntentHandler.resolveAccount(for:)();
}

uint64_t sub_25C8B7520()
{
  OUTLINED_FUNCTION_12_1();
  id v2 = v1;
  OUTLINED_FUNCTION_2_1();
  uint64_t v4 = (const void *)v3[4];
  uint64_t v5 = (void *)v3[3];
  id v6 = (void *)v3[2];
  uint64_t v7 = *v0;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v8 = v7;
  swift_task_dealloc();

  uint64_t v9 = OUTLINED_FUNCTION_47();
  v10(v9);
  _Block_release(v4);

  uint64_t v11 = *(uint64_t (**)(void))(v7 + 8);
  return v11();
}

uint64_t SwitchProfileIntentHandler.confirm(intent:)()
{
  OUTLINED_FUNCTION_6_1();
  uint64_t v1 = sub_25C8EC0F0();
  v0[2] = v1;
  OUTLINED_FUNCTION_1_2(v1);
  v0[3] = v2;
  v0[4] = OUTLINED_FUNCTION_13();
  uint64_t v3 = type metadata accessor for Signpost.OpenSignpost();
  v0[5] = v3;
  OUTLINED_FUNCTION_19(v3);
  v0[6] = OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C8B7700()
{
  OUTLINED_FUNCTION_33_0();
  if (qword_26A5D9538 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v1 = *(void *)(v0 + 48);
  id v3 = (id)qword_26A5D9BE0;
  sub_25C8EC0B0();
  sub_25C8EC310();
  uint64_t v4 = OUTLINED_FUNCTION_37_0();
  uint64_t v5 = v1 + *(int *)(v2 + 20);
  *(void *)uint64_t v5 = "SwitchProfileIntentConfirm";
  *(void *)(v5 + 8) = 26;
  *(_WORD *)(v5 + 16) = 2;
  if (qword_26A5D95B8 != -1) {
    uint64_t v4 = swift_once();
  }
  uint64_t v6 = OUTLINED_FUNCTION_16_3(v4, (uint64_t)qword_26A5DD5D0);
  v7(v6);
  uint64_t v8 = (void *)sub_25C8EC0D0();
  os_log_type_t v9 = sub_25C8EC2D0();
  if (OUTLINED_FUNCTION_23(v9))
  {
    uint64_t v10 = (_WORD *)OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_27(v10);
    OUTLINED_FUNCTION_21(&dword_25C89B000, v11, v12, "SwitchProfileIntentHandler.confirm");
    OUTLINED_FUNCTION_3();
  }
  uint64_t v13 = *(void *)(v0 + 48);

  uint64_t v14 = OUTLINED_FUNCTION_36_0();
  v15(v14);
  id v16 = objc_allocWithZone((Class)type metadata accessor for SwitchProfileIntentResponse());
  SwitchProfileIntentResponse.init(code:userActivity:)(1, 0);
  sub_25C8EC300();
  sub_25C8EC0A0();
  sub_25C8BC1B0(v13, (void (*)(void))type metadata accessor for Signpost.OpenSignpost);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = OUTLINED_FUNCTION_4_5();
  return v18(v17);
}

uint64_t sub_25C8B7914(void *a1, void *aBlock, void *a3)
{
  void v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  id v7 = a3;
  uint64_t v8 = (void *)swift_task_alloc();
  v3[5] = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_25C8BD6AC;
  return SwitchProfileIntentHandler.confirm(intent:)();
}

uint64_t SwitchProfileIntentHandler.handle(intent:)()
{
  OUTLINED_FUNCTION_6_1();
  v0[4] = v1;
  uint64_t v2 = sub_25C8EC0F0();
  v0[5] = v2;
  OUTLINED_FUNCTION_1_2(v2);
  v0[6] = v3;
  v0[7] = OUTLINED_FUNCTION_11_1();
  v0[8] = swift_task_alloc();
  v0[9] = swift_task_alloc();
  v0[10] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for Signpost.OpenSignpost();
  v0[11] = v4;
  OUTLINED_FUNCTION_19(v4);
  v0[12] = OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_25C8B7AA0()
{
  uint64_t v51 = v0;
  if (qword_26A5D9538 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 88);
  uint64_t v1 = *(void *)(v0 + 96);
  id v3 = (id)qword_26A5D9BE0;
  sub_25C8EC0B0();
  sub_25C8EC310();
  sub_25C8EC0A0();
  uint64_t v4 = v1 + *(int *)(v2 + 20);
  *(void *)uint64_t v4 = "SwitchProfileIntentHandle";
  *(void *)(v4 + 8) = 25;
  *(_WORD *)(v4 + 16) = 2;
  if (qword_26A5D95B8 != -1) {
    swift_once();
  }
  uint64_t v5 = *(void *)(v0 + 48);
  __swift_project_value_buffer(*(void *)(v0 + 40), (uint64_t)qword_26A5DD5D0);
  uint64_t v6 = *(void (**)(void))(v5 + 16);
  OUTLINED_FUNCTION_6_0();
  v6();
  uint64_t v7 = sub_25C8EC0D0();
  os_log_type_t v8 = sub_25C8EC2D0();
  if (OUTLINED_FUNCTION_23(v8))
  {
    uint64_t v9 = (_WORD *)OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_38_0(v9);
    OUTLINED_FUNCTION_35(&dword_25C89B000, v7, v10, "SwitchProfileIntentHandler.handle()");
    OUTLINED_FUNCTION_3();
  }
  uint64_t v11 = *(void **)(v0 + 32);
  uint64_t v12 = *(void *)(v0 + 80);
  uint64_t v13 = *(void *)(v0 + 40);
  uint64_t v14 = *(void *)(v0 + 48);

  uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
  v15(v12, v13);
  id v16 = objc_msgSend(v11, sel_account);
  if (v16)
  {
    uint64_t v17 = v16;
    sub_25C8BBCC0(v16, (SEL *)&selRef_profileId);
    if (v18)
    {
      id v19 = objc_msgSend(v17, sel_isActive);
      sub_25C8BC04C();
      uint64_t v20 = (void *)sub_25C8EC320();
      uint64_t v21 = v20;
      if (v19)
      {
        id v22 = v19;
        char v23 = sub_25C8EC330();

        if (v23)
        {
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_6_0();
          v6();
          id v24 = v17;
          id v25 = sub_25C8EC0D0();
          os_log_type_t v26 = sub_25C8EC2E0();
          if (os_log_type_enabled(v25, v26))
          {
            os_log_type_t type = v26;
            uint64_t v27 = (uint8_t *)OUTLINED_FUNCTION_8_0();
            uint64_t v50 = OUTLINED_FUNCTION_10_1();
            *(_DWORD *)uint64_t v27 = 136315138;
            id v28 = objc_msgSend(v24, sel_displayString);
            uint64_t v29 = sub_25C8EC170();
            unint64_t v31 = v30;

            *(void *)(v0 + 24) = sub_25C8BB4F0(v29, v31, &v50);
            sub_25C8EC360();
            swift_bridgeObjectRelease();

            _os_log_impl(&dword_25C89B000, v25, type, "Account is already active for name[%s]", v27, 0xCu);
            swift_arrayDestroy();
            OUTLINED_FUNCTION_3();
            OUTLINED_FUNCTION_3();
          }
          else
          {
          }
          OUTLINED_FUNCTION_11_0();
          v44();
          id v45 = objc_allocWithZone((Class)type metadata accessor for SwitchProfileIntentResponse());
          SwitchProfileIntentResponse.init(code:userActivity:)(101, 0);

LABEL_32:
          sub_25C8EC300();
          sub_25C8EC0A0();
          sub_25C8BC1B0(*(void *)(v0 + 96), (void (*)(void))type metadata accessor for Signpost.OpenSignpost);
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          OUTLINED_FUNCTION_4_5();
          OUTLINED_FUNCTION_10_4();
          __asm { BRAA            X2, X16 }
        }
      }
      else
      {
      }
      swift_bridgeObjectRelease();
      id v43 = objc_allocWithZone((Class)type metadata accessor for SwitchProfileIntentResponse());
      SwitchProfileIntentResponse.init(code:userActivity:)(5, 0);

      goto LABEL_32;
    }
  }
  id v32 = objc_msgSend(*(id *)(v0 + 32), sel_switchType);
  if (!v32)
  {
LABEL_27:
    id v42 = objc_allocWithZone((Class)type metadata accessor for SwitchProfileIntentResponse());
    SwitchProfileIntentResponse.init(code:userActivity:)(100, 0);
    goto LABEL_32;
  }
  if (v32 == (id)2)
  {
    os_log_type_t v33 = v15;
    uint64_t v34 = (uint64_t *)(v0 + 56);
    OUTLINED_FUNCTION_6_0();
    v6();
    uint64_t v35 = sub_25C8EC0D0();
    os_log_type_t v36 = sub_25C8EC2D0();
    if (os_log_type_enabled(v35, v36))
    {
      os_log_type_t v37 = "Name not matched";
      goto LABEL_21;
    }
LABEL_25:
    uint64_t v38 = *v34;
    goto LABEL_26;
  }
  if (v32 == (id)1)
  {
    os_log_type_t v33 = v15;
    uint64_t v34 = (uint64_t *)(v0 + 64);
    OUTLINED_FUNCTION_6_0();
    v6();
    uint64_t v35 = sub_25C8EC0D0();
    os_log_type_t v36 = sub_25C8EC2D0();
    if (os_log_type_enabled(v35, v36))
    {
      os_log_type_t v37 = "ID not resolved";
LABEL_21:
      uint64_t v38 = *v34;
      uint64_t v39 = (uint8_t *)OUTLINED_FUNCTION_5_0();
      *(_WORD *)uint64_t v39 = 0;
      _os_log_impl(&dword_25C89B000, v35, v36, v37, v39, 2u);
      OUTLINED_FUNCTION_3();
LABEL_26:
      uint64_t v41 = *(void *)(v0 + 40);

      v33(v38, v41);
      goto LABEL_27;
    }
    goto LABEL_25;
  }
  *(void *)(v0 + 16) = v32;
  OUTLINED_FUNCTION_10_4();
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_25C8B8114(void *a1, int a2, void *a3, void *aBlock)
{
  uint64_t v6 = _Block_copy(aBlock);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = a1;
  id v8 = a3;
  id v9 = a1;
  uint64_t v10 = OUTLINED_FUNCTION_47();
  return sub_25C8DEFB8(v10, v11);
}

uint64_t sub_25C8B8194(void *a1, void *aBlock, void *a3)
{
  void v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  id v7 = a3;
  id v8 = (void *)swift_task_alloc();
  v3[5] = v8;
  *id v8 = v3;
  v8[1] = sub_25C8BD6AC;
  return SwitchProfileIntentHandler.handle(intent:)();
}

uint64_t sub_25C8B8254()
{
  OUTLINED_FUNCTION_6_1();
  v1[3] = v2;
  v1[4] = v0;
  v1[2] = v3;
  uint64_t v4 = sub_25C8EC0F0();
  v1[5] = v4;
  OUTLINED_FUNCTION_1_2(v4);
  v1[6] = v5;
  v1[7] = OUTLINED_FUNCTION_11_1();
  v1[8] = swift_task_alloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_25C8B82F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_21_2();
  OUTLINED_FUNCTION_44();
  if (qword_26A5D95B8 != -1) {
    swift_once();
  }
  uint64_t v13 = *(void *)(v12 + 64);
  uint64_t v14 = *(void *)(v12 + 40);
  uint64_t v15 = *(void *)(v12 + 48);
  uint64_t v16 = __swift_project_value_buffer(v14, (uint64_t)qword_26A5DD5D0);
  uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16);
  v17(v13, v16, v14);
  uint64_t v18 = (void *)sub_25C8EC0D0();
  os_log_type_t v19 = sub_25C8EC2D0();
  if (OUTLINED_FUNCTION_13_0(v19))
  {
    uint64_t v20 = (_WORD *)OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_38_0(v20);
    OUTLINED_FUNCTION_49(&dword_25C89B000, v21, v22, "Switch by voice ID");
    OUTLINED_FUNCTION_3();
  }
  uint64_t v23 = *(void *)(v12 + 48);
  id v24 = *(void **)(v12 + 16);

  id v25 = *(void (**)(void))(v23 + 8);
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_39_0();
  v25();
  uint64_t v26 = sub_25C8BBCC0(v24, (SEL *)&selRef_iCloudAltDSID);
  if (v27)
  {
    uint64_t v28 = v26;
    unint64_t v29 = v27;
    uint64_t v30 = *(void *)(v12 + 24);
    id v31 = objc_msgSend(*(id *)(v12 + 16), sel_typeName);
    uint64_t v32 = sub_25C8EC170();
    uint64_t v34 = v33;

    sub_25C8B889C(v28, v29, v32, v34, v30);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_4_5();
    OUTLINED_FUNCTION_6_3();
    return v37(v35, v36, v37, v38, v39, v40, v41, v42, a9, a10, a11, a12);
  }
  else
  {
    sub_25C8BBCC0(*(void **)(v12 + 16), (SEL *)&selRef_homeUserId);
    *(void *)(v12 + 7sub_25C8B55A0(4, 3, 2, 2) = v44;
    if (v44)
    {
      id v45 = objc_msgSend(*(id *)(v12 + 16), sel_typeName);
      sub_25C8EC170();
      uint64_t v47 = v46;

      *(void *)(v12 + 80) = v47;
      uint64_t v48 = (void *)swift_task_alloc();
      *(void *)(v12 + 88) = v48;
      *uint64_t v48 = v12;
      v48[1] = sub_25C8B8640;
      OUTLINED_FUNCTION_6_3();
      return sub_25C8B9118();
    }
    else
    {
      v17(*(void *)(v12 + 56), v16, *(void *)(v12 + 40));
      uint64_t v50 = (void *)sub_25C8EC0D0();
      os_log_type_t v51 = sub_25C8EC2D0();
      if (OUTLINED_FUNCTION_23(v51))
      {
        uint64_t v52 = (_WORD *)OUTLINED_FUNCTION_5_0();
        OUTLINED_FUNCTION_27(v52);
        OUTLINED_FUNCTION_21(&dword_25C89B000, v53, v54, "No UserID in switch by VoiceID");
        OUTLINED_FUNCTION_3();
      }

      OUTLINED_FUNCTION_39_0();
      v25();
      uint64_t v55 = (void *)swift_task_alloc();
      *(void *)(v12 + 96) = v55;
      *uint64_t v55 = v12;
      v55[1] = sub_25C8B8790;
      OUTLINED_FUNCTION_6_3();
      return sub_25C8B9A24();
    }
  }
}

uint64_t sub_25C8B8640()
{
  OUTLINED_FUNCTION_20_2();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v3 = v2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v2 + 8);
  return v4(v0);
}

uint64_t sub_25C8B8790()
{
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_20_2();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v3 = v2;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v2 + 8);
  return v4(v0);
}

id sub_25C8B889C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v81 = a5;
  uint64_t v73 = a4;
  uint64_t v79 = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9DC0);
  uint64_t v8 = OUTLINED_FUNCTION_19(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_24_1();
  OUTLINED_FUNCTION_32(v9);
  uint64_t v76 = sub_25C8EB490();
  OUTLINED_FUNCTION_1_4();
  uint64_t v75 = v10;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_24_1();
  uint64_t v77 = v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9CB0);
  uint64_t v14 = OUTLINED_FUNCTION_19(v13);
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_24_1();
  OUTLINED_FUNCTION_32(v15);
  uint64_t v16 = type metadata accessor for UserAccount();
  OUTLINED_FUNCTION_16();
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v71 = (uint64_t)&v65 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_32((uint64_t)&v65 - v20);
  uint64_t v21 = sub_25C8EC0F0();
  OUTLINED_FUNCTION_1_4();
  uint64_t v23 = v22;
  uint64_t v25 = MEMORY[0x270FA5388](v24);
  unint64_t v27 = (char *)&v65 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  unint64_t v29 = (char *)&v65 - v28;
  if (qword_26A5D95B8 != -1) {
    swift_once();
  }
  uint64_t v30 = __swift_project_value_buffer(v21, (uint64_t)qword_26A5DD5D0);
  id v31 = *(void (**)(char *, uint64_t, uint64_t))(v23 + 16);
  uint64_t v69 = v30;
  uint64_t v70 = v23 + 16;
  uint64_t v68 = v31;
  ((void (*)(char *))v31)(v29);
  swift_bridgeObjectRetain_n();
  uint64_t v32 = sub_25C8EC0D0();
  os_log_type_t v33 = sub_25C8EC2D0();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v74 = v21;
    uint64_t v34 = OUTLINED_FUNCTION_8_0();
    uint64_t v66 = v16;
    uint64_t v35 = (uint8_t *)v34;
    v87[0] = OUTLINED_FUNCTION_10_1();
    uint64_t v67 = v27;
    *(_DWORD *)uint64_t v35 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_25C8BB4F0(a1, a2, v87);
    OUTLINED_FUNCTION_25(v36);
    uint64_t v21 = v74;
    unint64_t v27 = v67;
    sub_25C8EC360();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25C89B000, v32, v33, "Switch by iCloudAltDSID=%s", v35, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    uint64_t v16 = v66;
    OUTLINED_FUNCTION_3();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  os_log_type_t v37 = *(void (**)(void))(v23 + 8);
  OUTLINED_FUNCTION_11_0();
  v37();
  uint64_t v38 = v81;
  uint64_t v39 = *(void *)(v81 + 64);
  uint64_t v40 = sub_25C8EC190();
  uint64_t v41 = v39;
  uint64_t v42 = v80;
  sub_25C8E4DCC(v40, v43, v41, v80);
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload(v42, 1, v16) == 1)
  {
    uint64_t v72 = v23;
    sub_25C8BC08C(v42);
    v68(v27, v69, v21);
    sub_25C8BC208(v38, (uint64_t)v87);
    swift_bridgeObjectRetain_n();
    uint64_t v44 = sub_25C8EC0D0();
    os_log_type_t v45 = sub_25C8EC2D0();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      uint64_t v74 = v21;
      uint64_t v86 = v47;
      *(_DWORD *)uint64_t v46 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v48 = OUTLINED_FUNCTION_51();
      uint64_t v51 = sub_25C8BB4F0(v48, v49, v50);
      OUTLINED_FUNCTION_25(v51);
      sub_25C8EC360();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v46 + 1sub_25C8B55A0(4, 3, 2, 2) = 2080;
      sub_25C8BC208((uint64_t)v87, (uint64_t)v85);
      unint64_t v83 = 0;
      unint64_t v84 = 0xE000000000000000;
      sub_25C8EC3D0();
      swift_bridgeObjectRelease();
      unint64_t v83 = 0xD000000000000014;
      unint64_t v84 = 0x800000025C8F0430;
      uint64_t v52 = swift_bridgeObjectRetain();
      MEMORY[0x261197960](v52, v16);
      sub_25C8EC1C0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_25C8EC1C0();
      uint64_t v53 = v83;
      unint64_t v54 = v84;
      sub_25C8BBFF8((uint64_t)v85);
      uint64_t v55 = sub_25C8BB4F0(v53, v54, &v86);
      OUTLINED_FUNCTION_25(v55);
      sub_25C8EC360();
      swift_bridgeObjectRelease();
      sub_25C8BBFF8((uint64_t)v87);
      _os_log_impl(&dword_25C89B000, v44, v45, "No account found for iCloudAltDSID=%s in %s", (uint8_t *)v46, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();
    }
    else
    {
      swift_bridgeObjectRelease_n();
      sub_25C8BBFF8((uint64_t)v87);
    }

    OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_11_0();
    v37();
    __swift_project_boxed_opaque_existential_1((void *)(v82 + OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_siriKitEventSender), *(void *)(v82 + OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_siriKitEventSender + 24));
    sub_25C8EB400();
    (*(void (**)(uint64_t, void, uint64_t))(v75 + 104))(v77, *MEMORY[0x263F6F948], v76);
    uint64_t v63 = sub_25C8EB3A0();
    __swift_storeEnumTagSinglePayload(v78, 1, 1, v63);
    swift_bridgeObjectRetain();
    sub_25C8EB3F0();
    sub_25C8EB330();
    swift_release();
    type metadata accessor for SwitchProfileAccountResolutionResult();
    return static SwitchProfileAccountResolutionResult.unsupported(forReason:)(4);
  }
  else
  {
    uint64_t v56 = v72;
    sub_25C8B095C(v42, v72);
    type metadata accessor for SwitchProfileAccountResolutionResult();
    sub_25C8BC154(v56, v71, (void (*)(void))type metadata accessor for UserAccount);
    sub_25C8A7E98(v82 + OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_pbAccess, (uint64_t)v87);
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v87, v87[3]);
    OUTLINED_FUNCTION_1_4();
    MEMORY[0x270FA5388](v57);
    (*(void (**)(char *))(v59 + 16))((char *)&v65 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0));
    sub_25C8B061C();
    long long v61 = v60;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v87);
    id v62 = static AccountResolutionResult.success(with:)((uint64_t)v61);

    sub_25C8BC1B0(v56, (void (*)(void))type metadata accessor for UserAccount);
  }
  return v62;
}

uint64_t sub_25C8B9118()
{
  OUTLINED_FUNCTION_6_1();
  v1[12] = v2;
  v1[13] = v0;
  v1[10] = v3;
  v1[11] = v4;
  v1[9] = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9DC0);
  OUTLINED_FUNCTION_19(v6);
  v1[14] = OUTLINED_FUNCTION_13();
  uint64_t v7 = sub_25C8EB490();
  v1[15] = v7;
  OUTLINED_FUNCTION_1_2(v7);
  v1[16] = v8;
  v1[17] = OUTLINED_FUNCTION_13();
  uint64_t v9 = type metadata accessor for UserAccount();
  v1[18] = v9;
  OUTLINED_FUNCTION_19(v9);
  v1[19] = OUTLINED_FUNCTION_11_1();
  v1[20] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for PineBoardAccountLookupResult();
  OUTLINED_FUNCTION_19(v10);
  v1[21] = OUTLINED_FUNCTION_11_1();
  v1[22] = swift_task_alloc();
  uint64_t v11 = sub_25C8EC0F0();
  v1[23] = v11;
  OUTLINED_FUNCTION_1_2(v11);
  v1[24] = v12;
  v1[25] = OUTLINED_FUNCTION_11_1();
  v1[26] = swift_task_alloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v13, v14, v15);
}

uint64_t sub_25C8B9268()
{
  uint64_t v22 = v0;
  if (qword_26A5D95B8 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[26];
  uint64_t v2 = v0[23];
  uint64_t v3 = v0[24];
  uint64_t v4 = __swift_project_value_buffer(v2, (uint64_t)qword_26A5DD5D0);
  v0[27] = v4;
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  uint64_t v5 = v3 + 16;
  v0[28] = v6;
  v0[29] = v5 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v6(v1, v4, v2);
  swift_bridgeObjectRetain_n();
  uint64_t v7 = sub_25C8EC0D0();
  os_log_type_t v8 = sub_25C8EC2D0();
  BOOL v9 = OUTLINED_FUNCTION_40(v8);
  uint64_t v10 = v0[26];
  uint64_t v11 = v0[24];
  unint64_t v12 = v0[10];
  if (v9)
  {
    uint64_t v19 = v0[9];
    uint64_t v20 = v0[23];
    uint64_t v13 = (uint8_t *)OUTLINED_FUNCTION_8_0();
    uint64_t v21 = OUTLINED_FUNCTION_10_1();
    *(_DWORD *)uint64_t v13 = 136315138;
    swift_bridgeObjectRetain();
    v0[8] = sub_25C8BB4F0(v19, v12, &v21);
    sub_25C8EC360();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25C89B000, v7, (os_log_type_t)v5, "Switch by HomeUserID=%s", v13, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();

    uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v14(v10, v20);
  }
  else
  {
    OUTLINED_FUNCTION_46();

    uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    uint64_t v15 = OUTLINED_FUNCTION_30_0();
    v14(v15, v16);
  }
  v0[30] = v14;
  uint64_t v17 = (void *)swift_task_alloc();
  v0[31] = v17;
  *uint64_t v17 = v0;
  v17[1] = sub_25C8B94BC;
  return sub_25C8BB248();
}

uint64_t sub_25C8B94BC()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25C8B9588()
{
  uint64_t v31 = v0;
  uint64_t v2 = *(void *)(v0 + 168);
  uint64_t v3 = *(void *)(v0 + 144);
  sub_25C8BC154(*(void *)(v0 + 176), v2, (void (*)(void))type metadata accessor for PineBoardAccountLookupResult);
  if (__swift_getEnumTagSinglePayload(v2, 1, v3) == 1)
  {
    (*(void (**)(void, void, void))(v0 + 224))(*(void *)(v0 + 200), *(void *)(v0 + 216), *(void *)(v0 + 184));
    swift_bridgeObjectRetain_n();
    uint64_t v4 = sub_25C8EC0D0();
    os_log_type_t v5 = sub_25C8EC2E0();
    BOOL v6 = OUTLINED_FUNCTION_40(v5);
    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v0 + 240);
    uint64_t v8 = *(void *)(v0 + 200);
    uint64_t v9 = *(void *)(v0 + 184);
    unint64_t v10 = *(void *)(v0 + 80);
    if (v6)
    {
      uint64_t v11 = *(void *)(v0 + 72);
      unint64_t v12 = (uint8_t *)OUTLINED_FUNCTION_8_0();
      uint64_t v30 = OUTLINED_FUNCTION_10_1();
      *(_DWORD *)unint64_t v12 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 56) = sub_25C8BB4F0(v11, v10, &v30);
      sub_25C8EC360();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25C89B000, v4, v1, "No account for homeUserID=%s", v12, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();

      OUTLINED_FUNCTION_11_0();
      v13();
    }
    else
    {
      OUTLINED_FUNCTION_46();

      v7(v8, v9);
    }
    uint64_t v23 = *(void *)(v0 + 128);
    uint64_t v22 = *(void *)(v0 + 136);
    uint64_t v25 = *(void *)(v0 + 112);
    uint64_t v24 = *(void *)(v0 + 120);
    __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 104)+ OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_siriKitEventSender), *(void *)(*(void *)(v0 + 104)+ OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_siriKitEventSender+ 24));
    sub_25C8EB400();
    (*(void (**)(uint64_t, void, uint64_t))(v23 + 104))(v22, *MEMORY[0x263F6F948], v24);
    uint64_t v26 = sub_25C8EB3A0();
    __swift_storeEnumTagSinglePayload(v25, 1, 1, v26);
    swift_bridgeObjectRetain();
    sub_25C8EB3F0();
    sub_25C8EB330();
    swift_release();
    type metadata accessor for SwitchProfileAccountResolutionResult();
    static SwitchProfileAccountResolutionResult.unsupported(forReason:)(4);
  }
  else
  {
    uint64_t v14 = *(void *)(v0 + 160);
    uint64_t v15 = *(void *)(v0 + 104);
    sub_25C8B095C(*(void *)(v0 + 168), v14);
    type metadata accessor for SwitchProfileAccountResolutionResult();
    uint64_t v16 = OUTLINED_FUNCTION_36_0();
    sub_25C8BC154(v16, v17, v18);
    sub_25C8A7E98(v15 + OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_pbAccess, v0 + 16);
    __swift_mutable_project_boxed_opaque_existential_1(v0 + 16, *(void *)(v0 + 40));
    OUTLINED_FUNCTION_1_4();
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_19_2();
    v19();
    sub_25C8B061C();
    uint64_t v21 = v20;
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    swift_task_dealloc();
    static AccountResolutionResult.success(with:)((uint64_t)v21);

    sub_25C8BC1B0(v14, (void (*)(void))type metadata accessor for UserAccount);
  }
  sub_25C8BC1B0(*(void *)(v0 + 176), (void (*)(void))type metadata accessor for PineBoardAccountLookupResult);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v27 = OUTLINED_FUNCTION_4_5();
  return v28(v27);
}

uint64_t sub_25C8B99CC()
{
  return sub_25C8EB3E0();
}

uint64_t sub_25C8B9A24()
{
  OUTLINED_FUNCTION_6_1();
  *(unsigned char *)(v0 + 6sub_25C8B55A0(4, 3, 2, 4) = v1;
  *(void *)(v0 + 2sub_25C8B55A0(4, 3, 2, 4) = v2;
  *(void *)(v0 + 3sub_25C8B55A0(4, 3, 2, 2) = v3;
  uint64_t v4 = sub_25C8EC0F0();
  *(void *)(v0 + 40) = v4;
  OUTLINED_FUNCTION_1_2(v4);
  *(void *)(v0 + 48) = v5;
  *(void *)(v0 + 56) = OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_25C8B9AB4()
{
  OUTLINED_FUNCTION_33_0();
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v2 + 40);
  if (*(void *)(v3 + 16) == 1)
  {
    if (qword_26A5D95B8 != -1) {
      uint64_t v1 = swift_once();
    }
    uint64_t v4 = OUTLINED_FUNCTION_16_3(v1, (uint64_t)qword_26A5DD5D0);
    v5(v4);
    uint64_t v6 = (void *)sub_25C8EC0D0();
    os_log_type_t v7 = sub_25C8EC2E0();
    if (OUTLINED_FUNCTION_23(v7))
    {
      uint64_t v8 = (_WORD *)OUTLINED_FUNCTION_5_0();
      OUTLINED_FUNCTION_27(v8);
      OUTLINED_FUNCTION_21(&dword_25C89B000, v9, v10, "Only one account, cannot switch.");
      OUTLINED_FUNCTION_3();
    }
    uint64_t v11 = *(void **)(v0 + 24);

    uint64_t v12 = OUTLINED_FUNCTION_30_0();
    v13(v12);
    id v14 = objc_msgSend(v11, sel_switchType);
    type metadata accessor for SwitchProfileAccountResolutionResult();
    if (v14 == (id)1) {
      uint64_t v15 = 5;
    }
    else {
      uint64_t v15 = 3;
    }
    static SwitchProfileAccountResolutionResult.unsupported(forReason:)(v15);
    goto LABEL_19;
  }
  uint64_t v16 = swift_task_alloc();
  *(void *)(v16 + 16) = v2;
  swift_bridgeObjectRetain();
  unint64_t v17 = sub_25C8B61C0((void (*)(uint64_t *__return_ptr, uint64_t))sub_25C8BC0EC, v16, v3);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  if (v17 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_25C8EC4F0();
    uint64_t v18 = result;
    if (result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v18 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v18)
    {
LABEL_10:
      if (v18 < 1)
      {
        __break(1u);
        return result;
      }
      for (uint64_t i = 0; i != v18; ++i)
      {
        if ((v17 & 0xC000000000000001) != 0) {
          id v21 = (id)MEMORY[0x261197B40](i, v17);
        }
        else {
          id v21 = *(id *)(v17 + 8 * i + 32);
        }
        uint64_t v22 = v21;
        objc_msgSend(v21, sel_setNoNameMatched_, *(unsigned __int8 *)(v0 + 64));
      }
    }
  }
  swift_bridgeObjectRelease();
  type metadata accessor for SwitchProfileAccountResolutionResult();
  static AccountResolutionResult.disambiguation(with:)(v17);
  swift_bridgeObjectRelease();
LABEL_19:
  swift_task_dealloc();
  uint64_t v23 = OUTLINED_FUNCTION_4_5();
  return v24(v23);
}

uint64_t sub_25C8B9D38()
{
  OUTLINED_FUNCTION_6_1();
  v1[13] = v2;
  v1[14] = v0;
  v1[12] = v3;
  uint64_t v4 = type metadata accessor for UserAccount();
  v1[15] = v4;
  OUTLINED_FUNCTION_19(v4);
  v1[16] = OUTLINED_FUNCTION_11_1();
  v1[17] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for UserAccountManager.LookupResult();
  v1[18] = v5;
  OUTLINED_FUNCTION_19(v5);
  v1[19] = OUTLINED_FUNCTION_13();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9DC0);
  OUTLINED_FUNCTION_19(v6);
  v1[20] = OUTLINED_FUNCTION_13();
  uint64_t v7 = sub_25C8EB490();
  v1[21] = v7;
  OUTLINED_FUNCTION_1_2(v7);
  v1[22] = v8;
  v1[23] = OUTLINED_FUNCTION_13();
  uint64_t v9 = sub_25C8EC0F0();
  v1[24] = v9;
  OUTLINED_FUNCTION_1_2(v9);
  v1[25] = v10;
  v1[26] = OUTLINED_FUNCTION_11_1();
  v1[27] = swift_task_alloc();
  v1[28] = swift_task_alloc();
  v1[29] = swift_task_alloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v11, v12, v13);
}

uint64_t sub_25C8B9E94()
{
  uint64_t v82 = v0;
  uint64_t v1 = sub_25C8BBCC0(*(void **)(v0 + 96), (SEL *)&selRef_name);
  if (v2)
  {
    uint64_t v3 = v1;
    unint64_t v4 = v2;
    if (qword_26A5D95B8 != -1) {
      swift_once();
    }
    uint64_t v80 = v3;
    uint64_t v5 = *(void *)(v0 + 232);
    uint64_t v6 = *(void *)(v0 + 200);
    __swift_project_value_buffer(*(void *)(v0 + 192), (uint64_t)qword_26A5DD5D0);
    (*(void (**)(uint64_t))(v6 + 16))(v5);
    swift_bridgeObjectRetain_n();
    uint64_t v7 = (void *)sub_25C8EC0D0();
    os_log_type_t v8 = sub_25C8EC2D0();
    BOOL v9 = OUTLINED_FUNCTION_13_0(v8);
    uint64_t v10 = *(void *)(v0 + 232);
    uint64_t v12 = *(void *)(v0 + 192);
    uint64_t v11 = *(void *)(v0 + 200);
    if (v9)
    {
      uint64_t v13 = (_DWORD *)OUTLINED_FUNCTION_8_0();
      v81[0] = OUTLINED_FUNCTION_10_1();
      *uint64_t v13 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 88) = sub_25C8BB4F0(v80, v4, v81);
      sub_25C8EC360();
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_50(&dword_25C89B000, v14, v15, "Switch-by-name for %s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();

      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    }
    uint64_t v27 = *(void *)(v0 + 176);
    uint64_t v26 = *(void *)(v0 + 184);
    uint64_t v28 = *(void *)(v0 + 160);
    uint64_t v29 = *(void *)(v0 + 168);
    uint64_t v30 = *(void *)(v0 + 112);
    uint64_t v31 = *(void **)(v0 + 96);
    char v77 = sub_25C8AF88C();
    uint64_t v76 = (void *)(v30 + OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_siriKitEventSender);
    __swift_project_boxed_opaque_existential_1((void *)(v30 + OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_siriKitEventSender), *(void *)(v30 + OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_siriKitEventSender + 24));
    sub_25C8EB400();
    uint64_t v75 = *(void (**)(uint64_t, void, uint64_t))(v27 + 104);
    v75(v26, *MEMORY[0x263F6F9C8], v29);
    id v32 = objc_msgSend(v31, sel_typeName);
    sub_25C8EC170();

    uint64_t v33 = sub_25C8EB3A0();
    __swift_storeEnumTagSinglePayload(v28, 1, 1, v33);
    *(unsigned char *)(swift_allocObject() + 16) = v77;
    sub_25C8EB3F0();
    sub_25C8EB330();
    swift_release();
    sub_25C8AF930();
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (!EnumCaseMultiPayload)
    {
      uint64_t v45 = *(void *)(v0 + 136);
      uint64_t v46 = *(void *)(v0 + 112);
      swift_bridgeObjectRelease();
      uint64_t v47 = OUTLINED_FUNCTION_30_0();
      sub_25C8B095C(v47, v48);
      type metadata accessor for SwitchProfileAccountResolutionResult();
      uint64_t v49 = OUTLINED_FUNCTION_51();
      sub_25C8BC154(v49, v50, v51);
      sub_25C8A7E98(v46 + OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_pbAccess, v0 + 16);
      __swift_mutable_project_boxed_opaque_existential_1(v0 + 16, *(void *)(v0 + 40));
      OUTLINED_FUNCTION_1_4();
      OUTLINED_FUNCTION_13();
      OUTLINED_FUNCTION_19_2();
      v52();
      sub_25C8B061C();
      unint64_t v54 = v53;
      __swift_destroy_boxed_opaque_existential_1(v0 + 16);
      swift_task_dealloc();
      static AccountResolutionResult.success(with:)((uint64_t)v54);

      sub_25C8BC1B0(v45, (void (*)(void))type metadata accessor for UserAccount);
LABEL_21:
      OUTLINED_FUNCTION_34();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v65 = OUTLINED_FUNCTION_4_5();
      return v66(v65);
    }
    uint64_t v79 = v33;
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v35 = **(void **)(v0 + 152);
      uint64_t v36 = OUTLINED_FUNCTION_42();
      v37(v36);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t v38 = sub_25C8EC0D0();
      os_log_type_t v39 = sub_25C8EC2E0();
      if (OUTLINED_FUNCTION_40(v39))
      {
        uint64_t v78 = *(void *)(v0 + 120);
        uint64_t v40 = swift_slowAlloc();
        v81[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v40 = 136315394;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 7sub_25C8B55A0(4, 3, 2, 2) = sub_25C8BB4F0(v80, v4, v81);
        OUTLINED_FUNCTION_30_0();
        sub_25C8EC360();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v40 + 1sub_25C8B55A0(4, 3, 2, 2) = 2080;
        uint64_t v41 = swift_bridgeObjectRetain();
        uint64_t v42 = MEMORY[0x261197960](v41, v78);
        unint64_t v44 = v43;
        swift_bridgeObjectRelease();
        *(void *)(v0 + 80) = sub_25C8BB4F0(v42, v44, v81);
        sub_25C8EC360();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_46();
        _os_log_impl(&dword_25C89B000, v38, (os_log_type_t)v4, "Multiple accounts found for name[%s]: %s", (uint8_t *)v40, 0x16u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_3();
        OUTLINED_FUNCTION_3();
      }
      else
      {
        swift_bridgeObjectRelease_n();
        OUTLINED_FUNCTION_46();

        OUTLINED_FUNCTION_30_0();
      }
      OUTLINED_FUNCTION_11_0();
      v62();
      uint64_t v63 = *(void **)(v0 + 112);
      type metadata accessor for SwitchProfileAccountResolutionResult();
      unint64_t v64 = sub_25C8B5F7C(v35, v63);
      swift_bridgeObjectRelease();
      static AccountResolutionResult.disambiguation(with:)(v64);
      swift_bridgeObjectRelease();
      goto LABEL_21;
    }
    uint64_t v55 = OUTLINED_FUNCTION_42();
    v56(v55);
    swift_bridgeObjectRetain();
    uint64_t v57 = (void *)sub_25C8EC0D0();
    os_log_type_t v58 = sub_25C8EC2E0();
    if (OUTLINED_FUNCTION_13_0(v58))
    {
      uint64_t v59 = (_DWORD *)OUTLINED_FUNCTION_8_0();
      v81[0] = OUTLINED_FUNCTION_10_1();
      *uint64_t v59 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 56) = sub_25C8BB4F0(v80, v4, v81);
      OUTLINED_FUNCTION_36_0();
      sub_25C8EC360();
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_50(&dword_25C89B000, v60, v61, "No account found for name[%s]");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();
    }
    else
    {
      swift_bridgeObjectRelease_n();

      OUTLINED_FUNCTION_36_0();
    }
    OUTLINED_FUNCTION_11_0();
    v68();
    uint64_t v69 = *(void *)(v0 + 184);
    uint64_t v71 = *(void *)(v0 + 160);
    uint64_t v70 = *(void *)(v0 + 168);
    uint64_t v72 = *(void **)(v0 + 96);
    __swift_project_boxed_opaque_existential_1(v76, v76[3]);
    v75(v69, *MEMORY[0x263F6F948], v70);
    id v73 = objc_msgSend(v72, sel_typeName);
    sub_25C8EC170();

    __swift_storeEnumTagSinglePayload(v71, 1, 1, v79);
    sub_25C8EB3F0();
    sub_25C8EB330();
    swift_release();
    uint64_t v74 = (void *)swift_task_alloc();
    *(void *)(v0 + 240) = v74;
    *uint64_t v74 = v0;
    v74[1] = sub_25C8BA8F8;
  }
  else
  {
    if (qword_26A5D95B8 != -1) {
      uint64_t v1 = swift_once();
    }
    uint64_t v16 = OUTLINED_FUNCTION_16_3(v1, (uint64_t)qword_26A5DD5D0);
    v17(v16);
    uint64_t v18 = (void *)sub_25C8EC0D0();
    os_log_type_t v19 = sub_25C8EC2E0();
    if (OUTLINED_FUNCTION_23(v19))
    {
      uint64_t v20 = (_WORD *)OUTLINED_FUNCTION_5_0();
      OUTLINED_FUNCTION_27(v20);
      OUTLINED_FUNCTION_21(&dword_25C89B000, v21, v22, "No name in switch-by-name");
      OUTLINED_FUNCTION_3();
    }

    uint64_t v23 = OUTLINED_FUNCTION_30_0();
    v24(v23);
    uint64_t v25 = (void *)swift_task_alloc();
    *(void *)(v0 + 256) = v25;
    *uint64_t v25 = v0;
    v25[1] = sub_25C8BAA68;
  }
  return sub_25C8B9A24();
}

uint64_t sub_25C8BA8F8()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_4();
  *unint64_t v2 = v1;
  *unint64_t v2 = *v0;
  *(void *)(v1 + 248) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C8BA9C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_21_2();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_34();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_6_3();
  return v14(v12, v13, v14, v15, v16, v17, v18, v19, a9, a10, a11, a12);
}

uint64_t sub_25C8BAA68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_21_2();
  OUTLINED_FUNCTION_44();
  uint64_t v25 = v13;
  uint64_t v14 = *v12;
  OUTLINED_FUNCTION_4_4();
  void *v15 = v14;
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
  OUTLINED_FUNCTION_6_3();
  return v18(v16, v17, v18, v19, v20, v21, v22, v23, v25, a10, a11, a12);
}

uint64_t sub_25C8BAC60(uint64_t a1, uint64_t a2)
{
  return sub_25C8EB3E0();
}

uint64_t sub_25C8BACB0()
{
  return sub_25C8EB3E0();
}

uint64_t sub_25C8BAD08()
{
  OUTLINED_FUNCTION_6_1();
  v1[8] = v2;
  v1[9] = v0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9CB0);
  OUTLINED_FUNCTION_19(v3);
  v1[10] = OUTLINED_FUNCTION_13();
  uint64_t v4 = type metadata accessor for UserAccount();
  v1[11] = v4;
  OUTLINED_FUNCTION_19(v4);
  v1[12] = OUTLINED_FUNCTION_11_1();
  v1[13] = swift_task_alloc();
  uint64_t v5 = sub_25C8EC0F0();
  v1[14] = v5;
  OUTLINED_FUNCTION_1_2(v5);
  v1[15] = v6;
  v1[16] = OUTLINED_FUNCTION_11_1();
  v1[17] = swift_task_alloc();
  v1[18] = swift_task_alloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C8BAE00()
{
  if (qword_26A5D95B8 != -1) {
    swift_once();
  }
  uint64_t v1 = (uint8_t *)__swift_project_value_buffer(v0[14], (uint64_t)qword_26A5DD5D0);
  OUTLINED_FUNCTION_6_0();
  v2();
  uint64_t v3 = sub_25C8EC0D0();
  os_log_type_t v4 = sub_25C8EC2E0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (_WORD *)OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_38_0(v5);
    OUTLINED_FUNCTION_35(&dword_25C89B000, v3, v6, "switch-by-disambiguation");
    OUTLINED_FUNCTION_3();
  }
  uint64_t v7 = v0[15];
  uint64_t v9 = v0[10];
  uint64_t v8 = v0[11];

  uint64_t v10 = *(void (**)(void))(v7 + 8);
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_39_0();
  v10();
  sub_25C8AFBD8(v9);
  if (__swift_getEnumTagSinglePayload(v9, 1, v8) == 1)
  {
    uint64_t v11 = v0[8];
    sub_25C8BC08C(v0[10]);
    uint64_t v12 = *(void *)(v11 + 40);
    if (*(void *)(v12 + 16) == 1)
    {
      OUTLINED_FUNCTION_6_0();
      v13();
      uint64_t v14 = (void *)sub_25C8EC0D0();
      os_log_type_t v15 = sub_25C8EC2E0();
      if (OUTLINED_FUNCTION_23(v15))
      {
        uint64_t v16 = (_WORD *)OUTLINED_FUNCTION_5_0();
        OUTLINED_FUNCTION_27(v16);
        OUTLINED_FUNCTION_21(&dword_25C89B000, v17, v18, "Only one account, cannot switch.");
        OUTLINED_FUNCTION_3();
      }

      OUTLINED_FUNCTION_39_0();
      v10();
      type metadata accessor for SwitchProfileAccountResolutionResult();
      static SwitchProfileAccountResolutionResult.unsupported(forReason:)(3);
    }
    else
    {
      uint64_t v29 = v0[8];
      type metadata accessor for SwitchProfileAccountResolutionResult();
      uint64_t v30 = swift_task_alloc();
      *(void *)(v30 + 16) = v29;
      swift_bridgeObjectRetain();
      unint64_t v31 = sub_25C8B61C0((void (*)(uint64_t *__return_ptr, uint64_t))sub_25C8BD6B0, v30, v12);
      swift_bridgeObjectRelease();
      swift_task_dealloc();
      static AccountResolutionResult.disambiguation(with:)(v31);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_25C8B095C(v0[10], v0[13]);
    OUTLINED_FUNCTION_6_0();
    v19();
    uint64_t v20 = sub_25C8EC0D0();
    os_log_type_t v21 = sub_25C8EC2D0();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (_WORD *)OUTLINED_FUNCTION_5_0();
      OUTLINED_FUNCTION_27(v22);
      _os_log_impl(&dword_25C89B000, v20, v21, "Toggling profile to other account", v1, 2u);
      OUTLINED_FUNCTION_3();
    }
    uint64_t v23 = v0[13];
    uint64_t v24 = v0[12];
    uint64_t v25 = v0[9];

    OUTLINED_FUNCTION_39_0();
    v10();
    type metadata accessor for SwitchProfileAccountResolutionResult();
    sub_25C8BC154(v23, v24, (void (*)(void))type metadata accessor for UserAccount);
    sub_25C8A7E98(v25 + OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_pbAccess, (uint64_t)(v0 + 2));
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
    OUTLINED_FUNCTION_1_4();
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_19_2();
    v26();
    sub_25C8B061C();
    uint64_t v28 = v27;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
    swift_task_dealloc();
    static AccountResolutionResult.success(with:)((uint64_t)v28);

    sub_25C8BC1B0(v23, (void (*)(void))type metadata accessor for UserAccount);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v32 = OUTLINED_FUNCTION_4_5();
  return v33(v32);
}

uint64_t sub_25C8BB248()
{
  OUTLINED_FUNCTION_6_1();
  *(void *)(v0 + 16) = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9CB0);
  OUTLINED_FUNCTION_19(v2);
  *(void *)(v0 + 2sub_25C8B55A0(4, 3, 2, 4) = OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25C8BB2C8()
{
  OUTLINED_FUNCTION_6_1();
  uint64_t v1 = v0[3];
  uint64_t v2 = type metadata accessor for UserAccount();
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v2);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v1, 1, v2);
  uint64_t v4 = v0[3];
  if (EnumTagSinglePayload == 1)
  {
    sub_25C8BC08C(v4);
    uint64_t v5 = 1;
  }
  else
  {
    sub_25C8B095C(v4, v0[2]);
    uint64_t v5 = 0;
  }
  __swift_storeEnumTagSinglePayload(v0[2], v5, 1, v2);
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

id SwitchProfileIntentHandler.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SwitchProfileIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25C8BB414(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_25C8BB450(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_25C8BB478(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_25C8BB4F0(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_25C8EC360();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_25C8BB4F0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  OUTLINED_FUNCTION_15();
  uint64_t v9 = sub_25C8BB5C0(v6, v7, v8, 1, a1, a2);
  uint64_t v10 = v15[0];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t ObjectType = swift_getObjectType();
    v15[0] = v11;
    uint64_t v12 = *a3;
    if (*a3)
    {
      sub_25C8BC554((uint64_t)v15, *a3);
      *a3 = v12 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v15[0] = a1;
    v15[1] = a2;
    uint64_t v13 = *a3;
    if (*a3)
    {
      sub_25C8BC554((uint64_t)v15, *a3);
      *a3 = v13 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  return v10;
}

uint64_t sub_25C8BB5C0(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_25C8BB718((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_25C8EC370();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_25C8BB7F0(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_25C8EC400();
    if (!v8)
    {
      uint64_t result = sub_25C8EC4C0();
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

void *sub_25C8BB718(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25C8EC500();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_25C8BB7F0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25C8BB888(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_25C8BBA64(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_25C8BBA64((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + vsub_25C8B55A0(4, 3, 2, 4) = 0;
  return v2;
}

uint64_t sub_25C8BB888(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_25C8EC1D0();
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
  unint64_t v3 = sub_25C8BB9FC(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_25C8EC3E0();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_25C8EC500();
  __break(1u);
LABEL_14:
  uint64_t result = sub_25C8EC4C0();
  __break(1u);
  return result;
}

void *sub_25C8BB9FC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9E58);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_25C8BBA64(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9E58);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + sub_25C8B55A0(4, 3, 2, 2) = v8;
    *((void *)v10 + sub_25C8B55A0(4, 3, 2, 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25C8BBC14(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25C8BBB3C(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_25C8BBB3C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25C8EC500();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_25C8BBC14(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_25C8EC500();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unsigned char **sub_25C8BBCA4(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_25C8BBCB4(void *a1)
{
  return sub_25C8BBCC0(a1, (SEL *)&selRef_profileId);
}

uint64_t sub_25C8BBCC0(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (v2)
  {
    uint64_t v3 = v2;
    sub_25C8EC170();
  }
  return OUTLINED_FUNCTION_47();
}

id sub_25C8BBD1C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v12[3] = type metadata accessor for AccountServicesNoOp();
  v12[4] = &off_2709F0110;
  v12[0] = a1;
  v11[3] = type metadata accessor for AssistantServicesProvider();
  v11[4] = &off_2709EF640;
  v11[0] = a2;
  sub_25C8A7E98((uint64_t)v12, (uint64_t)a4 + OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_pbAccess);
  sub_25C8A7E98((uint64_t)v11, (uint64_t)a4 + OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_assistantServices);
  sub_25C8A7E98(a3, (uint64_t)a4 + OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_siriKitEventSender);
  v10.receiver = a4;
  v10.super_class = (Class)type metadata accessor for SwitchProfileIntentHandler();
  id v8 = objc_msgSendSuper2(&v10, sel_init);
  __swift_destroy_boxed_opaque_existential_1(a3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v8;
}

id sub_25C8BBDFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = type metadata accessor for AccountServicesNoOp();
  uint64_t v22 = &off_2709F0110;
  v20[0] = a1;
  uint64_t v18 = type metadata accessor for AssistantServicesProvider();
  uint64_t v19 = &off_2709EF640;
  v17[0] = a2;
  id v6 = objc_allocWithZone((Class)type metadata accessor for SwitchProfileIntentHandler());
  uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v20, v21);
  MEMORY[0x270FA5388](v7);
  int64_t v9 = (void *)((char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v10 + 16))(v9);
  uint64_t v11 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v17, v18);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (void *)((char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v14 + 16))(v13);
  id v15 = sub_25C8BBD1C(*v9, *v13, a3, v6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  return v15;
}

uint64_t type metadata accessor for SwitchProfileIntentHandler()
{
  return self;
}

uint64_t sub_25C8BBFF8(uint64_t a1)
{
  return a1;
}

unint64_t sub_25C8BC04C()
{
  unint64_t result = qword_26A5D9E08;
  if (!qword_26A5D9E08)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_26A5D9E08);
  }
  return result;
}

uint64_t sub_25C8BC08C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9CB0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C8BC0EC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_25C8AE1BC(a1, *(void *)(v2 + 16), a2);
}

uint64_t type metadata accessor for PineBoardAccountLookupResult()
{
  uint64_t result = qword_26A5D9E60;
  if (!qword_26A5D9E60) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C8BC154(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_16();
  uint64_t v4 = OUTLINED_FUNCTION_47();
  v5(v4);
  return a2;
}

uint64_t sub_25C8BC1B0(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_16();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_25C8BC208(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_25C8BC268()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C8BD6C8;
  uint64_t v2 = OUTLINED_FUNCTION_18_2();
  return v3(v2);
}

uint64_t sub_25C8BC308()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C8BD6C8;
  uint64_t v2 = OUTLINED_FUNCTION_18_2();
  return v3(v2);
}

uint64_t objectdestroyTm()
{
  _Block_release(*(const void **)(v0 + 24));
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25C8BC3F0()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C8BC48C;
  uint64_t v2 = OUTLINED_FUNCTION_18_2();
  return v3(v2);
}

uint64_t sub_25C8BC48C()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_25C8BC554(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 2sub_25C8B55A0(4, 3, 2, 4) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25C8BC5B0()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_25C8BC5C0(uint64_t a1)
{
  return sub_25C8BAC60(a1, *(unsigned __int8 *)(v1 + 16));
}

uint64_t *sub_25C8BC5C8(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = (int *)type metadata accessor for UserAccount();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, (uint64_t)v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v9 = sub_25C8EB000();
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v9))
      {
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9C98);
        memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v9);
      }
      uint64_t v11 = v7[5];
      uint64_t v12 = (uint64_t *)((char *)a1 + v11);
      uint64_t v13 = (uint64_t *)((char *)a2 + v11);
      uint64_t v14 = v13[1];
      *uint64_t v12 = *v13;
      v12[1] = v14;
      uint64_t v15 = v7[6];
      uint64_t v16 = (uint64_t *)((char *)a1 + v15);
      uint64_t v17 = (uint64_t *)((char *)a2 + v15);
      uint64_t v28 = v17[1];
      *uint64_t v16 = *v17;
      v16[1] = v28;
      uint64_t v18 = v7[7];
      uint64_t v19 = (uint64_t *)((char *)a1 + v18);
      uint64_t v20 = (uint64_t *)((char *)a2 + v18);
      uint64_t v21 = v20[1];
      *uint64_t v19 = *v20;
      v19[1] = v21;
      uint64_t v22 = v20[3];
      v19[2] = v20[2];
      v19[3] = v22;
      uint64_t v23 = v20[5];
      v19[4] = v20[4];
      v19[5] = v23;
      uint64_t v24 = v20[7];
      v19[6] = v20[6];
      v19[7] = v24;
      uint64_t v25 = v20[9];
      v19[8] = v20[8];
      v19[9] = v25;
      uint64_t v26 = v20[11];
      v19[10] = v20[10];
      v19[11] = v26;
      v19[12] = v20[12];
      *((unsigned char *)a1 + v7[8]) = *((unsigned char *)a2 + v7[8]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, (uint64_t)v7);
    }
  }
  return a1;
}

uint64_t sub_25C8BC808(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UserAccount();
  uint64_t result = __swift_getEnumTagSinglePayload(a1, 1, v2);
  if (!result)
  {
    uint64_t v4 = sub_25C8EB000();
    if (!__swift_getEnumTagSinglePayload(a1, 1, v4)) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

char *sub_25C8BC91C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for UserAccount();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, (uint64_t)v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_25C8EB000();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v7))
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9C98);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v7);
    }
    uint64_t v9 = v6[5];
    uint64_t v10 = &a1[v9];
    uint64_t v11 = &a2[v9];
    uint64_t v12 = *((void *)v11 + 1);
    *(void *)uint64_t v10 = *(void *)v11;
    *((void *)v10 + 1) = v12;
    uint64_t v13 = v6[6];
    uint64_t v14 = &a1[v13];
    uint64_t v15 = &a2[v13];
    uint64_t v26 = *((void *)v15 + 1);
    *(void *)uint64_t v14 = *(void *)v15;
    *((void *)v14 + 1) = v26;
    uint64_t v16 = v6[7];
    uint64_t v17 = &a1[v16];
    uint64_t v18 = &a2[v16];
    uint64_t v19 = *((void *)v18 + 1);
    *(void *)uint64_t v17 = *(void *)v18;
    *((void *)v17 + 1) = v19;
    uint64_t v20 = *((void *)v18 + 3);
    *((void *)v17 + sub_25C8B55A0(4, 3, 2, 2) = *((void *)v18 + 2);
    *((void *)v17 + sub_25C8B55A0(4, 3, 2, 3) = v20;
    uint64_t v21 = *((void *)v18 + 5);
    *((void *)v17 + sub_25C8B55A0(4, 3, 2, 4) = *((void *)v18 + 4);
    *((void *)v17 + 5) = v21;
    uint64_t v22 = *((void *)v18 + 7);
    *((void *)v17 + 6) = *((void *)v18 + 6);
    *((void *)v17 + 7) = v22;
    uint64_t v23 = *((void *)v18 + 9);
    *((void *)v17 + 8) = *((void *)v18 + 8);
    *((void *)v17 + 9) = v23;
    uint64_t v24 = *((void *)v18 + 11);
    *((void *)v17 + 10) = *((void *)v18 + 10);
    *((void *)v17 + 11) = v24;
    *((void *)v17 + 1sub_25C8B55A0(4, 3, 2, 2) = *((void *)v18 + 12);
    a1[v6[8]] = a2[v6[8]];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, (uint64_t)v6);
  }
  return a1;
}

unsigned char *sub_25C8BCB20(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for UserAccount();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, (uint64_t)v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, (uint64_t)v6);
  if (!EnumTagSinglePayload)
  {
    if (v8)
    {
      sub_25C8BC1B0((uint64_t)a1, (void (*)(void))type metadata accessor for UserAccount);
      goto LABEL_7;
    }
    uint64_t v11 = sub_25C8EB000();
    int v12 = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v11);
    int v13 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v11);
    if (v12)
    {
      if (!v13)
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v11);
LABEL_16:
        uint64_t v25 = v6[5];
        uint64_t v26 = &a1[v25];
        uint64_t v27 = &a2[v25];
        *uint64_t v26 = *v27;
        v26[1] = v27[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v28 = v6[6];
        uint64_t v29 = &a1[v28];
        uint64_t v30 = &a2[v28];
        *uint64_t v29 = *v30;
        v29[1] = v30[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v31 = v6[7];
        uint64_t v32 = &a1[v31];
        uint64_t v33 = &a2[v31];
        *uint64_t v32 = *(void *)&a2[v31];
        v32[1] = *(void *)&a2[v31 + 8];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        long long v32[2] = v33[2];
        v32[3] = v33[3];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v32[4] = v33[4];
        v32[5] = v33[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v32[6] = v33[6];
        v32[7] = v33[7];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v32[8] = v33[8];
        v32[9] = v33[9];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v32[10] = v33[10];
        v32[11] = v33[11];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v32[12] = v33[12];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        a1[v6[8]] = a2[v6[8]];
        return a1;
      }
    }
    else
    {
      uint64_t v23 = *(void *)(v11 - 8);
      if (!v13)
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v23 + 24))(a1, a2, v11);
        goto LABEL_16;
      }
      (*(void (**)(unsigned char *, uint64_t))(v23 + 8))(a1, v11);
    }
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9C98);
    memcpy(a1, a2, *(void *)(*(void *)(v24 - 8) + 64));
    goto LABEL_16;
  }
  if (v8)
  {
LABEL_7:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v9 = sub_25C8EB000();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v9))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9C98);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v9);
  }
  uint64_t v14 = v6[5];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  void *v15 = *v16;
  v15[1] = v16[1];
  uint64_t v17 = v6[6];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  *uint64_t v18 = *v19;
  v18[1] = v19[1];
  uint64_t v20 = v6[7];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  *uint64_t v21 = *v22;
  v21[1] = v22[1];
  v21[2] = v22[2];
  v21[3] = v22[3];
  v21[4] = v22[4];
  v21[5] = v22[5];
  v21[6] = v22[6];
  v21[7] = v22[7];
  v21[8] = v22[8];
  v21[9] = v22[9];
  v21[10] = v22[10];
  v21[11] = v22[11];
  v21[12] = v22[12];
  a1[v6[8]] = a2[v6[8]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, (uint64_t)v6);
  return a1;
}

char *sub_25C8BD004(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for UserAccount();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, (uint64_t)v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_25C8EB000();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v7))
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9C98);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v7);
    }
    *(_OWORD *)&a1[v6[5]] = *(_OWORD *)&a2[v6[5]];
    *(_OWORD *)&a1[v6[6]] = *(_OWORD *)&a2[v6[6]];
    memcpy(&a1[v6[7]], &a2[v6[7]], 0x68uLL);
    a1[v6[8]] = a2[v6[8]];
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, (uint64_t)v6);
  }
  return a1;
}

unsigned char *sub_25C8BD160(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for UserAccount();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, (uint64_t)v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, (uint64_t)v6);
  if (!EnumTagSinglePayload)
  {
    if (v8)
    {
      sub_25C8BC1B0((uint64_t)a1, (void (*)(void))type metadata accessor for UserAccount);
      goto LABEL_7;
    }
    uint64_t v11 = sub_25C8EB000();
    int v12 = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v11);
    int v13 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v11);
    if (v12)
    {
      if (!v13)
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v11);
LABEL_16:
        uint64_t v16 = v6[5];
        uint64_t v17 = &a1[v16];
        uint64_t v18 = (uint64_t *)&a2[v16];
        uint64_t v20 = *v18;
        uint64_t v19 = v18[1];
        *uint64_t v17 = v20;
        v17[1] = v19;
        swift_bridgeObjectRelease();
        uint64_t v21 = v6[6];
        uint64_t v22 = &a1[v21];
        uint64_t v23 = (uint64_t *)&a2[v21];
        uint64_t v25 = *v23;
        uint64_t v24 = v23[1];
        *uint64_t v22 = v25;
        v22[1] = v24;
        swift_bridgeObjectRelease();
        uint64_t v26 = v6[7];
        uint64_t v27 = &a1[v26];
        uint64_t v28 = &a2[v26];
        uint64_t v29 = *(void *)&a2[v26 + 8];
        *uint64_t v27 = *(void *)&a2[v26];
        v27[1] = v29;
        swift_bridgeObjectRelease();
        uint64_t v30 = v28[3];
        v27[2] = v28[2];
        v27[3] = v30;
        swift_bridgeObjectRelease();
        uint64_t v31 = v28[5];
        v27[4] = v28[4];
        v27[5] = v31;
        swift_bridgeObjectRelease();
        uint64_t v32 = v28[7];
        v27[6] = v28[6];
        v27[7] = v32;
        swift_bridgeObjectRelease();
        uint64_t v33 = v28[9];
        v27[8] = v28[8];
        v27[9] = v33;
        swift_bridgeObjectRelease();
        uint64_t v34 = v28[11];
        v27[10] = v28[10];
        v27[11] = v34;
        swift_bridgeObjectRelease();
        v27[12] = v28[12];
        swift_bridgeObjectRelease();
        a1[v6[8]] = a2[v6[8]];
        return a1;
      }
    }
    else
    {
      uint64_t v14 = *(void *)(v11 - 8);
      if (!v13)
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v14 + 40))(a1, a2, v11);
        goto LABEL_16;
      }
      (*(void (**)(unsigned char *, uint64_t))(v14 + 8))(a1, v11);
    }
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9C98);
    memcpy(a1, a2, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_16;
  }
  if (v8)
  {
LABEL_7:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v9 = sub_25C8EB000();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v9))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9C98);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v9);
  }
  *(_OWORD *)&a1[v6[5]] = *(_OWORD *)&a2[v6[5]];
  *(_OWORD *)&a1[v6[6]] = *(_OWORD *)&a2[v6[6]];
  memcpy(&a1[v6[7]], &a2[v6[7]], 0x68uLL);
  a1[v6[8]] = a2[v6[8]];
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, (uint64_t)v6);
  return a1;
}

uint64_t sub_25C8BD4D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C8BD4EC);
}

uint64_t sub_25C8BD4EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UserAccount();
  unsigned int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(a1, a2, v4);
  if (EnumTagSinglePayload >= 2) {
    return EnumTagSinglePayload - 1;
  }
  else {
    return 0;
  }
}

uint64_t sub_25C8BD534(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C8BD548);
}

uint64_t sub_25C8BD548(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 1);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = type metadata accessor for UserAccount();
  return __swift_storeEnumTagSinglePayload(a1, v5, a3, v6);
}

uint64_t sub_25C8BD5A4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UserAccount();
  return __swift_getEnumTagSinglePayload(a1, 1, v2);
}

uint64_t sub_25C8BD5E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UserAccount();
  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v4);
}

uint64_t sub_25C8BD634()
{
  uint64_t result = type metadata accessor for UserAccount();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t sub_25C8BD6B0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_25C8BC0EC(a1, a2);
}

uint64_t OUTLINED_FUNCTION_4_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_16_3(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(v2, a2);
  return v3;
}

uint64_t OUTLINED_FUNCTION_18_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_22_1()
{
  return sub_25C8BBFF8(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_25(uint64_t a1)
{
  *(void *)(v1 - 240) = a1;
  return v1 - 240;
}

_WORD *OUTLINED_FUNCTION_27(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_30_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_32@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return 0;
}

uint64_t OUTLINED_FUNCTION_34()
{
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_35(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, a2, v4, a4, v5, 2u);
}

uint64_t OUTLINED_FUNCTION_36_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_37_0()
{
  return sub_25C8EC0A0();
}

_WORD *OUTLINED_FUNCTION_38_0(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

BOOL OUTLINED_FUNCTION_40(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_42()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_45()
{
  return *(void *)(v0 + 136);
}

uint64_t OUTLINED_FUNCTION_46()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_47()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_48()
{
  return v0;
}

void OUTLINED_FUNCTION_49(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void OUTLINED_FUNCTION_50(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 0xCu);
}

uint64_t OUTLINED_FUNCTION_51()
{
  return v0;
}

uint64_t sub_25C8BD9A8()
{
  if (sub_25C8EBE90()) {
    return 1;
  }
  return MEMORY[0x270F72AC8]();
}

uint64_t sub_25C8BD9E0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25C8EC0F0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v28 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v27 - v6;
  id v8 = objc_msgSend(v1, sel_disambiguationItems);
  uint64_t v9 = sub_25C8EC200();

  uint64_t v10 = MEMORY[0x263F8EE78];
  uint64_t v33 = MEMORY[0x263F8EE78];
  uint64_t v11 = *(void *)(v9 + 16);
  if (v11)
  {
    uint64_t v12 = v9 + 32;
    uint64_t v29 = (void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v13 = v9;
    uint64_t v14 = (void (**)(char *, uint64_t))(v3 + 8);
    v27[1] = v13;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_25C8BC554(v12, (uint64_t)v32);
      sub_25C8BC554((uint64_t)v32, (uint64_t)v31);
      type metadata accessor for Account();
      if (swift_dynamicCast()) {
        goto LABEL_7;
      }
      sub_25C8BC554((uint64_t)v32, (uint64_t)v31);
      sub_25C8C4154(0, &qword_26A5D9F88);
      if (swift_dynamicCast())
      {
        uint64_t v15 = v30;
        if ((id)INTypedObjectWithCustomObject())
        {

LABEL_7:
          uint64_t v16 = __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
          MEMORY[0x261197930](v16);
          if (*(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_25C8EC230();
          }
          sub_25C8EC250();
          sub_25C8EC220();
          goto LABEL_22;
        }
        if (qword_26A5D95A0 != -1) {
          swift_once();
        }
        uint64_t v21 = __swift_project_value_buffer(v2, (uint64_t)qword_26A5DD588);
        (*v29)(v28, v21, v2);
        uint64_t v22 = sub_25C8EC0D0();
        os_log_type_t v23 = sub_25C8EC2E0();
        if (os_log_type_enabled(v22, v23))
        {
          uint64_t v24 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v24 = 0;
          _os_log_impl(&dword_25C89B000, v22, v23, "Could not convert disambiguation item to INObject", v24, 2u);
          MEMORY[0x261198330](v24, -1, -1);
          uint64_t v25 = v15;
        }
        else
        {
          uint64_t v25 = v22;
          uint64_t v22 = v15;
        }

        (*v14)(v28, v2);
      }
      else
      {
        if (qword_26A5D95A0 != -1) {
          swift_once();
        }
        uint64_t v17 = __swift_project_value_buffer(v2, (uint64_t)qword_26A5DD588);
        (*v29)(v7, v17, v2);
        uint64_t v18 = sub_25C8EC0D0();
        os_log_type_t v19 = sub_25C8EC2E0();
        if (os_log_type_enabled(v18, v19))
        {
          uint64_t v20 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v20 = 0;
          _os_log_impl(&dword_25C89B000, v18, v19, "Unexpected disambiguation item type", v20, 2u);
          MEMORY[0x261198330](v20, -1, -1);
        }

        (*v14)(v7, v2);
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
LABEL_22:
      v12 += 32;
      if (!--v11)
      {
        swift_bridgeObjectRelease();
        uint64_t v10 = v33;
        break;
      }
    }
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_25C8BDE38(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 >> 62) {
    goto LABEL_20;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = sub_25C8EC4F0())
  {
    uint64_t v7 = 4;
    while (1)
    {
      id v8 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x261197B40](v7 - 4, a1) : *(id *)(a1 + 8 * v7);
      uint64_t v9 = v8;
      uint64_t v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1)) {
        break;
      }
      uint64_t v11 = sub_25C8BBCB4(v8);
      if (v12)
      {
        if (v11 == a2 && v12 == a3)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v9;
        }
        char v14 = sub_25C8EC550();
        swift_bridgeObjectRelease();
        if (v14)
        {
          swift_bridgeObjectRelease();
          goto LABEL_18;
        }
      }

      ++v7;
      if (v10 == v6) {
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_21:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_25C8BDFC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v105 = a2;
  uint64_t v103 = sub_25C8EB910();
  OUTLINED_FUNCTION_0_2();
  uint64_t v100 = v3;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_24_1();
  uint64_t v99 = v5;
  uint64_t v106 = sub_25C8EC0F0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_40_0();
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v104 = (void (*)(char *, uint64_t))((char *)v95 - v11);
  MEMORY[0x270FA5388](v10);
  uint64_t v102 = (char *)v95 - v12;
  uint64_t v13 = sub_25C8EB950();
  OUTLINED_FUNCTION_0_2();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_40_0();
  MEMORY[0x270FA5388](v17);
  os_log_type_t v19 = (char *)v95 - v18;
  uint64_t v20 = sub_25C8EB940();
  OUTLINED_FUNCTION_0_2();
  uint64_t v22 = v21;
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_40_0();
  uint64_t v25 = MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)v95 - v26;
  MEMORY[0x270FA5388](v25);
  uint64_t v29 = (char *)v95 - v28;
  sub_25C8EB900();
  BOOL v34 = (*(unsigned int (**)(char *, uint64_t))(v15 + 88))(v19, v13) == *MEMORY[0x263F6FF70];
  uint64_t v101 = v15;
  if (!v34)
  {
    OUTLINED_FUNCTION_9_1();
    uint64_t v37 = v36();
    goto LABEL_10;
  }
  (*(void (**)(char *, uint64_t))(v15 + 96))(v19, v13);
  uint64_t v97 = v22;
  (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v29, v19, v20);
  uint64_t v30 = sub_25C8EB920();
  uint64_t v32 = v31;
  if (qword_26A5D9540 != -1) {
    swift_once();
  }
  uint64_t v96 = a1;
  uint64_t v33 = v7;
  BOOL v34 = v30 == *(void *)(qword_26A5DD528 + 96) && v32 == *(void *)(qword_26A5DD528 + 104);
  if (v34) {
    char v35 = 1;
  }
  else {
    char v35 = sub_25C8EC550();
  }
  swift_bridgeObjectRelease();
  uint64_t v65 = v97;
  uint64_t v66 = *(void (**)(uint64_t))(v97 + 16);
  uint64_t v67 = OUTLINED_FUNCTION_34_0();
  v66(v67);
  if (v35) {
    goto LABEL_33;
  }
  if (sub_25C8EB920() == *(void *)(qword_26A5DD528 + 112) && v68 == *(void *)(qword_26A5DD528 + 120))
  {
    swift_bridgeObjectRelease();
LABEL_33:
    uint64_t v104 = *(void (**)(char *, uint64_t))(v65 + 8);
    v104(v27, v20);
    goto LABEL_34;
  }
  char v70 = sub_25C8EC550();
  swift_bridgeObjectRelease();
  uint64_t v71 = *(void (**)(char *, uint64_t))(v65 + 8);
  v71(v27, v20);
  if ((v70 & 1) == 0)
  {
    uint64_t v94 = OUTLINED_FUNCTION_48_0();
    uint64_t v37 = ((uint64_t (*)(uint64_t))v71)(v94);
    uint64_t v7 = v33;
    a1 = v96;
LABEL_10:
    uint64_t v38 = v100;
    uint64_t v39 = v99;
    if (qword_26A5D95A8 != -1) {
      uint64_t v37 = swift_once();
    }
    OUTLINED_FUNCTION_45_0(v37, (uint64_t)qword_26A5DD5A0);
    uint64_t v40 = *(void *)(v7 + 16);
    uint64_t v97 = v41;
    uint64_t v98 = v7 + 16;
    v95[1] = v40;
    OUTLINED_FUNCTION_5_2();
    v42();
    OUTLINED_FUNCTION_5_2();
    v43();
    uint64_t v44 = v7;
    uint64_t v45 = sub_25C8EC0D0();
    os_log_type_t v46 = sub_25C8EC2D0();
    if (os_log_type_enabled(v45, v46))
    {
      uint64_t v47 = (uint8_t *)OUTLINED_FUNCTION_8_0();
      uint64_t v48 = OUTLINED_FUNCTION_10_1();
      uint64_t v102 = (char *)v13;
      *(void *)&long long v107 = v48;
      uint64_t v96 = a1;
      *(_DWORD *)uint64_t v47 = 136315138;
      v95[0] = v44;
      sub_25C8EB900();
      uint64_t v49 = sub_25C8EC180();
      uint64_t v51 = sub_25C8BB4F0(v49, v50, (uint64_t *)&v107);
      OUTLINED_FUNCTION_57(v51);
      sub_25C8EC360();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v39, v103);
      _os_log_impl(&dword_25C89B000, v45, v46, "SwitchProfileDisambiguationStrategy.actionForInput() received parse: %s", v47, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();

      uint64_t v52 = *(void (**)(void))(v95[0] + 8);
    }
    else
    {
      uint64_t v53 = OUTLINED_FUNCTION_48_0();
      v54(v53);

      uint64_t v52 = *(void (**)(void))(v44 + 8);
    }
    OUTLINED_FUNCTION_11_0();
    v52();
    sub_25C8EB900();
    sub_25C8C93E8((uint64_t)&v107);
    uint64_t v55 = OUTLINED_FUNCTION_58();
    v56(v55);
    if (!v108)
    {
      sub_25C89F4B0((uint64_t)&v107, (uint64_t *)&unk_26A5D9FE0);
      return sub_25C8EB510();
    }
    sub_25C8A4290(&v107, (uint64_t)v110);
    __swift_project_boxed_opaque_existential_1(v110, (uint64_t)v111);
    uint64_t v57 = OUTLINED_FUNCTION_49_0();
    int v59 = v58(v57);
    uint64_t v60 = v111;
    __swift_project_boxed_opaque_existential_1(v110, (uint64_t)v111);
    if (v59 == 3)
    {
      uint64_t v61 = OUTLINED_FUNCTION_50_0();
      v62(v61);
      uint64_t v64 = v63;
      swift_bridgeObjectRelease();
      if (v64) {
        goto LABEL_18;
      }
      sub_25C8A7E98((uint64_t)v110, (uint64_t)v109);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9FC8);
      if (swift_dynamicCast())
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        __swift_project_boxed_opaque_existential_1(v110, (uint64_t)v111);
        uint64_t v90 = OUTLINED_FUNCTION_49_0();
        v91(v90);
        uint64_t v93 = v92;
        swift_bridgeObjectRelease();
        if (v93)
        {
LABEL_18:
          sub_25C8EB500();
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v110);
        }
      }
    }
    else
    {
      uint64_t v73 = OUTLINED_FUNCTION_50_0();
      if ((v74(v73) - 1) <= 1u)
      {
        OUTLINED_FUNCTION_5_2();
        v75();
        uint64_t v76 = sub_25C8EC0D0();
        os_log_type_t v77 = sub_25C8EC2D0();
        if (os_log_type_enabled(v76, v77))
        {
          uint64_t v78 = (_WORD *)OUTLINED_FUNCTION_5_0();
          OUTLINED_FUNCTION_27(v78);
          _os_log_impl(&dword_25C89B000, v76, v77, "SwitchProfile disambiguation cancelled.", v60, 2u);
          OUTLINED_FUNCTION_3();
        }

        OUTLINED_FUNCTION_11_0();
        v52();
        sub_25C8EB4F0();
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v110);
      }
    }
    sub_25C8EB510();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v110);
  }
  uint64_t v104 = v71;
LABEL_34:
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v106, (uint64_t)qword_26A5DD5A0);
  OUTLINED_FUNCTION_5_2();
  v79();
  uint64_t v80 = OUTLINED_FUNCTION_34_0();
  v66(v80);
  uint64_t v81 = sub_25C8EC0D0();
  os_log_type_t v82 = sub_25C8EC2D0();
  if (os_log_type_enabled(v81, v82))
  {
    uint64_t v83 = (uint8_t *)OUTLINED_FUNCTION_8_0();
    uint64_t v103 = OUTLINED_FUNCTION_10_1();
    *(void *)&long long v107 = v103;
    *(_DWORD *)uint64_t v83 = 136315138;
    uint64_t v84 = sub_25C8EB920();
    uint64_t v86 = sub_25C8BB4F0(v84, v85, (uint64_t *)&v107);
    OUTLINED_FUNCTION_57(v86);
    OUTLINED_FUNCTION_59();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_36_1();
    uint64_t v87 = (void (*)(void))v104;
    OUTLINED_FUNCTION_11_0();
    v87();
    _os_log_impl(&dword_25C89B000, v81, v82, "SwitchProfileDisambiguationStrategy.actionForInput() handling direct invocation from %s", v83, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
  }
  else
  {
    OUTLINED_FUNCTION_36_1();
    uint64_t v87 = (void (*)(void))v104;
    OUTLINED_FUNCTION_11_0();
    v87();
  }

  OUTLINED_FUNCTION_27_0();
  v88();
  sub_25C8EB500();
  uint64_t v89 = OUTLINED_FUNCTION_48_0();
  return ((uint64_t (*)(uint64_t))v87)(v89);
}

uint64_t sub_25C8BE9FC()
{
  OUTLINED_FUNCTION_6_1();
  v0[27] = v1;
  v0[28] = v2;
  v0[25] = v3;
  v0[26] = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9FA8);
  v0[29] = v5;
  OUTLINED_FUNCTION_1_2(v5);
  v0[30] = v6;
  v0[31] = OUTLINED_FUNCTION_11_1();
  v0[32] = swift_task_alloc();
  uint64_t v7 = sub_25C8EB910();
  v0[33] = v7;
  OUTLINED_FUNCTION_1_2(v7);
  v0[34] = v8;
  v0[35] = OUTLINED_FUNCTION_13();
  uint64_t v9 = sub_25C8EB940();
  v0[36] = v9;
  OUTLINED_FUNCTION_1_2(v9);
  v0[37] = v10;
  v0[38] = OUTLINED_FUNCTION_13();
  uint64_t v11 = sub_25C8EB9D0();
  v0[39] = v11;
  OUTLINED_FUNCTION_1_2(v11);
  v0[40] = v12;
  v0[41] = OUTLINED_FUNCTION_13();
  uint64_t v13 = sub_25C8EB980();
  v0[42] = v13;
  OUTLINED_FUNCTION_1_2(v13);
  v0[43] = v14;
  v0[44] = OUTLINED_FUNCTION_13();
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5D9FB0);
  v0[45] = v15;
  OUTLINED_FUNCTION_1_2(v15);
  v0[46] = v16;
  v0[47] = OUTLINED_FUNCTION_11_1();
  v0[48] = swift_task_alloc();
  uint64_t v17 = type metadata accessor for IdentityNLv3Intent();
  v0[49] = v17;
  OUTLINED_FUNCTION_19(v17);
  v0[50] = OUTLINED_FUNCTION_13();
  uint64_t v18 = sub_25C8EBDD0();
  v0[51] = v18;
  OUTLINED_FUNCTION_1_2(v18);
  v0[52] = v19;
  v0[53] = OUTLINED_FUNCTION_11_1();
  v0[54] = swift_task_alloc();
  v0[55] = swift_task_alloc();
  uint64_t v20 = sub_25C8EB950();
  v0[56] = v20;
  OUTLINED_FUNCTION_1_2(v20);
  v0[57] = v21;
  v0[58] = OUTLINED_FUNCTION_11_1();
  v0[59] = swift_task_alloc();
  v0[60] = swift_task_alloc();
  v0[61] = swift_task_alloc();
  v0[62] = swift_task_alloc();
  v0[63] = swift_task_alloc();
  uint64_t v22 = sub_25C8EC0F0();
  v0[64] = v22;
  OUTLINED_FUNCTION_1_2(v22);
  v0[65] = v23;
  v0[66] = OUTLINED_FUNCTION_11_1();
  v0[67] = swift_task_alloc();
  v0[68] = swift_task_alloc();
  v0[69] = swift_task_alloc();
  v0[70] = swift_task_alloc();
  v0[71] = swift_task_alloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v24, v25, v26);
}

uint64_t sub_25C8BECE0()
{
  uint64_t v169 = v0;
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 568);
  uint64_t v2 = *(void *)(v0 + 520);
  __swift_project_value_buffer(*(void *)(v0 + 512), (uint64_t)qword_26A5DD5A0);
  (*(void (**)(uint64_t))(v2 + 16))(v1);
  uint64_t v3 = sub_25C8EC0D0();
  os_log_type_t v4 = sub_25C8EC2D0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (_WORD *)OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_27(v5);
    OUTLINED_FUNCTION_12_2(&dword_25C89B000, v3, v6, "SwitchProfileDisambiguationStrategy.parseDisambiguationResult() called");
    OUTLINED_FUNCTION_3();
  }
  uint64_t v7 = (uint64_t *)(v0 + 184);

  OUTLINED_FUNCTION_30_0();
  v166 = v8;
  OUTLINED_FUNCTION_9_1();
  v9();
  sub_25C8EB900();
  uint64_t v10 = OUTLINED_FUNCTION_47_0();
  int v12 = v11(v10);
  if (v12 == *MEMORY[0x263F6FF50])
  {
    uint64_t v13 = *(void *)(v0 + 496);
    uint64_t v15 = *(void *)(v0 + 432);
    uint64_t v14 = *(void *)(v0 + 440);
    uint64_t v16 = *(void *)(v0 + 408);
    uint64_t v17 = *(void *)(v0 + 416);
    OUTLINED_FUNCTION_5_2();
    v18();
    uint64_t v19 = OUTLINED_FUNCTION_51();
    v20(v19);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 32))(v14, v13, v16);
    OUTLINED_FUNCTION_5_2();
    v21();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v15, v14, v16);
    uint64_t v22 = sub_25C8EC0D0();
    os_log_type_t v23 = sub_25C8EC2D0();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)OUTLINED_FUNCTION_8_0();
      *(void *)&long long v167 = OUTLINED_FUNCTION_10_1();
      *(_DWORD *)uint64_t v24 = 136315138;
      char v165 = (void (*)(uint64_t, uint64_t))(v24 + 4);
      sub_25C8C4190(&qword_26A5D9FD8, 255, MEMORY[0x263F73760]);
      uint64_t v25 = sub_25C8EC540();
      *(void *)(v0 + 19sub_25C8B55A0(4, 3, 2, 2) = sub_25C8BB4F0(v25, v26, (uint64_t *)&v167);
      sub_25C8EC360();
      swift_bridgeObjectRelease();
      uint64_t v27 = OUTLINED_FUNCTION_17_3();
      v28(v27);
      _os_log_impl(&dword_25C89B000, v22, v23, "SwitchProfileDisambiguationStrategy.parseDisambiguationResult() matched NLv3Intent. intent: %s", v24, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();
    }
    else
    {
      uint64_t v42 = OUTLINED_FUNCTION_17_3();
      v43(v42);
    }
    OUTLINED_FUNCTION_23_1();
    v44();
    uint64_t v45 = *(void *)(v0 + 456);
    uint64_t v163 = *(void *)(v0 + 448);
    uint64_t v164 = *(void *)(v0 + 504);
    uint64_t v46 = *(void *)(v0 + 440);
    uint64_t v47 = *(void *)(v0 + 424);
    uint64_t v48 = *(uint64_t **)(v0 + 400);
    uint64_t v49 = *(void *)(v0 + 408);
    OUTLINED_FUNCTION_58();
    OUTLINED_FUNCTION_5_2();
    v50();
    sub_25C8A1598(v47, v48);
    sub_25C8C4190(&qword_26A5D9FD0, 255, (void (*)(uint64_t))type metadata accessor for IdentityNLv3Intent);
    swift_retain();
    sub_25C8EBC20();
    swift_release();
    uint64_t v51 = *(void *)(v0 + 160);
    unint64_t v52 = *(void *)(v0 + 168);
    swift_retain();
    sub_25C8EBC20();
    swift_release();
    uint64_t v54 = *(void *)(v0 + 144);
    uint64_t v53 = *(void *)(v0 + 152);
    sub_25C8A2CF0((uint64_t)v48);
    v165(v46, v49);
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v164, v163);
    if (v52)
    {
      swift_bridgeObjectRelease();
      uint64_t v7 = (uint64_t *)(v0 + 184);
      uint64_t v55 = v51;
      goto LABEL_20;
    }
    if (!v53)
    {
LABEL_46:
      OUTLINED_FUNCTION_5_2();
      v122();
      unint64_t v123 = sub_25C8EC0D0();
      os_log_type_t v124 = sub_25C8EC2E0();
      if (OUTLINED_FUNCTION_23(v124))
      {
        char v125 = (_WORD *)OUTLINED_FUNCTION_5_0();
        OUTLINED_FUNCTION_27(v125);
        OUTLINED_FUNCTION_12_2(&dword_25C89B000, v123, v126, "SwitchProfileDisambiguationStrategy.parseDisambiguationResult(): No ID or name found in disambiguation response");
        OUTLINED_FUNCTION_3();
      }

      OUTLINED_FUNCTION_9_1();
      v127();
      type metadata accessor for IdentityFlowError();
      OUTLINED_FUNCTION_19_3();
      char v128 = 1;
      goto LABEL_51;
    }
LABEL_63:
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5D9F90);
    uint64_t v156 = (void *)sub_25C8EB870();
    sub_25C8C3CC4(v54, v53, v156, (SEL *)&selRef_setName_);

    uint64_t v157 = (void *)sub_25C8EB870();
    objc_msgSend(v157, sel_setSwitchType_, 2);

    unint64_t v158 = (void *)sub_25C8EB870();
    uint64_t v159 = sub_25C8C3BFC(v158);
    if (v160)
    {
      *((void *)&v168 + 1) = MEMORY[0x263F8D310];
      *(void *)&long long v167 = v159;
      *((void *)&v167 + 1) = v160;
    }
    else
    {
      long long v167 = 0u;
      long long v168 = 0u;
    }
    sub_25C8EB870();
    type metadata accessor for SwitchProfileIntent();
    sub_25C8EB750();
    OUTLINED_FUNCTION_51();
    sub_25C8EB7B0();
    goto LABEL_67;
  }
  if (v12 != *MEMORY[0x263F6FF70])
  {
    if (v12 == *MEMORY[0x263F6FF58])
    {
      uint64_t v63 = v0 + 56;
      uint64_t v64 = *(uint64_t **)(v0 + 488);
      uint64_t v65 = *(void *)(v0 + 448);
      uint64_t v66 = *(void *)(v0 + 456);
      uint64_t v67 = *(void *)(v0 + 384);
      OUTLINED_FUNCTION_5_2();
      v68();
      (*(void (**)(uint64_t *, uint64_t))(v66 + 96))(v64, v65);
      uint64_t v69 = *v64;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9FC0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9FC8);
      sub_25C8EBE60();
      char v70 = (void (*)(uint64_t))sub_25C8EBE70();
      OUTLINED_FUNCTION_27_0();
      v71();
      *(void *)&long long v167 = v69;
      uint64_t v72 = OUTLINED_FUNCTION_55();
      v70(v72);
      if (v67)
      {
        uint64_t v73 = *(void *)(v0 + 504);
        uint64_t v74 = *(void *)(v0 + 448);
        uint64_t v75 = *(void *)(v0 + 456);
        swift_release();
        swift_unknownObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v73, v74);
LABEL_54:
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
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        OUTLINED_FUNCTION_9_0();
        goto LABEL_68;
      }
      swift_release();
      uint64_t v138 = *(void *)(v0 + 80);
      uint64_t v139 = *(void *)(v0 + 88);
      __swift_project_boxed_opaque_existential_1((void *)(v0 + 56), v138);
      uint64_t v54 = (*(uint64_t (**)(uint64_t, uint64_t))(v139 + 32))(v138, v139);
      uint64_t v53 = v140;
      swift_unknownObjectRelease();
    }
    else
    {
      if (v12 != *MEMORY[0x263F6FF80]) {
        goto LABEL_39;
      }
      uint64_t v89 = *(void *)(v0 + 480);
      uint64_t v91 = *(void *)(v0 + 344);
      uint64_t v90 = *(void *)(v0 + 352);
      uint64_t v92 = *(void *)(v0 + 336);
      OUTLINED_FUNCTION_5_2();
      v93();
      uint64_t v94 = OUTLINED_FUNCTION_35_0();
      v95(v94);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v91 + 32))(v90, v89, v92);
      sub_25C8EB970();
      uint64_t v96 = sub_25C8EBAA0();
      OUTLINED_FUNCTION_9_1();
      uint64_t v98 = v97();
      if (!v96)
      {
        if (qword_26A5D95B0 != -1) {
          uint64_t v98 = swift_once();
        }
        OUTLINED_FUNCTION_45_0(v98, (uint64_t)qword_26A5DD5B8);
        OUTLINED_FUNCTION_5_2();
        v141();
        uint64_t v142 = sub_25C8EC0D0();
        os_log_type_t v143 = sub_25C8EC2E0();
        if (OUTLINED_FUNCTION_23(v143))
        {
          unint64_t v144 = (_WORD *)OUTLINED_FUNCTION_5_0();
          OUTLINED_FUNCTION_27(v144);
          OUTLINED_FUNCTION_12_2(&dword_25C89B000, v142, v145, "Unable to convert usoParse to legacy first dialog act");
          OUTLINED_FUNCTION_3();
        }

        OUTLINED_FUNCTION_11_0();
        v146();
        type metadata accessor for IdentityFlowError();
        OUTLINED_FUNCTION_19_3();
        sub_25C8D786C(0);
        sub_25C8C4190((unint64_t *)&qword_26A5D9FA0, 255, (void (*)(uint64_t))type metadata accessor for IdentityFlowError);
        uint64_t v147 = OUTLINED_FUNCTION_22_2();
        OUTLINED_FUNCTION_39_1(v147, v148);
        OUTLINED_FUNCTION_9_1();
        v149();
        OUTLINED_FUNCTION_39_0();
        v150();
        goto LABEL_54;
      }
      uint64_t v63 = v0 + 16;
      uint64_t v99 = *(void *)(v0 + 360);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9FC0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9FC8);
      sub_25C8EBE60();
      uint64_t v100 = (void (*)(uint64_t))sub_25C8EBE70();
      OUTLINED_FUNCTION_27_0();
      v101();
      *(void *)&long long v167 = v96;
      uint64_t v102 = OUTLINED_FUNCTION_55();
      v100(v102);
      if (v99)
      {
        swift_release();
        OUTLINED_FUNCTION_39_0();
        v103();
        swift_unknownObjectRelease();
        OUTLINED_FUNCTION_27_0();
        v104();
        goto LABEL_54;
      }
      swift_release();
      uint64_t v151 = *(void *)(v0 + 40);
      uint64_t v152 = *(void *)(v0 + 48);
      __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), v151);
      uint64_t v54 = (*(uint64_t (**)(uint64_t, uint64_t))(v152 + 32))(v151, v152);
      uint64_t v53 = v153;
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_9_1();
      v154();
    }
    __swift_destroy_boxed_opaque_existential_1(v63);
    OUTLINED_FUNCTION_11_0();
    v155();
    if (!v53) {
      goto LABEL_46;
    }
    goto LABEL_63;
  }
  uint64_t v29 = *(void *)(v0 + 472);
  uint64_t v31 = *(void *)(v0 + 296);
  uint64_t v30 = *(void *)(v0 + 304);
  uint64_t v32 = *(void *)(v0 + 288);
  OUTLINED_FUNCTION_5_2();
  v33();
  uint64_t v34 = OUTLINED_FUNCTION_35_0();
  v35(v34);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 32))(v30, v29, v32);
  uint64_t v36 = sub_25C8EB920();
  uint64_t v38 = v37;
  if (qword_26A5D9540 != -1) {
    swift_once();
  }
  if (v36 == *(void *)(qword_26A5DD528 + 112) && v38 == *(void *)(qword_26A5DD528 + 120))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v40 = sub_25C8EC550();
    swift_bridgeObjectRelease();
    if ((v40 & 1) == 0)
    {
      OUTLINED_FUNCTION_11_0();
      v41();
LABEL_39:
      uint64_t v106 = *(void *)(v0 + 272);
      uint64_t v105 = *(void *)(v0 + 280);
      uint64_t v107 = *(void *)(v0 + 264);
      uint64_t v108 = *(void *)(v0 + 208);
      OUTLINED_FUNCTION_5_2();
      v109();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v106 + 16))(v105, v108, v107);
      v110 = sub_25C8EC0D0();
      os_log_type_t v111 = sub_25C8EC2E0();
      BOOL v112 = os_log_type_enabled(v110, v111);
      uint64_t v113 = *(void *)(v0 + 544);
      uint64_t v114 = *(void *)(v0 + 512);
      if (v112)
      {
        uint64_t v115 = (uint8_t *)OUTLINED_FUNCTION_8_0();
        *(void *)&long long v167 = OUTLINED_FUNCTION_10_1();
        *(_DWORD *)uint64_t v115 = 136315138;
        sub_25C8EB900();
        uint64_t v116 = sub_25C8EC180();
        *(void *)(v0 + 176) = sub_25C8BB4F0(v116, v117, (uint64_t *)&v167);
        sub_25C8EC360();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_9_1();
        v118();
        _os_log_impl(&dword_25C89B000, v110, v111, "Unsupported input parse type in parseDisambiguationResult %s", v115, 0xCu);
        OUTLINED_FUNCTION_26_1();
        OUTLINED_FUNCTION_3();
        OUTLINED_FUNCTION_3();

        OUTLINED_FUNCTION_23_1();
        v119();
      }
      else
      {
        OUTLINED_FUNCTION_11_0();
        v131();

        v166(v113, v114);
      }
      uint64_t v132 = *(void *)(v0 + 504);
      uint64_t v133 = *(void *)(v0 + 448);
      uint64_t v134 = *(void *)(v0 + 456);
      type metadata accessor for IdentityFlowError();
      OUTLINED_FUNCTION_19_3();
      sub_25C8D786C(0);
      sub_25C8C4190((unint64_t *)&qword_26A5D9FA0, 255, (void (*)(uint64_t))type metadata accessor for IdentityFlowError);
      uint64_t v135 = OUTLINED_FUNCTION_22_2();
      OUTLINED_FUNCTION_39_1(v135, v136);
      (*(void (**)(uint64_t, uint64_t))(v134 + 8))(v132, v133);
      goto LABEL_54;
    }
  }
  uint64_t v85 = sub_25C8EB930();
  if (!v85)
  {
    uint64_t v120 = OUTLINED_FUNCTION_38_1();
    v121(v120);
    *(_OWORD *)(v0 + 96) = 0u;
    *(_OWORD *)(v0 + 11sub_25C8B55A0(4, 3, 2, 2) = 0u;
    goto LABEL_44;
  }
  sub_25C8E4D64(0x696669746E656469, 0xEA00000000007265, v85, (_OWORD *)(v0 + 96));
  swift_bridgeObjectRelease();
  uint64_t v86 = OUTLINED_FUNCTION_38_1();
  v87(v86);
  if (!*(void *)(v0 + 120))
  {
LABEL_44:
    sub_25C89F4B0(v0 + 96, &qword_26A5D9B28);
    goto LABEL_45;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_45:
    (*(void (**)(void, void))(*(void *)(v0 + 456) + 8))(*(void *)(v0 + 504), *(void *)(v0 + 448));
    goto LABEL_46;
  }
  uint64_t v55 = *(void *)(v0 + 128);
  unint64_t v52 = *(void *)(v0 + 136);
  OUTLINED_FUNCTION_11_0();
  v88();
LABEL_20:
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9F78);
  unint64_t v56 = sub_25C8EB860();
  swift_bridgeObjectRetain();
  uint64_t v57 = sub_25C8BDE38(v56, v55, v52);
  swift_bridgeObjectRelease();
  if (!v57)
  {
    OUTLINED_FUNCTION_5_2();
    v76();
    swift_bridgeObjectRetain();
    os_log_type_t v77 = sub_25C8EC0D0();
    os_log_type_t v78 = sub_25C8EC2E0();
    BOOL v79 = os_log_type_enabled(v77, v78);
    uint64_t v80 = *(void *)(v0 + 536);
    uint64_t v81 = *(void *)(v0 + 512);
    if (v79)
    {
      uint64_t v82 = v55;
      uint64_t v83 = (uint8_t *)OUTLINED_FUNCTION_8_0();
      *(void *)&long long v167 = OUTLINED_FUNCTION_10_1();
      *(_DWORD *)uint64_t v83 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t *v7 = sub_25C8BB4F0(v82, v52, (uint64_t *)&v167);
      OUTLINED_FUNCTION_59();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25C89B000, v77, v78, "SwitchProfileDisambiguationStrategy.parseDisambiguationResult(): No matching account for the identifier '%s'", v83, 0xCu);
      OUTLINED_FUNCTION_26_1();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();

      OUTLINED_FUNCTION_23_1();
      v84();
    }
    else
    {
      swift_bridgeObjectRelease_n();

      v166(v80, v81);
    }
    type metadata accessor for IdentityFlowError();
    OUTLINED_FUNCTION_19_3();
    char v128 = 2;
LABEL_51:
    sub_25C8D786C(v128);
    sub_25C8C4190((unint64_t *)&qword_26A5D9FA0, 255, (void (*)(uint64_t))type metadata accessor for IdentityFlowError);
    uint64_t v129 = OUTLINED_FUNCTION_44_0();
    OUTLINED_FUNCTION_39_1(v129, v130);
    goto LABEL_54;
  }
  id v58 = v57;
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5D9F90);
  int v59 = (void *)sub_25C8EB870();
  objc_msgSend(v59, sel_setAccount_, v58);

  uint64_t v60 = (void *)sub_25C8EB870();
  objc_msgSend(v60, sel_setSwitchType_, 1);

  uint64_t v61 = (void *)sub_25C8EB870();
  id v62 = objc_msgSend(v61, sel_account);

  if (v62)
  {
    *((void *)&v168 + 1) = type metadata accessor for Account();
    *(void *)&long long v167 = v62;
  }
  else
  {
    long long v167 = 0u;
    long long v168 = 0u;
  }
  sub_25C8EB870();
  type metadata accessor for SwitchProfileIntent();
  sub_25C8EB750();
  OUTLINED_FUNCTION_47_0();
  sub_25C8EB7B0();

LABEL_67:
  OUTLINED_FUNCTION_11_0();
  v161();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_15_2();
LABEL_68:
  return v137();
}

uint64_t sub_25C8C00F0()
{
  OUTLINED_FUNCTION_6_1();
  v0[2] = v1;
  uint64_t v2 = sub_25C8EB770();
  v0[3] = v2;
  OUTLINED_FUNCTION_1_2(v2);
  v0[4] = v3;
  v0[5] = OUTLINED_FUNCTION_13();
  uint64_t v4 = sub_25C8EC0F0();
  v0[6] = v4;
  OUTLINED_FUNCTION_1_2(v4);
  v0[7] = v5;
  v0[8] = OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

void sub_25C8C01AC()
{
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(*(void *)(v0 + 48), (uint64_t)qword_26A5DD5A0);
  uint64_t v1 = OUTLINED_FUNCTION_43();
  v2(v1);
  uint64_t v3 = sub_25C8EC0D0();
  os_log_type_t v4 = sub_25C8EC2D0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (_WORD *)OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_27(v5);
    OUTLINED_FUNCTION_12_2(&dword_25C89B000, v3, v6, "SwitchProfileDisambiguationStrategy.makeDisambiguationItemContainer() called");
    OUTLINED_FUNCTION_3();
  }

  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_39_0();
  v7();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5D9F90);
  sub_25C8EB890();
  uint64_t v8 = sub_25C8EB760();
  uint64_t v10 = v9;
  OUTLINED_FUNCTION_47_0();
  OUTLINED_FUNCTION_9_1();
  v11();
  if (v8 == 0x746E756F636361 && v10 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v13 = OUTLINED_FUNCTION_24_2();
    swift_bridgeObjectRelease();
    if ((v13 & 1) == 0)
    {
      type metadata accessor for IdentityFlowError();
      OUTLINED_FUNCTION_19_3();
      uint64_t v14 = sub_25C8D786C(1);
      sub_25C8C4190((unint64_t *)&qword_26A5D9FA0, 255, (void (*)(uint64_t))type metadata accessor for IdentityFlowError);
      OUTLINED_FUNCTION_22_2();
      uint64_t *v15 = v14;
      swift_willThrow();
      swift_task_dealloc();
      swift_task_dealloc();
      OUTLINED_FUNCTION_9_0();
      OUTLINED_FUNCTION_6_3();
      __asm { BRAA            X1, X16 }
    }
  }
  uint64_t v18 = (void *)sub_25C8EB880();
  sub_25C8BD9E0();

  __swift_instantiateConcreteTypeFromMangledName(qword_26A5D9EC8);
  swift_allocObject();
  sub_25C8EB8A0();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_6_3();
  __asm { BRAA            X2, X16 }
}

uint64_t sub_25C8C0474()
{
  OUTLINED_FUNCTION_6_1();
  v1[9] = v2;
  v1[10] = v0;
  v1[7] = v3;
  v1[8] = v4;
  uint64_t v5 = sub_25C8EB770();
  v1[11] = v5;
  OUTLINED_FUNCTION_1_2(v5);
  v1[12] = v6;
  v1[13] = OUTLINED_FUNCTION_13();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9DC0);
  OUTLINED_FUNCTION_19(v7);
  v1[14] = OUTLINED_FUNCTION_13();
  uint64_t v8 = sub_25C8EB490();
  v1[15] = v8;
  OUTLINED_FUNCTION_1_2(v8);
  v1[16] = v9;
  v1[17] = OUTLINED_FUNCTION_13();
  uint64_t v10 = sub_25C8EC0F0();
  v1[18] = v10;
  OUTLINED_FUNCTION_1_2(v10);
  v1[19] = v11;
  v1[20] = OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v12, v13, v14);
}

uint64_t sub_25C8C0588()
{
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[19];
  uint64_t v2 = v0[20];
  uint64_t v3 = v0[18];
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_26A5DD5A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v2, v4, v3);
  uint64_t v5 = sub_25C8EC0D0();
  os_log_type_t v6 = sub_25C8EC2D0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)OUTLINED_FUNCTION_5_0();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_25C89B000, v5, v6, "SwitchProfileDisambiguationStrategy.makePromptForDisambiguation() called", v7, 2u);
    OUTLINED_FUNCTION_3();
  }
  uint64_t v8 = v0[17];
  uint64_t v10 = v0[15];
  uint64_t v9 = v0[16];

  uint64_t v11 = OUTLINED_FUNCTION_51();
  v12(v11);
  sub_25C8EB320();
  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  (*(void (**)(uint64_t, void, uint64_t))(v9 + 104))(v8, *MEMORY[0x263F6F940], v10);
  type metadata accessor for SwitchProfileIntent();
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  uint64_t result = sub_25C8C406C(ObjCClassFromMetadata);
  if (v15)
  {
    uint64_t v16 = v0[14];
    sub_25C8EB400();
    uint64_t v17 = sub_25C8EB3A0();
    __swift_storeEnumTagSinglePayload(v16, 1, 1, v17);
    sub_25C8EB3F0();
    sub_25C8EB330();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5D9F90);
    sub_25C8EB890();
    uint64_t v18 = sub_25C8EB760();
    uint64_t v20 = v19;
    OUTLINED_FUNCTION_27_0();
    v21();
    if (v18 == 0x746E756F636361 && v20 == 0xE700000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v23 = OUTLINED_FUNCTION_24_2();
      swift_bridgeObjectRelease();
      if ((v23 & 1) == 0)
      {
        type metadata accessor for IdentityFlowError();
        OUTLINED_FUNCTION_19_3();
        uint64_t v24 = sub_25C8D786C(1);
        sub_25C8C4190((unint64_t *)&qword_26A5D9FA0, 255, (void (*)(uint64_t))type metadata accessor for IdentityFlowError);
        OUTLINED_FUNCTION_44_0();
        *uint64_t v25 = v24;
        swift_willThrow();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        OUTLINED_FUNCTION_9_0();
        OUTLINED_FUNCTION_18_3();
        __asm { BRAA            X1, X16 }
      }
    }
    uint64_t v28 = *(void **)(v0[10] + 104);
    v0[21] = v28;
    if (v28)
    {
      id v29 = v28;
      swift_task_alloc();
      OUTLINED_FUNCTION_20();
      v0[22] = v30;
      *uint64_t v30 = v31;
      v30[1] = sub_25C8C09D8;
      OUTLINED_FUNCTION_18_3();
      return sub_25C8C0D30();
    }
    else
    {
      swift_task_alloc();
      OUTLINED_FUNCTION_20();
      v0[24] = v33;
      *uint64_t v33 = v34;
      v33[1] = sub_25C8C0B3C;
      OUTLINED_FUNCTION_18_3();
      return sub_25C8C10D0();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_25C8C09D8()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_4();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v5 = v4;
  *(void *)(v6 + 18sub_25C8B55A0(4, 3, 2, 4) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C8C0AB4()
{
  OUTLINED_FUNCTION_12_1();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_15_2();
  return v1();
}

uint64_t sub_25C8C0B3C()
{
  OUTLINED_FUNCTION_26_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_25C8C0CA4()
{
  OUTLINED_FUNCTION_12_1();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  return v1();
}

uint64_t sub_25C8C0D30()
{
  OUTLINED_FUNCTION_6_1();
  v1[5] = v2;
  v1[6] = v0;
  v1[3] = v3;
  v1[4] = v4;
  v1[2] = v5;
  uint64_t v6 = sub_25C8EB740();
  v1[7] = v6;
  OUTLINED_FUNCTION_1_2(v6);
  v1[8] = v7;
  v1[9] = OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_25C8C0DC4()
{
  OUTLINED_FUNCTION_26_0();
  uint64_t v1 = v0[6];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5D9F90);
  v0[10] = sub_25C8EB880();
  sub_25C8BD9E0();
  uint64_t v2 = (void *)OUTLINED_FUNCTION_51();
  sub_25C8C1AF0(v2, v3);
  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_1((void *)(v1 + 16), *(void *)(v1 + 40));
  uint64_t v8 = (uint64_t (*)(uint64_t, unint64_t, unint64_t))((char *)&dword_26A5DA6C8 + dword_26A5DA6C8);
  swift_task_alloc();
  OUTLINED_FUNCTION_20();
  v0[11] = v4;
  *uint64_t v4 = v5;
  v4[1] = sub_25C8C0ED4;
  uint64_t v6 = v0[9];
  return v8(v6, 0xD000000000000026, 0x800000025C8F0ED0);
}

uint64_t sub_25C8C0ED4()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_4();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v5 = v4;
  *(void *)(v6 + 96) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C8C0FB0()
{
  OUTLINED_FUNCTION_33_0();
  uint64_t v1 = *(void **)(v0 + 80);
  uint64_t v2 = *(uint64_t **)(v0 + 16);
  uint64_t v3 = sub_25C8EB9A0();
  uint64_t v4 = MEMORY[0x263F6FFF0];
  v2[3] = v3;
  v2[4] = v4;
  __swift_allocate_boxed_opaque_existential_1Tm(v2);
  OUTLINED_FUNCTION_53();

  OUTLINED_FUNCTION_27_0();
  v5();
  swift_task_dealloc();
  OUTLINED_FUNCTION_15_2();
  return v6();
}

uint64_t sub_25C8C106C()
{
  OUTLINED_FUNCTION_6_1();

  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  return v1();
}

uint64_t sub_25C8C10D0()
{
  OUTLINED_FUNCTION_6_1();
  v1[4] = v2;
  v1[5] = v0;
  v1[2] = v3;
  v1[3] = v4;
  uint64_t v5 = sub_25C8EB740();
  v1[6] = v5;
  OUTLINED_FUNCTION_1_2(v5);
  v1[7] = v6;
  v1[8] = OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C8C1160()
{
  OUTLINED_FUNCTION_33_0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5D9F90);
  v0[9] = sub_25C8EB880();
  unint64_t v1 = sub_25C8BD9E0();
  unint64_t v2 = v1;
  if (v1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v3 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_25C8EC4F0())
  {
    uint64_t v4 = 0;
    while (1)
    {
      id v5 = (v2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x261197B40](v4, v2) : *(id *)(v2 + 8 * v4 + 32);
      uint64_t v6 = v5;
      uint64_t v7 = v4 + 1;
      if (__OFADD__(v4, 1)) {
        break;
      }
      unsigned int v8 = objc_msgSend(v5, sel_noNameMatched);

      ++v4;
      if (v8) {
        BOOL v9 = v7 == v3;
      }
      else {
        BOOL v9 = 1;
      }
      if (v9) {
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
  }
  LOBYTE(v8) = 1;
LABEL_17:
  swift_bridgeObjectRelease_n();
  swift_task_alloc();
  OUTLINED_FUNCTION_20();
  v0[10] = v10;
  *uint64_t v10 = v11;
  v10[1] = sub_25C8C12E8;
  uint64_t v12 = v0[8];
  return sub_25C8B29C4(v12, v8);
}

uint64_t sub_25C8C12E8()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_4();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3_1();
  *id v5 = v4;
  *(void *)(v6 + 88) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C8C13C4()
{
  OUTLINED_FUNCTION_33_0();
  unint64_t v1 = *(void **)(v0 + 72);
  uint64_t v2 = *(uint64_t **)(v0 + 16);
  uint64_t v3 = sub_25C8EB9A0();
  uint64_t v4 = MEMORY[0x263F6FFF0];
  v2[3] = v3;
  v2[4] = v4;
  __swift_allocate_boxed_opaque_existential_1Tm(v2);
  OUTLINED_FUNCTION_53();

  OUTLINED_FUNCTION_27_0();
  v5();
  swift_task_dealloc();
  OUTLINED_FUNCTION_15_2();
  return v6();
}

uint64_t sub_25C8C147C()
{
  OUTLINED_FUNCTION_6_1();

  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  return v1();
}

uint64_t sub_25C8C14E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v30 = a3;
  uint64_t v29 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9F70);
  uint64_t v5 = OUTLINED_FUNCTION_19(v4);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25C8EB720();
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_24_1();
  uint64_t v32 = v10;
  uint64_t v11 = sub_25C8EC0F0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_4_1();
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v11, (uint64_t)qword_26A5DD5A0);
  OUTLINED_FUNCTION_5_2();
  v15();
  uint64_t v16 = sub_25C8EC0D0();
  os_log_type_t v17 = sub_25C8EC2D0();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)OUTLINED_FUNCTION_5_0();
    uint64_t v28 = v7;
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl(&dword_25C89B000, v16, v17, "SwitchProfileDisambiguationStrategy.generateOutputsForDisambiguation() called", v18, 2u);
    uint64_t v7 = v28;
    OUTLINED_FUNCTION_3();
  }

  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v3, v11);
  sub_25C8BD9E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9F78);
  unint64_t v19 = sub_25C8EB850();
  sub_25C8E0A4C(v19, v32);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_15();
  uint64_t v20 = v31;
  sub_25C8C1808(v21, v22, v23);
  swift_bridgeObjectRelease();
  sub_25C8A7E98(v20 + 192, (uint64_t)v35);
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_5_2();
  v24();
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v8);
  uint64_t v34 = 0;
  memset(v33, 0, sizeof(v33));
  sub_25C8EB630();
  swift_bridgeObjectRelease();
  sub_25C89F4B0((uint64_t)v33, &qword_26A5D9F80);
  sub_25C89F4B0((uint64_t)v7, &qword_26A5D9F70);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
  OUTLINED_FUNCTION_48_0();
  OUTLINED_FUNCTION_39_0();
  return v25();
}

uint64_t sub_25C8C1808(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = a1;
  uint64_t v25 = MEMORY[0x263F8EE78];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_25C8EC4F0();
  }
  else
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  uint64_t v6 = &off_25C8ED000;
  if (!v5)
  {
    swift_bridgeObjectRelease();
    uint64_t v18 = MEMORY[0x263F8EE78];
LABEL_19:
    id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64F50]), sel_init);
    sub_25C8C40D0(v18, v19, &qword_26A5D9F60, 0x263F64FB0, (SEL *)&selRef_setItems_);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA610);
    uint64_t v20 = OUTLINED_FUNCTION_19_3();
    *(_OWORD *)(v20 + 16) = *((_OWORD *)v6 + 215);
    *(void *)(v20 + 3sub_25C8B55A0(4, 3, 2, 2) = v19;
    uint64_t v24 = v20;
    sub_25C8EC220();
    return v24;
  }
  uint64_t result = sub_25C8C4154(0, (unint64_t *)&unk_26A5D9F50);
  if (v5 >= 1)
  {
    uint64_t v8 = 0;
    unint64_t v21 = v4 & 0xC000000000000001;
    unint64_t v9 = v4;
    do
    {
      if (v21) {
        id v10 = (id)MEMORY[0x261197B40](v8, v4);
      }
      else {
        id v10 = *(id *)(v4 + 8 * v8 + 32);
      }
      id v11 = v10;
      id v12 = sub_25C8C7B68(v11);
      id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64FB0]), sel_init);
      objc_msgSend(v13, sel_setObject_, v12);
      if (*(void *)(v3 + 104) && a3)
      {
        id v14 = sub_25C8C2B94();
        if (!v14) {
          id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64ED8]), sel_init);
        }
      }
      else
      {
        id v14 = sub_25C8C6EB8();
      }
      id v15 = v14;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA610);
      uint64_t v16 = OUTLINED_FUNCTION_19_3();
      *(_OWORD *)(v16 + 16) = xmmword_25C8EDD70;
      *(void *)(v16 + 3sub_25C8B55A0(4, 3, 2, 2) = v15;
      uint64_t v23 = v16;
      sub_25C8EC220();
      swift_unknownObjectRetain();
      sub_25C8C3FF4(v23, v13);
      id v17 = v13;
      MEMORY[0x261197930]();
      if (*(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_25C8EC230();
      }
      ++v8;
      OUTLINED_FUNCTION_58();
      sub_25C8EC250();
      sub_25C8EC220();

      swift_unknownObjectRelease();
      unint64_t v4 = v9;
    }
    while (v5 != v8);
    swift_bridgeObjectRelease();
    uint64_t v18 = v25;
    uint64_t v6 = &off_25C8ED000;
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_25C8C1AF0(void *a1, uint64_t a2)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9F08);
  uint64_t v7 = OUTLINED_FUNCTION_19(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_26();
  uint64_t v8 = sub_25C8EC2B0();
  __swift_storeEnumTagSinglePayload(v3, 1, 1, v8);
  unint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v2;
  v9[5] = a2;
  v9[6] = a1;
  swift_retain();
  swift_bridgeObjectRetain();
  id v10 = a1;
  sub_25C8C2A24(v3, (uint64_t)&unk_26A5D9F18, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_25C8C1BD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[18] = a5;
  v6[19] = a6;
  v6[17] = a4;
  uint64_t v7 = sub_25C8EC0F0();
  v6[20] = v7;
  v6[21] = *(void *)(v7 - 8);
  v6[22] = swift_task_alloc();
  v6[23] = swift_task_alloc();
  v6[24] = swift_task_alloc();
  v6[25] = swift_task_alloc();
  v6[26] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C8C1CCC, 0, 0);
}

uint64_t sub_25C8C1CCC()
{
  OUTLINED_FUNCTION_26_0();
  if (qword_26A5D95A8 != -1) {
    uint64_t v1 = swift_once();
  }
  uint64_t v2 = v0[21];
  v0[27] = OUTLINED_FUNCTION_45_0(v1, (uint64_t)qword_26A5DD5A0);
  v0[28] = *(void *)(v2 + 16);
  v0[29] = (v2 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  uint64_t v3 = OUTLINED_FUNCTION_43();
  v4(v3);
  uint64_t v5 = sub_25C8EC0D0();
  os_log_type_t v6 = sub_25C8EC2D0();
  if (OUTLINED_FUNCTION_23(v6))
  {
    uint64_t v7 = (_WORD *)OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_27(v7);
    OUTLINED_FUNCTION_12_2(&dword_25C89B000, v5, v8, "SwitchProfileDisambiguationStrategy.presentContentDisambiguationView() called");
    OUTLINED_FUNCTION_3();
  }
  uint64_t v9 = v0[21];
  uint64_t v10 = v0[17];

  v0[30] = *(void *)(v9 + 8);
  v0[31] = (v9 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  uint64_t v11 = OUTLINED_FUNCTION_51();
  v12(v11);
  sub_25C8A7E98(v10 + 152, (uint64_t)(v0 + 2));
  uint64_t v13 = v0[5];
  uint64_t v14 = v0[6];
  id v15 = (void *)OUTLINED_FUNCTION_30_0();
  __swift_project_boxed_opaque_existential_1(v15, v16);
  id v17 = (void *)swift_task_alloc();
  v0[32] = v17;
  *id v17 = v0;
  v17[1] = sub_25C8C1E64;
  return MEMORY[0x270F72ED8](4000, 4000, v13, v14);
}

uint64_t sub_25C8C1E64()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_4();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 26sub_25C8B55A0(4, 3, 2, 4) = v4;
  *(void *)(v2 + 27sub_25C8B55A0(4, 3, 2, 2) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_25C8C1F48()
{
  OUTLINED_FUNCTION_33_0();
  unint64_t v1 = v0[33];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  if (v1 >> 62) {
    goto LABEL_23;
  }
  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v2)
  {
    while (1)
    {
      uint64_t v3 = v0[33];
      unint64_t v4 = v1 & 0xC000000000000001;
      id v5 = (v1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x261197B40](0, v3) : *(id *)(v3 + 32);
      uint64_t v6 = v5;
      sub_25C8EBFF0();
      uint64_t v7 = sub_25C8EC080();
      if (v7 == sub_25C8EC080()) {
        break;
      }

      if (v2 != 1)
      {
        uint64_t v25 = v0[33];
        uint64_t v26 = 5;
        while (1)
        {
          unint64_t v1 = v26 - 4;
          id v27 = v4 ? (id)MEMORY[0x261197B40](v26 - 4, v0[33]) : *(id *)(v25 + 8 * v26);
          uint64_t v6 = v27;
          uint64_t v28 = v26 - 3;
          if (__OFADD__(v1, 1)) {
            break;
          }
          sub_25C8EBFF0();
          uint64_t v29 = sub_25C8EC080();
          if (v29 == sub_25C8EC080()) {
            goto LABEL_6;
          }

          ++v26;
          if (v28 == v2) {
            goto LABEL_17;
          }
        }
        __break(1u);
LABEL_23:
        swift_bridgeObjectRetain();
        uint64_t v2 = sub_25C8EC4F0();
        if (v2) {
          continue;
        }
      }
      goto LABEL_17;
    }
LABEL_6:
    v0[35] = v6;
    unint64_t v8 = v0[18];
    uint64_t v9 = v0[17];
    swift_bridgeObjectRelease_n();
    id v10 = v6;
    uint64_t v11 = sub_25C8EBFD0();
    uint64_t v13 = v12;

    id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64ED8]), sel_init);
    v0[36] = v14;
    uint64_t v15 = sub_25C8C1808(v8, v11, v13);
    swift_bridgeObjectRelease();
    sub_25C8C40D0(v15, v14, &qword_26A5D9F48, 0x263F64760, (SEL *)&selRef_setViews_);
    sub_25C8A7E98(v9 + 112, (uint64_t)(v0 + 7));
    uint64_t v16 = v0[10];
    uint64_t v17 = v0[11];
    uint64_t v18 = (void *)OUTLINED_FUNCTION_47_0();
    __swift_project_boxed_opaque_existential_1(v18, v19);
    uint64_t v20 = sub_25C8EBFD0();
    uint64_t v22 = v21;
    v0[37] = v21;
    uint64_t v23 = (void *)swift_task_alloc();
    v0[38] = v23;
    uint64_t v24 = sub_25C8C4154(0, &qword_26A5D9F38);
    *uint64_t v23 = v0;
    v23[1] = sub_25C8C22C8;
    return MEMORY[0x270F67CC0](v14, v20, v22, v16, v24, v17);
  }
  else
  {
LABEL_17:
    uint64_t v30 = (void (*)(uint64_t, uint64_t, uint64_t))v0[28];
    uint64_t v31 = v0[27];
    uint64_t v32 = v0[25];
    uint64_t v33 = v0[20];
    swift_bridgeObjectRelease_n();
    v30(v32, v31, v33);
    uint64_t v34 = sub_25C8EC0D0();
    os_log_type_t v35 = sub_25C8EC2E0();
    if (OUTLINED_FUNCTION_23(v35))
    {
      uint64_t v36 = (_WORD *)OUTLINED_FUNCTION_5_0();
      OUTLINED_FUNCTION_27(v36);
      OUTLINED_FUNCTION_12_2(&dword_25C89B000, v34, v37, "Unable to retrieve currentDeviceAssistantID to generate commands for content disambiguation on remote device. Aborting.");
      OUTLINED_FUNCTION_3();
    }
    uint64_t v38 = (void (*)(uint64_t))v0[30];

    uint64_t v39 = OUTLINED_FUNCTION_30_0();
    v38(v39);
    OUTLINED_FUNCTION_30_1();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_9_0();
    return v40();
  }
}

uint64_t sub_25C8C22C8()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_4_4();
  *unint64_t v4 = v3;
  *unint64_t v4 = *v1;
  *(void *)(v3 + 31sub_25C8B55A0(4, 3, 2, 2) = v5;
  *(void *)(v3 + 320) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

void sub_25C8C23B4()
{
  unint64_t v1 = *(void **)(v0 + 312);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 224);
  uint64_t v3 = *(void *)(v0 + 216);
  uint64_t v4 = *(void *)(v0 + 192);
  uint64_t v5 = *(void *)(v0 + 160);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  v2(v4, v3, v5);
  id v6 = v1;
  uint64_t v7 = sub_25C8EC0D0();
  os_log_type_t v8 = sub_25C8EC2D0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = *(void **)(v0 + 312);
    uint64_t v10 = (uint8_t *)OUTLINED_FUNCTION_8_0();
    uint64_t v19 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412290;
    *(void *)(v0 + 128) = v9;
    id v11 = v9;
    sub_25C8EC360();
    *uint64_t v19 = v9;

    _os_log_impl(&dword_25C89B000, v7, v8, "makePromptForDisambiguation submitToRemote completed with response: %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9F40);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
    uint64_t v12 = *(void **)(v0 + 280);
    uint64_t v13 = *(void **)(v0 + 288);
    id v14 = *(void **)(v0 + 312);
  }
  else
  {

    id v14 = *(void **)(v0 + 312);
    uint64_t v7 = *(NSObject **)(v0 + 280);
    uint64_t v12 = v14;
    uint64_t v13 = v14;
  }
  uint64_t v15 = *(void (**)(uint64_t))(v0 + 240);

  uint64_t v16 = OUTLINED_FUNCTION_30_0();
  v15(v16);
  OUTLINED_FUNCTION_30_1();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6_3();
  __asm { BRAA            X1, X16 }
}

void sub_25C8C25A4()
{
  unint64_t v1 = (void *)v0[34];
  uint64_t v2 = (void (*)(uint64_t, uint64_t, uint64_t))v0[28];
  uint64_t v3 = v0[27];
  uint64_t v4 = v0[23];
  uint64_t v5 = v0[20];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  v2(v4, v3, v5);
  id v6 = v1;
  id v7 = v1;
  os_log_type_t v8 = sub_25C8EC0D0();
  os_log_type_t v9 = sub_25C8EC2E0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (void *)v0[34];
    uint64_t v23 = (void (*)(uint64_t, uint64_t))v0[30];
    uint64_t v21 = v0[20];
    uint64_t v22 = v0[23];
    id v11 = (uint8_t *)OUTLINED_FUNCTION_8_0();
    uint64_t v12 = OUTLINED_FUNCTION_10_1();
    *(_DWORD *)id v11 = 136315138;
    uint64_t v24 = v12;
    v0[13] = v10;
    id v13 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D96D0);
    uint64_t v14 = sub_25C8EC180();
    v0[12] = sub_25C8BB4F0(v14, v15, &v24);
    OUTLINED_FUNCTION_59();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25C89B000, v8, v9, "Unable to get devicesWithProximity: %s", v11, 0xCu);
    OUTLINED_FUNCTION_26_1();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();

    v23(v22, v21);
  }
  else
  {
    uint64_t v16 = (void *)v0[34];
    uint64_t v17 = (void (*)(uint64_t))v0[30];

    uint64_t v18 = OUTLINED_FUNCTION_51();
    v17(v18);
  }
  OUTLINED_FUNCTION_30_1();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_18_3();
  __asm { BRAA            X1, X16 }
}

uint64_t sub_25C8C27C8()
{
  uint64_t v28 = v0;
  unint64_t v1 = *(void **)(v0 + 320);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 224);
  uint64_t v3 = *(void *)(v0 + 216);
  uint64_t v4 = *(void *)(v0 + 176);
  uint64_t v5 = *(void *)(v0 + 160);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  v2(v4, v3, v5);
  id v6 = v1;
  id v7 = v1;
  os_log_type_t v8 = sub_25C8EC0D0();
  os_log_type_t v9 = sub_25C8EC2E0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = *(void **)(v0 + 320);
    id v11 = *(void **)(v0 + 288);
    uint64_t v25 = *(void **)(v0 + 280);
    uint64_t v26 = *(void (**)(uint64_t, uint64_t))(v0 + 240);
    uint64_t v23 = *(void *)(v0 + 160);
    uint64_t v24 = *(void *)(v0 + 176);
    uint64_t v12 = (uint8_t *)OUTLINED_FUNCTION_8_0();
    uint64_t v13 = OUTLINED_FUNCTION_10_1();
    *(_DWORD *)uint64_t v12 = 136315138;
    uint64_t v27 = v13;
    *(void *)(v0 + 11sub_25C8B55A0(4, 3, 2, 2) = v10;
    id v14 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D96D0);
    uint64_t v15 = sub_25C8EC180();
    *(void *)(v0 + 120) = sub_25C8BB4F0(v15, v16, &v27);
    OUTLINED_FUNCTION_59();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25C89B000, v8, v9, "makePromptForDisambiguation submitToRemote() failed with error: %s", v12, 0xCu);
    OUTLINED_FUNCTION_26_1();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();

    v26(v24, v23);
  }
  else
  {
    uint64_t v17 = *(void **)(v0 + 320);
    uint64_t v18 = *(void **)(v0 + 288);
    uint64_t v19 = *(void (**)(uint64_t))(v0 + 240);

    uint64_t v20 = OUTLINED_FUNCTION_51();
    v19(v20);
  }
  OUTLINED_FUNCTION_30_1();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  return v21();
}

uint64_t sub_25C8C2A24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C8EC2B0();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_25C89F4B0(a1, &qword_26A5D9F08);
  }
  else
  {
    sub_25C8EC2A0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25C8EC270();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 2sub_25C8B55A0(4, 3, 2, 4) = a3;
  return swift_task_create();
}

id sub_25C8C2B94()
{
  sub_25C8EC0F0();
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_4_1();
  sub_25C8EB000();
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x270FA5388](v1);
  uint64_t v2 = sub_25C8C2E1C();
  if (v3 >> 60 == 15)
  {
    if (qword_26A5D95A0 != -1) {
      uint64_t v2 = swift_once();
    }
    OUTLINED_FUNCTION_45_0(v2, (uint64_t)qword_26A5DD588);
    OUTLINED_FUNCTION_5_2();
    v4();
    uint64_t v5 = sub_25C8EC0D0();
    os_log_type_t v6 = sub_25C8EC2E0();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)OUTLINED_FUNCTION_5_0();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_25C89B000, v5, v6, "Error while creating direct invocation command from item", v7, 2u);
      OUTLINED_FUNCTION_3();
    }

    OUTLINED_FUNCTION_39_0();
    v8();
    return 0;
  }
  else
  {
    uint64_t v10 = v2;
    unint64_t v11 = v3;
    id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64BC0]), sel_init);
    uint64_t v13 = OUTLINED_FUNCTION_58();
    sub_25C8C3C6C(v13, v14, v12);
    id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F648D8]), sel_init);
    sub_25C8EAFF0();
    uint64_t v15 = sub_25C8EAFE0();
    uint64_t v17 = v16;
    OUTLINED_FUNCTION_9_1();
    v18();
    sub_25C8C3CC4(v15, v17, v9, (SEL *)&selRef_setAceId_);

    objc_msgSend(v9, sel_setRemoteDevice_, v12);
    sub_25C8C3D30(v10, v11, v9);

    sub_25C8C3D88(v10, v11);
  }
  return v9;
}

uint64_t sub_25C8C2E1C()
{
  v20[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = sub_25C8EC0F0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_26();
  uint64_t v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64E38]), sel_init);
  id v6 = sub_25C8C6EB8();
  [v5 setStartLocalRequest:v6];

  id v7 = [v5 dictionary];
  if (!v7)
  {
    if (qword_26A5D95A8 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v1, (uint64_t)qword_26A5DD5A0);
    OUTLINED_FUNCTION_5_2();
    v12();
    uint64_t v13 = sub_25C8EC0D0();
    os_log_type_t v14 = sub_25C8EC2E0();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)OUTLINED_FUNCTION_5_0();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_25C89B000, v13, v14, "Could not parse startUIRequest as Dictionary.", v15, 2u);
      OUTLINED_FUNCTION_3();
      uint64_t v16 = v5;
    }
    else
    {
      uint64_t v16 = v13;
      uint64_t v13 = v5;
    }

    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
    return 0;
  }
  os_log_type_t v8 = v7;
  v20[0] = 0;
  id v9 = objc_msgSend(self, sel_dataWithPropertyList_format_options_error_, v7, 200, 0, v20);
  id v10 = v20[0];
  if (!v9)
  {
    uint64_t v17 = v10;
    uint64_t v18 = (void *)sub_25C8EAF70();

    swift_willThrow();
    return 0;
  }
  uint64_t v11 = sub_25C8EAFC0();

  return v11;
}

uint64_t sub_25C8C30AC()
{
  sub_25C8A8014(v0 + 16);

  __swift_destroy_boxed_opaque_existential_1(v0 + 112);
  __swift_destroy_boxed_opaque_existential_1(v0 + 152);
  __swift_destroy_boxed_opaque_existential_1(v0 + 192);
  return v0;
}

uint64_t sub_25C8C30EC()
{
  sub_25C8C30AC();
  return MEMORY[0x270FA0228](v0, 232, 7);
}

uint64_t type metadata accessor for SwitchProfileDisambiguationStrategy()
{
  return self;
}

void sub_25C8C3148()
{
  type metadata accessor for SwitchProfileDisambiguationStrategy();
  JUMPOUT(0x261196870);
}

uint64_t sub_25C8C319C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25C8BDFC8(a1, a2);
}

uint64_t sub_25C8C31B4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 2sub_25C8B55A0(4, 3, 2, 4) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_25C8C324C;
  return sub_25C8C00F0();
}

uint64_t sub_25C8C324C()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_2_1();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_4_4();
  *id v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_3_1();
  *os_log_type_t v8 = v7;
  swift_task_dealloc();
  if (!v0) {
    **(void **)(v5 + 16) = v3;
  }
  id v9 = *(uint64_t (**)(void))(v7 + 8);
  return v9();
}

uint64_t sub_25C8C3328()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C8C41D8;
  return sub_25C8BE9FC();
}

uint64_t sub_25C8C33E0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C8A710C;
  return sub_25C8C0474();
}

uint64_t sub_25C8C3494(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  uint64_t v11 = type metadata accessor for SwitchProfileDisambiguationStrategy();
  *id v10 = v5;
  v10[1] = sub_25C8C41D8;
  return MEMORY[0x270F66628](a1, a2, a3, v11, a5);
}

uint64_t sub_25C8C3560(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  uint64_t v11 = type metadata accessor for SwitchProfileDisambiguationStrategy();
  *id v10 = v5;
  v10[1] = sub_25C8C41D8;
  return MEMORY[0x270F66638](a1, a2, a3, v11, a5);
}

uint64_t sub_25C8C362C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  os_log_type_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for SwitchProfileDisambiguationStrategy();
  *os_log_type_t v8 = v4;
  v8[1] = sub_25C8C41D8;
  return MEMORY[0x270F66630](a1, a2, v9, a4);
}

uint64_t sub_25C8C36F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  os_log_type_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for SwitchProfileDisambiguationStrategy();
  *os_log_type_t v8 = v4;
  v8[1] = sub_25C8C41D8;
  return MEMORY[0x270F66648](a1, a2, v9, a4);
}

uint64_t sub_25C8C37B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for SwitchProfileDisambiguationStrategy();
  return MEMORY[0x270F66640](a1, v5, a3);
}

uint64_t sub_25C8C3800(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v12 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v12;
  uint64_t v13 = type metadata accessor for SwitchProfileDisambiguationStrategy();
  *id v12 = v6;
  v12[1] = sub_25C8C41D8;
  return MEMORY[0x270F68168](a1, a2, a3, a4, v13, a6);
}

uint64_t sub_25C8C38DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  os_log_type_t v14 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v14;
  uint64_t v15 = type metadata accessor for SwitchProfileDisambiguationStrategy();
  *os_log_type_t v14 = v7;
  v14[1] = sub_25C8C41D8;
  return MEMORY[0x270F68170](a1, a2, a3, a4, a5, v15, a7);
}

uint64_t sub_25C8C39C0(uint64_t a1, uint64_t a2)
{
  return sub_25C8C4190(&qword_26A5D9EB8, a2, (void (*)(uint64_t))type metadata accessor for SwitchProfileDisambiguationStrategy);
}

unint64_t sub_25C8C3A0C()
{
  unint64_t result = qword_26A5D9EC0;
  if (!qword_26A5D9EC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_26A5D9EC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5D9EC0);
  }
  return result;
}

uint64_t sub_25C8C3A60(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25C8C3B3C;
  return v6(a1);
}

uint64_t sub_25C8C3B3C()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_15_2();
  return v3();
}

uint64_t sub_25C8C3BFC(void *a1)
{
  id v2 = objc_msgSend(a1, sel_name);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_25C8EC170();

  return v3;
}

void sub_25C8C3C6C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_25C8EC160();
  objc_msgSend(a3, sel_setAssistantId_, v4);
}

void sub_25C8C3CC4(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  id v6 = (id)sub_25C8EC160();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, *a4, v6);
}

void sub_25C8C3D30(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_25C8EAFB0();
  objc_msgSend(a3, sel_setSerializedCommand_, v4);
}

uint64_t sub_25C8C3D88(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_25C8C3D9C(a1, a2);
  }
  return a1;
}

uint64_t sub_25C8C3D9C(uint64_t a1, unint64_t a2)
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

uint64_t sub_25C8C3DF4()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_25C8C3E44()
{
  OUTLINED_FUNCTION_26_0();
  uint64_t v3 = v2;
  uint64_t v4 = v0[2];
  uint64_t v5 = v0[3];
  uint64_t v6 = v0[4];
  uint64_t v7 = v0[5];
  uint64_t v8 = v0[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v9;
  *uint64_t v9 = v1;
  v9[1] = sub_25C8A710C;
  return sub_25C8C1BD4(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_25C8C3F08()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25C8C3F40()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v3 = v2;
  uint64_t v4 = *(int **)(v0 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_25C8A710C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A5D9F20 + dword_26A5D9F20);
  return v6(v3, v4);
}

void sub_25C8C3FF4(uint64_t a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9F68);
  id v3 = (id)sub_25C8EC1F0();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setCommands_, v3);
}

uint64_t sub_25C8C406C(void *a1)
{
  id v1 = objc_msgSend(a1, sel_typeName);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_25C8EC170();

  return v3;
}

void sub_25C8C40D0(uint64_t a1, void *a2, unint64_t *a3, uint64_t a4, SEL *a5)
{
  sub_25C8C4154(0, a3);
  id v7 = (id)sub_25C8EC1F0();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, *a5, v7);
}

uint64_t sub_25C8C4154(uint64_t a1, unint64_t *a2)
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

uint64_t sub_25C8C4190(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

void OUTLINED_FUNCTION_12_2(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, a2, v4, a4, v5, 2u);
}

uint64_t OUTLINED_FUNCTION_17_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_19_3()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_22_2()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_24_2()
{
  return sub_25C8EC550();
}

uint64_t OUTLINED_FUNCTION_26_1()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_30_1()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_34_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_35_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_38_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_39_1(uint64_t a1, void *a2)
{
  *a2 = v2;
  return swift_willThrow();
}

void OUTLINED_FUNCTION_40_0()
{
  *(void *)(v1 - 256) = v0;
}

uint64_t OUTLINED_FUNCTION_43()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_44_0()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_45_0(uint64_t a1, uint64_t a2)
{
  return __swift_project_value_buffer(v2, a2);
}

uint64_t OUTLINED_FUNCTION_47_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_48_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_49_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_50_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_53()
{
  return sub_25C8C14E0(v1, v0, v2);
}

uint64_t OUTLINED_FUNCTION_55()
{
  return v0 - 112;
}

uint64_t OUTLINED_FUNCTION_57(uint64_t a1)
{
  *(void *)(v1 - 128) = a1;
  return v1 - 128;
}

uint64_t OUTLINED_FUNCTION_58()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_59()
{
  return sub_25C8EC360();
}

uint64_t sub_25C8C4490(unint64_t a1, unint64_t a2)
{
  if (a1 >> 62)
  {
    if (a1 >> 62 == 1)
    {
      if (a2 >> 62 == 1)
      {
        sub_25C8C6A40();
        sub_25C8C6520(a1);
        sub_25C8C6520(a2);
LABEL_7:
        char v4 = sub_25C8EC330();
        sub_25C8C6544(a2);
        sub_25C8C6544(a1);
        return v4 & 1;
      }
    }
    else
    {
      switch(__ROR8__(a1, 3) ^ 0x1000000000000000)
      {
        case 1:
          unint64_t v6 = 0x8000000000000008;
          break;
        case 2:
          unint64_t v6 = 0x8000000000000010;
          break;
        case 3:
          unint64_t v6 = 0x8000000000000018;
          break;
        default:
          unint64_t v6 = 0x8000000000000000;
          break;
      }
      if (a2 == v6) {
        return 1;
      }
    }
  }
  else if (!(a2 >> 62))
  {
    sub_25C8C6A40();
    sub_25C8C6520(a1);
    sub_25C8C6520(a2);
    OUTLINED_FUNCTION_14_1();
    goto LABEL_7;
  }
  return 0;
}

uint64_t sub_25C8C45D8(unint64_t *a1, unint64_t *a2)
{
  return sub_25C8C4490(*a1, *a2);
}

uint64_t sub_25C8C45E4()
{
  unint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC20SiriIdentityInternal29ExecutionDeviceResolutionFlow_state);
  if (!(v1 >> 62)) {
    return 2;
  }
  if (v1 >> 62 != 1) {
    return *(void *)((_UNKNOWN *)((char *)&unk_25C8EE010 + (v1 & 0xFFFFFFFFFFFFFFF8)) + 0x8000000000000000);
  }
  uint64_t v2 = v1 & 0x3FFFFFFFFFFFFFFFLL;
  id v3 = (id)(v1 & 0x3FFFFFFFFFFFFFFFLL);
  return v2;
}

uint64_t sub_25C8C464C(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9BC8);
  MEMORY[0x270FA5388](v3 - 8);
  OUTLINED_FUNCTION_9_3();
  uint64_t v6 = v4 - v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v16 - v8;
  uint64_t v10 = sub_25C8EB910();
  OUTLINED_FUNCTION_16();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v9, a1, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v10);
  sub_25C8A7FAC((uint64_t)v9, v6);
  swift_beginAccess();
  uint64_t v12 = OUTLINED_FUNCTION_14_1();
  sub_25C8A7EFC(v12, v13);
  swift_endAccess();
  unint64_t v14 = *(void *)(v1 + OBJC_IVAR____TtC20SiriIdentityInternal29ExecutionDeviceResolutionFlow_state);
  *(void *)(v1 + OBJC_IVAR____TtC20SiriIdentityInternal29ExecutionDeviceResolutionFlow_state) = 0x8000000000000000;
  sub_25C8C6544(v14);
  return 1;
}

uint64_t sub_25C8C4788()
{
  return sub_25C8EB2C0();
}

uint64_t sub_25C8C4814(uint64_t a1)
{
  v2[9] = a1;
  v2[10] = v1;
  uint64_t v3 = sub_25C8EB950();
  v2[11] = v3;
  OUTLINED_FUNCTION_1_2(v3);
  v2[12] = v4;
  v2[13] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9BC8);
  v2[14] = swift_task_alloc();
  uint64_t v5 = sub_25C8EB910();
  v2[15] = v5;
  OUTLINED_FUNCTION_1_2(v5);
  v2[16] = v6;
  v2[17] = swift_task_alloc();
  uint64_t v7 = sub_25C8EC0F0();
  v2[18] = v7;
  OUTLINED_FUNCTION_1_2(v7);
  v2[19] = v8;
  v2[20] = swift_task_alloc();
  v2[21] = swift_task_alloc();
  v2[22] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C8C496C, 0, 0);
}

void sub_25C8C496C()
{
  uint64_t v36 = v0;
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[22];
  uint64_t v3 = v0[18];
  uint64_t v2 = v0[19];
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_26A5DD5A0);
  v0[23] = v4;
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  v0[24] = v5;
  v0[25] = (v2 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v1, v4, v3);
  swift_retain_n();
  uint64_t v6 = sub_25C8EC0D0();
  os_log_type_t v7 = sub_25C8EC2D0();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = v0[19];
  uint64_t v33 = v0[18];
  uint64_t v34 = v0[22];
  uint64_t v10 = v0[10];
  if (v8)
  {
    uint64_t v11 = (uint8_t *)OUTLINED_FUNCTION_8_0();
    uint64_t v12 = OUTLINED_FUNCTION_10_1();
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v35 = v12;
    unint64_t v13 = *(void *)(v10 + OBJC_IVAR____TtC20SiriIdentityInternal29ExecutionDeviceResolutionFlow_state);
    v0[7] = v13;
    sub_25C8C6520(v13);
    uint64_t v14 = sub_25C8EC180();
    v0[8] = sub_25C8BB4F0(v14, v15, &v35);
    sub_25C8EC360();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_25C89B000, v6, v7, "ExecutionDeviceResolutionFlow.execute() %s", v11, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
  }
  else
  {
    swift_release_n();
  }

  uint64_t v16 = *(void (**)(void))(v9 + 8);
  ((void (*)(uint64_t, uint64_t))v16)(v34, v33);
  v0[26] = v16;
  uint64_t v18 = v0[14];
  uint64_t v17 = v0[15];
  uint64_t v19 = v0[10] + OBJC_IVAR____TtC20SiriIdentityInternal29ExecutionDeviceResolutionFlow_input;
  swift_beginAccess();
  sub_25C8A80D0(v19, v18, &qword_26A5D9BC8);
  if (__swift_getEnumTagSinglePayload(v18, 1, v17) == 1)
  {
    uint64_t v20 = v0[21];
    uint64_t v21 = v0[18];
    sub_25C8A812C(v0[14], &qword_26A5D9BC8);
    v5(v20, v4, v21);
    uint64_t v22 = sub_25C8EC0D0();
    os_log_type_t v23 = sub_25C8EC2D0();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)OUTLINED_FUNCTION_5_0();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_25C89B000, v22, v23, "ExecutionDeviceResolutionFlow.execute() Input is nil. Error executing request", v24, 2u);
      OUTLINED_FUNCTION_3();
    }

    OUTLINED_FUNCTION_11_0();
    v16();
    sub_25C8EC4D0();
    OUTLINED_FUNCTION_20_0();
  }
  else
  {
    uint64_t v25 = v0[10];
    (*(void (**)(void, void, void))(v0[16] + 32))(v0[17], v0[14], v0[15]);
    if (*(void *)(v25 + OBJC_IVAR____TtC20SiriIdentityInternal29ExecutionDeviceResolutionFlow_state) != 0x8000000000000000)
    {
      sub_25C8EB670();
      uint64_t v29 = OUTLINED_FUNCTION_3_3();
      v30(v29);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      OUTLINED_FUNCTION_9_0();
      OUTLINED_FUNCTION_20_0();
      __asm { BRAA            X1, X16 }
    }
    uint64_t v26 = (void *)v0[10];
    __swift_project_boxed_opaque_existential_1(v26 + 2, v26[5]);
    __swift_project_boxed_opaque_existential_1(v26 + 7, v26[10]);
    v0[27] = sub_25C8D83E4();
    uint64_t v27 = (void *)swift_task_alloc();
    v0[28] = v27;
    *uint64_t v27 = v0;
    v27[1] = sub_25C8C4E30;
    OUTLINED_FUNCTION_20_0();
    MEMORY[0x270F72ED0]();
  }
}

uint64_t sub_25C8C4E30(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1();
  uint64_t v5 = v4;
  uint64_t v6 = *v2;
  OUTLINED_FUNCTION_3_1();
  void *v7 = v6;
  *(void *)(v5 + 23sub_25C8B55A0(4, 3, 2, 2) = v1;
  swift_task_dealloc();
  if (v1)
  {
    BOOL v8 = sub_25C8C5210;
  }
  else
  {
    swift_bridgeObjectRelease();
    *(void *)(v5 + 240) = a1;
    BOOL v8 = sub_25C8C4F34;
  }
  return MEMORY[0x270FA2498](v8, 0, 0);
}

uint64_t sub_25C8C4F34()
{
  __swift_project_boxed_opaque_existential_1((void *)(v0[10] + 56), *(void *)(v0[10] + 80));
  sub_25C8EB900();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[31] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C8C4FFC;
  uint64_t v2 = v0[30];
  uint64_t v3 = v0[13];
  return sub_25C8D8458(v3, v2);
}

uint64_t sub_25C8C4FFC()
{
  OUTLINED_FUNCTION_2_1();
  uint64_t v2 = v1[13];
  uint64_t v3 = v1[12];
  uint64_t v4 = v1[11];
  uint64_t v5 = *v0;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v6 = v5;
  *(void *)(v8 + 256) = v7;
  *(unsigned char *)(v8 + 26sub_25C8B55A0(4, 3, 2, 4) = v9;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return MEMORY[0x270FA2498](sub_25C8C5150, 0, 0);
}

uint64_t sub_25C8C5150()
{
  uint64_t v1 = *(void **)(v0 + 256);
  char v2 = *(unsigned char *)(v0 + 264);
  sub_25C8C547C((unint64_t)v1, v2, *(void *)(v0 + 72));
  sub_25C8C6AA4(v1, v2);
  uint64_t v3 = OUTLINED_FUNCTION_3_3();
  v4(v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  return v5();
}

uint64_t sub_25C8C5210()
{
  uint64_t v25 = v0;
  uint64_t v1 = (void *)v0[29];
  char v2 = (void (*)(uint64_t))v0[24];
  swift_bridgeObjectRelease();
  uint64_t v3 = OUTLINED_FUNCTION_14_1();
  v2(v3);
  id v4 = v1;
  id v5 = v1;
  uint64_t v6 = sub_25C8EC0D0();
  os_log_type_t v7 = sub_25C8EC2E0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (void *)v0[29];
    char v9 = (uint8_t *)OUTLINED_FUNCTION_8_0();
    uint64_t v10 = OUTLINED_FUNCTION_10_1();
    *(_DWORD *)char v9 = 136315138;
    uint64_t v24 = v10;
    v0[5] = v8;
    id v11 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D96D0);
    uint64_t v12 = sub_25C8EC180();
    v0[6] = sub_25C8BB4F0(v12, v13, &v24);
    sub_25C8EC360();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25C89B000, v6, v7, "Failure getting devicesMatching: %s", v9, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();

    OUTLINED_FUNCTION_11_0();
    v14();
  }
  else
  {
    unint64_t v15 = (void *)v0[29];
    uint64_t v16 = (void (*)(uint64_t, uint64_t))v0[26];
    uint64_t v17 = v0[20];
    uint64_t v18 = v0[18];

    v16(v17, v18);
  }
  uint64_t v19 = (void *)v0[29];
  sub_25C8EB670();

  uint64_t v20 = OUTLINED_FUNCTION_3_3();
  v21(v20);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  return v22();
}

void sub_25C8C547C(unint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  unint64_t v40 = a1;
  uint64_t v41 = a3;
  uint64_t v4 = sub_25C8EC0F0();
  OUTLINED_FUNCTION_1_4();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_9_3();
  uint64_t v10 = (char *)(v8 - v9);
  MEMORY[0x270FA5388](v11);
  unint64_t v13 = (char *)v38 - v12;
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  uint64_t v14 = __swift_project_value_buffer(v4, (uint64_t)qword_26A5DD5A0);
  unint64_t v15 = *(void (**)(void))(v6 + 16);
  OUTLINED_FUNCTION_10_5();
  v15();
  uint64_t v16 = sub_25C8EC0D0();
  os_log_type_t v17 = sub_25C8EC2D0();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)OUTLINED_FUNCTION_5_0();
    v38[1] = v14;
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl(&dword_25C89B000, v16, v17, "ExecutionDeviceResolutionFlow.handleProcessDevicesResult()", v18, 2u);
    OUTLINED_FUNCTION_3();
  }

  uint64_t v19 = *(void (**)(char *, uint64_t))(v6 + 8);
  v19(v13, v4);
  switch(a2)
  {
    case 1:
      OUTLINED_FUNCTION_10_5();
      v15();
      id v20 = (id)v40;
      uint64_t v21 = sub_25C8EC0D0();
      os_log_type_t v22 = sub_25C8EC2D0();
      if (os_log_type_enabled(v21, v22))
      {
        os_log_type_t v23 = (uint8_t *)OUTLINED_FUNCTION_5_0();
        *(_WORD *)os_log_type_t v23 = 0;
        _os_log_impl(&dword_25C89B000, v21, v22, "ExecutionDeviceResolutionFlow.handleProcessDevicesResult() Prompting for device confirmation", v23, 2u);
        OUTLINED_FUNCTION_3();
      }

      v19(v10, v4);
      uint64_t v24 = v39;
      sub_25C8A7E98(v39 + 136, (uint64_t)v44);
      sub_25C8A7E98(v24 + 176, (uint64_t)v43);
      sub_25C8A7E98(v24 + 136, (uint64_t)v42);
      type metadata accessor for LocUtil();
      uint64_t inited = swift_initStackObject();
      sub_25C8A4290(v42, inited + 16);
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v43, v43[3]);
      OUTLINED_FUNCTION_1_4();
      MEMORY[0x270FA5388](v26);
      uint64_t v28 = (void *)((char *)v38 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0));
      (*(void (**)(uint64_t *))(v29 + 16))(v28);
      sub_25C8C6C78(v44, *v28, inited);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
      sub_25C8A7E98(v24 + 96, (uint64_t)v44);
      v43[0] = v20;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA038);
      swift_allocObject();
      id v30 = (id)v40;
      sub_25C8C6A80((id)v40, 1);
      type metadata accessor for DeviceConfirmationStrategy();
      sub_25C8C6DEC(&qword_26A5DA040, (void (*)(uint64_t))type metadata accessor for DeviceConfirmationStrategy);
      swift_retain();
      uint64_t v31 = sub_25C8EB1B0();
      unint64_t v32 = *(void *)(v24 + OBJC_IVAR____TtC20SiriIdentityInternal29ExecutionDeviceResolutionFlow_state);
      *(void *)(v24 + OBJC_IVAR____TtC20SiriIdentityInternal29ExecutionDeviceResolutionFlow_state) = v30;
      id v33 = v20;
      sub_25C8C6544(v32);
      *(void *)&v44[0] = v31;
      sub_25C8C6DA8(&qword_26A5DA048, &qword_26A5DA038);
      swift_retain();
      sub_25C8EB640();
      sub_25C8C6AA4(v30, 1);
      swift_release();
      swift_release();
      swift_release();
      break;
    case 2:
      id v34 = (id)v40;
      unint64_t v35 = *(void *)(v39 + OBJC_IVAR____TtC20SiriIdentityInternal29ExecutionDeviceResolutionFlow_state);
      *(void *)(v39 + OBJC_IVAR____TtC20SiriIdentityInternal29ExecutionDeviceResolutionFlow_state) = v40 | 0x4000000000000000;
      sub_25C8C6A80(v34, 2);
      id v36 = v34;
      sub_25C8C6544(v35);
      sub_25C8EB670();
      sub_25C8C6AA4(v34, 2);
      break;
    case 3:
      unint64_t v37 = *(void *)(v39 + OBJC_IVAR____TtC20SiriIdentityInternal29ExecutionDeviceResolutionFlow_state);
      *(void *)(v39 + OBJC_IVAR____TtC20SiriIdentityInternal29ExecutionDeviceResolutionFlow_state) = 0x8000000000000008;
      sub_25C8C6544(v37);
      goto LABEL_11;
    default:
LABEL_11:
      sub_25C8EB670();
      break;
  }
}

uint64_t sub_25C8C59C8(NSObject *a1)
{
  uint64_t v91 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA020);
  MEMORY[0x270FA5388](v1 - 8);
  OUTLINED_FUNCTION_28_0();
  uint64_t v87 = v2;
  MEMORY[0x270FA5388](v3);
  unint64_t v90 = (unint64_t)&v83 - v4;
  sub_25C8EB8E0();
  OUTLINED_FUNCTION_1_4();
  uint64_t v88 = v6;
  uint64_t v89 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v83 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA028);
  OUTLINED_FUNCTION_1_4();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_28_0();
  uint64_t v85 = v12;
  MEMORY[0x270FA5388](v13);
  unint64_t v15 = (void **)((char *)&v83 - v14);
  uint64_t v16 = sub_25C8EC0F0();
  OUTLINED_FUNCTION_1_4();
  uint64_t v18 = v17;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_9_3();
  os_log_type_t v22 = (char *)(v20 - v21);
  uint64_t v24 = MEMORY[0x270FA5388](v23);
  uint64_t v86 = (char *)&v83 - v25;
  MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)&v83 - v26;
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  uint64_t v28 = __swift_project_value_buffer(v16, (uint64_t)qword_26A5DD5A0);
  uint64_t v29 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  uint64_t v84 = v28;
  uint64_t v92 = v29;
  uint64_t v93 = v18 + 16;
  ((void (*)(char *))v29)(v27);
  id v30 = sub_25C8EC0D0();
  os_log_type_t v31 = sub_25C8EC2D0();
  if (os_log_type_enabled(v30, v31))
  {
    unint64_t v32 = (uint8_t *)OUTLINED_FUNCTION_5_0();
    *(_WORD *)unint64_t v32 = 0;
    _os_log_impl(&dword_25C89B000, v30, v31, "ExecutionDeviceResolutionFlow.processConfirmationResult()", v32, 2u);
    OUTLINED_FUNCTION_3();
  }

  id v34 = *(void (**)(void, void))(v18 + 8);
  uint64_t v33 = v18 + 8;
  uint64_t v96 = v16;
  uint64_t v94 = v34;
  v34(v27, v16);
  uint64_t v35 = OBJC_IVAR____TtC20SiriIdentityInternal29ExecutionDeviceResolutionFlow_state;
  unint64_t v36 = *(void *)&v98[OBJC_IVAR____TtC20SiriIdentityInternal29ExecutionDeviceResolutionFlow_state];
  if (v36 >> 62)
  {
    uint64_t result = sub_25C8EC4D0();
    __break(1u);
    return result;
  }
  unint64_t v37 = *(void (**)(void **, NSObject *, uint64_t))(v10 + 16);
  uint64_t v38 = v97;
  v37(v15, v91, v97);
  int v39 = (*(uint64_t (**)(void **, uint64_t))(v10 + 88))(v15, v38);
  int v40 = *MEMORY[0x263F6FA10];
  uint64_t v95 = v33;
  if (v39 != v40)
  {
    if (v39 == *MEMORY[0x263F6FA08])
    {
      (*(void (**)(void **, uint64_t))(v10 + 96))(v15, v97);
      uint64_t v51 = *v15;
      id v52 = (id)v36;

      uint64_t v48 = v98;
    }
    else
    {
      uint64_t v48 = v98;
      if (v39 == *MEMORY[0x263F6FA18])
      {
        OUTLINED_FUNCTION_12_3();
        *(void *)&v48[v35] = v57;
        id v58 = (id)v36;
        unint64_t v53 = (unint64_t)v37;
        goto LABEL_18;
      }
      if (v39 != *MEMORY[0x263F6FA00])
      {
        unint64_t v71 = *(void *)&v98[v35];
        *(void *)&v98[v35] = 0x8000000000000018;
        unint64_t v90 = v36;
        id v72 = (id)v36;
        sub_25C8C6544(v71);
        v92(v86, v84, v96);
        uint64_t v73 = v97;
        v37(v85, v91, v97);
        uint64_t v74 = sub_25C8EC0D0();
        os_log_type_t v75 = sub_25C8EC2E0();
        uint64_t v91 = v74;
        if (os_log_type_enabled(v74, v75))
        {
          uint64_t v76 = OUTLINED_FUNCTION_8_0();
          uint64_t v89 = OUTLINED_FUNCTION_10_1();
          uint64_t v100 = v89;
          *(_DWORD *)uint64_t v76 = 136315138;
          uint64_t v74 = (v76 + 12);
          uint64_t v88 = v76 + 4;
          sub_25C8C6DA8(&qword_26A5DA030, &qword_26A5DA028);
          uint64_t v77 = sub_25C8EC540();
          unint64_t v99 = sub_25C8BB4F0(v77, v78, &v100);
          sub_25C8EC360();
          swift_bridgeObjectRelease();
          uint64_t v79 = OUTLINED_FUNCTION_11_3();
          ((void (*)(uint64_t, uint64_t))(v76 + 12))(v79, v97);
          uint64_t v80 = v91;
          _os_log_impl(&dword_25C89B000, v91, v75, "ExecutionDeviceResolutionFlow.processConfirmationResult() received unknown result: %s. Setting flow to .failure state.", (uint8_t *)v76, 0xCu);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_3();
          uint64_t v73 = v97;
          OUTLINED_FUNCTION_3();
        }
        else
        {
          uint64_t v81 = OUTLINED_FUNCTION_11_3();
          ((void (*)(uint64_t, uint64_t))v74)(v81, v73);
        }
        OUTLINED_FUNCTION_11_0();
        v82();
        ((void (*)(void **, uint64_t))v74)(v15, v73);
        uint64_t v48 = v98;
        unint64_t v36 = v90;
        goto LABEL_19;
      }
      id v70 = (id)v36;
    }
    unint64_t v53 = *(void *)&v48[v35];
    *(void *)&v48[v35] = 0x8000000000000018;
LABEL_18:
    sub_25C8C6544(v53);
    goto LABEL_19;
  }
  (*(void (**)(void **, uint64_t))(v10 + 96))(v15, v38);
  uint64_t v42 = v88;
  uint64_t v41 = v89;
  (*(void (**)(char *, void **, uint64_t))(v88 + 32))(v8, v15, v89);
  unint64_t v43 = v36;
  id v44 = (id)v36;
  uint64_t v45 = v90;
  sub_25C8EB8D0();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v8, v41);
  uint64_t v46 = sub_25C8EB780();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v45, 1, v46);
  uint64_t v48 = v98;
  if (EnumTagSinglePayload != 1)
  {
    uint64_t v54 = v87;
    sub_25C8A80D0(v45, v87, &qword_26A5DA020);
    unint64_t v49 = *(void *)(v46 - 8);
    int v55 = (*(uint64_t (**)(uint64_t, uint64_t))(v49 + 88))(v54, v46);
    if (v55 == *MEMORY[0x263F6FC98])
    {
      unint64_t v49 = *(void *)&v48[v35];
      *(void *)&v48[v35] = v43 | 0x4000000000000000;
      id v56 = v44;
      goto LABEL_15;
    }
    if (v55 == *MEMORY[0x263F6FC90])
    {
      OUTLINED_FUNCTION_12_3();
      goto LABEL_9;
    }
    (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v54, v46);
  }
  unint64_t v49 = *(void *)&v48[v35];
  unint64_t v50 = 0x8000000000000018;
LABEL_9:
  *(void *)&v48[v35] = v50;
LABEL_15:
  sub_25C8C6544(v49);
  sub_25C8A812C(v45, &qword_26A5DA020);
  unint64_t v36 = v43;
LABEL_19:
  if (qword_26A5D95A0 != -1) {
    swift_once();
  }
  uint64_t v59 = v96;
  uint64_t v60 = __swift_project_value_buffer(v96, (uint64_t)qword_26A5DD588);
  v92(v22, v60, v59);
  swift_retain_n();
  uint64_t v61 = sub_25C8EC0D0();
  os_log_type_t v62 = sub_25C8EC2D0();
  if (os_log_type_enabled(v61, v62))
  {
    uint64_t v63 = OUTLINED_FUNCTION_8_0();
    unint64_t v90 = v36;
    uint64_t v64 = (uint8_t *)v63;
    uint64_t v65 = OUTLINED_FUNCTION_10_1();
    uint64_t v98 = v22;
    *(_DWORD *)uint64_t v64 = 136315138;
    uint64_t v100 = v65;
    unint64_t v99 = *(void *)&v48[v35];
    sub_25C8C6520(v99);
    uint64_t v66 = sub_25C8EC180();
    unint64_t v99 = sub_25C8BB4F0(v66, v67, &v100);
    sub_25C8EC360();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C89B000, v61, v62, "ExecutionDeviceResolutionFlow.processConfirmationResult() state after processConfirmationResult: %s", v64, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();

    sub_25C8C6544(v90);
  }
  else
  {
    sub_25C8C6544(v36);

    swift_release_n();
  }
  OUTLINED_FUNCTION_11_0();
  return v68();
}

uint64_t sub_25C8C6330()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  __swift_destroy_boxed_opaque_existential_1(v0 + 136);
  __swift_destroy_boxed_opaque_existential_1(v0 + 176);
  sub_25C8A812C(v0 + OBJC_IVAR____TtC20SiriIdentityInternal29ExecutionDeviceResolutionFlow_input, &qword_26A5D9BC8);
  sub_25C8C6544(*(void *)(v0 + OBJC_IVAR____TtC20SiriIdentityInternal29ExecutionDeviceResolutionFlow_state));
  return v0;
}

uint64_t sub_25C8C6398()
{
  sub_25C8C6330();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_25C8C63F0()
{
  return type metadata accessor for ExecutionDeviceResolutionFlow();
}

uint64_t type metadata accessor for ExecutionDeviceResolutionFlow()
{
  uint64_t result = qword_26A5D9FF0;
  if (!qword_26A5D9FF0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25C8C6440()
{
  sub_25C8A6C54();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

unint64_t *initializeBufferWithCopyOfBuffer for ExecutionDeviceResolutionFlow.State(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_25C8C6520(*a2);
  *a1 = v3;
  return a1;
}

unint64_t sub_25C8C6520(unint64_t result)
{
  if (result >> 62)
  {
    if (result >> 62 != 1) {
      return result;
    }
    result &= 0x3FFFFFFFFFFFFFFFuLL;
  }
  return (unint64_t)(id)result;
}

void destroy for ExecutionDeviceResolutionFlow.State(unint64_t *a1)
{
}

void sub_25C8C6544(unint64_t a1)
{
  if (a1 >> 62)
  {
    if (a1 >> 62 != 1) {
      return;
    }
    a1 &= 0x3FFFFFFFFFFFFFFFuLL;
  }
}

unint64_t *assignWithCopy for ExecutionDeviceResolutionFlow.State(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_25C8C6520(*a2);
  unint64_t v4 = *a1;
  *a1 = v3;
  sub_25C8C6544(v4);
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

unint64_t *assignWithTake for ExecutionDeviceResolutionFlow.State(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  *a1 = *a2;
  sub_25C8C6544(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for ExecutionDeviceResolutionFlow.State(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7E && *(unsigned char *)(a1 + 8))
    {
      unsigned int v2 = *(_DWORD *)a1 + 125;
    }
    else
    {
      unsigned int v2 = (((*(void *)a1 >> 57) >> 5) | (4 * ((*(void *)a1 >> 57) & 0x18 | *(void *)a1 & 7))) ^ 0x7F;
      if (v2 >= 0x7D) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for ExecutionDeviceResolutionFlow.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7D)
  {
    *(void *)uint64_t result = a2 - 126;
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(void *)uint64_t result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_25C8C6680(void *a1)
{
  uint64_t v1 = *a1 >> 62;
  if (v1 <= 1) {
    return v1;
  }
  else {
    return (*a1 >> 3) + 2;
  }
}

void *sub_25C8C669C(void *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_25C8C66AC(unint64_t *result, uint64_t a2)
{
  if (a2 < 2)
  {
    uint64_t v2 = *result & 0xFFFFFFFFFFFFFF8;
    unint64_t v3 = a2 << 62;
  }
  else
  {
    uint64_t v2 = 8 * (a2 - 2);
    unint64_t v3 = 0x8000000000000000;
  }
  *uint64_t result = v2 | v3;
  return result;
}

ValueMetadata *type metadata accessor for ExecutionDeviceResolutionFlow.State()
{
  return &type metadata for ExecutionDeviceResolutionFlow.State;
}

uint64_t sub_25C8C66E8(uint64_t a1)
{
  return 1;
}

uint64_t sub_25C8C6710(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_25C8C67C0;
  return MEMORY[0x270F66CE0](a1, a2, a3);
}

uint64_t sub_25C8C67C0(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1();
  uint64_t v3 = *v1;
  OUTLINED_FUNCTION_3_1();
  *unint64_t v4 = v3;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(a1);
}

uint64_t sub_25C8C6890()
{
  return sub_25C8C4788();
}

uint64_t sub_25C8C68B4(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25C8C6950;
  return sub_25C8C4814(a1);
}

uint64_t sub_25C8C6950()
{
  OUTLINED_FUNCTION_2_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  return v3();
}

uint64_t sub_25C8C6A14@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C8C45E4();
  *a1 = result;
  return result;
}

unint64_t sub_25C8C6A40()
{
  unint64_t result = qword_26A5DA018;
  if (!qword_26A5DA018)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A5DA018);
  }
  return result;
}

id sub_25C8C6A80(id result, char a2)
{
  if (a2 == 2 || a2 == 1) {
    return result;
  }
  if (!a2) {
    return (id)swift_bridgeObjectRetain();
  }
  return result;
}

void sub_25C8C6AA4(void *a1, char a2)
{
  if (a2 == 2 || a2 == 1)
  {
  }
  else if (!a2)
  {
    swift_bridgeObjectRelease();
  }
}

void *sub_25C8C6AC8(long long *a1, uint64_t a2, uint64_t a3, void *a4)
{
  v16[3] = type metadata accessor for BaseDialogProvider();
  v16[4] = &off_2709F0150;
  v16[0] = a2;
  a4[19] = 0xD00000000000002DLL;
  a4[20] = 0x800000025C8F0FC0;
  sub_25C8A7E98((uint64_t)a1, (uint64_t)(a4 + 2));
  sub_25C8A7E98((uint64_t)v16, (uint64_t)v14);
  sub_25C8A7E98((uint64_t)a1, (uint64_t)v13);
  sub_25C8A7E98((uint64_t)v14, (uint64_t)__src);
  sub_25C8A80D0((uint64_t)v13, (uint64_t)&v10, &qword_26A5D9BD8);
  if (v11)
  {
    sub_25C8A812C((uint64_t)v13, &qword_26A5D9BD8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    sub_25C8A4290(&v10, (uint64_t)v12);
  }
  else
  {
    sub_25C8EB960();
    sub_25C8A812C((uint64_t)v13, &qword_26A5D9BD8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    sub_25C8A812C((uint64_t)&v10, &qword_26A5D9BD8);
  }
  sub_25C8A4290(v12, (uint64_t)&__src[5]);
  sub_25C8A7E98((uint64_t)&__src[5], (uint64_t)v12);
  type metadata accessor for LocUtil();
  uint64_t v7 = swift_allocObject();
  sub_25C8A4290(v12, v7 + 16);
  swift_release();
  __src[10] = v7;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  memcpy(a4 + 7, __src, 0x58uLL);
  uint64_t v8 = swift_allocObject();
  sub_25C8A4290(a1, v8 + 16);
  a4[18] = v8;
  return a4;
}

void *sub_25C8C6C78(long long *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v15 = type metadata accessor for BaseDialogProvider();
  uint64_t v16 = &off_2709F0150;
  v14[0] = a2;
  type metadata accessor for DeviceConfirmationStrategy();
  uint64_t v6 = (void *)swift_allocObject();
  uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v14, v15);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (void *)((char *)&v14[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v10 + 16))(v9);
  uint64_t v11 = sub_25C8C6AC8(a1, *v9, a3, v6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  return v11;
}

uint64_t sub_25C8C6DA8(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_25C8C6DEC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_3_3()
{
  return *(void *)(v0 + 136);
}

uint64_t OUTLINED_FUNCTION_11_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return v0;
}

id sub_25C8C6EB8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25C8EC0F0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C8BBCB4(v1);
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  if (!v7)
  {
    if (qword_26A5D95A8 != -1) {
      swift_once();
    }
    uint64_t v8 = __swift_project_value_buffer(v2, (uint64_t)qword_26A5DD5A0);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
    uint64_t v9 = sub_25C8EC0D0();
    os_log_type_t v10 = sub_25C8EC2E0();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_25C89B000, v9, v10, "ProfileId is nil for the account while creating disambiguation option direct invocation command", v11, 2u);
      MEMORY[0x261198330](v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  sub_25C8C729C();
  if (qword_26A5D9540 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  id v12 = sub_25C8C7228();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA058);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25C8ED970;
  v25[1] = 0x696669746E656469;
  v25[2] = 0xEA00000000007265;
  uint64_t v14 = MEMORY[0x263F8D310];
  sub_25C8EC3A0();
  uint64_t v15 = sub_25C8BBCB4(v1);
  *(void *)(inited + 96) = v14;
  if (v16) {
    uint64_t v17 = v15;
  }
  else {
    uint64_t v17 = 0;
  }
  unint64_t v18 = 0xE000000000000000;
  if (v16) {
    unint64_t v18 = v16;
  }
  *(void *)(inited + 7sub_25C8B55A0(4, 3, 2, 2) = v17;
  *(void *)(inited + 80) = v18;
  uint64_t v19 = sub_25C8EC130();
  sub_25C8C72DC(v19, v12);
  id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F70028]), sel_init);
  objc_msgSend(v20, sel_setInputOrigin_, *MEMORY[0x263F65858]);
  objc_msgSend(v20, sel_setInteractionType_, *MEMORY[0x263F658C8]);
  uint64_t v21 = self;
  id v22 = objc_msgSend(v21, sel_runSiriKitExecutorCommandWithContext_payload_, v20, v12);
  id v23 = objc_msgSend(v21, sel_wrapCommandInStartLocalRequest_, v22);

  return v23;
}

id sub_25C8C7228()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_25C8EC160();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithIdentifier_, v1);

  return v2;
}

unint64_t sub_25C8C729C()
{
  unint64_t result = qword_26A5DA050;
  if (!qword_26A5DA050)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A5DA050);
  }
  return result;
}

void sub_25C8C72DC(uint64_t a1, void *a2)
{
  id v3 = (id)sub_25C8EC100();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setUserData_, v3);
}

void sub_25C8C735C()
{
  qword_26A5DA060 = 0x736C6562614CLL;
  *(void *)algn_26A5DA068 = 0xE600000000000000;
}

uint64_t sub_25C8C737C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_25C8EB020();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((void *)(v2 + 16), *(void *)(v2 + 40));
  sub_25C8EB420();
  v28[6] = sub_25C8EB010();
  v28[7] = v9;
  v28[4] = 45;
  v28[5] = 0xE100000000000000;
  v28[2] = 95;
  void v28[3] = 0xE100000000000000;
  sub_25C8C76AC();
  uint64_t v10 = sub_25C8EC380();
  uint64_t v12 = v11;
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(self, sel_sharedInstance);
  if (!v13)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v14 = v13;
  v28[0] = v10;
  v28[1] = v5;
  uint64_t v15 = a2;
  if (qword_26A5D9558 != -1) {
    swift_once();
  }
  uint64_t v16 = qword_26A5DA060;
  uint64_t v17 = *(void *)algn_26A5DA068;
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v19 = self;
  swift_bridgeObjectRetain();
  id v20 = objc_msgSend(v19, sel_bundleForClass_, ObjCClassFromMetadata);
  id v21 = sub_25C8C76F8(a1, v15, v16, v17, (uint64_t)v20, v28[0], v12, v14);

  swift_bridgeObjectRelease();
  if (!v21)
  {
    uint64_t v25 = OUTLINED_FUNCTION_0_7();
    v26(v25);
    return 0;
  }
  uint64_t v22 = sub_25C8EC170();

  uint64_t v23 = OUTLINED_FUNCTION_0_7();
  v24(v23);
  return v22;
}

uint64_t sub_25C8C7650()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x270FA0228](v0, 56, 7);
}

uint64_t type metadata accessor for LocUtil()
{
  return self;
}

unint64_t sub_25C8C76AC()
{
  unint64_t result = qword_26A5DA070;
  if (!qword_26A5DA070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DA070);
  }
  return result;
}

id sub_25C8C76F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v10 = (void *)sub_25C8EC160();
  uint64_t v11 = (void *)sub_25C8EC160();
  uint64_t v12 = (void *)sub_25C8EC160();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(a8, sel_localizedStringForKey_table_bundle_languageCode_, v10, v11, a5, v12);

  return v13;
}

uint64_t OUTLINED_FUNCTION_0_7()
{
  return v0;
}

uint64_t sub_25C8C77C4()
{
  return sub_25C8C79A0(MEMORY[0x263F755A8], "SiriEnvironment.getCurrentDevice : Couldn't get forCurrentTask");
}

uint64_t static SiriEnvironment.getUserIdentity()()
{
  uint64_t v0 = sub_25C8EC0F0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v2 = v1;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C8EBE50();
  if (sub_25C8EBE30())
  {
    uint64_t v6 = sub_25C8EBE10();
    swift_release();
  }
  else
  {
    if (qword_26A5D95A8 != -1) {
      swift_once();
    }
    uint64_t v7 = __swift_project_value_buffer(v0, (uint64_t)qword_26A5DD5A0);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v7, v0);
    uint64_t v8 = sub_25C8EC0D0();
    os_log_type_t v9 = sub_25C8EC2E0();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_25C89B000, v8, v9, "SiriEnvironment.getUserIdentity : Couldn't get forCurrentTask", v10, 2u);
      MEMORY[0x261198330](v10, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v0);
    return 0;
  }
  return v6;
}

uint64_t sub_25C8C7980()
{
  return sub_25C8C79A0(MEMORY[0x263F6D250], "SiriEnvironment.getCurrentRequest : Couldn't get forCurrentTask.");
}

uint64_t sub_25C8C79A0(uint64_t (*a1)(void), const char *a2)
{
  uint64_t v4 = sub_25C8EC0F0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  os_log_type_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C8EBE50();
  if (!sub_25C8EBE30())
  {
    if (qword_26A5D95A8 != -1) {
      swift_once();
    }
    uint64_t v10 = __swift_project_value_buffer(v4, (uint64_t)qword_26A5DD5A0);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v10, v4);
    uint64_t v11 = sub_25C8EC0D0();
    os_log_type_t v12 = sub_25C8EC2E0();
    if (os_log_type_enabled(v11, v12))
    {
      id v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_25C89B000, v11, v12, a2, v13, 2u);
      MEMORY[0x261198330](v13, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v4);
    sub_25C8EBE40();
  }
  uint64_t v14 = a1();
  swift_release();
  return v14;
}

uint64_t sub_25C8C7B58(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

id sub_25C8C7B68(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  id v3 = objc_msgSend(a1, sel_displayString);
  uint64_t v4 = sub_25C8EC170();
  uint64_t v6 = v5;

  sub_25C8C7CE0(v4, v6, v2);
  id v7 = objc_msgSend(a1, sel_isActive);
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = objc_msgSend(v7, sel_BOOLValue);
  }
  else
  {
    id v9 = 0;
  }
  objc_msgSend(v2, sel_setActiveProfile_, v9);
  sub_25C8BBCB4(a1);
  if (v10)
  {
    uint64_t v11 = (void *)sub_25C8EC160();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v11 = 0;
  }
  objc_msgSend(v2, sel_setProfileIdentifier_, v11);

  uint64_t v12 = sub_25C8C7D44(a1);
  if (v13 >> 60 == 15)
  {
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v15 = v12;
    unint64_t v16 = v13;
    uint64_t v14 = (void *)sub_25C8EAFB0();
    sub_25C8C3D88(v15, v16);
  }
  objc_msgSend(v2, sel_setProfileImage_, v14);

  return v2;
}

void sub_25C8C7CE0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_25C8EC160();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setFullName_, v4);
}

uint64_t sub_25C8C7D44(void *a1)
{
  id v1 = objc_msgSend(a1, sel_profileImage);
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  uint64_t v3 = sub_25C8EAFC0();

  return v3;
}

uint64_t _s24UserIdentityOntologyNodeCMa()
{
  uint64_t result = qword_26A5DA098;
  if (!qword_26A5DA098) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C8C7DF0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25C8C7E44()
{
  uint64_t v1 = v0;
  uint64_t v2 = qword_26A5DA078;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D95D8);
  swift_allocObject();
  swift_retain();
  OUTLINED_FUNCTION_0_1();
  uint64_t v4 = sub_25C8EBB10();
  *(void *)(v0 + vsub_25C8B55A0(4, 3, 2, 2) = v4;
  uint64_t v5 = qword_26A5DA080;
  OUTLINED_FUNCTION_0_8();
  *(void *)(v0 + v5) = sub_25C8EBB10();
  uint64_t v6 = qword_26A5DA088;
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_0_1();
  *(void *)(v0 + v6) = sub_25C8EBB10();
  uint64_t v7 = qword_26A5DA090;
  OUTLINED_FUNCTION_0_8();
  uint64_t v8 = sub_25C8EBB10();
  *(void *)(v1 + v7) = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9A98);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_25C8EE060;
  *(void *)(v9 + 56) = v3;
  unint64_t v10 = sub_25C8C8144();
  *(void *)(v9 + 3sub_25C8B55A0(4, 3, 2, 2) = v4;
  uint64_t v11 = *(void *)(v1 + v5);
  *(void *)(v9 + 96) = v3;
  *(void *)(v9 + 10sub_25C8B55A0(4, 3, 2, 4) = v10;
  *(void *)(v9 + 6sub_25C8B55A0(4, 3, 2, 4) = v10;
  *(void *)(v9 + 7sub_25C8B55A0(4, 3, 2, 2) = v11;
  uint64_t v12 = *(void *)(v1 + v6);
  *(void *)(v9 + 136) = v3;
  *(void *)(v9 + 14sub_25C8B55A0(4, 3, 2, 4) = v10;
  *(void *)(v9 + 11sub_25C8B55A0(4, 3, 2, 2) = v12;
  *(void *)(v9 + 176) = v3;
  *(void *)(v9 + 18sub_25C8B55A0(4, 3, 2, 4) = v10;
  *(void *)(v9 + 15sub_25C8B55A0(4, 3, 2, 2) = v8;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  return MEMORY[0x270F6BF88](0x6E65644972657375, 0xEC00000079746974, 1, v9);
}

void sub_25C8C8014()
{
}

uint64_t sub_25C8C8044()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_25C8C80A4()
{
  uint64_t v0 = sub_25C8EBAD0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_25C8C810C()
{
  uint64_t v0 = sub_25C8C80A4();
  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t sub_25C8C813C()
{
  return _s24UserIdentityOntologyNodeCMa();
}

unint64_t sub_25C8C8144()
{
  unint64_t result = qword_26A5D9AB0;
  if (!qword_26A5D9AB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5D95D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5D9AB0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_8()
{
  return swift_allocObject();
}

uint64_t sub_25C8C81B4()
{
  OUTLINED_FUNCTION_6_1();
  v1[8] = v2;
  v1[9] = v0;
  v1[7] = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9F70);
  v1[10] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9D78);
  v1[11] = swift_task_alloc();
  uint64_t v4 = sub_25C8EB740();
  v1[12] = v4;
  OUTLINED_FUNCTION_1_2(v4);
  v1[13] = v5;
  v1[14] = swift_task_alloc();
  v1[15] = swift_task_alloc();
  v1[16] = swift_task_alloc();
  uint64_t v6 = sub_25C8EC0F0();
  v1[17] = v6;
  OUTLINED_FUNCTION_1_2(v6);
  v1[18] = v7;
  v1[19] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C8C8304, 0, 0);
}

uint64_t sub_25C8C8304()
{
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[18];
  uint64_t v1 = v0[19];
  uint64_t v3 = v0[17];
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_26A5DD5A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_25C8EC0D0();
  os_log_type_t v6 = sub_25C8EC2D0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_25C89B000, v5, v6, "EstablishUserHandleIntentStrategy.makeIntentHandledResponse()", v7, 2u);
    MEMORY[0x261198330](v7, -1, -1);
  }
  uint64_t v9 = v0[18];
  uint64_t v8 = v0[19];
  uint64_t v10 = v0[17];

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA0F8);
  uint64_t v11 = (void *)sub_25C8EB830();
  id v12 = objc_msgSend(v11, sel_identity);
  v0[20] = v12;

  if (v12
    && (id v13 = objc_msgSend(v12, sel_isMultiUserContext)) != 0
    && (uint64_t v14 = v13, v15 = objc_msgSend(v13, sel_BOOLValue), v14, v15))
  {
    id v16 = objc_msgSend(v12, sel_isIdentifiedOrUnsure);
    if (v16)
    {
      uint64_t v17 = v16;
      objc_msgSend(v16, sel_BOOLValue);
    }
    sub_25C8C3BFC(v12);
    if (v21)
    {
      sub_25C8EC1A0();
      swift_bridgeObjectRelease();
      uint64_t v22 = 0;
    }
    else
    {
      uint64_t v22 = 1;
    }
    uint64_t v23 = v0[11];
    uint64_t v24 = sub_25C8EBEE0();
    __swift_storeEnumTagSinglePayload(v23, v22, 1, v24);
    uint64_t v25 = (void *)swift_task_alloc();
    v0[21] = v25;
    *uint64_t v25 = v0;
    v25[1] = sub_25C8C8654;
    return sub_25C8B4318();
  }
  else
  {
    __swift_project_boxed_opaque_existential_1((void *)(v0[9] + 16), *(void *)(v0[9] + 40));
    uint64_t v26 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_26A5DA6C8 + dword_26A5DA6C8);
    unint64_t v18 = (void *)swift_task_alloc();
    v0[23] = v18;
    *unint64_t v18 = v0;
    v18[1] = sub_25C8C88E8;
    uint64_t v19 = v0[14];
    return v26(v19, 0xD00000000000001CLL, 0x800000025C8F1160);
  }
}

uint64_t sub_25C8C8654()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v3 = v2;
  *(void *)(v4 + 176) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v5 = sub_25C8C8C0C;
  }
  else {
    uint64_t v5 = sub_25C8C8738;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_25C8C8738()
{
  sub_25C89F4B0(*(void *)(v2 + 88), &qword_26A5D9D78);
  uint64_t v5 = *(void *)(v2 + 128);
  uint64_t v14 = *(void **)(v2 + 160);
  uint64_t v6 = *(void *)(v2 + 104);
  OUTLINED_FUNCTION_6_4();
  uint64_t v7 = OUTLINED_FUNCTION_3_4();
  v8(v7);
  __swift_project_boxed_opaque_existential_1((void *)(v1 + 104), *(void *)(v1 + 128));
  sub_25C8EB430();
  uint64_t v9 = sub_25C8EB720();
  uint64_t v10 = OUTLINED_FUNCTION_4_6(v9);
  *(_OWORD *)(v2 + 3sub_25C8B55A0(4, 3, 2, 2) = 0u;
  *(void *)(v2 + 48) = 0;
  *(_OWORD *)(v2 + 16) = 0u;
  uint64_t v11 = MEMORY[0x263F6FFF0];
  v4[3] = v10;
  v4[4] = v11;
  __swift_allocate_boxed_opaque_existential_1Tm(v4);
  sub_25C8EB610();

  sub_25C89F4B0(v2 + 16, &qword_26A5D9F80);
  sub_25C89F4B0(v0, &qword_26A5D9F70);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v12 = *(uint64_t (**)(void))(v2 + 8);
  return v12();
}

uint64_t sub_25C8C88E8()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v3 = v2;
  *(void *)(v4 + 19sub_25C8B55A0(4, 3, 2, 2) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v5 = sub_25C8C8B6C;
  }
  else {
    uint64_t v5 = sub_25C8C89CC;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_25C8C89CC()
{
  uint64_t v5 = *(void *)(v2 + 128);
  uint64_t v6 = *(void *)(v2 + 104);
  uint64_t v14 = *(void **)(v2 + 160);
  OUTLINED_FUNCTION_6_4();
  uint64_t v7 = OUTLINED_FUNCTION_3_4();
  v8(v7);
  __swift_project_boxed_opaque_existential_1((void *)(v1 + 104), *(void *)(v1 + 128));
  sub_25C8EB430();
  uint64_t v9 = sub_25C8EB720();
  uint64_t v10 = OUTLINED_FUNCTION_4_6(v9);
  *(_OWORD *)(v2 + 3sub_25C8B55A0(4, 3, 2, 2) = 0u;
  *(void *)(v2 + 48) = 0;
  *(_OWORD *)(v2 + 16) = 0u;
  uint64_t v11 = MEMORY[0x263F6FFF0];
  v4[3] = v10;
  v4[4] = v11;
  __swift_allocate_boxed_opaque_existential_1Tm(v4);
  sub_25C8EB610();

  sub_25C89F4B0(v2 + 16, &qword_26A5D9F80);
  sub_25C89F4B0(v0, &qword_26A5D9F70);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v12 = *(uint64_t (**)(void))(v2 + 8);
  return v12();
}

uint64_t sub_25C8C8B6C()
{
  OUTLINED_FUNCTION_5_5();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25C8C8C0C()
{
  uint64_t v1 = *(void *)(v0 + 88);

  sub_25C89F4B0(v1, &qword_26A5D9D78);
  OUTLINED_FUNCTION_5_5();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_25C8C8CC0()
{
  sub_25C8A8014(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  swift_release();
  return v0;
}

uint64_t sub_25C8C8CF0()
{
  sub_25C8C8CC0();
  return MEMORY[0x270FA0228](v0, 152, 7);
}

uint64_t type metadata accessor for EstablishUserHandleIntentStrategy()
{
  return self;
}

uint64_t sub_25C8C8D4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for EstablishUserHandleIntentStrategy();
  *uint64_t v8 = v4;
  v8[1] = sub_25C8AC380;
  return MEMORY[0x270F66378](a1, a2, v9, a4);
}

uint64_t sub_25C8C8E10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for EstablishUserHandleIntentStrategy();
  *uint64_t v8 = v4;
  v8[1] = sub_25C8AC380;
  return MEMORY[0x270F66380](a1, a2, v9, a4);
}

uint64_t sub_25C8C8ED4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for EstablishUserHandleIntentStrategy();
  *uint64_t v8 = v4;
  v8[1] = sub_25C8AC380;
  return MEMORY[0x270F66358](a1, a2, v9, a4);
}

uint64_t sub_25C8C8F98()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C8AC380;
  return sub_25C8C81B4();
}

uint64_t sub_25C8C9044(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for EstablishUserHandleIntentStrategy();
  *uint64_t v8 = v4;
  v8[1] = sub_25C8AC380;
  return MEMORY[0x270F66370](a1, a2, v9, a4);
}

uint64_t sub_25C8C9108(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for EstablishUserHandleIntentStrategy();
  *uint64_t v8 = v4;
  v8[1] = sub_25C8AC380;
  return MEMORY[0x270F66368](a1, a2, v9, a4);
}

uint64_t sub_25C8C91CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for EstablishUserHandleIntentStrategy();
  *uint64_t v8 = v4;
  v8[1] = sub_25C8ABDDC;
  return MEMORY[0x270F66348](a1, a2, v9, a4);
}

uint64_t sub_25C8C9290()
{
  uint64_t v1 = sub_25C8A3934();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return sub_25C8A41D8(v2, v0, v1);
}

unint64_t sub_25C8C9318()
{
  unint64_t result = qword_26A5DA0B8[0];
  if (!qword_26A5DA0B8[0])
  {
    type metadata accessor for EstablishUserHandleIntentStrategy();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A5DA0B8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_3_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_6(uint64_t a1)
{
  __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
  return sub_25C8EB9A0();
}

uint64_t OUTLINED_FUNCTION_5_5()
{
  return swift_task_dealloc();
}

double sub_25C8C93E8@<D0>(uint64_t a1@<X8>)
{
  void (*v51)(long long *__return_ptr, uint64_t *);
  void (*v52)(void);
  uint64_t v53;
  void (*v54)(uint64_t);
  uint64_t v55;
  void (*v56)(void);
  uint64_t v57;
  void (*v58)(uint64_t);
  void (*v59)(void);
  NSObject *v60;
  os_log_type_t v61;
  uint8_t *v62;
  void (*v63)(void);
  double v64;
  void (*v65)(void);
  NSObject *v66;
  os_log_type_t v67;
  uint8_t *v68;
  void (*v69)(void);
  uint64_t v70;
  void (*v71)(uint64_t);
  void v72[5];
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  long long v83;

  uint64_t v80 = (uint64_t *)a1;
  sub_25C8EB9D0();
  OUTLINED_FUNCTION_0_2();
  v72[3] = v2;
  v72[4] = v1;
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_24_1();
  v72[2] = v3;
  sub_25C8EB980();
  OUTLINED_FUNCTION_0_2();
  uint64_t v74 = v5;
  os_log_type_t v75 = v4;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_24_1();
  uint64_t v73 = v6;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5D9FB0);
  OUTLINED_FUNCTION_0_2();
  uint64_t v77 = v8;
  unint64_t v78 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v79 = sub_25C8EC0F0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v81 = v9;
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  v72[1] = (char *)v72 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  v72[0] = (char *)v72 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v76 = (char *)v72 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = sub_25C8EB950();
  OUTLINED_FUNCTION_0_2();
  uint64_t v19 = v18;
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (void *)((char *)v72 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v23 = sub_25C8EBDD0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v25 = v24;
  uint64_t v27 = MEMORY[0x270FA5388](v26);
  uint64_t v29 = (char *)v72 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  os_log_type_t v31 = (char *)v72 - v30;
  OUTLINED_FUNCTION_5_2();
  v32();
  int v33 = (*(uint64_t (**)(uint64_t *, uint64_t))(v19 + 88))(v22, v17);
  if (v33 == *MEMORY[0x263F6FF50])
  {
    uint64_t v34 = OUTLINED_FUNCTION_1_7();
    v35(v34);
LABEL_5:
    uint64_t v38 = *(void (**)(char *, uint64_t *, uint64_t))(v25 + 32);
    v38(v31, v22, v23);
    if (qword_26A5D95B0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v79, (uint64_t)qword_26A5DD5B8);
    OUTLINED_FUNCTION_2_4();
    OUTLINED_FUNCTION_5_2();
    v39();
    int v40 = sub_25C8EC0D0();
    os_log_type_t v41 = sub_25C8EC2D0();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = (uint8_t *)OUTLINED_FUNCTION_5_0();
      *(_WORD *)uint64_t v42 = 0;
      _os_log_impl(&dword_25C89B000, v40, v41, "IdentityNLIntentHelper building NLv3 intent", v42, 2u);
      OUTLINED_FUNCTION_3();
    }

    OUTLINED_FUNCTION_12_4();
    OUTLINED_FUNCTION_14_0();
    v43();
    v38(v29, (uint64_t *)v31, v23);
    uint64_t v44 = type metadata accessor for IdentityNLv3Intent();
    uint64_t v45 = v80;
    v80[3] = v44;
    v45[4] = (uint64_t)&off_2709EF720;
    boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm(v45);
    sub_25C8A1598((uint64_t)v29, boxed_opaque_existential_1Tm);
    return result;
  }
  if (v33 == *MEMORY[0x263F6FF78])
  {
    uint64_t v36 = OUTLINED_FUNCTION_1_7();
    v37(v36);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA1C8);
    swift_release();
    goto LABEL_5;
  }
  if (v33 == *MEMORY[0x263F6FF58])
  {
    uint64_t v48 = OUTLINED_FUNCTION_1_7();
    v49(v48);
    uint64_t v50 = *v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9FC0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9FC8);
    sub_25C8EBE60();
    uint64_t v51 = (void (*)(long long *__return_ptr, uint64_t *))sub_25C8EBE70();
    OUTLINED_FUNCTION_14_0();
    v52();
    uint64_t v82 = v50;
    v51(&v83, &v82);
    swift_release();
    sub_25C8A41E8((uint64_t)&v83);
    sub_25C8CABAC(v50, (uint64_t)v80);
    swift_unknownObjectRelease();
  }
  else if (v33 == *MEMORY[0x263F6FF80])
  {
    unint64_t v53 = OUTLINED_FUNCTION_1_7();
    v54(v53);
    (*(void (**)(uint64_t, uint64_t *, uint64_t))(v74 + 32))(v73, v22, v75);
    sub_25C8EB970();
    int v55 = sub_25C8EBAA0();
    OUTLINED_FUNCTION_14_0();
    v56();
    if (v55)
    {
      sub_25C8CABAC(v55, (uint64_t)v80);
      swift_unknownObjectRelease();
      uint64_t v57 = OUTLINED_FUNCTION_8_3();
      v58(v57);
    }
    else
    {
      if (qword_26A5D95B0 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v79, (uint64_t)qword_26A5DD5B8);
      OUTLINED_FUNCTION_2_4();
      OUTLINED_FUNCTION_5_2();
      v65();
      uint64_t v66 = sub_25C8EC0D0();
      unint64_t v67 = sub_25C8EC2E0();
      if (os_log_type_enabled(v66, v67))
      {
        uint64_t v68 = (uint8_t *)OUTLINED_FUNCTION_5_0();
        *(_WORD *)uint64_t v68 = 0;
        _os_log_impl(&dword_25C89B000, v66, v67, "Unable to convert usoParse to legacy first dialog act", v68, 2u);
        OUTLINED_FUNCTION_3();
      }

      OUTLINED_FUNCTION_12_4();
      OUTLINED_FUNCTION_14_0();
      v69();
      id v70 = OUTLINED_FUNCTION_8_3();
      v71(v70);
      return OUTLINED_FUNCTION_9_4();
    }
  }
  else
  {
    if (qword_26A5D95B0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v79, (uint64_t)qword_26A5DD5B8);
    OUTLINED_FUNCTION_2_4();
    OUTLINED_FUNCTION_5_2();
    v59();
    uint64_t v60 = sub_25C8EC0D0();
    uint64_t v61 = sub_25C8EC2D0();
    if (os_log_type_enabled(v60, v61))
    {
      os_log_type_t v62 = (uint8_t *)OUTLINED_FUNCTION_5_0();
      *(_WORD *)os_log_type_t v62 = 0;
      _os_log_impl(&dword_25C89B000, v60, v61, "#IdentityNLIntentHelper unrecognized parse type, not building intent.", v62, 2u);
      OUTLINED_FUNCTION_3();
    }

    OUTLINED_FUNCTION_12_4();
    OUTLINED_FUNCTION_14_0();
    v63();
    uint64_t v64 = OUTLINED_FUNCTION_9_4();
    (*(void (**)(uint64_t *, uint64_t, double))(v19 + 8))(v22, v17, v64);
  }
  return result;
}

BOOL static IntentCaseType.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t IntentCaseType.hash(into:)()
{
  return sub_25C8EC600();
}

uint64_t IntentCaseType.hashValue.getter()
{
  return sub_25C8EC610();
}

BOOL sub_25C8C9D04(char *a1, char *a2)
{
  return static IntentCaseType.__derived_enum_equals(_:_:)(*a1, *a2);
}

uint64_t sub_25C8C9D10()
{
  return IntentCaseType.hashValue.getter();
}

uint64_t sub_25C8C9D18()
{
  return IntentCaseType.hash(into:)();
}

SiriIdentityInternal::IdentityVerb_optional __swiftcall IdentityVerb.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v1 = sub_25C8EC510();
  swift_bridgeObjectRelease();
  if (v1 >= 6) {
    return (SiriIdentityInternal::IdentityVerb_optional)6;
  }
  else {
    return (SiriIdentityInternal::IdentityVerb_optional)v1;
  }
}

void *static IdentityVerb.allCases.getter()
{
  return &unk_2709EF410;
}

void IdentityVerb.rawValue.getter()
{
}

uint64_t sub_25C8C9D94()
{
  return sub_25C8D715C();
}

uint64_t sub_25C8C9DA0()
{
  return sub_25C8D72B0();
}

uint64_t sub_25C8C9DA8()
{
  return sub_25C8D7414();
}

uint64_t sub_25C8C9DB0()
{
  return sub_25C8D7644();
}

SiriIdentityInternal::IdentityVerb_optional sub_25C8C9DB8@<W0>(Swift::String *a1@<X0>, SiriIdentityInternal::IdentityVerb_optional *a2@<X8>)
{
  result.value = IdentityVerb.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

void sub_25C8C9DE8(void *a1@<X8>)
{
  IdentityVerb.rawValue.getter();
  *a1 = v2;
  a1[1] = v3;
}

void sub_25C8C9E14(void *a1@<X8>)
{
  *a1 = &unk_2709EF410;
}

uint64_t sub_25C8C9E24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25C8CA758(a1, a2, a3, (uint64_t (*)(void))sub_25C8CAAC8, (uint64_t (*)(void))sub_25C8CAB14, (uint64_t (*)(void))sub_25C8CAB60);
}

SiriIdentityInternal::IdentityNoun_optional __swiftcall IdentityNoun.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v1 = sub_25C8EC510();
  swift_bridgeObjectRelease();
  if (v1 >= 4) {
    return (SiriIdentityInternal::IdentityNoun_optional)4;
  }
  else {
    return (SiriIdentityInternal::IdentityNoun_optional)v1;
  }
}

void *static IdentityNoun.allCases.getter()
{
  return &unk_2709EF4B8;
}

void IdentityNoun.rawValue.getter()
{
}

unint64_t sub_25C8C9EDC()
{
  unint64_t result = qword_26A5DA100;
  if (!qword_26A5DA100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DA100);
  }
  return result;
}

unint64_t sub_25C8C9F2C()
{
  unint64_t result = qword_26A5DA108;
  if (!qword_26A5DA108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DA108);
  }
  return result;
}

unint64_t sub_25C8C9F7C()
{
  unint64_t result = qword_26A5DA110;
  if (!qword_26A5DA110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DA110);
  }
  return result;
}

uint64_t sub_25C8C9FC8()
{
  return sub_25C8CA810(&qword_26A5DA118, &qword_26A5DA120);
}

unint64_t sub_25C8C9FF4()
{
  unint64_t result = qword_26A5DA128;
  if (!qword_26A5DA128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DA128);
  }
  return result;
}

uint64_t sub_25C8CA040()
{
  unint64_t v0 = sub_25C8EC510();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

void *sub_25C8CA08C()
{
  return &unk_2709EF548;
}

void sub_25C8CA098()
{
}

uint64_t sub_25C8CA0B4()
{
  return sub_25C8D71D8();
}

unint64_t sub_25C8CA0C4()
{
  unint64_t result = qword_26A5DA130;
  if (!qword_26A5DA130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DA130);
  }
  return result;
}

uint64_t sub_25C8CA110()
{
  return sub_25C8D7300();
}

uint64_t sub_25C8CA118()
{
  return sub_25C8D7468();
}

uint64_t sub_25C8CA120()
{
  return sub_25C8D7600();
}

SiriIdentityInternal::IdentityNoun_optional sub_25C8CA128@<W0>(Swift::String *a1@<X0>, SiriIdentityInternal::IdentityNoun_optional *a2@<X8>)
{
  result.value = IdentityNoun.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

void sub_25C8CA158(void *a1@<X8>)
{
  IdentityNoun.rawValue.getter();
  *a1 = v2;
  a1[1] = v3;
}

unint64_t sub_25C8CA188()
{
  unint64_t result = qword_26A5DA138;
  if (!qword_26A5DA138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DA138);
  }
  return result;
}

uint64_t sub_25C8CA1D4()
{
  return sub_25C8CA810(&qword_26A5DA140, &qword_26A5DA148);
}

void sub_25C8CA1FC(void *a1@<X8>)
{
  *a1 = &unk_2709EF4B8;
}

unint64_t sub_25C8CA210()
{
  unint64_t result = qword_26A5DA150;
  if (!qword_26A5DA150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DA150);
  }
  return result;
}

uint64_t sub_25C8CA25C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25C8CA758(a1, a2, a3, (uint64_t (*)(void))sub_25C8CA9E4, (uint64_t (*)(void))sub_25C8CAA30, (uint64_t (*)(void))sub_25C8CAA7C);
}

void type metadata accessor for IntentCaseType()
{
}

unsigned char *storeEnumTagSinglePayload for IdentityVerb(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x25C8CA37CLL);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

void type metadata accessor for IdentityVerb()
{
}

uint64_t getEnumTagSinglePayload for IdentityFlowErrorCode(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s20SiriIdentityInternal14IntentCaseTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25C8CA504);
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

void type metadata accessor for IdentityNoun()
{
}

unsigned char *sub_25C8CA538(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25C8CA604);
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

void type metadata accessor for IdentityConfirmationValue()
{
}

unint64_t sub_25C8CA63C()
{
  unint64_t result = qword_26A5DA158;
  if (!qword_26A5DA158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DA158);
  }
  return result;
}

uint64_t sub_25C8CA688()
{
  return sub_25C8D7244();
}

uint64_t sub_25C8CA694()
{
  return sub_25C8D7348();
}

uint64_t sub_25C8CA69C()
{
  return sub_25C8D74BC();
}

uint64_t sub_25C8CA6A4()
{
  return sub_25C8D7598();
}

uint64_t sub_25C8CA6AC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25C8CA040();
  *a1 = result;
  return result;
}

void sub_25C8CA6DC(void *a1@<X8>)
{
  sub_25C8CA098();
  *a1 = v2;
  a1[1] = v3;
}

void sub_25C8CA708(void *a1@<X8>)
{
  *a1 = &unk_2709EF548;
}

uint64_t sub_25C8CA718(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25C8CA758(a1, a2, a3, (uint64_t (*)(void))sub_25C8CA900, (uint64_t (*)(void))sub_25C8CA94C, (uint64_t (*)(void))sub_25C8CA998);
}

uint64_t sub_25C8CA758(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void), uint64_t (*a6)(void))
{
  uint64_t v10 = a4();
  uint64_t v11 = a5();
  uint64_t v12 = a6();
  return MEMORY[0x270F6DF80](a1, a2, v10, v11, v12);
}

uint64_t sub_25C8CA7E8()
{
  return sub_25C8CA810(&qword_26A5DA160, &qword_26A5DA168);
}

uint64_t sub_25C8CA810(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_25C8CA864()
{
  unint64_t result = qword_26A5DA170;
  if (!qword_26A5DA170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DA170);
  }
  return result;
}

unint64_t sub_25C8CA8B4()
{
  unint64_t result = qword_26A5DA178;
  if (!qword_26A5DA178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DA178);
  }
  return result;
}

unint64_t sub_25C8CA900()
{
  unint64_t result = qword_26A5DA180;
  if (!qword_26A5DA180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DA180);
  }
  return result;
}

unint64_t sub_25C8CA94C()
{
  unint64_t result = qword_26A5DA188;
  if (!qword_26A5DA188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DA188);
  }
  return result;
}

unint64_t sub_25C8CA998()
{
  unint64_t result = qword_26A5DA190;
  if (!qword_26A5DA190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DA190);
  }
  return result;
}

unint64_t sub_25C8CA9E4()
{
  unint64_t result = qword_26A5DA198;
  if (!qword_26A5DA198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DA198);
  }
  return result;
}

unint64_t sub_25C8CAA30()
{
  unint64_t result = qword_26A5DA1A0;
  if (!qword_26A5DA1A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DA1A0);
  }
  return result;
}

unint64_t sub_25C8CAA7C()
{
  unint64_t result = qword_26A5DA1A8;
  if (!qword_26A5DA1A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DA1A8);
  }
  return result;
}

unint64_t sub_25C8CAAC8()
{
  unint64_t result = qword_26A5DA1B0;
  if (!qword_26A5DA1B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DA1B0);
  }
  return result;
}

unint64_t sub_25C8CAB14()
{
  unint64_t result = qword_26A5DA1B8;
  if (!qword_26A5DA1B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DA1B8);
  }
  return result;
}

unint64_t sub_25C8CAB60()
{
  unint64_t result = qword_26A5DA1C0;
  if (!qword_26A5DA1C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DA1C0);
  }
  return result;
}

uint64_t sub_25C8CABAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  void (*v12)(long long *__return_ptr, uint64_t *);
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  long long v21;
  long long v22[2];

  uint64_t v19 = a2;
  uint64_t v3 = sub_25C8EC0F0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  MEMORY[0x270FA5388](v5);
  BOOL v7 = (char *)&v18 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5D9FB0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9FC0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9FC8);
  sub_25C8EBE60();
  uint64_t v12 = (void (*)(long long *__return_ptr, uint64_t *))sub_25C8EBE70();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v20 = a1;
  v12(&v21, &v20);
  swift_release();
  sub_25C8A4290(&v21, (uint64_t)v22);
  if (qword_26A5D95B0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v3, (uint64_t)qword_26A5DD5B8);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v13, v3);
  uint64_t v14 = sub_25C8EC0D0();
  uint64_t v15 = sub_25C8EC2D0();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_25C89B000, v14, v15, "IdentityNLIntentHelper building NLv4 intent", v16, 2u);
    MEMORY[0x261198330](v16, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  return sub_25C8A4290(v22, v19);
}

uint64_t OUTLINED_FUNCTION_1_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8_3()
{
  return v0;
}

double OUTLINED_FUNCTION_9_4()
{
  uint64_t v1 = *(void *)(v0 - 160);
  *(void *)(v1 + 3sub_25C8B55A0(4, 3, 2, 2) = 0;
  double result = 0.0;
  *(_OWORD *)uint64_t v1 = 0u;
  *(_OWORD *)(v1 + 16) = 0u;
  return result;
}

uint64_t sub_25C8CB034()
{
  if (!*(void *)(v0 + 16)) {
    return 0;
  }
  uint64_t v2 = *(void **)(v0 + 16);
  sub_25C8CB084(&v2, &v3);
  return v3;
}

uint64_t sub_25C8CB084@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = (void *)sub_25C8EC160();
  id v5 = objc_msgSend(v3, sel_objectForKey_, v4);

  if (v5)
  {
    sub_25C8EC390();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  sub_25C8CB198((uint64_t)v7, (uint64_t)v8);
  if (!v9)
  {
    uint64_t result = sub_25C8A4958((uint64_t)v8);
    goto LABEL_8;
  }
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
LABEL_8:
    *a2 = 0;
    a2[1] = 0;
  }
  return result;
}

uint64_t type metadata accessor for UserDefaultsProvider()
{
  return self;
}

uint64_t sub_25C8CB198(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9B28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C8CB200()
{
  id v1 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  *(void *)(v0 + 16) = sub_25C8CB254(0xD000000000000017, 0x800000025C8F0360);
  return v0;
}

id sub_25C8CB254(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = (void *)sub_25C8EC160();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = objc_msgSend(v2, sel_initWithSuiteName_, v3);

  return v4;
}

uint64_t *sub_25C8CB2B8(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25C8EB000();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v7))
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9C98);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v7);
    }
    uint64_t v10 = a3[5];
    uint64_t v11 = a3[6];
    uint64_t v12 = (uint64_t *)((char *)a1 + v10);
    uint64_t v13 = (uint64_t *)((char *)a2 + v10);
    uint64_t v14 = v13[1];
    *uint64_t v12 = *v13;
    v12[1] = v14;
    uint64_t v15 = (uint64_t *)((char *)a1 + v11);
    uint64_t v16 = (uint64_t *)((char *)a2 + v11);
    uint64_t v17 = v16[1];
    void *v15 = *v16;
    v15[1] = v17;
    uint64_t v18 = a3[7];
    uint64_t v19 = a3[8];
    uint64_t v20 = (uint64_t *)((char *)a1 + v18);
    uint64_t v21 = (uint64_t *)((char *)a2 + v18);
    uint64_t v22 = v21[1];
    *uint64_t v20 = *v21;
    v20[1] = v22;
    uint64_t v23 = v21[3];
    id v20[2] = v21[2];
    void v20[3] = v23;
    uint64_t v24 = v21[5];
    v20[4] = v21[4];
    v20[5] = v24;
    uint64_t v25 = v21[7];
    v20[6] = v21[6];
    v20[7] = v25;
    uint64_t v26 = v21[9];
    v20[8] = v21[8];
    v20[9] = v26;
    uint64_t v27 = v21[11];
    v20[10] = v21[10];
    v20[11] = v27;
    v20[12] = v21[12];
    *((unsigned char *)a1 + v19) = *((unsigned char *)a2 + v19);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_25C8CB4A0(uint64_t a1)
{
  uint64_t v2 = sub_25C8EB000();
  if (!__swift_getEnumTagSinglePayload(a1, 1, v2)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

char *sub_25C8CB588(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_25C8EB000();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9C98);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = a3[6];
  uint64_t v10 = &a1[v8];
  uint64_t v11 = &a2[v8];
  uint64_t v12 = *((void *)v11 + 1);
  *(void *)uint64_t v10 = *(void *)v11;
  *((void *)v10 + 1) = v12;
  uint64_t v13 = &a1[v9];
  uint64_t v14 = &a2[v9];
  uint64_t v15 = *((void *)v14 + 1);
  *(void *)uint64_t v13 = *(void *)v14;
  *((void *)v13 + 1) = v15;
  uint64_t v16 = a3[7];
  uint64_t v17 = a3[8];
  uint64_t v18 = &a1[v16];
  uint64_t v19 = &a2[v16];
  uint64_t v20 = *((void *)v19 + 1);
  *(void *)uint64_t v18 = *(void *)v19;
  *((void *)v18 + 1) = v20;
  uint64_t v21 = *((void *)v19 + 3);
  *((void *)v18 + sub_25C8B55A0(4, 3, 2, 2) = *((void *)v19 + 2);
  *((void *)v18 + sub_25C8B55A0(4, 3, 2, 3) = v21;
  uint64_t v22 = *((void *)v19 + 5);
  *((void *)v18 + sub_25C8B55A0(4, 3, 2, 4) = *((void *)v19 + 4);
  *((void *)v18 + 5) = v22;
  uint64_t v23 = *((void *)v19 + 7);
  *((void *)v18 + 6) = *((void *)v19 + 6);
  *((void *)v18 + 7) = v23;
  uint64_t v24 = *((void *)v19 + 9);
  *((void *)v18 + 8) = *((void *)v19 + 8);
  *((void *)v18 + 9) = v24;
  uint64_t v25 = *((void *)v19 + 11);
  *((void *)v18 + 10) = *((void *)v19 + 10);
  *((void *)v18 + 11) = v25;
  *((void *)v18 + 1sub_25C8B55A0(4, 3, 2, 2) = *((void *)v19 + 12);
  a1[v17] = a2[v17];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

char *sub_25C8CB720(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_25C8EB000();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (!EnumTagSinglePayload)
  {
    uint64_t v9 = *(void *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9C98);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
LABEL_7:
  uint64_t v11 = a3[5];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  *(void *)uint64_t v12 = *(void *)v13;
  *((void *)v12 + 1) = *((void *)v13 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = a3[6];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  *(void *)uint64_t v15 = *(void *)v16;
  *((void *)v15 + 1) = *((void *)v16 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[7];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  *(void *)uint64_t v18 = *(void *)&a2[v17];
  *((void *)v18 + 1) = *(void *)&a2[v17 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v18 + sub_25C8B55A0(4, 3, 2, 2) = *((void *)v19 + 2);
  *((void *)v18 + sub_25C8B55A0(4, 3, 2, 3) = *((void *)v19 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v18 + sub_25C8B55A0(4, 3, 2, 4) = *((void *)v19 + 4);
  *((void *)v18 + 5) = *((void *)v19 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v18 + 6) = *((void *)v19 + 6);
  *((void *)v18 + 7) = *((void *)v19 + 7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v18 + 8) = *((void *)v19 + 8);
  *((void *)v18 + 9) = *((void *)v19 + 9);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v18 + 10) = *((void *)v19 + 10);
  *((void *)v18 + 11) = *((void *)v19 + 11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v18 + 1sub_25C8B55A0(4, 3, 2, 2) = *((void *)v19 + 12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[a3[8]] = a2[a3[8]];
  return a1;
}

char *sub_25C8CB9BC(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_25C8EB000();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9C98);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  uint64_t v8 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  *(_OWORD *)&a1[v8] = *(_OWORD *)&a2[v8];
  memcpy(&a1[a3[7]], &a2[a3[7]], 0x68uLL);
  a1[a3[8]] = a2[a3[8]];
  return a1;
}

char *sub_25C8CBABC(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_25C8EB000();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (!EnumTagSinglePayload)
  {
    uint64_t v9 = *(void *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9C98);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
LABEL_7:
  uint64_t v11 = a3[5];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  uint64_t v15 = *(void *)v13;
  uint64_t v14 = *((void *)v13 + 1);
  *(void *)uint64_t v12 = v15;
  *((void *)v12 + 1) = v14;
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[6];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  uint64_t v20 = *(void *)v18;
  uint64_t v19 = *((void *)v18 + 1);
  *(void *)uint64_t v17 = v20;
  *((void *)v17 + 1) = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = a3[7];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = &a2[v21];
  uint64_t v24 = *(void *)&a2[v21 + 8];
  *(void *)uint64_t v22 = *(void *)&a2[v21];
  *((void *)v22 + 1) = v24;
  swift_bridgeObjectRelease();
  uint64_t v25 = *((void *)v23 + 3);
  *((void *)v22 + sub_25C8B55A0(4, 3, 2, 2) = *((void *)v23 + 2);
  *((void *)v22 + sub_25C8B55A0(4, 3, 2, 3) = v25;
  swift_bridgeObjectRelease();
  uint64_t v26 = *((void *)v23 + 5);
  *((void *)v22 + sub_25C8B55A0(4, 3, 2, 4) = *((void *)v23 + 4);
  *((void *)v22 + 5) = v26;
  swift_bridgeObjectRelease();
  uint64_t v27 = *((void *)v23 + 7);
  *((void *)v22 + 6) = *((void *)v23 + 6);
  *((void *)v22 + 7) = v27;
  swift_bridgeObjectRelease();
  uint64_t v28 = *((void *)v23 + 9);
  *((void *)v22 + 8) = *((void *)v23 + 8);
  *((void *)v22 + 9) = v28;
  swift_bridgeObjectRelease();
  uint64_t v29 = *((void *)v23 + 11);
  *((void *)v22 + 10) = *((void *)v23 + 10);
  *((void *)v22 + 11) = v29;
  swift_bridgeObjectRelease();
  *((void *)v22 + 1sub_25C8B55A0(4, 3, 2, 2) = *((void *)v23 + 12);
  swift_bridgeObjectRelease();
  a1[a3[8]] = a2[a3[8]];
  return a1;
}

uint64_t sub_25C8CBCD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C8CBCE4);
}

uint64_t sub_25C8CBCE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9C98);
  OUTLINED_FUNCTION_0_4();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

uint64_t sub_25C8CBD78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C8CBD8C);
}

void sub_25C8CBD8C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9C98);
  OUTLINED_FUNCTION_0_4();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
}

uint64_t type metadata accessor for UserAccount()
{
  uint64_t result = qword_26A5DA1D0;
  if (!qword_26A5DA1D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25C8CBE64()
{
  sub_25C8CBF18();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_25C8CBF18()
{
  if (!qword_26A5DA1E0)
  {
    sub_25C8EB000();
    unint64_t v0 = sub_25C8EC350();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A5DA1E0);
    }
  }
}

uint64_t sub_25C8CBF70()
{
  return 0;
}

uint64_t sub_25C8CC0FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C8EB000();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v40[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA1E8);
  uint64_t v9 = v8 - 8;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = &v40[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9C98);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v15 = &v40[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = &v40[-v17];
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = &v40[-v19];
  sub_25C8B08F4(a1, (uint64_t)&v40[-v19]);
  sub_25C8B08F4(a2, (uint64_t)v18);
  uint64_t v21 = (uint64_t)&v11[*(int *)(v9 + 56)];
  sub_25C8B08F4((uint64_t)v20, (uint64_t)v11);
  sub_25C8B08F4((uint64_t)v18, v21);
  OUTLINED_FUNCTION_1_8((uint64_t)v11);
  if (v22)
  {
    sub_25C89F4B0((uint64_t)v18, &qword_26A5D9C98);
    sub_25C89F4B0((uint64_t)v20, &qword_26A5D9C98);
    OUTLINED_FUNCTION_1_8(v21);
    if (v22)
    {
      sub_25C89F4B0((uint64_t)v11, &qword_26A5D9C98);
      goto LABEL_13;
    }
LABEL_9:
    sub_25C89F4B0((uint64_t)v11, &qword_26A5DA1E8);
    goto LABEL_10;
  }
  sub_25C8B08F4((uint64_t)v11, (uint64_t)v15);
  OUTLINED_FUNCTION_1_8(v21);
  if (v22)
  {
    sub_25C89F4B0((uint64_t)v18, &qword_26A5D9C98);
    sub_25C89F4B0((uint64_t)v20, &qword_26A5D9C98);
    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v15, v4);
    goto LABEL_9;
  }
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 32))(v7, v21, v4);
  sub_25C8CC518();
  int v41 = sub_25C8EC150();
  uint64_t v25 = *(void (**)(unsigned char *, uint64_t))(v5 + 8);
  v25(v7, v4);
  sub_25C89F4B0((uint64_t)v18, &qword_26A5D9C98);
  sub_25C89F4B0((uint64_t)v20, &qword_26A5D9C98);
  v25(v15, v4);
  sub_25C89F4B0((uint64_t)v11, &qword_26A5D9C98);
  if ((v41 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_13:
  uint64_t v26 = (int *)type metadata accessor for UserAccount();
  uint64_t v27 = v26[5];
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = *(void *)(a1 + v27 + 8);
  uint64_t v30 = (void *)(a2 + v27);
  uint64_t v31 = v30[1];
  if (v29)
  {
    if (v31)
    {
      if (*v28 != *v30 || v29 != v31)
      {
        char v33 = sub_25C8EC550();
        char v23 = 0;
        if ((v33 & 1) == 0) {
          return v23 & 1;
        }
      }
      goto LABEL_22;
    }
LABEL_10:
    char v23 = 0;
    return v23 & 1;
  }
  if (v31) {
    goto LABEL_10;
  }
LABEL_22:
  uint64_t v34 = v26[6];
  uint64_t v35 = *(void *)(a1 + v34);
  uint64_t v36 = *(void *)(a1 + v34 + 8);
  unint64_t v37 = (void *)(a2 + v34);
  BOOL v38 = v35 == *v37 && v36 == v37[1];
  if (v38 || (v39 = sub_25C8EC550(), char v23 = 0, (v39 & 1) != 0))
  {
    memcpy(__dst, (const void *)(a1 + v26[7]), sizeof(__dst));
    memcpy(v43, (const void *)(a2 + v26[7]), 0x68uLL);
    if (sub_25C8ACA6C(__dst, v43))
    {
      char v23 = *(unsigned char *)(a1 + v26[8]) ^ *(unsigned char *)(a2 + v26[8]) ^ 1;
      return v23 & 1;
    }
    goto LABEL_10;
  }
  return v23 & 1;
}

unint64_t sub_25C8CC518()
{
  unint64_t result = qword_26A5DA1F0;
  if (!qword_26A5DA1F0)
  {
    sub_25C8EB000();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DA1F0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_8(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

void *initializeBufferWithCopyOfBuffer for ExecutionDeviceResolutionResult(void *a1, void **a2)
{
  uint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    id v4 = v3;
  }
  *a1 = v3;
  return a1;
}

void destroy for ExecutionDeviceResolutionResult(void **a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)v1 >= 0xFFFFFFFF) {
}
  }

void **assignWithCopy for ExecutionDeviceResolutionResult(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  id v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF)
  {
    if ((unint64_t)v4 >= 0xFFFFFFFF)
    {
      *a1 = v4;
      id v6 = v4;
      return a1;
    }
LABEL_7:
    *a1 = v4;
    return a1;
  }
  if ((unint64_t)v4 < 0xFFFFFFFF)
  {

    id v4 = *a2;
    goto LABEL_7;
  }
  *a1 = v4;
  id v5 = v4;

  return a1;
}

void **assignWithTake for ExecutionDeviceResolutionResult(void **a1, unint64_t *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF) {
    goto LABEL_6;
  }
  if (v4 < 0xFFFFFFFF)
  {

LABEL_6:
    *a1 = (void *)v4;
    return a1;
  }
  *a1 = (void *)v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for ExecutionDeviceResolutionResult(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFD && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483645);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(vsub_25C8B55A0(4, 3, 2, 3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 2;
  if (v4 >= 4) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ExecutionDeviceResolutionResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2 + 2;
    }
  }
  return result;
}

uint64_t sub_25C8CC770(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_25C8CC788(void *result, int a2)
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

ValueMetadata *type metadata accessor for ExecutionDeviceResolutionResult()
{
  return &type metadata for ExecutionDeviceResolutionResult;
}

BOOL sub_25C8CC7B8(void *a1, void *a2)
{
  if (!a1) {
    return !a2;
  }
  if (a1 == (void *)1) {
    return a2 == (void *)1;
  }
  if (a1 == (void *)2) {
    return a2 == (void *)2;
  }
  if ((unint64_t)a2 < 3) {
    return 0;
  }
  sub_25C8C6A40();
  sub_25C8CC878(a1);
  sub_25C8CC878(a2);
  char v5 = sub_25C8EC330();
  sub_25C8CC888(a2);
  sub_25C8CC888(a1);
  return v5 & 1;
}

BOOL sub_25C8CC86C(void **a1, void **a2)
{
  return sub_25C8CC7B8(*a1, *a2);
}

id sub_25C8CC878(id result)
{
  if ((unint64_t)result >= 3) {
    return result;
  }
  return result;
}

void sub_25C8CC888(id a1)
{
  if ((unint64_t)a1 >= 3) {
}
  }

id IdentifyUserIntentHandler.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

uint64_t IdentifyUserIntentHandler.resolveIdentity(for:)()
{
  OUTLINED_FUNCTION_6_1();
  v1[15] = v0;
  uint64_t v2 = sub_25C8EC0F0();
  v1[16] = v2;
  OUTLINED_FUNCTION_1_2(v2);
  v1[17] = v3;
  v1[18] = OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C8CC95C()
{
  OUTLINED_FUNCTION_12_1();
  if (qword_26A5D95A8 != -1) {
    uint64_t v1 = swift_once();
  }
  uint64_t v2 = OUTLINED_FUNCTION_16_3(v1, (uint64_t)qword_26A5DD5A0);
  v3(v2);
  uint64_t v4 = (void *)sub_25C8EC0D0();
  os_log_type_t v5 = sub_25C8EC2D0();
  if (OUTLINED_FUNCTION_23(v5))
  {
    uint64_t v6 = (_WORD *)OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_27(v6);
    OUTLINED_FUNCTION_21(&dword_25C89B000, v7, v8, "IdentifyUserIntentHandler.resolveIdentity");
    OUTLINED_FUNCTION_4_8();
  }

  uint64_t v9 = OUTLINED_FUNCTION_7_3();
  v10(v9);
  sub_25C8EBE50();
  sub_25C8EBE40();
  sub_25C8EBE20();
  swift_release();
  char v11 = sub_25C8EBFA0();
  swift_release();
  if (v11)
  {
    uint64_t v15 = (void *)swift_task_alloc();
    v0[19] = v15;
    void *v15 = v0;
    v15[1] = sub_25C8CCC10;
    return sub_25C8CD7B8();
  }
  else
  {
    sub_25C8CE57C();
    uint64_t v12 = sub_25C89EB24();
    v0[20] = v12;
    if (v12)
    {
      uint64_t v13 = v12;
      v0[2] = v0;
      v0[7] = v0 + 24;
      v0[3] = sub_25C8CCD24;
      uint64_t v14 = swift_continuation_init();
      v0[10] = MEMORY[0x263EF8330];
      v0[11] = 0x40000000;
      v0[12] = sub_25C8CD014;
      v0[13] = &block_descriptor_0;
      v0[14] = v14;
      objc_msgSend(v13, sel_isRecognizeMyVoiceAvailable_, v0 + 10);
      return MEMORY[0x270FA23F0](v0 + 2);
    }
    else
    {
      v0[21] = 0;
      uint64_t v16 = (void *)swift_task_alloc();
      v0[22] = v16;
      *uint64_t v16 = v0;
      v16[1] = sub_25C8CCEDC;
      return sub_25C8CDFBC();
    }
  }
}

uint64_t sub_25C8CCC10()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v2 = v1;
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  swift_task_dealloc();
  os_log_type_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

uint64_t sub_25C8CCD24()
{
  OUTLINED_FUNCTION_6_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v2 = v1;
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25C8CCDF4()
{
  OUTLINED_FUNCTION_6_1();
  uint64_t v1 = *(void **)(v0 + 160);
  if (*(unsigned char *)(v0 + 192))
  {
    type metadata accessor for UserIdentifyIdentityResolutionResult();
    static UserIdentifyIdentityResolutionResult.unsupported(forReason:)(4);

    swift_task_dealloc();
    uint64_t v2 = OUTLINED_FUNCTION_4_5();
    return v3(v2);
  }
  else
  {
    *(void *)(v0 + 168) = v1;
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v0 + 176) = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_25C8CCEDC;
    return sub_25C8CDFBC();
  }
}

uint64_t sub_25C8CCEDC()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  *(void *)(v1 + 18sub_25C8B55A0(4, 3, 2, 4) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v2, v3, v4);
}

uint64_t sub_25C8CCFB0()
{
  OUTLINED_FUNCTION_6_1();

  swift_task_dealloc();
  uint64_t v1 = OUTLINED_FUNCTION_4_5();
  return v2(v1);
}

uint64_t sub_25C8CD014(uint64_t a1, char a2)
{
  return sub_25C8CD01C(*(void *)(a1 + 32), a2);
}

uint64_t sub_25C8CD01C(uint64_t a1, char a2)
{
  **(unsigned char **)(*(void *)(a1 + 64) + 40) = a2;
  return MEMORY[0x270FA2400]();
}

uint64_t sub_25C8CD05C(void *a1, void *aBlock, void *a3)
{
  void v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  a3;
  uint64_t v7 = (void *)swift_task_alloc();
  v3[5] = v7;
  void *v7 = v3;
  v7[1] = sub_25C8CD118;
  return IdentifyUserIntentHandler.resolveIdentity(for:)();
}

uint64_t sub_25C8CD118()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_2_1();
  uint64_t v4 = (void (**)(void, void))v3[4];
  uint64_t v5 = (void *)v3[3];
  id v6 = (void *)v3[2];
  uint64_t v7 = *v0;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v8 = v7;
  swift_task_dealloc();

  ((void (**)(void, void *))v4)[2](v4, v2);
  _Block_release(v4);

  uint64_t v9 = *(uint64_t (**)(void))(v7 + 8);
  return v9();
}

uint64_t IdentifyUserIntentHandler.confirm(intent:)()
{
  OUTLINED_FUNCTION_6_1();
  uint64_t v1 = sub_25C8EC0F0();
  v0[2] = v1;
  OUTLINED_FUNCTION_1_2(v1);
  v0[3] = v2;
  v0[4] = OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25C8CD2D4()
{
  OUTLINED_FUNCTION_12_1();
  if (qword_26A5D95B8 != -1) {
    uint64_t v0 = swift_once();
  }
  uint64_t v1 = OUTLINED_FUNCTION_16_3(v0, (uint64_t)qword_26A5DD5D0);
  v2(v1);
  uint64_t v3 = (void *)sub_25C8EC0D0();
  os_log_type_t v4 = sub_25C8EC2D0();
  if (OUTLINED_FUNCTION_23(v4))
  {
    uint64_t v5 = (_WORD *)OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_27(v5);
    OUTLINED_FUNCTION_21(&dword_25C89B000, v6, v7, "IdentifyUserIntentHandler.confirm");
    OUTLINED_FUNCTION_4_8();
  }

  uint64_t v8 = OUTLINED_FUNCTION_7_3();
  v9(v8);
  id v10 = objc_allocWithZone((Class)type metadata accessor for UserIdentifyIntentResponse());
  UserIdentifyIntentResponse.init(code:userActivity:)(1, 0);
  swift_task_dealloc();
  uint64_t v11 = OUTLINED_FUNCTION_4_5();
  return v12(v11);
}

uint64_t sub_25C8CD408(void *a1, void *aBlock, void *a3)
{
  void v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  id v7 = a3;
  uint64_t v8 = (void *)swift_task_alloc();
  v3[5] = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_25C8CE81C;
  return IdentifyUserIntentHandler.confirm(intent:)();
}

uint64_t IdentifyUserIntentHandler.handle(intent:)()
{
  OUTLINED_FUNCTION_6_1();
  uint64_t v1 = sub_25C8EC0F0();
  v0[2] = v1;
  OUTLINED_FUNCTION_1_2(v1);
  v0[3] = v2;
  v0[4] = OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25C8CD548()
{
  OUTLINED_FUNCTION_12_1();
  if (qword_26A5D95A8 != -1) {
    uint64_t v0 = swift_once();
  }
  uint64_t v1 = OUTLINED_FUNCTION_16_3(v0, (uint64_t)qword_26A5DD5A0);
  v2(v1);
  uint64_t v3 = (void *)sub_25C8EC0D0();
  os_log_type_t v4 = sub_25C8EC2D0();
  if (OUTLINED_FUNCTION_23(v4))
  {
    uint64_t v5 = (_WORD *)OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_27(v5);
    OUTLINED_FUNCTION_21(&dword_25C89B000, v6, v7, "IdentifyUserIntentHandler.handle");
    OUTLINED_FUNCTION_4_8();
  }

  uint64_t v8 = OUTLINED_FUNCTION_7_3();
  v9(v8);
  id v10 = objc_allocWithZone((Class)type metadata accessor for UserIdentifyIntentResponse());
  UserIdentifyIntentResponse.init(code:userActivity:)(4, 0);
  swift_task_dealloc();
  uint64_t v11 = OUTLINED_FUNCTION_4_5();
  return v12(v11);
}

uint64_t sub_25C8CD67C(void *a1, int a2, void *a3, void *aBlock, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = _Block_copy(aBlock);
  id v10 = (void *)swift_allocObject();
  _OWORD v10[2] = a3;
  v10[3] = v9;
  v10[4] = a1;
  id v11 = a3;
  id v12 = a1;
  return sub_25C8DEFB8(a6, (uint64_t)v10);
}

uint64_t sub_25C8CD700(void *a1, void *aBlock, void *a3)
{
  void v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  id v7 = a3;
  uint64_t v8 = (void *)swift_task_alloc();
  v3[5] = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_25C8CE81C;
  return IdentifyUserIntentHandler.handle(intent:)();
}

uint64_t sub_25C8CD7B8()
{
  OUTLINED_FUNCTION_6_1();
  sub_25C8EBFC0();
  v0[2] = OUTLINED_FUNCTION_13();
  uint64_t v1 = sub_25C8EB5A0();
  v0[3] = v1;
  OUTLINED_FUNCTION_1_2(v1);
  v0[4] = v2;
  v0[5] = OUTLINED_FUNCTION_11_1();
  v0[6] = swift_task_alloc();
  uint64_t v3 = sub_25C8EB5D0();
  v0[7] = v3;
  OUTLINED_FUNCTION_1_2(v3);
  v0[8] = v4;
  v0[9] = OUTLINED_FUNCTION_13();
  uint64_t v5 = sub_25C8EC0F0();
  v0[10] = v5;
  OUTLINED_FUNCTION_1_2(v5);
  v0[11] = v6;
  v0[12] = OUTLINED_FUNCTION_11_1();
  v0[13] = swift_task_alloc();
  v0[14] = swift_task_alloc();
  v0[15] = swift_task_alloc();
  v0[16] = swift_task_alloc();
  v0[17] = swift_task_alloc();
  v0[18] = swift_task_alloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C8CD918()
{
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[18];
  uint64_t v2 = v0[10];
  uint64_t v3 = v0[11];
  uint64_t v4 = __swift_project_value_buffer(v2, (uint64_t)qword_26A5DD5A0);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v5(v1, v4, v2);
  uint64_t v6 = sub_25C8EC0D0();
  os_log_type_t v7 = sub_25C8EC2D0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (_WORD *)OUTLINED_FUNCTION_5_0();
    *uint64_t v8 = 0;
    OUTLINED_FUNCTION_49(&dword_25C89B000, v9, v10, "IdentifyUserIntentHandler.resolveDeviceHasMultiUserEnabled");
    MEMORY[0x261198330](v8, -1, -1);
  }
  uint64_t v11 = v0[18];
  uint64_t v12 = v0[10];
  uint64_t v13 = v0[11];

  uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
  v14(v11, v12);
  sub_25C8EBE50();
  sub_25C8EBE40();
  sub_25C8EBE10();
  swift_release();
  sub_25C8EB7E0();
  swift_release();
  if ((sub_25C8D4B2C() & 1) == 0)
  {
    unint64_t v78 = (void (*)(uint64_t))v14;
    if ((sub_25C8D4C40() & 1) == 0)
    {
      uint64_t v40 = v0[5];
      uint64_t v39 = v0[6];
      uint64_t v41 = v0[3];
      uint64_t v42 = v0[4];
      sub_25C8EB5B0();
      sub_25C8EB580();
      char v43 = sub_25C8EB550();
      uint64_t v44 = *(void (**)(uint64_t, uint64_t))(v42 + 8);
      v44(v40, v41);
      v44(v39, v41);
      if (v43)
      {
        uint64_t v45 = OUTLINED_FUNCTION_5_6();
        ((void (*)(uint64_t))v5)(v45);
        uint64_t v46 = (void *)sub_25C8EC0D0();
        os_log_type_t v47 = sub_25C8EC2D0();
        if (OUTLINED_FUNCTION_23(v47))
        {
          uint64_t v48 = (_WORD *)OUTLINED_FUNCTION_5_0();
          OUTLINED_FUNCTION_27(v48);
          OUTLINED_FUNCTION_21(&dword_25C89B000, v49, v50, "User Ambiguous");
          OUTLINED_FUNCTION_4_8();
        }

        uint64_t v51 = OUTLINED_FUNCTION_7_3();
        v78(v51);
        type metadata accessor for UserIdentifyIdentityResolutionResult();
        uint64_t v52 = 2;
        goto LABEL_24;
      }
      uint64_t v53 = OUTLINED_FUNCTION_5_6();
      ((void (*)(uint64_t))v5)(v53);
      uint64_t v54 = (void *)sub_25C8EC0D0();
      os_log_type_t v55 = sub_25C8EC2D0();
      if (OUTLINED_FUNCTION_23(v55))
      {
        id v56 = (_WORD *)OUTLINED_FUNCTION_5_0();
        OUTLINED_FUNCTION_27(v56);
        OUTLINED_FUNCTION_21(&dword_25C89B000, v57, v58, "User Unrecognized");
        OUTLINED_FUNCTION_4_8();
      }
      uint64_t v59 = v0[13];
      uint64_t v60 = v0[10];

      ((void (*)(uint64_t, uint64_t))v78)(v59, v60);
      goto LABEL_23;
    }
    uint64_t v22 = OUTLINED_FUNCTION_5_6();
    ((void (*)(uint64_t))v5)(v22);
    char v23 = sub_25C8EC0D0();
    os_log_type_t v24 = sub_25C8EC2D0();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)OUTLINED_FUNCTION_5_0();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_25C89B000, v23, v24, "User Identified", v25, 2u);
      MEMORY[0x261198330](v25, -1, -1);
    }
    uint64_t v26 = v0[17];
    uint64_t v27 = v0[10];

    ((void (*)(uint64_t, uint64_t))v78)(v26, v27);
    uint64_t v28 = (void *)sub_25C8EB5C0();

    uint64_t v29 = sub_25C8EB5C0();
    if (v29)
    {
      uint64_t v30 = (void *)v29;
      char v31 = sub_25C8E35E0();

      if (v28)
      {
        if ((v31 & 1) == 0)
        {
          uint64_t v33 = v0[5];
          uint64_t v32 = v0[6];
          uint64_t v35 = v0[3];
          uint64_t v34 = v0[4];
          uint64_t v36 = v0[2];
          sub_25C8EBE40();
          sub_25C8EBE10();
          swift_release();
          sub_25C8EB800();
          swift_release();
          sub_25C8EB5B0();
          sub_25C8EB590();
          sub_25C8EB550();
          unint64_t v37 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
          v37(v33, v35);
          v37(v32, v35);
          type metadata accessor for Identity();
          sub_25C8EBE40();
          sub_25C8EBE20();
          swift_release();
          sub_25C8EBF90();
          swift_release();
          sub_25C8EBFB0();
          sub_25C8CE7C0(v36);
          id v38 = sub_25C89ECFC();
          type metadata accessor for UserIdentifyIdentityResolutionResult();
          id v77 = static IdentityResolutionResult.success(with:)((uint64_t)v38);

          goto LABEL_25;
        }
        goto LABEL_29;
      }
    }
    else if (v28)
    {
LABEL_29:
      uint64_t v63 = OUTLINED_FUNCTION_5_6();
      ((void (*)(uint64_t))v5)(v63);
      uint64_t v64 = (void *)sub_25C8EC0D0();
      os_log_type_t v65 = sub_25C8EC2D0();
      if (OUTLINED_FUNCTION_23(v65))
      {
        uint64_t v66 = (_WORD *)OUTLINED_FUNCTION_5_0();
        OUTLINED_FUNCTION_27(v66);
        OUTLINED_FUNCTION_21(&dword_25C89B000, v67, v68, "Partial MeCard");
        OUTLINED_FUNCTION_4_8();
      }

      uint64_t v69 = OUTLINED_FUNCTION_16_4();
      v78(v69);
      type metadata accessor for UserIdentifyIdentityResolutionResult();
      uint64_t v52 = 5;
      goto LABEL_24;
    }
    uint64_t v70 = OUTLINED_FUNCTION_5_6();
    ((void (*)(uint64_t))v5)(v70);
    unint64_t v71 = (void *)sub_25C8EC0D0();
    os_log_type_t v72 = sub_25C8EC2D0();
    if (OUTLINED_FUNCTION_23(v72))
    {
      uint64_t v73 = (_WORD *)OUTLINED_FUNCTION_5_0();
      OUTLINED_FUNCTION_27(v73);
      OUTLINED_FUNCTION_21(&dword_25C89B000, v74, v75, "Missing MeCard");
      OUTLINED_FUNCTION_4_8();
    }

    uint64_t v76 = OUTLINED_FUNCTION_16_4();
    v78(v76);
    type metadata accessor for UserIdentifyIdentityResolutionResult();
    uint64_t v52 = 7;
    goto LABEL_24;
  }
  uint64_t v15 = OUTLINED_FUNCTION_5_6();
  ((void (*)(uint64_t))v5)(v15);
  uint64_t v16 = (void *)sub_25C8EC0D0();
  os_log_type_t v17 = sub_25C8EC2D0();
  if (OUTLINED_FUNCTION_23(v17))
  {
    uint64_t v18 = (_WORD *)OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_27(v18);
    OUTLINED_FUNCTION_21(&dword_25C89B000, v19, v20, "Unknown User won't be recognized. Bailing out");
    OUTLINED_FUNCTION_4_8();
  }

  uint64_t v21 = OUTLINED_FUNCTION_16_4();
  ((void (*)(uint64_t))v14)(v21);
LABEL_23:
  type metadata accessor for UserIdentifyIdentityResolutionResult();
  uint64_t v52 = 3;
LABEL_24:
  id v77 = static UserIdentifyIdentityResolutionResult.unsupported(forReason:)(v52);
LABEL_25:
  (*(void (**)(void, void))(v0[8] + 8))(v0[9], v0[7]);
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
  swift_task_dealloc();
  uint64_t v61 = (uint64_t (*)(id))v0[1];
  return v61(v77);
}

uint64_t sub_25C8CDFBC()
{
  OUTLINED_FUNCTION_6_1();
  uint64_t v1 = sub_25C8EC0F0();
  v0[2] = v1;
  OUTLINED_FUNCTION_1_2(v1);
  v0[3] = v2;
  v0[4] = OUTLINED_FUNCTION_11_1();
  v0[5] = swift_task_alloc();
  v0[6] = swift_task_alloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25C8CE05C()
{
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[6];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = __swift_project_value_buffer(v2, (uint64_t)qword_26A5DD5A0);
  v0[7] = v4;
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[8] = v5;
  v0[9] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v1, v4, v2);
  uint64_t v6 = (void *)sub_25C8EC0D0();
  os_log_type_t v7 = sub_25C8EC2D0();
  if (OUTLINED_FUNCTION_23(v7))
  {
    uint64_t v8 = (_WORD *)OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_27(v8);
    OUTLINED_FUNCTION_21(&dword_25C89B000, v9, v10, "IdentifyUserIntentHandler.resolveDeviceNotSupportingMultiUser");
    OUTLINED_FUNCTION_4_8();
  }
  uint64_t v11 = v0[3];

  v0[10] = *(void *)(v11 + 8);
  v0[11] = (v11 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  uint64_t v12 = OUTLINED_FUNCTION_7_3();
  v13(v12);
  sub_25C8EB410();
  sub_25C8EB7A0();
  swift_allocObject();
  v0[12] = sub_25C8EB790();
  uint64_t v16 = (uint64_t (*)(void))((int)*MEMORY[0x263F6FCB8] + MEMORY[0x263F6FCB8]);
  uint64_t v14 = (void *)swift_task_alloc();
  v0[13] = v14;
  *uint64_t v14 = v0;
  v14[1] = sub_25C8CE208;
  return v16();
}

uint64_t sub_25C8CE208()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v2 = v1;
  *(void *)(v4 + 11sub_25C8B55A0(4, 3, 2, 2) = v3;
  swift_task_dealloc();
  swift_release();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_25C8CE2F4()
{
  uint64_t v1 = *(void **)(v0 + 112);
  if (v1)
  {
    if (sub_25C8E35E0())
    {
      (*(void (**)(void, void, void))(v0 + 64))(*(void *)(v0 + 40), *(void *)(v0 + 56), *(void *)(v0 + 16));
      uint64_t v2 = sub_25C8EC0D0();
      os_log_type_t v3 = sub_25C8EC2D0();
      if (os_log_type_enabled(v2, v3))
      {
        uint64_t v4 = (_WORD *)OUTLINED_FUNCTION_5_0();
        *uint64_t v4 = 0;
        OUTLINED_FUNCTION_49(&dword_25C89B000, v5, v6, "Partial MeCard");
        MEMORY[0x261198330](v4, -1, -1);
      }
      uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v0 + 80);
      uint64_t v8 = *(void *)(v0 + 40);
      uint64_t v9 = *(void *)(v0 + 16);

      v7(v8, v9);
      type metadata accessor for UserIdentifyIdentityResolutionResult();
      static UserIdentifyIdentityResolutionResult.unsupported(forReason:)(5);
    }
    else
    {
      type metadata accessor for Identity();
      id v18 = sub_25C89ECFC();
      type metadata accessor for UserIdentifyIdentityResolutionResult();
      static IdentityResolutionResult.success(with:)((uint64_t)v18);
    }
  }
  else
  {
    (*(void (**)(void, void, void))(v0 + 64))(*(void *)(v0 + 32), *(void *)(v0 + 56), *(void *)(v0 + 16));
    uint64_t v10 = (void *)sub_25C8EC0D0();
    os_log_type_t v11 = sub_25C8EC2D0();
    if (OUTLINED_FUNCTION_23(v11))
    {
      uint64_t v12 = (_WORD *)OUTLINED_FUNCTION_5_0();
      OUTLINED_FUNCTION_27(v12);
      OUTLINED_FUNCTION_21(&dword_25C89B000, v13, v14, "User Unknown");
      OUTLINED_FUNCTION_4_8();
    }
    uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v0 + 80);
    uint64_t v16 = *(void *)(v0 + 32);
    uint64_t v17 = *(void *)(v0 + 16);

    v15(v16, v17);
    type metadata accessor for UserIdentifyIdentityResolutionResult();
    static UserIdentifyIdentityResolutionResult.unsupported(forReason:)(8);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v19 = OUTLINED_FUNCTION_4_5();
  return v20(v19);
}

id IdentifyUserIntentHandler.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IdentifyUserIntentHandler();
  return objc_msgSendSuper2(&v2, sel_init);
}

id IdentifyUserIntentHandler.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IdentifyUserIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_25C8CE57C()
{
  unint64_t result = qword_26A5DA200;
  if (!qword_26A5DA200)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_26A5DA200);
  }
  return result;
}

uint64_t type metadata accessor for IdentifyUserIntentHandler()
{
  return self;
}

uint64_t sub_25C8CE5E4()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C8AC380;
  uint64_t v2 = OUTLINED_FUNCTION_18_2();
  return v3(v2);
}

uint64_t sub_25C8CE684()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C8AC380;
  uint64_t v2 = OUTLINED_FUNCTION_18_2();
  return v3(v2);
}

uint64_t sub_25C8CE724()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C8ABDDC;
  uint64_t v2 = OUTLINED_FUNCTION_18_2();
  return v3(v2);
}

uint64_t sub_25C8CE7C0(uint64_t a1)
{
  uint64_t v2 = sub_25C8EBFC0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void OUTLINED_FUNCTION_4_8()
{
  JUMPOUT(0x261198330);
}

uint64_t OUTLINED_FUNCTION_5_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_16_4()
{
  return v0;
}

uint64_t sub_25C8CE878()
{
  return sub_25C8CE884(qword_26A5DD560);
}

uint64_t sub_25C8CE884@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Signpost.OpenSignpost();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A5D9538 != -1) {
    swift_once();
  }
  id v5 = (id)qword_26A5D9BE0;
  sub_25C8EC0B0();
  sub_25C8EC310();
  sub_25C8EC090();
  uint64_t v6 = &v4[*(int *)(v2 + 20)];
  *(void *)uint64_t v6 = "AccountServicesInstanceCreation";
  *((void *)v6 + 1) = 31;
  *((_WORD *)v6 + 8) = 258;
  uint64_t v7 = type metadata accessor for AccountServicesNoOp();
  uint64_t v8 = swift_allocObject();
  a1[3] = v7;
  a1[4] = (uint64_t)&off_2709F0110;
  *a1 = v8;
  sub_25C8EC300();
  sub_25C8EC0A0();
  return sub_25C89E920((uint64_t)v4);
}

uint64_t type metadata accessor for AccountServicesNoOp()
{
  return self;
}

BOOL static Proximity.< infix(_:_:)()
{
  uint64_t v0 = sub_25C8EC080();
  return sub_25C8EC080() < v0;
}

unint64_t sub_25C8CEA74()
{
  unint64_t result = qword_26A5DA258;
  if (!qword_26A5DA258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A5DA258);
  }
  return result;
}

BOOL sub_25C8CEAC0()
{
  return static Proximity.< infix(_:_:)();
}

BOOL sub_25C8CEACC()
{
  return sub_25C8CEAD8();
}

BOOL sub_25C8CEAD8()
{
  uint64_t v0 = sub_25C8EC080();
  return sub_25C8EC080() >= v0;
}

BOOL sub_25C8CEB14()
{
  return sub_25C8CEB20();
}

BOOL sub_25C8CEB20()
{
  uint64_t v0 = sub_25C8EC080();
  return sub_25C8EC080() >= v0;
}

BOOL sub_25C8CEB58()
{
  return sub_25C8CEB64();
}

BOOL sub_25C8CEB64()
{
  uint64_t v0 = sub_25C8EC080();
  return sub_25C8EC080() < v0;
}

uint64_t sub_25C8CEBA4(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_25C8EB350();
  OUTLINED_FUNCTION_0_2();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25C8EC0F0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_4_1();
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  uint64_t v14 = __swift_project_value_buffer(v10, (uint64_t)qword_26A5DD5A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v2, v14, v10);
  uint64_t v15 = sub_25C8EC0D0();
  os_log_type_t v16 = sub_25C8EC2D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)OUTLINED_FUNCTION_5_0();
    uint64_t v23 = v6;
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_25C89B000, v15, v16, "IdentifyUserIntentExecutionBehaviorStrategy.makeIntentExecutionBehavior", v17, 2u);
    uint64_t v6 = v23;
    OUTLINED_FUNCTION_3();
  }

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v2, v10);
  sub_25C8EB3D0();
  id v18 = objc_allocWithZone((Class)type metadata accessor for IdentifyUserIntentHandler());
  swift_retain();
  objc_msgSend(v18, sel_init);
  type metadata accessor for UserIdentifyIntent();
  id v19 = a2;
  sub_25C8EB340();
  uint64_t v20 = sub_25C8EB3C0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v4);
  return v20;
}

uint64_t sub_25C8CEDFC()
{
  uint64_t v1 = sub_25C8EC0F0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_4_1();
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v1, (uint64_t)qword_26A5DD5A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v0, v5, v1);
  uint64_t v6 = sub_25C8EC0D0();
  os_log_type_t v7 = sub_25C8EC2D0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)OUTLINED_FUNCTION_5_0();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_25C89B000, v6, v7, "IdentifyUserFlowStrategy.actionForInput() called", v8, 2u);
    OUTLINED_FUNCTION_3();
  }

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  return sub_25C8EB500();
}

uint64_t sub_25C8CEF54(uint64_t a1)
{
  v1[13] = a1;
  uint64_t v2 = sub_25C8EB950();
  v1[14] = v2;
  OUTLINED_FUNCTION_1_2(v2);
  v1[15] = v3;
  v1[16] = swift_task_alloc();
  v1[17] = swift_task_alloc();
  uint64_t v4 = sub_25C8EC0F0();
  v1[18] = v4;
  OUTLINED_FUNCTION_1_2(v4);
  v1[19] = v5;
  v1[20] = swift_task_alloc();
  v1[21] = swift_task_alloc();
  v1[22] = swift_task_alloc();
  v1[23] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C8CF060, 0, 0);
}

uint64_t sub_25C8CF060()
{
  uint64_t v55 = v0;
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 152);
  __swift_project_value_buffer(*(void *)(v0 + 144), (uint64_t)qword_26A5DD5A0);
  uint64_t v52 = *(void (**)(void))(v1 + 16);
  OUTLINED_FUNCTION_6_0();
  v2();
  uint64_t v3 = sub_25C8EC0D0();
  os_log_type_t v4 = sub_25C8EC2D0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)OUTLINED_FUNCTION_5_0();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_25C89B000, v3, v4, "IdentifyUserFlowStrategy.makeIntentFromParse() called", v5, 2u);
    OUTLINED_FUNCTION_3();
  }
  uint64_t v6 = *(void *)(v0 + 184);
  uint64_t v7 = *(void *)(v0 + 144);
  uint64_t v8 = *(void *)(v0 + 152);

  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v9(v6, v7);
  sub_25C8C93E8(v0 + 56);
  if (!*(void *)(v0 + 80))
  {
    uint64_t v51 = v9;
    uint64_t v24 = *(void *)(v0 + 136);
    uint64_t v26 = *(void *)(v0 + 112);
    uint64_t v25 = *(void *)(v0 + 120);
    uint64_t v27 = *(void *)(v0 + 104);
    sub_25C8A41E8(v0 + 56);
    OUTLINED_FUNCTION_6_0();
    v28();
    uint64_t v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16);
    v29(v24, v27, v26);
    uint64_t v30 = sub_25C8EC0D0();
    os_log_type_t v31 = sub_25C8EC2E0();
    BOOL v32 = os_log_type_enabled(v30, v31);
    uint64_t v33 = *(void *)(v0 + 160);
    uint64_t v35 = *(void *)(v0 + 136);
    uint64_t v34 = *(void *)(v0 + 144);
    if (v32)
    {
      uint64_t v53 = *(void *)(v0 + 160);
      log = v30;
      uint64_t v37 = *(void *)(v0 + 120);
      uint64_t v36 = *(void *)(v0 + 128);
      os_log_type_t type = v31;
      uint64_t v38 = *(void *)(v0 + 112);
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      *(_DWORD *)uint64_t v39 = 136315138;
      v29(v36, v35, v38);
      uint64_t v40 = sub_25C8EC180();
      *(void *)(v0 + 96) = sub_25C8BB4F0(v40, v41, &v54);
      sub_25C8EC360();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v35, v38);
      _os_log_impl(&dword_25C89B000, log, type, "Unable to make intent from parse %s", v39, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();

      uint64_t v43 = v34;
      uint64_t v42 = v53;
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 120) + 8))(*(void *)(v0 + 136), *(void *)(v0 + 112));

      uint64_t v42 = v33;
      uint64_t v43 = v34;
    }
    v51(v42, v43);
    type metadata accessor for IdentityFlowError();
    swift_allocObject();
    uint64_t v46 = sub_25C8D786C(0);
    sub_25C8CFD80((unint64_t *)&qword_26A5D9FA0, 255, (void (*)(uint64_t))type metadata accessor for IdentityFlowError);
    swift_allocError();
    *os_log_type_t v47 = v46;
    swift_willThrow();
LABEL_19:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v48 = *(uint64_t (**)(void))(v0 + 8);
    return v48();
  }
  sub_25C8A4290((long long *)(v0 + 56), v0 + 16);
  type metadata accessor for UserIdentifyIntent();
  id v10 = sub_25C8B4A6C((void *)(v0 + 16));
  OUTLINED_FUNCTION_6_0();
  v52();
  uint64_t v11 = sub_25C8EC0D0();
  os_log_type_t v12 = sub_25C8EC2D0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)OUTLINED_FUNCTION_5_0();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_25C89B000, v11, v12, "Finished creating intent from parse", v13, 2u);
    OUTLINED_FUNCTION_3();
  }
  uint64_t v14 = *(void *)(v0 + 176);
  uint64_t v15 = *(void *)(v0 + 144);

  v9(v14, v15);
  if (objc_msgSend(v10, sel_caseType) == (id)4)
  {
    os_log_type_t v16 = v9;
    OUTLINED_FUNCTION_6_0();
    v52();
    uint64_t v17 = sub_25C8EC0D0();
    os_log_type_t v18 = sub_25C8EC2E0();
    if (os_log_type_enabled(v17, v18))
    {
      id v19 = (uint8_t *)OUTLINED_FUNCTION_5_0();
      *(_WORD *)id v19 = 0;
      _os_log_impl(&dword_25C89B000, v17, v18, "Unsupported Intent Case Type", v19, 2u);
      OUTLINED_FUNCTION_3();
    }
    uint64_t v20 = *(void *)(v0 + 168);
    uint64_t v21 = *(void *)(v0 + 144);

    v16(v20, v21);
    type metadata accessor for IdentityFlowError();
    swift_allocObject();
    uint64_t v22 = sub_25C8D786C(0);
    sub_25C8CFD80((unint64_t *)&qword_26A5D9FA0, 255, (void (*)(uint64_t))type metadata accessor for IdentityFlowError);
    swift_allocError();
    *uint64_t v23 = v22;
    swift_willThrow();

    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    goto LABEL_19;
  }
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v44 = *(uint64_t (**)(id))(v0 + 8);
  return v44(v10);
}

uint64_t type metadata accessor for IdentifyUserFlowStrategy()
{
  return self;
}

uint64_t sub_25C8CF710()
{
  return sub_25C8CEDFC();
}

uint64_t sub_25C8CF728(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25C8A3748;
  return sub_25C8CEF54(a1);
}

uint64_t sub_25C8CF7BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for IdentifyUserFlowStrategy();
  return MEMORY[0x270F67C20](a1, v5, a3);
}

uint64_t sub_25C8CF808(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  uint64_t v11 = type metadata accessor for IdentifyUserFlowStrategy();
  *id v10 = v5;
  v10[1] = sub_25C8A42F8;
  return MEMORY[0x270F66498](a1, a2, a3, v11, a5);
}

uint64_t sub_25C8CF8D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  uint64_t v11 = type metadata accessor for IdentifyUserFlowStrategy();
  *id v10 = v5;
  v10[1] = sub_25C8A42F8;
  return MEMORY[0x270F66490](a1, a2, a3, v11, a5);
}

uint64_t sub_25C8CF9A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  uint64_t v11 = type metadata accessor for IdentifyUserFlowStrategy();
  *id v10 = v5;
  v10[1] = sub_25C8A42F8;
  return MEMORY[0x270F66488](a1, a2, a3, v11, a5);
}

uint64_t sub_25C8CFA6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  os_log_type_t v12 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v12;
  uint64_t v13 = type metadata accessor for IdentifyUserFlowStrategy();
  *os_log_type_t v12 = v6;
  v12[1] = sub_25C8A3ED0;
  return MEMORY[0x270F66480](a1, a2, a3, a4, v13, a6);
}

uint64_t sub_25C8CFB48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  os_log_type_t v12 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v12;
  uint64_t v13 = type metadata accessor for IdentifyUserFlowStrategy();
  *os_log_type_t v12 = v6;
  v12[1] = sub_25C8A42F8;
  return MEMORY[0x270F66790](a1, a2, a3, a4, v13, a6);
}

uint64_t sub_25C8CFC24(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_25C8CEBA4(a1, a2);
  os_log_type_t v4 = *(uint64_t (**)(uint64_t))(v2 + 8);
  return sub_25C8A41D8(v4, v2, v3);
}

uint64_t sub_25C8CFCA8(uint64_t a1, uint64_t a2)
{
  return sub_25C8CFD80(&qword_26A5DA278, a2, (void (*)(uint64_t))type metadata accessor for IdentifyUserFlowStrategy);
}

uint64_t sub_25C8CFCF0(uint64_t a1, uint64_t a2)
{
  return sub_25C8CFD80(qword_26A5DA280, a2, (void (*)(uint64_t))type metadata accessor for IdentifyUserFlowStrategy);
}

uint64_t sub_25C8CFD38(uint64_t a1, uint64_t a2)
{
  return sub_25C8CFD80(qword_26A5DA2A8, a2, (void (*)(uint64_t))type metadata accessor for IdentifyUserFlowStrategy);
}

uint64_t sub_25C8CFD80(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

id sub_25C8CFDC8()
{
  type metadata accessor for BaseDialogProvider();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_26A5DA2C0 = (uint64_t)result;
  return result;
}

uint64_t sub_25C8CFE1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *v4;
  v5[8] = a4;
  v5[9] = v6;
  v5[6] = a2;
  v5[7] = a3;
  v5[5] = a1;
  uint64_t v7 = sub_25C8EC0F0();
  v5[10] = v7;
  v5[11] = *(void *)(v7 - 8);
  v5[12] = swift_task_alloc();
  v5[13] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C8CFF18, 0, 0);
}

uint64_t sub_25C8CFF18()
{
  uint64_t v25 = v0;
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[13];
  uint64_t v2 = v0[10];
  uint64_t v3 = v0[11];
  uint64_t v4 = __swift_project_value_buffer(v2, (uint64_t)qword_26A5DD5A0);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[14] = v5;
  v0[15] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v1, v4, v2);
  swift_bridgeObjectRetain_n();
  uint64_t v6 = sub_25C8EC0D0();
  os_log_type_t v7 = sub_25C8EC2D0();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = v0[13];
  uint64_t v10 = v0[10];
  uint64_t v11 = v0[11];
  unint64_t v12 = v0[7];
  if (v8)
  {
    uint64_t v13 = v0[6];
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 136315138;
    swift_bridgeObjectRetain();
    v0[4] = sub_25C8BB4F0(v13, v12, &v24);
    sub_25C8EC360();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25C89B000, v6, v7, "SiriIdentity CAT: %s", v14, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();

    uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v15(v9, v10);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v15(v9, v10);
  }
  v0[16] = v15;
  uint64_t v16 = v0[9];
  uint64_t v17 = v0[6];
  uint64_t v18 = swift_task_alloc();
  v0[17] = v18;
  long long v19 = *(_OWORD *)(v0 + 7);
  *(void *)(v18 + 16) = v17;
  *(_OWORD *)(v18 + 2sub_25C8B55A0(4, 3, 2, 4) = v19;
  *(void *)(v18 + 40) = v16;
  uint64_t v20 = (void *)swift_task_alloc();
  v0[18] = v20;
  uint64_t v21 = sub_25C8EB740();
  *uint64_t v20 = v0;
  v20[1] = sub_25C8D01FC;
  uint64_t v22 = v0[5];
  return MEMORY[0x270FA2360](v22, 0, 0, 0xD000000000000016, 0x800000025C8F13D0, sub_25C8D09FC, v18, v21);
}

uint64_t sub_25C8D01FC()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 15sub_25C8B55A0(4, 3, 2, 2) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_25C8D0350, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_25C8D0350()
{
  uint64_t v23 = v0;
  swift_task_dealloc();
  if (qword_26A5D95A0 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[19];
  uint64_t v2 = (void (*)(uint64_t, uint64_t, uint64_t))v0[14];
  uint64_t v3 = v0[12];
  uint64_t v4 = v0[10];
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_26A5DD588);
  v2(v3, v5, v4);
  id v6 = v1;
  id v7 = v1;
  BOOL v8 = sub_25C8EC0D0();
  os_log_type_t v9 = sub_25C8EC2E0();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v11 = (void *)v0[19];
  unint64_t v12 = (void (*)(uint64_t, uint64_t))v0[16];
  uint64_t v13 = v0[12];
  uint64_t v14 = v0[10];
  if (v10)
  {
    uint64_t v21 = (void (*)(uint64_t, uint64_t))v0[16];
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 136315138;
    v0[2] = v11;
    id v16 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D96D0);
    uint64_t v17 = sub_25C8EC180();
    v0[3] = sub_25C8BB4F0(v17, v18, &v22);
    sub_25C8EC360();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25C89B000, v8, v9, "Error while executing dialog: %s", v15, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();

    v21(v13, v14);
  }
  else
  {

    v12(v13, v14);
  }
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  long long v19 = (uint64_t (*)(void))v0[1];
  return v19();
}

uint64_t sub_25C8D05E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = a3;
  uint64_t v19 = a4;
  uint64_t v16 = a1;
  uint64_t v17 = a2;
  uint64_t v20 = sub_25C8EBF00();
  uint64_t v4 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  id v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA2D0);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7);
  BOOL v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C8EBED0();
  if (qword_26A5D9568 != -1) {
    swift_once();
  }
  sub_25C8EBEB0();
  uint64_t v11 = (void *)sub_25C8EBEA0();
  uint64_t v22 = 0;
  memset(v21, 0, sizeof(v21));
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v16, v7);
  unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v13 + v12, v10, v7);
  sub_25C8EBEF0();
  sub_25C8EBEC0();
  swift_release();

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v20);
  return sub_25C8D0B10((uint64_t)v21);
}

uint64_t sub_25C8D0854(uint64_t a1)
{
  uint64_t v2 = sub_25C8EB740();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA2E0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (void *)((char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_25C8D0B70(a1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10[1] = *v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA2D0);
    return sub_25C8EC280();
  }
  else
  {
    (*(void (**)(char *, void *, uint64_t))(v3 + 32))(v5, v8, v2);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA2D0);
    return sub_25C8EC290();
  }
}

uint64_t type metadata accessor for BaseDialogProvider()
{
  return self;
}

uint64_t sub_25C8D09FC(uint64_t a1)
{
  return sub_25C8D05E0(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_25C8D0A08()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA2D0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_25C8D0A9C(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA2D0);
  return sub_25C8D0854(a1);
}

uint64_t sub_25C8D0B10(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA2D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C8D0B70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA2E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C8D0BD8(uint64_t a1, uint64_t a2)
{
  type metadata accessor for BaseDialogProvider();
  uint64_t v4 = swift_allocObject();
  sub_25C8D2860(a1, (uint64_t)v7);
  uint64_t v5 = sub_25C8D2AA4(v4, (uint64_t)v7, a2);
  sub_25C89F4B0(a1, &qword_26A5D9BD8);
  return v5;
}

uint64_t sub_25C8D0C58()
{
  OUTLINED_FUNCTION_6_1();
  v1[3] = v2;
  v1[4] = v0;
  v1[2] = v3;
  uint64_t v4 = sub_25C8EB740();
  v1[5] = v4;
  OUTLINED_FUNCTION_1_2(v4);
  v1[6] = v5;
  v1[7] = swift_task_alloc();
  v1[8] = swift_task_alloc();
  v1[9] = swift_task_alloc();
  v1[10] = swift_task_alloc();
  v1[11] = swift_task_alloc();
  v1[12] = swift_task_alloc();
  v1[13] = swift_task_alloc();
  uint64_t v6 = sub_25C8EC0F0();
  v1[14] = v6;
  OUTLINED_FUNCTION_1_2(v6);
  v1[15] = v7;
  v1[16] = swift_task_alloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_25C8D0D74()
{
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v0[14], (uint64_t)qword_26A5DD5A0);
  uint64_t v1 = OUTLINED_FUNCTION_19_4();
  v2(v1);
  uint64_t v3 = sub_25C8EC0D0();
  os_log_type_t v4 = sub_25C8EC2D0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (_WORD *)swift_slowAlloc();
    *uint64_t v5 = 0;
    OUTLINED_FUNCTION_21_3(&dword_25C89B000, v6, v7, "IdentifyUserUnsupportedValueFlowStrategy.makeUnsupportedValueOutput");
    MEMORY[0x261198330](v5, -1, -1);
  }

  uint64_t v8 = OUTLINED_FUNCTION_20_3();
  v9(v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA310);
  uint64_t v10 = (void *)sub_25C8EB880();
  id v11 = objc_msgSend(v10, sel_unsupportedReason);

  uint64_t v12 = UserIdentifyIdentityUnsupportedReason.init(rawValue:)((uint64_t)v11);
  if ((v13 & 1) == 0)
  {
    switch(v12)
    {
      case 2:
        OUTLINED_FUNCTION_18_4();
        OUTLINED_FUNCTION_10_3();
        OUTLINED_FUNCTION_20();
        v0[27] = (uint64_t)v14;
        *uint64_t v14 = v15;
        v14[1] = sub_25C8D1C30;
        goto LABEL_26;
      case 3:
        swift_task_alloc();
        OUTLINED_FUNCTION_20();
        v0[29] = (uint64_t)v20;
        *uint64_t v20 = v21;
        v20[1] = sub_25C8D1E54;
        OUTLINED_FUNCTION_17();
        return sub_25C8B3CB4(v22);
      case 4:
        swift_task_alloc();
        OUTLINED_FUNCTION_20();
        v0[23] = (uint64_t)v25;
        *uint64_t v25 = v26;
        v25[1] = sub_25C8D1868;
        OUTLINED_FUNCTION_17();
        return sub_25C8B3DF4(v27);
      case 5:
        swift_task_alloc();
        OUTLINED_FUNCTION_20();
        v0[19] = (uint64_t)v29;
        *uint64_t v29 = v30;
        v29[1] = sub_25C8D1538;
        OUTLINED_FUNCTION_17();
        return sub_25C8B3B84(v31, v32);
      case 6:
        OUTLINED_FUNCTION_18_4();
        OUTLINED_FUNCTION_10_3();
        OUTLINED_FUNCTION_20();
        v0[25] = (uint64_t)v34;
        *uint64_t v34 = v35;
        v34[1] = sub_25C8D19F4;
        goto LABEL_26;
      case 7:
        swift_task_alloc();
        OUTLINED_FUNCTION_20();
        v0[21] = (uint64_t)v36;
        *uint64_t v36 = v37;
        v36[1] = sub_25C8D16C4;
        OUTLINED_FUNCTION_17();
        return sub_25C8B3950(v38, v39);
      case 8:
        OUTLINED_FUNCTION_18_4();
        OUTLINED_FUNCTION_10_3();
        OUTLINED_FUNCTION_20();
        v0[17] = (uint64_t)v41;
        *unint64_t v41 = v42;
        v41[1] = sub_25C8D12FC;
LABEL_26:
        OUTLINED_FUNCTION_17();
        __asm { BR              X3 }
        return result;
      default:
        break;
    }
  }
  type metadata accessor for IdentityFlowError();
  swift_allocObject();
  uint64_t v16 = sub_25C8D786C(3);
  sub_25C8D2810();
  swift_allocError();
  *uint64_t v17 = v16;
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_17();
  __asm { BRAA            X1, X16 }
  return result;
}

uint64_t sub_25C8D12FC()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_4();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v5 = v4;
  *(void *)(v6 + 14sub_25C8B55A0(4, 3, 2, 4) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C8D13D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_11_0();
  v10();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_1_9();
  return v12(v11, v12, v13, v14, v15, v16, v17, v18, a9, a10);
}

uint64_t sub_25C8D14A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_3_5();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1_9();
  return v11(v10, v11, v12, v13, v14, v15, v16, v17, a9, a10);
}

uint64_t sub_25C8D1538()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_4();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v5 = v4;
  *(void *)(v6 + 160) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C8D1614(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_9_5();
  OUTLINED_FUNCTION_11_0();
  v10();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_1_9();
  return v12(v11, v12, v13, v14, v15, v16, v17, v18, a9, a10);
}

uint64_t sub_25C8D16C4()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_4();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v5 = v4;
  *(void *)(v6 + 176) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C8D17A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_11_0();
  v10();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_1_9();
  return v12(v11, v12, v13, v14, v15, v16, v17, v18, a9, a10);
}

uint64_t sub_25C8D1868()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_4();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v5 = v4;
  *(void *)(v6 + 19sub_25C8B55A0(4, 3, 2, 2) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C8D1944(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_9_5();
  OUTLINED_FUNCTION_11_0();
  v10();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_1_9();
  return v12(v11, v12, v13, v14, v15, v16, v17, v18, a9, a10);
}

uint64_t sub_25C8D19F4()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_4();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v5 = v4;
  *(void *)(v6 + 208) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C8D1AD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_11_0();
  v10();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_1_9();
  return v12(v11, v12, v13, v14, v15, v16, v17, v18, a9, a10);
}

uint64_t sub_25C8D1B98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_3_5();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1_9();
  return v11(v10, v11, v12, v13, v14, v15, v16, v17, a9, a10);
}

uint64_t sub_25C8D1C30()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_4();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v5 = v4;
  *(void *)(v6 + 22sub_25C8B55A0(4, 3, 2, 4) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C8D1D0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_9_5();
  OUTLINED_FUNCTION_11_0();
  v10();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_1_9();
  return v12(v11, v12, v13, v14, v15, v16, v17, v18, a9, a10);
}

uint64_t sub_25C8D1DBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_3_5();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1_9();
  return v11(v10, v11, v12, v13, v14, v15, v16, v17, a9, a10);
}

uint64_t sub_25C8D1E54()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_4();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v5 = v4;
  *(void *)(v6 + 240) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C8D1F30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_11_0();
  v10();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_1_9();
  return v12(v11, v12, v13, v14, v15, v16, v17, v18, a9, a10);
}

uint64_t sub_25C8D1FF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_3_5();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1_9();
  return v11(v10, v11, v12, v13, v14, v15, v16, v17, a9, a10);
}

uint64_t sub_25C8D2090(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_3_5();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1_9();
  return v11(v10, v11, v12, v13, v14, v15, v16, v17, a9, a10);
}

uint64_t sub_25C8D2128(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_3_5();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1_9();
  return v11(v10, v11, v12, v13, v14, v15, v16, v17, a9, a10);
}

uint64_t sub_25C8D21C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_3_5();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1_9();
  return v11(v10, v11, v12, v13, v14, v15, v16, v17, a9, a10);
}

uint64_t sub_25C8D2258()
{
  OUTLINED_FUNCTION_6_1();
  v0[2] = v1;
  uint64_t v2 = sub_25C8EC0F0();
  v0[3] = v2;
  OUTLINED_FUNCTION_1_2(v2);
  v0[4] = v3;
  v0[5] = swift_task_alloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C8D22EC()
{
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(*(void *)(v0 + 24), (uint64_t)qword_26A5DD5A0);
  uint64_t v1 = OUTLINED_FUNCTION_19_4();
  v2(v1);
  uint64_t v3 = sub_25C8EC0D0();
  os_log_type_t v4 = sub_25C8EC2D0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (_WORD *)swift_slowAlloc();
    *uint64_t v5 = 0;
    OUTLINED_FUNCTION_21_3(&dword_25C89B000, v6, v7, "IdentifyUserUnsupportedValueFlowStrategy.makeUpdatedIntentForUnsupportedValue");
    MEMORY[0x261198330](v5, -1, -1);
  }

  uint64_t v8 = OUTLINED_FUNCTION_20_3();
  v9(v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA310);
  uint64_t v10 = sub_25C8EB870();
  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v11(v10);
}

uint64_t sub_25C8D2434@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9F70);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((void *)(v1 + 112), *(void *)(v1 + 136));
  sub_25C8EB430();
  uint64_t v6 = sub_25C8EB720();
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 1, 1, v6);
  uint64_t v7 = sub_25C8EB9A0();
  memset(v10, 0, sizeof(v10));
  uint64_t v11 = 0;
  uint64_t v8 = MEMORY[0x263F6FFF0];
  a1[3] = v7;
  a1[4] = v8;
  __swift_allocate_boxed_opaque_existential_1Tm(a1);
  sub_25C8EB610();
  sub_25C89F4B0((uint64_t)v10, &qword_26A5D9F80);
  return sub_25C89F4B0((uint64_t)v5, &qword_26A5D9F70);
}

uint64_t sub_25C8D2584()
{
  sub_25C8A8014(v0 + 16);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 112);
  return v0;
}

uint64_t sub_25C8D25B4()
{
  sub_25C8D2584();
  return MEMORY[0x270FA0228](v0, 152, 7);
}

uint64_t type metadata accessor for IdentifyUserUnsupportedValueFlowStrategy()
{
  return self;
}

uint64_t sub_25C8D260C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C8A710C;
  return sub_25C8D0C58();
}

uint64_t sub_25C8D26B8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C8AB010;
  return sub_25C8D2258();
}

uint64_t sub_25C8D274C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for IdentifyUserUnsupportedValueFlowStrategy();
  *uint64_t v8 = v4;
  v8[1] = sub_25C8C41D8;
  return MEMORY[0x270F664F0](a1, a2, v9, a4);
}

unint64_t sub_25C8D2810()
{
  unint64_t result = qword_26A5D9FA0;
  if (!qword_26A5D9FA0)
  {
    type metadata accessor for IdentityFlowError();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5D9FA0);
  }
  return result;
}

uint64_t sub_25C8D2860(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9BD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C8D28C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void v17[3] = type metadata accessor for BaseDialogProvider();
  v17[4] = &off_2709F0150;
  v17[0] = a1;
  sub_25C8A7E98((uint64_t)v17, (uint64_t)&v14);
  sub_25C8D2860(a2, (uint64_t)v13);
  sub_25C8A7E98((uint64_t)&v14, (uint64_t)__src);
  sub_25C8D2860((uint64_t)v13, (uint64_t)&v10);
  if (v11)
  {
    sub_25C89F4B0((uint64_t)v13, &qword_26A5D9BD8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
    sub_25C8A4290(&v10, (uint64_t)v12);
  }
  else
  {
    sub_25C8EB960();
    sub_25C89F4B0((uint64_t)v13, &qword_26A5D9BD8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
    sub_25C89F4B0((uint64_t)&v10, &qword_26A5D9BD8);
  }
  sub_25C8A4290(v12, (uint64_t)&__src[40]);
  sub_25C8A7E98((uint64_t)&__src[40], (uint64_t)v12);
  type metadata accessor for LocUtil();
  uint64_t v8 = swift_allocObject();
  sub_25C8A4290(v12, v8 + 16);
  *(void *)&__src[80] = v8;
  memcpy((void *)(a4 + 16), __src, 0x58uLL);
  if (!a3)
  {
    sub_25C8EBE50();
    a3 = sub_25C8C77C4();
  }
  *(void *)(a4 + 10sub_25C8B55A0(4, 3, 2, 4) = a3;
  sub_25C8D2860(a2, (uint64_t)&v14);
  if (v15)
  {
    sub_25C89F4B0(a2, &qword_26A5D9BD8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
    sub_25C8A4290(&v14, (uint64_t)__src);
  }
  else
  {
    sub_25C8EB960();
    sub_25C89F4B0(a2, &qword_26A5D9BD8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
    sub_25C89F4B0((uint64_t)&v14, &qword_26A5D9BD8);
  }
  sub_25C8A4290((long long *)__src, a4 + 112);
  return a4;
}

uint64_t sub_25C8D2AA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v15 = type metadata accessor for BaseDialogProvider();
  uint64_t v16 = &off_2709F0150;
  v14[0] = a1;
  type metadata accessor for IdentifyUserUnsupportedValueFlowStrategy();
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v14, v15);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (void *)((char *)&v14[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v10 + 16))(v9);
  uint64_t v11 = sub_25C8D28C8(*v9, a2, a3, v6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  return v11;
}

uint64_t OUTLINED_FUNCTION_3_5()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_15_3()
{
  uint64_t v2 = *(uint64_t **)(v0 + 16);
  return sub_25C8D2434(v2);
}

void *OUTLINED_FUNCTION_18_4()
{
  return __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 32) + 16), *(void *)(*(void *)(v0 + 32) + 40));
}

uint64_t OUTLINED_FUNCTION_19_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_20_3()
{
  return v0;
}

void OUTLINED_FUNCTION_21_3(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v6, v4, a4, v5, 2u);
}

uint64_t sub_25C8D2CD0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA318);
  OUTLINED_FUNCTION_0_2();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  uint64_t v50 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25C8EC0F0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v10 = v9;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  long long v14 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v49 = (char *)&v44 - v15;
  uint64_t v16 = sub_25C8EBBF0();
  if (v1)
  {
    if (qword_26A5D95B0 != -1) {
      swift_once();
    }
    uint64_t v17 = __swift_project_value_buffer(v8, (uint64_t)qword_26A5DD5B8);
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v14, v17, v8);
    id v18 = v1;
    id v19 = v1;
    uint64_t v20 = sub_25C8EC0D0();
    os_log_type_t v21 = sub_25C8EC2E0();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v48 = a1;
      uint64_t v22 = swift_slowAlloc();
      uint64_t v47 = v3;
      uint64_t v23 = (uint8_t *)v22;
      uint64_t v24 = swift_slowAlloc();
      uint64_t v45 = v10;
      uint64_t v25 = v24;
      uint64_t v52 = v24;
      uint64_t v46 = v5;
      *(_DWORD *)uint64_t v23 = 136315138;
      uint64_t v44 = v23 + 4;
      uint64_t v51 = (uint64_t)v1;
      id v26 = v1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D96D0);
      uint64_t v27 = sub_25C8EC180();
      uint64_t v51 = sub_25C8BB4F0(v27, v28, &v52);
      uint64_t v5 = v46;
      sub_25C8EC360();
      a1 = v48;
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_25C89B000, v20, v21, "failed generating verb -- User Dialog Act to tasks: %s", v23, 0xCu);
      swift_arrayDestroy();
      uint64_t v29 = v25;
      uint64_t v10 = v45;
      MEMORY[0x261198330](v29, -1, -1);
      uint64_t v30 = v23;
      uint64_t v3 = v47;
      MEMORY[0x261198330](v30, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v8);
    unint64_t v31 = MEMORY[0x263F8EE78];
  }
  else
  {
    unint64_t v31 = v16;
  }
  if (v31 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_25C8EC4F0();
    swift_bridgeObjectRelease();
    if (v36) {
      goto LABEL_11;
    }
  }
  else if (*(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_11:
    sub_25C8D9054(0, (v31 & 0xC000000000000001) == 0, v31);
    if ((v31 & 0xC000000000000001) != 0)
    {
      uint64_t v32 = MEMORY[0x261197B40](0, v31);
    }
    else
    {
      uint64_t v32 = *(void *)(v31 + 32);
      swift_retain();
    }
    uint64_t v33 = v50;
    swift_bridgeObjectRelease();
    sub_25C8EBDC0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9FC8);
    sub_25C8EBE60();
    uint64_t v34 = (void (*)(uint64_t *))sub_25C8EBE70();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v33, v3);
    uint64_t v52 = v32;
    v34(&v52);
    swift_release();
    return swift_release();
  }
  swift_bridgeObjectRelease();
  if (qword_26A5D95B0 != -1) {
    swift_once();
  }
  uint64_t v37 = __swift_project_value_buffer(v8, (uint64_t)qword_26A5DD5B8);
  uint64_t v38 = v49;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v49, v37, v8);
  uint64_t v39 = sub_25C8EC0D0();
  os_log_type_t v40 = sub_25C8EC2E0();
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v41 = v10;
    uint64_t v42 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v42 = 0;
    _os_log_impl(&dword_25C89B000, v39, v40, "did not get USOTask. Bailing", v42, 2u);
    uint64_t v43 = v42;
    uint64_t v10 = v41;
    MEMORY[0x261198330](v43, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v10 + 8))(v38, v8);
  a1[3] = (uint64_t)&type metadata for IdentityNLv4Intent;
  a1[4] = (uint64_t)&off_2709F02F8;
  uint64_t result = swift_allocObject();
  *a1 = result;
  *(void *)(result + 16) = 0;
  *(void *)(result + 2sub_25C8B55A0(4, 3, 2, 4) = 0;
  *(_WORD *)(result + 3sub_25C8B55A0(4, 3, 2, 2) = 3;
  *(_OWORD *)(result + 40) = 0u;
  *(_OWORD *)(result + 56) = 0u;
  *(unsigned char *)(result + 7sub_25C8B55A0(4, 3, 2, 2) = 3;
  return result;
}

uint64_t sub_25C8D3274@<X0>(uint64_t *a1@<X8>)
{
  v174 = a1;
  uint64_t v1 = sub_25C8EC0F0();
  uint64_t v172 = *(void *)(v1 - 8);
  uint64_t v173 = v1;
  uint64_t v2 = MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v154 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v157 = (char *)&v154 - v5;
  uint64_t v169 = sub_25C8EBC10();
  uint64_t v156 = *(void *)(v169 - 8);
  MEMORY[0x270FA5388](v169);
  long long v168 = (char *)&v154 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA320);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v159 = (uint64_t)&v154 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v171 = sub_25C8EBB70();
  uint64_t v9 = *(void *)(v171 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v171);
  uint64_t v170 = (char *)&v154 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v155 = (char *)&v154 - v12;
  uint64_t v13 = (void (**)(char *, void, uint64_t))sub_25C8EBC50();
  uint64_t v14 = (uint64_t)*(v13 - 1);
  v166 = v13;
  uint64_t v167 = v14;
  MEMORY[0x270FA5388](v13);
  unint64_t v161 = (char *)&v154 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v165 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA328);
  uint64_t v16 = MEMORY[0x270FA5388](v165);
  uint64_t v162 = (uint64_t)&v154 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  id v19 = (char *)&v154 - v18;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA330);
  uint64_t v21 = MEMORY[0x270FA5388](v20 - 8);
  uint64_t v158 = (uint64_t)&v154 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v154 - v24;
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  uint64_t v160 = (uint64_t)&v154 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v30 = (char *)&v154 - v29;
  uint64_t v31 = MEMORY[0x270FA5388](v28);
  uint64_t v33 = (char *)&v154 - v32;
  MEMORY[0x270FA5388](v31);
  uint64_t v35 = (char *)&v154 - v34;
  uint64_t v164 = sub_25C8EBC80();
  uint64_t v163 = *(void *)(v164 - 8);
  MEMORY[0x270FA5388](v164);
  uint64_t v37 = (char *)&v154 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C8EBC90();
  if (!v178) {
    goto LABEL_35;
  }
  uint64_t v154 = v9;
  sub_25C8AC2B4((uint64_t)v177, (uint64_t)v176, &qword_26A5D9B28);
  sub_25C8EBD40();
  if (swift_dynamicCast())
  {
    swift_retain();
    sub_25C8EBD20();
    swift_release();
    if (v175)
    {
      uint64_t v38 = sub_25C8EBC60();
      uint64_t v40 = v39;
      swift_release();
      if (v40)
      {
        uint64_t v172 = v40;
        uint64_t v173 = v38;
        swift_retain();
        sub_25C8EBD20();
        swift_release();
        uint64_t v171 = v175;
        if (v175)
        {
          swift_retain();
          sub_25C8EBB20();
          swift_release();
          uint64_t v41 = sub_25C8EBE00();
          swift_release();
          unint64_t v42 = sub_25C8E4DC8(1701667182, 0xE400000000000000, v41);
          swift_bridgeObjectRelease();
          if (v42)
          {
            if (v42 >> 62)
            {
              swift_bridgeObjectRetain();
              unint64_t v43 = sub_25C8EC4F0();
              swift_bridgeObjectRelease();
              if ((v43 & 0x8000000000000000) != 0)
              {
                __break(1u);
                goto LABEL_104;
              }
            }
            else
            {
              unint64_t v43 = *(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10);
            }
            if (v43 > 1)
            {
              sub_25C8D9054(1, (v42 & 0xC000000000000001) == 0, v42);
              if ((v42 & 0xC000000000000001) == 0)
              {
                swift_retain();
                goto LABEL_12;
              }
LABEL_104:
              MEMORY[0x261197B40](1, v42);
LABEL_12:
              swift_bridgeObjectRelease();
              uint64_t v44 = sub_25C8EBDF0();
              swift_release();
              if (v44)
              {
                swift_retain();
                uint64_t v45 = sub_25C8EBB40();
                uint64_t v47 = v46;
                swift_release();
              }
              else
              {
                uint64_t v45 = 0;
                uint64_t v47 = 0;
              }
LABEL_46:
              uint64_t v90 = v163;
              uint64_t v91 = v164;
              (*(void (**)(char *, void, uint64_t))(v163 + 104))(v37, *MEMORY[0x263F72AB0], v164);
              uint64_t v92 = sub_25C8EBC70();
              uint64_t v94 = v93;
              (*(void (**)(char *, uint64_t))(v90 + 8))(v37, v91);
              if (v47)
              {
                if (v45 == v92 && v47 == v94)
                {
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  if (!v44) {
                    goto LABEL_58;
                  }
                }
                else
                {
                  char v96 = sub_25C8EC550();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  uint64_t v97 = 0;
                  uint64_t v98 = 0;
                  if ((v96 & 1) == 0 || !v44) {
                    goto LABEL_59;
                  }
                }
                swift_retain();
                uint64_t v99 = sub_25C8EBB30();
                swift_release();
                if (v99)
                {
                  uint64_t v97 = sub_25C8EBDE0();
                  uint64_t v98 = v100;
                  swift_release();
LABEL_59:
                  uint64_t v101 = v174;
                  v174[3] = (uint64_t)&type metadata for IdentityNLv4Intent;
                  v101[4] = (uint64_t)&off_2709F02F8;
                  uint64_t v102 = swift_allocObject();
                  uint64_t *v101 = v102;
                  swift_release();
                  swift_release();
                  swift_release();
                  *(void *)(v102 + 16) = 0;
                  *(void *)(v102 + 2sub_25C8B55A0(4, 3, 2, 4) = 0;
                  *(_WORD *)(v102 + 3sub_25C8B55A0(4, 3, 2, 2) = 3;
                  uint64_t v103 = v172;
                  *(void *)(v102 + 40) = v173;
                  *(void *)(v102 + 48) = v103;
                  *(void *)(v102 + 56) = v97;
                  *(void *)(v102 + 6sub_25C8B55A0(4, 3, 2, 4) = v98;
                  *(unsigned char *)(v102 + 7sub_25C8B55A0(4, 3, 2, 2) = 0;
                  goto LABEL_60;
                }
              }
              else
              {
                swift_bridgeObjectRelease();
              }
LABEL_58:
              uint64_t v97 = 0;
              uint64_t v98 = 0;
              goto LABEL_59;
            }
            swift_bridgeObjectRelease();
          }
        }
        uint64_t v45 = 0;
        uint64_t v47 = 0;
        uint64_t v44 = 0;
        goto LABEL_46;
      }
    }
LABEL_42:
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v176);
    sub_25C89F4B0((uint64_t)v177, &qword_26A5D9B28);
    uint64_t v86 = v174;
    v174[3] = (uint64_t)&type metadata for IdentityNLv4Intent;
    v86[4] = (uint64_t)&off_2709F02F8;
    uint64_t result = swift_allocObject();
    *uint64_t v86 = result;
    *(void *)(result + 16) = 0;
    *(void *)(result + 2sub_25C8B55A0(4, 3, 2, 4) = 0;
    *(_WORD *)(result + 3sub_25C8B55A0(4, 3, 2, 2) = 3;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(unsigned char *)(result + 7sub_25C8B55A0(4, 3, 2, 2) = 3;
    return result;
  }
  sub_25C8EBD90();
  int v48 = swift_dynamicCast();
  uint64_t v49 = (unsigned int *)MEMORY[0x263F72A70];
  if (v48)
  {
    swift_retain();
    sub_25C8EBCA0();
    swift_release();
    if (v175)
    {
      sub_25C8EBC40();
      swift_release();
      uint64_t v50 = (void (**)(void, void, void))v166;
    }
    else
    {
      uint64_t v50 = (void (**)(void, void, void))v166;
      __swift_storeEnumTagSinglePayload((uint64_t)v35, 1, 1, (uint64_t)v166);
    }
    uint64_t v68 = v165;
    uint64_t v69 = *v49;
    uint64_t v70 = v167;
    (*(void (**)(char *, uint64_t, void))(v167 + 104))(v33, v69, v50);
    __swift_storeEnumTagSinglePayload((uint64_t)v33, 0, 1, (uint64_t)v50);
    uint64_t v71 = (uint64_t)&v19[*(int *)(v68 + 48)];
    sub_25C8AC2B4((uint64_t)v35, (uint64_t)v19, &qword_26A5DA330);
    sub_25C8AC2B4((uint64_t)v33, v71, &qword_26A5DA330);
    os_log_type_t v72 = v50;
    if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, (uint64_t)v50) == 1)
    {
      sub_25C89F4B0((uint64_t)v33, &qword_26A5DA330);
      sub_25C89F4B0((uint64_t)v35, &qword_26A5DA330);
      if (__swift_getEnumTagSinglePayload(v71, 1, (uint64_t)v50) == 1)
      {
        sub_25C89F4B0((uint64_t)v19, &qword_26A5DA330);
LABEL_41:
        uint64_t v83 = v174;
        v174[3] = (uint64_t)&type metadata for IdentityNLv4Intent;
        v83[4] = (uint64_t)&off_2709F02F8;
        uint64_t v84 = swift_allocObject();
        *uint64_t v83 = v84;
        swift_release();
        *(void *)(v84 + 16) = 0;
        *(void *)(v84 + 2sub_25C8B55A0(4, 3, 2, 4) = 0;
        *(_WORD *)(v84 + 3sub_25C8B55A0(4, 3, 2, 2) = 3;
        *(_OWORD *)(v84 + 40) = 0u;
        *(_OWORD *)(v84 + 56) = 0u;
        char v85 = 1;
        goto LABEL_83;
      }
    }
    else
    {
      sub_25C8AC2B4((uint64_t)v19, (uint64_t)v30, &qword_26A5DA330);
      if (__swift_getEnumTagSinglePayload(v71, 1, (uint64_t)v50) != 1)
      {
        uint64_t v81 = v161;
        (*(void (**)(char *, uint64_t, void))(v70 + 32))(v161, v71, v72);
        sub_25C8D4A08();
        LODWORD(v17sub_25C8B55A0(4, 3, 2, 3) = sub_25C8EC150();
        uint64_t v82 = *(void (**)(void, void))(v70 + 8);
        v82(v81, v72);
        sub_25C89F4B0((uint64_t)v33, &qword_26A5DA330);
        sub_25C89F4B0((uint64_t)v35, &qword_26A5DA330);
        v82(v30, v72);
        sub_25C89F4B0((uint64_t)v19, &qword_26A5DA330);
        if ((v173 & 1) == 0) {
          goto LABEL_42;
        }
        goto LABEL_41;
      }
      sub_25C89F4B0((uint64_t)v33, &qword_26A5DA330);
      sub_25C89F4B0((uint64_t)v35, &qword_26A5DA330);
      (*(void (**)(char *, void (**)(void, void, void)))(v70 + 8))(v30, v50);
    }
    sub_25C89F4B0((uint64_t)v19, &qword_26A5DA328);
    goto LABEL_42;
  }
  sub_25C8EBD30();
  if (!swift_dynamicCast())
  {
    sub_25C8EBCD0();
    if (swift_dynamicCast())
    {
      swift_retain();
      sub_25C8EBAE0();
      swift_release();
      uint64_t v62 = v172;
      uint64_t v61 = v173;
      if (v175)
      {
        uint64_t v63 = sub_25C8EBC60();
        uint64_t v65 = v64;
        uint64_t v66 = v174;
        v174[3] = (uint64_t)&type metadata for IdentityNLv4Intent;
        v66[4] = (uint64_t)&off_2709F02F8;
        uint64_t v67 = swift_allocObject();
        *uint64_t v66 = v67;
        swift_release();
        swift_release();
        *(void *)(v67 + 16) = 0;
        *(void *)(v67 + 2sub_25C8B55A0(4, 3, 2, 4) = 0;
        *(_WORD *)(v67 + 3sub_25C8B55A0(4, 3, 2, 2) = 3;
        *(void *)(v67 + 40) = v63;
        *(void *)(v67 + 48) = v65;
        *(void *)(v67 + 56) = 0;
        *(void *)(v67 + 6sub_25C8B55A0(4, 3, 2, 4) = 0;
        *(unsigned char *)(v67 + 7sub_25C8B55A0(4, 3, 2, 2) = 2;
LABEL_60:
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v176);
        return sub_25C89F4B0((uint64_t)v177, &qword_26A5D9B28);
      }
      if (qword_26A5D95B0 != -1) {
        swift_once();
      }
      uint64_t v124 = __swift_project_value_buffer(v61, (uint64_t)qword_26A5DD5B8);
      char v125 = v157;
      (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v157, v124, v61);
      uint64_t v126 = sub_25C8EC0D0();
      os_log_type_t v127 = sub_25C8EC2C0();
      if (os_log_type_enabled(v126, v127))
      {
        char v128 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)char v128 = 0;
        _os_log_impl(&dword_25C89B000, v126, v127, "#Transformer found a noVerb task with no entity. Returning Empty Intent", v128, 2u);
        MEMORY[0x261198330](v128, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v62 + 8))(v125, v61);
      uint64_t v129 = v174;
      v174[3] = (uint64_t)&type metadata for IdentityNLv4Intent;
      v129[4] = (uint64_t)&off_2709F02F8;
      uint64_t v84 = swift_allocObject();
      *uint64_t v129 = v84;
      swift_release();
      *(void *)(v84 + 16) = 0;
      *(void *)(v84 + 2sub_25C8B55A0(4, 3, 2, 4) = 0;
      char v85 = 3;
      *(_WORD *)(v84 + 3sub_25C8B55A0(4, 3, 2, 2) = 3;
      *(_OWORD *)(v84 + 40) = 0u;
      *(_OWORD *)(v84 + 56) = 0u;
LABEL_83:
      *(unsigned char *)(v84 + 7sub_25C8B55A0(4, 3, 2, 2) = v85;
      goto LABEL_84;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v176);
LABEL_35:
    if (qword_26A5D95B0 != -1) {
      swift_once();
    }
    uint64_t v73 = v173;
    uint64_t v74 = __swift_project_value_buffer(v173, (uint64_t)qword_26A5DD5B8);
    uint64_t v75 = v172;
    (*(void (**)(char *, uint64_t, uint64_t))(v172 + 16))(v4, v74, v73);
    uint64_t v76 = sub_25C8EC0D0();
    os_log_type_t v77 = sub_25C8EC2C0();
    if (os_log_type_enabled(v76, v77))
    {
      unint64_t v78 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v78 = 0;
      _os_log_impl(&dword_25C89B000, v76, v77, "#Transformer did not have a valid task. Returning Empty Intent", v78, 2u);
      MEMORY[0x261198330](v78, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v75 + 8))(v4, v73);
    uint64_t v79 = v174;
    v174[3] = (uint64_t)&type metadata for IdentityNLv4Intent;
    v79[4] = (uint64_t)&off_2709F02F8;
    uint64_t v80 = swift_allocObject();
    *uint64_t v79 = v80;
    *(void *)(v80 + 16) = 0;
    *(void *)(v80 + 2sub_25C8B55A0(4, 3, 2, 4) = 0;
    *(_WORD *)(v80 + 3sub_25C8B55A0(4, 3, 2, 2) = 3;
    *(_OWORD *)(v80 + 40) = 0u;
    *(_OWORD *)(v80 + 56) = 0u;
    *(unsigned char *)(v80 + 7sub_25C8B55A0(4, 3, 2, 2) = 3;
    return sub_25C89F4B0((uint64_t)v177, &qword_26A5D9B28);
  }
  uint64_t v51 = v179;
  swift_retain();
  sub_25C8EBCA0();
  swift_release();
  uint64_t v52 = v175;
  if (!v175)
  {
LABEL_43:
    uint64_t v88 = v174;
    v174[3] = (uint64_t)&type metadata for IdentityNLv4Intent;
    v88[4] = (uint64_t)&off_2709F02F8;
    uint64_t v89 = swift_allocObject();
    *uint64_t v88 = v89;
    swift_release();
    *(void *)(v89 + 16) = 0;
    *(void *)(v89 + 2sub_25C8B55A0(4, 3, 2, 4) = 0;
    *(_WORD *)(v89 + 3sub_25C8B55A0(4, 3, 2, 2) = 3;
    *(_OWORD *)(v89 + 40) = 0u;
    *(_OWORD *)(v89 + 56) = 0u;
    *(unsigned char *)(v89 + 7sub_25C8B55A0(4, 3, 2, 2) = 2;
    goto LABEL_84;
  }
  uint64_t v53 = sub_25C8EBCC0();
  uint64_t v54 = v171;
  uint64_t v55 = v154;
  if (v53)
  {
    uint64_t v56 = v160;
    uint64_t v173 = v53;
    sub_25C8EBC40();
    uint64_t v57 = *v49;
    uint64_t v58 = (void (**)(void, void, void))v166;
    (*(void (**)(char *, uint64_t, void))(v167 + 104))(v25, v57, v166);
    __swift_storeEnumTagSinglePayload((uint64_t)v25, 0, 1, (uint64_t)v58);
    uint64_t v59 = v162;
    uint64_t v60 = v162 + *(int *)(v165 + 48);
    sub_25C8AC2B4(v56, v162, &qword_26A5DA330);
    sub_25C8AC2B4((uint64_t)v25, v60, &qword_26A5DA330);
    if (__swift_getEnumTagSinglePayload(v59, 1, (uint64_t)v58) == 1)
    {
      sub_25C89F4B0((uint64_t)v25, &qword_26A5DA330);
      sub_25C89F4B0(v56, &qword_26A5DA330);
      uint64_t v59 = v162;
      if (__swift_getEnumTagSinglePayload(v60, 1, (uint64_t)v58) == 1)
      {
        sub_25C89F4B0(v59, &qword_26A5DA330);
LABEL_90:
        uint64_t v133 = v174;
        v174[3] = (uint64_t)&type metadata for IdentityNLv4Intent;
        v133[4] = (uint64_t)&off_2709F02F8;
        uint64_t v134 = swift_allocObject();
        uint64_t *v133 = v134;
        swift_release();
        swift_release();
        swift_release();
        *(void *)(v134 + 16) = 0;
        *(void *)(v134 + 2sub_25C8B55A0(4, 3, 2, 4) = 0;
        *(_WORD *)(v134 + 3sub_25C8B55A0(4, 3, 2, 2) = 259;
        *(_OWORD *)(v134 + 40) = 0u;
        *(_OWORD *)(v134 + 56) = 0u;
        *(unsigned char *)(v134 + 7sub_25C8B55A0(4, 3, 2, 2) = 2;
        goto LABEL_60;
      }
    }
    else
    {
      uint64_t v104 = v158;
      sub_25C8AC2B4(v59, v158, &qword_26A5DA330);
      if (__swift_getEnumTagSinglePayload(v60, 1, (uint64_t)v58) != 1)
      {
        uint64_t v130 = v167;
        unint64_t v131 = v161;
        (*(void (**)(char *, uint64_t, void))(v167 + 32))(v161, v60, v58);
        sub_25C8D4A08();
        LODWORD(v17sub_25C8B55A0(4, 3, 2, 2) = sub_25C8EC150();
        uint64_t v132 = *(void (**)(void, void))(v130 + 8);
        v132(v131, v58);
        sub_25C89F4B0((uint64_t)v25, &qword_26A5DA330);
        sub_25C89F4B0(v160, &qword_26A5DA330);
        v132(v104, v58);
        uint64_t v55 = v154;
        sub_25C89F4B0(v162, &qword_26A5DA330);
        if (v172) {
          goto LABEL_90;
        }
        goto LABEL_64;
      }
      sub_25C89F4B0((uint64_t)v25, &qword_26A5DA330);
      sub_25C89F4B0(v160, &qword_26A5DA330);
      (*(void (**)(uint64_t, void (**)(void, void, void)))(v167 + 8))(v104, v58);
    }
    sub_25C89F4B0(v59, &qword_26A5DA328);
    uint64_t v55 = v154;
LABEL_64:
    swift_release();
  }
  uint64_t v105 = sub_25C8EBBC0();
  if (!v105)
  {
    uint64_t v123 = v159;
    __swift_storeEnumTagSinglePayload(v159, 1, 1, v54);
    goto LABEL_94;
  }
  uint64_t v163 = v52;
  uint64_t v106 = *(void *)(v105 + 16);
  if (!v106)
  {
    uint64_t v122 = 1;
    uint64_t v123 = v159;
    goto LABEL_93;
  }
  uint64_t v162 = v51;
  uint64_t v108 = *(void *)(v55 + 16);
  uint64_t v107 = v55 + 16;
  uint64_t v172 = v108;
  unint64_t v109 = v105 + ((*(unsigned __int8 *)(v107 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v107 + 64));
  LODWORD(v167) = *MEMORY[0x263F72908];
  v110 = (void (**)(char *, uint64_t))(v156 + 8);
  uint64_t v165 = v107 - 8;
  v166 = (void (**)(char *, void, uint64_t))(v156 + 104);
  uint64_t v173 = v107;
  uint64_t v164 = *(void *)(v107 + 56);
  unint64_t v161 = (char *)v105;
  swift_bridgeObjectRetain();
  uint64_t v112 = v169;
  os_log_type_t v111 = v170;
  while (1)
  {
    ((void (*)(char *, unint64_t, uint64_t))v172)(v111, v109, v54);
    uint64_t v113 = sub_25C8EBB60();
    uint64_t v115 = v114;
    uint64_t v116 = v168;
    (*v166)(v168, v167, v112);
    uint64_t v117 = sub_25C8EBC00();
    uint64_t v119 = v118;
    (*v110)(v116, v112);
    if (!v115)
    {
      swift_bridgeObjectRelease();
      goto LABEL_76;
    }
    if (v113 == v117 && v115 == v119) {
      break;
    }
    char v121 = sub_25C8EC550();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v121) {
      goto LABEL_92;
    }
LABEL_76:
    os_log_type_t v111 = v170;
    uint64_t v54 = v171;
    (*(void (**)(char *, uint64_t))v165)(v170, v171);
    v109 += v164;
    if (!--v106)
    {
      swift_bridgeObjectRelease();
      uint64_t v122 = 1;
      uint64_t v55 = v154;
      uint64_t v123 = v159;
      goto LABEL_93;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_92:
  swift_bridgeObjectRelease();
  uint64_t v54 = v171;
  uint64_t v55 = v154;
  uint64_t v123 = v159;
  (*(void (**)(uint64_t, char *, uint64_t))(v154 + 32))(v159, v170, v171);
  uint64_t v122 = 0;
LABEL_93:
  __swift_storeEnumTagSinglePayload(v123, v122, 1, v54);
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload(v123, 1, v54) != 1)
  {
    v141 = v155;
    (*(void (**)(char *, uint64_t, uint64_t))(v55 + 32))(v155, v123, v54);
    uint64_t v142 = v55;
    uint64_t v143 = sub_25C8EBB50();
    uint64_t v145 = v144;
    uint64_t v146 = v174;
    v174[3] = (uint64_t)&type metadata for IdentityNLv4Intent;
    v146[4] = (uint64_t)&off_2709F02F8;
    uint64_t v147 = swift_allocObject();
    *uint64_t v146 = v147;
    swift_release();
    swift_release();
    *(void *)(v147 + 16) = 0;
    *(void *)(v147 + 2sub_25C8B55A0(4, 3, 2, 4) = 0;
    *(_WORD *)(v147 + 3sub_25C8B55A0(4, 3, 2, 2) = 3;
    *(void *)(v147 + 40) = v143;
    *(void *)(v147 + 48) = v145;
    *(void *)(v147 + 56) = 0;
    *(void *)(v147 + 6sub_25C8B55A0(4, 3, 2, 4) = 0;
    *(unsigned char *)(v147 + 7sub_25C8B55A0(4, 3, 2, 2) = 2;
    (*(void (**)(char *, uint64_t))(v142 + 8))(v141, v54);
    goto LABEL_84;
  }
LABEL_94:
  sub_25C89F4B0(v123, &qword_26A5DA320);
  uint64_t v135 = sub_25C8EBCB0();
  if (v136)
  {
    uint64_t v137 = v135;
    uint64_t v138 = v136;
    uint64_t v139 = v174;
    v174[3] = (uint64_t)&type metadata for IdentityNLv4Intent;
    v139[4] = (uint64_t)&off_2709F02F8;
    uint64_t v140 = swift_allocObject();
    uint64_t *v139 = v140;
    swift_release();
    swift_release();
    *(void *)(v140 + 16) = 0;
    *(void *)(v140 + 2sub_25C8B55A0(4, 3, 2, 4) = 0;
    *(_WORD *)(v140 + 3sub_25C8B55A0(4, 3, 2, 2) = 3;
    *(void *)(v140 + 40) = v137;
    *(void *)(v140 + 48) = v138;
    *(void *)(v140 + 56) = 0;
    *(void *)(v140 + 6sub_25C8B55A0(4, 3, 2, 4) = 0;
    *(unsigned char *)(v140 + 7sub_25C8B55A0(4, 3, 2, 2) = 2;
    goto LABEL_84;
  }
  if (!sub_25C8EBCC0()) {
    goto LABEL_101;
  }
  uint64_t v148 = sub_25C8EBC60();
  if (!v149)
  {
    swift_release();
LABEL_101:
    swift_release();
    goto LABEL_43;
  }
  uint64_t v150 = v148;
  uint64_t v151 = v149;
  uint64_t v152 = v174;
  v174[3] = (uint64_t)&type metadata for IdentityNLv4Intent;
  v152[4] = (uint64_t)&off_2709F02F8;
  uint64_t v153 = swift_allocObject();
  uint64_t *v152 = v153;
  swift_release();
  swift_release();
  swift_release();
  *(void *)(v153 + 16) = 0;
  *(void *)(v153 + 2sub_25C8B55A0(4, 3, 2, 4) = 0;
  *(_WORD *)(v153 + 3sub_25C8B55A0(4, 3, 2, 2) = 3;
  *(void *)(v153 + 40) = v150;
  *(void *)(v153 + 48) = v151;
  *(void *)(v153 + 56) = 0;
  *(void *)(v153 + 6sub_25C8B55A0(4, 3, 2, 4) = 0;
  *(unsigned char *)(v153 + 7sub_25C8B55A0(4, 3, 2, 2) = 2;
LABEL_84:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v176);
  return sub_25C89F4B0((uint64_t)v177, &qword_26A5D9B28);
}

unsigned __int8 *sub_25C8D499C@<X0>(unsigned __int8 *result@<X0>, uint64_t *a2@<X8>)
{
  int v2 = *result;
  uint64_t v3 = 3;
  if (v2 != 1) {
    uint64_t v3 = 4;
  }
  BOOL v4 = v2 == 0;
  uint64_t v5 = 2;
  if (!v4) {
    uint64_t v5 = v3;
  }
  *a2 = v5;
  return result;
}

uint64_t sub_25C8D49C0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 73, 7);
}

unint64_t sub_25C8D4A08()
{
  unint64_t result = qword_26A5DA338;
  if (!qword_26A5DA338)
  {
    sub_25C8EBC50();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DA338);
  }
  return result;
}

uint64_t InProcessHandlingStrategy.makeSiriKitIntentHandler(app:intent:)@<X0>(void *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(a3 + 24);
  swift_retain();
  v8(a2, a3);
  swift_getAssociatedTypeWitness();
  id v9 = a1;
  sub_25C8EB340();
  uint64_t v10 = sub_25C8EB350();
  return __swift_storeEnumTagSinglePayload(a4, 0, 1, v10);
}

uint64_t sub_25C8D4B2C()
{
  uint64_t v0 = sub_25C8EBF30();
  OUTLINED_FUNCTION_0_2();
  uint64_t v2 = v1;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25C8EB530();
  uint64_t v8 = v7;
  sub_25C8EBF20();
  uint64_t v9 = sub_25C8EBF10();
  uint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v0);
  if (v8)
  {
    if (v6 == v9 && v8 == v11) {
      char v13 = 1;
    }
    else {
      char v13 = sub_25C8EC550();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v13 = 0;
  }
  swift_bridgeObjectRelease();
  return v13 & 1;
}

uint64_t sub_25C8D4C40()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25C8EB5D0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_28_0();
  v29[1] = v6;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v29 - v8;
  sub_25C8EB5A0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_10_7();
  sub_25C8EB590();
  char v14 = OUTLINED_FUNCTION_3_6();
  uint64_t v15 = *(void (**)(void))(v11 + 8);
  OUTLINED_FUNCTION_2_6();
  v15();
  OUTLINED_FUNCTION_2_6();
  v15();
  uint64_t v30 = (void (*)(void))v4;
  uint64_t v31 = v1;
  v29[0] = *(void *)(v4 + 16);
  ((void (*)(char *, uint64_t, uint64_t))v29[0])(v9, v1, v2);
  if (v14)
  {
    uint64_t v16 = (void (*)(uint64_t))*((void *)v30 + 1);
    uint64_t v17 = OUTLINED_FUNCTION_7_4();
    v16(v17);
    uint64_t v18 = OUTLINED_FUNCTION_4_9();
    v19(v18);
  }
  else
  {
    sub_25C8EB5B0();
    sub_25C8EB560();
    char v20 = OUTLINED_FUNCTION_3_6();
    OUTLINED_FUNCTION_2_6();
    v15();
    OUTLINED_FUNCTION_2_6();
    v15();
    uint64_t v21 = OUTLINED_FUNCTION_7_4();
    uint64_t v30 = v22;
    v22(v21);
    uint64_t v23 = OUTLINED_FUNCTION_4_9();
    v24(v23);
    if ((v20 & 1) == 0)
    {
      sub_25C8EB5B0();
      sub_25C8EB570();
      char v26 = OUTLINED_FUNCTION_3_6();
      OUTLINED_FUNCTION_2_6();
      v15();
      OUTLINED_FUNCTION_2_6();
      v15();
      uint64_t v27 = OUTLINED_FUNCTION_7_4();
      v30(v27);
      return v26 & 1;
    }
    uint64_t v16 = v30;
  }
  uint64_t v25 = OUTLINED_FUNCTION_7_4();
  v16(v25);
  char v26 = 1;
  return v26 & 1;
}

uint64_t sub_25C8D4E88()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_25C8EB5D0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_28_0();
  uint64_t v43 = v5;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v45 = (char *)v40 - v8;
  MEMORY[0x270FA5388](v7);
  sub_25C8EB5A0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_10_7();
  sub_25C8EB590();
  char v13 = OUTLINED_FUNCTION_3_6();
  char v14 = *(void (**)(void))(v10 + 8);
  OUTLINED_FUNCTION_1_10();
  v14();
  OUTLINED_FUNCTION_1_10();
  v14();
  uint64_t v15 = *(void (**)(void))(v3 + 16);
  uint64_t v46 = v1;
  uint64_t v16 = v42;
  uint64_t v44 = v15;
  OUTLINED_FUNCTION_6_0();
  v17();
  if (v13)
  {
    uint64_t v18 = *(void (**)(uint64_t))(v3 + 8);
    uint64_t v19 = OUTLINED_FUNCTION_11_4();
    v18(v19);
    uint64_t v21 = v45;
    uint64_t v20 = v46;
    uint64_t v22 = v44;
    OUTLINED_FUNCTION_6_0();
    v22();
    uint64_t v23 = v43;
    uint64_t v24 = v21;
    uint64_t v25 = v22;
LABEL_5:
    ((void (*)(char *, uint64_t))v18)(v24, v16);
    ((void (*)(uint64_t, uint64_t, uint64_t))v25)(v23, v20, v16);
    ((void (*)(uint64_t, uint64_t))v18)(v23, v16);
    goto LABEL_6;
  }
  sub_25C8EB5B0();
  sub_25C8EB560();
  char v26 = OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_1_10();
  v14();
  OUTLINED_FUNCTION_1_10();
  v14();
  uint64_t v27 = OUTLINED_FUNCTION_11_4();
  v40[1] = v28;
  uint64_t v41 = v29;
  v29(v27);
  OUTLINED_FUNCTION_6_0();
  v30();
  if (v26)
  {
    uint64_t v23 = v43;
    uint64_t v25 = v44;
    uint64_t v24 = v45;
    uint64_t v20 = v46;
    uint64_t v18 = v41;
    goto LABEL_5;
  }
  sub_25C8EB5B0();
  sub_25C8EB570();
  char v33 = OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_1_10();
  v14();
  OUTLINED_FUNCTION_1_10();
  v14();
  uint64_t v34 = OUTLINED_FUNCTION_6_5();
  v35(v34);
  uint64_t v36 = v43;
  OUTLINED_FUNCTION_6_0();
  v37();
  if ((v33 & 1) == 0)
  {
    sub_25C8EB5B0();
    sub_25C8EB580();
    char v31 = OUTLINED_FUNCTION_3_6();
    OUTLINED_FUNCTION_1_10();
    v14();
    OUTLINED_FUNCTION_1_10();
    v14();
    uint64_t v38 = OUTLINED_FUNCTION_6_5();
    v39(v38);
    return v31 & 1;
  }
  ((void (*)(uint64_t, uint64_t))v41)(v36, v16);
LABEL_6:
  char v31 = 1;
  return v31 & 1;
}

uint64_t OUTLINED_FUNCTION_3_6()
{
  return sub_25C8EB550();
}

uint64_t OUTLINED_FUNCTION_4_9()
{
  return *(void *)(v0 - 104);
}

uint64_t OUTLINED_FUNCTION_6_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10_7()
{
  return sub_25C8EB5B0();
}

uint64_t OUTLINED_FUNCTION_11_4()
{
  return v0;
}

double IdentityFlowProvider.init()@<D0>(uint64_t a1@<X8>)
{
  sub_25C8EB960();
  sub_25C8EB320();
  *(void *)(a1 + 10sub_25C8B55A0(4, 3, 2, 4) = &type metadata for IdentityFlowFactoryImpl;
  *(void *)(a1 + 11sub_25C8B55A0(4, 3, 2, 2) = &off_2709F0410;
  double result = 0.0;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 145) = 0u;
  return result;
}

uint64_t IdentityFlowProvider.makeFlow(for:)(uint64_t a1)
{
  uint64_t v115 = a1;
  uint64_t v98 = sub_25C8EB940();
  OUTLINED_FUNCTION_0_2();
  uint64_t v2 = v1;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_28_0();
  uint64_t v100 = v4;
  OUTLINED_FUNCTION_5_3();
  MEMORY[0x270FA5388](v5);
  uint64_t v102 = (char *)v94 - v6;
  uint64_t v7 = sub_25C8EB950();
  OUTLINED_FUNCTION_0_2();
  uint64_t v116 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_28_0();
  uint64_t v99 = v10;
  OUTLINED_FUNCTION_5_3();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_6_2();
  uint64_t v109 = v12;
  OUTLINED_FUNCTION_5_3();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_6_2();
  uint64_t v107 = v14;
  OUTLINED_FUNCTION_5_3();
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)v94 - v16;
  uint64_t v18 = sub_25C8EC0F0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v20 = v19;
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_28_0();
  uint64_t v101 = v22;
  OUTLINED_FUNCTION_5_3();
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_6_2();
  v110 = v24;
  OUTLINED_FUNCTION_5_3();
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_6_2();
  uint64_t v96 = v26;
  OUTLINED_FUNCTION_5_3();
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_5_3();
  MEMORY[0x270FA5388](v28);
  uint64_t v30 = (char *)v94 - v29;
  if (qword_26A5D95A0 != -1) {
    swift_once();
  }
  uint64_t v105 = v2;
  uint64_t v31 = __swift_project_value_buffer(v18, (uint64_t)qword_26A5DD588);
  uint64_t v32 = *(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16);
  uint64_t v112 = v31;
  uint64_t v113 = v32;
  uint64_t v114 = (uint8_t *)(v20 + 16);
  ((void (*)(char *))v32)(v30);
  char v33 = sub_25C8EC0D0();
  os_log_type_t v34 = sub_25C8EC2F0();
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v35 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v35 = 0;
    _os_log_impl(&dword_25C89B000, v33, v34, "Making flow from parse", v35, 2u);
    OUTLINED_FUNCTION_3();
  }

  uint64_t v36 = *(void (**)(char *, uint64_t))(v20 + 8);
  uint64_t v111 = v20 + 8;
  v36(v30, v18);
  OUTLINED_FUNCTION_2_7();
  v37();
  uint64_t v38 = v116;
  uint64_t v39 = *(void (**)(void))(v116 + 16);
  OUTLINED_FUNCTION_7_5();
  v39();
  uint64_t v40 = sub_25C8EC0D0();
  os_log_type_t v41 = sub_25C8EC2D0();
  BOOL v42 = os_log_type_enabled(v40, v41);
  uint64_t v104 = v38 + 16;
  uint64_t v103 = v39;
  if (v42)
  {
    uint64_t v106 = v36;
    uint64_t v43 = swift_slowAlloc();
    uint64_t v97 = v18;
    uint64_t v44 = (uint8_t *)v43;
    uint64_t v95 = swift_slowAlloc();
    v120[0] = v95;
    *(_DWORD *)uint64_t v44 = 136315138;
    v94[1] = v44 + 4;
    OUTLINED_FUNCTION_7_5();
    v39();
    uint64_t v45 = sub_25C8EC180();
    uint64_t v47 = sub_25C8BB4F0(v45, v46, v120);
    OUTLINED_FUNCTION_6_6(v47);
    sub_25C8EC360();
    uint64_t v36 = v106;
    swift_bridgeObjectRelease();
    int v48 = *(void (**)(void))(v116 + 8);
    OUTLINED_FUNCTION_11_0();
    v48();
    _os_log_impl(&dword_25C89B000, v40, v41, "Received parse: %s", v44, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    uint64_t v18 = v97;
    OUTLINED_FUNCTION_3();
  }
  else
  {
    int v48 = *(void (**)(void))(v116 + 8);
    ((void (*)(char *, uint64_t))v48)(v17, v7);
  }

  OUTLINED_FUNCTION_11_0();
  ((void (*)(void))v36)();
  uint64_t v49 = v110;
  uint64_t v50 = v115;
  sub_25C8C93E8((uint64_t)&v118);
  if (v119)
  {
    uint64_t v51 = (void (*)(void))v36;
    sub_25C8A4290(&v118, (uint64_t)v120);
    __swift_project_boxed_opaque_existential_1(v120, v120[3]);
    uint64_t v52 = OUTLINED_FUNCTION_49_0();
    int v54 = v53(v52);
    sub_25C8A7E98((uint64_t)v120, (uint64_t)&v118);
    if (v54)
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v118);
LABEL_11:
      uint64_t v55 = v108;
      uint64_t v56 = sub_25C8D5DFC(v120);
      uint64_t v57 = v56;
      if (*(unsigned char *)(v55 + 160) == 1 && v56)
      {
        uint64_t v117 = v56;
        sub_25C8D6894();
        uint64_t v58 = sub_25C8EB2B0();
        swift_release();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v120);
        return v58;
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v120);
      }
      return v57;
    }
    __swift_project_boxed_opaque_existential_1(&v118, v119);
    uint64_t v74 = OUTLINED_FUNCTION_49_0();
    v75(v74);
    uint64_t v77 = v76;
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v118);
    if (!v77) {
      goto LABEL_11;
    }
    sub_25C8EBE50();
    if (static SiriEnvironment.getUserIdentity()() && (sub_25C8EB7F0() & 1) != 0)
    {
      swift_release();
      goto LABEL_11;
    }
    v113(v96, v112, v18);
    uint64_t v89 = sub_25C8EC0D0();
    os_log_type_t v90 = sub_25C8EC2D0();
    if (os_log_type_enabled(v89, v90))
    {
      uint64_t v91 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v91 = 0;
      _os_log_impl(&dword_25C89B000, v89, v90, "Contacts Reformation flow. Will fall back to server.", v91, 2u);
      OUTLINED_FUNCTION_3();
    }

    swift_release();
    OUTLINED_FUNCTION_11_0();
    v51();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v120);
    return 0;
  }
  sub_25C8A41E8((uint64_t)&v118);
  uint64_t v59 = v109;
  uint64_t v60 = v103;
  ((void (*)(uint64_t, uint64_t, uint64_t))v103)(v109, v50, v7);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v116 + 88))(v59, v7) != *MEMORY[0x263F6FF70])
  {
    uint64_t v106 = v36;
    unint64_t v78 = v101;
    OUTLINED_FUNCTION_2_7();
    v79();
    OUTLINED_FUNCTION_7_5();
    v60();
    uint64_t v80 = sub_25C8EC0D0();
    uint64_t v81 = v18;
    os_log_type_t v82 = sub_25C8EC2E0();
    if (os_log_type_enabled(v80, v82))
    {
      uint64_t v97 = v81;
      uint64_t v83 = (uint8_t *)swift_slowAlloc();
      uint64_t v115 = swift_slowAlloc();
      v120[0] = v115;
      *(_DWORD *)uint64_t v83 = 136315138;
      uint64_t v114 = v83 + 4;
      OUTLINED_FUNCTION_7_5();
      v60();
      uint64_t v84 = sub_25C8EC180();
      uint64_t v86 = sub_25C8BB4F0(v84, v85, v120);
      OUTLINED_FUNCTION_6_6(v86);
      sub_25C8EC360();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_9_6();
      OUTLINED_FUNCTION_11_0();
      v48();
      _os_log_impl(&dword_25C89B000, v80, v82, "Received unsupported parse: %s", v83, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();

      uint64_t v87 = v101;
      uint64_t v88 = v97;
    }
    else
    {
      OUTLINED_FUNCTION_9_6();
      OUTLINED_FUNCTION_11_0();
      v48();

      uint64_t v87 = v78;
      uint64_t v88 = v81;
    }
    v106(v87, v88);
    ((void (*)(uint64_t, uint64_t))v48)(v109, v7);
    return 0;
  }
  uint64_t v61 = v109;
  (*(void (**)(uint64_t, uint64_t))(v116 + 96))(v109, v7);
  uint64_t v62 = v105;
  uint64_t v63 = v102;
  uint64_t v64 = v98;
  (*(void (**)(char *, uint64_t, uint64_t))(v105 + 32))(v102, v61, v98);
  OUTLINED_FUNCTION_2_7();
  v65();
  (*(void (**)(uint64_t, char *, uint64_t))(v62 + 16))(v100, v63, v64);
  uint64_t v66 = sub_25C8EC0D0();
  os_log_type_t v67 = sub_25C8EC2F0();
  if (os_log_type_enabled(v66, v67))
  {
    uint64_t v68 = (uint8_t *)swift_slowAlloc();
    v120[0] = swift_slowAlloc();
    uint64_t v106 = v36;
    *(_DWORD *)uint64_t v68 = 136315138;
    uint64_t v69 = sub_25C8EB920();
    uint64_t v71 = sub_25C8BB4F0(v69, v70, v120);
    OUTLINED_FUNCTION_6_6(v71);
    sub_25C8EC360();
    swift_bridgeObjectRelease();
    os_log_type_t v72 = *(void (**)(void))(v105 + 8);
    OUTLINED_FUNCTION_11_0();
    v72();
    _os_log_impl(&dword_25C89B000, v66, v67, "Received direct invocation with identifier %s", v68, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();

    OUTLINED_FUNCTION_11_0();
    v73();
  }
  else
  {
    os_log_type_t v72 = *(void (**)(void))(v62 + 8);
    OUTLINED_FUNCTION_11_0();
    v72();

    v36(v49, v18);
  }
  type metadata accessor for SwitchProfileWrapperFlow();
  v120[0] = sub_25C8A4AC8();
  sub_25C8D6844();
  uint64_t v92 = sub_25C8EB2B0();
  swift_release();
  if (*(unsigned char *)(v108 + 160) == 1)
  {
    v120[0] = v92;
    sub_25C8D6894();
    uint64_t v57 = sub_25C8EB2B0();
    swift_release();
    OUTLINED_FUNCTION_11_0();
    v72();
  }
  else
  {
    OUTLINED_FUNCTION_11_0();
    v72();
    return v92;
  }
  return v57;
}

uint64_t sub_25C8D5DFC(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25C8EC0F0();
  uint64_t v27 = *(void *)(v4 - 8);
  uint64_t v28 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Signpost.OpenSignpost();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A5D9538 != -1) {
    swift_once();
  }
  (id)qword_26A5D9BE0;
  sub_25C8EC0B0();
  sub_25C8EC310();
  sub_25C8EC0A0();
  uint64_t v10 = &v9[*(int *)(v7 + 20)];
  *(void *)uint64_t v10 = "MakeFlow";
  *((void *)v10 + 1) = 8;
  *((_WORD *)v10 + 8) = 2;
  uint64_t v11 = a1[3];
  uint64_t v12 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v11);
  switch((*(unsigned __int8 (**)(uint64_t, uint64_t))(v12 + 48))(v11, v12))
  {
    case 1u:
      type metadata accessor for UserIdentifyIntent();
      id v13 = sub_25C8B4A6C(a1);
      __swift_project_boxed_opaque_existential_1((void *)(v2 + 80), *(void *)(v2 + 104));
      uint64_t v14 = sub_25C8DDA4C();
      goto LABEL_6;
    case 2u:
      uint64_t v15 = sub_25C8D62B4(a1);
      sub_25C8EC300();
      goto LABEL_8;
    case 3u:
      if (qword_26A5D95A0 != -1) {
        swift_once();
      }
      uint64_t v16 = v28;
      uint64_t v17 = __swift_project_value_buffer(v28, (uint64_t)qword_26A5DD588);
      uint64_t v18 = v27;
      (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v6, v17, v16);
      sub_25C8A7E98((uint64_t)a1, (uint64_t)v31);
      uint64_t v19 = sub_25C8EC0D0();
      os_log_type_t v20 = sub_25C8EC2E0();
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v21 = (uint8_t *)swift_slowAlloc();
        uint64_t v22 = swift_slowAlloc();
        uint64_t v30 = v22;
        *(_DWORD *)uint64_t v21 = 136315138;
        uint64_t v26 = v21 + 4;
        sub_25C8A7E98((uint64_t)v31, (uint64_t)v29);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9FC8);
        uint64_t v23 = sub_25C8EC180();
        v29[0] = sub_25C8BB4F0(v23, v24, &v30);
        sub_25C8EC360();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
        _os_log_impl(&dword_25C89B000, v19, v20, "Received unsupported intent: %s", v21, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x261198330](v22, -1, -1);
        MEMORY[0x261198330](v21, -1, -1);

        (*(void (**)(char *, uint64_t))(v18 + 8))(v6, v28);
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);

        (*(void (**)(char *, uint64_t))(v18 + 8))(v6, v16);
      }
      sub_25C8EC300();
      sub_25C8EC0A0();
      uint64_t v15 = 0;
      goto LABEL_15;
    default:
      type metadata accessor for UserIdentifyIntent();
      id v13 = sub_25C8B4A6C(a1);
      __swift_project_boxed_opaque_existential_1((void *)(v2 + 80), *(void *)(v2 + 104));
      uint64_t v14 = sub_25C8DDC9C();
LABEL_6:
      uint64_t v15 = v14;

      sub_25C8EC300();
LABEL_8:
      sub_25C8EC0A0();
LABEL_15:
      sub_25C89E920((uint64_t)v9);
      return v15;
  }
}

uint64_t sub_25C8D62B4(void *a1)
{
  uint64_t v31 = sub_25C8EC0F0();
  uint64_t v30 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  uint64_t v32 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9DC0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25C8EB490();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C8A7E98((uint64_t)a1, (uint64_t)v36);
  sub_25C8D6CDC(v1 + 120, (uint64_t)v35);
  sub_25C8A7E98(v1, (uint64_t)v34);
  sub_25C8DE698((uint64_t)v36, (uint64_t)v35, v34, &v37);
  int v11 = v40;
  sub_25C8D6D44((uint64_t)&v37);
  type metadata accessor for SwitchProfileIntent();
  uint64_t v29 = a1;
  id v12 = sub_25C8B4E38(a1);
  sub_25C8A7E98(v1 + 40, (uint64_t)&v37);
  uint64_t v33 = v39;
  __swift_project_boxed_opaque_existential_1(&v37, v38);
  sub_25C8EB400();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F6F900], v7);
  id v13 = objc_msgSend(v12, sel_typeName);
  sub_25C8EC170();

  uint64_t v14 = sub_25C8EB3A0();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v14);
  *(unsigned char *)(swift_allocObject() + 16) = v11;
  sub_25C8EB3F0();
  sub_25C8EB330();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v37);
  if (v11 == 3)
  {
    uint64_t v15 = v12;
    if (qword_26A5D95A0 != -1) {
      swift_once();
    }
    uint64_t v16 = v31;
    uint64_t v17 = __swift_project_value_buffer(v31, (uint64_t)qword_26A5DD588);
    uint64_t v18 = v30;
    uint64_t v19 = v32;
    (*(void (**)(char *, uint64_t, uint64_t))(v30 + 16))(v32, v17, v16);
    sub_25C8A7E98((uint64_t)v29, (uint64_t)&v37);
    os_log_type_t v20 = sub_25C8EC0D0();
    os_log_type_t v21 = sub_25C8EC2E0();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      v35[0] = v23;
      *(_DWORD *)uint64_t v22 = 136315138;
      sub_25C8A7E98((uint64_t)&v37, (uint64_t)v36);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9FC8);
      uint64_t v24 = sub_25C8EC180();
      v36[0] = sub_25C8BB4F0(v24, v25, v35);
      sub_25C8EC360();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v37);
      _os_log_impl(&dword_25C89B000, v20, v21, "makeFlow unsupported for %s", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261198330](v23, -1, -1);
      MEMORY[0x261198330](v22, -1, -1);

      (*(void (**)(char *, uint64_t))(v18 + 8))(v32, v16);
    }
    else
    {

      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v37);
      (*(void (**)(char *, uint64_t))(v18 + 8))(v19, v16);
    }
    return 0;
  }
  else
  {
    type metadata accessor for SwitchProfileWrapperFlow();
    *(void *)&long long v37 = sub_25C8A4AC8();
    sub_25C8D6844();
    uint64_t v26 = sub_25C8EB2B0();

    swift_release();
  }
  return v26;
}

uint64_t sub_25C8D67F0(uint64_t a1, uint64_t a2)
{
  return sub_25C8EB3E0();
}

unint64_t sub_25C8D6844()
{
  unint64_t result = qword_26A5D9BD0;
  if (!qword_26A5D9BD0)
  {
    type metadata accessor for SwitchProfileWrapperFlow();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5D9BD0);
  }
  return result;
}

unint64_t sub_25C8D6894()
{
  unint64_t result = qword_26A5DA340;
  if (!qword_26A5DA340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DA340);
  }
  return result;
}

uint64_t destroy for IdentityFlowProvider(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  if (*(void *)(a1 + 144))
  {
    return __swift_destroy_boxed_opaque_existential_1(a1 + 120);
  }
  return result;
}

uint64_t initializeWithCopy for IdentityFlowProvider(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 2sub_25C8B55A0(4, 3, 2, 4) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 6sub_25C8B55A0(4, 3, 2, 4) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  long long v6 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 10sub_25C8B55A0(4, 3, 2, 4) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 80, a2 + 80);
  uint64_t v7 = (_OWORD *)(a1 + 120);
  uint64_t v8 = (_OWORD *)(a2 + 120);
  uint64_t v9 = *(void *)(a2 + 144);
  if (v9)
  {
    uint64_t v10 = *(void *)(a2 + 152);
    *(void *)(a1 + 14sub_25C8B55A0(4, 3, 2, 4) = v9;
    *(void *)(a1 + 15sub_25C8B55A0(4, 3, 2, 2) = v10;
    (**(void (***)(_OWORD *, _OWORD *))(v9 - 8))(v7, v8);
  }
  else
  {
    long long v11 = *(_OWORD *)(a2 + 136);
    _OWORD *v7 = *v8;
    *(_OWORD *)(a1 + 136) = v11;
    *(void *)(a1 + 15sub_25C8B55A0(4, 3, 2, 2) = *(void *)(a2 + 152);
  }
  *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
  return a1;
}

uint64_t assignWithCopy for IdentityFlowProvider(uint64_t a1, uint64_t a2)
{
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 40), (uint64_t *)(a2 + 40));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 80), (uint64_t *)(a2 + 80));
  uint64_t v4 = *(void *)(a2 + 144);
  if (!*(void *)(a1 + 144))
  {
    if (v4)
    {
      *(void *)(a1 + 14sub_25C8B55A0(4, 3, 2, 4) = v4;
      *(void *)(a1 + 15sub_25C8B55A0(4, 3, 2, 2) = *(void *)(a2 + 152);
      (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 120, a2 + 120);
      goto LABEL_8;
    }
LABEL_7:
    long long v5 = *(_OWORD *)(a2 + 120);
    long long v6 = *(_OWORD *)(a2 + 136);
    *(void *)(a1 + 15sub_25C8B55A0(4, 3, 2, 2) = *(void *)(a2 + 152);
    *(_OWORD *)(a1 + 120) = v5;
    *(_OWORD *)(a1 + 136) = v6;
    goto LABEL_8;
  }
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 120);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 120), (uint64_t *)(a2 + 120));
LABEL_8:
  *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
  return a1;
}

void *__swift_memcpy161_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xA1uLL);
}

uint64_t assignWithTake for IdentityFlowProvider(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 3sub_25C8B55A0(4, 3, 2, 2) = *(void *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 7sub_25C8B55A0(4, 3, 2, 2) = *(void *)(a2 + 72);
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  long long v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(void *)(a1 + 11sub_25C8B55A0(4, 3, 2, 2) = *(void *)(a2 + 112);
  if (*(void *)(a1 + 144)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 120);
  }
  long long v6 = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = v6;
  *(void *)(a1 + 15sub_25C8B55A0(4, 3, 2, 2) = *(void *)(a2 + 152);
  *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
  return a1;
}

uint64_t getEnumTagSinglePayload for IdentityFlowProvider(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 161))
    {
      LODWORD(vsub_25C8B55A0(4, 3, 2, 2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(vsub_25C8B55A0(4, 3, 2, 2) = -1;
      }
    }
  }
  else
  {
    LODWORD(vsub_25C8B55A0(4, 3, 2, 2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IdentityFlowProvider(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 15sub_25C8B55A0(4, 3, 2, 2) = 0;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 10sub_25C8B55A0(4, 3, 2, 4) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 7sub_25C8B55A0(4, 3, 2, 2) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 2sub_25C8B55A0(4, 3, 2, 4) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 160) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 161) = 1;
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
      *(void *)(result + 2sub_25C8B55A0(4, 3, 2, 4) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 161) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IdentityFlowProvider()
{
  return &type metadata for IdentityFlowProvider;
}

uint64_t sub_25C8D6CDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA348);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C8D6D44(uint64_t a1)
{
  return a1;
}

uint64_t sub_25C8D6D98()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_25C8D6DA8(uint64_t a1)
{
  return sub_25C8D67F0(a1, *(unsigned __int8 *)(v1 + 16));
}

uint64_t OUTLINED_FUNCTION_6_6(uint64_t a1)
{
  *(void *)(v1 - 168) = a1;
  return v1 - 168;
}

uint64_t destroy for IdentityNLv4Intent()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for IdentityNLv4Intent(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 2sub_25C8B55A0(4, 3, 2, 4) = *(void *)(a2 + 24);
  *(void *)(a1 + 3sub_25C8B55A0(4, 3, 2, 2) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for IdentityNLv4Intent(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(void *)(a1 + 2sub_25C8B55A0(4, 3, 2, 4) = *(void *)(a2 + 24);
  *(void *)(a1 + 3sub_25C8B55A0(4, 3, 2, 2) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

__n128 __swift_memcpy57_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 3sub_25C8B55A0(4, 3, 2, 2) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for IdentityNLv4Intent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 2sub_25C8B55A0(4, 3, 2, 4) = *(void *)(a2 + 24);
  *(void *)(a1 + 3sub_25C8B55A0(4, 3, 2, 2) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for IdentityNLv4Intent(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 57))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 8);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(vsub_25C8B55A0(4, 3, 2, 3) = -1;
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

uint64_t storeEnumTagSinglePayload for IdentityNLv4Intent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 2sub_25C8B55A0(4, 3, 2, 4) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 56) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 57) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 57) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IdentityNLv4Intent()
{
  return &type metadata for IdentityNLv4Intent;
}

uint64_t sub_25C8D70A8()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25C8D70D8()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_25C8D70E0()
{
  return *(unsigned __int8 *)(v0 + 17);
}

uint64_t sub_25C8D70E8()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25C8D7118()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25C8D7148()
{
  return *(unsigned __int8 *)(v0 + 56);
}

BOOL sub_25C8D7150(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_25C8D715C()
{
  IdentityVerb.rawValue.getter();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  IdentityVerb.rawValue.getter();
  if (v1 == v5 && v3 == v4) {
    char v7 = 1;
  }
  else {
    char v7 = OUTLINED_FUNCTION_2_8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25C8D71D8()
{
  OUTLINED_FUNCTION_1_11();
  BOOL v2 = v2 && v0 == v1;
  if (v2) {
    char v3 = 1;
  }
  else {
    char v3 = OUTLINED_FUNCTION_2_8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25C8D7244()
{
  OUTLINED_FUNCTION_1_11();
  BOOL v2 = v2 && v0 == v1;
  if (v2) {
    char v3 = 1;
  }
  else {
    char v3 = OUTLINED_FUNCTION_2_8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25C8D72B0()
{
  return sub_25C8EC610();
}

uint64_t sub_25C8D7300()
{
  return sub_25C8EC610();
}

uint64_t sub_25C8D7348()
{
  return sub_25C8D7598();
}

uint64_t sub_25C8D7354()
{
  return sub_25C8EC610();
}

uint64_t sub_25C8D73AC()
{
  return sub_25C8EC610();
}

uint64_t sub_25C8D73F4()
{
  return OUTLINED_FUNCTION_0_9();
}

uint64_t sub_25C8D7414()
{
  IdentityVerb.rawValue.getter();
  sub_25C8EC1B0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C8D7468()
{
  sub_25C8EC1B0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C8D74BC()
{
  sub_25C8EC1B0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C8D7510()
{
  return sub_25C8EC600();
}

uint64_t sub_25C8D7548()
{
  return sub_25C8EC610();
}

uint64_t sub_25C8D7598()
{
  return sub_25C8EC610();
}

uint64_t sub_25C8D7600()
{
  return sub_25C8EC610();
}

uint64_t sub_25C8D7644()
{
  return sub_25C8EC610();
}

uint64_t sub_25C8D7690()
{
  return sub_25C8EC610();
}

uint64_t sub_25C8D76D4(uint64_t a1)
{
  if (a1 == 30) {
    int v1 = 2;
  }
  else {
    int v1 = 4;
  }
  if (a1 == 40) {
    int v2 = 3;
  }
  else {
    int v2 = v1;
  }
  if (a1 == 20) {
    unsigned int v3 = 1;
  }
  else {
    unsigned int v3 = v2;
  }
  if (a1 == 10) {
    return 0;
  }
  else {
    return v3;
  }
}

uint64_t sub_25C8D7708(unsigned __int8 a1)
{
  return 10 * a1 + 10;
}

uint64_t sub_25C8D771C()
{
  return sub_25C8D7354();
}

uint64_t sub_25C8D7724()
{
  return sub_25C8D7510();
}

uint64_t sub_25C8D772C()
{
  return sub_25C8D7548();
}

uint64_t sub_25C8D7734@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_25C8D76D4(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_25C8D7760@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C8D7708(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_25C8D778C()
{
  BYTE8(vsub_25C8B55A0(4, 3, 2, 2) = 0;
  sub_25C8EC3D0();
  sub_25C8EC1C0();
  *(void *)&long long v2 = *(unsigned __int8 *)(v0 + 16);
  sub_25C8EC460();
  sub_25C8EC1C0();
  swift_bridgeObjectRetain();
  sub_25C8EC1C0();
  swift_bridgeObjectRelease();
  sub_25C8EC1C0();
  return *(void *)((char *)&v2 + 1);
}

uint64_t sub_25C8D786C(char a1)
{
  unint64_t v2 = 0xD000000000000038;
  *(unsigned char *)(v1 + 16) = a1;
  unint64_t v3 = 0x800000025C8F1570;
  switch(a1)
  {
    case 1:
      unint64_t v2 = 0xD00000000000004CLL;
      uint64_t v4 = "IntentResolutionResult did not have the correct type of disambiguation items";
      goto LABEL_4;
    case 2:
      unint64_t v2 = 0xD00000000000003ELL;
      uint64_t v4 = "There is no account for the identifier from disambig selection";
LABEL_4:
      unint64_t v3 = (unint64_t)(v4 - 32) | 0x8000000000000000;
      break;
    case 3:
      unint64_t v3 = 0xED0000726F727245;
      unint64_t v2 = 0x206E776F6E6B6E55;
      break;
    default:
      break;
  }
  *(void *)(v1 + 2sub_25C8B55A0(4, 3, 2, 4) = v2;
  *(void *)(v1 + 3sub_25C8B55A0(4, 3, 2, 2) = v3;
  return v1;
}

uint64_t sub_25C8D7910()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t type metadata accessor for IdentityFlowError()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for IdentityFlowErrorCode(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25C8D7A38);
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

ValueMetadata *type metadata accessor for IdentityFlowErrorCode()
{
  return &type metadata for IdentityFlowErrorCode;
}

unint64_t sub_25C8D7A74()
{
  unint64_t result = qword_26A5DA350;
  if (!qword_26A5DA350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DA350);
  }
  return result;
}

uint64_t sub_25C8D7AD0()
{
  return sub_25C8D778C();
}

uint64_t OUTLINED_FUNCTION_0_9()
{
  return sub_25C8EC600();
}

uint64_t OUTLINED_FUNCTION_2_8()
{
  return sub_25C8EC550();
}

uint64_t OUTLINED_FUNCTION_3_7()
{
  return sub_25C8EC1B0();
}

uint64_t sub_25C8D7B64()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA358);
  MEMORY[0x270FA5388](v1 - 8);
  int v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA610);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_25C8EDD70;
  *(void *)(v4 + 3sub_25C8B55A0(4, 3, 2, 2) = v0;
  uint64_t v9 = v4;
  sub_25C8EC220();
  uint64_t v5 = v9;
  swift_retain();
  sub_25C8EBBD0();
  uint64_t v6 = sub_25C8EBBE0();
  __swift_storeEnumTagSinglePayload((uint64_t)v3, 0, 1, v6);
  MEMORY[0x261197300](v5, v3);
  swift_bridgeObjectRelease();
  sub_25C8D8164((uint64_t)v3);
  sub_25C8EBAB0();
  return swift_release();
}

uint64_t sub_25C8D7CEC@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v40 = a2;
  uint64_t v3 = sub_25C8EBA90();
  OUTLINED_FUNCTION_0_2();
  uint64_t v5 = v4;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  long long v11 = (char *)&v36 - v10;
  uint64_t v51 = sub_25C8EBA00();
  OUTLINED_FUNCTION_0_2();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_28_0();
  uint64_t v50 = v15;
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v36 - v17;
  uint64_t v19 = sub_25C8EB9C0();
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v47 = (char *)&v36 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_25C8EBA30();
  OUTLINED_FUNCTION_0_2();
  uint64_t v22 = v21;
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_28_0();
  uint64_t v46 = v24;
  MEMORY[0x270FA5388](v25);
  uint64_t v27 = (char *)&v36 - v26;
  if (!(a1 >> 62))
  {
    uint64_t v28 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v28) {
      goto LABEL_3;
    }
LABEL_15:
    swift_bridgeObjectRelease();
LABEL_16:
    sub_25C8EBA80();
    sub_25C8EBA70();
    sub_25C8EBA50();
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v9, v11, v3);
    sub_25C8EBA40();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v11, v3);
  }
  uint64_t v39 = v11;
  swift_bridgeObjectRetain();
  long long v11 = v39;
  uint64_t result = sub_25C8EC4F0();
  uint64_t v28 = result;
  if (!result) {
    goto LABEL_15;
  }
LABEL_3:
  if (v28 >= 1)
  {
    uint64_t v38 = v3;
    uint64_t v39 = v11;
    uint64_t v36 = v9;
    uint64_t v37 = v5;
    uint64_t v30 = 0;
    unint64_t v48 = a1;
    uint64_t v44 = (void (**)(uint64_t, char *, uint64_t))(v22 + 16);
    unint64_t v45 = a1 & 0xC000000000000001;
    uint64_t v42 = v13 + 32;
    uint64_t v43 = (void (**)(uint64_t, char *, uint64_t))(v13 + 16);
    uint64_t v41 = v13 + 8;
    uint64_t v31 = MEMORY[0x263F8EE78];
    do
    {
      if (v45) {
        MEMORY[0x261197B40](v30, v48);
      }
      else {
        swift_retain();
      }
      sub_25C8EBA20();
      sub_25C8D7B64();
      sub_25C8EBA10();
      sub_25C8EB9F0();
      (*v44)(v46, v27, v49);
      sub_25C8EB9E0();
      (*v43)(v50, v18, v51);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v31 = sub_25C8E2BD0(0, *(void *)(v31 + 16) + 1, 1, v31);
      }
      unint64_t v33 = *(void *)(v31 + 16);
      unint64_t v32 = *(void *)(v31 + 24);
      if (v33 >= v32 >> 1) {
        uint64_t v31 = sub_25C8E2BD0(v32 > 1, v33 + 1, 1, v31);
      }
      ++v30;
      *(void *)(v31 + 16) = v33 + 1;
      unint64_t v34 = v31
          + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80))
          + *(void *)(v13 + 72) * v33;
      uint64_t v35 = v51;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v13 + 32))(v34, v50, v51);
      swift_release();
      (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v35);
      (*(void (**)(char *, uint64_t))(v22 + 8))(v27, v49);
    }
    while (v28 != v30);
    swift_bridgeObjectRelease();
    uint64_t v5 = v37;
    uint64_t v3 = v38;
    long long v11 = v39;
    uint64_t v9 = v36;
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

uint64_t sub_25C8D8164(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA358);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C8D81C4(unint64_t a1)
{
  if (a1 >> 62)
  {
    OUTLINED_FUNCTION_3_8();
    uint64_t v12 = sub_25C8EC4F0();
    swift_bridgeObjectRelease();
    if (v12)
    {
      swift_bridgeObjectRetain();
      uint64_t v2 = sub_25C8EC4F0();
      swift_bridgeObjectRelease();
      goto LABEL_4;
    }
    return 23899;
  }
  if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    return 23899;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_4:
  if (!v2)
  {
LABEL_13:
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA368);
    sub_25C8C6DA8(&qword_26A5DA370, &qword_26A5DA368);
    sub_25C8EC140();
    swift_bridgeObjectRelease();
    sub_25C8EC1C0();
    swift_bridgeObjectRelease();
    sub_25C8EC1C0();
    return 592475;
  }
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t result = (uint64_t)sub_25C8D9238(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    uint64_t v4 = 0;
    do
    {
      if ((a1 & 0xC000000000000001) != 0) {
        MEMORY[0x261197B40](v4, a1);
      }
      else {
        id v5 = *(id *)(a1 + 8 * v4 + 32);
      }
      sub_25C8EC000();
      uint64_t v6 = sub_25C8EC180();
      uint64_t v8 = v7;
      unint64_t v10 = *(void *)(v13 + 16);
      unint64_t v9 = *(void *)(v13 + 24);
      if (v10 >= v9 >> 1) {
        sub_25C8D9238((char *)(v9 > 1), v10 + 1, 1);
      }
      ++v4;
      *(void *)(v13 + 16) = v10 + 1;
      uint64_t v11 = v13 + 16 * v10;
      *(void *)(v11 + 3sub_25C8B55A0(4, 3, 2, 2) = v6;
      *(void *)(v11 + 40) = v8;
    }
    while (v2 != v4);
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

uint64_t sub_25C8D83E4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA610);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_25C8EDD70;
  sub_25C8EC060();
  *(void *)(v0 + 3sub_25C8B55A0(4, 3, 2, 2) = sub_25C8EC050();
  sub_25C8EC220();
  return v0;
}

uint64_t sub_25C8D8458(uint64_t a1, uint64_t a2)
{
  v3[11] = a2;
  v3[12] = v2;
  uint64_t v4 = sub_25C8EC0F0();
  v3[13] = v4;
  v3[14] = *(void *)(v4 - 8);
  v3[15] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C8D8518, 0, 0);
}

uint64_t sub_25C8D8518()
{
  uint64_t v30 = v0;
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 112);
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v0 + 104);
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_26A5DD5A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_bridgeObjectRetain_n();
  id v5 = sub_25C8EC0D0();
  os_log_type_t v6 = sub_25C8EC2D0();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v9 = *(void *)(v0 + 112);
  uint64_t v8 = *(void *)(v0 + 120);
  uint64_t v10 = *(void *)(v0 + 104);
  uint64_t v11 = *(void *)(v0 + 88);
  if (v7)
  {
    uint64_t v28 = *(void *)(v0 + 120);
    os_log_type_t type = v6;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v29 = v26;
    *(_DWORD *)uint64_t v12 = 134218242;
    uint64_t v27 = v10;
    *(void *)(v0 + 7sub_25C8B55A0(4, 3, 2, 2) = sub_25C8D8A3C(v11);
    sub_25C8EC360();
    *(_WORD *)(v12 + 1sub_25C8B55A0(4, 3, 2, 2) = 2080;
    uint64_t v13 = swift_bridgeObjectRetain();
    unint64_t v14 = sub_25C8D9150(v13);
    swift_bridgeObjectRelease();
    uint64_t v15 = sub_25C8D81C4(v14);
    unint64_t v17 = v16;
    swift_release();
    *(void *)(v0 + 80) = sub_25C8BB4F0(v15, v17, &v29);
    sub_25C8EC360();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25C89B000, v5, type, "SwitchProfileDeviceResolutionStrategy.processDevices() Found %ld capable remote devices: %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x261198330](v26, -1, -1);
    MEMORY[0x261198330](v12, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v28, v27);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  uint64_t v18 = *(void *)(v0 + 96);
  long long v19 = *(_OWORD *)(v18 + 72);
  long long v20 = *(_OWORD *)(v18 + 88);
  long long v21 = *(_OWORD *)(v18 + 56);
  *(void *)(v0 + 6sub_25C8B55A0(4, 3, 2, 4) = *(void *)(v18 + 104);
  *(_OWORD *)(v0 + 3sub_25C8B55A0(4, 3, 2, 2) = v19;
  *(_OWORD *)(v0 + 48) = v20;
  *(_OWORD *)(v0 + 16) = v21;
  uint64_t v22 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v22;
  *uint64_t v22 = v0;
  v22[1] = sub_25C8D8814;
  uint64_t v23 = *(void *)(v0 + 88);
  return sub_25C89FB6C(v0 + 16, v23);
}

uint64_t sub_25C8D8814(uint64_t a1)
{
  *(void *)(*(void *)v1 + 136) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25C8D8914, 0, 0);
}

void sub_25C8D8914()
{
  unint64_t v1 = *(void *)(v0 + 136);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_25C8EC4F0();
    swift_bridgeObjectRelease();
    if (v5) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    id v2 = 0;
    uint64_t v4 = 3;
    goto LABEL_11;
  }
  if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_10;
  }
LABEL_3:
  if ((v1 & 0xC000000000000001) != 0)
  {
    id v2 = (id)MEMORY[0x261197B40](0, *(void *)(v0 + 136));
  }
  else
  {
    if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v2 = *(id *)(*(void *)(v0 + 136) + 32);
  }
  swift_bridgeObjectRelease();
  sub_25C8EBFF0();
  uint64_t v3 = sub_25C8EC080();
  if (sub_25C8EC080() >= v3) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }
LABEL_11:
  swift_task_dealloc();
  os_log_type_t v6 = *(void (**)(id, uint64_t))(v0 + 8);
  v6(v2, v4);
}

uint64_t sub_25C8D8A3C(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0) {
    return sub_25C8EC4A0();
  }
  else {
    return *(void *)(a1 + 16);
  }
}

uint64_t sub_25C8D8A5C()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25C8D8A98()
{
  sub_25C8D8A5C();
  return MEMORY[0x270FA0228](v0, 112, 7);
}

uint64_t type metadata accessor for SwitchProfileDeviceResolutionStrategy()
{
  return self;
}

char *sub_25C8D8AF0(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_10();
    __src = (char *)OUTLINED_FUNCTION_1_12();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

char *sub_25C8D8B64(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_25C8EC500();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_25C8D8BF8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_25C8D8C40(a1, a2, a3, (void (*)(void))type metadata accessor for UserAccount);
}

uint64_t sub_25C8D8C10(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_25C8D8C40(a1, a2, a3, MEMORY[0x263F6F8E8]);
}

uint64_t sub_25C8D8C28(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_25C8D8C40(a1, a2, a3, MEMORY[0x263F71570]);
}

uint64_t sub_25C8D8C40(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void))
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_10();
    uint64_t v9 = OUTLINED_FUNCTION_1_12();
    __break(1u);
    return MEMORY[0x270FA01D0](v9);
  }
  if (a3 < a1
    || (uint64_t result = ((uint64_t (*)(void))a4)(0), a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    a4(0);
    uint64_t v10 = OUTLINED_FUNCTION_4_10();
    return MEMORY[0x270FA01D8](v10);
  }
  else if (a3 != a1)
  {
    uint64_t v9 = OUTLINED_FUNCTION_4_10();
    return MEMORY[0x270FA01D0](v9);
  }
  return result;
}

uint64_t sub_25C8D8D44(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (BOOL v3 = a1 + 8 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_25C8EC500();
    __break(1u);
  }
  else
  {
    sub_25C8EC000();
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_25C8D8E40(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 16 * a2 > a1 ? (BOOL v3 = a1 + 16 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_25C8EC500();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_25C8D8F20(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_25C8D8F50(a1, a2, a3, (uint64_t (*)(void))type metadata accessor for UserAccount);
}

uint64_t sub_25C8D8F38(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_25C8D8F50(a1, a2, a3, MEMORY[0x263F6F8E8]);
}

uint64_t sub_25C8D8F50(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t (*a4)(void))
{
  if (a2 < 0
    || ((uint64_t v6 = *(void *)(*(void *)(a4(0) - 8) + 72) * a2, v7 = a3 + v6, v8 = a1 + v6, v7 > a1)
      ? (BOOL v9 = v8 > a3)
      : (BOOL v9 = 0),
        v9))
  {
    OUTLINED_FUNCTION_0_10();
    uint64_t result = sub_25C8EC500();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

unint64_t sub_25C8D9058(unint64_t result, char a2, uint64_t a3)
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

void *sub_25C8D907C(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_8;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  while (1)
  {
    if (v2 <= 0)
    {
      BOOL v3 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA610);
      BOOL v3 = (void *)swift_allocObject();
      _swift_stdlib_malloc_size(v3);
      OUTLINED_FUNCTION_2_9();
      void v3[2] = v2;
      v3[3] = v4;
    }
    swift_bridgeObjectRetain();
    sub_25C8D9524((uint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v5;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_8:
    OUTLINED_FUNCTION_3_8();
    uint64_t v2 = sub_25C8EC4F0();
    swift_bridgeObjectRelease();
    if (!v2) {
      return (void *)MEMORY[0x263F8EE78];
    }
  }
  return v3;
}

uint64_t sub_25C8D9150(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v2 = sub_25C8EC4A0();
    if (v2) {
      goto LABEL_3;
    }
    return MEMORY[0x263F8EE78];
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
LABEL_3:
  if (v2 <= 0)
  {
    BOOL v3 = (uint64_t *)MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA610);
    BOOL v3 = (uint64_t *)swift_allocObject();
    _swift_stdlib_malloc_size(v3);
    OUTLINED_FUNCTION_2_9();
    void v3[2] = v2;
    v3[3] = v4;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_25C8D980C(&v7, v3 + 4, v2, a1);
  uint64_t result = sub_25C8D9AB4();
  if (v5 == v2) {
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

char *sub_25C8D9238(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_25C8D9278(a1, a2, a3, *v3);
  *BOOL v3 = (uint64_t)result;
  return result;
}

size_t sub_25C8D9258(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_25C8D935C(a1, a2, a3, *v3);
  *BOOL v3 = result;
  return result;
}

char *sub_25C8D9278(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA378);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + sub_25C8B55A0(4, 3, 2, 2) = v8;
    *((void *)v10 + sub_25C8B55A0(4, 3, 2, 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25C8D8B64(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25C8D8E40((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

size_t sub_25C8D935C(size_t result, int64_t a2, char a3, uint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA390);
  uint64_t v10 = *(void *)(sub_25C8EB480() - 8);
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
  uint64_t v15 = *(void *)(sub_25C8EB480() - 8);
  unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v17 = (unint64_t)v13 + v16;
  unint64_t v18 = a4 + v16;
  if (v5)
  {
    sub_25C8D8C40(v18, v8, v17, MEMORY[0x263F6F8E8]);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25C8D8F50(v18, v8, v17, MEMORY[0x263F6F8E8]);
  }
  swift_release();
  return (size_t)v13;
}

uint64_t sub_25C8D9524(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_25C8EC4F0();
    size_t result = swift_bridgeObjectRelease();
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
      uint64_t v8 = sub_25C8EC4F0();
      size_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_25C8C6DA8(&qword_26A5DA388, &qword_26A5DA380);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA380);
            uint64_t v10 = sub_25C8D96D4(v13, i, a3);
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
        sub_25C8D8D44((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5);
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

void (*sub_25C8D96D4(void *a1, unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_25C8D9784(v6, a2, a3);
  return sub_25C8D973C;
}

void sub_25C8D973C(void *a1)
{
  unint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_25C8D9784(void *a1, unint64_t a2, uint64_t a3))(id *a1)
{
  unint64_t v6 = a3 & 0xC000000000000001;
  sub_25C8D9058(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6) {
    id v7 = (id)MEMORY[0x261197B40](a2, a3);
  }
  else {
    id v7 = *(id *)(a3 + 8 * a2 + 32);
  }
  *a1 = v7;
  return sub_25C8D9804;
}

void sub_25C8D9804(id *a1)
{
}

uint64_t sub_25C8D980C(unint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  if ((a4 & 0xC000000000000001) != 0)
  {
    uint64_t result = sub_25C8EC490();
    unint64_t v8 = 0;
    unint64_t v9 = 0;
    int64_t v10 = 0;
    unint64_t v11 = 0;
    unint64_t v12 = result | 0x8000000000000000;
    if (a2) {
      goto LABEL_3;
    }
LABEL_34:
    uint64_t v13 = 0;
LABEL_43:
    *a1 = v12;
    a1[1] = v8;
    a1[2] = v9;
    a1[3] = v10;
    a1[4] = v11;
    return v13;
  }
  uint64_t result = sub_25C8D9ABC(a4, v24);
  unint64_t v12 = v24[0];
  unint64_t v8 = v24[1];
  unint64_t v9 = v24[2];
  int64_t v10 = v24[3];
  unint64_t v11 = v24[4];
  if (!a2) {
    goto LABEL_34;
  }
LABEL_3:
  if (!a3)
  {
    uint64_t v13 = 0;
    goto LABEL_43;
  }
  if (a3 < 0) {
    goto LABEL_45;
  }
  unint64_t v21 = v9;
  uint64_t v13 = 0;
  int64_t v22 = (v9 + 64) >> 6;
  while (1)
  {
    if ((v12 & 0x8000000000000000) != 0)
    {
      if (!sub_25C8EC4B0()) {
        goto LABEL_42;
      }
      sub_25C8EC000();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      uint64_t v16 = v23;
      uint64_t result = swift_unknownObjectRelease();
      if (!v23) {
        goto LABEL_42;
      }
      goto LABEL_23;
    }
    if (v11)
    {
      unint64_t v14 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_22;
    }
    int64_t v17 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      break;
    }
    if (v17 >= v22)
    {
      unint64_t v11 = 0;
      goto LABEL_42;
    }
    unint64_t v18 = *(void *)(v8 + 8 * v17);
    if (v18) {
      goto LABEL_21;
    }
    int64_t v19 = v10 + 2;
    if (v10 + 2 >= v22)
    {
      unint64_t v11 = 0;
      ++v10;
      goto LABEL_42;
    }
    unint64_t v18 = *(void *)(v8 + 8 * v19);
    if (!v18)
    {
      if (v10 + 3 >= v22) {
        goto LABEL_39;
      }
      unint64_t v18 = *(void *)(v8 + 8 * (v10 + 3));
      if (v18)
      {
        int64_t v17 = v10 + 3;
        goto LABEL_21;
      }
      int64_t v19 = v10 + 4;
      if (v10 + 4 >= v22)
      {
        unint64_t v11 = 0;
        v10 += 3;
        goto LABEL_42;
      }
      unint64_t v18 = *(void *)(v8 + 8 * v19);
      if (!v18)
      {
        int64_t v17 = v10 + 5;
        if (v10 + 5 >= v22)
        {
LABEL_39:
          unint64_t v11 = 0;
          int64_t v10 = v19;
          goto LABEL_42;
        }
        unint64_t v18 = *(void *)(v8 + 8 * v17);
        if (!v18)
        {
          int64_t v20 = v10 + 6;
          while (v20 < v22)
          {
            unint64_t v18 = *(void *)(v8 + 8 * v20++);
            if (v18)
            {
              int64_t v17 = v20 - 1;
              goto LABEL_21;
            }
          }
          unint64_t v11 = 0;
          int64_t v10 = v22 - 1;
          goto LABEL_42;
        }
        goto LABEL_21;
      }
    }
    int64_t v17 = v19;
LABEL_21:
    unint64_t v11 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v10 = v17;
LABEL_22:
    uint64_t result = (uint64_t)*(id *)(*(void *)(v12 + 48) + 8 * v15);
    uint64_t v16 = result;
    if (!result) {
      goto LABEL_42;
    }
LABEL_23:
    ++v13;
    *a2++ = v16;
    if (v13 == a3)
    {
      uint64_t v13 = a3;
LABEL_42:
      unint64_t v9 = v21;
      goto LABEL_43;
    }
  }
  __break(1u);
LABEL_45:
  __break(1u);
  return result;
}

uint64_t sub_25C8D9AB4()
{
  return swift_release();
}

uint64_t sub_25C8D9ABC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
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

uint64_t OUTLINED_FUNCTION_1_12()
{
  return sub_25C8EC500();
}

uint64_t OUTLINED_FUNCTION_3_8()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_4_10()
{
  return v0;
}

uint64_t sub_25C8D9B78()
{
  OUTLINED_FUNCTION_6_1();
  v1[8] = v2;
  v1[9] = v0;
  v1[7] = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9F70);
  v1[10] = swift_task_alloc();
  uint64_t v4 = sub_25C8EB740();
  v1[11] = v4;
  OUTLINED_FUNCTION_1_2(v4);
  v1[12] = v5;
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  v1[15] = swift_task_alloc();
  uint64_t v6 = sub_25C8EC0F0();
  v1[16] = v6;
  OUTLINED_FUNCTION_1_2(v6);
  v1[17] = v7;
  v1[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C8D9C98, 0, 0);
}

uint64_t sub_25C8D9C98()
{
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[17];
  uint64_t v1 = v0[18];
  uint64_t v3 = v0[16];
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_26A5DD5A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_25C8EC0D0();
  os_log_type_t v6 = sub_25C8EC2D0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_25C89B000, v5, v6, "IdentifyUserIdentityHandleIntentStrategy.makeIntentHandledResponse()", v7, 2u);
    MEMORY[0x261198330](v7, -1, -1);
  }

  OUTLINED_FUNCTION_5_7();
  v8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA0F8);
  uint64_t v9 = (void *)sub_25C8EB830();
  id v10 = objc_msgSend(v9, sel_identity);
  v0[19] = v10;

  if (v10
    && (id v11 = objc_msgSend(v10, sel_isMultiUserContext)) != 0
    && (unint64_t v12 = v11, v13 = objc_msgSend(v11, sel_BOOLValue), v12, v13))
  {
    id v14 = objc_msgSend(v10, sel_fullConfidence);
    if (v14)
    {
      unint64_t v15 = v14;
      char v16 = objc_msgSend(v14, sel_BOOLValue);
    }
    else
    {
      char v16 = 0;
    }
    id v21 = objc_msgSend(v10, sel_setupInProgress);
    if (v21)
    {
      int64_t v22 = v21;
      char v23 = objc_msgSend(v21, sel_BOOLValue);
    }
    else
    {
      char v23 = 0;
    }
    uint64_t v24 = (void *)swift_task_alloc();
    v0[20] = v24;
    *uint64_t v24 = v0;
    v24[1] = sub_25C8D9F9C;
    uint64_t v25 = v0[14];
    return sub_25C8B4038(v25, v16, v23);
  }
  else
  {
    uint64_t v17 = *(void *)(v0[9] + 144);
    unint64_t v18 = (void *)swift_task_alloc();
    v0[22] = v18;
    *unint64_t v18 = v0;
    v18[1] = sub_25C8DA1EC;
    uint64_t v19 = v0[13];
    return sub_25C8B36C0(v19, v17);
  }
}

uint64_t sub_25C8D9F9C()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v3 = v2;
  *(void *)(v4 + 168) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v5 = sub_25C8DA43C;
  }
  else {
    uint64_t v5 = sub_25C8DA080;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_25C8DA080()
{
  uint64_t v2 = (void *)v0[19];
  OUTLINED_FUNCTION_12_5();
  uint64_t v3 = (uint64_t *)v0[7];
  uint64_t v4 = OUTLINED_FUNCTION_9_7();
  v5(v4);
  __swift_project_boxed_opaque_existential_1((void *)(v1 + 104), *(void *)(v1 + 128));
  sub_25C8EB430();
  sub_25C8DA56C((uint64_t)v2);
  uint64_t v6 = sub_25C8EB720();
  OUTLINED_FUNCTION_6_7(v6, v7, v8, v9, v10, v11, v12, v13, v20, v21, v22);
  OUTLINED_FUNCTION_4_11();
  uint64_t v14 = MEMORY[0x263F6FFF0];
  v3[3] = v15;
  v3[4] = v14;
  __swift_allocate_boxed_opaque_existential_1Tm(v3);
  OUTLINED_FUNCTION_3_9();
  swift_bridgeObjectRelease();

  sub_25C89F4B0(v1, &qword_26A5D9F80);
  sub_25C89F4B0((uint64_t)v2, &qword_26A5D9F70);
  uint64_t v16 = OUTLINED_FUNCTION_7_6();
  v17(v16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t sub_25C8DA1EC()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v3 = v2;
  *(void *)(v4 + 18sub_25C8B55A0(4, 3, 2, 4) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v5 = sub_25C8DA4D4;
  }
  else {
    uint64_t v5 = sub_25C8DA2D0;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_25C8DA2D0()
{
  uint64_t v2 = (void *)v0[19];
  OUTLINED_FUNCTION_12_5();
  uint64_t v3 = (uint64_t *)v0[7];
  uint64_t v4 = OUTLINED_FUNCTION_9_7();
  v5(v4);
  __swift_project_boxed_opaque_existential_1((void *)(v1 + 104), *(void *)(v1 + 128));
  sub_25C8EB430();
  sub_25C8DA56C((uint64_t)v2);
  uint64_t v6 = sub_25C8EB720();
  OUTLINED_FUNCTION_6_7(v6, v7, v8, v9, v10, v11, v12, v13, v20, v21, v22);
  OUTLINED_FUNCTION_4_11();
  uint64_t v14 = MEMORY[0x263F6FFF0];
  v3[3] = v15;
  v3[4] = v14;
  __swift_allocate_boxed_opaque_existential_1Tm(v3);
  OUTLINED_FUNCTION_3_9();
  swift_bridgeObjectRelease();

  sub_25C89F4B0(v1, &qword_26A5D9F80);
  sub_25C89F4B0((uint64_t)v2, &qword_26A5D9F70);
  uint64_t v16 = OUTLINED_FUNCTION_7_6();
  v17(v16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t sub_25C8DA43C()
{
  OUTLINED_FUNCTION_10_8();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25C8DA4D4()
{
  OUTLINED_FUNCTION_10_8();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25C8DA56C(uint64_t a1)
{
  uint64_t v2 = sub_25C8EBF80();
  OUTLINED_FUNCTION_0_2();
  uint64_t v36 = v3;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25C8EC0F0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v9 = v8;
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v35 - v14;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9A60);
  MEMORY[0x270FA5388](v16 - 8);
  unint64_t v18 = (char *)v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C8EBE50();
  if (sub_25C8EBE30())
  {
    sub_25C8EBE10();
    swift_release();
    sub_25C8EB7E0();
    swift_release();
    uint64_t v19 = sub_25C8EB5D0();
    uint64_t v20 = 0;
  }
  else
  {
    uint64_t v19 = sub_25C8EB5D0();
    uint64_t v20 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v18, v20, 1, v19);
  if (a1 && (sub_25C89EDE8((uint64_t)v18), v21))
  {
    uint64_t v22 = v21;
    if (qword_26A5D95A8 != -1) {
      swift_once();
    }
    uint64_t v23 = __swift_project_value_buffer(v7, (uint64_t)qword_26A5DD5A0);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v15, v23, v7);
    uint64_t v24 = sub_25C8EC0D0();
    os_log_type_t v25 = sub_25C8EC2D0();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_25C89B000, v24, v25, "Building views for user", v26, 2u);
      MEMORY[0x261198330](v26, -1, -1);
    }

    OUTLINED_FUNCTION_5_7();
    v27();
    sub_25C8A7E98(v35[1] + 104, (uint64_t)v37);
    sub_25C8EBF70();
    uint64_t v28 = sub_25C8EBF60();

    (*(void (**)(char *, uint64_t))(v36 + 8))(v6, v2);
  }
  else
  {
    if (qword_26A5D95A8 != -1) {
      swift_once();
    }
    uint64_t v29 = __swift_project_value_buffer(v7, (uint64_t)qword_26A5DD5A0);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v13, v29, v7);
    uint64_t v30 = sub_25C8EC0D0();
    os_log_type_t v31 = sub_25C8EC2E0();
    if (os_log_type_enabled(v30, v31))
    {
      unint64_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v32 = 0;
      _os_log_impl(&dword_25C89B000, v30, v31, "Not building views: Couldn't convert identity to contact", v32, 2u);
      MEMORY[0x261198330](v32, -1, -1);
    }

    OUTLINED_FUNCTION_5_7();
    v33();
    uint64_t v28 = MEMORY[0x263F8EE78];
  }
  sub_25C89F4B0((uint64_t)v18, &qword_26A5D9A60);
  return v28;
}

uint64_t type metadata accessor for IdentifyUserHandleIntentStrategy()
{
  return self;
}

uint64_t sub_25C8DA998(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for IdentifyUserHandleIntentStrategy();
  *uint64_t v8 = v4;
  v8[1] = sub_25C8AC380;
  return MEMORY[0x270F66378](a1, a2, v9, a4);
}

uint64_t sub_25C8DAA5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for IdentifyUserHandleIntentStrategy();
  *uint64_t v8 = v4;
  v8[1] = sub_25C8AC380;
  return MEMORY[0x270F66380](a1, a2, v9, a4);
}

uint64_t sub_25C8DAB20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for IdentifyUserHandleIntentStrategy();
  *uint64_t v8 = v4;
  v8[1] = sub_25C8AC380;
  return MEMORY[0x270F66358](a1, a2, v9, a4);
}

uint64_t sub_25C8DABE4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C8AC380;
  return sub_25C8D9B78();
}

uint64_t sub_25C8DAC90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for IdentifyUserHandleIntentStrategy();
  *uint64_t v8 = v4;
  v8[1] = sub_25C8AC380;
  return MEMORY[0x270F66370](a1, a2, v9, a4);
}

uint64_t sub_25C8DAD54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for IdentifyUserHandleIntentStrategy();
  *uint64_t v8 = v4;
  v8[1] = sub_25C8AC380;
  return MEMORY[0x270F66368](a1, a2, v9, a4);
}

uint64_t sub_25C8DAE18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for IdentifyUserHandleIntentStrategy();
  *uint64_t v8 = v4;
  v8[1] = sub_25C8ABDDC;
  return MEMORY[0x270F66348](a1, a2, v9, a4);
}

uint64_t sub_25C8DAEDC()
{
  uint64_t v1 = sub_25C8CEBA0();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return sub_25C8A41D8(v2, v0, v1);
}

unint64_t sub_25C8DAF64()
{
  unint64_t result = qword_26A5DA3A8[0];
  if (!qword_26A5DA3A8[0])
  {
    type metadata accessor for IdentifyUserHandleIntentStrategy();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A5DA3A8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_3_9()
{
  return sub_25C8EB610();
}

double OUTLINED_FUNCTION_4_11()
{
  double result = 0.0;
  *(_OWORD *)(v0 + 3sub_25C8B55A0(4, 3, 2, 2) = 0u;
  *(void *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_6_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  __swift_storeEnumTagSinglePayload(a11, 1, 1, a1);
  return sub_25C8EB9A0();
}

uint64_t OUTLINED_FUNCTION_7_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_9_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10_8()
{
  return swift_task_dealloc();
}

uint64_t sub_25C8DB0A4(uint64_t a1, uint64_t a2)
{
  type metadata accessor for BaseDialogProvider();
  uint64_t v4 = swift_allocObject();
  sub_25C8D2860(a2, (uint64_t)v7);
  uint64_t v5 = sub_25C8DC62C(v4, a1, (uint64_t)v7);
  sub_25C8DC838(a2);
  return v5;
}

uint64_t sub_25C8DB11C(uint64_t a1, uint64_t a2)
{
  v2[3] = a1;
  v2[4] = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA440);
  v2[5] = v3;
  OUTLINED_FUNCTION_1_2(v3);
  v2[6] = v4;
  v2[7] = swift_task_alloc();
  uint64_t v5 = sub_25C8EC0F0();
  v2[8] = v5;
  OUTLINED_FUNCTION_1_2(v5);
  v2[9] = v6;
  v2[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C8DB1F4, 0, 0);
}

uint64_t sub_25C8DB1F4()
{
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  uint64_t v4 = v0[7];
  uint64_t v3 = v0[8];
  uint64_t v5 = v0[5];
  uint64_t v6 = v0[6];
  uint64_t v7 = v0[4];
  uint64_t v8 = __swift_project_value_buffer(v3, (uint64_t)qword_26A5DD5A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v8, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v7, v5);
  uint64_t v9 = sub_25C8EC0D0();
  os_log_type_t v10 = sub_25C8EC2D0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 134217984;
    uint64_t v12 = (void *)sub_25C8EB830();
    id v13 = objc_msgSend(v12, sel_switchType);

    uint64_t v14 = OUTLINED_FUNCTION_7_7();
    v15(v14);
    v0[2] = v13;
    sub_25C8EC360();
    _os_log_impl(&dword_25C89B000, v9, v10, "SwitchProfileHandleIntentStrategy.makeIntentHandledResponse() called for %ld", v11, 0xCu);
    OUTLINED_FUNCTION_3();
  }
  else
  {
    uint64_t v16 = OUTLINED_FUNCTION_7_7();
    v17(v16);
  }

  unint64_t v18 = (uint64_t *)v0[3];
  (*(void (**)(void, void))(v0[9] + 8))(v0[10], v0[8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA610);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_25C8EDD70;
  *(void *)(v19 + 3sub_25C8B55A0(4, 3, 2, 2) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64F10]), sel_init);
  sub_25C8EC220();
  uint64_t v20 = sub_25C8EB9A0();
  uint64_t v21 = MEMORY[0x263F6FFF0];
  v18[3] = v20;
  v18[4] = v21;
  __swift_allocate_boxed_opaque_existential_1Tm(v18);
  sub_25C8EB990();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v22 = (uint64_t (*)(void))v0[1];
  return v22();
}

uint64_t sub_25C8DB490(uint64_t a1, uint64_t a2)
{
  v3[7] = a2;
  v3[8] = v2;
  v3[6] = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA440);
  v3[9] = v4;
  OUTLINED_FUNCTION_1_2(v4);
  v3[10] = v5;
  v3[11] = swift_task_alloc();
  v3[12] = swift_task_alloc();
  uint64_t v6 = sub_25C8EC0F0();
  v3[13] = v6;
  OUTLINED_FUNCTION_1_2(v6);
  v3[14] = v7;
  v3[15] = swift_task_alloc();
  unsigned char v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C8DB598, 0, 0);
}

uint64_t sub_25C8DB598()
{
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[14];
  uint64_t v3 = v0[12];
  uint64_t v5 = v0[9];
  uint64_t v4 = v0[10];
  uint64_t v6 = v0[7];
  __swift_project_value_buffer(v0[13], (uint64_t)qword_26A5DD5A0);
  uint64_t v7 = *(void (**)(uint64_t))(v2 + 16);
  v7(v1);
  uint64_t v56 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v56(v3, v6, v5);
  uint64_t v8 = sub_25C8EC0D0();
  os_log_type_t v9 = sub_25C8EC2D0();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v11 = (void (*)(uint64_t))v0[9];
  if (v10)
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 134217984;
    id v13 = (void *)sub_25C8EB830();
    id v14 = objc_msgSend(v13, sel_switchType);

    uint64_t v15 = OUTLINED_FUNCTION_5_8();
    v16(v15);
    v0[5] = v14;
    sub_25C8EC360();
    _os_log_impl(&dword_25C89B000, v8, v9, "SwitchProfileHandleIntentStrategy.makeFailureHandlingIntentResponse() called for %ld", v12, 0xCu);
    OUTLINED_FUNCTION_3();
  }
  else
  {
    uint64_t v17 = OUTLINED_FUNCTION_5_8();
    v18(v17);
  }

  uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v0[14] + 8);
  v19(v0[17], v0[13]);
  uint64_t v20 = (char *)sub_25C8EB820();
  uint64_t v21 = &v20[OBJC_IVAR___SwitchProfileIntentResponse_code];
  swift_beginAccess();
  uint64_t v22 = *(void *)v21;

  if (v22 == 101)
  {
    uint64_t v23 = v0[11];
    uint64_t v24 = v0[9];
    uint64_t v25 = v0[7];
    uint64_t v26 = (void *)sub_25C8EB830();
    sub_25C8DC5C0(v26, (SEL *)&selRef_homeUserId);
    uint64_t v28 = v27;
    swift_bridgeObjectRelease();
    v56(v23, v25, v24);
    if (v28)
    {
      uint64_t v29 = OUTLINED_FUNCTION_3_10();
      v11(v29);
    }
    else
    {
      uint64_t v39 = (void *)sub_25C8EB830();
      sub_25C8DC5C0(v39, (SEL *)&selRef_iCloudAltDSID);
      uint64_t v41 = v40;
      uint64_t v42 = OUTLINED_FUNCTION_3_10();
      v11(v42);
      swift_bridgeObjectRelease();
      if (!v41)
      {
        unint64_t v45 = (void *)sub_25C8EB830();
        id v46 = objc_msgSend(v45, sel_account);

        if (v46)
        {
          id v47 = objc_msgSend(v46, sel_displayString);

          sub_25C8EC170();
          uint64_t v43 = v48;

          goto LABEL_16;
        }
        uint64_t v49 = OUTLINED_FUNCTION_2_10();
        v7(v49);
        uint64_t v50 = sub_25C8EC0D0();
        os_log_type_t v51 = sub_25C8EC2E0();
        if (os_log_type_enabled(v50, v51))
        {
          *(_WORD *)swift_slowAlloc() = 0;
          OUTLINED_FUNCTION_21(&dword_25C89B000, v52, v53, "Missing name in resolved Account.");
          OUTLINED_FUNCTION_3();
        }
        uint64_t v54 = v0[16];
        uint64_t v55 = v0[13];

        v19(v54, v55);
      }
    }
    uint64_t v43 = 0;
LABEL_16:
    v0[18] = v43;
    uint64_t v44 = (void *)swift_task_alloc();
    v0[19] = v44;
    *uint64_t v44 = v0;
    v44[1] = sub_25C8DBACC;
    return sub_25C8B2C70();
  }
  uint64_t v30 = OUTLINED_FUNCTION_2_10();
  v7(v30);
  os_log_type_t v31 = sub_25C8EC0D0();
  os_log_type_t v32 = sub_25C8EC2E0();
  if (os_log_type_enabled(v31, v32))
  {
    *(_WORD *)swift_slowAlloc() = 0;
    OUTLINED_FUNCTION_21(&dword_25C89B000, v33, v34, "Hit an error case.");
    OUTLINED_FUNCTION_3();
  }
  uint64_t v35 = v0[15];
  uint64_t v36 = v0[13];

  v19(v35, v36);
  uint64_t v37 = (void *)swift_task_alloc();
  v0[21] = v37;
  *uint64_t v37 = v0;
  v37[1] = sub_25C8DBC1C;
  return sub_25C8B2144();
}

uint64_t sub_25C8DBACC()
{
  OUTLINED_FUNCTION_2_1();
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v5 = v4;
  *(void *)(v3 + 160) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_25C8DBDA4, 0, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v4 + 8);
    return v6();
  }
}

uint64_t sub_25C8DBC1C()
{
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_25C8DBDA4()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25C8DBE48()
{
  sub_25C8A8014(v0 + 16);

  return MEMORY[0x270FA0228](v0, 112, 7);
}

uint64_t type metadata accessor for SwitchProfileHandleIntentStrategy()
{
  return self;
}

uint64_t sub_25C8DBEAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for SwitchProfileHandleIntentStrategy();
  *uint64_t v8 = v4;
  v8[1] = sub_25C8DC898;
  return MEMORY[0x270F66378](a1, a2, v9, a4);
}

uint64_t sub_25C8DBF70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for SwitchProfileHandleIntentStrategy();
  *uint64_t v8 = v4;
  v8[1] = sub_25C8DC898;
  return MEMORY[0x270F66380](a1, a2, v9, a4);
}

uint64_t sub_25C8DC034(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for SwitchProfileHandleIntentStrategy();
  *uint64_t v8 = v4;
  v8[1] = sub_25C8DC898;
  return MEMORY[0x270F66358](a1, a2, v9, a4);
}

uint64_t sub_25C8DC0F8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25C8DC898;
  return sub_25C8DB11C(a1, a2);
}

uint64_t sub_25C8DC198(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for SwitchProfileHandleIntentStrategy();
  *uint64_t v8 = v4;
  v8[1] = sub_25C8DC898;
  return MEMORY[0x270F66370](a1, a2, v9, a4);
}

uint64_t sub_25C8DC25C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for SwitchProfileHandleIntentStrategy();
  *uint64_t v8 = v4;
  v8[1] = sub_25C8DC898;
  return MEMORY[0x270F66368](a1, a2, v9, a4);
}

uint64_t sub_25C8DC320(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25C8DC3CC;
  return sub_25C8DB490(a1, a2);
}

uint64_t sub_25C8DC3CC()
{
  OUTLINED_FUNCTION_2_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_25C8DC494()
{
  sub_25C8AB6A4();
  uint64_t v2 = v1;
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return sub_25C8A41D8(v3, v0, v2);
}

unint64_t sub_25C8DC51C()
{
  unint64_t result = qword_26A5DA400[0];
  if (!qword_26A5DA400[0])
  {
    type metadata accessor for SwitchProfileHandleIntentStrategy();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A5DA400);
  }
  return result;
}

uint64_t sub_25C8DC568()
{
  return sub_25C8EC360();
}

uint64_t sub_25C8DC590@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_25C8DC5C0(void *a1, SEL *a2)
{
  id v3 = [a1 *a2];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = sub_25C8EC170();

  return v4;
}

uint64_t sub_25C8DC62C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for BaseDialogProvider();
  v23[3] = v6;
  v23[4] = &off_2709F0150;
  v23[0] = a1;
  type metadata accessor for SwitchProfileHandleIntentStrategy();
  uint64_t v7 = swift_allocObject();
  uint64_t v8 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v23, v6);
  MEMORY[0x270FA5388](v8);
  BOOL v10 = (uint64_t *)((char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v11 + 16))(v10);
  uint64_t v12 = *v10;
  void v22[3] = v6;
  v22[4] = &off_2709F0150;
  v22[0] = v12;
  sub_25C8A7E98((uint64_t)v22, (uint64_t)v20);
  sub_25C8D2860(a3, (uint64_t)v19);
  sub_25C8A7E98((uint64_t)v20, (uint64_t)v21);
  sub_25C8D2860((uint64_t)v19, (uint64_t)&v16);
  if (v17)
  {
    sub_25C8DC838((uint64_t)v19);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
    sub_25C8A4290(&v16, (uint64_t)v18);
  }
  else
  {
    sub_25C8EB960();
    sub_25C8DC838((uint64_t)v19);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
    sub_25C8DC838((uint64_t)&v16);
  }
  sub_25C8A4290(v18, (uint64_t)&v21[5]);
  sub_25C8A7E98((uint64_t)&v21[5], (uint64_t)v18);
  type metadata accessor for LocUtil();
  uint64_t v13 = swift_allocObject();
  sub_25C8A4290(v18, v13 + 16);
  v21[10] = v13;
  sub_25C8DC838(a3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  memcpy((void *)(v7 + 16), v21, 0x58uLL);
  *(void *)(v7 + 10sub_25C8B55A0(4, 3, 2, 4) = a2;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  return v7;
}

uint64_t sub_25C8DC838(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9BD8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_2_10()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_10()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_8()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7_7()
{
  return v0;
}

ValueMetadata *type metadata accessor for IdentityFlowFactoryImpl()
{
  return &type metadata for IdentityFlowFactoryImpl;
}

uint64_t sub_25C8DC908@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v36 = a5;
  uint64_t v35 = a4;
  uint64_t v34 = a1;
  uint64_t v39 = a6;
  uint64_t v8 = sub_25C8EC0F0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A5D95A0 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v8, (uint64_t)qword_26A5DD588);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  id v13 = a2;
  id v14 = sub_25C8EC0D0();
  os_log_type_t v15 = sub_25C8EC2F0();
  BOOL v16 = os_log_type_enabled(v14, v15);
  uint64_t v38 = a3;
  uint64_t v37 = a2;
  if (v16)
  {
    id v33 = v13;
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    v43[0] = v18;
    *(_DWORD *)uint64_t v17 = 136315138;
    if (a2 && (uint64_t v19 = sub_25C8EBFE0(), v20))
    {
      unint64_t v21 = v20;
    }
    else
    {
      swift_bridgeObjectRelease();
      unint64_t v21 = 0xE500000000000000;
      uint64_t v19 = 0x3E6C696E3CLL;
    }
    v42[0] = sub_25C8BB4F0(v19, v21, v43);
    sub_25C8EC360();
    id v13 = v33;

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C89B000, v14, v15, "IdentityFlowProducers.switchProfileFlowProducers() remoteDevice: %s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261198330](v18, -1, -1);
    MEMORY[0x261198330](v17, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  type metadata accessor for SwitchProfileIntent();
  type metadata accessor for SwitchProfileIntentResponse();
  sub_25C8EB290();
  if (qword_26A5D9540 != -1) {
    swift_once();
  }
  sub_25C8EBF50();
  swift_allocObject();
  swift_bridgeObjectRetain();
  sub_25C8EBF40();
  sub_25C8EB220();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA450);
  sub_25C8EB260();
  type metadata accessor for SwitchProfileHandleIntentStrategy();
  uint64_t v22 = v38;
  sub_25C8D2860(v38, (uint64_t)v43);
  id v23 = v13;
  uint64_t v24 = v37;
  v43[0] = sub_25C8DB0A4((uint64_t)v37, (uint64_t)v43);
  sub_25C8DE504(&qword_26A5DA478, (void (*)(uint64_t))type metadata accessor for SwitchProfileHandleIntentStrategy);
  sub_25C8EB210();
  swift_release();
  sub_25C8EB250();
  sub_25C8A7E98(v34, (uint64_t)v43);
  sub_25C8D2860(v22, (uint64_t)v42);
  sub_25C8A7E98(v35, (uint64_t)v41);
  sub_25C8A7E98(v36, (uint64_t)v40);
  uint64_t v25 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v43, v43[3]);
  MEMORY[0x270FA5388](v25);
  uint64_t v27 = (uint64_t *)((char *)&v33 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v28 + 16))(v27);
  uint64_t v29 = *v27;
  id v30 = v23;
  uint64_t v31 = sub_25C8DE0E4(v29, v24, (uint64_t)v42, (uint64_t)v41, (uint64_t)v40);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
  v43[0] = v31;
  type metadata accessor for SwitchProfileDisambiguationStrategy();
  sub_25C8DE504(&qword_26A5DA480, (void (*)(uint64_t))type metadata accessor for SwitchProfileDisambiguationStrategy);
  sub_25C8EB230();
  swift_release();
  sub_25C8EB280();
  type metadata accessor for SwitchProfileUnsupportedValueFlowStrategy();
  sub_25C8D2860(v22, (uint64_t)v43);
  v43[0] = sub_25C8E3854((uint64_t)v43);
  sub_25C8DE504(&qword_26A5DA488, (void (*)(uint64_t))type metadata accessor for SwitchProfileUnsupportedValueFlowStrategy);
  sub_25C8EB240();
  swift_release();
  sub_25C8EB270();
  return swift_release();
}

uint64_t sub_25C8DCF70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C8EC0F0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v16[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A5D95A0 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_26A5DD588);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  uint64_t v9 = sub_25C8EC0D0();
  os_log_type_t v10 = sub_25C8EC2F0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_25C89B000, v9, v10, "IdentityFlowProducers.identifyUserProducers()", v11, 2u);
    MEMORY[0x261198330](v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (a1)
  {
    uint64_t v12 = a1;
  }
  else
  {
    sub_25C8EBE50();
    uint64_t v12 = sub_25C8C77C4();
  }
  type metadata accessor for UserIdentifyIntent();
  type metadata accessor for UserIdentifyIntentResponse();
  swift_retain();
  sub_25C8EB290();
  if (qword_26A5D9540 != -1) {
    swift_once();
  }
  sub_25C8EBF50();
  swift_allocObject();
  swift_bridgeObjectRetain();
  sub_25C8EBF40();
  sub_25C8EB220();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA498);
  sub_25C8EB260();
  sub_25C8D2860(a2, (uint64_t)v16);
  type metadata accessor for BaseDialogProvider();
  uint64_t v13 = swift_allocObject();
  v16[0] = sub_25C8DE404(v13, (uint64_t)v16, (void (*)(void))type metadata accessor for IdentifyUserHandleIntentStrategy);
  type metadata accessor for IdentifyUserHandleIntentStrategy();
  sub_25C8DE504(&qword_26A5DA4C0, (void (*)(uint64_t))type metadata accessor for IdentifyUserHandleIntentStrategy);
  sub_25C8EB210();
  swift_release();
  sub_25C8EB250();
  type metadata accessor for IdentifyUserUnsupportedValueFlowStrategy();
  sub_25C8D2860(a2, (uint64_t)v16);
  swift_retain();
  v16[0] = sub_25C8D0BD8((uint64_t)v16, v12);
  sub_25C8DE504(&qword_26A5DA4C8, (void (*)(uint64_t))type metadata accessor for IdentifyUserUnsupportedValueFlowStrategy);
  sub_25C8EB240();
  swift_release();
  sub_25C8EB270();
  swift_release();
  return swift_release();
}

uint64_t sub_25C8DD390(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_25C8EC0F0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v14[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A5D95A0 != -1) {
    swift_once();
  }
  uint64_t v7 = __swift_project_value_buffer(v3, (uint64_t)qword_26A5DD588);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  uint64_t v8 = sub_25C8EC0D0();
  os_log_type_t v9 = sub_25C8EC2F0();
  if (os_log_type_enabled(v8, v9))
  {
    os_log_type_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v10 = 0;
    _os_log_impl(&dword_25C89B000, v8, v9, "IdentityFlowProducers.establishUserProducers()", v10, 2u);
    MEMORY[0x261198330](v10, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  type metadata accessor for UserIdentifyIntent();
  type metadata accessor for UserIdentifyIntentResponse();
  sub_25C8EB290();
  if (qword_26A5D9540 != -1) {
    swift_once();
  }
  sub_25C8EBF50();
  swift_allocObject();
  swift_bridgeObjectRetain();
  sub_25C8EBF40();
  sub_25C8EB220();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA498);
  sub_25C8EB260();
  sub_25C8D2860(a2, (uint64_t)v14);
  type metadata accessor for BaseDialogProvider();
  uint64_t v11 = swift_allocObject();
  v14[0] = sub_25C8DE404(v11, (uint64_t)v14, (void (*)(void))type metadata accessor for EstablishUserHandleIntentStrategy);
  type metadata accessor for EstablishUserHandleIntentStrategy();
  sub_25C8DE504(&qword_26A5DA4E0, (void (*)(uint64_t))type metadata accessor for EstablishUserHandleIntentStrategy);
  sub_25C8EB210();
  swift_release();
  sub_25C8EB250();
  return swift_release();
}

uint64_t sub_25C8DD6D8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v28[1] = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA448);
  OUTLINED_FUNCTION_1_4();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_4_12();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA450);
  OUTLINED_FUNCTION_1_4();
  uint64_t v13 = v12;
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)v28 - v18;
  uint64_t v34 = 0;
  memset(v33, 0, sizeof(v33));
  uint64_t v20 = type metadata accessor for BaseDialogProvider();
  uint64_t v21 = swift_allocObject();
  v32[3] = v20;
  v32[4] = &off_2709F0150;
  v32[0] = v21;
  sub_25C8EB410();
  uint64_t v22 = sub_25C8EC020();
  uint64_t v23 = sub_25C8EC010();
  v30[3] = v22;
  v30[4] = MEMORY[0x263F75980];
  v30[0] = v23;
  sub_25C8DC908((uint64_t)v32, a4, (uint64_t)v33, (uint64_t)v31, (uint64_t)v30, (uint64_t)v19);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  sub_25C8DC838((uint64_t)v33);
  uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  uint64_t v29 = v11;
  v24(v17, v19, v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA458);
  OUTLINED_FUNCTION_1_1();
  sub_25C8EB2A0();
  *(void *)&v33[0] = a1;
  type metadata accessor for SwitchProfileFlowStrategy();
  sub_25C8DE504(&qword_26A5DA460, (void (*)(uint64_t))type metadata accessor for SwitchProfileFlowStrategy);
  swift_retain();
  swift_retain();
  sub_25C8EB5F0();
  if (qword_26A5D9540 != -1) {
    swift_once();
  }
  sub_25C8EBF50();
  OUTLINED_FUNCTION_1_1();
  swift_bridgeObjectRetain();
  sub_25C8EBF40();
  uint64_t v25 = sub_25C8EB5E0();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v4, v7);
  *(void *)&v33[0] = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA468);
  sub_25C8DE228(&qword_26A5DA470, &qword_26A5DA468);
  uint64_t v26 = OUTLINED_FUNCTION_9_8();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v19, v29);
  return v26;
}

uint64_t sub_25C8DDA4C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA490);
  OUTLINED_FUNCTION_1_4();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_4_12();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA498);
  OUTLINED_FUNCTION_1_4();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_6_8();
  MEMORY[0x270FA5388](v3);
  uint64_t v4 = OUTLINED_FUNCTION_3_11();
  sub_25C8DCF70(v4, v5);
  sub_25C8DC838((uint64_t)v15);
  type metadata accessor for IdentifyUserFlowStrategy();
  swift_allocObject();
  uint64_t v6 = OUTLINED_FUNCTION_1_13();
  v7(v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA4A0);
  OUTLINED_FUNCTION_1_1();
  sub_25C8EB2A0();
  v15[0] = v0;
  sub_25C8DE504(&qword_26A5DA4A8, (void (*)(uint64_t))type metadata accessor for IdentifyUserFlowStrategy);
  swift_retain();
  swift_retain();
  OUTLINED_FUNCTION_8_4();
  if (qword_26A5D9540 != -1) {
    swift_once();
  }
  sub_25C8EBF50();
  OUTLINED_FUNCTION_1_1();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_2_11();
  uint64_t v8 = OUTLINED_FUNCTION_10_9();
  swift_release();
  uint64_t v9 = OUTLINED_FUNCTION_7_8();
  v10(v9);
  v15[0] = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA4B0);
  sub_25C8DE228(&qword_26A5DA4B8, &qword_26A5DA4B0);
  uint64_t v11 = OUTLINED_FUNCTION_9_8();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v12 = OUTLINED_FUNCTION_11_5();
  v13(v12);
  return v11;
}

uint64_t sub_25C8DDC9C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA4D0);
  OUTLINED_FUNCTION_1_4();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_4_12();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA498);
  OUTLINED_FUNCTION_1_4();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_6_8();
  MEMORY[0x270FA5388](v3);
  uint64_t v4 = OUTLINED_FUNCTION_3_11();
  sub_25C8DD390(v4, v5);
  sub_25C8DC838((uint64_t)v15);
  type metadata accessor for EstablishUserFlowStrategy();
  swift_allocObject();
  uint64_t v6 = OUTLINED_FUNCTION_1_13();
  v7(v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA4A0);
  OUTLINED_FUNCTION_1_1();
  sub_25C8EB2A0();
  v15[0] = v0;
  sub_25C8DE504(&qword_26A5DA4D8, (void (*)(uint64_t))type metadata accessor for EstablishUserFlowStrategy);
  swift_retain();
  swift_retain();
  OUTLINED_FUNCTION_8_4();
  if (qword_26A5D9540 != -1) {
    swift_once();
  }
  sub_25C8EBF50();
  OUTLINED_FUNCTION_1_1();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_2_11();
  uint64_t v8 = OUTLINED_FUNCTION_10_9();
  swift_release();
  uint64_t v9 = OUTLINED_FUNCTION_7_8();
  v10(v9);
  v15[0] = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA4B0);
  sub_25C8DE228(&qword_26A5DA4B8, &qword_26A5DA4B0);
  uint64_t v11 = OUTLINED_FUNCTION_9_8();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v12 = OUTLINED_FUNCTION_11_5();
  v13(v12);
  return v11;
}

uint64_t sub_25C8DDEEC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v23[3] = type metadata accessor for BaseDialogProvider();
  v23[4] = &off_2709F0150;
  v23[0] = a1;
  *(void *)(a6 + 10sub_25C8B55A0(4, 3, 2, 4) = 0;
  sub_25C8A7E98((uint64_t)v23, (uint64_t)&v20);
  sub_25C8D2860(a3, (uint64_t)v19);
  sub_25C8A7E98((uint64_t)&v20, (uint64_t)__src);
  sub_25C8D2860((uint64_t)v19, (uint64_t)&v16);
  if (v17)
  {
    sub_25C8DC838((uint64_t)v19);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v20);
    sub_25C8A4290(&v16, (uint64_t)v18);
  }
  else
  {
    sub_25C8EB960();
    sub_25C8DC838((uint64_t)v19);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v20);
    sub_25C8DC838((uint64_t)&v16);
  }
  sub_25C8A4290(v18, (uint64_t)&__src[40]);
  sub_25C8A7E98((uint64_t)&__src[40], (uint64_t)v18);
  type metadata accessor for LocUtil();
  uint64_t v12 = swift_allocObject();
  sub_25C8A4290(v18, v12 + 16);
  *(void *)&__src[80] = v12;
  memcpy((void *)(a6 + 16), __src, 0x58uLL);
  uint64_t v13 = *(void **)(a6 + 104);
  *(void *)(a6 + 10sub_25C8B55A0(4, 3, 2, 4) = a2;
  id v14 = a2;

  sub_25C8A7E98(a4, a6 + 112);
  sub_25C8A7E98(a5, a6 + 152);
  sub_25C8D2860(a3, (uint64_t)&v20);
  if (v21)
  {

    __swift_destroy_boxed_opaque_existential_1(a5);
    __swift_destroy_boxed_opaque_existential_1(a4);
    sub_25C8DC838(a3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    sub_25C8A4290(&v20, (uint64_t)__src);
  }
  else
  {
    sub_25C8EB960();

    __swift_destroy_boxed_opaque_existential_1(a5);
    __swift_destroy_boxed_opaque_existential_1(a4);
    sub_25C8DC838(a3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    sub_25C8DC838((uint64_t)&v20);
  }
  sub_25C8A4290((long long *)__src, a6 + 192);
  return a6;
}

uint64_t sub_25C8DE0E4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v19 = type metadata accessor for BaseDialogProvider();
  long long v20 = &off_2709F0150;
  v18[0] = a1;
  type metadata accessor for SwitchProfileDisambiguationStrategy();
  uint64_t v10 = swift_allocObject();
  uint64_t v11 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v18, v19);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (void *)((char *)&v18[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v14 + 16))(v13);
  uint64_t v15 = sub_25C8DDEEC(*v13, a2, a3, a4, a5, v10);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  return v15;
}

uint64_t sub_25C8DE228(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_25C8DE278(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v16[3] = type metadata accessor for BaseDialogProvider();
  v16[4] = &off_2709F0150;
  v16[0] = a1;
  sub_25C8A7E98((uint64_t)v16, (uint64_t)&v13);
  sub_25C8D2860(a2, (uint64_t)v12);
  sub_25C8A7E98((uint64_t)&v13, (uint64_t)__src);
  sub_25C8D2860((uint64_t)v12, (uint64_t)&v9);
  if (v10)
  {
    sub_25C8DC838((uint64_t)v12);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
    sub_25C8A4290(&v9, (uint64_t)v11);
  }
  else
  {
    sub_25C8EB960();
    sub_25C8DC838((uint64_t)v12);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
    sub_25C8DC838((uint64_t)&v9);
  }
  sub_25C8A4290(v11, (uint64_t)&__src[40]);
  sub_25C8A7E98((uint64_t)&__src[40], (uint64_t)v11);
  type metadata accessor for LocUtil();
  uint64_t v6 = swift_allocObject();
  sub_25C8A4290(v11, v6 + 16);
  *(void *)&__src[80] = v6;
  memcpy((void *)(a3 + 16), __src, 0x58uLL);
  sub_25C8D2860(a2, (uint64_t)&v13);
  if (v14)
  {
    sub_25C8A4290(&v13, (uint64_t)__src);
  }
  else
  {
    sub_25C8EB960();
    sub_25C8DC838((uint64_t)&v13);
  }
  sub_25C8A4290((long long *)__src, a3 + 104);
  sub_25C8EBE50();
  uint64_t v7 = sub_25C8C77C4();
  sub_25C8DC838(a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  *(void *)(a3 + 14sub_25C8B55A0(4, 3, 2, 4) = v7;
  return a3;
}

uint64_t sub_25C8DE404(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v15 = type metadata accessor for BaseDialogProvider();
  long long v16 = &off_2709F0150;
  v14[0] = a1;
  a3(0);
  uint64_t v6 = swift_allocObject();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v14, v15);
  OUTLINED_FUNCTION_1_4();
  MEMORY[0x270FA5388](v7);
  long long v9 = (void *)((char *)&v14[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v10 + 16))(v9);
  uint64_t v11 = sub_25C8DE278(*v9, a2, v6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  return v11;
}

uint64_t sub_25C8DE504(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_1_13()
{
  uint64_t result = v0;
  *(void *)(v2 - 136) = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_2_11()
{
  return sub_25C8EBF40();
}

uint64_t OUTLINED_FUNCTION_3_11()
{
  *(void *)(v0 - 96) = 0;
  *(_OWORD *)(v0 - 128) = 0u;
  *(_OWORD *)(v0 - 11sub_25C8B55A0(4, 3, 2, 2) = 0u;
  return 0;
}

uint64_t OUTLINED_FUNCTION_7_8()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8_4()
{
  return sub_25C8EB5F0();
}

uint64_t OUTLINED_FUNCTION_9_8()
{
  return sub_25C8EB2B0();
}

uint64_t OUTLINED_FUNCTION_10_9()
{
  return sub_25C8EB5E0();
}

uint64_t OUTLINED_FUNCTION_11_5()
{
  return v0;
}

uint64_t sub_25C8DE698@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, _OWORD *a4@<X8>)
{
  uint64_t v8 = sub_25C8EC0F0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43[24] = 3;
  sub_25C8D6CDC(a2, (uint64_t)&v37);
  if (v38)
  {
    sub_25C8A4290(&v37, (uint64_t)&v39);
  }
  else
  {
    uint64_t v40 = &type metadata for IdentityFeatureFlagsProvider;
    uint64_t v41 = &protocol witness table for IdentityFeatureFlagsProvider;
    sub_25C8DEEE8((uint64_t)&v37);
  }
  sub_25C8A4290(&v39, (uint64_t)&v42);
  uint64_t v13 = *(void *)&v43[16];
  uint64_t v12 = *(void *)&v43[8];
  __swift_project_boxed_opaque_existential_1(&v42, *(uint64_t *)&v43[8]);
  char v14 = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8))(v12, v13);
  char v15 = sub_25C8DEDD4(a3);
  char v16 = v15;
  if (v14 & 1) != 0 && (v15)
  {
    OUTLINED_FUNCTION_1_14();
    uint64_t v17 = OUTLINED_FUNCTION_0_11();
    if (v18(v17) == 2)
    {
      OUTLINED_FUNCTION_1_14();
      uint64_t v19 = OUTLINED_FUNCTION_0_11();
      v20(v19);
      uint64_t v22 = v21;
      swift_bridgeObjectRelease();
      if (v22)
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)a3);
        sub_25C8DEEE8(a2);
        v43[24] = 0;
      }
      else
      {
        OUTLINED_FUNCTION_1_14();
        uint64_t v29 = OUTLINED_FUNCTION_0_11();
        uint64_t v31 = v30(v29);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)a3);
        sub_25C8DEEE8(a2);
        if (v31) {
          char v32 = 1;
        }
        else {
          char v32 = 2;
        }
        v43[24] = v32;
      }
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)a3);
      sub_25C8DEEE8(a2);
    }
  }
  else
  {
    uint64_t v36 = a2;
    if (qword_26A5D95A8 != -1) {
      swift_once();
    }
    uint64_t v23 = __swift_project_value_buffer(v8, (uint64_t)qword_26A5DD5A0);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v23, v8);
    uint64_t v24 = sub_25C8EC0D0();
    os_log_type_t v25 = sub_25C8EC2D0();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (_DWORD *)swift_slowAlloc();
      uint64_t v35 = a3;
      uint64_t v27 = v26;
      *uint64_t v26 = 67109376;
      LODWORD(v39) = v14 & 1;
      sub_25C8EC360();
      *((_WORD *)v27 + sub_25C8B55A0(4, 3, 2, 4) = 1024;
      LODWORD(v39) = v16 & 1;
      sub_25C8EC360();
      _os_log_impl(&dword_25C89B000, v24, v25, "Switch Profile feature not supported. feature enabled=%{BOOL}d isAllowedDevice=%{BOOL}d", (uint8_t *)v27, 0xEu);
      uint64_t v28 = v27;
      a3 = v35;
      MEMORY[0x261198330](v28, -1, -1);
    }

    __swift_destroy_boxed_opaque_existential_1((uint64_t)a3);
    sub_25C8DEEE8(v36);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  long long v33 = *(_OWORD *)v43;
  *a4 = v42;
  a4[1] = v33;
  *(_OWORD *)((char *)a4 + 25) = *(_OWORD *)&v43[9];
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

BOOL static UseCase.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t UseCase.hash(into:)()
{
  return sub_25C8EC600();
}

uint64_t UseCase.hashValue.getter()
{
  return sub_25C8EC610();
}

BOOL sub_25C8DEAA4(char *a1, char *a2)
{
  return static UseCase.__derived_enum_equals(_:_:)(*a1, *a2);
}

uint64_t sub_25C8DEAB0()
{
  return UseCase.hashValue.getter();
}

uint64_t sub_25C8DEAB8()
{
  return UseCase.hash(into:)();
}

uint64_t SwitchProfileUseCases.useCase.getter()
{
  return *(unsigned __int8 *)(v0 + 40);
}

uint64_t SwitchProfileUseCases.useCase.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 40) = result;
  return result;
}

uint64_t (*SwitchProfileUseCases.useCase.modify())()
{
  return nullsub_1;
}

unint64_t sub_25C8DEAF4()
{
  unint64_t result = qword_26A5DA4E8;
  if (!qword_26A5DA4E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DA4E8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for UseCase(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25C8DEC0CLL);
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

ValueMetadata *type metadata accessor for UseCase()
{
  return &type metadata for UseCase;
}

uint64_t initializeWithCopy for SwitchProfileUseCases(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 2sub_25C8B55A0(4, 3, 2, 4) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t assignWithCopy for SwitchProfileUseCases(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SwitchProfileUseCases(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 3sub_25C8B55A0(4, 3, 2, 2) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for SwitchProfileUseCases(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 41))
    {
      LODWORD(vsub_25C8B55A0(4, 3, 2, 2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(vsub_25C8B55A0(4, 3, 2, 2) = -1;
      }
    }
  }
  else
  {
    LODWORD(vsub_25C8B55A0(4, 3, 2, 2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SwitchProfileUseCases(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 2sub_25C8B55A0(4, 3, 2, 4) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 41) = 1;
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
      *(void *)(result + 2sub_25C8B55A0(4, 3, 2, 4) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 41) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SwitchProfileUseCases()
{
  return &type metadata for SwitchProfileUseCases;
}

uint64_t sub_25C8DEDD4(void *a1)
{
  uint64_t v2 = v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  char v4 = sub_25C8EB440();
  sub_25C8A7E98((uint64_t)a1, (uint64_t)v14);
  sub_25C8DEF48(v2, (uint64_t)v13);
  if (v4)
  {
    sub_25C8D6D44((uint64_t)v13);
    char v5 = 1;
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(v14, v14[3]);
    char v6 = sub_25C8EB450();
    sub_25C8DEF48((uint64_t)v13, (uint64_t)v10);
    if (v6)
    {
      uint64_t v7 = v11;
      uint64_t v8 = v12;
      __swift_project_boxed_opaque_existential_1(v10, v11);
      char v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 16))(v7, v8);
    }
    else
    {
      char v5 = 0;
    }
    sub_25C8D6D44((uint64_t)v13);
    sub_25C8D6D44((uint64_t)v10);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  return v5 & 1;
}

uint64_t sub_25C8DEEE8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA348);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C8DEF48(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_0_11()
{
  return v0;
}

void *OUTLINED_FUNCTION_1_14()
{
  return __swift_project_boxed_opaque_existential_1(v0, v0[3]);
}

uint64_t sub_25C8DEFB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9F08);
  MEMORY[0x270FA5388](v4 - 8);
  char v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25C8EC2B0();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v7);
  uint64_t v8 = (void *)swift_allocObject();
  void v8[2] = 0;
  v8[3] = 0;
  v8[4] = a1;
  v8[5] = a2;
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = &unk_26A5DA538;
  v9[5] = v8;
  sub_25C8E01FC((uint64_t)v6, (uint64_t)&unk_26A5DA548, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_25C8DF0BC()
{
  sub_25C8EBE50();
  uint64_t v1 = v0;
  uint64_t v2 = static SiriEnvironment.getUserIdentity()();
  if (v2)
  {
    uint64_t v3 = v2;
    *(void *)&v1[OBJC_IVAR____TtC20SiriIdentityInternal26EstablishUserIntentHandler_currentRequest] = sub_25C8C7980();
    *(void *)&v1[OBJC_IVAR____TtC20SiriIdentityInternal26EstablishUserIntentHandler_currentDevice] = sub_25C8C77C4();
    *(void *)&v1[OBJC_IVAR____TtC20SiriIdentityInternal26EstablishUserIntentHandler_userIdentity] = v3;
    swift_retain();

    v6.receiver = v1;
    v6.super_class = (Class)type metadata accessor for EstablishUserIntentHandler();
    id v4 = objc_msgSendSuper2(&v6, sel_init);
    swift_release();
    return (uint64_t)v4;
  }
  else
  {
    uint64_t result = sub_25C8EC4D0();
    __break(1u);
  }
  return result;
}

uint64_t EstablishUserIntentHandler.resolveIdentity(for:)()
{
  OUTLINED_FUNCTION_6_1();
  v1[3] = v2;
  v1[4] = v0;
  sub_25C8EBFC0();
  v1[5] = OUTLINED_FUNCTION_13();
  uint64_t v3 = sub_25C8EB5A0();
  v1[6] = v3;
  OUTLINED_FUNCTION_1_2(v3);
  v1[7] = v4;
  v1[8] = swift_task_alloc();
  v1[9] = swift_task_alloc();
  uint64_t v5 = sub_25C8EB5D0();
  v1[10] = v5;
  OUTLINED_FUNCTION_1_2(v5);
  v1[11] = v6;
  v1[12] = OUTLINED_FUNCTION_13();
  uint64_t v7 = sub_25C8EC0F0();
  v1[13] = v7;
  OUTLINED_FUNCTION_1_2(v7);
  v1[14] = v8;
  v1[15] = swift_task_alloc();
  v1[16] = swift_task_alloc();
  v1[17] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C8DF32C, 0, 0);
}

uint64_t sub_25C8DF32C()
{
  uint64_t v57 = v0;
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[14];
  uint64_t v52 = __swift_project_value_buffer(v0[13], (uint64_t)qword_26A5DD5A0);
  uint64_t v54 = *(void (**)(uint64_t))(v2 + 16);
  v54(v1);
  uint64_t v3 = sub_25C8EC0D0();
  os_log_type_t v4 = sub_25C8EC2D0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)OUTLINED_FUNCTION_5_0();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_25C89B000, v3, v4, "EstablishUserIntentHandler.resolveIdentity", v5, 2u);
    OUTLINED_FUNCTION_3();
  }
  uint64_t v6 = (void *)v0[3];
  uint64_t v7 = v0[17];
  uint64_t v8 = v0[13];
  uint64_t v9 = v0[14];

  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  v10(v7, v8);
  id v11 = objc_msgSend(v6, sel_identity);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v50 = v10;
    uint64_t v48 = v0[13];
    uint64_t v49 = v0[16];
    uint64_t v13 = v0[9];
    uint64_t v47 = v0[11];
    uint64_t v15 = v0[7];
    uint64_t v14 = v0[8];
    uint64_t v17 = v0[5];
    uint64_t v16 = v0[6];
    sub_25C8EB7E0();
    sub_25C8EB5B0();
    sub_25C8EB590();
    sub_25C8EB550();
    uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v18(v14, v16);
    v18(v13, v16);
    uint64_t v19 = *(void (**)(uint64_t))(v47 + 8);
    uint64_t v20 = OUTLINED_FUNCTION_14_2();
    v19(v20);
    uint64_t v21 = (void *)sub_25C8EC260();
    OUTLINED_FUNCTION_13_3((uint64_t)v21, sel_setFullConfidence_);

    sub_25C8EB800();
    uint64_t v22 = (void *)sub_25C8EC260();
    OUTLINED_FUNCTION_13_3((uint64_t)v22, sel_setSetupInProgress_);

    sub_25C8EBF90();
    sub_25C8EBFB0();
    sub_25C8CE7C0(v17);
    uint64_t v23 = (void *)sub_25C8EC260();
    OUTLINED_FUNCTION_13_3((uint64_t)v23, sel_setIsMultiUserContext_);

    sub_25C8EB7E0();
    sub_25C8D4E88();
    uint64_t v24 = OUTLINED_FUNCTION_14_2();
    v19(v24);
    os_log_type_t v25 = (void *)sub_25C8EC260();
    OUTLINED_FUNCTION_13_3((uint64_t)v25, sel_setIsIdentifiedOrUnsure_);

    ((void (*)(uint64_t, uint64_t, uint64_t))v54)(v49, v52, v48);
    uint64_t v26 = sub_25C8EC0D0();
    os_log_type_t v27 = sub_25C8EC2D0();
    if (OUTLINED_FUNCTION_23(v27))
    {
      uint64_t v28 = (uint8_t *)OUTLINED_FUNCTION_5_0();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl(&dword_25C89B000, v26, (os_log_type_t)v19, "EstablishUserIntentHandler.resolveIdentity returning success", v28, 2u);
      OUTLINED_FUNCTION_3();
    }
    uint64_t v29 = v0[16];
    uint64_t v30 = v0[13];

    v50(v29, v30);
    type metadata accessor for UserIdentifyIdentityResolutionResult();
    static IdentityResolutionResult.success(with:)((uint64_t)v12);
  }
  else
  {
    uint64_t v31 = (void *)v0[3];
    ((void (*)(void, uint64_t, void))v54)(v0[15], v52, v0[13]);
    id v32 = v31;
    long long v33 = sub_25C8EC0D0();
    os_log_type_t v34 = sub_25C8EC2D0();
    BOOL v35 = os_log_type_enabled(v33, v34);
    uint64_t v36 = v0[15];
    uint64_t v37 = v0[13];
    uint64_t v38 = (void *)v0[3];
    if (v35)
    {
      uint64_t v55 = v0[13];
      uint64_t v53 = v0[15];
      long long v39 = (uint8_t *)swift_slowAlloc();
      uint64_t v56 = swift_slowAlloc();
      *(_DWORD *)long long v39 = 136315138;
      id v40 = objc_msgSend(v38, sel_description);
      os_log_type_t v51 = v10;
      uint64_t v41 = sub_25C8EC170();
      unint64_t v43 = v42;

      v0[2] = sub_25C8BB4F0(v41, v43, &v56);
      sub_25C8EC360();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_25C89B000, v33, v34, "EstablishUserIntentHandler.resolveIdentity returning failure since Intent does not have Identity %s", v39, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();

      v51(v53, v55);
    }
    else
    {

      v10(v36, v37);
    }
    type metadata accessor for UserIdentifyIdentityResolutionResult();
    static UserIdentifyIdentityResolutionResult.unsupported(forReason:)(1);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v44 = OUTLINED_FUNCTION_4_5();
  return v45(v44);
}

uint64_t sub_25C8DF8D8(void *a1, void *aBlock, void *a3)
{
  void v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  a3;
  uint64_t v7 = (void *)swift_task_alloc();
  v3[5] = v7;
  void *v7 = v3;
  v7[1] = sub_25C8DF99C;
  return EstablishUserIntentHandler.resolveIdentity(for:)();
}

uint64_t sub_25C8DF99C()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_2_1();
  os_log_type_t v4 = (void (**)(void, void))v3[4];
  uint64_t v5 = (void *)v3[3];
  id v6 = (void *)v3[2];
  uint64_t v7 = *v0;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v8 = v7;
  swift_task_dealloc();

  ((void (**)(void, void *))v4)[2](v4, v2);
  _Block_release(v4);

  OUTLINED_FUNCTION_9_0();
  return v9();
}

uint64_t EstablishUserIntentHandler.confirm(intent:)()
{
  OUTLINED_FUNCTION_6_1();
  uint64_t v1 = sub_25C8EC0F0();
  v0[2] = v1;
  OUTLINED_FUNCTION_1_2(v1);
  v0[3] = v2;
  v0[4] = OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](sub_25C8DFB58, 0, 0);
}

uint64_t sub_25C8DFB58()
{
  OUTLINED_FUNCTION_12_1();
  if (qword_26A5D95B8 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(*(void *)(v0 + 16), (uint64_t)qword_26A5DD5D0);
  uint64_t v1 = OUTLINED_FUNCTION_19_4();
  v2(v1);
  uint64_t v3 = (void *)sub_25C8EC0D0();
  os_log_type_t v4 = sub_25C8EC2D0();
  if (OUTLINED_FUNCTION_23(v4))
  {
    *(_WORD *)OUTLINED_FUNCTION_5_0() = 0;
    OUTLINED_FUNCTION_21(&dword_25C89B000, v5, v6, "EstablishUserIntentHandler.confirm");
    OUTLINED_FUNCTION_3();
  }

  uint64_t v7 = OUTLINED_FUNCTION_23_0();
  v8(v7);
  id v9 = objc_allocWithZone((Class)type metadata accessor for UserIdentifyIntentResponse());
  UserIdentifyIntentResponse.init(code:userActivity:)(1, 0);
  swift_task_dealloc();
  uint64_t v10 = OUTLINED_FUNCTION_4_5();
  return v11(v10);
}

uint64_t sub_25C8DFC98(void *a1, void *aBlock, void *a3)
{
  void v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  id v7 = a3;
  uint64_t v8 = (void *)swift_task_alloc();
  v3[5] = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_25C8E0A10;
  return EstablishUserIntentHandler.confirm(intent:)();
}

uint64_t EstablishUserIntentHandler.handle(intent:)()
{
  OUTLINED_FUNCTION_6_1();
  uint64_t v1 = sub_25C8EC0F0();
  v0[2] = v1;
  OUTLINED_FUNCTION_1_2(v1);
  v0[3] = v2;
  v0[4] = OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](sub_25C8DFDDC, 0, 0);
}

uint64_t sub_25C8DFDDC()
{
  OUTLINED_FUNCTION_12_1();
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(*(void *)(v0 + 16), (uint64_t)qword_26A5DD5A0);
  uint64_t v1 = OUTLINED_FUNCTION_19_4();
  v2(v1);
  uint64_t v3 = (void *)sub_25C8EC0D0();
  os_log_type_t v4 = sub_25C8EC2D0();
  if (OUTLINED_FUNCTION_23(v4))
  {
    *(_WORD *)OUTLINED_FUNCTION_5_0() = 0;
    OUTLINED_FUNCTION_21(&dword_25C89B000, v5, v6, "EstablishUserIntentHandler.handle");
    OUTLINED_FUNCTION_3();
  }

  uint64_t v7 = OUTLINED_FUNCTION_23_0();
  v8(v7);
  id v9 = objc_allocWithZone((Class)type metadata accessor for UserIdentifyIntentResponse());
  UserIdentifyIntentResponse.init(code:userActivity:)(4, 0);
  swift_task_dealloc();
  uint64_t v10 = OUTLINED_FUNCTION_4_5();
  return v11(v10);
}

uint64_t sub_25C8DFF1C(void *a1, void *aBlock, void *a3)
{
  void v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  id v7 = a3;
  uint64_t v8 = (void *)swift_task_alloc();
  v3[5] = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_25C8E0A10;
  return EstablishUserIntentHandler.handle(intent:)();
}

id EstablishUserIntentHandler.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EstablishUserIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25C8E0064(uint64_t a1, uint64_t a2, int *a3)
{
  id v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  os_log_type_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *os_log_type_t v4 = v3;
  v4[1] = sub_25C8C41D8;
  return v6();
}

uint64_t sub_25C8E0130(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_25C8C41D8;
  return v7();
}

uint64_t sub_25C8E01FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C8EC2B0();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_25C8E0790(a1);
  }
  else
  {
    sub_25C8EC2A0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25C8EC270();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 2sub_25C8B55A0(4, 3, 2, 4) = a3;
  return swift_task_create();
}

uint64_t sub_25C8E0364(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25C8E0440;
  return v6(a1);
}

uint64_t sub_25C8E0440()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  return v3();
}

uint64_t type metadata accessor for EstablishUserIntentHandler()
{
  return self;
}

uint64_t sub_25C8E052C()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_7_9(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_25C8C41D8;
  uint64_t v3 = OUTLINED_FUNCTION_18_2();
  return v4(v3);
}

uint64_t sub_25C8E05C8()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = (int *)v0[4];
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_7_9(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_25C8C41D8;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_26A5DA530 + dword_26A5DA530);
  return v7(v1, v2, v3);
}

uint64_t objectdestroy_5Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25C8E06C8(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = (int *)v1[4];
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = (void *)OUTLINED_FUNCTION_7_9(v6);
  void *v7 = v8;
  v7[1] = sub_25C8C41D8;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_26A5DA540 + dword_26A5DA540);
  return v9(a1, v3, v4, v5);
}

uint64_t sub_25C8E0790(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9F08);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C8E07F0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25C8E0828()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v2 = v1;
  uint64_t v3 = *(int **)(v0 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_7_9(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_25C8A710C;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A5DA550 + dword_26A5DA550);
  return v7(v2, v3);
}

uint64_t sub_25C8E08DC()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_7_9(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_25C8C41D8;
  uint64_t v3 = OUTLINED_FUNCTION_18_2();
  return v4(v3);
}

uint64_t sub_25C8E0978()
{
  OUTLINED_FUNCTION_12_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_7_9(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_25C8A710C;
  uint64_t v3 = OUTLINED_FUNCTION_18_2();
  return v4(v3);
}

uint64_t OUTLINED_FUNCTION_7_9(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

id OUTLINED_FUNCTION_13_3(uint64_t a1, const char *a2)
{
  return objc_msgSend(v3, a2, v2);
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  return v0;
}

uint64_t sub_25C8E0A4C@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v76 = sub_25C8EC0F0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v69 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_24_1();
  uint64_t v75 = v7;
  sub_25C8EBA60();
  OUTLINED_FUNCTION_0_2();
  uint64_t v73 = v9;
  uint64_t v74 = v8;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_24_1();
  uint64_t v72 = v10;
  uint64_t v70 = sub_25C8EB720();
  OUTLINED_FUNCTION_0_2();
  uint64_t v67 = v11;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_28_0();
  uint64_t v66 = v13;
  MEMORY[0x270FA5388](v14);
  uint64_t v77 = (char *)&v66 - v15;
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA5D8);
  OUTLINED_FUNCTION_16();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_28_0();
  uint64_t v82 = v17;
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (uint64_t *)((char *)&v66 - v19);
  unint64_t v84 = a1;
  size_t v21 = sub_25C8E16B4(a1);
  uint64_t v22 = *(void *)(v21 + 16);
  size_t v71 = v21;
  swift_bridgeObjectRetain_n();
  uint64_t v23 = MEMORY[0x263F8EE78];
  uint64_t v68 = a2;
  if (v22)
  {
    uint64_t v24 = sub_25C8EB480();
    uint64_t v25 = 0;
    OUTLINED_FUNCTION_16();
    uint64_t v81 = *(void (**)(uint64_t, size_t, uint64_t))(v26 + 16);
    unint64_t v27 = (*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
    unint64_t v85 = *(uint8_t **)(v26 + 72);
    size_t v28 = v71 + v27;
    uint64_t v80 = v26 + 16;
    unint64_t v78 = v27;
    uint64_t v79 = (void (**)(uint64_t, uint64_t, uint64_t))(v26 + 32);
    while (1)
    {
      uint64_t v29 = v83;
      uint64_t v30 = v82 + *(int *)(v83 + 48);
      v81(v30, v28, v24);
      uint64_t v31 = (uint64_t)v20 + *(int *)(v29 + 48);
      *uint64_t v20 = v25;
      (*v79)(v31, v30, v24);
      uint64_t v32 = v22;
      uint64_t v33 = sub_25C8E1EB8(v25, v31, v22);
      sub_25C8A812C((uint64_t)v20, &qword_26A5DA5D8);
      int64_t v2 = *(void *)(v33 + 16);
      uint64_t v22 = *(void *)(v23 + 16);
      uint64_t v34 = v22 + v2;
      if (__OFADD__(v22, v2)) {
        break;
      }
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || v34 > *(void *)(v23 + 24) >> 1)
      {
        if (v22 <= v34) {
          int64_t v36 = v22 + v2;
        }
        else {
          int64_t v36 = v22;
        }
        uint64_t v23 = sub_25C8E299C(isUniquelyReferenced_nonNull_native, v36, 1, v23, &qword_26A5DA390, MEMORY[0x263F6F8E8], MEMORY[0x263F6F8E8], (void (*)(unint64_t, uint64_t, unint64_t))sub_25C8D8C10);
      }
      uint64_t v22 = v32;
      if (*(void *)(v33 + 16))
      {
        uint64_t v37 = *(void *)(v23 + 16);
        if ((*(void *)(v23 + 24) >> 1) - v37 < v2) {
          goto LABEL_43;
        }
        unint64_t v38 = v23 + v78 + v37 * (void)v85;
        if (v33 + v78 < v38 + v2 * (void)v85 && v38 < v33 + v78 + v2 * (void)v85) {
          goto LABEL_47;
        }
        swift_arrayInitWithCopy();
        if (v2)
        {
          uint64_t v40 = *(void *)(v23 + 16);
          BOOL v41 = __OFADD__(v40, v2);
          uint64_t v42 = v40 + v2;
          if (v41) {
            goto LABEL_44;
          }
          *(void *)(v23 + 16) = v42;
        }
      }
      else if (v2)
      {
        goto LABEL_42;
      }
      ++v25;
      swift_bridgeObjectRelease();
      v28 += (size_t)v85;
      if (v32 == v25) {
        goto LABEL_22;
      }
    }
    __break(1u);
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
  }
  else
  {
LABEL_22:
    uint64_t v43 = v71;
    swift_bridgeObjectRelease_n();
    v87[0] = v43;
    sub_25C8E2EC0(v23);
    sub_25C8E18C0();
    swift_bridgeObjectRelease();
    v87[0] = MEMORY[0x263F8EE78];
    uint64_t v33 = v84;
    if (!(v84 >> 62))
    {
      uint64_t v44 = *(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      goto LABEL_24;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v44 = sub_25C8EC4F0();
LABEL_24:
  OUTLINED_FUNCTION_4_13();
  if (!v44)
  {
    swift_bridgeObjectRelease();
    unint64_t v49 = MEMORY[0x263F8EE78];
LABEL_35:
    sub_25C8D7CEC(v49, v72);
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA5E0);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_25C8ED970;
    OUTLINED_FUNCTION_5_2();
    v50();
    sub_25C8EB6A0();
    if (qword_26A5D95A8 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v23, (uint64_t)qword_26A5DD5A0);
    OUTLINED_FUNCTION_5_2();
    v51();
    uint64_t v52 = sub_25C8EC0D0();
    os_log_type_t v53 = sub_25C8EC2D0();
    if (os_log_type_enabled(v52, v53))
    {
      uint64_t v54 = (uint8_t *)swift_slowAlloc();
      v87[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v54 = 136315138;
      unint64_t v85 = v54 + 4;
      uint64_t v55 = v77;
      swift_beginAccess();
      uint64_t v56 = v67;
      OUTLINED_FUNCTION_5_2();
      v57();
      uint64_t v58 = sub_25C8EC180();
      uint64_t v86 = sub_25C8BB4F0(v58, v59, (uint64_t *)v87);
      sub_25C8EC360();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C89B000, v52, v53, "NLContextUpdate for disambiguation: %s", v54, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();

      (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v75, v76);
      uint64_t v60 = OUTLINED_FUNCTION_5_9();
      v61(v60);
    }
    else
    {

      (*(void (**)(uint64_t *, uint64_t))(v2 + 8))(v20, v23);
      uint64_t v62 = OUTLINED_FUNCTION_5_9();
      v63(v62);
      uint64_t v56 = v67;
      uint64_t v55 = v77;
    }
    swift_beginAccess();
    OUTLINED_FUNCTION_5_2();
    v64();
    return (*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v55, v22);
  }
  if (v44 >= 1)
  {
    uint64_t v22 = 0;
    int64_t v2 = v33 & 0xC000000000000001;
    uint64_t v20 = (uint64_t *)MEMORY[0x263F72F10];
    do
    {
      if (v2) {
        id v45 = (id)MEMORY[0x261197B40](v22, v33);
      }
      else {
        id v45 = *(id *)(v33 + 8 * v22 + 32);
      }
      id v46 = v45;
      sub_25C8EBD80();
      swift_allocObject();
      sub_25C8EBD70();
      sub_25C8EBD00();
      swift_allocObject();
      uint64_t v23 = sub_25C8EBCF0();
      id v47 = objc_msgSend(v46, sel_displayString, v66);
      sub_25C8EC170();

      sub_25C8EBCE0();
      swift_bridgeObjectRelease();
      swift_retain();
      sub_25C8EBD60();
      swift_release();
      sub_25C8EBDB0();
      swift_allocObject();
      sub_25C8EBDA0();
      sub_25C8EBD50();

      swift_release();
      uint64_t v48 = swift_release();
      MEMORY[0x261197930](v48);
      if (*(void *)((v87[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v87[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_25C8EC230();
      }
      ++v22;
      sub_25C8EC250();
      sub_25C8EC220();
      uint64_t v33 = v84;
    }
    while (v44 != v22);
    swift_bridgeObjectRelease();
    unint64_t v49 = v87[0];
    OUTLINED_FUNCTION_4_13();
    goto LABEL_35;
  }
  __break(1u);
LABEL_47:
  OUTLINED_FUNCTION_0_10();
  uint64_t result = sub_25C8EC500();
  __break(1u);
  return result;
}

void sub_25C8E1340()
{
  qword_26A5DA580 = 0x797469746E656469;
  *(void *)algn_26A5DA588 = 0xEA00000000006449;
}

void sub_25C8E1368()
{
  algn_26A5DA598[5] = 0;
  *(_WORD *)&algn_26A5DA598[6] = -5120;
}

uint64_t sub_25C8E1394()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA378);
  uint64_t result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_25C8EF440;
  *(void *)(result + 3sub_25C8B55A0(4, 3, 2, 2) = 0x7473726966;
  *(void *)(result + 40) = 0xE500000000000000;
  *(void *)(result + 48) = 0x646E6F636573;
  *(void *)(result + 56) = 0xE600000000000000;
  *(void *)(result + 6sub_25C8B55A0(4, 3, 2, 4) = 0x6472696874;
  *(void *)(result + 7sub_25C8B55A0(4, 3, 2, 2) = 0xE500000000000000;
  *(void *)(result + 80) = 0x687472756F66;
  *(void *)(result + 88) = 0xE600000000000000;
  *(void *)(result + 96) = 0x6874666966;
  *(void *)(result + 10sub_25C8B55A0(4, 3, 2, 4) = 0xE500000000000000;
  *(void *)(result + 11sub_25C8B55A0(4, 3, 2, 2) = 0x6874786973;
  *(void *)(result + 120) = 0xE500000000000000;
  *(void *)(result + 128) = 0x68746E65766573;
  *(void *)(result + 136) = 0xE700000000000000;
  *(void *)(result + 14sub_25C8B55A0(4, 3, 2, 4) = 0x687468676965;
  *(void *)(result + 15sub_25C8B55A0(4, 3, 2, 2) = 0xE600000000000000;
  *(void *)(result + 160) = 0x68746E696ELL;
  *(void *)(result + 168) = 0xE500000000000000;
  *(void *)(result + 176) = 0x68746E6574;
  *(void *)(result + 18sub_25C8B55A0(4, 3, 2, 4) = 0xE500000000000000;
  *(void *)(result + 19sub_25C8B55A0(4, 3, 2, 2) = 0x68746E6576656C65;
  *(void *)(result + 200) = 0xE800000000000000;
  *(void *)(result + 208) = 0x6874666C657774;
  *(void *)(result + 216) = 0xE700000000000000;
  *(void *)(result + 22sub_25C8B55A0(4, 3, 2, 4) = 0x6E65657472696874;
  *(void *)(result + 23sub_25C8B55A0(4, 3, 2, 2) = 0xEA00000000006874;
  *(void *)(result + 240) = 0x6E65657472756F66;
  *(void *)(result + 248) = 0xEA00000000006874;
  *(void *)(result + 256) = 0x746E656574666966;
  *(void *)(result + 26sub_25C8B55A0(4, 3, 2, 4) = 0xE900000000000068;
  *(void *)(result + 27sub_25C8B55A0(4, 3, 2, 2) = 0x746E656574786973;
  *(void *)(result + 280) = 0xE900000000000068;
  *(void *)(result + 288) = 0x6565746E65766573;
  *(void *)(result + 296) = 0xEB0000000068746ELL;
  *(void *)(result + 30sub_25C8B55A0(4, 3, 2, 4) = 0x6E65657468676965;
  *(void *)(result + 31sub_25C8B55A0(4, 3, 2, 2) = 0xEA00000000006874;
  *(void *)(result + 320) = 0x6E656574656E696ELL;
  *(void *)(result + 328) = 0xEA00000000006874;
  *(void *)(result + 336) = 0x746569746E657774;
  *(void *)(result + 34sub_25C8B55A0(4, 3, 2, 4) = 0xE900000000000068;
  strcpy((char *)(result + 352), "twenty first");
  *(unsigned char *)(result + 365) = 0;
  *(_WORD *)(result + 366) = -5120;
  strcpy((char *)(result + 368), "twenty second");
  *(_WORD *)(result + 38sub_25C8B55A0(4, 3, 2, 2) = -4864;
  strcpy((char *)(result + 384), "twenty third");
  *(unsigned char *)(result + 397) = 0;
  *(_WORD *)(result + 398) = -5120;
  strcpy((char *)(result + 400), "twenty fourth");
  *(_WORD *)(result + 41sub_25C8B55A0(4, 3, 2, 4) = -4864;
  strcpy((char *)(result + 416), "twenty fifth");
  *(unsigned char *)(result + 429) = 0;
  *(_WORD *)(result + 430) = -5120;
  off_26A5DA5A0 = (_UNKNOWN *)result;
  return result;
}

void sub_25C8E15EC()
{
  qword_26A5DA5A8 = 1953718636;
  unk_26A5DA5B0 = 0xE400000000000000;
}

void sub_25C8E1608()
{
  unk_26A5DA5C5 = 0;
  unk_26A5DA5C6 = -5120;
}

void sub_25C8E1634()
{
  qword_26A5DA5C8 = 0x4C6F546472696874;
  unk_26A5DA5D0 = 0xEB00000000747361;
}

uint64_t sub_25C8E1660()
{
  return sub_25C8EB6C0();
}

size_t sub_25C8E16B4(unint64_t a1)
{
  uint64_t v16 = sub_25C8EB480();
  uint64_t v2 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v6 = MEMORY[0x263F8EE78];
    if (!v5) {
      return v6;
    }
    uint64_t v18 = MEMORY[0x263F8EE78];
    size_t result = sub_25C8D9258(0, v5 & ~(v5 >> 63), 0);
    if (v5 < 0) {
      break;
    }
    uint64_t v8 = 0;
    uint64_t v6 = v18;
    unint64_t v15 = a1 & 0xC000000000000001;
    unint64_t v9 = a1;
    while (v5 != v8)
    {
      if (v15) {
        id v10 = (id)MEMORY[0x261197B40](v8, a1);
      }
      else {
        id v10 = *(id *)(a1 + 8 * v8 + 32);
      }
      uint64_t v11 = v10;
      uint64_t v17 = v10;
      sub_25C8E1B74(&v17, (uint64_t)v4);

      uint64_t v18 = v6;
      unint64_t v13 = *(void *)(v6 + 16);
      unint64_t v12 = *(void *)(v6 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_25C8D9258(v12 > 1, v13 + 1, 1);
        uint64_t v6 = v18;
      }
      ++v8;
      *(void *)(v6 + 16) = v13 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(v6+ ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))+ *(void *)(v2 + 72) * v13, v4, v16);
      a1 = v9;
      if (v5 == v8) {
        return v6;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_25C8EC4F0();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_25C8E18C0()
{
  uint64_t v0 = sub_25C8EC0F0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v2 = v1;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v0, (uint64_t)qword_26A5DD5A0);
  OUTLINED_FUNCTION_5_2();
  v6();
  swift_bridgeObjectRetain_n();
  uint64_t v7 = sub_25C8EC0D0();
  os_log_type_t v8 = sub_25C8EC2D0();
  if (os_log_type_enabled(v7, v8))
  {
    unint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v20 = v18;
    uint64_t v17 = v9;
    *(_DWORD *)unint64_t v9 = 136315138;
    v16[1] = v9 + 4;
    uint64_t v10 = sub_25C8EB480();
    uint64_t v11 = swift_bridgeObjectRetain();
    uint64_t v12 = MEMORY[0x261197960](v11, v10);
    unint64_t v14 = v13;
    swift_bridgeObjectRelease();
    uint64_t v19 = sub_25C8BB4F0(v12, v14, &v20);
    sub_25C8EC360();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C89B000, v7, v8, "displayHints for makeDisambiguationUpdate: %s", v17, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v0);
  sub_25C8EB710();
  OUTLINED_FUNCTION_7_10();
  sub_25C8EB6E0();
  sub_25C8EB6C0();
  sub_25C8EB6B0();
  sub_25C8EB6D0();
  sub_25C8EB700();
  sub_25C8EB6F0();
  swift_bridgeObjectRetain();
  return sub_25C8EB690();
}

uint64_t sub_25C8E1B74@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  v23[1] = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5DA5F0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25C8EB4E0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  unint64_t v13 = (char *)v23 - v12;
  MEMORY[0x270FA5388](v11);
  unint64_t v15 = (char *)v23 - v14;
  uint64_t v16 = *a1;
  sub_25C8EB4D0();
  sub_25C8EB4D0();
  sub_25C8BBCB4(v16);
  uint64_t v18 = v17;
  swift_bridgeObjectRelease();
  if (v18)
  {
    if (qword_26A5D9570 != -1) {
      swift_once();
    }
    swift_bridgeObjectRetain();
    sub_25C8EB4A0();
    sub_25C8BBCB4(v16);
    sub_25C8EB4B0();
    sub_25C8EB4C0();
    if (qword_26A5D9578 != -1) {
      swift_once();
    }
    swift_bridgeObjectRetain();
    sub_25C8EB4A0();
    id v19 = objc_msgSend(v16, sel_displayString);
    sub_25C8EC170();

    sub_25C8EB4B0();
    sub_25C8EB4C0();
  }
  uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v20(v5, v15, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v6);
  v20(v10, v13, v6);
  sub_25C8EB460();
  size_t v21 = *(void (**)(char *, uint64_t))(v7 + 8);
  v21(v13, v6);
  return ((uint64_t (*)(char *, uint64_t))v21)(v15, v6);
}

uint64_t sub_25C8E1EB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_25C8EB480();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v37 = (char *)v7;
  uint64_t v38 = v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  BOOL v35 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  int64_t v36 = (char *)&v35 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  unint64_t v15 = (char *)&v35 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v35 - v16;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5DA5F0);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)&v35 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_25C8EB4E0();
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v35 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C8EB470();
  if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, v21) == 1)
  {
    sub_25C8A812C((uint64_t)v20, (uint64_t *)&unk_26A5DA5F0);
    uint64_t result = sub_25C8EC4D0();
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v24, v20, v21);
    if (qword_26A5D9580 != -1) {
      swift_once();
    }
    unint64_t v25 = (unint64_t)off_26A5DA5A0;
    if (*((void *)off_26A5DA5A0 + 2) <= a1)
    {
      a2 = MEMORY[0x263F8EE78];
      uint64_t v17 = v37;
      goto LABEL_9;
    }
    if (a1 < 0) {
      goto LABEL_36;
    }
    swift_bridgeObjectRetain();
    sub_25C8E2758((uint64_t)v24);
    swift_bridgeObjectRelease();
    a2 = sub_25C8E299C(0, 1, 1, MEMORY[0x263F8EE78], &qword_26A5DA390, MEMORY[0x263F6F8E8], MEMORY[0x263F6F8E8], (void (*)(unint64_t, uint64_t, unint64_t))sub_25C8D8C10);
    unint64_t v3 = *(void *)(a2 + 16);
    unint64_t v25 = *(void *)(a2 + 24);
    uint64_t v20 = (char *)(v3 + 1);
    if (v3 >= v25 >> 1) {
      goto LABEL_37;
    }
    while (1)
    {
      *(void *)(a2 + 16) = v20;
      uint64_t v26 = v17;
      uint64_t v17 = v37;
      (*(void (**)(unint64_t, char *, char *))(v38 + 32))(a2+ ((*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80))+ *(void *)(v38 + 72) * v3, v26, v37);
LABEL_9:
      unint64_t v25 = a3 - 3;
      if (!__OFSUB__(a3, 3)) {
        break;
      }
      __break(1u);
LABEL_36:
      __break(1u);
LABEL_37:
      a2 = sub_25C8E299C(v25 > 1, (int64_t)v20, 1, a2, &qword_26A5DA390, MEMORY[0x263F6F8E8], MEMORY[0x263F6F8E8], (void (*)(unint64_t, uint64_t, unint64_t))sub_25C8D8C10);
    }
    if (v25 == a1)
    {
      if (qword_26A5D9598 != -1) {
        swift_once();
      }
      sub_25C8E2758((uint64_t)v24);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        a2 = sub_25C8E299C(0, *(void *)(a2 + 16) + 1, 1, a2, &qword_26A5DA390, MEMORY[0x263F6F8E8], MEMORY[0x263F6F8E8], (void (*)(unint64_t, uint64_t, unint64_t))sub_25C8D8C10);
      }
      unint64_t v28 = *(void *)(a2 + 16);
      unint64_t v27 = *(void *)(a2 + 24);
      if (v28 >= v27 >> 1) {
        a2 = sub_25C8E299C(v27 > 1, v28 + 1, 1, a2, &qword_26A5DA390, MEMORY[0x263F6F8E8], MEMORY[0x263F6F8E8], (void (*)(unint64_t, uint64_t, unint64_t))sub_25C8D8C10);
      }
      *(void *)(a2 + 16) = v28 + 1;
      (*(void (**)(unint64_t, char *, char *))(v38 + 32))(a2+ ((*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80))+ *(void *)(v38 + 72) * v28, v15, v17);
    }
    if (a3 - 2 == a1)
    {
      if (qword_26A5D9590 != -1) {
        swift_once();
      }
      sub_25C8E2758((uint64_t)v24);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        a2 = sub_25C8E299C(0, *(void *)(a2 + 16) + 1, 1, a2, &qword_26A5DA390, MEMORY[0x263F6F8E8], MEMORY[0x263F6F8E8], (void (*)(unint64_t, uint64_t, unint64_t))sub_25C8D8C10);
      }
      unint64_t v30 = *(void *)(a2 + 16);
      unint64_t v29 = *(void *)(a2 + 24);
      if (v30 >= v29 >> 1) {
        a2 = sub_25C8E299C(v29 > 1, v30 + 1, 1, a2, &qword_26A5DA390, MEMORY[0x263F6F8E8], MEMORY[0x263F6F8E8], (void (*)(unint64_t, uint64_t, unint64_t))sub_25C8D8C10);
      }
      *(void *)(a2 + 16) = v30 + 1;
      (*(void (**)(unint64_t, char *, char *))(v38 + 32))(a2+ ((*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80))+ *(void *)(v38 + 72) * v30, v36, v17);
    }
    if (a3 - 1 == a1)
    {
      if (qword_26A5D9588 != -1) {
        swift_once();
      }
      uint64_t v31 = v35;
      sub_25C8E2758((uint64_t)v24);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        a2 = sub_25C8E299C(0, *(void *)(a2 + 16) + 1, 1, a2, &qword_26A5DA390, MEMORY[0x263F6F8E8], MEMORY[0x263F6F8E8], (void (*)(unint64_t, uint64_t, unint64_t))sub_25C8D8C10);
      }
      unint64_t v33 = *(void *)(a2 + 16);
      unint64_t v32 = *(void *)(a2 + 24);
      if (v33 >= v32 >> 1) {
        a2 = sub_25C8E299C(v32 > 1, v33 + 1, 1, a2, &qword_26A5DA390, MEMORY[0x263F6F8E8], MEMORY[0x263F6F8E8], (void (*)(unint64_t, uint64_t, unint64_t))sub_25C8D8C10);
      }
      *(void *)(a2 + 16) = v33 + 1;
      (*(void (**)(unint64_t, char *, char *))(v38 + 32))(a2+ ((*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80))+ *(void *)(v38 + 72) * v33, v31, v17);
    }
    (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
    return a2;
  }
  return result;
}

uint64_t sub_25C8E2758(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5DA5F0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25C8EB4E0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v14 - v10;
  sub_25C8EB4D0();
  sub_25C8EB4A0();
  swift_bridgeObjectRetain();
  sub_25C8EB4B0();
  sub_25C8EB4C0();
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v12(v4, a1, v5);
  __swift_storeEnumTagSinglePayload((uint64_t)v4, 0, 1, v5);
  v12(v9, (uint64_t)v11, v5);
  sub_25C8EB460();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v11, v5);
}

uint64_t sub_25C8E2954(char a1, int64_t a2, char a3, uint64_t a4)
{
  return sub_25C8E299C(a1, a2, a3, a4, &qword_26A5D9CD8, (uint64_t (*)(void))type metadata accessor for UserAccount, (uint64_t (*)(void))type metadata accessor for UserAccount, (void (*)(unint64_t, uint64_t, unint64_t))sub_25C8D8BF8);
}

uint64_t sub_25C8E299C(char a1, int64_t a2, char a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void), void (*a8)(unint64_t, uint64_t, unint64_t))
{
  if (a3)
  {
    unint64_t v13 = *(void *)(a4 + 24);
    uint64_t v14 = v13 >> 1;
    if ((uint64_t)(v13 >> 1) < a2)
    {
      if (v14 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_24;
      }
      uint64_t v14 = v13 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v13 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v14 = a2;
      }
    }
  }
  else
  {
    uint64_t v14 = a2;
  }
  uint64_t v15 = *(void *)(a4 + 16);
  if (v14 <= v15) {
    uint64_t v16 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v16 = v14;
  }
  if (!v16)
  {
    uint64_t v20 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v17 = *(void *)(a6(0) - 8);
  uint64_t v18 = *(void *)(v17 + 72);
  unint64_t v19 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  uint64_t v20 = (void *)swift_allocObject();
  size_t v21 = _swift_stdlib_malloc_size(v20);
  if (!v18 || (v21 - v19 == 0x8000000000000000 ? (BOOL v22 = v18 == -1) : (BOOL v22 = 0), v22))
  {
LABEL_24:
    OUTLINED_FUNCTION_0_10();
    uint64_t result = sub_25C8EC4C0();
    __break(1u);
    return result;
  }
  id v20[2] = v15;
  void v20[3] = 2 * ((uint64_t)(v21 - v19) / v18);
LABEL_19:
  uint64_t v23 = *(void *)(a6(0) - 8);
  unint64_t v24 = (*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  unint64_t v25 = (unint64_t)v20 + v24;
  if (a1)
  {
    a8(a4 + v24, v15, v25);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25C8E2C18(0, v15, v25, a4, a7);
  }
  return (uint64_t)v20;
}

uint64_t sub_25C8E2BD0(char a1, int64_t a2, char a3, uint64_t a4)
{
  return sub_25C8E299C(a1, a2, a3, a4, &qword_26A5DA5E8, MEMORY[0x263F71570], MEMORY[0x263F71570], (void (*)(unint64_t, uint64_t, unint64_t))sub_25C8D8C28);
}

uint64_t sub_25C8E2C18(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v13;
    }
  }
  OUTLINED_FUNCTION_0_10();
  uint64_t result = sub_25C8EC500();
  __break(1u);
  return result;
}

uint64_t sub_25C8E2D64(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = result;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (!result || v5 > *(void *)(v3 + 24) >> 1)
  {
    if (v4 <= v5) {
      int64_t v7 = v4 + v2;
    }
    else {
      int64_t v7 = v4;
    }
    uint64_t result = sub_25C8E299C(result, v7, 1, v3, &qword_26A5D9CD8, (uint64_t (*)(void))type metadata accessor for UserAccount, (uint64_t (*)(void))type metadata accessor for UserAccount, (void (*)(unint64_t, uint64_t, unint64_t))sub_25C8D8BF8);
    uint64_t v3 = result;
  }
  if (!*(void *)(v6 + 16))
  {
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = (*(void *)(v3 + 24) >> 1) - v8;
  uint64_t v10 = type metadata accessor for UserAccount();
  uint64_t v12 = *(void *)(v10 - 8);
  uint64_t result = v10 - 8;
  uint64_t v11 = v12;
  if (v9 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t result = sub_25C8D8F20(v6 + v13, v2, v3 + v13 + *(void *)(v11 + 72) * v8);
  if (!v2)
  {
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v14 = *(void *)(v3 + 16);
  BOOL v15 = __OFADD__(v14, v2);
  uint64_t v16 = v14 + v2;
  if (!v15)
  {
    *(void *)(v3 + 16) = v16;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_25C8E2EC0(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = result;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (!result || v5 > *(void *)(v3 + 24) >> 1)
  {
    if (v4 <= v5) {
      int64_t v7 = v4 + v2;
    }
    else {
      int64_t v7 = v4;
    }
    uint64_t result = sub_25C8E299C(result, v7, 1, v3, &qword_26A5DA390, MEMORY[0x263F6F8E8], MEMORY[0x263F6F8E8], (void (*)(unint64_t, uint64_t, unint64_t))sub_25C8D8C10);
    uint64_t v3 = result;
  }
  if (!*(void *)(v6 + 16))
  {
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = (*(void *)(v3 + 24) >> 1) - v8;
  uint64_t v10 = sub_25C8EB480();
  uint64_t v12 = *(void *)(v10 - 8);
  uint64_t result = v10 - 8;
  uint64_t v11 = v12;
  if (v9 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t result = sub_25C8D8F38(v6 + v13, v2, v3 + v13 + *(void *)(v11 + 72) * v8);
  if (!v2)
  {
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v14 = *(void *)(v3 + 16);
  BOOL v15 = __OFADD__(v14, v2);
  uint64_t v16 = v14 + v2;
  if (!v15)
  {
    *(void *)(v3 + 16) = v16;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t OUTLINED_FUNCTION_5_9()
{
  return *(void *)(v0 - 256);
}

unint64_t OUTLINED_FUNCTION_7_10()
{
  return 0xD00000000000001ALL;
}

uint64_t sub_25C8E3060(uint64_t a1, uint64_t a2)
{
  sub_25C8B47C4();
  swift_bridgeObjectRetain();
  id v4 = sub_25C8E3128(a1, a2, 0xD000000000000024, 0x800000025C8F1920);
  if (!v4) {
    return MEMORY[0x263F8EE78];
  }
  int64_t v5 = v4;
  sub_25C8EB390();
  sub_25C8EB360();
  sub_25C8EB380();
  swift_release();
  uint64_t v6 = sub_25C8EB370();

  swift_release();
  return v6;
}

id sub_25C8E3128(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = sub_25C8EC0F0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v35 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_4_0();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA608);
  MEMORY[0x270FA5388](v13 - 8);
  OUTLINED_FUNCTION_4_0();
  uint64_t v16 = v15 - v14;
  uint64_t v17 = sub_25C8EAFA0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v19 = v18;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_4_0();
  uint64_t v23 = v22 - v21;
  sub_25C8EAF90();
  if (__swift_getEnumTagSinglePayload(v16, 1, v17) == 1)
  {
    swift_bridgeObjectRelease();
    sub_25C8E351C(v16);
    if (qword_26A5D95A8 != -1) {
      swift_once();
    }
    uint64_t v24 = __swift_project_value_buffer(v7, (uint64_t)qword_26A5DD5A0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16))(v12, v24, v7);
    swift_bridgeObjectRetain();
    unint64_t v25 = sub_25C8EC0D0();
    os_log_type_t v26 = sub_25C8EC2E0();
    if (os_log_type_enabled(v25, v26))
    {
      unint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      uint64_t v36 = v28;
      *(_DWORD *)unint64_t v27 = 136315138;
      swift_bridgeObjectRetain();
      sub_25C8BB4F0(a3, a4, &v36);
      sub_25C8EC360();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25C89B000, v25, v26, "URL construction failed for %s", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261198330](v28, -1, -1);
      MEMORY[0x261198330](v27, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v12, v7);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 32))(v23, v16, v17);
    id v29 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
    sub_25C8E357C(a1, a2, v29);
    id v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64EE0]), sel_init);
    uint64_t v31 = (void *)sub_25C8EAF80();
    objc_msgSend(v30, sel_setPunchOutUri_, v31);

    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA610);
    uint64_t v32 = swift_allocObject();
    *(_OWORD *)(v32 + 16) = xmmword_25C8EDD70;
    *(void *)(v32 + 3sub_25C8B55A0(4, 3, 2, 2) = v30;
    uint64_t v36 = v32;
    sub_25C8EC220();
    sub_25C8C3FF4(v36, v29);

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v23, v17);
  }
  return v29;
}

uint64_t sub_25C8E351C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA608);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_25C8E357C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_25C8EC160();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setText_, v4);
}

uint64_t sub_25C8E35E0()
{
  sub_25C89F40C(v1);
  OUTLINED_FUNCTION_0_12();
  if (v0)
  {
    uint64_t result = sub_25C89F40C(v1);
    if (!v3)
    {
      __break(1u);
LABEL_14:
      __break(1u);
      return result;
    }
    uint64_t v4 = result;
    OUTLINED_FUNCTION_0_12();
    uint64_t v5 = HIBYTE(v0) & 0xF;
    if ((v0 & 0x2000000000000000) == 0) {
      uint64_t v5 = v4 & 0xFFFFFFFFFFFFLL;
    }
    if (v5) {
      return 0;
    }
  }
  sub_25C89F418(v1);
  OUTLINED_FUNCTION_0_12();
  if (!v0) {
    return 1;
  }
  uint64_t result = sub_25C89F418(v1);
  if (!v6) {
    goto LABEL_14;
  }
  uint64_t v7 = result;
  OUTLINED_FUNCTION_0_12();
  uint64_t v8 = HIBYTE(v0) & 0xF;
  if ((v0 & 0x2000000000000000) == 0) {
    uint64_t v8 = v7 & 0xFFFFFFFFFFFFLL;
  }
  return v8 == 0;
}

uint64_t OUTLINED_FUNCTION_0_12()
{
  return swift_bridgeObjectRelease();
}

id sub_25C8E36A8(void *a1)
{
  id v1 = a1;
  DeviceUnit.description.getter();

  uint64_t v2 = (void *)sub_25C8EC160();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t DeviceUnit.description.getter()
{
  return 0;
}

uint64_t sub_25C8E3854(uint64_t a1)
{
  type metadata accessor for BaseDialogProvider();
  uint64_t v2 = swift_allocObject();
  sub_25C8D2860(a1, (uint64_t)v5);
  uint64_t v3 = sub_25C8E443C(v2, (uint64_t)v5);
  sub_25C8DC838(a1);
  return v3;
}

uint64_t sub_25C8E38BC(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_25C8E38DC, 0, 0);
}

uint64_t sub_25C8E38DC()
{
  OUTLINED_FUNCTION_6_1();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5D9F90);
  uint64_t v1 = sub_25C8EB870();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_25C8E3948()
{
  OUTLINED_FUNCTION_6_1();
  v1[3] = v2;
  v1[4] = v0;
  v1[2] = v3;
  uint64_t v4 = sub_25C8EC0F0();
  v1[5] = v4;
  v1[6] = *(void *)(v4 - 8);
  v1[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C8E3A08, 0, 0);
}

uint64_t sub_25C8E3A08()
{
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[5];
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_26A5DD5A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_25C8EC0D0();
  os_log_type_t v6 = sub_25C8EC2D0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_25C89B000, v5, v6, "SwitchProfileUnsupportedValueFlowStrategy.makeUnsupportedValueOutput() called", v7, 2u);
    MEMORY[0x261198330](v7, -1, -1);
  }
  uint64_t v9 = v0[6];
  uint64_t v8 = v0[7];
  uint64_t v10 = v0[5];

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5D9F90);
  uint64_t v11 = (void *)sub_25C8EB880();
  id v12 = objc_msgSend(v11, sel_unsupportedReason);

  uint64_t v13 = SwitchProfileAccountUnsupportedReason.init(rawValue:)((uint64_t)v12);
  if (v14)
  {
LABEL_12:
    OUTLINED_FUNCTION_8_5();
    swift_task_alloc();
    OUTLINED_FUNCTION_20();
    v0[11] = v18;
    *uint64_t v18 = v19;
    v18[1] = sub_25C8E3FCC;
    OUTLINED_FUNCTION_6_9();
    return sub_25C8B2144();
  }
  switch(v13)
  {
    case 5:
      OUTLINED_FUNCTION_8_5();
      swift_task_alloc();
      OUTLINED_FUNCTION_20();
      v0[9] = v20;
      *uint64_t v20 = v21;
      v20[1] = sub_25C8E3E14;
      OUTLINED_FUNCTION_6_9();
      return sub_25C8B302C();
    case 4:
      OUTLINED_FUNCTION_8_5();
      swift_task_alloc();
      OUTLINED_FUNCTION_20();
      v0[10] = v22;
      *uint64_t v22 = v23;
      v22[1] = sub_25C8E3EF0;
      OUTLINED_FUNCTION_6_9();
      return sub_25C8B314C();
    case 3:
      OUTLINED_FUNCTION_8_5();
      swift_task_alloc();
      OUTLINED_FUNCTION_20();
      v0[8] = v15;
      void *v15 = v16;
      v15[1] = sub_25C8E3D38;
      OUTLINED_FUNCTION_6_9();
      return sub_25C8B2424();
    default:
      goto LABEL_12;
  }
}

uint64_t sub_25C8E3D38()
{
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_0_13();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_14();
  swift_task_dealloc();
  OUTLINED_FUNCTION_3_12();
  return v3();
}

uint64_t sub_25C8E3E14()
{
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_0_13();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_14();
  swift_task_dealloc();
  OUTLINED_FUNCTION_3_12();
  return v3();
}

uint64_t sub_25C8E3EF0()
{
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_0_13();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_14();
  swift_task_dealloc();
  OUTLINED_FUNCTION_3_12();
  return v3();
}

uint64_t sub_25C8E3FCC()
{
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_0_13();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_4_14();
  swift_task_dealloc();
  OUTLINED_FUNCTION_3_12();
  return v3();
}

uint64_t sub_25C8E40A8()
{
  sub_25C8A8014(v0 + 16);
  return MEMORY[0x270FA0228](v0, 104, 7);
}

uint64_t type metadata accessor for SwitchProfileUnsupportedValueFlowStrategy()
{
  return self;
}

uint64_t sub_25C8E4104()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C8ABDDC;
  return sub_25C8E3948();
}

uint64_t sub_25C8E41B0(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25C8AB010;
  return sub_25C8E38BC(a1);
}

uint64_t sub_25C8E4244(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for SwitchProfileUnsupportedValueFlowStrategy();
  *uint64_t v8 = v4;
  v8[1] = sub_25C8AC380;
  return MEMORY[0x270F664F0](a1, a2, v9, a4);
}

uint64_t sub_25C8E4308(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void v14[3] = type metadata accessor for BaseDialogProvider();
  void v14[4] = &off_2709F0150;
  v14[0] = a1;
  sub_25C8A7E98((uint64_t)v14, (uint64_t)v12);
  sub_25C8D2860(a2, (uint64_t)v11);
  sub_25C8A7E98((uint64_t)v12, (uint64_t)__src);
  sub_25C8D2860((uint64_t)v11, (uint64_t)&v8);
  if (v9)
  {
    sub_25C8DC838((uint64_t)v11);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    sub_25C8A4290(&v8, (uint64_t)v10);
  }
  else
  {
    sub_25C8EB960();
    sub_25C8DC838((uint64_t)v11);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    sub_25C8DC838((uint64_t)&v8);
  }
  sub_25C8A4290(v10, (uint64_t)&__src[5]);
  sub_25C8A7E98((uint64_t)&__src[5], (uint64_t)v10);
  type metadata accessor for LocUtil();
  uint64_t v6 = swift_allocObject();
  sub_25C8A4290(v10, v6 + 16);
  __src[10] = v6;
  sub_25C8DC838(a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  memcpy((void *)(a3 + 16), __src, 0x58uLL);
  return a3;
}

uint64_t sub_25C8E443C(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = type metadata accessor for BaseDialogProvider();
  char v14 = &off_2709F0150;
  v12[0] = a1;
  type metadata accessor for SwitchProfileUnsupportedValueFlowStrategy();
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v12, v13);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (void *)((char *)&v12[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v8 + 16))(v7);
  uint64_t v9 = sub_25C8E4308(*v7, a2, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v9;
}

uint64_t OUTLINED_FUNCTION_3_12()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_6_9()
{
  return *(void *)(v0 + 16);
}

uint64_t SwitchType.description.getter()
{
  return 0x3D65707974;
}

uint64_t sub_25C8E460C()
{
  return SwitchType.description.getter();
}

ValueMetadata *type metadata accessor for GuardedFlow()
{
  return &type metadata for GuardedFlow;
}

uint64_t sub_25C8E4624()
{
  uint64_t v1 = sub_25C8EC0F0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_4_1();
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v1, (uint64_t)qword_26A5DD5A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v0, v5, v1);
  uint64_t v6 = sub_25C8EC0D0();
  os_log_type_t v7 = sub_25C8EC2D0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_25C89B000, v6, v7, "GuardedFlow on | returning true", v8, 2u);
    MEMORY[0x261198330](v8, -1, -1);
  }

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  return 1;
}

uint64_t sub_25C8E477C(void (*a1)(void), uint64_t a2, uint64_t a3)
{
  v28[1] = a2;
  uint64_t v6 = sub_25C8EB680();
  OUTLINED_FUNCTION_0_2();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25C8EC0F0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_4_1();
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  uint64_t v16 = __swift_project_value_buffer(v12, (uint64_t)qword_26A5DD5A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v3, v16, v12);
  uint64_t v17 = sub_25C8EC0D0();
  os_log_type_t v18 = sub_25C8EC2D0();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    v28[0] = v11;
    uint64_t v20 = v8;
    uint64_t v21 = v6;
    uint64_t v22 = a3;
    uint64_t v23 = a1;
    uint64_t v24 = v19;
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_25C89B000, v17, v18, "GuardedFlow executing | executing flow with guards", v19, 2u);
    unint64_t v25 = v24;
    a1 = v23;
    a3 = v22;
    uint64_t v6 = v21;
    uint64_t v8 = v20;
    uint64_t v11 = (char *)v28[0];
    MEMORY[0x261198330](v25, -1, -1);
  }

  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v3, v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA650);
  sub_25C8EB200();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_25C8ED970;
  sub_25C8EB1F0();
  uint64_t v26 = sub_25C8EB030();
  swift_bridgeObjectRelease();
  void v28[2] = v26;
  uint64_t v29 = a3;
  sub_25C8EB1D0();
  sub_25C8EB1E0();
  uint64_t v29 = sub_25C8EB2F0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA658);
  sub_25C8E4D10();
  sub_25C8EB650();
  swift_release();
  a1(v11);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v6);
}

uint64_t sub_25C8E4AAC()
{
  return 1;
}

uint64_t sub_25C8E4AC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_25C8E4B78;
  return MEMORY[0x270F66CE0](a1, a2, a3);
}

uint64_t sub_25C8E4B78(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1();
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_25C8E4C50(void (*a1)(void), uint64_t a2)
{
  return sub_25C8E477C(a1, a2, *v2);
}

uint64_t sub_25C8E4C58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_25C8A3ED0;
  return MEMORY[0x270F66CD0](a1, a2, a3);
}

unint64_t sub_25C8E4D10()
{
  unint64_t result = qword_26A5DA660;
  if (!qword_26A5DA660)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5DA658);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A5DA660);
  }
  return result;
}

double sub_25C8E4D64@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_25C8E72CC(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 32 * v6;
    sub_25C8BC554(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

uint64_t sub_25C8E4DCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_25C8E72CC(a1, a2), (v7 & 1) != 0))
  {
    unint64_t v8 = v6;
    uint64_t v9 = *(void *)(a3 + 56);
    uint64_t v10 = type metadata accessor for UserAccount();
    sub_25C8E7534(v9 + *(void *)(*(void *)(v10 - 8) + 72) * v8, a4);
    uint64_t v11 = a4;
    uint64_t v12 = 0;
    uint64_t v13 = 1;
    uint64_t v14 = v10;
  }
  else
  {
    type metadata accessor for UserAccount();
    uint64_t v11 = OUTLINED_FUNCTION_21_4();
  }
  return __swift_storeEnumTagSinglePayload(v11, v12, v13, v14);
}

uint64_t sub_25C8E4E70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_25C8E72CC(a1, a2), (v3 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

uint64_t sub_25C8E4EB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  return OUTLINED_FUNCTION_2_2((uint64_t)sub_25C8E4ED0);
}

uint64_t sub_25C8E4ED0()
{
  OUTLINED_FUNCTION_6_1();
  uint64_t v1 = sub_25C8EC130();
  v0[6] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[7] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_25C8E4F98;
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[2];
  uint64_t v5 = v0[3];
  return sub_25C8CFE1C(v4, v5, v3, v1);
}

uint64_t sub_25C8E4F98()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_4_4();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_3_1();
  *unint64_t v6 = v5;
  *(void *)(v3 + 6sub_25C8B55A0(4, 3, 2, 4) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_15();
    return MEMORY[0x270FA2498](v7, v8, v9);
  }
  else
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_9_0();
    return v10();
  }
}

uint64_t sub_25C8E5098()
{
  OUTLINED_FUNCTION_6_1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9_0();
  return v0();
}

uint64_t sub_25C8E50F4()
{
  uint64_t v0 = sub_25C8EC510();
  swift_bridgeObjectRelease();
  if (v0 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (v0) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t sub_25C8E5148@<X0>(uint64_t a1@<X8>)
{
  uint64_t v65 = a1;
  sub_25C8EB940();
  OUTLINED_FUNCTION_0_2();
  uint64_t v62 = v2;
  uint64_t v63 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v61 = (char *)&v54 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_25C8EB950();
  OUTLINED_FUNCTION_0_2();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_28_0();
  uint64_t v56 = v7;
  OUTLINED_FUNCTION_5_3();
  MEMORY[0x270FA5388](v8);
  uint64_t v64 = (char *)&v54 - v9;
  OUTLINED_FUNCTION_5_3();
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v54 - v11;
  uint64_t v13 = sub_25C8EC0F0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_28_0();
  uint64_t v58 = v17;
  OUTLINED_FUNCTION_5_3();
  MEMORY[0x270FA5388](v18);
  uint64_t v55 = (char *)&v54 - v19;
  OUTLINED_FUNCTION_5_3();
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v54 - v21;
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  uint64_t v23 = __swift_project_value_buffer(v13, (uint64_t)qword_26A5DD5A0);
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  uint64_t v59 = v23;
  uint64_t v60 = v24;
  ((void (*)(char *))v24)(v22);
  unint64_t v25 = sub_25C8EC0D0();
  os_log_type_t v26 = sub_25C8EC2D0();
  if (os_log_type_enabled(v25, v26))
  {
    unint64_t v27 = (uint8_t *)OUTLINED_FUNCTION_5_0();
    *(_WORD *)unint64_t v27 = 0;
    _os_log_impl(&dword_25C89B000, v25, v26, "DeviceConfirmationStrategy.actionForInput() called", v27, 2u);
    OUTLINED_FUNCTION_3();
  }

  uint64_t v28 = *(void (**)(void))(v15 + 8);
  OUTLINED_FUNCTION_9_1();
  v28();
  sub_25C8EB900();
  double v29 = sub_25C8C93E8((uint64_t)&v67);
  id v30 = *(void (**)(char *, uint64_t, double))(v5 + 8);
  uint64_t v31 = v12;
  uint64_t v32 = v66;
  v30(v31, v66, v29);
  if (!v68)
  {
    uint64_t v54 = (uint64_t (*)(char *, uint64_t))v30;
    sub_25C89F4B0((uint64_t)&v67, (uint64_t *)&unk_26A5D9FE0);
    uint64_t v36 = v64;
    sub_25C8EB900();
    if ((*(unsigned int (**)(char *, uint64_t))(v5 + 88))(v36, v32) == *MEMORY[0x263F6FF70])
    {
      uint64_t v37 = v56;
      (*(void (**)(uint64_t, char *, uint64_t))(v5 + 16))(v56, v36, v32);
      (*(void (**)(uint64_t, uint64_t))(v5 + 96))(v37, v32);
      (*(void (**)(char *, uint64_t, uint64_t))(v62 + 32))(v61, v37, v63);
      if (sub_25C8EB920() == *(void *)(v57 + 152) && v38 == *(void *)(v57 + 160))
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v40 = sub_25C8EC550();
        swift_bridgeObjectRelease();
        if ((v40 & 1) == 0)
        {
          uint64_t v41 = OUTLINED_FUNCTION_29_0();
          v42(v41);
          goto LABEL_15;
        }
      }
      v60(v55, v59, v13);
      uint64_t v48 = sub_25C8EC0D0();
      os_log_type_t v49 = sub_25C8EC2D0();
      if (os_log_type_enabled(v48, v49))
      {
        *(_WORD *)OUTLINED_FUNCTION_5_0() = 0;
        OUTLINED_FUNCTION_28_1(&dword_25C89B000, v50, v51, "DeviceConfirmationStrategy.actionForInput() called for directInvocation");
        uint64_t v36 = v64;
        OUTLINED_FUNCTION_3();
      }

      OUTLINED_FUNCTION_9_1();
      v28();
      sub_25C8EB500();
      uint64_t v52 = OUTLINED_FUNCTION_29_0();
      v53(v52);
      return v54(v36, v32);
    }
LABEL_15:
    v60(v58, v59, v13);
    uint64_t v43 = sub_25C8EC0D0();
    os_log_type_t v44 = sub_25C8EC2D0();
    if (os_log_type_enabled(v43, v44))
    {
      *(_WORD *)OUTLINED_FUNCTION_5_0() = 0;
      OUTLINED_FUNCTION_28_1(&dword_25C89B000, v45, v46, "DeviceConfirmationStrategy.actionForInput() called for default");
      uint64_t v36 = v64;
      OUTLINED_FUNCTION_3();
    }

    OUTLINED_FUNCTION_9_1();
    v28();
    sub_25C8EB510();
    return v54(v36, v32);
  }
  sub_25C8A4290(&v67, (uint64_t)v69);
  uint64_t v33 = v70;
  uint64_t v34 = v71;
  __swift_project_boxed_opaque_existential_1(v69, v70);
  unsigned int v35 = (*(unsigned __int8 (**)(uint64_t, uint64_t))(v34 + 16))(v33, v34);
  if (v35 >= 2)
  {
    if (v35 == 2) {
      sub_25C8EB4F0();
    }
    else {
      sub_25C8EB510();
    }
  }
  else
  {
    sub_25C8EB500();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v69);
}

uint64_t sub_25C8E56D0()
{
  OUTLINED_FUNCTION_6_1();
  v1[19] = v2;
  v1[20] = v0;
  v1[18] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DA020);
  OUTLINED_FUNCTION_19(v4);
  v1[21] = OUTLINED_FUNCTION_13();
  uint64_t v5 = sub_25C8EB940();
  v1[22] = v5;
  OUTLINED_FUNCTION_1_2(v5);
  v1[23] = v6;
  v1[24] = OUTLINED_FUNCTION_13();
  uint64_t v7 = sub_25C8EB950();
  v1[25] = v7;
  OUTLINED_FUNCTION_1_2(v7);
  v1[26] = v8;
  v1[27] = OUTLINED_FUNCTION_11_1();
  v1[28] = swift_task_alloc();
  v1[29] = swift_task_alloc();
  uint64_t v9 = sub_25C8EB780();
  v1[30] = v9;
  OUTLINED_FUNCTION_1_2(v9);
  v1[31] = v10;
  v1[32] = OUTLINED_FUNCTION_11_1();
  v1[33] = swift_task_alloc();
  uint64_t v11 = sub_25C8EC0F0();
  v1[34] = v11;
  OUTLINED_FUNCTION_1_2(v11);
  v1[35] = v12;
  v1[36] = OUTLINED_FUNCTION_11_1();
  v1[37] = swift_task_alloc();
  v1[38] = swift_task_alloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v13, v14, v15);
}

uint64_t sub_25C8E5850()
{
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  uint64_t v70 = (long long *)(v0 + 56);
  uint64_t v1 = *(void *)(v0 + 304);
  uint64_t v2 = *(void *)(v0 + 280);
  uint64_t v3 = __swift_project_value_buffer(*(void *)(v0 + 272), (uint64_t)qword_26A5DD5A0);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  os_log_type_t v4 = v2 + 16;
  uint64_t v68 = v3;
  uint64_t v69 = v5;
  ((void (*)(uint64_t))v5)(v1);
  uint64_t v6 = sub_25C8EC0D0();
  os_log_type_t v7 = sub_25C8EC2D0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)OUTLINED_FUNCTION_5_0();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_25C89B000, v6, v7, "DeviceConfirmationStrategy.parseConfirmationResponse() called", v8, 2u);
    OUTLINED_FUNCTION_3();
  }
  uint64_t v9 = *(void *)(v0 + 280);
  uint64_t v10 = *(void *)(v0 + 208);

  uint64_t v11 = *(void (**)(void))(v9 + 8);
  uint64_t v12 = OUTLINED_FUNCTION_26_2();
  ((void (*)(uint64_t))v11)(v12);
  sub_25C8EB900();
  sub_25C8C93E8((uint64_t)v70);
  uint64_t v13 = *(void (**)(void))(v10 + 8);
  OUTLINED_FUNCTION_9_1();
  v13();
  if (*(void *)(v0 + 80))
  {
    uint64_t v14 = *(void *)(v0 + 296);
    uint64_t v15 = *(void *)(v0 + 272);
    sub_25C8A4290(v70, v0 + 16);
    v69(v14, v68, v15);
    uint64_t v16 = sub_25C8EC0D0();
    os_log_type_t v17 = sub_25C8EC2D0();
    if (OUTLINED_FUNCTION_23(v17))
    {
      uint64_t v18 = (uint8_t *)OUTLINED_FUNCTION_5_0();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_25C89B000, v16, v4, "DeviceConfirmationStrategy.actionForInput() called for NLv3IntentOnly", v18, 2u);
      OUTLINED_FUNCTION_3();
    }

    OUTLINED_FUNCTION_11_0();
    v11();
    uint64_t v19 = *(void *)(v0 + 40);
    uint64_t v20 = *(void *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), v19);
    switch((*(unsigned __int8 (**)(uint64_t, uint64_t))(v20 + 16))(v19, v20))
    {
      case 1u:
      case 2u:
        char v39 = sub_25C8EC550();
        swift_bridgeObjectRelease();
        if ((v39 & 1) == 0) {
          goto LABEL_22;
        }
        goto LABEL_21;
      case 3u:
LABEL_22:
        char v40 = (unsigned int *)MEMORY[0x263F6FC90];
        break;
      default:
        swift_bridgeObjectRelease();
LABEL_21:
        char v40 = (unsigned int *)MEMORY[0x263F6FC98];
        break;
    }
    uint64_t v41 = *(void *)(v0 + 256);
    uint64_t v42 = *(void *)(v0 + 264);
    uint64_t v43 = *(void *)(v0 + 240);
    uint64_t v44 = *(void *)(v0 + 248);
    (*(void (**)(uint64_t, void, uint64_t))(v44 + 104))(v41, *v40, v43);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 32))(v42, v41, v43);
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
LABEL_24:
    uint64_t v45 = *(void *)(v0 + 264);
    uint64_t v46 = *(void *)(v0 + 240);
    uint64_t v47 = *(void *)(v0 + 248);
    uint64_t v48 = *(void *)(v0 + 168);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 16))(v48, v45, v46);
    __swift_storeEnumTagSinglePayload(v48, 0, 1, v46);
    sub_25C8EB8F0();
    (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v45, v46);
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
    OUTLINED_FUNCTION_15_2();
    goto LABEL_37;
  }
  long long v67 = v13;
  sub_25C89F4B0((uint64_t)v70, (uint64_t *)&unk_26A5D9FE0);
  sub_25C8EB900();
  uint64_t v21 = OUTLINED_FUNCTION_26_2();
  if (v22(v21) != *MEMORY[0x263F6FF70]) {
    goto LABEL_17;
  }
  uint64_t v23 = *(void *)(v0 + 216);
  uint64_t v24 = *(void *)(v0 + 200);
  uint64_t v25 = *(void *)(v0 + 208);
  uint64_t v27 = *(void *)(v0 + 184);
  uint64_t v26 = *(void *)(v0 + 192);
  uint64_t v28 = *(void *)(v0 + 176);
  uint64_t v29 = *(void *)(v0 + 160);
  (*(void (**)(uint64_t, void, uint64_t))(v25 + 16))(v23, *(void *)(v0 + 224), v24);
  (*(void (**)(uint64_t, uint64_t))(v25 + 96))(v23, v24);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 32))(v26, v23, v28);
  if (sub_25C8EB920() == *(void *)(v29 + 152) && v30 == *(void *)(v29 + 160))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v32 = sub_25C8EC550();
    swift_bridgeObjectRelease();
    if ((v32 & 1) == 0)
    {
      (*(void (**)(void, void))(*(void *)(v0 + 184) + 8))(*(void *)(v0 + 192), *(void *)(v0 + 176));
LABEL_17:
      v69(*(void *)(v0 + 288), v68, *(void *)(v0 + 272));
      uint64_t v33 = (void *)sub_25C8EC0D0();
      os_log_type_t v34 = sub_25C8EC2E0();
      if (OUTLINED_FUNCTION_23(v34))
      {
        *(_WORD *)OUTLINED_FUNCTION_5_0() = 0;
        OUTLINED_FUNCTION_21(&dword_25C89B000, v35, v36, "Unsupported parse type");
        OUTLINED_FUNCTION_3();
      }

      OUTLINED_FUNCTION_11_0();
      v11();
      type metadata accessor for IdentityFlowError();
      swift_allocObject();
      uint64_t v37 = sub_25C8D786C(3);
      sub_25C8D2810();
      OUTLINED_FUNCTION_44_0();
      *uint64_t v38 = v37;
      swift_willThrow();
      goto LABEL_36;
    }
  }
  uint64_t v50 = sub_25C8EB930();
  if (v50)
  {
    sub_25C8E4D64(0xD000000000000011, 0x800000025C8F1A90, v50, (_OWORD *)(v0 + 96));
    swift_bridgeObjectRelease();
    if (*(void *)(v0 + 120))
    {
      if (swift_dynamicCast())
      {
        char v51 = sub_25C8E50F4();
        if (v51 != 2)
        {
          char v52 = v51;
          uint64_t v53 = *(void *)(v0 + 264);
          uint64_t v54 = *(void *)(v0 + 240);
          uint64_t v55 = *(void *)(v0 + 248);
          uint64_t v56 = *(void *)(v0 + 224);
          uint64_t v57 = *(void *)(v0 + 200);
          OUTLINED_FUNCTION_11_0();
          v58();
          uint64_t v59 = (unsigned int *)MEMORY[0x263F6FC98];
          if (v52) {
            uint64_t v59 = (unsigned int *)MEMORY[0x263F6FC90];
          }
          (*(void (**)(uint64_t, void, uint64_t))(v55 + 104))(v53, *v59, v54);
          ((void (*)(uint64_t, uint64_t))v67)(v56, v57);
          goto LABEL_24;
        }
      }
      goto LABEL_35;
    }
  }
  else
  {
    *(_OWORD *)(v0 + 96) = 0u;
    *(_OWORD *)(v0 + 11sub_25C8B55A0(4, 3, 2, 2) = 0u;
  }
  sub_25C89F4B0(v0 + 96, &qword_26A5D9B28);
LABEL_35:
  uint64_t v61 = *(void *)(v0 + 184);
  uint64_t v60 = *(void *)(v0 + 192);
  uint64_t v62 = *(void *)(v0 + 176);
  type metadata accessor for IdentityFlowError();
  swift_allocObject();
  uint64_t v63 = sub_25C8D786C(3);
  sub_25C8D2810();
  swift_allocError();
  *uint64_t v64 = v63;
  swift_willThrow();
  (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v60, v62);
LABEL_36:
  OUTLINED_FUNCTION_11_0();
  v65();
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
  OUTLINED_FUNCTION_9_0();
LABEL_37:
  return v49();
}

uint64_t sub_25C8E6050()
{
  OUTLINED_FUNCTION_6_1();
  v1[8] = v2;
  v1[9] = v0;
  v1[7] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9F70);
  OUTLINED_FUNCTION_19(v4);
  v1[10] = OUTLINED_FUNCTION_13();
  uint64_t v5 = sub_25C8EB740();
  v1[11] = v5;
  OUTLINED_FUNCTION_1_2(v5);
  v1[12] = v6;
  v1[13] = OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C8E6104()
{
  sub_25C8EBFF0();
  uint64_t v1 = sub_25C8EC080();
  if (v1 == sub_25C8EC080() || (sub_25C8EBFF0(), uint64_t v2 = sub_25C8EC080(), v3 = 0, v4 = 0, v2 == sub_25C8EC080()))
  {
    uint64_t v3 = sub_25C8EBFE0();
    uint64_t v4 = v5;
  }
  v0[14] = v4;
  uint64_t v6 = (void *)swift_task_alloc();
  v0[15] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_25C8E620C;
  uint64_t v7 = v0[13];
  return sub_25C8B33F8(v7, v3, v4);
}

uint64_t sub_25C8E620C()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_4();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v5 = v4;
  *(void *)(v6 + 128) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C8E6304()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = (void *)v0[9];
  uint64_t v3 = (uint64_t *)v0[7];
  uint64_t v4 = v2[6];
  __swift_project_boxed_opaque_existential_1(v2 + 2, v2[5]);
  sub_25C8EB430();
  sub_25C8EB730();
  sub_25C8E1660();
  uint64_t v5 = sub_25C8EB720();
  __swift_storeEnumTagSinglePayload(v1, 0, 1, v5);
  sub_25C8EB9A0();
  OUTLINED_FUNCTION_18_5();
  uint64_t v6 = MEMORY[0x263F6FFF0];
  v3[3] = v7;
  v3[4] = v6;
  __swift_allocate_boxed_opaque_existential_1Tm(v3);
  OUTLINED_FUNCTION_26_2();
  sub_25C8EB620();
  sub_25C89F4B0(v4, &qword_26A5D9F80);
  sub_25C89F4B0(v1, &qword_26A5D9F70);
  OUTLINED_FUNCTION_9_1();
  v9(v8);
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_15_2();
  return v10();
}

uint64_t sub_25C8E6474()
{
  OUTLINED_FUNCTION_6_1();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  return v0();
}

uint64_t sub_25C8E64DC()
{
  OUTLINED_FUNCTION_6_1();
  v1[7] = v2;
  v1[8] = v0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9F70);
  OUTLINED_FUNCTION_19(v3);
  v1[9] = OUTLINED_FUNCTION_13();
  uint64_t v4 = sub_25C8EB740();
  v1[10] = v4;
  OUTLINED_FUNCTION_1_2(v4);
  v1[11] = v5;
  v1[12] = OUTLINED_FUNCTION_13();
  uint64_t v6 = sub_25C8EC0F0();
  v1[13] = v6;
  OUTLINED_FUNCTION_1_2(v6);
  v1[14] = v7;
  v1[15] = OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_25C8E65BC()
{
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v0[13], (uint64_t)qword_26A5DD5A0);
  uint64_t v1 = OUTLINED_FUNCTION_19_4();
  v2(v1);
  uint64_t v3 = (void *)sub_25C8EC0D0();
  os_log_type_t v4 = sub_25C8EC2D0();
  if (OUTLINED_FUNCTION_23(v4))
  {
    *(_WORD *)OUTLINED_FUNCTION_5_0() = 0;
    OUTLINED_FUNCTION_21(&dword_25C89B000, v5, v6, "DeviceConfirmationStrategy.makeConfirmationRejectedResponse() called");
    OUTLINED_FUNCTION_3();
  }
  uint64_t v7 = v0[8];

  uint64_t v8 = OUTLINED_FUNCTION_23_0();
  v9(v8);
  __swift_project_boxed_opaque_existential_1((void *)(v7 + 56), *(void *)(v7 + 80));
  uint64_t v10 = (void *)OUTLINED_FUNCTION_10_3();
  v0[16] = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_25C8E671C;
  OUTLINED_FUNCTION_14_3();
  return v11();
}

uint64_t sub_25C8E671C()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_4();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v5 = v4;
  *(void *)(v6 + 136) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C8E67F8()
{
  OUTLINED_FUNCTION_6_1();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_0();
  return v0();
}

uint64_t sub_25C8E686C()
{
  uint64_t v1 = v0[9];
  uint64_t v3 = (uint64_t *)v0[7];
  uint64_t v2 = v0[8];
  uint64_t v4 = *(void *)(v2 + 40);
  __swift_project_boxed_opaque_existential_1((void *)(v2 + 16), v4);
  sub_25C8EB430();
  sub_25C8EB720();
  uint64_t v5 = OUTLINED_FUNCTION_21_4();
  __swift_storeEnumTagSinglePayload(v5, v6, v7, v8);
  sub_25C8EB9A0();
  OUTLINED_FUNCTION_18_5();
  uint64_t v9 = MEMORY[0x263F6FFF0];
  v3[3] = v10;
  v3[4] = v9;
  __swift_allocate_boxed_opaque_existential_1Tm(v3);
  sub_25C8EB600();
  sub_25C89F4B0(v4, &qword_26A5D9F80);
  sub_25C89F4B0(v1, &qword_26A5D9F70);
  uint64_t v11 = OUTLINED_FUNCTION_26_2();
  v12(v11);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_15_2();
  return v13();
}

uint64_t sub_25C8E69C8()
{
  OUTLINED_FUNCTION_6_1();
  v1[7] = v2;
  v1[8] = v0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D9F70);
  OUTLINED_FUNCTION_19(v3);
  v1[9] = OUTLINED_FUNCTION_13();
  uint64_t v4 = sub_25C8EB740();
  v1[10] = v4;
  OUTLINED_FUNCTION_1_2(v4);
  v1[11] = v5;
  v1[12] = OUTLINED_FUNCTION_13();
  uint64_t v6 = sub_25C8EC0F0();
  v1[13] = v6;
  OUTLINED_FUNCTION_1_2(v6);
  v1[14] = v7;
  v1[15] = OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_25C8E6AA8()
{
  if (qword_26A5D95A8 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v0[13], (uint64_t)qword_26A5DD5A0);
  uint64_t v1 = OUTLINED_FUNCTION_19_4();
  v2(v1);
  uint64_t v3 = (void *)sub_25C8EC0D0();
  os_log_type_t v4 = sub_25C8EC2D0();
  if (OUTLINED_FUNCTION_23(v4))
  {
    *(_WORD *)OUTLINED_FUNCTION_5_0() = 0;
    OUTLINED_FUNCTION_21(&dword_25C89B000, v5, v6, "DeviceConfirmationStrategy.makeFlowCancelledResponse() called");
    OUTLINED_FUNCTION_3();
  }
  uint64_t v7 = v0[8];

  uint64_t v8 = OUTLINED_FUNCTION_23_0();
  v9(v8);
  __swift_project_boxed_opaque_existential_1((void *)(v7 + 56), *(void *)(v7 + 80));
  uint64_t v10 = (void *)OUTLINED_FUNCTION_10_3();
  v0[16] = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_25C8E6C08;
  OUTLINED_FUNCTION_14_3();
  return v11();
}

uint64_t sub_25C8E6C08()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_4();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3_1();
  *uint64_t v5 = v4;
  *(void *)(v6 + 136) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C8E6CE4()
{
  return OUTLINED_FUNCTION_2_2((uint64_t)sub_25C8E6CF8);
}

uint64_t sub_25C8E6CF8()
{
  type metadata accessor for IdentityFlowError();
  swift_allocObject();
  uint64_t v0 = sub_25C8D786C(3);
  sub_25C8D2810();
  OUTLINED_FUNCTION_44_0();
  *uint64_t v1 = v0;
  swift_willThrow();
  OUTLINED_FUNCTION_9_0();
  return v2();
}

uint64_t sub_25C8E6D98()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  sub_25C8A8014(v0 + 56);
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25C8E6DD0()
{
  sub_25C8E6D98();
  return MEMORY[0x270FA0228](v0, 168, 7);
}

uint64_t type metadata accessor for DeviceConfirmationStrategy()
{
  return self;
}

uint64_t sub_25C8E6E28()
{
  return MEMORY[0x263F6FF10];
}

uint64_t sub_25C8E6E38()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C8C41D8;
  return sub_25C8E56D0();
}

uint64_t sub_25C8E6EE0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C8C41D8;
  return sub_25C8E6050();
}

uint64_t sub_25C8E6F88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for DeviceConfirmationStrategy();
  *uint64_t v8 = v4;
  v8[1] = sub_25C8C41D8;
  return MEMORY[0x270F66700](a1, a2, v9, a4);
}

uint64_t sub_25C8E704C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for DeviceConfirmationStrategy();
  *uint64_t v8 = v4;
  v8[1] = sub_25C8C41D8;
  return MEMORY[0x270F66708](a1, a2, v9, a4);
}

uint64_t sub_25C8E7110()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C8A710C;
  return sub_25C8E64DC();
}

uint64_t sub_25C8E71A8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C8C41D8;
  return sub_25C8E69C8();
}

uint64_t sub_25C8E7240()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C8C41D8;
  return sub_25C8E6CE4();
}

unint64_t sub_25C8E72CC(uint64_t a1, uint64_t a2)
{
  sub_25C8EC5F0();
  sub_25C8EC1B0();
  uint64_t v4 = sub_25C8EC610();
  return sub_25C8E73B0(a1, a2, v4);
}

unint64_t sub_25C8E7348(unsigned __int8 a1)
{
  sub_25C8EC5F0();
  sub_25C8EC600();
  uint64_t v2 = sub_25C8EC610();
  return sub_25C8E7494(a1, v2);
}

unint64_t sub_25C8E73B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25C8EC550() & 1) == 0)
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
      while (!v14 && (sub_25C8EC550() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_25C8E7494(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_25C8E7534(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UserAccount();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

double OUTLINED_FUNCTION_18_5()
{
  double result = 0.0;
  *(_OWORD *)(v0 + 3sub_25C8B55A0(4, 3, 2, 2) = 0u;
  *(void *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_21_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_26_2()
{
  return v0;
}

void OUTLINED_FUNCTION_28_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  return *(void *)(v0 - 216);
}

uint64_t sub_25C8E7628(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_14(a1, qword_26A5DD588);
}

uint64_t sub_25C8E7634(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_14(a1, qword_26A5DD5A0);
}

uint64_t sub_25C8E7640(uint64_t a1)
{
  return sub_25C8E76F4(a1, qword_26A5DD5B8);
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

uint64_t sub_25C8E76C8(uint64_t a1)
{
  return sub_25C8E76F4(a1, qword_26A5DD5D0);
}

uint64_t sub_25C8E76F4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_25C8EC0F0();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_25C8EC0E0();
}

void sub_25C8E776C()
{
  unk_26A5DD5F5 = 0;
  unk_26A5DD5F6 = -5120;
}

uint64_t OUTLINED_FUNCTION_0_14(uint64_t a1, uint64_t *a2)
{
  return sub_25C8E76F4(a1, a2);
}

id UserIdentifyIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

char *UserIdentifyIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return UserIdentifyIntentResponse.init(code:userActivity:)(a1, a2);
}

uint64_t UserIdentifyIdentityUnsupportedReason.init(rawValue:)(uint64_t result)
{
  if ((unint64_t)(result - 9) < 0xFFFFFFFFFFFFFFF8) {
    return 0;
  }
  return result;
}

id UserIdentifyIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UserIdentifyIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

id UserIdentifyIntent.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id UserIdentifyIntent.init(coder:)(void *a1)
{
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for UserIdentifyIntent();
  id v9 = OUTLINED_FUNCTION_1_15((uint64_t)v11.super_class, sel_initWithCoder_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id UserIdentifyIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_25C8EC160();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithIdentifier_backingStore_, v6, a3);

  return v7;
}

id UserIdentifyIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    uint64_t v5 = (void *)sub_25C8EC160();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for UserIdentifyIntent();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithIdentifier_backingStore_, v5, a3);

  return v6;
}

id UserIdentifyIntent.__allocating_init(domain:verb:parametersByName:)()
{
  objc_super v2 = (void *)OUTLINED_FUNCTION_0_15();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_25C8EC160();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v4 = (void *)sub_25C8EC100();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = objc_msgSend(objc_allocWithZone(v0), sel_initWithDomain_verb_parametersByName_, v2, v3, v4);

  return v5;
}

id UserIdentifyIntent.init(domain:verb:parametersByName:)()
{
  objc_super v2 = (void *)OUTLINED_FUNCTION_0_15();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_25C8EC160();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v4 = (void *)sub_25C8EC100();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for UserIdentifyIntent();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithDomain_verb_parametersByName_, v2, v3, v4);

  return v5;
}

id UserIdentifyIntent.__deallocating_deinit()
{
  return sub_25C8E8548(type metadata accessor for UserIdentifyIntent);
}

unint64_t UserIdentifyIntentResponseCode.init(rawValue:)(unint64_t result)
{
  if (result - 100 >= 4) {
    unint64_t v1 = 0;
  }
  else {
    unint64_t v1 = result;
  }
  if (result >= 7) {
    return v1;
  }
  return result;
}

BOOL sub_25C8E7D0C(uint64_t *a1, uint64_t *a2)
{
  return sub_25C8D7150(*a1, *a2);
}

uint64_t sub_25C8E7D18()
{
  return sub_25C8D73A8(*v0);
}

uint64_t sub_25C8E7D20()
{
  return sub_25C8D73F4();
}

uint64_t sub_25C8E7D28(uint64_t a1)
{
  return sub_25C8D7544(a1, *v1);
}

unint64_t sub_25C8E7D30@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = UserIdentifyIntentResponseCode.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t UserIdentifyIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___UserIdentifyIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_25C8E7DF8(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___UserIdentifyIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

char *UserIdentifyIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v5 = (char *)objc_msgSend(v2, sel_init);
  id v6 = &v5[OBJC_IVAR___UserIdentifyIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  objc_super v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

uint64_t type metadata accessor for UserIdentifyIntent()
{
  return self;
}

id UserIdentifyIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___UserIdentifyIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UserIdentifyIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for UserIdentifyIntentResponse()
{
  return self;
}

id UserIdentifyIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___UserIdentifyIntentResponse_code] = 0;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for UserIdentifyIntentResponse();
  id v9 = OUTLINED_FUNCTION_1_15((uint64_t)v11.super_class, sel_initWithCoder_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id UserIdentifyIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v3;
}

id UserIdentifyIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___UserIdentifyIntentResponse_code] = 0;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for UserIdentifyIntentResponse();
  id v9 = OUTLINED_FUNCTION_1_15((uint64_t)v11.super_class, sel_initWithBackingStore_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id UserIdentifyIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    objc_super v2 = (void *)sub_25C8EC100();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithPropertiesByName_, v2);

  return v3;
}

id UserIdentifyIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___UserIdentifyIntentResponse_code] = 0;
  if (a1)
  {
    objc_super v2 = (void *)sub_25C8EC100();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for UserIdentifyIntentResponse();
  id v9 = OUTLINED_FUNCTION_1_15((uint64_t)v11.super_class, sel_initWithPropertiesByName_, v3, v4, v5, v6, v7, v8, v11);

  if (v9) {
  return v9;
  }
}

id UserIdentifyIntentResponse.__deallocating_deinit()
{
  return sub_25C8E8548(type metadata accessor for UserIdentifyIntentResponse);
}

uint64_t sub_25C8E82A8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = UserIdentifyIdentityUnsupportedReason.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_25C8E82DC(void *a1@<X8>)
{
  *a1 = *v1;
}

id static UserIdentifyIdentityResolutionResult.unsupported(forReason:)(uint64_t a1)
{
  id v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupportedWithReason_, a1);
  return v1;
}

id UserIdentifyIdentityResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  uint64_t v5 = (void *)sub_25C8EC100();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id UserIdentifyIdentityResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_25C8EC100();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for UserIdentifyIdentityResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for UserIdentifyIdentityResolutionResult()
{
  return self;
}

id UserIdentifyIdentityResolutionResult.__deallocating_deinit()
{
  return sub_25C8E8548(type metadata accessor for UserIdentifyIdentityResolutionResult);
}

id sub_25C8E8548(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_25C8E8584()
{
  unint64_t result = qword_26A5DA6D8;
  if (!qword_26A5DA6D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DA6D8);
  }
  return result;
}

unint64_t sub_25C8E85D4()
{
  unint64_t result = qword_26A5DA6E0;
  if (!qword_26A5DA6E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DA6E0);
  }
  return result;
}

uint64_t sub_25C8E8620@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = UserIdentifyIntentResponse.code.getter();
  *a1 = result;
  return result;
}

uint64_t sub_25C8E864C(uint64_t *a1)
{
  return sub_25C8E7DF8(*a1);
}

ValueMetadata *type metadata accessor for UserIdentifyIntentResponseCode()
{
  return &type metadata for UserIdentifyIntentResponseCode;
}

ValueMetadata *type metadata accessor for UserIdentifyIdentityUnsupportedReason()
{
  return &type metadata for UserIdentifyIdentityUnsupportedReason;
}

uint64_t OUTLINED_FUNCTION_0_15()
{
  return sub_25C8EC160();
}

id OUTLINED_FUNCTION_1_15(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  return objc_msgSendSuper2(&a9, a2, v9);
}

uint64_t CaseType.init(rawValue:)(uint64_t result)
{
  if ((unint64_t)(result - 5) < 0xFFFFFFFFFFFFFFFDLL) {
    return 0;
  }
  return result;
}

uint64_t sub_25C8E86F0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = CaseType.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id static CaseTypeResolutionResult.success(with:)(uint64_t a1)
{
  return sub_25C8E877C(a1, (SEL *)&selRef_successWithResolvedValue_);
}

id static CaseTypeResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  return sub_25C8E877C(a1, (SEL *)&selRef_confirmationRequiredWithValueToConfirm_);
}

id sub_25C8E877C(uint64_t a1, SEL *a2)
{
  id v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), *a2, a1);
  return v2;
}

id CaseTypeResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_25C8EC100();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id CaseTypeResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_25C8EC100();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for CaseTypeResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for CaseTypeResolutionResult()
{
  return self;
}

id CaseTypeResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CaseTypeResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_25C8E8A04()
{
  unint64_t result = qword_26A5DA6E8;
  if (!qword_26A5DA6E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DA6E8);
  }
  return result;
}

ValueMetadata *type metadata accessor for CaseType()
{
  return &type metadata for CaseType;
}

id static IdentityResolutionResult.success(with:)(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___IdentityResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_successWithResolvedObject_, a1);
  return v2;
}

id static IdentityResolutionResult.disambiguation(with:)(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_25C8E8BBC();
    swift_bridgeObjectRetain();
    sub_25C8EC4E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_25C8EC560();
    sub_25C8E8BBC();
  }
  uint64_t ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_25C8E8BBC();
  id v2 = (void *)sub_25C8EC1F0();
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___IdentityResolutionResult;
  id v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, v2);

  return v3;
}

unint64_t sub_25C8E8BBC()
{
  unint64_t result = qword_26A5DA6F0;
  if (!qword_26A5DA6F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A5DA6F0);
  }
  return result;
}

id static IdentityResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___IdentityResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_confirmationRequiredWithObjectToConfirm_, a1);
  return v2;
}

uint64_t static Identity.supportsSecureCoding.getter()
{
  return 1;
}

id Identity.__allocating_init(identifier:display:pronunciationHint:)()
{
  OUTLINED_FUNCTION_1_16();
  if (v2)
  {
    id v3 = (void *)sub_25C8EC160();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v3 = 0;
  }
  objc_super v4 = (void *)sub_25C8EC160();
  swift_bridgeObjectRelease();
  if (v1)
  {
    objc_super v5 = (void *)sub_25C8EC160();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v5 = 0;
  }
  id v6 = objc_msgSend(objc_allocWithZone(v0), sel_initWithIdentifier_displayString_pronunciationHint_, v3, v4, v5);

  return v6;
}

id Identity.init(identifier:display:pronunciationHint:)()
{
  OUTLINED_FUNCTION_1_16();
  if (v2)
  {
    id v3 = (void *)sub_25C8EC160();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v3 = 0;
  }
  objc_super v4 = (void *)sub_25C8EC160();
  swift_bridgeObjectRelease();
  if (v1)
  {
    objc_super v5 = (void *)sub_25C8EC160();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v5 = 0;
  }
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for Identity();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithIdentifier_displayString_pronunciationHint_, v3, v4, v5);

  return v6;
}

uint64_t type metadata accessor for Identity()
{
  return self;
}

id Identity.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id Identity.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for Identity();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id Identity.__deallocating_deinit()
{
  return sub_25C8E9374(type metadata accessor for Identity);
}

void static IdentityResolutionResult.success(with:)()
{
}

void static IdentityResolutionResult.disambiguation(with:)()
{
}

void static IdentityResolutionResult.confirmationRequired(with:)()
{
}

id IdentityResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  objc_super v5 = (void *)sub_25C8EC100();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id IdentityResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_25C8EC100();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for IdentityResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for IdentityResolutionResult()
{
  return self;
}

id IdentityResolutionResult.__deallocating_deinit()
{
  return sub_25C8E9374(type metadata accessor for IdentityResolutionResult);
}

id sub_25C8E9374(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t OUTLINED_FUNCTION_0_16()
{
  return sub_25C8EC4D0();
}

id SwitchProfileIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

char *SwitchProfileIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return SwitchProfileIntentResponse.init(code:userActivity:)(a1, a2);
}

uint64_t SwitchProfileAccountUnsupportedReason.init(rawValue:)(uint64_t result)
{
  if ((unint64_t)(result - 6) < 0xFFFFFFFFFFFFFFFBLL) {
    return 0;
  }
  return result;
}

id SwitchProfileIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SwitchProfileIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SwitchProfileIntent.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SwitchProfileIntent.init(coder:)(void *a1)
{
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for SwitchProfileIntent();
  id v9 = OUTLINED_FUNCTION_1_15((uint64_t)v11.super_class, sel_initWithCoder_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id SwitchProfileIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_25C8EC160();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithIdentifier_backingStore_, v6, a3);

  return v7;
}

id SwitchProfileIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    uint64_t v5 = (void *)sub_25C8EC160();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for SwitchProfileIntent();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithIdentifier_backingStore_, v5, a3);

  return v6;
}

id SwitchProfileIntent.__allocating_init(domain:verb:parametersByName:)()
{
  objc_super v2 = (void *)OUTLINED_FUNCTION_0_15();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_25C8EC160();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v4 = (void *)sub_25C8EC100();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = objc_msgSend(objc_allocWithZone(v0), sel_initWithDomain_verb_parametersByName_, v2, v3, v4);

  return v5;
}

id SwitchProfileIntent.init(domain:verb:parametersByName:)()
{
  objc_super v2 = (void *)OUTLINED_FUNCTION_0_15();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_25C8EC160();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v4 = (void *)sub_25C8EC100();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for SwitchProfileIntent();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithDomain_verb_parametersByName_, v2, v3, v4);

  return v5;
}

id SwitchProfileIntent.__deallocating_deinit()
{
  return sub_25C8EA158(type metadata accessor for SwitchProfileIntent);
}

unint64_t SwitchProfileIntentResponseCode.init(rawValue:)(unint64_t result)
{
  if (result - 100 >= 2) {
    unint64_t v1 = 0;
  }
  else {
    unint64_t v1 = result;
  }
  if (result >= 7) {
    return v1;
  }
  return result;
}

unint64_t sub_25C8E994C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = SwitchProfileIntentResponseCode.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t SwitchProfileIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___SwitchProfileIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_25C8E9A14(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___SwitchProfileIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

char *SwitchProfileIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v5 = (char *)objc_msgSend(v2, sel_init);
  id v6 = &v5[OBJC_IVAR___SwitchProfileIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  objc_super v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

uint64_t type metadata accessor for SwitchProfileIntent()
{
  return self;
}

id SwitchProfileIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___SwitchProfileIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SwitchProfileIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SwitchProfileIntentResponse()
{
  return self;
}

id SwitchProfileIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___SwitchProfileIntentResponse_code] = 0;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for SwitchProfileIntentResponse();
  id v9 = OUTLINED_FUNCTION_1_15((uint64_t)v11.super_class, sel_initWithCoder_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id SwitchProfileIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v3;
}

id SwitchProfileIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___SwitchProfileIntentResponse_code] = 0;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for SwitchProfileIntentResponse();
  id v9 = OUTLINED_FUNCTION_1_15((uint64_t)v11.super_class, sel_initWithBackingStore_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id SwitchProfileIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    objc_super v2 = (void *)sub_25C8EC100();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithPropertiesByName_, v2);

  return v3;
}

id SwitchProfileIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___SwitchProfileIntentResponse_code] = 0;
  if (a1)
  {
    objc_super v2 = (void *)sub_25C8EC100();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for SwitchProfileIntentResponse();
  id v9 = OUTLINED_FUNCTION_1_15((uint64_t)v11.super_class, sel_initWithPropertiesByName_, v3, v4, v5, v6, v7, v8, v11);

  if (v9) {
  return v9;
  }
}

id SwitchProfileIntentResponse.__deallocating_deinit()
{
  return sub_25C8EA158(type metadata accessor for SwitchProfileIntentResponse);
}

uint64_t sub_25C8E9EC4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = SwitchProfileAccountUnsupportedReason.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id static SwitchProfileAccountResolutionResult.unsupported(forReason:)(uint64_t a1)
{
  id v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupportedWithReason_, a1);
  return v1;
}

id SwitchProfileAccountResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  uint64_t v5 = (void *)sub_25C8EC100();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id SwitchProfileAccountResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_25C8EC100();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for SwitchProfileAccountResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for SwitchProfileAccountResolutionResult()
{
  return self;
}

id SwitchProfileAccountResolutionResult.__deallocating_deinit()
{
  return sub_25C8EA158(type metadata accessor for SwitchProfileAccountResolutionResult);
}

id sub_25C8EA158(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_25C8EA194()
{
  unint64_t result = qword_26A5DA700;
  if (!qword_26A5DA700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DA700);
  }
  return result;
}

unint64_t sub_25C8EA1E4()
{
  unint64_t result = qword_26A5DA708;
  if (!qword_26A5DA708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DA708);
  }
  return result;
}

uint64_t sub_25C8EA230@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SwitchProfileIntentResponse.code.getter();
  *a1 = result;
  return result;
}

uint64_t sub_25C8EA25C(uint64_t *a1)
{
  return sub_25C8E9A14(*a1);
}

ValueMetadata *type metadata accessor for SwitchProfileIntentResponseCode()
{
  return &type metadata for SwitchProfileIntentResponseCode;
}

ValueMetadata *type metadata accessor for SwitchProfileAccountUnsupportedReason()
{
  return &type metadata for SwitchProfileAccountUnsupportedReason;
}

unint64_t SwitchType.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

unint64_t sub_25C8EA2C0@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = SwitchType.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id static SwitchTypeResolutionResult.success(with:)(uint64_t a1)
{
  return sub_25C8E877C(a1, (SEL *)&selRef_successWithResolvedValue_);
}

id static SwitchTypeResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  return sub_25C8E877C(a1, (SEL *)&selRef_confirmationRequiredWithValueToConfirm_);
}

id SwitchTypeResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_25C8EC100();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id SwitchTypeResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_25C8EC100();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for SwitchTypeResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for SwitchTypeResolutionResult()
{
  return self;
}

id SwitchTypeResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SwitchTypeResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_25C8EA580()
{
  unint64_t result = qword_26A5DA710;
  if (!qword_26A5DA710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DA710);
  }
  return result;
}

ValueMetadata *type metadata accessor for SwitchType()
{
  return &type metadata for SwitchType;
}

id static AccountResolutionResult.success(with:)(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___AccountResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_successWithResolvedObject_, a1);
  return v2;
}

id static AccountResolutionResult.disambiguation(with:)(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_25C8E8BBC();
    swift_bridgeObjectRetain();
    sub_25C8EC4E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_25C8EC560();
    sub_25C8E8BBC();
  }
  uint64_t ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_25C8E8BBC();
  id v2 = (void *)sub_25C8EC1F0();
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___AccountResolutionResult;
  id v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, v2);

  return v3;
}

id static AccountResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___AccountResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_confirmationRequiredWithObjectToConfirm_, a1);
  return v2;
}

uint64_t static Account.supportsSecureCoding.getter()
{
  return 1;
}

id Account.__allocating_init(identifier:display:pronunciationHint:)()
{
  OUTLINED_FUNCTION_1_16();
  if (v2)
  {
    id v3 = (void *)sub_25C8EC160();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v3 = 0;
  }
  objc_super v4 = (void *)sub_25C8EC160();
  swift_bridgeObjectRelease();
  if (v1)
  {
    objc_super v5 = (void *)sub_25C8EC160();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v5 = 0;
  }
  id v6 = objc_msgSend(objc_allocWithZone(v0), sel_initWithIdentifier_displayString_pronunciationHint_, v3, v4, v5);

  return v6;
}

id Account.init(identifier:display:pronunciationHint:)()
{
  OUTLINED_FUNCTION_1_16();
  if (v2)
  {
    id v3 = (void *)sub_25C8EC160();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v3 = 0;
  }
  objc_super v4 = (void *)sub_25C8EC160();
  swift_bridgeObjectRelease();
  if (v1)
  {
    objc_super v5 = (void *)sub_25C8EC160();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v5 = 0;
  }
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for Account();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithIdentifier_displayString_pronunciationHint_, v3, v4, v5);

  return v6;
}

uint64_t type metadata accessor for Account()
{
  return self;
}

id Account.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id Account.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for Account();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id Account.__deallocating_deinit()
{
  return sub_25C8EAEB0(type metadata accessor for Account);
}

void static AccountResolutionResult.success(with:)()
{
}

void static AccountResolutionResult.disambiguation(with:)()
{
}

void static AccountResolutionResult.confirmationRequired(with:)()
{
}

id AccountResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  objc_super v5 = (void *)sub_25C8EC100();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id AccountResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_25C8EC100();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for AccountResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for AccountResolutionResult()
{
  return self;
}

id AccountResolutionResult.__deallocating_deinit()
{
  return sub_25C8EAEB0(type metadata accessor for AccountResolutionResult);
}

id sub_25C8EAEB0(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t OUTLINED_FUNCTION_0_17()
{
  return sub_25C8EC4D0();
}

uint64_t sub_25C8EAF10()
{
  return MEMORY[0x270EEF320]();
}

uint64_t sub_25C8EAF20()
{
  return MEMORY[0x270EEF340]();
}

uint64_t sub_25C8EAF30()
{
  return MEMORY[0x270EEF360]();
}

uint64_t sub_25C8EAF40()
{
  return MEMORY[0x270EEF420]();
}

uint64_t sub_25C8EAF50()
{
  return MEMORY[0x270EEF460]();
}

uint64_t sub_25C8EAF60()
{
  return MEMORY[0x270EEF470]();
}

uint64_t sub_25C8EAF70()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25C8EAF80()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25C8EAF90()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_25C8EAFA0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25C8EAFB0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_25C8EAFC0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25C8EAFD0()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_25C8EAFE0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25C8EAFF0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25C8EB000()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25C8EB010()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_25C8EB020()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_25C8EB030()
{
  return MEMORY[0x270F66328]();
}

uint64_t sub_25C8EB060()
{
  return MEMORY[0x270F66360]();
}

uint64_t sub_25C8EB0B0()
{
  return MEMORY[0x270F663D8]();
}

uint64_t sub_25C8EB0C0()
{
  return MEMORY[0x270F663E0]();
}

uint64_t sub_25C8EB120()
{
  return MEMORY[0x270F66618]();
}

uint64_t sub_25C8EB130()
{
  return MEMORY[0x270F66620]();
}

uint64_t sub_25C8EB1B0()
{
  return MEMORY[0x270F66710]();
}

uint64_t sub_25C8EB1D0()
{
  return MEMORY[0x270F66888]();
}

uint64_t sub_25C8EB1E0()
{
  return MEMORY[0x270F668B8]();
}

uint64_t sub_25C8EB1F0()
{
  return MEMORY[0x270F66980]();
}

uint64_t sub_25C8EB200()
{
  return MEMORY[0x270F669B0]();
}

uint64_t sub_25C8EB210()
{
  return MEMORY[0x270F66A88]();
}

uint64_t sub_25C8EB220()
{
  return MEMORY[0x270F66A98]();
}

uint64_t sub_25C8EB230()
{
  return MEMORY[0x270F66AE0]();
}

uint64_t sub_25C8EB240()
{
  return MEMORY[0x270F66B10]();
}

uint64_t sub_25C8EB250()
{
  return MEMORY[0x270F66B48]();
}

uint64_t sub_25C8EB260()
{
  return MEMORY[0x270F66B50]();
}

uint64_t sub_25C8EB270()
{
  return MEMORY[0x270F66B68]();
}

uint64_t sub_25C8EB280()
{
  return MEMORY[0x270F66B78]();
}

uint64_t sub_25C8EB290()
{
  return MEMORY[0x270F66B90]();
}

uint64_t sub_25C8EB2A0()
{
  return MEMORY[0x270F66BA0]();
}

uint64_t sub_25C8EB2B0()
{
  return MEMORY[0x270F66CA8]();
}

uint64_t sub_25C8EB2C0()
{
  return MEMORY[0x270F66CC0]();
}

uint64_t sub_25C8EB2D0()
{
  return MEMORY[0x270F66CC8]();
}

uint64_t sub_25C8EB2F0()
{
  return MEMORY[0x270F66CD8]();
}

uint64_t sub_25C8EB310()
{
  return MEMORY[0x270F66CE8]();
}

uint64_t sub_25C8EB320()
{
  return MEMORY[0x270F66DA0]();
}

uint64_t sub_25C8EB330()
{
  return MEMORY[0x270F66DB8]();
}

uint64_t sub_25C8EB340()
{
  return MEMORY[0x270F66DC8]();
}

uint64_t sub_25C8EB350()
{
  return MEMORY[0x270F66DD0]();
}

uint64_t sub_25C8EB360()
{
  return MEMORY[0x270F66DD8]();
}

uint64_t sub_25C8EB370()
{
  return MEMORY[0x270F66E00]();
}

uint64_t sub_25C8EB380()
{
  return MEMORY[0x270F66E10]();
}

uint64_t sub_25C8EB390()
{
  return MEMORY[0x270F66E20]();
}

uint64_t sub_25C8EB3A0()
{
  return MEMORY[0x270F66E28]();
}

uint64_t sub_25C8EB3B0()
{
  return MEMORY[0x270F66F10]();
}

uint64_t sub_25C8EB3C0()
{
  return MEMORY[0x270F66F18]();
}

uint64_t sub_25C8EB3D0()
{
  return MEMORY[0x270F66F28]();
}

uint64_t sub_25C8EB3E0()
{
  return MEMORY[0x270F67000]();
}

uint64_t sub_25C8EB3F0()
{
  return MEMORY[0x270F67030]();
}

uint64_t sub_25C8EB400()
{
  return MEMORY[0x270F67068]();
}

uint64_t sub_25C8EB410()
{
  return MEMORY[0x270F670A0]();
}

uint64_t sub_25C8EB420()
{
  return MEMORY[0x270F671A8]();
}

uint64_t sub_25C8EB430()
{
  return MEMORY[0x270F671E8]();
}

uint64_t sub_25C8EB440()
{
  return MEMORY[0x270F67230]();
}

uint64_t sub_25C8EB450()
{
  return MEMORY[0x270F67240]();
}

uint64_t sub_25C8EB460()
{
  return MEMORY[0x270F67350]();
}

uint64_t sub_25C8EB470()
{
  return MEMORY[0x270F67358]();
}

uint64_t sub_25C8EB480()
{
  return MEMORY[0x270F67360]();
}

uint64_t sub_25C8EB490()
{
  return MEMORY[0x270F673A8]();
}

uint64_t sub_25C8EB4A0()
{
  return MEMORY[0x270F674B8]();
}

uint64_t sub_25C8EB4B0()
{
  return MEMORY[0x270F674D8]();
}

uint64_t sub_25C8EB4C0()
{
  return MEMORY[0x270F674E8]();
}

uint64_t sub_25C8EB4D0()
{
  return MEMORY[0x270F674F0]();
}

uint64_t sub_25C8EB4E0()
{
  return MEMORY[0x270F674F8]();
}

uint64_t sub_25C8EB4F0()
{
  return MEMORY[0x270F67500]();
}

uint64_t sub_25C8EB500()
{
  return MEMORY[0x270F67508]();
}

uint64_t sub_25C8EB510()
{
  return MEMORY[0x270F67510]();
}

uint64_t sub_25C8EB520()
{
  return MEMORY[0x270F67560]();
}

uint64_t sub_25C8EB530()
{
  return MEMORY[0x270F67568]();
}

uint64_t sub_25C8EB540()
{
  return MEMORY[0x270F67570]();
}

uint64_t sub_25C8EB550()
{
  return MEMORY[0x270F67578]();
}

uint64_t sub_25C8EB560()
{
  return MEMORY[0x270F67580]();
}

uint64_t sub_25C8EB570()
{
  return MEMORY[0x270F67590]();
}

uint64_t sub_25C8EB580()
{
  return MEMORY[0x270F67598]();
}

uint64_t sub_25C8EB590()
{
  return MEMORY[0x270F675A0]();
}

uint64_t sub_25C8EB5A0()
{
  return MEMORY[0x270F675A8]();
}

uint64_t sub_25C8EB5B0()
{
  return MEMORY[0x270F675B8]();
}

uint64_t sub_25C8EB5C0()
{
  return MEMORY[0x270F675C0]();
}

uint64_t sub_25C8EB5D0()
{
  return MEMORY[0x270F675C8]();
}

uint64_t sub_25C8EB5E0()
{
  return MEMORY[0x270F67600]();
}

uint64_t sub_25C8EB5F0()
{
  return MEMORY[0x270F67608]();
}

uint64_t sub_25C8EB600()
{
  return MEMORY[0x270F67660]();
}

uint64_t sub_25C8EB610()
{
  return MEMORY[0x270F67678]();
}

uint64_t sub_25C8EB620()
{
  return MEMORY[0x270F67688]();
}

uint64_t sub_25C8EB630()
{
  return MEMORY[0x270F67690]();
}

uint64_t sub_25C8EB640()
{
  return MEMORY[0x270F676E0]();
}

uint64_t sub_25C8EB650()
{
  return MEMORY[0x270F67718]();
}

uint64_t sub_25C8EB660()
{
  return MEMORY[0x270F67720]();
}

uint64_t sub_25C8EB670()
{
  return MEMORY[0x270F67730]();
}

uint64_t sub_25C8EB680()
{
  return MEMORY[0x270F67750]();
}

uint64_t sub_25C8EB690()
{
  return MEMORY[0x270F67778]();
}

uint64_t sub_25C8EB6A0()
{
  return MEMORY[0x270F67798]();
}

uint64_t sub_25C8EB6B0()
{
  return MEMORY[0x270F677A0]();
}

uint64_t sub_25C8EB6C0()
{
  return MEMORY[0x270F677B0]();
}

uint64_t sub_25C8EB6D0()
{
  return MEMORY[0x270F677C0]();
}

uint64_t sub_25C8EB6E0()
{
  return MEMORY[0x270F677D8]();
}

uint64_t sub_25C8EB6F0()
{
  return MEMORY[0x270F677F0]();
}

uint64_t sub_25C8EB700()
{
  return MEMORY[0x270F67800]();
}

uint64_t sub_25C8EB710()
{
  return MEMORY[0x270F67820]();
}

uint64_t sub_25C8EB720()
{
  return MEMORY[0x270F67828]();
}

uint64_t sub_25C8EB730()
{
  return MEMORY[0x270F67908]();
}

uint64_t sub_25C8EB740()
{
  return MEMORY[0x270F67930]();
}

uint64_t sub_25C8EB750()
{
  return MEMORY[0x270F67A78]();
}

uint64_t sub_25C8EB760()
{
  return MEMORY[0x270F67B98]();
}

uint64_t sub_25C8EB770()
{
  return MEMORY[0x270F67BA0]();
}

uint64_t sub_25C8EB780()
{
  return MEMORY[0x270F67BC0]();
}

uint64_t sub_25C8EB790()
{
  return MEMORY[0x270F67BC8]();
}

uint64_t sub_25C8EB7A0()
{
  return MEMORY[0x270F67BD0]();
}

uint64_t sub_25C8EB7B0()
{
  return MEMORY[0x270F67BE8]();
}

uint64_t sub_25C8EB7E0()
{
  return MEMORY[0x270F67C28]();
}

uint64_t sub_25C8EB7F0()
{
  return MEMORY[0x270F67C30]();
}

uint64_t sub_25C8EB800()
{
  return MEMORY[0x270F67C38]();
}

uint64_t sub_25C8EB820()
{
  return MEMORY[0x270F67D28]();
}

uint64_t sub_25C8EB830()
{
  return MEMORY[0x270F67D40]();
}

uint64_t sub_25C8EB840()
{
  return MEMORY[0x270F67D58]();
}

uint64_t sub_25C8EB850()
{
  return MEMORY[0x270F67D60]();
}

uint64_t sub_25C8EB860()
{
  return MEMORY[0x270F67D70]();
}

uint64_t sub_25C8EB870()
{
  return MEMORY[0x270F67F68]();
}

uint64_t sub_25C8EB880()
{
  return MEMORY[0x270F67F70]();
}

uint64_t sub_25C8EB890()
{
  return MEMORY[0x270F67F78]();
}

uint64_t sub_25C8EB8A0()
{
  return MEMORY[0x270F68160]();
}

uint64_t sub_25C8EB8D0()
{
  return MEMORY[0x270F681A8]();
}

uint64_t sub_25C8EB8E0()
{
  return MEMORY[0x270F681B0]();
}

uint64_t sub_25C8EB8F0()
{
  return MEMORY[0x270F681B8]();
}

uint64_t sub_25C8EB900()
{
  return MEMORY[0x270F68220]();
}

uint64_t sub_25C8EB910()
{
  return MEMORY[0x270F68230]();
}

uint64_t sub_25C8EB920()
{
  return MEMORY[0x270F68258]();
}

uint64_t sub_25C8EB930()
{
  return MEMORY[0x270F68260]();
}

uint64_t sub_25C8EB940()
{
  return MEMORY[0x270F68268]();
}

uint64_t sub_25C8EB950()
{
  return MEMORY[0x270F682A0]();
}

uint64_t sub_25C8EB960()
{
  return MEMORY[0x270F682B8]();
}

uint64_t sub_25C8EB970()
{
  return MEMORY[0x270F68378]();
}

uint64_t sub_25C8EB980()
{
  return MEMORY[0x270F68388]();
}

uint64_t sub_25C8EB990()
{
  return MEMORY[0x270F683A8]();
}

uint64_t sub_25C8EB9A0()
{
  return MEMORY[0x270F683B8]();
}

uint64_t sub_25C8EB9B0()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_25C8EB9C0()
{
  return MEMORY[0x270F6A370]();
}

uint64_t sub_25C8EB9D0()
{
  return MEMORY[0x270F6A4F8]();
}

uint64_t sub_25C8EB9E0()
{
  return MEMORY[0x270F6A7B8]();
}

uint64_t sub_25C8EB9F0()
{
  return MEMORY[0x270F6A860]();
}

uint64_t sub_25C8EBA00()
{
  return MEMORY[0x270F6A868]();
}

uint64_t sub_25C8EBA10()
{
  return MEMORY[0x270F6AAB8]();
}

uint64_t sub_25C8EBA20()
{
  return MEMORY[0x270F6AAC0]();
}

uint64_t sub_25C8EBA30()
{
  return MEMORY[0x270F6AAC8]();
}

uint64_t sub_25C8EBA40()
{
  return MEMORY[0x270F6AC20]();
}

uint64_t sub_25C8EBA50()
{
  return MEMORY[0x270F6ACB0]();
}

uint64_t sub_25C8EBA60()
{
  return MEMORY[0x270F6ACB8]();
}

uint64_t sub_25C8EBA70()
{
  return MEMORY[0x270F6ADB0]();
}

uint64_t sub_25C8EBA80()
{
  return MEMORY[0x270F6ADB8]();
}

uint64_t sub_25C8EBA90()
{
  return MEMORY[0x270F6ADC0]();
}

uint64_t sub_25C8EBAA0()
{
  return MEMORY[0x270F6BB20]();
}

uint64_t sub_25C8EBAB0()
{
  return MEMORY[0x270F6BB38]();
}

uint64_t sub_25C8EBAD0()
{
  return MEMORY[0x270F6BFA0]();
}

uint64_t sub_25C8EBAE0()
{
  return MEMORY[0x270F6BFC0]();
}

uint64_t sub_25C8EBAF0()
{
  return MEMORY[0x270F6C108]();
}

uint64_t sub_25C8EBB00()
{
  return MEMORY[0x270F6C110]();
}

uint64_t sub_25C8EBB10()
{
  return MEMORY[0x270F6C190]();
}

uint64_t sub_25C8EBB20()
{
  return MEMORY[0x270F6C848]();
}

uint64_t sub_25C8EBB30()
{
  return MEMORY[0x270F6C948]();
}

uint64_t sub_25C8EBB40()
{
  return MEMORY[0x270F6C950]();
}

uint64_t sub_25C8EBB50()
{
  return MEMORY[0x270F6C9C8]();
}

uint64_t sub_25C8EBB60()
{
  return MEMORY[0x270F6C9D0]();
}

uint64_t sub_25C8EBB70()
{
  return MEMORY[0x270F6C9D8]();
}

uint64_t sub_25C8EBBB0()
{
  return MEMORY[0x270F6CCA0]();
}

uint64_t sub_25C8EBBC0()
{
  return MEMORY[0x270F6CD60]();
}

uint64_t sub_25C8EBBD0()
{
  return MEMORY[0x270F6CD68]();
}

uint64_t sub_25C8EBBE0()
{
  return MEMORY[0x270F6CD70]();
}

uint64_t sub_25C8EBBF0()
{
  return MEMORY[0x270F6CDB0]();
}

uint64_t sub_25C8EBC00()
{
  return MEMORY[0x270F6CE20]();
}

uint64_t sub_25C8EBC10()
{
  return MEMORY[0x270F6CE28]();
}

uint64_t sub_25C8EBC20()
{
  return MEMORY[0x270F6CEB8]();
}

uint64_t sub_25C8EBC30()
{
  return MEMORY[0x270F6CEC0]();
}

uint64_t sub_25C8EBC40()
{
  return MEMORY[0x270F6D050]();
}

uint64_t sub_25C8EBC50()
{
  return MEMORY[0x270F6D060]();
}

uint64_t sub_25C8EBC60()
{
  return MEMORY[0x270F6D0A8]();
}

uint64_t sub_25C8EBC70()
{
  return MEMORY[0x270F6D0E8]();
}

uint64_t sub_25C8EBC80()
{
  return MEMORY[0x270F6D0F0]();
}

uint64_t sub_25C8EBC90()
{
  return MEMORY[0x270F6D200]();
}

uint64_t sub_25C8EBCA0()
{
  return MEMORY[0x270F6D510]();
}

uint64_t sub_25C8EBCB0()
{
  return MEMORY[0x270F6D7B8]();
}

uint64_t sub_25C8EBCC0()
{
  return MEMORY[0x270F6D7C0]();
}

uint64_t sub_25C8EBCD0()
{
  return MEMORY[0x270F6D7F8]();
}

uint64_t sub_25C8EBCE0()
{
  return MEMORY[0x270F6DB60]();
}

uint64_t sub_25C8EBCF0()
{
  return MEMORY[0x270F6DB78]();
}

uint64_t sub_25C8EBD00()
{
  return MEMORY[0x270F6DB80]();
}

uint64_t sub_25C8EBD20()
{
  return MEMORY[0x270F6E200]();
}

uint64_t sub_25C8EBD30()
{
  return MEMORY[0x270F6E370]();
}

uint64_t sub_25C8EBD40()
{
  return MEMORY[0x270F6E3C0]();
}

uint64_t sub_25C8EBD50()
{
  return MEMORY[0x270F6E3E0]();
}

uint64_t sub_25C8EBD60()
{
  return MEMORY[0x270F6E650]();
}

uint64_t sub_25C8EBD70()
{
  return MEMORY[0x270F6E658]();
}

uint64_t sub_25C8EBD80()
{
  return MEMORY[0x270F6E660]();
}

uint64_t sub_25C8EBD90()
{
  return MEMORY[0x270F6E718]();
}

uint64_t sub_25C8EBDA0()
{
  return MEMORY[0x270F6EE90]();
}

uint64_t sub_25C8EBDB0()
{
  return MEMORY[0x270F6EE98]();
}

uint64_t sub_25C8EBDC0()
{
  return MEMORY[0x270F6F358]();
}

uint64_t sub_25C8EBDD0()
{
  return MEMORY[0x270F6F408]();
}

uint64_t sub_25C8EBDE0()
{
  return MEMORY[0x270F6F410]();
}

uint64_t sub_25C8EBDF0()
{
  return MEMORY[0x270F6F438]();
}

uint64_t sub_25C8EBE00()
{
  return MEMORY[0x270F6F4B0]();
}

uint64_t sub_25C8EBE10()
{
  return MEMORY[0x270F683D8]();
}

uint64_t sub_25C8EBE20()
{
  return MEMORY[0x270F652C0]();
}

uint64_t sub_25C8EBE30()
{
  return MEMORY[0x270F728F8]();
}

uint64_t sub_25C8EBE40()
{
  return MEMORY[0x270F72910]();
}

uint64_t sub_25C8EBE50()
{
  return MEMORY[0x270F72918]();
}

uint64_t sub_25C8EBE60()
{
  return MEMORY[0x270F72A20]();
}

uint64_t sub_25C8EBE70()
{
  return MEMORY[0x270F72A28]();
}

uint64_t sub_25C8EBE90()
{
  return MEMORY[0x270F72AD8]();
}

uint64_t sub_25C8EBEA0()
{
  return MEMORY[0x270F64E98]();
}

uint64_t sub_25C8EBEB0()
{
  return MEMORY[0x270F64EA0]();
}

uint64_t sub_25C8EBEC0()
{
  return MEMORY[0x270F64F30]();
}

uint64_t sub_25C8EBED0()
{
  return MEMORY[0x270F64F48]();
}

uint64_t sub_25C8EBEE0()
{
  return MEMORY[0x270F64FC0]();
}

uint64_t sub_25C8EBEF0()
{
  return MEMORY[0x270F65158]();
}

uint64_t sub_25C8EBF00()
{
  return MEMORY[0x270F65180]();
}

uint64_t sub_25C8EBF10()
{
  return MEMORY[0x270F69BC0]();
}

uint64_t sub_25C8EBF20()
{
  return MEMORY[0x270F69BC8]();
}

uint64_t sub_25C8EBF30()
{
  return MEMORY[0x270F69BD8]();
}

uint64_t sub_25C8EBF40()
{
  return MEMORY[0x270F63AD8]();
}

uint64_t sub_25C8EBF50()
{
  return MEMORY[0x270F63B10]();
}

uint64_t sub_25C8EBF60()
{
  return MEMORY[0x270F647D8]();
}

uint64_t sub_25C8EBF70()
{
  return MEMORY[0x270F647E0]();
}

uint64_t sub_25C8EBF80()
{
  return MEMORY[0x270F647E8]();
}

uint64_t sub_25C8EBF90()
{
  return MEMORY[0x270F65318]();
}

uint64_t sub_25C8EBFA0()
{
  return MEMORY[0x270F65360]();
}

uint64_t sub_25C8EBFB0()
{
  return MEMORY[0x270F65380]();
}

uint64_t sub_25C8EBFC0()
{
  return MEMORY[0x270F65388]();
}

uint64_t sub_25C8EBFD0()
{
  return MEMORY[0x270F72E50]();
}

uint64_t sub_25C8EBFE0()
{
  return MEMORY[0x270F72E68]();
}

uint64_t sub_25C8EBFF0()
{
  return MEMORY[0x270F72E78]();
}

uint64_t sub_25C8EC000()
{
  return MEMORY[0x270F72E80]();
}

uint64_t sub_25C8EC010()
{
  return MEMORY[0x270F72E98]();
}

uint64_t sub_25C8EC020()
{
  return MEMORY[0x270F72EA8]();
}

uint64_t sub_25C8EC050()
{
  return MEMORY[0x270F72F78]();
}

uint64_t sub_25C8EC060()
{
  return MEMORY[0x270F72F80]();
}

uint64_t sub_25C8EC070()
{
  return MEMORY[0x270F72F98]();
}

uint64_t sub_25C8EC080()
{
  return MEMORY[0x270F72FA0]();
}

uint64_t sub_25C8EC090()
{
  return MEMORY[0x270FA2C90]();
}

uint64_t sub_25C8EC0A0()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_25C8EC0B0()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_25C8EC0C0()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_25C8EC0D0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25C8EC0E0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25C8EC0F0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25C8EC100()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25C8EC110()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25C8EC120()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_25C8EC130()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_25C8EC140()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_25C8EC150()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25C8EC160()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25C8EC170()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25C8EC180()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25C8EC190()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_25C8EC1A0()
{
  return MEMORY[0x270F65190]();
}

uint64_t sub_25C8EC1B0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25C8EC1C0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25C8EC1D0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25C8EC1E0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25C8EC1F0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25C8EC200()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25C8EC210()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25C8EC220()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25C8EC230()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25C8EC240()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25C8EC250()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25C8EC260()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_25C8EC270()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25C8EC280()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_25C8EC290()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_25C8EC2A0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25C8EC2B0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25C8EC2C0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25C8EC2D0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25C8EC2E0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25C8EC2F0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25C8EC300()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_25C8EC310()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_25C8EC320()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_25C8EC330()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_25C8EC340()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_25C8EC350()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25C8EC360()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25C8EC370()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25C8EC380()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_25C8EC390()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25C8EC3A0()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_25C8EC3B0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25C8EC3C0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25C8EC3D0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25C8EC3E0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25C8EC3F0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25C8EC400()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25C8EC410()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_25C8EC420()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_25C8EC430()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_25C8EC440()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_25C8EC450()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_25C8EC460()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25C8EC470()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_25C8EC480()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_25C8EC490()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_25C8EC4A0()
{
  return MEMORY[0x270F9EF88]();
}

uint64_t sub_25C8EC4B0()
{
  return MEMORY[0x270F9EFC8]();
}

uint64_t sub_25C8EC4C0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25C8EC4D0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25C8EC4E0()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_25C8EC4F0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25C8EC500()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25C8EC510()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25C8EC520()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_25C8EC530()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_25C8EC540()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25C8EC550()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25C8EC560()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_25C8EC590()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25C8EC5A0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25C8EC5B0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25C8EC5C0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25C8EC5D0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25C8EC5E0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25C8EC5F0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25C8EC600()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25C8EC610()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t INTypedObjectWithCustomObject()
{
  return MEMORY[0x270EF52D0]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
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

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x270EDAB48]();
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}