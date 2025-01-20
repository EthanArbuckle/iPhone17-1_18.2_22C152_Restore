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

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_2286C2A20@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for EngagementFeatureSettings();
  uint64_t v2 = swift_allocObject();
  *(_WORD *)(v2 + 16) = 0;
  *(unsigned char *)(v2 + 18) = 0;
  uint64_t result = sub_2286C31EC(&qword_2682596C0, (void (*)(uint64_t))type metadata accessor for EngagementFeatureSettings);
  *a1 = v2;
  a1[1] = result;
  return result;
}

unint64_t sub_2286C2A98@<X0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 24) = &type metadata for FeatureAvailability;
  unint64_t result = sub_2286C2C34();
  *(void *)(a1 + 32) = result;
  return result;
}

uint64_t sub_2286C2ACC()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for SettingsAssembly()
{
  return self;
}

uint64_t sub_2286C2B00()
{
  sub_2286DDBA8();
  sub_2286C2BE4(0, &qword_26AD8C6E8);
  sub_2286DDC18();
  swift_release();
  swift_release();
  sub_2286DDBA8();
  sub_2286C2BE4(0, &qword_26AD8CF90);
  sub_2286DDC18();
  swift_release();

  return swift_release();
}

uint64_t sub_2286C2BE4(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_2286C2C34()
{
  unint64_t result = qword_2682596B8;
  if (!qword_2682596B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682596B8);
  }
  return result;
}

uint64_t sub_2286C2C88(uint64_t a1, uint64_t a2)
{
  return sub_2286C2DF4(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_2286C2CA0(uint64_t a1, id *a2)
{
  uint64_t result = sub_2286DE158();
  *a2 = 0;
  return result;
}

uint64_t sub_2286C2D18(uint64_t a1, id *a2)
{
  char v3 = sub_2286DE168();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2286C2D98@<X0>(uint64_t *a1@<X8>)
{
  sub_2286DE178();
  uint64_t v2 = sub_2286DE148();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2286C2DDC(uint64_t a1, uint64_t a2)
{
  return sub_2286C2DF4(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_2286C2DF4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_2286DE178();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2286C2E38()
{
  sub_2286DE178();
  sub_2286DE188();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2286C2E8C()
{
  sub_2286DE178();
  sub_2286DE438();
  sub_2286DE188();
  uint64_t v0 = sub_2286DE458();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2286C2F00()
{
  uint64_t v0 = sub_2286DE178();
  uint64_t v2 = v1;
  if (v0 == sub_2286DE178() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_2286DE3D8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void type metadata accessor for OpenExternalURLOptionsKey()
{
  if (!qword_268259908)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_268259908);
    }
  }
}

uint64_t sub_2286C2FE4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_2286DE148();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2286C302C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2286DE178();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2286C3058(uint64_t a1)
{
  uint64_t v2 = sub_2286C31EC((unint64_t *)&qword_26825A110, (void (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey);
  uint64_t v3 = sub_2286C31EC((unint64_t *)&unk_268259930, (void (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_2286C3114()
{
  return sub_2286C31EC(&qword_268259910, (void (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_2286C315C()
{
  return sub_2286C31EC(&qword_268259918, (void (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_2286C31A4()
{
  return sub_2286C31EC((unint64_t *)&unk_268259920, (void (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_2286C31EC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for NewsPlugLabelConfigProvider()
{
  return self;
}

uint64_t sub_2286C3258()
{
  return 0;
}

uint64_t sub_2286C3260()
{
  return 0;
}

uint64_t sub_2286C326C()
{
  return 1;
}

ValueMetadata *type metadata accessor for FeatureAvailability()
{
  return &type metadata for FeatureAvailability;
}

uint64_t sub_2286C32A8@<X0>(uint64_t *a1@<X8>)
{
  return sub_2286C3338((uint64_t (*)(void))type metadata accessor for PostPurchaseOnboardingPresenter, (unint64_t *)&unk_268259C50, (void (*)(uint64_t))type metadata accessor for PostPurchaseOnboardingPresenter, a1);
}

uint64_t sub_2286C32F0@<X0>(uint64_t *a1@<X8>)
{
  return sub_2286C3338((uint64_t (*)(void))type metadata accessor for PostPurchaseOnboardingViewControllerFactory, &qword_268259C48, (void (*)(uint64_t))type metadata accessor for PostPurchaseOnboardingViewControllerFactory, a1);
}

uint64_t sub_2286C3338@<X0>(uint64_t (*a1)(void)@<X1>, unint64_t *a2@<X2>, void (*a3)(uint64_t)@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v7 = a1(0);
  uint64_t v8 = swift_allocObject();
  a4[3] = v7;
  uint64_t result = sub_2286C35A0(a2, a3);
  a4[4] = result;
  *a4 = v8;
  return result;
}

uint64_t sub_2286C33B0@<X0>(uint64_t *a1@<X8>)
{
  return sub_2286C3338((uint64_t (*)(void))type metadata accessor for CampaignLandingPageTracker, &qword_268259C40, (void (*)(uint64_t))type metadata accessor for CampaignLandingPageTracker, a1);
}

uint64_t type metadata accessor for SubscriptionAssembly()
{
  return self;
}

uint64_t sub_2286C341C()
{
  sub_2286DDBA8();
  sub_2286C3550(0, &qword_26AD8C710);
  sub_2286DDC18();
  swift_release();
  swift_release();
  sub_2286DDBA8();
  sub_2286C3550(0, (unint64_t *)&unk_26AD8C718);
  sub_2286DDC18();
  swift_release();
  swift_release();
  sub_2286DDBA8();
  sub_2286C3550(0, &qword_26AD8C6A0);
  sub_2286DDC18();
  swift_release();

  return swift_release();
}

uint64_t sub_2286C3550(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_2286C35A0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2286C35E8()
{
  return sub_2286DE458();
}

uint64_t sub_2286C362C()
{
  return sub_2286DE448();
}

uint64_t sub_2286C3654()
{
  return sub_2286DE458();
}

void sub_2286C36A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a1;
  *(void *)(v10 + 24) = a2;
  v11 = *(void **)(a5 + 16);
  v12 = (void *)swift_allocObject();
  v12[2] = sub_2286C3AC8;
  v12[3] = v10;
  v12[4] = a3;
  v12[5] = a4;
  v14[4] = sub_2286C3B40;
  v14[5] = v12;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 1107296256;
  v14[2] = sub_2286C3900;
  v14[3] = &block_descriptor;
  v13 = _Block_copy(v14);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_fetchAppConfigurationIfNeededWithCompletion_, v13);
  _Block_release(v13);
}

void sub_2286C37D4(uint64_t a1, id a2, void (*a3)(uint64_t, uint64_t), uint64_t a4, void (*a5)(void))
{
  if (a1)
  {
    id v8 = objc_msgSend((id)swift_unknownObjectRetain(), sel_articleRecirculationConfigJSON);
    if (v8)
    {
      v9 = v8;
      uint64_t v10 = sub_2286DE178();
      uint64_t v12 = v11;

      a3(v10, v12);
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      return;
    }
    swift_unknownObjectRelease();
  }
  if (a2)
  {
    id v13 = a2;
    ((void (*)(id))a5)(a2);
    id v14 = a2;
  }
  else
  {
    sub_2286C3B4C();
    uint64_t v15 = swift_allocError();
    a5();
    id v14 = (id)v15;
  }
}

uint64_t sub_2286C3900(uint64_t a1, uint64_t a2, void *a3)
{
  char v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_2286C3980()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for ArticleRecirculationConfigurationService()
{
  return self;
}

uint64_t sub_2286C39DC()
{
  return sub_2286DDC68();
}

void sub_2286C3A30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2286C36A4(a1, a2, a3, a4, v4);
}

void sub_2286C3A38()
{
  if (!qword_268259CC0)
  {
    unint64_t v0 = sub_2286DDC78();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268259CC0);
    }
  }
}

uint64_t sub_2286C3A90()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2286C3AC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(uint64_t (**)(void *))(v2 + 16);
  v5[0] = a1;
  v5[1] = a2;
  return v3(v5);
}

uint64_t sub_2286C3B00()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_2286C3B40(uint64_t a1, void *a2)
{
  sub_2286C37D4(a1, a2, *(void (**)(uint64_t, uint64_t))(v2 + 16), *(void *)(v2 + 24), *(void (**)(void))(v2 + 32));
}

unint64_t sub_2286C3B4C()
{
  unint64_t result = qword_268259CC8;
  if (!qword_268259CC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268259CC8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ArticleRecirculationConfigurationService.Errors(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for ArticleRecirculationConfigurationService.Errors(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2286C3C94);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ArticleRecirculationConfigurationService.Errors()
{
  return &type metadata for ArticleRecirculationConfigurationService.Errors;
}

unint64_t sub_2286C3CD4()
{
  unint64_t result = qword_268259CD0;
  if (!qword_268259CD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268259CD0);
  }
  return result;
}

uint64_t sub_2286C3D28()
{
  return MEMORY[0x270FA0228](v0, 19, 7);
}

uint64_t type metadata accessor for EngagementFeatureSettings()
{
  return self;
}

uint64_t sub_2286C3D5C()
{
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_2286C3D90(char a1)
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 16) = a1;
  return result;
}

uint64_t (*sub_2286C3DD0())()
{
  return j__swift_endAccess;
}

uint64_t sub_2286C3E28()
{
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 18);
}

uint64_t sub_2286C3E5C(char a1)
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 18) = a1;
  return result;
}

uint64_t (*sub_2286C3E9C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2286C3EF0()
{
  return MEMORY[0x270F4F188](*v0);
}

uint64_t sub_2286C3F1C()
{
  return MEMORY[0x270F4F190](*v0);
}

uint64_t sub_2286C3F48(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F4F178](a1, a2, *v2);
}

uint64_t sub_2286C3F74(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F4F180](a1, a2, *v2);
}

uint64_t NewsArticleThumbnail.article.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2286C4300(v1, a1, (uint64_t (*)(void))type metadata accessor for NewsArticle);
}

uint64_t NewsArticleThumbnail.init(article:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2286C3FE0(a1, a2);
}

uint64_t sub_2286C3FE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NewsArticle();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t NewsArticleThumbnail.body.getter()
{
  sub_2286C4164();
  MEMORY[0x270FA5388]();
  int v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for NewsArticle();
  sub_2286C4300(v0 + *(int *)(v3 + 24), (uint64_t)v2, (uint64_t (*)(void))sub_2286C4164);
  uint64_t v4 = (void *)swift_allocObject();
  v4[2] = sub_2286C41BC;
  v4[3] = 0;
  v4[4] = sub_2286C42D8;
  v4[5] = 0;
  sub_2286C4604();
  sub_2286C46C4();
  return sub_2286DDEC8();
}

void sub_2286C4164()
{
  if (!qword_26AD8C680)
  {
    sub_2286DD7E8();
    unint64_t v0 = sub_2286DE228();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AD8C680);
    }
  }
}

uint64_t sub_2286C41BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_2286DDFF8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F1B4B8], v2);
  uint64_t v6 = sub_2286DE008();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 16) = 1;
  return result;
}

uint64_t sub_2286C42D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2286DDFE8();
  *a1 = result;
  return result;
}

uint64_t sub_2286C4300(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2286C4370()
{
  return sub_2286DDFD8();
}

uint64_t sub_2286C438C()
{
  sub_2286C4164();
  MEMORY[0x270FA5388]();
  uint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for NewsArticle();
  sub_2286C4300(v0 + *(int *)(v3 + 24), (uint64_t)v2, (uint64_t (*)(void))sub_2286C4164);
  uint64_t v4 = (void *)swift_allocObject();
  v4[2] = sub_2286C41BC;
  v4[3] = 0;
  v4[4] = sub_2286C42D8;
  v4[5] = 0;
  sub_2286C4604();
  sub_2286C46C4();
  return sub_2286DDEC8();
}

uint64_t sub_2286C44AC(uint64_t a1, void (*a2)(uint64_t *__return_ptr), uint64_t a3, void (*a4)(uint64_t *__return_ptr))
{
  if (sub_2286DDEE8())
  {
    a2(&v7);
    sub_2286C4664();
    sub_2286C473C();
    swift_retain_n();
    sub_2286DDF08();
    swift_release_n();
    swift_release();
  }
  else
  {
    a4(&v7);
    sub_2286C4664();
    sub_2286C473C();
    sub_2286DDF08();
  }
  return v7;
}

void sub_2286C4604()
{
  if (!qword_268259CE0)
  {
    sub_2286C4664();
    unint64_t v0 = sub_2286DDF18();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268259CE0);
    }
  }
}

void sub_2286C4664()
{
  if (!qword_268259CE8)
  {
    unint64_t v0 = sub_2286DDEF8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268259CE8);
    }
  }
}

unint64_t sub_2286C46C4()
{
  unint64_t result = qword_268259CF0;
  if (!qword_268259CF0)
  {
    sub_2286C4604();
    sub_2286C473C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268259CF0);
  }
  return result;
}

unint64_t sub_2286C473C()
{
  unint64_t result = qword_268259CF8;
  if (!qword_268259CF8)
  {
    sub_2286C4664();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268259CF8);
  }
  return result;
}

uint64_t sub_2286C47AC(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &opaque type descriptor for <<opaque return type of NewsArticleThumbnail.body>>, 1);
}

void *initializeBufferWithCopyOfBuffer for NewsArticleThumbnail(char *a1, char *a2)
{
  uint64_t v4 = type metadata accessor for NewsArticle();
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    v16 = (void *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = (int *)v4;
    uint64_t v7 = *((void *)a2 + 1);
    *(void *)a1 = *(void *)a2;
    *((void *)a1 + 1) = v7;
    uint64_t v8 = *((void *)a2 + 3);
    *((void *)a1 + 2) = *((void *)a2 + 2);
    *((void *)a1 + 3) = v8;
    uint64_t v9 = *(int *)(v4 + 24);
    __dst = &a1[v9];
    uint64_t v10 = &a2[v9];
    uint64_t v11 = sub_2286DD7E8();
    uint64_t v12 = *(void *)(v11 - 8);
    id v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v59 = v13;
    if (v13(v10, 1, v11))
    {
      sub_2286C4164();
      memcpy(__dst, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(__dst, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
    }
    uint64_t v17 = v6[7];
    v18 = &a1[v17];
    v19 = &a2[v17];
    uint64_t v20 = sub_2286DD828();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
    v51 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
    v51(&a1[v6[8]], &a2[v6[8]], v11);
    v55 = v6;
    v56 = a2;
    uint64_t v21 = v6[9];
    v53 = a1;
    v22 = &a1[v21];
    v23 = &a2[v21];
    uint64_t v24 = *((void *)v23 + 1);
    *(void *)v22 = *(void *)v23;
    *((void *)v22 + 1) = v24;
    uint64_t v25 = *((void *)v23 + 3);
    *((void *)v22 + 2) = *((void *)v23 + 2);
    *((void *)v22 + 3) = v25;
    uint64_t v54 = type metadata accessor for NewsChannel();
    uint64_t v26 = *(int *)(v54 + 24);
    v27 = &v22[v26];
    v52 = v23;
    v28 = &v23[v26];
    *(void *)&v22[v26] = *(void *)v28;
    __dsta = (int *)type metadata accessor for NewsChannelLogoCollection();
    uint64_t v29 = __dsta[5];
    v30 = &v27[v29];
    v31 = &v28[v29];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v59(v31, 1, v11))
    {
      sub_2286C4164();
      memcpy(v30, v31, *(void *)(*(void *)(v32 - 8) + 64));
      uint64_t v34 = v12;
      v33 = v51;
    }
    else
    {
      v33 = v51;
      v51(v30, v31, v11);
      uint64_t v34 = v12;
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v30, 0, 1, v11);
    }
    uint64_t v35 = __dsta[6];
    v36 = &v27[v35];
    v37 = &v28[v35];
    if (v59(&v28[v35], 1, v11))
    {
      sub_2286C4164();
      memcpy(v36, v37, *(void *)(*(void *)(v38 - 8) + 64));
    }
    else
    {
      v33(v36, v37, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v36, 0, 1, v11);
    }
    uint64_t v39 = __dsta[7];
    v40 = &v27[v39];
    v41 = &v28[v39];
    if (v59(&v28[v39], 1, v11))
    {
      sub_2286C4164();
      memcpy(v40, v41, *(void *)(*(void *)(v42 - 8) + 64));
    }
    else
    {
      v33(v40, v41, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v40, 0, 1, v11);
    }
    v16 = v53;
    uint64_t v43 = *(int *)(v54 + 28);
    v44 = &v22[v43];
    v45 = (char *)v52 + v43;
    v46 = *(void **)((char *)v52 + v43);
    if (v46)
    {
      v47 = (void *)*((void *)v45 + 1);
      *(void *)v44 = v46;
      *((void *)v44 + 1) = v47;
      id v48 = v46;
      id v49 = v47;
    }
    else
    {
      *(_OWORD *)v44 = *(_OWORD *)v45;
    }
    *(void *)((char *)v53 + v55[10]) = *(void *)((char *)v56 + v55[10]);
    swift_bridgeObjectRetain();
  }
  return v16;
}

uint64_t destroy for NewsArticleThumbnail(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = (int *)type metadata accessor for NewsArticle();
  uint64_t v3 = a1 + v2[6];
  uint64_t v4 = sub_2286DD7E8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (!v6(v3, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  }
  uint64_t v7 = a1 + v2[7];
  uint64_t v8 = sub_2286DD828();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  v18 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v18(a1 + v2[8], v4);
  uint64_t v9 = a1 + v2[9];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = type metadata accessor for NewsChannel();
  uint64_t v11 = v9 + *(int *)(v10 + 24);
  uint64_t v12 = (int *)type metadata accessor for NewsChannelLogoCollection();
  uint64_t v13 = v11 + v12[5];
  if (!v6(v13, 1, v4)) {
    v18(v13, v4);
  }
  uint64_t v14 = v11 + v12[6];
  if (!v6(v14, 1, v4)) {
    v18(v14, v4);
  }
  uint64_t v15 = v11 + v12[7];
  if (!v6(v15, 1, v4)) {
    v18(v15, v4);
  }
  v16 = (id *)(v9 + *(int *)(v10 + 28));
  if (*v16)
  {
  }

  return swift_bridgeObjectRelease();
}

char *initializeWithCopy for NewsArticleThumbnail(char *a1, char *a2)
{
  uint64_t v4 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v4;
  uint64_t v5 = *((void *)a2 + 3);
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = v5;
  uint64_t v6 = (int *)type metadata accessor for NewsArticle();
  uint64_t v7 = v6[6];
  uint64_t v54 = a1;
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = sub_2286DD7E8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v55 = v12;
  if (v12(v9, 1, v10))
  {
    sub_2286C4164();
    memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v14 = v6[7];
  uint64_t v15 = &v54[v14];
  v16 = &a2[v14];
  uint64_t v17 = sub_2286DD828();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
  v18 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v18(&v54[v6[8]], &a2[v6[8]], v10);
  v51 = v6;
  v52 = a2;
  uint64_t v19 = v6[9];
  uint64_t v20 = &v54[v19];
  uint64_t v21 = &a2[v19];
  uint64_t v48 = v11;
  uint64_t v22 = *((void *)v21 + 1);
  *(void *)uint64_t v20 = *(void *)v21;
  *((void *)v20 + 1) = v22;
  uint64_t v23 = *((void *)v21 + 3);
  *((void *)v20 + 2) = *((void *)v21 + 2);
  *((void *)v20 + 3) = v23;
  uint64_t v50 = type metadata accessor for NewsChannel();
  uint64_t v24 = *(int *)(v50 + 24);
  uint64_t v25 = &v20[v24];
  id v49 = v21;
  uint64_t v26 = &v21[v24];
  *(void *)&v20[v24] = *(void *)v26;
  v53 = (int *)type metadata accessor for NewsChannelLogoCollection();
  uint64_t v27 = v53[5];
  v28 = &v25[v27];
  uint64_t v29 = &v26[v27];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v55(v29, 1, v10))
  {
    sub_2286C4164();
    memcpy(v28, v29, *(void *)(*(void *)(v30 - 8) + 64));
    uint64_t v31 = v48;
  }
  else
  {
    v18(v28, v29, v10);
    uint64_t v31 = v48;
    (*(void (**)(char *, void, uint64_t, uint64_t))(v48 + 56))(v28, 0, 1, v10);
  }
  uint64_t v32 = v53[6];
  v33 = &v25[v32];
  uint64_t v34 = &v26[v32];
  if (v55(&v26[v32], 1, v10))
  {
    sub_2286C4164();
    memcpy(v33, v34, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    v18(v33, v34, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v33, 0, 1, v10);
  }
  uint64_t v36 = v53[7];
  v37 = &v25[v36];
  uint64_t v38 = &v26[v36];
  if (v55(&v26[v36], 1, v10))
  {
    sub_2286C4164();
    memcpy(v37, v38, *(void *)(*(void *)(v39 - 8) + 64));
  }
  else
  {
    v18(v37, v38, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v37, 0, 1, v10);
  }
  uint64_t v40 = *(int *)(v50 + 28);
  v41 = &v20[v40];
  uint64_t v42 = (char *)v49 + v40;
  uint64_t v43 = *(void **)((char *)v49 + v40);
  if (v43)
  {
    v44 = (void *)*((void *)v42 + 1);
    *(void *)v41 = v43;
    *((void *)v41 + 1) = v44;
    id v45 = v43;
    id v46 = v44;
  }
  else
  {
    *(_OWORD *)v41 = *(_OWORD *)v42;
  }
  *(void *)&v54[v51[10]] = *(void *)((char *)v52 + v51[10]);
  swift_bridgeObjectRetain();
  return v54;
}

char *assignWithCopy for NewsArticleThumbnail(char *a1, char *a2)
{
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = *((void *)a2 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (int *)type metadata accessor for NewsArticle();
  uint64_t v5 = v4[6];
  uint64_t v6 = &a1[v5];
  uint64_t v7 = &a2[v5];
  uint64_t v8 = sub_2286DD7E8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48);
  int v11 = v10(v6, 1, v8);
  int v12 = v10(v7, 1, v8);
  if (v11)
  {
    if (!v12)
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v12)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
LABEL_6:
    sub_2286C4164();
    memcpy(v6, v7, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 24))(v6, v7, v8);
LABEL_7:
  uint64_t v14 = v4[7];
  uint64_t v15 = &a1[v14];
  v16 = &a2[v14];
  uint64_t v17 = sub_2286DD828();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 24))(v15, v16, v17);
  uint64_t v62 = v9;
  v57 = *(void (**)(char *, char *, uint64_t))(v9 + 24);
  v57(&a1[v4[8]], &a2[v4[8]], v8);
  v60 = v4;
  v61 = a2;
  uint64_t v18 = v4[9];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  *(void *)uint64_t v19 = *(void *)&a2[v18];
  *((void *)v19 + 1) = *(void *)&a2[v18 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v19 + 2) = *((void *)v20 + 2);
  *((void *)v19 + 3) = *((void *)v20 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v58 = type metadata accessor for NewsChannel();
  v59 = v20;
  uint64_t v21 = *(int *)(v58 + 24);
  uint64_t v22 = &v19[v21];
  uint64_t v23 = &v20[v21];
  *(void *)&v19[v21] = *(void *)&v20[v21];
  v63 = (int *)type metadata accessor for NewsChannelLogoCollection();
  uint64_t v24 = v63[5];
  uint64_t v25 = &v22[v24];
  uint64_t v26 = &v23[v24];
  int v27 = v10(&v22[v24], 1, v8);
  int v28 = v10(v26, 1, v8);
  if (v27)
  {
    if (!v28)
    {
      (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v25, v26, v8);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v62 + 56))(v25, 0, 1, v8);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v28)
  {
    (*(void (**)(char *, uint64_t))(v62 + 8))(v25, v8);
LABEL_12:
    sub_2286C4164();
    memcpy(v25, v26, *(void *)(*(void *)(v29 - 8) + 64));
    goto LABEL_13;
  }
  v57(v25, v26, v8);
LABEL_13:
  uint64_t v30 = v63[6];
  uint64_t v31 = &v22[v30];
  uint64_t v32 = &v23[v30];
  int v33 = v10(&v22[v30], 1, v8);
  int v34 = v10(v32, 1, v8);
  if (v33)
  {
    if (!v34)
    {
      uint64_t v36 = v62;
      (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v31, v32, v8);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v62 + 56))(v31, 0, 1, v8);
      goto LABEL_23;
    }
    sub_2286C4164();
    memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    if (v34)
    {
      uint64_t v36 = v62;
      (*(void (**)(char *, uint64_t))(v62 + 8))(v31, v8);
      sub_2286C4164();
      memcpy(v31, v32, *(void *)(*(void *)(v37 - 8) + 64));
      goto LABEL_23;
    }
    v57(v31, v32, v8);
  }
  uint64_t v36 = v62;
LABEL_23:
  uint64_t v38 = v63[7];
  uint64_t v39 = &v22[v38];
  uint64_t v40 = &v23[v38];
  int v41 = v10(v39, 1, v8);
  int v42 = v10(v40, 1, v8);
  if (v41)
  {
    if (!v42)
    {
      (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v39, v40, v8);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v39, 0, 1, v8);
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  if (v42)
  {
    (*(void (**)(char *, uint64_t))(v36 + 8))(v39, v8);
LABEL_28:
    sub_2286C4164();
    memcpy(v39, v40, *(void *)(*(void *)(v43 - 8) + 64));
    goto LABEL_29;
  }
  v57(v39, v40, v8);
LABEL_29:
  uint64_t v44 = *(int *)(v58 + 28);
  id v45 = (void **)&v19[v44];
  id v46 = &v59[v44];
  v47 = *v45;
  uint64_t v48 = *(void **)&v59[v44];
  if (!*v45)
  {
    if (v48)
    {
      char *v45 = v48;
      v53 = (void *)*((void *)v46 + 1);
      v45[1] = v53;
      id v54 = v48;
      id v55 = v53;
      goto LABEL_36;
    }
LABEL_35:
    *(_OWORD *)id v45 = *(_OWORD *)v46;
    goto LABEL_36;
  }
  if (!v48)
  {
    sub_2286C59C4((uint64_t)v45);
    goto LABEL_35;
  }
  char *v45 = v48;
  id v49 = v48;

  uint64_t v50 = (void *)*((void *)v46 + 1);
  v51 = v45[1];
  v45[1] = v50;
  id v52 = v50;

LABEL_36:
  *(void *)&a1[v60[10]] = *(void *)((char *)v61 + v60[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2286C59C4(uint64_t a1)
{
  return a1;
}

_OWORD *initializeWithTake for NewsArticleThumbnail(char *a1, char *a2)
{
  long long v4 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v4;
  uint64_t v5 = (int *)type metadata accessor for NewsArticle();
  uint64_t v6 = v5[6];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_2286DD7E8();
  uint64_t v10 = *(void *)(v9 - 8);
  id v46 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (v46(v8, 1, v9))
  {
    sub_2286C4164();
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v12 = v5[7];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = sub_2286DD828();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  v16 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  v16(&a1[v5[8]], &a2[v5[8]], v9);
  id v45 = v5;
  uint64_t v17 = v5[9];
  uint64_t v40 = a1;
  uint64_t v18 = &a1[v17];
  uint64_t v44 = a2;
  uint64_t v19 = &a2[v17];
  long long v20 = *((_OWORD *)v19 + 1);
  *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
  *((_OWORD *)v18 + 1) = v20;
  uint64_t v41 = type metadata accessor for NewsChannel();
  int v42 = v19;
  uint64_t v21 = *(int *)(v41 + 24);
  uint64_t v43 = v18;
  uint64_t v22 = &v18[v21];
  uint64_t v23 = &v19[v21];
  *(void *)uint64_t v22 = *(void *)&v19[v21];
  uint64_t v24 = (int *)type metadata accessor for NewsChannelLogoCollection();
  uint64_t v25 = v24[5];
  uint64_t v26 = &v22[v25];
  uint64_t v27 = v10;
  int v28 = &v23[v25];
  if (v46(&v23[v25], 1, v9))
  {
    sub_2286C4164();
    memcpy(v26, v28, *(void *)(*(void *)(v29 - 8) + 64));
  }
  else
  {
    v16(v26, v28, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v26, 0, 1, v9);
  }
  uint64_t v30 = v24[6];
  uint64_t v31 = &v22[v30];
  uint64_t v32 = &v23[v30];
  if (v46(&v23[v30], 1, v9))
  {
    sub_2286C4164();
    memcpy(v31, v32, *(void *)(*(void *)(v33 - 8) + 64));
    uint64_t v34 = v27;
  }
  else
  {
    v16(v31, v32, v9);
    uint64_t v34 = v27;
    (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v31, 0, 1, v9);
  }
  uint64_t v35 = v24[7];
  uint64_t v36 = &v22[v35];
  uint64_t v37 = &v23[v35];
  if (v46(&v23[v35], 1, v9))
  {
    sub_2286C4164();
    memcpy(v36, v37, *(void *)(*(void *)(v38 - 8) + 64));
  }
  else
  {
    v16(v36, v37, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v36, 0, 1, v9);
  }
  *(_OWORD *)((char *)v43 + *(int *)(v41 + 28)) = *(_OWORD *)((char *)v42 + *(int *)(v41 + 28));
  unint64_t result = v40;
  *(void *)((char *)v40 + v45[10]) = *(void *)((char *)v44 + v45[10]);
  return result;
}

char *assignWithTake for NewsArticleThumbnail(char *a1, char *a2)
{
  uint64_t v4 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *((void *)a2 + 3);
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = (int *)type metadata accessor for NewsArticle();
  uint64_t v7 = v6[6];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = sub_2286DD7E8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    sub_2286C4164();
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
LABEL_7:
  uint64_t v16 = v6[7];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  uint64_t v19 = sub_2286DD828();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  uint64_t v59 = v11;
  id v54 = *(void (**)(char *, char *, uint64_t))(v11 + 40);
  v54(&a1[v6[8]], &a2[v6[8]], v10);
  v57 = v6;
  uint64_t v58 = a2;
  uint64_t v20 = v6[9];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  uint64_t v23 = *(void *)&a2[v20 + 8];
  *(void *)uint64_t v21 = *(void *)&a2[v20];
  *((void *)v21 + 1) = v23;
  swift_bridgeObjectRelease();
  uint64_t v24 = *((void *)v22 + 3);
  *((void *)v21 + 2) = *((void *)v22 + 2);
  *((void *)v21 + 3) = v24;
  swift_bridgeObjectRelease();
  uint64_t v55 = type metadata accessor for NewsChannel();
  v56 = v22;
  uint64_t v25 = *(int *)(v55 + 24);
  uint64_t v26 = &v21[v25];
  uint64_t v27 = &v22[v25];
  *(void *)&v21[v25] = *(void *)v27;
  v60 = (int *)type metadata accessor for NewsChannelLogoCollection();
  uint64_t v28 = v60[5];
  uint64_t v29 = &v26[v28];
  uint64_t v30 = &v27[v28];
  int v31 = v12(&v26[v28], 1, v10);
  int v32 = v12(v30, 1, v10);
  if (v31)
  {
    if (!v32)
    {
      (*(void (**)(char *, char *, uint64_t))(v59 + 32))(v29, v30, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v59 + 56))(v29, 0, 1, v10);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v32)
  {
    (*(void (**)(char *, uint64_t))(v59 + 8))(v29, v10);
LABEL_12:
    sub_2286C4164();
    memcpy(v29, v30, *(void *)(*(void *)(v33 - 8) + 64));
    goto LABEL_13;
  }
  v54(v29, v30, v10);
LABEL_13:
  uint64_t v34 = v60[6];
  uint64_t v35 = &v26[v34];
  uint64_t v36 = &v27[v34];
  int v37 = v12(&v26[v34], 1, v10);
  int v38 = v12(v36, 1, v10);
  if (v37)
  {
    if (!v38)
    {
      uint64_t v40 = v59;
      (*(void (**)(char *, char *, uint64_t))(v59 + 32))(v35, v36, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v59 + 56))(v35, 0, 1, v10);
      goto LABEL_23;
    }
    sub_2286C4164();
    memcpy(v35, v36, *(void *)(*(void *)(v39 - 8) + 64));
  }
  else
  {
    if (v38)
    {
      uint64_t v40 = v59;
      (*(void (**)(char *, uint64_t))(v59 + 8))(v35, v10);
      sub_2286C4164();
      memcpy(v35, v36, *(void *)(*(void *)(v41 - 8) + 64));
      goto LABEL_23;
    }
    v54(v35, v36, v10);
  }
  uint64_t v40 = v59;
LABEL_23:
  uint64_t v42 = v60[7];
  uint64_t v43 = &v26[v42];
  uint64_t v44 = &v27[v42];
  int v45 = v12(v43, 1, v10);
  int v46 = v12(v44, 1, v10);
  if (v45)
  {
    if (!v46)
    {
      (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v43, v44, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(v43, 0, 1, v10);
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  if (v46)
  {
    (*(void (**)(char *, uint64_t))(v40 + 8))(v43, v10);
LABEL_28:
    sub_2286C4164();
    memcpy(v43, v44, *(void *)(*(void *)(v47 - 8) + 64));
    goto LABEL_29;
  }
  v54(v43, v44, v10);
LABEL_29:
  uint64_t v48 = *(int *)(v55 + 28);
  id v49 = (void **)&v21[v48];
  uint64_t v50 = &v56[v48];
  v51 = *v49;
  if (!*v49)
  {
LABEL_33:
    *(_OWORD *)id v49 = *(_OWORD *)v50;
    goto LABEL_34;
  }
  if (!*(void *)v50)
  {
    sub_2286C59C4((uint64_t)v49);
    goto LABEL_33;
  }
  *id v49 = *(void **)v50;

  id v52 = v49[1];
  v49[1] = (void *)*((void *)v50 + 1);

LABEL_34:
  *(void *)&a1[v57[10]] = *(void *)((char *)v58 + v57[10]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NewsArticleThumbnail(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2286C642C);
}

uint64_t sub_2286C642C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NewsArticle();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for NewsArticleThumbnail(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2286C64AC);
}

uint64_t sub_2286C64AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NewsArticle();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for NewsArticleThumbnail()
{
  uint64_t result = qword_268259D00;
  if (!qword_268259D00) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2286C6568()
{
  uint64_t result = type metadata accessor for NewsArticle();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_2286C65F8()
{
  unint64_t result = qword_268259D10;
  if (!qword_268259D10)
  {
    sub_2286C6650();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268259D10);
  }
  return result;
}

void sub_2286C6650()
{
  if (!qword_268259D18)
  {
    sub_2286C4604();
    sub_2286C46C4();
    unint64_t v0 = sub_2286DDED8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268259D18);
    }
  }
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2286C66F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_2286C44AC(a1, *(void (**)(uint64_t *__return_ptr))(v2 + 16), *(void *)(v2 + 24), *(void (**)(uint64_t *__return_ptr))(v2 + 32));
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v5;
  *(_WORD *)(a2 + 16) = v6;
  *(unsigned char *)(a2 + 18) = v7 & 1;
  return result;
}

uint64_t sub_2286C6734(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2286DD988();
  uint64_t result = sub_2286DDB68();
  if (result)
  {
    uint64_t v2 = sub_2286DD978();
    swift_release();
    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2286C67A0()
{
  uint64_t v0 = sub_2286DDC28();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2286DD988();
  sub_2286DDC08();
  uint64_t v4 = *(void (**)(char *, void, uint64_t))(v1 + 104);
  v4(v3, *MEMORY[0x263F7D000], v0);
  sub_2286DDB38();
  swift_release();
  swift_release();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  sub_2286DD898();
  sub_2286DDC08();
  v4(v3, *MEMORY[0x263F7D010], v0);
  sub_2286DDB38();
  swift_release();
  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v5)(v3, v0);
}

uint64_t sub_2286C6960(void *a1)
{
  uint64_t v25 = a1;
  uint64_t v24 = sub_2286DD8F8();
  uint64_t v20 = *(void *)(v24 - 8);
  uint64_t v21 = v20;
  MEMORY[0x270FA5388]();
  uint64_t v23 = (char *)&v15 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_2286DD998();
  uint64_t v2 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v18 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2286DD968();
  MEMORY[0x270FA5388]();
  uint64_t v4 = sub_2286DD9D8();
  uint64_t v16 = *(void *)(v4 - 8);
  uint64_t v17 = v4;
  MEMORY[0x270FA5388]();
  uint64_t v22 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __int16 v6 = (uint64_t (*)(uint64_t))MEMORY[0x263F24D68];
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8E0F8];
  sub_2286C71BC(0, &qword_268259D20, MEMORY[0x263F24D68], MEMORY[0x263F8E0F8]);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_2286DF150;
  sub_2286DD948();
  sub_2286DD958();
  uint64_t v26 = v8;
  sub_2286C7174(&qword_268259D28, MEMORY[0x263F24D68]);
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D488];
  sub_2286C71BC(0, &qword_268259D30, v6, MEMORY[0x263F8D488]);
  sub_2286C7110(&qword_268259D38, &qword_268259D30, v6);
  sub_2286DE258();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v18, *MEMORY[0x263F24D80], v19);
  sub_2286DD9F8();
  swift_allocObject();
  sub_2286DD9E8();
  uint64_t v10 = (uint64_t (*)(uint64_t))MEMORY[0x263F24CF0];
  sub_2286C71BC(0, &qword_268259D40, MEMORY[0x263F24CF0], v7);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_2286DF160;
  sub_2286DD8E8();
  sub_2286DD8C8();
  sub_2286DD8D8();
  uint64_t v26 = v11;
  sub_2286C7174(&qword_268259D48, MEMORY[0x263F24CF0]);
  sub_2286C71BC(0, &qword_268259D50, v10, v9);
  sub_2286C7110((unint64_t *)&unk_268259D58, &qword_268259D50, v10);
  sub_2286DE258();
  sub_2286DD938();
  swift_allocObject();
  uint64_t v12 = v22;
  sub_2286DD928();
  sub_2286DD9C8();
  __swift_project_boxed_opaque_existential_1(v25, v25[3]);
  sub_2286DD898();
  uint64_t result = sub_2286DDB68();
  if (result)
  {
    uint64_t v14 = sub_2286DD878();
    swift_release();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v17);
    return v14;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2286C6ED4()
{
  return sub_2286DD888();
}

uint64_t type metadata accessor for AnalyticsAssembly()
{
  return self;
}

uint64_t sub_2286C6F94()
{
  uint64_t v0 = sub_2286DDC28();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2286DDBA8();
  sub_2286DDA08();
  sub_2286DDC08();
  swift_release();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F7D000], v0);
  sub_2286DDB38();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_2286DDBB8();
  sub_2286DDBF8();
  return swift_release();
}

uint64_t sub_2286C7110(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2286C71BC(255, a2, a3, MEMORY[0x263F8D488]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2286C7174(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_2286C71BC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t type metadata accessor for CampaignLandingPageTracker()
{
  return self;
}

unint64_t sub_2286C7248@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2286C73C0();
  unint64_t result = sub_2286DDB68();
  if (result)
  {
    unint64_t v4 = result;
    uint64_t v5 = type metadata accessor for ArticleRecirculationConfigurationService();
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    a2[3] = v5;
    unint64_t result = sub_2286C7418();
    a2[4] = result;
    *a2 = v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for ServicesAssembly()
{
  return self;
}

uint64_t sub_2286C72F8()
{
  sub_2286DDBA8();
  sub_2286C7368();
  sub_2286DDC18();
  swift_release();

  return swift_release();
}

unint64_t sub_2286C7368()
{
  unint64_t result = qword_26AD8C6A8;
  if (!qword_26AD8C6A8)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_26AD8C6A8);
  }
  return result;
}

unint64_t sub_2286C73C0()
{
  unint64_t result = qword_26AD8D0B0;
  if (!qword_26AD8D0B0)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_26AD8D0B0);
  }
  return result;
}

unint64_t sub_2286C7418()
{
  unint64_t result = qword_268259D68;
  if (!qword_268259D68)
  {
    type metadata accessor for ArticleRecirculationConfigurationService();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268259D68);
  }
  return result;
}

unint64_t sub_2286C7470@<X0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 24) = &type metadata for ToolbarNavigationArticleViewerFeatureVisibilityProvider;
  unint64_t result = sub_2286C7650();
  *(void *)(a1 + 32) = result;
  return result;
}

unint64_t sub_2286C74A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for NewsPlugLabelConfigProvider();
  uint64_t v3 = swift_allocObject();
  a1[3] = v2;
  unint64_t result = sub_2286C75F8();
  a1[4] = result;
  *a1 = v3;
  return result;
}

