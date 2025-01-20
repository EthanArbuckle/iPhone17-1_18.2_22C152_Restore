uint64_t sub_260A6D08C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x655674616D726F66 && a2 == 0xED00006E6F697372;
  if (v2 || (sub_260A857A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x736E6F6974636573 && a2 == 0xE800000000000000 || (sub_260A857A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6F6974617267696DLL && a2 == 0xEA0000000000736ELL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_260A857A0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_260A6D214(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C76B0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_260A6D498();
  sub_260A85900();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    LOBYTE(v10) = 0;
    uint64_t v7 = sub_260A85690();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C76C0);
    HIBYTE(v9) = 1;
    sub_260A6D604(&qword_26A8C76C8, (void (*)(void))sub_260A6D4EC);
    sub_260A856A0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C76D8);
    HIBYTE(v9) = 2;
    sub_260A6D540();
    swift_bridgeObjectRetain();
    sub_260A856A0();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_260A6D498()
{
  unint64_t result = qword_26A8C76B8;
  if (!qword_26A8C76B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C76B8);
  }
  return result;
}

unint64_t sub_260A6D4EC()
{
  unint64_t result = qword_26A8C76D0;
  if (!qword_26A8C76D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C76D0);
  }
  return result;
}

unint64_t sub_260A6D540()
{
  unint64_t result = qword_26A8C76E0;
  if (!qword_26A8C76E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A8C76D8);
    sub_260A6D8E0(&qword_26A8C76E8, MEMORY[0x263F843C0]);
    sub_260A6D9C8(&qword_26A8C67F8, MEMORY[0x270FA92A8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C76E0);
  }
  return result;
}

uint64_t sub_260A6D604(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A8C76C0);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_260A6D674()
{
  unint64_t result = qword_26A8C7700;
  if (!qword_26A8C7700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C7700);
  }
  return result;
}

unint64_t sub_260A6D6C8()
{
  unint64_t result = qword_26A8C7708;
  if (!qword_26A8C7708)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A8C76D8);
    sub_260A6D8E0(&qword_26A8C7710, MEMORY[0x263F843C0]);
    sub_260A6D9C8(&qword_26A8C67E0, MEMORY[0x270FA92A8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C7708);
  }
  return result;
}

uint64_t sub_260A6D78C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_260A6D7D0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_260A6D818()
{
  return sub_260A6B738(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_260A6D824@<X0>(void *a1@<X8>)
{
  return sub_2609418BC(v1, a1);
}

unint64_t sub_260A6D840()
{
  unint64_t result = qword_26A8C7718;
  if (!qword_26A8C7718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C7718);
  }
  return result;
}

uint64_t sub_260A6D894()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_260A6D8D4()
{
  return sub_260A6B8CC(v0[2], v0[3], v0[4]);
}

uint64_t sub_260A6D8E0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_260A6D928()
{
  return sub_260A6B08C(v0);
}

uint64_t sub_260A6D930(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_260A6D974()
{
  unint64_t result = qword_26A8C7720;
  if (!qword_26A8C7720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C7720);
  }
  return result;
}

uint64_t sub_260A6D9C8(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *storeEnumTagSinglePayload for NotificationGroupPersistenceManager.Root.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x260A6DADCLL);
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

ValueMetadata *type metadata accessor for NotificationGroupPersistenceManager.Root.CodingKeys()
{
  return &type metadata for NotificationGroupPersistenceManager.Root.CodingKeys;
}

uint64_t _s21UserNotificationsCore35NotificationGroupPersistenceManagerC7SectionVwxx_0()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s21UserNotificationsCore35NotificationGroupPersistenceManagerC7SectionVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *_s21UserNotificationsCore35NotificationGroupPersistenceManagerC7SectionVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s21UserNotificationsCore35NotificationGroupPersistenceManagerC7SectionVwta_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s21UserNotificationsCore35NotificationGroupPersistenceManagerC7SectionVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_260A6DC88(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NotificationGroupPersistenceManager.Section()
{
  return &type metadata for NotificationGroupPersistenceManager.Section;
}

unint64_t sub_260A6DCDC()
{
  unint64_t result = qword_26A8C7728;
  if (!qword_26A8C7728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C7728);
  }
  return result;
}

unint64_t sub_260A6DD34()
{
  unint64_t result = qword_26A8C7730;
  if (!qword_26A8C7730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C7730);
  }
  return result;
}

unint64_t sub_260A6DD8C()
{
  unint64_t result = qword_26A8C7738;
  if (!qword_26A8C7738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C7738);
  }
  return result;
}

uint64_t sub_260A6DDE0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_260A857A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x8000000260AA4A50)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_260A857A0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_260A6DEB8(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C7740);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_260A6E0DC();
  sub_260A85900();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v9[31] = 0;
    uint64_t v7 = sub_260A85670();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C7750);
    v9[15] = 1;
    sub_260A6E130();
    swift_bridgeObjectRetain();
    sub_260A856A0();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_260A6E0DC()
{
  unint64_t result = qword_26A8C7748;
  if (!qword_26A8C7748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C7748);
  }
  return result;
}

unint64_t sub_260A6E130()
{
  unint64_t result = qword_26A8C7758;
  if (!qword_26A8C7758)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A8C7750);
    sub_260A6E1E4(&qword_26A8C7760, &qword_26A8C76E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C7758);
  }
  return result;
}

uint64_t sub_260A6E1E4(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A8C7768);
    sub_260A6D8E0(a2, MEMORY[0x263F843C0]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_260A6E278()
{
  unint64_t result = qword_26A8C7778;
  if (!qword_26A8C7778)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A8C7750);
    sub_260A6E1E4(&qword_26A8C7780, &qword_26A8C7710);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C7778);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for NotificationGroupPersistenceManager.Section.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x260A6E3F8);
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

ValueMetadata *type metadata accessor for NotificationGroupPersistenceManager.Section.CodingKeys()
{
  return &type metadata for NotificationGroupPersistenceManager.Section.CodingKeys;
}

unint64_t sub_260A6E434()
{
  unint64_t result = qword_26A8C7788;
  if (!qword_26A8C7788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C7788);
  }
  return result;
}

unint64_t sub_260A6E48C()
{
  unint64_t result = qword_26A8C7790;
  if (!qword_26A8C7790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C7790);
  }
  return result;
}

unint64_t sub_260A6E4E4()
{
  unint64_t result = qword_26A8C7798;
  if (!qword_26A8C7798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C7798);
  }
  return result;
}

uint64_t sub_260A6E548(uint64_t (*a1)(uint64_t *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62) {
    goto LABEL_14;
  }
  uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v7 = 0;
  if (v6)
  {
    while (1)
    {
      if ((a3 & 0xC000000000000001) != 0)
      {
        uint64_t v8 = MEMORY[0x261221360](v7, a3);
      }
      else
      {
        uint64_t v8 = *(void *)(a3 + 8 * v7 + 32);
        swift_retain();
      }
      uint64_t v12 = v8;
      char v9 = a1(&v12);
      swift_release();
      if (v3 || (v9 & 1) != 0) {
        break;
      }
      uint64_t v10 = v7 + 1;
      if (__OFADD__(v7, 1))
      {
        __break(1u);
LABEL_14:
        swift_bridgeObjectRetain();
        uint64_t v6 = sub_260A855D0();
        swift_bridgeObjectRelease();
        uint64_t v7 = 0;
        if (!v6) {
          return v7;
        }
      }
      else
      {
        ++v7;
        if (v10 == v6) {
          return 0;
        }
      }
    }
  }
  return v7;
}

uint64_t NotificationPipelineFactory.create(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_260A6EE10(a1, 0, a2, a3);
}

uint64_t sub_260A6E67C()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3FD160);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_260A8D2D0;
  type metadata accessor for SpotlightIndexer();
  uint64_t v1 = swift_allocObject();
  if (qword_26A8C49D8 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_26A8D45E0;
  swift_retain();
  uint64_t v3 = sub_260A748C0(v1, v2);
  swift_release();
  uint64_t v4 = type metadata accessor for IntelligenceActor();
  uint64_t v5 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v5 + 112) = v3;
  *(unsigned char *)(v5 + 120) = 1;
  *(void *)(v0 + 56) = v4;
  *(void *)(v0 + 64) = &off_270CB0948;
  *(void *)(v0 + 32) = v5;
  uint64_t v6 = type metadata accessor for BehaviorResolutionActor();
  uint64_t v7 = swift_allocObject();
  *(void *)(v0 + 96) = v6;
  *(void *)(v0 + 104) = &off_270CB1AB0;
  *(void *)(v0 + 72) = v7;
  type metadata accessor for NotificationPipelineFactory();
  uint64_t v8 = swift_allocObject();
  uint64_t result = sub_260A6E828((void *)v0, 1, 0, 0);
  qword_26B3F7230 = v8;
  return result;
}

uint64_t static NotificationPipelineFactory.shared.getter()
{
  if (qword_26B3F7218 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t sub_260A6E828(void *a1, int a2, int a3, char a4)
{
  int v37 = a3;
  int v38 = a2;
  sub_260943364();
  uint64_t v7 = sub_260A84A10();
  MEMORY[0x270FA5388](v7 - 8);
  sub_260A849E0();
  uint64_t v8 = sub_260A85070();
  MEMORY[0x270FA5388](v8);
  *(void *)&long long v41 = MEMORY[0x263F8EE78];
  sub_2608E316C((unint64_t *)&qword_26B3FDF30, MEMORY[0x270FCDB90]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3FDF20);
  sub_2608E32DC((unint64_t *)&qword_26B3FE040, (uint64_t *)&unk_26B3FDF20);
  sub_260A85300();
  uint64_t v9 = sub_260A850C0();
  MEMORY[0x270FA5388](v9);
  (*(void (**)(char *, void))(v11 + 104))((char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x263F8F128]);
  uint64_t v12 = sub_260A85100();
  uint64_t v39 = v4;
  *(void *)(v4 + 16) = v12;
  if (a4)
  {
    uint64_t v13 = type metadata accessor for NotificationPipelineStepDebugActor();
    uint64_t v14 = swift_allocObject();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      a1 = sub_2609A9F80(0, a1[2] + 1, 1, a1);
    }
    unint64_t v16 = a1[2];
    unint64_t v15 = a1[3];
    if (v16 >= v15 >> 1) {
      a1 = sub_2609A9F80((void *)(v15 > 1), v16 + 1, 1, a1);
    }
    uint64_t v42 = v13;
    v43 = &off_270CB3098;
    *(void *)&long long v41 = v14;
    a1[2] = v16 + 1;
    sub_260947504(&v41, (uint64_t)&a1[5 * v16 + 4]);
  }
  int64_t v17 = a1[2];
  uint64_t v18 = MEMORY[0x263F8EE78];
  if (v17)
  {
    uint64_t v44 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_2609D6500(0, v17, 0);
    uint64_t v19 = (uint64_t)(a1 + 4);
    do
    {
      sub_26093FF24(v19, (uint64_t)&v41);
      sub_26093FF24((uint64_t)&v41, (uint64_t)v40);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B3FD0D8);
      uint64_t v20 = sub_260A84C20();
      uint64_t v22 = v21;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v41);
      uint64_t v18 = v44;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2609D6500(0, *(void *)(v18 + 16) + 1, 1);
        uint64_t v18 = v44;
      }
      unint64_t v24 = *(void *)(v18 + 16);
      unint64_t v23 = *(void *)(v18 + 24);
      if (v24 >= v23 >> 1)
      {
        sub_2609D6500(v23 > 1, v24 + 1, 1);
        uint64_t v18 = v44;
      }
      *(void *)(v18 + 16) = v24 + 1;
      uint64_t v25 = v18 + 16 * v24;
      *(void *)(v25 + 32) = v20;
      *(void *)(v25 + 40) = v22;
      v19 += 40;
      --v17;
    }
    while (v17);
    swift_bridgeObjectRelease();
  }
  *(void *)&long long v41 = v18;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3FDF10);
  sub_2608E32DC((unint64_t *)&qword_26B3FC880, (uint64_t *)&unk_26B3FDF10);
  uint64_t v26 = sub_260A84B70();
  unint64_t v28 = v27;
  swift_bridgeObjectRelease();
  if (qword_26B3FC878 != -1) {
    swift_once();
  }
  uint64_t v29 = sub_260A84790();
  __swift_project_value_buffer(v29, (uint64_t)qword_26B402498);
  swift_bridgeObjectRetain();
  v30 = sub_260A84770();
  os_log_type_t v31 = sub_260A84FF0();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    *(void *)&long long v41 = v33;
    *(_DWORD *)v32 = 136315138;
    swift_bridgeObjectRetain();
    v40[0] = sub_2608E5414(v26, v28, (uint64_t *)&v41);
    sub_260A85240();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2608DB000, v30, v31, "Init notification pipeline factory with actors: %s", v32, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261222810](v33, -1, -1);
    MEMORY[0x261222810](v32, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v34 = v39;
  *(void *)(v39 + 24) = a1;
  type metadata accessor for NotificationPipelineScheduler();
  swift_allocObject();
  *(void *)(v34 + 32) = sub_260A6FB28(v37 & 1);
  *(unsigned char *)(v34 + 40) = v38 & 1;
  return v34;
}

uint64_t sub_260A6EE10(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  v47 = (uint64_t *)a3;
  v48 = (uint64_t *)a4;
  int v45 = a2;
  uint64_t v5 = sub_260A840C0();
  uint64_t v44 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_260A84400();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for NotificationPipelineAnalytics.Item(0);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for NotificationPipelineRequestLogger();
  MEMORY[0x270FA5388](v15);
  int64_t v17 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (UNCUsePipeline())
  {
    uint64_t v42 = v7;
    uint64_t v43 = v5;
    uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
    v18(v17, a1, v8);
    uint64_t v19 = *(int *)(v15 + 24);
    *(CFAbsoluteTime *)&v17[v19] = CFAbsoluteTimeGetCurrent();
    int v20 = v45;
    v17[*(int *)(v15 + 20)] = v45;
    uint64_t v21 = v46;
    if (*(unsigned char *)(v46 + 40) == 1)
    {
      v18(v14, a1, v8);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v14, 0, 1, v8);
      uint64_t v22 = sub_26093F0CC((uint64_t)v14, v20, *(void *)(v21 + 24), (uint64_t)v17);
      sub_260A75464((uint64_t)v14, type metadata accessor for NotificationPipelineAnalytics.Item);
    }
    else
    {
      uint64_t v22 = 0;
    }
    v18(v11, a1, v8);
    uint64_t v41 = a1;
    uint64_t v36 = v21;
    uint64_t v37 = *(void *)(v21 + 24);
    type metadata accessor for NotificationPipeline();
    uint64_t v38 = swift_allocObject();
    v18((char *)(v38 + OBJC_IVAR____TtC21UserNotificationsCore20NotificationPipeline_notification), (uint64_t)v11, v8);
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v39 = v42;
    sub_260A84320();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    (*(void (**)(uint64_t, char *, uint64_t))(v44 + 32))(v38 + OBJC_IVAR____TtC21UserNotificationsCore20NotificationPipeline_id, v39, v43);
    *(void *)(v38 + OBJC_IVAR____TtC21UserNotificationsCore20NotificationPipeline_orderedSteps) = v37;
    *(void *)(v38 + OBJC_IVAR____TtC21UserNotificationsCore20NotificationPipeline_analytics) = v22;
    sub_260A6F5C0(v41, v38, v45, (uint64_t)v17, v22, *(void **)(v36 + 16), (uint64_t)v47, (uint64_t)v48);
    swift_release();
    swift_release();
    return sub_260A75464((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for NotificationPipelineRequestLogger);
  }
  else
  {
    uint64_t v46 = *(void *)(v46 + 16);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
    unint64_t v23 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    uint64_t v24 = swift_allocObject();
    uint64_t v25 = (uint64_t)v48;
    *(void *)(v24 + 16) = v47;
    *(void *)(v24 + 24) = v25;
    (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v24 + v23, (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
    aBlock[4] = sub_260A74AF0;
    aBlock[5] = v24;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2608EB0BC;
    aBlock[3] = &block_descriptor_27;
    uint64_t v26 = _Block_copy(aBlock);
    uint64_t v27 = sub_260A84A10();
    v47 = &v40;
    uint64_t v28 = *(void *)(v27 - 8);
    MEMORY[0x270FA5388](v27);
    v30 = (char *)&v40 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
    swift_retain();
    sub_260A849E0();
    uint64_t v31 = sub_260A849B0();
    v48 = &v40;
    uint64_t v32 = *(void *)(v31 - 8);
    MEMORY[0x270FA5388](v31);
    uint64_t v34 = (char *)&v40 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v49 = MEMORY[0x263F8EE78];
    sub_2608E316C((unint64_t *)&qword_26B3FDEF0, MEMORY[0x270FCD9E8]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3FDF00);
    sub_2608E32DC((unint64_t *)&qword_26B3FE030, (uint64_t *)&unk_26B3FDF00);
    sub_260A85300();
    MEMORY[0x261220FB0](0, v30, v34, v26);
    _Block_release(v26);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v34, v31);
    (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v27);
    return swift_release();
  }
}

uint64_t NotificationPipelineFactory.update(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_260A6EE10(a1, 2, a2, a3);
}

uint64_t NotificationPipelineFactory.delete(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_260A6EE10(a1, 3, a2, a3);
}

uint64_t sub_260A6F4CC(void (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3FC8C0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_260A84400();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v7, a3, v8);
  swift_storeEnumTagMultiPayload();
  a1(v7);
  return sub_26093FEC8((uint64_t)v7, (uint64_t *)&unk_26B3FC8C0);
}

uint64_t sub_260A6F5C0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v43 = a2;
  uint64_t v47 = a7;
  uint64_t v48 = a8;
  uint64_t v45 = a5;
  uint64_t v46 = a6;
  int v44 = a3;
  uint64_t v11 = type metadata accessor for NotificationPipelineRequestLogger();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v40 = (uint64_t)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_260A84400();
  uint64_t v14 = *(void *)(v39 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  MEMORY[0x270FA5388](v39);
  uint64_t v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = *(void *)(v8 + 32);
  (*(void (**)(char *, uint64_t))(v14 + 16))(v16, a1);
  uint64_t v41 = type metadata accessor for NotificationPipelineRequestLogger;
  sub_2609C4378(a4, (uint64_t)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for NotificationPipelineRequestLogger);
  unint64_t v17 = (*(unsigned __int8 *)(v14 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  unint64_t v18 = (v15 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v19 = (*(unsigned __int8 *)(v12 + 80) + v18 + 9) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v20 = (v13 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v21 = (v20 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v22 = (v21 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v23 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v23 + v17, v16, v39);
  unint64_t v24 = v23 + v18;
  *(void *)unint64_t v24 = v43;
  *(unsigned char *)(v24 + 8) = v44;
  sub_2609C4310(v40, v23 + v19, (uint64_t (*)(void))v41);
  uint64_t v25 = v46;
  *(void *)(v23 + v20) = v45;
  *(void *)(v23 + v21) = v42;
  *(void *)(v23 + v22) = v25;
  uint64_t v26 = (void *)(v23 + ((v22 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v27 = v48;
  *uint64_t v26 = v47;
  v26[1] = v27;
  aBlock[4] = sub_260A74CFC;
  aBlock[5] = v23;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2608EB0BC;
  aBlock[3] = &block_descriptor_24;
  uint64_t v28 = _Block_copy(aBlock);
  uint64_t v29 = sub_260A84A10();
  uint64_t v30 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v32 = (char *)&v39 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  swift_retain();
  id v33 = v25;
  swift_retain();
  swift_retain();
  sub_260A849E0();
  uint64_t v34 = sub_260A849B0();
  uint64_t v35 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v37 = (char *)&v39 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = MEMORY[0x263F8EE78];
  sub_2608E316C((unint64_t *)&qword_26B3FDEF0, MEMORY[0x270FCD9E8]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3FDF00);
  sub_2608E32DC((unint64_t *)&qword_26B3FE030, (uint64_t *)&unk_26B3FDF00);
  sub_260A85300();
  MEMORY[0x261220FB0](0, v32, v37, v28);
  _Block_release(v28);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v37, v34);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v32, v29);
  return swift_release();
}

uint64_t NotificationPipelineFactory.deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t NotificationPipelineFactory.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for NotificationPipelineFactory()
{
  return self;
}

uint64_t method lookup function for NotificationPipelineFactory(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for NotificationPipelineFactory);
}

uint64_t sub_260A6FB28(char a1)
{
  uint64_t v3 = MEMORY[0x263F8EE78];
  *(void *)(v1 + 16) = MEMORY[0x263F8EE78];
  sub_260943364();
  uint64_t v4 = sub_260A84A10();
  MEMORY[0x270FA5388](v4 - 8);
  sub_260A849E0();
  uint64_t v5 = sub_260A85070();
  MEMORY[0x270FA5388](v5);
  v10[1] = v3;
  sub_2608E316C((unint64_t *)&qword_26B3FDF30, MEMORY[0x270FCDB90]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3FDF20);
  sub_2608E32DC((unint64_t *)&qword_26B3FE040, (uint64_t *)&unk_26B3FDF20);
  sub_260A85300();
  uint64_t v6 = sub_260A850C0();
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, void))(v8 + 104))((char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x263F8F128]);
  *(void *)(v1 + 32) = sub_260A85100();
  *(void *)(v1 + 40) = sub_260961C10(v3);
  *(unsigned char *)(v1 + 24) = a1;
  return v1;
}

uint64_t sub_260A6FD7C(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9)
{
  uint64_t v30 = a8;
  uint64_t v16 = type metadata accessor for NotificationPipelineRequestLogger();
  MEMORY[0x270FA5388](v16 - 8);
  unint64_t v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_260A84400();
  MEMORY[0x270FA5388](v19);
  unint64_t v21 = (char *)&v29 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v22 + 16))(v21, a1);
  sub_2609C4378(a4, (uint64_t)v18, (uint64_t (*)(void))type metadata accessor for NotificationPipelineRequestLogger);
  uint64_t v23 = *(void **)(a6 + 32);
  type metadata accessor for NotificationPipelineScheduler.Request();
  uint64_t v24 = swift_allocObject();
  swift_retain();
  id v25 = v23;
  id v26 = a7;
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v27 = sub_260A74E34((uint64_t)v21, a2, a3, (uint64_t)v18, a5, a6, (uint64_t)v25, (uint64_t)v26, v30, a9, v24);
  swift_release();
  sub_260A6FF78(v27);
  return swift_release();
}

uint64_t sub_260A6FF78(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3FDEE0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (uint64_t)&v68 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = sub_260A840C0();
  uint64_t v7 = *(void *)(v78 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v78);
  uint64_t v10 = (uint64_t)&v68 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (uint64_t *)((char *)&v68 - v11);
  unint64_t v13 = sub_260A84A80();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v80 = v15;
  uint64_t v16 = (uint64_t *)((char *)&v68 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = *(void **)(v1 + 32);
  *uint64_t v16 = (uint64_t)v17;
  unint64_t v18 = *(void (**)(void))(v14 + 104);
  unsigned int v85 = *MEMORY[0x263F8F0E8];
  uint64_t v86 = v14 + 104;
  v84 = (void (*)(uint64_t *, void, unint64_t))v18;
  v18(v16);
  id v79 = v17;
  LOBYTE(v17) = sub_260A84AB0();
  uint64_t v20 = *(void (**)(uint64_t *, unint64_t))(v14 + 8);
  uint64_t v19 = v14 + 8;
  unint64_t v81 = v13;
  v83 = v20;
  v20(v16, v13);
  if ((v17 & 1) == 0) {
    goto LABEL_31;
  }
  if (*(unsigned char *)(a1
                + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_action) != 3)
    goto LABEL_35;
  uint64_t v74 = v6;
  uint64_t v21 = sub_260A84320();
  uint64_t v71 = a1;
  unint64_t v13 = *(void *)(a1
                  + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_channel);
  uint64_t v22 = *(void *)(a1
                  + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_channel
                  + 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v24 = (uint64_t *)((char *)&v68 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v25 = v79;
  *uint64_t v24 = (uint64_t)v79;
  uint64_t v75 = v19;
  unint64_t v26 = v81;
  v84(v24, v85, v81);
  id v27 = v25;
  uint64_t v6 = sub_260A84AB0();
  v83(v24, v26);
  if ((v6 & 1) == 0) {
    goto LABEL_32;
  }
  swift_beginAccess();
  uint64_t v28 = *(void *)(v2 + 40);
  if (!*(void *)(v28 + 16)) {
    goto LABEL_8;
  }
  swift_bridgeObjectRetain();
  unint64_t v29 = sub_260979B64(v13, v22);
  if ((v30 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_8:
    swift_endAccess();
    unint64_t v13 = MEMORY[0x263F8EE78];
    goto LABEL_9;
  }
  unint64_t v31 = *(void *)(*(void *)(v28 + 56) + 8 * v29);
  swift_endAccess();
  swift_bridgeObjectRetain();
  uint64_t v32 = swift_bridgeObjectRelease();
  MEMORY[0x270FA5388](v32);
  *(&v68 - 2) = (uint64_t)v12;
  unint64_t v13 = (unint64_t)sub_2609EBE30((uint64_t (*)(uint64_t *))sub_260A750FC, &v68 - 4, v31);
LABEL_9:
  uint64_t v68 = v10;
  uint64_t v70 = v2;
  uint64_t v69 = v7;
  (*(void (**)(uint64_t *, uint64_t))(v7 + 8))(v12, v78);
  if (v13 >> 62) {
    goto LABEL_33;
  }
  uint64_t v10 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v7 = v80;
  for (unint64_t i = v81; v10; unint64_t i = v81)
  {
    if (v10 < 1) {
      goto LABEL_46;
    }
    uint64_t v12 = 0;
    unint64_t v82 = v13 & 0xC000000000000001;
    unint64_t v76 = 0x8000000260AA4D70;
    uint64_t v72 = MEMORY[0x263F8EE60] + 8;
    unint64_t v73 = v13;
    while (1)
    {
      if (v82)
      {
        uint64_t v34 = MEMORY[0x261221360](v12, v13);
        uint64_t v35 = v34;
      }
      else
      {
        uint64_t v35 = *(void *)(v13 + 8 * (void)v12 + 32);
        uint64_t v34 = swift_retain();
      }
      uint64_t v6 = (uint64_t)&v68;
      MEMORY[0x270FA5388](v34);
      uint64_t v36 = *(void **)(v35
                     + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_queue);
      *(uint64_t *)((char *)&v68 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0)) = (uint64_t)v36;
      v84((uint64_t *)((char *)&v68 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0)), v85, i);
      id v37 = v36;
      LOBYTE(v36) = sub_260A84AB0();
      v83((uint64_t *)((char *)&v68 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0)), i);
      if ((v36 & 1) == 0) {
        break;
      }
      if ((*(unsigned char *)(v35
                     + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_deleted) & 1) == 0)
      {
        *(unsigned char *)(v35
                 + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_deleted) = 1;
        uint64_t v38 = OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_state;
        if (!*(unsigned char *)(v35
                       + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_state))
        {
          sub_26096A430(0xD00000000000001DLL, v76);
          *(unsigned char *)(v35 + v38) = 2;
          uint64_t v39 = *(void *)(v35
                          + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_analytics);
          if (v39)
          {
            uint64_t v40 = sub_260A84E60();
            uint64_t v41 = *(void *)(v40 - 8);
            uint64_t v42 = v74;
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v41 + 56))(v74, 1, 1, v40);
            uint64_t v43 = swift_allocObject();
            *(void *)(v43 + 16) = 0;
            *(void *)(v43 + 24) = 0;
            *(void *)(v43 + 32) = v39;
            *(unsigned char *)(v43 + 40) = 2;
            int v44 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v41 + 48))(v42, 1, v40);
            swift_retain();
            if (v44 == 1)
            {
              sub_26093FEC8(v42, &qword_26B3FDEE0);
              uint64_t v77 = 0;
            }
            else
            {
              unsigned __int8 v45 = sub_260A84E50();
              (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v42, v40);
              uint64_t v77 = v45;
            }
            unint64_t v13 = v73;
            if (*(void *)(v43 + 16))
            {
              swift_getObjectType();
              swift_unknownObjectRetain();
              uint64_t v46 = sub_260A84DC0();
              uint64_t v48 = v47;
              swift_unknownObjectRelease();
            }
            else
            {
              uint64_t v46 = 0;
              uint64_t v48 = 0;
            }
            unint64_t i = v81;
            uint64_t v49 = swift_allocObject();
            *(void *)(v49 + 16) = &unk_26A8C51C0;
            *(void *)(v49 + 24) = v43;
            if (v48 | v46)
            {
              uint64_t v87 = 0;
              uint64_t v88 = 0;
              uint64_t v89 = v46;
              uint64_t v90 = v48;
            }
            uint64_t v7 = v80;
            swift_task_create();
            swift_release();
          }
        }
      }
      uint64_t v12 = (uint64_t *)((char *)v12 + 1);
      sub_260A70CEC();
      swift_release();
      if ((uint64_t *)v10 == v12) {
        goto LABEL_34;
      }
    }
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_260A855D0();
    swift_bridgeObjectRelease();
    uint64_t v7 = v80;
  }
