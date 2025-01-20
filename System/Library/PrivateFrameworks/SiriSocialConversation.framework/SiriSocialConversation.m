uint64_t static SocialConversationIntent.supportsSecureCoding.getter()
{
  return 1;
}

unint64_t static SiriSocialConversationDataModels.bundleName.getter()
{
  return 0xD00000000000001ELL;
}

uint64_t SiriSocialConversationDataModels.ButtonModel.init(label:directInvocation:userData:link:separated:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, char a6@<W7>, uint64_t a7@<X8>)
{
  sub_24013ABE0();
  v9 = (int *)type metadata accessor for SiriSocialConversationDataModels.ButtonModel(0);
  v10 = (void *)(a7 + v9[5]);
  void *v10 = 0;
  v10[1] = 0xE000000000000000;
  uint64_t v11 = v9[6];
  *(void *)(a7 + v11) = sub_24013AC60();
  v12 = (void *)(a7 + v9[8]);
  void *v12 = 0;
  v12[1] = 0xE000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C81220);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  v13();
  sub_24013ABE0();
  swift_bridgeObjectRelease();
  void *v10 = a1;
  v10[1] = a2;
  swift_bridgeObjectRelease();
  *(void *)(a7 + v11) = a3;
  *(unsigned char *)(a7 + v9[7]) = a6;
  uint64_t result = swift_bridgeObjectRelease();
  void *v12 = a4;
  v12[1] = a5;
  return result;
}

uint64_t type metadata accessor for SiriSocialConversationDataModels.ButtonModel(uint64_t a1)
{
  return sub_240136F28(a1, (uint64_t *)&unk_268C813A8);
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

uint64_t SiriSocialConversationDataModels.ButtonModel.label.setter()
{
  return sub_24013AC10();
}

uint64_t SiriSocialConversationDataModels.ButtonModel.label.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C81220);
  sub_24013AC00();
  return v1;
}

uint64_t sub_240133140()
{
  return SiriSocialConversationDataModels.ButtonModel.label.setter();
}

uint64_t (*SiriSocialConversationDataModels.ButtonModel.label.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_30((uint64_t)v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C81220);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_26(v2);
  return sub_2401331D8;
}

uint64_t SiriSocialConversationDataModels.ButtonModel.directInvocation.getter()
{
  return sub_2401344C4((void (*)(void))type metadata accessor for SiriSocialConversationDataModels.ButtonModel);
}

uint64_t SiriSocialConversationDataModels.ButtonModel.directInvocation.setter(uint64_t a1, uint64_t a2)
{
  return sub_240134520(a1, a2, (void (*)(void))type metadata accessor for SiriSocialConversationDataModels.ButtonModel);
}

uint64_t (*SiriSocialConversationDataModels.ButtonModel.directInvocation.modify())()
{
  return nullsub_1;
}

uint64_t SiriSocialConversationDataModels.ButtonModel.userData.getter()
{
  type metadata accessor for SiriSocialConversationDataModels.ButtonModel(0);

  return swift_bridgeObjectRetain();
}

uint64_t SiriSocialConversationDataModels.ButtonModel.userData.setter()
{
  uint64_t v2 = *(int *)(OUTLINED_FUNCTION_18() + 24);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v2) = v0;
  return result;
}

uint64_t (*SiriSocialConversationDataModels.ButtonModel.userData.modify())()
{
  return nullsub_1;
}

uint64_t SiriSocialConversationDataModels.ButtonModel.separated.getter()
{
  return *(unsigned __int8 *)(v0
                            + *(int *)(type metadata accessor for SiriSocialConversationDataModels.ButtonModel(0) + 28));
}

uint64_t SiriSocialConversationDataModels.ButtonModel.separated.setter(char a1)
{
  uint64_t result = type metadata accessor for SiriSocialConversationDataModels.ButtonModel(0);
  *(unsigned char *)(v1 + *(int *)(result + 28)) = a1;
  return result;
}

uint64_t (*SiriSocialConversationDataModels.ButtonModel.separated.modify())()
{
  return nullsub_1;
}

uint64_t SiriSocialConversationDataModels.ButtonModel.link.getter()
{
  return OUTLINED_FUNCTION_24();
}

uint64_t SiriSocialConversationDataModels.ButtonModel.link.setter(uint64_t a1, uint64_t a2)
{
  v5 = (void *)(v2 + *(int *)(type metadata accessor for SiriSocialConversationDataModels.ButtonModel(0) + 32));
  uint64_t result = swift_bridgeObjectRelease();
  void *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*SiriSocialConversationDataModels.ButtonModel.link.modify())()
{
  return nullsub_1;
}

uint64_t SiriSocialConversationDataModels.ButtonModel.hash(into:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C81220);
  sub_240136EAC((uint64_t)&unk_268C81228);
  sub_24013AC70();
  type metadata accessor for SiriSocialConversationDataModels.ButtonModel(0);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_24();
  sub_24013ACA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v0 = OUTLINED_FUNCTION_24();
  sub_24013672C(v0, v1);
  swift_bridgeObjectRelease();
  sub_24013ADA0();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_24();
  sub_24013ACA0();

  return swift_bridgeObjectRelease();
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

uint64_t static SiriSocialConversationDataModels.ButtonModel.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((sub_24013AC20() & 1) == 0) {
    return 0;
  }
  v4 = (int *)type metadata accessor for SiriSocialConversationDataModels.ButtonModel(0);
  OUTLINED_FUNCTION_16(v4[5]);
  BOOL v7 = v7 && v5 == v6;
  if (v7 || (v8 = sub_24013AD70(), uint64_t result = 0, (v8 & 1) != 0))
  {
    if ((sub_240133698(*(void *)(a1 + v4[6]), *(void *)(a2 + v4[6])) & 1) == 0
      || *(unsigned __int8 *)(a1 + v4[7]) != *(unsigned __int8 *)(a2 + v4[7]))
    {
      return 0;
    }
    OUTLINED_FUNCTION_16(v4[8]);
    if (v7 && v10 == v11)
    {
      return 1;
    }
    else
    {
      return sub_24013AD70();
    }
  }
  return result;
}

uint64_t sub_240133698(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v3 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v4 = 0;
  uint64_t v5 = result + 64;
  uint64_t v6 = 1 << *(unsigned char *)(result + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(result + 64);
  int64_t v26 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v9 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v10 = v9 | (v4 << 6);
      goto LABEL_24;
    }
    int64_t v11 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_36;
    }
    if (v11 >= v26) {
      return 1;
    }
    unint64_t v12 = *(void *)(v5 + 8 * v11);
    ++v4;
    if (!v12)
    {
      int64_t v4 = v11 + 1;
      if (v11 + 1 >= v26) {
        return 1;
      }
      unint64_t v12 = *(void *)(v5 + 8 * v4);
      if (!v12)
      {
        int64_t v4 = v11 + 2;
        if (v11 + 2 >= v26) {
          return 1;
        }
        unint64_t v12 = *(void *)(v5 + 8 * v4);
        if (!v12)
        {
          int64_t v4 = v11 + 3;
          if (v11 + 3 >= v26) {
            return 1;
          }
          unint64_t v12 = *(void *)(v5 + 8 * v4);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v4 << 6);
LABEL_24:
    v14 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v10);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    v17 = (uint64_t *)(*(void *)(v3 + 56) + 16 * v10);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v20 = sub_2401365D0(v15, v16);
    char v22 = v21;
    swift_bridgeObjectRelease();
    if ((v22 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
    v23 = (void *)(*(void *)(a2 + 56) + 16 * v20);
    if (*v23 == v19 && v23[1] == v18)
    {
      uint64_t result = swift_bridgeObjectRelease();
    }
    else
    {
      char v25 = sub_24013AD70();
      uint64_t result = swift_bridgeObjectRelease();
      if ((v25 & 1) == 0) {
        return 0;
      }
    }
  }
  int64_t v13 = v11 + 4;
  if (v13 >= v26) {
    return 1;
  }
  unint64_t v12 = *(void *)(v5 + 8 * v13);
  if (v12)
  {
    int64_t v4 = v13;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v4 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v4 >= v26) {
      return 1;
    }
    unint64_t v12 = *(void *)(v5 + 8 * v4);
    ++v13;
    if (v12) {
      goto LABEL_23;
    }
  }
LABEL_36:
  __break(1u);
  return result;
}