uint64_t type metadata accessor for ArticleAssembly()
{
  return self;
}

uint64_t sub_2286C751C()
{
  sub_2286DDBA8();
  sub_2286C3550(0, (unint64_t *)&unk_26AD8C6B0);
  sub_2286DDC18();
  swift_release();
  swift_release();
  sub_2286DDBA8();
  sub_2286C3550(0, &qword_26AD8C688);
  sub_2286DDC18();
  swift_release();

  return swift_release();
}

unint64_t sub_2286C75F8()
{
  unint64_t result = qword_268259D70;
  if (!qword_268259D70)
  {
    type metadata accessor for NewsPlugLabelConfigProvider();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268259D70);
  }
  return result;
}

unint64_t sub_2286C7650()
{
  unint64_t result = qword_268259D78;
  if (!qword_268259D78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268259D78);
  }
  return result;
}

id NewsChannelTheme.backgroundColor.getter()
{
  return *v0;
}

id NewsChannelTheme.foregroundColor.getter()
{
  return *(id *)(v0 + 8);
}

uint64_t sub_2286C76B4(char a1)
{
  uint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
    case 3:
      return result;
    case 2:
      unsigned int v3 = 1701998438;
      goto LABEL_4;
    default:
      unsigned int v3 = 1801675106;
LABEL_4:
      uint64_t result = v3 | 0x756F726700000000;
      break;
  }
  return result;
}

