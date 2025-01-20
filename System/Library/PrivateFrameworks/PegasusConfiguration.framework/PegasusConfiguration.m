uint64_t getEnumTagSinglePayload for UserAgent(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 64))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(void *)(a1 + 16);
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

uint64_t sub_1B3852914()
{
  return sub_1B385293C() & 1;
}

uint64_t sub_1B385293C()
{
  OUTLINED_FUNCTION_1_7();
  v1 = (uint64_t *)OUTLINED_FUNCTION_2_4();
  sub_1B3852984(v1, v2);
  os_unfair_lock_unlock(v0);
  return v4;
}

uint64_t *sub_1B3852984@<X0>(uint64_t *result@<X0>, BOOL *a2@<X8>)
{
  BOOL v2 = result[1] > 0 || *(unsigned __int8 *)result - 1 < 2;
  *a2 = v2;
  return result;
}

uint64_t initializeWithCopy for UserAgent(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v3 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v3;
  uint64_t v4 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t storeEnumTagSinglePayload for UserAgent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)result = a2 ^ 0x80000000;
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

uint64_t sub_1B3852A68()
{
  uint64_t v1 = v0;
  char v2 = *(unsigned char *)(v0 + 80);
  v8[3] = &type metadata for ResourceAccessActivity;
  v8[4] = &off_1F0C12398;
  LOBYTE(v8[0]) = v2;
  uint64_t v3 = *(char *)__swift_project_boxed_opaque_existential_1(v8, (uint64_t)&type metadata for ResourceAccessActivity);
  if (qword_1EB7FA760 != -1) {
LABEL_13:
  }
    swift_once();
  uint64_t v4 = *(void *)(qword_1EB7FC0B0 + 16);
  if (v4)
  {
    for (uint64_t i = 0; ; ++i)
    {
      uint64_t v6 = i + 1;
      if (__OFADD__(i, 1))
      {
        __break(1u);
        goto LABEL_13;
      }
      if (qword_1B389DB90[*(char *)(qword_1EB7FC0B0 + 32 + i)] == qword_1B389DB90[v3]) {
        break;
      }
      if (v6 == v4) {
        return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v8);
      }
    }
    sub_1B389C3C0();
    if (qword_1EB7FA370 != -1) {
      swift_once();
    }
    swift_bridgeObjectRetain();
    sub_1B389C3C0();
    swift_bridgeObjectRelease();
    sub_1B38584F8(v2);
    sub_1B389C7D0();
    sub_1B389C3C0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1B389C3C0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_retain();
    sub_1B3852CB8(0xD000000000000010, 0x80000001B38A1DF0, v1);
    swift_bridgeObjectRelease();
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v8);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1B3852CB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    sub_1B389C7A0();
    return swift_release();
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0)
    {
      uint64_t v5 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
      uint64_t v6 = a1 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v5 = sub_1B389C7E0();
    }
    sub_1B3852DD4(v5, v6, (uint64_t (*)(void))sub_1B3852DFC);
    return swift_release();
  }
  *(void *)(a3 + 72) = os_transaction_create();
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_1B3852DD4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_1B3852DFC(uint64_t a1)
{
  return sub_1B3852E18(a1, v1);
}

uint64_t sub_1B3852E18(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 72) = os_transaction_create();
  return swift_unknownObjectRelease();
}

uint64_t destroy for UserAgent()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

unsigned char *sub_1B3852E98(unsigned char *result, char a2)
{
  *result = a2;
  return result;
}

uint64_t sub_1B3852EA0()
{
  uint64_t v0 = sub_1B3852EF4();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1B3852EF4()
{
  if ((*(unsigned char *)(v0 + 81) & 1) == 0) {
    sub_1B3856894();
  }
  uint64_t v1 = sub_1B38530BC();
  swift_release();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_1B3852F4C()
{
  if (*(unsigned char *)(v0 + 81) != 1) {
    (*(void (**)(void))(*(void *)v0 + 400))();
  }
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  OUTLINED_FUNCTION_4_5();
  sub_1B385305C(v0 + *(void *)(v1 + 136));
  OUTLINED_FUNCTION_4_5();
  uint64_t v3 = v0 + *(void *)(v2 + 144);
  sub_1B389BE20();
  OUTLINED_FUNCTION_17();
  (*(void (**)(uint64_t))(v4 + 8))(v3);
  swift_release();
  return v0;
}

uint64_t sub_1B385305C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FA850);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for SessionType()
{
  return &type metadata for SessionType;
}

uint64_t ConfigurationManager.configAccessProvider.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t NSFileManager.parsecdSessionFBDirectoryURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = sub_1B389BC30();
  OUTLINED_FUNCTION_1();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1();
  MEMORY[0x1F4188790]();
  sub_1B3858A8C(v1);
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v2, *MEMORY[0x1E4F276A8], v4);
  sub_1B38538CC();
  sub_1B389BCE0();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_3();
  v7();
  return OUTLINED_FUNCTION_55(a1, 0);
}

void SessionType.init(withClientIdentifier:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  if (a2)
  {
    a1 = sub_1B389C310();
    unint64_t v6 = v5;
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_3_10();
    unint64_t v7 = sub_1B38538CC();
    if (OUTLINED_FUNCTION_0_12(v7, MEMORY[0x1E4FBB1A0], v8, v9))
    {
      swift_bridgeObjectRelease();
      a1 = 0;
      unint64_t v6 = 1;
    }
    else
    {
      OUTLINED_FUNCTION_3_10();
      if (OUTLINED_FUNCTION_0_12(v10, MEMORY[0x1E4FBB1A0], v11, v12))
      {
        swift_bridgeObjectRelease();
        a1 = 0;
        unint64_t v6 = 2;
      }
      else
      {
        OUTLINED_FUNCTION_3_10();
        if (OUTLINED_FUNCTION_0_12(v13, MEMORY[0x1E4FBB1A0], v14, v15))
        {
          swift_bridgeObjectRelease();
          a1 = 0;
          unint64_t v6 = 3;
        }
        else
        {
          OUTLINED_FUNCTION_3_10();
          if (OUTLINED_FUNCTION_0_12(v16, MEMORY[0x1E4FBB1A0], v17, v18))
          {
            swift_bridgeObjectRelease();
            a1 = 0;
            unint64_t v6 = 4;
          }
          else
          {
            OUTLINED_FUNCTION_3_10();
            if (OUTLINED_FUNCTION_0_12(v19, MEMORY[0x1E4FBB1A0], v20, v21))
            {
              swift_bridgeObjectRelease();
              a1 = 0;
              unint64_t v6 = 5;
            }
            else
            {
              OUTLINED_FUNCTION_3_10();
              if (OUTLINED_FUNCTION_0_12(v22, MEMORY[0x1E4FBB1A0], v23, v24))
              {
                swift_bridgeObjectRelease();
                a1 = 0;
                unint64_t v6 = 6;
              }
              else
              {
                OUTLINED_FUNCTION_3_10();
                uint64_t v28 = OUTLINED_FUNCTION_0_12(v25, MEMORY[0x1E4FBB1A0], v26, v27);
                if (v28)
                {
                  swift_bridgeObjectRelease();
                  a1 = 0;
                  unint64_t v6 = 8;
                }
                else if (OUTLINED_FUNCTION_0_12(v28, MEMORY[0x1E4FBB1A0], v29, v30, a1, v6, 0xD000000000000010, 0x80000001B38A1610) & 1) != 0|| (OUTLINED_FUNCTION_3_10(), (OUTLINED_FUNCTION_0_12(v31, MEMORY[0x1E4FBB1A0], v32, v33)))
                {
                  swift_bridgeObjectRelease();
                  a1 = 0;
                  unint64_t v6 = 9;
                }
                else
                {
                  OUTLINED_FUNCTION_3_10();
                  if (OUTLINED_FUNCTION_0_12(v34, MEMORY[0x1E4FBB1A0], v35, v36))
                  {
                    swift_bridgeObjectRelease();
                    a1 = 0;
                    unint64_t v6 = 10;
                  }
                  else
                  {
                    OUTLINED_FUNCTION_3_10();
                    if (OUTLINED_FUNCTION_0_12(v37, MEMORY[0x1E4FBB1A0], v38, v39))
                    {
                      swift_bridgeObjectRelease();
                      a1 = 0;
                      unint64_t v6 = 11;
                    }
                    else
                    {
                      OUTLINED_FUNCTION_3_10();
                      if ((OUTLINED_FUNCTION_0_12(v40, MEMORY[0x1E4FBB1A0], v41, v42) & 1) != 0
                        || (OUTLINED_FUNCTION_3_10(),
                            (OUTLINED_FUNCTION_0_12(v43, MEMORY[0x1E4FBB1A0], v44, v45) & 1) != 0))
                      {
                        swift_bridgeObjectRelease();
                        a1 = 0;
                        unint64_t v6 = 12;
                      }
                      else
                      {
                        OUTLINED_FUNCTION_3_10();
                        if ((OUTLINED_FUNCTION_0_12(v46, MEMORY[0x1E4FBB1A0], v47, v48) & 1) != 0
                          || (OUTLINED_FUNCTION_3_10(),
                              (OUTLINED_FUNCTION_0_12(v49, MEMORY[0x1E4FBB1A0], v50, v51) & 1) != 0))
                        {
                          swift_bridgeObjectRelease();
                          a1 = 0;
                          unint64_t v6 = 13;
                        }
                        else
                        {
                          OUTLINED_FUNCTION_3_10();
                          if (OUTLINED_FUNCTION_0_12(v52, MEMORY[0x1E4FBB1A0], v53, v54))
                          {
                            swift_bridgeObjectRelease();
                            a1 = 0;
                            unint64_t v6 = 15;
                          }
                          else
                          {
                            OUTLINED_FUNCTION_3_10();
                            if (OUTLINED_FUNCTION_0_12(v55, MEMORY[0x1E4FBB1A0], v56, v57))
                            {
                              swift_bridgeObjectRelease();
                              a1 = 0;
                              unint64_t v6 = 16;
                            }
                            else
                            {
                              OUTLINED_FUNCTION_3_10();
                              if (OUTLINED_FUNCTION_0_12(v58, MEMORY[0x1E4FBB1A0], v59, v60))
                              {
                                swift_bridgeObjectRelease();
                                a1 = 0;
                                unint64_t v6 = 14;
                              }
                              else
                              {
                                OUTLINED_FUNCTION_3_10();
                                if (OUTLINED_FUNCTION_0_12(v61, MEMORY[0x1E4FBB1A0], v62, v63))
                                {
                                  swift_bridgeObjectRelease();
                                  a1 = 0;
                                  unint64_t v6 = 7;
                                }
                                else
                                {
                                  if (qword_1EB7FAAD8 != -1) {
                                    swift_once();
                                  }
                                  uint64_t v64 = sub_1B389C1B0();
                                  __swift_project_value_buffer(v64, (uint64_t)qword_1EB7FC100);
                                  swift_bridgeObjectRetain_n();
                                  v65 = sub_1B389C190();
                                  os_log_type_t v66 = sub_1B389C5B0();
                                  if (os_log_type_enabled(v65, v66))
                                  {
                                    v67 = (uint8_t *)swift_slowAlloc();
                                    uint64_t v68 = swift_slowAlloc();
                                    uint64_t v69 = v68;
                                    *(_DWORD *)v67 = 136446210;
                                    swift_bridgeObjectRetain();
                                    sub_1B3855F24(a1, v6, &v69);
                                    sub_1B389C6C0();
                                    swift_bridgeObjectRelease_n();
                                    _os_log_impl(&dword_1B3850000, v65, v66, "Failed to get session type for %{public}s", v67, 0xCu);
                                    swift_arrayDestroy();
                                    MEMORY[0x1B3EBAF20](v68, -1, -1);
                                    MEMORY[0x1B3EBAF20](v67, -1, -1);
                                  }
                                  else
                                  {

                                    swift_bridgeObjectRelease_n();
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  *a3 = a1;
  a3[1] = v6;
}

unint64_t sub_1B38538CC()
{
  unint64_t result = qword_1EB7FBF98;
  if (!qword_1EB7FBF98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB7FBF98);
  }
  return result;
}

uint64_t sub_1B3853918()
{
  return sub_1B389CA40();
}

uint64_t SessionType.hash(into:)()
{
  uint64_t v1 = v0[1];
  switch(v1)
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
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
      uint64_t result = sub_1B389CA20();
      break;
    default:
      uint64_t v2 = *v0;
      sub_1B389CA20();
      if (v1)
      {
        sub_1B389CA30();
        swift_bridgeObjectRetain();
        sub_1B389C370();
        uint64_t result = sub_1B3859F9C(v2, v1);
      }
      else
      {
        uint64_t result = sub_1B389CA30();
      }
      break;
  }
  return result;
}

ValueMetadata *type metadata accessor for UserAgent()
{
  return &type metadata for UserAgent;
}

uint64_t dispatch thunk of ConfigAccessProvider.hasPendingTasks.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t PegasusClientName.rawValue.getter()
{
  uint64_t result = 0xD000000000000012;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x697261666173;
      break;
    case 2:
      uint64_t result = 0x6867696C746F7073;
      break;
    case 3:
      uint64_t result = 1769105779;
      break;
    case 4:
      uint64_t result = 0x70756B6F6F6CLL;
      break;
    case 5:
      uint64_t result = 0x736567617373656DLL;
      break;
    case 6:
      uint64_t result = 1937204590;
      break;
    case 7:
      uint64_t result = 0x64636573726170;
      break;
    case 8:
      uint64_t result = 0x745F636573726170;
      break;
    case 9:
      unsigned int v2 = 1701998435;
      goto LABEL_14;
    case 0xA:
      uint64_t result = 0x7475746867696C66;
      break;
    case 0xB:
      unsigned int v2 = 1936744813;
LABEL_14:
      uint64_t result = v2 | 0x6767757300000000;
      break;
    case 0xC:
      uint64_t result = 1818845549;
      break;
    case 0xD:
    case 0x1D:
      return result;
    case 0xE:
      uint64_t result = 0x6F72657473797274;
      break;
    case 0xF:
      uint64_t result = 0x6570786574657564;
      break;
    case 0x10:
      uint64_t result = 0xD000000000000010;
      break;
    case 0x11:
      uint64_t result = 0x616E61616964656DLL;
      break;
    case 0x12:
    case 0x1B:
    case 0x1C:
      uint64_t result = 0xD000000000000015;
      break;
    case 0x13:
      uint64_t result = 0x6B73757361676570;
      break;
    case 0x14:
      uint64_t result = 0x736F746F6870;
      break;
    case 0x15:
      uint64_t result = 0x6369706F746F6870;
      break;
    case 0x16:
      uint64_t result = 0xD000000000000014;
      break;
    case 0x17:
      uint64_t result = 0xD000000000000010;
      break;
    case 0x18:
      uint64_t result = 0xD000000000000017;
      break;
    case 0x19:
      uint64_t result = 0x6361666B636F6C63;
      break;
    case 0x1A:
      uint64_t result = 0x657370756B6F6F6CLL;
      break;
    default:
      uint64_t result = 0x6E776F6E6B6E55;
      break;
  }
  return result;
}

uint64_t sub_1B3853DB0(unsigned __int8 *a1)
{
  return *a1;
}

uint64_t dispatch thunk of ConfigAccessProvider.currentConfig.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_1B3853DCC()
{
  sub_1B3853E04(v0 + 16);

  return MEMORY[0x1F4186488](v0, 32, 7);
}

uint64_t sub_1B3853E04(uint64_t a1)
{
  return a1;
}

unint64_t destroy for SessionType(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  int v2 = -1;
  if (result < 0xFFFFFFFF) {
    int v2 = result;
  }
  if ((v2 + 1) <= 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s20PegasusConfiguration11SessionTypeOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  LODWORD(v4) = -1;
  if (v3 < 0xFFFFFFFF) {
    uint64_t v4 = *(void *)(a2 + 8);
  }
  if ((v4 + 1) > 1)
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

uint64_t sub_1B3853EAC()
{
  uint64_t v29 = v0;
  sub_1B38540E0(*(void *)(v0 + 224), (uint64_t)v22);
  uint64_t v2 = v22[0];
  uint64_t v1 = v22[1];
  *(void *)(v0 + 240) = v22[0];
  *(void *)(v0 + 248) = v1;
  uint64_t v3 = v23;
  uint64_t v4 = v24;
  *(void *)(v0 + 256) = v23;
  *(void *)(v0 + 264) = v4;
  uint64_t v5 = v25;
  uint64_t v6 = v26;
  *(void *)(v0 + 272) = v25;
  *(void *)(v0 + 280) = v6;
  uint64_t v7 = v27;
  uint64_t v8 = v28;
  *(void *)(v0 + 288) = v27;
  *(void *)(v0 + 296) = v8;
  if (v3)
  {
    if (v2)
    {
      char v9 = v4 & 1;
      if (*(unsigned char *)(v0 + 336) == 1)
      {
        *(void *)(v0 + 160) = v2;
        *(void *)(v0 + 168) = v1;
        *(void *)(v0 + 176) = v3;
        *(unsigned char *)(v0 + 184) = v9;
        *(void *)(v0 + 192) = v5;
        *(void *)(v0 + 200) = v6;
        *(void *)(v0 + 208) = v7;
        *(void *)(v0 + 216) = v8;
        uint64_t v10 = (void *)swift_task_alloc();
        *(void *)(v0 + 304) = v10;
        *uint64_t v10 = v0;
        v10[1] = sub_1B387569C;
        return sub_1B385F490(v0 + 160);
      }
      else
      {
        *(void *)(v0 + 96) = v2;
        *(void *)(v0 + 104) = v1;
        *(void *)(v0 + 112) = v3;
        *(unsigned char *)(v0 + 120) = v9;
        *(void *)(v0 + 128) = v5;
        *(void *)(v0 + 136) = v6;
        *(void *)(v0 + 144) = v7;
        *(void *)(v0 + 152) = v8;
        uint64_t v21 = (void *)swift_task_alloc();
        *(void *)(v0 + 320) = v21;
        *uint64_t v21 = v0;
        v21[1] = sub_1B3854D9C;
        return sub_1B385A270(v0 + 96);
      }
    }
    sub_1B3854EB4(0, v1, v3);
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CCEB60);
  inited = (__n128 *)swift_initStackObject();
  uint64_t v13 = OUTLINED_FUNCTION_11_1(inited, (__n128)xmmword_1B389D500);
  OUTLINED_FUNCTION_3_2((uint64_t)v13, MEMORY[0x1E4FBB1A0], v14);
  uint64_t v15 = sub_1B389C230();
  id v16 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  unint64_t v17 = OUTLINED_FUNCTION_9_1();
  sub_1B3875B14(v17, v18, v19, v15);
  swift_willThrow();
  OUTLINED_FUNCTION_6();
  return v20();
}

double sub_1B38540E0@<D0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (a1 == 8)
  {
LABEL_4:
    Client.init(_:)(a1, (unint64_t *)&v17);
    long long v15 = v17;
    uint64_t v16 = v18;
    char v14 = 0;
    UserAgent.init(_:requestor:)((uint64_t *)&v15, &v14, (uint64_t)&v19);
    uint64_t v3 = v20;
    uint64_t v4 = v21;
    long long v5 = v22;
    uint64_t v6 = v23;
    uint64_t v7 = v24;
    *(_OWORD *)a2 = v19;
    *(void *)(a2 + 16) = v3;
    *(void *)(a2 + 24) = v4;
    *(_OWORD *)(a2 + 32) = v5;
    *(void *)(a2 + 48) = v6;
    *(void *)(a2 + 56) = v7;
    return *(double *)&v5;
  }
  if (a1 != 7)
  {
    if (a1 != 5)
    {
      *(void *)&long long v5 = 0;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      return *(double *)&v5;
    }
    goto LABEL_4;
  }
  if (qword_1EB7FA9A8 != -1) {
    swift_once();
  }
  uint64_t v8 = qword_1EB7FA9D0;
  uint64_t v9 = byte_1EB7FA9D8;
  long long v10 = xmmword_1EB7FA9E0;
  uint64_t v11 = qword_1EB7FA9F0;
  uint64_t v12 = unk_1EB7FA9F8;
  *(_OWORD *)a2 = xmmword_1EB7FA9C0;
  *(void *)(a2 + 16) = v8;
  *(void *)(a2 + 24) = v9;
  *(_OWORD *)(a2 + 32) = v10;
  *(void *)(a2 + 48) = v11;
  *(void *)(a2 + 56) = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  swift_bridgeObjectRetain();
  return *(double *)&v5;
}

uint64_t sub_1B385421C()
{
  uint64_t v1 = *(void *)(v0 + 240);
  uint64_t v2 = *(os_unfair_lock_s **)(*(void *)(v1 + 24) + 16);
  swift_retain();
  os_unfair_lock_lock(v2);
  uint64_t v3 = *(void *)(v1 + 16);
  swift_unknownObjectRetain();
  os_unfair_lock_unlock(v2);
  swift_release();
  return v3;
}

ValueMetadata *type metadata accessor for PegasusClientName()
{
  return &type metadata for PegasusClientName;
}

uint64_t UserAgent.fullString.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

ValueMetadata *type metadata accessor for Requestor()
{
  return &type metadata for Requestor;
}

uint64_t sub_1B38542CC()
{
  MEMORY[0x1B3EBAF20](*(void *)(v0 + 16), -1, -1);

  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t destroy for Client()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeBufferWithCopyOfBuffer for Client(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

ValueMetadata *type metadata accessor for Client()
{
  return &type metadata for Client;
}

uint64_t Client.type.getter()
{
  return *(void *)v0;
}

unsigned char *storeEnumTagSinglePayload for ShouldThrottleConfigFetchResult(unsigned char *result, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3 + 3;
  if (a3 + 3 >= 0xFFFF00) {
    int v4 = 4;
  }
  else {
    int v4 = 2;
  }
  if (v3 >> 8 < 0xFF) {
    int v4 = 1;
  }
  if (v3 >= 0x100) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 0;
  }
  if (a3 >= 0xFD) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v7 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
    switch(v6)
    {
      case 1:
        result[1] = v7;
        break;
      case 2:
        *(_WORD *)(result + 1) = v7;
        break;
      case 3:
LABEL_25:
        __break(1u);
        break;
      case 4:
        *(_DWORD *)(result + 1) = v7;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v6)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_19;
      case 3:
        goto LABEL_25;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      default:
LABEL_19:
        if (a2) {
LABEL_20:
        }
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

void type metadata accessor for ShouldThrottleConfigFetchResult()
{
}

ValueMetadata *type metadata accessor for URLDataSourceOutput()
{
  return &type metadata for URLDataSourceOutput;
}

void destroy for BiomeStreamConfig(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v2 = *(void **)(a1 + 40);
}

uint64_t parsecdUserAgent.getter()
{
  if (qword_1EB7FA9A8 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_1_8((uint64_t)&xmmword_1EB7FA9C0);
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

uint64_t sub_1B3854524(char a1)
{
  uint64_t v2 = sub_1B389C1B0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v6 = &v27[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v4);
  uint64_t v8 = &v27[-v7];
  sub_1B3854954(a1);
  uint64_t v9 = (void *)sub_1B389C280();
  swift_bridgeObjectRelease();
  uint64_t v10 = MGCopyAnswer();

  if (v10 && (uint64_t v31 = v10, swift_dynamicCast()))
  {
    uint64_t v11 = v30;
    if (qword_1EB7FC020 != -1) {
      swift_once();
    }
    uint64_t v12 = __swift_project_value_buffer(v2, (uint64_t)qword_1EB7FC028);
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v3 + 16))(v8, v12, v2);
    uint64_t v13 = sub_1B389C190();
    os_log_type_t v14 = sub_1B389C5A0();
    int v15 = v14;
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v16 = swift_slowAlloc();
      int v28 = v15;
      uint64_t v17 = v16;
      uint64_t v29 = swift_slowAlloc();
      uint64_t v30 = v29;
      *(_DWORD *)uint64_t v17 = 136315395;
      uint64_t v31 = OUTLINED_FUNCTION_2_1();
      OUTLINED_FUNCTION_0_1();
      *(_WORD *)(v17 + 12) = 2085;
      unint64_t v18 = sub_1B3854954(a1);
      uint64_t v31 = sub_1B3855F24(v18, v19, &v30);
      OUTLINED_FUNCTION_0_1();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B3850000, v13, (os_log_type_t)v28, "Got value of type %s for MGQuery with key %{sensitive}s", (uint8_t *)v17, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
    }

    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v8, v2);
  }
  else
  {
    if (qword_1EB7FC020 != -1) {
      swift_once();
    }
    uint64_t v20 = __swift_project_value_buffer(v2, (uint64_t)qword_1EB7FC028);
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v3 + 16))(v6, v20, v2);
    unsigned __int8 v21 = sub_1B389C190();
    os_log_type_t v22 = sub_1B389C5B0();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 136315395;
      uint64_t v31 = OUTLINED_FUNCTION_2_1();
      OUTLINED_FUNCTION_0_1();
      *(_WORD *)(v23 + 12) = 2085;
      unint64_t v24 = sub_1B3854954(a1);
      uint64_t v31 = sub_1B3855F24(v24, v25, &v30);
      OUTLINED_FUNCTION_0_1();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B3850000, v21, v22, "Did not get value of type %s for MGQuery with key %{sensitive}s", (uint8_t *)v23, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
    }

    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v6, v2);
    return 0;
  }
  return v11;
}

unint64_t sub_1B3854954(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x4E746375646F7250;
      break;
    case 2:
      unint64_t result = 0x54746375646F7250;
      break;
    case 3:
      unint64_t result = 0x56746375646F7250;
      break;
    case 4:
      unint64_t result = 0x6F436E6F69676552;
      break;
    case 5:
      unint64_t result = 0x6C616E7265746E49;
      break;
    case 6:
      return result;
    case 7:
      unint64_t result = 0x48746375646F7250;
      break;
    default:
      unint64_t result = 0x726556646C697542;
      break;
  }
  return result;
}

uint64_t static SessionType.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  switch(v3)
  {
    case 1:
      if (v5 != 1) {
        goto LABEL_45;
      }
      uint64_t v6 = OUTLINED_FUNCTION_4_12(*a1, 1);
      sub_1B3859F9C(v6, 1);
      return v5;
    case 2:
      if (v5 != 2) {
        goto LABEL_45;
      }
      uint64_t v10 = OUTLINED_FUNCTION_4_12(*a1, 2);
      uint64_t v11 = 2;
      goto LABEL_43;
    case 3:
      if (v5 != 3) {
        goto LABEL_45;
      }
      uint64_t v10 = OUTLINED_FUNCTION_4_12(*a1, 3);
      uint64_t v11 = 3;
      goto LABEL_43;
    case 4:
      if (v5 != 4) {
        goto LABEL_45;
      }
      uint64_t v10 = OUTLINED_FUNCTION_4_12(*a1, 4);
      uint64_t v11 = 4;
      goto LABEL_43;
    case 5:
      if (v5 != 5) {
        goto LABEL_45;
      }
      uint64_t v10 = OUTLINED_FUNCTION_4_12(*a1, 5);
      uint64_t v11 = 5;
      goto LABEL_43;
    case 6:
      if (v5 != 6) {
        goto LABEL_45;
      }
      uint64_t v10 = OUTLINED_FUNCTION_4_12(*a1, 6);
      uint64_t v11 = 6;
      goto LABEL_43;
    case 7:
      if (v5 != 7) {
        goto LABEL_45;
      }
      uint64_t v10 = OUTLINED_FUNCTION_4_12(*a1, 7);
      uint64_t v11 = 7;
      goto LABEL_43;
    case 8:
      if (v5 != 8) {
        goto LABEL_45;
      }
      uint64_t v10 = OUTLINED_FUNCTION_4_12(*a1, 8);
      uint64_t v11 = 8;
      goto LABEL_43;
    case 9:
      if (v5 != 9) {
        goto LABEL_45;
      }
      uint64_t v10 = OUTLINED_FUNCTION_4_12(*a1, 9);
      uint64_t v11 = 9;
      goto LABEL_43;
    case 10:
      if (v5 != 10) {
        goto LABEL_45;
      }
      uint64_t v10 = OUTLINED_FUNCTION_4_12(*a1, 10);
      uint64_t v11 = 10;
      goto LABEL_43;
    case 11:
      if (v5 != 11) {
        goto LABEL_45;
      }
      uint64_t v10 = OUTLINED_FUNCTION_4_12(*a1, 11);
      uint64_t v11 = 11;
      goto LABEL_43;
    case 12:
      if (v5 != 12) {
        goto LABEL_45;
      }
      uint64_t v10 = OUTLINED_FUNCTION_4_12(*a1, 12);
      uint64_t v11 = 12;
      goto LABEL_43;
    case 13:
      if (v5 != 13) {
        goto LABEL_45;
      }
      uint64_t v10 = OUTLINED_FUNCTION_4_12(*a1, 13);
      uint64_t v11 = 13;
      goto LABEL_43;
    case 14:
      if (v5 != 14) {
        goto LABEL_45;
      }
      uint64_t v10 = OUTLINED_FUNCTION_4_12(*a1, 14);
      uint64_t v11 = 14;
      goto LABEL_43;
    case 15:
      if (v5 != 15) {
        goto LABEL_45;
      }
      uint64_t v10 = OUTLINED_FUNCTION_4_12(*a1, 15);
      uint64_t v11 = 15;
      goto LABEL_43;
    case 16:
      if (v5 != 16) {
        goto LABEL_45;
      }
      uint64_t v10 = OUTLINED_FUNCTION_4_12(*a1, 16);
      uint64_t v11 = 16;
      goto LABEL_43;
    default:
      if ((unint64_t)(v5 - 1) < 0x10)
      {
LABEL_45:
        uint64_t v12 = *a2;
        uint64_t v13 = a2[1];
LABEL_46:
        sub_1B385D760(v12, v13);
        sub_1B385D760(v2, v3);
        goto LABEL_47;
      }
      if (v3)
      {
        if (v5)
        {
          uint64_t v7 = *a1;
          if (v2 == v4 && v3 == v5)
          {
            OUTLINED_FUNCTION_15_2(v7, v3);
            uint64_t v10 = v2;
            uint64_t v11 = v3;
LABEL_43:
            sub_1B3859F9C(v10, v11);
          }
          else
          {
            char v9 = sub_1B389C920();
            OUTLINED_FUNCTION_15_2(v4, v5);
            sub_1B3859F9C(v4, v5);
            if ((v9 & 1) == 0) {
              return 0;
            }
          }
          return 1;
        }
        uint64_t v12 = *a2;
        uint64_t v13 = 0;
        goto LABEL_46;
      }
      swift_bridgeObjectRetain();
      sub_1B385D760(v4, v5);
      sub_1B385D760(v2, 0);
      sub_1B3859F9C(v2, 0);
      sub_1B3859F9C(v4, v5);
      if (!v5) {
        return 1;
      }
LABEL_47:
      sub_1B3859F9C(v2, v3);
      sub_1B3859F9C(v4, v5);
      return 0;
  }
}

uint64_t sub_1B3854D9C()
{
  OUTLINED_FUNCTION_13();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_4();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_3();
  *uint64_t v8 = v7;
  *(void *)(v5 + 328) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_1B387580C, 0, 0);
  }
  else
  {
    OUTLINED_FUNCTION_16_0();
    char v9 = *(uint64_t (**)(uint64_t))(v7 + 8);
    return v9(v3);
  }
}

uint64_t sub_1B3854EB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t ConfigurationManager.configuration(for:forceFetch:)(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 336) = a2;
  *(void *)(v3 + 224) = a1;
  *(void *)(v3 + 232) = v2;
  return MEMORY[0x1F4188298](sub_1B3853EAC, 0, 0);
}

id FeedbackStoreConfig.getConfig(forStream:)@<X0>(unsigned __int8 *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *v2;
  if (*(void *)(v4 + 16) && (unint64_t v5 = sub_1B38554B4(*a1), (v6 & 1) != 0))
  {
    uint64_t v7 = (void *)(*(void *)(v4 + 56) + 48 * v5);
    uint64_t v8 = v7[1];
    uint64_t v9 = v7[2];
    uint64_t v10 = v7[3];
    uint64_t v11 = (void *)v7[4];
    uint64_t v12 = (void *)v7[5];
    *a2 = *v7;
    a2[1] = v8;
    a2[2] = v9;
    a2[3] = v10;
    a2[4] = v11;
    a2[5] = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v13 = v11;
    return v12;
  }
  else
  {
    sub_1B389C7B0();
    swift_bridgeObjectRelease();
    FeedbackStreamDescriptor.rawValue.getter();
    sub_1B389C3C0();
    swift_bridgeObjectRelease();
    sub_1B387FCF4();
    swift_allocError();
    *int v15 = 0xD000000000000013;
    v15[1] = 0x80000001B38A2D10;
    return (id)swift_willThrow();
  }
}

PegasusConfiguration::FeedbackStoreConfig __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> FeedbackStoreConfig.init(fileManager:streams:)(NSFileManager fileManager, Swift::OpaquePointer streams)
{
  uint64_t v5 = v3;
  uint64_t v8 = v2;
  uint64_t v50 = sub_1B389BD00();
  OUTLINED_FUNCTION_1();
  uint64_t v10 = v9;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_1_9();
  sub_1B3856680();
  uint64_t v12 = (void *)sub_1B389C230();
  uint64_t v49 = *((void *)streams._rawValue + 2);
  if (v49)
  {
    uint64_t v45 = v8;
    uint64_t v48 = (void (**)(uint64_t, uint64_t))(v10 + 8);
    sub_1B38565B4();
    swift_bridgeObjectRetain();
    uint64_t v13 = 0;
    uint64_t v46 = v4;
    rawValue = streams._rawValue;
    while (1)
    {
      uint64_t v57 = v13;
      uint64_t v14 = *((unsigned __int8 *)streams._rawValue + v13 + 32);
      if (*((unsigned char *)streams._rawValue + v13 + 32))
      {
        LOBYTE(v55) = *((unsigned char *)streams._rawValue + v13 + 32);
        unint64_t v55 = FeedbackStreamDescriptor.rawValue.getter();
        unint64_t v56 = v15;
        sub_1B38538CC();
        uint64_t v16 = fileManager.super.isa;
        uint64_t v17 = sub_1B389C6E0();
        swift_bridgeObjectRelease();
        uint64_t v18 = *(void *)(v17 + 16);
        if (!v18) {
          goto LABEL_24;
        }
        uint64_t v19 = v17 + 16 * v18;
        unint64_t v21 = *(void *)(v19 + 16);
        unint64_t v20 = *(void *)(v19 + 24);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        unint64_t v55 = v21;
        unint64_t v56 = v20;
        sub_1B389C3C0();
        unint64_t v22 = v56;
        unint64_t v53 = 0xD000000000000028;
        uint64_t v54 = v55;
        unint64_t v23 = 0x80000001B38A2CB0;
      }
      else
      {
        unint64_t v24 = fileManager.super.isa;
        unint64_t v23 = 0x80000001B38A2CE0;
        unint64_t v22 = 0xEB00000000736673;
        uint64_t v54 = 0x5F6E6F6973736573;
        unint64_t v53 = 0xD000000000000026;
      }
      LOBYTE(v55) = v14;
      NSFileManager.biomeStreamURL(for:)((unsigned __int8 *)&v55, v4);
      if (v5)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease_n();
        return (PegasusConfiguration::FeedbackStoreConfig)swift_bridgeObjectRelease();
      }
      unint64_t v51 = v22;
      unint64_t v52 = v23;
      uint64_t v25 = sub_1B389BCA0();
      uint64_t v27 = v26;
      (*v48)(v4, v50);
      uint64_t v28 = v14 ? 0x200000 : 0x20000;
      id v29 = sub_1B38565F4(v25, v27, v28, 3);
      LOBYTE(v55) = v14;
      FeedbackStreamDescriptor.rawValue.getter();
      uint64_t v30 = sub_1B389C280();
      swift_bridgeObjectRelease();
      isa = fileManager.super.isa;

      swift_isUniquelyReferenced_nonNull_native();
      unint64_t v55 = (unint64_t)v12;
      unint64_t v32 = sub_1B38554B4(v14);
      if (__OFADD__(v12[2], (v33 & 1) == 0)) {
        break;
      }
      unint64_t v34 = v32;
      char v35 = v33;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FAB48);
      if (sub_1B389C830())
      {
        unint64_t v36 = sub_1B38554B4(v14);
        if ((v35 & 1) != (v37 & 1)) {
          goto LABEL_26;
        }
        unint64_t v34 = v36;
      }
      uint64_t v12 = (void *)v55;
      if (v35)
      {
        uint64_t v38 = *(void *)(v55 + 56) + 48 * v34;
        uint64_t v39 = *(void **)(v38 + 32);

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        *(void *)uint64_t v38 = v54;
        *(void *)(v38 + 8) = v51;
        *(void *)(v38 + 16) = v53;
        *(void *)(v38 + 24) = v52;
        *(void *)(v38 + 32) = v29;
        *(void *)(v38 + 40) = v30;
      }
      else
      {
        *(void *)(v55 + 8 * (v34 >> 6) + 64) |= 1 << v34;
        *(unsigned char *)(v12[6] + v34) = v14;
        uint64_t v40 = (uint64_t *)(v12[7] + 48 * v34);
        *uint64_t v40 = v54;
        v40[1] = v51;
        v40[2] = v53;
        v40[3] = v52;
        v40[4] = (uint64_t)v29;
        v40[5] = v30;
        uint64_t v41 = v12[2];
        BOOL v42 = __OFADD__(v41, 1);
        uint64_t v43 = v41 + 1;
        if (v42) {
          goto LABEL_25;
        }
        v12[2] = v43;
      }
      uint64_t v13 = v57 + 1;
      swift_bridgeObjectRelease();
      uint64_t v5 = 0;
      fileManager.super.isa = isa;
      uint64_t v4 = v46;
      streams._rawValue = rawValue;
      if (v49 == v13)
      {
        swift_bridgeObjectRelease();
        uint64_t v8 = v45;
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    result.streamConfigs._rawValue = (void *)sub_1B389C9A0();
    __break(1u);
  }
  else
  {
LABEL_21:
    swift_bridgeObjectRelease();

    *uint64_t v8 = v12;
  }
  return result;
}

unint64_t sub_1B38554B4(uint64_t a1)
{
  unsigned __int8 v2 = a1;
  uint64_t v3 = sub_1B38554F8(*(void *)(v1 + 40), a1);

  return sub_1B38556D4(v2, v3);
}

uint64_t sub_1B38554F8(uint64_t a1, uint64_t a2)
{
  return sub_1B3855510(a1, a2, (void (*)(uint64_t))FeedbackStreamDescriptor.rawValue.getter);
}

uint64_t sub_1B3855510(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4 = sub_1B389CA10();
  a3(v4);
  sub_1B389C370();
  swift_bridgeObjectRelease();
  return sub_1B389CA40();
}

unint64_t FeedbackStreamDescriptor.rawValue.getter()
{
  unint64_t result = 0xD000000000000010;
  switch(*v0)
  {
    case 1:
    case 4:
    case 0x10:
      return result;
    case 2:
      unint64_t result = 0xD000000000000013;
      break;
    case 3:
    case 6:
    case 0xB:
      unint64_t result = 0x6C7070612E6D6F63;
      break;
    case 5:
      unint64_t result = 0xD000000000000012;
      break;
    case 7:
      unint64_t result = 0xD000000000000011;
      break;
    case 8:
      unint64_t result = 0xD000000000000015;
      break;
    case 9:
      unint64_t result = 0xD000000000000019;
      break;
    case 0xA:
      unint64_t result = 0xD000000000000019;
      break;
    case 0xC:
      unint64_t result = 0xD000000000000018;
      break;
    case 0xD:
      unint64_t result = 0xD000000000000014;
      break;
    case 0xE:
      unint64_t result = 0xD000000000000012;
      break;
    case 0xF:
      unint64_t result = 0xD000000000000015;
      break;
    default:
      unint64_t result = 0x6E6F6973736573;
      break;
  }
  return result;
}

unint64_t sub_1B38556D4(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0x80000001B38A17F0;
      unint64_t v8 = 0xD000000000000010;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          break;
        case 2:
          unint64_t v8 = 0xD000000000000013;
          uint64_t v9 = "com.apple.safari";
          goto LABEL_21;
        case 3:
          unint64_t v8 = 0x6C7070612E6D6F63;
          uint64_t v10 = 0x697269732E65;
          goto LABEL_15;
        case 4:
          uint64_t v9 = "ght";
          goto LABEL_21;
        case 5:
          unint64_t v8 = 0xD000000000000012;
          uint64_t v9 = "com.apple.lookup";
          goto LABEL_21;
        case 6:
          unint64_t v8 = 0x6C7070612E6D6F63;
          uint64_t v10 = 0x7377656E2E65;
          goto LABEL_15;
        case 7:
          unint64_t v8 = 0xD000000000000011;
          uint64_t v9 = "es";
          goto LABEL_21;
        case 8:
          unint64_t v8 = 0xD000000000000015;
          uint64_t v9 = "com.apple.parsecd";
          goto LABEL_21;
        case 9:
          unint64_t v8 = 0xD000000000000019;
          uint64_t v9 = "com.apple.parsec_tool";
          goto LABEL_21;
        case 0xA:
          unint64_t v8 = 0xD000000000000019;
          uint64_t v9 = "com.apple.coresuggestions";
          goto LABEL_21;
        case 0xB:
          unint64_t v8 = 0x6C7070612E6D6F63;
          uint64_t v10 = 0x6C69616D2E65;
LABEL_15:
          unint64_t v7 = v10 & 0xFFFFFFFFFFFFLL | 0xEE00000000000000;
          break;
        case 0xC:
          unint64_t v8 = 0xD000000000000018;
          uint64_t v9 = "utilities";
          goto LABEL_21;
        case 0xD:
          unint64_t v8 = 0xD000000000000014;
          uint64_t v9 = "com.apple.mediaanalysisd";
          goto LABEL_21;
        case 0xE:
          unint64_t v8 = 0xD000000000000012;
          uint64_t v9 = "com.apple.duetexpert";
          goto LABEL_21;
        case 0xF:
          unint64_t v8 = 0xD000000000000015;
          uint64_t v9 = "com.apple.trystero";
          goto LABEL_21;
        case 0x10:
          uint64_t v9 = "com.apple.photopicker";
LABEL_21:
          unint64_t v7 = (unint64_t)v9 | 0x8000000000000000;
          break;
        default:
          unint64_t v7 = 0xE700000000000000;
          unint64_t v8 = 0x6E6F6973736573;
          break;
      }
      unint64_t v11 = 0x80000001B38A17F0;
      unint64_t v12 = 0xD000000000000010;
      switch(v6)
      {
        case 1:
          break;
        case 2:
          unint64_t v12 = 0xD000000000000013;
          uint64_t v13 = "com.apple.safari";
          goto LABEL_40;
        case 3:
          unint64_t v12 = 0x6C7070612E6D6F63;
          uint64_t v14 = 0x697269732E65;
          goto LABEL_34;
        case 4:
          uint64_t v13 = "ght";
          goto LABEL_40;
        case 5:
          unint64_t v12 = 0xD000000000000012;
          uint64_t v13 = "com.apple.lookup";
          goto LABEL_40;
        case 6:
          unint64_t v12 = 0x6C7070612E6D6F63;
          uint64_t v14 = 0x7377656E2E65;
          goto LABEL_34;
        case 7:
          unint64_t v12 = 0xD000000000000011;
          uint64_t v13 = "es";
          goto LABEL_40;
        case 8:
          unint64_t v12 = 0xD000000000000015;
          uint64_t v13 = "com.apple.parsecd";
          goto LABEL_40;
        case 9:
          unint64_t v12 = 0xD000000000000019;
          uint64_t v13 = "com.apple.parsec_tool";
          goto LABEL_40;
        case 10:
          unint64_t v12 = 0xD000000000000019;
          uint64_t v13 = "com.apple.coresuggestions";
          goto LABEL_40;
        case 11:
          unint64_t v12 = 0x6C7070612E6D6F63;
          uint64_t v14 = 0x6C69616D2E65;
LABEL_34:
          unint64_t v11 = v14 & 0xFFFFFFFFFFFFLL | 0xEE00000000000000;
          break;
        case 12:
          unint64_t v12 = 0xD000000000000018;
          uint64_t v13 = "utilities";
          goto LABEL_40;
        case 13:
          unint64_t v12 = 0xD000000000000014;
          uint64_t v13 = "com.apple.mediaanalysisd";
          goto LABEL_40;
        case 14:
          unint64_t v12 = 0xD000000000000012;
          uint64_t v13 = "com.apple.duetexpert";
          goto LABEL_40;
        case 15:
          unint64_t v12 = 0xD000000000000015;
          uint64_t v13 = "com.apple.trystero";
          goto LABEL_40;
        case 16:
          uint64_t v13 = "com.apple.photopicker";
LABEL_40:
          unint64_t v11 = (unint64_t)v13 | 0x8000000000000000;
          break;
        default:
          unint64_t v11 = 0xE700000000000000;
          unint64_t v12 = 0x6E6F6973736573;
          break;
      }
      if (v8 == v12 && v7 == v11) {
        break;
      }
      char v16 = sub_1B389C920();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v16 & 1) == 0)
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

uint64_t NSFileManager.biomeStreamURL(for:)@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1B389BC30();
  OUTLINED_FUNCTION_1();
  uint64_t v49 = v5;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_29();
  uint64_t v48 = v8 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
  MEMORY[0x1F4188790](v9 - 8);
  OUTLINED_FUNCTION_29();
  unint64_t v12 = (void (*)(uint64_t))(v11 - v10);
  uint64_t v13 = sub_1B389BD00();
  OUTLINED_FUNCTION_1();
  uint64_t v15 = v14;
  uint64_t v17 = MEMORY[0x1F4188790](v16);
  uint64_t v19 = (char *)v40 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17);
  unint64_t v21 = (char *)v40 - v20;
  int v22 = *a1;
  sub_1B38561AC();
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13) == 1)
  {
    sub_1B3859C40((uint64_t)v12, (uint64_t *)&unk_1EB7FBF88);
    sub_1B387FCF4();
    uint64_t v23 = swift_allocError();
    *unint64_t v24 = 0;
    v24[1] = 0;
    uint64_t v50 = v23;
    return swift_willThrow();
  }
  else
  {
    int v46 = v22;
    uint64_t v47 = a2;
    uint64_t v43 = *(void (**)(char *, void (*)(uint64_t), uint64_t))(v15 + 32);
    uint64_t v44 = v15 + 32;
    v43(v21, v12, v13);
    if (qword_1EB7FAAD0 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_1B389C1B0();
    __swift_project_value_buffer(v26, (uint64_t)qword_1EB7FC128);
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v19, v21, v13);
    uint64_t v27 = sub_1B389C190();
    os_log_type_t v28 = sub_1B389C590();
    BOOL v29 = os_log_type_enabled(v27, v28);
    uint64_t v45 = v15;
    if (v29)
    {
      uint64_t v30 = swift_slowAlloc();
      uint64_t v42 = v4;
      uint64_t v31 = v30;
      uint64_t v41 = swift_slowAlloc();
      v51[0] = v41;
      *(_DWORD *)uint64_t v31 = 136315138;
      unint64_t v12 = (void (*)(uint64_t))(v31 + 12);
      v40[1] = v31 + 4;
      sub_1B38566CC();
      uint64_t v32 = sub_1B389C8F0();
      v51[3] = sub_1B3855F24(v32, v33, v51);
      sub_1B389C6C0();
      swift_bridgeObjectRelease();
      uint64_t v34 = OUTLINED_FUNCTION_3_6();
      ((void (*)(uint64_t))(v31 + 12))(v34);
      _os_log_impl(&dword_1B3850000, v27, v28, "Container URL: %s", (uint8_t *)v31, 0xCu);
      uint64_t v35 = v41;
      swift_arrayDestroy();
      MEMORY[0x1B3EBAF20](v35, -1, -1);
      uint64_t v36 = v31;
      uint64_t v4 = v42;
      MEMORY[0x1B3EBAF20](v36, -1, -1);
    }
    else
    {
      uint64_t v37 = OUTLINED_FUNCTION_3_6();
      v12(v37);
    }

    if (v46)
    {
      v51[0] = 0x6B63616264656566;
      v51[1] = 0xE800000000000000;
      uint64_t v39 = v48;
      uint64_t v38 = v49;
      (*(void (**)(uint64_t, void, uint64_t))(v49 + 104))(v48, *MEMORY[0x1E4F276A8], v4);
      sub_1B38538CC();
      sub_1B389BCF0();
      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v39, v4);
      return ((uint64_t (*)(char *, uint64_t))v12)(v21, v13);
    }
    else
    {
      return ((uint64_t (*)(uint64_t, char *, uint64_t))v43)(v47, v21, v13);
    }
  }
}

uint64_t sub_1B3855F24(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1B3856054(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1B3855FF8((uint64_t)v12, *a3);
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
      sub_1B3855FF8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_1B3855FF8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1B3856054(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_1B388D084((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_1B389C6D0();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_1B388D15C(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_1B389C7E0();
    if (!v8)
    {
      uint64_t result = sub_1B389C850();
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

void sub_1B38561AC()
{
  OUTLINED_FUNCTION_48();
  uint64_t v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
  uint64_t v5 = OUTLINED_FUNCTION_24(v4);
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_70();
  uint64_t v6 = sub_1B389BD00();
  OUTLINED_FUNCTION_1();
  uint64_t v8 = v7;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_19();
  MEMORY[0x1F4188790](v10);
  unint64_t v12 = (char *)v28 - v11;
  sub_1B3858A8C(v0);
  OUTLINED_FUNCTION_55((uint64_t)v0, 0);
  OUTLINED_FUNCTION_23((uint64_t)v0, 1, v6);
  if (v13)
  {
    sub_1B386D330((uint64_t)v0, (uint64_t *)&unk_1EB7FBF88);
    if (qword_1EB7FAAD0 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_1B389C1B0();
    uint64_t v15 = OUTLINED_FUNCTION_40(v14, (uint64_t)qword_1EB7FC128);
    os_log_type_t v16 = sub_1B389C5B0();
    if (OUTLINED_FUNCTION_43(v16))
    {
      uint64_t v17 = (uint8_t *)OUTLINED_FUNCTION_12();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_1B3850000, v15, OS_LOG_TYPE_DEFAULT, "Failed to get container URL for pegasus configuration", v17, 2u);
      OUTLINED_FUNCTION_5();
    }

    uint64_t v18 = 1;
  }
  else
  {
    uint64_t v19 = *(void (**)(char *, void *, uint64_t))(v8 + 32);
    v19(v12, v0, v6);
    if (qword_1EB7FAAD0 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_1B389C1B0();
    __swift_project_value_buffer(v20, (uint64_t)qword_1EB7FC128);
    OUTLINED_FUNCTION_66();
    OUTLINED_FUNCTION_90();
    v21();
    int v22 = sub_1B389C190();
    os_log_type_t v23 = sub_1B389C590();
    if (os_log_type_enabled(v22, v23))
    {
      unint64_t v24 = (uint8_t *)OUTLINED_FUNCTION_59();
      uint64_t v30 = swift_slowAlloc();
      uint64_t v33 = v30;
      uint64_t v31 = v19;
      *(_DWORD *)unint64_t v24 = 136315138;
      v28[1] = v24 + 4;
      BOOL v29 = v24;
      sub_1B385DE2C((unint64_t *)&qword_1EB7FAB10, MEMORY[0x1E4F276F0]);
      uint64_t v25 = sub_1B389C8F0();
      uint64_t v32 = sub_1B3855F24(v25, v26, &v33);
      uint64_t v19 = v31;
      sub_1B389C6C0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_37();
      v27();
      _os_log_impl(&dword_1B3850000, v22, v23, "PegasusConfiguration container URL: %s", v29, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v1, v6);
    }

    v19((char *)v3, v12, v6);
    uint64_t v18 = 0;
  }
  OUTLINED_FUNCTION_55(v3, v18);
  OUTLINED_FUNCTION_45();
}

uint64_t OUTLINED_FUNCTION_59()
{
  return swift_slowAlloc();
}

unint64_t sub_1B38565B4()
{
  unint64_t result = qword_1EB7FAB38;
  if (!qword_1EB7FAB38)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB7FAB38);
  }
  return result;
}

id sub_1B38565F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v7 = (void *)sub_1B389C280();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v6, sel_initWithStoreBasePath_segmentSize_protectionClass_, v7, a3, a4);

  return v8;
}

unint64_t sub_1B3856680()
{
  unint64_t result = qword_1EB7FAB28;
  if (!qword_1EB7FAB28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB7FAB28);
  }
  return result;
}

unint64_t sub_1B38566CC()
{
  unint64_t result = qword_1EB7FAB10;
  if (!qword_1EB7FAB10)
  {
    sub_1B389BD00();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB7FAB10);
  }
  return result;
}

uint64_t sub_1B3856724()
{
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_14();
  int v1 = *(unsigned __int8 *)(v0 + 123);
  if (v1 == 1)
  {
    *(unsigned char *)(*(void *)(v0 + 216) + qword_1EB7FA728) = 1;
    LOBYTE(v1) = *(unsigned char *)(v0 + 123);
  }
  uint64_t v2 = *(void **)(v0 + 96);
  *(unsigned char *)(*(void *)(v0 + 216) + qword_1EB7FA730) = v1;
  swift_unknownObjectRetain();
  OUTLINED_FUNCTION_66();
  uint64_t v3 = (void *)sub_1B389C280();
  objc_msgSend(v2, sel_findConfigForUserAgent_, v3);
  swift_unknownObjectRelease_n();

  sub_1B3856894();
  swift_release();
  sub_1B3856B4C();
  OUTLINED_FUNCTION_32();
  return v6(v4, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  *(void *)(v0 + 16) = 0;
  return swift_bridgeObjectRelease();
}

void sub_1B3856894()
{
  if ((*(unsigned char *)(v0 + 81) & 1) == 0)
  {
    uint64_t v1 = v0;
    if (*(void *)(v0 + qword_1EB7FC098))
    {
      swift_retain();
      sub_1B38836CC();
      swift_release();
    }
    uint64_t v2 = MEMORY[0x1E4FBB1A0];
    if ((*(unsigned char *)(v0 + qword_1EB7FA728) & 1) == 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA910);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1B389D510;
      if (qword_1E9CCE9B0 != -1) {
        swift_once();
      }
      uint64_t v4 = *(void *)algn_1E9CCF618;
      *(void *)(inited + 32) = qword_1E9CCF610;
      *(void *)(inited + 40) = v4;
      uint64_t v5 = *(void *)(v1 + qword_1EB7FC0A8);
      id v6 = objc_allocWithZone(NSNumber);
      swift_bridgeObjectRetain();
      *(void *)(inited + 48) = objc_msgSend(v6, sel_initWithUnsignedInteger_, v5);
      if (qword_1E9CCEB08 != -1) {
        swift_once();
      }
      uint64_t v7 = *(void *)algn_1E9CCF628;
      *(void *)(inited + 56) = qword_1E9CCF620;
      *(void *)(inited + 64) = v7;
      uint64_t v8 = qword_1B389FF90[*(char *)(v1 + qword_1EB7FA730)];
      id v9 = objc_allocWithZone(NSNumber);
      swift_bridgeObjectRetain();
      *(void *)(inited + 72) = objc_msgSend(v9, sel_initWithUnsignedInteger_, v8);
      sub_1B3884F04();
      uint64_t v10 = sub_1B389C230();
      sub_1B3883090(v10);
      uint64_t v12 = v11;
      swift_bridgeObjectRelease();
      sub_1B388B170(v12);
      swift_bridgeObjectRelease();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA930);
    uint64_t v13 = OUTLINED_FUNCTION_0_9();
    *(_OWORD *)(v13 + 16) = xmmword_1B389D500;
    uint64_t v14 = sub_1B389C300();
    uint64_t v16 = v15;
    *(void *)(v13 + 56) = v2;
    *(void *)(v13 + 64) = sub_1B38579B4();
    *(void *)(v13 + 32) = v14;
    *(void *)(v13 + 40) = v16;
    sub_1B3856C5C("outcome=%{signpost.description:attribute,public}s", 49, 2, v13);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_73();
    uint64_t v18 = *(os_unfair_lock_s **)(*(void *)(v1 + *(void *)(v17 + 152)) + 16);
    swift_retain();
    os_unfair_lock_lock(v18);
    if ((*(unsigned char *)(v1 + 81) & 1) == 0) {
      sub_1B3856C60();
    }
    os_unfair_lock_unlock(v18);
    swift_release();
  }
}

void sub_1B3856B4C()
{
  OUTLINED_FUNCTION_1_7();
  uint64_t v1 = OUTLINED_FUNCTION_2_4();
  sub_1B3856B98(v1);

  os_unfair_lock_unlock(v0);
}

uint64_t sub_1B3856B98(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 8);
  BOOL v2 = __OFSUB__(v1, 1);
  uint64_t v3 = v1 - 1;
  if (v2) {
    __break(1u);
  }
  else {
    *(void *)(result + 8) = v3;
  }
  return result;
}

uint64_t sub_1B3856BB0(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  OUTLINED_FUNCTION_4_5();
  uint64_t v10 = *(os_unfair_lock_s **)(*(void *)(v4 + *(void *)(v9 + 152)) + 16);
  swift_retain();
  os_unfair_lock_lock(v10);
  *(void *)(v4 + 24) = a1;
  *(void *)(v4 + 32) = a2;
  *(unsigned char *)(v4 + 40) = a3;
  *(unsigned char *)(v4 + 41) = 0;
  *(void *)(v4 + 56) = a4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v10);

  return swift_release();
}

uint64_t sub_1B3856C60()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FA850);
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_7_5();
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_0_11();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B3857310(v0);
  uint64_t v6 = v0 + *(void *)(*(void *)v0 + 136);
  if ((v3 & 1) == 0 && v1)
  {
    OUTLINED_FUNCTION_2_9();
    sub_1B38570D0(v6, v4);
    uint64_t v7 = sub_1B389C110();
    uint64_t result = __swift_getEnumTagSinglePayload(v4, 1, v7);
    if (result != 1)
    {
      uint64_t v9 = *(void (**)(void))(v0 + 88);
      swift_bridgeObjectRetain();
      sub_1B389C5E0();
      uint64_t v10 = OUTLINED_FUNCTION_11_2();
      OUTLINED_FUNCTION_1_15((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17, v26, v27);
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_17();
      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v4, v7);
      goto LABEL_7;
    }
LABEL_17:
    __break(1u);
    return result;
  }
  OUTLINED_FUNCTION_2_9();
  sub_1B38570D0(v6, v5);
  uint64_t v2 = sub_1B389C110();
  uint64_t result = __swift_getEnumTagSinglePayload(v5, 1, v2);
  if (result == 1)
  {
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v9 = *(void (**)(void))(v0 + 88);
  sub_1B389C5E0();
  OUTLINED_FUNCTION_11_2();
  sub_1B389C0D0();
  OUTLINED_FUNCTION_17();
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v5, v2);
LABEL_7:
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v21 = Strong;
    swift_retain();
    sub_1B389C300();
    OUTLINED_FUNCTION_10_2();
    OUTLINED_FUNCTION_16_1(v22, v23, v24, v25, (uint64_t)&off_1F0C11C18);
    os_unfair_lock_unlock(v3);
    swift_bridgeObjectRelease();
    if (MEMORY[0x1B3EBAFF0](v21 + 16))
    {
      uint64_t v2 = *(void *)(v21 + 24);
      swift_getObjectType();
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_12_1();
      v9();
      swift_release_n();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_release();
    }
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    OUTLINED_FUNCTION_5_5();
    *(void *)(v0 + 64) = MEMORY[0x1E4FBC860];
    *(void *)(v0 + 72) = 0;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    *(unsigned char *)(v0 + 81) = v2;
    return swift_weakAssign();
  }
  else
  {
    if (sub_1B388B2E8())
    {
      sub_1B389C5C0();
      sub_1B389C0B0();
    }
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t OUTLINED_FUNCTION_7()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_24(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_7_1(uint64_t a1)
{
  return sub_1B3898CD0(a1, 68, 2, v1);
}

uint64_t OUTLINED_FUNCTION_7_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7_7()
{
  return v0;
}

void OUTLINED_FUNCTION_7_8()
{
  sub_1B388E2E8();
}

uint64_t sub_1B38570D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FA850);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B3857138(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  swift_beginAccess();
  uint64_t v10 = sub_1B3857C9C(a2, a3);
  swift_endAccess();
  uint64_t result = swift_release();
  if (!v10)
  {
    if (MEMORY[0x1B3EBAFF0](a1 + 16))
    {
      uint64_t v12 = *(void *)(a1 + 24);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 40))(a4, a5, ObjectType, v12);
      swift_unknownObjectRelease();
    }
    uint64_t v14 = swift_getObjectType();
    uint64_t v15 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a5 + 32))(v14, a5);
    sub_1B389C5B0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA930);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_1B389D510;
    uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 24))(v14, a5);
    uint64_t v19 = v18;
    uint64_t v20 = MEMORY[0x1E4FBB1A0];
    *(void *)(v16 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v21 = sub_1B38579B4();
    *(void *)(v16 + 64) = v21;
    *(void *)(v16 + 32) = v17;
    *(void *)(v16 + 40) = v19;
    (*(void (**)(uint64_t, uint64_t))(a5 + 40))(v14, a5);
    uint64_t v22 = sub_1B389C7D0();
    *(void *)(v16 + 96) = v20;
    *(void *)(v16 + 104) = v21;
    *(void *)(v16 + 72) = v22;
    *(void *)(v16 + 80) = v23;
    sub_1B389C0B0();

    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1B3857310(uint64_t a1)
{
  if (sub_1B3857504(a1))
  {
    sub_1B389C5A0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA930);
    uint64_t v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_1B389D510;
    if (qword_1EB7FA370 != -1) {
      swift_once();
    }
    uint64_t v2 = qword_1EB7FC068;
    uint64_t v3 = unk_1EB7FC070;
    uint64_t v4 = MEMORY[0x1E4FBB1A0];
    *(void *)(v1 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v5 = sub_1B38579B4();
    *(void *)(v1 + 64) = v5;
    *(void *)(v1 + 32) = v2;
    *(void *)(v1 + 40) = v3;
    sub_1B3881E1C();
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_1B389C220();
    *(void *)(v1 + 96) = v4;
    *(void *)(v1 + 104) = v5;
    *(void *)(v1 + 72) = v6;
    *(void *)(v1 + 80) = v7;
    sub_1B389C0B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1B386EFA8();
    uint64_t v8 = (void *)sub_1B389C280();
    swift_bridgeObjectRelease();
    id v9 = (id)sub_1B389C200();
    AnalyticsSendEvent();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1B3857504(uint64_t a1)
{
  uint64_t v2 = dynamic_cast_existential_1_unconditional((uint64_t)&type metadata for ResourceAccessActivity);
  if (!a1) {
    return 0;
  }
  uint64_t v4 = v2;
  uint64_t v5 = v3;
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 16);
  swift_bridgeObjectRetain();
  uint64_t v7 = v6(v4, v5);
  uint64_t v9 = v8;
  uint64_t v10 = sub_1B389C6B0();
  swift_isUniquelyReferenced_nonNull_native();
  sub_1B38737F4(v10, v7, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  uint64_t v13 = v12;
  sub_1B388B3D0();
  uint64_t v14 = sub_1B389C540();
  swift_isUniquelyReferenced_nonNull_native();
  sub_1B38737F4(v14, v11, v13);
  uint64_t v15 = a1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t dynamic_cast_existential_1_unconditional(uint64_t a1)
{
  uint64_t result = swift_conformsToProtocol2();
  if (result) {
    return a1;
  }
  __break(1u);
  return result;
}

uint64_t sub_1B38576B0()
{
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_89();
  swift_allocObject();
  swift_retain();
  uint64_t v1 = swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_50(v1, v2, v3);
  OUTLINED_FUNCTION_34(v4, v5, v6, v7, v8, v9, v10, v11, v12);
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v0 + 224) = v13;
  *uint64_t v13 = v0;
  v13[1] = sub_1B385A16C;
  return sub_1B385DD90();
}

uint64_t OUTLINED_FUNCTION_89()
{
  return type metadata accessor for ResourceAccessSpan();
}

void OUTLINED_FUNCTION_50(uint64_t a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_1B3857830(v3, 1, (uint64_t *)va, 0, 1);
}

void OUTLINED_FUNCTION_35()
{
  *(void *)(v0 + 208) = *(void *)(*(void *)(v0 + 144) + 200);
  sub_1B3857A48();
}

__n128 OUTLINED_FUNCTION_34(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __n128 a9)
{
  v10[13].n128_u64[1] = a1;
  v10[1].n128_u64[0] = v15;
  v10[1].n128_u64[1] = v14;
  v10[2].n128_u64[0] = v9;
  v10[2].n128_u8[8] = v13;
  __n128 result = a9;
  v10[3] = a9;
  v10[4].n128_u64[0] = v12;
  v10[4].n128_u64[1] = v11;
  return result;
}

void sub_1B3857830(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, char a5)
{
  uint64_t v8 = *a3;
  uint64_t v9 = a3[1];
  uint64_t v10 = a3[2];
  *(unsigned char *)(v5 + qword_1EB7FA730) = 0;
  *(void *)(v5 + qword_1EB7FC098) = 0;
  uint64_t v11 = v5 + qword_1EB7FC0A0;
  *(void *)uint64_t v11 = 0;
  *(unsigned char *)(v11 + 8) = 1;
  *(unsigned char *)(v5 + qword_1EB7FA728) = 0;
  unint64_t v12 = (void *)(v5 + qword_1EB7FC0A8);
  *unint64_t v12 = v8;
  v12[1] = v9;
  v12[2] = v10;
  *(void *)uint64_t v11 = a4;
  *(unsigned char *)(v11 + 8) = a5 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA930);
  if (a5)
  {
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1B389D500;
    *(void *)(inited + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(inited + 64) = sub_1B38579B4();
    *(void *)(inited + 32) = v9;
    *(void *)(inited + 40) = v10;
  }
  else
  {
    uint64_t v14 = swift_initStackObject();
    *(_OWORD *)(v14 + 16) = xmmword_1B389D510;
    *(void *)(v14 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v15 = sub_1B38579B4();
    *(void *)(v14 + 32) = v9;
    *(void *)(v14 + 40) = v10;
    uint64_t v16 = MEMORY[0x1E4FBC598];
    *(void *)(v14 + 96) = MEMORY[0x1E4FBC538];
    *(void *)(v14 + 104) = v16;
    *(void *)(v14 + 64) = v15;
    *(void *)(v14 + 72) = a4;
  }
  swift_bridgeObjectRetain();
  sub_1B3857F04();
}

unint64_t sub_1B38579B4()
{
  unint64_t result = qword_1EB7FA870;
  if (!qword_1EB7FA870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB7FA870);
  }
  return result;
}

uint64_t type metadata accessor for ResourceAccessSpan()
{
  uint64_t result = qword_1EB7FA738;
  if (!qword_1EB7FA738) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1B3857A48()
{
  OUTLINED_FUNCTION_1_7();
  uint64_t v1 = OUTLINED_FUNCTION_2_4();
  sub_1B3857A94(v1);

  os_unfair_lock_unlock(v0);
}

uint64_t sub_1B3857A94(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 8);
  BOOL v2 = __OFADD__(v1, 1);
  uint64_t v3 = v1 + 1;
  if (v2) {
    __break(1u);
  }
  else {
    *(void *)(result + 8) = v3;
  }
  return result;
}

uint64_t sub_1B3857AAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_isUniquelyReferenced_nonNull_native();
  OUTLINED_FUNCTION_10_0();
  sub_1B3857B2C(a1, a2, a3);
  *uint64_t v3 = v8;

  return swift_bridgeObjectRelease();
}

uint64_t sub_1B3857B2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_1B3857DA8(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA8D8);
  if ((sub_1B389C830() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_1B3857DA8(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_11:
    uint64_t result = sub_1B389C9A0();
    __break(1u);
    return result;
  }
  unint64_t v11 = v13;
LABEL_5:
  unint64_t v15 = *v4;
  if (v12)
  {
    uint64_t v16 = v15[7];
    uint64_t result = swift_release();
    *(void *)(v16 + 8 * v11) = a1;
  }
  else
  {
    sub_1B3857C54(v11, a2, a3, a1, v15);
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_1B3857C54(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
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

uint64_t sub_1B3857C9C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1B3857DA8(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA8D8);
  sub_1B389C830();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(*(void *)(v10 + 56) + 8 * v6);
  type metadata accessor for ActivityMonitor.WeakReference();
  sub_1B389C840();
  *uint64_t v3 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

unint64_t sub_1B3857DA8(uint64_t a1, uint64_t a2)
{
  sub_1B389CA10();
  sub_1B389C370();
  uint64_t v4 = sub_1B389CA40();

  return sub_1B3857E20(a1, a2, v4);
}

unint64_t sub_1B3857E20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1B389C920() & 1) == 0)
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
      while (!v14 && (sub_1B389C920() & 1) == 0);
    }
  }
  return v6;
}

void sub_1B3857F04()
{
  OUTLINED_FUNCTION_48();
  unint64_t v1 = v0;
  uint64_t v61 = v2;
  uint64_t v62 = v3;
  int v59 = v4;
  uint64_t v60 = v5;
  int v66 = v6;
  v65 = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FA850);
  uint64_t v9 = OUTLINED_FUNCTION_24(v8);
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_25();
  uint64_t v63 = v10;
  OUTLINED_FUNCTION_51();
  MEMORY[0x1F4188790](v11);
  unint64_t v13 = (char *)&v57 - v12;
  uint64_t v64 = sub_1B389BE20();
  OUTLINED_FUNCTION_1();
  uint64_t v15 = v14;
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_29();
  uint64_t v19 = v18 - v17;
  swift_weakInit();
  *(void *)(v0 + 24) = 0;
  *(void *)(v0 + 32) = 0;
  *(_WORD *)(v0 + 40) = 256;
  *(void *)(v0 + 48) = 0;
  *(void *)(v0 + 56) = 0;
  *(void *)(v0 + 64) = MEMORY[0x1E4FBC860];
  *(void *)(v0 + 72) = 0;
  *(unsigned char *)(v0 + 81) = 0;
  unint64_t v69 = 0xD000000000000010;
  unint64_t v70 = 0x80000001B38A1DF0;
  uint64_t v67 = 45;
  unint64_t v68 = 0xE100000000000000;
  sub_1B3859FE4(0, (unint64_t *)&qword_1EB7FA8B0);
  uint64_t v71 = 95;
  unint64_t v72 = 0xE100000000000000;
  unint64_t v56 = sub_1B38538CC();
  sub_1B389C6F0();
  if (qword_1EB7FA370 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  *(void *)(v0 + 88) = sub_1B389C650();
  OUTLINED_FUNCTION_73();
  uint64_t v21 = v0 + *(void *)(v20 + 136);
  uint64_t v22 = sub_1B389C110();
  __swift_storeEnumTagSinglePayload(v21, 1, 1, v22);
  OUTLINED_FUNCTION_73();
  uint64_t v24 = *(void *)(v23 + 152);
  type metadata accessor for Locker();
  uint64_t v25 = OUTLINED_FUNCTION_74();
  uint64_t v26 = (_DWORD *)swift_slowAlloc();
  *(void *)(v25 + 16) = v26;
  *uint64_t v26 = 0;
  *(void *)(v1 + v24) = v25;
  sub_1B389BE10();
  OUTLINED_FUNCTION_73();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v15 + 32))(v1 + *(void *)(v27 + 144), v19, v64);
  os_log_type_t v28 = v65;
  swift_weakAssign();
  char v29 = v66;
  *(unsigned char *)(v1 + 80) = v66;
  id v30 = *(id *)(v1 + 88);
  OUTLINED_FUNCTION_83();
  swift_retain();
  sub_1B389C0E0();
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v22);
  OUTLINED_FUNCTION_73();
  uint64_t v32 = v1 + *(void *)(v31 + 136);
  swift_beginAccess();
  uint64_t v64 = v32;
  sub_1B385A020((uint64_t)v13, v32);
  swift_endAccess();
  unint64_t v69 = v1;
  swift_retain();
  uint64_t v33 = sub_1B389C300();
  uint64_t v35 = v34;
  uint64_t v36 = *(os_unfair_lock_s **)(v28[4] + 16);
  os_unfair_lock_lock(v36);
  uint64_t v37 = v28 + 2;
  if (MEMORY[0x1B3EBAFF0](v28 + 2))
  {
    uint64_t v58 = v22;
    uint64_t v38 = v28[3];
    swift_beginAccess();
    uint64_t v39 = v28;
    uint64_t v40 = v28[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_1B387119C(v33, v35, v40);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    if (v41)
    {
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(unint64_t, _UNKNOWN **, uint64_t, uint64_t))(v38 + 32))(v1, &off_1F0C11C18, ObjectType, v38);
    }
    swift_unknownObjectRelease();
    os_log_type_t v28 = v39;
    char v29 = v66;
    uint64_t v22 = v58;
  }
  type metadata accessor for ActivityMonitor.WeakReference();
  uint64_t v43 = swift_allocObject();
  *(void *)(v43 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v43 + 24) = &off_1F0C11C18;
  swift_unknownObjectWeakAssign();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1B3857AAC(v43, v33, v35);
  swift_endAccess();
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v36);
  swift_bridgeObjectRelease();
  if (MEMORY[0x1B3EBAFF0](v37))
  {
    uint64_t v44 = v28[3];
    uint64_t v45 = swift_getObjectType();
    (*(void (**)(unint64_t, _UNKNOWN **, uint64_t, uint64_t))(v44 + 8))(v1, &off_1F0C11C18, v45, v44);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
  }
  uint64_t v46 = v63;
  sub_1B385A0AC(v64, v63, (uint64_t *)&unk_1EB7FA850);
  uint64_t v47 = OUTLINED_FUNCTION_87();
  OUTLINED_FUNCTION_23(v47, v48, v22);
  if (v49)
  {
    __break(1u);
  }
  else
  {
    id v50 = *(id *)(v1 + 88);
    uint64_t v51 = sub_1B389C5F0();
    unint64_t v52 = sub_1B38584F8(v29);
    LOBYTE(v56) = v59;
    sub_1B38587B8(v51, (uint64_t)v50, (uint64_t)v52, v53, v54, v46, v60, v61, v56, v62);

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_46();
    v55();
    sub_1B3852A68();
    swift_release();
    OUTLINED_FUNCTION_45();
  }
}

const char *sub_1B38584F8(char a1)
{
  uint64_t result = "unknown";
  switch(a1)
  {
    case 1:
      uint64_t result = "configuration";
      break;
    case 2:
      uint64_t result = "parsecdSearch";
      break;
    case 3:
      uint64_t result = "parsecdZeroKeyWord";
      break;
    case 4:
      uint64_t result = "parsecdLookup";
      break;
    case 5:
      uint64_t result = "parsecdFlight";
      break;
    case 6:
      uint64_t result = "parsecdMoreResults";
      break;
    case 7:
      uint64_t result = "parsecdCard";
      break;
    case 8:
      uint64_t result = "parsecdWarm";
      break;
    case 9:
      uint64_t result = "bagResourceDownload";
      break;
    case 10:
      uint64_t result = "pegasusKitVisualSearch";
      break;
    case 11:
      uint64_t result = "pegasusKitSiriPersonalization";
      break;
    case 12:
      uint64_t result = "pegasusKitHashtagImages";
      break;
    case 13:
      uint64_t result = "pegasusKitAssistant";
      break;
    case 14:
      uint64_t result = "pegasusKitBagFetchXPC";
      break;
    case 15:
      uint64_t result = "pegasusKitContextFetchXPC";
      break;
    case 16:
      uint64_t result = "pegasusKitLookup";
      break;
    case 17:
      uint64_t result = "pegasusKitSpotlightZKW";
      break;
    case 18:
      uint64_t result = "pegasusKitEngagementSearch";
      break;
    case 19:
      uint64_t result = "engagementCache";
      break;
    case 20:
      uint64_t result = "topicCache";
      break;
    case 21:
      uint64_t result = "pegasusKitIntelligencePlatform";
      break;
    case 22:
      uint64_t result = "pegasusKitIntelligenceFlow";
      break;
    case 23:
      uint64_t result = "pegasusKitSafariAssistantPrefetch";
      break;
    case 24:
      uint64_t result = "pegasusKitSafariAssistantSummarize";
      break;
    case 25:
      uint64_t result = "pegasusKitEncryptedVisualSearch";
      break;
    case 26:
      uint64_t result = "pegasusKitSportsWatchFace";
      break;
    case 27:
      uint64_t result = "pegasusKitLookupSearch";
      break;
    case 28:
      uint64_t result = "pegasusKitEncryptedVisualSearchConfig";
      break;
    case 29:
      uint64_t result = "pegasusKitSafariSearch";
      break;
    case 30:
      uint64_t result = "pegasusKitCameraVisualSearch";
      break;
    case 31:
      uint64_t result = "installedAppWhitelist";
      break;
    case 32:
      uint64_t result = "assetDeliveryPreloadAsset";
      break;
    case 33:
      uint64_t result = "assetDeliveryPrefilterPrefetch";
      break;
    case 34:
      uint64_t result = "assetDeliveryGetPreloadedData";
      break;
    case 35:
      uint64_t result = "assetDeliveryBloomFilter";
      break;
    case 36:
      uint64_t result = "assetDeliveryRetrieveAsset";
      break;
    case 37:
      uint64_t result = "assetDeliveryRedact";
      break;
    case 38:
      uint64_t result = "assetDeliveryFeatureSupported";
      break;
    case 39:
      uint64_t result = "contextFetchAMSTreatments";
      break;
    case 40:
      uint64_t result = "feedbackEnumerator";
      break;
    case 41:
      uint64_t result = "aggregation";
      break;
    case 42:
      uint64_t result = "uploadaggregates";
      break;
    case 43:
      uint64_t result = "clientXPCConnection";
      break;
    case 44:
      uint64_t result = "sbaPlugin";
      break;
    default:
      return result;
  }
  return result;
}

uint64_t type metadata accessor for ActivityMonitor.WeakReference()
{
  return self;
}

void sub_1B38587B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  switch(*(void *)(a10 + 16))
  {
    case 0:
      OUTLINED_FUNCTION_1_10();
      sub_1B389C0C0();
      return;
    case 1:
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA930);
      uint64_t v10 = swift_allocObject();
      *(_OWORD *)(v10 + 16) = xmmword_1B389D500;
      uint64_t v11 = v10 + 32;
      uint64_t v12 = a10 + 32;
      goto LABEL_8;
    case 2:
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA930);
      unint64_t v13 = (__n128 *)swift_allocObject();
      OUTLINED_FUNCTION_0_8(v13, (__n128)xmmword_1B389D510);
      uint64_t v11 = (uint64_t)&v13[4].n128_i64[1];
      uint64_t v12 = a10 + 72;
      goto LABEL_8;
    case 3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA930);
      uint64_t v14 = (__n128 *)swift_allocObject();
      OUTLINED_FUNCTION_0_8(v14, (__n128)xmmword_1B389D520);
      sub_1B3858A28(a10 + 72, (uint64_t)&v14[4].n128_i64[1]);
      uint64_t v11 = (uint64_t)&v14[7];
      uint64_t v12 = a10 + 112;
      goto LABEL_8;
    case 4:
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA930);
      uint64_t v15 = (__n128 *)swift_allocObject();
      OUTLINED_FUNCTION_0_8(v15, (__n128)xmmword_1B389DD00);
      sub_1B3858A28(a10 + 72, (uint64_t)&v15[4].n128_i64[1]);
      sub_1B3858A28(a10 + 112, (uint64_t)&v15[7]);
      uint64_t v11 = (uint64_t)&v15[9].n128_i64[1];
      uint64_t v12 = a10 + 152;
      goto LABEL_8;
    case 5:
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA930);
      uint64_t v16 = (__n128 *)swift_allocObject();
      OUTLINED_FUNCTION_0_8(v16, (__n128)xmmword_1B389F850);
      sub_1B3858A28(a10 + 72, (uint64_t)&v16[4].n128_i64[1]);
      sub_1B3858A28(a10 + 112, (uint64_t)&v16[7]);
      sub_1B3858A28(a10 + 152, (uint64_t)&v16[9].n128_i64[1]);
      uint64_t v11 = (uint64_t)&v16[12];
      uint64_t v12 = a10 + 192;
LABEL_8:
      sub_1B3858A28(v12, v11);
      OUTLINED_FUNCTION_1_10();
      sub_1B389C0C0();
      swift_bridgeObjectRelease();
      break;
    default:
      return;
  }
}

uint64_t sub_1B3858A28(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_1B3858A8C(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_2_3();
  uint64_t v5 = sub_1B389BC30();
  OUTLINED_FUNCTION_1();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_4_1();
  uint64_t v14 = a1;
  sub_1B3859C9C();
  id v8 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FAAB8);
  if (swift_dynamicCast())
  {
    sub_1B3875FEC(v12, (uint64_t)v15);
    uint64_t v9 = v16;
    uint64_t v10 = v17;
    __swift_project_boxed_opaque_existential_1(v15, v16);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v10);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
  }
  else
  {
    uint64_t v13 = 0;
    memset(v12, 0, sizeof(v12));
    sub_1B3859C40((uint64_t)v12, &qword_1EB7FAAC8);
    sub_1B3859CDC();
    if (!v2)
    {
      (*(void (**)(uint64_t, void, uint64_t))(v7 + 104))(v3, *MEMORY[0x1E4F276A8], v5);
      uint64_t v11 = sub_1B389BD00();
      __swift_storeEnumTagSinglePayload(v1, 1, 1, v11);
      sub_1B389BCD0();
    }
  }
}

uint64_t OUTLINED_FUNCTION_6()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_12()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_4_0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return sub_1B3871BC4(v2 - 128, a1, (a2 - 32) | 0x8000000000000000);
}

void OUTLINED_FUNCTION_4_3(unsigned char *a1@<X8>)
{
  *a1 = 28;
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_6()
{
  return 0x5F6E6F6973736573;
}

uint64_t OUTLINED_FUNCTION_4_7()
{
  return sub_1B389C0B0();
}

uint64_t OUTLINED_FUNCTION_4_8()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_9()
{
  *(unsigned char *)(v1 - 96) = *(_DWORD *)(v1 - 124);
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_10()
{
  return sub_1B389CA10();
}

uint64_t OUTLINED_FUNCTION_4_12(uint64_t a1, uint64_t a2)
{
  sub_1B3859F9C(a1, a2);
  return v2;
}

uint64_t OUTLINED_FUNCTION_4_13()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_14()
{
  return swift_allocObject();
}

void OUTLINED_FUNCTION_5()
{
  JUMPOUT(0x1B3EBAF20);
}

uint64_t OUTLINED_FUNCTION_18()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_1_1(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  return result;
}

void OUTLINED_FUNCTION_1_2(double a1)
{
  *(double *)(v1 - 128) = a1;
}

BOOL OUTLINED_FUNCTION_1_4(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_1_5(unsigned __int16 a1)
{
  return a1 | 0x6867696C746F0000;
}

uint64_t OUTLINED_FUNCTION_1_6(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

void OUTLINED_FUNCTION_1_7()
{
  uint64_t v2 = *(os_unfair_lock_s **)(v0 + 16);
  os_unfair_lock_lock(v2 + 12);
}

uint64_t OUTLINED_FUNCTION_1_8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  char v4 = *(unsigned char *)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  *(_OWORD *)uint64_t v1 = *(_OWORD *)a1;
  *(void *)(v1 + 16) = v3;
  *(unsigned char *)(v1 + 24) = v4;
  *(void *)(v1 + 32) = v5;
  *(void *)(v1 + 40) = v6;
  *(void *)(v1 + 48) = v7;
  *(void *)(v1 + 56) = v8;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_1_10()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_1_11()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_1_12()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_1_13()
{
  return sub_1B389C270();
}

uint64_t OUTLINED_FUNCTION_1_14()
{
  return sub_1B389C6C0();
}

void OUTLINED_FUNCTION_1_15(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v16 = *(void *)(v14 - 152);
  sub_1B38587B8(v11, v13, a1, a2, a3, v12, v16, v10, a9, a10);
}

uint64_t OUTLINED_FUNCTION_1_18()
{
  return sub_1B389BC30();
}

void *OUTLINED_FUNCTION_1_19(uint64_t a1, void *a2)
{
  return __swift_project_boxed_opaque_existential_1(a2, a2[3]);
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

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return sub_1B3855F24(0x676E69727453, 0xE600000000000000, (uint64_t *)(v0 - 104));
}

uint64_t OUTLINED_FUNCTION_2_2(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_2_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13, long long a14, uint64_t a15, uint64_t a16, long long a17, uint64_t a18, uint64_t a19, char a20)
{
  a14 = a17;
  a15 = a18;
  a13 = v20;
  return UserAgent.init(_:requestor:)((uint64_t *)&a14, &a13, (uint64_t)&a20);
}

double OUTLINED_FUNCTION_2_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, long long a19)
{
  return sub_1B38710E0((uint64_t)&a14, v19, &a19);
}

double OUTLINED_FUNCTION_2_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,long long a21)
{
  return sub_1B38710E0((uint64_t)&a16, v21, &a21);
}

uint64_t OUTLINED_FUNCTION_2_9()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_2_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return MEMORY[0x1F40E6D88](&a9, a2, a2, v9, v9);
}

uint64_t OUTLINED_FUNCTION_2_13()
{
  return sub_1B389C920();
}

uint64_t OUTLINED_FUNCTION_11_0(uint64_t result)
{
  *(void *)(v2 - 104) = v1;
  *(void *)(v2 - 128) = result;
  return result;
}

__n128 *OUTLINED_FUNCTION_11_1(__n128 *result, __n128 a2)
{
  result[1] = a2;
  return result;
}

const char *OUTLINED_FUNCTION_11_2()
{
  return sub_1B38584F8(v0);
}

uint64_t OUTLINED_FUNCTION_11_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_55(uint64_t a1, uint64_t a2)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

void OUTLINED_FUNCTION_92(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_3_2@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(result + 32) = a3;
  *(void *)(result + 40) = v3;
  *(void *)(result + 72) = a2;
  strcpy((char *)(result + 48), "invalid client");
  *(unsigned char *)(result + 63) = -18;
  return result;
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return sub_1B389BD00();
}

unint64_t OUTLINED_FUNCTION_3_4(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000;
}

__n128 OUTLINED_FUNCTION_3_5(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, __n128 a15)
{
  __n128 result = a15;
  a1[1] = a15;
  return result;
}

uint64_t OUTLINED_FUNCTION_3_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_7()
{
  return sub_1B389C0B0();
}

uint64_t OUTLINED_FUNCTION_3_8(uint64_t a1)
{
  *(void *)(v1 - 72) = a1;
  return v1 - 72;
}

uint64_t OUTLINED_FUNCTION_3_11(uint64_t a1)
{
  __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
  return v2;
}

uint64_t OUTLINED_FUNCTION_3_13()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_3_15()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return sub_1B389C6C0();
}

void OUTLINED_FUNCTION_0_2(void *a1@<X8>)
{
  *a1 = v1;
  a1[1] = v2;
}

uint64_t OUTLINED_FUNCTION_0_3@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return sub_1B3871BC4(v2 - 128, a1, (a2 - 32) | 0x8000000000000000);
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return sub_1B389C3C0();
}

__n128 OUTLINED_FUNCTION_0_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, long long a19, uint64_t a20,char a21,__n128 a22,uint64_t a23,uint64_t a24)
{
  __n128 result = a22;
  *(_OWORD *)uint64_t v24 = a19;
  *(void *)(v24 + 16) = a20;
  *(unsigned char *)(v24 + 24) = a21;
  *(__n128 *)(v24 + 32) = a22;
  *(void *)(v24 + 48) = a23;
  *(void *)(v24 + 56) = a24;
  return result;
}

void OUTLINED_FUNCTION_0_6()
{
  JUMPOUT(0x1B3EBAF20);
}

uint64_t OUTLINED_FUNCTION_0_7(uint64_t a1, uint64_t *a2)
{
  return sub_1B387FE8C(a1, a2);
}

uint64_t OUTLINED_FUNCTION_0_8(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return sub_1B3858A28(v2 + 32, (uint64_t)&a1[2]);
}

uint64_t OUTLINED_FUNCTION_0_9()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_0_11()
{
  *(void *)(v2 - 152) = *(void *)(v1 + 24);
  *(void *)(v2 - 144) = v1 + 48;
  *(void *)(v2 - 136) = *(void *)(v0 + 72);
  return swift_unknownObjectRetain();
}

uint64_t OUTLINED_FUNCTION_0_12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  return MEMORY[0x1F40E6D88](va, a2, a2, v4, v4);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t OUTLINED_FUNCTION_64()
{
  return sub_1B389C730();
}

uint64_t OUTLINED_FUNCTION_62(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va1, a5);
  va_start(va, a5);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  return sub_1B385B178((uint64_t)va, (uint64_t)va1, a3);
}

id OUTLINED_FUNCTION_61(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
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

double OUTLINED_FUNCTION_5_0()
{
  double result = 0.0;
  *(_OWORD *)(v0 - 128) = 0u;
  *(_OWORD *)(v0 - 112) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return sub_1B389C0B0();
}

uint64_t OUTLINED_FUNCTION_5_2(uint64_t a1)
{
  return sub_1B3856C5C(a1, 68, 2, v1);
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_5_4(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_5_5()
{
  uint64_t result = *(void *)(v0 + 64);
  *(void *)uint64_t v1 = 0;
  *(void *)(v1 + 8) = 0;
  *(unsigned char *)(v1 + 16) = 0;
  *(unsigned char *)(v0 + 41) = 1;
  uint64_t v4 = *(void **)(v2 - 144);
  *uint64_t v4 = 0;
  v4[1] = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_5_6(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_5_8()
{
  return sub_1B389C0B0();
}

uint64_t OUTLINED_FUNCTION_5_9()
{
  uint64_t v1 = v0[3];
  __swift_project_boxed_opaque_existential_1(v0, v1);
  return v1;
}

uint64_t OUTLINED_FUNCTION_17_0(uint64_t a1)
{
  return MEMORY[0x1F4188298](a1, 0, 0);
}

uint64_t OUTLINED_FUNCTION_66()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_23(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_9_0@<X0>(uint64_t a1@<X8>)
{
  return sub_1B3871BC4(v1 - 128, 0xD000000000000019, (a1 - 32) | 0x8000000000000000);
}

unint64_t OUTLINED_FUNCTION_9_1()
{
  return 0xD000000000000018;
}

uint64_t OUTLINED_FUNCTION_9_2()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_9_3()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_9_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_16()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  uint64_t v2 = v0[32];
  uint64_t v3 = v0[30];
  uint64_t v4 = v0[31];
  return sub_1B3854EB4(v3, v4, v2);
}

uint64_t OUTLINED_FUNCTION_16_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1B3857138(v8, v6, v7, v5, a5);
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_13_2(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4184790](a1, a2, v3, v5, v2, v4);
}

void OUTLINED_FUNCTION_10_0()
{
  void *v0 = 0x8000000000000000;
}

uint64_t OUTLINED_FUNCTION_10_1(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

void OUTLINED_FUNCTION_10_2()
{
  uint64_t v2 = *(os_unfair_lock_s **)(*(void *)(v0 + 32) + 16);
  os_unfair_lock_lock(v2);
}

uint64_t OUTLINED_FUNCTION_10_3()
{
  return sub_1B389C890();
}

uint64_t OUTLINED_FUNCTION_10_4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  return MEMORY[0x1F40E6858](v1, v3, v4, v1);
}

uint64_t OUTLINED_FUNCTION_10_6(uint64_t a1, uint64_t a2)
{
  return sub_1B3878614(a1, a2);
}

uint64_t OUTLINED_FUNCTION_75()
{
  return swift_dynamicCast();
}

uint64_t sub_1B3859C40(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_1B3859C9C()
{
  unint64_t result = qword_1EB7FAAC0;
  if (!qword_1EB7FAAC0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB7FAAC0);
  }
  return result;
}

void sub_1B3859CDC()
{
  if (qword_1EB7FAB20 != -1) {
    swift_once();
  }
  uint64_t v0 = (uint64_t *)(qword_1EB7FAB18 + 16);
  uint64_t v1 = (os_unfair_lock_s *)(qword_1EB7FAB18 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_1EB7FAB18 + 32));
  sub_1B3859D84(v0, &v2);
  os_unfair_lock_unlock(v1);
}

uint64_t sub_1B3859D84@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = a1[1];
  if (v5)
  {
    *a2 = *a1;
    a2[1] = v5;
    return swift_bridgeObjectRetain();
  }
  uint64_t v7 = static PrimaryPersonaContainerPathLookup.path(for:)();
  if (!v2)
  {
    *a1 = v7;
    a1[1] = v8;
    *a2 = v7;
    a2[1] = v8;
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  if (qword_1E9CCEBB8 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_1B389C1B0();
  __swift_project_value_buffer(v9, (uint64_t)qword_1E9CCF220);
  id v10 = v2;
  id v11 = v2;
  uint64_t v12 = sub_1B389C190();
  os_log_type_t v13 = sub_1B389C5B0();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 138543362;
    id v16 = v2;
    uint64_t v17 = _swift_stdlib_bridgeErrorToNSError();
    sub_1B389C6C0();
    *uint64_t v15 = v17;

    _os_log_impl(&dword_1B3850000, v12, v13, "access failed with error: %{public}@", v14, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CCED90);
    swift_arrayDestroy();
    MEMORY[0x1B3EBAF20](v15, -1, -1);
    MEMORY[0x1B3EBAF20](v14, -1, -1);
  }
  else
  {
  }
  return swift_willThrow();
}

uint64_t sub_1B3859F9C(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 1) >= 0x10) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_87()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_83()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_74()
{
  return swift_allocObject();
}

uint64_t sub_1B3859FE4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1B385A020(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FA850);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for Locker()
{
  return self;
}

uint64_t sub_1B385A0AC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_11();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
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

uint64_t sub_1B385A16C()
{
  OUTLINED_FUNCTION_13();
  char v3 = v2;
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_4();
  *uint64_t v6 = v5;
  OUTLINED_FUNCTION_65(v7, v8);
  uint64_t v9 = *v1;
  OUTLINED_FUNCTION_3();
  *id v10 = v9;
  *(void *)(v5 + 232) = v0;
  swift_task_dealloc();
  if (!v0) {
    *(unsigned char *)(v5 + 123) = v3;
  }
  OUTLINED_FUNCTION_9();
  return MEMORY[0x1F4188298](v11, v12, v13);
}

uint64_t OUTLINED_FUNCTION_65(uint64_t result, uint64_t a2)
{
  *(void *)(v4 + 96) = a2;
  *(void *)(v4 + 104) = v2;
  *(unsigned char *)(v4 + 88) = result;
  *(void *)(v4 + 80) = v3;
  return result;
}

uint64_t sub_1B385A270(uint64_t a1)
{
  return OUTLINED_FUNCTION_17_0((uint64_t)sub_1B38576B0);
}

__n128 OUTLINED_FUNCTION_39(uint64_t a1)
{
  *(void *)(v2 + 144) = v1;
  *(_OWORD *)(v2 + 152) = *(_OWORD *)a1;
  uint64_t v3 = *(void *)(a1 + 16);
  *(unsigned char *)(v2 + 122) = *(unsigned char *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  *(void *)(v2 + 168) = v3;
  *(void *)(v2 + 176) = v4;
  __n128 result = *(__n128 *)(a1 + 40);
  *(__n128 *)(v2 + 184) = result;
  *(void *)(v2 + 200) = *(void *)(a1 + 56);
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t sub_1B385A2D0()
{
  uint64_t v39 = v0;
  uint64_t v1 = *(void *)(*(void *)(v0 + 216) + 240);
  uint64_t v2 = *(os_unfair_lock_s **)(*(void *)(v1 + 24) + 16);
  swift_retain();
  os_unfair_lock_lock(v2);
  uint64_t v3 = *(void *)(v1 + 16);
  *(void *)(v0 + 232) = v3;
  swift_unknownObjectRetain();
  os_unfair_lock_unlock(v2);
  swift_release();
  if (v3)
  {
    uint64_t v4 = (_OWORD *)(v0 + 16);
    uint64_t v5 = *(_OWORD **)(v0 + 208);
    long long v6 = v5[1];
    v38[0] = *v5;
    v38[1] = v6;
    long long v7 = v5[3];
    v38[2] = v5[2];
    v38[3] = v7;
    uint64_t v8 = sub_1B385A66C(v3, (uint64_t)v38);
    uint64_t v11 = v8;
    *(void *)(v0 + 240) = v8;
    *(void *)(v0 + 248) = v9;
    *(unsigned char *)(v0 + 296) = v10;
    if ((v10 & 0x80) == 0)
    {
      if (v8 == 9)
      {
        sub_1B386160C();
        if (qword_1EB7FA3A8 != -1) {
          swift_once();
        }
        uint64_t v12 = sub_1B389C1B0();
        uint64_t v13 = OUTLINED_FUNCTION_40(v12, (uint64_t)qword_1EB7FA460);
        os_log_type_t v14 = sub_1B389C5D0();
        if (os_log_type_enabled(v13, v14))
        {
          uint64_t v15 = (uint8_t *)OUTLINED_FUNCTION_12();
          *(_WORD *)uint64_t v15 = 0;
          _os_log_impl(&dword_1B3850000, v13, v14, "Configuration expired or expiring soon. Vending stale configuration and attempt to fetch new one in the background.", v15, 2u);
          OUTLINED_FUNCTION_5();
        }
        uint64_t v16 = *(void *)(v0 + 224);

        uint64_t v17 = sub_1B389C4F0();
        __swift_storeEnumTagSinglePayload(v16, 1, 1, v17);
        uint64_t v18 = OUTLINED_FUNCTION_74();
        swift_weakInit();
        uint64_t v19 = swift_allocObject();
        *(void *)(v19 + 16) = 0;
        *(void *)(v19 + 24) = 0;
        *(void *)(v19 + 32) = v18;
        long long v20 = *(_OWORD *)(v0 + 32);
        *(_OWORD *)(v19 + 40) = *v4;
        *(_OWORD *)(v19 + 56) = v20;
        long long v21 = *(_OWORD *)(v0 + 64);
        *(_OWORD *)(v19 + 72) = *(_OWORD *)(v0 + 48);
        *(_OWORD *)(v19 + 88) = v21;
        sub_1B386CDB8(v0 + 16);
        sub_1B3861964(v16, (uint64_t)&unk_1E9CCEE30, v19);
        swift_release();
        sub_1B386D330(v16, &qword_1EB7FA880);
      }
      swift_task_dealloc();
      OUTLINED_FUNCTION_28();
      return v22(v11, v3);
    }
    uint64_t v33 = v9;
    char v34 = v10 & 0x7F;
    sub_1B38615A8();
    long long v35 = *(_OWORD *)(v0 + 32);
    *(_OWORD *)(v0 + 144) = *v4;
    *(_OWORD *)(v0 + 160) = v35;
    long long v36 = *(_OWORD *)(v0 + 64);
    *(_OWORD *)(v0 + 176) = *(_OWORD *)(v0 + 48);
    *(_OWORD *)(v0 + 192) = v36;
    uint64_t v37 = (void *)swift_task_alloc();
    *(void *)(v0 + 256) = v37;
    *uint64_t v37 = v0;
    v37[1] = sub_1B386031C;
    char v29 = (_OWORD *)OUTLINED_FUNCTION_72();
    uint64_t v31 = v33;
    char v32 = v34;
  }
  else
  {
    uint64_t v24 = *(long long **)(v0 + 208);
    sub_1B38615A8();
    long long v25 = *v24;
    long long v26 = v24[1];
    long long v27 = v24[3];
    *(_OWORD *)(v0 + 112) = v24[2];
    *(_OWORD *)(v0 + 128) = v27;
    *(_OWORD *)(v0 + 80) = v25;
    *(_OWORD *)(v0 + 96) = v26;
    os_log_type_t v28 = (void *)swift_task_alloc();
    *(void *)(v0 + 280) = v28;
    *os_log_type_t v28 = v0;
    v28[1] = sub_1B386049C;
    OUTLINED_FUNCTION_9();
    char v32 = 2;
  }
  return sub_1B385F964(v29, v30, v31, v32, 1);
}

uint64_t sub_1B385A66C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v55 = sub_1B389BA70();
  uint64_t v54 = *(void *)(v55 - 8);
  MEMORY[0x1F4188790](v55);
  long long v7 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
  MEMORY[0x1F4188790](v8 - 8);
  unint64_t v56 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1B389BE20();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t Throttle = type metadata accessor for ConfigFetchThrottle(0);
  uint64_t v15 = MEMORY[0x1F4188790](Throttle);
  uint64_t v17 = (char *)&v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  uint64_t v19 = (char *)&v53 - v18;
  uint64_t v20 = *(void *)a2;
  uint64_t v63 = *(void *)(a2 + 8);
  uint64_t v64 = v20;
  uint64_t v62 = *(void *)(a2 + 16);
  int v61 = *(unsigned __int8 *)(a2 + 24);
  uint64_t v21 = *(void *)(a2 + 32);
  uint64_t v59 = *(void *)(a2 + 40);
  uint64_t v60 = v21;
  uint64_t v22 = *(void *)(a2 + 48);
  uint64_t v57 = *(void *)(a2 + 56);
  uint64_t v58 = v22;
  if (sub_1B385C6A4(a1)) {
    return 1;
  }
  uint64_t v23 = (void *)swift_unknownObjectRetain();
  v65 = v19;
  sub_1B385AE8C(v23, (uint64_t)v19);
  if (MEMORY[0x1B3EBAFF0](v3 + 224))
  {
    uint64_t v24 = *(void *)(v3 + 232);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v24 + 24))(v67, ObjectType, v24);
    swift_unknownObjectRelease();
    int v26 = LOBYTE(v67[0]);
  }
  else
  {
    int v26 = 4;
  }
  sub_1B385B3B8((uint64_t)v65, (uint64_t)v17);
  if (v26 != 4)
  {
    sub_1B385AD6C((uint64_t)v17, (void (*)(void))type metadata accessor for ConfigFetchThrottle);
    if (v26 != 3) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  sub_1B389BE10();
  sub_1B389BD70();
  double v28 = v27;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  double v29 = *(double *)&v17[*(int *)(Throttle + 20)];
  sub_1B385AD6C((uint64_t)v17, (void (*)(void))type metadata accessor for ConfigFetchThrottle);
  if (v28 >= v29)
  {
LABEL_9:
    if (sub_1B385C574())
    {
      uint64_t v30 = MEMORY[0x1B3EBAFF0](v3 + 224);
      uint64_t v31 = (uint64_t)v65;
      if (v30)
      {
        uint64_t v32 = *(void *)(v3 + 232);
        uint64_t v33 = swift_getObjectType();
        uint64_t v34 = (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 40))(v33, v32);
        unint64_t v36 = v35;
        swift_unknownObjectRelease();
      }
      else
      {
        v67[0] = v64;
        v67[1] = v63;
        v67[2] = v62;
        char v68 = v61;
        uint64_t v69 = v60;
        uint64_t v70 = v59;
        uint64_t v71 = v58;
        uint64_t v72 = v57;
        sub_1B389A190(v3 + 80, (uint64_t)v67, 0, 0, 0);
        uint64_t v45 = (uint64_t)v56;
        sub_1B389BA60();
        (*(void (**)(char *, uint64_t))(v54 + 8))(v7, v55);
        uint64_t v46 = sub_1B389BD00();
        if (__swift_getEnumTagSinglePayload(v45, 1, v46) == 1)
        {
          sub_1B386D330(v45, (uint64_t *)&unk_1EB7FBF88);
          uint64_t v34 = 0;
          unint64_t v36 = 0;
        }
        else
        {
          uint64_t v34 = sub_1B389BC40();
          unint64_t v36 = v52;
          (*(void (**)(uint64_t, uint64_t))(*(void *)(v46 - 8) + 8))(v45, v46);
        }
      }
      uint64_t v47 = v31;
      uint64_t v44 = sub_1B385B70C(v34, v36);
      unsigned int v49 = v48;
      swift_bridgeObjectRelease();
      if (v49 <= 0xFB)
      {
        sub_1B385AD6C(v47, (void (*)(void))type metadata accessor for ConfigFetchThrottle);
        return v44;
      }
      char v50 = sub_1B385B4C8();
      sub_1B385AD6C(v47, (void (*)(void))type metadata accessor for ConfigFetchThrottle);
      if (v50) {
        return 9;
      }
    }
    else
    {
      sub_1B385AD6C((uint64_t)v65, (void (*)(void))type metadata accessor for ConfigFetchThrottle);
    }
    return 1;
  }
  LOBYTE(v26) = 0;
LABEL_12:
  if (qword_1EB7FA3A8 != -1) {
    swift_once();
  }
  uint64_t v37 = sub_1B389C1B0();
  __swift_project_value_buffer(v37, (uint64_t)qword_1EB7FA460);
  uint64_t v38 = sub_1B389C190();
  os_log_type_t v39 = sub_1B389C5A0();
  if (os_log_type_enabled(v38, v39))
  {
    uint64_t v40 = (uint8_t *)swift_slowAlloc();
    uint64_t v41 = swift_slowAlloc();
    v67[0] = v41;
    *(_DWORD *)uint64_t v40 = 136315138;
    LOBYTE(v66) = v26;
    uint64_t v42 = sub_1B389C300();
    uint64_t v66 = sub_1B3855F24(v42, v43, v67);
    sub_1B389C6C0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B3850000, v38, v39, "shouldThrottleConfigFetch: (%s", v40, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B3EBAF20](v41, -1, -1);
    MEMORY[0x1B3EBAF20](v40, -1, -1);
  }

  sub_1B385AD6C((uint64_t)v65, (void (*)(void))type metadata accessor for ConfigFetchThrottle);
  return 8;
}

uint64_t sub_1B385AD6C(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_46();
  v3();
  return a1;
}

uint64_t type metadata accessor for ConfigFetchThrottle(uint64_t a1)
{
  return sub_1B385ADE0(a1, qword_1EB7FA748);
}

uint64_t sub_1B385ADE0(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1B385AE14(uint64_t a1)
{
  uint64_t v2 = sub_1B389BE20();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);

  return swift_bridgeObjectRelease();
}

uint64_t sub_1B385AE8C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  if (!a1)
  {
    long long v18 = 0u;
    long long v19 = 0u;
LABEL_9:
    sub_1B386D330((uint64_t)&v18, &qword_1EB7FBE60);
    goto LABEL_10;
  }
  swift_unknownObjectRetain();
  uint64_t v4 = (void *)sub_1B389C280();
  id v5 = objc_msgSend(a1, sel_valueForKey_, v4);

  swift_unknownObjectRelease();
  if (v5)
  {
    sub_1B389C730();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v17, 0, sizeof(v17));
  }
  sub_1B385B178((uint64_t)v17, (uint64_t)&v18, &qword_1EB7FBE60);
  if (!*((void *)&v19 + 1)) {
    goto LABEL_9;
  }
  if (swift_dynamicCast())
  {
    sub_1B389BDC0();
    goto LABEL_11;
  }
LABEL_10:
  sub_1B389BD60();
  if (!a1)
  {
    uint64_t Throttle = (int *)type metadata accessor for ConfigFetchThrottle(0);
    *(void *)(a2 + Throttle[5]) = 0;
    os_log_type_t v14 = (void *)(a2 + Throttle[7]);
    *os_log_type_t v14 = 0;
    v14[1] = 0;
    char v13 = 1;
    double v12 = 0.0;
    goto LABEL_13;
  }
LABEL_11:
  swift_unknownObjectRetain();
  double v6 = sub_1B385B1D4();
  swift_unknownObjectRelease();
  uint64_t Throttle = (int *)type metadata accessor for ConfigFetchThrottle(0);
  *(double *)(a2 + Throttle[5]) = v6;
  swift_unknownObjectRetain();
  uint64_t v8 = sub_1B385B080();
  uint64_t v10 = v9;
  swift_unknownObjectRelease();
  uint64_t v11 = (uint64_t *)(a2 + Throttle[7]);
  *uint64_t v11 = v8;
  v11[1] = v10;
  swift_unknownObjectRetain();
  double v12 = sub_1B385B2CC();
  swift_unknownObjectRelease_n();
  char v13 = 0;
LABEL_13:
  uint64_t result = type metadata accessor for ConfigFetchThrottle(0);
  uint64_t v16 = a2 + Throttle[6];
  *(double *)uint64_t v16 = v12;
  *(unsigned char *)(v16 + 8) = v13;
  return result;
}

uint64_t sub_1B385B080()
{
  if (qword_1E9CCEB28 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)sub_1B389C280();
  id v1 = OUTLINED_FUNCTION_61((uint64_t)v0, sel_valueForKey_);

  if (v1)
  {
    OUTLINED_FUNCTION_64();
    uint64_t v2 = swift_unknownObjectRelease();
  }
  else
  {
    double v6 = OUTLINED_FUNCTION_63();
  }
  OUTLINED_FUNCTION_62(v2, v3, &qword_1EB7FBE60, v4, v5, v6);
  if (v10)
  {
    if (OUTLINED_FUNCTION_75()) {
      return v8;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_1B386D330((uint64_t)v9, &qword_1EB7FBE60);
    return 0;
  }
}

uint64_t sub_1B385B178(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_11();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

double sub_1B385B1D4()
{
  uint64_t v0 = (void *)OUTLINED_FUNCTION_77();
  id v1 = OUTLINED_FUNCTION_61((uint64_t)v0, sel_valueForKey_);

  if (v1)
  {
    OUTLINED_FUNCTION_64();
    uint64_t v2 = swift_unknownObjectRelease();
  }
  else
  {
    double v6 = OUTLINED_FUNCTION_63();
  }
  OUTLINED_FUNCTION_62(v2, v3, &qword_1EB7FBE60, v4, v5, v6);
  if (v10)
  {
    if (OUTLINED_FUNCTION_44()) {
      return v8;
    }
  }
  else
  {
    sub_1B386D330((uint64_t)v9, &qword_1EB7FBE60);
  }
  return 0.0;
}

uint64_t OUTLINED_FUNCTION_44()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_77()
{
  return sub_1B389C280();
}

double sub_1B385B2CC()
{
  if (qword_1EB7FAB90 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)sub_1B389C280();
  id v1 = OUTLINED_FUNCTION_61((uint64_t)v0, sel_valueForKey_);

  if (v1)
  {
    OUTLINED_FUNCTION_64();
    uint64_t v2 = swift_unknownObjectRelease();
  }
  else
  {
    double v6 = OUTLINED_FUNCTION_63();
  }
  OUTLINED_FUNCTION_62(v2, v3, &qword_1EB7FBE60, v4, v5, v6);
  if (v10)
  {
    if (OUTLINED_FUNCTION_44()) {
      return v8;
    }
  }
  else
  {
    sub_1B386D330((uint64_t)v9, &qword_1EB7FBE60);
  }
  return 0.0;
}

uint64_t sub_1B385B3B8(uint64_t a1, uint64_t a2)
{
  uint64_t Throttle = type metadata accessor for ConfigFetchThrottle(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(Throttle - 8) + 16))(a2, a1, Throttle);
  return a2;
}

uint64_t sub_1B385B41C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1B389BE20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)uint64_t v8 = *(void *)v9;
  *(unsigned char *)(v8 + 8) = *(unsigned char *)(v9 + 8);
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)(a1 + v10);
  double v12 = (void *)(a2 + v10);
  uint64_t v13 = v12[1];
  *uint64_t v11 = *v12;
  v11[1] = v13;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1B385B4C8()
{
  uint64_t v1 = sub_1B389BE20();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x1F4188790](v1);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  uint64_t v7 = (char *)&v16 - v6;
  uint64_t v8 = v0 + *(int *)(type metadata accessor for ConfigFetchThrottle(0) + 24);
  if (*(unsigned char *)(v8 + 8))
  {
    char v9 = 1;
  }
  else if (*(double *)v8 <= 0.0)
  {
    char v9 = 0;
  }
  else
  {
    sub_1B389BDC0();
    if (qword_1EB7FA3E0 != -1) {
      swift_once();
    }
    sub_1B389BDA0();
    char v9 = sub_1B389BD90();
    uint64_t v10 = *(void (**)(char *, uint64_t))(v2 + 8);
    v10(v5, v1);
    if (v9)
    {
      if (qword_1EB7FA3A8 != -1) {
        swift_once();
      }
      uint64_t v11 = sub_1B389C1B0();
      __swift_project_value_buffer(v11, (uint64_t)qword_1EB7FA460);
      double v12 = sub_1B389C190();
      os_log_type_t v13 = sub_1B389C5A0();
      if (os_log_type_enabled(v12, v13))
      {
        os_log_type_t v14 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v14 = 0;
        _os_log_impl(&dword_1B3850000, v12, v13, "Config is going to expire soon. Go fetch it.", v14, 2u);
        MEMORY[0x1B3EBAF20](v14, -1, -1);
      }
    }
    v10(v7, v1);
  }
  return v9 & 1;
}

uint64_t sub_1B385B70C(uint64_t a1, unint64_t a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v5 = (uint64_t *)(v2 + *(int *)(type metadata accessor for ConfigFetchThrottle(0) + 28));
  unint64_t v6 = v5[1];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = *v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B385BB14();
  if (v10 == -1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_1EB7FA3A8 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_1B389C1B0();
    __swift_project_value_buffer(v20, (uint64_t)qword_1EB7FA460);
    uint64_t v21 = sub_1B389C190();
    os_log_type_t v22 = sub_1B389C5A0();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_1B3850000, v21, v22, "Context not changed, no need to refresh config", v23, 2u);
      MEMORY[0x1B3EBAF20](v23, -1, -1);
    }

    return 0;
  }
  uint64_t v11 = v8;
  uint64_t v12 = v9;
  char v13 = v10;
  if (qword_1EB7FA3A8 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_1B389C1B0();
  __swift_project_value_buffer(v14, (uint64_t)qword_1EB7FA460);
  sub_1B386C7FC(v11, v12, v13);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B386C7FC(v11, v12, v13);
  uint64_t v15 = sub_1B389C190();
  os_log_type_t v16 = sub_1B389C5A0();
  if (os_log_type_enabled(v15, v16))
  {
    os_log_type_t type = v16;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v27 = v25;
    *(_DWORD *)uint64_t v17 = 136315650;
    unint64_t v18 = sub_1B386302C(v11, v12, v13);
    sub_1B3855F24(v18, v19, &v27);
    sub_1B389C6C0();
    swift_bridgeObjectRelease();
    sub_1B386C828(v11, v12, v13);
    sub_1B386C828(v11, v12, v13);
    *(_WORD *)(v17 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_1B3855F24(v7, v6, &v27);
    sub_1B389C6C0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v17 + 22) = 2080;
    swift_bridgeObjectRetain();
    sub_1B3855F24(a1, a2, &v27);
    sub_1B389C6C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1B3850000, v15, type, "Context has changed (%s) from %s to %s", (uint8_t *)v17, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1B3EBAF20](v25, -1, -1);
    MEMORY[0x1B3EBAF20](v17, -1, -1);
  }
  else
  {
    sub_1B386C828(v11, v12, v13);
    sub_1B386C828(v11, v12, v13);

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  return v11;
}

void sub_1B385BB14()
{
  OUTLINED_FUNCTION_48();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v126 = sub_1B389BAD0();
  OUTLINED_FUNCTION_1();
  uint64_t v124 = v9;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_25();
  v125 = v11;
  OUTLINED_FUNCTION_51();
  MEMORY[0x1F4188790](v12);
  v127 = (char *)&v114 - v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA440);
  uint64_t v15 = OUTLINED_FUNCTION_24(v14);
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_19();
  MEMORY[0x1F4188790](v16);
  unint64_t v18 = (char *)&v114 - v17;
  uint64_t v19 = sub_1B389BB80();
  OUTLINED_FUNCTION_1();
  uint64_t v21 = MEMORY[0x1F4188790](v20);
  uint64_t v22 = MEMORY[0x1F4188790](v21);
  uint64_t v23 = MEMORY[0x1F4188790](v22);
  MEMORY[0x1F4188790](v23);
  MEMORY[0x1F4188790]((char *)&v114 - v24);
  OUTLINED_FUNCTION_91();
  uint64_t v26 = MEMORY[0x1F4188790](v25);
  uint64_t v27 = MEMORY[0x1F4188790](v26);
  uint64_t v28 = MEMORY[0x1F4188790](v27);
  unint64_t v35 = (char *)&v114 - v34;
  BOOL v36 = v8 == v4 && v6 == v2;
  if (v36) {
    goto LABEL_46;
  }
  uint64_t v121 = v28;
  uint64_t v122 = v30;
  uint64_t v119 = v32;
  uint64_t v120 = v29;
  uint64_t v118 = v33;
  v123 = v31;
  if (sub_1B389C920()) {
    goto LABEL_46;
  }
  v117 = v35;
  sub_1B389BB70();
  OUTLINED_FUNCTION_23((uint64_t)v18, 1, v19);
  if (v36)
  {
    uint64_t v37 = (uint64_t)v18;
LABEL_13:
    sub_1B386D330(v37, &qword_1EB7FA440);
LABEL_46:
    OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_45();
    return;
  }
  uint64_t v38 = v122;
  v116 = *(void (**)(char *, char *, uint64_t))(v122 + 32);
  v116(v117, v18, v19);
  OUTLINED_FUNCTION_71();
  sub_1B389BB70();
  OUTLINED_FUNCTION_23(v0, 1, v19);
  if (v39)
  {
    OUTLINED_FUNCTION_37();
    v40();
    uint64_t v37 = v0;
    goto LABEL_13;
  }
  uint64_t v115 = v38;
  v116(v123, (char *)v0, v19);
  uint64_t v41 = v117;
  uint64_t v42 = sub_1B389BB60();
  uint64_t v44 = v43;
  uint64_t v45 = sub_1B389BB60();
  if (v44)
  {
    if (v46)
    {
      BOOL v47 = v42 == v45 && v44 == v46;
      uint64_t v48 = v19;
      if (v47)
      {
        swift_bridgeObjectRelease();
        char v49 = 1;
      }
      else
      {
        char v49 = sub_1B389C920();
        swift_bridgeObjectRelease();
      }
      goto LABEL_26;
    }
    char v49 = 0;
LABEL_24:
    uint64_t v48 = v19;
LABEL_26:
    uint64_t v50 = v115;
    swift_bridgeObjectRelease();
    goto LABEL_27;
  }
  if (v46)
  {
    char v49 = 0;
    goto LABEL_24;
  }
  char v49 = 1;
  uint64_t v48 = v19;
  uint64_t v50 = v115;
LABEL_27:
  uint64_t v51 = *(void (**)(void))(v50 + 16);
  OUTLINED_FUNCTION_84();
  OUTLINED_FUNCTION_8();
  v51();
  OUTLINED_FUNCTION_8();
  v51();
  if ((v49 & 1) == 0)
  {
    uint64_t v59 = *(void (**)(void))(v50 + 8);
    OUTLINED_FUNCTION_10();
    v59();
    OUTLINED_FUNCTION_10();
    v59();
LABEL_41:
    OUTLINED_FUNCTION_8();
    v51();
    uint64_t v64 = OUTLINED_FUNCTION_86();
    ((void (*)(uint64_t))v51)(v64);
LABEL_42:
    OUTLINED_FUNCTION_68();
    OUTLINED_FUNCTION_78();
    v59();
    OUTLINED_FUNCTION_78();
    v59();
    uint64_t v65 = v119;
    goto LABEL_43;
  }
  uint64_t v52 = sub_1B389BB30();
  uint64_t v54 = v53;
  uint64_t v55 = sub_1B389BB30();
  uint64_t v57 = v56;
  if (!v54)
  {
    int v61 = *(void (**)(void))(v50 + 8);
    uint64_t v60 = v50 + 8;
    uint64_t v59 = v61;
    OUTLINED_FUNCTION_10();
    v61();
    OUTLINED_FUNCTION_10();
    v61();
    if (!v57)
    {
      uint64_t v62 = v60 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      uint64_t v63 = v121;
      OUTLINED_FUNCTION_8();
      v51();
      OUTLINED_FUNCTION_8();
      v51();
      goto LABEL_50;
    }
    goto LABEL_40;
  }
  if (!v56)
  {
    uint64_t v59 = *(void (**)(void))(v50 + 8);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_10();
    v59();
    OUTLINED_FUNCTION_10();
    v59();
    swift_bridgeObjectRelease();
LABEL_40:
    swift_bridgeObjectRelease();
    goto LABEL_41;
  }
  if (v52 == v55 && v54 == v56)
  {
    LODWORD(v116) = 1;
  }
  else
  {
    OUTLINED_FUNCTION_72();
    LODWORD(v116) = sub_1B389C920();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v70 = *(void (**)(void))(v50 + 8);
  uint64_t v69 = v50 + 8;
  uint64_t v59 = v70;
  OUTLINED_FUNCTION_10();
  v70();
  OUTLINED_FUNCTION_10();
  v70();
  swift_bridgeObjectRelease_n();
  OUTLINED_FUNCTION_8();
  v51();
  OUTLINED_FUNCTION_8();
  v51();
  if ((v116 & 1) == 0) {
    goto LABEL_42;
  }
  uint64_t v62 = v69 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  uint64_t v63 = v121;
LABEL_50:
  uint64_t v121 = sub_1B389BB50();
  LODWORD(v122) = v71;
  uint64_t v72 = sub_1B389BB50();
  char v74 = v73;
  uint64_t v75 = OUTLINED_FUNCTION_68();
  ((void (*)(uint64_t))v59)(v75);
  ((void (*)(uint64_t, uint64_t))v59)(v63, v48);
  if ((v122 & 1) == 0)
  {
    uint64_t v65 = v119;
    if ((v74 & 1) == 0)
    {
      char v76 = v121 == v72;
      goto LABEL_55;
    }
LABEL_43:
    uint64_t v66 = v65;
    OUTLINED_FUNCTION_8();
    v51();
    uint64_t v67 = OUTLINED_FUNCTION_86();
    ((void (*)(uint64_t))v51)(v67);
LABEL_44:
    uint64_t v68 = OUTLINED_FUNCTION_68();
    ((void (*)(uint64_t))v59)(v68);
    ((void (*)(uint64_t, uint64_t))v59)(v66, v48);
LABEL_45:
    ((void (*)(char *, uint64_t))v59)(v123, v48);
    ((void (*)(char *, uint64_t))v59)(v41, v48);
    goto LABEL_46;
  }
  char v76 = v74 & 1;
  uint64_t v65 = v119;
LABEL_55:
  uint64_t v66 = v65;
  OUTLINED_FUNCTION_8();
  v51();
  OUTLINED_FUNCTION_8();
  v51();
  if ((v76 & 1) == 0) {
    goto LABEL_44;
  }
  uint64_t v77 = sub_1B389BB40();
  uint64_t v79 = v78;
  if (v77 == sub_1B389BB40() && v79 == v80)
  {
    swift_bridgeObjectRelease_n();
    uint64_t v84 = OUTLINED_FUNCTION_68();
    ((void (*)(uint64_t))v59)(v84);
    ((void (*)(uint64_t, uint64_t))v59)(v66, v48);
    goto LABEL_63;
  }
  char v82 = OUTLINED_FUNCTION_52();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v83 = OUTLINED_FUNCTION_68();
  ((void (*)(uint64_t))v59)(v83);
  ((void (*)(uint64_t, uint64_t))v59)(v66, v48);
  if ((v82 & 1) == 0) {
    goto LABEL_45;
  }
LABEL_63:
  uint64_t v115 = v62;
  uint64_t v85 = sub_1B389BAE0();
  if (!v85)
  {
    v110 = v123;
LABEL_92:
    ((void (*)(char *, uint64_t))v59)(v110, v48);
    v111 = v41;
LABEL_95:
    ((void (*)(char *, uint64_t))v59)(v111, v48);
    goto LABEL_46;
  }
  uint64_t v86 = v85;
  v87 = v123;
  uint64_t v88 = sub_1B389BAE0();
  if (!v88)
  {
    swift_bridgeObjectRelease();
    v110 = v87;
    goto LABEL_92;
  }
  v89 = (void (*)(void))v88;
  uint64_t v121 = *(void *)(v86 + 16);
  if (!v121)
  {
LABEL_94:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    ((void (*)(char *, uint64_t))v59)(v123, v48);
    v111 = v117;
    goto LABEL_95;
  }
  unint64_t v90 = 0;
  uint64_t v122 = v124 + 16;
  v91 = (void (**)(void))(v124 + 8);
  while (v90 < *(void *)(v86 + 16))
  {
    v92 = *(void (**)(void))(v124 + 16);
    OUTLINED_FUNCTION_90();
    v92();
    unint64_t v93 = *((void *)v89 + 2);
    if (v90 == v93)
    {
      ((void (*)(char *, uint64_t))*v91)(v127, v126);
      goto LABEL_94;
    }
    if (v90 >= v93) {
      goto LABEL_99;
    }
    v94 = v125;
    OUTLINED_FUNCTION_90();
    v92();
    uint64_t v95 = sub_1B389BAB0();
    uint64_t v97 = v96;
    if (v95 == sub_1B389BAB0() && v97 == v98)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v100 = OUTLINED_FUNCTION_52();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v100 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_1B389BAB0();
        uint64_t v112 = OUTLINED_FUNCTION_38();
        ((void (*)(uint64_t))v94)(v112);
        OUTLINED_FUNCTION_49();
        v94();
        ((void (*)(char *, uint64_t))v59)(v123, v48);
        ((void (*)(char *, uint64_t))v59)(v117, v48);
        goto LABEL_46;
      }
    }
    v101 = v89;
    uint64_t v102 = sub_1B389BAC0();
    uint64_t v104 = v103;
    uint64_t v105 = sub_1B389BAC0();
    if (v104)
    {
      if (!v106) {
        goto LABEL_96;
      }
      if (v102 == v105 && v104 == v106)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        char v108 = sub_1B389C920();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v108 & 1) == 0)
        {
          swift_bridgeObjectRelease();
LABEL_97:
          swift_bridgeObjectRelease();
          sub_1B389BAB0();
          uint64_t v113 = OUTLINED_FUNCTION_38();
          ((void (*)(uint64_t))v101)(v113);
          OUTLINED_FUNCTION_66();
          OUTLINED_FUNCTION_49();
          v101();
          ((void (*)(char *, uint64_t))v59)(v123, v48);
          ((void (*)(char *, uint64_t))v59)(v117, v48);
          goto LABEL_46;
        }
      }
    }
    else if (v106)
    {
LABEL_96:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_97;
    }
    ++v90;
    v109 = *v91;
    OUTLINED_FUNCTION_49();
    v109();
    OUTLINED_FUNCTION_49();
    v109();
    v89 = v101;
    if (v121 == v90) {
      goto LABEL_94;
    }
  }
  __break(1u);
LABEL_99:
  __break(1u);
}

uint64_t OUTLINED_FUNCTION_36()
{
  return v0;
}

uint64_t sub_1B385C574()
{
  if (MEMORY[0x1B3EBAFF0](v0 + 28))
  {
    uint64_t v1 = v0[29];
    uint64_t ObjectType = swift_getObjectType();
    char v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 64))(ObjectType, v1);
    swift_unknownObjectRelease();
    return v3 & 1;
  }
  else
  {
    uint64_t v5 = v0[14];
    __swift_project_boxed_opaque_existential_1(v0 + 10, v0[13]);
    uint64_t v6 = OUTLINED_FUNCTION_83();
    if (v7(v6, v5))
    {
      return 1;
    }
    else
    {
      if (qword_1EB7FA940 != -1) {
        swift_once();
      }
      uint64_t v8 = sub_1B389C1B0();
      uint64_t v9 = OUTLINED_FUNCTION_40(v8, (uint64_t)qword_1EB7FC0D8);
      os_log_type_t v10 = sub_1B389C590();
      if (os_log_type_enabled(v9, v10))
      {
        uint64_t v11 = (_WORD *)OUTLINED_FUNCTION_12();
        OUTLINED_FUNCTION_42(v11);
        OUTLINED_FUNCTION_92(&dword_1B3850000, v12, v13, "Required context missing");
        OUTLINED_FUNCTION_5();
      }

      return 0;
    }
  }
}

unint64_t sub_1B385C6A4(uint64_t a1)
{
  if (!MEMORY[0x1B3EBAFF0](v1 + 224)) {
    return (unint64_t)sub_1B3861AE8() & 1;
  }
  uint64_t v3 = *(void *)(v1 + 232);
  uint64_t ObjectType = swift_getObjectType();
  char v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(a1, ObjectType, v3);
  swift_unknownObjectRelease();
  return v5 & 1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
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

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1B385C748(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t NSFileManager.parsecdCustomFBDirectoryURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = sub_1B389BC30();
  OUTLINED_FUNCTION_1();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_4_1();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v9 = OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = &v19[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  NSFileManager.parsecdAssetsDirectoryURL.getter(v2);
  if (__swift_getEnumTagSinglePayload(v2, 1, v9) == 1)
  {
    sub_1B3859C40(v2, (uint64_t *)&unk_1EB7FBF88);
    uint64_t v15 = 1;
  }
  else
  {
    strcpy(v19, "CustomFeedback");
    v19[15] = -18;
    (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v1, *MEMORY[0x1E4F276A8], v4);
    sub_1B38538CC();
    sub_1B389BCE0();
    OUTLINED_FUNCTION_1_3();
    v16();
    swift_bridgeObjectRelease();
    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v17(v2, v9);
    sub_1B389BC10();
    v17((uint64_t)v14, v9);
    uint64_t v15 = 0;
  }
  return __swift_storeEnumTagSinglePayload(a1, v15, 1, v9);
}

uint64_t NSFileManager.parsecdAssetsDirectoryURL.getter@<X0>(uint64_t a1@<X8>)
{
  v24[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
  MEMORY[0x1F4188790](v3 - 8);
  OUTLINED_FUNCTION_2_3();
  uint64_t v4 = sub_1B389BD00();
  OUTLINED_FUNCTION_1();
  uint64_t v6 = v5;
  uint64_t v8 = MEMORY[0x1F4188790](v7);
  uint64_t v10 = &v23[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = &v23[-v11];
  v24[0] = 0;
  id v13 = objc_msgSend(v1, sel_URLForDirectory_inDomain_appropriateForURL_create_error_, 13, 1, 0, 0, v24);
  id v14 = v24[0];
  if (!v13)
  {
    id v20 = v24[0];
    uint64_t v21 = (void *)sub_1B389BC00();

    swift_willThrow();
    OUTLINED_FUNCTION_55((uint64_t)v1, 1);
    goto LABEL_5;
  }
  uint64_t v15 = v13;
  sub_1B389BC90();
  id v16 = v14;

  uint64_t v17 = *(void (**)(void *, unsigned char *, uint64_t))(v6 + 32);
  v17(v1, v10, v4);
  OUTLINED_FUNCTION_55((uint64_t)v1, 0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v1, 1, v4) == 1)
  {
LABEL_5:
    sub_1B3859C40((uint64_t)v1, (uint64_t *)&unk_1EB7FBF88);
    uint64_t v19 = 1;
    return OUTLINED_FUNCTION_55(a1, v19);
  }
  v17(v12, v1, v4);
  sub_1B389BC60();
  sub_1B389BC10();
  unint64_t v18 = *(void (**)(void))(v6 + 8);
  OUTLINED_FUNCTION_1_3();
  v18();
  OUTLINED_FUNCTION_1_3();
  v18();
  uint64_t v19 = 0;
  return OUTLINED_FUNCTION_55(a1, v19);
}

uint64_t NSURLSession.toDataSource(onSetup:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v7 = type metadata accessor for URLSessionDataSource();
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = v3;
  v8[3] = a1;
  v8[4] = a2;
  a3[3] = v7;
  a3[4] = &off_1F0C121D8;
  *a3 = v8;
  id v9 = v3;

  return sub_1B385C748(a1);
}

uint64_t UserAgent.client.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(void *)(a1 + 16) = v2;
  return swift_bridgeObjectRetain();
}

uint64_t static UserAgent.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return (*(void *)a1 == *(void *)a2) & (*(unsigned __int8 *)(a1 + 24) ^ *(unsigned __int8 *)(a2 + 24) ^ 1u);
}

BOOL Config.isDefault.getter()
{
  if (qword_1E9CCEB28 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)sub_1B389C280();
  id v1 = OUTLINED_FUNCTION_61((uint64_t)v0, sel_valueForKey_);

  if (v1)
  {
    OUTLINED_FUNCTION_64();
    uint64_t v2 = swift_unknownObjectRelease();
  }
  else
  {
    double v6 = OUTLINED_FUNCTION_63();
  }
  OUTLINED_FUNCTION_62(v2, v3, &qword_1EB7FBE60, v4, v5, v6);
  if (v14)
  {
    if (OUTLINED_FUNCTION_75())
    {
      unint64_t v7 = v12;
      uint64_t v8 = *(void *)v11 & 0xFFFFFFFFFFFFLL;
      goto LABEL_11;
    }
  }
  else
  {
    sub_1B386D330((uint64_t)v13, &qword_1EB7FBE60);
  }
  uint64_t v8 = 0;
  unint64_t v7 = 0xE000000000000000;
LABEL_11:
  swift_bridgeObjectRelease();
  uint64_t v9 = HIBYTE(v7) & 0xF;
  if ((v7 & 0x2000000000000000) == 0) {
    uint64_t v9 = v8;
  }
  return v9 == 0;
}

uint64_t Client.init(_:)@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  if (a1)
  {
    uint64_t v3 = sub_1B389C310();
    unint64_t v5 = v4;
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_1_16();
    unint64_t v6 = sub_1B38538CC();
    if (OUTLINED_FUNCTION_0_12(v6, MEMORY[0x1E4FBB1A0], v7, v8))
    {
      swift_bridgeObjectRelease();
      char v9 = 24;
      uint64_t v10 = 21;
    }
    else
    {
      OUTLINED_FUNCTION_1_16();
      if (OUTLINED_FUNCTION_0_12(v13, MEMORY[0x1E4FBB1A0], v14, v15))
      {
        swift_bridgeObjectRelease();
        uint64_t v10 = 1;
        char v9 = 1;
      }
      else
      {
        OUTLINED_FUNCTION_1_16();
        if (OUTLINED_FUNCTION_0_12(v16, MEMORY[0x1E4FBB1A0], v17, v18))
        {
          swift_bridgeObjectRelease();
          uint64_t v10 = 2;
          char v9 = 2;
        }
        else
        {
          OUTLINED_FUNCTION_1_16();
          if (OUTLINED_FUNCTION_0_12(v19, MEMORY[0x1E4FBB1A0], v20, v21))
          {
            swift_bridgeObjectRelease();
            uint64_t v10 = 3;
            char v9 = 3;
          }
          else
          {
            uint64_t v22 = sub_1B389C310();
            char v26 = OUTLINED_FUNCTION_0_12(v22, MEMORY[0x1E4FBB1A0], v24, v25, v3, v5, v22, v23);
            swift_bridgeObjectRelease();
            if (v26)
            {
              swift_bridgeObjectRelease();
              char v9 = 26;
              uint64_t v10 = 23;
            }
            else
            {
              OUTLINED_FUNCTION_1_16();
              if (OUTLINED_FUNCTION_0_12(v27, MEMORY[0x1E4FBB1A0], v28, v29))
              {
                swift_bridgeObjectRelease();
                uint64_t v10 = 4;
                char v9 = 4;
              }
              else
              {
                OUTLINED_FUNCTION_1_16();
                if (OUTLINED_FUNCTION_0_12(v30, MEMORY[0x1E4FBB1A0], v31, v32))
                {
                  swift_bridgeObjectRelease();
                  uint64_t v10 = 5;
                  char v9 = 5;
                }
                else
                {
                  OUTLINED_FUNCTION_1_16();
                  if (OUTLINED_FUNCTION_0_12(v33, MEMORY[0x1E4FBB1A0], v34, v35))
                  {
                    swift_bridgeObjectRelease();
                    uint64_t v10 = 6;
                    char v9 = 6;
                  }
                  else
                  {
                    OUTLINED_FUNCTION_1_16();
                    if (OUTLINED_FUNCTION_0_12(v36, MEMORY[0x1E4FBB1A0], v37, v38))
                    {
                      swift_bridgeObjectRelease();
                      uint64_t v10 = 8;
                      char v9 = 8;
                    }
                    else
                    {
                      OUTLINED_FUNCTION_1_16();
                      if (OUTLINED_FUNCTION_0_12(v39, MEMORY[0x1E4FBB1A0], v40, v41))
                      {
                        swift_bridgeObjectRelease();
                        uint64_t v10 = 9;
                        char v9 = 9;
                      }
                      else
                      {
                        OUTLINED_FUNCTION_1_16();
                        if (OUTLINED_FUNCTION_0_12(v42, MEMORY[0x1E4FBB1A0], v43, v44))
                        {
                          swift_bridgeObjectRelease();
                          uint64_t v10 = 10;
                          char v9 = 10;
                        }
                        else
                        {
                          OUTLINED_FUNCTION_1_16();
                          if (OUTLINED_FUNCTION_0_12(v45, MEMORY[0x1E4FBB1A0], v46, v47))
                          {
                            swift_bridgeObjectRelease();
                            uint64_t v10 = 12;
                            char v9 = 12;
                          }
                          else
                          {
                            OUTLINED_FUNCTION_3_9();
                            if (OUTLINED_FUNCTION_0_12(v48, MEMORY[0x1E4FBB1A0], v49, v50))
                            {
                              swift_bridgeObjectRelease();
                              uint64_t v10 = 13;
                              char v9 = 13;
                            }
                            else
                            {
                              OUTLINED_FUNCTION_1_16();
                              if (OUTLINED_FUNCTION_0_12(v51, MEMORY[0x1E4FBB1A0], v52, v53))
                              {
                                swift_bridgeObjectRelease();
                                char v9 = 15;
                                uint64_t v10 = 14;
                              }
                              else
                              {
                                OUTLINED_FUNCTION_1_16();
                                if (OUTLINED_FUNCTION_0_12(v54, MEMORY[0x1E4FBB1A0], v55, v56))
                                {
                                  swift_bridgeObjectRelease();
                                  char v9 = 14;
                                  uint64_t v10 = 15;
                                }
                                else
                                {
                                  OUTLINED_FUNCTION_1_16();
                                  if (OUTLINED_FUNCTION_0_12(v57, MEMORY[0x1E4FBB1A0], v58, v59))
                                  {
                                    swift_bridgeObjectRelease();
                                    char v9 = 20;
                                    uint64_t v10 = 18;
                                  }
                                  else
                                  {
                                    OUTLINED_FUNCTION_1_16();
                                    if (OUTLINED_FUNCTION_0_12(v60, MEMORY[0x1E4FBB1A0], v61, v62))
                                    {
                                      swift_bridgeObjectRelease();
                                      char v9 = 21;
                                      uint64_t v10 = 17;
                                    }
                                    else
                                    {
                                      OUTLINED_FUNCTION_4_11();
                                      if (OUTLINED_FUNCTION_0_12(v63, MEMORY[0x1E4FBB1A0], v64, v65))
                                      {
                                        swift_bridgeObjectRelease();
                                        char v9 = 27;
                                        uint64_t v10 = 24;
                                      }
                                      else
                                      {
                                        OUTLINED_FUNCTION_4_11();
                                        if (OUTLINED_FUNCTION_0_12(v66, MEMORY[0x1E4FBB1A0], v67, v68))
                                        {
                                          swift_bridgeObjectRelease();
                                          char v9 = 28;
                                          uint64_t v10 = 25;
                                        }
                                        else
                                        {
                                          OUTLINED_FUNCTION_3_9();
                                          uint64_t v72 = OUTLINED_FUNCTION_0_12(v69, MEMORY[0x1E4FBB1A0], v70, v71);
                                          if (v72)
                                          {
                                            swift_bridgeObjectRelease();
                                            char v9 = 29;
                                            uint64_t v10 = 26;
                                          }
                                          else
                                          {
                                            uint64_t v92 = v3;
                                            unint64_t v93 = v5;
                                            uint64_t v79 = OUTLINED_FUNCTION_2_10(v72, MEMORY[0x1E4FBB1A0], v73, v74, v75, v76, v77, v78, 0x64636573726170);
                                            if (v79)
                                            {
                                              swift_bridgeObjectRelease();
                                              uint64_t v10 = 7;
                                              char v9 = 7;
                                            }
                                            else
                                            {
                                              uint64_t v92 = v3;
                                              unint64_t v93 = v5;
                                              if (OUTLINED_FUNCTION_2_10(v79, MEMORY[0x1E4FBB1A0], v80, v81, v82, v83, v84, v85, 0x6B73757361676570))
                                              {
                                                swift_bridgeObjectRelease();
                                                char v9 = 19;
                                                uint64_t v10 = 16;
                                              }
                                              else
                                              {
                                                if (qword_1EB7FAAD8 != -1) {
                                                  swift_once();
                                                }
                                                uint64_t v86 = sub_1B389C1B0();
                                                __swift_project_value_buffer(v86, (uint64_t)qword_1EB7FC100);
                                                swift_bridgeObjectRetain();
                                                v87 = sub_1B389C190();
                                                os_log_type_t v88 = sub_1B389C5B0();
                                                if (os_log_type_enabled(v87, v88))
                                                {
                                                  v89 = (uint8_t *)swift_slowAlloc();
                                                  uint64_t v90 = swift_slowAlloc();
                                                  uint64_t v92 = v90;
                                                  *(_DWORD *)v89 = 136315138;
                                                  swift_bridgeObjectRetain();
                                                  sub_1B3855F24(v3, v5, &v92);
                                                  sub_1B389C6C0();
                                                  swift_bridgeObjectRelease_n();
                                                  _os_log_impl(&dword_1B3850000, v87, v88, "Failed to get client type for %s", v89, 0xCu);
                                                  swift_arrayDestroy();
                                                  MEMORY[0x1B3EBAF20](v90, -1, -1);
                                                  MEMORY[0x1B3EBAF20](v89, -1, -1);
                                                }
                                                else
                                                {

                                                  swift_bridgeObjectRelease_n();
                                                }
                                                uint64_t v10 = 0;
                                                char v9 = 0;
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    LOBYTE(v92) = v9;
    uint64_t v11 = PegasusClientName.rawValue.getter();
    uint64_t result = v91;
  }
  else
  {
    if (qword_1EB7FB6C8 != -1) {
      swift_once();
    }
    uint64_t v11 = qword_1EB7FBDA0;
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v10 = 0;
  }
  *a2 = v10;
  a2[1] = v11;
  a2[2] = result;
  return result;
}

uint64_t sub_1B385D518@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, _OWORD *a3@<X2>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = *a2;
  *(_OWORD *)a4 = *a3;
  *(void *)(a4 + 16) = v7;

  return swift_bridgeObjectRetain();
}

uint64_t static Client.parsecd.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1B385D518(&qword_1EB7FA9A0, &qword_1EB7FA990, &xmmword_1EB7FA980, a1);
}

uint64_t Client.name.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t getEnumTagSinglePayload for FeedbackStreamDescriptor(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF0)
  {
    if (a2 + 16 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 16) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 17;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x11;
  int v5 = v6 - 17;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

ValueMetadata *type metadata accessor for FeedbackStreamDescriptor()
{
  return &type metadata for FeedbackStreamDescriptor;
}

uint64_t type metadata accessor for URLSessionDataSource()
{
  return self;
}

ValueMetadata *type metadata accessor for FeedbackStoreConfig()
{
  return &type metadata for FeedbackStoreConfig;
}

ValueMetadata *type metadata accessor for BiomeStreamConfig()
{
  return &type metadata for BiomeStreamConfig;
}

id BiomeStreamConfig.storeConfig.getter()
{
  return *(id *)(v0 + 32);
}

uint64_t sub_1B385D6BC()
{
  uint64_t v0 = sub_1B389C1B0();
  __swift_allocate_value_buffer(v0, qword_1EB7FC028);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EB7FC028);
  return sub_1B389C1A0();
}

uint64_t sub_1B385D740(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  if ((v1 + 1) >= 2) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t sub_1B385D760(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 1) >= 0x10) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

void SessionType.biomeStreamDescriptor.getter(char *a1@<X8>)
{
  char v3 = 2;
  switch(*(void *)(v1 + 8))
  {
    case 1:
      if (qword_1E9CCEB48 != -1) {
        swift_once();
      }
      OUTLINED_FUNCTION_1_17();
      if (v4) {
        char v3 = 17;
      }
      else {
        char v3 = 1;
      }
      break;
    case 2:
      break;
    case 3:
      if (qword_1E9CCEB48 != -1) {
        swift_once();
      }
      OUTLINED_FUNCTION_1_17();
      char v5 = 3;
      goto LABEL_47;
    case 4:
      if (qword_1E9CCEB48 != -1) {
        swift_once();
      }
      OUTLINED_FUNCTION_1_17();
      char v5 = 4;
      goto LABEL_47;
    case 5:
      if (qword_1E9CCEB48 != -1) {
        swift_once();
      }
      OUTLINED_FUNCTION_1_17();
      char v5 = 5;
      goto LABEL_47;
    case 6:
      if (qword_1E9CCEB48 != -1) {
        swift_once();
      }
      OUTLINED_FUNCTION_1_17();
      char v5 = 6;
      goto LABEL_47;
    case 7:
      if (qword_1E9CCEB48 != -1) {
        swift_once();
      }
      OUTLINED_FUNCTION_1_17();
      char v5 = 7;
      goto LABEL_47;
    case 8:
      if (qword_1E9CCEB48 != -1) {
        swift_once();
      }
      OUTLINED_FUNCTION_1_17();
      char v5 = 8;
      goto LABEL_47;
    case 9:
      if (qword_1E9CCEB48 != -1) {
        swift_once();
      }
      OUTLINED_FUNCTION_1_17();
      char v5 = 9;
      goto LABEL_47;
    case 0xALL:
      if (qword_1E9CCEB48 != -1) {
        swift_once();
      }
      OUTLINED_FUNCTION_1_17();
      char v5 = 10;
      goto LABEL_47;
    case 0xBLL:
      if (qword_1E9CCEB48 != -1) {
        swift_once();
      }
      OUTLINED_FUNCTION_1_17();
      char v5 = 11;
      goto LABEL_47;
    case 0xCLL:
      if (qword_1E9CCEB48 != -1) {
        swift_once();
      }
      OUTLINED_FUNCTION_1_17();
      char v5 = 12;
      goto LABEL_47;
    case 0xDLL:
      if (qword_1E9CCEB48 != -1) {
        swift_once();
      }
      OUTLINED_FUNCTION_1_17();
      char v5 = 13;
      goto LABEL_47;
    case 0xELL:
      if (qword_1E9CCEB48 != -1) {
        swift_once();
      }
      OUTLINED_FUNCTION_1_17();
      char v5 = 14;
      goto LABEL_47;
    case 0xFLL:
      if (qword_1E9CCEB48 != -1) {
        swift_once();
      }
      OUTLINED_FUNCTION_1_17();
      char v5 = 15;
LABEL_47:
      if (v4) {
        char v3 = 17;
      }
      else {
        char v3 = v5;
      }
      break;
    case 0x10:
      if (qword_1E9CCEB48 != -1) {
        swift_once();
      }
      OUTLINED_FUNCTION_1_17();
      if (v4) {
        char v3 = 17;
      }
      else {
        char v3 = 16;
      }
      break;
    default:
      char v3 = 17;
      break;
  }
  *a1 = v3;
}

unint64_t SessionType.description.getter()
{
  uint64_t v2 = *v0;
  uint64_t v1 = v0[1];
  if ((unint64_t)(v1 - 1) >= 0x10)
  {
    if (v1) {
      swift_bridgeObjectRetain();
    }
    else {
      OUTLINED_FUNCTION_16_2();
    }
  }
  else
  {
    sub_1B385D760(v2, v1);
    SessionType.biomeStreamDescriptor.getter(&v5);
    if (v5 == 17)
    {
      sub_1B3859F9C(v2, v1);
      OUTLINED_FUNCTION_16_2();
    }
    else
    {
      unint64_t v3 = FeedbackStreamDescriptor.rawValue.getter();
      sub_1B3859F9C(v2, v1);
      return v3;
    }
  }
  return v2;
}

uint64_t SessionType.clientType.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  if ((unint64_t)(v1 - 1) < 0x10) {
    return qword_1B38A1050[v1 - 1];
  }
  swift_bridgeObjectRetain();
  Client.init(_:)(v1, &v4);
  uint64_t v2 = v4;
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t static ConfigurationContext.buildVersion.getter()
{
  uint64_t v0 = sub_1B3854524(0);
  return OUTLINED_FUNCTION_1_1(v0, v1);
}

uint64_t static ConfigurationContext.deviceModel.getter()
{
  uint64_t v0 = sub_1B3854524(2);
  return OUTLINED_FUNCTION_1_1(v0, v1);
}

uint64_t static PegasusConfigContainerURLProvider.configFileName.getter()
{
  if (qword_1EB7FAAB0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_1EB7FC118;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_1B385DD90()
{
  OUTLINED_FUNCTION_2_0();
  unint64_t v3 = v2;
  *(void *)(v1 + 208) = v2;
  *(void *)(v1 + 216) = v0;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA880);
  OUTLINED_FUNCTION_24(v4);
  *(void *)(v1 + 224) = swift_task_alloc();
  long long v5 = v3[1];
  *(_OWORD *)(v1 + 16) = *v3;
  *(_OWORD *)(v1 + 32) = v5;
  long long v6 = v3[3];
  *(_OWORD *)(v1 + 48) = v3[2];
  *(_OWORD *)(v1 + 64) = v6;
  OUTLINED_FUNCTION_9();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

uint64_t sub_1B385DE2C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1B385DE74(void *a1, unsigned int a2)
{
  int v2 = (a2 >> 7) & 3;
  if (!v2) {
    return 7;
  }
  if (v2 != 1) {
    return qword_1B389DB50[(void)a1];
  }
  char v4 = (a2 & 0x100) != 0;
  sub_1B386CBA0(a1, a2, v4);
  id v5 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FAB08);
  int v6 = OUTLINED_FUNCTION_69();
  if (v6) {
    uint64_t v7 = v14;
  }
  else {
    uint64_t v7 = 6;
  }
  if (v6) {
    unsigned int v8 = v15;
  }
  else {
    unsigned int v8 = 0;
  }
  char v9 = v16 | ~(_BYTE)v6;
  uint64_t v10 = sub_1B385DE74(v7, v8 | ((v16 & 1 | ((v6 & 1) == 0)) << 8));
  sub_1B386CB80((id)v7, v8, v9 & 1);
  uint64_t v11 = (void *)OUTLINED_FUNCTION_36();
  sub_1B386CB80(v11, v12, v4);
  return v10;
}

uint64_t sub_1B385DF70(void *a1, unsigned int a2)
{
  int v3 = (a2 >> 7) & 3;
  if (v3)
  {
    if (v3 == 1)
    {
      char v5 = (a2 & 0x100) != 0;
      sub_1B386CBA0(a1, a2, v5);
      id v6 = a1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FAB08);
      int v7 = swift_dynamicCast();
      if (v7) {
        uint64_t v8 = v13;
      }
      else {
        uint64_t v8 = 6;
      }
      if (v7) {
        unsigned int v9 = v14;
      }
      else {
        unsigned int v9 = 0;
      }
      char v10 = v15 | ~(_BYTE)v7;
      uint64_t v11 = sub_1B385DF70(v8, v9 | ((v15 & 1 | ((v7 & 1) == 0)) << 8));
      sub_1B386CB80((id)v8, v9, v10 & 1);
      sub_1B386CB80(a1, a2, v5);
    }
    else
    {
      uint64_t v11 = 0xD000000000000014;
      switch((unint64_t)a1)
      {
        case 1uLL:
          uint64_t v11 = 0x20747865746E6F43;
          break;
        case 2uLL:
        case 3uLL:
          return v11;
        case 4uLL:
        case 7uLL:
          uint64_t v11 = 0x2064696C61766E69;
          break;
        case 5uLL:
          uint64_t v11 = 0xD00000000000001CLL;
          break;
        case 6uLL:
          uint64_t v11 = 0x726520726568744FLL;
          break;
        default:
          uint64_t v11 = 0x65524C5255206F4ELL;
          break;
      }
    }
  }
  else
  {
    sub_1B389C8F0();
    sub_1B389C3C0();
    swift_bridgeObjectRelease();
    return 0x6F43737574617473;
  }
  return v11;
}

unint64_t sub_1B385E1D8(char a1, unsigned int a2)
{
  int v2 = (a2 >> 7) & 3;
  if (!v2) {
    return 19;
  }
  if (v2 == 1) {
    return a2 & 0x7F;
  }
  return 0x211815201F1E1D19uLL >> (8 * a1);
}

id sub_1B385E21C(void *a1, unsigned int a2)
{
  int v3 = a2 & 0x100;
  if (((a2 >> 7) & 3) == 1)
  {
    char v4 = (void *)OUTLINED_FUNCTION_36();
    sub_1B386CBA0(v4, v5, v6);
    id v7 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FAB08);
    char v8 = v3 != 0;
    if (OUTLINED_FUNCTION_69())
    {
      uint64_t v9 = sub_1B385E21C(v23, v24 | (v25 << 8));
      sub_1B386CB80(v23, v24, v25);
    }
    else
    {
      uint64_t v9 = sub_1B389BBF0();
    }
    uint64_t v20 = (void *)OUTLINED_FUNCTION_36();
    sub_1B386CB80(v20, v21, v8);
  }
  else
  {
    char v10 = (void *)OUTLINED_FUNCTION_36();
    uint64_t v12 = sub_1B385DE74(v10, v11);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CCEB60);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1B389D500;
    *(void *)(inited + 32) = 0x6E6F73616572;
    *(void *)(inited + 40) = 0xE600000000000000;
    unsigned __int8 v14 = (void *)OUTLINED_FUNCTION_36();
    uint64_t v16 = sub_1B385DF70(v14, v15);
    *(void *)(inited + 72) = MEMORY[0x1E4FBB1A0];
    *(void *)(inited + 48) = v16;
    *(void *)(inited + 56) = v17;
    uint64_t v18 = sub_1B389C230();
    id v19 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    return sub_1B3875B14(0xD000000000000018, 0x80000001B38A1E10, v12, v18);
  }
  return (id)v9;
}

BOOL static ShouldThrottleConfigFetchResultReason.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ShouldThrottleConfigFetchResultReason.hash(into:)()
{
  return sub_1B389CA20();
}

uint64_t ShouldThrottleConfigFetchResultReason.hashValue.getter()
{
  return sub_1B389CA40();
}

uint64_t sub_1B385E470()
{
  return sub_1B389CA40();
}

BOOL static ShouldThrottleConfigFetchResult.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2 = *a1;
  int v3 = *a2;
  if (v2 == 3) {
    return v3 == 3;
  }
  if (v3 == 3) {
    return 0;
  }
  return v2 == v3;
}

uint64_t LocalCachePaths.standard.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1B385A0AC(v1, a1, (uint64_t *)&unk_1EB7FBF88);
}

uint64_t LocalCachePaths.legacy.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for LocalCachePaths(0);
  return sub_1B385A0AC(v1 + *(int *)(v3 + 20), a1, (uint64_t *)&unk_1EB7FBF88);
}

uint64_t type metadata accessor for LocalCachePaths(uint64_t a1)
{
  return sub_1B385ADE0(a1, qword_1EB7FA6E8);
}

uint64_t LocalCachePaths.init(standard:legacy:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_1B385B178(a1, a3, (uint64_t *)&unk_1EB7FBF88);
  uint64_t v5 = type metadata accessor for LocalCachePaths(0);
  return sub_1B385B178(a2, a3 + *(int *)(v5 + 20), (uint64_t *)&unk_1EB7FBF88);
}

void static LocalCachePaths.== infix(_:_:)()
{
  OUTLINED_FUNCTION_48();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = sub_1B389BD00();
  OUTLINED_FUNCTION_1();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_29();
  uint64_t v52 = v10 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCEC80);
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_25();
  uint64_t v57 = v13;
  OUTLINED_FUNCTION_51();
  MEMORY[0x1F4188790](v14);
  uint64_t v16 = (char *)&v50 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
  uint64_t v18 = OUTLINED_FUNCTION_24(v17);
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_25();
  uint64_t v51 = v19;
  OUTLINED_FUNCTION_51();
  MEMORY[0x1F4188790](v20);
  uint64_t v53 = (uint64_t)&v50 - v21;
  OUTLINED_FUNCTION_51();
  MEMORY[0x1F4188790](v22);
  uint64_t v56 = (uint64_t)&v50 - v23;
  OUTLINED_FUNCTION_51();
  MEMORY[0x1F4188790](v24);
  OUTLINED_FUNCTION_91();
  uint64_t v26 = MEMORY[0x1F4188790](v25);
  uint64_t v28 = (char *)&v50 - v27;
  MEMORY[0x1F4188790](v26);
  uint64_t v30 = (char *)&v50 - v29;
  uint64_t v54 = v4;
  sub_1B385A0AC(v4, (uint64_t)&v50 - v29, (uint64_t *)&unk_1EB7FBF88);
  uint64_t v55 = v2;
  sub_1B385A0AC(v2, (uint64_t)v28, (uint64_t *)&unk_1EB7FBF88);
  uint64_t v31 = (uint64_t)&v16[*(int *)(v11 + 48)];
  sub_1B385A0AC((uint64_t)v30, (uint64_t)v16, (uint64_t *)&unk_1EB7FBF88);
  sub_1B385A0AC((uint64_t)v28, v31, (uint64_t *)&unk_1EB7FBF88);
  OUTLINED_FUNCTION_15((uint64_t)v16);
  if (!v32)
  {
    sub_1B385A0AC((uint64_t)v16, v0, (uint64_t *)&unk_1EB7FBF88);
    OUTLINED_FUNCTION_15(v31);
    if (!v32)
    {
      uint64_t v34 = OUTLINED_FUNCTION_33();
      v35(v34);
      sub_1B385DE2C((unint64_t *)&unk_1E9CCEC88, MEMORY[0x1E4F276F0]);
      char v36 = sub_1B389C270();
      uint64_t v50 = v7;
      uint64_t v37 = *(void (**)(void))(v7 + 8);
      OUTLINED_FUNCTION_71();
      OUTLINED_FUNCTION_78();
      v37();
      sub_1B386D330((uint64_t)v28, (uint64_t *)&unk_1EB7FBF88);
      sub_1B386D330((uint64_t)v30, (uint64_t *)&unk_1EB7FBF88);
      OUTLINED_FUNCTION_78();
      v37();
      sub_1B386D330((uint64_t)v16, (uint64_t *)&unk_1EB7FBF88);
      if ((v36 & 1) == 0) {
        goto LABEL_21;
      }
      goto LABEL_11;
    }
    sub_1B386D330((uint64_t)v28, (uint64_t *)&unk_1EB7FBF88);
    sub_1B386D330((uint64_t)v30, (uint64_t *)&unk_1EB7FBF88);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0, v5);
LABEL_9:
    uint64_t v33 = (uint64_t)v16;
LABEL_20:
    sub_1B386D330(v33, &qword_1E9CCEC80);
    goto LABEL_21;
  }
  sub_1B386D330((uint64_t)v28, (uint64_t *)&unk_1EB7FBF88);
  sub_1B386D330((uint64_t)v30, (uint64_t *)&unk_1EB7FBF88);
  OUTLINED_FUNCTION_15(v31);
  if (!v32) {
    goto LABEL_9;
  }
  uint64_t v50 = v7;
  sub_1B386D330((uint64_t)v16, (uint64_t *)&unk_1EB7FBF88);
LABEL_11:
  uint64_t v38 = type metadata accessor for LocalCachePaths(0);
  uint64_t v39 = v56;
  sub_1B385A0AC(v54 + *(int *)(v38 + 20), v56, (uint64_t *)&unk_1EB7FBF88);
  uint64_t v40 = v53;
  sub_1B385A0AC(v55 + *(int *)(v38 + 20), v53, (uint64_t *)&unk_1EB7FBF88);
  uint64_t v41 = v57;
  uint64_t v42 = v57 + *(int *)(v11 + 48);
  sub_1B385A0AC(v39, v57, (uint64_t *)&unk_1EB7FBF88);
  sub_1B385A0AC(v40, v42, (uint64_t *)&unk_1EB7FBF88);
  OUTLINED_FUNCTION_15(v41);
  if (!v32)
  {
    uint64_t v43 = v51;
    sub_1B385A0AC(v41, v51, (uint64_t *)&unk_1EB7FBF88);
    OUTLINED_FUNCTION_15(v42);
    if (!v44)
    {
      uint64_t v45 = v50;
      uint64_t v46 = OUTLINED_FUNCTION_33();
      v47(v46);
      sub_1B385DE2C((unint64_t *)&unk_1E9CCEC88, MEMORY[0x1E4F276F0]);
      sub_1B389C270();
      uint64_t v48 = *(void (**)(uint64_t))(v45 + 8);
      uint64_t v49 = OUTLINED_FUNCTION_71();
      v48(v49);
      sub_1B386D330(v40, (uint64_t *)&unk_1EB7FBF88);
      sub_1B386D330(v39, (uint64_t *)&unk_1EB7FBF88);
      ((void (*)(uint64_t, uint64_t))v48)(v43, v5);
      sub_1B386D330(v41, (uint64_t *)&unk_1EB7FBF88);
      goto LABEL_21;
    }
    sub_1B386D330(v40, (uint64_t *)&unk_1EB7FBF88);
    sub_1B386D330(v39, (uint64_t *)&unk_1EB7FBF88);
    (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v43, v5);
    goto LABEL_19;
  }
  sub_1B386D330(v40, (uint64_t *)&unk_1EB7FBF88);
  sub_1B386D330(v39, (uint64_t *)&unk_1EB7FBF88);
  OUTLINED_FUNCTION_15(v42);
  if (!v32)
  {
LABEL_19:
    uint64_t v33 = v41;
    goto LABEL_20;
  }
  sub_1B386D330(v41, (uint64_t *)&unk_1EB7FBF88);
LABEL_21:
  OUTLINED_FUNCTION_45();
}

void sub_1B385EB1C()
{
}

void sub_1B385EB40()
{
  qword_1EB7FC0D0 = 0x40CC200000000000;
}

void sub_1B385EB54()
{
  qword_1EB7FC0C8 = 0x4082C00000000000;
}

uint64_t sub_1B385EB68()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = OUTLINED_FUNCTION_36();
    sub_1B385F1D4(v1, v2);
    return swift_release();
  }
  return result;
}

uint64_t sub_1B385EBD8()
{
  if (!MEMORY[0x1B3EBAFF0](v0 + 224)
    || (uint64_t v1 = *(void *)(v0 + 232),
        uint64_t ObjectType = swift_getObjectType(),
        LOBYTE(v1) = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(ObjectType, v1),
        uint64_t result = swift_unknownObjectRelease(),
        (v1 & 1) != 0))
  {
    uint64_t v4 = OUTLINED_FUNCTION_74();
    swift_weakInit();
    swift_retain();
    sub_1B386494C((uint64_t)&unk_1E9CCEDB8, v4);
    return swift_release_n();
  }
  return result;
}

uint64_t sub_1B385EC90(uint64_t a1)
{
  *(void *)(v1 + 40) = a1;
  return MEMORY[0x1F4188298](sub_1B385ECB0, 0, 0);
}

uint64_t sub_1B385ECB0()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_7();
  if (swift_weakLoadStrong())
  {
    uint64_t v0 = sub_1B385ED54();
    uint64_t v2 = v1;
    swift_release();
  }
  else
  {
    uint64_t v0 = 0;
    uint64_t v2 = 0;
  }
  OUTLINED_FUNCTION_28();
  return v3(v0, v2);
}

#error "1B385EFE8: call analysis failed (funcsize=270)"

uint64_t sub_1B385F1D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA880);
  uint64_t v8 = OUTLINED_FUNCTION_24(v7);
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_29();
  uint64_t v11 = v10 - v9;
  if (qword_1EB7FA3A8 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1B389C1B0();
  uint64_t v13 = OUTLINED_FUNCTION_40(v12, (uint64_t)qword_1EB7FA460);
  os_log_type_t v14 = sub_1B389C5A0();
  if (OUTLINED_FUNCTION_57(v14))
  {
    uint64_t v15 = (uint8_t *)OUTLINED_FUNCTION_12();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_1B3850000, v13, v3, "Configuration changed", v15, 2u);
    OUTLINED_FUNCTION_5();
  }

  if (MEMORY[0x1B3EBAFF0](v4 + 224))
  {
    uint64_t v16 = *(void *)(v4 + 232);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 8))(a1, a2, ObjectType, v16);
    return swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v19 = sub_1B389C4F0();
    OUTLINED_FUNCTION_80(v19);
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = 0;
    *(void *)(v20 + 24) = 0;
    sub_1B3874680(v11, (uint64_t)&unk_1E9CCEDA8, v20);
    return swift_release();
  }
}

uint64_t sub_1B385F394()
{
  return MEMORY[0x1F4188298](sub_1B385F3B0, 0, 0);
}

uint64_t sub_1B385F3B0()
{
  OUTLINED_FUNCTION_2_0();
  id v0 = objc_msgSend(self, sel_defaultCenter);
  if (qword_1E9CCEBA8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  objc_msgSend(v0, sel_postNotificationName_object_userInfo_, qword_1E9CCF000, 0, 0);

  OUTLINED_FUNCTION_6();
  return v1();
}

uint64_t sub_1B385F490(uint64_t a1)
{
  return OUTLINED_FUNCTION_17_0((uint64_t)sub_1B385F4B0);
}

uint64_t sub_1B385F4B0()
{
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_89();
  uint64_t v1 = (_OWORD *)swift_allocObject();
  swift_retain();
  uint64_t v2 = swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_50(v2, v3, v4);
  OUTLINED_FUNCTION_34(v5, v6, v7, v8, v9, v10, v11, v12, v13);
  os_log_type_t v14 = (void *)swift_task_alloc();
  *(void *)(v0 + 224) = v14;
  *os_log_type_t v14 = v0;
  v14[1] = sub_1B385F5A4;
  return sub_1B385F964(v1, 2, 0, 2, 0);
}

uint64_t sub_1B385F5A4()
{
  OUTLINED_FUNCTION_13();
  char v3 = v2;
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_4();
  *uint64_t v6 = v5;
  OUTLINED_FUNCTION_65(v7, v8);
  uint64_t v9 = *v1;
  OUTLINED_FUNCTION_3();
  *uint64_t v10 = v9;
  *(void *)(v5 + 232) = v0;
  swift_task_dealloc();
  if (!v0) {
    *(unsigned char *)(v5 + 123) = v3;
  }
  OUTLINED_FUNCTION_9();
  return MEMORY[0x1F4188298](v11, v12, v13);
}

uint64_t sub_1B385F690()
{
  uint64_t v1 = *(void **)(v0 + 232);
  *(void *)(v0 + 128) = v1;
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FAB08);
  if (swift_dynamicCast())
  {

    char v3 = *(void **)(v0 + 112);
    unsigned int v4 = *(unsigned __int8 *)(v0 + 120);
    int v5 = *(unsigned __int8 *)(v0 + 121);
    char v6 = sub_1B385E1D8((char)v3, v4 | (v5 << 8));
    if (v6 == 1) {
      *(unsigned char *)(*(void *)(v0 + 216) + qword_1EB7FA728) = 1;
    }
    *(unsigned char *)(*(void *)(v0 + 216) + qword_1EB7FA730) = v6;
    sub_1B385E21C(v3, v4 | (v5 << 8));
    swift_willThrow();
    sub_1B386CB80(v3, v4, v5);

    sub_1B3856894();
    swift_release();
  }
  else
  {
    uint64_t v7 = *(void *)(v0 + 216);

    *(unsigned char *)(v7 + qword_1EB7FA730) = 24;
    if (qword_1EB7FA3A8 != -1) {
      swift_once();
    }
    uint64_t v8 = *(void **)(v0 + 232);
    uint64_t v9 = sub_1B389C1B0();
    __swift_project_value_buffer(v9, (uint64_t)qword_1EB7FA460);
    id v10 = v8;
    id v11 = v8;
    uint64_t v12 = (void *)sub_1B389C190();
    os_log_type_t v13 = sub_1B389C590();
    BOOL v14 = OUTLINED_FUNCTION_43(v13);
    uint64_t v15 = *(void **)(v0 + 232);
    if (v14)
    {
      uint64_t v16 = (_DWORD *)OUTLINED_FUNCTION_59();
      uint64_t v17 = (void *)swift_slowAlloc();
      *uint64_t v16 = 138412290;
      id v18 = v15;
      uint64_t v19 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v0 + 136) = v19;
      sub_1B389C6C0();
      *uint64_t v17 = v19;

      OUTLINED_FUNCTION_81(&dword_1B3850000, v20, v21, "Unexpected error type. Error: %@");
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CCED90);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
    }
    else
    {
    }
    swift_willThrow();
    sub_1B3856894();
    swift_release();
  }
  sub_1B3856B4C();
  OUTLINED_FUNCTION_67();
  return v22();
}

uint64_t sub_1B385F964(_OWORD *a1, uint64_t a2, uint64_t a3, char a4, char a5)
{
  *(void *)(v6 + 104) = a3;
  *(void *)(v6 + 112) = v5;
  *(unsigned char *)(v6 + 193) = a5;
  *(unsigned char *)(v6 + 192) = a4;
  *(void *)(v6 + 96) = a2;
  long long v7 = a1[1];
  *(_OWORD *)(v6 + 16) = *a1;
  *(_OWORD *)(v6 + 32) = v7;
  long long v8 = a1[3];
  *(_OWORD *)(v6 + 48) = a1[2];
  *(_OWORD *)(v6 + 64) = v8;
  return MEMORY[0x1F4188298](sub_1B385F9A0, 0, 0);
}

uint64_t sub_1B385F9A0()
{
  OUTLINED_FUNCTION_13();
  v0[15] = *(void *)(v0[14] + 200);
  if (sub_1B387C858())
  {
    if (qword_1EB7FA3A8 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_1B389C1B0();
    id v2 = (void *)OUTLINED_FUNCTION_40(v1, (uint64_t)qword_1EB7FA460);
    os_log_type_t v3 = sub_1B389C5B0();
    if (OUTLINED_FUNCTION_41(v3))
    {
      unsigned int v4 = (_WORD *)OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_42(v4);
      OUTLINED_FUNCTION_22(&dword_1B3850000, v5, v6, "Early exiting task with timeoutWaitingOnConnection error");
      OUTLINED_FUNCTION_5();
    }

    sub_1B386CE04();
    uint64_t v7 = OUTLINED_FUNCTION_18();
    sub_1B386C3F8();
    OUTLINED_FUNCTION_18();
    *long long v8 = v7;
    OUTLINED_FUNCTION_31((uint64_t)v8, 129);
    OUTLINED_FUNCTION_67();
    return v9();
  }
  else
  {
    v0[16] = *(void *)(v0[14] + 208);
    id v11 = (void *)swift_task_alloc();
    v0[17] = v11;
    *id v11 = v0;
    v11[1] = sub_1B385FB38;
    return sub_1B3864710();
  }
}

uint64_t sub_1B385FB38()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_9();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1B385FC00()
{
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 104);
  char v3 = *(unsigned char *)(v0 + 193);
  uint64_t v4 = *(void *)(v0 + 96);
  unsigned __int8 v5 = *(unsigned char *)(v0 + 192);
  uint64_t v6 = OUTLINED_FUNCTION_74();
  *(void *)(v0 + 144) = v6;
  swift_weakInit();
  uint64_t v7 = swift_allocObject();
  *(void *)(v0 + 152) = v7;
  *(void *)(v7 + 16) = v6;
  *(unsigned char *)(v7 + 24) = v3;
  long long v8 = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v7 + 32) = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v7 + 48) = v8;
  long long v9 = *(_OWORD *)(v0 + 64);
  *(_OWORD *)(v7 + 64) = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v7 + 80) = v9;
  *(void *)(v7 + 96) = v4;
  *(void *)(v7 + 104) = v2;
  *(unsigned char *)(v7 + 112) = v5;
  swift_retain();
  sub_1B386CDB8(v0 + 16);
  uint64_t v10 = OUTLINED_FUNCTION_66();
  sub_1B386C810(v10, v11, v5);
  return MEMORY[0x1F4188298](sub_1B385FD04, v1, 0);
}

uint64_t sub_1B385FD04()
{
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = sub_1B3863F50((uint64_t)&unk_1E9CCEDE0, *(void *)(v0 + 152));
  char v3 = v2;
  char v4 = v2 & 1;
  swift_release();
  swift_release();
  *(void *)(v0 + 160) = v1;
  *(unsigned char *)(v0 + 194) = v4;
  if (v3)
  {
    unsigned __int8 v5 = (void *)swift_task_alloc();
    *(void *)(v0 + 168) = v5;
    *unsigned __int8 v5 = v0;
    v5[1] = sub_1B385FE80;
    OUTLINED_FUNCTION_32();
    return sub_1B387C8EC();
  }
  else
  {
    long long v8 = (void *)swift_task_alloc();
    *(void *)(v0 + 176) = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FAB08);
    *long long v8 = v0;
    v8[1] = sub_1B3860124;
    OUTLINED_FUNCTION_32();
    return MEMORY[0x1F4187D90](v9, v10, v11, v12, v13);
  }
}

uint64_t sub_1B385FE80()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  void *v2 = v1;
  void *v2 = *v0;
  *(unsigned char *)(v1 + 195) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_9();
  return MEMORY[0x1F4188298](v4, v5, v6);
}

uint64_t sub_1B385FF50()
{
  OUTLINED_FUNCTION_14();
  if (*(unsigned char *)(v0 + 195))
  {
    uint64_t v1 = (void *)swift_task_alloc();
    *(void *)(v0 + 176) = v1;
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FAB08);
    void *v1 = v0;
    v1[1] = sub_1B3860124;
    uint64_t v3 = *(void *)(v0 + 160);
    uint64_t v4 = MEMORY[0x1E4FBC0F0];
    return MEMORY[0x1F4187D90](v0 + 80, v3, &unk_1F0C11C78, v2, v4);
  }
  else
  {
    if (qword_1EB7FA3A8 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_1B389C1B0();
    uint64_t v6 = (void *)OUTLINED_FUNCTION_40(v5, (uint64_t)qword_1EB7FA460);
    os_log_type_t v7 = sub_1B389C590();
    if (OUTLINED_FUNCTION_41(v7))
    {
      uint64_t v8 = (_WORD *)OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_42(v8);
      OUTLINED_FUNCTION_22(&dword_1B3850000, v9, v10, "Request timeout has passed, exiting additional tasks");
      OUTLINED_FUNCTION_5();
    }

    sub_1B386CE04();
    uint64_t v11 = OUTLINED_FUNCTION_18();
    sub_1B386C3F8();
    OUTLINED_FUNCTION_18();
    *uint64_t v12 = v11;
    OUTLINED_FUNCTION_31((uint64_t)v12, 129);
    swift_release();
    uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
    return v13();
  }
}

uint64_t sub_1B3860124()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3();
  *uint64_t v5 = v4;
  *(void *)(v6 + 184) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_9();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

uint64_t sub_1B3860200()
{
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_28();
  return v0();
}

uint64_t sub_1B3860270()
{
  OUTLINED_FUNCTION_13();
  uint64_t v1 = *(void *)(v0 + 184);
  if (*(unsigned char *)(v0 + 194) == 1)
  {
    sub_1B386C3F8();
    OUTLINED_FUNCTION_18();
    void *v2 = v1;
    OUTLINED_FUNCTION_31((uint64_t)v2, 129);
  }
  else
  {
    swift_willThrow();
  }
  swift_release();
  OUTLINED_FUNCTION_6();
  return v3();
}

uint64_t sub_1B386031C()
{
  OUTLINED_FUNCTION_13();
  uint64_t v3 = v2;
  char v5 = v4;
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  OUTLINED_FUNCTION_4();
  *uint64_t v8 = v7;
  uint64_t v9 = *v1;
  OUTLINED_FUNCTION_3();
  *uint64_t v10 = v9;
  *(void *)(v7 + 264) = v0;
  swift_task_dealloc();
  if (v0)
  {
    sub_1B386C7D4(*(void *)(v7 + 240), *(void *)(v7 + 248), *(unsigned char *)(v7 + 296));
  }
  else
  {
    uint64_t v11 = *(void *)(v7 + 240);
    uint64_t v12 = *(void *)(v7 + 248);
    *(void *)(v7 + 272) = v3;
    *(unsigned char *)(v7 + 297) = v5;
    sub_1B386C7D4(v11, v12, *(unsigned char *)(v7 + 296));
  }
  OUTLINED_FUNCTION_9();
  return MEMORY[0x1F4188298](v13, v14, v15);
}

uint64_t sub_1B3860428()
{
  OUTLINED_FUNCTION_2_0();
  swift_unknownObjectRelease();
  uint64_t v1 = *(void *)(v0 + 272);
  uint64_t v2 = *(unsigned __int8 *)(v0 + 297);
  swift_task_dealloc();
  OUTLINED_FUNCTION_28();
  return v3(v2, v1);
}

uint64_t sub_1B386049C()
{
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_4();
  *char v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_3();
  *uint64_t v6 = v5;
  *(void *)(v3 + 288) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_9();
    OUTLINED_FUNCTION_32();
    return MEMORY[0x1F4188298](v7, v8, v9);
  }
  else
  {
    swift_task_dealloc();
    OUTLINED_FUNCTION_32();
    return v14(v11, v12, v13, v14, v15, v16, v17, v18);
  }
}

uint64_t sub_1B38605C4()
{
  OUTLINED_FUNCTION_2_0();
  swift_task_dealloc();
  OUTLINED_FUNCTION_6();
  return v0();
}

uint64_t sub_1B3860620()
{
  OUTLINED_FUNCTION_2_0();
  swift_unknownObjectRelease();
  swift_task_dealloc();
  OUTLINED_FUNCTION_6();
  return v0();
}

uint64_t sub_1B3860684(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = type metadata accessor for LocalCachePaths(0);
  uint64_t v8 = OUTLINED_FUNCTION_24(v7);
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_29();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = (void *)v3[15];
  uint64_t v13 = v3[2];
  if (MEMORY[0x1B3EBAFF0](v3 + 28))
  {
    uint64_t v14 = v3[29];
    uint64_t ObjectType = swift_getObjectType();
    char v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 16))(ObjectType, v14);
    swift_unknownObjectRelease();
  }
  else
  {
    char v16 = 1;
  }
  sub_1B3860B3C(v11);
  sub_1B38607BC(a1, v12, a2, a3, v13, v16 & 1, v11);
  sub_1B385AD6C(v11, (void (*)(void))type metadata accessor for LocalCachePaths);
  return OUTLINED_FUNCTION_36();
}

size_t sub_1B38607BC(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5, char a6, uint64_t a7)
{
  if (qword_1EB7FA3A8 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_1B389C1B0();
  __swift_project_value_buffer(v13, (uint64_t)qword_1EB7FA460);
  swift_bridgeObjectRetain_n();
  uint64_t v14 = sub_1B389C190();
  os_log_type_t v15 = sub_1B389C590();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v28 = a3;
    char v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = a5;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v31 = v17;
    *(_DWORD *)char v16 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_1B389C220();
    char v27 = a6;
    unint64_t v20 = v19;
    swift_bridgeObjectRelease();
    sub_1B3855F24(v18, v20, &v31);
    sub_1B389C6C0();
    swift_bridgeObjectRelease_n();
    a6 = v27;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B3850000, v14, v15, "saving config: %s", v16, 0xCu);
    swift_arrayDestroy();
    uint64_t v21 = v17;
    a5 = v29;
    MEMORY[0x1B3EBAF20](v21, -1, -1);
    uint64_t v22 = v16;
    a3 = v28;
    MEMORY[0x1B3EBAF20](v22, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  size_t v23 = sub_1B3866DAC(a1, a2, a3, a4, a5, a6 & 1, a7);
  if (v24 >> 60 == 15)
  {
    sub_1B386C3F8();
    swift_allocError();
    *(void *)uint64_t v25 = 4;
    *(_WORD *)(v25 + 8) = 256;
    swift_willThrow();
  }
  return v23;
}

BOOL sub_1B3860A64(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 152);
  char v4 = *(unsigned char *)(v1 + 160);
  uint64_t v5 = *(void *)(v1 + 168);
  uint64_t v6 = *(void *)(v1 + 176);
  uint64_t v7 = *(void *)(v1 + 184);
  uint64_t v8 = *(void *)(v1 + 192);
  long long v16 = *(_OWORD *)(v1 + 136);
  uint64_t v17 = v3;
  char v18 = v4;
  uint64_t v19 = v5;
  uint64_t v20 = v6;
  uint64_t v21 = v7;
  uint64_t v22 = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v9 = sub_1B385A66C(a1, (uint64_t)&v16);
  char v11 = v10;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v11 & 0x80) == 0) {
    return v9 != 1;
  }
  uint64_t v13 = OUTLINED_FUNCTION_36();
  sub_1B386C7D4(v13, v14, v15);
  return 1;
}

uint64_t sub_1B3860B30@<X0>(uint64_t a1@<X8>)
{
  return sub_1B3858A28(v1 + 80, a1);
}

uint64_t sub_1B3860B3C@<X0>(uint64_t a1@<X8>)
{
  if (!MEMORY[0x1B3EBAFF0](v1 + 224)) {
    return sub_1B3860BCC(a1);
  }
  uint64_t v3 = *(void *)(v1 + 232);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v3 + 48))(ObjectType, v3);

  return swift_unknownObjectRelease();
}

uint64_t sub_1B3860BCC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
  uint64_t v3 = OUTLINED_FUNCTION_24(v2);
  uint64_t v4 = MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v20 - v7;
  sub_1B38561AC();
  uint64_t v9 = sub_1B389BD00();
  uint64_t v10 = OUTLINED_FUNCTION_87();
  OUTLINED_FUNCTION_23(v10, v11, v9);
  if (v12)
  {
    sub_1B386D330((uint64_t)v6, (uint64_t *)&unk_1EB7FBF88);
    uint64_t v13 = 1;
  }
  else
  {
    if (qword_1EB7FAAB0 != -1) {
      swift_once();
    }
    sub_1B389BC60();
    OUTLINED_FUNCTION_46();
    v14();
    uint64_t v13 = 0;
  }
  OUTLINED_FUNCTION_55((uint64_t)v8, v13);
  uint64_t v15 = type metadata accessor for LocalCachePaths(0);
  OUTLINED_FUNCTION_55(a1 + *(int *)(v15 + 20), 1);
  uint64_t v16 = OUTLINED_FUNCTION_72();
  return sub_1B385B178(v16, v17, v18);
}

void sub_1B3860D4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_48();
  a19 = v21;
  a20 = v22;
  uint64_t v23 = v20;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
  uint64_t v25 = OUTLINED_FUNCTION_24(v24);
  MEMORY[0x1F4188790](v25);
  OUTLINED_FUNCTION_29();
  uint64_t v28 = v27 - v26;
  uint64_t v29 = sub_1B389BD00();
  OUTLINED_FUNCTION_1();
  uint64_t v31 = v30;
  MEMORY[0x1F4188790](v32);
  OUTLINED_FUNCTION_19();
  MEMORY[0x1F4188790](v33);
  uint64_t v35 = (char *)&a9 - v34;
  __swift_project_boxed_opaque_existential_1((void *)(v20 + 80), *(void *)(v20 + 104));
  uint64_t v36 = OUTLINED_FUNCTION_84();
  v37(v36);
  if (v38 && (uint64_t v39 = sub_1B389C320(), v41 = v40, swift_bridgeObjectRelease(), v41))
  {
    BOOL v42 = v39 == 20035 && v41 == 0xE200000000000000;
    if (v42) {
      char v43 = 1;
    }
    else {
      char v43 = sub_1B389C920();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v43 = 0;
  }
  type metadata accessor for PegasusConfigController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v45 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  if (v43) {
    uint64_t v46 = 0x64656C6261736964;
  }
  else {
    uint64_t v46 = 0x746C7561666564;
  }
  if (v43) {
    uint64_t v47 = 0xE800000000000000;
  }
  else {
    uint64_t v47 = 0xE700000000000000;
  }
  id v48 = sub_1B386C740(v46, v47, 0x7473696C70, 0xE500000000000000, v45);

  if (v48)
  {
    sub_1B389BC90();

    uint64_t v49 = *(void (**)(uint64_t))(v31 + 32);
    uint64_t v50 = OUTLINED_FUNCTION_88();
    v49(v50);
    __swift_storeEnumTagSinglePayload(v28, 0, 1, v29);
    uint64_t v51 = OUTLINED_FUNCTION_87();
    OUTLINED_FUNCTION_23(v51, v52, v29);
    if (!v42)
    {
      ((void (*)(char *, uint64_t, uint64_t))v49)(v35, v28, v29);
      uint64_t v53 = *(void **)(v23 + 128);
      uint64_t v54 = (void *)sub_1B389BC50();
      uint64_t v55 = (void *)sub_1B389C280();
      id v56 = objc_msgSend(v53, sel_loadWithUrl_userAgent_userDefaults_, v54, v55, 0);

      if (v56)
      {
        if (qword_1EB7FA3A8 != -1) {
          swift_once();
        }
        uint64_t v57 = sub_1B389C1B0();
        uint64_t v58 = OUTLINED_FUNCTION_40(v57, (uint64_t)qword_1EB7FA460);
        os_log_type_t v59 = sub_1B389C5A0();
        if (os_log_type_enabled(v58, v59))
        {
          uint64_t v60 = (uint8_t *)OUTLINED_FUNCTION_12();
          *(_WORD *)uint64_t v60 = 0;
          _os_log_impl(&dword_1B3850000, v58, v59, "Bundled config load complete", v60, 2u);
          OUTLINED_FUNCTION_5();
        }
      }
      else
      {
        if (qword_1EB7FA3A8 != -1) {
          swift_once();
        }
        uint64_t v70 = sub_1B389C1B0();
        uint64_t v58 = OUTLINED_FUNCTION_40(v70, (uint64_t)qword_1EB7FA460);
        os_log_type_t v71 = sub_1B389C5B0();
        if (os_log_type_enabled(v58, v71))
        {
          uint64_t v72 = (uint8_t *)OUTLINED_FUNCTION_12();
          *(_WORD *)uint64_t v72 = 0;
          _os_log_impl(&dword_1B3850000, v58, v71, "Bundled config is not in plist format", v72, 2u);
          OUTLINED_FUNCTION_5();
        }
      }

      OUTLINED_FUNCTION_37();
      v61();
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v62 = OUTLINED_FUNCTION_87();
    __swift_storeEnumTagSinglePayload(v62, v63, 1, v29);
  }
  sub_1B386D330(v28, (uint64_t *)&unk_1EB7FBF88);
  if (qword_1EB7FA3A8 != -1) {
    swift_once();
  }
  uint64_t v64 = sub_1B389C1B0();
  uint64_t v65 = OUTLINED_FUNCTION_40(v64, (uint64_t)qword_1EB7FA460);
  os_log_type_t v66 = sub_1B389C5B0();
  if (os_log_type_enabled(v65, v66))
  {
    uint64_t v67 = (_WORD *)OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_42(v67);
    OUTLINED_FUNCTION_92(&dword_1B3850000, v68, v69, "Bundle is missing config.plist");
    OUTLINED_FUNCTION_5();
  }

LABEL_31:
  OUTLINED_FUNCTION_45();
}

uint64_t sub_1B38611FC()
{
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 40);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 80);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  sub_1B3853E04(v0 + 224);
  swift_release();
  return v0;
}

uint64_t sub_1B386129C()
{
  sub_1B38611FC();

  return MEMORY[0x1F4186488](v0, 248, 7);
}

uint64_t sub_1B38612D8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  char v5 = *((unsigned char *)a1 + 24);
  uint64_t v6 = a1[4];
  uint64_t v7 = a1[5];
  uint64_t v14 = a1[7];
  uint64_t v15 = a1[6];
  uint64_t v8 = *(void *)(v1 + 240);
  uint64_t v9 = *(os_unfair_lock_s **)(*(void *)(v8 + 24) + 16);
  swift_retain();
  os_unfair_lock_lock(v9);
  uint64_t v10 = *(void *)(v8 + 16);
  swift_unknownObjectRetain();
  os_unfair_lock_unlock(v9);
  swift_release();
  if (!v10) {
    return 0;
  }
  v16[0] = v2;
  v16[1] = v3;
  v16[2] = v4;
  char v17 = v5;
  uint64_t v18 = v6;
  uint64_t v19 = v7;
  uint64_t v20 = v15;
  uint64_t v21 = v14;
  uint64_t result = sub_1B385A66C(v10, (uint64_t)v16);
  if (v13 < 0)
  {
    sub_1B386C7D4(result, v12, v13);
LABEL_7:
    swift_unknownObjectRelease();
    return 0;
  }
  else
  {
    switch((char)result)
    {
      case 1:
      case 8:
        uint64_t result = result;
        break;
      default:
        goto LABEL_7;
    }
  }
  return result;
}

void sub_1B38615A8()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 16);
  uint64_t v2 = v1 + 4;
  uint64_t v3 = v1 + 6;
  os_unfair_lock_lock(v1 + 6);
  sub_1B3865B4C(v2);

  os_unfair_lock_unlock(v3);
}

void sub_1B386160C()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 16);
  uint64_t v2 = (uint64_t *)&v1[4];
  uint64_t v3 = v1 + 6;
  os_unfair_lock_lock(v1 + 6);
  sub_1B3865874(v2);

  os_unfair_lock_unlock(v3);
}

uint64_t sub_1B3861670(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 104) = a4;
  *(void *)(v5 + 112) = a5;
  return MEMORY[0x1F4188298](sub_1B3861690, 0, 0);
}

uint64_t sub_1B3861690()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 120) = Strong;
  if (!Strong)
  {
LABEL_4:
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
  if (sub_1B385293C())
  {
    swift_release();
    goto LABEL_4;
  }
  uint64_t v4 = *(long long **)(v0 + 112);
  long long v5 = v4[3];
  long long v7 = *v4;
  long long v6 = v4[1];
  *(_OWORD *)(v0 + 48) = v4[2];
  *(_OWORD *)(v0 + 64) = v5;
  *(_OWORD *)(v0 + 16) = v7;
  *(_OWORD *)(v0 + 32) = v6;
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_1B38617B0;
  return sub_1B385F964((_OWORD *)(v0 + 16), 1, 0, 2, 1);
}

uint64_t sub_1B38617B0()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3();
  *long long v5 = v4;
  *(void *)(v6 + 136) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_unknownObjectRelease();
  }
  OUTLINED_FUNCTION_9();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

uint64_t sub_1B3861898()
{
  OUTLINED_FUNCTION_2_0();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B38618F8()
{
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_6();
  return v0();
}

uint64_t sub_1B3861954(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B3861964(a1, a2, a3);
}

uint64_t sub_1B3861964(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA880);
  uint64_t v7 = OUTLINED_FUNCTION_24(v6);
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_70();
  sub_1B385A0AC(a1, v3, &qword_1EB7FA880);
  uint64_t v8 = sub_1B389C4F0();
  OUTLINED_FUNCTION_23(v3, 1, v8);
  if (v9)
  {
    sub_1B386D330(v3, &qword_1EB7FA880);
  }
  else
  {
    sub_1B389C4E0();
    OUTLINED_FUNCTION_46();
    v10();
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1B389C4A0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

id sub_1B3861AE8()
{
  uint64_t v0 = (void *)OUTLINED_FUNCTION_77();
  id v1 = OUTLINED_FUNCTION_61((uint64_t)v0, sel_valueForKey_);

  if (v1)
  {
    OUTLINED_FUNCTION_64();
    uint64_t v2 = swift_unknownObjectRelease();
  }
  else
  {
    double v6 = OUTLINED_FUNCTION_63();
  }
  OUTLINED_FUNCTION_62(v2, v3, &qword_1EB7FBE60, v4, v5, v6);
  if (!v11)
  {
    sub_1B386D330((uint64_t)v10, &qword_1EB7FBE60);
    return 0;
  }
  sub_1B3859FE4(0, (unint64_t *)&qword_1EB7FBDD0);
  if ((OUTLINED_FUNCTION_44() & 1) == 0) {
    return 0;
  }
  id v7 = objc_msgSend(v9, sel_BOOLValue);

  return v7;
}

uint64_t sub_1B3861BD0(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  *(unsigned char *)(v6 + 169) = a6;
  *(void *)(v6 + 120) = a4;
  *(void *)(v6 + 128) = a5;
  *(unsigned char *)(v6 + 168) = a2;
  *(void *)(v6 + 104) = a1;
  *(void *)(v6 + 112) = a3;
  return MEMORY[0x1F4188298](sub_1B3861BFC, 0, 0);
}

uint64_t sub_1B3861BFC()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_7();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 136) = Strong;
  if (Strong)
  {
    if ((*(unsigned char *)(v0 + 168) & 1) != 0 && (uint64_t v2 = sub_1B38612D8(*(uint64_t **)(v0 + 112)), v3))
    {
      uint64_t v4 = v2;
      uint64_t v5 = v3;
      swift_release();
      OUTLINED_FUNCTION_28();
      return v6(v4, v5);
    }
    else
    {
      uint64_t v8 = *(long long **)(v0 + 112);
      swift_retain();
      sub_1B387C8A0();
      swift_release();
      long long v9 = *v8;
      long long v10 = v8[1];
      long long v11 = v8[3];
      *(_OWORD *)(v0 + 48) = v8[2];
      *(_OWORD *)(v0 + 64) = v11;
      *(_OWORD *)(v0 + 16) = v9;
      *(_OWORD *)(v0 + 32) = v10;
      uint64_t v12 = (void *)swift_task_alloc();
      *(void *)(v0 + 144) = v12;
      *uint64_t v12 = v0;
      v12[1] = sub_1B3861DB0;
      uint64_t v13 = *(void *)(v0 + 120);
      uint64_t v14 = *(void *)(v0 + 128);
      char v15 = *(unsigned char *)(v0 + 169);
      return sub_1B3861F80(v0 + 16, v13, v14, v15);
    }
  }
  else
  {
    sub_1B386C3F8();
    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_21(v16, 7);
    OUTLINED_FUNCTION_6();
    return v17();
  }
}

uint64_t sub_1B3861DB0()
{
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_14();
  uint64_t v3 = v2;
  char v5 = v4;
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  OUTLINED_FUNCTION_4();
  *uint64_t v8 = v7;
  uint64_t v9 = *v1;
  OUTLINED_FUNCTION_3();
  *long long v10 = v9;
  *(void *)(v7 + 152) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    *(void *)(v7 + 160) = v3;
    *(unsigned char *)(v7 + 170) = v5;
  }
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_32();
  return MEMORY[0x1F4188298](v11, v12, v13);
}

uint64_t sub_1B3861EA8()
{
  OUTLINED_FUNCTION_2_0();
  sub_1B387D5E4();
  swift_release();
  OUTLINED_FUNCTION_28();
  uint64_t v2 = *(unsigned __int8 *)(v0 + 170);
  return v1(v2);
}

uint64_t sub_1B3861F18()
{
  OUTLINED_FUNCTION_2_0();
  sub_1B387D5E4();
  swift_release();
  OUTLINED_FUNCTION_6();
  return v0();
}

uint64_t sub_1B3861F80(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(void *)(v5 + 88) = a3;
  *(void *)(v5 + 96) = v4;
  *(unsigned char *)(v5 + 328) = a4;
  *(void *)(v5 + 80) = a2;
  uint64_t v7 = sub_1B389BA70();
  *(void *)(v5 + 104) = v7;
  *(void *)(v5 + 112) = *(void *)(v7 - 8);
  *(void *)(v5 + 120) = swift_task_alloc();
  *(void *)(v5 + 128) = swift_task_alloc();
  *(void *)(v5 + 136) = swift_task_alloc();
  uint64_t v8 = sub_1B389BD00();
  *(void *)(v5 + 144) = v8;
  *(void *)(v5 + 152) = *(void *)(v8 - 8);
  *(void *)(v5 + 160) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
  *(void *)(v5 + 168) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA428);
  *(void *)(v5 + 176) = swift_task_alloc();
  *(void *)(v5 + 184) = swift_task_alloc();
  *(void *)(v5 + 192) = swift_task_alloc();
  *(void *)(v5 + 200) = swift_task_alloc();
  *(_OWORD *)(v5 + 208) = *(_OWORD *)a1;
  uint64_t v9 = *(void *)(a1 + 16);
  *(unsigned char *)(v5 + 329) = *(unsigned char *)(a1 + 24);
  uint64_t v10 = *(void *)(a1 + 32);
  *(void *)(v5 + 224) = v9;
  *(void *)(v5 + 232) = v10;
  *(_OWORD *)(v5 + 240) = *(_OWORD *)(a1 + 40);
  *(void *)(v5 + 256) = *(void *)(a1 + 56);
  return MEMORY[0x1F4188298](sub_1B3862178, 0, 0);
}

uint64_t sub_1B3862178()
{
  uint64_t v93 = v1;
  if (qword_1EB7FA3A8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1B389C1B0();
  *(void *)(v1 + 264) = __swift_project_value_buffer(v2, (uint64_t)qword_1EB7FA460);
  uint64_t v3 = sub_1B389C190();
  os_log_type_t v4 = sub_1B389C5A0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (_WORD *)OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_42(v5);
    _os_log_impl(&dword_1B3850000, v3, v4, "fetching config", v0, 2u);
    OUTLINED_FUNCTION_5();
  }

  if ((sub_1B385C574() & 1) == 0)
  {
    sub_1B386C3F8();
    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_21(v14, 1);
LABEL_17:
    OUTLINED_FUNCTION_27();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_6();
    return v41();
  }
  uint64_t v6 = *(void *)(v1 + 96);
  if (MEMORY[0x1B3EBAFF0](v6 + 224))
  {
    uint64_t v8 = *(void *)(v1 + 192);
    uint64_t v7 = *(void *)(v1 + 200);
    uint64_t v9 = *(void *)(v6 + 232);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v9 + 56))(ObjectType, v9);
    sub_1B385B178(v8, v7, &qword_1EB7FA428);
    uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 40))(ObjectType, v9);
    uint64_t v13 = v12;
    swift_unknownObjectRelease();
    goto LABEL_13;
  }
  uint64_t v16 = *(void *)(v1 + 248);
  uint64_t v15 = *(void *)(v1 + 256);
  long long v17 = *(_OWORD *)(v1 + 232);
  char v18 = *(unsigned char *)(v1 + 329);
  uint64_t v19 = *(void *)(v1 + 224);
  uint64_t v20 = *(void *)(v1 + 96);
  long long v87 = *(_OWORD *)(v1 + 208);
  uint64_t v88 = v19;
  char v89 = v18;
  long long v90 = v17;
  uint64_t v91 = v16;
  uint64_t v92 = v15;
  sub_1B389A190(v20 + 80, (uint64_t)&v87, 0, 0, 1);
  uint64_t v21 = *(void *)(v1 + 200);
  uint64_t v22 = *(void *)(v1 + 104);
  __swift_storeEnumTagSinglePayload(*(void *)(v1 + 184), 0, 1, v22);
  uint64_t v23 = OUTLINED_FUNCTION_36();
  sub_1B385B178(v23, v24, v25);
  if (__swift_getEnumTagSinglePayload(v21, 1, v22)) {
    goto LABEL_12;
  }
  uint64_t v26 = *(void *)(v1 + 168);
  uint64_t v27 = *(void *)(v1 + 144);
  sub_1B389BA60();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v26, 1, v27);
  uint64_t v29 = *(void *)(v1 + 168);
  if (EnumTagSinglePayload)
  {
    sub_1B386D330(*(void *)(v1 + 168), (uint64_t *)&unk_1EB7FBF88);
LABEL_12:
    uint64_t v11 = 0;
    uint64_t v13 = 0;
    goto LABEL_13;
  }
  uint64_t v78 = *(void *)(v1 + 152);
  uint64_t v77 = *(void *)(v1 + 160);
  uint64_t v79 = *(void *)(v1 + 144);
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_90();
  v80();
  sub_1B386D330(v29, (uint64_t *)&unk_1EB7FBF88);
  uint64_t v11 = sub_1B389BC40();
  uint64_t v13 = v81;
  (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v77, v79);
LABEL_13:
  *(void *)(v1 + 272) = v11;
  *(void *)(v1 + 280) = v13;
  uint64_t v30 = *(void *)(v1 + 176);
  uint64_t v31 = *(void *)(v1 + 104);
  sub_1B385A0AC(*(void *)(v1 + 200), v30, &qword_1EB7FA428);
  int v32 = __swift_getEnumTagSinglePayload(v30, 1, v31);
  uint64_t v33 = *(void *)(v1 + 176);
  if (v32 == 1)
  {
    swift_bridgeObjectRelease();
    sub_1B386D330(v33, &qword_1EB7FA428);
    uint64_t v34 = (void *)sub_1B389C190();
    os_log_type_t v35 = sub_1B389C5B0();
    if (OUTLINED_FUNCTION_41(v35))
    {
      uint64_t v36 = (_WORD *)OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_42(v36);
      OUTLINED_FUNCTION_22(&dword_1B3850000, v37, v38, "config fetch request failed because of bad url");
      OUTLINED_FUNCTION_5();
    }
    uint64_t v39 = *(void *)(v1 + 200);

    sub_1B386C3F8();
    OUTLINED_FUNCTION_18();
    *uint64_t v40 = 0;
    OUTLINED_FUNCTION_31((uint64_t)v40, 256);
    sub_1B386D330(v39, &qword_1EB7FA428);
    goto LABEL_17;
  }
  uint64_t v85 = v6 + 224;
  uint64_t v86 = v6;
  uint64_t v43 = *(void *)(v1 + 80);
  uint64_t v44 = *(void *)(v1 + 112);
  uint64_t v45 = *(void *)(v1 + 88);
  unsigned __int8 v46 = *(unsigned char *)(v1 + 328);
  (*(void (**)(void, uint64_t, void))(v44 + 32))(*(void *)(v1 + 136), v33, *(void *)(v1 + 104));
  sub_1B389BA00();
  sub_1B387CAD0();
  uint64_t v47 = *(void (**)(void))(v44 + 16);
  OUTLINED_FUNCTION_85();
  v47();
  OUTLINED_FUNCTION_85();
  v47();
  sub_1B386C810(v43, v45, v46);
  sub_1B386C810(v43, v45, v46);
  id v48 = sub_1B389C190();
  os_log_type_t v49 = sub_1B389C5A0();
  BOOL v50 = os_log_type_enabled(v48, v49);
  uint64_t v51 = *(void *)(v1 + 112);
  unsigned __int8 v52 = *(unsigned char *)(v1 + 328);
  uint64_t v54 = *(void *)(v1 + 80);
  uint64_t v53 = *(void *)(v1 + 88);
  if (v50)
  {
    char v83 = *(unsigned char *)(v1 + 328);
    os_log_type_t type = v49;
    uint64_t v82 = *(void *)(v1 + 80);
    uint64_t v55 = swift_slowAlloc();
    *(void *)&long long v87 = swift_slowAlloc();
    *(_DWORD *)uint64_t v55 = 136315650;
    uint64_t v56 = sub_1B389BA10();
    *(void *)(v1 + 48) = sub_1B3855F24(v56, v57, (uint64_t *)&v87);
    sub_1B389C6C0();
    swift_bridgeObjectRelease();
    uint64_t v58 = *(void (**)(void))(v51 + 8);
    OUTLINED_FUNCTION_37();
    v58();
    *(_WORD *)(v55 + 12) = 2080;
    *(void *)(v1 + 56) = sub_1B389BA30();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCEE08);
    uint64_t v59 = sub_1B389C300();
    *(void *)(v1 + 64) = sub_1B3855F24(v59, v60, (uint64_t *)&v87);
    sub_1B389C6C0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_37();
    v58();
    *(_WORD *)(v55 + 22) = 2080;
    unint64_t v61 = sub_1B386302C(v82, v53, v83);
    *(void *)(v1 + 72) = sub_1B3855F24(v61, v62, (uint64_t *)&v87);
    OUTLINED_FUNCTION_88();
    sub_1B389C6C0();
    swift_bridgeObjectRelease();
    uint64_t v63 = OUTLINED_FUNCTION_84();
    uint64_t v64 = v58;
    sub_1B386C7E4(v63, v65, v83);
    uint64_t v66 = OUTLINED_FUNCTION_84();
    sub_1B386C7E4(v66, v67, v83);
    _os_log_impl(&dword_1B3850000, v48, type, "config request: %s, header: %s, reason: %s", (uint8_t *)v55, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_5();
  }
  else
  {
    uint64_t v64 = *(void (**)(void))(v51 + 8);
    OUTLINED_FUNCTION_37();
    v64();
    OUTLINED_FUNCTION_37();
    v64();
    sub_1B386C7E4(v54, v53, v52);
    sub_1B386C7E4(v54, v53, v52);
  }

  *(void *)(v1 + 288) = v64;
  uint64_t v69 = *(void *)(v1 + 216);
  uint64_t v68 = *(void *)(v1 + 224);
  uint64_t v70 = *(void *)(v1 + 208);
  uint64_t v71 = *(void *)(v1 + 96);
  sub_1B3863168(*(void *)(v1 + 80), *(void *)(v1 + 88), *(unsigned char *)(v1 + 328));
  uint64_t v72 = *(void *)(v71 + 16);
  *(void *)(v1 + 16) = v70;
  *(void *)(v1 + 24) = v69;
  *(void *)(v1 + 32) = v68;
  uint64_t v73 = MEMORY[0x1B3EBAFF0](v85);
  *(void *)(v1 + 296) = v73;
  uint64_t v74 = *(void *)(v86 + 232);
  swift_bridgeObjectRetain();
  uint64_t v75 = (void *)swift_task_alloc();
  *(void *)(v1 + 304) = v75;
  *uint64_t v75 = v1;
  v75[1] = sub_1B3862998;
  uint64_t v76 = *(void *)(v1 + 136);
  return sub_1B3863354(v72, v76, v71 + 40, v1 + 16, v73, v74);
}

uint64_t sub_1B3862998()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_4();
  *os_log_type_t v4 = v3;
  *os_log_type_t v4 = *v1;
  *(void *)(v3 + 312) = v5;
  *(void *)(v3 + 320) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  if (v0) {
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_9();
  return MEMORY[0x1F4188298](v6, v7, v8);
}

uint64_t sub_1B3862AB8()
{
  uint64_t v41 = v0;
  swift_bridgeObjectRetain_n();
  uint64_t v1 = (void *)sub_1B389C190();
  os_log_type_t v2 = sub_1B389C590();
  if (OUTLINED_FUNCTION_43(v2))
  {
    uint64_t v3 = (_DWORD *)OUTLINED_FUNCTION_59();
    uint64_t v4 = swift_slowAlloc();
    *uint64_t v3 = 136315138;
    uint64_t v40 = v4;
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1B389C220();
    unint64_t v7 = v6;
    swift_bridgeObjectRelease();
    v0[5] = sub_1B3855F24(v5, v7, &v40);
    sub_1B389C6C0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_81(&dword_1B3850000, v8, v9, "got config: %s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_5();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  if (!v0[35])
  {
    swift_bridgeObjectRelease();
    uint64_t v15 = (void *)sub_1B389C190();
    os_log_type_t v16 = sub_1B389C5B0();
    if (OUTLINED_FUNCTION_41(v16))
    {
      long long v17 = (_WORD *)OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_42(v17);
      OUTLINED_FUNCTION_22(&dword_1B3850000, v18, v19, "configCacheRequest failed because of bad url");
      OUTLINED_FUNCTION_5();
    }
    uint64_t v20 = (void (*)(uint64_t))v0[36];
    uint64_t v13 = v0[25];

    sub_1B386C3F8();
    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_21(v21, 4);
    uint64_t v22 = OUTLINED_FUNCTION_88();
    v20(v22);
    goto LABEL_10;
  }
  uint64_t v10 = v0[40];
  uint64_t v11 = sub_1B3860684(v0[39], v0[34], (void *)v0[35]);
  if (v10)
  {
    uint64_t v13 = v0[25];
    OUTLINED_FUNCTION_46();
    v14();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_10:
    sub_1B386D330(v13, &qword_1EB7FA428);
    OUTLINED_FUNCTION_27();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_6();
    return v23();
  }
  uint64_t v25 = v11;
  unint64_t v26 = v12;
  uint64_t v27 = v0[12];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v28 = *(void **)(v27 + 128);
  OUTLINED_FUNCTION_88();
  uint64_t v29 = (void *)sub_1B389BD30();
  OUTLINED_FUNCTION_36();
  uint64_t v30 = (void *)sub_1B389C280();
  id v39 = objc_msgSend(v28, sel_loadWithData_userAgent_userDefaults_, v29, v30, 0);

  sub_1B3863DD4();
  uint64_t v31 = sub_1B389C190();
  os_log_type_t v32 = sub_1B389C5A0();
  if (OUTLINED_FUNCTION_43(v32))
  {
    uint64_t v33 = (uint8_t *)OUTLINED_FUNCTION_12();
    *(_WORD *)uint64_t v33 = 0;
    _os_log_impl(&dword_1B3850000, v31, (os_log_type_t)v28, "Setting fetched config value in completion", v33, 2u);
    OUTLINED_FUNCTION_5();
  }
  uint64_t v34 = (void (*)(uint64_t, uint64_t))v0[36];
  uint64_t v35 = v0[25];
  uint64_t v36 = v0[17];
  uint64_t v37 = v0[13];
  sub_1B386CE50(v25, v26);

  v34(v36, v37);
  sub_1B386D330(v35, &qword_1EB7FA428);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_28();
  return v38(2, v39);
}

uint64_t sub_1B3862F44()
{
  uint64_t v1 = *(void *)(v0 + 200);
  OUTLINED_FUNCTION_46();
  v2();
  sub_1B386D330(v1, &qword_1EB7FA428);
  OUTLINED_FUNCTION_27();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_6();
  return v3();
}

unint64_t sub_1B386302C(uint64_t a1, uint64_t a2, char a3)
{
  if (!a3)
  {
    uint64_t v4 = 0x64612E6D61726170;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    uint64_t v4 = 0x68632E6D61726170;
LABEL_5:
    uint64_t v6 = v4;
    sub_1B389C3C0();
    return v6;
  }
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x64657269707865;
      break;
    case 3:
      unint64_t result = 0x434C525565736162;
      break;
    case 4:
      unint64_t result = 0x676E6168436C7275;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1B3863168(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = sub_1B389C110();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B389C600();
  if (qword_1EB7FA708 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA930);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1B389D510;
  unint64_t v11 = sub_1B386302C(a1, a2, a3);
  uint64_t v13 = v12;
  *(void *)(v10 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v10 + 64) = sub_1B38579B4();
  *(void *)(v10 + 32) = v11;
  *(void *)(v10 + 40) = v13;
  uint64_t v14 = sub_1B386AB44();
  uint64_t v15 = MEMORY[0x1E4FBB5C8];
  *(void *)(v10 + 96) = MEMORY[0x1E4FBB550];
  *(void *)(v10 + 104) = v15;
  *(void *)(v10 + 72) = v14;
  sub_1B389C100();
  sub_1B389C0C0();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_1B3863354(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 184) = a5;
  *(void *)(v6 + 192) = a6;
  *(void *)(v6 + 168) = a2;
  *(void *)(v6 + 176) = a3;
  *(void *)(v6 + 160) = a1;
  *(_OWORD *)(v6 + 200) = *(_OWORD *)a4;
  *(void *)(v6 + 216) = *(void *)(a4 + 16);
  return MEMORY[0x1F4188298](sub_1B386338C, 0, 0);
}

uint64_t sub_1B386338C()
{
  uint64_t v2 = *(void *)(v0 + 208);
  uint64_t v1 = *(void *)(v0 + 216);
  uint64_t v3 = *(void **)(v0 + 176);
  uint64_t v21 = *(void *)(v0 + 200);
  uint64_t v22 = *(void *)(v0 + 184);
  uint64_t v4 = *(void *)(v0 + 160);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA6E0);
  swift_allocObject();
  uint64_t v5 = sub_1B386BC28(0);
  *(_OWORD *)(v0 + 56) = 0u;
  *(void *)(v0 + 224) = v5;
  *(_OWORD *)(v0 + 72) = 0u;
  uint64_t v7 = v3[3];
  uint64_t v6 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v7);
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = v5;
  v8[3] = v4;
  v8[4] = v21;
  void v8[5] = v2;
  v8[6] = v1;
  uint64_t v9 = *(void (**)(uint64_t (*)(void *), void *, uint64_t, uint64_t))(v6 + 8);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  v9(sub_1B386CEE8, v8, v7, v6);
  swift_release();
  if (v22)
  {
    uint64_t v10 = *(void *)(v0 + 192);
    uint64_t v11 = *(void *)(v0 + 168);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v13 = v0 + 88;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 72))(v11, ObjectType, v10);
    sub_1B386D330(v0 + 56, &qword_1EB7FBE60);
  }
  else
  {
    sub_1B386D330(v0 + 56, &qword_1EB7FBE60);
    uint64_t v13 = v0 + 88;
    *(_OWORD *)(v0 + 88) = 0u;
    *(_OWORD *)(v0 + 104) = 0u;
  }
  sub_1B385B178(v13, v0 + 56, &qword_1EB7FBE60);
  uint64_t v14 = *(void *)(v0 + 40);
  uint64_t v15 = *(void *)(v0 + 48);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), v14);
  uint64_t v23 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, __n128))(*(void *)(v15 + 8) + **(int **)(v15 + 8));
  unsigned __int32 v16 = *MEMORY[0x1E4F28A00];
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v0 + 232) = v17;
  *uint64_t v17 = v0;
  v17[1] = sub_1B3863654;
  uint64_t v18 = *(void *)(v0 + 168);
  v19.n128_u32[0] = v16;
  return v23(v0 + 120, v18, v14, v15, v19);
}

uint64_t sub_1B3863654()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3();
  *uint64_t v5 = v4;
  *(void *)(v6 + 240) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_9();
  return MEMORY[0x1F4188298](v7, v8, v9);
}

uint64_t sub_1B3863730()
{
  uint64_t v35 = v0;
  uint64_t v1 = (void *)v0[30];
  uint64_t v3 = v0[15];
  unint64_t v2 = v0[16];
  uint64_t v4 = (void *)v0[17];
  uint64_t v5 = v0[18];
  uint64_t v30 = (uint64_t)(v0 + 7);
  uint64_t v31 = v3;
  unint64_t v32 = v2;
  uint64_t v33 = v4;
  uint64_t v34 = v5;
  sub_1B386CEF8(v3, v2);
  sub_1B386CEF8(v3, v2);
  id v6 = v4;
  swift_bridgeObjectRetain();
  sub_1B3865FB4(&v31);
  uint64_t v7 = v1;
  if (v1)
  {
    OUTLINED_FUNCTION_30();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_30();
    OUTLINED_FUNCTION_30();

    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
    if (qword_1EB7FA3A8 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1B389C1B0();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB7FA460);
    id v9 = v1;
    id v10 = v1;
    uint64_t v11 = (void *)sub_1B389C190();
    os_log_type_t v12 = sub_1B389C5B0();
    if (OUTLINED_FUNCTION_57(v12))
    {
      uint64_t v13 = (_DWORD *)OUTLINED_FUNCTION_59();
      uint64_t v14 = (void *)swift_slowAlloc();
      *uint64_t v13 = 138412290;
      id v15 = v7;
      uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
      OUTLINED_FUNCTION_56(v16);
      *uint64_t v14 = v16;

      OUTLINED_FUNCTION_82(&dword_1B3850000, v17, v18, "error in getting config: %@");
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CCED90);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
    }
    else
    {
    }
    uint64_t v19 = v0[23];

    uint64_t v20 = (void *)sub_1B3866660(v7);
    if (v19)
    {
      uint64_t v21 = v0[24];
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(v21 + 88))(v20, v30, ObjectType, v21);
    }
    if (sub_1B38666F8())
    {
      sub_1B386AEB0(v7);
      swift_release();
    }
    swift_willThrow();

    sub_1B386D330(v30, &qword_1EB7FBE60);
    if (sub_1B38666F8())
    {
      sub_1B38836CC();
      swift_release();
    }
    swift_release();
    uint64_t v23 = (uint64_t (*)(void))v0[1];
    return v23();
  }
  else
  {
    id v25 = sub_1B386647C();
    uint64_t v26 = v0[23];
    OUTLINED_FUNCTION_30();
    if (v26)
    {
      uint64_t v27 = v0[24];
      uint64_t v28 = swift_getObjectType();
      uint64_t v31 = v3;
      unint64_t v32 = v2;
      uint64_t v33 = v4;
      uint64_t v34 = v5;
      (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(v27 + 80))(&v31, v30, v28, v27);
    }
    OUTLINED_FUNCTION_30();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_30();

    swift_bridgeObjectRelease();
    sub_1B386D330(v30, &qword_1EB7FBE60);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
    if (sub_1B38666F8())
    {
      sub_1B38836CC();
      swift_release();
    }
    swift_release();
    uint64_t v29 = (uint64_t (*)(id))v0[1];
    return v29(v25);
  }
}

uint64_t sub_1B3863B3C()
{
  uint64_t v1 = *(void *)(v0 + 240);
  unint64_t v2 = (void *)sub_1B389BBF0();
  char v3 = sub_1B3886F8C();

  LOBYTE(v2) = v3 | 0x80;
  sub_1B386C3F8();
  uint64_t v4 = (void *)OUTLINED_FUNCTION_18();
  *(void *)uint64_t v5 = v1;
  *(unsigned char *)(v5 + 8) = (_BYTE)v2;
  *(unsigned char *)(v5 + 9) = 0;
  swift_willThrow();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  if (qword_1EB7FA3A8 != -1) {
    swift_once();
  }
  uint64_t v6 = v0 + 56;
  uint64_t v7 = sub_1B389C1B0();
  __swift_project_value_buffer(v7, (uint64_t)qword_1EB7FA460);
  id v8 = (id)OUTLINED_FUNCTION_83();
  id v9 = v4;
  id v10 = (void *)sub_1B389C190();
  os_log_type_t v11 = sub_1B389C5B0();
  if (OUTLINED_FUNCTION_57(v11))
  {
    os_log_type_t v12 = (_DWORD *)OUTLINED_FUNCTION_59();
    uint64_t v13 = (void *)swift_slowAlloc();
    *os_log_type_t v12 = 138412290;
    id v14 = v4;
    uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
    OUTLINED_FUNCTION_56(v15);
    *uint64_t v13 = v15;
    uint64_t v6 = v0 + 56;

    OUTLINED_FUNCTION_82(&dword_1B3850000, v16, v17, "error in getting config: %@");
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CCED90);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_5();
  }
  else
  {
  }
  uint64_t v18 = *(void *)(v0 + 184);

  uint64_t v19 = (void *)sub_1B3866660(v4);
  if (v18)
  {
    swift_getObjectType();
    uint64_t v20 = OUTLINED_FUNCTION_66();
    v21(v20);
  }
  if (sub_1B38666F8())
  {
    uint64_t v22 = (void *)OUTLINED_FUNCTION_83();
    sub_1B386AEB0(v22);
    swift_release();
  }
  swift_willThrow();

  sub_1B386D330(v6, &qword_1EB7FBE60);
  if (sub_1B38666F8())
  {
    sub_1B38836CC();
    swift_release();
  }
  swift_release();
  OUTLINED_FUNCTION_67();
  return v23();
}

void sub_1B3863DD4()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 16);
  unint64_t v2 = (uint64_t *)&v1[4];
  char v3 = v1 + 6;
  os_unfair_lock_lock(v1 + 6);
  sub_1B3865274(v2);

  os_unfair_lock_unlock(v3);
}

uint64_t sub_1B3863E38(uint64_t a1)
{
  swift_defaultActor_initialize();
  *(void *)(v1 + 120) = 0;
  *(void *)(v1 + 128) = 0;
  *(_WORD *)(v1 + 136) = 0;
  *(void *)(v1 + 112) = a1;
  return v1;
}

uint64_t sub_1B3863E70()
{
  if (*(void *)(v0 + 120))
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FAB08);
    sub_1B389C510();
    swift_release();
  }
  if (*(void *)(v0 + 128))
  {
    swift_retain();
    sub_1B389C510();
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_1B3863F28()
{
  uint64_t v0 = sub_1B3863E70();

  return MEMORY[0x1F4188210](v0);
}

uint64_t sub_1B3863F50(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA880);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v2 + 120))
  {
    uint64_t v8 = *(void *)(v2 + 120);
  }
  else
  {
    uint64_t v9 = sub_1B389C4F0();
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v9);
    uint64_t v10 = swift_allocObject();
    swift_weakInit();
    os_log_type_t v11 = (void *)swift_allocObject();
    v11[2] = 0;
    v11[3] = 0;
    v11[4] = v10;
    v11[5] = a1;
    unsigned char v11[6] = a2;
    swift_retain();
    uint64_t v8 = sub_1B3861964((uint64_t)v7, (uint64_t)&unk_1E9CCED78, (uint64_t)v11);
    sub_1B386D330((uint64_t)v7, &qword_1EB7FA880);
    *(void *)(v2 + 120) = v8;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v8;
}

uint64_t sub_1B38640C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[13] = a5;
  v6[14] = a6;
  v6[11] = a1;
  v6[12] = a4;
  return MEMORY[0x1F4188298](sub_1B38640E8, 0, 0);
}

uint64_t sub_1B38640E8()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_7();
  uint64_t Strong = swift_weakLoadStrong();
  swift_release();
  if (Strong)
  {
    uint64_t v6 = (uint64_t (*)(void))(*(void *)(v0 + 104) + **(int **)(v0 + 104));
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 120) = v2;
    void *v2 = v0;
    v2[1] = sub_1B3864228;
    return v6();
  }
  else
  {
    sub_1B386C3F8();
    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_21(v4, 7);
    OUTLINED_FUNCTION_6();
    return v5();
  }
}

uint64_t sub_1B3864228()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  *char v3 = v2;
  *char v3 = *v1;
  *(unsigned char *)(v2 + 160) = v4;
  *(void *)(v2 + 128) = v5;
  *(void *)(v2 + 136) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_9();
  return MEMORY[0x1F4188298](v6, v7, v8);
}

uint64_t sub_1B3864310()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 144) = Strong;
  if (Strong)
  {
    swift_unknownObjectRetain();
    uint64_t v2 = OUTLINED_FUNCTION_36();
    return MEMORY[0x1F4188298](v2, v3, 0);
  }
  else
  {
    uint64_t v4 = *(void *)(v0 + 128);
    uint64_t v5 = *(void *)(v0 + 88);
    *(unsigned char *)uint64_t v5 = *(unsigned char *)(v0 + 160);
    *(void *)(v5 + 8) = v4;
    OUTLINED_FUNCTION_6();
    return v6();
  }
}

uint64_t sub_1B38643D4()
{
  OUTLINED_FUNCTION_2_0();
  sub_1B386460C(*(unsigned __int8 *)(v0 + 160), *(void *)(v0 + 128));
  swift_unknownObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_9();
  return MEMORY[0x1F4188298](v1, v2, v3);
}

uint64_t sub_1B3864450()
{
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 88);
  *(unsigned char *)uint64_t v2 = *(unsigned char *)(v0 + 160);
  *(void *)(v2 + 8) = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B386447C()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_7();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 152) = Strong;
  if (Strong)
  {
    return MEMORY[0x1F4188298](sub_1B3864538, Strong, 0);
  }
  else
  {
    swift_willThrow();
    OUTLINED_FUNCTION_6();
    return v2();
  }
}

uint64_t sub_1B3864538()
{
  OUTLINED_FUNCTION_2_0();
  sub_1B386460C(0, 0);
  swift_release();
  OUTLINED_FUNCTION_9();
  return MEMORY[0x1F4188298](v0, v1, v2);
}

uint64_t sub_1B38645A8()
{
  OUTLINED_FUNCTION_13();
  swift_willThrow();
  OUTLINED_FUNCTION_6();
  return v0();
}

uint64_t sub_1B386460C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v4 = swift_unknownObjectRetain();
    sub_1B3864664(v4);
  }
  *(void *)(v2 + 120) = 0;
  uint64_t result = swift_release();
  *(unsigned char *)(v2 + 136) = a2 != 0;
  return result;
}

uint64_t sub_1B3864664(uint64_t a1)
{
  uint64_t v7 = a1;
  uint64_t v3 = *(os_unfair_lock_s **)(v1[3] + 16);
  os_unfair_lock_lock(v3);
  uint64_t v6 = v1[2];
  v1[2] = a1;
  swift_unknownObjectRetain();
  os_unfair_lock_unlock(v3);
  uint64_t v4 = (void (*)(uint64_t *, uint64_t *))v1[4];
  if (v4)
  {
    swift_retain();
    v4(&v6, &v7);
    sub_1B386C160((uint64_t)v4);
  }
  swift_unknownObjectRelease();

  return swift_unknownObjectRelease();
}

uint64_t sub_1B3864710()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x1F4188298](sub_1B3864730, v0, 0);
}

uint64_t sub_1B3864730()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v1 = *(void *)(v0[2] + 128);
  v0[3] = v1;
  if (v1)
  {
    swift_retain();
    uint64_t v2 = (void *)swift_task_alloc();
    v0[4] = v2;
    void *v2 = v0;
    v2[1] = sub_1B3864814;
    return MEMORY[0x1F4187DC0]();
  }
  else
  {
    OUTLINED_FUNCTION_6();
    return v3();
  }
}

uint64_t sub_1B3864814()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0();
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_3();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1B38648F4, v2, 0);
}

uint64_t sub_1B38648F4()
{
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_6();
  return v0();
}

uint64_t sub_1B386494C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA880);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B389C4D0();
  uint64_t v7 = sub_1B389C4F0();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v7);
  uint64_t v8 = swift_allocObject();
  swift_weakInit();
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v8;
  v9[5] = a1;
  v9[6] = a2;
  swift_retain();
  sub_1B3874680((uint64_t)v6, (uint64_t)&unk_1E9CCED58, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_1B3864A68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[6] = a5;
  v6[7] = a6;
  v6[5] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA880);
  v6[8] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1B3864B00, 0, 0);
}

uint64_t sub_1B3864B00()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 72) = Strong;
  if (Strong)
  {
    return MEMORY[0x1F4188298](sub_1B3864BAC, Strong, 0);
  }
  else
  {
    swift_task_dealloc();
    OUTLINED_FUNCTION_6();
    return v2();
  }
}

uint64_t sub_1B3864BAC()
{
  uint64_t v1 = *(void *)(v0 + 72);
  *(unsigned char *)(v0 + 88) = *(unsigned char *)(v1 + 137);
  *(unsigned char *)(v1 + 137) = 1;
  return OUTLINED_FUNCTION_17_0((uint64_t)sub_1B3864BD4);
}

uint64_t sub_1B3864BD4()
{
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = *(void *)(v0 + 72);
  if (*(unsigned char *)(v0 + 88))
  {
    swift_release();
    swift_task_dealloc();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_32();
    return v3(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  else
  {
    uint64_t v12 = *(void *)(v0 + 56);
    uint64_t v11 = *(void *)(v0 + 64);
    uint64_t v13 = *(void *)(v0 + 48);
    uint64_t v14 = sub_1B389C4F0();
    OUTLINED_FUNCTION_80(v14);
    uint64_t v15 = (void *)swift_allocObject();
    v15[2] = 0;
    void v15[3] = 0;
    v15[4] = v13;
    v15[5] = v12;
    v15[6] = v1;
    swift_retain();
    swift_retain();
    *(void *)(v0 + 80) = sub_1B3874680(v11, (uint64_t)&unk_1E9CCED68, (uint64_t)v15);
    OUTLINED_FUNCTION_32();
    return MEMORY[0x1F4188298](v16, v17, v18);
  }
}

uint64_t sub_1B3864CF0()
{
  OUTLINED_FUNCTION_2_0();
  sub_1B3865098(*(void *)(v0 + 80));
  OUTLINED_FUNCTION_9();
  return MEMORY[0x1F4188298](v1, v2, v3);
}

uint64_t sub_1B3864D50()
{
  OUTLINED_FUNCTION_2_0();
  swift_release();
  swift_release();
  swift_task_dealloc();
  OUTLINED_FUNCTION_6();
  return v0();
}

uint64_t sub_1B3864DB8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 16) = a6;
  uint64_t v9 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v7;
  *uint64_t v7 = v6;
  v7[1] = sub_1B3864E88;
  return v9();
}

uint64_t sub_1B3864E88()
{
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_14();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  OUTLINED_FUNCTION_4();
  *uint64_t v8 = v7;
  uint64_t v9 = *v1;
  OUTLINED_FUNCTION_3();
  *uint64_t v10 = v9;
  swift_task_dealloc();
  if (v0)
  {

    uint64_t v5 = 0;
    uint64_t v3 = 0;
  }
  *(void *)(v7 + 32) = v5;
  *(void *)(v7 + 40) = v3;
  OUTLINED_FUNCTION_32();
  return MEMORY[0x1F4188298](v11, v12, v13);
}

uint64_t sub_1B3864F7C()
{
  OUTLINED_FUNCTION_2_0();
  sub_1B3865038(*(void *)(v0 + 32), *(void *)(v0 + 40));
  OUTLINED_FUNCTION_9();
  return MEMORY[0x1F4188298](v1, v2, v3);
}

uint64_t sub_1B3864FE0()
{
  OUTLINED_FUNCTION_2_0();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_6();
  return v0();
}

uint64_t sub_1B3865038(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 128) = 0;
  uint64_t result = swift_release();
  *(unsigned char *)(v2 + 137) = 0;
  if ((*(unsigned char *)(v2 + 136) & 1) == 0)
  {
    if (a2)
    {
      uint64_t v5 = swift_unknownObjectRetain();
      return sub_1B3864664(v5);
    }
  }
  return result;
}

BOOL sub_1B3865084()
{
  char v1 = *(unsigned char *)(v0 + 137);
  *(unsigned char *)(v0 + 137) = 1;
  return (v1 & 1) == 0;
}

uint64_t sub_1B3865098(uint64_t result)
{
  if (*(unsigned char *)(v1 + 137) == 1 && !*(void *)(v1 + 128))
  {
    *(void *)(v1 + 128) = result;
    return swift_retain();
  }
  return result;
}

uint64_t sub_1B38650B8()
{
  return v0;
}

uint64_t sub_1B38650C8()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 88);
  uint64_t v2 = sub_1B389C660();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  sub_1B386C160(*(void *)(v0 + *(void *)(*(void *)v0 + 104)));
  return v0;
}

uint64_t sub_1B386518C()
{
  uint64_t v0 = sub_1B38650C8();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1B38651E0()
{
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_1B3865208()
{
  uint64_t v0 = sub_1B38651E0();

  return MEMORY[0x1F4186488](v0, 48, 7);
}

uint64_t sub_1B3865238()
{
  sub_1B3863DD4();
  swift_release();

  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t sub_1B3865274(uint64_t *a1)
{
  uint64_t v2 = sub_1B389C140();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v51 = v2;
  uint64_t v52 = v3;
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v45 - v7;
  uint64_t v9 = sub_1B389C110();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x1F4188790](v11);
  uint64_t v16 = (char *)&v45 - v15;
  uint64_t result = MEMORY[0x1F4188790](v14);
  uint64_t v19 = (char *)&v45 - v18;
  uint64_t v20 = *a1;
  uint64_t v21 = *(void *)(*a1 + 16);
  uint64_t v53 = a1;
  if (v21)
  {
    *(void *)(v20 + 16) = 0;
    uint64_t v49 = *(void *)(v20 + 32);
    BOOL v50 = v6;
    if (qword_1EB7FA3B8 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_1B389C130();
    __swift_project_value_buffer(v22, (uint64_t)qword_1EB7FA480);
    uint64_t v23 = sub_1B389C120();
    sub_1B389C150();
    int v48 = sub_1B389C5E0();
    if (sub_1B389C630())
    {
      uint64_t v47 = v13;
      swift_retain();
      sub_1B389C180();
      swift_release();
      uint64_t v24 = v51;
      uint64_t v25 = v52;
      if ((*(unsigned int (**)(char *, uint64_t))(v52 + 88))(v8, v51) == *MEMORY[0x1E4FBD340])
      {
        char v26 = 0;
        unsigned __int8 v46 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v25 + 8))(v8, v24);
        unsigned __int8 v46 = "BagRequests=%{public}lu";
        char v26 = 1;
      }
      uint64_t v13 = v47;
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v16, v19, v9);
      uint64_t v27 = swift_slowAlloc();
      *(unsigned char *)uint64_t v27 = 0;
      *(unsigned char *)(v27 + 1) = v26;
      *(_WORD *)(v27 + 2) = 2050;
      uint64_t v54 = v49;
      sub_1B389C6C0();
      os_signpost_id_t v28 = sub_1B389C0F0();
      _os_signpost_emit_with_name_impl(&dword_1B3850000, v23, (os_signpost_type_t)v48, v28, "bagExpiredSpan", v46, (uint8_t *)v27, 0xCu);
      MEMORY[0x1B3EBAF20](v27, -1, -1);

      uint64_t v29 = *(void (**)(char *, uint64_t))(v10 + 8);
      v29(v19, v9);
      swift_release();
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v29)(v16, v9);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v10 + 8))(v19, v9);
      uint64_t result = swift_release();
    }
    a1 = v53;
    uint64_t v6 = v50;
  }
  uint64_t v30 = (void *)*a1;
  v30[4] = 0;
  if (v30[3])
  {
    v30[3] = 0;
    uint64_t v31 = v30[5];
    if (qword_1EB7FA3B8 != -1) {
      swift_once();
    }
    uint64_t v32 = sub_1B389C130();
    __swift_project_value_buffer(v32, (uint64_t)qword_1EB7FA480);
    uint64_t v33 = sub_1B389C120();
    sub_1B389C150();
    LODWORD(v50) = sub_1B389C5E0();
    char v34 = sub_1B389C630();
    uint64_t v35 = v13;
    uint64_t v36 = v52;
    if (v34)
    {
      uint64_t v49 = v31;
      uint64_t v37 = v35;
      swift_retain();
      sub_1B389C180();
      swift_release();
      uint64_t v38 = v51;
      if ((*(unsigned int (**)(char *, uint64_t))(v36 + 88))(v6, v51) == *MEMORY[0x1E4FBD340])
      {
        char v39 = 0;
        uint64_t v40 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v36 + 8))(v6, v38);
        uint64_t v40 = "BagRequests=%{public}lu";
        char v39 = 1;
      }
      uint64_t v41 = v37;
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v16, v37, v9);
      uint64_t v42 = swift_slowAlloc();
      *(unsigned char *)uint64_t v42 = 0;
      *(unsigned char *)(v42 + 1) = v39;
      *(_WORD *)(v42 + 2) = 2050;
      uint64_t v54 = v49;
      sub_1B389C6C0();
      os_signpost_id_t v43 = sub_1B389C0F0();
      _os_signpost_emit_with_name_impl(&dword_1B3850000, v33, (os_signpost_type_t)v50, v43, "bagInvalidSpan", v40, (uint8_t *)v42, 0xCu);
      MEMORY[0x1B3EBAF20](v42, -1, -1);

      uint64_t v44 = *(void (**)(char *, uint64_t))(v10 + 8);
      v44(v41, v9);
      swift_release();
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v44)(v16, v9);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v10 + 8))(v35, v9);
      uint64_t result = swift_release();
    }
    a1 = v53;
  }
  *(void *)(*a1 + 40) = 0;
  return result;
}

uint64_t sub_1B3865874(uint64_t *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1B389C110();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x1F4188790](v7);
  uint64_t v12 = (char *)&v26 - v11;
  uint64_t v13 = *a1;
  if (*(void *)(*a1 + 16)) {
    goto LABEL_7;
  }
  uint64_t v29 = a1;
  unint64_t v2 = *(void *)(v13 + 32);
  if (qword_1EB7FA3B8 != -1) {
    goto LABEL_10;
  }
  while (1)
  {
    uint64_t v14 = sub_1B389C130();
    __swift_project_value_buffer(v14, (uint64_t)qword_1EB7FA480);
    sub_1B389C100();
    uint64_t v15 = sub_1B389C120();
    int v28 = sub_1B389C5F0();
    if (sub_1B389C630())
    {
      char v26 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
      unint64_t v16 = v2;
      unint64_t v2 = (v6 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
      v26(v9, v12, v5);
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = v3;
      uint64_t v18 = v17;
      *(_DWORD *)uint64_t v17 = 134349056;
      unint64_t v30 = v16;
      sub_1B389C6C0();
      os_signpost_id_t v19 = sub_1B389C0F0();
      _os_signpost_emit_with_name_impl(&dword_1B3850000, v15, (os_signpost_type_t)v28, v19, "bagExpiredSpan", "BagRequests=%{public}lu", v18, 0xCu);
      uint64_t v20 = v18;
      uint64_t v3 = v27;
      MEMORY[0x1B3EBAF20](v20, -1, -1);

      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
      v26(v9, v12, v5);
    }
    else
    {

      unint64_t v2 = (v6 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
      (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v12, v5);
    }
    sub_1B389C170();
    swift_allocObject();
    uint64_t v21 = sub_1B389C160();
    uint64_t v22 = *(void (**)(char *, uint64_t))(v6 + 8);
    v6 += 8;
    v22(v12, v5);
    *(void *)(v13 + 16) = v21;
    uint64_t result = swift_release();
    uint64_t v13 = *v29;
LABEL_7:
    uint64_t v23 = *(void *)(v13 + 32);
    BOOL v24 = __CFADD__(v23, 1);
    uint64_t v25 = v23 + 1;
    if (!v24) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_once();
  }
  *(void *)(v13 + 32) = v25;
  return result;
}

uint64_t sub_1B3865B4C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1B389C110();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x1F4188790](v7);
  uint64_t v12 = (char *)&v26 - v11;
  uint64_t v13 = (void *)*a1;
  if (*(void *)(*a1 + 24)) {
    goto LABEL_7;
  }
  uint64_t v29 = a1;
  unint64_t v2 = v13[4];
  if (qword_1EB7FA3B8 != -1) {
    goto LABEL_10;
  }
  while (1)
  {
    uint64_t v14 = sub_1B389C130();
    __swift_project_value_buffer(v14, (uint64_t)qword_1EB7FA480);
    sub_1B389C100();
    uint64_t v15 = sub_1B389C120();
    int v28 = sub_1B389C5F0();
    if (sub_1B389C630())
    {
      char v26 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
      unint64_t v16 = v2;
      unint64_t v2 = (v6 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
      v26(v9, v12, v5);
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = v3;
      uint64_t v18 = v17;
      *(_DWORD *)uint64_t v17 = 134349056;
      unint64_t v30 = v16;
      sub_1B389C6C0();
      os_signpost_id_t v19 = sub_1B389C0F0();
      _os_signpost_emit_with_name_impl(&dword_1B3850000, v15, (os_signpost_type_t)v28, v19, "bagExpiredSpan", "BagRequests=%{public}lu", v18, 0xCu);
      uint64_t v20 = v18;
      uint64_t v3 = v27;
      MEMORY[0x1B3EBAF20](v20, -1, -1);

      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
      v26(v9, v12, v5);
    }
    else
    {

      unint64_t v2 = (v6 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
      (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v12, v5);
    }
    sub_1B389C170();
    swift_allocObject();
    uint64_t v21 = sub_1B389C160();
    uint64_t v22 = *(void (**)(char *, uint64_t))(v6 + 8);
    v6 += 8;
    v22(v12, v5);
    v13[3] = v21;
    uint64_t result = swift_release();
    uint64_t v13 = (void *)*v29;
LABEL_7:
    uint64_t v23 = v13[5];
    BOOL v24 = __CFADD__(v23, 1);
    uint64_t v25 = v23 + 1;
    if (!v24) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_once();
  }
  v13[5] = v25;
  return result;
}

uint64_t sub_1B3865E24()
{
  type metadata accessor for ConfigUsageReporter.State();
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = 0u;
  *(_OWORD *)(v1 + 32) = 0u;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA8C8);
  uint64_t v2 = swift_allocObject();
  *(_DWORD *)(v2 + 24) = 0;
  *(void *)(v2 + 16) = v1;
  *(void *)(v0 + 16) = v2;
  return v0;
}

uint64_t sub_1B3865E88(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v11 = nw_activity_create();
  type metadata accessor for ResourceAccessNetworkSpan();
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = sub_1B386CF50(a3, 1, a4, a5, a6, 0, 1, a1, v11, 0, 0xE000000000000000, v12);
  return sub_1B3865F4C(v13);
}

uint64_t sub_1B3865F4C(uint64_t a1)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + 24);
  os_unfair_lock_lock(v3);
  *(void *)(v1 + 16) = a1;
  swift_retain();
  swift_release();
  os_unfair_lock_unlock(v3);

  return swift_release();
}

void sub_1B3865FB4(uint64_t *a1)
{
  uint64_t v2 = *a1;
  unint64_t v1 = a1[1];
  uint64_t v3 = (void *)a1[2];
  if (v3 && (self, (uint64_t v4 = swift_dynamicCastObjCClass()) != 0))
  {
    uint64_t v5 = (void *)v4;
    id v6 = v3;
    id v7 = objc_msgSend(v5, sel_statusCode);
    if (qword_1EB7FA3A8 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1B389C1B0();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB7FA460);
    id v9 = v6;
    uint64_t v10 = sub_1B389C190();
    os_log_type_t v11 = sub_1B389C5A0();
    if (os_log_type_enabled(v10, v11))
    {
      os_log_type_t type = v11;
      uint64_t v12 = swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      uint64_t v34 = v32;
      *(_DWORD *)uint64_t v12 = 134218242;
      sub_1B389C6C0();
      *(_WORD *)(v12 + 12) = 2080;
      id v13 = objc_msgSend(v5, sel_debugDescription);
      uint64_t v14 = v9;
      id v15 = v7;
      uint64_t v16 = sub_1B389C2B0();
      unint64_t v18 = v17;

      uint64_t v19 = v16;
      id v7 = v15;
      id v9 = v14;
      sub_1B3855F24(v19, v18, &v34);
      sub_1B389C6C0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B3850000, v10, type, "config request status code: %ld, response: %s", (uint8_t *)v12, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1B3EBAF20](v32, -1, -1);
      MEMORY[0x1B3EBAF20](v12, -1, -1);
    }
    else
    {
    }
    if (v7 != (id)200)
    {
      sub_1B386C3F8();
      swift_allocError();
      *(void *)uint64_t v30 = v7;
      *(_WORD *)(v30 + 8) = 0;
      swift_willThrow();
    }
  }
  else
  {
    if (qword_1EB7FA3A8 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_1B389C1B0();
    __swift_project_value_buffer(v20, (uint64_t)qword_1EB7FA460);
    sub_1B386CEF8(v2, v1);
    id v21 = v3;
    swift_bridgeObjectRetain();
    sub_1B386CEF8(v2, v1);
    id v22 = v21;
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_1B389C190();
    os_log_type_t v24 = sub_1B389C590();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      uint64_t v34 = v33;
      *(_DWORD *)uint64_t v25 = 136315138;
      id v26 = v22;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CCEE10);
      uint64_t v27 = sub_1B389C300();
      sub_1B3855F24(v27, v28, &v34);
      sub_1B389C6C0();
      swift_bridgeObjectRelease();
      sub_1B386CE50(v2, v1);
      swift_bridgeObjectRelease();

      sub_1B386CE50(v2, v1);
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1B3850000, v23, v24, "UNIDENTIFIED_RESPONSE_TYPE %s", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B3EBAF20](v33, -1, -1);
      MEMORY[0x1B3EBAF20](v25, -1, -1);
    }
    else
    {
      sub_1B386CE50(v2, v1);
      swift_bridgeObjectRelease();

      sub_1B386CE50(v2, v1);
      swift_bridgeObjectRelease();
    }
    sub_1B386C3F8();
    swift_allocError();
    *(void *)uint64_t v29 = 4;
    *(_WORD *)(v29 + 8) = 256;
    swift_willThrow();
  }
}

id sub_1B386647C()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = self;
  unint64_t v1 = (void *)sub_1B389BD30();
  v11[0] = 0;
  id v2 = objc_msgSend(v0, sel_JSONObjectWithData_options_error_, v1, 1, v11);

  id v3 = v11[0];
  if (v2)
  {
    sub_1B389C730();
    swift_unknownObjectRelease();
    sub_1B3855FF8((uint64_t)v12, (uint64_t)v11);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FAB70);
    if ((swift_dynamicCast() & 1) != 0
      && (id v2 = (id)v10,
          uint64_t v4 = _s20PegasusConfiguration0A25ConfigControllerInternalsV05cleanC7OfNullsySDySSypGSgAEFZ_0(v10),
          swift_bridgeObjectRelease(),
          v4))
    {
      sub_1B3883328(v4);
      id v2 = v5;
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
    }
    else
    {
      sub_1B386C3F8();
      swift_allocError();
      *(void *)uint64_t v6 = 5;
      *(_WORD *)(v6 + 8) = 256;
      swift_willThrow();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
    }
  }
  else
  {
    id v7 = v3;
    id v2 = (id)sub_1B389BC00();

    swift_willThrow();
    sub_1B386C3F8();
    swift_allocError();
    *(void *)uint64_t v8 = v2;
    *(_WORD *)(v8 + 8) = 149;
    swift_willThrow();
  }
  return v2;
}

uint64_t sub_1B3866660(void *a1)
{
  id v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FAB08);
  if (!OUTLINED_FUNCTION_69()) {
    return sub_1B389BBF0();
  }
  id v2 = sub_1B385E21C(v4, v5 | (v6 << 8));
  sub_1B386CB80(v4, v5, v6);
  return (uint64_t)v2;
}

uint64_t sub_1B38666F8()
{
  id v1 = *(os_unfair_lock_s **)(v0 + 24);
  os_unfair_lock_lock(v1);
  uint64_t v2 = *(void *)(v0 + 16);
  swift_retain();
  os_unfair_lock_unlock(v1);
  return v2;
}

uint64_t _s20PegasusConfiguration0A25ConfigControllerInternalsV05cleanC7OfNullsySDySSypGSgAEFZ_0(uint64_t a1)
{
  v3[3] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FAB70);
  v3[0] = a1;
  swift_bridgeObjectRetain();
  sub_1B38667E0((uint64_t)v3, (uint64_t)v4);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v3);
  if (v5)
  {
    if (swift_dynamicCast()) {
      return v3[0];
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_1B386D330((uint64_t)v4, &qword_1EB7FBE60);
    return 0;
  }
}

uint64_t sub_1B38667E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_1B3855FF8(a1, (uint64_t)v19);
  sub_1B3859FE4(0, (unint64_t *)&unk_1EB7FA8A0);
  if (swift_dynamicCast())
  {

    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  else
  {
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA878);
    if (swift_dynamicCast())
    {
      uint64_t v5 = *(void *)(v18 + 16);
      if (v5)
      {
        uint64_t v6 = v18 + 32;
        swift_bridgeObjectRetain();
        uint64_t v7 = MEMORY[0x1E4FBC860];
        do
        {
          sub_1B3855FF8(v6, (uint64_t)v17);
          sub_1B38667E0(&v14, v17);
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v17);
          if (v15)
          {
            sub_1B386D320(&v14, v16);
            sub_1B386D320(v16, &v14);
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_1B388E350();
              uint64_t v7 = v9;
            }
            unint64_t v8 = *(void *)(v7 + 16);
            if (v8 >= *(void *)(v7 + 24) >> 1)
            {
              sub_1B388E350();
              uint64_t v7 = v10;
            }
            *(void *)(v7 + 16) = v8 + 1;
            sub_1B386D320(&v14, (_OWORD *)(v7 + 32 * v8 + 32));
          }
          else
          {
            sub_1B386D330((uint64_t)&v14, &qword_1EB7FBE60);
          }
          v6 += 32;
          --v5;
        }
        while (v5);
        swift_bridgeObjectRelease_n();
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v7 = MEMORY[0x1E4FBC860];
      }
      *(void *)(a2 + 24) = v4;
      *(void *)a2 = v7;
    }
    else
    {
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FAB70);
      if (swift_dynamicCast())
      {
        uint64_t v12 = sub_1B3866A40();
        swift_bridgeObjectRelease();
        *(void *)(a2 + 24) = v11;
        *(void *)a2 = v12;
      }
      else
      {
        sub_1B3855FF8(a1, a2);
      }
    }
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
}

uint64_t sub_1B3866A40()
{
  uint64_t v0 = MEMORY[0x1E4FBC868];
  uint64_t v36 = MEMORY[0x1E4FBC868];
  sub_1B38731B0(v37);
  uint64_t v1 = v37[0];
  int64_t v2 = v37[3];
  unint64_t v3 = v37[4];
  uint64_t v25 = v37[1];
  int64_t v26 = (unint64_t)(v37[2] + 64) >> 6;
  uint64_t v38 = &v30;
  for (uint64_t result = swift_bridgeObjectRetain(); ; uint64_t result = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v38))
  {
    while (1)
    {
      if (v3)
      {
        unint64_t v5 = __clz(__rbit64(v3));
        v3 &= v3 - 1;
        unint64_t v6 = v5 | (v2 << 6);
      }
      else
      {
        int64_t v7 = v2 + 1;
        if (__OFADD__(v2, 1)) {
          goto LABEL_36;
        }
        if (v7 >= v26) {
          goto LABEL_34;
        }
        unint64_t v8 = *(void *)(v25 + 8 * v7);
        int64_t v9 = v2 + 1;
        if (!v8)
        {
          int64_t v9 = v2 + 2;
          if (v2 + 2 >= v26) {
            goto LABEL_34;
          }
          unint64_t v8 = *(void *)(v25 + 8 * v9);
          if (!v8)
          {
            int64_t v9 = v2 + 3;
            if (v2 + 3 >= v26) {
              goto LABEL_34;
            }
            unint64_t v8 = *(void *)(v25 + 8 * v9);
            if (!v8)
            {
              int64_t v9 = v2 + 4;
              if (v2 + 4 >= v26) {
                goto LABEL_34;
              }
              unint64_t v8 = *(void *)(v25 + 8 * v9);
              if (!v8)
              {
                int64_t v9 = v2 + 5;
                if (v2 + 5 >= v26) {
                  goto LABEL_34;
                }
                unint64_t v8 = *(void *)(v25 + 8 * v9);
                if (!v8)
                {
                  int64_t v10 = v2 + 6;
                  while (v10 < v26)
                  {
                    unint64_t v8 = *(void *)(v25 + 8 * v10++);
                    if (v8)
                    {
                      int64_t v9 = v10 - 1;
                      goto LABEL_19;
                    }
                  }
LABEL_34:
                  sub_1B386D380();
                  return v0;
                }
              }
            }
          }
        }
LABEL_19:
        unint64_t v3 = (v8 - 1) & v8;
        unint64_t v6 = __clz(__rbit64(v8)) + (v9 << 6);
        int64_t v2 = v9;
      }
      uint64_t v11 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v6);
      uint64_t v13 = *v11;
      uint64_t v12 = v11[1];
      sub_1B3855FF8(*(void *)(v1 + 56) + 32 * v6, (uint64_t)v35);
      *(void *)&long long v34 = v13;
      *((void *)&v34 + 1) = v12;
      long long v32 = v34;
      v33[0] = v35[0];
      v33[1] = v35[1];
      swift_bridgeObjectRetain();
      sub_1B38667E0(&v27, v33);
      if (v28) {
        break;
      }
      sub_1B386D330((uint64_t)&v32, &qword_1E9CCEE40);
      uint64_t result = sub_1B386D330((uint64_t)&v27, &qword_1EB7FBE60);
    }
    sub_1B386D320(&v27, v31);
    long long v14 = v32;
    v29[2] = v32;
    sub_1B386D320(v33, v38);
    sub_1B386D320(v31, v29);
    unint64_t v15 = *(void *)(v0 + 16);
    if (*(void *)(v0 + 24) <= v15)
    {
      sub_1B386C444(v15 + 1, 1);
      uint64_t v0 = v36;
    }
    sub_1B389CA10();
    sub_1B389C370();
    uint64_t result = sub_1B389CA40();
    uint64_t v16 = v0 + 64;
    uint64_t v17 = -1 << *(unsigned char *)(v0 + 32);
    unint64_t v18 = result & ~v17;
    unint64_t v19 = v18 >> 6;
    if (((-1 << v18) & ~*(void *)(v0 + 64 + 8 * (v18 >> 6))) == 0) {
      break;
    }
    unint64_t v20 = __clz(__rbit64((-1 << v18) & ~*(void *)(v0 + 64 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0;
LABEL_33:
    *(void *)(v16 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    *(_OWORD *)(*(void *)(v0 + 48) + 16 * v20) = v14;
    sub_1B386D320(v29, (_OWORD *)(*(void *)(v0 + 56) + 32 * v20));
    ++*(void *)(v0 + 16);
  }
  char v21 = 0;
  unint64_t v22 = (unint64_t)(63 - v17) >> 6;
  while (++v19 != v22 || (v21 & 1) == 0)
  {
    BOOL v23 = v19 == v22;
    if (v19 == v22) {
      unint64_t v19 = 0;
    }
    v21 |= v23;
    uint64_t v24 = *(void *)(v16 + 8 * v19);
    if (v24 != -1)
    {
      unint64_t v20 = __clz(__rbit64(~v24)) + (v19 << 6);
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

size_t sub_1B3866DAC(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5, int a6, uint64_t a7)
{
  uint64_t v263 = a7;
  LODWORD(v274) = a6;
  v270 = a4;
  uint64_t v269 = a3;
  v275 = a2;
  uint64_t v268 = a1;
  v282[5] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v7 = sub_1B389BE20();
  os_log_t v272 = *(os_log_t *)(v7 - 8);
  uint64_t v273 = v7;
  MEMORY[0x1F4188790](v7);
  v271 = (void **)((char *)&v251 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
  uint64_t v10 = MEMORY[0x1F4188790](v9 - 8);
  v257 = (char *)&v251 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  uint64_t v261 = (uint64_t)&v251 - v13;
  MEMORY[0x1F4188790](v12);
  unint64_t v15 = (char *)&v251 - v14;
  uint64_t v16 = sub_1B389BD00();
  uint64_t v17 = *(void **)(v16 - 8);
  uint64_t v18 = MEMORY[0x1F4188790](v16);
  v260 = (char *)&v251 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x1F4188790](v18);
  v256 = (char *)&v251 - v21;
  uint64_t v22 = MEMORY[0x1F4188790](v20);
  v255 = (char *)&v251 - v23;
  uint64_t v24 = MEMORY[0x1F4188790](v22);
  v267 = (char *)&v251 - v25;
  uint64_t v26 = MEMORY[0x1F4188790](v24);
  v265 = (char *)&v251 - v27;
  uint64_t v28 = MEMORY[0x1F4188790](v26);
  v259 = (char *)&v251 - v29;
  uint64_t v30 = MEMORY[0x1F4188790](v28);
  v258 = (char *)&v251 - v31;
  uint64_t v32 = MEMORY[0x1F4188790](v30);
  v262 = (char *)&v251 - v33;
  uint64_t v34 = MEMORY[0x1F4188790](v32);
  v264 = (char *)&v251 - v35;
  uint64_t v36 = MEMORY[0x1F4188790](v34);
  v266 = (unint64_t *)((char *)&v251 - v37);
  uint64_t v38 = MEMORY[0x1F4188790](v36);
  uint64_t v40 = (char *)&v251 - v39;
  MEMORY[0x1F4188790](v38);
  v276 = (char *)&v251 - v41;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA930);
  uint64_t v42 = swift_allocObject();
  *(_OWORD *)(v42 + 16) = xmmword_1B389D510;
  id v43 = objc_msgSend(self, sel_processInfo);
  id v44 = objc_msgSend(v43, sel_globallyUniqueString);

  uint64_t v45 = sub_1B389C2B0();
  uint64_t v47 = v46;

  uint64_t v48 = MEMORY[0x1E4FBB1A0];
  *(void *)(v42 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v49 = sub_1B38579B4();
  *(void *)(v42 + 32) = v45;
  *(void *)(v42 + 40) = v47;
  *(void *)(v42 + 96) = v48;
  *(void *)(v42 + 104) = v49;
  *(void *)(v42 + 64) = v49;
  *(void *)(v42 + 72) = 0x73696C702E676162;
  *(void *)(v42 + 80) = 0xE900000000000074;
  uint64_t v50 = sub_1B389C2D0();
  unint64_t v52 = v51;
  __swift_instantiateConcreteTypeFromMangledName(qword_1EB7FA650);
  swift_allocObject();
  uint64_t v53 = (void *)swift_retain();
  uint64_t v277 = sub_1B386BB90(v53, 6, 0);
  sub_1B3859FE4(0, &qword_1EB7FA898);
  uint64_t v54 = NSTemporaryDirectory();
  sub_1B389C2B0();

  id v55 = sub_1B3869314();
  uint64_t v56 = (void *)sub_1B389C280();
  id v57 = objc_msgSend(v55, sel_URLByAppendingPathComponent_, v56);

  if (!v57)
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v15, 1, 1, v16);
    goto LABEL_13;
  }
  sub_1B389BC90();

  uint64_t v58 = (void (*)(char *, char *, uint64_t))v17[4];
  v58(v15, v40, v16);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v16);
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16) == 1)
  {
LABEL_13:
    sub_1B386D330((uint64_t)v15, (uint64_t *)&unk_1EB7FBF88);
    if (qword_1EB7FA3A8 != -1) {
      swift_once();
    }
    uint64_t v83 = sub_1B389C1B0();
    __swift_project_value_buffer(v83, (uint64_t)qword_1EB7FA460);
    swift_bridgeObjectRetain();
    uint64_t v84 = sub_1B389C190();
    os_log_type_t v85 = sub_1B389C5B0();
    if (os_log_type_enabled(v84, v85))
    {
      uint64_t v86 = (uint8_t *)swift_slowAlloc();
      long long v87 = (void *)swift_slowAlloc();
      v282[0] = v87;
      *(_DWORD *)uint64_t v86 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v279 = sub_1B3855F24(v50, v52, (uint64_t *)v282);
      sub_1B389C6C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1B3850000, v84, v85, "error creating temporary config file: %s", v86, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B3EBAF20](v87, -1, -1);
      MEMORY[0x1B3EBAF20](v86, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_1B386C83C();
    uint64_t v88 = (void *)swift_allocError();
    unsigned char *v89 = 6;
    sub_1B386BBE4(v88);

    swift_release();
    return 0;
  }
  swift_bridgeObjectRelease();
  uint64_t v59 = v276;
  v253 = (void (*)(char *, uint64_t, uint64_t))v58;
  v58(v276, v15, v16);
  sub_1B3859FE4(0, (unint64_t *)&unk_1EB7FA888);
  unint64_t v60 = (void (*)(char *, char *, uint64_t))v17[2];
  v60(v40, v59, v16);
  unint64_t v61 = (char *)sub_1B3869484((uint64_t)v40, 0);
  if (!v61)
  {
    if (qword_1EB7FA3A8 != -1) {
      swift_once();
    }
    uint64_t v91 = sub_1B389C1B0();
    __swift_project_value_buffer(v91, (uint64_t)qword_1EB7FA460);
    uint64_t v92 = v267;
    v60(v267, v59, v16);
    uint64_t v93 = sub_1B389C190();
    os_log_type_t v94 = sub_1B389C5B0();
    if (os_log_type_enabled(v93, v94))
    {
      uint64_t v95 = v16;
      uint64_t v96 = (uint8_t *)swift_slowAlloc();
      uint64_t v97 = (void *)swift_slowAlloc();
      v282[0] = v97;
      *(_DWORD *)uint64_t v96 = 136315138;
      uint64_t v98 = sub_1B389BC40();
      uint64_t v279 = sub_1B3855F24(v98, v99, (uint64_t *)v282);
      sub_1B389C6C0();
      swift_bridgeObjectRelease();
      char v100 = (void (*)(char *, uint64_t))v17[1];
      v100(v92, v95);
      _os_log_impl(&dword_1B3850000, v93, v94, "error opening config cache output stream: %s", v96, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B3EBAF20](v97, -1, -1);
      v101 = v96;
      uint64_t v16 = v95;
      uint64_t v59 = v276;
      MEMORY[0x1B3EBAF20](v101, -1, -1);
    }
    else
    {
      char v100 = (void (*)(char *, uint64_t))v17[1];
      v100(v92, v16);
    }

    sub_1B386C83C();
    v111 = (void *)swift_allocError();
    *uint64_t v112 = 3;
    sub_1B386BBE4(v111);
    swift_release();
    v100(v59, v16);

    return 0;
  }
  v251 = v17 + 2;
  v254 = v17;
  v267 = v61;
  objc_msgSend(v61, sel_open);
  uint64_t v278 = v268;
  uint64_t v279 = 0xD000000000000012;
  unint64_t v280 = 0x80000001B38A1DB0;
  swift_bridgeObjectRetain();
  sub_1B389C760();
  id v62 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, 0.0);
  uint64_t v63 = sub_1B3859FE4(0, (unint64_t *)&qword_1EB7FBDD0);
  uint64_t v281 = v63;
  uint64_t v279 = (uint64_t)v62;
  sub_1B3871B3C((uint64_t)&v279, (uint64_t)v282);
  if (qword_1EB7FAB90 != -1) {
    swift_once();
  }
  v252 = (void (*)(unint64_t *, char *, uint64_t))v60;
  uint64_t v279 = qword_1EB7FC150;
  unint64_t v280 = *(void *)algn_1EB7FC158;
  swift_bridgeObjectRetain();
  uint64_t v64 = MEMORY[0x1E4FBB1A0];
  sub_1B389C760();
  uint64_t v66 = v271;
  os_log_t v65 = v272;
  if (qword_1EB7FA7B8 != -1) {
    swift_once();
  }
  uint64_t v268 = v16;
  sub_1B389BDA0();
  sub_1B389BDD0();
  double v68 = v67;
  isa = (void (*)(void, void))v65[1].isa;
  uint64_t v70 = v273;
  isa(v66, v273);
  id v71 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v68);
  uint64_t v281 = v63;
  uint64_t v279 = (uint64_t)v71;
  sub_1B3871B3C((uint64_t)&v279, (uint64_t)v282);
  if (qword_1E9CCEB28 != -1) {
    swift_once();
  }
  uint64_t v279 = qword_1E9CCF630;
  unint64_t v280 = *(void *)algn_1E9CCF638;
  swift_bridgeObjectRetain();
  sub_1B389C760();
  uint64_t v281 = v64;
  uint64_t v279 = v269;
  unint64_t v280 = (unint64_t)v270;
  swift_bridgeObjectRetain();
  sub_1B3871B3C((uint64_t)&v279, (uint64_t)v282);
  uint64_t v279 = 0xD000000000000011;
  unint64_t v280 = 0x80000001B38A1D90;
  sub_1B389C760();
  sub_1B389BE10();
  sub_1B389BDD0();
  double v73 = v72;
  isa(v66, v70);
  id v74 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v73);
  uint64_t v281 = v63;
  uint64_t v279 = (uint64_t)v74;
  sub_1B3871B3C((uint64_t)&v279, (uint64_t)v282);
  uint64_t v75 = swift_checkMetadataState;
  if ((v274 & 1) == 0)
  {
    uint64_t v102 = v276;
    if (qword_1EB7FA3A8 != -1) {
      swift_once();
    }
    uint64_t v103 = sub_1B389C1B0();
    __swift_project_value_buffer(v103, (uint64_t)qword_1EB7FA460);
    uint64_t v104 = sub_1B389C190();
    os_log_type_t v105 = sub_1B389C5D0();
    if (os_log_type_enabled(v104, v105))
    {
      uint64_t v106 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v106 = 0;
      _os_log_impl(&dword_1B3850000, v104, v105, "skipped saving config because flag is disabled", v106, 2u);
      MEMORY[0x1B3EBAF20](v106, -1, -1);
    }

    v107 = self;
    char v108 = (void *)sub_1B389C200();
    swift_bridgeObjectRelease();
    v282[0] = 0;
    id v109 = objc_msgSend(v107, sel_dataWithPropertyList_format_options_error_, v108, 200, 0, v282);

    id v110 = v282[0];
    if (v109)
    {
      size_t v124 = sub_1B389BD40();

      sub_1B3869388(v275);
      swift_release();
      ((void (*)(char *, uint64_t))v254[1])(v102, v268);
      return v124;
    }
    uint64_t v114 = v110;
    uint64_t v115 = (void *)sub_1B389BC00();

    swift_willThrow();
    id v116 = v115;
    id v117 = v115;
    uint64_t v118 = sub_1B389C190();
    os_log_type_t v119 = sub_1B389C5B0();
    if (os_log_type_enabled(v118, v119))
    {
      uint64_t v120 = (uint8_t *)swift_slowAlloc();
      uint64_t v121 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v120 = 138412290;
      id v122 = v115;
      v123 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v282[0] = v123;
      sub_1B389C6C0();
      *uint64_t v121 = v123;

      _os_log_impl(&dword_1B3850000, v118, v119, "error formatting config %@", v120, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CCED90);
      swift_arrayDestroy();
      MEMORY[0x1B3EBAF20](v121, -1, -1);
      MEMORY[0x1B3EBAF20](v120, -1, -1);
    }
    else
    {
    }
    sub_1B386BBE4(v115);

    sub_1B3869388(v275);
    swift_release();
    ((void (*)(char *, uint64_t))v254[1])(v102, v268);
    return 0;
  }
  uint64_t v76 = self;
  uint64_t v77 = (void *)sub_1B389C200();
  swift_bridgeObjectRelease();
  uint64_t v78 = v267;
  id v79 = objc_msgSend(v76, sel_writePropertyList_toStream_format_options_error_, v77, v267, 200, 0, 0);

  objc_msgSend(v78, sel_close);
  sub_1B3859FE4(0, &qword_1EB7FAA60);
  uint64_t v80 = (uint64_t)v266;
  uint64_t v81 = v276;
  uint64_t v82 = v268;
  v252(v266, v276, v268);
  id v113 = sub_1B3869528(v80);
  size_t v124 = sub_1B38933FC();
  uint64_t v126 = v125;

  uint64_t v127 = v261;
  sub_1B385A0AC(v263, v261, (uint64_t *)&unk_1EB7FBF88);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v127, 1, v82);
  if (EnumTagSinglePayload == 1)
  {
    sub_1B386D330(v127, (uint64_t *)&unk_1EB7FBF88);
    if (qword_1EB7FA3A8 != -1) {
      swift_once();
    }
    uint64_t v129 = sub_1B389C1B0();
    __swift_project_value_buffer(v129, (uint64_t)qword_1EB7FA460);
    v130 = sub_1B389C190();
    os_log_type_t v131 = sub_1B389C5B0();
    if (os_log_type_enabled(v130, v131))
    {
      v132 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v132 = 0;
      _os_log_impl(&dword_1B3850000, v130, v131, "error getting pathToCache for config.plist", v132, 2u);
      MEMORY[0x1B3EBAF20](v132, -1, -1);
    }

    sub_1B386C83C();
    v133 = (void *)swift_allocError();
    unsigned char *v134 = 8;
    sub_1B386BBE4(v133);

    sub_1B3869388(v275);
    swift_release();
    ((void (*)(char *, uint64_t))v254[1])(v81, v82);
    return v124;
  }
  uint64_t v273 = v126;
  size_t v274 = v124;
  v253(v264, v127, v82);
  sub_1B389BC80();
  sub_1B389BC40();
  v135 = (void *)sub_1B389C280();
  swift_bridgeObjectRelease();
  v136 = v275;
  unsigned __int8 v137 = objc_msgSend(v275, sel_fileExistsAtPath_, v135);

  v138 = v260;
  if ((v137 & 1) == 0)
  {
    v139 = (void *)sub_1B389BC50();
    v282[0] = 0;
    unsigned int v140 = objc_msgSend(v136, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v139, 1, 0, v282);

    if (v140)
    {
      id v141 = v282[0];
    }
    else
    {
      id v142 = v282[0];
      v143 = (void *)sub_1B389BC00();

      swift_willThrow();
      if (qword_1EB7FA3A8 != -1) {
        swift_once();
      }
      uint64_t v144 = sub_1B389C1B0();
      __swift_project_value_buffer(v144, (uint64_t)qword_1EB7FA460);
      id v145 = v143;
      id v146 = v143;
      v147 = sub_1B389C190();
      os_log_type_t v148 = sub_1B389C5B0();
      if (os_log_type_enabled(v147, v148))
      {
        v149 = (uint8_t *)swift_slowAlloc();
        os_log_t v272 = (os_log_t)swift_slowAlloc();
        *(_DWORD *)v149 = 138412290;
        v271 = v149 + 4;
        id v150 = v143;
        v151 = (void *)_swift_stdlib_bridgeErrorToNSError();
        v282[0] = v151;
        sub_1B389C6C0();
        os_log_t v152 = v272;
        v272->isa = (Class)v151;
        uint64_t v81 = v276;

        _os_log_impl(&dword_1B3850000, v147, v148, "error creating pegasus configd cache folder: %@", v149, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CCED90);
        swift_arrayDestroy();
        MEMORY[0x1B3EBAF20](v152, -1, -1);
        MEMORY[0x1B3EBAF20](v149, -1, -1);
      }
      else
      {
      }
      v138 = v260;

      sub_1B386BBE4(v143);
      v136 = v275;
    }
  }
  v153 = (void *)sub_1B389BC50();
  v282[0] = 0;
  unsigned int v154 = objc_msgSend(v136, sel_removeItemAtURL_error_, v153, v282);

  if (v154)
  {
    id v155 = v282[0];
  }
  else
  {
    id v156 = v282[0];
    v157 = (void *)sub_1B389BC00();

    swift_willThrow();
  }
  v158 = (void *)sub_1B389BC50();
  v159 = (void *)sub_1B389BC50();
  v282[0] = 0;
  unsigned int v160 = objc_msgSend(v136, sel_copyItemAtURL_toURL_error_, v158, v159, v282);

  id v161 = v282[0];
  if (v160)
  {
    sub_1B386BBB8((uint64_t)v79);
    id v162 = v161;
    uint64_t v163 = v268;
    v164 = v264;
  }
  else
  {
    id v165 = v282[0];
    v166 = (void *)sub_1B389BC00();

    swift_willThrow();
    if (qword_1EB7FA3A8 != -1) {
      swift_once();
    }
    uint64_t v167 = sub_1B389C1B0();
    __swift_project_value_buffer(v167, (uint64_t)qword_1EB7FA460);
    v168 = v255;
    uint64_t v163 = v268;
    v169 = (void (*)(char *, char *, uint64_t))v252;
    v252((unint64_t *)v255, v81, v268);
    v170 = v256;
    v169(v256, v264, v163);
    id v171 = v166;
    id v172 = v166;
    v173 = sub_1B389C190();
    os_log_type_t v174 = sub_1B389C5B0();
    int v175 = v174;
    os_log_t v272 = v173;
    if (os_log_type_enabled(v173, v174))
    {
      uint64_t v176 = swift_slowAlloc();
      v270 = (void *)swift_slowAlloc();
      v271 = (void *)swift_slowAlloc();
      v282[0] = v271;
      *(_DWORD *)uint64_t v176 = 136315650;
      uint64_t v177 = sub_1B389BC40();
      uint64_t v279 = sub_1B3855F24(v177, v178, (uint64_t *)v282);
      v266 = &v280;
      sub_1B389C6C0();
      swift_bridgeObjectRelease();
      LODWORD(v269) = v175;
      v179 = (void (*)(char *, uint64_t))v254[1];
      v179(v168, v268);
      *(_WORD *)(v176 + 12) = 2080;
      uint64_t v180 = sub_1B389BC40();
      uint64_t v279 = sub_1B3855F24(v180, v181, (uint64_t *)v282);
      sub_1B389C6C0();
      swift_bridgeObjectRelease();
      uint64_t v75 = swift_checkMetadataState;
      v179(v170, v268);
      v182 = v260;
      v164 = v264;
      *(_WORD *)(v176 + 22) = 2112;
      id v183 = v166;
      uint64_t v184 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v279 = v184;
      v138 = v182;
      sub_1B389C6C0();
      v185 = v270;
      void *v270 = v184;
      uint64_t v81 = v276;

      os_log_t v186 = v272;
      _os_log_impl(&dword_1B3850000, v272, (os_log_type_t)v269, "error copying config from %s to %s: %@", (uint8_t *)v176, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CCED90);
      swift_arrayDestroy();
      MEMORY[0x1B3EBAF20](v185, -1, -1);
      v187 = v271;
      swift_arrayDestroy();
      MEMORY[0x1B3EBAF20](v187, -1, -1);
      uint64_t v188 = v176;
      uint64_t v163 = v268;
      MEMORY[0x1B3EBAF20](v188, -1, -1);
    }
    else
    {

      v189 = (void (*)(char *, uint64_t))v254[1];
      v189(v168, v163);
      v189(v170, v163);

      v164 = v264;
      v138 = v260;
    }
  }
  v190 = (void *)sub_1B389BC50();
  v282[0] = 0;
  unsigned int v191 = objc_msgSend(v275, sel_removeItemAtURL_error_, v190, v282);

  if (v191)
  {
    id v192 = v282[0];
  }
  else
  {
    id v193 = v282[0];
    v194 = (void *)sub_1B389BC00();

    swift_willThrow();
    if (qword_1EB7FA3A8 != -1) {
      swift_once();
    }
    uint64_t v195 = sub_1B389C1B0();
    __swift_project_value_buffer(v195, (uint64_t)qword_1EB7FA460);
    v252((unint64_t *)v138, v81, v163);
    id v196 = v194;
    id v197 = v194;
    v198 = sub_1B389C190();
    os_log_type_t v199 = sub_1B389C5B0();
    if (!os_log_type_enabled(v198, v199))
    {

      ((void (*)(char *, uint64_t))v254[1])(v138, v163);
      v208 = v258;
      uint64_t v209 = (uint64_t)v257;
      v210 = v253;
      v164 = v264;
      goto LABEL_70;
    }
    uint64_t v200 = swift_slowAlloc();
    v271 = (void *)swift_slowAlloc();
    os_log_t v272 = (os_log_t)swift_slowAlloc();
    v282[0] = v272;
    *(_DWORD *)uint64_t v200 = 136315394;
    uint64_t v201 = sub_1B389BC40();
    uint64_t v279 = sub_1B3855F24(v201, v202, (uint64_t *)v282);
    sub_1B389C6C0();
    swift_bridgeObjectRelease();
    ((void (*)(char *, uint64_t))v254[1])(v138, v268);
    *(_WORD *)(v200 + 12) = 2112;
    id v203 = v194;
    uint64_t v204 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v279 = v204;
    uint64_t v81 = v276;
    sub_1B389C6C0();
    v205 = v271;
    void *v271 = v204;

    _os_log_impl(&dword_1B3850000, v198, v199, "error removing temporary config from %s: %@", (uint8_t *)v200, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CCED90);
    swift_arrayDestroy();
    v164 = v264;
    MEMORY[0x1B3EBAF20](v205, -1, -1);
    os_log_t v206 = v272;
    swift_arrayDestroy();
    MEMORY[0x1B3EBAF20](v206, -1, -1);
    uint64_t v207 = v200;
    uint64_t v163 = v268;
    MEMORY[0x1B3EBAF20](v207, -1, -1);
  }
  v208 = v258;
  uint64_t v209 = (uint64_t)v257;
  v210 = v253;
LABEL_70:
  uint64_t v211 = type metadata accessor for LocalCachePaths(0);
  sub_1B385A0AC(v263 + *(int *)(v211 + 20), v209, (uint64_t *)&unk_1EB7FBF88);
  if (__swift_getEnumTagSinglePayload(v209, 1, v163) == 1)
  {
    v212 = (void (*)(char *, uint64_t))v254[1];
    v212(v262, v163);
    v212(v164, v163);
    sub_1B386D330(v209, (uint64_t *)&unk_1EB7FBF88);
  }
  else
  {
    v210(v208, v209, v163);
    sub_1B389BC80();
    sub_1B389BC40();
    v213 = (void *)sub_1B389C280();
    swift_bridgeObjectRelease();
    v214 = v275;
    unsigned __int8 v215 = objc_msgSend(v275, sel_fileExistsAtPath_, v213);

    if ((v215 & 1) == 0)
    {
      v216 = (void *)sub_1B389BC50();
      v282[0] = 0;
      unsigned int v217 = objc_msgSend(v214, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v216, 1, 0, v282);

      if (v217)
      {
        id v218 = v282[0];
      }
      else
      {
        id v219 = v282[0];
        v220 = (void *)sub_1B389BC00();

        swift_willThrow();
        if (qword_1EB7FA3A8 != -1) {
          swift_once();
        }
        uint64_t v221 = sub_1B389C1B0();
        __swift_project_value_buffer(v221, (uint64_t)qword_1EB7FA460);
        id v222 = v220;
        id v223 = v220;
        v224 = sub_1B389C190();
        os_log_type_t v225 = sub_1B389C5B0();
        if (os_log_type_enabled(v224, v225))
        {
          v226 = (uint8_t *)swift_slowAlloc();
          v227 = (void *)swift_slowAlloc();
          *(_DWORD *)v226 = *((void *)v75 + 166);
          id v228 = v220;
          v229 = (void *)_swift_stdlib_bridgeErrorToNSError();
          v282[0] = v229;
          v164 = v264;
          sub_1B389C6C0();
          void *v227 = v229;
          v208 = v258;

          _os_log_impl(&dword_1B3850000, v224, v225, "error creating bag copy folder: %@", v226, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CCED90);
          swift_arrayDestroy();
          v230 = v227;
          uint64_t v81 = v276;
          MEMORY[0x1B3EBAF20](v230, -1, -1);
          MEMORY[0x1B3EBAF20](v226, -1, -1);
        }
        else
        {
        }
        uint64_t v163 = v268;
      }
      v214 = v275;
    }
    v231 = (void *)sub_1B389BC50();
    v282[0] = 0;
    unsigned int v232 = objc_msgSend(v214, sel_removeItemAtURL_error_, v231, v282);

    if (v232)
    {
      id v233 = v282[0];
    }
    else
    {
      id v234 = v282[0];
      v235 = (void *)sub_1B389BC00();

      swift_willThrow();
    }
    v236 = (void *)sub_1B389BC50();
    v237 = (void *)sub_1B389BC50();
    v282[0] = 0;
    unsigned int v238 = objc_msgSend(v275, sel_copyItemAtURL_toURL_error_, v236, v237, v282);

    if (v238)
    {
      v212 = (void (*)(char *, uint64_t))v254[1];
      id v239 = v282[0];
      v212(v259, v163);
      v212(v208, v163);
      v212(v262, v163);
      v212(v164, v163);
    }
    else
    {
      id v240 = v282[0];
      v241 = (void *)sub_1B389BC00();

      swift_willThrow();
      if (qword_1EB7FA3A8 != -1) {
        swift_once();
      }
      uint64_t v242 = sub_1B389C1B0();
      __swift_project_value_buffer(v242, (uint64_t)qword_1EB7FA460);
      id v243 = v241;
      id v244 = v241;
      v245 = sub_1B389C190();
      os_log_type_t v246 = sub_1B389C5B0();
      if (os_log_type_enabled(v245, v246))
      {
        v247 = (uint8_t *)swift_slowAlloc();
        v248 = (void *)swift_slowAlloc();
        *(_DWORD *)v247 = *((void *)v75 + 166);
        id v249 = v241;
        v250 = (void *)_swift_stdlib_bridgeErrorToNSError();
        v282[0] = v250;
        v164 = v264;
        sub_1B389C6C0();
        void *v248 = v250;
        v208 = v258;

        _os_log_impl(&dword_1B3850000, v245, v246, "Copy bag to location failed with error: %@", v247, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CCED90);
        swift_arrayDestroy();
        MEMORY[0x1B3EBAF20](v248, -1, -1);
        MEMORY[0x1B3EBAF20](v247, -1, -1);
      }
      else
      {
      }
      v212 = (void (*)(char *, uint64_t))v254[1];
      uint64_t v163 = v268;
      v212(v259, v268);
      v212(v208, v163);
      v212(v262, v163);
      v212(v164, v163);
    }
  }
  sub_1B3869388(v275);

  swift_release();
  v212(v81, v163);
  return v274;
}

id sub_1B3869314()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_1B389C280();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initFileURLWithPath_, v1);

  return v2;
}

void sub_1B3869388(void *a1)
{
  v7[1] = *(id *)MEMORY[0x1E4F143B8];
  id v2 = (void *)sub_1B389BC50();
  v7[0] = 0;
  LODWORD(a1) = objc_msgSend(a1, sel_removeItemAtURL_error_, v2, v7);

  id v3 = v7[0];
  if (a1)
  {
    id v4 = v3;
  }
  else
  {
    id v5 = v7[0];
    unint64_t v6 = (void *)sub_1B389BC00();

    swift_willThrow();
  }
}

id sub_1B3869484(uint64_t a1, char a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v5 = (void *)sub_1B389BC50();
  id v6 = objc_msgSend(v4, sel_initWithURL_append_, v5, a2 & 1);

  uint64_t v7 = sub_1B389BD00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a1, v7);
  return v6;
}

id sub_1B3869528(uint64_t a1)
{
  v11[1] = *(id *)MEMORY[0x1E4F143B8];
  id v2 = (void *)sub_1B389BC50();
  v11[0] = 0;
  id v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_fileHandleForReadingFromURL_error_, v2, v11);

  id v4 = v11[0];
  if (v3)
  {
    sub_1B389BD00();
    OUTLINED_FUNCTION_11();
    id v6 = *(void (**)(void))(v5 + 8);
    id v7 = v4;
    OUTLINED_FUNCTION_49();
    v6();
  }
  else
  {
    id v8 = v11[0];
    sub_1B389BC00();

    swift_willThrow();
    sub_1B389BD00();
    OUTLINED_FUNCTION_11();
    (*(void (**)(uint64_t))(v9 + 8))(a1);
  }
  return v3;
}

uint64_t sub_1B386966C()
{
  sub_1B3859FE4(0, (unint64_t *)&qword_1EB7FA8B0);
  if (qword_1EB7FA9B8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_1B389C650();
  qword_1EB7FA4A0 = result;
  return result;
}

uint64_t sub_1B386971C(uint64_t a1)
{
  return sub_1B3869784(a1, MEMORY[0x1E4FBD360], qword_1EB7FA460, MEMORY[0x1E4FBD368]);
}

uint64_t sub_1B3869750(uint64_t a1)
{
  return sub_1B3869784(a1, MEMORY[0x1E4FBD330], qword_1EB7FA480, MEMORY[0x1E4FBD320]);
}

uint64_t sub_1B3869784(uint64_t a1, uint64_t (*a2)(void), uint64_t *a3, uint64_t (*a4)(id))
{
  uint64_t v6 = a2(0);
  __swift_allocate_value_buffer(v6, a3);
  uint64_t v7 = OUTLINED_FUNCTION_71();
  __swift_project_value_buffer(v7, v8);
  if (qword_1EB7FA4A8 != -1) {
    swift_once();
  }
  return a4((id)qword_1EB7FA4A0);
}

void sub_1B3869820()
{
  qword_1E9CCF630 = 0x6C72756761625F5FLL;
  *(void *)algn_1E9CCF638 = 0xE800000000000000;
}

void sub_1B3869844()
{
}

unint64_t sub_1B386986C()
{
  unint64_t result = qword_1E9CCEC98;
  if (!qword_1E9CCEC98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1E9CCEC98);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ShouldThrottleConfigFetchResultReason(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ShouldThrottleConfigFetchResultReason(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1B3869A0CLL);
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

void type metadata accessor for ShouldThrottleConfigFetchResultReason()
{
}

uint64_t getEnumTagSinglePayload for ShouldThrottleConfigFetchResult(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD)
  {
    unsigned int v2 = a2 + 3;
    if (a2 + 3 >= 0xFFFF00) {
      unsigned int v3 = 4;
    }
    else {
      unsigned int v3 = 2;
    }
    if (v2 >> 8 < 0xFF) {
      unsigned int v3 = 1;
    }
    if (v2 >= 0x100) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    switch(v4)
    {
      case 1:
        int v5 = a1[1];
        if (!a1[1]) {
          break;
        }
        return (*a1 | (v5 << 8)) - 3;
      case 2:
        int v5 = *(unsigned __int16 *)(a1 + 1);
        if (*(_WORD *)(a1 + 1)) {
          return (*a1 | (v5 << 8)) - 3;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x1B3869AF0);
      case 4:
        int v5 = *(_DWORD *)(a1 + 1);
        if (!v5) {
          break;
        }
        return (*a1 | (v5 << 8)) - 3;
      default:
        break;
    }
  }
  unsigned int v7 = *a1;
  BOOL v8 = v7 >= 3;
  unsigned int v9 = v7 - 3;
  if (!v8) {
    unsigned int v9 = -1;
  }
  if (v9 + 1 >= 2) {
    return v9;
  }
  else {
    return 0;
  }
}

uint64_t sub_1B3869B2C(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  if (v1 >= 3) {
    return v1 - 2;
  }
  else {
    return 0;
  }
}

unsigned char *sub_1B3869B40(unsigned char *result, int a2)
{
  if (a2) {
    *unint64_t result = a2 + 2;
  }
  return result;
}

uint64_t dispatch thunk of PegasusConfigDelegate.didChangeConfig(from:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of PegasusConfigDelegate.shouldPersistConfig.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of PegasusConfigDelegate.shouldThrottleFetchRequest.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of PegasusConfigDelegate.isRefreshDisabled(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of PegasusConfigDelegate.cachedURLString.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of PegasusConfigDelegate.localCacheURLs.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of PegasusConfigDelegate.createRequest()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of PegasusConfigDelegate.hasRequiredContext.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of PegasusConfigDelegate.willFetchConfig(request:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of PegasusConfigDelegate.didFetchConfigRequest(withResult:startContext:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 80))();
}

uint64_t dispatch thunk of PegasusConfigDelegate.didFailConfigRequest(withError:startContext:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 88))();
}

uint64_t *initializeBufferWithCopyOfBuffer for LocalCachePaths(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1B389BD00();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v7))
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v7);
    }
    uint64_t v10 = *(int *)(a3 + 20);
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v7))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v11, v12, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for LocalCachePaths(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B389BD00();
  if (!__swift_getEnumTagSinglePayload(a1, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t result = __swift_getEnumTagSinglePayload(v5, 1, v4);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
    return v7(v5, v4);
  }
  return result;
}

char *initializeWithCopy for LocalCachePaths(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1B389BD00();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v6))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(v9, v10, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v6);
  }
  return a1;
}

char *assignWithCopy for LocalCachePaths(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1B389BD00();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (EnumTagSinglePayload)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v9 = *(void *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
LABEL_6:
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 24))(a1, a2, v6);
LABEL_7:
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  int v14 = __swift_getEnumTagSinglePayload((uint64_t)&a1[v11], 1, v6);
  int v15 = __swift_getEnumTagSinglePayload((uint64_t)v13, 1, v6);
  if (!v14)
  {
    uint64_t v16 = *(void *)(v6 - 8);
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v12, v13, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v6);
    goto LABEL_12;
  }
  if (v15)
  {
LABEL_12:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
    memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(v12, v13, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v6);
  return a1;
}

char *initializeWithTake for LocalCachePaths(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1B389BD00();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v6))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(v9, v10, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v6);
  }
  return a1;
}

char *assignWithTake for LocalCachePaths(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1B389BD00();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (EnumTagSinglePayload)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v9 = *(void *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
LABEL_6:
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 40))(a1, a2, v6);
LABEL_7:
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  int v14 = __swift_getEnumTagSinglePayload((uint64_t)&a1[v11], 1, v6);
  int v15 = __swift_getEnumTagSinglePayload((uint64_t)v13, 1, v6);
  if (!v14)
  {
    uint64_t v16 = *(void *)(v6 - 8);
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v12, v13, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v6);
    goto LABEL_12;
  }
  if (v15)
  {
LABEL_12:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
    memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(v12, v13, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for LocalCachePaths(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B386A678);
}

uint64_t sub_1B386A678(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);

  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for LocalCachePaths(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B386A6D8);
}

uint64_t sub_1B386A6D8()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
  uint64_t v0 = OUTLINED_FUNCTION_79();

  return __swift_storeEnumTagSinglePayload(v0, v1, v2, v3);
}

void sub_1B386A71C()
{
  sub_1B386A7A8();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_1B386A7A8()
{
  if (!qword_1EB7FA448)
  {
    sub_1B389BD00();
    unint64_t v0 = sub_1B389C660();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB7FA448);
    }
  }
}

uint64_t type metadata accessor for PegasusConfigController()
{
  return self;
}

uint64_t type metadata accessor for ConfigTaskController()
{
  return self;
}

uint64_t sub_1B386A84C()
{
  uint64_t result = sub_1B389C660();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for Container()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for ConfigUsageReporter()
{
  return self;
}

uint64_t type metadata accessor for ConfigUsageReporter.State()
{
  return self;
}

void type metadata accessor for PegasusConfigControllerInternals()
{
}

void type metadata accessor for BMStreamIdentifier(uint64_t a1)
{
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

uint64_t sub_1B386A98C(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_unknownObjectRetain();
  return a1;
}

uint64_t sub_1B386A9C4()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_1B386A9CC(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return a1;
}

uint64_t sub_1B386AA10(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_unknownObjectRelease();
  return a1;
}

uint64_t sub_1B386AA4C(uint64_t a1, int a2)
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

uint64_t sub_1B386AA8C(uint64_t result, int a2, int a3)
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

void type metadata accessor for ConfigResult()
{
}

uint64_t sub_1B386AAD4()
{
  sub_1B3859FE4(0, (unint64_t *)&qword_1EB7FA8B0);
  uint64_t result = sub_1B389C650();
  qword_1EB7FA700 = result;
  return result;
}

uint64_t sub_1B386AB44()
{
  uint64_t v27 = sub_1B389BE20();
  uint64_t v25 = *(void *)(v27 - 8);
  MEMORY[0x1F4188790](v27);
  unint64_t v1 = (char *)&v22 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_1B389BF70();
  uint64_t v2 = *(void *)(v23 - 8);
  MEMORY[0x1F4188790](v23);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_1B389BBE0();
  uint64_t v24 = *(void *)(v26 - 8);
  MEMORY[0x1F4188790](v26);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B389BF50();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA908);
  uint64_t v7 = sub_1B389BF60();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 72);
  unint64_t v10 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1B389D510;
  unint64_t v12 = v11 + v10;
  uint64_t v13 = *(void (**)(unint64_t, void, uint64_t))(v8 + 104);
  v13(v12, *MEMORY[0x1E4F27C10], v7);
  v13(v12 + v9, *MEMORY[0x1E4F27C48], v7);
  sub_1B3896558(v11);
  sub_1B389BE00();
  sub_1B389BF30();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v1, v27);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v23);
  uint64_t v14 = sub_1B389BBA0();
  if (v15) {
    goto LABEL_7;
  }
  uint64_t v16 = v14;
  uint64_t v17 = sub_1B389BBC0();
  char v19 = v18;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v6, v26);
  if (v19) {
    return -1;
  }
  uint64_t v21 = 100 * v16;
  if ((unsigned __int128)(v16 * (__int128)100) >> 64 != (100 * v16) >> 63)
  {
    __break(1u);
    return result;
  }
  uint64_t result = v21 + v17;
  if (__OFADD__(v21, v17))
  {
    __break(1u);
LABEL_7:
    (*(void (**)(char *, uint64_t))(v24 + 8))(v6, v26);
    return -1;
  }
  return result;
}

void sub_1B386AEB0(void *a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 472);
  uint64_t v3 = *(void **)(v1 + v2);
  *(void *)(v1 + v2) = a1;
  id v4 = a1;
}

uint64_t sub_1B386AF00(void *a1, int a2)
{
  uint64_t v3 = (id *)v2;
  int v43 = a2;
  uint64_t v42 = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FA850);
  uint64_t v5 = MEMORY[0x1F4188790](v4 - 8);
  uint64_t v40 = (uint64_t)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v38 - v7;
  uint64_t v41 = sub_1B389BE20();
  uint64_t v9 = *(void *)(v41 - 8);
  MEMORY[0x1F4188790](v41);
  uint64_t v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_weakInit();
  *(void *)(v2 + 24) = 0;
  *(void *)(v2 + 32) = 0;
  *(_WORD *)(v2 + 40) = 256;
  *(void *)(v2 + 48) = 0;
  *(void *)(v2 + 56) = 0;
  *(void *)(v2 + 64) = MEMORY[0x1E4FBC860];
  *(void *)(v2 + 72) = 0;
  *(unsigned char *)(v2 + 81) = 0;
  uint64_t v46 = qword_1EB7FA948;
  uint64_t v47 = off_1EB7FA950;
  uint64_t v44 = 45;
  unint64_t v45 = 0xE100000000000000;
  sub_1B3859FE4(0, (unint64_t *)&qword_1EB7FA8B0);
  uint64_t v48 = 95;
  unint64_t v49 = 0xE100000000000000;
  sub_1B38538CC();
  sub_1B389C6F0();
  if (qword_1EB7FA400 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  *(void *)(v2 + 88) = sub_1B389C650();
  uint64_t v12 = v2 + *(void *)(*(void *)v2 + 136);
  uint64_t v13 = sub_1B389C110();
  __swift_storeEnumTagSinglePayload(v12, 1, 1, v13);
  uint64_t v14 = *((void *)*v3 + 19);
  type metadata accessor for Locker();
  uint64_t v15 = swift_allocObject();
  uint64_t v16 = (_DWORD *)swift_slowAlloc();
  *(void *)(v15 + 16) = v16;
  *uint64_t v16 = 0;
  *(id *)((char *)v3 + v14) = (id)v15;
  sub_1B389BE10();
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))((char *)v3 + *((void *)*v3 + 18), v11, v41);
  uint64_t v17 = v42;
  swift_weakAssign();
  char v18 = v43;
  *((unsigned char *)v3 + 80) = v43;
  id v19 = v3[11];
  swift_retain();
  sub_1B389C0E0();
  uint64_t v41 = v13;
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v13);
  uint64_t v20 = (uint64_t)v3 + *((void *)*v3 + 17);
  swift_beginAccess();
  uint64_t v39 = v20;
  sub_1B385A020((uint64_t)v8, v20);
  swift_endAccess();
  uint64_t v46 = (uint64_t)v3;
  swift_retain();
  uint64_t v21 = sub_1B389C300();
  uint64_t v23 = v22;
  uint64_t v24 = *(os_unfair_lock_s **)(v17[4] + 16);
  os_unfair_lock_lock(v24);
  uint64_t v25 = v17 + 2;
  if (MEMORY[0x1B3EBAFF0](v17 + 2))
  {
    uint64_t v26 = v17[3];
    swift_beginAccess();
    uint64_t v27 = v17;
    uint64_t v28 = v17[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_1B387119C(v21, v23, v28);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    if (v29)
    {
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(id *, _UNKNOWN **, uint64_t, uint64_t))(v26 + 32))(v3, &off_1F0C11C18, ObjectType, v26);
    }
    swift_unknownObjectRelease();
    uint64_t v17 = v27;
    char v18 = v43;
  }
  type metadata accessor for ActivityMonitor.WeakReference();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v31 + 24) = &off_1F0C11C18;
  swift_unknownObjectWeakAssign();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1B3857AAC(v31, v21, v23);
  swift_endAccess();
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v24);
  swift_bridgeObjectRelease();
  if (MEMORY[0x1B3EBAFF0](v25))
  {
    uint64_t v32 = v17[3];
    uint64_t v33 = swift_getObjectType();
    (*(void (**)(id *, _UNKNOWN **, uint64_t, uint64_t))(v32 + 8))(v3, &off_1F0C11C18, v33, v32);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
  }
  uint64_t v34 = v40;
  uint64_t v35 = v41;
  sub_1B385A0AC(v39, v40, (uint64_t *)&unk_1EB7FA850);
  uint64_t result = __swift_getEnumTagSinglePayload(v34, 1, v35);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    id v37 = v3[11];
    sub_1B389C5F0();
    sub_1B388BD98(v18);
    sub_1B389C0D0();

    (*(void (**)(uint64_t, uint64_t))(*(void *)(v35 - 8) + 8))(v34, v35);
    swift_release();
    return (uint64_t)v3;
  }
  return result;
}

uint64_t sub_1B386B528(void *a1, int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v7 = (id *)v6;
  uint64_t v50 = a4;
  uint64_t v51 = a6;
  int v48 = a5;
  uint64_t v49 = a3;
  int v55 = a2;
  uint64_t v54 = a1;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FA850);
  uint64_t v9 = MEMORY[0x1F4188790](v8 - 8);
  uint64_t v52 = (uint64_t)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v46 - v11;
  uint64_t v53 = sub_1B389BE20();
  uint64_t v13 = *(void *)(v53 - 8);
  MEMORY[0x1F4188790](v53);
  uint64_t v15 = (char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_weakInit();
  *(void *)(v6 + 24) = 0;
  *(void *)(v6 + 32) = 0;
  *(_WORD *)(v6 + 40) = 256;
  *(void *)(v6 + 48) = 0;
  *(void *)(v6 + 56) = 0;
  *(void *)(v6 + 64) = MEMORY[0x1E4FBC860];
  *(void *)(v6 + 72) = 0;
  *(unsigned char *)(v6 + 81) = 0;
  unint64_t v58 = 0xD000000000000010;
  unint64_t v59 = 0x80000001B38A1DF0;
  uint64_t v56 = 45;
  unint64_t v57 = 0xE100000000000000;
  sub_1B3859FE4(0, (unint64_t *)&qword_1EB7FA8B0);
  uint64_t v60 = 95;
  unint64_t v61 = 0xE100000000000000;
  unint64_t v45 = sub_1B38538CC();
  sub_1B389C6F0();
  if (qword_1EB7FA408 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  *(void *)(v6 + 88) = sub_1B389C650();
  uint64_t v16 = v6 + *(void *)(*(void *)v6 + 136);
  uint64_t v17 = sub_1B389C110();
  __swift_storeEnumTagSinglePayload(v16, 1, 1, v17);
  uint64_t v18 = *((void *)*v7 + 19);
  type metadata accessor for Locker();
  uint64_t v19 = swift_allocObject();
  uint64_t v20 = (_DWORD *)swift_slowAlloc();
  *(void *)(v19 + 16) = v20;
  *uint64_t v20 = 0;
  *(id *)((char *)v7 + v18) = (id)v19;
  sub_1B389BE10();
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))((char *)v7 + *((void *)*v7 + 18), v15, v53);
  uint64_t v21 = v54;
  swift_weakAssign();
  char v22 = v55;
  *((unsigned char *)v7 + 80) = v55;
  id v23 = v7[11];
  swift_retain();
  sub_1B389C0E0();
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v17);
  uint64_t v24 = (uint64_t)v7 + *((void *)*v7 + 17);
  swift_beginAccess();
  uint64_t v53 = v24;
  sub_1B385A020((uint64_t)v12, v24);
  swift_endAccess();
  unint64_t v58 = (unint64_t)v7;
  swift_retain();
  uint64_t v25 = sub_1B389C300();
  uint64_t v27 = v26;
  uint64_t v28 = *(os_unfair_lock_s **)(v21[4] + 16);
  os_unfair_lock_lock(v28);
  uint64_t v29 = v21 + 2;
  if (MEMORY[0x1B3EBAFF0](v21 + 2))
  {
    uint64_t v47 = v17;
    uint64_t v30 = v21[3];
    swift_beginAccess();
    uint64_t v31 = v21;
    uint64_t v32 = v21[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v33 = sub_1B387119C(v25, v27, v32);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    if (v33)
    {
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(id *, _UNKNOWN **, uint64_t, uint64_t))(v30 + 32))(v7, &off_1F0C11C18, ObjectType, v30);
    }
    swift_unknownObjectRelease();
    uint64_t v21 = v31;
    char v22 = v55;
    uint64_t v17 = v47;
  }
  type metadata accessor for ActivityMonitor.WeakReference();
  uint64_t v35 = swift_allocObject();
  *(void *)(v35 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v35 + 24) = &off_1F0C11C18;
  swift_unknownObjectWeakAssign();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1B3857AAC(v35, v25, v27);
  swift_endAccess();
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v28);
  swift_bridgeObjectRelease();
  if (MEMORY[0x1B3EBAFF0](v29))
  {
    uint64_t v36 = v21[3];
    uint64_t v37 = swift_getObjectType();
    (*(void (**)(id *, _UNKNOWN **, uint64_t, uint64_t))(v36 + 8))(v7, &off_1F0C11C18, v37, v36);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
  }
  uint64_t v38 = v52;
  sub_1B385A0AC(v53, v52, (uint64_t *)&unk_1EB7FA850);
  uint64_t result = __swift_getEnumTagSinglePayload(v38, 1, v17);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    id v40 = v7[11];
    uint64_t v41 = sub_1B389C5F0();
    uint64_t v42 = sub_1B38584F8(v22);
    LOBYTE(v45) = v48;
    sub_1B38587B8(v41, (uint64_t)v40, (uint64_t)v42, v43, v44, v38, v49, v50, v45, v51);

    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v38, v17);
    swift_release();
    return (uint64_t)v7;
  }
  return result;
}

uint64_t sub_1B386BB90(void *a1, int a2, uint64_t a3)
{
  *(void *)(v3 + qword_1EB7FA5C0) = 0;
  *(void *)(v3 + *(void *)(*(void *)v3 + 472)) = a3;
  return sub_1B386AF00(a1, a2);
}

uint64_t sub_1B386BBB8(uint64_t result)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 472);
  uint64_t v3 = *(void *)(v1 + v2);
  BOOL v4 = __OFADD__(v3, result);
  uint64_t v5 = v3 + result;
  if (v4) {
    __break(1u);
  }
  else {
    *(void *)(v1 + v2) = v5;
  }
  return result;
}

void sub_1B386BBE4(void *a1)
{
  uint64_t v2 = *(void **)(v1 + qword_1EB7FA5C0);
  *(void *)(v1 + qword_1EB7FA5C0) = a1;
  id v3 = a1;
}

uint64_t sub_1B386BC28(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  swift_retain();
  uint64_t v2 = (_DWORD *)swift_slowAlloc();
  *(void *)(v1 + 24) = v2;
  _DWORD *v2 = 0;
  swift_release();
  return v1;
}

uint64_t sub_1B386BC70(uint64_t a1, id *a2)
{
  uint64_t result = sub_1B389C290();
  *a2 = 0;
  return result;
}

uint64_t sub_1B386BCE8(uint64_t a1, id *a2)
{
  char v3 = sub_1B389C2A0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1B386BD68()
{
  sub_1B389C2B0();
  uint64_t v0 = sub_1B389C280();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1B386BDA0()
{
  return sub_1B386BFC4(*v0, MEMORY[0x1E4F27EB8]);
}

uint64_t sub_1B386BDD8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1B386BD68();
  *a1 = result;
  return result;
}

uint64_t sub_1B386BE00@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1B389C280();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1B386BE48@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1B386BE74(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1B386BE78(uint64_t a1)
{
  uint64_t v2 = sub_1B385DE2C(&qword_1E9CCED40, type metadata accessor for BMStreamIdentifier);
  uint64_t v3 = sub_1B385DE2C(&qword_1E9CCED48, type metadata accessor for BMStreamIdentifier);
  uint64_t v4 = MEMORY[0x1E4FBB1B0];

  return MEMORY[0x1F4185450](a1, v2, v3, v4);
}

uint64_t sub_1B386BF34()
{
  return sub_1B385DE2C(&qword_1E9CCED28, type metadata accessor for BMStreamIdentifier);
}

uint64_t sub_1B386BF7C()
{
  return sub_1B385DE2C(&qword_1E9CCED30, type metadata accessor for BMStreamIdentifier);
}

uint64_t sub_1B386BFC4(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = sub_1B389C2B0();
  uint64_t v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1B386C004()
{
  sub_1B389C2B0();
  sub_1B389C370();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1B386C058()
{
  sub_1B389C2B0();
  sub_1B389CA10();
  sub_1B389C370();
  uint64_t v0 = sub_1B389CA40();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1B386C0CC()
{
  return sub_1B386BFC4(*v0, MEMORY[0x1E4FBB198]);
}

uint64_t sub_1B386C0FC()
{
  return sub_1B386C004();
}

uint64_t sub_1B386C104()
{
  return sub_1B386C058();
}

uint64_t sub_1B386C10C()
{
  return sub_1B3874228();
}

uint64_t sub_1B386C118()
{
  return sub_1B385DE2C(&qword_1E9CCED38, type metadata accessor for BMStreamIdentifier);
}

uint64_t sub_1B386C160(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1B386C170()
{
  swift_weakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1B386C1AC()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_47();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_26(v0);
  void *v1 = v2;
  v1[1] = sub_1B386DB5C;
  uint64_t v3 = OUTLINED_FUNCTION_16();
  return sub_1B3864A68(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_1B386C244()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_60();

  return MEMORY[0x1F4186498](v0, v1, v2);
}

uint64_t sub_1B386C284()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_47();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_26(v0);
  void *v1 = v2;
  v1[1] = sub_1B386DB5C;
  uint64_t v3 = OUTLINED_FUNCTION_16();
  return sub_1B3864DB8(v3, v4, v5, v6, v7, v8);
}

uint64_t objectdestroy_64Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_60();

  return MEMORY[0x1F4186498](v0, v1, v2);
}

uint64_t sub_1B386C360()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_47();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_26(v0);
  void *v1 = v2;
  v1[1] = sub_1B386DB5C;
  uint64_t v3 = OUTLINED_FUNCTION_16();
  return sub_1B38640C4(v3, v4, v5, v6, v7, v8);
}

unint64_t sub_1B386C3F8()
{
  unint64_t result = qword_1E9CCEB50;
  if (!qword_1E9CCEB50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCEB50);
  }
  return result;
}

uint64_t sub_1B386C444(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FAAF8);
  uint64_t v6 = sub_1B389C870();
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
        sub_1B386D320(v22, v35);
      }
      else
      {
        sub_1B3855FF8((uint64_t)v22, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_1B389CA10();
      sub_1B389C370();
      uint64_t result = sub_1B389CA40();
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
      uint64_t v31 = (void *)(*(void *)(v7 + 48) + 16 * v26);
      *uint64_t v31 = v21;
      v31[1] = v20;
      uint64_t result = (uint64_t)sub_1B386D320(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v26));
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
            uint64_t v3 = v2;
            if (a2)
            {
              uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
              if (v32 >= 64) {
                sub_1B388F8F0(0, (unint64_t)(v32 + 63) >> 6, v34);
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
  *uint64_t v3 = v7;
  return result;
}

id sub_1B386C740(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = (void *)sub_1B389C280();
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)sub_1B389C280();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(a5, sel_URLForResource_withExtension_, v6, v7);

  return v8;
}

uint64_t sub_1B386C7D4(uint64_t result, uint64_t a2, char a3)
{
  if (a3 < 0) {
    return sub_1B386C7E4(result, a2, a3 & 0x7F);
  }
  return result;
}

uint64_t sub_1B386C7E4(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1B386C7FC(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 0xFF) {
    return sub_1B386C810(a1, a2, a3);
  }
  return a1;
}

uint64_t sub_1B386C810(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1B386C828(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 0xFF) {
    return sub_1B386C7E4(a1, a2, a3);
  }
  return a1;
}

unint64_t sub_1B386C83C()
{
  unint64_t result = qword_1E9CCED80;
  if (!qword_1E9CCED80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCED80);
  }
  return result;
}

uint64_t sub_1B386C888()
{
  swift_unknownObjectRelease();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B386C8C0()
{
  OUTLINED_FUNCTION_13();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_26(v0);
  void *v1 = v2;
  v1[1] = sub_1B386C960;
  return sub_1B385F394();
}

uint64_t sub_1B386C960()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_6();
  return v3();
}

uint64_t sub_1B386CA20()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  void *v2 = v1;
  v2[1] = sub_1B386CAAC;
  return sub_1B385EC90(v0);
}

uint64_t sub_1B386CAAC()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_28();
  uint64_t v3 = OUTLINED_FUNCTION_72();
  return v4(v3);
}

void sub_1B386CB80(id a1, unsigned int a2, char a3)
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  if ((v3 & 0xFFFFFFFE | (a2 >> 7) & 1) == 1) {
}
  }

id sub_1B386CBA0(id result, unsigned int a2, char a3)
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  if ((v3 & 0xFFFFFFFE | (a2 >> 7) & 1) == 1) {
    return result;
  }
  return result;
}

uint64_t sub_1B386CBC0()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B386C7E4(*(void *)(v0 + 96), *(void *)(v0 + 104), *(unsigned char *)(v0 + 112));

  return MEMORY[0x1F4186498](v0, 113, 7);
}

uint64_t sub_1B386CC1C()
{
  OUTLINED_FUNCTION_14();
  uint64_t v2 = *(void *)(v0 + 16);
  char v3 = *(unsigned char *)(v0 + 24);
  uint64_t v4 = v0 + 32;
  uint64_t v5 = *(void *)(v0 + 96);
  uint64_t v6 = *(void *)(v0 + 104);
  char v7 = *(unsigned char *)(v0 + 112);
  id v8 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v8;
  *id v8 = v1;
  v8[1] = sub_1B386CCE0;
  return sub_1B3861BD0(v2, v3, v4, v5, v6, v7);
}

uint64_t sub_1B386CCE0()
{
  OUTLINED_FUNCTION_13();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  OUTLINED_FUNCTION_0();
  uint64_t v5 = *v0;
  OUTLINED_FUNCTION_3();
  *uint64_t v6 = v5;
  swift_task_dealloc();
  OUTLINED_FUNCTION_28();
  return v7(v4, v2);
}

uint64_t sub_1B386CDB8(uint64_t a1)
{
  return a1;
}

unint64_t sub_1B386CE04()
{
  unint64_t result = qword_1E9CCEDE8;
  if (!qword_1E9CCEDE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1E9CCEDE8);
  }
  return result;
}

uint64_t sub_1B386CE50(uint64_t a1, unint64_t a2)
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

uint64_t sub_1B386CEA8()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v0 = OUTLINED_FUNCTION_60();

  return MEMORY[0x1F4186498](v0, v1, v2);
}

uint64_t sub_1B386CEE8(void *a1)
{
  return sub_1B3865E88(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48));
}

uint64_t sub_1B386CEF8(uint64_t a1, unint64_t a2)
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

uint64_t sub_1B386CF50(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v15 = a12 + qword_1EB7FC0B8;
  *(unsigned char *)(v15 + 8) = 1;
  *(void *)uint64_t v15 = 0;
  int64_t v16 = (void *)(a12 + qword_1EB7FC0C0);
  *int64_t v16 = a3;
  v16[1] = a4;
  _OWORD v16[2] = a5;
  if (a7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA930);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1B389D510;
    uint64_t v29 = MEMORY[0x1E4FBB1A0];
    *(void *)(inited + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v30 = sub_1B38579B4();
    *(void *)(inited + 32) = a4;
    *(void *)(inited + 40) = a5;
    *(void *)(inited + 96) = v29;
    *(void *)(inited + 104) = v30;
    *(void *)(inited + 64) = v30;
    *(void *)(inited + 72) = a10;
    *(void *)(inited + 80) = a11;
    *(void *)(a12 + *(void *)(*(void *)a12 + 472)) = 0;
    uint64_t v31 = *(void *)(*(void *)a12 + 480);
    *(void *)(a12 + v31) = 0;
    uint64_t v32 = (void *)(a12 + *(void *)(*(void *)a12 + 464));
    *uint64_t v32 = a8;
    v32[1] = &off_1F0C12C28;
    swift_bridgeObjectRetain();
    swift_retain();
    objc_msgSend(a8, sel_set_nw_activity_, a9);
    *(void *)(a12 + v31) = a9;
    swift_unknownObjectRetain();
    swift_release();
    swift_unknownObjectRelease();
    unint64_t v25 = "client=%{signpost.description:attribute,public}s, version=%{signpost.description:attribute,public}s";
    unint64_t v26 = a1;
    int v27 = a2;
    uint64_t v28 = 99;
  }
  else
  {
    *(void *)uint64_t v15 = a6;
    *(unsigned char *)(v15 + 8) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA930);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1B389D520;
    uint64_t v19 = MEMORY[0x1E4FBB1A0];
    *(void *)(inited + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v20 = sub_1B38579B4();
    *(void *)(inited + 32) = a4;
    *(void *)(inited + 40) = a5;
    *(void *)(inited + 96) = v19;
    *(void *)(inited + 104) = v20;
    *(void *)(inited + 64) = v20;
    *(void *)(inited + 72) = a10;
    uint64_t v21 = MEMORY[0x1E4FBC538];
    uint64_t v22 = MEMORY[0x1E4FBC598];
    *(void *)(inited + 80) = a11;
    *(void *)(inited + 136) = v21;
    *(void *)(inited + 144) = v22;
    *(void *)(inited + 112) = a6;
    *(void *)(a12 + *(void *)(*(void *)a12 + 472)) = 0;
    uint64_t v23 = *(void *)(*(void *)a12 + 480);
    *(void *)(a12 + v23) = 0;
    unint64_t v24 = (void *)(a12 + *(void *)(*(void *)a12 + 464));
    *unint64_t v24 = a8;
    v24[1] = &off_1F0C12C28;
    swift_bridgeObjectRetain();
    swift_retain();
    objc_msgSend(a8, sel_set_nw_activity_, a9);
    *(void *)(a12 + v23) = a9;
    swift_unknownObjectRetain();
    swift_release();
    swift_unknownObjectRelease();
    unint64_t v25 = "client=%{signpost.description:attribute,public}s, version=%{signpost.description:attribute,public}s, identifie"
          "r=%{signpost.description:attribute,public}llu";
    unint64_t v26 = a1;
    int v27 = a2;
    uint64_t v28 = 155;
  }
  uint64_t v33 = sub_1B386B528(v26, v27, (uint64_t)v25, v28, 2, inited);
  swift_unknownObjectRelease();

  return v33;
}

uint64_t sub_1B386D218()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 104, 7);
}

uint64_t sub_1B386D270()
{
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_14();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_26(v0);
  void *v1 = v2;
  v1[1] = sub_1B386C960;
  OUTLINED_FUNCTION_32();
  return sub_1B3861670(v3, v4, v5, v6, v7);
}

_OWORD *sub_1B386D320(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1B386D330(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_46();
  v3();
  return a1;
}

uint64_t sub_1B386D380()
{
  return swift_release();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t *sub_1B386D3B8(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1B389BE20();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    *(void *)uint64_t v9 = *(void *)v10;
    v9[8] = v10[8];
    uint64_t v11 = a3[7];
    uint64_t v12 = (uint64_t *)((char *)a1 + v11);
    int64_t v13 = (uint64_t *)((char *)a2 + v11);
    uint64_t v14 = v13[1];
    *uint64_t v12 = *v13;
    v12[1] = v14;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1B386D4B4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1B389BE20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  char v10 = *(unsigned char *)(v9 + 8);
  *(void *)uint64_t v8 = *(void *)v9;
  *(unsigned char *)(v8 + 8) = v10;
  uint64_t v11 = a3[7];
  uint64_t v12 = (void *)(a1 + v11);
  int64_t v13 = (void *)(a2 + v11);
  *uint64_t v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1B386D578(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1B389BE20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)uint64_t v8 = *(void *)v9;
  *(unsigned char *)(v8 + 8) = *(unsigned char *)(v9 + 8);
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_1B386D618(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1B389BE20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)uint64_t v8 = *(void *)v9;
  *(unsigned char *)(v8 + 8) = *(unsigned char *)(v9 + 8);
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (uint64_t *)(a2 + v10);
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  *uint64_t v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1B386D6C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B386D6DC);
}

uint64_t sub_1B386D6DC(uint64_t a1, int a2, uint64_t a3)
{
  sub_1B389BE20();
  OUTLINED_FUNCTION_20();
  if (*(_DWORD *)(v6 + 84) == a2)
  {
    uint64_t v7 = OUTLINED_FUNCTION_36();
    return __swift_getEnumTagSinglePayload(v7, v8, v9);
  }
  else
  {
    unint64_t v11 = *(void *)(a1 + *(int *)(a3 + 28) + 8);
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    int v12 = v11 - 1;
    if (v12 < 0) {
      int v12 = -1;
    }
    return (v12 + 1);
  }
}

uint64_t sub_1B386D774(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B386D788);
}

void sub_1B386D788(uint64_t a1, unsigned int a2, int a3, uint64_t a4)
{
  sub_1B389BE20();
  OUTLINED_FUNCTION_20();
  if (*(_DWORD *)(v8 + 84) == a3)
  {
    uint64_t v9 = OUTLINED_FUNCTION_79();
    __swift_storeEnumTagSinglePayload(v9, v10, v11, v12);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 28) + 8) = a2;
  }
}

uint64_t sub_1B386D808()
{
  uint64_t result = sub_1B389BE20();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_1B386D8B8(uint64_t a1)
{
}

uint64_t sub_1B386D8CC(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  char v4 = *(unsigned char *)(a2 + 9);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 8);
  sub_1B386CBA0(*(id *)a2, v5, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 9) = v4;
  return a1;
}

uint64_t sub_1B386D920(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  char v4 = *(unsigned char *)(a2 + 9);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 8);
  sub_1B386CBA0(*(id *)a2, v5, v4);
  uint64_t v6 = *(void **)a1;
  char v7 = *(unsigned char *)(a1 + 9);
  *(void *)a1 = v3;
  unsigned int v8 = *(unsigned __int8 *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 9) = v4;
  sub_1B386CB80(v6, v8, v7);
  return a1;
}

uint64_t __swift_memcpy10_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_WORD *)(result + 8) = *((_WORD *)a2 + 4);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t sub_1B386D998(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  char v4 = *(unsigned char *)(a2 + 9);
  unsigned __int8 v5 = *(void **)a1;
  char v6 = *(unsigned char *)(a1 + 9);
  *(void *)a1 = *(void *)a2;
  unsigned int v7 = *(unsigned __int8 *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 9) = v4;
  sub_1B386CB80(v5, v7, v6);
  return a1;
}

uint64_t sub_1B386D9E4(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x1FE && *(unsigned char *)(a1 + 10))
    {
      unsigned int v2 = *(_DWORD *)a1 + 509;
    }
    else
    {
      unsigned int v2 = ((*(unsigned __int8 *)(a1 + 8) >> 7) | (2 * *(unsigned __int8 *)(a1 + 9))) ^ 0x1FF;
      if (v2 >= 0x1FD) {
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

uint64_t sub_1B386DA30(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x1FD)
  {
    *(_WORD *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 510;
    if (a3 >= 0x1FE) {
      *(unsigned char *)(result + 10) = 1;
    }
  }
  else
  {
    if (a3 >= 0x1FE) {
      *(unsigned char *)(result + 10) = 0;
    }
    if (a2)
    {
      *(void *)uint64_t result = 0;
      *(_WORD *)(result + 8) = __PAIR16__((-128 * a2) >> 24, (_BYTE)a2 << 7);
    }
  }
  return result;
}

uint64_t sub_1B386DA84(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 9)) {
    int v1 = 2;
  }
  else {
    int v1 = 0;
  }
  unsigned int v2 = v1 | (*(unsigned __int8 *)(a1 + 8) >> 7);
  if (v2 <= 1) {
    return v2;
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_1B386DAB0(uint64_t result)
{
  *(unsigned char *)(result + 8) &= ~0x80u;
  return result;
}

uint64_t sub_1B386DAC0(uint64_t result, unsigned int a2)
{
  if (a2 < 2)
  {
    *(unsigned char *)(result + 8) = *(unsigned char *)(result + 8) & 0x7F | ((_BYTE)a2 << 7);
  }
  else
  {
    *(void *)uint64_t result = a2 - 2;
    *(unsigned char *)(result + 8) = 0;
  }
  *(unsigned char *)(result + 9) = a2 > 1;
  return result;
}

void type metadata accessor for PegasusConfigFetchError()
{
}

void type metadata accessor for CFError(uint64_t a1)
{
}

void sub_1B386DB10(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t OUTLINED_FUNCTION_15(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_21@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)a1 = a2;
  *(_WORD *)(a1 + 8) = 256;
  return swift_willThrow();
}

void OUTLINED_FUNCTION_22(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_26(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_27()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_30()
{
  return sub_1B386CE50(v1, v0);
}

uint64_t OUTLINED_FUNCTION_31@<X0>(uint64_t a1@<X1>, __int16 a2@<W8>)
{
  *(_WORD *)(a1 + 8) = a2;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_33()
{
  return *(void *)(v0 - 128);
}

uint64_t OUTLINED_FUNCTION_38()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_40(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return sub_1B389C190();
}

BOOL OUTLINED_FUNCTION_41(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

_WORD *OUTLINED_FUNCTION_42(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

BOOL OUTLINED_FUNCTION_43(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_52()
{
  return sub_1B389C920();
}

uint64_t OUTLINED_FUNCTION_56(uint64_t a1)
{
  *(void *)(v1 + 152) = a1;
  return sub_1B389C6C0();
}

BOOL OUTLINED_FUNCTION_57(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_60()
{
  return v0;
}

double OUTLINED_FUNCTION_63()
{
  return 0.0;
}

uint64_t OUTLINED_FUNCTION_67()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_68()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_69()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_71()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_72()
{
  return v0;
}

void OUTLINED_FUNCTION_76(void *a1@<X8>)
{
  *a1 = v1;
  a1[1] = v2 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
}

uint64_t OUTLINED_FUNCTION_79()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_80(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
}

void OUTLINED_FUNCTION_81(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v6, a4, v4, 0xCu);
}

void OUTLINED_FUNCTION_82(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_84()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_86()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_88()
{
  return v0;
}

uint64_t sub_1B386DEB4()
{
  if (qword_1E9CCEAD0 != -1) {
    swift_once();
  }
  qword_1EB7FC078 = qword_1E9CCF5A0;
  unk_1EB7FC080 = *(void *)algn_1E9CCF5A8;

  return swift_bridgeObjectRetain();
}

uint64_t *sub_1B386DF20()
{
  if (qword_1EB7FA408 != -1) {
    swift_once();
  }
  return &qword_1EB7FC078;
}

void sub_1B386DF6C()
{
  qword_1E9CCF648 = (uint64_t)&unk_1F0C11330;
}

unint64_t sub_1B386DF80()
{
  return 0xD000000000000010;
}

uint64_t sub_1B386DF9C()
{
  sub_1B386DF20();
  uint64_t v0 = qword_1EB7FC078;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_1B386DFD8()
{
  return sub_1B388A968();
}

uint64_t sub_1B386DFE0()
{
  return sub_1B388ACD4();
}

uint64_t sub_1B386DFE8()
{
  return sub_1B388B060();
}

uint64_t sub_1B386DFF0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1B386E01C();
  *a1 = result;
  return result;
}

uint64_t sub_1B386E01C()
{
  return 45;
}

uint64_t sub_1B386E024@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1B3880B88(*v1);
  *a1 = result;
  return result;
}

BOOL sub_1B386E050(char *a1, char *a2)
{
  return sub_1B3874414(*a1, *a2);
}

uint64_t sub_1B386E05C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B386E070()
{
  if ((*(unsigned char *)(v0 + 81) & 1) == 0) {
    sub_1B38836CC();
  }
  uint64_t v1 = sub_1B386E0B8();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_1B386E0B8()
{
  if ((*(unsigned char *)(v0 + 81) & 1) == 0) {
    sub_1B38836CC();
  }
  uint64_t v1 = sub_1B38530BC();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  return v1;
}

uint64_t sub_1B386E140()
{
  uint64_t v0 = sub_1B386E070();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t type metadata accessor for ResourceAccessNetworkSpan()
{
  uint64_t result = qword_1EB7FA7A8;
  if (!qword_1EB7FA7A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1B386E1DC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1B386E228()
{
  sub_1B389C5B0();
  OUTLINED_FUNCTION_0_0();
  sub_1B389C0B0();
  sub_1B386E3A8();
  sub_1B389C5B0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA930);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1B389D500;
  uint64_t v3 = *(void *)(v0 + qword_1EB7FC0C0 + 8);
  uint64_t v2 = *(void *)(v0 + qword_1EB7FC0C0 + 16);
  uint64_t v4 = MEMORY[0x1E4FBB1A0];
  *(void *)(v1 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v5 = sub_1B38579B4();
  *(void *)(v1 + 64) = v5;
  *(void *)(v1 + 32) = v3;
  *(void *)(v1 + 40) = v2;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_1_0();
  sub_1B389C0B0();
  swift_bridgeObjectRelease();
  sub_1B389C5B0();
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1B389D500;
  *(void *)(v6 + 56) = v4;
  *(void *)(v6 + 64) = v5;
  *(void *)(v6 + 32) = v3;
  *(void *)(v6 + 40) = v2;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_1_0();
  sub_1B389C0B0();
  swift_bridgeObjectRelease();
  sub_1B389C5B0();
  OUTLINED_FUNCTION_0_0();

  return sub_1B389C0B0();
}

uint64_t sub_1B386E3A8()
{
  uint64_t v1 = v0;
  sub_1B389C5B0();
  sub_1B389C0B0();
  sub_1B3883EA8();
  sub_1B389C5B0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA930);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1B389D500;
  uint64_t v3 = *(void *)(v1 + *(void *)(*(void *)v1 + 464) + 8);
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCEF80);
  uint64_t v4 = sub_1B389C300();
  uint64_t v6 = v5;
  *(void *)(v2 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v7 = sub_1B38579B4();
  *(void *)(v2 + 64) = v7;
  *(void *)(v2 + 32) = v4;
  *(void *)(v2 + 40) = v6;
  sub_1B389C0B0();
  swift_bridgeObjectRelease();
  sub_1B389C5B0();
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1B389D500;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v42 = v3;
  uint64_t v9 = v3;
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
  v10(ObjectType, v9);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CCEE10);
  uint64_t v11 = sub_1B389C300();
  *(void *)(v8 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v8 + 64) = v7;
  unint64_t v44 = v7;
  *(void *)(v8 + 32) = v11;
  *(void *)(v8 + 40) = v12;
  sub_1B389C0B0();
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_1B388395C();
  if (v16)
  {
    sub_1B389C5B0();
    uint64_t v32 = swift_allocObject();
    *(_OWORD *)(v32 + 16) = xmmword_1B389D500;
    v10(ObjectType, v42);
    uint64_t v33 = sub_1B389C300();
    uint64_t v34 = MEMORY[0x1E4FBB1A0];
    unint64_t v31 = v7;
    *(void *)(v32 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v32 + 64) = v7;
    *(void *)(v32 + 32) = v33;
    *(void *)(v32 + 40) = v35;
    sub_1B389C0B0();
    uint64_t v30 = v34;
  }
  else
  {
    uint64_t v17 = v14;
    int v18 = v15;
    unint64_t v19 = HIDWORD(v15);
    uint64_t v43 = v13;
    sub_1B389C5B0();
    uint64_t v20 = swift_allocObject();
    uint64_t v21 = MEMORY[0x1E4FBB550];
    *(_OWORD *)(v20 + 16) = xmmword_1B389D500;
    uint64_t v22 = MEMORY[0x1E4FBB5C8];
    *(void *)(v20 + 56) = v21;
    *(void *)(v20 + 64) = v22;
    *(void *)(v20 + 32) = v17;
    sub_1B389C0B0();
    swift_bridgeObjectRelease();
    sub_1B389C5B0();
    uint64_t v23 = swift_allocObject();
    uint64_t v24 = MEMORY[0x1E4FBC4C0];
    *(_OWORD *)(v23 + 16) = xmmword_1B389D500;
    uint64_t v25 = MEMORY[0x1E4FBC530];
    *(void *)(v23 + 56) = v24;
    *(void *)(v23 + 64) = v25;
    *(_DWORD *)(v23 + 32) = v19;
    sub_1B389C0B0();
    swift_bridgeObjectRelease();
    sub_1B389C5B0();
    uint64_t v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_1B389D500;
    *(void *)(v26 + 56) = v24;
    *(void *)(v26 + 64) = v25;
    *(_DWORD *)(v26 + 32) = v18;
    sub_1B389C0B0();
    swift_bridgeObjectRelease();
    sub_1B389C5B0();
    uint64_t v27 = swift_allocObject();
    uint64_t v28 = MEMORY[0x1E4FBB3D0];
    *(_OWORD *)(v27 + 16) = xmmword_1B389D500;
    uint64_t v29 = MEMORY[0x1E4FBB460];
    *(void *)(v27 + 56) = v28;
    *(void *)(v27 + 64) = v29;
    *(void *)(v27 + 32) = v43;
    sub_1B389C0B0();
    uint64_t v30 = MEMORY[0x1E4FBB1A0];
    unint64_t v31 = v44;
  }
  swift_bridgeObjectRelease();
  sub_1B389C5B0();
  uint64_t v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_1B389D500;
  id v37 = *(id *)(v1 + *(void *)(*(void *)v1 + 472));
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CCF310);
  uint64_t v38 = sub_1B389C300();
  *(void *)(v36 + 56) = v30;
  *(void *)(v36 + 64) = v31;
  *(void *)(v36 + 32) = v38;
  *(void *)(v36 + 40) = v39;
  sub_1B389C0B0();
  swift_bridgeObjectRelease();
  sub_1B389C5B0();
  return sub_1B389C0B0();
}

uint64_t sub_1B386E8D8(uint64_t a1, unint64_t a2, double a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_1B38812B4(a1, a2, a3);
  if (qword_1E9CCEAF0 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_1E9CCF5F0;
  uint64_t v10 = *(void *)algn_1E9CCF5F8;
  uint64_t v11 = *(void *)(v4 + qword_1EB7FC0C0);
  id v12 = objc_allocWithZone(NSNumber);
  swift_bridgeObjectRetain();
  id v13 = objc_msgSend(v12, sel_initWithUnsignedInteger_, v11);
  swift_isUniquelyReferenced_nonNull_native();
  sub_1B38737F4((uint64_t)v13, v9, v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B388B170(v8);
  swift_bridgeObjectRelease();

  return sub_1B386EA14(a1, a2, a3);
}

uint64_t sub_1B386EA14(uint64_t a1, unint64_t a2, double a3)
{
  int v3 = a2;
  unint64_t v6 = HIDWORD(a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA930);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1B389DD00;
  uint64_t v8 = MEMORY[0x1E4FBB5C8];
  *(void *)(v7 + 56) = MEMORY[0x1E4FBB550];
  *(void *)(v7 + 64) = v8;
  *(void *)(v7 + 32) = a1;
  uint64_t v9 = MEMORY[0x1E4FBC4C0];
  uint64_t v10 = MEMORY[0x1E4FBC530];
  *(void *)(v7 + 96) = MEMORY[0x1E4FBC4C0];
  *(void *)(v7 + 104) = v10;
  *(_DWORD *)(v7 + 72) = v3;
  *(void *)(v7 + 136) = v9;
  *(void *)(v7 + 144) = v10;
  uint64_t v11 = MEMORY[0x1E4FBB3D0];
  *(_DWORD *)(v7 + 112) = v6;
  uint64_t v12 = MEMORY[0x1E4FBB460];
  *(void *)(v7 + 176) = v11;
  *(void *)(v7 + 184) = v12;
  *(double *)(v7 + 152) = a3;
  sub_1B3856C5C("statusCode=%{signpost.description:attribute,public}d, download=%{signpost.description:attribute}lu, upload=%{signpost.description:attribute}lu, runtime=%{signpost.description:attribute}f", 186, 2, v7);

  return swift_bridgeObjectRelease();
}

uint64_t getEnumTagSinglePayload for ResourceAccessActivity(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xD4)
  {
    if (a2 + 44 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 44) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 45;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x2D;
  int v5 = v6 - 45;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for ResourceNetworkActivity(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 44 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 44) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xD4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xD3)
  {
    unsigned int v6 = ((a2 - 212) >> 8) + 1;
    *uint64_t result = a2 + 44;
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
        JUMPOUT(0x1B386EC50);
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
          *uint64_t result = a2 + 44;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ResourceNetworkActivity()
{
  return &type metadata for ResourceNetworkActivity;
}

unint64_t sub_1B386EC8C()
{
  unint64_t result = qword_1EB7FA798;
  if (!qword_1EB7FA798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB7FA798);
  }
  return result;
}

unint64_t sub_1B386ECD8(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1B386ED08();
  unint64_t result = sub_1B386ED54();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_1B386ED08()
{
  unint64_t result = qword_1EB7FA790;
  if (!qword_1EB7FA790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB7FA790);
  }
  return result;
}

unint64_t sub_1B386ED54()
{
  unint64_t result = qword_1EB7FA7A0;
  if (!qword_1EB7FA7A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB7FA7A0);
  }
  return result;
}

unint64_t sub_1B386EDA4()
{
  unint64_t result = qword_1E9CCEF70;
  if (!qword_1E9CCEF70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCEF70);
  }
  return result;
}

unint64_t sub_1B386EDF0(uint64_t a1)
{
  unint64_t result = sub_1B386EE18();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1B386EE18()
{
  unint64_t result = qword_1E9CCEF78;
  if (!qword_1E9CCEF78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCEF78);
  }
  return result;
}

void sub_1B386EE64()
{
  qword_1E9CCEF88 = 0x2F64636573726170;
  unk_1E9CCEF90 = 0xEB00000000302E31;
}

uint64_t static ConfigurationContext.parsecdNameVersion.getter()
{
  if (qword_1E9CCEB88 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_1E9CCEF88;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static ConfigurationContext.productName.getter()
{
  uint64_t v0 = sub_1B3854524(1);
  return OUTLINED_FUNCTION_1_1(v0, v1);
}

uint64_t static ConfigurationContext.productVersion.getter()
{
  uint64_t v0 = sub_1B3854524(3);
  return OUTLINED_FUNCTION_1_1(v0, v1);
}

uint64_t static ConfigurationContext.regionCode.getter()
{
  uint64_t v0 = sub_1B3854524(4);
  return OUTLINED_FUNCTION_1_1(v0, v1);
}

uint64_t static ConfigurationContext.modelNumber.getter()
{
  uint64_t v0 = sub_1B3854524(6);
  return OUTLINED_FUNCTION_1_1(v0, v1);
}

ValueMetadata *type metadata accessor for ConfigurationContext()
{
  return &type metadata for ConfigurationContext;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1B386EFA8()
{
}

void sub_1B386F01C()
{
}

void sub_1B386F03C()
{
}

void sub_1B386F068()
{
}

void sub_1B386F088()
{
}

void sub_1B386F0B0()
{
}

void sub_1B386F0D0()
{
}

void sub_1B386F0F0()
{
}

void sub_1B386F11C()
{
}

void sub_1B386F148()
{
}

PegasusConfiguration::PegasusClientName_optional __swiftcall PegasusClientName.init(rawValue:)(Swift::String rawValue)
{
  int v2 = v1;
  uint64_t v3 = sub_1B389C950();
  result.value = swift_bridgeObjectRelease();
  char v5 = 0;
  char v6 = 12;
  switch(v3)
  {
    case 0:
      goto LABEL_14;
    case 1:
      char v5 = 1;
      goto LABEL_14;
    case 2:
      char v5 = 2;
      goto LABEL_14;
    case 3:
      char v5 = 3;
      goto LABEL_14;
    case 4:
      char v5 = 4;
      goto LABEL_14;
    case 5:
      char v5 = 5;
      goto LABEL_14;
    case 6:
      char v5 = 6;
      goto LABEL_14;
    case 7:
      char v5 = 7;
      goto LABEL_14;
    case 8:
      char v5 = 8;
      goto LABEL_14;
    case 9:
      char v5 = 9;
      goto LABEL_14;
    case 10:
      char v5 = 10;
      goto LABEL_14;
    case 11:
      char v5 = 11;
LABEL_14:
      char v6 = v5;
      break;
    case 12:
      break;
    case 13:
      char v6 = 13;
      break;
    case 14:
      char v6 = 14;
      break;
    case 15:
      char v6 = 15;
      break;
    case 16:
      char v6 = 16;
      break;
    case 17:
      char v6 = 17;
      break;
    case 18:
      char v6 = 18;
      break;
    case 19:
      char v6 = 19;
      break;
    case 20:
      char v6 = 20;
      break;
    case 21:
      char v6 = 21;
      break;
    case 22:
      char v6 = 22;
      break;
    case 23:
      char v6 = 23;
      break;
    case 24:
      char v6 = 24;
      break;
    case 25:
      char v6 = 25;
      break;
    case 26:
      char v6 = 26;
      break;
    case 27:
      char v6 = 27;
      break;
    case 28:
      char v6 = 28;
      break;
    case 29:
      char v6 = 29;
      break;
    default:
      char v6 = 30;
      break;
  }
  char *v2 = v6;
  return result;
}

void *static PegasusClientName.allCases.getter()
{
  return &unk_1F0C10C38;
}

uint64_t sub_1B386F3DC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1B3874578(*a1, *a2);
}

unint64_t sub_1B386F3EC()
{
  unint64_t result = qword_1E9CCEF98;
  if (!qword_1E9CCEF98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCEF98);
  }
  return result;
}

uint64_t sub_1B386F438()
{
  return sub_1B388A9AC(*v0);
}

uint64_t sub_1B386F440(uint64_t a1)
{
  return sub_1B388ADF8(a1, *v1);
}

uint64_t sub_1B386F448(uint64_t a1)
{
  return sub_1B388AE74(a1, *v1);
}

PegasusConfiguration::PegasusClientName_optional sub_1B386F450(Swift::String *a1)
{
  return PegasusClientName.init(rawValue:)(*a1);
}

uint64_t sub_1B386F45C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PegasusClientName.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_1B386F488()
{
  unint64_t result = qword_1E9CCEFA0;
  if (!qword_1E9CCEFA0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9CCEFA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCEFA0);
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

void sub_1B386F524(void *a1@<X8>)
{
  *a1 = &unk_1F0C10C38;
}

uint64_t getEnumTagSinglePayload for PegasusClientName(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xE3)
  {
    if (a2 + 29 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 29) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 30;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x1E;
  int v5 = v6 - 30;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for PegasusClientName(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 29 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 29) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE2)
  {
    unsigned int v6 = ((a2 - 227) >> 8) + 1;
    *uint64_t result = a2 + 29;
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
        JUMPOUT(0x1B386F688);
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
          *uint64_t result = a2 + 29;
        break;
    }
  }
  return result;
}

void sub_1B386F6B0(void (*a1)(void))
{
  int v3 = *(os_unfair_lock_s **)(v1 + 16);
  os_unfair_lock_lock(v3);
  a1();

  os_unfair_lock_unlock(v3);
}

uint64_t sub_1B386F718()
{
  uint64_t v0 = sub_1B389C1B0();
  __swift_allocate_value_buffer(v0, qword_1E9CCEFB0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E9CCEFB0);
  return sub_1B389C1A0();
}

void *sub_1B386F798()
{
  type metadata accessor for ParsecKeys();
  swift_allocObject();
  uint64_t result = (void *)sub_1B386F890();
  off_1E9CCEFC8 = result;
  return result;
}

uint64_t static ParsecKeys.shared.getter()
{
  if (qword_1E9CCEBA0 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t ParsecKeys.encryptedToken.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ParsecKeys.oldSecretKey.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1B386F890()
{
  uint64_t v1 = v0;
  *(void *)(v0 + 32) = 0xD000000000000016;
  *(void *)(v0 + 40) = 0x80000001B38A2580;
  uint64_t v2 = sub_1B386FBE8();
  if (v3)
  {
    uint64_t v4 = v2;
    unint64_t v5 = v3;
    if (qword_1E9CCEB98 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_1B389C1B0();
    __swift_project_value_buffer(v6, (uint64_t)qword_1E9CCEFB0);
    swift_bridgeObjectRetain_n();
    BOOL v7 = sub_1B389C190();
    os_log_type_t v8 = sub_1B389C5A0();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      uint64_t v17 = v10;
      *(_DWORD *)uint64_t v9 = 136642819;
      swift_bridgeObjectRetain();
      sub_1B3855F24(v4, v5, &v17);
      sub_1B389C6C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1B3850000, v7, v8, "read encrypted secret key - %{sensitive}s ", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B3EBAF20](v10, -1, -1);
      MEMORY[0x1B3EBAF20](v9, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    if (qword_1E9CCEB98 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_1B389C1B0();
    __swift_project_value_buffer(v11, (uint64_t)qword_1E9CCEFB0);
    uint64_t v12 = sub_1B389C190();
    os_log_type_t v13 = sub_1B389C5A0();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v17 = v15;
      *(_DWORD *)uint64_t v14 = 136642819;
      unint64_t v5 = 0x80000001B38A2580;
      sub_1B3855F24(0xD000000000000016, 0x80000001B38A2580, &v17);
      sub_1B389C6C0();
      _os_log_impl(&dword_1B3850000, v12, v13, "using old secret key - %{sensitive}s ", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B3EBAF20](v15, -1, -1);
      MEMORY[0x1B3EBAF20](v14, -1, -1);
    }
    else
    {

      unint64_t v5 = 0x80000001B38A2580;
    }
    uint64_t v4 = 0xD000000000000016;
  }
  *(void *)(v1 + 16) = v4;
  *(void *)(v1 + 24) = v5;
  return v1;
}

uint64_t sub_1B386FBE8()
{
  type metadata accessor for ParsecKeys();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1B3870094(0x654B636573726150, 0xEA00000000007379, 0x7473696C70, 0xE500000000000000, v1);
  uint64_t v3 = v2;

  if (!v3) {
    return 0;
  }
  sub_1B3870150();
  id v4 = sub_1B386FF88();
  if (v4)
  {
    if (qword_1E9CCEB98 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_1B389C1B0();
    __swift_project_value_buffer(v5, (uint64_t)qword_1E9CCEFB0);
    id v6 = v4;
    BOOL v7 = sub_1B389C190();
    os_log_type_t v8 = sub_1B389C5A0();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 138739971;
      v19[0] = v6;
      id v11 = v6;
      sub_1B389C6C0();
      *uint64_t v10 = v4;

      _os_log_impl(&dword_1B3850000, v7, v8, "parsed plist - %{sensitive}@", v9, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CCED90);
      swift_arrayDestroy();
      MEMORY[0x1B3EBAF20](v10, -1, -1);
      MEMORY[0x1B3EBAF20](v9, -1, -1);
    }
    else
    {
    }
    if (qword_1E9CCEB48 != -1) {
      swift_once();
    }
    unint64_t v13 = 0x72636553676E6F4CLL;
    if (byte_1E9CCF640)
    {
      unint64_t v13 = 0xD000000000000015;
      unint64_t v14 = 0x80000001B38A25C0;
    }
    else
    {
      unint64_t v14 = 0xED000079654B7465;
    }
    *(void *)&v18[0] = v13;
    *((void *)&v18[0] + 1) = v14;
    swift_bridgeObjectRetain();
    id v15 = objc_msgSend(v6, sel___swift_objectForKeyedSubscript_, sub_1B389C980());
    swift_unknownObjectRelease();
    if (v15)
    {
      sub_1B389C730();
      swift_unknownObjectRelease();
    }
    else
    {

      memset(v18, 0, sizeof(v18));
    }
    sub_1B3870190((uint64_t)v18, (uint64_t)v19);
    if (v19[3])
    {
      if (swift_dynamicCast())
      {
        uint64_t v12 = v17;
        swift_bridgeObjectRelease();
        return v12;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      sub_1B38701F8((uint64_t)v19);
    }
    return 0;
  }
  return 0;
}

id sub_1B386FF88()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v1 = (void *)sub_1B389C280();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithContentsOfFile_, v1);

  return v2;
}

uint64_t ParsecKeys.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ParsecKeys.__deallocating_deinit()
{
  ParsecKeys.deinit();

  return MEMORY[0x1F4186488](v0, 48, 7);
}

uint64_t type metadata accessor for ParsecKeys()
{
  return self;
}

uint64_t method lookup function for ParsecKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ParsecKeys);
}

uint64_t sub_1B3870094(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = (void *)sub_1B389C280();
  swift_bridgeObjectRelease();
  BOOL v7 = (void *)sub_1B389C280();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(a5, sel_pathForResource_ofType_, v6, v7);

  if (!v8) {
    return 0;
  }
  uint64_t v9 = sub_1B389C2B0();

  return v9;
}

unint64_t sub_1B3870150()
{
  unint64_t result = qword_1E9CCEFD0;
  if (!qword_1E9CCEFD0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E9CCEFD0);
  }
  return result;
}

uint64_t sub_1B3870190(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FBE60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B38701F8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FBE60);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t URLDataSourceOutput.data.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_1B386CEF8(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

void *URLDataSourceOutput.response.getter()
{
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = v1;
  return v1;
}

uint64_t URLDataSourceOutput.timingInfo.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t URLDataSourceOutput.init(_:_:_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t sub_1B38702C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  return NSURLSession.toDataSource(onSetup:)(a1, a2, a3);
}

uint64_t dispatch thunk of URLDataSource.data(forRequest:priority:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, float a5)
{
  unint64_t v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, __n128))(*(void *)(a4 + 8) + **(int **)(a4 + 8));
  id v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *id v11 = v5;
  v11[1] = sub_1B386C960;
  v12.n128_f32[0] = a5;
  return v14(a1, a2, a3, a4, v12);
}

uint64_t dispatch thunk of URLDataSourceConvertible.toDataSource(onSetup:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t initializeBufferWithCopyOfBuffer for UserAgent(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for URLDataSourceOutput(uint64_t a1)
{
  sub_1B386CE50(*(void *)a1, *(void *)(a1 + 8));

  return swift_bridgeObjectRelease();
}

uint64_t *initializeWithCopy for URLDataSourceOutput(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_1B386CEF8(*a2, v5);
  *a1 = v4;
  a1[1] = v5;
  id v6 = (void *)a2[2];
  uint64_t v7 = a2[3];
  a1[2] = (uint64_t)v6;
  a1[3] = v7;
  id v8 = v6;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for URLDataSourceOutput(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_1B386CEF8(*a2, v5);
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_1B386CE50(v6, v7);
  id v8 = (void *)a1[2];
  uint64_t v9 = (void *)a2[2];
  a1[2] = (uint64_t)v9;
  id v10 = v9;

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

uint64_t assignWithTake for URLDataSourceOutput(uint64_t a1, _OWORD *a2)
{
  uint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *a2;
  sub_1B386CE50(v4, v5);

  *(_OWORD *)(a1 + 16) = a2[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for URLDataSourceOutput(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 32))
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

uint64_t storeEnumTagSinglePayload for URLDataSourceOutput(uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_1B387064C(uint64_t a1, uint64_t a2, float a3)
{
  *(void *)(v4 + 24) = a2;
  *(void *)(v4 + 32) = v3;
  *(float *)(v4 + 64) = a3;
  *(void *)(v4 + 16) = a1;
  return MEMORY[0x1F4188298](sub_1B3870674, 0, 0);
}

uint64_t sub_1B3870674()
{
  OUTLINED_FUNCTION_2_0();
  __int32 v1 = *(_DWORD *)(v0 + 64);
  unint64_t v2 = (int8x16_t *)swift_task_alloc();
  *(void *)(v0 + 40) = v2;
  v2[1] = vextq_s8(*(int8x16_t *)(v0 + 24), *(int8x16_t *)(v0 + 24), 8uLL);
  v2[2].i32[0] = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1B387076C;
  uint64_t v4 = *(void *)(v0 + 16);
  return MEMORY[0x1F4188160](v4, 0, 0, 0xD00000000000001ALL, 0x80000001B38A2650, sub_1B387148C, v2, &type metadata for URLDataSourceOutput);
}

uint64_t sub_1B387076C()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3();
  *unint64_t v5 = v4;
  *(void *)(v3 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_1B3870874, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    OUTLINED_FUNCTION_6();
    return v6();
  }
}

uint64_t sub_1B3870874()
{
  OUTLINED_FUNCTION_2_0();
  swift_task_dealloc();
  OUTLINED_FUNCTION_6();
  return v0();
}

void sub_1B38708D0(uint64_t a1, uint64_t a2, uint64_t a3, float a4)
{
  uint64_t v33 = a2;
  uint64_t v28 = a1;
  uint64_t v27 = sub_1B389BA70();
  uint64_t v7 = *(void *)(v27 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x1F4188790](v27);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FAAA8);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x1F4188790](v10);
  unint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FAAE8);
  uint64_t v14 = swift_allocObject();
  *(_DWORD *)(v14 + 24) = 0;
  os_unfair_lock_t v31 = (os_unfair_lock_t)(v14 + 24);
  *(void *)(v14 + 16) = 0;
  uint64_t v32 = (id *)(v14 + 16);
  id v30 = *(id *)(a2 + 16);
  uint64_t v29 = sub_1B389BA20();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v28, v10);
  uint64_t v15 = a3;
  uint64_t v16 = v27;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v15, v27);
  unint64_t v17 = (*(unsigned __int8 *)(v11 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v18 = (v12 + *(unsigned __int8 *)(v7 + 80) + v17) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v14;
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v19 + v17, v13, v10);
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v19 + v18, v9, v16);
  aBlock[4] = sub_1B38715A4;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B3871274;
  aBlock[3] = &block_descriptor;
  uint64_t v20 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  uint64_t v21 = (void *)v29;
  id v22 = objc_msgSend(v30, sel_dataTaskWithRequest_completionHandler_, v29, v20);
  _Block_release(v20);

  objc_msgSend(v22, sel_set_callCompletionHandlerInline_, 1);
  *(float *)&double v23 = a4;
  objc_msgSend(v22, sel_setPriority_, v23);
  id v34 = v22;
  uint64_t v24 = v31;
  os_unfair_lock_lock(v31);
  sub_1B38716C0(v32);
  os_unfair_lock_unlock(v24);
  uint64_t v25 = *(void (**)(id))(v33 + 24);
  if (v25) {
    v25(v22);
  }
  objc_msgSend(v22, sel_resume);
  swift_release();
}

void sub_1B3870C54(uint64_t a1, unint64_t a2, void *a3, id a4, uint64_t a5)
{
  if (a4)
  {
    id v40 = a4;
    id v7 = a4;
    id v8 = a4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FAAA8);
    sub_1B389C4B0();
    uint64_t v9 = (id *)(a5 + 16);
    uint64_t v10 = (os_unfair_lock_s *)(a5 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(a5 + 24));
    sub_1B3871738((void **)(a5 + 16), &v40);
    os_unfair_lock_unlock((os_unfair_lock_t)(a5 + 24));
    id v11 = v40;
    if (v40)
    {
      id v12 = objc_msgSend(v40, sel_description);

      uint64_t v13 = sub_1B389C2B0();
      unint64_t v15 = v14;
    }
    else
    {
      uint64_t v13 = 0;
      unint64_t v15 = 0;
    }
    uint64_t v21 = sub_1B389BA30();
    if (v21
      && (sub_1B3871144(0xD000000000000011, 0x80000001B38A26A0, v21), uint64_t v23 = v22, swift_bridgeObjectRelease(), v23))
    {
      id v40 = 0;
      unint64_t v41 = 0xE000000000000000;
      sub_1B389C7B0();
      swift_bridgeObjectRelease();
      id v40 = (id)0xD000000000000010;
      unint64_t v41 = 0x80000001B38A26C0;
      sub_1B389C3C0();
      swift_bridgeObjectRelease();
      id v24 = v40;
      unint64_t v25 = v41;
    }
    else
    {
      swift_bridgeObjectRelease();
      id v24 = 0;
      unint64_t v25 = 0xE000000000000000;
    }
    if (qword_1E9CCEBC8 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_1B389C1B0();
    __swift_project_value_buffer(v26, (uint64_t)qword_1E9CCF650);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_1B389C190();
    os_log_type_t v28 = sub_1B389C5B0();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v39 = v10;
      uint64_t v29 = swift_slowAlloc();
      id v37 = (void *)swift_slowAlloc();
      id v40 = v37;
      *(_DWORD *)uint64_t v29 = 136315394;
      uint64_t v38 = v9;
      if (v15) {
        uint64_t v30 = v13;
      }
      else {
        uint64_t v30 = 0;
      }
      if (v15) {
        unint64_t v31 = v15;
      }
      else {
        unint64_t v31 = 0xE000000000000000;
      }
      swift_bridgeObjectRetain();
      sub_1B3855F24(v30, v31, (uint64_t *)&v40);
      sub_1B389C6C0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_1B3855F24((uint64_t)v24, v25, (uint64_t *)&v40);
      uint64_t v9 = v38;
      sub_1B389C6C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1B3850000, v27, v28, "Download for %s %s failed", (uint8_t *)v29, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1B3EBAF20](v37, -1, -1);
      uint64_t v32 = v29;
      uint64_t v10 = v39;
      MEMORY[0x1B3EBAF20](v32, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    os_unfair_lock_lock(v10);
    uint64_t v33 = v9;
  }
  else
  {
    uint64_t v10 = (os_unfair_lock_s *)(a5 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(a5 + 24));
    sub_1B3871244((void **)(a5 + 16), &v40);
    os_unfair_lock_unlock((os_unfair_lock_t)(a5 + 24));
    id v19 = v40;
    if (v40)
    {
      uint64_t v20 = (uint64_t)sub_1B3871C58();
    }
    else
    {
      uint64_t v20 = sub_1B389C230();
    }
    if (a2 >> 60 == 15) {
      id v34 = 0;
    }
    else {
      id v34 = (void *)a1;
    }
    unint64_t v35 = 0xC000000000000000;
    if (a2 >> 60 != 15) {
      unint64_t v35 = a2;
    }
    id v40 = v34;
    unint64_t v41 = v35;
    uint64_t v42 = a3;
    uint64_t v43 = v20;
    sub_1B3871724(a1, a2);
    id v36 = a3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FAAA8);
    sub_1B389C4C0();
    os_unfair_lock_lock((os_unfair_lock_t)(a5 + 24));
    uint64_t v33 = (id *)(a5 + 16);
  }
  sub_1B38716F0(v33);
  os_unfair_lock_unlock(v10);
}

double sub_1B38710E0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_1B387FB60(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a2 + 56) + 32 * v5;
    sub_1B3855FF8(v7, (uint64_t)a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_1B3871144(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  unint64_t v4 = sub_1B3857DA8(a1, a2);
  if ((v5 & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(void *)(*(void *)(a3 + 56) + 16 * v4);
  swift_bridgeObjectRetain();
  return v6;
}

uint64_t sub_1B387119C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_1B3857DA8(a1, a2), (v3 & 1) != 0)) {
    return swift_retain();
  }
  else {
    return 0;
  }
}

double sub_1B38711E0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_1B3857DA8(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 32 * v6;
    sub_1B3855FF8(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

id sub_1B3871244@<X0>(void **a1@<X0>, void **a2@<X8>)
{
  uint64_t v2 = *a1;
  *a2 = *a1;
  return v2;
}

uint64_t sub_1B3871274(uint64_t a1, void *a2, void *a3, void *a4)
{
  unint64_t v6 = a2;
  char v7 = *(void (**)(void *, unint64_t, void *, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    id v8 = v6;
    unint64_t v6 = (void *)sub_1B389BD40();
    unint64_t v10 = v9;
  }
  else
  {
    swift_retain();
    unint64_t v10 = 0xF000000000000000;
  }
  id v11 = a3;
  id v12 = a4;
  v7(v6, v10, a3, a4);

  sub_1B38716DC((uint64_t)v6, v10);

  return swift_release();
}

id sub_1B387133C(id *a1, void *a2)
{
  *a1 = a2;
  return a2;
}

uint64_t sub_1B3871380()
{
  sub_1B386C160(*(void *)(v0 + 24));
  return v0;
}

uint64_t sub_1B38713A8()
{
  uint64_t v0 = sub_1B3871380();

  return MEMORY[0x1F4186488](v0, 40, 7);
}

uint64_t sub_1B38713D8(uint64_t a1, uint64_t a2, float a3)
{
  char v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *char v7 = v3;
  v7[1] = sub_1B386C960;
  return sub_1B387064C(a1, a2, a3);
}

void sub_1B387148C(uint64_t a1)
{
  sub_1B38708D0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(float *)(v1 + 32));
}

uint64_t sub_1B3871498()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FAAA8);
  OUTLINED_FUNCTION_1();
  uint64_t v3 = v2;
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = (v4 + 24) & ~v4;
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = sub_1B389BA70();
  OUTLINED_FUNCTION_1();
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v13 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v14 = (v5 + v7 + v13) & ~v13;
  uint64_t v15 = v14 + *(void *)(v12 + 64);
  uint64_t v16 = v4 | v13 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v5, v1);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v0 + v14, v8);

  return MEMORY[0x1F4186498](v0, v15, v16);
}

void sub_1B38715A4(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FAAA8);
  sub_1B389BA70();
  uint64_t v9 = *(void *)(v4 + 16);

  sub_1B3870C54(a1, a2, a3, a4, v9);
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

id sub_1B38716C0(id *a1)
{
  return sub_1B387133C(a1, *(void **)(v1 + 16));
}

uint64_t sub_1B38716DC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1B386CE50(a1, a2);
  }
  return a1;
}

void sub_1B38716F0(id *a1)
{
  *a1 = 0;
}

uint64_t sub_1B3871724(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1B386CEF8(a1, a2);
  }
  return a1;
}

id sub_1B3871738@<X0>(void **a1@<X0>, void **a2@<X8>)
{
  return sub_1B3871244(a1, a2);
}

uint64_t BiomeStreamConfig.tableName.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t BiomeStreamConfig.messageSchemaName.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

id BiomeStreamConfig.identifier.getter()
{
  return *(id *)(v0 + 40);
}

void *initializeWithCopy for BiomeStreamConfig(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = (void *)a2[4];
  uint64_t v6 = (void *)a2[5];
  a1[4] = v5;
  a1[5] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v7 = v5;
  id v8 = v6;
  return a1;
}

void *assignWithCopy for BiomeStreamConfig(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a2[4];
  uint64_t v5 = (void *)a1[4];
  a1[4] = v4;
  id v6 = v4;

  id v7 = (void *)a2[5];
  id v8 = (void *)a1[5];
  a1[5] = v7;
  id v9 = v7;

  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for BiomeStreamConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  id v6 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);

  return a1;
}

uint64_t getEnumTagSinglePayload for BiomeStreamConfig(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 48))
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

uint64_t storeEnumTagSinglePayload for BiomeStreamConfig(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_1B38719B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FA430);
  MEMORY[0x1F4188790](v6 - 8);
  id v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1B389BAD0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (__swift_getEnumTagSinglePayload(a1, 1, v9) == 1)
  {
    sub_1B3859C40(a1, (uint64_t *)&unk_1EB7FA430);
    sub_1B38731EC(a2, a3, (uint64_t)v8);
    swift_bridgeObjectRelease();
    return sub_1B3859C40((uint64_t)v8, (uint64_t *)&unk_1EB7FA430);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, a1, v9);
    sub_1B38735CC((uint64_t)v12, a2, a3);
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1B3871B3C(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24))
  {
    sub_1B386D320((_OWORD *)a1, v4);
    sub_1B38736E4(v4, a2);
    return sub_1B38741B0(a2);
  }
  else
  {
    sub_1B3859C40(a1, &qword_1EB7FBE60);
    sub_1B3873364(a2, v4);
    sub_1B38741B0(a2);
    return sub_1B3859C40((uint64_t)v4, &qword_1EB7FBE60);
  }
}

uint64_t sub_1B3871BC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_1B386D320((_OWORD *)a1, v6);
    sub_1B3873764(v6, a2, a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1B3859C40(a1, &qword_1EB7FBE60);
    sub_1B3873494(a2, a3, v6);
    swift_bridgeObjectRelease();
    return sub_1B3859C40((uint64_t)v6, &qword_1EB7FBE60);
  }
}

char *sub_1B3871C58()
{
  uint64_t v1 = sub_1B3874024(v0);
  if (v1)
  {
    unint64_t v2 = sub_1B3872DE8(v1);
    swift_bridgeObjectRelease();
    if (v2) {
      return (char *)v2;
    }
  }
  id v4 = objc_msgSend(v0, sel__incompleteCurrentTaskTransactionMetrics);
  uint64_t v5 = sub_1B3871CDC();
  swift_bridgeObjectRelease();

  return v5;
}

char *sub_1B3871CDC()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FAB60);
  MEMORY[0x1F4188790](v2 - 8);
  OUTLINED_FUNCTION_25();
  uint64_t v182 = v3;
  OUTLINED_FUNCTION_51();
  MEMORY[0x1F4188790](v4);
  uint64_t v200 = (char *)&v182 - v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FAB58);
  MEMORY[0x1F4188790](v6 - 8);
  OUTLINED_FUNCTION_25();
  uint64_t v190 = v7;
  OUTLINED_FUNCTION_51();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_6_0();
  uint64_t v195 = v9;
  OUTLINED_FUNCTION_51();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_6_0();
  uint64_t v194 = v11;
  OUTLINED_FUNCTION_51();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_6_0();
  uint64_t v189 = v13;
  OUTLINED_FUNCTION_51();
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_6_0();
  uint64_t v188 = v15;
  OUTLINED_FUNCTION_51();
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_6_0();
  uint64_t v193 = v17;
  OUTLINED_FUNCTION_51();
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_6_0();
  uint64_t v186 = v19;
  OUTLINED_FUNCTION_51();
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_6_0();
  uint64_t v187 = v21;
  OUTLINED_FUNCTION_51();
  MEMORY[0x1F4188790](v22);
  OUTLINED_FUNCTION_6_0();
  uint64_t v185 = v23;
  OUTLINED_FUNCTION_51();
  MEMORY[0x1F4188790](v24);
  OUTLINED_FUNCTION_6_0();
  uint64_t v192 = v25;
  OUTLINED_FUNCTION_51();
  MEMORY[0x1F4188790](v26);
  OUTLINED_FUNCTION_6_0();
  uint64_t v183 = v27;
  OUTLINED_FUNCTION_51();
  MEMORY[0x1F4188790](v28);
  OUTLINED_FUNCTION_6_0();
  uint64_t v184 = v29;
  OUTLINED_FUNCTION_51();
  MEMORY[0x1F4188790](v30);
  OUTLINED_FUNCTION_6_0();
  uint64_t v198 = v31;
  OUTLINED_FUNCTION_51();
  MEMORY[0x1F4188790](v32);
  OUTLINED_FUNCTION_6_0();
  uint64_t v199 = v33;
  OUTLINED_FUNCTION_51();
  MEMORY[0x1F4188790](v34);
  OUTLINED_FUNCTION_6_0();
  uint64_t v196 = v35;
  OUTLINED_FUNCTION_51();
  MEMORY[0x1F4188790](v36);
  OUTLINED_FUNCTION_6_0();
  uint64_t v197 = v37;
  OUTLINED_FUNCTION_51();
  uint64_t v39 = MEMORY[0x1F4188790](v38);
  unint64_t v41 = (char *)&v182 - v40;
  uint64_t v42 = MEMORY[0x1F4188790](v39);
  unint64_t v44 = (char *)&v182 - v43;
  uint64_t v45 = MEMORY[0x1F4188790](v42);
  uint64_t v47 = (char *)&v182 - v46;
  uint64_t v48 = MEMORY[0x1F4188790](v45);
  uint64_t v50 = (char *)&v182 - v49;
  uint64_t v51 = MEMORY[0x1F4188790](v48);
  uint64_t v53 = (char *)&v182 - v52;
  uint64_t v54 = MEMORY[0x1F4188790](v51);
  uint64_t v56 = (char *)&v182 - v55;
  uint64_t v57 = MEMORY[0x1F4188790](v54);
  unint64_t v59 = (char *)&v182 - v58;
  MEMORY[0x1F4188790](v57);
  unint64_t v61 = (char *)&v182 - v60;
  uint64_t v205 = MEMORY[0x1E4FBC868];
  id v62 = objc_msgSend(v1, sel_requestStartDate);
  if (v62)
  {
    uint64_t v63 = v62;
    sub_1B389BDF0();

    uint64_t v64 = sub_1B389BE20();
    uint64_t v65 = (uint64_t)v59;
    uint64_t v66 = 0;
  }
  else
  {
    uint64_t v64 = sub_1B389BE20();
    uint64_t v65 = (uint64_t)v59;
    uint64_t v66 = 1;
  }
  OUTLINED_FUNCTION_8_0(v65, v66);
  sub_1B38740EC((uint64_t)v59, (uint64_t)v61, &qword_1EB7FAB58);
  sub_1B389BE20();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v61, 1, v64);
  uint64_t v68 = MEMORY[0x1E4FBB3D0];
  if (EnumTagSinglePayload == 1)
  {
    sub_1B3859C40((uint64_t)v61, &qword_1EB7FAB58);
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    sub_1B389BD50();
    uint64_t v204 = v68;
    OUTLINED_FUNCTION_1_2(v69);
    OUTLINED_FUNCTION_7_0();
    v70();
  }
  unint64_t v191 = (unint64_t)"with request id ";
  sub_1B3871BC4((uint64_t)&v202, 0xD00000000000002CLL, 0x80000001B38A26E0);
  id v71 = objc_msgSend(v1, sel_requestStartDate);
  if (v71)
  {
    double v72 = v71;
    sub_1B389BDF0();

    uint64_t v73 = 0;
  }
  else
  {
    uint64_t v73 = 1;
  }
  OUTLINED_FUNCTION_8_0((uint64_t)v53, v73);
  sub_1B38740EC((uint64_t)v53, (uint64_t)v56, &qword_1EB7FAB58);
  OUTLINED_FUNCTION_2_2((uint64_t)v56);
  if (v74)
  {
    sub_1B3859C40((uint64_t)v56, &qword_1EB7FAB58);
    OUTLINED_FUNCTION_5_0();
    uint64_t v75 = MEMORY[0x1E4FBB3D0];
  }
  else
  {
    sub_1B389BD50();
    uint64_t v75 = MEMORY[0x1E4FBB3D0];
    uint64_t v204 = MEMORY[0x1E4FBB3D0];
    OUTLINED_FUNCTION_1_2(v76);
    OUTLINED_FUNCTION_7_0();
    v77();
  }
  OUTLINED_FUNCTION_0_3(0xD00000000000001BLL, (uint64_t)"_kCFNTimingDataRequestStart");
  id v78 = objc_msgSend(v1, sel_requestStartDate);
  uint64_t v79 = v197;
  if (v78)
  {
    uint64_t v80 = v78;
    sub_1B389BDF0();

    uint64_t v81 = 0;
  }
  else
  {
    uint64_t v81 = 1;
  }
  OUTLINED_FUNCTION_8_0((uint64_t)v47, v81);
  sub_1B38740EC((uint64_t)v47, (uint64_t)v50, &qword_1EB7FAB58);
  OUTLINED_FUNCTION_2_2((uint64_t)v50);
  if (v74)
  {
    sub_1B3859C40((uint64_t)v50, &qword_1EB7FAB58);
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    sub_1B389BD50();
    uint64_t v204 = v75;
    OUTLINED_FUNCTION_1_2(v82);
    OUTLINED_FUNCTION_7_0();
    v83();
  }
  uint64_t v84 = (uint64_t)v200;
  OUTLINED_FUNCTION_0_3(0xD00000000000001DLL, (uint64_t)"_kCFNTimingDataTimingDataInit");
  id v85 = objc_msgSend(v1, sel_requestEndDate);
  if (v85)
  {
    uint64_t v86 = v85;
    sub_1B389BDF0();

    uint64_t v87 = 0;
  }
  else
  {
    uint64_t v87 = 1;
  }
  OUTLINED_FUNCTION_8_0((uint64_t)v41, v87);
  sub_1B38740EC((uint64_t)v41, (uint64_t)v44, &qword_1EB7FAB58);
  OUTLINED_FUNCTION_2_2((uint64_t)v44);
  if (v74)
  {
    sub_1B3859C40((uint64_t)v44, &qword_1EB7FAB58);
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    sub_1B389BD50();
    uint64_t v204 = v75;
    OUTLINED_FUNCTION_1_2(v88);
    OUTLINED_FUNCTION_7_0();
    v89();
  }
  uint64_t v90 = v199;
  OUTLINED_FUNCTION_9_0((uint64_t)"_kCFNTimingDataRequestEnd");
  id v91 = objc_msgSend(v1, sel_responseStartDate);
  uint64_t v92 = v198;
  if (v91)
  {
    uint64_t v93 = v91;
    uint64_t v94 = v196;
    sub_1B389BDF0();

    uint64_t v95 = v94;
    uint64_t v96 = 0;
  }
  else
  {
    uint64_t v96 = 1;
    uint64_t v95 = v196;
  }
  OUTLINED_FUNCTION_8_0(v95, v96);
  sub_1B38740EC(v95, v79, &qword_1EB7FAB58);
  OUTLINED_FUNCTION_2_2(v79);
  if (v74)
  {
    sub_1B3859C40(v79, &qword_1EB7FAB58);
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    sub_1B389BD50();
    uint64_t v204 = v75;
    OUTLINED_FUNCTION_1_2(v97);
    OUTLINED_FUNCTION_7_0();
    v98();
  }
  OUTLINED_FUNCTION_0_3(0xD00000000000001CLL, (uint64_t)"_kCFNTimingDataResponseStart");
  id v99 = objc_msgSend(v1, sel_responseEndDate);
  if (v99)
  {
    char v100 = v99;
    sub_1B389BDF0();

    uint64_t v101 = 0;
  }
  else
  {
    uint64_t v101 = 1;
  }
  OUTLINED_FUNCTION_8_0(v92, v101);
  sub_1B38740EC(v92, v90, &qword_1EB7FAB58);
  OUTLINED_FUNCTION_2_2(v90);
  if (v74)
  {
    sub_1B3859C40(v90, &qword_1EB7FAB58);
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    sub_1B389BD50();
    uint64_t v204 = v75;
    OUTLINED_FUNCTION_1_2(v102);
    OUTLINED_FUNCTION_7_0();
    v103();
  }
  OUTLINED_FUNCTION_0_3(0xD00000000000001ALL, (uint64_t)"_kCFNTimingDataResponseEnd");
  unsigned __int8 v104 = objc_msgSend(v1, sel_isReusedConnection);
  uint64_t v105 = MEMORY[0x1E4FBB390];
  uint64_t v204 = MEMORY[0x1E4FBB390];
  LOBYTE(v202) = v104;
  OUTLINED_FUNCTION_4_0(0xD00000000000001FLL, (uint64_t)"_kCFNTimingDataConnectionReused");
  id v106 = objc_msgSend(v1, sel_countOfRequestHeaderBytesSent);
  uint64_t v107 = MEMORY[0x1E4FBC1C8];
  OUTLINED_FUNCTION_11_0((uint64_t)v106);
  OUTLINED_FUNCTION_4_0(0xD000000000000020, (uint64_t)"_kCFNTimingDataRequestHeaderSize");
  OUTLINED_FUNCTION_11_0((uint64_t)objc_msgSend(v1, sel_countOfResponseHeaderBytesReceived));
  OUTLINED_FUNCTION_4_0(0xD000000000000021, (uint64_t)"_kCFNTimingDataResponseHeaderSize");
  OUTLINED_FUNCTION_11_0((uint64_t)objc_msgSend(v1, sel_countOfResponseBodyBytesReceived));
  OUTLINED_FUNCTION_4_0(0xD000000000000028, (uint64_t)"_kCFNTimingDataResponseBodyBytesReceived");
  OUTLINED_FUNCTION_11_0((uint64_t)objc_msgSend(v1, sel_countOfResponseBodyBytesAfterDecoding));
  OUTLINED_FUNCTION_4_0(0xD000000000000027, (uint64_t)"_kCFNTimingDataResponseBodyBytesDecoded");
  id v108 = objc_msgSend(v1, sel_countOfRequestBodyBytesSent);
  __n128 result = (char *)objc_msgSend(v1, sel_countOfRequestHeaderBytesSent);
  if (__OFADD__(v108, result))
  {
    __break(1u);
    goto LABEL_92;
  }
  uint64_t v204 = v107;
  unint64_t v202 = &result[(void)v108];
  OUTLINED_FUNCTION_0_3(0xD00000000000001DLL, (uint64_t)"_kCFNTimingDataTotalBytesSent");
  id v110 = objc_msgSend(v1, sel_countOfResponseBodyBytesReceived);
  __n128 result = (char *)objc_msgSend(v1, sel_countOfResponseHeaderBytesReceived);
  if (__OFADD__(v110, result))
  {
LABEL_92:
    __break(1u);
    return result;
  }
  uint64_t v204 = v107;
  unint64_t v202 = &result[(void)v110];
  OUTLINED_FUNCTION_0_3(0xD000000000000021, (uint64_t)"_kCFNTimingDataTotalBytesReceived");
  uint64_t v111 = sub_1B3874150(v1, (SEL *)&selRef__interfaceName);
  if (v112)
  {
    uint64_t v204 = MEMORY[0x1E4FBB1A0];
    unint64_t v202 = (char *)v111;
    uint64_t v203 = v112;
  }
  else
  {
    OUTLINED_FUNCTION_5_0();
  }
  uint64_t v113 = v189;
  uint64_t v114 = v190;
  uint64_t v115 = v187;
  uint64_t v116 = v184;
  sub_1B3871BC4((uint64_t)&v202, 0xD00000000000002CLL, v191 | 0x8000000000000000);
  unsigned __int8 v117 = objc_msgSend(v1, sel__connectionRace);
  uint64_t v204 = v105;
  LOBYTE(v202) = v117;
  OUTLINED_FUNCTION_4_0(0xD000000000000027, (uint64_t)"_kCFNTimingDataConnectionStopTimeCounts");
  id v118 = objc_msgSend(v1, sel__connectionIdentifier);
  if (v118)
  {
    os_log_type_t v119 = v118;
    uint64_t v120 = v182;
    sub_1B389BE50();

    uint64_t v121 = v120;
    uint64_t v122 = sub_1B389BE70();
    uint64_t v123 = v121;
    uint64_t v124 = 0;
  }
  else
  {
    uint64_t v122 = sub_1B389BE70();
    uint64_t v121 = v182;
    uint64_t v123 = v182;
    uint64_t v124 = 1;
  }
  __swift_storeEnumTagSinglePayload(v123, v124, 1, v122);
  sub_1B38740EC(v121, v84, &qword_1EB7FAB60);
  sub_1B389BE70();
  if (__swift_getEnumTagSinglePayload(v84, 1, v122) == 1)
  {
    sub_1B3859C40(v84, &qword_1EB7FAB60);
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    uint64_t v125 = sub_1B389BE30();
    uint64_t v204 = MEMORY[0x1E4FBB1A0];
    unint64_t v202 = (char *)v125;
    uint64_t v203 = v126;
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v122 - 8) + 8))(v84, v122);
  }
  uint64_t v127 = v195;
  OUTLINED_FUNCTION_0_3(0xD00000000000001DLL, (uint64_t)"_kCFNTimingDataConnectionUUID");
  unsigned int v128 = objc_msgSend(v1, sel__redirected);
  uint64_t v204 = MEMORY[0x1E4FBC4C0];
  LODWORD(v202) = v128;
  OUTLINED_FUNCTION_4_0(0xD00000000000001CLL, (uint64_t)"_kCFNTimingDataRedirectCount");
  id v129 = objc_msgSend(v1, sel_connectStartDate);
  if (v129)
  {
    v130 = v129;
    uint64_t v131 = v183;
    sub_1B389BDF0();

    uint64_t v132 = v131;
    uint64_t v133 = 0;
  }
  else
  {
    uint64_t v133 = 1;
    uint64_t v132 = v183;
  }
  OUTLINED_FUNCTION_8_0(v132, v133);
  sub_1B38740EC(v132, v116, &qword_1EB7FAB58);
  OUTLINED_FUNCTION_2_2(v116);
  if (v74)
  {
    sub_1B3859C40(v116, &qword_1EB7FAB58);
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    sub_1B389BD50();
    uint64_t v204 = MEMORY[0x1E4FBB3D0];
    OUTLINED_FUNCTION_1_2(v134);
    OUTLINED_FUNCTION_7_0();
    v135();
  }
  OUTLINED_FUNCTION_0_3(0xD00000000000001BLL, (uint64_t)"_kCFNTimingDataConnectStart");
  id v136 = objc_msgSend(v1, sel_connectEndDate);
  if (v136)
  {
    unsigned __int8 v137 = v136;
    uint64_t v138 = v185;
    sub_1B389BDF0();

    uint64_t v139 = v138;
    uint64_t v140 = 0;
  }
  else
  {
    uint64_t v140 = 1;
    uint64_t v139 = v185;
  }
  uint64_t v141 = v114;
  OUTLINED_FUNCTION_8_0(v139, v140);
  uint64_t v142 = v139;
  uint64_t v143 = v192;
  sub_1B38740EC(v142, v192, &qword_1EB7FAB58);
  OUTLINED_FUNCTION_2_2(v143);
  uint64_t v144 = v194;
  if (v74)
  {
    sub_1B3859C40(v143, &qword_1EB7FAB58);
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    sub_1B389BD50();
    uint64_t v204 = MEMORY[0x1E4FBB3D0];
    OUTLINED_FUNCTION_1_2(v145);
    OUTLINED_FUNCTION_7_0();
    v146();
  }
  OUTLINED_FUNCTION_9_0((uint64_t)"_kCFNTimingDataConnectEnd");
  id v147 = objc_msgSend(v1, sel_domainLookupStartDate);
  if (v147)
  {
    os_log_type_t v148 = v147;
    uint64_t v149 = v186;
    sub_1B389BDF0();

    uint64_t v150 = v149;
    uint64_t v151 = 0;
  }
  else
  {
    uint64_t v151 = 1;
    uint64_t v150 = v186;
  }
  OUTLINED_FUNCTION_8_0(v150, v151);
  sub_1B38740EC(v150, v115, &qword_1EB7FAB58);
  OUTLINED_FUNCTION_2_2(v115);
  if (v74)
  {
    sub_1B3859C40(v115, &qword_1EB7FAB58);
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    sub_1B389BD50();
    uint64_t v204 = MEMORY[0x1E4FBB3D0];
    OUTLINED_FUNCTION_1_2(v152);
    OUTLINED_FUNCTION_7_0();
    v153();
  }
  OUTLINED_FUNCTION_0_3(0xD000000000000020, (uint64_t)"_kCFNTimingDataDomainLookupStart");
  id v154 = objc_msgSend(v1, sel_domainLookupEndDate);
  if (v154)
  {
    id v155 = v154;
    uint64_t v156 = v188;
    sub_1B389BDF0();

    uint64_t v157 = v156;
    uint64_t v158 = 0;
  }
  else
  {
    uint64_t v158 = 1;
    uint64_t v157 = v188;
  }
  uint64_t v159 = MEMORY[0x1E4FBB1A0];
  OUTLINED_FUNCTION_8_0(v157, v158);
  uint64_t v160 = v157;
  uint64_t v161 = v193;
  sub_1B38740EC(v160, v193, &qword_1EB7FAB58);
  OUTLINED_FUNCTION_2_2(v161);
  if (v74)
  {
    sub_1B3859C40(v161, &qword_1EB7FAB58);
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    sub_1B389BD50();
    uint64_t v204 = MEMORY[0x1E4FBB3D0];
    OUTLINED_FUNCTION_1_2(v162);
    OUTLINED_FUNCTION_7_0();
    v163();
  }
  OUTLINED_FUNCTION_0_3(0xD00000000000001ELL, (uint64_t)"_kCFNTimingDataDomainLookupEnd");
  id v164 = objc_msgSend(v1, sel_fetchStartDate);
  if (v164)
  {
    id v165 = v164;
    sub_1B389BDF0();

    uint64_t v166 = 0;
  }
  else
  {
    uint64_t v166 = 1;
  }
  OUTLINED_FUNCTION_8_0(v144, v166);
  sub_1B38740EC(v144, v113, &qword_1EB7FAB58);
  OUTLINED_FUNCTION_2_2(v113);
  if (v74)
  {
    sub_1B3859C40(v113, &qword_1EB7FAB58);
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    sub_1B389BD50();
    uint64_t v204 = MEMORY[0x1E4FBB3D0];
    OUTLINED_FUNCTION_1_2(v167);
    OUTLINED_FUNCTION_7_0();
    v168();
  }
  OUTLINED_FUNCTION_9_0((uint64_t)"_kCFNTimingDataFetchStart");
  id v169 = objc_msgSend(v1, sel_secureConnectionStartDate);
  if (v169)
  {
    v170 = v169;
    sub_1B389BDF0();

    uint64_t v171 = 0;
  }
  else
  {
    uint64_t v171 = 1;
  }
  uint64_t v172 = MEMORY[0x1E4FBB3D0];
  OUTLINED_FUNCTION_8_0(v141, v171);
  sub_1B38740EC(v141, v127, &qword_1EB7FAB58);
  OUTLINED_FUNCTION_2_2(v127);
  if (v74)
  {
    sub_1B3859C40(v127, &qword_1EB7FAB58);
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    sub_1B389BD50();
    uint64_t v204 = v172;
    OUTLINED_FUNCTION_1_2(v173);
    OUTLINED_FUNCTION_7_0();
    v174();
  }
  OUTLINED_FUNCTION_0_3(0xD000000000000024, (uint64_t)"_kCFNTimingDataSecureConnectionStart");
  uint64_t v175 = sub_1B3874150(v1, (SEL *)&selRef_networkProtocolName);
  if (v176)
  {
    uint64_t v204 = v159;
    unint64_t v202 = (char *)v175;
    uint64_t v203 = v176;
  }
  else
  {
    OUTLINED_FUNCTION_5_0();
  }
  OUTLINED_FUNCTION_4_0(0xD000000000000022, (uint64_t)"_kCFNTimingDataNetworkProtocolName");
  uint64_t v177 = sub_1B389C610();
  if ((v178 & 1) == 0)
  {
    uint64_t v179 = v177;
    uint64_t v180 = sub_1B3874150(v1, (SEL *)&selRef_remoteAddress);
    if (v181)
    {
      unint64_t v202 = (char *)v180;
      uint64_t v203 = v181;
      sub_1B389C3C0();
      uint64_t v201 = v179;
      sub_1B389C8F0();
      sub_1B389C3C0();
      swift_bridgeObjectRelease();
      uint64_t v204 = v159;
      OUTLINED_FUNCTION_0_3(0xD000000000000024, (uint64_t)"_kCFNTimingDataConnectionPeerAddress");
    }
  }
  return (char *)v205;
}

unint64_t sub_1B3872DE8(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FAAF8);
    uint64_t v2 = (void *)sub_1B389C880();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
  }
  sub_1B38731B4(a1, v41);
  uint64_t v3 = v41[0];
  uint64_t v4 = v41[3];
  int64_t v29 = (unint64_t)(v41[2] + 64) >> 6;
  uint64_t v30 = v41[1];
  unint64_t v5 = v41[4];
  uint64_t v6 = &__src[40];
  uint64_t v7 = &__dst[40];
  uint64_t v8 = &v35;
  uint64_t v9 = &v37;
  unint64_t result = swift_bridgeObjectRetain();
  if (!v5) {
    goto LABEL_6;
  }
LABEL_5:
  uint64_t v31 = (v5 - 1) & v5;
  int64_t v32 = v4;
  for (unint64_t i = __clz(__rbit64(v5)) | (v4 << 6); ; unint64_t i = __clz(__rbit64(v13)) + (v14 << 6))
  {
    sub_1B3874090(*(void *)(v3 + 48) + 40 * i, (uint64_t)__src);
    sub_1B3855FF8(*(void *)(v3 + 56) + 32 * i, (uint64_t)v6);
    memcpy(__dst, __src, sizeof(__dst));
    sub_1B3874090((uint64_t)__dst, (uint64_t)v34);
    if (!swift_dynamicCast())
    {
      sub_1B3859C40((uint64_t)__dst, &qword_1EB7FAAE0);
      swift_bridgeObjectRelease();
      sub_1B386D380();
      swift_release();
      return 0;
    }
    sub_1B3855FF8((uint64_t)v7, (uint64_t)v34);
    sub_1B3859C40((uint64_t)__dst, &qword_1EB7FAAE0);
    sub_1B386D320(v34, v8);
    long long v36 = v33;
    sub_1B386D320(v8, v9);
    long long v16 = v36;
    sub_1B386D320(v9, v38);
    sub_1B386D320(v38, &v36);
    unint64_t result = sub_1B3857DA8(v16, *((uint64_t *)&v16 + 1));
    unint64_t v17 = result;
    if (v18)
    {
      uint64_t v19 = v9;
      uint64_t v20 = v8;
      uint64_t v21 = v7;
      uint64_t v22 = v3;
      uint64_t v23 = v6;
      uint64_t v24 = (_OWORD *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *uint64_t v24 = v16;
      uint64_t v6 = v23;
      uint64_t v3 = v22;
      uint64_t v7 = v21;
      uint64_t v8 = v20;
      uint64_t v9 = v19;
      uint64_t v25 = (_OWORD *)(v2[7] + 32 * v17);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v25);
      unint64_t result = (unint64_t)sub_1B386D320(&v36, v25);
      goto LABEL_28;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v2[6] + 16 * result) = v16;
    unint64_t result = (unint64_t)sub_1B386D320(&v36, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v26 = v2[2];
    BOOL v27 = __OFADD__(v26, 1);
    uint64_t v28 = v26 + 1;
    if (v27) {
      goto LABEL_34;
    }
    v2[2] = v28;
LABEL_28:
    unint64_t v5 = v31;
    uint64_t v4 = v32;
    if (v31) {
      goto LABEL_5;
    }
LABEL_6:
    int64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_35;
    }
    if (v12 >= v29) {
      goto LABEL_31;
    }
    unint64_t v13 = *(void *)(v30 + 8 * v12);
    int64_t v14 = v4 + 1;
    if (!v13)
    {
      int64_t v14 = v4 + 2;
      if (v4 + 2 >= v29) {
        goto LABEL_31;
      }
      unint64_t v13 = *(void *)(v30 + 8 * v14);
      if (!v13)
      {
        int64_t v14 = v4 + 3;
        if (v4 + 3 >= v29) {
          goto LABEL_31;
        }
        unint64_t v13 = *(void *)(v30 + 8 * v14);
        if (!v13)
        {
          int64_t v14 = v4 + 4;
          if (v4 + 4 >= v29) {
            goto LABEL_31;
          }
          unint64_t v13 = *(void *)(v30 + 8 * v14);
          if (!v13)
          {
            int64_t v14 = v4 + 5;
            if (v4 + 5 >= v29) {
              goto LABEL_31;
            }
            unint64_t v13 = *(void *)(v30 + 8 * v14);
            if (!v13)
            {
              int64_t v15 = v4 + 6;
              while (v15 < v29)
              {
                unint64_t v13 = *(void *)(v30 + 8 * v15++);
                if (v13)
                {
                  int64_t v14 = v15 - 1;
                  goto LABEL_21;
                }
              }
LABEL_31:
              sub_1B386D380();
              return (unint64_t)v2;
            }
          }
        }
      }
    }
LABEL_21:
    uint64_t v31 = (v13 - 1) & v13;
    int64_t v32 = v14;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_1B38731B4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
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

uint64_t sub_1B38731EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1B3857DA8(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v16 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCEFF8);
    sub_1B389C830();
    swift_bridgeObjectRelease();
    uint64_t v10 = *(void *)(v16 + 56);
    uint64_t v11 = sub_1B389BAD0();
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(a3, v10 + *(void *)(*(void *)(v11 - 8) + 72) * v8, v11);
    sub_1B389C840();
    *uint64_t v4 = v16;
    swift_bridgeObjectRelease();
    uint64_t v12 = a3;
    uint64_t v13 = 0;
    uint64_t v14 = v11;
  }
  else
  {
    uint64_t v14 = sub_1B389BAD0();
    uint64_t v12 = a3;
    uint64_t v13 = 1;
  }

  return __swift_storeEnumTagSinglePayload(v12, v13, 1, v14);
}

double sub_1B3873364@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1B387FB60(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA8E8);
    sub_1B389C830();
    sub_1B38741B0(*(void *)(v9 + 48) + 40 * v6);
    sub_1B386D320((_OWORD *)(*(void *)(v9 + 56) + 32 * v6), a2);
    sub_1B389C840();
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

double sub_1B3873494@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1B3857DA8(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FAB68);
    sub_1B389C830();
    swift_bridgeObjectRelease();
    sub_1B386D320((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_1B389C840();
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_1B38735CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_1B387391C(a1, a2, a3);
  *uint64_t v3 = v8;

  return swift_bridgeObjectRelease();
}

uint64_t sub_1B387365C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_isUniquelyReferenced_nonNull_native();
  OUTLINED_FUNCTION_10_0();
  sub_1B3873A88(a1, a2, a3, a4);
  *uint64_t v4 = v10;

  return swift_bridgeObjectRelease();
}

uint64_t sub_1B38736E4(_OWORD *a1, uint64_t a2)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v6 = *v2;
  uint64_t *v2 = 0x8000000000000000;
  sub_1B3873BC8(a1, a2);
  uint64_t *v2 = v6;

  return swift_bridgeObjectRelease();
}

uint64_t sub_1B3873764(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_1B3873D00(a1, a2, a3);
  *uint64_t v3 = v8;

  return swift_bridgeObjectRelease();
}

void sub_1B38737F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_1B3857DA8(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA8E0);
  if ((sub_1B389C830() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_1B3857DA8(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_11:
    sub_1B389C9A0();
    __break(1u);
    return;
  }
  unint64_t v11 = v13;
LABEL_5:
  int64_t v15 = *v4;
  if (v12)
  {
    uint64_t v16 = v15[7];

    *(void *)(v16 + 8 * v11) = a1;
  }
  else
  {
    sub_1B3857C54(v11, a2, a3, a1, v15);
    swift_bridgeObjectRetain();
  }
}

uint64_t sub_1B387391C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_1B3857DA8(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCEFF8);
  if ((sub_1B389C830() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_1B3857DA8(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_13:
    uint64_t result = sub_1B389C9A0();
    __break(1u);
    return result;
  }
  unint64_t v11 = v13;
LABEL_5:
  int64_t v15 = *v4;
  if (v12)
  {
    uint64_t v16 = v15[7];
    uint64_t v17 = sub_1B389BAD0();
    uint64_t v18 = *(void *)(v17 - 8);
    uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 40);
    uint64_t v20 = v17;
    uint64_t v21 = v16 + *(void *)(v18 + 72) * v11;
    return v19(v21, a1, v20);
  }
  else
  {
    sub_1B3873E40(v11, a2, a3, a1, v15);
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_1B3873A88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void **)v4;
  char v10 = (void *)*v4;
  unint64_t v11 = sub_1B3857DA8(a3, a4);
  if (__OFADD__(v10[2], (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v13 = v11;
  char v14 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCEFF0);
  if ((sub_1B389C830() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v15 = sub_1B3857DA8(a3, a4);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_11:
    uint64_t result = sub_1B389C9A0();
    __break(1u);
    return result;
  }
  unint64_t v13 = v15;
LABEL_5:
  uint64_t v17 = *v5;
  if (v14)
  {
    uint64_t v18 = (uint64_t *)(v17[7] + 16 * v13);
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v18 = a1;
    v18[1] = a2;
  }
  else
  {
    sub_1B3873EF0(v13, a3, a4, a1, a2, v17);
    return swift_bridgeObjectRetain();
  }
  return result;
}

_OWORD *sub_1B3873BC8(_OWORD *a1, uint64_t a2)
{
  uint64_t v3 = (void **)v2;
  uint64_t v6 = (void *)*v2;
  unint64_t v7 = sub_1B387FB60(a2);
  if (__OFADD__(v6[2], (v8 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v9 = v7;
  char v10 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA8E8);
  if ((sub_1B389C830() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v11 = sub_1B387FB60(a2);
  if ((v10 & 1) != (v12 & 1))
  {
LABEL_11:
    uint64_t result = (_OWORD *)sub_1B389C9A0();
    __break(1u);
    return result;
  }
  unint64_t v9 = v11;
LABEL_5:
  unint64_t v13 = *v3;
  if (v10)
  {
    char v14 = (_OWORD *)(v13[7] + 32 * v9);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v14);
    return sub_1B386D320(a1, v14);
  }
  else
  {
    sub_1B3874090(a2, (uint64_t)v16);
    return sub_1B3873F3C(v9, (uint64_t)v16, a1, v13);
  }
}

_OWORD *sub_1B3873D00(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void **)v3;
  char v8 = (void *)*v3;
  unint64_t v9 = sub_1B3857DA8(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FAB68);
  if ((sub_1B389C830() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_1B3857DA8(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_13:
    uint64_t result = (_OWORD *)sub_1B389C9A0();
    __break(1u);
    return result;
  }
  unint64_t v11 = v13;
LABEL_5:
  unint64_t v15 = *v4;
  if (v12)
  {
    char v16 = (_OWORD *)(v15[7] + 32 * v11);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
    return sub_1B386D320(a1, v16);
  }
  else
  {
    sub_1B3873FB8(v11, a2, a3, a1, v15);
    return (_OWORD *)swift_bridgeObjectRetain();
  }
}

uint64_t sub_1B3873E40(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  char v8 = (void *)(a5[6] + 16 * a1);
  *char v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = sub_1B389BAD0();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1, a4, v10);
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

unint64_t sub_1B3873EF0(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  a6[(result >> 6) + 8] |= 1 << result;
  uint64_t v6 = (void *)(a6[6] + 16 * result);
  *uint64_t v6 = a2;
  v6[1] = a3;
  unint64_t v7 = (void *)(a6[7] + 16 * result);
  *unint64_t v7 = a4;
  v7[1] = a5;
  uint64_t v8 = a6[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a6[2] = v10;
  }
  return result;
}

_OWORD *sub_1B3873F3C(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  uint64_t result = sub_1B386D320(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v8 = a4[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a4[2] = v10;
  }
  return result;
}

_OWORD *sub_1B3873FB8(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  long long v6 = (void *)(a5[6] + 16 * a1);
  *long long v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_1B386D320(a4, (_OWORD *)(a5[7] + 32 * a1));
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

uint64_t sub_1B3874024(void *a1)
{
  id v1 = objc_msgSend(a1, sel__timingData);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_1B389C210();

  return v3;
}

uint64_t sub_1B3874090(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1B38740EC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1B3874150(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = sub_1B389C2B0();

  return v4;
}

uint64_t sub_1B38741B0(uint64_t a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_8_0(uint64_t a1, uint64_t a2)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t sub_1B3874228()
{
  uint64_t v0 = sub_1B389C2B0();
  uint64_t v2 = v1;
  if (v0 == sub_1B389C2B0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = OUTLINED_FUNCTION_8_1();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1B3874298()
{
  return 1;
}

uint64_t sub_1B38742A0(char a1, char a2)
{
  unint64_t v3 = 0xD00000000000001ALL;
  unint64_t v4 = 0x80000001B38A1770;
  switch(a1)
  {
    case 1:
      char v5 = "SpotlightFeatureExtraction";
      goto LABEL_5;
    case 2:
      unint64_t v3 = 0xD000000000000015;
      unint64_t v4 = 0x80000001B38A17B0;
      break;
    case 3:
      char v5 = "Spotlight.SurveyDaily";
LABEL_5:
      unint64_t v4 = (unint64_t)v5 | 0x8000000000000000;
      unint64_t v3 = 0xD000000000000016;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xD00000000000001ALL;
  unint64_t v7 = 0x80000001B38A1770;
  switch(a2)
  {
    case 1:
      uint64_t v8 = "SpotlightFeatureExtraction";
      goto LABEL_10;
    case 2:
      unint64_t v6 = 0xD000000000000015;
      unint64_t v7 = 0x80000001B38A17B0;
      break;
    case 3:
      uint64_t v8 = "Spotlight.SurveyDaily";
LABEL_10:
      unint64_t v7 = (unint64_t)v8 | 0x8000000000000000;
      unint64_t v6 = 0xD000000000000016;
      break;
    default:
      break;
  }
  if (v3 == v6 && v4 == v7) {
    char v10 = 1;
  }
  else {
    char v10 = sub_1B389C920();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

uint64_t sub_1B38743FC(uint64_t a1, uint64_t a2)
{
  return sub_1B3874590(a1, a2, (uint64_t (*)(void))FeedbackStreamDescriptor.rawValue.getter);
}

BOOL sub_1B3874414(char a1, char a2)
{
  return qword_1B389E260[a1] == qword_1B389E260[a2];
}

BOOL sub_1B3874438(char a1, char a2)
{
  return qword_1B389E3C8[a1] == qword_1B389E3C8[a2];
}

uint64_t sub_1B387445C(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000014;
  unint64_t v3 = 0x80000001B38A19C0;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v5 = 0xD000000000000017;
    }
    else {
      unint64_t v5 = 0xD000000000000016;
    }
    if (v4 == 1) {
      unint64_t v6 = 0x80000001B38A19E0;
    }
    else {
      unint64_t v6 = 0x80000001B38A1A00;
    }
  }
  else
  {
    unint64_t v5 = 0xD000000000000014;
    unint64_t v6 = 0x80000001B38A19C0;
  }
  if (a2)
  {
    if (a2 == 1) {
      unint64_t v2 = 0xD000000000000017;
    }
    else {
      unint64_t v2 = 0xD000000000000016;
    }
    if (a2 == 1) {
      unint64_t v3 = 0x80000001B38A19E0;
    }
    else {
      unint64_t v3 = 0x80000001B38A1A00;
    }
  }
  if (v5 == v2 && v6 == v3) {
    char v8 = 1;
  }
  else {
    char v8 = sub_1B389C920();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

BOOL sub_1B3874550(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1 == a3;
}

BOOL sub_1B387455C(char a1, char a2)
{
  return a1 == a2;
}

BOOL sub_1B387456C(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_1B3874578(uint64_t a1, uint64_t a2)
{
  return sub_1B3874590(a1, a2, PegasusClientName.rawValue.getter);
}

uint64_t sub_1B3874590(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4 = a3();
  uint64_t v6 = v5;
  if (v4 == a3() && v6 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = OUTLINED_FUNCTION_8_1();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

void sub_1B387461C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(os_unfair_lock_s **)(v2[3] + 16);
  os_unfair_lock_lock(v5);
  uint64_t v6 = v2[4];
  v2[4] = a1;
  v2[5] = a2;
  sub_1B386C160(v6);
  swift_retain();

  os_unfair_lock_unlock(v5);
}

uint64_t sub_1B3874680(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1B389C4F0();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_1B38763B8(a1, &qword_1EB7FA880);
  }
  else
  {
    sub_1B389C4E0();
    OUTLINED_FUNCTION_17();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1B389C4A0();
    swift_unknownObjectRelease();
  }
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void *sub_1B38747EC()
{
  v0[2] = 0;
  type metadata accessor for Locker();
  uint64_t v1 = swift_allocObject();
  unint64_t v2 = (_DWORD *)swift_slowAlloc();
  *(void *)(v1 + 16) = v2;
  _DWORD *v2 = 0;
  v0[4] = 0;
  v0[5] = 0;
  v0[3] = v1;
  return v0;
}

uint64_t sub_1B3874844()
{
  uint64_t result = sub_1B389C280();
  qword_1E9CCF000 = result;
  return result;
}

id static NSNotificationName.PegasusConfigUpdate.getter()
{
  if (qword_1E9CCEBA8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = (void *)qword_1E9CCF000;

  return v0;
}

void static NSNotificationName.PegasusConfigUpdate.setter(uint64_t a1)
{
  if (qword_1E9CCEBA8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  unint64_t v2 = (void *)qword_1E9CCF000;
  qword_1E9CCF000 = a1;
}

uint64_t (*static NSNotificationName.PegasusConfigUpdate.modify())()
{
  if (qword_1E9CCEBA8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t ConfigurationManager.__allocating_init(defaults:context:configFactory:urlDataSource:delegate:)(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  OUTLINED_FUNCTION_12_0();
  uint64_t v12 = swift_allocObject();
  ConfigurationManager.init(defaults:context:configFactory:urlDataSource:delegate:)(a1, a2, a3, a4, a5, a6);
  return v12;
}

uint64_t ConfigurationManager.init(defaults:context:configFactory:urlDataSource:delegate:)(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  sub_1B3875A74(a2, (uint64_t)&v29, &qword_1EB7FA3C8);
  if (*((void *)&v30 + 1))
  {
    sub_1B3875FEC(&v29, (uint64_t)v26);
  }
  else
  {
    BOOL v27 = &type metadata for ConfigContext;
    uint64_t v28 = &off_1F0C11CE8;
    sub_1B38763B8((uint64_t)&v29, &qword_1EB7FA3C8);
  }
  if (qword_1EB7FA9A8 != -1) {
    swift_once();
  }
  long long v29 = xmmword_1EB7FA9C0;
  long long v30 = *(_OWORD *)&qword_1EB7FA9D0;
  long long v31 = xmmword_1EB7FA9E0;
  long long v32 = *(_OWORD *)&qword_1EB7FA9F0;
  if (a3)
  {
    sub_1B386CDB8((uint64_t)&v29);
    id v14 = a3;
  }
  else
  {
    id v15 = objc_allocWithZone((Class)type metadata accessor for ConfigFactoryInternal());
    sub_1B386CDB8((uint64_t)&v29);
    id v14 = objc_msgSend(v15, sel_init);
  }
  sub_1B38764F0((uint64_t)v26, (uint64_t)v25);
  type metadata accessor for PARNetworkRequestFactory();
  swift_allocObject();
  id v16 = a1;
  swift_unknownObjectRetain();
  uint64_t v17 = sub_1B3899FAC(a1);
  sub_1B3875A74(a4, (uint64_t)&v22, (uint64_t *)&unk_1EB7FA3D0);
  if (v23)
  {
    sub_1B3875FEC(&v22, (uint64_t)v24);
  }
  else
  {
    sub_1B3875AD4();
    sub_1B3874D2C(v24);
    sub_1B38763B8((uint64_t)&v22, (uint64_t *)&unk_1EB7FA3D0);
  }
  id v18 = objc_msgSend(self, sel_defaultManager);
  type metadata accessor for PegasusConfigController();
  uint64_t v19 = swift_allocObject();
  uint64_t v20 = sub_1B3875DC8((uint64_t)v25, (uint64_t)v17, (uint64_t)v24, v18, (uint64_t)v14, &v29, a5, a6, v19);

  swift_unknownObjectRelease();
  sub_1B38763B8(a4, (uint64_t *)&unk_1EB7FA3D0);
  sub_1B38763B8(a2, &qword_1EB7FA3C8);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v26);
  *(void *)(v7 + 16) = v20;
  *(void *)(v7 + 24) = &off_1F0C119C8;
  return v7;
}

id static ConfigurationManager.defaultConfigFactory.getter()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for ConfigFactoryInternal());

  return objc_msgSend(v0, sel_init);
}

void sub_1B3874D2C(void *a1@<X8>)
{
  id v2 = objc_msgSend(self, sel_ephemeralSessionConfiguration);
  objc_msgSend(v2, sel_setWaitsForConnectivity_, 1);
  objc_msgSend(v2, sel_set_disableAPWakeOnIdleConnections_, 1);
  uint64_t v3 = sub_1B389C2B0();
  sub_1B3875D64(v3, v4, v2);
  id v5 = objc_msgSend(self, sel_sessionWithConfiguration_, v2);
  a1[3] = sub_1B3875AD4();
  a1[4] = &protocol witness table for NSURLSession;

  *a1 = v5;
}

id ConfigurationManager.configuration(for:forceFetch:completion:)(unint64_t a1, char a2, void (*a3)(void, void), uint64_t a4)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA880);
  MEMORY[0x1F4188790](v9 - 8);
  unint64_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B38540E0(a1, (uint64_t)&v41);
  uint64_t v12 = v43;
  if (v43)
  {
    uint64_t v39 = a3;
    uint64_t v40 = a4;
    uint64_t v14 = v41;
    uint64_t v13 = v42;
    uint64_t v15 = v45;
    uint64_t v17 = v46;
    uint64_t v16 = v47;
    if (v41)
    {
      int v36 = v44 & 1;
      uint64_t v37 = v48;
      uint64_t v18 = sub_1B389C4F0();
      uint64_t v19 = v4;
      uint64_t v38 = v4;
      char v20 = a2 & 1;
      long long v35 = *(_OWORD *)(v19 + 16);
      __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, v18);
      uint64_t v21 = swift_allocObject();
      *(void *)(v21 + 16) = 0;
      *(void *)(v21 + 24) = 0;
      *(unsigned char *)(v21 + 32) = v20;
      *(_OWORD *)(v21 + 40) = v35;
      *(void *)(v21 + 56) = v14;
      *(void *)(v21 + 64) = v13;
      *(void *)(v21 + 72) = v12;
      *(unsigned char *)(v21 + 80) = v36;
      *(_DWORD *)(v21 + 81) = v41;
      *(_DWORD *)(v21 + 84) = *(_DWORD *)((char *)&v41 + 3);
      *(void *)(v21 + 88) = v15;
      *(void *)(v21 + 96) = v17;
      uint64_t v22 = v37;
      *(void *)(v21 + 104) = v16;
      *(void *)(v21 + 112) = v22;
      uint64_t v24 = (uint64_t)v39;
      uint64_t v23 = v40;
      *(void *)(v21 + 120) = v39;
      *(void *)(v21 + 128) = v23;
      swift_unknownObjectRetain();
      sub_1B385C748(v24);
      sub_1B3874680((uint64_t)v11, (uint64_t)&unk_1E9CCF018, v21);
      swift_release();
      return sub_1B38755A4(a1);
    }
    sub_1B3854EB4(0, v42, v43);
    a3 = v39;
  }
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CCEB60);
    uint64_t inited = (__n128 *)swift_initStackObject();
    BOOL v27 = OUTLINED_FUNCTION_11_1(inited, (__n128)xmmword_1B389D500);
    OUTLINED_FUNCTION_3_2((uint64_t)v27, MEMORY[0x1E4FBB1A0], v28);
    uint64_t v29 = sub_1B389C230();
    id v30 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    unint64_t v31 = OUTLINED_FUNCTION_9_1();
    id v34 = sub_1B3875B14(v31, v32, v33, v29);
    a3(v34, 1);
  }
  return 0;
}

uint64_t sub_1B3875064(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, _OWORD *a7, uint64_t a8)
{
  *(void *)(v8 + 192) = a8;
  *(void *)(v8 + 200) = v17;
  if (a4)
  {
    long long v9 = a7[1];
    *(_OWORD *)(v8 + 80) = *a7;
    *(_OWORD *)(v8 + 96) = v9;
    long long v10 = a7[3];
    *(_OWORD *)(v8 + 112) = a7[2];
    *(_OWORD *)(v8 + 128) = v10;
    unint64_t v11 = (void *)swift_task_alloc();
    *(void *)(v8 + 208) = v11;
    *unint64_t v11 = v8;
    v11[1] = sub_1B387519C;
    return sub_1B385F490(v8 + 80);
  }
  else
  {
    long long v13 = a7[1];
    *(_OWORD *)(v8 + 16) = *a7;
    *(_OWORD *)(v8 + 32) = v13;
    long long v14 = a7[3];
    *(_OWORD *)(v8 + 48) = a7[2];
    *(_OWORD *)(v8 + 64) = v14;
    uint64_t v15 = (void *)swift_task_alloc();
    *(void *)(v8 + 224) = v15;
    *uint64_t v15 = v8;
    v15[1] = sub_1B38753A0;
    return sub_1B385A270(v8 + 16);
  }
}

uint64_t sub_1B387519C()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  *uint64_t v3 = v2;
  v2[18] = v1;
  v2[19] = v4;
  v2[20] = v0;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_3();
  *uint64_t v6 = v5;
  *(void *)(v7 + 216) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v8 = sub_1B3875310;
  }
  else {
    uint64_t v8 = sub_1B3875284;
  }
  return MEMORY[0x1F4188298](v8, 0, 0);
}

uint64_t sub_1B3875284()
{
  OUTLINED_FUNCTION_13();
  uint64_t v1 = *(void (**)(uint64_t, void))(v0 + 192);
  if (v1)
  {
    uint64_t v2 = swift_unknownObjectRetain();
    v1(v2, 0);
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_6();
  return v3();
}

uint64_t sub_1B3875310()
{
  OUTLINED_FUNCTION_13();
  uint64_t v1 = *(void **)(v0 + 216);
  uint64_t v2 = *(void (**)(void *, uint64_t))(v0 + 192);
  if (v2)
  {
    id v3 = v1;
    v2(v1, 1);
  }
  OUTLINED_FUNCTION_6();
  return v4();
}

uint64_t sub_1B38753A0()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  *id v3 = v2;
  v2[21] = v1;
  v2[22] = v4;
  v2[23] = v0;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_3();
  *uint64_t v6 = v5;
  *(void *)(v7 + 232) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v8 = sub_1B3875514;
  }
  else {
    uint64_t v8 = sub_1B3875488;
  }
  return MEMORY[0x1F4188298](v8, 0, 0);
}

uint64_t sub_1B3875488()
{
  OUTLINED_FUNCTION_13();
  uint64_t v1 = *(void (**)(uint64_t, void))(v0 + 192);
  if (v1)
  {
    uint64_t v2 = swift_unknownObjectRetain();
    v1(v2, 0);
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_6();
  return v3();
}

uint64_t sub_1B3875514()
{
  OUTLINED_FUNCTION_13();
  uint64_t v1 = *(void **)(v0 + 232);
  uint64_t v2 = *(void (**)(void *, uint64_t))(v0 + 192);
  if (v2)
  {
    id v3 = v1;
    v2(v1, 1);
  }
  OUTLINED_FUNCTION_6();
  return v4();
}

id sub_1B38755A4(unint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)(v3 + 8) + 8))(ObjectType);
  if (v5)
  {
    sub_1B38540E0(a1, (uint64_t)v10);
    if (v10[2])
    {
      uint64_t v6 = v10[0];
      if (v10[0])
      {
        uint64_t v7 = (void *)sub_1B389C280();
        OUTLINED_FUNCTION_6_1(v6);
        id v8 = objc_msgSend(v5, sel_findConfigForUserAgent_, v7);
        swift_unknownObjectRelease();

        return v8;
      }
      else
      {
        OUTLINED_FUNCTION_6_1(0);
      }
    }
  }
  return v5;
}

uint64_t sub_1B387569C()
{
  OUTLINED_FUNCTION_13();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_4();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_3();
  *id v8 = v7;
  *(void *)(v5 + 312) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_1B38757B4, 0, 0);
  }
  else
  {
    OUTLINED_FUNCTION_16_0();
    long long v9 = *(uint64_t (**)(uint64_t))(v7 + 8);
    return v9(v3);
  }
}

uint64_t sub_1B38757B4()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_6();
  return v0();
}

uint64_t sub_1B387580C()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_6();
  return v0();
}

uint64_t ConfigurationManager.localCacheURLs.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1B3860B3C(a1);
}

uint64_t ConfigurationManager.deinit()
{
  swift_unknownObjectRelease();
  return v0;
}

uint64_t ConfigurationManager.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  uint64_t v0 = OUTLINED_FUNCTION_12_0();

  return MEMORY[0x1F4186488](v0, v1, v2);
}

id sub_1B38758D8(unint64_t a1, char a2, void (*a3)(void, void), uint64_t a4)
{
  return ConfigurationManager.configuration(for:forceFetch:completion:)(a1, a2, a3, a4);
}

uint64_t sub_1B38758FC(uint64_t a1, char a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1B38759A4;
  return ConfigurationManager.configuration(for:forceFetch:)(a1, a2);
}

uint64_t sub_1B38759A4()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0();
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3();
  *uint64_t v5 = v4;
  uint64_t v6 = swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(uint64_t))(v4 + 8);
  if (!v0) {
    uint64_t v6 = v3;
  }
  return v7(v6);
}

uint64_t sub_1B3875A74(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_17();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

unint64_t sub_1B3875AD4()
{
  unint64_t result = qword_1E9CCF008;
  if (!qword_1E9CCF008)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_1E9CCF008);
  }
  return result;
}

id sub_1B3875B14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (void *)sub_1B389C280();
  swift_bridgeObjectRelease();
  if (a4)
  {
    id v8 = (void *)sub_1B389C200();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = 0;
  }
  id v9 = objc_msgSend(v4, sel_initWithDomain_code_userInfo_, v7, a3, v8);

  return v9;
}

uint64_t sub_1B3875BC4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1B3875CA0;
  return v6(a1);
}

uint64_t sub_1B3875CA0()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_6();
  return v3();
}

void sub_1B3875D64(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_1B389C280();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_set_tlsTrustPinningPolicyName_, v4);
}

uint64_t sub_1B3875DC8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, _OWORD *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  type metadata accessor for ActivityMonitor();
  swift_allocObject();
  *(void *)(a9 + 16) = sub_1B3882840(0, 0);
  type metadata accessor for TaskCoordinator();
  swift_allocObject();
  *(void *)(a9 + 200) = sub_1B387DB48();
  type metadata accessor for ConfigUsageReporter();
  swift_allocObject();
  *(void *)(a9 + 216) = sub_1B3865E24();
  *(void *)(a9 + 232) = 0;
  swift_unknownObjectWeakInit();
  sub_1B38764F0(a1, a9 + 80);
  *(void *)(a9 + 24) = a2;
  *(void *)(a9 + 32) = &off_1F0C12840;
  sub_1B38764F0(a3, a9 + 40);
  *(void *)(a9 + 120) = a4;
  *(void *)(a9 + 128) = a5;
  long long v16 = a6[1];
  *(_OWORD *)(a9 + 136) = *a6;
  *(_OWORD *)(a9 + 152) = v16;
  long long v17 = a6[3];
  *(_OWORD *)(a9 + 168) = a6[2];
  *(_OWORD *)(a9 + 184) = v17;
  *(void *)(a9 + 232) = a8;
  swift_unknownObjectWeakAssign();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA848);
  swift_allocObject();
  swift_retain();
  id v18 = a4;
  swift_unknownObjectRetain();
  *(void *)(a9 + 240) = sub_1B38747EC();
  type metadata accessor for ConfigTaskController();
  swift_allocObject();
  uint64_t v19 = swift_retain_n();
  *(void *)(a9 + 208) = sub_1B3863E38(v19);
  uint64_t v20 = swift_allocObject();
  swift_weakInit();
  sub_1B387461C((uint64_t)sub_1B3876588, v20);
  swift_release();
  sub_1B385EBD8();
  swift_release();
  swift_release();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm(a3);
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  return a9;
}

uint64_t sub_1B3875FEC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1B3876004()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 120)) {
    swift_release();
  }

  return MEMORY[0x1F4186498](v0, 136, 7);
}

uint64_t sub_1B387606C(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  char v5 = *(unsigned char *)(v1 + 32);
  uint64_t v6 = *(void *)(v1 + 40);
  uint64_t v7 = *(void *)(v1 + 48);
  uint64_t v8 = *(void *)(v1 + 120);
  uint64_t v9 = swift_task_alloc();
  uint64_t v10 = (void *)OUTLINED_FUNCTION_10_1(v9);
  *uint64_t v10 = v11;
  v10[1] = sub_1B386C960;
  return sub_1B3875064(a1, v3, v4, v5, v6, v7, (_OWORD *)(v1 + 56), v8);
}

uint64_t dispatch thunk of ConfigAccessProvider.hashtagImagesContext.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of ConfigAccessProvider.isRefreshRequired(forConfig:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of ConfigFetcher.configuration(for:forceFetch:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t dispatch thunk of ConfigFetcher.configuration(for:forceFetch:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 16) + **(int **)(a4 + 16));
  uint64_t v8 = swift_task_alloc();
  uint64_t v9 = (void *)OUTLINED_FUNCTION_10_1(v8);
  *uint64_t v9 = v10;
  v9[1] = sub_1B387629C;
  return v12(a1, a2, a3, a4);
}

uint64_t sub_1B387629C()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_0();
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_3();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  char v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

uint64_t type metadata accessor for ConfigurationManager()
{
  return self;
}

uint64_t method lookup function for ConfigurationManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ConfigurationManager);
}

uint64_t dispatch thunk of ConfigurationManager.__allocating_init(defaults:context:configFactory:urlDataSource:delegate:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_1B38763B8(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_17();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_1B3876410()
{
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_12_0();

  return MEMORY[0x1F4186498](v0, v1, v2);
}

uint64_t sub_1B3876440()
{
  OUTLINED_FUNCTION_13();
  uint64_t v2 = v1;
  uint64_t v3 = *(int **)(v0 + 16);
  uint64_t v4 = swift_task_alloc();
  char v5 = (void *)OUTLINED_FUNCTION_10_1(v4);
  *char v5 = v6;
  v5[1] = sub_1B386C960;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1E9CCF038 + dword_1E9CCF038);
  return v7(v2, v3);
}

uint64_t sub_1B38764F0(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_17();
  (*v3)(a2);
  return a2;
}

uint64_t sub_1B3876550()
{
  swift_weakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1B3876588()
{
  return sub_1B385EB68();
}

uint64_t OUTLINED_FUNCTION_6_1(uint64_t a1)
{
  return sub_1B3854EB4(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return sub_1B389C920();
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  uint64_t v2 = v0[32];
  uint64_t v3 = v0[30];
  uint64_t v4 = v0[31];
  return sub_1B3854EB4(v3, v4, v2);
}

uint64_t getEnumTagSinglePayload for ResourceAccessOutcome(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0x93)
  {
    if (a2 + 109 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 109) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 110;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x6E;
  int v5 = v6 - 110;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for ResourceAccessOutcome(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 109 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 109) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0x93) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0x92)
  {
    unsigned int v6 = ((a2 - 147) >> 8) + 1;
    *unint64_t result = a2 + 109;
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
        JUMPOUT(0x1B3876768);
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
          *unint64_t result = a2 + 109;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ResourceAccessOutcome()
{
  return &type metadata for ResourceAccessOutcome;
}

unsigned char *storeEnumTagSinglePayload for ResourceAccessActivity(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 44 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 44) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xD4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xD3)
  {
    unsigned int v6 = ((a2 - 212) >> 8) + 1;
    *unint64_t result = a2 + 44;
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
        JUMPOUT(0x1B387686CLL);
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
          *unint64_t result = a2 + 44;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ResourceAccessActivity()
{
  return &type metadata for ResourceAccessActivity;
}

uint64_t sub_1B38768A4(uint64_t a1)
{
  uint64_t v3 = a1 - 496;
  if (!(!v2 & v1))
  {
    uint64_t result = 29;
    switch(v3)
    {
      case 0:
        return 15;
      case 1:
        return 16;
      case 2:
        return 17;
      case 3:
        return 18;
      case 4:
        return 19;
      case 5:
        return 20;
      case 6:
        return 21;
      case 7:
        return 22;
      case 8:
        return 23;
      case 9:
        return 24;
      case 10:
        return 25;
      case 11:
        return 26;
      case 12:
        return 27;
      case 13:
        return 28;
      case 14:
        return result;
      case 15:
        return 30;
      case 16:
        return 31;
      case 17:
        return 32;
      case 18:
        return 33;
      case 19:
        return 34;
      case 20:
        return 35;
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
      case 51:
      case 52:
      case 53:
      case 63:
      case 64:
      case 65:
      case 66:
      case 67:
      case 68:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 82:
      case 83:
        return 110;
      case 54:
        return 36;
      case 55:
        return 37;
      case 56:
        return 38;
      case 57:
        return 39;
      case 58:
        return 40;
      case 59:
        return 41;
      case 60:
        return 42;
      case 61:
        return 43;
      case 62:
        return 44;
      case 79:
        return 45;
      case 80:
        return 46;
      case 81:
        return 47;
      case 84:
        return 48;
      case 85:
        return 49;
      case 86:
        return 50;
      case 87:
        return 51;
      default:
        JUMPOUT(0);
    }
  }
  switch(a1)
  {
    case 700:
      return 56;
    case 701:
      return 57;
    case 702:
      return 58;
    case 1101:
      return 75;
    case 1102:
      return 76;
    case 1200:
      return 77;
    case 1420:
      return 102;
  }
  return 110;
}

uint64_t sub_1B3877050(char a1)
{
  return qword_1B389E8C0[a1];
}

uint64_t sub_1B3877064(uint64_t a1)
{
  uint64_t result = 1;
  switch(a1)
  {
    case 0:
      uint64_t result = 0;
      break;
    case 1:
      return result;
    case 2:
      uint64_t result = 2;
      break;
    case 3:
      uint64_t result = 3;
      break;
    case 4:
      uint64_t result = 4;
      break;
    case 5:
      uint64_t result = 5;
      break;
    case 6:
      uint64_t result = 6;
      break;
    case 7:
      uint64_t result = 7;
      break;
    case 8:
      uint64_t result = 8;
      break;
    case 9:
      uint64_t result = 9;
      break;
    case 10:
      uint64_t result = 10;
      break;
    case 11:
      uint64_t result = 11;
      break;
    case 12:
      uint64_t result = 12;
      break;
    case 13:
      uint64_t result = 13;
      break;
    case 14:
      uint64_t result = 14;
      break;
    case 15:
      uint64_t result = 15;
      break;
    case 16:
      uint64_t result = 16;
      break;
    case 17:
      uint64_t result = 17;
      break;
    case 18:
      uint64_t result = 18;
      break;
    case 19:
      uint64_t result = 19;
      break;
    case 20:
      uint64_t result = 20;
      break;
    case 21:
      uint64_t result = 21;
      break;
    case 22:
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
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 64:
      goto LABEL_10;
    case 23:
      uint64_t result = 22;
      break;
    case 24:
      uint64_t result = 23;
      break;
    case 25:
      uint64_t result = 24;
      break;
    case 26:
      uint64_t result = 25;
      break;
    case 27:
      uint64_t result = 26;
      break;
    case 28:
      uint64_t result = 27;
      break;
    case 29:
      uint64_t result = 28;
      break;
    case 30:
      uint64_t result = 29;
      break;
    case 31:
      uint64_t result = 30;
      break;
    case 50:
      uint64_t result = 31;
      break;
    case 60:
      uint64_t result = 32;
      break;
    case 61:
      uint64_t result = 33;
      break;
    case 62:
      uint64_t result = 34;
      break;
    case 63:
      uint64_t result = 35;
      break;
    case 65:
      uint64_t result = 36;
      break;
    case 66:
      uint64_t result = 37;
      break;
    case 67:
      uint64_t result = 38;
      break;
    default:
      switch(a1)
      {
        case 100:
          uint64_t result = 39;
          break;
        case 200:
          uint64_t result = 40;
          break;
        case 300:
          uint64_t result = 41;
          break;
        case 301:
          uint64_t result = 42;
          break;
        case 400:
          uint64_t result = 43;
          break;
        case 500:
          uint64_t result = 44;
          break;
        default:
LABEL_10:
          uint64_t result = 45;
          break;
      }
      break;
  }
  return result;
}

uint64_t sub_1B387733C(char a1)
{
  return qword_1B389EC30[a1];
}

BOOL sub_1B3877350(char *a1, char *a2)
{
  return sub_1B3874438(*a1, *a2);
}

uint64_t sub_1B387735C()
{
  return sub_1B388A9E0();
}

uint64_t sub_1B3877364()
{
  return sub_1B388AD08();
}

uint64_t sub_1B387736C()
{
  return sub_1B388B018();
}

uint64_t sub_1B3877374@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1B38768A4(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1B38773A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1B3877050(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_1B38773CC@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1B3877064(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1B38773F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1B387733C(*v1);
  *a1 = result;
  return result;
}

unint64_t sub_1B3877428()
{
  unint64_t result = qword_1EB7FA778;
  if (!qword_1EB7FA778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB7FA778);
  }
  return result;
}

unint64_t sub_1B3877478()
{
  unint64_t result = qword_1E9CCF048;
  if (!qword_1E9CCF048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCF048);
  }
  return result;
}

uint64_t sub_1B38774CC(void (*a1)(uint64_t *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  void (*v19)(uint64_t *__return_ptr, uint64_t);

  uint64_t v19 = a1;
  uint64_t v4 = *(void *)(a3 + 16);
  if (!v4) {
    return MEMORY[0x1E4FBC860];
  }
  uint64_t v6 = *(void *)(sub_1B389BAD0() - 8);
  uint64_t v7 = a3 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  uint64_t v16 = *(void *)(v6 + 72);
  swift_bridgeObjectRetain();
  uint64_t v8 = MEMORY[0x1E4FBC860];
  while (1)
  {
    v19(&v17, v7);
    if (v3) {
      break;
    }
    uint64_t v9 = v18;
    if (v18)
    {
      uint64_t v10 = v17;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1B388E31C();
        uint64_t v8 = v13;
      }
      unint64_t v11 = *(void *)(v8 + 16);
      if (v11 >= *(void *)(v8 + 24) >> 1)
      {
        sub_1B388E31C();
        uint64_t v8 = v14;
      }
      *(void *)(v8 + 16) = v11 + 1;
      uint64_t v12 = v8 + 16 * v11;
      *(void *)(v12 + 32) = v10;
      *(void *)(v12 + 40) = v9;
    }
    v7 += v16;
    if (!--v4)
    {
      swift_bridgeObjectRelease();
      return v8;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8;
}

BOOL sub_1B3877668(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_1B3877678()
{
  return sub_1B389CA20();
}

uint64_t sub_1B38776A0()
{
  return sub_1B389CA40();
}

BOOL sub_1B38776E8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1B3877668(*a1, *a2);
}

uint64_t sub_1B38776F4()
{
  return sub_1B38776A0();
}

uint64_t sub_1B38776FC()
{
  return sub_1B3877678();
}

uint64_t sub_1B3877704(uint64_t a1)
{
  uint64_t v3 = OBJC_IVAR____TtC20PegasusConfiguration23ParsecURLRequestBuilder_queryItems;
  sub_1B389BAD0();
  *(void *)(v1 + v3) = sub_1B389C230();
  uint64_t v4 = OBJC_IVAR____TtC20PegasusConfiguration23ParsecURLRequestBuilder_httpHeader;
  *(void *)(v1 + v4) = sub_1B389C230();
  uint64_t v5 = sub_1B389BB80();
  uint64_t v6 = *(void *)(v5 - 8);
  OUTLINED_FUNCTION_90();
  v7();
  uint64_t v8 = sub_1B389BAE0();
  sub_1B3877830(v8);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
  return v1;
}

uint64_t sub_1B3877830(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 16);
    if (v2)
    {
      uint64_t v3 = *(void *)(sub_1B389BAD0() - 8);
      uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
      uint64_t v5 = *(void *)(v3 + 72);
      swift_bridgeObjectRetain();
      do
      {
        sub_1B387850C(v4);
        v4 += v5;
        --v2;
      }
      while (v2);
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_1B3877908()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA440);
  uint64_t v1 = OUTLINED_FUNCTION_24(v0);
  MEMORY[0x1F4188790](v1);
  OUTLINED_FUNCTION_29();
  uint64_t v4 = v3 - v2;
  uint64_t v5 = sub_1B389BB80();
  OUTLINED_FUNCTION_1();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_4_2();
  uint64_t v11 = v9 - v10;
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (char *)v22 - v13;
  sub_1B389BB10();
  if (__swift_getEnumTagSinglePayload(v4, 1, v5) == 1)
  {
    sub_1B386D330(v4, &qword_1EB7FA440);
    sub_1B3878AB8();
    swift_allocError();
    *uint64_t v15 = 1;
    swift_willThrow();
    sub_1B389BD00();
    OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_46();
    v16();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 32))(v14, v4, v5);
    uint64_t v17 = sub_1B389BAF0();
    if (v18)
    {
      v22[4] = v17;
      v22[5] = v18;
      void v22[2] = 43;
      v22[3] = 0xE100000000000000;
      v22[0] = 3158565;
      v22[1] = 0xE300000000000000;
      sub_1B38538CC();
      sub_1B389C6F0();
      uint64_t v23 = v7;
      swift_bridgeObjectRelease();
      uint64_t v7 = v23;
      sub_1B389BB00();
    }
    OUTLINED_FUNCTION_90();
    v19();
    uint64_t v4 = swift_allocObject();
    sub_1B3877704(v11);
    sub_1B389BD00();
    OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_46();
    v20();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v14, v5);
  }
  return v4;
}

uint64_t sub_1B3877BE8(uint64_t a1)
{
  uint64_t v3 = sub_1B389BA90();
  OUTLINED_FUNCTION_1();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_3_1();
  if (!*(void *)(a1 + 16)) {
    return 0;
  }
  uint64_t v7 = sub_1B389BA80();
  MEMORY[0x1F4188790](v7);
  v10[2] = v1;
  v10[4] = sub_1B38774CC((void (*)(uint64_t *__return_ptr, uint64_t))sub_1B3878B04, (uint64_t)v10, a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCF058);
  sub_1B3878B20();
  uint64_t v8 = sub_1B389C260();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_1B3877D4C@<X0>(uint64_t *a1@<X8>)
{
  sub_1B389BAB0();
  sub_1B38538CC();
  uint64_t v2 = sub_1B389C700();
  uint64_t v4 = v3;
  uint64_t result = swift_bridgeObjectRelease();
  if (v4)
  {
    uint64_t result = sub_1B389BAC0();
    if (v6)
    {
      sub_1B389C700();
      uint64_t v8 = v7;
      uint64_t result = swift_bridgeObjectRelease();
      if (v8)
      {
        swift_bridgeObjectRetain();
        sub_1B389C3C0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_1B389C3C0();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
      }
    }
  }
  *a1 = v2;
  a1[1] = v4;
  return result;
}

uint64_t sub_1B3877E84@<X0>(uint64_t a1@<X8>)
{
  uint64_t v49 = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
  uint64_t v5 = OUTLINED_FUNCTION_24(v4);
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_29();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = sub_1B389BD00();
  OUTLINED_FUNCTION_1();
  uint64_t v50 = v10;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_4_2();
  uint64_t v47 = v12 - v13;
  MEMORY[0x1F4188790](v14);
  uint64_t v52 = (char *)&v45 - v15;
  uint64_t v16 = sub_1B389BB80();
  OUTLINED_FUNCTION_1();
  uint64_t v18 = v17;
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_3_1();
  uint64_t v20 = (uint64_t *)(v1 + OBJC_IVAR____TtC20PegasusConfiguration23ParsecURLRequestBuilder_queryItems);
  swift_beginAccess();
  uint64_t v21 = *v20;
  swift_bridgeObjectRetain_n();
  size_t v22 = sub_1B387B118(v21);
  swift_bridgeObjectRelease();
  v51[0] = v22;
  sub_1B3878A10(v51);
  if (!v2)
  {
    swift_bridgeObjectRelease();
    uint64_t v23 = v51[0];
    uint64_t v48 = v1;
    OUTLINED_FUNCTION_90();
    v24();
    sub_1B3877BE8(v23);
    swift_release();
    sub_1B389BB00();
    sub_1B389BB20();
    if (__swift_getEnumTagSinglePayload(v8, 1, v9) == 1)
    {
      sub_1B386D330(v8, (uint64_t *)&unk_1EB7FBF88);
      sub_1B3878AB8();
      swift_allocError();
      *uint64_t v25 = 1;
      swift_willThrow();
      return (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 8))(v3, v16);
    }
    uint64_t v26 = v9;
    uint64_t v27 = v50;
    uint64_t v28 = *(void (**)(char *, uint64_t))(v50 + 32);
    uint64_t v46 = v26;
    v28(v52, v8);
    uint64_t v29 = sub_1B389BCB0();
    if (v30)
    {
      uint64_t v31 = v29;
      uint64_t v32 = v30;
      BOOL v33 = v29 == 1886680168 && v30 == 0xE400000000000000;
      if (v33
        || (sub_1B389C920() & 1) != 0
        || (v31 == 0x7370747468 ? (BOOL v34 = v32 == 0xE500000000000000) : (BOOL v34 = 0), v34))
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v35 = sub_1B389C920();
        swift_bridgeObjectRelease();
        if ((v35 & 1) == 0) {
          goto LABEL_15;
        }
      }
      uint64_t v41 = v46;
      uint64_t v42 = v52;
      OUTLINED_FUNCTION_90();
      v43();
      sub_1B389BA50();
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_1B389BA40();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v42, v41);
      return (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 8))(v3, v16);
    }
LABEL_15:
    if (qword_1EB7FAAD0 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_1B389C1B0();
    __swift_project_value_buffer(v36, (uint64_t)qword_1EB7FC128);
    uint64_t v37 = sub_1B389C190();
    os_log_type_t v38 = sub_1B389C5B0();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v39 = 0;
      _os_log_impl(&dword_1B3850000, v37, v38, "Scheme for url is neither http nor https.", v39, 2u);
      MEMORY[0x1B3EBAF20](v39, -1, -1);
    }

    sub_1B3878AB8();
    swift_allocError();
    *uint64_t v40 = 0;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v52, v46);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 8))(v3, v16);
  }
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_1B387834C()
{
  sub_1B389BB80();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_46();
  v1();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1B38783C4()
{
  sub_1B387834C();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1B387841C()
{
  return type metadata accessor for ParsecURLRequestBuilder();
}

uint64_t type metadata accessor for ParsecURLRequestBuilder()
{
  uint64_t result = qword_1EB7FAA80;
  if (!qword_1EB7FAA80) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1B387846C()
{
  uint64_t result = sub_1B389BB80();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1B387850C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FA430);
  uint64_t v3 = OUTLINED_FUNCTION_24(v2);
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_29();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = sub_1B389BAB0();
  uint64_t v9 = v8;
  uint64_t v10 = sub_1B389BAD0();
  OUTLINED_FUNCTION_11();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v6, a1, v10);
  __swift_storeEnumTagSinglePayload(v6, 0, 1, v10);
  swift_beginAccess();
  sub_1B38719B0(v6, v7, v9);
  return swift_endAccess();
}

uint64_t sub_1B3878614(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FA430);
  uint64_t v6 = OUTLINED_FUNCTION_24(v5);
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_4_2();
  uint64_t v9 = v7 - v8;
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v25 - v11;
  uint64_t v13 = (uint64_t *)(v2 + OBJC_IVAR____TtC20PegasusConfiguration23ParsecURLRequestBuilder_queryItems);
  swift_beginAccess();
  uint64_t v14 = *v13;
  if (*(void *)(*v13 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v15 = sub_1B3857DA8(a1, a2);
    if (v16)
    {
      unint64_t v17 = v15;
      uint64_t v18 = *(void *)(v14 + 56);
      uint64_t v19 = sub_1B389BAD0();
      OUTLINED_FUNCTION_11();
      (*(void (**)(char *, unint64_t, uint64_t))(v20 + 16))(v12, v18 + *(void *)(v20 + 72) * v17, v19);
      uint64_t v21 = (uint64_t)v12;
      uint64_t v22 = 0;
    }
    else
    {
      uint64_t v19 = sub_1B389BAD0();
      uint64_t v21 = (uint64_t)v12;
      uint64_t v22 = 1;
    }
    __swift_storeEnumTagSinglePayload(v21, v22, 1, v19);
  }
  else
  {
    uint64_t v19 = sub_1B389BAD0();
    __swift_storeEnumTagSinglePayload((uint64_t)v12, 1, 1, v19);
    swift_bridgeObjectRetain();
  }
  swift_endAccess();
  swift_bridgeObjectRelease();
  sub_1B389BAD0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v12, 1, v19);
  uint64_t result = sub_1B386D330((uint64_t)v12, (uint64_t *)&unk_1EB7FA430);
  if (EnumTagSinglePayload == 1)
  {
    swift_bridgeObjectRetain();
    sub_1B389BAA0();
    __swift_storeEnumTagSinglePayload(v9, 0, 1, v19);
    swift_beginAccess();
    sub_1B38719B0(v9, a1, a2);
    return swift_endAccess();
  }
  return result;
}

uint64_t sub_1B387884C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = v4 + OBJC_IVAR____TtC20PegasusConfiguration23ParsecURLRequestBuilder_httpHeader;
  swift_beginAccess();
  if (!*(void *)(*(void *)v9 + 16)) {
    goto LABEL_4;
  }
  swift_bridgeObjectRetain();
  sub_1B3857DA8(a1, a2);
  if ((v10 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_4:
    swift_endAccess();
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B387365C(a3, a4, a1, a2);
  }
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B3878930(uint64_t a1)
{
  if (a1 < 0)
  {
    uint64_t result = sub_1B389C850();
    __break(1u);
  }
  else
  {
    if (a1)
    {
      sub_1B389BAD0();
      uint64_t v2 = sub_1B389C490();
      *(void *)(v2 + 16) = a1;
    }
    else
    {
      uint64_t v2 = MEMORY[0x1E4FBC860];
    }
    sub_1B389BAD0();
    return v2;
  }
  return result;
}

uint64_t sub_1B3878A10(size_t *a1)
{
  uint64_t v2 = *(void *)(sub_1B389BAD0() - 8);
  size_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    size_t v3 = sub_1B387A500(v3);
  }
  uint64_t v4 = *(void *)(v3 + 16);
  v6[0] = v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  uint64_t result = sub_1B3878B74(v6);
  *a1 = v3;
  return result;
}

unint64_t sub_1B3878AB8()
{
  unint64_t result = qword_1E9CCF050;
  if (!qword_1E9CCF050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCF050);
  }
  return result;
}

uint64_t sub_1B3878B04@<X0>(uint64_t *a1@<X8>)
{
  return sub_1B3877D4C(a1);
}

unint64_t sub_1B3878B20()
{
  unint64_t result = qword_1E9CCF060;
  if (!qword_1E9CCF060)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9CCF058);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCF060);
  }
  return result;
}

uint64_t sub_1B3878B74(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1B389BAD0();
  uint64_t v154 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  uint64_t v149 = (char *)&v140 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v163 = (char *)&v140 - v8;
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v140 - v10;
  uint64_t v12 = MEMORY[0x1F4188790](v9);
  uint64_t v14 = (char *)&v140 - v13;
  uint64_t v15 = MEMORY[0x1F4188790](v12);
  double v152 = (char *)&v140 - v16;
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  uint64_t v151 = (char *)&v140 - v18;
  uint64_t v19 = MEMORY[0x1F4188790](v17);
  id v147 = (char *)&v140 - v20;
  MEMORY[0x1F4188790](v19);
  id v146 = (char *)&v140 - v21;
  double v167 = a1;
  uint64_t v22 = a1[1];
  uint64_t result = sub_1B389C8E0();
  if (result >= v22)
  {
    if (v22 < 0) {
      goto LABEL_155;
    }
    if (v22) {
      return sub_1B387980C(0, v22, 1, v167);
    }
    return result;
  }
  uint64_t v24 = result;
  uint64_t result = sub_1B3878930(v22 / 2);
  uint64_t v142 = result;
  unint64_t v153 = v25;
  uint64_t v143 = v22;
  if (v22 <= 0) {
    goto LABEL_119;
  }
  uint64_t v141 = v24;
  uint64_t v159 = v154 + 16;
  uint64_t v160 = (void (**)(char *, uint64_t))(v154 + 8);
  uint64_t v161 = v4;
  id v165 = (void (**)(char *, uint64_t, uint64_t))(v154 + 32);
  uint64_t v26 = MEMORY[0x1E4FBC860];
  uint64_t v27 = 0;
  uint64_t v156 = v11;
  uint64_t v28 = v22;
  double v145 = v14;
  while (1)
  {
    uint64_t v29 = v27;
    if (v27 + 1 >= v28)
    {
      uint64_t v39 = v27 + 1;
      uint64_t v40 = v161;
      uint64_t v41 = v145;
    }
    else
    {
      uint64_t v164 = v28;
      uint64_t v30 = *v167;
      uint64_t v31 = *(void *)(v154 + 72);
      uint64_t v162 = v27 + 1;
      uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v154 + 16);
      uint64_t v33 = v161;
      v32(v146, v30 + v31 * (v27 + 1), v161);
      uint64_t v150 = v29;
      id v155 = (char *)v30;
      uint64_t v166 = v31;
      v32(v147, v30 + v31 * v29, v33);
      uint64_t v34 = sub_1B389BAB0();
      uint64_t v36 = v35;
      if (v34 == sub_1B389BAB0() && v36 == v37) {
        LODWORD(v158) = 0;
      }
      else {
        LODWORD(v158) = sub_1B389C920();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v40 = v161;
      uint64_t v42 = *v160;
      (*v160)(v147, v161);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v42)(v146, v40);
      uint64_t v39 = v150 + 2;
      uint64_t v28 = v164;
      if (v150 + 2 < v164)
      {
        uint64_t v144 = v26;
        v162 *= v166;
        uint64_t v43 = v155;
        uint64_t v157 = v166 * v39;
        while (1)
        {
          v32(v151, (uint64_t)&v43[v157], v40);
          v32(v152, (uint64_t)&v43[v162], v40);
          uint64_t v44 = sub_1B389BAB0();
          uint64_t v46 = v45;
          BOOL v48 = v44 == sub_1B389BAB0() && v46 == v47;
          int v49 = v48 ? 0 : sub_1B389C920();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v40 = v161;
          v42(v152, v161);
          uint64_t result = ((uint64_t (*)(char *, uint64_t))v42)(v151, v40);
          if ((v158 ^ v49)) {
            break;
          }
          ++v39;
          v43 += v166;
          uint64_t v28 = v164;
          if (v39 >= v164)
          {
            uint64_t v39 = v164;
            uint64_t v26 = v144;
            goto LABEL_24;
          }
        }
        uint64_t v26 = v144;
        uint64_t v28 = v164;
      }
LABEL_24:
      uint64_t v41 = v145;
      uint64_t v29 = v150;
      if (v158)
      {
        if (v39 < v150) {
          goto LABEL_156;
        }
        if (v150 < v39)
        {
          uint64_t v144 = v26;
          uint64_t v50 = 0;
          uint64_t v51 = v166 * (v39 - 1);
          uint64_t v52 = v39 * v166;
          uint64_t v53 = v150;
          uint64_t v54 = v150 * v166;
          uint64_t v162 = v39;
          do
          {
            if (v53 != v39 + v50 - 1)
            {
              uint64_t v55 = v155;
              if (!v155) {
                goto LABEL_162;
              }
              uint64_t v56 = &v155[v54];
              uint64_t v157 = (uint64_t)&v155[v51];
              uint64_t v40 = v161;
              uint64_t v158 = (void (*)(char *, char *, uint64_t))*v165;
              v158(v149, &v155[v54], v161);
              if (v54 < v51 || v56 >= &v55[v52])
              {
                uint64_t v58 = v157;
                swift_arrayInitWithTakeFrontToBack();
              }
              else
              {
                uint64_t v58 = v157;
                if (v54 != v51) {
                  swift_arrayInitWithTakeBackToFront();
                }
              }
              uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v158)(v58, v149, v40);
              uint64_t v39 = v162;
            }
            ++v53;
            --v50;
            v51 -= v166;
            v52 -= v166;
            v54 += v166;
          }
          while (v53 < v39 + v50);
          uint64_t v26 = v144;
          uint64_t v41 = v145;
          uint64_t v29 = v150;
          uint64_t v28 = v164;
        }
      }
    }
    if (v39 < v28)
    {
      if (__OFSUB__(v39, v29)) {
        goto LABEL_154;
      }
      if (v39 - v29 < v141)
      {
        if (__OFADD__(v29, v141)) {
          goto LABEL_157;
        }
        if (v29 + v141 >= v28) {
          uint64_t v59 = v28;
        }
        else {
          uint64_t v59 = v29 + v141;
        }
        if (v59 < v29)
        {
LABEL_158:
          __break(1u);
          goto LABEL_159;
        }
        if (v39 != v59)
        {
          uint64_t v150 = v29;
          uint64_t v144 = v26;
          uint64_t v140 = v2;
          uint64_t v60 = *(void *)(v154 + 72);
          id v155 = *(char **)(v154 + 16);
          uint64_t v61 = v60 * (v39 - 1);
          uint64_t v157 = v60;
          uint64_t v166 = v39 * v60;
          uint64_t v148 = v59;
          do
          {
            uint64_t v62 = 0;
            uint64_t v63 = v150;
            uint64_t v162 = v39;
            uint64_t v158 = (void (*)(char *, char *, uint64_t))v61;
            while (1)
            {
              uint64_t v164 = v63;
              uint64_t v64 = *v167;
              uint64_t v65 = (void (*)(char *, uint64_t, uint64_t))v155;
              ((void (*)(char *, uint64_t, uint64_t))v155)(v41, v166 + v62 + *v167, v40);
              uint64_t v66 = v61 + v62 + v64;
              double v67 = v41;
              uint64_t v68 = v156;
              v65(v156, v66, v40);
              uint64_t v69 = sub_1B389BAB0();
              uint64_t v71 = v70;
              if (v69 == sub_1B389BAB0() && v71 == v72) {
                break;
              }
              char v74 = sub_1B389C920();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v75 = *v160;
              (*v160)(v68, v40);
              uint64_t result = ((uint64_t (*)(char *, uint64_t))v75)(v67, v40);
              uint64_t v41 = v67;
              if ((v74 & 1) == 0) {
                goto LABEL_61;
              }
              uint64_t v76 = *v167;
              uint64_t v61 = (uint64_t)v158;
              if (!*v167) {
                goto LABEL_160;
              }
              uint64_t v77 = (char *)v158 + v76 + v62;
              id v78 = *v165;
              uint64_t v79 = v161;
              (*v165)(v163, v76 + v166 + v62, v161);
              swift_arrayInitWithTakeFrontToBack();
              uint64_t result = ((uint64_t (*)(char *, char *, uint64_t))v78)(v77, v163, v79);
              v62 -= v157;
              uint64_t v63 = v164 + 1;
              uint64_t v80 = v162;
              uint64_t v40 = v79;
              if (v162 == v164 + 1) {
                goto LABEL_62;
              }
            }
            swift_bridgeObjectRelease_n();
            uint64_t v81 = *v160;
            (*v160)(v68, v40);
            uint64_t result = ((uint64_t (*)(char *, uint64_t))v81)(v67, v40);
            uint64_t v41 = v67;
LABEL_61:
            uint64_t v80 = v162;
            uint64_t v61 = (uint64_t)v158;
LABEL_62:
            uint64_t v39 = v80 + 1;
            v61 += v157;
            v166 += v157;
          }
          while (v39 != v148);
          uint64_t v39 = v148;
          uint64_t v2 = v140;
          uint64_t v26 = v144;
          uint64_t v29 = v150;
        }
      }
    }
    if (v39 < v29) {
      goto LABEL_153;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_1B387A174(0, *(void *)(v26 + 16) + 1, 1, (char *)v26);
      uint64_t v26 = result;
    }
    unint64_t v83 = *(void *)(v26 + 16);
    unint64_t v82 = *(void *)(v26 + 24);
    unint64_t v84 = v83 + 1;
    uint64_t v162 = v39;
    if (v83 >= v82 >> 1)
    {
      uint64_t result = (uint64_t)sub_1B387A174((char *)(v82 > 1), v83 + 1, 1, (char *)v26);
      uint64_t v26 = result;
    }
    *(void *)(v26 + 16) = v84;
    uint64_t v85 = v26 + 32;
    uint64_t v86 = (uint64_t *)(v26 + 32 + 16 * v83);
    uint64_t v87 = v162;
    *uint64_t v86 = v29;
    v86[1] = v87;
    if (v83) {
      break;
    }
    unint64_t v84 = 1;
LABEL_112:
    uint64_t v28 = v167[1];
    uint64_t v27 = v162;
    if (v162 >= v28) {
      goto LABEL_120;
    }
  }
  while (1)
  {
    unint64_t v88 = v84 - 1;
    if (v84 >= 4)
    {
      unint64_t v93 = v85 + 16 * v84;
      uint64_t v94 = *(void *)(v93 - 64);
      uint64_t v95 = *(void *)(v93 - 56);
      BOOL v99 = __OFSUB__(v95, v94);
      uint64_t v96 = v95 - v94;
      if (v99) {
        goto LABEL_138;
      }
      uint64_t v98 = *(void *)(v93 - 48);
      uint64_t v97 = *(void *)(v93 - 40);
      BOOL v99 = __OFSUB__(v97, v98);
      uint64_t v91 = v97 - v98;
      char v92 = v99;
      if (v99) {
        goto LABEL_139;
      }
      unint64_t v100 = v84 - 2;
      uint64_t v101 = (uint64_t *)(v85 + 16 * (v84 - 2));
      uint64_t v103 = *v101;
      uint64_t v102 = v101[1];
      BOOL v99 = __OFSUB__(v102, v103);
      uint64_t v104 = v102 - v103;
      if (v99) {
        goto LABEL_140;
      }
      BOOL v99 = __OFADD__(v91, v104);
      uint64_t v105 = v91 + v104;
      if (v99) {
        goto LABEL_142;
      }
      if (v105 >= v96)
      {
        uint64_t v123 = (uint64_t *)(v85 + 16 * v88);
        uint64_t v125 = *v123;
        uint64_t v124 = v123[1];
        BOOL v99 = __OFSUB__(v124, v125);
        uint64_t v126 = v124 - v125;
        if (v99) {
          goto LABEL_148;
        }
        BOOL v116 = v91 < v126;
        goto LABEL_101;
      }
    }
    else
    {
      if (v84 != 3)
      {
        uint64_t v117 = *(void *)(v26 + 32);
        uint64_t v118 = *(void *)(v26 + 40);
        BOOL v99 = __OFSUB__(v118, v117);
        uint64_t v110 = v118 - v117;
        char v111 = v99;
        goto LABEL_95;
      }
      uint64_t v90 = *(void *)(v26 + 32);
      uint64_t v89 = *(void *)(v26 + 40);
      BOOL v99 = __OFSUB__(v89, v90);
      uint64_t v91 = v89 - v90;
      char v92 = v99;
    }
    if (v92) {
      goto LABEL_141;
    }
    unint64_t v100 = v84 - 2;
    id v106 = (uint64_t *)(v85 + 16 * (v84 - 2));
    uint64_t v108 = *v106;
    uint64_t v107 = v106[1];
    BOOL v109 = __OFSUB__(v107, v108);
    uint64_t v110 = v107 - v108;
    char v111 = v109;
    if (v109) {
      goto LABEL_143;
    }
    uint64_t v112 = (uint64_t *)(v85 + 16 * v88);
    uint64_t v114 = *v112;
    uint64_t v113 = v112[1];
    BOOL v99 = __OFSUB__(v113, v114);
    uint64_t v115 = v113 - v114;
    if (v99) {
      goto LABEL_145;
    }
    if (__OFADD__(v110, v115)) {
      goto LABEL_147;
    }
    if (v110 + v115 >= v91)
    {
      BOOL v116 = v91 < v115;
LABEL_101:
      if (v116) {
        unint64_t v88 = v100;
      }
      goto LABEL_103;
    }
LABEL_95:
    if (v111) {
      goto LABEL_144;
    }
    os_log_type_t v119 = (uint64_t *)(v85 + 16 * v88);
    uint64_t v121 = *v119;
    uint64_t v120 = v119[1];
    BOOL v99 = __OFSUB__(v120, v121);
    uint64_t v122 = v120 - v121;
    if (v99) {
      goto LABEL_146;
    }
    if (v122 < v110) {
      goto LABEL_112;
    }
LABEL_103:
    unint64_t v127 = v88 - 1;
    if (v88 - 1 >= v84)
    {
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
      goto LABEL_149;
    }
    if (!*v167) {
      goto LABEL_161;
    }
    uint64_t v128 = v26;
    id v129 = (uint64_t *)(v85 + 16 * v127);
    uint64_t v130 = *v129;
    uint64_t v131 = (void *)(v85 + 16 * v88);
    uint64_t v132 = v131[1];
    uint64_t result = sub_1B3879B84(*v167 + *(void *)(v154 + 72) * *v129, *v167 + *(void *)(v154 + 72) * *v131, *v167 + *(void *)(v154 + 72) * v132, v153);
    if (v2) {
      break;
    }
    if (v132 < v130) {
      goto LABEL_135;
    }
    if (v88 > *(void *)(v128 + 16)) {
      goto LABEL_136;
    }
    *id v129 = v130;
    *(void *)(v85 + 16 * v127 + 8) = v132;
    unint64_t v133 = *(void *)(v128 + 16);
    if (v88 >= v133) {
      goto LABEL_137;
    }
    uint64_t v26 = v128;
    unint64_t v84 = v133 - 1;
    uint64_t result = (uint64_t)memmove((void *)(v85 + 16 * v88), v131 + 2, 16 * (v133 - 1 - v88));
    *(void *)(v128 + 16) = v133 - 1;
    if (v133 <= 2) {
      goto LABEL_112;
    }
  }
LABEL_117:
  uint64_t result = swift_bridgeObjectRelease();
  if (v143 >= -1) {
    goto LABEL_132;
  }
  __break(1u);
LABEL_119:
  uint64_t v26 = MEMORY[0x1E4FBC860];
  unint64_t v84 = *(void *)(MEMORY[0x1E4FBC860] + 16);
LABEL_120:
  if (v84 >= 2)
  {
    uint64_t v134 = *v167;
    while (1)
    {
      unint64_t v135 = v84 - 2;
      if (v84 < 2) {
        break;
      }
      if (!v134) {
        goto LABEL_163;
      }
      uint64_t v136 = *(void *)(v26 + 32 + 16 * v135);
      uint64_t v137 = *(void *)(v26 + 32 + 16 * (v84 - 1) + 8);
      uint64_t result = sub_1B3879B84(v134 + *(void *)(v154 + 72) * v136, v134 + *(void *)(v154 + 72) * *(void *)(v26 + 32 + 16 * (v84 - 1)), v134 + *(void *)(v154 + 72) * v137, v153);
      if (v2) {
        goto LABEL_117;
      }
      if (v137 < v136) {
        goto LABEL_150;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_1B387A26C(v26);
        uint64_t v26 = result;
      }
      if (v135 >= *(void *)(v26 + 16)) {
        goto LABEL_151;
      }
      uint64_t v138 = (void *)(v26 + 32 + 16 * v135);
      void *v138 = v136;
      v138[1] = v137;
      unint64_t v139 = *(void *)(v26 + 16);
      if (v84 > v139) {
        goto LABEL_152;
      }
      uint64_t result = (uint64_t)memmove((void *)(v26 + 32 + 16 * (v84 - 1)), (const void *)(v26 + 32 + 16 * v84), 16 * (v139 - v84));
      *(void *)(v26 + 16) = v139 - 1;
      unint64_t v84 = v139 - 1;
      if (v139 <= 2) {
        goto LABEL_131;
      }
    }
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
    goto LABEL_158;
  }
LABEL_131:
  uint64_t result = swift_bridgeObjectRelease();
  if (v143 >= -1)
  {
LABEL_132:
    *(void *)(v142 + 16) = 0;
    return swift_bridgeObjectRelease();
  }
LABEL_159:
  __break(1u);
LABEL_160:
  __break(1u);
LABEL_161:
  __break(1u);
LABEL_162:
  __break(1u);
LABEL_163:
  __break(1u);
  return result;
}

uint64_t sub_1B387980C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v46 = a4;
  uint64_t v36 = a1;
  uint64_t v41 = sub_1B389BAD0();
  uint64_t v6 = MEMORY[0x1F4188790](v41);
  uint64_t v44 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)&v34 - v9;
  uint64_t result = MEMORY[0x1F4188790](v8);
  uint64_t v14 = (char *)&v34 - v13;
  uint64_t v42 = a3;
  uint64_t v35 = a2;
  if (a3 != a2)
  {
    uint64_t v37 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
    uint64_t v38 = v12 + 16;
    uint64_t v15 = *(void *)(v12 + 72);
    uint64_t v39 = (void (**)(char *, uint64_t))(v12 + 8);
    uint64_t v40 = v15;
    uint64_t v43 = (void (**)(char *, uint64_t, uint64_t))(v12 + 32);
    uint64_t v48 = v15 * (v42 - 1);
    uint64_t v47 = v15 * v42;
    while (2)
    {
      uint64_t v16 = 0;
      uint64_t v17 = v36;
      uint64_t v18 = v41;
      while (1)
      {
        uint64_t v19 = *v46;
        uint64_t v45 = v47 + v16;
        uint64_t v20 = v37;
        v37(v14, v47 + v16 + v19, v18);
        v20(v10, v48 + v16 + v19, v18);
        uint64_t v21 = sub_1B389BAB0();
        uint64_t v22 = v14;
        uint64_t v23 = v10;
        uint64_t v25 = v24;
        if (v21 == sub_1B389BAB0() && v25 == v26) {
          break;
        }
        char v28 = sub_1B389C920();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v29 = *v39;
        (*v39)(v23, v18);
        uint64_t result = ((uint64_t (*)(char *, uint64_t))v29)(v22, v18);
        uint64_t v10 = v23;
        uint64_t v14 = v22;
        if (v28)
        {
          uint64_t v30 = *v46;
          if (!*v46)
          {
            __break(1u);
            return result;
          }
          uint64_t v31 = v30 + v48 + v16;
          uint64_t v32 = *v43;
          uint64_t v18 = v41;
          (*v43)(v44, v30 + v47 + v16, v41);
          swift_arrayInitWithTakeFrontToBack();
          uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v32)(v31, v44, v18);
          v16 -= v40;
          ++v17;
          uint64_t v14 = v22;
          if (v42 != v17) {
            continue;
          }
        }
        goto LABEL_13;
      }
      swift_bridgeObjectRelease_n();
      uint64_t v33 = *v39;
      (*v39)(v23, v18);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v33)(v22, v18);
      uint64_t v10 = v23;
      uint64_t v14 = v22;
LABEL_13:
      v48 += v40;
      v47 += v40;
      if (++v42 != v35) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_1B3879B84(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8 = sub_1B389BAD0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  id v78 = (char *)&v67 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  uint64_t v77 = (char *)&v67 - v13;
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  uint64_t result = MEMORY[0x1F4188790](v14);
  uint64_t v19 = *(void *)(v18 + 72);
  if (!v19)
  {
    __break(1u);
LABEL_89:
    __break(1u);
LABEL_90:
    __break(1u);
    goto LABEL_91;
  }
  int64_t v20 = a2 - a1;
  if (a2 - a1 == 0x8000000000000000 && v19 == -1) {
    goto LABEL_89;
  }
  int64_t v22 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v19 == -1) {
    goto LABEL_90;
  }
  uint64_t v73 = (char *)&v67 - v16;
  uint64_t v74 = v17;
  uint64_t v24 = v20 / v19;
  uint64_t v25 = v22 / v19;
  uint64_t v76 = v19;
  if (v20 / v19 >= v22 / v19)
  {
    uint64_t result = sub_1B388F11C(a2, v22 / v19, a4);
    uint64_t v26 = (char *)(a4 + v25 * v19);
    if (v25 * v19 >= 1 && a1 < a2)
    {
      uint64_t v74 = -v19;
      uint64_t v29 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
      uint64_t v75 = v9 + 16;
      uint64_t v70 = (void (**)(char *, uint64_t))(v9 + 8);
      uint64_t v71 = v29;
      unint64_t v68 = a4;
      unint64_t v72 = a1;
      do
      {
        unint64_t v30 = a3;
        unint64_t v79 = (unint64_t)v26;
        uint64_t v31 = v74;
        uint64_t v73 = &v26[v74];
        uint64_t v32 = v71;
        ((void (*)(char *))v71)(v77);
        v32(v78, a2 + v31, v8);
        uint64_t v33 = sub_1B389BAB0();
        uint64_t v35 = v34;
        if (v33 == sub_1B389BAB0() && v35 == v36) {
          char v38 = 0;
        }
        else {
          char v38 = sub_1B389C920();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        a3 = v30 + v74;
        uint64_t v39 = *v70;
        (*v70)(v78, v8);
        uint64_t result = ((uint64_t (*)(char *, uint64_t))v39)(v77, v8);
        unint64_t v40 = v72;
        if (v38)
        {
          if (v30 < a2 || a3 >= a2)
          {
            uint64_t result = swift_arrayInitWithTakeFrontToBack();
          }
          else if (v30 != a2)
          {
            uint64_t result = swift_arrayInitWithTakeBackToFront();
          }
          a2 += v31;
          a4 = v68;
          uint64_t v19 = v76;
          uint64_t v26 = (char *)v79;
        }
        else if (v30 < v79 || a3 >= v79)
        {
          uint64_t v43 = v73;
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
          uint64_t v26 = v43;
          a4 = v68;
          uint64_t v19 = v76;
        }
        else
        {
          uint64_t v19 = v76;
          if (v30 == v79)
          {
            uint64_t v26 = v73;
          }
          else
          {
            uint64_t v44 = v73;
            uint64_t result = swift_arrayInitWithTakeBackToFront();
            uint64_t v26 = v44;
          }
          a4 = v68;
        }
      }
      while ((unint64_t)v26 > a4 && a2 > v40);
    }
  }
  else
  {
    uint64_t result = sub_1B388F11C(a1, v20 / v19, a4);
    uint64_t v26 = (char *)(a4 + v24 * v19);
    if (v24 * v19 >= 1 && a2 < a3)
    {
      uint64_t v48 = *(char **)(v9 + 16);
      uint64_t v75 = v9 + 16;
      uint64_t v77 = (char *)(v9 + 8);
      id v78 = v48;
      int v49 = v73;
      uint64_t v50 = v74;
      unint64_t v79 = a4 + v24 * v19;
      unint64_t v69 = a3;
      while (1)
      {
        uint64_t v51 = v78;
        ((void (*)(char *, unint64_t, uint64_t))v78)(v49, a2, v8);
        ((void (*)(uint64_t, unint64_t, uint64_t))v51)(v50, a4, v8);
        uint64_t v52 = sub_1B389BAB0();
        uint64_t v53 = v8;
        uint64_t v55 = v54;
        if (v52 == sub_1B389BAB0() && v55 == v56) {
          break;
        }
        uint64_t v58 = v50;
        char v59 = sub_1B389C920();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v60 = *(uint64_t (**)(char *, uint64_t))v77;
        (*(void (**)(uint64_t, uint64_t))v77)(v58, v53);
        uint64_t result = v60(v49, v53);
        uint64_t v8 = v53;
        if ((v59 & 1) == 0) {
          goto LABEL_69;
        }
        uint64_t v19 = v76;
        unint64_t v61 = a2 + v76;
        BOOL v62 = a1 < a2 || a1 >= v61;
        unint64_t v63 = v69;
        if (!v62)
        {
          uint64_t v50 = v74;
          if (a1 != a2) {
            uint64_t result = swift_arrayInitWithTakeBackToFront();
          }
          uint64_t v26 = (char *)v79;
          goto LABEL_79;
        }
        uint64_t result = swift_arrayInitWithTakeFrontToBack();
LABEL_78:
        uint64_t v26 = (char *)v79;
        uint64_t v50 = v74;
LABEL_79:
        a1 += v19;
        BOOL v66 = a4 >= (unint64_t)v26 || v61 >= v63;
        a2 = v61;
        if (v66) {
          goto LABEL_16;
        }
      }
      swift_bridgeObjectRelease_n();
      uint64_t v64 = *(uint64_t (**)(char *, uint64_t))v77;
      (*(void (**)(uint64_t, uint64_t))v77)(v50, v53);
      uint64_t result = v64(v49, v53);
      uint64_t v8 = v53;
LABEL_69:
      uint64_t v19 = v76;
      BOOL v65 = a1 < a4 || a1 >= a4 + v76;
      unint64_t v63 = v69;
      if (v65)
      {
        uint64_t result = swift_arrayInitWithTakeFrontToBack();
      }
      else if (a1 != a4)
      {
        uint64_t result = swift_arrayInitWithTakeBackToFront();
      }
      unint64_t v61 = a2;
      a4 += v19;
      goto LABEL_78;
    }
LABEL_16:
    a2 = a1;
  }
  uint64_t v46 = &v26[-a4];
  if (v19 != -1 || v46 != (char *)0x8000000000000000)
  {
    sub_1B388F11C(a4, (uint64_t)v46 / v19, a2);
    return 1;
  }
LABEL_91:
  __break(1u);
  return result;
}

char *sub_1B387A174(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCF068);
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
    memcpy(v12, v13, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1B387A26C(uint64_t a1)
{
  return sub_1B387A174(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_1B387A280(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FB6C0);
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
    sub_1B388F0A8(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1B388F474((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

size_t sub_1B387A364(size_t result, int64_t a2, char a3, uint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCF070);
  uint64_t v10 = *(void *)(sub_1B389BAD0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  uint64_t result = _swift_stdlib_malloc_size(v13);
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
  uint64_t v15 = *(void *)(sub_1B389BAD0() - 8);
  unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v17 = (unint64_t)v13 + v16;
  unint64_t v18 = a4 + v16;
  if (v5)
  {
    sub_1B388F11C(v18, v8, v17);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1B388F53C(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

size_t sub_1B387A500(uint64_t a1)
{
  return sub_1B387A364(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t getEnumTagSinglePayload for Requestor(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ParsecURLRequestBuilder.URLError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x1B387A66CLL);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_1B387A694(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ParsecURLRequestBuilder.URLError()
{
  return &type metadata for ParsecURLRequestBuilder.URLError;
}

unint64_t sub_1B387A6B4()
{
  unint64_t result = qword_1E9CCF078;
  if (!qword_1E9CCF078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCF078);
  }
  return result;
}

uint64_t static DeviceContextUtil.deviceCountryCode()()
{
  id v0 = objc_msgSend(self, sel_sharedConfiguration);
  if (!v0)
  {
    if (qword_1EB7FA940 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_1B389C1B0();
    __swift_project_value_buffer(v5, (uint64_t)qword_1EB7FC0D8);
    uint64_t v1 = (void *)sub_1B389C190();
    os_log_type_t v6 = sub_1B389C5B0();
    if (OUTLINED_FUNCTION_1_4(v6))
    {
      BOOL v7 = (_WORD *)OUTLINED_FUNCTION_12();
      *BOOL v7 = 0;
      OUTLINED_FUNCTION_92(&dword_1B3850000, v8, v9, "nil GEOCountryConfiguration received from GEOServices");
      MEMORY[0x1B3EBAF20](v7, -1, -1);
    }
    goto LABEL_8;
  }
  uint64_t v1 = v0;
  id v2 = objc_msgSend(v0, sel_countryCode);
  if (!v2)
  {
LABEL_8:

    return 0;
  }
  int v3 = v2;
  uint64_t v4 = sub_1B389C2B0();

  return v4;
}

uint64_t static DeviceContextUtil.effectiveSystemLanguage()()
{
  id v0 = (void *)sub_1B389BE90();
  if (!v0[2]) {
    goto LABEL_4;
  }
  uint64_t v2 = v0[4];
  unint64_t v1 = v0[5];
  swift_bridgeObjectRetain();
  uint64_t v3 = swift_bridgeObjectRelease();
  v33[0] = 45;
  v33[1] = 0xE100000000000000;
  MEMORY[0x1F4188790](v3);
  v32[2] = v33;
  sub_1B387B2B0(sub_1B387B460, (uint64_t)v32, v2, v1);
  if (v4)
  {
LABEL_4:
    swift_bridgeObjectRelease();
    if (qword_1EB7FA940 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_1B389C1B0();
    __swift_project_value_buffer(v13, (uint64_t)qword_1EB7FC0D8);
    uint64_t v14 = sub_1B389C190();
    os_log_type_t v15 = sub_1B389C590();
    if (os_log_type_enabled(v14, v15))
    {
      unint64_t v16 = (uint8_t *)OUTLINED_FUNCTION_12();
      *(_WORD *)unint64_t v16 = 0;
      _os_log_impl(&dword_1B3850000, v14, v15, "No preferred languages available. Set localeId with currentLocale", v16, 2u);
      MEMORY[0x1B3EBAF20](v16, -1, -1);
    }

    unint64_t v17 = self;
    uint64_t v18 = sub_1B387B3D8(v17);
    if (v18 && (uint64_t v19 = sub_1B387AB34(v18), swift_bridgeObjectRelease(), v19))
    {
      int64_t v20 = self;
      uint64_t v21 = (void *)sub_1B389C460();
      swift_bridgeObjectRelease();
      id v22 = objc_msgSend(v20, sel_preferredLocalizationsFromArray_, v21);

      uint64_t v23 = sub_1B389C470();
      if (*(void *)(v23 + 16))
      {
        uint64_t v12 = *(void *)(v23 + 32);
        swift_bridgeObjectRetain();
        goto LABEL_12;
      }
      swift_bridgeObjectRelease();
      uint64_t v24 = (void *)sub_1B389C190();
      os_log_type_t v31 = sub_1B389C5B0();
      if (OUTLINED_FUNCTION_1_4(v31))
      {
        char v28 = (_WORD *)OUTLINED_FUNCTION_12();
        *char v28 = 0;
        uint64_t v29 = "error getting effectiveSystemLanguage from NSLocale";
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v24 = (void *)sub_1B389C190();
      os_log_type_t v25 = sub_1B389C5B0();
      if (OUTLINED_FUNCTION_1_4(v25))
      {
        char v28 = (_WORD *)OUTLINED_FUNCTION_12();
        *char v28 = 0;
        uint64_t v29 = "error getting system languages from NSLocale";
LABEL_15:
        OUTLINED_FUNCTION_92(&dword_1B3850000, v26, v27, v29);
        MEMORY[0x1B3EBAF20](v28, -1, -1);
      }
    }

    return 0;
  }
  uint64_t v5 = sub_1B389C400();
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = MEMORY[0x1B3EBA010](v5, v7, v9, v11);
LABEL_12:
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_1B387AB34(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v12 = MEMORY[0x1E4FBC860];
  sub_1B387B3B8(0, v2, 0);
  uint64_t v3 = v12;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 32)
    {
      sub_1B3855FF8(i, (uint64_t)v11);
      if (!swift_dynamicCast()) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1B387B3B8(0, *(void *)(v3 + 16) + 1, 1);
        uint64_t v3 = v12;
      }
      unint64_t v6 = *(void *)(v3 + 16);
      unint64_t v5 = *(void *)(v3 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_1B387B3B8((char *)(v5 > 1), v6 + 1, 1);
        uint64_t v3 = v12;
      }
      *(void *)(v3 + 16) = v6 + 1;
      uint64_t v7 = v3 + 16 * v6;
      *(void *)(v7 + 32) = v9;
      *(void *)(v7 + 40) = v10;
      if (!--v2) {
        return v3;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

uint64_t static DeviceContextUtil.localeIdentifier()()
{
  uint64_t v1 = sub_1B389BF00();
  OUTLINED_FUNCTION_1();
  uint64_t v3 = v2;
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_70();
  id v5 = objc_msgSend(self, sel_currentLocale);
  sub_1B389BEA0();

  uint64_t v6 = sub_1B389BE80();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  return v6;
}

uint64_t static DeviceContextUtil.topPreferredLanguages()()
{
  id v0 = objc_msgSend(self, sel_preferredLanguages);
  uint64_t v1 = sub_1B389C470();

  if (*(void *)(v1 + 16) < 4uLL) {
    return v1;
  }
  sub_1B389C930();
  swift_unknownObjectRetain_n();
  uint64_t v2 = swift_dynamicCastClass();
  if (!v2)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = MEMORY[0x1E4FBC860];
  }
  uint64_t v3 = *(void *)(v2 + 16);
  swift_release();
  if (v3 != 3)
  {
    swift_bridgeObjectRelease();
    sub_1B387B058(v1, v1 + 32, 0, 7uLL);
    uint64_t v4 = v6;
    goto LABEL_7;
  }
  uint64_t v4 = swift_dynamicCastClass();
  swift_bridgeObjectRelease();
  if (!v4)
  {
    uint64_t v4 = MEMORY[0x1E4FBC860];
LABEL_7:
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t static DeviceContextUtil.region.getter()
{
  uint64_t v1 = sub_1B389BEE0();
  OUTLINED_FUNCTION_1();
  uint64_t v3 = v2;
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1B389BF00();
  OUTLINED_FUNCTION_1();
  uint64_t v9 = v8;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_70();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FA388);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = objc_msgSend(self, sel_currentLocale);
  sub_1B389BEA0();

  sub_1B389BEF0();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v0, v7);
  sub_1B389BED0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v1);
  uint64_t v15 = sub_1B389BEC0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v15) == 1)
  {
    sub_1B387B480((uint64_t)v13);
    return 0;
  }
  else
  {
    uint64_t v16 = sub_1B389BEB0();
    (*(void (**)(char *, uint64_t))(*(void *)(v15 - 8) + 8))(v13, v15);
  }
  return v16;
}

uint64_t sub_1B387B050(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

void sub_1B387B058(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
LABEL_10:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 <= 0)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4FBC860];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FB6C0);
      uint64_t v8 = (void *)swift_allocObject();
      size_t v9 = _swift_stdlib_malloc_size(v8);
      v8[2] = v5;
      v8[3] = 2 * ((uint64_t)(v9 - 32) / 16);
    }
    if (v4 != a3)
    {
      sub_1B388F474(a2 + 16 * a3, v5, (unint64_t)(v8 + 4));
      return;
    }
    goto LABEL_10;
  }
}

size_t sub_1B387B118(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCF070);
  uint64_t v3 = *(void *)(sub_1B389BAD0() - 8);
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v6);
  if (v4)
  {
    if (result - v5 != 0x8000000000000000 || v4 != -1)
    {
      uint64_t v6[2] = v1;
      v6[3] = 2 * ((uint64_t)(result - v5) / v4);
      uint64_t v9 = sub_1B387B4F0(&v10, (uint64_t)v6 + v5, v1, a1);
      swift_bridgeObjectRetain();
      sub_1B386D380();
      if (v9 == v1) {
        return (size_t)v6;
      }
      __break(1u);
      return MEMORY[0x1E4FBC860];
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1B387B26C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 == a3 && a2 == a4) {
    return 1;
  }
  else {
    return sub_1B389C920() & 1;
  }
}

unint64_t sub_1B387B2B0(uint64_t (*a1)(void *), uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v5 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    uint64_t v5 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (!v5) {
    return 0;
  }
  while (1)
  {
    unint64_t v7 = sub_1B389C3A0();
    v12[0] = sub_1B389C3F0();
    v12[1] = v8;
    char v9 = a1(v12);
    if (v4) {
      break;
    }
    char v10 = v9;
    swift_bridgeObjectRelease();
    if (v10) {
      return v7;
    }
    if (v7 < 0x4000) {
      return 0;
    }
  }
  swift_bridgeObjectRelease();
  return v7;
}

char *sub_1B387B3B8(char *a1, int64_t a2, char a3)
{
  size_t result = sub_1B387A280(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

uint64_t sub_1B387B3D8(void *a1)
{
  id v1 = objc_msgSend(a1, sel_systemLanguages);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_1B389C470();

  return v3;
}

uint64_t sub_1B387B434(uint64_t *a1, uint64_t *a2)
{
  return sub_1B387B26C(*a1, a1[1], *a2, a2[1]) & 1;
}

uint64_t sub_1B387B460(uint64_t *a1)
{
  return sub_1B387B434(a1, *(uint64_t **)(v1 + 16)) & 1;
}

uint64_t sub_1B387B480(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FA388);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for DeviceContextUtil()
{
  return &type metadata for DeviceContextUtil;
}

uint64_t sub_1B387B4F0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_1B389BAD0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  uint64_t v42 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x1F4188790](v10);
  uint64_t v41 = (char *)&v32 - v13;
  uint64_t v43 = a4;
  uint64_t v16 = *(void *)(a4 + 64);
  uint64_t v15 = a4 + 64;
  uint64_t v14 = v16;
  uint64_t v37 = v15;
  uint64_t v17 = -1 << *(unsigned char *)(v15 - 32);
  if (-v17 < 64) {
    uint64_t v18 = ~(-1 << -(char)v17);
  }
  else {
    uint64_t v18 = -1;
  }
  unint64_t v19 = v18 & v14;
  if (!a2)
  {
    int64_t v20 = 0;
    a3 = 0;
LABEL_38:
    uint64_t v31 = v37;
    *a1 = v43;
    a1[1] = v31;
    a1[2] = ~v17;
    a1[3] = v20;
    a1[4] = v19;
    return a3;
  }
  if (!a3)
  {
    int64_t v20 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v34 = -1 << *(unsigned char *)(v15 - 32);
  uint64_t v35 = a1;
  int64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v38 = v9 + 32;
  uint64_t v39 = v9 + 16;
  int64_t v36 = (unint64_t)(63 - v17) >> 6;
  int64_t v33 = v36 - 1;
  uint64_t v40 = a3;
  id v22 = v41;
  if (!v19) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v23 = __clz(__rbit64(v19));
  v19 &= v19 - 1;
  unint64_t v24 = v23 | (v20 << 6);
  while (1)
  {
    ++v21;
    char v28 = v42;
    uint64_t v29 = *(void *)(v9 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v42, *(void *)(v43 + 56) + v29 * v24, v8);
    unint64_t v30 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v30(v22, v28, v8);
    uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v30)(a2, v22, v8);
    a3 = v40;
    if (v21 == v40) {
      goto LABEL_37;
    }
    a2 += v29;
    if (v19) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v25 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v25 >= v36) {
      goto LABEL_32;
    }
    unint64_t v26 = *(void *)(v37 + 8 * v25);
    if (!v26) {
      break;
    }
LABEL_18:
    unint64_t v19 = (v26 - 1) & v26;
    unint64_t v24 = __clz(__rbit64(v26)) + (v25 << 6);
    int64_t v20 = v25;
  }
  v20 += 2;
  if (v25 + 1 >= v36)
  {
    unint64_t v19 = 0;
    int64_t v20 = v25;
    goto LABEL_36;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v20);
  if (v26) {
    goto LABEL_14;
  }
  int64_t v27 = v25 + 2;
  if (v25 + 2 >= v36) {
    goto LABEL_32;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v27);
  if (v26) {
    goto LABEL_17;
  }
  int64_t v20 = v25 + 3;
  if (v25 + 3 >= v36)
  {
    unint64_t v19 = 0;
    int64_t v20 = v25 + 2;
    goto LABEL_36;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v20);
  if (v26)
  {
LABEL_14:
    int64_t v25 = v20;
    goto LABEL_18;
  }
  int64_t v27 = v25 + 4;
  if (v25 + 4 >= v36)
  {
LABEL_32:
    unint64_t v19 = 0;
LABEL_36:
    a3 = v21;
LABEL_37:
    uint64_t v17 = v34;
    a1 = v35;
    goto LABEL_38;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v27);
  if (v26)
  {
LABEL_17:
    int64_t v25 = v27;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v25 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v25 >= v36)
    {
      unint64_t v19 = 0;
      int64_t v20 = v33;
      goto LABEL_36;
    }
    unint64_t v26 = *(void *)(v37 + 8 * v25);
    ++v27;
    if (v26) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

unint64_t KnownAggregationRecipeClient.descriptorName.getter()
{
  return OUTLINED_FUNCTION_3_4(19);
}

uint64_t KnownAggregationRecipeClient.sodaClientName.getter()
{
  return OUTLINED_FUNCTION_1_5(0x7053u);
}

uint64_t KnownAggregationRecipeClient.adHocRecipesAllowed.getter()
{
  if (qword_1E9CCEB48 != -1) {
    swift_once();
  }
  return byte_1E9CCF640;
}

uint64_t KnownAggregationRecipeClient.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  return sub_1B387B934(a1);
}

uint64_t KnownAggregationRecipeClient.rawValue.getter()
{
  return OUTLINED_FUNCTION_1_5(0x7073u);
}

uint64_t sub_1B387B8C8@<X0>(BOOL *a1@<X8>)
{
  return KnownAggregationRecipeClient.init(rawValue:)(a1);
}

uint64_t sub_1B387B8D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = KnownAggregationRecipeClient.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t KnownAggregationProcessBundleId.assetContainerPath.getter()
{
  return OUTLINED_FUNCTION_3_4(61);
}

uint64_t KnownAggregationProcessBundleId.uafAssetSpecifierSuffix.getter()
{
  return 5718355;
}

uint64_t KnownAggregationProcessBundleId.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  return sub_1B387B934(a1);
}

uint64_t sub_1B387B934@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_1B389C8B0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

unint64_t KnownAggregationProcessBundleId.rawValue.getter()
{
  return OUTLINED_FUNCTION_3_4(38);
}

uint64_t sub_1B387B9AC@<X0>(BOOL *a1@<X8>)
{
  return KnownAggregationProcessBundleId.init(rawValue:)(a1);
}

unint64_t sub_1B387B9B8@<X0>(void *a1@<X8>)
{
  unint64_t result = KnownAggregationProcessBundleId.rawValue.getter();
  *a1 = 0xD000000000000026;
  a1[1] = v3;
  return result;
}

uint64_t KnownAggregationRecipeName.sodaRecipeDirectory.getter()
{
  if (*v0 > 1u)
  {
    uint64_t v2 = 0;
  }
  else
  {
    sub_1B389C7B0();
    swift_bridgeObjectRelease();
    uint64_t v2 = 0x6867696C746F7053;
  }
  sub_1B389C3C0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_4();
  return v2;
}

unint64_t KnownAggregationRecipeName.rawValue.getter()
{
  unint64_t result = 0xD00000000000001ALL;
  switch(*v0)
  {
    case 1:
    case 3:
      unint64_t result = 0xD000000000000016;
      break;
    case 2:
      unint64_t result = 0xD000000000000015;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t KnownAggregationRecipeName.recipeFileName.getter()
{
  return 0;
}

uint64_t KnownAggregationRecipeName.uafAssetSpecifier.getter()
{
  return *(void *)&aExtractireport[8 * *v0];
}

uint64_t KnownAggregationRecipeName.telemetryIdentifier.getter()
{
  return *v0 + 1;
}

PegasusConfiguration::KnownAggregationRecipeName_optional __swiftcall KnownAggregationRecipeName.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1B389C8B0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

void *static KnownAggregationRecipeName.allCases.getter()
{
  return &unk_1F0C11548;
}

uint64_t sub_1B387BCDC(char *a1, char *a2)
{
  return sub_1B38742A0(*a1, *a2);
}

uint64_t sub_1B387BCE8()
{
  return sub_1B388AAA4();
}

uint64_t sub_1B387BCF0()
{
  return sub_1B388ABF4();
}

uint64_t sub_1B387BCF8()
{
  return sub_1B388B0A8();
}

PegasusConfiguration::KnownAggregationRecipeName_optional sub_1B387BD00(Swift::String *a1)
{
  return KnownAggregationRecipeName.init(rawValue:)(*a1);
}

unint64_t sub_1B387BD0C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = KnownAggregationRecipeName.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_1B387BD34(void *a1@<X8>)
{
  *a1 = &unk_1F0C11548;
}

unint64_t sub_1B387BD48()
{
  unint64_t result = qword_1E9CCF080;
  if (!qword_1E9CCF080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCF080);
  }
  return result;
}

unint64_t sub_1B387BD98()
{
  unint64_t result = qword_1E9CCF088;
  if (!qword_1E9CCF088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCF088);
  }
  return result;
}

unint64_t sub_1B387BDE8()
{
  unint64_t result = qword_1E9CCF090;
  if (!qword_1E9CCF090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCF090);
  }
  return result;
}

unint64_t sub_1B387BE38()
{
  unint64_t result = qword_1E9CCF098;
  if (!qword_1E9CCF098)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9CCF0A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCF098);
  }
  return result;
}

uint64_t sub_1B387BE98()
{
  return 0;
}

void type metadata accessor for KnownAggregationRecipeClient()
{
}

uint64_t getEnumTagSinglePayload for TaskCoordinator.TaskError(unsigned int *a1, int a2)
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

unsigned char *_s20PegasusConfiguration28KnownAggregationRecipeClientOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1B387BF98);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void type metadata accessor for KnownAggregationProcessBundleId()
{
}

uint64_t getEnumTagSinglePayload for KnownAggregationRecipeName(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for KnownAggregationRecipeName(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1B387C120);
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

void type metadata accessor for KnownAggregationRecipeName()
{
}

uint64_t dispatch thunk of ContextProtocol.geoDeviceCountryCode.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ContextProtocol.localeIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ContextProtocol.effectiveSystemLanguage.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of ContextProtocol.preferredLanguages.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ContextProtocol.hasRequiredItemsForConfigFetch.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

ValueMetadata *type metadata accessor for ConfigContext()
{
  return &type metadata for ConfigContext;
}

uint64_t sub_1B387C1CC()
{
  uint64_t v0 = sub_1B389BF00();
  OUTLINED_FUNCTION_1();
  uint64_t v2 = v1;
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(self, sel_currentLocale);
  sub_1B389BEA0();

  uint64_t v7 = sub_1B389BE80();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v0);
  return v7;
}

uint64_t sub_1B387C2B0()
{
  uint64_t v0 = sub_1B389C1B0();
  OUTLINED_FUNCTION_1();
  uint64_t v2 = v1;
  uint64_t v4 = MEMORY[0x1F4188790](v3);
  id v6 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v51 - v7;
  uint64_t v9 = sub_1B389BF00();
  OUTLINED_FUNCTION_1();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static DeviceContextUtil.deviceCountryCode()();
  uint64_t v16 = v15;
  swift_bridgeObjectRelease();
  if (v16 && (static DeviceContextUtil.effectiveSystemLanguage()(), uint64_t v18 = v17, swift_bridgeObjectRelease(), v18))
  {
    id v19 = objc_msgSend(self, sel_currentLocale);
    sub_1B389BEA0();

    sub_1B389BE80();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v9);
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    uint64_t v57 = v6;
    uint64_t v52 = v14;
    if (qword_1EB7FAAD0 != -1) {
      swift_once();
    }
    uint64_t v21 = __swift_project_value_buffer(v0, (uint64_t)qword_1EB7FC128);
    id v22 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
    uint64_t v58 = v21;
    uint64_t v56 = v22;
    ((void (*)(char *))v22)(v8);
    uint64_t v23 = v2;
    unint64_t v24 = sub_1B389C190();
    os_log_type_t v25 = sub_1B389C5A0();
    BOOL v26 = os_log_type_enabled(v24, v25);
    uint64_t v53 = v11;
    uint64_t v54 = v9;
    uint64_t v55 = v2;
    if (v26)
    {
      int64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v59 = swift_slowAlloc();
      *(_DWORD *)int64_t v27 = 136315138;
      uint64_t v28 = static DeviceContextUtil.deviceCountryCode()();
      if (v29)
      {
        unint64_t v30 = v29;
      }
      else
      {
        uint64_t v28 = 7104878;
        unint64_t v30 = 0xE300000000000000;
      }
      uint64_t v31 = sub_1B3855F24(v28, v30, &v59);
      OUTLINED_FUNCTION_1_6(v31);
      sub_1B389C6C0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B3850000, v24, v25, "ConfigDebug: context.geoDeviceCountryCode = %s", v27, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();

      uint64_t v23 = v55;
    }
    else
    {
    }
    uint64_t v32 = *(void (**)(char *, uint64_t))(v23 + 8);
    v32(v8, v0);
    int64_t v33 = v57;
    v56(v57, v58, v0);
    uint64_t v34 = sub_1B389C190();
    os_log_type_t v35 = sub_1B389C5A0();
    if (os_log_type_enabled(v34, v35))
    {
      int64_t v36 = (uint8_t *)swift_slowAlloc();
      uint64_t v59 = swift_slowAlloc();
      *(_DWORD *)int64_t v36 = 136315138;
      uint64_t v37 = static DeviceContextUtil.effectiveSystemLanguage()();
      if (v38)
      {
        unint64_t v39 = v38;
      }
      else
      {
        uint64_t v37 = 7104878;
        unint64_t v39 = 0xE300000000000000;
      }
      uint64_t v40 = sub_1B3855F24(v37, v39, &v59);
      OUTLINED_FUNCTION_1_6(v40);
      sub_1B389C6C0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B3850000, v34, v35, "ConfigDebug: context.effectiveCountryCode = %s", v36, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();

      uint64_t v41 = v57;
    }
    else
    {

      uint64_t v41 = v33;
    }
    v32(v41, v0);
    uint64_t v42 = sub_1B389C190();
    os_log_type_t v43 = sub_1B389C5A0();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = (uint8_t *)swift_slowAlloc();
      uint64_t v59 = swift_slowAlloc();
      *(_DWORD *)uint64_t v44 = 136315138;
      id v45 = objc_msgSend(self, sel_currentLocale);
      uint64_t v46 = v52;
      sub_1B389BEA0();

      uint64_t v47 = sub_1B389BE80();
      unint64_t v49 = v48;
      (*(void (**)(char *, uint64_t))(v53 + 8))(v46, v54);
      uint64_t v50 = sub_1B3855F24(v47, v49, &v59);
      OUTLINED_FUNCTION_1_6(v50);
      sub_1B389C6C0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B3850000, v42, v43, "ConfigDebug: context.localeIdentifier = %s", v44, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
    }

    return 0;
  }
}

uint64_t sub_1B387C858()
{
  OUTLINED_FUNCTION_1_7();
  uint64_t v1 = (unsigned char *)OUTLINED_FUNCTION_2_4();
  sub_1B387CC70(v1, v2);
  os_unfair_lock_unlock(v0);
  return v4;
}

void sub_1B387C8A0()
{
  OUTLINED_FUNCTION_1_7();
  uint64_t v1 = (unsigned char *)OUTLINED_FUNCTION_2_4();
  sub_1B387D4E8(v1);

  os_unfair_lock_unlock(v0);
}

uint64_t sub_1B387C8EC()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x1F4188298](sub_1B387C90C, 0, 0);
}

uint64_t sub_1B387C90C()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  void *v1 = v0;
  v1[1] = sub_1B387C9EC;
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = MEMORY[0x1E4FBB390];
  return MEMORY[0x1F41880D8](v0 + 32, 0, 0, 0x746C757365527369, 0xEF29287964616552, sub_1B387DB24, v2, v3);
}

uint64_t sub_1B387C9EC()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3();
  void *v2 = v1;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1B387CAB8, 0, 0);
}

uint64_t sub_1B387CAB8()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(unsigned __int8 *)(v0 + 32));
}

void sub_1B387CAD0()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 16);
  uint64_t v2 = (uint64_t)&v1[4];
  uint64_t v3 = v1 + 12;
  os_unfair_lock_lock(v1 + 12);
  sub_1B387E030(v2);
  os_unfair_lock_unlock(v3);
}

uint64_t sub_1B387CB30()
{
  return sub_1B389CA20();
}

uint64_t sub_1B387CB58()
{
  return sub_1B389CA40();
}

uint64_t sub_1B387CBA4()
{
  return sub_1B389CA40();
}

uint64_t sub_1B387CBE4()
{
  return sub_1B389CA20();
}

uint64_t sub_1B387CC0C()
{
  return sub_1B389CA40();
}

uint64_t sub_1B387CC54()
{
  return sub_1B387CC0C();
}

uint64_t sub_1B387CC5C()
{
  return sub_1B387CBE4();
}

BOOL sub_1B387CC64(char *a1, char *a2)
{
  return sub_1B387455C(*a1, *a2);
}

unsigned char *sub_1B387CC70@<X0>(unsigned char *result@<X0>, BOOL *a2@<X8>)
{
  *a2 = *result == 2;
  return result;
}

void sub_1B387CC84(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(os_unfair_lock_s **)(a2 + 16);
  uint64_t v3 = (unsigned __int8 *)&v2[4];
  uint64_t v4 = v2 + 12;
  os_unfair_lock_lock(v2 + 12);
  sub_1B387DB2C(v3, &v5);
  os_unfair_lock_unlock(v4);
  if (v5 != 2)
  {
    v5 &= 1u;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA3E8);
    sub_1B389C4C0();
  }
}

unsigned __int8 *sub_1B387CD18@<X0>(unsigned __int8 *result@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  unsigned int v4 = *result;
  if (v4 >= 2)
  {
    char v10 = v4 != 2;
  }
  else
  {
    id v6 = result;
    sub_1B3882DFC();
    uint64_t v7 = *(void *)(*((void *)v6 + 2) + 16);
    sub_1B3882E88(v7);
    uint64_t v8 = *((void *)v6 + 2);
    *(void *)(v8 + 16) = v7 + 1;
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA3E8);
    unint64_t result = (unsigned __int8 *)(*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8)
                                                                                              + 16))(v8+ ((*(unsigned __int8 *)(*(void *)(v9 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v9 - 8) + 80))+ *(void *)(*(void *)(v9 - 8) + 72) * v7, a2, v9);
    *((void *)v6 + 2) = v8;
    char v10 = 2;
  }
  *a3 = v10;
  return result;
}

uint64_t sub_1B387CDF4(uint64_t a1, double a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA880);
  uint64_t result = MEMORY[0x1F4188790](v4 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned char *)a1 == 1)
  {
    uint64_t v8 = sub_1B389C4F0();
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v8);
    uint64_t v9 = swift_allocObject();
    swift_weakInit();
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = 0;
    *(void *)(v10 + 24) = 0;
    *(double *)(v10 + 32) = a2;
    *(void *)(v10 + 40) = v9;
    uint64_t v11 = sub_1B3861954((uint64_t)v7, (uint64_t)&unk_1E9CCF0B8, v10);
    sub_1B387E250((uint64_t)v7);
    uint64_t result = swift_release();
    *(void *)(a1 + 24) = v11;
  }
  return result;
}

uint64_t sub_1B387CF2C(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 48) = a5;
  *(double *)(v5 + 40) = a1;
  uint64_t v6 = sub_1B389C810();
  *(void *)(v5 + 56) = v6;
  *(void *)(v5 + 64) = *(void *)(v6 - 8);
  *(void *)(v5 + 72) = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1B387CFF0, 0, 0);
}

uint64_t sub_1B387CFF0()
{
  uint64_t v1 = sub_1B389CA70();
  uint64_t v3 = v2;
  sub_1B389C800();
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_1E9CCF0C0 + dword_1E9CCF0C0);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1B387D0CC;
  return v6(v1, v3, 0, 0, 1);
}

uint64_t sub_1B387D0CC()
{
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_3();
  *uint64_t v3 = v2;
  swift_task_dealloc();
  if (v0)
  {

    uint64_t v4 = OUTLINED_FUNCTION_4_4();
    v5(v4);
    uint64_t v6 = sub_1B387E570;
  }
  else
  {
    uint64_t v7 = OUTLINED_FUNCTION_4_4();
    v8(v7);
    uint64_t v6 = sub_1B387D23C;
  }
  return MEMORY[0x1F4188298](v6, 0, 0);
}

uint64_t sub_1B387D23C()
{
  OUTLINED_FUNCTION_2_0();
  if ((sub_1B389C530() & 1) == 0)
  {
    swift_beginAccess();
    if (swift_weakLoadStrong())
    {
      sub_1B387D2DC();
      swift_release();
    }
  }
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B387D2DC()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA3E8);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(os_unfair_lock_s **)(v0 + 16);
  uint64_t v6 = v5 + 4;
  uint64_t v7 = v5 + 12;
  os_unfair_lock_lock(v5 + 12);
  sub_1B387D480(v6, &v16);
  os_unfair_lock_unlock(v7);
  uint64_t v8 = *(void *)(v16 + 16);
  if (v8)
  {
    uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
    uint64_t v9 = v2 + 16;
    uint64_t v10 = v11;
    uint64_t v12 = v16 + ((*(unsigned __int8 *)(v9 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 64));
    uint64_t v13 = *(void *)(v9 + 56);
    do
    {
      v10(v4, v12, v1);
      LOBYTE(v16) = 0;
      sub_1B389C4C0();
      (*(void (**)(char *, uint64_t))(v9 - 8))(v4, v1);
      v12 += v13;
      --v8;
    }
    while (v8);
  }
  else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  return swift_bridgeObjectRelease();
}

unsigned char *sub_1B387D480@<X0>(unsigned char *result@<X0>, void *a2@<X8>)
{
  uint64_t v3 = MEMORY[0x1E4FBC860];
  if (*result == 1)
  {
    uint64_t v4 = result;
    *uint64_t result = 2;
    uint64_t result = (unsigned char *)swift_release();
    uint64_t v5 = *((void *)v4 + 2);
    *((void *)v4 + 2) = v3;
    *((void *)v4 + 3) = 0;
    uint64_t v3 = v5;
  }
  *a2 = v3;
  return result;
}

void sub_1B387D4E8(unsigned char *a1)
{
  if (*a1 - 1 >= 2)
  {
    *a1 = 1;
  }
  else
  {
    if (qword_1EB7FAAD0 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_1B389C1B0();
    __swift_project_value_buffer(v1, (uint64_t)qword_1EB7FC128);
    uint64_t v2 = sub_1B389C190();
    os_log_type_t v3 = sub_1B389C5B0();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_1B3850000, v2, v3, "Missing onRemoteRequestEnd call", v4, 2u);
      MEMORY[0x1B3EBAF20](v4, -1, -1);
    }
  }
}

uint64_t sub_1B387D5E4()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA3E8);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(os_unfair_lock_s **)(v0 + 16);
  uint64_t v6 = (unsigned __int8 *)&v5[4];
  uint64_t v7 = v5 + 12;
  os_unfair_lock_lock(v5 + 12);
  sub_1B387D78C(v6, &v17);
  os_unfair_lock_unlock(v7);
  uint64_t v8 = *(void *)(v17 + 16);
  if (v8)
  {
    uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
    uint64_t v9 = v2 + 16;
    uint64_t v10 = v11;
    unint64_t v12 = (*(unsigned __int8 *)(v9 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 64);
    v16[1] = v17;
    uint64_t v13 = v17 + v12;
    uint64_t v14 = *(void *)(v9 + 56);
    do
    {
      v10(v4, v13, v1);
      LOBYTE(v17) = 1;
      sub_1B389C4C0();
      (*(void (**)(char *, uint64_t))(v9 - 8))(v4, v1);
      v13 += v14;
      --v8;
    }
    while (v8);
  }
  else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  return swift_bridgeObjectRelease();
}

void sub_1B387D78C(unsigned __int8 *a1@<X0>, void *a2@<X8>)
{
  if (*a1 - 1 > 1)
  {
    if (qword_1EB7FAAD0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_1B389C1B0();
    __swift_project_value_buffer(v4, (uint64_t)qword_1EB7FC128);
    uint64_t v5 = sub_1B389C190();
    os_log_type_t v6 = sub_1B389C5B0();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1B3850000, v5, v6, "Missing onRemoteRequestStart call", v7, 2u);
      MEMORY[0x1B3EBAF20](v7, -1, -1);
    }
  }
  else
  {
    *a1 = 3;
  }
  uint64_t v9 = *((void *)a1 + 2);
  uint64_t v8 = *((void *)a1 + 3);
  *((void *)a1 + 2) = MEMORY[0x1E4FBC860];
  if (v8)
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FAB08);
    sub_1B389C510();
    swift_release_n();
    *((void *)a1 + 3) = 0;
  }
  *a2 = v9;
}

uint64_t sub_1B387D8F4()
{
  swift_release();

  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t type metadata accessor for TaskCoordinator()
{
  return self;
}

uint64_t destroy for TaskCoordinator.State()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for TaskCoordinator.State(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for TaskCoordinator.State(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for TaskCoordinator.State(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for TaskCoordinator.State(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 32))
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

uint64_t storeEnumTagSinglePayload for TaskCoordinator.State(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TaskCoordinator.State()
{
  return &type metadata for TaskCoordinator.State;
}

void sub_1B387DB24(uint64_t a1)
{
  sub_1B387CC84(a1, v1);
}

unsigned __int8 *sub_1B387DB2C@<X0>(unsigned __int8 *a1@<X0>, char *a2@<X8>)
{
  return sub_1B387CD18(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_1B387DB48()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA3F0);
  uint64_t v1 = swift_allocObject();
  *(_DWORD *)(v1 + 48) = 0;
  uint64_t v2 = MEMORY[0x1E4FBC860];
  *(unsigned char *)(v1 + 16) = 0;
  *(void *)(v1 + 24) = 0;
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = 0;
  *(void *)(v0 + 16) = v1;
  return v0;
}

uint64_t sub_1B387DB94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 56) = v5;
  uint64_t v12 = sub_1B389C7F0();
  *(void *)(v6 + 64) = v12;
  *(void *)(v6 + 72) = *(void *)(v12 - 8);
  *(void *)(v6 + 80) = swift_task_alloc();
  *(void *)(v6 + 88) = swift_task_alloc();
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = a2;
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(unsigned char *)(v6 + 32) = a5 & 1;
  return MEMORY[0x1F4188298](sub_1B387DC98, 0, 0);
}

uint64_t sub_1B387DC98()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v4 = sub_1B389C810();
  uint64_t v5 = sub_1B387E2B0(&qword_1EB7FA3F8, MEMORY[0x1E4FBD1A8]);
  sub_1B389C9B0();
  sub_1B387E2B0(&qword_1EB7FA8D0, MEMORY[0x1E4FBD178]);
  sub_1B389C820();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v6;
  v0[13] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v2);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[14] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_1B387DE38;
  uint64_t v8 = v0[11];
  return MEMORY[0x1F4188178](v8, v0 + 2, v4, v5);
}

uint64_t sub_1B387DE38()
{
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  uint64_t v5 = (void (*)(uint64_t, uint64_t))v4[12];
  uint64_t v6 = v4[11];
  uint64_t v7 = v4[8];
  uint64_t v8 = *v1;
  OUTLINED_FUNCTION_3();
  *uint64_t v9 = v8;
  *(void *)(v3 + 120) = v0;
  swift_task_dealloc();
  v5(v6, v7);
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_1B387DFC8, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = *(uint64_t (**)(void))(v8 + 8);
    return v10();
  }
}

uint64_t sub_1B387DFC8()
{
  OUTLINED_FUNCTION_2_0();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B387E030(uint64_t a1)
{
  return sub_1B387CDF4(a1, *(double *)(v1 + 24));
}

uint64_t sub_1B387E050()
{
  swift_weakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1B387E088()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1B387E0C8(uint64_t a1)
{
  uint64_t v4 = *((void *)v1 + 2);
  uint64_t v5 = *((void *)v1 + 3);
  double v6 = v1[4];
  uint64_t v7 = *((void *)v1 + 5);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_1B387E18C;
  return sub_1B387CF2C(v6, a1, v4, v5, v7);
}

uint64_t sub_1B387E18C()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3();
  void *v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_1B387E250(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA880);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B387E2B0(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *storeEnumTagSinglePayload for TaskCoordinator.TaskError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1B387E394);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for TaskCoordinator.TaskError()
{
  return &type metadata for TaskCoordinator.TaskError;
}

unsigned char *storeEnumTagSinglePayload for TaskCoordinator.Status(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1B387E498);
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

ValueMetadata *type metadata accessor for TaskCoordinator.Status()
{
  return &type metadata for TaskCoordinator.Status;
}

unint64_t sub_1B387E4D4()
{
  unint64_t result = qword_1E9CCF0C8;
  if (!qword_1E9CCF0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCF0C8);
  }
  return result;
}

unint64_t sub_1B387E524()
{
  unint64_t result = qword_1E9CCF0D0[0];
  if (!qword_1E9CCF0D0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1E9CCF0D0);
  }
  return result;
}

uint64_t sub_1B387E574()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1B387E5AC()
{
  return sub_1B389C300();
}

BOOL sub_1B387E5DC(uint64_t a1)
{
  return a1 != 0;
}

uint64_t sub_1B387E5E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x1E4FBB828];

  return MEMORY[0x1F4185BB0](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_1B387E65C(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v5 = MEMORY[0x1E4FBB818];

  return MEMORY[0x1F4183DE0](a1, a2, WitnessTable, v5);
}

uint64_t sub_1B387E6C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x1E4FBB818];

  return MEMORY[0x1F4183DF0](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_1B387E738(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x1E4FBB818];

  return MEMORY[0x1F4183DE8](a1, a2, a3, WitnessTable, v7);
}

BOOL sub_1B387E7A8@<W0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  BOOL result = sub_1B387E5DC(*a1);
  *a2 = result;
  return result;
}

void sub_1B387E7DC(void *a1@<X8>)
{
  *a1 = 0;
}

unint64_t sub_1B387E7E4()
{
  return 0xD000000000000010;
}

uint64_t sub_1B387E804()
{
  return sub_1B387E5AC();
}

const char *sub_1B387E80C()
{
  return "lifetime";
}

uint64_t sub_1B387E820()
{
  uint64_t v0 = sub_1B3898D74();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t type metadata accessor for LifetimeSpanPrototype()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1B387E88C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 16);
}

unsigned char *sub_1B387E894(unsigned char *result, int a2, int a3)
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
        *BOOL result = a2;
        return result;
      case 2:
        *(_WORD *)BOOL result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)BOOL result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *BOOL result = 0;
      break;
    case 2:
      *(_WORD *)BOOL result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1B387E930);
    case 4:
      *(_DWORD *)BOOL result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t type metadata accessor for LifetimeTrackingActivity()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1B387E970(uint64_t a1)
{
  *(void *)(a1 + 8) = swift_getWitnessTable();
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1B387E9D0()
{
  return swift_getWitnessTable();
}

double UserAgent.init(_:requestor:)(unint64_t a1)
{
  uint64_t v1 = Client.init(_:)(a1, (unint64_t *)&v30);
  uint64_t v9 = OUTLINED_FUNCTION_2_5(v1, v2, v3, v4, v5, v6, v7, v8, v19, v21, SWORD2(v21), SBYTE6(v21), SHIBYTE(v21), v23, v26, v28, v30, v31, v32,
         v33);
  *(void *)&double result = OUTLINED_FUNCTION_0_5(v9, v10, v11, v12, v13, v14, v15, v16, v20, v22, v24, v25, v27, v29, v30, *((uint64_t *)&v30 + 1), v31, v32, v33,
                         v34,
                         v35,
                         v17,
                         v36,
                         v37).n128_u64[0];
  return result;
}

Swift::String __swiftcall userAgentString(forClientName:forRequestor:)(Swift::String forClientName, Swift::String forRequestor)
{
  object = forRequestor._object;
  uint64_t countAndFlagsBits = forRequestor._countAndFlagsBits;
  sub_1B3854524(2);
  sub_1B3854524(1);
  sub_1B3854524(3);
  sub_1B3854524(0);
  sub_1B389C3C0();
  sub_1B389C3C0();
  swift_bridgeObjectRelease();
  sub_1B389C3C0();
  sub_1B389C3C0();
  swift_bridgeObjectRelease();
  sub_1B389C3C0();
  sub_1B389C3C0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1B389C3C0();
  sub_1B389C3C0();
  swift_bridgeObjectRelease();
  sub_1B389C3C0();
  sub_1B389C3C0();
  uint64_t v3 = countAndFlagsBits;
  uint64_t v4 = object;
  result._object = v4;
  result._uint64_t countAndFlagsBits = v3;
  return result;
}

void sub_1B387EBB4()
{
  qword_1E9CCEB10 = 0x6E776F6E6B6E75;
  *(void *)algn_1E9CCEB18 = 0xE700000000000000;
}

void sub_1B387EBD8()
{
  qword_1EB7FAA68 = 0x2F64636573726170;
  unk_1EB7FAA70 = 0xE900000000000031;
}

void sub_1B387EC00()
{
  unk_1EB7FB695 = 0;
  unk_1EB7FB696 = -5120;
}

double sub_1B387EC2C()
{
  long long v2 = xmmword_1B389F480;
  unint64_t v3 = 0xE700000000000000;
  char v1 = 0;
  UserAgent.init(_:requestor:)((uint64_t *)&v2, &v1, (uint64_t)&v4);
  double result = *(double *)&v7;
  xmmword_1EB7FA9C0 = v4;
  qword_1EB7FA9D0 = v5;
  byte_1EB7FA9D8 = v6;
  xmmword_1EB7FA9E0 = v7;
  qword_1EB7FA9F0 = v8;
  unk_1EB7FA9F8 = v9;
  return result;
}

double sub_1B387ECA0()
{
  long long v2 = xmmword_1B389F490;
  unint64_t v3 = 0xE700000000000000;
  char v1 = 0;
  UserAgent.init(_:requestor:)((uint64_t *)&v2, &v1, (uint64_t)&v4);
  double result = *(double *)&v7;
  xmmword_1E9CCF1D8 = v4;
  qword_1E9CCF1E8 = v5;
  byte_1E9CCF1F0 = v6;
  xmmword_1E9CCF1F8 = v7;
  qword_1E9CCF208 = v8;
  unk_1E9CCF210 = v9;
  return result;
}

uint64_t static UserAgent.unknown.getter()
{
  if (qword_1E9CCEBB0 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_1_8((uint64_t)&xmmword_1E9CCF1D8);
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

void UserAgent.requestor.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 24);
}

uint64_t UserAgent.init(_:requestor:)@<X0>(uint64_t *a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  char v6 = (void *)a1[2];
  char v7 = *a2;
  uint64_t v8 = qword_1EB7FB6C8;
  swift_bridgeObjectRetain();
  if (v8 != -1) {
    swift_once();
  }
  BOOL v9 = v4 == qword_1EB7FBDA0 && v6 == *(void **)algn_1EB7FBDA8;
  if (v9 || (sub_1B389C920() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    if (qword_1E9CCEB20 != -1) {
      swift_once();
    }
    uint64_t v10 = qword_1E9CCEB10;
    uint64_t v11 = *(void **)algn_1E9CCEB18;
    swift_bridgeObjectRetain();
    if (v7) {
      goto LABEL_11;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_1B389C3C0();
    swift_bridgeObjectRelease();
    uint64_t v10 = v4;
    uint64_t v11 = v6;
    if (v7)
    {
LABEL_11:
      uint64_t v12 = qword_1EB7FABA0;
      swift_bridgeObjectRetain();
      if (v12 != -1) {
        swift_once();
      }
      uint64_t v13 = &qword_1EB7FB688;
      goto LABEL_18;
    }
  }
  uint64_t v14 = qword_1EB7FAA78;
  swift_bridgeObjectRetain();
  if (v14 != -1) {
    swift_once();
  }
  uint64_t v13 = &qword_1EB7FAA68;
LABEL_18:
  uint64_t v16 = *v13;
  uint64_t v15 = (void *)v13[1];
  swift_bridgeObjectRetain();
  v17._uint64_t countAndFlagsBits = v10;
  v17._object = v11;
  v18._uint64_t countAndFlagsBits = v16;
  v18._object = v15;
  Swift::String v19 = userAgentString(forClientName:forRequestor:)(v17, v18);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a3 = v5;
  *(void *)(a3 + 8) = v4;
  *(void *)(a3 + 16) = v6;
  *(unsigned char *)(a3 + 24) = v7;
  *(Swift::String *)(a3 + 32) = v19;
  *(void *)(a3 + 48) = v10;
  *(void *)(a3 + 56) = v11;
  return result;
}

double UserAgent.init(_:requestor:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = Client.init(_:)(a2, (uint64_t *)&v31);
  uint64_t v10 = OUTLINED_FUNCTION_2_5(v2, v3, v4, v5, v6, v7, v8, v9, v20, v22, SWORD2(v22), SBYTE6(v22), SHIBYTE(v22), v24, v27, v29, v31, v32, v33,
          v34);
  *(void *)&double result = OUTLINED_FUNCTION_0_5(v10, v11, v12, v13, v14, v15, v16, v17, v21, v23, v25, v26, v28, v30, v31, *((uint64_t *)&v31 + 1), v32, v33, v34,
                         v35,
                         v36,
                         v18,
                         v37,
                         v38).n128_u64[0];
  return result;
}

BOOL static Requestor.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t Requestor.hash(into:)()
{
  return sub_1B389CA20();
}

uint64_t Requestor.hashValue.getter()
{
  return sub_1B389CA40();
}

unint64_t sub_1B387F07C()
{
  unint64_t result = qword_1E9CCF218;
  if (!qword_1E9CCF218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCF218);
  }
  return result;
}

uint64_t assignWithCopy for UserAgent(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for UserAgent(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

unsigned char *storeEnumTagSinglePayload for Requestor(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1B387F29CLL);
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

uint64_t sub_1B387F2C4()
{
  uint64_t v0 = sub_1B389C1B0();
  __swift_allocate_value_buffer(v0, qword_1E9CCF220);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E9CCF220);
  return sub_1B389C1A0();
}

uint64_t sub_1B387F334()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FAB40);
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = 0;
  *(_DWORD *)(result + 32) = 0;
  qword_1EB7FAB18 = result;
  return result;
}

uint64_t static PrimaryPersonaContainerPathLookup.path(for:)()
{
  if (container_query_create())
  {
    container_query_set_class();
    uint64_t v0 = sub_1B389C330();
    xpc_object_t v1 = xpc_string_create((const char *)(v0 + 32));
    swift_release();
    container_query_set_group_identifiers();
    swift_unknownObjectRelease();
    container_query_set_persona_unique_string();
    container_query_operation_set_flags();
    single_uint64_t result = container_query_get_single_result();
    if (single_result)
    {
      uint64_t v3 = single_result;
      path = (const char *)container_get_path();
      if (path)
      {
        if ((uint64_t)strlen(path) >= 1)
        {
          sub_1B387F5C0();
          uint64_t v5 = sub_1B389C3D0();
          container_query_free();
          return v5;
        }
        sub_1B387F574();
        OUTLINED_FUNCTION_18();
        *(_OWORD *)uint64_t v9 = xmmword_1B389F570;
        char v10 = 2;
      }
      else
      {
        if (container_query_get_last_error() && container_error_copy_unlocalized_description())
        {
          sub_1B389C3D0();
          OUTLINED_FUNCTION_0_6();
        }
        else
        {
          uint64_t v3 = 0;
          xpc_object_t v1 = (xpc_object_t)0xE000000000000000;
        }
        sub_1B387F574();
        OUTLINED_FUNCTION_18();
        *(void *)uint64_t v9 = v3;
        *(void *)(v9 + 8) = v1;
        char v10 = 1;
      }
      *(unsigned char *)(v9 + 16) = v10;
    }
    else
    {
      if (container_query_get_last_error() && container_error_copy_unlocalized_description())
      {
        sub_1B389C3D0();
        OUTLINED_FUNCTION_0_6();
      }
      else
      {
        uint64_t v0 = 0;
        xpc_object_t v1 = (xpc_object_t)0xE000000000000000;
      }
      sub_1B387F574();
      OUTLINED_FUNCTION_18();
      *(void *)uint64_t v8 = v0;
      *(void *)(v8 + 8) = v1;
      *(unsigned char *)(v8 + 16) = 0;
    }
    swift_willThrow();
    return container_query_free();
  }
  else
  {
    sub_1B387F574();
    OUTLINED_FUNCTION_18();
    *(void *)uint64_t v7 = 0;
    *(void *)(v7 + 8) = 0;
    *(unsigned char *)(v7 + 16) = 2;
    return swift_willThrow();
  }
}

unint64_t sub_1B387F574()
{
  unint64_t result = qword_1E9CCF238;
  if (!qword_1E9CCF238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCF238);
  }
  return result;
}

void sub_1B387F5C0()
{
  if (container_copy_sandbox_token())
  {
    if (sandbox_extension_consume() == -1)
    {
      if (qword_1E9CCEBB8 != -1) {
        swift_once();
      }
      uint64_t v0 = sub_1B389C1B0();
      __swift_project_value_buffer(v0, (uint64_t)qword_1E9CCF220);
      xpc_object_t v1 = sub_1B389C190();
      os_log_type_t v2 = sub_1B389C5B0();
      if (os_log_type_enabled(v1, v2))
      {
        uint64_t v3 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v3 = 0;
        _os_log_impl(&dword_1B3850000, v1, v2, "token/process not valid for extension", v3, 2u);
        MEMORY[0x1B3EBAF20](v3, -1, -1);
      }
    }
    JUMPOUT(0x1B3EBAF20);
  }
  if (qword_1E9CCEBB8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1B389C1B0();
  __swift_project_value_buffer(v4, (uint64_t)qword_1E9CCF220);
  oslog = sub_1B389C190();
  os_log_type_t v5 = sub_1B389C5B0();
  if (os_log_type_enabled(oslog, v5))
  {
    unsigned int v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unsigned int v6 = 0;
    _os_log_impl(&dword_1B3850000, oslog, v5, "token not sent by container", v6, 2u);
    MEMORY[0x1B3EBAF20](v6, -1, -1);
  }
}

uint64_t destroy for PegasusConfigPathError(uint64_t a1)
{
  return sub_1B386C7E4(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s20PegasusConfiguration22PegasusConfigPathErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_1B386C810(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for PegasusConfigPathError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_1B386C810(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_1B386C7E4(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for PegasusConfigPathError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_1B386C7E4(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for PegasusConfigPathError(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 2) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PegasusConfigPathError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1B387F944(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_1B387F95C(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for PegasusConfigPathError()
{
  return &type metadata for PegasusConfigPathError;
}

ValueMetadata *type metadata accessor for PrimaryPersonaContainerPathLookup()
{
  return &type metadata for PrimaryPersonaContainerPathLookup;
}

void BiomeStreamConfig.init(fileManager:descriptor:)(void *a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v8 = sub_1B389BD00();
  OUTLINED_FUNCTION_1();
  uint64_t v10 = v9;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_1_9();
  unsigned __int8 v28 = *a2;
  int v12 = v28;
  uint64_t v13 = FeedbackStreamDescriptor.tableName.getter();
  uint64_t v15 = v14;
  unint64_t v16 = 0x80000001B38A2CB0;
  if (!v28) {
    unint64_t v16 = 0x80000001B38A2CE0;
  }
  uint64_t v25 = v13;
  unint64_t v26 = v16;
  unsigned __int8 v27 = v28;
  NSFileManager.biomeStreamURL(for:)(&v27, v4);
  if (v3)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1B38565B4();
    uint64_t v17 = sub_1B389BCA0();
    uint64_t v24 = v15;
    uint64_t v19 = v18;
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v4, v8);
    if (v12) {
      unint64_t v20 = 0xD000000000000028;
    }
    else {
      unint64_t v20 = 0xD000000000000026;
    }
    if (v12) {
      uint64_t v21 = 0x200000;
    }
    else {
      uint64_t v21 = 0x20000;
    }
    id v22 = sub_1B38565F4(v17, v19, v21, 3);
    FeedbackStreamDescriptor.rawValue.getter();
    uint64_t v23 = sub_1B389C280();
    swift_bridgeObjectRelease();

    *a3 = v25;
    a3[1] = v24;
    a3[2] = v20;
    a3[3] = v26;
    a3[4] = (uint64_t)v22;
    a3[5] = v23;
  }
}

unint64_t sub_1B387FB60(uint64_t a1)
{
  uint64_t v2 = sub_1B389C740();

  return sub_1B387FBA4(a1, v2);
}

unint64_t sub_1B387FBA4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_1B3874090(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x1B3EBA420](v9, a1);
      sub_1B38741B0((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_1B387FCF4()
{
  unint64_t result = qword_1E9CCF240;
  if (!qword_1E9CCF240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCF240);
  }
  return result;
}

void sub_1B387FD40()
{
  qword_1EB7FC0F0 = 0x6769666E6F63;
  *(void *)algn_1EB7FC0F8 = 0xE600000000000000;
}

uint64_t sub_1B387FD60()
{
  uint64_t v0 = sub_1B389C1B0();
  __swift_allocate_value_buffer(v0, qword_1EB7FC128);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EB7FC128);
  if (qword_1EB7FA9B8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return sub_1B389C1A0();
}

uint64_t sub_1B387FE1C(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_7(a1, qword_1E9CCF650);
}

uint64_t sub_1B387FE34(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_7(a1, qword_1EB7FC0D8);
}

uint64_t sub_1B387FE4C(uint64_t a1)
{
  return sub_1B387FE8C(a1, qword_1E9CCF668);
}

uint64_t sub_1B387FE70(uint64_t a1)
{
  return sub_1B387FE8C(a1, qword_1E9CCF680);
}

uint64_t sub_1B387FE8C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1B389C1B0();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_1B389C1A0();
}

uint64_t sub_1B387FF04()
{
  uint64_t v0 = sub_1B389C1B0();
  __swift_allocate_value_buffer(v0, qword_1EB7FC100);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EB7FC100);
  return sub_1B389C1A0();
}

uint64_t sub_1B387FF78()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t type metadata accessor for ConfigurationLogging()
{
  return self;
}

uint64_t sub_1B387FFAC()
{
  uint64_t result = sub_1B387FFD4(5);
  byte_1E9CCF640 = result & 1;
  return result;
}

uint64_t sub_1B387FFD4(char a1)
{
  sub_1B3854954(a1);
  xpc_object_t v1 = (void *)sub_1B389C280();
  swift_bridgeObjectRelease();
  uint64_t v2 = MGCopyAnswer();

  if (!v2) {
    return 0;
  }
  uint64_t result = swift_dynamicCast();
  if (result) {
    return v4;
  }
  return result;
}

void Useragentpb_ClientID.init()(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
}

unint64_t Useragentpb_ClientID.init(rawValue:)@<X0>(unint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = result < 0x12;
  *(unsigned char *)(a2 + 9) = 0;
  return result;
}

uint64_t Useragentpb_ClientID.rawValue.getter()
{
  return *(void *)v0;
}

unint64_t sub_1B38800BC@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return Useragentpb_ClientID.init(rawValue:)(*a1, a2);
}

uint64_t sub_1B38800C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Useragentpb_ClientID.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1B38800EC()
{
  return sub_1B388AAE4();
}

uint64_t sub_1B38800F8(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1B3880B3C();

  return MEMORY[0x1F4127160](a1, a2, v4);
}

uint64_t sub_1B3880144()
{
  return sub_1B388AF14();
}

BOOL sub_1B3880150(uint64_t a1, uint64_t *a2)
{
  return sub_1B3874550(*(void *)a1, *(unsigned __int8 *)(a1 + 8), *a2);
}

void sub_1B388016C()
{
  qword_1E9CCF248 = (uint64_t)&unk_1F0C11110;
}

uint64_t static Useragentpb_ClientID.allCases.getter()
{
  if (qword_1E9CCEBF0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static Useragentpb_ClientID.allCases.setter(uint64_t a1)
{
  if (qword_1E9CCEBF0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  qword_1E9CCF248 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static Useragentpb_ClientID.allCases.modify())()
{
  if (qword_1E9CCEBF0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1B3880300@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static Useragentpb_ClientID.allCases.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1B3880328()
{
  uint64_t v0 = sub_1B389C0A0();
  __swift_allocate_value_buffer(v0, qword_1E9CCF250);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E9CCF250);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCF298);
  xpc_object_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CCF2A0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v42 = swift_allocObject();
  *(_OWORD *)(v42 + 16) = xmmword_1B389F680;
  unint64_t v4 = v42 + v3 + v1[14];
  *(void *)(v42 + v3) = 0;
  *(void *)unint64_t v4 = "UnknownClient";
  *(void *)(v4 + 8) = 13;
  *(unsigned char *)(v4 + 16) = 2;
  uint64_t v5 = *MEMORY[0x1E4F70FB8];
  uint64_t v6 = sub_1B389C080();
  char v7 = *(void (**)(void))(*(void *)(v6 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v7)(v4, v5, v6);
  unint64_t v8 = v42 + v3 + v2 + v1[14];
  *(void *)(v42 + v3 + v2) = 1;
  *(void *)unint64_t v8 = "Safari";
  *(void *)(v8 + 8) = 6;
  *(unsigned char *)(v8 + 16) = 2;
  v7();
  uint64_t v9 = (void *)(v42 + v3 + 2 * v2);
  uint64_t v10 = (char *)v9 + v1[14];
  *uint64_t v9 = 2;
  *(void *)uint64_t v10 = "Spotlight";
  *((void *)v10 + 1) = 9;
  v10[16] = 2;
  v7();
  uint64_t v11 = (void *)(v42 + v3 + 3 * v2);
  int v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 3;
  *(void *)int v12 = "Lookup";
  *((void *)v12 + 1) = 6;
  v12[16] = 2;
  v7();
  uint64_t v13 = (void *)(v42 + v3 + 4 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  *uint64_t v13 = 4;
  *(void *)uint64_t v14 = "Siri";
  *((void *)v14 + 1) = 4;
  v14[16] = 2;
  v7();
  uint64_t v15 = (void *)(v42 + v3 + 5 * v2);
  unint64_t v16 = (char *)v15 + v1[14];
  *uint64_t v15 = 5;
  *(void *)unint64_t v16 = "Messages";
  *((void *)v16 + 1) = 8;
  v16[16] = 2;
  v7();
  uint64_t v17 = (void *)(v42 + v3 + 6 * v2);
  uint64_t v18 = (char *)v17 + v1[14];
  *uint64_t v17 = 6;
  *(void *)uint64_t v18 = "News";
  *((void *)v18 + 1) = 4;
  v18[16] = 2;
  v7();
  uint64_t v19 = (void *)(v42 + v3 + 7 * v2);
  unint64_t v20 = (char *)v19 + v1[14];
  *uint64_t v19 = 7;
  *(void *)unint64_t v20 = "Parsecd";
  *((void *)v20 + 1) = 7;
  v20[16] = 2;
  v7();
  uint64_t v21 = (void *)(v42 + v3 + 8 * v2);
  id v22 = (char *)v21 + v1[14];
  *uint64_t v21 = 8;
  *(void *)id v22 = "DPrivacyd";
  *((void *)v22 + 1) = 9;
  v22[16] = 2;
  v7();
  uint64_t v23 = (void *)(v42 + v3 + 9 * v2);
  uint64_t v24 = (char *)v23 + v1[14];
  *uint64_t v23 = 9;
  *(void *)uint64_t v24 = "CoreSuggestions";
  *((void *)v24 + 1) = 15;
  v24[16] = 2;
  v7();
  uint64_t v25 = (void *)(v42 + v3 + 10 * v2);
  unint64_t v26 = (char *)v25 + v1[14];
  *uint64_t v25 = 10;
  *(void *)unint64_t v26 = "FlightUtilities";
  *((void *)v26 + 1) = 15;
  v26[16] = 2;
  v7();
  unsigned __int8 v27 = (void *)(v42 + v3 + 11 * v2);
  unsigned __int8 v28 = (char *)v27 + v1[14];
  *unsigned __int8 v27 = 11;
  *(void *)unsigned __int8 v28 = "Trystero";
  *((void *)v28 + 1) = 8;
  v28[16] = 2;
  v7();
  uint64_t v29 = (void *)(v42 + v3 + 12 * v2);
  uint64_t v30 = (char *)v29 + v1[14];
  *uint64_t v29 = 12;
  *(void *)uint64_t v30 = "MapsSuggestions";
  *((void *)v30 + 1) = 15;
  v30[16] = 2;
  v7();
  long long v31 = (void *)(v42 + v3 + 13 * v2);
  uint64_t v32 = (char *)v31 + v1[14];
  *long long v31 = 13;
  *(void *)uint64_t v32 = "DuetExpert";
  *((void *)v32 + 1) = 10;
  v32[16] = 2;
  v7();
  uint64_t v33 = (void *)(v42 + v3 + 14 * v2);
  long long v34 = (char *)v33 + v1[14];
  *uint64_t v33 = 14;
  *(void *)long long v34 = "VisualIntelligence";
  *((void *)v34 + 1) = 18;
  v34[16] = 2;
  v7();
  uint64_t v35 = (void *)(v42 + v3 + 15 * v2);
  char v36 = (char *)v35 + v1[14];
  *uint64_t v35 = 15;
  *(void *)char v36 = "AMP";
  *((void *)v36 + 1) = 3;
  v36[16] = 2;
  v7();
  uint64_t v37 = (void *)(v42 + v3 + 16 * v2);
  uint64_t v38 = (char *)v37 + v1[14];
  *uint64_t v37 = 16;
  *(void *)uint64_t v38 = "Mail";
  *((void *)v38 + 1) = 4;
  v38[16] = 2;
  v7();
  unint64_t v39 = (void *)(v42 + v3 + 17 * v2);
  uint64_t v40 = (char *)v39 + v1[14];
  *unint64_t v39 = 17;
  *(void *)uint64_t v40 = "Sideband";
  *((void *)v40 + 1) = 8;
  v40[16] = 2;
  v7();
  return sub_1B389C090();
}

uint64_t static Useragentpb_ClientID._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_1E9CCEBF8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1B389C0A0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1E9CCF250);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_1B3880944()
{
  unint64_t result = qword_1E9CCF268;
  if (!qword_1E9CCF268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCF268);
  }
  return result;
}

unint64_t sub_1B3880994()
{
  unint64_t result = qword_1E9CCF270;
  if (!qword_1E9CCF270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCF270);
  }
  return result;
}

unint64_t sub_1B38809E4()
{
  unint64_t result = qword_1E9CCF278;
  if (!qword_1E9CCF278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCF278);
  }
  return result;
}

unint64_t sub_1B3880A34()
{
  unint64_t result = qword_1E9CCF280;
  if (!qword_1E9CCF280)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9CCF288);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCF280);
  }
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for Useragentpb_ClientID(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for Useragentpb_ClientID(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 1;
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
  *(unsigned char *)(result + 9) = v3;
  return result;
}

uint64_t sub_1B3880AF0(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1B3880B0C(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
    char v2 = 1;
  }
  else
  {
    char v2 = 0;
  }
  *(unsigned char *)(result + 8) = v2;
  return result;
}

ValueMetadata *type metadata accessor for Useragentpb_ClientID()
{
  return &type metadata for Useragentpb_ClientID;
}

unint64_t sub_1B3880B3C()
{
  unint64_t result = qword_1E9CCF290;
  if (!qword_1E9CCF290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCF290);
  }
  return result;
}

uint64_t sub_1B3880B88(char a1)
{
  return qword_1B389F968[a1];
}

const char *sub_1B3880B9C()
{
  return sub_1B3880BA4(*v0);
}

uint64_t sub_1B3880BAC()
{
  return 0x6E6F697461727564;
}

uint64_t sub_1B3880BC8()
{
  return 1701869940;
}

BOOL sub_1B3880BD8()
{
  return sub_1B3880BE0(*v0);
}

BOOL sub_1B3880BE0(char a1)
{
  if (qword_1E9CCEB80 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    uint64_t v2 = *(void *)(qword_1E9CCF648 + 16);
    if (!v2) {
      break;
    }
    uint64_t v3 = 0;
    while (1)
    {
      uint64_t v4 = v3 + 1;
      if (__OFADD__(v3, 1)) {
        break;
      }
      if (qword_1B389F968[*(char *)(qword_1E9CCF648 + 32 + v3)] == qword_1B389F968[a1])
      {
        int v5 = *(unsigned __int8 *)(qword_1E9CCF648 + 32 + v3);
        return v5 == 45;
      }
      ++v3;
      if (v4 == v2) {
        goto LABEL_7;
      }
    }
    __break(1u);
LABEL_11:
    swift_once();
  }
LABEL_7:
  int v5 = 45;
  return v5 == 45;
}

BOOL sub_1B3880C94(char a1)
{
  if (qword_1E9CCEC08 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    uint64_t v2 = *(void *)(qword_1E9CCF698 + 16);
    if (!v2) {
      break;
    }
    uint64_t v3 = 0;
    while (1)
    {
      uint64_t v4 = v3 + 1;
      if (__OFADD__(v3, 1)) {
        break;
      }
      if (qword_1B389F968[*(char *)(qword_1E9CCF698 + 32 + v3)] == qword_1B389F968[a1])
      {
        int v5 = *(unsigned __int8 *)(qword_1E9CCF698 + 32 + v3);
        return v5 == 45;
      }
      ++v3;
      if (v4 == v2) {
        goto LABEL_7;
      }
    }
    __break(1u);
LABEL_11:
    swift_once();
  }
LABEL_7:
  int v5 = 45;
  return v5 == 45;
}

BOOL sub_1B3880D60()
{
  return sub_1B3880C94(*v0);
}

uint64_t sub_1B3880D68()
{
  OUTLINED_FUNCTION_4_5();
  if ((*(unsigned char *)(v0 + *(void *)(v1 + 120)) & 1) == 0) {
    sub_1B38815AC();
  }
  uint64_t v2 = sub_1B3898D74();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_73();

  OUTLINED_FUNCTION_73();
  swift_unknownObjectRelease();
  return v2;
}

uint64_t sub_1B3880DF8()
{
  uint64_t v1 = v0;
  OUTLINED_FUNCTION_4_5();
  uint64_t v3 = *(void *)(v0 + *(void *)(v2 + 128));
  sub_1B389C5B0();
  sub_1B389C0B0();
  sub_1B3898FB0();
  sub_1B389C5B0();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA930);
  uint64_t v5 = OUTLINED_FUNCTION_0_9();
  *(_OWORD *)(v5 + 16) = xmmword_1B389D500;
  uint64_t v6 = *(void *)(v1 + *(void *)(*(void *)v1 + 464) + 8);
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCEF80);
  uint64_t v7 = sub_1B389C300();
  uint64_t v9 = v8;
  *(void *)(v5 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v10 = sub_1B38579B4();
  *(void *)(v5 + 64) = v10;
  *(void *)(v5 + 32) = v7;
  *(void *)(v5 + 40) = v9;
  sub_1B389C0B0();
  swift_bridgeObjectRelease();
  sub_1B389C5B0();
  uint64_t v129 = v4;
  uint64_t v11 = (__n128 *)OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_3_5(v11, v12, v13, v14, v15, v16, v17, v18, v105, v111, v117, v124, v129, v135, v19);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v118 = v6;
  uint64_t v20 = v6;
  uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v6 + 16);
  v21(ObjectType, v20);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CCEE10);
  uint64_t v22 = sub_1B389C300();
  v11[3].n128_u64[1] = MEMORY[0x1E4FBB1A0];
  v11[4].n128_u64[0] = v10;
  v11[2].n128_u64[0] = v22;
  v11[2].n128_u64[1] = v23;
  uint64_t v136 = v3;
  sub_1B389C0B0();
  swift_bridgeObjectRelease();
  uint64_t v24 = sub_1B3881728();
  if (v27)
  {
    sub_1B389C5B0();
    unint64_t v79 = (__n128 *)OUTLINED_FUNCTION_0_9();
    __n128 v88 = OUTLINED_FUNCTION_3_5(v79, v80, v81, v82, v83, v84, v85, v86, v106, ObjectType, v118, v10, v130, v3, v87);
    ((void (*)(uint64_t, uint64_t, __n128))v21)(v116, v123, v88);
    uint64_t v89 = sub_1B389C300();
    unint64_t v90 = MEMORY[0x1E4FBB1A0];
    uint64_t v78 = v128;
    v79[3].n128_u64[1] = MEMORY[0x1E4FBB1A0];
    v79[4].n128_u64[0] = v128;
    v79[2].n128_u64[0] = v89;
    v79[2].n128_u64[1] = v91;
    sub_1B389C0B0();
    unint64_t v77 = v90;
  }
  else
  {
    uint64_t v28 = v25;
    int v29 = v26;
    unint64_t v30 = HIDWORD(v26);
    uint64_t v119 = v24;
    sub_1B389C5B0();
    long long v31 = (__n128 *)OUTLINED_FUNCTION_0_9();
    OUTLINED_FUNCTION_3_5(v31, v32, v33, v34, v35, v36, v37, v38, v106, ObjectType, v119, v10, v130, v136, v39);
    uint64_t v40 = MEMORY[0x1E4FBB5C8];
    v41[7] = v42;
    v41[8] = v40;
    v41[4] = v28;
    sub_1B389C0B0();
    swift_bridgeObjectRelease();
    sub_1B389C5B0();
    os_log_type_t v43 = (__n128 *)OUTLINED_FUNCTION_0_9();
    uint64_t v44 = MEMORY[0x1E4FBC4C0];
    OUTLINED_FUNCTION_3_5(v43, v45, v46, v47, v48, v49, v50, v51, v107, v113, v120, v125, v131, v137, v52);
    uint64_t v53 = MEMORY[0x1E4FBC530];
    *(void *)(v54 + 56) = v44;
    *(void *)(v54 + 64) = v53;
    *(_DWORD *)(v54 + 32) = v30;
    OUTLINED_FUNCTION_5_1();
    swift_bridgeObjectRelease();
    sub_1B389C5B0();
    uint64_t v55 = (__n128 *)OUTLINED_FUNCTION_0_9();
    OUTLINED_FUNCTION_3_5(v55, v56, v57, v58, v59, v60, v61, v62, v108, v114, v121, v126, v132, v138, v63);
    *(void *)(v64 + 56) = v44;
    *(void *)(v64 + 64) = v53;
    *(_DWORD *)(v64 + 32) = v29;
    OUTLINED_FUNCTION_5_1();
    swift_bridgeObjectRelease();
    sub_1B389C5B0();
    BOOL v65 = (__n128 *)OUTLINED_FUNCTION_0_9();
    OUTLINED_FUNCTION_3_5(v65, v66, v67, v68, v69, v70, v71, v72, v109, v115, v122, v127, v133, v139, v73);
    uint64_t v74 = MEMORY[0x1E4FBB460];
    v75[7] = v76;
    v75[8] = v74;
    v75[4] = v123;
    sub_1B389C0B0();
    unint64_t v77 = MEMORY[0x1E4FBB1A0];
    uint64_t v78 = v128;
  }
  swift_bridgeObjectRelease();
  sub_1B389C5B0();
  char v92 = (__n128 *)OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_3_5(v92, v93, v94, v95, v96, v97, v98, v99, v110, v116, v123, v128, v134, v140, v100);
  id v101 = *(id *)(v1 + *(void *)(*(void *)v1 + 472));
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CCF310);
  uint64_t v102 = sub_1B389C300();
  v92[3].n128_u64[1] = v77;
  v92[4].n128_u64[0] = v78;
  v92[2].n128_u64[0] = v102;
  v92[2].n128_u64[1] = v103;
  sub_1B389C0B0();
  swift_bridgeObjectRelease();
  sub_1B389C5B0();
  return sub_1B389C0B0();
}

uint64_t sub_1B38812B4(uint64_t a1, unint64_t a2, double a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA918);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B389DD00;
  if (qword_1E9CCE9A8 != -1) {
    swift_once();
  }
  uint64_t v7 = *(void *)algn_1E9CCF5D8;
  *(void *)(inited + 32) = qword_1E9CCF5D0;
  *(void *)(inited + 40) = v7;
  id v8 = objc_allocWithZone(NSNumber);
  swift_bridgeObjectRetain();
  *(void *)(inited + 48) = objc_msgSend(v8, sel_initWithInteger_, a1);
  if (qword_1E9CCEB00 != -1) {
    swift_once();
  }
  uint64_t v9 = *(void *)algn_1E9CCF608;
  *(void *)(inited + 56) = qword_1E9CCF600;
  *(void *)(inited + 64) = v9;
  id v10 = objc_allocWithZone(NSNumber);
  swift_bridgeObjectRetain();
  *(void *)(inited + 72) = objc_msgSend(v10, sel_initWithDouble_, a3);
  *(void *)(inited + 80) = 0xD000000000000010;
  *(void *)(inited + 88) = 0x80000001B38A2F00;
  *(void *)(inited + 96) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInt_, a2);
  if (qword_1E9CCEAE8 != -1) {
    swift_once();
  }
  uint64_t v11 = *(void *)algn_1E9CCF5E8;
  *(void *)(inited + 104) = qword_1E9CCF5E0;
  *(void *)(inited + 112) = v11;
  id v12 = objc_allocWithZone(NSNumber);
  swift_bridgeObjectRetain();
  *(void *)(inited + 120) = objc_msgSend(v12, sel_initWithUnsignedInt_, HIDWORD(a2));
  sub_1B3881E1C();
  return sub_1B389C230();
}

uint64_t sub_1B38814C4(uint64_t a1, unint64_t a2, double a3)
{
  int v3 = a2;
  unint64_t v6 = HIDWORD(a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA930);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1B389DD00;
  uint64_t v8 = MEMORY[0x1E4FBB5C8];
  *(void *)(v7 + 56) = MEMORY[0x1E4FBB550];
  *(void *)(v7 + 64) = v8;
  *(void *)(v7 + 32) = a1;
  uint64_t v9 = MEMORY[0x1E4FBC4C0];
  uint64_t v10 = MEMORY[0x1E4FBC530];
  *(void *)(v7 + 96) = MEMORY[0x1E4FBC4C0];
  *(void *)(v7 + 104) = v10;
  *(_DWORD *)(v7 + 72) = v3;
  *(void *)(v7 + 136) = v9;
  *(void *)(v7 + 144) = v10;
  uint64_t v11 = MEMORY[0x1E4FBB3D0];
  *(_DWORD *)(v7 + 112) = v6;
  uint64_t v12 = MEMORY[0x1E4FBB460];
  *(void *)(v7 + 176) = v11;
  *(void *)(v7 + 184) = v12;
  *(double *)(v7 + 152) = a3;
  sub_1B3898CD0("statusCode=%{signpost.description:attribute,public}d, download=%{signpost.description:attribute}lu, upload=%{signpost.description:attribute}lu, runtime=%{signpost.description:attribute}f", 186, 2, v7);

  return swift_bridgeObjectRelease();
}

void sub_1B38815AC()
{
  OUTLINED_FUNCTION_4_5();
  if ((*(unsigned char *)(v0 + *(void *)(v1 + 120)) & 1) == 0)
  {
    sub_1B3881728();
    if (v2)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA930);
      uint64_t v6 = OUTLINED_FUNCTION_0_9();
      *(_OWORD *)(v6 + 16) = xmmword_1B389D500;
      OUTLINED_FUNCTION_73();
      uint64_t v8 = *(void *)(v0 + *(void *)(v7 + 464) + 8);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t))(v8 + 16))(ObjectType, v8);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CCEE10);
      uint64_t v10 = sub_1B389C300();
      uint64_t v12 = v11;
      *(void *)(v6 + 56) = MEMORY[0x1E4FBB1A0];
      *(void *)(v6 + 64) = sub_1B38579B4();
      *(void *)(v6 + 32) = v10;
      *(void *)(v6 + 40) = v12;
      OUTLINED_FUNCTION_7_1((uint64_t)"UNIDENTIFIED_RESPONSE_TYPE=%{signpost.description:attribute,public}s");
      swift_bridgeObjectRelease();
    }
    else
    {
      OUTLINED_FUNCTION_73();
      (*(void (**)(uint64_t, uint64_t))(v3 + 568))(v4, v5);
    }
    sub_1B3898EE0();
  }
}

uint64_t sub_1B38816E8()
{
  return sub_1B3898F28((void (*)(void))sub_1B3881E10);
}

uint64_t sub_1B3881728()
{
  OUTLINED_FUNCTION_4_5();
  uint64_t v2 = *(void *)(v0 + *(void *)(v1 + 464) + 8);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  uint64_t v5 = v4(ObjectType, v2);
  if (!v5) {
    goto LABEL_7;
  }
  uint64_t v6 = (void *)v5;
  self;
  uint64_t v7 = (void *)swift_dynamicCastObjCClass();
  if (!v7)
  {

LABEL_7:
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA930);
    uint64_t v16 = OUTLINED_FUNCTION_0_9();
    *(_OWORD *)(v16 + 16) = xmmword_1B389D500;
    uint64_t v73 = v4(ObjectType, v2);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CCEE10);
    uint64_t v17 = sub_1B389C300();
    uint64_t v19 = v18;
    *(void *)(v16 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v16 + 64) = sub_1B38579B4();
    *(void *)(v16 + 32) = v17;
    *(void *)(v16 + 40) = v19;
    OUTLINED_FUNCTION_7_1((uint64_t)"UNIDENTIFIED_RESPONSE_TYPE=%{signpost.description:attribute,public}s");
    swift_bridgeObjectRelease();
    sub_1B3898EE0();
    *(double *)&uint64_t result = 0.0;
    return result;
  }
  objc_msgSend(v7, sel_statusCode);
  if (!(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(ObjectType, v2))
  {

    *(double *)&uint64_t result = 0.0;
    return result;
  }
  *(void *)&long long v78 = 0xD000000000000021;
  *((void *)&v78 + 1) = 0x80000001B38A28B0;
  uint64_t v8 = sub_1B389C760();
  OUTLINED_FUNCTION_2_6(v8, v9, v10, v11, v12, v13, v14, v15, v54, v58, v62, v64, v69, v73, v74, v75, v76, v77, v78);
  sub_1B38741B0((uint64_t)&v73);
  if (v79) {
    OUTLINED_FUNCTION_1_11();
  }
  else {
    sub_1B38701F8((uint64_t)&v78);
  }
  *(void *)&long long v78 = 0xD00000000000001DLL;
  *((void *)&v78 + 1) = 0x80000001B38A2890;
  uint64_t v21 = sub_1B389C760();
  OUTLINED_FUNCTION_2_6(v21, v22, v23, v24, v25, v26, v27, v28, v55, v59, v63, v65, v70, v73, v74, v75, v76, v77, v78);
  sub_1B38741B0((uint64_t)&v73);
  if (v79) {
    OUTLINED_FUNCTION_1_11();
  }
  else {
    sub_1B38701F8((uint64_t)&v78);
  }
  uint64_t v29 = sub_1B389C760();
  OUTLINED_FUNCTION_2_6(v29, v30, v31, v32, v33, v34, v35, v36, v56, 0xD00000000000001BLL, 0x80000001B38A2950, v66, v71, v73, v74, v75, v76, v77, v78);
  sub_1B38741B0((uint64_t)&v73);
  if (v79)
  {
    if (OUTLINED_FUNCTION_1_11())
    {
      uint64_t v68 = v60;
      goto LABEL_19;
    }
  }
  else
  {
    sub_1B38701F8((uint64_t)&v78);
  }
  uint64_t v37 = sub_1B389C760();
  OUTLINED_FUNCTION_2_6(v37, v38, v39, v40, v41, v42, v43, v44, v57, 0xD00000000000001BLL, 0x80000001B38A2710, v67, v72, v73, v74, v75, v76, v77, v78);
  sub_1B38741B0((uint64_t)&v73);
  if (!v79)
  {
    sub_1B38701F8((uint64_t)&v78);
    goto LABEL_23;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_23:
    swift_bridgeObjectRelease();

    goto LABEL_25;
  }
LABEL_19:
  double v45 = *(double *)&v68;
  uint64_t v46 = sub_1B389C760();
  OUTLINED_FUNCTION_2_6(v46, v47, v48, v49, v50, v51, v52, v53, v57, 0xD00000000000001ALL, 0x80000001B38A2790, v68, v72, v73, v74, v75, v76, v77, v78);
  swift_bridgeObjectRelease();

  sub_1B38741B0((uint64_t)&v73);
  if (v79)
  {
    if (OUTLINED_FUNCTION_1_11())
    {
      *(double *)&uint64_t result = v61 - v45;
      return result;
    }
  }
  else
  {
    sub_1B38701F8((uint64_t)&v78);
  }
LABEL_25:
  *(double *)&uint64_t result = 0.0;
  return result;
}

uint64_t sub_1B3881B34()
{
  return sub_1B3874024(v0);
}

uint64_t sub_1B3881B40()
{
  return swift_initClassMetadata2();
}

id sub_1B3881B90()
{
  id v1 = objc_msgSend(v0, sel_response);

  return v1;
}

uint64_t sub_1B3881BC8()
{
  OUTLINED_FUNCTION_4_5();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_4_5();

  OUTLINED_FUNCTION_4_5();

  return swift_unknownObjectRelease();
}

uint64_t sub_1B3881C30()
{
  uint64_t v0 = sub_1B3880D68();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t type metadata accessor for NetworkSpan()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1B3881C9C(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  if (*(void *)(a1 + *(void *)(*(void *)a1 + 480)))
  {
    swift_unknownObjectRetain();
    if (nw_activity_is_activated())
    {
      nw_activity_complete_with_reason();
    }
    else
    {
      sub_1B389C590();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA930);
      uint64_t v3 = swift_allocObject();
      *(_OWORD *)(v3 + 16) = xmmword_1B389D500;
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCF320);
      uint64_t v4 = sub_1B389C300();
      uint64_t v6 = v5;
      *(void *)(v3 + 56) = MEMORY[0x1E4FBB1A0];
      *(void *)(v3 + 64) = sub_1B38579B4();
      *(void *)(v3 + 32) = v4;
      *(void *)(v3 + 40) = v6;
      sub_1B389C0B0();
      swift_bridgeObjectRelease();
    }
    a1 = swift_unknownObjectRelease();
  }
  return a2(a1);
}

uint64_t sub_1B3881E10()
{
  return sub_1B3881C9C(*(void *)(v0 + 16), *(uint64_t (**)(uint64_t))(v0 + 24));
}

unint64_t sub_1B3881E1C()
{
  unint64_t result = qword_1EB7FB6A0;
  if (!qword_1EB7FB6A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB7FB6A0);
  }
  return result;
}

void *static FeedbackStreamDescriptor.allCases.getter()
{
  return &unk_1F0C11358;
}

uint64_t FeedbackStreamDescriptor.tableName.getter()
{
  if (!*v0) {
    return OUTLINED_FUNCTION_4_6();
  }
  FeedbackStreamDescriptor.rawValue.getter();
  sub_1B38538CC();
  uint64_t v1 = sub_1B389C6E0();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v3 = *(void *)(v1 + 16);
  if (v3)
  {
    uint64_t v4 = *(void *)(v1 + 16 * v3 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_1B389C3C0();
    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t FeedbackStreamDescriptor.messageSchemaName.getter()
{
  if (*v0) {
    return 0xD000000000000028;
  }
  else {
    return 0xD000000000000026;
  }
}

uint64_t FeedbackStreamDescriptor.streamSegmentSize.getter()
{
  if (*v0) {
    return 0x200000;
  }
  else {
    return 0x20000;
  }
}

PegasusConfiguration::FeedbackStreamDescriptor_optional __swiftcall FeedbackStreamDescriptor.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1B389C950();
  result.value = swift_bridgeObjectRelease();
  char v5 = 17;
  if (v3 < 0x11) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

uint64_t sub_1B388204C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1B38743FC(*a1, *a2);
}

uint64_t sub_1B3882058()
{
  return sub_1B388AB3C(*v0);
}

uint64_t sub_1B3882060(uint64_t a1)
{
  return sub_1B388ACBC(a1, *v1);
}

uint64_t sub_1B3882068(uint64_t a1)
{
  return sub_1B38554F8(a1, *v1);
}

PegasusConfiguration::FeedbackStreamDescriptor_optional sub_1B3882070(Swift::String *a1)
{
  return FeedbackStreamDescriptor.init(rawValue:)(*a1);
}

unint64_t sub_1B388207C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = FeedbackStreamDescriptor.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_1B38820A4(void *a1@<X8>)
{
  *a1 = &unk_1F0C11358;
}

unint64_t FeedbackStreamDescriptor.feedbackAppGroup.getter()
{
  return 0xD000000000000024;
}

PegasusConfiguration::FeedbackStreamDescriptor_optional __swiftcall FeedbackStreamDescriptor.init(tableName:)(Swift::String tableName)
{
  object = tableName._object;
  uint64_t countAndFlagsBits = tableName._countAndFlagsBits;
  uint64_t v4 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCE9C8);
  MEMORY[0x1F4188790](v5 - 8);
  OUTLINED_FUNCTION_29();
  uint64_t v8 = v7 - v6;
  BOOL v9 = countAndFlagsBits == 0x5F6E6F6973736573 && object == (void *)0xEB00000000736673;
  if (v9 || (OUTLINED_FUNCTION_4_6(), (sub_1B389C920() & 1) != 0))
  {
    result.value = swift_bridgeObjectRelease();
    char v11 = 0;
  }
  else
  {
    uint64_t v12 = sub_1B389BF00();
    __swift_storeEnumTagSinglePayload(v8, 1, 1, v12);
    sub_1B38538CC();
    sub_1B389C710();
    char v14 = v13;
    sub_1B3859C40(v8, &qword_1E9CCE9C8);
    swift_bridgeObjectRelease();
    if (v14)
    {
      result.value = swift_bridgeObjectRelease();
    }
    else
    {
      sub_1B389C350();
      OUTLINED_FUNCTION_2_7();
      v17._uint64_t countAndFlagsBits = v15;
      v17._object = v16;
      sub_1B389C3C0();
      swift_bridgeObjectRelease();
      result.value = FeedbackStreamDescriptor.init(rawValue:)(v17).value;
      char v11 = v17._countAndFlagsBits;
      if (LOBYTE(v17._countAndFlagsBits) != 17) {
        goto LABEL_12;
      }
    }
    char v11 = 17;
  }
LABEL_12:
  *uint64_t v4 = v11;
  return result;
}

uint64_t FeedbackStreamDescriptor.storeFolderName.getter()
{
  if (*v0) {
    return 0x6B63616264656566;
  }
  else {
    return 0;
  }
}

uint64_t FeedbackStreamDescriptor.ttlInDays.getter()
{
  return 7;
}

uint64_t FeedbackStreamDescriptor.streamTTLDate.getter()
{
  uint64_t v0 = sub_1B389BE20();
  OUTLINED_FUNCTION_1();
  uint64_t v2 = v1;
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_29();
  uint64_t v6 = v5 - v4;
  sub_1B389BE00();
  sub_1B389BDD0();
  double v8 = v7;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v6, v0);
  if ((~*(void *)&v8 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (v8 <= -9.22337204e18)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (v8 >= 9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if ((unsigned __int128)(((uint64_t)v8 / 86400 - 7) * (__int128)86400) >> 64 == (86400 * ((uint64_t)v8 / 86400 - 7)) >> 63) {
    return sub_1B389BDC0();
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t FeedbackStreamDescriptor.caName.getter()
{
  LOBYTE(v3) = *v0;
  FeedbackStreamDescriptor.rawValue.getter();
  OUTLINED_FUNCTION_2_7();
  sub_1B38824B8();
  sub_1B389C570();
  swift_bridgeObjectRelease();
  uint64_t v1 = MEMORY[0x1B3EBA010](v3);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t FeedbackStreamDescriptor.caIndex.getter()
{
  return qword_1B389FD20[*v0];
}

unint64_t sub_1B38824B8()
{
  unint64_t result = qword_1E9CCF328;
  if (!qword_1E9CCF328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCF328);
  }
  return result;
}

unint64_t sub_1B3882508()
{
  unint64_t result = qword_1EB7FAB30;
  if (!qword_1EB7FAB30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB7FAB30);
  }
  return result;
}

unint64_t sub_1B3882558()
{
  unint64_t result = qword_1E9CCF330;
  if (!qword_1E9CCF330)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9CCF338);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCF330);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for FeedbackStreamDescriptor(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 16 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 16) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEF)
  {
    unsigned int v6 = ((a2 - 240) >> 8) + 1;
    *unint64_t result = a2 + 16;
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
        JUMPOUT(0x1B3882678);
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
          *unint64_t result = a2 + 16;
        break;
    }
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for FeedbackStreamError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for FeedbackStreamError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for FeedbackStreamError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for FeedbackStreamError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FeedbackStreamError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for FeedbackStreamError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 0x7FFFFFFF;
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

uint64_t sub_1B38827F4(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_1B388280C(void *result, int a2)
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

ValueMetadata *type metadata accessor for FeedbackStreamError()
{
  return &type metadata for FeedbackStreamError;
}

void *sub_1B3882840(uint64_t a1, uint64_t a2)
{
  v2[3] = 0;
  swift_unknownObjectWeakInit();
  type metadata accessor for Locker();
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = (_DWORD *)swift_slowAlloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = 0;
  uint64_t v6 = MEMORY[0x1E4FBC868];
  v2[4] = v4;
  v2[5] = v6;
  v2[3] = a2;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  return v2;
}

uint64_t sub_1B38828DC()
{
  uint64_t v1 = v0;
  uint64_t v14 = MEMORY[0x1E4FBC860];
  uint64_t v2 = *(os_unfair_lock_s **)(*(void *)(v0 + 32) + 16);
  os_unfair_lock_lock(v2);
  swift_beginAccess();
  uint64_t v3 = swift_bridgeObjectRetain();
  sub_1B3882C04(v3, (void (*)(uint64_t, uint64_t, uint64_t))sub_1B3882EE8);
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v2);
  if (MEMORY[0x1B3EBAFF0](v1 + 16))
  {
    uint64_t v4 = *(void *)(v1 + 24);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24);
    uint64_t v7 = swift_bridgeObjectRetain();
    v6(v7, ObjectType, v4);
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  uint64_t v8 = *(void *)(v14 + 16);
  if (v8)
  {
    swift_bridgeObjectRetain();
    BOOL v9 = (uint64_t *)(v14 + 40);
    do
    {
      uint64_t v10 = *v9;
      uint64_t v11 = swift_getObjectType();
      uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v10 + 72);
      swift_unknownObjectRetain();
      v12(v11, v10);
      swift_unknownObjectRelease();
      v9 += 2;
      --v8;
    }
    while (v8);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  sub_1B3853E04(v1 + 16);
  swift_release();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_1B3882A7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v8 = MEMORY[0x1B3EBAFF0](a3 + 16);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(a3 + 24);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v10 + 64))(ObjectType, v10);
    swift_unknownObjectRetain();
    sub_1B3882E14((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1B388E604);
    uint64_t v12 = *(void *)(*a4 + 16);
    sub_1B3882EA0(v12, (uint64_t (*)(BOOL))sub_1B388E604);
    uint64_t v13 = *a4;
    *(void *)(v13 + 16) = v12 + 1;
    uint64_t v14 = v13 + 16 * v12;
    *(void *)(v14 + 32) = v9;
    *(void *)(v14 + 40) = v10;
    return swift_unknownObjectRelease();
  }
  else
  {
    sub_1B3882EF0();
    uint64_t v16 = (void *)sub_1B389C640();
    sub_1B389C5B0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA930);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_1B389D500;
    *(void *)(v17 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v17 + 64) = sub_1B38579B4();
    *(void *)(v17 + 32) = a1;
    *(void *)(v17 + 40) = a2;
    swift_bridgeObjectRetain();
    sub_1B389C0B0();

    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1B3882C04(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t))
{
  sub_1B38731B0(v19);
  uint64_t v3 = v19[0];
  uint64_t v4 = v19[1];
  int64_t v5 = v19[3];
  unint64_t v6 = v19[4];
  int64_t v7 = (unint64_t)(v19[2] + 64) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  if (!v6) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v9 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  unint64_t v10 = v9 | (v5 << 6);
  while (1)
  {
    uint64_t v15 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v10);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    uint64_t v18 = *(void *)(*(void *)(v3 + 56) + 8 * v10);
    swift_bridgeObjectRetain();
    swift_retain();
    a2(v16, v17, v18);
    swift_release();
    uint64_t result = swift_bridgeObjectRelease();
    if (v6) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v11 = v5 + 1;
    if (__OFADD__(v5, 1)) {
      break;
    }
    if (v11 >= v7) {
      return swift_release();
    }
    unint64_t v12 = *(void *)(v4 + 8 * v11);
    int64_t v13 = v5 + 1;
    if (!v12)
    {
      int64_t v13 = v5 + 2;
      if (v5 + 2 >= v7) {
        return swift_release();
      }
      unint64_t v12 = *(void *)(v4 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v5 + 3;
        if (v5 + 3 >= v7) {
          return swift_release();
        }
        unint64_t v12 = *(void *)(v4 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v5 + 4;
          if (v5 + 4 >= v7) {
            return swift_release();
          }
          unint64_t v12 = *(void *)(v4 + 8 * v13);
          if (!v12)
          {
            int64_t v13 = v5 + 5;
            if (v5 + 5 >= v7) {
              return swift_release();
            }
            unint64_t v12 = *(void *)(v4 + 8 * v13);
            if (!v12)
            {
              int64_t v14 = v5 + 6;
              while (v14 < v7)
              {
                unint64_t v12 = *(void *)(v4 + 8 * v14++);
                if (v12)
                {
                  int64_t v13 = v14 - 1;
                  goto LABEL_18;
                }
              }
              return swift_release();
            }
          }
        }
      }
    }
LABEL_18:
    unint64_t v6 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v5 = v13;
  }
  __break(1u);
  return result;
}

uint64_t sub_1B3882D8C()
{
  sub_1B38828DC();

  return MEMORY[0x1F4186488](v0, 48, 7);
}

uint64_t type metadata accessor for ActivityMonitor()
{
  return self;
}

uint64_t sub_1B3882DE4()
{
  return sub_1B3882E14((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1B388E2E8);
}

uint64_t sub_1B3882DFC()
{
  return sub_1B3882E14((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1B388E460);
}

uint64_t sub_1B3882E14(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  uint64_t *v1 = v3;
  if (!result)
  {
    uint64_t result = a1(result, *(void *)(v3 + 16) + 1, 1, v3);
    uint64_t *v1 = result;
  }
  return result;
}

uint64_t sub_1B3882E70(uint64_t a1)
{
  return sub_1B3882EA0(a1, (uint64_t (*)(BOOL))sub_1B388E2E8);
}

uint64_t sub_1B3882E88(uint64_t a1)
{
  return sub_1B3882EA0(a1, (uint64_t (*)(BOOL))sub_1B388E460);
}

uint64_t sub_1B3882EA0(uint64_t result, uint64_t (*a2)(BOOL))
{
  unint64_t v3 = *(void *)(*(void *)v2 + 24);
  if (result + 1 > (uint64_t)(v3 >> 1))
  {
    uint64_t result = a2(v3 > 1);
    *(void *)uint64_t v2 = result;
  }
  return result;
}

uint64_t sub_1B3882EE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B3882A7C(a1, a2, a3, *(uint64_t **)(v3 + 16));
}

unint64_t sub_1B3882EF0()
{
  unint64_t result = qword_1EB7FA8B0;
  if (!qword_1EB7FA8B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB7FA8B0);
  }
  return result;
}

uint64_t sub_1B3882F30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 56))(a3, a4);
  uint64_t v10 = v9;
  int64_t v11 = *(os_unfair_lock_s **)(*(void *)(a2 + 32) + 16);
  os_unfair_lock_lock(v11);
  sub_1B3857138(a2, v8, v10, a1, a4);
  os_unfair_lock_unlock(v11);
  swift_bridgeObjectRelease();
  swift_unknownObjectRetain();
  sub_1B3883000(a2, a1, a3, a4);

  return swift_unknownObjectRelease();
}

uint64_t sub_1B3883000(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = MEMORY[0x1B3EBAFF0](a1 + 16);
  if (result)
  {
    uint64_t v8 = *(void *)(a1 + 24);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16))(a2, a4, ObjectType, v8);
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_1B3883090(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA8F0);
    uint64_t v2 = (void *)sub_1B389C880();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
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
          goto LABEL_34;
        }
        if (v9 >= v27)
        {
LABEL_31:
          sub_1B386D380();
          return;
        }
        unint64_t v10 = *(void *)(v28 + 8 * v9);
        int64_t v11 = v6 + 1;
        if (!v10)
        {
          int64_t v11 = v6 + 2;
          if (v6 + 2 >= v27) {
            goto LABEL_31;
          }
          unint64_t v10 = *(void *)(v28 + 8 * v11);
          if (!v10)
          {
            int64_t v11 = v6 + 3;
            if (v6 + 3 >= v27) {
              goto LABEL_31;
            }
            unint64_t v10 = *(void *)(v28 + 8 * v11);
            if (!v10)
            {
              int64_t v11 = v6 + 4;
              if (v6 + 4 >= v27) {
                goto LABEL_31;
              }
              unint64_t v10 = *(void *)(v28 + 8 * v11);
              if (!v10)
              {
                int64_t v12 = v6 + 5;
                if (v6 + 5 >= v27) {
                  goto LABEL_31;
                }
                unint64_t v10 = *(void *)(v28 + 8 * v12);
                if (!v10)
                {
                  while (1)
                  {
                    int64_t v11 = v12 + 1;
                    if (__OFADD__(v12, 1)) {
                      goto LABEL_35;
                    }
                    if (v11 >= v27) {
                      goto LABEL_31;
                    }
                    unint64_t v10 = *(void *)(v28 + 8 * v11);
                    ++v12;
                    if (v10) {
                      goto LABEL_25;
                    }
                  }
                }
                int64_t v11 = v6 + 5;
              }
            }
          }
        }
LABEL_25:
        unint64_t v5 = (v10 - 1) & v10;
        unint64_t v8 = __clz(__rbit64(v10)) + (v11 << 6);
        int64_t v6 = v11;
      }
      int64_t v13 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v8);
      uint64_t v15 = *v13;
      uint64_t v14 = v13[1];
      uint64_t v16 = *(void **)(*(void *)(a1 + 56) + 8 * v8);
      swift_bridgeObjectRetain();
      id v17 = v16;
      unint64_t v18 = sub_1B3857DA8(v15, v14);
      unint64_t v19 = v18;
      if ((v20 & 1) == 0) {
        break;
      }
      uint64_t v21 = (uint64_t *)(v2[6] + 16 * v18);
      swift_bridgeObjectRelease();
      *uint64_t v21 = v15;
      v21[1] = v14;
      uint64_t v22 = v2[7];

      *(void *)(v22 + 8 * v19) = v17;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v18;
    uint64_t v23 = (uint64_t *)(v2[6] + 16 * v18);
    *uint64_t v23 = v15;
    v23[1] = v14;
    *(void *)(v2[7] + 8 * v18) = v17;
    uint64_t v24 = v2[2];
    BOOL v25 = __OFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (v25) {
      goto LABEL_33;
    }
    v2[2] = v26;
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
}

void sub_1B3883328(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FA8F8);
    uint64_t v2 = sub_1B389C880();
  }
  else
  {
    uint64_t v2 = MEMORY[0x1E4FBC868];
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
    unint64_t v18 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v9);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    sub_1B3855FF8(*(void *)(a1 + 56) + 32 * v9, (uint64_t)v44);
    *(void *)&long long v43 = v20;
    *((void *)&v43 + 1) = v19;
    v41[2] = v43;
    v42[0] = v44[0];
    v42[1] = v44[1];
    *(void *)&v41[0] = v20;
    *((void *)&v41[0] + 1) = v19;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_1B386D320(v42, v36);
    long long v37 = v33;
    long long v38 = v34;
    uint64_t v39 = v35;
    sub_1B386D320(v36, v40);
    long long v33 = v37;
    long long v34 = v38;
    uint64_t v35 = v39;
    sub_1B386D320(v40, v41);
    sub_1B386D320(v41, &v37);
    uint64_t v21 = sub_1B389C740();
    uint64_t v22 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v23 = v21 & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v6 + 8 * (v23 >> 6))) == 0)
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v22) >> 6;
      while (++v24 != v27 || (v26 & 1) == 0)
      {
        BOOL v28 = v24 == v27;
        if (v24 == v27) {
          unint64_t v24 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v6 + 8 * v24);
        if (v29 != -1)
        {
          unint64_t v25 = __clz(__rbit64(~v29)) + (v24 << 6);
          goto LABEL_38;
        }
      }
      __break(1u);
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    unint64_t v25 = __clz(__rbit64((-1 << v23) & ~*(void *)(v6 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
LABEL_38:
    *(void *)(v6 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
    uint64_t v30 = *(void *)(v2 + 48) + 40 * v25;
    *(_OWORD *)uint64_t v30 = v33;
    *(_OWORD *)(v30 + 16) = v34;
    *(void *)(v30 + 32) = v35;
    sub_1B386D320(&v37, (_OWORD *)(*(void *)(v2 + 56) + 32 * v25));
    ++*(void *)(v2 + 16);
    if (v5) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v10 = v7 + 1;
    if (__OFADD__(v7, 1)) {
      goto LABEL_42;
    }
    if (v10 >= v31) {
      goto LABEL_40;
    }
    unint64_t v11 = *(void *)(v32 + 8 * v10);
    int64_t v12 = v7 + 1;
    if (!v11)
    {
      OUTLINED_FUNCTION_8_2();
      if (v13 == v14) {
        goto LABEL_40;
      }
      OUTLINED_FUNCTION_7_2();
      if (!v11)
      {
        OUTLINED_FUNCTION_8_2();
        if (v13 == v14) {
          goto LABEL_40;
        }
        OUTLINED_FUNCTION_7_2();
        if (!v11)
        {
          OUTLINED_FUNCTION_8_2();
          if (v13 == v14) {
            goto LABEL_40;
          }
          OUTLINED_FUNCTION_7_2();
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
  if (v16 >= v31)
  {
LABEL_40:
    swift_release();
    sub_1B386D380();
    return;
  }
  unint64_t v11 = *(void *)(v32 + 8 * v16);
  if (v11)
  {
    int64_t v12 = v16;
    goto LABEL_28;
  }
  while (!__OFADD__(v16, 1))
  {
    OUTLINED_FUNCTION_8_2();
    if (v13 == v14) {
      goto LABEL_40;
    }
    OUTLINED_FUNCTION_7_2();
    int64_t v16 = v17 + 1;
    if (v11) {
      goto LABEL_28;
    }
  }
LABEL_43:
  __break(1u);
}

void sub_1B38836CC()
{
  if ((v0[81] & 1) == 0)
  {
    uint64_t v1 = v0;
    uint64_t v2 = sub_1B388395C();
    uint64_t v5 = MEMORY[0x1E4FBB1A0];
    if (v6)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA930);
      uint64_t v7 = OUTLINED_FUNCTION_0_9();
      *(_OWORD *)(v7 + 16) = xmmword_1B389D500;
      uint64_t v8 = *(void *)&v0[*(void *)(*(void *)v0 + 464) + 8];
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t))(v8 + 16))(ObjectType, v8);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CCEE10);
      uint64_t v10 = sub_1B389C300();
      uint64_t v12 = v11;
      *(void *)(v7 + 56) = v5;
      *(void *)(v7 + 64) = sub_1B38579B4();
      *(void *)(v7 + 32) = v10;
      *(void *)(v7 + 40) = v12;
      OUTLINED_FUNCTION_5_2((uint64_t)"UNIDENTIFIED_RESPONSE_TYPE=%{signpost.description:attribute,public}s");
      swift_bridgeObjectRelease();
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, double))(*(void *)v0 + 568))(v3, v4, *(double *)&v2);
    }
    char v13 = *(os_unfair_lock_s **)(*(void *)&v1[*(void *)(*(void *)v1 + 152)] + 16);
    swift_retain();
    swift_retain();
    os_unfair_lock_lock(v13);
    if ((v1[81] & 1) == 0)
    {
      if (*(void *)&v1[*(void *)(*(void *)v1 + 480)])
      {
        swift_unknownObjectRetain();
        if (nw_activity_is_activated())
        {
          nw_activity_complete_with_reason();
        }
        else
        {
          sub_1B389C590();
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA930);
          uint64_t v14 = OUTLINED_FUNCTION_0_9();
          *(_OWORD *)(v14 + 16) = xmmword_1B389D500;
          swift_unknownObjectRetain();
          __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCF320);
          uint64_t v15 = sub_1B389C300();
          uint64_t v17 = v16;
          *(void *)(v14 + 56) = v5;
          *(void *)(v14 + 64) = sub_1B38579B4();
          *(void *)(v14 + 32) = v15;
          *(void *)(v14 + 40) = v17;
          sub_1B389C0B0();
          swift_bridgeObjectRelease();
        }
        swift_unknownObjectRelease();
      }
      sub_1B388B91C();
    }
    os_unfair_lock_unlock(v13);
    swift_release();
    swift_release();
  }
}

uint64_t sub_1B388395C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + *(void *)(*(void *)v0 + 464) + 8);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  uint64_t v5 = v4(ObjectType, v2);
  if (v5)
  {
    char v6 = (void *)v5;
    self;
    uint64_t v7 = (void *)swift_dynamicCastObjCClass();
    if (v7)
    {
      objc_msgSend(v7, sel_statusCode);
      if (!(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(ObjectType, v2))
      {

        *(double *)&uint64_t result = 0.0;
        return result;
      }
      *(void *)&long long v95 = 0xD000000000000021;
      *((void *)&v95 + 1) = 0x80000001B38A28B0;
      uint64_t v8 = sub_1B389C760();
      OUTLINED_FUNCTION_2_8(v8, v9, v10, v11, v12, v13, v14, v15, v63, v67, v71, v75, v79, v81, v86, v90, v91, v92, v93,
        v94,
        v95);
      sub_1B38741B0((uint64_t)&v90);
      if (v96) {
        OUTLINED_FUNCTION_1_12();
      }
      else {
        sub_1B38701F8((uint64_t)&v95);
      }
      *(void *)&long long v95 = 0xD00000000000001DLL;
      *((void *)&v95 + 1) = 0x80000001B38A2890;
      uint64_t v27 = sub_1B389C760();
      OUTLINED_FUNCTION_2_8(v27, v28, v29, v30, v31, v32, v33, v34, v64, v68, v72, v76, v80, v82, v87, v90, v91, v92, v93,
        v94,
        v95);
      sub_1B38741B0((uint64_t)&v90);
      if (v96) {
        OUTLINED_FUNCTION_1_12();
      }
      else {
        sub_1B38701F8((uint64_t)&v95);
      }
      uint64_t v38 = sub_1B389C760();
      OUTLINED_FUNCTION_2_8(v38, v39, v40, v41, v42, v43, v44, v45, v65, v69, v73, 0xD00000000000001BLL, 0x80000001B38A2950, v83, v88, v90, v91, v92, v93,
        v94,
        v95);
      sub_1B38741B0((uint64_t)&v90);
      if (v96)
      {
        if (OUTLINED_FUNCTION_1_12())
        {
          uint64_t v85 = v77;
          goto LABEL_26;
        }
      }
      else
      {
        sub_1B38701F8((uint64_t)&v95);
      }
      uint64_t v46 = sub_1B389C760();
      OUTLINED_FUNCTION_2_8(v46, v47, v48, v49, v50, v51, v52, v53, v66, v70, v74, 0xD00000000000001BLL, 0x80000001B38A2710, v84, v89, v90, v91, v92, v93,
        v94,
        v95);
      sub_1B38741B0((uint64_t)&v90);
      if (v96)
      {
        if (swift_dynamicCast())
        {
LABEL_26:
          double v54 = *(double *)&v85;
          uint64_t v55 = sub_1B389C760();
          OUTLINED_FUNCTION_2_8(v55, v56, v57, v58, v59, v60, v61, v62, v66, v70, v74, 0xD00000000000001ALL, 0x80000001B38A2790, v85, v89, v90, v91, v92, v93,
            v94,
            v95);
          swift_bridgeObjectRelease();

          sub_1B38741B0((uint64_t)&v90);
          if (v96)
          {
            if (OUTLINED_FUNCTION_1_12())
            {
              *(double *)&uint64_t result = v78 - v54;
              return result;
            }
          }
          else
          {
            sub_1B38701F8((uint64_t)&v95);
          }
          goto LABEL_32;
        }
      }
      else
      {
        sub_1B38701F8((uint64_t)&v95);
      }
      swift_bridgeObjectRelease();

LABEL_32:
      *(double *)&uint64_t result = 0.0;
      return result;
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA930);
  uint64_t v16 = OUTLINED_FUNCTION_0_9();
  *(_OWORD *)(v16 + 16) = xmmword_1B389D500;
  uint64_t v90 = v4(ObjectType, v2);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9CCEE10);
  uint64_t v17 = sub_1B389C300();
  uint64_t v19 = v18;
  uint64_t v20 = MEMORY[0x1E4FBB1A0];
  *(void *)(v16 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v21 = sub_1B38579B4();
  *(void *)(v16 + 64) = v21;
  *(void *)(v16 + 32) = v17;
  *(void *)(v16 + 40) = v19;
  OUTLINED_FUNCTION_5_2((uint64_t)"UNIDENTIFIED_RESPONSE_TYPE=%{signpost.description:attribute,public}s");
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_73();
  unint64_t v23 = *(os_unfair_lock_s **)(*(void *)(v1 + *(void *)(v22 + 152)) + 16);
  swift_retain();
  swift_retain();
  os_unfair_lock_lock(v23);
  if ((*(unsigned char *)(v1 + 81) & 1) == 0)
  {
    OUTLINED_FUNCTION_73();
    uint64_t v25 = *(void *)(v1 + *(void *)(v24 + 480));
    if (v25)
    {
      swift_unknownObjectRetain();
      if (nw_activity_is_activated())
      {
        OUTLINED_FUNCTION_73();
        nw_activity_complete_with_reason();
      }
      else
      {
        sub_1B389C590();
        uint64_t v35 = OUTLINED_FUNCTION_0_9();
        *(_OWORD *)(v35 + 16) = xmmword_1B389D500;
        uint64_t v90 = v25;
        swift_unknownObjectRetain();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCF320);
        uint64_t v36 = sub_1B389C300();
        *(void *)(v35 + 56) = v20;
        *(void *)(v35 + 64) = v21;
        *(void *)(v35 + 32) = v36;
        *(void *)(v35 + 40) = v37;
        sub_1B389C0B0();
        swift_bridgeObjectRelease();
      }
      swift_unknownObjectRelease();
    }
    sub_1B388B91C();
  }
  os_unfair_lock_unlock(v23);
  swift_release();
  swift_release();
  *(double *)&uint64_t result = 0.0;
  return result;
}

uint64_t sub_1B3883EA8()
{
  uint64_t v1 = *(os_unfair_lock_s **)(*(void *)(v0 + *(void *)(*(void *)v0 + 152)) + 16);
  swift_retain();
  os_unfair_lock_lock(v1);
  char v27 = *(unsigned char *)(v0 + 41);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 56);
  unint64_t v4 = *(void *)(v0 + 64);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v5 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v1);
  swift_release();
  sub_1B389C5B0();
  sub_1B389C0B0();
  sub_1B389C5B0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA930);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1B389D520;
  sub_1B38584F8(*(unsigned char *)(v0 + 80));
  uint64_t v7 = sub_1B389C7D0();
  uint64_t v9 = v8;
  uint64_t v10 = MEMORY[0x1E4FBB1A0];
  *(void *)(v6 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v11 = sub_1B38579B4();
  *(void *)(v6 + 64) = v11;
  *(void *)(v6 + 32) = v7;
  *(void *)(v6 + 40) = v9;
  if (qword_1EB7FA408 != -1) {
    swift_once();
  }
  uint64_t v13 = qword_1EB7FC078;
  uint64_t v12 = unk_1EB7FC080;
  *(void *)(v6 + 96) = v10;
  *(void *)(v6 + 104) = v11;
  *(void *)(v6 + 72) = v13;
  *(void *)(v6 + 80) = v12;
  *(void *)(v6 + 136) = v10;
  *(void *)(v6 + 144) = v11;
  unint64_t v26 = v11;
  *(void *)(v6 + 112) = 0xD000000000000010;
  *(void *)(v6 + 120) = 0x80000001B38A1DF0;
  swift_bridgeObjectRetain();
  sub_1B389C0B0();
  swift_bridgeObjectRelease();
  if ((v27 & 1) == 0)
  {
    sub_1B389C5B0();
    uint64_t v14 = OUTLINED_FUNCTION_0_9();
    *(_OWORD *)(v14 + 16) = xmmword_1B389D500;
    uint64_t v15 = sub_1B389C7D0();
    *(void *)(v14 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v14 + 64) = v11;
    *(void *)(v14 + 32) = v15;
    *(void *)(v14 + 40) = v16;
    OUTLINED_FUNCTION_3_7();
    swift_bridgeObjectRelease();
    if (v5)
    {
      swift_bridgeObjectRetain();
      sub_1B389C5B0();
      uint64_t v17 = OUTLINED_FUNCTION_0_9();
      *(_OWORD *)(v17 + 16) = xmmword_1B389D500;
      *(void *)(v17 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCF358);
      *(void *)(v17 + 64) = sub_1B3884F44(&qword_1E9CCF360, &qword_1E9CCF358);
      *(void *)(v17 + 32) = v5;
      OUTLINED_FUNCTION_3_7();
      swift_bridgeObjectRelease();
    }
  }
  if (v2)
  {
    swift_bridgeObjectRetain();
    sub_1B389C5B0();
    uint64_t v18 = OUTLINED_FUNCTION_0_9();
    *(_OWORD *)(v18 + 16) = xmmword_1B389D500;
    *(void *)(v18 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCF348);
    *(void *)(v18 + 64) = sub_1B3884F44(&qword_1E9CCF350, &qword_1E9CCF348);
    *(void *)(v18 + 32) = v2;
    OUTLINED_FUNCTION_3_7();
    swift_bridgeObjectRelease();
  }
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_1B389C860();
    uint64_t v19 = result;
  }
  else
  {
    uint64_t v19 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
  }
  if (v19)
  {
    if (v19 < 1)
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = 0;
    uint64_t v22 = MEMORY[0x1E4FBB1A0];
    do
    {
      ++v21;
      swift_unknownObjectRetain();
      sub_1B389C5B0();
      uint64_t v23 = OUTLINED_FUNCTION_0_9();
      *(_OWORD *)(v23 + 16) = xmmword_1B389D500;
      swift_unknownObjectRetain();
      uint64_t v24 = sub_1B389C300();
      *(void *)(v23 + 56) = v22;
      *(void *)(v23 + 64) = v26;
      *(void *)(v23 + 32) = v24;
      *(void *)(v23 + 40) = v25;
      sub_1B389C0B0();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
    }
    while (v19 != v21);
  }
  swift_bridgeObjectRelease();
  sub_1B389C5B0();
  sub_1B389C0B0();
  if (sub_1B388B200())
  {
    sub_1B389C5C0();
    sub_1B389C0B0();
  }
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B38843E8()
{
  uint64_t v1 = *(os_unfair_lock_s **)(*(void *)(v0 + *(void *)(*(void *)v0 + 152)) + 16);
  swift_retain();
  os_unfair_lock_lock(v1);
  char v27 = *(unsigned char *)(v0 + 41);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 56);
  unint64_t v4 = *(void *)(v0 + 64);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v5 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v1);
  swift_release();
  sub_1B389C5B0();
  sub_1B389C0B0();
  sub_1B389C5B0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA930);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1B389D520;
  sub_1B38584F8(*(unsigned char *)(v0 + 80));
  uint64_t v7 = sub_1B389C7D0();
  uint64_t v9 = v8;
  uint64_t v10 = MEMORY[0x1E4FBB1A0];
  *(void *)(v6 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v11 = sub_1B38579B4();
  *(void *)(v6 + 64) = v11;
  *(void *)(v6 + 32) = v7;
  *(void *)(v6 + 40) = v9;
  if (qword_1EB7FA370 != -1) {
    swift_once();
  }
  uint64_t v13 = qword_1EB7FC068;
  uint64_t v12 = unk_1EB7FC070;
  *(void *)(v6 + 96) = v10;
  *(void *)(v6 + 104) = v11;
  *(void *)(v6 + 72) = v13;
  *(void *)(v6 + 80) = v12;
  *(void *)(v6 + 136) = v10;
  *(void *)(v6 + 144) = v11;
  unint64_t v26 = v11;
  *(void *)(v6 + 112) = 0xD000000000000010;
  *(void *)(v6 + 120) = 0x80000001B38A1DF0;
  swift_bridgeObjectRetain();
  sub_1B389C0B0();
  swift_bridgeObjectRelease();
  if ((v27 & 1) == 0)
  {
    sub_1B389C5B0();
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_1B389D500;
    uint64_t v15 = sub_1B389C7D0();
    *(void *)(v14 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v14 + 64) = v11;
    *(void *)(v14 + 32) = v15;
    *(void *)(v14 + 40) = v16;
    sub_1B389C0B0();
    swift_bridgeObjectRelease();
    if (v5)
    {
      swift_bridgeObjectRetain();
      sub_1B389C5B0();
      uint64_t v17 = swift_allocObject();
      *(_OWORD *)(v17 + 16) = xmmword_1B389D500;
      *(void *)(v17 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCF358);
      *(void *)(v17 + 64) = sub_1B3884F44(&qword_1E9CCF360, &qword_1E9CCF358);
      *(void *)(v17 + 32) = v5;
      sub_1B389C0B0();
      swift_bridgeObjectRelease();
    }
  }
  if (v2)
  {
    swift_bridgeObjectRetain();
    sub_1B389C5B0();
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_1B389D500;
    *(void *)(v18 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCF348);
    *(void *)(v18 + 64) = sub_1B3884F44(&qword_1E9CCF350, &qword_1E9CCF348);
    *(void *)(v18 + 32) = v2;
    sub_1B389C0B0();
    swift_bridgeObjectRelease();
  }
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_1B389C860();
    uint64_t v19 = result;
  }
  else
  {
    uint64_t v19 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
  }
  if (v19)
  {
    if (v19 < 1)
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = 0;
    uint64_t v22 = MEMORY[0x1E4FBB1A0];
    do
    {
      ++v21;
      swift_unknownObjectRetain();
      sub_1B389C5B0();
      uint64_t v23 = swift_allocObject();
      *(_OWORD *)(v23 + 16) = xmmword_1B389D500;
      swift_unknownObjectRetain();
      uint64_t v24 = sub_1B389C300();
      *(void *)(v23 + 56) = v22;
      *(void *)(v23 + 64) = v26;
      *(void *)(v23 + 32) = v24;
      *(void *)(v23 + 40) = v25;
      sub_1B389C0B0();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
    }
    while (v19 != v21);
  }
  swift_bridgeObjectRelease();
  sub_1B389C5B0();
  sub_1B389C0B0();
  if (sub_1B388B2E8())
  {
    sub_1B389C5C0();
    sub_1B389C0B0();
  }
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B3884978()
{
  if (qword_1E9CCEAD8 != -1) {
    swift_once();
  }
  qword_1EB7FC068 = qword_1E9CCF5B0;
  unk_1EB7FC070 = *(void *)algn_1E9CCF5B8;

  return swift_bridgeObjectRetain();
}

uint64_t *sub_1B38849E4()
{
  if (qword_1EB7FA370 != -1) {
    swift_once();
  }
  return &qword_1EB7FC068;
}

void sub_1B3884A30()
{
  qword_1E9CCF698 = (uint64_t)&unk_1F0C11308;
}

void sub_1B3884A44()
{
  qword_1EB7FC0B0 = (uint64_t)&unk_1F0C112E0;
}

uint64_t sub_1B3884B0C()
{
  sub_1B38849E4();
  uint64_t v0 = qword_1EB7FC068;
  swift_bridgeObjectRetain();
  return v0;
}

const char *sub_1B3884B48()
{
  return sub_1B38584F8(*v0);
}

uint64_t sub_1B3884B68()
{
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1B3884BAC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1B3884C18()
{
  sub_1B389C5B0();
  sub_1B389C0B0();
  sub_1B38843E8();
  sub_1B389C5B0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA930);
  uint64_t v1 = OUTLINED_FUNCTION_0_9();
  *(_OWORD *)(v1 + 16) = xmmword_1B389D500;
  uint64_t v2 = sub_1B389C300();
  uint64_t v4 = v3;
  uint64_t v5 = MEMORY[0x1E4FBB1A0];
  *(void *)(v1 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v6 = sub_1B38579B4();
  *(void *)(v1 + 64) = v6;
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v4;
  OUTLINED_FUNCTION_4_7();
  swift_bridgeObjectRelease();
  sub_1B389C5B0();
  uint64_t v7 = OUTLINED_FUNCTION_0_9();
  *(_OWORD *)(v7 + 16) = xmmword_1B389D500;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCF340);
  uint64_t v8 = sub_1B389C300();
  *(void *)(v7 + 56) = v5;
  *(void *)(v7 + 64) = v6;
  *(void *)(v7 + 32) = v8;
  *(void *)(v7 + 40) = v9;
  OUTLINED_FUNCTION_4_7();
  swift_bridgeObjectRelease();
  sub_1B389C5B0();
  uint64_t v10 = OUTLINED_FUNCTION_0_9();
  uint64_t v11 = *(void *)(v0 + qword_1EB7FC098);
  *(_OWORD *)(v10 + 16) = xmmword_1B389D500;
  *(void *)(v10 + 56) = v5;
  *(void *)(v10 + 64) = v6;
  BOOL v12 = v11 == 0;
  uint64_t v13 = 7562617;
  if (v12) {
    uint64_t v13 = 28526;
  }
  unint64_t v14 = 0xE300000000000000;
  if (v12) {
    unint64_t v14 = 0xE200000000000000;
  }
  *(void *)(v10 + 32) = v13;
  *(void *)(v10 + 40) = v14;
  sub_1B389C0B0();
  swift_bridgeObjectRelease();
  sub_1B389C5B0();
  return sub_1B389C0B0();
}

unint64_t sub_1B3884E3C(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1B3884E6C();
  unint64_t result = sub_1B3884EB8();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_1B3884E6C()
{
  unint64_t result = qword_1EB7FA770;
  if (!qword_1EB7FA770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB7FA770);
  }
  return result;
}

unint64_t sub_1B3884EB8()
{
  unint64_t result = qword_1EB7FA788;
  if (!qword_1EB7FA788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB7FA788);
  }
  return result;
}

unint64_t sub_1B3884F04()
{
  unint64_t result = qword_1EB7FBDD0;
  if (!qword_1EB7FBDD0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB7FBDD0);
  }
  return result;
}

uint64_t sub_1B3884F44(unint64_t *a1, uint64_t *a2)
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

uint64_t FederatedIdentifier.uuid.getter@<X0>(uint64_t a1@<X8>)
{
  sub_1B389BE70();
  OUTLINED_FUNCTION_11();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);

  return v5(a1, v1, v3);
}

uint64_t FederatedIdentifier.dateCreated.getter@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for FederatedIdentifier();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_11();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);

  return v5(a1, v1, v3);
}

uint64_t type metadata accessor for FederatedIdentifier()
{
  uint64_t result = qword_1E9CCEA10;
  if (!qword_1E9CCEA10) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t FederatedIdentifier.init(uuid:dateCreated:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_1B389BE70();
  OUTLINED_FUNCTION_11();
  (*(void (**)(uint64_t, uint64_t))(v6 + 32))(a3, a1);
  uint64_t v7 = a3 + *(int *)(type metadata accessor for FederatedIdentifier() + 20);
  sub_1B389BE20();
  OUTLINED_FUNCTION_11();
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 32);

  return v10(v7, a2, v8);
}

uint64_t FederatedIdentifier.init()()
{
  return sub_1B389BE00();
}

uint64_t FederatedIdentifier.hash(into:)()
{
  return sub_1B389C250();
}

uint64_t static FederatedIdentifier.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((sub_1B389BE40() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = *(int *)(type metadata accessor for FederatedIdentifier() + 20);

  return MEMORY[0x1F40E52C0](a1 + v4, a2 + v4);
}

uint64_t sub_1B38852B8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1684632949 && a2 == 0xE400000000000000;
  if (v3 || (sub_1B389C920() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6165724365746164 && a2 == 0xEB00000000646574)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_1B389C920();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1B38853A0()
{
  return 2;
}

uint64_t sub_1B38853A8()
{
  return 0;
}

uint64_t sub_1B38853B4(char a1)
{
  if (a1) {
    return 0x6165724365746164;
  }
  else {
    return 1684632949;
  }
}

uint64_t sub_1B38853EC()
{
  return sub_1B38853B4(*v0);
}

uint64_t sub_1B38853F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1B38852B8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1B388541C()
{
  return sub_1B38853A8();
}

uint64_t sub_1B388543C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1B38853A0();
  *a1 = result;
  return result;
}

uint64_t sub_1B3885464(uint64_t a1)
{
  unint64_t v2 = sub_1B38856A4();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1B38854A0(uint64_t a1)
{
  unint64_t v2 = sub_1B38856A4();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t FederatedIdentifier.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCEAC0);
  OUTLINED_FUNCTION_1();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_3_1();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B38856A4();
  sub_1B389CA60();
  sub_1B389BE70();
  sub_1B38866B4(&qword_1E9CCE9C0, MEMORY[0x1E4F27990]);
  sub_1B389C8D0();
  if (!v1)
  {
    type metadata accessor for FederatedIdentifier();
    sub_1B389BE20();
    sub_1B38866B4(&qword_1E9CCE9B8, MEMORY[0x1E4F27928]);
    sub_1B389C8D0();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

unint64_t sub_1B38856A4()
{
  unint64_t result = qword_1E9CCE9F8;
  if (!qword_1E9CCE9F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCE9F8);
  }
  return result;
}

uint64_t FederatedIdentifier.hashValue.getter()
{
  return sub_1B389CA40();
}

uint64_t FederatedIdentifier.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v21 = sub_1B389BE20();
  OUTLINED_FUNCTION_1();
  uint64_t v18 = v6;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_5_3();
  uint64_t v23 = sub_1B389BE70();
  OUTLINED_FUNCTION_1();
  uint64_t v20 = v8;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_29();
  uint64_t v22 = v11 - v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCF378);
  OUTLINED_FUNCTION_1();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_3_1();
  uint64_t v13 = type metadata accessor for FederatedIdentifier();
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_7_3();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B38856A4();
  sub_1B389CA50();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  sub_1B38866B4(&qword_1E9CCF380, MEMORY[0x1E4F27990]);
  sub_1B389C8C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 32))(v3, v22, v23);
  sub_1B38866B4(&qword_1E9CCF388, MEMORY[0x1E4F27928]);
  sub_1B389C8C0();
  uint64_t v15 = OUTLINED_FUNCTION_4_8();
  v16(v15);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 32))(v3 + *(int *)(v13 + 20), v4, v21);
  sub_1B3885C24(v3, a2);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  return sub_1B3885C88(v3);
}

uint64_t sub_1B3885B04@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return FederatedIdentifier.init(from:)(a1, a2);
}

uint64_t sub_1B3885B1C(void *a1)
{
  return FederatedIdentifier.encode(to:)(a1);
}

uint64_t sub_1B3885B3C()
{
  return sub_1B389CA40();
}

uint64_t sub_1B3885C24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FederatedIdentifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B3885C88(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for FederatedIdentifier();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static FederatedIdentifier.< infix(_:_:)()
{
  type metadata accessor for FederatedIdentifier();

  return sub_1B389BD90();
}

BOOL sub_1B3885D38()
{
  return (sub_1B389BD90() & 1) == 0;
}

BOOL sub_1B3885D80()
{
  return (sub_1B389BD90() & 1) == 0;
}

uint64_t sub_1B3885DC8()
{
  type metadata accessor for FederatedIdentifier();

  return sub_1B389BD90();
}

unint64_t static FederatedIdentifier.keyTTLInDays.getter()
{
  return 0xD00000000000001CLL;
}

uint64_t static FederatedIdentifier.defaultTTLInMonths.getter()
{
  return 15;
}

uint64_t FederatedIdentifier.isValid(for:)(uint64_t a1)
{
  uint64_t v49 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FAB58);
  MEMORY[0x1F4188790](v3 - 8);
  OUTLINED_FUNCTION_29();
  uint64_t v6 = v5 - v4;
  uint64_t v50 = sub_1B389BE20();
  OUTLINED_FUNCTION_1();
  uint64_t v48 = v7;
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  uint64_t v47 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v46 = (char *)&v46 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCF390);
  MEMORY[0x1F4188790](v12 - 8);
  OUTLINED_FUNCTION_29();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCF398);
  MEMORY[0x1F4188790](v16 - 8);
  OUTLINED_FUNCTION_29();
  uint64_t v19 = v18 - v17;
  sub_1B389BBE0();
  OUTLINED_FUNCTION_1();
  uint64_t v51 = v21;
  uint64_t v52 = v20;
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_29();
  uint64_t v24 = v23 - v22;
  uint64_t v25 = sub_1B389BF10();
  OUTLINED_FUNCTION_1();
  uint64_t v27 = v26;
  MEMORY[0x1F4188790](v28);
  OUTLINED_FUNCTION_5_3();
  uint64_t v29 = sub_1B389BF70();
  OUTLINED_FUNCTION_1();
  uint64_t v31 = v30;
  MEMORY[0x1F4188790](v32);
  OUTLINED_FUNCTION_7_3();
  (*(void (**)(uint64_t, void, uint64_t))(v27 + 104))(v2, *MEMORY[0x1E4F27B20], v25);
  sub_1B389BF20();
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v2, v25);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16))(v19, v1, v29);
  __swift_storeEnumTagSinglePayload(v19, 0, 1, v29);
  uint64_t v33 = sub_1B389BF80();
  __swift_storeEnumTagSinglePayload(v15, 1, 1, v33);
  sub_1B389BBD0();
  if (!v49 || (Config.federatedIdentifierTTLInDays.getter(), (v34 & 1) != 0)) {
    sub_1B389BBB0();
  }
  else {
    sub_1B389BB90();
  }
  type metadata accessor for FederatedIdentifier();
  sub_1B389BF40();
  uint64_t v35 = v50;
  if (__swift_getEnumTagSinglePayload(v6, 1, v50) == 1)
  {
    sub_1B3886378(v6);
    if (qword_1EB7FAAD0 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_1B389C1B0();
    __swift_project_value_buffer(v36, (uint64_t)qword_1EB7FC128);
    uint64_t v37 = sub_1B389C190();
    os_log_type_t v38 = sub_1B389C5B0();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v39 = 0;
      _os_log_impl(&dword_1B3850000, v37, v38, "FederatedIdentifier endDate could not be computed", v39, 2u);
      MEMORY[0x1B3EBAF20](v39, -1, -1);
    }

    char v40 = 0;
  }
  else
  {
    uint64_t v41 = v48;
    uint64_t v42 = v46;
    (*(void (**)(char *, uint64_t, uint64_t))(v48 + 32))(v46, v6, v35);
    uint64_t v43 = v47;
    sub_1B389BE00();
    char v40 = sub_1B389BD80();
    uint64_t v44 = *(void (**)(char *, uint64_t))(v41 + 8);
    v44(v43, v35);
    v44(v42, v35);
  }
  (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v24, v52);
  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v1, v29);
  return v40 & 1;
}

uint64_t sub_1B3886378(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FAB58);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id Config.federatedIdentifierTTLInDays.getter()
{
  uint64_t v1 = (void *)sub_1B389C280();
  id v2 = objc_msgSend(v0, sel_valueForKey_shouldConsiderOverrides_, v1, 1);

  if (v2)
  {
    sub_1B389C730();
    swift_unknownObjectRelease();
    sub_1B386D320(&v12, v14);
    sub_1B3855FF8((uint64_t)v14, (uint64_t)&v12);
    if (swift_dynamicCast())
    {
      id v2 = v11;
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v14);
    }
    else
    {
      if (qword_1EB7FAAD0 != -1) {
        swift_once();
      }
      uint64_t v3 = sub_1B389C1B0();
      __swift_project_value_buffer(v3, (uint64_t)qword_1EB7FC128);
      sub_1B3855FF8((uint64_t)v14, (uint64_t)&v12);
      uint64_t v4 = sub_1B389C190();
      os_log_type_t v5 = sub_1B389C5B0();
      if (os_log_type_enabled(v4, v5))
      {
        uint64_t v6 = (uint8_t *)swift_slowAlloc();
        uint64_t v7 = swift_slowAlloc();
        uint64_t v11 = (void *)v7;
        *(_DWORD *)uint64_t v6 = 136315138;
        __swift_project_boxed_opaque_existential_1(&v12, v13);
        swift_getDynamicType();
        uint64_t v8 = sub_1B389CAA0();
        sub_1B3855F24(v8, v9, (uint64_t *)&v11);
        sub_1B389C6C0();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v12);
        _os_log_impl(&dword_1B3850000, v4, v5, "Config has FederatedIdentifier with unexpected type: %s", v6, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1B3EBAF20](v7, -1, -1);
        MEMORY[0x1B3EBAF20](v6, -1, -1);

        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v14);
      }
      else
      {

        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v12);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v14);
      }
      return 0;
    }
  }
  return v2;
}

uint64_t sub_1B388666C()
{
  return sub_1B38866B4(&qword_1E9CCF3A0, (void (*)(uint64_t))type metadata accessor for FederatedIdentifier);
}

uint64_t sub_1B38866B4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *initializeBufferWithCopyOfBuffer for FederatedIdentifier(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1B389BE70();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    unint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_1B389BE20();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t destroy for FederatedIdentifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B389BE70();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_1B389BE20();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t initializeWithCopy for FederatedIdentifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1B389BE70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1B389BE20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t assignWithCopy for FederatedIdentifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1B389BE70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1B389BE20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for FederatedIdentifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1B389BE70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1B389BE20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t assignWithTake for FederatedIdentifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1B389BE70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1B389BE20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for FederatedIdentifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B3886BA0);
}

uint64_t sub_1B3886BA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1B389BE70();
  OUTLINED_FUNCTION_20();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = sub_1B389BE20();
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }

  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for FederatedIdentifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B3886C30);
}

uint64_t sub_1B3886C30(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1B389BE70();
  OUTLINED_FUNCTION_20();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    uint64_t v10 = sub_1B389BE20();
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }

  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t sub_1B3886CB4()
{
  uint64_t result = sub_1B389BE70();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1B389BE20();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for FederatedIdentifier.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x1B3886E48);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FederatedIdentifier.CodingKeys()
{
  return &type metadata for FederatedIdentifier.CodingKeys;
}

unint64_t sub_1B3886E84()
{
  unint64_t result = qword_1E9CCF3A8;
  if (!qword_1E9CCF3A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCF3A8);
  }
  return result;
}

unint64_t sub_1B3886ED4()
{
  unint64_t result = qword_1E9CCEA08;
  if (!qword_1E9CCEA08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCEA08);
  }
  return result;
}

unint64_t sub_1B3886F24()
{
  unint64_t result = qword_1E9CCEA00;
  if (!qword_1E9CCEA00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCEA00);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return sub_1B389BE20();
}

uint64_t sub_1B3886F8C()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_1B389C060();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v24 - v6;
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v24 - v8;
  objc_msgSend(v1, sel_code);
  sub_1B389C030();
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v7, v9, v2);
  sub_1B389C050();
  sub_1B38873A8();
  char v10 = OUTLINED_FUNCTION_1_13();
  uint64_t v11 = *(void (**)(void))(v3 + 8);
  OUTLINED_FUNCTION_0_10();
  v11();
  if (v10)
  {
    OUTLINED_FUNCTION_0_10();
    v11();
    OUTLINED_FUNCTION_0_10();
    v11();
    return 59;
  }
  else
  {
    sub_1B389C020();
    char v13 = OUTLINED_FUNCTION_1_13();
    OUTLINED_FUNCTION_0_10();
    v11();
    if (v13)
    {
      OUTLINED_FUNCTION_0_10();
      v11();
      OUTLINED_FUNCTION_0_10();
      v11();
      return 60;
    }
    else
    {
      sub_1B389C040();
      char v14 = OUTLINED_FUNCTION_1_13();
      OUTLINED_FUNCTION_0_10();
      v11();
      if (v14)
      {
        OUTLINED_FUNCTION_0_10();
        v11();
        OUTLINED_FUNCTION_0_10();
        v11();
        return 61;
      }
      else
      {
        sub_1B389BFA0();
        char v15 = OUTLINED_FUNCTION_1_13();
        OUTLINED_FUNCTION_0_10();
        v11();
        if (v15)
        {
          OUTLINED_FUNCTION_0_10();
          v11();
          OUTLINED_FUNCTION_0_10();
          v11();
          return 62;
        }
        else
        {
          sub_1B389BF90();
          char v16 = OUTLINED_FUNCTION_1_13();
          OUTLINED_FUNCTION_0_10();
          v11();
          if ((v16 & 1) != 0
            || (sub_1B389BFC0(), char v17 = OUTLINED_FUNCTION_1_13(), OUTLINED_FUNCTION_0_10(), v11(), (v17 & 1) != 0))
          {
            OUTLINED_FUNCTION_0_10();
            v11();
            OUTLINED_FUNCTION_0_10();
            v11();
            return 63;
          }
          else
          {
            sub_1B389BFF0();
            char v18 = OUTLINED_FUNCTION_1_13();
            OUTLINED_FUNCTION_0_10();
            v11();
            if (v18)
            {
              OUTLINED_FUNCTION_0_10();
              v11();
              OUTLINED_FUNCTION_0_10();
              v11();
              return 64;
            }
            else
            {
              sub_1B389BFB0();
              char v19 = OUTLINED_FUNCTION_1_13();
              OUTLINED_FUNCTION_0_10();
              v11();
              if (v19)
              {
                OUTLINED_FUNCTION_0_10();
                v11();
                OUTLINED_FUNCTION_0_10();
                v11();
                return 65;
              }
              else
              {
                sub_1B389BFE0();
                char v20 = OUTLINED_FUNCTION_1_13();
                OUTLINED_FUNCTION_0_10();
                v11();
                if (v20)
                {
                  OUTLINED_FUNCTION_0_10();
                  v11();
                  OUTLINED_FUNCTION_0_10();
                  v11();
                  return 66;
                }
                else
                {
                  sub_1B389BFD0();
                  char v21 = OUTLINED_FUNCTION_1_13();
                  OUTLINED_FUNCTION_0_10();
                  v11();
                  if (v21)
                  {
                    OUTLINED_FUNCTION_0_10();
                    v11();
                    OUTLINED_FUNCTION_0_10();
                    v11();
                    return 67;
                  }
                  else
                  {
                    sub_1B389C000();
                    char v22 = OUTLINED_FUNCTION_1_13();
                    OUTLINED_FUNCTION_0_10();
                    v11();
                    if (v22)
                    {
                      OUTLINED_FUNCTION_0_10();
                      v11();
                      OUTLINED_FUNCTION_0_10();
                      v11();
                      return 68;
                    }
                    else
                    {
                      sub_1B389C010();
                      char v23 = OUTLINED_FUNCTION_1_13();
                      OUTLINED_FUNCTION_0_10();
                      v11();
                      OUTLINED_FUNCTION_0_10();
                      v11();
                      OUTLINED_FUNCTION_0_10();
                      v11();
                      if (v23) {
                        return 69;
                      }
                      else {
                        return 22;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

unint64_t sub_1B38873A8()
{
  unint64_t result = qword_1E9CCF3B0;
  if (!qword_1E9CCF3B0)
  {
    sub_1B389C060();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCF3B0);
  }
  return result;
}

PegasusConfiguration::DataVaultStorageClass_optional __swiftcall DataVaultStorageClass.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1B389C8B0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

void *static DataVaultStorageClass.allCases.getter()
{
  return &unk_1F0C11250;
}

unint64_t DataVaultStorageClass.rawValue.getter()
{
  unint64_t v1 = 0xD000000000000017;
  if (*v0 != 1) {
    unint64_t v1 = 0xD000000000000016;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0xD000000000000014;
  }
}

uint64_t sub_1B38874C0(unsigned __int8 *a1, char *a2)
{
  return sub_1B387445C(*a1, *a2);
}

uint64_t sub_1B38874CC()
{
  return sub_1B388AB70();
}

uint64_t sub_1B38874D4()
{
  return sub_1B388AD3C();
}

uint64_t sub_1B38874DC()
{
  return sub_1B388AF70();
}

PegasusConfiguration::DataVaultStorageClass_optional sub_1B38874E4(Swift::String *a1)
{
  return DataVaultStorageClass.init(rawValue:)(*a1);
}

unint64_t sub_1B38874F0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = DataVaultStorageClass.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_1B3887518(void *a1@<X8>)
{
  *a1 = &unk_1F0C11250;
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> DataVaultStorageClass.path(using:makeDirectory:)(NSFileManager using, Swift::Bool makeDirectory)
{
  uint64_t v4 = type metadata accessor for DataVaultPathProvider();
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_29();
  uint64_t v7 = (NSFileManager *)(v6 - v5);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
  MEMORY[0x1F4188790](v8 - 8);
  OUTLINED_FUNCTION_29();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = sub_1B389BD00();
  OUTLINED_FUNCTION_1();
  uint64_t v14 = v13;
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_29();
  uint64_t v18 = v17 - v16;
  char v19 = (void *)*v2;
  Class isa = using.super.isa;
  sub_1B38561AC();
  if (__swift_getEnumTagSinglePayload(v11, 1, v12) == 1)
  {
    sub_1B38877AC(v11);
    sub_1B388780C();
    swift_allocError();
    *(_OWORD *)uint64_t v21 = xmmword_1B389F570;
    *(unsigned char *)(v21 + 16) = 3;
    swift_willThrow();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32))(v18, v11, v12);
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)v7 + *(int *)(v4 + 20), v18, v12);
    v7->super.Class isa = using.super.isa;
    unsigned __int8 v32 = v19;
    char v22 = using.super.isa;
    Class isa = (Class)v7;
    uint64_t v23 = sub_1B3887858(&v32, makeDirectory);
    if (!v30)
    {
      Class isa = (Class)v23;
      char v19 = v24;
    }
    sub_1B3888054((uint64_t)v7);
    uint64_t v25 = OUTLINED_FUNCTION_7_4();
    v26(v25);
  }
  uint64_t v27 = (uint64_t)isa;
  uint64_t v28 = v19;
  result._object = v28;
  result._uint64_t countAndFlagsBits = v27;
  return result;
}

uint64_t type metadata accessor for DataVaultPathProvider()
{
  uint64_t result = qword_1E9CCF3E8;
  if (!qword_1E9CCF3E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1B38877AC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1B388780C()
{
  unint64_t result = qword_1E9CCF3C8;
  if (!qword_1E9CCF3C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCF3C8);
  }
  return result;
}

uint64_t sub_1B3887858(unsigned __int8 *a1, int a2)
{
  LODWORD(v70) = a2;
  uint64_t v5 = sub_1B389BC30();
  OUTLINED_FUNCTION_1();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_29();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = sub_1B389BD00();
  OUTLINED_FUNCTION_1();
  uint64_t v14 = v13;
  uint64_t v16 = MEMORY[0x1F4188790](v15);
  uint64_t v18 = (char *)v66 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  int v19 = *a1;
  uint64_t v71 = (char *)v66 - v20;
  sub_1B3888998();
  if (!v3)
  {
    char v21 = v70;
    int v68 = v19;
    uint64_t v69 = v12;
    sub_1B3888B1C();
    v66[2] = 0;
    uint64_t v67 = v2;
    v66[1] = "com.apple.photos";
    if (v68)
    {
      char v22 = v21;
      uint64_t v23 = v5;
      if (v68 == 1)
      {
        uint64_t v24 = 0xD000000000000017;
        uint64_t v25 = "coreparsec_feedbacks";
      }
      else
      {
        uint64_t v24 = 0xD000000000000016;
        uint64_t v25 = "coreparsec_aggregations";
      }
      unint64_t v26 = (unint64_t)v25 | 0x8000000000000000;
    }
    else
    {
      unint64_t v26 = 0x80000001B38A19C0;
      uint64_t v24 = 0xD000000000000014;
      char v22 = v21;
      uint64_t v23 = v5;
    }
    v72[0] = v24;
    v72[1] = v26;
    (*(void (**)(uint64_t, void, uint64_t))(v7 + 104))(v11, *MEMORY[0x1E4F276A8], v23);
    sub_1B38538CC();
    sub_1B389BCE0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v11, v23);
    swift_bridgeObjectRelease();
    uint64_t v27 = sub_1B389BCA0();
    unint64_t v29 = v28;
    uint64_t v30 = *(void (**)(char *, uint64_t))(v14 + 8);
    uint64_t v70 = v14 + 8;
    v30(v18, v69);
    uint64_t v14 = v27;
    uint64_t v31 = (unsigned char *)swift_slowAlloc();
    *uint64_t v31 = 0;
    unsigned __int8 v32 = *v67;
    uint64_t v33 = (void *)sub_1B389C280();
    LODWORD(v32) = objc_msgSend(v32, sel_fileExistsAtPath_isDirectory_, v33, v31);

    int v34 = *v31;
    OUTLINED_FUNCTION_5();
    if (v32)
    {
      if (v34)
      {
        v66[0] = v30;
        sub_1B389C330();
        sub_1B389C330();
        swift_bridgeObjectRelease();
        int v35 = rootless_check_datavault_flag();
        swift_release();
        swift_release();
        if (v35)
        {
          if (qword_1E9CCEBE0 != -1) {
            swift_once();
          }
          uint64_t v36 = sub_1B389C1B0();
          OUTLINED_FUNCTION_5_4(v36, (uint64_t)qword_1E9CCF680);
          uint64_t v37 = sub_1B389C190();
          os_log_type_t v38 = sub_1B389C5B0();
          if (os_log_type_enabled(v37, v38))
          {
            uint64_t v39 = (_DWORD *)swift_slowAlloc();
            v72[0] = swift_slowAlloc();
            *uint64_t v39 = 136315138;
            swift_bridgeObjectRetain();
            uint64_t v40 = sub_1B3855F24(v14, v29, v72);
            OUTLINED_FUNCTION_3_8(v40);
            sub_1B389C6C0();
            swift_bridgeObjectRelease_n();
            OUTLINED_FUNCTION_8_3(&dword_1B3850000, v41, v42, "Found invalid datavault at %s");
            swift_arrayDestroy();
            OUTLINED_FUNCTION_5();
            OUTLINED_FUNCTION_5();
          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          uint64_t v30 = (void (*)(char *, uint64_t))v66[0];
          uint64_t v61 = OUTLINED_FUNCTION_4_9();
          uint64_t v58 = sub_1B3888F90(v61, v62, v63);
LABEL_33:
          uint64_t v14 = v58;
          uint64_t v65 = OUTLINED_FUNCTION_6_3();
          ((void (*)(uint64_t))v30)(v65);
          swift_bridgeObjectRelease();
          return v14;
        }
        ((void (*)(char *, uint64_t))v66[0])(v71, v69);
      }
      else
      {
        uint64_t v49 = v14;
        if (qword_1E9CCEBE0 != -1) {
          swift_once();
        }
        uint64_t v50 = sub_1B389C1B0();
        OUTLINED_FUNCTION_5_4(v50, (uint64_t)qword_1E9CCF680);
        uint64_t v51 = sub_1B389C190();
        os_log_type_t v52 = sub_1B389C5B0();
        uint64_t v14 = v52;
        if (os_log_type_enabled(v51, v52))
        {
          uint64_t v53 = (uint8_t *)swift_slowAlloc();
          v72[0] = swift_slowAlloc();
          v66[0] = v30;
          *(_DWORD *)uint64_t v53 = 136315138;
          swift_bridgeObjectRetain();
          uint64_t v54 = sub_1B3855F24(v49, v29, v72);
          OUTLINED_FUNCTION_3_8(v54);
          uint64_t v30 = (void (*)(char *, uint64_t))v66[0];
          sub_1B389C6C0();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_1B3850000, v51, (os_log_type_t)v14, "datavault path conflicts with file %s", v53, 0xCu);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_5();
          OUTLINED_FUNCTION_5();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        uint64_t v59 = v69;
        sub_1B388780C();
        swift_allocError();
        *(void *)uint64_t v60 = v49;
        *(void *)(v60 + 8) = v29;
        *(unsigned char *)(v60 + 16) = 0;
        swift_willThrow();
        v30(v71, v59);
      }
    }
    else
    {
      if (v22)
      {
        if (qword_1E9CCEBE0 != -1) {
          swift_once();
        }
        uint64_t v43 = sub_1B389C1B0();
        OUTLINED_FUNCTION_5_4(v43, (uint64_t)qword_1E9CCF680);
        uint64_t v44 = sub_1B389C190();
        os_log_type_t v45 = sub_1B389C5A0();
        if (os_log_type_enabled(v44, v45))
        {
          uint64_t v46 = (_DWORD *)swift_slowAlloc();
          v72[0] = swift_slowAlloc();
          *uint64_t v46 = 136315138;
          swift_bridgeObjectRetain();
          v72[3] = sub_1B3855F24(v14, v29, v72);
          sub_1B389C6C0();
          swift_bridgeObjectRelease_n();
          OUTLINED_FUNCTION_8_3(&dword_1B3850000, v47, v48, "Creating new datavault at %s");
          swift_arrayDestroy();
          OUTLINED_FUNCTION_5();
          OUTLINED_FUNCTION_5();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        uint64_t v55 = OUTLINED_FUNCTION_4_9();
        uint64_t v58 = sub_1B3888CAC(v55, v56, v57);
        goto LABEL_33;
      }
      v30(v71, v69);
    }
  }
  return v14;
}

uint64_t sub_1B3888054(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DataVaultPathProvider();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1B38880B4()
{
  unint64_t result = qword_1E9CCF3D0;
  if (!qword_1E9CCF3D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCF3D0);
  }
  return result;
}

unint64_t sub_1B3888104()
{
  unint64_t result = qword_1E9CCF3D8;
  if (!qword_1E9CCF3D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9CCF3E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCF3D8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for DataVaultStorageClass(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1B3888224);
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

ValueMetadata *type metadata accessor for DataVaultStorageClass()
{
  return &type metadata for DataVaultStorageClass;
}

uint64_t sub_1B3888260(uint64_t a1, uint64_t a2, char a3)
{
  if (!a3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for DataVaultPathError(uint64_t a1)
{
  return sub_1B3888284(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_1B3888284(uint64_t a1, uint64_t a2, char a3)
{
  if (!a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s20PegasusConfiguration18DataVaultPathErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_1B3888260(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for DataVaultPathError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_1B3888260(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_1B3888284(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for DataVaultPathError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_1B3888284(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for DataVaultPathError(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFD && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 252;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 3) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DataVaultPathError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 253;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1B3888408(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_1B3888420(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)uint64_t result = a2 - 3;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DataVaultPathError()
{
  return &type metadata for DataVaultPathError;
}

void **sub_1B3888448(void **a1, void **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    char v8 = (char *)a2 + v6;
    uint64_t v9 = sub_1B389BD00();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    uint64_t v11 = v4;
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t sub_1B3888528(id *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_1B389BD00();
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void **sub_1B38885A0(void **a1, void **a2, uint64_t a3)
{
  uint64_t v4 = *a2;
  *a1 = *a2;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_1B389BD00();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  id v10 = v4;
  v9(v6, v7, v8);
  return a1;
}

void **sub_1B3888634(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a1;
  *a1 = *a2;
  id v8 = v6;

  uint64_t v9 = *(int *)(a3 + 20);
  id v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_1B389BD00();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

void *sub_1B38886C4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_1B389BD00();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void **sub_1B3888740(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = *(int *)(a3 + 20);
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1B389BD00();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_1B38887CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B38887E0);
}

uint64_t sub_1B38887E0(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_1B389BD00();
    uint64_t v9 = (uint64_t)a1 + *(int *)(a3 + 20);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_1B3888868(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B388887C);
}

void *sub_1B388887C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1B389BD00();
    uint64_t v8 = (uint64_t)v5 + *(int *)(a4 + 20);
    return (void *)__swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t sub_1B38888FC()
{
  uint64_t result = sub_1B389BD00();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1B3888998()
{
  uint64_t v0 = sub_1B389BC30();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  int v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DataVaultPathProvider();
  if (qword_1E9CCEC18 != -1) {
    swift_once();
  }
  v5[0] = qword_1E9CCF3B8;
  v5[1] = unk_1E9CCF3C0;
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4F276A8], v0);
  sub_1B38538CC();
  swift_bridgeObjectRetain();
  sub_1B389BCE0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return swift_bridgeObjectRelease();
}

id sub_1B3888B1C()
{
  v14[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v1 = sub_1B389BCA0();
  uint64_t v3 = v2;
  uint64_t v4 = (unsigned char *)swift_slowAlloc();
  *uint64_t v4 = 0;
  uint64_t v5 = *v0;
  uint64_t v6 = (void *)sub_1B389C280();
  unsigned int v7 = objc_msgSend(v5, sel_fileExistsAtPath_isDirectory_, v6, v4);

  int v8 = *v4;
  MEMORY[0x1B3EBAF20](v4, -1, -1);
  if (v7)
  {
    if (v8) {
      return (id)swift_bridgeObjectRelease();
    }
    sub_1B388780C();
    swift_allocError();
    *(void *)uint64_t v12 = v1;
    *(void *)(v12 + 8) = v3;
    *(unsigned char *)(v12 + 16) = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v10 = (void *)sub_1B389BC50();
    v14[0] = 0;
    unsigned int v11 = objc_msgSend(v5, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v10, 1, 0, v14);

    if (v11) {
      return v14[0];
    }
    id v13 = v14[0];
    sub_1B389BC00();
  }
  return (id)swift_willThrow();
}

uint64_t sub_1B3888CAC(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  int v4 = *a3;
  sub_1B389C1D0();
  sub_1B389C1E0();
  sub_1B389C1F0();
  sub_1B389C330();
  sub_1B389C330();
  swift_bridgeObjectRelease();
  int v5 = rootless_mkdir_datavault();
  swift_release();
  swift_release();
  if (v5)
  {
    if (qword_1E9CCEBE0 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_1B389C1B0();
    __swift_project_value_buffer(v6, (uint64_t)qword_1E9CCF680);
    unsigned int v7 = sub_1B389C190();
    a1 = sub_1B389C5B0();
    if (os_log_type_enabled(v7, (os_log_type_t)a1))
    {
      int v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v17 = v9;
      *(_DWORD *)int v8 = 136315138;
      unint64_t v10 = 0xD000000000000017;
      unint64_t v11 = 0x80000001B38A19E0;
      if (v4 != 1)
      {
        unint64_t v10 = 0xD000000000000016;
        unint64_t v11 = 0x80000001B38A1A00;
      }
      if (v4) {
        uint64_t v12 = v10;
      }
      else {
        uint64_t v12 = 0xD000000000000014;
      }
      if (v4) {
        unint64_t v13 = v11;
      }
      else {
        unint64_t v13 = 0x80000001B38A19C0;
      }
      sub_1B3855F24(v12, v13, &v17);
      sub_1B389C6C0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B3850000, v7, (os_log_type_t)a1, "Creating datavault for %s failed", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B3EBAF20](v9, -1, -1);
      MEMORY[0x1B3EBAF20](v8, -1, -1);
    }

    uint64_t v14 = MEMORY[0x1B3EB9E90]();
    sub_1B388780C();
    swift_allocError();
    *(void *)uint64_t v15 = v14;
    *(void *)(v15 + 8) = 0;
    *(unsigned char *)(v15 + 16) = 2;
    swift_willThrow();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1B3888F90(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  int v3 = *a3;
  sub_1B389C330();
  sub_1B389C330();
  swift_bridgeObjectRelease();
  int v5 = rootless_convert_to_datavault();
  swift_release();
  swift_release();
  if (v5)
  {
    if (qword_1E9CCEBE0 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_1B389C1B0();
    __swift_project_value_buffer(v6, (uint64_t)qword_1E9CCF680);
    unsigned int v7 = sub_1B389C190();
    a1 = sub_1B389C5B0();
    if (os_log_type_enabled(v7, (os_log_type_t)a1))
    {
      int v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v17 = v9;
      *(_DWORD *)int v8 = 136315138;
      unint64_t v10 = 0xD000000000000017;
      unint64_t v11 = 0x80000001B38A19E0;
      if (v3 != 1)
      {
        unint64_t v10 = 0xD000000000000016;
        unint64_t v11 = 0x80000001B38A1A00;
      }
      if (v3) {
        uint64_t v12 = v10;
      }
      else {
        uint64_t v12 = 0xD000000000000014;
      }
      if (v3) {
        unint64_t v13 = v11;
      }
      else {
        unint64_t v13 = 0x80000001B38A19C0;
      }
      sub_1B3855F24(v12, v13, &v17);
      sub_1B389C6C0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B3850000, v7, (os_log_type_t)a1, "Converting datavault for %s failed", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B3EBAF20](v9, -1, -1);
      MEMORY[0x1B3EBAF20](v8, -1, -1);
    }

    uint64_t v14 = MEMORY[0x1B3EB9E90]();
    sub_1B388780C();
    swift_allocError();
    *(void *)uint64_t v15 = v14;
    *(void *)(v15 + 8) = 0;
    *(unsigned char *)(v15 + 16) = 1;
    swift_willThrow();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return a1;
}

void sub_1B3889244()
{
  qword_1E9CCF3B8 = 0x73746C756176;
  unk_1E9CCF3C0 = 0xE600000000000000;
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  return *(void *)(v0 - 104);
}

void OUTLINED_FUNCTION_8_3(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t sub_1B3889298()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FB6C0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B38A06E0;
  *(void *)(inited + 32) = 17473;
  *(void *)(inited + 40) = 0xE200000000000000;
  *(void *)(inited + 48) = 21569;
  *(void *)(inited + 56) = 0xE200000000000000;
  *(void *)(inited + 64) = 21825;
  *(void *)(inited + 72) = 0xE200000000000000;
  *(void *)(inited + 80) = 17730;
  *(void *)(inited + 88) = 0xE200000000000000;
  *(void *)(inited + 96) = 16707;
  *(void *)(inited + 104) = 0xE200000000000000;
  *(void *)(inited + 112) = 18499;
  *(void *)(inited + 120) = 0xE200000000000000;
  *(void *)(inited + 128) = 17732;
  *(void *)(inited + 136) = 0xE200000000000000;
  *(void *)(inited + 144) = 21317;
  *(void *)(inited + 152) = 0xE200000000000000;
  *(void *)(inited + 160) = 21062;
  *(void *)(inited + 168) = 0xE200000000000000;
  *(void *)(inited + 176) = 16967;
  *(void *)(inited + 184) = 0xE200000000000000;
  *(void *)(inited + 192) = 18247;
  *(void *)(inited + 200) = 0xE200000000000000;
  *(void *)(inited + 208) = 18759;
  *(void *)(inited + 216) = 0xE200000000000000;
  *(void *)(inited + 224) = 17737;
  *(void *)(inited + 232) = 0xE200000000000000;
  *(void *)(inited + 240) = 19785;
  *(void *)(inited + 248) = 0xE200000000000000;
  *(void *)(inited + 256) = 21577;
  *(void *)(inited + 264) = 0xE200000000000000;
  *(void *)(inited + 272) = 17738;
  *(void *)(inited + 280) = 0xE200000000000000;
  *(void *)(inited + 288) = 20554;
  *(void *)(inited + 296) = 0xE200000000000000;
  *(void *)(inited + 304) = 18764;
  *(void *)(inited + 312) = 0xE200000000000000;
  *(void *)(inited + 320) = 21836;
  *(void *)(inited + 328) = 0xE200000000000000;
  *(void *)(inited + 336) = 17229;
  *(void *)(inited + 344) = 0xE200000000000000;
  *(void *)(inited + 352) = 19534;
  *(void *)(inited + 360) = 0xE200000000000000;
  *(void *)(inited + 368) = 23118;
  *(void *)(inited + 376) = 0xE200000000000000;
  *(void *)(inited + 384) = 19795;
  *(void *)(inited + 392) = 0xE200000000000000;
  *(void *)(inited + 400) = 21333;
  *(void *)(inited + 408) = 0xE200000000000000;
  *(void *)(inited + 416) = 16726;
  *(void *)(inited + 424) = 0xE200000000000000;
  *(void *)(inited + 432) = 16730;
  *(void *)(inited + 440) = 0xE200000000000000;
  uint64_t result = sub_1B3896834(inited);
  qword_1E9CCF6A0 = result;
  return result;
}

uint64_t sub_1B38893BC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FB6C0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B38A06F0;
  *(void *)(inited + 32) = 17729;
  *(void *)(inited + 40) = 0xE200000000000000;
  *(void *)(inited + 48) = 19521;
  *(void *)(inited + 56) = 0xE200000000000000;
  *(void *)(inited + 64) = 16706;
  *(void *)(inited + 72) = 0xE200000000000000;
  *(void *)(inited + 80) = 18242;
  *(void *)(inited + 88) = 0xE200000000000000;
  *(void *)(inited + 96) = 21058;
  *(void *)(inited + 104) = 0xE200000000000000;
  *(void *)(inited + 112) = 19523;
  *(void *)(inited + 120) = 0xE200000000000000;
  *(void *)(inited + 128) = 23107;
  *(void *)(inited + 136) = 0xE200000000000000;
  *(void *)(inited + 144) = 19268;
  *(void *)(inited + 152) = 0xE200000000000000;
  *(void *)(inited + 160) = 21063;
  *(void *)(inited + 168) = 0xE200000000000000;
  *(void *)(inited + 176) = 18758;
  *(void *)(inited + 184) = 0xE200000000000000;
  *(void *)(inited + 192) = 19272;
  *(void *)(inited + 200) = 0xE200000000000000;
  *(void *)(inited + 208) = 21064;
  *(void *)(inited + 216) = 0xE200000000000000;
  *(void *)(inited + 224) = 21832;
  *(void *)(inited + 232) = 0xE200000000000000;
  *(void *)(inited + 240) = 17481;
  *(void *)(inited + 248) = 0xE200000000000000;
  *(void *)(inited + 256) = 19529;
  *(void *)(inited + 264) = 0xE200000000000000;
  *(void *)(inited + 272) = 20041;
  *(void *)(inited + 280) = 0xE200000000000000;
  *(void *)(inited + 288) = 21321;
  *(void *)(inited + 296) = 0xE200000000000000;
  *(void *)(inited + 304) = 21067;
  *(void *)(inited + 312) = 0xE200000000000000;
  *(void *)(inited + 320) = 16972;
  *(void *)(inited + 328) = 0xE200000000000000;
  *(void *)(inited + 336) = 17485;
  *(void *)(inited + 344) = 0xE200000000000000;
  *(void *)(inited + 352) = 17741;
  *(void *)(inited + 360) = 0xE200000000000000;
  *(void *)(inited + 368) = 19277;
  *(void *)(inited + 376) = 0xE200000000000000;
  *(void *)(inited + 384) = 21581;
  *(void *)(inited + 392) = 0xE200000000000000;
  *(void *)(inited + 400) = 22605;
  *(void *)(inited + 408) = 0xE200000000000000;
  *(void *)(inited + 416) = 22861;
  *(void *)(inited + 424) = 0xE200000000000000;
  *(void *)(inited + 432) = 20302;
  *(void *)(inited + 440) = 0xE200000000000000;
  *(void *)(inited + 448) = 18512;
  *(void *)(inited + 456) = 0xE200000000000000;
  *(void *)(inited + 464) = 19536;
  *(void *)(inited + 472) = 0xE200000000000000;
  *(void *)(inited + 480) = 21584;
  *(void *)(inited + 488) = 0xE200000000000000;
  *(void *)(inited + 496) = 20306;
  *(void *)(inited + 504) = 0xE200000000000000;
  *(void *)(inited + 512) = 21330;
  *(void *)(inited + 520) = 0xE200000000000000;
  *(void *)(inited + 528) = 16723;
  *(void *)(inited + 536) = 0xE200000000000000;
  *(void *)(inited + 544) = 18259;
  *(void *)(inited + 552) = 0xE200000000000000;
  *(void *)(inited + 560) = 17747;
  *(void *)(inited + 568) = 0xE200000000000000;
  *(void *)(inited + 576) = 18771;
  *(void *)(inited + 584) = 0xE200000000000000;
  *(void *)(inited + 592) = 19283;
  *(void *)(inited + 600) = 0xE200000000000000;
  *(void *)(inited + 608) = 18516;
  *(void *)(inited + 616) = 0xE200000000000000;
  *(void *)(inited + 624) = 21076;
  *(void *)(inited + 632) = 0xE200000000000000;
  *(void *)(inited + 640) = 22356;
  *(void *)(inited + 648) = 0xE200000000000000;
  *(void *)(inited + 656) = 20054;
  *(void *)(inited + 664) = 0xE200000000000000;
  uint64_t v1 = nullsub_1();
  if (sub_1B387B050(v1))
  {
    uint64_t result = sub_1B3896834(v1);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t result = MEMORY[0x1E4FBC870];
  }
  qword_1E9CCF6A8 = result;
  return result;
}

uint64_t sub_1B38895A0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FB6C0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B389F850;
  *(void *)(inited + 32) = 28261;
  *(void *)(inited + 40) = 0xE200000000000000;
  *(void *)(inited + 48) = 24938;
  *(void *)(inited + 56) = 0xE200000000000000;
  *(void *)(inited + 64) = 29286;
  *(void *)(inited + 72) = 0xE200000000000000;
  *(void *)(inited + 80) = 25956;
  *(void *)(inited + 88) = 0xE200000000000000;
  *(void *)(inited + 96) = 29801;
  *(void *)(inited + 104) = 0xE200000000000000;
  uint64_t result = sub_1B3896834(inited);
  qword_1E9CCF6B0 = result;
  return result;
}

double sub_1B3889614()
{
  long long v2 = xmmword_1B38A0700;
  unint64_t v3 = 0xE800000000000000;
  char v1 = 0;
  UserAgent.init(_:requestor:)((uint64_t *)&v2, &v1, (uint64_t)&v4);
  double result = *(double *)&v7;
  xmmword_1E9CCF6C0 = v4;
  qword_1E9CCF6D0 = v5;
  byte_1E9CCF6D8 = v6;
  xmmword_1E9CCF6E0 = v7;
  qword_1E9CCF6F0 = v8;
  unk_1E9CCF6F8 = v9;
  return result;
}

Swift::Bool __swiftcall ConfigurationManager.hashtagImagesEnabled()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA880);
  MEMORY[0x1F4188790](v1 - 8);
  unint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = sub_1B38755A4(5uLL);
  if (v4)
  {
    unsigned __int8 v5 = objc_msgSend(v4, sel_isEnabled);
    swift_unknownObjectRelease();
  }
  else
  {
    unsigned __int8 v5 = ConfigurationManager.isHashtagImagesEnabledByDefault()();
  }
  uint64_t v6 = sub_1B389C4F0();
  long long v9 = *(_OWORD *)(v0 + 16);
  __swift_storeEnumTagSinglePayload((uint64_t)v3, 1, 1, v6);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = 0;
  *(void *)(v7 + 24) = 0;
  *(_OWORD *)(v7 + 32) = v9;
  swift_unknownObjectRetain();
  sub_1B388A284((uint64_t)v3, (uint64_t)&unk_1E9CCF400, v7);
  swift_release();
  return v5 & 1;
}

Swift::Bool __swiftcall ConfigurationManager.isHashtagImagesEnabledByDefault()()
{
  uint64_t v1 = v0;
  if (qword_1EB7FAAD0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1B389C1B0();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EB7FC128);
  unint64_t v3 = sub_1B389C190();
  os_log_type_t v4 = sub_1B389C5A0();
  if (os_log_type_enabled(v3, v4))
  {
    unsigned __int8 v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unsigned __int8 v5 = 0;
    _os_log_impl(&dword_1B3850000, v3, v4, "Checking #images status with default table", v5, 2u);
    MEMORY[0x1B3EBAF20](v5, -1, -1);
  }

  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(void *__return_ptr, uint64_t))(*(void *)(v6 + 8) + 24))(v34, ObjectType);
  uint64_t v8 = v35;
  uint64_t v9 = v36;
  __swift_project_boxed_opaque_existential_1(v34, v35);
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 24))(v8, v9);
  if (!v11)
  {
    if (qword_1E9CCEBD8 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v2, (uint64_t)qword_1E9CCF668);
    char v21 = sub_1B389C190();
    os_log_type_t v22 = sub_1B389C5B0();
    if (!os_log_type_enabled(v21, v22)) {
      goto LABEL_36;
    }
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v23 = 0;
    uint64_t v24 = "Failed to get effective system language";
LABEL_25:
    _os_log_impl(&dword_1B3850000, v21, v22, v24, v23, 2u);
    uint64_t v25 = v23;
LABEL_35:
    MEMORY[0x1B3EBAF20](v25, -1, -1);
LABEL_36:

LABEL_37:
    Swift::Bool v20 = 0;
    goto LABEL_38;
  }
  uint64_t v12 = v10;
  unint64_t v13 = v11;
  uint64_t v14 = v35;
  uint64_t v15 = v36;
  __swift_project_boxed_opaque_existential_1(v34, v35);
  uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8))(v14, v15);
  if (!v17)
  {
    swift_bridgeObjectRelease();
    if (qword_1E9CCEBD8 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v2, (uint64_t)qword_1E9CCF668);
    char v21 = sub_1B389C190();
    os_log_type_t v22 = sub_1B389C5B0();
    if (!os_log_type_enabled(v21, v22)) {
      goto LABEL_36;
    }
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v23 = 0;
    uint64_t v24 = "Failed to get country code";
    goto LABEL_25;
  }
  uint64_t v18 = v16;
  unint64_t v19 = v17;
  if (qword_1E9CCEC20 != -1) {
    swift_once();
  }
  if ((sub_1B388A790(v18, v19, qword_1E9CCF6A0) & 1) == 0)
  {
    if (qword_1E9CCEC28 != -1) {
      swift_once();
    }
    if ((sub_1B388A790(v18, v19, qword_1E9CCF6A8) & 1) == 0)
    {
      swift_bridgeObjectRelease();
      if (qword_1E9CCEBD8 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v2, (uint64_t)qword_1E9CCF668);
      swift_bridgeObjectRetain();
      char v21 = sub_1B389C190();
      os_log_type_t v30 = sub_1B389C5A0();
      if (os_log_type_enabled(v21, v30))
      {
        uint64_t v27 = (uint8_t *)swift_slowAlloc();
        uint64_t v31 = swift_slowAlloc();
        uint64_t v33 = v31;
        *(_DWORD *)uint64_t v27 = 136315138;
        swift_bridgeObjectRetain();
        sub_1B3855F24(v18, v19, &v33);
        OUTLINED_FUNCTION_1_14();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1B3850000, v21, v30, "#images disabled in country: %s", v27, 0xCu);
        swift_arrayDestroy();
        uint64_t v29 = v31;
        goto LABEL_34;
      }
LABEL_39:

      swift_bridgeObjectRelease_n();
      goto LABEL_37;
    }
  }
  swift_bridgeObjectRelease();
  if (qword_1E9CCEC30 != -1) {
    swift_once();
  }
  if ((sub_1B388A790(v12, v13, qword_1E9CCF6B0) & 1) == 0)
  {
    if (qword_1E9CCEBD8 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v2, (uint64_t)qword_1E9CCF668);
    swift_bridgeObjectRetain();
    char v21 = sub_1B389C190();
    os_log_type_t v26 = sub_1B389C5A0();
    if (os_log_type_enabled(v21, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      uint64_t v33 = v28;
      *(_DWORD *)uint64_t v27 = 136315138;
      swift_bridgeObjectRetain();
      sub_1B3855F24(v12, v13, &v33);
      OUTLINED_FUNCTION_1_14();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1B3850000, v21, v26, "#images disabled for language: %s", v27, 0xCu);
      swift_arrayDestroy();
      uint64_t v29 = v28;
LABEL_34:
      MEMORY[0x1B3EBAF20](v29, -1, -1);
      uint64_t v25 = v27;
      goto LABEL_35;
    }
    goto LABEL_39;
  }
  swift_bridgeObjectRelease();
  Swift::Bool v20 = 1;
LABEL_38:
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v34);
  return v20;
}

uint64_t sub_1B3889DE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 80) = a4;
  return MEMORY[0x1F4188298](sub_1B3889E04, 0, 0);
}

uint64_t sub_1B3889E04()
{
  if (qword_1E9CCEC38 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_1E9CCF6D0;
  char v2 = byte_1E9CCF6D8;
  long long v3 = xmmword_1E9CCF6E0;
  *(void *)(v0 + 88) = qword_1E9CCF6D0;
  *(void *)(v0 + 96) = *((void *)&v3 + 1);
  uint64_t v4 = qword_1E9CCF6F0;
  uint64_t v5 = unk_1E9CCF6F8;
  *(void *)(v0 + 104) = unk_1E9CCF6F8;
  *(_OWORD *)(v0 + 16) = xmmword_1E9CCF6C0;
  *(void *)(v0 + 32) = v1;
  *(unsigned char *)(v0 + 40) = v2;
  *(_OWORD *)(v0 + 48) = v3;
  *(void *)(v0 + 64) = v4;
  *(void *)(v0 + 72) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_1B3889F24;
  return sub_1B385A270(v0 + 16);
}

uint64_t sub_1B3889F24()
{
  OUTLINED_FUNCTION_0();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_3();
  *long long v3 = v2;
  *(void *)(v4 + 120) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_1B388A0A4, 0, 0);
  }
  else
  {
    swift_unknownObjectRelease();
    uint64_t v5 = *(uint64_t (**)(void))(v2 + 8);
    return v5();
  }
}

uint64_t sub_1B388A0A4()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B388A0BC()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1B388A0FC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1B388A1BC;
  return sub_1B3889DE4(a1, v4, v5, v6);
}

uint64_t sub_1B388A1BC()
{
  OUTLINED_FUNCTION_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3();
  void *v2 = v1;
  swift_task_dealloc();
  long long v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_1B388A284(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1B389C4F0();
  if (__swift_getEnumTagSinglePayload(a1, 1, v5) == 1)
  {
    sub_1B387E250(a1);
  }
  else
  {
    sub_1B389C4E0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1B389C4A0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t ConfigurationManager.fetchHashtagImagesEnabled()()
{
  *(void *)(v1 + 80) = v0;
  return MEMORY[0x1F4188298](sub_1B388A3E4, 0, 0);
}

uint64_t sub_1B388A3E4()
{
  id v1 = sub_1B38755A4(5uLL);
  if (v1)
  {
    id v2 = objc_msgSend(v1, sel_isEnabled);
    swift_unknownObjectRelease();
    long long v3 = *(uint64_t (**)(id))(v0 + 8);
    return v3(v2);
  }
  else
  {
    if (qword_1E9CCEC38 != -1) {
      swift_once();
    }
    uint64_t v5 = qword_1E9CCF6D0;
    char v6 = byte_1E9CCF6D8;
    long long v7 = xmmword_1E9CCF6E0;
    *(void *)(v0 + 88) = qword_1E9CCF6D0;
    *(void *)(v0 + 96) = *((void *)&v7 + 1);
    uint64_t v8 = qword_1E9CCF6F0;
    uint64_t v9 = unk_1E9CCF6F8;
    *(void *)(v0 + 104) = unk_1E9CCF6F8;
    *(_OWORD *)(v0 + 16) = xmmword_1E9CCF6C0;
    *(void *)(v0 + 32) = v5;
    *(unsigned char *)(v0 + 40) = v6;
    *(_OWORD *)(v0 + 48) = v7;
    *(void *)(v0 + 64) = v8;
    *(void *)(v0 + 72) = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v10 = (void *)swift_task_alloc();
    *(void *)(v0 + 112) = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_1B388A578;
    return sub_1B385A270(v0 + 16);
  }
}

uint64_t sub_1B388A578(uint64_t a1)
{
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  uint64_t v6 = *v2;
  OUTLINED_FUNCTION_3();
  *long long v7 = v6;
  swift_task_dealloc();
  if (v1)
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v8 = sub_1B388A72C;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)(v5 + 120) = a1;
    uint64_t v8 = sub_1B388A6B0;
  }
  return MEMORY[0x1F4188298](v8, 0, 0);
}

uint64_t sub_1B388A6B0()
{
  id v1 = objc_msgSend(*(id *)(v0 + 120), sel_isEnabled);
  swift_unknownObjectRelease();
  id v2 = *(uint64_t (**)(id))(v0 + 8);
  return v2(v1);
}

uint64_t sub_1B388A72C()
{
  Swift::Bool v1 = ConfigurationManager.isHashtagImagesEnabledByDefault()();
  id v2 = *(uint64_t (**)(BOOL))(v0 + 8);
  BOOL v3 = v1;
  return v2(v3);
}

uint64_t sub_1B388A790(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_1B389CA10();
    sub_1B389C370();
    uint64_t v6 = sub_1B389CA40();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_1B389C920() & 1) != 0) {
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
          if (v17 || (sub_1B389C920() & 1) != 0) {
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

uint64_t sub_1B388A8C8()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1B388A968()
{
  return sub_1B389CA40();
}

uint64_t sub_1B388A9AC(uint64_t a1)
{
  return sub_1B3855510(0, a1, (void (*)(uint64_t))PegasusClientName.rawValue.getter);
}

uint64_t sub_1B388A9E0()
{
  return sub_1B389CA40();
}

uint64_t sub_1B388AA24()
{
  return sub_1B388AA5C();
}

uint64_t sub_1B388AA40()
{
  return sub_1B388AA5C();
}

uint64_t sub_1B388AA5C()
{
  return sub_1B389CA40();
}

uint64_t sub_1B388AAA4()
{
  return sub_1B389CA40();
}

uint64_t sub_1B388AAE4()
{
  return sub_1B389CA40();
}

uint64_t sub_1B388AB3C(uint64_t a1)
{
  return sub_1B3855510(0, a1, (void (*)(uint64_t))FeedbackStreamDescriptor.rawValue.getter);
}

uint64_t sub_1B388AB70()
{
  return sub_1B388AF70();
}

uint64_t sub_1B388AB7C()
{
  return sub_1B389CA40();
}

uint64_t sub_1B388ABBC()
{
  return sub_1B389C370();
}

uint64_t sub_1B388ABD8()
{
  return sub_1B389C370();
}

uint64_t sub_1B388ABF4()
{
  sub_1B389C370();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1B388ACBC(uint64_t a1, uint64_t a2)
{
  return sub_1B388AE10(a1, a2, (void (*)(void))FeedbackStreamDescriptor.rawValue.getter);
}

uint64_t sub_1B388ACD4()
{
  return sub_1B389CA20();
}

uint64_t sub_1B388AD08()
{
  return sub_1B389CA20();
}

uint64_t sub_1B388AD3C()
{
  sub_1B389C370();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1B388ADD0()
{
  return sub_1B389CA20();
}

uint64_t sub_1B388ADF8(uint64_t a1, uint64_t a2)
{
  return sub_1B388AE10(a1, a2, (void (*)(void))PegasusClientName.rawValue.getter);
}

uint64_t sub_1B388AE10(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  sub_1B389C370();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1B388AE74(uint64_t a1, uint64_t a2)
{
  return sub_1B3855510(a1, a2, (void (*)(uint64_t))PegasusClientName.rawValue.getter);
}

uint64_t sub_1B388AE8C()
{
  return sub_1B389CA40();
}

uint64_t sub_1B388AED0()
{
  return sub_1B389CA40();
}

uint64_t sub_1B388AF14()
{
  return sub_1B389CA40();
}

uint64_t sub_1B388AF70()
{
  return sub_1B389CA40();
}

uint64_t sub_1B388B018()
{
  return sub_1B389CA40();
}

uint64_t sub_1B388B060()
{
  return sub_1B389CA40();
}

uint64_t sub_1B388B0A8()
{
  return sub_1B389CA40();
}

uint64_t sub_1B388B0EC()
{
  return sub_1B388B124();
}

uint64_t sub_1B388B108()
{
  return sub_1B388B124();
}

uint64_t sub_1B388B124()
{
  return sub_1B389CA40();
}

uint64_t sub_1B388B174(uint64_t a1)
{
  OUTLINED_FUNCTION_4_5();
  uint64_t v4 = *(os_unfair_lock_s **)(*(void *)(v1 + *(void *)(v3 + 152)) + 16);
  swift_retain();
  os_unfair_lock_lock(v4);
  *(void *)(v1 + 48) = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v4);

  return swift_release();
}

BOOL sub_1B388B200()
{
  char v1 = *(unsigned char *)(v0 + 80);
  v9[3] = &type metadata for ResourceNetworkActivity;
  v9[4] = &off_1F0C12580;
  LOBYTE(v9[0]) = v1;
  uint64_t v2 = *(char *)__swift_project_boxed_opaque_existential_1(v9, (uint64_t)&type metadata for ResourceNetworkActivity);
  if (qword_1E9CCEB80 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    uint64_t v3 = *(void *)(qword_1E9CCF648 + 16);
    if (!v3) {
      break;
    }
    uint64_t v4 = 0;
    while (1)
    {
      uint64_t v5 = v4 + 1;
      if (__OFADD__(v4, 1)) {
        break;
      }
      if (qword_1B38A0CE8[*(char *)(qword_1E9CCF648 + 32 + v4)] == qword_1B38A0CE8[v2])
      {
        int v6 = *(unsigned __int8 *)(qword_1E9CCF648 + 32 + v4);
        goto LABEL_9;
      }
      ++v4;
      if (v5 == v3) {
        goto LABEL_7;
      }
    }
    __break(1u);
LABEL_11:
    swift_once();
  }
LABEL_7:
  int v6 = 45;
LABEL_9:
  BOOL v7 = v6 == 45;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v9);
  return v7;
}

BOOL sub_1B388B2E8()
{
  char v1 = *(unsigned char *)(v0 + 80);
  v9[3] = &type metadata for ResourceAccessActivity;
  v9[4] = &off_1F0C123D8;
  LOBYTE(v9[0]) = v1;
  uint64_t v2 = *(char *)__swift_project_boxed_opaque_existential_1(v9, (uint64_t)&type metadata for ResourceAccessActivity);
  if (qword_1E9CCEC08 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    uint64_t v3 = *(void *)(qword_1E9CCF698 + 16);
    if (!v3) {
      break;
    }
    uint64_t v4 = 0;
    while (1)
    {
      uint64_t v5 = v4 + 1;
      if (__OFADD__(v4, 1)) {
        break;
      }
      if (qword_1B38A0CE8[*(char *)(qword_1E9CCF698 + 32 + v4)] == qword_1B38A0CE8[v2])
      {
        int v6 = *(unsigned __int8 *)(qword_1E9CCF698 + 32 + v4);
        goto LABEL_9;
      }
      ++v4;
      if (v5 == v3) {
        goto LABEL_7;
      }
    }
    __break(1u);
LABEL_11:
    swift_once();
  }
LABEL_7:
  int v6 = 45;
LABEL_9:
  BOOL v7 = v6 == 45;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v9);
  return v7;
}

uint64_t sub_1B388B3D0()
{
  uint64_t v1 = sub_1B389BE20();
  OUTLINED_FUNCTION_3_0();
  uint64_t v3 = v2;
  MEMORY[0x1F4188790]();
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_4_5();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v0 + *(void *)(v6 + 144), v1);
  sub_1B389BDB0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v1);
}

uint64_t sub_1B388B4DC()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FA850);
  uint64_t v3 = MEMORY[0x1F4188790](v2 - 8);
  uint64_t v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  BOOL v7 = (char *)&v38 - v6;
  uint64_t v9 = v0 + 24;
  uint64_t v8 = *(void *)(v0 + 24);
  uint64_t v39 = *(void *)(v0 + 32);
  uint64_t v40 = v8;
  char v10 = *(unsigned char *)(v0 + 40);
  char v11 = *(unsigned char *)(v0 + 41);
  unint64_t v13 = (void *)(v0 + 48);
  uint64_t v12 = *(void *)(v0 + 48);
  uint64_t v14 = *(void *)(v1 + 56);
  uint64_t v15 = *(void *)(v1 + 64);
  uint64_t v41 = *(void *)(v1 + 72);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v42 = v15;
  swift_bridgeObjectRetain();
  uint64_t v43 = v12;
  sub_1B388C528(v12);
  char v16 = *(unsigned char *)(v1 + 80);
  uint64_t v17 = v1 + *(void *)(*(void *)v1 + 136);
  if ((v11 & 1) == 0 && v14)
  {
    swift_beginAccess();
    sub_1B38570D0(v17, (uint64_t)v7);
    uint64_t v18 = sub_1B389C110();
    uint64_t result = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v18);
    if (result != 1)
    {
      uint64_t v20 = *(void *)(v1 + 88);
      swift_bridgeObjectRetain();
      uint64_t v21 = sub_1B389C5E0();
      os_log_type_t v22 = sub_1B388BD98(v16);
      LOBYTE(v37) = v10;
      sub_1B38587B8(v21, v20, (uint64_t)v22, v23, 2, (uint64_t)v7, v40, v39, v37, v14);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(*(void *)(v18 - 8) + 8))(v7, v18);
      goto LABEL_7;
    }
LABEL_15:
    __break(1u);
    return result;
  }
  swift_beginAccess();
  sub_1B38570D0(v17, (uint64_t)v5);
  uint64_t v24 = sub_1B389C110();
  uint64_t result = __swift_getEnumTagSinglePayload((uint64_t)v5, 1, v24);
  if (result == 1)
  {
    __break(1u);
    goto LABEL_15;
  }
  sub_1B389C5E0();
  sub_1B388BD98(v16);
  sub_1B389C0D0();
  (*(void (**)(char *, uint64_t))(*(void *)(v24 - 8) + 8))(v5, v24);
LABEL_7:
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v26 = Strong;
    uint64_t v44 = v1;
    swift_retain();
    uint64_t v27 = sub_1B389C300();
    uint64_t v29 = v28;
    os_log_type_t v30 = *(os_unfair_lock_s **)(*(void *)(v26 + 32) + 16);
    os_unfair_lock_lock(v30);
    sub_1B3857138(v26, v27, v29, v1, (uint64_t)&off_1F0C11C18);
    os_unfair_lock_unlock(v30);
    swift_bridgeObjectRelease();
    if (MEMORY[0x1B3EBAFF0](v26 + 16))
    {
      uint64_t v31 = *(void *)(v26 + 24);
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v40 = v14;
      uint64_t v33 = v9;
      int v34 = v13;
      uint64_t v35 = *(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v31 + 16);
      uint64_t v36 = swift_retain();
      v35(v36, &off_1F0C11C18, ObjectType, v31);
      unint64_t v13 = v34;
      uint64_t v9 = v33;
      swift_release_n();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_release();
    }
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    *(void *)uint64_t v9 = 0;
    *(void *)(v9 + 8) = 0;
    *(unsigned char *)(v9 + 16) = 0;
    *(unsigned char *)(v1 + 41) = 1;
    *unint64_t v13 = 0;
    v13[1] = 0;
    *(void *)(v1 + 64) = MEMORY[0x1E4FBC860];
    *(void *)(v1 + 72) = 0;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    *(unsigned char *)(v1 + 81) = 1;
    return swift_weakAssign();
  }
  else
  {
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1B388B91C()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FA850);
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_7_5();
  MEMORY[0x1F4188790]();
  OUTLINED_FUNCTION_0_11();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B388C728(v0);
  uint64_t v6 = v0 + *(void *)(*(void *)v0 + 136);
  if ((v3 & 1) == 0 && v1)
  {
    OUTLINED_FUNCTION_2_9();
    sub_1B38570D0(v6, v4);
    uint64_t v7 = sub_1B389C110();
    uint64_t result = __swift_getEnumTagSinglePayload(v4, 1, v7);
    if (result != 1)
    {
      uint64_t v9 = *(void (**)(void))(v0 + 88);
      swift_bridgeObjectRetain();
      sub_1B389C5E0();
      char v10 = OUTLINED_FUNCTION_11_2();
      OUTLINED_FUNCTION_1_15((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17, v26, v27);
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_17();
      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v4, v7);
      goto LABEL_7;
    }
LABEL_17:
    __break(1u);
    return result;
  }
  OUTLINED_FUNCTION_2_9();
  sub_1B38570D0(v6, v5);
  uint64_t v2 = sub_1B389C110();
  uint64_t result = __swift_getEnumTagSinglePayload(v5, 1, v2);
  if (result == 1)
  {
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v9 = *(void (**)(void))(v0 + 88);
  sub_1B389C5E0();
  OUTLINED_FUNCTION_11_2();
  sub_1B389C0D0();
  OUTLINED_FUNCTION_17();
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v5, v2);
LABEL_7:
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v21 = Strong;
    swift_retain();
    sub_1B389C300();
    OUTLINED_FUNCTION_10_2();
    OUTLINED_FUNCTION_16_1(v22, v23, v24, v25, (uint64_t)&off_1F0C11C18);
    os_unfair_lock_unlock(v3);
    swift_bridgeObjectRelease();
    if (MEMORY[0x1B3EBAFF0](v21 + 16))
    {
      uint64_t v2 = *(void *)(v21 + 24);
      swift_getObjectType();
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_12_1();
      v9();
      swift_release_n();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_release();
    }
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    OUTLINED_FUNCTION_5_5();
    *(void *)(v0 + 64) = MEMORY[0x1E4FBC860];
    *(void *)(v0 + 72) = 0;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    *(unsigned char *)(v0 + 81) = v2;
    return swift_weakAssign();
  }
  else
  {
    if (sub_1B388B200())
    {
      sub_1B389C5C0();
      sub_1B389C0B0();
    }
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1B388BC74()
{
  return sub_1B389CA40();
}

uint64_t sub_1B388BCB4()
{
  return sub_1B388BC74();
}

uint64_t sub_1B388BCBC()
{
  if (qword_1E9CCEAE0 != -1) {
    swift_once();
  }
  qword_1EB7FC088 = qword_1E9CCF5C0;
  unk_1EB7FC090 = *(void *)algn_1E9CCF5C8;

  return swift_bridgeObjectRetain();
}

uint64_t *sub_1B388BD28()
{
  if (qword_1EB7FA400 != -1) {
    swift_once();
  }
  return &qword_1EB7FC088;
}

uint64_t sub_1B388BD74()
{
  return 0x656372756F736572;
}

const char *sub_1B388BD98(char a1)
{
  uint64_t result = "unknown";
  switch(a1)
  {
    case 1:
      uint64_t result = "parsecSession";
      break;
    case 2:
      uint64_t result = "parsecFeedbackEvent";
      break;
    case 3:
      uint64_t result = "customFeedback";
      break;
    case 4:
      uint64_t result = "batchedInstrumentation";
      break;
    case 5:
      uint64_t result = "fileInstrumentation";
      break;
    case 6:
      uint64_t result = "pegasusConfiguration";
      break;
    case 7:
      uint64_t result = "bagResource";
      break;
    case 8:
      uint64_t result = "bag";
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_1B388BE70(unint64_t result)
{
  if (result >= 9) {
    return 9;
  }
  return result;
}

uint64_t sub_1B388BE80(uint64_t result)
{
  return result;
}

uint64_t sub_1B388BE88()
{
  return sub_1B388AED0();
}

unint64_t sub_1B388BE90@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_1B388BE70(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1B388BEBC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1B388BE80(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_1B388BEE8()
{
  uint64_t v0 = qword_1EB7FA948;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_1B388BF20()
{
  sub_1B388BD28();
  uint64_t v0 = qword_1EB7FC088;
  swift_bridgeObjectRetain();
  return v0;
}

const char *sub_1B388BF5C()
{
  return sub_1B388BD98(*v0);
}

uint64_t sub_1B388BF80(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA918);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B389D500;
  *(void *)(inited + 32) = 0x7365747962;
  *(void *)(inited + 40) = 0xE500000000000000;
  *(void *)(inited + 48) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, a1);
  sub_1B3881E1C();
  return sub_1B389C230();
}

uint64_t sub_1B388C024()
{
  return sub_1B388BF80(*v0);
}

uint64_t sub_1B388C02C()
{
  return *(void *)v0;
}

uint64_t sub_1B388C034()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  uint64_t v3 = *(void *)(v2 + 448);
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = v4;
  uint64_t result = MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v23 - v8;
  if ((v1[81] & 1) == 0)
  {
    char v10 = &v1[*(void *)(v2 + 472)];
    uint64_t v24 = *(void (**)(char *, unsigned char *, uint64_t))(v5 + 16);
    v24(v9, v10, v3);
    uint64_t v11 = OUTLINED_FUNCTION_15_1();
    uint64_t v13 = v12(v11);
    uint64_t v14 = *(void (**)(uint64_t))(v5 + 8);
    uint64_t v15 = OUTLINED_FUNCTION_14_0();
    v14(v15);
    sub_1B388B174(v13);
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA930);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_1B389D500;
    v24(v9, v10, v3);
    uint64_t v17 = OUTLINED_FUNCTION_15_1();
    uint64_t v19 = v18(v17);
    uint64_t v20 = OUTLINED_FUNCTION_14_0();
    v14(v20);
    uint64_t v21 = MEMORY[0x1E4FBB5C8];
    *(void *)(v16 + 56) = MEMORY[0x1E4FBB550];
    *(void *)(v16 + 64) = v21;
    *(void *)(v16 + 32) = v19;
    sub_1B3856BB0((uint64_t)"bytesWritten=%{signpost.description:attribute,public}llu", 56, 2, v16);
    swift_bridgeObjectRelease();
    uint64_t v22 = *(os_unfair_lock_s **)(*(void *)&v1[*(void *)(*(void *)v1 + 152)] + 16);
    swift_retain();
    os_unfair_lock_lock(v22);
    if ((v1[81] & 1) == 0) {
      sub_1B388B4DC();
    }
    os_unfair_lock_unlock(v22);
    return swift_release();
  }
  return result;
}

uint64_t sub_1B388C25C()
{
  uint64_t v1 = *v0;

  OUTLINED_FUNCTION_4_5();
  uint64_t v3 = (char *)v0 + *(void *)(v2 + 472);
  uint64_t v4 = *(uint64_t (**)(char *))(*(void *)(*(void *)(v1 + 448) - 8) + 8);

  return v4(v3);
}

uint64_t sub_1B388C2E8()
{
  if ((*(unsigned char *)(v0 + 81) & 1) == 0) {
    sub_1B388C034();
  }
  uint64_t v1 = sub_1B3852F4C();

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_17();
  (*(void (**)(void))(v2 + 8))();
  return v1;
}

uint64_t sub_1B388C390()
{
  uint64_t v0 = sub_1B388C2E8();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t type metadata accessor for DiskWriteSpan()
{
  return __swift_instantiateGenericMetadata();
}

void type metadata accessor for DiskWriteActivity()
{
}

unint64_t sub_1B388C410(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1B388C440();
  unint64_t result = sub_1B388C48C();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_1B388C440()
{
  unint64_t result = qword_1EB7FA710;
  if (!qword_1EB7FA710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB7FA710);
  }
  return result;
}

unint64_t sub_1B388C48C()
{
  unint64_t result = qword_1EB7FA720;
  if (!qword_1EB7FA720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB7FA720);
  }
  return result;
}

unint64_t sub_1B388C4DC()
{
  unint64_t result = qword_1EB7FA718;
  if (!qword_1EB7FA718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB7FA718);
  }
  return result;
}

void sub_1B388C528(uint64_t a1)
{
  if (sub_1B388C91C(a1))
  {
    sub_1B389C5A0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA930);
    uint64_t v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_1B389D510;
    if (qword_1EB7FA400 != -1) {
      swift_once();
    }
    uint64_t v2 = qword_1EB7FC088;
    uint64_t v3 = unk_1EB7FC090;
    uint64_t v4 = MEMORY[0x1E4FBB1A0];
    *(void *)(v1 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v5 = sub_1B38579B4();
    *(void *)(v1 + 64) = v5;
    *(void *)(v1 + 32) = v2;
    *(void *)(v1 + 40) = v3;
    sub_1B3881E1C();
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_1B389C220();
    *(void *)(v1 + 96) = v4;
    *(void *)(v1 + 104) = v5;
    *(void *)(v1 + 72) = v6;
    *(void *)(v1 + 80) = v7;
    sub_1B389C0B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B386EFA8();
    uint64_t v8 = (void *)sub_1B389C280();
    swift_bridgeObjectRelease();
    id v9 = (id)sub_1B389C200();
    AnalyticsSendEvent();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

void sub_1B388C728(uint64_t a1)
{
  if (sub_1B388CA78(a1))
  {
    sub_1B389C5A0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA930);
    uint64_t v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_1B389D510;
    if (qword_1EB7FA408 != -1) {
      swift_once();
    }
    uint64_t v2 = qword_1EB7FC078;
    uint64_t v3 = unk_1EB7FC080;
    uint64_t v4 = MEMORY[0x1E4FBB1A0];
    *(void *)(v1 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v5 = sub_1B38579B4();
    *(void *)(v1 + 64) = v5;
    *(void *)(v1 + 32) = v2;
    *(void *)(v1 + 40) = v3;
    sub_1B3881E1C();
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_1B389C220();
    *(void *)(v1 + 96) = v4;
    *(void *)(v1 + 104) = v5;
    *(void *)(v1 + 72) = v6;
    *(void *)(v1 + 80) = v7;
    sub_1B389C0B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1B386EFA8();
    uint64_t v8 = (void *)sub_1B389C280();
    swift_bridgeObjectRelease();
    id v9 = (id)sub_1B389C200();
    AnalyticsSendEvent();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1B388C91C(uint64_t a1)
{
  uint64_t v2 = dynamic_cast_existential_1_unconditional((uint64_t)&unk_1F0C11ED8);
  if (!a1) {
    return 0;
  }
  uint64_t v4 = v2;
  uint64_t v5 = v3;
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 16);
  swift_bridgeObjectRetain();
  uint64_t v7 = v6(v4, v5);
  uint64_t v9 = v8;
  uint64_t v10 = sub_1B389C6B0();
  swift_isUniquelyReferenced_nonNull_native();
  sub_1B38737F4(v10, v7, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  uint64_t v13 = v12;
  sub_1B388B3D0();
  uint64_t v14 = sub_1B389C540();
  swift_isUniquelyReferenced_nonNull_native();
  sub_1B38737F4(v14, v11, v13);
  uint64_t v15 = a1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_1B388CA78(uint64_t a1)
{
  uint64_t v2 = dynamic_cast_existential_1_unconditional((uint64_t)&type metadata for ResourceNetworkActivity);
  if (!a1) {
    return 0;
  }
  uint64_t v4 = v2;
  uint64_t v5 = v3;
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 16);
  swift_bridgeObjectRetain();
  uint64_t v7 = v6(v4, v5);
  uint64_t v9 = v8;
  uint64_t v10 = sub_1B389C6B0();
  swift_isUniquelyReferenced_nonNull_native();
  sub_1B38737F4(v10, v7, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  uint64_t v13 = v12;
  sub_1B388B3D0();
  uint64_t v14 = sub_1B389C540();
  swift_isUniquelyReferenced_nonNull_native();
  sub_1B38737F4(v14, v11, v13);
  uint64_t v15 = a1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_1B388CBDC(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF8)
  {
    if (a2 + 8 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 8) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 9;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v5 = v6 - 9;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_1B388CC64(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *unint64_t result = a2 + 8;
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
        JUMPOUT(0x1B388CD30);
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
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

void type metadata accessor for DiskWriteError()
{
}

void type metadata accessor for BasicDiskOperationMetrics()
{
}

unint64_t sub_1B388CD74()
{
  unint64_t result = qword_1E9CCF410;
  if (!qword_1E9CCF410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCF410);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_8_4()
{
  return sub_1B389CA20();
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return v0;
}

uint64_t Client.init(_:)@<X0>(unint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  if (a1 >= 0x1B)
  {
    uint64_t result = sub_1B389C970();
    __break(1u);
  }
  else
  {
    uint64_t result = PegasusClientName.rawValue.getter();
    *a2 = a1;
    a2[1] = result;
    a2[2] = v5;
  }
  return result;
}

void sub_1B388CE80()
{
  qword_1EB7FBDA0 = 0x6E776F6E6B6E55;
  *(void *)algn_1EB7FBDA8 = 0xE700000000000000;
}

uint64_t static Client.unknownClientName.getter()
{
  if (qword_1EB7FB6C8 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_1EB7FBDA0;
  swift_bridgeObjectRetain();
  return v0;
}

double sub_1B388CF0C()
{
  *(void *)&double result = 7;
  xmmword_1EB7FA980 = xmmword_1B389F480;
  qword_1EB7FA990 = 0xE700000000000000;
  return result;
}

double sub_1B388CF2C()
{
  *(void *)&double result = 16;
  xmmword_1EB7FBDB0 = xmmword_1B38A0E50;
  qword_1EB7FBDC0 = 0xEA00000000007469;
  return result;
}

uint64_t static Client.pegasuskit.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1B385D518(&qword_1EB7FBDD8, &qword_1EB7FBDC0, &xmmword_1EB7FBDB0, a1);
}

double sub_1B388CF78()
{
  double result = 0.0;
  xmmword_1EB7FA410 = xmmword_1B389F490;
  qword_1EB7FA420 = 0xE700000000000000;
  return result;
}

uint64_t static Client.unknown.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1B385D518(&qword_1EB7FA380, &qword_1EB7FA420, &xmmword_1EB7FA410, a1);
}

double Client.init(_:)@<D0>(unsigned char *a1@<X0>, uint64_t a2@<X8>)
{
  LOBYTE(v6) = *a1;
  PegasusClientName.rawValue.getter();
  Client.init(_:)(v3, (uint64_t *)&v6);
  uint64_t v4 = v7;
  double result = *(double *)&v6;
  *(_OWORD *)a2 = v6;
  *(void *)(a2 + 16) = v4;
  return result;
}

unint64_t ClientType.init(rawValue:)(unint64_t result)
{
  if (result > 0x1A) {
    return 0;
  }
  return result;
}

BOOL sub_1B388D020(uint64_t *a1, uint64_t *a2)
{
  return sub_1B387456C(*a1, *a2);
}

uint64_t sub_1B388D02C()
{
  return sub_1B388AB7C();
}

uint64_t sub_1B388D034()
{
  return sub_1B388ADD0();
}

uint64_t sub_1B388D03C()
{
  return sub_1B388AE8C();
}

unint64_t sub_1B388D044@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = ClientType.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_1B388D078(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_1B388D084(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    unint64_t result = (void *)sub_1B389C890();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_1B388D15C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1B388D1F4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_1B388D3D0(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_1B388D3D0((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1B388D1F4(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_1B389C3E0();
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
  unint64_t v3 = sub_1B388D368(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_1B389C7C0();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_1B389C890();
  __break(1u);
LABEL_14:
  uint64_t result = sub_1B389C850();
  __break(1u);
  return result;
}

void *sub_1B388D368(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FA920);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  _OWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_1B388D3D0(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FA920);
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
    sub_1B388D580(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1B388D4A8(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_1B388D4A8(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1B389C890();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_1B388D580(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_1B389C890();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_1B388D614()
{
  unint64_t result = qword_1E9CCF418;
  if (!qword_1E9CCF418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCF418);
  }
  return result;
}

void *assignWithCopy for Client(void *a1, void *a2)
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

uint64_t assignWithTake for Client(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Client(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Client(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ClientType()
{
  return &type metadata for ClientType;
}

uint64_t SessionType.hashValue.getter()
{
  return sub_1B389CA40();
}

unint64_t SessionType.serverExperimentNamespace.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  if (v1 == 12) {
    return 0xD00000000000001FLL;
  }
  unint64_t v2 = 0xD000000000000010;
  unint64_t v3 = 0xD000000000000012;
  if (v1 != 1) {
    unint64_t v3 = 0;
  }
  if (v1 != 6) {
    unint64_t v2 = v3;
  }
  if (v1 == 2) {
    return 0xD000000000000015;
  }
  else {
    return v2;
  }
}

unint64_t SessionType.deviceExperimentNamespace.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  unint64_t v2 = 0xD000000000000012;
  uint64_t v3 = 0x4847494C544F5053;
  if (v1 != 2) {
    uint64_t v3 = 0;
  }
  if (v1 != 11) {
    unint64_t v2 = v3;
  }
  if (v1 == 1) {
    return 0xD000000000000015;
  }
  else {
    return v2;
  }
}

unint64_t SessionType.canonicalIdentifier.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  if ((unint64_t)(v2 - 1) >= 0x10)
  {
    if (v2)
    {
      swift_bridgeObjectRetain();
      return v1;
    }
    return 0x6E776F6E6B6E753CLL;
  }
  SessionType.biomeStreamDescriptor.getter(&v4);
  if (v4 == 17) {
    return 0x6E776F6E6B6E753CLL;
  }
  return FeedbackStreamDescriptor.rawValue.getter();
}

BOOL SessionType.donationToBiomeIsImplemented.getter()
{
  SessionType.biomeStreamDescriptor.getter(&v1);
  return v1 != 17;
}

char *SessionType.allStreamDescriptors.getter()
{
  SessionType.biomeStreamDescriptor.getter(&v6);
  char v0 = v6;
  if (v6 == 17) {
    return (char *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FAB50);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1B389D500;
  *(unsigned char *)(v2 + 32) = v0;
  swift_bridgeObjectRetain();
  char v1 = (char *)v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    char v1 = sub_1B388E638(0, 2, 1, v2);
  }
  unint64_t v4 = *((void *)v1 + 2);
  unint64_t v3 = *((void *)v1 + 3);
  if (v4 >= v3 >> 1) {
    char v1 = sub_1B388E638((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v1);
  }
  *((void *)v1 + 2) = v4 + 1;
  v1[v4 + 32] = 0;
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t Collection<>.biomeStreamDescriptors.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCF338);
  sub_1B388F63C();
  uint64_t v0 = sub_1B389C410();

  return sub_1B388DC6C(v0);
}

char *sub_1B388DC20@<X0>(char **a1@<X8>)
{
  __n128 result = SessionType.allStreamDescriptors.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1B388DC6C(uint64_t a1)
{
  sub_1B3856680();
  uint64_t v2 = sub_1B389C560();
  uint64_t v9 = v2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      uint64_t v5 = a1 + i;
      sub_1B388F90C(&v8, *(unsigned __int8 *)(v5 + 32));
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

char *SessionType.init(forStream:)@<X0>(char *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = qword_1B38A10D0[*result];
  *a2 = 0;
  a2[1] = v2;
  return result;
}

PegasusConfiguration::FeedbackStreamDescriptor_optional SessionType.init(withCanonicalIdentifier:)@<W0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  result.value = FeedbackStreamDescriptor.init(rawValue:)(*(Swift::String *)&a1).value;
  if (v8 == 17)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 17;
  }
  else
  {
    char v7 = v8;
    result.value = SessionType.init(forStream:)(&v7, &v8);
    uint64_t v6 = v9;
    if (v9 == 17) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = v8;
    }
  }
  *a2 = v5;
  a2[1] = v6;
  return result;
}

uint64_t sub_1B388DD94()
{
  uint64_t result = sub_1B388DDB4();
  qword_1E9CCF420 = result;
  return result;
}

uint64_t sub_1B388DDB4()
{
  uint64_t v0 = (char *)static FeedbackStreamDescriptor.allCases.getter();
  uint64_t v1 = *((void *)v0 + 2);
  if (v1)
  {
    uint64_t v2 = (unsigned __int8 *)(v0 + 32);
    uint64_t v3 = MEMORY[0x1E4FBC860];
    do
    {
      unsigned int v5 = *v2++;
      uint64_t v4 = v5;
      switch(v5)
      {
        case 1u:
          goto LABEL_19;
        case 2u:
          uint64_t v4 = 2;
          goto LABEL_19;
        case 3u:
          uint64_t v4 = 3;
          goto LABEL_19;
        case 4u:
          uint64_t v4 = 4;
          goto LABEL_19;
        case 5u:
          uint64_t v4 = 5;
          goto LABEL_19;
        case 6u:
          uint64_t v4 = 6;
          goto LABEL_19;
        case 7u:
          uint64_t v4 = 7;
          goto LABEL_19;
        case 8u:
          uint64_t v4 = 8;
          goto LABEL_19;
        case 9u:
          uint64_t v4 = 9;
          goto LABEL_19;
        case 0xAu:
          uint64_t v4 = 10;
          goto LABEL_19;
        case 0xBu:
          uint64_t v4 = 11;
          goto LABEL_19;
        case 0xCu:
          uint64_t v4 = 12;
          goto LABEL_19;
        case 0xDu:
          uint64_t v4 = 13;
          goto LABEL_19;
        case 0xEu:
          uint64_t v4 = 14;
          goto LABEL_19;
        case 0xFu:
          uint64_t v4 = 15;
          goto LABEL_19;
        case 0x10u:
          uint64_t v4 = 16;
LABEL_19:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_1B388E71C();
            uint64_t v3 = v8;
          }
          unint64_t v6 = *(void *)(v3 + 16);
          if (v6 >= *(void *)(v3 + 24) >> 1)
          {
            sub_1B388E71C();
            uint64_t v3 = v9;
          }
          *(void *)(v3 + 16) = v6 + 1;
          uint64_t v7 = v3 + 16 * v6;
          *(void *)(v7 + 32) = 0;
          *(void *)(v7 + 40) = v4;
          break;
        default:
          break;
      }
      --v1;
    }
    while (v1);
  }
  else
  {
    uint64_t v3 = MEMORY[0x1E4FBC860];
  }
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t static SessionType.allKnownCases.getter()
{
  if (qword_1E9CCEC48 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static SessionType.allKnownCases.setter(uint64_t a1)
{
  if (qword_1E9CCEC48 != -1) {
    swift_once();
  }
  swift_beginAccess();
  qword_1E9CCF420 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static SessionType.allKnownCases.modify())()
{
  if (qword_1E9CCEC48 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1B388E14C(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    OUTLINED_FUNCTION_8_5();
    if (v8 != v9)
    {
      OUTLINED_FUNCTION_11_3();
      if (v8)
      {
        __break(1u);
        goto LABEL_23;
      }
      OUTLINED_FUNCTION_7_6();
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v10 = *(void *)(a4 + 16);
  if (v7 <= v10) {
    uint64_t v11 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v11 = v7;
  }
  if (!v11)
  {
    uint64_t v15 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCF070);
  uint64_t v12 = sub_1B389BAD0();
  OUTLINED_FUNCTION_5_6(v12);
  uint64_t v14 = *(void *)(v13 + 72);
  uint64_t v15 = (void *)OUTLINED_FUNCTION_9_2();
  size_t v16 = _swift_stdlib_malloc_size(v15);
  if (!v14 || (v16 - v4 == 0x8000000000000000 ? (BOOL v17 = v14 == -1) : (BOOL v17 = 0), v17))
  {
LABEL_23:
    OUTLINED_FUNCTION_2();
    uint64_t result = sub_1B389C850();
    __break(1u);
    return result;
  }
  v15[2] = v10;
  void v15[3] = 2 * ((uint64_t)(v16 - v4) / v14);
LABEL_18:
  uint64_t v18 = sub_1B389BAD0();
  OUTLINED_FUNCTION_6_4(v18);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  unint64_t v21 = (unint64_t)v15 + v20;
  if (a1)
  {
    sub_1B388F11C(a4 + v20, v10, v21);
    OUTLINED_FUNCTION_14_1();
  }
  else
  {
    sub_1B388E7F8(0, v10, v21, a4);
  }
  return (uint64_t)v15;
}

void sub_1B388E2E8()
{
}

void sub_1B388E31C()
{
}

void sub_1B388E350()
{
}

void sub_1B388E384()
{
  OUTLINED_FUNCTION_12_2();
  if (v6)
  {
    OUTLINED_FUNCTION_8_5();
    if (v8 != v9)
    {
      OUTLINED_FUNCTION_11_3();
      if (v8)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_7_6();
    }
  }
  else
  {
    uint64_t v7 = v4;
  }
  uint64_t v10 = *(void *)(v0 + 16);
  if (v7 <= v10) {
    uint64_t v11 = *(void *)(v0 + 16);
  }
  else {
    uint64_t v11 = v7;
  }
  if (v11)
  {
    __swift_instantiateConcreteTypeFromMangledName(v5);
    uint64_t v12 = (void *)swift_allocObject();
    size_t v13 = _swift_stdlib_malloc_size(v12);
    void v12[2] = v10;
    void v12[3] = 2 * ((uint64_t)(v13 - 32) / 32);
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4FBC860];
  }
  uint64_t v14 = v12 + 4;
  if (v3)
  {
    v2(v0 + 32, v10, v14);
    OUTLINED_FUNCTION_14_1();
  }
  else
  {
    v1(0, v10, v14, v0);
  }
}

uint64_t sub_1B388E460(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    OUTLINED_FUNCTION_8_5();
    if (v8 != v9)
    {
      OUTLINED_FUNCTION_11_3();
      if (v8)
      {
        __break(1u);
        goto LABEL_23;
      }
      OUTLINED_FUNCTION_7_6();
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v10 = *(void *)(a4 + 16);
  if (v7 <= v10) {
    uint64_t v11 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v11 = v7;
  }
  if (!v11)
  {
    uint64_t v15 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCEB30);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA3E8);
  OUTLINED_FUNCTION_5_6(v12);
  uint64_t v14 = *(void *)(v13 + 72);
  uint64_t v15 = (void *)OUTLINED_FUNCTION_9_2();
  size_t v16 = _swift_stdlib_malloc_size(v15);
  if (!v14 || (v16 - v4 == 0x8000000000000000 ? (BOOL v17 = v14 == -1) : (BOOL v17 = 0), v17))
  {
LABEL_23:
    OUTLINED_FUNCTION_2();
    uint64_t result = sub_1B389C850();
    __break(1u);
    return result;
  }
  v15[2] = v10;
  void v15[3] = 2 * ((uint64_t)(v16 - v4) / v14);
LABEL_18:
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA3E8);
  OUTLINED_FUNCTION_6_4(v18);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  unint64_t v21 = (unint64_t)v15 + v20;
  if (a1)
  {
    sub_1B388F2A8(a4 + v20, v10, v21);
    OUTLINED_FUNCTION_14_1();
  }
  else
  {
    sub_1B388EC44(0, v10, v21, a4);
  }
  return (uint64_t)v15;
}

void sub_1B388E604()
{
}

char *sub_1B388E638(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FAB50);
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
  if (v5)
  {
    sub_1B388D580((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1B388EEC0(0, v8, v12, a4);
  }
  return v10;
}

void sub_1B388E71C()
{
  OUTLINED_FUNCTION_12_2();
  if (v6)
  {
    OUTLINED_FUNCTION_8_5();
    if (v8 != v9)
    {
      OUTLINED_FUNCTION_11_3();
      if (v8)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_7_6();
    }
  }
  else
  {
    uint64_t v7 = v4;
  }
  uint64_t v10 = *(void *)(v0 + 16);
  if (v7 <= v10) {
    uint64_t v11 = *(void *)(v0 + 16);
  }
  else {
    uint64_t v11 = v7;
  }
  if (v11)
  {
    __swift_instantiateConcreteTypeFromMangledName(v5);
    uint64_t v12 = (void *)swift_allocObject();
    size_t v13 = _swift_stdlib_malloc_size(v12);
    void v12[2] = v10;
    void v12[3] = 2 * ((uint64_t)(v13 - 32) / 16);
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4FBC860];
  }
  uint64_t v14 = v12 + 4;
  if (v3)
  {
    v2(v0 + 32, v10, v14);
    OUTLINED_FUNCTION_14_1();
  }
  else
  {
    v1(0, v10, v14, v0);
  }
}

uint64_t sub_1B388E7F8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_1B389BAD0() - 8);
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
  uint64_t result = sub_1B389C890();
  __break(1u);
  return result;
}

uint64_t sub_1B388E958(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_1B389C890();
  __break(1u);
  return result;
}

uint64_t sub_1B388EA50(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_1B389C890();
  __break(1u);
  return result;
}

uint64_t sub_1B388EB48(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_1B389C890();
  __break(1u);
  return result;
}

uint64_t sub_1B388EC44(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA3E8) - 8);
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
  uint64_t result = sub_1B389C890();
  __break(1u);
  return result;
}

uint64_t sub_1B388EDA8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCF438);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_1B389C890();
  __break(1u);
  return result;
}

char *sub_1B388EEC0(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + a1 + 32);
    unint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = (char *)sub_1B389C890();
  __break(1u);
  return result;
}

uint64_t sub_1B388EFB0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_1B389C890();
  __break(1u);
  return result;
}

char *sub_1B388F0A8(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2();
    __src = (char *)OUTLINED_FUNCTION_10_3();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_1B388F11C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2();
    uint64_t result = OUTLINED_FUNCTION_10_3();
    __break(1u);
  }
  else if (a3 < a1 || (uint64_t result = sub_1B389BAD0(), a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    sub_1B389BAD0();
    OUTLINED_FUNCTION_13_1();
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    OUTLINED_FUNCTION_13_1();
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_1B388F214(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1B389C890();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

uint64_t sub_1B388F2A8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    uint64_t result = sub_1B389C890();
    __break(1u);
  }
  else if (a3 < a1 {
         || (uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA3E8),
  }
             a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA3E8);
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_1B388F3E0(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1B389C890();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_1B388F474(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 16 * a2 > a1 ? (BOOL v3 = a1 + 16 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    OUTLINED_FUNCTION_2();
    uint64_t result = sub_1B389C890();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_1B388F53C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0
    || ((v5 = *(void *)(*(void *)(sub_1B389BAD0() - 8) + 72) * a2, unint64_t v6 = a3 + v5, v7 = a1 + v5, v6 > a1)
      ? (BOOL v8 = v7 > a3)
      : (BOOL v8 = 0),
        v8))
  {
    OUTLINED_FUNCTION_2();
    uint64_t result = sub_1B389C890();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

unint64_t sub_1B388F63C()
{
  unint64_t result = qword_1E9CCF428;
  if (!qword_1E9CCF428)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9CCF338);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCF428);
  }
  return result;
}

unint64_t sub_1B388F694()
{
  unint64_t result = qword_1EB7FA530[0];
  if (!qword_1EB7FA530[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EB7FA530);
  }
  return result;
}

void *assignWithCopy for SessionType(void *a1, void *a2)
{
  LODWORD(v4) = -1;
  if (a1[1] >= 0xFFFFFFFFuLL) {
    LODWORD(v5) = -1;
  }
  else {
    uint64_t v5 = a1[1];
  }
  unsigned int v6 = v5 + 1;
  if (a2[1] < 0xFFFFFFFFuLL) {
    uint64_t v4 = a2[1];
  }
  unsigned int v7 = v4 + 1;
  if (v6 > 1)
  {
    if (v7 <= 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_12:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v7 > 1)
  {
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for SessionType(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 8);
  int v5 = -1;
  if (v4 < 0xFFFFFFFF) {
    int v5 = v4;
  }
  if ((v5 + 1) > 1) {
    goto LABEL_9;
  }
  unint64_t v6 = *(void *)(a2 + 8);
  LODWORD(v7) = -1;
  if (v6 < 0xFFFFFFFF) {
    uint64_t v7 = *(void *)(a2 + 8);
  }
  if ((v7 + 1) > 1)
  {
    swift_bridgeObjectRelease();
LABEL_9:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SessionType(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 > 0x7FFFFFEE && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483631);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) < 2) {
    LODWORD(v3) = 0;
  }
  if (v3 >= 0x11) {
    return (v3 - 16);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SessionType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFEF)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483631;
    if (a3 >= 0x7FFFFFEF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFEF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 16;
    }
  }
  return result;
}

void *sub_1B388F8C0(void *result, unsigned int a2)
{
  if (a2 > 0x7FFFFFFE)
  {
    *unint64_t result = 0;
    result[1] = 0;
    *(_DWORD *)unint64_t result = a2 - 0x7FFFFFFF;
  }
  else if (a2)
  {
    result[1] = a2;
  }
  return result;
}

uint64_t sub_1B388F8F0(uint64_t result, uint64_t a2, void *a3)
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

uint64_t sub_1B388F90C(unsigned char *a1, uint64_t a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  uint64_t v6 = *(void *)(v5 + 40);
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_1B38554F8(v6, a2);
  uint64_t v8 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v9 = v7 & ~v8;
  if ((*(void *)(v5 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    while (1)
    {
      unint64_t v11 = 0x80000001B38A17F0;
      unint64_t v12 = 0xD000000000000010;
      switch(*(unsigned char *)(*(void *)(v5 + 48) + v9))
      {
        case 1:
          break;
        case 2:
          unint64_t v12 = 0xD000000000000013;
          size_t v13 = "com.apple.safari";
          goto LABEL_21;
        case 3:
          unint64_t v12 = 0x6C7070612E6D6F63;
          uint64_t v14 = 0x697269732E65;
          goto LABEL_15;
        case 4:
          size_t v13 = "ght";
          goto LABEL_21;
        case 5:
          unint64_t v12 = 0xD000000000000012;
          size_t v13 = "com.apple.lookup";
          goto LABEL_21;
        case 6:
          unint64_t v12 = 0x6C7070612E6D6F63;
          uint64_t v14 = 0x7377656E2E65;
          goto LABEL_15;
        case 7:
          unint64_t v12 = 0xD000000000000011;
          size_t v13 = "es";
          goto LABEL_21;
        case 8:
          unint64_t v12 = 0xD000000000000015;
          size_t v13 = "com.apple.parsecd";
          goto LABEL_21;
        case 9:
          unint64_t v12 = 0xD000000000000019;
          size_t v13 = "com.apple.parsec_tool";
          goto LABEL_21;
        case 0xA:
          unint64_t v12 = 0xD000000000000019;
          size_t v13 = "com.apple.coresuggestions";
          goto LABEL_21;
        case 0xB:
          unint64_t v12 = 0x6C7070612E6D6F63;
          uint64_t v14 = 0x6C69616D2E65;
LABEL_15:
          unint64_t v11 = v14 & 0xFFFFFFFFFFFFLL | 0xEE00000000000000;
          break;
        case 0xC:
          unint64_t v12 = 0xD000000000000018;
          size_t v13 = "utilities";
          goto LABEL_21;
        case 0xD:
          unint64_t v12 = 0xD000000000000014;
          size_t v13 = "com.apple.mediaanalysisd";
          goto LABEL_21;
        case 0xE:
          unint64_t v12 = 0xD000000000000012;
          size_t v13 = "com.apple.duetexpert";
          goto LABEL_21;
        case 0xF:
          unint64_t v12 = 0xD000000000000015;
          size_t v13 = "com.apple.trystero";
          goto LABEL_21;
        case 0x10:
          size_t v13 = "com.apple.photopicker";
LABEL_21:
          unint64_t v11 = (unint64_t)v13 | 0x8000000000000000;
          break;
        default:
          unint64_t v11 = 0xE700000000000000;
          unint64_t v12 = 0x6E6F6973736573;
          break;
      }
      unint64_t v15 = 0x80000001B38A17F0;
      unint64_t v16 = 0xD000000000000010;
      switch((char)a2)
      {
        case 1:
          break;
        case 2:
          unint64_t v16 = 0xD000000000000013;
          BOOL v17 = "com.apple.safari";
          goto LABEL_40;
        case 3:
          unint64_t v16 = 0x6C7070612E6D6F63;
          uint64_t v18 = 0x697269732E65;
          goto LABEL_34;
        case 4:
          BOOL v17 = "ght";
          goto LABEL_40;
        case 5:
          unint64_t v16 = 0xD000000000000012;
          BOOL v17 = "com.apple.lookup";
          goto LABEL_40;
        case 6:
          unint64_t v16 = 0x6C7070612E6D6F63;
          uint64_t v18 = 0x7377656E2E65;
          goto LABEL_34;
        case 7:
          unint64_t v16 = 0xD000000000000011;
          BOOL v17 = "es";
          goto LABEL_40;
        case 8:
          unint64_t v16 = 0xD000000000000015;
          BOOL v17 = "com.apple.parsecd";
          goto LABEL_40;
        case 9:
          unint64_t v16 = 0xD000000000000019;
          BOOL v17 = "com.apple.parsec_tool";
          goto LABEL_40;
        case 10:
          unint64_t v16 = 0xD000000000000019;
          BOOL v17 = "com.apple.coresuggestions";
          goto LABEL_40;
        case 11:
          unint64_t v16 = 0x6C7070612E6D6F63;
          uint64_t v18 = 0x6C69616D2E65;
LABEL_34:
          unint64_t v15 = v18 & 0xFFFFFFFFFFFFLL | 0xEE00000000000000;
          break;
        case 12:
          unint64_t v16 = 0xD000000000000018;
          BOOL v17 = "utilities";
          goto LABEL_40;
        case 13:
          unint64_t v16 = 0xD000000000000014;
          BOOL v17 = "com.apple.mediaanalysisd";
          goto LABEL_40;
        case 14:
          unint64_t v16 = 0xD000000000000012;
          BOOL v17 = "com.apple.duetexpert";
          goto LABEL_40;
        case 15:
          unint64_t v16 = 0xD000000000000015;
          BOOL v17 = "com.apple.trystero";
          goto LABEL_40;
        case 16:
          BOOL v17 = "com.apple.photopicker";
LABEL_40:
          unint64_t v15 = (unint64_t)v17 | 0x8000000000000000;
          break;
        default:
          unint64_t v15 = 0xE700000000000000;
          unint64_t v16 = 0x6E6F6973736573;
          break;
      }
      if (v12 == v16 && v11 == v15) {
        break;
      }
      char v20 = sub_1B389C920();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v20) {
        goto LABEL_49;
      }
      unint64_t v9 = (v9 + 1) & v10;
      if (((*(void *)(v5 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
        goto LABEL_47;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_49:
    swift_bridgeObjectRelease();
    uint64_t result = 0;
    char v22 = *(unsigned char *)(*(void *)(*v3 + 48) + v9);
  }
  else
  {
LABEL_47:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v25 = *v3;
    *unint64_t v3 = 0x8000000000000000;
    char v22 = a2;
    sub_1B3890404(a2, v9, isUniquelyReferenced_nonNull_native);
    *unint64_t v3 = v25;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
  }
  *a1 = v22;
  return result;
}

uint64_t sub_1B388FECC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCF448);
  uint64_t v3 = sub_1B389C780();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v28 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    swift_retain();
    int64_t v10 = 0;
    if (!v7) {
      goto LABEL_7;
    }
    while (2)
    {
      unint64_t v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v12 = v11 | (v10 << 6);
LABEL_21:
      char v16 = *(unsigned char *)(*(void *)(v2 + 48) + v12);
      sub_1B389CA10();
      sub_1B389C370();
      swift_bridgeObjectRelease();
      uint64_t v17 = sub_1B389CA40();
      uint64_t v18 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v19 = v17 & ~v18;
      unint64_t v20 = v19 >> 6;
      if (((-1 << v19) & ~*(void *)(v9 + 8 * (v19 >> 6))) != 0)
      {
        unint64_t v21 = __clz(__rbit64((-1 << v19) & ~*(void *)(v9 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
        goto LABEL_30;
      }
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v18) >> 6;
      do
      {
        if (++v20 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
LABEL_38:
          __break(1u);
          goto LABEL_39;
        }
        BOOL v24 = v20 == v23;
        if (v20 == v23) {
          unint64_t v20 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v9 + 8 * v20);
      }
      while (v25 == -1);
      unint64_t v21 = __clz(__rbit64(~v25)) + (v20 << 6);
LABEL_30:
      *(void *)(v9 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
      *(unsigned char *)(*(void *)(v4 + 48) + v21) = v16;
      ++*(void *)(v4 + 16);
      if (v7) {
        continue;
      }
      break;
    }
LABEL_7:
    int64_t v13 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_38;
    }
    if (v13 < v8)
    {
      unint64_t v14 = v28[v13];
      ++v10;
      if (v14) {
        goto LABEL_20;
      }
      int64_t v10 = v13 + 1;
      if (v13 + 1 < v8)
      {
        unint64_t v14 = v28[v10];
        if (v14) {
          goto LABEL_20;
        }
        int64_t v10 = v13 + 2;
        if (v13 + 2 < v8)
        {
          unint64_t v14 = v28[v10];
          if (v14) {
            goto LABEL_20;
          }
          int64_t v15 = v13 + 3;
          if (v15 < v8)
          {
            unint64_t v14 = v28[v15];
            if (v14)
            {
              int64_t v10 = v15;
LABEL_20:
              unint64_t v7 = (v14 - 1) & v14;
              unint64_t v12 = __clz(__rbit64(v14)) + (v10 << 6);
              goto LABEL_21;
            }
            while (1)
            {
              int64_t v10 = v15 + 1;
              if (__OFADD__(v15, 1)) {
                break;
              }
              if (v10 >= v8) {
                goto LABEL_32;
              }
              unint64_t v14 = v28[v10];
              ++v15;
              if (v14) {
                goto LABEL_20;
              }
            }
LABEL_39:
            __break(1u);
            JUMPOUT(0x1B38903C0);
          }
        }
      }
    }
LABEL_32:
    swift_release();
    uint64_t v1 = v0;
    uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
    if (v26 > 63) {
      sub_1B388F8F0(0, (unint64_t)(v26 + 63) >> 6, v28);
    }
    else {
      *uint64_t v28 = -1 << v26;
    }
    *(void *)(v2 + 16) = 0;
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_1B3890404(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  char v26 = result;
  if (v7 <= v6 || (a3 & 1) == 0)
  {
    if (a3)
    {
      sub_1B388FECC();
    }
    else
    {
      if (v7 > v6)
      {
        uint64_t result = (uint64_t)sub_1B3890930();
        goto LABEL_54;
      }
      sub_1B3890AC8();
    }
    uint64_t v8 = *v3;
    uint64_t result = sub_1B38554F8(*(void *)(*v3 + 40), v5);
    uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
    a2 = result & ~v9;
    if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
    {
      uint64_t v10 = ~v9;
      while (1)
      {
        unint64_t v11 = 0x80000001B38A17F0;
        unint64_t v12 = 0xD000000000000010;
        switch(*(unsigned char *)(*(void *)(v8 + 48) + a2))
        {
          case 1:
            break;
          case 2:
            unint64_t v12 = 0xD000000000000013;
            int64_t v13 = "com.apple.safari";
            goto LABEL_28;
          case 3:
            unint64_t v12 = 0x6C7070612E6D6F63;
            uint64_t v14 = 0x697269732E65;
            goto LABEL_24;
          case 4:
            int64_t v13 = "ght";
            goto LABEL_28;
          case 5:
            unint64_t v12 = 0xD000000000000012;
            int64_t v13 = "com.apple.lookup";
            goto LABEL_28;
          case 6:
            unint64_t v12 = 0x6C7070612E6D6F63;
            uint64_t v14 = 0x7377656E2E65;
            goto LABEL_24;
          case 7:
            unint64_t v12 = 0xD000000000000011;
            int64_t v13 = "es";
            goto LABEL_28;
          case 8:
            unint64_t v12 = 0xD000000000000015;
            int64_t v13 = "com.apple.parsecd";
            goto LABEL_28;
          case 9:
            unint64_t v12 = 0xD000000000000019;
            int64_t v13 = "com.apple.parsec_tool";
            goto LABEL_28;
          case 0xA:
            unint64_t v12 = 0xD000000000000019;
            int64_t v13 = "com.apple.coresuggestions";
            goto LABEL_28;
          case 0xB:
            unint64_t v12 = 0x6C7070612E6D6F63;
            uint64_t v14 = 0x6C69616D2E65;
LABEL_24:
            unint64_t v11 = v14 & 0xFFFFFFFFFFFFLL | 0xEE00000000000000;
            break;
          case 0xC:
            unint64_t v12 = 0xD000000000000018;
            int64_t v13 = "utilities";
            goto LABEL_28;
          case 0xD:
            unint64_t v12 = 0xD000000000000014;
            int64_t v13 = "com.apple.mediaanalysisd";
            goto LABEL_28;
          case 0xE:
            unint64_t v12 = 0xD000000000000012;
            int64_t v13 = "com.apple.duetexpert";
            goto LABEL_28;
          case 0xF:
            unint64_t v12 = 0xD000000000000015;
            int64_t v13 = "com.apple.trystero";
            goto LABEL_28;
          case 0x10:
            int64_t v13 = "com.apple.photopicker";
LABEL_28:
            unint64_t v11 = (unint64_t)v13 | 0x8000000000000000;
            break;
          default:
            unint64_t v11 = 0xE700000000000000;
            unint64_t v12 = 0x6E6F6973736573;
            break;
        }
        unint64_t v15 = 0x80000001B38A17F0;
        unint64_t v16 = 0xD000000000000010;
        switch((char)v5)
        {
          case 1:
            break;
          case 2:
            unint64_t v16 = 0xD000000000000013;
            uint64_t v17 = "com.apple.safari";
            goto LABEL_47;
          case 3:
            unint64_t v16 = 0x6C7070612E6D6F63;
            uint64_t v18 = 0x697269732E65;
            goto LABEL_43;
          case 4:
            uint64_t v17 = "ght";
            goto LABEL_47;
          case 5:
            unint64_t v16 = 0xD000000000000012;
            uint64_t v17 = "com.apple.lookup";
            goto LABEL_47;
          case 6:
            unint64_t v16 = 0x6C7070612E6D6F63;
            uint64_t v18 = 0x7377656E2E65;
            goto LABEL_43;
          case 7:
            unint64_t v16 = 0xD000000000000011;
            uint64_t v17 = "es";
            goto LABEL_47;
          case 8:
            unint64_t v16 = 0xD000000000000015;
            uint64_t v17 = "com.apple.parsecd";
            goto LABEL_47;
          case 9:
            unint64_t v16 = 0xD000000000000019;
            uint64_t v17 = "com.apple.parsec_tool";
            goto LABEL_47;
          case 10:
            unint64_t v16 = 0xD000000000000019;
            uint64_t v17 = "com.apple.coresuggestions";
            goto LABEL_47;
          case 11:
            unint64_t v16 = 0x6C7070612E6D6F63;
            uint64_t v18 = 0x6C69616D2E65;
LABEL_43:
            unint64_t v15 = v18 & 0xFFFFFFFFFFFFLL | 0xEE00000000000000;
            break;
          case 12:
            unint64_t v16 = 0xD000000000000018;
            uint64_t v17 = "utilities";
            goto LABEL_47;
          case 13:
            unint64_t v16 = 0xD000000000000014;
            uint64_t v17 = "com.apple.mediaanalysisd";
            goto LABEL_47;
          case 14:
            unint64_t v16 = 0xD000000000000012;
            uint64_t v17 = "com.apple.duetexpert";
            goto LABEL_47;
          case 15:
            unint64_t v16 = 0xD000000000000015;
            uint64_t v17 = "com.apple.trystero";
            goto LABEL_47;
          case 16:
            uint64_t v17 = "com.apple.photopicker";
LABEL_47:
            unint64_t v15 = (unint64_t)v17 | 0x8000000000000000;
            break;
          default:
            unint64_t v15 = 0xE700000000000000;
            unint64_t v16 = 0x6E6F6973736573;
            break;
        }
        if (v12 == v16 && v11 == v15) {
          break;
        }
        char v20 = sub_1B389C920();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_58;
        }
        a2 = (a2 + 1) & v10;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          goto LABEL_54;
        }
      }
LABEL_57:
      swift_bridgeObjectRelease_n();
LABEL_58:
      sub_1B389C990();
      __break(1u);
      JUMPOUT(0x1B38908A8);
    }
  }
LABEL_54:
  uint64_t v21 = *v25;
  *(void *)(*v25 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(unsigned char *)(*(void *)(v21 + 48) + a2) = v26;
  uint64_t v22 = *(void *)(v21 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23)
  {
    __break(1u);
    goto LABEL_57;
  }
  *(void *)(v21 + 16) = v24;
  return result;
}

void *sub_1B3890930()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCF448);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1B389C770();
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

uint64_t sub_1B3890AC8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCF448);
  uint64_t v3 = sub_1B389C780();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = v2 + 56;
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v27 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    swift_retain();
    int64_t v10 = 0;
    if (!v8) {
      goto LABEL_7;
    }
    while (2)
    {
      unint64_t v11 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v12 = v11 | (v10 << 6);
LABEL_21:
      char v16 = *(unsigned char *)(*(void *)(v2 + 48) + v12);
      sub_1B389CA10();
      sub_1B389C370();
      swift_bridgeObjectRelease();
      uint64_t v17 = sub_1B389CA40();
      uint64_t v18 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v19 = v17 & ~v18;
      unint64_t v20 = v19 >> 6;
      if (((-1 << v19) & ~*(void *)(v9 + 8 * (v19 >> 6))) != 0)
      {
        unint64_t v21 = __clz(__rbit64((-1 << v19) & ~*(void *)(v9 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
        goto LABEL_30;
      }
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v18) >> 6;
      do
      {
        if (++v20 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
LABEL_36:
          __break(1u);
          goto LABEL_37;
        }
        BOOL v24 = v20 == v23;
        if (v20 == v23) {
          unint64_t v20 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v9 + 8 * v20);
      }
      while (v25 == -1);
      unint64_t v21 = __clz(__rbit64(~v25)) + (v20 << 6);
LABEL_30:
      *(void *)(v9 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
      *(unsigned char *)(*(void *)(v4 + 48) + v21) = v16;
      ++*(void *)(v4 + 16);
      if (v8) {
        continue;
      }
      break;
    }
LABEL_7:
    int64_t v13 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_36;
    }
    if (v13 < v27)
    {
      unint64_t v14 = *(void *)(v6 + 8 * v13);
      ++v10;
      if (v14) {
        goto LABEL_20;
      }
      int64_t v10 = v13 + 1;
      if (v13 + 1 < v27)
      {
        unint64_t v14 = *(void *)(v6 + 8 * v10);
        if (v14) {
          goto LABEL_20;
        }
        int64_t v10 = v13 + 2;
        if (v13 + 2 < v27)
        {
          unint64_t v14 = *(void *)(v6 + 8 * v10);
          if (v14) {
            goto LABEL_20;
          }
          int64_t v15 = v13 + 3;
          if (v15 < v27)
          {
            unint64_t v14 = *(void *)(v6 + 8 * v15);
            if (v14)
            {
              int64_t v10 = v15;
LABEL_20:
              unint64_t v8 = (v14 - 1) & v14;
              unint64_t v12 = __clz(__rbit64(v14)) + (v10 << 6);
              goto LABEL_21;
            }
            while (1)
            {
              int64_t v10 = v15 + 1;
              if (__OFADD__(v15, 1)) {
                break;
              }
              if (v10 >= v27) {
                goto LABEL_32;
              }
              unint64_t v14 = *(void *)(v6 + 8 * v10);
              ++v15;
              if (v14) {
                goto LABEL_20;
              }
            }
LABEL_37:
            __break(1u);
            JUMPOUT(0x1B3890F84);
          }
        }
      }
    }
LABEL_32:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
  }
  else
  {
    uint64_t result = swift_release();
  }
  uint64_t *v1 = v4;
  return result;
}

uint64_t OUTLINED_FUNCTION_6_4(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_15_2(uint64_t a1, uint64_t a2)
{
  sub_1B385D760(a1, a2);
  sub_1B385D760(v2, v3);
  return sub_1B3859F9C(v2, v3);
}

void static PegasusConfigContainerURLProvider.containerURL<A>(using:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v6 = OUTLINED_FUNCTION_1_18();
  OUTLINED_FUNCTION_3_0();
  uint64_t v8 = v7;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_29();
  uint64_t v12 = v11 - v10;
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_29();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v15 - v14, a1, a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FAAB8);
  if (swift_dynamicCast())
  {
    sub_1B3875FEC(v20, (uint64_t)v22);
    uint64_t v17 = v23;
    uint64_t v18 = v24;
    __swift_project_boxed_opaque_existential_1(v22, v23);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v18);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v22);
  }
  else
  {
    uint64_t v21 = 0;
    memset(v20, 0, sizeof(v20));
    sub_1B3891360((uint64_t)v20);
    sub_1B3859CDC();
    if (!v2)
    {
      (*(void (**)(uint64_t, void, uint64_t))(v8 + 104))(v12, *MEMORY[0x1E4F276A8], v6);
      uint64_t v19 = sub_1B389BD00();
      OUTLINED_FUNCTION_3_11(v19);
      sub_1B389BCD0();
    }
  }
}

void static PegasusConfigContainerURLProvider.containerURL()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
  MEMORY[0x1F4188790](v1 - 8);
  uint64_t v2 = OUTLINED_FUNCTION_1_18();
  OUTLINED_FUNCTION_3_0();
  uint64_t v4 = v3;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_29();
  uint64_t v8 = v7 - v6;
  sub_1B3859CDC();
  if (!v0)
  {
    (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v8, *MEMORY[0x1E4F276A8], v2);
    uint64_t v9 = sub_1B389BD00();
    OUTLINED_FUNCTION_3_11(v9);
    sub_1B389BCD0();
  }
}

uint64_t sub_1B3891360(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FAAC8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t static PegasusConfigContainerURLProvider.identifier.getter()
{
  return 0xD000000000000024;
}

ValueMetadata *type metadata accessor for PegasusConfigContainerURLProvider()
{
  return &type metadata for PegasusConfigContainerURLProvider;
}

uint64_t dispatch thunk of PegasusConfigContainerURLResolver.containerURL()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

void sub_1B3891414()
{
  qword_1E9CCF450 = 0x6572615773706C41;
  *(void *)algn_1E9CCF458 = 0xEF32566573756F68;
}

uint64_t static DataWarehouseConfig.mainFolderName.getter()
{
  return sub_1B3891594(&qword_1E9CCEC50, &qword_1E9CCF450);
}

unint64_t static DataWarehouseConfig.databaseName.getter()
{
  return 0xD000000000000011;
}

void sub_1B3891488()
{
  algn_1E9CCF468[7] = -18;
}

uint64_t static DataWarehouseConfig.schemaFilename.getter()
{
  return sub_1B3891594(&qword_1E9CCEC58, &qword_1E9CCF460);
}

void sub_1B38914E0()
{
  qword_1E9CCF470 = 6517604;
  *(void *)algn_1E9CCF478 = 0xE300000000000000;
}

uint64_t static DataWarehouseConfig.schemaExtension.getter()
{
  return sub_1B3891594(&qword_1E9CCEC60, &qword_1E9CCF470);
}

unint64_t static DataWarehouseConfig.Context.messageName.getter()
{
  return 0xD000000000000020;
}

void sub_1B3891540()
{
  qword_1E9CCE9D0 = 0x746E6F635F6D6673;
  unk_1E9CCE9D8 = 0xEB00000000747865;
}

uint64_t static DataWarehouseConfig.Context.tableName.getter()
{
  return sub_1B3891594(&qword_1E9CCE9E8, &qword_1E9CCE9D0);
}

uint64_t sub_1B3891594(void *a1, uint64_t *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

void sub_1B38915E8()
{
  qword_1E9CCF590 = 7169651;
  *(void *)algn_1E9CCF598 = 0xE300000000000000;
}

void sub_1B3891604()
{
  qword_1E9CCF700 = 2003134838;
  *(void *)algn_1E9CCF708 = 0xE400000000000000;
}

uint64_t DataWarehouseConfig.dataWarehouseUrl.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1B389BD00();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t DataWarehouseConfig.databaseAlias.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for DataWarehouseConfig() + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t type metadata accessor for DataWarehouseConfig()
{
  uint64_t result = qword_1E9CCF488;
  if (!qword_1E9CCF488) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t DataWarehouseConfig.streamDescriptor.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for DataWarehouseConfig();
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 24));
  return result;
}

uint64_t DataWarehouseConfig.databaseUrl.getter()
{
  uint64_t v0 = sub_1B389BC30();
  OUTLINED_FUNCTION_1();
  uint64_t v2 = v1;
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_29();
  uint64_t v6 = v5 - v4;
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v5 - v4, *MEMORY[0x1E4F276B8], v0);
  sub_1B38538CC();
  sub_1B389BCF0();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v6, v0);
  return swift_bridgeObjectRelease();
}

uint64_t URL.aggregationSchemaUrl.getter()
{
  uint64_t v0 = sub_1B389BC30();
  OUTLINED_FUNCTION_1();
  uint64_t v2 = v1;
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_29();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = sub_1B389BD00();
  OUTLINED_FUNCTION_1();
  uint64_t v9 = v8;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_29();
  uint64_t v13 = v12 - v11;
  if (qword_1E9CCEC58 != -1) {
    swift_once();
  }
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v6, *MEMORY[0x1E4F276C0], v0);
  sub_1B38538CC();
  swift_bridgeObjectRetain();
  sub_1B389BCF0();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v6, v0);
  swift_bridgeObjectRelease();
  if (qword_1E9CCEC60 != -1) {
    swift_once();
  }
  sub_1B389BC70();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v13, v7);
}

uint64_t DataWarehouseConfig.init(dataWarehouseUrl:streamDescriptor:fileManager:)@<X0>(uint64_t a1@<X0>, unsigned __int8 *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  id v39 = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
  uint64_t v8 = MEMORY[0x1F4188790](v7 - 8);
  uint64_t v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v34 - v11;
  uint64_t v13 = sub_1B389BD00();
  OUTLINED_FUNCTION_1();
  uint64_t v15 = v14;
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_29();
  uint64_t v19 = v18 - v17;
  int v20 = *a2;
  uint64_t v21 = a1;
  uint64_t v36 = type metadata accessor for DataWarehouseConfig();
  char v22 = (void *)(a4 + *(int *)(v36 + 20));
  *char v22 = 0x73756F6865726177;
  v22[1] = 0xE900000000000065;
  sub_1B3891D68(v21, (uint64_t)v10);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v13);
  uint64_t v37 = v15;
  if (EnumTagSinglePayload == 1)
  {
    uint64_t v35 = a4;
    unsigned __int8 v41 = v20;
    uint64_t v24 = v38;
    NSFileManager.dataWarehouseUrl(for:)(&v41, (uint64_t)v12);
    if (v24)
    {

      sub_1B38877AC(v21);
      uint64_t v25 = (uint64_t)v10;
LABEL_8:
      sub_1B38877AC(v25);
      return swift_bridgeObjectRelease();
    }
    int v40 = v20;
    sub_1B38877AC((uint64_t)v10);
    id v26 = v39;
    a4 = v35;
  }
  else
  {
    int v40 = v20;
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v12, v10, v13);
    __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v13);
    id v26 = v39;
  }
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13) == 1)
  {
    sub_1B38877AC((uint64_t)v12);
    sub_1B38922AC();
    swift_allocError();
    *int64_t v27 = 0;
    v27[1] = 0;
    swift_willThrow();

    uint64_t v25 = v21;
    goto LABEL_8;
  }
  uint64_t v38 = v21;
  uint64_t v28 = *(void (**)(uint64_t, char *, uint64_t))(v37 + 32);
  v28(v19, v12, v13);
  if (sub_1B389BC20())
  {

    sub_1B38877AC(v38);
    *(unsigned char *)(a4 + *(int *)(v36 + 24)) = v40;
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v28)(a4, v19, v13);
  }
  uint64_t v30 = sub_1B389BC40();
  uint64_t v32 = v31;
  sub_1B38922AC();
  swift_allocError();
  *uint64_t v33 = v30;
  v33[1] = v32;
  swift_willThrow();

  sub_1B38877AC(v38);
  (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v19, v13);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B3891D68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t NSFileManager.dataWarehouseUrl(for:)@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v49 = a2;
  uint64_t v4 = sub_1B389BC30();
  OUTLINED_FUNCTION_1();
  uint64_t v50 = v5;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_29();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
  MEMORY[0x1F4188790](v10 - 8);
  OUTLINED_FUNCTION_29();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = sub_1B389BD00();
  OUTLINED_FUNCTION_1();
  uint64_t v16 = v15;
  uint64_t v18 = MEMORY[0x1F4188790](v17);
  int v20 = (char *)v43 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v18);
  char v22 = (char *)v43 - v21;
  int v23 = *a1;
  uint64_t v24 = v51;
  sub_1B3858A8C(v2);
  if (v24)
  {

    __swift_storeEnumTagSinglePayload(v13, 1, 1, v14);
LABEL_4:
    sub_1B38877AC(v13);
    sub_1B387FCF4();
    swift_allocError();
    *uint64_t v25 = 0;
    v25[1] = 0;
    return swift_willThrow();
  }
  uint64_t v46 = 0;
  uint64_t v47 = v20;
  uint64_t v51 = v22;
  uint64_t v48 = v9;
  uint64_t v45 = v4;
  __swift_storeEnumTagSinglePayload(v13, 0, 1, v14);
  if (__swift_getEnumTagSinglePayload(v13, 1, v14) == 1) {
    goto LABEL_4;
  }
  int v44 = v23;
  uint64_t v27 = v16;
  uint64_t v28 = v51;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 32))(v51, v13, v14);
  if (qword_1EB7FAAD0 != -1) {
    swift_once();
  }
  uint64_t v29 = sub_1B389C1B0();
  __swift_project_value_buffer(v29, (uint64_t)qword_1EB7FC128);
  uint64_t v30 = v47;
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v47, v28, v14);
  uint64_t v31 = sub_1B389C190();
  os_log_type_t v32 = sub_1B389C590();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    v52[0] = v34;
    *(_DWORD *)uint64_t v33 = 136315138;
    v43[1] = v33 + 4;
    sub_1B38566CC();
    uint64_t v35 = sub_1B389C8F0();
    v52[3] = sub_1B3855F24(v35, v36, v52);
    sub_1B389C6C0();
    swift_bridgeObjectRelease();
    uint64_t v37 = *(void (**)(void))(v27 + 8);
    OUTLINED_FUNCTION_3_12();
    v37();
    _os_log_impl(&dword_1B3850000, v31, v32, "Container URL: %s", v33, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B3EBAF20](v34, -1, -1);
    MEMORY[0x1B3EBAF20](v33, -1, -1);
  }
  else
  {
    uint64_t v37 = *(void (**)(void))(v16 + 8);
    ((void (*)(char *, uint64_t))v37)(v30, v14);
  }

  uint64_t v38 = v45;
  uint64_t v40 = v49;
  uint64_t v39 = v50;
  uint64_t v41 = v48;
  if (v44 == 2)
  {
    if (qword_1E9CCEC50 != -1) {
      swift_once();
    }
    v52[0] = qword_1E9CCF450;
    v52[1] = *(void *)algn_1E9CCF458;
    (*(void (**)(uint64_t, void, uint64_t))(v39 + 104))(v41, *MEMORY[0x1E4F276C0], v38);
    sub_1B38538CC();
    swift_bridgeObjectRetain();
    sub_1B389BCF0();
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v41, v38);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_3_12();
    v37();
    uint64_t v42 = 0;
  }
  else
  {
    OUTLINED_FUNCTION_3_12();
    v37();
    uint64_t v42 = 1;
  }
  return __swift_storeEnumTagSinglePayload(v40, v42, 1, v14);
}

unint64_t sub_1B38922AC()
{
  unint64_t result = qword_1E9CCF480;
  if (!qword_1E9CCF480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCF480);
  }
  return result;
}

unint64_t FeedbackStreamDescriptor.metricsMessageName.getter()
{
  if (*v0 != 2) {
    return 0;
  }
  unint64_t v2 = FeedbackStreamDescriptor.rawValue.getter();
  swift_bridgeObjectRetain();
  sub_1B389C3C0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1B389C3C0();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t FeedbackStreamDescriptor.metricsTableName.getter()
{
  if (*v0 != 2) {
    return 0;
  }
  unint64_t v1 = FeedbackStreamDescriptor.rawValue.getter();
  unint64_t v3 = v2;
  uint64_t v12 = 46;
  unint64_t v13 = 0xE100000000000000;
  MEMORY[0x1F4188790](v1);
  id v11[2] = &v12;
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_1B3892760(0x7FFFFFFFFFFFFFFFLL, 1u, sub_1B387B460, (uint64_t)v11, v1, v3);
  swift_bridgeObjectRelease();
  sub_1B3892538(v4);
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  if (!v6) {
    return 0;
  }
  uint64_t v7 = sub_1B389259C();
  unint64_t v9 = v8;
  swift_bridgeObjectRelease();
  if (qword_1E9CCE9F0 != -1) {
    swift_once();
  }
  uint64_t v12 = v7;
  unint64_t v13 = v9;
  swift_bridgeObjectRetain();
  sub_1B389C3C0();
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_1B3892538(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 32 * v1);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1B389259C()
{
  uint64_t v0 = sub_1B389C380();
  uint64_t v1 = sub_1B389C680();
  BOOL v2 = __OFADD__(v0, v1);
  uint64_t result = v0 + v1;
  if (v2)
  {
    __break(1u);
  }
  else
  {
    MEMORY[0x1B3EBA030](result);
    sub_1B3893250();
    sub_1B389C3B0();
    sub_1B389C3B0();
    return 0;
  }
  return result;
}

uint64_t FeedbackStreamDescriptor.metricsViewName.getter()
{
  if (*v0 != 2) {
    return 0;
  }
  uint64_t v2 = FeedbackStreamDescriptor.metricsTableName.getter();
  swift_bridgeObjectRetain();
  sub_1B389C3C0();
  swift_bridgeObjectRelease();
  if (qword_1E9CCEC68 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_1B389C3C0();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_1B3892760(uint64_t a1, unsigned __int8 a2, uint64_t (*a3)(void *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  v50[3] = a4;
  if (a1 < 0)
  {
    OUTLINED_FUNCTION_2();
    goto LABEL_40;
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = MEMORY[0x1E4FBC860];
  uint64_t v42 = v10 + 16;
  uint64_t v47 = swift_allocObject();
  *(void *)(v47 + 16) = 15;
  uint64_t v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (uint64_t v12 = HIBYTE(a6) & 0xF) : (uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0) {
      uint64_t v11 = a5 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v30 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0) {
      uint64_t v30 = 11;
    }
    sub_1B3892B98(v30 | (v11 << 16), v47, a2 & 1, v10);
    swift_bridgeObjectRelease();
    uint64_t v13 = *(void *)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_36:
    swift_release();
    return v13;
  }
  uint64_t v41 = a1;
  unint64_t v48 = 4 * v12;
  uint64_t v13 = MEMORY[0x1E4FBC860];
  unint64_t v14 = 15;
  unint64_t v15 = 15;
  unint64_t v16 = 15;
  while (1)
  {
    v50[0] = sub_1B389C3F0();
    v50[1] = v17;
    char v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v13;
    }
    char v19 = v18;
    swift_bridgeObjectRelease();
    if ((v19 & 1) == 0)
    {
      unint64_t v14 = sub_1B389C390();
      goto LABEL_21;
    }
    int v20 = (v15 >> 14 == v14 >> 14) & a2;
    if (v20 != 1)
    {
      if (v14 >> 14 < v15 >> 14) {
        goto LABEL_38;
      }
      uint64_t v21 = sub_1B389C400();
      uint64_t v43 = v23;
      uint64_t v44 = v22;
      uint64_t v45 = v24;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1B388E2E8();
        uint64_t v13 = v28;
      }
      unint64_t v25 = *(void *)(v13 + 16);
      if (v25 >= *(void *)(v13 + 24) >> 1)
      {
        sub_1B388E2E8();
        uint64_t v13 = v29;
      }
      *(void *)(v13 + 16) = v25 + 1;
      id v26 = (void *)(v13 + 32 * v25);
      v26[4] = v21;
      v26[5] = v45;
      v26[6] = v44;
      v26[7] = v43;
      *(void *)uint64_t v42 = v13;
    }
    uint64_t v27 = sub_1B389C390();
    unint64_t v14 = v27;
    *(void *)(v47 + 16) = v27;
    if ((v20 & 1) == 0 && *(void *)(v13 + 16) == v41) {
      break;
    }
    unint64_t v15 = v27;
    unint64_t v16 = v27;
LABEL_21:
    if (v48 == v14 >> 14) {
      goto LABEL_30;
    }
  }
  unint64_t v16 = v27;
  unint64_t v15 = v27;
LABEL_30:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_35:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_36;
  }
  if (v48 >= v16 >> 14)
  {
    uint64_t v31 = sub_1B389C400();
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    swift_bridgeObjectRelease();
    sub_1B3882DE4();
    uint64_t v38 = *(void *)(*(void *)v42 + 16);
    sub_1B3882E70(v38);
    uint64_t v13 = *(void *)v42;
    *(void *)(v13 + 16) = v38 + 1;
    uint64_t v39 = (void *)(v13 + 32 * v38);
    v39[4] = v31;
    v39[5] = v33;
    v39[6] = v35;
    v39[7] = v37;
    *(void *)uint64_t v42 = v13;
    goto LABEL_35;
  }
LABEL_38:
  OUTLINED_FUNCTION_2();
LABEL_40:
  uint64_t result = sub_1B389C850();
  __break(1u);
  return result;
}

uint64_t sub_1B3892B98(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a2 + 16) >> 14;
  int v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1) {
    return v5 ^ 1u;
  }
  if (a1 >> 14 >= v4)
  {
    uint64_t v7 = sub_1B389C400();
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    sub_1B3882DE4();
    uint64_t v14 = *(void *)(*(void *)(a4 + 16) + 16);
    sub_1B3882E70(v14);
    uint64_t v15 = *(void *)(a4 + 16);
    *(void *)(v15 + 16) = v14 + 1;
    unint64_t v16 = (void *)(v15 + 32 * v14);
    v16[4] = v7;
    v16[5] = v9;
    v16[6] = v11;
    v16[7] = v13;
    return v5 ^ 1u;
  }
  uint64_t result = sub_1B389C850();
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for DataWarehouseConfigError()
{
  return &type metadata for DataWarehouseConfigError;
}

void *initializeBufferWithCopyOfBuffer for DataWarehouseConfig(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1B389BD00();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (void *)((char *)a1 + v8);
    uint64_t v11 = (void *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    *((unsigned char *)a1 + v9) = *((unsigned char *)a2 + v9);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for DataWarehouseConfig(uint64_t a1)
{
  uint64_t v2 = sub_1B389BD00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DataWarehouseConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1B389BD00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  *(unsigned char *)(a1 + v8) = *(unsigned char *)(a2 + v8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DataWarehouseConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1B389BD00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + *(int *)(a3 + 24)) = *(unsigned char *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t initializeWithTake for DataWarehouseConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1B389BD00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for DataWarehouseConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1B389BD00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + *(int *)(a3 + 24)) = *(unsigned char *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t getEnumTagSinglePayload for DataWarehouseConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B3893070);
}

uint64_t sub_1B3893070(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1B389BD00();
  OUTLINED_FUNCTION_20();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for DataWarehouseConfig(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B3893114);
}

void sub_1B3893114(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1B389BD00();
  OUTLINED_FUNCTION_20();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
}

uint64_t sub_1B38931A0()
{
  uint64_t result = sub_1B389BD00();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for DataWarehouseConfig.Context()
{
  return &type metadata for DataWarehouseConfig.Context;
}

unint64_t sub_1B3893250()
{
  unint64_t result = qword_1E9CCEAB8;
  if (!qword_1E9CCEAB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CCEAB8);
  }
  return result;
}

uint64_t sub_1B389329C()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1B38932D4()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

double sub_1B38932E4()
{
  if (qword_1EB7FAB90 != -1) {
    swift_once();
  }
  unint64_t v1 = (void *)sub_1B389C280();
  id v2 = objc_msgSend(v0, sel_valueForKey_, v1);

  if (v2)
  {
    sub_1B389C730();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_1B3896A04((uint64_t)v5, (uint64_t)v6, &qword_1EB7FBE60);
  if (v7)
  {
    if (swift_dynamicCast()) {
      return v4;
    }
  }
  else
  {
    sub_1B38763B8((uint64_t)v6, &qword_1EB7FBE60);
  }
  return 0.0;
}

size_t sub_1B38933FC()
{
  unint64_t v3 = v0;
  uint64_t v4 = sub_1B389BD10();
  OUTLINED_FUNCTION_1();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_7_3();
  uint64_t v8 = sub_1B389C580();
  if (v1) {
    return v4;
  }
  uint64_t v9 = v8;
  size_t result = (size_t)objc_msgSend(v0, sel_seekToEndOfFile);
  if ((result & 0x8000000000000000) == 0)
  {
    size_t v11 = result;
    uint64_t v12 = mmap(0, result, 1, 1, (int)objc_msgSend(v0, sel_fileDescriptor), 0);
    if (v12)
    {
      uint64_t v13 = v12;
      (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v2, *MEMORY[0x1E4F27750], v4);
      uint64_t v4 = MEMORY[0x1B3EB99F0](v13, v11, v2);
    }
    else
    {
      uint64_t v14 = sub_1B389C2B0();
      uint64_t v4 = v15;
      uint64_t v16 = (int)MEMORY[0x1B3EB9E90]();
      id v17 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
      sub_1B3875B14(v14, v4, v16, 0);
      swift_willThrow();
    }
    sub_1B3896410(v3, v9);
    return v4;
  }
  __break(1u);
  return result;
}

id ConfigFactoryInternal.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void sub_1B38935D0()
{
  qword_1E9CCF710 = 0x446769666E6F635FLL;
  *(void *)algn_1E9CCF718 = 0xEB00000000617461;
}

void sub_1B38935FC()
{
  qword_1E9CCF720 = 0x656741726573755FLL;
  *(void *)algn_1E9CCF728 = 0xEA0000000000746ELL;
}

void sub_1B3893624()
{
  qword_1EB7FC140 = 0x755F686372616573;
  *(void *)algn_1EB7FC148 = 0xEA00000000006C72;
}

id ConfigFactoryInternal.load(url:userAgent:userDefaults:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v9 = sub_1B389BD00();
  OUTLINED_FUNCTION_1();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_7_3();
  type metadata accessor for ConfigInternal();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v4, a1, v9);
  id v13 = a4;
  swift_bridgeObjectRetain();
  return sub_1B3893740(v4, a2, a3, a4);
}

uint64_t type metadata accessor for ConfigInternal()
{
  return self;
}

id sub_1B3893740(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = v4;
  id v26 = a4;
  uint64_t v9 = sub_1B389BD00();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  MEMORY[0x1F4188790](v11);
  id v13 = (char *)&v22 - v12;
  sub_1B3859FE4(0, &qword_1EB7FAA60);
  uint64_t v25 = v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, a1, v9);
  id v14 = sub_1B3869528((uint64_t)v13);
  uint64_t v23 = a2;
  uint64_t v24 = v9;
  uint64_t v15 = a1;
  size_t v17 = sub_1B38933FC();
  unint64_t v19 = v18;

  id v20 = objc_allocWithZone(v5);
  id v21 = sub_1B3894954(v17, v19, v23, a3, v26);
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v15, v24);
  return v21;
}

id ConfigFactoryInternal.load(data:userAgent:userDefaults:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v10 = objc_allocWithZone((Class)type metadata accessor for ConfigInternal());
  sub_1B386CEF8(a1, a2);
  id v11 = a5;
  swift_bridgeObjectRetain();
  return sub_1B3894954(a1, a2, a3, a4, a5);
}

id ConfigFactoryInternal.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_1B3893EEC(uint64_t a1, uint64_t a2, void *a3)
{
  sub_1B3893F48(a3);
  if (v3)
  {
    uint64_t v4 = (void *)sub_1B389C280();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t sub_1B3893F48(void *a1)
{
  uint64_t v2 = *(void *)(v1 + *a1);
  swift_bridgeObjectRetain();
  return v2;
}

BOOL sub_1B3893FB4()
{
  return sub_1B3895C08(0x64656C62616E65, 0xE700000000000000) > 0;
}

BOOL sub_1B3893FE8(uint64_t a1, uint64_t a2)
{
  return sub_1B3895C08(a1, a2) > 0;
}

uint64_t sub_1B3894020()
{
  sub_1B3859FE4(0, &qword_1EB7FB6B0);
  sub_1B38940D4(0xD000000000000015, 0x80000001B38A4070, (uint64_t)v2);
  if (v3)
  {
    if (swift_dynamicCast()) {
      return v1;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_1B38763B8((uint64_t)v2, &qword_1EB7FBE60);
    return 0;
  }
}

void sub_1B38940D4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_1B3894ED8(a1, a2, &v6);
  if (!v7)
  {
    sub_1B38763B8((uint64_t)&v6, &qword_1EB7FBE60);
    goto LABEL_6;
  }
  uint64_t v4 = sub_1B3859FE4(0, (unint64_t *)&qword_1EB7FB6A0);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_6:
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    return;
  }
  if (objc_msgSend(v5, sel_isKindOfClass_, swift_getObjCClassFromMetadata()))
  {
    *(void *)(a3 + 24) = v4;
    *(void *)a3 = v5;
  }
  else
  {
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
}

BOOL sub_1B38941E8()
{
  sub_1B389BE20();
  OUTLINED_FUNCTION_1();
  MEMORY[0x1F4188790](v0);
  OUTLINED_FUNCTION_29();
  sub_1B389BE10();
  sub_1B389BDD0();
  double v2 = v1;
  OUTLINED_FUNCTION_2_11();
  v3();
  return sub_1B38932E4() < v2;
}

id sub_1B38942AC(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();
  uint64_t v6 = v5;

  if (v6)
  {
    uint64_t v7 = (void *)sub_1B389C280();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t sub_1B389432C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
  MEMORY[0x1F4188790](v0 - 8);
  OUTLINED_FUNCTION_29();
  uint64_t v3 = v2 - v1;
  sub_1B3894420(v2 - v1);
  uint64_t v4 = sub_1B389BD00();
  if (__swift_getEnumTagSinglePayload(v3, 1, v4) == 1)
  {
    sub_1B38763B8(v3, (uint64_t *)&unk_1EB7FBF88);
    return 0;
  }
  else
  {
    uint64_t v5 = sub_1B389BC40();
    OUTLINED_FUNCTION_17();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v3, v4);
  }
  return v5;
}

uint64_t sub_1B3894420@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
  MEMORY[0x1F4188790](v2 - 8);
  OUTLINED_FUNCTION_29();
  uint64_t v5 = v4 - v3;
  if (qword_1EB7FAB80 != -1) {
    swift_once();
  }
  sub_1B389456C(v5);
  uint64_t v6 = sub_1B389BD00();
  if (__swift_getEnumTagSinglePayload(v5, 1, v6) == 1)
  {
    sub_1B38763B8(v5, (uint64_t *)&unk_1EB7FBF88);
    return sub_1B389456C(a1);
  }
  else
  {
    OUTLINED_FUNCTION_17();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(a1, v5, v6);
    return __swift_storeEnumTagSinglePayload(a1, 0, 1, v6);
  }
}

uint64_t sub_1B389456C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
  uint64_t v3 = MEMORY[0x1F4188790](v2 - 8);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  uint64_t v7 = (char *)v22 - v6;
  sub_1B3859FE4(0, &qword_1EB7FB6B0);
  uint64_t v8 = OUTLINED_FUNCTION_11_4();
  sub_1B38940D4(v8, v9, v10);
  if (!v24)
  {
    sub_1B38763B8((uint64_t)v23, &qword_1EB7FBE60);
    goto LABEL_8;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    goto LABEL_9;
  }
  if (v26)
  {
    swift_bridgeObjectRetain();
    if (sub_1B389C380() < 1)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_1B389BCC0();
      swift_bridgeObjectRelease();
      uint64_t v11 = sub_1B389BD00();
      if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v11) != 1)
      {
        uint64_t v20 = (uint64_t)v7;
        goto LABEL_22;
      }
      sub_1B38763B8((uint64_t)v7, (uint64_t *)&unk_1EB7FBF88);
    }
  }
LABEL_9:
  uint64_t v12 = OUTLINED_FUNCTION_11_4();
  sub_1B38940D4(v12, v13, v14);
  if (v24)
  {
    int v15 = swift_dynamicCast();
    uint64_t v16 = v22[0];
    uint64_t v17 = v22[1];
    if (!v15)
    {
      uint64_t v16 = 0;
      uint64_t v17 = 0;
    }
  }
  else
  {
    sub_1B38763B8((uint64_t)v23, &qword_1EB7FBE60);
    uint64_t v16 = 0;
    uint64_t v17 = 0;
  }
  uint64_t v25 = v16;
  uint64_t v26 = v17;
  swift_bridgeObjectRelease();
  if (!v26) {
    goto LABEL_18;
  }
  swift_bridgeObjectRetain();
  if (sub_1B389C380() < 1)
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  sub_1B389BCC0();
  swift_bridgeObjectRelease();
  uint64_t v18 = sub_1B389BD00();
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v18) != 1)
  {
    uint64_t v20 = (uint64_t)v5;
LABEL_22:
    sub_1B3896A04(v20, a1, (uint64_t *)&unk_1EB7FBF88);
    return swift_bridgeObjectRelease();
  }
  sub_1B38763B8((uint64_t)v5, (uint64_t *)&unk_1EB7FBF88);
LABEL_18:
  uint64_t v19 = sub_1B389BD00();
  __swift_storeEnumTagSinglePayload(a1, 1, 1, v19);
  return swift_bridgeObjectRelease();
}

id sub_1B3894840(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = *(void *)(v2 + OBJC_IVAR____TtC20PegasusConfiguration14ConfigInternal_data);
  unint64_t v7 = *(void *)(v2 + OBJC_IVAR____TtC20PegasusConfiguration14ConfigInternal_data + 8);
  uint64_t v8 = *(void **)(v2 + OBJC_IVAR____TtC20PegasusConfiguration14ConfigInternal_userDefaults);
  id v9 = objc_allocWithZone(ObjectType);
  sub_1B386CEF8(v6, v7);
  id v10 = v8;
  swift_bridgeObjectRetain();
  return sub_1B3894954(v6, v7, a1, a2, v8);
}

id sub_1B3894954(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, id a5)
{
  uint64_t v6 = v5;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v13 = OBJC_IVAR____TtC20PegasusConfiguration14ConfigInternal_userDefaults;
  *(void *)&v6[OBJC_IVAR____TtC20PegasusConfiguration14ConfigInternal_userDefaults] = 0;
  uint64_t v14 = (uint64_t *)&v6[OBJC_IVAR____TtC20PegasusConfiguration14ConfigInternal_data];
  *uint64_t v14 = a1;
  v14[1] = a2;
  int v15 = &v6[OBJC_IVAR____TtC20PegasusConfiguration14ConfigInternal_userAgent];
  *(void *)int v15 = a3;
  *((void *)v15 + 1) = a4;
  if (a4)
  {
    uint64_t v16 = v6;
    sub_1B386CEF8(a1, a2);
    swift_bridgeObjectRetain();
    Client.init(_:)(a4, v25);
    uint64_t v17 = v25[2];
    uint64_t v18 = &v16[OBJC_IVAR____TtC20PegasusConfiguration14ConfigInternal_clientName];
    *(void *)uint64_t v18 = v25[1];
    *((void *)v18 + 1) = v17;
    if (a5)
    {
LABEL_3:
      uint64_t v19 = *(void **)&v6[v13];
      *(void *)&v6[v13] = a5;
      a5 = a5;
      goto LABEL_8;
    }
  }
  else
  {
    *(_OWORD *)&v6[OBJC_IVAR____TtC20PegasusConfiguration14ConfigInternal_clientName] = xmmword_1B38A12A0;
    uint64_t v20 = v6;
    sub_1B386CEF8(a1, a2);
    if (a5) {
      goto LABEL_3;
    }
  }
  id v21 = objc_allocWithZone(MEMORY[0x1E4F1CB18]);
  id v22 = sub_1B38964F4(0xD000000000000011, 0x80000001B38A1890);
  if (!v22) {
    id v22 = objc_msgSend(self, sel_standardUserDefaults);
  }
  uint64_t v19 = *(void **)&v6[v13];
  *(void *)&v6[v13] = v22;
LABEL_8:

  v26.receiver = v6;
  v26.super_class = ObjectType;
  id v23 = objc_msgSendSuper2(&v26, sel_init);

  sub_1B386CE50(a1, a2);
  return v23;
}

uint64_t type metadata accessor for ConfigFactoryInternal()
{
  return self;
}

void sub_1B3894B20(void *a1)
{
  uint64_t v3 = (void *)sub_1B389BD30();
  if (qword_1E9CCEC70 != -1) {
    swift_once();
  }
  uint64_t v4 = (void *)sub_1B389C280();
  objc_msgSend(a1, sel_encodeObject_forKey_, v3, v4);

  if (*(void *)(v1 + OBJC_IVAR____TtC20PegasusConfiguration14ConfigInternal_userAgent + 8)) {
    uint64_t v5 = sub_1B389C280();
  }
  else {
    uint64_t v5 = 0;
  }
  if (qword_1E9CCEC78 != -1) {
    swift_once();
  }
  id v6 = (id)sub_1B389C280();
  objc_msgSend(a1, sel_encodeObject_forKey_, v5, v6);
  swift_unknownObjectRelease();
}

id sub_1B3894CD8(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  sub_1B3859FE4(0, &qword_1E9CCF4E8);
  uint64_t v4 = qword_1E9CCEC70;
  id v5 = v1;
  if (v4 != -1) {
    swift_once();
  }
  id v6 = (void *)OUTLINED_FUNCTION_10_4(&qword_1E9CCF710);
  sub_1B3859FE4(0, &qword_1EB7FB6B0);
  if (qword_1E9CCEC78 != -1) {
    swift_once();
  }
  unint64_t v7 = (void *)OUTLINED_FUNCTION_10_4(&qword_1E9CCF720);
  uint64_t v8 = v7;
  if (!v6)
  {

LABEL_10:
    uint64_t v21 = swift_getObjectType();
    OUTLINED_FUNCTION_8_6(v21);
    return 0;
  }
  if (!v7)
  {

    uint64_t v8 = v5;
    goto LABEL_10;
  }
  id v9 = v7;
  id v10 = v6;

  id v11 = v10;
  uint64_t v12 = sub_1B389BD40();
  unint64_t v14 = v13;

  uint64_t v15 = sub_1B389C2B0();
  uint64_t v17 = v16;
  id v18 = objc_allocWithZone(ObjectType);
  id v19 = sub_1B3894954(v12, v14, v15, v17, 0);

  uint64_t v20 = swift_getObjectType();
  OUTLINED_FUNCTION_8_6(v20);
  return v19;
}

void sub_1B3894ED8(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (sub_1B389C380() <= 0)
  {
LABEL_21:
    *a3 = 0u;
    a3[1] = 0u;
    return;
  }
  *(void *)&long long v26 = 778527074;
  *((void *)&v26 + 1) = 0xE400000000000000;
  sub_1B389C3C0();
  unint64_t v7 = *(void **)(v3 + OBJC_IVAR____TtC20PegasusConfiguration14ConfigInternal_userDefaults);
  if (!v7)
  {
    uint64_t v12 = a3;
    long long v29 = 0u;
    long long v30 = 0u;
    goto LABEL_13;
  }
  uint64_t v8 = v26;
  id v9 = v7;
  id v10 = (void *)sub_1B389C280();
  id v11 = objc_msgSend(v9, sel_objectForKey_, v10);

  if (v11)
  {
    sub_1B389C730();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v28, 0, sizeof(v28));
  }
  sub_1B3896A04((uint64_t)v28, (uint64_t)&v29, &qword_1EB7FBE60);
  if (!*((void *)&v30 + 1))
  {
    uint64_t v12 = a3;
LABEL_13:
    swift_bridgeObjectRelease();
    sub_1B38763B8((uint64_t)&v29, &qword_1EB7FBE60);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FB6C0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1B389D510;
    *(void *)(inited + 32) = a1;
    *(void *)(inited + 40) = a2;
    *(void *)(inited + 48) = 0x656469727265766FLL;
    *(void *)(inited + 56) = 0xE900000000000073;
    swift_bridgeObjectRetain();
    sub_1B3896834(inited);
    uint64_t v27 = 0;
    uint64_t v20 = (void *)sub_1B389BD30();
    uint64_t v21 = (void *)sub_1B389C550();
    swift_bridgeObjectRelease();
    _CFPropertyListCreateFiltered();

    a3 = v12;
    if (qword_1EB7FAAD0 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_1B389C1B0();
    __swift_project_value_buffer(v22, (uint64_t)qword_1EB7FC128);
    id v23 = sub_1B389C190();
    os_log_type_t v24 = sub_1B389C590();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_1B3850000, v23, v24, "Could not parse mapped plist", v25, 2u);
      a3 = v12;
      OUTLINED_FUNCTION_5();
    }

    goto LABEL_21;
  }
  sub_1B386D320(&v29, &v26);
  if (qword_1EB7FAAD0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_1B389C1B0();
  __swift_project_value_buffer(v13, (uint64_t)qword_1EB7FC128);
  sub_1B3855FF8((uint64_t)&v26, (uint64_t)&v29);
  swift_bridgeObjectRetain();
  unint64_t v14 = sub_1B389C190();
  os_log_type_t v15 = sub_1B389C5A0();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 136315394;
    sub_1B3855FF8((uint64_t)&v29, (uint64_t)v28);
    uint64_t v17 = sub_1B389C300();
    *(void *)&v28[0] = sub_1B3855F24(v17, v18, &v27);
    sub_1B389C6C0();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v29);
    *(_WORD *)(v16 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)&v28[0] = sub_1B3855F24(v8, 0xE400000000000000, &v27);
    sub_1B389C6C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1B3850000, v14, v15, "Found value: %s for key: %s from userDefaults", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_5();
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v29);

    swift_bridgeObjectRelease_n();
  }
  sub_1B386D320(&v26, a3);
}

uint64_t sub_1B3895C08(uint64_t a1, uint64_t a2)
{
  sub_1B3859FE4(0, (unint64_t *)&qword_1EB7FBDD0);
  sub_1B38940D4(a1, a2, (uint64_t)v6);
  if (v7)
  {
    if (swift_dynamicCast()) {
      return v5;
    }
  }
  else
  {
    sub_1B38763B8((uint64_t)v6, &qword_1EB7FBE60);
  }
  return 0;
}

void sub_1B3895D1C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
}

void sub_1B3895E98(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
}

void sub_1B3896004()
{
}

id _s20PegasusConfiguration21ConfigFactoryInternalCfD_0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1B38960F8()
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = self;
  uint64_t v1 = (void *)sub_1B389BD30();
  id v18 = 0;
  id v2 = objc_msgSend(v0, sel_propertyListWithData_options_format_error_, v1, 0, 0, &v18);

  id v3 = v18;
  if (!v2)
  {
    uint64_t v5 = v3;
    id v6 = (void *)sub_1B389BC00();

    swift_willThrow();
    if (qword_1EB7FAAD0 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_1B389C1B0();
    __swift_project_value_buffer(v7, (uint64_t)qword_1EB7FC128);
    uint64_t v8 = sub_1B389C190();
    os_log_type_t v9 = sub_1B389C5B0();
    if (os_log_type_enabled(v8, v9))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      OUTLINED_FUNCTION_92(&dword_1B3850000, v10, v11, "Config property list cannot be deserialized.");
      OUTLINED_FUNCTION_5();
    }

    return 0;
  }
  sub_1B389C730();
  swift_unknownObjectRelease();
  sub_1B386D320(v19, v20);
  sub_1B3855FF8((uint64_t)v20, (uint64_t)v19);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FAB70);
  if (!swift_dynamicCast())
  {
    if (qword_1EB7FAAD0 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_1B389C1B0();
    __swift_project_value_buffer(v12, (uint64_t)qword_1EB7FC128);
    uint64_t v13 = sub_1B389C190();
    os_log_type_t v14 = sub_1B389C5B0();
    if (os_log_type_enabled(v13, v14))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      OUTLINED_FUNCTION_92(&dword_1B3850000, v15, v16, "Config property list is not Dictionary");
      OUTLINED_FUNCTION_5();
    }

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v20);
    return 0;
  }
  id v4 = v18;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v20);
  return v4;
}

void sub_1B3896410(void *a1, uint64_t a2)
{
  v4[1] = *(id *)MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (objc_msgSend(a1, sel_seekToOffset_error_, a2, v4))
  {
    MEMORY[0x1F41818D8]();
  }
  else
  {
    id v2 = v4[0];
    id v3 = (void *)sub_1B389BC00();

    swift_willThrow();
  }
}

id sub_1B38964F4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = (void *)sub_1B389C280();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v3 = 0;
  }
  id v4 = objc_msgSend(v2, sel_initWithSuiteName_, v3);

  return v4;
}

uint64_t sub_1B3896558(uint64_t a1)
{
  uint64_t v2 = sub_1B389BF60();
  OUTLINED_FUNCTION_1();
  uint64_t v30 = v3;
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  MEMORY[0x1F4188790](v5);
  uint64_t v34 = (char *)&v25 - v6;
  if (!*(void *)(a1 + 16))
  {
    uint64_t v8 = MEMORY[0x1E4FBC870];
    goto LABEL_16;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FA8B8);
  uint64_t result = sub_1B389C790();
  uint64_t v8 = result;
  uint64_t v29 = *(void *)(a1 + 16);
  if (!v29)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return v8;
  }
  unint64_t v9 = 0;
  uint64_t v28 = a1 + ((*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80));
  uint64_t v32 = v30 + 16;
  uint64_t v33 = result + 56;
  uint64_t v10 = (void (**)(void))(v30 + 8);
  uint64_t v26 = a1;
  uint64_t v27 = (uint64_t (**)(uint64_t, char *, uint64_t))(v30 + 32);
  while (v9 < *(void *)(a1 + 16))
  {
    uint64_t v11 = *(void *)(v30 + 72);
    uint64_t v12 = *(void (**)(void))(v30 + 16);
    OUTLINED_FUNCTION_12_3();
    v12();
    sub_1B3896A64((unint64_t *)&unk_1EB7FA450, MEMORY[0x1E4F27C88]);
    uint64_t v13 = sub_1B389C240() & ~(-1 << *(unsigned char *)(v8 + 32));
    OUTLINED_FUNCTION_6_5();
    if ((v16 & v15) != 0)
    {
      unint64_t v31 = v9;
      uint64_t v18 = ~v17;
      while (1)
      {
        OUTLINED_FUNCTION_12_3();
        v12();
        sub_1B3896A64((unint64_t *)&unk_1E9CCEB38, MEMORY[0x1E4F27C88]);
        char v19 = sub_1B389C270();
        uint64_t v20 = *v10;
        OUTLINED_FUNCTION_2_11();
        v20();
        if (v19) {
          break;
        }
        uint64_t v13 = (v13 + 1) & v18;
        OUTLINED_FUNCTION_6_5();
        if ((v15 & v16) == 0)
        {
          a1 = v26;
          unint64_t v9 = v31;
          goto LABEL_10;
        }
      }
      OUTLINED_FUNCTION_2_11();
      uint64_t result = ((uint64_t (*)(void))v20)();
      a1 = v26;
      unint64_t v9 = v31;
    }
    else
    {
LABEL_10:
      uint64_t v21 = v34;
      *(void *)(v33 + 8 * v14) = v16 | v15;
      uint64_t result = (*v27)(*(void *)(v8 + 48) + v13 * v11, v21, v2);
      uint64_t v22 = *(void *)(v8 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23) {
        goto LABEL_18;
      }
      *(void *)(v8 + 16) = v24;
    }
    if (++v9 == v29) {
      goto LABEL_16;
    }
  }
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_1B3896834(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = MEMORY[0x1E4FBC870];
    goto LABEL_25;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FB6B8);
  uint64_t result = sub_1B389C790();
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
    sub_1B389CA10();
    swift_bridgeObjectRetain();
    sub_1B389C370();
    uint64_t result = sub_1B389CA40();
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
      if (v16 || (uint64_t result = sub_1B389C920(), (result & 1) != 0))
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
          uint64_t result = sub_1B389C920();
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

uint64_t sub_1B3896A04(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_17();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_1B3896A64(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_8_6(uint64_t a1)
{
  return MEMORY[0x1F41864A0](v1, a1, 64, 7);
}

void sub_1B3896AF8()
{
  unk_1E9CCEA66 = -4864;
}

uint64_t static LegacyDataWarehouseConfig.mainFolderName.getter()
{
  return sub_1B3891594(&qword_1E9CCEA68, &qword_1E9CCEA58);
}

unint64_t static LegacyDataWarehouseConfig.databaseName.getter()
{
  return 0xD000000000000011;
}

void sub_1B3896B6C()
{
  qword_1E9CCEA90 = 0x6568635361746144;
  *(void *)algn_1E9CCEA98 = 0xEB0000000073616DLL;
}

uint64_t static LegacyDataWarehouseConfig.schemaSubfolderName.getter()
{
  return sub_1B3891594(&qword_1E9CCEAA0, &qword_1E9CCEA90);
}

void sub_1B3896BC0()
{
  qword_1E9CCEA70 = 1852797802;
  unk_1E9CCEA78 = 0xE400000000000000;
}

uint64_t static LegacyDataWarehouseConfig.schemaExtension.getter()
{
  return sub_1B3891594(&qword_1E9CCEA88, &qword_1E9CCEA70);
}

void sub_1B3896C04()
{
  qword_1E9CCEA38 = 0x73756F6865726177;
  unk_1E9CCEA40 = 0xE900000000000065;
}

uint64_t static LegacyDataWarehouseConfig.databaseAlias.getter()
{
  return sub_1B3891594(&qword_1E9CCEA50, &qword_1E9CCEA38);
}

uint64_t LegacyDataWarehouseConfig.dataWarehouseUrl.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1B389BD00();
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t LegacyDataWarehouseConfig.streamDescriptor.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for LegacyDataWarehouseConfig();
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 20));
  return result;
}

uint64_t type metadata accessor for LegacyDataWarehouseConfig()
{
  uint64_t result = qword_1E9CCEAA8;
  if (!qword_1E9CCEAA8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t LegacyDataWarehouseConfig.databaseUrl.getter()
{
  uint64_t v1 = sub_1B389BC30();
  OUTLINED_FUNCTION_1();
  uint64_t v3 = v2;
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_3_1();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v0, *MEMORY[0x1E4F276B8], v1);
  sub_1B38538CC();
  sub_1B389BCF0();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  return swift_bridgeObjectRelease();
}

uint64_t LegacyDataWarehouseConfig.schemaFolderUrl.getter()
{
  uint64_t v1 = sub_1B389BC30();
  OUTLINED_FUNCTION_1();
  uint64_t v3 = v2;
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_3_1();
  if (qword_1E9CCEAA0 != -1) {
    swift_once();
  }
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v0, *MEMORY[0x1E4F276A8], v1);
  sub_1B38538CC();
  swift_bridgeObjectRetain();
  sub_1B389BCF0();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  return swift_bridgeObjectRelease();
}

uint64_t LegacyDataWarehouseConfig.contextSchemaUrl.getter@<X0>(uint64_t a1@<X8>)
{
  return URL.legacyAggregationSchemaUrl(forMessageName:)(0xD000000000000020, 0x80000001B38A3E50, a1);
}

uint64_t URL.legacyAggregationSchemaUrl(forMessageName:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v25 = a1;
  uint64_t v26 = a2;
  uint64_t v28 = a3;
  sub_1B389BC30();
  OUTLINED_FUNCTION_1();
  uint64_t v4 = v3;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_5_7();
  uint64_t v27 = sub_1B389BD00();
  OUTLINED_FUNCTION_1();
  uint64_t v24 = v6;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_4_2();
  uint64_t v10 = v8 - v9;
  MEMORY[0x1F4188790](v11);
  uint64_t v23 = (char *)&v23 - v12;
  if (qword_1E9CCEAA0 != -1) {
    swift_once();
  }
  uint64_t v29 = qword_1E9CCEA90;
  uint64_t v30 = *(void *)algn_1E9CCEA98;
  uint64_t v13 = *(void (**)(uint64_t))(v4 + 104);
  uint64_t v14 = OUTLINED_FUNCTION_4_13();
  v13(v14);
  sub_1B38538CC();
  swift_bridgeObjectRetain();
  sub_1B389BCF0();
  uint64_t v15 = *(void (**)(uint64_t))(v4 + 8);
  uint64_t v16 = OUTLINED_FUNCTION_7_7();
  v15(v16);
  swift_bridgeObjectRelease();
  uint64_t v29 = v25;
  uint64_t v30 = v26;
  uint64_t v17 = OUTLINED_FUNCTION_4_13();
  v13(v17);
  uint64_t v18 = v23;
  sub_1B389BCF0();
  uint64_t v19 = OUTLINED_FUNCTION_7_7();
  v15(v19);
  uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
  uint64_t v21 = v27;
  v20(v10, v27);
  if (qword_1E9CCEA88 != -1) {
    swift_once();
  }
  sub_1B389BC70();
  return ((uint64_t (*)(char *, uint64_t))v20)(v18, v21);
}

uint64_t LegacyDataWarehouseConfig.metricsSchemaUrl.getter@<X0>(uint64_t a1@<X8>)
{
  if (*(unsigned char *)(v1 + *(int *)(type metadata accessor for LegacyDataWarehouseConfig() + 20)) == 2)
  {
    unint64_t v7 = FeedbackStreamDescriptor.rawValue.getter();
    uint64_t v8 = v3;
    swift_bridgeObjectRetain();
    sub_1B389C3C0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1B389C3C0();
    swift_bridgeObjectRelease();
    uint64_t v4 = v7;
    uint64_t v5 = v8;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0xE000000000000000;
  }
  URL.legacyAggregationSchemaUrl(forMessageName:)(v4, v5, a1);

  return swift_bridgeObjectRelease();
}

unint64_t LegacyDataWarehouseConfig.attachSQLStatementString.getter()
{
  uint64_t v1 = sub_1B389BD00();
  OUTLINED_FUNCTION_1();
  uint64_t v3 = v2;
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_3_1();
  sub_1B389C7B0();
  swift_bridgeObjectRelease();
  LegacyDataWarehouseConfig.databaseUrl.getter();
  sub_1B38566CC();
  sub_1B389C8F0();
  sub_1B389C3C0();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  sub_1B389C3C0();
  if (qword_1E9CCEA50 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_1B389C3C0();
  swift_bridgeObjectRelease();
  return 0xD000000000000011;
}

unint64_t LegacyDataWarehouseConfig.detachSQLStatementString.getter()
{
  if (qword_1E9CCEA50 != -1) {
    swift_once();
  }
  return 0xD000000000000019;
}

uint64_t LegacyDataWarehouseConfig.init(dataWarehouseUrl:streamDescriptor:fileManager:)@<X0>(uint64_t a1@<X0>, unsigned __int8 *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v30 = a4;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
  MEMORY[0x1F4188790](v9 - 8);
  OUTLINED_FUNCTION_4_2();
  uint64_t v12 = v10 - v11;
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)&v29 - v14;
  uint64_t v16 = sub_1B389BD00();
  OUTLINED_FUNCTION_1();
  uint64_t v18 = v17;
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_5_7();
  int v20 = *a2;
  sub_1B3891D68(a1, v12);
  if (__swift_getEnumTagSinglePayload(v12, 1, v16) == 1)
  {
    uint64_t v29 = v18;
    unsigned __int8 v32 = v20;
    NSFileManager.legacyDataWarehouseUrl(for:)(&v32, (uint64_t)v15);
    if (v4)
    {

      sub_1B38877AC(a1);
      uint64_t v21 = v12;
      return sub_1B38877AC(v21);
    }
    sub_1B38877AC(v12);
    uint64_t v18 = v29;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 32))(v15, v12, v16);
    __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v16);
  }
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16) == 1)
  {
    sub_1B38877AC((uint64_t)v15);
    sub_1B38922AC();
    swift_allocError();
    *BOOL v22 = 0;
    v22[1] = 0;
    swift_willThrow();

    uint64_t v21 = a1;
    return sub_1B38877AC(v21);
  }
  int v31 = v20;
  uint64_t v29 = a1;
  uint64_t v24 = *(uint64_t (**)(void))(v18 + 32);
  ((void (*)(uint64_t, char *, uint64_t))v24)(v5, v15, v16);
  if (sub_1B389BC20())
  {

    sub_1B38877AC(v29);
    *(unsigned char *)(v30 + *(int *)(type metadata accessor for LegacyDataWarehouseConfig() + 20)) = v31;
    return v24();
  }
  else
  {
    uint64_t v25 = sub_1B389BC40();
    uint64_t v27 = v26;
    sub_1B38922AC();
    swift_allocError();
    *uint64_t v28 = v25;
    v28[1] = v27;
    swift_willThrow();

    sub_1B38877AC(v29);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 8))(v5, v16);
  }
}

uint64_t NSFileManager.legacyDataWarehouseUrl(for:)@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v48 = a2;
  uint64_t v4 = sub_1B389BC30();
  OUTLINED_FUNCTION_1();
  uint64_t v49 = v5;
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1B389BD00();
  OUTLINED_FUNCTION_1();
  uint64_t v14 = v13;
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_4_2();
  uint64_t v18 = v16 - v17;
  MEMORY[0x1F4188790](v19);
  uint64_t v21 = (char *)v42 - v20;
  int v22 = *a1;
  uint64_t v23 = v50;
  sub_1B3858A8C(v2);
  if (v23)
  {

    __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, v12);
LABEL_4:
    sub_1B38877AC((uint64_t)v11);
    sub_1B387FCF4();
    swift_allocError();
    *uint64_t v24 = 0;
    v24[1] = 0;
    return swift_willThrow();
  }
  uint64_t v45 = 0;
  uint64_t v46 = v18;
  uint64_t v50 = v21;
  uint64_t v47 = v8;
  uint64_t v44 = v4;
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v12);
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12) == 1) {
    goto LABEL_4;
  }
  int v43 = v22;
  uint64_t v26 = v14;
  uint64_t v27 = v50;
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v50, v11, v12);
  if (qword_1EB7FAAD0 != -1) {
    swift_once();
  }
  uint64_t v28 = sub_1B389C1B0();
  __swift_project_value_buffer(v28, (uint64_t)qword_1EB7FC128);
  uint64_t v29 = v46;
  (*(void (**)(uint64_t, char *, uint64_t))(v14 + 16))(v46, v27, v12);
  uint64_t v30 = sub_1B389C190();
  os_log_type_t v31 = sub_1B389C590();
  if (os_log_type_enabled(v30, v31))
  {
    unsigned __int8 v32 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    v51[0] = v33;
    *(_DWORD *)unsigned __int8 v32 = 136315138;
    v42[1] = v32 + 4;
    sub_1B38566CC();
    uint64_t v34 = sub_1B389C8F0();
    size_t v51[3] = sub_1B3855F24(v34, v35, v51);
    sub_1B389C6C0();
    swift_bridgeObjectRelease();
    uint64_t v36 = *(void (**)(void))(v26 + 8);
    OUTLINED_FUNCTION_3_12();
    v36();
    _os_log_impl(&dword_1B3850000, v30, v31, "Container URL: %s", v32, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B3EBAF20](v33, -1, -1);
    MEMORY[0x1B3EBAF20](v32, -1, -1);
  }
  else
  {
    uint64_t v36 = *(void (**)(void))(v14 + 8);
    ((void (*)(uint64_t, uint64_t))v36)(v29, v12);
  }

  uint64_t v37 = v44;
  uint64_t v39 = v48;
  uint64_t v38 = v49;
  uint64_t v40 = v47;
  if (v43 == 2)
  {
    if (qword_1E9CCEA68 != -1) {
      swift_once();
    }
    v51[0] = qword_1E9CCEA58;
    v51[1] = unk_1E9CCEA60;
    (*(void (**)(char *, void, uint64_t))(v38 + 104))(v40, *MEMORY[0x1E4F276C0], v37);
    sub_1B38538CC();
    swift_bridgeObjectRetain();
    sub_1B389BCF0();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v40, v37);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_3_12();
    v36();
    uint64_t v41 = 0;
  }
  else
  {
    OUTLINED_FUNCTION_3_12();
    v36();
    uint64_t v41 = 1;
  }
  return __swift_storeEnumTagSinglePayload(v39, v41, 1, v12);
}

void *initializeBufferWithCopyOfBuffer for LegacyDataWarehouseConfig(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1B389BD00();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t destroy for LegacyDataWarehouseConfig(uint64_t a1)
{
  uint64_t v2 = sub_1B389BD00();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for LegacyDataWarehouseConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1B389BD00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithCopy for LegacyDataWarehouseConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1B389BD00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t initializeWithTake for LegacyDataWarehouseConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1B389BD00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for LegacyDataWarehouseConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1B389BD00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for LegacyDataWarehouseConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B3897FA0);
}

uint64_t sub_1B3897FA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1B389BD00();
  OUTLINED_FUNCTION_20();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unsigned int v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v9 >= 0x11) {
      return v9 - 16;
    }
    else {
      return 0;
    }
  }
}

uint64_t storeEnumTagSinglePayload for LegacyDataWarehouseConfig(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B389803C);
}

void sub_1B389803C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1B389BD00();
  OUTLINED_FUNCTION_20();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 16;
  }
}

uint64_t sub_1B38980C4()
{
  uint64_t result = sub_1B389BD00();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1B3898158()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t *sub_1B38981F8()
{
  uint64_t v1 = *v0;
  MEMORY[0x1B3EBAF20](*(uint64_t *)((char *)v0 + *(void *)(*v0 + 96)), -1, -1);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(void *)(*v0 + 88));
  return v0;
}

uint64_t sub_1B3898294()
{
  sub_1B38981F8();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t type metadata accessor for AtomicProperty()
{
  return __swift_instantiateGenericMetadata();
}

void sub_1B3898304()
{
  swift_checkMetadataState();
  if (v0 <= 0x3F)
  {
    sub_1B389969C();
    if (v1 <= 0x3F)
    {
      sub_1B389BE20();
      if (v2 <= 0x3F) {
        swift_initClassMetadata2();
      }
    }
  }
}

uint64_t sub_1B3898444()
{
  OUTLINED_FUNCTION_3_14();
  OUTLINED_FUNCTION_3_14();
  return (*(uint64_t (**)(void))(*(void *)(v0 + 88) + 24))();
}

uint64_t sub_1B389849C()
{
  OUTLINED_FUNCTION_3_14();
  OUTLINED_FUNCTION_3_14();
  return (*(uint64_t (**)(void))(*(void *)(v0 + 88) + 32))();
}

uint64_t sub_1B38984F4()
{
  OUTLINED_FUNCTION_3_14();
  OUTLINED_FUNCTION_3_14();
  return v1(*(void *)(v0 + 80));
}

uint64_t sub_1B3898564()
{
  OUTLINED_FUNCTION_3_14();
  uint64_t v2 = *(void *)(v1 + 80);
  OUTLINED_FUNCTION_0_13();
  MEMORY[0x1F4188790](v3);
  int v5 = (char *)v12 - v4;
  OUTLINED_FUNCTION_3_14();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v5, v0 + *(void *)(v6 + 112), v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCF578);
  if (swift_dynamicCast())
  {
    sub_1B3875FEC(v12, (uint64_t)v14);
    uint64_t v8 = v15;
    uint64_t v9 = v16;
    __swift_project_boxed_opaque_existential_1(v14, v15);
    char v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v8, v9);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v14);
  }
  else
  {
    uint64_t v13 = 0;
    memset(v12, 0, sizeof(v12));
    sub_1B3899F44((uint64_t)v12, (uint64_t *)&unk_1E9CCF580);
    char v10 = 0;
  }
  return v10 & 1;
}

uint64_t sub_1B38986AC()
{
  uint64_t v1 = sub_1B389BE20();
  OUTLINED_FUNCTION_3_0();
  uint64_t v3 = v2;
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_4_5();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v0 + *(void *)(v7 + 144), v1);
  sub_1B389BDB0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v1);
}

uint64_t sub_1B38987B8()
{
  return sub_1B389C300();
}

uint64_t sub_1B38987E8()
{
  uint64_t v1 = (uint64_t)v0;
  uint64_t v2 = *v0;
  uint64_t v41 = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FA850);
  uint64_t v4 = MEMORY[0x1F4188790](v3 - 8);
  uint64_t v6 = &v36[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v4);
  uint64_t v8 = &v36[-v7];
  uint64_t v46 = *(void *)(v2 + 80);
  OUTLINED_FUNCTION_3_0();
  uint64_t v10 = v9;
  uint64_t v12 = MEMORY[0x1F4188790](v11);
  MEMORY[0x1F4188790](v12);
  uint64_t v39 = *(void *)(v1 + 24);
  uint64_t v40 = (void *)(v1 + 24);
  uint64_t v38 = *(void *)(v1 + 32);
  int v37 = *(unsigned __int8 *)(v1 + 40);
  char v13 = *(unsigned char *)(v1 + 41);
  uint64_t v14 = *(void *)(v1 + 48);
  uint64_t v15 = *(void *)(v1 + 56);
  uint64_t v16 = *(void *)(v1 + 64);
  uint64_t v43 = *(void *)(v1 + 72);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v44 = v16;
  swift_bridgeObjectRetain();
  sub_1B38999C8(v14);
  OUTLINED_FUNCTION_73();
  uint64_t v42 = v10;
  uint64_t v45 = v14;
  if ((v13 & 1) == 0 && v15)
  {
    OUTLINED_FUNCTION_10_5();
    v17();
    OUTLINED_FUNCTION_9_3();
    sub_1B38570D0(v1, (uint64_t)v8);
    uint64_t v18 = sub_1B389C110();
    uint64_t result = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v18);
    if (result != 1)
    {
      OUTLINED_FUNCTION_73();
      uint64_t v21 = *(void *)(v1 + *(void *)(v20 + 128));
      uint64_t v22 = *(void *)(v41 + 88);
      swift_bridgeObjectRetain();
      sub_1B389956C((uint64_t)v8, v21, v39, v38, v37, v15, v10, v22);
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_46();
      v23();
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_46();
      v24();
      goto LABEL_7;
    }
LABEL_14:
    __break(1u);
    return result;
  }
  OUTLINED_FUNCTION_10_5();
  v25();
  OUTLINED_FUNCTION_9_3();
  sub_1B38570D0(v1, (uint64_t)v6);
  uint64_t v26 = sub_1B389C110();
  uint64_t result = __swift_getEnumTagSinglePayload((uint64_t)v6, 1, v26);
  if (result == 1)
  {
    __break(1u);
    goto LABEL_14;
  }
  OUTLINED_FUNCTION_73();
  sub_1B38994DC((uint64_t)v6, *(void *)(v1 + *(void *)(v27 + 128)), v10, *(void *)(v41 + 88));
  OUTLINED_FUNCTION_46();
  v28();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_46();
  v29();
LABEL_7:
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v31 = Strong;
    uint64_t v32 = type metadata accessor for ActivitySpan();
    sub_1B3882F30(v1, v31, v32, (uint64_t)&off_1F0C11C18);
    char v48 = 1;
    *(void *)&v47[14] = 0;
    *(void *)&v47[6] = 0;
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v33 = v40;
    *uint64_t v40 = 0;
    v33[1] = 0;
    *((unsigned char *)v33 + 16) = 0;
    *(unsigned char *)(v1 + 41) = v48;
    *(_OWORD *)(v1 + 42) = *(_OWORD *)v47;
    uint64_t v34 = MEMORY[0x1E4FBC860];
    *(void *)(v1 + 56) = *(void *)&v47[14];
    *(void *)(v1 + 64) = v34;
    *(void *)(v1 + 72) = 0;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_73();
    *(unsigned char *)(v1 + *(void *)(v35 + 120)) = 1;
    return swift_weakAssign();
  }
  else
  {
    if (sub_1B3898564())
    {
      sub_1B389C5C0();
      sub_1B389C0B0();
    }
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1B3898CD4(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  OUTLINED_FUNCTION_4_5();
  uint64_t v10 = *(os_unfair_lock_s **)(*(void *)(v4 + *(void *)(v9 + 152)) + 16);
  swift_retain();
  os_unfair_lock_lock(v10);
  sub_1B3899B7C(v4, a1, a2, a3, a4);
  os_unfair_lock_unlock(v10);

  return swift_release();
}

uint64_t sub_1B3898D74()
{
  OUTLINED_FUNCTION_2_12();
  if ((*(unsigned char *)(v0 + *(void *)(v2 + 120)) & 1) == 0) {
    (*(void (**)(void))(v1 + 400))();
  }
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_17();
  (*(void (**)(void))(v3 + 8))();

  OUTLINED_FUNCTION_4_5();
  sub_1B3899F44(v0 + *(void *)(v4 + 136), (uint64_t *)&unk_1EB7FA850);
  OUTLINED_FUNCTION_4_5();
  sub_1B389BE20();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_46();
  v5();
  swift_release();
  return v0;
}

uint64_t sub_1B3898EE0()
{
  OUTLINED_FUNCTION_4_5();
  return (*(uint64_t (**)(uint64_t (*)(), void))(v0 + 408))(nullsub_1, 0);
}

uint64_t sub_1B3898F28(void (*a1)(void))
{
  OUTLINED_FUNCTION_4_5();
  uint64_t v4 = *(os_unfair_lock_s **)(*(void *)(v1 + *(void *)(v3 + 152)) + 16);
  swift_retain();
  os_unfair_lock_lock(v4);
  sub_1B3899978(v1, a1);
  os_unfair_lock_unlock(v4);

  return swift_release();
}

uint64_t sub_1B3898FB0()
{
  OUTLINED_FUNCTION_3_14();
  type metadata accessor for ActivitySpan.ActivityData();
  swift_retain();
  sub_1B386F6B0((void (*)(void))sub_1B3899CC0);
  swift_release();
  sub_1B389C5B0();
  sub_1B389C0B0();
  sub_1B389C5B0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA930);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1B389D520;
  sub_1B38984F4();
  uint64_t v1 = sub_1B389C7D0();
  uint64_t v3 = v2;
  uint64_t v4 = MEMORY[0x1E4FBB1A0];
  *(void *)(v0 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v5 = sub_1B38579B4();
  *(void *)(v0 + 64) = v5;
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = v3;
  uint64_t v6 = sub_1B389849C();
  *(void *)(v0 + 96) = v4;
  *(void *)(v0 + 104) = v5;
  *(void *)(v0 + 72) = v6;
  *(void *)(v0 + 80) = v7;
  uint64_t v8 = sub_1B3898444();
  *(void *)(v0 + 136) = v4;
  *(void *)(v0 + 144) = v5;
  *(void *)(v0 + 112) = v8;
  *(void *)(v0 + 120) = v9;
  sub_1B389C0B0();
  swift_bridgeObjectRelease();
  if ((v21 & 1) == 0)
  {
    sub_1B389C5B0();
    uint64_t v10 = OUTLINED_FUNCTION_4_14();
    *(_OWORD *)(v10 + 16) = xmmword_1B389D500;
    uint64_t v11 = sub_1B389C7D0();
    *(void *)(v10 + 56) = v4;
    *(void *)(v10 + 64) = v5;
    *(void *)(v10 + 32) = v11;
    *(void *)(v10 + 40) = v12;
    OUTLINED_FUNCTION_5_8();
    swift_bridgeObjectRelease();
    if (v23)
    {
      swift_bridgeObjectRetain();
      sub_1B389C5B0();
      uint64_t v13 = OUTLINED_FUNCTION_4_14();
      *(_OWORD *)(v13 + 16) = xmmword_1B389D500;
      *(void *)(v13 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCF358);
      *(void *)(v13 + 64) = sub_1B3884F44(&qword_1E9CCF360, &qword_1E9CCF358);
      *(void *)(v13 + 32) = v23;
      OUTLINED_FUNCTION_5_8();
      swift_bridgeObjectRelease();
    }
  }
  if (v22)
  {
    swift_bridgeObjectRetain();
    sub_1B389C5B0();
    uint64_t v14 = OUTLINED_FUNCTION_4_14();
    *(_OWORD *)(v14 + 16) = xmmword_1B389D500;
    *(void *)(v14 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9CCF348);
    *(void *)(v14 + 64) = sub_1B3884F44(&qword_1E9CCF350, &qword_1E9CCF348);
    *(void *)(v14 + 32) = v22;
    OUTLINED_FUNCTION_5_8();
    swift_bridgeObjectRelease();
  }
  if (v24 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_1B389C860();
    uint64_t v15 = result;
    if (!result) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v15 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v15) {
      goto LABEL_13;
    }
  }
  if (v15 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v17 = 0;
  do
  {
    ++v17;
    swift_unknownObjectRetain();
    sub_1B389C5B0();
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_1B389D500;
    swift_unknownObjectRetain();
    uint64_t v19 = sub_1B389C300();
    *(void *)(v18 + 56) = v4;
    *(void *)(v18 + 64) = v5;
    *(void *)(v18 + 32) = v19;
    *(void *)(v18 + 40) = v20;
    sub_1B389C0B0();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
  }
  while (v15 != v17);
LABEL_13:
  swift_bridgeObjectRelease();
  sub_1B389C5B0();
  sub_1B389C0B0();
  if (sub_1B3898564())
  {
    sub_1B389C5C0();
    sub_1B389C0B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_unknownObjectRelease();
}

uint64_t sub_1B38994DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1B389C5E0();
  (*(void (**)(uint64_t, uint64_t))(a4 + 40))(a3, a4);

  return sub_1B389C0D0();
}

void sub_1B389956C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16 = sub_1B389C5E0();
  uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(a8 + 40))(a7, a8);
  LOBYTE(v20) = a5;
  sub_1B38587B8(v16, a2, v17, v18, v19, a1, a3, a4, v20, a6);
}

uint64_t sub_1B389962C()
{
  sub_1B3898D74();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t type metadata accessor for ActivitySpan()
{
  return __swift_instantiateGenericMetadata();
}

void sub_1B389969C()
{
  if (!qword_1EB7FA860)
  {
    sub_1B389C110();
    unint64_t v0 = sub_1B389C660();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB7FA860);
    }
  }
}

uint64_t sub_1B38996F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 40);
}

uint64_t sub_1B38996FC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_unknownObjectRelease();
}

uint64_t sub_1B3899748(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  uint64_t v3 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v3;
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  return a1;
}

uint64_t sub_1B38997B0(uint64_t a1, long long *a2)
{
  long long v4 = *a2;
  *(_WORD *)(a1 + 16) = *((_WORD *)a2 + 8);
  *(_OWORD *)a1 = v4;
  *(void *)(a1 + 24) = *((void *)a2 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *((void *)a2 + 4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *((void *)a2 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *((void *)a2 + 6);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
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

uint64_t sub_1B389986C(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_unknownObjectRelease();
  return a1;
}

uint64_t sub_1B38998D4(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 56))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 40);
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

uint64_t sub_1B3899914(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for ActivitySpan.ActivityData()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1B3899978(uint64_t result, void (*a2)(void))
{
  if ((*(unsigned char *)(result + *(void *)(*(void *)result + 120)) & 1) == 0)
  {
    a2();
    return sub_1B38987E8();
  }
  return result;
}

void sub_1B38999C8(uint64_t a1)
{
  if (sub_1B3899CC8(a1))
  {
    OUTLINED_FUNCTION_4_5();
    sub_1B389C5A0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7FA930);
    uint64_t v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_1B389D510;
    uint64_t v2 = sub_1B389849C();
    uint64_t v4 = v3;
    uint64_t v5 = MEMORY[0x1E4FBB1A0];
    *(void *)(v1 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v6 = sub_1B38579B4();
    *(void *)(v1 + 64) = v6;
    *(void *)(v1 + 32) = v2;
    *(void *)(v1 + 40) = v4;
    sub_1B3881E1C();
    OUTLINED_FUNCTION_12_4();
    uint64_t v7 = sub_1B389C220();
    *(void *)(v1 + 96) = v5;
    *(void *)(v1 + 104) = v6;
    *(void *)(v1 + 72) = v7;
    *(void *)(v1 + 80) = v8;
    sub_1B389C0B0();
    swift_bridgeObjectRelease();
    sub_1B3898444();
    sub_1B389849C();
    sub_1B386EFA8();
    uint64_t v9 = (void *)sub_1B389C280();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_12_4();
    id v10 = (id)sub_1B389C200();
    AnalyticsSendEvent();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1B3899B7C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  *(void *)(a1 + 24) = a2;
  *(void *)(a1 + 32) = a3;
  *(unsigned char *)(a1 + 40) = a4;
  *(unsigned char *)(a1 + 41) = 0;
  *(void *)(a1 + 56) = a5;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1B3899BC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v2 = *(unsigned char *)(a1 + 40);
  char v3 = *(unsigned char *)(a1 + 41);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 72);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 24);
  *(unsigned char *)(a2 + 16) = v2;
  *(unsigned char *)(a2 + 17) = v3;
  *(void *)(a2 + 24) = v4;
  *(void *)(a2 + 32) = v5;
  *(void *)(a2 + 40) = v7;
  *(void *)(a2 + 48) = v6;
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

id sub_1B3899C44()
{
  return *(id *)(v0 + *(void *)(*(void *)v0 + 128));
}

uint64_t sub_1B3899C68()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 440))();
}

uint64_t sub_1B3899C94()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 400))();
}

uint64_t sub_1B3899CC0@<X0>(uint64_t a1@<X8>)
{
  return sub_1B3899BC8(v1, a1);
}

uint64_t sub_1B3899CC8(uint64_t a1)
{
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_2_12();
  uint64_t v5 = *(void *)(v4 + 80);
  OUTLINED_FUNCTION_0_13();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  id v10 = (char *)&v29 - v9;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v29 - v9, v2 + *(void *)(v11 + 112), v5);
  uint64_t DynamicType = swift_getDynamicType();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v5);
  uint64_t v13 = dynamic_cast_existential_1_conditional(DynamicType);
  uint64_t v15 = 0;
  if (v13 && a1)
  {
    uint64_t v16 = v13;
    uint64_t v17 = v14;
    uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t))(v14 + 16);
    swift_bridgeObjectRetain();
    uint64_t v19 = v18(v16, v17);
    uint64_t v21 = v20;
    sub_1B389C420();
    uint64_t v22 = sub_1B389C6B0();
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = a1;
    sub_1B38737F4(v22, v19, v21);
    uint64_t v23 = v29;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v24 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 8))(v16, v17);
    uint64_t v26 = v25;
    sub_1B38986AC();
    uint64_t v27 = sub_1B389C540();
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v30 = v23;
    sub_1B38737F4(v27, v24, v26);
    uint64_t v15 = v30;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v15;
}

uint64_t dynamic_cast_existential_1_conditional(uint64_t a1)
{
  if (swift_conformsToProtocol2()) {
    return a1;
  }
  else {
    return 0;
  }
}

uint64_t sub_1B3899F44(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_46();
  v3();
  return a1;
}

uint64_t OUTLINED_FUNCTION_12_4()
{
  return v0;
}

void *sub_1B3899FAC(id a1)
{
  v1[2] = 0x6E6F6973726576;
  v1[3] = 0xE700000000000000;
  v1[4] = 1685217635;
  v1[5] = 0xE400000000000000;
  v1[6] = 49;
  v1[7] = 0xE100000000000000;
  v1[8] = 0x6C616E7265746E69;
  v1[9] = 0xE800000000000000;
  v1[10] = 1684366707;
  v1[11] = 0xE400000000000000;
  v1[12] = 0x636F6C5F69726973;
  v1[13] = 0xEB00000000656C61;
  v1[14] = 0x6C62616E655F7368;
  v1[15] = 0xEA00000000006465;
  v1[16] = 0x676E6C74616CLL;
  v1[17] = 0xE600000000000000;
  v1[18] = 0x6372736F6567;
  v1[19] = 0xE600000000000000;
  v1[20] = 0x6F6E72657375;
  v1[21] = 0xE600000000000000;
  v1[22] = 7041900;
  v1[23] = 0xE300000000000000;
  v1[24] = 7627109;
  v1[25] = 0xE300000000000000;
  v1[26] = 0x656C61636F6CLL;
  v1[27] = 0xE600000000000000;
  v1[28] = 7107429;
  v1[29] = 0xE300000000000000;
  v1[30] = 25443;
  v1[31] = 0xE200000000000000;
  v1[32] = 0x746E656761;
  v1[33] = 0xE500000000000000;
  v1[34] = 0x5255676142524150;
  v1[35] = 0xE90000000000004CLL;
  v1[36] = 0xD00000000000001FLL;
  v1[37] = 0x80000001B38A4470;
  v1[38] = 0xD00000000000001ELL;
  v1[39] = 0x80000001B38A4490;
  v1[40] = 0xD000000000000011;
  v1[41] = 0x80000001B38A44B0;
  v1[42] = 0x6567412D72657355;
  v1[43] = 0xEA0000000000746ELL;
  if (!a1) {
    a1 = objc_msgSend(self, sel_standardUserDefaults);
  }
  v1[44] = a1;
  return v1;
}

uint64_t sub_1B389A190(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5)
  {
    OUTLINED_FUNCTION_6_6();
    return sub_1B389A1E0(v5, v6, v7, v8);
  }
  else
  {
    OUTLINED_FUNCTION_6_6();
    return sub_1B389A484(v10, v11, v12, v13, v14);
  }
}

uint64_t sub_1B389A1E0@<X0>(uint64_t *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8 = v4;
  uint64_t v47 = a2;
  uint64_t v48 = a3;
  uint64_t v46 = a4;
  uint64_t v10 = sub_1B389BD00();
  OUTLINED_FUNCTION_1();
  uint64_t v55 = v11;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_4_15();
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)v37 - v14;
  uint64_t v16 = *a1;
  uint64_t v44 = a1[1];
  uint64_t v45 = v16;
  uint64_t v43 = a1[2];
  int v42 = *((unsigned __int8 *)a1 + 24);
  uint64_t v17 = a1[4];
  uint64_t v40 = a1[5];
  uint64_t v41 = v17;
  uint64_t v18 = a1[6];
  uint64_t v38 = a1[7];
  uint64_t v39 = v18;
  uint64_t v19 = OUTLINED_FUNCTION_5_9();
  uint64_t v20 = v8;
  v21(v19, v7);
  sub_1B389ADD8(v22, (uint64_t)v15);
  uint64_t result = swift_bridgeObjectRelease();
  if (!v5)
  {
    uint64_t v24 = v47;
    uint64_t v25 = v48;
    v37[1] = v20;
    type metadata accessor for ParsecURLRequestBuilder();
    uint64_t v26 = v55;
    (*(void (**)(uint64_t, char *, uint64_t))(v55 + 16))(v6, v15, v10);
    uint64_t v27 = sub_1B3877908();
    v37[0] = v15;
    if (v25) {
      uint64_t v28 = v24;
    }
    else {
      uint64_t v28 = 0;
    }
    if (!v25) {
      uint64_t v25 = 0xE000000000000000;
    }
    swift_bridgeObjectRetain();
    sub_1B389A6E4(v27, v28, v25);
    swift_bridgeObjectRelease();
    sub_1B389A754();
    sub_1B389A830();
    uint64_t v29 = OUTLINED_FUNCTION_15_3();
    sub_1B389A88C(v29, v30);
    uint64_t v31 = OUTLINED_FUNCTION_15_3();
    sub_1B389A918(v31, v32);
    uint64_t v33 = OUTLINED_FUNCTION_15_3();
    sub_1B389A9A4(v33, v34);
    uint64_t v35 = OUTLINED_FUNCTION_15_3();
    sub_1B389AC6C(v35, v36);
    sub_1B389ACF8();
    v49[0] = v45;
    v49[1] = v44;
    v49[2] = v43;
    char v50 = v42;
    uint64_t v51 = v41;
    uint64_t v52 = v40;
    uint64_t v53 = v39;
    uint64_t v54 = v38;
    sub_1B389AD68(v27, v49);
    sub_1B3877E84(v46);
    sub_1B389B9F0();
    swift_release();
    return (*(uint64_t (**)(void, uint64_t))(v26 + 8))(v37[0], v10);
  }
  return result;
}

uint64_t sub_1B389A484@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v39 = a5;
  uint64_t v40 = a4;
  uint64_t v30 = a3;
  uint64_t v9 = sub_1B389BD00();
  OUTLINED_FUNCTION_1();
  uint64_t v47 = v10;
  uint64_t v12 = MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v16 = (char *)&v29 - v15;
  uint64_t v17 = *a2;
  uint64_t v37 = a2[1];
  uint64_t v38 = v17;
  uint64_t v36 = a2[2];
  int v35 = *((unsigned __int8 *)a2 + 24);
  uint64_t v18 = a2[4];
  uint64_t v33 = a2[5];
  uint64_t v34 = v18;
  uint64_t v19 = a2[6];
  uint64_t v31 = a2[7];
  uint64_t v32 = v19;
  uint64_t v20 = OUTLINED_FUNCTION_5_9();
  v21(v20, v6);
  sub_1B389ADD8(v22, (uint64_t)v16);
  uint64_t result = swift_bridgeObjectRelease();
  if (!v5)
  {
    uint64_t v24 = v40;
    type metadata accessor for ParsecURLRequestBuilder();
    (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v14, v16, v9);
    uint64_t v25 = sub_1B3877908();
    if (v24) {
      uint64_t v26 = v30;
    }
    else {
      uint64_t v26 = 0;
    }
    if (!v24) {
      uint64_t v24 = 0xE000000000000000;
    }
    swift_bridgeObjectRetain();
    sub_1B389A6E4(v25, v26, v24);
    swift_bridgeObjectRelease();
    sub_1B389A830();
    sub_1B389A88C(v25, a1);
    sub_1B389A918(v25, a1);
    sub_1B389AC6C(v25, a1);
    v41[0] = v38;
    v41[1] = v37;
    v41[2] = v36;
    char v42 = v35;
    uint64_t v43 = v34;
    uint64_t v44 = v33;
    uint64_t v45 = v32;
    uint64_t v46 = v31;
    sub_1B389ADA0(v25, v41);
    sub_1B3877E84(v39);
    uint64_t v27 = OUTLINED_FUNCTION_8_7();
    v28(v27);
    return swift_release();
  }
  return result;
}

uint64_t sub_1B389A6E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 || a3 != 0xE000000000000000)
  {
    uint64_t result = sub_1B389C920();
    if ((result & 1) == 0) {
      return sub_1B3878614(*(void *)(v3 + 16), *(void *)(v3 + 24));
    }
  }
  return result;
}

uint64_t sub_1B389A754()
{
  uint64_t v1 = v0[22];
  uint64_t v2 = v0[23];
  if (qword_1E9CCEBA0 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_1B3878614(v1, v2);
  swift_bridgeObjectRelease();
  uint64_t v4 = v0[24];
  uint64_t v3 = v0[25];
  swift_bridgeObjectRetain();
  sub_1B3878614(v4, v3);

  return swift_bridgeObjectRelease();
}

uint64_t sub_1B389A830()
{
  uint64_t v0 = sub_1B389B184();
  if (*(void *)(v0 + 16)) {
    sub_1B3877830(v0);
  }

  return swift_bridgeObjectRelease();
}

uint64_t sub_1B389A88C(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_1_19(a1, a2);
  uint64_t v3 = OUTLINED_FUNCTION_3_15();
  uint64_t result = v4(v3);
  if (v6)
  {
    OUTLINED_FUNCTION_12_5();
    BOOL v8 = v8 && v7 == 0xE000000000000000;
    if (!v8 && (OUTLINED_FUNCTION_2_13() & 1) == 0) {
      OUTLINED_FUNCTION_10_6(*(void *)(v2 + 208), *(void *)(v2 + 216));
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1B389A918(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_1_19(a1, a2);
  uint64_t v3 = OUTLINED_FUNCTION_3_15();
  uint64_t result = v4(v3);
  if (v6)
  {
    OUTLINED_FUNCTION_12_5();
    BOOL v8 = v8 && v7 == 0xE000000000000000;
    if (!v8 && (OUTLINED_FUNCTION_2_13() & 1) == 0) {
      OUTLINED_FUNCTION_10_6(*(void *)(v2 + 224), *(void *)(v2 + 232));
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1B389A9A4(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  v24[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v5 = sub_1B389C2F0();
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v6);
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 32))(v6, v7);
  if (v8)
  {
    if (*(void *)(v8 + 16))
    {
      uint64_t v9 = self;
      uint64_t v10 = (void *)sub_1B389C460();
      swift_bridgeObjectRelease();
      v24[0] = 0;
      id v11 = objc_msgSend(v9, sel_dataWithJSONObject_options_error_, v10, 0, v24);

      id v12 = v24[0];
      if (v11)
      {
        uint64_t v13 = sub_1B389BD40();
        unint64_t v15 = v14;

        sub_1B389C2E0();
        uint64_t v16 = sub_1B389C2C0();
        if (v17)
        {
          sub_1B387884C(*(void *)(v3 + 320), *(void *)(v3 + 328), v16, v17);
          swift_bridgeObjectRelease();
        }
        sub_1B386CE50(v13, v15);
      }
      else
      {
        uint64_t v18 = v12;
        uint64_t v19 = (void *)sub_1B389BC00();

        swift_willThrow();
        if (qword_1E9CCEBC8 != -1) {
          swift_once();
        }
        uint64_t v20 = sub_1B389C1B0();
        __swift_project_value_buffer(v20, (uint64_t)qword_1E9CCF650);
        uint64_t v21 = sub_1B389C190();
        os_log_type_t v22 = sub_1B389C5B0();
        if (os_log_type_enabled(v21, v22))
        {
          uint64_t v23 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v23 = 0;
          _os_log_impl(&dword_1B3850000, v21, v22, "Error encoding preferred languages", v23, 2u);
          OUTLINED_FUNCTION_5();
        }
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_1B389AC6C(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_1_19(a1, a2);
  uint64_t v3 = OUTLINED_FUNCTION_3_15();
  uint64_t result = v4(v3);
  if (v6)
  {
    OUTLINED_FUNCTION_12_5();
    BOOL v8 = v8 && v7 == 0xE000000000000000;
    if (!v8 && (OUTLINED_FUNCTION_2_13() & 1) == 0) {
      OUTLINED_FUNCTION_10_6(*(void *)(v2 + 240), *(void *)(v2 + 248));
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1B389ACF8()
{
  if (qword_1E9CCEB48 != -1) {
    uint64_t result = swift_once();
  }
  if (byte_1E9CCF640 == 1) {
    return sub_1B3878614(*(void *)(v0 + 64), *(void *)(v0 + 72));
  }
  return result;
}

uint64_t sub_1B389AD68(uint64_t a1, void *a2)
{
  if (*a2) {
    return sub_1B387884C(*(void *)(v2 + 336), *(void *)(v2 + 344), a2[4], a2[5]);
  }
  return result;
}

uint64_t sub_1B389ADA0(uint64_t a1, void *a2)
{
  if (*a2) {
    return sub_1B3878614(*(void *)(v2 + 256), *(void *)(v2 + 264));
  }
  return result;
}

uint64_t sub_1B389ADD8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v20 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7FBF88);
  MEMORY[0x1F4188790](v5 - 8);
  OUTLINED_FUNCTION_4_15();
  MEMORY[0x1F4188790](v6);
  BOOL v8 = (char *)&v19 - v7;
  uint64_t v9 = *(void **)(v2 + 352);
  uint64_t v10 = (void *)sub_1B389C280();
  id v11 = objc_msgSend(v9, sel_stringForKey_, v10);

  if (v11)
  {
    sub_1B389C2B0();

    sub_1B389BCC0();
    swift_bridgeObjectRelease();
    uint64_t v12 = sub_1B389BD00();
    if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v12) != 1) {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v20, v8, v12);
    }
    sub_1B38877AC((uint64_t)v8);
  }
  if (a1)
  {
    uint64_t v13 = sub_1B389C320();
    if (v14)
    {
      if (v13 == 20035 && v14 == 0xE200000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_1B389C920();
        swift_bridgeObjectRelease();
      }
    }
  }
  swift_bridgeObjectRetain();
  sub_1B389BCC0();
  swift_bridgeObjectRelease();
  uint64_t v17 = sub_1B389BD00();
  if (__swift_getEnumTagSinglePayload(v3, 1, v17) != 1) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 32))(v20, v3, v17);
  }
  sub_1B38877AC(v3);
  sub_1B3878AB8();
  swift_allocError();
  *uint64_t v18 = 1;
  return swift_willThrow();
}

uint64_t sub_1B389B064()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t sub_1B389B12C()
{
  sub_1B389B064();

  return MEMORY[0x1F4186488](v0, 360, 7);
}

uint64_t type metadata accessor for PARNetworkRequestFactory()
{
  return self;
}

uint64_t sub_1B389B184()
{
  sub_1B389BAD0();
  OUTLINED_FUNCTION_1();
  uint64_t v81 = v1;
  uint64_t v82 = v2;
  MEMORY[0x1F4188790](v1);
  uint64_t v86 = (char *)v76 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = (void *)sub_1B389C280();
  id v5 = objc_msgSend(v0, sel_stringForKey_, v4);

  if (!v5) {
    return MEMORY[0x1E4FBC860];
  }
  uint64_t v6 = sub_1B389C2B0();
  unint64_t v8 = v7;

  if (qword_1E9CCEBC8 != -1) {
    goto LABEL_54;
  }
  while (1)
  {
    uint64_t v9 = sub_1B389C1B0();
    uint64_t v10 = __swift_project_value_buffer(v9, (uint64_t)qword_1E9CCF650);
    swift_bridgeObjectRetain_n();
    uint64_t v80 = v10;
    id v11 = sub_1B389C190();
    os_log_type_t v12 = sub_1B389C5D0();
    BOOL v13 = os_log_type_enabled(v11, v12);
    uint64_t v14 = MEMORY[0x1E4FBC840];
    if (v13)
    {
      unint64_t v15 = (uint8_t *)swift_slowAlloc();
      v91[0] = swift_slowAlloc();
      *(_DWORD *)unint64_t v15 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v90 = sub_1B3855F24((uint64_t)v6, v8, v91);
      sub_1B389C6C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1B3850000, v11, v12, "processing debug parameters %s", v15, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_5();
    }
    else
    {

      uint64_t v16 = swift_bridgeObjectRelease_n();
    }
    v91[0] = 38;
    v91[1] = 0xE100000000000000;
    MEMORY[0x1F4188790](v16);
    uint64_t v75 = v91;
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_1B3892760(0x7FFFFFFFFFFFFFFFLL, 1u, sub_1B387B460, (uint64_t)v73, (uint64_t)v6, v8);
    swift_bridgeObjectRelease();
    uint64_t v85 = *(void *)(v17 + 16);
    if (!v85)
    {
      swift_bridgeObjectRelease();
      return MEMORY[0x1E4FBC860];
    }
    uint64_t v84 = v17 + 32;
    uint64_t v78 = v82 + 32;
    uint64_t v19 = MEMORY[0x1E4FBC860];
    *(void *)&long long v18 = 136315138;
    long long v77 = v18;
    v76[1] = v14 + 8;
    unint64_t v20 = 0;
    uint64_t v79 = v17;
LABEL_8:
    if (v20 < *(void *)(v17 + 16)) {
      break;
    }
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    swift_once();
  }
  uint64_t v87 = v19;
  uint64_t v21 = (unint64_t *)(v84 + 32 * v20);
  unint64_t v22 = *v21;
  unint64_t v23 = v21[1];
  unint64_t v24 = MEMORY[0x1E4FBC860];
  if (v23 >> 14 == *v21 >> 14)
  {
LABEL_36:
    if (*(void *)(v24 + 16) == 2)
    {
      uint64_t v54 = (void *)v24;
      uint64_t v55 = *(void *)(v24 + 32);
      uint64_t v56 = *(void *)(v24 + 40);
      uint64_t v57 = v54[6];
      uint64_t v58 = v54[7];
      swift_bridgeObjectRetain();
      MEMORY[0x1B3EBA010](v55, v56, v57, v58);
      uint64_t v6 = v59;
      swift_bridgeObjectRelease();
      if (v54[2] < 2uLL) {
        goto LABEL_53;
      }
      uint64_t v60 = v54[8];
      uint64_t v61 = v54[9];
      uint64_t v62 = v54[10];
      unint64_t v8 = v54[11];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      MEMORY[0x1B3EBA010](v60, v61, v62, v8);
      swift_bridgeObjectRelease();
      sub_1B389BAA0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v19 = v87;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v19 = sub_1B388E14C(0, *(void *)(v19 + 16) + 1, 1, v19);
      }
      unint64_t v64 = *(void *)(v19 + 16);
      unint64_t v63 = *(void *)(v19 + 24);
      uint64_t v6 = (v64 + 1);
      if (v64 >= v63 >> 1) {
        uint64_t v19 = sub_1B388E14C(v63 > 1, v64 + 1, 1, v19);
      }
      *(void *)(v19 + 16) = v6;
      (*(void (**)(unint64_t, char *, uint64_t))(v82 + 32))(v19+ ((*(unsigned __int8 *)(v82 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v82 + 80))+ *(void *)(v82 + 72) * v64, v86, v81);
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v6 = sub_1B389C190();
      os_log_type_t v65 = sub_1B389C5B0();
      if (os_log_type_enabled(v6, v65))
      {
        uint64_t v66 = swift_slowAlloc();
        v91[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v66 = v77;
        uint64_t v67 = swift_bridgeObjectRetain();
        uint64_t v68 = MEMORY[0x1B3EBA150](v67, MEMORY[0x1E4FBB7A8]);
        unint64_t v8 = v69;
        swift_bridgeObjectRelease();
        *(void *)(v66 + 4) = sub_1B3855F24(v68, v8, v91);
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1B3850000, v6, v65, "invalid query components: %s", (uint8_t *)v66, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_5();
        OUTLINED_FUNCTION_5();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v19 = v87;
    }
    if (++v20 == v85)
    {
      swift_bridgeObjectRelease();
      return v19;
    }
    goto LABEL_8;
  }
  unint64_t v88 = v23 >> 14;
  unint64_t v83 = v20;
  unint64_t v25 = v21[3];
  swift_bridgeObjectRetain_n();
  unint64_t v26 = v22;
  unint64_t v27 = v22;
  unint64_t v28 = v22;
  unint64_t v89 = v25;
  do
  {
    OUTLINED_FUNCTION_9_4();
    if (sub_1B389C690() == 61 && v29 == 0xE100000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v31 = sub_1B389C920();
      swift_bridgeObjectRelease();
      if ((v31 & 1) == 0)
      {
        unint64_t v8 = v89;
        unint64_t v26 = sub_1B389C670();
        continue;
      }
    }
    unint64_t v8 = v89;
    if (v27 >> 14 != v26 >> 14)
    {
      if (v26 >> 14 < v27 >> 14) {
        goto LABEL_55;
      }
      uint64_t v32 = OUTLINED_FUNCTION_13_2(v27, v26);
      uint64_t v34 = v33;
      uint64_t v36 = v35;
      uint64_t v38 = v37;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_7_8();
        unint64_t v24 = (unint64_t)v42;
      }
      OUTLINED_FUNCTION_14_2();
      if (v24 >= v40 >> 1)
      {
        sub_1B388E2E8();
        uint64_t v39 = v43;
      }
      v39[2] = v24 + 1;
      uint64_t v41 = &v39[4 * v24];
      unint64_t v24 = (unint64_t)v39;
      v41[4] = v32;
      v41[5] = v34;
      void v41[6] = v36;
      v41[7] = v38;
      unint64_t v8 = v89;
    }
    OUTLINED_FUNCTION_9_4();
    unint64_t v26 = sub_1B389C670();
    unint64_t v27 = v26;
    unint64_t v28 = v26;
  }
  while (v88 != v26 >> 14);
  if (v88 == v27 >> 14)
  {
    swift_bridgeObjectRelease();
    uint64_t v17 = v79;
    unint64_t v20 = v83;
LABEL_35:
    swift_bridgeObjectRelease();
    goto LABEL_36;
  }
  uint64_t v17 = v79;
  unint64_t v20 = v83;
  if (v88 >= v28 >> 14)
  {
    uint64_t v44 = OUTLINED_FUNCTION_13_2(v28, v23);
    uint64_t v46 = v45;
    uint64_t v48 = v47;
    uint64_t v50 = v49;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_7_8();
      unint64_t v24 = (unint64_t)v70;
    }
    OUTLINED_FUNCTION_14_2();
    if (v24 >= v52 >> 1)
    {
      sub_1B388E2E8();
      uint64_t v51 = v71;
    }
    v51[2] = v24 + 1;
    uint64_t v53 = &v51[4 * v24];
    unint64_t v24 = (unint64_t)v51;
    v53[4] = v44;
    v53[5] = v46;
    v53[6] = v48;
    v53[7] = v50;
    unint64_t v8 = v89;
    goto LABEL_35;
  }
LABEL_55:
  LODWORD(v75) = 0;
  uint64_t v74 = 754;
  v73[0] = 2;
  uint64_t result = sub_1B389C850();
  __break(1u);
  return result;
}

uint64_t OUTLINED_FUNCTION_8_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15_3()
{
  return v0;
}

uint64_t sub_1B389B9F0()
{
  return MEMORY[0x1F40E2E70]();
}

uint64_t sub_1B389BA00()
{
  return MEMORY[0x1F40E2E80]();
}

uint64_t sub_1B389BA10()
{
  return MEMORY[0x1F40E2E90]();
}

uint64_t sub_1B389BA20()
{
  return MEMORY[0x1F40E2EA8]();
}

uint64_t sub_1B389BA30()
{
  return MEMORY[0x1F40E2EB8]();
}

uint64_t sub_1B389BA40()
{
  return MEMORY[0x1F40E2EC0]();
}

uint64_t sub_1B389BA50()
{
  return MEMORY[0x1F40E2EE8]();
}

uint64_t sub_1B389BA60()
{
  return MEMORY[0x1F40E2F00]();
}

uint64_t sub_1B389BA70()
{
  return MEMORY[0x1F40E2F60]();
}

uint64_t sub_1B389BA80()
{
  return MEMORY[0x1F40E32B0]();
}

uint64_t sub_1B389BA90()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_1B389BAA0()
{
  return MEMORY[0x1F40E35B0]();
}

uint64_t sub_1B389BAB0()
{
  return MEMORY[0x1F40E35C0]();
}

uint64_t sub_1B389BAC0()
{
  return MEMORY[0x1F40E35C8]();
}

uint64_t sub_1B389BAD0()
{
  return MEMORY[0x1F40E35D8]();
}

uint64_t sub_1B389BAE0()
{
  return MEMORY[0x1F40E3668]();
}

uint64_t sub_1B389BAF0()
{
  return MEMORY[0x1F40E3690]();
}

uint64_t sub_1B389BB00()
{
  return MEMORY[0x1F40E3698]();
}

uint64_t sub_1B389BB10()
{
  return MEMORY[0x1F40E36C8]();
}

uint64_t sub_1B389BB20()
{
  return MEMORY[0x1F40E36D8]();
}

uint64_t sub_1B389BB30()
{
  return MEMORY[0x1F40E36E8]();
}

uint64_t sub_1B389BB40()
{
  return MEMORY[0x1F40E3708]();
}

uint64_t sub_1B389BB50()
{
  return MEMORY[0x1F40E3720]();
}

uint64_t sub_1B389BB60()
{
  return MEMORY[0x1F40E3750]();
}

uint64_t sub_1B389BB70()
{
  return MEMORY[0x1F40E3770]();
}

uint64_t sub_1B389BB80()
{
  return MEMORY[0x1F40E37B8]();
}

uint64_t sub_1B389BB90()
{
  return MEMORY[0x1F40E3908]();
}

uint64_t sub_1B389BBA0()
{
  return MEMORY[0x1F40E3948]();
}

uint64_t sub_1B389BBB0()
{
  return MEMORY[0x1F40E3990]();
}

uint64_t sub_1B389BBC0()
{
  return MEMORY[0x1F40E39B0]();
}

uint64_t sub_1B389BBD0()
{
  return MEMORY[0x1F40E3A10]();
}

uint64_t sub_1B389BBE0()
{
  return MEMORY[0x1F40E3A58]();
}

uint64_t sub_1B389BBF0()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1B389BC00()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1B389BC10()
{
  return MEMORY[0x1F40E4878]();
}

uint64_t sub_1B389BC20()
{
  return MEMORY[0x1F40E4898]();
}

uint64_t sub_1B389BC30()
{
  return MEMORY[0x1F40E48D8]();
}

uint64_t sub_1B389BC40()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1B389BC50()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1B389BC60()
{
  return MEMORY[0x1F40E49E0]();
}

uint64_t sub_1B389BC70()
{
  return MEMORY[0x1F40E49F8]();
}

uint64_t sub_1B389BC80()
{
  return MEMORY[0x1F40E4A28]();
}

uint64_t sub_1B389BC90()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1B389BCA0()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t sub_1B389BCB0()
{
  return MEMORY[0x1F40E4B00]();
}

uint64_t sub_1B389BCC0()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1B389BCD0()
{
  return MEMORY[0x1F40E4B30]();
}

uint64_t sub_1B389BCE0()
{
  return MEMORY[0x1F40E4B58]();
}

uint64_t sub_1B389BCF0()
{
  return MEMORY[0x1F40E4B68]();
}

uint64_t sub_1B389BD00()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1B389BD10()
{
  return MEMORY[0x1F40E4C00]();
}

uint64_t sub_1B389BD20()
{
  return MEMORY[0x1F40E4C20]();
}

uint64_t sub_1B389BD30()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1B389BD40()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1B389BD50()
{
  return MEMORY[0x1F40E4EE0]();
}

uint64_t sub_1B389BD60()
{
  return MEMORY[0x1F40E5088]();
}

uint64_t sub_1B389BD70()
{
  return MEMORY[0x1F40E50E0]();
}

uint64_t sub_1B389BD80()
{
  return MEMORY[0x1F40E5198]();
}

uint64_t sub_1B389BD90()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1B389BDA0()
{
  return MEMORY[0x1F40E51D8]();
}

uint64_t sub_1B389BDB0()
{
  return MEMORY[0x1F40E51F0]();
}

uint64_t sub_1B389BDC0()
{
  return MEMORY[0x1F40E52A0]();
}

uint64_t sub_1B389BDD0()
{
  return MEMORY[0x1F40E52B0]();
}

uint64_t sub_1B389BDF0()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1B389BE00()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_1B389BE10()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1B389BE20()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1B389BE30()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1B389BE40()
{
  return MEMORY[0x1F40E53E8]();
}

uint64_t sub_1B389BE50()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_1B389BE60()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1B389BE70()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1B389BE80()
{
  return MEMORY[0x1F40E5510]();
}

uint64_t sub_1B389BE90()
{
  return MEMORY[0x1F40E5638]();
}

uint64_t sub_1B389BEA0()
{
  return MEMORY[0x1F40E5698]();
}

uint64_t sub_1B389BEB0()
{
  return MEMORY[0x1F40E56B0]();
}

uint64_t sub_1B389BEC0()
{
  return MEMORY[0x1F40E56C8]();
}

uint64_t sub_1B389BED0()
{
  return MEMORY[0x1F40E5820]();
}

uint64_t sub_1B389BEE0()
{
  return MEMORY[0x1F40E5840]();
}

uint64_t sub_1B389BEF0()
{
  return MEMORY[0x1F40E5868]();
}

uint64_t sub_1B389BF00()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1B389BF10()
{
  return MEMORY[0x1F40E58A8]();
}

uint64_t sub_1B389BF20()
{
  return MEMORY[0x1F40E58B0]();
}

uint64_t sub_1B389BF30()
{
  return MEMORY[0x1F40E5978]();
}

uint64_t sub_1B389BF40()
{
  return MEMORY[0x1F40E5A48]();
}

uint64_t sub_1B389BF50()
{
  return MEMORY[0x1F40E5AB8]();
}

uint64_t sub_1B389BF60()
{
  return MEMORY[0x1F40E5AF0]();
}

uint64_t sub_1B389BF70()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_1B389BF80()
{
  return MEMORY[0x1F40E5D70]();
}

uint64_t sub_1B389BF90()
{
  return MEMORY[0x1F40E5D98]();
}

uint64_t sub_1B389BFA0()
{
  return MEMORY[0x1F40E5DA0]();
}

uint64_t sub_1B389BFB0()
{
  return MEMORY[0x1F40E5DA8]();
}

uint64_t sub_1B389BFC0()
{
  return MEMORY[0x1F40E5DB8]();
}

uint64_t sub_1B389BFD0()
{
  return MEMORY[0x1F40E5DC8]();
}

uint64_t sub_1B389BFE0()
{
  return MEMORY[0x1F40E5DD0]();
}

uint64_t sub_1B389BFF0()
{
  return MEMORY[0x1F40E5DE0]();
}

uint64_t sub_1B389C000()
{
  return MEMORY[0x1F40E5DE8]();
}

uint64_t sub_1B389C010()
{
  return MEMORY[0x1F40E5DF0]();
}

uint64_t sub_1B389C020()
{
  return MEMORY[0x1F40E5DF8]();
}

uint64_t sub_1B389C030()
{
  return MEMORY[0x1F40E5E08]();
}

uint64_t sub_1B389C040()
{
  return MEMORY[0x1F40E5E18]();
}

uint64_t sub_1B389C050()
{
  return MEMORY[0x1F40E5E20]();
}

uint64_t sub_1B389C060()
{
  return MEMORY[0x1F40E5E28]();
}

uint64_t sub_1B389C080()
{
  return MEMORY[0x1F4127660]();
}

uint64_t sub_1B389C090()
{
  return MEMORY[0x1F4127678]();
}

uint64_t sub_1B389C0A0()
{
  return MEMORY[0x1F4127690]();
}

uint64_t sub_1B389C0B0()
{
  return MEMORY[0x1F41884F0]();
}

uint64_t sub_1B389C0C0()
{
  return MEMORY[0x1F4188508]();
}

uint64_t sub_1B389C0D0()
{
  return MEMORY[0x1F4188510]();
}

uint64_t sub_1B389C0E0()
{
  return MEMORY[0x1F4188560]();
}

uint64_t sub_1B389C0F0()
{
  return MEMORY[0x1F4188570]();
}

uint64_t sub_1B389C100()
{
  return MEMORY[0x1F4188578]();
}

uint64_t sub_1B389C110()
{
  return MEMORY[0x1F4188580]();
}

uint64_t sub_1B389C120()
{
  return MEMORY[0x1F41885B0]();
}

uint64_t sub_1B389C130()
{
  return MEMORY[0x1F41885D0]();
}

uint64_t sub_1B389C140()
{
  return MEMORY[0x1F41885E0]();
}

uint64_t sub_1B389C150()
{
  return MEMORY[0x1F4188650]();
}

uint64_t sub_1B389C160()
{
  return MEMORY[0x1F4188658]();
}

uint64_t sub_1B389C170()
{
  return MEMORY[0x1F4188660]();
}

uint64_t sub_1B389C180()
{
  return MEMORY[0x1F4188668]();
}

uint64_t sub_1B389C190()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1B389C1A0()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1B389C1B0()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1B389C1C0()
{
  return MEMORY[0x1F41884A8]();
}

uint64_t sub_1B389C1D0()
{
  return MEMORY[0x1F4186BE8]();
}

uint64_t sub_1B389C1E0()
{
  return MEMORY[0x1F4186C18]();
}

uint64_t sub_1B389C1F0()
{
  return MEMORY[0x1F4186C20]();
}

uint64_t sub_1B389C200()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1B389C210()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1B389C220()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1B389C230()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1B389C240()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1B389C250()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1B389C260()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1B389C270()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1B389C280()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1B389C290()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1B389C2A0()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1B389C2B0()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1B389C2C0()
{
  return MEMORY[0x1F40E61F8]();
}

uint64_t sub_1B389C2D0()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1B389C2E0()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1B389C2F0()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1B389C300()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1B389C310()
{
  return MEMORY[0x1F4183898]();
}

uint64_t sub_1B389C320()
{
  return MEMORY[0x1F41838B0]();
}

uint64_t sub_1B389C330()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1B389C340()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1B389C350()
{
  return MEMORY[0x1F41838E8]();
}

uint64_t sub_1B389C360()
{
  return MEMORY[0x1F4183908]();
}

uint64_t sub_1B389C370()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1B389C380()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1B389C390()
{
  return MEMORY[0x1F41839F8]();
}

uint64_t sub_1B389C3A0()
{
  return MEMORY[0x1F4183A00]();
}

uint64_t sub_1B389C3B0()
{
  return MEMORY[0x1F4183A28]();
}

uint64_t sub_1B389C3C0()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1B389C3D0()
{
  return MEMORY[0x1F4183A60]();
}

uint64_t sub_1B389C3E0()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1B389C3F0()
{
  return MEMORY[0x1F4183B58]();
}

uint64_t sub_1B389C400()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1B389C410()
{
  return MEMORY[0x1F4183C78]();
}

uint64_t sub_1B389C420()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1B389C460()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1B389C470()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1B389C480()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1B389C490()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1B389C4A0()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1B389C4B0()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_1B389C4C0()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1B389C4D0()
{
  return MEMORY[0x1F4187CE0]();
}

uint64_t sub_1B389C4E0()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1B389C4F0()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1B389C510()
{
  return MEMORY[0x1F4187D98]();
}

uint64_t sub_1B389C530()
{
  return MEMORY[0x1F4187DC8]();
}

uint64_t sub_1B389C540()
{
  return MEMORY[0x1F40E63C8]();
}

uint64_t sub_1B389C550()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1B389C560()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1B389C570()
{
  return MEMORY[0x1F4188438]();
}

uint64_t sub_1B389C580()
{
  return MEMORY[0x1F40E65A0]();
}

uint64_t sub_1B389C590()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1B389C5A0()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1B389C5B0()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1B389C5C0()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1B389C5D0()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1B389C5E0()
{
  return MEMORY[0x1F4188708]();
}

uint64_t sub_1B389C5F0()
{
  return MEMORY[0x1F4188710]();
}

uint64_t sub_1B389C600()
{
  return MEMORY[0x1F4188718]();
}

uint64_t sub_1B389C610()
{
  return MEMORY[0x1F40E67D0]();
}

uint64_t sub_1B389C630()
{
  return MEMORY[0x1F4188720]();
}

uint64_t sub_1B389C640()
{
  return MEMORY[0x1F4188728]();
}

uint64_t sub_1B389C650()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1B389C660()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1B389C670()
{
  return MEMORY[0x1F4184720]();
}

uint64_t sub_1B389C680()
{
  return MEMORY[0x1F4184770]();
}

uint64_t sub_1B389C690()
{
  return MEMORY[0x1F4184780]();
}

uint64_t sub_1B389C6B0()
{
  return MEMORY[0x1F40E6B80]();
}

uint64_t sub_1B389C6C0()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1B389C6D0()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1B389C6E0()
{
  return MEMORY[0x1F40E6BB0]();
}

uint64_t sub_1B389C6F0()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_1B389C700()
{
  return MEMORY[0x1F40E6C98]();
}

uint64_t sub_1B389C710()
{
  return MEMORY[0x1F40E6D38]();
}

uint64_t sub_1B389C730()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1B389C740()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1B389C750()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1B389C760()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1B389C770()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1B389C780()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1B389C790()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1B389C7A0()
{
  return MEMORY[0x1F4184CC0]();
}

uint64_t sub_1B389C7B0()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1B389C7C0()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1B389C7D0()
{
  return MEMORY[0x1F4184D20]();
}

uint64_t sub_1B389C7E0()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1B389C7F0()
{
  return MEMORY[0x1F4187F70]();
}

uint64_t sub_1B389C800()
{
  return MEMORY[0x1F4187F78]();
}

uint64_t sub_1B389C810()
{
  return MEMORY[0x1F4187F80]();
}

uint64_t sub_1B389C820()
{
  return MEMORY[0x1F4184F98]();
}

uint64_t sub_1B389C830()
{
  return MEMORY[0x1F41851A0]();
}

uint64_t sub_1B389C840()
{
  return MEMORY[0x1F41851C0]();
}

uint64_t sub_1B389C850()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1B389C860()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1B389C870()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1B389C880()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1B389C890()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1B389C8B0()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1B389C8C0()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1B389C8D0()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1B389C8E0()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1B389C8F0()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1B389C910()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1B389C920()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1B389C930()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_1B389C950()
{
  return MEMORY[0x1F4185D10]();
}

uint64_t sub_1B389C970()
{
  return MEMORY[0x1F4185D40]();
}

uint64_t sub_1B389C980()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_1B389C990()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1B389C9A0()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1B389C9B0()
{
  return MEMORY[0x1F4188170]();
}

uint64_t sub_1B389C9D0()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1B389C9E0()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1B389C9F0()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1B389CA00()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1B389CA10()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1B389CA20()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1B389CA30()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1B389CA40()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1B389CA50()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1B389CA60()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1B389CA70()
{
  return MEMORY[0x1F41861A8]();
}

uint64_t sub_1B389CAA0()
{
  return MEMORY[0x1F4186318]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFPropertyListCreateFiltered()
{
  return MEMORY[0x1F40D9030]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t container_copy_sandbox_token()
{
  return MEMORY[0x1F40CB550]();
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x1F40CB5D0]();
}

uint64_t container_get_path()
{
  return MEMORY[0x1F40CB650]();
}

uint64_t container_query_create()
{
  return MEMORY[0x1F40CB720]();
}

uint64_t container_query_free()
{
  return MEMORY[0x1F40CB730]();
}

uint64_t container_query_get_last_error()
{
  return MEMORY[0x1F40CB738]();
}

uint64_t container_query_get_single_result()
{
  return MEMORY[0x1F40CB740]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x1F40CB750]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x1F40CB760]();
}

uint64_t container_query_set_group_identifiers()
{
  return MEMORY[0x1F40CB768]();
}

uint64_t container_query_set_persona_unique_string()
{
  return MEMORY[0x1F40CB780]();
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

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

uint64_t nw_activity_complete_with_reason()
{
  return MEMORY[0x1F40F2878]();
}

uint64_t nw_activity_create()
{
  return MEMORY[0x1F40F2898]();
}

uint64_t nw_activity_is_activated()
{
  return MEMORY[0x1F40F28D0]();
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t rootless_check_datavault_flag()
{
  return MEMORY[0x1F40CDD98]();
}

uint64_t rootless_convert_to_datavault()
{
  return MEMORY[0x1F40CDDA8]();
}

uint64_t rootless_mkdir_datavault()
{
  return MEMORY[0x1F40CDDB0]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1F4186478]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1F4186568]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
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

uint64_t swift_weakAssign()
{
  return MEMORY[0x1F41868A0]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40CF290](string);
}