BOOL sub_2401338B4(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_2401338C4()
{
  return sub_24013AD90();
}

uint64_t sub_2401338EC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6C6562616CLL && a2 == 0xE500000000000000;
  if (v2 || (sub_24013AD70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000024013BCD0 || (sub_24013AD70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    BOOL v6 = a1 == 0x6174614472657375 && a2 == 0xE800000000000000;
    if (v6 || (sub_24013AD70() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      BOOL v7 = a1 == 0x6574617261706573 && a2 == 0xE900000000000064;
      if (v7 || (sub_24013AD70() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 1802398060 && a2 == 0xE400000000000000)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        char v9 = sub_24013AD70();
        swift_bridgeObjectRelease();
        if (v9) {
          return 4;
        }
        else {
          return 5;
        }
      }
    }
  }
}

uint64_t sub_240133AEC()
{
  return 5;
}

unint64_t sub_240133AF4(char a1)
{
  unint64_t result = 0x6C6562616CLL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000010;
      break;
    case 2:
      unint64_t result = 0x6174614472657375;
      break;
    case 3:
      unint64_t result = 0x6574617261706573;
      break;
    case 4:
      unint64_t result = 1802398060;
      break;
    default:
      return result;
  }
  return result;
}

BOOL sub_240133BA0(char *a1, char *a2)
{
  return sub_2401338B4(*a1, *a2);
}

uint64_t sub_240133BAC()
{
  return sub_24013478C();
}

uint64_t sub_240133BC8()
{
  return sub_2401338C4();
}

unint64_t sub_240133BD4()
{
  return sub_240133AF4(*v0);
}

uint64_t sub_240133BDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2401338EC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_240133C04()
{
  return sub_2401351B8();
}

uint64_t sub_240133C24@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_240133AEC();
  *a1 = result;
  return result;
}

uint64_t sub_240133C4C(uint64_t a1)
{
  unint64_t v2 = sub_240136938();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_240133C88(uint64_t a1)
{
  unint64_t v2 = sub_240136938();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SiriSocialConversationDataModels.ButtonModel.encode(to:)()
{
  OUTLINED_FUNCTION_23();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C81230);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_12();
  sub_240136938();
  OUTLINED_FUNCTION_11();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C81220);
  sub_2401369D4((uint64_t)&unk_268C81240);
  OUTLINED_FUNCTION_29();
  sub_24013AD60();
  if (!v0)
  {
    type metadata accessor for SiriSocialConversationDataModels.ButtonModel(0);
    OUTLINED_FUNCTION_4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C81248);
    sub_2401369D4((uint64_t)&unk_268C81250);
    sub_24013AD60();
    sub_24013AD50();
    sub_24013AD40();
  }
  uint64_t v1 = OUTLINED_FUNCTION_7();
  return v2(v1);
}

uint64_t SiriSocialConversationDataModels.ButtonModel.hashValue.getter()
{
  return sub_24013ADB0();
}

void SiriSocialConversationDataModels.ButtonModel.init(from:)()
{
  OUTLINED_FUNCTION_10();
  uint64_t v3 = v2;
  uint64_t v22 = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C81220);
  OUTLINED_FUNCTION_0();
  uint64_t v25 = v6;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_20();
  uint64_t v9 = v8 - v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C81258);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  uint64_t v10 = OUTLINED_FUNCTION_15();
  int64_t v11 = (int *)type metadata accessor for SiriSocialConversationDataModels.ButtonModel(v10);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_6();
  uint64_t v27 = 0;
  sub_24013ABE0();
  unint64_t v12 = (uint64_t *)(v1 + v11[5]);
  uint64_t *v12 = 0;
  v12[1] = 0xE000000000000000;
  v24 = v12;
  uint64_t v26 = v11[6];
  *(void *)(v1 + v26) = sub_24013AC60();
  int64_t v13 = (uint64_t *)(v1 + v11[8]);
  *int64_t v13 = 0;
  v13[1] = 0xE000000000000000;
  v23 = v13;
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_240136938();
  sub_24013ADC0();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v1, v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    LOBYTE(v27) = 0;
    sub_2401369D4((uint64_t)&unk_268C81260);
    sub_24013AD10();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 40))(v1, v9, v5);
    uint64_t v14 = OUTLINED_FUNCTION_25(1);
    uint64_t v16 = v15;
    swift_bridgeObjectRelease();
    uint64_t *v24 = v14;
    v24[1] = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C81248);
    sub_240136A38();
    sub_24013AD10();
    swift_bridgeObjectRelease();
    *(void *)(v1 + v26) = v27;
    *(unsigned char *)(v1 + v11[7]) = sub_24013AD00() & 1;
    uint64_t v17 = OUTLINED_FUNCTION_25(4);
    uint64_t v19 = v18;
    uint64_t v20 = OUTLINED_FUNCTION_13();
    v21(v20);
    swift_bridgeObjectRelease();
    uint64_t *v23 = v17;
    v23[1] = v19;
    sub_240136D14(v1, v22, (void (*)(void))type metadata accessor for SiriSocialConversationDataModels.ButtonModel);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
    sub_240136BE4(v1, (void (*)(void))type metadata accessor for SiriSocialConversationDataModels.ButtonModel);
  }
  OUTLINED_FUNCTION_9();
}

void sub_2401342D4()
{
}

uint64_t sub_2401342EC()
{
  return SiriSocialConversationDataModels.ButtonModel.encode(to:)();
}

uint64_t sub_24013430C()
{
  return sub_24013ADB0();
}

uint64_t SiriSocialConversationDataModels.ButtonStackModel.init(buttons:text:sash:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, char a3@<W3>, uint64_t a4@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C81270);
  sub_24013ABE0();
  uint64_t v8 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(0);
  uint64_t v9 = (void *)(a4 + *(int *)(v8 + 20));
  void *v9 = 0;
  v9[1] = 0xE000000000000000;
  uint64_t v10 = *(int *)(v8 + 24);
  *(unsigned char *)(a4 + v10) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C81278);
  uint64_t result = sub_24013AC10();
  void *v9 = a1;
  v9[1] = a2;
  *(unsigned char *)(a4 + v10) = a3;
  return result;
}

uint64_t SiriSocialConversationDataModels.ButtonStackModel.buttons.setter(uint64_t a1)
{
  return sub_240134E10(a1, &qword_268C81278);
}

uint64_t SiriSocialConversationDataModels.ButtonStackModel.buttons.getter()
{
  return sub_240134E9C(&qword_268C81278);
}

uint64_t sub_240134428()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return SiriSocialConversationDataModels.ButtonStackModel.buttons.setter(v0);
}

uint64_t (*SiriSocialConversationDataModels.ButtonStackModel.buttons.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_30((uint64_t)v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C81278);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_26(v2);
  return sub_2401331D8;
}

uint64_t SiriSocialConversationDataModels.ButtonStackModel.text.getter()
{
  return sub_2401344C4((void (*)(void))type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel);
}

uint64_t sub_2401344C4(void (*a1)(void))
{
  return OUTLINED_FUNCTION_24();
}