LABEL_34:
  swift_bridgeObjectRelease();
  a1 = v71;
  sub_260A70CEC();
  uint64_t v2 = v70;
  uint64_t v7 = v69;
  uint64_t v10 = v68;
LABEL_35:
  unint64_t v13 = *(void *)(a1
                  + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_channel);
  uint64_t v6 = *(void *)(a1
                 + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_channel
                 + 8);
  uint64_t v12 = (uint64_t *)(v2 + 40);
  swift_beginAccess();
  uint64_t v50 = *(void *)(v2 + 40);
  uint64_t v51 = *(void *)(v50 + 16);
  swift_bridgeObjectRetain();
  if (!v51)
  {
LABEL_40:
    swift_endAccess();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3FD180);
    uint64_t v58 = swift_allocObject();
    *(_OWORD *)(v58 + 16) = xmmword_260A8DEC0;
    *(void *)(v58 + 32) = a1;
    uint64_t v92 = v58;
    sub_260A84D90();
    uint64_t v59 = v92;
    swift_beginAccess();
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v93 = *v12;
    *uint64_t v12 = 0x8000000000000000;
    sub_260A56DF0(v59, v13, v6, isUniquelyReferenced_nonNull_native);
    uint64_t v57 = v93;
    goto LABEL_41;
  }
  swift_bridgeObjectRetain();
  unint64_t v52 = sub_260979B64(v13, v6);
  if ((v53 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_40;
  }
  uint64_t v93 = *(void *)(*(void *)(v50 + 56) + 8 * v52);
  swift_endAccess();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v54 = swift_retain();
  MEMORY[0x261220C10](v54);
  if (*(void *)((v93 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v93 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    goto LABEL_47;
  }
  while (1)
  {
    sub_260A84DB0();
    sub_260A84D90();
    uint64_t v55 = v93;
    swift_beginAccess();
    char v56 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v91 = *v12;
    *uint64_t v12 = 0x8000000000000000;
    sub_260A56DF0(v55, v13, v6, v56);
    uint64_t v57 = v91;
LABEL_41:
    *uint64_t v12 = v57;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    uint64_t v61 = sub_260A84320();
    uint64_t v12 = &v68;
    MEMORY[0x270FA5388](v61);
    v63 = (uint64_t *)((char *)&v68 - ((v62 + 15) & 0xFFFFFFFFFFFFFFF0));
    v64 = v79;
    uint64_t *v63 = (uint64_t)v79;
    unint64_t v65 = v81;
    v84(v63, v85, v81);
    id v66 = v64;
    LOBYTE(v64) = sub_260A84AB0();
    v83(v63, v65);
    if (v64) {
      break;
    }
    __break(1u);
LABEL_46:
    __break(1u);
LABEL_47:
    sub_260A84DA0();
  }
  sub_260A71CE8(v13, v6);
  sub_260A720C8(v10, v13, v6);
  if (sub_260A72898(v10, v13, v6))
  {
    sub_260A72AD4();
    swift_release();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v10, v78);
}

uint64_t sub_260A70A34(uint64_t a1)
{
  uint64_t v32 = a1;
  uint64_t v2 = sub_260A840C0();
  uint64_t v28 = *(void *)(v2 - 8);
  uint64_t v29 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_260A84A80();
  uint64_t v6 = *(void **)(v5 - 8);
  uint64_t v7 = v6[8];
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  unint64_t v31 = v8;
  uint64_t v9 = (char *)&v25 - v8;
  uint64_t v27 = v1;
  uint64_t v10 = *(void **)(v1 + 32);
  *(uint64_t *)((char *)&v25 - v8) = (uint64_t)v10;
  uint64_t v11 = *MEMORY[0x263F8F0E8];
  char v30 = (void (*)(char *, uint64_t, uint64_t))v6[13];
  v30((char *)&v25 - v8, v11, v5);
  id v12 = v10;
  char v13 = sub_260A84AB0();
  uint64_t v14 = (uint64_t (*)(char *, uint64_t))v6[1];
  uint64_t result = v14(v9, v5);
  if ((v13 & 1) == 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v16 = v32;
  unint64_t v26 = v14;
  uint64_t v17 = v11;
  uint64_t v18 = sub_260A84320();
  uint64_t v25 = (uint64_t)&v25;
  uint64_t v19 = v16
      + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_channel;
  uint64_t v20 = *(void *)(v16
                  + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_channel);
  unint64_t v21 = *(void *)(v19 + 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v25 - v31;
  *(void *)uint64_t v22 = v12;
  v30(v22, v17, v5);
  id v23 = v12;
  char v24 = sub_260A84AB0();
  uint64_t result = v26(v22, v5);
  if ((v24 & 1) == 0)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  sub_260A71CE8(v20, v21);
  sub_260A720C8((uint64_t)v4, v20, v21);
  if (sub_260A72898((uint64_t)v4, v20, v21))
  {
    sub_260A72AD4();
    swift_release();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v4, v29);
}

uint64_t sub_260A70CEC()
{
  uint64_t v1 = type metadata accessor for StepFailure(0);
  uint64_t v89 = *(void *)(v1 - 8);
  uint64_t v2 = *(void *)(v89 + 64);
  uint64_t v3 = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v90 = (uint64_t)&v86 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  v94 = (uint64_t (*)())((char *)&v86 - v4);
  uint64_t v95 = sub_260A84400();
  uint64_t v93 = *(void *)(v95 - 8);
  uint64_t v5 = *(void *)(v93 + 64);
  uint64_t v6 = MEMORY[0x270FA5388](v95);
  uint64_t v88 = (char *)&v86 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v92 = (char *)&v86 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3FD190);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v86 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3FD188);
  v96 = *(uint64_t (**)())(v11 - 8);
  v97 = (uint64_t *)v11;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v91 = (uint64_t)&v86 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v98 = (uint64_t)&v86 - v14;
  uint64_t v15 = type metadata accessor for NotificationPipelineRequestLogger();
  v99 = *(uint64_t **)(v15 - 8);
  uint64_t v16 = v99[8];
  uint64_t v17 = MEMORY[0x270FA5388](v15 - 8);
  v100 = (uint64_t *)((char *)&v86 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v86 - v18;
  uint64_t v20 = sub_260A84A80();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  id v23 = (uint64_t *)((char *)&v86 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  char v24 = *(void **)(v0
                 + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_queue);
  *id v23 = v24;
  (*(void (**)(void *, void, uint64_t))(v21 + 104))(v23, *MEMORY[0x263F8F0E8], v20);
  id v25 = v24;
  LOBYTE(v24) = sub_260A84AB0();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v21 + 8))(v23, v20);
  if ((v24 & 1) == 0)
  {
    __break(1u);
    return result;
  }
  if ((*(unsigned char *)(v0
                 + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_calledCompletion) & 1) == 0)
  {
    uint64_t v27 = v0;
    *(unsigned char *)(v0
             + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_calledCompletion) = 1;
    uint64_t v28 = (uint64_t)v19;
    sub_2609C4378(v0+ OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_logger, (uint64_t)v19, (uint64_t (*)(void))type metadata accessor for NotificationPipelineRequestLogger);
    if (*(unsigned char *)(v0
                  + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_action) == 3)
    {
      uint64_t v98 = *(void *)(v0
                      + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_completionQueue);
      uint64_t v29 = (uint64_t)v100;
      sub_2609C4378((uint64_t)v19, (uint64_t)v100, (uint64_t (*)(void))type metadata accessor for NotificationPipelineRequestLogger);
      unint64_t v30 = (*((unsigned __int8 *)v99 + 80) + 16) & ~(unint64_t)*((unsigned __int8 *)v99 + 80);
      unint64_t v31 = (v16 + v30 + 7) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v32 = swift_allocObject();
      sub_2609C4310(v29, v32 + v30, (uint64_t (*)(void))type metadata accessor for NotificationPipelineRequestLogger);
      *(void *)(v32 + v31) = v27;
      v106 = sub_260A7582C;
      uint64_t v107 = v32;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v103 = 1107296256;
      id v33 = &block_descriptor_56;
    }
    else
    {
      if (*(unsigned char *)(v0
                    + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_deleted) != 1)
      {
        uint64_t v46 = v0
            + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_result;
        swift_beginAccess();
        sub_26093FDFC(v46, (uint64_t)v10, &qword_26B3FD190);
        if ((*((unsigned int (**)(char *, uint64_t, uint64_t *))v96 + 6))(v10, 1, v97) == 1)
        {
          sub_26093FEC8((uint64_t)v10, &qword_26B3FD190);
          sub_26096A294(0xD00000000000003ALL, 0x8000000260AA4D90);
          return sub_260A75464((uint64_t)v19, (uint64_t (*)(void))type metadata accessor for NotificationPipelineRequestLogger);
        }
        uint64_t v47 = v98;
        sub_260A7511C((uint64_t)v10, v98);
        uint64_t v48 = v91;
        sub_26093FDFC(v47, v91, &qword_26B3FD188);
        int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
        uint64_t v87 = v19;
        if (EnumCaseMultiPayload == 1)
        {
          uint64_t v50 = v94;
          sub_2609C4310(v48, (uint64_t)v94, type metadata accessor for StepFailure);
          uint64_t v51 = *(uint64_t **)(v27
                            + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_completionQueue);
          v96 = type metadata accessor for NotificationPipelineRequestLogger;
          v97 = v51;
          uint64_t v52 = (uint64_t)v100;
          sub_2609C4378((uint64_t)v19, (uint64_t)v100, (uint64_t (*)(void))type metadata accessor for NotificationPipelineRequestLogger);
          uint64_t v53 = v90;
          sub_2609C4378((uint64_t)v50, v90, type metadata accessor for StepFailure);
          unint64_t v54 = (*((unsigned __int8 *)v99 + 80) + 16) & ~(unint64_t)*((unsigned __int8 *)v99 + 80);
          unint64_t v55 = (v16 + v54 + 7) & 0xFFFFFFFFFFFFFFF8;
          unint64_t v56 = (*(unsigned __int8 *)(v89 + 80) + v55 + 8) & ~(unint64_t)*(unsigned __int8 *)(v89 + 80);
          uint64_t v57 = swift_allocObject();
          sub_2609C4310(v52, v57 + v54, (uint64_t (*)(void))v96);
          *(void *)(v57 + v55) = v27;
          sub_2609C4310(v53, v57 + v56, type metadata accessor for StepFailure);
          v106 = sub_260A75438;
          uint64_t v107 = v57;
          uint64_t aBlock = MEMORY[0x263EF8330];
          uint64_t v103 = 1107296256;
          v104 = sub_2608EB0BC;
          v105 = &block_descriptor_38;
          uint64_t v58 = _Block_copy(&aBlock);
          uint64_t v59 = sub_260A84A10();
          v100 = &v86;
          uint64_t v60 = *(void *)(v59 - 8);
          MEMORY[0x270FA5388](v59);
          uint64_t v62 = (char *)&v86 - ((v61 + 15) & 0xFFFFFFFFFFFFFFF0);
          swift_retain();
          sub_260A849E0();
          uint64_t v63 = sub_260A849B0();
          v99 = &v86;
          uint64_t v64 = *(void *)(v63 - 8);
          MEMORY[0x270FA5388](v63);
          id v66 = (char *)&v86 - ((v65 + 15) & 0xFFFFFFFFFFFFFFF0);
          uint64_t v101 = MEMORY[0x263F8EE78];
          sub_2608E316C((unint64_t *)&qword_26B3FDEF0, MEMORY[0x270FCD9E8]);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3FDF00);
          sub_2608E32DC((unint64_t *)&qword_26B3FE030, (uint64_t *)&unk_26B3FDF00);
          sub_260A85300();
          MEMORY[0x261220FB0](0, v62, v66, v58);
          _Block_release(v58);
          (*(void (**)(char *, uint64_t))(v64 + 8))(v66, v63);
          (*(void (**)(char *, uint64_t))(v60 + 8))(v62, v59);
          sub_260A75464((uint64_t)v94, type metadata accessor for StepFailure);
        }
        else
        {
          uint64_t v68 = v92;
          uint64_t v67 = v93;
          v96 = *(uint64_t (**)())(v93 + 32);
          uint64_t v69 = v48;
          uint64_t v70 = v95;
          ((void (*)(char *, uint64_t, uint64_t))v96)(v92, v69, v95);
          v97 = *(uint64_t **)(v27
                            + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_completionQueue);
          v94 = type metadata accessor for NotificationPipelineRequestLogger;
          uint64_t v71 = (uint64_t)v100;
          sub_2609C4378((uint64_t)v19, (uint64_t)v100, (uint64_t (*)(void))type metadata accessor for NotificationPipelineRequestLogger);
          uint64_t v72 = v88;
          (*(void (**)(char *, char *, uint64_t))(v67 + 16))(v88, v68, v70);
          unint64_t v73 = (*((unsigned __int8 *)v99 + 80) + 16) & ~(unint64_t)*((unsigned __int8 *)v99 + 80);
          unint64_t v74 = (v16 + v73 + 7) & 0xFFFFFFFFFFFFFFF8;
          unint64_t v75 = (*(unsigned __int8 *)(v67 + 80) + v74 + 8) & ~(unint64_t)*(unsigned __int8 *)(v67 + 80);
          uint64_t v76 = swift_allocObject();
          sub_2609C4310(v71, v76 + v73, (uint64_t (*)(void))v94);
          *(void *)(v76 + v74) = v27;
          ((void (*)(unint64_t, char *, uint64_t))v96)(v76 + v75, v72, v95);
          v106 = sub_260A755F4;
          uint64_t v107 = v76;
          uint64_t aBlock = MEMORY[0x263EF8330];
          uint64_t v103 = 1107296256;
          v104 = sub_2608EB0BC;
          v105 = &block_descriptor_44;
          uint64_t v77 = _Block_copy(&aBlock);
          uint64_t v78 = sub_260A84A10();
          v100 = &v86;
          uint64_t v79 = *(void *)(v78 - 8);
          MEMORY[0x270FA5388](v78);
          unint64_t v81 = (char *)&v86 - ((v80 + 15) & 0xFFFFFFFFFFFFFFF0);
          swift_retain();
          sub_260A849E0();
          uint64_t v82 = sub_260A849B0();
          v99 = &v86;
          uint64_t v83 = *(void *)(v82 - 8);
          MEMORY[0x270FA5388](v82);
          unsigned int v85 = (char *)&v86 - ((v84 + 15) & 0xFFFFFFFFFFFFFFF0);
          uint64_t v101 = MEMORY[0x263F8EE78];
          sub_2608E316C((unint64_t *)&qword_26B3FDEF0, MEMORY[0x270FCD9E8]);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3FDF00);
          sub_2608E32DC((unint64_t *)&qword_26B3FE030, (uint64_t *)&unk_26B3FDF00);
          sub_260A85300();
          MEMORY[0x261220FB0](0, v81, v85, v77);
          _Block_release(v77);
          (*(void (**)(char *, uint64_t))(v83 + 8))(v85, v82);
          (*(void (**)(char *, uint64_t))(v79 + 8))(v81, v78);
          (*(void (**)(char *, uint64_t))(v93 + 8))(v92, v95);
        }
        sub_26093FEC8(v98, &qword_26B3FD188);
        sub_260A75464((uint64_t)v87, (uint64_t (*)(void))type metadata accessor for NotificationPipelineRequestLogger);
        return swift_release();
      }
      uint64_t v98 = *(void *)(v0
                      + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_completionQueue);
      uint64_t v34 = (uint64_t)v100;
      sub_2609C4378((uint64_t)v19, (uint64_t)v100, (uint64_t (*)(void))type metadata accessor for NotificationPipelineRequestLogger);
      unint64_t v35 = (*((unsigned __int8 *)v99 + 80) + 16) & ~(unint64_t)*((unsigned __int8 *)v99 + 80);
      unint64_t v36 = (v16 + v35 + 7) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v37 = swift_allocObject();
      sub_2609C4310(v34, v37 + v35, (uint64_t (*)(void))type metadata accessor for NotificationPipelineRequestLogger);
      *(void *)(v37 + v36) = v27;
      v106 = sub_260A7571C;
      uint64_t v107 = v37;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v103 = 1107296256;
      id v33 = &block_descriptor_50;
    }
    v104 = sub_2608EB0BC;
    v105 = v33;
    uint64_t v38 = _Block_copy(&aBlock);
    v99 = (uint64_t *)sub_260A84A10();
    v100 = &v86;
    uint64_t v39 = *(v99 - 1);
    MEMORY[0x270FA5388](v99);
    uint64_t v41 = (char *)&v86 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
    swift_retain();
    sub_260A849E0();
    uint64_t v42 = sub_260A849B0();
    v97 = &v86;
    uint64_t v43 = *(void *)(v42 - 8);
    MEMORY[0x270FA5388](v42);
    unsigned __int8 v45 = (char *)&v86 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v108 = MEMORY[0x263F8EE78];
    sub_2608E316C((unint64_t *)&qword_26B3FDEF0, MEMORY[0x270FCD9E8]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3FDF00);
    sub_2608E32DC((unint64_t *)&qword_26B3FE030, (uint64_t *)&unk_26B3FDF00);
    sub_260A85300();
    MEMORY[0x261220FB0](0, v41, v45, v38);
    _Block_release(v38);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v45, v42);
    (*(void (**)(char *, uint64_t *))(v39 + 8))(v41, v99);
    sub_260A75464(v28, (uint64_t (*)(void))type metadata accessor for NotificationPipelineRequestLogger);
    return swift_release();
  }
  return result;
}