BOOL sub_2286C7748(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2286C775C()
{
  return sub_2286DE458();
}

uint64_t sub_2286C77A4()
{
  return sub_2286DE448();
}

uint64_t sub_2286C77D0()
{
  return sub_2286DE458();
}

uint64_t sub_2286C7814()
{
  return sub_2286C76B4(*v0);
}

uint64_t sub_2286C781C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2286C8934(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2286C7844()
{
  return 0;
}

void sub_2286C7850(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_2286C785C(uint64_t a1)
{
  unint64_t v2 = sub_2286C7D20();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2286C7898(uint64_t a1)
{
  unint64_t v2 = sub_2286C7D20();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t NewsChannelTheme.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  sub_2286C83DC(0, &qword_268259D80, MEMORY[0x263F8E040]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v28 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2286C7D20();
  sub_2286DE468();
  if (!v2)
  {
    char v40 = 0;
    sub_2286C7DC4();
    sub_2286DE378();
    long long v10 = aBlock;
    uint64_t v11 = v36;
    uint64_t v12 = v37;
    char v40 = 1;
    sub_2286DE378();
    long long v13 = aBlock;
    uint64_t v14 = v36;
    uint64_t v15 = v37;
    char v40 = 0;
    sub_2286DE378();
    uint64_t v33 = *((void *)&aBlock + 1);
    uint64_t v34 = aBlock;
    int v31 = v37;
    int v32 = v36;
    char v40 = 3;
    sub_2286DE378();
    long long v30 = aBlock;
    uint64_t v29 = v36;
    uint64_t v28 = v37;
    id v17 = objc_allocWithZone(MEMORY[0x263F825C8]);
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = v13;
    *(void *)(v18 + 32) = v14;
    *(void *)(v18 + 40) = v15;
    *(_OWORD *)(v18 + 48) = v10;
    *(void *)(v18 + 64) = v11;
    *(void *)(v18 + 72) = v12;
    int v38 = sub_2286C834C;
    uint64_t v39 = v18;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    uint64_t v36 = sub_2286C8350;
    int v37 = &block_descriptor_0;
    uint64_t v19 = _Block_copy(&aBlock);
    swift_release();
    id v20 = objc_msgSend(v17, sel_initWithDynamicProvider_, v19);
    _Block_release(v19);
    id v21 = objc_allocWithZone(MEMORY[0x263F825C8]);
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = v30;
    uint64_t v23 = v28;
    *(void *)(v22 + 32) = v29;
    *(void *)(v22 + 40) = v23;
    uint64_t v24 = v33;
    *(void *)(v22 + 48) = v34;
    *(void *)(v22 + 56) = v24;
    uint64_t v25 = v31;
    *(void *)(v22 + 64) = v32;
    *(void *)(v22 + 72) = v25;
    int v38 = sub_2286C834C;
    uint64_t v39 = v22;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    uint64_t v36 = sub_2286C8350;
    int v37 = &block_descriptor_7;
    uint64_t v26 = _Block_copy(&aBlock);
    swift_release();
    id v27 = objc_msgSend(v21, sel_initWithDynamicProvider_, v26);
    _Block_release(v26);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    *a2 = v20;
    a2[1] = v27;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_2286C7D20()
{
  unint64_t result = qword_268259D88;
  if (!qword_268259D88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268259D88);
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

unint64_t sub_2286C7DC4()
{
  unint64_t result = qword_268259D90;
  if (!qword_268259D90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268259D90);
  }
  return result;
}

uint64_t NewsChannelTheme.encode(to:)(void *a1)
{
  sub_2286C83DC(0, &qword_268259D98, MEMORY[0x263F8E0C0]);
  uint64_t v4 = v3;
  uint64_t v50 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v45 - v5;
  uint64_t v8 = *(void **)v1;
  uint64_t v7 = *(void **)(v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2286C7D20();
  sub_2286DE478();
  uint64_t v9 = self;
  id v10 = objc_msgSend(v9, sel_traitCollectionWithUserInterfaceStyle_, 1);
  id v11 = objc_msgSend(v8, sel_resolvedColorWithTraitCollection_, v10);

  sub_2286DE208();
  uint64_t v54 = v12;
  sub_2286DE208();
  uint64_t v53 = v13;
  sub_2286DE208();
  uint64_t v52 = v14;
  sub_2286DE208();
  uint64_t v51 = v15;

  id v16 = objc_msgSend(v9, sel_traitCollectionWithUserInterfaceStyle_, 2);
  id v17 = objc_msgSend(v8, sel_resolvedColorWithTraitCollection_, v16);

  sub_2286DE208();
  uint64_t v49 = v18;
  sub_2286DE208();
  uint64_t v48 = v19;
  sub_2286DE208();
  uint64_t v47 = v20;
  sub_2286DE208();
  uint64_t v46 = v21;

  id v22 = objc_msgSend(v9, sel_traitCollectionWithUserInterfaceStyle_, 1);
  id v23 = objc_msgSend(v7, sel_resolvedColorWithTraitCollection_, v22);

  sub_2286DE208();
  uint64_t v25 = v24;
  sub_2286DE208();
  uint64_t v27 = v26;
  sub_2286DE208();
  uint64_t v29 = v28;
  sub_2286DE208();
  uint64_t v31 = v30;

  id v32 = objc_msgSend(v9, sel_traitCollectionWithUserInterfaceStyle_, 2);
  id v33 = objc_msgSend(v7, sel_resolvedColorWithTraitCollection_, v32);

  sub_2286DE208();
  uint64_t v35 = v34;
  sub_2286DE208();
  uint64_t v37 = v36;
  sub_2286DE208();
  uint64_t v39 = v38;
  sub_2286DE208();
  uint64_t v41 = v40;

  uint64_t v56 = v54;
  uint64_t v57 = v53;
  uint64_t v58 = v52;
  uint64_t v59 = v51;
  char v60 = 0;
  sub_2286C8440();
  uint64_t v42 = v55;
  sub_2286DE3B8();
  if (v42) {
    return (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v6, v4);
  }
  uint64_t v44 = v50;
  uint64_t v56 = v49;
  uint64_t v57 = v48;
  uint64_t v58 = v47;
  uint64_t v59 = v46;
  char v60 = 1;
  sub_2286DE3B8();
  uint64_t v56 = v25;
  uint64_t v57 = v27;
  uint64_t v58 = v29;
  uint64_t v59 = v31;
  char v60 = 2;
  sub_2286DE3B8();
  uint64_t v56 = v35;
  uint64_t v57 = v37;
  uint64_t v58 = v39;
  uint64_t v59 = v41;
  char v60 = 3;
  sub_2286DE3B8();
  return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v6, v4);
}

uint64_t sub_2286C823C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return NewsChannelTheme.init(from:)(a1, a2);
}

uint64_t sub_2286C8254(void *a1)
{
  return NewsChannelTheme.encode(to:)(a1);
}

uint64_t static NewsChannelTheme.== infix(_:_:)()
{
  if (sub_2286DE218()) {
    return sub_2286DE218() & 1;
  }
  else {
    return 0;
  }
}

uint64_t sub_2286C82D4()
{
  if (sub_2286DE218()) {
    return sub_2286DE218() & 1;
  }
  else {
    return 0;
  }
}

uint64_t sub_2286C833C()
{
  return MEMORY[0x270FA0238](v0, 80, 7);
}

id sub_2286C8350(uint64_t a1, void *a2)
{
  uint64_t v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  uint64_t v5 = (void *)v3();
  swift_release();

  return v5;
}

uint64_t sub_2286C83B8()
{
  return MEMORY[0x270FA0238](v0, 80, 7);
}

id sub_2286C83C8(void *a1)
{
  return sub_2286DBA78(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[9]);
}

void sub_2286C83DC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_2286C7D20();
    unint64_t v7 = a3(a1, &type metadata for NewsChannelTheme.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

unint64_t sub_2286C8440()
{
  unint64_t result = qword_268259DA0;
  if (!qword_268259DA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268259DA0);
  }
  return result;
}

unint64_t sub_2286C8494()
{
  unint64_t result = qword_268259DA8;
  if (!qword_268259DA8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268259DA8);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for NewsChannelTheme(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  id v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void destroy for NewsChannelTheme(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
}

uint64_t assignWithCopy for NewsChannelTheme(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  unint64_t v7 = *(void **)(a2 + 8);
  uint64_t v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for NewsChannelTheme(uint64_t a1, _OWORD *a2)
{
  id v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for NewsChannelTheme(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for NewsChannelTheme(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NewsChannelTheme()
{
  return &type metadata for NewsChannelTheme;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for NewsChannelTheme.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for NewsChannelTheme.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x2286C87E4);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_2286C880C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2286C8814(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for NewsChannelTheme.CodingKeys()
{
  return &type metadata for NewsChannelTheme.CodingKeys;
}

unint64_t sub_2286C8830()
{
  unint64_t result = qword_268259DB0;
  if (!qword_268259DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268259DB0);
  }
  return result;
}

unint64_t sub_2286C8888()
{
  unint64_t result = qword_268259DB8;
  if (!qword_268259DB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268259DB8);
  }
  return result;
}

unint64_t sub_2286C88E0()
{
  unint64_t result = qword_268259DC0;
  if (!qword_268259DC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268259DC0);
  }
  return result;
}

uint64_t sub_2286C8934(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x756F72676B636162 && a2 == 0xEF726F6C6F43646ELL;
  if (v3 || (sub_2286DE3D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x80000002286E0690 || (sub_2286DE3D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x756F726765726F66 && a2 == 0xEF726F6C6F43646ELL || (sub_2286DE3D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x80000002286E06B0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_2286DE3D8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for RGBAColor(uint64_t *a1, uint64_t *a2)
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

uint64_t getEnumTagSinglePayload for RGBAColor(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for RGBAColor(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for RGBAColor()
{
  return &type metadata for RGBAColor;
}

uint64_t sub_2286C8B9C(char a1)
{
  return qword_2286DF598[a1];
}

uint64_t sub_2286C8BBC(void *a1, double a2, double a3, double a4, double a5)
{
  sub_2286C936C(0, &qword_268259DE0, MEMORY[0x263F8E0C0]);
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v15 = (char *)&v17 - v14;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2286C92C4();
  sub_2286DE478();
  double v19 = a2;
  char v18 = 0;
  sub_2286C93D0();
  sub_2286DE3B8();
  if (!v5)
  {
    double v19 = a3;
    char v18 = 1;
    sub_2286DE3B8();
    double v19 = a4;
    char v18 = 2;
    sub_2286DE3B8();
    double v19 = a5;
    char v18 = 3;
    sub_2286DE3B8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t sub_2286C8DE4()
{
  return sub_2286C8B9C(*v0);
}

uint64_t sub_2286C8DEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2286C8EDC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2286C8E14(uint64_t a1)
{
  unint64_t v2 = sub_2286C92C4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2286C8E50(uint64_t a1)
{
  unint64_t v2 = sub_2286C92C4();

  return MEMORY[0x270FA00B8](a1, v2);
}

void sub_2286C8E8C(void *a1@<X0>, uint64_t a2@<X8>)
{
  double v4 = sub_2286C9050(a1);
  if (!v2)
  {
    *(double *)a2 = v4;
    *(void *)(a2 + 8) = v5;
    *(void *)(a2 + 16) = v6;
    *(void *)(a2 + 24) = v7;
  }
}

uint64_t sub_2286C8EBC(void *a1)
{
  return sub_2286C8BBC(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_2286C8EDC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 6579570 && a2 == 0xE300000000000000;
  if (v3 || (sub_2286DE3D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E65657267 && a2 == 0xE500000000000000 || (sub_2286DE3D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1702194274 && a2 == 0xE400000000000000 || (sub_2286DE3D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6168706C61 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_2286DE3D8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

double sub_2286C9050(void *a1)
{
  sub_2286C936C(0, &qword_268259DC8, MEMORY[0x263F8E040]);
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  int v8 = (char *)&v10 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2286C92C4();
  sub_2286DE468();
  if (!v1)
  {
    HIBYTE(v10) = 0;
    sub_2286C9318();
    sub_2286DE378();
    double v2 = v11;
    HIBYTE(v10) = 1;
    sub_2286DE378();
    HIBYTE(v10) = 2;
    sub_2286DE378();
    HIBYTE(v10) = 3;
    sub_2286DE378();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v2;
}

unint64_t sub_2286C92C4()
{
  unint64_t result = qword_268259DD0;
  if (!qword_268259DD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268259DD0);
  }
  return result;
}

unint64_t sub_2286C9318()
{
  unint64_t result = qword_268259DD8;
  if (!qword_268259DD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268259DD8);
  }
  return result;
}

void sub_2286C936C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_2286C92C4();
    unint64_t v7 = a3(a1, &type metadata for RGBAColor.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

unint64_t sub_2286C93D0()
{
  unint64_t result = qword_268259DE8;
  if (!qword_268259DE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268259DE8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for RGBAColor.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2286C94F0);
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

ValueMetadata *type metadata accessor for RGBAColor.CodingKeys()
{
  return &type metadata for RGBAColor.CodingKeys;
}

unint64_t sub_2286C952C()
{
  unint64_t result = qword_268259DF0;
  if (!qword_268259DF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268259DF0);
  }
  return result;
}

unint64_t sub_2286C9584()
{
  unint64_t result = qword_268259DF8;
  if (!qword_268259DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268259DF8);
  }
  return result;
}

unint64_t sub_2286C95DC()
{
  unint64_t result = qword_268259E00;
  if (!qword_268259E00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268259E00);
  }
  return result;
}

unint64_t sub_2286C9630(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_2286C98A4();
  uint64_t v2 = sub_2286DE308();
  int v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_2286C99A8(v6, (uint64_t)&v13);
    uint64_t v7 = v13;
    unint64_t result = sub_2286C9914(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_2286C9A78(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ArticleRouter()
{
  return self;
}

void sub_2286C976C()
{
  id v0 = objc_msgSend(self, sel_sharedApplication);
  uint64_t v1 = (void *)sub_2286DD7B8();
  sub_2286C9630(MEMORY[0x263F8EE78]);
  type metadata accessor for OpenExternalURLOptionsKey();
  sub_2286C984C();
  id v2 = (id)sub_2286DE128();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_openURL_options_completionHandler_, v1, v2, 0);
}

unint64_t sub_2286C984C()
{
  unint64_t result = qword_26825A110;
  if (!qword_26825A110)
  {
    type metadata accessor for OpenExternalURLOptionsKey();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26825A110);
  }
  return result;
}

void sub_2286C98A4()
{
  if (!qword_268259E08)
  {
    type metadata accessor for OpenExternalURLOptionsKey();
    sub_2286C984C();
    unint64_t v0 = sub_2286DE318();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268259E08);
    }
  }
}

unint64_t sub_2286C9914(uint64_t a1)
{
  sub_2286DE178();
  sub_2286DE438();
  sub_2286DE188();
  uint64_t v2 = sub_2286DE458();
  swift_bridgeObjectRelease();

  return sub_2286C9A88(a1, v2);
}

uint64_t sub_2286C99A8(uint64_t a1, uint64_t a2)
{
  sub_2286C9A0C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_2286C9A0C()
{
  if (!qword_268259E10)
  {
    type metadata accessor for OpenExternalURLOptionsKey();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_268259E10);
    }
  }
}

_OWORD *sub_2286C9A78(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_2286C9A88(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_2286DE178();
    uint64_t v8 = v7;
    if (v6 == sub_2286DE178() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_2286DE3D8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_2286DE178();
          uint64_t v15 = v14;
          if (v13 == sub_2286DE178() && v15 == v16) {
            break;
          }
          char v18 = sub_2286DE3D8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

id sub_2286C9C00()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for WebViewControllerFactory());

  return objc_msgSend(v0, sel_init);
}

uint64_t type metadata accessor for FactoryAssembly()
{
  return self;
}

uint64_t sub_2286C9C5C()
{
  sub_2286DDBA8();
  sub_2286C9CCC();
  sub_2286DDC08();
  swift_release();

  return swift_release();
}

unint64_t sub_2286C9CCC()
{
  unint64_t result = qword_26AD8D0C8;
  if (!qword_26AD8D0C8)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_26AD8D0C8);
  }
  return result;
}

void *sub_2286C9D24()
{
  type metadata accessor for NewsService();
  uint64_t v0 = swift_allocObject();
  unint64_t result = sub_2286C9DBC();
  qword_26AD8C820 = v0;
  return result;
}

uint64_t static NewsService.shared.getter()
{
  if (qword_26AD8C830 != -1) {
    swift_once();
  }

  return swift_retain();
}

void *sub_2286C9DBC()
{
  uint64_t v1 = v0;
  if (qword_26AD8C8E8 != -1) {
    swift_once();
  }
  id v2 = sub_2286CE960();
  id v3 = objc_msgSend(v2, sel_tagController);
  unint64_t result = objc_msgSend(v2, sel_subscriptionController);
  if (result)
  {
    uint64_t v5 = sub_2286DE038();
    swift_allocObject();
    uint64_t v6 = sub_2286DE028();
    uint64_t v7 = MEMORY[0x263F59B48];
    uint64_t v13 = v5;
    uint64_t v14 = MEMORY[0x263F59B48];
    *(void *)&long long v12 = v6;
    swift_retain();
    id v8 = objc_msgSend(v2, sel_news_core_ConfigurationManager);
    unint64_t result = objc_msgSend(v2, sel_paidAccessChecker);
    if (result)
    {
      uint64_t v9 = sub_2286DE058();
      swift_allocObject();
      id v10 = v2;
      uint64_t v11 = sub_2286DE048();
      v1[5] = v5;
      v1[6] = v7;
      v1[2] = v6;
      uint64_t v13 = v9;
      uint64_t v14 = MEMORY[0x263F59C10];

      *(void *)&long long v12 = v11;
      sub_2286CC130(&v12, (uint64_t)(v1 + 7));
      return v1;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t NewsService.storeFrontID.getter()
{
  if (qword_26AD8C8E8 != -1) {
    swift_once();
  }
  id v0 = sub_2286CE960();
  id v1 = objc_msgSend(v0, sel_contentStoreFrontID);

  uint64_t v2 = sub_2286DE178();
  return v2;
}

uint64_t NewsService.fetchArticles(for:)(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return MEMORY[0x270FA2498](sub_2286CA02C, 0, 0);
}

uint64_t sub_2286CA02C()
{
  uint64_t v1 = *(void *)(v0[3] + 16);
  if (v1)
  {
    uint64_t v2 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
    id v3 = (void *)MEMORY[0x263F8EE78];
    do
    {
      uint64_t v5 = *(v2 - 1);
      uint64_t v4 = *v2;
      swift_bridgeObjectRetain();
      uint64_t v6 = (void *)sub_2286DE148();
      unsigned __int8 v7 = objc_msgSend(v6, sel_fc_isValidArticleID);

      if ((v7 & 1) == 0)
      {
        id v8 = (void *)sub_2286DE148();
        id v9 = (id)FCArticleCloudKitIDFromUUID();

        uint64_t v5 = sub_2286DE178();
        uint64_t v11 = v10;

        swift_bridgeObjectRelease();
        uint64_t v4 = v11;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        id v3 = sub_2286CAFC4(0, v3[2] + 1, 1, v3);
      }
      unint64_t v13 = v3[2];
      unint64_t v12 = v3[3];
      if (v13 >= v12 >> 1) {
        id v3 = sub_2286CAFC4((void *)(v12 > 1), v13 + 1, 1, v3);
      }
      v3[2] = v13 + 1;
      uint64_t v14 = &v3[2 * v13];
      v14[4] = v5;
      v14[5] = v4;
      v2 += 2;
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v3 = (void *)MEMORY[0x263F8EE78];
  }
  v0[5] = v3;
  uint64_t v15 = v0[4];
  uint64_t v16 = swift_task_alloc();
  v0[6] = v16;
  *(void *)(v16 + 16) = v15;
  *(void *)(v16 + 24) = v3;
  uint64_t v17 = (void *)swift_task_alloc();
  v0[7] = v17;
  sub_2286CBDDC(0, (unint64_t *)&unk_26AD8C620, (uint64_t (*)(uint64_t))type metadata accessor for NewsArticle, MEMORY[0x263F8D488]);
  *uint64_t v17 = v0;
  v17[1] = sub_2286CA290;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000013, 0x80000002286E0710, sub_2286CB0E0, v16, v18);
}

uint64_t sub_2286CA290()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_2286CA3D0;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v2 = sub_2286CA3B4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2286CA3B4()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

uint64_t sub_2286CA3D0()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2286CA43C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = a1;
  sub_2286CB124();
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = a2;
  uint64_t v22 = a3;
  sub_2286CBDDC(0, (unint64_t *)&unk_26AD8C630, (uint64_t (*)(uint64_t))sub_2286CB238, MEMORY[0x263F8D488]);
  sub_2286DDC88();
  double v19 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v19(v10, a1, v7);
  unint64_t v11 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v18[1] = v11 + v9;
  uint64_t v12 = swift_allocObject();
  unint64_t v13 = *(void (**)(unint64_t, char *, uint64_t))(v8 + 32);
  v13(v12 + v11, v10, v7);
  uint64_t v14 = (void *)sub_2286DDC38();
  v18[0] = sub_2286DDC48();
  swift_release();
  swift_release();

  v19(v10, v20, v7);
  uint64_t v15 = swift_allocObject();
  v13(v15 + v11, v10, v7);
  uint64_t v16 = (void *)sub_2286DDC38();
  sub_2286DDC58();
  swift_release();

  swift_release();
  return swift_release();
}

uint64_t sub_2286CA6AC(uint64_t a1)
{
  __swift_project_boxed_opaque_existential_1((void *)(a1 + 56), *(void *)(a1 + 80));
  id v1 = objc_msgSend(self, sel_defaultCachePolicy);
  uint64_t v2 = sub_2286DE068();

  return v2;
}

uint64_t sub_2286CA754(unint64_t *a1, uint64_t a2)
{
  uint64_t v59 = a2;
  uint64_t v72 = type metadata accessor for NewsChannel();
  MEMORY[0x270FA5388](v72);
  v71 = (uint64_t *)((char *)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2286CBDDC(0, &qword_26AD8C520, (uint64_t (*)(uint64_t))type metadata accessor for NewsArticle, MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (uint64_t *)((char *)&v58 - v5);
  uint64_t v70 = type metadata accessor for NewsArticle();
  uint64_t v63 = *(void *)(v70 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v70);
  uint64_t v69 = (uint64_t)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v62 = (uint64_t)&v58 - v9;
  unint64_t v10 = *a1;
  unint64_t v74 = MEMORY[0x263F8EE78];
  if (v10 >> 62) {
    goto LABEL_24;
  }
  uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v11)
  {
    while (1)
    {
      uint64_t v58 = (char *)v6;
      unint64_t v13 = 0;
      uint64_t v6 = (uint64_t *)(v10 & 0xC000000000000001);
      unint64_t v68 = v10 & 0xFFFFFFFFFFFFFF8;
      *(void *)&long long v12 = 136446210;
      long long v61 = v12;
      uint64_t v60 = MEMORY[0x263F8EE58] + 8;
      uint64_t v64 = v10;
      unint64_t v65 = v10 & 0xC000000000000001;
      while (v6)
      {
        uint64_t v14 = (void *)MEMORY[0x22A698660](v13, v10);
        unint64_t v15 = v13 + 1;
        if (__OFADD__(v13, 1)) {
          goto LABEL_23;
        }
LABEL_9:
        if ((objc_msgSend(v14, sel_isPaid, v58, v59) & 1) != 0
          || (objc_msgSend(v14, sel_respondsToSelector_, sel_isBundlePaid) & 1) != 0
          && (objc_msgSend(v14, sel_isBundlePaid) & 1) != 0)
        {
          if (qword_2682596A0 != -1) {
            swift_once();
          }
          uint64_t v16 = sub_2286DDDD8();
          __swift_project_value_buffer(v16, (uint64_t)qword_26825C5F0);
          swift_unknownObjectRetain_n();
          uint64_t v17 = sub_2286DDDB8();
          os_log_type_t v18 = sub_2286DE1F8();
          if (os_log_type_enabled(v17, v18))
          {
            double v19 = (_DWORD *)swift_slowAlloc();
            v66 = v19;
            v67 = (void (**)(void, void, void, void))swift_slowAlloc();
            v73 = v67;
            _DWORD *v19 = v61;
            id v20 = objc_msgSend(v14, sel_identifier);
            uint64_t v21 = v11;
            uint64_t v22 = sub_2286DE178();
            unint64_t v24 = v23;

            uint64_t v25 = v22;
            uint64_t v11 = v21;
            uint64_t v26 = sub_2286CB6E0(v25, v24, (uint64_t *)&v73);
            uint64_t v27 = (uint8_t *)v66;
            *(void *)(v66 + 1) = v26;
            swift_unknownObjectRelease_n();
            uint64_t v6 = (uint64_t *)v65;
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_2286C0000, v17, v18, "NewsService filtered paid headline, id=%{public}s", v27, 0xCu);
            uint64_t v28 = v67;
            swift_arrayDestroy();
            MEMORY[0x22A698D30](v28, -1, -1);
            unint64_t v10 = v64;
            MEMORY[0x22A698D30](v27, -1, -1);
            swift_unknownObjectRelease();
          }
          else
          {

            swift_unknownObjectRelease_n();
          }
        }
        else
        {
          sub_2286DE298();
          sub_2286DE2B8();
          sub_2286DE2C8();
          sub_2286DE2A8();
        }
        ++v13;
        if (v15 == v11)
        {
          unint64_t v29 = v74;
          uint64_t v6 = (uint64_t *)v58;
          goto LABEL_26;
        }
      }
      if (v13 < *(void *)(v68 + 16)) {
        break;
      }
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_2286DE2F8();
      if (!v11) {
        goto LABEL_25;
      }
    }
    uint64_t v14 = *(void **)(v10 + 8 * v13 + 32);
    swift_unknownObjectRetain();
    unint64_t v15 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      goto LABEL_23;
    }
    goto LABEL_9;
  }
LABEL_25:
  unint64_t v29 = MEMORY[0x263F8EE78];
LABEL_26:
  swift_bridgeObjectRelease();
  if ((v29 & 0x8000000000000000) == 0 && (v29 & 0x4000000000000000) == 0)
  {
    uint64_t v30 = *(void *)(v29 + 16);
    uint64_t result = swift_retain();
    if (v30) {
      goto LABEL_29;
    }
LABEL_49:
    unint64_t v33 = MEMORY[0x263F8EE78];
LABEL_50:
    swift_release_n();
    unint64_t v74 = v33;
    sub_2286CB124();
    return sub_2286DE1D8();
  }
  swift_retain();
  uint64_t result = sub_2286DE2F8();
  uint64_t v30 = result;
  if (!result) {
    goto LABEL_49;
  }
LABEL_29:
  if (v30 >= 1)
  {
    uint64_t v32 = 0;
    v67 = (void (**)(void, void, void, void))(v63 + 56);
    unint64_t v68 = v29 & 0xC000000000000001;
    v66 = (_DWORD *)(v63 + 48);
    unint64_t v33 = MEMORY[0x263F8EE78];
    uint64_t v64 = v30;
    unint64_t v65 = v29;
    do
    {
      if (v68)
      {
        uint64_t v34 = (void *)MEMORY[0x22A698660](v32, v29);
      }
      else
      {
        uint64_t v34 = *(void **)(v29 + 8 * v32 + 32);
        swift_unknownObjectRetain();
      }
      id v35 = objc_msgSend(v34, sel_sourceChannel, v58);
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = v6;
        swift_unknownObjectRetain();
        id v38 = objc_msgSend((id)swift_unknownObjectRetain(), sel_identifier);
        uint64_t v39 = sub_2286DE178();
        uint64_t v41 = v40;

        uint64_t v42 = v71;
        uint64_t *v71 = v39;
        v42[1] = v41;
        id v43 = objc_msgSend(v36, sel_name);
        uint64_t v44 = sub_2286DE178();
        uint64_t v46 = v45;

        v42[2] = v44;
        v42[3] = v46;
        id v47 = objc_msgSend(v36, sel_theme);
        sub_2286D8844(v47, (double *)((char *)v42 + *(int *)(v72 + 24)));
        if (objc_msgSend(v36, sel_theme))
        {
          uint64_t ObjectType = swift_getObjectType();
          id v49 = sub_2286D04A0(ObjectType);
          id v50 = sub_2286D04C8(ObjectType);
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
        }
        else
        {
          swift_unknownObjectRelease();
          id v49 = 0;
          id v50 = 0;
        }
        uint64_t v52 = (uint64_t)v71;
        uint64_t v53 = (uint64_t *)((char *)v71 + *(int *)(v72 + 28));
        void *v53 = v49;
        v53[1] = v50;
        uint64_t v6 = v37;
        sub_2286D2C44(v34, v52, v37);
        swift_unknownObjectRelease();
        uint64_t v51 = 0;
        uint64_t v30 = v64;
        unint64_t v29 = v65;
      }
      else
      {
        uint64_t v51 = 1;
      }
      uint64_t v54 = v70;
      (*v67)(v6, v51, 1, v70);
      swift_unknownObjectRelease();
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))v66)(v6, 1, v54) == 1)
      {
        sub_2286CBD50((uint64_t)v6);
      }
      else
      {
        uint64_t v55 = v62;
        sub_2286C3FE0((uint64_t)v6, v62);
        sub_2286C3FE0(v55, v69);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v33 = sub_2286CB44C(0, *(void *)(v33 + 16) + 1, 1, v33);
        }
        unint64_t v57 = *(void *)(v33 + 16);
        unint64_t v56 = *(void *)(v33 + 24);
        if (v57 >= v56 >> 1) {
          unint64_t v33 = sub_2286CB44C(v56 > 1, v57 + 1, 1, v33);
        }
        *(void *)(v33 + 16) = v57 + 1;
        sub_2286C3FE0(v69, v33+ ((*(unsigned __int8 *)(v63 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v63 + 80))+ *(void *)(v63 + 72) * v57);
      }
      ++v32;
    }
    while (v30 != v32);
    goto LABEL_50;
  }
  __break(1u);
  return result;
}

uint64_t sub_2286CAF18(void *a1)
{
  id v1 = a1;
  sub_2286CB124();
  return sub_2286DE1C8();
}

uint64_t NewsService.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return v0;
}

uint64_t NewsService.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);

  return MEMORY[0x270FA0228](v0, 96, 7);
}

void *sub_2286CAFC4(void *result, int64_t a2, char a3, void *a4)
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
      sub_2286CC0E8(0, &qword_26AD8C668);
      unint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      unint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2286CBE40(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2286CB0E0(uint64_t a1)
{
  return sub_2286CA43C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t type metadata accessor for NewsService()
{
  return self;
}

uint64_t method lookup function for NewsService(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for NewsService);
}

void sub_2286CB124()
{
  if (!qword_26AD8C640)
  {
    sub_2286CBDDC(255, (unint64_t *)&unk_26AD8C620, (uint64_t (*)(uint64_t))type metadata accessor for NewsArticle, MEMORY[0x263F8D488]);
    sub_2286CB1C4();
    unint64_t v0 = sub_2286DE1E8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AD8C640);
    }
  }
}

unint64_t sub_2286CB1C4()
{
  unint64_t result = qword_26AD8C678;
  if (!qword_26AD8C678)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_26AD8C678);
  }
  return result;
}

uint64_t sub_2286CB21C()
{
  return sub_2286CA6AC(*(void *)(v0 + 16));
}

unint64_t sub_2286CB238()
{
  unint64_t result = qword_26AD8C648;
  if (!qword_26AD8C648)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_26AD8C648);
  }
  return result;
}

uint64_t sub_2286CB294(unint64_t *a1)
{
  sub_2286CB124();
  return sub_2286CA754(a1, v1+ ((*(unsigned __int8 *)(*(void *)(v3 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3 - 8) + 80)));
}

uint64_t objectdestroyTm_0()
{
  sub_2286CB124();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2286CB3A4(void *a1)
{
  sub_2286CB124();

  return sub_2286CAF18(a1);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_2286CB44C(char a1, int64_t a2, char a3, unint64_t a4)
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
        goto LABEL_29;
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
    unint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  sub_2286CBDDC(0, (unint64_t *)&unk_26AD8C658, (uint64_t (*)(uint64_t))type metadata accessor for NewsArticle, MEMORY[0x263F8E0F8]);
  uint64_t v10 = *(void *)(type metadata accessor for NewsArticle() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_2286DE2D8();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for NewsArticle() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_2286CBF34(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_2286CB6E0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2286CB7B4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2286CC08C((uint64_t)v12, *a3);
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
      sub_2286CC08C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2286CB7B4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2286DE238();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2286CB970(a5, a6);
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
  uint64_t v8 = sub_2286DE288();
  if (!v8)
  {
    sub_2286DE2D8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2286DE328();
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

uint64_t sub_2286CB970(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2286CBA08(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2286CBBF4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2286CBBF4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2286CBA08(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_2286CBB80(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2286DE268();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2286DE2D8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2286DE198();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2286DE328();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2286DE2D8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_2286CBB80(uint64_t a1, uint64_t a2)
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
  sub_2286CC0E8(0, &qword_268259EF0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2286CBBF4(char a1, int64_t a2, char a3, char *a4)
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
    sub_2286CC0E8(0, &qword_268259EF0);
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
  uint64_t result = sub_2286DE328();
  __break(1u);
  return result;
}

uint64_t sub_2286CBD50(uint64_t a1)
{
  sub_2286CBDDC(0, &qword_26AD8C520, (uint64_t (*)(uint64_t))type metadata accessor for NewsArticle, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2286CBDDC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_2286CBE40(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      return v6;
    }
  }
  uint64_t result = sub_2286DE328();
  __break(1u);
  return result;
}

uint64_t sub_2286CBF34(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for NewsArticle() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_2286DE328();
  __break(1u);
  return result;
}

uint64_t sub_2286CC08C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_2286CC0E8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_2286DE3C8();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t sub_2286CC130(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

BOOL static NewsChannel.LogoTheme.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t NewsChannel.LogoTheme.hash(into:)()
{
  return sub_2286DE448();
}

uint64_t NewsChannel.LogoTheme.hashValue.getter()
{
  return sub_2286DE458();
}

uint64_t NewsChannel.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t NewsChannel.name.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t NewsChannel.logo.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for NewsChannel();
  return sub_2286CCC3C(v1 + *(int *)(v3 + 24), a1, (uint64_t (*)(void))type metadata accessor for NewsChannelLogoCollection);
}

uint64_t type metadata accessor for NewsChannel()
{
  uint64_t result = qword_26AD8C580;
  if (!qword_26AD8C580) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id NewsChannel.theme.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for NewsChannel() + 28);
  uint64_t v4 = *(void **)v3;
  unint64_t v5 = *(void **)(v3 + 8);
  *a1 = *(void *)v3;
  a1[1] = v5;

  return sub_2286CC318(v4, v5);
}

id sub_2286CC318(id result, void *a2)
{
  if (result)
  {
    id v2 = result;
    return a2;
  }
  return result;
}

uint64_t sub_2286CC358(char a1)
{
  return qword_2286DF938[a1];
}

uint64_t sub_2286CC378()
{
  return sub_2286CC358(*v0);
}

uint64_t sub_2286CC380@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2286CE7B4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2286CC3A8(uint64_t a1)
{
  unint64_t v2 = sub_2286CC648();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2286CC3E4(uint64_t a1)
{
  unint64_t v2 = sub_2286CC648();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t NewsChannel.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  sub_2286CCADC(0, &qword_268259EF8, MEMORY[0x263F8E0C0]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = &v12[-v8];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2286CC648();
  sub_2286DE478();
  LOBYTE(v13) = 0;
  sub_2286DE398();
  if (!v2)
  {
    LOBYTE(v13) = 1;
    sub_2286DE398();
    uint64_t v10 = type metadata accessor for NewsChannel();
    LOBYTE(v13) = 2;
    type metadata accessor for NewsChannelLogoCollection();
    sub_2286CCB40(&qword_268259F08);
    sub_2286DE3B8();
    long long v13 = *(_OWORD *)(v3 + *(int *)(v10 + 28));
    v12[15] = 3;
    sub_2286CC69C();
    sub_2286DE388();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
}

unint64_t sub_2286CC648()
{
  unint64_t result = qword_268259F00;
  if (!qword_268259F00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268259F00);
  }
  return result;
}

unint64_t sub_2286CC69C()
{
  unint64_t result = qword_268259F10;
  if (!qword_268259F10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268259F10);
  }
  return result;
}

uint64_t NewsChannel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v19 = a2;
  uint64_t v3 = type metadata accessor for NewsChannelLogoCollection();
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2286CCADC(0, &qword_268259F18, MEMORY[0x263F8E040]);
  uint64_t v20 = *(void *)(v6 - 8);
  uint64_t v21 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v18 - v7;
  uint64_t v9 = type metadata accessor for NewsChannel();
  MEMORY[0x270FA5388](v9);
  unint64_t v11 = (uint64_t *)((char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2286CC648();
  uint64_t v22 = v8;
  uint64_t v12 = (uint64_t)v23;
  sub_2286DE468();
  if (v12) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  unint64_t v23 = a1;
  uint64_t v13 = v20;
  uint64_t v14 = v21;
  LOBYTE(v24) = 0;
  uint64_t *v11 = sub_2286DE358();
  v11[1] = v15;
  LOBYTE(v24) = 1;
  v11[2] = sub_2286DE358();
  v11[3] = v16;
  LOBYTE(v24) = 2;
  sub_2286CCB40(&qword_268259F20);
  sub_2286DE378();
  sub_2286CCB84((uint64_t)v5, (uint64_t)v11 + *(int *)(v9 + 24));
  char v25 = 3;
  sub_2286CCBE8();
  sub_2286DE348();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v22, v14);
  *(_OWORD *)((char *)v11 + *(int *)(v9 + 28)) = v24;
  sub_2286CCC3C((uint64_t)v11, v19, (uint64_t (*)(void))type metadata accessor for NewsChannel);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  return sub_2286CCCA4((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for NewsChannel);
}

void sub_2286CCADC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_2286CC648();
    unint64_t v7 = a3(a1, &type metadata for NewsChannel.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_2286CCB40(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for NewsChannelLogoCollection();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2286CCB84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NewsChannelLogoCollection();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_2286CCBE8()
{
  unint64_t result = qword_268259F28;
  if (!qword_268259F28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268259F28);
  }
  return result;
}

uint64_t sub_2286CCC3C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2286CCCA4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2286CCD04@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return NewsChannel.init(from:)(a1, a2);
}

uint64_t sub_2286CCD1C(void *a1)
{
  return NewsChannel.encode(to:)(a1);
}

uint64_t sub_2286CCD3C@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

BOOL _s7NewsKit0A7ChannelV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (v5 = sub_2286DE3D8(), BOOL result = 0, (v5 & 1) != 0))
  {
    BOOL v7 = a1[2] == a2[2] && a1[3] == a2[3];
    if (v7 || (v8 = sub_2286DE3D8(), BOOL result = 0, (v8 & 1) != 0))
    {
      uint64_t v9 = type metadata accessor for NewsChannel();
      if ((static NewsChannelLogoCollection.== infix(_:_:)((char *)a1 + *(int *)(v9 + 24), (char *)a2 + *(int *)(v9 + 24)) & 1) == 0)return 0; {
      uint64_t v10 = *(int *)(v9 + 28);
      }
      uint64_t v12 = *(void **)((char *)a1 + v10);
      unint64_t v11 = *(void **)((char *)a1 + v10 + 8);
      uint64_t v13 = (char *)a2 + v10;
      uint64_t v15 = *(void **)v13;
      uint64_t v14 = (void *)*((void *)v13 + 1);
      if (v12)
      {
        if (v15)
        {
          sub_2286C8494();
          sub_2286CC318(v12, v11);
          sub_2286CC318(v12, v11);
          sub_2286CC318(v15, v14);
          if (sub_2286DE218())
          {
            char v16 = sub_2286DE218();
            sub_2286CE918(v15, v14);

            sub_2286CE918(v12, v11);
            return (v16 & 1) != 0;
          }
          sub_2286CE918(v15, v14);

          uint64_t v19 = v12;
          uint64_t v20 = v11;
          goto LABEL_22;
        }
        id v17 = v12;
        id v18 = v11;
      }
      else if (!v15)
      {
        return 1;
      }
      sub_2286CC318(v15, v14);
      sub_2286CE918(v12, v11);
      uint64_t v19 = v15;
      uint64_t v20 = v14;
LABEL_22:
      sub_2286CE918(v19, v20);
      return 0;
    }
  }
  return result;
}

unint64_t sub_2286CCEE4()
{
  unint64_t result = qword_268259F30;
  if (!qword_268259F30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268259F30);
  }
  return result;
}

uint64_t sub_2286CCF38()
{
  return MEMORY[0x263F8D320];
}

uint64_t *initializeBufferWithCopyOfBuffer for NewsChannel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  BOOL v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *BOOL v4 = *a2;
    BOOL v4 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    uint64_t v7 = a2[3];
    a1[2] = a2[2];
    a1[3] = v7;
    uint64_t v8 = *(int *)(a3 + 24);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    *(uint64_t *)((char *)a1 + v8) = *(uint64_t *)((char *)a2 + v8);
    uint64_t v11 = type metadata accessor for NewsChannelLogoCollection();
    uint64_t v12 = *(int *)(v11 + 20);
    __dst = &v9[v12];
    uint64_t v36 = v11;
    uint64_t v13 = &v10[v12];
    uint64_t v14 = sub_2286DD7E8();
    uint64_t v15 = *(void *)(v14 - 8);
    char v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v38 = v16;
    if (v16(v13, 1, v14))
    {
      sub_2286C4164();
      memcpy(__dst, v13, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(__dst, v13, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(__dst, 0, 1, v14);
    }
    uint64_t v19 = *(int *)(v36 + 24);
    uint64_t v20 = &v9[v19];
    uint64_t v21 = &v10[v19];
    if (v38(&v10[v19], 1, v14))
    {
      sub_2286C4164();
      memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v20, v21, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v20, 0, 1, v14);
    }
    uint64_t v23 = *(int *)(v36 + 28);
    long long v24 = &v9[v23];
    char v25 = &v10[v23];
    if (v38(&v10[v23], 1, v14))
    {
      sub_2286C4164();
      memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v24, v25, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v24, 0, 1, v14);
    }
    uint64_t v27 = *(int *)(a3 + 28);
    uint64_t v28 = (uint64_t *)((char *)v4 + v27);
    unint64_t v29 = (char *)a2 + v27;
    uint64_t v30 = *(void **)((char *)a2 + v27);
    if (v30)
    {
      uint64_t v31 = (void *)*((void *)v29 + 1);
      void *v28 = v30;
      v28[1] = v31;
      id v32 = v30;
      id v33 = v31;
    }
    else
    {
      *(_OWORD *)uint64_t v28 = *(_OWORD *)v29;
    }
  }
  return v4;
}

void destroy for NewsChannel(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  int v5 = (int *)type metadata accessor for NewsChannelLogoCollection();
  uint64_t v6 = v4 + v5[5];
  uint64_t v7 = sub_2286DD7E8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
  if (!v9(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  uint64_t v10 = v4 + v5[6];
  if (!v9(v10, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v10, v7);
  }
  uint64_t v11 = v4 + v5[7];
  if (!v9(v11, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v7);
  }
  uint64_t v12 = a1 + *(int *)(a2 + 28);
  if (*(void *)v12)
  {

    uint64_t v13 = *(void **)(v12 + 8);
  }
}

void *initializeWithCopy for NewsChannel(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  *(void *)((char *)a1 + v7) = *(void *)((char *)a2 + v7);
  uint64_t v10 = type metadata accessor for NewsChannelLogoCollection();
  uint64_t v11 = *(int *)(v10 + 20);
  __dst = &v8[v11];
  uint64_t v34 = v10;
  uint64_t v12 = &v9[v11];
  uint64_t v13 = sub_2286DD7E8();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v36 = v15;
  if (v15(v12, 1, v13))
  {
    sub_2286C4164();
    memcpy(__dst, v12, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(__dst, v12, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(__dst, 0, 1, v13);
  }
  uint64_t v17 = *(int *)(v34 + 24);
  uint64_t v18 = &v8[v17];
  uint64_t v19 = &v9[v17];
  if (v36(&v9[v17], 1, v13))
  {
    sub_2286C4164();
    memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v18, v19, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v18, 0, 1, v13);
  }
  uint64_t v21 = *(int *)(v34 + 28);
  uint64_t v22 = &v8[v21];
  uint64_t v23 = &v9[v21];
  if (v36(&v9[v21], 1, v13))
  {
    sub_2286C4164();
    memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v22, v23, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v22, 0, 1, v13);
  }
  uint64_t v25 = *(int *)(a3 + 28);
  uint64_t v26 = (void *)((char *)a1 + v25);
  uint64_t v27 = (char *)a2 + v25;
  uint64_t v28 = *(void **)((char *)a2 + v25);
  if (v28)
  {
    unint64_t v29 = (void *)*((void *)v27 + 1);
    *uint64_t v26 = v28;
    v26[1] = v29;
    id v30 = v28;
    id v31 = v29;
  }
  else
  {
    *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
  }
  return a1;
}

void *assignWithCopy for NewsChannel(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v44 = a3;
  uint64_t v45 = a2;
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (void *)((char *)a2 + v6);
  *(void *)((char *)a1 + v6) = *v8;
  uint64_t v9 = (int *)type metadata accessor for NewsChannelLogoCollection();
  uint64_t v10 = v9[5];
  uint64_t v11 = &v7[v10];
  uint64_t v46 = v8;
  uint64_t v12 = (char *)v8 + v10;
  uint64_t v13 = sub_2286DD7E8();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  int v16 = v15(v11, 1, v13);
  int v17 = v15(v12, 1, v13);
  if (v16)
  {
    if (!v17)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v11, v12, v13);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v17)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v13);
LABEL_6:
    sub_2286C4164();
    memcpy(v11, v12, *(void *)(*(void *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 24))(v11, v12, v13);
LABEL_7:
  uint64_t v19 = v9[6];
  uint64_t v20 = &v7[v19];
  uint64_t v21 = (char *)v46 + v19;
  int v22 = v15(&v7[v19], 1, v13);
  int v23 = v15(v21, 1, v13);
  if (v22)
  {
    if (!v23)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v20, v21, v13);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v20, 0, 1, v13);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v23)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v20, v13);
LABEL_12:
    sub_2286C4164();
    memcpy(v20, v21, *(void *)(*(void *)(v24 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 24))(v20, v21, v13);
LABEL_13:
  uint64_t v25 = v9[7];
  uint64_t v26 = &v7[v25];
  uint64_t v27 = (char *)v46 + v25;
  int v28 = v15(&v7[v25], 1, v13);
  int v29 = v15(v27, 1, v13);
  if (v28)
  {
    if (!v29)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v26, v27, v13);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v26, 0, 1, v13);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v29)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v26, v13);
LABEL_18:
    sub_2286C4164();
    memcpy(v26, v27, *(void *)(*(void *)(v30 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 24))(v26, v27, v13);
LABEL_19:
  uint64_t v31 = *(int *)(v44 + 28);
  id v32 = (void *)((char *)a1 + v31);
  id v33 = (char *)v45 + v31;
  uint64_t v34 = *(void **)((char *)a1 + v31);
  id v35 = *(void **)((char *)v45 + v31);
  if (!v34)
  {
    if (v35)
    {
      *id v32 = v35;
      uint64_t v40 = (void *)*((void *)v33 + 1);
      v32[1] = v40;
      id v41 = v35;
      id v42 = v40;
      return a1;
    }
LABEL_25:
    *(_OWORD *)id v32 = *(_OWORD *)v33;
    return a1;
  }
  if (!v35)
  {
    sub_2286C59C4((uint64_t)v32);
    goto LABEL_25;
  }
  *id v32 = v35;
  id v36 = v35;

  uint64_t v37 = (void *)*((void *)v33 + 1);
  id v38 = (void *)v32[1];
  v32[1] = v37;
  id v39 = v37;

  return a1;
}

_OWORD *initializeWithTake for NewsChannel(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  *(void *)((char *)a1 + v5) = *(void *)((char *)a2 + v5);
  uint64_t v8 = (int *)type metadata accessor for NewsChannelLogoCollection();
  uint64_t v9 = v8[5];
  uint64_t v10 = &v6[v9];
  uint64_t v11 = &v7[v9];
  uint64_t v12 = sub_2286DD7E8();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  if (v14(v11, 1, v12))
  {
    sub_2286C4164();
    memcpy(v10, v11, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  uint64_t v16 = v8[6];
  int v17 = &v6[v16];
  uint64_t v18 = &v7[v16];
  if (v14(&v7[v16], 1, v12))
  {
    sub_2286C4164();
    memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v17, v18, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v17, 0, 1, v12);
  }
  uint64_t v20 = v8[7];
  uint64_t v21 = &v6[v20];
  int v22 = &v7[v20];
  if (v14(&v7[v20], 1, v12))
  {
    sub_2286C4164();
    memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v21, v22, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v21, 0, 1, v12);
  }
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 28));
  return a1;
}

void *assignWithTake for NewsChannel(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v39 = a3;
  uint64_t v40 = a2;
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (void *)((char *)a2 + v8);
  *(void *)((char *)a1 + v8) = *v10;
  uint64_t v11 = (int *)type metadata accessor for NewsChannelLogoCollection();
  uint64_t v12 = v11[5];
  uint64_t v13 = &v9[v12];
  id v41 = v10;
  uint64_t v14 = (char *)v10 + v12;
  uint64_t v15 = sub_2286DD7E8();
  uint64_t v16 = *(void *)(v15 - 8);
  int v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v14, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
LABEL_6:
    sub_2286C4164();
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v13, v14, v15);
LABEL_7:
  uint64_t v21 = v11[6];
  int v22 = &v9[v21];
  uint64_t v23 = (char *)v41 + v21;
  int v24 = v17(&v9[v21], 1, v15);
  int v25 = v17(v23, 1, v15);
  if (v24)
  {
    if (!v25)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v22, v23, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v22, 0, 1, v15);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v25)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v22, v15);
LABEL_12:
    sub_2286C4164();
    memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v22, v23, v15);
LABEL_13:
  uint64_t v27 = v11[7];
  int v28 = &v9[v27];
  int v29 = (char *)v41 + v27;
  int v30 = v17(&v9[v27], 1, v15);
  int v31 = v17(v29, 1, v15);
  if (v30)
  {
    if (!v31)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v28, v29, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v28, 0, 1, v15);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v31)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v28, v15);
LABEL_18:
    sub_2286C4164();
    memcpy(v28, v29, *(void *)(*(void *)(v32 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v28, v29, v15);
LABEL_19:
  uint64_t v33 = *(int *)(v39 + 28);
  uint64_t v34 = (uint64_t)a1 + v33;
  id v35 = (char *)v40 + v33;
  id v36 = *(void **)((char *)a1 + v33);
  if (!v36)
  {
LABEL_23:
    *(_OWORD *)uint64_t v34 = *(_OWORD *)v35;
    return a1;
  }
  if (!*(void *)v35)
  {
    sub_2286C59C4(v34);
    goto LABEL_23;
  }
  *(void *)uint64_t v34 = *(void *)v35;

  uint64_t v37 = *(void **)(v34 + 8);
  *(void *)(v34 + 8) = *((void *)v35 + 1);

  return a1;
}

uint64_t getEnumTagSinglePayload for NewsChannel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2286CE208);
}

uint64_t sub_2286CE208(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for NewsChannelLogoCollection();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for NewsChannel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2286CE2CC);
}

uint64_t sub_2286CE2CC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for NewsChannelLogoCollection();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_2286CE374()
{
  uint64_t result = type metadata accessor for NewsChannelLogoCollection();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for NewsChannel.LogoTheme(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for NewsChannel.LogoTheme(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2286CE570);
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

ValueMetadata *type metadata accessor for NewsChannel.LogoTheme()
{
  return &type metadata for NewsChannel.LogoTheme;
}

unsigned char *storeEnumTagSinglePayload for NewsChannel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2286CE674);
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

ValueMetadata *type metadata accessor for NewsChannel.CodingKeys()
{
  return &type metadata for NewsChannel.CodingKeys;
}

unint64_t sub_2286CE6B0()
{
  unint64_t result = qword_268259F38;
  if (!qword_268259F38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268259F38);
  }
  return result;
}

unint64_t sub_2286CE708()
{
  unint64_t result = qword_268259F40;
  if (!qword_268259F40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268259F40);
  }
  return result;
}

unint64_t sub_2286CE760()
{
  unint64_t result = qword_268259F48;
  if (!qword_268259F48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268259F48);
  }
  return result;
}

uint64_t sub_2286CE7B4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_2286DE3D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000 || (sub_2286DE3D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1869049708 && a2 == 0xE400000000000000 || (sub_2286DE3D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656D656874 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_2286DE3D8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

void sub_2286CE918(void *a1, void *a2)
{
  if (a1)
  {
  }
}

id sub_2286CE960()
{
  uint64_t v1 = v0;
  sub_2286C4164();
  uint64_t v2 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  unsigned int v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  char v6 = (char *)&v27 - v5;
  BOOL v7 = *(void **)(v0 + 72);
  if (v7)
  {
    id v8 = *(id *)(v0 + 72);
LABEL_11:
    id v26 = v7;
    return v8;
  }
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F59408]), sel_initWithEnvironment_, sub_2286D0240());
  sub_2286CF5A0();
  uint64_t v11 = v10;
  id v12 = (id)FCURLForContainerizedUserAccountCachesDirectory();
  if (v12)
  {
    uint64_t v13 = v12;
    sub_2286DD7D8();

    uint64_t v14 = sub_2286DD7E8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v6, 0, 1, v14);
  }
  else
  {
    uint64_t v15 = sub_2286DD7E8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v6, 1, 1, v15);
  }
  id v16 = (id)FCURLForContainerizedUserAccountCachesDirectory();
  if (v16)
  {
    int v17 = v16;
    sub_2286DD7D8();

    uint64_t v18 = sub_2286DD7E8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v4, 0, 1, v18);
  }
  else
  {
    uint64_t v19 = sub_2286DD7E8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v4, 1, 1, v19);
  }
  id v20 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PrivateDataActionProvider()), sel_init);
  id v21 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for StubAppActivityMonitor()), sel_init);
  id v22 = objc_msgSend(self, sel_defaultAvailability);
  id v23 = objc_allocWithZone(MEMORY[0x263F593E0]);
  id result = sub_2286D0030(v9, v11, (uint64_t)v6, (uint64_t)v4, (uint64_t)v20, 0, (uint64_t)v21, 0xF87FFFFC1, 2, 0, 0, (uint64_t)v22, 0);
  if (result)
  {
    int v25 = *(void **)(v1 + 72);
    *(void *)(v1 + 72) = result;
    id v8 = result;

    BOOL v7 = 0;
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_2286CEC48()
{
  type metadata accessor for NewsKitModule();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_2286CED38();
  qword_26AD8D6E0 = v0;
  return result;
}

uint64_t sub_2286CEC84@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  sub_2286CFEAC(v1 + 24, (uint64_t)&v4);
  if (v5) {
    return sub_2286CC130(&v4, a1);
  }
  sub_2286CFDBC((uint64_t)&v4);
  sub_2286DDCB8();
  sub_2286CFF3C(a1, (uint64_t)&v4);
  swift_beginAccess();
  sub_2286CFFA0((uint64_t)&v4, v1 + 24);
  return swift_endAccess();
}