uint64_t SiriSocialConversationDataModels.ButtonStackModel.text.setter(uint64_t a1, uint64_t a2)
{
  return sub_240134520(a1, a2, (void (*)(void))type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel);
}

uint64_t sub_240134520(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_28();
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v3 = a1;
  v3[1] = a2;
  return result;
}

uint64_t (*SiriSocialConversationDataModels.ButtonStackModel.text.modify())()
{
  return nullsub_1;
}

uint64_t SiriSocialConversationDataModels.ButtonStackModel.sash.getter()
{
  return *(unsigned __int8 *)(v0
                            + *(int *)(type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(0)
                                     + 24));
}

uint64_t SiriSocialConversationDataModels.ButtonStackModel.sash.setter(char a1)
{
  uint64_t result = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(0);
  *(unsigned char *)(v1 + *(int *)(result + 24)) = a1;
  return result;
}

uint64_t (*SiriSocialConversationDataModels.ButtonStackModel.sash.modify())()
{
  return nullsub_1;
}

uint64_t sub_24013464C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x736E6F74747562 && a2 == 0xE700000000000000;
  if (v2 || (sub_24013AD70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 1954047348 && a2 == 0xE400000000000000;
    if (v6 || (sub_24013AD70() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 1752392051 && a2 == 0xE400000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_24013AD70();
      swift_bridgeObjectRelease();
      if (v8) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_240134784()
{
  return 3;
}

uint64_t sub_24013478C()
{
  return sub_24013ADB0();
}

uint64_t sub_2401347CC(char a1)
{
  if (!a1) {
    return 0x736E6F74747562;
  }
  if (a1 == 1) {
    return 1954047348;
  }
  return 1752392051;
}

uint64_t sub_240134814()
{
  return sub_24013ADB0();
}

uint64_t sub_240134858()
{
  return sub_2401347CC(*v0);
}

uint64_t sub_240134860@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24013464C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_240134888@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_240134784();
  *a1 = result;
  return result;
}

uint64_t sub_2401348B0(uint64_t a1)
{
  unint64_t v2 = sub_240136AC4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2401348EC(uint64_t a1)
{
  unint64_t v2 = sub_240136AC4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SiriSocialConversationDataModels.ButtonStackModel.encode(to:)()
{
  OUTLINED_FUNCTION_23();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C81280);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_12();
  sub_240136AC4();
  OUTLINED_FUNCTION_11();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C81278);
  sub_240136C38((uint64_t)&unk_268C81290);
  OUTLINED_FUNCTION_29();
  sub_24013AD60();
  if (!v0)
  {
    type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(0);
    OUTLINED_FUNCTION_4();
    sub_24013AD50();
  }
  uint64_t v1 = OUTLINED_FUNCTION_7();
  return v2(v1);
}

void SiriSocialConversationDataModels.ButtonStackModel.init(from:)()
{
  OUTLINED_FUNCTION_10();
  uint64_t v3 = v2;
  uint64_t v17 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C81278);
  OUTLINED_FUNCTION_0();
  uint64_t v18 = v6;
  uint64_t v19 = v5;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2();
  uint64_t v20 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C812B8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_20();
  uint64_t v8 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(0) - 8;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C81270);
  sub_24013ABE0();
  uint64_t v9 = (uint64_t *)(v1 + *(int *)(v8 + 28));
  uint64_t *v9 = 0;
  v9[1] = 0xE000000000000000;
  uint64_t v10 = *(int *)(v8 + 32);
  *(unsigned char *)(v1 + v10) = 1;
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_240136AC4();
  sub_24013ADC0();
  if (!v0)
  {
    uint64_t v16 = v10;
    sub_240136C38((uint64_t)&unk_268C812C0);
    sub_24013AD10();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 40))(v1, v20, v19);
    uint64_t v11 = sub_24013ACF0();
    uint64_t v13 = v12;
    swift_bridgeObjectRelease();
    uint64_t *v9 = v11;
    v9[1] = v13;
    LOBYTE(v11) = sub_24013AD00();
    uint64_t v14 = OUTLINED_FUNCTION_19();
    v15(v14);
    *(unsigned char *)(v1 + v16) = v11 & 1;
    sub_240136D14(v1, v17, (void (*)(void))type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  sub_240136BE4(v1, (void (*)(void))type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel);
  OUTLINED_FUNCTION_9();
}

void sub_240134D5C()
{
}

uint64_t sub_240134D74()
{
  return SiriSocialConversationDataModels.ButtonStackModel.encode(to:)();
}

uint64_t SiriSocialConversationDataModels.StoryDataModel.init(storyTexts:dialogIds:)()
{
  return sub_24013ABE0();
}

uint64_t SiriSocialConversationDataModels.StoryDataModel.dialogIds.setter(uint64_t a1)
{
  return sub_240134E10(a1, &qword_268C812D0);
}

uint64_t sub_240134E10(uint64_t a1, uint64_t *a2)
{
  return sub_24013AC10();
}

uint64_t SiriSocialConversationDataModels.StoryDataModel.storyTexts.setter()
{
  return sub_24013AC10();
}

uint64_t SiriSocialConversationDataModels.StoryDataModel.dialogIds.getter()
{
  return sub_240134E9C(&qword_268C812D0);
}

uint64_t sub_240134E9C(uint64_t *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(a1);
  sub_24013AC00();
  return v2;
}

uint64_t sub_240134EC8()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return SiriSocialConversationDataModels.StoryDataModel.dialogIds.setter(v0);
}

uint64_t (*SiriSocialConversationDataModels.StoryDataModel.dialogIds.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_30((uint64_t)v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C812D0);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_26(v2);
  return sub_2401331D8;
}

uint64_t SiriSocialConversationDataModels.StoryDataModel.storyTexts.getter()
{
  type metadata accessor for SiriSocialConversationDataModels.StoryDataModel(0);
  OUTLINED_FUNCTION_28();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C812D0);
  sub_24013AC00();
  return v1;
}

uint64_t sub_240134F94()
{
  return SiriSocialConversationDataModels.StoryDataModel.storyTexts.setter();
}

uint64_t (*SiriSocialConversationDataModels.StoryDataModel.storyTexts.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_30((uint64_t)v1);
  type metadata accessor for SiriSocialConversationDataModels.StoryDataModel(0);
  OUTLINED_FUNCTION_28();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C812D0);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_26(v2);
  return sub_2401331D8;
}