uint64_t sub_260A71CE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_260A840C0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v30 = v6;
  uint64_t v31 = v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v32 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3FD190);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_260A84A80();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (uint64_t *)((char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = *(void **)(v3 + 32);
  *uint64_t v15 = v16;
  (*(void (**)(void *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x263F8F0E8], v12);
  id v17 = v16;
  LOBYTE(v16) = sub_260A84AB0();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v13 + 8))(v15, v12);
  if (v16)
  {
    uint64_t result = sub_260A72EDC(a1, a2);
    if (result)
    {
      uint64_t v19 = result;
      uint64_t v20 = (unint64_t *)(v3 + 16);
      uint64_t v29 = v31 + 32;
      p_superclass = &OBJC_METACLASS____TtCC21UserNotificationsCore29NotificationPipelineAnalytics13StepAnalytics.superclass;
      do
      {
        if (*(unsigned char *)(v3 + 24) == 1)
        {
          uint64_t v22 = (uint64_t)p_superclass[19] + v19;
          swift_beginAccess();
          sub_26093FDFC(v22, (uint64_t)v11, &qword_26B3FD190);
          uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3FD188);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 48))(v11, 1, v23) == 1)
          {
            sub_26093FEC8((uint64_t)v11, &qword_26B3FD190);
          }
          else
          {
            int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
            sub_26093FEC8((uint64_t)v11, &qword_26B3FD188);
            if (EnumCaseMultiPayload != 1)
            {
              sub_260A84320();
              swift_beginAccess();
              unint64_t v25 = *v20;
              char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
              *uint64_t v20 = v25;
              if ((isUniquelyReferenced_nonNull_native & 1) == 0)
              {
                unint64_t v25 = sub_2609A93C0(0, *(void *)(v25 + 16) + 1, 1, v25);
                *uint64_t v20 = v25;
              }
              unint64_t v28 = *(void *)(v25 + 16);
              unint64_t v27 = *(void *)(v25 + 24);
              if (v28 >= v27 >> 1)
              {
                unint64_t v25 = sub_2609A93C0(v27 > 1, v28 + 1, 1, v25);
                *uint64_t v20 = v25;
              }
              *(void *)(v25 + 16) = v28 + 1;
              (*(void (**)(unint64_t, char *, uint64_t))(v31 + 32))(v25+ ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80))+ *(void *)(v31 + 72) * v28, v32, v30);
              swift_endAccess();
              p_superclass = (__objc2_class **)(&OBJC_METACLASS____TtCC21UserNotificationsCore29NotificationPipelineAnalytics13StepAnalytics
                                              + 8);
            }
          }
        }
        sub_260A70CEC();
        swift_release();
        uint64_t result = sub_260A72EDC(a1, a2);
        uint64_t v19 = result;
      }
      while (result);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_260A720C8(uint64_t a1, uint64_t a2, unint64_t a3)
{
  swift_beginAccess();
  uint64_t v7 = *(void *)(v3 + 40);
  if (*(void *)(v7 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v8 = sub_260979B64(a2, a3);
    if (v9)
    {
      unint64_t v10 = *(void *)(*(void *)(v7 + 56) + 8 * v8);
      swift_endAccess();
      swift_bridgeObjectRetain();
      uint64_t v11 = swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v11 = swift_endAccess();
  unint64_t v10 = MEMORY[0x263F8EE78];
LABEL_6:
  MEMORY[0x270FA5388](v11);
  v40[2] = a1;
  unint64_t v12 = (unint64_t)sub_2609EBE30((uint64_t (*)(uint64_t *))sub_260A761CC, v40, v10);
  unint64_t v13 = v12;
  unint64_t v14 = v12 >> 62;
  if (!(v12 >> 62))
  {
    uint64_t v15 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v15 >= 1) {
      goto LABEL_8;
    }
LABEL_34:
    swift_bridgeObjectRelease();
    if (qword_26B3FC878 == -1) {
      goto LABEL_35;
    }
    goto LABEL_40;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_260A855D0();
  swift_bridgeObjectRelease();
  if (v15 < 1) {
    goto LABEL_34;
  }
LABEL_8:
  uint64_t v43 = 0;
  unint64_t v44 = 0xE000000000000000;
  sub_260A85470();
  swift_bridgeObjectRelease();
  uint64_t v43 = 91;
  unint64_t v44 = 0xE100000000000000;
  swift_bridgeObjectRetain();
  sub_260A84C90();
  swift_bridgeObjectRelease();
  sub_260A84C90();
  uint64_t v42 = v15;
  sub_260A85730();
  sub_260A84C90();
  swift_bridgeObjectRelease();
  sub_260A84C90();
  uint64_t v45 = v43;
  unint64_t v46 = v44;
  if (v14)
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_260A855D0();
    swift_bridgeObjectRelease();
    if (v16) {
      goto LABEL_10;
    }
LABEL_26:
    swift_bridgeObjectRelease();
    sub_260A84C90();
    goto LABEL_27;
  }
  uint64_t v16 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v16) {
    goto LABEL_26;
  }
LABEL_10:
  if (v16 >= 1)
  {
    uint64_t v17 = 0;
    double v18 = 0.0;
    long long v41 = xmmword_260A8E0E0;
    do
    {
      if ((v13 & 0xC000000000000001) != 0)
      {
        uint64_t v23 = MEMORY[0x261221360](v17, v13);
      }
      else
      {
        uint64_t v23 = *(void *)(v13 + 8 * v17 + 32);
        swift_retain();
      }
      sub_260A842A0();
      char v24 = (void *)sub_260A84BB0();
      swift_bridgeObjectRelease();
      id v25 = objc_msgSend(v24, sel_un_logDigest);

      if (v25)
      {
        sub_260A84BC0();
      }
      ++v17;
      double Current = CFAbsoluteTimeGetCurrent();
      double v20 = *(double *)(v23
                      + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_createTime);
      double v21 = Current - v20;
      if (v18 < Current - v20) {
        double v18 = Current - v20;
      }
      uint64_t v43 = 0;
      unint64_t v44 = 0xE000000000000000;
      sub_260A85470();
      sub_260A84C90();
      sub_260A84C90();
      swift_bridgeObjectRelease();
      sub_260A84C90();
      LOBYTE(v42) = *(unsigned char *)(v23
                             + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_action);
      sub_260A855A0();
      sub_260A84C90();
      LOBYTE(v42) = *(unsigned char *)(v23
                             + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_state);
      sub_260A855A0();
      sub_260A84C90();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3FD170);
      uint64_t v22 = swift_allocObject();
      *(_OWORD *)(v22 + 16) = v41;
      *(void *)(v22 + 56) = MEMORY[0x263F8D538];
      *(void *)(v22 + 64) = MEMORY[0x263F8D5B8];
      *(double *)(v22 + 32) = v21;
      sub_260A84BF0();
      sub_260A84C90();
      swift_bridgeObjectRelease();
      sub_260A84C90();
      sub_260A84C90();
      swift_release();
      swift_bridgeObjectRelease();
    }
    while (v16 != v17);
    swift_bridgeObjectRelease();
    sub_260A84C90();
    if (v18 >= 12.0)
    {
      if (qword_26B3FC878 != -1) {
        swift_once();
      }
      uint64_t v26 = sub_260A84790();
      __swift_project_value_buffer(v26, (uint64_t)qword_26B402498);
      uint64_t v28 = v45;
      unint64_t v27 = v46;
      swift_bridgeObjectRetain();
      uint64_t v29 = sub_260A84770();
      os_log_type_t v30 = sub_260A85010();
      goto LABEL_30;
    }
LABEL_27:
    if (qword_26B3FC878 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_260A84790();
    __swift_project_value_buffer(v31, (uint64_t)qword_26B402498);
    uint64_t v28 = v45;
    unint64_t v27 = v46;
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_260A84770();
    os_log_type_t v30 = sub_260A85030();
LABEL_30:
    os_log_type_t v32 = v30;
    if (os_log_type_enabled(v29, v30))
    {
      id v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      uint64_t v43 = v34;
      *(_DWORD *)id v33 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v42 = sub_2608E5414(v28, v27, &v43);
      sub_260A85240();
      swift_bridgeObjectRelease_n();
      unint64_t v35 = "%s";
      unint64_t v36 = v29;
      os_log_type_t v37 = v32;
LABEL_37:
      _os_log_impl(&dword_2608DB000, v36, v37, v35, v33, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261222810](v34, -1, -1);
      MEMORY[0x261222810](v33, -1, -1);

      return;
    }
    goto LABEL_38;
  }
  __break(1u);
LABEL_40:
  swift_once();
LABEL_35:
  uint64_t v38 = sub_260A84790();
  __swift_project_value_buffer(v38, (uint64_t)qword_26B402498);
  swift_bridgeObjectRetain_n();
  uint64_t v29 = sub_260A84770();
  os_log_type_t v39 = sub_260A85030();
  if (os_log_type_enabled(v29, v39))
  {
    id v33 = (uint8_t *)swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    uint64_t v45 = v34;
    *(_DWORD *)id v33 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v43 = sub_2608E5414(a2, a3, &v45);
    sub_260A85240();
    swift_bridgeObjectRelease_n();
    unint64_t v35 = "[%s]] No scheduled requests";
    unint64_t v36 = v29;
    os_log_type_t v37 = v39;
    goto LABEL_37;
  }
LABEL_38:

  swift_bridgeObjectRelease_n();
}

unint64_t sub_260A72898(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_260A84A80();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  unint64_t v10 = (uint64_t *)((char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = *(void **)(v3 + 32);
  *unint64_t v10 = v11;
  (*(void (**)(void *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F8F0E8], v7);
  id v12 = v11;
  LOBYTE(v11) = sub_260A84AB0();
  unint64_t result = (*(uint64_t (**)(void *, uint64_t))(v8 + 8))(v10, v7);
  if ((v11 & 1) == 0)
  {
    __break(1u);
    goto LABEL_16;
  }
  swift_beginAccess();
  uint64_t v14 = *(void *)(v3 + 40);
  if (!*(void *)(v14 + 16)) {
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  unint64_t v15 = sub_260979B64(a2, a3);
  if ((v16 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_11:
    swift_endAccess();
    return 0;
  }
  unint64_t v3 = *(void *)(*(void *)(v14 + 56) + 8 * v15);
  swift_endAccess();
  swift_bridgeObjectRetain();
  uint64_t v17 = swift_bridgeObjectRelease();
  MEMORY[0x270FA5388](v17);
  *(&v20 - 2) = a1;
  unint64_t result = sub_260A6E548((uint64_t (*)(uint64_t *))sub_260A761AC, (uint64_t)(&v20 - 4), v3);
  if (v18)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((v3 & 0xC000000000000001) != 0)
  {
LABEL_16:
    uint64_t v19 = MEMORY[0x261221360](result, v3);
    goto LABEL_9;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v19 = *(void *)(v3 + 8 * result + 32);
    swift_retain();
LABEL_9:
    swift_bridgeObjectRelease();
    return v19;
  }
  __break(1u);
  return result;
}

uint64_t sub_260A72AD4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for NotificationPipelineRequestLogger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_260A84A80();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (void *)((char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v10 = *(void **)(v1
                 + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_queue);
  *uint64_t v9 = v10;
  (*(void (**)(void *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F8F0E8], v6);
  id v11 = v10;
  LOBYTE(v10) = sub_260A84AB0();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v7 + 8))(v9, v6);
  if (v10)
  {
    if (!*(unsigned char *)(v1
                   + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_state))
    {
      *(unsigned char *)(v1
               + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_state) = 1;
      uint64_t v13 = *(void *)(v1
                      + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_analytics);
      uint64_t v14 = v1
          + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_logger;
      sub_26096A430(0xD000000000000011, 0x8000000260AA4ED0);
      v20[1] = *(void *)(v1
                         + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_pipeline);
      int v15 = *(unsigned __int8 *)(v1
                               + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_action);
      uint64_t v16 = swift_allocObject();
      swift_weakInit();
      sub_2609C4378(v14, (uint64_t)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for NotificationPipelineRequestLogger);
      unint64_t v17 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
      unint64_t v18 = (v4 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v19 = swift_allocObject();
      sub_2609C4310((uint64_t)v5, v19 + v17, (uint64_t (*)(void))type metadata accessor for NotificationPipelineRequestLogger);
      *(void *)(v19 + v18) = v16;
      *(void *)(v19 + ((v18 + 15) & 0xFFFFFFFFFFFFFFF8)) = v13;
      swift_retain();
      swift_retain();
      sub_2609C1D20(v15, v14, 0, sub_260A75A68, v19);
      swift_release();
      return swift_release();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

BOOL sub_260A72DBC(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = sub_260A840C0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *a1;
  sub_260A84320();
  LOBYTE(a1) = MEMORY[0x26121FF60](v7, a2);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (a1 & 1) != 0
      && *(unsigned char *)(v8
                  + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_state) != 2;
}

uint64_t sub_260A72EDC(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = (uint64_t *)sub_260A84A80();
  uint64_t v7 = *(v6 - 1);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (uint64_t *)((char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = *(void **)(v2 + 32);
  *uint64_t v9 = v10;
  (*(void (**)(void *, void, uint64_t *))(v7 + 104))(v9, *MEMORY[0x263F8F0E8], v6);
  id v11 = v10;
  uint64_t v12 = sub_260A84AB0();
  (*(void (**)(void *, uint64_t *))(v7 + 8))(v9, v6);
  if (v12)
  {
    uint64_t v6 = (uint64_t *)(v2 + 40);
    swift_beginAccess();
    uint64_t v14 = *(void *)(v2 + 40);
    if (!*(void *)(v14 + 16))
    {
LABEL_14:
      swift_endAccess();
      return 0;
    }
    swift_bridgeObjectRetain();
    unint64_t v15 = sub_260979B64(a1, a2);
    if ((v16 & 1) == 0)
    {
LABEL_13:
      swift_bridgeObjectRelease();
      goto LABEL_14;
    }
    uint64_t v2 = *(void *)(*(void *)(v14 + 56) + 8 * v15);
    unint64_t v25 = v2;
    swift_endAccess();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v13 = v2 & 0xFFFFFFFFFFFFFF8;
    unint64_t v3 = (unint64_t)v2 >> 62;
    if (!((unint64_t)v2 >> 62))
    {
      uint64_t v17 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v17) {
        goto LABEL_6;
      }
LABEL_35:
      swift_bridgeObjectRelease_n();
      return 0;
    }
  }
  else
  {
    __break(1u);
  }
  if (v2 < 0) {
    uint64_t v17 = v2;
  }
  else {
    uint64_t v17 = v13;
  }
  swift_bridgeObjectRetain();
  if (!sub_260A855D0()) {
    goto LABEL_35;
  }
LABEL_6:
  if ((v2 & 0xC000000000000001) != 0)
  {
    uint64_t v17 = MEMORY[0x261221360](0, v2);
  }
  else
  {
    if (!*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_38;
    }
    uint64_t v17 = *(void *)(v2 + 32);
    swift_retain();
  }
  uint64_t result = swift_bridgeObjectRelease();
  if (*(unsigned char *)(v17
                + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_state) != 2)
  {
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  if (!v3)
  {
    if (!*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_13;
    }
    goto LABEL_20;
  }
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_260A855D0();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v19)
  {
    __break(1u);
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_260A855D0();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v12)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
LABEL_20:
  if ((v2 & 0xC000000000000001) != 0)
  {
    uint64_t result = MEMORY[0x261221360](0, v2);
    if (!v3)
    {
LABEL_22:
      uint64_t v20 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_26;
    }
LABEL_25:
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_260A855D0();
    uint64_t result = swift_bridgeObjectRelease();
LABEL_26:
    if (v20)
    {
      sub_260A26594(0, 1);
      swift_release();
      uint64_t v12 = v25;
      if (!(v25 >> 62))
      {
        if (*(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
LABEL_29:
          swift_beginAccess();
          swift_bridgeObjectRetain();
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v24 = *v6;
          uint64_t *v6 = 0x8000000000000000;
          sub_260A56DF0(v12, a1, a2, isUniquelyReferenced_nonNull_native);
          uint64_t *v6 = v24;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_endAccess();
          return v17;
        }
LABEL_40:
        swift_bridgeObjectRelease();
        swift_beginAccess();
        swift_bridgeObjectRetain();
        sub_260A2B6D0(a1, a2);
        swift_endAccess();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v17;
      }
LABEL_39:
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_260A855D0();
      swift_bridgeObjectRelease();
      if (v22) {
        goto LABEL_29;
      }
      goto LABEL_40;
    }
    goto LABEL_42;
  }
  if (*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t result = swift_retain();
    if (!v3) {
      goto LABEL_22;
    }
    goto LABEL_25;
  }
LABEL_43:
  __break(1u);
  return result;
}

uint64_t sub_260A73324(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_260A840C0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260A84320();
  char v7 = MEMORY[0x26121FF60](v6, a2);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7 & 1;
}

uint64_t sub_260A73420()
{
  return sub_260A858A0();
}

uint64_t sub_260A7347C()
{
  swift_bridgeObjectRetain();
  sub_260A84C60();

  return swift_bridgeObjectRelease();
}

uint64_t sub_260A734D4()
{
  return sub_260A858A0();
}

void sub_260A7352C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for NotificationPipelineRequestLogger();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3FD188);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_26096A430(0xD000000000000012, 0x8000000260AA4EF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v15 = Strong;
    uint64_t v31 = *(void *)(Strong
                    + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_queue);
    sub_26093FDFC(a1, (uint64_t)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_26B3FD188);
    sub_2609C4378(a2, (uint64_t)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for NotificationPipelineRequestLogger);
    unint64_t v16 = (*(unsigned __int8 *)(v11 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    unint64_t v17 = (v12 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v18 = (*(unsigned __int8 *)(v8 + 80) + v17 + 8) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v15;
    sub_260A7511C((uint64_t)v13, v19 + v16);
    *(void *)(v19 + v17) = a4;
    sub_2609C4310((uint64_t)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v19 + v18, (uint64_t (*)(void))type metadata accessor for NotificationPipelineRequestLogger);
    aBlock[4] = sub_260A76060;
    aBlock[5] = v19;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2608EB0BC;
    aBlock[3] = &block_descriptor_68;
    uint64_t v20 = _Block_copy(aBlock);
    uint64_t v29 = sub_260A84A10();
    os_log_type_t v30 = &v28;
    uint64_t v21 = *(void *)(v29 - 8);
    MEMORY[0x270FA5388](v29);
    uint64_t v23 = (char *)&v28 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
    swift_retain();
    swift_retain();
    sub_260A849E0();
    uint64_t v24 = sub_260A849B0();
    uint64_t v28 = (uint64_t)&v28;
    uint64_t v25 = *(void *)(v24 - 8);
    MEMORY[0x270FA5388](v24);
    unint64_t v27 = (char *)&v28 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v32 = MEMORY[0x263F8EE78];
    sub_2608E316C((unint64_t *)&qword_26B3FDEF0, MEMORY[0x270FCD9E8]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3FDF00);
    sub_2608E32DC((unint64_t *)&qword_26B3FE030, (uint64_t *)&unk_26B3FDF00);
    sub_260A85300();
    MEMORY[0x261220FB0](0, v23, v27, v20);
    _Block_release(v20);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v29);
    swift_release();
    swift_release();
  }
  else
  {
    sub_26096A448(0xD000000000000026, 0x8000000260AA4F10);
    if (a4) {
      sub_26093A954(1);
    }
  }
}

uint64_t sub_260A739F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3FD190);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3FD188);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_state;
  if (*(unsigned char *)(a1
                + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_state) == 1)
  {
    sub_26093FDFC(a2, (uint64_t)v12, &qword_26B3FD188);
    if (a3)
    {
      char v14 = swift_getEnumCaseMultiPayload() == 1;
      sub_26093A954(v14);
    }
    sub_26093FEC8((uint64_t)v12, &qword_26B3FD188);
    *(unsigned char *)(a1 + v13) = 2;
    sub_26093FDFC(a2, (uint64_t)v8, &qword_26B3FD188);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
    uint64_t v15 = a1
        + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_result;
    swift_beginAccess();
    sub_260A76144((uint64_t)v8, v15);
    swift_endAccess();
  }
  sub_26096A430(0xD000000000000024, 0x8000000260AA4F40);
  uint64_t result = MEMORY[0x261222930](a1+ OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_delegate);
  if (result)
  {
    sub_260A70A34(a1);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_260A73C1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3FC8C0);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_26096A430(0xD000000000000038, 0x8000000260AA4DD0);
  uint64_t v6 = *(void (**)(char *))(a2
                                     + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_completion);
  uint64_t v7 = a2
     + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_initialNotification;
  uint64_t v8 = sub_260A84400();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v5, v7, v8);
  swift_storeEnumTagMultiPayload();
  v6(v5);
  return sub_26093FEC8((uint64_t)v5, (uint64_t *)&unk_26B3FC8C0);
}

uint64_t sub_260A73D44(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3FC8C0);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (uint64_t *)((char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_26096A430(0xD00000000000003ALL, 0x8000000260AA4E10);
  uint64_t v6 = *(void (**)(uint64_t *))(a2
                                        + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_completion);
  sub_260A84DF0();
  sub_260A758E4(&qword_26A8C77A8, MEMORY[0x263F8F488]);
  uint64_t v7 = swift_allocError();
  sub_260A84B10();
  *uint64_t v5 = v7;
  swift_storeEnumTagMultiPayload();
  v6(v5);
  return sub_26093FEC8((uint64_t)v5, (uint64_t *)&unk_26B3FC8C0);
}

uint64_t sub_260A73E88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3FC8C0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_26096A430(0xD000000000000031, 0x8000000260AA4E50);
  uint64_t v8 = *(void (**)(char *))(a2
                                     + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_completion);
  uint64_t v9 = sub_260A84400();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v7, a3, v9);
  swift_storeEnumTagMultiPayload();
  v8(v7);
  return sub_26093FEC8((uint64_t)v7, (uint64_t *)&unk_26B3FC8C0);
}

uint64_t sub_260A73FA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3FC8C0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (uint64_t *)((char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_26096A430(0xD000000000000031, 0x8000000260AA4E90);
  uint64_t v8 = *(void (**)(uint64_t *))(a2
                                        + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_completion);
  type metadata accessor for StepFailure(0);
  sub_260A758E4(&qword_26A8C77B0, (void (*)(uint64_t))type metadata accessor for StepFailure);
  uint64_t v9 = swift_allocError();
  sub_2609C4378(a3, v10, type metadata accessor for StepFailure);
  *uint64_t v7 = v9;
  swift_storeEnumTagMultiPayload();
  v8(v7);
  return sub_26093FEC8((uint64_t)v7, (uint64_t *)&unk_26B3FC8C0);
}

uint64_t sub_260A7410C()
{
  uint64_t v1 = sub_260A840C0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v6[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = 0;
  unint64_t v8 = 0xE000000000000000;
  sub_260A85470();
  sub_260A84C90();
  sub_260A84320();
  sub_260A758E4(&qword_26B3F7D40, MEMORY[0x263F843C0]);
  sub_260A85730();
  sub_260A84C90();
  swift_bridgeObjectRelease();
  (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
  sub_260A84C90();
  v6[15] = *(unsigned char *)(v0
                    + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_action);
  sub_260A855A0();
  sub_260A84C90();
  return v7;
}

uint64_t sub_260A742D8()
{
  uint64_t v1 = v0
     + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_initialNotification;
  uint64_t v2 = sub_260A84400();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_bridgeObjectRelease();
  sub_260A75464(v0+ OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_logger, (uint64_t (*)(void))type metadata accessor for NotificationPipelineRequestLogger);
  sub_26093FEC8(v0+ OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_result, &qword_26B3FD190);
  swift_release();
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_queue));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_completionQueue));
  swift_release();
  sub_26094056C(v0+ OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_delegate);
  return v0;
}

uint64_t sub_260A743F0()
{
  sub_260A742D8();

  return swift_deallocClassInstance();
}

uint64_t sub_260A74444()
{
  return sub_260A7410C();
}

uint64_t sub_260A74468()
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for NotificationPipelineScheduler()
{
  return self;
}

uint64_t sub_260A744D4()
{
  return type metadata accessor for NotificationPipelineScheduler.Request();
}

uint64_t type metadata accessor for NotificationPipelineScheduler.Request()
{
  uint64_t result = qword_26B3FD0C8;
  if (!qword_26B3FD0C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_260A74528()
{
  sub_260A84400();
  if (v0 <= 0x3F)
  {
    type metadata accessor for NotificationPipelineRequestLogger();
    if (v1 <= 0x3F)
    {
      sub_260A746A0();
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_260A746A0()
{
  if (!qword_26B3FD198)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B3FD188);
    unint64_t v0 = sub_260A85230();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B3FD198);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for NotificationPipelineScheduler.Request.State(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x260A747C8);
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

ValueMetadata *type metadata accessor for NotificationPipelineScheduler.Request.State()
{
  return &type metadata for NotificationPipelineScheduler.Request.State;
}

ValueMetadata *type metadata accessor for NotificationPipelineScheduler.Channel()
{
  return &type metadata for NotificationPipelineScheduler.Channel;
}

unint64_t sub_260A74814()
{
  unint64_t result = qword_26B3FD048;
  if (!qword_26B3FD048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3FD048);
  }
  return result;
}

unint64_t sub_260A7486C()
{
  unint64_t result = qword_26A8C77A0;
  if (!qword_26A8C77A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C77A0);
  }
  return result;
}

uint64_t sub_260A748C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SpotlightIndexer();
  v13[3] = v4;
  v13[4] = &off_270CB0888;
  v13[0] = a1;
  type metadata accessor for NotificationInferenceClient();
  uint64_t v5 = swift_allocObject();
  uint64_t v6 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v13, v4);
  MEMORY[0x270FA5388](v6);
  unint64_t v8 = (void *)((char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v9 + 16))(v8);
  uint64_t v10 = *v8;
  v12[3] = v4;
  v12[4] = &off_270CB0888;
  v12[0] = v10;
  swift_defaultActor_initialize();
  *(void *)(v5 + 152) = MEMORY[0x263F8EE80];
  *(double *)(v5 + 160) = sub_260A64C24();
  sub_26093FF24((uint64_t)v12, v5 + 112);
  *(void *)(a2 + 16) = v5;
  swift_retain();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  return v5;
}

uint64_t sub_260A74A24()
{
  uint64_t v1 = sub_260A84400();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_260A74AF0()
{
  uint64_t v1 = *(void *)(sub_260A84400() - 8);
  uint64_t v2 = *(void (**)(char *))(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_260A6F4CC(v2, v3, v4);
}

uint64_t sub_260A74B54()
{
  uint64_t v1 = sub_260A84400();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  unint64_t v5 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = *(void *)(type metadata accessor for NotificationPipelineRequestLogger() - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v5 + v7 + 9) & ~v7;
  uint64_t v9 = v3 | v7 | 7;
  unint64_t v10 = (((((*(void *)(v6 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v14 = v9;
  uint64_t v11 = v0 + v4;
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v12(v11, v1);
  swift_release();
  v12(v0 + v8, v1);
  swift_release();
  swift_release();

  swift_release();

  return MEMORY[0x270FA0238](v0, ((v10 + 15) & 0xFFFFFFFFFFFFFFF8) + 16, v14);
}

uint64_t sub_260A74CFC()
{
  uint64_t v1 = *(void *)(sub_260A84400() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v4 = *(void *)(type metadata accessor for NotificationPipelineRequestLogger() - 8);
  unint64_t v5 = (v3 + *(unsigned __int8 *)(v4 + 80) + 9) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  return sub_260A6FD7C(v0 + v2, *(void *)(v0 + v3), *(unsigned char *)(v0 + v3 + 8), v0 + v5, *(void *)(v0 + v6), *(void *)(v0 + v7), *(void **)(v0 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v0 + ((((v7 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v0 + ((((v7 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_260A74E34(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v16 = OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_createTime;
  *(CFAbsoluteTime *)(a11 + v16) = CFAbsoluteTimeGetCurrent();
  *(unsigned char *)(a11
           + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_state) = 0;
  uint64_t v17 = a11
      + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_result;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3FD188);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
  uint64_t v19 = a11
      + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_delegate;
  *(void *)(v19 + 8) = 0;
  swift_unknownObjectWeakInit();
  *(unsigned char *)(a11
           + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_deleted) = 0;
  *(unsigned char *)(a11
           + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_calledCompletion) = 0;
  uint64_t v20 = a11
      + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_initialNotification;
  uint64_t v21 = sub_260A84400();
  uint64_t v22 = *(void *)(v21 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v20, a1, v21);
  *(void *)(a11
            + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_pipeline) = a2;
  *(unsigned char *)(a11
           + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_action) = a3;
  uint64_t v23 = sub_260A84210();
  uint64_t v25 = v24;
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(a1, v21);
  uint64_t v26 = (uint64_t *)(a11
                  + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_channel);
  *uint64_t v26 = v23;
  v26[1] = v25;
  sub_2609C4310(a4, a11+ OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_logger, (uint64_t (*)(void))type metadata accessor for NotificationPipelineRequestLogger);
  *(void *)(a11
            + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_analytics) = a5;
  *(void *)(v19 + 8) = &off_270CB2E58;
  swift_unknownObjectWeakAssign();
  *(void *)(a11
            + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_queue) = a7;
  *(void *)(a11
            + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_completionQueue) = a8;
  unint64_t v27 = (void *)(a11
                 + OBJC_IVAR____TtCC21UserNotificationsCoreP33_44CB2ECED9549B956A840C1DBFE3774129NotificationPipelineScheduler7Request_completion);
  *unint64_t v27 = a9;
  v27[1] = a10;
  return a11;
}

uint64_t sub_260A75084()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 41, 7);
}

uint64_t sub_260A750C4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_260A750FC(uint64_t a1)
{
  return sub_260A73324(a1, *(void *)(v1 + 16)) & 1;
}

uint64_t sub_260A7511C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3FD188);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_260A75184()
{
  uint64_t v1 = *(void *)(type metadata accessor for NotificationPipelineRequestLogger() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  unint64_t v4 = (*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = *(void *)(type metadata accessor for StepFailure(0) - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (v4 + v6 + 8) & ~v6;
  uint64_t v8 = *(void *)(v5 + 64);
  uint64_t v9 = sub_260A84400();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v0 + v3, v9);
  swift_release();
  uint64_t v10 = v0 + v7;
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload != 2)
  {
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v12 = &qword_26A8C61E0;
      goto LABEL_6;
    }
    if (EnumCaseMultiPayload) {
      goto LABEL_10;
    }
  }
  __swift_destroy_boxed_opaque_existential_1(v0 + v7);
  uint64_t v12 = &qword_26A8C5230;
LABEL_6:
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(v12);
  uint64_t v14 = v10 + *(int *)(v13 + 48);
  uint64_t v15 = sub_260A844C0();
  uint64_t v16 = *(void *)(v15 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15)) {
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
  }
  uint64_t v17 = v10 + *(int *)(v13 + 64);
  uint64_t v18 = sub_260A844D0();
  uint64_t v19 = *(void *)(v18 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18)) {
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v17, v18);
  }
LABEL_10:

  return MEMORY[0x270FA0238](v0, v7 + v8, v2 | v6 | 7);
}

uint64_t sub_260A75438()
{
  return sub_260A75620(type metadata accessor for StepFailure, (uint64_t (*)(unint64_t, uint64_t, uint64_t))sub_260A73FA8);
}

uint64_t sub_260A75464(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_260A754C4()
{
  uint64_t v1 = *(void *)(type metadata accessor for NotificationPipelineRequestLogger() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  unint64_t v4 = (*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = sub_260A84400();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = (v4 + v8 + 8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v6 + 64);
  uint64_t v11 = v2 | v8 | 7;
  v7(v0 + v3, v5);
  swift_release();
  v7(v0 + v9, v5);

  return MEMORY[0x270FA0238](v0, v10, v11);
}

uint64_t sub_260A755F4()
{
  return sub_260A75620(MEMORY[0x263F84470], (uint64_t (*)(unint64_t, uint64_t, uint64_t))sub_260A73E88);
}

uint64_t sub_260A75620(uint64_t (*a1)(void), uint64_t (*a2)(unint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(type metadata accessor for NotificationPipelineRequestLogger() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(a1(0) - 8);
  uint64_t v8 = *(void *)(v2 + v6);
  uint64_t v9 = v2 + ((v6 + *(unsigned __int8 *)(v7 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));

  return a2(v2 + v5, v8, v9);
}

uint64_t sub_260A7571C()
{
  return sub_260A75844((uint64_t (*)(unint64_t, uint64_t))sub_260A73D44);
}

uint64_t objectdestroy_46Tm()
{
  uint64_t v1 = *(void *)(type metadata accessor for NotificationPipelineRequestLogger() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_260A84400();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_release();

  return MEMORY[0x270FA0238](v0, v5, v4);
}

uint64_t sub_260A7582C()
{
  return sub_260A75844((uint64_t (*)(unint64_t, uint64_t))sub_260A73C1C);
}

uint64_t sub_260A75844(uint64_t (*a1)(unint64_t, uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for NotificationPipelineRequestLogger() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v1 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));

  return a1(v1 + v3, v4);
}

uint64_t sub_260A758E4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_260A7592C()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_260A75964()
{
  uint64_t v1 = *(void *)(type metadata accessor for NotificationPipelineRequestLogger() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (((*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_260A84400();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, v5 + 8, v4);
}

void sub_260A75A68(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for NotificationPipelineRequestLogger() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = *(void *)(v1 + v5);
  uint64_t v7 = *(void *)(v1 + ((v5 + 15) & 0xFFFFFFFFFFFFFFF8));

  sub_260A7352C(a1, v1 + v4, v6, v7);
}

uint64_t sub_260A75B10()
{
  uint64_t v1 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B3FD188) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = *(void *)(type metadata accessor for NotificationPipelineRequestLogger() - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  swift_release();
  uint64_t v8 = v0 + v3;
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    uint64_t v17 = sub_260A84400();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v0 + v3, v17);
    goto LABEL_14;
  }
  type metadata accessor for StepFailure(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      __swift_destroy_boxed_opaque_existential_1(v0 + v3);
      uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C5230);
      uint64_t v18 = v8 + *(int *)(v29 + 48);
      uint64_t v19 = sub_260A844C0();
      uint64_t v20 = *(void *)(v19 - 8);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19)) {
        (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v18, v19);
      }
      uint64_t v14 = v8 + *(int *)(v29 + 64);
      uint64_t v15 = sub_260A844D0();
      uint64_t v16 = *(void *)(v15 - 8);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15)) {
        goto LABEL_13;
      }
      break;
    case 1:
      uint64_t v30 = v7;
      uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C61E0);
      uint64_t v24 = v8 + *(int *)(v23 + 48);
      uint64_t v25 = sub_260A844C0();
      uint64_t v26 = *(void *)(v25 - 8);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25)) {
        (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v24, v25);
      }
      uint64_t v14 = v8 + *(int *)(v23 + 64);
      uint64_t v15 = sub_260A844D0();
      uint64_t v16 = *(void *)(v15 - 8);
      uint64_t v7 = v30;
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15)) {
        goto LABEL_13;
      }
      break;
    case 0:
      uint64_t v28 = v4;
      __swift_destroy_boxed_opaque_existential_1(v0 + v3);
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C5230);
      uint64_t v11 = v8 + *(int *)(v10 + 48);
      uint64_t v12 = sub_260A844C0();
      uint64_t v13 = *(void *)(v12 - 8);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12)) {
        (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
      }
      uint64_t v14 = v8 + *(int *)(v10 + 64);
      uint64_t v15 = sub_260A844D0();
      uint64_t v16 = *(void *)(v15 - 8);
      uint64_t v4 = v28;
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15)) {
LABEL_13:
      }
        (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
      break;
  }
LABEL_14:
  unint64_t v21 = (((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + v6 + 8) & ~v6;
  swift_release();
  uint64_t v22 = sub_260A84400();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v22 - 8) + 8))(v0 + v21, v22);

  return MEMORY[0x270FA0238](v0, v21 + v7, v2 | v6 | 7);
}

uint64_t sub_260A76060()
{
  uint64_t v1 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B3FD188) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  type metadata accessor for NotificationPipelineRequestLogger();
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v5 = *(void *)(v0 + v3);

  return sub_260A739F8(v4, v0 + v2, v5);
}

uint64_t sub_260A76144(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3FD190);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

BOOL sub_260A761AC(uint64_t *a1)
{
  return sub_260A72DBC(a1, *(void *)(v1 + 16));
}

uint64_t sub_260A761CC(uint64_t a1)
{
  return sub_260A750FC(a1) & 1;
}

uint64_t sub_260A76218(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

id sub_260A76240()
{
  uint64_t v1 = OBJC_IVAR____TtC21UserNotificationsCore31NotificationSystemServiceClient_queue;
  sub_2608DED7C(0, (unint64_t *)&qword_26B3FDF40);
  uint64_t v2 = sub_260A84A10();
  MEMORY[0x270FA5388](v2 - 8);
  unint64_t v3 = v0;
  sub_260A849E0();
  uint64_t v4 = sub_260A85070();
  MEMORY[0x270FA5388](v4);
  uint64_t v12 = MEMORY[0x263F8EE78];
  sub_2609433A4((unint64_t *)&qword_26B3FDF30, MEMORY[0x270FCDBE0]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3FDF20);
  sub_2608E328C((unint64_t *)&qword_26B3FE040, (uint64_t *)&unk_26B3FDF20);
  sub_260A85300();
  uint64_t v5 = sub_260A850C0();
  MEMORY[0x270FA5388](v5);
  (*(void (**)(char *, void))(v7 + 104))((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x263F8F128]);
  *(void *)&v0[v1] = sub_260A85100();
  *(void *)&v3[OBJC_IVAR____TtC21UserNotificationsCore31NotificationSystemServiceClient_queue_connection] = 0;

  uint64_t v8 = (objc_class *)type metadata accessor for NotificationSystemServiceClient();
  v11.receiver = v3;
  v11.super_class = v8;
  return objc_msgSendSuper2(&v11, sel_init);
}

id sub_260A764D0()
{
  uint64_t v1 = *(NSObject **)&v0[OBJC_IVAR____TtC21UserNotificationsCore31NotificationSystemServiceClient_queue];
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v0;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_260A78B98;
  *(void *)(v3 + 24) = v2;
  aBlock[4] = sub_260A07230;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2609DCE8C;
  aBlock[3] = &block_descriptor_69_1;
  uint64_t v4 = _Block_copy(aBlock);
  uint64_t v5 = v0;
  swift_retain();
  swift_release();
  dispatch_sync(v1, v4);
  _Block_release(v4);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  id result = (id)swift_release();
  if (v1)
  {
    __break(1u);
  }
  else
  {
    swift_release();
    v7.receiver = v5;
    v7.super_class = (Class)type metadata accessor for NotificationSystemServiceClient();
    return objc_msgSendSuper2(&v7, sel_dealloc);
  }
  return result;
}

uint64_t sub_260A766B4@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_260A77890(0xD000000000000021, 0x8000000260AA2B80);
  if (result)
  {
    uint64_t v3 = (void *)result;
    uint64_t v4 = (void *)sub_260A84BB0();
    id v5 = objc_msgSend(v3, sel_badgeNumberForBundleIdentifier_, v4);

    uint64_t result = swift_unknownObjectRelease();
  }
  else
  {
    id v5 = 0;
  }
  *a1 = v5;
  return result;
}

uint64_t sub_260A76764@<X0>(uint64_t a1@<X1>, unsigned __int8 *a2@<X8>)
{
  uint64_t result = sub_260A77890(0xD000000000000026, 0x8000000260AA50A0);
  if (result)
  {
    id v5 = (void *)result;
    uint64_t v6 = (void *)sub_260A84BB0();
    unsigned __int8 v7 = objc_msgSend(v5, sel_setBadgeNumber_forBundleIdentifier_, a1, v6);

    uint64_t result = swift_unknownObjectRelease();
  }
  else
  {
    unsigned __int8 v7 = 0;
  }
  *a2 = v7;
  return result;
}

uint64_t sub_260A76814@<X0>(void *a1@<X2>, unsigned __int8 *a2@<X8>)
{
  uint64_t result = sub_260A77890(0xD000000000000026, 0x8000000260AA5070);
  if (result)
  {
    id v5 = (void *)result;
    if (a1) {
      a1 = (void *)sub_260A84BB0();
    }
    uint64_t v6 = (void *)sub_260A84BB0();
    unsigned __int8 v7 = objc_msgSend(v5, sel_setBadgeString_forBundleIdentifier_, a1, v6);

    uint64_t result = swift_unknownObjectRelease();
  }
  else
  {
    unsigned __int8 v7 = 0;
  }
  *a2 = v7;
  return result;
}

uint64_t sub_260A768E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_260A76DE8(a1, a2, a3, (uint64_t)&unk_270CB8128, (uint64_t)sub_260A78B58, (uint64_t)&block_descriptor_81_0);
}

void sub_260A76910()
{
  uint64_t v0 = sub_260A77890(0xD000000000000038, 0x8000000260AA5110);
  if (v0)
  {
    uint64_t v1 = (void *)v0;
    sub_2608DED7C(0, (unint64_t *)&unk_26B3FC9B0);
    uint64_t v2 = (void *)sub_260A84D60();
    id v3 = (id)sub_260A84BB0();
    objc_msgSend(v1, sel_notificationRepositoryDidPerformUpdates_forBundleIdentifier_, v2, v3);
    swift_unknownObjectRelease();
  }
}

uint64_t sub_260A76A00(uint64_t a1, uint64_t a2)
{
  v17[0] = *(void *)&v2[OBJC_IVAR____TtC21UserNotificationsCore31NotificationSystemServiceClient_queue];
  id v5 = (void *)swift_allocObject();
  v5[2] = v2;
  v5[3] = a1;
  v5[4] = a2;
  aBlock[4] = sub_260A78B48;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2608EB0BC;
  aBlock[3] = &block_descriptor_75_0;
  uint64_t v6 = _Block_copy(aBlock);
  uint64_t v7 = sub_260A84A10();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v11 = v2;
  swift_bridgeObjectRetain();
  sub_260A849E0();
  uint64_t v12 = sub_260A849B0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v17 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[1] = MEMORY[0x263F8EE78];
  sub_2609433A4((unint64_t *)&qword_26B3FDEF0, MEMORY[0x270FCDA80]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3FDF00);
  sub_2608E328C((unint64_t *)&qword_26B3FE030, (uint64_t *)&unk_26B3FDF00);
  sub_260A85300();
  MEMORY[0x261220FB0](0, v10, v15, v6);
  _Block_release(v6);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return swift_release();
}

void sub_260A76CA8()
{
  uint64_t v0 = sub_260A77890(0xD00000000000003BLL, 0x8000000260AA50D0);
  if (v0)
  {
    uint64_t v1 = (void *)v0;
    id v2 = (id)sub_260A84BB0();
    objc_msgSend(v1, sel_categoryRepositoryDidChangeCategoriesForBundleIdentifier_, v2);
    swift_unknownObjectRelease();
  }
}

uint64_t sub_260A76DC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_260A76DE8(a1, a2, a3, (uint64_t)&unk_270CB8088, (uint64_t)sub_260A78A8C, (uint64_t)&block_descriptor_59_0);
}

uint64_t sub_260A76DE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v24[0] = *(void *)&v6[OBJC_IVAR____TtC21UserNotificationsCore31NotificationSystemServiceClient_queue];
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = v6;
  v12[3] = a1;
  v12[4] = a2;
  void v12[5] = a3;
  aBlock[4] = a5;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2608EB0BC;
  aBlock[3] = a6;
  uint64_t v13 = _Block_copy(aBlock);
  uint64_t v14 = sub_260A84A10();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_260A849E0();
  uint64_t v19 = sub_260A849B0();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)v24 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24[1] = MEMORY[0x263F8EE78];
  sub_2609433A4((unint64_t *)&qword_26B3FDEF0, MEMORY[0x270FCDA80]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3FDF00);
  sub_2608E328C((unint64_t *)&qword_26B3FE030, (uint64_t *)&unk_26B3FDF00);
  sub_260A85300();
  MEMORY[0x261220FB0](0, v17, v22, v13);
  _Block_release(v13);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  return swift_release();
}

void sub_260A77088()
{
  uint64_t v0 = sub_260A77890(0xD00000000000003BLL, 0x8000000260AA4FF0);
  if (v0)
  {
    uint64_t v1 = (void *)v0;
    id v2 = (void *)sub_260A84D60();
    id v3 = (id)sub_260A84BB0();
    objc_msgSend(v1, sel_removeNotificationRecordsForIdentifiers_bundleIdentifier_, v2, v3);
    swift_unknownObjectRelease();
  }
}

void sub_260A771EC(uint64_t *a1@<X8>)
{
  id v2 = (void *)sub_260A77890(0xD000000000000023, 0x8000000260AA2A60);
  if (v2)
  {
    id v3 = objc_msgSend(v2, sel_allBundleIdentifiersForCategories);
    uint64_t v4 = sub_260A84D70();
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v4 = MEMORY[0x263F8EE78];
  }
  *a1 = v4;
}

uint64_t sub_260A77340@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_260A77890(0xD000000000000029, 0x8000000260AA2A30);
  if (result)
  {
    id v3 = (void *)result;
    uint64_t v4 = (void *)sub_260A84BB0();
    id v5 = (void *)sub_260A84BB0();
    id v6 = objc_msgSend(v3, sel_categoryForIdentifier_bundleIdentifier_, v4, v5);

    uint64_t result = swift_unknownObjectRelease();
  }
  else
  {
    id v6 = 0;
  }
  *a1 = v6;
  return result;
}

void sub_260A774EC(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_260A77890(0xD000000000000020, 0x8000000260AA2A00);
  if (v2)
  {
    id v3 = (void *)v2;
    uint64_t v4 = (void *)sub_260A84BB0();
    id v5 = objc_msgSend(v3, sel_categoriesForBundleIdentifier_, v4);

    sub_2608DED7C(0, (unint64_t *)&qword_26B3FD120);
    uint64_t v6 = sub_260A84D70();
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v6 = MEMORY[0x263F8EE78];
  }
  *a1 = v6;
}

uint64_t sub_260A776AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_260A76DE8(a1, a2, a3, (uint64_t)&unk_270CB8060, (uint64_t)sub_260A78A7C, (uint64_t)&block_descriptor_53_0);
}

void sub_260A776D4()
{
  uint64_t v0 = sub_260A77890(0xD000000000000025, 0x8000000260AA29D0);
  if (v0)
  {
    uint64_t v1 = (void *)v0;
    sub_2608DED7C(0, (unint64_t *)&qword_26B3FD120);
    uint64_t v2 = (void *)sub_260A84D60();
    id v3 = (id)sub_260A84BB0();
    objc_msgSend(v1, sel_setCategories_forBundleIdentifier_, v2, v3);
    swift_unknownObjectRelease();
  }
}

uint64_t type metadata accessor for NotificationSystemServiceClient()
{
  return self;
}

uint64_t sub_260A77890(uint64_t a1, unint64_t a2)
{
  unint64_t v33 = a2;
  uint64_t v31 = a1;
  uint64_t v3 = sub_260A84A80();
  uint64_t v4 = *(void **)(v3 - 8);
  uint64_t v5 = v4[8];
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = *(void **)(v2 + OBJC_IVAR____TtC21UserNotificationsCore31NotificationSystemServiceClient_queue);
  *(uint64_t *)((char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0)) = (uint64_t)v6;
  uint64_t v7 = *MEMORY[0x263F8F0E8];
  unint64_t v9 = (unint64_t)(v4 + 13);
  uint64_t v8 = (void (*)(char *, uint64_t, uint64_t))v4[13];
  v8((char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7, v3);
  id v32 = v6;
  char v10 = sub_260A84AB0();
  objc_super v11 = (void (*)(char *, uint64_t))v4[1];
  v11((char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  if ((v10 & 1) == 0)
  {
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v12 = OBJC_IVAR____TtC21UserNotificationsCore31NotificationSystemServiceClient_queue_connection;
  uint64_t v13 = *(void **)(v2 + OBJC_IVAR____TtC21UserNotificationsCore31NotificationSystemServiceClient_queue_connection);
  if (v13)
  {
    if (objc_msgSend(v13, sel_remoteTarget))
    {
      sub_260A85280();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v35 = 0u;
      long long v36 = 0u;
    }
    sub_260A07110((uint64_t)&v35, (uint64_t)v37);
  }
  else
  {
    memset(v37, 0, sizeof(v37));
  }
  sub_2608E58F4((uint64_t)v37, (uint64_t)&v35);
  uint64_t v14 = *((void *)&v36 + 1);
  uint64_t v15 = sub_2608E5894((uint64_t)&v35);
  if (v14)
  {
LABEL_17:
    sub_2608E58F4((uint64_t)v37, (uint64_t)&v35);
    if (*((void *)&v36 + 1))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B3F7F20);
      int v23 = swift_dynamicCast();
      unint64_t v9 = v33;
      if (v23)
      {
        uint64_t v24 = *(void *)&v34[0];
        sub_2608E5894((uint64_t)v37);
        return v24;
      }
    }
    else
    {
      sub_2608E5894((uint64_t)&v35);
      unint64_t v9 = v33;
    }
    if (qword_26B3FDEE8 == -1)
    {
LABEL_22:
      uint64_t v25 = sub_260A84790();
      __swift_project_value_buffer(v25, (uint64_t)qword_26B4024D8);
      swift_bridgeObjectRetain_n();
      uint64_t v26 = sub_260A84770();
      os_log_type_t v27 = sub_260A85010();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = (uint8_t *)swift_slowAlloc();
        uint64_t v29 = swift_slowAlloc();
        *(void *)&long long v35 = v29;
        *(_DWORD *)uint64_t v28 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)&v34[0] = sub_2608E5414(v31, v9, (uint64_t *)&v35);
        sub_260A85240();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_2608DB000, v26, v27, "No remote target for %s in system service client", v28, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x261222810](v29, -1, -1);
        MEMORY[0x261222810](v28, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      sub_2608E5894((uint64_t)v37);
      return 0;
    }
LABEL_28:
    swift_once();
    goto LABEL_22;
  }
  uint64_t v30 = (uint64_t)&v30;
  MEMORY[0x270FA5388](v15);
  uint64_t v16 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = v32;
  *(void *)uint64_t v16 = v32;
  v8(v16, v7, v3);
  id v18 = v17;
  char v19 = sub_260A84AB0();
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v11)(v16, v3);
  if (v19)
  {
    objc_msgSend(*(id *)(v2 + v12), sel_invalidate);
    uint64_t v21 = *(void **)(v2 + v12);
    *(void *)(v2 + v12) = 0;

    sub_260A77D34();
    uint64_t v22 = *(void **)(v2 + v12);
    if (v22)
    {
      if (objc_msgSend(v22, sel_remoteTarget))
      {
        sub_260A85280();
        swift_unknownObjectRelease();
        sub_2608E5894((uint64_t)v37);
      }
      else
      {
        sub_2608E5894((uint64_t)v37);
        memset(v34, 0, sizeof(v34));
      }
      sub_260A07110((uint64_t)v34, (uint64_t)&v35);
    }
    else
    {
      sub_2608E5894((uint64_t)v37);
      long long v35 = 0u;
      long long v36 = 0u;
    }
    sub_260A07110((uint64_t)&v35, (uint64_t)v37);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

void sub_260A77D34()
{
  uint64_t v1 = (void *)sub_260A84A80();
  uint64_t v2 = *(v1 - 1);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (void *)((char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = *(void **)&v0[OBJC_IVAR____TtC21UserNotificationsCore31NotificationSystemServiceClient_queue];
  *uint64_t v4 = v5;
  (*(void (**)(void *, void, void *))(v2 + 104))(v4, *MEMORY[0x263F8F0E8], v1);
  id v6 = v5;
  LOBYTE(v5) = sub_260A84AB0();
  (*(void (**)(void *, void *))(v2 + 8))(v4, v1);
  if (v5)
  {
    uint64_t v7 = OBJC_IVAR____TtC21UserNotificationsCore31NotificationSystemServiceClient_queue_connection;
    if (*(void *)&v0[OBJC_IVAR____TtC21UserNotificationsCore31NotificationSystemServiceClient_queue_connection]) {
      return;
    }
    uint64_t v8 = self;
    id v9 = objc_msgSend(v8, sel_machServiceName);
    sub_260A84BC0();

    uint64_t v1 = objc_msgSend(v8, sel_serviceInterface);
    id v10 = objc_msgSend(v1, sel_identifier);
    sub_260A84BC0();

    objc_super v11 = (void *)sub_260A84BB0();
    swift_bridgeObjectRelease();
    uint64_t v12 = (void *)sub_260A84BB0();
    swift_bridgeObjectRelease();
    id v13 = objc_msgSend(self, sel_endpointForMachName_service_instance_, v11, v12, 0);

    if (!v13)
    {
      if (qword_26B3FDEE8 == -1) {
        goto LABEL_8;
      }
      goto LABEL_16;
    }
    id v14 = objc_msgSend(self, sel_connectionWithEndpoint_, v13);
    uint64_t v15 = *(void **)&v0[v7];
    *(void *)&v0[v7] = v14;

    uint64_t v16 = *(void **)&v0[v7];
    if (!v16)
    {
      int v23 = 0;
      uint64_t v24 = 0;
      goto LABEL_11;
    }
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = v1;
    *(void *)(v17 + 24) = v0;
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = sub_260A789A4;
    *(void *)(v18 + 24) = v17;
    aBlock[4] = sub_2608DFBF4;
    aBlock[5] = v18;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2609A762C;
    aBlock[3] = &block_descriptor_28;
    char v19 = _Block_copy(aBlock);
    id v20 = v16;
    uint64_t v21 = v1;
    uint64_t v22 = v0;
    swift_retain();
    swift_release();
    objc_msgSend(v20, sel_configureConnection_, v19);

    _Block_release(v19);
    LOBYTE(v19) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((v19 & 1) == 0)
    {
      int v23 = *(void **)&v0[v7];
      uint64_t v24 = sub_260A789A4;
LABEL_11:
      id v29 = v23;
      objc_msgSend(v29, sel_activate);

      sub_2609477D4((uint64_t)v24);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_16:
  swift_once();
LABEL_8:
  uint64_t v25 = sub_260A84790();
  __swift_project_value_buffer(v25, (uint64_t)qword_26B4024D8);
  uint64_t v26 = sub_260A84770();
  os_log_type_t v27 = sub_260A85010();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v28 = 0;
    _os_log_impl(&dword_2608DB000, v26, v27, "No endpoint in system service client", v28, 2u);
    MEMORY[0x261222810](v28, -1, -1);
  }
  else
  {
  }
}

void sub_260A781C8(void *a1, uint64_t a2, uint64_t a3)
{
  id v6 = objc_msgSend(self, sel_userInitiated);
  objc_msgSend(a1, sel_setServiceQuality_, v6);

  objc_msgSend(a1, sel_setInterface_, a2);
  objc_msgSend(a1, sel_setInterfaceTarget_, a3);
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v15 = sub_260A789F4;
  uint64_t v16 = v7;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 1107296256;
  id v13 = sub_2608DFB8C;
  id v14 = &block_descriptor_24_0;
  uint64_t v8 = _Block_copy(&v11);
  swift_release();
  objc_msgSend(a1, sel_setInterruptionHandler_, v8);
  _Block_release(v8);
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v15 = sub_260A789FC;
  uint64_t v16 = v9;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 1107296256;
  id v13 = sub_2608DFB8C;
  id v14 = &block_descriptor_28_0;
  id v10 = _Block_copy(&v11);
  swift_release();
  objc_msgSend(a1, sel_setInvalidationHandler_, v10);
  _Block_release(v10);
}

uint64_t sub_260A783BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t result = MEMORY[0x261222930](v2);
  if (result)
  {
    uint64_t v4 = (char *)result;
    if (qword_26B3FDEE8 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_260A84790();
    __swift_project_value_buffer(v5, (uint64_t)qword_26B4024D8);
    id v6 = sub_260A84770();
    os_log_type_t v7 = sub_260A84FF0();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_2608DB000, v6, v7, "System service client connection is interrupted", v8, 2u);
      MEMORY[0x261222810](v8, -1, -1);
    }

    uint64_t v9 = *(NSObject **)&v4[OBJC_IVAR____TtC21UserNotificationsCore31NotificationSystemServiceClient_queue];
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v4;
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = sub_260A78B98;
    *(void *)(v11 + 24) = v10;
    aBlock[4] = sub_260A07230;
    aBlock[5] = v11;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2609DCE8C;
    aBlock[3] = &block_descriptor_47;
    uint64_t v12 = _Block_copy(aBlock);
    id v13 = v4;
    swift_retain();
    swift_release();
    dispatch_sync(v9, v12);

    _Block_release(v12);
    LOBYTE(v13) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    uint64_t result = swift_release();
    if (v13) {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_260A785F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t result = MEMORY[0x261222930](v2);
  if (result)
  {
    uint64_t v4 = (char *)result;
    if (qword_26B3FDEE8 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_260A84790();
    __swift_project_value_buffer(v5, (uint64_t)qword_26B4024D8);
    id v6 = sub_260A84770();
    os_log_type_t v7 = sub_260A84FF0();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_2608DB000, v6, v7, "System service client connection is invalidated", v8, 2u);
      MEMORY[0x261222810](v8, -1, -1);
    }

    uint64_t v9 = *(NSObject **)&v4[OBJC_IVAR____TtC21UserNotificationsCore31NotificationSystemServiceClient_queue];
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v4;
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = sub_260A78A3C;
    *(void *)(v11 + 24) = v10;
    aBlock[4] = sub_2609477CC;
    aBlock[5] = v11;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2609DCE8C;
    aBlock[3] = &block_descriptor_37_0;
    uint64_t v12 = _Block_copy(aBlock);
    id v13 = v4;
    swift_retain();
    swift_release();
    dispatch_sync(v9, v12);

    _Block_release(v12);
    LOBYTE(v13) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    uint64_t result = swift_release();
    if (v13) {
      __break(1u);
    }
  }
  return result;
}

void sub_260A7882C(uint64_t a1)
{
  uint64_t v2 = sub_260A84A80();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (uint64_t *)((char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v6 = *(void **)(a1 + OBJC_IVAR____TtC21UserNotificationsCore31NotificationSystemServiceClient_queue);
  *uint64_t v5 = v6;
  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F8F0E8], v2);
  id v7 = v6;
  LOBYTE(v6) = sub_260A84AB0();
  (*(void (**)(void *, uint64_t))(v3 + 8))(v5, v2);
  if (v6)
  {
    uint64_t v8 = OBJC_IVAR____TtC21UserNotificationsCore31NotificationSystemServiceClient_queue_connection;
    objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC21UserNotificationsCore31NotificationSystemServiceClient_queue_connection), sel_invalidate);
    uint64_t v9 = *(void **)(a1 + v8);
    *(void *)(a1 + v8) = 0;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_260A78964()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_260A789A4(void *a1)
{
  sub_260A781C8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_260A789AC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_260A789BC()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_260A789F4(uint64_t a1)
{
  return sub_260A783BC(a1, v1);
}

uint64_t sub_260A789FC(uint64_t a1)
{
  return sub_260A785F4(a1, v1);
}

uint64_t sub_260A78A04()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_260A78A3C()
{
  sub_260A7882C(*(void *)(v0 + 16));
}

uint64_t sub_260A78A58()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_260A78A68()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_260A78A7C()
{
}

void sub_260A78A8C()
{
}

void sub_260A78A98(uint64_t *a1@<X8>)
{
}

uint64_t sub_260A78AB8@<X0>(void *a1@<X8>)
{
  return sub_260A77340(a1);
}

void sub_260A78ADC(uint64_t *a1@<X8>)
{
}

uint64_t sub_260A78AF8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_260A78B08()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_260A78B48()
{
}

void sub_260A78B58()
{
}

uint64_t sub_260A78BB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t type metadata accessor for SettingsDefinedReaper()
{
  return self;
}

void sub_260A78BE8(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = v3;
  if (a1)
  {
    id v17 = a1;
    if (objc_msgSend(v17, sel_remoteNotificationsSetting) == (id)1)
    {
      if (qword_26A8C4AC0 != -1) {
        swift_once();
      }
      uint64_t v7 = sub_260A84790();
      __swift_project_value_buffer(v7, (uint64_t)qword_26A8C77D0);
      swift_bridgeObjectRetain_n();
      uint64_t v8 = sub_260A84770();
      os_log_type_t v9 = sub_260A85030();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v10 = (uint8_t *)swift_slowAlloc();
        uint64_t v11 = swift_slowAlloc();
        uint64_t v18 = v11;
        *(_DWORD *)uint64_t v10 = 136380675;
        swift_bridgeObjectRetain();
        sub_2608E5414(a2, a3, &v18);
        sub_260A85240();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_2608DB000, v8, v9, "Reaping notifications for %{private}s; app setting was disabled",
          v10,
          0xCu);
        swift_arrayDestroy();
        MEMORY[0x261222810](v11, -1, -1);
        MEMORY[0x261222810](v10, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      __swift_project_boxed_opaque_existential_1((void *)(v4 + 16), *(void *)(v4 + 40));
      sub_260A78FAC(a2, a3, 0);
    }
    else
    {
    }
  }
  else
  {
    if (qword_26A8C4AC0 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_260A84790();
    __swift_project_value_buffer(v12, (uint64_t)qword_26A8C77D0);
    swift_bridgeObjectRetain_n();
    id v13 = sub_260A84770();
    os_log_type_t v14 = sub_260A85030();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v18 = v16;
      *(_DWORD *)uint64_t v15 = 136380675;
      swift_bridgeObjectRetain();
      sub_2608E5414(a2, a3, &v18);
      sub_260A85240();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2608DB000, v13, v14, "Reaping notifications for %{private}s; app settings were cleared",
        v15,
        0xCu);
      swift_arrayDestroy();
      MEMORY[0x261222810](v16, -1, -1);
      MEMORY[0x261222810](v15, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    __swift_project_boxed_opaque_existential_1((void *)(v4 + 16), *(void *)(v4 + 40));
    sub_260A78FAC(a2, a3, 1);
  }
}

uint64_t sub_260A78FA0()
{
  return 0;
}

void sub_260A78FAC(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  if (qword_26A8C4AC0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_260A84790();
  __swift_project_value_buffer(v8, (uint64_t)qword_26A8C77D0);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  os_log_type_t v9 = sub_260A84770();
  os_log_type_t v10 = sub_260A85030();
  if (os_log_type_enabled(v9, v10))
  {
    char v31 = a3;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    uint64_t v33 = v30;
    *(_DWORD *)uint64_t v11 = 136315394;
    id v12 = objc_msgSend(*(id *)(v3 + 16), sel_description);
    uint64_t v13 = sub_260A84BC0();
    unint64_t v15 = v14;

    uint64_t v16 = v13;
    uint64_t v4 = v3;
    sub_2608E5414(v16, v15, &v33);
    sub_260A85240();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_2608E5414(a1, a2, &v33);
    sub_260A85240();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2608DB000, v9, v10, "Telling repository (%s) to remove all notifications for %s.", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x261222810](v30, -1, -1);
    uint64_t v17 = v11;
    a3 = v31;
    MEMORY[0x261222810](v17, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
  uint64_t v18 = *(void **)(v4 + 16);
  if (objc_msgSend(v18, sel_respondsToSelector_, sel_removeAllNotificationRecordsForBundleIdentifierSync_))
  {
    swift_unknownObjectRetain();
    char v19 = (void *)sub_260A84BB0();
    objc_msgSend(v18, sel_removeAllNotificationRecordsForBundleIdentifierSync_, v19);
    swift_unknownObjectRelease();
  }
  if (a3)
  {
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    id v20 = sub_260A84770();
    os_log_type_t v21 = sub_260A85030();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      uint64_t v33 = v32;
      *(_DWORD *)uint64_t v22 = 136315394;
      id v23 = objc_msgSend(v18, sel_description);
      uint64_t v24 = sub_260A84BC0();
      uint64_t v25 = a1;
      unint64_t v26 = a2;
      unint64_t v28 = v27;

      sub_2608E5414(v24, v28, &v33);
      sub_260A85240();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_2608E5414(v25, v26, &v33);
      sub_260A85240();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2608DB000, v20, v21, "Telling repository (%s) to remove notifications store for %s.", (uint8_t *)v22, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x261222810](v32, -1, -1);
      MEMORY[0x261222810](v22, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release_n();
    }
    id v29 = (void *)sub_260A84BB0();
    objc_msgSend(v18, sel_removeStoreForBundleIdentifier_, v29);
  }
}

uint64_t type metadata accessor for SettingsDefinedReaperClientProxy()
{
  return self;
}

uint64_t sub_260A79478()
{
  uint64_t v0 = sub_260A84790();
  __swift_allocate_value_buffer(v0, qword_26A8C77D0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A8C77D0);
  return sub_260A84780();
}

uint64_t sub_260A794FC()
{
  uint64_t v1 = v0;
  *(void *)(v0 + 16) = 0;
  sub_260943364();
  uint64_t v2 = sub_260A84A10();
  MEMORY[0x270FA5388](v2 - 8);
  sub_260A849F0();
  uint64_t v3 = sub_260A85070();
  MEMORY[0x270FA5388](v3);
  uint64_t v20 = MEMORY[0x263F8EE78];
  sub_260947A1C();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3FDF20);
  sub_260947A68();
  sub_260A85300();
  uint64_t v4 = sub_260A850C0();
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, void))(v6 + 104))((char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x263F8F140]);
  uint64_t v7 = (void *)sub_260A85100();
  *(void *)(v1 + 24) = v7;
  uint64_t v8 = sub_260A84870();
  MEMORY[0x270FA5388](v8 - 8);
  id v9 = v7;
  sub_260A84860();
  swift_allocObject();
  swift_weakInit();
  sub_260A84910();
  swift_allocObject();
  *(void *)(v1 + 16) = sub_260A848F0();
  swift_release();
  if (*(void *)(v1 + 16))
  {
    swift_retain();
    sub_260A84900();
    swift_release();
  }
  if (qword_26B3FC7F0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_260A84790();
  __swift_project_value_buffer(v10, (uint64_t)qword_26B402480);
  swift_retain_n();
  uint64_t v11 = sub_260A84770();
  os_log_type_t v12 = sub_260A84FF0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v20 = v14;
    *(_DWORD *)uint64_t v13 = 136315394;
    uint64_t v19 = v1;
    type metadata accessor for ToolServiceListener();
    swift_retain();
    uint64_t v15 = sub_260A84C20();
    uint64_t v19 = sub_2608E5414(v15, v16, &v20);
    sub_260A85240();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    uint64_t v19 = sub_2608E5414(0xD000000000000020, 0x8000000260AA0C80, &v20);
    sub_260A85240();
    _os_log_impl(&dword_2608DB000, v11, v12, "Starting up %s serviceName: %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x261222810](v14, -1, -1);
    MEMORY[0x261222810](v13, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  return v1;
}

uint64_t sub_260A79B9C()
{
  return swift_release_n();
}

double sub_260A79C68@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)&long long v33 = sub_260A84930();
  *((void *)&v33 + 1) = v3;
  int v34 = v4;
  int v35 = v5;
  int v36 = v6;
  int v37 = v7;
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29BE0]), sel_initWithAuditToken_, &v33);
  id v9 = objc_msgSend(v8, sel_unc_applicationIdentifier);
  uint64_t v10 = sub_260A84BC0();
  uint64_t v12 = v11;

  if (qword_26A8C4998 != -1) {
    swift_once();
  }
  uint64_t v13 = *(void *)(qword_26A8D45C0 + 16);
  if (v13)
  {
    uint64_t v14 = (void *)(qword_26A8D45C0 + 40);
    while (1)
    {
      BOOL v15 = *(v14 - 1) == v10 && *v14 == v12;
      if (v15 || (sub_260A857A0() & 1) != 0) {
        break;
      }
      v14 += 2;
      if (!--v13) {
        goto LABEL_11;
      }
    }
    swift_bridgeObjectRelease();
    swift_beginAccess();
    if (swift_weakLoadStrong())
    {
      sub_260A7B360(a1);
      swift_release();
    }
  }
  else
  {
LABEL_11:
    swift_bridgeObjectRelease();
    if (qword_26B3FC7F0 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_260A84790();
    __swift_project_value_buffer(v16, (uint64_t)qword_26B402480);
    id v17 = v8;
    uint64_t v18 = sub_260A84770();
    os_log_type_t v19 = sub_260A85010();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      *(void *)&long long v33 = v31;
      *(_DWORD *)uint64_t v20 = 136315394;
      id v21 = v17;
      id v22 = objc_msgSend(v21, sel_description);
      uint64_t v23 = sub_260A84BC0();
      unint64_t v25 = v24;

      sub_2608E5414(v23, v25, (uint64_t *)&v33);
      sub_260A85240();

      swift_bridgeObjectRelease();
      *(_WORD *)(v20 + 12) = 2082;
      uint64_t v26 = swift_bridgeObjectRetain();
      uint64_t v27 = MEMORY[0x261220C40](v26, MEMORY[0x263F8D310]);
      unint64_t v29 = v28;
      swift_bridgeObjectRelease();
      sub_2608E5414(v27, v29, (uint64_t *)&v33);
      sub_260A85240();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2608DB000, v18, v19, "[%s] Missing entitlement. Must be one of verified clients: '%{public}s'", (uint8_t *)v20, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x261222810](v31, -1, -1);
      MEMORY[0x261222810](v20, -1, -1);
    }
    else
    {
    }
    long long v33 = xmmword_260A98750;
    LOBYTE(v34) = -126;
    sub_260A7B30C();
    sub_260A84960();
  }
  *(void *)(a2 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  return result;
}

uint64_t sub_260A7A038()
{
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ToolServiceListener()
{
  return self;
}

uint64_t sub_260A7A09C()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_260A7A0D4()
{
  return sub_260A79B9C();
}

uint64_t sub_260A7A0DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 88) = a5;
  int v6 = (void *)swift_task_alloc();
  *(void *)(v5 + 96) = v6;
  void *v6 = v5;
  v6[1] = sub_260A7A170;
  return sub_260A7A4CC();
}

uint64_t sub_260A7A170(uint64_t a1, uint64_t a2)
{
  int v4 = (void *)*v3;
  v4[13] = a1;
  v4[14] = a2;
  v4[15] = v2;
  swift_task_dealloc();
  if (v2) {
    uint64_t v5 = sub_260A7A3DC;
  }
  else {
    uint64_t v5 = sub_260A7A288;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_260A7A288()
{
  if (qword_26B3FC7F0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_260A84790();
  __swift_project_value_buffer(v1, (uint64_t)qword_26B402480);
  uint64_t v2 = sub_260A84770();
  os_log_type_t v3 = sub_260A85010();
  if (os_log_type_enabled(v2, v3))
  {
    int v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_2608DB000, v2, v3, "KTH_DEBUG: got response", v4, 2u);
    MEMORY[0x261222810](v4, -1, -1);
  }
  uint64_t v6 = *(void *)(v0 + 104);
  uint64_t v5 = *(void *)(v0 + 112);

  *(void *)(v0 + 40) = v6;
  *(void *)(v0 + 48) = v5;
  *(unsigned char *)(v0 + 56) = 0;
  sub_260A7B30C();
  sub_260A84960();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_260A7A3DC()
{
  uint64_t v1 = *(void **)(v0 + 120);
  *(void *)(v0 + 64) = 0;
  *(void *)(v0 + 72) = 0xE000000000000000;
  *(void *)(v0 + 80) = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3FC9C0);
  sub_260A855A0();
  uint64_t v2 = *(void *)(v0 + 72);
  *(void *)(v0 + 16) = *(void *)(v0 + 64);
  *(void *)(v0 + 24) = v2;
  *(unsigned char *)(v0 + 32) = 0x80;
  sub_260A7B30C();
  sub_260A84960();

  swift_bridgeObjectRelease();
  os_log_type_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_260A7A4CC()
{
  *(void *)(v1 + 88) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3FDEE0);
  *(void *)(v1 + 96) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_260A7A560, 0, 0);
}

uint64_t sub_260A7A560()
{
  sub_26095D244(*(long long **)(v0 + 88), v0 + 16);
  switch(*(unsigned char *)(v0 + 64))
  {
    case 1:
      uint64_t v9 = *(void *)(v0 + 16);
      uint64_t v8 = *(void *)(v0 + 24);
      uint64_t v10 = *(void *)(v0 + 32);
      uint64_t v11 = *(void *)(v0 + 40);
      id v22 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_26A8C6890 + dword_26A8C6890);
      uint64_t v12 = (void *)swift_task_alloc();
      *(void *)(v0 + 152) = v12;
      *uint64_t v12 = v0;
      v12[1] = sub_260A7AC2C;
      uint64_t result = v22(v9, v8, v10, v11);
      break;
    case 2:
      *(unsigned char *)(v0 + 65) = *(unsigned char *)(v0 + 16);
      uint64_t v2 = *(void *)(v0 + 24);
      uint64_t v1 = *(void *)(v0 + 32);
      uint64_t v3 = *(void *)(v0 + 40);
      uint64_t v4 = *(void *)(v0 + 48);
      uint64_t v6 = (void *)swift_task_alloc();
      *(void *)(v0 + 160) = v6;
      void *v6 = v0;
      uint64_t v7 = sub_260A7AD68;
      goto LABEL_7;
    case 3:
      if (qword_26B3F7C90 != -1) {
        swift_once();
      }
      uint64_t v14 = *(void *)(v0 + 96);
      uint64_t v15 = sub_260A84E60();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
      uint64_t v16 = swift_allocObject();
      *(void *)(v16 + 16) = 0;
      *(void *)(v16 + 24) = 0;
      uint64_t v17 = sub_26096D69C(v14, (uint64_t)&unk_26A8C7810, v16);
      *(void *)(v0 + 192) = v17;
      uint64_t v18 = (void *)swift_task_alloc();
      *(void *)(v0 + 200) = v18;
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3FC9C0);
      *uint64_t v18 = v0;
      v18[1] = sub_260A7B100;
      uint64_t v20 = MEMORY[0x263F8D310];
      uint64_t v21 = MEMORY[0x263F8E4E0];
      uint64_t result = MEMORY[0x270FA1FA8](v0 + 72, v17, v20, v19, v21);
      break;
    default:
      uint64_t v2 = *(void *)(v0 + 16);
      uint64_t v1 = *(void *)(v0 + 24);
      uint64_t v3 = *(void *)(v0 + 32);
      uint64_t v4 = *(void *)(v0 + 40);
      uint64_t v5 = *(void *)(v0 + 56);
      *(void *)(v0 + 104) = *(void *)(v0 + 48);
      *(void *)(v0 + 112) = v5;
      uint64_t v6 = (void *)swift_task_alloc();
      *(void *)(v0 + 120) = v6;
      void *v6 = v0;
      uint64_t v7 = sub_260A7A894;
LABEL_7:
      v6[1] = v7;
      uint64_t result = sub_260A0F5B4(v2, v1, v3, v4);
      break;
  }
  return result;
}

uint64_t sub_260A7A894(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  uint64_t v5 = *(void **)v2;
  *(void *)(*(void *)v2 + 128) = a1;
  swift_task_dealloc();
  if (v1)
  {
    swift_task_dealloc();
    uint64_t v6 = (uint64_t (*)(void))v5[1];
    return v6();
  }
  else
  {
    uint64_t v8 = v4[14];
    uint64_t v9 = (void *)swift_task_alloc();
    v4[17] = v9;
    *uint64_t v9 = v5;
    v9[1] = sub_260A7AA28;
    uint64_t v10 = v4[13];
    return sub_260A0FD00(a1, v10, v8, 2, 0);
  }
}

uint64_t sub_260A7AA28()
{
  *(void *)(*(void *)v1 + 144) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_260A7ABC0;
  }
  else {
    uint64_t v2 = sub_260A7AB3C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_260A7AB3C()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(unint64_t, unint64_t))(v0 + 8);
  return v1(0xD00000000000001DLL, 0x8000000260AA52A0);
}

uint64_t sub_260A7ABC0()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_260A7AC2C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  swift_task_dealloc();
  uint64_t v7 = swift_task_dealloc();
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
  if (!v2)
  {
    uint64_t v7 = a1;
    uint64_t v8 = a2;
  }
  return v9(v7, v8);
}

uint64_t sub_260A7AD68(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  *(void *)(*v2 + 168) = a1;
  swift_task_dealloc();
  if (v1)
  {
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    uint64_t v8 = *(unsigned __int8 *)(v4 + 65);
    uint64_t v9 = (void *)swift_task_alloc();
    *(void *)(v4 + 176) = v9;
    *uint64_t v9 = v5;
    v9[1] = sub_260A7AEFC;
    return sub_260A0FD00(a1, 0, 0, v8, 0);
  }
}

uint64_t sub_260A7AEFC()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_260A7B094;
  }
  else {
    uint64_t v2 = sub_260A7B010;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_260A7B010()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(unint64_t, unint64_t))(v0 + 8);
  return v1(0xD000000000000020, 0x8000000260AA5270);
}

