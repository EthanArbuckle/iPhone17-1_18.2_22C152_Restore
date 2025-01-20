uint64_t SnippetClientContext.onReceiveActionFromHost.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t vars8;

  v3 = v1 + qword_26A5E0908;
  sub_25C9B8350();
  OUTLINED_FUNCTION_9();
  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  return v6(a1, v3, v4);
}

uint64_t sub_25C98B544(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6, v7);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_4();
  v10();
  sub_25C98CA64((uint64_t)v9, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(a1, a2);
}

uint64_t SnippetClientContext.viewModel.getter()
{
  return swift_release();
}

uint64_t sub_25C98B6F4()
{
  return SnippetClientContext.viewModel.getter();
}

uint64_t sub_25C98B718(uint64_t a1)
{
  MEMORY[0x270FA5388](a1, a1);
  v2 = (char *)&v5 - v1;
  (*(void (**)(char *))(v3 + 16))((char *)&v5 - v1);
  return SnippetClientContext.viewModel.setter(v2);
}

uint64_t SnippetClientContext.viewModel.setter(char *a1)
{
  v22 = a1;
  OUTLINED_FUNCTION_1();
  uint64_t v2 = *(void *)(v1 + 80);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4, v5);
  v21 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6, v8);
  v10 = (char *)&v21 - v9;
  uint64_t v35 = v2;
  OUTLINED_FUNCTION_1();
  uint64_t v36 = *(void *)(v11 + 88);
  uint64_t v12 = v36;
  OUTLINED_FUNCTION_1();
  uint64_t v37 = *(void *)(v13 + 96);
  uint64_t v14 = v37;
  OUTLINED_FUNCTION_1();
  uint64_t v38 = *(void *)(v15 + 104);
  uint64_t v16 = v38;
  swift_getKeyPath();
  uint64_t v31 = v2;
  uint64_t v32 = v12;
  uint64_t v33 = v14;
  uint64_t v34 = v16;
  swift_getKeyPath();
  sub_25C9B7E00();
  swift_release();
  swift_release();
  uint64_t v27 = v2;
  uint64_t v28 = v12;
  uint64_t v29 = v14;
  uint64_t v30 = v16;
  swift_getKeyPath();
  uint64_t v23 = v2;
  uint64_t v24 = v12;
  uint64_t v25 = v14;
  uint64_t v26 = v16;
  swift_getKeyPath();
  v17 = v22;
  OUTLINED_FUNCTION_4();
  v18();
  swift_retain();
  sub_25C9B7E10();
  sub_25C98BA08();
  v19 = *(uint64_t (**)(char *, uint64_t))(v3 + 8);
  v19(v17, v2);
  return v19(v10, v2);
}

void sub_25C98BA08()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  uint64_t v3 = *v0;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DF840);
  uint64_t v6 = MEMORY[0x270FA5388](v4 - 8, v5);
  uint64_t v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(ValueMetadata **)(v2 + 80);
  Description = v9[-1].Description;
  MEMORY[0x270FA5388](v6, v11);
  uint64_t v13 = (char *)v23 - v12;
  SnippetClientContext.viewModel.getter();
  char v14 = sub_25C9B8130();
  uint64_t v15 = (void (*)(char *, ValueMetadata *))Description[1];
  v15(v13, v9);
  if ((v14 & 1) == 0)
  {
    uint64_t v24 = &type metadata for Feature;
    *(void *)&long long v25 = sub_25C98CB98();
    char v16 = sub_25C9B7C60();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    uint64_t v17 = *v1;
    if (v16)
    {
      uint64_t v18 = MEMORY[0x26119A970]((char *)v1 + *(void *)(v17 + 128));
      if (v18)
      {
        v19 = (void *)v18;
        sub_25C99CC48((uint64_t)v8);

        uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5DF850);
        if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v20) == 1)
        {
          sub_25C98CCC0((uint64_t)v8);
        }
        else
        {
          SnippetClientContext.viewModel.getter();
          sub_25C995A70();
          v15(v13, v9);
          swift_getOpaqueTypeConformance2();
          sub_25C98CD20();
          sub_25C9B7CE0();
          (*(void (**)(char *, uint64_t))(*(void *)(v20 - 8) + 8))(v8, v20);
        }
      }
    }
    else
    {
      uint64_t v21 = MEMORY[0x26119A970]((char *)v1 + *(void *)(v17 + 136));
      if (v21)
      {
        v22 = (void *)v21;
        uint64_t v24 = v9;
        long long v25 = *(_OWORD *)(v3 + 88);
        __swift_allocate_boxed_opaque_existential_2(v23);
        SnippetClientContext.viewModel.getter();
        sub_25C991B08((uint64_t)v23);
      }
    }
  }
}

void (*SnippetClientContext.viewModel.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  *uint64_t v3 = v1;
  OUTLINED_FUNCTION_2();
  *(void *)(v5 + 8) = *(void *)(v4 + 80);
  OUTLINED_FUNCTION_0();
  *(void *)(v6 + 16) = v7;
  size_t v9 = *(void *)(v8 + 64);
  v3[3] = malloc(v9);
  v3[4] = malloc(v9);
  SnippetClientContext.viewModel.getter();
  return sub_25C98BDE0;
}

void sub_25C98BDE0(uint64_t a1, char a2)
{
}

uint64_t SnippetClientContext.$viewModel.getter()
{
  return swift_endAccess();
}

uint64_t sub_25C98BE88()
{
  return SnippetClientContext.$viewModel.getter();
}

uint64_t sub_25C98BEAC(uint64_t a1)
{
  uint64_t v2 = sub_25C9B7E20();
  MEMORY[0x270FA5388](v2, v3);
  uint64_t v5 = (char *)&v8 - v4;
  (*(void (**)(char *, uint64_t))(v6 + 16))((char *)&v8 - v4, a1);
  return SnippetClientContext.$viewModel.setter((uint64_t)v5);
}

uint64_t SnippetClientContext.$viewModel.setter(uint64_t a1)
{
  OUTLINED_FUNCTION_2();
  uint64_t v2 = sub_25C9B7E20();
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5, v6);
  OUTLINED_FUNCTION_4();
  v7();
  OUTLINED_FUNCTION_7();
  sub_25C9B7E30();
  sub_25C9B7DF0();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

void (*SnippetClientContext.$viewModel.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  *uint64_t v3 = v1;
  OUTLINED_FUNCTION_2();
  uint64_t v4 = sub_25C9B7E20();
  v3[1] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[2] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[3] = malloc(v6);
  v3[4] = malloc(v6);
  SnippetClientContext.$viewModel.getter();
  return sub_25C98C164;
}

void sub_25C98C164(uint64_t a1, char a2)
{
}

void sub_25C98C17C(uint64_t a1, char a2, void (*a3)(void *))
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)(*(void *)a1 + 24);
  size_t v6 = *(void **)(*(void *)a1 + 32);
  if (a2)
  {
    uint64_t v7 = v4[1];
    uint64_t v8 = v4[2];
    OUTLINED_FUNCTION_4();
    v9();
    a3(v5);
    (*(void (**)(void *, uint64_t))(v8 + 8))(v6, v7);
  }
  else
  {
    a3(*(void **)(*(void *)a1 + 32));
  }
  free(v6);
  free(v5);
  free(v4);
}

uint64_t sub_25C98C240(uint64_t a1, uint64_t a2)
{
  return sub_25C98C418(a1, a2, (void (*)(uint64_t, uint64_t))sub_25C98C258);
}

uint64_t sub_25C98C258(void *a1)
{
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_2();
  uint64_t v5 = *(void *)(v4 + 80);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v6, v7);
  size_t v9 = (char *)&v16 - v8;
  id v10 = objc_msgSend(self, sel_defaultCenter);
  if (qword_26A5DF680 != -1) {
    swift_once();
  }
  sub_25C9B8360();

  OUTLINED_FUNCTION_10();
  swift_unknownObjectWeakInit();
  OUTLINED_FUNCTION_10();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  uint64_t v11 = OUTLINED_FUNCTION_3();
  v12(v11);
  OUTLINED_FUNCTION_7();
  sub_25C98B544((uint64_t)v9, v5);
  swift_endAccess();

  uint64_t v13 = OUTLINED_FUNCTION_8();
  v14(v13);
  return v2;
}

uint64_t sub_25C98C400(uint64_t a1, uint64_t a2)
{
  return sub_25C98C418(a1, a2, (void (*)(uint64_t, uint64_t))sub_25C98C470);
}

uint64_t sub_25C98C418(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  uint64_t v6 = swift_allocObject();
  a3(a1, a2);
  return v6;
}

uint64_t sub_25C98C470(void *a1)
{
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_2();
  uint64_t v5 = *(void *)(v4 + 80);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v6, v7);
  size_t v9 = (char *)&v16 - v8;
  id v10 = objc_msgSend(self, sel_defaultCenter);
  if (qword_26A5DF680 != -1) {
    swift_once();
  }
  sub_25C9B8360();

  OUTLINED_FUNCTION_10();
  swift_unknownObjectWeakInit();
  OUTLINED_FUNCTION_10();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  uint64_t v11 = OUTLINED_FUNCTION_3();
  v12(v11);
  OUTLINED_FUNCTION_7();
  sub_25C98B544((uint64_t)v9, v5);
  swift_endAccess();

  uint64_t v13 = OUTLINED_FUNCTION_8();
  v14(v13);
  return v2;
}

void SnippetClientContext.sendAction(_:)(void *a1)
{
  OUTLINED_FUNCTION_2();
  uint64_t v4 = MEMORY[0x26119A970](v1 + *(void *)(v3 + 128));
  if (v4)
  {
    id v5 = (id)v4;
    _SnippetClientController.sendAction(_:)(a1);
  }
}

uint64_t SnippetClientContext.deinit()
{
  uint64_t v1 = v0 + qword_26A5E0908;
  sub_25C9B8350();
  OUTLINED_FUNCTION_9();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  uint64_t v3 = v0 + *(void *)(*(void *)v0 + 120);
  sub_25C9B7E30();
  OUTLINED_FUNCTION_9();
  (*(void (**)(uint64_t))(v4 + 8))(v3);
  swift_unknownObjectWeakDestroy();
  OUTLINED_FUNCTION_2();
  swift_unknownObjectWeakDestroy();
  return v0;
}

uint64_t SnippetClientContext.__deallocating_deinit()
{
  SnippetClientContext.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_25C98C7DC()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_25C98C7E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C9B7D60();
  *a1 = result;
  return result;
}

uint64_t sub_25C98C84C()
{
  uint64_t result = sub_25C9B8350();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25C9B7E30();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_initClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t type metadata accessor for SnippetClientContext(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for SnippetClientContext);
}

uint64_t method lookup function for SnippetClientContext(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SnippetClientContext);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_25C98C968(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25C98C988(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
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
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

uint64_t sub_25C98C9C4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_25C98CA04(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25C98CA24(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

uint64_t sub_25C98CA64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1, a2);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a2);
  sub_25C9B7DD0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, a2);
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

unint64_t sub_25C98CB98()
{
  unint64_t result = qword_26A5DF848;
  if (!qword_26A5DF848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DF848);
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

uint64_t *__swift_allocate_boxed_opaque_existential_2(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_25C98CCC0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DF840);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_25C98CD20()
{
  unint64_t result = qword_26A5E03D0;
  if (!qword_26A5E03D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E03D0);
  }
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_25C98CD80(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t OUTLINED_FUNCTION_3()
{
  return v0;
}

__n128 OUTLINED_FUNCTION_5(uint64_t a1, _OWORD *a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t OUTLINED_FUNCTION_6()
{
  return 32;
}

uint64_t OUTLINED_FUNCTION_7()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_8()
{
  return v0;
}

uint64_t SizeDimensionRequestType.description.getter(uint64_t a1)
{
  if (a1 == 1) {
    return 0x6465786966;
  }
  if (!a1) {
    return 0x63696D616E7964;
  }
  uint64_t result = sub_25C9B8600();
  __break(1u);
  return result;
}

BOOL SizeDimensionRequestType.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

BOOL sub_25C98CF24(uint64_t *a1, uint64_t *a2)
{
  return sub_25C9A6DE8(*a1, *a2);
}

uint64_t sub_25C98CF30()
{
  return sub_25C9A6F64();
}

uint64_t sub_25C98CF38()
{
  return sub_25C9A7064();
}

uint64_t sub_25C98CF40()
{
  return sub_25C9A7194();
}

BOOL sub_25C98CF48@<W0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  BOOL result = SizeDimensionRequestType.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_25C98CF7C(void *a1@<X8>)
{
  *a1 = *v1;
}

double SizeDimensionRequest.minimum.getter()
{
  return *(double *)(v0 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_minimum);
}

double SizeDimensionRequest.maximum.getter()
{
  return *(double *)(v0 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_maximum);
}

uint64_t SizeDimensionRequest.type.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_type);
}

id SizeDimensionRequest.__allocating_init(minimum:maximum:type:)(uint64_t a1, double a2, double a3)
{
  id v7 = objc_allocWithZone(v3);
  return SizeDimensionRequest.init(minimum:maximum:type:)(a1, a2, a3);
}

id SizeDimensionRequest.init(minimum:maximum:type:)(uint64_t a1, double a2, double a3)
{
  if (a2 <= 0.0) {
    a2 = 0.0;
  }
  *(double *)&v3[OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_minimum] = a2;
  *(double *)&v3[OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_maximum] = a3;
  *(void *)&v3[OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_type] = a1;
  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for SizeDimensionRequest();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for SizeDimensionRequest()
{
  return self;
}

id SizeDimensionRequest.__allocating_init(minimum:maximum:)(double a1, double a2)
{
  id v5 = objc_allocWithZone(v2);
  return objc_msgSend(v5, sel_initWithMinimum_maximum_type_, 0, a1, a2);
}

id SizeDimensionRequest.init(minimum:maximum:)()
{
  return objc_msgSend(v0, sel_initWithMinimum_maximum_type_, 0);
}

id sub_25C98D1A8(double a1)
{
  id v2 = objc_allocWithZone((Class)type metadata accessor for SizeDimensionRequest());
  return SizeDimensionRequest.init(minimum:maximum:type:)(1, a1, a1);
}

double sub_25C98D1EC(double a1)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_type);
  if (v2 == 1) {
    return *(double *)(v1 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_maximum);
  }
  double result = 0.0;
  if (!v2)
  {
    double result = *(double *)(v1 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_maximum);
    if (result >= a1) {
      double result = a1;
    }
    if (result <= *(double *)(v1 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_minimum)) {
      return *(double *)(v1 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_minimum);
    }
  }
  return result;
}

uint64_t sub_25C98D270()
{
  double v1 = *(double *)(v0 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_minimum);
  if ((~*(void *)&v1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (v1 <= -9.22337204e18)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v1 >= 9.22337204e18)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v2 = 39 * (uint64_t)v1;
  if ((unsigned __int128)((uint64_t)v1 * (__int128)39) >> 64 != v2 >> 63)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  double v3 = *(double *)(v0 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_maximum);
  if ((~*(void *)&v3 & 0x7FF0000000000000) == 0)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v3 <= -9.22337204e18)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (v3 >= 9.22337204e18)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v4 = v2 * (uint64_t)v3;
  if ((unsigned __int128)(v2 * (__int128)(uint64_t)v3) >> 64 != v4 >> 63)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    return result;
  }
  uint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_type);
  if (v5 >= 1) {
    uint64_t v5 = 1;
  }
  uint64_t result = v4 * v5;
  if ((unsigned __int128)(v4 * (__int128)v5) >> 64 != (v4 * v5) >> 63) {
    goto LABEL_21;
  }
  return result;
}

BOOL sub_25C98D358(uint64_t a1)
{
  sub_25C98D41C(a1, (uint64_t)v6);
  if (v7)
  {
    type metadata accessor for SizeDimensionRequest();
    if (swift_dynamicCast())
    {
      if (*(double *)(v1 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_minimum) == *(double *)&v5[OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_minimum]
        && *(double *)(v1 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_maximum) == *(double *)&v5[OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_maximum])
      {
        uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_type);
        uint64_t v3 = *(void *)&v5[OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_type];

        return v2 == v3;
      }
    }
  }
  else
  {
    sub_25C98D484((uint64_t)v6);
  }
  return 0;
}

uint64_t sub_25C98D41C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5DFCD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C98D484(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5DFCD0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C98D5C4()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29C40]), sel_initWithObject_, v0);
  if (!v1)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v2 = v1;
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_type);
  if (v3 == 1)
  {
    uint64_t v4 = 0xE500000000000000;
    uint64_t v5 = 0x6465786966;
    goto LABEL_6;
  }
  if (!v3)
  {
    uint64_t v4 = 0xE700000000000000;
    uint64_t v5 = 0x63696D616E7964;
LABEL_6:
    sub_25C98DD68(v5, v4, 1701869940, 0xE400000000000000, v2);

    uint64_t v6 = sub_25C98DE78(v2);
    if (v7)
    {
      uint64_t v8 = v6;

      return v8;
    }
    goto LABEL_9;
  }
LABEL_10:
  uint64_t result = sub_25C9B8600();
  __break(1u);
  return result;
}

id sub_25C98D6EC@<X0>(void *a1@<X8>)
{
  double v3 = *(double *)(v1 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_minimum);
  double v4 = *(double *)(v1 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_maximum);
  uint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_type);
  uint64_t v6 = (objc_class *)type metadata accessor for SizeDimensionRequest();
  id v7 = objc_allocWithZone(v6);
  id result = SizeDimensionRequest.init(minimum:maximum:type:)(v5, v3, v4);
  a1[3] = v6;
  *a1 = result;
  return result;
}

uint64_t static SizeDimensionRequest.supportsSecureCoding.getter()
{
  return 1;
}

void sub_25C98D7DC(void *a1)
{
  double v3 = (void *)OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();

  double v4 = (void *)OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();

  uint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_type);
  id v6 = (id)sub_25C9B8140();
  objc_msgSend(a1, sel_encodeInteger_forKey_, v5, v6);
}

id SizeDimensionRequest.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return SizeDimensionRequest.init(coder:)(a1);
}

id SizeDimensionRequest.init(coder:)(void *a1)
{
  id v3 = v1;
  double v4 = (void *)OUTLINED_FUNCTION_0_0();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v4);
  double v6 = v5;

  double v7 = 0.0;
  if (v6 > 0.0) {
    double v7 = v6;
  }
  *(double *)&v3[OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_minimum] = v7;
  uint64_t v8 = (void *)OUTLINED_FUNCTION_0_0();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v8);
  uint64_t v10 = v9;

  *(void *)&v3[OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_maximum] = v10;
  uint64_t v11 = (void *)sub_25C9B8140();
  id v12 = objc_msgSend(a1, sel_decodeIntegerForKey_, v11);

  BOOL v13 = SizeDimensionRequestType.init(rawValue:)((uint64_t)v12);
  uint64_t v15 = (v14 & 1) != 0 || v13;
  *(void *)&v3[OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_type] = v15;

  v18.receiver = v3;
  v18.super_class = (Class)type metadata accessor for SizeDimensionRequest();
  id v16 = objc_msgSendSuper2(&v18, sel_init);

  return v16;
}

uint64_t SizeDimensionRequest.__allocating_init(xpcDictionary:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return SizeDimensionRequest.init(xpcDictionary:)(a1);
}

uint64_t SizeDimensionRequest.init(xpcDictionary:)(void *a1)
{
  id v3 = v1;
  BSDeserializeDoubleFromXPCDictionaryWithKey();
  if (v4 <= 0.0) {
    double v4 = 0.0;
  }
  *(double *)&v3[OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_minimum] = v4;
  uint64_t result = BSDeserializeDoubleFromXPCDictionaryWithKey();
  *(void *)&v3[OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_maximum] = v6;
  if (a1)
  {
    int64_t int64 = xpc_dictionary_get_int64(a1, "type");
    BOOL v8 = SizeDimensionRequestType.init(rawValue:)(int64);
    uint64_t v10 = (v9 & 1) != 0 || v8;
    *(void *)&v3[OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_type] = v10;

    v12.receiver = v3;
    v12.super_class = (Class)type metadata accessor for SizeDimensionRequest();
    id v11 = objc_msgSendSuper2(&v12, sel_init);
    swift_unknownObjectRelease();
    return (uint64_t)v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_25C98DBD4(void *a1)
{
  if (a1)
  {
    BSSerializeDoubleToXPCDictionaryWithKey();
    BSSerializeDoubleToXPCDictionaryWithKey();
    int64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_type);
    xpc_dictionary_set_int64(a1, "type", v3);
  }
}

id SizeDimensionRequest.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void SizeDimensionRequest.init()()
{
}

id SizeDimensionRequest.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SizeDimensionRequest();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_25C98DD68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = (void *)sub_25C9B8140();
  swift_bridgeObjectRelease();
  id v7 = (id)sub_25C9B8140();
  swift_bridgeObjectRelease();
  objc_msgSend(a5, sel_appendString_withName_, v6, v7);
}

id sub_25C98DE04(double a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = (void *)sub_25C9B8140();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(a4, sel_appendFloat_withName_, v6, a1);

  return v7;
}

uint64_t sub_25C98DE78(void *a1)
{
  id v1 = objc_msgSend(a1, sel_build);
  if (!v1) {
    return 0;
  }
  objc_super v2 = v1;
  uint64_t v3 = sub_25C9B8150();

  return v3;
}

unint64_t sub_25C98DEE0()
{
  unint64_t result = qword_26A5DF950;
  if (!qword_26A5DF950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DF950);
  }
  return result;
}

ValueMetadata *type metadata accessor for SizeDimensionRequestType()
{
  return &type metadata for SizeDimensionRequestType;
}

uint64_t method lookup function for SizeDimensionRequest(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SizeDimensionRequest);
}

uint64_t dispatch thunk of SizeDimensionRequest.__allocating_init(minimum:maximum:type:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of static SizeDimensionRequest.fixed(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of SizeDimensionRequest.resolveIfNecessary(intrinsicLength:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of SizeDimensionRequest.copy(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of SizeDimensionRequest.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of SizeDimensionRequest.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of SizeDimensionRequest.__allocating_init(xpcDictionary:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of SizeDimensionRequest.encode(withXPCDictionary:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return sub_25C9B8140();
}

id OUTLINED_FUNCTION_1_0(unsigned int a1, double a2)
{
  uint64_t v4 = a1 | 0x6D756D00000000;
  return sub_25C98DE04(a2, v4, 0xE700000000000000, v2);
}

id OUTLINED_FUNCTION_2_0()
{
  return objc_msgSend(v0, (SEL)(v2 + 1048), v1, v4);
}

id sub_25C98E114(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return sub_25C98E4F8(a1, (uint64_t (*)(void, _OWORD *))type metadata accessor for SnippetHostingAction.ClientToHost);
}

id sub_25C98E160(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_25C98E698(a3);
}

id sub_25C98E19C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25C98E744(a3);
}

id sub_25C98E1E4()
{
  OUTLINED_FUNCTION_1_1();
  uint64_t v2 = v1;
  id result = objc_msgSend(v3, sel_delegate);
  if (result)
  {
    long long v5 = *(_OWORD *)(v2 + 96);
    long long v11 = *(_OWORD *)(v2 + 80);
    long long v12 = v5;
    type metadata accessor for _SnippetHostingController(0, (uint64_t)&v11);
    if (!swift_dynamicCastClass()) {
      return (id)swift_unknownObjectRelease();
    }
    id v6 = objc_msgSend(v0, sel_info);
    if (v6)
    {
      id v7 = v6;
      id v8 = objc_msgSend(v6, sel_objectForSetting_, 0);

      if (v8)
      {
        sub_25C9B8410();
        swift_unknownObjectRelease();
      }
      else
      {
        memset(v10, 0, sizeof(v10));
      }
      sub_25C98EDF8((uint64_t)v10, (uint64_t)&v11);
      if (*((void *)&v12 + 1))
      {
        if (OUTLINED_FUNCTION_3_0())
        {
          long long v9 = v10[0];
          sub_25C9A5B60();
          sub_25C98EE60(v9, *((unint64_t *)&v9 + 1));
        }
        return (id)swift_unknownObjectRelease();
      }
    }
    else
    {
      long long v11 = 0u;
      long long v12 = 0u;
    }
    swift_unknownObjectRelease();
    return (id)sub_25C98D484((uint64_t)&v11);
  }
  return result;
}

void sub_25C98E34C(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_25C98E1E4();
}

void sub_25C98E3B4()
{
}

void sub_25C98E3E4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = a3;
  id v6 = a4;
  sub_25C98E3B4();
}

void sub_25C98E404()
{
}

void sub_25C98E434(int a1, int a2, void *a3, void *a4, void *a5)
{
}

void sub_25C98E454()
{
}

void sub_25C98E484()
{
}

id sub_25C98E494()
{
  return sub_25C98EBD4();
}

id sub_25C98E4AC(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return sub_25C98E4F8(a1, (uint64_t (*)(void, _OWORD *))type metadata accessor for SnippetHostingAction.HostToClient);
}

id sub_25C98E4F8(void *a1, uint64_t (*a2)(void, _OWORD *))
{
  id v4 = v2;
  OUTLINED_FUNCTION_1_1();
  uint64_t v7 = v6;
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29C78]), sel_init);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_25C9B7B90();
  swift_allocObject();
  sub_25C9B7B80();
  uint64_t v9 = sub_25C9B7B70();
  unint64_t v11 = v10;
  swift_release();
  long long v12 = (void *)sub_25C9B7C20();
  long long v17 = *(_OWORD *)(v7 + 96);
  long long v18 = *(_OWORD *)(v7 + 80);
  objc_msgSend(v8, sel_setObject_forSetting_, v12, 0);

  id v13 = v8;
  v19[0] = v18;
  v19[1] = v17;
  char v14 = (objc_class *)a2(0, v19);
  v20.receiver = v4;
  v20.super_class = v14;
  id v15 = objc_msgSendSuper2(&v20, sel_initWithInfo_responder_, v13, 0);
  sub_25C98EE60(v9, v11);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v15;
}

id sub_25C98E698(void *a1)
{
  OUTLINED_FUNCTION_0_1();
  uint64_t v3 = OUTLINED_FUNCTION_2_1();
  v7.receiver = v1;
  v7.super_class = (Class)v4(v3);
  id v5 = objc_msgSendSuper2(&v7, sel_initWithCoder_, a1);

  return v5;
}

id sub_25C98E708(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_25C98E698(a3);
}

id sub_25C98E744(uint64_t a1)
{
  OUTLINED_FUNCTION_0_1();
  uint64_t v3 = OUTLINED_FUNCTION_2_1();
  v7.receiver = v1;
  v7.super_class = (Class)v4(v3);
  id v5 = objc_msgSendSuper2(&v7, sel_initWithXPCDictionary_, a1);
  swift_unknownObjectRelease();
  return v5;
}

id sub_25C98E7B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25C98E744(a3);
}

void sub_25C98E800()
{
  OUTLINED_FUNCTION_1_1();
  uint64_t v2 = v1;
  if (!objc_msgSend(v3, sel_delegate)) {
    return;
  }
  long long v18 = &unk_270A145B0;
  id v4 = (void *)swift_dynamicCastObjCProtocolConditional();
  if (!v4
    || (id v5 = v4, (objc_msgSend(v4, sel_respondsToSelector_, sel_window) & 1) == 0)
    || (id v6 = objc_msgSend(v5, sel_window)) == 0)
  {
LABEL_12:
    swift_unknownObjectRelease();
    return;
  }
  objc_super v7 = v6;
  id v8 = objc_msgSend(v6, sel_rootViewController);
  if (!v8)
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v9 = v8;
  long long v10 = *(_OWORD *)(v2 + 96);
  long long v16 = *(_OWORD *)(v2 + 80);
  long long v17 = v10;
  type metadata accessor for _SnippetClientController(0, (uint64_t)&v16);
  if (!swift_dynamicCastClass())
  {

    goto LABEL_11;
  }
  id v11 = objc_msgSend(v0, sel_info);
  if (!v11)
  {
    long long v16 = 0u;
    long long v17 = 0u;
LABEL_19:

    swift_unknownObjectRelease();
    sub_25C98D484((uint64_t)&v16);
    return;
  }
  long long v12 = v11;
  id v13 = objc_msgSend(v11, sel_objectForSetting_, 0);

  if (v13)
  {
    sub_25C9B8410();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v15, 0, sizeof(v15));
  }
  sub_25C98EDF8((uint64_t)v15, (uint64_t)&v16);
  if (!*((void *)&v17 + 1)) {
    goto LABEL_19;
  }
  if (OUTLINED_FUNCTION_3_0())
  {
    long long v14 = v15[0];
    sub_25C99CD8C();
    sub_25C98EE60(v14, *((unint64_t *)&v14 + 1));
    swift_unknownObjectRelease();
  }
  else
  {

    swift_unknownObjectRelease();
  }
}

void sub_25C98EA14(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_25C98E800();
}

void sub_25C98EA7C()
{
}

void sub_25C98EAAC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = a3;
  id v6 = a4;
  sub_25C98EA7C();
}

void sub_25C98EACC()
{
}

void sub_25C98EAFC(int a1, int a2, void *a3, void *a4, void *a5)
{
}

void sub_25C98EB1C(int a1, int a2, void *a3, void *a4, void *aBlock, uint64_t a6, void (*a7)(void *))
{
  long long v10 = _Block_copy(aBlock);
  if (v10) {
    *(void *)(swift_allocObject() + 16) = v10;
  }
  id v11 = a3;
  a7(a4);
  __break(1u);
}

void sub_25C98EB7C()
{
}

void sub_25C98EBAC()
{
}

id sub_25C98EBBC()
{
  return sub_25C98EBD4();
}

id sub_25C98EBD4()
{
  OUTLINED_FUNCTION_0_1();
  uint64_t v1 = OUTLINED_FUNCTION_2_1();
  v4.receiver = v0;
  v4.super_class = (Class)v2(v1);
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t sub_25C98EC28()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_25C98EC38()
{
  uint64_t result = sub_25C9B8140();
  qword_26A5DFAE0 = result;
  return result;
}

id static NSNotificationName.onReceiveActionFromHost.getter()
{
  return sub_25C98ECF0(&qword_26A5DF680, (void **)&qword_26A5DFAE0);
}

uint64_t sub_25C98EC94()
{
  uint64_t result = sub_25C9B8140();
  qword_26A5DFAE8 = result;
  return result;
}

id static NSNotificationName.onReceiveActionFromClient.getter()
{
  return sub_25C98ECF0(&qword_26A5DF688, (void **)&qword_26A5DFAE8);
}

id sub_25C98ECF0(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  id v3 = *a2;
  return v3;
}

uint64_t type metadata accessor for SnippetHostingAction(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for SnippetHostingAction);
}

uint64_t type metadata accessor for SnippetHostingAction.ClientToHost(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for SnippetHostingAction.ClientToHost);
}

uint64_t sub_25C98ED70()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for SnippetHostingAction.HostToClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for SnippetHostingAction.HostToClient);
}

uint64_t sub_25C98EDC0()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_25C98EDF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5DFCD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C98EE60(uint64_t a1, unint64_t a2)
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

uint64_t OUTLINED_FUNCTION_2_1()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return swift_dynamicCast();
}

id sub_25C98EF18(uint64_t a1)
{
  v1[OBJC_IVAR____TtC15SiriInteractive25SceneCancelTouchAssertion_isInvalidated] = 0;
  *(void *)&v1[OBJC_IVAR____TtC15SiriInteractive25SceneCancelTouchAssertion_assertions] = a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for SceneCancelTouchAssertion();
  return objc_msgSendSuper2(&v3, sel_init);
}

id sub_25C98EF64()
{
  if ((*((unsigned char *)v0 + OBJC_IVAR____TtC15SiriInteractive25SceneCancelTouchAssertion_isInvalidated) & 1) == 0) {
    objc_msgSend(v0, sel_invalidate);
  }
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneCancelTouchAssertion();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_25C98EFF0()
{
}

uint64_t type metadata accessor for SceneCancelTouchAssertion()
{
  return self;
}

void sub_25C98F054()
{
  uint64_t v1 = OBJC_IVAR____TtC15SiriInteractive25SceneCancelTouchAssertion_isInvalidated;
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC15SiriInteractive25SceneCancelTouchAssertion_isInvalidated) & 1) == 0)
  {
    unint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC15SiriInteractive25SceneCancelTouchAssertion_assertions);
    if (v2 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v3 = sub_25C9B8590();
      if (v3) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v3)
      {
LABEL_4:
        if (v3 < 1)
        {
          __break(1u);
          return;
        }
        for (uint64_t i = 0; i != v3; ++i)
        {
          if ((v2 & 0xC000000000000001) != 0) {
            id v5 = (id)MEMORY[0x261199F90](i, v2);
          }
          else {
            id v5 = *(id *)(v2 + 8 * i + 32);
          }
          id v6 = v5;
          objc_msgSend(v5, sel_invalidate);
        }
      }
    }
    swift_bridgeObjectRelease();
    *(unsigned char *)(v0 + v1) = 1;
  }
}

uint64_t sub_25C98F194()
{
  type metadata accessor for SnippetHostingContext();
  swift_allocObject();
  uint64_t result = sub_25C998720();
  qword_26A5DFDB0 = result;
  return result;
}

uint64_t static SnippetHostingContextKey.defaultValue.getter()
{
  if (qword_26A5DF690 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t sub_25C98F230@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static SnippetHostingContextKey.defaultValue.getter();
  *a1 = result;
  return result;
}

uint64_t EnvironmentValues.snippetHostingContext.getter()
{
  sub_25C98F298();
  sub_25C9B7EF0();
  return v1;
}

unint64_t sub_25C98F298()
{
  unint64_t result = qword_26A5DFDB8;
  if (!qword_26A5DFDB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DFDB8);
  }
  return result;
}

uint64_t sub_25C98F2E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.snippetHostingContext.getter();
  *a1 = result;
  return result;
}

uint64_t sub_25C98F310()
{
  return EnvironmentValues.snippetHostingContext.setter();
}

uint64_t EnvironmentValues.snippetHostingContext.setter()
{
  return sub_25C9B7F00();
}

uint64_t (*EnvironmentValues.snippetHostingContext.modify(uint64_t a1))(void *a1, char a2)
{
  *(void *)(a1 + 16) = v1;
  *(void *)(a1 + 24) = sub_25C98F298();
  sub_25C9B7EF0();
  return sub_25C98F3D8;
}

uint64_t sub_25C98F3D8(void *a1, char a2)
{
  a1[1] = *a1;
  if ((a2 & 1) == 0) {
    return sub_25C9B7F00();
  }
  swift_retain();
  sub_25C9B7F00();
  return swift_release();
}

uint64_t sub_25C98F46C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.snippetHostingContext.getter();
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for SnippetHostingContextKey()
{
  return &type metadata for SnippetHostingContextKey;
}

uint64_t sub_25C98F4AC(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics) = a1;
  return MEMORY[0x270F9A758]();
}

id sub_25C98F4F4()
{
  return *(id *)(v0 + OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics);
}

void sub_25C98F560(void *a1)
{
  objc_msgSend(a1, sel_copy);
  sub_25C9B8410();
  swift_unknownObjectRelease();
  type metadata accessor for SceneItemMetricsRequest();
  swift_dynamicCast();
  sub_25C98F4AC(v2);
}

void sub_25C98F5E4(id *a1)
{
}

void (*sub_25C98F610(void *a1))(void **a1, char a2)
{
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics);
  *a1 = v2;
  a1[1] = v1;
  id v3 = v2;
  return sub_25C98F664;
}

void sub_25C98F664(void **a1, char a2)
{
  uint64_t v2 = *a1;
  if (a2)
  {
    id v3 = v2;
    sub_25C98F560(v3);
  }
  else
  {
    sub_25C98F560(v2);
  }
}

id SceneMetricsRequest.__allocating_init(lockScreenMetrics:)(uint64_t a1)
{
  id v3 = (char *)objc_allocWithZone(v1);
  *(void *)&v3[OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id SceneMetricsRequest.init(lockScreenMetrics:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics] = a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for SceneMetricsRequest();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for SceneMetricsRequest()
{
  return self;
}

uint64_t sub_25C98F7DC()
{
  uint64_t v1 = (uint64_t)objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics), sel_hash);
  if (v1 >= 1) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = v1;
  }
  uint64_t result = 23 * v2;
  if ((unsigned __int128)(v2 * (__int128)23) >> 64 != (23 * v2) >> 63) {
    __break(1u);
  }
  return result;
}

uint64_t sub_25C98F828(uint64_t a1)
{
  sub_25C98D41C(a1, (uint64_t)v9);
  if (!v10)
  {
    sub_25C98D484((uint64_t)v9);
    goto LABEL_5;
  }
  type metadata accessor for SceneMetricsRequest();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    char v6 = 0;
    return v6 & 1;
  }
  sub_25C98F8F8();
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics);
  objc_super v3 = *(void **)&v8[OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics];
  id v4 = v2;
  id v5 = v3;
  char v6 = sub_25C9B83C0();

  return v6 & 1;
}

unint64_t sub_25C98F8F8()
{
  unint64_t result = qword_26A5DFDD0;
  if (!qword_26A5DFDD0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A5DFDD0);
  }
  return result;
}

id sub_25C98FA18()
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29C40]), sel_initWithObject_, v0);
  if (result)
  {
    uint64_t v2 = result;

    id result = (id)sub_25C98DE78(v2);
    if (v3)
    {
      id v4 = result;

      return v4;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id SceneMetricsRequest.__allocating_init(xpcDictionary:)()
{
  id v1 = objc_allocWithZone(v0);
  return SceneMetricsRequest.init(xpcDictionary:)();
}

id SceneMetricsRequest.init(xpcDictionary:)()
{
  id v1 = v0;
  if ((id)BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey())
  {
    sub_25C9B8410();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  sub_25C98EDF8((uint64_t)v7, (uint64_t)v8);
  if (!v9)
  {
    sub_25C98D484((uint64_t)v8);
    goto LABEL_8;
  }
  type metadata accessor for SceneItemMetricsRequest();
  if (!swift_dynamicCast())
  {
LABEL_8:
    type metadata accessor for SceneItemMetricsRequest();
    id v2 = sub_25C996718();
    goto LABEL_9;
  }
  id v2 = v5;
LABEL_9:
  *(void *)&v1[OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics] = v2;

  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for SceneMetricsRequest();
  id v3 = objc_msgSendSuper2(&v6, sel_init);
  swift_unknownObjectRelease();
  return v3;
}

uint64_t sub_25C98FC34(uint64_t result)
{
  if (result) {
    return BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  }
  return result;
}

id sub_25C98FCC0@<X0>(void *a1@<X8>)
{
  id v3 = *(void **)(v1 + OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics);
  id v4 = (objc_class *)type metadata accessor for SceneMetricsRequest();
  id v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics] = v3;
  v8.receiver = v5;
  v8.super_class = v4;
  id v6 = v3;
  id result = objc_msgSendSuper2(&v8, sel_init);
  a1[3] = v4;
  *a1 = result;
  return result;
}

uint64_t static SceneMetricsRequest.supportsSecureCoding.getter()
{
  return 1;
}

void sub_25C98FDA4(void *a1)
{
  id v3 = *(id *)(v1 + OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics);
  id v4 = (id)sub_25C9B8140();
  objc_msgSend(a1, sel_encodeObject_forKey_, v3, v4);
}

id SceneMetricsRequest.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return SceneMetricsRequest.init(coder:)(a1);
}

id SceneMetricsRequest.init(coder:)(void *a1)
{
  type metadata accessor for SceneItemMetricsRequest();
  id v3 = v1;
  uint64_t v4 = sub_25C9B8390();
  if (!v4) {
    uint64_t v4 = (uint64_t)sub_25C996718();
  }
  *(void *)&v3[OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics] = v4;

  v7.receiver = v3;
  v7.super_class = (Class)type metadata accessor for SceneMetricsRequest();
  id v5 = objc_msgSendSuper2(&v7, sel_init);

  return v5;
}

id SceneMetricsRequest.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void SceneMetricsRequest.init()()
{
}

id SceneMetricsRequest.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneMetricsRequest();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_25C990058(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = (void *)sub_25C9B8140();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(a4, sel_appendObject_withName_, a1, v6);

  return v7;
}

id sub_25C9900CC@<X0>(void *a1@<X8>)
{
  id result = sub_25C98F4F4();
  *a1 = result;
  return result;
}

uint64_t method lookup function for SceneMetricsRequest(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SceneMetricsRequest);
}

uint64_t dispatch thunk of SceneMetricsRequest.lockScreenMetrics.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of SceneMetricsRequest.lockScreenMetrics.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of SceneMetricsRequest.lockScreenMetrics.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of SceneMetricsRequest.__allocating_init(lockScreenMetrics:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of SceneMetricsRequest.__allocating_init(xpcDictionary:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of SceneMetricsRequest.encode(withXPCDictionary:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of SceneMetricsRequest.copy(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of SceneMetricsRequest.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of SceneMetricsRequest.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

__CFString *sub_25C990288()
{
  qword_26A5DFDE0 = @"SiriInteractiveSessionRoleSnippet";
  return @"SiriInteractiveSessionRoleSnippet";
}

id static UISceneSessionRole.interactiveSnippet.getter()
{
  if (qword_26A5DF698 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26A5DFDE0;
  return v0;
}

uint64_t sub_25C9902FC()
{
  return sub_25C99033C((SEL *)&selRef_settings, (uint64_t (*)(void))type metadata accessor for SnippetSceneSettings);
}

uint64_t sub_25C99031C()
{
  return sub_25C99033C((SEL *)&selRef_clientSettings, (uint64_t (*)(void))type metadata accessor for SnippetSceneClientSettings);
}

uint64_t sub_25C99033C(SEL *a1, uint64_t (*a2)(void))
{
  id v5 = objc_msgSend(v2, sel__FBSScene);
  id v6 = [v5 *a1];

  uint64_t v7 = a2(0);
  return MEMORY[0x270FA0270](v6, v7, 0, 0, 0);
}

char *sub_25C9903CC(void *a1, void *a2)
{
  v2[OBJC_IVAR____TtC15SiriInteractive12SnippetScene__inClientSettingsUpdate] = 0;
  uint64_t v5 = OBJC_IVAR____TtC15SiriInteractive12SnippetScene__settingsDiffer;
  id v6 = objc_allocWithZone((Class)type metadata accessor for SettingsDiffer());
  uint64_t v7 = v2;
  *(void *)&v2[v5] = objc_msgSend(v6, sel_init);
  *(void *)&v7[OBJC_IVAR____TtC15SiriInteractive12SnippetScene_resolvedMetrics] = 0;
  *(void *)&v7[OBJC_IVAR____TtC15SiriInteractive12SnippetScene_snippetSceneHostTouchRestrictedRects] = MEMORY[0x263F8EE78];
  objc_super v8 = &v7[OBJC_IVAR____TtC15SiriInteractive12SnippetScene_viewModel];
  *(_OWORD *)objc_super v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_OWORD *)v8 + 2) = 0u;

  v17.receiver = v7;
  v17.super_class = (Class)type metadata accessor for SnippetScene();
  uint64_t v9 = (char *)objc_msgSendSuper2(&v17, sel_initWithSession_connectionOptions_, a1, a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFE38);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_25C9B9B80;
  id v11 = *(void **)&v9[OBJC_IVAR____TtC15SiriInteractive12SnippetScene__settingsDiffer];
  *(void *)(v10 + 32) = v11;
  sub_25C9B81E0();
  long long v12 = v9;
  id v13 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFE40);
  long long v14 = (void *)sub_25C9B81B0();
  swift_bridgeObjectRelease();
  sub_25C992830();
  id v15 = (void *)sub_25C9B83D0();
  objc_msgSend(v12, sel__registerSettingsDiffActionArray_forKey_, v14, v15);

  return v12;
}

void sub_25C9905C0(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v5 = v4;
  BSDispatchQueueAssertMain();
  id v6 = (id)sub_25C9902FC();
  sub_25C9A08D0(*(void *)(*MEMORY[0x263F8EA20] + v5 + 8), a1, a2);
}

uint64_t sub_25C990648(uint64_t *a1, uint64_t a2)
{
  id v3 = v2;
  OUTLINED_FUNCTION_3_1();
  uint64_t v7 = v6;
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5DFDE8);
  uint64_t v56 = *(void *)(*MEMORY[0x263F8EA20] + v7 + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = sub_25C9B83E0();
  unint64_t v58 = sub_25C9920CC();
  uint64_t v9 = sub_25C9B7D20();
  OUTLINED_FUNCTION_0_2();
  uint64_t v61 = v10;
  OUTLINED_FUNCTION_7_0();
  MEMORY[0x270FA5388](v11, v12);
  v51 = (char *)&v43 - v13;
  uint64_t v43 = v8;
  uint64_t v14 = sub_25C9B7D90();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v49 = WitnessTable;
  uint64_t v48 = swift_getWitnessTable();
  uint64_t v62 = v9;
  uint64_t v63 = v14;
  uint64_t v64 = WitnessTable;
  uint64_t v65 = v48;
  uint64_t v47 = sub_25C9B7D30();
  uint64_t v46 = swift_getWitnessTable();
  uint64_t v54 = sub_25C9B7D00();
  uint64_t v52 = swift_getWitnessTable();
  uint64_t v16 = sub_25C9B7CF0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v59 = v17;
  OUTLINED_FUNCTION_7_0();
  MEMORY[0x270FA5388](v18, v19);
  v45 = (char *)&v43 - v20;
  uint64_t v50 = swift_getWitnessTable();
  uint64_t v55 = sub_25C9B7D10();
  OUTLINED_FUNCTION_0_2();
  uint64_t v57 = v21;
  OUTLINED_FUNCTION_7_0();
  MEMORY[0x270FA5388](v22, v23);
  v44 = (char *)&v43 - v24;
  OUTLINED_FUNCTION_7_0();
  MEMORY[0x270FA5388](v25, v26);
  BSDispatchQueueAssertMain();
  uint64_t v27 = (void *)sub_25C9902FC();
  sub_25C9A08CC(a1, a2);

  sub_25C9B7DA0();
  id v28 = *(id *)&v3[OBJC_IVAR____TtC15SiriInteractive12SnippetScene__settingsDiffer];
  uint64_t v29 = sub_25C9987D0(a1, a2);

  uint64_t v62 = v29;
  uint64_t v30 = (void *)swift_allocObject();
  v30[2] = a2;
  v30[3] = v3;
  v30[4] = a1;
  uint64_t v31 = (void *)swift_allocObject();
  uint64_t v32 = v56;
  v31[2] = v56;
  v31[3] = a2;
  v31[4] = sub_25C992160;
  v31[5] = v30;
  uint64_t v33 = v3;
  swift_retain();
  uint64_t v34 = v51;
  sub_25C9B7E60();
  swift_release();
  swift_release();
  uint64_t v35 = sub_25C9B7E80();
  (*(void (**)(char *, uint64_t))(v61 + 8))(v34, v9);
  uint64_t v62 = v35;
  uint64_t v36 = sub_25C9B7DC0();
  swift_release();
  uint64_t v62 = v36;
  uint64_t v37 = OUTLINED_FUNCTION_4_0();
  *(void *)(v37 + 16) = v32;
  *(void *)(v37 + 24) = a2;
  uint64_t v38 = v45;
  sub_25C9B7E50();
  swift_release();
  swift_release();
  swift_getAssociatedConformanceWitness();
  v39 = v44;
  sub_25C9B7E90();
  (*(void (**)(char *, uint64_t))(v59 + 8))(v38, v16);
  uint64_t v40 = v55;
  swift_getWitnessTable();
  uint64_t v41 = sub_25C9B7E40();
  swift_release();
  (*(void (**)(char *, uint64_t))(v57 + 8))(v39, v40);
  return v41;
}

void sub_25C990BB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = (id)sub_25C9902FC();
  sub_25C9A08CC(a2, a3);
}

uint64_t sub_25C990C24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  swift_getAssociatedTypeWitness();
  uint64_t v4 = sub_25C9B83E0();
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a2, a1, v4);
}

uint64_t sub_25C990CB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v20 = a3;
  sub_25C9B83E0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v19 = v7;
  OUTLINED_FUNCTION_7_0();
  MEMORY[0x270FA5388](v8, v9);
  uint64_t v11 = (char *)&v19 - v10;
  uint64_t v12 = (void *)sub_25C99031C();
  id v13 = objc_msgSend(v12, sel_otherSettings, v19);
  swift_beginAccess();
  if (objc_msgSend(v13, sel_objectForSetting_, qword_26A5DFFD8))
  {
    sub_25C9B8410();
    swift_unknownObjectRelease();
    sub_25C992214(&v21, &v22);
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5DFCD0);
  if ((swift_dynamicCast() & 1) == 0) {
    long long v21 = xmmword_25C9B9B90;
  }

  unint64_t v14 = *((void *)&v21 + 1);
  if (*((void *)&v21 + 1) >> 60 == 15)
  {
    uint64_t result = sub_25C9B8580();
    __break(1u);
  }
  else
  {
    uint64_t v15 = v21;
    sub_25C9B7B60();
    swift_allocObject();
    sub_25C9B7B50();
    sub_25C9B7B40();
    swift_release();
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, a1);
    uint64_t v16 = *(void *)(a1 - 8);
    (*(void (**)(uint64_t, char *, uint64_t))(v16 + 32))(a4, v11, a1);
    *((void *)&v23 + 1) = a1;
    uint64_t v24 = a2;
    uint64_t v25 = v20;
    boxed_opaque_existential_2 = __swift_allocate_boxed_opaque_existential_2((uint64_t *)&v22);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v16 + 16))(boxed_opaque_existential_2, a4, a1);
    sub_25C991B08((uint64_t)&v22);
    return sub_25C992200(v15, v14);
  }
  return result;
}

uint64_t sub_25C990FC8(void (*a1)(unsigned char *, _UNKNOWN **))
{
  return sub_25C990FD8(v1, a1);
}

uint64_t sub_25C990FD8(unsigned char *a1, void (*a2)(unsigned char *, _UNKNOWN **))
{
  uint64_t result = BSDispatchQueueAssertMain();
  if (a1[OBJC_IVAR____TtC15SiriInteractive12SnippetScene__inClientSettingsUpdate])
  {
    __break(1u);
    goto LABEL_5;
  }
  a2(a1, &protocol witness table for SnippetScene);
  id v5 = objc_msgSend(a1, sel__FBSScene);
  uint64_t v6 = OUTLINED_FUNCTION_4_0();
  *(void *)(v6 + 16) = 0;
  *(void *)(v6 + 24) = a1;
  uint64_t v7 = OUTLINED_FUNCTION_4_0();
  *(void *)(v7 + 16) = sub_25C992978;
  *(void *)(v7 + 24) = v6;
  v11[4] = sub_25C99297C;
  v11[5] = v7;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1107296256;
  v11[2] = sub_25C991558;
  v11[3] = &block_descriptor_48;
  uint64_t v8 = _Block_copy(v11);
  uint64_t v9 = a1;
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_updateClientSettingsWithTransitionBlock_, v8);

  _Block_release(v8);
  char v10 = OUTLINED_FUNCTION_10_0();
  swift_release();
  uint64_t result = swift_release();
  if (v10) {
LABEL_5:
  }
    __break(1u);
  return result;
}

uint64_t sub_25C991160(uint64_t (*a1)(unsigned char *, _UNKNOWN **))
{
  uint64_t result = BSDispatchQueueAssertMain();
  if (v1[OBJC_IVAR____TtC15SiriInteractive12SnippetScene__inClientSettingsUpdate])
  {
    __break(1u);
    goto LABEL_5;
  }
  uint64_t v4 = (void *)a1(v1, &protocol witness table for SnippetScene);
  id v5 = objc_msgSend(v1, sel__FBSScene);
  uint64_t v6 = OUTLINED_FUNCTION_4_0();
  *(void *)(v6 + 16) = v4;
  *(void *)(v6 + 24) = v1;
  uint64_t v7 = OUTLINED_FUNCTION_4_0();
  *(void *)(v7 + 16) = sub_25C992224;
  *(void *)(v7 + 24) = v6;
  v12[4] = sub_25C992230;
  v12[5] = v7;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  v12[2] = sub_25C991558;
  v12[3] = &block_descriptor;
  uint64_t v8 = _Block_copy(v12);
  id v9 = v4;
  char v10 = v1;
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_updateClientSettingsWithTransitionBlock_, v8);

  _Block_release(v8);
  char v11 = OUTLINED_FUNCTION_10_0();
  swift_release();
  uint64_t result = swift_release();
  if (v11) {
LABEL_5:
  }
    __break(1u);
  return result;
}

void *sub_25C991300(void *a1, void *a2, uint64_t a3)
{
  type metadata accessor for SnippetSceneMutableClientSettings();
  if (swift_dynamicCastClass())
  {
    uint64_t v7 = (id *)(a3 + OBJC_IVAR____TtC15SiriInteractive12SnippetScene_resolvedMetrics);
    swift_beginAccess();
    id v8 = *v7;
    id v9 = *v7;
    id v3 = a1;
    sub_25C9A72E8(v8);

    char v10 = (uint64_t *)(a3 + OBJC_IVAR____TtC15SiriInteractive12SnippetScene_snippetSceneHostTouchRestrictedRects);
    swift_beginAccess();
    uint64_t v11 = *v10;
    swift_bridgeObjectRetain_n();
    sub_25C9A7228(v11);
    swift_bridgeObjectRelease();
    uint64_t v12 = a3 + OBJC_IVAR____TtC15SiriInteractive12SnippetScene_viewModel;
    swift_beginAccess();
    sub_25C992280(v12, (uint64_t)v24);
    uint64_t v13 = v25;
    if (v25)
    {
      unint64_t v14 = __swift_project_boxed_opaque_existential_0(v24, v25);
      uint64_t v15 = *(void *)(v13 - 8);
      MEMORY[0x270FA5388](v14, v14);
      uint64_t v17 = (char *)v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
      (*(void (**)(char *))(v15 + 16))(v17);
      sub_25C992358((uint64_t)v24);
      uint64_t v18 = sub_25C995A70();
      unint64_t v20 = v19;
      (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v13);
LABEL_7:
      sub_25C992870(v18, v20);
      sub_25C9A721C(v18, v20);
      sub_25C992200(v18, v20);

      goto LABEL_8;
    }
LABEL_6:
    sub_25C992358((uint64_t)v24);
    uint64_t v18 = 0;
    unint64_t v20 = 0xF000000000000000;
    goto LABEL_7;
  }
  if (!a2)
  {
    __break(1u);
    goto LABEL_6;
  }
LABEL_8:
  id v21 = a2;
  return a2;
}

id sub_25C991558(uint64_t a1, void *a2)
{
  objc_super v2 = *(uint64_t (**)(void))(a1 + 32);
  id v3 = a2;
  uint64_t v4 = (void *)v2();

  return v4;
}

void sub_25C9915AC(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_25C991684(v1);
}

void sub_25C9915DC(uint64_t a1, uint64_t a2)
{
  id v2 = (void **)(a2 + OBJC_IVAR____TtC15SiriInteractive12SnippetScene_resolvedMetrics);
  swift_beginAccess();
  id v3 = *v2;
  id v4 = v3;
  sub_25C9A72E8(v3);
}

void *sub_25C991648()
{
  OUTLINED_FUNCTION_8_0();
  id v1 = *v0;
  id v2 = v1;
  return v1;
}

void sub_25C991684(void *a1)
{
  OUTLINED_FUNCTION_6_0();
  id v4 = *v2;
  char *v2 = a1;
  id v5 = a1;

  BSDispatchQueueAssertMain();
  uint64_t v7 = v1;
  sub_25C991C58((uint64_t)sub_25C992270, (uint64_t)&v6);
}

uint64_t (*sub_25C9916FC(uint64_t a1))(uint64_t a1, char a2)
{
  return sub_25C991740;
}

uint64_t sub_25C991740(uint64_t a1, char a2)
{
  return sub_25C991BF4(a1, a2);
}

uint64_t sub_25C991758()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_25C991824(v0);
}

uint64_t sub_25C991784(uint64_t a1, uint64_t a2)
{
  id v2 = (uint64_t *)(a2 + OBJC_IVAR____TtC15SiriInteractive12SnippetScene_snippetSceneHostTouchRestrictedRects);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain_n();
  sub_25C9A7228(v3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C9917EC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25C991824(uint64_t a1)
{
  OUTLINED_FUNCTION_6_0();
  void *v2 = a1;
  swift_bridgeObjectRelease();
  BSDispatchQueueAssertMain();
  uint64_t v6 = v1;
  return sub_25C991C58((uint64_t)sub_25C992278, (uint64_t)&v5);
}

uint64_t (*sub_25C991890(uint64_t a1))(uint64_t a1, char a2)
{
  return sub_25C9918D4;
}

uint64_t sub_25C9918D4(uint64_t a1, char a2)
{
  return sub_25C991BF4(a1, a2);
}

uint64_t sub_25C9918EC(uint64_t a1)
{
  sub_25C992280(a1, (uint64_t)v2);
  return sub_25C991B08((uint64_t)v2);
}

uint64_t sub_25C991928(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + OBJC_IVAR____TtC15SiriInteractive12SnippetScene_viewModel;
  swift_beginAccess();
  sub_25C992280(v2, (uint64_t)v13);
  uint64_t v3 = v14;
  if (v14)
  {
    id v4 = __swift_project_boxed_opaque_existential_0(v13, v14);
    uint64_t v5 = *(void *)(v3 - 8);
    MEMORY[0x270FA5388](v4, v4);
    uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
    (*(void (**)(char *))(v5 + 16))(v7);
    sub_25C992358((uint64_t)v13);
    uint64_t v8 = sub_25C995A70();
    unint64_t v10 = v9;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
  }
  else
  {
    sub_25C992358((uint64_t)v13);
    uint64_t v8 = 0;
    unint64_t v10 = 0xF000000000000000;
  }
  sub_25C992870(v8, v10);
  sub_25C9A721C(v8, v10);
  return sub_25C992200(v8, v10);
}

uint64_t sub_25C991AB4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC15SiriInteractive12SnippetScene_viewModel;
  swift_beginAccess();
  return sub_25C992280(v3, a1);
}

uint64_t sub_25C991B08(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC15SiriInteractive12SnippetScene_viewModel;
  swift_beginAccess();
  sub_25C9922E8(a1, v3);
  swift_endAccess();
  BSDispatchQueueAssertMain();
  uint64_t v6 = v1;
  sub_25C991C58((uint64_t)sub_25C992350, (uint64_t)&v5);
  return sub_25C992358(a1);
}

uint64_t (*sub_25C991B98(uint64_t a1))(uint64_t a1, char a2)
{
  return sub_25C991BDC;
}

uint64_t sub_25C991BDC(uint64_t a1, char a2)
{
  return sub_25C991BF4(a1, a2);
}

uint64_t sub_25C991BF4(uint64_t a1, char a2)
{
  uint64_t result = swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = BSDispatchQueueAssertMain();
    MEMORY[0x270FA5388](v4, v5);
    return OUTLINED_FUNCTION_9_0();
  }
  return result;
}

uint64_t sub_25C991C58(uint64_t a1, uint64_t a2)
{
  uint64_t result = BSDispatchQueueAssertMain();
  if ((*((unsigned char *)v2 + OBJC_IVAR____TtC15SiriInteractive12SnippetScene__inClientSettingsUpdate) & 1) == 0)
  {
    id v6 = objc_msgSend(v2, sel__FBSScene);
    uint64_t v7 = OUTLINED_FUNCTION_4_0();
    *(void *)(v7 + 16) = a1;
    *(void *)(v7 + 24) = a2;
    uint64_t v8 = OUTLINED_FUNCTION_4_0();
    *(void *)(v8 + 16) = sub_25C9928E0;
    *(void *)(v8 + 24) = v7;
    v10[4] = sub_25C9928EC;
    v10[5] = v8;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 1107296256;
    _OWORD v10[2] = sub_25C991E60;
    v10[3] = &block_descriptor_37;
    unint64_t v9 = _Block_copy(v10);
    swift_retain();
    swift_release();
    objc_msgSend(v6, sel_updateClientSettingsWithBlock_, v9);

    _Block_release(v9);
    LOBYTE(v6) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    uint64_t result = swift_release();
    if (v6) {
      __break(1u);
    }
  }
  return result;
}

void sub_25C991DD0(void *a1, void (*a2)(uint64_t))
{
  type metadata accessor for SnippetSceneMutableClientSettings();
  uint64_t v4 = swift_dynamicCastClass();
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = a1;
    a2(v5);
  }
}

void sub_25C991E60(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

id SnippetScene.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SnippetScene();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t (*sub_25C991F54(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_25C991740;
}

uint64_t (*sub_25C991FBC(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_25C9918D4;
}

uint64_t (*sub_25C992024(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_25C991BDC;
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

unint64_t sub_25C9920CC()
{
  unint64_t result = qword_26A5DFDF0;
  if (!qword_26A5DFDF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5DFDE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DFDF0);
  }
  return result;
}

uint64_t sub_25C992120()
{
  swift_release();
  return swift_deallocObject();
}

void sub_25C992160()
{
  sub_25C990BB4(v0[3], v0[4], v0[2]);
}

uint64_t sub_25C99216C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_25C9921A4()
{
  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t sub_25C9921D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25C990C24(a1, a2);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_25C992200(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_25C98EE60(a1, a2);
  }
  return a1;
}

_OWORD *sub_25C992214(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void *sub_25C992224(void *a1)
{
  return sub_25C991300(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_25C992230()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
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

void sub_25C992270(uint64_t a1)
{
  sub_25C9915DC(a1, *(void *)(v1 + 16));
}

uint64_t sub_25C992278(uint64_t a1)
{
  return sub_25C991784(a1, *(void *)(v1 + 16));
}

uint64_t sub_25C992280(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5DFE28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C9922E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5DFE28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C992350(uint64_t a1)
{
  return sub_25C991928(a1, *(void *)(v1 + 16));
}

uint64_t sub_25C992358(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5DFE28);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for SnippetScene()
{
  return self;
}

void *sub_25C9923DC@<X0>(void *a1@<X8>)
{
  unint64_t result = sub_25C991648();
  *a1 = result;
  return result;
}

uint64_t sub_25C99240C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C9917EC();
  *a1 = result;
  return result;
}

uint64_t sub_25C99243C@<X0>(uint64_t a1@<X8>)
{
  return sub_25C991AB4(a1);
}

uint64_t dispatch thunk of SnippetSceneClientSettingsUpdating.resolvedMetrics.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of SnippetSceneClientSettingsUpdating.resolvedMetrics.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of SnippetSceneClientSettingsUpdating.resolvedMetrics.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of SnippetSceneClientSettingsUpdating.snippetSceneHostTouchRestrictedRects.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of SnippetSceneClientSettingsUpdating.snippetSceneHostTouchRestrictedRects.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of SnippetSceneClientSettingsUpdating.snippetSceneHostTouchRestrictedRects.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of SnippetSceneClientSettingsUpdating.viewModel.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of SnippetSceneClientSettingsUpdating.viewModel.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of SnippetSceneClientSettingsUpdating.viewModel.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t method lookup function for SnippetScene(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SnippetScene);
}

uint64_t dispatch thunk of SnippetScene.subscript.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of SnippetScene.observe<A>(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of SnippetScene.loadViewModel<A>()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of SnippetScene.updateClientSettings(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of SnippetScene.updateClientSettingsWithTransitionContext(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of SnippetScene.resolvedMetrics.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of SnippetScene.resolvedMetrics.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of SnippetScene.resolvedMetrics.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of SnippetScene.snippetSceneHostTouchRestrictedRects.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of SnippetScene.snippetSceneHostTouchRestrictedRects.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of SnippetScene.snippetSceneHostTouchRestrictedRects.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of SnippetScene.viewModel.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of SnippetScene.viewModel.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of SnippetScene.viewModel.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

unint64_t sub_25C992830()
{
  unint64_t result = qword_26A5DFE48;
  if (!qword_26A5DFE48)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A5DFE48);
  }
  return result;
}

uint64_t sub_25C992870(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_25C992884(a1, a2);
  }
  return a1;
}

uint64_t sub_25C992884(uint64_t a1, unint64_t a2)
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

void sub_25C9928E0(void *a1)
{
  sub_25C991DD0(a1, *(void (**)(uint64_t))(v1 + 16));
}

uint64_t sub_25C9928EC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_25C992914()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_5_0(uint64_t result)
{
  *(void *)(result + 24) = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return sub_25C991C58(v0, (uint64_t)&v3);
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return swift_isEscapingClosureAtFileLocation();
}

uint64_t sub_25C992AA4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFEC0);
  uint64_t v4 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28, v5);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFEC8);
  uint64_t v31 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29, v8);
  unint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFED0);
  uint64_t v32 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30, v11);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  BSDispatchQueueAssertMain();
  uint64_t v14 = (void *)sub_25C9902FC();
  sub_25C994CE4(&v34);

  long long v33 = v34;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFED8);
  swift_allocObject();
  uint64_t v27 = sub_25C9B7DB0();
  id v15 = *(id *)&v2[OBJC_IVAR____TtC15SiriInteractive12SnippetScene__settingsDiffer];
  uint64_t v16 = sub_25C9949F0(a1);

  *(void *)&long long v34 = v16;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v2;
  *(void *)(v17 + 24) = a1;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = sub_25C9951B4;
  *(void *)(v18 + 24) = v17;
  unint64_t v19 = v2;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFDE8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFEE0);
  sub_25C9959B4((unint64_t *)&qword_26A5DFDF0, &qword_26A5DFDE8);
  sub_25C9B7E60();
  swift_release();
  swift_release();
  sub_25C9959B4(&qword_26A5DFEE8, &qword_26A5DFEC0);
  sub_25C9959B4(&qword_26A5DFEF0, &qword_26A5DFED8);
  uint64_t v20 = v28;
  uint64_t v21 = sub_25C9B7E80();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v20);
  *(void *)&long long v34 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFEF8);
  sub_25C9959B4(&qword_26A5DFF00, &qword_26A5DFEF8);
  uint64_t v22 = sub_25C9B7DC0();
  swift_release();
  *(void *)&long long v34 = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFF08);
  sub_25C9959B4(&qword_26A5DFF10, &qword_26A5DFF08);
  sub_25C9B7E50();
  swift_release();
  sub_25C9959B4(&qword_26A5DFF18, &qword_26A5DFEC8);
  sub_25C995968();
  uint64_t v23 = v29;
  sub_25C9B7E90();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v10, v23);
  sub_25C9959B4(&qword_26A5DFF28, &qword_26A5DFED0);
  uint64_t v24 = v30;
  uint64_t v25 = sub_25C9B7E40();
  swift_release();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v13, v24);
  return v25;
}

void sub_25C992FE0(_OWORD *a1@<X8>)
{
  id v2 = (id)sub_25C9902FC();
  sub_25C994CE4(a1);
}

uint64_t sub_25C993034@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a1;
  a3[1] = a2;
  return sub_25C992870(a1, a2);
}

id SiriSceneViewController.__allocating_init<A, B>(scene:rootView:modelType:)(void *a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v17 = objc_allocWithZone(v9);
  return SiriSceneViewController.init<A, B>(scene:rootView:modelType:)(a1, a2, v18, a4, a5, a6, a7, a8, a9);
}

id SiriSceneViewController.init<A, B>(scene:rootView:modelType:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unint64_t v10 = v9;
  uint64_t v68 = a2;
  uint64_t v64 = a9;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFE50);
  MEMORY[0x270FA5388](v17 - 8, v18);
  OUTLINED_FUNCTION_0_3();
  uint64_t v62 = v19;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFE58);
  uint64_t v65 = *(void *)(v20 - 8);
  uint64_t v66 = v20;
  MEMORY[0x270FA5388](v20, v21);
  OUTLINED_FUNCTION_0_3();
  uint64_t v63 = v22;
  v73[0] = a4;
  v73[1] = a6;
  id v56 = a6;
  uint64_t v57 = a7;
  v73[2] = a7;
  v73[3] = a8;
  type metadata accessor for SnippetClientContext(255, (uint64_t)v73);
  sub_25C9B83E0();
  uint64_t v67 = a5;
  uint64_t v55 = sub_25C9B7FD0();
  uint64_t v23 = sub_25C9B7EC0();
  uint64_t v25 = MEMORY[0x270FA5388](v23, v24);
  uint64_t v26 = a4;
  uint64_t v27 = *(void *)(a4 - 8);
  uint64_t v29 = MEMORY[0x270FA5388](v25, v28);
  uint64_t v31 = (char *)&v55 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v29, v32);
  long long v34 = (char *)&v55 - v33;
  *(void *)&v10[OBJC_IVAR____TtC15SiriInteractive23SiriSceneViewController_embeddedController] = 0;
  uint64_t v35 = v10;
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_25C9B8590()) {
    unint64_t v36 = sub_25C994DD8(MEMORY[0x263F8EE78]);
  }
  else {
    unint64_t v36 = MEMORY[0x263F8EE88];
  }
  *(void *)&v35[OBJC_IVAR____TtC15SiriInteractive23SiriSceneViewController_cancellables] = v36;
  swift_unknownObjectWeakInit();
  uint64_t v59 = v26;
  uint64_t v60 = v34;
  sub_25C990CB8(v26, (uint64_t)v56, v57, (uint64_t)v34);
  uint64_t v61 = v27;
  (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v31, v34, v26);
  id v37 = a1;
  uint64_t v38 = sub_25C98C400((uint64_t)a1, (uint64_t)v31);
  swift_getWitnessTable();
  uint64_t v39 = v67;
  uint64_t v40 = v64;
  sub_25C9B8020();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v71 = v40;
  uint64_t v72 = WitnessTable;
  swift_getWitnessTable();
  uint64_t v57 = sub_25C9B8060();
  *(void *)&v35[OBJC_IVAR____TtC15SiriInteractive23SiriSceneViewController_anyRootView] = v57;
  id v56 = v37;
  swift_unknownObjectWeakAssign();
  swift_retain();

  v70.receiver = v35;
  v70.super_class = ObjectType;
  id v42 = objc_msgSendSuper2(&v70, sel_initWithNibName_bundle_, 0, 0, v55);
  uint64_t KeyPath = swift_getKeyPath();
  *(&v55 - 2) = MEMORY[0x270FA5388](KeyPath, v44);
  uint64_t v45 = swift_getKeyPath();
  id v46 = v42;
  uint64_t v47 = sub_25C992AA4(v45);
  swift_release();
  v73[0] = v47;
  sub_25C9950BC(0, &qword_26A5E0630);
  id v69 = (id)sub_25C9B8320();
  uint64_t v48 = sub_25C9B8300();
  uint64_t v49 = v62;
  __swift_storeEnumTagSinglePayload(v62, 1, 1, v48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFE80);
  sub_25C9959B4(&qword_26A5DFE88, &qword_26A5DFE80);
  sub_25C9938B4();
  uint64_t v50 = v63;
  sub_25C9B7E70();
  sub_25C993914(v49);

  swift_release();
  uint64_t v51 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v52 = (void *)swift_allocObject();
  v52[2] = v39;
  v52[3] = v40;
  v52[4] = v51;
  v52[5] = v38;
  sub_25C9959B4(&qword_26A5DFE98, &qword_26A5DFE58);
  swift_retain();
  uint64_t v53 = v66;
  sub_25C9B7EA0();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v50, v53);
  swift_beginAccess();
  sub_25C9B7D40();
  swift_endAccess();
  swift_release();
  swift_release();

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v39 - 8) + 8))(v68, v39);
  (*(void (**)(char *, uint64_t))(v61 + 8))(v60, v59);
  return v46;
}

uint64_t sub_25C993778()
{
  return sub_25C9B8130() & 1;
}

uint64_t sub_25C9937D4()
{
  return sub_25C9B8120();
}

void sub_25C99381C()
{
}

void sub_25C993878()
{
}

uint64_t sub_25C993880()
{
  return 8;
}

uint64_t sub_25C99388C()
{
  return swift_release();
}

uint64_t sub_25C993894(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

void *sub_25C9938A8(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

unint64_t sub_25C9938B4()
{
  unint64_t result = qword_26A5DFE90;
  if (!qword_26A5DFE90)
  {
    sub_25C9950BC(255, &qword_26A5E0630);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DFE90);
  }
  return result;
}

uint64_t sub_25C993914(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFE50);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C993974()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_25C9939AC(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  uint64_t v6 = a2 + 16;
  swift_beginAccess();
  uint64_t v7 = MEMORY[0x26119A970](v6);
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    sub_25C993A6C(v4, v5, a3);
  }
}

uint64_t sub_25C993A20()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_25C993A60(uint64_t *a1)
{
  sub_25C9939AC(a1, *(void *)(v1 + 32), *(uint64_t **)(v1 + 40));
}

uint64_t sub_25C993A6C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v44 = *a3;
  uint64_t v5 = *(void *)(v44 + 80);
  uint64_t v6 = sub_25C9B83E0();
  os_log_t v46 = *(os_log_t *)(v6 - 8);
  uint64_t v47 = v6;
  uint64_t v8 = MEMORY[0x270FA5388](v6, v7);
  unint64_t v10 = (char *)&v41 - v9;
  uint64_t v45 = *(void *)(v5 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v8, v11);
  uint64_t v14 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12, v15);
  uint64_t v17 = (char *)&v41 - v16;
  sub_25C9B7B60();
  swift_allocObject();
  sub_25C9B7B50();
  uint64_t v18 = a1;
  unint64_t v19 = a2;
  sub_25C9B7B40();
  swift_release();
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v5);
  uint64_t v20 = v45;
  (*(void (**)(char *, char *, uint64_t))(v45 + 32))(v17, v10, v5);
  SnippetClientContext.viewModel.getter();
  char v21 = sub_25C9B8130();
  uint64_t v22 = *(void (**)(char *, uint64_t))(v20 + 8);
  v22(v14, v5);
  uint64_t v23 = v17;
  if ((v21 & 1) == 0)
  {
    if (qword_26A5DF6B8 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_25C9B7C90();
    __swift_project_value_buffer(v24, (uint64_t)qword_26A5E00E8);
    uint64_t v25 = v18;
    uint64_t v26 = v18;
    unint64_t v27 = v19;
    sub_25C992884(v26, v19);
    sub_25C992884(v25, v19);
    uint64_t v28 = sub_25C9B7C70();
    os_log_type_t v29 = sub_25C9B82A0();
    int v30 = v29;
    if (os_log_type_enabled(v28, v29))
    {
      os_log_t v46 = v28;
      uint64_t v31 = swift_slowAlloc();
      int v43 = v30;
      uint64_t v32 = (uint8_t *)v31;
      uint64_t v44 = swift_slowAlloc();
      uint64_t v49 = v44;
      uint64_t v47 = (uint64_t)v23;
      *(_DWORD *)uint64_t v32 = 136315138;
      uint64_t v41 = v32 + 4;
      id v42 = v32;
      sub_25C992884(v25, v27);
      uint64_t v33 = v22;
      uint64_t v34 = sub_25C9B7C10();
      unint64_t v36 = v35;
      sub_25C98EE60(v25, v27);
      uint64_t v37 = v34;
      uint64_t v22 = v33;
      uint64_t v48 = sub_25C99F02C(v37, v36, &v49);
      uint64_t v23 = (char *)v47;
      sub_25C9B83F0();
      swift_bridgeObjectRelease();
      sub_25C98EE60(v25, v27);
      sub_25C98EE60(v25, v27);
      uint64_t v28 = v46;
      uint64_t v38 = v42;
      _os_log_impl(&dword_25C989000, v46, (os_log_type_t)v43, "#SiriSceneViewController received model update from host: %s", v42, 0xCu);
      uint64_t v39 = v44;
      swift_arrayDestroy();
      MEMORY[0x26119A890](v39, -1, -1);
      MEMORY[0x26119A890](v38, -1, -1);
    }
    else
    {
      sub_25C98EE60(v25, v27);
      sub_25C98EE60(v25, v27);
    }

    (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v14, v23, v5);
    SnippetClientContext.viewModel.setter(v14);
  }
  return ((uint64_t (*)(char *, uint64_t))v22)(v23, v5);
}

void sub_25C993F44()
{
  *(void *)&v0[OBJC_IVAR____TtC15SiriInteractive23SiriSceneViewController_embeddedController] = 0;
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_25C9B8590()) {
    unint64_t v1 = sub_25C994DD8(MEMORY[0x263F8EE78]);
  }
  else {
    unint64_t v1 = MEMORY[0x263F8EE88];
  }
  *(void *)&v0[OBJC_IVAR____TtC15SiriInteractive23SiriSceneViewController_cancellables] = v1;
  swift_unknownObjectWeakInit();

  sub_25C9B8580();
  __break(1u);
}

Swift::Void __swiftcall SiriSceneViewController.viewDidLoad()()
{
  v4.receiver = v0;
  v4.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v4, sel_viewDidLoad);
  sub_25C9940CC();
  id v1 = objc_msgSend(v0, sel_view);
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = objc_msgSend(self, sel_clearColor);
    objc_msgSend(v2, sel_setBackgroundColor_, v3);
  }
  else
  {
    __break(1u);
  }
}

void sub_25C9940CC()
{
  id v1 = v0;
  id v2 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFEA0));
  swift_retain();
  id v3 = (void *)sub_25C9B7F10();
  objc_msgSend(v0, sel_addChildViewController_, v3);
  id v4 = objc_msgSend(v0, sel_view);
  if (!v4)
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v5 = v4;
  id v6 = objc_msgSend(v3, sel_view);
  if (!v6)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v7 = v6;
  objc_msgSend(v5, sel_addSubview_, v6);

  objc_msgSend(v3, sel_didMoveToParentViewController_, v1);
  id v8 = objc_msgSend(v3, sel_view);
  if (!v8)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v9 = v8;
  id v10 = objc_msgSend(self, sel_clearColor);
  objc_msgSend(v9, sel_setBackgroundColor_, v10);

  id v11 = objc_msgSend(v3, sel_view);
  if (!v11)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v12 = v11;
  objc_msgSend(v11, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFE38);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_25C9B9C20;
  id v14 = objc_msgSend(v3, sel_view);
  if (!v14)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v15 = v14;
  id v16 = objc_msgSend(v14, sel_centerXAnchor);

  id v17 = objc_msgSend(v1, sel_view);
  if (!v17)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v18 = v17;
  id v19 = objc_msgSend(v17, sel_centerXAnchor);

  id v20 = objc_msgSend(v16, sel_constraintEqualToAnchor_, v19);
  *(void *)(v13 + 32) = v20;
  id v21 = objc_msgSend(v3, sel_view);
  if (!v21)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v22 = v21;
  id v23 = objc_msgSend(v21, sel_centerYAnchor);

  id v24 = objc_msgSend(v1, sel_view);
  if (!v24)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v25 = v24;
  id v26 = objc_msgSend(v24, sel_centerYAnchor);

  id v27 = objc_msgSend(v23, sel_constraintEqualToAnchor_, v26);
  *(void *)(v13 + 40) = v27;
  id v28 = objc_msgSend(v3, sel_view);
  if (!v28)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  os_log_type_t v29 = v28;
  id v30 = objc_msgSend(v28, sel_widthAnchor);

  id v31 = objc_msgSend(v1, sel_view);
  if (!v31)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v32 = v31;
  id v33 = objc_msgSend(v31, sel_widthAnchor);

  id v34 = objc_msgSend(v30, sel_constraintEqualToAnchor_, v33);
  *(void *)(v13 + 48) = v34;
  id v35 = objc_msgSend(v3, sel_view);
  if (!v35)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  unint64_t v36 = v35;
  id v37 = objc_msgSend(v35, sel_heightAnchor);

  id v38 = objc_msgSend(v1, sel_view);
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = self;
    id v41 = objc_msgSend(v39, sel_heightAnchor);

    id v42 = objc_msgSend(v37, sel_constraintEqualToAnchor_, v41);
    *(void *)(v13 + 56) = v42;
    sub_25C9B81E0();
    sub_25C9950BC(0, (unint64_t *)&qword_26A5E0510);
    int v43 = (void *)sub_25C9B81B0();
    swift_bridgeObjectRelease();
    objc_msgSend(v40, sel_activateConstraints_, v43);

    uint64_t v44 = *(void **)&v1[OBJC_IVAR____TtC15SiriInteractive23SiriSceneViewController_embeddedController];
    *(void *)&v1[OBJC_IVAR____TtC15SiriInteractive23SiriSceneViewController_embeddedController] = v3;

    return;
  }
LABEL_25:
  __break(1u);
}

Swift::Void __swiftcall SiriSceneViewController.viewDidLayoutSubviews()()
{
  v5.receiver = v0;
  v5.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v5, sel_viewDidLayoutSubviews);
  uint64_t v1 = MEMORY[0x26119A970](&v0[OBJC_IVAR____TtC15SiriInteractive23SiriSceneViewController__scene]);
  if (v1)
  {
    id v3 = (void *)v1;
    id v4 = (unsigned char *)MEMORY[0x270FA5388](v1, v2);
    sub_25C990FD8(v4, (void (*)(unsigned char *, _UNKNOWN **))sub_25C99505C);
  }
}

void sub_25C994678(uint64_t a1, uint64_t a2, char *a3)
{
  id v3 = *(void **)&a3[OBJC_IVAR____TtC15SiriInteractive23SiriSceneViewController_embeddedController];
  if (!v3)
  {
    __break(1u);
    goto LABEL_11;
  }
  id v6 = objc_msgSend(v3, sel_view);
  if (!v6)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v7 = v6;
  objc_msgSend(v6, sel_intrinsicContentSize);
  double v9 = v8;
  double v11 = v10;

  id v12 = objc_msgSend(a3, sel_view);
  if (!v12)
  {
LABEL_12:
    __break(1u);
    return;
  }
  uint64_t v13 = v12;
  id v14 = objc_msgSend(v12, sel_layer);

  objc_msgSend(v14, sel_cornerRadius);
  double v16 = v15;

  id v17 = objc_allocWithZone((Class)type metadata accessor for SceneMetrics());
  id v25 = SceneMetrics.init(size:cornerRadius:)(v9, v11, v16);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v19 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 8))(ObjectType, a2);
  if (!v19
    || (id v20 = (void *)v19,
        id v21 = v25,
        char v22 = sub_25C9B83C0(),
        v20,
        v21,
        (v22 & 1) == 0))
  {
    id v23 = *(void (**)(id, uint64_t, uint64_t))(a2 + 16);
    id v24 = v25;
    v23(v25, ObjectType, a2);
  }
}

id SiriSceneViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  if (a2)
  {
    id v6 = (void *)sub_25C9B8140();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void SiriSceneViewController.init(nibName:bundle:)()
{
}

id SiriSceneViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25C9949F0(uint64_t a1)
{
  objc_super v2 = v1;
  id v4 = (uint64_t *)&v1[OBJC_IVAR____TtC15SiriInteractive14SettingsDiffer_subjects];
  swift_beginAccess();
  uint64_t v5 = *v4;
  swift_bridgeObjectRetain();
  uint64_t v6 = swift_retain();
  uint64_t v7 = sub_25C994C08(v6, v5);
  swift_release();
  swift_bridgeObjectRelease();
  if (!v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFDE8);
    swift_allocObject();
    uint64_t v7 = sub_25C9B7D80();
    uint64_t v8 = swift_allocObject();
    swift_weakInit();
    swift_beginAccess();
    uint64_t v9 = qword_26A5E0280;
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = sub_25C995A30;
    *(void *)(v10 + 24) = v8;
    v14[4] = sub_25C995A38;
    v14[5] = v10;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 1107296256;
    v14[2] = sub_25C99FC18;
    v14[3] = &block_descriptor_0;
    double v11 = _Block_copy(v14);
    swift_retain_n();
    swift_release();
    objc_msgSend(v2, sel_observeOtherSetting_withBlock_, v9, v11);
    _Block_release(v11);
    swift_release_n();
    swift_beginAccess();
    swift_retain();
    uint64_t v12 = swift_retain();
    sub_25C9951BC(v12, a1);
    swift_endAccess();
    swift_release();
  }
  return v7;
}

uint64_t sub_25C994C08(uint64_t a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(void *)(a2 + 16))
    {
      unint64_t v5 = sub_25C9B40BC(a1);
      if (v6)
      {
        uint64_t v4 = *(void *)(*(void *)(a2 + 56) + 8 * v5);
        swift_retain();
        return v4;
      }
    }
    return 0;
  }
  swift_retain();
  uint64_t v3 = sub_25C9B8550();
  swift_release();
  if (!v3) {
    return 0;
  }
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFDE8);
  swift_dynamicCast();
  uint64_t v4 = v8;
  swift_unknownObjectRelease();
  return v4;
}

double sub_25C994CE4@<D0>(_OWORD *a1@<X8>)
{
  id v3 = objc_msgSend(v1, sel_otherSettings);
  swift_beginAccess();
  id v4 = objc_msgSend(v3, sel_objectForSetting_, qword_26A5E0280);

  if (v4)
  {
    sub_25C9B8410();
    swift_unknownObjectRelease();
    sub_25C992214(&v6, v7);
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5DFCD0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    double result = 0.0;
    *a1 = xmmword_25C9B9B90;
  }
  return result;
}

unint64_t sub_25C994DD8(unint64_t result)
{
  unint64_t v1 = result;
  unint64_t v2 = result >> 62;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_25C9B8590();
    double result = swift_bridgeObjectRelease();
    if (v4) {
      goto LABEL_3;
    }
  }
  else if (*(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFEA8);
    double result = sub_25C9B84B0();
    unint64_t v3 = result;
    goto LABEL_6;
  }
  unint64_t v3 = MEMORY[0x263F8EE88];
LABEL_6:
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_25C9B8590();
    double result = swift_bridgeObjectRelease();
    if (!v5)
    {
LABEL_25:
      swift_bridgeObjectRelease();
      return v3;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v5) {
      goto LABEL_25;
    }
  }
  unint64_t v6 = 0;
  unint64_t v7 = v3 + 56;
  unint64_t v21 = v1 & 0xC000000000000001;
  unint64_t v18 = v1 + 32;
  uint64_t v19 = v1 & 0xFFFFFFFFFFFFFF8;
  unint64_t v20 = v1;
  while (1)
  {
    if (v21)
    {
      double result = MEMORY[0x261199F90](v6, v1);
      unint64_t v8 = result;
    }
    else
    {
      if (v6 >= *(void *)(v19 + 16)) {
        goto LABEL_28;
      }
      unint64_t v8 = *(void *)(v18 + 8 * v6);
      double result = swift_retain();
    }
    BOOL v9 = __OFADD__(v6++, 1);
    if (v9) {
      break;
    }
    sub_25C9B7D50();
    sub_25C9950F8(&qword_26A5DFEB0);
    double result = sub_25C9B8110();
    uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v11 = result & ~v10;
    unint64_t v12 = v11 >> 6;
    uint64_t v13 = *(void *)(v7 + 8 * (v11 >> 6));
    uint64_t v14 = 1 << v11;
    if (((1 << v11) & v13) != 0)
    {
      uint64_t v15 = ~v10;
      sub_25C9950F8(&qword_26A5DFEB8);
      while (1)
      {
        double result = sub_25C9B8130();
        if (result) {
          break;
        }
        unint64_t v11 = (v11 + 1) & v15;
        unint64_t v12 = v11 >> 6;
        uint64_t v13 = *(void *)(v7 + 8 * (v11 >> 6));
        uint64_t v14 = 1 << v11;
        if ((v13 & (1 << v11)) == 0)
        {
          unint64_t v1 = v20;
          goto LABEL_21;
        }
      }
      double result = swift_release();
      unint64_t v1 = v20;
    }
    else
    {
LABEL_21:
      *(void *)(v7 + 8 * v12) = v14 | v13;
      *(void *)(*(void *)(v3 + 48) + 8 * v11) = v8;
      uint64_t v16 = *(void *)(v3 + 16);
      BOOL v9 = __OFADD__(v16, 1);
      uint64_t v17 = v16 + 1;
      if (v9) {
        goto LABEL_27;
      }
      *(void *)(v3 + 16) = v17;
    }
    if (v6 == v5) {
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

void sub_25C99505C(uint64_t a1, uint64_t a2)
{
  sub_25C994678(a1, a2, *(char **)(v2 + 16));
}

uint64_t type metadata accessor for SiriSceneViewController()
{
  return self;
}

uint64_t method lookup function for SiriSceneViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SiriSceneViewController);
}

uint64_t dispatch thunk of SiriSceneViewController.__allocating_init<A, B>(scene:rootView:modelType:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_25C9950BC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_25C9950F8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_25C9B7D50();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_25C995174()
{
  swift_release();
  return swift_deallocObject();
}

void sub_25C9951B4(_OWORD *a1@<X8>)
{
}

uint64_t sub_25C9951BC(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    uint64_t result = sub_25C9B8450();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    *unint64_t v3 = sub_25C995270(v7, result + 1);
  }
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  sub_25C99579C(a1, a2);
  *unint64_t v3 = v9;
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C995270(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE80];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFF38);
  uint64_t v2 = sub_25C9B85B0();
  uint64_t v17 = v2;
  sub_25C9B8530();
  uint64_t v3 = sub_25C9B8560();
  if (!v3)
  {
LABEL_15:
    swift_release();
    return v2;
  }
  while (1)
  {
    uint64_t v15 = v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFFA0);
    swift_dynamicCast();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFDE8);
    swift_dynamicCast();
    unint64_t v4 = *(void *)(v2 + 16);
    if (*(void *)(v2 + 24) <= v4)
    {
      sub_25C995498(v4 + 1, 1);
      uint64_t v2 = v17;
    }
    uint64_t result = sub_25C9B8110();
    uint64_t v6 = v2 + 64;
    uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v8 = result & ~v7;
    unint64_t v9 = v8 >> 6;
    if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) == 0) {
      break;
    }
    unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
LABEL_14:
    *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
    *(void *)(*(void *)(v2 + 48) + 8 * v10) = v16;
    *(void *)(*(void *)(v2 + 56) + 8 * v10) = v15;
    ++*(void *)(v2 + 16);
    uint64_t v3 = sub_25C9B8560();
    if (!v3) {
      goto LABEL_15;
    }
  }
  char v11 = 0;
  unint64_t v12 = (unint64_t)(63 - v7) >> 6;
  while (++v9 != v12 || (v11 & 1) == 0)
  {
    BOOL v13 = v9 == v12;
    if (v9 == v12) {
      unint64_t v9 = 0;
    }
    v11 |= v13;
    uint64_t v14 = *(void *)(v6 + 8 * v9);
    if (v14 != -1)
    {
      unint64_t v10 = __clz(__rbit64(~v14)) + (v9 << 6);
      goto LABEL_14;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25C995498(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFF38);
  char v33 = a2;
  uint64_t v6 = sub_25C9B85A0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_39;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v32 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v31 = (unint64_t)(v8 + 63) >> 6;
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
    uint64_t v20 = *(void *)(*(void *)(v5 + 48) + 8 * i);
    uint64_t v21 = *(void *)(*(void *)(v5 + 56) + 8 * i);
    if ((v33 & 1) == 0)
    {
      swift_retain();
      swift_retain();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFFA0);
    uint64_t result = sub_25C9B8110();
    uint64_t v22 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v11 + 8 * (v23 >> 6))) == 0)
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
        uint64_t v29 = *(void *)(v11 + 8 * v24);
        if (v29 != -1)
        {
          unint64_t v25 = __clz(__rbit64(~v29)) + (v24 << 6);
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
    unint64_t v25 = __clz(__rbit64((-1 << v23) & ~*(void *)(v11 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v11 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
    *(void *)(*(void *)(v7 + 48) + 8 * v25) = v20;
    *(void *)(*(void *)(v7 + 56) + 8 * v25) = v21;
    ++*(void *)(v7 + 16);
    if (v10) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v16 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      goto LABEL_41;
    }
    if (v16 >= v31)
    {
      swift_release();
      uint64_t v17 = (void *)(v5 + 64);
      goto LABEL_34;
    }
    uint64_t v17 = (void *)(v5 + 64);
    unint64_t v18 = *(void *)(v32 + 8 * v16);
    ++v13;
    if (!v18)
    {
      int64_t v13 = v16 + 1;
      if (v16 + 1 >= v31) {
        goto LABEL_32;
      }
      unint64_t v18 = *(void *)(v32 + 8 * v13);
      if (!v18) {
        break;
      }
    }
LABEL_18:
    unint64_t v10 = (v18 - 1) & v18;
  }
  int64_t v19 = v16 + 2;
  if (v19 < v31)
  {
    unint64_t v18 = *(void *)(v32 + 8 * v19);
    if (!v18)
    {
      while (1)
      {
        int64_t v13 = v19 + 1;
        if (__OFADD__(v19, 1)) {
          goto LABEL_42;
        }
        if (v13 >= v31) {
          goto LABEL_32;
        }
        unint64_t v18 = *(void *)(v32 + 8 * v13);
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
LABEL_34:
  if (v33)
  {
    uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
    if (v30 >= 64) {
      sub_25C9B42E4(0, (unint64_t)(v30 + 63) >> 6, v17);
    }
    else {
      void *v17 = -1 << v30;
    }
    *(void *)(v5 + 16) = 0;
  }
LABEL_39:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25C99579C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void **)v2;
  uint64_t v6 = (void *)*v2;
  unint64_t v7 = sub_25C9B40BC(a2);
  if (__OFADD__(v6[2], (v8 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v9 = v7;
  char v10 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFF30);
  if ((sub_25C9B8510() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v11 = sub_25C9B40BC(a2);
  if ((v10 & 1) != (v12 & 1))
  {
LABEL_11:
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFFA0);
    uint64_t result = sub_25C9B8630();
    __break(1u);
    return result;
  }
  unint64_t v9 = v11;
LABEL_5:
  int64_t v13 = *v3;
  if (v10)
  {
    uint64_t v14 = v13[7];
    uint64_t result = swift_release();
    *(void *)(v14 + 8 * v9) = a1;
  }
  else
  {
    sub_25C9958B8(v9, a2, a1, v13);
    return swift_retain();
  }
  return result;
}

unint64_t sub_25C9958B8(unint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  *(void *)(a4[6] + 8 * result) = a2;
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

uint64_t sub_25C9958FC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_25C995934()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_25C99595C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_25C993034(*(void *)a1, *(void *)(a1 + 8), a2);
}

unint64_t sub_25C995968()
{
  unint64_t result = qword_26A5DFF20;
  if (!qword_26A5DFF20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DFF20);
  }
  return result;
}

uint64_t sub_25C9959B4(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_25C9959F8()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_25C995A30()
{
  return sub_25C998998();
}

uint64_t sub_25C995A38(uint64_t a1, uint64_t a2)
{
  return sub_25C99FDA4(a1, a2, *(uint64_t (**)(void))(v2 + 16));
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

uint64_t sub_25C995A70()
{
  sub_25C9B7B90();
  swift_allocObject();
  sub_25C9B7B80();
  uint64_t v0 = sub_25C9B7B70();
  swift_release();
  return v0;
}

uint64_t static Feature.isEnabled(_:)()
{
  uint64_t v3 = &type metadata for Feature;
  unint64_t v4 = sub_25C98CB98();
  char v0 = sub_25C9B7C60();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  return v0 & 1;
}

const char *Feature.domain.getter()
{
  return "SiriInteractive";
}

const char *Feature.feature.getter()
{
  return "nativeHosting";
}

uint64_t static Feature.== infix(_:_:)()
{
  return 1;
}

uint64_t Feature.hash(into:)()
{
  return sub_25C9B86B0();
}

uint64_t Feature.hashValue.getter()
{
  return sub_25C9B86D0();
}

uint64_t sub_25C995CC0()
{
  return 1;
}

unint64_t sub_25C995CCC()
{
  unint64_t result = qword_26A5DFF48;
  if (!qword_26A5DFF48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5DFF48);
  }
  return result;
}

uint64_t sub_25C995D18()
{
  return Feature.hashValue.getter();
}

uint64_t sub_25C995D30()
{
  return Feature.hash(into:)();
}

uint64_t sub_25C995D48()
{
  return sub_25C9B86D0();
}

const char *sub_25C995D88()
{
  return "SiriInteractive";
}

const char *sub_25C995D9C()
{
  return "nativeHosting";
}

uint64_t getEnumTagSinglePayload for Feature(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for Feature(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25C995EA0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25C995EC8()
{
  return 0;
}

ValueMetadata *type metadata accessor for Feature()
{
  return &type metadata for Feature;
}

uint64_t sub_25C995EE4(uint64_t a1)
{
  return OUTLINED_FUNCTION_4_1(a1, OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__widthRequest);
}

id sub_25C995F24()
{
  return OUTLINED_FUNCTION_5_1(OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__widthRequest);
}

void sub_25C995F8C(void *a1)
{
}

void sub_25C995FA4(id *a1)
{
}

void (*sub_25C995FD0())(void **a1, char a2)
{
  OUTLINED_FUNCTION_12();
  unint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__widthRequest);
  void *v2 = v1;
  v2[1] = v0;
  id v3 = v1;
  return sub_25C996020;
}

void sub_25C996020(void **a1, char a2)
{
}

uint64_t sub_25C996038(uint64_t a1)
{
  return OUTLINED_FUNCTION_4_1(a1, OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__heightRequest);
}

id sub_25C996078()
{
  return OUTLINED_FUNCTION_5_1(OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__heightRequest);
}

void sub_25C9960E0(void *a1)
{
}

void sub_25C9960F8(void *a1, void (*a2)())
{
}

void sub_25C996184(id *a1)
{
}

void (*sub_25C9961B0())(void **a1, char a2)
{
  OUTLINED_FUNCTION_12();
  unint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__heightRequest);
  void *v2 = v1;
  v2[1] = v0;
  id v3 = v1;
  return sub_25C996200;
}

void sub_25C996200(void **a1, char a2)
{
}

void sub_25C996218(void **a1, char a2, void (*a3)(void))
{
  unsigned int v4 = *a1;
  if (a2)
  {
    id v5 = v4;
    a3();
  }
  else
  {
    ((void (*)(void *))a3)(v4);
  }
}

double sub_25C9962B0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest_cornerRadius;
  OUTLINED_FUNCTION_2_3();
  return *(double *)v1;
}

uint64_t sub_25C99630C(double a1)
{
  id v3 = (double *)(v1 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest_cornerRadius);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_25C996360())()
{
  return j__swift_endAccess;
}

double sub_25C9963E0()
{
  double v1 = *(double *)(*(void *)(v0 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__widthRequest)
                 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_maximum);
  sub_25C98D1EC(200.0);
  return v1;
}

double sub_25C996464()
{
  return *(double *)(*(void *)(v0 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__widthRequest)
                   + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_maximum);
}

id SceneItemMetricsRequest.__allocating_init(width:height:cornerRadius:)(void *a1, void *a2, double a3)
{
  id v7 = objc_allocWithZone(v3);
  return SceneItemMetricsRequest.init(width:height:cornerRadius:)(a1, a2, a3);
}

id SceneItemMetricsRequest.init(width:height:cornerRadius:)(void *a1, void *a2, double a3)
{
  id v7 = v3;
  objc_msgSend(a1, sel_copy);
  sub_25C9B8410();
  swift_unknownObjectRelease();
  type metadata accessor for SizeDimensionRequest();
  OUTLINED_FUNCTION_6_1();
  *(void *)&v7[OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__widthRequest] = v11;
  objc_msgSend(a2, sel_copy);
  sub_25C9B8410();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_6_1();
  *(void *)&v7[OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__heightRequest] = v11;
  *(double *)&v7[OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest_cornerRadius] = a3;

  v10.receiver = v7;
  v10.super_class = (Class)type metadata accessor for SceneItemMetricsRequest();
  id v8 = objc_msgSendSuper2(&v10, sel_init);

  return v8;
}

uint64_t type metadata accessor for SceneItemMetricsRequest()
{
  return self;
}

BOOL sub_25C99666C()
{
  if (*(double *)(*(void *)(v0 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__widthRequest)
                 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_maximum) != 0.0
    || *(double *)(*(void *)(v0 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__heightRequest)
                 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_maximum) != 0.0)
  {
    return 1;
  }
  double v1 = (double *)(v0 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest_cornerRadius);
  OUTLINED_FUNCTION_2_3();
  return *v1 != 0.0;
}

id sub_25C996718()
{
  uint64_t v0 = (objc_class *)type metadata accessor for SizeDimensionRequest();
  id v1 = objc_allocWithZone(v0);
  id v2 = OUTLINED_FUNCTION_0_4();
  id v3 = objc_allocWithZone(v0);
  id v4 = OUTLINED_FUNCTION_0_4();
  id v5 = objc_allocWithZone((Class)type metadata accessor for SceneItemMetricsRequest());
  return SceneItemMetricsRequest.init(width:height:cornerRadius:)(v2, v4, 0.0);
}

uint64_t sub_25C9967B4()
{
  uint64_t result = (uint64_t)objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__widthRequest), sel_hash);
  if (result >= 1) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = result;
  }
  uint64_t v3 = 31 * v2;
  if ((unsigned __int128)(v2 * (__int128)31) >> 64 != (31 * v2) >> 63)
  {
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t result = (uint64_t)objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__heightRequest), sel_hash);
  if (result >= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = result;
  }
  uint64_t v5 = v3 * v4;
  if ((unsigned __int128)(v3 * (__int128)v4) >> 64 != (v3 * v4) >> 63) {
    goto LABEL_17;
  }
  uint64_t v6 = (double *)(v0 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest_cornerRadius);
  uint64_t result = OUTLINED_FUNCTION_2_3();
  double v7 = *v6;
  if (*v6 > 1.0) {
    double v7 = 1.0;
  }
  if ((~*(void *)&v7 & 0x7FF0000000000000) == 0) {
    goto LABEL_18;
  }
  if (v7 <= -9.22337204e18)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (v7 >= 9.22337204e18)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t result = v5 * (uint64_t)v7;
  if ((unsigned __int128)(v5 * (__int128)(uint64_t)v7) >> 64 != result >> 63) {
LABEL_21:
  }
    __break(1u);
  return result;
}

BOOL sub_25C9968C0(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_25C98D41C(a1, (uint64_t)v17);
  if (v18)
  {
    type metadata accessor for SceneItemMetricsRequest();
    if (swift_dynamicCast())
    {
      sub_25C98F8F8();
      uint64_t v3 = *(void **)&v16[OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__widthRequest];
      id v4 = *(id *)(v1 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__widthRequest);
      id v5 = v3;
      char v6 = sub_25C9B83C0();

      if (v6)
      {
        double v7 = *(void **)&v16[OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__heightRequest];
        id v8 = *(id *)(v1 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__heightRequest);
        id v9 = v7;
        char v10 = sub_25C9B83C0();

        if (v10)
        {
          uint64_t v11 = (double *)(v2 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest_cornerRadius);
          swift_beginAccess();
          double v12 = *v11;
          int64_t v13 = (double *)&v16[OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest_cornerRadius];
          OUTLINED_FUNCTION_2_3();
          double v14 = *v13;

          return v12 == v14;
        }
      }
    }
  }
  else
  {
    sub_25C98D484((uint64_t)v17);
  }
  return 0;
}

id sub_25C996AF8()
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29C40]), sel_initWithObject_, v0);
  if (result)
  {
    uint64_t v2 = result;
    OUTLINED_FUNCTION_11();

    OUTLINED_FUNCTION_10_1();
    OUTLINED_FUNCTION_1_3();

    id result = (id)sub_25C98DE78(v2);
    if (v9)
    {
      id v10 = result;

      return v10;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_25C996BE0(uint64_t result)
{
  if (result)
  {
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
    OUTLINED_FUNCTION_1_3();
    return BSSerializeDoubleToXPCDictionaryWithKey();
  }
  return result;
}

id SceneItemMetricsRequest.__allocating_init(xpcDictionary:)()
{
  id v1 = objc_allocWithZone(v0);
  return SceneItemMetricsRequest.init(xpcDictionary:)();
}

id SceneItemMetricsRequest.init(xpcDictionary:)()
{
  id v1 = v0;
  if ((id)BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey())
  {
    sub_25C9B8410();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
  }
  sub_25C98EDF8((uint64_t)&v11, (uint64_t)v13);
  if (v14)
  {
    type metadata accessor for SizeDimensionRequest();
    if (OUTLINED_FUNCTION_7_1())
    {
      id v2 = v9;
      goto LABEL_9;
    }
  }
  else
  {
    sub_25C98D484((uint64_t)v13);
  }
  id v3 = objc_allocWithZone((Class)type metadata accessor for SizeDimensionRequest());
  id v2 = OUTLINED_FUNCTION_0_4();
LABEL_9:
  *(void *)&v1[OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__widthRequest] = v2;
  if ((id)BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey())
  {
    sub_25C9B8410();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
  }
  sub_25C98EDF8((uint64_t)&v11, (uint64_t)v13);
  if (!v14)
  {
    sub_25C98D484((uint64_t)v13);
    goto LABEL_16;
  }
  type metadata accessor for SizeDimensionRequest();
  if (!OUTLINED_FUNCTION_7_1())
  {
LABEL_16:
    id v5 = objc_allocWithZone((Class)type metadata accessor for SizeDimensionRequest());
    id v4 = OUTLINED_FUNCTION_0_4();
    goto LABEL_17;
  }
  id v4 = v9;
LABEL_17:
  *(void *)&v1[OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__heightRequest] = v4;
  BSDeserializeDoubleFromXPCDictionaryWithKey();
  *(void *)&v1[OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest_cornerRadius] = v6;

  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for SceneItemMetricsRequest();
  id v7 = objc_msgSendSuper2(&v10, sel_init);
  swift_unknownObjectRelease();
  return v7;
}

id sub_25C996ED8@<X0>(void *a1@<X8>)
{
  id v3 = *(void **)((char *)v1 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__widthRequest);
  id v4 = *(void **)((char *)v1 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__heightRequest);
  OUTLINED_FUNCTION_1_3();
  double v5 = *v1;
  uint64_t v6 = (objc_class *)type metadata accessor for SceneItemMetricsRequest();
  id v7 = objc_allocWithZone(v6);
  id result = SceneItemMetricsRequest.init(width:height:cornerRadius:)(v3, v4, v5);
  a1[3] = v6;
  *a1 = result;
  return result;
}

uint64_t static SceneItemMetricsRequest.supportsSecureCoding.getter()
{
  return 1;
}

void sub_25C996FE4(void *a1)
{
  id v3 = *(id *)((char *)v1 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__widthRequest);
  id v4 = (void *)sub_25C9B8140();
  OUTLINED_FUNCTION_9_1();

  id v5 = *(id *)((char *)v1 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__heightRequest);
  uint64_t v6 = (void *)sub_25C9B8140();
  OUTLINED_FUNCTION_9_1();

  OUTLINED_FUNCTION_1_3();
  double v7 = *v1;
  uint64_t v8 = (void *)OUTLINED_FUNCTION_3_2();
  objc_msgSend(a1, sel_encodeDouble_forKey_, v8, v7);
}

id SceneItemMetricsRequest.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return SceneItemMetricsRequest.init(coder:)(a1);
}

id SceneItemMetricsRequest.init(coder:)(void *a1)
{
  id v3 = (objc_class *)type metadata accessor for SizeDimensionRequest();
  id v4 = v1;
  OUTLINED_FUNCTION_11();
  uint64_t v5 = sub_25C9B8390();
  if (!v5)
  {
    id v6 = objc_allocWithZone(v3);
    uint64_t v5 = (uint64_t)OUTLINED_FUNCTION_0_4();
  }
  *(void *)&v4[OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__widthRequest] = v5;
  OUTLINED_FUNCTION_10_1();
  uint64_t v7 = sub_25C9B8390();
  if (!v7)
  {
    id v8 = objc_allocWithZone(v3);
    uint64_t v7 = (uint64_t)OUTLINED_FUNCTION_0_4();
  }
  *(void *)&v4[OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__heightRequest] = v7;
  uint64_t v9 = (void *)OUTLINED_FUNCTION_3_2();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v9);
  uint64_t v11 = v10;

  *(void *)&v4[OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest_cornerRadius] = v11;
  v14.receiver = v4;
  v14.super_class = (Class)type metadata accessor for SceneItemMetricsRequest();
  id v12 = objc_msgSendSuper2(&v14, sel_init);

  return v12;
}

id SceneItemMetricsRequest.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void SceneItemMetricsRequest.init()()
{
}

id SceneItemMetricsRequest.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneItemMetricsRequest();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_25C997384()
{
  OUTLINED_FUNCTION_8_1();
  id result = sub_25C995F24();
  void *v0 = result;
  return result;
}

id sub_25C9973AC()
{
  OUTLINED_FUNCTION_8_1();
  id result = sub_25C996078();
  void *v0 = result;
  return result;
}

void sub_25C9973D4()
{
  OUTLINED_FUNCTION_8_1();
  double *v0 = sub_25C9962B0();
}

uint64_t sub_25C9973F8(double *a1)
{
  return sub_25C99630C(*a1);
}

uint64_t method lookup function for SceneItemMetricsRequest(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SceneItemMetricsRequest);
}

uint64_t dispatch thunk of SceneItemMetricsRequest.widthRequest.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.widthRequest.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.widthRequest.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.heightRequest.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.heightRequest.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.heightRequest.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.cornerRadius.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.cornerRadius.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.cornerRadius.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.initialSize.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.maximumSize.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.__allocating_init(width:height:cornerRadius:)()
{
  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.isValid()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of static SceneItemMetricsRequest.empty()()
{
  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.encode(withXPCDictionary:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.__allocating_init(xpcDictionary:)()
{
  return (*(uint64_t (**)(void))(v0 + 272))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.copy(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 296))();
}

id OUTLINED_FUNCTION_0_4()
{
  return SizeDimensionRequest.init(minimum:maximum:type:)(1, 0.0, 0.0);
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return sub_25C9B8140();
}

uint64_t OUTLINED_FUNCTION_4_1@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 + a2) = a1;
  return MEMORY[0x270F9A758]();
}

id OUTLINED_FUNCTION_5_1@<X0>(uint64_t a1@<X8>)
{
  return *(id *)(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return swift_dynamicCast();
}

id OUTLINED_FUNCTION_9_1()
{
  return objc_msgSend(v0, (SEL)(v3 + 2501), v1, v2);
}

id SceneMetrics.__allocating_init(size:cornerRadius:)(double a1, double a2, double a3)
{
  id v7 = objc_allocWithZone(v3);
  return SceneMetrics.init(size:cornerRadius:)(a1, a2, a3);
}

double sub_25C997974()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15SiriInteractive12SceneMetrics_size;
  OUTLINED_FUNCTION_1_4();
  return *(double *)v1;
}

uint64_t sub_25C9979D8(double a1, double a2)
{
  uint64_t result = OUTLINED_FUNCTION_2_4();
  double *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t sub_25C997A1C(double *a1)
{
  return sub_25C9979D8(*a1, a1[1]);
}

uint64_t (*sub_25C997A44())()
{
  return j_j__swift_endAccess;
}

double sub_25C997AB0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15SiriInteractive12SceneMetrics_cornerRadius;
  OUTLINED_FUNCTION_1_4();
  return *(double *)v1;
}

uint64_t sub_25C997B14(double a1)
{
  uint64_t result = OUTLINED_FUNCTION_2_4();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*sub_25C997B54())()
{
  return j__swift_endAccess;
}

id SceneMetrics.__allocating_init(xpcDictionary:)()
{
  id v1 = objc_allocWithZone(v0);
  return SceneMetrics.init(xpcDictionary:)();
}

id SceneMetrics.init(xpcDictionary:)()
{
  id v1 = v0;
  BSDeserializeCGSizeFromXPCDictionaryWithKey();
  uint64_t v2 = &v1[OBJC_IVAR____TtC15SiriInteractive12SceneMetrics_size];
  *(void *)uint64_t v2 = v3;
  *((void *)v2 + 1) = v4;
  BSDeserializeDoubleFromXPCDictionaryWithKey();
  *(void *)&v1[OBJC_IVAR____TtC15SiriInteractive12SceneMetrics_cornerRadius] = v5;

  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for SceneMetrics();
  id v6 = objc_msgSendSuper2(&v8, sel_init);
  swift_unknownObjectRelease();
  return v6;
}

uint64_t sub_25C997C9C(uint64_t result)
{
  if (result)
  {
    OUTLINED_FUNCTION_1_4();
    BSSerializeCGSizeToXPCDictionaryWithKey();
    OUTLINED_FUNCTION_1_4();
    return BSSerializeDoubleToXPCDictionaryWithKey();
  }
  return result;
}

id SceneMetrics.init(size:cornerRadius:)(double a1, double a2, double a3)
{
  uint64_t v4 = (double *)&v3[OBJC_IVAR____TtC15SiriInteractive12SceneMetrics_size];
  *uint64_t v4 = a1;
  v4[1] = a2;
  *(double *)&v3[OBJC_IVAR____TtC15SiriInteractive12SceneMetrics_cornerRadius] = a3;
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for SceneMetrics();
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t type metadata accessor for SceneMetrics()
{
  return self;
}

uint64_t static SceneMetrics.supportsSecureCoding.getter()
{
  return 1;
}

void sub_25C997E3C(void *a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR____TtC15SiriInteractive12SceneMetrics_size);
  OUTLINED_FUNCTION_1_4();
  double v5 = *v3;
  double v4 = v3[1];
  objc_super v6 = (void *)sub_25C9B8140();
  objc_msgSend(a1, sel_encodeCGSize_forKey_, v6, v5, v4);

  id v7 = (double *)(v1 + OBJC_IVAR____TtC15SiriInteractive12SceneMetrics_cornerRadius);
  OUTLINED_FUNCTION_1_4();
  *(float *)&double v4 = *v7;
  objc_super v8 = (void *)OUTLINED_FUNCTION_3_2();
  LODWORD(v9) = LODWORD(v4);
  objc_msgSend(a1, sel_encodeFloat_forKey_, v8, v9);
}

id SceneMetrics.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return SceneMetrics.init(coder:)(a1);
}

id SceneMetrics.init(coder:)(void *a1)
{
  id v3 = v1;
  double v4 = (void *)sub_25C9B8140();
  objc_msgSend(a1, sel_decodeCGSizeForKey_, v4);
  uint64_t v6 = v5;
  uint64_t v8 = v7;

  double v9 = &v3[OBJC_IVAR____TtC15SiriInteractive12SceneMetrics_size];
  *(void *)double v9 = v6;
  *((void *)v9 + 1) = v8;
  uint64_t v10 = (void *)OUTLINED_FUNCTION_3_2();
  objc_msgSend(a1, sel_decodeFloatForKey_, v10);
  LODWORD(v6) = v11;

  *(double *)&v3[OBJC_IVAR____TtC15SiriInteractive12SceneMetrics_cornerRadius] = *(float *)&v6;
  v14.receiver = v3;
  v14.super_class = (Class)type metadata accessor for SceneMetrics();
  id v12 = objc_msgSendSuper2(&v14, sel_init);

  return v12;
}

id SceneMetrics.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void SceneMetrics.init()()
{
}

id SceneMetrics.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneMetrics();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_25C998154(uint64_t a1@<X8>)
{
  *(double *)a1 = sub_25C997974();
  *(void *)(a1 + 8) = v2;
}

void sub_25C998184(double *a1@<X8>)
{
  *a1 = sub_25C997AB0();
}

uint64_t sub_25C9981B0(double *a1)
{
  return sub_25C997B14(*a1);
}

uint64_t method lookup function for SceneMetrics(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SceneMetrics);
}

uint64_t dispatch thunk of SceneMetrics.size.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of SceneMetrics.size.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of SceneMetrics.size.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of SceneMetrics.cornerRadius.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of SceneMetrics.cornerRadius.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of SceneMetrics.cornerRadius.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of SceneMetrics.__allocating_init(xpcDictionary:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of SceneMetrics.encode(withXPCDictionary:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of SceneMetrics.__allocating_init(size:cornerRadius:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of SceneMetrics.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of SceneMetrics.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return swift_beginAccess();
}

uint64_t SnippetHostingContext.onReceiveActionFromClient.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC15SiriInteractive21SnippetHostingContext_onReceiveActionFromClient;
  sub_25C9B8350();
  OUTLINED_FUNCTION_9();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  return v6(a1, v3, v4);
}

uint64_t SnippetHostingContext.sendAction(_:)(uint64_t result)
{
  uint64_t v2 = *(void (**)(uint64_t))(v1 + OBJC_IVAR____TtC15SiriInteractive21SnippetHostingContext_actionHandler);
  if (v2)
  {
    uint64_t v3 = result;
    swift_retain();
    v2(v3);
    return sub_25C9984F4((uint64_t)v2);
  }
  return result;
}

uint64_t sub_25C9984F4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t SnippetHostingContext.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15SiriInteractive21SnippetHostingContext_onReceiveActionFromClient;
  sub_25C9B8350();
  OUTLINED_FUNCTION_9();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  sub_25C9984F4(*(void *)(v0 + OBJC_IVAR____TtC15SiriInteractive21SnippetHostingContext_actionHandler));
  return v0;
}

uint64_t SnippetHostingContext.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15SiriInteractive21SnippetHostingContext_onReceiveActionFromClient;
  sub_25C9B8350();
  OUTLINED_FUNCTION_9();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  sub_25C9984F4(*(void *)(v0 + OBJC_IVAR____TtC15SiriInteractive21SnippetHostingContext_actionHandler));
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_25C998620()
{
  return type metadata accessor for SnippetHostingContext();
}

uint64_t type metadata accessor for SnippetHostingContext()
{
  uint64_t result = qword_26A5DFF80;
  if (!qword_26A5DFF80) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C998670()
{
  uint64_t result = sub_25C9B8350();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SnippetHostingContext(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SnippetHostingContext);
}

uint64_t sub_25C998720()
{
  uint64_t v1 = v0;
  id v2 = objc_msgSend(self, sel_defaultCenter);
  if (qword_26A5DF688 != -1) {
    swift_once();
  }
  sub_25C9B8360();

  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC15SiriInteractive21SnippetHostingContext_actionHandler);
  *uint64_t v3 = 0;
  v3[1] = 0;
  return v1;
}

uint64_t sub_25C9987D0(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *a1;
  uint64_t v7 = (uint64_t *)(v2 + OBJC_IVAR____TtC15SiriInteractive14SettingsDiffer_subjects);
  swift_beginAccess();
  uint64_t v8 = *v7;
  swift_bridgeObjectRetain();
  uint64_t v9 = swift_retain();
  uint64_t v10 = sub_25C994C08(v9, v8);
  swift_release();
  swift_bridgeObjectRelease();
  if (!v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFDE8);
    swift_allocObject();
    uint64_t v10 = sub_25C9B7D80();
    uint64_t v11 = *(void *)(*MEMORY[0x263F8EA20] + v6 + 8);
    uint64_t v12 = swift_allocObject();
    swift_weakInit();
    uint64_t v13 = *(void *)(a2 + 8);
    objc_super v14 = *(void (**)(uint64_t, uint64_t (*)(), uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 24);
    uint64_t v15 = type metadata accessor for SettingsDiffer();
    swift_retain();
    v14(v3, sub_25C995A30, v12, v15, v11, v13);
    swift_release_n();
    swift_beginAccess();
    swift_retain();
    uint64_t v16 = swift_retain();
    sub_25C9951BC(v16, (uint64_t)a1);
    swift_endAccess();
    swift_release();
  }
  return v10;
}

uint64_t sub_25C998998()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_25C9B7D70();
    return swift_release();
  }
  return result;
}

void sub_25C9989F0(uint64_t a1, uint64_t a2, void *a3)
{
  v7[1] = *(id *)MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v4 = v3;
    sub_25C992830();
    id v6 = a3;
    v7[0] = (id)sub_25C9B83D0();
    objc_msgSend(v4, sel_inspectDiff_withContext_, v6, v7);
  }
}

id sub_25C998B5C()
{
  uint64_t v1 = OBJC_IVAR____TtC15SiriInteractive14SettingsDiffer_subjects;
  uint64_t v2 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFFA0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFDE8);
  *(void *)&v0[v1] = sub_25C9B80F0();

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for SettingsDiffer();
  return objc_msgSendSuper2(&v4, sel_init);
}

id sub_25C998C14()
{
  return sub_25C998DC4(type metadata accessor for SettingsDiffer);
}

uint64_t type metadata accessor for SettingsDiffer()
{
  return self;
}

void sub_25C998C60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  v9[4] = sub_25C998E60;
  v9[5] = v7;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_25C99FC18;
  v9[3] = &block_descriptor_1;
  uint64_t v8 = _Block_copy(v9);
  sub_25C998EA8(a2);
  swift_release();
  objc_msgSend(v3, sel_observeOtherSetting_withBlock_, a1, v8);
  _Block_release(v8);
}

id sub_25C998D54()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SnippetSceneClientSettingsDiffInspector();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_25C998DAC()
{
  return sub_25C998DC4(type metadata accessor for SnippetSceneClientSettingsDiffInspector);
}

id sub_25C998DC4(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for SnippetSceneClientSettingsDiffInspector()
{
  return self;
}

uint64_t sub_25C998E20()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_25C998E60()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 16);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_25C998EA8(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_25C998EB8()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t static SceneClientSettingScopes.SnippetSceneSettings.BackgroundTintColorKey.keyIndex.getter()
{
  return qword_26A5DFFA8;
}

uint64_t static SceneClientSettingScopes.SnippetSceneSettings.BackgroundTintColorKey.keyIndex.setter()
{
  OUTLINED_FUNCTION_7_2();
  uint64_t result = OUTLINED_FUNCTION_1_5();
  qword_26A5DFFA8 = v0;
  return result;
}

uint64_t (*static SceneClientSettingScopes.SnippetSceneSettings.BackgroundTintColorKey.keyIndex.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static SceneClientSettingScopes.SnippetSceneSettings.BackgroundTintColorKey.keyDescription.getter()
{
  return OUTLINED_FUNCTION_6_2((uint64_t *)&unk_26A5DFFB0);
}

uint64_t static SceneClientSettingScopes.SnippetSceneSettings.BackgroundTintColorKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return OUTLINED_FUNCTION_5_2(a1, a2, qword_26A5DFFB0);
}

uint64_t (*static SceneClientSettingScopes.SnippetSceneSettings.BackgroundTintColorKey.keyDescription.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static SceneClientSettingScopes.SnippetSceneSettings.TextColorKey.keyIndex.getter()
{
  return qword_26A5DFFC0;
}

uint64_t static SceneClientSettingScopes.SnippetSceneSettings.TextColorKey.keyIndex.setter()
{
  OUTLINED_FUNCTION_7_2();
  uint64_t result = OUTLINED_FUNCTION_1_5();
  qword_26A5DFFC0 = v0;
  return result;
}

uint64_t (*static SceneClientSettingScopes.SnippetSceneSettings.TextColorKey.keyIndex.modify())()
{
  return j_j__swift_endAccess;
}

void sub_25C9990AC()
{
  qword_26A5DFFC8 = 0x6F6C6F4374786574;
  unk_26A5DFFD0 = 0xE900000000000072;
}

uint64_t static SceneClientSettingScopes.SnippetSceneSettings.TextColorKey.keyDescription.getter()
{
  return sub_25C99944C(&qword_26A5DF6A0, &qword_26A5DFFC8);
}

uint64_t static SceneClientSettingScopes.SnippetSceneSettings.TextColorKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_25C9994E4(a1, a2, &qword_26A5DF6A0, &qword_26A5DFFC8, &qword_26A5DFFD0);
}

uint64_t (*static SceneClientSettingScopes.SnippetSceneSettings.TextColorKey.keyDescription.modify())()
{
  if (qword_26A5DF6A0 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_5();
  return j_j__swift_endAccess;
}

uint64_t static SceneClientSettingScopes.SnippetSceneSettings.ViewModelDataKey.keyIndex.getter()
{
  return qword_26A5DFFD8;
}

uint64_t static SceneClientSettingScopes.SnippetSceneSettings.ViewModelDataKey.keyIndex.setter()
{
  OUTLINED_FUNCTION_7_2();
  uint64_t result = OUTLINED_FUNCTION_1_5();
  qword_26A5DFFD8 = v0;
  return result;
}

uint64_t (*static SceneClientSettingScopes.SnippetSceneSettings.ViewModelDataKey.keyIndex.modify())()
{
  return j_j__swift_endAccess;
}

void sub_25C99924C()
{
  *(_WORD *)&algn_26A5DFFE8[6] = -4864;
}

uint64_t static SceneClientSettingScopes.SnippetSceneSettings.ViewModelDataKey.keyDescription.getter()
{
  return sub_25C99944C(&qword_26A5DF6A8, &qword_26A5DFFE0);
}

uint64_t static SceneClientSettingScopes.SnippetSceneSettings.ViewModelDataKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_25C9994E4(a1, a2, &qword_26A5DF6A8, &qword_26A5DFFE0, algn_26A5DFFE8);
}

uint64_t (*static SceneClientSettingScopes.SnippetSceneSettings.ViewModelDataKey.keyDescription.modify())()
{
  if (qword_26A5DF6A8 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_5();
  return j_j__swift_endAccess;
}

uint64_t static SceneClientSettingScopes.SnippetSceneSettings.ResolvedMetricsKey.keyIndex.getter()
{
  return qword_26A5DFFF0;
}

uint64_t static SceneClientSettingScopes.SnippetSceneSettings.ResolvedMetricsKey.keyIndex.setter()
{
  OUTLINED_FUNCTION_7_2();
  uint64_t result = OUTLINED_FUNCTION_1_5();
  qword_26A5DFFF0 = v0;
  return result;
}

uint64_t (*static SceneClientSettingScopes.SnippetSceneSettings.ResolvedMetricsKey.keyIndex.modify())()
{
  return j_j__swift_endAccess;
}

void sub_25C9993F4()
{
  qword_26A5DFFF8 = 0x6465766C6F736572;
  unk_26A5E0000 = 0xEF7363697274654DLL;
}

uint64_t static SceneClientSettingScopes.SnippetSceneSettings.ResolvedMetricsKey.keyDescription.getter()
{
  return sub_25C99944C(&qword_26A5DF6B0, &qword_26A5DFFF8);
}

uint64_t sub_25C99944C(void *a1, uint64_t *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t static SceneClientSettingScopes.SnippetSceneSettings.ResolvedMetricsKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_25C9994E4(a1, a2, &qword_26A5DF6B0, &qword_26A5DFFF8, &qword_26A5E0000);
}

uint64_t sub_25C9994E4(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  if (*a3 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_1_5();
  *a4 = a1;
  *a5 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static SceneClientSettingScopes.SnippetSceneSettings.ResolvedMetricsKey.keyDescription.modify())()
{
  if (qword_26A5DF6B0 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_5();
  return j_j__swift_endAccess;
}

uint64_t static SceneClientSettingScopes.SnippetSceneSettings.SnippetSceneHostTouchRestrictedRectsKey.keyIndex.getter()
{
  return qword_26A5E0008;
}

uint64_t static SceneClientSettingScopes.SnippetSceneSettings.SnippetSceneHostTouchRestrictedRectsKey.keyIndex.setter()
{
  OUTLINED_FUNCTION_7_2();
  uint64_t result = OUTLINED_FUNCTION_1_5();
  qword_26A5E0008 = v0;
  return result;
}

uint64_t (*static SceneClientSettingScopes.SnippetSceneSettings.SnippetSceneHostTouchRestrictedRectsKey.keyIndex.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static SceneClientSettingScopes.SnippetSceneSettings.SnippetSceneHostTouchRestrictedRectsKey.keyDescription.getter()
{
  return OUTLINED_FUNCTION_6_2((uint64_t *)&unk_26A5E0010);
}

uint64_t sub_25C999684(uint64_t *a1)
{
  swift_beginAccess();
  uint64_t v2 = *a1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t static SceneClientSettingScopes.SnippetSceneSettings.SnippetSceneHostTouchRestrictedRectsKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return OUTLINED_FUNCTION_5_2(a1, a2, qword_26A5E0010);
}

uint64_t sub_25C9996E4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  *a3 = a1;
  *a4 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static SceneClientSettingScopes.SnippetSceneSettings.SnippetSceneHostTouchRestrictedRectsKey.keyDescription.modify())()
{
  return j__swift_endAccess;
}

unint64_t sub_25C9997A8()
{
  unint64_t result = qword_26A5E0020;
  if (!qword_26A5E0020)
  {
    sub_25C9950BC(255, &qword_26A5E0028);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E0020);
  }
  return result;
}

unint64_t sub_25C99980C()
{
  return sub_25C999854();
}

unint64_t sub_25C999854()
{
  OUTLINED_FUNCTION_12();
  unint64_t result = *v2;
  if (!result)
  {
    v1(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v0);
  }
  return result;
}

unint64_t sub_25C99989C()
{
  unint64_t result = qword_26A5E0038;
  if (!qword_26A5E0038)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5E0040);
    sub_25C999854();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E0038);
  }
  return result;
}

void type metadata accessor for SceneClientSettingScopes()
{
}

void type metadata accessor for SceneClientSettingScopes.SnippetSceneSettings()
{
}

void type metadata accessor for SceneClientSettingScopes.SnippetSceneSettings.BackgroundTintColorKey()
{
}

void type metadata accessor for SceneClientSettingScopes.SnippetSceneSettings.TextColorKey()
{
}

void type metadata accessor for SceneClientSettingScopes.SnippetSceneSettings.ViewModelDataKey()
{
}

void type metadata accessor for SceneClientSettingScopes.SnippetSceneSettings.ResolvedMetricsKey()
{
}

void type metadata accessor for SceneClientSettingScopes.SnippetSceneSettings.SnippetSceneHostTouchRestrictedRectsKey()
{
}

uint64_t sub_25C999994@<X0>(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  if (AssociatedTypeWitness != sub_25C9950BC(0, &qword_26A5E0028))
  {
    if (objc_msgSend(a1, sel_objectForSetting_, (*(uint64_t (**)(uint64_t))(*(void *)(a3 + 8) + 16))(a2)))
    {
      sub_25C9B8410();
      swift_unknownObjectRelease();
      sub_25C992214(v16, &v17);
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
    }
    uint64_t v9 = (uint64_t *)&unk_26A5DFCD0;
    goto LABEL_8;
  }
  if (objc_msgSend(a1, sel_objectForSetting_, (*(uint64_t (**)(uint64_t))(*(void *)(a3 + 8) + 16))(a2)))
  {
    sub_25C9B8410();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v16, 0, sizeof(v16));
  }
  sub_25C98EDF8((uint64_t)v16, (uint64_t)&v17);
  if (!*((void *)&v18 + 1))
  {
    sub_25C98D484((uint64_t)&v17);
    goto LABEL_14;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_14:
    uint64_t v11 = a4;
    uint64_t v10 = 1;
    return __swift_storeEnumTagSinglePayload(v11, v10, 1, AssociatedTypeWitness);
  }
  sub_25C9950BC(0, &qword_26A5E0050);
  uint64_t v13 = sub_25C9B82E0();
  sub_25C98EE60(v14, v15);
  *(void *)&long long v17 = v13;
  uint64_t v9 = (uint64_t *)&unk_26A5E0058;
LABEL_8:
  __swift_instantiateConcreteTypeFromMangledName(v9);
  uint64_t v10 = swift_dynamicCast() ^ 1;
  uint64_t v11 = a4;
  return __swift_storeEnumTagSinglePayload(v11, v10, 1, AssociatedTypeWitness);
}

void sub_25C999BD8(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
}

void sub_25C999C1C(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  id v7 = objc_msgSend(v3, sel_otherSettings);
  sub_25C999994(v7, a1, a2, a3);
}

id sub_25C999D38()
{
  return sub_25C999FB0(type metadata accessor for SnippetSceneClientSettings);
}

uint64_t type metadata accessor for SnippetSceneClientSettings()
{
  return self;
}

void sub_25C999D74(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
}

void sub_25C999D98(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
}

id sub_25C999DC0@<X0>(uint64_t (*a1)(void)@<X1>, void *a2@<X8>)
{
  objc_super v4 = (objc_class *)a1();
  id result = objc_msgSend(objc_allocWithZone(v4), sel_initWithSettings_, v2);
  a2[3] = v4;
  *a2 = result;
  return result;
}

uint64_t sub_25C999E28(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  id v5 = a1;
  sub_25C999DC0(a4, v8);

  __swift_project_boxed_opaque_existential_0(v8, v8[3]);
  uint64_t v6 = sub_25C9B85E0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v6;
}

id sub_25C999E90(void *a1, uint64_t (*a2)(void))
{
  v6.receiver = v2;
  v6.super_class = (Class)a2();
  id v4 = objc_msgSendSuper2(&v6, sel_initWithSettings_, a1);

  return v4;
}

id sub_25C999F28(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_init);
}

id sub_25C999F98()
{
  return sub_25C999FB0(type metadata accessor for SnippetSceneMutableClientSettings);
}

id sub_25C999FB0(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for SnippetSceneMutableClientSettings()
{
  return self;
}

_UNKNOWN **sub_25C99A00C()
{
  return &protocol witness table for SceneClientSettingScopes.SnippetSceneSettings;
}

uint64_t OUTLINED_FUNCTION_0_5()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_5_2(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_25C9996E4(a1, a2, a3, a3 + 1);
}

uint64_t OUTLINED_FUNCTION_6_2(uint64_t *a1)
{
  return sub_25C999684(a1);
}

uint64_t SnippetHostingView.init(bundleIdentifier:viewModel:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void *a8@<X8>)
{
  *a8 = a1;
  a8[1] = a2;
  v12[0] = a4;
  v12[1] = a5;
  v12[2] = a6;
  v12[3] = a7;
  uint64_t v9 = (char *)a8 + *(int *)(type metadata accessor for SnippetHostingView(0, (uint64_t)v12) + 52);
  uint64_t v10 = sub_25C9B8090();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9, a3, v10);
}

uint64_t type metadata accessor for SnippetHostingView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for SnippetHostingView);
}

uint64_t SnippetHostingView.body.getter@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  unint64_t v36 = a2;
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v5 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v6 = OUTLINED_FUNCTION_2_5();
  v34[0] = type metadata accessor for _SnippetHostingView(v6, v7);
  uint64_t v8 = OUTLINED_FUNCTION_2_5();
  v34[1] = type metadata accessor for SnippetHostView(v8, v9);
  v34[2] = sub_25C9B7F40();
  uint64_t v10 = sub_25C9B8050();
  OUTLINED_FUNCTION_0_2();
  uint64_t v35 = v11;
  MEMORY[0x270FA5388](v12, v13);
  unint64_t v15 = (char *)v34 - v14;
  uint64_t v16 = sub_25C9B7EC0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v18 = v17;
  uint64_t v21 = MEMORY[0x270FA5388](v19, v20);
  unint64_t v23 = (char *)v34 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21, v24);
  char v26 = (char *)v34 - v25;
  uint64_t v37 = v2;
  uint64_t v38 = v3;
  uint64_t v39 = v5;
  uint64_t v40 = v4;
  uint64_t v41 = v34[3];
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v28 = swift_getWitnessTable();
  uint64_t v45 = WitnessTable;
  uint64_t v46 = v28;
  uint64_t v29 = swift_getWitnessTable();
  sub_25C9B8040();
  uint64_t v44 = v29;
  uint64_t v30 = swift_getWitnessTable();
  sub_25C9B8030();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v15, v10);
  uint64_t v42 = v30;
  uint64_t v43 = MEMORY[0x263F190E0];
  swift_getWitnessTable();
  int64_t v31 = *(void (**)(char *, char *, uint64_t))(v18 + 16);
  v31(v26, v23, v16);
  uint64_t v32 = *(void (**)(char *, uint64_t))(v18 + 8);
  v32(v23, v16);
  v31(v36, v26, v16);
  return ((uint64_t (*)(char *, uint64_t))v32)(v26, v16);
}

uint64_t sub_25C99A41C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, ValueMetadata *a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v73 = a6;
  uint64_t v76 = a2;
  uint64_t v77 = a3;
  uint64_t v78 = a4;
  v79 = a5;
  uint64_t v11 = type metadata accessor for SnippetHostView(0, (uint64_t)&v76);
  uint64_t v61 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11, v12);
  unint64_t v15 = (char *)&v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13, v16);
  uint64_t v60 = (char *)&v60 - v17;
  uint64_t v66 = sub_25C9B8090();
  uint64_t v63 = *(char **)(v66 - 8);
  MEMORY[0x270FA5388](v66, v18);
  uint64_t v65 = (char *)&v60 - v19;
  uint64_t v76 = a2;
  uint64_t v77 = a3;
  uint64_t v67 = a3;
  uint64_t v68 = a4;
  uint64_t v78 = a4;
  v79 = a5;
  id v69 = a5;
  uint64_t v20 = type metadata accessor for _SnippetHostingView(0, (uint64_t)&v76);
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v20, v22);
  uint64_t v25 = (char *)&v60 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23, v26);
  uint64_t v28 = (char *)&v60 - v27;
  uint64_t v64 = v11;
  uint64_t v29 = sub_25C9B7F40();
  uint64_t v71 = *(void *)(v29 - 8);
  uint64_t v72 = v29;
  MEMORY[0x270FA5388](v29, v30);
  objc_super v70 = (char *)&v60 - v31;
  v79 = &type metadata for Feature;
  unint64_t v80 = sub_25C98CB98();
  char v32 = sub_25C9B7C60();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v76);
  uint64_t v33 = a1[1];
  uint64_t v62 = *a1;
  id v34 = a1;
  uint64_t v35 = (void (**)(char *, char *, uint64_t))(v63 + 16);
  if (v32)
  {
    uint64_t v63 = v28;
    uint64_t v36 = v67;
    uint64_t v37 = v68;
    uint64_t v76 = a2;
    uint64_t v77 = v67;
    uint64_t v38 = (uint64_t)v69;
    uint64_t v78 = v68;
    v79 = v69;
    uint64_t v39 = (char *)v34 + *(int *)(type metadata accessor for SnippetHostingView(0, (uint64_t)&v76) + 52);
    uint64_t v40 = (uint64_t)v65;
    (*v35)(v65, v39, v66);
    sub_25C9A3260(v62, v33, v40, a2, v36, v37, v38, v25);
    swift_getWitnessTable();
    uint64_t v41 = *(void (**)(char *, char *, uint64_t))(v21 + 16);
    uint64_t v42 = v63;
    v41(v63, v25, v20);
    uint64_t v43 = *(void (**)(char *, uint64_t))(v21 + 8);
    swift_bridgeObjectRetain();
    v43(v25, v20);
    v41(v25, v42, v20);
    swift_getWitnessTable();
    uint64_t v44 = v70;
    sub_25C99AA4C((uint64_t)v25, v20);
    v43(v25, v20);
    v43(v42, v20);
  }
  else
  {
    uint64_t v45 = v67;
    uint64_t v46 = v68;
    uint64_t v76 = a2;
    uint64_t v77 = v67;
    uint64_t v47 = (uint64_t)v69;
    uint64_t v78 = v68;
    v79 = v69;
    uint64_t v48 = type metadata accessor for SnippetHostingView(0, (uint64_t)&v76);
    uint64_t v49 = (uint64_t)v65;
    (*v35)(v65, (char *)v34 + *(int *)(v48 + 52), v66);
    sub_25C9A1504(v62, v33, v49, a2, v45, v46, v47, v15);
    uint64_t v50 = v64;
    swift_getWitnessTable();
    uint64_t v51 = v60;
    uint64_t v52 = v61;
    uint64_t v53 = *(void (**)(char *, char *, uint64_t))(v61 + 16);
    v53(v60, v15, v50);
    uint64_t v54 = *(void (**)(char *, uint64_t))(v52 + 8);
    swift_bridgeObjectRetain();
    v54(v15, v50);
    v53(v15, v51, v50);
    swift_getWitnessTable();
    uint64_t v44 = v70;
    sub_25C99AB44((uint64_t)v15, v20, v50);
    v54(v15, v50);
    v54(v51, v50);
  }
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v56 = swift_getWitnessTable();
  uint64_t v74 = WitnessTable;
  uint64_t v75 = v56;
  uint64_t v57 = v72;
  swift_getWitnessTable();
  uint64_t v58 = v71;
  (*(void (**)(uint64_t, char *, uint64_t))(v71 + 16))(v73, v44, v57);
  return (*(uint64_t (**)(char *, uint64_t))(v58 + 8))(v44, v57);
}

uint64_t sub_25C99AA3C@<X0>(uint64_t a1@<X8>)
{
  return sub_25C99A41C(*(uint64_t **)(v1 + 48), *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(ValueMetadata **)(v1 + 40), a1);
}

uint64_t sub_25C99AA4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C9B7F20();
  MEMORY[0x270FA5388](v4, v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v8 - v6, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_25C9B7F30();
}

uint64_t sub_25C99AB44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_25C9B7F20();
  MEMORY[0x270FA5388](v5, v6);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v9 - v7, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_25C9B7F30();
}

uint64_t sub_25C99AC3C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25C99AC88()
{
  return sub_25C9B8010();
}

uint64_t sub_25C99ACA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

uint64_t sub_25C99ACB0()
{
  uint64_t result = sub_25C9B8090();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_25C99AD4C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  int v6 = *(_DWORD *)(v5 + 80);
  uint64_t v7 = v6;
  unint64_t v8 = v6 & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = v8 & (v6 + 16);
  int v10 = v6 & 0x100000;
  if (v7 > 7 || v10 != 0 || ((v7 + 16) & (unint64_t)~v7) + *(void *)(v5 + 64) + v9 > 0x18)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + v9);
    swift_retain();
  }
  else
  {
    uint64_t v14 = a2[1];
    *a1 = *a2;
    a1[1] = v14;
    unint64_t v15 = (void *)(v8 & ((unint64_t)a1 + 23));
    uint64_t v16 = (void *)(v8 & ((unint64_t)a2 + 23));
    *unint64_t v15 = *v16;
    uint64_t v17 = ~v7;
    uint64_t v18 = (void *)(((unint64_t)v15 + 15) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v19 = (void *)(((unint64_t)v16 + 15) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v18 = *v19;
    uint64_t v20 = v7 + 8;
    unint64_t v21 = ((unint64_t)v18 + v20) & v17;
    unint64_t v22 = ((unint64_t)v19 + v20) & v17;
    uint64_t v23 = *(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    v23(v21, v22, v4);
  }
  return a1;
}

uint64_t sub_25C99AE94(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(v4 - 8);
  uint64_t v5 = *(unsigned __int8 *)(v8 + 80);
  swift_release();
  swift_release();
  int v6 = *(uint64_t (**)(unint64_t, uint64_t))(v8 + 8);
  return v6((v5 + ((((a1 + (v5 | 7) + 16) & ~(v5 | 7)) + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v5, v4);
}

void *sub_25C99AF58(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a3 + 16);
  int v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v8 = (v7 | 7) + 16;
  unint64_t v9 = (unint64_t)a1 + v8;
  int v10 = (void *)(((unint64_t)a2 + v8) & ~(v7 | 7));
  uint64_t v11 = (void *)(v9 & ~(v7 | 7));
  *uint64_t v11 = *v10;
  uint64_t v12 = (void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v13 = (void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v12 = *v13;
  uint64_t v14 = ((unint64_t)v12 + v7 + 8) & ~v7;
  uint64_t v15 = ((unint64_t)v13 + v7 + 8) & ~v7;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  v6(v14, v15, v5);
  return a1;
}

void *sub_25C99B030(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v8 | 7) + 16;
  int v10 = (void *)(((unint64_t)a1 + v9) & ~(v8 | 7));
  uint64_t v11 = (void *)(((unint64_t)a2 + v9) & ~(v8 | 7));
  void *v10 = *v11;
  swift_retain();
  swift_release();
  uint64_t v12 = (void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v13 = (void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v12 = *v13;
  swift_retain();
  swift_release();
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 24))(((unint64_t)v12 + v8 + 8) & ~v8, ((unint64_t)v13 + v8 + 8) & ~v8, v6);
  return a1;
}

_OWORD *sub_25C99B140(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(void (**)(unint64_t, unint64_t))(v4 + 32);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = (v6 | 7) + 16;
  unint64_t v8 = (unint64_t)a1 + v7;
  uint64_t v9 = (void *)(((unint64_t)a2 + v7) & ~(v6 | 7));
  int v10 = (void *)(v8 & ~(v6 | 7));
  void *v10 = *v9;
  uint64_t v11 = (void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v12 = (void *)(((unint64_t)v9 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v11 = *v12;
  v5(((unint64_t)v11 + v6 + 8) & ~v6, ((unint64_t)v12 + v6 + 8) & ~v6);
  return a1;
}

void *sub_25C99B1E0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = (v9 | 7) + 16;
  uint64_t v11 = (void *)(((unint64_t)a1 + v10) & ~(v9 | 7));
  uint64_t v12 = (void *)(((unint64_t)a2 + v10) & ~(v9 | 7));
  *uint64_t v11 = *v12;
  swift_release();
  uint64_t v13 = (void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = (void *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v13 = *v14;
  swift_release();
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 40))(((unint64_t)v13 + v9 + 8) & ~v9, ((unint64_t)v14 + v9 + 8) & ~v9, v7);
  return a1;
}

uint64_t sub_25C99B2C8(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  if (v6 <= 0x7FFFFFFF) {
    int v7 = 0x7FFFFFFF;
  }
  else {
    int v7 = *(_DWORD *)(v5 + 84);
  }
  uint64_t v8 = *(unsigned __int8 *)(v5 + 80);
  if ((int)v6 >= 0) {
    unsigned int v9 = 0x7FFFFFFF;
  }
  else {
    unsigned int v9 = v7;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v10 = v8 | 7;
  int v11 = a2 - v9;
  if (a2 <= v9) {
    goto LABEL_26;
  }
  uint64_t v12 = ((v8 + 16) & ~v8) + *(void *)(*(void *)(v4 - 8) + 64) + ((v8 + 16) & ~v10);
  char v13 = 8 * v12;
  if (v12 <= 3)
  {
    unsigned int v16 = ((v11 + ~(-1 << v13)) >> v13) + 1;
    if (HIWORD(v16))
    {
      int v14 = *(_DWORD *)((char *)a1 + v12);
      if (!v14) {
        goto LABEL_26;
      }
      goto LABEL_18;
    }
    if (v16 > 0xFF)
    {
      int v14 = *(unsigned __int16 *)((char *)a1 + v12);
      if (!*(unsigned __int16 *)((char *)a1 + v12)) {
        goto LABEL_26;
      }
      goto LABEL_18;
    }
    if (v16 < 2)
    {
LABEL_26:
      if (v9 != 0x7FFFFFFF) {
        return __swift_getEnumTagSinglePayload((v8 + (((((unint64_t)a1 + v10 + 16) & ~v10) + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v8, v6, v4);
      }
      unint64_t v18 = *((void *)a1 + 1);
      if (v18 >= 0xFFFFFFFF) {
        LODWORD(v18) = -1;
      }
      return (v18 + 1);
    }
  }
  int v14 = *((unsigned __int8 *)a1 + v12);
  if (!*((unsigned char *)a1 + v12)) {
    goto LABEL_26;
  }
LABEL_18:
  int v17 = (v14 - 1) << v13;
  if (v12 > 3) {
    int v17 = 0;
  }
  if (v12)
  {
    if (v12 > 3) {
      LODWORD(v12) = 4;
    }
    switch((int)v12)
    {
      case 2:
        LODWORD(v12) = *a1;
        break;
      case 3:
        LODWORD(v12) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v12) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v12) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v9 + (v12 | v17) + 1;
}

void sub_25C99B48C(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  if (v8 <= 0x7FFFFFFF) {
    unsigned int v9 = 0x7FFFFFFF;
  }
  else {
    unsigned int v9 = *(_DWORD *)(v7 + 84);
  }
  if ((int)v8 >= 0) {
    unsigned int v9 = 0x7FFFFFFF;
  }
  uint64_t v10 = *(unsigned __int8 *)(v7 + 80);
  size_t v11 = ((v10 + 16) & ~v10) + *(void *)(*(void *)(v6 - 8) + 64) + ((v10 + 16) & ~(v10 | 7));
  char v12 = 8 * v11;
  BOOL v13 = a3 >= v9;
  unsigned int v14 = a3 - v9;
  if (v14 != 0 && v13)
  {
    if (v11 <= 3)
    {
      unsigned int v18 = ((v14 + ~(-1 << v12)) >> v12) + 1;
      if (HIWORD(v18))
      {
        int v15 = 4;
      }
      else if (v18 >= 0x100)
      {
        int v15 = 2;
      }
      else
      {
        int v15 = v18 > 1;
      }
    }
    else
    {
      int v15 = 1;
    }
  }
  else
  {
    int v15 = 0;
  }
  if (v9 < a2)
  {
    unsigned int v16 = ~v9 + a2;
    if (v11 < 4)
    {
      int v17 = (v16 >> v12) + 1;
      if (v11)
      {
        int v19 = v16 & ~(-1 << v12);
        bzero(a1, v11);
        if (v11 == 3)
        {
          *(_WORD *)a1 = v19;
          a1[2] = BYTE2(v19);
        }
        else if (v11 == 2)
        {
          *(_WORD *)a1 = v19;
        }
        else
        {
          *a1 = v19;
        }
      }
    }
    else
    {
      bzero(a1, v11);
      *(_DWORD *)a1 = v16;
      int v17 = 1;
    }
    switch(v15)
    {
      case 1:
        a1[v11] = v17;
        return;
      case 2:
        *(_WORD *)&a1[v11] = v17;
        return;
      case 3:
        goto LABEL_43;
      case 4:
        *(_DWORD *)&a1[v11] = v17;
        return;
      default:
        return;
    }
  }
  switch(v15)
  {
    case 1:
      a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_26;
    case 2:
      *(_WORD *)&a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_26;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x25C99B70CLL);
    case 4:
      *(_DWORD *)&a1[v11] = 0;
      goto LABEL_25;
    default:
LABEL_25:
      if (a2)
      {
LABEL_26:
        if (v9 == 0x7FFFFFFF)
        {
          if ((a2 & 0x80000000) != 0)
          {
            *(void *)a1 = a2 ^ 0x80000000;
            *((void *)a1 + 1) = 0;
          }
          else
          {
            *((void *)a1 + 1) = (a2 - 1);
          }
        }
        else
        {
          unint64_t v20 = (v10 + ((((unint64_t)&a1[(v10 | 7) + 16] & ~(v10 | 7)) + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v10;
          __swift_storeEnumTagSinglePayload(v20, a2, v8, v6);
        }
      }
      return;
  }
}

uint64_t sub_25C99B734()
{
  uint64_t v0 = OUTLINED_FUNCTION_1_6();
  type metadata accessor for _SnippetHostingView(v0, v1);
  uint64_t v2 = OUTLINED_FUNCTION_1_6();
  type metadata accessor for SnippetHostView(v2, v3);
  sub_25C9B7F40();
  sub_25C9B8050();
  sub_25C9B7EC0();
  swift_getWitnessTable();
  swift_getWitnessTable();
  swift_getWitnessTable();
  swift_getWitnessTable();
  return swift_getWitnessTable();
}

uint64_t OUTLINED_FUNCTION_1_6()
{
  return 255;
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  *(void *)(v4 - 120) = v0;
  *(void *)(v4 - 112) = v2;
  *(void *)(v4 - 104) = v3;
  *(void *)(v4 - 96) = v1;
  return 255;
}

uint64_t sub_25C99B89C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = 0;
  *(void *)(v5 + 24) = 0;
  *(unsigned char *)(v5 + 80) = 1;
  *(void *)(v5 + 88) = 0;
  *(void *)(v5 + 32) = a1;
  *(void *)(v5 + 40) = a2;
  *(void *)(v5 + 48) = a3;
  *(void *)(v5 + 56) = a4;
  *(void *)(v5 + 64) = a5;
  *(void *)(v5 + 72) = 0;
  return v5;
}

id *sub_25C99B8C0()
{
  sub_25C99C1F0();

  swift_bridgeObjectRelease();
  swift_release();

  return v0;
}

uint64_t sub_25C99B904()
{
  sub_25C99B8C0();
  return MEMORY[0x270FA0228](v0, 96, 7);
}

uint64_t type metadata accessor for BackOffTimer()
{
  return self;
}

void sub_25C99B95C()
{
  uint64_t v1 = (double *)v0;
  if (*(void *)(v0 + 16))
  {
    if (qword_26A5DF6C8 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_25C9B7C90();
    __swift_project_value_buffer(v2, (uint64_t)qword_26A5E0118);
    swift_retain();
    uint64_t v3 = sub_25C9B7C70();
    os_log_type_t v4 = sub_25C9B82D0();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v5 = 136315138;
      uint64_t v6 = *((void *)v1 + 4);
      unint64_t v7 = *((void *)v1 + 5);
      swift_bridgeObjectRetain();
      uint64_t v35 = sub_25C99F02C(v6, v7, aBlock);
      sub_25C9B83F0();
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v8 = "[%s] Back off timer is already on";
      unsigned int v9 = v3;
      os_log_type_t v10 = v4;
      size_t v11 = v5;
      uint32_t v12 = 12;
LABEL_20:
      _os_log_impl(&dword_25C989000, v9, v10, v8, v11, v12);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0_6();
      OUTLINED_FUNCTION_0_6();

      return;
    }

    swift_release();
  }
  else
  {
    objc_msgSend(*(id *)(v0 + 88), sel_invalidate);
    BOOL v13 = *(void **)(v0 + 88);
    *(void *)(v0 + 88) = 0;

    if (qword_26A5DF6C8 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_25C9B7C90();
    __swift_project_value_buffer(v14, (uint64_t)qword_26A5E0118);
    swift_retain();
    int v15 = sub_25C9B7C70();
    os_log_type_t v16 = sub_25C9B82D0();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 136315394;
      uint64_t v18 = *((void *)v1 + 4);
      unint64_t v19 = *((void *)v1 + 5);
      swift_bridgeObjectRetain();
      uint64_t v35 = sub_25C99F02C(v18, v19, aBlock);
      sub_25C9B83F0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2048;
      uint64_t v35 = *((void *)v1 + 3);
      sub_25C9B83F0();
      swift_release();
      _os_log_impl(&dword_25C989000, v15, v16, "[%s] scheduling new backoff with base interval: %f.", (uint8_t *)v17, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0_6();
      OUTLINED_FUNCTION_0_6();
    }
    else
    {

      swift_release();
    }
    sub_25C99C3A4();
    id v20 = sub_25C99BEF8();
    unint64_t v21 = (void *)*((void *)v1 + 2);
    *((void *)v1 + 2) = v20;

    double v22 = v1[3];
    if (v22 >= 0.1) {
      double v23 = v22 + v22;
    }
    else {
      double v23 = 0.1;
    }
    double v24 = fmin(v23, 120.0);
    v1[3] = v24;
    uint64_t v25 = (void *)*((void *)v1 + 2);
    if (v25)
    {
      uint64_t v26 = *((void *)v1 + 6);
      uint64_t v27 = swift_allocObject();
      swift_weakInit();
      aBlock[4] = (uint64_t)sub_25C99C634;
      aBlock[5] = v27;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_25C99C188;
      aBlock[3] = (uint64_t)&block_descriptor_17;
      uint64_t v28 = _Block_copy(aBlock);
      id v29 = v25;
      swift_release();
      objc_msgSend(v29, sel_scheduleWithFireInterval_leewayInterval_queue_handler_, v26, v28, v24, 0.0);
      _Block_release(v28);

      swift_retain();
      uint64_t v3 = sub_25C9B7C70();
      os_log_type_t v30 = sub_25C9B82D0();
      if (os_log_type_enabled(v3, v30))
      {
        uint64_t v31 = swift_slowAlloc();
        aBlock[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v31 = 136315394;
        uint64_t v32 = *((void *)v1 + 4);
        unint64_t v33 = *((void *)v1 + 5);
        swift_bridgeObjectRetain();
        uint64_t v35 = sub_25C99F02C(v32, v33, aBlock);
        sub_25C9B83F0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v31 + 12) = 2048;
        uint64_t v35 = *((void *)v1 + 3);
        sub_25C9B83F0();
        swift_release();
        uint64_t v8 = "[%s] Back off timer is scheduled with fire interval: %f";
        unsigned int v9 = v3;
        os_log_type_t v10 = v30;
        size_t v11 = (uint8_t *)v31;
        uint32_t v12 = 22;
        goto LABEL_20;
      }

      swift_release();
    }
    else
    {
      __break(1u);
    }
  }
}

id sub_25C99BEF8()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_25C9B8140();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithIdentifier_, v1);

  return v2;
}

uint64_t sub_25C99BF6C(void *a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v3 = (void *)result;
    if (qword_26A5DF6C8 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_25C9B7C90();
    __swift_project_value_buffer(v4, (uint64_t)qword_26A5E0118);
    swift_retain();
    uint64_t v5 = sub_25C9B7C70();
    os_log_type_t v6 = sub_25C9B82D0();
    if (os_log_type_enabled(v5, v6))
    {
      unint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v14 = v8;
      *(_DWORD *)unint64_t v7 = 136315138;
      uint64_t v9 = v3[4];
      unint64_t v10 = v3[5];
      swift_bridgeObjectRetain();
      sub_25C99F02C(v9, v10, &v14);
      sub_25C9B83F0();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C989000, v5, v6, "[%s] Back off timer fired", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26119A890](v8, -1, -1);
      MEMORY[0x26119A890](v7, -1, -1);
    }
    else
    {

      swift_release();
    }
    size_t v11 = (void (*)(uint64_t))v3[7];
    uint64_t v12 = swift_retain();
    v11(v12);
    swift_release();
    objc_msgSend(a1, sel_invalidate);
    BOOL v13 = (void *)v3[2];
    v3[2] = 0;

    sub_25C99C24C();
    return swift_release();
  }
  return result;
}

void sub_25C99C188(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_25C99C1F0()
{
  objc_msgSend(*(id *)(v0 + 16), sel_invalidate);
  uint64_t v1 = *(void **)(v0 + 16);
  *(void *)(v0 + 16) = 0;

  objc_msgSend(*(id *)(v0 + 88), sel_invalidate);
  id v2 = *(void **)(v0 + 88);
  *(void *)(v0 + 88) = 0;
}

void sub_25C99C24C()
{
  if ((*(unsigned char *)(v0 + 80) & 1) == 0)
  {
    double v1 = *(double *)(v0 + 72);
    objc_msgSend(*(id *)(v0 + 88), sel_invalidate);
    sub_25C99C3A4();
    swift_bridgeObjectRetain();
    id v2 = sub_25C99BEF8();
    uint64_t v3 = *(void **)(v0 + 88);
    *(void *)(v0 + 88) = v2;

    id v4 = *(void **)(v0 + 88);
    if (v4)
    {
      uint64_t v5 = *(void *)(v0 + 48);
      uint64_t v6 = swift_allocObject();
      swift_weakInit();
      v9[4] = sub_25C99C614;
      v9[5] = v6;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 1107296256;
      v9[2] = sub_25C99C188;
      v9[3] = &block_descriptor_2;
      unint64_t v7 = _Block_copy(v9);
      id v8 = v4;
      swift_release();
      objc_msgSend(v8, sel_scheduleWithFireInterval_leewayInterval_queue_handler_, v5, v7, v1, 0.0);
      _Block_release(v7);
    }
  }
}

unint64_t sub_25C99C3A4()
{
  unint64_t result = qword_26A5E00E0;
  if (!qword_26A5E00E0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A5E00E0);
  }
  return result;
}

uint64_t sub_25C99C3E4()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

void sub_25C99C41C()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    if (qword_26A5DF6C8 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_25C9B7C90();
    __swift_project_value_buffer(v2, (uint64_t)qword_26A5E0118);
    swift_retain();
    uint64_t v3 = sub_25C9B7C70();
    os_log_type_t v4 = sub_25C9B82D0();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v6 = swift_slowAlloc();
      uint64_t v10 = v6;
      *(_DWORD *)uint64_t v5 = 136315138;
      uint64_t v7 = *(void *)(v1 + 32);
      unint64_t v8 = *(void *)(v1 + 40);
      swift_bridgeObjectRetain();
      sub_25C99F02C(v7, v8, &v10);
      sub_25C9B83F0();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C989000, v3, v4, "[%s] Reset interval satiated, resetting", v5, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26119A890](v6, -1, -1);
      MEMORY[0x26119A890](v5, -1, -1);
    }
    else
    {

      swift_release();
    }
    *(void *)(v1 + 24) = 0;
    objc_msgSend(*(id *)(v1 + 88), sel_invalidate);
    uint64_t v9 = *(void **)(v1 + 88);
    *(void *)(v1 + 88) = 0;
    swift_release();
  }
}

void sub_25C99C614()
{
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_25C99C634(void *a1)
{
  return sub_25C99BF6C(a1);
}

void OUTLINED_FUNCTION_0_6()
{
  JUMPOUT(0x26119A890);
}

uint64_t sub_25C99C65C(uint64_t a1)
{
  return sub_25C99C750(a1, qword_26A5E00E8);
}

uint64_t static Logger.scene.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25C99C7EC(&qword_26A5DF6B8, (uint64_t)qword_26A5E00E8, a1);
}

uint64_t sub_25C99C69C(uint64_t a1)
{
  return sub_25C99C750(a1, qword_26A5E0100);
}

uint64_t static Logger.viewController.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25C99C7EC(&qword_26A5DF6C0, (uint64_t)qword_26A5E0100, a1);
}

uint64_t sub_25C99C6EC(uint64_t a1)
{
  return sub_25C99C750(a1, qword_26A5E0118);
}

uint64_t static Logger.processIdentity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25C99C7EC(&qword_26A5DF6C8, (uint64_t)qword_26A5E0118, a1);
}

uint64_t sub_25C99C734(uint64_t a1)
{
  return sub_25C99C750(a1, qword_26A5E0130);
}

uint64_t sub_25C99C750(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_25C9B7C90();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_25C9B7C80();
}

uint64_t static Logger.view.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25C99C7EC(&qword_26A5DF6D0, (uint64_t)qword_26A5E0130, a1);
}

uint64_t sub_25C99C7EC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_25C9B7C90();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

unint64_t static SnippetSceneCategory.subsystem.getter()
{
  return 0xD00000000000001ELL;
}

SiriInteractive::SnippetSceneCategory_optional __swiftcall SnippetSceneCategory.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_25C9B85D0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

unint64_t SnippetSceneCategory.rawValue.getter()
{
  unint64_t result = 0xD000000000000010;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x6E6F43776569765FLL;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0x776569765FLL;
      break;
    default:
      unint64_t result = 0x656E6563735FLL;
      break;
  }
  return result;
}

uint64_t sub_25C99C994(unsigned __int8 *a1, char *a2)
{
  return sub_25C9A6DF4(*a1, *a2);
}

unint64_t sub_25C99C9A4()
{
  unint64_t result = qword_26A5E0148;
  if (!qword_26A5E0148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E0148);
  }
  return result;
}

uint64_t sub_25C99C9F0()
{
  return sub_25C9A6FAC(*v0);
}

uint64_t sub_25C99C9F8(uint64_t a1)
{
  return sub_25C9A708C(a1, *v1);
}

uint64_t sub_25C99CA00(uint64_t a1)
{
  return sub_25C9A7150(a1, *v1);
}

SiriInteractive::SnippetSceneCategory_optional sub_25C99CA08(Swift::String *a1)
{
  return SnippetSceneCategory.init(rawValue:)(*a1);
}

unint64_t sub_25C99CA14@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = SnippetSceneCategory.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SnippetSceneCategory(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SnippetSceneCategory(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25C99CB9CLL);
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

uint64_t sub_25C99CBC4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25C99CBCC(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SnippetSceneCategory()
{
  return &type metadata for SnippetSceneCategory;
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

void sub_25C99CC48(uint64_t a1@<X8>)
{
}

void _SnippetClientController.sendAction(_:)(void *a1)
{
  int v2 = v1;
  long long v4 = *(_OWORD *)((*MEMORY[0x263F8EED0] & *v2) + 0x60);
  long long v12 = *(_OWORD *)((*MEMORY[0x263F8EED0] & *v2) + 0x50);
  long long v13 = v4;
  type metadata accessor for SnippetHostingAction.ClientToHost(0, (uint64_t)&v12);
  uint64_t v5 = a1[3];
  uint64_t v6 = a1[5];
  BOOL v7 = __swift_project_boxed_opaque_existential_0(a1, v5);
  *((void *)&v13 + 1) = v5;
  uint64_t v14 = v6;
  boxed_opaque_existential_2 = __swift_allocate_boxed_opaque_existential_2((uint64_t *)&v12);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v5 - 8) + 16))(boxed_opaque_existential_2, v7, v5);
  id v9 = sub_25C98E114(&v12);
  id v10 = objc_msgSend(v2, sel__hostedWindowScene);
  if (v10)
  {
    size_t v11 = v10;
    objc_msgSend(v10, sel_sendAction_, v9);
  }
}

void sub_25C99CD8C()
{
  uint64_t v1 = v0;
  if (qword_26A5DF6B8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25C9B7C90();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A5E00E8);
  id v3 = v0;
  long long v4 = sub_25C9B7C70();
  os_log_type_t v5 = sub_25C9B82D0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    BOOL v7 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 138543362;
    id v8 = v3;
    sub_25C9B83F0();
    *BOOL v7 = v1;

    _os_log_impl(&dword_25C989000, v4, v5, "[%{public}@] Client received action from Host", v6, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_6();
    OUTLINED_FUNCTION_0_6();
  }
  else
  {
  }
  id v9 = objc_msgSend(self, sel_defaultCenter);
  if (qword_26A5DF680 != -1) {
    swift_once();
  }
  uint64_t v10 = qword_26A5DFAE0;
  size_t v11 = (void *)sub_25C9B7C20();
  objc_msgSend(v9, sel_postNotificationName_object_, v10, v11);
}

void sub_25C99CFBC(void (*a1)(void)@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  id v7 = objc_msgSend(v3, sel_viewIfLoaded);
  if (v7
    && (id v8 = v7, v9 = objc_msgSend(v7, sel_window), v8, v9)
    && (id v11 = objc_msgSend(v9, sel_windowScene), v9, v11))
  {
    a1();
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(a2);
    __swift_storeEnumTagSinglePayload(a3, 1, 1, v10);
  }
}

uint64_t _SnippetClientController.__allocating_init<A>(scene:rootView:modelType:)(objc_class *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8 = objc_allocWithZone(v4);
  return _SnippetClientController.init<A>(scene:rootView:modelType:)(a1, a2, v9, a4);
}

uint64_t _SnippetClientController.init<A>(scene:rootView:modelType:)(objc_class *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v60 = *MEMORY[0x263F8EED0] & *v4;
  uint64_t v9 = *(void *)(v60 + 80);
  sub_25C9B83E0();
  OUTLINED_FUNCTION_0();
  uint64_t v51 = v11;
  uint64_t v52 = v10;
  MEMORY[0x270FA5388](v10, v12);
  uint64_t v62 = (uint64_t)&v51 - v13;
  OUTLINED_FUNCTION_0();
  uint64_t v55 = v14;
  uint64_t v17 = MEMORY[0x270FA5388](v15, v16);
  uint64_t v53 = (char *)&v51 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17, v19);
  uint64_t v54 = (char *)&v51 - v20;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E0150);
  MEMORY[0x270FA5388](v21 - 8, v22);
  OUTLINED_FUNCTION_5_3();
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E0158);
  OUTLINED_FUNCTION_0();
  uint64_t v61 = v24;
  MEMORY[0x270FA5388](v25, v26);
  OUTLINED_FUNCTION_4_3();
  uint64_t v59 = v28 - v27;
  OUTLINED_FUNCTION_0();
  uint64_t v30 = v29;
  MEMORY[0x270FA5388](v31, v32);
  OUTLINED_FUNCTION_4_3();
  *(void *)((char *)v4 + qword_26A5E0160) = 0;
  *(void *)((char *)v4 + qword_26A5E0168) = 0;
  *(void *)((char *)v4 + qword_26A5E0170) = 0;
  uint64_t v57 = a2;
  OUTLINED_FUNCTION_4();
  v35(v33, v34);
  uint64_t v36 = v4;
  uint64_t v58 = a4;
  *(void *)((char *)v36 + qword_26A5E0178) = sub_25C9B8060();

  v65.receiver = v36;
  v65.super_class = ObjectType;
  uint64_t v37 = (char *)-[objc_class initWithNibName:bundle:](&v65, sel_initWithNibName_bundle_, 0, 0, v51, v52);
  uint64_t ObjectType = a1;
  sub_25C9B83A0();
  if (__swift_getEnumTagSinglePayload(v5, 1, v23) == 1)
  {
    sub_25C99D694(v5);
    uint64_t result = sub_25C9B8580();
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v61 + 32))(v59, v5, v23);
    sub_25C9B7B60();
    swift_allocObject();
    sub_25C9B7B50();
    swift_getOpaqueTypeConformance2();
    sub_25C98CD20();
    uint64_t v38 = sub_25C9B7CC0();
    unint64_t v40 = v39;
    uint64_t v41 = *(void *)(v60 + 88);
    sub_25C9B7B40();
    sub_25C98EE60(v38, v40);
    swift_release();
    uint64_t v42 = v62;
    __swift_storeEnumTagSinglePayload(v62, 0, 1, v9);
    uint64_t v44 = v54;
    uint64_t v43 = v55;
    (*(void (**)(char *, uint64_t, uint64_t))(v55 + 32))(v54, v42, v9);
    v63[0] = v9;
    v63[1] = v41;
    long long v64 = *(_OWORD *)(v60 + 96);
    type metadata accessor for SnippetClientContext(0, (uint64_t)v63);
    uint64_t v45 = (uint64_t)v53;
    OUTLINED_FUNCTION_4();
    v46();
    uint64_t v47 = sub_25C98C240((uint64_t)v37, v45);

    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v57, v58);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v44, v9);
    uint64_t v48 = OUTLINED_FUNCTION_1_7();
    v49(v48);
    *(void *)&v37[qword_26A5E0160] = v47;
    swift_release();
    return (uint64_t)v37;
  }
  return result;
}

uint64_t sub_25C99D694(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E0150);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *_SnippetClientController.__allocating_init<A>(rootView:viewModel:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  return _SnippetClientController.init<A>(rootView:viewModel:)(a1, a2, a3);
}

char *_SnippetClientController.init<A>(rootView:viewModel:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v29 = a2;
  uint64_t v26 = a1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v28 = *MEMORY[0x263F8EED0] & *v3;
  uint64_t v5 = v28;
  uint64_t v6 = *(void *)(v28 + 80);
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9, v10);
  uint64_t v12 = (char *)&v26 - v11;
  OUTLINED_FUNCTION_0();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15, v16);
  OUTLINED_FUNCTION_4_3();
  *(void *)((char *)v3 + qword_26A5E0160) = 0;
  *(void *)((char *)v3 + qword_26A5E0168) = 0;
  *(void *)((char *)v3 + qword_26A5E0170) = 0;
  OUTLINED_FUNCTION_4();
  v17();
  uint64_t v18 = v3;
  *(void *)((char *)v18 + qword_26A5E0178) = sub_25C9B8060();

  v33.receiver = v18;
  v33.super_class = ObjectType;
  id v19 = objc_msgSendSuper2(&v33, sel_initWithNibName_bundle_, 0, 0);
  uint64_t v20 = *(void *)(v5 + 104);
  uint64_t v30 = v6;
  long long v31 = *(_OWORD *)(v28 + 88);
  uint64_t v32 = v20;
  type metadata accessor for SnippetClientContext(0, (uint64_t)&v30);
  uint64_t v21 = v29;
  OUTLINED_FUNCTION_4();
  v22();
  uint64_t v23 = (char *)v19;
  uint64_t v24 = sub_25C98C240((uint64_t)v23, (uint64_t)v12);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v21, v6);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v26, a3);
  *(void *)&v23[qword_26A5E0160] = v24;
  swift_release();
  return v23;
}

void sub_25C99D9C8()
{
  *(void *)&v0[qword_26A5E0160] = 0;
  *(void *)&v0[qword_26A5E0168] = 0;
  *(void *)&v0[qword_26A5E0170] = 0;

  sub_25C9B8580();
  __break(1u);
}

void sub_25C99DA4C(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  sub_25C99D9C8();
}

Swift::Void __swiftcall _SnippetClientController.loadView()()
{
  v1.receiver = v0;
  v1.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v1, sel_loadView);
  sub_25C99DAA4();
}

void sub_25C99DAA4()
{
  objc_super v1 = v0;
  if (!*(void *)&v0[qword_26A5E0160])
  {
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v2 = *MEMORY[0x263F8EED0] & *(void *)v0;
  swift_retain();
  swift_retain();
  long long v3 = *(_OWORD *)(v2 + 96);
  long long v51 = *(_OWORD *)(v2 + 80);
  long long v52 = v3;
  type metadata accessor for SnippetClientContext(0, (uint64_t)&v51);
  swift_getWitnessTable();
  uint64_t v4 = MEMORY[0x263F1B718];
  sub_25C9B8020();
  swift_release();
  swift_release();
  long long v49 = v51;
  uint64_t v50 = v52;
  sub_25C9B83E0();
  sub_25C9B7FD0();
  sub_25C9B7EC0();
  uint64_t WitnessTable = swift_getWitnessTable();
  swift_getWitnessTable();
  *(void *)&long long v51 = sub_25C9B8060();
  id v5 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFEA0));
  swift_retain();
  uint64_t v6 = (void *)sub_25C9B7F10();
  objc_msgSend(v1, sel_addChildViewController_, v6, v4, WitnessTable, v49, v50);
  id v7 = objc_msgSend(v1, sel_view);
  if (!v7)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v8 = v7;
  id v9 = objc_msgSend(v6, sel_view);
  if (!v9)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v10 = v9;
  objc_msgSend(v8, sel_addSubview_, v9);

  objc_msgSend(v6, sel_didMoveToParentViewController_, v1);
  id v11 = objc_msgSend(v6, sel_view);
  if (!v11)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v12 = v11;
  id v13 = objc_msgSend(self, sel_clearColor);
  objc_msgSend(v12, sel_setBackgroundColor_, v13);

  id v14 = objc_msgSend(v6, sel_view);
  if (!v14)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v15 = v14;
  objc_msgSend(v14, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFE38);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_25C9B9C20;
  id v17 = objc_msgSend(v6, sel_view);
  if (!v17)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v18 = v17;
  id v19 = objc_msgSend(v17, sel_centerXAnchor);

  id v20 = objc_msgSend(v1, sel_view);
  if (!v20)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v21 = v20;
  id v22 = objc_msgSend(v20, sel_centerXAnchor);

  id v23 = objc_msgSend(v19, sel_constraintEqualToAnchor_, v22);
  *(void *)(v16 + 32) = v23;
  id v24 = objc_msgSend(v6, sel_view);
  if (!v24)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v25 = v24;
  id v26 = objc_msgSend(v24, sel_centerYAnchor);

  id v27 = objc_msgSend(v1, sel_view);
  if (!v27)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v28 = v27;
  id v29 = objc_msgSend(v27, sel_centerYAnchor);

  id v30 = objc_msgSend(v26, sel_constraintEqualToAnchor_, v29);
  *(void *)(v16 + 40) = v30;
  id v31 = objc_msgSend(v6, sel_view);
  if (!v31)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v32 = v31;
  id v33 = objc_msgSend(v31, sel_widthAnchor);

  id v34 = objc_msgSend(v1, sel_view);
  if (!v34)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v35 = v34;
  id v36 = objc_msgSend(v34, sel_widthAnchor);

  id v37 = objc_msgSend(v33, sel_constraintEqualToAnchor_, v36);
  *(void *)(v16 + 48) = v37;
  id v38 = objc_msgSend(v6, sel_view);
  if (!v38)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  unint64_t v39 = v38;
  id v40 = objc_msgSend(v38, sel_heightAnchor);

  id v41 = objc_msgSend(v1, sel_view);
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = self;
    id v44 = objc_msgSend(v42, sel_heightAnchor);

    id v45 = objc_msgSend(v40, sel_constraintEqualToAnchor_, v44);
    *(void *)(v16 + 56) = v45;
    *(void *)&long long v51 = v16;
    sub_25C9B81E0();
    sub_25C99FB84();
    uint64_t v46 = (void *)sub_25C9B81B0();
    swift_bridgeObjectRelease();
    objc_msgSend(v43, sel_activateConstraints_, v46);

    swift_release();
    uint64_t v47 = *(void **)&v1[qword_26A5E0170];
    *(void *)&v1[qword_26A5E0170] = v6;

    return;
  }
LABEL_27:
  __break(1u);
}

void sub_25C99E0BC(void *a1)
{
  id v1 = a1;
  _SnippetClientController.loadView()();
}

Swift::Void __swiftcall _SnippetClientController.viewDidAppear(_:)(Swift::Bool a1)
{
  long long v3 = v1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E0150);
  MEMORY[0x270FA5388](v6 - 8, v7);
  OUTLINED_FUNCTION_5_3();
  v11.receiver = v3;
  v11.super_class = ObjectType;
  objc_msgSendSuper2(&v11, sel_viewDidAppear_, a1);
  sub_25C99CFBC(MEMORY[0x263F82178], &qword_26A5E0158, v2);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E0158);
  if (__swift_getEnumTagSinglePayload(v2, 1, v8) == 1)
  {
    sub_25C99D694(v2);
    uint64_t v9 = 0;
  }
  else
  {
    *(void *)(swift_allocObject() + 16) = v3;
    uint64_t v10 = v3;
    swift_getOpaqueTypeConformance2();
    sub_25C98CD20();
    uint64_t v9 = sub_25C9B7CB0();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v2, v8);
  }
  *(void *)&v3[qword_26A5E0168] = v9;
  swift_unknownObjectRelease();
}

uint64_t sub_25C99E2C8(char *a1, void *a2)
{
  uint64_t v56 = a1;
  uint64_t v59 = (void *)(*MEMORY[0x263F8EED0] & *a2);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E0208);
  MEMORY[0x270FA5388](v3 - 8, v4);
  uint64_t v6 = (char *)v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = v59[10];
  uint64_t v8 = sub_25C9B83E0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v8, v10);
  id v13 = (char *)v50 - v12;
  uint64_t v58 = *(void *)(v7 - 8);
  uint64_t v14 = *(void *)(v58 + 64);
  uint64_t v16 = MEMORY[0x270FA5388](v11, v15);
  long long v52 = (char *)v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16, v17);
  id v19 = (char *)v50 - v18;
  if (qword_26A5DF6B8 != -1) {
    swift_once();
  }
  uint64_t v57 = v13;
  uint64_t v20 = sub_25C9B7C90();
  __swift_project_value_buffer(v20, (uint64_t)qword_26A5E00E8);
  uint64_t v21 = a2;
  id v22 = sub_25C9B7C70();
  os_log_type_t v23 = sub_25C9B82D0();
  BOOL v24 = os_log_type_enabled(v22, v23);
  v50[1] = v14;
  long long v51 = v6;
  uint64_t v54 = v9;
  uint64_t v55 = v8;
  uint64_t v53 = v21;
  if (v24)
  {
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    v50[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v25 = 138543362;
    uint64_t v60 = (uint64_t)v21;
    id v26 = v21;
    sub_25C9B83F0();
    uint64_t v27 = v50[0];
    *(void *)v50[0] = a2;

    uint64_t v28 = v58;
    _os_log_impl(&dword_25C989000, v22, v23, "[%{public}@] Client received a new value from host", v25, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
    swift_arrayDestroy();
    MEMORY[0x26119A890](v27, -1, -1);
    MEMORY[0x26119A890](v25, -1, -1);
  }
  else
  {

    uint64_t v28 = v58;
  }
  sub_25C9B7B60();
  swift_allocObject();
  sub_25C9B7B50();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E04F0);
  sub_25C9B7CA0();
  uint64_t v30 = v60;
  unint64_t v29 = v61;
  uint64_t v31 = v59[11];
  uint64_t v32 = (uint64_t)v57;
  sub_25C9B7B40();
  swift_release();
  sub_25C98EE60(v30, v29);
  __swift_storeEnumTagSinglePayload(v32, 0, 1, v7);
  uint64_t v58 = *(void *)(v28 + 32);
  uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))v58)(v19, v32, v7);
  if (*(void *)&v53[qword_26A5E0160])
  {
    swift_retain();
    id v34 = v52;
    SnippetClientContext.viewModel.getter();
    swift_release();
    uint64_t v57 = (char *)v59[13];
    char v35 = sub_25C9B8130();
    uint64_t v36 = v28;
    id v37 = *(void (**)(char *, uint64_t))(v28 + 8);
    v37(v34, v7);
    if (v35)
    {
      id v38 = v19;
    }
    else
    {
      uint64_t v39 = sub_25C9B8250();
      uint64_t v40 = (uint64_t)v51;
      __swift_storeEnumTagSinglePayload((uint64_t)v51, 1, 1, v39);
      (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v34, v19, v7);
      sub_25C9B8230();
      uint64_t v56 = v53;
      uint64_t v41 = sub_25C9B8220();
      uint64_t v42 = *(unsigned __int8 *)(v36 + 80);
      uint64_t v43 = v19;
      uint64_t v44 = (v42 + 72) & ~v42;
      id v45 = (void *)swift_allocObject();
      uint64_t v46 = v34;
      uint64_t v47 = (uint64_t)v45;
      uint64_t v48 = MEMORY[0x263F8F500];
      v45[2] = v41;
      v45[3] = v48;
      v45[4] = v7;
      v45[5] = v31;
      long long v49 = v57;
      v45[6] = v59[12];
      v45[7] = v49;
      v45[8] = v56;
      ((void (*)(char *, char *, uint64_t))v58)((char *)v45 + v44, v46, v7);
      sub_25C9A159C(v40, (uint64_t)&unk_26A5E0218, v47);
      swift_release();
      id v38 = v43;
    }
    return ((uint64_t (*)(char *, uint64_t))v37)(v38, v7);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_25C99E8C8()
{
  return swift_deallocObject();
}

uint64_t sub_25C99E900(char *a1)
{
  return sub_25C99E2C8(a1, *(void **)(v1 + 16));
}

uint64_t sub_25C99E908(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  uint64_t v6 = *(void *)((*MEMORY[0x263F8EED0] & *a4) + 0x50);
  v5[4] = v6;
  v5[5] = *(void *)(v6 - 8);
  v5[6] = swift_task_alloc();
  sub_25C9B8230();
  v5[7] = sub_25C9B8220();
  uint64_t v8 = sub_25C9B8210();
  return MEMORY[0x270FA2498](sub_25C99EA18, v8, v7);
}

uint64_t sub_25C99EA18()
{
  uint64_t v1 = v0[2];
  uint64_t result = swift_release();
  if (*(void *)(v1 + qword_26A5E0160))
  {
    uint64_t v3 = (char *)v0[6];
    OUTLINED_FUNCTION_4();
    v4();
    swift_retain();
    SnippetClientContext.viewModel.setter(v3);
    swift_release();
    swift_task_dealloc();
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_25C99EAC8(void *a1, uint64_t a2, Swift::Bool a3)
{
  id v4 = a1;
  _SnippetClientController.viewDidAppear(_:)(a3);
}

Swift::Void __swiftcall _SnippetClientController.viewDidDisappear(_:)(Swift::Bool a1)
{
  v3.receiver = v1;
  v3.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v3, sel_viewDidDisappear_, a1);
  *(void *)&v1[qword_26A5E0168] = 0;
  swift_unknownObjectRelease();
}

void sub_25C99EB78(void *a1, uint64_t a2, Swift::Bool a3)
{
  id v4 = a1;
  _SnippetClientController.viewDidDisappear(_:)(a3);
}

Swift::Void __swiftcall _SnippetClientController.viewDidLayoutSubviews()()
{
  uint64_t v1 = v0;
  v20.receiver = v0;
  v20.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v20, sel_viewDidLayoutSubviews);
  uint64_t v2 = *(void **)&v0[qword_26A5E0170];
  if (!v2)
  {
    __break(1u);
    goto LABEL_10;
  }
  id v3 = objc_msgSend(v2, sel_view);
  if (!v3)
  {
LABEL_10:
    __break(1u);
    return;
  }
  id v4 = v3;
  objc_msgSend(v3, sel_intrinsicContentSize);
  double v6 = v5;
  double v8 = v7;

  if (qword_26A5DF6B8 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_25C9B7C90();
  __swift_project_value_buffer(v9, (uint64_t)qword_26A5E00E8);
  uint64_t v10 = v0;
  uint64_t v11 = sub_25C9B7C70();
  os_log_type_t v12 = sub_25C9B82D0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v14 = (void *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 138543618;
    uint64_t v15 = v10;
    sub_25C9B83F0();
    *uint64_t v14 = v1;

    *(_WORD *)(v13 + 12) = 2080;
    uint64_t v16 = sub_25C9B8380();
    sub_25C99F02C(v16, v17, &v19);
    sub_25C9B83F0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C989000, v11, v12, "[%{public}@] viewDidLayoutSubviews with intrinsicContentSize: %s", (uint8_t *)v13, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_6();
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_6();
    OUTLINED_FUNCTION_0_6();
  }
  else
  {
  }
  id v18 = objc_msgSend(v10, sel__hostedWindowScene);
  objc_msgSend(v18, sel__setPreferredContentSize_, v6, v8);
}

void sub_25C99EE70(void *a1)
{
  id v1 = a1;
  _SnippetClientController.viewDidLayoutSubviews()();
}

id _SnippetClientController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  if (a2)
  {
    double v6 = (void *)sub_25C9B8140();
    swift_bridgeObjectRelease();
  }
  else
  {
    double v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void _SnippetClientController.init(nibName:bundle:)()
{
}

void sub_25C99EF60(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3) {
    sub_25C9B8150();
  }
  id v5 = a4;
  _SnippetClientController.init(nibName:bundle:)();
}

id _SnippetClientController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_25C99EFC0(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  objc_super v2 = *(void **)(a1 + qword_26A5E0170);
}

uint64_t sub_25C99F02C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25C99F1AC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25C99F304((uint64_t)v12, *a3);
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
      sub_25C99F304((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_25C99F100()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for _SnippetClientController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for _SnippetClientController);
}

uint64_t method lookup function for _SnippetClientController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for _SnippetClientController);
}

uint64_t dispatch thunk of _SnippetClientController.__allocating_init<A>(scene:rootView:modelType:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of _SnippetClientController.__allocating_init<A>(rootView:viewModel:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t sub_25C99F1AC(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_25C99F360((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_25C9B8400();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_25C99F438(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_25C9B84F0();
    if (!v8)
    {
      uint64_t result = sub_25C9B8570();
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

uint64_t sub_25C99F304(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_25C99F360(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25C9B85C0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_25C99F438(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25C99F4D0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_25C99F6AC(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_25C99F6AC((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25C99F4D0(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_25C9B8190();
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
  unint64_t v3 = sub_25C99F644(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_25C9B84D0();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_25C9B85C0();
  __break(1u);
LABEL_14:
  uint64_t result = sub_25C9B8570();
  __break(1u);
  return result;
}

void *sub_25C99F644(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E0200);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_25C99F6AC(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E0200);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  os_log_type_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25C99F85C(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25C99F784(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_25C99F784(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25C9B85C0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_25C99F85C(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_25C9B85C0();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_25C99F8F0()
{
  uint64_t v1 = *(void *)(v0 + 32);
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();

  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v0 + v4, v1);
  return swift_deallocObject();
}

uint64_t sub_25C99F998(uint64_t a1)
{
  uint64_t v4 = v1[3];
  uint64_t v5 = v1[2];
  unint64_t v6 = (void *)v1[8];
  uint64_t v7 = (uint64_t)v1
     + ((*(unsigned __int8 *)(*(void *)(v1[4] - 8) + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1[4] - 8) + 80));
  int64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *int64_t v8 = v2;
  v8[1] = sub_25C99FA90;
  return sub_25C99E908(a1, v5, v4, v6, v7);
}

uint64_t sub_25C99FA90()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_25C99FB84()
{
  unint64_t result = qword_26A5E0510;
  if (!qword_26A5E0510)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A5E0510);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_7()
{
  return *(void *)(v0 - 176);
}

void SceneSettingDynamicLookup.subscript.getter()
{
}

{
  sub_25C9B8580();
  __break(1u);
}

{
  SceneSettingDynamicLookup.subscript.getter();
}

uint64_t sub_25C99FC18(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = OUTLINED_FUNCTION_9_2();
  v1(v2);
  return swift_release();
}

void sub_25C99FC74(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
}

void static AnySceneSetting.observe<A>(differ:call:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(a6 + 16))(a4, a6);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  void v12[4] = sub_25C9A0684;
  v12[5] = v10;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  v12[2] = sub_25C99FC18;
  void v12[3] = &block_descriptor_3;
  size_t v11 = _Block_copy(v12);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_observeOtherSetting_withBlock_, v9, v11);
  _Block_release(v11);
}

uint64_t sub_25C99FDA4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t static SceneSettingScopes.ApplicationSettings.FrameKey.keyIndex.getter()
{
  return qword_26A5E0220;
}

uint64_t static SceneSettingScopes.ApplicationSettings.FrameKey.keyIndex.setter()
{
  OUTLINED_FUNCTION_7_2();
  uint64_t result = OUTLINED_FUNCTION_1_5();
  qword_26A5E0220 = v0;
  return result;
}

uint64_t (*static SceneSettingScopes.ApplicationSettings.FrameKey.keyIndex.modify())()
{
  return j_j__swift_endAccess;
}

void sub_25C99FE80()
{
  qword_26A5E0228 = 0x656D617266;
  qword_26A5E0230 = 0xE500000000000000;
}

uint64_t static SceneSettingScopes.ApplicationSettings.FrameKey.keyDescription.getter()
{
  if (qword_26A5DF6D8 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_2_3();
  swift_bridgeObjectRetain();
  return OUTLINED_FUNCTION_9_2();
}

uint64_t static SceneSettingScopes.ApplicationSettings.FrameKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  if (qword_26A5DF6D8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  qword_26A5E0228 = a1;
  qword_26A5E0230 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static SceneSettingScopes.ApplicationSettings.FrameKey.keyDescription.modify())()
{
  if (qword_26A5DF6D8 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_5();
  return j_j__swift_endAccess;
}

void static SceneSettingScopes.ApplicationSettings.FrameKey.observe<A>(differ:call:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a3;
  void v8[4] = sub_25C9A0684;
  v8[5] = v6;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = sub_25C9A00F4;
  v8[3] = &block_descriptor_6;
  uint64_t v7 = _Block_copy(v8);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_observeFrameWithBlock_, v7);
  _Block_release(v7);
}

uint64_t sub_25C9A00F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t static SceneSettingScopes.SnippetSceneSettings.SceneMetricsKey.keyIndex.getter()
{
  return qword_26A5E0238;
}

uint64_t static SceneSettingScopes.SnippetSceneSettings.SceneMetricsKey.keyIndex.setter()
{
  OUTLINED_FUNCTION_7_2();
  uint64_t result = OUTLINED_FUNCTION_1_5();
  qword_26A5E0238 = v0;
  return result;
}

uint64_t (*static SceneSettingScopes.SnippetSceneSettings.SceneMetricsKey.keyIndex.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static SceneSettingScopes.SnippetSceneSettings.SceneMetricsKey.keyDescription.getter()
{
  return OUTLINED_FUNCTION_2_6();
}

uint64_t static SceneSettingScopes.SnippetSceneSettings.SceneMetricsKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return OUTLINED_FUNCTION_5_2(a1, a2, qword_26A5E0240);
}

uint64_t (*static SceneSettingScopes.SnippetSceneSettings.SceneMetricsKey.keyDescription.modify())()
{
  return j__swift_endAccess;
}

uint64_t static SceneSettingScopes.SnippetSceneSettings.SnippetSceneHostIdentifierKey.keyIndex.getter()
{
  return qword_26A5E0250;
}

uint64_t static SceneSettingScopes.SnippetSceneSettings.SnippetSceneHostIdentifierKey.keyIndex.setter()
{
  OUTLINED_FUNCTION_7_2();
  uint64_t result = OUTLINED_FUNCTION_1_5();
  qword_26A5E0250 = v0;
  return result;
}

uint64_t (*static SceneSettingScopes.SnippetSceneSettings.SnippetSceneHostIdentifierKey.keyIndex.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static SceneSettingScopes.SnippetSceneSettings.SnippetSceneHostIdentifierKey.keyDescription.getter()
{
  return OUTLINED_FUNCTION_2_6();
}

uint64_t static SceneSettingScopes.SnippetSceneSettings.SnippetSceneHostIdentifierKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return OUTLINED_FUNCTION_5_2(a1, a2, qword_26A5E0258);
}

uint64_t (*static SceneSettingScopes.SnippetSceneSettings.SnippetSceneHostIdentifierKey.keyDescription.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static SceneSettingScopes.SnippetSceneSettings.SceneMetricsRequestKey.keyIndex.getter()
{
  return qword_26A5E0268;
}

uint64_t static SceneSettingScopes.SnippetSceneSettings.SceneMetricsRequestKey.keyIndex.setter()
{
  OUTLINED_FUNCTION_7_2();
  uint64_t result = OUTLINED_FUNCTION_1_5();
  qword_26A5E0268 = v0;
  return result;
}

uint64_t (*static SceneSettingScopes.SnippetSceneSettings.SceneMetricsRequestKey.keyIndex.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static SceneSettingScopes.SnippetSceneSettings.SceneMetricsRequestKey.keyDescription.getter()
{
  return OUTLINED_FUNCTION_2_6();
}

uint64_t static SceneSettingScopes.SnippetSceneSettings.SceneMetricsRequestKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return OUTLINED_FUNCTION_5_2(a1, a2, qword_26A5E0270);
}

uint64_t (*static SceneSettingScopes.SnippetSceneSettings.SceneMetricsRequestKey.keyDescription.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static SceneSettingScopes.SnippetSceneSettings.SnippetSceneViewDataKey.keyIndex.getter()
{
  return qword_26A5E0280;
}

uint64_t static SceneSettingScopes.SnippetSceneSettings.SnippetSceneViewDataKey.keyIndex.setter()
{
  OUTLINED_FUNCTION_7_2();
  uint64_t result = OUTLINED_FUNCTION_1_5();
  qword_26A5E0280 = v0;
  return result;
}

uint64_t (*static SceneSettingScopes.SnippetSceneSettings.SnippetSceneViewDataKey.keyIndex.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static SceneSettingScopes.SnippetSceneSettings.SnippetSceneViewDataKey.keyDescription.getter()
{
  return OUTLINED_FUNCTION_2_6();
}

uint64_t sub_25C9A0540()
{
  return OUTLINED_FUNCTION_9_2();
}

uint64_t static SceneSettingScopes.SnippetSceneSettings.SnippetSceneViewDataKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return OUTLINED_FUNCTION_5_2(a1, a2, qword_26A5E0288);
}

uint64_t (*static SceneSettingScopes.SnippetSceneSettings.SnippetSceneViewDataKey.keyDescription.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_25C9A064C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_25C9A0684()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
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

unint64_t sub_25C9A06D4()
{
  return sub_25C9A07B8();
}

unint64_t sub_25C9A071C()
{
  return sub_25C9A07B8();
}

uint64_t sub_25C9A0764()
{
  return MEMORY[0x263F8D338];
}

unint64_t sub_25C9A0770()
{
  return sub_25C9A07B8();
}

unint64_t sub_25C9A07B8()
{
  OUTLINED_FUNCTION_12();
  unint64_t result = *v2;
  if (!result)
  {
    v1(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v0);
  }
  return result;
}

uint64_t dispatch thunk of static AnySceneSetting.keyDescription.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static AnySceneSetting.keyIndex.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static AnySceneSetting.observe<A>(differ:call:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 24))();
}

void type metadata accessor for SceneSettingScopes()
{
}

void type metadata accessor for SceneSettingScopes.ApplicationSettings()
{
}

void type metadata accessor for SceneSettingScopes.ApplicationSettings.FrameKey()
{
}

void type metadata accessor for SceneSettingScopes.SnippetSceneSettings()
{
}

void type metadata accessor for SceneSettingScopes.SnippetSceneSettings.SceneMetricsKey()
{
}

void type metadata accessor for SceneSettingScopes.SnippetSceneSettings.SnippetSceneHostIdentifierKey()
{
}

void type metadata accessor for SceneSettingScopes.SnippetSceneSettings.SceneMetricsRequestKey()
{
}

void type metadata accessor for SceneSettingScopes.SnippetSceneSettings.SnippetSceneViewDataKey()
{
}

void type metadata accessor for SceneSettingDynamicLookup()
{
}

uint64_t dispatch thunk of TypedSettings.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t sub_25C9A08D0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  id v8 = objc_msgSend(v4, sel_otherSettings);
  id v9 = objc_msgSend(v8, sel_objectForSetting_, (*(uint64_t (**)(uint64_t))(*(void *)(a2 + 8) + 16))(a1));

  if (v9)
  {
    sub_25C9B8410();
    swift_unknownObjectRelease();
    sub_25C992214(&v13, v14);
  }
  else
  {
    memset(v14, 0, sizeof(v14));
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5DFCD0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  int v11 = swift_dynamicCast();
  return __swift_storeEnumTagSinglePayload(a3, v11 ^ 1u, 1, AssociatedTypeWitness);
}

uint64_t sub_25C9A09FC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_25C9A08D0(*(void *)(*MEMORY[0x263F8EA20] + *a1 + 8), a2, a3);
}

id sub_25C9A0AE8()
{
  return sub_25C9A0F40(type metadata accessor for SnippetSceneSettings);
}

uint64_t type metadata accessor for SnippetSceneSettings()
{
  return self;
}

uint64_t sub_25C9A0B24@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_25C9A08D0(a1, a2, a3);
}

uint64_t sub_25C9A0B48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25C9A08CC(a1, a3);
}

id sub_25C9A0B70@<X0>(uint64_t (*a1)(void)@<X1>, void *a2@<X8>)
{
  uint64_t v4 = (objc_class *)a1();
  id result = objc_msgSend(objc_allocWithZone(v4), sel_initWithSettings_, v2);
  a2[3] = v4;
  *a2 = result;
  return result;
}

uint64_t sub_25C9A0BD8(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  id v5 = a1;
  sub_25C9A0B70(a4, v8);

  __swift_project_boxed_opaque_existential_0(v8, v8[3]);
  uint64_t v6 = sub_25C9B85E0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v6;
}

uint64_t sub_25C9A0C40(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  OUTLINED_FUNCTION_1_4();
  if (qword_26A5E0268 == a1)
  {
    id v5 = &protocol witness table for SceneSettingScopes.SnippetSceneSettings.SceneMetricsRequestKey;
    return ((uint64_t (__cdecl *)())v5[1])();
  }
  OUTLINED_FUNCTION_1_4();
  if (qword_26A5E0250 == a1)
  {
    id v5 = &protocol witness table for SceneSettingScopes.SnippetSceneSettings.SnippetSceneHostIdentifierKey;
    return ((uint64_t (__cdecl *)())v5[1])();
  }
  uint64_t v6 = OUTLINED_FUNCTION_1_4();
  if (qword_26A5E0280 == a1)
  {
    id v5 = &protocol witness table for SceneSettingScopes.SnippetSceneSettings.SnippetSceneViewDataKey;
    return ((uint64_t (__cdecl *)())v5[1])();
  }
  v11.receiver = v2;
  v11.super_class = (Class)a2(v6);
  id v9 = objc_msgSendSuper2(&v11, sel_keyDescriptionForSetting_, a1);
  if (!v9) {
    return 0;
  }
  uint64_t v10 = v9;
  uint64_t v7 = sub_25C9B8150();

  return v7;
}

id sub_25C9A0D9C(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  id v6 = a1;
  sub_25C9A0C40(a3, a4);
  uint64_t v8 = v7;

  if (v8)
  {
    OUTLINED_FUNCTION_9_2();
    id v9 = (void *)sub_25C9B8140();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

id sub_25C9A0E20(void *a1, uint64_t (*a2)(void))
{
  v6.receiver = v2;
  v6.super_class = (Class)a2();
  id v4 = objc_msgSendSuper2(&v6, sel_initWithSettings_, a1);

  return v4;
}

id sub_25C9A0EB8(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_init);
}

id sub_25C9A0F28()
{
  return sub_25C9A0F40(type metadata accessor for LiveMutableSceneSettings);
}

id sub_25C9A0F40(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for LiveMutableSceneSettings()
{
  return self;
}

_UNKNOWN **sub_25C9A0F9C()
{
  return &protocol witness table for SceneSettingScopes.SnippetSceneSettings;
}

uint64_t OUTLINED_FUNCTION_2_6()
{
  return sub_25C9A0540();
}

uint64_t OUTLINED_FUNCTION_9_2()
{
  return v0;
}

uint64_t sub_25C9A0FC8()
{
  uint64_t result = sub_25C9B8090();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25C9A1064(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  if (v6 <= 0x7FFFFFFF) {
    int v7 = 0x7FFFFFFF;
  }
  else {
    int v7 = *(_DWORD *)(v5 + 84);
  }
  uint64_t v8 = *(unsigned __int8 *)(v5 + 80);
  if ((int)v6 >= 0) {
    unsigned int v9 = 0x7FFFFFFF;
  }
  else {
    unsigned int v9 = v7;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v10 = v8 | 7;
  int v11 = a2 - v9;
  if (a2 <= v9) {
    goto LABEL_26;
  }
  uint64_t v12 = ((v8 + 16) & ~v8) + *(void *)(*(void *)(v4 - 8) + 64) + ((v8 + 16) & ~v10);
  char v13 = 8 * v12;
  if (v12 <= 3)
  {
    unsigned int v16 = ((v11 + ~(-1 << v13)) >> v13) + 1;
    if (HIWORD(v16))
    {
      int v14 = *(_DWORD *)((char *)a1 + v12);
      if (!v14) {
        goto LABEL_26;
      }
      goto LABEL_18;
    }
    if (v16 > 0xFF)
    {
      int v14 = *(unsigned __int16 *)((char *)a1 + v12);
      if (!*(unsigned __int16 *)((char *)a1 + v12)) {
        goto LABEL_26;
      }
      goto LABEL_18;
    }
    if (v16 < 2)
    {
LABEL_26:
      if (v9 != 0x7FFFFFFF) {
        return __swift_getEnumTagSinglePayload((v8 + (((((unint64_t)a1 + v10 + 16) & ~v10) + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v8, v6, v4);
      }
      unint64_t v18 = *((void *)a1 + 1);
      if (v18 >= 0xFFFFFFFF) {
        LODWORD(v18) = -1;
      }
      return (v18 + 1);
    }
  }
  int v14 = *((unsigned __int8 *)a1 + v12);
  if (!*((unsigned char *)a1 + v12)) {
    goto LABEL_26;
  }
LABEL_18:
  int v17 = (v14 - 1) << v13;
  if (v12 > 3) {
    int v17 = 0;
  }
  if (v12)
  {
    if (v12 > 3) {
      LODWORD(v12) = 4;
    }
    switch((int)v12)
    {
      case 2:
        LODWORD(v12) = *a1;
        break;
      case 3:
        LODWORD(v12) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v12) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v12) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v9 + (v12 | v17) + 1;
}

void sub_25C9A1228(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  if (v8 <= 0x7FFFFFFF) {
    unsigned int v9 = 0x7FFFFFFF;
  }
  else {
    unsigned int v9 = *(_DWORD *)(v7 + 84);
  }
  if ((int)v8 >= 0) {
    unsigned int v9 = 0x7FFFFFFF;
  }
  uint64_t v10 = *(unsigned __int8 *)(v7 + 80);
  size_t v11 = ((v10 + 16) & ~v10) + *(void *)(*(void *)(v6 - 8) + 64) + ((v10 + 16) & ~(v10 | 7));
  char v12 = 8 * v11;
  BOOL v13 = a3 >= v9;
  unsigned int v14 = a3 - v9;
  if (v14 != 0 && v13)
  {
    if (v11 <= 3)
    {
      unsigned int v18 = ((v14 + ~(-1 << v12)) >> v12) + 1;
      if (HIWORD(v18))
      {
        int v15 = 4;
      }
      else if (v18 >= 0x100)
      {
        int v15 = 2;
      }
      else
      {
        int v15 = v18 > 1;
      }
    }
    else
    {
      int v15 = 1;
    }
  }
  else
  {
    int v15 = 0;
  }
  if (v9 < a2)
  {
    unsigned int v16 = ~v9 + a2;
    if (v11 < 4)
    {
      int v17 = (v16 >> v12) + 1;
      if (v11)
      {
        int v19 = v16 & ~(-1 << v12);
        bzero(a1, v11);
        if (v11 == 3)
        {
          *(_WORD *)a1 = v19;
          a1[2] = BYTE2(v19);
        }
        else if (v11 == 2)
        {
          *(_WORD *)a1 = v19;
        }
        else
        {
          *a1 = v19;
        }
      }
    }
    else
    {
      bzero(a1, v11);
      *(_DWORD *)a1 = v16;
      int v17 = 1;
    }
    switch(v15)
    {
      case 1:
        a1[v11] = v17;
        return;
      case 2:
        *(_WORD *)&a1[v11] = v17;
        return;
      case 3:
        goto LABEL_43;
      case 4:
        *(_DWORD *)&a1[v11] = v17;
        return;
      default:
        return;
    }
  }
  switch(v15)
  {
    case 1:
      a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_26;
    case 2:
      *(_WORD *)&a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_26;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x25C9A14A8);
    case 4:
      *(_DWORD *)&a1[v11] = 0;
      goto LABEL_25;
    default:
LABEL_25:
      if (a2)
      {
LABEL_26:
        if (v9 == 0x7FFFFFFF)
        {
          if ((a2 & 0x80000000) != 0)
          {
            *(void *)a1 = a2 ^ 0x80000000;
            *((void *)a1 + 1) = 0;
          }
          else
          {
            *((void *)a1 + 1) = (a2 - 1);
          }
        }
        else
        {
          unint64_t v20 = (v10 + ((((unint64_t)&a1[(v10 | 7) + 16] & ~(v10 | 7)) + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v10;
          __swift_storeEnumTagSinglePayload(v20, a2, v8, v6);
        }
      }
      return;
  }
}

uint64_t type metadata accessor for SnippetHostView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for SnippetHostView);
}

uint64_t sub_25C9A14E8()
{
  return swift_getWitnessTable();
}

uint64_t sub_25C9A1504@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void *a8@<X8>)
{
  *a8 = a1;
  a8[1] = a2;
  v12[0] = a4;
  v12[1] = a5;
  v12[2] = a6;
  void v12[3] = a7;
  unsigned int v9 = (char *)a8 + *(int *)(type metadata accessor for SnippetHostView(0, (uint64_t)v12) + 52);
  uint64_t v10 = sub_25C9B8090();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9, a3, v10);
}

uint64_t sub_25C9A159C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C9B8250();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_25C9A2258(a1);
  }
  else
  {
    sub_25C9B8240();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25C9B8210();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_25C9A1704(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = sub_25C9B8090();
  return a2(v3);
}

uint64_t sub_25C9A1750(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F02710](a1, a2, a3, WitnessTable);
}

uint64_t sub_25C9A17CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F026D8](a1, a2, a3, WitnessTable);
}

void sub_25C9A1848()
{
}

NSObject *sub_25C9A1888(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = a2[2];
  uint64_t v6 = sub_25C9B8090();
  MEMORY[0x270FA5388](v6 - 8, v7);
  unsigned int v9 = (char *)&v18 - v8;
  if (qword_26A5DF6D0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_25C9B7C90();
  __swift_project_value_buffer(v10, (uint64_t)qword_26A5E0130);
  size_t v11 = sub_25C9B7C70();
  os_log_type_t v12 = sub_25C9B82D0();
  if (os_log_type_enabled(v11, v12))
  {
    BOOL v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v13 = 0;
    _os_log_impl(&dword_25C989000, v11, v12, "SnippetHostView.makeUIViewController(_:context:)", v13, 2u);
    MEMORY[0x26119A890](v13, -1, -1);
  }

  type metadata accessor for SnippetHostViewController();
  uint64_t v14 = *v3;
  uint64_t v15 = v3[1];
  swift_bridgeObjectRetain();
  sub_25C9A1704((uint64_t)a2, MEMORY[0x263F1B740]);
  unsigned int v16 = SnippetHostViewController.__allocating_init<A>(bundleIdentifier:viewModel:)(v14, v15, (uint64_t)v9, v5, a2[3], a2[4], a2[5]);
  BSDispatchQueueAssertMain();
  sub_25C9AD284(1u, 0);
  return v16;
}

uint64_t sub_25C9A1A38(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *(void *)(a3 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](a1, a2);
  unsigned int v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E0208);
  MEMORY[0x270FA5388](v10 - 8, v11);
  BOOL v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A5DF6D0 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_25C9B7C90();
  __swift_project_value_buffer(v14, (uint64_t)qword_26A5E0130);
  uint64_t v15 = sub_25C9B7C70();
  os_log_type_t v16 = sub_25C9B82D0();
  if (os_log_type_enabled(v15, v16))
  {
    int v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v17 = 0;
    _os_log_impl(&dword_25C989000, v15, v16, "SnippetHostView.updateUIViewController(_:context:)", v17, 2u);
    MEMORY[0x26119A890](v17, -1, -1);
  }

  uint64_t v18 = sub_25C9B8250();
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 1, 1, v18);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v4, a3);
  sub_25C9B8230();
  id v19 = a1;
  uint64_t v20 = sub_25C9B8220();
  unint64_t v21 = (*(unsigned __int8 *)(v7 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v22 = swift_allocObject();
  uint64_t v23 = MEMORY[0x263F8F500];
  *(void *)(v22 + 16) = v20;
  *(void *)(v22 + 24) = v23;
  long long v24 = *(_OWORD *)(a3 + 32);
  *(_OWORD *)(v22 + 32) = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v22 + 48) = v24;
  *(void *)(v22 + 64) = v19;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v22 + v21, v9, a3);
  sub_25C9A159C((uint64_t)v13, (uint64_t)&unk_26A5E0328, v22);
  return swift_release();
}

uint64_t sub_25C9A1CC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[10] = a8;
  v8[11] = v13;
  v8[8] = a6;
  v8[9] = a7;
  void v8[6] = a4;
  v8[7] = a5;
  v8[12] = *(void *)(a6 - 8);
  v8[13] = swift_task_alloc();
  sub_25C9B8230();
  v8[14] = sub_25C9B8220();
  uint64_t v10 = sub_25C9B8210();
  return MEMORY[0x270FA2498](sub_25C9A1DB8, v10, v9);
}

uint64_t sub_25C9A1DB8()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = v0[11];
  uint64_t v3 = v0[12];
  uint64_t v5 = v0[9];
  uint64_t v4 = v0[10];
  uint64_t v6 = v0[8];
  swift_release();
  v0[2] = v6;
  v0[3] = v5;
  v0[4] = v4;
  v0[5] = v2;
  uint64_t v7 = type metadata accessor for SnippetHostView(0, (uint64_t)(v0 + 2));
  sub_25C9A1704(v7, MEMORY[0x263F1B730]);
  sub_25C9AB1AC(v1, v6, v5, v4, v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v6);
  swift_task_dealloc();
  OUTLINED_FUNCTION_2_7();
  return v8();
}

void sub_25C9A1EAC()
{
}

uint64_t sub_25C9A1EE4()
{
  return sub_25C9B7F60();
}

uint64_t sub_25C9A1F20()
{
  return MEMORY[0x263F1BB58];
}

uint64_t sub_25C9A1F2C()
{
  long long v1 = *(_OWORD *)(v0 + 48);
  v8[0] = *(_OWORD *)(v0 + 32);
  uint64_t v7 = *(void *)&v8[0];
  v8[1] = v1;
  uint64_t v2 = (int *)(type metadata accessor for SnippetHostView(0, (uint64_t)v8) - 8);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v2 + 80);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  unint64_t v4 = v0 + v3 + v2[15];
  swift_release();
  swift_release();
  uint64_t v5 = sub_25C9B8090();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v4 + *(int *)(v5 + 32), v7);
  return swift_deallocObject();
}

uint64_t sub_25C9A205C(uint64_t a1)
{
  uint64_t v4 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t v6 = v1[6];
  uint64_t v7 = v1[7];
  v2[2] = v4;
  v2[3] = v5;
  v2[4] = v6;
  v2[5] = v7;
  uint64_t v8 = *(void *)(type metadata accessor for SnippetHostView(0, (uint64_t)(v2 + 2)) - 8);
  uint64_t v9 = v1[2];
  uint64_t v10 = v1[3];
  uint64_t v11 = v1[8];
  uint64_t v12 = (uint64_t)v1 + ((*(unsigned __int8 *)(v8 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  uint64_t v13 = (void *)swift_task_alloc();
  v2[6] = v13;
  *uint64_t v13 = v2;
  v13[1] = sub_25C9A2194;
  return sub_25C9A1CC0(a1, v9, v10, v11, v12, v4, v5, v6);
}

uint64_t sub_25C9A2194()
{
  OUTLINED_FUNCTION_0_7();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1_8();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_2_7();
  return v3();
}

uint64_t sub_25C9A2258(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E0208);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C9A22B8(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25C9A2394;
  return v6(a1);
}

uint64_t sub_25C9A2394()
{
  OUTLINED_FUNCTION_0_7();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1_8();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_2_7();
  return v3();
}

uint64_t sub_25C9A245C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_25C9A2494(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25C9A254C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A5E0330 + dword_26A5E0330);
  return v6(a1, v4);
}

uint64_t sub_25C9A254C()
{
  OUTLINED_FUNCTION_0_7();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1_8();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_2_7();
  return v3();
}

uint64_t OUTLINED_FUNCTION_2_7()
{
  return v0 + 8;
}

uint64_t sub_25C9A2644(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 48);
}

uint64_t sub_25C9A264C()
{
  uint64_t result = sub_25C9B8090();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_25C9A26F0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  int v6 = *(_DWORD *)(v5 + 80);
  uint64_t v7 = v6;
  unint64_t v8 = v6 & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = v8 & (v6 + 16);
  uint64_t v10 = ((v7 + 16) & ~v7) + *(void *)(v5 + 64) + 7;
  int v11 = v6 & 0x100000;
  if (v7 > 7 || v11 != 0 || ((v10 + v9) & 0xFFFFFFFFFFFFFFF8) + 9 > 0x18)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + v9);
  }
  else
  {
    uint64_t v15 = a2[1];
    *a1 = *a2;
    a1[1] = v15;
    os_log_type_t v16 = (void *)(v8 & ((unint64_t)a1 + 23));
    int v17 = (void *)(v8 & ((unint64_t)a2 + 23));
    *os_log_type_t v16 = *v17;
    uint64_t v18 = ~v7;
    id v19 = (void *)(((unint64_t)v16 + 15) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v20 = (void *)(((unint64_t)v17 + 15) & 0xFFFFFFFFFFFFFFF8);
    void *v19 = *v20;
    uint64_t v21 = v7 + 8;
    unint64_t v28 = ((unint64_t)v19 + v21) & v18;
    unint64_t v22 = ((unint64_t)v20 + v21) & v18;
    uint64_t v23 = *(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    v23(v28, v22, v4);
    unint64_t v24 = ((unint64_t)v17 + v10) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v25 = *(void *)v24;
    LOBYTE(v24) = *(unsigned char *)(v24 + 8);
    unint64_t v26 = ((unint64_t)v16 + v10) & 0xFFFFFFFFFFFFFFF8;
    *(void *)unint64_t v26 = v25;
    *(unsigned char *)(v26 + 8) = v24;
  }
  swift_retain();
  return a1;
}

uint64_t sub_25C9A2880(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))((v6 + ((((a1 + (v6 | 7) + 16) & ~(v6 | 7)) + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v6, v4);
  return swift_release();
}

void *sub_25C9A2968(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  uint64_t v6 = *(void *)(v5 - 8) + 16;
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v8 = (v7 | 7) + 16;
  uint64_t v10 = (void *)(((unint64_t)a2 + v8) & ~(v7 | 7));
  uint64_t v9 = (void *)(((unint64_t)a1 + v8) & ~(v7 | 7));
  void *v9 = *v10;
  int v11 = (void *)(((unint64_t)v9 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v12 = (void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
  *int v11 = *v12;
  uint64_t v13 = ((unint64_t)v11 + v7 + 8) & ~v7;
  uint64_t v14 = ((unint64_t)v12 + v7 + 8) & ~v7;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  v20(v13, v14, v5);
  uint64_t v15 = *(void *)(v6 + 48) + ((v7 + 16) & ~v7) + 7;
  unint64_t v16 = (unint64_t)v9 + v15;
  unint64_t v17 = ((unint64_t)v10 + v15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v18 = *(void *)v17;
  LOBYTE(v17) = *(unsigned char *)(v17 + 8);
  v16 &= 0xFFFFFFFFFFFFFFF8;
  *(void *)unint64_t v16 = v18;
  *(unsigned char *)(v16 + 8) = v17;
  swift_retain();
  return a1;
}

void *sub_25C9A2A98(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v8 | 7) + 16;
  uint64_t v10 = (void *)(((unint64_t)a1 + v9) & ~(v8 | 7));
  int v11 = (void *)(((unint64_t)a2 + v9) & ~(v8 | 7));
  void *v10 = *v11;
  swift_retain();
  swift_release();
  uint64_t v12 = (void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v13 = (void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v12 = *v13;
  swift_retain();
  swift_release();
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 24))(((unint64_t)v12 + v8 + 8) & ~v8, ((unint64_t)v13 + v8 + 8) & ~v8, v6);
  uint64_t v14 = *(void *)(v7 + 64) + ((v8 + 16) & ~v8) + 7;
  unint64_t v15 = ((unint64_t)v10 + v14) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v16 = ((unint64_t)v11 + v14) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = *(void *)v16;
  LOBYTE(v16) = *(unsigned char *)(v16 + 8);
  *(void *)unint64_t v15 = v17;
  *(unsigned char *)(v15 + 8) = v16;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_25C9A2BFC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(void (**)(unint64_t, unint64_t))(v4 + 32);
  uint64_t v6 = v4 + 32;
  uint64_t v7 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v8 = (v7 | 7) + 16;
  uint64_t v9 = (void *)(((unint64_t)a1 + v8) & ~(v7 | 7));
  uint64_t v10 = (void *)(((unint64_t)a2 + v8) & ~(v7 | 7));
  void *v9 = *v10;
  int v11 = (void *)(((unint64_t)v9 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v12 = (void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
  *int v11 = *v12;
  v5(((unint64_t)v11 + v7 + 8) & ~v7, ((unint64_t)v12 + v7 + 8) & ~v7);
  uint64_t v13 = *(void *)(v6 + 32) + ((v7 + 16) & ~v7) + 7;
  unint64_t v14 = (unint64_t)v9 + v13;
  unint64_t v15 = ((unint64_t)v10 + v13) & 0xFFFFFFFFFFFFFFF8;
  char v16 = *(unsigned char *)(v15 + 8);
  v14 &= 0xFFFFFFFFFFFFFFF8;
  *(void *)unint64_t v14 = *(void *)v15;
  *(unsigned char *)(v14 + 8) = v16;
  return a1;
}

void *sub_25C9A2CE8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = (v9 | 7) + 16;
  int v11 = (void *)(((unint64_t)a1 + v10) & ~(v9 | 7));
  uint64_t v12 = (void *)(((unint64_t)a2 + v10) & ~(v9 | 7));
  *int v11 = *v12;
  swift_release();
  uint64_t v13 = (void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v14 = (void *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v13 = *v14;
  swift_release();
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 40))(((unint64_t)v13 + v9 + 8) & ~v9, ((unint64_t)v14 + v9 + 8) & ~v9, v7);
  uint64_t v15 = *(void *)(v8 + 64) + ((v9 + 16) & ~v9) + 7;
  unint64_t v16 = ((unint64_t)v11 + v15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v17 = ((unint64_t)v12 + v15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v18 = *(void *)v17;
  LOBYTE(v17) = *(unsigned char *)(v17 + 8);
  *(void *)unint64_t v16 = v18;
  *(unsigned char *)(v16 + 8) = v17;
  swift_release();
  return a1;
}

uint64_t sub_25C9A2E1C(unsigned __int8 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  if (v6 <= 0x7FFFFFFF) {
    int v7 = 0x7FFFFFFF;
  }
  else {
    int v7 = *(_DWORD *)(v5 + 84);
  }
  uint64_t v8 = *(unsigned __int8 *)(v5 + 80);
  if ((int)v6 >= 0) {
    unsigned int v9 = 0x7FFFFFFF;
  }
  else {
    unsigned int v9 = v7;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v10 = v8 | 7;
  if (v9 < a2)
  {
    unint64_t v11 = ((*(void *)(*(void *)(v4 - 8) + 64) + ((v8 + 16) & ~v8) + ((v8 + 16) & ~v10) + 7) & 0xFFFFFFFFFFFFFFF8)
        + 9;
    unsigned int v12 = (a2 - v9 + 255) >> (8 * v11);
    if (v11 < 4) {
      unsigned int v13 = v12 + 1;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v13 >= 0x10000) {
      unsigned int v14 = 4;
    }
    else {
      unsigned int v14 = 2;
    }
    if (v13 < 0x100) {
      unsigned int v14 = 1;
    }
    if (v13 >= 2) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = 0;
    }
    switch(v15)
    {
      case 1:
        int v16 = a1[v11];
        if (!a1[v11]) {
          break;
        }
        goto LABEL_25;
      case 2:
        int v16 = *(unsigned __int16 *)&a1[v11];
        if (*(_WORD *)&a1[v11]) {
          goto LABEL_25;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x25C9A2FB4);
      case 4:
        int v16 = *(_DWORD *)&a1[v11];
        if (!v16) {
          break;
        }
LABEL_25:
        int v18 = (v16 - 1) << (8 * v11);
        if (v11 >= 4) {
          int v18 = 0;
        }
        if (((*(_DWORD *)(*(void *)(v4 - 8) + 64)
             + ((v8 + 16) & ~v8)
             + ((v8 + 16) & ~v10)
             + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
          int v19 = *a1;
        else {
          int v19 = *(_DWORD *)a1;
        }
        return v9 + (v19 | v18) + 1;
      default:
        break;
    }
  }
  if (v9 != 0x7FFFFFFF) {
    return __swift_getEnumTagSinglePayload((v8 + ((((unint64_t)&a1[v10 + 16] & ~v10) + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v8, v6, v4);
  }
  unint64_t v20 = *((void *)a1 + 1);
  if (v20 >= 0xFFFFFFFF) {
    LODWORD(v20) = -1;
  }
  return (v20 + 1);
}

void sub_25C9A2FC8(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  if (v8 <= 0x7FFFFFFF) {
    unsigned int v9 = 0x7FFFFFFF;
  }
  else {
    unsigned int v9 = *(_DWORD *)(v7 + 84);
  }
  if ((int)v8 >= 0) {
    unsigned int v9 = 0x7FFFFFFF;
  }
  uint64_t v10 = *(unsigned __int8 *)(v7 + 80);
  size_t v11 = ((*(void *)(*(void *)(v6 - 8) + 64) + ((v10 + 16) & ~(v10 | 7)) + ((v10 + 16) & ~v10) + 7) & 0xFFFFFFFFFFFFFFF8)
      + 9;
  char v12 = 8 * v11;
  if (v9 >= a3)
  {
    int v16 = 0;
  }
  else
  {
    unsigned int v13 = (a3 - v9 + 255) >> v12;
    if (v11 <= 3) {
      unsigned int v14 = v13 + 1;
    }
    else {
      unsigned int v14 = 2;
    }
    if (v14 >= 0x10000) {
      int v15 = 4;
    }
    else {
      int v15 = 2;
    }
    if (v14 < 0x100) {
      int v15 = 1;
    }
    if (v14 >= 2) {
      int v16 = v15;
    }
    else {
      int v16 = 0;
    }
  }
  if (v9 < a2)
  {
    unsigned int v17 = (~v9 + a2) >> v12;
    if (v11 < 4) {
      int v18 = v17 + 1;
    }
    else {
      int v18 = 1;
    }
    if (v11 >= 4) {
      int v19 = ~v9 + a2;
    }
    else {
      int v19 = (~(_BYTE)v9 + a2);
    }
    bzero(a1, v11);
    if (v11 == 1) {
      *a1 = v19;
    }
    else {
      *(_DWORD *)a1 = v19;
    }
    switch(v16)
    {
      case 1:
        a1[v11] = v18;
        return;
      case 2:
        *(_WORD *)&a1[v11] = v18;
        return;
      case 3:
        goto LABEL_48;
      case 4:
        *(_DWORD *)&a1[v11] = v18;
        return;
      default:
        return;
    }
  }
  switch(v16)
  {
    case 1:
      a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_36;
    case 2:
      *(_WORD *)&a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_36;
    case 3:
LABEL_48:
      __break(1u);
      JUMPOUT(0x25C9A3204);
    case 4:
      *(_DWORD *)&a1[v11] = 0;
      goto LABEL_35;
    default:
LABEL_35:
      if (a2)
      {
LABEL_36:
        if (v9 == 0x7FFFFFFF)
        {
          if ((a2 & 0x80000000) != 0)
          {
            *(void *)a1 = a2 ^ 0x80000000;
            *((void *)a1 + 1) = 0;
          }
          else
          {
            *((void *)a1 + 1) = (a2 - 1);
          }
        }
        else
        {
          unint64_t v20 = (v10 + ((((unint64_t)&a1[(v10 | 7) + 16] & ~(v10 | 7)) + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v10;
          __swift_storeEnumTagSinglePayload(v20, a2, v8, v6);
        }
      }
      return;
  }
}

uint64_t type metadata accessor for _SnippetHostingView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for _SnippetHostingView);
}

uint64_t sub_25C9A3244()
{
  return swift_getWitnessTable();
}

uint64_t sub_25C9A3260@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void *a8@<X8>)
{
  *a8 = a1;
  a8[1] = a2;
  v15[0] = a4;
  v15[1] = a5;
  _OWORD v15[2] = a6;
  v15[3] = a7;
  uint64_t v10 = type metadata accessor for _SnippetHostingView(0, (uint64_t)v15);
  size_t v11 = (char *)a8 + *(int *)(v10 + 52);
  uint64_t v12 = sub_25C9B8090();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(v11, a3, v12);
  unsigned int v13 = (char *)a8 + *(int *)(v10 + 56);
  uint64_t result = swift_getKeyPath();
  *(void *)unsigned int v13 = result;
  v13[8] = 0;
  return result;
}

uint64_t sub_25C9A3320()
{
  uint64_t v0 = sub_25C9B8090();
  return MEMORY[0x261199B20](v0);
}

uint64_t sub_25C9A335C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6, v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  sub_25C9B8090();
  sub_25C9B8080();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(a1, v3);
}

uint64_t sub_25C9A3434(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F02710](a1, a2, a3, WitnessTable);
}

uint64_t sub_25C9A34B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F026D8](a1, a2, a3, WitnessTable);
}

void sub_25C9A352C()
{
}

id sub_25C9A356C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(a2 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](a1, a2);
  uint64_t v37 = v7;
  id v38 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v8 + 24);
  MEMORY[0x270FA5388](v6, v10);
  uint64_t v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A5DF6D0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_25C9B7C90();
  __swift_project_value_buffer(v13, (uint64_t)qword_26A5E0130);
  unsigned int v14 = sub_25C9B7C70();
  os_log_type_t v15 = sub_25C9B82D0();
  if (os_log_type_enabled(v14, v15))
  {
    int v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v16 = 0;
    _os_log_impl(&dword_25C989000, v14, v15, "_SnippetHostingView.makeUIViewController(_:context:)", v16, 2u);
    MEMORY[0x26119A890](v16, -1, -1);
  }

  uint64_t v17 = *(void *)(a2 + 24);
  uint64_t v34 = *(void *)(a2 + 32);
  uint64_t v18 = *(void *)(a2 + 40);
  v39[0] = v9;
  v39[1] = v17;
  v39[2] = v34;
  v39[3] = v18;
  uint64_t v19 = type metadata accessor for _SnippetHostingController(0, (uint64_t)v39);
  uint64_t v35 = *v3;
  uint64_t v36 = v19;
  uint64_t v33 = v9;
  uint64_t v20 = v3[1];
  swift_bridgeObjectRetain();
  sub_25C9A3320();
  uint64_t v21 = v38;
  (*(void (**)(char *, uint64_t *, uint64_t))(v5 + 16))(v38, v3, a2);
  unint64_t v22 = (*(unsigned __int8 *)(v5 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v23 = (char *)swift_allocObject();
  *((void *)v23 + 2) = v33;
  *((void *)v23 + 3) = v17;
  *((void *)v23 + 4) = v34;
  *((void *)v23 + 5) = v18;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v23[v22], v21, a2);
  id v24 = _SnippetHostingController.__allocating_init(bundleIdentifier:viewModel:onViewModelUpdate:)(v35, v20, (uint64_t)v12);
  char v25 = *((unsigned char *)v3 + *(int *)(a2 + 56) + 8);
  uint64_t v26 = swift_retain();
  uint64_t v27 = sub_25C9A3E88(v26, v25);
  swift_release();
  unint64_t v28 = sub_25C9A3964(v24);
  unint64_t v29 = (void *)(v27 + OBJC_IVAR____TtC15SiriInteractive21SnippetHostingContext_actionHandler);
  uint64_t v30 = *(void *)(v27 + OBJC_IVAR____TtC15SiriInteractive21SnippetHostingContext_actionHandler);
  *unint64_t v29 = v28;
  v29[1] = v31;
  sub_25C9984F4(v30);
  swift_release();
  return v24;
}

uint64_t sub_25C9A3874(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  MEMORY[0x270FA5388](a1, a1);
  uint64_t v11 = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v12 + 16))(v11);
  v15[0] = a3;
  v15[1] = a4;
  _OWORD v15[2] = a5;
  v15[3] = a6;
  uint64_t v13 = type metadata accessor for _SnippetHostingView(0, (uint64_t)v15);
  return sub_25C9A335C((uint64_t)v11, v13);
}

void (*sub_25C9A3964(void *a1))(void *a1)
{
  *(void *)(swift_allocObject() + 16) = a1;
  id v2 = a1;
  return sub_25C9A40C8;
}

uint64_t sub_25C9A39C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 16);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  uint64_t v8 = MEMORY[0x270FA5388](v6, v7);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8, v11);
  uint64_t v13 = (char *)&v21 - v12;
  if (qword_26A5DF6D0 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_25C9B7C90();
  __swift_project_value_buffer(v14, (uint64_t)qword_26A5E0130);
  os_log_type_t v15 = sub_25C9B7C70();
  os_log_type_t v16 = sub_25C9B82D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_25C989000, v15, v16, "SnippetHostView.updateUIViewController(_:context:)", v17, 2u);
    MEMORY[0x26119A890](v17, -1, -1);
  }

  sub_25C9A4218((uint64_t)v13);
  sub_25C9A3320();
  char v18 = sub_25C9B8130();
  uint64_t v19 = *(void (**)(char *, uint64_t))(v5 + 8);
  v19(v10, v3);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v19)(v13, v3);
  if ((v18 & 1) == 0)
  {
    sub_25C9A3320();
    return sub_25C9A4520();
  }
  return result;
}

uint64_t sub_25C9A3BB8()
{
  if (qword_26A5DF6D0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25C9B7C90();
  __swift_project_value_buffer(v0, (uint64_t)qword_26A5E0130);
  unint64_t v1 = sub_25C9B7C70();
  os_log_type_t v2 = sub_25C9B82D0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_25C989000, v1, v2, "SnippetHostView.dismantleUIViewController(_:coordinator:)", v3, 2u);
    MEMORY[0x26119A890](v3, -1, -1);
  }

  return sub_25C9A5928();
}

uint64_t sub_25C9A3CA8()
{
  long long v1 = *(_OWORD *)(v0 + 32);
  v8[0] = *(_OWORD *)(v0 + 16);
  uint64_t v7 = *(void *)&v8[0];
  v8[1] = v1;
  os_log_type_t v2 = (int *)(type metadata accessor for _SnippetHostingView(0, (uint64_t)v8) - 8);
  uint64_t v3 = v0
     + ((*(unsigned __int8 *)(*(void *)v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v2 + 80));
  swift_bridgeObjectRelease();
  uint64_t v4 = v3 + v2[15];
  swift_release();
  swift_release();
  uint64_t v5 = sub_25C9B8090();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v4 + *(int *)(v5 + 32), v7);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_25C9A3DDC(uint64_t a1)
{
  uint64_t v4 = v1[3];
  uint64_t v5 = v1[4];
  uint64_t v6 = v1[5];
  v10[0] = v1[2];
  uint64_t v3 = v10[0];
  v10[1] = v4;
  _OWORD v10[2] = v5;
  v10[3] = v6;
  uint64_t v7 = *(void *)(type metadata accessor for _SnippetHostingView(0, (uint64_t)v10) - 8);
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v7 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return sub_25C9A3874(a1, v8, v3, v4, v5, v6);
}

uint64_t sub_25C9A3E88(uint64_t a1, char a2)
{
  uint64_t v4 = sub_25C9B7EE0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if ((a2 & 1) == 0)
  {
    os_log_type_t v9 = sub_25C9B82C0();
    uint64_t v10 = sub_25C9B7FE0();
    os_log_type_t v11 = v9;
    if (os_log_type_enabled(v10, v9))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v16 = v13;
      *(_DWORD *)uint64_t v12 = 136315138;
      uint64_t v15 = sub_25C99F02C(0xD000000000000015, 0x800000025C9BBE80, &v16);
      sub_25C9B83F0();
      _os_log_impl(&dword_25C989000, v10, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26119A890](v13, -1, -1);
      MEMORY[0x26119A890](v12, -1, -1);
    }

    sub_25C9B7ED0();
    swift_getAtKeyPath();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    return v16;
  }
  return a1;
}

uint64_t sub_25C9A4090()
{
  return swift_deallocObject();
}

void sub_25C9A40C8(void *a1)
{
}

id _SnippetHostingController.__allocating_init(bundleIdentifier:viewModel:onViewModelUpdate:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  return _SnippetHostingController.init(bundleIdentifier:viewModel:onViewModelUpdate:)(a1, a2, a3);
}

uint64_t sub_25C9A4158(uint64_t a1)
{
  MEMORY[0x270FA5388](a1, a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v4 - v1);
  return sub_25C9A4520();
}

uint64_t sub_25C9A4218@<X0>(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_3_3();
  uint64_t v3 = *(void *)(v2 + 80);
  sub_25C9B83E0();
  OUTLINED_FUNCTION_0();
  v20[0] = v4;
  MEMORY[0x270FA5388](v5, v6);
  uint64_t v8 = (char *)v20 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03C0);
  MEMORY[0x270FA5388](v9 - 8, v10);
  uint64_t v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C9A485C();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03C8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13) == 1)
  {
    sub_25C9A69D0((uint64_t)v12, &qword_26A5E03C0);
    uint64_t v14 = 0;
    unint64_t v15 = 0xC000000000000000;
  }
  else
  {
    swift_getOpaqueTypeConformance2();
    sub_25C98CD20();
    uint64_t v14 = sub_25C9B7CD0();
    unint64_t v15 = v16;
    OUTLINED_FUNCTION_4_4();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v12, v13);
  }
  sub_25C9B7B60();
  swift_allocObject();
  sub_25C9B7B50();
  sub_25C9B7B40();
  swift_release();
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v3);
  sub_25C98EE60(v14, v15);
  OUTLINED_FUNCTION_4_4();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v18 + 32))(a1, v8, v3);
}

uint64_t sub_25C9A4520()
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03C0);
  MEMORY[0x270FA5388](v2 - 8, v3);
  OUTLINED_FUNCTION_5_3();
  sub_25C9A485C();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03C8);
  if (OUTLINED_FUNCTION_11_0(v4) == 1)
  {
    OUTLINED_FUNCTION_4_4();
    uint64_t v5 = OUTLINED_FUNCTION_12_0();
    v6(v5);
    return sub_25C9A69D0(v0, &qword_26A5E03C0);
  }
  else
  {
    sub_25C995A70();
    swift_getOpaqueTypeConformance2();
    sub_25C98CD20();
    sub_25C9B7CE0();
    OUTLINED_FUNCTION_4_4();
    uint64_t v8 = OUTLINED_FUNCTION_12_0();
    v9(v8);
    OUTLINED_FUNCTION_4_4();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v0, v1);
  }
}

void (*sub_25C9A46E8(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  *uint64_t v3 = v1;
  v3[1] = *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x50);
  OUTLINED_FUNCTION_0();
  *(void *)(v4 + 16) = v5;
  size_t v7 = *(void *)(v6 + 64);
  v3[3] = malloc(v7);
  uint64_t v8 = malloc(v7);
  v3[4] = v8;
  sub_25C9A4218((uint64_t)v8);
  return sub_25C9A47A8;
}

void sub_25C9A47A8(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(*(void *)a1 + 24);
  uint64_t v4 = *(void **)(*(void *)a1 + 32);
  if (a2)
  {
    uint64_t v5 = v2[1];
    uint64_t v6 = v2[2];
    (*(void (**)(void, void *, uint64_t))(v6 + 16))(*(void *)(*(void *)a1 + 24), v4, v5);
    sub_25C9A4520();
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    sub_25C9A4520();
  }
  free(v4);
  free(v3);
  free(v2);
}

void sub_25C9A485C()
{
}

void sub_25C9A4874()
{
}

void sub_25C9A488C(void (*a1)(void))
{
  uint64_t v2 = sub_25C9A48F4();
  if (v2)
  {
    id v3 = v2;
    a1();
  }
  else
  {
    __break(1u);
  }
}

void *sub_25C9A48F4()
{
  uint64_t v1 = *(void **)(v0 + qword_26A5E03D8);
  id v2 = v1;
  return v1;
}

uint64_t sub_25C9A4924(uint64_t a1)
{
  *(void *)(v1 + qword_26A5E03D8) = a1;
  return MEMORY[0x270F9A758]();
}

uint64_t sub_25C9A4938(uint64_t a1)
{
  *(void *)(v1 + qword_26A5E03E0) = a1;
  return swift_unknownObjectRelease();
}

uint64_t sub_25C9A4950()
{
  uint64_t v1 = *(void *)(v0 + qword_26A5E03E8);
  swift_retain();
  return v1;
}

id _SnippetHostingController.init(bundleIdentifier:viewModel:onViewModelUpdate:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_3_3();
  uint64_t v6 = v5;
  uint64_t v8 = *(void *)(v7 + 80);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v10, v11);
  uint64_t v13 = (char *)&v22 - v12;
  *(void *)&v3[qword_26A5E03D8] = 0;
  *(void *)&v3[qword_26A5E03E0] = 0;
  uint64_t v14 = &v3[qword_26A5E03E8];
  *(void *)uint64_t v14 = v15;
  *((void *)v14 + 1) = v16;
  uint64_t v18 = *(void *)(v17 + 104);
  swift_retain();
  uint64_t v22 = v8;
  long long v23 = *(_OWORD *)(v6 + 88);
  uint64_t v24 = v18;
  uint64_t v19 = (objc_class *)type metadata accessor for _SnippetHostingController(0, (uint64_t)&v22);
  v25.receiver = v3;
  v25.super_class = v19;
  id v20 = objc_msgSendSuper2(&v25, sel_initWithNibName_bundle_, 0, 0);
  sub_25C9A5D64();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v13, a3, v8);
  sub_25C9A4520();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a3, v8);
  return v20;
}

uint64_t type metadata accessor for _SnippetHostingController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for _SnippetHostingController);
}

void sub_25C9A4B7C()
{
  *(void *)&v0[qword_26A5E03D8] = 0;
  *(void *)&v0[qword_26A5E03E0] = 0;

  sub_25C9B8580();
  __break(1u);
}

void sub_25C9A4BF4(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  sub_25C9A4B7C();
}

id _SnippetHostingController.__deallocating_deinit()
{
  uint64_t v1 = v0;
  OUTLINED_FUNCTION_1_1();
  if (qword_26A5DF6C0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25C9B7C90();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A5E0100);
  id v3 = v0;
  uint64_t v4 = sub_25C9B7C70();
  os_log_type_t v5 = sub_25C9B82D0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)OUTLINED_FUNCTION_6_3();
    uint64_t v7 = (void *)OUTLINED_FUNCTION_5_4();
    *(_DWORD *)uint64_t v6 = 138543362;
    id v8 = v3;
    sub_25C9B83F0();
    *uint64_t v7 = v1;

    _os_log_impl(&dword_25C989000, v4, v5, "[%{public}@] Dealloc", v6, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_6();
    OUTLINED_FUNCTION_0_6();
  }
  else
  {
  }
  uint64_t v9 = OUTLINED_FUNCTION_13();
  v12.receiver = v3;
  v12.super_class = (Class)type metadata accessor for _SnippetHostingController(v9, v10);
  return objc_msgSendSuper2(&v12, sel_dealloc);
}

id sub_25C9A4DC4(void *a1)
{
  id v1 = a1;
  return _SnippetHostingController.__deallocating_deinit();
}

uint64_t sub_25C9A4DEC(uint64_t a1)
{
  swift_unknownObjectRelease();
  return swift_release();
}

id sub_25C9A4E4C(void *a1)
{
  id v3 = v1;
  OUTLINED_FUNCTION_1_1();
  long long v6 = *(_OWORD *)(v5 + 96);
  v20[0] = *(_OWORD *)(v5 + 80);
  v20[1] = v6;
  uint64_t v7 = (objc_class *)type metadata accessor for _SnippetHostingController(0, (uint64_t)v20);
  v21.receiver = v1;
  v21.super_class = v7;
  objc_msgSendSuper2(&v21, sel_preferredContentSizeDidChangeForChildContentContainer_, a1);
  if (qword_26A5DF6C0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_25C9B7C90();
  __swift_project_value_buffer(v8, (uint64_t)qword_26A5E0100);
  id v9 = v1;
  swift_unknownObjectRetain_n();
  id v10 = v9;
  uint64_t v11 = sub_25C9B7C70();
  os_log_type_t v12 = sub_25C9B82D0();
  if (OUTLINED_FUNCTION_9_3(v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v14 = (void *)OUTLINED_FUNCTION_5_4();
    *(void *)&v20[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 138543618;
    id v19 = v10;
    id v15 = v10;
    sub_25C9B83F0();
    *uint64_t v14 = v3;

    *(_WORD *)(v13 + 12) = 2080;
    objc_msgSend(a1, sel_preferredContentSize);
    uint64_t v16 = sub_25C9B8380();
    sub_25C99F02C(v16, v17, (uint64_t *)v20);
    sub_25C9B83F0();
    swift_unknownObjectRelease_n();
    id v10 = v19;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C989000, v11, v2, "[%{public}@] preferredContentSizeDidChange: %s", (uint8_t *)v13, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_6();
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_6();
    OUTLINED_FUNCTION_0_6();
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  objc_msgSend(a1, sel_preferredContentSize);
  return objc_msgSend(v10, sel_setPreferredContentSize_);
}

void sub_25C9A50D4(void *a1, uint64_t a2, void *a3)
{
  swift_unknownObjectRetain();
  id v5 = a1;
  sub_25C9A4E4C(a3);
  swift_unknownObjectRelease();
}

uint64_t sub_25C9A513C(char a1)
{
  id v3 = v1;
  id v5 = (void *)(*MEMORY[0x263F8EED0] & *v3);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F8);
  MEMORY[0x270FA5388](v6 - 8, v7);
  OUTLINED_FUNCTION_5_3();
  uint64_t v8 = v5[10];
  uint64_t v9 = v5[11];
  uint64_t v10 = v5[12];
  uint64_t v11 = v5[13];
  v19[0] = v8;
  v19[1] = v9;
  _OWORD v19[2] = v10;
  v19[3] = v11;
  os_log_type_t v12 = (objc_class *)type metadata accessor for _SnippetHostingController(0, (uint64_t)v19);
  v20.receiver = v3;
  v20.super_class = v12;
  objc_msgSendSuper2(&v20, sel_viewWillAppear_, a1 & 1);
  sub_25C9A4874();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E0400);
  if (OUTLINED_FUNCTION_11_0(v13) == 1)
  {
    sub_25C9A69D0(v2, &qword_26A5E03F8);
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v15 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v16 = (void *)swift_allocObject();
    _OWORD v16[2] = v8;
    v16[3] = v9;
    v16[4] = v10;
    v16[5] = v11;
    v16[6] = v15;
    swift_getOpaqueTypeConformance2();
    sub_25C98CD20();
    uint64_t v14 = sub_25C9B7CB0();
    swift_release();
    OUTLINED_FUNCTION_4_4();
    (*(void (**)(uint64_t, void *))(v17 + 8))(v2, v5);
  }
  return sub_25C9A4938(v14);
}

void sub_25C9A5374(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint8_t *a6)
{
  uint64_t v43 = a6;
  uint64_t v8 = sub_25C9B83E0();
  uint64_t v10 = MEMORY[0x270FA5388](v8, v9);
  os_log_type_t v12 = (char *)&v41 - v11;
  uint64_t v13 = *(void *)(a3 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v10, v14);
  uint64_t v17 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15, v18);
  objc_super v20 = (char *)&v41 - v19;
  swift_beginAccess();
  uint64_t v44 = MEMORY[0x26119A970](a2 + 16);
  if (v44)
  {
    uint64_t v41 = v13;
    uint64_t v42 = v20;
    sub_25C9B7B60();
    swift_allocObject();
    sub_25C9B7B50();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E04F0);
    sub_25C9B7CA0();
    uint64_t v22 = (uint64_t)v45;
    unint64_t v21 = v46;
    sub_25C9B7B40();
    swift_release();
    sub_25C98EE60(v22, v21);
    __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, a3);
    uint64_t v24 = v41;
    long long v23 = v42;
    (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v42, v12, a3);
    objc_super v25 = (void *)v44;
    sub_25C9A4218((uint64_t)v17);
    char v26 = sub_25C9B8130();
    unint64_t v29 = *(void (**)(char *, uint64_t))(v24 + 8);
    uint64_t v27 = v24 + 8;
    unint64_t v28 = v29;
    v29(v17, a3);
    if (v26)
    {
      v28(v23, a3);
    }
    else
    {
      if (qword_26A5DF6B8 != -1) {
        swift_once();
      }
      uint64_t v30 = sub_25C9B7C90();
      __swift_project_value_buffer(v30, (uint64_t)qword_26A5E00E8);
      uint64_t v31 = v25;
      uint64_t v32 = sub_25C9B7C70();
      os_log_type_t v33 = sub_25C9B82D0();
      if (os_log_type_enabled(v32, v33))
      {
        uint64_t v41 = v27;
        uint64_t v34 = (uint8_t *)swift_slowAlloc();
        uint64_t v35 = (void *)swift_slowAlloc();
        uint64_t v43 = v34;
        *(_DWORD *)uint64_t v34 = 138543362;
        id v45 = v31;
        uint64_t v36 = v31;
        sub_25C9B83F0();
        uint64_t v37 = v35;
        *uint64_t v35 = v44;

        id v38 = v43;
        _os_log_impl(&dword_25C989000, v32, v33, "[%{public}@] Host received a new value from client", v43, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
        swift_arrayDestroy();
        MEMORY[0x26119A890](v37, -1, -1);
        MEMORY[0x26119A890](v38, -1, -1);
      }
      else
      {

        uint64_t v32 = v31;
      }

      uint64_t v39 = (void (*)(char *))sub_25C9A4950();
      uint64_t v40 = v42;
      v39(v42);

      swift_release();
      v28(v40, a3);
    }
  }
}

void sub_25C9A5810(void *a1, uint64_t a2, char a3)
{
  id v4 = a1;
  sub_25C9A513C(a3);
}

uint64_t sub_25C9A5864(char a1)
{
  OUTLINED_FUNCTION_1_1();
  long long v4 = *(_OWORD *)(v3 + 96);
  v7[0] = *(_OWORD *)(v3 + 80);
  v7[1] = v4;
  id v5 = (objc_class *)type metadata accessor for _SnippetHostingController(0, (uint64_t)v7);
  v8.receiver = v1;
  v8.super_class = v5;
  objc_msgSendSuper2(&v8, sel_viewWillDisappear_, a1 & 1);
  return sub_25C9A4938(0);
}

void sub_25C9A58D4(void *a1, uint64_t a2, char a3)
{
  id v4 = a1;
  sub_25C9A5864(a3);
}

void sub_25C9A592C(void *a1)
{
  uint64_t v3 = v1;
  OUTLINED_FUNCTION_1_1();
  if (qword_26A5DF6C0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_25C9B7C90();
  __swift_project_value_buffer(v5, (uint64_t)qword_26A5E0100);
  id v6 = v1;
  uint64_t v7 = sub_25C9B7C70();
  os_log_type_t v8 = sub_25C9B82D0();
  if (OUTLINED_FUNCTION_9_3(v8))
  {
    uint64_t v9 = (uint8_t *)OUTLINED_FUNCTION_6_3();
    uint64_t v19 = (void *)OUTLINED_FUNCTION_5_4();
    *(_DWORD *)uint64_t v9 = 138543362;
    v20[0] = (uint64_t)v6;
    id v10 = v6;
    sub_25C9B83F0();
    void *v19 = v3;

    _os_log_impl(&dword_25C989000, v7, v2, "[%{public}@] Sending action to client", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_6();
    OUTLINED_FUNCTION_0_6();
  }
  else
  {
  }
  uint64_t v11 = OUTLINED_FUNCTION_13();
  type metadata accessor for SnippetHostingAction.HostToClient(v11, v12);
  uint64_t v13 = a1[3];
  uint64_t v14 = a1[5];
  __swift_project_boxed_opaque_existential_0(a1, v13);
  v20[3] = v13;
  v20[4] = v14;
  __swift_allocate_boxed_opaque_existential_2(v20);
  OUTLINED_FUNCTION_4_4();
  (*(void (**)(void))(v15 + 16))();
  id v16 = sub_25C98E4AC(v20);
  uint64_t v17 = sub_25C9A48F4();
  if (v17)
  {
    uint64_t v18 = v17;
    objc_msgSend(v17, sel_sendAction_, v16);
  }
  else
  {
    __break(1u);
  }
}

void sub_25C9A5B60()
{
  os_log_type_t v2 = v0;
  if (qword_26A5DF6B8 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_25C9B7C90();
  __swift_project_value_buffer(v3, (uint64_t)qword_26A5E00E8);
  id v4 = v0;
  uint64_t v5 = sub_25C9B7C70();
  os_log_type_t v6 = sub_25C9B82D0();
  if (OUTLINED_FUNCTION_9_3(v6))
  {
    uint64_t v7 = (uint8_t *)OUTLINED_FUNCTION_6_3();
    os_log_type_t v8 = (void *)OUTLINED_FUNCTION_5_4();
    *(_DWORD *)uint64_t v7 = 138543362;
    id v9 = v4;
    sub_25C9B83F0();
    *os_log_type_t v8 = v2;

    _os_log_impl(&dword_25C989000, v5, v1, "[%{public}@] Host received action from Client", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_6();
    OUTLINED_FUNCTION_0_6();
  }
  else
  {
  }
  id v10 = objc_msgSend(self, sel_defaultCenter);
  if (qword_26A5DF688 != -1) {
    swift_once();
  }
  uint64_t v11 = qword_26A5DFAE8;
  uint64_t v12 = (void *)sub_25C9B7C20();
  objc_msgSend(v10, sel_postNotificationName_object_, v11, v12);

  OUTLINED_FUNCTION_8_2();
}

void sub_25C9A5D64()
{
  os_log_type_t v1 = v0;
  os_log_type_t v2 = sub_25C9A48F4();

  if (v2) {
    return;
  }
  if (qword_26A5DF6C0 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_25C9B7C90();
  __swift_project_value_buffer(v3, (uint64_t)qword_26A5E0100);
  id v4 = v1;
  uint64_t v5 = sub_25C9B7C70();
  os_log_type_t v6 = sub_25C9B82D0();
  uint64_t v7 = (void *)v6;
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v8 = (uint8_t *)OUTLINED_FUNCTION_6_3();
    id v9 = (void *)OUTLINED_FUNCTION_5_4();
    *(_DWORD *)os_log_type_t v8 = 138543362;
    id v10 = v4;
    sub_25C9B83F0();
    void *v9 = v1;

    _os_log_impl(&dword_25C989000, v5, (os_log_type_t)v7, "[%{public}@] Creating snippet scene", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_6();
    OUTLINED_FUNCTION_0_6();
  }
  else
  {
  }
  sub_25C9950BC(0, &qword_26A5E04F8);
  swift_bridgeObjectRetain();
  id v11 = sub_25C9A6410();
  sub_25C9950BC(0, (unint64_t *)&unk_26A5E0500);
  id v12 = objc_allocWithZone((Class)type metadata accessor for SceneHostingSpecification());
  id v13 = v11;
  id v14 = sub_25C9A64A8(v13, objc_msgSend(v12, sel_init));
  sub_25C9A4924((uint64_t)v14);
  uint64_t v15 = sub_25C9A48F4();
  if (!v15)
  {
    __break(1u);
    goto LABEL_21;
  }
  id v16 = v15;
  objc_msgSend(v15, sel_setDelegate_, v4);

  uint64_t v17 = sub_25C9A48F4();
  if (!v17)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v18 = v17;
  uint64_t v19 = objc_msgSend(v17, sel_sceneViewController);

  objc_msgSend(v4, sel_addChildViewController_, v19);
  id v20 = [v19 view];
  if (!v20)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v21 = v20;
  id v22 = objc_msgSend(v4, sel_view);
  if (!v22)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  long long v23 = v22;
  objc_msgSend(v22, sel_addSubview_, v21);

  objc_msgSend(v21, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFE38);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_25C9B9C20;
  id v25 = objc_msgSend(v21, sel_leadingAnchor);
  id v26 = OUTLINED_FUNCTION_10_2();
  if (!v26)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v27 = v26;
  id v28 = objc_msgSend(v26, sel_leadingAnchor);

  id v29 = objc_msgSend(v7, sel_constraintEqualToAnchor_, v28);
  *(void *)(v24 + 32) = v29;
  id v30 = objc_msgSend(v21, sel_trailingAnchor);
  id v31 = OUTLINED_FUNCTION_10_2();
  if (!v31)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v32 = v31;
  id v54 = v13;
  id v33 = objc_msgSend(v31, sel_trailingAnchor);

  id v34 = objc_msgSend(v7, sel_constraintEqualToAnchor_, v33);
  *(void *)(v24 + 40) = v34;
  id v35 = objc_msgSend(v21, sel_topAnchor);
  id v36 = OUTLINED_FUNCTION_10_2();
  if (!v36)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v37 = v36;
  id v38 = objc_msgSend(v36, sel_topAnchor);

  id v39 = objc_msgSend(v7, sel_constraintEqualToAnchor_, v38);
  *(void *)(v24 + 48) = v39;
  id v40 = objc_msgSend(v21, sel_bottomAnchor);
  id v41 = objc_msgSend(v4, sel_view);
  if (!v41)
  {
LABEL_27:
    __break(1u);
    return;
  }
  uint64_t v42 = v41;
  uint64_t v43 = self;
  id v44 = objc_msgSend(v42, sel_bottomAnchor);

  id v45 = objc_msgSend(v40, sel_constraintEqualToAnchor_, v44);
  *(void *)(v24 + 56) = v45;
  sub_25C9B81E0();
  sub_25C9950BC(0, (unint64_t *)&qword_26A5E0510);
  unint64_t v46 = (void *)sub_25C9B81B0();
  swift_bridgeObjectRelease();
  objc_msgSend(v43, sel_activateConstraints_, v46);

  [v19 didMoveToParentViewController:v4];
  uint64_t v47 = v4;
  uint64_t v48 = sub_25C9B7C70();
  os_log_type_t v49 = sub_25C9B82D0();
  if (os_log_type_enabled(v48, v49))
  {
    uint64_t v50 = (uint8_t *)swift_slowAlloc();
    long long v51 = (void *)OUTLINED_FUNCTION_5_4();
    *(_DWORD *)uint64_t v50 = 138543362;
    long long v52 = v47;
    sub_25C9B83F0();
    void *v51 = v1;

    _os_log_impl(&dword_25C989000, v48, v49, "[%{public}@] Snippet scene did move to parent", v50, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_6();
    OUTLINED_FUNCTION_0_6();
    uint64_t v53 = v54;
  }
  else
  {

    uint64_t v53 = v21;
    uint64_t v48 = v47;
    uint64_t v19 = v47;
    unint64_t v21 = v54;
  }
}

id sub_25C9A6410()
{
  uint64_t v0 = (void *)sub_25C9B8140();
  swift_bridgeObjectRelease();
  id v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_identityForEmbeddedApplicationIdentifier_, v0);

  return v1;
}

id SceneHostingSpecification.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id sub_25C9A64A8(void *a1, void *a2)
{
  id v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithProcessIdentity_sceneSpecification_, a1, a2);

  return v4;
}

void sub_25C9A6504()
{
  uint64_t v0 = sub_25C9A48F4();
  if (v0)
  {
    id v1 = v0;
    id v4 = objc_msgSend(v0, sel_sceneViewController);
    objc_msgSend(v4, sel_willMoveToParentViewController_, 0);
    id v2 = objc_msgSend(v4, sel_view);
    if (v2)
    {
      uint64_t v3 = v2;
      objc_msgSend(v2, sel_removeFromSuperview);

      objc_msgSend(v4, sel_removeFromParentViewController);
      sub_25C9A4924(0);
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_25C9A65DC()
{
  id v1 = v0;
  if (qword_26A5DF6C0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25C9B7C90();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A5E0100);
  id v10 = v0;
  uint64_t v3 = sub_25C9B7C70();
  os_log_type_t v4 = sub_25C9B82D0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v6 = (void *)OUTLINED_FUNCTION_5_4();
    *(_DWORD *)uint64_t v5 = 138543362;
    id v7 = v10;
    sub_25C9B83F0();
    *os_log_type_t v6 = v1;

    _os_log_impl(&dword_25C989000, v3, v4, "[%{public}@] clientIsReady", v5, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_6();
    OUTLINED_FUNCTION_0_6();

    OUTLINED_FUNCTION_8_2();
  }
  else
  {

    OUTLINED_FUNCTION_8_2();
  }
}

void sub_25C9A677C(void *a1)
{
  id v1 = a1;
  sub_25C9A65DC();
}

id _SnippetHostingController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  os_log_type_t v4 = v3;
  if (a2)
  {
    os_log_type_t v6 = (void *)sub_25C9B8140();
    swift_bridgeObjectRelease();
  }
  else
  {
    os_log_type_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void _SnippetHostingController.init(nibName:bundle:)()
{
}

void sub_25C9A686C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3) {
    sub_25C9B8150();
  }
  id v5 = a4;
  _SnippetHostingController.init(nibName:bundle:)();
}

id sub_25C9A68D8()
{
  if (qword_26A5DF698 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26A5DFDE0;
  return v0;
}

id SceneHostingSpecification.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneHostingSpecification();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SceneHostingSpecification.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneHostingSpecification();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

double sub_25C9A69C0@<D0>(_OWORD *a1@<X8>)
{
  double result = 0.0;
  *a1 = xmmword_25C9BA7A0;
  return result;
}

uint64_t sub_25C9A69D0(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_4_4();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_25C9A6A28()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_25C9A6A60()
{
  swift_release();
  return swift_deallocObject();
}

void sub_25C9A6A98(uint64_t a1)
{
  sub_25C9A5374(a1, *(void *)(v1 + 48), *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(uint8_t **)(v1 + 40));
}

uint64_t type metadata accessor for SceneHostingSpecification()
{
  return self;
}

uint64_t sub_25C9A6ACC@<X0>(uint64_t a1@<X8>)
{
  return sub_25C9A4218(a1);
}

uint64_t sub_25C9A6AF4()
{
  return 32;
}

__n128 sub_25C9A6B00(uint64_t a1, _OWORD *a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t sub_25C9A6B0C()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for _SnippetHostingController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for _SnippetHostingController);
}

uint64_t dispatch thunk of _SnippetHostingController.viewModel.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of _SnippetHostingController.viewModel.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of _SnippetHostingController.viewModel.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of _SnippetHostingController.__allocating_init(bundleIdentifier:viewModel:onViewModelUpdate:)()
{
  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t dispatch thunk of _SnippetHostingController.invalidate()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of _SnippetHostingController.sendAction(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of _SnippetHostingController.clientIsReady()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x128))();
}

ValueMetadata *type metadata accessor for DataModelKey()
{
  return &type metadata for DataModelKey;
}

uint64_t OUTLINED_FUNCTION_5_4()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  return swift_slowAlloc();
}

BOOL OUTLINED_FUNCTION_9_3(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

id OUTLINED_FUNCTION_10_2()
{
  return [v0 (SEL)(v1 + 1944)];
}

uint64_t OUTLINED_FUNCTION_11_0(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(v1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_13()
{
  return 0;
}

BOOL sub_25C9A6DDC(int a1, int a2)
{
  return a1 == a2;
}

BOOL sub_25C9A6DE8(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_25C9A6DF4(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000010;
  unint64_t v3 = (unint64_t)"_scene";
  unint64_t v4 = 0x800000025C9BABC0;
  uint64_t v5 = a1;
  unint64_t v6 = 0xD000000000000010;
  switch(v5)
  {
    case 1:
      OUTLINED_FUNCTION_53();
      unint64_t v6 = 0x6E6F43776569765FLL;
      break;
    case 2:
      break;
    case 3:
      unint64_t v4 = 0xE500000000000000;
      unint64_t v6 = 0x776569765FLL;
      break;
    default:
      unint64_t v4 = 0xE600000000000000;
      unint64_t v6 = 0x656E6563735FLL;
      break;
  }
  unint64_t v7 = v3 | 0x8000000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0xEF72656C6C6F7274;
      unint64_t v2 = 0x6E6F43776569765FLL;
      break;
    case 2:
      break;
    case 3:
      unint64_t v7 = 0xE500000000000000;
      unint64_t v2 = 0x776569765FLL;
      break;
    default:
      unint64_t v7 = 0xE600000000000000;
      unint64_t v2 = 0x656E6563735FLL;
      break;
  }
  if (v6 == v2 && v4 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_25C9B85F0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_25C9A6F64()
{
  return sub_25C9B86D0();
}

uint64_t sub_25C9A6FAC(char a1)
{
  sub_25C9B86A0();
  sub_25C9A708C((uint64_t)v3, a1);
  return sub_25C9B86D0();
}

uint64_t sub_25C9A6FF4()
{
  return sub_25C9B86D0();
}

uint64_t sub_25C9A703C()
{
  return sub_25C9B86C0();
}

uint64_t sub_25C9A7064()
{
  return sub_25C9B86B0();
}

uint64_t sub_25C9A708C(uint64_t a1, char a2)
{
  switch(a2)
  {
    case 1:
      OUTLINED_FUNCTION_53();
      break;
    default:
      break;
  }
  sub_25C9B8170();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C9A7150(uint64_t a1, char a2)
{
  sub_25C9B86A0();
  sub_25C9A708C((uint64_t)v4, a2);
  return sub_25C9B86D0();
}

uint64_t sub_25C9A7194()
{
  return sub_25C9B86D0();
}

uint64_t sub_25C9A71D8()
{
  return sub_25C9B86D0();
}

uint64_t sub_25C9A721C(uint64_t a1, unint64_t a2)
{
  return sub_25C9A72F4(a1, a2, &qword_26A5DFFD8);
}

uint64_t sub_25C9A7228(uint64_t a1)
{
  id v3 = objc_msgSend(v1, sel_otherSettings);
  if (a1)
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E0040);
    uint64_t v4 = sub_25C9B8610();
  }
  else
  {
    uint64_t v4 = 0;
  }
  OUTLINED_FUNCTION_1_4();
  objc_msgSend(v3, sel_setObject_forSetting_, v4, qword_26A5E0008);
  swift_bridgeObjectRelease();

  return swift_unknownObjectRelease();
}

void sub_25C9A72E8(void *a1)
{
}

uint64_t sub_25C9A72F4(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v5 = v3;
  id v8 = objc_msgSend(v5, sel_otherSettings);
  if (a2 >> 60 == 15)
  {
    uint64_t v9 = 0;
  }
  else
  {
    sub_25C992884(a1, a2);
    uint64_t v9 = sub_25C9B8610();
  }
  OUTLINED_FUNCTION_1_4();
  objc_msgSend(v8, sel_setObject_forSetting_, v9, *a3);

  swift_unknownObjectRelease();
  return sub_25C992200(a1, a2);
}

void sub_25C9A73C8(void *a1, void *a2)
{
  id v5 = objc_msgSend(v2, sel_otherSettings);
  OUTLINED_FUNCTION_1_4();
  objc_msgSend(v5, sel_setObject_forSetting_, a1, *a2);
}

NSObject *SnippetHostViewController.__allocating_init<A>(bundleIdentifier:viewModel:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v15 = objc_allocWithZone(v7);
  return SnippetHostViewController.init<A>(bundleIdentifier:viewModel:)(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_25C9A74F4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_delegate;
  OUTLINED_FUNCTION_1_4();
  return MEMORY[0x26119A970](v1);
}

uint64_t sub_25C9A7598()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_25C9A75E4()
{
  return sub_25C9A7598();
}

void (*sub_25C9A7610(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_delegate;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  OUTLINED_FUNCTION_15();
  v3[3] = MEMORY[0x26119A970](v5);
  return sub_25C9A768C;
}

void sub_25C9A768C(void **a1, char a2)
{
  id v3 = *a1;
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

uint64_t SnippetHostViewController.PresentationMode.description.getter(unsigned int a1)
{
  if (a1 < 3) {
    return *(void *)&aNone[8 * a1];
  }
  uint64_t result = sub_25C9B8600();
  __break(1u);
  return result;
}

unint64_t SnippetHostViewController.PresentationMode.init(rawValue:)(unsigned int a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = 2;
  if (a1 != 2) {
    uint64_t v2 = 0;
  }
  BOOL v3 = a1 != 2;
  if (a1 == 1) {
    BOOL v3 = 0;
  }
  else {
    uint64_t v1 = v2;
  }
  if (!a1)
  {
    uint64_t v1 = 0;
    BOOL v3 = 0;
  }
  return v1 | ((unint64_t)v3 << 32);
}

BOOL sub_25C9A77BC(int *a1, int *a2)
{
  return sub_25C9A6DDC(*a1, *a2);
}

uint64_t sub_25C9A77C8()
{
  return sub_25C9A6FF4();
}

uint64_t sub_25C9A77D0()
{
  return sub_25C9A703C();
}

uint64_t sub_25C9A77D8()
{
  return sub_25C9A71D8();
}

unint64_t sub_25C9A77E0@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = SnippetHostViewController.PresentationMode.init(rawValue:)(*a1);
  *(_DWORD *)a2 = result;
  *(unsigned char *)(a2 + 4) = BYTE4(result) & 1;
  return result;
}

void sub_25C9A7814(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_25C9A7820()
{
  return SnippetHostViewController.PresentationMode.description.getter(*v0);
}

uint64_t sub_25C9A784C()
{
  return *(unsigned int *)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController__presentationMode);
}

void sub_25C9A78B0(unsigned int a1)
{
  BSDispatchQueueAssertMain();
  sub_25C9AD284(a1, 0);
}

void (*sub_25C9A78EC(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(v1 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController__presentationMode);
  return sub_25C9A7920;
}

void sub_25C9A7920(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(a1 + 8);
  BSDispatchQueueAssertMain();
  sub_25C9AD284(v1, 0);
}

void *sub_25C9A7988()
{
  unsigned int v1 = (void **)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_resolvedMetrics);
  OUTLINED_FUNCTION_1_4();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_25C9A7A2C(void *a1)
{
  OUTLINED_FUNCTION_40();
  id v3 = *v1;
  *unsigned int v1 = a1;
  id v4 = a1;

  BSDispatchQueueAssertMain();
  sub_25C9AF650();
}

void sub_25C9A7A88(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_25C9A7A2C(v1);
}

uint64_t sub_25C9A7B14()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25C9A7BC8(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_activityTouchRestrictedRects);
  OUTLINED_FUNCTION_1_5();
  *id v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C9A7C0C()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_25C9A7BC8(v0);
}

id sub_25C9A7C6C()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_systemProvidedMetrics);
  OUTLINED_FUNCTION_1_4();
  id v2 = *v1;
  return v2;
}

void sub_25C9A7D18(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_systemProvidedMetrics);
  OUTLINED_FUNCTION_1_5();
  id v4 = *v3;
  *id v3 = a1;
}

void sub_25C9A7D5C(id *a1)
{
}

uint64_t (*sub_25C9A7D88())()
{
  return j__swift_endAccess;
}

id sub_25C9A7DDC()
{
  sub_25C9950BC(0, &qword_26A5E07F8);
  id result = sub_25C9AA980();
  qword_26A5E0520 = (uint64_t)result;
  return result;
}

uint64_t sub_25C9A7E38(uint64_t a1)
{
  return OUTLINED_FUNCTION_4_1(a1, OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene);
}

uint64_t sub_25C9A7E44(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scenePresenter) = a1;
  return swift_unknownObjectRelease();
}

uint64_t sub_25C9A7E5C(uint64_t a1)
{
  return OUTLINED_FUNCTION_4_1(a1, OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_activatedSceneView);
}

uint64_t sub_25C9A7E68(uint64_t a1)
{
  return OUTLINED_FUNCTION_4_1(a1, OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_snippetSceneSnapshotView);
}

uint64_t sub_25C9A7E74()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController____lazy_storage___logIdentifier);
  if (*(void *)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController____lazy_storage___logIdentifier + 8))
  {
    uint64_t v2 = *v1;
  }
  else
  {
    uint64_t v2 = sub_25C9A7EF0();
    *uint64_t v1 = v2;
    v1[1] = v3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_25C9A7EF0()
{
  return 0;
}

id sub_25C9A7F94()
{
  uint64_t v1 = OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController____lazy_storage___queue;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController____lazy_storage___queue);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController____lazy_storage___queue);
  }
  else
  {
    id v4 = (void *)sub_25C9A7FF8();
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t sub_25C9A7FF8()
{
  uint64_t v10 = sub_25C9B8310();
  uint64_t v0 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10, v1);
  id v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25C9B82F0();
  MEMORY[0x270FA5388](v4, v5);
  uint64_t v6 = sub_25C9B80C0();
  MEMORY[0x270FA5388](v6 - 8, v7);
  v9[1] = sub_25C9950BC(0, &qword_26A5E0630);
  sub_25C9A7E74();
  sub_25C9B80B0();
  uint64_t v11 = MEMORY[0x263F8EE78];
  sub_25C9B5E60(&qword_26A5E0820, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E0828);
  sub_25C9B5FC0(&qword_26A5E0830, &qword_26A5E0828);
  sub_25C9B8420();
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v3, *MEMORY[0x263F8F130], v10);
  return sub_25C9B8340();
}

uint64_t sub_25C9A8244(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_backOffTimer) = a1;
  return swift_release();
}

uint64_t sub_25C9A825C(uint64_t a1)
{
  return OUTLINED_FUNCTION_4_1(a1, OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_ensureContentTimer);
}

uint64_t sub_25C9A8268(uint64_t a1)
{
  return OUTLINED_FUNCTION_4_1(a1, OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneClientExitTimer);
}

uint64_t sub_25C9A8274(uint64_t a1)
{
  return OUTLINED_FUNCTION_4_1(a1, OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_modalSceneViewController);
}

void sub_25C9A8280()
{
  uint64_t v1 = v0;
  BSDispatchQueueAssertMain();
  if (qword_26A5DF6C0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25C9B7C90();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A5E0100);
  id v3 = sub_25C9B7C70();
  os_log_type_t v4 = sub_25C9B82A0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_25C989000, v3, v4, "Host didSet wrappedValue and about to forward to client.", v5, 2u);
    MEMORY[0x26119A890](v5, -1, -1);
  }

  uint64_t v6 = *(void **)&v1[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene];
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v1;
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = sub_25C9B62A8;
    *(void *)(v8 + 24) = v7;
    v13[4] = sub_25C9B6BAC;
    v13[5] = v8;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 1107296256;
    v13[2] = sub_25C9A8598;
    void v13[3] = &block_descriptor_202;
    uint64_t v9 = _Block_copy(v13);
    id v10 = v6;
    uint64_t v11 = v1;
    swift_retain();
    swift_release();
    objc_msgSend(v10, sel_performUpdate_, v9);

    _Block_release(v9);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    if (isEscapingClosureAtFileLocation) {
      __break(1u);
    }
  }
}

uint64_t sub_25C9A84A8(void *a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for LiveMutableSceneSettings();
  uint64_t result = swift_dynamicCastClass();
  if (result)
  {
    uint64_t v6 = a3 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_viewModel;
    swift_beginAccess();
    sub_25C9B539C(v6, (uint64_t)v11);
    __swift_project_boxed_opaque_existential_0(v11, v11[3]);
    id v7 = a1;
    uint64_t v8 = sub_25C995A70();
    unint64_t v10 = v9;
    sub_25C992884(v8, v9);
    sub_25C9A72F4(v8, v10, &qword_26A5E0280);
    sub_25C98EE60(v8, v10);

    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  }
  return result;
}

void sub_25C9A8598(uint64_t a1, void *a2, void *a3)
{
  os_log_type_t v4 = *(void (**)(id, id))(a1 + 32);
  id v6 = a2;
  id v5 = a3;
  v4(v6, v5);
}

NSObject *SnippetHostViewController.init<A>(bundleIdentifier:viewModel:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  swift_unknownObjectWeakInit();
  *(_DWORD *)&v7[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController__presentationMode] = 0;
  *(void *)&v7[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_resolvedMetrics] = 0;
  uint64_t v12 = MEMORY[0x263F8EE78];
  *(void *)&v7[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_activityTouchRestrictedRects] = MEMORY[0x263F8EE78];
  uint64_t v13 = OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_settingsDiffInspector;
  id v14 = objc_allocWithZone((Class)type metadata accessor for SnippetSceneClientSettingsDiffInspector());
  id v15 = v7;
  *(void *)&v7[v13] = objc_msgSend(v14, sel_init);
  *(void *)&v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene] = 0;
  *(void *)&v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scenePresenter] = 0;
  *(void *)&v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_activatedSceneView] = 0;
  *(void *)&v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_snippetSceneSnapshotView] = 0;
  v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_isInvalidated] = 0;
  v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_isSceneForeground] = 0;
  v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_waitingForArchiveContentReady] = 0;
  *(void *)&v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_waitingForArchiveContentReadyBlocks] = v12;
  v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneActivated] = 0;
  *(void *)&v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneActivatedBlocks] = v12;
  uint64_t v16 = OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_touchDeliveryPolicyAssertions;
  sub_25C9950BC(0, &qword_26A5E05B0);
  *(void *)&v15[v16] = sub_25C9B80F0();
  uint64_t v17 = &v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController____lazy_storage___logIdentifier];
  *(void *)uint64_t v17 = 0;
  *((void *)v17 + 1) = 0;
  *(void *)&v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController____lazy_storage___queue] = 0;
  *(void *)&v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_backOffTimer] = 0;
  *(void *)&v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_ensureContentTimer] = 0;
  v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneClientAlreadyExitedOnceWithinTimeout] = 0;
  *(void *)&v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneClientExitTimer] = 0;
  *(void *)&v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneClientExitTimeout] = 0x4014000000000000;
  if ((v12 & 0xC000000000000000) != 0 && sub_25C9B8590()) {
    unint64_t v18 = sub_25C994DD8(MEMORY[0x263F8EE78]);
  }
  else {
    unint64_t v18 = MEMORY[0x263F8EE88];
  }
  uint64_t v20 = a5;
  uint64_t v19 = a6;
  *(void *)&v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_cancellables] = v18;
  *(void *)&v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_modalSceneViewController] = 0;
  uint64_t v21 = OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneSpecification;
  *(void *)&v15[v21] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SnippetSceneSpecification()), sel_init);
  v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_shouldShareTouchesWithHost] = 0;
  id v22 = &v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_processIdentity];
  *(void *)id v22 = a1;
  *((void *)v22 + 1) = a2;
  type metadata accessor for SceneItemMetricsRequest();
  id v23 = sub_25C996718();
  uint64_t v24 = (objc_class *)type metadata accessor for SceneMetricsRequest();
  id v25 = (char *)objc_allocWithZone(v24);
  *(void *)&v25[OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics] = v23;
  v47.receiver = v25;
  v47.super_class = v24;
  *(void *)&v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_systemProvidedMetrics] = objc_msgSendSuper2(&v47, sel_init);
  uint64_t v44 = a4;
  uint64_t v45 = a5;
  uint64_t v46 = a6;
  __swift_allocate_boxed_opaque_existential_2((uint64_t *)&v43);
  OUTLINED_FUNCTION_51();
  MEMORY[0x261199B20]();
  sub_25C9AD8B8(&v43, &v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_viewModel]);

  v42.receiver = v15;
  v42.super_class = (Class)type metadata accessor for SnippetHostViewController();
  id v26 = objc_msgSendSuper2(&v42, sel_initWithNibName_bundle_, 0, 0);
  uint64_t v27 = qword_26A5DF6C0;
  id v28 = v26;
  if (v27 != -1) {
    swift_once();
  }
  uint64_t v29 = sub_25C9B7C90();
  __swift_project_value_buffer(v29, (uint64_t)qword_26A5E0100);
  id v30 = v28;
  id v31 = sub_25C9B7C70();
  os_log_type_t v32 = sub_25C9B82D0();
  if (os_log_type_enabled(v31, v32))
  {
    id v33 = (uint8_t *)OUTLINED_FUNCTION_7_3();
    uint64_t v37 = (void *)OUTLINED_FUNCTION_5_4();
    *(_DWORD *)id v33 = 138543362;
    *(void *)&long long v43 = v30;
    uint64_t v38 = a7;
    id v34 = v30;
    uint64_t v20 = a5;
    sub_25C9B83F0();
    *uint64_t v37 = v30;

    a7 = v38;
    _os_log_impl(&dword_25C989000, v31, v32, "[%{public}@] Created", v33, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_6();
    uint64_t v19 = a6;
    OUTLINED_FUNCTION_0_6();
  }
  else
  {

    id v31 = v30;
  }

  sub_25C9ABC48(a3, a4, v20, v19, a7);
  OUTLINED_FUNCTION_16();
  v35();
  return v30;
}

void sub_25C9A8AD4()
{
  swift_unknownObjectWeakInit();
  *(_DWORD *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController__presentationMode] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_resolvedMetrics] = 0;
  uint64_t v1 = MEMORY[0x263F8EE78];
  *(void *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_activityTouchRestrictedRects] = MEMORY[0x263F8EE78];
  uint64_t v2 = OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_settingsDiffInspector;
  *(void *)&v0[v2] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SnippetSceneClientSettingsDiffInspector()), sel_init);
  *(void *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scenePresenter] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_activatedSceneView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_snippetSceneSnapshotView] = 0;
  v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_isInvalidated] = 0;
  v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_isSceneForeground] = 0;
  v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_waitingForArchiveContentReady] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_waitingForArchiveContentReadyBlocks] = v1;
  v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneActivated] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneActivatedBlocks] = v1;
  uint64_t v3 = OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_touchDeliveryPolicyAssertions;
  sub_25C9950BC(0, &qword_26A5E05B0);
  *(void *)&v0[v3] = sub_25C9B80F0();
  os_log_type_t v4 = &v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController____lazy_storage___logIdentifier];
  *os_log_type_t v4 = 0;
  v4[1] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController____lazy_storage___queue] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_backOffTimer] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_ensureContentTimer] = 0;
  v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneClientAlreadyExitedOnceWithinTimeout] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneClientExitTimer] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneClientExitTimeout] = 0x4014000000000000;
  if ((v1 & 0xC000000000000000) != 0 && sub_25C9B8590()) {
    unint64_t v5 = sub_25C994DD8(MEMORY[0x263F8EE78]);
  }
  else {
    unint64_t v5 = MEMORY[0x263F8EE88];
  }
  *(void *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_cancellables] = v5;
  *(void *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_modalSceneViewController] = 0;
  uint64_t v6 = OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneSpecification;
  *(void *)&v0[v6] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SnippetSceneSpecification()), sel_init);
  v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_shouldShareTouchesWithHost] = 0;

  sub_25C9B8580();
  __break(1u);
}

void SnippetHostViewController.__deallocating_deinit()
{
  OUTLINED_FUNCTION_31();
  uint64_t v12 = v2;
  uint64_t v13 = v3;
  if (qword_26A5DF6C0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25C9B7C90();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A5E0100);
  unint64_t v5 = v0;
  uint64_t v6 = (void *)sub_25C9B7C70();
  os_log_type_t v7 = sub_25C9B82D0();
  if (OUTLINED_FUNCTION_30(v7))
  {
    OUTLINED_FUNCTION_7_3();
    uint64_t v8 = (void *)OUTLINED_FUNCTION_5_4();
    OUTLINED_FUNCTION_20(5.8381e-34);
    OUTLINED_FUNCTION_14();
    *uint64_t v8 = v5;

    OUTLINED_FUNCTION_42(&dword_25C989000, v9, v10, "[%{public}@] Dealloc");
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_0_6();
    OUTLINED_FUNCTION_0_6();
  }
  else
  {
  }
  objc_msgSend(*(id *)&v5[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_settingsDiffInspector], sel_removeAllObservers);
  sub_25C9AAB7C();
  v11.receiver = v5;
  v11.super_class = (Class)type metadata accessor for SnippetHostViewController();
  objc_msgSendSuper2(&v11, sel_dealloc);
  OUTLINED_FUNCTION_41();
}

void sub_25C9A9050()
{
  uint64_t v1 = v0;
  BSDispatchQueueAssertMain();
  v15.receiver = v0;
  v15.super_class = (Class)type metadata accessor for SnippetHostViewController();
  objc_msgSendSuper2(&v15, sel_viewDidLoad);
  sub_25C9B0A74();
  id v2 = objc_msgSend(v0, sel_view);
  if (v2)
  {
    uint64_t v3 = v2;
    objc_msgSend(v2, sel_frame);

    uint64_t v4 = (objc_class *)type metadata accessor for SizeDimensionRequest();
    id v5 = objc_allocWithZone(v4);
    OUTLINED_FUNCTION_48();
    id v6 = objc_allocWithZone(v4);
    OUTLINED_FUNCTION_50();
    id v7 = objc_msgSend(v1, sel_view);
    if (v7)
    {
      uint64_t v8 = v7;
      objc_msgSend(v7, sel__cornerRadius);

      id v9 = objc_allocWithZone((Class)type metadata accessor for SceneItemMetricsRequest());
      id v10 = OUTLINED_FUNCTION_28();
      objc_super v11 = (objc_class *)type metadata accessor for SceneMetricsRequest();
      uint64_t v12 = (char *)objc_allocWithZone(v11);
      *(void *)&v12[OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics] = v10;
      v14.receiver = v12;
      v14.super_class = v11;
      id v13 = objc_msgSendSuper2(&v14, sel_init);
      sub_25C9A7D18(v13);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_25C9A91DC(char a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SnippetHostViewController();
  objc_msgSendSuper2(&v5, sel_viewWillAppear_, a1 & 1);
  uint64_t v3 = OUTLINED_FUNCTION_12_1();
  swift_unknownObjectWeakInit();
  sub_25C9AF3FC((uint64_t)sub_25C9B40A4, v3);
  return swift_release();
}

void sub_25C9A9260(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a3 + 16;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x26119A970](v4);
  if (v5)
  {
    id v6 = (void *)v5;
    type metadata accessor for LiveMutableSceneSettings();
    uint64_t v7 = swift_dynamicCastClass();
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      id v9 = a1;
      id v10 = objc_msgSend(v6, sel_traitCollection);
      id v11 = objc_msgSend(v10, sel_userInterfaceStyle);

      objc_msgSend(v8, sel_setUserInterfaceStyle_, v11);
      id v6 = v9;
    }
  }
}

uint64_t sub_25C9A9390(uint64_t a1, uint64_t a2)
{
  BSDispatchQueueAssertMain();
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for SnippetHostViewController();
  objc_msgSendSuper2(&v7, sel_willTransitionToTraitCollection_withTransitionCoordinator_, a1, a2);
  v6[2] = a1;
  return sub_25C9AF3FC((uint64_t)sub_25C9B40AC, (uint64_t)v6);
}

void sub_25C9A9408(void *a1, uint64_t a2, void *a3)
{
  type metadata accessor for LiveMutableSceneSettings();
  uint64_t v5 = swift_dynamicCastClass();
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = a1;
    objc_msgSend(v6, sel_setUserInterfaceStyle_, objc_msgSend(a3, sel_userInterfaceStyle));
  }
}

void sub_25C9A952C(uint64_t a1, char a2)
{
  BSDispatchQueueAssertMain();
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for SnippetHostViewController();
  objc_msgSendSuper2(&v6, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a1, a2 & 1);
  uint64_t v5 = &v2[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_shouldShareTouchesWithHost];
  OUTLINED_FUNCTION_1_4();
  if (*v5 == 1)
  {
    if (a1) {
      sub_25C9AFD24();
    }
    else {
      sub_25C9B08D8();
    }
  }
}

void sub_25C9A962C()
{
  uint64_t v1 = v0;
  v15.receiver = v0;
  v15.super_class = (Class)type metadata accessor for SnippetHostViewController();
  objc_msgSendSuper2(&v15, sel_viewDidLayoutSubviews);
  id v2 = objc_msgSend(v0, sel_view);
  if (v2)
  {
    uint64_t v3 = v2;
    objc_msgSend(v2, sel_frame);

    uint64_t v4 = (objc_class *)type metadata accessor for SizeDimensionRequest();
    id v5 = objc_allocWithZone(v4);
    OUTLINED_FUNCTION_48();
    id v6 = objc_allocWithZone(v4);
    OUTLINED_FUNCTION_50();
    id v7 = objc_msgSend(v1, sel_view);
    if (v7)
    {
      uint64_t v8 = v7;
      objc_msgSend(v7, sel__cornerRadius);

      id v9 = objc_allocWithZone((Class)type metadata accessor for SceneItemMetricsRequest());
      id v10 = OUTLINED_FUNCTION_28();
      id v11 = (objc_class *)type metadata accessor for SceneMetricsRequest();
      uint64_t v12 = (char *)objc_allocWithZone(v11);
      *(void *)&v12[OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics] = v10;
      v14.receiver = v12;
      v14.super_class = v11;
      id v13 = objc_msgSendSuper2(&v14, sel_init);
      sub_25C9A7D18(v13);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_25C9A97B0(uint64_t a1)
{
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for SnippetHostViewController();
  objc_msgSendSuper2(&v6, sel_traitCollectionDidChange_, a1);
  id v5 = v1;
  return sub_25C9AF3FC((uint64_t)sub_25C9B40B4, (uint64_t)&v4);
}

void sub_25C9A9814(void *a1, uint64_t a2, void *a3)
{
  type metadata accessor for LiveMutableSceneSettings();
  uint64_t v5 = swift_dynamicCastClass();
  if (v5)
  {
    objc_super v6 = (void *)v5;
    id v9 = a1;
    id v7 = objc_msgSend(a3, sel_traitCollection);
    id v8 = objc_msgSend(v7, sel_userInterfaceStyle);

    objc_msgSend(v6, sel_setUserInterfaceStyle_, v8);
  }
}

void sub_25C9A9950()
{
  algn_26A5E0928[7] = -18;
}

void sub_25C9A9980(void *a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t ObjectType = swift_getObjectType();
  BSDispatchQueueAssertMain();
  if (qword_26A5DF6C0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_25C9B7C90();
  uint64_t v9 = __swift_project_value_buffer(v8, (uint64_t)qword_26A5E0100);
  id v10 = v4;
  id v11 = sub_25C9B7C70();
  os_log_type_t v12 = sub_25C9B82D0();
  if (os_log_type_enabled(v11, v12))
  {
    id v13 = (uint8_t *)OUTLINED_FUNCTION_7_3();
    uint64_t v51 = v9;
    objc_super v14 = (void *)OUTLINED_FUNCTION_5_4();
    *(_DWORD *)id v13 = 138543362;
    aBlock = v10;
    objc_super v15 = v10;
    sub_25C9B83F0();
    *objc_super v14 = v10;

    _os_log_impl(&dword_25C989000, v11, v12, "[%{public}@] Ensure content begin", v13, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_6();
    OUTLINED_FUNCTION_0_6();
  }
  else
  {
  }
  if (!*(Class *)((char *)&v10->isa + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene)) {
    sub_25C9AD284(*(_DWORD *)((char *)&v10->isa + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController__presentationMode), 1);
  }
  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29CF8]), sel_init);
  if (qword_26A5DF6E8 != -1) {
    swift_once();
  }
  uint64_t v17 = qword_26A5E0920;
  uint64_t v18 = *(void *)algn_26A5E0928;
  swift_bridgeObjectRetain();
  sub_25C9B5238(v17, v18, v16);
  swift_bridgeObjectRelease();
  uint64_t v19 = (void *)swift_allocObject();
  _OWORD v19[2] = v16;
  v19[3] = a1;
  void v19[4] = v10;
  v19[5] = a2;
  v19[6] = a3;
  uint64_t v58 = sub_25C9B52D8;
  uint64_t v59 = v19;
  aBlock = MEMORY[0x263EF8330];
  uint64_t v55 = 1107296256;
  uint64_t v56 = sub_25C9AA72C;
  uint64_t v57 = &block_descriptor_4;
  uint64_t v20 = _Block_copy(&aBlock);
  uint64_t v21 = v10;
  id v22 = v16;
  id v23 = a1;
  swift_retain();
  swift_release();
  objc_msgSend(v22, sel_setCompletionBlock_, v20);
  _Block_release(v20);
  LODWORD(v20) = v21[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneActivated];
  uint64_t v24 = v21;
  id v25 = sub_25C9B7C70();
  os_log_type_t v26 = sub_25C9B82D0();
  BOOL v27 = os_log_type_enabled(v25, v26);
  if (v20 == 1)
  {
    if (v27)
    {
      id v28 = (uint8_t *)OUTLINED_FUNCTION_7_3();
      uint64_t v29 = (void *)OUTLINED_FUNCTION_5_4();
      *(_DWORD *)id v28 = 138543362;
      aBlock = v24;
      id v30 = v24;
      OUTLINED_FUNCTION_43();
      *uint64_t v29 = v24;

      _os_log_impl(&dword_25C989000, v25, v26, "[%{public}@] Ensure content: scene activated", v28, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
      OUTLINED_FUNCTION_27();
      OUTLINED_FUNCTION_0_6();
      OUTLINED_FUNCTION_0_6();
    }
    else
    {

      id v25 = v24;
    }

    uint64_t v34 = qword_26A5E0920;
    uint64_t v35 = *(void *)algn_26A5E0928;
    swift_bridgeObjectRetain();
    sub_25C9B5344(v34, v35, v22);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (v27)
    {
      id v31 = (uint8_t *)OUTLINED_FUNCTION_7_3();
      os_log_type_t v32 = (void *)OUTLINED_FUNCTION_5_4();
      *(_DWORD *)id v31 = 138543362;
      aBlock = v24;
      id v33 = v24;
      OUTLINED_FUNCTION_43();
      *os_log_type_t v32 = v24;

      _os_log_impl(&dword_25C989000, v25, v26, "[%{public}@] Ensure content: waiting on scene activation", v31, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0_6();
      OUTLINED_FUNCTION_0_6();
    }
    else
    {

      id v25 = v24;
    }

    id v36 = (void *)swift_allocObject();
    v36[2] = v24;
    v36[3] = v22;
    v36[4] = ObjectType;
    uint64_t v37 = (char *)v24 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneActivatedBlocks;
    OUTLINED_FUNCTION_15();
    uint64_t v38 = v24;
    id v39 = v22;
    sub_25C9B3BD4();
    id v40 = *(char **)(*(void *)v37 + 16);
    sub_25C9B3C20(v40);
    uint64_t v41 = *(void *)v37;
    *(void *)(v41 + 16) = v40 + 1;
    uint64_t v42 = v41 + 16 * (void)v40;
    *(void *)(v42 + 32) = sub_25C9B5330;
    *(void *)(v42 + 40) = v36;
    swift_endAccess();
  }
  objc_msgSend(v22, sel_begin, v51);
  uint64_t v43 = OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_ensureContentTimer;
  objc_msgSend(*(id *)((char *)&v24->isa + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_ensureContentTimer), sel_invalidate);
  sub_25C9950BC(0, &qword_26A5E0628);
  id v44 = sub_25C9AA980();
  sub_25C9A825C((uint64_t)v44);
  uint64_t v45 = *(Class *)((char *)&v24->isa + v43);
  if (v45)
  {
    sub_25C9950BC(0, &qword_26A5E0630);
    id v46 = v45;
    uint64_t v47 = sub_25C9B8320();
    uint64_t v48 = OUTLINED_FUNCTION_12_1();
    *(void *)(v48 + 16) = v22;
    uint64_t v58 = sub_25C9B533C;
    uint64_t v59 = (void *)v48;
    aBlock = MEMORY[0x263EF8330];
    uint64_t v55 = 1107296256;
    uint64_t v56 = sub_25C99C188;
    uint64_t v57 = &block_descriptor_12;
    os_log_type_t v49 = _Block_copy(&aBlock);
    id v50 = v22;
    swift_release();
    objc_msgSend(v46, sel_scheduleWithFireInterval_leewayInterval_queue_handler_, v47, v49, a4, 0.0);

    _Block_release(v49);
    id v22 = (id)v47;
  }
}

uint64_t sub_25C9AA05C(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v27 = a3;
  uint64_t v10 = sub_25C9B80A0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10, v12);
  objc_super v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_25C9B80C0();
  uint64_t v15 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26, v16);
  uint64_t v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v19 = objc_msgSend(a2, sel_error);
  uint64_t v20 = (void *)swift_allocObject();
  _OWORD v20[2] = v19;
  v20[3] = a4;
  v20[4] = a5;
  v20[5] = a6;
  aBlock[4] = sub_25C9B62FC;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25C9AA728;
  aBlock[3] = &block_descriptor_208;
  uint64_t v21 = _Block_copy(aBlock);
  id v22 = v19;
  id v23 = a4;
  swift_retain();
  sub_25C9B80B0();
  uint64_t v28 = MEMORY[0x263F8EE78];
  sub_25C9B5E60(&qword_26A5E0800, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E0808);
  sub_25C9B5FC0(&qword_26A5E0810, &qword_26A5E0808);
  sub_25C9B8420();
  MEMORY[0x261199DE0](0, v18, v14, v21);
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v26);
  return swift_release();
}

uint64_t sub_25C9AA340(void *a1, void *a2, uint64_t (*a3)(void *))
{
  if (a1)
  {
    if (qword_26A5DF6C0 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_25C9B7C90();
    __swift_project_value_buffer(v6, (uint64_t)qword_26A5E0100);
    id v7 = a2;
    id v8 = a1;
    id v9 = v7;
    id v10 = a1;
    uint64_t v11 = sub_25C9B7C70();
    os_log_type_t v12 = sub_25C9B82D0();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      objc_super v14 = (void *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      uint64_t v26 = v25;
      *(_DWORD *)uint64_t v13 = 138543618;
      id v15 = v9;
      sub_25C9B83F0();
      *objc_super v14 = v9;

      *(_WORD *)(v13 + 12) = 2082;
      swift_getErrorValue();
      uint64_t v16 = sub_25C9B8640();
      sub_25C99F02C(v16, v17, &v26);
      sub_25C9B83F0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_25C989000, v11, v12, "[%{public}@] Ensure content failed: %{public}s", (uint8_t *)v13, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
      swift_arrayDestroy();
      MEMORY[0x26119A890](v14, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x26119A890](v25, -1, -1);
      MEMORY[0x26119A890](v13, -1, -1);
    }
    else
    {
    }
  }
  else
  {
    if (qword_26A5DF6C0 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_25C9B7C90();
    __swift_project_value_buffer(v18, (uint64_t)qword_26A5E0100);
    uint64_t v11 = a2;
    id v19 = sub_25C9B7C70();
    os_log_type_t v20 = sub_25C9B82D0();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      id v22 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v21 = 138543362;
      uint64_t v26 = (uint64_t)v11;
      id v23 = v11;
      sub_25C9B83F0();
      void *v22 = v11;

      _os_log_impl(&dword_25C989000, v19, v20, "[%{public}@] Ensure content complete", v21, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
      swift_arrayDestroy();
      MEMORY[0x26119A890](v22, -1, -1);
      MEMORY[0x26119A890](v21, -1, -1);

      return a3(0);
    }
  }
  return a3(a1);
}

uint64_t sub_25C9AA72C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_25C9AA780(void *a1, void *a2)
{
  if (qword_26A5DF6C0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25C9B7C90();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A5E0100);
  id v5 = a1;
  uint64_t v6 = sub_25C9B7C70();
  os_log_type_t v7 = sub_25C9B82D0();
  if (os_log_type_enabled(v6, v7))
  {
    id v8 = (uint8_t *)swift_slowAlloc();
    id v9 = (void *)swift_slowAlloc();
    *(_DWORD *)id v8 = 138543362;
    id v10 = v5;
    sub_25C9B83F0();
    void *v9 = v5;

    _os_log_impl(&dword_25C989000, v6, v7, "[%{public}@] Ensure content: scene activated", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
    swift_arrayDestroy();
    MEMORY[0x26119A890](v9, -1, -1);
    MEMORY[0x26119A890](v8, -1, -1);
  }
  else
  {
  }
  if (qword_26A5DF6E8 != -1) {
    swift_once();
  }
  uint64_t v11 = qword_26A5E0920;
  uint64_t v12 = *(void *)algn_26A5E0928;
  swift_bridgeObjectRetain();
  sub_25C9B5344(v11, v12, a2);
  return swift_bridgeObjectRelease();
}

id sub_25C9AA980()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  OUTLINED_FUNCTION_23();
  uint64_t v1 = (void *)sub_25C9B8140();
  swift_bridgeObjectRelease();
  id v2 = (void *)OUTLINED_FUNCTION_52();
  id v4 = [v2 v3];

  return v4;
}

id sub_25C9AA9EC(void *a1, id a2)
{
  if ((objc_msgSend(a2, sel_isComplete) & 1) == 0) {
    sub_25C9B5400(0x756F2064656D6974, 0xE900000000000074, a2, (SEL *)&selRef_failWithReason_);
  }
  return objc_msgSend(a1, sel_invalidate);
}

void sub_25C9AAB18(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_25C9B7BD0();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

void sub_25C9AAB7C()
{
  OUTLINED_FUNCTION_31();
  uint64_t v1 = v0;
  BSDispatchQueueAssertMain();
  uint64_t v2 = OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_isInvalidated;
  if ((v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_isInvalidated] & 1) == 0)
  {
    if (qword_26A5DF6C0 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_25C9B7C90();
    __swift_project_value_buffer(v3, (uint64_t)qword_26A5E0100);
    id v4 = v0;
    id v5 = sub_25C9B7C70();
    os_log_type_t v6 = sub_25C9B82D0();
    if (os_log_type_enabled(v5, v6))
    {
      os_log_type_t v7 = (uint8_t *)OUTLINED_FUNCTION_7_3();
      uint64_t v10 = v2;
      id v8 = (void *)OUTLINED_FUNCTION_5_4();
      *(_DWORD *)os_log_type_t v7 = 138543362;
      id v9 = v4;
      OUTLINED_FUNCTION_43();
      *id v8 = v4;

      _os_log_impl(&dword_25C989000, v5, v6, "[%{public}@] Invalidated", v7, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
      OUTLINED_FUNCTION_27();
      uint64_t v2 = v10;
      OUTLINED_FUNCTION_0_6();
      OUTLINED_FUNCTION_0_6();
    }
    else
    {
    }
    OUTLINED_FUNCTION_1_5();
    swift_unknownObjectWeakAssign();
    v1[v2] = 1;
    sub_25C9AF560();
    if (*(void *)&v4[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_backOffTimer])
    {
      swift_retain();
      sub_25C99C1F0();
      swift_release();
    }
    sub_25C9A8244(0);
    objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_ensureContentTimer], sel_invalidate);
    sub_25C9A825C(0);
    objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneClientExitTimer], sel_invalidate);
    sub_25C9A8268(0);
  }
  OUTLINED_FUNCTION_41();
}

uint64_t sub_25C9AAE30()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController__presentationMode;
  int v3 = *(_DWORD *)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController__presentationMode);
  if (v3 == 1)
  {
    sub_25C9B84C0();
    swift_bridgeObjectRelease();
    os_log_type_t v6 = *(void **)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_activatedSceneView);
    if (v6)
    {
      id v7 = objc_msgSend(v6, sel_description, 0xD000000000000014, 0x800000025C9BC060);
      sub_25C9B8150();
    }
    OUTLINED_FUNCTION_25();
    swift_bridgeObjectRelease();
  }
  else if (v3 == 2)
  {
    sub_25C9B84C0();
    swift_bridgeObjectRelease();
    id v4 = *(void **)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_snippetSceneSnapshotView);
    if (v4)
    {
      id v5 = objc_msgSend(v4, sel_description, 0xD000000000000012, 0x800000025C9BC080);
      sub_25C9B8150();
    }
    OUTLINED_FUNCTION_25();
    swift_bridgeObjectRelease();
    sub_25C9B8180();
  }
  sub_25C9B84C0();
  sub_25C9B8180();
  SnippetHostViewController.PresentationMode.description.getter(*(_DWORD *)(v1 + v2));
  sub_25C9B8180();
  swift_bridgeObjectRelease();
  sub_25C9B8180();
  sub_25C9B8180();
  swift_bridgeObjectRelease();
  sub_25C9B8180();
  id v8 = *(void **)(v1 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scenePresenter);
  if (v8)
  {
    id v9 = objc_msgSend(v8, sel_description);
    sub_25C9B8150();
  }
  sub_25C9B8180();
  swift_bridgeObjectRelease();
  sub_25C9B8180();
  OUTLINED_FUNCTION_25();
  swift_bridgeObjectRelease();
  sub_25C9B8180();
  uint64_t v10 = *(void **)(v1 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene);
  if (v10)
  {
    id v11 = objc_msgSend(v10, sel_description);
    sub_25C9B8150();
  }
  sub_25C9B8180();
  swift_bridgeObjectRelease();
  sub_25C9B8180();
  return 0;
}

uint64_t sub_25C9AB1AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v79[0] = a5;
  uint64_t v86 = a4;
  uint64_t v84 = a3;
  OUTLINED_FUNCTION_0();
  uint64_t v88 = v8;
  MEMORY[0x270FA5388](v9, v10);
  OUTLINED_FUNCTION_4_3();
  uint64_t v87 = v12 - v11;
  uint64_t v13 = sub_25C9B83E0();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  OUTLINED_FUNCTION_0();
  v79[1] = v15;
  MEMORY[0x270FA5388](v16, v17);
  id v19 = (char *)v79 - v18;
  OUTLINED_FUNCTION_0();
  uint64_t v21 = v20;
  MEMORY[0x270FA5388](v22, v23);
  OUTLINED_FUNCTION_35();
  uint64_t v89 = v24 - v25;
  uint64_t v28 = MEMORY[0x270FA5388](v26, v27);
  id v30 = (char *)v79 - v29;
  MEMORY[0x270FA5388](v28, v31);
  id v33 = (char *)v79 - v32;
  uint64_t v85 = v5;
  uint64_t v34 = v5 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_viewModel;
  OUTLINED_FUNCTION_1_4();
  sub_25C9B539C(v34, (uint64_t)v90);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E0638);
  int v35 = swift_dynamicCast();
  __swift_storeEnumTagSinglePayload((uint64_t)v33, v35 ^ 1u, 1, a2);
  uint64_t v36 = v88;
  uint64_t v37 = *(void *)(v88 + 16);
  uint64_t v82 = v88 + 16;
  uint64_t v83 = a1;
  uint64_t v81 = v37;
  OUTLINED_FUNCTION_4();
  v40(v38, v39);
  __swift_storeEnumTagSinglePayload((uint64_t)v30, 0, 1, a2);
  uint64_t v80 = TupleTypeMetadata2;
  uint64_t v41 = (uint64_t)&v19[*(int *)(TupleTypeMetadata2 + 48)];
  uint64_t v42 = *(void (**)(uint64_t, uint64_t))(v21 + 16);
  OUTLINED_FUNCTION_26();
  v42(v43, v44);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_26();
  v42(v45, v46);
  OUTLINED_FUNCTION_45((uint64_t)v19);
  if (v57)
  {
    uint64_t v47 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
    OUTLINED_FUNCTION_6_4();
    v47(v48, v49);
    OUTLINED_FUNCTION_45(v41);
    if (v57)
    {
      OUTLINED_FUNCTION_6_4();
      v47(v50, v51);
      OUTLINED_FUNCTION_6_4();
      return ((uint64_t (*)(uint64_t, uint64_t))v47)(v52, v53);
    }
    goto LABEL_9;
  }
  OUTLINED_FUNCTION_26();
  v42(v55, v56);
  OUTLINED_FUNCTION_45(v41);
  if (v57)
  {
    uint64_t v47 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
    OUTLINED_FUNCTION_6_4();
    v47(v58, v59);
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v89, a2);
LABEL_9:
    OUTLINED_FUNCTION_16();
    v62(v60, v61);
    v47((uint64_t)v33, v13);
LABEL_11:
    uint64_t v75 = v87;
    OUTLINED_FUNCTION_4();
    v78(v76, v77);
    return sub_25C9B546C(v75, v85, a2, v84, v86);
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 32))(v87, v41, a2);
  LODWORD(v80) = sub_25C9B8130();
  uint64_t v63 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
  OUTLINED_FUNCTION_44();
  v63(v64, v65);
  uint64_t v66 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
  OUTLINED_FUNCTION_6_4();
  v66(v67, v68);
  OUTLINED_FUNCTION_44();
  v63(v69, v70);
  OUTLINED_FUNCTION_6_4();
  v66(v71, v72);
  OUTLINED_FUNCTION_6_4();
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))v66)(v73, v74);
  if ((v80 & 1) == 0) {
    goto LABEL_11;
  }
  return result;
}

uint64_t sub_25C9AB5B8()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_shouldShareTouchesWithHost);
  OUTLINED_FUNCTION_1_4();
  return *v1;
}

void sub_25C9AB64C(char a1)
{
  OUTLINED_FUNCTION_40();
  *uint64_t v1 = a1;
  sub_25C9AB690();
}

void sub_25C9AB690()
{
  BSDispatchQueueAssertMain();
  uint64_t v1 = (unsigned char *)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_shouldShareTouchesWithHost);
  swift_beginAccess();
  if (*v1 == 1) {
    sub_25C9AFD24();
  }
  else {
    sub_25C9B08D8();
  }
}

void (*sub_25C9AB6F0(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  OUTLINED_FUNCTION_15();
  return sub_25C9AB748;
}

void sub_25C9AB748(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_25C9AB690();
  }
}

void sub_25C9AB77C()
{
  OUTLINED_FUNCTION_32();
  uint64_t v39 = v1;
  uint64_t v40 = v2;
  sub_25C9B7C00();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3, v4);
  OUTLINED_FUNCTION_5_3();
  BSDispatchQueueAssertMain();
  uint64_t v5 = OUTLINED_FUNCTION_12_1();
  *(void *)(v5 + 16) = v0;
  uint64_t v37 = sub_25C9B551C;
  uint64_t v38 = v5;
  *(void *)&long long v34 = MEMORY[0x263EF8330];
  *((void *)&v34 + 1) = 1107296256;
  int v35 = sub_25C9ABB98;
  uint64_t v36 = &block_descriptor_18;
  os_log_type_t v6 = _Block_copy(&v34);
  id v7 = v0;
  swift_release();
  id v8 = (id)BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler();
  _Block_release(v6);
  id v9 = objc_msgSend(v7, sel_view);
  if (!v9)
  {
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v10 = v9;
  id v11 = objc_msgSend(v9, sel_window);

  if (!v11) {
    goto LABEL_17;
  }
  if (!v8)
  {

LABEL_18:
    OUTLINED_FUNCTION_33();
    return;
  }
  uint64_t v12 = *(void **)&v7[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene];
  if (!v12)
  {

LABEL_17:
    swift_unknownObjectRelease();
    goto LABEL_18;
  }
  uint64_t v13 = (void *)*MEMORY[0x263F83300];
  if (*MEMORY[0x263F83300])
  {
    swift_unknownObjectRetain();
    id v14 = v12;
    id v30 = v11;
    objc_msgSend(v13, sel__initialTouchTimestampForWindow_, v11);
    double v16 = v15;
    uint64_t v29 = v14;
    id v17 = objc_msgSend(v14, sel_layerManager);
    id v18 = objc_msgSend(v17, sel_layers);

    uint64_t v33 = MEMORY[0x263F8EE78];
    uint64_t v28 = v18;
    sub_25C9B8290();
    sub_25C9B7BF0();
    while (v36)
    {
      sub_25C992214(&v34, &v32);
      sub_25C9950BC(0, (unint64_t *)&unk_26A5E0640);
      if (swift_dynamicCast())
      {
        id v19 = objc_msgSend(v31, sel_contextID, v28);
        id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F298B8]), sel_init);
        id v21 = objc_msgSend(self, sel_policyCancelingTouchesDeliveredToContextId_withInitialTouchTimestamp_, v19, v16);
        uint64_t v22 = v21;
        if (v21)
        {
          id v23 = v21;
          objc_msgSend(v23, sel_setAssertionEndpoint_, objc_msgSend(v20, sel_endpoint));

          swift_unknownObjectRelease();
        }
        objc_msgSend(v8, sel_ipc_addPolicy_, v22);
        id v24 = v20;
        MEMORY[0x261199C50]();
        if (*(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_25C9B81F0();
        }
        sub_25C9B8200();
        sub_25C9B81E0();
      }
      sub_25C9B7BF0();
    }
    OUTLINED_FUNCTION_16();
    v25();
    id v26 = objc_allocWithZone((Class)type metadata accessor for SceneCancelTouchAssertion());
    uint64_t v27 = OUTLINED_FUNCTION_49();
    sub_25C98EF18(v27);

    swift_unknownObjectRelease_n();
    goto LABEL_18;
  }
LABEL_20:
  __break(1u);
}

void sub_25C9ABB98(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_25C9ABC48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v39 = a4;
  uint64_t v40 = a5;
  uint64_t v37 = a2;
  uint64_t v38 = a3;
  uint64_t v36 = a1;
  uint64_t v7 = sub_25C9B8090();
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10, v11);
  uint64_t v13 = (char *)&v36 - v12;
  uint64_t v14 = OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_settingsDiffInspector;
  double v15 = *(void **)(v5 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_settingsDiffInspector);
  uint64_t v16 = OUTLINED_FUNCTION_12_1();
  swift_unknownObjectWeakInit();
  OUTLINED_FUNCTION_1_4();
  uint64_t v17 = qword_26A5DFFF0;
  id v18 = v15;
  swift_retain();
  sub_25C998C60(v17, (uint64_t)sub_25C9B64D0, v16);

  swift_release_n();
  id v19 = *(void **)(v6 + v14);
  OUTLINED_FUNCTION_12_1();
  swift_unknownObjectWeakInit();
  OUTLINED_FUNCTION_1_4();
  id v20 = v19;
  swift_retain();
  uint64_t v21 = OUTLINED_FUNCTION_52();
  sub_25C998C60(v21, v22, v23);

  swift_release_n();
  id v24 = *(void **)(v6 + v14);
  uint64_t v25 = OUTLINED_FUNCTION_12_1();
  swift_unknownObjectWeakInit();
  OUTLINED_FUNCTION_4();
  v27(v26);
  unint64_t v28 = (*(unsigned __int8 *)(v9 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v29 = (char *)swift_allocObject();
  uint64_t v30 = v38;
  *((void *)v29 + 2) = v37;
  *((void *)v29 + 3) = v30;
  uint64_t v31 = v40;
  *((void *)v29 + 4) = v39;
  *((void *)v29 + 5) = v31;
  *((void *)v29 + 6) = v25;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v29[v28], v13, v7);
  OUTLINED_FUNCTION_1_4();
  id v32 = v24;
  swift_retain();
  uint64_t v33 = OUTLINED_FUNCTION_52();
  sub_25C998C60(v33, v34, v35);
  swift_release();
  swift_release();
}

void sub_25C9ABEDC(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x26119A970](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    id v4 = *(void **)(v2 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene);
    if (!v4) {
      goto LABEL_26;
    }
    uint64_t v5 = objc_msgSend(v4, sel_clientSettings);
    if (!v5) {
      goto LABEL_26;
    }
    uint64_t v6 = v5;
    type metadata accessor for SnippetSceneClientSettings();
    uint64_t v7 = swift_dynamicCastClass();
    if (!v7)
    {
LABEL_25:

LABEL_26:
      return;
    }
    uint64_t v8 = (void *)v7;
    if (qword_26A5DF6C0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_25C9B7C90();
    __swift_project_value_buffer(v9, (uint64_t)qword_26A5E0100);
    id v10 = v3;
    uint64_t v11 = v6;
    uint64_t v6 = v10;
    uint64_t v12 = v11;
    uint64_t v13 = sub_25C9B7C70();
    os_log_type_t v14 = sub_25C9B82A0();
    unint64_t v15 = 0x2654E3000;
    if (!os_log_type_enabled(v13, v14))
    {

      uint64_t v13 = v6;
LABEL_18:

      id v21 = [v8 *(SEL *)(v15 + 2736)];
      swift_beginAccess();
      if (objc_msgSend(v21, sel_objectForSetting_, qword_26A5DFFF0))
      {
        sub_25C9B8410();
        swift_unknownObjectRelease();
        sub_25C992214(v24, &v25);
      }
      else
      {
        long long v25 = 0u;
        long long v26 = 0u;
      }
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5DFCD0);
      type metadata accessor for SceneMetrics();
      if (swift_dynamicCast())
      {
        uint64_t v22 = *(void **)&v24[0];
      }
      else
      {
        uint64_t v22 = 0;
        *(void *)&v24[0] = 0;
      }

      sub_25C9A7A2C(v22);
      uint64_t v3 = v12;
      goto LABEL_25;
    }
    os_log_type_t v23 = v14;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v17 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 138543618;
    *(void *)&long long v25 = v6;
    id v18 = v6;
    sub_25C9B83F0();
    void *v17 = v3;

    *(_WORD *)(v16 + 12) = 2114;
    id v19 = objc_msgSend(v8, sel_otherSettings);
    swift_beginAccess();
    if (objc_msgSend(v19, sel_objectForSetting_, qword_26A5DFFF0))
    {
      sub_25C9B8410();
      swift_unknownObjectRelease();
      sub_25C992214(v24, &v25);
    }
    else
    {
      long long v25 = 0u;
      long long v26 = 0u;
    }
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5DFCD0);
    type metadata accessor for SceneMetrics();
    if (swift_dynamicCast())
    {
      uint64_t v20 = v27;

      if (v20)
      {
        *(void *)&long long v25 = v20;
        sub_25C9B83F0();
LABEL_17:
        v17[1] = v20;

        _os_log_impl(&dword_25C989000, v13, v23, "[%{public}@] ClientSetting[resolvedMetrics] did change to %{public}@", (uint8_t *)v16, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
        swift_arrayDestroy();
        MEMORY[0x26119A890](v17, -1, -1);
        MEMORY[0x26119A890](v16, -1, -1);
        unint64_t v15 = 0x2654E3000uLL;
        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v27 = 0;
    }
    *(void *)&long long v25 = 0;
    sub_25C9B83F0();
    uint64_t v20 = 0;
    goto LABEL_17;
  }
}

void sub_25C9AC34C(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x26119A970](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    id v4 = *(void **)(v2 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene);
    if (!v4) {
      goto LABEL_20;
    }
    id v5 = objc_msgSend(v4, sel_clientSettings);
    if (!v5) {
      goto LABEL_20;
    }
    id v6 = v5;
    type metadata accessor for SnippetSceneClientSettings();
    uint64_t v7 = (void *)swift_dynamicCastClass();
    if (v7)
    {
      id v8 = objc_msgSend(v7, sel_otherSettings);
      swift_beginAccess();
      if (objc_msgSend(v8, sel_objectForSetting_, qword_26A5E0008))
      {
        sub_25C9B8410();
        swift_unknownObjectRelease();
        sub_25C992214(&v27, v28);
      }
      else
      {
        memset(v28, 0, sizeof(v28));
      }
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5DFCD0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E0040);
      if (swift_dynamicCast())
      {
        uint64_t v10 = v29;

        if (v10)
        {
          if (qword_26A5DF6C0 != -1) {
            swift_once();
          }
          uint64_t v11 = sub_25C9B7C90();
          __swift_project_value_buffer(v11, (uint64_t)qword_26A5E0100);
          id v12 = v3;
          swift_bridgeObjectRetain_n();
          id v9 = v12;
          uint64_t v13 = sub_25C9B7C70();
          os_log_type_t v14 = sub_25C9B82A0();
          if (os_log_type_enabled(v13, v14))
          {
            os_log_type_t type = v14;
            uint64_t v15 = swift_slowAlloc();
            log = v13;
            uint64_t v16 = (void *)swift_slowAlloc();
            uint64_t v26 = swift_slowAlloc();
            *(void *)&long long v27 = v9;
            *(void *)&v28[0] = v26;
            *(_DWORD *)uint64_t v15 = 138543618;
            id v17 = v9;
            sub_25C9B83F0();
            *uint64_t v16 = v3;

            *(_WORD *)(v15 + 12) = 2082;
            type metadata accessor for CGRect(0);
            uint64_t v19 = v18;
            uint64_t v20 = swift_bridgeObjectRetain();
            uint64_t v21 = MEMORY[0x261199C80](v20, v19);
            unint64_t v23 = v22;
            swift_bridgeObjectRelease();
            *(void *)&long long v27 = sub_25C99F02C(v21, v23, (uint64_t *)v28);
            sub_25C9B83F0();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_25C989000, log, type, "[%{public}@] ClientSetting[touchRestrictedRects] did change to %{public}s", (uint8_t *)v15, 0x16u);
            __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
            swift_arrayDestroy();
            MEMORY[0x26119A890](v16, -1, -1);
            swift_arrayDestroy();
            MEMORY[0x26119A890](v26, -1, -1);
            MEMORY[0x26119A890](v15, -1, -1);
          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          sub_25C9A7BC8(v10);
          goto LABEL_19;
        }
      }
      else
      {
        uint64_t v29 = 0;
      }
      id v9 = v3;
    }
    else
    {
      id v9 = v6;
      id v6 = v3;
    }
LABEL_19:

    uint64_t v3 = v6;
LABEL_20:
  }
}

void sub_25C9AC724(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v83 = a5;
  uint64_t v88 = a4;
  uint64_t v80 = a2;
  uint64_t v87 = sub_25C9B8090();
  uint64_t v82 = *(void *)(v87 - 8);
  uint64_t v9 = *(void *)(v82 + 64);
  MEMORY[0x270FA5388](v87, v10);
  uint64_t v86 = (char *)&v66 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E0208);
  MEMORY[0x270FA5388](v12 - 8, v13);
  uint64_t v85 = (uint64_t)&v66 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_25C9B83E0();
  uint64_t v84 = *(void (**)(char *, char *, uint64_t))(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15, v16);
  uint64_t v19 = (char *)&v66 - v18;
  uint64_t v81 = *(NSObject **)(a3 - 8);
  Class isa = v81[8].isa;
  uint64_t v22 = MEMORY[0x270FA5388](v17, v21);
  unint64_t v23 = (char *)&v66 - (((unint64_t)isa + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22, v24);
  uint64_t v26 = (char *)&v66 - v25;
  swift_beginAccess();
  uint64_t v27 = MEMORY[0x26119A970](a1 + 16);
  if (!v27) {
    return;
  }
  uint64_t v28 = (void *)v27;
  uint64_t v29 = *(void **)(v27 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene);
  if (!v29 || (id v30 = objc_msgSend(v29, sel_clientSettings)) == 0)
  {
LABEL_8:

    return;
  }
  uint64_t v31 = v30;
  type metadata accessor for SnippetSceneClientSettings();
  id v32 = (void *)swift_dynamicCastClass();
  if (!v32)
  {

    goto LABEL_8;
  }
  id v79 = v31;
  uint64_t v77 = a6;
  id v33 = objc_msgSend(v32, sel_otherSettings);
  swift_beginAccess();
  if (objc_msgSend(v33, sel_objectForSetting_, qword_26A5DFFD8))
  {
    sub_25C9B8410();
    swift_unknownObjectRelease();
    sub_25C992214(v89, v90);
  }
  else
  {
    memset(v90, 0, sizeof(v90));
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5DFCD0);
  if ((swift_dynamicCast() & 1) == 0) {
    long long v91 = xmmword_25C9B9B90;
  }

  unint64_t v34 = *((void *)&v91 + 1);
  if (*((void *)&v91 + 1) >> 60 == 15)
  {
  }
  else
  {
    uint64_t v71 = v26;
    uint64_t v35 = v91;
    if (qword_26A5DF6C0 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_25C9B7C90();
    uint64_t v74 = __swift_project_value_buffer(v36, (uint64_t)qword_26A5E0100);
    id v37 = v28;
    sub_25C992870(v35, v34);
    id v38 = v37;
    unint64_t v76 = v34;
    sub_25C992870(v35, v34);
    uint64_t v39 = sub_25C9B7C70();
    os_log_type_t v40 = sub_25C9B82A0();
    uint64_t v74 = v39;
    int v73 = v40;
    BOOL v41 = os_log_type_enabled(v39, v40);
    uint64_t v42 = v35;
    id v75 = v38;
    uint64_t v78 = v35;
    if (v41)
    {
      uint64_t v43 = (_DWORD *)swift_slowAlloc();
      uint64_t v72 = (void *)swift_slowAlloc();
      uint64_t v70 = swift_slowAlloc();
      *(void *)&v90[0] = v70;
      uint64_t v67 = (uint8_t *)v43;
      *uint64_t v43 = 138543618;
      uint64_t v69 = (uint8_t *)(v43 + 1);
      uint64_t v66 = v43 + 3;
      *(void *)&v89[0] = v38;
      uint64_t v68 = (char *)v89 + 8;
      id v44 = v38;
      sub_25C9B83F0();
      *uint64_t v72 = v28;

      uint64_t v45 = v67;
      *((_WORD *)v67 + 6) = 2082;
      uint64_t v69 = v45 + 14;
      unint64_t v46 = v76;
      sub_25C992884(v42, v76);
      uint64_t v66 = (_DWORD *)sub_25C9B7C10();
      unint64_t v48 = v47;
      sub_25C992200(v42, v46);
      *(void *)&v89[0] = sub_25C99F02C((uint64_t)v66, v48, (uint64_t *)v90);
      sub_25C9B83F0();
      swift_bridgeObjectRelease();
      sub_25C992200(v42, v46);
      sub_25C992200(v42, v46);
      uint64_t v49 = v74;
      _os_log_impl(&dword_25C989000, v74, (os_log_type_t)v73, "[%{public}@] ClientSetting[viewModelData] did change to %{public}s", v45, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
      uint64_t v50 = v72;
      swift_arrayDestroy();
      MEMORY[0x26119A890](v50, -1, -1);
      uint64_t v51 = v70;
      swift_arrayDestroy();
      MEMORY[0x26119A890](v51, -1, -1);
      MEMORY[0x26119A890](v45, -1, -1);
    }
    else
    {

      unint64_t v52 = v76;
      sub_25C992200(v35, v76);
      sub_25C992200(v35, v52);
    }
    sub_25C9B7B60();
    swift_allocObject();
    sub_25C9B7B50();
    sub_25C9B7B40();
    swift_release();
    __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, a3);
    uint64_t v53 = v81;
    id v54 = (void (*)(char *, char *, uint64_t))v81[4].isa;
    uint64_t v74 = v81 + 4;
    uint64_t v84 = v54;
    uint64_t v55 = v71;
    v54(v71, v19, a3);
    uint64_t v56 = sub_25C9B8250();
    __swift_storeEnumTagSinglePayload(v85, 1, 1, v56);
    uint64_t v57 = v82;
    (*(void (**)(char *, uint64_t, uint64_t))(v82 + 16))(v86, v80, v87);
    ((void (*)(char *, char *, uint64_t))v53[2].isa)(v23, v55, a3);
    sub_25C9B8230();
    uint64_t v58 = sub_25C9B8220();
    unint64_t v59 = (*(unsigned __int8 *)(v57 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80);
    unint64_t v60 = (v9 + LOBYTE(v53[10].isa) + v59) & ~(unint64_t)LOBYTE(v53[10].isa);
    uint64_t v61 = (char *)swift_allocObject();
    uint64_t v62 = MEMORY[0x263F8F500];
    *((void *)v61 + 2) = v58;
    *((void *)v61 + 3) = v62;
    uint64_t v63 = v87;
    uint64_t v64 = v88;
    *((void *)v61 + 4) = a3;
    *((void *)v61 + 5) = v64;
    uint64_t v65 = v77;
    *((void *)v61 + 6) = v83;
    *((void *)v61 + 7) = v65;
    (*(void (**)(char *, char *, uint64_t))(v57 + 32))(&v61[v59], v86, v63);
    v84(&v61[v60], v23, a3);
    sub_25C9A159C(v85, (uint64_t)&unk_26A5E0890, (uint64_t)v61);
    swift_release();

    sub_25C992200(v78, v76);
    ((void (*)(char *, uint64_t))v53[1].isa)(v55, a3);
  }
}

uint64_t sub_25C9AD090(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void v6[4] = a6;
  v6[5] = v11;
  v6[2] = a4;
  v6[3] = a5;
  v6[6] = *(void *)(a6 - 8);
  v6[7] = swift_task_alloc();
  sub_25C9B8230();
  v6[8] = sub_25C9B8220();
  uint64_t v8 = sub_25C9B8210();
  return MEMORY[0x270FA2498](sub_25C9AD184, v8, v7);
}

uint64_t sub_25C9AD184()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[6];
  uint64_t v3 = v0[4];
  swift_release();
  sub_25C9B8090();
  MEMORY[0x261199B20]();
  char v4 = sub_25C9B8130();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  if ((v4 & 1) == 0)
  {
    OUTLINED_FUNCTION_4();
    v5();
    OUTLINED_FUNCTION_23();
    sub_25C9B8080();
  }
  swift_task_dealloc();
  id v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

void sub_25C9AD284(unsigned int a1, char a2)
{
  sub_25C9B80A0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5, v6);
  OUTLINED_FUNCTION_4_3();
  uint64_t v9 = v8 - v7;
  sub_25C9B80C0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v10, v11);
  OUTLINED_FUNCTION_4_3();
  uint64_t v14 = v13 - v12;
  BSDispatchQueueAssertMain();
  if ((v2[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_isInvalidated] & 1) == 0
    && ((a2 & 1) != 0
     || *(_DWORD *)&v2[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController__presentationMode] != a1))
  {
    uint64_t v41 = v14;
    if (qword_26A5DF6C0 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_25C9B7C90();
    __swift_project_value_buffer(v15, (uint64_t)qword_26A5E0100);
    uint64_t v16 = v2;
    uint64_t v17 = sub_25C9B7C70();
    os_log_type_t v18 = sub_25C9B82D0();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = swift_slowAlloc();
      os_log_type_t v40 = v17;
      uint64_t v20 = (void *)OUTLINED_FUNCTION_5_4();
      aBlock[0] = OUTLINED_FUNCTION_11_1();
      *(_DWORD *)uint64_t v19 = 138543874;
      uint64_t v43 = v16;
      uint64_t v21 = v16;
      sub_25C9B83F0();
      *uint64_t v20 = v16;

      *(_WORD *)(v19 + 12) = 2082;
      uint64_t v22 = SnippetHostViewController.PresentationMode.description.getter(a1);
      uint64_t v24 = sub_25C99F02C(v22, v23, aBlock);
      OUTLINED_FUNCTION_47(v24);
      sub_25C9B83F0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v19 + 22) = 1026;
      LODWORD(v43) = a2 & 1;
      sub_25C9B83F0();
      _os_log_impl(&dword_25C989000, v40, v18, "[%{public}@] Updating presentationMode to: %{public}s - (forced? %{BOOL,public}d).", (uint8_t *)v19, 0x1Cu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0_6();
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0_6();
      OUTLINED_FUNCTION_0_6();
    }
    else
    {
    }
    *(_DWORD *)&v16[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController__presentationMode] = a1;
    if (a1 < 2)
    {
      sub_25C9B0C04(0, 1);
      sub_25C9ADC84();
LABEL_17:
      id v27 = sub_25C9A7F94();
      uint64_t v28 = swift_allocObject();
      *(void *)(v28 + 16) = v16;
      *(unsigned char *)(v28 + 24) = a1 == 1;
      aBlock[4] = (uint64_t)sub_25C9B68EC;
      aBlock[5] = v28;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_25C9AA728;
      aBlock[3] = (uint64_t)&block_descriptor_240;
      uint64_t v29 = _Block_copy(aBlock);
      id v30 = v16;
      sub_25C9B80B0();
      uint64_t v43 = (char *)MEMORY[0x263F8EE78];
      sub_25C9B5E60(&qword_26A5E0800, MEMORY[0x263F8F030]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E0808);
      sub_25C9B5FC0(&qword_26A5E0810, &qword_26A5E0808);
      sub_25C9B8420();
      MEMORY[0x261199DE0](0, v41, v9, v29);
      _Block_release(v29);

      OUTLINED_FUNCTION_16();
      v31();
      OUTLINED_FUNCTION_16();
      v32();
      swift_release();
      return;
    }
    if (a1 != 2)
    {
      LODWORD(aBlock[0]) = a1;
      sub_25C9B8600();
      __break(1u);
      return;
    }
    uint64_t v25 = *(void **)&v16[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene];
    if (v25)
    {
      id v26 = v25;
      if (objc_msgSend(v26, sel_contentState) != (id)2) {
        sub_25C9ADC84();
      }
      sub_25C9AD8F4();

      goto LABEL_17;
    }
    id v33 = v16;
    unint64_t v34 = sub_25C9B7C70();
    os_log_type_t v35 = sub_25C9B82B0();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)OUTLINED_FUNCTION_7_3();
      aBlock[0] = OUTLINED_FUNCTION_11_1();
      *(_DWORD *)uint64_t v36 = 136446210;
      uint64_t v37 = sub_25C9A7E74();
      uint64_t v39 = sub_25C99F02C(v37, v38, aBlock);
      OUTLINED_FUNCTION_46(v39);
      OUTLINED_FUNCTION_43();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C989000, v34, v35, "[%{public}s] Snapshot failed because there is no scene found", v36, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0_6();
      OUTLINED_FUNCTION_0_6();
    }
    else
    {
    }
  }
}

_OWORD *sub_25C9AD8B8(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

uint64_t type metadata accessor for SnippetHostViewController()
{
  return self;
}

uint64_t sub_25C9AD8F4()
{
  uint64_t result = BSDispatchQueueAssertMain();
  if (*(_DWORD *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController__presentationMode] == 2)
  {
    uint64_t v2 = OUTLINED_FUNCTION_12_1();
    *(void *)(v2 + 16) = v0;
    long long v3 = v0;
    BSDispatchQueueAssertMain();
    char v4 = v3;
    OUTLINED_FUNCTION_49();
    swift_retain();
    sub_25C9B1630((uint64_t)v3, v3, (uint64_t)sub_25C9B5DD4, v2);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_25C9AD990(unsigned __int8 a1, void *a2)
{
  int v4 = a1;
  BSDispatchQueueAssertMain();
  if (v4 == 3)
  {
    char v5 = 1;
  }
  else
  {
    if (qword_26A5DF6C0 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_25C9B7C90();
    __swift_project_value_buffer(v6, (uint64_t)qword_26A5E0100);
    id v7 = a2;
    uint64_t v8 = sub_25C9B7C70();
    os_log_type_t v9 = sub_25C9B82B0();
    if (os_log_type_enabled(v8, v9))
    {
      os_log_type_t type = v9;
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 138543618;
      id v12 = v7;
      sub_25C9B83F0();
      *uint64_t v11 = v7;

      *(_WORD *)(v10 + 12) = 2114;
      sub_25C9B5F10();
      swift_allocError();
      *uint64_t v13 = a1;
      uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
      sub_25C9B83F0();
      v11[1] = v15;
      _os_log_impl(&dword_25C989000, v8, type, "[%{public}@] Snapshot failed so backgrounding scene without updated snapshot: %{public}@", (uint8_t *)v10, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
      swift_arrayDestroy();
      MEMORY[0x26119A890](v11, -1, -1);
      MEMORY[0x26119A890](v10, -1, -1);
    }
    else
    {
    }
    char v5 = 0;
  }
  sub_25C9B0C04(v5, 0);
  sub_25C9ADC84();
}

uint64_t sub_25C9ADBC4()
{
  uint64_t v1 = sub_25C9B80D0();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4, v5);
  OUTLINED_FUNCTION_5_3();
  id *v0 = sub_25C9A7F94();
  (*(void (**)(id *, void, uint64_t))(v3 + 104))(v0, *MEMORY[0x263F8F0E0], v1);
  char v6 = sub_25C9B80E0();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_44();
  uint64_t result = v7();
  if ((v6 & 1) == 0) {
    __break(1u);
  }
  return result;
}

void sub_25C9ADC84()
{
  OUTLINED_FUNCTION_31();
  uint64_t v130 = v1;
  uint64_t v131 = v2;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  LODWORD(v8) = v7;
  os_log_type_t v9 = (void *)sub_25C9B7C90();
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12, v13);
  OUTLINED_FUNCTION_35();
  uint64_t v16 = v14 - v15;
  MEMORY[0x270FA5388](v17, v18);
  uint64_t v20 = (char *)&v104 - v19;
  BSDispatchQueueAssertMain();
  uint64_t v21 = *(void **)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene];
  if (!v21)
  {
    uint64_t v34 = OUTLINED_FUNCTION_23();
    uint64_t v36 = sub_25C9B7280(v34, v35);
    if (!v36) {
      goto LABEL_29;
    }
    uint64_t v37 = v36;
    uint64_t v115 = v16;
    os_log_t v118 = (os_log_t)v11;
    id v38 = v9;
    int v111 = (int)v8;
    uint64_t v39 = self;
    v114 = v37;
    id v40 = objc_msgSend(v39, sel_identityForProcessIdentity_, v37);
    if (qword_26A5DF6E0 != -1) {
      swift_once();
    }
    uint64_t v41 = (void *)qword_26A5E0520;
    uint64_t v42 = OUTLINED_FUNCTION_4_0();
    *(void *)(v42 + 16) = v0;
    *(void *)(v42 + 24) = v40;
    uint64_t v43 = (void *)OUTLINED_FUNCTION_4_0();
    v43[2] = sub_25C9B5CC0;
    v43[3] = v42;
    v113 = (void *)v42;
    v128 = sub_25C9928EC;
    v129 = v43;
    uint64_t v124 = MEMORY[0x263EF8330];
    uint64_t v125 = 1107296256;
    v126 = sub_25C9AF000;
    v127 = &block_descriptor_122;
    id v44 = _Block_copy(&v124);
    uint64_t v45 = (uint64_t)v129;
    unint64_t v46 = v0;
    id v112 = v40;
    swift_retain();
    swift_release();
    id v47 = objc_msgSend(v41, sel_createScene_, v44);
    _Block_release(v44);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if (isEscapingClosureAtFileLocation)
    {
      __break(1u);
    }
    else
    {
      id v49 = v47;
      sub_25C9A7E38((uint64_t)v47);
      objc_msgSend(v49, sel_setDelegate_, v46);
      id v50 = objc_msgSend(v49, sel_layerManager);
      objc_msgSend(v50, sel_addObserver_, v46);

      id v119 = v49;
      id v51 = objc_msgSend(v49, sel_uiPresentationManager);
      if (!v51)
      {
        __break(1u);
        goto LABEL_45;
      }
      unint64_t v52 = v51;
      uint64_t v53 = (void *)sub_25C9B8140();
      id v54 = objc_msgSend(v52, sel_createPresenterWithIdentifier_, v53);

      uint64_t v55 = swift_unknownObjectRetain();
      sub_25C9A7E44(v55);
      v128 = sub_25C9AF0F4;
      v129 = 0;
      uint64_t v124 = MEMORY[0x263EF8330];
      uint64_t v125 = 1107296256;
      v126 = sub_25C9B6BB0;
      v127 = &block_descriptor_125;
      uint64_t v43 = _Block_copy(&v124);
      swift_release();
      objc_msgSend(v54, sel_modifyPresentationContext_, v43);
      _Block_release(v43);
      if ((swift_isEscapingClosureAtFileLocation() & 1) == 0)
      {
        id v44 = v38;
        objc_msgSend(v54, sel_activate);
        id v56 = objc_msgSend(v54, sel_presentationView);
        uint64_t v57 = &v46[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_systemProvidedMetrics];
        OUTLINED_FUNCTION_1_4();
        uint64_t v58 = *(char **)(*v57 + OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics);
        double v121 = 0.0;
        double v122 = 0.0;
        double v59 = 0.0;
        double v60 = 0.0;
        double v61 = 0.0;
        if (sub_25C99666C())
        {
          double v60 = sub_25C9963E0();
          double v59 = v62;
          double v121 = v60;
          double v122 = v62;
          uint64_t v63 = (double *)&v58[OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest_cornerRadius];
          OUTLINED_FUNCTION_1_4();
          double v61 = *v63;
        }
        uint64_t v64 = v58;
        id v65 = v56;
        sub_25C9A7E5C((uint64_t)v56);
        id v66 = objc_msgSend(v46, sel_view);
        if (v66)
        {
          uint64_t v67 = v66;
          v109 = v64;
          id v110 = v54;
          objc_msgSend(v66, sel_addSubview_, v65);

          id v68 = objc_msgSend(v46, sel_view);
          if (v68)
          {
            uint64_t v69 = v68;
            objc_msgSend(v68, sel_setNeedsLayout);

            objc_msgSend(v65, sel_setClipsToBounds_, 1);
            id v70 = objc_msgSend(v65, sel_layer);
            sub_25C9B5400(0xD00000000000001CLL, 0x800000025C9BC680, v70, (SEL *)&selRef_setName_);

            id v108 = v65;
            objc_msgSend(v65, sel__setContinuousCornerRadius_, v61);
            objc_msgSend(v46, sel_setPreferredContentSize_, v60, v59);
            uint64_t v45 = OUTLINED_FUNCTION_12_1();
            *(void *)(v45 + 16) = v46;
            uint64_t v71 = OUTLINED_FUNCTION_4_0();
            *(void *)(v71 + 16) = sub_25C9B5CF4;
            *(void *)(v71 + 24) = v45;
            v128 = sub_25C9B6BB4;
            v129 = (void *)v71;
            uint64_t v124 = MEMORY[0x263EF8330];
            uint64_t v125 = 1107296256;
            v126 = sub_25C991E60;
            v127 = &block_descriptor_134;
            uint64_t v72 = _Block_copy(&v124);
            uint64_t v43 = v46;
            swift_retain();
            swift_release();
            objc_msgSend(v119, sel_configureParameters_, v72);
            _Block_release(v72);
            LOBYTE(v72) = swift_isEscapingClosureAtFileLocation();
            swift_release();
            if ((v72 & 1) == 0)
            {
              uint64_t v107 = v6;
              if (qword_26A5DF6C0 == -1) {
                goto LABEL_21;
              }
              goto LABEL_43;
            }
LABEL_42:
            __break(1u);
LABEL_43:
            swift_once();
LABEL_21:
            uint64_t v106 = v45;
            __swift_project_value_buffer((uint64_t)v44, (uint64_t)qword_26A5E0100);
            OUTLINED_FUNCTION_4();
            v73();
            uint64_t v74 = v43;
            id v75 = sub_25C9B7C70();
            os_log_type_t v76 = sub_25C9B82D0();
            uint64_t v6 = v76;
            if (os_log_type_enabled(v75, v76))
            {
              uint64_t v77 = OUTLINED_FUNCTION_24();
              uint64_t v78 = OUTLINED_FUNCTION_5_4();
              v117 = v4;
              id v79 = (void *)v78;
              uint64_t v105 = OUTLINED_FUNCTION_11_1();
              uint64_t v124 = v105;
              *(_DWORD *)uint64_t v77 = 138543618;
              v116 = v44;
              uint64_t v120 = (uint64_t)v74;
              uint64_t v80 = v74;
              sub_25C9B83F0();
              void *v79 = v46;

              *(_WORD *)(v77 + 12) = 2082;
              char v81 = v111;
              if (v111) {
                uint64_t v82 = 0x756F726765726F66;
              }
              else {
                uint64_t v82 = 0x756F72676B636162;
              }
              uint64_t v120 = sub_25C99F02C(v82, 0xEA0000000000646ELL, &v124);
              sub_25C9B83F0();
              swift_bridgeObjectRelease();
              _os_log_impl(&dword_25C989000, v75, (os_log_type_t)v6, "[%{public}@] Creating snippet scene to %{public}s.", (uint8_t *)v77, 0x16u);
              __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
              swift_arrayDestroy();
              uint64_t v4 = v117;
              OUTLINED_FUNCTION_0_6();
              swift_arrayDestroy();
              OUTLINED_FUNCTION_0_6();
              OUTLINED_FUNCTION_0_6();

              OUTLINED_FUNCTION_16();
              v83();
            }
            else
            {

              OUTLINED_FUNCTION_44();
              v96();
              char v81 = v111;
            }
            uint64_t v88 = swift_allocObject();
            *(void *)(v88 + 16) = &v121;
            *(unsigned char *)(v88 + 24) = v81 & 1;
            *(void *)(v88 + 32) = v74;
            uint64_t v97 = OUTLINED_FUNCTION_4_0();
            *(void *)(v97 + 16) = sub_25C9B5D30;
            *(void *)(v97 + 24) = v88;
            v128 = sub_25C9B5D44;
            v129 = (void *)v97;
            uint64_t v124 = MEMORY[0x263EF8330];
            uint64_t v125 = 1107296256;
            v126 = sub_25C9A8598;
            v127 = &block_descriptor_143;
            v98 = _Block_copy(&v124);
            v99 = v74;
            swift_retain();
            swift_release();
            uint64_t v100 = OUTLINED_FUNCTION_4_0();
            uint64_t v101 = v107;
            *(void *)(v100 + 16) = v107;
            *(void *)(v100 + 24) = v4;
            v128 = sub_25C9B5D70;
            v129 = (void *)v100;
            uint64_t v124 = MEMORY[0x263EF8330];
            uint64_t v125 = 1107296256;
            v126 = sub_25C9AEDC0;
            v127 = &block_descriptor_149;
            v102 = _Block_copy(&v124);
            sub_25C998EA8(v101);
            swift_release();
            id v103 = v119;
            objc_msgSend(v119, sel_performUpdate_withCompletion_, v98, v102);

            swift_unknownObjectRelease();
            _Block_release(v102);
            _Block_release(v98);
            LOBYTE(v98) = swift_isEscapingClosureAtFileLocation();
            swift_release();
            swift_release();
            swift_release();
            swift_release();
            if (v98)
            {
              __break(1u);
              goto LABEL_36;
            }
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
    }
    __break(1u);
    goto LABEL_42;
  }
  uint64_t v22 = qword_26A5DF6C0;
  id v119 = v21;
  if (v22 != -1) {
    swift_once();
  }
  __swift_project_value_buffer((uint64_t)v9, (uint64_t)qword_26A5E0100);
  OUTLINED_FUNCTION_4();
  v23();
  uint64_t v24 = v0;
  uint64_t v25 = sub_25C9B7C70();
  os_log_type_t v26 = sub_25C9B82D0();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = OUTLINED_FUNCTION_24();
    os_log_t v118 = (os_log_t)v11;
    uint64_t v28 = v27;
    uint64_t v29 = OUTLINED_FUNCTION_5_4();
    v117 = v4;
    v113 = (void *)v29;
    uint64_t v115 = OUTLINED_FUNCTION_11_1();
    uint64_t v124 = v115;
    *(_DWORD *)uint64_t v28 = 138543618;
    v116 = v9;
    uint64_t v123 = (uint64_t)v24;
    v114 = v25;
    char v30 = (char)v8;
    uint64_t v8 = v24;
    sub_25C9B83F0();
    void *v113 = v24;

    LOBYTE(v8) = v30;
    *(_WORD *)(v28 + 12) = 2082;
    if (v30) {
      uint64_t v31 = 0x756F726765726F66;
    }
    else {
      uint64_t v31 = 0x756F72676B636162;
    }
    uint64_t v123 = sub_25C99F02C(v31, 0xEA0000000000646ELL, &v124);
    sub_25C9B83F0();
    swift_bridgeObjectRelease();
    id v32 = v114;
    _os_log_impl(&dword_25C989000, v114, v26, "[%{public}@] Updating snippet scene to %{public}s.", (uint8_t *)v28, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
    swift_arrayDestroy();
    uint64_t v4 = v117;
    OUTLINED_FUNCTION_0_6();
    OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_0_6();
    OUTLINED_FUNCTION_0_6();

    OUTLINED_FUNCTION_16();
    v33();
  }
  else
  {

    (*(void (**)(char *, void *))(v11 + 8))(v20, v9);
  }
  uint64_t v0 = (unsigned char *)swift_allocObject();
  v0[16] = v8 & 1;
  uint64_t v84 = OUTLINED_FUNCTION_4_0();
  *(void *)(v84 + 16) = sub_25C9B5D84;
  *(void *)(v84 + 24) = v0;
  v128 = sub_25C9B6BAC;
  v129 = (void *)v84;
  uint64_t v124 = MEMORY[0x263EF8330];
  uint64_t v125 = 1107296256;
  v126 = sub_25C9A8598;
  v127 = &block_descriptor_159;
  uint64_t v85 = _Block_copy(&v124);
  swift_retain();
  swift_release();
  uint64_t v86 = OUTLINED_FUNCTION_4_0();
  *(void *)(v86 + 16) = v6;
  *(void *)(v86 + 24) = v4;
  v128 = sub_25C9B5D70;
  v129 = (void *)v86;
  uint64_t v124 = MEMORY[0x263EF8330];
  uint64_t v125 = 1107296256;
  v126 = sub_25C9AEDC0;
  v127 = &block_descriptor_165;
  uint64_t v87 = _Block_copy(&v124);
  sub_25C998EA8(v6);
  swift_release();
  os_log_type_t v9 = v119;
  objc_msgSend(v119, sel_performUpdate_withCompletion_, v85, v87);

  _Block_release(v87);
  _Block_release(v85);
  LOBYTE(v87) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if (v87)
  {
    __break(1u);
LABEL_29:
    v117 = v4;
    if (qword_26A5DF6C0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer((uint64_t)v9, (uint64_t)qword_26A5E0100);
    uint64_t v4 = v0;
    uint64_t v88 = sub_25C9B7C70();
    os_log_type_t v89 = sub_25C9B82D0();
    if (os_log_type_enabled((os_log_t)v88, v89))
    {
      uint64_t v90 = OUTLINED_FUNCTION_24();
      v116 = (void *)OUTLINED_FUNCTION_5_4();
      id v119 = (id)OUTLINED_FUNCTION_11_1();
      uint64_t v124 = (uint64_t)v119;
      *(_DWORD *)uint64_t v90 = 138543619;
      os_log_t v118 = (os_log_t)v88;
      uint64_t v123 = (uint64_t)v4;
      long long v91 = v4;
      sub_25C9B83F0();
      void *v116 = v4;

      *(_WORD *)(v90 + 12) = 2081;
      swift_bridgeObjectRetain();
      uint64_t v92 = OUTLINED_FUNCTION_23();
      uint64_t v123 = sub_25C99F02C(v92, v93, v94);
      sub_25C9B83F0();

      swift_bridgeObjectRelease();
      os_log_t v95 = v118;
      _os_log_impl(&dword_25C989000, v118, v89, "[%{public}@] Couldn't create a scene with %{private}s", (uint8_t *)v90, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
      OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_0_6();
      OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_0_6();
      OUTLINED_FUNCTION_0_6();

      goto LABEL_37;
    }
LABEL_36:

LABEL_37:
    if (v6) {
      ((void (*)(void))v6)();
    }
  }
}

void sub_25C9AEDC0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

id sub_25C9AEE38(void *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_25C9B7C50();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14[0] = 0x3A656E656373;
  v14[1] = 0xE600000000000000;
  sub_25C9B7C40();
  sub_25C9B7C30();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  sub_25C9B8180();
  swift_bridgeObjectRelease();
  sub_25C9B8180();
  id v11 = objc_msgSend(a2, sel_description);
  sub_25C9B8150();

  sub_25C9B8180();
  swift_bridgeObjectRelease();
  uint64_t v12 = (void *)sub_25C9B8140();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setIdentifier_, v12);

  objc_msgSend(a1, sel_setClientIdentity_, a3);
  return objc_msgSend(a1, sel_setSpecification_, *(void *)&a2[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneSpecification]);
}

uint64_t sub_25C9AF000(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);
  return swift_unknownObjectRelease();
}

id sub_25C9AF054(void *a1)
{
  objc_msgSend(a1, sel_setPresentedLayerTypes_, 26);
  objc_msgSend(a1, sel_setAppearanceStyle_, 2);
  objc_msgSend(a1, sel_setBackgroundColorWhileHosting_, 0);
  objc_msgSend(a1, sel_setBackgroundColorWhileNotHosting_, 0);
  objc_msgSend(a1, sel_setInheritsSecurity_, 1);
  return objc_msgSend(a1, sel_setResizesHostedContext_, 1);
}

void sub_25C9AF0F8(void *a1, uint64_t a2)
{
  id v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SnippetSceneMutableClientSettings()), sel_init);
  uint64_t v5 = a2 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_viewModel;
  swift_beginAccess();
  sub_25C9B539C(v5, (uint64_t)v9);
  __swift_project_boxed_opaque_existential_0(v9, v9[3]);
  uint64_t v6 = sub_25C995A70();
  unint64_t v8 = v7;
  sub_25C992884(v6, v7);
  sub_25C9A72F4(v6, v8, &qword_26A5DFFD8);
  sub_25C98EE60(v6, v8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  objc_msgSend(a1, sel_setClientSettings_, v4);
}

void sub_25C9AF1F4(void *a1, uint64_t a2, uint64_t a3, char a4, char *a5)
{
  type metadata accessor for LiveMutableSceneSettings();
  uint64_t v8 = swift_dynamicCastClass();
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = self;
    id v11 = a1;
    id v12 = objc_msgSend(v10, sel__applicationKeyWindow);
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = (uint64_t)objc_msgSend(v12, sel_interfaceOrientation);
    }
    else
    {
      uint64_t v14 = 1;
    }
    id v15 = v11;
    BSRectWithSize();
    objc_msgSend(v9, sel_setFrame_);

    objc_msgSend(v9, sel_setInterfaceOrientation_, v14);
    id v16 = objc_msgSend(self, sel_mainConfiguration);
    objc_msgSend(v9, sel_setDisplayConfiguration_, v16);

    objc_msgSend(v9, sel_setForeground_, a4 & 1);
    id v17 = v15;
    id v18 = objc_msgSend(a5, sel_traitCollection);
    id v19 = objc_msgSend(v18, sel_userInterfaceStyle);

    objc_msgSend(v9, sel_setUserInterfaceStyle_, v19);
    uint64_t v20 = (void **)&a5[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_systemProvidedMetrics];
    swift_beginAccess();
    uint64_t v21 = *v20;
    id v22 = v21;
    sub_25C9A73C8(v21, &qword_26A5E0268);
  }
}

uint64_t sub_25C9AF3FC(uint64_t a1, uint64_t a2)
{
  uint64_t result = BSDispatchQueueAssertMain();
  uint64_t v6 = *(void **)(v2 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene);
  if (v6)
  {
    uint64_t v7 = OUTLINED_FUNCTION_4_0();
    *(void *)(v7 + 16) = a1;
    *(void *)(v7 + 24) = a2;
    uint64_t v8 = OUTLINED_FUNCTION_4_0();
    *(void *)(v8 + 16) = sub_25C9B5D44;
    *(void *)(v8 + 24) = v7;
    v11[4] = sub_25C9B6BAC;
    void v11[5] = v8;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 1107296256;
    v11[2] = sub_25C9A8598;
    v11[3] = &block_descriptor_224;
    uint64_t v9 = _Block_copy(v11);
    id v10 = v6;
    swift_retain();
    swift_release();
    objc_msgSend(v10, sel_performUpdate_, v9);

    _Block_release(v9);
    LOBYTE(v9) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    uint64_t result = swift_release();
    if (v9) {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_25C9AF560()
{
  BSDispatchQueueAssertMain();
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scenePresenter);
  if (v1) {
    objc_msgSend(v1, sel_invalidate);
  }
  sub_25C9A7E44(0);
  *(unsigned char *)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_isSceneForeground) = 0;
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_activatedSceneView), sel_removeFromSuperview);
  sub_25C9A7E5C(0);
  uint64_t v2 = OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene;
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene);
  if (v3)
  {
    id v4 = objc_msgSend(v3, sel_layerManager);
    objc_msgSend(v4, sel_remove_, v0);

    uint64_t v3 = *(void **)(v0 + v2);
    if (v3)
    {
      objc_msgSend(v3, sel_setDelegate_, 0);
      uint64_t v3 = *(void **)(v0 + v2);
    }
  }
  objc_msgSend(v3, sel_invalidate);
  uint64_t result = sub_25C9A7E38(0);
  *(unsigned char *)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_isInvalidated) = 1;
  return result;
}

void sub_25C9AF650()
{
  uint64_t v1 = v0;
  BSDispatchQueueAssertMain();
  if (*(void *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene])
  {
    uint64_t v2 = (void **)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_resolvedMetrics];
    OUTLINED_FUNCTION_1_4();
    uint64_t v3 = (char *)*v2;
    if (*v2)
    {
      id v4 = (double *)&v3[OBJC_IVAR____TtC15SiriInteractive12SceneMetrics_size];
      OUTLINED_FUNCTION_1_4();
      double v6 = *v4;
      double v5 = v4[1];
      double v18 = *v4;
      double v19 = v5;
      uint64_t v7 = &v1[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_systemProvidedMetrics];
      OUTLINED_FUNCTION_1_4();
      uint64_t v8 = *(void **)(*(void *)v7 + OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics);
      if (sub_25C99666C())
      {
        double v6 = sub_25C98D1EC(v6);
        double v18 = v6;
        double v19 = v5;
      }
      id v9 = v8;
      id v10 = v3;
      id v11 = objc_msgSend(v1, sel_view);
      if (v11)
      {
        id v12 = v11;
        objc_msgSend(v11, sel_bounds);
        CGFloat v14 = v13;
        CGFloat v16 = v15;

        if (v5 <= 40.0)
        {
        }
        else
        {
          v20.width = v14;
          v20.height = v16;
          v21.width = v6;
          v21.height = v5;
          if (!CGSizeEqualToSize(v20, v21))
          {
            id v17 = (void *)MEMORY[0x26119A2B0]();
            sub_25C9AF7E8(v1, &v18);
          }
        }
      }
      else
      {
        __break(1u);
      }
    }
  }
}

id sub_25C9AF7E8(void *a1, double *a2)
{
  id v22 = a2;
  unint64_t v23 = a1;
  sub_25C9AF3FC((uint64_t)sub_25C9B5C88, (uint64_t)v21);
  double v4 = *a2;
  double v5 = a2[1];
  if (qword_26A5DF6C0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_25C9B7C90();
  __swift_project_value_buffer(v6, (uint64_t)qword_26A5E0100);
  id v7 = a1;
  uint64_t v8 = sub_25C9B7C70();
  os_log_type_t v9 = sub_25C9B82D0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    double v19 = (void *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    uint64_t v26 = v20;
    *(_DWORD *)uint64_t v10 = 138543874;
    uint64_t v24 = (uint64_t)v7;
    id v11 = v7;
    sub_25C9B83F0();
    void *v19 = v7;

    *(_WORD *)(v10 + 12) = 2082;
    uint64_t v24 = *(void *)&v4;
    double v25 = v5;
    type metadata accessor for CGSize(0);
    uint64_t v12 = sub_25C9B8160();
    uint64_t v24 = sub_25C99F02C(v12, v13, &v26);
    sub_25C9B83F0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 22) = 2082;
    objc_msgSend(v11, sel_preferredContentSize);
    uint64_t v24 = v14;
    double v25 = v15;
    uint64_t v16 = sub_25C9B8160();
    uint64_t v24 = sub_25C99F02C(v16, v17, &v26);
    sub_25C9B83F0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C989000, v8, v9, "[%{public}@] Updating preferred content size with requested size: %{public}s, current size: %{public}s", (uint8_t *)v10, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
    swift_arrayDestroy();
    MEMORY[0x26119A890](v19, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x26119A890](v20, -1, -1);
    MEMORY[0x26119A890](v10, -1, -1);
  }
  else
  {
  }
  return objc_msgSend(v7, sel_setPreferredContentSize_, v4, v5);
}

void sub_25C9AFAF0(void *a1, void *a2, uint64_t a3, void *a4)
{
  type metadata accessor for LiveMutableSceneSettings();
  uint64_t v7 = swift_dynamicCastClass();
  if (!v7) {
    return;
  }
  uint64_t v8 = (void *)v7;
  os_log_type_t v9 = self;
  id v10 = a1;
  id v11 = objc_msgSend(v9, sel__applicationKeyWindow);
  if (!v11)
  {
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v12 = v11;
  id v13 = objc_msgSend(v11, sel_interfaceOrientation);

  if (v13 != (id)4)
  {
    id v14 = objc_msgSend(v9, sel__applicationKeyWindow);
    if (!v14)
    {
LABEL_18:
      __break(1u);
      return;
    }
    double v15 = v14;
    objc_msgSend(v14, sel_interfaceOrientation);
  }
  id v22 = v10;
  BSRectWithSize();
  objc_msgSend(v8, sel_setFrame_);

  id v16 = objc_msgSend(a4, sel_view);
  if (!v16)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v17 = v16;
  id v18 = objc_msgSend(v16, sel_window);

  if (v18)
  {
    id v19 = objc_msgSend(v18, sel_windowScene);

    if (v19)
    {
      id v20 = objc_msgSend(v19, sel__synchronizedDrawingFence);

      if (v20)
      {
        id v21 = v20;
        objc_msgSend(a2, sel_setAnimationFence_, v21);
      }
    }
  }
}

void sub_25C9AFD24()
{
  OUTLINED_FUNCTION_32();
  uint64_t v85 = v1;
  uint64_t v86 = v2;
  uint64_t v3 = v0;
  uint64_t v4 = sub_25C9B7C00();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7, v8);
  OUTLINED_FUNCTION_35();
  id v11 = (char *)(v9 - v10);
  MEMORY[0x270FA5388](v12, v13);
  double v15 = (char *)&v64 - v14;
  BSDispatchQueueAssertMain();
  id v16 = *(void **)&v3[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene];
  if (!v16)
  {
LABEL_32:
    OUTLINED_FUNCTION_33();
    return;
  }
  id v68 = v16;
  id v17 = objc_msgSend(v3, sel_view);
  if (!v17) {
    goto LABEL_38;
  }
  id v18 = v17;
  id v19 = objc_msgSend(v17, sel_window);

  if (!v19)
  {
    OUTLINED_FUNCTION_33();

    return;
  }
  uint64_t v67 = v6;
  uint64_t v66 = v4;
  id v20 = objc_msgSend(v68, sel_layerManager);
  id v21 = objc_msgSend(v20, sel_layers);

  sub_25C9950BC(0, &qword_26A5E0860);
  id v22 = &v3[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_touchDeliveryPolicyAssertions];
  OUTLINED_FUNCTION_1_4();
  os_log_type_t v76 = v22;
  uint64_t v23 = swift_bridgeObjectRetain();
  uint64_t v24 = sub_25C9B4300(v23);
  swift_bridgeObjectRelease();
  sub_25C9B04E0(v24);
  swift_release();
  id v74 = sub_25C9B0600();
  id v65 = v19;
  unsigned int v72 = objc_msgSend(v19, sel__contextId);
  id v64 = v21;
  sub_25C9B8290();
  sub_25C9B7BF0();
  int v73 = v11;
  if (!v84)
  {
LABEL_22:
    id v50 = *(void (**)(char *, uint64_t))(v67 + 8);
    v67 += 8;
    v50(v15, v66);
    sub_25C9B8290();
    sub_25C9B7BF0();
    if (v79)
    {
      id v51 = v76;
      do
      {
        sub_25C992214(&v77, &v83);
        if (swift_dynamicCast())
        {
          unint64_t v52 = *(void **)v76;
          if (*(void *)(*(void *)v76 + 16))
          {
            unsigned int v53 = v82;
            unint64_t v54 = sub_25C9B4130(v82);
            if (v55)
            {
              id v56 = *(id *)(v52[7] + 8 * v54);
              objc_msgSend(v56, sel_invalidate);
              OUTLINED_FUNCTION_15();
              unint64_t v57 = sub_25C9B4130(v53);
              if (v58)
              {
                unint64_t v59 = v57;
                swift_isUniquelyReferenced_nonNull_native();
                uint64_t v82 = *(void **)v51;
                *(void *)id v51 = 0x8000000000000000;
                __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E0868);
                sub_25C9B8510();
                double v60 = v82;
                double v61 = *(void **)(v82[7] + 8 * v59);
                sub_25C9950BC(0, &qword_26A5E05B0);
                sub_25C9B8520();
                *(void *)id v51 = v60;

                id v11 = v73;
                swift_bridgeObjectRelease();
              }
              swift_endAccess();
            }
          }
        }
        sub_25C9B7BF0();
      }
      while (v79);
    }
    v50(v11, v66);

    goto LABEL_32;
  }
  uint64_t v71 = &v78;
  id v70 = v15;
  uint64_t v69 = MEMORY[0x263F8EE58] + 8;
  while (1)
  {
    sub_25C992214(&v83, &v77);
    sub_25C9950BC(0, (unint64_t *)&unk_26A5E0640);
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_21;
    }
    id v75 = v82;
    id v25 = objc_msgSend(v82, sel_contextID);
    uint64_t v26 = (void *)sub_25C9B86E0();
    objc_msgSend(v74, sel_removeObject_, v26);

    id v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F298B8]), sel_init);
    id v28 = objc_msgSend(self, sel_policyRequiringSharingOfTouchesDeliveredToChildContextId_withHostContextId_, v25, v72);
    uint64_t v29 = v28;
    if (v28)
    {
      id v30 = v28;
      objc_msgSend(v30, sel_setAssertionEndpoint_, objc_msgSend(v27, sel_endpoint));

      swift_unknownObjectRelease();
    }
    uint64_t v31 = OUTLINED_FUNCTION_12_1();
    *(void *)(v31 + 16) = v3;
    uint64_t v80 = sub_25C9B6308;
    uint64_t v81 = v31;
    *(void *)&long long v77 = MEMORY[0x263EF8330];
    *((void *)&v77 + 1) = 1107296256;
    uint64_t v78 = sub_25C9ABB98;
    id v79 = &block_descriptor_214;
    id v32 = _Block_copy(&v77);
    id v33 = v3;
    uint64_t v34 = v3;
    swift_release();
    id v35 = (id)BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler();
    _Block_release(v32);
    uint64_t v36 = v76;
    OUTLINED_FUNCTION_15();
    id v37 = v27;
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v82 = *(void **)v36;
    id v38 = v82;
    *(void *)uint64_t v36 = 0x8000000000000000;
    unint64_t v39 = sub_25C9B4130(v25);
    if (__OFADD__(v38[2], (v40 & 1) == 0)) {
      break;
    }
    unint64_t v41 = v39;
    char v42 = v40;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E0868);
    if (sub_25C9B8510())
    {
      unint64_t v43 = sub_25C9B4130(v25);
      if ((v42 & 1) != (v44 & 1)) {
        goto LABEL_39;
      }
      unint64_t v41 = v43;
    }
    uint64_t v45 = v82;
    if (v42)
    {
      uint64_t v46 = v82[7];

      *(void *)(v46 + 8 * v41) = v37;
    }
    else
    {
      v82[(v41 >> 6) + 8] |= 1 << v41;
      *(_DWORD *)(v45[6] + 4 * v41) = v25;
      *(void *)(v45[7] + 8 * v41) = v37;
      uint64_t v47 = v45[2];
      BOOL v48 = __OFADD__(v47, 1);
      uint64_t v49 = v47 + 1;
      if (v48) {
        goto LABEL_37;
      }
      v45[2] = v49;
    }
    *(void *)os_log_type_t v76 = v45;
    swift_bridgeObjectRelease();
    swift_endAccess();
    uint64_t v3 = v33;
    if (v35)
    {
      objc_msgSend((id)swift_unknownObjectRetain(), sel_ipc_addPolicy_, v29);

      swift_unknownObjectRelease_n();
    }
    else
    {
    }
    id v11 = v73;
    double v15 = v70;
LABEL_21:
    sub_25C9B7BF0();
    if (!v84) {
      goto LABEL_22;
    }
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  sub_25C9B8630();
  __break(1u);
}

uint64_t sub_25C9B04E0(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    sub_25C9B43E4(0, v1, 0);
    uint64_t v4 = a1 + 32;
    uint64_t v2 = v9;
    do
    {
      v4 += 4;
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25C9B43E4(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_25C9B43E4((char *)(v5 > 1), v6 + 1, 1);
        uint64_t v2 = v9;
      }
      *(void *)(v2 + 16) = v6 + 1;
      sub_25C992214(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
}

id sub_25C9B0600()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  int64_t v1 = (void *)sub_25C9B81B0();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithArray_, v1);

  return v2;
}

void sub_25C9B0678(void *a1, void *a2, const char *a3)
{
  if (a1)
  {
    id v6 = a1;
    if (qword_26A5DF6C0 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_25C9B7C90();
    __swift_project_value_buffer(v7, (uint64_t)qword_26A5E0100);
    id v8 = a1;
    id v9 = a2;
    id v10 = (id)OUTLINED_FUNCTION_49();
    id v11 = a2;
    oslog = sub_25C9B7C70();
    os_log_type_t v12 = sub_25C9B82D0();
    if (os_log_type_enabled(oslog, v12))
    {
      uint64_t v13 = OUTLINED_FUNCTION_24();
      uint64_t v14 = (void *)OUTLINED_FUNCTION_5_4();
      uint64_t v20 = OUTLINED_FUNCTION_11_1();
      *(_DWORD *)uint64_t v13 = 138543618;
      id v18 = a3;
      id v15 = v11;
      sub_25C9B83F0();
      *uint64_t v14 = v11;

      *(_WORD *)(v13 + 12) = 2082;
      swift_getErrorValue();
      uint64_t v16 = sub_25C9B8640();
      sub_25C99F02C(v16, v17, &v20);
      sub_25C9B83F0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_25C989000, oslog, v12, v18, (uint8_t *)v13, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
      OUTLINED_FUNCTION_29();
      OUTLINED_FUNCTION_0_6();
      OUTLINED_FUNCTION_22();
      OUTLINED_FUNCTION_0_6();
      OUTLINED_FUNCTION_0_6();
    }
    else
    {
    }
  }
}

id sub_25C9B08D8()
{
  BSDispatchQueueAssertMain();
  int64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_touchDeliveryPolicyAssertions);
  OUTLINED_FUNCTION_1_4();
  uint64_t v2 = *v1;
  uint64_t v3 = *v1 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(*v1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(*v1 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  id result = (id)swift_bridgeObjectRetain();
  int64_t v9 = 0;
  if (!v6) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v10 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  for (unint64_t i = v10 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v13)) + (v9 << 6))
  {
    id result = objc_msgSend(*(id *)(*(void *)(v2 + 56) + 8 * i), sel_invalidate);
    if (v6) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v12 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_23;
    }
    if (v12 >= v7) {
      goto LABEL_21;
    }
    unint64_t v13 = *(void *)(v3 + 8 * v12);
    ++v9;
    if (!v13)
    {
      int64_t v9 = v12 + 1;
      if (v12 + 1 >= v7) {
        goto LABEL_21;
      }
      unint64_t v13 = *(void *)(v3 + 8 * v9);
      if (!v13)
      {
        int64_t v9 = v12 + 2;
        if (v12 + 2 >= v7) {
          goto LABEL_21;
        }
        unint64_t v13 = *(void *)(v3 + 8 * v9);
        if (!v13) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v6 = (v13 - 1) & v13;
  }
  int64_t v14 = v12 + 3;
  if (v14 >= v7)
  {
LABEL_21:
    swift_release();
    OUTLINED_FUNCTION_15();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E0880);
    sub_25C9B8100();
    return (id)swift_endAccess();
  }
  unint64_t v13 = *(void *)(v3 + 8 * v14);
  if (v13)
  {
    int64_t v9 = v14;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v9 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v9 >= v7) {
      goto LABEL_21;
    }
    unint64_t v13 = *(void *)(v3 + 8 * v9);
    ++v14;
    if (v13) {
      goto LABEL_18;
    }
  }
LABEL_23:
  __break(1u);
  return result;
}

void sub_25C9B0A74()
{
  BSDispatchQueueAssertMain();
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  id v2 = objc_msgSend(v1, sel_layer);
  sub_25C9B5400(0xD000000000000018, 0x800000025C9BC7A0, v2, (SEL *)&selRef_setName_);

  id v3 = objc_msgSend(v0, sel_view);
  if (!v3)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v4 = v3;
  objc_msgSend(v3, sel_bounds);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v1, sel_setFrame_, v6, v8, v10, v12);
  objc_msgSend(v1, sel_setClipsToBounds_, 1);
  objc_msgSend(v1, sel_setAutoresizingMask_, 18);
  id v13 = objc_msgSend(v0, sel_view);
  if (!v13)
  {
LABEL_7:
    __break(1u);
    return;
  }
  int64_t v14 = v13;
  objc_msgSend(v13, sel_addSubview_, v1);

  id v15 = v1;
  sub_25C9A7E68((uint64_t)v1);
  sub_25C9B0C04(0, 0);
}

void sub_25C9B0C04(char a1, char a2)
{
  BSDispatchQueueAssertMain();
  double v5 = *(void **)(v2 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_snippetSceneSnapshotView);
  if (!v5) {
    return;
  }
  id v17 = *(id *)(v2 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_snippetSceneSnapshotView);
  if (a1 != 2)
  {
    int v6 = a1 & 1;
    id v8 = v5;
    if ((a2 & 1) == 0) {
      goto LABEL_4;
    }
LABEL_10:
    self;
    uint64_t v9 = OUTLINED_FUNCTION_4_0();
    *(unsigned char *)(v9 + 16) = v6;
    *(void *)(v9 + 24) = v17;
    id v22 = sub_25C9B5C18;
    uint64_t v23 = v9;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v19 = 1107296256;
    uint64_t v20 = (uint64_t (*)(uint64_t, uint64_t))sub_25C9AA728;
    id v21 = &block_descriptor_107;
    double v10 = _Block_copy(&aBlock);
    id v11 = v17;
    swift_release();
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v11;
    *(unsigned char *)(v12 + 24) = v6;
    id v22 = sub_25C9B5C6C;
    uint64_t v23 = v12;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v19 = 1107296256;
    uint64_t v20 = sub_25C9AA72C;
    id v21 = &block_descriptor_113;
    id v13 = _Block_copy(&aBlock);
    id v14 = v11;
    swift_release();
    id v15 = (void *)OUTLINED_FUNCTION_52();
    [v15 v16];

    _Block_release(v13);
    _Block_release(v10);
    return;
  }
  int v6 = objc_msgSend(v5, sel_isHidden);
  if (a2) {
    goto LABEL_10;
  }
LABEL_4:
  double v7 = 0.0;
  if (v6) {
    double v7 = 1.0;
  }
  objc_msgSend(v17, sel_setAlpha_, v7);
  objc_msgSend(v17, sel_setHidden_, v6 ^ 1u);
}

uint64_t sub_25C9B0E58(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_25C9B0E9C(void *a1, char a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (a2)
  {
    if (qword_26A5DF6C0 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_25C9B7C90();
    __swift_project_value_buffer(v12, (uint64_t)qword_26A5E0100);
    id v13 = a3;
    id v14 = sub_25C9B7C70();
    os_log_type_t v15 = sub_25C9B82B0();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v24 = a5;
      id v17 = (void *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      uint64_t aBlock = v25;
      *(_DWORD *)uint64_t v16 = 138543618;
      id v18 = v13;
      sub_25C9B83F0();
      void *v17 = v13;
      uint64_t v19 = v17;
      a5 = v24;

      *(_WORD *)(v16 + 12) = 2080;
      sub_25C9B5F10();
      uint64_t v20 = sub_25C9B8640();
      sub_25C99F02C(v20, v21, &aBlock);
      sub_25C9B83F0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C989000, v14, v15, "[%{public}@] Snapshot failed - %s", (uint8_t *)v16, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
      swift_arrayDestroy();
      MEMORY[0x26119A890](v19, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x26119A890](v25, -1, -1);
      MEMORY[0x26119A890](v16, -1, -1);
    }
    else
    {
    }
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = a4;
    *(void *)(v22 + 24) = a5;
    *(unsigned char *)(v22 + 32) = (_BYTE)a1;
    id v30 = sub_25C9B5EE0;
    uint64_t v31 = (void *)v22;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v27 = 1107296256;
    id v28 = sub_25C9AA728;
    uint64_t v29 = &block_descriptor_183;
    uint64_t v23 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    BSDispatchMain();
    _Block_release(v23);
  }
  else
  {
    uint64_t v9 = (void *)swift_allocObject();
    void v9[2] = a3;
    v9[3] = a1;
    v9[4] = a4;
    void v9[5] = a5;
    id v30 = sub_25C9B5F9C;
    uint64_t v31 = v9;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v27 = 1107296256;
    id v28 = sub_25C9AA728;
    uint64_t v29 = &block_descriptor_189;
    double v10 = _Block_copy(&aBlock);
    sub_25C9B5FA8(a1, 0);
    sub_25C9B5FA8(a1, 0);
    id v11 = a3;
    swift_retain();
    swift_release();
    BSDispatchMain();
    _Block_release(v10);
    sub_25C9B5FB4(a1, 0);
  }
}

void sub_25C9B1268(char *a1, void *a2, void (*a3)(void))
{
  if (*(_DWORD *)&a1[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController__presentationMode] == 2)
  {
    if (qword_26A5DF6C0 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_25C9B7C90();
    __swift_project_value_buffer(v6, (uint64_t)qword_26A5E0100);
    double v7 = a1;
    id v8 = sub_25C9B7C70();
    os_log_type_t v9 = sub_25C9B82D0();
    if (os_log_type_enabled(v8, v9))
    {
      double v10 = (uint8_t *)swift_slowAlloc();
      id v11 = (void *)swift_slowAlloc();
      *(_DWORD *)double v10 = 138543362;
      uint64_t v12 = a3;
      id v13 = v7;
      sub_25C9B83F0();
      *id v11 = v7;

      a3 = v12;
      _os_log_impl(&dword_25C989000, v8, v9, "[%{public}@] Snapshot success - Updating layer.", v10, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
      swift_arrayDestroy();
      MEMORY[0x26119A890](v11, -1, -1);
      MEMORY[0x26119A890](v10, -1, -1);
    }
    else
    {
    }
    id v14 = objc_msgSend(a2, sel_IOSurface);
    if (!v14) {
      id v14 = objc_msgSend(a2, sel_fallbackIOSurface);
    }
    os_log_type_t v15 = *(void **)&v7[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_snippetSceneSnapshotView];
    if (v15)
    {
      id v16 = objc_msgSend(v15, sel_layer);
      objc_msgSend(v16, sel_setContents_, v14);
    }
    a3(3);
  }
}

unint64_t sub_25C9B14CC(char a1)
{
  unint64_t result = 0xD00000000000001DLL;
  if (a1)
  {
    if (a1 == 1) {
      return 0xD000000000000025;
    }
    else {
      return 0xD000000000000021;
    }
  }
  return result;
}

BOOL sub_25C9B152C(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_25C9B153C()
{
  return sub_25C9B86B0();
}

uint64_t sub_25C9B1564()
{
  return sub_25C9B86D0();
}

BOOL sub_25C9B15AC(char *a1, char *a2)
{
  return sub_25C9B152C(*a1, *a2);
}

uint64_t sub_25C9B15B8()
{
  return sub_25C9B1564();
}

uint64_t sub_25C9B15C0()
{
  return sub_25C9B153C();
}

uint64_t sub_25C9B15C8()
{
  return sub_25C9B86D0();
}

unint64_t sub_25C9B160C()
{
  return sub_25C9B14CC(*v0);
}

uint64_t sub_25C9B1630(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_25C9B80A0();
  uint64_t v32 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8, v9);
  id v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25C9B80C0();
  uint64_t v30 = *(void *)(v12 - 8);
  uint64_t v31 = v12;
  MEMORY[0x270FA5388](v12, v13);
  os_log_type_t v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v16 = (void *)swift_allocObject();
  _OWORD v16[2] = a2;
  v16[3] = a3;
  v16[4] = a4;
  id v17 = a2;
  swift_retain();
  BSDispatchQueueAssertMain();
  id v18 = *(void **)(a1 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scenePresenter);
  if (v18 && (uint64_t v19 = *(void **)(a1 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene)) != 0)
  {
    swift_unknownObjectRetain();
    id v20 = v19;
    if (objc_msgSend(v20, sel_contentState) != (id)2)
    {
      sub_25C9B0E9C((void *)1, 1, v17, a3, a4);

      swift_release();
      swift_unknownObjectRelease();

      return swift_release();
    }
    id v21 = objc_msgSend(v18, sel_newSnapshot);
    id v29 = sub_25C9A7F94();
    uint64_t v22 = (void *)swift_allocObject();
    v22[2] = sub_25C9B5E0C;
    v22[3] = v16;
    v22[4] = v21;
    aBlock[4] = sub_25C9B5E54;
    aBlock[5] = v22;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25C9AA728;
    aBlock[3] = &block_descriptor_177;
    uint64_t v27 = _Block_copy(aBlock);
    swift_retain();
    id v28 = v21;
    sub_25C9B80B0();
    uint64_t v33 = MEMORY[0x263F8EE78];
    uint64_t v26 = sub_25C9B5E60(&qword_26A5E0800, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E0808);
    sub_25C9B5FC0(&qword_26A5E0810, &qword_26A5E0808);
    sub_25C9B8420();
    uint64_t v23 = v27;
    uint64_t v24 = v29;
    MEMORY[0x261199DE0](0, v15, v11, v27);
    _Block_release(v23);

    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v11, v8);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v15, v31);

    swift_release();
  }
  else
  {
    sub_25C9B0E9C(0, 1, v17, a3, a4);
  }
  swift_release();
  return swift_release();
}

uint64_t sub_25C9B1A1C(uint64_t (*a1)(uint64_t, void), int a2, id a3)
{
  unsigned int v5 = objc_msgSend(a3, sel_capture);
  uint64_t v6 = 2;
  if (v5) {
    uint64_t v6 = (uint64_t)a3;
  }
  return a1(v6, v5 ^ 1);
}

id SnippetHostViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_25C9B8140();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void SnippetHostViewController.init(nibName:bundle:)()
{
}

void *sub_25C9B1B48(void *result)
{
  if (result)
  {
    id v1 = result;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E0840);
    sub_25C9950BC(0, &qword_26A5E0848);
    if ((swift_dynamicCast() & 1) == 0) {
      return 0;
    }
    id v2 = objc_msgSend(v10, sel_domain);
    uint64_t v3 = sub_25C9B8150();
    uint64_t v5 = v4;

    if (v3 == sub_25C9B8150() && v5 == v6)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v8 = sub_25C9B85F0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v8 & 1) == 0)
      {

        return 0;
      }
    }
    id v9 = objc_msgSend(v10, sel_code);

    return (void *)(v9 == (id)4);
  }
  return result;
}

void SnippetHostViewController.sceneDidActivate(_:)()
{
  OUTLINED_FUNCTION_31();
  if (qword_26A5DF6C0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25C9B7C90();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A5E0100);
  uint64_t v3 = v0;
  uint64_t v4 = (void *)sub_25C9B7C70();
  os_log_type_t v5 = sub_25C9B82A0();
  if (OUTLINED_FUNCTION_30(v5))
  {
    OUTLINED_FUNCTION_7_3();
    uint64_t v6 = (void *)OUTLINED_FUNCTION_5_4();
    OUTLINED_FUNCTION_20(5.8381e-34);
    OUTLINED_FUNCTION_14();
    *uint64_t v6 = v3;

    OUTLINED_FUNCTION_42(&dword_25C989000, v7, v8, "[%{public}@] Scene did activate.");
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_0_6();
    OUTLINED_FUNCTION_0_6();
  }
  else
  {
  }
  v3[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneActivated] = 1;
  id v9 = &v3[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneActivatedBlocks];
  swift_beginAccess();
  uint64_t v10 = *(void *)v9;
  uint64_t v11 = *(void *)(*(void *)v9 + 16);
  if (v11)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = v10 + 40;
    do
    {
      uint64_t v13 = *(void (**)(uint64_t))(v12 - 8);
      uint64_t v14 = swift_retain();
      v13(v14);
      swift_release();
      v12 += 16;
      --v11;
    }
    while (v11);
    swift_bridgeObjectRelease();
  }
  *(void *)id v9 = MEMORY[0x263F8EE78];
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_41();
}

void SnippetHostViewController.sceneDidInvalidate(_:)()
{
  v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneActivated] = 0;
  if (qword_26A5DF6C0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_25C9B7C90();
  __swift_project_value_buffer(v1, (uint64_t)qword_26A5E0100);
  uint64_t v7 = v0;
  uint64_t v2 = sub_25C9B7C70();
  os_log_type_t v3 = sub_25C9B82A0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)OUTLINED_FUNCTION_7_3();
    os_log_type_t v5 = (void *)OUTLINED_FUNCTION_5_4();
    *(_DWORD *)uint64_t v4 = 138543362;
    uint64_t v6 = v7;
    sub_25C9B83F0();
    *os_log_type_t v5 = v7;

    _os_log_impl(&dword_25C989000, v2, v3, "[%{public}@] Scene did invalidate.", v4, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_6();
    OUTLINED_FUNCTION_0_6();
  }
  else
  {
  }
}

void SnippetHostViewController.sceneDidDeactivate(_:withError:)(void *a1, id a2)
{
  os_log_type_t v3 = v2;
  v2[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneActivated] = 0;
  unint64_t v6 = 0x26A5DF000uLL;
  if (a2)
  {
    id v7 = a2;
    if (qword_26A5DF6C0 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_25C9B7C90();
    __swift_project_value_buffer(v8, (uint64_t)qword_26A5E0100);
    id v9 = a2;
    uint64_t v10 = v2;
    id v11 = a2;
    uint64_t v12 = v10;
    uint64_t v13 = sub_25C9B7C70();
    os_log_type_t v14 = sub_25C9B82A0();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = OUTLINED_FUNCTION_24();
      uint64_t v86 = a1;
      id v16 = (void *)OUTLINED_FUNCTION_5_4();
      uint64_t aBlock = OUTLINED_FUNCTION_11_1();
      *(_DWORD *)uint64_t v15 = 138543618;
      uint64_t v96 = (uint64_t)v12;
      id v17 = v12;
      sub_25C9B83F0();
      *id v16 = v12;

      *(_WORD *)(v15 + 12) = 2082;
      swift_getErrorValue();
      uint64_t v18 = sub_25C9B8640();
      uint64_t v20 = sub_25C99F02C(v18, v19, &aBlock);
      OUTLINED_FUNCTION_47(v20);
      unint64_t v6 = 0x26A5DF000;
      sub_25C9B83F0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_25C989000, v13, v14, "[%{public}@] Scene did deactivate with error: %{public}s.", (uint8_t *)v15, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
      swift_arrayDestroy();
      a1 = v86;
      OUTLINED_FUNCTION_0_6();
      OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_0_6();
      OUTLINED_FUNCTION_0_6();

      goto LABEL_13;
    }
  }
  else
  {
    if (qword_26A5DF6C0 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_25C9B7C90();
    __swift_project_value_buffer(v21, (uint64_t)qword_26A5E0100);
    uint64_t v13 = v2;
    uint64_t v22 = sub_25C9B7C70();
    os_log_type_t v23 = sub_25C9B82A0();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)OUTLINED_FUNCTION_7_3();
      uint64_t v87 = (void *)OUTLINED_FUNCTION_5_4();
      *(_DWORD *)uint64_t v24 = 138543362;
      uint64_t aBlock = (uint64_t)v13;
      uint64_t v25 = v13;
      unint64_t v6 = 0x26A5DF000;
      sub_25C9B83F0();
      *uint64_t v87 = v13;

      _os_log_impl(&dword_25C989000, v22, v23, "[%{public}@] Scene did deactivate.", v24, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0_6();
      OUTLINED_FUNCTION_0_6();

      goto LABEL_13;
    }
  }
LABEL_13:
  uint64_t v26 = *(void **)&v3[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene];
  if (v26)
  {
    id v27 = v26;
    if (sub_25C9B1B48(a2))
    {
      uint64_t v88 = a1;
      uint64_t v28 = OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneClientAlreadyExitedOnceWithinTimeout;
      uint64_t v29 = *(void *)(v6 + 1728);
      if (v3[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneClientAlreadyExitedOnceWithinTimeout] == 1)
      {
        if (v29 != -1) {
          swift_once();
        }
        uint64_t v30 = sub_25C9B7C90();
        __swift_project_value_buffer(v30, (uint64_t)qword_26A5E0100);
        uint64_t v31 = v3;
        uint64_t v32 = sub_25C9B7C70();
        os_log_type_t v33 = sub_25C9B82D0();
        if (os_log_type_enabled(v32, v33))
        {
          uint64_t v34 = OUTLINED_FUNCTION_11_1();
          id v35 = (void *)OUTLINED_FUNCTION_5_4();
          uint64_t aBlock = OUTLINED_FUNCTION_11_1();
          *(_DWORD *)uint64_t v34 = 138543874;
          uint64_t v85 = v27;
          uint64_t v96 = (uint64_t)v31;
          uint64_t v36 = v31;
          sub_25C9B83F0();
          *id v35 = v31;

          *(_WORD *)(v34 + 12) = 2082;
          uint64_t v37 = *(void *)&v36[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_processIdentity];
          unint64_t v38 = *(void *)&v36[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_processIdentity + 8];
          swift_bridgeObjectRetain();
          uint64_t v39 = sub_25C99F02C(v37, v38, &aBlock);
          OUTLINED_FUNCTION_47(v39);
          sub_25C9B83F0();

          swift_bridgeObjectRelease();
          *(_WORD *)(v34 + 22) = 2050;
          uint64_t v96 = 0x4014000000000000;
          sub_25C9B83F0();

          _os_log_impl(&dword_25C989000, v32, v33, "[%{public}@] This is the second %{public}s exit within %{public}f seconds, ending the session", (uint8_t *)v34, 0x20u);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
          OUTLINED_FUNCTION_27();
          OUTLINED_FUNCTION_0_6();
          swift_arrayDestroy();
          OUTLINED_FUNCTION_0_6();
          OUTLINED_FUNCTION_0_6();
        }
        else
        {
        }
        return;
      }
      if (v29 != -1) {
        swift_once();
      }
      uint64_t v50 = sub_25C9B7C90();
      __swift_project_value_buffer(v50, (uint64_t)qword_26A5E0100);
      id v51 = v3;
      id v52 = a2;
      unsigned int v53 = v51;
      id v54 = a2;
      char v55 = v53;
      id v56 = sub_25C9B7C70();
      os_log_type_t v57 = sub_25C9B82D0();
      if (os_log_type_enabled(v56, v57))
      {
        uint64_t v58 = swift_slowAlloc();
        uint64_t v84 = (void *)OUTLINED_FUNCTION_5_4();
        uint64_t aBlock = swift_slowAlloc();
        *(_DWORD *)uint64_t v58 = 138544130;
        os_log_type_t v89 = v3;
        uint64_t v96 = (uint64_t)v55;
        unint64_t v59 = v55;
        sub_25C9B83F0();
        *uint64_t v84 = v55;

        *(_WORD *)(v58 + 12) = 2082;
        uint64_t v60 = *(void *)&v59[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_processIdentity];
        unint64_t v61 = *(void *)&v59[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_processIdentity + 8];
        swift_bridgeObjectRetain();
        uint64_t v62 = sub_25C99F02C(v60, v61, &aBlock);
        OUTLINED_FUNCTION_47(v62);
        sub_25C9B83F0();

        swift_bridgeObjectRelease();
        *(_WORD *)(v58 + 22) = 2050;
        uint64_t v96 = 0x4014000000000000;
        sub_25C9B83F0();

        *(_WORD *)(v58 + 32) = 2080;
        uint64_t v96 = (uint64_t)a2;
        id v63 = a2;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E0650);
        uint64_t v64 = sub_25C9B8160();
        uint64_t v96 = sub_25C99F02C(v64, v65, &aBlock);
        sub_25C9B83F0();
        os_log_type_t v3 = v89;
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_25C989000, v56, v57, "[%{public}@] %{public}s exited for the first time within %{public}f seconds with error: %s", (uint8_t *)v58, 0x2Au);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
        OUTLINED_FUNCTION_38();
        OUTLINED_FUNCTION_0_6();
        swift_arrayDestroy();
        OUTLINED_FUNCTION_0_6();
        OUTLINED_FUNCTION_0_6();
      }
      else
      {
      }
      v3[v28] = 1;
      uint64_t v66 = OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneClientExitTimer;
      a1 = v88;
      if (!*(void *)&v55[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneClientExitTimer])
      {
        sub_25C9950BC(0, &qword_26A5E0628);
        id v67 = sub_25C9AA980();
        sub_25C9A8268((uint64_t)v67);
        id v68 = *(void **)&v55[v66];
        if (v68)
        {
          sub_25C9950BC(0, &qword_26A5E0630);
          id v69 = v68;
          id v70 = (void *)sub_25C9B8320();
          uint64_t v71 = OUTLINED_FUNCTION_12_1();
          swift_unknownObjectWeakInit();
          v94 = sub_25C9B5580;
          uint64_t v95 = v71;
          uint64_t aBlock = MEMORY[0x263EF8330];
          unint64_t v91 = 1107296256;
          uint64_t v92 = sub_25C99C188;
          unint64_t v93 = &block_descriptor_26;
          unsigned int v72 = _Block_copy(&aBlock);
          swift_release();
          objc_msgSend(v69, sel_scheduleWithFireInterval_leewayInterval_queue_handler_, v70, v72, 5.0, 0.0);
          _Block_release(v72);
        }
      }
    }
    sub_25C9950BC(0, (unint64_t *)&qword_26A5DFDD0);
    if (sub_25C9B83C0())
    {
      uint64_t v73 = OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_backOffTimer;
      if (!*(void *)&v3[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_backOffTimer])
      {
        uint64_t aBlock = 0;
        unint64_t v91 = 0xE000000000000000;
        sub_25C9B84C0();
        swift_bridgeObjectRelease();
        uint64_t aBlock = 0xD00000000000001BLL;
        unint64_t v91 = 0x800000025C9BC0F0;
        id v74 = objc_msgSend(v3, sel_description);
        sub_25C9B8150();
        id v75 = v3;

        sub_25C9B8180();
        swift_bridgeObjectRelease();
        uint64_t v76 = aBlock;
        uint64_t v77 = v91;
        sub_25C9950BC(0, &qword_26A5E0630);
        uint64_t v78 = sub_25C9B8320();
        uint64_t v79 = OUTLINED_FUNCTION_12_1();
        swift_unknownObjectWeakInit();
        uint64_t v80 = OUTLINED_FUNCTION_4_0();
        *(void *)(v80 + 16) = v79;
        *(void *)(v80 + 24) = a1;
        type metadata accessor for BackOffTimer();
        swift_allocObject();
        uint64_t v81 = sub_25C99B89C(v76, v77, v78, (uint64_t)sub_25C9B5578, v80);
        id v82 = a1;
        sub_25C9A8244(v81);
        uint64_t v83 = *(void *)&v75[v73];
        if (!v83 || (*(void *)(v83 + 72) = 0x4046800000000000, *(unsigned char *)(v83 + 80) = 0, !*(void *)&v75[v73]))
        {
          __break(1u);
          return;
        }
      }
      swift_retain();
      sub_25C99B95C();
      swift_release();
    }

    return;
  }
  if (*(void *)(v6 + 1728) != -1) {
    swift_once();
  }
  uint64_t v40 = sub_25C9B7C90();
  __swift_project_value_buffer(v40, (uint64_t)qword_26A5E0100);
  id v41 = a1;
  char v42 = sub_25C9B7C70();
  os_log_type_t v43 = sub_25C9B82B0();
  if (os_log_type_enabled(v42, v43))
  {
    char v44 = (uint8_t *)OUTLINED_FUNCTION_7_3();
    uint64_t aBlock = OUTLINED_FUNCTION_11_1();
    *(_DWORD *)char v44 = 136315138;
    id v45 = objc_msgSend(v41, sel_identifier);
    uint64_t v46 = sub_25C9B8150();
    unint64_t v48 = v47;

    uint64_t v49 = sub_25C99F02C(v46, v48, &aBlock);
    OUTLINED_FUNCTION_46(v49);
    sub_25C9B83F0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C989000, v42, v43, "No snippet scene found: %s", v44, 0xCu);
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_0_6();
    OUTLINED_FUNCTION_0_6();
  }
  else
  {
  }
}

void sub_25C9B2D98(void *a1, uint64_t a2)
{
  uint64_t v3 = a2 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x26119A970](v3);
  if (v4)
  {
    os_log_type_t v5 = (void *)v4;
    *(unsigned char *)(v4
             + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneClientAlreadyExitedOnceWithinTimeout) = 0;
    objc_msgSend(a1, sel_invalidate);
    sub_25C9A8268(0);
  }
}

void sub_25C9B2E10(uint64_t a1, void *a2)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x26119A970](v3);
  if (v4)
  {
    os_log_type_t v5 = (void *)v4;
    id v6 = objc_msgSend(a2, sel_settings);
    unsigned int v7 = objc_msgSend(v6, sel_isForeground);

    if ((*((unsigned char *)v5 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_isInvalidated) & 1) == 0 && v7)
    {
      if (qword_26A5DF6C0 != -1) {
        swift_once();
      }
      uint64_t v8 = sub_25C9B7C90();
      __swift_project_value_buffer(v8, (uint64_t)qword_26A5E0100);
      id v9 = v5;
      uint64_t v10 = sub_25C9B7C70();
      os_log_type_t v11 = sub_25C9B82D0();
      if (os_log_type_enabled(v10, v11))
      {
        uint64_t v12 = (uint8_t *)swift_slowAlloc();
        uint64_t v13 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v12 = 138543362;
        os_log_type_t v14 = v9;
        sub_25C9B83F0();
        *uint64_t v13 = v5;

        _os_log_impl(&dword_25C989000, v10, v11, "[%{public}@] Scene did deactivate but was foreground - reactivating.", v12, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
        swift_arrayDestroy();
        MEMORY[0x26119A890](v13, -1, -1);
        MEMORY[0x26119A890](v12, -1, -1);
      }
      else
      {

        uint64_t v10 = v9;
      }

      objc_msgSend(a2, sel_activateWithTransitionContext_, 0);
    }
  }
}

void SnippetHostViewController.scene(_:didReceive:)(uint64_t a1, uint64_t a2)
{
  if (qword_26A5DF6C0 == -1) {
    goto LABEL_2;
  }
  while (1)
  {
    swift_once();
LABEL_2:
    uint64_t v4 = sub_25C9B7C90();
    __swift_project_value_buffer(v4, (uint64_t)qword_26A5E0100);
    id v5 = (id)v2;
    OUTLINED_FUNCTION_49();
    swift_bridgeObjectRetain_n();
    id v6 = (id)v2;
    unsigned int v7 = sub_25C9B7C70();
    os_log_type_t v8 = sub_25C9B82D0();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = OUTLINED_FUNCTION_24();
      uint64_t v10 = (void *)OUTLINED_FUNCTION_5_4();
      uint64_t v28 = OUTLINED_FUNCTION_11_1();
      uint64_t v31 = (uint64_t)v6;
      v32[0] = v28;
      *(_DWORD *)uint64_t v9 = 138543619;
      id v11 = v6;
      sub_25C9B83F0();
      void *v10 = v6;

      *(_WORD *)(v9 + 12) = 2081;
      sub_25C9950BC(0, &qword_26A5E0658);
      sub_25C9B5588();
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_25C9B8270();
      unint64_t v14 = v13;
      swift_bridgeObjectRelease();
      uint64_t v31 = sub_25C99F02C(v12, v14, v32);
      sub_25C9B83F0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C989000, v7, v8, "[%{public}@] Scene did receive actions: %{private}s", (uint8_t *)v9, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
      OUTLINED_FUNCTION_29();
      OUTLINED_FUNCTION_0_6();
      OUTLINED_FUNCTION_22();
      OUTLINED_FUNCTION_0_6();
      OUTLINED_FUNCTION_0_6();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    if (*((unsigned char *)v6 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_isInvalidated)) {
      break;
    }
    uint64_t v31 = MEMORY[0x263F8EE88];
    if ((a2 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      sub_25C9B8440();
      sub_25C9950BC(0, &qword_26A5E0658);
      sub_25C9B5588();
      sub_25C9B8280();
      a2 = v32[0];
      uint64_t v29 = v32[1];
      uint64_t v2 = v32[2];
      uint64_t v15 = v32[3];
      unint64_t v16 = v32[4];
    }
    else
    {
      uint64_t v17 = -1 << *(unsigned char *)(a2 + 32);
      uint64_t v29 = a2 + 56;
      uint64_t v2 = ~v17;
      uint64_t v18 = -v17;
      if (v18 < 64) {
        uint64_t v19 = ~(-1 << v18);
      }
      else {
        uint64_t v19 = -1;
      }
      unint64_t v16 = v19 & *(void *)(a2 + 56);
      swift_bridgeObjectRetain();
      uint64_t v15 = 0;
    }
    int64_t v20 = (unint64_t)(v2 + 64) >> 6;
    if (a2 < 0)
    {
      while (sub_25C9B8470())
      {
        sub_25C9950BC(0, &qword_26A5E0658);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v24 = v30;
        swift_unknownObjectRelease();
        uint64_t v23 = v15;
        uint64_t v21 = v16;
        if (!v24) {
          break;
        }
LABEL_33:
        uint64_t v2 = (uint64_t)&v31;
        sub_25C9B44E8(&v30, v24);

        uint64_t v15 = v23;
        unint64_t v16 = v21;
        if ((a2 & 0x8000000000000000) == 0) {
          goto LABEL_13;
        }
      }
      goto LABEL_35;
    }
LABEL_13:
    if (v16)
    {
      uint64_t v21 = (v16 - 1) & v16;
      unint64_t v22 = __clz(__rbit64(v16)) | (v15 << 6);
      uint64_t v23 = v15;
LABEL_32:
      id v24 = *(id *)(*(void *)(a2 + 48) + 8 * v22);
      if (v24) {
        goto LABEL_33;
      }
      goto LABEL_35;
    }
    int64_t v25 = v15 + 1;
    if (!__OFADD__(v15, 1))
    {
      if (v25 < v20)
      {
        unint64_t v26 = *(void *)(v29 + 8 * v25);
        uint64_t v23 = v15 + 1;
        if (!v26)
        {
          uint64_t v23 = v15 + 2;
          if (v15 + 2 >= v20) {
            goto LABEL_35;
          }
          unint64_t v26 = *(void *)(v29 + 8 * v23);
          if (!v26)
          {
            uint64_t v23 = v15 + 3;
            if (v15 + 3 >= v20) {
              goto LABEL_35;
            }
            unint64_t v26 = *(void *)(v29 + 8 * v23);
            if (!v26)
            {
              uint64_t v23 = v15 + 4;
              if (v15 + 4 >= v20) {
                goto LABEL_35;
              }
              unint64_t v26 = *(void *)(v29 + 8 * v23);
              if (!v26)
              {
                int64_t v27 = v15 + 5;
                while (v27 < v20)
                {
                  unint64_t v26 = *(void *)(v29 + 8 * v27++);
                  if (v26)
                  {
                    uint64_t v23 = v27 - 1;
                    goto LABEL_31;
                  }
                }
                goto LABEL_35;
              }
            }
          }
        }
LABEL_31:
        uint64_t v21 = (v26 - 1) & v26;
        unint64_t v22 = __clz(__rbit64(v26)) + (v23 << 6);
        goto LABEL_32;
      }
LABEL_35:
      sub_25C9B64C0();
      swift_bridgeObjectRelease();
      return;
    }
    __break(1u);
  }
}

void SnippetHostViewController.scene(_:didUpdateClientSettingsWith:oldClientSettings:transitionContext:)()
{
  OUTLINED_FUNCTION_32();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  if (qword_26A5DF6C0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_25C9B7C90();
  __swift_project_value_buffer(v5, (uint64_t)qword_26A5E0100);
  id v6 = v0;
  unsigned int v7 = sub_25C9B7C70();
  os_log_type_t v8 = sub_25C9B82A0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v15 = v2;
    uint64_t v9 = v4;
    uint64_t v10 = (uint8_t *)OUTLINED_FUNCTION_7_3();
    id v11 = (void *)OUTLINED_FUNCTION_5_4();
    *(_DWORD *)uint64_t v10 = 138543362;
    unint64_t v16 = v6;
    uint64_t v12 = v6;
    sub_25C9B83F0();
    *id v11 = v6;

    uint64_t v4 = v9;
    uint64_t v2 = v15;
    _os_log_impl(&dword_25C989000, v7, v8, "[%{public}@] Scene did receive new client settings.", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
    OUTLINED_FUNCTION_29();
    OUTLINED_FUNCTION_0_6();
    OUTLINED_FUNCTION_0_6();

    if (!v15) {
      goto LABEL_9;
    }
  }
  else
  {

    if (!v2) {
      goto LABEL_9;
    }
  }
  id v13 = objc_msgSend(v2, sel_animationFence, v15, v16);
  if (v13)
  {
    unint64_t v14 = v13;
    objc_msgSend(self, sel__synchronizeDrawingWithFence_, v13);
  }
LABEL_9:
  objc_msgSend(*(id *)&v6[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_settingsDiffInspector], sel_inspectDiff_withContext_, v4, 0, v15);
  OUTLINED_FUNCTION_8_2();
}

void SnippetHostViewController.sceneLayerManagerDidUpdateLayers(_:)()
{
}

void SnippetHostViewController.sceneLayerManagerDidStopTrackingLayers(_:)()
{
}

void SnippetHostViewController.sceneLayerManagerDidStartTrackingLayers(_:)()
{
}

void sub_25C9B3994()
{
  OUTLINED_FUNCTION_32();
  uint64_t v4 = v3;
  v5();
  if (qword_26A5DF6C0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_25C9B7C90();
  __swift_project_value_buffer(v6, (uint64_t)qword_26A5E0100);
  id v14 = v0;
  unsigned int v7 = sub_25C9B7C70();
  os_log_type_t v8 = sub_25C9B82A0();
  if (OUTLINED_FUNCTION_30(v8))
  {
    uint64_t v9 = (uint8_t *)OUTLINED_FUNCTION_7_3();
    uint64_t v10 = (void *)OUTLINED_FUNCTION_5_4();
    *(_DWORD *)uint64_t v9 = 138543362;
    id v11 = v14;
    OUTLINED_FUNCTION_14();
    void *v10 = v14;

    _os_log_impl(&dword_25C989000, v7, v1, v4, v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E03F0);
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_0_6();
    OUTLINED_FUNCTION_0_6();

    OUTLINED_FUNCTION_8_2();
  }
  else
  {

    OUTLINED_FUNCTION_8_2();
  }
}

Swift::Void __swiftcall SnippetHostViewController.presentationControllerDidDismiss(_:)(UIPresentationController a1)
{
}

char *sub_25C9B3BD4()
{
  uint64_t v1 = *v0;
  unint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
  uint64_t *v0 = v1;
  if (!result)
  {
    unint64_t result = sub_25C9B3C60(result, *(void *)(v1 + 16) + 1, 1, v1);
    uint64_t *v0 = (uint64_t)result;
  }
  return result;
}

char *sub_25C9B3C20(char *result)
{
  unint64_t v2 = *(void *)(*v1 + 24);
  if ((uint64_t)(result + 1) > (uint64_t)(v2 >> 1))
  {
    unint64_t result = sub_25C9B3C60((char *)(v2 > 1), (int64_t)(result + 1), 1, *v1);
    *uint64_t v1 = (uint64_t)result;
  }
  return result;
}

char *sub_25C9B3C60(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E0850);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_25C9B3EFC((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25C9B3D50(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_25C9B3D50(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E0858);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_25C9B85C0();
  __break(1u);
  return result;
}

char *sub_25C9B3E68(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_25C9B85C0();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

char *sub_25C9B3EFC(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_25C9B85C0();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_25C9B3F90(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 32 * a2 > a1 ? (BOOL v3 = a1 + 32 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_25C9B85C0();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_25C9B4074()
{
  swift_unknownObjectWeakDestroy();
  OUTLINED_FUNCTION_39();
  return swift_deallocObject();
}

void sub_25C9B40A4(void *a1, uint64_t a2)
{
  sub_25C9A9260(a1, a2, v2);
}

void sub_25C9B40AC(void *a1, uint64_t a2)
{
  sub_25C9A9408(a1, a2, *(void **)(v2 + 16));
}

void sub_25C9B40B4(void *a1, uint64_t a2)
{
  sub_25C9A9814(a1, a2, *(void **)(v2 + 16));
}

unint64_t sub_25C9B40BC(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFFA0);
  uint64_t v2 = sub_25C9B8110();
  return sub_25C9B4178(a1, v2);
}

unint64_t sub_25C9B4130(unsigned int a1)
{
  uint64_t v3 = MEMORY[0x26119A140](*(void *)(v1 + 40), a1, 4);
  return sub_25C9B4248(a1, v3);
}

unint64_t sub_25C9B4178(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5DFFA0);
    do
    {
      if (sub_25C9B8130()) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_25C9B4248(int a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_25C9B42E4(uint64_t result, uint64_t a2, void *a3)
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

uint64_t sub_25C9B4300(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E0878);
  uint64_t v3 = swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size((const void *)v3);
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = 2 * ((uint64_t)(v4 - 32) / 4);
  uint64_t v5 = sub_25C9B632C(&v7, (_DWORD *)(v3 + 32), v1, a1);
  swift_bridgeObjectRetain();
  sub_25C9B64C0();
  if (v5 != (void *)v1)
  {
    __break(1u);
    return MEMORY[0x263F8EE78];
  }
  return v3;
}

char *sub_25C9B43E4(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_25C9B4404(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

char *sub_25C9B4404(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E0870);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25C9B3E68(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25C9B3F90((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_25C9B44E8(void *a1, void *a2)
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
    uint64_t v9 = sub_25C9B8460();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_25C9950BC(0, &qword_26A5E0658);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_25C9B8450();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = sub_25C9B4784(v7, result + 1);
    uint64_t v27 = v21;
    if (*(void *)(v21 + 24) <= *(void *)(v21 + 16))
    {
      id v25 = v8;
      sub_25C9B496C();
      uint64_t v22 = v27;
    }
    else
    {
      uint64_t v22 = v21;
      id v23 = v8;
    }
    sub_25C9B4C08((uint64_t)v8, v22);
    *uint64_t v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_25C9B83B0();
    uint64_t v11 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v12 = v10 & ~v11;
    if ((*(void *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12))
    {
      sub_25C9950BC(0, &qword_26A5E0658);
      id v13 = *(id *)(*(void *)(v6 + 48) + 8 * v12);
      char v14 = sub_25C9B83C0();

      if (v14)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v18 = *(void **)(*(void *)(*v2 + 48) + 8 * v12);
        *a1 = v18;
        id v19 = v18;
        return 0;
      }
      uint64_t v15 = ~v11;
      while (1)
      {
        unint64_t v12 = (v12 + 1) & v15;
        if (((*(void *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0) {
          break;
        }
        id v16 = *(id *)(*(void *)(v6 + 48) + 8 * v12);
        char v17 = sub_25C9B83C0();

        if (v17) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v2;
    uint64_t *v2 = 0x8000000000000000;
    id v8 = a2;
    sub_25C9B4C8C((uint64_t)v8, v12, isUniquelyReferenced_nonNull_native);
    uint64_t *v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_25C9B4784(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E0838);
  uint64_t v2 = sub_25C9B84A0();
  uint64_t v14 = v2;
  sub_25C9B8440();
  if (!sub_25C9B8470())
  {
LABEL_16:
    swift_release();
    return v2;
  }
  sub_25C9950BC(0, &qword_26A5E0658);
  while (1)
  {
    swift_dynamicCast();
    uint64_t v2 = v14;
    if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
    {
      sub_25C9B496C();
      uint64_t v2 = v14;
    }
    uint64_t result = sub_25C9B83B0();
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
    if (!sub_25C9B8470()) {
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

uint64_t sub_25C9B496C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E0838);
  uint64_t v3 = sub_25C9B8490();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v6 = (void *)(v2 + 56);
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
      uint64_t result = sub_25C9B83B0();
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
                sub_25C9B42E4(0, (unint64_t)(v27 + 63) >> 6, (void *)(v2 + 56));
              }
              else {
                *unint64_t v6 = -1 << v27;
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
  *uint64_t v1 = v4;
  return result;
}

unint64_t sub_25C9B4C08(uint64_t a1, uint64_t a2)
{
  sub_25C9B83B0();
  unint64_t result = sub_25C9B8430();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

void sub_25C9B4C8C(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_25C9B496C();
  }
  else
  {
    if (v7 > v6)
    {
      sub_25C9B4E14();
      goto LABEL_14;
    }
    sub_25C9B4FC0();
  }
  uint64_t v8 = *v3;
  uint64_t v9 = sub_25C9B83B0();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_25C9950BC(0, &qword_26A5E0658);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_25C9B83C0();

    if (v12)
    {
LABEL_13:
      sub_25C9B8620();
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
        char v15 = sub_25C9B83C0();

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

id sub_25C9B4E14()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E0838);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25C9B8480();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
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
    unint64_t v20 = *(void **)(*(void *)(v2 + 48) + 8 * i);
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

uint64_t sub_25C9B4FC0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E0838);
  uint64_t v3 = sub_25C9B8490();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    *uint64_t v1 = v4;
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
    uint64_t result = sub_25C9B83B0();
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

void sub_25C9B5238(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_25C9B8140();
  objc_msgSend(a3, sel_addMilestone_, v4);
}

uint64_t sub_25C9B5290()
{
  OUTLINED_FUNCTION_17();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_25C9B52D8(uint64_t a1)
{
  return sub_25C9AA05C(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48));
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

uint64_t sub_25C9B5300()
{
  OUTLINED_FUNCTION_17();

  OUTLINED_FUNCTION_19();
  return swift_deallocObject();
}

uint64_t sub_25C9B5330()
{
  return sub_25C9AA780(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

id sub_25C9B533C(void *a1)
{
  return sub_25C9AA9EC(a1, *(id *)(v1 + 16));
}

void sub_25C9B5344(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_25C9B8140();
  objc_msgSend(a3, sel_satisfyMilestone_, v4);
}

uint64_t sub_25C9B539C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_25C9B5400(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  id v6 = (id)sub_25C9B8140();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, *a4, v6);
}

uint64_t sub_25C9B546C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v11[3] = a3;
  v11[4] = a4;
  void v11[5] = a5;
  boxed_opaque_existential_2 = __swift_allocate_boxed_opaque_existential_2(v11);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(boxed_opaque_existential_2, a1, a3);
  int64_t v9 = (uint64_t *)(a2 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_viewModel);
  OUTLINED_FUNCTION_15();
  __swift_assign_boxed_opaque_existential_2(v9, v11);
  swift_endAccess();
  sub_25C9A8280();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
}

void sub_25C9B551C(void *a1)
{
  sub_25C9B0678(a1, *(void **)(v1 + 16), "[%{public}@] Sending cancellation touch delivery policy failed with error: %{public}s");
}

uint64_t sub_25C9B5540()
{
  swift_release();

  OUTLINED_FUNCTION_18();
  return swift_deallocObject();
}

void sub_25C9B5578()
{
  sub_25C9B2E10(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_25C9B5580(void *a1)
{
  sub_25C9B2D98(a1, v1);
}

unint64_t sub_25C9B5588()
{
  unint64_t result = qword_26A5E0660;
  if (!qword_26A5E0660)
  {
    sub_25C9950BC(255, &qword_26A5E0658);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E0660);
  }
  return result;
}

unint64_t sub_25C9B55EC()
{
  unint64_t result = qword_26A5E0668;
  if (!qword_26A5E0668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E0668);
  }
  return result;
}

uint64_t sub_25C9B5638()
{
  OUTLINED_FUNCTION_8_1();
  uint64_t result = sub_25C9A74F4();
  uint64_t *v0 = result;
  return result;
}

uint64_t sub_25C9B5660()
{
  OUTLINED_FUNCTION_8_1();
  uint64_t result = sub_25C9A784C();
  _DWORD *v0 = result;
  return result;
}

void sub_25C9B5684(unsigned int *a1)
{
}

void *sub_25C9B56AC()
{
  OUTLINED_FUNCTION_8_1();
  uint64_t result = sub_25C9A7988();
  void *v0 = result;
  return result;
}

uint64_t sub_25C9B56D4()
{
  OUTLINED_FUNCTION_8_1();
  uint64_t result = sub_25C9A7B14();
  uint64_t *v0 = result;
  return result;
}

id sub_25C9B56FC()
{
  OUTLINED_FUNCTION_8_1();
  id result = sub_25C9A7C6C();
  void *v0 = result;
  return result;
}

uint64_t sub_25C9B5724()
{
  OUTLINED_FUNCTION_8_1();
  uint64_t result = sub_25C9AB5B8();
  unsigned char *v0 = result & 1;
  return result;
}

void sub_25C9B574C(char *a1)
{
}

uint64_t method lookup function for SnippetHostViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SnippetHostViewController);
}

uint64_t dispatch thunk of SnippetHostViewController.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of SnippetHostViewController.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of SnippetHostViewController.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of SnippetHostViewController.presentationMode.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of SnippetHostViewController.presentationMode.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of SnippetHostViewController.presentationMode.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of SnippetHostViewController.resolvedMetrics.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of SnippetHostViewController.activityTouchRestrictedRects.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of SnippetHostViewController.systemProvidedMetrics.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of SnippetHostViewController.systemProvidedMetrics.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of SnippetHostViewController.systemProvidedMetrics.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of SnippetHostViewController.__allocating_init<A>(bundleIdentifier:viewModel:)()
{
  return (*(uint64_t (**)(void))(v0 + 992))();
}

uint64_t dispatch thunk of SnippetHostViewController.ensureContent(timeout:queue:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3E8))();
}

uint64_t dispatch thunk of SnippetHostViewController.invalidate()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3F0))();
}

uint64_t dispatch thunk of SnippetHostViewController.updateViewModel<A>(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3F8))();
}

uint64_t dispatch thunk of SnippetHostViewController.shouldShareTouchesWithHost.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x400))();
}

uint64_t dispatch thunk of SnippetHostViewController.shouldShareTouchesWithHost.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x408))();
}

uint64_t dispatch thunk of SnippetHostViewController.shouldShareTouchesWithHost.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x410))();
}

uint64_t dispatch thunk of SnippetHostViewController.cancelTouchesForCurrentEventInHostedContent()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x418))();
}

ValueMetadata *type metadata accessor for SnippetHostViewController.PresentationMode()
{
  return &type metadata for SnippetHostViewController.PresentationMode;
}

uint64_t sub_25C9B5BE8()
{
  OUTLINED_FUNCTION_18();
  return swift_deallocObject();
}

id sub_25C9B5C18()
{
  double v1 = 0.0;
  if (*(unsigned char *)(v0 + 16)) {
    double v1 = 1.0;
  }
  return objc_msgSend(*(id *)(v0 + 24), sel_setAlpha_, v1);
}

uint64_t sub_25C9B5C3C()
{
  OUTLINED_FUNCTION_17();
  return swift_deallocObject();
}

id sub_25C9B5C6C()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_setHidden_, (*(unsigned char *)(v0 + 24) & 1) == 0);
}

void sub_25C9B5C88(void *a1, void *a2)
{
  sub_25C9AFAF0(a1, a2, *(void *)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_25C9B5C90()
{
  OUTLINED_FUNCTION_17();

  OUTLINED_FUNCTION_18();
  return swift_deallocObject();
}

id sub_25C9B5CC0(void *a1)
{
  return sub_25C9AEE38(a1, *(char **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_25C9B5CCC()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_39();
  return swift_deallocObject();
}

void sub_25C9B5CF4(void *a1)
{
  sub_25C9AF0F8(a1, *(void *)(v1 + 16));
}

uint64_t sub_25C9B5D00()
{
  OUTLINED_FUNCTION_19();
  return swift_deallocObject();
}

void sub_25C9B5D30(void *a1, uint64_t a2)
{
  sub_25C9AF1F4(a1, a2, *(void *)(v2 + 16), *(unsigned char *)(v2 + 24), *(char **)(v2 + 32));
}

uint64_t sub_25C9B5D44()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_25C9B5D74()
{
  return swift_deallocObject();
}

id sub_25C9B5D84(void *a1)
{
  return objc_msgSend(a1, sel_setForeground_, *(unsigned __int8 *)(v1 + 16));
}

uint64_t objectdestroy_145Tm()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  OUTLINED_FUNCTION_18();
  return swift_deallocObject();
}

void sub_25C9B5DD4(unsigned __int8 a1)
{
  sub_25C9AD990(a1, *(void **)(v1 + 16));
}

uint64_t sub_25C9B5DDC()
{
  OUTLINED_FUNCTION_17();
  swift_release();
  OUTLINED_FUNCTION_19();
  return swift_deallocObject();
}

void sub_25C9B5E0C(void *a1, char a2)
{
  sub_25C9B0E9C(a1, a2 & 1, *(void **)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
}

uint64_t sub_25C9B5E1C()
{
  swift_release();

  OUTLINED_FUNCTION_19();
  return swift_deallocObject();
}

uint64_t sub_25C9B5E54()
{
  return sub_25C9B1A1C(*(uint64_t (**)(uint64_t, void))(v0 + 16), *(void *)(v0 + 24), *(id *)(v0 + 32));
}

uint64_t sub_25C9B5E60(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25C9B5EA8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_25C9B5EE0()
{
  return (*(uint64_t (**)(void))(v0 + 16))(*(unsigned __int8 *)(v0 + 32));
}

unint64_t sub_25C9B5F10()
{
  unint64_t result = qword_26A5E0818;
  if (!qword_26A5E0818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E0818);
  }
  return result;
}

uint64_t sub_25C9B5F5C()
{
  OUTLINED_FUNCTION_17();

  swift_release();
  return swift_deallocObject();
}

void sub_25C9B5F9C()
{
  sub_25C9B1268(*(char **)(v0 + 16), *(void **)(v0 + 24), *(void (**)(void))(v0 + 32));
}

id sub_25C9B5FA8(id result, char a2)
{
  if ((a2 & 1) == 0) {
    return result;
  }
  return result;
}

void sub_25C9B5FB4(id a1, char a2)
{
  if ((a2 & 1) == 0) {
}
  }

uint64_t sub_25C9B5FC0(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_25C9B6010()
{
  _Block_release(*(const void **)(v0 + 16));
  OUTLINED_FUNCTION_39();
  return swift_deallocObject();
}

void sub_25C9B6040(uint64_t a1)
{
  sub_25C9AAB18(a1, *(void *)(v1 + 16));
}

uint64_t sub_25C9B6048(uint64_t a1)
{
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_2(uint64_t *result, uint64_t *a2)
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
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      result[5] = a2[5];
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

uint64_t sub_25C9B62A8(void *a1, uint64_t a2)
{
  return sub_25C9A84A8(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_25C9B62B4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_25C9B62FC()
{
  return sub_25C9AA340(*(void **)(v0 + 16), *(void **)(v0 + 24), *(uint64_t (**)(void *))(v0 + 32));
}

void sub_25C9B6308(void *a1)
{
  sub_25C9B0678(a1, *(void **)(v1 + 16), "[%{public}@] Sending touch delivery policy failed with error: %{public}s");
}

void *sub_25C9B632C(void *result, _DWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 + 64;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v8 = 0;
    a3 = 0;
LABEL_36:
    *uint64_t result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (void *)a3;
  }
  if (!a3)
  {
    int64_t v8 = 0;
    goto LABEL_36;
  }
  if (a3 < 0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  int64_t v8 = 0;
  uint64_t v9 = 0;
  int64_t v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v8 << 6);
LABEL_19:
    ++v9;
    *a2++ = *(_DWORD *)(*(void *)(a4 + 48) + 4 * v12);
    if (v9 == a3) {
      goto LABEL_36;
    }
  }
  int64_t v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_38;
  }
  if (v13 >= v10) {
    goto LABEL_31;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  if (v14) {
    goto LABEL_18;
  }
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13;
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_14:
    int64_t v13 = v8;
LABEL_18:
    unint64_t v16 = __clz(__rbit64(v14));
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = v16 + (v13 << 6);
    int64_t v8 = v13;
    goto LABEL_19;
  }
  int64_t v15 = v13 + 2;
  if (v13 + 2 >= v10) {
    goto LABEL_31;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_17:
    int64_t v13 = v15;
    goto LABEL_18;
  }
  int64_t v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13 + 2;
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14) {
    goto LABEL_14;
  }
  int64_t v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_31:
    unint64_t v7 = 0;
LABEL_35:
    a3 = v9;
    goto LABEL_36;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_17;
  }
  while (1)
  {
    int64_t v13 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v13 >= v10)
    {
      unint64_t v7 = 0;
      int64_t v8 = v10 - 1;
      goto LABEL_35;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v13);
    ++v15;
    if (v14) {
      goto LABEL_18;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_25C9B64C0()
{
  return swift_release();
}

void sub_25C9B64D0()
{
  sub_25C9ABEDC(v0);
}

void sub_25C9B64D8()
{
  sub_25C9AC34C(v0);
}

uint64_t sub_25C9B64E0()
{
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_9_4();
  swift_release();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_16();
  v0();
  return swift_deallocObject();
}

void sub_25C9B65AC()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v5 = *(void *)(OUTLINED_FUNCTION_51() - 8);
  uint64_t v6 = v0[6];
  uint64_t v7 = (uint64_t)v0 + ((*(unsigned __int8 *)(v5 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  sub_25C9AC724(v6, v7, v1, v2, v3, v4);
}

uint64_t sub_25C9B663C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_9_4();
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = *(void *)(v2 - 8);
  unint64_t v7 = (v4 + *(void *)(v5 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  unint64_t v8 = v0 + v4 + *(int *)(v1 + 40);
  uint64_t v9 = *(void (**)(unint64_t, uint64_t))(v6 + 8);
  v9(v8, v2);
  v9(v0 + v7, v2);
  return swift_deallocObject();
}

uint64_t sub_25C9B6768(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v5 = v1[4];
  uint64_t v6 = *(void *)(sub_25C9B8090() - 8);
  unint64_t v7 = (*(unsigned __int8 *)(v6 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = v1[2];
  uint64_t v9 = v1[3];
  uint64_t v10 = (uint64_t)v1 + v7;
  uint64_t v11 = (uint64_t)v1
      + ((v7 + *(void *)(v6 + 64) + *(unsigned __int8 *)(*(void *)(v5 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80));
  unint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v12;
  *unint64_t v12 = v3;
  v12[1] = sub_25C99FA90;
  return sub_25C9AD090(a1, v8, v9, v10, v11, v5);
}

uint64_t sub_25C9B68EC()
{
  return sub_25C9ADBC4();
}

uint64_t getEnumTagSinglePayload for SnippetHostViewController.SceneCaptureError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SnippetHostViewController.SceneCaptureError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25C9B6A68);
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

ValueMetadata *type metadata accessor for SnippetHostViewController.SceneCaptureError()
{
  return &type metadata for SnippetHostViewController.SceneCaptureError;
}

unint64_t sub_25C9B6AA8()
{
  unint64_t result = qword_26A5E0898;
  if (!qword_26A5E0898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E0898);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_12_1()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_14()
{
  return sub_25C9B83F0();
}

uint64_t OUTLINED_FUNCTION_15()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_17()
{
  int v2 = *(void **)(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_18()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_19()
{
  return v0;
}

id OUTLINED_FUNCTION_20(float a1)
{
  float *v2 = a1;
  return v1;
}

uint64_t OUTLINED_FUNCTION_22()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_23()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_24()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_25()
{
  return sub_25C9B8180();
}

uint64_t OUTLINED_FUNCTION_27()
{
  return swift_arrayDestroy();
}

id OUTLINED_FUNCTION_28()
{
  return SceneItemMetricsRequest.init(width:height:cornerRadius:)(v1, v0, v3);
}

uint64_t OUTLINED_FUNCTION_29()
{
  return swift_arrayDestroy();
}

BOOL OUTLINED_FUNCTION_30(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_38()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_39()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_40()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_42(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_43()
{
  return sub_25C9B83F0();
}

uint64_t OUTLINED_FUNCTION_45(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_46(uint64_t a1)
{
  *(void *)(v1 - 88) = a1;
  return v1 - 88;
}

uint64_t OUTLINED_FUNCTION_47(uint64_t a1)
{
  *(void *)(v1 - 88) = a1;
  return v1 - 88;
}

id OUTLINED_FUNCTION_48()
{
  return SizeDimensionRequest.init(minimum:maximum:type:)(1, v1, v1);
}

uint64_t OUTLINED_FUNCTION_49()
{
  return v0;
}

id OUTLINED_FUNCTION_50()
{
  return SizeDimensionRequest.init(minimum:maximum:type:)(1, v1, v1);
}

uint64_t OUTLINED_FUNCTION_51()
{
  return sub_25C9B8090();
}

uint64_t OUTLINED_FUNCTION_52()
{
  return v0;
}

id SnippetSceneSpecification.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

uint64_t sub_25C9B6FDC()
{
  return type metadata accessor for SnippetSceneSettings();
}

uint64_t sub_25C9B700C()
{
  return type metadata accessor for SnippetSceneClientSettings();
}

uint64_t sub_25C9B708C()
{
  return type metadata accessor for SnippetScene();
}

id SnippetSceneSpecification.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SnippetSceneSpecification();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SnippetSceneSpecification()
{
  return self;
}

id SnippetSceneSpecification.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SnippetSceneSpecification();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void *initializeBufferWithCopyOfBuffer for ProcessIdentity(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ProcessIdentity()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for ProcessIdentity(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for ProcessIdentity(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ProcessIdentity(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ProcessIdentity(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ProcessIdentity()
{
  return &type metadata for ProcessIdentity;
}

id sub_25C9B7280(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone(MEMORY[0x263F01878]);
  swift_bridgeObjectRetain();
  id v5 = sub_25C9B79C4(a1, a2, 0);
  if (!v5)
  {
    if (qword_26A5DF6C8 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_25C9B7C90();
    __swift_project_value_buffer(v13, (uint64_t)qword_26A5E0118);
    OUTLINED_FUNCTION_2_8();
    os_log_type_t v6 = sub_25C9B7C70();
    os_log_type_t v14 = sub_25C9B82B0();
    if (os_log_type_enabled(v6, v14))
    {
      int64_t v15 = (uint8_t *)swift_slowAlloc();
      OUTLINED_FUNCTION_11_1();
      *(_DWORD *)int64_t v15 = 136380675;
      uint64_t v16 = swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_4_5(v16, v17, v18, v19);
      sub_25C9B83F0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25C989000, v6, v14, "No application record created with bundle identifier: %{private}s", v15, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0_6();
      OUTLINED_FUNCTION_0_6();
LABEL_26:

      return 0;
    }
    goto LABEL_28;
  }
  os_log_type_t v6 = v5;
  id v7 = [v6 identities];
  sub_25C9950BC(0, &qword_26A5E0900);
  unint64_t v8 = sub_25C9B81C0();

  if (!(v8 >> 62))
  {
    if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) == 1) {
      goto LABEL_4;
    }
    goto LABEL_20;
  }
  swift_bridgeObjectRetain();
  uint64_t v20 = sub_25C9B8590();
  swift_bridgeObjectRelease();
  if (v20 != 1)
  {
LABEL_20:
    swift_bridgeObjectRelease();
    if (qword_26A5DF6C8 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_25C9B7C90();
    __swift_project_value_buffer(v30, (uint64_t)qword_26A5E0118);
    OUTLINED_FUNCTION_2_8();
    unint64_t v8 = sub_25C9B7C70();
    os_log_type_t v23 = sub_25C9B82B0();
    if (os_log_type_enabled((os_log_t)v8, v23))
    {
      unint64_t v24 = (uint8_t *)swift_slowAlloc();
      OUTLINED_FUNCTION_11_1();
      uint64_t v31 = OUTLINED_FUNCTION_5_5(4.845e-34);
      OUTLINED_FUNCTION_4_5(v31, v32, v33, v34);
      OUTLINED_FUNCTION_0_8();
      swift_bridgeObjectRelease_n();
      uint64_t v29 = "Multiple identities found with bundle identifier: %{private}s";
      goto LABEL_24;
    }

LABEL_28:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_25C9B8590();
  swift_bridgeObjectRelease();
  if (!v21)
  {
    swift_bridgeObjectRelease();
    if (qword_26A5DF6C8 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_25C9B7C90();
    __swift_project_value_buffer(v22, (uint64_t)qword_26A5E0118);
    OUTLINED_FUNCTION_2_8();
    unint64_t v8 = sub_25C9B7C70();
    os_log_type_t v23 = sub_25C9B82B0();
    if (!os_log_type_enabled((os_log_t)v8, v23)) {
      goto LABEL_31;
    }
    unint64_t v24 = (uint8_t *)swift_slowAlloc();
    OUTLINED_FUNCTION_11_1();
    uint64_t v25 = OUTLINED_FUNCTION_5_5(4.845e-34);
    OUTLINED_FUNCTION_4_5(v25, v26, v27, v28);
    OUTLINED_FUNCTION_0_8();
    swift_bridgeObjectRelease_n();
    uint64_t v29 = "No lsIdentity found for bundle identifier: %{private}s";
LABEL_24:
    _os_log_impl(&dword_25C989000, (os_log_t)v8, v23, v29, v24, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_6();
    OUTLINED_FUNCTION_0_6();

LABEL_25:
    goto LABEL_26;
  }
LABEL_4:
  if ((v8 & 0xC000000000000001) != 0)
  {
    uint64_t v9 = (objc_class *)MEMORY[0x261199F90](0, v8);
    goto LABEL_7;
  }
  if (!*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
LABEL_31:

    swift_bridgeObjectRelease_n();
    goto LABEL_25;
  }
  uint64_t v9 = (objc_class *)*(id *)(v8 + 32);
LABEL_7:
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(self, sel_identityForLSApplicationIdentity_LSApplicationRecord_, v10, v6);

  return v11;
}

id sub_25C9B79C4(uint64_t a1, uint64_t a2, char a3)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  id v5 = (void *)sub_25C9B8140();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  id v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_allowPlaceholder_error_, v5, a3 & 1, v10);

  if (v6)
  {
    id v7 = v10[0];
  }
  else
  {
    id v8 = v10[0];
    sub_25C9B7BE0();

    swift_willThrow();
  }
  return v6;
}

uint64_t OUTLINED_FUNCTION_0_8()
{
  return sub_25C9B83F0();
}

uint64_t OUTLINED_FUNCTION_2_8()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_3_4()
{
  return sub_25C9B83F0();
}

uint64_t OUTLINED_FUNCTION_4_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  return sub_25C99F02C(v5, v4, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_5_5(float a1)
{
  *id v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_25C9B7B40()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_25C9B7B50()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_25C9B7B60()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_25C9B7B70()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_25C9B7B80()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_25C9B7B90()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_25C9B7BA0()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_25C9B7BB0()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_25C9B7BC0()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_25C9B7BD0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_25C9B7BE0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25C9B7BF0()
{
  return MEMORY[0x270EEFA08]();
}

uint64_t sub_25C9B7C00()
{
  return MEMORY[0x270EEFA18]();
}

uint64_t sub_25C9B7C10()
{
  return MEMORY[0x270EF0020]();
}

uint64_t sub_25C9B7C20()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_25C9B7C30()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25C9B7C40()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25C9B7C50()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25C9B7C60()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_25C9B7C70()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25C9B7C80()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25C9B7C90()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25C9B7CA0()
{
  return MEMORY[0x270F81938]();
}

uint64_t sub_25C9B7CB0()
{
  return MEMORY[0x270F81C10]();
}

uint64_t sub_25C9B7CC0()
{
  return MEMORY[0x270F81C28]();
}

uint64_t sub_25C9B7CD0()
{
  return MEMORY[0x270F82118]();
}

uint64_t sub_25C9B7CE0()
{
  return MEMORY[0x270F82120]();
}

uint64_t sub_25C9B7CF0()
{
  return MEMORY[0x270EE3880]();
}

uint64_t sub_25C9B7D00()
{
  return MEMORY[0x270EE38A0]();
}

uint64_t sub_25C9B7D10()
{
  return MEMORY[0x270EE3930]();
}

uint64_t sub_25C9B7D20()
{
  return MEMORY[0x270EE3950]();
}

uint64_t sub_25C9B7D30()
{
  return MEMORY[0x270EE3AD0]();
}

uint64_t sub_25C9B7D40()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t sub_25C9B7D50()
{
  return MEMORY[0x270EE3BB0]();
}

uint64_t sub_25C9B7D60()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_25C9B7D70()
{
  return MEMORY[0x270EE3C50]();
}

uint64_t sub_25C9B7D80()
{
  return MEMORY[0x270EE3C70]();
}

uint64_t sub_25C9B7D90()
{
  return MEMORY[0x270EE3CA8]();
}

uint64_t sub_25C9B7DA0()
{
  return MEMORY[0x270EE3CB0]();
}

uint64_t sub_25C9B7DB0()
{
  return MEMORY[0x270EE3CB8]();
}

uint64_t sub_25C9B7DC0()
{
  return MEMORY[0x270EE3CC0]();
}

uint64_t sub_25C9B7DD0()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_25C9B7DE0()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_25C9B7DF0()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_25C9B7E00()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_25C9B7E10()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_25C9B7E20()
{
  return MEMORY[0x270EE3DE8]();
}

uint64_t sub_25C9B7E30()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_25C9B7E40()
{
  return MEMORY[0x270EE3E08]();
}

uint64_t sub_25C9B7E50()
{
  return MEMORY[0x270EE3E18]();
}

uint64_t sub_25C9B7E60()
{
  return MEMORY[0x270EE3E78]();
}

uint64_t sub_25C9B7E70()
{
  return MEMORY[0x270EE3F78]();
}

uint64_t sub_25C9B7E80()
{
  return MEMORY[0x270EE3FB8]();
}

uint64_t sub_25C9B7E90()
{
  return MEMORY[0x270EE3FD8]();
}

uint64_t sub_25C9B7EA0()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_25C9B7EB0()
{
  return MEMORY[0x270EFF9A0]();
}

uint64_t sub_25C9B7EC0()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_25C9B7ED0()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_25C9B7EE0()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_25C9B7EF0()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_25C9B7F00()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_25C9B7F10()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_25C9B7F20()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_25C9B7F30()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_25C9B7F40()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_25C9B7F50()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_25C9B7F60()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_25C9B7F80()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_25C9B7F90()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_25C9B7FA0()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_25C9B7FC0()
{
  return MEMORY[0x270F02728]();
}

uint64_t sub_25C9B7FD0()
{
  return MEMORY[0x270F02798]();
}

uint64_t sub_25C9B7FE0()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_25C9B7FF0()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_25C9B8000()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_25C9B8010()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_25C9B8020()
{
  return MEMORY[0x270F03920]();
}

uint64_t sub_25C9B8030()
{
  return MEMORY[0x270F04210]();
}

uint64_t sub_25C9B8040()
{
  return MEMORY[0x270F04608]();
}

uint64_t sub_25C9B8050()
{
  return MEMORY[0x270F04620]();
}

uint64_t sub_25C9B8060()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_25C9B8070()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_25C9B8080()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_25C9B8090()
{
  return MEMORY[0x270F04BF8]();
}

uint64_t sub_25C9B80A0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_25C9B80B0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25C9B80C0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25C9B80D0()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_25C9B80E0()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_25C9B80F0()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_25C9B8100()
{
  return MEMORY[0x270F9D190]();
}

uint64_t sub_25C9B8110()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_25C9B8120()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_25C9B8130()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25C9B8140()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25C9B8150()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25C9B8160()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25C9B8170()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25C9B8180()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25C9B8190()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25C9B81A0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25C9B81B0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25C9B81C0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25C9B81D0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25C9B81E0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25C9B81F0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25C9B8200()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25C9B8210()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25C9B8220()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_25C9B8230()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_25C9B8240()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25C9B8250()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25C9B8260()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_25C9B8270()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_25C9B8280()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_25C9B8290()
{
  return MEMORY[0x270EF1E70]();
}

uint64_t sub_25C9B82A0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25C9B82B0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25C9B82C0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_25C9B82D0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25C9B82E0()
{
  return MEMORY[0x270EF1F60]();
}

uint64_t sub_25C9B82F0()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_25C9B8300()
{
  return MEMORY[0x270FA0CD0]();
}

uint64_t sub_25C9B8310()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_25C9B8320()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_25C9B8330()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_25C9B8340()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_25C9B8350()
{
  return MEMORY[0x270EF2010]();
}

uint64_t sub_25C9B8360()
{
  return MEMORY[0x270EF2020]();
}

uint64_t sub_25C9B8370()
{
  return MEMORY[0x270EF2060]();
}

uint64_t sub_25C9B8380()
{
  return MEMORY[0x270EE5910]();
}

uint64_t sub_25C9B8390()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_25C9B83A0()
{
  return MEMORY[0x270F82950]();
}

uint64_t sub_25C9B83B0()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_25C9B83C0()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_25C9B83D0()
{
  return MEMORY[0x270EF21A8]();
}

uint64_t sub_25C9B83E0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25C9B83F0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25C9B8400()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25C9B8410()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25C9B8420()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25C9B8430()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_25C9B8440()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_25C9B8450()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_25C9B8460()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_25C9B8470()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_25C9B8480()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25C9B8490()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25C9B84A0()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_25C9B84B0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25C9B84C0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25C9B84D0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25C9B84E0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25C9B84F0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25C9B8500()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25C9B8510()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_25C9B8520()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_25C9B8530()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_25C9B8540()
{
  return MEMORY[0x270F9EF88]();
}

uint64_t sub_25C9B8550()
{
  return MEMORY[0x270F9EFB0]();
}

uint64_t sub_25C9B8560()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_25C9B8570()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25C9B8580()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25C9B8590()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25C9B85A0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25C9B85B0()
{
  return MEMORY[0x270F9F0A8]();
}

uint64_t sub_25C9B85C0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25C9B85D0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25C9B85E0()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_25C9B85F0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25C9B8600()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_25C9B8610()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_25C9B8620()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25C9B8630()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25C9B8640()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_25C9B8650()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25C9B8660()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25C9B8670()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25C9B8680()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25C9B8690()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t sub_25C9B86A0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25C9B86B0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25C9B86C0()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_25C9B86D0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25C9B86E0()
{
  return MEMORY[0x270EF2760]();
}

uint64_t BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler()
{
  return MEMORY[0x270F10580]();
}

uint64_t BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey()
{
  return MEMORY[0x270F10708]();
}

uint64_t BSDeserializeCGFloatFromXPCDictionaryWithKey()
{
  return MEMORY[0x270F10710]();
}

uint64_t BSDeserializeCGSizeFromXPCDictionaryWithKey()
{
  return MEMORY[0x270F10720]();
}

uint64_t BSDeserializeDoubleFromXPCDictionaryWithKey()
{
  return MEMORY[0x270F10730]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x270F10748]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x270F10758]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x270F108D8]();
}

uint64_t BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey()
{
  return MEMORY[0x270F108F8]();
}

uint64_t BSSerializeCGFloatToXPCDictionaryWithKey()
{
  return MEMORY[0x270F10900]();
}

uint64_t BSSerializeCGSizeToXPCDictionaryWithKey()
{
  return MEMORY[0x270F10910]();
}

uint64_t BSSerializeDoubleToXPCDictionaryWithKey()
{
  return MEMORY[0x270F10920]();
}

BOOL CGSizeEqualToSize(CGSize size1, CGSize size2)
{
  return MEMORY[0x270EE7348]((__n128)size1, *(__n128 *)&size1.height, (__n128)size2, *(__n128 *)&size2.height);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

{
  return MEMORY[0x270F9A3C0]();
}

{
  return MEMORY[0x270F9A3C8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x270FA0238]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x270FA0298]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
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

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
}