void sub_240135024(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

BOOL sub_240135070(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_240135080()
{
  return sub_24013AD90();
}

uint64_t sub_2401350A8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6449676F6C616964 && a2 == 0xE900000000000073;
  if (v2 || (sub_24013AD70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x78655479726F7473 && a2 == 0xEA00000000007374)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_24013AD70();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_2401351B0()
{
  return 2;
}

uint64_t sub_2401351B8()
{
  return 0;
}

uint64_t sub_2401351C4(char a1)
{
  if (a1) {
    return 0x78655479726F7473;
  }
  else {
    return 0x6449676F6C616964;
  }
}

BOOL sub_240135204(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_240135070(*a1, *a2);
}

uint64_t sub_240135210()
{
  return sub_240135838();
}

uint64_t sub_24013522C()
{
  return sub_240135080();
}

uint64_t sub_240135234()
{
  return sub_2401351C4(*v0);
}

uint64_t sub_24013523C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2401350A8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_240135264@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2401351B0();
  *a1 = result;
  return result;
}

uint64_t sub_24013528C(uint64_t a1)
{
  unint64_t v2 = sub_240136D94();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2401352C8(uint64_t a1)
{
  unint64_t v2 = sub_240136D94();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SiriSocialConversationDataModels.StoryDataModel.encode(to:)()
{
  OUTLINED_FUNCTION_23();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C812D8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_12();
  sub_240136D94();
  OUTLINED_FUNCTION_11();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C812D0);
  sub_240136DE0((uint64_t)&unk_268C812E8);
  OUTLINED_FUNCTION_17();
  if (!v0)
  {
    type metadata accessor for SiriSocialConversationDataModels.StoryDataModel(0);
    OUTLINED_FUNCTION_17();
  }
  uint64_t v2 = OUTLINED_FUNCTION_7();
  return v3(v2);
}

void SiriSocialConversationDataModels.StoryDataModel.init(from:)()
{
  OUTLINED_FUNCTION_10();
  uint64_t v3 = v2;
  uint64_t v25 = v4;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C812D0);
  OUTLINED_FUNCTION_0();
  uint64_t v27 = v5;
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  v28 = (char *)&v21 - v9;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C81300);
  OUTLINED_FUNCTION_0();
  uint64_t v26 = v10;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_21();
  uint64_t v12 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel(0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_22();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_240136D94();
  sub_24013ADC0();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  }
  else
  {
    uint64_t v22 = v12;
    v23 = v8;
    uint64_t v14 = v27;
    uint64_t v24 = v1;
    unint64_t v15 = sub_240136DE0((uint64_t)&unk_268C81308);
    uint64_t v16 = v28;
    sub_24013AD10();
    unint64_t v21 = v15;
    v28 = *(char **)(v14 + 32);
    ((void (*)(uint64_t, char *, uint64_t))v28)(v24, v16, v30);
    uint64_t v17 = v23;
    sub_24013AD10();
    uint64_t v18 = OUTLINED_FUNCTION_37();
    v19(v18);
    uint64_t v20 = v24;
    ((void (*)(uint64_t, char *, uint64_t))v28)(v24 + *(int *)(v22 + 20), v17, v30);
    sub_240136D14(v20, v25, (void (*)(void))type metadata accessor for SiriSocialConversationDataModels.StoryDataModel);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
    sub_240136BE4(v20, (void (*)(void))type metadata accessor for SiriSocialConversationDataModels.StoryDataModel);
  }
  OUTLINED_FUNCTION_9();
}

uint64_t sub_240135718(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x74536E6F74747562 && a2 == 0xEF776569566B6361;
  if (v2 || (sub_24013AD70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65695679726F7473 && a2 == 0xE900000000000077)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_24013AD70();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_240135838()
{
  return sub_24013ADB0();
}

uint64_t sub_240135878(char a1)
{
  if (a1) {
    return 0x65695679726F7473;
  }
  else {
    return 0x74536E6F74747562;
  }
}

uint64_t sub_2401358C0()
{
  return 1;
}

uint64_t sub_2401358C8()
{
  return sub_24013AD90();
}

uint64_t sub_2401358F0(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24013AD70();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_240135960()
{
  return sub_24013ADB0();
}

uint64_t sub_24013599C()
{
  return 12383;
}

void sub_2401359A8()
{
}

uint64_t sub_2401359C0()
{
  return SiriSocialConversationDataModels.StoryDataModel.encode(to:)();
}

uint64_t sub_2401359DC()
{
  return sub_240135960();
}

uint64_t sub_240135A00(uint64_t a1)
{
  unint64_t v2 = sub_240137054();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_240135A3C(uint64_t a1)
{
  unint64_t v2 = sub_240137054();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_240135A78()
{
  return sub_240135878(*v0);
}

uint64_t sub_240135A80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_240135718(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_240135AA8(uint64_t a1)
{
  unint64_t v2 = sub_240136F5C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_240135AE4(uint64_t a1)
{
  unint64_t v2 = sub_240136F5C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_240135B20()
{
  return sub_24013ADB0();
}

uint64_t sub_240135B60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2401358F0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_240135B8C()
{
  return sub_2401351B8();
}

uint64_t sub_240135BA8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2401358C0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_240135BD4(uint64_t a1)
{
  unint64_t v2 = sub_240136FA8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_240135C10(uint64_t a1)
{
  unint64_t v2 = sub_240136FA8();

  return MEMORY[0x270FA00B8](a1, v2);
}

void SiriSocialConversationDataModels.encode(to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  OUTLINED_FUNCTION_10();
  a22 = v26;
  a23 = v27;
  uint64_t v49 = v23;
  uint64_t v29 = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C81310);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v30);
  OUTLINED_FUNCTION_2();
  type metadata accessor for SiriSocialConversationDataModels.StoryDataModel(0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_2();
  uint64_t v48 = v32;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C81318);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v33);
  uint64_t v34 = OUTLINED_FUNCTION_15();
  type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(v34);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v35);
  OUTLINED_FUNCTION_20();
  uint64_t v38 = v37 - v36;
  type metadata accessor for SiriSocialConversationDataModels(0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v39);
  OUTLINED_FUNCTION_21();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C81320);
  OUTLINED_FUNCTION_0();
  uint64_t v41 = v40;
  MEMORY[0x270FA5388](v42);
  OUTLINED_FUNCTION_22();
  uint64_t v43 = *(void *)(v29 + 32);
  OUTLINED_FUNCTION_12();
  sub_240136F5C();
  sub_24013ADD0();
  sub_240136D14(v49, v25, (void (*)(void))type metadata accessor for SiriSocialConversationDataModels);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_240136FF4(v25, v48, (void (*)(void))type metadata accessor for SiriSocialConversationDataModels.StoryDataModel);
    a13 = 1;
    sub_240136FA8();
    OUTLINED_FUNCTION_35((uint64_t)&type metadata for SiriSocialConversationDataModels.StoryViewCodingKeys, (uint64_t)&a13);
    sub_240136BA0((uint64_t)&unk_268C81338);
    sub_24013AD60();
    OUTLINED_FUNCTION_8();
    v44();
    v45 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel;
    uint64_t v46 = v48;
  }
  else
  {
    sub_240136FF4(v25, v38, (void (*)(void))type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel);
    a12 = 0;
    sub_240137054();
    OUTLINED_FUNCTION_35((uint64_t)&type metadata for SiriSocialConversationDataModels.ButtonStackViewCodingKeys, (uint64_t)&a12);
    sub_240136BA0((uint64_t)&unk_268C81348);
    sub_24013AD60();
    OUTLINED_FUNCTION_8();
    v47();
    v45 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel;
    uint64_t v46 = v38;
  }
  sub_240136BE4(v46, (void (*)(void))v45);
  (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v24, v43);
  OUTLINED_FUNCTION_9();
}

void SiriSocialConversationDataModels.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  OUTLINED_FUNCTION_10();
  a22 = v24;
  a23 = v25;
  v84 = v23;
  uint64_t v27 = v26;
  uint64_t v75 = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C81350);
  OUTLINED_FUNCTION_0();
  uint64_t v78 = v29;
  uint64_t v79 = v30;
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_2();
  uint64_t v81 = v31;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C81358);
  OUTLINED_FUNCTION_0();
  uint64_t v76 = v33;
  uint64_t v77 = v32;
  MEMORY[0x270FA5388](v32);
  OUTLINED_FUNCTION_2();
  uint64_t v80 = v34;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C81360);
  OUTLINED_FUNCTION_0();
  uint64_t v82 = v36;
  uint64_t v83 = v35;
  MEMORY[0x270FA5388](v35);
  OUTLINED_FUNCTION_6();
  uint64_t v37 = type metadata accessor for SiriSocialConversationDataModels(0);
  OUTLINED_FUNCTION_1();
  uint64_t v39 = MEMORY[0x270FA5388](v38);
  uint64_t v41 = (char *)&v71 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = MEMORY[0x270FA5388](v39);
  v44 = (char *)&v71 - v43;
  MEMORY[0x270FA5388](v42);
  uint64_t v46 = (char *)&v71 - v45;
  __swift_project_boxed_opaque_existential_1(v27, v27[3]);
  sub_240136F5C();
  v47 = v84;
  sub_24013ADC0();
  if (v47) {
    goto LABEL_8;
  }
  v72 = v41;
  v73 = v44;
  v71 = v46;
  uint64_t v74 = v37;
  v84 = v27;
  uint64_t v48 = sub_24013AD20();
  uint64_t v49 = *(void *)(v48 + 16);
  if (!v49
    || (char v50 = *(unsigned char *)(v48 + 32),
        sub_2401370A0(1, v49, v48, v48 + 32, 0, (2 * v49) | 1),
        uint64_t v52 = v51,
        unint64_t v54 = v53,
        swift_bridgeObjectRelease(),
        v52 != v54 >> 1))
  {
    uint64_t v56 = v74;
    uint64_t v57 = sub_24013ACC0();
    swift_allocError();
    v59 = v58;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C81368);
    uint64_t *v59 = v56;
    sub_24013ACE0();
    sub_24013ACB0();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v57 - 8) + 104))(v59, *MEMORY[0x263F8DCB0], v57);
    swift_willThrow();
    swift_unknownObjectRelease();
    uint64_t v60 = OUTLINED_FUNCTION_5();
    v61(v60);
    uint64_t v27 = v84;