uint64_t sub_260A7B094()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_260A7B100()
{
  *(void *)(*(void *)v1 + 208) = v0;
  swift_task_dealloc();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_260A7B2A0;
  }
  else {
    uint64_t v2 = sub_260A7B230;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_260A7B230()
{
  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v3(v2, v1);
}

uint64_t sub_260A7B2A0()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

double sub_260A7B304@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_260A79C68(a1, a2);
}

unint64_t sub_260A7B30C()
{
  unint64_t result = qword_26A8C77E8;
  if (!qword_26A8C77E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C77E8);
  }
  return result;
}

uint64_t sub_260A7B360(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3FDEE0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260A7B7A8();
  sub_260A84970();
  sub_26095D244(v21, (uint64_t)&v22);
  if (qword_26B3FC7F0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_260A84790();
  __swift_project_value_buffer(v5, (uint64_t)qword_26B402480);
  sub_260A7B7FC((uint64_t)&v22, (void (*)(void, void, void, void, void, void, void))sub_260959C28);
  sub_260A7B7FC((uint64_t)&v22, (void (*)(void, void, void, void, void, void, void))sub_260959C28);
  uint64_t v6 = sub_260A84770();
  os_log_type_t v7 = sub_260A85010();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(void *)&v21[0] = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    v20[1] = v8 + 4;
    sub_260A7B7FC((uint64_t)&v22, (void (*)(void, void, void, void, void, void, void))sub_260959C28);
    uint64_t v10 = sub_260A695E8();
    unint64_t v12 = v11;
    sub_260A7B7FC((uint64_t)&v22, (void (*)(void, void, void, void, void, void, void))sub_260959CC4);
    void v20[2] = sub_2608E5414(v10, v12, (uint64_t *)v21);
    sub_260A85240();
    swift_bridgeObjectRelease();
    sub_260A7B7FC((uint64_t)&v22, (void (*)(void, void, void, void, void, void, void))sub_260959CC4);
    sub_260A7B7FC((uint64_t)&v22, (void (*)(void, void, void, void, void, void, void))sub_260959CC4);
    _os_log_impl(&dword_2608DB000, v6, v7, "KTH_DEBUG: request: '%s'", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261222810](v9, -1, -1);
    MEMORY[0x261222810](v8, -1, -1);
  }
  else
  {
    sub_260A7B7FC((uint64_t)&v22, (void (*)(void, void, void, void, void, void, void))sub_260959CC4);
    sub_260A7B7FC((uint64_t)&v22, (void (*)(void, void, void, void, void, void, void))sub_260959CC4);
  }

  uint64_t v13 = sub_260A84E60();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v4, 1, 1, v13);
  uint64_t v14 = sub_260A84980();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(void *)(v15 + 64);
  MEMORY[0x270FA5388](v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))((char *)v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v14);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 81) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = 0;
  *(void *)(v18 + 24) = 0;
  sub_26095D244(&v22, v18 + 32);
  (*(void (**)(unint64_t, char *, uint64_t))(v15 + 32))(v18 + v17, (char *)v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v14);
  sub_260A11348((uint64_t)v4, (uint64_t)&unk_26A8C7800, v18);
  return swift_release();
}