uint64_t sub_2286CED38()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2286DDC98();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2286DDB98();
  *(_OWORD *)(v0 + 24) = 0u;
  *(_OWORD *)(v0 + 40) = 0u;
  *(void *)(v0 + 56) = 0;
  swift_allocObject();
  *(void *)(v0 + 64) = sub_2286DDB88();
  char v6 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8E0F8];
  sub_2286CFE44(0, &qword_26AD8D0E8, &qword_26AD8C6E0, MEMORY[0x263F7CF00], MEMORY[0x263F8E0F8]);
  *(void *)(v0 + 72) = 0;
  *(void *)(v0 + 80) = 0;
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_2286DF980;
  objc_msgSend(objc_allocWithZone(MEMORY[0x263F6C658]), sel_init);
  uint64_t v8 = sub_2286DDBD8();
  swift_allocObject();
  uint64_t v9 = sub_2286DDBE8();
  uint64_t v10 = MEMORY[0x263F7CF70];
  *(void *)(v7 + 56) = v8;
  *(void *)(v7 + 64) = v10;
  *(void *)(v7 + 32) = v9;
  objc_msgSend(objc_allocWithZone(MEMORY[0x263F5A3C8]), sel_init);
  swift_allocObject();
  uint64_t v11 = sub_2286DDBE8();
  *(void *)(v7 + 96) = v8;
  *(void *)(v7 + 104) = v10;
  *(void *)(v7 + 72) = v11;
  id v12 = (objc_class *)sub_2286DDBC8();
  id v13 = objc_msgSend(objc_allocWithZone(v12), sel_init);
  uint64_t v14 = MEMORY[0x263F7CEA8];
  *(void *)(v7 + 136) = v12;
  *(void *)(v7 + 144) = v14;
  *(void *)(v7 + 112) = v13;
  uint64_t v15 = (objc_class *)sub_2286DDE48();
  id v16 = objc_msgSend(objc_allocWithZone(v15), sel_init);
  *(void *)(v7 + 176) = v15;
  *(void *)(v7 + 184) = sub_2286D0434(&qword_26AD8C738, MEMORY[0x263F7D578]);
  *(void *)(v7 + 152) = v16;
  int v17 = (objc_class *)sub_2286DDEB8();
  id v18 = objc_msgSend(objc_allocWithZone(v17), sel_init);
  *(void *)(v7 + 216) = v17;
  *(void *)(v7 + 224) = sub_2286D0434((unint64_t *)&unk_26AD8C760, MEMORY[0x263F58920]);
  *(void *)(v7 + 192) = v18;
  uint64_t v19 = (objc_class *)sub_2286DE118();
  id v20 = objc_msgSend(objc_allocWithZone(v19), sel_init);
  *(void *)(v7 + 256) = v19;
  *(void *)(v7 + 264) = sub_2286D0434((unint64_t *)&unk_26AD8CF98, MEMORY[0x263F59E38]);
  *(void *)(v7 + 232) = v20;
  id v21 = (objc_class *)sub_2286DDB18();
  id v22 = objc_msgSend(objc_allocWithZone(v21), sel_init);
  *(void *)(v7 + 296) = v21;
  *(void *)(v7 + 304) = sub_2286D0434((unint64_t *)&unk_26AD8C6C0, MEMORY[0x263F58EE0]);
  *(void *)(v7 + 272) = v22;
  id v23 = (objc_class *)sub_2286DDDA8();
  id v24 = objc_msgSend(objc_allocWithZone(v23), sel_init);
  *(void *)(v7 + 336) = v23;
  *(void *)(v7 + 344) = sub_2286D0434((unint64_t *)&unk_26AD8C728, MEMORY[0x263F5A258]);
  *(void *)(v7 + 312) = v24;
  int v25 = (objc_class *)sub_2286DDD48();
  id v26 = objc_msgSend(objc_allocWithZone(v25), sel_init);
  *(void *)(v7 + 376) = v25;
  *(void *)(v7 + 384) = sub_2286D0434(&qword_26AD8C700, MEMORY[0x263F596A8]);
  *(void *)(v7 + 352) = v26;
  sub_2286CFE44(0, (unint64_t *)&unk_26AD8D0D8, (unint64_t *)&unk_26AD8C6D0, MEMORY[0x263F7CD88], v6);
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_2286DF990;
  uint64_t v28 = type metadata accessor for ArticleAssembly();
  uint64_t v29 = swift_allocObject();
  *(void *)(v27 + 56) = v28;
  *(void *)(v27 + 64) = sub_2286D0434(&qword_26AD8CA58, (void (*)(uint64_t))type metadata accessor for ArticleAssembly);
  *(void *)(v27 + 32) = v29;
  uint64_t v30 = type metadata accessor for AnalyticsAssembly();
  uint64_t v31 = swift_allocObject();
  *(void *)(v27 + 96) = v30;
  *(void *)(v27 + 104) = sub_2286D0434(&qword_26AD8CE40, (void (*)(uint64_t))type metadata accessor for AnalyticsAssembly);
  *(void *)(v27 + 72) = v31;
  uint64_t v32 = type metadata accessor for FactoryAssembly();
  uint64_t v33 = swift_allocObject();
  *(void *)(v27 + 136) = v32;
  *(void *)(v27 + 144) = sub_2286D0434(&qword_26AD8CAF8, (void (*)(uint64_t))type metadata accessor for FactoryAssembly);
  *(void *)(v27 + 112) = v33;
  uint64_t v34 = type metadata accessor for NewsCoreAssembly();
  uint64_t v35 = swift_allocObject();
  *(void *)(v27 + 176) = v34;
  *(void *)(v27 + 184) = sub_2286D0434((unint64_t *)&unk_26AD8C770, (void (*)(uint64_t))type metadata accessor for NewsCoreAssembly);
  *(void *)(v27 + 152) = v35;
  uint64_t v36 = type metadata accessor for ProviderAssembly();
  uint64_t v37 = swift_allocObject();
  *(void *)(v27 + 216) = v36;
  *(void *)(v27 + 224) = sub_2286D0434(&qword_26AD8CC48, (void (*)(uint64_t))type metadata accessor for ProviderAssembly);
  *(void *)(v27 + 192) = v37;
  uint64_t v38 = type metadata accessor for RouterAssembly();
  uint64_t v39 = swift_allocObject();
  *(void *)(v27 + 256) = v38;
  *(void *)(v27 + 264) = sub_2286D0434(&qword_26AD8C9B0, (void (*)(uint64_t))type metadata accessor for RouterAssembly);
  *(void *)(v27 + 232) = v39;
  uint64_t v40 = type metadata accessor for ServicesAssembly();
  uint64_t v41 = swift_allocObject();
  *(void *)(v27 + 296) = v40;
  *(void *)(v27 + 304) = sub_2286D0434(&qword_26AD8CCE8, (void (*)(uint64_t))type metadata accessor for ServicesAssembly);
  *(void *)(v27 + 272) = v41;
  uint64_t v42 = type metadata accessor for SettingsAssembly();
  uint64_t v43 = swift_allocObject();
  *(void *)(v27 + 336) = v42;
  *(void *)(v27 + 344) = sub_2286D0434((unint64_t *)&unk_26AD8CD90, (void (*)(uint64_t))type metadata accessor for SettingsAssembly);
  *(void *)(v27 + 312) = v43;
  uint64_t v44 = type metadata accessor for SubscriptionAssembly();
  uint64_t v45 = swift_allocObject();
  *(void *)(v27 + 376) = v44;
  *(void *)(v27 + 384) = sub_2286D0434(&qword_26AD8CEE8, (void (*)(uint64_t))type metadata accessor for SubscriptionAssembly);
  *(void *)(v27 + 352) = v45;
  uint64_t v46 = type metadata accessor for ToolbarAssembly();
  uint64_t v47 = swift_allocObject();
  *(void *)(v27 + 416) = v46;
  *(void *)(v27 + 424) = sub_2286D0434((unint64_t *)&unk_26AD8CBA0, (void (*)(uint64_t))type metadata accessor for ToolbarAssembly);
  *(void *)(v27 + 392) = v47;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F7D038], v2);
  sub_2286DDCC8();
  swift_allocObject();
  swift_retain();
  *(void *)(v1 + 16) = sub_2286DDCA8();
  return v1;
}

void sub_2286CF5A0()
{
  uint64_t v1 = v0;
  sub_2286C4164();
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *(void **)(v1 + 80);
  if (v4) {
    goto LABEL_25;
  }
  id v5 = objc_msgSend(self, sel_defaultConfiguration);
  id v6 = (id)FCURLForContainerizedUserAccountCachesDirectory();
  if (v6)
  {
    uint64_t v7 = v6;
    sub_2286DD7D8();

    uint64_t v8 = sub_2286DD7E8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v3, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_2286DD7E8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v3, 1, 1, v9);
  }
  id v10 = objc_msgSend(self, sel_sharedInstance);
  id v11 = (id)FCBundle();
  if (!v11)
  {
    __break(1u);
    goto LABEL_27;
  }
  id v12 = v11;
  id v13 = (void *)sub_2286DE148();
  id v14 = objc_msgSend(v12, sel_objectForInfoDictionaryKey_, v13);

  if (v14)
  {
    sub_2286DE248();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
  }
  sub_2286CFCA0((uint64_t)&v34, (uint64_t)v36);
  id v33 = v10;
  if (v37)
  {
    if (swift_dynamicCast())
    {
      id v15 = v5;
      goto LABEL_14;
    }
  }
  else
  {
    sub_2286CFD60((uint64_t)v36);
  }
  id v15 = v5;
LABEL_14:
  id v16 = (id)FCBundle();
  if (!v16)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  int v17 = v16;
  id v18 = (void *)sub_2286DE148();
  id v19 = objc_msgSend(v17, sel_objectForInfoDictionaryKey_, v18);

  if (v19)
  {
    sub_2286DE248();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
  }
  sub_2286CFCA0((uint64_t)&v34, (uint64_t)v36);
  if (v37) {
    swift_dynamicCast();
  }
  else {
    sub_2286CFD60((uint64_t)v36);
  }
  uint64_t v20 = sub_2286DD7E8();
  uint64_t v21 = *(void *)(v20 - 8);
  id v22 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v3, 1, v20) != 1)
  {
    id v22 = (void *)sub_2286DD7B8();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v3, v20);
  }
  id v23 = objc_allocWithZone(MEMORY[0x263F593F8]);
  id v24 = (void *)sub_2286DE148();
  swift_bridgeObjectRelease();
  int v25 = (void *)sub_2286DE148();
  swift_bridgeObjectRelease();
  id v26 = v15;
  id v27 = v15;
  uint64_t v28 = v33;
  id v29 = objc_msgSend(v23, sel_initWithContextConfiguration_contentHostDirectoryFileURL_feldsparIDProvider_appShortVersionString_buildNumberString_networkBehaviorMonitor_, v27, v22, v33, v24, v25, 0);

  if (v29)
  {
    uint64_t v30 = *(void **)(v1 + 80);
    *(void *)(v1 + 80) = v29;
    v29;

    uint64_t v4 = 0;
LABEL_25:
    id v31 = v4;
    return;
  }
LABEL_28:
  __break(1u);
}

uint64_t sub_2286CFA30()
{
  swift_release();
  sub_2286CFDBC(v0 + 24);
  swift_release();

  return MEMORY[0x270FA0228](v0, 88, 7);
}

uint64_t type metadata accessor for NewsKitModule()
{
  return self;
}

uint64_t sub_2286CFBC0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

id sub_2286CFC44()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PrivateDataActionProvider()
{
  return self;
}

uint64_t sub_2286CFCA0(uint64_t a1, uint64_t a2)
{
  sub_2286CFD04();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_2286CFD04()
{
  if (!qword_26AD8D0F0)
  {
    unint64_t v0 = sub_2286DE228();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AD8D0F0);
    }
  }
}