LABEL_8:
    uint64_t v62 = (uint64_t)v27;
    goto LABEL_9;
  }
  if (v50)
  {
    a13 = 1;
    sub_240136FA8();
    OUTLINED_FUNCTION_38((uint64_t)&type metadata for SiriSocialConversationDataModels.StoryViewCodingKeys, (uint64_t)&a13);
    type metadata accessor for SiriSocialConversationDataModels.StoryDataModel(0);
    sub_240136BA0((uint64_t)&unk_268C81370);
    uint64_t v55 = (uint64_t)v72;
    sub_24013AD10();
    OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_8();
    v63();
    swift_unknownObjectRelease();
    uint64_t v64 = OUTLINED_FUNCTION_5();
    v65(v64);
    swift_storeEnumTagMultiPayload();
    uint64_t v66 = v55;
  }
  else
  {
    a12 = 0;
    sub_240137054();
    OUTLINED_FUNCTION_38((uint64_t)&type metadata for SiriSocialConversationDataModels.ButtonStackViewCodingKeys, (uint64_t)&a12);
    type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(0);
    sub_240136BA0((uint64_t)&unk_268C81378);
    uint64_t v66 = (uint64_t)v73;
    sub_24013AD10();
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_8();
    v67();
    swift_unknownObjectRelease();
    uint64_t v68 = OUTLINED_FUNCTION_5();
    v69(v68);
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v70 = (uint64_t)v71;
  sub_240136FF4(v66, (uint64_t)v71, (void (*)(void))type metadata accessor for SiriSocialConversationDataModels);
  sub_240136FF4(v70, v75, (void (*)(void))type metadata accessor for SiriSocialConversationDataModels);
  uint64_t v62 = (uint64_t)v84;
LABEL_9:
  __swift_destroy_boxed_opaque_existential_1(v62);
  OUTLINED_FUNCTION_9();
}

unint64_t sub_24013657C()
{
  return 0xD00000000000001ELL;
}

#error "2401365AC: call analysis failed (funcsize=6)"

#error "2401365C4: call analysis failed (funcsize=6)"

unint64_t sub_2401365D0(uint64_t a1, uint64_t a2)
{
  sub_24013AD80();
  sub_24013ACA0();
  uint64_t v4 = sub_24013ADB0();

  return sub_240136648(a1, a2, v4);
}