unint64_t sub_260A7B7A8()
{
  unint64_t result = qword_26A8C77F0;
  if (!qword_26A8C77F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A8C77F0);
  }
  return result;
}

uint64_t sub_260A7B7FC(uint64_t a1, void (*a2)(void, void, void, void, void, void, void))
{
  return a1;
}

uint64_t sub_260A7B840()
{
  uint64_t v1 = sub_260A84980();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 81) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  sub_260959CC4(*(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72), *(unsigned char *)(v0 + 80));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_260A7B920()
{
  uint64_t v2 = *(void *)(sub_260A84980() - 8);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 81) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_2609385CC;
  v4[11] = v3;
  uint64_t v5 = (void *)swift_task_alloc();
  v4[12] = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_260A7A170;
  return sub_260A7A4CC();
}

uint64_t sub_260A7BA40()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_260A7BA78(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_2609385CC;
  return sub_2609CDB6C(a1);
}

uint64_t sub_260A7BB24(uint64_t a1)
{
  uint64_t v13 = *(void *)(v1 + 16);
  uint64_t v14 = a1;
  sub_26093FF24(a1, (uint64_t)v17);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v1;
  sub_260947504(v17, v2 + 24);
  aBlock[4] = sub_260A7C714;
  aBlock[5] = v2;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2608EB0BC;
  aBlock[3] = &block_descriptor_29;
  uint64_t v3 = _Block_copy(aBlock);
  uint64_t v4 = sub_260A84A10();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_260A849E0();
  uint64_t v8 = sub_260A849B0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x263F8EE78];
  sub_2608E316C((unint64_t *)&qword_26B3FDEF0, MEMORY[0x270FCD9E8]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3FDF00);
  sub_2608E328C((unint64_t *)&qword_26B3FE030, (uint64_t *)&unk_26B3FDF00);
  sub_260A85300();
  MEMORY[0x261220FB0](0, v7, v11, v3);
  _Block_release(v3);
  __swift_destroy_boxed_opaque_existential_1(v14);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return swift_release();
}