uint64_t sub_2286CFD60(uint64_t a1)
{
  sub_2286CFD04();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2286CFDBC(uint64_t a1)
{
  sub_2286CFE44(0, &qword_268259FB8, (unint64_t *)&unk_268259FC0, MEMORY[0x263F7CDB8], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2286CFE44(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v8 = sub_2286C3550(255, a3);
    unint64_t v9 = a5(a1, v8);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

uint64_t sub_2286CFEAC(uint64_t a1, uint64_t a2)
{
  sub_2286CFE44(0, &qword_268259FB8, (unint64_t *)&unk_268259FC0, MEMORY[0x263F7CDB8], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2286CFF3C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2286CFFA0(uint64_t a1, uint64_t a2)
{
  sub_2286CFE44(0, &qword_268259FB8, (unint64_t *)&unk_268259FC0, MEMORY[0x263F7CDB8], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

id sub_2286D0030(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, __int16 a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v14 = sub_2286DD7E8();
  uint64_t v15 = *(void *)(v14 - 8);
  id v16 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48);
  int v17 = 0;
  if (v16(a3, 1, v14) != 1)
  {
    int v17 = (void *)sub_2286DD7B8();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a3, v14);
  }
  if (v16(a4, 1, v14) == 1)
  {
    id v18 = 0;
  }
  else
  {
    id v18 = (void *)sub_2286DD7B8();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a4, v14);
  }
  LOWORD(v20) = a10 & 0x101;
  id v24 = objc_msgSend(v23, sel_initWithConfiguration_configurationManager_contentHostDirectory_privateDataHostDirectory_privateDataActionProvider_networkBehaviorMonitor_appActivityMonitor_desiredHeadlineFieldOptions_feedUsage_lockStoreFrontIfNeeded_deviceIsiPad_backgroundTaskable_privateDataSyncAvailability_pptContext_, a1, a2, v17, v18, a5, a6, a7, a8, a9, v20, a11, a12, a13);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v24;
}

uint64_t sub_2286D0240()
{
  uint64_t v0 = sub_2286DE018();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2286DD868();
  sub_2286DD858();
  sub_2286DD838();
  sub_2286DD848();
  swift_release();
  swift_release();
  int v4 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v3, v0);
  uint64_t v5 = 0;
  if (v4 != *MEMORY[0x263F59760])
  {
    if (v4 == *MEMORY[0x263F59798])
    {
      return 1;
    }
    else if (v4 == *MEMORY[0x263F59768])
    {
      return 2;
    }
    else if (v4 == *MEMORY[0x263F59770])
    {
      return 3;
    }
    else if (v4 == *MEMORY[0x263F59788])
    {
      return 4;
    }
    else if (v4 == *MEMORY[0x263F59790])
    {
      return 6;
    }
    else if (v4 == *MEMORY[0x263F59778])
    {
      return 7;
    }
    else if (v4 == *MEMORY[0x263F59780])
    {
      return 8;
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
      return 0;
    }
  }
  return v5;
}

uint64_t sub_2286D0434(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for PostPurchaseOnboardingViewControllerFactory()
{
  return self;
}

id sub_2286D04A0(uint64_t a1)
{
  return sub_2286D04F0(a1, (uint64_t)&unk_26DCE6C38, (uint64_t)sub_2286D08C8, (uint64_t)&block_descriptor_10);
}

id sub_2286D04C8(uint64_t a1)
{
  return sub_2286D04F0(a1, (uint64_t)&unk_26DCE6BE8, (uint64_t)sub_2286D0894, (uint64_t)&block_descriptor_2);
}

id sub_2286D04F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = v7;
  id v9 = objc_allocWithZone(MEMORY[0x263F825C8]);
  v13[4] = a3;
  v13[5] = v8;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 1107296256;
  v13[2] = sub_2286C8350;
  v13[3] = a4;
  uint64_t v10 = _Block_copy(v13);
  swift_retain();
  id v11 = objc_msgSend(v9, sel_initWithDynamicProvider_, v10);
  _Block_release(v10);
  swift_release();
  swift_release();
  return v11;
}

uint64_t sub_2286D060C()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_2286D0644(void *a1, uint64_t a2, uint64_t a3, SEL *a4, SEL *a5, SEL *a6)
{
  uint64_t v10 = a2 + 16;
  swift_beginAccess();
  uint64_t v11 = MEMORY[0x22A698DE0](v10);
  if (v11)
  {
    id v12 = (void *)v11;
    id v13 = objc_msgSend(a1, sel_userInterfaceStyle);
    if ((unint64_t)v13 >= 2)
    {
      if (v13 == (id)2)
      {
        id v17 = [v12 *a5];
        if (v17)
        {
          id v18 = v17;
          id v19 = objc_msgSend(v17, sel_ne_color);
          swift_unknownObjectRelease();

          return v19;
        }
        id v14 = [v12 *a6];
        if (v14)
        {
LABEL_16:
          uint64_t v20 = v14;
          id v19 = objc_msgSend(v14, sel_ne_color);
          swift_unknownObjectRelease();

          return v19;
        }
      }
      else
      {
        id v14 = objc_msgSend(v12, sel_backgroundColor);
        if (v14) {
          goto LABEL_16;
        }
      }
    }
    else
    {
      id v14 = [v12 *a6];
      if (v14) {
        goto LABEL_16;
      }
    }
    id v19 = [self *a4];
    swift_unknownObjectRelease();
    return v19;
  }
  id v15 = [self *a4];

  return v15;
}

uint64_t sub_2286D085C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_2286D0894(void *a1)
{
  return sub_2286D0644(a1, *(void *)(v1 + 24), *(void *)(v1 + 16), (SEL *)&selRef_whiteColor, (SEL *)&selRef_darkStyleForegroundColor, (SEL *)&selRef_foregroundColor);
}

id sub_2286D08C8(void *a1)
{
  return sub_2286D0644(a1, *(void *)(v1 + 24), *(void *)(v1 + 16), (SEL *)&selRef_systemBackgroundColor, (SEL *)&selRef_darkStyleBackgroundColor, (SEL *)&selRef_backgroundColor);
}

uint64_t type metadata accessor for StubAppActivityMonitor()
{
  return self;
}

uint64_t sub_2286D0974()
{
  uint64_t v0 = sub_2286DDDD8();
  __swift_allocate_value_buffer(v0, qword_26825C5F0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26825C5F0);
  id v1 = objc_msgSend(self, sel_mainBundle);
  id v2 = objc_msgSend(v1, sel_bundleIdentifier);

  if (v2)
  {
    sub_2286DE178();
  }
  return sub_2286DDDC8();
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

uint64_t NewsArticleView.init(articles:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t NewsArticleView.init(identifiers:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = 1;
  return result;
}

uint64_t NewsArticleView.makeUIViewController(context:)()
{
  char v1 = *(unsigned char *)(v0 + 8);
  uint64_t v2 = swift_bridgeObjectRetain();
  if (v1)
  {
    return _s7NewsKit0A21ArticleViewControllerC11identifiersACSaySSG_tcfC_0(v2);
  }
  else
  {
    return _s7NewsKit0A21ArticleViewControllerC8articlesACSayAA0aC0VG_tcfC_0(v2);
  }
}

uint64_t sub_2286D0B38()
{
  char v1 = *(unsigned char *)(v0 + 8);
  uint64_t v2 = swift_bridgeObjectRetain();
  if (v1)
  {
    return _s7NewsKit0A21ArticleViewControllerC11identifiersACSaySSG_tcfC_0(v2);
  }
  else
  {
    return _s7NewsKit0A21ArticleViewControllerC8articlesACSayAA0aC0VG_tcfC_0(v2);
  }
}

uint64_t sub_2286D0B9C()
{
  return sub_2286DDF48();
}

uint64_t sub_2286D0BD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_2286D0ECC();

  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_2286D0C3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_2286D0ECC();

  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

void sub_2286D0CA0()
{
}

unint64_t sub_2286D0CCC()
{
  unint64_t result = qword_26825A030;
  if (!qword_26825A030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26825A030);
  }
  return result;
}

uint64_t sub_2286D0D20()
{
  return MEMORY[0x263F1BB58];
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for NewsArticleView()
{
  return &type metadata for NewsArticleView;
}

uint64_t initializeBufferWithCopyOfBuffer for NewsArticleView.Content(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for NewsArticleView.Content()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s7NewsKit15NewsArticleViewV7ContentOwca_0(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for NewsArticleView.Content(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s7NewsKit15NewsArticleViewV7ContentOwet_0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s7NewsKit15NewsArticleViewV7ContentOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_2286D0EA8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_2286D0EB0(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for NewsArticleView.Content()
{
  return &type metadata for NewsArticleView.Content;
}

unint64_t sub_2286D0ECC()
{
  unint64_t result = qword_26825A038;
  if (!qword_26825A038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26825A038);
  }
  return result;
}

uint64_t type metadata accessor for SubscriptionsRouter()
{
  return self;
}

uint64_t sub_2286D0F50()
{
  return MEMORY[0x270F50388]();
}

uint64_t sub_2286D0F74@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_2286DDE38();
  MEMORY[0x270FA5388](v4 - 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2286C2BE4(0, &qword_26825A040);
  uint64_t result = sub_2286DDB78();
  if (v7)
  {
    sub_2286DDE18();
    sub_2286DDE28();
    uint64_t result = sub_2286DDE08();
    uint64_t v6 = MEMORY[0x263F7D3F8];
    *a2 = result;
    a2[1] = v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_2286D1088@<X0>(void *a1@<X8>)
{
  uint64_t v2 = (objc_class *)sub_2286DDE68();
  id result = objc_msgSend(objc_allocWithZone(v2), sel_init);
  uint64_t v4 = MEMORY[0x263F7D760];
  a1[3] = v2;
  a1[4] = v4;
  *a1 = result;
  return result;
}

uint64_t type metadata accessor for ToolbarAssembly()
{
  return self;
}

uint64_t sub_2286D10F8()
{
  uint64_t v0 = sub_2286DDC28();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  unsigned int v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2286DDBA8();
  sub_2286C2BE4(0, &qword_26AD8C748);
  sub_2286DDC18();
  swift_release();
  swift_release();
  sub_2286DDBA8();
  sub_2286C2BE4(0, (unint64_t *)&unk_26AD8C750);
  sub_2286DDC18();
  swift_release();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F7D010], v0);
  sub_2286DDB38();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_2286D12B4()
{
  uint64_t v0 = sub_2286DDE98();
  __swift_allocate_value_buffer(v0, qword_26825C608);
  __swift_project_value_buffer(v0, (uint64_t)qword_26825C608);
  return sub_2286DDE88();
}

id NewsArticleViewController.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void NewsArticleViewController.init(coder:)()
{
}

uint64_t sub_2286D1460(void *a1)
{
  return sub_2286DDB48();
}

Swift::Void __swiftcall NewsArticleViewController.showArticle(with:)(Swift::String with)
{
}

Swift::Void __swiftcall NewsArticleViewController.loadView()()
{
  sub_2286CFF3C((uint64_t)v0 + OBJC_IVAR____TtC7NewsKit25NewsArticleViewController_sceneProvider, (uint64_t)v5);
  uint64_t v1 = (objc_class *)type metadata accessor for SceneProvidingView();
  id v2 = objc_allocWithZone(v1);
  sub_2286CFF3C((uint64_t)v5, (uint64_t)v2 + OBJC_IVAR____TtC7NewsKit18SceneProvidingView_sceneProvider);
  v4.receiver = v2;
  v4.super_class = v1;
  id v3 = objc_msgSendSuper2(&v4, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  objc_msgSend(v0, sel_setView_, v3);
}

Swift::Void __swiftcall NewsArticleViewController.viewDidLoad()()
{
  v8.receiver = v0;
  v8.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v8, sel_viewDidLoad);
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC7NewsKit25NewsArticleViewController_contentViewController];
  objc_msgSend(v0, sel_addChildViewController_, v1);
  id v2 = objc_msgSend(v0, sel_view);
  if (v2)
  {
    id v3 = v2;
    id v4 = objc_msgSend(v1, sel_view);
    if (v4)
    {
      uint64_t v5 = v4;
      objc_msgSend(v3, sel_addSubview_, v4);

      objc_msgSend(v1, sel_didMoveToParentViewController_, v0);
      id v6 = objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC7NewsKit25NewsArticleViewController_articleViewController], sel_navigationItem);
      id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F824A8]), sel_initWithBarButtonSystemItem_target_action_, 0, v0, sel_handleDone);
      objc_msgSend(v6, sel_setLeftBarButtonItem_, v7);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

Swift::Void __swiftcall NewsArticleViewController.viewDidLayoutSubviews()()
{
  v13.receiver = v0;
  v13.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v13, sel_viewDidLayoutSubviews);
  id v1 = objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC7NewsKit25NewsArticleViewController_contentViewController], sel_view);
  if (v1)
  {
    id v2 = v1;
    id v3 = objc_msgSend(v0, sel_view);
    if (v3)
    {
      id v4 = v3;
      objc_msgSend(v3, sel_bounds);
      double v6 = v5;
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;

      objc_msgSend(v2, sel_setFrame_, v6, v8, v10, v12);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

id NewsArticleViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  if (a2)
  {
    double v6 = (void *)sub_2286DE148();
    swift_bridgeObjectRelease();
  }
  else
  {
    double v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void NewsArticleViewController.init(nibName:bundle:)()
{
}

id NewsArticleViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2286D1B60(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2286D1B80(a1, a2, a3, (void *)*v3);
  *id v3 = result;
  return result;
}

uint64_t sub_2286D1B80(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    objc_super v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  sub_2286D2BE0(0, &qword_26825A078, MEMORY[0x263F58C68], MEMORY[0x263F8E0F8]);
  uint64_t v10 = *(void *)(sub_2286DDA98() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  objc_super v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_2286DDA98() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  id v18 = (char *)v13 + v17;
  id v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_2286DE328();
  __break(1u);
  return result;
}

uint64_t sub_2286D1DEC(uint64_t a1, void *a2)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  v23[3] = sub_2286DDAF8();
  v23[4] = MEMORY[0x263F58E60];
  v23[0] = a1;
  uint64_t v5 = qword_26AD8C8E8;
  unint64_t v6 = a2;
  if (v5 != -1) {
    swift_once();
  }
  sub_2286CEC84((uint64_t)v21);
  __swift_project_boxed_opaque_existential_1(v21, v22);
  sub_2286C3550(0, &qword_26825A060);
  uint64_t result = sub_2286DDB78();
  if (!v19)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  sub_2286CC130(&v18, (uint64_t)v20);
  __swift_project_boxed_opaque_existential_1(v20, v20[3]);
  if (qword_2682596A8 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_2286DDE98();
  __swift_project_value_buffer(v8, (uint64_t)qword_26825C608);
  sub_2286D2B48();
  sub_2286DDEA8();
  __swift_project_boxed_opaque_existential_1(v21, v22);
  sub_2286C3550(0, &qword_26825A070);
  sub_2286CFF3C((uint64_t)v20, (uint64_t)&v18);
  uint64_t v9 = swift_allocObject();
  sub_2286CC130(&v18, v9 + 16);
  sub_2286DDB58();
  uint64_t result = swift_release();
  if (!v17) {
    goto LABEL_10;
  }
  sub_2286CC130(&v16, (uint64_t)&v18);
  __swift_project_boxed_opaque_existential_1(&v18, v19);
  uint64_t v10 = (void *)sub_2286DDAC8();
  id v11 = objc_msgSend(objc_allocWithZone((Class)sub_2286DDE78()), sel_initWithRootViewController_, v10);
  *(void *)&v6[OBJC_IVAR____TtC7NewsKit25NewsArticleViewController_articleViewController] = v10;
  *(void *)&v6[OBJC_IVAR____TtC7NewsKit25NewsArticleViewController_contentViewController] = v11;
  __swift_project_boxed_opaque_existential_1(v21, v22);
  sub_2286C3550(0, &qword_26AD8C740);
  id v12 = v10;
  id v13 = v11;
  uint64_t result = sub_2286DDB78();
  if (v17)
  {
    sub_2286CC130(&v16, (uint64_t)&v6[OBJC_IVAR____TtC7NewsKit25NewsArticleViewController_sceneProvider]);

    v15.receiver = v6;
    v15.super_class = ObjectType;
    id v14 = objc_msgSendSuper2(&v15, sel_initWithNibName_bundle_, 0, 0);

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v18);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    return (uint64_t)v14;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t _s7NewsKit0A21ArticleViewControllerC8articlesACSayAA0aC0VG_tcfC_0(uint64_t a1)
{
  sub_2286D2BE0(0, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v38 = (char *)&v28 - v3;
  uint64_t v37 = sub_2286DDA78();
  uint64_t v4 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v37);
  unint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for NewsArticle();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_2286DDA98();
  uint64_t v11 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  id v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_2286DDAA8();
  uint64_t v32 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  long long v16 = (uint64_t *)((char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  int64_t v17 = *(void *)(a1 + 16);
  if (v17)
  {
    uint64_t v29 = v14;
    uint64_t v30 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v39 = MEMORY[0x263F8EE78];
    sub_2286D1B60(0, v17, 0);
    uint64_t v18 = *(unsigned __int8 *)(v8 + 80);
    uint64_t v31 = a1;
    uint64_t v19 = a1 + ((v18 + 32) & ~v18);
    uint64_t v35 = *(void *)(v8 + 72);
    unsigned int v34 = *MEMORY[0x263F58C60];
    uint64_t v20 = (void (**)(char *, void, uint64_t))(v4 + 104);
    uint64_t v33 = v11 + 32;
    do
    {
      sub_2286D2A88(v19, (uint64_t)v10);
      uint64_t v21 = sub_2286DD7E8();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v38, 1, 1, v21);
      swift_bridgeObjectRetain();
      sub_2286DDA38();
      (*v20)(v6, v34, v37);
      sub_2286DDA88();
      sub_2286D2AEC((uint64_t)v10);
      uint64_t v22 = v39;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2286D1B60(0, *(void *)(v22 + 16) + 1, 1);
        uint64_t v22 = v39;
      }
      unint64_t v24 = *(void *)(v22 + 16);
      unint64_t v23 = *(void *)(v22 + 24);
      if (v24 >= v23 >> 1)
      {
        sub_2286D1B60(v23 > 1, v24 + 1, 1);
        uint64_t v22 = v39;
      }
      *(void *)(v22 + 16) = v24 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v22+ ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ *(void *)(v11 + 72) * v24, v13, v36);
      uint64_t v39 = v22;
      v19 += v35;
      --v17;
    }
    while (v17);
    swift_bridgeObjectRelease();
    uint64_t v14 = v29;
    long long v16 = v30;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v22 = MEMORY[0x263F8EE78];
  }
  void *v16 = v22;
  (*(void (**)(void *, void, uint64_t))(v32 + 104))(v16, *MEMORY[0x263F58C98], v14);
  sub_2286DDAF8();
  swift_allocObject();
  uint64_t v25 = sub_2286DDAE8();
  id v26 = objc_allocWithZone((Class)type metadata accessor for NewsArticleViewController());
  return sub_2286D1DEC(v25, v26);
}

uint64_t _s7NewsKit0A21ArticleViewControllerC11identifiersACSaySSG_tcfC_0(uint64_t a1)
{
  sub_2286D2BE0(0, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v37 = (char *)&v25 - v3;
  uint64_t v36 = sub_2286DDA78();
  uint64_t v4 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  unint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_2286DDA98();
  uint64_t v7 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2286DDAA8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  id v13 = (uint64_t *)((char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  int64_t v14 = *(void *)(a1 + 16);
  if (v14)
  {
    uint64_t v26 = v11;
    uint64_t v27 = v10;
    uint64_t v28 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v38 = MEMORY[0x263F8EE78];
    sub_2286D1B60(0, v14, 0);
    uint64_t v15 = v38;
    uint64_t v34 = sub_2286DD7E8();
    uint64_t v16 = *(void *)(v34 - 8);
    int64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56);
    uint64_t v32 = v16 + 56;
    uint64_t v33 = v17;
    unsigned int v31 = *MEMORY[0x263F58C60];
    uint64_t v18 = (void (**)(char *, void, uint64_t))(v4 + 104);
    uint64_t v29 = a1;
    uint64_t v30 = v7 + 32;
    uint64_t v19 = a1 + 40;
    do
    {
      v33(v37, 1, 1, v34);
      swift_bridgeObjectRetain_n();
      sub_2286DDA38();
      (*v18)(v6, v31, v36);
      sub_2286DDA88();
      swift_bridgeObjectRelease();
      uint64_t v38 = v15;
      unint64_t v21 = *(void *)(v15 + 16);
      unint64_t v20 = *(void *)(v15 + 24);
      if (v21 >= v20 >> 1)
      {
        sub_2286D1B60(v20 > 1, v21 + 1, 1);
        uint64_t v15 = v38;
      }
      v19 += 16;
      *(void *)(v15 + 16) = v21 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v15+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v21, v9, v35);
      --v14;
    }
    while (v14);
    swift_bridgeObjectRelease();
    uint64_t v10 = v27;
    id v13 = v28;
    uint64_t v11 = v26;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v15 = MEMORY[0x263F8EE78];
  }
  void *v13 = v15;
  (*(void (**)(void *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x263F58C98], v10);
  sub_2286DDAF8();
  swift_allocObject();
  uint64_t v22 = sub_2286DDAE8();
  id v23 = objc_allocWithZone((Class)type metadata accessor for NewsArticleViewController());
  return sub_2286D1DEC(v22, v23);
}

uint64_t type metadata accessor for NewsArticleViewController()
{
  return self;
}

uint64_t method lookup function for NewsArticleViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for NewsArticleViewController);
}

uint64_t sub_2286D2A88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NewsArticle();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2286D2AEC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for NewsArticle();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2286D2B48()
{
  unint64_t result = qword_26825A068;
  if (!qword_26825A068)
  {
    sub_2286DDE98();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26825A068);
  }
  return result;
}

uint64_t sub_2286D2BA0()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_2286D2BD8(void *a1)
{
  return sub_2286D1460(a1);
}

void sub_2286D2BE0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_2286D2C44(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v61 = a2;
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_2286D7C64(0, &qword_26AD8C430, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v59 = (char *)&v56 - v7;
  uint64_t v60 = sub_2286DD828();
  uint64_t v8 = *(void *)(v60 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v60);
  unint64_t v57 = (char *)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v58 = (char *)&v56 - v11;
  sub_2286D7C64(0, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8], v5);
  MEMORY[0x270FA5388](v12 - 8);
  int64_t v14 = (char *)&v56 - v13;
  uint64_t v63 = type metadata accessor for NewsArticle();
  uint64_t v15 = (char *)a3 + *(int *)(v63 + 24);
  uint64_t v16 = sub_2286DD7E8();
  int64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  *(void *)&long long v62 = v15;
  v17(v15, 1, 1, v16);
  id v18 = objc_msgSend(a1, sel_identifier);
  uint64_t v19 = sub_2286DE178();
  uint64_t v21 = v20;

  *a3 = v19;
  a3[1] = v21;
  id v64 = a1;
  id v22 = objc_msgSend(a1, sel_title);
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = sub_2286DE178();
    unint64_t v26 = v25;
  }
  else
  {
    uint64_t v24 = 0;
    unint64_t v26 = 0xE000000000000000;
  }
  a3[2] = v24;
  a3[3] = v26;
  id v27 = v64;
  id v28 = objc_msgSend(v64, sel_thumbnail);
  if (v28)
  {
    uint64_t v29 = v28;
    id v30 = objc_msgSend(v28, sel_thumbnailAssetHandle);

    if (!v30)
    {
      __break(1u);
      return;
    }
    id v31 = objc_msgSend(v30, sel_remoteURL);

    sub_2286DD7D8();
    uint64_t v32 = 0;
  }
  else
  {
    uint64_t v32 = 1;
  }
  v17(v14, v32, 1, v16);
  sub_2286D35CC((uint64_t)v14, v62);
  id v33 = objc_msgSend(v27, sel_publishDate);
  if (!v33)
  {
    uint64_t v38 = (uint64_t)v59;
    uint64_t v37 = v60;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v59, 1, 1, v60);
    uint64_t v40 = v61;
    uint64_t v41 = v63;
    uint64_t v42 = v58;
    goto LABEL_12;
  }
  uint64_t v34 = v33;
  uint64_t v35 = v57;
  sub_2286DD808();

  uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  uint64_t v38 = (uint64_t)v59;
  uint64_t v37 = v60;
  v36(v59, v35, v60);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v8 + 56))(v38, 0, 1, v37);
  int v39 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v38, 1, v37);
  uint64_t v40 = v61;
  uint64_t v41 = v63;
  uint64_t v42 = v58;
  if (v39 == 1)
  {
LABEL_12:
    sub_2286DD818();
    sub_2286D7BA8(v38, &qword_26AD8C430, MEMORY[0x263F07490]);
    uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    goto LABEL_13;
  }
  v36(v58, (char *)v38, v37);
LABEL_13:
  v36((char *)a3 + *(int *)(v41 + 28), v42, v37);
  sub_2286D7C18(0, (unint64_t *)&qword_26AD8C670, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8E0F8]);
  uint64_t v43 = swift_allocObject();
  long long v62 = xmmword_2286DFCC0;
  *(_OWORD *)(v43 + 16) = xmmword_2286DFCC0;
  uint64_t v45 = *a3;
  uint64_t v44 = a3[1];
  *(void *)(v43 + 56) = MEMORY[0x263F8D310];
  *(void *)(v43 + 32) = v45;
  *(void *)(v43 + 40) = v44;
  swift_bridgeObjectRetain();
  uint64_t v46 = (void *)sub_2286DE1A8();
  swift_bridgeObjectRelease();
  sub_2286D7C64(0, &qword_26AD8C650, MEMORY[0x263F06338], MEMORY[0x263F8E0F8]);
  sub_2286DD7A8();
  *(_OWORD *)(swift_allocObject() + 16) = v62;
  id v47 = objc_msgSend(self, sel_mainBundle);
  id v48 = objc_msgSend(v47, sel_bundleIdentifier);

  if (v48)
  {
    sub_2286DE178();
  }
  uint64_t v49 = self;
  sub_2286DD798();
  swift_bridgeObjectRelease();
  id v50 = (void *)sub_2286DE1A8();
  swift_bridgeObjectRelease();
  id v51 = objc_msgSend(v49, sel_nss_NewsURLWithPathComponents_queryItems_internal_, v46, v50, 0);

  uint64_t v52 = v63;
  sub_2286DD7D8();

  sub_2286D38A4(v40, (uint64_t)a3 + *(int *)(v52 + 36), (uint64_t (*)(void))type metadata accessor for NewsChannel);
  id v53 = objc_msgSend(v64, sel_authors);
  if (v53)
  {
    uint64_t v54 = v53;
    uint64_t v55 = sub_2286DE1B8();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    uint64_t v55 = MEMORY[0x263F8EE78];
  }
  sub_2286D48A4(v40, (uint64_t (*)(void))type metadata accessor for NewsChannel);
  *(uint64_t *)((char *)a3 + *(int *)(v52 + 40)) = v55;
}

uint64_t NewsArticle.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t NewsArticle.title.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t NewsArticle.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*NewsArticle.title.modify())()
{
  return nullsub_1;
}

uint64_t NewsArticle.thumbnailURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for NewsArticle() + 24);

  return sub_2286D34F4(v3, a1);
}

uint64_t type metadata accessor for NewsArticle()
{
  uint64_t result = qword_26AD8C4D0;
  if (!qword_26AD8C4D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2286D34F4(uint64_t a1, uint64_t a2)
{
  sub_2286D7C64(0, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t NewsArticle.thumbnailURL.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for NewsArticle() + 24);

  return sub_2286D35CC(a1, v3);
}

uint64_t sub_2286D35CC(uint64_t a1, uint64_t a2)
{
  sub_2286D7C64(0, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*NewsArticle.thumbnailURL.modify())()
{
  return nullsub_1;
}

uint64_t NewsArticle.publishDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for NewsArticle() + 28);
  uint64_t v4 = sub_2286DD828();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t NewsArticle.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for NewsArticle() + 32);
  uint64_t v4 = sub_2286DD7E8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t NewsArticle.url.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for NewsArticle() + 32);
  uint64_t v4 = sub_2286DD7E8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);

  return v5(v3, a1, v4);
}

uint64_t (*NewsArticle.url.modify())()
{
  return nullsub_1;
}

uint64_t NewsArticle.channel.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for NewsArticle();
  return sub_2286D38A4(v1 + *(int *)(v3 + 36), a1, (uint64_t (*)(void))type metadata accessor for NewsChannel);
}

uint64_t sub_2286D38A4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t NewsArticle.channel.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for NewsArticle() + 36);

  return sub_2286D3950(a1, v3);
}

uint64_t sub_2286D3950(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NewsChannel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*NewsArticle.channel.modify())()
{
  return nullsub_1;
}

uint64_t NewsArticle.authors.getter()
{
  type metadata accessor for NewsArticle();

  return swift_bridgeObjectRetain();
}

uint64_t NewsArticle.authors.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for NewsArticle() + 40);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*NewsArticle.authors.modify())()
{
  return nullsub_1;
}

uint64_t sub_2286D3AB8(char a1)
{
  return qword_2286DFEF0[a1];
}

uint64_t sub_2286D3AD8()
{
  return sub_2286D3AB8(*v0);
}

uint64_t sub_2286D3AE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2286D7824(a1, a2);
  *a3 = result;
  return result;
}