unint64_t sub_240136648(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24013AD70() & 1) == 0)
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
      while (!v14 && (sub_24013AD70() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_24013672C(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = a2 + 64;
  uint64_t v2 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  uint64_t v4 = v3 & *(void *)(a2 + 64);
  int64_t v5 = (unint64_t)(v2 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v7 = 0;
  int64_t v8 = 0;
  if (!v4) {
    goto LABEL_5;
  }
LABEL_4:
  for (v4 &= v4 - 1; ; uint64_t v4 = (v10 - 1) & v10)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24013ACA0();
    swift_bridgeObjectRelease();
    sub_24013ACA0();
    swift_bridgeObjectRelease();
    uint64_t result = sub_24013ADB0();
    v7 ^= result;
    if (v4) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v9 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    if (v9 >= v5) {
      goto LABEL_19;
    }
    uint64_t v10 = *(void *)(v12 + 8 * v9);
    ++v8;
    if (!v10)
    {
      int64_t v8 = v9 + 1;
      if (v9 + 1 >= v5) {
        goto LABEL_19;
      }
      uint64_t v10 = *(void *)(v12 + 8 * v8);
      if (!v10) {
        break;
      }
    }
LABEL_16:
    ;
  }
  int64_t v11 = v9 + 2;
  if (v11 >= v5)
  {
LABEL_19:
    swift_release();
    return sub_24013AD90();
  }
  uint64_t v10 = *(void *)(v12 + 8 * v11);
  if (v10)
  {
    int64_t v8 = v11;
    goto LABEL_16;
  }
  while (1)
  {
    int64_t v8 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v8 >= v5) {
      goto LABEL_19;
    }
    uint64_t v10 = *(void *)(v12 + 8 * v8);
    ++v11;
    if (v10) {
      goto LABEL_16;
    }
  }
LABEL_21:
  __break(1u);
  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_240136938()
{
  unint64_t result = qword_268C81238;
  if (!qword_268C81238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C81238);
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

unint64_t sub_2401369D4(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_14(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_240136A38()
{
  unint64_t result = qword_268C81268;
  if (!qword_268C81268)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C81248);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C81268);
  }
  return result;
}

uint64_t type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(uint64_t a1)
{
  return sub_240136F28(a1, (uint64_t *)&unk_268C813C0);
}

unint64_t sub_240136AC4()
{
  unint64_t result = qword_268C81288;
  if (!qword_268C81288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C81288);
  }
  return result;
}

unint64_t sub_240136B10(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_14(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C81270);
    sub_240136BA0(v4);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_240136BA0(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_14(a1);
  if (!result)
  {
    v3(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t sub_240136BE4(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  v3();
  return a1;
}

unint64_t sub_240136C38(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_14(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C81278);
    sub_240136B10((uint64_t)&unk_268C81298);
    sub_240136B10((uint64_t)&unk_268C812A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t sub_240136D14(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t type metadata accessor for SiriSocialConversationDataModels.StoryDataModel(uint64_t a1)
{
  return sub_240136F28(a1, (uint64_t *)&unk_268C813D8);
}

unint64_t sub_240136D94()
{
  unint64_t result = qword_268C812E0;
  if (!qword_268C812E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C812E0);
  }
  return result;
}

unint64_t sub_240136DE0(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_14(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C812D0);
    sub_240136EAC((uint64_t)&unk_268C812F0);
    sub_240136EAC((uint64_t)&unk_268C812F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_240136EAC(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_14(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t type metadata accessor for SiriSocialConversationDataModels(uint64_t a1)
{
  return sub_240136F28(a1, (uint64_t *)&unk_268C81398);
}

uint64_t sub_240136F28(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_240136F5C()
{
  unint64_t result = qword_268C81328;
  if (!qword_268C81328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C81328);
  }
  return result;
}

unint64_t sub_240136FA8()
{
  unint64_t result = qword_268C81330;
  if (!qword_268C81330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C81330);
  }
  return result;
}

uint64_t sub_240136FF4(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

unint64_t sub_240137054()
{
  unint64_t result = qword_268C81340;
  if (!qword_268C81340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C81340);
  }
  return result;
}

uint64_t sub_2401370A0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (result < a5)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((uint64_t)(a6 >> 1) < result || (uint64_t)(a6 >> 1) < a2) {
    goto LABEL_10;
  }
  if (a2 < a5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a2 & 0x8000000000000000) == 0) {
    return swift_unknownObjectRetain();
  }
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_24013711C()
{
  return sub_240136BA0((uint64_t)&unk_268C81380);
}

unint64_t sub_240137164()
{
  return sub_240136BA0((uint64_t)&unk_268C81378);
}

unint64_t sub_2401371AC()
{
  return sub_240136BA0((uint64_t)&unk_268C81348);
}

unint64_t sub_2401371F4()
{
  return sub_240136BA0((uint64_t)&unk_268C81370);
}

unint64_t sub_24013723C()
{
  return sub_240136BA0((uint64_t)&unk_268C81338);
}

unint64_t sub_240137284()
{
  return sub_240136BA0((uint64_t)&unk_268C81388);
}

unint64_t sub_2401372CC()
{
  return sub_240136BA0((uint64_t)&unk_268C81390);
}

uint64_t sub_240137314()
{
  OUTLINED_FUNCTION_32();
  uint64_t result = SiriSocialConversationDataModels.ButtonModel.label.getter();
  *uint64_t v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_240137340()
{
  OUTLINED_FUNCTION_32();
  uint64_t result = SiriSocialConversationDataModels.ButtonStackModel.buttons.getter();
  *uint64_t v0 = result;
  return result;
}

uint64_t sub_24013736C()
{
  OUTLINED_FUNCTION_32();
  uint64_t result = SiriSocialConversationDataModels.StoryDataModel.dialogIds.getter();
  *uint64_t v0 = result;
  return result;
}

uint64_t sub_240137398()
{
  OUTLINED_FUNCTION_32();
  uint64_t result = SiriSocialConversationDataModels.StoryDataModel.storyTexts.getter();
  *uint64_t v0 = result;
  return result;
}

void *initializeBufferWithCopyOfBuffer for SiriSocialConversationDataModels(void *a1, void *a2, uint64_t a3)
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
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C812D0);
      uint64_t v7 = *(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16);
      v7(a1, a2, v6);
      uint64_t v8 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel(0);
      v7((void *)((char *)a1 + *(int *)(v8 + 20)), (void *)((char *)a2 + *(int *)(v8 + 20)), v6);
    }
    else
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C81278);
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
      uint64_t v11 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(0);
      uint64_t v12 = *(int *)(v11 + 20);
      uint64_t v13 = (void *)((char *)a1 + v12);
      BOOL v14 = (void *)((char *)a2 + v12);
      uint64_t v16 = *v14;
      uint64_t v15 = v14[1];
      *uint64_t v13 = v16;
      v13[1] = v15;
      *((unsigned char *)a1 + *(int *)(v11 + 24)) = *((unsigned char *)a2 + *(int *)(v11 + 24));
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for SiriSocialConversationDataModels(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C812D0);
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
    ((void (*)(void *__return_ptr, uint64_t, uint64_t))v6)((void *)(v2 - 8), a1, v2);
    uint64_t v3 = a1 + *(int *)(type metadata accessor for SiriSocialConversationDataModels.StoryDataModel(0) + 20);
    return v6(v3, v2);
  }
  else
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C81278);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
    type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(0);
    return swift_bridgeObjectRelease();
  }
}

uint64_t initializeWithCopy for SiriSocialConversationDataModels(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C812D0);
    uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
    v5(a1, a2, v4);
    uint64_t v6 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel(0);
    v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C81278);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(0);
    uint64_t v9 = *(int *)(v8 + 20);
    uint64_t v10 = (void *)(a1 + v9);
    uint64_t v11 = (uint64_t *)(a2 + v9);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    void *v10 = v13;
    v10[1] = v12;
    *(unsigned char *)(a1 + *(int *)(v8 + 24)) = *(unsigned char *)(a2 + *(int *)(v8 + 24));
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for SiriSocialConversationDataModels(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_240136BE4(a1, (void (*)(void))type metadata accessor for SiriSocialConversationDataModels);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C812D0);
      uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
      v5(a1, a2, v4);
      uint64_t v6 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel(0);
      v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
    }
    else
    {
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C81278);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      uint64_t v8 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(0);
      uint64_t v9 = *(int *)(v8 + 20);
      uint64_t v10 = (void *)(a1 + v9);
      uint64_t v11 = (void *)(a2 + v9);
      void *v10 = *v11;
      v10[1] = v11[1];
      *(unsigned char *)(a1 + *(int *)(v8 + 24)) = *(unsigned char *)(a2 + *(int *)(v8 + 24));
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for SiriSocialConversationDataModels(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C812D0);
    uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
    v5(a1, a2, v4);
    uint64_t v6 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel(0);
    v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C81278);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    uint64_t v8 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(0);
    *(_OWORD *)(a1 + *(int *)(v8 + 20)) = *(_OWORD *)(a2 + *(int *)(v8 + 20));
    *(unsigned char *)(a1 + *(int *)(v8 + 24)) = *(unsigned char *)(a2 + *(int *)(v8 + 24));
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for SiriSocialConversationDataModels(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_240136BE4(a1, (void (*)(void))type metadata accessor for SiriSocialConversationDataModels);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C812D0);
      uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
      v5(a1, a2, v4);
      uint64_t v6 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel(0);
      v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
    }
    else
    {
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C81278);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      uint64_t v8 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(0);
      *(_OWORD *)(a1 + *(int *)(v8 + 20)) = *(_OWORD *)(a2 + *(int *)(v8 + 20));
      *(unsigned char *)(a1 + *(int *)(v8 + 24)) = *(unsigned char *)(a2 + *(int *)(v8 + 24));
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_240137C04()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_240137C14()
{
  uint64_t result = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel(319);
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for SiriSocialConversationDataModels.ButtonModel(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (void *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C81220);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (void *)((char *)a1 + v8);
    uint64_t v11 = (void *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    void *v10 = *v11;
    v10[1] = v12;
    *(void *)((char *)a1 + v9) = *(void *)((char *)a2 + v9);
    uint64_t v13 = a3[8];
    *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
    BOOL v14 = (void *)((char *)a1 + v13);
    uint64_t v15 = (void *)((char *)a2 + v13);
    uint64_t v16 = v15[1];
    void *v14 = *v15;
    v14[1] = v16;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for SiriSocialConversationDataModels.ButtonModel(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C81220);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SiriSocialConversationDataModels.ButtonModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C81220);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  void *v9 = *v10;
  v9[1] = v11;
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v12 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  uint64_t v13 = (void *)(a1 + v12);
  BOOL v14 = (void *)(a2 + v12);
  uint64_t v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SiriSocialConversationDataModels.ButtonModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C81220);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  uint64_t v10 = a3[8];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for SiriSocialConversationDataModels.ButtonModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C81220);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  return a1;
}

uint64_t assignWithTake for SiriSocialConversationDataModels.ButtonModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C81220);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  uint64_t v13 = (void *)(a1 + v12);
  BOOL v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriSocialConversationDataModels.ButtonModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2401381AC);
}

uint64_t sub_2401381AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm(a1, a2, a3, &qword_268C81220);
}

uint64_t storeEnumTagSinglePayload for SiriSocialConversationDataModels.ButtonModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2401381CC);
}

void sub_2401381CC(uint64_t a1, int a2, int a3, uint64_t a4)
{
}

void sub_2401381D8()
{
  sub_240138288();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_240138288()
{
  if (!qword_268C813B8)
  {
    unint64_t v0 = sub_24013AC30();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268C813B8);
    }
  }
}