void *sub_260A7BDD4()
{
  type metadata accessor for NotificationSettingsManager();
  uint64_t v0 = swift_allocObject();
  unint64_t result = sub_260A7C478();
  qword_26A8D46A0 = v0;
  return result;
}

uint64_t sub_260A7BE10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = a1 + 24;
  swift_beginAccess();
  return sub_26093FF24(v3, a2);
}

uint64_t sub_260A7BE6C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = (uint64_t *)(a1 + 24);
  swift_beginAccess();
  __swift_assign_boxed_opaque_existential_1(v3, a2);
  return swift_endAccess();
}

void sub_260A7BEC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = a1 + 24;
  swift_beginAccess();
  sub_26093FF24(v6, (uint64_t)v16);
  uint64_t v7 = v17;
  uint64_t v8 = v18;
  __swift_project_boxed_opaque_existential_1(v16, v17);
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 8))(a2, a3, v7, v8);
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    swift_bridgeObjectRetain();
    id v11 = objc_msgSend(v10, sel_sourceSettings);
    unint64_t v12 = (uint64_t *)(a1 + 64);
    swift_beginAccess();
    if (v11)
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v15 = *v12;
      *unint64_t v12 = 0x8000000000000000;
      sub_260A559C4((uint64_t)v11, a2, a3, isUniquelyReferenced_nonNull_native);
      *unint64_t v12 = v15;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v14 = (void *)sub_260A2AF54(a2, a3);
      swift_bridgeObjectRelease();
    }
    swift_endAccess();
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  }
}

id sub_260A7C034@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, void *a3@<X8>)
{
  id result = sub_260A7C078(a1, a2);
  *a3 = result;
  return result;
}

id sub_260A7C078(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = (uint64_t *)(v2 + 64);
  swift_beginAccess();
  uint64_t v7 = *(void *)(v2 + 64);
  if (*(void *)(v7 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v8 = sub_2609797D4(a1, a2);
    if (v9)
    {
      id v10 = *(id *)(*(void *)(v7 + 56) + 8 * v8);
      swift_endAccess();
      id v11 = v10;
      swift_bridgeObjectRelease();
      return v10;
    }
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  swift_beginAccess();
  sub_26093FF24(v3 + 24, (uint64_t)v21);
  uint64_t v12 = v22;
  uint64_t v13 = v23;
  __swift_project_boxed_opaque_existential_1(v21, v22);
  uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 8))(a1, a2, v12, v13);
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    swift_bridgeObjectRetain();
    id v16 = objc_msgSend(v15, sel_sourceSettings);
    swift_beginAccess();
    if (v16)
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v20 = *v6;
      uint64_t *v6 = 0x8000000000000000;
      sub_260A559C4((uint64_t)v16, a1, a2, isUniquelyReferenced_nonNull_native);
      uint64_t *v6 = v20;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v18 = (void *)sub_260A2AF54(a1, a2);
      swift_bridgeObjectRelease();
    }
    swift_endAccess();
    id v10 = objc_msgSend(v15, sel_sourceSettings);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    return 0;
  }
  return v10;
}

id sub_260A7C27C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void **)(a1 + 72);
  uint64_t v4 = v3;
  if (!v3)
  {
    uint64_t v6 = a1 + 24;
    swift_beginAccess();
    sub_26093FF24(v6, (uint64_t)v12);
    uint64_t v7 = v13;
    uint64_t v8 = v14;
    __swift_project_boxed_opaque_existential_1(v12, v13);
    uint64_t v4 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 16))(v7, v8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    if (v4)
    {
      char v9 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v4;
      id v10 = v4;
    }
  }
  *a2 = v4;
  return v3;
}

uint64_t sub_260A7C350@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  swift_beginAccess();
  uint64_t v8 = *(void *)(a1 + 64);
  if (*(void *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v9 = sub_2609797D4(a2, a3);
    if (v10)
    {
      id v11 = *(void **)(*(void *)(v8 + 56) + 8 * v9);
      id v12 = v11;
    }
    else
    {
      id v11 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    id v11 = 0;
  }
  *a4 = v11;
  return swift_endAccess();
}

uint64_t sub_260A7C404()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for NotificationSettingsManager()
{
  return self;
}

void *sub_260A7C478()
{
  uint64_t v1 = v0;
  sub_260943364();
  uint64_t v2 = sub_260A84A10();
  MEMORY[0x270FA5388](v2 - 8);
  sub_260A849E0();
  uint64_t v3 = sub_260A85070();
  MEMORY[0x270FA5388](v3);
  uint64_t v4 = MEMORY[0x263F8EE78];
  v11[1] = MEMORY[0x263F8EE78];
  sub_2608E316C((unint64_t *)&qword_26B3FDF30, MEMORY[0x270FCDB90]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3FDF20);
  sub_2608E328C((unint64_t *)&qword_26B3FE040, (uint64_t *)&unk_26B3FDF20);
  sub_260A85300();
  uint64_t v5 = sub_260A850C0();
  MEMORY[0x270FA5388](v5);
  (*(void (**)(char *, void))(v7 + 104))((char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x263F8F128]);
  v0[2] = sub_260A85100();
  uint64_t v8 = type metadata accessor for NotificationGroupServiceSettingsDefaultProvider();
  uint64_t v9 = swift_allocObject();
  v1[6] = v8;
  v1[7] = &off_270CB3310;
  v1[3] = v9;
  v1[8] = sub_2609614F8(v4);
  v1[9] = 0;
  return v1;
}

uint64_t sub_260A7C6D4()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_260A7C714()
{
  return sub_260A7BE6C(*(void *)(v0 + 16), (uint64_t *)(v0 + 24));
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
        id result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        id v11 = *(uint64_t (**)(void))(v10 + 24);
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
          *id result = *a2;
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

uint64_t sub_260A7C950(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3FDEE0);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = &v29[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = *(os_unfair_lock_s **)((char *)v5
                             + OBJC_IVAR____TtC21UserNotificationsCore24NotificationPipelineStep_completionLock);
  uint64_t v30 = a3;
  uint64_t v31 = a4;
  uint64_t v14 = (uint64_t *)&v13[4];
  uint64_t v15 = v13 + 8;
  os_unfair_lock_lock(v13 + 8);
  sub_260A7F8A4(v14);
  os_unfair_lock_unlock(v15);
  uint64_t v32 = 0;
  unint64_t v33 = 0xE000000000000000;
  sub_260A85470();
  swift_bridgeObjectRelease();
  uint64_t v32 = 0x676E697472617453;
  unint64_t v33 = 0xEF27207065747320;
  sub_260A7EE58();
  sub_260A84C90();
  swift_bridgeObjectRelease();
  sub_260A84C90();
  sub_26096A430(v32, v33);
  swift_bridgeObjectRelease();
  uint64_t v16 = v5[5];
  uint64_t v17 = v5[6];
  __swift_project_boxed_opaque_existential_1(v5 + 2, v16);
  uint64_t v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 16))(v16, v17);
  if ((v19 & 1) == 0)
  {
    uint64_t v20 = MEMORY[0x270FA5388](v18);
    *(void *)&v29[-32] = v5;
    *(void *)&v29[-24] = v21;
    uint64_t v23 = (id *)&v22[4];
    unint64_t v24 = v22 + 6;
    *(void *)&v29[-16] = v20;
    *(void *)&v29[-8] = v25;
    os_unfair_lock_lock(v22 + 6);
    sub_260A7FA10(v23);
    os_unfair_lock_unlock(v24);
  }
  uint64_t v26 = sub_260A84E60();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v12, 1, 1, v26);
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = 0;
  *(void *)(v27 + 24) = 0;
  *(void *)(v27 + 32) = v5;
  *(unsigned char *)(v27 + 40) = a1;
  *(void *)(v27 + 48) = a2;
  swift_retain();
  swift_retain();
  *(void *)((char *)v5 + OBJC_IVAR____TtC21UserNotificationsCore24NotificationPipelineStep_work) = sub_26096D68C((uint64_t)v12, (uint64_t)&unk_26A8C7820, v27);
  return swift_release();
}

uint64_t sub_260A7CC00(long long *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = OBJC_IVAR____TtC21UserNotificationsCore24NotificationPipelineStep_timerLock;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3FD130);
  uint64_t v10 = swift_allocObject();
  *(_DWORD *)(v10 + 24) = 0;
  *(void *)(v10 + 16) = 0;
  *(void *)(v4 + v9) = v10;
  uint64_t v11 = OBJC_IVAR____TtC21UserNotificationsCore24NotificationPipelineStep_completionLock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3FD128);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = 0;
  *(void *)(v12 + 24) = 0;
  *(void *)(v4 + v11) = v12;
  *(_DWORD *)(v12 + 32) = 0;
  *(void *)(v4 + OBJC_IVAR____TtC21UserNotificationsCore24NotificationPipelineStep_work) = 0;
  sub_260947504(a1, v4 + 16);
  *(void *)(v4 + 56) = a2;
  uint64_t v13 = v4 + OBJC_IVAR____TtC21UserNotificationsCore24NotificationPipelineStep_notification;
  uint64_t v14 = sub_260A84400();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v13, a3, v14);
  sub_260A7FB44(a4, v4 + OBJC_IVAR____TtC21UserNotificationsCore24NotificationPipelineStep_logger);
  return v4;
}

uint64_t sub_260A7CD10()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC21UserNotificationsCore24NotificationPipelineStep_timerLock);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 24));
  sub_260A7F5E4((id *)(v2 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 24));
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v3 = v0 + OBJC_IVAR____TtC21UserNotificationsCore24NotificationPipelineStep_notification;
  uint64_t v4 = sub_260A84400();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_260A7F844(v1 + OBJC_IVAR____TtC21UserNotificationsCore24NotificationPipelineStep_logger, (uint64_t (*)(void))type metadata accessor for NotificationPipelineRequestLogger);
  swift_release();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_260A7CE18()
{
  sub_260A7CD10();

  return swift_deallocClassInstance();
}

uint64_t sub_260A7CE70()
{
  return type metadata accessor for NotificationPipelineStep(0);
}

uint64_t type metadata accessor for NotificationPipelineStep(uint64_t a1)
{
  return sub_26093D404(a1, qword_26B3FCF68);
}

uint64_t sub_260A7CE98()
{
  uint64_t result = sub_260A84400();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for NotificationPipelineRequestLogger();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

void *destroy for NotificationPipelineStep.CompletionData(void *result)
{
  if (*result) {
    return (void *)swift_release();
  }
  return result;
}

void *_s21UserNotificationsCore24NotificationPipelineStepC14CompletionDataVwCP_0(void *a1, void *a2)
{
  if (*a2)
  {
    uint64_t v3 = a2[1];
    *a1 = *a2;
    a1[1] = v3;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  return a1;
}

void *assignWithCopy for NotificationPipelineStep.CompletionData(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (!*a1)
  {
    if (v4)
    {
      uint64_t v6 = a2[1];
      *a1 = v4;
      a1[1] = v6;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v5 = a2[1];
  *a1 = v4;
  a1[1] = v5;
  swift_retain();
  swift_release();
  return a1;
}

void *assignWithTake for NotificationPipelineStep.CompletionData(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (!*a1)
  {
    if (v4)
    {
      uint64_t v6 = a2[1];
      *a1 = v4;
      a1[1] = v6;
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v5 = a2[1];
  *a1 = v4;
  a1[1] = v5;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for NotificationPipelineStep.CompletionData(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for NotificationPipelineStep.CompletionData(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
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
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NotificationPipelineStep.CompletionData()
{
  return &type metadata for NotificationPipelineStep.CompletionData;
}

void **initializeBufferWithCopyOfBuffer for NotificationPipelineStep.TimerData(void **a1, void **a2)
{
  uint64_t v3 = *a2;
  *a1 = *a2;
  id v4 = v3;
  return a1;
}

void **assignWithCopy for NotificationPipelineStep.TimerData(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  id v4 = *a2;
  *a1 = *a2;
  id v5 = v4;

  return a1;
}

void **assignWithTake for NotificationPipelineStep.TimerData(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  *a1 = *a2;

  return a1;
}

ValueMetadata *type metadata accessor for NotificationPipelineStep.TimerData()
{
  return &type metadata for NotificationPipelineStep.TimerData;
}

_OWORD *sub_260A7D238(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) == 0)
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      long long v15 = *(_OWORD *)((char *)a2 + 24);
      *(_OWORD *)((char *)a1 + 24) = v15;
      (**(void (***)(_OWORD *, _OWORD *))(v15 - 8))(a1, a2);
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C5230);
      uint64_t v17 = *(int *)(v16 + 48);
      uint64_t v18 = (char *)a1 + v17;
      char v19 = (char *)a2 + v17;
      uint64_t v20 = sub_260A844C0();
      uint64_t v21 = *(void *)(v20 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
      {
        uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3F81B8);
        memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
      }
      uint64_t v36 = *(int *)(v16 + 64);
      uint64_t v32 = (char *)a1 + v36;
      unint64_t v33 = (char *)a2 + v36;
      uint64_t v34 = sub_260A844D0();
      uint64_t v35 = *(void *)(v34 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34)) {
        goto LABEL_16;
      }
    }
    else if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C61E0);
      uint64_t v8 = *(int *)(v7 + 48);
      uint64_t v9 = (char *)a1 + v8;
      uint64_t v10 = (char *)a2 + v8;
      uint64_t v11 = sub_260A844C0();
      uint64_t v12 = *(void *)(v11 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
      {
        uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3F81B8);
        memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
      }
      uint64_t v31 = *(int *)(v7 + 64);
      uint64_t v32 = (char *)a1 + v31;
      unint64_t v33 = (char *)a2 + v31;
      uint64_t v34 = sub_260A844D0();
      uint64_t v35 = *(void *)(v34 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34))
      {
LABEL_16:
        uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3F81C8);
        memcpy(v32, v33, *(void *)(*(void *)(v37 - 8) + 64));
LABEL_22:
        swift_storeEnumTagMultiPayload();
        return a1;
      }
    }
    else
    {
      long long v23 = *(_OWORD *)((char *)a2 + 24);
      *(_OWORD *)((char *)a1 + 24) = v23;
      (**(void (***)(_OWORD *, _OWORD *))(v23 - 8))(a1, a2);
      uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C5230);
      uint64_t v25 = *(int *)(v24 + 48);
      uint64_t v26 = (char *)a1 + v25;
      uint64_t v27 = (char *)a2 + v25;
      uint64_t v28 = sub_260A844C0();
      uint64_t v29 = *(void *)(v28 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28))
      {
        uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3F81B8);
        memcpy(v26, v27, *(void *)(*(void *)(v30 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v26, v27, v28);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
      }
      uint64_t v38 = *(int *)(v24 + 64);
      uint64_t v32 = (char *)a1 + v38;
      unint64_t v33 = (char *)a2 + v38;
      uint64_t v34 = sub_260A844D0();
      uint64_t v35 = *(void *)(v34 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34)) {
        goto LABEL_16;
      }
    }
    (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v32, v33, v34);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
    goto LABEL_22;
  }
  uint64_t v14 = *(void *)a2;
  *(void *)a1 = *(void *)a2;
  a1 = (_OWORD *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
  swift_retain();
  return a1;
}

uint64_t sub_260A7D914(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result != 2)
  {
    if (result == 1)
    {
      uint64_t v3 = &qword_26A8C61E0;
      goto LABEL_6;
    }
    if (result) {
      return result;
    }
  }
  __swift_destroy_boxed_opaque_existential_1(a1);
  uint64_t v3 = &qword_26A8C5230;
LABEL_6:
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(v3);
  uint64_t v5 = a1 + *(int *)(v4 + 48);
  uint64_t v6 = sub_260A844C0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  uint64_t v8 = a1 + *(int *)(v4 + 64);
  uint64_t v9 = sub_260A844D0();
  uint64_t v11 = *(void *)(v9 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v8, 1, v9);
  if (!result)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);
    return v10(v8, v9);
  }
  return result;
}

_OWORD *sub_260A7DABC(_OWORD *a1, _OWORD *a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *a1 = *a2;
    uint64_t v4 = &qword_26A8C61E0;
  }
  else
  {
    long long v5 = *(_OWORD *)((char *)a2 + 24);
    *(_OWORD *)((char *)a1 + 24) = v5;
    (**(void (***)(_OWORD *, _OWORD *))(v5 - 8))(a1, a2);
    uint64_t v4 = &qword_26A8C5230;
  }
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(v4);
  uint64_t v7 = *(int *)(v6 + 48);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_260A844C0();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3F81B8);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v13 = *(int *)(v6 + 64);
  uint64_t v14 = (char *)a1 + v13;
  long long v15 = (char *)a2 + v13;
  uint64_t v16 = sub_260A844D0();
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3F81C8);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v14, v15, v16);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_260A7DD5C(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_260A7F844(a1, type metadata accessor for StepFailure);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
      uint64_t v4 = &qword_26A8C61E0;
    }
    else
    {
      uint64_t v5 = *(void *)(a2 + 24);
      *(void *)(a1 + 24) = v5;
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1, a2);
      uint64_t v4 = &qword_26A8C5230;
    }
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(v4);
    uint64_t v7 = *(int *)(v6 + 48);
    uint64_t v8 = (void *)(a1 + v7);
    uint64_t v9 = (const void *)(a2 + v7);
    uint64_t v10 = sub_260A844C0();
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3F81B8);
      memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    uint64_t v13 = *(int *)(v6 + 64);
    uint64_t v14 = (void *)(a1 + v13);
    long long v15 = (const void *)(a2 + v13);
    uint64_t v16 = sub_260A844D0();
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
    {
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3F81C8);
      memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v17 + 16))(v14, v15, v16);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t type metadata accessor for StepFailure(uint64_t a1)
{
  return sub_26093D404(a1, (uint64_t *)&unk_26B3F81A8);
}

uint64_t sub_260A7E044(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    uint64_t v4 = &qword_26A8C61E0;
  }
  else
  {
    long long v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    uint64_t v4 = &qword_26A8C5230;
  }
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(v4);
  uint64_t v7 = *(int *)(v6 + 48);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_260A844C0();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3F81B8);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v13 = *(int *)(v6 + 64);
  uint64_t v14 = (void *)(a1 + v13);
  long long v15 = (const void *)(a2 + v13);
  uint64_t v16 = sub_260A844D0();
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3F81C8);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 32))(v14, v15, v16);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_260A7E2B8(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_260A7F844(a1, type metadata accessor for StepFailure);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
      uint64_t v4 = &qword_26A8C61E0;
    }
    else
    {
      long long v5 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v5;
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      uint64_t v4 = &qword_26A8C5230;
    }
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(v4);
    uint64_t v7 = *(int *)(v6 + 48);
    uint64_t v8 = (void *)(a1 + v7);
    uint64_t v9 = (const void *)(a2 + v7);
    uint64_t v10 = sub_260A844C0();
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3F81B8);
      memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    uint64_t v13 = *(int *)(v6 + 64);
    uint64_t v14 = (void *)(a1 + v13);
    long long v15 = (const void *)(a2 + v13);
    uint64_t v16 = sub_260A844D0();
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
    {
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3F81C8);
      memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v17 + 32))(v14, v15, v16);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void sub_260A7E550()
{
  sub_260A7E6B8(319, &qword_26B3F81C0, MEMORY[0x263F844E0]);
  if (v0 <= 0x3F)
  {
    sub_260A7E6B8(319, &qword_26B3F81D0, MEMORY[0x263F84518]);
    if (v1 <= 0x3F)
    {
      swift_getTupleTypeLayout3();
      long long v5 = &v4;
      swift_getTupleTypeLayout3();
      uint64_t v6 = &v3;
      swift_getTupleTypeLayout3();
      uint64_t v7 = &v2;
      swift_initEnumMetadataMultiPayload();
    }
  }
}

void sub_260A7E6B8(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_260A85230();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_260A7E70C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  *(unsigned char *)(v6 + 80) = a5;
  *(void *)(v6 + 40) = a4;
  *(void *)(v6 + 48) = a6;
  *(void *)(v6 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3FD188);
  *(void *)(v6 + 64) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_260A7E7A8, 0, 0);
}

uint64_t sub_260A7E7A8()
{
  unint64_t v1 = *(void **)(v0 + 40);
  uint64_t v2 = v1[5];
  uint64_t v3 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v2);
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 24)
                                                                                    + **(int **)(v3 + 24));
  unint64_t v4 = (char *)v1 + OBJC_IVAR____TtC21UserNotificationsCore24NotificationPipelineStep_notification;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_260A7E8D4;
  uint64_t v6 = *(void *)(v0 + 64);
  uint64_t v7 = *(void *)(v0 + 48);
  uint64_t v8 = *(unsigned __int8 *)(v0 + 80);
  return v10(v6, v8, v4, v7, v2, v3);
}

uint64_t sub_260A7E8D4()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_260A7E9D0, 0, 0);
}