void sub_2286D3B08(unsigned char *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_2286D3B14(uint64_t a1)
{
  unint64_t v2 = sub_2286D3F4C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2286D3B50(uint64_t a1)
{
  unint64_t v2 = sub_2286D3F4C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t NewsArticle.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  sub_2286D4840(0, &qword_26825A080, MEMORY[0x263F8E0C0]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v12 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2286D3F4C();
  sub_2286DE478();
  char v19 = 0;
  sub_2286DE398();
  if (!v2)
  {
    char v18 = 1;
    sub_2286DE398();
    uint64_t v10 = type metadata accessor for NewsArticle();
    char v17 = 2;
    sub_2286DD7E8();
    sub_2286D7B60(&qword_26825A090, MEMORY[0x263F06EA8]);
    sub_2286DE388();
    v12[0] = v3 + *(int *)(v10 + 28);
    char v16 = 3;
    sub_2286DD828();
    sub_2286D7B60(&qword_26825A098, MEMORY[0x263F07490]);
    sub_2286DE3B8();
    char v15 = 4;
    sub_2286DE3B8();
    char v14 = 5;
    type metadata accessor for NewsChannel();
    sub_2286D7B60(&qword_26825A0A0, (void (*)(uint64_t))type metadata accessor for NewsChannel);
    sub_2286DE3B8();
    v12[1] = *(void *)(v3 + *(int *)(v10 + 40));
    char v13 = 6;
    sub_2286D7C18(0, &qword_26825A0A8, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
    sub_2286D4968(&qword_26825A0B0);
    sub_2286DE3B8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

unint64_t sub_2286D3F4C()
{
  unint64_t result = qword_26825A088;
  if (!qword_26825A088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26825A088);
  }
  return result;
}

uint64_t NewsArticle.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v40 = a2;
  uint64_t v47 = type metadata accessor for NewsChannel();
  MEMORY[0x270FA5388](v47);
  uint64_t v41 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2286DD7E8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2286DD828();
  uint64_t v43 = *(void *)(v8 - 8);
  uint64_t v44 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2286D7C64(0, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v11 - 8);
  char v13 = (char *)&v39 - v12;
  sub_2286D4840(0, &qword_26825A0B8, MEMORY[0x263F8E040]);
  uint64_t v48 = v14;
  uint64_t v46 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  char v16 = (char *)&v39 - v15;
  uint64_t v17 = type metadata accessor for NewsArticle();
  uint64_t v50 = MEMORY[0x270FA5388](v17);
  char v19 = (uint64_t *)((char *)&v39 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v20 = (char *)v19 + *(int *)(v50 + 24);
  uint64_t v42 = v5;
  uint64_t v21 = *(void (**)(void))(v5 + 56);
  uint64_t v53 = (uint64_t)v20;
  uint64_t v45 = v4;
  v21();
  uint64_t v22 = a1[3];
  id v51 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v22);
  sub_2286D3F4C();
  uint64_t v49 = v16;
  id v23 = v52;
  sub_2286DE468();
  if (v23)
  {
    uint64_t v24 = v53;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
    return sub_2286D7BA8(v24, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8]);
  }
  else
  {
    uint64_t v52 = v7;
    char v61 = 0;
    uint64_t *v19 = sub_2286DE358();
    v19[1] = v26;
    char v60 = 1;
    uint64_t v27 = sub_2286DE358();
    uint64_t v28 = v53;
    v19[2] = v27;
    v19[3] = v29;
    char v59 = 2;
    uint64_t v30 = sub_2286D7B60(&qword_26825A0C0, MEMORY[0x263F06EA8]);
    sub_2286DE348();
    uint64_t v39 = v30;
    sub_2286D35CC((uint64_t)v13, v28);
    char v58 = 3;
    sub_2286D7B60(&qword_26825A0C8, MEMORY[0x263F07490]);
    id v31 = v10;
    uint64_t v32 = v44;
    sub_2286DE378();
    id v33 = v31;
    uint64_t v34 = (int *)v50;
    (*(void (**)(char *, char *, uint64_t))(v43 + 32))((char *)v19 + *(int *)(v50 + 28), v33, v32);
    char v57 = 4;
    uint64_t v35 = v52;
    uint64_t v36 = v45;
    sub_2286DE378();
    (*(void (**)(char *, char *, uint64_t))(v42 + 32))((char *)v19 + v34[8], v35, v36);
    char v56 = 5;
    sub_2286D7B60(&qword_26825A0D0, (void (*)(uint64_t))type metadata accessor for NewsChannel);
    uint64_t v37 = (uint64_t)v41;
    sub_2286DE378();
    uint64_t v38 = v46;
    sub_2286D4904(v37, (uint64_t)v19 + v34[9]);
    sub_2286D7C18(0, &qword_26825A0A8, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
    char v55 = 6;
    sub_2286D4968(&qword_26825A0D8);
    sub_2286DE378();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v49, v48);
    *(uint64_t *)((char *)v19 + v34[10]) = v54;
    sub_2286D38A4((uint64_t)v19, v40, (uint64_t (*)(void))type metadata accessor for NewsArticle);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
    return sub_2286D48A4((uint64_t)v19, (uint64_t (*)(void))type metadata accessor for NewsArticle);
  }
}

void sub_2286D4840(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_2286D3F4C();
    unint64_t v7 = a3(a1, &type metadata for NewsArticle.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_2286D48A4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2286D4904(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NewsChannel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2286D4968(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2286D7C18(255, &qword_26825A0A8, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2286D49EC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return NewsArticle.init(from:)(a1, a2);
}

uint64_t sub_2286D4A04(void *a1)
{
  return NewsArticle.encode(to:)(a1);
}

uint64_t sub_2286D4A20(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = sub_2286DE3D8(), uint64_t result = 0, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1;
    }
    uint64_t v9 = a1 + 7;
    for (i = a2 + 7; ; i += 2)
    {
      BOOL v11 = *(v9 - 1) == *(i - 1) && *v9 == *i;
      if (!v11 && (sub_2286DE3D8() & 1) == 0) {
        break;
      }
      v9 += 2;
      if (!--v8) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t _s7NewsKit0A7ArticleV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v4 = sub_2286DD7E8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = &v35[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2286D7ACC();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v8);
  BOOL v11 = &v35[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2286D7C64(0, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v15 = &v35[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = &v35[-v17];
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = &v35[-v19];
  if (*a1 == *a2 && a1[1] == a2[1] || (char v21 = sub_2286DE3D8(), v22 = 0, (v21 & 1) != 0))
  {
    if (a1[2] == a2[2] && a1[3] == a2[3] || (v23 = sub_2286DE3D8(), char v22 = 0, (v23 & 1) != 0))
    {
      uint64_t v39 = v15;
      uint64_t v37 = v7;
      uint64_t v24 = type metadata accessor for NewsArticle();
      sub_2286D34F4((uint64_t)a1 + *(int *)(v24 + 24), (uint64_t)v20);
      uint64_t v38 = (int *)v24;
      sub_2286D34F4((uint64_t)a2 + *(int *)(v24 + 24), (uint64_t)v18);
      uint64_t v25 = (uint64_t)&v11[*(int *)(v9 + 48)];
      sub_2286D34F4((uint64_t)v20, (uint64_t)v11);
      sub_2286D34F4((uint64_t)v18, v25);
      uint64_t v26 = v4;
      uint64_t v27 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
      if (v27((uint64_t)v11, 1, v26) == 1)
      {
        uint64_t v28 = (uint64_t (*)(uint64_t))MEMORY[0x263F06EA8];
        sub_2286D7BA8((uint64_t)v18, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8]);
        sub_2286D7BA8((uint64_t)v20, (unint64_t *)&qword_26AD8C680, v28);
        if (v27(v25, 1, v26) == 1)
        {
          sub_2286D7BA8((uint64_t)v11, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8]);
LABEL_14:
          id v33 = v38;
          if ((sub_2286DD7F8() & 1) != 0
            && (MEMORY[0x22A697BB0]((char *)a1 + v33[8], (char *)a2 + v33[8]) & 1) != 0
            && _s7NewsKit0A7ChannelV2eeoiySbAC_ACtFZ_0((void *)((char *)a1 + v33[9]), (void *)((char *)a2 + v33[9])))
          {
            char v22 = sub_2286D4A20(*(void **)((char *)a1 + v33[10]), *(void **)((char *)a2 + v33[10]));
            return v22 & 1;
          }
LABEL_18:
          char v22 = 0;
          return v22 & 1;
        }
      }
      else
      {
        sub_2286D34F4((uint64_t)v11, (uint64_t)v39);
        if (v27(v25, 1, v26) != 1)
        {
          uint64_t v30 = v37;
          (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 32))(v37, v25, v26);
          sub_2286D7B60((unint64_t *)&unk_26825A100, MEMORY[0x263F06EA8]);
          int v36 = sub_2286DE138();
          id v31 = *(void (**)(unsigned char *, uint64_t))(v5 + 8);
          v31(v30, v26);
          uint64_t v32 = (uint64_t (*)(uint64_t))MEMORY[0x263F06EA8];
          sub_2286D7BA8((uint64_t)v18, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8]);
          sub_2286D7BA8((uint64_t)v20, (unint64_t *)&qword_26AD8C680, v32);
          v31(v39, v26);
          sub_2286D7BA8((uint64_t)v11, (unint64_t *)&qword_26AD8C680, v32);
          if ((v36 & 1) == 0) {
            goto LABEL_18;
          }
          goto LABEL_14;
        }
        uint64_t v29 = (uint64_t (*)(uint64_t))MEMORY[0x263F06EA8];
        sub_2286D7BA8((uint64_t)v18, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8]);
        sub_2286D7BA8((uint64_t)v20, (unint64_t *)&qword_26AD8C680, v29);
        (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v39, v26);
      }
      sub_2286D48A4((uint64_t)v11, (uint64_t (*)(void))sub_2286D7ACC);
      goto LABEL_18;
    }
  }
  return v22 & 1;
}

char *initializeBufferWithCopyOfBuffer for NewsArticle(char *a1, char *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *(void *)a2;
    *(void *)uint64_t v4 = *(void *)a2;
    uint64_t v4 = (char *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = *((void *)a2 + 1);
    *(void *)a1 = *(void *)a2;
    *((void *)a1 + 1) = v7;
    uint64_t v8 = *((void *)a2 + 3);
    *((void *)a1 + 2) = *((void *)a2 + 2);
    *((void *)a1 + 3) = v8;
    uint64_t v9 = a3[6];
    __dst = &a1[v9];
    uint64_t v10 = &a2[v9];
    uint64_t v11 = sub_2286DD7E8();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    char v58 = v13;
    if (v13(v10, 1, v11))
    {
      sub_2286D7C64(0, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
      memcpy(__dst, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(__dst, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
    }
    uint64_t v16 = a3[7];
    uint64_t v17 = &v4[v16];
    uint64_t v18 = &a2[v16];
    uint64_t v19 = sub_2286DD828();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
    uint64_t v50 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
    v50(&v4[a3[8]], &a2[a3[8]], v11);
    char v55 = a3;
    uint64_t v20 = a3[9];
    char v21 = &v4[v20];
    uint64_t v52 = a2;
    char v22 = &a2[v20];
    uint64_t v23 = *(void *)&a2[v20 + 8];
    *(void *)char v21 = *(void *)&a2[v20];
    *((void *)v21 + 1) = v23;
    uint64_t v24 = *(void *)&a2[v20 + 24];
    *((void *)v21 + 2) = *(void *)&a2[v20 + 16];
    *((void *)v21 + 3) = v24;
    uint64_t v53 = type metadata accessor for NewsChannel();
    uint64_t v54 = v22;
    uint64_t v25 = *(int *)(v53 + 24);
    id v51 = v21;
    uint64_t v26 = &v21[v25];
    uint64_t v27 = &v22[v25];
    *(void *)uint64_t v26 = *(void *)v27;
    __dsta = (int *)type metadata accessor for NewsChannelLogoCollection();
    uint64_t v28 = __dsta[5];
    uint64_t v29 = &v26[v28];
    uint64_t v30 = &v27[v28];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v58(v30, 1, v11))
    {
      sub_2286D7C64(0, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
      memcpy(v29, v30, *(void *)(*(void *)(v31 - 8) + 64));
      uint64_t v32 = v12;
      id v33 = v50;
    }
    else
    {
      id v33 = v50;
      v50(v29, v30, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v29, 0, 1, v11);
      uint64_t v32 = v12;
    }
    uint64_t v34 = __dsta[6];
    uint64_t v35 = &v26[v34];
    int v36 = &v27[v34];
    if (v58(&v27[v34], 1, v11))
    {
      sub_2286D7C64(0, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
      memcpy(v35, v36, *(void *)(*(void *)(v37 - 8) + 64));
    }
    else
    {
      v33(v35, v36, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v35, 0, 1, v11);
    }
    uint64_t v38 = __dsta[7];
    uint64_t v39 = &v26[v38];
    uint64_t v40 = &v27[v38];
    if (v58(&v27[v38], 1, v11))
    {
      sub_2286D7C64(0, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
      memcpy(v39, v40, *(void *)(*(void *)(v41 - 8) + 64));
    }
    else
    {
      v33(v39, v40, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v39, 0, 1, v11);
    }
    uint64_t v42 = *(int *)(v53 + 28);
    uint64_t v43 = (void *)((char *)v51 + v42);
    uint64_t v44 = &v54[v42];
    uint64_t v45 = *(void **)&v54[v42];
    if (v45)
    {
      uint64_t v46 = (void *)*((void *)v44 + 1);
      *uint64_t v43 = v45;
      v43[1] = v46;
      id v47 = v45;
      id v48 = v46;
    }
    else
    {
      *(_OWORD *)uint64_t v43 = *(_OWORD *)v44;
    }
    *(void *)&v4[v55[10]] = *(void *)((char *)v52 + v55[10]);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for NewsArticle(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[6];
  uint64_t v5 = sub_2286DD7E8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v7(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  uint64_t v8 = a1 + a2[7];
  uint64_t v9 = sub_2286DD828();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v19(a1 + a2[8], v5);
  uint64_t v10 = a1 + a2[9];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v11 = type metadata accessor for NewsChannel();
  uint64_t v12 = v10 + *(int *)(v11 + 24);
  uint64_t v13 = (int *)type metadata accessor for NewsChannelLogoCollection();
  uint64_t v14 = v12 + v13[5];
  if (!v7(v14, 1, v5)) {
    v19(v14, v5);
  }
  uint64_t v15 = v12 + v13[6];
  if (!v7(v15, 1, v5)) {
    v19(v15, v5);
  }
  uint64_t v16 = v12 + v13[7];
  if (!v7(v16, 1, v5)) {
    v19(v16, v5);
  }
  uint64_t v17 = (id *)(v10 + *(int *)(v11 + 28));
  if (*v17)
  {
  }

  return swift_bridgeObjectRelease();
}

char *initializeWithCopy for NewsArticle(char *a1, char *a2, int *a3)
{
  uint64_t v5 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v5;
  uint64_t v6 = *((void *)a2 + 3);
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = sub_2286DD7E8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v55 = v12;
  if (v12(v9, 1, v10))
  {
    sub_2286D7C64(0, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v14 = a3[7];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  uint64_t v17 = sub_2286DD828();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v18(&a1[a3[8]], &a2[a3[8]], v10);
  id v51 = a3;
  uint64_t v52 = a2;
  uint64_t v19 = a3[9];
  uint64_t v20 = &a1[v19];
  char v21 = &a2[v19];
  uint64_t v48 = v11;
  uint64_t v22 = *((void *)v21 + 1);
  *(void *)uint64_t v20 = *(void *)v21;
  *((void *)v20 + 1) = v22;
  uint64_t v23 = *((void *)v21 + 3);
  *((void *)v20 + 2) = *((void *)v21 + 2);
  *((void *)v20 + 3) = v23;
  uint64_t v50 = type metadata accessor for NewsChannel();
  uint64_t v24 = *(int *)(v50 + 24);
  uint64_t v25 = &v20[v24];
  uint64_t v49 = v21;
  uint64_t v26 = &v21[v24];
  *(void *)&v20[v24] = *(void *)v26;
  uint64_t v53 = (int *)type metadata accessor for NewsChannelLogoCollection();
  uint64_t v27 = v53[5];
  uint64_t v28 = &v25[v27];
  uint64_t v29 = &v26[v27];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v55(v29, 1, v10))
  {
    sub_2286D7C64(0, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    memcpy(v28, v29, *(void *)(*(void *)(v30 - 8) + 64));
    uint64_t v31 = v48;
  }
  else
  {
    v18(v28, v29, v10);
    uint64_t v31 = v48;
    (*(void (**)(char *, void, uint64_t, uint64_t))(v48 + 56))(v28, 0, 1, v10);
  }
  uint64_t v32 = v53[6];
  id v33 = &v25[v32];
  uint64_t v34 = &v26[v32];
  if (v55(&v26[v32], 1, v10))
  {
    sub_2286D7C64(0, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    memcpy(v33, v34, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    v18(v33, v34, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v33, 0, 1, v10);
  }
  uint64_t v36 = v53[7];
  uint64_t v37 = &v25[v36];
  uint64_t v38 = &v26[v36];
  if (v55(&v26[v36], 1, v10))
  {
    sub_2286D7C64(0, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    memcpy(v37, v38, *(void *)(*(void *)(v39 - 8) + 64));
  }
  else
  {
    v18(v37, v38, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v37, 0, 1, v10);
  }
  uint64_t v40 = *(int *)(v50 + 28);
  uint64_t v41 = &v20[v40];
  uint64_t v42 = (char *)v49 + v40;
  uint64_t v43 = *(void **)((char *)v49 + v40);
  if (v43)
  {
    uint64_t v44 = (void *)*((void *)v42 + 1);
    *(void *)uint64_t v41 = v43;
    *((void *)v41 + 1) = v44;
    id v45 = v43;
    id v46 = v44;
  }
  else
  {
    *(_OWORD *)uint64_t v41 = *(_OWORD *)v42;
  }
  *(void *)&a1[v51[10]] = *(void *)((char *)v52 + v51[10]);
  swift_bridgeObjectRetain();
  return a1;
}

char *assignWithCopy for NewsArticle(char *a1, char *a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = *((void *)a2 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_2286DD7E8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    sub_2286D7C64(0, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = a3[7];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  uint64_t v18 = sub_2286DD828();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 24))(v16, v17, v18);
  uint64_t v63 = v10;
  char v58 = *(void (**)(char *, char *, uint64_t))(v10 + 24);
  v58(&a1[a3[8]], &a2[a3[8]], v9);
  char v61 = a3;
  long long v62 = a2;
  uint64_t v19 = a3[9];
  uint64_t v20 = &a1[v19];
  char v21 = &a2[v19];
  *(void *)uint64_t v20 = *(void *)&a2[v19];
  *((void *)v20 + 1) = *(void *)&a2[v19 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v20 + 2) = *((void *)v21 + 2);
  *((void *)v20 + 3) = *((void *)v21 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v59 = type metadata accessor for NewsChannel();
  char v60 = v21;
  uint64_t v22 = *(int *)(v59 + 24);
  uint64_t v23 = &v20[v22];
  uint64_t v24 = &v21[v22];
  *(void *)&v20[v22] = *(void *)&v21[v22];
  id v64 = (int *)type metadata accessor for NewsChannelLogoCollection();
  uint64_t v25 = v64[5];
  uint64_t v26 = &v23[v25];
  uint64_t v27 = &v24[v25];
  int v28 = v11(&v23[v25], 1, v9);
  int v29 = v11(v27, 1, v9);
  if (v28)
  {
    if (!v29)
    {
      (*(void (**)(char *, char *, uint64_t))(v63 + 16))(v26, v27, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v63 + 56))(v26, 0, 1, v9);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v29)
  {
    (*(void (**)(char *, uint64_t))(v63 + 8))(v26, v9);
LABEL_12:
    sub_2286D7C64(0, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    memcpy(v26, v27, *(void *)(*(void *)(v30 - 8) + 64));
    goto LABEL_13;
  }
  v58(v26, v27, v9);
LABEL_13:
  uint64_t v31 = v64[6];
  uint64_t v32 = &v23[v31];
  id v33 = &v24[v31];
  int v34 = v11(&v23[v31], 1, v9);
  int v35 = v11(v33, 1, v9);
  if (v34)
  {
    if (!v35)
    {
      uint64_t v37 = v63;
      (*(void (**)(char *, char *, uint64_t))(v63 + 16))(v32, v33, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v63 + 56))(v32, 0, 1, v9);
      goto LABEL_23;
    }
    sub_2286D7C64(0, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    memcpy(v32, v33, *(void *)(*(void *)(v36 - 8) + 64));
  }
  else
  {
    if (v35)
    {
      uint64_t v37 = v63;
      (*(void (**)(char *, uint64_t))(v63 + 8))(v32, v9);
      sub_2286D7C64(0, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
      memcpy(v32, v33, *(void *)(*(void *)(v38 - 8) + 64));
      goto LABEL_23;
    }
    v58(v32, v33, v9);
  }
  uint64_t v37 = v63;
LABEL_23:
  uint64_t v39 = v64[7];
  uint64_t v40 = &v23[v39];
  uint64_t v41 = &v24[v39];
  int v42 = v11(v40, 1, v9);
  int v43 = v11(v41, 1, v9);
  if (v42)
  {
    if (!v43)
    {
      (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v40, v41, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v40, 0, 1, v9);
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  if (v43)
  {
    (*(void (**)(char *, uint64_t))(v37 + 8))(v40, v9);
LABEL_28:
    sub_2286D7C64(0, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    memcpy(v40, v41, *(void *)(*(void *)(v44 - 8) + 64));
    goto LABEL_29;
  }
  v58(v40, v41, v9);
LABEL_29:
  uint64_t v45 = *(int *)(v59 + 28);
  id v46 = (void **)&v20[v45];
  id v47 = &v60[v45];
  uint64_t v48 = *v46;
  uint64_t v49 = *(void **)&v60[v45];
  if (!*v46)
  {
    if (v49)
    {
      void *v46 = v49;
      uint64_t v54 = (void *)*((void *)v47 + 1);
      v46[1] = v54;
      id v55 = v49;
      id v56 = v54;
      goto LABEL_36;
    }
LABEL_35:
    *(_OWORD *)id v46 = *(_OWORD *)v47;
    goto LABEL_36;
  }
  if (!v49)
  {
    sub_2286C59C4((uint64_t)v46);
    goto LABEL_35;
  }
  void *v46 = v49;
  id v50 = v49;

  id v51 = (void *)*((void *)v47 + 1);
  uint64_t v52 = v46[1];
  v46[1] = v51;
  id v53 = v51;

LABEL_36:
  *(void *)&a1[v61[10]] = *(void *)((char *)v62 + v61[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for NewsArticle(char *a1, char *a2, int *a3)
{
  long long v6 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = sub_2286DD7E8();
  uint64_t v11 = *(void *)(v10 - 8);
  id v47 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  if (v47(v9, 1, v10))
  {
    sub_2286D7C64(0, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v13 = a3[7];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = sub_2286DD828();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v17(&a1[a3[8]], &a2[a3[8]], v10);
  id v46 = a3;
  uint64_t v18 = a3[9];
  uint64_t v40 = a1;
  uint64_t v19 = &a1[v18];
  uint64_t v44 = a2;
  uint64_t v20 = &a2[v18];
  long long v21 = *((_OWORD *)v20 + 1);
  *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
  *((_OWORD *)v19 + 1) = v21;
  uint64_t v41 = type metadata accessor for NewsChannel();
  int v42 = v20;
  uint64_t v22 = *(int *)(v41 + 24);
  int v43 = v19;
  uint64_t v23 = &v19[v22];
  uint64_t v24 = &v20[v22];
  *(void *)uint64_t v23 = *(void *)&v20[v22];
  uint64_t v25 = (int *)type metadata accessor for NewsChannelLogoCollection();
  uint64_t v26 = v25[5];
  uint64_t v27 = &v23[v26];
  int v28 = &v24[v26];
  uint64_t v45 = v11;
  if (v47(&v24[v26], 1, v10))
  {
    sub_2286D7C64(0, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    memcpy(v27, v28, *(void *)(*(void *)(v29 - 8) + 64));
  }
  else
  {
    v17(v27, v28, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v27, 0, 1, v10);
  }
  uint64_t v30 = v25[6];
  uint64_t v31 = &v23[v30];
  uint64_t v32 = &v24[v30];
  if (v47(&v24[v30], 1, v10))
  {
    sub_2286D7C64(0, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    memcpy(v31, v32, *(void *)(*(void *)(v33 - 8) + 64));
    uint64_t v34 = v45;
  }
  else
  {
    v17(v31, v32, v10);
    uint64_t v34 = v45;
    (*(void (**)(char *, void, uint64_t, uint64_t))(v45 + 56))(v31, 0, 1, v10);
  }
  uint64_t v35 = v25[7];
  uint64_t v36 = &v23[v35];
  uint64_t v37 = &v24[v35];
  if (v47(&v24[v35], 1, v10))
  {
    sub_2286D7C64(0, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    memcpy(v36, v37, *(void *)(*(void *)(v38 - 8) + 64));
  }
  else
  {
    v17(v36, v37, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v36, 0, 1, v10);
  }
  *(_OWORD *)((char *)v43 + *(int *)(v41 + 28)) = *(_OWORD *)((char *)v42 + *(int *)(v41 + 28));
  uint64_t result = v40;
  *(void *)((char *)v40 + v46[10]) = *(void *)((char *)v44 + v46[10]);
  return result;
}

char *assignWithTake for NewsArticle(char *a1, char *a2, int *a3)
{
  uint64_t v6 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *((void *)a2 + 3);
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a3[6];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_2286DD7E8();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v15)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
LABEL_6:
    sub_2286D7C64(0, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 40))(v9, v10, v11);
LABEL_7:
  uint64_t v17 = a3[7];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  uint64_t v20 = sub_2286DD828();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 40))(v18, v19, v20);
  uint64_t v60 = v12;
  id v55 = *(void (**)(char *, char *, uint64_t))(v12 + 40);
  v55(&a1[a3[8]], &a2[a3[8]], v11);
  char v58 = a3;
  uint64_t v59 = a2;
  uint64_t v21 = a3[9];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = &a2[v21];
  uint64_t v24 = *(void *)&a2[v21 + 8];
  *(void *)uint64_t v22 = *(void *)&a2[v21];
  *((void *)v22 + 1) = v24;
  swift_bridgeObjectRelease();
  uint64_t v25 = *((void *)v23 + 3);
  *((void *)v22 + 2) = *((void *)v23 + 2);
  *((void *)v22 + 3) = v25;
  swift_bridgeObjectRelease();
  uint64_t v56 = type metadata accessor for NewsChannel();
  char v57 = v23;
  uint64_t v26 = *(int *)(v56 + 24);
  uint64_t v27 = &v22[v26];
  int v28 = &v23[v26];
  *(void *)&v22[v26] = *(void *)v28;
  char v61 = (int *)type metadata accessor for NewsChannelLogoCollection();
  uint64_t v29 = v61[5];
  uint64_t v30 = &v27[v29];
  uint64_t v31 = &v28[v29];
  int v32 = v13(&v27[v29], 1, v11);
  int v33 = v13(v31, 1, v11);
  if (v32)
  {
    if (!v33)
    {
      (*(void (**)(char *, char *, uint64_t))(v60 + 32))(v30, v31, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v60 + 56))(v30, 0, 1, v11);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v33)
  {
    (*(void (**)(char *, uint64_t))(v60 + 8))(v30, v11);
LABEL_12:
    sub_2286D7C64(0, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    memcpy(v30, v31, *(void *)(*(void *)(v34 - 8) + 64));
    goto LABEL_13;
  }
  v55(v30, v31, v11);
LABEL_13:
  uint64_t v35 = v61[6];
  uint64_t v36 = &v27[v35];
  uint64_t v37 = &v28[v35];
  int v38 = v13(&v27[v35], 1, v11);
  int v39 = v13(v37, 1, v11);
  if (v38)
  {
    if (!v39)
    {
      uint64_t v41 = v60;
      (*(void (**)(char *, char *, uint64_t))(v60 + 32))(v36, v37, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v60 + 56))(v36, 0, 1, v11);
      goto LABEL_23;
    }
    sub_2286D7C64(0, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    memcpy(v36, v37, *(void *)(*(void *)(v40 - 8) + 64));
  }
  else
  {
    if (v39)
    {
      uint64_t v41 = v60;
      (*(void (**)(char *, uint64_t))(v60 + 8))(v36, v11);
      sub_2286D7C64(0, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
      memcpy(v36, v37, *(void *)(*(void *)(v42 - 8) + 64));
      goto LABEL_23;
    }
    v55(v36, v37, v11);
  }
  uint64_t v41 = v60;
LABEL_23:
  uint64_t v43 = v61[7];
  uint64_t v44 = &v27[v43];
  uint64_t v45 = &v28[v43];
  int v46 = v13(v44, 1, v11);
  int v47 = v13(v45, 1, v11);
  if (v46)
  {
    if (!v47)
    {
      (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v44, v45, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v41 + 56))(v44, 0, 1, v11);
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  if (v47)
  {
    (*(void (**)(char *, uint64_t))(v41 + 8))(v44, v11);
LABEL_28:
    sub_2286D7C64(0, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    memcpy(v44, v45, *(void *)(*(void *)(v48 - 8) + 64));
    goto LABEL_29;
  }
  v55(v44, v45, v11);
LABEL_29:
  uint64_t v49 = *(int *)(v56 + 28);
  id v50 = (void **)&v22[v49];
  id v51 = &v57[v49];
  uint64_t v52 = *v50;
  if (!*v50)
  {
LABEL_33:
    *(_OWORD *)id v50 = *(_OWORD *)v51;
    goto LABEL_34;
  }
  if (!*(void *)v51)
  {
    sub_2286C59C4((uint64_t)v50);
    goto LABEL_33;
  }
  *id v50 = *(void **)v51;

  id v53 = v50[1];
  v50[1] = (void *)*((void *)v51 + 1);

LABEL_34:
  *(void *)&a1[v58[10]] = *(void *)((char *)v59 + v58[10]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NewsArticle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2286D7004);
}

uint64_t sub_2286D7004(uint64_t a1, uint64_t a2, int *a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  sub_2286D7C64(0, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a2)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a3[6];
LABEL_11:
    int v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    return v14(a1 + v11, a2, v9);
  }
  uint64_t v12 = sub_2286DD828();
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a3[7];
    goto LABEL_11;
  }
  uint64_t v13 = sub_2286DD7E8();
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a2)
  {
    uint64_t v9 = v13;
    uint64_t v10 = *(void *)(v13 - 8);
    uint64_t v11 = a3[8];
    goto LABEL_11;
  }
  uint64_t v15 = type metadata accessor for NewsChannel();
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
  uint64_t v17 = v15;
  uint64_t v18 = a1 + a3[9];

  return v16(v18, a2, v17);
}

uint64_t storeEnumTagSinglePayload for NewsArticle(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2286D720C);
}

uint64_t sub_2286D720C(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
    return result;
  }
  sub_2286D7C64(0, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[6];
LABEL_9:
    int v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return v14(v5 + v11, a2, a2, v9);
  }
  uint64_t v12 = sub_2286DD828();
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[7];
    goto LABEL_9;
  }
  uint64_t v13 = sub_2286DD7E8();
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v9 = v13;
    uint64_t v10 = *(void *)(v13 - 8);
    uint64_t v11 = a4[8];
    goto LABEL_9;
  }
  uint64_t v15 = type metadata accessor for NewsChannel();
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v17 = v15;
  uint64_t v18 = v5 + a4[9];

  return v16(v18, a2, a2, v17);
}

void sub_2286D7400()
{
  sub_2286D7C64(319, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  if (v0 <= 0x3F)
  {
    sub_2286DD828();
    if (v1 <= 0x3F)
    {
      sub_2286DD7E8();
      if (v2 <= 0x3F)
      {
        type metadata accessor for NewsChannel();
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

uint64_t getEnumTagSinglePayload for NewsArticle.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for NewsArticle.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x2286D76E4);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NewsArticle.CodingKeys()
{
  return &type metadata for NewsArticle.CodingKeys;
}

unint64_t sub_2286D7720()
{
  unint64_t result = qword_26825A0E0;
  if (!qword_26825A0E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26825A0E0);
  }
  return result;
}

unint64_t sub_2286D7778()
{
  unint64_t result = qword_26825A0E8;
  if (!qword_26825A0E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26825A0E8);
  }
  return result;
}

unint64_t sub_2286D77D0()
{
  unint64_t result = qword_26825A0F0;
  if (!qword_26825A0F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26825A0F0);
  }
  return result;
}

uint64_t sub_2286D7824(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_2286DE3D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000 || (sub_2286DE3D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x69616E626D756874 && a2 == 0xEC0000004C52556CLL || (sub_2286DE3D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x446873696C627570 && a2 == 0xEB00000000657461 || (sub_2286DE3D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 7107189 && a2 == 0xE300000000000000 || (sub_2286DE3D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6C656E6E616863 && a2 == 0xE700000000000000 || (sub_2286DE3D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x73726F68747561 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    char v6 = sub_2286DE3D8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 6;
    }
    else {
      return 7;
    }
  }
}

void sub_2286D7ACC()
{
  if (!qword_26825A0F8)
  {
    sub_2286D7C64(255, (unint64_t *)&qword_26AD8C680, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_26825A0F8);
    }
  }
}

uint64_t sub_2286D7B60(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2286D7BA8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_2286D7C64(0, a2, a3, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

void sub_2286D7C18(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_2286D7C64(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_2286D7CC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2286DD7E8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2286DDA58();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2286DDA18();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  int v14 = (void **)((char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(void **, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  int v15 = (*(uint64_t (**)(void **, uint64_t))(v12 + 88))(v14, v11);
  if (v15 == *MEMORY[0x263F589C0])
  {
    (*(void (**)(void **, uint64_t))(v12 + 96))(v14, v11);
    uint64_t v16 = *v14;
    uint64_t v17 = self;
    sub_2286D85EC();
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_2286DFCC0;
    id v19 = objc_msgSend(v16, sel_identifier);
    uint64_t v20 = sub_2286DE178();
    uint64_t v22 = v21;

    *(void *)(v18 + 56) = MEMORY[0x263F8D310];
    *(void *)(v18 + 32) = v20;
    *(void *)(v18 + 40) = v22;
    uint64_t v23 = (void *)sub_2286DE1A8();
    swift_bridgeObjectRelease();
    id v24 = objc_msgSend(v17, sel_nss_NewsURLWithPathComponents_internal_, v23, 0);

    sub_2286DD7D8();
    swift_unknownObjectRelease();
  }
  else
  {
    if (v15 == *MEMORY[0x263F589B8])
    {
      (*(void (**)(void **, uint64_t))(v12 + 96))(v14, v11);
      uint64_t v25 = *v14;
      sub_2286D870C();
      uint64_t v52 = (char *)v14 + *(int *)(v26 + 48);
      uint64_t v27 = (uint64_t)v14 + *(int *)(v26 + 64);
      swift_unknownObjectRelease();
      int v28 = self;
      sub_2286D85EC();
      uint64_t v29 = swift_allocObject();
      *(_OWORD *)(v29 + 16) = xmmword_2286DFCC0;
      id v30 = objc_msgSend(v25, sel_identifier);
      uint64_t v31 = a2;
      uint64_t v32 = sub_2286DE178();
      uint64_t v34 = v33;

      *(void *)(v29 + 56) = MEMORY[0x263F8D310];
      *(void *)(v29 + 32) = v32;
      *(void *)(v29 + 40) = v34;
      uint64_t v35 = (void *)sub_2286DE1A8();
      swift_bridgeObjectRelease();
      id v36 = objc_msgSend(v28, sel_nss_NewsURLWithPathComponents_internal_, v35, 0);

      sub_2286DD7D8();
      swift_unknownObjectRelease();

      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(v31, 0, 1, v4);
      __swift_destroy_boxed_opaque_existential_1(v27);
      uint64_t v37 = sub_2286DDAB8();
      return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v37 - 8) + 8))(v52, v37);
    }
    if (v15 == *MEMORY[0x263F589A8])
    {
      (*(void (**)(void **, uint64_t))(v12 + 96))(v14, v11);
      sub_2286D8648((uint64_t)v14, (uint64_t)v10);
      int v39 = self;
      sub_2286D85EC();
      uint64_t v40 = swift_allocObject();
      *(_OWORD *)(v40 + 16) = xmmword_2286DFCC0;
      uint64_t v41 = sub_2286DDA48();
      *(void *)(v40 + 56) = MEMORY[0x263F8D310];
      *(void *)(v40 + 32) = v41;
      *(void *)(v40 + 40) = v42;
      uint64_t v43 = (void *)sub_2286DE1A8();
      swift_bridgeObjectRelease();
      id v44 = objc_msgSend(v39, sel_nss_NewsURLWithPathComponents_internal_, v43, 0);

      sub_2286DD7D8();
      sub_2286D86AC((uint64_t)v10, MEMORY[0x263F58AA8]);
      (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
    }
    else
    {
      if (v15 != *MEMORY[0x263F589B0])
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, 1, 1, v4);
        return (*(uint64_t (**)(void **, uint64_t))(v12 + 8))(v14, v11);
      }
      (*(void (**)(void **, uint64_t))(v12 + 96))(v14, v11);
      uint64_t v45 = *v14;
      int v46 = v14[1];
      int v47 = self;
      sub_2286D85EC();
      uint64_t v48 = swift_allocObject();
      *(_OWORD *)(v48 + 16) = xmmword_2286DFCC0;
      *(void *)(v48 + 56) = MEMORY[0x263F8D310];
      *(void *)(v48 + 32) = v45;
      *(void *)(v48 + 40) = v46;
      uint64_t v49 = (void *)sub_2286DE1A8();
      swift_bridgeObjectRelease();
      id v50 = objc_msgSend(v47, sel_nss_NewsURLWithPathComponents_internal_, v49, 0);

      sub_2286DD7D8();
    }
  }
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(a2, 0, 1, v4);
}

uint64_t type metadata accessor for ArticleViewerRouter()
{
  return self;
}

uint64_t sub_2286D8378(uint64_t a1)
{
  return sub_2286D83C8(a1);
}

uint64_t sub_2286D839C(uint64_t a1)
{
  return sub_2286D83C8(a1);
}

uint64_t sub_2286D83C8(uint64_t a1)
{
  sub_2286C4164();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2286DD7E8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2286D7CC8(a1, (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1) {
    return sub_2286D86AC((uint64_t)v4, (uint64_t (*)(void))sub_2286C4164);
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  id v10 = objc_msgSend(self, sel_sharedApplication);
  uint64_t v11 = (void *)sub_2286DD7B8();
  sub_2286C9630(MEMORY[0x263F8EE78]);
  type metadata accessor for OpenExternalURLOptionsKey();
  sub_2286C984C();
  uint64_t v12 = (void *)sub_2286DE128();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_openURL_options_completionHandler_, v11, v12, 0);

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_2286D85EC()
{
  if (!qword_26AD8C670)
  {
    unint64_t v0 = sub_2286DE3C8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AD8C670);
    }
  }
}

uint64_t sub_2286D8648(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2286DDA58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2286D86AC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_2286D870C()
{
  if (!qword_26825A120)
  {
    MEMORY[0x270FA5388](0);
    sub_2286CB238();
    sub_2286DDAB8();
    sub_2286C2BE4(255, &qword_26825A130);
    sub_2286C2BE4(255, &qword_26825A138);
    unint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
    if (!v1) {
      atomic_store(TupleTypeMetadata, (unint64_t *)&qword_26825A120);
    }
  }
}

void sub_2286D8844(void *a1@<X0>, double *a2@<X8>)
{
  sub_2286C4164();
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  id v10 = (char *)&v34 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v34 - v11;
  if (a1 && (id v13 = objc_msgSend(a1, sel_bannerImageForWhiteBackground)) != 0)
  {
    int v14 = v13;
    id v15 = objc_msgSend(v13, sel_assetHandle);

    if (!v15)
    {
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    id v16 = objc_msgSend(v15, sel_remoteURL);

    sub_2286DD7D8();
    uint64_t v17 = sub_2286DD7E8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v12, 0, 1, v17);
  }
  else
  {
    uint64_t v18 = sub_2286DD7E8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v12, 1, 1, v18);
  }
  id v19 = (int *)type metadata accessor for NewsChannelLogoCollection();
  sub_2286DA0E0((uint64_t)v12, (uint64_t)a2 + v19[5]);
  if (!a1 || (id v20 = objc_msgSend(a1, sel_bannerImageForThemeBackground)) == 0)
  {
    uint64_t v25 = sub_2286DD7E8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v10, 1, 1, v25);
    sub_2286DA0E0((uint64_t)v10, (uint64_t)a2 + v19[6]);
    if (!a1) {
      goto LABEL_14;
    }
    goto LABEL_11;
  }
  uint64_t v21 = v20;
  id v22 = objc_msgSend(v20, sel_assetHandle);

  if (v22)
  {
    id v23 = objc_msgSend(v22, sel_remoteURL);

    sub_2286DD7D8();
    uint64_t v24 = sub_2286DD7E8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v10, 0, 1, v24);
    sub_2286DA0E0((uint64_t)v10, (uint64_t)a2 + v19[6]);
LABEL_11:
    id v26 = objc_msgSend(a1, sel_bannerImageForMask);
    if (v26)
    {
      uint64_t v27 = v26;
      id v28 = objc_msgSend(v26, sel_assetHandle);

      if (v28)
      {
        id v29 = objc_msgSend(v28, sel_remoteURL);

        sub_2286DD7D8();
        uint64_t v30 = sub_2286DD7E8();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v7, 0, 1, v30);
        sub_2286DA0E0((uint64_t)v7, (uint64_t)a2 + v19[7]);
        goto LABEL_15;
      }
      __break(1u);
      goto LABEL_19;
    }
LABEL_14:
    uint64_t v31 = sub_2286DD7E8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v7, 1, 1, v31);
    sub_2286DA0E0((uint64_t)v7, (uint64_t)a2 + v19[7]);
    if (!a1)
    {
      double v33 = 1.0;
      goto LABEL_16;
    }
LABEL_15:
    objc_msgSend(a1, sel_bannerImageScale);
    double v33 = v32;
    swift_unknownObjectRelease();
LABEL_16:
    *a2 = v33;
    return;
  }
LABEL_20:
  __break(1u);
}

BOOL static NewsChannelLogoCollection.LogoTheme.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t NewsChannelLogoCollection.LogoTheme.hash(into:)()
{
  return sub_2286DE448();
}

uint64_t NewsChannelLogoCollection.LogoTheme.hashValue.getter()
{
  return sub_2286DE458();
}

double NewsChannelLogoCollection.scale.getter()
{
  return *(double *)v0;
}

uint64_t NewsChannelLogoCollection.url(for:)@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = qword_2286E0208[*a1];
  uint64_t v5 = type metadata accessor for NewsChannelLogoCollection();
  return sub_2286DA144(v2 + *(int *)(v5 + 4 * v4), a2, (uint64_t (*)(void))sub_2286C4164);
}

unint64_t sub_2286D8D74(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
    case 2:
      return result;
    case 3:
      unint64_t result = 0x6B73614D726F66;
      break;
    default:
      unint64_t result = 0x656C616373;
      break;
  }
  return result;
}

unint64_t sub_2286D8E04()
{
  return sub_2286D8D74(*v0);
}

uint64_t sub_2286D8E0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2286DB694(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2286D8E34(uint64_t a1)
{
  unint64_t v2 = sub_2286DA028();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2286D8E70(uint64_t a1)
{
  unint64_t v2 = sub_2286DA028();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t NewsChannelLogoCollection.encode(to:)(void *a1)
{
  sub_2286DA07C(0, &qword_26825A140, MEMORY[0x263F8E0C0]);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v9 - v6;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2286DA028();
  sub_2286DE478();
  char v13 = 0;
  sub_2286DE3A8();
  if (!v1)
  {
    type metadata accessor for NewsChannelLogoCollection();
    char v12 = 1;
    sub_2286DD7E8();
    sub_2286DB890(&qword_26825A090);
    sub_2286DE388();
    char v11 = 2;
    sub_2286DE388();
    char v10 = 3;
    sub_2286DE388();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t NewsChannelLogoCollection.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  sub_2286C4164();
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  id v26 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v23 - v7;
  MEMORY[0x270FA5388](v6);
  char v10 = (char *)&v23 - v9;
  sub_2286DA07C(0, &qword_26825A150, MEMORY[0x263F8E040]);
  uint64_t v27 = *(void *)(v11 - 8);
  uint64_t v28 = v11;
  MEMORY[0x270FA5388](v11);
  char v13 = (char *)&v23 - v12;
  uint64_t v14 = type metadata accessor for NewsChannelLogoCollection();
  MEMORY[0x270FA5388](v14);
  id v16 = (uint64_t *)((char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2286DA028();
  id v29 = v13;
  uint64_t v17 = v30;
  sub_2286DE468();
  if (v17) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v18 = v27;
  char v34 = 0;
  sub_2286DE368();
  uint64_t v24 = v16;
  void *v16 = v19;
  sub_2286DD7E8();
  char v33 = 1;
  uint64_t v30 = sub_2286DB890(&qword_26825A0C0);
  sub_2286DE348();
  uint64_t v23 = v14;
  uint64_t v20 = (uint64_t)v24;
  sub_2286DA0E0((uint64_t)v10, (uint64_t)v24 + *(int *)(v14 + 20));
  char v32 = 2;
  sub_2286DE348();
  sub_2286DA0E0((uint64_t)v8, v20 + *(int *)(v23 + 24));
  char v31 = 3;
  uint64_t v21 = (uint64_t)v26;
  sub_2286DE348();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v29, v28);
  sub_2286DA0E0(v21, v20 + *(int *)(v23 + 28));
  sub_2286DA144(v20, v25, (uint64_t (*)(void))type metadata accessor for NewsChannelLogoCollection);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_2286DB830(v20, (uint64_t (*)(void))type metadata accessor for NewsChannelLogoCollection);
}

uint64_t sub_2286D9534@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return NewsChannelLogoCollection.init(from:)(a1, a2);
}

uint64_t sub_2286D954C(void *a1)
{
  return NewsChannelLogoCollection.encode(to:)(a1);
}

BOOL _s7NewsKit0A21ChannelLogoCollectionV2eeoiySbAC_ACtFZ_0(double *a1, double *a2)
{
  uint64_t v4 = sub_2286DD7E8();
  uint64_t v91 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = &v75[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2286D7ACC();
  uint64_t v8 = v7;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = &v75[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  v89 = &v75[-v13];
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = &v75[-v14];
  sub_2286C4164();
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = MEMORY[0x270FA5388](&v75[-v20]);
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  v90 = &v75[-v23];
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  id v26 = &v75[-v25];
  uint64_t v27 = MEMORY[0x270FA5388](v24);
  id v29 = &v75[-v28];
  uint64_t v30 = MEMORY[0x270FA5388](v27);
  id v36 = &v75[-v35];
  if (*a1 != *a2) {
    return 0;
  }
  uint64_t v88 = v31;
  uint64_t v80 = v30;
  uint64_t v81 = v34;
  uint64_t v82 = v33;
  v83 = v6;
  uint64_t v79 = v32;
  v84 = v11;
  uint64_t v37 = type metadata accessor for NewsChannelLogoCollection();
  uint64_t v38 = *(int *)(v37 + 20);
  v85 = a1;
  sub_2286DA144((uint64_t)a1 + v38, (uint64_t)v36, (uint64_t (*)(void))sub_2286C4164);
  uint64_t v86 = v37;
  v87 = a2;
  sub_2286DA144((uint64_t)a2 + *(int *)(v37 + 20), (uint64_t)v29, (uint64_t (*)(void))sub_2286C4164);
  uint64_t v39 = (uint64_t)&v15[*(int *)(v8 + 48)];
  sub_2286DA144((uint64_t)v36, (uint64_t)v15, (uint64_t (*)(void))sub_2286C4164);
  sub_2286DA144((uint64_t)v29, v39, (uint64_t (*)(void))sub_2286C4164);
  uint64_t v40 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v91 + 48);
  uint64_t v41 = v8;
  uint64_t v42 = v4;
  if (v40((uint64_t)v15, 1, v4) == 1)
  {
    sub_2286DB830((uint64_t)v29, (uint64_t (*)(void))sub_2286C4164);
    sub_2286DB830((uint64_t)v36, (uint64_t (*)(void))sub_2286C4164);
    if (v40(v39, 1, v4) == 1)
    {
      uint64_t v78 = v41;
      sub_2286DB830((uint64_t)v15, (uint64_t (*)(void))sub_2286C4164);
      goto LABEL_9;
    }
LABEL_7:
    uint64_t v43 = (uint64_t)v15;
LABEL_22:
    sub_2286DB830(v43, (uint64_t (*)(void))sub_2286D7ACC);
    return 0;
  }
  sub_2286DA144((uint64_t)v15, (uint64_t)v26, (uint64_t (*)(void))sub_2286C4164);
  if (v40(v39, 1, v4) == 1)
  {
    sub_2286DB830((uint64_t)v29, (uint64_t (*)(void))sub_2286C4164);
    sub_2286DB830((uint64_t)v36, (uint64_t (*)(void))sub_2286C4164);
    (*(void (**)(unsigned char *, uint64_t))(v91 + 8))(v26, v4);
    goto LABEL_7;
  }
  uint64_t v78 = v41;
  uint64_t v44 = v91;
  uint64_t v45 = v40;
  int v46 = v83;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v91 + 32))(v83, v39, v42);
  sub_2286DB890((unint64_t *)&unk_26825A100);
  LODWORD(v77) = sub_2286DE138();
  int v47 = *(void (**)(unsigned char *, uint64_t))(v44 + 8);
  v47(v46, v42);
  sub_2286DB830((uint64_t)v29, (uint64_t (*)(void))sub_2286C4164);
  sub_2286DB830((uint64_t)v36, (uint64_t (*)(void))sub_2286C4164);
  v47(v26, v42);
  uint64_t v40 = v45;
  sub_2286DB830((uint64_t)v15, (uint64_t (*)(void))sub_2286C4164);
  if ((v77 & 1) == 0) {
    return 0;
  }
LABEL_9:
  uint64_t v49 = v85;
  uint64_t v48 = v86;
  id v50 = v90;
  sub_2286DA144((uint64_t)v85 + *(int *)(v86 + 24), (uint64_t)v90, (uint64_t (*)(void))sub_2286C4164);
  uint64_t v51 = v88;
  sub_2286DA144((uint64_t)v87 + *(int *)(v48 + 24), v88, (uint64_t (*)(void))sub_2286C4164);
  uint64_t v52 = v89;
  uint64_t v53 = (uint64_t)&v89[*(int *)(v78 + 48)];
  sub_2286DA144((uint64_t)v50, (uint64_t)v89, (uint64_t (*)(void))sub_2286C4164);
  sub_2286DA144(v51, v53, (uint64_t (*)(void))sub_2286C4164);
  if (v40((uint64_t)v52, 1, v42) != 1)
  {
    uint64_t v59 = v80;
    sub_2286DA144((uint64_t)v52, v80, (uint64_t (*)(void))sub_2286C4164);
    unsigned int v60 = v40(v53, 1, v42);
    uint64_t v61 = v91;
    uint64_t v55 = (uint64_t)v84;
    long long v62 = v40;
    uint64_t v58 = v81;
    uint64_t v57 = v82;
    if (v60 != 1)
    {
      v77 = v62;
      uint64_t v63 = v83;
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v91 + 32))(v83, v53, v42);
      sub_2286DB890((unint64_t *)&unk_26825A100);
      int v76 = sub_2286DE138();
      uint64_t v64 = (uint64_t)v52;
      unint64_t v65 = *(void (**)(unsigned char *, uint64_t))(v61 + 8);
      v65(v63, v42);
      sub_2286DB830(v88, (uint64_t (*)(void))sub_2286C4164);
      sub_2286DB830((uint64_t)v90, (uint64_t (*)(void))sub_2286C4164);
      v65((unsigned char *)v59, v42);
      uint64_t v49 = v85;
      sub_2286DB830(v64, (uint64_t (*)(void))sub_2286C4164);
      if ((v76 & 1) == 0) {
        return 0;
      }
      goto LABEL_16;
    }
    sub_2286DB830(v88, (uint64_t (*)(void))sub_2286C4164);
    sub_2286DB830((uint64_t)v90, (uint64_t (*)(void))sub_2286C4164);
    (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v59, v42);
    goto LABEL_14;
  }
  sub_2286DB830(v51, (uint64_t (*)(void))sub_2286C4164);
  sub_2286DB830((uint64_t)v50, (uint64_t (*)(void))sub_2286C4164);
  unsigned int v54 = v40(v53, 1, v42);
  uint64_t v55 = (uint64_t)v84;
  uint64_t v56 = v40;
  uint64_t v58 = v81;
  uint64_t v57 = v82;
  if (v54 != 1)
  {
LABEL_14:
    uint64_t v43 = (uint64_t)v52;
    goto LABEL_22;
  }
  v77 = v56;
  sub_2286DB830((uint64_t)v52, (uint64_t (*)(void))sub_2286C4164);
LABEL_16:
  uint64_t v66 = v86;
  sub_2286DA144((uint64_t)v49 + *(int *)(v86 + 28), v57, (uint64_t (*)(void))sub_2286C4164);
  sub_2286DA144((uint64_t)v87 + *(int *)(v66 + 28), v58, (uint64_t (*)(void))sub_2286C4164);
  uint64_t v67 = v55 + *(int *)(v78 + 48);
  sub_2286DA144(v57, v55, (uint64_t (*)(void))sub_2286C4164);
  sub_2286DA144(v58, v67, (uint64_t (*)(void))sub_2286C4164);
  unint64_t v68 = v77;
  if (v77(v55, 1, v42) == 1)
  {
    sub_2286DB830(v58, (uint64_t (*)(void))sub_2286C4164);
    sub_2286DB830(v57, (uint64_t (*)(void))sub_2286C4164);
    if (v68(v67, 1, v42) == 1)
    {
      sub_2286DB830(v55, (uint64_t (*)(void))sub_2286C4164);
      return 1;
    }
    goto LABEL_21;
  }
  uint64_t v69 = v79;
  sub_2286DA144(v55, v79, (uint64_t (*)(void))sub_2286C4164);
  if (v68(v67, 1, v42) == 1)
  {
    sub_2286DB830(v58, (uint64_t (*)(void))sub_2286C4164);
    sub_2286DB830(v57, (uint64_t (*)(void))sub_2286C4164);
    (*(void (**)(uint64_t, uint64_t))(v91 + 8))(v69, v42);
LABEL_21:
    uint64_t v43 = v55;
    goto LABEL_22;
  }
  uint64_t v71 = v91;
  uint64_t v72 = v83;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v91 + 32))(v83, v67, v42);
  sub_2286DB890((unint64_t *)&unk_26825A100);
  char v73 = sub_2286DE138();
  unint64_t v74 = *(void (**)(unsigned char *, uint64_t))(v71 + 8);
  v74(v72, v42);
  sub_2286DB830(v58, (uint64_t (*)(void))sub_2286C4164);
  sub_2286DB830(v57, (uint64_t (*)(void))sub_2286C4164);
  v74((unsigned char *)v69, v42);
  sub_2286DB830(v55, (uint64_t (*)(void))sub_2286C4164);
  return (v73 & 1) != 0;
}

uint64_t type metadata accessor for NewsChannelLogoCollection()
{
  uint64_t result = qword_26AD8C438;
  if (!qword_26AD8C438) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_2286DA028()
{
  unint64_t result = qword_26825A148;
  if (!qword_26825A148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26825A148);
  }
  return result;
}

void sub_2286DA07C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_2286DA028();
    unint64_t v7 = a3(a1, &type metadata for NewsChannelLogoCollection.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_2286DA0E0(uint64_t a1, uint64_t a2)
{
  sub_2286C4164();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2286DA144(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_2286DA1B0()
{
  unint64_t result = qword_26825A158;
  if (!qword_26825A158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26825A158);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for NewsChannelLogoCollection(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    uint64_t v7 = a3[5];
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_2286DD7E8();
    uint64_t v11 = *(void *)(v10 - 8);
    uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    if (v12(v9, 1, v10))
    {
      sub_2286C4164();
      memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    uint64_t v15 = a3[6];
    uint64_t v16 = (char *)v4 + v15;
    uint64_t v17 = (char *)a2 + v15;
    if (v12((char *)a2 + v15, 1, v10))
    {
      sub_2286C4164();
      memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v16, v17, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v16, 0, 1, v10);
    }
    uint64_t v19 = a3[7];
    uint64_t v20 = (char *)v4 + v19;
    uint64_t v21 = (char *)a2 + v19;
    if (v12(v21, 1, v10))
    {
      sub_2286C4164();
      memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v20, v21, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v20, 0, 1, v10);
    }
  }
  return v4;
}

uint64_t destroy for NewsChannelLogoCollection(uint64_t a1, int *a2)
{
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = sub_2286DD7E8();
  uint64_t v11 = *(void *)(v5 - 8);
  unint64_t v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  if (!v6(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v4, v5);
  }
  uint64_t v7 = a1 + a2[6];
  if (!v6(v7, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v7, v5);
  }
  uint64_t v8 = a1 + a2[7];
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(v8, 1, v5);
  if (!result)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);
    return v10(v8, v5);
  }
  return result;
}

void *initializeWithCopy for NewsChannelLogoCollection(void *a1, char *a2, int *a3)
{
  *a1 = *(void *)a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_2286DD7E8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    sub_2286C4164();
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = &a2[v13];
  if (v11(&a2[v13], 1, v9))
  {
    sub_2286C4164();
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v14, v15, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  }
  uint64_t v17 = a3[7];
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = &a2[v17];
  if (v11(v19, 1, v9))
  {
    sub_2286C4164();
    memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v18, v19, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v18, 0, 1, v9);
  }
  return a1;
}

char *assignWithCopy for NewsChannelLogoCollection(char *a1, void *a2, int *a3)
{
  *(void *)a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2286DD7E8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    sub_2286C4164();
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = a3[6];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = (char *)a2 + v15;
  int v18 = v11(&a1[v15], 1, v9);
  int v19 = v11(v17, 1, v9);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v16, v17, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v9);
LABEL_12:
    sub_2286C4164();
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v16, v17, v9);
LABEL_13:
  uint64_t v21 = a3[7];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = (char *)a2 + v21;
  int v24 = v11(&a1[v21], 1, v9);
  int v25 = v11(v23, 1, v9);
  if (!v24)
  {
    if (!v25)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v22, v23, v9);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v22, v9);
    goto LABEL_18;
  }
  if (v25)
  {
LABEL_18:
    sub_2286C4164();
    memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v22, v23, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v22, 0, 1, v9);
  return a1;
}

void *initializeWithTake for NewsChannelLogoCollection(void *a1, char *a2, int *a3)
{
  *a1 = *(void *)a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_2286DD7E8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    sub_2286C4164();
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = &a2[v13];
  if (v11(&a2[v13], 1, v9))
  {
    sub_2286C4164();
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v14, v15, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  }
  uint64_t v17 = a3[7];
  int v18 = (char *)a1 + v17;
  int v19 = &a2[v17];
  if (v11(v19, 1, v9))
  {
    sub_2286C4164();
    memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v18, v19, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v18, 0, 1, v9);
  }
  return a1;
}

char *assignWithTake for NewsChannelLogoCollection(char *a1, void *a2, int *a3)
{
  *(void *)a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2286DD7E8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    sub_2286C4164();
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 40))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = a3[6];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = (char *)a2 + v15;
  int v18 = v11(&a1[v15], 1, v9);
  int v19 = v11(v17, 1, v9);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v16, v17, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v9);
LABEL_12:
    sub_2286C4164();
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 40))(v16, v17, v9);
LABEL_13:
  uint64_t v21 = a3[7];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = (char *)a2 + v21;
  int v24 = v11(&a1[v21], 1, v9);
  int v25 = v11(v23, 1, v9);
  if (!v24)
  {
    if (!v25)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 40))(v22, v23, v9);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v22, v9);
    goto LABEL_18;
  }
  if (v25)
  {
LABEL_18:
    sub_2286C4164();
    memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v22, v23, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v22, 0, 1, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for NewsChannelLogoCollection(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2286DB1CC);
}

uint64_t sub_2286DB1CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2286C4164();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48);
  uint64_t v8 = v6;
  uint64_t v9 = a1 + *(int *)(a3 + 20);

  return v7(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for NewsChannelLogoCollection(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2286DB260);
}

uint64_t sub_2286DB260(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2286C4164();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
  uint64_t v9 = v7;
  uint64_t v10 = a1 + *(int *)(a4 + 20);

  return v8(v10, a2, a2, v9);
}

void sub_2286DB2E4()
{
  sub_2286C4164();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for NewsChannelLogoCollection.LogoTheme(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2286DB450);
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

ValueMetadata *type metadata accessor for NewsChannelLogoCollection.LogoTheme()
{
  return &type metadata for NewsChannelLogoCollection.LogoTheme;
}

unsigned char *storeEnumTagSinglePayload for NewsChannelLogoCollection.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2286DB554);
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

ValueMetadata *type metadata accessor for NewsChannelLogoCollection.CodingKeys()
{
  return &type metadata for NewsChannelLogoCollection.CodingKeys;
}

unint64_t sub_2286DB590()
{
  unint64_t result = qword_26825A160;
  if (!qword_26825A160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26825A160);
  }
  return result;
}

unint64_t sub_2286DB5E8()
{
  unint64_t result = qword_26825A168;
  if (!qword_26825A168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26825A168);
  }
  return result;
}

unint64_t sub_2286DB640()
{
  unint64_t result = qword_26825A170;
  if (!qword_26825A170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26825A170);
  }
  return result;
}

uint64_t sub_2286DB694(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x656C616373 && a2 == 0xE500000000000000;
  if (v3 || (sub_2286DE3D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000002286E0E20 || (sub_2286DE3D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000002286E0E40 || (sub_2286DE3D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6B73614D726F66 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_2286DE3D8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_2286DB830(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2286DB890(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2286DD7E8();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for WebViewControllerFactory()
{
  return self;
}

uint64_t type metadata accessor for EngagementUpsellBannerPropertiesProvider()
{
  return self;
}

uint64_t type metadata accessor for PostPurchaseOnboardingPresenter()
{
  return self;
}

ValueMetadata *type metadata accessor for ToolbarNavigationArticleViewerFeatureVisibilityProvider()
{
  return &type metadata for ToolbarNavigationArticleViewerFeatureVisibilityProvider;
}

id sub_2286DBA78(void *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  if (objc_msgSend(a1, sel_userInterfaceStyle) == (id)2)
  {
    id v17 = objc_allocWithZone(MEMORY[0x263F825C8]);
    double v18 = a2;
    double v19 = a3;
    double v20 = a4;
    double v21 = a5;
  }
  else
  {
    id v17 = objc_allocWithZone(MEMORY[0x263F825C8]);
    double v18 = a6;
    double v19 = a7;
    double v20 = a8;
    double v21 = a9;
  }

  return objc_msgSend(v17, sel_initWithRed_green_blue_alpha_, v18, v19, v20, v21);
}

uint64_t sub_2286DBB40@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_2286DDDF8();
  swift_allocObject();
  uint64_t result = sub_2286DDDE8();
  uint64_t v4 = MEMORY[0x263F7D338];
  a1[3] = v2;
  a1[4] = v4;
  *a1 = result;
  return result;
}

unint64_t sub_2286DBB98@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for EngagementUpsellBannerPropertiesProvider();
  uint64_t v3 = swift_allocObject();
  a1[3] = v2;
  unint64_t result = sub_2286DBDC4();
  a1[4] = result;
  *a1 = v3;
  return result;
}

uint64_t type metadata accessor for ProviderAssembly()
{
  return self;
}

uint64_t sub_2286DBC10()
{
  uint64_t v0 = sub_2286DDC28();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2286DDBA8();
  sub_2286C3550(0, &qword_26AD8C740);
  sub_2286DDC18();
  swift_release();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F7D000], v0);
  sub_2286DDB38();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_2286DDBA8();
  sub_2286C3550(0, (unint64_t *)&unk_26AD8C6F0);
  sub_2286DDC18();
  swift_release();
  return swift_release();
}

unint64_t sub_2286DBDC4()
{
  unint64_t result = qword_26825A178;
  if (!qword_26825A178)
  {
    type metadata accessor for EngagementUpsellBannerPropertiesProvider();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26825A178);
  }
  return result;
}

uint64_t sub_2286DBE1C@<X0>(uint64_t *a1@<X8>)
{
  return sub_2286DBEAC((uint64_t (*)(void))type metadata accessor for ArticleViewerRouter, &qword_26825A190, (void (*)(uint64_t))type metadata accessor for ArticleViewerRouter, a1);
}

uint64_t sub_2286DBE64@<X0>(uint64_t *a1@<X8>)
{
  return sub_2286DBEAC((uint64_t (*)(void))type metadata accessor for ArticleRouter, &qword_26825A188, (void (*)(uint64_t))type metadata accessor for ArticleRouter, a1);
}

uint64_t sub_2286DBEAC@<X0>(uint64_t (*a1)(void)@<X1>, unint64_t *a2@<X2>, void (*a3)(uint64_t)@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v7 = a1(0);
  uint64_t v8 = swift_allocObject();
  a4[3] = v7;
  uint64_t result = sub_2286DC0C4(a2, a3);
  a4[4] = result;
  *a4 = v8;
  return result;
}

uint64_t sub_2286DBF24@<X0>(uint64_t *a1@<X8>)
{
  return sub_2286DBEAC((uint64_t (*)(void))type metadata accessor for SubscriptionsRouter, &qword_26825A180, (void (*)(uint64_t))type metadata accessor for SubscriptionsRouter, a1);
}

uint64_t type metadata accessor for RouterAssembly()
{
  return self;
}

uint64_t sub_2286DBF90()
{
  sub_2286DDBA8();
  sub_2286C3550(0, &qword_26AD8C690);
  sub_2286DDC18();
  swift_release();
  swift_release();
  sub_2286DDBA8();
  sub_2286C3550(0, &qword_26AD8C698);
  sub_2286DDC18();
  swift_release();
  swift_release();
  sub_2286DDBA8();
  sub_2286C3550(0, &qword_26AD8C708);
  sub_2286DDC18();
  swift_release();

  return swift_release();
}

uint64_t sub_2286DC0C4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for SceneProvidingView()
{
  return self;
}

uint64_t sub_2286DC2A8(uint64_t a1)
{
  return sub_2286DC2EC(a1, (uint64_t (*)(void))sub_2286CE960);
}

id sub_2286DC2C0(id *a1)
{
  return objc_msgSend(*a1, sel_enableFlushingWithFlushingThreshold_, 2);
}

uint64_t sub_2286DC2D4(uint64_t a1)
{
  return sub_2286DC2EC(a1, (uint64_t (*)(void))sub_2286CF5A0);
}

uint64_t sub_2286DC2EC(uint64_t a1, uint64_t (*a2)(void))
{
  if (qword_26AD8C8E8 != -1) {
    swift_once();
  }
  return a2();
}

id sub_2286DC34C(uint64_t a1)
{
  return sub_2286DC61C(a1, 0x263F594B8, (SEL *)&selRef_sharedInstance);
}

uint64_t sub_2286DC364(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2286DD708(0, &qword_26AD8CFD8);
  uint64_t result = sub_2286DDB68();
  if (!result) {
    __break(1u);
  }
  return result;
}

id sub_2286DC3C8()
{
  id result = objc_msgSend(self, sel_sharedNetworkReachability);
  if (!result) {
    __break(1u);
  }
  return result;
}

id sub_2286DC404(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2286DD744(0, (unint64_t *)&unk_26AD8CFE0);
  id result = (id)sub_2286DDB68();
  if (result)
  {
    id v2 = objc_msgSend(result, sel_news_core_ConfigurationManager);
    swift_unknownObjectRelease();
    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_2286DC490(void *a1)
{
  return sub_2286DC4A8(a1, (SEL *)&selRef_readingHistory);
}

id sub_2286DC49C(void *a1)
{
  return sub_2286DC4A8(a1, (SEL *)&selRef_readingList);
}

id sub_2286DC4A8(void *a1, SEL *a2)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2286DD708(0, &qword_26AD8CFD8);
  id result = (id)sub_2286DDB68();
  if (result)
  {
    uint64_t v4 = result;
    id v5 = [result *a2];

    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_2286DC530(void *a1)
{
}

void sub_2286DC53C(void *a1)
{
}

void sub_2286DC548(void *a1, SEL *a2)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2286DD708(0, &qword_26AD8CFD8);
  uint64_t v3 = (void *)sub_2286DDB68();
  if (!v3)
  {
    __break(1u);
    goto LABEL_5;
  }
  uint64_t v4 = v3;
  id v5 = [v3 *a2];

  if (!v5) {
LABEL_5:
  }
    __break(1u);
}

id sub_2286DC5D8(void *a1)
{
  return sub_2286DC4A8(a1, (SEL *)&selRef_flintResourceManager);
}

id sub_2286DC5E4(void *a1)
{
  return sub_2286DC4A8(a1, (SEL *)&selRef_issueReadingHistory);
}

void sub_2286DC5F0(void *a1)
{
}

id sub_2286DC5FC(void *a1)
{
  return sub_2286DC4A8(a1, (SEL *)&selRef_assetManager);
}

id sub_2286DC608(uint64_t a1)
{
  return sub_2286DC61C(a1, 0x263F595E0, (SEL *)&selRef_defaultAvailability);
}

id sub_2286DC61C(uint64_t a1, uint64_t a2, SEL *a3)
{
  id v3 = [self *a3];

  return v3;
}

id sub_2286DC660()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F59628]);

  return objc_msgSend(v0, sel_init);
}

void sub_2286DC698(void *a1)
{
}

void sub_2286DC6A4(void *a1)
{
}

void sub_2286DC6B4(void *a1)
{
}

void sub_2286DC6C0(void *a1)
{
}

uint64_t sub_2286DC6CC(void **a1, void *a2)
{
  id v2 = *a1;
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  sub_2286DD744(0, &qword_26825A388);
  objc_msgSend(v2, sel_setEntitlementsOverrideProvider_, sub_2286DDB68());

  return swift_unknownObjectRelease();
}

id sub_2286DC75C(void *a1)
{
  return sub_2286DC4A8(a1, (SEL *)&selRef_tagSettings);
}

id sub_2286DC768()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for StubAppActivityMonitor());

  return objc_msgSend(v0, sel_init);
}

uint64_t type metadata accessor for NewsCoreAssembly()
{
  return self;
}

uint64_t sub_2286DC7C8()
{
  uint64_t v0 = sub_2286DDC28();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  id v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2286DDBA8();
  sub_2286DD708(0, &qword_26AD8CFD8);
  sub_2286DDC08();
  swift_release();
  uint64_t v4 = *MEMORY[0x263F7D010];
  id v5 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v5(v3, v4, v0);
  sub_2286DDB38();
  swift_release();
  char v6 = *(void (**)(char *, uint64_t))(v1 + 8);
  v6(v3, v0);
  sub_2286DDB28();
  swift_release();
  swift_release();
  sub_2286DDBA8();
  sub_2286DD744(0, (unint64_t *)&unk_26AD8D0A0);
  sub_2286DDC08();
  swift_release();
  v5(v3, v4, v0);
  sub_2286DDB38();
  swift_release();
  swift_release();
  v6(v3, v0);
  sub_2286DDBB8();
  sub_2286DD744(0, (unint64_t *)&unk_26AD8D018);
  sub_2286DDC08();
  swift_release();
  v5(v3, v4, v0);
  sub_2286DDB38();
  swift_release();
  swift_release();
  v6(v3, v0);
  sub_2286DDBA8();
  sub_2286DD744(0, (unint64_t *)&unk_26AD8CFE0);
  sub_2286DDC08();
  swift_release();
  swift_release();
  sub_2286DDBA8();
  sub_2286DD744(0, (unint64_t *)&unk_26AD8D028);
  sub_2286DDC08();
  swift_release();
  swift_release();
  sub_2286DDBA8();
  sub_2286DD708(0, (unint64_t *)&unk_26AD8D040);
  sub_2286DDC08();
  swift_release();
  v5(v3, v4, v0);
  sub_2286DDB38();
  swift_release();
  swift_release();
  v6(v3, v0);
  sub_2286DDBA8();
  sub_2286DD744(0, (unint64_t *)&qword_26AD8D0B0);
  sub_2286DDC08();
  swift_release();
  swift_release();
  sub_2286DDBA8();
  sub_2286DD708(0, (unint64_t *)&unk_26AD8CFF0);
  sub_2286DDC08();
  swift_release();
  unsigned int v13 = v4;
  v5(v3, v4, v0);
  id v17 = v5;
  sub_2286DDB38();
  swift_release();
  swift_release();
  v6(v3, v0);
  sub_2286DDBA8();
  sub_2286DD708(0, (unint64_t *)&unk_26AD8CFA8);
  sub_2286DDC08();
  swift_release();
  v5(v3, v4, v0);
  sub_2286DDB38();
  swift_release();
  swift_release();
  v6(v3, v0);
  sub_2286DDBA8();
  sub_2286DD708(0, &qword_26AD8D090);
  sub_2286DDC08();
  swift_release();
  uint64_t v7 = v13;
  uint64_t v8 = v17;
  v17(v3, v13, v0);
  sub_2286DDB38();
  swift_release();
  swift_release();
  v6(v3, v0);
  sub_2286DDBA8();
  sub_2286DD708(0, &qword_26AD8D088);
  sub_2286DDC08();
  swift_release();
  v8(v3, v7, v0);
  sub_2286DDB38();
  swift_release();
  swift_release();
  uint64_t v14 = v1 + 8;
  v6(v3, v0);
  uint64_t v15 = v6;
  sub_2286DDBA8();
  sub_2286DD708(0, &qword_26AD8D060);
  sub_2286DDC08();
  swift_release();
  v17(v3, v7, v0);
  sub_2286DDB38();
  swift_release();
  swift_release();
  v6(v3, v0);
  sub_2286DDBA8();
  sub_2286DD744(0, &qword_26AD8D098);
  sub_2286DDC08();
  swift_release();
  uint64_t v9 = v17;
  v17(v3, v7, v0);
  uint64_t v16 = v1 + 104;
  sub_2286DDB38();
  swift_release();
  swift_release();
  uint64_t v10 = v15;
  v15(v3, v0);
  sub_2286DDBA8();
  sub_2286DDC08();
  swift_release();
  v9(v3, v7, v0);
  sub_2286DDB38();
  swift_release();
  swift_release();
  v10(v3, v0);
  sub_2286DDBA8();
  sub_2286DD744(0, &qword_26AD8D080);
  sub_2286DDC08();
  swift_release();
  v9(v3, v7, v0);
  sub_2286DDB38();
  swift_release();
  swift_release();
  v10(v3, v0);
  sub_2286DDBA8();
  sub_2286DD708(0, (unint64_t *)&unk_26AD8CFC8);
  sub_2286DDC08();
  swift_release();
  v9(v3, v7, v0);
  sub_2286DDB38();
  swift_release();
  swift_release();
  v10(v3, v0);
  sub_2286DDBA8();
  sub_2286DD708(0, &qword_26AD8D0C0);
  sub_2286DDC08();
  swift_release();
  swift_release();
  sub_2286DDBA8();
  sub_2286DD744(0, &qword_26AD8D078);
  sub_2286DDC08();
  swift_release();
  swift_release();
  sub_2286DDBA8();
  sub_2286DD708(0, &qword_26AD8D010);
  sub_2286DDC08();
  swift_release();
  v9(v3, v7, v0);
  sub_2286DDB38();
  swift_release();
  swift_release();
  v10(v3, v0);
  sub_2286DDBA8();
  sub_2286DD708(0, &qword_26AD8D038);
  sub_2286DDC08();
  swift_release();
  sub_2286DDB28();
  swift_release();
  v9(v3, v7, v0);
  sub_2286DDB38();
  swift_release();
  swift_release();
  v10(v3, v0);
  sub_2286DDBA8();
  sub_2286DD744(0, (unint64_t *)&unk_26AD8D050);
  sub_2286DDC08();
  swift_release();
  v9(v3, v7, v0);
  sub_2286DDB38();
  swift_release();
  swift_release();
  v10(v3, v0);
  sub_2286DDBA8();
  sub_2286DD744(0, (unint64_t *)&unk_26AD8D068);
  sub_2286DDC08();
  swift_release();
  v9(v3, v7, v0);
  sub_2286DDB38();
  swift_release();
  swift_release();
  v10(v3, v0);
  sub_2286DDBA8();
  sub_2286DD744(0, &qword_26AD8D0D0);
  sub_2286DDC08();
  swift_release();
  sub_2286DDB28();
  swift_release();
  v9(v3, v7, v0);
  sub_2286DDB38();
  swift_release();
  swift_release();
  v10(v3, v0);
  sub_2286DDBA8();
  sub_2286DD708(0, (unint64_t *)&unk_26AD8CFB8);
  sub_2286DDC08();
  swift_release();
  v9(v3, v7, v0);
  sub_2286DDB38();
  swift_release();
  swift_release();
  v10(v3, v0);
  sub_2286DDBB8();
  sub_2286DD744(0, (unint64_t *)&unk_26AD8D000);
  sub_2286DDC08();
  swift_release();
  return swift_release();
}

uint64_t sub_2286DD708(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2286DD744(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_2286DD798()
{
  return MEMORY[0x270EEE3E0]();
}

uint64_t sub_2286DD7A8()
{
  return MEMORY[0x270EEE410]();
}

uint64_t sub_2286DD7B8()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_2286DD7C8()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t sub_2286DD7D8()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_2286DD7E8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2286DD7F8()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_2286DD808()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_2286DD818()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_2286DD828()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2286DD838()
{
  return MEMORY[0x270F4F1B8]();
}

uint64_t sub_2286DD848()
{
  return MEMORY[0x270F7A8D8]();
}

uint64_t sub_2286DD858()
{
  return MEMORY[0x270F7A8E0]();
}

uint64_t sub_2286DD868()
{
  return MEMORY[0x270F7A8F0]();
}

uint64_t sub_2286DD878()
{
  return MEMORY[0x270F0C240]();
}

uint64_t sub_2286DD888()
{
  return MEMORY[0x270F0C248]();
}

uint64_t sub_2286DD898()
{
  return MEMORY[0x270F0C250]();
}

uint64_t sub_2286DD8A8()
{
  return MEMORY[0x270F0C2A8]();
}

uint64_t sub_2286DD8B8()
{
  return MEMORY[0x270F0C2B0]();
}

uint64_t sub_2286DD8C8()
{
  return MEMORY[0x270F0C2B8]();
}

uint64_t sub_2286DD8D8()
{
  return MEMORY[0x270F0C2C0]();
}

uint64_t sub_2286DD8E8()
{
  return MEMORY[0x270F0C2C8]();
}

uint64_t sub_2286DD8F8()
{
  return MEMORY[0x270F0C2D0]();
}

uint64_t sub_2286DD908()
{
  return MEMORY[0x270F0C388]();
}

uint64_t sub_2286DD918()
{
  return MEMORY[0x270F0C390]();
}

uint64_t sub_2286DD928()
{
  return MEMORY[0x270F0C3E0]();
}

uint64_t sub_2286DD938()
{
  return MEMORY[0x270F0C3E8]();
}

uint64_t sub_2286DD948()
{
  return MEMORY[0x270F0C420]();
}

uint64_t sub_2286DD958()
{
  return MEMORY[0x270F0C428]();
}

uint64_t sub_2286DD968()
{
  return MEMORY[0x270F0C430]();
}

uint64_t sub_2286DD978()
{
  return MEMORY[0x270F0C438]();
}

uint64_t sub_2286DD988()
{
  return MEMORY[0x270F0C440]();
}

uint64_t sub_2286DD998()
{
  return MEMORY[0x270F0C458]();
}

uint64_t sub_2286DD9A8()
{
  return MEMORY[0x270F0C468]();
}

uint64_t sub_2286DD9B8()
{
  return MEMORY[0x270F0C470]();
}

uint64_t sub_2286DD9C8()
{
  return MEMORY[0x270F0C5E0]();
}

uint64_t sub_2286DD9D8()
{
  return MEMORY[0x270F0C5E8]();
}

uint64_t sub_2286DD9E8()
{
  return MEMORY[0x270F0C600]();
}

uint64_t sub_2286DD9F8()
{
  return MEMORY[0x270F0C608]();
}

uint64_t sub_2286DDA08()
{
  return MEMORY[0x270F0C710]();
}

uint64_t sub_2286DDA18()
{
  return MEMORY[0x270F4E800]();
}

uint64_t sub_2286DDA28()
{
  return MEMORY[0x270F4E818]();
}

uint64_t sub_2286DDA38()
{
  return MEMORY[0x270F4E860]();
}

uint64_t sub_2286DDA48()
{
  return MEMORY[0x270F4E940]();
}

uint64_t sub_2286DDA58()
{
  return MEMORY[0x270F4E978]();
}

uint64_t sub_2286DDA68()
{
  return MEMORY[0x270F4E988]();
}

uint64_t sub_2286DDA78()
{
  return MEMORY[0x270F4EBB8]();
}

uint64_t sub_2286DDA88()
{
  return MEMORY[0x270F4EBC0]();
}

uint64_t sub_2286DDA98()
{
  return MEMORY[0x270F4EBC8]();
}

uint64_t sub_2286DDAA8()
{
  return MEMORY[0x270F4EBE8]();
}

uint64_t sub_2286DDAB8()
{
  return MEMORY[0x270F4EC70]();
}

uint64_t sub_2286DDAC8()
{
  return MEMORY[0x270F4EC78]();
}

uint64_t sub_2286DDAD8()
{
  return MEMORY[0x270F4ED80]();
}

uint64_t sub_2286DDAE8()
{
  return MEMORY[0x270F4EE08]();
}

uint64_t sub_2286DDAF8()
{
  return MEMORY[0x270F4EE10]();
}

uint64_t sub_2286DDB08()
{
  return MEMORY[0x270F4EE28]();
}

uint64_t sub_2286DDB18()
{
  return MEMORY[0x270F4EF48]();
}

uint64_t sub_2286DDB28()
{
  return MEMORY[0x270F79ED0]();
}

uint64_t sub_2286DDB38()
{
  return MEMORY[0x270F79ED8]();
}

uint64_t sub_2286DDB48()
{
  return MEMORY[0x270F79F68]();
}

uint64_t sub_2286DDB58()
{
  return MEMORY[0x270F79FF8]();
}

uint64_t sub_2286DDB68()
{
  return MEMORY[0x270F7A000]();
}

uint64_t sub_2286DDB78()
{
  return MEMORY[0x270F7A008]();
}

uint64_t sub_2286DDB88()
{
  return MEMORY[0x270F7A050]();
}

uint64_t sub_2286DDB98()
{
  return MEMORY[0x270F7A058]();
}

uint64_t sub_2286DDBA8()
{
  return MEMORY[0x270F7A0C0]();
}

uint64_t sub_2286DDBB8()
{
  return MEMORY[0x270F7A0C8]();
}

uint64_t sub_2286DDBC8()
{
  return MEMORY[0x270F7A268]();
}

uint64_t sub_2286DDBD8()
{
  return MEMORY[0x270F7A400]();
}

uint64_t sub_2286DDBE8()
{
  return MEMORY[0x270F7A408]();
}

uint64_t sub_2286DDBF8()
{
  return MEMORY[0x270F7A418]();
}

uint64_t sub_2286DDC08()
{
  return MEMORY[0x270F7A420]();
}

uint64_t sub_2286DDC18()
{
  return MEMORY[0x270F7A428]();
}

uint64_t sub_2286DDC28()
{
  return MEMORY[0x270F7A560]();
}

uint64_t sub_2286DDC38()
{
  return MEMORY[0x270F7A580]();
}

uint64_t sub_2286DDC48()
{
  return MEMORY[0x270F7A610]();
}

uint64_t sub_2286DDC58()
{
  return MEMORY[0x270F7A638]();
}

uint64_t sub_2286DDC68()
{
  return MEMORY[0x270F7A690]();
}

uint64_t sub_2286DDC78()
{
  return MEMORY[0x270F7A698]();
}

uint64_t sub_2286DDC88()
{
  return MEMORY[0x270F7A6E0]();
}

uint64_t sub_2286DDC98()
{
  return MEMORY[0x270F7A740]();
}

uint64_t sub_2286DDCA8()
{
  return MEMORY[0x270F7A750]();
}

uint64_t sub_2286DDCB8()
{
  return MEMORY[0x270F7A758]();
}

uint64_t sub_2286DDCC8()
{
  return MEMORY[0x270F7A768]();
}

uint64_t sub_2286DDD18()
{
  return MEMORY[0x270F4F198]();
}

uint64_t sub_2286DDD28()
{
  return MEMORY[0x270F4F1A0]();
}

uint64_t sub_2286DDD38()
{
  return MEMORY[0x270F4F1A8]();
}

uint64_t sub_2286DDD48()
{
  return MEMORY[0x270F4F1B0]();
}

uint64_t sub_2286DDD58()
{
  return MEMORY[0x270F50358]();
}

uint64_t sub_2286DDD68()
{
  return MEMORY[0x270F50360]();
}

uint64_t sub_2286DDD78()
{
  return MEMORY[0x270F50368]();
}

uint64_t sub_2286DDD98()
{
  return MEMORY[0x270F50390]();
}

uint64_t sub_2286DDDA8()
{
  return MEMORY[0x270F50438]();
}

uint64_t sub_2286DDDB8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2286DDDC8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2286DDDD8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2286DDDE8()
{
  return MEMORY[0x270F7ADC8]();
}

uint64_t sub_2286DDDF8()
{
  return MEMORY[0x270F7ADD0]();
}

uint64_t sub_2286DDE08()
{
  return MEMORY[0x270F7AEC8]();
}

uint64_t sub_2286DDE18()
{
  return MEMORY[0x270F7AED0]();
}

uint64_t sub_2286DDE28()
{
  return MEMORY[0x270F7AFB8]();
}

uint64_t sub_2286DDE38()
{
  return MEMORY[0x270F7AFC0]();
}

uint64_t sub_2286DDE48()
{
  return MEMORY[0x270F7B250]();
}

uint64_t sub_2286DDE58()
{
  return MEMORY[0x270F7B298]();
}

uint64_t sub_2286DDE68()
{
  return MEMORY[0x270F7B570]();
}

uint64_t sub_2286DDE78()
{
  return MEMORY[0x270F7B578]();
}

uint64_t sub_2286DDE88()
{
  return MEMORY[0x270F4E558]();
}

uint64_t sub_2286DDE98()
{
  return MEMORY[0x270F4E560]();
}

uint64_t sub_2286DDEA8()
{
  return MEMORY[0x270F4E670]();
}

uint64_t sub_2286DDEB8()
{
  return MEMORY[0x270F4E728]();
}

uint64_t sub_2286DDEC8()
{
  return MEMORY[0x270EFEC48]();
}

uint64_t sub_2286DDED8()
{
  return MEMORY[0x270EFEC58]();
}

uint64_t sub_2286DDEE8()
{
  return MEMORY[0x270EFFDD0]();
}

uint64_t sub_2286DDEF8()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_2286DDF08()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_2286DDF18()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_2286DDF28()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_2286DDF38()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_2286DDF48()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_2286DDF68()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_2286DDF78()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_2286DDF88()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_2286DDFA8()
{
  return MEMORY[0x270F02728]();
}

uint64_t sub_2286DDFB8()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_2286DDFC8()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_2286DDFD8()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_2286DDFE8()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_2286DDFF8()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_2286DE008()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_2286DE018()
{
  return MEMORY[0x270F4F430]();
}

uint64_t sub_2286DE028()
{
  return MEMORY[0x270F4FAD8]();
}

uint64_t sub_2286DE038()
{
  return MEMORY[0x270F4FAE0]();
}

uint64_t sub_2286DE048()
{
  return MEMORY[0x270F4FBE8]();
}

uint64_t sub_2286DE058()
{
  return MEMORY[0x270F4FBF0]();
}

uint64_t sub_2286DE068()
{
  return MEMORY[0x270F4FD10]();
}

uint64_t sub_2286DE078()
{
  return MEMORY[0x270F4FDF0]();
}

uint64_t sub_2286DE088()
{
  return MEMORY[0x270F4FDF8]();
}

uint64_t sub_2286DE098()
{
  return MEMORY[0x270F4FE00]();
}

uint64_t sub_2286DE0A8()
{
  return MEMORY[0x270F4FE08]();
}

uint64_t sub_2286DE0B8()
{
  return MEMORY[0x270F4FE10]();
}

uint64_t sub_2286DE0C8()
{
  return MEMORY[0x270F4FE20]();
}

uint64_t sub_2286DE0D8()
{
  return MEMORY[0x270F4FE28]();
}

uint64_t sub_2286DE0E8()
{
  return MEMORY[0x270F4FE40]();
}

uint64_t sub_2286DE0F8()
{
  return MEMORY[0x270F4FE50]();
}

uint64_t sub_2286DE108()
{
  return MEMORY[0x270F4FE58]();
}

uint64_t sub_2286DE118()
{
  return MEMORY[0x270F4FFC0]();
}

uint64_t sub_2286DE128()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2286DE138()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2286DE148()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2286DE158()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_2286DE168()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_2286DE178()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2286DE188()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2286DE198()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2286DE1A8()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2286DE1B8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2286DE1C8()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_2286DE1D8()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_2286DE1E8()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t sub_2286DE1F8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2286DE208()
{
  return MEMORY[0x270F7CAA8]();
}

uint64_t sub_2286DE218()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_2286DE228()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2286DE238()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2286DE248()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2286DE258()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2286DE268()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2286DE278()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2286DE288()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2286DE298()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_2286DE2A8()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_2286DE2B8()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_2286DE2C8()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_2286DE2D8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2286DE2E8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2286DE2F8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2286DE308()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2286DE318()
{
  return MEMORY[0x270F9F0B8]();
}

uint64_t sub_2286DE328()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2286DE348()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_2286DE358()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_2286DE368()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_2286DE378()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_2286DE388()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_2286DE398()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_2286DE3A8()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_2286DE3B8()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_2286DE3C8()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_2286DE3D8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2286DE3F8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2286DE408()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2286DE418()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2286DE428()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2286DE438()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2286DE448()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2286DE458()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2286DE468()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2286DE478()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t FCArticleCloudKitIDFromUUID()
{
  return MEMORY[0x270F4EFD0]();
}

uint64_t FCBundle()
{
  return MEMORY[0x270F4EFD8]();
}

uint64_t FCURLForContainerizedUserAccountCachesDirectory()
{
  return MEMORY[0x270F4F078]();
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
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

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x270FA0358]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
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

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}