void *initializeBufferWithCopyOfBuffer for SiriSocialConversationDataModels.ButtonStackModel(void *a1, void *a2, uint64_t a3)
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
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C81278);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (void *)((char *)a1 + v8);
    uint64_t v11 = (void *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    void *v10 = *v11;
    v10[1] = v12;
    *((unsigned char *)a1 + v9) = *((unsigned char *)a2 + v9);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for SiriSocialConversationDataModels.ButtonStackModel(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C81278);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SiriSocialConversationDataModels.ButtonStackModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C81278);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  void *v9 = *v10;
  v9[1] = v11;
  *(unsigned char *)(a1 + v8) = *(unsigned char *)(a2 + v8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SiriSocialConversationDataModels.ButtonStackModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C81278);
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

uint64_t initializeWithTake for SiriSocialConversationDataModels.ButtonStackModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C81278);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for SiriSocialConversationDataModels.ButtonStackModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C81278);
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

uint64_t getEnumTagSinglePayload for SiriSocialConversationDataModels.ButtonStackModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2401386AC);
}

uint64_t sub_2401386AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm(a1, a2, a3, &qword_268C81278);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(a4);
  OUTLINED_FUNCTION_3();
  if (*(_DWORD *)(v8 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v7);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for SiriSocialConversationDataModels.ButtonStackModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24013875C);
}

void sub_24013875C(uint64_t a1, int a2, int a3, uint64_t a4)
{
}

void __swift_store_extra_inhabitant_indexTm(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t *a5)
{
  __swift_instantiateConcreteTypeFromMangledName(a5);
  OUTLINED_FUNCTION_3();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = OUTLINED_FUNCTION_33();
    __swift_storeEnumTagSinglePayload(v10, v11, v12, v13);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
}

void sub_2401387E8()
{
  sub_240138DEC(319, &qword_268C813D0, &qword_268C81270);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for SiriSocialConversationDataModels.StoryDataModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C812D0);
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
  }
  return a1;
}

uint64_t destroy for SiriSocialConversationDataModels.StoryDataModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C812D0);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v7)((void *)(v4 - 8), a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);

  return v7(v5, v4);
}

uint64_t initializeWithCopy for SiriSocialConversationDataModels.StoryDataModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C812D0);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t assignWithCopy for SiriSocialConversationDataModels.StoryDataModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C812D0);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t initializeWithTake for SiriSocialConversationDataModels.StoryDataModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C812D0);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t assignWithTake for SiriSocialConversationDataModels.StoryDataModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C812D0);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriSocialConversationDataModels.StoryDataModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_240138CAC);
}

uint64_t sub_240138CAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C812D0);

  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for SiriSocialConversationDataModels.StoryDataModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_240138D0C);
}

uint64_t sub_240138D0C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C812D0);
  uint64_t v0 = OUTLINED_FUNCTION_33();

  return __swift_storeEnumTagSinglePayload(v0, v1, v2, v3);
}

void sub_240138D50()
{
  sub_240138DEC(319, &qword_268C813E8, &qword_268C812C8);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_240138DEC(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v4 = sub_24013AC30();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for SiriSocialConversationDataModels.CodingKeys()
{
  return &type metadata for SiriSocialConversationDataModels.CodingKeys;
}

uint64_t sub_240138E70()
{
  return 0;
}

ValueMetadata *type metadata accessor for SiriSocialConversationDataModels.ButtonStackViewCodingKeys()
{
  return &type metadata for SiriSocialConversationDataModels.ButtonStackViewCodingKeys;
}

uint64_t _s22SiriSocialConversation32SiriSocialConversationDataModelsO25ButtonStackViewCodingKeysOwet_0(unsigned int *a1, int a2)
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

unsigned char *_s22SiriSocialConversation32SiriSocialConversationDataModelsO25ButtonStackViewCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x240138F74);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriSocialConversationDataModels.StoryViewCodingKeys()
{
  return &type metadata for SiriSocialConversationDataModels.StoryViewCodingKeys;
}

uint64_t _s22SiriSocialConversation32SiriSocialConversationDataModelsO10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s22SiriSocialConversation32SiriSocialConversationDataModelsO10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x240139100);
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

uint64_t sub_240139128(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_240139130(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SiriSocialConversationDataModels.StoryDataModel.CodingKeys()
{
  return &type metadata for SiriSocialConversationDataModels.StoryDataModel.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SiriSocialConversationDataModels.ButtonStackModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SiriSocialConversationDataModels.ButtonStackModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2401392A0);
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

ValueMetadata *type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel.CodingKeys()
{
  return &type metadata for SiriSocialConversationDataModels.ButtonStackModel.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SiriSocialConversationDataModels.ButtonModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SiriSocialConversationDataModels.ButtonModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x24013942CLL);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

unsigned char *sub_240139454(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SiriSocialConversationDataModels.ButtonModel.CodingKeys()
{
  return &type metadata for SiriSocialConversationDataModels.ButtonModel.CodingKeys;
}

unint64_t sub_240139470()
{
  unint64_t result = qword_268C813F0;
  if (!qword_268C813F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C813F0);
  }
  return result;
}

unint64_t sub_2401394C0()
{
  unint64_t result = qword_268C813F8;
  if (!qword_268C813F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C813F8);
  }
  return result;
}

unint64_t sub_240139510()
{
  unint64_t result = qword_268C81400;
  if (!qword_268C81400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C81400);
  }
  return result;
}

unint64_t sub_240139560()
{
  unint64_t result = qword_268C81408;
  if (!qword_268C81408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C81408);
  }
  return result;
}

unint64_t sub_2401395B0()
{
  unint64_t result = qword_268C81410;
  if (!qword_268C81410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C81410);
  }
  return result;
}

unint64_t sub_240139600()
{
  unint64_t result = qword_268C81418;
  if (!qword_268C81418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C81418);
  }
  return result;
}

unint64_t sub_240139650()
{
  unint64_t result = qword_268C81420;
  if (!qword_268C81420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C81420);
  }
  return result;
}

unint64_t sub_2401396A0()
{
  unint64_t result = qword_268C81428;
  if (!qword_268C81428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C81428);
  }
  return result;
}

unint64_t sub_2401396F0()
{
  unint64_t result = qword_268C81430;
  if (!qword_268C81430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C81430);
  }
  return result;
}

unint64_t sub_240139740()
{
  unint64_t result = qword_268C81438;
  if (!qword_268C81438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C81438);
  }
  return result;
}

unint64_t sub_240139790()
{
  unint64_t result = qword_268C81440;
  if (!qword_268C81440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C81440);
  }
  return result;
}

unint64_t sub_2401397E0()
{
  unint64_t result = qword_268C81448;
  if (!qword_268C81448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C81448);
  }
  return result;
}

unint64_t sub_240139830()
{
  unint64_t result = qword_268C81450;
  if (!qword_268C81450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C81450);
  }
  return result;
}

unint64_t sub_240139880()
{
  unint64_t result = qword_268C81458;
  if (!qword_268C81458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C81458);
  }
  return result;
}

unint64_t sub_2401398D0()
{
  unint64_t result = qword_268C81460;
  if (!qword_268C81460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C81460);
  }
  return result;
}

unint64_t sub_240139920()
{
  unint64_t result = qword_268C81468;
  if (!qword_268C81468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C81468);
  }
  return result;
}

unint64_t sub_240139970()
{
  unint64_t result = qword_268C81470;
  if (!qword_268C81470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C81470);
  }
  return result;
}