uint64_t sub_260A7E9D0()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0[5] + OBJC_IVAR____TtC21UserNotificationsCore24NotificationPipelineStep_timerLock);
  uint64_t v2 = (id *)&v1[4];
  uint64_t v3 = v1 + 6;
  os_unfair_lock_lock(v1 + 6);
  sub_260A7F5E4(v2);
  os_unfair_lock_unlock(v3);
  sub_260A84F30();
  sub_260A7EBDC(v0[8]);
  sub_260A7FAAC(v0[8]);
  swift_task_dealloc();
  unint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_260A7EBDC(uint64_t a1)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + OBJC_IVAR____TtC21UserNotificationsCore24NotificationPipelineStep_completionLock);
  unint64_t v4 = (long long *)&v3[4];
  uint64_t v5 = v3 + 8;
  os_unfair_lock_lock(v3 + 8);
  sub_260A7F630(v4, &v8);
  os_unfair_lock_unlock(v5);
  uint64_t v6 = v8;
  if (v8)
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0xE000000000000000;
    swift_retain();
    sub_260A85470();
    sub_260A84C90();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3FD188);
    sub_260A855A0();
    sub_260A84C90();
    sub_260A85490();
    sub_260A84C90();
    swift_bridgeObjectRelease();
    sub_260A84C90();
    sub_26096A430((uint64_t)v8, v9);
    swift_bridgeObjectRelease();
    ((void (*)(uint64_t))v6)(a1);
    sub_2609477D4((uint64_t)v6);
    return sub_2609477D4((uint64_t)v6);
  }
  else
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0xE000000000000000;
    sub_260A85470();
    sub_260A84C90();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3FD188);
    sub_260A855A0();
    sub_260A84C90();
    sub_260A85490();
    sub_260A84C90();
    swift_bridgeObjectRelease();
    sub_26096A430((uint64_t)v8, v9);
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_260A7EE58()
{
  v2[0] = 0;
  v2[1] = 0xE000000000000000;
  sub_260A85470();
  swift_bridgeObjectRelease();
  uint64_t v3 = 0x203A70657453;
  unint64_t v4 = 0xE600000000000000;
  sub_26093FF24(v0 + 16, (uint64_t)v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3FD0D8);
  sub_260A84C20();
  sub_260A84C90();
  swift_bridgeObjectRelease();
  sub_260A84C90();
  v2[0] = *(void *)(v0 + 56);
  sub_260A85730();
  sub_260A84C90();
  swift_bridgeObjectRelease();
  return v3;
}

void sub_260A7EF48(id *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v24 = a1;
  uint64_t v8 = sub_260A840C0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t aBlock = 0;
  unint64_t v26 = 0xE000000000000000;
  sub_260A85470();
  swift_bridgeObjectRelease();
  unint64_t aBlock = 0xD000000000000029;
  unint64_t v26 = 0x8000000260AA5420;
  uint64_t v31 = *(void *)(a2 + 56);
  sub_260A85730();
  sub_260A84C90();
  swift_bridgeObjectRelease();
  sub_260A84C90();
  sub_260A84320();
  sub_260A840B0();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_260A84C90();
  swift_bridgeObjectRelease();
  id v12 = objc_allocWithZone(MEMORY[0x263F7C4A8]);
  uint64_t v13 = (void *)sub_260A84BB0();
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v12, sel_initWithIdentifier_, v13);

  double v15 = (double)sub_260A85940();
  sub_260A85940();
  double v17 = (double)v16 / 1.0e18 + v15;
  sub_260943364();
  uint64_t v18 = (void *)sub_260A850D0();
  uint64_t v19 = swift_allocObject();
  swift_weakInit();
  uint64_t v20 = (void *)swift_allocObject();
  void v20[2] = v19;
  v20[3] = a4;
  void v20[4] = a5;
  uint64_t v29 = sub_260A7FAA0;
  uint64_t v30 = v20;
  unint64_t aBlock = MEMORY[0x263EF8330];
  unint64_t v26 = 1107296256;
  uint64_t v27 = sub_2608DFB8C;
  uint64_t v28 = &block_descriptor_30;
  uint64_t v21 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v14, sel_scheduleWithFireInterval_leewayInterval_queue_handler_, v18, v21, v17, 0.5);
  _Block_release(v21);

  uint64_t v22 = v24;
  *uint64_t v22 = v14;
}

uint64_t sub_260A7F25C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3FD188);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (uint64_t *)((char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v10 = result;
    uint64_t v11 = *(os_unfair_lock_s **)(result + OBJC_IVAR____TtC21UserNotificationsCore24NotificationPipelineStep_timerLock);
    id v12 = (id *)&v11[4];
    uint64_t v13 = v11 + 6;
    os_unfair_lock_lock(v11 + 6);
    sub_260A7F5E4(v12);
    os_unfair_lock_unlock(v13);
    uint64_t v23 = 0;
    unint64_t v24 = 0xE000000000000000;
    sub_260A85470();
    sub_260A84C90();
    sub_260A85940();
    sub_260A85940();
    sub_260A84F80();
    sub_260A84C90();
    sub_26096A430(v23, v24);
    swift_bridgeObjectRelease();
    if (*(void *)(v10 + OBJC_IVAR____TtC21UserNotificationsCore24NotificationPipelineStep_work))
    {
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3FC9C0);
      sub_260A84F00();
      swift_release();
    }
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C61E0);
    double v15 = (char *)v8 + *(int *)(v14 + 48);
    uint64_t v16 = (char *)v8 + *(int *)(v14 + 64);
    *uint64_t v8 = a3;
    v8[1] = a4;
    uint64_t v17 = *MEMORY[0x263F844C8];
    uint64_t v18 = sub_260A844C0();
    uint64_t v19 = *(void *)(v18 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v19 + 104))(v15, v17, v18);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v15, 0, 1, v18);
    uint64_t v20 = *MEMORY[0x263F84500];
    uint64_t v21 = sub_260A844D0();
    uint64_t v22 = *(void *)(v21 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v22 + 104))(v16, v20, v21);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v16, 0, 1, v21);
    type metadata accessor for StepFailure(0);
    swift_storeEnumTagMultiPayload();
    swift_storeEnumTagMultiPayload();
    sub_260A7EBDC((uint64_t)v8);
    swift_release();
    return sub_260A7FAAC((uint64_t)v8);
  }
  return result;
}

void sub_260A7F5E4(id *a1)
{
  id v2 = *a1;
  objc_msgSend(*a1, sel_invalidate);

  *a1 = 0;
}

uint64_t sub_260A7F630@<X0>(long long *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  long long v3 = *a1;
  uint64_t v4 = *(void *)a1;
  *(void *)a1 = 0;
  *((void *)a1 + 1) = 0;
  if (v4)
  {
    long long v7 = v3;
    uint64_t result = swift_allocObject();
    *(_OWORD *)(result + 16) = v7;
    uint64_t v6 = sub_2609BD0F0;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t result = 0;
  }
  *a2 = v6;
  a2[1] = (uint64_t (*)())result;
  return result;
}

uint64_t sub_260A7F6B0()
{
  return sub_260A7EE58();
}

uint64_t sub_260A7F6D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StepFailure(0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260A7F7E0(a1, (uint64_t)v6);
  uint64_t v7 = sub_260A84C20();
  uint64_t v9 = v8;
  sub_260A7F7E0(a2, (uint64_t)v6);
  if (v7 == sub_260A84C20() && v9 == v10) {
    char v12 = 1;
  }
  else {
    char v12 = sub_260A857A0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12 & 1;
}

uint64_t sub_260A7F7E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StepFailure(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_260A7F844(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_260A7F8A4(uint64_t *a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v5 = *a1;
  swift_retain();
  uint64_t result = sub_2609477D4(v5);
  *a1 = v4;
  a1[1] = v3;
  return result;
}

uint64_t sub_260A7F8FC()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_260A7F944(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 48);
  char v8 = *(unsigned char *)(v1 + 40);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_2609385CC;
  return sub_260A7E70C(a1, v4, v5, v6, v8, v7);
}

void sub_260A7FA10(id *a1)
{
  sub_260A7EF48(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_260A7FA30()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_260A7FA68()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_260A7FAA0(uint64_t a1)
{
  return sub_260A7F25C(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_260A7FAAC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3FD188);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_260A7FB0C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_260A7FB44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NotificationPipelineRequestLogger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t initializeBufferWithCopyOfBuffer for NotificationInference(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 12) = *(void *)(a2 + 12);
  id v4 = v3;
  return a1;
}

uint64_t assignWithCopy for NotificationInference(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy20_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u32[0] = a2[1].n128_u32[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for NotificationInference(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 12) = *(void *)(a2 + 12);
  return a1;
}

uint64_t getEnumTagSinglePayload for NotificationInference(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 20)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for NotificationInference(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_DWORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 20) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 20) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NotificationInference()
{
  return &type metadata for NotificationInference;
}

uint64_t sub_260A7FD64(void *a1, uint64_t a2, int a3)
{
  int v4 = HIDWORD(a2);
  sub_260A85470();
  sub_260A84C90();
  if (a1)
  {
    objc_msgSend(a1, sel_length);
    sub_260A85730();
  }
  sub_260A84C90();
  swift_bridgeObjectRelease();
  sub_260A84C90();
  sub_260A84C90();
  swift_bridgeObjectRelease();
  sub_260A84C90();
  sub_260A7FF40(v4);
  sub_260A84C90();
  swift_bridgeObjectRelease();
  sub_260A84C90();
  sub_260A7FF40(a3);
  sub_260A84C90();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_260A7FF40(int a1)
{
  uint64_t result = 0x6E776F6E6B6E75;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 0x6564656563637573;
      break;
    case 2:
      uint64_t result = 0x64656C696166;
      break;
    case 3:
      uint64_t result = 0x656C74746F726874;
      break;
    case 4:
      uint64_t result = 0x626967696C656E69;
      break;
    case 5:
      uint64_t result = 0x4465727574616566;
      break;
    default:
      sub_260A85470();
      swift_bridgeObjectRelease();
      sub_260A85730();
      sub_260A84C90();
      swift_bridgeObjectRelease();
      uint64_t result = 0x656C646E61686E75;
      break;
  }
  return result;
}

BOOL sub_260A800B8(uint64_t a1, uint64_t a2)
{
  return sub_260A800F8(*(void **)a1, *(unsigned __int8 *)(a1 + 8) | ((unint64_t)*(unsigned int *)(a1 + 12) << 32), *(_DWORD *)(a1 + 16), *(void **)a2, *(unsigned __int8 *)(a2 + 8) | ((unint64_t)*(unsigned int *)(a2 + 12) << 32), *(_DWORD *)(a2 + 16));
}

uint64_t sub_260A800E4()
{
  return sub_260A7FD64(*(void **)v0, *(unsigned __int8 *)(v0 + 8) | ((unint64_t)*(unsigned int *)(v0 + 12) << 32), *(_DWORD *)(v0 + 16));
}

BOOL sub_260A800F8(void *a1, uint64_t a2, int a3, void *a4, uint64_t a5, int a6)
{
  if (!a1)
  {
    if (!a4) {
      goto LABEL_4;
    }
    return 0;
  }
  if (!a4) {
    return 0;
  }
  uint64_t v11 = a1;
  sub_260A801E4();
  id v12 = a4;
  id v13 = v11;
  LOBYTE(v11) = sub_260A85210();

  if ((v11 & 1) == 0) {
    return 0;
  }
LABEL_4:
  if (a2 == 2)
  {
    BOOL result = 0;
    if (a5 != 2) {
      return result;
    }
    goto LABEL_11;
  }
  BOOL result = 0;
  if a5 != 2 && ((((a2 & 1) == 0) ^ a5))
  {
LABEL_11:
    if (HIDWORD(a2) == HIDWORD(a5)) {
      return a3 == a6;
    }
  }
  return result;
}

unint64_t sub_260A801E4()
{
  unint64_t result = qword_26A8C7828;
  if (!qword_26A8C7828)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A8C7828);
  }
  return result;
}

uint64_t __getCRPairedVehicleManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[UNCBlueListMonitor init](v0);
}

uint64_t sub_260A83950()
{
  return MEMORY[0x270EEDB80]();
}

uint64_t sub_260A83960()
{
  return MEMORY[0x270EEDB98]();
}

uint64_t sub_260A83970()
{
  return MEMORY[0x270EEDDD8]();
}

uint64_t sub_260A83980()
{
  return MEMORY[0x270EEDE08]();
}

uint64_t sub_260A83990()
{
  return MEMORY[0x270EEDE20]();
}

uint64_t sub_260A839A0()
{
  return MEMORY[0x270EEDEF0]();
}

uint64_t sub_260A839B0()
{
  return MEMORY[0x270EEDF28]();
}

uint64_t sub_260A839C0()
{
  return MEMORY[0x270EEDF40]();
}

uint64_t sub_260A839D0()
{
  return MEMORY[0x270EEE640]();
}

uint64_t sub_260A839E0()
{
  return MEMORY[0x270EEE660]();
}

uint64_t sub_260A839F0()
{
  return MEMORY[0x270EEE668]();
}

uint64_t sub_260A83A00()
{
  return MEMORY[0x270EEEA98]();
}

uint64_t sub_260A83A10()
{
  return MEMORY[0x270EEEAC8]();
}

uint64_t sub_260A83A20()
{
  return MEMORY[0x270EEEAE0]();
}

uint64_t sub_260A83A30()
{
  return MEMORY[0x270EEEDE0]();
}

uint64_t sub_260A83A40()
{
  return MEMORY[0x270EEEE38]();
}

uint64_t sub_260A83A50()
{
  return MEMORY[0x270EEF270]();
}

uint64_t sub_260A83A60()
{
  return MEMORY[0x270EEF280]();
}

uint64_t sub_260A83A70()
{
  return MEMORY[0x270EEF2B0]();
}

uint64_t sub_260A83A80()
{
  return MEMORY[0x270EEF2C0]();
}

uint64_t sub_260A83A90()
{
  return MEMORY[0x270EEF7F8]();
}

uint64_t sub_260A83AA0()
{
  return MEMORY[0x270EEF828]();
}

uint64_t sub_260A83AB0()
{
  return MEMORY[0x270EEF838]();
}

uint64_t sub_260A83AC0()
{
  return MEMORY[0x270EEFC18]();
}

uint64_t sub_260A83AD0()
{
  return MEMORY[0x270EEFCD8]();
}

uint64_t sub_260A83AE0()
{
  return MEMORY[0x270EEFD20]();
}

uint64_t sub_260A83AF0()
{
  return MEMORY[0x270EEFE28]();
}

uint64_t sub_260A83B00()
{
  return MEMORY[0x270EEFE70]();
}

uint64_t sub_260A83B10()
{
  return MEMORY[0x270EEFF10]();
}

uint64_t sub_260A83B20()
{
  return MEMORY[0x270EEFF48]();
}

uint64_t sub_260A83B30()
{
  return MEMORY[0x270EEFF50]();
}

uint64_t sub_260A83B40()
{
  return MEMORY[0x270EEFF70]();
}

uint64_t sub_260A83B50()
{
  return MEMORY[0x270EEFFD0]();
}

uint64_t sub_260A83B60()
{
  return MEMORY[0x270EF0028]();
}

uint64_t sub_260A83B70()
{
  return MEMORY[0x270EF0128]();
}

uint64_t sub_260A83B80()
{
  return MEMORY[0x270EF0170]();
}

uint64_t sub_260A83B90()
{
  return MEMORY[0x270EF01C8]();
}

uint64_t sub_260A83BA0()
{
  return MEMORY[0x270EF0270]();
}

uint64_t sub_260A83BB0()
{
  return MEMORY[0x270EF02C0]();
}

uint64_t sub_260A83BC0()
{
  return MEMORY[0x270EF02F8]();
}

uint64_t sub_260A83BD0()
{
  return MEMORY[0x270EF0328]();
}

uint64_t sub_260A83BE0()
{
  return MEMORY[0x270EF0350]();
}

uint64_t sub_260A83BF0()
{
  return MEMORY[0x270EF0368]();
}

uint64_t sub_260A83C00()
{
  return MEMORY[0x270EF07D8]();
}

uint64_t sub_260A83C10()
{
  return MEMORY[0x270EF08A0]();
}

uint64_t sub_260A83C20()
{
  return MEMORY[0x270EF0990]();
}

uint64_t sub_260A83C30()
{
  return MEMORY[0x270EF09A0]();
}

uint64_t sub_260A83C40()
{
  return MEMORY[0x270EF09B0]();
}

uint64_t sub_260A83C50()
{
  return MEMORY[0x270EF09D0]();
}

uint64_t sub_260A83C60()
{
  return MEMORY[0x270EF09E8]();
}

uint64_t sub_260A83C70()
{
  return MEMORY[0x270EF0AE8]();
}

uint64_t sub_260A83C80()
{
  return MEMORY[0x270EF0B00]();
}

uint64_t sub_260A83C90()
{
  return MEMORY[0x270EF0BB0]();
}

uint64_t sub_260A83CA0()
{
  return MEMORY[0x270EF0BC0]();
}

uint64_t sub_260A83CB0()
{
  return MEMORY[0x270EF0BF8]();
}

uint64_t sub_260A83CC0()
{
  return MEMORY[0x270EF0C28]();
}

uint64_t sub_260A83CD0()
{
  return MEMORY[0x270EF0C38]();
}

uint64_t sub_260A83CE0()
{
  return MEMORY[0x270EF0C60]();
}

uint64_t sub_260A83CF0()
{
  return MEMORY[0x270EF0D00]();
}

uint64_t sub_260A83D00()
{
  return MEMORY[0x270EF0D10]();
}

uint64_t sub_260A83D10()
{
  return MEMORY[0x270EF1780]();
}

uint64_t sub_260A83D20()
{
  return MEMORY[0x270EF1798]();
}

uint64_t sub_260A83D30()
{
  return MEMORY[0x270FA11B8]();
}

uint64_t sub_260A83D40()
{
  return MEMORY[0x270FA1200]();
}

uint64_t sub_260A83D50()
{
  return MEMORY[0x270FA1210]();
}

uint64_t sub_260A83D60()
{
  return MEMORY[0x270FA1218]();
}

uint64_t sub_260A83D70()
{
  return MEMORY[0x270FA1230]();
}

uint64_t sub_260A83D80()
{
  return MEMORY[0x270FA1240]();
}

uint64_t sub_260A83D90()
{
  return MEMORY[0x270FA1248]();
}

uint64_t sub_260A83DA0()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_260A83DB0()
{
  return MEMORY[0x270F2F8A8]();
}

uint64_t sub_260A83DC0()
{
  return MEMORY[0x270F2F908]();
}

uint64_t sub_260A83DD0()
{
  return MEMORY[0x270F2F940]();
}

uint64_t sub_260A83DE0()
{
  return MEMORY[0x270F2F968]();
}

uint64_t sub_260A83DF0()
{
  return MEMORY[0x270F2F988]();
}

uint64_t sub_260A83E00()
{
  return MEMORY[0x270F2F9B0]();
}

uint64_t sub_260A83E10()
{
  return MEMORY[0x270F2FA80]();
}

uint64_t sub_260A83E20()
{
  return MEMORY[0x270F2FAA0]();
}

uint64_t sub_260A83E30()
{
  return MEMORY[0x270F5B478]();
}

uint64_t sub_260A83E40()
{
  return MEMORY[0x270F5B4A8]();
}

uint64_t sub_260A83E50()
{
  return MEMORY[0x270F5B4B0]();
}

uint64_t sub_260A83E60()
{
  return MEMORY[0x270F5B5D8]();
}

uint64_t sub_260A83E70()
{
  return MEMORY[0x270F5B5E0]();
}

uint64_t sub_260A83E80()
{
  return MEMORY[0x270F5B5E8]();
}

uint64_t sub_260A83E90()
{
  return MEMORY[0x270F5B5F0]();
}

uint64_t sub_260A83EA0()
{
  return MEMORY[0x270F5B608]();
}

uint64_t sub_260A83EB0()
{
  return MEMORY[0x270F5B628]();
}

uint64_t sub_260A83EC0()
{
  return MEMORY[0x270F5B630]();
}

uint64_t sub_260A83ED0()
{
  return MEMORY[0x270F5B650]();
}

uint64_t sub_260A83EE0()
{
  return MEMORY[0x270F5B660]();
}

uint64_t sub_260A83EF0()
{
  return MEMORY[0x270F5B668]();
}

uint64_t sub_260A83F00()
{
  return MEMORY[0x270F5B678]();
}

uint64_t sub_260A83F10()
{
  return MEMORY[0x270F5B6B0]();
}

uint64_t sub_260A83F20()
{
  return MEMORY[0x270F5B6B8]();
}

uint64_t sub_260A83F30()
{
  return MEMORY[0x270F5B6C8]();
}

uint64_t sub_260A83F40()
{
  return MEMORY[0x270F5B6D8]();
}

uint64_t sub_260A83F50()
{
  return MEMORY[0x270F5B740]();
}

uint64_t sub_260A83F60()
{
  return MEMORY[0x270F5B750]();
}

uint64_t sub_260A83F70()
{
  return MEMORY[0x270F5B768]();
}

uint64_t sub_260A83F80()
{
  return MEMORY[0x270F5B798]();
}

uint64_t sub_260A83F90()
{
  return MEMORY[0x270F5B7B0]();
}

uint64_t sub_260A83FA0()
{
  return MEMORY[0x270F5B7E8]();
}

uint64_t sub_260A83FB0()
{
  return MEMORY[0x270F5B878]();
}

uint64_t sub_260A83FC0()
{
  return MEMORY[0x270F5B888]();
}

uint64_t sub_260A83FD0()
{
  return MEMORY[0x270F5B8C8]();
}

uint64_t sub_260A83FE0()
{
  return MEMORY[0x270F5B8D8]();
}

uint64_t sub_260A83FF0()
{
  return MEMORY[0x270F5B998]();
}

uint64_t sub_260A84000()
{
  return MEMORY[0x270F5B9F0]();
}

uint64_t sub_260A84010()
{
  return MEMORY[0x270FA1670]();
}

uint64_t sub_260A84020()
{
  return MEMORY[0x270FA16A8]();
}

uint64_t sub_260A84030()
{
  return MEMORY[0x270FA16B0]();
}

uint64_t sub_260A84040()
{
  return MEMORY[0x270FA1748]();
}

uint64_t sub_260A84050()
{
  return MEMORY[0x270FA1778]();
}

uint64_t sub_260A84060()
{
  return MEMORY[0x270FA1840]();
}

uint64_t sub_260A84070()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_260A84080()
{
  return MEMORY[0x270FA1948]();
}

uint64_t sub_260A84090()
{
  return MEMORY[0x270F83578]();
}

uint64_t sub_260A840A0()
{
  return MEMORY[0x270F83580]();
}

uint64_t sub_260A840B0()
{
  return MEMORY[0x270F83588]();
}

uint64_t sub_260A840C0()
{
  return MEMORY[0x270F83590]();
}

uint64_t sub_260A840D0()
{
  return MEMORY[0x270F83598]();
}

uint64_t sub_260A840E0()
{
  return MEMORY[0x270F835A0]();
}

uint64_t sub_260A840F0()
{
  return MEMORY[0x270F835A8]();
}

uint64_t sub_260A84100()
{
  return MEMORY[0x270F835B0]();
}

uint64_t sub_260A84110()
{
  return MEMORY[0x270F835B8]();
}

uint64_t sub_260A84120()
{
  return MEMORY[0x270F835C0]();
}

uint64_t sub_260A84130()
{
  return MEMORY[0x270F835C8]();
}

uint64_t sub_260A84140()
{
  return MEMORY[0x270F835D0]();
}

uint64_t sub_260A84150()
{
  return MEMORY[0x270F835D8]();
}

uint64_t sub_260A84160()
{
  return MEMORY[0x270F835E0]();
}

uint64_t sub_260A84170()
{
  return MEMORY[0x270F835E8]();
}

uint64_t sub_260A84180()
{
  return MEMORY[0x270F835F0]();
}

uint64_t sub_260A84190()
{
  return MEMORY[0x270F835F8]();
}

uint64_t sub_260A841A0()
{
  return MEMORY[0x270F83600]();
}

uint64_t sub_260A841B0()
{
  return MEMORY[0x270F83608]();
}

uint64_t sub_260A841C0()
{
  return MEMORY[0x270F83610]();
}

uint64_t sub_260A841D0()
{
  return MEMORY[0x270F83618]();
}

uint64_t sub_260A841E0()
{
  return MEMORY[0x270F83620]();
}

uint64_t sub_260A841F0()
{
  return MEMORY[0x270F83628]();
}

uint64_t sub_260A84200()
{
  return MEMORY[0x270F83630]();
}

uint64_t sub_260A84210()
{
  return MEMORY[0x270F83638]();
}

uint64_t sub_260A84220()
{
  return MEMORY[0x270F83640]();
}

uint64_t sub_260A84230()
{
  return MEMORY[0x270F83648]();
}

uint64_t sub_260A84240()
{
  return MEMORY[0x270F83650]();
}

uint64_t sub_260A84250()
{
  return MEMORY[0x270F83658]();
}

uint64_t sub_260A84260()
{
  return MEMORY[0x270F83660]();
}

uint64_t sub_260A84270()
{
  return MEMORY[0x270F83668]();
}

uint64_t sub_260A84280()
{
  return MEMORY[0x270F83670]();
}

uint64_t sub_260A84290()
{
  return MEMORY[0x270F83678]();
}

uint64_t sub_260A842A0()
{
  return MEMORY[0x270F83680]();
}

uint64_t sub_260A842B0()
{
  return MEMORY[0x270F83688]();
}

uint64_t sub_260A842C0()
{
  return MEMORY[0x270F83690]();
}

uint64_t sub_260A842D0()
{
  return MEMORY[0x270F83698]();
}

uint64_t sub_260A842E0()
{
  return MEMORY[0x270F836A0]();
}

uint64_t sub_260A842F0()
{
  return MEMORY[0x270F836A8]();
}

uint64_t sub_260A84300()
{
  return MEMORY[0x270F836B8]();
}

uint64_t sub_260A84310()
{
  return MEMORY[0x270F836C8]();
}

uint64_t sub_260A84320()
{
  return MEMORY[0x270F836D0]();
}

uint64_t sub_260A84330()
{
  return MEMORY[0x270F836D8]();
}

uint64_t sub_260A84340()
{
  return MEMORY[0x270F836E0]();
}

uint64_t sub_260A84350()
{
  return MEMORY[0x270F836E8]();
}

uint64_t sub_260A84360()
{
  return MEMORY[0x270F836F0]();
}

uint64_t sub_260A84370()
{
  return MEMORY[0x270F836F8]();
}

uint64_t sub_260A84380()
{
  return MEMORY[0x270F83700]();
}

uint64_t sub_260A84390()
{
  return MEMORY[0x270F83710]();
}

uint64_t sub_260A843A0()
{
  return MEMORY[0x270F83718]();
}

uint64_t sub_260A843B0()
{
  return MEMORY[0x270F83720]();
}

uint64_t sub_260A843C0()
{
  return MEMORY[0x270F83728]();
}

uint64_t sub_260A843D0()
{
  return MEMORY[0x270F83730]();
}

uint64_t sub_260A843E0()
{
  return MEMORY[0x270F83738]();
}

uint64_t sub_260A843F0()
{
  return MEMORY[0x270F83740]();
}

uint64_t sub_260A84400()
{
  return MEMORY[0x270F83748]();
}

uint64_t sub_260A84410()
{
  return MEMORY[0x270F83750]();
}

uint64_t sub_260A84420()
{
  return MEMORY[0x270F83758]();
}

uint64_t sub_260A84430()
{
  return MEMORY[0x270F83760]();
}

uint64_t sub_260A84440()
{
  return MEMORY[0x270F83768]();
}

uint64_t sub_260A84450()
{
  return MEMORY[0x270F83770]();
}

uint64_t sub_260A84460()
{
  return MEMORY[0x270F83778]();
}

uint64_t sub_260A84470()
{
  return MEMORY[0x270F83780]();
}

uint64_t sub_260A84480()
{
  return MEMORY[0x270F83788]();
}

uint64_t sub_260A84490()
{
  return MEMORY[0x270F83790]();
}

uint64_t sub_260A844A0()
{
  return MEMORY[0x270F83798]();
}

uint64_t sub_260A844B0()
{
  return MEMORY[0x270F837A0]();
}

uint64_t sub_260A844C0()
{
  return MEMORY[0x270F837A8]();
}

uint64_t sub_260A844D0()
{
  return MEMORY[0x270F837B0]();
}

uint64_t sub_260A844E0()
{
  return MEMORY[0x270F837B8]();
}

uint64_t sub_260A844F0()
{
  return MEMORY[0x270F837C0]();
}

uint64_t sub_260A84500()
{
  return MEMORY[0x270F837C8]();
}

uint64_t sub_260A84510()
{
  return MEMORY[0x270F837D0]();
}

uint64_t sub_260A84520()
{
  return MEMORY[0x270F837D8]();
}

uint64_t sub_260A84530()
{
  return MEMORY[0x270F837E0]();
}

uint64_t sub_260A84540()
{
  return MEMORY[0x270F837E8]();
}

uint64_t sub_260A84550()
{
  return MEMORY[0x270F837F0]();
}

uint64_t sub_260A84560()
{
  return MEMORY[0x270F837F8]();
}

uint64_t sub_260A84570()
{
  return MEMORY[0x270F83800]();
}

uint64_t sub_260A84580()
{
  return MEMORY[0x270F83808]();
}

uint64_t sub_260A84590()
{
  return MEMORY[0x270F83810]();
}

uint64_t sub_260A845A0()
{
  return MEMORY[0x270F83818]();
}

uint64_t sub_260A845B0()
{
  return MEMORY[0x270F83820]();
}

uint64_t sub_260A845C0()
{
  return MEMORY[0x270F83828]();
}

uint64_t sub_260A845D0()
{
  return MEMORY[0x270F83830]();
}

uint64_t sub_260A845E0()
{
  return MEMORY[0x270F83838]();
}

uint64_t sub_260A845F0()
{
  return MEMORY[0x270F83840]();
}

uint64_t sub_260A84600()
{
  return MEMORY[0x270F83848]();
}

uint64_t sub_260A84610()
{
  return MEMORY[0x270F83850]();
}

uint64_t sub_260A84620()
{
  return MEMORY[0x270F83858]();
}

uint64_t sub_260A84630()
{
  return MEMORY[0x270F83860]();
}

uint64_t sub_260A84640()
{
  return MEMORY[0x270F83868]();
}

uint64_t sub_260A84650()
{
  return MEMORY[0x270F83870]();
}

uint64_t sub_260A84660()
{
  return MEMORY[0x270F83878]();
}

uint64_t sub_260A84680()
{
  return MEMORY[0x270F57980]();
}

uint64_t sub_260A84690()
{
  return MEMORY[0x270F57988]();
}

uint64_t sub_260A846A0()
{
  return MEMORY[0x270FA2CA8]();
}

uint64_t sub_260A846B0()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_260A846C0()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_260A846D0()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_260A846E0()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_260A846F0()
{
  return MEMORY[0x270FA2D30]();
}

uint64_t sub_260A84700()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_260A84710()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_260A84720()
{
  return MEMORY[0x270FA2D90]();
}

uint64_t sub_260A84730()
{
  return MEMORY[0x270FA2DB0]();
}

uint64_t sub_260A84740()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t sub_260A84750()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t sub_260A84760()
{
  return MEMORY[0x270FA2DF0]();
}

uint64_t sub_260A84770()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_260A84780()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_260A84790()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_260A847A0()
{
  return MEMORY[0x270FA1970]();
}

uint64_t sub_260A847B0()
{
  return MEMORY[0x270FA1A78]();
}

uint64_t sub_260A847C0()
{
  return MEMORY[0x270FA1AD8]();
}

uint64_t sub_260A847D0()
{
  return MEMORY[0x270FA1AE8]();
}

uint64_t sub_260A847E0()
{
  return MEMORY[0x270FA1AF8]();
}

uint64_t sub_260A847F0()
{
  return MEMORY[0x270FA1B08]();
}

uint64_t sub_260A84800()
{
  return MEMORY[0x270FA1B28]();
}

uint64_t sub_260A84810()
{
  return MEMORY[0x270FA1B38]();
}

uint64_t sub_260A84820()
{
  return MEMORY[0x270FA1B50]();
}

uint64_t sub_260A84830()
{
  return MEMORY[0x270FA1B60]();
}

uint64_t sub_260A84840()
{
  return MEMORY[0x270FA1B80]();
}

uint64_t sub_260A84850()
{
  return MEMORY[0x270FA1B98]();
}

uint64_t sub_260A84860()
{
  return MEMORY[0x270FA1BC0]();
}

uint64_t sub_260A84870()
{
  return MEMORY[0x270FA1BD0]();
}

uint64_t sub_260A84880()
{
  return MEMORY[0x270FA1BD8]();
}

uint64_t sub_260A84890()
{
  return MEMORY[0x270FA1BE8]();
}

uint64_t sub_260A848A0()
{
  return MEMORY[0x270FA1BF8]();
}

uint64_t sub_260A848B0()
{
  return MEMORY[0x270FA1C10]();
}

uint64_t sub_260A848C0()
{
  return MEMORY[0x270FA1C18]();
}

uint64_t sub_260A848D0()
{
  return MEMORY[0x270FA1C20]();
}

uint64_t sub_260A848E0()
{
  return MEMORY[0x270FA1C30]();
}

uint64_t sub_260A848F0()
{
  return MEMORY[0x270FA1C40]();
}

uint64_t sub_260A84900()
{
  return MEMORY[0x270FA1C48]();
}

uint64_t sub_260A84910()
{
  return MEMORY[0x270FA1C68]();
}

uint64_t sub_260A84920()
{
  return MEMORY[0x270FA1C80]();
}

uint64_t sub_260A84930()
{
  return MEMORY[0x270FA1D30]();
}

uint64_t sub_260A84940()
{
  return MEMORY[0x270FA1D48]();
}

uint64_t sub_260A84950()
{
  return MEMORY[0x270FA1D58]();
}

uint64_t sub_260A84960()
{
  return MEMORY[0x270FA1D70]();
}

uint64_t sub_260A84970()
{
  return MEMORY[0x270FA1D80]();
}

uint64_t sub_260A84980()
{
  return MEMORY[0x270FA1D90]();
}

uint64_t sub_260A84990()
{
  return MEMORY[0x270FA0960]();
}

uint64_t sub_260A849A0()
{
  return MEMORY[0x270FA0978]();
}

uint64_t sub_260A849B0()
{
  return MEMORY[0x270FA09A0]();
}

uint64_t sub_260A849C0()
{
  return MEMORY[0x270FA09C8]();
}

uint64_t sub_260A849D0()
{
  return MEMORY[0x270FA09E0]();
}

uint64_t sub_260A849E0()
{
  return MEMORY[0x270FA09F0]();
}

uint64_t sub_260A849F0()
{
  return MEMORY[0x270FA0A20]();
}

uint64_t sub_260A84A00()
{
  return MEMORY[0x270FA0A30]();
}

uint64_t sub_260A84A10()
{
  return MEMORY[0x270FA0A50]();
}

uint64_t sub_260A84A20()
{
  return MEMORY[0x270FA0AB8]();
}

uint64_t sub_260A84A30()
{
  return MEMORY[0x270FA0AC8]();
}

uint64_t sub_260A84A40()
{
  return MEMORY[0x270FA0AF8]();
}

uint64_t sub_260A84A50()
{
  return MEMORY[0x270FA0B10]();
}

uint64_t sub_260A84A60()
{
  return MEMORY[0x270FA0B18]();
}

uint64_t sub_260A84A70()
{
  return MEMORY[0x270FA0B28]();
}

uint64_t sub_260A84A80()
{
  return MEMORY[0x270FA0BA0]();
}

uint64_t sub_260A84A90()
{
  return MEMORY[0x270FA0BC0]();
}

uint64_t sub_260A84AA0()
{
  return MEMORY[0x270FA0BD8]();
}

uint64_t sub_260A84AB0()
{
  return MEMORY[0x270FA0BF8]();
}

uint64_t sub_260A84AC0()
{
  return MEMORY[0x270EEAA78]();
}

uint64_t sub_260A84AD0()
{
  return MEMORY[0x270EEAA80]();
}

uint64_t sub_260A84AE0()
{
  return MEMORY[0x270EEAA98]();
}

uint64_t sub_260A84AF0()
{
  return MEMORY[0x270EEB0D8]();
}

uint64_t sub_260A84B00()
{
  return MEMORY[0x270EEB0F0]();
}

uint64_t sub_260A84B10()
{
  return MEMORY[0x270FA1DF0]();
}

uint64_t sub_260A84B20()
{
  return MEMORY[0x270EF1810]();
}

uint64_t sub_260A84B30()
{
  return MEMORY[0x270EF1848]();
}

uint64_t sub_260A84B40()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_260A84B50()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_260A84B60()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_260A84B70()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_260A84B80()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_260A84B90()
{
  return MEMORY[0x270EF1858]();
}

uint64_t sub_260A84BA0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_260A84BB0()
{
  return MEMORY[0x270EF19A8]();
}

uint64_t sub_260A84BC0()
{
  return MEMORY[0x270EF19F0]();
}

uint64_t sub_260A84BD0()
{
  return MEMORY[0x270EF1A00]();
}

uint64_t sub_260A84BE0()
{
  return MEMORY[0x270EF1A08]();
}

uint64_t sub_260A84BF0()
{
  return MEMORY[0x270EF1A48]();
}

uint64_t sub_260A84C00()
{
  return MEMORY[0x270EF1AA0]();
}

uint64_t sub_260A84C10()
{
  return MEMORY[0x270EF1AD8]();
}

uint64_t sub_260A84C20()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_260A84C30()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_260A84C40()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_260A84C50()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_260A84C60()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_260A84C70()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_260A84C80()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_260A84C90()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_260A84CA0()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_260A84CB0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_260A84CD0()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_260A84CE0()
{
  return MEMORY[0x270F9D908]();
}

uint64_t sub_260A84CF0()
{
  return MEMORY[0x270F9DA28]();
}

uint64_t sub_260A84D00()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_260A84D10()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_260A84D20()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_260A84D30()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_260A84D40()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_260A84D50()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_260A84D60()
{
  return MEMORY[0x270EF1B90]();
}

uint64_t sub_260A84D70()
{
  return MEMORY[0x270EF1BB0]();
}

uint64_t sub_260A84D80()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_260A84D90()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_260A84DA0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_260A84DB0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_260A84DC0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_260A84DD0()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_260A84DE0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_260A84DF0()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_260A84E20()
{
  return MEMORY[0x270FA1E98]();
}

uint64_t sub_260A84E30()
{
  return MEMORY[0x270FA1EF0]();
}

uint64_t sub_260A84E40()
{
  return MEMORY[0x270FA1EF8]();
}

uint64_t sub_260A84E50()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_260A84E60()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_260A84E70()
{
  return MEMORY[0x270FA1F30]();
}

uint64_t sub_260A84E80()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_260A84E90()
{
  return MEMORY[0x270FA1F50]();
}

uint64_t sub_260A84EA0()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_260A84ED0()
{
  return MEMORY[0x270FA1F78]();
}

uint64_t sub_260A84EE0()
{
  return MEMORY[0x270FA1F90]();
}

uint64_t sub_260A84F00()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_260A84F20()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_260A84F30()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_260A84F60()
{
  return MEMORY[0x270FA2028]();
}

uint64_t sub_260A84F80()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_260A84F90()
{
  return MEMORY[0x270EF1CA0]();
}

uint64_t sub_260A84FA0()
{
  return MEMORY[0x270EF1CC8]();
}

uint64_t sub_260A84FB0()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_260A84FC0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_260A84FD0()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_260A84FE0()
{
  return MEMORY[0x270FA2BA8]();
}

uint64_t sub_260A84FF0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_260A85000()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_260A85010()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_260A85020()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_260A85030()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_260A85040()
{
  return MEMORY[0x270EF1F68]();
}

uint64_t sub_260A85050()
{
  return MEMORY[0x270EF1F78]();
}

uint64_t sub_260A85060()
{
  return MEMORY[0x270FA0C28]();
}

uint64_t sub_260A85070()
{
  return MEMORY[0x270FA0C58]();
}

uint64_t sub_260A85080()
{
  return MEMORY[0x270FA0C68]();
}

uint64_t sub_260A85090()
{
  return MEMORY[0x270FA0C80]();
}

uint64_t sub_260A850A0()
{
  return MEMORY[0x270FA0CA0]();
}

uint64_t sub_260A850B0()
{
  return MEMORY[0x270FA0CB8]();
}

uint64_t sub_260A850C0()
{
  return MEMORY[0x270FA0D48]();
}

uint64_t sub_260A850D0()
{
  return MEMORY[0x270FA0D68]();
}

uint64_t sub_260A850E0()
{
  return MEMORY[0x270FA0D80]();
}

uint64_t sub_260A850F0()
{
  return MEMORY[0x270FA0D98]();
}

uint64_t sub_260A85100()
{
  return MEMORY[0x270FA0DC0]();
}

uint64_t sub_260A85110()
{
  return MEMORY[0x270FA0DD8]();
}

uint64_t sub_260A85120()
{
  return MEMORY[0x270FA0DF0]();
}

uint64_t sub_260A85130()
{
  return MEMORY[0x270FA0E30]();
}

uint64_t sub_260A85140()
{
  return MEMORY[0x270FA0E98]();
}

uint64_t sub_260A85150()
{
  return MEMORY[0x270FA0EB8]();
}

uint64_t sub_260A85160()
{
  return MEMORY[0x270FA0ED0]();
}

uint64_t sub_260A85170()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_260A85180()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_260A85190()
{
  return MEMORY[0x270FA2EB8]();
}

uint64_t sub_260A851A0()
{
  return MEMORY[0x270FA0F18]();
}

uint64_t sub_260A851B0()
{
  return MEMORY[0x270FA0F20]();
}

uint64_t sub_260A851C0()
{
  return MEMORY[0x270FA0F60]();
}

uint64_t sub_260A851D0()
{
  return MEMORY[0x270EF2178]();
}

uint64_t sub_260A851E0()
{
  return MEMORY[0x270EF2188]();
}

uint64_t sub_260A851F0()
{
  return MEMORY[0x270EF2190]();
}

uint64_t sub_260A85200()
{
  return MEMORY[0x270FA1178]();
}

uint64_t sub_260A85210()
{
  return MEMORY[0x270FA1188]();
}

uint64_t sub_260A85220()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t sub_260A85230()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_260A85240()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_260A85250()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_260A85260()
{
  return MEMORY[0x270FA13A0]();
}

uint64_t sub_260A85270()
{
  return MEMORY[0x270EF25D8]();
}

uint64_t sub_260A85280()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_260A85290()
{
  return MEMORY[0x270F9E730]();
}

uint64_t sub_260A852A0()
{
  return MEMORY[0x270F9E740]();
}

uint64_t sub_260A852B0()
{
  return MEMORY[0x270F9E778]();
}

uint64_t sub_260A852C0()
{
  return MEMORY[0x270F9E790]();
}

uint64_t sub_260A852D0()
{
  return MEMORY[0x270F9E798]();
}

uint64_t sub_260A852F0()
{
  return MEMORY[0x270F9E7E0]();
}

uint64_t sub_260A85300()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_260A85310()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_260A85320()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_260A85330()
{
  return MEMORY[0x270F9E810]();
}

uint64_t sub_260A85340()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_260A85350()
{
  return MEMORY[0x270F9E830]();
}

uint64_t sub_260A85360()
{
  return MEMORY[0x270F9E838]();
}

uint64_t sub_260A85370()
{
  return MEMORY[0x270F9E840]();
}

uint64_t sub_260A85380()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_260A85390()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_260A853A0()
{
  return MEMORY[0x270F9E860]();
}

uint64_t sub_260A853B0()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_260A853C0()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_260A853D0()
{
  return MEMORY[0x270F9E880]();
}

uint64_t sub_260A853E0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_260A853F0()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_260A85400()
{
  return MEMORY[0x270F9E8D8]();
}

uint64_t sub_260A85410()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_260A85420()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_260A85430()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_260A85440()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_260A85450()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_260A85460()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_260A85470()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_260A85480()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_260A85490()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t sub_260A854A0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_260A854B0()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_260A854C0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_260A854D0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_260A854E0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_260A854F0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_260A85500()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_260A85510()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_260A85520()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_260A85530()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_260A85540()
{
  return MEMORY[0x270FA2188]();
}

uint64_t sub_260A85550()
{
  return MEMORY[0x270FA2190]();
}

uint64_t sub_260A85560()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_260A85570()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_260A85580()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_260A85590()
{
  return MEMORY[0x270F9ED40]();
}

uint64_t sub_260A855A0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_260A855B0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_260A855C0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_260A855D0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_260A855E0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_260A855F0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_260A85600()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_260A85610()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_260A85620()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_260A85630()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_260A85640()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_260A85650()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_260A85660()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_260A85670()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_260A85680()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_260A85690()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_260A856A0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_260A856B0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_260A856C0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_260A856D0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_260A856E0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_260A856F0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_260A85700()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_260A85710()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_260A85720()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_260A85730()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_260A85750()
{
  return MEMORY[0x270F9F560]();
}

uint64_t sub_260A85760()
{
  return MEMORY[0x270F9F578]();
}

uint64_t sub_260A85770()
{
  return MEMORY[0x270F9F638]();
}

uint64_t sub_260A85780()
{
  return MEMORY[0x270F9F658]();
}

uint64_t sub_260A85790()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_260A857A0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_260A857B0()
{
  return MEMORY[0x270F9F818]();
}

uint64_t sub_260A857C0()
{
  return MEMORY[0x270F9F8A8]();
}

uint64_t sub_260A857E0()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_260A857F0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_260A85800()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_260A85810()
{
  return MEMORY[0x270EF2688]();
}

uint64_t sub_260A85820()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_260A85830()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_260A85840()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_260A85850()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_260A85860()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_260A85870()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_260A85880()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_260A85890()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_260A858A0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_260A858B0()
{
  return MEMORY[0x270F9FCA8]();
}

uint64_t sub_260A858C0()
{
  return MEMORY[0x270F9FCD0]();
}

uint64_t sub_260A858D0()
{
  return MEMORY[0x270F9FCD8]();
}

uint64_t sub_260A858E0()
{
  return MEMORY[0x270F9FD58]();
}

uint64_t sub_260A858F0()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t sub_260A85900()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_260A85910()
{
  return MEMORY[0x270F9FD80]();
}

uint64_t sub_260A85920()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t sub_260A85930()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_260A85940()
{
  return MEMORY[0x270F9FF68]();
}

uint64_t sub_260A85950()
{
  return MEMORY[0x270F9FF78]();
}

uint64_t sub_260A85980()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

uint64_t BSAbsoluteMachTimeNow()
{
  return MEMORY[0x270F106C8]();
}

uint64_t BSEqualDictionaries()
{
  return MEMORY[0x270F107A8]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x270F107B8]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x270F107C8]();
}

uint64_t BSStringFromBOOL()
{
  return MEMORY[0x270F10960]();
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7AF8](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7B00](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B08](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4280]();
  return result;
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

uint64_t IDSCopyIDForAccount()
{
  return MEMORY[0x270F3C968]();
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x270F3C978]();
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x270EF4838](AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, TimeoutAction, AssertionID, Timeout);
}

IOReturn IOPMAssertionCreateWithProperties(CFDictionaryRef AssertionProperties, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x270EF4848](AssertionProperties, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x270EF4868](*(void *)&AssertionID);
}

CFTimeInterval IOPSGetTimeRemainingEstimate(void)
{
  MEMORY[0x270EF4968]();
  return result;
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  return MEMORY[0x270F4AE00]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x270F4AE20]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t NSStringFromTLAlertType()
{
  return MEMORY[0x270F7F8D0]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C50]();
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x270F55148]();
}

uint64_t UNCCatchMe()
{
  return MEMORY[0x270F06400]();
}

uint64_t UNCCatchMeHighlights()
{
  return MEMORY[0x270F06408]();
}

uint64_t UNCDaemonEnabled()
{
  return MEMORY[0x270F06410]();
}

uint64_t UNCOneness()
{
  return MEMORY[0x270F06418]();
}

uint64_t UNCRemoteServicesNeeded()
{
  return MEMORY[0x270F06420]();
}

uint64_t UNCUsePipeline()
{
  return MEMORY[0x270F06430]();
}

uint64_t UNEqualBools()
{
  return MEMORY[0x270F06438]();
}

uint64_t UNEqualDoubles()
{
  return MEMORY[0x270F06440]();
}

uint64_t UNEqualIntegers()
{
  return MEMORY[0x270F06448]();
}

uint64_t UNEqualObjects()
{
  return MEMORY[0x270F06450]();
}

uint64_t UNEqualStrings()
{
  return MEMORY[0x270F06458]();
}

uint64_t UNFloatIsZero()
{
  return MEMORY[0x270F06460]();
}

uint64_t UNIsInternalInstall()
{
  return MEMORY[0x270F06478]();
}

uint64_t UNLogToDeveloper()
{
  return MEMORY[0x270F06480]();
}

uint64_t UNNotificationSettingString()
{
  return MEMORY[0x270F06498]();
}

uint64_t UNRegisterUserNotificationsLogging()
{
  return MEMORY[0x270F064A0]();
}

uint64_t UNSafeCast()
{
  return MEMORY[0x270F064A8]();
}

uint64_t UNSafeCastAny()
{
  return MEMORY[0x270F064B0]();
}

uint64_t UNSimilarArrays()
{
  return MEMORY[0x270F064C0]();
}

uint64_t UNSimilarSets()
{
  return MEMORY[0x270F064C8]();
}

uint64_t UNSimilarStrings()
{
  return MEMORY[0x270F064D0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
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

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

{
  return MEMORY[0x270F9A3B8]();
}

{
  return MEMORY[0x270F9A3D0]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9338]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void exit(int a1)
{
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  return MEMORY[0x270ED98D8](*(void *)&from_fd, *(void *)&to_fd, a3, *(void *)&flags);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
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

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

int mkstemp_dprotected_np(char *path, int dpclass, int dpflags)
{
  return MEMORY[0x270EDA568](path, *(void *)&dpclass, *(void *)&dpflags);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x270EDA750](*(void *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

uint64_t os_eligibility_get_domain_answer()
{
  return MEMORY[0x270EDA920]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x270EDAA78]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x270EDAA80]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
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

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB640](__dst, __src, __n);
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x270FA0248]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x270FA0418]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_job_run()
{
  return MEMORY[0x270FA2440]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
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

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x270FA05D8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x270FA05E0]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x270FA0600]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x270FA0608]();
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x270EDBDE8](xBOOL);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x270EDBF50]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC1F8](object);
}