unint64_t sub_2401399C0()
{
  unint64_t result = qword_268C81478;
  if (!qword_268C81478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C81478);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_4()
{
  *(unsigned char *)(v0 - 66) = 1;
  return sub_24013AD40();
}

uint64_t OUTLINED_FUNCTION_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11()
{
  return sub_24013ADD0();
}

void *OUTLINED_FUNCTION_12()
{
  return __swift_project_boxed_opaque_existential_1(v0, v1);
}

uint64_t OUTLINED_FUNCTION_13()
{
  return *(void *)(v0 - 160);
}

uint64_t OUTLINED_FUNCTION_14(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t OUTLINED_FUNCTION_15()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_16@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_17()
{
  return sub_24013AD60();
}

uint64_t OUTLINED_FUNCTION_18()
{
  return type metadata accessor for SiriSocialConversationDataModels.ButtonModel(0);
}

uint64_t OUTLINED_FUNCTION_19()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_24()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_25@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 96) = a1;
  return sub_24013ACF0();
}

uint64_t OUTLINED_FUNCTION_26(uint64_t a1)
{
  return MEMORY[0x270F756A8](v1, a1);
}

uint64_t OUTLINED_FUNCTION_27()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_29()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_30(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

void *OUTLINED_FUNCTION_31()
{
  return malloc(0x28uLL);
}

uint64_t OUTLINED_FUNCTION_33()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_34()
{
  return sub_24013AD80();
}

uint64_t OUTLINED_FUNCTION_35(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(v2 - 104);
  return MEMORY[0x270F9F390](a1, a2, v4, a1);
}

uint64_t OUTLINED_FUNCTION_36()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_37()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_38(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F9F250](a1, a2, v2, a1);
}

void sub_240139DCC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_intentType);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_24013AC90();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_240139E34(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  if (*(void *)(a1 + 8)) {
    uint64_t v3 = sub_24013AC80();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setIntentType_);
}

id SocialConversationIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SocialConversationIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SocialConversationIntent()
{
  return self;
}

id SocialConversationIntent.init(coder:)(void *a1)
{
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for SocialConversationIntent();
  id v9 = OUTLINED_FUNCTION_0_0((uint64_t)v11.super_class, sel_initWithCoder_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id SocialConversationIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_24013AC80();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithIdentifier_backingStore_, v6, a3);

  return v7;
}

id SocialConversationIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    uint64_t v5 = (void *)sub_24013AC80();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for SocialConversationIntent();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithIdentifier_backingStore_, v5, a3);

  return v6;
}

id SocialConversationIntent.__allocating_init(domain:verb:parametersByName:)()
{
  objc_super v2 = (void *)OUTLINED_FUNCTION_1_0();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_24013AC80();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v4 = (void *)sub_24013AC40();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = objc_msgSend(objc_allocWithZone(v0), sel_initWithDomain_verb_parametersByName_, v2, v3, v4);

  return v5;
}

id SocialConversationIntent.init(domain:verb:parametersByName:)()
{
  objc_super v2 = (void *)OUTLINED_FUNCTION_1_0();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_24013AC80();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v4 = (void *)sub_24013AC40();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for SocialConversationIntent();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithDomain_verb_parametersByName_, v2, v3, v4);

  return v5;
}

id SocialConversationIntent.__deallocating_deinit()
{
  return sub_24013AA44(type metadata accessor for SocialConversationIntent);
}

unint64_t SocialConversationIntentResponseCode.init(rawValue:)(unint64_t result)
{
  if (result > 6) {
    return 0;
  }
  return result;
}

BOOL sub_24013A348(uint64_t *a1, uint64_t *a2)
{
  return sub_24013A354(*a1, *a2);
}

BOOL sub_24013A354(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_24013A360()
{
  return sub_24013A368();
}

uint64_t sub_24013A368()
{
  return sub_24013ADB0();
}

uint64_t sub_24013A3B0()
{
  return sub_24013A3B8();
}

uint64_t sub_24013A3B8()
{
  return sub_24013AD90();
}

uint64_t sub_24013A3E0()
{
  return sub_24013A3E8();
}

uint64_t sub_24013A3E8()
{
  return sub_24013ADB0();
}

unint64_t sub_24013A42C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = SocialConversationIntentResponseCode.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_24013A460(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_24013A490()
{
  uint64_t v1 = v0 + OBJC_IVAR___SocialConversationIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_24013A500(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___SocialConversationIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

char *SocialConversationIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return SocialConversationIntentResponse.init(code:userActivity:)(a1, a2);
}

char *SocialConversationIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v5 = (char *)objc_msgSend(v2, sel_init);
  id v6 = &v5[OBJC_IVAR___SocialConversationIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  objc_super v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id SocialConversationIntentResponse.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id SocialConversationIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___SocialConversationIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SocialConversationIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SocialConversationIntentResponse()
{
  return self;
}

id SocialConversationIntentResponse.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SocialConversationIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___SocialConversationIntentResponse_code] = 0;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for SocialConversationIntentResponse();
  id v9 = OUTLINED_FUNCTION_0_0((uint64_t)v11.super_class, sel_initWithCoder_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id SocialConversationIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v3;
}

id SocialConversationIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___SocialConversationIntentResponse_code] = 0;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for SocialConversationIntentResponse();
  id v9 = OUTLINED_FUNCTION_0_0((uint64_t)v11.super_class, sel_initWithBackingStore_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id SocialConversationIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    objc_super v2 = (void *)sub_24013AC40();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithPropertiesByName_, v2);

  return v3;
}

id SocialConversationIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___SocialConversationIntentResponse_code] = 0;
  if (a1)
  {
    objc_super v2 = (void *)sub_24013AC40();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for SocialConversationIntentResponse();
  id v9 = OUTLINED_FUNCTION_0_0((uint64_t)v11.super_class, sel_initWithPropertiesByName_, v3, v4, v5, v6, v7, v8, v11);

  if (v9) {
  return v9;
  }
}

id SocialConversationIntentResponse.__deallocating_deinit()
{
  return sub_24013AA44(type metadata accessor for SocialConversationIntentResponse);
}

id sub_24013AA44(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_24013AA80()
{
  unint64_t result = qword_268C81488;
  if (!qword_268C81488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C81488);
  }
  return result;
}

char *keypath_get_selector_intentType()
{
  return sel_intentType;
}

uint64_t sub_24013AAE0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24013A490();
  *a1 = result;
  return result;
}

uint64_t sub_24013AB0C(uint64_t *a1)
{
  return sub_24013A500(*a1);
}

ValueMetadata *type metadata accessor for SocialConversationIntentResponseCode()
{
  return &type metadata for SocialConversationIntentResponseCode;
}

uint64_t method lookup function for SocialConversationIntentResponse(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SocialConversationIntentResponse);
}

uint64_t dispatch thunk of SocialConversationIntentResponse.code.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

id OUTLINED_FUNCTION_0_0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  return objc_msgSendSuper2(&a9, a2, v9);
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return sub_24013AC80();
}

uint64_t sub_24013ABD0()
{
  return MEMORY[0x270F739D8]();
}

uint64_t sub_24013ABE0()
{
  return MEMORY[0x270F756A0]();
}

uint64_t sub_24013AC00()
{
  return MEMORY[0x270F756B0]();
}

uint64_t sub_24013AC10()
{
  return MEMORY[0x270F756B8]();
}

uint64_t sub_24013AC20()
{
  return MEMORY[0x270F756C0]();
}

uint64_t sub_24013AC30()
{
  return MEMORY[0x270F756C8]();
}

uint64_t sub_24013AC40()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24013AC50()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_24013AC60()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_24013AC70()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_24013AC80()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24013AC90()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24013ACA0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24013ACB0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24013ACC0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24013ACE0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24013ACF0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24013AD00()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_24013AD10()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24013AD20()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24013AD40()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24013AD50()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_24013AD60()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24013AD70()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24013AD80()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24013AD90()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24013ADA0()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_24013ADB0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24013ADC0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24013ADD0()
{
  return MEMORY[0x270F9FD98]();
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}